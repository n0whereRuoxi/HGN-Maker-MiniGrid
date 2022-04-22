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
      ?auto_906824 - BLOCK
    )
    :vars
    (
      ?auto_906825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906824 ?auto_906825 ) ( CLEAR ?auto_906824 ) ( HAND-EMPTY ) ( not ( = ?auto_906824 ?auto_906825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_906824 ?auto_906825 )
      ( !PUTDOWN ?auto_906824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_906831 - BLOCK
      ?auto_906832 - BLOCK
    )
    :vars
    (
      ?auto_906833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_906831 ) ( ON ?auto_906832 ?auto_906833 ) ( CLEAR ?auto_906832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_906831 ) ( not ( = ?auto_906831 ?auto_906832 ) ) ( not ( = ?auto_906831 ?auto_906833 ) ) ( not ( = ?auto_906832 ?auto_906833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_906832 ?auto_906833 )
      ( !STACK ?auto_906832 ?auto_906831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_906841 - BLOCK
      ?auto_906842 - BLOCK
    )
    :vars
    (
      ?auto_906843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906842 ?auto_906843 ) ( not ( = ?auto_906841 ?auto_906842 ) ) ( not ( = ?auto_906841 ?auto_906843 ) ) ( not ( = ?auto_906842 ?auto_906843 ) ) ( ON ?auto_906841 ?auto_906842 ) ( CLEAR ?auto_906841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_906841 )
      ( MAKE-2PILE ?auto_906841 ?auto_906842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_906852 - BLOCK
      ?auto_906853 - BLOCK
      ?auto_906854 - BLOCK
    )
    :vars
    (
      ?auto_906855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_906853 ) ( ON ?auto_906854 ?auto_906855 ) ( CLEAR ?auto_906854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_906852 ) ( ON ?auto_906853 ?auto_906852 ) ( not ( = ?auto_906852 ?auto_906853 ) ) ( not ( = ?auto_906852 ?auto_906854 ) ) ( not ( = ?auto_906852 ?auto_906855 ) ) ( not ( = ?auto_906853 ?auto_906854 ) ) ( not ( = ?auto_906853 ?auto_906855 ) ) ( not ( = ?auto_906854 ?auto_906855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_906854 ?auto_906855 )
      ( !STACK ?auto_906854 ?auto_906853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_906866 - BLOCK
      ?auto_906867 - BLOCK
      ?auto_906868 - BLOCK
    )
    :vars
    (
      ?auto_906869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906868 ?auto_906869 ) ( ON-TABLE ?auto_906866 ) ( not ( = ?auto_906866 ?auto_906867 ) ) ( not ( = ?auto_906866 ?auto_906868 ) ) ( not ( = ?auto_906866 ?auto_906869 ) ) ( not ( = ?auto_906867 ?auto_906868 ) ) ( not ( = ?auto_906867 ?auto_906869 ) ) ( not ( = ?auto_906868 ?auto_906869 ) ) ( CLEAR ?auto_906866 ) ( ON ?auto_906867 ?auto_906868 ) ( CLEAR ?auto_906867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_906866 ?auto_906867 )
      ( MAKE-3PILE ?auto_906866 ?auto_906867 ?auto_906868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_906880 - BLOCK
      ?auto_906881 - BLOCK
      ?auto_906882 - BLOCK
    )
    :vars
    (
      ?auto_906883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906882 ?auto_906883 ) ( not ( = ?auto_906880 ?auto_906881 ) ) ( not ( = ?auto_906880 ?auto_906882 ) ) ( not ( = ?auto_906880 ?auto_906883 ) ) ( not ( = ?auto_906881 ?auto_906882 ) ) ( not ( = ?auto_906881 ?auto_906883 ) ) ( not ( = ?auto_906882 ?auto_906883 ) ) ( ON ?auto_906881 ?auto_906882 ) ( ON ?auto_906880 ?auto_906881 ) ( CLEAR ?auto_906880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_906880 )
      ( MAKE-3PILE ?auto_906880 ?auto_906881 ?auto_906882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_906895 - BLOCK
      ?auto_906896 - BLOCK
      ?auto_906897 - BLOCK
      ?auto_906898 - BLOCK
    )
    :vars
    (
      ?auto_906899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_906897 ) ( ON ?auto_906898 ?auto_906899 ) ( CLEAR ?auto_906898 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_906895 ) ( ON ?auto_906896 ?auto_906895 ) ( ON ?auto_906897 ?auto_906896 ) ( not ( = ?auto_906895 ?auto_906896 ) ) ( not ( = ?auto_906895 ?auto_906897 ) ) ( not ( = ?auto_906895 ?auto_906898 ) ) ( not ( = ?auto_906895 ?auto_906899 ) ) ( not ( = ?auto_906896 ?auto_906897 ) ) ( not ( = ?auto_906896 ?auto_906898 ) ) ( not ( = ?auto_906896 ?auto_906899 ) ) ( not ( = ?auto_906897 ?auto_906898 ) ) ( not ( = ?auto_906897 ?auto_906899 ) ) ( not ( = ?auto_906898 ?auto_906899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_906898 ?auto_906899 )
      ( !STACK ?auto_906898 ?auto_906897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_906913 - BLOCK
      ?auto_906914 - BLOCK
      ?auto_906915 - BLOCK
      ?auto_906916 - BLOCK
    )
    :vars
    (
      ?auto_906917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906916 ?auto_906917 ) ( ON-TABLE ?auto_906913 ) ( ON ?auto_906914 ?auto_906913 ) ( not ( = ?auto_906913 ?auto_906914 ) ) ( not ( = ?auto_906913 ?auto_906915 ) ) ( not ( = ?auto_906913 ?auto_906916 ) ) ( not ( = ?auto_906913 ?auto_906917 ) ) ( not ( = ?auto_906914 ?auto_906915 ) ) ( not ( = ?auto_906914 ?auto_906916 ) ) ( not ( = ?auto_906914 ?auto_906917 ) ) ( not ( = ?auto_906915 ?auto_906916 ) ) ( not ( = ?auto_906915 ?auto_906917 ) ) ( not ( = ?auto_906916 ?auto_906917 ) ) ( CLEAR ?auto_906914 ) ( ON ?auto_906915 ?auto_906916 ) ( CLEAR ?auto_906915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_906913 ?auto_906914 ?auto_906915 )
      ( MAKE-4PILE ?auto_906913 ?auto_906914 ?auto_906915 ?auto_906916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_906931 - BLOCK
      ?auto_906932 - BLOCK
      ?auto_906933 - BLOCK
      ?auto_906934 - BLOCK
    )
    :vars
    (
      ?auto_906935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906934 ?auto_906935 ) ( ON-TABLE ?auto_906931 ) ( not ( = ?auto_906931 ?auto_906932 ) ) ( not ( = ?auto_906931 ?auto_906933 ) ) ( not ( = ?auto_906931 ?auto_906934 ) ) ( not ( = ?auto_906931 ?auto_906935 ) ) ( not ( = ?auto_906932 ?auto_906933 ) ) ( not ( = ?auto_906932 ?auto_906934 ) ) ( not ( = ?auto_906932 ?auto_906935 ) ) ( not ( = ?auto_906933 ?auto_906934 ) ) ( not ( = ?auto_906933 ?auto_906935 ) ) ( not ( = ?auto_906934 ?auto_906935 ) ) ( ON ?auto_906933 ?auto_906934 ) ( CLEAR ?auto_906931 ) ( ON ?auto_906932 ?auto_906933 ) ( CLEAR ?auto_906932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_906931 ?auto_906932 )
      ( MAKE-4PILE ?auto_906931 ?auto_906932 ?auto_906933 ?auto_906934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_906949 - BLOCK
      ?auto_906950 - BLOCK
      ?auto_906951 - BLOCK
      ?auto_906952 - BLOCK
    )
    :vars
    (
      ?auto_906953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906952 ?auto_906953 ) ( not ( = ?auto_906949 ?auto_906950 ) ) ( not ( = ?auto_906949 ?auto_906951 ) ) ( not ( = ?auto_906949 ?auto_906952 ) ) ( not ( = ?auto_906949 ?auto_906953 ) ) ( not ( = ?auto_906950 ?auto_906951 ) ) ( not ( = ?auto_906950 ?auto_906952 ) ) ( not ( = ?auto_906950 ?auto_906953 ) ) ( not ( = ?auto_906951 ?auto_906952 ) ) ( not ( = ?auto_906951 ?auto_906953 ) ) ( not ( = ?auto_906952 ?auto_906953 ) ) ( ON ?auto_906951 ?auto_906952 ) ( ON ?auto_906950 ?auto_906951 ) ( ON ?auto_906949 ?auto_906950 ) ( CLEAR ?auto_906949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_906949 )
      ( MAKE-4PILE ?auto_906949 ?auto_906950 ?auto_906951 ?auto_906952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_906968 - BLOCK
      ?auto_906969 - BLOCK
      ?auto_906970 - BLOCK
      ?auto_906971 - BLOCK
      ?auto_906972 - BLOCK
    )
    :vars
    (
      ?auto_906973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_906971 ) ( ON ?auto_906972 ?auto_906973 ) ( CLEAR ?auto_906972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_906968 ) ( ON ?auto_906969 ?auto_906968 ) ( ON ?auto_906970 ?auto_906969 ) ( ON ?auto_906971 ?auto_906970 ) ( not ( = ?auto_906968 ?auto_906969 ) ) ( not ( = ?auto_906968 ?auto_906970 ) ) ( not ( = ?auto_906968 ?auto_906971 ) ) ( not ( = ?auto_906968 ?auto_906972 ) ) ( not ( = ?auto_906968 ?auto_906973 ) ) ( not ( = ?auto_906969 ?auto_906970 ) ) ( not ( = ?auto_906969 ?auto_906971 ) ) ( not ( = ?auto_906969 ?auto_906972 ) ) ( not ( = ?auto_906969 ?auto_906973 ) ) ( not ( = ?auto_906970 ?auto_906971 ) ) ( not ( = ?auto_906970 ?auto_906972 ) ) ( not ( = ?auto_906970 ?auto_906973 ) ) ( not ( = ?auto_906971 ?auto_906972 ) ) ( not ( = ?auto_906971 ?auto_906973 ) ) ( not ( = ?auto_906972 ?auto_906973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_906972 ?auto_906973 )
      ( !STACK ?auto_906972 ?auto_906971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_906990 - BLOCK
      ?auto_906991 - BLOCK
      ?auto_906992 - BLOCK
      ?auto_906993 - BLOCK
      ?auto_906994 - BLOCK
    )
    :vars
    (
      ?auto_906995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906994 ?auto_906995 ) ( ON-TABLE ?auto_906990 ) ( ON ?auto_906991 ?auto_906990 ) ( ON ?auto_906992 ?auto_906991 ) ( not ( = ?auto_906990 ?auto_906991 ) ) ( not ( = ?auto_906990 ?auto_906992 ) ) ( not ( = ?auto_906990 ?auto_906993 ) ) ( not ( = ?auto_906990 ?auto_906994 ) ) ( not ( = ?auto_906990 ?auto_906995 ) ) ( not ( = ?auto_906991 ?auto_906992 ) ) ( not ( = ?auto_906991 ?auto_906993 ) ) ( not ( = ?auto_906991 ?auto_906994 ) ) ( not ( = ?auto_906991 ?auto_906995 ) ) ( not ( = ?auto_906992 ?auto_906993 ) ) ( not ( = ?auto_906992 ?auto_906994 ) ) ( not ( = ?auto_906992 ?auto_906995 ) ) ( not ( = ?auto_906993 ?auto_906994 ) ) ( not ( = ?auto_906993 ?auto_906995 ) ) ( not ( = ?auto_906994 ?auto_906995 ) ) ( CLEAR ?auto_906992 ) ( ON ?auto_906993 ?auto_906994 ) ( CLEAR ?auto_906993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_906990 ?auto_906991 ?auto_906992 ?auto_906993 )
      ( MAKE-5PILE ?auto_906990 ?auto_906991 ?auto_906992 ?auto_906993 ?auto_906994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_907012 - BLOCK
      ?auto_907013 - BLOCK
      ?auto_907014 - BLOCK
      ?auto_907015 - BLOCK
      ?auto_907016 - BLOCK
    )
    :vars
    (
      ?auto_907017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907016 ?auto_907017 ) ( ON-TABLE ?auto_907012 ) ( ON ?auto_907013 ?auto_907012 ) ( not ( = ?auto_907012 ?auto_907013 ) ) ( not ( = ?auto_907012 ?auto_907014 ) ) ( not ( = ?auto_907012 ?auto_907015 ) ) ( not ( = ?auto_907012 ?auto_907016 ) ) ( not ( = ?auto_907012 ?auto_907017 ) ) ( not ( = ?auto_907013 ?auto_907014 ) ) ( not ( = ?auto_907013 ?auto_907015 ) ) ( not ( = ?auto_907013 ?auto_907016 ) ) ( not ( = ?auto_907013 ?auto_907017 ) ) ( not ( = ?auto_907014 ?auto_907015 ) ) ( not ( = ?auto_907014 ?auto_907016 ) ) ( not ( = ?auto_907014 ?auto_907017 ) ) ( not ( = ?auto_907015 ?auto_907016 ) ) ( not ( = ?auto_907015 ?auto_907017 ) ) ( not ( = ?auto_907016 ?auto_907017 ) ) ( ON ?auto_907015 ?auto_907016 ) ( CLEAR ?auto_907013 ) ( ON ?auto_907014 ?auto_907015 ) ( CLEAR ?auto_907014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_907012 ?auto_907013 ?auto_907014 )
      ( MAKE-5PILE ?auto_907012 ?auto_907013 ?auto_907014 ?auto_907015 ?auto_907016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_907034 - BLOCK
      ?auto_907035 - BLOCK
      ?auto_907036 - BLOCK
      ?auto_907037 - BLOCK
      ?auto_907038 - BLOCK
    )
    :vars
    (
      ?auto_907039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907038 ?auto_907039 ) ( ON-TABLE ?auto_907034 ) ( not ( = ?auto_907034 ?auto_907035 ) ) ( not ( = ?auto_907034 ?auto_907036 ) ) ( not ( = ?auto_907034 ?auto_907037 ) ) ( not ( = ?auto_907034 ?auto_907038 ) ) ( not ( = ?auto_907034 ?auto_907039 ) ) ( not ( = ?auto_907035 ?auto_907036 ) ) ( not ( = ?auto_907035 ?auto_907037 ) ) ( not ( = ?auto_907035 ?auto_907038 ) ) ( not ( = ?auto_907035 ?auto_907039 ) ) ( not ( = ?auto_907036 ?auto_907037 ) ) ( not ( = ?auto_907036 ?auto_907038 ) ) ( not ( = ?auto_907036 ?auto_907039 ) ) ( not ( = ?auto_907037 ?auto_907038 ) ) ( not ( = ?auto_907037 ?auto_907039 ) ) ( not ( = ?auto_907038 ?auto_907039 ) ) ( ON ?auto_907037 ?auto_907038 ) ( ON ?auto_907036 ?auto_907037 ) ( CLEAR ?auto_907034 ) ( ON ?auto_907035 ?auto_907036 ) ( CLEAR ?auto_907035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_907034 ?auto_907035 )
      ( MAKE-5PILE ?auto_907034 ?auto_907035 ?auto_907036 ?auto_907037 ?auto_907038 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_907056 - BLOCK
      ?auto_907057 - BLOCK
      ?auto_907058 - BLOCK
      ?auto_907059 - BLOCK
      ?auto_907060 - BLOCK
    )
    :vars
    (
      ?auto_907061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907060 ?auto_907061 ) ( not ( = ?auto_907056 ?auto_907057 ) ) ( not ( = ?auto_907056 ?auto_907058 ) ) ( not ( = ?auto_907056 ?auto_907059 ) ) ( not ( = ?auto_907056 ?auto_907060 ) ) ( not ( = ?auto_907056 ?auto_907061 ) ) ( not ( = ?auto_907057 ?auto_907058 ) ) ( not ( = ?auto_907057 ?auto_907059 ) ) ( not ( = ?auto_907057 ?auto_907060 ) ) ( not ( = ?auto_907057 ?auto_907061 ) ) ( not ( = ?auto_907058 ?auto_907059 ) ) ( not ( = ?auto_907058 ?auto_907060 ) ) ( not ( = ?auto_907058 ?auto_907061 ) ) ( not ( = ?auto_907059 ?auto_907060 ) ) ( not ( = ?auto_907059 ?auto_907061 ) ) ( not ( = ?auto_907060 ?auto_907061 ) ) ( ON ?auto_907059 ?auto_907060 ) ( ON ?auto_907058 ?auto_907059 ) ( ON ?auto_907057 ?auto_907058 ) ( ON ?auto_907056 ?auto_907057 ) ( CLEAR ?auto_907056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_907056 )
      ( MAKE-5PILE ?auto_907056 ?auto_907057 ?auto_907058 ?auto_907059 ?auto_907060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907079 - BLOCK
      ?auto_907080 - BLOCK
      ?auto_907081 - BLOCK
      ?auto_907082 - BLOCK
      ?auto_907083 - BLOCK
      ?auto_907084 - BLOCK
    )
    :vars
    (
      ?auto_907085 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_907083 ) ( ON ?auto_907084 ?auto_907085 ) ( CLEAR ?auto_907084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_907079 ) ( ON ?auto_907080 ?auto_907079 ) ( ON ?auto_907081 ?auto_907080 ) ( ON ?auto_907082 ?auto_907081 ) ( ON ?auto_907083 ?auto_907082 ) ( not ( = ?auto_907079 ?auto_907080 ) ) ( not ( = ?auto_907079 ?auto_907081 ) ) ( not ( = ?auto_907079 ?auto_907082 ) ) ( not ( = ?auto_907079 ?auto_907083 ) ) ( not ( = ?auto_907079 ?auto_907084 ) ) ( not ( = ?auto_907079 ?auto_907085 ) ) ( not ( = ?auto_907080 ?auto_907081 ) ) ( not ( = ?auto_907080 ?auto_907082 ) ) ( not ( = ?auto_907080 ?auto_907083 ) ) ( not ( = ?auto_907080 ?auto_907084 ) ) ( not ( = ?auto_907080 ?auto_907085 ) ) ( not ( = ?auto_907081 ?auto_907082 ) ) ( not ( = ?auto_907081 ?auto_907083 ) ) ( not ( = ?auto_907081 ?auto_907084 ) ) ( not ( = ?auto_907081 ?auto_907085 ) ) ( not ( = ?auto_907082 ?auto_907083 ) ) ( not ( = ?auto_907082 ?auto_907084 ) ) ( not ( = ?auto_907082 ?auto_907085 ) ) ( not ( = ?auto_907083 ?auto_907084 ) ) ( not ( = ?auto_907083 ?auto_907085 ) ) ( not ( = ?auto_907084 ?auto_907085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_907084 ?auto_907085 )
      ( !STACK ?auto_907084 ?auto_907083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907105 - BLOCK
      ?auto_907106 - BLOCK
      ?auto_907107 - BLOCK
      ?auto_907108 - BLOCK
      ?auto_907109 - BLOCK
      ?auto_907110 - BLOCK
    )
    :vars
    (
      ?auto_907111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907110 ?auto_907111 ) ( ON-TABLE ?auto_907105 ) ( ON ?auto_907106 ?auto_907105 ) ( ON ?auto_907107 ?auto_907106 ) ( ON ?auto_907108 ?auto_907107 ) ( not ( = ?auto_907105 ?auto_907106 ) ) ( not ( = ?auto_907105 ?auto_907107 ) ) ( not ( = ?auto_907105 ?auto_907108 ) ) ( not ( = ?auto_907105 ?auto_907109 ) ) ( not ( = ?auto_907105 ?auto_907110 ) ) ( not ( = ?auto_907105 ?auto_907111 ) ) ( not ( = ?auto_907106 ?auto_907107 ) ) ( not ( = ?auto_907106 ?auto_907108 ) ) ( not ( = ?auto_907106 ?auto_907109 ) ) ( not ( = ?auto_907106 ?auto_907110 ) ) ( not ( = ?auto_907106 ?auto_907111 ) ) ( not ( = ?auto_907107 ?auto_907108 ) ) ( not ( = ?auto_907107 ?auto_907109 ) ) ( not ( = ?auto_907107 ?auto_907110 ) ) ( not ( = ?auto_907107 ?auto_907111 ) ) ( not ( = ?auto_907108 ?auto_907109 ) ) ( not ( = ?auto_907108 ?auto_907110 ) ) ( not ( = ?auto_907108 ?auto_907111 ) ) ( not ( = ?auto_907109 ?auto_907110 ) ) ( not ( = ?auto_907109 ?auto_907111 ) ) ( not ( = ?auto_907110 ?auto_907111 ) ) ( CLEAR ?auto_907108 ) ( ON ?auto_907109 ?auto_907110 ) ( CLEAR ?auto_907109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_907105 ?auto_907106 ?auto_907107 ?auto_907108 ?auto_907109 )
      ( MAKE-6PILE ?auto_907105 ?auto_907106 ?auto_907107 ?auto_907108 ?auto_907109 ?auto_907110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907131 - BLOCK
      ?auto_907132 - BLOCK
      ?auto_907133 - BLOCK
      ?auto_907134 - BLOCK
      ?auto_907135 - BLOCK
      ?auto_907136 - BLOCK
    )
    :vars
    (
      ?auto_907137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907136 ?auto_907137 ) ( ON-TABLE ?auto_907131 ) ( ON ?auto_907132 ?auto_907131 ) ( ON ?auto_907133 ?auto_907132 ) ( not ( = ?auto_907131 ?auto_907132 ) ) ( not ( = ?auto_907131 ?auto_907133 ) ) ( not ( = ?auto_907131 ?auto_907134 ) ) ( not ( = ?auto_907131 ?auto_907135 ) ) ( not ( = ?auto_907131 ?auto_907136 ) ) ( not ( = ?auto_907131 ?auto_907137 ) ) ( not ( = ?auto_907132 ?auto_907133 ) ) ( not ( = ?auto_907132 ?auto_907134 ) ) ( not ( = ?auto_907132 ?auto_907135 ) ) ( not ( = ?auto_907132 ?auto_907136 ) ) ( not ( = ?auto_907132 ?auto_907137 ) ) ( not ( = ?auto_907133 ?auto_907134 ) ) ( not ( = ?auto_907133 ?auto_907135 ) ) ( not ( = ?auto_907133 ?auto_907136 ) ) ( not ( = ?auto_907133 ?auto_907137 ) ) ( not ( = ?auto_907134 ?auto_907135 ) ) ( not ( = ?auto_907134 ?auto_907136 ) ) ( not ( = ?auto_907134 ?auto_907137 ) ) ( not ( = ?auto_907135 ?auto_907136 ) ) ( not ( = ?auto_907135 ?auto_907137 ) ) ( not ( = ?auto_907136 ?auto_907137 ) ) ( ON ?auto_907135 ?auto_907136 ) ( CLEAR ?auto_907133 ) ( ON ?auto_907134 ?auto_907135 ) ( CLEAR ?auto_907134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_907131 ?auto_907132 ?auto_907133 ?auto_907134 )
      ( MAKE-6PILE ?auto_907131 ?auto_907132 ?auto_907133 ?auto_907134 ?auto_907135 ?auto_907136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907157 - BLOCK
      ?auto_907158 - BLOCK
      ?auto_907159 - BLOCK
      ?auto_907160 - BLOCK
      ?auto_907161 - BLOCK
      ?auto_907162 - BLOCK
    )
    :vars
    (
      ?auto_907163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907162 ?auto_907163 ) ( ON-TABLE ?auto_907157 ) ( ON ?auto_907158 ?auto_907157 ) ( not ( = ?auto_907157 ?auto_907158 ) ) ( not ( = ?auto_907157 ?auto_907159 ) ) ( not ( = ?auto_907157 ?auto_907160 ) ) ( not ( = ?auto_907157 ?auto_907161 ) ) ( not ( = ?auto_907157 ?auto_907162 ) ) ( not ( = ?auto_907157 ?auto_907163 ) ) ( not ( = ?auto_907158 ?auto_907159 ) ) ( not ( = ?auto_907158 ?auto_907160 ) ) ( not ( = ?auto_907158 ?auto_907161 ) ) ( not ( = ?auto_907158 ?auto_907162 ) ) ( not ( = ?auto_907158 ?auto_907163 ) ) ( not ( = ?auto_907159 ?auto_907160 ) ) ( not ( = ?auto_907159 ?auto_907161 ) ) ( not ( = ?auto_907159 ?auto_907162 ) ) ( not ( = ?auto_907159 ?auto_907163 ) ) ( not ( = ?auto_907160 ?auto_907161 ) ) ( not ( = ?auto_907160 ?auto_907162 ) ) ( not ( = ?auto_907160 ?auto_907163 ) ) ( not ( = ?auto_907161 ?auto_907162 ) ) ( not ( = ?auto_907161 ?auto_907163 ) ) ( not ( = ?auto_907162 ?auto_907163 ) ) ( ON ?auto_907161 ?auto_907162 ) ( ON ?auto_907160 ?auto_907161 ) ( CLEAR ?auto_907158 ) ( ON ?auto_907159 ?auto_907160 ) ( CLEAR ?auto_907159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_907157 ?auto_907158 ?auto_907159 )
      ( MAKE-6PILE ?auto_907157 ?auto_907158 ?auto_907159 ?auto_907160 ?auto_907161 ?auto_907162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907183 - BLOCK
      ?auto_907184 - BLOCK
      ?auto_907185 - BLOCK
      ?auto_907186 - BLOCK
      ?auto_907187 - BLOCK
      ?auto_907188 - BLOCK
    )
    :vars
    (
      ?auto_907189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907188 ?auto_907189 ) ( ON-TABLE ?auto_907183 ) ( not ( = ?auto_907183 ?auto_907184 ) ) ( not ( = ?auto_907183 ?auto_907185 ) ) ( not ( = ?auto_907183 ?auto_907186 ) ) ( not ( = ?auto_907183 ?auto_907187 ) ) ( not ( = ?auto_907183 ?auto_907188 ) ) ( not ( = ?auto_907183 ?auto_907189 ) ) ( not ( = ?auto_907184 ?auto_907185 ) ) ( not ( = ?auto_907184 ?auto_907186 ) ) ( not ( = ?auto_907184 ?auto_907187 ) ) ( not ( = ?auto_907184 ?auto_907188 ) ) ( not ( = ?auto_907184 ?auto_907189 ) ) ( not ( = ?auto_907185 ?auto_907186 ) ) ( not ( = ?auto_907185 ?auto_907187 ) ) ( not ( = ?auto_907185 ?auto_907188 ) ) ( not ( = ?auto_907185 ?auto_907189 ) ) ( not ( = ?auto_907186 ?auto_907187 ) ) ( not ( = ?auto_907186 ?auto_907188 ) ) ( not ( = ?auto_907186 ?auto_907189 ) ) ( not ( = ?auto_907187 ?auto_907188 ) ) ( not ( = ?auto_907187 ?auto_907189 ) ) ( not ( = ?auto_907188 ?auto_907189 ) ) ( ON ?auto_907187 ?auto_907188 ) ( ON ?auto_907186 ?auto_907187 ) ( ON ?auto_907185 ?auto_907186 ) ( CLEAR ?auto_907183 ) ( ON ?auto_907184 ?auto_907185 ) ( CLEAR ?auto_907184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_907183 ?auto_907184 )
      ( MAKE-6PILE ?auto_907183 ?auto_907184 ?auto_907185 ?auto_907186 ?auto_907187 ?auto_907188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_907209 - BLOCK
      ?auto_907210 - BLOCK
      ?auto_907211 - BLOCK
      ?auto_907212 - BLOCK
      ?auto_907213 - BLOCK
      ?auto_907214 - BLOCK
    )
    :vars
    (
      ?auto_907215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907214 ?auto_907215 ) ( not ( = ?auto_907209 ?auto_907210 ) ) ( not ( = ?auto_907209 ?auto_907211 ) ) ( not ( = ?auto_907209 ?auto_907212 ) ) ( not ( = ?auto_907209 ?auto_907213 ) ) ( not ( = ?auto_907209 ?auto_907214 ) ) ( not ( = ?auto_907209 ?auto_907215 ) ) ( not ( = ?auto_907210 ?auto_907211 ) ) ( not ( = ?auto_907210 ?auto_907212 ) ) ( not ( = ?auto_907210 ?auto_907213 ) ) ( not ( = ?auto_907210 ?auto_907214 ) ) ( not ( = ?auto_907210 ?auto_907215 ) ) ( not ( = ?auto_907211 ?auto_907212 ) ) ( not ( = ?auto_907211 ?auto_907213 ) ) ( not ( = ?auto_907211 ?auto_907214 ) ) ( not ( = ?auto_907211 ?auto_907215 ) ) ( not ( = ?auto_907212 ?auto_907213 ) ) ( not ( = ?auto_907212 ?auto_907214 ) ) ( not ( = ?auto_907212 ?auto_907215 ) ) ( not ( = ?auto_907213 ?auto_907214 ) ) ( not ( = ?auto_907213 ?auto_907215 ) ) ( not ( = ?auto_907214 ?auto_907215 ) ) ( ON ?auto_907213 ?auto_907214 ) ( ON ?auto_907212 ?auto_907213 ) ( ON ?auto_907211 ?auto_907212 ) ( ON ?auto_907210 ?auto_907211 ) ( ON ?auto_907209 ?auto_907210 ) ( CLEAR ?auto_907209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_907209 )
      ( MAKE-6PILE ?auto_907209 ?auto_907210 ?auto_907211 ?auto_907212 ?auto_907213 ?auto_907214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907236 - BLOCK
      ?auto_907237 - BLOCK
      ?auto_907238 - BLOCK
      ?auto_907239 - BLOCK
      ?auto_907240 - BLOCK
      ?auto_907241 - BLOCK
      ?auto_907242 - BLOCK
    )
    :vars
    (
      ?auto_907243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_907241 ) ( ON ?auto_907242 ?auto_907243 ) ( CLEAR ?auto_907242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_907236 ) ( ON ?auto_907237 ?auto_907236 ) ( ON ?auto_907238 ?auto_907237 ) ( ON ?auto_907239 ?auto_907238 ) ( ON ?auto_907240 ?auto_907239 ) ( ON ?auto_907241 ?auto_907240 ) ( not ( = ?auto_907236 ?auto_907237 ) ) ( not ( = ?auto_907236 ?auto_907238 ) ) ( not ( = ?auto_907236 ?auto_907239 ) ) ( not ( = ?auto_907236 ?auto_907240 ) ) ( not ( = ?auto_907236 ?auto_907241 ) ) ( not ( = ?auto_907236 ?auto_907242 ) ) ( not ( = ?auto_907236 ?auto_907243 ) ) ( not ( = ?auto_907237 ?auto_907238 ) ) ( not ( = ?auto_907237 ?auto_907239 ) ) ( not ( = ?auto_907237 ?auto_907240 ) ) ( not ( = ?auto_907237 ?auto_907241 ) ) ( not ( = ?auto_907237 ?auto_907242 ) ) ( not ( = ?auto_907237 ?auto_907243 ) ) ( not ( = ?auto_907238 ?auto_907239 ) ) ( not ( = ?auto_907238 ?auto_907240 ) ) ( not ( = ?auto_907238 ?auto_907241 ) ) ( not ( = ?auto_907238 ?auto_907242 ) ) ( not ( = ?auto_907238 ?auto_907243 ) ) ( not ( = ?auto_907239 ?auto_907240 ) ) ( not ( = ?auto_907239 ?auto_907241 ) ) ( not ( = ?auto_907239 ?auto_907242 ) ) ( not ( = ?auto_907239 ?auto_907243 ) ) ( not ( = ?auto_907240 ?auto_907241 ) ) ( not ( = ?auto_907240 ?auto_907242 ) ) ( not ( = ?auto_907240 ?auto_907243 ) ) ( not ( = ?auto_907241 ?auto_907242 ) ) ( not ( = ?auto_907241 ?auto_907243 ) ) ( not ( = ?auto_907242 ?auto_907243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_907242 ?auto_907243 )
      ( !STACK ?auto_907242 ?auto_907241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907266 - BLOCK
      ?auto_907267 - BLOCK
      ?auto_907268 - BLOCK
      ?auto_907269 - BLOCK
      ?auto_907270 - BLOCK
      ?auto_907271 - BLOCK
      ?auto_907272 - BLOCK
    )
    :vars
    (
      ?auto_907273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907272 ?auto_907273 ) ( ON-TABLE ?auto_907266 ) ( ON ?auto_907267 ?auto_907266 ) ( ON ?auto_907268 ?auto_907267 ) ( ON ?auto_907269 ?auto_907268 ) ( ON ?auto_907270 ?auto_907269 ) ( not ( = ?auto_907266 ?auto_907267 ) ) ( not ( = ?auto_907266 ?auto_907268 ) ) ( not ( = ?auto_907266 ?auto_907269 ) ) ( not ( = ?auto_907266 ?auto_907270 ) ) ( not ( = ?auto_907266 ?auto_907271 ) ) ( not ( = ?auto_907266 ?auto_907272 ) ) ( not ( = ?auto_907266 ?auto_907273 ) ) ( not ( = ?auto_907267 ?auto_907268 ) ) ( not ( = ?auto_907267 ?auto_907269 ) ) ( not ( = ?auto_907267 ?auto_907270 ) ) ( not ( = ?auto_907267 ?auto_907271 ) ) ( not ( = ?auto_907267 ?auto_907272 ) ) ( not ( = ?auto_907267 ?auto_907273 ) ) ( not ( = ?auto_907268 ?auto_907269 ) ) ( not ( = ?auto_907268 ?auto_907270 ) ) ( not ( = ?auto_907268 ?auto_907271 ) ) ( not ( = ?auto_907268 ?auto_907272 ) ) ( not ( = ?auto_907268 ?auto_907273 ) ) ( not ( = ?auto_907269 ?auto_907270 ) ) ( not ( = ?auto_907269 ?auto_907271 ) ) ( not ( = ?auto_907269 ?auto_907272 ) ) ( not ( = ?auto_907269 ?auto_907273 ) ) ( not ( = ?auto_907270 ?auto_907271 ) ) ( not ( = ?auto_907270 ?auto_907272 ) ) ( not ( = ?auto_907270 ?auto_907273 ) ) ( not ( = ?auto_907271 ?auto_907272 ) ) ( not ( = ?auto_907271 ?auto_907273 ) ) ( not ( = ?auto_907272 ?auto_907273 ) ) ( CLEAR ?auto_907270 ) ( ON ?auto_907271 ?auto_907272 ) ( CLEAR ?auto_907271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_907266 ?auto_907267 ?auto_907268 ?auto_907269 ?auto_907270 ?auto_907271 )
      ( MAKE-7PILE ?auto_907266 ?auto_907267 ?auto_907268 ?auto_907269 ?auto_907270 ?auto_907271 ?auto_907272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907296 - BLOCK
      ?auto_907297 - BLOCK
      ?auto_907298 - BLOCK
      ?auto_907299 - BLOCK
      ?auto_907300 - BLOCK
      ?auto_907301 - BLOCK
      ?auto_907302 - BLOCK
    )
    :vars
    (
      ?auto_907303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907302 ?auto_907303 ) ( ON-TABLE ?auto_907296 ) ( ON ?auto_907297 ?auto_907296 ) ( ON ?auto_907298 ?auto_907297 ) ( ON ?auto_907299 ?auto_907298 ) ( not ( = ?auto_907296 ?auto_907297 ) ) ( not ( = ?auto_907296 ?auto_907298 ) ) ( not ( = ?auto_907296 ?auto_907299 ) ) ( not ( = ?auto_907296 ?auto_907300 ) ) ( not ( = ?auto_907296 ?auto_907301 ) ) ( not ( = ?auto_907296 ?auto_907302 ) ) ( not ( = ?auto_907296 ?auto_907303 ) ) ( not ( = ?auto_907297 ?auto_907298 ) ) ( not ( = ?auto_907297 ?auto_907299 ) ) ( not ( = ?auto_907297 ?auto_907300 ) ) ( not ( = ?auto_907297 ?auto_907301 ) ) ( not ( = ?auto_907297 ?auto_907302 ) ) ( not ( = ?auto_907297 ?auto_907303 ) ) ( not ( = ?auto_907298 ?auto_907299 ) ) ( not ( = ?auto_907298 ?auto_907300 ) ) ( not ( = ?auto_907298 ?auto_907301 ) ) ( not ( = ?auto_907298 ?auto_907302 ) ) ( not ( = ?auto_907298 ?auto_907303 ) ) ( not ( = ?auto_907299 ?auto_907300 ) ) ( not ( = ?auto_907299 ?auto_907301 ) ) ( not ( = ?auto_907299 ?auto_907302 ) ) ( not ( = ?auto_907299 ?auto_907303 ) ) ( not ( = ?auto_907300 ?auto_907301 ) ) ( not ( = ?auto_907300 ?auto_907302 ) ) ( not ( = ?auto_907300 ?auto_907303 ) ) ( not ( = ?auto_907301 ?auto_907302 ) ) ( not ( = ?auto_907301 ?auto_907303 ) ) ( not ( = ?auto_907302 ?auto_907303 ) ) ( ON ?auto_907301 ?auto_907302 ) ( CLEAR ?auto_907299 ) ( ON ?auto_907300 ?auto_907301 ) ( CLEAR ?auto_907300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_907296 ?auto_907297 ?auto_907298 ?auto_907299 ?auto_907300 )
      ( MAKE-7PILE ?auto_907296 ?auto_907297 ?auto_907298 ?auto_907299 ?auto_907300 ?auto_907301 ?auto_907302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907326 - BLOCK
      ?auto_907327 - BLOCK
      ?auto_907328 - BLOCK
      ?auto_907329 - BLOCK
      ?auto_907330 - BLOCK
      ?auto_907331 - BLOCK
      ?auto_907332 - BLOCK
    )
    :vars
    (
      ?auto_907333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907332 ?auto_907333 ) ( ON-TABLE ?auto_907326 ) ( ON ?auto_907327 ?auto_907326 ) ( ON ?auto_907328 ?auto_907327 ) ( not ( = ?auto_907326 ?auto_907327 ) ) ( not ( = ?auto_907326 ?auto_907328 ) ) ( not ( = ?auto_907326 ?auto_907329 ) ) ( not ( = ?auto_907326 ?auto_907330 ) ) ( not ( = ?auto_907326 ?auto_907331 ) ) ( not ( = ?auto_907326 ?auto_907332 ) ) ( not ( = ?auto_907326 ?auto_907333 ) ) ( not ( = ?auto_907327 ?auto_907328 ) ) ( not ( = ?auto_907327 ?auto_907329 ) ) ( not ( = ?auto_907327 ?auto_907330 ) ) ( not ( = ?auto_907327 ?auto_907331 ) ) ( not ( = ?auto_907327 ?auto_907332 ) ) ( not ( = ?auto_907327 ?auto_907333 ) ) ( not ( = ?auto_907328 ?auto_907329 ) ) ( not ( = ?auto_907328 ?auto_907330 ) ) ( not ( = ?auto_907328 ?auto_907331 ) ) ( not ( = ?auto_907328 ?auto_907332 ) ) ( not ( = ?auto_907328 ?auto_907333 ) ) ( not ( = ?auto_907329 ?auto_907330 ) ) ( not ( = ?auto_907329 ?auto_907331 ) ) ( not ( = ?auto_907329 ?auto_907332 ) ) ( not ( = ?auto_907329 ?auto_907333 ) ) ( not ( = ?auto_907330 ?auto_907331 ) ) ( not ( = ?auto_907330 ?auto_907332 ) ) ( not ( = ?auto_907330 ?auto_907333 ) ) ( not ( = ?auto_907331 ?auto_907332 ) ) ( not ( = ?auto_907331 ?auto_907333 ) ) ( not ( = ?auto_907332 ?auto_907333 ) ) ( ON ?auto_907331 ?auto_907332 ) ( ON ?auto_907330 ?auto_907331 ) ( CLEAR ?auto_907328 ) ( ON ?auto_907329 ?auto_907330 ) ( CLEAR ?auto_907329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_907326 ?auto_907327 ?auto_907328 ?auto_907329 )
      ( MAKE-7PILE ?auto_907326 ?auto_907327 ?auto_907328 ?auto_907329 ?auto_907330 ?auto_907331 ?auto_907332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907356 - BLOCK
      ?auto_907357 - BLOCK
      ?auto_907358 - BLOCK
      ?auto_907359 - BLOCK
      ?auto_907360 - BLOCK
      ?auto_907361 - BLOCK
      ?auto_907362 - BLOCK
    )
    :vars
    (
      ?auto_907363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907362 ?auto_907363 ) ( ON-TABLE ?auto_907356 ) ( ON ?auto_907357 ?auto_907356 ) ( not ( = ?auto_907356 ?auto_907357 ) ) ( not ( = ?auto_907356 ?auto_907358 ) ) ( not ( = ?auto_907356 ?auto_907359 ) ) ( not ( = ?auto_907356 ?auto_907360 ) ) ( not ( = ?auto_907356 ?auto_907361 ) ) ( not ( = ?auto_907356 ?auto_907362 ) ) ( not ( = ?auto_907356 ?auto_907363 ) ) ( not ( = ?auto_907357 ?auto_907358 ) ) ( not ( = ?auto_907357 ?auto_907359 ) ) ( not ( = ?auto_907357 ?auto_907360 ) ) ( not ( = ?auto_907357 ?auto_907361 ) ) ( not ( = ?auto_907357 ?auto_907362 ) ) ( not ( = ?auto_907357 ?auto_907363 ) ) ( not ( = ?auto_907358 ?auto_907359 ) ) ( not ( = ?auto_907358 ?auto_907360 ) ) ( not ( = ?auto_907358 ?auto_907361 ) ) ( not ( = ?auto_907358 ?auto_907362 ) ) ( not ( = ?auto_907358 ?auto_907363 ) ) ( not ( = ?auto_907359 ?auto_907360 ) ) ( not ( = ?auto_907359 ?auto_907361 ) ) ( not ( = ?auto_907359 ?auto_907362 ) ) ( not ( = ?auto_907359 ?auto_907363 ) ) ( not ( = ?auto_907360 ?auto_907361 ) ) ( not ( = ?auto_907360 ?auto_907362 ) ) ( not ( = ?auto_907360 ?auto_907363 ) ) ( not ( = ?auto_907361 ?auto_907362 ) ) ( not ( = ?auto_907361 ?auto_907363 ) ) ( not ( = ?auto_907362 ?auto_907363 ) ) ( ON ?auto_907361 ?auto_907362 ) ( ON ?auto_907360 ?auto_907361 ) ( ON ?auto_907359 ?auto_907360 ) ( CLEAR ?auto_907357 ) ( ON ?auto_907358 ?auto_907359 ) ( CLEAR ?auto_907358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_907356 ?auto_907357 ?auto_907358 )
      ( MAKE-7PILE ?auto_907356 ?auto_907357 ?auto_907358 ?auto_907359 ?auto_907360 ?auto_907361 ?auto_907362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907386 - BLOCK
      ?auto_907387 - BLOCK
      ?auto_907388 - BLOCK
      ?auto_907389 - BLOCK
      ?auto_907390 - BLOCK
      ?auto_907391 - BLOCK
      ?auto_907392 - BLOCK
    )
    :vars
    (
      ?auto_907393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907392 ?auto_907393 ) ( ON-TABLE ?auto_907386 ) ( not ( = ?auto_907386 ?auto_907387 ) ) ( not ( = ?auto_907386 ?auto_907388 ) ) ( not ( = ?auto_907386 ?auto_907389 ) ) ( not ( = ?auto_907386 ?auto_907390 ) ) ( not ( = ?auto_907386 ?auto_907391 ) ) ( not ( = ?auto_907386 ?auto_907392 ) ) ( not ( = ?auto_907386 ?auto_907393 ) ) ( not ( = ?auto_907387 ?auto_907388 ) ) ( not ( = ?auto_907387 ?auto_907389 ) ) ( not ( = ?auto_907387 ?auto_907390 ) ) ( not ( = ?auto_907387 ?auto_907391 ) ) ( not ( = ?auto_907387 ?auto_907392 ) ) ( not ( = ?auto_907387 ?auto_907393 ) ) ( not ( = ?auto_907388 ?auto_907389 ) ) ( not ( = ?auto_907388 ?auto_907390 ) ) ( not ( = ?auto_907388 ?auto_907391 ) ) ( not ( = ?auto_907388 ?auto_907392 ) ) ( not ( = ?auto_907388 ?auto_907393 ) ) ( not ( = ?auto_907389 ?auto_907390 ) ) ( not ( = ?auto_907389 ?auto_907391 ) ) ( not ( = ?auto_907389 ?auto_907392 ) ) ( not ( = ?auto_907389 ?auto_907393 ) ) ( not ( = ?auto_907390 ?auto_907391 ) ) ( not ( = ?auto_907390 ?auto_907392 ) ) ( not ( = ?auto_907390 ?auto_907393 ) ) ( not ( = ?auto_907391 ?auto_907392 ) ) ( not ( = ?auto_907391 ?auto_907393 ) ) ( not ( = ?auto_907392 ?auto_907393 ) ) ( ON ?auto_907391 ?auto_907392 ) ( ON ?auto_907390 ?auto_907391 ) ( ON ?auto_907389 ?auto_907390 ) ( ON ?auto_907388 ?auto_907389 ) ( CLEAR ?auto_907386 ) ( ON ?auto_907387 ?auto_907388 ) ( CLEAR ?auto_907387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_907386 ?auto_907387 )
      ( MAKE-7PILE ?auto_907386 ?auto_907387 ?auto_907388 ?auto_907389 ?auto_907390 ?auto_907391 ?auto_907392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_907416 - BLOCK
      ?auto_907417 - BLOCK
      ?auto_907418 - BLOCK
      ?auto_907419 - BLOCK
      ?auto_907420 - BLOCK
      ?auto_907421 - BLOCK
      ?auto_907422 - BLOCK
    )
    :vars
    (
      ?auto_907423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907422 ?auto_907423 ) ( not ( = ?auto_907416 ?auto_907417 ) ) ( not ( = ?auto_907416 ?auto_907418 ) ) ( not ( = ?auto_907416 ?auto_907419 ) ) ( not ( = ?auto_907416 ?auto_907420 ) ) ( not ( = ?auto_907416 ?auto_907421 ) ) ( not ( = ?auto_907416 ?auto_907422 ) ) ( not ( = ?auto_907416 ?auto_907423 ) ) ( not ( = ?auto_907417 ?auto_907418 ) ) ( not ( = ?auto_907417 ?auto_907419 ) ) ( not ( = ?auto_907417 ?auto_907420 ) ) ( not ( = ?auto_907417 ?auto_907421 ) ) ( not ( = ?auto_907417 ?auto_907422 ) ) ( not ( = ?auto_907417 ?auto_907423 ) ) ( not ( = ?auto_907418 ?auto_907419 ) ) ( not ( = ?auto_907418 ?auto_907420 ) ) ( not ( = ?auto_907418 ?auto_907421 ) ) ( not ( = ?auto_907418 ?auto_907422 ) ) ( not ( = ?auto_907418 ?auto_907423 ) ) ( not ( = ?auto_907419 ?auto_907420 ) ) ( not ( = ?auto_907419 ?auto_907421 ) ) ( not ( = ?auto_907419 ?auto_907422 ) ) ( not ( = ?auto_907419 ?auto_907423 ) ) ( not ( = ?auto_907420 ?auto_907421 ) ) ( not ( = ?auto_907420 ?auto_907422 ) ) ( not ( = ?auto_907420 ?auto_907423 ) ) ( not ( = ?auto_907421 ?auto_907422 ) ) ( not ( = ?auto_907421 ?auto_907423 ) ) ( not ( = ?auto_907422 ?auto_907423 ) ) ( ON ?auto_907421 ?auto_907422 ) ( ON ?auto_907420 ?auto_907421 ) ( ON ?auto_907419 ?auto_907420 ) ( ON ?auto_907418 ?auto_907419 ) ( ON ?auto_907417 ?auto_907418 ) ( ON ?auto_907416 ?auto_907417 ) ( CLEAR ?auto_907416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_907416 )
      ( MAKE-7PILE ?auto_907416 ?auto_907417 ?auto_907418 ?auto_907419 ?auto_907420 ?auto_907421 ?auto_907422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907447 - BLOCK
      ?auto_907448 - BLOCK
      ?auto_907449 - BLOCK
      ?auto_907450 - BLOCK
      ?auto_907451 - BLOCK
      ?auto_907452 - BLOCK
      ?auto_907453 - BLOCK
      ?auto_907454 - BLOCK
    )
    :vars
    (
      ?auto_907455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_907453 ) ( ON ?auto_907454 ?auto_907455 ) ( CLEAR ?auto_907454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_907447 ) ( ON ?auto_907448 ?auto_907447 ) ( ON ?auto_907449 ?auto_907448 ) ( ON ?auto_907450 ?auto_907449 ) ( ON ?auto_907451 ?auto_907450 ) ( ON ?auto_907452 ?auto_907451 ) ( ON ?auto_907453 ?auto_907452 ) ( not ( = ?auto_907447 ?auto_907448 ) ) ( not ( = ?auto_907447 ?auto_907449 ) ) ( not ( = ?auto_907447 ?auto_907450 ) ) ( not ( = ?auto_907447 ?auto_907451 ) ) ( not ( = ?auto_907447 ?auto_907452 ) ) ( not ( = ?auto_907447 ?auto_907453 ) ) ( not ( = ?auto_907447 ?auto_907454 ) ) ( not ( = ?auto_907447 ?auto_907455 ) ) ( not ( = ?auto_907448 ?auto_907449 ) ) ( not ( = ?auto_907448 ?auto_907450 ) ) ( not ( = ?auto_907448 ?auto_907451 ) ) ( not ( = ?auto_907448 ?auto_907452 ) ) ( not ( = ?auto_907448 ?auto_907453 ) ) ( not ( = ?auto_907448 ?auto_907454 ) ) ( not ( = ?auto_907448 ?auto_907455 ) ) ( not ( = ?auto_907449 ?auto_907450 ) ) ( not ( = ?auto_907449 ?auto_907451 ) ) ( not ( = ?auto_907449 ?auto_907452 ) ) ( not ( = ?auto_907449 ?auto_907453 ) ) ( not ( = ?auto_907449 ?auto_907454 ) ) ( not ( = ?auto_907449 ?auto_907455 ) ) ( not ( = ?auto_907450 ?auto_907451 ) ) ( not ( = ?auto_907450 ?auto_907452 ) ) ( not ( = ?auto_907450 ?auto_907453 ) ) ( not ( = ?auto_907450 ?auto_907454 ) ) ( not ( = ?auto_907450 ?auto_907455 ) ) ( not ( = ?auto_907451 ?auto_907452 ) ) ( not ( = ?auto_907451 ?auto_907453 ) ) ( not ( = ?auto_907451 ?auto_907454 ) ) ( not ( = ?auto_907451 ?auto_907455 ) ) ( not ( = ?auto_907452 ?auto_907453 ) ) ( not ( = ?auto_907452 ?auto_907454 ) ) ( not ( = ?auto_907452 ?auto_907455 ) ) ( not ( = ?auto_907453 ?auto_907454 ) ) ( not ( = ?auto_907453 ?auto_907455 ) ) ( not ( = ?auto_907454 ?auto_907455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_907454 ?auto_907455 )
      ( !STACK ?auto_907454 ?auto_907453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907481 - BLOCK
      ?auto_907482 - BLOCK
      ?auto_907483 - BLOCK
      ?auto_907484 - BLOCK
      ?auto_907485 - BLOCK
      ?auto_907486 - BLOCK
      ?auto_907487 - BLOCK
      ?auto_907488 - BLOCK
    )
    :vars
    (
      ?auto_907489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907488 ?auto_907489 ) ( ON-TABLE ?auto_907481 ) ( ON ?auto_907482 ?auto_907481 ) ( ON ?auto_907483 ?auto_907482 ) ( ON ?auto_907484 ?auto_907483 ) ( ON ?auto_907485 ?auto_907484 ) ( ON ?auto_907486 ?auto_907485 ) ( not ( = ?auto_907481 ?auto_907482 ) ) ( not ( = ?auto_907481 ?auto_907483 ) ) ( not ( = ?auto_907481 ?auto_907484 ) ) ( not ( = ?auto_907481 ?auto_907485 ) ) ( not ( = ?auto_907481 ?auto_907486 ) ) ( not ( = ?auto_907481 ?auto_907487 ) ) ( not ( = ?auto_907481 ?auto_907488 ) ) ( not ( = ?auto_907481 ?auto_907489 ) ) ( not ( = ?auto_907482 ?auto_907483 ) ) ( not ( = ?auto_907482 ?auto_907484 ) ) ( not ( = ?auto_907482 ?auto_907485 ) ) ( not ( = ?auto_907482 ?auto_907486 ) ) ( not ( = ?auto_907482 ?auto_907487 ) ) ( not ( = ?auto_907482 ?auto_907488 ) ) ( not ( = ?auto_907482 ?auto_907489 ) ) ( not ( = ?auto_907483 ?auto_907484 ) ) ( not ( = ?auto_907483 ?auto_907485 ) ) ( not ( = ?auto_907483 ?auto_907486 ) ) ( not ( = ?auto_907483 ?auto_907487 ) ) ( not ( = ?auto_907483 ?auto_907488 ) ) ( not ( = ?auto_907483 ?auto_907489 ) ) ( not ( = ?auto_907484 ?auto_907485 ) ) ( not ( = ?auto_907484 ?auto_907486 ) ) ( not ( = ?auto_907484 ?auto_907487 ) ) ( not ( = ?auto_907484 ?auto_907488 ) ) ( not ( = ?auto_907484 ?auto_907489 ) ) ( not ( = ?auto_907485 ?auto_907486 ) ) ( not ( = ?auto_907485 ?auto_907487 ) ) ( not ( = ?auto_907485 ?auto_907488 ) ) ( not ( = ?auto_907485 ?auto_907489 ) ) ( not ( = ?auto_907486 ?auto_907487 ) ) ( not ( = ?auto_907486 ?auto_907488 ) ) ( not ( = ?auto_907486 ?auto_907489 ) ) ( not ( = ?auto_907487 ?auto_907488 ) ) ( not ( = ?auto_907487 ?auto_907489 ) ) ( not ( = ?auto_907488 ?auto_907489 ) ) ( CLEAR ?auto_907486 ) ( ON ?auto_907487 ?auto_907488 ) ( CLEAR ?auto_907487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_907481 ?auto_907482 ?auto_907483 ?auto_907484 ?auto_907485 ?auto_907486 ?auto_907487 )
      ( MAKE-8PILE ?auto_907481 ?auto_907482 ?auto_907483 ?auto_907484 ?auto_907485 ?auto_907486 ?auto_907487 ?auto_907488 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907515 - BLOCK
      ?auto_907516 - BLOCK
      ?auto_907517 - BLOCK
      ?auto_907518 - BLOCK
      ?auto_907519 - BLOCK
      ?auto_907520 - BLOCK
      ?auto_907521 - BLOCK
      ?auto_907522 - BLOCK
    )
    :vars
    (
      ?auto_907523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907522 ?auto_907523 ) ( ON-TABLE ?auto_907515 ) ( ON ?auto_907516 ?auto_907515 ) ( ON ?auto_907517 ?auto_907516 ) ( ON ?auto_907518 ?auto_907517 ) ( ON ?auto_907519 ?auto_907518 ) ( not ( = ?auto_907515 ?auto_907516 ) ) ( not ( = ?auto_907515 ?auto_907517 ) ) ( not ( = ?auto_907515 ?auto_907518 ) ) ( not ( = ?auto_907515 ?auto_907519 ) ) ( not ( = ?auto_907515 ?auto_907520 ) ) ( not ( = ?auto_907515 ?auto_907521 ) ) ( not ( = ?auto_907515 ?auto_907522 ) ) ( not ( = ?auto_907515 ?auto_907523 ) ) ( not ( = ?auto_907516 ?auto_907517 ) ) ( not ( = ?auto_907516 ?auto_907518 ) ) ( not ( = ?auto_907516 ?auto_907519 ) ) ( not ( = ?auto_907516 ?auto_907520 ) ) ( not ( = ?auto_907516 ?auto_907521 ) ) ( not ( = ?auto_907516 ?auto_907522 ) ) ( not ( = ?auto_907516 ?auto_907523 ) ) ( not ( = ?auto_907517 ?auto_907518 ) ) ( not ( = ?auto_907517 ?auto_907519 ) ) ( not ( = ?auto_907517 ?auto_907520 ) ) ( not ( = ?auto_907517 ?auto_907521 ) ) ( not ( = ?auto_907517 ?auto_907522 ) ) ( not ( = ?auto_907517 ?auto_907523 ) ) ( not ( = ?auto_907518 ?auto_907519 ) ) ( not ( = ?auto_907518 ?auto_907520 ) ) ( not ( = ?auto_907518 ?auto_907521 ) ) ( not ( = ?auto_907518 ?auto_907522 ) ) ( not ( = ?auto_907518 ?auto_907523 ) ) ( not ( = ?auto_907519 ?auto_907520 ) ) ( not ( = ?auto_907519 ?auto_907521 ) ) ( not ( = ?auto_907519 ?auto_907522 ) ) ( not ( = ?auto_907519 ?auto_907523 ) ) ( not ( = ?auto_907520 ?auto_907521 ) ) ( not ( = ?auto_907520 ?auto_907522 ) ) ( not ( = ?auto_907520 ?auto_907523 ) ) ( not ( = ?auto_907521 ?auto_907522 ) ) ( not ( = ?auto_907521 ?auto_907523 ) ) ( not ( = ?auto_907522 ?auto_907523 ) ) ( ON ?auto_907521 ?auto_907522 ) ( CLEAR ?auto_907519 ) ( ON ?auto_907520 ?auto_907521 ) ( CLEAR ?auto_907520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_907515 ?auto_907516 ?auto_907517 ?auto_907518 ?auto_907519 ?auto_907520 )
      ( MAKE-8PILE ?auto_907515 ?auto_907516 ?auto_907517 ?auto_907518 ?auto_907519 ?auto_907520 ?auto_907521 ?auto_907522 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907549 - BLOCK
      ?auto_907550 - BLOCK
      ?auto_907551 - BLOCK
      ?auto_907552 - BLOCK
      ?auto_907553 - BLOCK
      ?auto_907554 - BLOCK
      ?auto_907555 - BLOCK
      ?auto_907556 - BLOCK
    )
    :vars
    (
      ?auto_907557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907556 ?auto_907557 ) ( ON-TABLE ?auto_907549 ) ( ON ?auto_907550 ?auto_907549 ) ( ON ?auto_907551 ?auto_907550 ) ( ON ?auto_907552 ?auto_907551 ) ( not ( = ?auto_907549 ?auto_907550 ) ) ( not ( = ?auto_907549 ?auto_907551 ) ) ( not ( = ?auto_907549 ?auto_907552 ) ) ( not ( = ?auto_907549 ?auto_907553 ) ) ( not ( = ?auto_907549 ?auto_907554 ) ) ( not ( = ?auto_907549 ?auto_907555 ) ) ( not ( = ?auto_907549 ?auto_907556 ) ) ( not ( = ?auto_907549 ?auto_907557 ) ) ( not ( = ?auto_907550 ?auto_907551 ) ) ( not ( = ?auto_907550 ?auto_907552 ) ) ( not ( = ?auto_907550 ?auto_907553 ) ) ( not ( = ?auto_907550 ?auto_907554 ) ) ( not ( = ?auto_907550 ?auto_907555 ) ) ( not ( = ?auto_907550 ?auto_907556 ) ) ( not ( = ?auto_907550 ?auto_907557 ) ) ( not ( = ?auto_907551 ?auto_907552 ) ) ( not ( = ?auto_907551 ?auto_907553 ) ) ( not ( = ?auto_907551 ?auto_907554 ) ) ( not ( = ?auto_907551 ?auto_907555 ) ) ( not ( = ?auto_907551 ?auto_907556 ) ) ( not ( = ?auto_907551 ?auto_907557 ) ) ( not ( = ?auto_907552 ?auto_907553 ) ) ( not ( = ?auto_907552 ?auto_907554 ) ) ( not ( = ?auto_907552 ?auto_907555 ) ) ( not ( = ?auto_907552 ?auto_907556 ) ) ( not ( = ?auto_907552 ?auto_907557 ) ) ( not ( = ?auto_907553 ?auto_907554 ) ) ( not ( = ?auto_907553 ?auto_907555 ) ) ( not ( = ?auto_907553 ?auto_907556 ) ) ( not ( = ?auto_907553 ?auto_907557 ) ) ( not ( = ?auto_907554 ?auto_907555 ) ) ( not ( = ?auto_907554 ?auto_907556 ) ) ( not ( = ?auto_907554 ?auto_907557 ) ) ( not ( = ?auto_907555 ?auto_907556 ) ) ( not ( = ?auto_907555 ?auto_907557 ) ) ( not ( = ?auto_907556 ?auto_907557 ) ) ( ON ?auto_907555 ?auto_907556 ) ( ON ?auto_907554 ?auto_907555 ) ( CLEAR ?auto_907552 ) ( ON ?auto_907553 ?auto_907554 ) ( CLEAR ?auto_907553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_907549 ?auto_907550 ?auto_907551 ?auto_907552 ?auto_907553 )
      ( MAKE-8PILE ?auto_907549 ?auto_907550 ?auto_907551 ?auto_907552 ?auto_907553 ?auto_907554 ?auto_907555 ?auto_907556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907583 - BLOCK
      ?auto_907584 - BLOCK
      ?auto_907585 - BLOCK
      ?auto_907586 - BLOCK
      ?auto_907587 - BLOCK
      ?auto_907588 - BLOCK
      ?auto_907589 - BLOCK
      ?auto_907590 - BLOCK
    )
    :vars
    (
      ?auto_907591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907590 ?auto_907591 ) ( ON-TABLE ?auto_907583 ) ( ON ?auto_907584 ?auto_907583 ) ( ON ?auto_907585 ?auto_907584 ) ( not ( = ?auto_907583 ?auto_907584 ) ) ( not ( = ?auto_907583 ?auto_907585 ) ) ( not ( = ?auto_907583 ?auto_907586 ) ) ( not ( = ?auto_907583 ?auto_907587 ) ) ( not ( = ?auto_907583 ?auto_907588 ) ) ( not ( = ?auto_907583 ?auto_907589 ) ) ( not ( = ?auto_907583 ?auto_907590 ) ) ( not ( = ?auto_907583 ?auto_907591 ) ) ( not ( = ?auto_907584 ?auto_907585 ) ) ( not ( = ?auto_907584 ?auto_907586 ) ) ( not ( = ?auto_907584 ?auto_907587 ) ) ( not ( = ?auto_907584 ?auto_907588 ) ) ( not ( = ?auto_907584 ?auto_907589 ) ) ( not ( = ?auto_907584 ?auto_907590 ) ) ( not ( = ?auto_907584 ?auto_907591 ) ) ( not ( = ?auto_907585 ?auto_907586 ) ) ( not ( = ?auto_907585 ?auto_907587 ) ) ( not ( = ?auto_907585 ?auto_907588 ) ) ( not ( = ?auto_907585 ?auto_907589 ) ) ( not ( = ?auto_907585 ?auto_907590 ) ) ( not ( = ?auto_907585 ?auto_907591 ) ) ( not ( = ?auto_907586 ?auto_907587 ) ) ( not ( = ?auto_907586 ?auto_907588 ) ) ( not ( = ?auto_907586 ?auto_907589 ) ) ( not ( = ?auto_907586 ?auto_907590 ) ) ( not ( = ?auto_907586 ?auto_907591 ) ) ( not ( = ?auto_907587 ?auto_907588 ) ) ( not ( = ?auto_907587 ?auto_907589 ) ) ( not ( = ?auto_907587 ?auto_907590 ) ) ( not ( = ?auto_907587 ?auto_907591 ) ) ( not ( = ?auto_907588 ?auto_907589 ) ) ( not ( = ?auto_907588 ?auto_907590 ) ) ( not ( = ?auto_907588 ?auto_907591 ) ) ( not ( = ?auto_907589 ?auto_907590 ) ) ( not ( = ?auto_907589 ?auto_907591 ) ) ( not ( = ?auto_907590 ?auto_907591 ) ) ( ON ?auto_907589 ?auto_907590 ) ( ON ?auto_907588 ?auto_907589 ) ( ON ?auto_907587 ?auto_907588 ) ( CLEAR ?auto_907585 ) ( ON ?auto_907586 ?auto_907587 ) ( CLEAR ?auto_907586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_907583 ?auto_907584 ?auto_907585 ?auto_907586 )
      ( MAKE-8PILE ?auto_907583 ?auto_907584 ?auto_907585 ?auto_907586 ?auto_907587 ?auto_907588 ?auto_907589 ?auto_907590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907617 - BLOCK
      ?auto_907618 - BLOCK
      ?auto_907619 - BLOCK
      ?auto_907620 - BLOCK
      ?auto_907621 - BLOCK
      ?auto_907622 - BLOCK
      ?auto_907623 - BLOCK
      ?auto_907624 - BLOCK
    )
    :vars
    (
      ?auto_907625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907624 ?auto_907625 ) ( ON-TABLE ?auto_907617 ) ( ON ?auto_907618 ?auto_907617 ) ( not ( = ?auto_907617 ?auto_907618 ) ) ( not ( = ?auto_907617 ?auto_907619 ) ) ( not ( = ?auto_907617 ?auto_907620 ) ) ( not ( = ?auto_907617 ?auto_907621 ) ) ( not ( = ?auto_907617 ?auto_907622 ) ) ( not ( = ?auto_907617 ?auto_907623 ) ) ( not ( = ?auto_907617 ?auto_907624 ) ) ( not ( = ?auto_907617 ?auto_907625 ) ) ( not ( = ?auto_907618 ?auto_907619 ) ) ( not ( = ?auto_907618 ?auto_907620 ) ) ( not ( = ?auto_907618 ?auto_907621 ) ) ( not ( = ?auto_907618 ?auto_907622 ) ) ( not ( = ?auto_907618 ?auto_907623 ) ) ( not ( = ?auto_907618 ?auto_907624 ) ) ( not ( = ?auto_907618 ?auto_907625 ) ) ( not ( = ?auto_907619 ?auto_907620 ) ) ( not ( = ?auto_907619 ?auto_907621 ) ) ( not ( = ?auto_907619 ?auto_907622 ) ) ( not ( = ?auto_907619 ?auto_907623 ) ) ( not ( = ?auto_907619 ?auto_907624 ) ) ( not ( = ?auto_907619 ?auto_907625 ) ) ( not ( = ?auto_907620 ?auto_907621 ) ) ( not ( = ?auto_907620 ?auto_907622 ) ) ( not ( = ?auto_907620 ?auto_907623 ) ) ( not ( = ?auto_907620 ?auto_907624 ) ) ( not ( = ?auto_907620 ?auto_907625 ) ) ( not ( = ?auto_907621 ?auto_907622 ) ) ( not ( = ?auto_907621 ?auto_907623 ) ) ( not ( = ?auto_907621 ?auto_907624 ) ) ( not ( = ?auto_907621 ?auto_907625 ) ) ( not ( = ?auto_907622 ?auto_907623 ) ) ( not ( = ?auto_907622 ?auto_907624 ) ) ( not ( = ?auto_907622 ?auto_907625 ) ) ( not ( = ?auto_907623 ?auto_907624 ) ) ( not ( = ?auto_907623 ?auto_907625 ) ) ( not ( = ?auto_907624 ?auto_907625 ) ) ( ON ?auto_907623 ?auto_907624 ) ( ON ?auto_907622 ?auto_907623 ) ( ON ?auto_907621 ?auto_907622 ) ( ON ?auto_907620 ?auto_907621 ) ( CLEAR ?auto_907618 ) ( ON ?auto_907619 ?auto_907620 ) ( CLEAR ?auto_907619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_907617 ?auto_907618 ?auto_907619 )
      ( MAKE-8PILE ?auto_907617 ?auto_907618 ?auto_907619 ?auto_907620 ?auto_907621 ?auto_907622 ?auto_907623 ?auto_907624 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907651 - BLOCK
      ?auto_907652 - BLOCK
      ?auto_907653 - BLOCK
      ?auto_907654 - BLOCK
      ?auto_907655 - BLOCK
      ?auto_907656 - BLOCK
      ?auto_907657 - BLOCK
      ?auto_907658 - BLOCK
    )
    :vars
    (
      ?auto_907659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907658 ?auto_907659 ) ( ON-TABLE ?auto_907651 ) ( not ( = ?auto_907651 ?auto_907652 ) ) ( not ( = ?auto_907651 ?auto_907653 ) ) ( not ( = ?auto_907651 ?auto_907654 ) ) ( not ( = ?auto_907651 ?auto_907655 ) ) ( not ( = ?auto_907651 ?auto_907656 ) ) ( not ( = ?auto_907651 ?auto_907657 ) ) ( not ( = ?auto_907651 ?auto_907658 ) ) ( not ( = ?auto_907651 ?auto_907659 ) ) ( not ( = ?auto_907652 ?auto_907653 ) ) ( not ( = ?auto_907652 ?auto_907654 ) ) ( not ( = ?auto_907652 ?auto_907655 ) ) ( not ( = ?auto_907652 ?auto_907656 ) ) ( not ( = ?auto_907652 ?auto_907657 ) ) ( not ( = ?auto_907652 ?auto_907658 ) ) ( not ( = ?auto_907652 ?auto_907659 ) ) ( not ( = ?auto_907653 ?auto_907654 ) ) ( not ( = ?auto_907653 ?auto_907655 ) ) ( not ( = ?auto_907653 ?auto_907656 ) ) ( not ( = ?auto_907653 ?auto_907657 ) ) ( not ( = ?auto_907653 ?auto_907658 ) ) ( not ( = ?auto_907653 ?auto_907659 ) ) ( not ( = ?auto_907654 ?auto_907655 ) ) ( not ( = ?auto_907654 ?auto_907656 ) ) ( not ( = ?auto_907654 ?auto_907657 ) ) ( not ( = ?auto_907654 ?auto_907658 ) ) ( not ( = ?auto_907654 ?auto_907659 ) ) ( not ( = ?auto_907655 ?auto_907656 ) ) ( not ( = ?auto_907655 ?auto_907657 ) ) ( not ( = ?auto_907655 ?auto_907658 ) ) ( not ( = ?auto_907655 ?auto_907659 ) ) ( not ( = ?auto_907656 ?auto_907657 ) ) ( not ( = ?auto_907656 ?auto_907658 ) ) ( not ( = ?auto_907656 ?auto_907659 ) ) ( not ( = ?auto_907657 ?auto_907658 ) ) ( not ( = ?auto_907657 ?auto_907659 ) ) ( not ( = ?auto_907658 ?auto_907659 ) ) ( ON ?auto_907657 ?auto_907658 ) ( ON ?auto_907656 ?auto_907657 ) ( ON ?auto_907655 ?auto_907656 ) ( ON ?auto_907654 ?auto_907655 ) ( ON ?auto_907653 ?auto_907654 ) ( CLEAR ?auto_907651 ) ( ON ?auto_907652 ?auto_907653 ) ( CLEAR ?auto_907652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_907651 ?auto_907652 )
      ( MAKE-8PILE ?auto_907651 ?auto_907652 ?auto_907653 ?auto_907654 ?auto_907655 ?auto_907656 ?auto_907657 ?auto_907658 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_907685 - BLOCK
      ?auto_907686 - BLOCK
      ?auto_907687 - BLOCK
      ?auto_907688 - BLOCK
      ?auto_907689 - BLOCK
      ?auto_907690 - BLOCK
      ?auto_907691 - BLOCK
      ?auto_907692 - BLOCK
    )
    :vars
    (
      ?auto_907693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907692 ?auto_907693 ) ( not ( = ?auto_907685 ?auto_907686 ) ) ( not ( = ?auto_907685 ?auto_907687 ) ) ( not ( = ?auto_907685 ?auto_907688 ) ) ( not ( = ?auto_907685 ?auto_907689 ) ) ( not ( = ?auto_907685 ?auto_907690 ) ) ( not ( = ?auto_907685 ?auto_907691 ) ) ( not ( = ?auto_907685 ?auto_907692 ) ) ( not ( = ?auto_907685 ?auto_907693 ) ) ( not ( = ?auto_907686 ?auto_907687 ) ) ( not ( = ?auto_907686 ?auto_907688 ) ) ( not ( = ?auto_907686 ?auto_907689 ) ) ( not ( = ?auto_907686 ?auto_907690 ) ) ( not ( = ?auto_907686 ?auto_907691 ) ) ( not ( = ?auto_907686 ?auto_907692 ) ) ( not ( = ?auto_907686 ?auto_907693 ) ) ( not ( = ?auto_907687 ?auto_907688 ) ) ( not ( = ?auto_907687 ?auto_907689 ) ) ( not ( = ?auto_907687 ?auto_907690 ) ) ( not ( = ?auto_907687 ?auto_907691 ) ) ( not ( = ?auto_907687 ?auto_907692 ) ) ( not ( = ?auto_907687 ?auto_907693 ) ) ( not ( = ?auto_907688 ?auto_907689 ) ) ( not ( = ?auto_907688 ?auto_907690 ) ) ( not ( = ?auto_907688 ?auto_907691 ) ) ( not ( = ?auto_907688 ?auto_907692 ) ) ( not ( = ?auto_907688 ?auto_907693 ) ) ( not ( = ?auto_907689 ?auto_907690 ) ) ( not ( = ?auto_907689 ?auto_907691 ) ) ( not ( = ?auto_907689 ?auto_907692 ) ) ( not ( = ?auto_907689 ?auto_907693 ) ) ( not ( = ?auto_907690 ?auto_907691 ) ) ( not ( = ?auto_907690 ?auto_907692 ) ) ( not ( = ?auto_907690 ?auto_907693 ) ) ( not ( = ?auto_907691 ?auto_907692 ) ) ( not ( = ?auto_907691 ?auto_907693 ) ) ( not ( = ?auto_907692 ?auto_907693 ) ) ( ON ?auto_907691 ?auto_907692 ) ( ON ?auto_907690 ?auto_907691 ) ( ON ?auto_907689 ?auto_907690 ) ( ON ?auto_907688 ?auto_907689 ) ( ON ?auto_907687 ?auto_907688 ) ( ON ?auto_907686 ?auto_907687 ) ( ON ?auto_907685 ?auto_907686 ) ( CLEAR ?auto_907685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_907685 )
      ( MAKE-8PILE ?auto_907685 ?auto_907686 ?auto_907687 ?auto_907688 ?auto_907689 ?auto_907690 ?auto_907691 ?auto_907692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907720 - BLOCK
      ?auto_907721 - BLOCK
      ?auto_907722 - BLOCK
      ?auto_907723 - BLOCK
      ?auto_907724 - BLOCK
      ?auto_907725 - BLOCK
      ?auto_907726 - BLOCK
      ?auto_907727 - BLOCK
      ?auto_907728 - BLOCK
    )
    :vars
    (
      ?auto_907729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_907727 ) ( ON ?auto_907728 ?auto_907729 ) ( CLEAR ?auto_907728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_907720 ) ( ON ?auto_907721 ?auto_907720 ) ( ON ?auto_907722 ?auto_907721 ) ( ON ?auto_907723 ?auto_907722 ) ( ON ?auto_907724 ?auto_907723 ) ( ON ?auto_907725 ?auto_907724 ) ( ON ?auto_907726 ?auto_907725 ) ( ON ?auto_907727 ?auto_907726 ) ( not ( = ?auto_907720 ?auto_907721 ) ) ( not ( = ?auto_907720 ?auto_907722 ) ) ( not ( = ?auto_907720 ?auto_907723 ) ) ( not ( = ?auto_907720 ?auto_907724 ) ) ( not ( = ?auto_907720 ?auto_907725 ) ) ( not ( = ?auto_907720 ?auto_907726 ) ) ( not ( = ?auto_907720 ?auto_907727 ) ) ( not ( = ?auto_907720 ?auto_907728 ) ) ( not ( = ?auto_907720 ?auto_907729 ) ) ( not ( = ?auto_907721 ?auto_907722 ) ) ( not ( = ?auto_907721 ?auto_907723 ) ) ( not ( = ?auto_907721 ?auto_907724 ) ) ( not ( = ?auto_907721 ?auto_907725 ) ) ( not ( = ?auto_907721 ?auto_907726 ) ) ( not ( = ?auto_907721 ?auto_907727 ) ) ( not ( = ?auto_907721 ?auto_907728 ) ) ( not ( = ?auto_907721 ?auto_907729 ) ) ( not ( = ?auto_907722 ?auto_907723 ) ) ( not ( = ?auto_907722 ?auto_907724 ) ) ( not ( = ?auto_907722 ?auto_907725 ) ) ( not ( = ?auto_907722 ?auto_907726 ) ) ( not ( = ?auto_907722 ?auto_907727 ) ) ( not ( = ?auto_907722 ?auto_907728 ) ) ( not ( = ?auto_907722 ?auto_907729 ) ) ( not ( = ?auto_907723 ?auto_907724 ) ) ( not ( = ?auto_907723 ?auto_907725 ) ) ( not ( = ?auto_907723 ?auto_907726 ) ) ( not ( = ?auto_907723 ?auto_907727 ) ) ( not ( = ?auto_907723 ?auto_907728 ) ) ( not ( = ?auto_907723 ?auto_907729 ) ) ( not ( = ?auto_907724 ?auto_907725 ) ) ( not ( = ?auto_907724 ?auto_907726 ) ) ( not ( = ?auto_907724 ?auto_907727 ) ) ( not ( = ?auto_907724 ?auto_907728 ) ) ( not ( = ?auto_907724 ?auto_907729 ) ) ( not ( = ?auto_907725 ?auto_907726 ) ) ( not ( = ?auto_907725 ?auto_907727 ) ) ( not ( = ?auto_907725 ?auto_907728 ) ) ( not ( = ?auto_907725 ?auto_907729 ) ) ( not ( = ?auto_907726 ?auto_907727 ) ) ( not ( = ?auto_907726 ?auto_907728 ) ) ( not ( = ?auto_907726 ?auto_907729 ) ) ( not ( = ?auto_907727 ?auto_907728 ) ) ( not ( = ?auto_907727 ?auto_907729 ) ) ( not ( = ?auto_907728 ?auto_907729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_907728 ?auto_907729 )
      ( !STACK ?auto_907728 ?auto_907727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907758 - BLOCK
      ?auto_907759 - BLOCK
      ?auto_907760 - BLOCK
      ?auto_907761 - BLOCK
      ?auto_907762 - BLOCK
      ?auto_907763 - BLOCK
      ?auto_907764 - BLOCK
      ?auto_907765 - BLOCK
      ?auto_907766 - BLOCK
    )
    :vars
    (
      ?auto_907767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907766 ?auto_907767 ) ( ON-TABLE ?auto_907758 ) ( ON ?auto_907759 ?auto_907758 ) ( ON ?auto_907760 ?auto_907759 ) ( ON ?auto_907761 ?auto_907760 ) ( ON ?auto_907762 ?auto_907761 ) ( ON ?auto_907763 ?auto_907762 ) ( ON ?auto_907764 ?auto_907763 ) ( not ( = ?auto_907758 ?auto_907759 ) ) ( not ( = ?auto_907758 ?auto_907760 ) ) ( not ( = ?auto_907758 ?auto_907761 ) ) ( not ( = ?auto_907758 ?auto_907762 ) ) ( not ( = ?auto_907758 ?auto_907763 ) ) ( not ( = ?auto_907758 ?auto_907764 ) ) ( not ( = ?auto_907758 ?auto_907765 ) ) ( not ( = ?auto_907758 ?auto_907766 ) ) ( not ( = ?auto_907758 ?auto_907767 ) ) ( not ( = ?auto_907759 ?auto_907760 ) ) ( not ( = ?auto_907759 ?auto_907761 ) ) ( not ( = ?auto_907759 ?auto_907762 ) ) ( not ( = ?auto_907759 ?auto_907763 ) ) ( not ( = ?auto_907759 ?auto_907764 ) ) ( not ( = ?auto_907759 ?auto_907765 ) ) ( not ( = ?auto_907759 ?auto_907766 ) ) ( not ( = ?auto_907759 ?auto_907767 ) ) ( not ( = ?auto_907760 ?auto_907761 ) ) ( not ( = ?auto_907760 ?auto_907762 ) ) ( not ( = ?auto_907760 ?auto_907763 ) ) ( not ( = ?auto_907760 ?auto_907764 ) ) ( not ( = ?auto_907760 ?auto_907765 ) ) ( not ( = ?auto_907760 ?auto_907766 ) ) ( not ( = ?auto_907760 ?auto_907767 ) ) ( not ( = ?auto_907761 ?auto_907762 ) ) ( not ( = ?auto_907761 ?auto_907763 ) ) ( not ( = ?auto_907761 ?auto_907764 ) ) ( not ( = ?auto_907761 ?auto_907765 ) ) ( not ( = ?auto_907761 ?auto_907766 ) ) ( not ( = ?auto_907761 ?auto_907767 ) ) ( not ( = ?auto_907762 ?auto_907763 ) ) ( not ( = ?auto_907762 ?auto_907764 ) ) ( not ( = ?auto_907762 ?auto_907765 ) ) ( not ( = ?auto_907762 ?auto_907766 ) ) ( not ( = ?auto_907762 ?auto_907767 ) ) ( not ( = ?auto_907763 ?auto_907764 ) ) ( not ( = ?auto_907763 ?auto_907765 ) ) ( not ( = ?auto_907763 ?auto_907766 ) ) ( not ( = ?auto_907763 ?auto_907767 ) ) ( not ( = ?auto_907764 ?auto_907765 ) ) ( not ( = ?auto_907764 ?auto_907766 ) ) ( not ( = ?auto_907764 ?auto_907767 ) ) ( not ( = ?auto_907765 ?auto_907766 ) ) ( not ( = ?auto_907765 ?auto_907767 ) ) ( not ( = ?auto_907766 ?auto_907767 ) ) ( CLEAR ?auto_907764 ) ( ON ?auto_907765 ?auto_907766 ) ( CLEAR ?auto_907765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_907758 ?auto_907759 ?auto_907760 ?auto_907761 ?auto_907762 ?auto_907763 ?auto_907764 ?auto_907765 )
      ( MAKE-9PILE ?auto_907758 ?auto_907759 ?auto_907760 ?auto_907761 ?auto_907762 ?auto_907763 ?auto_907764 ?auto_907765 ?auto_907766 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907796 - BLOCK
      ?auto_907797 - BLOCK
      ?auto_907798 - BLOCK
      ?auto_907799 - BLOCK
      ?auto_907800 - BLOCK
      ?auto_907801 - BLOCK
      ?auto_907802 - BLOCK
      ?auto_907803 - BLOCK
      ?auto_907804 - BLOCK
    )
    :vars
    (
      ?auto_907805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907804 ?auto_907805 ) ( ON-TABLE ?auto_907796 ) ( ON ?auto_907797 ?auto_907796 ) ( ON ?auto_907798 ?auto_907797 ) ( ON ?auto_907799 ?auto_907798 ) ( ON ?auto_907800 ?auto_907799 ) ( ON ?auto_907801 ?auto_907800 ) ( not ( = ?auto_907796 ?auto_907797 ) ) ( not ( = ?auto_907796 ?auto_907798 ) ) ( not ( = ?auto_907796 ?auto_907799 ) ) ( not ( = ?auto_907796 ?auto_907800 ) ) ( not ( = ?auto_907796 ?auto_907801 ) ) ( not ( = ?auto_907796 ?auto_907802 ) ) ( not ( = ?auto_907796 ?auto_907803 ) ) ( not ( = ?auto_907796 ?auto_907804 ) ) ( not ( = ?auto_907796 ?auto_907805 ) ) ( not ( = ?auto_907797 ?auto_907798 ) ) ( not ( = ?auto_907797 ?auto_907799 ) ) ( not ( = ?auto_907797 ?auto_907800 ) ) ( not ( = ?auto_907797 ?auto_907801 ) ) ( not ( = ?auto_907797 ?auto_907802 ) ) ( not ( = ?auto_907797 ?auto_907803 ) ) ( not ( = ?auto_907797 ?auto_907804 ) ) ( not ( = ?auto_907797 ?auto_907805 ) ) ( not ( = ?auto_907798 ?auto_907799 ) ) ( not ( = ?auto_907798 ?auto_907800 ) ) ( not ( = ?auto_907798 ?auto_907801 ) ) ( not ( = ?auto_907798 ?auto_907802 ) ) ( not ( = ?auto_907798 ?auto_907803 ) ) ( not ( = ?auto_907798 ?auto_907804 ) ) ( not ( = ?auto_907798 ?auto_907805 ) ) ( not ( = ?auto_907799 ?auto_907800 ) ) ( not ( = ?auto_907799 ?auto_907801 ) ) ( not ( = ?auto_907799 ?auto_907802 ) ) ( not ( = ?auto_907799 ?auto_907803 ) ) ( not ( = ?auto_907799 ?auto_907804 ) ) ( not ( = ?auto_907799 ?auto_907805 ) ) ( not ( = ?auto_907800 ?auto_907801 ) ) ( not ( = ?auto_907800 ?auto_907802 ) ) ( not ( = ?auto_907800 ?auto_907803 ) ) ( not ( = ?auto_907800 ?auto_907804 ) ) ( not ( = ?auto_907800 ?auto_907805 ) ) ( not ( = ?auto_907801 ?auto_907802 ) ) ( not ( = ?auto_907801 ?auto_907803 ) ) ( not ( = ?auto_907801 ?auto_907804 ) ) ( not ( = ?auto_907801 ?auto_907805 ) ) ( not ( = ?auto_907802 ?auto_907803 ) ) ( not ( = ?auto_907802 ?auto_907804 ) ) ( not ( = ?auto_907802 ?auto_907805 ) ) ( not ( = ?auto_907803 ?auto_907804 ) ) ( not ( = ?auto_907803 ?auto_907805 ) ) ( not ( = ?auto_907804 ?auto_907805 ) ) ( ON ?auto_907803 ?auto_907804 ) ( CLEAR ?auto_907801 ) ( ON ?auto_907802 ?auto_907803 ) ( CLEAR ?auto_907802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_907796 ?auto_907797 ?auto_907798 ?auto_907799 ?auto_907800 ?auto_907801 ?auto_907802 )
      ( MAKE-9PILE ?auto_907796 ?auto_907797 ?auto_907798 ?auto_907799 ?auto_907800 ?auto_907801 ?auto_907802 ?auto_907803 ?auto_907804 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907834 - BLOCK
      ?auto_907835 - BLOCK
      ?auto_907836 - BLOCK
      ?auto_907837 - BLOCK
      ?auto_907838 - BLOCK
      ?auto_907839 - BLOCK
      ?auto_907840 - BLOCK
      ?auto_907841 - BLOCK
      ?auto_907842 - BLOCK
    )
    :vars
    (
      ?auto_907843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907842 ?auto_907843 ) ( ON-TABLE ?auto_907834 ) ( ON ?auto_907835 ?auto_907834 ) ( ON ?auto_907836 ?auto_907835 ) ( ON ?auto_907837 ?auto_907836 ) ( ON ?auto_907838 ?auto_907837 ) ( not ( = ?auto_907834 ?auto_907835 ) ) ( not ( = ?auto_907834 ?auto_907836 ) ) ( not ( = ?auto_907834 ?auto_907837 ) ) ( not ( = ?auto_907834 ?auto_907838 ) ) ( not ( = ?auto_907834 ?auto_907839 ) ) ( not ( = ?auto_907834 ?auto_907840 ) ) ( not ( = ?auto_907834 ?auto_907841 ) ) ( not ( = ?auto_907834 ?auto_907842 ) ) ( not ( = ?auto_907834 ?auto_907843 ) ) ( not ( = ?auto_907835 ?auto_907836 ) ) ( not ( = ?auto_907835 ?auto_907837 ) ) ( not ( = ?auto_907835 ?auto_907838 ) ) ( not ( = ?auto_907835 ?auto_907839 ) ) ( not ( = ?auto_907835 ?auto_907840 ) ) ( not ( = ?auto_907835 ?auto_907841 ) ) ( not ( = ?auto_907835 ?auto_907842 ) ) ( not ( = ?auto_907835 ?auto_907843 ) ) ( not ( = ?auto_907836 ?auto_907837 ) ) ( not ( = ?auto_907836 ?auto_907838 ) ) ( not ( = ?auto_907836 ?auto_907839 ) ) ( not ( = ?auto_907836 ?auto_907840 ) ) ( not ( = ?auto_907836 ?auto_907841 ) ) ( not ( = ?auto_907836 ?auto_907842 ) ) ( not ( = ?auto_907836 ?auto_907843 ) ) ( not ( = ?auto_907837 ?auto_907838 ) ) ( not ( = ?auto_907837 ?auto_907839 ) ) ( not ( = ?auto_907837 ?auto_907840 ) ) ( not ( = ?auto_907837 ?auto_907841 ) ) ( not ( = ?auto_907837 ?auto_907842 ) ) ( not ( = ?auto_907837 ?auto_907843 ) ) ( not ( = ?auto_907838 ?auto_907839 ) ) ( not ( = ?auto_907838 ?auto_907840 ) ) ( not ( = ?auto_907838 ?auto_907841 ) ) ( not ( = ?auto_907838 ?auto_907842 ) ) ( not ( = ?auto_907838 ?auto_907843 ) ) ( not ( = ?auto_907839 ?auto_907840 ) ) ( not ( = ?auto_907839 ?auto_907841 ) ) ( not ( = ?auto_907839 ?auto_907842 ) ) ( not ( = ?auto_907839 ?auto_907843 ) ) ( not ( = ?auto_907840 ?auto_907841 ) ) ( not ( = ?auto_907840 ?auto_907842 ) ) ( not ( = ?auto_907840 ?auto_907843 ) ) ( not ( = ?auto_907841 ?auto_907842 ) ) ( not ( = ?auto_907841 ?auto_907843 ) ) ( not ( = ?auto_907842 ?auto_907843 ) ) ( ON ?auto_907841 ?auto_907842 ) ( ON ?auto_907840 ?auto_907841 ) ( CLEAR ?auto_907838 ) ( ON ?auto_907839 ?auto_907840 ) ( CLEAR ?auto_907839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_907834 ?auto_907835 ?auto_907836 ?auto_907837 ?auto_907838 ?auto_907839 )
      ( MAKE-9PILE ?auto_907834 ?auto_907835 ?auto_907836 ?auto_907837 ?auto_907838 ?auto_907839 ?auto_907840 ?auto_907841 ?auto_907842 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907872 - BLOCK
      ?auto_907873 - BLOCK
      ?auto_907874 - BLOCK
      ?auto_907875 - BLOCK
      ?auto_907876 - BLOCK
      ?auto_907877 - BLOCK
      ?auto_907878 - BLOCK
      ?auto_907879 - BLOCK
      ?auto_907880 - BLOCK
    )
    :vars
    (
      ?auto_907881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907880 ?auto_907881 ) ( ON-TABLE ?auto_907872 ) ( ON ?auto_907873 ?auto_907872 ) ( ON ?auto_907874 ?auto_907873 ) ( ON ?auto_907875 ?auto_907874 ) ( not ( = ?auto_907872 ?auto_907873 ) ) ( not ( = ?auto_907872 ?auto_907874 ) ) ( not ( = ?auto_907872 ?auto_907875 ) ) ( not ( = ?auto_907872 ?auto_907876 ) ) ( not ( = ?auto_907872 ?auto_907877 ) ) ( not ( = ?auto_907872 ?auto_907878 ) ) ( not ( = ?auto_907872 ?auto_907879 ) ) ( not ( = ?auto_907872 ?auto_907880 ) ) ( not ( = ?auto_907872 ?auto_907881 ) ) ( not ( = ?auto_907873 ?auto_907874 ) ) ( not ( = ?auto_907873 ?auto_907875 ) ) ( not ( = ?auto_907873 ?auto_907876 ) ) ( not ( = ?auto_907873 ?auto_907877 ) ) ( not ( = ?auto_907873 ?auto_907878 ) ) ( not ( = ?auto_907873 ?auto_907879 ) ) ( not ( = ?auto_907873 ?auto_907880 ) ) ( not ( = ?auto_907873 ?auto_907881 ) ) ( not ( = ?auto_907874 ?auto_907875 ) ) ( not ( = ?auto_907874 ?auto_907876 ) ) ( not ( = ?auto_907874 ?auto_907877 ) ) ( not ( = ?auto_907874 ?auto_907878 ) ) ( not ( = ?auto_907874 ?auto_907879 ) ) ( not ( = ?auto_907874 ?auto_907880 ) ) ( not ( = ?auto_907874 ?auto_907881 ) ) ( not ( = ?auto_907875 ?auto_907876 ) ) ( not ( = ?auto_907875 ?auto_907877 ) ) ( not ( = ?auto_907875 ?auto_907878 ) ) ( not ( = ?auto_907875 ?auto_907879 ) ) ( not ( = ?auto_907875 ?auto_907880 ) ) ( not ( = ?auto_907875 ?auto_907881 ) ) ( not ( = ?auto_907876 ?auto_907877 ) ) ( not ( = ?auto_907876 ?auto_907878 ) ) ( not ( = ?auto_907876 ?auto_907879 ) ) ( not ( = ?auto_907876 ?auto_907880 ) ) ( not ( = ?auto_907876 ?auto_907881 ) ) ( not ( = ?auto_907877 ?auto_907878 ) ) ( not ( = ?auto_907877 ?auto_907879 ) ) ( not ( = ?auto_907877 ?auto_907880 ) ) ( not ( = ?auto_907877 ?auto_907881 ) ) ( not ( = ?auto_907878 ?auto_907879 ) ) ( not ( = ?auto_907878 ?auto_907880 ) ) ( not ( = ?auto_907878 ?auto_907881 ) ) ( not ( = ?auto_907879 ?auto_907880 ) ) ( not ( = ?auto_907879 ?auto_907881 ) ) ( not ( = ?auto_907880 ?auto_907881 ) ) ( ON ?auto_907879 ?auto_907880 ) ( ON ?auto_907878 ?auto_907879 ) ( ON ?auto_907877 ?auto_907878 ) ( CLEAR ?auto_907875 ) ( ON ?auto_907876 ?auto_907877 ) ( CLEAR ?auto_907876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_907872 ?auto_907873 ?auto_907874 ?auto_907875 ?auto_907876 )
      ( MAKE-9PILE ?auto_907872 ?auto_907873 ?auto_907874 ?auto_907875 ?auto_907876 ?auto_907877 ?auto_907878 ?auto_907879 ?auto_907880 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907910 - BLOCK
      ?auto_907911 - BLOCK
      ?auto_907912 - BLOCK
      ?auto_907913 - BLOCK
      ?auto_907914 - BLOCK
      ?auto_907915 - BLOCK
      ?auto_907916 - BLOCK
      ?auto_907917 - BLOCK
      ?auto_907918 - BLOCK
    )
    :vars
    (
      ?auto_907919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907918 ?auto_907919 ) ( ON-TABLE ?auto_907910 ) ( ON ?auto_907911 ?auto_907910 ) ( ON ?auto_907912 ?auto_907911 ) ( not ( = ?auto_907910 ?auto_907911 ) ) ( not ( = ?auto_907910 ?auto_907912 ) ) ( not ( = ?auto_907910 ?auto_907913 ) ) ( not ( = ?auto_907910 ?auto_907914 ) ) ( not ( = ?auto_907910 ?auto_907915 ) ) ( not ( = ?auto_907910 ?auto_907916 ) ) ( not ( = ?auto_907910 ?auto_907917 ) ) ( not ( = ?auto_907910 ?auto_907918 ) ) ( not ( = ?auto_907910 ?auto_907919 ) ) ( not ( = ?auto_907911 ?auto_907912 ) ) ( not ( = ?auto_907911 ?auto_907913 ) ) ( not ( = ?auto_907911 ?auto_907914 ) ) ( not ( = ?auto_907911 ?auto_907915 ) ) ( not ( = ?auto_907911 ?auto_907916 ) ) ( not ( = ?auto_907911 ?auto_907917 ) ) ( not ( = ?auto_907911 ?auto_907918 ) ) ( not ( = ?auto_907911 ?auto_907919 ) ) ( not ( = ?auto_907912 ?auto_907913 ) ) ( not ( = ?auto_907912 ?auto_907914 ) ) ( not ( = ?auto_907912 ?auto_907915 ) ) ( not ( = ?auto_907912 ?auto_907916 ) ) ( not ( = ?auto_907912 ?auto_907917 ) ) ( not ( = ?auto_907912 ?auto_907918 ) ) ( not ( = ?auto_907912 ?auto_907919 ) ) ( not ( = ?auto_907913 ?auto_907914 ) ) ( not ( = ?auto_907913 ?auto_907915 ) ) ( not ( = ?auto_907913 ?auto_907916 ) ) ( not ( = ?auto_907913 ?auto_907917 ) ) ( not ( = ?auto_907913 ?auto_907918 ) ) ( not ( = ?auto_907913 ?auto_907919 ) ) ( not ( = ?auto_907914 ?auto_907915 ) ) ( not ( = ?auto_907914 ?auto_907916 ) ) ( not ( = ?auto_907914 ?auto_907917 ) ) ( not ( = ?auto_907914 ?auto_907918 ) ) ( not ( = ?auto_907914 ?auto_907919 ) ) ( not ( = ?auto_907915 ?auto_907916 ) ) ( not ( = ?auto_907915 ?auto_907917 ) ) ( not ( = ?auto_907915 ?auto_907918 ) ) ( not ( = ?auto_907915 ?auto_907919 ) ) ( not ( = ?auto_907916 ?auto_907917 ) ) ( not ( = ?auto_907916 ?auto_907918 ) ) ( not ( = ?auto_907916 ?auto_907919 ) ) ( not ( = ?auto_907917 ?auto_907918 ) ) ( not ( = ?auto_907917 ?auto_907919 ) ) ( not ( = ?auto_907918 ?auto_907919 ) ) ( ON ?auto_907917 ?auto_907918 ) ( ON ?auto_907916 ?auto_907917 ) ( ON ?auto_907915 ?auto_907916 ) ( ON ?auto_907914 ?auto_907915 ) ( CLEAR ?auto_907912 ) ( ON ?auto_907913 ?auto_907914 ) ( CLEAR ?auto_907913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_907910 ?auto_907911 ?auto_907912 ?auto_907913 )
      ( MAKE-9PILE ?auto_907910 ?auto_907911 ?auto_907912 ?auto_907913 ?auto_907914 ?auto_907915 ?auto_907916 ?auto_907917 ?auto_907918 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907948 - BLOCK
      ?auto_907949 - BLOCK
      ?auto_907950 - BLOCK
      ?auto_907951 - BLOCK
      ?auto_907952 - BLOCK
      ?auto_907953 - BLOCK
      ?auto_907954 - BLOCK
      ?auto_907955 - BLOCK
      ?auto_907956 - BLOCK
    )
    :vars
    (
      ?auto_907957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907956 ?auto_907957 ) ( ON-TABLE ?auto_907948 ) ( ON ?auto_907949 ?auto_907948 ) ( not ( = ?auto_907948 ?auto_907949 ) ) ( not ( = ?auto_907948 ?auto_907950 ) ) ( not ( = ?auto_907948 ?auto_907951 ) ) ( not ( = ?auto_907948 ?auto_907952 ) ) ( not ( = ?auto_907948 ?auto_907953 ) ) ( not ( = ?auto_907948 ?auto_907954 ) ) ( not ( = ?auto_907948 ?auto_907955 ) ) ( not ( = ?auto_907948 ?auto_907956 ) ) ( not ( = ?auto_907948 ?auto_907957 ) ) ( not ( = ?auto_907949 ?auto_907950 ) ) ( not ( = ?auto_907949 ?auto_907951 ) ) ( not ( = ?auto_907949 ?auto_907952 ) ) ( not ( = ?auto_907949 ?auto_907953 ) ) ( not ( = ?auto_907949 ?auto_907954 ) ) ( not ( = ?auto_907949 ?auto_907955 ) ) ( not ( = ?auto_907949 ?auto_907956 ) ) ( not ( = ?auto_907949 ?auto_907957 ) ) ( not ( = ?auto_907950 ?auto_907951 ) ) ( not ( = ?auto_907950 ?auto_907952 ) ) ( not ( = ?auto_907950 ?auto_907953 ) ) ( not ( = ?auto_907950 ?auto_907954 ) ) ( not ( = ?auto_907950 ?auto_907955 ) ) ( not ( = ?auto_907950 ?auto_907956 ) ) ( not ( = ?auto_907950 ?auto_907957 ) ) ( not ( = ?auto_907951 ?auto_907952 ) ) ( not ( = ?auto_907951 ?auto_907953 ) ) ( not ( = ?auto_907951 ?auto_907954 ) ) ( not ( = ?auto_907951 ?auto_907955 ) ) ( not ( = ?auto_907951 ?auto_907956 ) ) ( not ( = ?auto_907951 ?auto_907957 ) ) ( not ( = ?auto_907952 ?auto_907953 ) ) ( not ( = ?auto_907952 ?auto_907954 ) ) ( not ( = ?auto_907952 ?auto_907955 ) ) ( not ( = ?auto_907952 ?auto_907956 ) ) ( not ( = ?auto_907952 ?auto_907957 ) ) ( not ( = ?auto_907953 ?auto_907954 ) ) ( not ( = ?auto_907953 ?auto_907955 ) ) ( not ( = ?auto_907953 ?auto_907956 ) ) ( not ( = ?auto_907953 ?auto_907957 ) ) ( not ( = ?auto_907954 ?auto_907955 ) ) ( not ( = ?auto_907954 ?auto_907956 ) ) ( not ( = ?auto_907954 ?auto_907957 ) ) ( not ( = ?auto_907955 ?auto_907956 ) ) ( not ( = ?auto_907955 ?auto_907957 ) ) ( not ( = ?auto_907956 ?auto_907957 ) ) ( ON ?auto_907955 ?auto_907956 ) ( ON ?auto_907954 ?auto_907955 ) ( ON ?auto_907953 ?auto_907954 ) ( ON ?auto_907952 ?auto_907953 ) ( ON ?auto_907951 ?auto_907952 ) ( CLEAR ?auto_907949 ) ( ON ?auto_907950 ?auto_907951 ) ( CLEAR ?auto_907950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_907948 ?auto_907949 ?auto_907950 )
      ( MAKE-9PILE ?auto_907948 ?auto_907949 ?auto_907950 ?auto_907951 ?auto_907952 ?auto_907953 ?auto_907954 ?auto_907955 ?auto_907956 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_907986 - BLOCK
      ?auto_907987 - BLOCK
      ?auto_907988 - BLOCK
      ?auto_907989 - BLOCK
      ?auto_907990 - BLOCK
      ?auto_907991 - BLOCK
      ?auto_907992 - BLOCK
      ?auto_907993 - BLOCK
      ?auto_907994 - BLOCK
    )
    :vars
    (
      ?auto_907995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_907994 ?auto_907995 ) ( ON-TABLE ?auto_907986 ) ( not ( = ?auto_907986 ?auto_907987 ) ) ( not ( = ?auto_907986 ?auto_907988 ) ) ( not ( = ?auto_907986 ?auto_907989 ) ) ( not ( = ?auto_907986 ?auto_907990 ) ) ( not ( = ?auto_907986 ?auto_907991 ) ) ( not ( = ?auto_907986 ?auto_907992 ) ) ( not ( = ?auto_907986 ?auto_907993 ) ) ( not ( = ?auto_907986 ?auto_907994 ) ) ( not ( = ?auto_907986 ?auto_907995 ) ) ( not ( = ?auto_907987 ?auto_907988 ) ) ( not ( = ?auto_907987 ?auto_907989 ) ) ( not ( = ?auto_907987 ?auto_907990 ) ) ( not ( = ?auto_907987 ?auto_907991 ) ) ( not ( = ?auto_907987 ?auto_907992 ) ) ( not ( = ?auto_907987 ?auto_907993 ) ) ( not ( = ?auto_907987 ?auto_907994 ) ) ( not ( = ?auto_907987 ?auto_907995 ) ) ( not ( = ?auto_907988 ?auto_907989 ) ) ( not ( = ?auto_907988 ?auto_907990 ) ) ( not ( = ?auto_907988 ?auto_907991 ) ) ( not ( = ?auto_907988 ?auto_907992 ) ) ( not ( = ?auto_907988 ?auto_907993 ) ) ( not ( = ?auto_907988 ?auto_907994 ) ) ( not ( = ?auto_907988 ?auto_907995 ) ) ( not ( = ?auto_907989 ?auto_907990 ) ) ( not ( = ?auto_907989 ?auto_907991 ) ) ( not ( = ?auto_907989 ?auto_907992 ) ) ( not ( = ?auto_907989 ?auto_907993 ) ) ( not ( = ?auto_907989 ?auto_907994 ) ) ( not ( = ?auto_907989 ?auto_907995 ) ) ( not ( = ?auto_907990 ?auto_907991 ) ) ( not ( = ?auto_907990 ?auto_907992 ) ) ( not ( = ?auto_907990 ?auto_907993 ) ) ( not ( = ?auto_907990 ?auto_907994 ) ) ( not ( = ?auto_907990 ?auto_907995 ) ) ( not ( = ?auto_907991 ?auto_907992 ) ) ( not ( = ?auto_907991 ?auto_907993 ) ) ( not ( = ?auto_907991 ?auto_907994 ) ) ( not ( = ?auto_907991 ?auto_907995 ) ) ( not ( = ?auto_907992 ?auto_907993 ) ) ( not ( = ?auto_907992 ?auto_907994 ) ) ( not ( = ?auto_907992 ?auto_907995 ) ) ( not ( = ?auto_907993 ?auto_907994 ) ) ( not ( = ?auto_907993 ?auto_907995 ) ) ( not ( = ?auto_907994 ?auto_907995 ) ) ( ON ?auto_907993 ?auto_907994 ) ( ON ?auto_907992 ?auto_907993 ) ( ON ?auto_907991 ?auto_907992 ) ( ON ?auto_907990 ?auto_907991 ) ( ON ?auto_907989 ?auto_907990 ) ( ON ?auto_907988 ?auto_907989 ) ( CLEAR ?auto_907986 ) ( ON ?auto_907987 ?auto_907988 ) ( CLEAR ?auto_907987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_907986 ?auto_907987 )
      ( MAKE-9PILE ?auto_907986 ?auto_907987 ?auto_907988 ?auto_907989 ?auto_907990 ?auto_907991 ?auto_907992 ?auto_907993 ?auto_907994 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_908024 - BLOCK
      ?auto_908025 - BLOCK
      ?auto_908026 - BLOCK
      ?auto_908027 - BLOCK
      ?auto_908028 - BLOCK
      ?auto_908029 - BLOCK
      ?auto_908030 - BLOCK
      ?auto_908031 - BLOCK
      ?auto_908032 - BLOCK
    )
    :vars
    (
      ?auto_908033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908032 ?auto_908033 ) ( not ( = ?auto_908024 ?auto_908025 ) ) ( not ( = ?auto_908024 ?auto_908026 ) ) ( not ( = ?auto_908024 ?auto_908027 ) ) ( not ( = ?auto_908024 ?auto_908028 ) ) ( not ( = ?auto_908024 ?auto_908029 ) ) ( not ( = ?auto_908024 ?auto_908030 ) ) ( not ( = ?auto_908024 ?auto_908031 ) ) ( not ( = ?auto_908024 ?auto_908032 ) ) ( not ( = ?auto_908024 ?auto_908033 ) ) ( not ( = ?auto_908025 ?auto_908026 ) ) ( not ( = ?auto_908025 ?auto_908027 ) ) ( not ( = ?auto_908025 ?auto_908028 ) ) ( not ( = ?auto_908025 ?auto_908029 ) ) ( not ( = ?auto_908025 ?auto_908030 ) ) ( not ( = ?auto_908025 ?auto_908031 ) ) ( not ( = ?auto_908025 ?auto_908032 ) ) ( not ( = ?auto_908025 ?auto_908033 ) ) ( not ( = ?auto_908026 ?auto_908027 ) ) ( not ( = ?auto_908026 ?auto_908028 ) ) ( not ( = ?auto_908026 ?auto_908029 ) ) ( not ( = ?auto_908026 ?auto_908030 ) ) ( not ( = ?auto_908026 ?auto_908031 ) ) ( not ( = ?auto_908026 ?auto_908032 ) ) ( not ( = ?auto_908026 ?auto_908033 ) ) ( not ( = ?auto_908027 ?auto_908028 ) ) ( not ( = ?auto_908027 ?auto_908029 ) ) ( not ( = ?auto_908027 ?auto_908030 ) ) ( not ( = ?auto_908027 ?auto_908031 ) ) ( not ( = ?auto_908027 ?auto_908032 ) ) ( not ( = ?auto_908027 ?auto_908033 ) ) ( not ( = ?auto_908028 ?auto_908029 ) ) ( not ( = ?auto_908028 ?auto_908030 ) ) ( not ( = ?auto_908028 ?auto_908031 ) ) ( not ( = ?auto_908028 ?auto_908032 ) ) ( not ( = ?auto_908028 ?auto_908033 ) ) ( not ( = ?auto_908029 ?auto_908030 ) ) ( not ( = ?auto_908029 ?auto_908031 ) ) ( not ( = ?auto_908029 ?auto_908032 ) ) ( not ( = ?auto_908029 ?auto_908033 ) ) ( not ( = ?auto_908030 ?auto_908031 ) ) ( not ( = ?auto_908030 ?auto_908032 ) ) ( not ( = ?auto_908030 ?auto_908033 ) ) ( not ( = ?auto_908031 ?auto_908032 ) ) ( not ( = ?auto_908031 ?auto_908033 ) ) ( not ( = ?auto_908032 ?auto_908033 ) ) ( ON ?auto_908031 ?auto_908032 ) ( ON ?auto_908030 ?auto_908031 ) ( ON ?auto_908029 ?auto_908030 ) ( ON ?auto_908028 ?auto_908029 ) ( ON ?auto_908027 ?auto_908028 ) ( ON ?auto_908026 ?auto_908027 ) ( ON ?auto_908025 ?auto_908026 ) ( ON ?auto_908024 ?auto_908025 ) ( CLEAR ?auto_908024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_908024 )
      ( MAKE-9PILE ?auto_908024 ?auto_908025 ?auto_908026 ?auto_908027 ?auto_908028 ?auto_908029 ?auto_908030 ?auto_908031 ?auto_908032 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908063 - BLOCK
      ?auto_908064 - BLOCK
      ?auto_908065 - BLOCK
      ?auto_908066 - BLOCK
      ?auto_908067 - BLOCK
      ?auto_908068 - BLOCK
      ?auto_908069 - BLOCK
      ?auto_908070 - BLOCK
      ?auto_908071 - BLOCK
      ?auto_908072 - BLOCK
    )
    :vars
    (
      ?auto_908073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_908071 ) ( ON ?auto_908072 ?auto_908073 ) ( CLEAR ?auto_908072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_908063 ) ( ON ?auto_908064 ?auto_908063 ) ( ON ?auto_908065 ?auto_908064 ) ( ON ?auto_908066 ?auto_908065 ) ( ON ?auto_908067 ?auto_908066 ) ( ON ?auto_908068 ?auto_908067 ) ( ON ?auto_908069 ?auto_908068 ) ( ON ?auto_908070 ?auto_908069 ) ( ON ?auto_908071 ?auto_908070 ) ( not ( = ?auto_908063 ?auto_908064 ) ) ( not ( = ?auto_908063 ?auto_908065 ) ) ( not ( = ?auto_908063 ?auto_908066 ) ) ( not ( = ?auto_908063 ?auto_908067 ) ) ( not ( = ?auto_908063 ?auto_908068 ) ) ( not ( = ?auto_908063 ?auto_908069 ) ) ( not ( = ?auto_908063 ?auto_908070 ) ) ( not ( = ?auto_908063 ?auto_908071 ) ) ( not ( = ?auto_908063 ?auto_908072 ) ) ( not ( = ?auto_908063 ?auto_908073 ) ) ( not ( = ?auto_908064 ?auto_908065 ) ) ( not ( = ?auto_908064 ?auto_908066 ) ) ( not ( = ?auto_908064 ?auto_908067 ) ) ( not ( = ?auto_908064 ?auto_908068 ) ) ( not ( = ?auto_908064 ?auto_908069 ) ) ( not ( = ?auto_908064 ?auto_908070 ) ) ( not ( = ?auto_908064 ?auto_908071 ) ) ( not ( = ?auto_908064 ?auto_908072 ) ) ( not ( = ?auto_908064 ?auto_908073 ) ) ( not ( = ?auto_908065 ?auto_908066 ) ) ( not ( = ?auto_908065 ?auto_908067 ) ) ( not ( = ?auto_908065 ?auto_908068 ) ) ( not ( = ?auto_908065 ?auto_908069 ) ) ( not ( = ?auto_908065 ?auto_908070 ) ) ( not ( = ?auto_908065 ?auto_908071 ) ) ( not ( = ?auto_908065 ?auto_908072 ) ) ( not ( = ?auto_908065 ?auto_908073 ) ) ( not ( = ?auto_908066 ?auto_908067 ) ) ( not ( = ?auto_908066 ?auto_908068 ) ) ( not ( = ?auto_908066 ?auto_908069 ) ) ( not ( = ?auto_908066 ?auto_908070 ) ) ( not ( = ?auto_908066 ?auto_908071 ) ) ( not ( = ?auto_908066 ?auto_908072 ) ) ( not ( = ?auto_908066 ?auto_908073 ) ) ( not ( = ?auto_908067 ?auto_908068 ) ) ( not ( = ?auto_908067 ?auto_908069 ) ) ( not ( = ?auto_908067 ?auto_908070 ) ) ( not ( = ?auto_908067 ?auto_908071 ) ) ( not ( = ?auto_908067 ?auto_908072 ) ) ( not ( = ?auto_908067 ?auto_908073 ) ) ( not ( = ?auto_908068 ?auto_908069 ) ) ( not ( = ?auto_908068 ?auto_908070 ) ) ( not ( = ?auto_908068 ?auto_908071 ) ) ( not ( = ?auto_908068 ?auto_908072 ) ) ( not ( = ?auto_908068 ?auto_908073 ) ) ( not ( = ?auto_908069 ?auto_908070 ) ) ( not ( = ?auto_908069 ?auto_908071 ) ) ( not ( = ?auto_908069 ?auto_908072 ) ) ( not ( = ?auto_908069 ?auto_908073 ) ) ( not ( = ?auto_908070 ?auto_908071 ) ) ( not ( = ?auto_908070 ?auto_908072 ) ) ( not ( = ?auto_908070 ?auto_908073 ) ) ( not ( = ?auto_908071 ?auto_908072 ) ) ( not ( = ?auto_908071 ?auto_908073 ) ) ( not ( = ?auto_908072 ?auto_908073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_908072 ?auto_908073 )
      ( !STACK ?auto_908072 ?auto_908071 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908105 - BLOCK
      ?auto_908106 - BLOCK
      ?auto_908107 - BLOCK
      ?auto_908108 - BLOCK
      ?auto_908109 - BLOCK
      ?auto_908110 - BLOCK
      ?auto_908111 - BLOCK
      ?auto_908112 - BLOCK
      ?auto_908113 - BLOCK
      ?auto_908114 - BLOCK
    )
    :vars
    (
      ?auto_908115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908114 ?auto_908115 ) ( ON-TABLE ?auto_908105 ) ( ON ?auto_908106 ?auto_908105 ) ( ON ?auto_908107 ?auto_908106 ) ( ON ?auto_908108 ?auto_908107 ) ( ON ?auto_908109 ?auto_908108 ) ( ON ?auto_908110 ?auto_908109 ) ( ON ?auto_908111 ?auto_908110 ) ( ON ?auto_908112 ?auto_908111 ) ( not ( = ?auto_908105 ?auto_908106 ) ) ( not ( = ?auto_908105 ?auto_908107 ) ) ( not ( = ?auto_908105 ?auto_908108 ) ) ( not ( = ?auto_908105 ?auto_908109 ) ) ( not ( = ?auto_908105 ?auto_908110 ) ) ( not ( = ?auto_908105 ?auto_908111 ) ) ( not ( = ?auto_908105 ?auto_908112 ) ) ( not ( = ?auto_908105 ?auto_908113 ) ) ( not ( = ?auto_908105 ?auto_908114 ) ) ( not ( = ?auto_908105 ?auto_908115 ) ) ( not ( = ?auto_908106 ?auto_908107 ) ) ( not ( = ?auto_908106 ?auto_908108 ) ) ( not ( = ?auto_908106 ?auto_908109 ) ) ( not ( = ?auto_908106 ?auto_908110 ) ) ( not ( = ?auto_908106 ?auto_908111 ) ) ( not ( = ?auto_908106 ?auto_908112 ) ) ( not ( = ?auto_908106 ?auto_908113 ) ) ( not ( = ?auto_908106 ?auto_908114 ) ) ( not ( = ?auto_908106 ?auto_908115 ) ) ( not ( = ?auto_908107 ?auto_908108 ) ) ( not ( = ?auto_908107 ?auto_908109 ) ) ( not ( = ?auto_908107 ?auto_908110 ) ) ( not ( = ?auto_908107 ?auto_908111 ) ) ( not ( = ?auto_908107 ?auto_908112 ) ) ( not ( = ?auto_908107 ?auto_908113 ) ) ( not ( = ?auto_908107 ?auto_908114 ) ) ( not ( = ?auto_908107 ?auto_908115 ) ) ( not ( = ?auto_908108 ?auto_908109 ) ) ( not ( = ?auto_908108 ?auto_908110 ) ) ( not ( = ?auto_908108 ?auto_908111 ) ) ( not ( = ?auto_908108 ?auto_908112 ) ) ( not ( = ?auto_908108 ?auto_908113 ) ) ( not ( = ?auto_908108 ?auto_908114 ) ) ( not ( = ?auto_908108 ?auto_908115 ) ) ( not ( = ?auto_908109 ?auto_908110 ) ) ( not ( = ?auto_908109 ?auto_908111 ) ) ( not ( = ?auto_908109 ?auto_908112 ) ) ( not ( = ?auto_908109 ?auto_908113 ) ) ( not ( = ?auto_908109 ?auto_908114 ) ) ( not ( = ?auto_908109 ?auto_908115 ) ) ( not ( = ?auto_908110 ?auto_908111 ) ) ( not ( = ?auto_908110 ?auto_908112 ) ) ( not ( = ?auto_908110 ?auto_908113 ) ) ( not ( = ?auto_908110 ?auto_908114 ) ) ( not ( = ?auto_908110 ?auto_908115 ) ) ( not ( = ?auto_908111 ?auto_908112 ) ) ( not ( = ?auto_908111 ?auto_908113 ) ) ( not ( = ?auto_908111 ?auto_908114 ) ) ( not ( = ?auto_908111 ?auto_908115 ) ) ( not ( = ?auto_908112 ?auto_908113 ) ) ( not ( = ?auto_908112 ?auto_908114 ) ) ( not ( = ?auto_908112 ?auto_908115 ) ) ( not ( = ?auto_908113 ?auto_908114 ) ) ( not ( = ?auto_908113 ?auto_908115 ) ) ( not ( = ?auto_908114 ?auto_908115 ) ) ( CLEAR ?auto_908112 ) ( ON ?auto_908113 ?auto_908114 ) ( CLEAR ?auto_908113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_908105 ?auto_908106 ?auto_908107 ?auto_908108 ?auto_908109 ?auto_908110 ?auto_908111 ?auto_908112 ?auto_908113 )
      ( MAKE-10PILE ?auto_908105 ?auto_908106 ?auto_908107 ?auto_908108 ?auto_908109 ?auto_908110 ?auto_908111 ?auto_908112 ?auto_908113 ?auto_908114 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908147 - BLOCK
      ?auto_908148 - BLOCK
      ?auto_908149 - BLOCK
      ?auto_908150 - BLOCK
      ?auto_908151 - BLOCK
      ?auto_908152 - BLOCK
      ?auto_908153 - BLOCK
      ?auto_908154 - BLOCK
      ?auto_908155 - BLOCK
      ?auto_908156 - BLOCK
    )
    :vars
    (
      ?auto_908157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908156 ?auto_908157 ) ( ON-TABLE ?auto_908147 ) ( ON ?auto_908148 ?auto_908147 ) ( ON ?auto_908149 ?auto_908148 ) ( ON ?auto_908150 ?auto_908149 ) ( ON ?auto_908151 ?auto_908150 ) ( ON ?auto_908152 ?auto_908151 ) ( ON ?auto_908153 ?auto_908152 ) ( not ( = ?auto_908147 ?auto_908148 ) ) ( not ( = ?auto_908147 ?auto_908149 ) ) ( not ( = ?auto_908147 ?auto_908150 ) ) ( not ( = ?auto_908147 ?auto_908151 ) ) ( not ( = ?auto_908147 ?auto_908152 ) ) ( not ( = ?auto_908147 ?auto_908153 ) ) ( not ( = ?auto_908147 ?auto_908154 ) ) ( not ( = ?auto_908147 ?auto_908155 ) ) ( not ( = ?auto_908147 ?auto_908156 ) ) ( not ( = ?auto_908147 ?auto_908157 ) ) ( not ( = ?auto_908148 ?auto_908149 ) ) ( not ( = ?auto_908148 ?auto_908150 ) ) ( not ( = ?auto_908148 ?auto_908151 ) ) ( not ( = ?auto_908148 ?auto_908152 ) ) ( not ( = ?auto_908148 ?auto_908153 ) ) ( not ( = ?auto_908148 ?auto_908154 ) ) ( not ( = ?auto_908148 ?auto_908155 ) ) ( not ( = ?auto_908148 ?auto_908156 ) ) ( not ( = ?auto_908148 ?auto_908157 ) ) ( not ( = ?auto_908149 ?auto_908150 ) ) ( not ( = ?auto_908149 ?auto_908151 ) ) ( not ( = ?auto_908149 ?auto_908152 ) ) ( not ( = ?auto_908149 ?auto_908153 ) ) ( not ( = ?auto_908149 ?auto_908154 ) ) ( not ( = ?auto_908149 ?auto_908155 ) ) ( not ( = ?auto_908149 ?auto_908156 ) ) ( not ( = ?auto_908149 ?auto_908157 ) ) ( not ( = ?auto_908150 ?auto_908151 ) ) ( not ( = ?auto_908150 ?auto_908152 ) ) ( not ( = ?auto_908150 ?auto_908153 ) ) ( not ( = ?auto_908150 ?auto_908154 ) ) ( not ( = ?auto_908150 ?auto_908155 ) ) ( not ( = ?auto_908150 ?auto_908156 ) ) ( not ( = ?auto_908150 ?auto_908157 ) ) ( not ( = ?auto_908151 ?auto_908152 ) ) ( not ( = ?auto_908151 ?auto_908153 ) ) ( not ( = ?auto_908151 ?auto_908154 ) ) ( not ( = ?auto_908151 ?auto_908155 ) ) ( not ( = ?auto_908151 ?auto_908156 ) ) ( not ( = ?auto_908151 ?auto_908157 ) ) ( not ( = ?auto_908152 ?auto_908153 ) ) ( not ( = ?auto_908152 ?auto_908154 ) ) ( not ( = ?auto_908152 ?auto_908155 ) ) ( not ( = ?auto_908152 ?auto_908156 ) ) ( not ( = ?auto_908152 ?auto_908157 ) ) ( not ( = ?auto_908153 ?auto_908154 ) ) ( not ( = ?auto_908153 ?auto_908155 ) ) ( not ( = ?auto_908153 ?auto_908156 ) ) ( not ( = ?auto_908153 ?auto_908157 ) ) ( not ( = ?auto_908154 ?auto_908155 ) ) ( not ( = ?auto_908154 ?auto_908156 ) ) ( not ( = ?auto_908154 ?auto_908157 ) ) ( not ( = ?auto_908155 ?auto_908156 ) ) ( not ( = ?auto_908155 ?auto_908157 ) ) ( not ( = ?auto_908156 ?auto_908157 ) ) ( ON ?auto_908155 ?auto_908156 ) ( CLEAR ?auto_908153 ) ( ON ?auto_908154 ?auto_908155 ) ( CLEAR ?auto_908154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_908147 ?auto_908148 ?auto_908149 ?auto_908150 ?auto_908151 ?auto_908152 ?auto_908153 ?auto_908154 )
      ( MAKE-10PILE ?auto_908147 ?auto_908148 ?auto_908149 ?auto_908150 ?auto_908151 ?auto_908152 ?auto_908153 ?auto_908154 ?auto_908155 ?auto_908156 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908189 - BLOCK
      ?auto_908190 - BLOCK
      ?auto_908191 - BLOCK
      ?auto_908192 - BLOCK
      ?auto_908193 - BLOCK
      ?auto_908194 - BLOCK
      ?auto_908195 - BLOCK
      ?auto_908196 - BLOCK
      ?auto_908197 - BLOCK
      ?auto_908198 - BLOCK
    )
    :vars
    (
      ?auto_908199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908198 ?auto_908199 ) ( ON-TABLE ?auto_908189 ) ( ON ?auto_908190 ?auto_908189 ) ( ON ?auto_908191 ?auto_908190 ) ( ON ?auto_908192 ?auto_908191 ) ( ON ?auto_908193 ?auto_908192 ) ( ON ?auto_908194 ?auto_908193 ) ( not ( = ?auto_908189 ?auto_908190 ) ) ( not ( = ?auto_908189 ?auto_908191 ) ) ( not ( = ?auto_908189 ?auto_908192 ) ) ( not ( = ?auto_908189 ?auto_908193 ) ) ( not ( = ?auto_908189 ?auto_908194 ) ) ( not ( = ?auto_908189 ?auto_908195 ) ) ( not ( = ?auto_908189 ?auto_908196 ) ) ( not ( = ?auto_908189 ?auto_908197 ) ) ( not ( = ?auto_908189 ?auto_908198 ) ) ( not ( = ?auto_908189 ?auto_908199 ) ) ( not ( = ?auto_908190 ?auto_908191 ) ) ( not ( = ?auto_908190 ?auto_908192 ) ) ( not ( = ?auto_908190 ?auto_908193 ) ) ( not ( = ?auto_908190 ?auto_908194 ) ) ( not ( = ?auto_908190 ?auto_908195 ) ) ( not ( = ?auto_908190 ?auto_908196 ) ) ( not ( = ?auto_908190 ?auto_908197 ) ) ( not ( = ?auto_908190 ?auto_908198 ) ) ( not ( = ?auto_908190 ?auto_908199 ) ) ( not ( = ?auto_908191 ?auto_908192 ) ) ( not ( = ?auto_908191 ?auto_908193 ) ) ( not ( = ?auto_908191 ?auto_908194 ) ) ( not ( = ?auto_908191 ?auto_908195 ) ) ( not ( = ?auto_908191 ?auto_908196 ) ) ( not ( = ?auto_908191 ?auto_908197 ) ) ( not ( = ?auto_908191 ?auto_908198 ) ) ( not ( = ?auto_908191 ?auto_908199 ) ) ( not ( = ?auto_908192 ?auto_908193 ) ) ( not ( = ?auto_908192 ?auto_908194 ) ) ( not ( = ?auto_908192 ?auto_908195 ) ) ( not ( = ?auto_908192 ?auto_908196 ) ) ( not ( = ?auto_908192 ?auto_908197 ) ) ( not ( = ?auto_908192 ?auto_908198 ) ) ( not ( = ?auto_908192 ?auto_908199 ) ) ( not ( = ?auto_908193 ?auto_908194 ) ) ( not ( = ?auto_908193 ?auto_908195 ) ) ( not ( = ?auto_908193 ?auto_908196 ) ) ( not ( = ?auto_908193 ?auto_908197 ) ) ( not ( = ?auto_908193 ?auto_908198 ) ) ( not ( = ?auto_908193 ?auto_908199 ) ) ( not ( = ?auto_908194 ?auto_908195 ) ) ( not ( = ?auto_908194 ?auto_908196 ) ) ( not ( = ?auto_908194 ?auto_908197 ) ) ( not ( = ?auto_908194 ?auto_908198 ) ) ( not ( = ?auto_908194 ?auto_908199 ) ) ( not ( = ?auto_908195 ?auto_908196 ) ) ( not ( = ?auto_908195 ?auto_908197 ) ) ( not ( = ?auto_908195 ?auto_908198 ) ) ( not ( = ?auto_908195 ?auto_908199 ) ) ( not ( = ?auto_908196 ?auto_908197 ) ) ( not ( = ?auto_908196 ?auto_908198 ) ) ( not ( = ?auto_908196 ?auto_908199 ) ) ( not ( = ?auto_908197 ?auto_908198 ) ) ( not ( = ?auto_908197 ?auto_908199 ) ) ( not ( = ?auto_908198 ?auto_908199 ) ) ( ON ?auto_908197 ?auto_908198 ) ( ON ?auto_908196 ?auto_908197 ) ( CLEAR ?auto_908194 ) ( ON ?auto_908195 ?auto_908196 ) ( CLEAR ?auto_908195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_908189 ?auto_908190 ?auto_908191 ?auto_908192 ?auto_908193 ?auto_908194 ?auto_908195 )
      ( MAKE-10PILE ?auto_908189 ?auto_908190 ?auto_908191 ?auto_908192 ?auto_908193 ?auto_908194 ?auto_908195 ?auto_908196 ?auto_908197 ?auto_908198 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908231 - BLOCK
      ?auto_908232 - BLOCK
      ?auto_908233 - BLOCK
      ?auto_908234 - BLOCK
      ?auto_908235 - BLOCK
      ?auto_908236 - BLOCK
      ?auto_908237 - BLOCK
      ?auto_908238 - BLOCK
      ?auto_908239 - BLOCK
      ?auto_908240 - BLOCK
    )
    :vars
    (
      ?auto_908241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908240 ?auto_908241 ) ( ON-TABLE ?auto_908231 ) ( ON ?auto_908232 ?auto_908231 ) ( ON ?auto_908233 ?auto_908232 ) ( ON ?auto_908234 ?auto_908233 ) ( ON ?auto_908235 ?auto_908234 ) ( not ( = ?auto_908231 ?auto_908232 ) ) ( not ( = ?auto_908231 ?auto_908233 ) ) ( not ( = ?auto_908231 ?auto_908234 ) ) ( not ( = ?auto_908231 ?auto_908235 ) ) ( not ( = ?auto_908231 ?auto_908236 ) ) ( not ( = ?auto_908231 ?auto_908237 ) ) ( not ( = ?auto_908231 ?auto_908238 ) ) ( not ( = ?auto_908231 ?auto_908239 ) ) ( not ( = ?auto_908231 ?auto_908240 ) ) ( not ( = ?auto_908231 ?auto_908241 ) ) ( not ( = ?auto_908232 ?auto_908233 ) ) ( not ( = ?auto_908232 ?auto_908234 ) ) ( not ( = ?auto_908232 ?auto_908235 ) ) ( not ( = ?auto_908232 ?auto_908236 ) ) ( not ( = ?auto_908232 ?auto_908237 ) ) ( not ( = ?auto_908232 ?auto_908238 ) ) ( not ( = ?auto_908232 ?auto_908239 ) ) ( not ( = ?auto_908232 ?auto_908240 ) ) ( not ( = ?auto_908232 ?auto_908241 ) ) ( not ( = ?auto_908233 ?auto_908234 ) ) ( not ( = ?auto_908233 ?auto_908235 ) ) ( not ( = ?auto_908233 ?auto_908236 ) ) ( not ( = ?auto_908233 ?auto_908237 ) ) ( not ( = ?auto_908233 ?auto_908238 ) ) ( not ( = ?auto_908233 ?auto_908239 ) ) ( not ( = ?auto_908233 ?auto_908240 ) ) ( not ( = ?auto_908233 ?auto_908241 ) ) ( not ( = ?auto_908234 ?auto_908235 ) ) ( not ( = ?auto_908234 ?auto_908236 ) ) ( not ( = ?auto_908234 ?auto_908237 ) ) ( not ( = ?auto_908234 ?auto_908238 ) ) ( not ( = ?auto_908234 ?auto_908239 ) ) ( not ( = ?auto_908234 ?auto_908240 ) ) ( not ( = ?auto_908234 ?auto_908241 ) ) ( not ( = ?auto_908235 ?auto_908236 ) ) ( not ( = ?auto_908235 ?auto_908237 ) ) ( not ( = ?auto_908235 ?auto_908238 ) ) ( not ( = ?auto_908235 ?auto_908239 ) ) ( not ( = ?auto_908235 ?auto_908240 ) ) ( not ( = ?auto_908235 ?auto_908241 ) ) ( not ( = ?auto_908236 ?auto_908237 ) ) ( not ( = ?auto_908236 ?auto_908238 ) ) ( not ( = ?auto_908236 ?auto_908239 ) ) ( not ( = ?auto_908236 ?auto_908240 ) ) ( not ( = ?auto_908236 ?auto_908241 ) ) ( not ( = ?auto_908237 ?auto_908238 ) ) ( not ( = ?auto_908237 ?auto_908239 ) ) ( not ( = ?auto_908237 ?auto_908240 ) ) ( not ( = ?auto_908237 ?auto_908241 ) ) ( not ( = ?auto_908238 ?auto_908239 ) ) ( not ( = ?auto_908238 ?auto_908240 ) ) ( not ( = ?auto_908238 ?auto_908241 ) ) ( not ( = ?auto_908239 ?auto_908240 ) ) ( not ( = ?auto_908239 ?auto_908241 ) ) ( not ( = ?auto_908240 ?auto_908241 ) ) ( ON ?auto_908239 ?auto_908240 ) ( ON ?auto_908238 ?auto_908239 ) ( ON ?auto_908237 ?auto_908238 ) ( CLEAR ?auto_908235 ) ( ON ?auto_908236 ?auto_908237 ) ( CLEAR ?auto_908236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_908231 ?auto_908232 ?auto_908233 ?auto_908234 ?auto_908235 ?auto_908236 )
      ( MAKE-10PILE ?auto_908231 ?auto_908232 ?auto_908233 ?auto_908234 ?auto_908235 ?auto_908236 ?auto_908237 ?auto_908238 ?auto_908239 ?auto_908240 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908273 - BLOCK
      ?auto_908274 - BLOCK
      ?auto_908275 - BLOCK
      ?auto_908276 - BLOCK
      ?auto_908277 - BLOCK
      ?auto_908278 - BLOCK
      ?auto_908279 - BLOCK
      ?auto_908280 - BLOCK
      ?auto_908281 - BLOCK
      ?auto_908282 - BLOCK
    )
    :vars
    (
      ?auto_908283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908282 ?auto_908283 ) ( ON-TABLE ?auto_908273 ) ( ON ?auto_908274 ?auto_908273 ) ( ON ?auto_908275 ?auto_908274 ) ( ON ?auto_908276 ?auto_908275 ) ( not ( = ?auto_908273 ?auto_908274 ) ) ( not ( = ?auto_908273 ?auto_908275 ) ) ( not ( = ?auto_908273 ?auto_908276 ) ) ( not ( = ?auto_908273 ?auto_908277 ) ) ( not ( = ?auto_908273 ?auto_908278 ) ) ( not ( = ?auto_908273 ?auto_908279 ) ) ( not ( = ?auto_908273 ?auto_908280 ) ) ( not ( = ?auto_908273 ?auto_908281 ) ) ( not ( = ?auto_908273 ?auto_908282 ) ) ( not ( = ?auto_908273 ?auto_908283 ) ) ( not ( = ?auto_908274 ?auto_908275 ) ) ( not ( = ?auto_908274 ?auto_908276 ) ) ( not ( = ?auto_908274 ?auto_908277 ) ) ( not ( = ?auto_908274 ?auto_908278 ) ) ( not ( = ?auto_908274 ?auto_908279 ) ) ( not ( = ?auto_908274 ?auto_908280 ) ) ( not ( = ?auto_908274 ?auto_908281 ) ) ( not ( = ?auto_908274 ?auto_908282 ) ) ( not ( = ?auto_908274 ?auto_908283 ) ) ( not ( = ?auto_908275 ?auto_908276 ) ) ( not ( = ?auto_908275 ?auto_908277 ) ) ( not ( = ?auto_908275 ?auto_908278 ) ) ( not ( = ?auto_908275 ?auto_908279 ) ) ( not ( = ?auto_908275 ?auto_908280 ) ) ( not ( = ?auto_908275 ?auto_908281 ) ) ( not ( = ?auto_908275 ?auto_908282 ) ) ( not ( = ?auto_908275 ?auto_908283 ) ) ( not ( = ?auto_908276 ?auto_908277 ) ) ( not ( = ?auto_908276 ?auto_908278 ) ) ( not ( = ?auto_908276 ?auto_908279 ) ) ( not ( = ?auto_908276 ?auto_908280 ) ) ( not ( = ?auto_908276 ?auto_908281 ) ) ( not ( = ?auto_908276 ?auto_908282 ) ) ( not ( = ?auto_908276 ?auto_908283 ) ) ( not ( = ?auto_908277 ?auto_908278 ) ) ( not ( = ?auto_908277 ?auto_908279 ) ) ( not ( = ?auto_908277 ?auto_908280 ) ) ( not ( = ?auto_908277 ?auto_908281 ) ) ( not ( = ?auto_908277 ?auto_908282 ) ) ( not ( = ?auto_908277 ?auto_908283 ) ) ( not ( = ?auto_908278 ?auto_908279 ) ) ( not ( = ?auto_908278 ?auto_908280 ) ) ( not ( = ?auto_908278 ?auto_908281 ) ) ( not ( = ?auto_908278 ?auto_908282 ) ) ( not ( = ?auto_908278 ?auto_908283 ) ) ( not ( = ?auto_908279 ?auto_908280 ) ) ( not ( = ?auto_908279 ?auto_908281 ) ) ( not ( = ?auto_908279 ?auto_908282 ) ) ( not ( = ?auto_908279 ?auto_908283 ) ) ( not ( = ?auto_908280 ?auto_908281 ) ) ( not ( = ?auto_908280 ?auto_908282 ) ) ( not ( = ?auto_908280 ?auto_908283 ) ) ( not ( = ?auto_908281 ?auto_908282 ) ) ( not ( = ?auto_908281 ?auto_908283 ) ) ( not ( = ?auto_908282 ?auto_908283 ) ) ( ON ?auto_908281 ?auto_908282 ) ( ON ?auto_908280 ?auto_908281 ) ( ON ?auto_908279 ?auto_908280 ) ( ON ?auto_908278 ?auto_908279 ) ( CLEAR ?auto_908276 ) ( ON ?auto_908277 ?auto_908278 ) ( CLEAR ?auto_908277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_908273 ?auto_908274 ?auto_908275 ?auto_908276 ?auto_908277 )
      ( MAKE-10PILE ?auto_908273 ?auto_908274 ?auto_908275 ?auto_908276 ?auto_908277 ?auto_908278 ?auto_908279 ?auto_908280 ?auto_908281 ?auto_908282 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908315 - BLOCK
      ?auto_908316 - BLOCK
      ?auto_908317 - BLOCK
      ?auto_908318 - BLOCK
      ?auto_908319 - BLOCK
      ?auto_908320 - BLOCK
      ?auto_908321 - BLOCK
      ?auto_908322 - BLOCK
      ?auto_908323 - BLOCK
      ?auto_908324 - BLOCK
    )
    :vars
    (
      ?auto_908325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908324 ?auto_908325 ) ( ON-TABLE ?auto_908315 ) ( ON ?auto_908316 ?auto_908315 ) ( ON ?auto_908317 ?auto_908316 ) ( not ( = ?auto_908315 ?auto_908316 ) ) ( not ( = ?auto_908315 ?auto_908317 ) ) ( not ( = ?auto_908315 ?auto_908318 ) ) ( not ( = ?auto_908315 ?auto_908319 ) ) ( not ( = ?auto_908315 ?auto_908320 ) ) ( not ( = ?auto_908315 ?auto_908321 ) ) ( not ( = ?auto_908315 ?auto_908322 ) ) ( not ( = ?auto_908315 ?auto_908323 ) ) ( not ( = ?auto_908315 ?auto_908324 ) ) ( not ( = ?auto_908315 ?auto_908325 ) ) ( not ( = ?auto_908316 ?auto_908317 ) ) ( not ( = ?auto_908316 ?auto_908318 ) ) ( not ( = ?auto_908316 ?auto_908319 ) ) ( not ( = ?auto_908316 ?auto_908320 ) ) ( not ( = ?auto_908316 ?auto_908321 ) ) ( not ( = ?auto_908316 ?auto_908322 ) ) ( not ( = ?auto_908316 ?auto_908323 ) ) ( not ( = ?auto_908316 ?auto_908324 ) ) ( not ( = ?auto_908316 ?auto_908325 ) ) ( not ( = ?auto_908317 ?auto_908318 ) ) ( not ( = ?auto_908317 ?auto_908319 ) ) ( not ( = ?auto_908317 ?auto_908320 ) ) ( not ( = ?auto_908317 ?auto_908321 ) ) ( not ( = ?auto_908317 ?auto_908322 ) ) ( not ( = ?auto_908317 ?auto_908323 ) ) ( not ( = ?auto_908317 ?auto_908324 ) ) ( not ( = ?auto_908317 ?auto_908325 ) ) ( not ( = ?auto_908318 ?auto_908319 ) ) ( not ( = ?auto_908318 ?auto_908320 ) ) ( not ( = ?auto_908318 ?auto_908321 ) ) ( not ( = ?auto_908318 ?auto_908322 ) ) ( not ( = ?auto_908318 ?auto_908323 ) ) ( not ( = ?auto_908318 ?auto_908324 ) ) ( not ( = ?auto_908318 ?auto_908325 ) ) ( not ( = ?auto_908319 ?auto_908320 ) ) ( not ( = ?auto_908319 ?auto_908321 ) ) ( not ( = ?auto_908319 ?auto_908322 ) ) ( not ( = ?auto_908319 ?auto_908323 ) ) ( not ( = ?auto_908319 ?auto_908324 ) ) ( not ( = ?auto_908319 ?auto_908325 ) ) ( not ( = ?auto_908320 ?auto_908321 ) ) ( not ( = ?auto_908320 ?auto_908322 ) ) ( not ( = ?auto_908320 ?auto_908323 ) ) ( not ( = ?auto_908320 ?auto_908324 ) ) ( not ( = ?auto_908320 ?auto_908325 ) ) ( not ( = ?auto_908321 ?auto_908322 ) ) ( not ( = ?auto_908321 ?auto_908323 ) ) ( not ( = ?auto_908321 ?auto_908324 ) ) ( not ( = ?auto_908321 ?auto_908325 ) ) ( not ( = ?auto_908322 ?auto_908323 ) ) ( not ( = ?auto_908322 ?auto_908324 ) ) ( not ( = ?auto_908322 ?auto_908325 ) ) ( not ( = ?auto_908323 ?auto_908324 ) ) ( not ( = ?auto_908323 ?auto_908325 ) ) ( not ( = ?auto_908324 ?auto_908325 ) ) ( ON ?auto_908323 ?auto_908324 ) ( ON ?auto_908322 ?auto_908323 ) ( ON ?auto_908321 ?auto_908322 ) ( ON ?auto_908320 ?auto_908321 ) ( ON ?auto_908319 ?auto_908320 ) ( CLEAR ?auto_908317 ) ( ON ?auto_908318 ?auto_908319 ) ( CLEAR ?auto_908318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_908315 ?auto_908316 ?auto_908317 ?auto_908318 )
      ( MAKE-10PILE ?auto_908315 ?auto_908316 ?auto_908317 ?auto_908318 ?auto_908319 ?auto_908320 ?auto_908321 ?auto_908322 ?auto_908323 ?auto_908324 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908357 - BLOCK
      ?auto_908358 - BLOCK
      ?auto_908359 - BLOCK
      ?auto_908360 - BLOCK
      ?auto_908361 - BLOCK
      ?auto_908362 - BLOCK
      ?auto_908363 - BLOCK
      ?auto_908364 - BLOCK
      ?auto_908365 - BLOCK
      ?auto_908366 - BLOCK
    )
    :vars
    (
      ?auto_908367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908366 ?auto_908367 ) ( ON-TABLE ?auto_908357 ) ( ON ?auto_908358 ?auto_908357 ) ( not ( = ?auto_908357 ?auto_908358 ) ) ( not ( = ?auto_908357 ?auto_908359 ) ) ( not ( = ?auto_908357 ?auto_908360 ) ) ( not ( = ?auto_908357 ?auto_908361 ) ) ( not ( = ?auto_908357 ?auto_908362 ) ) ( not ( = ?auto_908357 ?auto_908363 ) ) ( not ( = ?auto_908357 ?auto_908364 ) ) ( not ( = ?auto_908357 ?auto_908365 ) ) ( not ( = ?auto_908357 ?auto_908366 ) ) ( not ( = ?auto_908357 ?auto_908367 ) ) ( not ( = ?auto_908358 ?auto_908359 ) ) ( not ( = ?auto_908358 ?auto_908360 ) ) ( not ( = ?auto_908358 ?auto_908361 ) ) ( not ( = ?auto_908358 ?auto_908362 ) ) ( not ( = ?auto_908358 ?auto_908363 ) ) ( not ( = ?auto_908358 ?auto_908364 ) ) ( not ( = ?auto_908358 ?auto_908365 ) ) ( not ( = ?auto_908358 ?auto_908366 ) ) ( not ( = ?auto_908358 ?auto_908367 ) ) ( not ( = ?auto_908359 ?auto_908360 ) ) ( not ( = ?auto_908359 ?auto_908361 ) ) ( not ( = ?auto_908359 ?auto_908362 ) ) ( not ( = ?auto_908359 ?auto_908363 ) ) ( not ( = ?auto_908359 ?auto_908364 ) ) ( not ( = ?auto_908359 ?auto_908365 ) ) ( not ( = ?auto_908359 ?auto_908366 ) ) ( not ( = ?auto_908359 ?auto_908367 ) ) ( not ( = ?auto_908360 ?auto_908361 ) ) ( not ( = ?auto_908360 ?auto_908362 ) ) ( not ( = ?auto_908360 ?auto_908363 ) ) ( not ( = ?auto_908360 ?auto_908364 ) ) ( not ( = ?auto_908360 ?auto_908365 ) ) ( not ( = ?auto_908360 ?auto_908366 ) ) ( not ( = ?auto_908360 ?auto_908367 ) ) ( not ( = ?auto_908361 ?auto_908362 ) ) ( not ( = ?auto_908361 ?auto_908363 ) ) ( not ( = ?auto_908361 ?auto_908364 ) ) ( not ( = ?auto_908361 ?auto_908365 ) ) ( not ( = ?auto_908361 ?auto_908366 ) ) ( not ( = ?auto_908361 ?auto_908367 ) ) ( not ( = ?auto_908362 ?auto_908363 ) ) ( not ( = ?auto_908362 ?auto_908364 ) ) ( not ( = ?auto_908362 ?auto_908365 ) ) ( not ( = ?auto_908362 ?auto_908366 ) ) ( not ( = ?auto_908362 ?auto_908367 ) ) ( not ( = ?auto_908363 ?auto_908364 ) ) ( not ( = ?auto_908363 ?auto_908365 ) ) ( not ( = ?auto_908363 ?auto_908366 ) ) ( not ( = ?auto_908363 ?auto_908367 ) ) ( not ( = ?auto_908364 ?auto_908365 ) ) ( not ( = ?auto_908364 ?auto_908366 ) ) ( not ( = ?auto_908364 ?auto_908367 ) ) ( not ( = ?auto_908365 ?auto_908366 ) ) ( not ( = ?auto_908365 ?auto_908367 ) ) ( not ( = ?auto_908366 ?auto_908367 ) ) ( ON ?auto_908365 ?auto_908366 ) ( ON ?auto_908364 ?auto_908365 ) ( ON ?auto_908363 ?auto_908364 ) ( ON ?auto_908362 ?auto_908363 ) ( ON ?auto_908361 ?auto_908362 ) ( ON ?auto_908360 ?auto_908361 ) ( CLEAR ?auto_908358 ) ( ON ?auto_908359 ?auto_908360 ) ( CLEAR ?auto_908359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_908357 ?auto_908358 ?auto_908359 )
      ( MAKE-10PILE ?auto_908357 ?auto_908358 ?auto_908359 ?auto_908360 ?auto_908361 ?auto_908362 ?auto_908363 ?auto_908364 ?auto_908365 ?auto_908366 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908399 - BLOCK
      ?auto_908400 - BLOCK
      ?auto_908401 - BLOCK
      ?auto_908402 - BLOCK
      ?auto_908403 - BLOCK
      ?auto_908404 - BLOCK
      ?auto_908405 - BLOCK
      ?auto_908406 - BLOCK
      ?auto_908407 - BLOCK
      ?auto_908408 - BLOCK
    )
    :vars
    (
      ?auto_908409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908408 ?auto_908409 ) ( ON-TABLE ?auto_908399 ) ( not ( = ?auto_908399 ?auto_908400 ) ) ( not ( = ?auto_908399 ?auto_908401 ) ) ( not ( = ?auto_908399 ?auto_908402 ) ) ( not ( = ?auto_908399 ?auto_908403 ) ) ( not ( = ?auto_908399 ?auto_908404 ) ) ( not ( = ?auto_908399 ?auto_908405 ) ) ( not ( = ?auto_908399 ?auto_908406 ) ) ( not ( = ?auto_908399 ?auto_908407 ) ) ( not ( = ?auto_908399 ?auto_908408 ) ) ( not ( = ?auto_908399 ?auto_908409 ) ) ( not ( = ?auto_908400 ?auto_908401 ) ) ( not ( = ?auto_908400 ?auto_908402 ) ) ( not ( = ?auto_908400 ?auto_908403 ) ) ( not ( = ?auto_908400 ?auto_908404 ) ) ( not ( = ?auto_908400 ?auto_908405 ) ) ( not ( = ?auto_908400 ?auto_908406 ) ) ( not ( = ?auto_908400 ?auto_908407 ) ) ( not ( = ?auto_908400 ?auto_908408 ) ) ( not ( = ?auto_908400 ?auto_908409 ) ) ( not ( = ?auto_908401 ?auto_908402 ) ) ( not ( = ?auto_908401 ?auto_908403 ) ) ( not ( = ?auto_908401 ?auto_908404 ) ) ( not ( = ?auto_908401 ?auto_908405 ) ) ( not ( = ?auto_908401 ?auto_908406 ) ) ( not ( = ?auto_908401 ?auto_908407 ) ) ( not ( = ?auto_908401 ?auto_908408 ) ) ( not ( = ?auto_908401 ?auto_908409 ) ) ( not ( = ?auto_908402 ?auto_908403 ) ) ( not ( = ?auto_908402 ?auto_908404 ) ) ( not ( = ?auto_908402 ?auto_908405 ) ) ( not ( = ?auto_908402 ?auto_908406 ) ) ( not ( = ?auto_908402 ?auto_908407 ) ) ( not ( = ?auto_908402 ?auto_908408 ) ) ( not ( = ?auto_908402 ?auto_908409 ) ) ( not ( = ?auto_908403 ?auto_908404 ) ) ( not ( = ?auto_908403 ?auto_908405 ) ) ( not ( = ?auto_908403 ?auto_908406 ) ) ( not ( = ?auto_908403 ?auto_908407 ) ) ( not ( = ?auto_908403 ?auto_908408 ) ) ( not ( = ?auto_908403 ?auto_908409 ) ) ( not ( = ?auto_908404 ?auto_908405 ) ) ( not ( = ?auto_908404 ?auto_908406 ) ) ( not ( = ?auto_908404 ?auto_908407 ) ) ( not ( = ?auto_908404 ?auto_908408 ) ) ( not ( = ?auto_908404 ?auto_908409 ) ) ( not ( = ?auto_908405 ?auto_908406 ) ) ( not ( = ?auto_908405 ?auto_908407 ) ) ( not ( = ?auto_908405 ?auto_908408 ) ) ( not ( = ?auto_908405 ?auto_908409 ) ) ( not ( = ?auto_908406 ?auto_908407 ) ) ( not ( = ?auto_908406 ?auto_908408 ) ) ( not ( = ?auto_908406 ?auto_908409 ) ) ( not ( = ?auto_908407 ?auto_908408 ) ) ( not ( = ?auto_908407 ?auto_908409 ) ) ( not ( = ?auto_908408 ?auto_908409 ) ) ( ON ?auto_908407 ?auto_908408 ) ( ON ?auto_908406 ?auto_908407 ) ( ON ?auto_908405 ?auto_908406 ) ( ON ?auto_908404 ?auto_908405 ) ( ON ?auto_908403 ?auto_908404 ) ( ON ?auto_908402 ?auto_908403 ) ( ON ?auto_908401 ?auto_908402 ) ( CLEAR ?auto_908399 ) ( ON ?auto_908400 ?auto_908401 ) ( CLEAR ?auto_908400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_908399 ?auto_908400 )
      ( MAKE-10PILE ?auto_908399 ?auto_908400 ?auto_908401 ?auto_908402 ?auto_908403 ?auto_908404 ?auto_908405 ?auto_908406 ?auto_908407 ?auto_908408 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_908441 - BLOCK
      ?auto_908442 - BLOCK
      ?auto_908443 - BLOCK
      ?auto_908444 - BLOCK
      ?auto_908445 - BLOCK
      ?auto_908446 - BLOCK
      ?auto_908447 - BLOCK
      ?auto_908448 - BLOCK
      ?auto_908449 - BLOCK
      ?auto_908450 - BLOCK
    )
    :vars
    (
      ?auto_908451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908450 ?auto_908451 ) ( not ( = ?auto_908441 ?auto_908442 ) ) ( not ( = ?auto_908441 ?auto_908443 ) ) ( not ( = ?auto_908441 ?auto_908444 ) ) ( not ( = ?auto_908441 ?auto_908445 ) ) ( not ( = ?auto_908441 ?auto_908446 ) ) ( not ( = ?auto_908441 ?auto_908447 ) ) ( not ( = ?auto_908441 ?auto_908448 ) ) ( not ( = ?auto_908441 ?auto_908449 ) ) ( not ( = ?auto_908441 ?auto_908450 ) ) ( not ( = ?auto_908441 ?auto_908451 ) ) ( not ( = ?auto_908442 ?auto_908443 ) ) ( not ( = ?auto_908442 ?auto_908444 ) ) ( not ( = ?auto_908442 ?auto_908445 ) ) ( not ( = ?auto_908442 ?auto_908446 ) ) ( not ( = ?auto_908442 ?auto_908447 ) ) ( not ( = ?auto_908442 ?auto_908448 ) ) ( not ( = ?auto_908442 ?auto_908449 ) ) ( not ( = ?auto_908442 ?auto_908450 ) ) ( not ( = ?auto_908442 ?auto_908451 ) ) ( not ( = ?auto_908443 ?auto_908444 ) ) ( not ( = ?auto_908443 ?auto_908445 ) ) ( not ( = ?auto_908443 ?auto_908446 ) ) ( not ( = ?auto_908443 ?auto_908447 ) ) ( not ( = ?auto_908443 ?auto_908448 ) ) ( not ( = ?auto_908443 ?auto_908449 ) ) ( not ( = ?auto_908443 ?auto_908450 ) ) ( not ( = ?auto_908443 ?auto_908451 ) ) ( not ( = ?auto_908444 ?auto_908445 ) ) ( not ( = ?auto_908444 ?auto_908446 ) ) ( not ( = ?auto_908444 ?auto_908447 ) ) ( not ( = ?auto_908444 ?auto_908448 ) ) ( not ( = ?auto_908444 ?auto_908449 ) ) ( not ( = ?auto_908444 ?auto_908450 ) ) ( not ( = ?auto_908444 ?auto_908451 ) ) ( not ( = ?auto_908445 ?auto_908446 ) ) ( not ( = ?auto_908445 ?auto_908447 ) ) ( not ( = ?auto_908445 ?auto_908448 ) ) ( not ( = ?auto_908445 ?auto_908449 ) ) ( not ( = ?auto_908445 ?auto_908450 ) ) ( not ( = ?auto_908445 ?auto_908451 ) ) ( not ( = ?auto_908446 ?auto_908447 ) ) ( not ( = ?auto_908446 ?auto_908448 ) ) ( not ( = ?auto_908446 ?auto_908449 ) ) ( not ( = ?auto_908446 ?auto_908450 ) ) ( not ( = ?auto_908446 ?auto_908451 ) ) ( not ( = ?auto_908447 ?auto_908448 ) ) ( not ( = ?auto_908447 ?auto_908449 ) ) ( not ( = ?auto_908447 ?auto_908450 ) ) ( not ( = ?auto_908447 ?auto_908451 ) ) ( not ( = ?auto_908448 ?auto_908449 ) ) ( not ( = ?auto_908448 ?auto_908450 ) ) ( not ( = ?auto_908448 ?auto_908451 ) ) ( not ( = ?auto_908449 ?auto_908450 ) ) ( not ( = ?auto_908449 ?auto_908451 ) ) ( not ( = ?auto_908450 ?auto_908451 ) ) ( ON ?auto_908449 ?auto_908450 ) ( ON ?auto_908448 ?auto_908449 ) ( ON ?auto_908447 ?auto_908448 ) ( ON ?auto_908446 ?auto_908447 ) ( ON ?auto_908445 ?auto_908446 ) ( ON ?auto_908444 ?auto_908445 ) ( ON ?auto_908443 ?auto_908444 ) ( ON ?auto_908442 ?auto_908443 ) ( ON ?auto_908441 ?auto_908442 ) ( CLEAR ?auto_908441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_908441 )
      ( MAKE-10PILE ?auto_908441 ?auto_908442 ?auto_908443 ?auto_908444 ?auto_908445 ?auto_908446 ?auto_908447 ?auto_908448 ?auto_908449 ?auto_908450 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908484 - BLOCK
      ?auto_908485 - BLOCK
      ?auto_908486 - BLOCK
      ?auto_908487 - BLOCK
      ?auto_908488 - BLOCK
      ?auto_908489 - BLOCK
      ?auto_908490 - BLOCK
      ?auto_908491 - BLOCK
      ?auto_908492 - BLOCK
      ?auto_908493 - BLOCK
      ?auto_908494 - BLOCK
    )
    :vars
    (
      ?auto_908495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_908493 ) ( ON ?auto_908494 ?auto_908495 ) ( CLEAR ?auto_908494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_908484 ) ( ON ?auto_908485 ?auto_908484 ) ( ON ?auto_908486 ?auto_908485 ) ( ON ?auto_908487 ?auto_908486 ) ( ON ?auto_908488 ?auto_908487 ) ( ON ?auto_908489 ?auto_908488 ) ( ON ?auto_908490 ?auto_908489 ) ( ON ?auto_908491 ?auto_908490 ) ( ON ?auto_908492 ?auto_908491 ) ( ON ?auto_908493 ?auto_908492 ) ( not ( = ?auto_908484 ?auto_908485 ) ) ( not ( = ?auto_908484 ?auto_908486 ) ) ( not ( = ?auto_908484 ?auto_908487 ) ) ( not ( = ?auto_908484 ?auto_908488 ) ) ( not ( = ?auto_908484 ?auto_908489 ) ) ( not ( = ?auto_908484 ?auto_908490 ) ) ( not ( = ?auto_908484 ?auto_908491 ) ) ( not ( = ?auto_908484 ?auto_908492 ) ) ( not ( = ?auto_908484 ?auto_908493 ) ) ( not ( = ?auto_908484 ?auto_908494 ) ) ( not ( = ?auto_908484 ?auto_908495 ) ) ( not ( = ?auto_908485 ?auto_908486 ) ) ( not ( = ?auto_908485 ?auto_908487 ) ) ( not ( = ?auto_908485 ?auto_908488 ) ) ( not ( = ?auto_908485 ?auto_908489 ) ) ( not ( = ?auto_908485 ?auto_908490 ) ) ( not ( = ?auto_908485 ?auto_908491 ) ) ( not ( = ?auto_908485 ?auto_908492 ) ) ( not ( = ?auto_908485 ?auto_908493 ) ) ( not ( = ?auto_908485 ?auto_908494 ) ) ( not ( = ?auto_908485 ?auto_908495 ) ) ( not ( = ?auto_908486 ?auto_908487 ) ) ( not ( = ?auto_908486 ?auto_908488 ) ) ( not ( = ?auto_908486 ?auto_908489 ) ) ( not ( = ?auto_908486 ?auto_908490 ) ) ( not ( = ?auto_908486 ?auto_908491 ) ) ( not ( = ?auto_908486 ?auto_908492 ) ) ( not ( = ?auto_908486 ?auto_908493 ) ) ( not ( = ?auto_908486 ?auto_908494 ) ) ( not ( = ?auto_908486 ?auto_908495 ) ) ( not ( = ?auto_908487 ?auto_908488 ) ) ( not ( = ?auto_908487 ?auto_908489 ) ) ( not ( = ?auto_908487 ?auto_908490 ) ) ( not ( = ?auto_908487 ?auto_908491 ) ) ( not ( = ?auto_908487 ?auto_908492 ) ) ( not ( = ?auto_908487 ?auto_908493 ) ) ( not ( = ?auto_908487 ?auto_908494 ) ) ( not ( = ?auto_908487 ?auto_908495 ) ) ( not ( = ?auto_908488 ?auto_908489 ) ) ( not ( = ?auto_908488 ?auto_908490 ) ) ( not ( = ?auto_908488 ?auto_908491 ) ) ( not ( = ?auto_908488 ?auto_908492 ) ) ( not ( = ?auto_908488 ?auto_908493 ) ) ( not ( = ?auto_908488 ?auto_908494 ) ) ( not ( = ?auto_908488 ?auto_908495 ) ) ( not ( = ?auto_908489 ?auto_908490 ) ) ( not ( = ?auto_908489 ?auto_908491 ) ) ( not ( = ?auto_908489 ?auto_908492 ) ) ( not ( = ?auto_908489 ?auto_908493 ) ) ( not ( = ?auto_908489 ?auto_908494 ) ) ( not ( = ?auto_908489 ?auto_908495 ) ) ( not ( = ?auto_908490 ?auto_908491 ) ) ( not ( = ?auto_908490 ?auto_908492 ) ) ( not ( = ?auto_908490 ?auto_908493 ) ) ( not ( = ?auto_908490 ?auto_908494 ) ) ( not ( = ?auto_908490 ?auto_908495 ) ) ( not ( = ?auto_908491 ?auto_908492 ) ) ( not ( = ?auto_908491 ?auto_908493 ) ) ( not ( = ?auto_908491 ?auto_908494 ) ) ( not ( = ?auto_908491 ?auto_908495 ) ) ( not ( = ?auto_908492 ?auto_908493 ) ) ( not ( = ?auto_908492 ?auto_908494 ) ) ( not ( = ?auto_908492 ?auto_908495 ) ) ( not ( = ?auto_908493 ?auto_908494 ) ) ( not ( = ?auto_908493 ?auto_908495 ) ) ( not ( = ?auto_908494 ?auto_908495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_908494 ?auto_908495 )
      ( !STACK ?auto_908494 ?auto_908493 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908530 - BLOCK
      ?auto_908531 - BLOCK
      ?auto_908532 - BLOCK
      ?auto_908533 - BLOCK
      ?auto_908534 - BLOCK
      ?auto_908535 - BLOCK
      ?auto_908536 - BLOCK
      ?auto_908537 - BLOCK
      ?auto_908538 - BLOCK
      ?auto_908539 - BLOCK
      ?auto_908540 - BLOCK
    )
    :vars
    (
      ?auto_908541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908540 ?auto_908541 ) ( ON-TABLE ?auto_908530 ) ( ON ?auto_908531 ?auto_908530 ) ( ON ?auto_908532 ?auto_908531 ) ( ON ?auto_908533 ?auto_908532 ) ( ON ?auto_908534 ?auto_908533 ) ( ON ?auto_908535 ?auto_908534 ) ( ON ?auto_908536 ?auto_908535 ) ( ON ?auto_908537 ?auto_908536 ) ( ON ?auto_908538 ?auto_908537 ) ( not ( = ?auto_908530 ?auto_908531 ) ) ( not ( = ?auto_908530 ?auto_908532 ) ) ( not ( = ?auto_908530 ?auto_908533 ) ) ( not ( = ?auto_908530 ?auto_908534 ) ) ( not ( = ?auto_908530 ?auto_908535 ) ) ( not ( = ?auto_908530 ?auto_908536 ) ) ( not ( = ?auto_908530 ?auto_908537 ) ) ( not ( = ?auto_908530 ?auto_908538 ) ) ( not ( = ?auto_908530 ?auto_908539 ) ) ( not ( = ?auto_908530 ?auto_908540 ) ) ( not ( = ?auto_908530 ?auto_908541 ) ) ( not ( = ?auto_908531 ?auto_908532 ) ) ( not ( = ?auto_908531 ?auto_908533 ) ) ( not ( = ?auto_908531 ?auto_908534 ) ) ( not ( = ?auto_908531 ?auto_908535 ) ) ( not ( = ?auto_908531 ?auto_908536 ) ) ( not ( = ?auto_908531 ?auto_908537 ) ) ( not ( = ?auto_908531 ?auto_908538 ) ) ( not ( = ?auto_908531 ?auto_908539 ) ) ( not ( = ?auto_908531 ?auto_908540 ) ) ( not ( = ?auto_908531 ?auto_908541 ) ) ( not ( = ?auto_908532 ?auto_908533 ) ) ( not ( = ?auto_908532 ?auto_908534 ) ) ( not ( = ?auto_908532 ?auto_908535 ) ) ( not ( = ?auto_908532 ?auto_908536 ) ) ( not ( = ?auto_908532 ?auto_908537 ) ) ( not ( = ?auto_908532 ?auto_908538 ) ) ( not ( = ?auto_908532 ?auto_908539 ) ) ( not ( = ?auto_908532 ?auto_908540 ) ) ( not ( = ?auto_908532 ?auto_908541 ) ) ( not ( = ?auto_908533 ?auto_908534 ) ) ( not ( = ?auto_908533 ?auto_908535 ) ) ( not ( = ?auto_908533 ?auto_908536 ) ) ( not ( = ?auto_908533 ?auto_908537 ) ) ( not ( = ?auto_908533 ?auto_908538 ) ) ( not ( = ?auto_908533 ?auto_908539 ) ) ( not ( = ?auto_908533 ?auto_908540 ) ) ( not ( = ?auto_908533 ?auto_908541 ) ) ( not ( = ?auto_908534 ?auto_908535 ) ) ( not ( = ?auto_908534 ?auto_908536 ) ) ( not ( = ?auto_908534 ?auto_908537 ) ) ( not ( = ?auto_908534 ?auto_908538 ) ) ( not ( = ?auto_908534 ?auto_908539 ) ) ( not ( = ?auto_908534 ?auto_908540 ) ) ( not ( = ?auto_908534 ?auto_908541 ) ) ( not ( = ?auto_908535 ?auto_908536 ) ) ( not ( = ?auto_908535 ?auto_908537 ) ) ( not ( = ?auto_908535 ?auto_908538 ) ) ( not ( = ?auto_908535 ?auto_908539 ) ) ( not ( = ?auto_908535 ?auto_908540 ) ) ( not ( = ?auto_908535 ?auto_908541 ) ) ( not ( = ?auto_908536 ?auto_908537 ) ) ( not ( = ?auto_908536 ?auto_908538 ) ) ( not ( = ?auto_908536 ?auto_908539 ) ) ( not ( = ?auto_908536 ?auto_908540 ) ) ( not ( = ?auto_908536 ?auto_908541 ) ) ( not ( = ?auto_908537 ?auto_908538 ) ) ( not ( = ?auto_908537 ?auto_908539 ) ) ( not ( = ?auto_908537 ?auto_908540 ) ) ( not ( = ?auto_908537 ?auto_908541 ) ) ( not ( = ?auto_908538 ?auto_908539 ) ) ( not ( = ?auto_908538 ?auto_908540 ) ) ( not ( = ?auto_908538 ?auto_908541 ) ) ( not ( = ?auto_908539 ?auto_908540 ) ) ( not ( = ?auto_908539 ?auto_908541 ) ) ( not ( = ?auto_908540 ?auto_908541 ) ) ( CLEAR ?auto_908538 ) ( ON ?auto_908539 ?auto_908540 ) ( CLEAR ?auto_908539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_908530 ?auto_908531 ?auto_908532 ?auto_908533 ?auto_908534 ?auto_908535 ?auto_908536 ?auto_908537 ?auto_908538 ?auto_908539 )
      ( MAKE-11PILE ?auto_908530 ?auto_908531 ?auto_908532 ?auto_908533 ?auto_908534 ?auto_908535 ?auto_908536 ?auto_908537 ?auto_908538 ?auto_908539 ?auto_908540 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908576 - BLOCK
      ?auto_908577 - BLOCK
      ?auto_908578 - BLOCK
      ?auto_908579 - BLOCK
      ?auto_908580 - BLOCK
      ?auto_908581 - BLOCK
      ?auto_908582 - BLOCK
      ?auto_908583 - BLOCK
      ?auto_908584 - BLOCK
      ?auto_908585 - BLOCK
      ?auto_908586 - BLOCK
    )
    :vars
    (
      ?auto_908587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908586 ?auto_908587 ) ( ON-TABLE ?auto_908576 ) ( ON ?auto_908577 ?auto_908576 ) ( ON ?auto_908578 ?auto_908577 ) ( ON ?auto_908579 ?auto_908578 ) ( ON ?auto_908580 ?auto_908579 ) ( ON ?auto_908581 ?auto_908580 ) ( ON ?auto_908582 ?auto_908581 ) ( ON ?auto_908583 ?auto_908582 ) ( not ( = ?auto_908576 ?auto_908577 ) ) ( not ( = ?auto_908576 ?auto_908578 ) ) ( not ( = ?auto_908576 ?auto_908579 ) ) ( not ( = ?auto_908576 ?auto_908580 ) ) ( not ( = ?auto_908576 ?auto_908581 ) ) ( not ( = ?auto_908576 ?auto_908582 ) ) ( not ( = ?auto_908576 ?auto_908583 ) ) ( not ( = ?auto_908576 ?auto_908584 ) ) ( not ( = ?auto_908576 ?auto_908585 ) ) ( not ( = ?auto_908576 ?auto_908586 ) ) ( not ( = ?auto_908576 ?auto_908587 ) ) ( not ( = ?auto_908577 ?auto_908578 ) ) ( not ( = ?auto_908577 ?auto_908579 ) ) ( not ( = ?auto_908577 ?auto_908580 ) ) ( not ( = ?auto_908577 ?auto_908581 ) ) ( not ( = ?auto_908577 ?auto_908582 ) ) ( not ( = ?auto_908577 ?auto_908583 ) ) ( not ( = ?auto_908577 ?auto_908584 ) ) ( not ( = ?auto_908577 ?auto_908585 ) ) ( not ( = ?auto_908577 ?auto_908586 ) ) ( not ( = ?auto_908577 ?auto_908587 ) ) ( not ( = ?auto_908578 ?auto_908579 ) ) ( not ( = ?auto_908578 ?auto_908580 ) ) ( not ( = ?auto_908578 ?auto_908581 ) ) ( not ( = ?auto_908578 ?auto_908582 ) ) ( not ( = ?auto_908578 ?auto_908583 ) ) ( not ( = ?auto_908578 ?auto_908584 ) ) ( not ( = ?auto_908578 ?auto_908585 ) ) ( not ( = ?auto_908578 ?auto_908586 ) ) ( not ( = ?auto_908578 ?auto_908587 ) ) ( not ( = ?auto_908579 ?auto_908580 ) ) ( not ( = ?auto_908579 ?auto_908581 ) ) ( not ( = ?auto_908579 ?auto_908582 ) ) ( not ( = ?auto_908579 ?auto_908583 ) ) ( not ( = ?auto_908579 ?auto_908584 ) ) ( not ( = ?auto_908579 ?auto_908585 ) ) ( not ( = ?auto_908579 ?auto_908586 ) ) ( not ( = ?auto_908579 ?auto_908587 ) ) ( not ( = ?auto_908580 ?auto_908581 ) ) ( not ( = ?auto_908580 ?auto_908582 ) ) ( not ( = ?auto_908580 ?auto_908583 ) ) ( not ( = ?auto_908580 ?auto_908584 ) ) ( not ( = ?auto_908580 ?auto_908585 ) ) ( not ( = ?auto_908580 ?auto_908586 ) ) ( not ( = ?auto_908580 ?auto_908587 ) ) ( not ( = ?auto_908581 ?auto_908582 ) ) ( not ( = ?auto_908581 ?auto_908583 ) ) ( not ( = ?auto_908581 ?auto_908584 ) ) ( not ( = ?auto_908581 ?auto_908585 ) ) ( not ( = ?auto_908581 ?auto_908586 ) ) ( not ( = ?auto_908581 ?auto_908587 ) ) ( not ( = ?auto_908582 ?auto_908583 ) ) ( not ( = ?auto_908582 ?auto_908584 ) ) ( not ( = ?auto_908582 ?auto_908585 ) ) ( not ( = ?auto_908582 ?auto_908586 ) ) ( not ( = ?auto_908582 ?auto_908587 ) ) ( not ( = ?auto_908583 ?auto_908584 ) ) ( not ( = ?auto_908583 ?auto_908585 ) ) ( not ( = ?auto_908583 ?auto_908586 ) ) ( not ( = ?auto_908583 ?auto_908587 ) ) ( not ( = ?auto_908584 ?auto_908585 ) ) ( not ( = ?auto_908584 ?auto_908586 ) ) ( not ( = ?auto_908584 ?auto_908587 ) ) ( not ( = ?auto_908585 ?auto_908586 ) ) ( not ( = ?auto_908585 ?auto_908587 ) ) ( not ( = ?auto_908586 ?auto_908587 ) ) ( ON ?auto_908585 ?auto_908586 ) ( CLEAR ?auto_908583 ) ( ON ?auto_908584 ?auto_908585 ) ( CLEAR ?auto_908584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_908576 ?auto_908577 ?auto_908578 ?auto_908579 ?auto_908580 ?auto_908581 ?auto_908582 ?auto_908583 ?auto_908584 )
      ( MAKE-11PILE ?auto_908576 ?auto_908577 ?auto_908578 ?auto_908579 ?auto_908580 ?auto_908581 ?auto_908582 ?auto_908583 ?auto_908584 ?auto_908585 ?auto_908586 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908622 - BLOCK
      ?auto_908623 - BLOCK
      ?auto_908624 - BLOCK
      ?auto_908625 - BLOCK
      ?auto_908626 - BLOCK
      ?auto_908627 - BLOCK
      ?auto_908628 - BLOCK
      ?auto_908629 - BLOCK
      ?auto_908630 - BLOCK
      ?auto_908631 - BLOCK
      ?auto_908632 - BLOCK
    )
    :vars
    (
      ?auto_908633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908632 ?auto_908633 ) ( ON-TABLE ?auto_908622 ) ( ON ?auto_908623 ?auto_908622 ) ( ON ?auto_908624 ?auto_908623 ) ( ON ?auto_908625 ?auto_908624 ) ( ON ?auto_908626 ?auto_908625 ) ( ON ?auto_908627 ?auto_908626 ) ( ON ?auto_908628 ?auto_908627 ) ( not ( = ?auto_908622 ?auto_908623 ) ) ( not ( = ?auto_908622 ?auto_908624 ) ) ( not ( = ?auto_908622 ?auto_908625 ) ) ( not ( = ?auto_908622 ?auto_908626 ) ) ( not ( = ?auto_908622 ?auto_908627 ) ) ( not ( = ?auto_908622 ?auto_908628 ) ) ( not ( = ?auto_908622 ?auto_908629 ) ) ( not ( = ?auto_908622 ?auto_908630 ) ) ( not ( = ?auto_908622 ?auto_908631 ) ) ( not ( = ?auto_908622 ?auto_908632 ) ) ( not ( = ?auto_908622 ?auto_908633 ) ) ( not ( = ?auto_908623 ?auto_908624 ) ) ( not ( = ?auto_908623 ?auto_908625 ) ) ( not ( = ?auto_908623 ?auto_908626 ) ) ( not ( = ?auto_908623 ?auto_908627 ) ) ( not ( = ?auto_908623 ?auto_908628 ) ) ( not ( = ?auto_908623 ?auto_908629 ) ) ( not ( = ?auto_908623 ?auto_908630 ) ) ( not ( = ?auto_908623 ?auto_908631 ) ) ( not ( = ?auto_908623 ?auto_908632 ) ) ( not ( = ?auto_908623 ?auto_908633 ) ) ( not ( = ?auto_908624 ?auto_908625 ) ) ( not ( = ?auto_908624 ?auto_908626 ) ) ( not ( = ?auto_908624 ?auto_908627 ) ) ( not ( = ?auto_908624 ?auto_908628 ) ) ( not ( = ?auto_908624 ?auto_908629 ) ) ( not ( = ?auto_908624 ?auto_908630 ) ) ( not ( = ?auto_908624 ?auto_908631 ) ) ( not ( = ?auto_908624 ?auto_908632 ) ) ( not ( = ?auto_908624 ?auto_908633 ) ) ( not ( = ?auto_908625 ?auto_908626 ) ) ( not ( = ?auto_908625 ?auto_908627 ) ) ( not ( = ?auto_908625 ?auto_908628 ) ) ( not ( = ?auto_908625 ?auto_908629 ) ) ( not ( = ?auto_908625 ?auto_908630 ) ) ( not ( = ?auto_908625 ?auto_908631 ) ) ( not ( = ?auto_908625 ?auto_908632 ) ) ( not ( = ?auto_908625 ?auto_908633 ) ) ( not ( = ?auto_908626 ?auto_908627 ) ) ( not ( = ?auto_908626 ?auto_908628 ) ) ( not ( = ?auto_908626 ?auto_908629 ) ) ( not ( = ?auto_908626 ?auto_908630 ) ) ( not ( = ?auto_908626 ?auto_908631 ) ) ( not ( = ?auto_908626 ?auto_908632 ) ) ( not ( = ?auto_908626 ?auto_908633 ) ) ( not ( = ?auto_908627 ?auto_908628 ) ) ( not ( = ?auto_908627 ?auto_908629 ) ) ( not ( = ?auto_908627 ?auto_908630 ) ) ( not ( = ?auto_908627 ?auto_908631 ) ) ( not ( = ?auto_908627 ?auto_908632 ) ) ( not ( = ?auto_908627 ?auto_908633 ) ) ( not ( = ?auto_908628 ?auto_908629 ) ) ( not ( = ?auto_908628 ?auto_908630 ) ) ( not ( = ?auto_908628 ?auto_908631 ) ) ( not ( = ?auto_908628 ?auto_908632 ) ) ( not ( = ?auto_908628 ?auto_908633 ) ) ( not ( = ?auto_908629 ?auto_908630 ) ) ( not ( = ?auto_908629 ?auto_908631 ) ) ( not ( = ?auto_908629 ?auto_908632 ) ) ( not ( = ?auto_908629 ?auto_908633 ) ) ( not ( = ?auto_908630 ?auto_908631 ) ) ( not ( = ?auto_908630 ?auto_908632 ) ) ( not ( = ?auto_908630 ?auto_908633 ) ) ( not ( = ?auto_908631 ?auto_908632 ) ) ( not ( = ?auto_908631 ?auto_908633 ) ) ( not ( = ?auto_908632 ?auto_908633 ) ) ( ON ?auto_908631 ?auto_908632 ) ( ON ?auto_908630 ?auto_908631 ) ( CLEAR ?auto_908628 ) ( ON ?auto_908629 ?auto_908630 ) ( CLEAR ?auto_908629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_908622 ?auto_908623 ?auto_908624 ?auto_908625 ?auto_908626 ?auto_908627 ?auto_908628 ?auto_908629 )
      ( MAKE-11PILE ?auto_908622 ?auto_908623 ?auto_908624 ?auto_908625 ?auto_908626 ?auto_908627 ?auto_908628 ?auto_908629 ?auto_908630 ?auto_908631 ?auto_908632 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908668 - BLOCK
      ?auto_908669 - BLOCK
      ?auto_908670 - BLOCK
      ?auto_908671 - BLOCK
      ?auto_908672 - BLOCK
      ?auto_908673 - BLOCK
      ?auto_908674 - BLOCK
      ?auto_908675 - BLOCK
      ?auto_908676 - BLOCK
      ?auto_908677 - BLOCK
      ?auto_908678 - BLOCK
    )
    :vars
    (
      ?auto_908679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908678 ?auto_908679 ) ( ON-TABLE ?auto_908668 ) ( ON ?auto_908669 ?auto_908668 ) ( ON ?auto_908670 ?auto_908669 ) ( ON ?auto_908671 ?auto_908670 ) ( ON ?auto_908672 ?auto_908671 ) ( ON ?auto_908673 ?auto_908672 ) ( not ( = ?auto_908668 ?auto_908669 ) ) ( not ( = ?auto_908668 ?auto_908670 ) ) ( not ( = ?auto_908668 ?auto_908671 ) ) ( not ( = ?auto_908668 ?auto_908672 ) ) ( not ( = ?auto_908668 ?auto_908673 ) ) ( not ( = ?auto_908668 ?auto_908674 ) ) ( not ( = ?auto_908668 ?auto_908675 ) ) ( not ( = ?auto_908668 ?auto_908676 ) ) ( not ( = ?auto_908668 ?auto_908677 ) ) ( not ( = ?auto_908668 ?auto_908678 ) ) ( not ( = ?auto_908668 ?auto_908679 ) ) ( not ( = ?auto_908669 ?auto_908670 ) ) ( not ( = ?auto_908669 ?auto_908671 ) ) ( not ( = ?auto_908669 ?auto_908672 ) ) ( not ( = ?auto_908669 ?auto_908673 ) ) ( not ( = ?auto_908669 ?auto_908674 ) ) ( not ( = ?auto_908669 ?auto_908675 ) ) ( not ( = ?auto_908669 ?auto_908676 ) ) ( not ( = ?auto_908669 ?auto_908677 ) ) ( not ( = ?auto_908669 ?auto_908678 ) ) ( not ( = ?auto_908669 ?auto_908679 ) ) ( not ( = ?auto_908670 ?auto_908671 ) ) ( not ( = ?auto_908670 ?auto_908672 ) ) ( not ( = ?auto_908670 ?auto_908673 ) ) ( not ( = ?auto_908670 ?auto_908674 ) ) ( not ( = ?auto_908670 ?auto_908675 ) ) ( not ( = ?auto_908670 ?auto_908676 ) ) ( not ( = ?auto_908670 ?auto_908677 ) ) ( not ( = ?auto_908670 ?auto_908678 ) ) ( not ( = ?auto_908670 ?auto_908679 ) ) ( not ( = ?auto_908671 ?auto_908672 ) ) ( not ( = ?auto_908671 ?auto_908673 ) ) ( not ( = ?auto_908671 ?auto_908674 ) ) ( not ( = ?auto_908671 ?auto_908675 ) ) ( not ( = ?auto_908671 ?auto_908676 ) ) ( not ( = ?auto_908671 ?auto_908677 ) ) ( not ( = ?auto_908671 ?auto_908678 ) ) ( not ( = ?auto_908671 ?auto_908679 ) ) ( not ( = ?auto_908672 ?auto_908673 ) ) ( not ( = ?auto_908672 ?auto_908674 ) ) ( not ( = ?auto_908672 ?auto_908675 ) ) ( not ( = ?auto_908672 ?auto_908676 ) ) ( not ( = ?auto_908672 ?auto_908677 ) ) ( not ( = ?auto_908672 ?auto_908678 ) ) ( not ( = ?auto_908672 ?auto_908679 ) ) ( not ( = ?auto_908673 ?auto_908674 ) ) ( not ( = ?auto_908673 ?auto_908675 ) ) ( not ( = ?auto_908673 ?auto_908676 ) ) ( not ( = ?auto_908673 ?auto_908677 ) ) ( not ( = ?auto_908673 ?auto_908678 ) ) ( not ( = ?auto_908673 ?auto_908679 ) ) ( not ( = ?auto_908674 ?auto_908675 ) ) ( not ( = ?auto_908674 ?auto_908676 ) ) ( not ( = ?auto_908674 ?auto_908677 ) ) ( not ( = ?auto_908674 ?auto_908678 ) ) ( not ( = ?auto_908674 ?auto_908679 ) ) ( not ( = ?auto_908675 ?auto_908676 ) ) ( not ( = ?auto_908675 ?auto_908677 ) ) ( not ( = ?auto_908675 ?auto_908678 ) ) ( not ( = ?auto_908675 ?auto_908679 ) ) ( not ( = ?auto_908676 ?auto_908677 ) ) ( not ( = ?auto_908676 ?auto_908678 ) ) ( not ( = ?auto_908676 ?auto_908679 ) ) ( not ( = ?auto_908677 ?auto_908678 ) ) ( not ( = ?auto_908677 ?auto_908679 ) ) ( not ( = ?auto_908678 ?auto_908679 ) ) ( ON ?auto_908677 ?auto_908678 ) ( ON ?auto_908676 ?auto_908677 ) ( ON ?auto_908675 ?auto_908676 ) ( CLEAR ?auto_908673 ) ( ON ?auto_908674 ?auto_908675 ) ( CLEAR ?auto_908674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_908668 ?auto_908669 ?auto_908670 ?auto_908671 ?auto_908672 ?auto_908673 ?auto_908674 )
      ( MAKE-11PILE ?auto_908668 ?auto_908669 ?auto_908670 ?auto_908671 ?auto_908672 ?auto_908673 ?auto_908674 ?auto_908675 ?auto_908676 ?auto_908677 ?auto_908678 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908714 - BLOCK
      ?auto_908715 - BLOCK
      ?auto_908716 - BLOCK
      ?auto_908717 - BLOCK
      ?auto_908718 - BLOCK
      ?auto_908719 - BLOCK
      ?auto_908720 - BLOCK
      ?auto_908721 - BLOCK
      ?auto_908722 - BLOCK
      ?auto_908723 - BLOCK
      ?auto_908724 - BLOCK
    )
    :vars
    (
      ?auto_908725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908724 ?auto_908725 ) ( ON-TABLE ?auto_908714 ) ( ON ?auto_908715 ?auto_908714 ) ( ON ?auto_908716 ?auto_908715 ) ( ON ?auto_908717 ?auto_908716 ) ( ON ?auto_908718 ?auto_908717 ) ( not ( = ?auto_908714 ?auto_908715 ) ) ( not ( = ?auto_908714 ?auto_908716 ) ) ( not ( = ?auto_908714 ?auto_908717 ) ) ( not ( = ?auto_908714 ?auto_908718 ) ) ( not ( = ?auto_908714 ?auto_908719 ) ) ( not ( = ?auto_908714 ?auto_908720 ) ) ( not ( = ?auto_908714 ?auto_908721 ) ) ( not ( = ?auto_908714 ?auto_908722 ) ) ( not ( = ?auto_908714 ?auto_908723 ) ) ( not ( = ?auto_908714 ?auto_908724 ) ) ( not ( = ?auto_908714 ?auto_908725 ) ) ( not ( = ?auto_908715 ?auto_908716 ) ) ( not ( = ?auto_908715 ?auto_908717 ) ) ( not ( = ?auto_908715 ?auto_908718 ) ) ( not ( = ?auto_908715 ?auto_908719 ) ) ( not ( = ?auto_908715 ?auto_908720 ) ) ( not ( = ?auto_908715 ?auto_908721 ) ) ( not ( = ?auto_908715 ?auto_908722 ) ) ( not ( = ?auto_908715 ?auto_908723 ) ) ( not ( = ?auto_908715 ?auto_908724 ) ) ( not ( = ?auto_908715 ?auto_908725 ) ) ( not ( = ?auto_908716 ?auto_908717 ) ) ( not ( = ?auto_908716 ?auto_908718 ) ) ( not ( = ?auto_908716 ?auto_908719 ) ) ( not ( = ?auto_908716 ?auto_908720 ) ) ( not ( = ?auto_908716 ?auto_908721 ) ) ( not ( = ?auto_908716 ?auto_908722 ) ) ( not ( = ?auto_908716 ?auto_908723 ) ) ( not ( = ?auto_908716 ?auto_908724 ) ) ( not ( = ?auto_908716 ?auto_908725 ) ) ( not ( = ?auto_908717 ?auto_908718 ) ) ( not ( = ?auto_908717 ?auto_908719 ) ) ( not ( = ?auto_908717 ?auto_908720 ) ) ( not ( = ?auto_908717 ?auto_908721 ) ) ( not ( = ?auto_908717 ?auto_908722 ) ) ( not ( = ?auto_908717 ?auto_908723 ) ) ( not ( = ?auto_908717 ?auto_908724 ) ) ( not ( = ?auto_908717 ?auto_908725 ) ) ( not ( = ?auto_908718 ?auto_908719 ) ) ( not ( = ?auto_908718 ?auto_908720 ) ) ( not ( = ?auto_908718 ?auto_908721 ) ) ( not ( = ?auto_908718 ?auto_908722 ) ) ( not ( = ?auto_908718 ?auto_908723 ) ) ( not ( = ?auto_908718 ?auto_908724 ) ) ( not ( = ?auto_908718 ?auto_908725 ) ) ( not ( = ?auto_908719 ?auto_908720 ) ) ( not ( = ?auto_908719 ?auto_908721 ) ) ( not ( = ?auto_908719 ?auto_908722 ) ) ( not ( = ?auto_908719 ?auto_908723 ) ) ( not ( = ?auto_908719 ?auto_908724 ) ) ( not ( = ?auto_908719 ?auto_908725 ) ) ( not ( = ?auto_908720 ?auto_908721 ) ) ( not ( = ?auto_908720 ?auto_908722 ) ) ( not ( = ?auto_908720 ?auto_908723 ) ) ( not ( = ?auto_908720 ?auto_908724 ) ) ( not ( = ?auto_908720 ?auto_908725 ) ) ( not ( = ?auto_908721 ?auto_908722 ) ) ( not ( = ?auto_908721 ?auto_908723 ) ) ( not ( = ?auto_908721 ?auto_908724 ) ) ( not ( = ?auto_908721 ?auto_908725 ) ) ( not ( = ?auto_908722 ?auto_908723 ) ) ( not ( = ?auto_908722 ?auto_908724 ) ) ( not ( = ?auto_908722 ?auto_908725 ) ) ( not ( = ?auto_908723 ?auto_908724 ) ) ( not ( = ?auto_908723 ?auto_908725 ) ) ( not ( = ?auto_908724 ?auto_908725 ) ) ( ON ?auto_908723 ?auto_908724 ) ( ON ?auto_908722 ?auto_908723 ) ( ON ?auto_908721 ?auto_908722 ) ( ON ?auto_908720 ?auto_908721 ) ( CLEAR ?auto_908718 ) ( ON ?auto_908719 ?auto_908720 ) ( CLEAR ?auto_908719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_908714 ?auto_908715 ?auto_908716 ?auto_908717 ?auto_908718 ?auto_908719 )
      ( MAKE-11PILE ?auto_908714 ?auto_908715 ?auto_908716 ?auto_908717 ?auto_908718 ?auto_908719 ?auto_908720 ?auto_908721 ?auto_908722 ?auto_908723 ?auto_908724 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908760 - BLOCK
      ?auto_908761 - BLOCK
      ?auto_908762 - BLOCK
      ?auto_908763 - BLOCK
      ?auto_908764 - BLOCK
      ?auto_908765 - BLOCK
      ?auto_908766 - BLOCK
      ?auto_908767 - BLOCK
      ?auto_908768 - BLOCK
      ?auto_908769 - BLOCK
      ?auto_908770 - BLOCK
    )
    :vars
    (
      ?auto_908771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908770 ?auto_908771 ) ( ON-TABLE ?auto_908760 ) ( ON ?auto_908761 ?auto_908760 ) ( ON ?auto_908762 ?auto_908761 ) ( ON ?auto_908763 ?auto_908762 ) ( not ( = ?auto_908760 ?auto_908761 ) ) ( not ( = ?auto_908760 ?auto_908762 ) ) ( not ( = ?auto_908760 ?auto_908763 ) ) ( not ( = ?auto_908760 ?auto_908764 ) ) ( not ( = ?auto_908760 ?auto_908765 ) ) ( not ( = ?auto_908760 ?auto_908766 ) ) ( not ( = ?auto_908760 ?auto_908767 ) ) ( not ( = ?auto_908760 ?auto_908768 ) ) ( not ( = ?auto_908760 ?auto_908769 ) ) ( not ( = ?auto_908760 ?auto_908770 ) ) ( not ( = ?auto_908760 ?auto_908771 ) ) ( not ( = ?auto_908761 ?auto_908762 ) ) ( not ( = ?auto_908761 ?auto_908763 ) ) ( not ( = ?auto_908761 ?auto_908764 ) ) ( not ( = ?auto_908761 ?auto_908765 ) ) ( not ( = ?auto_908761 ?auto_908766 ) ) ( not ( = ?auto_908761 ?auto_908767 ) ) ( not ( = ?auto_908761 ?auto_908768 ) ) ( not ( = ?auto_908761 ?auto_908769 ) ) ( not ( = ?auto_908761 ?auto_908770 ) ) ( not ( = ?auto_908761 ?auto_908771 ) ) ( not ( = ?auto_908762 ?auto_908763 ) ) ( not ( = ?auto_908762 ?auto_908764 ) ) ( not ( = ?auto_908762 ?auto_908765 ) ) ( not ( = ?auto_908762 ?auto_908766 ) ) ( not ( = ?auto_908762 ?auto_908767 ) ) ( not ( = ?auto_908762 ?auto_908768 ) ) ( not ( = ?auto_908762 ?auto_908769 ) ) ( not ( = ?auto_908762 ?auto_908770 ) ) ( not ( = ?auto_908762 ?auto_908771 ) ) ( not ( = ?auto_908763 ?auto_908764 ) ) ( not ( = ?auto_908763 ?auto_908765 ) ) ( not ( = ?auto_908763 ?auto_908766 ) ) ( not ( = ?auto_908763 ?auto_908767 ) ) ( not ( = ?auto_908763 ?auto_908768 ) ) ( not ( = ?auto_908763 ?auto_908769 ) ) ( not ( = ?auto_908763 ?auto_908770 ) ) ( not ( = ?auto_908763 ?auto_908771 ) ) ( not ( = ?auto_908764 ?auto_908765 ) ) ( not ( = ?auto_908764 ?auto_908766 ) ) ( not ( = ?auto_908764 ?auto_908767 ) ) ( not ( = ?auto_908764 ?auto_908768 ) ) ( not ( = ?auto_908764 ?auto_908769 ) ) ( not ( = ?auto_908764 ?auto_908770 ) ) ( not ( = ?auto_908764 ?auto_908771 ) ) ( not ( = ?auto_908765 ?auto_908766 ) ) ( not ( = ?auto_908765 ?auto_908767 ) ) ( not ( = ?auto_908765 ?auto_908768 ) ) ( not ( = ?auto_908765 ?auto_908769 ) ) ( not ( = ?auto_908765 ?auto_908770 ) ) ( not ( = ?auto_908765 ?auto_908771 ) ) ( not ( = ?auto_908766 ?auto_908767 ) ) ( not ( = ?auto_908766 ?auto_908768 ) ) ( not ( = ?auto_908766 ?auto_908769 ) ) ( not ( = ?auto_908766 ?auto_908770 ) ) ( not ( = ?auto_908766 ?auto_908771 ) ) ( not ( = ?auto_908767 ?auto_908768 ) ) ( not ( = ?auto_908767 ?auto_908769 ) ) ( not ( = ?auto_908767 ?auto_908770 ) ) ( not ( = ?auto_908767 ?auto_908771 ) ) ( not ( = ?auto_908768 ?auto_908769 ) ) ( not ( = ?auto_908768 ?auto_908770 ) ) ( not ( = ?auto_908768 ?auto_908771 ) ) ( not ( = ?auto_908769 ?auto_908770 ) ) ( not ( = ?auto_908769 ?auto_908771 ) ) ( not ( = ?auto_908770 ?auto_908771 ) ) ( ON ?auto_908769 ?auto_908770 ) ( ON ?auto_908768 ?auto_908769 ) ( ON ?auto_908767 ?auto_908768 ) ( ON ?auto_908766 ?auto_908767 ) ( ON ?auto_908765 ?auto_908766 ) ( CLEAR ?auto_908763 ) ( ON ?auto_908764 ?auto_908765 ) ( CLEAR ?auto_908764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_908760 ?auto_908761 ?auto_908762 ?auto_908763 ?auto_908764 )
      ( MAKE-11PILE ?auto_908760 ?auto_908761 ?auto_908762 ?auto_908763 ?auto_908764 ?auto_908765 ?auto_908766 ?auto_908767 ?auto_908768 ?auto_908769 ?auto_908770 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908806 - BLOCK
      ?auto_908807 - BLOCK
      ?auto_908808 - BLOCK
      ?auto_908809 - BLOCK
      ?auto_908810 - BLOCK
      ?auto_908811 - BLOCK
      ?auto_908812 - BLOCK
      ?auto_908813 - BLOCK
      ?auto_908814 - BLOCK
      ?auto_908815 - BLOCK
      ?auto_908816 - BLOCK
    )
    :vars
    (
      ?auto_908817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908816 ?auto_908817 ) ( ON-TABLE ?auto_908806 ) ( ON ?auto_908807 ?auto_908806 ) ( ON ?auto_908808 ?auto_908807 ) ( not ( = ?auto_908806 ?auto_908807 ) ) ( not ( = ?auto_908806 ?auto_908808 ) ) ( not ( = ?auto_908806 ?auto_908809 ) ) ( not ( = ?auto_908806 ?auto_908810 ) ) ( not ( = ?auto_908806 ?auto_908811 ) ) ( not ( = ?auto_908806 ?auto_908812 ) ) ( not ( = ?auto_908806 ?auto_908813 ) ) ( not ( = ?auto_908806 ?auto_908814 ) ) ( not ( = ?auto_908806 ?auto_908815 ) ) ( not ( = ?auto_908806 ?auto_908816 ) ) ( not ( = ?auto_908806 ?auto_908817 ) ) ( not ( = ?auto_908807 ?auto_908808 ) ) ( not ( = ?auto_908807 ?auto_908809 ) ) ( not ( = ?auto_908807 ?auto_908810 ) ) ( not ( = ?auto_908807 ?auto_908811 ) ) ( not ( = ?auto_908807 ?auto_908812 ) ) ( not ( = ?auto_908807 ?auto_908813 ) ) ( not ( = ?auto_908807 ?auto_908814 ) ) ( not ( = ?auto_908807 ?auto_908815 ) ) ( not ( = ?auto_908807 ?auto_908816 ) ) ( not ( = ?auto_908807 ?auto_908817 ) ) ( not ( = ?auto_908808 ?auto_908809 ) ) ( not ( = ?auto_908808 ?auto_908810 ) ) ( not ( = ?auto_908808 ?auto_908811 ) ) ( not ( = ?auto_908808 ?auto_908812 ) ) ( not ( = ?auto_908808 ?auto_908813 ) ) ( not ( = ?auto_908808 ?auto_908814 ) ) ( not ( = ?auto_908808 ?auto_908815 ) ) ( not ( = ?auto_908808 ?auto_908816 ) ) ( not ( = ?auto_908808 ?auto_908817 ) ) ( not ( = ?auto_908809 ?auto_908810 ) ) ( not ( = ?auto_908809 ?auto_908811 ) ) ( not ( = ?auto_908809 ?auto_908812 ) ) ( not ( = ?auto_908809 ?auto_908813 ) ) ( not ( = ?auto_908809 ?auto_908814 ) ) ( not ( = ?auto_908809 ?auto_908815 ) ) ( not ( = ?auto_908809 ?auto_908816 ) ) ( not ( = ?auto_908809 ?auto_908817 ) ) ( not ( = ?auto_908810 ?auto_908811 ) ) ( not ( = ?auto_908810 ?auto_908812 ) ) ( not ( = ?auto_908810 ?auto_908813 ) ) ( not ( = ?auto_908810 ?auto_908814 ) ) ( not ( = ?auto_908810 ?auto_908815 ) ) ( not ( = ?auto_908810 ?auto_908816 ) ) ( not ( = ?auto_908810 ?auto_908817 ) ) ( not ( = ?auto_908811 ?auto_908812 ) ) ( not ( = ?auto_908811 ?auto_908813 ) ) ( not ( = ?auto_908811 ?auto_908814 ) ) ( not ( = ?auto_908811 ?auto_908815 ) ) ( not ( = ?auto_908811 ?auto_908816 ) ) ( not ( = ?auto_908811 ?auto_908817 ) ) ( not ( = ?auto_908812 ?auto_908813 ) ) ( not ( = ?auto_908812 ?auto_908814 ) ) ( not ( = ?auto_908812 ?auto_908815 ) ) ( not ( = ?auto_908812 ?auto_908816 ) ) ( not ( = ?auto_908812 ?auto_908817 ) ) ( not ( = ?auto_908813 ?auto_908814 ) ) ( not ( = ?auto_908813 ?auto_908815 ) ) ( not ( = ?auto_908813 ?auto_908816 ) ) ( not ( = ?auto_908813 ?auto_908817 ) ) ( not ( = ?auto_908814 ?auto_908815 ) ) ( not ( = ?auto_908814 ?auto_908816 ) ) ( not ( = ?auto_908814 ?auto_908817 ) ) ( not ( = ?auto_908815 ?auto_908816 ) ) ( not ( = ?auto_908815 ?auto_908817 ) ) ( not ( = ?auto_908816 ?auto_908817 ) ) ( ON ?auto_908815 ?auto_908816 ) ( ON ?auto_908814 ?auto_908815 ) ( ON ?auto_908813 ?auto_908814 ) ( ON ?auto_908812 ?auto_908813 ) ( ON ?auto_908811 ?auto_908812 ) ( ON ?auto_908810 ?auto_908811 ) ( CLEAR ?auto_908808 ) ( ON ?auto_908809 ?auto_908810 ) ( CLEAR ?auto_908809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_908806 ?auto_908807 ?auto_908808 ?auto_908809 )
      ( MAKE-11PILE ?auto_908806 ?auto_908807 ?auto_908808 ?auto_908809 ?auto_908810 ?auto_908811 ?auto_908812 ?auto_908813 ?auto_908814 ?auto_908815 ?auto_908816 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908852 - BLOCK
      ?auto_908853 - BLOCK
      ?auto_908854 - BLOCK
      ?auto_908855 - BLOCK
      ?auto_908856 - BLOCK
      ?auto_908857 - BLOCK
      ?auto_908858 - BLOCK
      ?auto_908859 - BLOCK
      ?auto_908860 - BLOCK
      ?auto_908861 - BLOCK
      ?auto_908862 - BLOCK
    )
    :vars
    (
      ?auto_908863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908862 ?auto_908863 ) ( ON-TABLE ?auto_908852 ) ( ON ?auto_908853 ?auto_908852 ) ( not ( = ?auto_908852 ?auto_908853 ) ) ( not ( = ?auto_908852 ?auto_908854 ) ) ( not ( = ?auto_908852 ?auto_908855 ) ) ( not ( = ?auto_908852 ?auto_908856 ) ) ( not ( = ?auto_908852 ?auto_908857 ) ) ( not ( = ?auto_908852 ?auto_908858 ) ) ( not ( = ?auto_908852 ?auto_908859 ) ) ( not ( = ?auto_908852 ?auto_908860 ) ) ( not ( = ?auto_908852 ?auto_908861 ) ) ( not ( = ?auto_908852 ?auto_908862 ) ) ( not ( = ?auto_908852 ?auto_908863 ) ) ( not ( = ?auto_908853 ?auto_908854 ) ) ( not ( = ?auto_908853 ?auto_908855 ) ) ( not ( = ?auto_908853 ?auto_908856 ) ) ( not ( = ?auto_908853 ?auto_908857 ) ) ( not ( = ?auto_908853 ?auto_908858 ) ) ( not ( = ?auto_908853 ?auto_908859 ) ) ( not ( = ?auto_908853 ?auto_908860 ) ) ( not ( = ?auto_908853 ?auto_908861 ) ) ( not ( = ?auto_908853 ?auto_908862 ) ) ( not ( = ?auto_908853 ?auto_908863 ) ) ( not ( = ?auto_908854 ?auto_908855 ) ) ( not ( = ?auto_908854 ?auto_908856 ) ) ( not ( = ?auto_908854 ?auto_908857 ) ) ( not ( = ?auto_908854 ?auto_908858 ) ) ( not ( = ?auto_908854 ?auto_908859 ) ) ( not ( = ?auto_908854 ?auto_908860 ) ) ( not ( = ?auto_908854 ?auto_908861 ) ) ( not ( = ?auto_908854 ?auto_908862 ) ) ( not ( = ?auto_908854 ?auto_908863 ) ) ( not ( = ?auto_908855 ?auto_908856 ) ) ( not ( = ?auto_908855 ?auto_908857 ) ) ( not ( = ?auto_908855 ?auto_908858 ) ) ( not ( = ?auto_908855 ?auto_908859 ) ) ( not ( = ?auto_908855 ?auto_908860 ) ) ( not ( = ?auto_908855 ?auto_908861 ) ) ( not ( = ?auto_908855 ?auto_908862 ) ) ( not ( = ?auto_908855 ?auto_908863 ) ) ( not ( = ?auto_908856 ?auto_908857 ) ) ( not ( = ?auto_908856 ?auto_908858 ) ) ( not ( = ?auto_908856 ?auto_908859 ) ) ( not ( = ?auto_908856 ?auto_908860 ) ) ( not ( = ?auto_908856 ?auto_908861 ) ) ( not ( = ?auto_908856 ?auto_908862 ) ) ( not ( = ?auto_908856 ?auto_908863 ) ) ( not ( = ?auto_908857 ?auto_908858 ) ) ( not ( = ?auto_908857 ?auto_908859 ) ) ( not ( = ?auto_908857 ?auto_908860 ) ) ( not ( = ?auto_908857 ?auto_908861 ) ) ( not ( = ?auto_908857 ?auto_908862 ) ) ( not ( = ?auto_908857 ?auto_908863 ) ) ( not ( = ?auto_908858 ?auto_908859 ) ) ( not ( = ?auto_908858 ?auto_908860 ) ) ( not ( = ?auto_908858 ?auto_908861 ) ) ( not ( = ?auto_908858 ?auto_908862 ) ) ( not ( = ?auto_908858 ?auto_908863 ) ) ( not ( = ?auto_908859 ?auto_908860 ) ) ( not ( = ?auto_908859 ?auto_908861 ) ) ( not ( = ?auto_908859 ?auto_908862 ) ) ( not ( = ?auto_908859 ?auto_908863 ) ) ( not ( = ?auto_908860 ?auto_908861 ) ) ( not ( = ?auto_908860 ?auto_908862 ) ) ( not ( = ?auto_908860 ?auto_908863 ) ) ( not ( = ?auto_908861 ?auto_908862 ) ) ( not ( = ?auto_908861 ?auto_908863 ) ) ( not ( = ?auto_908862 ?auto_908863 ) ) ( ON ?auto_908861 ?auto_908862 ) ( ON ?auto_908860 ?auto_908861 ) ( ON ?auto_908859 ?auto_908860 ) ( ON ?auto_908858 ?auto_908859 ) ( ON ?auto_908857 ?auto_908858 ) ( ON ?auto_908856 ?auto_908857 ) ( ON ?auto_908855 ?auto_908856 ) ( CLEAR ?auto_908853 ) ( ON ?auto_908854 ?auto_908855 ) ( CLEAR ?auto_908854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_908852 ?auto_908853 ?auto_908854 )
      ( MAKE-11PILE ?auto_908852 ?auto_908853 ?auto_908854 ?auto_908855 ?auto_908856 ?auto_908857 ?auto_908858 ?auto_908859 ?auto_908860 ?auto_908861 ?auto_908862 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908898 - BLOCK
      ?auto_908899 - BLOCK
      ?auto_908900 - BLOCK
      ?auto_908901 - BLOCK
      ?auto_908902 - BLOCK
      ?auto_908903 - BLOCK
      ?auto_908904 - BLOCK
      ?auto_908905 - BLOCK
      ?auto_908906 - BLOCK
      ?auto_908907 - BLOCK
      ?auto_908908 - BLOCK
    )
    :vars
    (
      ?auto_908909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908908 ?auto_908909 ) ( ON-TABLE ?auto_908898 ) ( not ( = ?auto_908898 ?auto_908899 ) ) ( not ( = ?auto_908898 ?auto_908900 ) ) ( not ( = ?auto_908898 ?auto_908901 ) ) ( not ( = ?auto_908898 ?auto_908902 ) ) ( not ( = ?auto_908898 ?auto_908903 ) ) ( not ( = ?auto_908898 ?auto_908904 ) ) ( not ( = ?auto_908898 ?auto_908905 ) ) ( not ( = ?auto_908898 ?auto_908906 ) ) ( not ( = ?auto_908898 ?auto_908907 ) ) ( not ( = ?auto_908898 ?auto_908908 ) ) ( not ( = ?auto_908898 ?auto_908909 ) ) ( not ( = ?auto_908899 ?auto_908900 ) ) ( not ( = ?auto_908899 ?auto_908901 ) ) ( not ( = ?auto_908899 ?auto_908902 ) ) ( not ( = ?auto_908899 ?auto_908903 ) ) ( not ( = ?auto_908899 ?auto_908904 ) ) ( not ( = ?auto_908899 ?auto_908905 ) ) ( not ( = ?auto_908899 ?auto_908906 ) ) ( not ( = ?auto_908899 ?auto_908907 ) ) ( not ( = ?auto_908899 ?auto_908908 ) ) ( not ( = ?auto_908899 ?auto_908909 ) ) ( not ( = ?auto_908900 ?auto_908901 ) ) ( not ( = ?auto_908900 ?auto_908902 ) ) ( not ( = ?auto_908900 ?auto_908903 ) ) ( not ( = ?auto_908900 ?auto_908904 ) ) ( not ( = ?auto_908900 ?auto_908905 ) ) ( not ( = ?auto_908900 ?auto_908906 ) ) ( not ( = ?auto_908900 ?auto_908907 ) ) ( not ( = ?auto_908900 ?auto_908908 ) ) ( not ( = ?auto_908900 ?auto_908909 ) ) ( not ( = ?auto_908901 ?auto_908902 ) ) ( not ( = ?auto_908901 ?auto_908903 ) ) ( not ( = ?auto_908901 ?auto_908904 ) ) ( not ( = ?auto_908901 ?auto_908905 ) ) ( not ( = ?auto_908901 ?auto_908906 ) ) ( not ( = ?auto_908901 ?auto_908907 ) ) ( not ( = ?auto_908901 ?auto_908908 ) ) ( not ( = ?auto_908901 ?auto_908909 ) ) ( not ( = ?auto_908902 ?auto_908903 ) ) ( not ( = ?auto_908902 ?auto_908904 ) ) ( not ( = ?auto_908902 ?auto_908905 ) ) ( not ( = ?auto_908902 ?auto_908906 ) ) ( not ( = ?auto_908902 ?auto_908907 ) ) ( not ( = ?auto_908902 ?auto_908908 ) ) ( not ( = ?auto_908902 ?auto_908909 ) ) ( not ( = ?auto_908903 ?auto_908904 ) ) ( not ( = ?auto_908903 ?auto_908905 ) ) ( not ( = ?auto_908903 ?auto_908906 ) ) ( not ( = ?auto_908903 ?auto_908907 ) ) ( not ( = ?auto_908903 ?auto_908908 ) ) ( not ( = ?auto_908903 ?auto_908909 ) ) ( not ( = ?auto_908904 ?auto_908905 ) ) ( not ( = ?auto_908904 ?auto_908906 ) ) ( not ( = ?auto_908904 ?auto_908907 ) ) ( not ( = ?auto_908904 ?auto_908908 ) ) ( not ( = ?auto_908904 ?auto_908909 ) ) ( not ( = ?auto_908905 ?auto_908906 ) ) ( not ( = ?auto_908905 ?auto_908907 ) ) ( not ( = ?auto_908905 ?auto_908908 ) ) ( not ( = ?auto_908905 ?auto_908909 ) ) ( not ( = ?auto_908906 ?auto_908907 ) ) ( not ( = ?auto_908906 ?auto_908908 ) ) ( not ( = ?auto_908906 ?auto_908909 ) ) ( not ( = ?auto_908907 ?auto_908908 ) ) ( not ( = ?auto_908907 ?auto_908909 ) ) ( not ( = ?auto_908908 ?auto_908909 ) ) ( ON ?auto_908907 ?auto_908908 ) ( ON ?auto_908906 ?auto_908907 ) ( ON ?auto_908905 ?auto_908906 ) ( ON ?auto_908904 ?auto_908905 ) ( ON ?auto_908903 ?auto_908904 ) ( ON ?auto_908902 ?auto_908903 ) ( ON ?auto_908901 ?auto_908902 ) ( ON ?auto_908900 ?auto_908901 ) ( CLEAR ?auto_908898 ) ( ON ?auto_908899 ?auto_908900 ) ( CLEAR ?auto_908899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_908898 ?auto_908899 )
      ( MAKE-11PILE ?auto_908898 ?auto_908899 ?auto_908900 ?auto_908901 ?auto_908902 ?auto_908903 ?auto_908904 ?auto_908905 ?auto_908906 ?auto_908907 ?auto_908908 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_908944 - BLOCK
      ?auto_908945 - BLOCK
      ?auto_908946 - BLOCK
      ?auto_908947 - BLOCK
      ?auto_908948 - BLOCK
      ?auto_908949 - BLOCK
      ?auto_908950 - BLOCK
      ?auto_908951 - BLOCK
      ?auto_908952 - BLOCK
      ?auto_908953 - BLOCK
      ?auto_908954 - BLOCK
    )
    :vars
    (
      ?auto_908955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908954 ?auto_908955 ) ( not ( = ?auto_908944 ?auto_908945 ) ) ( not ( = ?auto_908944 ?auto_908946 ) ) ( not ( = ?auto_908944 ?auto_908947 ) ) ( not ( = ?auto_908944 ?auto_908948 ) ) ( not ( = ?auto_908944 ?auto_908949 ) ) ( not ( = ?auto_908944 ?auto_908950 ) ) ( not ( = ?auto_908944 ?auto_908951 ) ) ( not ( = ?auto_908944 ?auto_908952 ) ) ( not ( = ?auto_908944 ?auto_908953 ) ) ( not ( = ?auto_908944 ?auto_908954 ) ) ( not ( = ?auto_908944 ?auto_908955 ) ) ( not ( = ?auto_908945 ?auto_908946 ) ) ( not ( = ?auto_908945 ?auto_908947 ) ) ( not ( = ?auto_908945 ?auto_908948 ) ) ( not ( = ?auto_908945 ?auto_908949 ) ) ( not ( = ?auto_908945 ?auto_908950 ) ) ( not ( = ?auto_908945 ?auto_908951 ) ) ( not ( = ?auto_908945 ?auto_908952 ) ) ( not ( = ?auto_908945 ?auto_908953 ) ) ( not ( = ?auto_908945 ?auto_908954 ) ) ( not ( = ?auto_908945 ?auto_908955 ) ) ( not ( = ?auto_908946 ?auto_908947 ) ) ( not ( = ?auto_908946 ?auto_908948 ) ) ( not ( = ?auto_908946 ?auto_908949 ) ) ( not ( = ?auto_908946 ?auto_908950 ) ) ( not ( = ?auto_908946 ?auto_908951 ) ) ( not ( = ?auto_908946 ?auto_908952 ) ) ( not ( = ?auto_908946 ?auto_908953 ) ) ( not ( = ?auto_908946 ?auto_908954 ) ) ( not ( = ?auto_908946 ?auto_908955 ) ) ( not ( = ?auto_908947 ?auto_908948 ) ) ( not ( = ?auto_908947 ?auto_908949 ) ) ( not ( = ?auto_908947 ?auto_908950 ) ) ( not ( = ?auto_908947 ?auto_908951 ) ) ( not ( = ?auto_908947 ?auto_908952 ) ) ( not ( = ?auto_908947 ?auto_908953 ) ) ( not ( = ?auto_908947 ?auto_908954 ) ) ( not ( = ?auto_908947 ?auto_908955 ) ) ( not ( = ?auto_908948 ?auto_908949 ) ) ( not ( = ?auto_908948 ?auto_908950 ) ) ( not ( = ?auto_908948 ?auto_908951 ) ) ( not ( = ?auto_908948 ?auto_908952 ) ) ( not ( = ?auto_908948 ?auto_908953 ) ) ( not ( = ?auto_908948 ?auto_908954 ) ) ( not ( = ?auto_908948 ?auto_908955 ) ) ( not ( = ?auto_908949 ?auto_908950 ) ) ( not ( = ?auto_908949 ?auto_908951 ) ) ( not ( = ?auto_908949 ?auto_908952 ) ) ( not ( = ?auto_908949 ?auto_908953 ) ) ( not ( = ?auto_908949 ?auto_908954 ) ) ( not ( = ?auto_908949 ?auto_908955 ) ) ( not ( = ?auto_908950 ?auto_908951 ) ) ( not ( = ?auto_908950 ?auto_908952 ) ) ( not ( = ?auto_908950 ?auto_908953 ) ) ( not ( = ?auto_908950 ?auto_908954 ) ) ( not ( = ?auto_908950 ?auto_908955 ) ) ( not ( = ?auto_908951 ?auto_908952 ) ) ( not ( = ?auto_908951 ?auto_908953 ) ) ( not ( = ?auto_908951 ?auto_908954 ) ) ( not ( = ?auto_908951 ?auto_908955 ) ) ( not ( = ?auto_908952 ?auto_908953 ) ) ( not ( = ?auto_908952 ?auto_908954 ) ) ( not ( = ?auto_908952 ?auto_908955 ) ) ( not ( = ?auto_908953 ?auto_908954 ) ) ( not ( = ?auto_908953 ?auto_908955 ) ) ( not ( = ?auto_908954 ?auto_908955 ) ) ( ON ?auto_908953 ?auto_908954 ) ( ON ?auto_908952 ?auto_908953 ) ( ON ?auto_908951 ?auto_908952 ) ( ON ?auto_908950 ?auto_908951 ) ( ON ?auto_908949 ?auto_908950 ) ( ON ?auto_908948 ?auto_908949 ) ( ON ?auto_908947 ?auto_908948 ) ( ON ?auto_908946 ?auto_908947 ) ( ON ?auto_908945 ?auto_908946 ) ( ON ?auto_908944 ?auto_908945 ) ( CLEAR ?auto_908944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_908944 )
      ( MAKE-11PILE ?auto_908944 ?auto_908945 ?auto_908946 ?auto_908947 ?auto_908948 ?auto_908949 ?auto_908950 ?auto_908951 ?auto_908952 ?auto_908953 ?auto_908954 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_908991 - BLOCK
      ?auto_908992 - BLOCK
      ?auto_908993 - BLOCK
      ?auto_908994 - BLOCK
      ?auto_908995 - BLOCK
      ?auto_908996 - BLOCK
      ?auto_908997 - BLOCK
      ?auto_908998 - BLOCK
      ?auto_908999 - BLOCK
      ?auto_909000 - BLOCK
      ?auto_909001 - BLOCK
      ?auto_909002 - BLOCK
    )
    :vars
    (
      ?auto_909003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_909001 ) ( ON ?auto_909002 ?auto_909003 ) ( CLEAR ?auto_909002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_908991 ) ( ON ?auto_908992 ?auto_908991 ) ( ON ?auto_908993 ?auto_908992 ) ( ON ?auto_908994 ?auto_908993 ) ( ON ?auto_908995 ?auto_908994 ) ( ON ?auto_908996 ?auto_908995 ) ( ON ?auto_908997 ?auto_908996 ) ( ON ?auto_908998 ?auto_908997 ) ( ON ?auto_908999 ?auto_908998 ) ( ON ?auto_909000 ?auto_908999 ) ( ON ?auto_909001 ?auto_909000 ) ( not ( = ?auto_908991 ?auto_908992 ) ) ( not ( = ?auto_908991 ?auto_908993 ) ) ( not ( = ?auto_908991 ?auto_908994 ) ) ( not ( = ?auto_908991 ?auto_908995 ) ) ( not ( = ?auto_908991 ?auto_908996 ) ) ( not ( = ?auto_908991 ?auto_908997 ) ) ( not ( = ?auto_908991 ?auto_908998 ) ) ( not ( = ?auto_908991 ?auto_908999 ) ) ( not ( = ?auto_908991 ?auto_909000 ) ) ( not ( = ?auto_908991 ?auto_909001 ) ) ( not ( = ?auto_908991 ?auto_909002 ) ) ( not ( = ?auto_908991 ?auto_909003 ) ) ( not ( = ?auto_908992 ?auto_908993 ) ) ( not ( = ?auto_908992 ?auto_908994 ) ) ( not ( = ?auto_908992 ?auto_908995 ) ) ( not ( = ?auto_908992 ?auto_908996 ) ) ( not ( = ?auto_908992 ?auto_908997 ) ) ( not ( = ?auto_908992 ?auto_908998 ) ) ( not ( = ?auto_908992 ?auto_908999 ) ) ( not ( = ?auto_908992 ?auto_909000 ) ) ( not ( = ?auto_908992 ?auto_909001 ) ) ( not ( = ?auto_908992 ?auto_909002 ) ) ( not ( = ?auto_908992 ?auto_909003 ) ) ( not ( = ?auto_908993 ?auto_908994 ) ) ( not ( = ?auto_908993 ?auto_908995 ) ) ( not ( = ?auto_908993 ?auto_908996 ) ) ( not ( = ?auto_908993 ?auto_908997 ) ) ( not ( = ?auto_908993 ?auto_908998 ) ) ( not ( = ?auto_908993 ?auto_908999 ) ) ( not ( = ?auto_908993 ?auto_909000 ) ) ( not ( = ?auto_908993 ?auto_909001 ) ) ( not ( = ?auto_908993 ?auto_909002 ) ) ( not ( = ?auto_908993 ?auto_909003 ) ) ( not ( = ?auto_908994 ?auto_908995 ) ) ( not ( = ?auto_908994 ?auto_908996 ) ) ( not ( = ?auto_908994 ?auto_908997 ) ) ( not ( = ?auto_908994 ?auto_908998 ) ) ( not ( = ?auto_908994 ?auto_908999 ) ) ( not ( = ?auto_908994 ?auto_909000 ) ) ( not ( = ?auto_908994 ?auto_909001 ) ) ( not ( = ?auto_908994 ?auto_909002 ) ) ( not ( = ?auto_908994 ?auto_909003 ) ) ( not ( = ?auto_908995 ?auto_908996 ) ) ( not ( = ?auto_908995 ?auto_908997 ) ) ( not ( = ?auto_908995 ?auto_908998 ) ) ( not ( = ?auto_908995 ?auto_908999 ) ) ( not ( = ?auto_908995 ?auto_909000 ) ) ( not ( = ?auto_908995 ?auto_909001 ) ) ( not ( = ?auto_908995 ?auto_909002 ) ) ( not ( = ?auto_908995 ?auto_909003 ) ) ( not ( = ?auto_908996 ?auto_908997 ) ) ( not ( = ?auto_908996 ?auto_908998 ) ) ( not ( = ?auto_908996 ?auto_908999 ) ) ( not ( = ?auto_908996 ?auto_909000 ) ) ( not ( = ?auto_908996 ?auto_909001 ) ) ( not ( = ?auto_908996 ?auto_909002 ) ) ( not ( = ?auto_908996 ?auto_909003 ) ) ( not ( = ?auto_908997 ?auto_908998 ) ) ( not ( = ?auto_908997 ?auto_908999 ) ) ( not ( = ?auto_908997 ?auto_909000 ) ) ( not ( = ?auto_908997 ?auto_909001 ) ) ( not ( = ?auto_908997 ?auto_909002 ) ) ( not ( = ?auto_908997 ?auto_909003 ) ) ( not ( = ?auto_908998 ?auto_908999 ) ) ( not ( = ?auto_908998 ?auto_909000 ) ) ( not ( = ?auto_908998 ?auto_909001 ) ) ( not ( = ?auto_908998 ?auto_909002 ) ) ( not ( = ?auto_908998 ?auto_909003 ) ) ( not ( = ?auto_908999 ?auto_909000 ) ) ( not ( = ?auto_908999 ?auto_909001 ) ) ( not ( = ?auto_908999 ?auto_909002 ) ) ( not ( = ?auto_908999 ?auto_909003 ) ) ( not ( = ?auto_909000 ?auto_909001 ) ) ( not ( = ?auto_909000 ?auto_909002 ) ) ( not ( = ?auto_909000 ?auto_909003 ) ) ( not ( = ?auto_909001 ?auto_909002 ) ) ( not ( = ?auto_909001 ?auto_909003 ) ) ( not ( = ?auto_909002 ?auto_909003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_909002 ?auto_909003 )
      ( !STACK ?auto_909002 ?auto_909001 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909041 - BLOCK
      ?auto_909042 - BLOCK
      ?auto_909043 - BLOCK
      ?auto_909044 - BLOCK
      ?auto_909045 - BLOCK
      ?auto_909046 - BLOCK
      ?auto_909047 - BLOCK
      ?auto_909048 - BLOCK
      ?auto_909049 - BLOCK
      ?auto_909050 - BLOCK
      ?auto_909051 - BLOCK
      ?auto_909052 - BLOCK
    )
    :vars
    (
      ?auto_909053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909052 ?auto_909053 ) ( ON-TABLE ?auto_909041 ) ( ON ?auto_909042 ?auto_909041 ) ( ON ?auto_909043 ?auto_909042 ) ( ON ?auto_909044 ?auto_909043 ) ( ON ?auto_909045 ?auto_909044 ) ( ON ?auto_909046 ?auto_909045 ) ( ON ?auto_909047 ?auto_909046 ) ( ON ?auto_909048 ?auto_909047 ) ( ON ?auto_909049 ?auto_909048 ) ( ON ?auto_909050 ?auto_909049 ) ( not ( = ?auto_909041 ?auto_909042 ) ) ( not ( = ?auto_909041 ?auto_909043 ) ) ( not ( = ?auto_909041 ?auto_909044 ) ) ( not ( = ?auto_909041 ?auto_909045 ) ) ( not ( = ?auto_909041 ?auto_909046 ) ) ( not ( = ?auto_909041 ?auto_909047 ) ) ( not ( = ?auto_909041 ?auto_909048 ) ) ( not ( = ?auto_909041 ?auto_909049 ) ) ( not ( = ?auto_909041 ?auto_909050 ) ) ( not ( = ?auto_909041 ?auto_909051 ) ) ( not ( = ?auto_909041 ?auto_909052 ) ) ( not ( = ?auto_909041 ?auto_909053 ) ) ( not ( = ?auto_909042 ?auto_909043 ) ) ( not ( = ?auto_909042 ?auto_909044 ) ) ( not ( = ?auto_909042 ?auto_909045 ) ) ( not ( = ?auto_909042 ?auto_909046 ) ) ( not ( = ?auto_909042 ?auto_909047 ) ) ( not ( = ?auto_909042 ?auto_909048 ) ) ( not ( = ?auto_909042 ?auto_909049 ) ) ( not ( = ?auto_909042 ?auto_909050 ) ) ( not ( = ?auto_909042 ?auto_909051 ) ) ( not ( = ?auto_909042 ?auto_909052 ) ) ( not ( = ?auto_909042 ?auto_909053 ) ) ( not ( = ?auto_909043 ?auto_909044 ) ) ( not ( = ?auto_909043 ?auto_909045 ) ) ( not ( = ?auto_909043 ?auto_909046 ) ) ( not ( = ?auto_909043 ?auto_909047 ) ) ( not ( = ?auto_909043 ?auto_909048 ) ) ( not ( = ?auto_909043 ?auto_909049 ) ) ( not ( = ?auto_909043 ?auto_909050 ) ) ( not ( = ?auto_909043 ?auto_909051 ) ) ( not ( = ?auto_909043 ?auto_909052 ) ) ( not ( = ?auto_909043 ?auto_909053 ) ) ( not ( = ?auto_909044 ?auto_909045 ) ) ( not ( = ?auto_909044 ?auto_909046 ) ) ( not ( = ?auto_909044 ?auto_909047 ) ) ( not ( = ?auto_909044 ?auto_909048 ) ) ( not ( = ?auto_909044 ?auto_909049 ) ) ( not ( = ?auto_909044 ?auto_909050 ) ) ( not ( = ?auto_909044 ?auto_909051 ) ) ( not ( = ?auto_909044 ?auto_909052 ) ) ( not ( = ?auto_909044 ?auto_909053 ) ) ( not ( = ?auto_909045 ?auto_909046 ) ) ( not ( = ?auto_909045 ?auto_909047 ) ) ( not ( = ?auto_909045 ?auto_909048 ) ) ( not ( = ?auto_909045 ?auto_909049 ) ) ( not ( = ?auto_909045 ?auto_909050 ) ) ( not ( = ?auto_909045 ?auto_909051 ) ) ( not ( = ?auto_909045 ?auto_909052 ) ) ( not ( = ?auto_909045 ?auto_909053 ) ) ( not ( = ?auto_909046 ?auto_909047 ) ) ( not ( = ?auto_909046 ?auto_909048 ) ) ( not ( = ?auto_909046 ?auto_909049 ) ) ( not ( = ?auto_909046 ?auto_909050 ) ) ( not ( = ?auto_909046 ?auto_909051 ) ) ( not ( = ?auto_909046 ?auto_909052 ) ) ( not ( = ?auto_909046 ?auto_909053 ) ) ( not ( = ?auto_909047 ?auto_909048 ) ) ( not ( = ?auto_909047 ?auto_909049 ) ) ( not ( = ?auto_909047 ?auto_909050 ) ) ( not ( = ?auto_909047 ?auto_909051 ) ) ( not ( = ?auto_909047 ?auto_909052 ) ) ( not ( = ?auto_909047 ?auto_909053 ) ) ( not ( = ?auto_909048 ?auto_909049 ) ) ( not ( = ?auto_909048 ?auto_909050 ) ) ( not ( = ?auto_909048 ?auto_909051 ) ) ( not ( = ?auto_909048 ?auto_909052 ) ) ( not ( = ?auto_909048 ?auto_909053 ) ) ( not ( = ?auto_909049 ?auto_909050 ) ) ( not ( = ?auto_909049 ?auto_909051 ) ) ( not ( = ?auto_909049 ?auto_909052 ) ) ( not ( = ?auto_909049 ?auto_909053 ) ) ( not ( = ?auto_909050 ?auto_909051 ) ) ( not ( = ?auto_909050 ?auto_909052 ) ) ( not ( = ?auto_909050 ?auto_909053 ) ) ( not ( = ?auto_909051 ?auto_909052 ) ) ( not ( = ?auto_909051 ?auto_909053 ) ) ( not ( = ?auto_909052 ?auto_909053 ) ) ( CLEAR ?auto_909050 ) ( ON ?auto_909051 ?auto_909052 ) ( CLEAR ?auto_909051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_909041 ?auto_909042 ?auto_909043 ?auto_909044 ?auto_909045 ?auto_909046 ?auto_909047 ?auto_909048 ?auto_909049 ?auto_909050 ?auto_909051 )
      ( MAKE-12PILE ?auto_909041 ?auto_909042 ?auto_909043 ?auto_909044 ?auto_909045 ?auto_909046 ?auto_909047 ?auto_909048 ?auto_909049 ?auto_909050 ?auto_909051 ?auto_909052 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909091 - BLOCK
      ?auto_909092 - BLOCK
      ?auto_909093 - BLOCK
      ?auto_909094 - BLOCK
      ?auto_909095 - BLOCK
      ?auto_909096 - BLOCK
      ?auto_909097 - BLOCK
      ?auto_909098 - BLOCK
      ?auto_909099 - BLOCK
      ?auto_909100 - BLOCK
      ?auto_909101 - BLOCK
      ?auto_909102 - BLOCK
    )
    :vars
    (
      ?auto_909103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909102 ?auto_909103 ) ( ON-TABLE ?auto_909091 ) ( ON ?auto_909092 ?auto_909091 ) ( ON ?auto_909093 ?auto_909092 ) ( ON ?auto_909094 ?auto_909093 ) ( ON ?auto_909095 ?auto_909094 ) ( ON ?auto_909096 ?auto_909095 ) ( ON ?auto_909097 ?auto_909096 ) ( ON ?auto_909098 ?auto_909097 ) ( ON ?auto_909099 ?auto_909098 ) ( not ( = ?auto_909091 ?auto_909092 ) ) ( not ( = ?auto_909091 ?auto_909093 ) ) ( not ( = ?auto_909091 ?auto_909094 ) ) ( not ( = ?auto_909091 ?auto_909095 ) ) ( not ( = ?auto_909091 ?auto_909096 ) ) ( not ( = ?auto_909091 ?auto_909097 ) ) ( not ( = ?auto_909091 ?auto_909098 ) ) ( not ( = ?auto_909091 ?auto_909099 ) ) ( not ( = ?auto_909091 ?auto_909100 ) ) ( not ( = ?auto_909091 ?auto_909101 ) ) ( not ( = ?auto_909091 ?auto_909102 ) ) ( not ( = ?auto_909091 ?auto_909103 ) ) ( not ( = ?auto_909092 ?auto_909093 ) ) ( not ( = ?auto_909092 ?auto_909094 ) ) ( not ( = ?auto_909092 ?auto_909095 ) ) ( not ( = ?auto_909092 ?auto_909096 ) ) ( not ( = ?auto_909092 ?auto_909097 ) ) ( not ( = ?auto_909092 ?auto_909098 ) ) ( not ( = ?auto_909092 ?auto_909099 ) ) ( not ( = ?auto_909092 ?auto_909100 ) ) ( not ( = ?auto_909092 ?auto_909101 ) ) ( not ( = ?auto_909092 ?auto_909102 ) ) ( not ( = ?auto_909092 ?auto_909103 ) ) ( not ( = ?auto_909093 ?auto_909094 ) ) ( not ( = ?auto_909093 ?auto_909095 ) ) ( not ( = ?auto_909093 ?auto_909096 ) ) ( not ( = ?auto_909093 ?auto_909097 ) ) ( not ( = ?auto_909093 ?auto_909098 ) ) ( not ( = ?auto_909093 ?auto_909099 ) ) ( not ( = ?auto_909093 ?auto_909100 ) ) ( not ( = ?auto_909093 ?auto_909101 ) ) ( not ( = ?auto_909093 ?auto_909102 ) ) ( not ( = ?auto_909093 ?auto_909103 ) ) ( not ( = ?auto_909094 ?auto_909095 ) ) ( not ( = ?auto_909094 ?auto_909096 ) ) ( not ( = ?auto_909094 ?auto_909097 ) ) ( not ( = ?auto_909094 ?auto_909098 ) ) ( not ( = ?auto_909094 ?auto_909099 ) ) ( not ( = ?auto_909094 ?auto_909100 ) ) ( not ( = ?auto_909094 ?auto_909101 ) ) ( not ( = ?auto_909094 ?auto_909102 ) ) ( not ( = ?auto_909094 ?auto_909103 ) ) ( not ( = ?auto_909095 ?auto_909096 ) ) ( not ( = ?auto_909095 ?auto_909097 ) ) ( not ( = ?auto_909095 ?auto_909098 ) ) ( not ( = ?auto_909095 ?auto_909099 ) ) ( not ( = ?auto_909095 ?auto_909100 ) ) ( not ( = ?auto_909095 ?auto_909101 ) ) ( not ( = ?auto_909095 ?auto_909102 ) ) ( not ( = ?auto_909095 ?auto_909103 ) ) ( not ( = ?auto_909096 ?auto_909097 ) ) ( not ( = ?auto_909096 ?auto_909098 ) ) ( not ( = ?auto_909096 ?auto_909099 ) ) ( not ( = ?auto_909096 ?auto_909100 ) ) ( not ( = ?auto_909096 ?auto_909101 ) ) ( not ( = ?auto_909096 ?auto_909102 ) ) ( not ( = ?auto_909096 ?auto_909103 ) ) ( not ( = ?auto_909097 ?auto_909098 ) ) ( not ( = ?auto_909097 ?auto_909099 ) ) ( not ( = ?auto_909097 ?auto_909100 ) ) ( not ( = ?auto_909097 ?auto_909101 ) ) ( not ( = ?auto_909097 ?auto_909102 ) ) ( not ( = ?auto_909097 ?auto_909103 ) ) ( not ( = ?auto_909098 ?auto_909099 ) ) ( not ( = ?auto_909098 ?auto_909100 ) ) ( not ( = ?auto_909098 ?auto_909101 ) ) ( not ( = ?auto_909098 ?auto_909102 ) ) ( not ( = ?auto_909098 ?auto_909103 ) ) ( not ( = ?auto_909099 ?auto_909100 ) ) ( not ( = ?auto_909099 ?auto_909101 ) ) ( not ( = ?auto_909099 ?auto_909102 ) ) ( not ( = ?auto_909099 ?auto_909103 ) ) ( not ( = ?auto_909100 ?auto_909101 ) ) ( not ( = ?auto_909100 ?auto_909102 ) ) ( not ( = ?auto_909100 ?auto_909103 ) ) ( not ( = ?auto_909101 ?auto_909102 ) ) ( not ( = ?auto_909101 ?auto_909103 ) ) ( not ( = ?auto_909102 ?auto_909103 ) ) ( ON ?auto_909101 ?auto_909102 ) ( CLEAR ?auto_909099 ) ( ON ?auto_909100 ?auto_909101 ) ( CLEAR ?auto_909100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_909091 ?auto_909092 ?auto_909093 ?auto_909094 ?auto_909095 ?auto_909096 ?auto_909097 ?auto_909098 ?auto_909099 ?auto_909100 )
      ( MAKE-12PILE ?auto_909091 ?auto_909092 ?auto_909093 ?auto_909094 ?auto_909095 ?auto_909096 ?auto_909097 ?auto_909098 ?auto_909099 ?auto_909100 ?auto_909101 ?auto_909102 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909141 - BLOCK
      ?auto_909142 - BLOCK
      ?auto_909143 - BLOCK
      ?auto_909144 - BLOCK
      ?auto_909145 - BLOCK
      ?auto_909146 - BLOCK
      ?auto_909147 - BLOCK
      ?auto_909148 - BLOCK
      ?auto_909149 - BLOCK
      ?auto_909150 - BLOCK
      ?auto_909151 - BLOCK
      ?auto_909152 - BLOCK
    )
    :vars
    (
      ?auto_909153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909152 ?auto_909153 ) ( ON-TABLE ?auto_909141 ) ( ON ?auto_909142 ?auto_909141 ) ( ON ?auto_909143 ?auto_909142 ) ( ON ?auto_909144 ?auto_909143 ) ( ON ?auto_909145 ?auto_909144 ) ( ON ?auto_909146 ?auto_909145 ) ( ON ?auto_909147 ?auto_909146 ) ( ON ?auto_909148 ?auto_909147 ) ( not ( = ?auto_909141 ?auto_909142 ) ) ( not ( = ?auto_909141 ?auto_909143 ) ) ( not ( = ?auto_909141 ?auto_909144 ) ) ( not ( = ?auto_909141 ?auto_909145 ) ) ( not ( = ?auto_909141 ?auto_909146 ) ) ( not ( = ?auto_909141 ?auto_909147 ) ) ( not ( = ?auto_909141 ?auto_909148 ) ) ( not ( = ?auto_909141 ?auto_909149 ) ) ( not ( = ?auto_909141 ?auto_909150 ) ) ( not ( = ?auto_909141 ?auto_909151 ) ) ( not ( = ?auto_909141 ?auto_909152 ) ) ( not ( = ?auto_909141 ?auto_909153 ) ) ( not ( = ?auto_909142 ?auto_909143 ) ) ( not ( = ?auto_909142 ?auto_909144 ) ) ( not ( = ?auto_909142 ?auto_909145 ) ) ( not ( = ?auto_909142 ?auto_909146 ) ) ( not ( = ?auto_909142 ?auto_909147 ) ) ( not ( = ?auto_909142 ?auto_909148 ) ) ( not ( = ?auto_909142 ?auto_909149 ) ) ( not ( = ?auto_909142 ?auto_909150 ) ) ( not ( = ?auto_909142 ?auto_909151 ) ) ( not ( = ?auto_909142 ?auto_909152 ) ) ( not ( = ?auto_909142 ?auto_909153 ) ) ( not ( = ?auto_909143 ?auto_909144 ) ) ( not ( = ?auto_909143 ?auto_909145 ) ) ( not ( = ?auto_909143 ?auto_909146 ) ) ( not ( = ?auto_909143 ?auto_909147 ) ) ( not ( = ?auto_909143 ?auto_909148 ) ) ( not ( = ?auto_909143 ?auto_909149 ) ) ( not ( = ?auto_909143 ?auto_909150 ) ) ( not ( = ?auto_909143 ?auto_909151 ) ) ( not ( = ?auto_909143 ?auto_909152 ) ) ( not ( = ?auto_909143 ?auto_909153 ) ) ( not ( = ?auto_909144 ?auto_909145 ) ) ( not ( = ?auto_909144 ?auto_909146 ) ) ( not ( = ?auto_909144 ?auto_909147 ) ) ( not ( = ?auto_909144 ?auto_909148 ) ) ( not ( = ?auto_909144 ?auto_909149 ) ) ( not ( = ?auto_909144 ?auto_909150 ) ) ( not ( = ?auto_909144 ?auto_909151 ) ) ( not ( = ?auto_909144 ?auto_909152 ) ) ( not ( = ?auto_909144 ?auto_909153 ) ) ( not ( = ?auto_909145 ?auto_909146 ) ) ( not ( = ?auto_909145 ?auto_909147 ) ) ( not ( = ?auto_909145 ?auto_909148 ) ) ( not ( = ?auto_909145 ?auto_909149 ) ) ( not ( = ?auto_909145 ?auto_909150 ) ) ( not ( = ?auto_909145 ?auto_909151 ) ) ( not ( = ?auto_909145 ?auto_909152 ) ) ( not ( = ?auto_909145 ?auto_909153 ) ) ( not ( = ?auto_909146 ?auto_909147 ) ) ( not ( = ?auto_909146 ?auto_909148 ) ) ( not ( = ?auto_909146 ?auto_909149 ) ) ( not ( = ?auto_909146 ?auto_909150 ) ) ( not ( = ?auto_909146 ?auto_909151 ) ) ( not ( = ?auto_909146 ?auto_909152 ) ) ( not ( = ?auto_909146 ?auto_909153 ) ) ( not ( = ?auto_909147 ?auto_909148 ) ) ( not ( = ?auto_909147 ?auto_909149 ) ) ( not ( = ?auto_909147 ?auto_909150 ) ) ( not ( = ?auto_909147 ?auto_909151 ) ) ( not ( = ?auto_909147 ?auto_909152 ) ) ( not ( = ?auto_909147 ?auto_909153 ) ) ( not ( = ?auto_909148 ?auto_909149 ) ) ( not ( = ?auto_909148 ?auto_909150 ) ) ( not ( = ?auto_909148 ?auto_909151 ) ) ( not ( = ?auto_909148 ?auto_909152 ) ) ( not ( = ?auto_909148 ?auto_909153 ) ) ( not ( = ?auto_909149 ?auto_909150 ) ) ( not ( = ?auto_909149 ?auto_909151 ) ) ( not ( = ?auto_909149 ?auto_909152 ) ) ( not ( = ?auto_909149 ?auto_909153 ) ) ( not ( = ?auto_909150 ?auto_909151 ) ) ( not ( = ?auto_909150 ?auto_909152 ) ) ( not ( = ?auto_909150 ?auto_909153 ) ) ( not ( = ?auto_909151 ?auto_909152 ) ) ( not ( = ?auto_909151 ?auto_909153 ) ) ( not ( = ?auto_909152 ?auto_909153 ) ) ( ON ?auto_909151 ?auto_909152 ) ( ON ?auto_909150 ?auto_909151 ) ( CLEAR ?auto_909148 ) ( ON ?auto_909149 ?auto_909150 ) ( CLEAR ?auto_909149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_909141 ?auto_909142 ?auto_909143 ?auto_909144 ?auto_909145 ?auto_909146 ?auto_909147 ?auto_909148 ?auto_909149 )
      ( MAKE-12PILE ?auto_909141 ?auto_909142 ?auto_909143 ?auto_909144 ?auto_909145 ?auto_909146 ?auto_909147 ?auto_909148 ?auto_909149 ?auto_909150 ?auto_909151 ?auto_909152 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909191 - BLOCK
      ?auto_909192 - BLOCK
      ?auto_909193 - BLOCK
      ?auto_909194 - BLOCK
      ?auto_909195 - BLOCK
      ?auto_909196 - BLOCK
      ?auto_909197 - BLOCK
      ?auto_909198 - BLOCK
      ?auto_909199 - BLOCK
      ?auto_909200 - BLOCK
      ?auto_909201 - BLOCK
      ?auto_909202 - BLOCK
    )
    :vars
    (
      ?auto_909203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909202 ?auto_909203 ) ( ON-TABLE ?auto_909191 ) ( ON ?auto_909192 ?auto_909191 ) ( ON ?auto_909193 ?auto_909192 ) ( ON ?auto_909194 ?auto_909193 ) ( ON ?auto_909195 ?auto_909194 ) ( ON ?auto_909196 ?auto_909195 ) ( ON ?auto_909197 ?auto_909196 ) ( not ( = ?auto_909191 ?auto_909192 ) ) ( not ( = ?auto_909191 ?auto_909193 ) ) ( not ( = ?auto_909191 ?auto_909194 ) ) ( not ( = ?auto_909191 ?auto_909195 ) ) ( not ( = ?auto_909191 ?auto_909196 ) ) ( not ( = ?auto_909191 ?auto_909197 ) ) ( not ( = ?auto_909191 ?auto_909198 ) ) ( not ( = ?auto_909191 ?auto_909199 ) ) ( not ( = ?auto_909191 ?auto_909200 ) ) ( not ( = ?auto_909191 ?auto_909201 ) ) ( not ( = ?auto_909191 ?auto_909202 ) ) ( not ( = ?auto_909191 ?auto_909203 ) ) ( not ( = ?auto_909192 ?auto_909193 ) ) ( not ( = ?auto_909192 ?auto_909194 ) ) ( not ( = ?auto_909192 ?auto_909195 ) ) ( not ( = ?auto_909192 ?auto_909196 ) ) ( not ( = ?auto_909192 ?auto_909197 ) ) ( not ( = ?auto_909192 ?auto_909198 ) ) ( not ( = ?auto_909192 ?auto_909199 ) ) ( not ( = ?auto_909192 ?auto_909200 ) ) ( not ( = ?auto_909192 ?auto_909201 ) ) ( not ( = ?auto_909192 ?auto_909202 ) ) ( not ( = ?auto_909192 ?auto_909203 ) ) ( not ( = ?auto_909193 ?auto_909194 ) ) ( not ( = ?auto_909193 ?auto_909195 ) ) ( not ( = ?auto_909193 ?auto_909196 ) ) ( not ( = ?auto_909193 ?auto_909197 ) ) ( not ( = ?auto_909193 ?auto_909198 ) ) ( not ( = ?auto_909193 ?auto_909199 ) ) ( not ( = ?auto_909193 ?auto_909200 ) ) ( not ( = ?auto_909193 ?auto_909201 ) ) ( not ( = ?auto_909193 ?auto_909202 ) ) ( not ( = ?auto_909193 ?auto_909203 ) ) ( not ( = ?auto_909194 ?auto_909195 ) ) ( not ( = ?auto_909194 ?auto_909196 ) ) ( not ( = ?auto_909194 ?auto_909197 ) ) ( not ( = ?auto_909194 ?auto_909198 ) ) ( not ( = ?auto_909194 ?auto_909199 ) ) ( not ( = ?auto_909194 ?auto_909200 ) ) ( not ( = ?auto_909194 ?auto_909201 ) ) ( not ( = ?auto_909194 ?auto_909202 ) ) ( not ( = ?auto_909194 ?auto_909203 ) ) ( not ( = ?auto_909195 ?auto_909196 ) ) ( not ( = ?auto_909195 ?auto_909197 ) ) ( not ( = ?auto_909195 ?auto_909198 ) ) ( not ( = ?auto_909195 ?auto_909199 ) ) ( not ( = ?auto_909195 ?auto_909200 ) ) ( not ( = ?auto_909195 ?auto_909201 ) ) ( not ( = ?auto_909195 ?auto_909202 ) ) ( not ( = ?auto_909195 ?auto_909203 ) ) ( not ( = ?auto_909196 ?auto_909197 ) ) ( not ( = ?auto_909196 ?auto_909198 ) ) ( not ( = ?auto_909196 ?auto_909199 ) ) ( not ( = ?auto_909196 ?auto_909200 ) ) ( not ( = ?auto_909196 ?auto_909201 ) ) ( not ( = ?auto_909196 ?auto_909202 ) ) ( not ( = ?auto_909196 ?auto_909203 ) ) ( not ( = ?auto_909197 ?auto_909198 ) ) ( not ( = ?auto_909197 ?auto_909199 ) ) ( not ( = ?auto_909197 ?auto_909200 ) ) ( not ( = ?auto_909197 ?auto_909201 ) ) ( not ( = ?auto_909197 ?auto_909202 ) ) ( not ( = ?auto_909197 ?auto_909203 ) ) ( not ( = ?auto_909198 ?auto_909199 ) ) ( not ( = ?auto_909198 ?auto_909200 ) ) ( not ( = ?auto_909198 ?auto_909201 ) ) ( not ( = ?auto_909198 ?auto_909202 ) ) ( not ( = ?auto_909198 ?auto_909203 ) ) ( not ( = ?auto_909199 ?auto_909200 ) ) ( not ( = ?auto_909199 ?auto_909201 ) ) ( not ( = ?auto_909199 ?auto_909202 ) ) ( not ( = ?auto_909199 ?auto_909203 ) ) ( not ( = ?auto_909200 ?auto_909201 ) ) ( not ( = ?auto_909200 ?auto_909202 ) ) ( not ( = ?auto_909200 ?auto_909203 ) ) ( not ( = ?auto_909201 ?auto_909202 ) ) ( not ( = ?auto_909201 ?auto_909203 ) ) ( not ( = ?auto_909202 ?auto_909203 ) ) ( ON ?auto_909201 ?auto_909202 ) ( ON ?auto_909200 ?auto_909201 ) ( ON ?auto_909199 ?auto_909200 ) ( CLEAR ?auto_909197 ) ( ON ?auto_909198 ?auto_909199 ) ( CLEAR ?auto_909198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_909191 ?auto_909192 ?auto_909193 ?auto_909194 ?auto_909195 ?auto_909196 ?auto_909197 ?auto_909198 )
      ( MAKE-12PILE ?auto_909191 ?auto_909192 ?auto_909193 ?auto_909194 ?auto_909195 ?auto_909196 ?auto_909197 ?auto_909198 ?auto_909199 ?auto_909200 ?auto_909201 ?auto_909202 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909241 - BLOCK
      ?auto_909242 - BLOCK
      ?auto_909243 - BLOCK
      ?auto_909244 - BLOCK
      ?auto_909245 - BLOCK
      ?auto_909246 - BLOCK
      ?auto_909247 - BLOCK
      ?auto_909248 - BLOCK
      ?auto_909249 - BLOCK
      ?auto_909250 - BLOCK
      ?auto_909251 - BLOCK
      ?auto_909252 - BLOCK
    )
    :vars
    (
      ?auto_909253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909252 ?auto_909253 ) ( ON-TABLE ?auto_909241 ) ( ON ?auto_909242 ?auto_909241 ) ( ON ?auto_909243 ?auto_909242 ) ( ON ?auto_909244 ?auto_909243 ) ( ON ?auto_909245 ?auto_909244 ) ( ON ?auto_909246 ?auto_909245 ) ( not ( = ?auto_909241 ?auto_909242 ) ) ( not ( = ?auto_909241 ?auto_909243 ) ) ( not ( = ?auto_909241 ?auto_909244 ) ) ( not ( = ?auto_909241 ?auto_909245 ) ) ( not ( = ?auto_909241 ?auto_909246 ) ) ( not ( = ?auto_909241 ?auto_909247 ) ) ( not ( = ?auto_909241 ?auto_909248 ) ) ( not ( = ?auto_909241 ?auto_909249 ) ) ( not ( = ?auto_909241 ?auto_909250 ) ) ( not ( = ?auto_909241 ?auto_909251 ) ) ( not ( = ?auto_909241 ?auto_909252 ) ) ( not ( = ?auto_909241 ?auto_909253 ) ) ( not ( = ?auto_909242 ?auto_909243 ) ) ( not ( = ?auto_909242 ?auto_909244 ) ) ( not ( = ?auto_909242 ?auto_909245 ) ) ( not ( = ?auto_909242 ?auto_909246 ) ) ( not ( = ?auto_909242 ?auto_909247 ) ) ( not ( = ?auto_909242 ?auto_909248 ) ) ( not ( = ?auto_909242 ?auto_909249 ) ) ( not ( = ?auto_909242 ?auto_909250 ) ) ( not ( = ?auto_909242 ?auto_909251 ) ) ( not ( = ?auto_909242 ?auto_909252 ) ) ( not ( = ?auto_909242 ?auto_909253 ) ) ( not ( = ?auto_909243 ?auto_909244 ) ) ( not ( = ?auto_909243 ?auto_909245 ) ) ( not ( = ?auto_909243 ?auto_909246 ) ) ( not ( = ?auto_909243 ?auto_909247 ) ) ( not ( = ?auto_909243 ?auto_909248 ) ) ( not ( = ?auto_909243 ?auto_909249 ) ) ( not ( = ?auto_909243 ?auto_909250 ) ) ( not ( = ?auto_909243 ?auto_909251 ) ) ( not ( = ?auto_909243 ?auto_909252 ) ) ( not ( = ?auto_909243 ?auto_909253 ) ) ( not ( = ?auto_909244 ?auto_909245 ) ) ( not ( = ?auto_909244 ?auto_909246 ) ) ( not ( = ?auto_909244 ?auto_909247 ) ) ( not ( = ?auto_909244 ?auto_909248 ) ) ( not ( = ?auto_909244 ?auto_909249 ) ) ( not ( = ?auto_909244 ?auto_909250 ) ) ( not ( = ?auto_909244 ?auto_909251 ) ) ( not ( = ?auto_909244 ?auto_909252 ) ) ( not ( = ?auto_909244 ?auto_909253 ) ) ( not ( = ?auto_909245 ?auto_909246 ) ) ( not ( = ?auto_909245 ?auto_909247 ) ) ( not ( = ?auto_909245 ?auto_909248 ) ) ( not ( = ?auto_909245 ?auto_909249 ) ) ( not ( = ?auto_909245 ?auto_909250 ) ) ( not ( = ?auto_909245 ?auto_909251 ) ) ( not ( = ?auto_909245 ?auto_909252 ) ) ( not ( = ?auto_909245 ?auto_909253 ) ) ( not ( = ?auto_909246 ?auto_909247 ) ) ( not ( = ?auto_909246 ?auto_909248 ) ) ( not ( = ?auto_909246 ?auto_909249 ) ) ( not ( = ?auto_909246 ?auto_909250 ) ) ( not ( = ?auto_909246 ?auto_909251 ) ) ( not ( = ?auto_909246 ?auto_909252 ) ) ( not ( = ?auto_909246 ?auto_909253 ) ) ( not ( = ?auto_909247 ?auto_909248 ) ) ( not ( = ?auto_909247 ?auto_909249 ) ) ( not ( = ?auto_909247 ?auto_909250 ) ) ( not ( = ?auto_909247 ?auto_909251 ) ) ( not ( = ?auto_909247 ?auto_909252 ) ) ( not ( = ?auto_909247 ?auto_909253 ) ) ( not ( = ?auto_909248 ?auto_909249 ) ) ( not ( = ?auto_909248 ?auto_909250 ) ) ( not ( = ?auto_909248 ?auto_909251 ) ) ( not ( = ?auto_909248 ?auto_909252 ) ) ( not ( = ?auto_909248 ?auto_909253 ) ) ( not ( = ?auto_909249 ?auto_909250 ) ) ( not ( = ?auto_909249 ?auto_909251 ) ) ( not ( = ?auto_909249 ?auto_909252 ) ) ( not ( = ?auto_909249 ?auto_909253 ) ) ( not ( = ?auto_909250 ?auto_909251 ) ) ( not ( = ?auto_909250 ?auto_909252 ) ) ( not ( = ?auto_909250 ?auto_909253 ) ) ( not ( = ?auto_909251 ?auto_909252 ) ) ( not ( = ?auto_909251 ?auto_909253 ) ) ( not ( = ?auto_909252 ?auto_909253 ) ) ( ON ?auto_909251 ?auto_909252 ) ( ON ?auto_909250 ?auto_909251 ) ( ON ?auto_909249 ?auto_909250 ) ( ON ?auto_909248 ?auto_909249 ) ( CLEAR ?auto_909246 ) ( ON ?auto_909247 ?auto_909248 ) ( CLEAR ?auto_909247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_909241 ?auto_909242 ?auto_909243 ?auto_909244 ?auto_909245 ?auto_909246 ?auto_909247 )
      ( MAKE-12PILE ?auto_909241 ?auto_909242 ?auto_909243 ?auto_909244 ?auto_909245 ?auto_909246 ?auto_909247 ?auto_909248 ?auto_909249 ?auto_909250 ?auto_909251 ?auto_909252 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909291 - BLOCK
      ?auto_909292 - BLOCK
      ?auto_909293 - BLOCK
      ?auto_909294 - BLOCK
      ?auto_909295 - BLOCK
      ?auto_909296 - BLOCK
      ?auto_909297 - BLOCK
      ?auto_909298 - BLOCK
      ?auto_909299 - BLOCK
      ?auto_909300 - BLOCK
      ?auto_909301 - BLOCK
      ?auto_909302 - BLOCK
    )
    :vars
    (
      ?auto_909303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909302 ?auto_909303 ) ( ON-TABLE ?auto_909291 ) ( ON ?auto_909292 ?auto_909291 ) ( ON ?auto_909293 ?auto_909292 ) ( ON ?auto_909294 ?auto_909293 ) ( ON ?auto_909295 ?auto_909294 ) ( not ( = ?auto_909291 ?auto_909292 ) ) ( not ( = ?auto_909291 ?auto_909293 ) ) ( not ( = ?auto_909291 ?auto_909294 ) ) ( not ( = ?auto_909291 ?auto_909295 ) ) ( not ( = ?auto_909291 ?auto_909296 ) ) ( not ( = ?auto_909291 ?auto_909297 ) ) ( not ( = ?auto_909291 ?auto_909298 ) ) ( not ( = ?auto_909291 ?auto_909299 ) ) ( not ( = ?auto_909291 ?auto_909300 ) ) ( not ( = ?auto_909291 ?auto_909301 ) ) ( not ( = ?auto_909291 ?auto_909302 ) ) ( not ( = ?auto_909291 ?auto_909303 ) ) ( not ( = ?auto_909292 ?auto_909293 ) ) ( not ( = ?auto_909292 ?auto_909294 ) ) ( not ( = ?auto_909292 ?auto_909295 ) ) ( not ( = ?auto_909292 ?auto_909296 ) ) ( not ( = ?auto_909292 ?auto_909297 ) ) ( not ( = ?auto_909292 ?auto_909298 ) ) ( not ( = ?auto_909292 ?auto_909299 ) ) ( not ( = ?auto_909292 ?auto_909300 ) ) ( not ( = ?auto_909292 ?auto_909301 ) ) ( not ( = ?auto_909292 ?auto_909302 ) ) ( not ( = ?auto_909292 ?auto_909303 ) ) ( not ( = ?auto_909293 ?auto_909294 ) ) ( not ( = ?auto_909293 ?auto_909295 ) ) ( not ( = ?auto_909293 ?auto_909296 ) ) ( not ( = ?auto_909293 ?auto_909297 ) ) ( not ( = ?auto_909293 ?auto_909298 ) ) ( not ( = ?auto_909293 ?auto_909299 ) ) ( not ( = ?auto_909293 ?auto_909300 ) ) ( not ( = ?auto_909293 ?auto_909301 ) ) ( not ( = ?auto_909293 ?auto_909302 ) ) ( not ( = ?auto_909293 ?auto_909303 ) ) ( not ( = ?auto_909294 ?auto_909295 ) ) ( not ( = ?auto_909294 ?auto_909296 ) ) ( not ( = ?auto_909294 ?auto_909297 ) ) ( not ( = ?auto_909294 ?auto_909298 ) ) ( not ( = ?auto_909294 ?auto_909299 ) ) ( not ( = ?auto_909294 ?auto_909300 ) ) ( not ( = ?auto_909294 ?auto_909301 ) ) ( not ( = ?auto_909294 ?auto_909302 ) ) ( not ( = ?auto_909294 ?auto_909303 ) ) ( not ( = ?auto_909295 ?auto_909296 ) ) ( not ( = ?auto_909295 ?auto_909297 ) ) ( not ( = ?auto_909295 ?auto_909298 ) ) ( not ( = ?auto_909295 ?auto_909299 ) ) ( not ( = ?auto_909295 ?auto_909300 ) ) ( not ( = ?auto_909295 ?auto_909301 ) ) ( not ( = ?auto_909295 ?auto_909302 ) ) ( not ( = ?auto_909295 ?auto_909303 ) ) ( not ( = ?auto_909296 ?auto_909297 ) ) ( not ( = ?auto_909296 ?auto_909298 ) ) ( not ( = ?auto_909296 ?auto_909299 ) ) ( not ( = ?auto_909296 ?auto_909300 ) ) ( not ( = ?auto_909296 ?auto_909301 ) ) ( not ( = ?auto_909296 ?auto_909302 ) ) ( not ( = ?auto_909296 ?auto_909303 ) ) ( not ( = ?auto_909297 ?auto_909298 ) ) ( not ( = ?auto_909297 ?auto_909299 ) ) ( not ( = ?auto_909297 ?auto_909300 ) ) ( not ( = ?auto_909297 ?auto_909301 ) ) ( not ( = ?auto_909297 ?auto_909302 ) ) ( not ( = ?auto_909297 ?auto_909303 ) ) ( not ( = ?auto_909298 ?auto_909299 ) ) ( not ( = ?auto_909298 ?auto_909300 ) ) ( not ( = ?auto_909298 ?auto_909301 ) ) ( not ( = ?auto_909298 ?auto_909302 ) ) ( not ( = ?auto_909298 ?auto_909303 ) ) ( not ( = ?auto_909299 ?auto_909300 ) ) ( not ( = ?auto_909299 ?auto_909301 ) ) ( not ( = ?auto_909299 ?auto_909302 ) ) ( not ( = ?auto_909299 ?auto_909303 ) ) ( not ( = ?auto_909300 ?auto_909301 ) ) ( not ( = ?auto_909300 ?auto_909302 ) ) ( not ( = ?auto_909300 ?auto_909303 ) ) ( not ( = ?auto_909301 ?auto_909302 ) ) ( not ( = ?auto_909301 ?auto_909303 ) ) ( not ( = ?auto_909302 ?auto_909303 ) ) ( ON ?auto_909301 ?auto_909302 ) ( ON ?auto_909300 ?auto_909301 ) ( ON ?auto_909299 ?auto_909300 ) ( ON ?auto_909298 ?auto_909299 ) ( ON ?auto_909297 ?auto_909298 ) ( CLEAR ?auto_909295 ) ( ON ?auto_909296 ?auto_909297 ) ( CLEAR ?auto_909296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_909291 ?auto_909292 ?auto_909293 ?auto_909294 ?auto_909295 ?auto_909296 )
      ( MAKE-12PILE ?auto_909291 ?auto_909292 ?auto_909293 ?auto_909294 ?auto_909295 ?auto_909296 ?auto_909297 ?auto_909298 ?auto_909299 ?auto_909300 ?auto_909301 ?auto_909302 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909341 - BLOCK
      ?auto_909342 - BLOCK
      ?auto_909343 - BLOCK
      ?auto_909344 - BLOCK
      ?auto_909345 - BLOCK
      ?auto_909346 - BLOCK
      ?auto_909347 - BLOCK
      ?auto_909348 - BLOCK
      ?auto_909349 - BLOCK
      ?auto_909350 - BLOCK
      ?auto_909351 - BLOCK
      ?auto_909352 - BLOCK
    )
    :vars
    (
      ?auto_909353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909352 ?auto_909353 ) ( ON-TABLE ?auto_909341 ) ( ON ?auto_909342 ?auto_909341 ) ( ON ?auto_909343 ?auto_909342 ) ( ON ?auto_909344 ?auto_909343 ) ( not ( = ?auto_909341 ?auto_909342 ) ) ( not ( = ?auto_909341 ?auto_909343 ) ) ( not ( = ?auto_909341 ?auto_909344 ) ) ( not ( = ?auto_909341 ?auto_909345 ) ) ( not ( = ?auto_909341 ?auto_909346 ) ) ( not ( = ?auto_909341 ?auto_909347 ) ) ( not ( = ?auto_909341 ?auto_909348 ) ) ( not ( = ?auto_909341 ?auto_909349 ) ) ( not ( = ?auto_909341 ?auto_909350 ) ) ( not ( = ?auto_909341 ?auto_909351 ) ) ( not ( = ?auto_909341 ?auto_909352 ) ) ( not ( = ?auto_909341 ?auto_909353 ) ) ( not ( = ?auto_909342 ?auto_909343 ) ) ( not ( = ?auto_909342 ?auto_909344 ) ) ( not ( = ?auto_909342 ?auto_909345 ) ) ( not ( = ?auto_909342 ?auto_909346 ) ) ( not ( = ?auto_909342 ?auto_909347 ) ) ( not ( = ?auto_909342 ?auto_909348 ) ) ( not ( = ?auto_909342 ?auto_909349 ) ) ( not ( = ?auto_909342 ?auto_909350 ) ) ( not ( = ?auto_909342 ?auto_909351 ) ) ( not ( = ?auto_909342 ?auto_909352 ) ) ( not ( = ?auto_909342 ?auto_909353 ) ) ( not ( = ?auto_909343 ?auto_909344 ) ) ( not ( = ?auto_909343 ?auto_909345 ) ) ( not ( = ?auto_909343 ?auto_909346 ) ) ( not ( = ?auto_909343 ?auto_909347 ) ) ( not ( = ?auto_909343 ?auto_909348 ) ) ( not ( = ?auto_909343 ?auto_909349 ) ) ( not ( = ?auto_909343 ?auto_909350 ) ) ( not ( = ?auto_909343 ?auto_909351 ) ) ( not ( = ?auto_909343 ?auto_909352 ) ) ( not ( = ?auto_909343 ?auto_909353 ) ) ( not ( = ?auto_909344 ?auto_909345 ) ) ( not ( = ?auto_909344 ?auto_909346 ) ) ( not ( = ?auto_909344 ?auto_909347 ) ) ( not ( = ?auto_909344 ?auto_909348 ) ) ( not ( = ?auto_909344 ?auto_909349 ) ) ( not ( = ?auto_909344 ?auto_909350 ) ) ( not ( = ?auto_909344 ?auto_909351 ) ) ( not ( = ?auto_909344 ?auto_909352 ) ) ( not ( = ?auto_909344 ?auto_909353 ) ) ( not ( = ?auto_909345 ?auto_909346 ) ) ( not ( = ?auto_909345 ?auto_909347 ) ) ( not ( = ?auto_909345 ?auto_909348 ) ) ( not ( = ?auto_909345 ?auto_909349 ) ) ( not ( = ?auto_909345 ?auto_909350 ) ) ( not ( = ?auto_909345 ?auto_909351 ) ) ( not ( = ?auto_909345 ?auto_909352 ) ) ( not ( = ?auto_909345 ?auto_909353 ) ) ( not ( = ?auto_909346 ?auto_909347 ) ) ( not ( = ?auto_909346 ?auto_909348 ) ) ( not ( = ?auto_909346 ?auto_909349 ) ) ( not ( = ?auto_909346 ?auto_909350 ) ) ( not ( = ?auto_909346 ?auto_909351 ) ) ( not ( = ?auto_909346 ?auto_909352 ) ) ( not ( = ?auto_909346 ?auto_909353 ) ) ( not ( = ?auto_909347 ?auto_909348 ) ) ( not ( = ?auto_909347 ?auto_909349 ) ) ( not ( = ?auto_909347 ?auto_909350 ) ) ( not ( = ?auto_909347 ?auto_909351 ) ) ( not ( = ?auto_909347 ?auto_909352 ) ) ( not ( = ?auto_909347 ?auto_909353 ) ) ( not ( = ?auto_909348 ?auto_909349 ) ) ( not ( = ?auto_909348 ?auto_909350 ) ) ( not ( = ?auto_909348 ?auto_909351 ) ) ( not ( = ?auto_909348 ?auto_909352 ) ) ( not ( = ?auto_909348 ?auto_909353 ) ) ( not ( = ?auto_909349 ?auto_909350 ) ) ( not ( = ?auto_909349 ?auto_909351 ) ) ( not ( = ?auto_909349 ?auto_909352 ) ) ( not ( = ?auto_909349 ?auto_909353 ) ) ( not ( = ?auto_909350 ?auto_909351 ) ) ( not ( = ?auto_909350 ?auto_909352 ) ) ( not ( = ?auto_909350 ?auto_909353 ) ) ( not ( = ?auto_909351 ?auto_909352 ) ) ( not ( = ?auto_909351 ?auto_909353 ) ) ( not ( = ?auto_909352 ?auto_909353 ) ) ( ON ?auto_909351 ?auto_909352 ) ( ON ?auto_909350 ?auto_909351 ) ( ON ?auto_909349 ?auto_909350 ) ( ON ?auto_909348 ?auto_909349 ) ( ON ?auto_909347 ?auto_909348 ) ( ON ?auto_909346 ?auto_909347 ) ( CLEAR ?auto_909344 ) ( ON ?auto_909345 ?auto_909346 ) ( CLEAR ?auto_909345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_909341 ?auto_909342 ?auto_909343 ?auto_909344 ?auto_909345 )
      ( MAKE-12PILE ?auto_909341 ?auto_909342 ?auto_909343 ?auto_909344 ?auto_909345 ?auto_909346 ?auto_909347 ?auto_909348 ?auto_909349 ?auto_909350 ?auto_909351 ?auto_909352 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909391 - BLOCK
      ?auto_909392 - BLOCK
      ?auto_909393 - BLOCK
      ?auto_909394 - BLOCK
      ?auto_909395 - BLOCK
      ?auto_909396 - BLOCK
      ?auto_909397 - BLOCK
      ?auto_909398 - BLOCK
      ?auto_909399 - BLOCK
      ?auto_909400 - BLOCK
      ?auto_909401 - BLOCK
      ?auto_909402 - BLOCK
    )
    :vars
    (
      ?auto_909403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909402 ?auto_909403 ) ( ON-TABLE ?auto_909391 ) ( ON ?auto_909392 ?auto_909391 ) ( ON ?auto_909393 ?auto_909392 ) ( not ( = ?auto_909391 ?auto_909392 ) ) ( not ( = ?auto_909391 ?auto_909393 ) ) ( not ( = ?auto_909391 ?auto_909394 ) ) ( not ( = ?auto_909391 ?auto_909395 ) ) ( not ( = ?auto_909391 ?auto_909396 ) ) ( not ( = ?auto_909391 ?auto_909397 ) ) ( not ( = ?auto_909391 ?auto_909398 ) ) ( not ( = ?auto_909391 ?auto_909399 ) ) ( not ( = ?auto_909391 ?auto_909400 ) ) ( not ( = ?auto_909391 ?auto_909401 ) ) ( not ( = ?auto_909391 ?auto_909402 ) ) ( not ( = ?auto_909391 ?auto_909403 ) ) ( not ( = ?auto_909392 ?auto_909393 ) ) ( not ( = ?auto_909392 ?auto_909394 ) ) ( not ( = ?auto_909392 ?auto_909395 ) ) ( not ( = ?auto_909392 ?auto_909396 ) ) ( not ( = ?auto_909392 ?auto_909397 ) ) ( not ( = ?auto_909392 ?auto_909398 ) ) ( not ( = ?auto_909392 ?auto_909399 ) ) ( not ( = ?auto_909392 ?auto_909400 ) ) ( not ( = ?auto_909392 ?auto_909401 ) ) ( not ( = ?auto_909392 ?auto_909402 ) ) ( not ( = ?auto_909392 ?auto_909403 ) ) ( not ( = ?auto_909393 ?auto_909394 ) ) ( not ( = ?auto_909393 ?auto_909395 ) ) ( not ( = ?auto_909393 ?auto_909396 ) ) ( not ( = ?auto_909393 ?auto_909397 ) ) ( not ( = ?auto_909393 ?auto_909398 ) ) ( not ( = ?auto_909393 ?auto_909399 ) ) ( not ( = ?auto_909393 ?auto_909400 ) ) ( not ( = ?auto_909393 ?auto_909401 ) ) ( not ( = ?auto_909393 ?auto_909402 ) ) ( not ( = ?auto_909393 ?auto_909403 ) ) ( not ( = ?auto_909394 ?auto_909395 ) ) ( not ( = ?auto_909394 ?auto_909396 ) ) ( not ( = ?auto_909394 ?auto_909397 ) ) ( not ( = ?auto_909394 ?auto_909398 ) ) ( not ( = ?auto_909394 ?auto_909399 ) ) ( not ( = ?auto_909394 ?auto_909400 ) ) ( not ( = ?auto_909394 ?auto_909401 ) ) ( not ( = ?auto_909394 ?auto_909402 ) ) ( not ( = ?auto_909394 ?auto_909403 ) ) ( not ( = ?auto_909395 ?auto_909396 ) ) ( not ( = ?auto_909395 ?auto_909397 ) ) ( not ( = ?auto_909395 ?auto_909398 ) ) ( not ( = ?auto_909395 ?auto_909399 ) ) ( not ( = ?auto_909395 ?auto_909400 ) ) ( not ( = ?auto_909395 ?auto_909401 ) ) ( not ( = ?auto_909395 ?auto_909402 ) ) ( not ( = ?auto_909395 ?auto_909403 ) ) ( not ( = ?auto_909396 ?auto_909397 ) ) ( not ( = ?auto_909396 ?auto_909398 ) ) ( not ( = ?auto_909396 ?auto_909399 ) ) ( not ( = ?auto_909396 ?auto_909400 ) ) ( not ( = ?auto_909396 ?auto_909401 ) ) ( not ( = ?auto_909396 ?auto_909402 ) ) ( not ( = ?auto_909396 ?auto_909403 ) ) ( not ( = ?auto_909397 ?auto_909398 ) ) ( not ( = ?auto_909397 ?auto_909399 ) ) ( not ( = ?auto_909397 ?auto_909400 ) ) ( not ( = ?auto_909397 ?auto_909401 ) ) ( not ( = ?auto_909397 ?auto_909402 ) ) ( not ( = ?auto_909397 ?auto_909403 ) ) ( not ( = ?auto_909398 ?auto_909399 ) ) ( not ( = ?auto_909398 ?auto_909400 ) ) ( not ( = ?auto_909398 ?auto_909401 ) ) ( not ( = ?auto_909398 ?auto_909402 ) ) ( not ( = ?auto_909398 ?auto_909403 ) ) ( not ( = ?auto_909399 ?auto_909400 ) ) ( not ( = ?auto_909399 ?auto_909401 ) ) ( not ( = ?auto_909399 ?auto_909402 ) ) ( not ( = ?auto_909399 ?auto_909403 ) ) ( not ( = ?auto_909400 ?auto_909401 ) ) ( not ( = ?auto_909400 ?auto_909402 ) ) ( not ( = ?auto_909400 ?auto_909403 ) ) ( not ( = ?auto_909401 ?auto_909402 ) ) ( not ( = ?auto_909401 ?auto_909403 ) ) ( not ( = ?auto_909402 ?auto_909403 ) ) ( ON ?auto_909401 ?auto_909402 ) ( ON ?auto_909400 ?auto_909401 ) ( ON ?auto_909399 ?auto_909400 ) ( ON ?auto_909398 ?auto_909399 ) ( ON ?auto_909397 ?auto_909398 ) ( ON ?auto_909396 ?auto_909397 ) ( ON ?auto_909395 ?auto_909396 ) ( CLEAR ?auto_909393 ) ( ON ?auto_909394 ?auto_909395 ) ( CLEAR ?auto_909394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_909391 ?auto_909392 ?auto_909393 ?auto_909394 )
      ( MAKE-12PILE ?auto_909391 ?auto_909392 ?auto_909393 ?auto_909394 ?auto_909395 ?auto_909396 ?auto_909397 ?auto_909398 ?auto_909399 ?auto_909400 ?auto_909401 ?auto_909402 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909441 - BLOCK
      ?auto_909442 - BLOCK
      ?auto_909443 - BLOCK
      ?auto_909444 - BLOCK
      ?auto_909445 - BLOCK
      ?auto_909446 - BLOCK
      ?auto_909447 - BLOCK
      ?auto_909448 - BLOCK
      ?auto_909449 - BLOCK
      ?auto_909450 - BLOCK
      ?auto_909451 - BLOCK
      ?auto_909452 - BLOCK
    )
    :vars
    (
      ?auto_909453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909452 ?auto_909453 ) ( ON-TABLE ?auto_909441 ) ( ON ?auto_909442 ?auto_909441 ) ( not ( = ?auto_909441 ?auto_909442 ) ) ( not ( = ?auto_909441 ?auto_909443 ) ) ( not ( = ?auto_909441 ?auto_909444 ) ) ( not ( = ?auto_909441 ?auto_909445 ) ) ( not ( = ?auto_909441 ?auto_909446 ) ) ( not ( = ?auto_909441 ?auto_909447 ) ) ( not ( = ?auto_909441 ?auto_909448 ) ) ( not ( = ?auto_909441 ?auto_909449 ) ) ( not ( = ?auto_909441 ?auto_909450 ) ) ( not ( = ?auto_909441 ?auto_909451 ) ) ( not ( = ?auto_909441 ?auto_909452 ) ) ( not ( = ?auto_909441 ?auto_909453 ) ) ( not ( = ?auto_909442 ?auto_909443 ) ) ( not ( = ?auto_909442 ?auto_909444 ) ) ( not ( = ?auto_909442 ?auto_909445 ) ) ( not ( = ?auto_909442 ?auto_909446 ) ) ( not ( = ?auto_909442 ?auto_909447 ) ) ( not ( = ?auto_909442 ?auto_909448 ) ) ( not ( = ?auto_909442 ?auto_909449 ) ) ( not ( = ?auto_909442 ?auto_909450 ) ) ( not ( = ?auto_909442 ?auto_909451 ) ) ( not ( = ?auto_909442 ?auto_909452 ) ) ( not ( = ?auto_909442 ?auto_909453 ) ) ( not ( = ?auto_909443 ?auto_909444 ) ) ( not ( = ?auto_909443 ?auto_909445 ) ) ( not ( = ?auto_909443 ?auto_909446 ) ) ( not ( = ?auto_909443 ?auto_909447 ) ) ( not ( = ?auto_909443 ?auto_909448 ) ) ( not ( = ?auto_909443 ?auto_909449 ) ) ( not ( = ?auto_909443 ?auto_909450 ) ) ( not ( = ?auto_909443 ?auto_909451 ) ) ( not ( = ?auto_909443 ?auto_909452 ) ) ( not ( = ?auto_909443 ?auto_909453 ) ) ( not ( = ?auto_909444 ?auto_909445 ) ) ( not ( = ?auto_909444 ?auto_909446 ) ) ( not ( = ?auto_909444 ?auto_909447 ) ) ( not ( = ?auto_909444 ?auto_909448 ) ) ( not ( = ?auto_909444 ?auto_909449 ) ) ( not ( = ?auto_909444 ?auto_909450 ) ) ( not ( = ?auto_909444 ?auto_909451 ) ) ( not ( = ?auto_909444 ?auto_909452 ) ) ( not ( = ?auto_909444 ?auto_909453 ) ) ( not ( = ?auto_909445 ?auto_909446 ) ) ( not ( = ?auto_909445 ?auto_909447 ) ) ( not ( = ?auto_909445 ?auto_909448 ) ) ( not ( = ?auto_909445 ?auto_909449 ) ) ( not ( = ?auto_909445 ?auto_909450 ) ) ( not ( = ?auto_909445 ?auto_909451 ) ) ( not ( = ?auto_909445 ?auto_909452 ) ) ( not ( = ?auto_909445 ?auto_909453 ) ) ( not ( = ?auto_909446 ?auto_909447 ) ) ( not ( = ?auto_909446 ?auto_909448 ) ) ( not ( = ?auto_909446 ?auto_909449 ) ) ( not ( = ?auto_909446 ?auto_909450 ) ) ( not ( = ?auto_909446 ?auto_909451 ) ) ( not ( = ?auto_909446 ?auto_909452 ) ) ( not ( = ?auto_909446 ?auto_909453 ) ) ( not ( = ?auto_909447 ?auto_909448 ) ) ( not ( = ?auto_909447 ?auto_909449 ) ) ( not ( = ?auto_909447 ?auto_909450 ) ) ( not ( = ?auto_909447 ?auto_909451 ) ) ( not ( = ?auto_909447 ?auto_909452 ) ) ( not ( = ?auto_909447 ?auto_909453 ) ) ( not ( = ?auto_909448 ?auto_909449 ) ) ( not ( = ?auto_909448 ?auto_909450 ) ) ( not ( = ?auto_909448 ?auto_909451 ) ) ( not ( = ?auto_909448 ?auto_909452 ) ) ( not ( = ?auto_909448 ?auto_909453 ) ) ( not ( = ?auto_909449 ?auto_909450 ) ) ( not ( = ?auto_909449 ?auto_909451 ) ) ( not ( = ?auto_909449 ?auto_909452 ) ) ( not ( = ?auto_909449 ?auto_909453 ) ) ( not ( = ?auto_909450 ?auto_909451 ) ) ( not ( = ?auto_909450 ?auto_909452 ) ) ( not ( = ?auto_909450 ?auto_909453 ) ) ( not ( = ?auto_909451 ?auto_909452 ) ) ( not ( = ?auto_909451 ?auto_909453 ) ) ( not ( = ?auto_909452 ?auto_909453 ) ) ( ON ?auto_909451 ?auto_909452 ) ( ON ?auto_909450 ?auto_909451 ) ( ON ?auto_909449 ?auto_909450 ) ( ON ?auto_909448 ?auto_909449 ) ( ON ?auto_909447 ?auto_909448 ) ( ON ?auto_909446 ?auto_909447 ) ( ON ?auto_909445 ?auto_909446 ) ( ON ?auto_909444 ?auto_909445 ) ( CLEAR ?auto_909442 ) ( ON ?auto_909443 ?auto_909444 ) ( CLEAR ?auto_909443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_909441 ?auto_909442 ?auto_909443 )
      ( MAKE-12PILE ?auto_909441 ?auto_909442 ?auto_909443 ?auto_909444 ?auto_909445 ?auto_909446 ?auto_909447 ?auto_909448 ?auto_909449 ?auto_909450 ?auto_909451 ?auto_909452 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909491 - BLOCK
      ?auto_909492 - BLOCK
      ?auto_909493 - BLOCK
      ?auto_909494 - BLOCK
      ?auto_909495 - BLOCK
      ?auto_909496 - BLOCK
      ?auto_909497 - BLOCK
      ?auto_909498 - BLOCK
      ?auto_909499 - BLOCK
      ?auto_909500 - BLOCK
      ?auto_909501 - BLOCK
      ?auto_909502 - BLOCK
    )
    :vars
    (
      ?auto_909503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909502 ?auto_909503 ) ( ON-TABLE ?auto_909491 ) ( not ( = ?auto_909491 ?auto_909492 ) ) ( not ( = ?auto_909491 ?auto_909493 ) ) ( not ( = ?auto_909491 ?auto_909494 ) ) ( not ( = ?auto_909491 ?auto_909495 ) ) ( not ( = ?auto_909491 ?auto_909496 ) ) ( not ( = ?auto_909491 ?auto_909497 ) ) ( not ( = ?auto_909491 ?auto_909498 ) ) ( not ( = ?auto_909491 ?auto_909499 ) ) ( not ( = ?auto_909491 ?auto_909500 ) ) ( not ( = ?auto_909491 ?auto_909501 ) ) ( not ( = ?auto_909491 ?auto_909502 ) ) ( not ( = ?auto_909491 ?auto_909503 ) ) ( not ( = ?auto_909492 ?auto_909493 ) ) ( not ( = ?auto_909492 ?auto_909494 ) ) ( not ( = ?auto_909492 ?auto_909495 ) ) ( not ( = ?auto_909492 ?auto_909496 ) ) ( not ( = ?auto_909492 ?auto_909497 ) ) ( not ( = ?auto_909492 ?auto_909498 ) ) ( not ( = ?auto_909492 ?auto_909499 ) ) ( not ( = ?auto_909492 ?auto_909500 ) ) ( not ( = ?auto_909492 ?auto_909501 ) ) ( not ( = ?auto_909492 ?auto_909502 ) ) ( not ( = ?auto_909492 ?auto_909503 ) ) ( not ( = ?auto_909493 ?auto_909494 ) ) ( not ( = ?auto_909493 ?auto_909495 ) ) ( not ( = ?auto_909493 ?auto_909496 ) ) ( not ( = ?auto_909493 ?auto_909497 ) ) ( not ( = ?auto_909493 ?auto_909498 ) ) ( not ( = ?auto_909493 ?auto_909499 ) ) ( not ( = ?auto_909493 ?auto_909500 ) ) ( not ( = ?auto_909493 ?auto_909501 ) ) ( not ( = ?auto_909493 ?auto_909502 ) ) ( not ( = ?auto_909493 ?auto_909503 ) ) ( not ( = ?auto_909494 ?auto_909495 ) ) ( not ( = ?auto_909494 ?auto_909496 ) ) ( not ( = ?auto_909494 ?auto_909497 ) ) ( not ( = ?auto_909494 ?auto_909498 ) ) ( not ( = ?auto_909494 ?auto_909499 ) ) ( not ( = ?auto_909494 ?auto_909500 ) ) ( not ( = ?auto_909494 ?auto_909501 ) ) ( not ( = ?auto_909494 ?auto_909502 ) ) ( not ( = ?auto_909494 ?auto_909503 ) ) ( not ( = ?auto_909495 ?auto_909496 ) ) ( not ( = ?auto_909495 ?auto_909497 ) ) ( not ( = ?auto_909495 ?auto_909498 ) ) ( not ( = ?auto_909495 ?auto_909499 ) ) ( not ( = ?auto_909495 ?auto_909500 ) ) ( not ( = ?auto_909495 ?auto_909501 ) ) ( not ( = ?auto_909495 ?auto_909502 ) ) ( not ( = ?auto_909495 ?auto_909503 ) ) ( not ( = ?auto_909496 ?auto_909497 ) ) ( not ( = ?auto_909496 ?auto_909498 ) ) ( not ( = ?auto_909496 ?auto_909499 ) ) ( not ( = ?auto_909496 ?auto_909500 ) ) ( not ( = ?auto_909496 ?auto_909501 ) ) ( not ( = ?auto_909496 ?auto_909502 ) ) ( not ( = ?auto_909496 ?auto_909503 ) ) ( not ( = ?auto_909497 ?auto_909498 ) ) ( not ( = ?auto_909497 ?auto_909499 ) ) ( not ( = ?auto_909497 ?auto_909500 ) ) ( not ( = ?auto_909497 ?auto_909501 ) ) ( not ( = ?auto_909497 ?auto_909502 ) ) ( not ( = ?auto_909497 ?auto_909503 ) ) ( not ( = ?auto_909498 ?auto_909499 ) ) ( not ( = ?auto_909498 ?auto_909500 ) ) ( not ( = ?auto_909498 ?auto_909501 ) ) ( not ( = ?auto_909498 ?auto_909502 ) ) ( not ( = ?auto_909498 ?auto_909503 ) ) ( not ( = ?auto_909499 ?auto_909500 ) ) ( not ( = ?auto_909499 ?auto_909501 ) ) ( not ( = ?auto_909499 ?auto_909502 ) ) ( not ( = ?auto_909499 ?auto_909503 ) ) ( not ( = ?auto_909500 ?auto_909501 ) ) ( not ( = ?auto_909500 ?auto_909502 ) ) ( not ( = ?auto_909500 ?auto_909503 ) ) ( not ( = ?auto_909501 ?auto_909502 ) ) ( not ( = ?auto_909501 ?auto_909503 ) ) ( not ( = ?auto_909502 ?auto_909503 ) ) ( ON ?auto_909501 ?auto_909502 ) ( ON ?auto_909500 ?auto_909501 ) ( ON ?auto_909499 ?auto_909500 ) ( ON ?auto_909498 ?auto_909499 ) ( ON ?auto_909497 ?auto_909498 ) ( ON ?auto_909496 ?auto_909497 ) ( ON ?auto_909495 ?auto_909496 ) ( ON ?auto_909494 ?auto_909495 ) ( ON ?auto_909493 ?auto_909494 ) ( CLEAR ?auto_909491 ) ( ON ?auto_909492 ?auto_909493 ) ( CLEAR ?auto_909492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_909491 ?auto_909492 )
      ( MAKE-12PILE ?auto_909491 ?auto_909492 ?auto_909493 ?auto_909494 ?auto_909495 ?auto_909496 ?auto_909497 ?auto_909498 ?auto_909499 ?auto_909500 ?auto_909501 ?auto_909502 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_909541 - BLOCK
      ?auto_909542 - BLOCK
      ?auto_909543 - BLOCK
      ?auto_909544 - BLOCK
      ?auto_909545 - BLOCK
      ?auto_909546 - BLOCK
      ?auto_909547 - BLOCK
      ?auto_909548 - BLOCK
      ?auto_909549 - BLOCK
      ?auto_909550 - BLOCK
      ?auto_909551 - BLOCK
      ?auto_909552 - BLOCK
    )
    :vars
    (
      ?auto_909553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909552 ?auto_909553 ) ( not ( = ?auto_909541 ?auto_909542 ) ) ( not ( = ?auto_909541 ?auto_909543 ) ) ( not ( = ?auto_909541 ?auto_909544 ) ) ( not ( = ?auto_909541 ?auto_909545 ) ) ( not ( = ?auto_909541 ?auto_909546 ) ) ( not ( = ?auto_909541 ?auto_909547 ) ) ( not ( = ?auto_909541 ?auto_909548 ) ) ( not ( = ?auto_909541 ?auto_909549 ) ) ( not ( = ?auto_909541 ?auto_909550 ) ) ( not ( = ?auto_909541 ?auto_909551 ) ) ( not ( = ?auto_909541 ?auto_909552 ) ) ( not ( = ?auto_909541 ?auto_909553 ) ) ( not ( = ?auto_909542 ?auto_909543 ) ) ( not ( = ?auto_909542 ?auto_909544 ) ) ( not ( = ?auto_909542 ?auto_909545 ) ) ( not ( = ?auto_909542 ?auto_909546 ) ) ( not ( = ?auto_909542 ?auto_909547 ) ) ( not ( = ?auto_909542 ?auto_909548 ) ) ( not ( = ?auto_909542 ?auto_909549 ) ) ( not ( = ?auto_909542 ?auto_909550 ) ) ( not ( = ?auto_909542 ?auto_909551 ) ) ( not ( = ?auto_909542 ?auto_909552 ) ) ( not ( = ?auto_909542 ?auto_909553 ) ) ( not ( = ?auto_909543 ?auto_909544 ) ) ( not ( = ?auto_909543 ?auto_909545 ) ) ( not ( = ?auto_909543 ?auto_909546 ) ) ( not ( = ?auto_909543 ?auto_909547 ) ) ( not ( = ?auto_909543 ?auto_909548 ) ) ( not ( = ?auto_909543 ?auto_909549 ) ) ( not ( = ?auto_909543 ?auto_909550 ) ) ( not ( = ?auto_909543 ?auto_909551 ) ) ( not ( = ?auto_909543 ?auto_909552 ) ) ( not ( = ?auto_909543 ?auto_909553 ) ) ( not ( = ?auto_909544 ?auto_909545 ) ) ( not ( = ?auto_909544 ?auto_909546 ) ) ( not ( = ?auto_909544 ?auto_909547 ) ) ( not ( = ?auto_909544 ?auto_909548 ) ) ( not ( = ?auto_909544 ?auto_909549 ) ) ( not ( = ?auto_909544 ?auto_909550 ) ) ( not ( = ?auto_909544 ?auto_909551 ) ) ( not ( = ?auto_909544 ?auto_909552 ) ) ( not ( = ?auto_909544 ?auto_909553 ) ) ( not ( = ?auto_909545 ?auto_909546 ) ) ( not ( = ?auto_909545 ?auto_909547 ) ) ( not ( = ?auto_909545 ?auto_909548 ) ) ( not ( = ?auto_909545 ?auto_909549 ) ) ( not ( = ?auto_909545 ?auto_909550 ) ) ( not ( = ?auto_909545 ?auto_909551 ) ) ( not ( = ?auto_909545 ?auto_909552 ) ) ( not ( = ?auto_909545 ?auto_909553 ) ) ( not ( = ?auto_909546 ?auto_909547 ) ) ( not ( = ?auto_909546 ?auto_909548 ) ) ( not ( = ?auto_909546 ?auto_909549 ) ) ( not ( = ?auto_909546 ?auto_909550 ) ) ( not ( = ?auto_909546 ?auto_909551 ) ) ( not ( = ?auto_909546 ?auto_909552 ) ) ( not ( = ?auto_909546 ?auto_909553 ) ) ( not ( = ?auto_909547 ?auto_909548 ) ) ( not ( = ?auto_909547 ?auto_909549 ) ) ( not ( = ?auto_909547 ?auto_909550 ) ) ( not ( = ?auto_909547 ?auto_909551 ) ) ( not ( = ?auto_909547 ?auto_909552 ) ) ( not ( = ?auto_909547 ?auto_909553 ) ) ( not ( = ?auto_909548 ?auto_909549 ) ) ( not ( = ?auto_909548 ?auto_909550 ) ) ( not ( = ?auto_909548 ?auto_909551 ) ) ( not ( = ?auto_909548 ?auto_909552 ) ) ( not ( = ?auto_909548 ?auto_909553 ) ) ( not ( = ?auto_909549 ?auto_909550 ) ) ( not ( = ?auto_909549 ?auto_909551 ) ) ( not ( = ?auto_909549 ?auto_909552 ) ) ( not ( = ?auto_909549 ?auto_909553 ) ) ( not ( = ?auto_909550 ?auto_909551 ) ) ( not ( = ?auto_909550 ?auto_909552 ) ) ( not ( = ?auto_909550 ?auto_909553 ) ) ( not ( = ?auto_909551 ?auto_909552 ) ) ( not ( = ?auto_909551 ?auto_909553 ) ) ( not ( = ?auto_909552 ?auto_909553 ) ) ( ON ?auto_909551 ?auto_909552 ) ( ON ?auto_909550 ?auto_909551 ) ( ON ?auto_909549 ?auto_909550 ) ( ON ?auto_909548 ?auto_909549 ) ( ON ?auto_909547 ?auto_909548 ) ( ON ?auto_909546 ?auto_909547 ) ( ON ?auto_909545 ?auto_909546 ) ( ON ?auto_909544 ?auto_909545 ) ( ON ?auto_909543 ?auto_909544 ) ( ON ?auto_909542 ?auto_909543 ) ( ON ?auto_909541 ?auto_909542 ) ( CLEAR ?auto_909541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_909541 )
      ( MAKE-12PILE ?auto_909541 ?auto_909542 ?auto_909543 ?auto_909544 ?auto_909545 ?auto_909546 ?auto_909547 ?auto_909548 ?auto_909549 ?auto_909550 ?auto_909551 ?auto_909552 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909592 - BLOCK
      ?auto_909593 - BLOCK
      ?auto_909594 - BLOCK
      ?auto_909595 - BLOCK
      ?auto_909596 - BLOCK
      ?auto_909597 - BLOCK
      ?auto_909598 - BLOCK
      ?auto_909599 - BLOCK
      ?auto_909600 - BLOCK
      ?auto_909601 - BLOCK
      ?auto_909602 - BLOCK
      ?auto_909603 - BLOCK
      ?auto_909604 - BLOCK
    )
    :vars
    (
      ?auto_909605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_909603 ) ( ON ?auto_909604 ?auto_909605 ) ( CLEAR ?auto_909604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_909592 ) ( ON ?auto_909593 ?auto_909592 ) ( ON ?auto_909594 ?auto_909593 ) ( ON ?auto_909595 ?auto_909594 ) ( ON ?auto_909596 ?auto_909595 ) ( ON ?auto_909597 ?auto_909596 ) ( ON ?auto_909598 ?auto_909597 ) ( ON ?auto_909599 ?auto_909598 ) ( ON ?auto_909600 ?auto_909599 ) ( ON ?auto_909601 ?auto_909600 ) ( ON ?auto_909602 ?auto_909601 ) ( ON ?auto_909603 ?auto_909602 ) ( not ( = ?auto_909592 ?auto_909593 ) ) ( not ( = ?auto_909592 ?auto_909594 ) ) ( not ( = ?auto_909592 ?auto_909595 ) ) ( not ( = ?auto_909592 ?auto_909596 ) ) ( not ( = ?auto_909592 ?auto_909597 ) ) ( not ( = ?auto_909592 ?auto_909598 ) ) ( not ( = ?auto_909592 ?auto_909599 ) ) ( not ( = ?auto_909592 ?auto_909600 ) ) ( not ( = ?auto_909592 ?auto_909601 ) ) ( not ( = ?auto_909592 ?auto_909602 ) ) ( not ( = ?auto_909592 ?auto_909603 ) ) ( not ( = ?auto_909592 ?auto_909604 ) ) ( not ( = ?auto_909592 ?auto_909605 ) ) ( not ( = ?auto_909593 ?auto_909594 ) ) ( not ( = ?auto_909593 ?auto_909595 ) ) ( not ( = ?auto_909593 ?auto_909596 ) ) ( not ( = ?auto_909593 ?auto_909597 ) ) ( not ( = ?auto_909593 ?auto_909598 ) ) ( not ( = ?auto_909593 ?auto_909599 ) ) ( not ( = ?auto_909593 ?auto_909600 ) ) ( not ( = ?auto_909593 ?auto_909601 ) ) ( not ( = ?auto_909593 ?auto_909602 ) ) ( not ( = ?auto_909593 ?auto_909603 ) ) ( not ( = ?auto_909593 ?auto_909604 ) ) ( not ( = ?auto_909593 ?auto_909605 ) ) ( not ( = ?auto_909594 ?auto_909595 ) ) ( not ( = ?auto_909594 ?auto_909596 ) ) ( not ( = ?auto_909594 ?auto_909597 ) ) ( not ( = ?auto_909594 ?auto_909598 ) ) ( not ( = ?auto_909594 ?auto_909599 ) ) ( not ( = ?auto_909594 ?auto_909600 ) ) ( not ( = ?auto_909594 ?auto_909601 ) ) ( not ( = ?auto_909594 ?auto_909602 ) ) ( not ( = ?auto_909594 ?auto_909603 ) ) ( not ( = ?auto_909594 ?auto_909604 ) ) ( not ( = ?auto_909594 ?auto_909605 ) ) ( not ( = ?auto_909595 ?auto_909596 ) ) ( not ( = ?auto_909595 ?auto_909597 ) ) ( not ( = ?auto_909595 ?auto_909598 ) ) ( not ( = ?auto_909595 ?auto_909599 ) ) ( not ( = ?auto_909595 ?auto_909600 ) ) ( not ( = ?auto_909595 ?auto_909601 ) ) ( not ( = ?auto_909595 ?auto_909602 ) ) ( not ( = ?auto_909595 ?auto_909603 ) ) ( not ( = ?auto_909595 ?auto_909604 ) ) ( not ( = ?auto_909595 ?auto_909605 ) ) ( not ( = ?auto_909596 ?auto_909597 ) ) ( not ( = ?auto_909596 ?auto_909598 ) ) ( not ( = ?auto_909596 ?auto_909599 ) ) ( not ( = ?auto_909596 ?auto_909600 ) ) ( not ( = ?auto_909596 ?auto_909601 ) ) ( not ( = ?auto_909596 ?auto_909602 ) ) ( not ( = ?auto_909596 ?auto_909603 ) ) ( not ( = ?auto_909596 ?auto_909604 ) ) ( not ( = ?auto_909596 ?auto_909605 ) ) ( not ( = ?auto_909597 ?auto_909598 ) ) ( not ( = ?auto_909597 ?auto_909599 ) ) ( not ( = ?auto_909597 ?auto_909600 ) ) ( not ( = ?auto_909597 ?auto_909601 ) ) ( not ( = ?auto_909597 ?auto_909602 ) ) ( not ( = ?auto_909597 ?auto_909603 ) ) ( not ( = ?auto_909597 ?auto_909604 ) ) ( not ( = ?auto_909597 ?auto_909605 ) ) ( not ( = ?auto_909598 ?auto_909599 ) ) ( not ( = ?auto_909598 ?auto_909600 ) ) ( not ( = ?auto_909598 ?auto_909601 ) ) ( not ( = ?auto_909598 ?auto_909602 ) ) ( not ( = ?auto_909598 ?auto_909603 ) ) ( not ( = ?auto_909598 ?auto_909604 ) ) ( not ( = ?auto_909598 ?auto_909605 ) ) ( not ( = ?auto_909599 ?auto_909600 ) ) ( not ( = ?auto_909599 ?auto_909601 ) ) ( not ( = ?auto_909599 ?auto_909602 ) ) ( not ( = ?auto_909599 ?auto_909603 ) ) ( not ( = ?auto_909599 ?auto_909604 ) ) ( not ( = ?auto_909599 ?auto_909605 ) ) ( not ( = ?auto_909600 ?auto_909601 ) ) ( not ( = ?auto_909600 ?auto_909602 ) ) ( not ( = ?auto_909600 ?auto_909603 ) ) ( not ( = ?auto_909600 ?auto_909604 ) ) ( not ( = ?auto_909600 ?auto_909605 ) ) ( not ( = ?auto_909601 ?auto_909602 ) ) ( not ( = ?auto_909601 ?auto_909603 ) ) ( not ( = ?auto_909601 ?auto_909604 ) ) ( not ( = ?auto_909601 ?auto_909605 ) ) ( not ( = ?auto_909602 ?auto_909603 ) ) ( not ( = ?auto_909602 ?auto_909604 ) ) ( not ( = ?auto_909602 ?auto_909605 ) ) ( not ( = ?auto_909603 ?auto_909604 ) ) ( not ( = ?auto_909603 ?auto_909605 ) ) ( not ( = ?auto_909604 ?auto_909605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_909604 ?auto_909605 )
      ( !STACK ?auto_909604 ?auto_909603 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909646 - BLOCK
      ?auto_909647 - BLOCK
      ?auto_909648 - BLOCK
      ?auto_909649 - BLOCK
      ?auto_909650 - BLOCK
      ?auto_909651 - BLOCK
      ?auto_909652 - BLOCK
      ?auto_909653 - BLOCK
      ?auto_909654 - BLOCK
      ?auto_909655 - BLOCK
      ?auto_909656 - BLOCK
      ?auto_909657 - BLOCK
      ?auto_909658 - BLOCK
    )
    :vars
    (
      ?auto_909659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909658 ?auto_909659 ) ( ON-TABLE ?auto_909646 ) ( ON ?auto_909647 ?auto_909646 ) ( ON ?auto_909648 ?auto_909647 ) ( ON ?auto_909649 ?auto_909648 ) ( ON ?auto_909650 ?auto_909649 ) ( ON ?auto_909651 ?auto_909650 ) ( ON ?auto_909652 ?auto_909651 ) ( ON ?auto_909653 ?auto_909652 ) ( ON ?auto_909654 ?auto_909653 ) ( ON ?auto_909655 ?auto_909654 ) ( ON ?auto_909656 ?auto_909655 ) ( not ( = ?auto_909646 ?auto_909647 ) ) ( not ( = ?auto_909646 ?auto_909648 ) ) ( not ( = ?auto_909646 ?auto_909649 ) ) ( not ( = ?auto_909646 ?auto_909650 ) ) ( not ( = ?auto_909646 ?auto_909651 ) ) ( not ( = ?auto_909646 ?auto_909652 ) ) ( not ( = ?auto_909646 ?auto_909653 ) ) ( not ( = ?auto_909646 ?auto_909654 ) ) ( not ( = ?auto_909646 ?auto_909655 ) ) ( not ( = ?auto_909646 ?auto_909656 ) ) ( not ( = ?auto_909646 ?auto_909657 ) ) ( not ( = ?auto_909646 ?auto_909658 ) ) ( not ( = ?auto_909646 ?auto_909659 ) ) ( not ( = ?auto_909647 ?auto_909648 ) ) ( not ( = ?auto_909647 ?auto_909649 ) ) ( not ( = ?auto_909647 ?auto_909650 ) ) ( not ( = ?auto_909647 ?auto_909651 ) ) ( not ( = ?auto_909647 ?auto_909652 ) ) ( not ( = ?auto_909647 ?auto_909653 ) ) ( not ( = ?auto_909647 ?auto_909654 ) ) ( not ( = ?auto_909647 ?auto_909655 ) ) ( not ( = ?auto_909647 ?auto_909656 ) ) ( not ( = ?auto_909647 ?auto_909657 ) ) ( not ( = ?auto_909647 ?auto_909658 ) ) ( not ( = ?auto_909647 ?auto_909659 ) ) ( not ( = ?auto_909648 ?auto_909649 ) ) ( not ( = ?auto_909648 ?auto_909650 ) ) ( not ( = ?auto_909648 ?auto_909651 ) ) ( not ( = ?auto_909648 ?auto_909652 ) ) ( not ( = ?auto_909648 ?auto_909653 ) ) ( not ( = ?auto_909648 ?auto_909654 ) ) ( not ( = ?auto_909648 ?auto_909655 ) ) ( not ( = ?auto_909648 ?auto_909656 ) ) ( not ( = ?auto_909648 ?auto_909657 ) ) ( not ( = ?auto_909648 ?auto_909658 ) ) ( not ( = ?auto_909648 ?auto_909659 ) ) ( not ( = ?auto_909649 ?auto_909650 ) ) ( not ( = ?auto_909649 ?auto_909651 ) ) ( not ( = ?auto_909649 ?auto_909652 ) ) ( not ( = ?auto_909649 ?auto_909653 ) ) ( not ( = ?auto_909649 ?auto_909654 ) ) ( not ( = ?auto_909649 ?auto_909655 ) ) ( not ( = ?auto_909649 ?auto_909656 ) ) ( not ( = ?auto_909649 ?auto_909657 ) ) ( not ( = ?auto_909649 ?auto_909658 ) ) ( not ( = ?auto_909649 ?auto_909659 ) ) ( not ( = ?auto_909650 ?auto_909651 ) ) ( not ( = ?auto_909650 ?auto_909652 ) ) ( not ( = ?auto_909650 ?auto_909653 ) ) ( not ( = ?auto_909650 ?auto_909654 ) ) ( not ( = ?auto_909650 ?auto_909655 ) ) ( not ( = ?auto_909650 ?auto_909656 ) ) ( not ( = ?auto_909650 ?auto_909657 ) ) ( not ( = ?auto_909650 ?auto_909658 ) ) ( not ( = ?auto_909650 ?auto_909659 ) ) ( not ( = ?auto_909651 ?auto_909652 ) ) ( not ( = ?auto_909651 ?auto_909653 ) ) ( not ( = ?auto_909651 ?auto_909654 ) ) ( not ( = ?auto_909651 ?auto_909655 ) ) ( not ( = ?auto_909651 ?auto_909656 ) ) ( not ( = ?auto_909651 ?auto_909657 ) ) ( not ( = ?auto_909651 ?auto_909658 ) ) ( not ( = ?auto_909651 ?auto_909659 ) ) ( not ( = ?auto_909652 ?auto_909653 ) ) ( not ( = ?auto_909652 ?auto_909654 ) ) ( not ( = ?auto_909652 ?auto_909655 ) ) ( not ( = ?auto_909652 ?auto_909656 ) ) ( not ( = ?auto_909652 ?auto_909657 ) ) ( not ( = ?auto_909652 ?auto_909658 ) ) ( not ( = ?auto_909652 ?auto_909659 ) ) ( not ( = ?auto_909653 ?auto_909654 ) ) ( not ( = ?auto_909653 ?auto_909655 ) ) ( not ( = ?auto_909653 ?auto_909656 ) ) ( not ( = ?auto_909653 ?auto_909657 ) ) ( not ( = ?auto_909653 ?auto_909658 ) ) ( not ( = ?auto_909653 ?auto_909659 ) ) ( not ( = ?auto_909654 ?auto_909655 ) ) ( not ( = ?auto_909654 ?auto_909656 ) ) ( not ( = ?auto_909654 ?auto_909657 ) ) ( not ( = ?auto_909654 ?auto_909658 ) ) ( not ( = ?auto_909654 ?auto_909659 ) ) ( not ( = ?auto_909655 ?auto_909656 ) ) ( not ( = ?auto_909655 ?auto_909657 ) ) ( not ( = ?auto_909655 ?auto_909658 ) ) ( not ( = ?auto_909655 ?auto_909659 ) ) ( not ( = ?auto_909656 ?auto_909657 ) ) ( not ( = ?auto_909656 ?auto_909658 ) ) ( not ( = ?auto_909656 ?auto_909659 ) ) ( not ( = ?auto_909657 ?auto_909658 ) ) ( not ( = ?auto_909657 ?auto_909659 ) ) ( not ( = ?auto_909658 ?auto_909659 ) ) ( CLEAR ?auto_909656 ) ( ON ?auto_909657 ?auto_909658 ) ( CLEAR ?auto_909657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_909646 ?auto_909647 ?auto_909648 ?auto_909649 ?auto_909650 ?auto_909651 ?auto_909652 ?auto_909653 ?auto_909654 ?auto_909655 ?auto_909656 ?auto_909657 )
      ( MAKE-13PILE ?auto_909646 ?auto_909647 ?auto_909648 ?auto_909649 ?auto_909650 ?auto_909651 ?auto_909652 ?auto_909653 ?auto_909654 ?auto_909655 ?auto_909656 ?auto_909657 ?auto_909658 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909700 - BLOCK
      ?auto_909701 - BLOCK
      ?auto_909702 - BLOCK
      ?auto_909703 - BLOCK
      ?auto_909704 - BLOCK
      ?auto_909705 - BLOCK
      ?auto_909706 - BLOCK
      ?auto_909707 - BLOCK
      ?auto_909708 - BLOCK
      ?auto_909709 - BLOCK
      ?auto_909710 - BLOCK
      ?auto_909711 - BLOCK
      ?auto_909712 - BLOCK
    )
    :vars
    (
      ?auto_909713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909712 ?auto_909713 ) ( ON-TABLE ?auto_909700 ) ( ON ?auto_909701 ?auto_909700 ) ( ON ?auto_909702 ?auto_909701 ) ( ON ?auto_909703 ?auto_909702 ) ( ON ?auto_909704 ?auto_909703 ) ( ON ?auto_909705 ?auto_909704 ) ( ON ?auto_909706 ?auto_909705 ) ( ON ?auto_909707 ?auto_909706 ) ( ON ?auto_909708 ?auto_909707 ) ( ON ?auto_909709 ?auto_909708 ) ( not ( = ?auto_909700 ?auto_909701 ) ) ( not ( = ?auto_909700 ?auto_909702 ) ) ( not ( = ?auto_909700 ?auto_909703 ) ) ( not ( = ?auto_909700 ?auto_909704 ) ) ( not ( = ?auto_909700 ?auto_909705 ) ) ( not ( = ?auto_909700 ?auto_909706 ) ) ( not ( = ?auto_909700 ?auto_909707 ) ) ( not ( = ?auto_909700 ?auto_909708 ) ) ( not ( = ?auto_909700 ?auto_909709 ) ) ( not ( = ?auto_909700 ?auto_909710 ) ) ( not ( = ?auto_909700 ?auto_909711 ) ) ( not ( = ?auto_909700 ?auto_909712 ) ) ( not ( = ?auto_909700 ?auto_909713 ) ) ( not ( = ?auto_909701 ?auto_909702 ) ) ( not ( = ?auto_909701 ?auto_909703 ) ) ( not ( = ?auto_909701 ?auto_909704 ) ) ( not ( = ?auto_909701 ?auto_909705 ) ) ( not ( = ?auto_909701 ?auto_909706 ) ) ( not ( = ?auto_909701 ?auto_909707 ) ) ( not ( = ?auto_909701 ?auto_909708 ) ) ( not ( = ?auto_909701 ?auto_909709 ) ) ( not ( = ?auto_909701 ?auto_909710 ) ) ( not ( = ?auto_909701 ?auto_909711 ) ) ( not ( = ?auto_909701 ?auto_909712 ) ) ( not ( = ?auto_909701 ?auto_909713 ) ) ( not ( = ?auto_909702 ?auto_909703 ) ) ( not ( = ?auto_909702 ?auto_909704 ) ) ( not ( = ?auto_909702 ?auto_909705 ) ) ( not ( = ?auto_909702 ?auto_909706 ) ) ( not ( = ?auto_909702 ?auto_909707 ) ) ( not ( = ?auto_909702 ?auto_909708 ) ) ( not ( = ?auto_909702 ?auto_909709 ) ) ( not ( = ?auto_909702 ?auto_909710 ) ) ( not ( = ?auto_909702 ?auto_909711 ) ) ( not ( = ?auto_909702 ?auto_909712 ) ) ( not ( = ?auto_909702 ?auto_909713 ) ) ( not ( = ?auto_909703 ?auto_909704 ) ) ( not ( = ?auto_909703 ?auto_909705 ) ) ( not ( = ?auto_909703 ?auto_909706 ) ) ( not ( = ?auto_909703 ?auto_909707 ) ) ( not ( = ?auto_909703 ?auto_909708 ) ) ( not ( = ?auto_909703 ?auto_909709 ) ) ( not ( = ?auto_909703 ?auto_909710 ) ) ( not ( = ?auto_909703 ?auto_909711 ) ) ( not ( = ?auto_909703 ?auto_909712 ) ) ( not ( = ?auto_909703 ?auto_909713 ) ) ( not ( = ?auto_909704 ?auto_909705 ) ) ( not ( = ?auto_909704 ?auto_909706 ) ) ( not ( = ?auto_909704 ?auto_909707 ) ) ( not ( = ?auto_909704 ?auto_909708 ) ) ( not ( = ?auto_909704 ?auto_909709 ) ) ( not ( = ?auto_909704 ?auto_909710 ) ) ( not ( = ?auto_909704 ?auto_909711 ) ) ( not ( = ?auto_909704 ?auto_909712 ) ) ( not ( = ?auto_909704 ?auto_909713 ) ) ( not ( = ?auto_909705 ?auto_909706 ) ) ( not ( = ?auto_909705 ?auto_909707 ) ) ( not ( = ?auto_909705 ?auto_909708 ) ) ( not ( = ?auto_909705 ?auto_909709 ) ) ( not ( = ?auto_909705 ?auto_909710 ) ) ( not ( = ?auto_909705 ?auto_909711 ) ) ( not ( = ?auto_909705 ?auto_909712 ) ) ( not ( = ?auto_909705 ?auto_909713 ) ) ( not ( = ?auto_909706 ?auto_909707 ) ) ( not ( = ?auto_909706 ?auto_909708 ) ) ( not ( = ?auto_909706 ?auto_909709 ) ) ( not ( = ?auto_909706 ?auto_909710 ) ) ( not ( = ?auto_909706 ?auto_909711 ) ) ( not ( = ?auto_909706 ?auto_909712 ) ) ( not ( = ?auto_909706 ?auto_909713 ) ) ( not ( = ?auto_909707 ?auto_909708 ) ) ( not ( = ?auto_909707 ?auto_909709 ) ) ( not ( = ?auto_909707 ?auto_909710 ) ) ( not ( = ?auto_909707 ?auto_909711 ) ) ( not ( = ?auto_909707 ?auto_909712 ) ) ( not ( = ?auto_909707 ?auto_909713 ) ) ( not ( = ?auto_909708 ?auto_909709 ) ) ( not ( = ?auto_909708 ?auto_909710 ) ) ( not ( = ?auto_909708 ?auto_909711 ) ) ( not ( = ?auto_909708 ?auto_909712 ) ) ( not ( = ?auto_909708 ?auto_909713 ) ) ( not ( = ?auto_909709 ?auto_909710 ) ) ( not ( = ?auto_909709 ?auto_909711 ) ) ( not ( = ?auto_909709 ?auto_909712 ) ) ( not ( = ?auto_909709 ?auto_909713 ) ) ( not ( = ?auto_909710 ?auto_909711 ) ) ( not ( = ?auto_909710 ?auto_909712 ) ) ( not ( = ?auto_909710 ?auto_909713 ) ) ( not ( = ?auto_909711 ?auto_909712 ) ) ( not ( = ?auto_909711 ?auto_909713 ) ) ( not ( = ?auto_909712 ?auto_909713 ) ) ( ON ?auto_909711 ?auto_909712 ) ( CLEAR ?auto_909709 ) ( ON ?auto_909710 ?auto_909711 ) ( CLEAR ?auto_909710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_909700 ?auto_909701 ?auto_909702 ?auto_909703 ?auto_909704 ?auto_909705 ?auto_909706 ?auto_909707 ?auto_909708 ?auto_909709 ?auto_909710 )
      ( MAKE-13PILE ?auto_909700 ?auto_909701 ?auto_909702 ?auto_909703 ?auto_909704 ?auto_909705 ?auto_909706 ?auto_909707 ?auto_909708 ?auto_909709 ?auto_909710 ?auto_909711 ?auto_909712 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909754 - BLOCK
      ?auto_909755 - BLOCK
      ?auto_909756 - BLOCK
      ?auto_909757 - BLOCK
      ?auto_909758 - BLOCK
      ?auto_909759 - BLOCK
      ?auto_909760 - BLOCK
      ?auto_909761 - BLOCK
      ?auto_909762 - BLOCK
      ?auto_909763 - BLOCK
      ?auto_909764 - BLOCK
      ?auto_909765 - BLOCK
      ?auto_909766 - BLOCK
    )
    :vars
    (
      ?auto_909767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909766 ?auto_909767 ) ( ON-TABLE ?auto_909754 ) ( ON ?auto_909755 ?auto_909754 ) ( ON ?auto_909756 ?auto_909755 ) ( ON ?auto_909757 ?auto_909756 ) ( ON ?auto_909758 ?auto_909757 ) ( ON ?auto_909759 ?auto_909758 ) ( ON ?auto_909760 ?auto_909759 ) ( ON ?auto_909761 ?auto_909760 ) ( ON ?auto_909762 ?auto_909761 ) ( not ( = ?auto_909754 ?auto_909755 ) ) ( not ( = ?auto_909754 ?auto_909756 ) ) ( not ( = ?auto_909754 ?auto_909757 ) ) ( not ( = ?auto_909754 ?auto_909758 ) ) ( not ( = ?auto_909754 ?auto_909759 ) ) ( not ( = ?auto_909754 ?auto_909760 ) ) ( not ( = ?auto_909754 ?auto_909761 ) ) ( not ( = ?auto_909754 ?auto_909762 ) ) ( not ( = ?auto_909754 ?auto_909763 ) ) ( not ( = ?auto_909754 ?auto_909764 ) ) ( not ( = ?auto_909754 ?auto_909765 ) ) ( not ( = ?auto_909754 ?auto_909766 ) ) ( not ( = ?auto_909754 ?auto_909767 ) ) ( not ( = ?auto_909755 ?auto_909756 ) ) ( not ( = ?auto_909755 ?auto_909757 ) ) ( not ( = ?auto_909755 ?auto_909758 ) ) ( not ( = ?auto_909755 ?auto_909759 ) ) ( not ( = ?auto_909755 ?auto_909760 ) ) ( not ( = ?auto_909755 ?auto_909761 ) ) ( not ( = ?auto_909755 ?auto_909762 ) ) ( not ( = ?auto_909755 ?auto_909763 ) ) ( not ( = ?auto_909755 ?auto_909764 ) ) ( not ( = ?auto_909755 ?auto_909765 ) ) ( not ( = ?auto_909755 ?auto_909766 ) ) ( not ( = ?auto_909755 ?auto_909767 ) ) ( not ( = ?auto_909756 ?auto_909757 ) ) ( not ( = ?auto_909756 ?auto_909758 ) ) ( not ( = ?auto_909756 ?auto_909759 ) ) ( not ( = ?auto_909756 ?auto_909760 ) ) ( not ( = ?auto_909756 ?auto_909761 ) ) ( not ( = ?auto_909756 ?auto_909762 ) ) ( not ( = ?auto_909756 ?auto_909763 ) ) ( not ( = ?auto_909756 ?auto_909764 ) ) ( not ( = ?auto_909756 ?auto_909765 ) ) ( not ( = ?auto_909756 ?auto_909766 ) ) ( not ( = ?auto_909756 ?auto_909767 ) ) ( not ( = ?auto_909757 ?auto_909758 ) ) ( not ( = ?auto_909757 ?auto_909759 ) ) ( not ( = ?auto_909757 ?auto_909760 ) ) ( not ( = ?auto_909757 ?auto_909761 ) ) ( not ( = ?auto_909757 ?auto_909762 ) ) ( not ( = ?auto_909757 ?auto_909763 ) ) ( not ( = ?auto_909757 ?auto_909764 ) ) ( not ( = ?auto_909757 ?auto_909765 ) ) ( not ( = ?auto_909757 ?auto_909766 ) ) ( not ( = ?auto_909757 ?auto_909767 ) ) ( not ( = ?auto_909758 ?auto_909759 ) ) ( not ( = ?auto_909758 ?auto_909760 ) ) ( not ( = ?auto_909758 ?auto_909761 ) ) ( not ( = ?auto_909758 ?auto_909762 ) ) ( not ( = ?auto_909758 ?auto_909763 ) ) ( not ( = ?auto_909758 ?auto_909764 ) ) ( not ( = ?auto_909758 ?auto_909765 ) ) ( not ( = ?auto_909758 ?auto_909766 ) ) ( not ( = ?auto_909758 ?auto_909767 ) ) ( not ( = ?auto_909759 ?auto_909760 ) ) ( not ( = ?auto_909759 ?auto_909761 ) ) ( not ( = ?auto_909759 ?auto_909762 ) ) ( not ( = ?auto_909759 ?auto_909763 ) ) ( not ( = ?auto_909759 ?auto_909764 ) ) ( not ( = ?auto_909759 ?auto_909765 ) ) ( not ( = ?auto_909759 ?auto_909766 ) ) ( not ( = ?auto_909759 ?auto_909767 ) ) ( not ( = ?auto_909760 ?auto_909761 ) ) ( not ( = ?auto_909760 ?auto_909762 ) ) ( not ( = ?auto_909760 ?auto_909763 ) ) ( not ( = ?auto_909760 ?auto_909764 ) ) ( not ( = ?auto_909760 ?auto_909765 ) ) ( not ( = ?auto_909760 ?auto_909766 ) ) ( not ( = ?auto_909760 ?auto_909767 ) ) ( not ( = ?auto_909761 ?auto_909762 ) ) ( not ( = ?auto_909761 ?auto_909763 ) ) ( not ( = ?auto_909761 ?auto_909764 ) ) ( not ( = ?auto_909761 ?auto_909765 ) ) ( not ( = ?auto_909761 ?auto_909766 ) ) ( not ( = ?auto_909761 ?auto_909767 ) ) ( not ( = ?auto_909762 ?auto_909763 ) ) ( not ( = ?auto_909762 ?auto_909764 ) ) ( not ( = ?auto_909762 ?auto_909765 ) ) ( not ( = ?auto_909762 ?auto_909766 ) ) ( not ( = ?auto_909762 ?auto_909767 ) ) ( not ( = ?auto_909763 ?auto_909764 ) ) ( not ( = ?auto_909763 ?auto_909765 ) ) ( not ( = ?auto_909763 ?auto_909766 ) ) ( not ( = ?auto_909763 ?auto_909767 ) ) ( not ( = ?auto_909764 ?auto_909765 ) ) ( not ( = ?auto_909764 ?auto_909766 ) ) ( not ( = ?auto_909764 ?auto_909767 ) ) ( not ( = ?auto_909765 ?auto_909766 ) ) ( not ( = ?auto_909765 ?auto_909767 ) ) ( not ( = ?auto_909766 ?auto_909767 ) ) ( ON ?auto_909765 ?auto_909766 ) ( ON ?auto_909764 ?auto_909765 ) ( CLEAR ?auto_909762 ) ( ON ?auto_909763 ?auto_909764 ) ( CLEAR ?auto_909763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_909754 ?auto_909755 ?auto_909756 ?auto_909757 ?auto_909758 ?auto_909759 ?auto_909760 ?auto_909761 ?auto_909762 ?auto_909763 )
      ( MAKE-13PILE ?auto_909754 ?auto_909755 ?auto_909756 ?auto_909757 ?auto_909758 ?auto_909759 ?auto_909760 ?auto_909761 ?auto_909762 ?auto_909763 ?auto_909764 ?auto_909765 ?auto_909766 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909808 - BLOCK
      ?auto_909809 - BLOCK
      ?auto_909810 - BLOCK
      ?auto_909811 - BLOCK
      ?auto_909812 - BLOCK
      ?auto_909813 - BLOCK
      ?auto_909814 - BLOCK
      ?auto_909815 - BLOCK
      ?auto_909816 - BLOCK
      ?auto_909817 - BLOCK
      ?auto_909818 - BLOCK
      ?auto_909819 - BLOCK
      ?auto_909820 - BLOCK
    )
    :vars
    (
      ?auto_909821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909820 ?auto_909821 ) ( ON-TABLE ?auto_909808 ) ( ON ?auto_909809 ?auto_909808 ) ( ON ?auto_909810 ?auto_909809 ) ( ON ?auto_909811 ?auto_909810 ) ( ON ?auto_909812 ?auto_909811 ) ( ON ?auto_909813 ?auto_909812 ) ( ON ?auto_909814 ?auto_909813 ) ( ON ?auto_909815 ?auto_909814 ) ( not ( = ?auto_909808 ?auto_909809 ) ) ( not ( = ?auto_909808 ?auto_909810 ) ) ( not ( = ?auto_909808 ?auto_909811 ) ) ( not ( = ?auto_909808 ?auto_909812 ) ) ( not ( = ?auto_909808 ?auto_909813 ) ) ( not ( = ?auto_909808 ?auto_909814 ) ) ( not ( = ?auto_909808 ?auto_909815 ) ) ( not ( = ?auto_909808 ?auto_909816 ) ) ( not ( = ?auto_909808 ?auto_909817 ) ) ( not ( = ?auto_909808 ?auto_909818 ) ) ( not ( = ?auto_909808 ?auto_909819 ) ) ( not ( = ?auto_909808 ?auto_909820 ) ) ( not ( = ?auto_909808 ?auto_909821 ) ) ( not ( = ?auto_909809 ?auto_909810 ) ) ( not ( = ?auto_909809 ?auto_909811 ) ) ( not ( = ?auto_909809 ?auto_909812 ) ) ( not ( = ?auto_909809 ?auto_909813 ) ) ( not ( = ?auto_909809 ?auto_909814 ) ) ( not ( = ?auto_909809 ?auto_909815 ) ) ( not ( = ?auto_909809 ?auto_909816 ) ) ( not ( = ?auto_909809 ?auto_909817 ) ) ( not ( = ?auto_909809 ?auto_909818 ) ) ( not ( = ?auto_909809 ?auto_909819 ) ) ( not ( = ?auto_909809 ?auto_909820 ) ) ( not ( = ?auto_909809 ?auto_909821 ) ) ( not ( = ?auto_909810 ?auto_909811 ) ) ( not ( = ?auto_909810 ?auto_909812 ) ) ( not ( = ?auto_909810 ?auto_909813 ) ) ( not ( = ?auto_909810 ?auto_909814 ) ) ( not ( = ?auto_909810 ?auto_909815 ) ) ( not ( = ?auto_909810 ?auto_909816 ) ) ( not ( = ?auto_909810 ?auto_909817 ) ) ( not ( = ?auto_909810 ?auto_909818 ) ) ( not ( = ?auto_909810 ?auto_909819 ) ) ( not ( = ?auto_909810 ?auto_909820 ) ) ( not ( = ?auto_909810 ?auto_909821 ) ) ( not ( = ?auto_909811 ?auto_909812 ) ) ( not ( = ?auto_909811 ?auto_909813 ) ) ( not ( = ?auto_909811 ?auto_909814 ) ) ( not ( = ?auto_909811 ?auto_909815 ) ) ( not ( = ?auto_909811 ?auto_909816 ) ) ( not ( = ?auto_909811 ?auto_909817 ) ) ( not ( = ?auto_909811 ?auto_909818 ) ) ( not ( = ?auto_909811 ?auto_909819 ) ) ( not ( = ?auto_909811 ?auto_909820 ) ) ( not ( = ?auto_909811 ?auto_909821 ) ) ( not ( = ?auto_909812 ?auto_909813 ) ) ( not ( = ?auto_909812 ?auto_909814 ) ) ( not ( = ?auto_909812 ?auto_909815 ) ) ( not ( = ?auto_909812 ?auto_909816 ) ) ( not ( = ?auto_909812 ?auto_909817 ) ) ( not ( = ?auto_909812 ?auto_909818 ) ) ( not ( = ?auto_909812 ?auto_909819 ) ) ( not ( = ?auto_909812 ?auto_909820 ) ) ( not ( = ?auto_909812 ?auto_909821 ) ) ( not ( = ?auto_909813 ?auto_909814 ) ) ( not ( = ?auto_909813 ?auto_909815 ) ) ( not ( = ?auto_909813 ?auto_909816 ) ) ( not ( = ?auto_909813 ?auto_909817 ) ) ( not ( = ?auto_909813 ?auto_909818 ) ) ( not ( = ?auto_909813 ?auto_909819 ) ) ( not ( = ?auto_909813 ?auto_909820 ) ) ( not ( = ?auto_909813 ?auto_909821 ) ) ( not ( = ?auto_909814 ?auto_909815 ) ) ( not ( = ?auto_909814 ?auto_909816 ) ) ( not ( = ?auto_909814 ?auto_909817 ) ) ( not ( = ?auto_909814 ?auto_909818 ) ) ( not ( = ?auto_909814 ?auto_909819 ) ) ( not ( = ?auto_909814 ?auto_909820 ) ) ( not ( = ?auto_909814 ?auto_909821 ) ) ( not ( = ?auto_909815 ?auto_909816 ) ) ( not ( = ?auto_909815 ?auto_909817 ) ) ( not ( = ?auto_909815 ?auto_909818 ) ) ( not ( = ?auto_909815 ?auto_909819 ) ) ( not ( = ?auto_909815 ?auto_909820 ) ) ( not ( = ?auto_909815 ?auto_909821 ) ) ( not ( = ?auto_909816 ?auto_909817 ) ) ( not ( = ?auto_909816 ?auto_909818 ) ) ( not ( = ?auto_909816 ?auto_909819 ) ) ( not ( = ?auto_909816 ?auto_909820 ) ) ( not ( = ?auto_909816 ?auto_909821 ) ) ( not ( = ?auto_909817 ?auto_909818 ) ) ( not ( = ?auto_909817 ?auto_909819 ) ) ( not ( = ?auto_909817 ?auto_909820 ) ) ( not ( = ?auto_909817 ?auto_909821 ) ) ( not ( = ?auto_909818 ?auto_909819 ) ) ( not ( = ?auto_909818 ?auto_909820 ) ) ( not ( = ?auto_909818 ?auto_909821 ) ) ( not ( = ?auto_909819 ?auto_909820 ) ) ( not ( = ?auto_909819 ?auto_909821 ) ) ( not ( = ?auto_909820 ?auto_909821 ) ) ( ON ?auto_909819 ?auto_909820 ) ( ON ?auto_909818 ?auto_909819 ) ( ON ?auto_909817 ?auto_909818 ) ( CLEAR ?auto_909815 ) ( ON ?auto_909816 ?auto_909817 ) ( CLEAR ?auto_909816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_909808 ?auto_909809 ?auto_909810 ?auto_909811 ?auto_909812 ?auto_909813 ?auto_909814 ?auto_909815 ?auto_909816 )
      ( MAKE-13PILE ?auto_909808 ?auto_909809 ?auto_909810 ?auto_909811 ?auto_909812 ?auto_909813 ?auto_909814 ?auto_909815 ?auto_909816 ?auto_909817 ?auto_909818 ?auto_909819 ?auto_909820 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909862 - BLOCK
      ?auto_909863 - BLOCK
      ?auto_909864 - BLOCK
      ?auto_909865 - BLOCK
      ?auto_909866 - BLOCK
      ?auto_909867 - BLOCK
      ?auto_909868 - BLOCK
      ?auto_909869 - BLOCK
      ?auto_909870 - BLOCK
      ?auto_909871 - BLOCK
      ?auto_909872 - BLOCK
      ?auto_909873 - BLOCK
      ?auto_909874 - BLOCK
    )
    :vars
    (
      ?auto_909875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909874 ?auto_909875 ) ( ON-TABLE ?auto_909862 ) ( ON ?auto_909863 ?auto_909862 ) ( ON ?auto_909864 ?auto_909863 ) ( ON ?auto_909865 ?auto_909864 ) ( ON ?auto_909866 ?auto_909865 ) ( ON ?auto_909867 ?auto_909866 ) ( ON ?auto_909868 ?auto_909867 ) ( not ( = ?auto_909862 ?auto_909863 ) ) ( not ( = ?auto_909862 ?auto_909864 ) ) ( not ( = ?auto_909862 ?auto_909865 ) ) ( not ( = ?auto_909862 ?auto_909866 ) ) ( not ( = ?auto_909862 ?auto_909867 ) ) ( not ( = ?auto_909862 ?auto_909868 ) ) ( not ( = ?auto_909862 ?auto_909869 ) ) ( not ( = ?auto_909862 ?auto_909870 ) ) ( not ( = ?auto_909862 ?auto_909871 ) ) ( not ( = ?auto_909862 ?auto_909872 ) ) ( not ( = ?auto_909862 ?auto_909873 ) ) ( not ( = ?auto_909862 ?auto_909874 ) ) ( not ( = ?auto_909862 ?auto_909875 ) ) ( not ( = ?auto_909863 ?auto_909864 ) ) ( not ( = ?auto_909863 ?auto_909865 ) ) ( not ( = ?auto_909863 ?auto_909866 ) ) ( not ( = ?auto_909863 ?auto_909867 ) ) ( not ( = ?auto_909863 ?auto_909868 ) ) ( not ( = ?auto_909863 ?auto_909869 ) ) ( not ( = ?auto_909863 ?auto_909870 ) ) ( not ( = ?auto_909863 ?auto_909871 ) ) ( not ( = ?auto_909863 ?auto_909872 ) ) ( not ( = ?auto_909863 ?auto_909873 ) ) ( not ( = ?auto_909863 ?auto_909874 ) ) ( not ( = ?auto_909863 ?auto_909875 ) ) ( not ( = ?auto_909864 ?auto_909865 ) ) ( not ( = ?auto_909864 ?auto_909866 ) ) ( not ( = ?auto_909864 ?auto_909867 ) ) ( not ( = ?auto_909864 ?auto_909868 ) ) ( not ( = ?auto_909864 ?auto_909869 ) ) ( not ( = ?auto_909864 ?auto_909870 ) ) ( not ( = ?auto_909864 ?auto_909871 ) ) ( not ( = ?auto_909864 ?auto_909872 ) ) ( not ( = ?auto_909864 ?auto_909873 ) ) ( not ( = ?auto_909864 ?auto_909874 ) ) ( not ( = ?auto_909864 ?auto_909875 ) ) ( not ( = ?auto_909865 ?auto_909866 ) ) ( not ( = ?auto_909865 ?auto_909867 ) ) ( not ( = ?auto_909865 ?auto_909868 ) ) ( not ( = ?auto_909865 ?auto_909869 ) ) ( not ( = ?auto_909865 ?auto_909870 ) ) ( not ( = ?auto_909865 ?auto_909871 ) ) ( not ( = ?auto_909865 ?auto_909872 ) ) ( not ( = ?auto_909865 ?auto_909873 ) ) ( not ( = ?auto_909865 ?auto_909874 ) ) ( not ( = ?auto_909865 ?auto_909875 ) ) ( not ( = ?auto_909866 ?auto_909867 ) ) ( not ( = ?auto_909866 ?auto_909868 ) ) ( not ( = ?auto_909866 ?auto_909869 ) ) ( not ( = ?auto_909866 ?auto_909870 ) ) ( not ( = ?auto_909866 ?auto_909871 ) ) ( not ( = ?auto_909866 ?auto_909872 ) ) ( not ( = ?auto_909866 ?auto_909873 ) ) ( not ( = ?auto_909866 ?auto_909874 ) ) ( not ( = ?auto_909866 ?auto_909875 ) ) ( not ( = ?auto_909867 ?auto_909868 ) ) ( not ( = ?auto_909867 ?auto_909869 ) ) ( not ( = ?auto_909867 ?auto_909870 ) ) ( not ( = ?auto_909867 ?auto_909871 ) ) ( not ( = ?auto_909867 ?auto_909872 ) ) ( not ( = ?auto_909867 ?auto_909873 ) ) ( not ( = ?auto_909867 ?auto_909874 ) ) ( not ( = ?auto_909867 ?auto_909875 ) ) ( not ( = ?auto_909868 ?auto_909869 ) ) ( not ( = ?auto_909868 ?auto_909870 ) ) ( not ( = ?auto_909868 ?auto_909871 ) ) ( not ( = ?auto_909868 ?auto_909872 ) ) ( not ( = ?auto_909868 ?auto_909873 ) ) ( not ( = ?auto_909868 ?auto_909874 ) ) ( not ( = ?auto_909868 ?auto_909875 ) ) ( not ( = ?auto_909869 ?auto_909870 ) ) ( not ( = ?auto_909869 ?auto_909871 ) ) ( not ( = ?auto_909869 ?auto_909872 ) ) ( not ( = ?auto_909869 ?auto_909873 ) ) ( not ( = ?auto_909869 ?auto_909874 ) ) ( not ( = ?auto_909869 ?auto_909875 ) ) ( not ( = ?auto_909870 ?auto_909871 ) ) ( not ( = ?auto_909870 ?auto_909872 ) ) ( not ( = ?auto_909870 ?auto_909873 ) ) ( not ( = ?auto_909870 ?auto_909874 ) ) ( not ( = ?auto_909870 ?auto_909875 ) ) ( not ( = ?auto_909871 ?auto_909872 ) ) ( not ( = ?auto_909871 ?auto_909873 ) ) ( not ( = ?auto_909871 ?auto_909874 ) ) ( not ( = ?auto_909871 ?auto_909875 ) ) ( not ( = ?auto_909872 ?auto_909873 ) ) ( not ( = ?auto_909872 ?auto_909874 ) ) ( not ( = ?auto_909872 ?auto_909875 ) ) ( not ( = ?auto_909873 ?auto_909874 ) ) ( not ( = ?auto_909873 ?auto_909875 ) ) ( not ( = ?auto_909874 ?auto_909875 ) ) ( ON ?auto_909873 ?auto_909874 ) ( ON ?auto_909872 ?auto_909873 ) ( ON ?auto_909871 ?auto_909872 ) ( ON ?auto_909870 ?auto_909871 ) ( CLEAR ?auto_909868 ) ( ON ?auto_909869 ?auto_909870 ) ( CLEAR ?auto_909869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_909862 ?auto_909863 ?auto_909864 ?auto_909865 ?auto_909866 ?auto_909867 ?auto_909868 ?auto_909869 )
      ( MAKE-13PILE ?auto_909862 ?auto_909863 ?auto_909864 ?auto_909865 ?auto_909866 ?auto_909867 ?auto_909868 ?auto_909869 ?auto_909870 ?auto_909871 ?auto_909872 ?auto_909873 ?auto_909874 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909916 - BLOCK
      ?auto_909917 - BLOCK
      ?auto_909918 - BLOCK
      ?auto_909919 - BLOCK
      ?auto_909920 - BLOCK
      ?auto_909921 - BLOCK
      ?auto_909922 - BLOCK
      ?auto_909923 - BLOCK
      ?auto_909924 - BLOCK
      ?auto_909925 - BLOCK
      ?auto_909926 - BLOCK
      ?auto_909927 - BLOCK
      ?auto_909928 - BLOCK
    )
    :vars
    (
      ?auto_909929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909928 ?auto_909929 ) ( ON-TABLE ?auto_909916 ) ( ON ?auto_909917 ?auto_909916 ) ( ON ?auto_909918 ?auto_909917 ) ( ON ?auto_909919 ?auto_909918 ) ( ON ?auto_909920 ?auto_909919 ) ( ON ?auto_909921 ?auto_909920 ) ( not ( = ?auto_909916 ?auto_909917 ) ) ( not ( = ?auto_909916 ?auto_909918 ) ) ( not ( = ?auto_909916 ?auto_909919 ) ) ( not ( = ?auto_909916 ?auto_909920 ) ) ( not ( = ?auto_909916 ?auto_909921 ) ) ( not ( = ?auto_909916 ?auto_909922 ) ) ( not ( = ?auto_909916 ?auto_909923 ) ) ( not ( = ?auto_909916 ?auto_909924 ) ) ( not ( = ?auto_909916 ?auto_909925 ) ) ( not ( = ?auto_909916 ?auto_909926 ) ) ( not ( = ?auto_909916 ?auto_909927 ) ) ( not ( = ?auto_909916 ?auto_909928 ) ) ( not ( = ?auto_909916 ?auto_909929 ) ) ( not ( = ?auto_909917 ?auto_909918 ) ) ( not ( = ?auto_909917 ?auto_909919 ) ) ( not ( = ?auto_909917 ?auto_909920 ) ) ( not ( = ?auto_909917 ?auto_909921 ) ) ( not ( = ?auto_909917 ?auto_909922 ) ) ( not ( = ?auto_909917 ?auto_909923 ) ) ( not ( = ?auto_909917 ?auto_909924 ) ) ( not ( = ?auto_909917 ?auto_909925 ) ) ( not ( = ?auto_909917 ?auto_909926 ) ) ( not ( = ?auto_909917 ?auto_909927 ) ) ( not ( = ?auto_909917 ?auto_909928 ) ) ( not ( = ?auto_909917 ?auto_909929 ) ) ( not ( = ?auto_909918 ?auto_909919 ) ) ( not ( = ?auto_909918 ?auto_909920 ) ) ( not ( = ?auto_909918 ?auto_909921 ) ) ( not ( = ?auto_909918 ?auto_909922 ) ) ( not ( = ?auto_909918 ?auto_909923 ) ) ( not ( = ?auto_909918 ?auto_909924 ) ) ( not ( = ?auto_909918 ?auto_909925 ) ) ( not ( = ?auto_909918 ?auto_909926 ) ) ( not ( = ?auto_909918 ?auto_909927 ) ) ( not ( = ?auto_909918 ?auto_909928 ) ) ( not ( = ?auto_909918 ?auto_909929 ) ) ( not ( = ?auto_909919 ?auto_909920 ) ) ( not ( = ?auto_909919 ?auto_909921 ) ) ( not ( = ?auto_909919 ?auto_909922 ) ) ( not ( = ?auto_909919 ?auto_909923 ) ) ( not ( = ?auto_909919 ?auto_909924 ) ) ( not ( = ?auto_909919 ?auto_909925 ) ) ( not ( = ?auto_909919 ?auto_909926 ) ) ( not ( = ?auto_909919 ?auto_909927 ) ) ( not ( = ?auto_909919 ?auto_909928 ) ) ( not ( = ?auto_909919 ?auto_909929 ) ) ( not ( = ?auto_909920 ?auto_909921 ) ) ( not ( = ?auto_909920 ?auto_909922 ) ) ( not ( = ?auto_909920 ?auto_909923 ) ) ( not ( = ?auto_909920 ?auto_909924 ) ) ( not ( = ?auto_909920 ?auto_909925 ) ) ( not ( = ?auto_909920 ?auto_909926 ) ) ( not ( = ?auto_909920 ?auto_909927 ) ) ( not ( = ?auto_909920 ?auto_909928 ) ) ( not ( = ?auto_909920 ?auto_909929 ) ) ( not ( = ?auto_909921 ?auto_909922 ) ) ( not ( = ?auto_909921 ?auto_909923 ) ) ( not ( = ?auto_909921 ?auto_909924 ) ) ( not ( = ?auto_909921 ?auto_909925 ) ) ( not ( = ?auto_909921 ?auto_909926 ) ) ( not ( = ?auto_909921 ?auto_909927 ) ) ( not ( = ?auto_909921 ?auto_909928 ) ) ( not ( = ?auto_909921 ?auto_909929 ) ) ( not ( = ?auto_909922 ?auto_909923 ) ) ( not ( = ?auto_909922 ?auto_909924 ) ) ( not ( = ?auto_909922 ?auto_909925 ) ) ( not ( = ?auto_909922 ?auto_909926 ) ) ( not ( = ?auto_909922 ?auto_909927 ) ) ( not ( = ?auto_909922 ?auto_909928 ) ) ( not ( = ?auto_909922 ?auto_909929 ) ) ( not ( = ?auto_909923 ?auto_909924 ) ) ( not ( = ?auto_909923 ?auto_909925 ) ) ( not ( = ?auto_909923 ?auto_909926 ) ) ( not ( = ?auto_909923 ?auto_909927 ) ) ( not ( = ?auto_909923 ?auto_909928 ) ) ( not ( = ?auto_909923 ?auto_909929 ) ) ( not ( = ?auto_909924 ?auto_909925 ) ) ( not ( = ?auto_909924 ?auto_909926 ) ) ( not ( = ?auto_909924 ?auto_909927 ) ) ( not ( = ?auto_909924 ?auto_909928 ) ) ( not ( = ?auto_909924 ?auto_909929 ) ) ( not ( = ?auto_909925 ?auto_909926 ) ) ( not ( = ?auto_909925 ?auto_909927 ) ) ( not ( = ?auto_909925 ?auto_909928 ) ) ( not ( = ?auto_909925 ?auto_909929 ) ) ( not ( = ?auto_909926 ?auto_909927 ) ) ( not ( = ?auto_909926 ?auto_909928 ) ) ( not ( = ?auto_909926 ?auto_909929 ) ) ( not ( = ?auto_909927 ?auto_909928 ) ) ( not ( = ?auto_909927 ?auto_909929 ) ) ( not ( = ?auto_909928 ?auto_909929 ) ) ( ON ?auto_909927 ?auto_909928 ) ( ON ?auto_909926 ?auto_909927 ) ( ON ?auto_909925 ?auto_909926 ) ( ON ?auto_909924 ?auto_909925 ) ( ON ?auto_909923 ?auto_909924 ) ( CLEAR ?auto_909921 ) ( ON ?auto_909922 ?auto_909923 ) ( CLEAR ?auto_909922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_909916 ?auto_909917 ?auto_909918 ?auto_909919 ?auto_909920 ?auto_909921 ?auto_909922 )
      ( MAKE-13PILE ?auto_909916 ?auto_909917 ?auto_909918 ?auto_909919 ?auto_909920 ?auto_909921 ?auto_909922 ?auto_909923 ?auto_909924 ?auto_909925 ?auto_909926 ?auto_909927 ?auto_909928 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_909970 - BLOCK
      ?auto_909971 - BLOCK
      ?auto_909972 - BLOCK
      ?auto_909973 - BLOCK
      ?auto_909974 - BLOCK
      ?auto_909975 - BLOCK
      ?auto_909976 - BLOCK
      ?auto_909977 - BLOCK
      ?auto_909978 - BLOCK
      ?auto_909979 - BLOCK
      ?auto_909980 - BLOCK
      ?auto_909981 - BLOCK
      ?auto_909982 - BLOCK
    )
    :vars
    (
      ?auto_909983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_909982 ?auto_909983 ) ( ON-TABLE ?auto_909970 ) ( ON ?auto_909971 ?auto_909970 ) ( ON ?auto_909972 ?auto_909971 ) ( ON ?auto_909973 ?auto_909972 ) ( ON ?auto_909974 ?auto_909973 ) ( not ( = ?auto_909970 ?auto_909971 ) ) ( not ( = ?auto_909970 ?auto_909972 ) ) ( not ( = ?auto_909970 ?auto_909973 ) ) ( not ( = ?auto_909970 ?auto_909974 ) ) ( not ( = ?auto_909970 ?auto_909975 ) ) ( not ( = ?auto_909970 ?auto_909976 ) ) ( not ( = ?auto_909970 ?auto_909977 ) ) ( not ( = ?auto_909970 ?auto_909978 ) ) ( not ( = ?auto_909970 ?auto_909979 ) ) ( not ( = ?auto_909970 ?auto_909980 ) ) ( not ( = ?auto_909970 ?auto_909981 ) ) ( not ( = ?auto_909970 ?auto_909982 ) ) ( not ( = ?auto_909970 ?auto_909983 ) ) ( not ( = ?auto_909971 ?auto_909972 ) ) ( not ( = ?auto_909971 ?auto_909973 ) ) ( not ( = ?auto_909971 ?auto_909974 ) ) ( not ( = ?auto_909971 ?auto_909975 ) ) ( not ( = ?auto_909971 ?auto_909976 ) ) ( not ( = ?auto_909971 ?auto_909977 ) ) ( not ( = ?auto_909971 ?auto_909978 ) ) ( not ( = ?auto_909971 ?auto_909979 ) ) ( not ( = ?auto_909971 ?auto_909980 ) ) ( not ( = ?auto_909971 ?auto_909981 ) ) ( not ( = ?auto_909971 ?auto_909982 ) ) ( not ( = ?auto_909971 ?auto_909983 ) ) ( not ( = ?auto_909972 ?auto_909973 ) ) ( not ( = ?auto_909972 ?auto_909974 ) ) ( not ( = ?auto_909972 ?auto_909975 ) ) ( not ( = ?auto_909972 ?auto_909976 ) ) ( not ( = ?auto_909972 ?auto_909977 ) ) ( not ( = ?auto_909972 ?auto_909978 ) ) ( not ( = ?auto_909972 ?auto_909979 ) ) ( not ( = ?auto_909972 ?auto_909980 ) ) ( not ( = ?auto_909972 ?auto_909981 ) ) ( not ( = ?auto_909972 ?auto_909982 ) ) ( not ( = ?auto_909972 ?auto_909983 ) ) ( not ( = ?auto_909973 ?auto_909974 ) ) ( not ( = ?auto_909973 ?auto_909975 ) ) ( not ( = ?auto_909973 ?auto_909976 ) ) ( not ( = ?auto_909973 ?auto_909977 ) ) ( not ( = ?auto_909973 ?auto_909978 ) ) ( not ( = ?auto_909973 ?auto_909979 ) ) ( not ( = ?auto_909973 ?auto_909980 ) ) ( not ( = ?auto_909973 ?auto_909981 ) ) ( not ( = ?auto_909973 ?auto_909982 ) ) ( not ( = ?auto_909973 ?auto_909983 ) ) ( not ( = ?auto_909974 ?auto_909975 ) ) ( not ( = ?auto_909974 ?auto_909976 ) ) ( not ( = ?auto_909974 ?auto_909977 ) ) ( not ( = ?auto_909974 ?auto_909978 ) ) ( not ( = ?auto_909974 ?auto_909979 ) ) ( not ( = ?auto_909974 ?auto_909980 ) ) ( not ( = ?auto_909974 ?auto_909981 ) ) ( not ( = ?auto_909974 ?auto_909982 ) ) ( not ( = ?auto_909974 ?auto_909983 ) ) ( not ( = ?auto_909975 ?auto_909976 ) ) ( not ( = ?auto_909975 ?auto_909977 ) ) ( not ( = ?auto_909975 ?auto_909978 ) ) ( not ( = ?auto_909975 ?auto_909979 ) ) ( not ( = ?auto_909975 ?auto_909980 ) ) ( not ( = ?auto_909975 ?auto_909981 ) ) ( not ( = ?auto_909975 ?auto_909982 ) ) ( not ( = ?auto_909975 ?auto_909983 ) ) ( not ( = ?auto_909976 ?auto_909977 ) ) ( not ( = ?auto_909976 ?auto_909978 ) ) ( not ( = ?auto_909976 ?auto_909979 ) ) ( not ( = ?auto_909976 ?auto_909980 ) ) ( not ( = ?auto_909976 ?auto_909981 ) ) ( not ( = ?auto_909976 ?auto_909982 ) ) ( not ( = ?auto_909976 ?auto_909983 ) ) ( not ( = ?auto_909977 ?auto_909978 ) ) ( not ( = ?auto_909977 ?auto_909979 ) ) ( not ( = ?auto_909977 ?auto_909980 ) ) ( not ( = ?auto_909977 ?auto_909981 ) ) ( not ( = ?auto_909977 ?auto_909982 ) ) ( not ( = ?auto_909977 ?auto_909983 ) ) ( not ( = ?auto_909978 ?auto_909979 ) ) ( not ( = ?auto_909978 ?auto_909980 ) ) ( not ( = ?auto_909978 ?auto_909981 ) ) ( not ( = ?auto_909978 ?auto_909982 ) ) ( not ( = ?auto_909978 ?auto_909983 ) ) ( not ( = ?auto_909979 ?auto_909980 ) ) ( not ( = ?auto_909979 ?auto_909981 ) ) ( not ( = ?auto_909979 ?auto_909982 ) ) ( not ( = ?auto_909979 ?auto_909983 ) ) ( not ( = ?auto_909980 ?auto_909981 ) ) ( not ( = ?auto_909980 ?auto_909982 ) ) ( not ( = ?auto_909980 ?auto_909983 ) ) ( not ( = ?auto_909981 ?auto_909982 ) ) ( not ( = ?auto_909981 ?auto_909983 ) ) ( not ( = ?auto_909982 ?auto_909983 ) ) ( ON ?auto_909981 ?auto_909982 ) ( ON ?auto_909980 ?auto_909981 ) ( ON ?auto_909979 ?auto_909980 ) ( ON ?auto_909978 ?auto_909979 ) ( ON ?auto_909977 ?auto_909978 ) ( ON ?auto_909976 ?auto_909977 ) ( CLEAR ?auto_909974 ) ( ON ?auto_909975 ?auto_909976 ) ( CLEAR ?auto_909975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_909970 ?auto_909971 ?auto_909972 ?auto_909973 ?auto_909974 ?auto_909975 )
      ( MAKE-13PILE ?auto_909970 ?auto_909971 ?auto_909972 ?auto_909973 ?auto_909974 ?auto_909975 ?auto_909976 ?auto_909977 ?auto_909978 ?auto_909979 ?auto_909980 ?auto_909981 ?auto_909982 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_910024 - BLOCK
      ?auto_910025 - BLOCK
      ?auto_910026 - BLOCK
      ?auto_910027 - BLOCK
      ?auto_910028 - BLOCK
      ?auto_910029 - BLOCK
      ?auto_910030 - BLOCK
      ?auto_910031 - BLOCK
      ?auto_910032 - BLOCK
      ?auto_910033 - BLOCK
      ?auto_910034 - BLOCK
      ?auto_910035 - BLOCK
      ?auto_910036 - BLOCK
    )
    :vars
    (
      ?auto_910037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910036 ?auto_910037 ) ( ON-TABLE ?auto_910024 ) ( ON ?auto_910025 ?auto_910024 ) ( ON ?auto_910026 ?auto_910025 ) ( ON ?auto_910027 ?auto_910026 ) ( not ( = ?auto_910024 ?auto_910025 ) ) ( not ( = ?auto_910024 ?auto_910026 ) ) ( not ( = ?auto_910024 ?auto_910027 ) ) ( not ( = ?auto_910024 ?auto_910028 ) ) ( not ( = ?auto_910024 ?auto_910029 ) ) ( not ( = ?auto_910024 ?auto_910030 ) ) ( not ( = ?auto_910024 ?auto_910031 ) ) ( not ( = ?auto_910024 ?auto_910032 ) ) ( not ( = ?auto_910024 ?auto_910033 ) ) ( not ( = ?auto_910024 ?auto_910034 ) ) ( not ( = ?auto_910024 ?auto_910035 ) ) ( not ( = ?auto_910024 ?auto_910036 ) ) ( not ( = ?auto_910024 ?auto_910037 ) ) ( not ( = ?auto_910025 ?auto_910026 ) ) ( not ( = ?auto_910025 ?auto_910027 ) ) ( not ( = ?auto_910025 ?auto_910028 ) ) ( not ( = ?auto_910025 ?auto_910029 ) ) ( not ( = ?auto_910025 ?auto_910030 ) ) ( not ( = ?auto_910025 ?auto_910031 ) ) ( not ( = ?auto_910025 ?auto_910032 ) ) ( not ( = ?auto_910025 ?auto_910033 ) ) ( not ( = ?auto_910025 ?auto_910034 ) ) ( not ( = ?auto_910025 ?auto_910035 ) ) ( not ( = ?auto_910025 ?auto_910036 ) ) ( not ( = ?auto_910025 ?auto_910037 ) ) ( not ( = ?auto_910026 ?auto_910027 ) ) ( not ( = ?auto_910026 ?auto_910028 ) ) ( not ( = ?auto_910026 ?auto_910029 ) ) ( not ( = ?auto_910026 ?auto_910030 ) ) ( not ( = ?auto_910026 ?auto_910031 ) ) ( not ( = ?auto_910026 ?auto_910032 ) ) ( not ( = ?auto_910026 ?auto_910033 ) ) ( not ( = ?auto_910026 ?auto_910034 ) ) ( not ( = ?auto_910026 ?auto_910035 ) ) ( not ( = ?auto_910026 ?auto_910036 ) ) ( not ( = ?auto_910026 ?auto_910037 ) ) ( not ( = ?auto_910027 ?auto_910028 ) ) ( not ( = ?auto_910027 ?auto_910029 ) ) ( not ( = ?auto_910027 ?auto_910030 ) ) ( not ( = ?auto_910027 ?auto_910031 ) ) ( not ( = ?auto_910027 ?auto_910032 ) ) ( not ( = ?auto_910027 ?auto_910033 ) ) ( not ( = ?auto_910027 ?auto_910034 ) ) ( not ( = ?auto_910027 ?auto_910035 ) ) ( not ( = ?auto_910027 ?auto_910036 ) ) ( not ( = ?auto_910027 ?auto_910037 ) ) ( not ( = ?auto_910028 ?auto_910029 ) ) ( not ( = ?auto_910028 ?auto_910030 ) ) ( not ( = ?auto_910028 ?auto_910031 ) ) ( not ( = ?auto_910028 ?auto_910032 ) ) ( not ( = ?auto_910028 ?auto_910033 ) ) ( not ( = ?auto_910028 ?auto_910034 ) ) ( not ( = ?auto_910028 ?auto_910035 ) ) ( not ( = ?auto_910028 ?auto_910036 ) ) ( not ( = ?auto_910028 ?auto_910037 ) ) ( not ( = ?auto_910029 ?auto_910030 ) ) ( not ( = ?auto_910029 ?auto_910031 ) ) ( not ( = ?auto_910029 ?auto_910032 ) ) ( not ( = ?auto_910029 ?auto_910033 ) ) ( not ( = ?auto_910029 ?auto_910034 ) ) ( not ( = ?auto_910029 ?auto_910035 ) ) ( not ( = ?auto_910029 ?auto_910036 ) ) ( not ( = ?auto_910029 ?auto_910037 ) ) ( not ( = ?auto_910030 ?auto_910031 ) ) ( not ( = ?auto_910030 ?auto_910032 ) ) ( not ( = ?auto_910030 ?auto_910033 ) ) ( not ( = ?auto_910030 ?auto_910034 ) ) ( not ( = ?auto_910030 ?auto_910035 ) ) ( not ( = ?auto_910030 ?auto_910036 ) ) ( not ( = ?auto_910030 ?auto_910037 ) ) ( not ( = ?auto_910031 ?auto_910032 ) ) ( not ( = ?auto_910031 ?auto_910033 ) ) ( not ( = ?auto_910031 ?auto_910034 ) ) ( not ( = ?auto_910031 ?auto_910035 ) ) ( not ( = ?auto_910031 ?auto_910036 ) ) ( not ( = ?auto_910031 ?auto_910037 ) ) ( not ( = ?auto_910032 ?auto_910033 ) ) ( not ( = ?auto_910032 ?auto_910034 ) ) ( not ( = ?auto_910032 ?auto_910035 ) ) ( not ( = ?auto_910032 ?auto_910036 ) ) ( not ( = ?auto_910032 ?auto_910037 ) ) ( not ( = ?auto_910033 ?auto_910034 ) ) ( not ( = ?auto_910033 ?auto_910035 ) ) ( not ( = ?auto_910033 ?auto_910036 ) ) ( not ( = ?auto_910033 ?auto_910037 ) ) ( not ( = ?auto_910034 ?auto_910035 ) ) ( not ( = ?auto_910034 ?auto_910036 ) ) ( not ( = ?auto_910034 ?auto_910037 ) ) ( not ( = ?auto_910035 ?auto_910036 ) ) ( not ( = ?auto_910035 ?auto_910037 ) ) ( not ( = ?auto_910036 ?auto_910037 ) ) ( ON ?auto_910035 ?auto_910036 ) ( ON ?auto_910034 ?auto_910035 ) ( ON ?auto_910033 ?auto_910034 ) ( ON ?auto_910032 ?auto_910033 ) ( ON ?auto_910031 ?auto_910032 ) ( ON ?auto_910030 ?auto_910031 ) ( ON ?auto_910029 ?auto_910030 ) ( CLEAR ?auto_910027 ) ( ON ?auto_910028 ?auto_910029 ) ( CLEAR ?auto_910028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_910024 ?auto_910025 ?auto_910026 ?auto_910027 ?auto_910028 )
      ( MAKE-13PILE ?auto_910024 ?auto_910025 ?auto_910026 ?auto_910027 ?auto_910028 ?auto_910029 ?auto_910030 ?auto_910031 ?auto_910032 ?auto_910033 ?auto_910034 ?auto_910035 ?auto_910036 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_910078 - BLOCK
      ?auto_910079 - BLOCK
      ?auto_910080 - BLOCK
      ?auto_910081 - BLOCK
      ?auto_910082 - BLOCK
      ?auto_910083 - BLOCK
      ?auto_910084 - BLOCK
      ?auto_910085 - BLOCK
      ?auto_910086 - BLOCK
      ?auto_910087 - BLOCK
      ?auto_910088 - BLOCK
      ?auto_910089 - BLOCK
      ?auto_910090 - BLOCK
    )
    :vars
    (
      ?auto_910091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910090 ?auto_910091 ) ( ON-TABLE ?auto_910078 ) ( ON ?auto_910079 ?auto_910078 ) ( ON ?auto_910080 ?auto_910079 ) ( not ( = ?auto_910078 ?auto_910079 ) ) ( not ( = ?auto_910078 ?auto_910080 ) ) ( not ( = ?auto_910078 ?auto_910081 ) ) ( not ( = ?auto_910078 ?auto_910082 ) ) ( not ( = ?auto_910078 ?auto_910083 ) ) ( not ( = ?auto_910078 ?auto_910084 ) ) ( not ( = ?auto_910078 ?auto_910085 ) ) ( not ( = ?auto_910078 ?auto_910086 ) ) ( not ( = ?auto_910078 ?auto_910087 ) ) ( not ( = ?auto_910078 ?auto_910088 ) ) ( not ( = ?auto_910078 ?auto_910089 ) ) ( not ( = ?auto_910078 ?auto_910090 ) ) ( not ( = ?auto_910078 ?auto_910091 ) ) ( not ( = ?auto_910079 ?auto_910080 ) ) ( not ( = ?auto_910079 ?auto_910081 ) ) ( not ( = ?auto_910079 ?auto_910082 ) ) ( not ( = ?auto_910079 ?auto_910083 ) ) ( not ( = ?auto_910079 ?auto_910084 ) ) ( not ( = ?auto_910079 ?auto_910085 ) ) ( not ( = ?auto_910079 ?auto_910086 ) ) ( not ( = ?auto_910079 ?auto_910087 ) ) ( not ( = ?auto_910079 ?auto_910088 ) ) ( not ( = ?auto_910079 ?auto_910089 ) ) ( not ( = ?auto_910079 ?auto_910090 ) ) ( not ( = ?auto_910079 ?auto_910091 ) ) ( not ( = ?auto_910080 ?auto_910081 ) ) ( not ( = ?auto_910080 ?auto_910082 ) ) ( not ( = ?auto_910080 ?auto_910083 ) ) ( not ( = ?auto_910080 ?auto_910084 ) ) ( not ( = ?auto_910080 ?auto_910085 ) ) ( not ( = ?auto_910080 ?auto_910086 ) ) ( not ( = ?auto_910080 ?auto_910087 ) ) ( not ( = ?auto_910080 ?auto_910088 ) ) ( not ( = ?auto_910080 ?auto_910089 ) ) ( not ( = ?auto_910080 ?auto_910090 ) ) ( not ( = ?auto_910080 ?auto_910091 ) ) ( not ( = ?auto_910081 ?auto_910082 ) ) ( not ( = ?auto_910081 ?auto_910083 ) ) ( not ( = ?auto_910081 ?auto_910084 ) ) ( not ( = ?auto_910081 ?auto_910085 ) ) ( not ( = ?auto_910081 ?auto_910086 ) ) ( not ( = ?auto_910081 ?auto_910087 ) ) ( not ( = ?auto_910081 ?auto_910088 ) ) ( not ( = ?auto_910081 ?auto_910089 ) ) ( not ( = ?auto_910081 ?auto_910090 ) ) ( not ( = ?auto_910081 ?auto_910091 ) ) ( not ( = ?auto_910082 ?auto_910083 ) ) ( not ( = ?auto_910082 ?auto_910084 ) ) ( not ( = ?auto_910082 ?auto_910085 ) ) ( not ( = ?auto_910082 ?auto_910086 ) ) ( not ( = ?auto_910082 ?auto_910087 ) ) ( not ( = ?auto_910082 ?auto_910088 ) ) ( not ( = ?auto_910082 ?auto_910089 ) ) ( not ( = ?auto_910082 ?auto_910090 ) ) ( not ( = ?auto_910082 ?auto_910091 ) ) ( not ( = ?auto_910083 ?auto_910084 ) ) ( not ( = ?auto_910083 ?auto_910085 ) ) ( not ( = ?auto_910083 ?auto_910086 ) ) ( not ( = ?auto_910083 ?auto_910087 ) ) ( not ( = ?auto_910083 ?auto_910088 ) ) ( not ( = ?auto_910083 ?auto_910089 ) ) ( not ( = ?auto_910083 ?auto_910090 ) ) ( not ( = ?auto_910083 ?auto_910091 ) ) ( not ( = ?auto_910084 ?auto_910085 ) ) ( not ( = ?auto_910084 ?auto_910086 ) ) ( not ( = ?auto_910084 ?auto_910087 ) ) ( not ( = ?auto_910084 ?auto_910088 ) ) ( not ( = ?auto_910084 ?auto_910089 ) ) ( not ( = ?auto_910084 ?auto_910090 ) ) ( not ( = ?auto_910084 ?auto_910091 ) ) ( not ( = ?auto_910085 ?auto_910086 ) ) ( not ( = ?auto_910085 ?auto_910087 ) ) ( not ( = ?auto_910085 ?auto_910088 ) ) ( not ( = ?auto_910085 ?auto_910089 ) ) ( not ( = ?auto_910085 ?auto_910090 ) ) ( not ( = ?auto_910085 ?auto_910091 ) ) ( not ( = ?auto_910086 ?auto_910087 ) ) ( not ( = ?auto_910086 ?auto_910088 ) ) ( not ( = ?auto_910086 ?auto_910089 ) ) ( not ( = ?auto_910086 ?auto_910090 ) ) ( not ( = ?auto_910086 ?auto_910091 ) ) ( not ( = ?auto_910087 ?auto_910088 ) ) ( not ( = ?auto_910087 ?auto_910089 ) ) ( not ( = ?auto_910087 ?auto_910090 ) ) ( not ( = ?auto_910087 ?auto_910091 ) ) ( not ( = ?auto_910088 ?auto_910089 ) ) ( not ( = ?auto_910088 ?auto_910090 ) ) ( not ( = ?auto_910088 ?auto_910091 ) ) ( not ( = ?auto_910089 ?auto_910090 ) ) ( not ( = ?auto_910089 ?auto_910091 ) ) ( not ( = ?auto_910090 ?auto_910091 ) ) ( ON ?auto_910089 ?auto_910090 ) ( ON ?auto_910088 ?auto_910089 ) ( ON ?auto_910087 ?auto_910088 ) ( ON ?auto_910086 ?auto_910087 ) ( ON ?auto_910085 ?auto_910086 ) ( ON ?auto_910084 ?auto_910085 ) ( ON ?auto_910083 ?auto_910084 ) ( ON ?auto_910082 ?auto_910083 ) ( CLEAR ?auto_910080 ) ( ON ?auto_910081 ?auto_910082 ) ( CLEAR ?auto_910081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_910078 ?auto_910079 ?auto_910080 ?auto_910081 )
      ( MAKE-13PILE ?auto_910078 ?auto_910079 ?auto_910080 ?auto_910081 ?auto_910082 ?auto_910083 ?auto_910084 ?auto_910085 ?auto_910086 ?auto_910087 ?auto_910088 ?auto_910089 ?auto_910090 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_910132 - BLOCK
      ?auto_910133 - BLOCK
      ?auto_910134 - BLOCK
      ?auto_910135 - BLOCK
      ?auto_910136 - BLOCK
      ?auto_910137 - BLOCK
      ?auto_910138 - BLOCK
      ?auto_910139 - BLOCK
      ?auto_910140 - BLOCK
      ?auto_910141 - BLOCK
      ?auto_910142 - BLOCK
      ?auto_910143 - BLOCK
      ?auto_910144 - BLOCK
    )
    :vars
    (
      ?auto_910145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910144 ?auto_910145 ) ( ON-TABLE ?auto_910132 ) ( ON ?auto_910133 ?auto_910132 ) ( not ( = ?auto_910132 ?auto_910133 ) ) ( not ( = ?auto_910132 ?auto_910134 ) ) ( not ( = ?auto_910132 ?auto_910135 ) ) ( not ( = ?auto_910132 ?auto_910136 ) ) ( not ( = ?auto_910132 ?auto_910137 ) ) ( not ( = ?auto_910132 ?auto_910138 ) ) ( not ( = ?auto_910132 ?auto_910139 ) ) ( not ( = ?auto_910132 ?auto_910140 ) ) ( not ( = ?auto_910132 ?auto_910141 ) ) ( not ( = ?auto_910132 ?auto_910142 ) ) ( not ( = ?auto_910132 ?auto_910143 ) ) ( not ( = ?auto_910132 ?auto_910144 ) ) ( not ( = ?auto_910132 ?auto_910145 ) ) ( not ( = ?auto_910133 ?auto_910134 ) ) ( not ( = ?auto_910133 ?auto_910135 ) ) ( not ( = ?auto_910133 ?auto_910136 ) ) ( not ( = ?auto_910133 ?auto_910137 ) ) ( not ( = ?auto_910133 ?auto_910138 ) ) ( not ( = ?auto_910133 ?auto_910139 ) ) ( not ( = ?auto_910133 ?auto_910140 ) ) ( not ( = ?auto_910133 ?auto_910141 ) ) ( not ( = ?auto_910133 ?auto_910142 ) ) ( not ( = ?auto_910133 ?auto_910143 ) ) ( not ( = ?auto_910133 ?auto_910144 ) ) ( not ( = ?auto_910133 ?auto_910145 ) ) ( not ( = ?auto_910134 ?auto_910135 ) ) ( not ( = ?auto_910134 ?auto_910136 ) ) ( not ( = ?auto_910134 ?auto_910137 ) ) ( not ( = ?auto_910134 ?auto_910138 ) ) ( not ( = ?auto_910134 ?auto_910139 ) ) ( not ( = ?auto_910134 ?auto_910140 ) ) ( not ( = ?auto_910134 ?auto_910141 ) ) ( not ( = ?auto_910134 ?auto_910142 ) ) ( not ( = ?auto_910134 ?auto_910143 ) ) ( not ( = ?auto_910134 ?auto_910144 ) ) ( not ( = ?auto_910134 ?auto_910145 ) ) ( not ( = ?auto_910135 ?auto_910136 ) ) ( not ( = ?auto_910135 ?auto_910137 ) ) ( not ( = ?auto_910135 ?auto_910138 ) ) ( not ( = ?auto_910135 ?auto_910139 ) ) ( not ( = ?auto_910135 ?auto_910140 ) ) ( not ( = ?auto_910135 ?auto_910141 ) ) ( not ( = ?auto_910135 ?auto_910142 ) ) ( not ( = ?auto_910135 ?auto_910143 ) ) ( not ( = ?auto_910135 ?auto_910144 ) ) ( not ( = ?auto_910135 ?auto_910145 ) ) ( not ( = ?auto_910136 ?auto_910137 ) ) ( not ( = ?auto_910136 ?auto_910138 ) ) ( not ( = ?auto_910136 ?auto_910139 ) ) ( not ( = ?auto_910136 ?auto_910140 ) ) ( not ( = ?auto_910136 ?auto_910141 ) ) ( not ( = ?auto_910136 ?auto_910142 ) ) ( not ( = ?auto_910136 ?auto_910143 ) ) ( not ( = ?auto_910136 ?auto_910144 ) ) ( not ( = ?auto_910136 ?auto_910145 ) ) ( not ( = ?auto_910137 ?auto_910138 ) ) ( not ( = ?auto_910137 ?auto_910139 ) ) ( not ( = ?auto_910137 ?auto_910140 ) ) ( not ( = ?auto_910137 ?auto_910141 ) ) ( not ( = ?auto_910137 ?auto_910142 ) ) ( not ( = ?auto_910137 ?auto_910143 ) ) ( not ( = ?auto_910137 ?auto_910144 ) ) ( not ( = ?auto_910137 ?auto_910145 ) ) ( not ( = ?auto_910138 ?auto_910139 ) ) ( not ( = ?auto_910138 ?auto_910140 ) ) ( not ( = ?auto_910138 ?auto_910141 ) ) ( not ( = ?auto_910138 ?auto_910142 ) ) ( not ( = ?auto_910138 ?auto_910143 ) ) ( not ( = ?auto_910138 ?auto_910144 ) ) ( not ( = ?auto_910138 ?auto_910145 ) ) ( not ( = ?auto_910139 ?auto_910140 ) ) ( not ( = ?auto_910139 ?auto_910141 ) ) ( not ( = ?auto_910139 ?auto_910142 ) ) ( not ( = ?auto_910139 ?auto_910143 ) ) ( not ( = ?auto_910139 ?auto_910144 ) ) ( not ( = ?auto_910139 ?auto_910145 ) ) ( not ( = ?auto_910140 ?auto_910141 ) ) ( not ( = ?auto_910140 ?auto_910142 ) ) ( not ( = ?auto_910140 ?auto_910143 ) ) ( not ( = ?auto_910140 ?auto_910144 ) ) ( not ( = ?auto_910140 ?auto_910145 ) ) ( not ( = ?auto_910141 ?auto_910142 ) ) ( not ( = ?auto_910141 ?auto_910143 ) ) ( not ( = ?auto_910141 ?auto_910144 ) ) ( not ( = ?auto_910141 ?auto_910145 ) ) ( not ( = ?auto_910142 ?auto_910143 ) ) ( not ( = ?auto_910142 ?auto_910144 ) ) ( not ( = ?auto_910142 ?auto_910145 ) ) ( not ( = ?auto_910143 ?auto_910144 ) ) ( not ( = ?auto_910143 ?auto_910145 ) ) ( not ( = ?auto_910144 ?auto_910145 ) ) ( ON ?auto_910143 ?auto_910144 ) ( ON ?auto_910142 ?auto_910143 ) ( ON ?auto_910141 ?auto_910142 ) ( ON ?auto_910140 ?auto_910141 ) ( ON ?auto_910139 ?auto_910140 ) ( ON ?auto_910138 ?auto_910139 ) ( ON ?auto_910137 ?auto_910138 ) ( ON ?auto_910136 ?auto_910137 ) ( ON ?auto_910135 ?auto_910136 ) ( CLEAR ?auto_910133 ) ( ON ?auto_910134 ?auto_910135 ) ( CLEAR ?auto_910134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_910132 ?auto_910133 ?auto_910134 )
      ( MAKE-13PILE ?auto_910132 ?auto_910133 ?auto_910134 ?auto_910135 ?auto_910136 ?auto_910137 ?auto_910138 ?auto_910139 ?auto_910140 ?auto_910141 ?auto_910142 ?auto_910143 ?auto_910144 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_910186 - BLOCK
      ?auto_910187 - BLOCK
      ?auto_910188 - BLOCK
      ?auto_910189 - BLOCK
      ?auto_910190 - BLOCK
      ?auto_910191 - BLOCK
      ?auto_910192 - BLOCK
      ?auto_910193 - BLOCK
      ?auto_910194 - BLOCK
      ?auto_910195 - BLOCK
      ?auto_910196 - BLOCK
      ?auto_910197 - BLOCK
      ?auto_910198 - BLOCK
    )
    :vars
    (
      ?auto_910199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910198 ?auto_910199 ) ( ON-TABLE ?auto_910186 ) ( not ( = ?auto_910186 ?auto_910187 ) ) ( not ( = ?auto_910186 ?auto_910188 ) ) ( not ( = ?auto_910186 ?auto_910189 ) ) ( not ( = ?auto_910186 ?auto_910190 ) ) ( not ( = ?auto_910186 ?auto_910191 ) ) ( not ( = ?auto_910186 ?auto_910192 ) ) ( not ( = ?auto_910186 ?auto_910193 ) ) ( not ( = ?auto_910186 ?auto_910194 ) ) ( not ( = ?auto_910186 ?auto_910195 ) ) ( not ( = ?auto_910186 ?auto_910196 ) ) ( not ( = ?auto_910186 ?auto_910197 ) ) ( not ( = ?auto_910186 ?auto_910198 ) ) ( not ( = ?auto_910186 ?auto_910199 ) ) ( not ( = ?auto_910187 ?auto_910188 ) ) ( not ( = ?auto_910187 ?auto_910189 ) ) ( not ( = ?auto_910187 ?auto_910190 ) ) ( not ( = ?auto_910187 ?auto_910191 ) ) ( not ( = ?auto_910187 ?auto_910192 ) ) ( not ( = ?auto_910187 ?auto_910193 ) ) ( not ( = ?auto_910187 ?auto_910194 ) ) ( not ( = ?auto_910187 ?auto_910195 ) ) ( not ( = ?auto_910187 ?auto_910196 ) ) ( not ( = ?auto_910187 ?auto_910197 ) ) ( not ( = ?auto_910187 ?auto_910198 ) ) ( not ( = ?auto_910187 ?auto_910199 ) ) ( not ( = ?auto_910188 ?auto_910189 ) ) ( not ( = ?auto_910188 ?auto_910190 ) ) ( not ( = ?auto_910188 ?auto_910191 ) ) ( not ( = ?auto_910188 ?auto_910192 ) ) ( not ( = ?auto_910188 ?auto_910193 ) ) ( not ( = ?auto_910188 ?auto_910194 ) ) ( not ( = ?auto_910188 ?auto_910195 ) ) ( not ( = ?auto_910188 ?auto_910196 ) ) ( not ( = ?auto_910188 ?auto_910197 ) ) ( not ( = ?auto_910188 ?auto_910198 ) ) ( not ( = ?auto_910188 ?auto_910199 ) ) ( not ( = ?auto_910189 ?auto_910190 ) ) ( not ( = ?auto_910189 ?auto_910191 ) ) ( not ( = ?auto_910189 ?auto_910192 ) ) ( not ( = ?auto_910189 ?auto_910193 ) ) ( not ( = ?auto_910189 ?auto_910194 ) ) ( not ( = ?auto_910189 ?auto_910195 ) ) ( not ( = ?auto_910189 ?auto_910196 ) ) ( not ( = ?auto_910189 ?auto_910197 ) ) ( not ( = ?auto_910189 ?auto_910198 ) ) ( not ( = ?auto_910189 ?auto_910199 ) ) ( not ( = ?auto_910190 ?auto_910191 ) ) ( not ( = ?auto_910190 ?auto_910192 ) ) ( not ( = ?auto_910190 ?auto_910193 ) ) ( not ( = ?auto_910190 ?auto_910194 ) ) ( not ( = ?auto_910190 ?auto_910195 ) ) ( not ( = ?auto_910190 ?auto_910196 ) ) ( not ( = ?auto_910190 ?auto_910197 ) ) ( not ( = ?auto_910190 ?auto_910198 ) ) ( not ( = ?auto_910190 ?auto_910199 ) ) ( not ( = ?auto_910191 ?auto_910192 ) ) ( not ( = ?auto_910191 ?auto_910193 ) ) ( not ( = ?auto_910191 ?auto_910194 ) ) ( not ( = ?auto_910191 ?auto_910195 ) ) ( not ( = ?auto_910191 ?auto_910196 ) ) ( not ( = ?auto_910191 ?auto_910197 ) ) ( not ( = ?auto_910191 ?auto_910198 ) ) ( not ( = ?auto_910191 ?auto_910199 ) ) ( not ( = ?auto_910192 ?auto_910193 ) ) ( not ( = ?auto_910192 ?auto_910194 ) ) ( not ( = ?auto_910192 ?auto_910195 ) ) ( not ( = ?auto_910192 ?auto_910196 ) ) ( not ( = ?auto_910192 ?auto_910197 ) ) ( not ( = ?auto_910192 ?auto_910198 ) ) ( not ( = ?auto_910192 ?auto_910199 ) ) ( not ( = ?auto_910193 ?auto_910194 ) ) ( not ( = ?auto_910193 ?auto_910195 ) ) ( not ( = ?auto_910193 ?auto_910196 ) ) ( not ( = ?auto_910193 ?auto_910197 ) ) ( not ( = ?auto_910193 ?auto_910198 ) ) ( not ( = ?auto_910193 ?auto_910199 ) ) ( not ( = ?auto_910194 ?auto_910195 ) ) ( not ( = ?auto_910194 ?auto_910196 ) ) ( not ( = ?auto_910194 ?auto_910197 ) ) ( not ( = ?auto_910194 ?auto_910198 ) ) ( not ( = ?auto_910194 ?auto_910199 ) ) ( not ( = ?auto_910195 ?auto_910196 ) ) ( not ( = ?auto_910195 ?auto_910197 ) ) ( not ( = ?auto_910195 ?auto_910198 ) ) ( not ( = ?auto_910195 ?auto_910199 ) ) ( not ( = ?auto_910196 ?auto_910197 ) ) ( not ( = ?auto_910196 ?auto_910198 ) ) ( not ( = ?auto_910196 ?auto_910199 ) ) ( not ( = ?auto_910197 ?auto_910198 ) ) ( not ( = ?auto_910197 ?auto_910199 ) ) ( not ( = ?auto_910198 ?auto_910199 ) ) ( ON ?auto_910197 ?auto_910198 ) ( ON ?auto_910196 ?auto_910197 ) ( ON ?auto_910195 ?auto_910196 ) ( ON ?auto_910194 ?auto_910195 ) ( ON ?auto_910193 ?auto_910194 ) ( ON ?auto_910192 ?auto_910193 ) ( ON ?auto_910191 ?auto_910192 ) ( ON ?auto_910190 ?auto_910191 ) ( ON ?auto_910189 ?auto_910190 ) ( ON ?auto_910188 ?auto_910189 ) ( CLEAR ?auto_910186 ) ( ON ?auto_910187 ?auto_910188 ) ( CLEAR ?auto_910187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_910186 ?auto_910187 )
      ( MAKE-13PILE ?auto_910186 ?auto_910187 ?auto_910188 ?auto_910189 ?auto_910190 ?auto_910191 ?auto_910192 ?auto_910193 ?auto_910194 ?auto_910195 ?auto_910196 ?auto_910197 ?auto_910198 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_910240 - BLOCK
      ?auto_910241 - BLOCK
      ?auto_910242 - BLOCK
      ?auto_910243 - BLOCK
      ?auto_910244 - BLOCK
      ?auto_910245 - BLOCK
      ?auto_910246 - BLOCK
      ?auto_910247 - BLOCK
      ?auto_910248 - BLOCK
      ?auto_910249 - BLOCK
      ?auto_910250 - BLOCK
      ?auto_910251 - BLOCK
      ?auto_910252 - BLOCK
    )
    :vars
    (
      ?auto_910253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910252 ?auto_910253 ) ( not ( = ?auto_910240 ?auto_910241 ) ) ( not ( = ?auto_910240 ?auto_910242 ) ) ( not ( = ?auto_910240 ?auto_910243 ) ) ( not ( = ?auto_910240 ?auto_910244 ) ) ( not ( = ?auto_910240 ?auto_910245 ) ) ( not ( = ?auto_910240 ?auto_910246 ) ) ( not ( = ?auto_910240 ?auto_910247 ) ) ( not ( = ?auto_910240 ?auto_910248 ) ) ( not ( = ?auto_910240 ?auto_910249 ) ) ( not ( = ?auto_910240 ?auto_910250 ) ) ( not ( = ?auto_910240 ?auto_910251 ) ) ( not ( = ?auto_910240 ?auto_910252 ) ) ( not ( = ?auto_910240 ?auto_910253 ) ) ( not ( = ?auto_910241 ?auto_910242 ) ) ( not ( = ?auto_910241 ?auto_910243 ) ) ( not ( = ?auto_910241 ?auto_910244 ) ) ( not ( = ?auto_910241 ?auto_910245 ) ) ( not ( = ?auto_910241 ?auto_910246 ) ) ( not ( = ?auto_910241 ?auto_910247 ) ) ( not ( = ?auto_910241 ?auto_910248 ) ) ( not ( = ?auto_910241 ?auto_910249 ) ) ( not ( = ?auto_910241 ?auto_910250 ) ) ( not ( = ?auto_910241 ?auto_910251 ) ) ( not ( = ?auto_910241 ?auto_910252 ) ) ( not ( = ?auto_910241 ?auto_910253 ) ) ( not ( = ?auto_910242 ?auto_910243 ) ) ( not ( = ?auto_910242 ?auto_910244 ) ) ( not ( = ?auto_910242 ?auto_910245 ) ) ( not ( = ?auto_910242 ?auto_910246 ) ) ( not ( = ?auto_910242 ?auto_910247 ) ) ( not ( = ?auto_910242 ?auto_910248 ) ) ( not ( = ?auto_910242 ?auto_910249 ) ) ( not ( = ?auto_910242 ?auto_910250 ) ) ( not ( = ?auto_910242 ?auto_910251 ) ) ( not ( = ?auto_910242 ?auto_910252 ) ) ( not ( = ?auto_910242 ?auto_910253 ) ) ( not ( = ?auto_910243 ?auto_910244 ) ) ( not ( = ?auto_910243 ?auto_910245 ) ) ( not ( = ?auto_910243 ?auto_910246 ) ) ( not ( = ?auto_910243 ?auto_910247 ) ) ( not ( = ?auto_910243 ?auto_910248 ) ) ( not ( = ?auto_910243 ?auto_910249 ) ) ( not ( = ?auto_910243 ?auto_910250 ) ) ( not ( = ?auto_910243 ?auto_910251 ) ) ( not ( = ?auto_910243 ?auto_910252 ) ) ( not ( = ?auto_910243 ?auto_910253 ) ) ( not ( = ?auto_910244 ?auto_910245 ) ) ( not ( = ?auto_910244 ?auto_910246 ) ) ( not ( = ?auto_910244 ?auto_910247 ) ) ( not ( = ?auto_910244 ?auto_910248 ) ) ( not ( = ?auto_910244 ?auto_910249 ) ) ( not ( = ?auto_910244 ?auto_910250 ) ) ( not ( = ?auto_910244 ?auto_910251 ) ) ( not ( = ?auto_910244 ?auto_910252 ) ) ( not ( = ?auto_910244 ?auto_910253 ) ) ( not ( = ?auto_910245 ?auto_910246 ) ) ( not ( = ?auto_910245 ?auto_910247 ) ) ( not ( = ?auto_910245 ?auto_910248 ) ) ( not ( = ?auto_910245 ?auto_910249 ) ) ( not ( = ?auto_910245 ?auto_910250 ) ) ( not ( = ?auto_910245 ?auto_910251 ) ) ( not ( = ?auto_910245 ?auto_910252 ) ) ( not ( = ?auto_910245 ?auto_910253 ) ) ( not ( = ?auto_910246 ?auto_910247 ) ) ( not ( = ?auto_910246 ?auto_910248 ) ) ( not ( = ?auto_910246 ?auto_910249 ) ) ( not ( = ?auto_910246 ?auto_910250 ) ) ( not ( = ?auto_910246 ?auto_910251 ) ) ( not ( = ?auto_910246 ?auto_910252 ) ) ( not ( = ?auto_910246 ?auto_910253 ) ) ( not ( = ?auto_910247 ?auto_910248 ) ) ( not ( = ?auto_910247 ?auto_910249 ) ) ( not ( = ?auto_910247 ?auto_910250 ) ) ( not ( = ?auto_910247 ?auto_910251 ) ) ( not ( = ?auto_910247 ?auto_910252 ) ) ( not ( = ?auto_910247 ?auto_910253 ) ) ( not ( = ?auto_910248 ?auto_910249 ) ) ( not ( = ?auto_910248 ?auto_910250 ) ) ( not ( = ?auto_910248 ?auto_910251 ) ) ( not ( = ?auto_910248 ?auto_910252 ) ) ( not ( = ?auto_910248 ?auto_910253 ) ) ( not ( = ?auto_910249 ?auto_910250 ) ) ( not ( = ?auto_910249 ?auto_910251 ) ) ( not ( = ?auto_910249 ?auto_910252 ) ) ( not ( = ?auto_910249 ?auto_910253 ) ) ( not ( = ?auto_910250 ?auto_910251 ) ) ( not ( = ?auto_910250 ?auto_910252 ) ) ( not ( = ?auto_910250 ?auto_910253 ) ) ( not ( = ?auto_910251 ?auto_910252 ) ) ( not ( = ?auto_910251 ?auto_910253 ) ) ( not ( = ?auto_910252 ?auto_910253 ) ) ( ON ?auto_910251 ?auto_910252 ) ( ON ?auto_910250 ?auto_910251 ) ( ON ?auto_910249 ?auto_910250 ) ( ON ?auto_910248 ?auto_910249 ) ( ON ?auto_910247 ?auto_910248 ) ( ON ?auto_910246 ?auto_910247 ) ( ON ?auto_910245 ?auto_910246 ) ( ON ?auto_910244 ?auto_910245 ) ( ON ?auto_910243 ?auto_910244 ) ( ON ?auto_910242 ?auto_910243 ) ( ON ?auto_910241 ?auto_910242 ) ( ON ?auto_910240 ?auto_910241 ) ( CLEAR ?auto_910240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_910240 )
      ( MAKE-13PILE ?auto_910240 ?auto_910241 ?auto_910242 ?auto_910243 ?auto_910244 ?auto_910245 ?auto_910246 ?auto_910247 ?auto_910248 ?auto_910249 ?auto_910250 ?auto_910251 ?auto_910252 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910295 - BLOCK
      ?auto_910296 - BLOCK
      ?auto_910297 - BLOCK
      ?auto_910298 - BLOCK
      ?auto_910299 - BLOCK
      ?auto_910300 - BLOCK
      ?auto_910301 - BLOCK
      ?auto_910302 - BLOCK
      ?auto_910303 - BLOCK
      ?auto_910304 - BLOCK
      ?auto_910305 - BLOCK
      ?auto_910306 - BLOCK
      ?auto_910307 - BLOCK
      ?auto_910308 - BLOCK
    )
    :vars
    (
      ?auto_910309 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_910307 ) ( ON ?auto_910308 ?auto_910309 ) ( CLEAR ?auto_910308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_910295 ) ( ON ?auto_910296 ?auto_910295 ) ( ON ?auto_910297 ?auto_910296 ) ( ON ?auto_910298 ?auto_910297 ) ( ON ?auto_910299 ?auto_910298 ) ( ON ?auto_910300 ?auto_910299 ) ( ON ?auto_910301 ?auto_910300 ) ( ON ?auto_910302 ?auto_910301 ) ( ON ?auto_910303 ?auto_910302 ) ( ON ?auto_910304 ?auto_910303 ) ( ON ?auto_910305 ?auto_910304 ) ( ON ?auto_910306 ?auto_910305 ) ( ON ?auto_910307 ?auto_910306 ) ( not ( = ?auto_910295 ?auto_910296 ) ) ( not ( = ?auto_910295 ?auto_910297 ) ) ( not ( = ?auto_910295 ?auto_910298 ) ) ( not ( = ?auto_910295 ?auto_910299 ) ) ( not ( = ?auto_910295 ?auto_910300 ) ) ( not ( = ?auto_910295 ?auto_910301 ) ) ( not ( = ?auto_910295 ?auto_910302 ) ) ( not ( = ?auto_910295 ?auto_910303 ) ) ( not ( = ?auto_910295 ?auto_910304 ) ) ( not ( = ?auto_910295 ?auto_910305 ) ) ( not ( = ?auto_910295 ?auto_910306 ) ) ( not ( = ?auto_910295 ?auto_910307 ) ) ( not ( = ?auto_910295 ?auto_910308 ) ) ( not ( = ?auto_910295 ?auto_910309 ) ) ( not ( = ?auto_910296 ?auto_910297 ) ) ( not ( = ?auto_910296 ?auto_910298 ) ) ( not ( = ?auto_910296 ?auto_910299 ) ) ( not ( = ?auto_910296 ?auto_910300 ) ) ( not ( = ?auto_910296 ?auto_910301 ) ) ( not ( = ?auto_910296 ?auto_910302 ) ) ( not ( = ?auto_910296 ?auto_910303 ) ) ( not ( = ?auto_910296 ?auto_910304 ) ) ( not ( = ?auto_910296 ?auto_910305 ) ) ( not ( = ?auto_910296 ?auto_910306 ) ) ( not ( = ?auto_910296 ?auto_910307 ) ) ( not ( = ?auto_910296 ?auto_910308 ) ) ( not ( = ?auto_910296 ?auto_910309 ) ) ( not ( = ?auto_910297 ?auto_910298 ) ) ( not ( = ?auto_910297 ?auto_910299 ) ) ( not ( = ?auto_910297 ?auto_910300 ) ) ( not ( = ?auto_910297 ?auto_910301 ) ) ( not ( = ?auto_910297 ?auto_910302 ) ) ( not ( = ?auto_910297 ?auto_910303 ) ) ( not ( = ?auto_910297 ?auto_910304 ) ) ( not ( = ?auto_910297 ?auto_910305 ) ) ( not ( = ?auto_910297 ?auto_910306 ) ) ( not ( = ?auto_910297 ?auto_910307 ) ) ( not ( = ?auto_910297 ?auto_910308 ) ) ( not ( = ?auto_910297 ?auto_910309 ) ) ( not ( = ?auto_910298 ?auto_910299 ) ) ( not ( = ?auto_910298 ?auto_910300 ) ) ( not ( = ?auto_910298 ?auto_910301 ) ) ( not ( = ?auto_910298 ?auto_910302 ) ) ( not ( = ?auto_910298 ?auto_910303 ) ) ( not ( = ?auto_910298 ?auto_910304 ) ) ( not ( = ?auto_910298 ?auto_910305 ) ) ( not ( = ?auto_910298 ?auto_910306 ) ) ( not ( = ?auto_910298 ?auto_910307 ) ) ( not ( = ?auto_910298 ?auto_910308 ) ) ( not ( = ?auto_910298 ?auto_910309 ) ) ( not ( = ?auto_910299 ?auto_910300 ) ) ( not ( = ?auto_910299 ?auto_910301 ) ) ( not ( = ?auto_910299 ?auto_910302 ) ) ( not ( = ?auto_910299 ?auto_910303 ) ) ( not ( = ?auto_910299 ?auto_910304 ) ) ( not ( = ?auto_910299 ?auto_910305 ) ) ( not ( = ?auto_910299 ?auto_910306 ) ) ( not ( = ?auto_910299 ?auto_910307 ) ) ( not ( = ?auto_910299 ?auto_910308 ) ) ( not ( = ?auto_910299 ?auto_910309 ) ) ( not ( = ?auto_910300 ?auto_910301 ) ) ( not ( = ?auto_910300 ?auto_910302 ) ) ( not ( = ?auto_910300 ?auto_910303 ) ) ( not ( = ?auto_910300 ?auto_910304 ) ) ( not ( = ?auto_910300 ?auto_910305 ) ) ( not ( = ?auto_910300 ?auto_910306 ) ) ( not ( = ?auto_910300 ?auto_910307 ) ) ( not ( = ?auto_910300 ?auto_910308 ) ) ( not ( = ?auto_910300 ?auto_910309 ) ) ( not ( = ?auto_910301 ?auto_910302 ) ) ( not ( = ?auto_910301 ?auto_910303 ) ) ( not ( = ?auto_910301 ?auto_910304 ) ) ( not ( = ?auto_910301 ?auto_910305 ) ) ( not ( = ?auto_910301 ?auto_910306 ) ) ( not ( = ?auto_910301 ?auto_910307 ) ) ( not ( = ?auto_910301 ?auto_910308 ) ) ( not ( = ?auto_910301 ?auto_910309 ) ) ( not ( = ?auto_910302 ?auto_910303 ) ) ( not ( = ?auto_910302 ?auto_910304 ) ) ( not ( = ?auto_910302 ?auto_910305 ) ) ( not ( = ?auto_910302 ?auto_910306 ) ) ( not ( = ?auto_910302 ?auto_910307 ) ) ( not ( = ?auto_910302 ?auto_910308 ) ) ( not ( = ?auto_910302 ?auto_910309 ) ) ( not ( = ?auto_910303 ?auto_910304 ) ) ( not ( = ?auto_910303 ?auto_910305 ) ) ( not ( = ?auto_910303 ?auto_910306 ) ) ( not ( = ?auto_910303 ?auto_910307 ) ) ( not ( = ?auto_910303 ?auto_910308 ) ) ( not ( = ?auto_910303 ?auto_910309 ) ) ( not ( = ?auto_910304 ?auto_910305 ) ) ( not ( = ?auto_910304 ?auto_910306 ) ) ( not ( = ?auto_910304 ?auto_910307 ) ) ( not ( = ?auto_910304 ?auto_910308 ) ) ( not ( = ?auto_910304 ?auto_910309 ) ) ( not ( = ?auto_910305 ?auto_910306 ) ) ( not ( = ?auto_910305 ?auto_910307 ) ) ( not ( = ?auto_910305 ?auto_910308 ) ) ( not ( = ?auto_910305 ?auto_910309 ) ) ( not ( = ?auto_910306 ?auto_910307 ) ) ( not ( = ?auto_910306 ?auto_910308 ) ) ( not ( = ?auto_910306 ?auto_910309 ) ) ( not ( = ?auto_910307 ?auto_910308 ) ) ( not ( = ?auto_910307 ?auto_910309 ) ) ( not ( = ?auto_910308 ?auto_910309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_910308 ?auto_910309 )
      ( !STACK ?auto_910308 ?auto_910307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910353 - BLOCK
      ?auto_910354 - BLOCK
      ?auto_910355 - BLOCK
      ?auto_910356 - BLOCK
      ?auto_910357 - BLOCK
      ?auto_910358 - BLOCK
      ?auto_910359 - BLOCK
      ?auto_910360 - BLOCK
      ?auto_910361 - BLOCK
      ?auto_910362 - BLOCK
      ?auto_910363 - BLOCK
      ?auto_910364 - BLOCK
      ?auto_910365 - BLOCK
      ?auto_910366 - BLOCK
    )
    :vars
    (
      ?auto_910367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910366 ?auto_910367 ) ( ON-TABLE ?auto_910353 ) ( ON ?auto_910354 ?auto_910353 ) ( ON ?auto_910355 ?auto_910354 ) ( ON ?auto_910356 ?auto_910355 ) ( ON ?auto_910357 ?auto_910356 ) ( ON ?auto_910358 ?auto_910357 ) ( ON ?auto_910359 ?auto_910358 ) ( ON ?auto_910360 ?auto_910359 ) ( ON ?auto_910361 ?auto_910360 ) ( ON ?auto_910362 ?auto_910361 ) ( ON ?auto_910363 ?auto_910362 ) ( ON ?auto_910364 ?auto_910363 ) ( not ( = ?auto_910353 ?auto_910354 ) ) ( not ( = ?auto_910353 ?auto_910355 ) ) ( not ( = ?auto_910353 ?auto_910356 ) ) ( not ( = ?auto_910353 ?auto_910357 ) ) ( not ( = ?auto_910353 ?auto_910358 ) ) ( not ( = ?auto_910353 ?auto_910359 ) ) ( not ( = ?auto_910353 ?auto_910360 ) ) ( not ( = ?auto_910353 ?auto_910361 ) ) ( not ( = ?auto_910353 ?auto_910362 ) ) ( not ( = ?auto_910353 ?auto_910363 ) ) ( not ( = ?auto_910353 ?auto_910364 ) ) ( not ( = ?auto_910353 ?auto_910365 ) ) ( not ( = ?auto_910353 ?auto_910366 ) ) ( not ( = ?auto_910353 ?auto_910367 ) ) ( not ( = ?auto_910354 ?auto_910355 ) ) ( not ( = ?auto_910354 ?auto_910356 ) ) ( not ( = ?auto_910354 ?auto_910357 ) ) ( not ( = ?auto_910354 ?auto_910358 ) ) ( not ( = ?auto_910354 ?auto_910359 ) ) ( not ( = ?auto_910354 ?auto_910360 ) ) ( not ( = ?auto_910354 ?auto_910361 ) ) ( not ( = ?auto_910354 ?auto_910362 ) ) ( not ( = ?auto_910354 ?auto_910363 ) ) ( not ( = ?auto_910354 ?auto_910364 ) ) ( not ( = ?auto_910354 ?auto_910365 ) ) ( not ( = ?auto_910354 ?auto_910366 ) ) ( not ( = ?auto_910354 ?auto_910367 ) ) ( not ( = ?auto_910355 ?auto_910356 ) ) ( not ( = ?auto_910355 ?auto_910357 ) ) ( not ( = ?auto_910355 ?auto_910358 ) ) ( not ( = ?auto_910355 ?auto_910359 ) ) ( not ( = ?auto_910355 ?auto_910360 ) ) ( not ( = ?auto_910355 ?auto_910361 ) ) ( not ( = ?auto_910355 ?auto_910362 ) ) ( not ( = ?auto_910355 ?auto_910363 ) ) ( not ( = ?auto_910355 ?auto_910364 ) ) ( not ( = ?auto_910355 ?auto_910365 ) ) ( not ( = ?auto_910355 ?auto_910366 ) ) ( not ( = ?auto_910355 ?auto_910367 ) ) ( not ( = ?auto_910356 ?auto_910357 ) ) ( not ( = ?auto_910356 ?auto_910358 ) ) ( not ( = ?auto_910356 ?auto_910359 ) ) ( not ( = ?auto_910356 ?auto_910360 ) ) ( not ( = ?auto_910356 ?auto_910361 ) ) ( not ( = ?auto_910356 ?auto_910362 ) ) ( not ( = ?auto_910356 ?auto_910363 ) ) ( not ( = ?auto_910356 ?auto_910364 ) ) ( not ( = ?auto_910356 ?auto_910365 ) ) ( not ( = ?auto_910356 ?auto_910366 ) ) ( not ( = ?auto_910356 ?auto_910367 ) ) ( not ( = ?auto_910357 ?auto_910358 ) ) ( not ( = ?auto_910357 ?auto_910359 ) ) ( not ( = ?auto_910357 ?auto_910360 ) ) ( not ( = ?auto_910357 ?auto_910361 ) ) ( not ( = ?auto_910357 ?auto_910362 ) ) ( not ( = ?auto_910357 ?auto_910363 ) ) ( not ( = ?auto_910357 ?auto_910364 ) ) ( not ( = ?auto_910357 ?auto_910365 ) ) ( not ( = ?auto_910357 ?auto_910366 ) ) ( not ( = ?auto_910357 ?auto_910367 ) ) ( not ( = ?auto_910358 ?auto_910359 ) ) ( not ( = ?auto_910358 ?auto_910360 ) ) ( not ( = ?auto_910358 ?auto_910361 ) ) ( not ( = ?auto_910358 ?auto_910362 ) ) ( not ( = ?auto_910358 ?auto_910363 ) ) ( not ( = ?auto_910358 ?auto_910364 ) ) ( not ( = ?auto_910358 ?auto_910365 ) ) ( not ( = ?auto_910358 ?auto_910366 ) ) ( not ( = ?auto_910358 ?auto_910367 ) ) ( not ( = ?auto_910359 ?auto_910360 ) ) ( not ( = ?auto_910359 ?auto_910361 ) ) ( not ( = ?auto_910359 ?auto_910362 ) ) ( not ( = ?auto_910359 ?auto_910363 ) ) ( not ( = ?auto_910359 ?auto_910364 ) ) ( not ( = ?auto_910359 ?auto_910365 ) ) ( not ( = ?auto_910359 ?auto_910366 ) ) ( not ( = ?auto_910359 ?auto_910367 ) ) ( not ( = ?auto_910360 ?auto_910361 ) ) ( not ( = ?auto_910360 ?auto_910362 ) ) ( not ( = ?auto_910360 ?auto_910363 ) ) ( not ( = ?auto_910360 ?auto_910364 ) ) ( not ( = ?auto_910360 ?auto_910365 ) ) ( not ( = ?auto_910360 ?auto_910366 ) ) ( not ( = ?auto_910360 ?auto_910367 ) ) ( not ( = ?auto_910361 ?auto_910362 ) ) ( not ( = ?auto_910361 ?auto_910363 ) ) ( not ( = ?auto_910361 ?auto_910364 ) ) ( not ( = ?auto_910361 ?auto_910365 ) ) ( not ( = ?auto_910361 ?auto_910366 ) ) ( not ( = ?auto_910361 ?auto_910367 ) ) ( not ( = ?auto_910362 ?auto_910363 ) ) ( not ( = ?auto_910362 ?auto_910364 ) ) ( not ( = ?auto_910362 ?auto_910365 ) ) ( not ( = ?auto_910362 ?auto_910366 ) ) ( not ( = ?auto_910362 ?auto_910367 ) ) ( not ( = ?auto_910363 ?auto_910364 ) ) ( not ( = ?auto_910363 ?auto_910365 ) ) ( not ( = ?auto_910363 ?auto_910366 ) ) ( not ( = ?auto_910363 ?auto_910367 ) ) ( not ( = ?auto_910364 ?auto_910365 ) ) ( not ( = ?auto_910364 ?auto_910366 ) ) ( not ( = ?auto_910364 ?auto_910367 ) ) ( not ( = ?auto_910365 ?auto_910366 ) ) ( not ( = ?auto_910365 ?auto_910367 ) ) ( not ( = ?auto_910366 ?auto_910367 ) ) ( CLEAR ?auto_910364 ) ( ON ?auto_910365 ?auto_910366 ) ( CLEAR ?auto_910365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_910353 ?auto_910354 ?auto_910355 ?auto_910356 ?auto_910357 ?auto_910358 ?auto_910359 ?auto_910360 ?auto_910361 ?auto_910362 ?auto_910363 ?auto_910364 ?auto_910365 )
      ( MAKE-14PILE ?auto_910353 ?auto_910354 ?auto_910355 ?auto_910356 ?auto_910357 ?auto_910358 ?auto_910359 ?auto_910360 ?auto_910361 ?auto_910362 ?auto_910363 ?auto_910364 ?auto_910365 ?auto_910366 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910411 - BLOCK
      ?auto_910412 - BLOCK
      ?auto_910413 - BLOCK
      ?auto_910414 - BLOCK
      ?auto_910415 - BLOCK
      ?auto_910416 - BLOCK
      ?auto_910417 - BLOCK
      ?auto_910418 - BLOCK
      ?auto_910419 - BLOCK
      ?auto_910420 - BLOCK
      ?auto_910421 - BLOCK
      ?auto_910422 - BLOCK
      ?auto_910423 - BLOCK
      ?auto_910424 - BLOCK
    )
    :vars
    (
      ?auto_910425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910424 ?auto_910425 ) ( ON-TABLE ?auto_910411 ) ( ON ?auto_910412 ?auto_910411 ) ( ON ?auto_910413 ?auto_910412 ) ( ON ?auto_910414 ?auto_910413 ) ( ON ?auto_910415 ?auto_910414 ) ( ON ?auto_910416 ?auto_910415 ) ( ON ?auto_910417 ?auto_910416 ) ( ON ?auto_910418 ?auto_910417 ) ( ON ?auto_910419 ?auto_910418 ) ( ON ?auto_910420 ?auto_910419 ) ( ON ?auto_910421 ?auto_910420 ) ( not ( = ?auto_910411 ?auto_910412 ) ) ( not ( = ?auto_910411 ?auto_910413 ) ) ( not ( = ?auto_910411 ?auto_910414 ) ) ( not ( = ?auto_910411 ?auto_910415 ) ) ( not ( = ?auto_910411 ?auto_910416 ) ) ( not ( = ?auto_910411 ?auto_910417 ) ) ( not ( = ?auto_910411 ?auto_910418 ) ) ( not ( = ?auto_910411 ?auto_910419 ) ) ( not ( = ?auto_910411 ?auto_910420 ) ) ( not ( = ?auto_910411 ?auto_910421 ) ) ( not ( = ?auto_910411 ?auto_910422 ) ) ( not ( = ?auto_910411 ?auto_910423 ) ) ( not ( = ?auto_910411 ?auto_910424 ) ) ( not ( = ?auto_910411 ?auto_910425 ) ) ( not ( = ?auto_910412 ?auto_910413 ) ) ( not ( = ?auto_910412 ?auto_910414 ) ) ( not ( = ?auto_910412 ?auto_910415 ) ) ( not ( = ?auto_910412 ?auto_910416 ) ) ( not ( = ?auto_910412 ?auto_910417 ) ) ( not ( = ?auto_910412 ?auto_910418 ) ) ( not ( = ?auto_910412 ?auto_910419 ) ) ( not ( = ?auto_910412 ?auto_910420 ) ) ( not ( = ?auto_910412 ?auto_910421 ) ) ( not ( = ?auto_910412 ?auto_910422 ) ) ( not ( = ?auto_910412 ?auto_910423 ) ) ( not ( = ?auto_910412 ?auto_910424 ) ) ( not ( = ?auto_910412 ?auto_910425 ) ) ( not ( = ?auto_910413 ?auto_910414 ) ) ( not ( = ?auto_910413 ?auto_910415 ) ) ( not ( = ?auto_910413 ?auto_910416 ) ) ( not ( = ?auto_910413 ?auto_910417 ) ) ( not ( = ?auto_910413 ?auto_910418 ) ) ( not ( = ?auto_910413 ?auto_910419 ) ) ( not ( = ?auto_910413 ?auto_910420 ) ) ( not ( = ?auto_910413 ?auto_910421 ) ) ( not ( = ?auto_910413 ?auto_910422 ) ) ( not ( = ?auto_910413 ?auto_910423 ) ) ( not ( = ?auto_910413 ?auto_910424 ) ) ( not ( = ?auto_910413 ?auto_910425 ) ) ( not ( = ?auto_910414 ?auto_910415 ) ) ( not ( = ?auto_910414 ?auto_910416 ) ) ( not ( = ?auto_910414 ?auto_910417 ) ) ( not ( = ?auto_910414 ?auto_910418 ) ) ( not ( = ?auto_910414 ?auto_910419 ) ) ( not ( = ?auto_910414 ?auto_910420 ) ) ( not ( = ?auto_910414 ?auto_910421 ) ) ( not ( = ?auto_910414 ?auto_910422 ) ) ( not ( = ?auto_910414 ?auto_910423 ) ) ( not ( = ?auto_910414 ?auto_910424 ) ) ( not ( = ?auto_910414 ?auto_910425 ) ) ( not ( = ?auto_910415 ?auto_910416 ) ) ( not ( = ?auto_910415 ?auto_910417 ) ) ( not ( = ?auto_910415 ?auto_910418 ) ) ( not ( = ?auto_910415 ?auto_910419 ) ) ( not ( = ?auto_910415 ?auto_910420 ) ) ( not ( = ?auto_910415 ?auto_910421 ) ) ( not ( = ?auto_910415 ?auto_910422 ) ) ( not ( = ?auto_910415 ?auto_910423 ) ) ( not ( = ?auto_910415 ?auto_910424 ) ) ( not ( = ?auto_910415 ?auto_910425 ) ) ( not ( = ?auto_910416 ?auto_910417 ) ) ( not ( = ?auto_910416 ?auto_910418 ) ) ( not ( = ?auto_910416 ?auto_910419 ) ) ( not ( = ?auto_910416 ?auto_910420 ) ) ( not ( = ?auto_910416 ?auto_910421 ) ) ( not ( = ?auto_910416 ?auto_910422 ) ) ( not ( = ?auto_910416 ?auto_910423 ) ) ( not ( = ?auto_910416 ?auto_910424 ) ) ( not ( = ?auto_910416 ?auto_910425 ) ) ( not ( = ?auto_910417 ?auto_910418 ) ) ( not ( = ?auto_910417 ?auto_910419 ) ) ( not ( = ?auto_910417 ?auto_910420 ) ) ( not ( = ?auto_910417 ?auto_910421 ) ) ( not ( = ?auto_910417 ?auto_910422 ) ) ( not ( = ?auto_910417 ?auto_910423 ) ) ( not ( = ?auto_910417 ?auto_910424 ) ) ( not ( = ?auto_910417 ?auto_910425 ) ) ( not ( = ?auto_910418 ?auto_910419 ) ) ( not ( = ?auto_910418 ?auto_910420 ) ) ( not ( = ?auto_910418 ?auto_910421 ) ) ( not ( = ?auto_910418 ?auto_910422 ) ) ( not ( = ?auto_910418 ?auto_910423 ) ) ( not ( = ?auto_910418 ?auto_910424 ) ) ( not ( = ?auto_910418 ?auto_910425 ) ) ( not ( = ?auto_910419 ?auto_910420 ) ) ( not ( = ?auto_910419 ?auto_910421 ) ) ( not ( = ?auto_910419 ?auto_910422 ) ) ( not ( = ?auto_910419 ?auto_910423 ) ) ( not ( = ?auto_910419 ?auto_910424 ) ) ( not ( = ?auto_910419 ?auto_910425 ) ) ( not ( = ?auto_910420 ?auto_910421 ) ) ( not ( = ?auto_910420 ?auto_910422 ) ) ( not ( = ?auto_910420 ?auto_910423 ) ) ( not ( = ?auto_910420 ?auto_910424 ) ) ( not ( = ?auto_910420 ?auto_910425 ) ) ( not ( = ?auto_910421 ?auto_910422 ) ) ( not ( = ?auto_910421 ?auto_910423 ) ) ( not ( = ?auto_910421 ?auto_910424 ) ) ( not ( = ?auto_910421 ?auto_910425 ) ) ( not ( = ?auto_910422 ?auto_910423 ) ) ( not ( = ?auto_910422 ?auto_910424 ) ) ( not ( = ?auto_910422 ?auto_910425 ) ) ( not ( = ?auto_910423 ?auto_910424 ) ) ( not ( = ?auto_910423 ?auto_910425 ) ) ( not ( = ?auto_910424 ?auto_910425 ) ) ( ON ?auto_910423 ?auto_910424 ) ( CLEAR ?auto_910421 ) ( ON ?auto_910422 ?auto_910423 ) ( CLEAR ?auto_910422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_910411 ?auto_910412 ?auto_910413 ?auto_910414 ?auto_910415 ?auto_910416 ?auto_910417 ?auto_910418 ?auto_910419 ?auto_910420 ?auto_910421 ?auto_910422 )
      ( MAKE-14PILE ?auto_910411 ?auto_910412 ?auto_910413 ?auto_910414 ?auto_910415 ?auto_910416 ?auto_910417 ?auto_910418 ?auto_910419 ?auto_910420 ?auto_910421 ?auto_910422 ?auto_910423 ?auto_910424 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910469 - BLOCK
      ?auto_910470 - BLOCK
      ?auto_910471 - BLOCK
      ?auto_910472 - BLOCK
      ?auto_910473 - BLOCK
      ?auto_910474 - BLOCK
      ?auto_910475 - BLOCK
      ?auto_910476 - BLOCK
      ?auto_910477 - BLOCK
      ?auto_910478 - BLOCK
      ?auto_910479 - BLOCK
      ?auto_910480 - BLOCK
      ?auto_910481 - BLOCK
      ?auto_910482 - BLOCK
    )
    :vars
    (
      ?auto_910483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910482 ?auto_910483 ) ( ON-TABLE ?auto_910469 ) ( ON ?auto_910470 ?auto_910469 ) ( ON ?auto_910471 ?auto_910470 ) ( ON ?auto_910472 ?auto_910471 ) ( ON ?auto_910473 ?auto_910472 ) ( ON ?auto_910474 ?auto_910473 ) ( ON ?auto_910475 ?auto_910474 ) ( ON ?auto_910476 ?auto_910475 ) ( ON ?auto_910477 ?auto_910476 ) ( ON ?auto_910478 ?auto_910477 ) ( not ( = ?auto_910469 ?auto_910470 ) ) ( not ( = ?auto_910469 ?auto_910471 ) ) ( not ( = ?auto_910469 ?auto_910472 ) ) ( not ( = ?auto_910469 ?auto_910473 ) ) ( not ( = ?auto_910469 ?auto_910474 ) ) ( not ( = ?auto_910469 ?auto_910475 ) ) ( not ( = ?auto_910469 ?auto_910476 ) ) ( not ( = ?auto_910469 ?auto_910477 ) ) ( not ( = ?auto_910469 ?auto_910478 ) ) ( not ( = ?auto_910469 ?auto_910479 ) ) ( not ( = ?auto_910469 ?auto_910480 ) ) ( not ( = ?auto_910469 ?auto_910481 ) ) ( not ( = ?auto_910469 ?auto_910482 ) ) ( not ( = ?auto_910469 ?auto_910483 ) ) ( not ( = ?auto_910470 ?auto_910471 ) ) ( not ( = ?auto_910470 ?auto_910472 ) ) ( not ( = ?auto_910470 ?auto_910473 ) ) ( not ( = ?auto_910470 ?auto_910474 ) ) ( not ( = ?auto_910470 ?auto_910475 ) ) ( not ( = ?auto_910470 ?auto_910476 ) ) ( not ( = ?auto_910470 ?auto_910477 ) ) ( not ( = ?auto_910470 ?auto_910478 ) ) ( not ( = ?auto_910470 ?auto_910479 ) ) ( not ( = ?auto_910470 ?auto_910480 ) ) ( not ( = ?auto_910470 ?auto_910481 ) ) ( not ( = ?auto_910470 ?auto_910482 ) ) ( not ( = ?auto_910470 ?auto_910483 ) ) ( not ( = ?auto_910471 ?auto_910472 ) ) ( not ( = ?auto_910471 ?auto_910473 ) ) ( not ( = ?auto_910471 ?auto_910474 ) ) ( not ( = ?auto_910471 ?auto_910475 ) ) ( not ( = ?auto_910471 ?auto_910476 ) ) ( not ( = ?auto_910471 ?auto_910477 ) ) ( not ( = ?auto_910471 ?auto_910478 ) ) ( not ( = ?auto_910471 ?auto_910479 ) ) ( not ( = ?auto_910471 ?auto_910480 ) ) ( not ( = ?auto_910471 ?auto_910481 ) ) ( not ( = ?auto_910471 ?auto_910482 ) ) ( not ( = ?auto_910471 ?auto_910483 ) ) ( not ( = ?auto_910472 ?auto_910473 ) ) ( not ( = ?auto_910472 ?auto_910474 ) ) ( not ( = ?auto_910472 ?auto_910475 ) ) ( not ( = ?auto_910472 ?auto_910476 ) ) ( not ( = ?auto_910472 ?auto_910477 ) ) ( not ( = ?auto_910472 ?auto_910478 ) ) ( not ( = ?auto_910472 ?auto_910479 ) ) ( not ( = ?auto_910472 ?auto_910480 ) ) ( not ( = ?auto_910472 ?auto_910481 ) ) ( not ( = ?auto_910472 ?auto_910482 ) ) ( not ( = ?auto_910472 ?auto_910483 ) ) ( not ( = ?auto_910473 ?auto_910474 ) ) ( not ( = ?auto_910473 ?auto_910475 ) ) ( not ( = ?auto_910473 ?auto_910476 ) ) ( not ( = ?auto_910473 ?auto_910477 ) ) ( not ( = ?auto_910473 ?auto_910478 ) ) ( not ( = ?auto_910473 ?auto_910479 ) ) ( not ( = ?auto_910473 ?auto_910480 ) ) ( not ( = ?auto_910473 ?auto_910481 ) ) ( not ( = ?auto_910473 ?auto_910482 ) ) ( not ( = ?auto_910473 ?auto_910483 ) ) ( not ( = ?auto_910474 ?auto_910475 ) ) ( not ( = ?auto_910474 ?auto_910476 ) ) ( not ( = ?auto_910474 ?auto_910477 ) ) ( not ( = ?auto_910474 ?auto_910478 ) ) ( not ( = ?auto_910474 ?auto_910479 ) ) ( not ( = ?auto_910474 ?auto_910480 ) ) ( not ( = ?auto_910474 ?auto_910481 ) ) ( not ( = ?auto_910474 ?auto_910482 ) ) ( not ( = ?auto_910474 ?auto_910483 ) ) ( not ( = ?auto_910475 ?auto_910476 ) ) ( not ( = ?auto_910475 ?auto_910477 ) ) ( not ( = ?auto_910475 ?auto_910478 ) ) ( not ( = ?auto_910475 ?auto_910479 ) ) ( not ( = ?auto_910475 ?auto_910480 ) ) ( not ( = ?auto_910475 ?auto_910481 ) ) ( not ( = ?auto_910475 ?auto_910482 ) ) ( not ( = ?auto_910475 ?auto_910483 ) ) ( not ( = ?auto_910476 ?auto_910477 ) ) ( not ( = ?auto_910476 ?auto_910478 ) ) ( not ( = ?auto_910476 ?auto_910479 ) ) ( not ( = ?auto_910476 ?auto_910480 ) ) ( not ( = ?auto_910476 ?auto_910481 ) ) ( not ( = ?auto_910476 ?auto_910482 ) ) ( not ( = ?auto_910476 ?auto_910483 ) ) ( not ( = ?auto_910477 ?auto_910478 ) ) ( not ( = ?auto_910477 ?auto_910479 ) ) ( not ( = ?auto_910477 ?auto_910480 ) ) ( not ( = ?auto_910477 ?auto_910481 ) ) ( not ( = ?auto_910477 ?auto_910482 ) ) ( not ( = ?auto_910477 ?auto_910483 ) ) ( not ( = ?auto_910478 ?auto_910479 ) ) ( not ( = ?auto_910478 ?auto_910480 ) ) ( not ( = ?auto_910478 ?auto_910481 ) ) ( not ( = ?auto_910478 ?auto_910482 ) ) ( not ( = ?auto_910478 ?auto_910483 ) ) ( not ( = ?auto_910479 ?auto_910480 ) ) ( not ( = ?auto_910479 ?auto_910481 ) ) ( not ( = ?auto_910479 ?auto_910482 ) ) ( not ( = ?auto_910479 ?auto_910483 ) ) ( not ( = ?auto_910480 ?auto_910481 ) ) ( not ( = ?auto_910480 ?auto_910482 ) ) ( not ( = ?auto_910480 ?auto_910483 ) ) ( not ( = ?auto_910481 ?auto_910482 ) ) ( not ( = ?auto_910481 ?auto_910483 ) ) ( not ( = ?auto_910482 ?auto_910483 ) ) ( ON ?auto_910481 ?auto_910482 ) ( ON ?auto_910480 ?auto_910481 ) ( CLEAR ?auto_910478 ) ( ON ?auto_910479 ?auto_910480 ) ( CLEAR ?auto_910479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_910469 ?auto_910470 ?auto_910471 ?auto_910472 ?auto_910473 ?auto_910474 ?auto_910475 ?auto_910476 ?auto_910477 ?auto_910478 ?auto_910479 )
      ( MAKE-14PILE ?auto_910469 ?auto_910470 ?auto_910471 ?auto_910472 ?auto_910473 ?auto_910474 ?auto_910475 ?auto_910476 ?auto_910477 ?auto_910478 ?auto_910479 ?auto_910480 ?auto_910481 ?auto_910482 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910527 - BLOCK
      ?auto_910528 - BLOCK
      ?auto_910529 - BLOCK
      ?auto_910530 - BLOCK
      ?auto_910531 - BLOCK
      ?auto_910532 - BLOCK
      ?auto_910533 - BLOCK
      ?auto_910534 - BLOCK
      ?auto_910535 - BLOCK
      ?auto_910536 - BLOCK
      ?auto_910537 - BLOCK
      ?auto_910538 - BLOCK
      ?auto_910539 - BLOCK
      ?auto_910540 - BLOCK
    )
    :vars
    (
      ?auto_910541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910540 ?auto_910541 ) ( ON-TABLE ?auto_910527 ) ( ON ?auto_910528 ?auto_910527 ) ( ON ?auto_910529 ?auto_910528 ) ( ON ?auto_910530 ?auto_910529 ) ( ON ?auto_910531 ?auto_910530 ) ( ON ?auto_910532 ?auto_910531 ) ( ON ?auto_910533 ?auto_910532 ) ( ON ?auto_910534 ?auto_910533 ) ( ON ?auto_910535 ?auto_910534 ) ( not ( = ?auto_910527 ?auto_910528 ) ) ( not ( = ?auto_910527 ?auto_910529 ) ) ( not ( = ?auto_910527 ?auto_910530 ) ) ( not ( = ?auto_910527 ?auto_910531 ) ) ( not ( = ?auto_910527 ?auto_910532 ) ) ( not ( = ?auto_910527 ?auto_910533 ) ) ( not ( = ?auto_910527 ?auto_910534 ) ) ( not ( = ?auto_910527 ?auto_910535 ) ) ( not ( = ?auto_910527 ?auto_910536 ) ) ( not ( = ?auto_910527 ?auto_910537 ) ) ( not ( = ?auto_910527 ?auto_910538 ) ) ( not ( = ?auto_910527 ?auto_910539 ) ) ( not ( = ?auto_910527 ?auto_910540 ) ) ( not ( = ?auto_910527 ?auto_910541 ) ) ( not ( = ?auto_910528 ?auto_910529 ) ) ( not ( = ?auto_910528 ?auto_910530 ) ) ( not ( = ?auto_910528 ?auto_910531 ) ) ( not ( = ?auto_910528 ?auto_910532 ) ) ( not ( = ?auto_910528 ?auto_910533 ) ) ( not ( = ?auto_910528 ?auto_910534 ) ) ( not ( = ?auto_910528 ?auto_910535 ) ) ( not ( = ?auto_910528 ?auto_910536 ) ) ( not ( = ?auto_910528 ?auto_910537 ) ) ( not ( = ?auto_910528 ?auto_910538 ) ) ( not ( = ?auto_910528 ?auto_910539 ) ) ( not ( = ?auto_910528 ?auto_910540 ) ) ( not ( = ?auto_910528 ?auto_910541 ) ) ( not ( = ?auto_910529 ?auto_910530 ) ) ( not ( = ?auto_910529 ?auto_910531 ) ) ( not ( = ?auto_910529 ?auto_910532 ) ) ( not ( = ?auto_910529 ?auto_910533 ) ) ( not ( = ?auto_910529 ?auto_910534 ) ) ( not ( = ?auto_910529 ?auto_910535 ) ) ( not ( = ?auto_910529 ?auto_910536 ) ) ( not ( = ?auto_910529 ?auto_910537 ) ) ( not ( = ?auto_910529 ?auto_910538 ) ) ( not ( = ?auto_910529 ?auto_910539 ) ) ( not ( = ?auto_910529 ?auto_910540 ) ) ( not ( = ?auto_910529 ?auto_910541 ) ) ( not ( = ?auto_910530 ?auto_910531 ) ) ( not ( = ?auto_910530 ?auto_910532 ) ) ( not ( = ?auto_910530 ?auto_910533 ) ) ( not ( = ?auto_910530 ?auto_910534 ) ) ( not ( = ?auto_910530 ?auto_910535 ) ) ( not ( = ?auto_910530 ?auto_910536 ) ) ( not ( = ?auto_910530 ?auto_910537 ) ) ( not ( = ?auto_910530 ?auto_910538 ) ) ( not ( = ?auto_910530 ?auto_910539 ) ) ( not ( = ?auto_910530 ?auto_910540 ) ) ( not ( = ?auto_910530 ?auto_910541 ) ) ( not ( = ?auto_910531 ?auto_910532 ) ) ( not ( = ?auto_910531 ?auto_910533 ) ) ( not ( = ?auto_910531 ?auto_910534 ) ) ( not ( = ?auto_910531 ?auto_910535 ) ) ( not ( = ?auto_910531 ?auto_910536 ) ) ( not ( = ?auto_910531 ?auto_910537 ) ) ( not ( = ?auto_910531 ?auto_910538 ) ) ( not ( = ?auto_910531 ?auto_910539 ) ) ( not ( = ?auto_910531 ?auto_910540 ) ) ( not ( = ?auto_910531 ?auto_910541 ) ) ( not ( = ?auto_910532 ?auto_910533 ) ) ( not ( = ?auto_910532 ?auto_910534 ) ) ( not ( = ?auto_910532 ?auto_910535 ) ) ( not ( = ?auto_910532 ?auto_910536 ) ) ( not ( = ?auto_910532 ?auto_910537 ) ) ( not ( = ?auto_910532 ?auto_910538 ) ) ( not ( = ?auto_910532 ?auto_910539 ) ) ( not ( = ?auto_910532 ?auto_910540 ) ) ( not ( = ?auto_910532 ?auto_910541 ) ) ( not ( = ?auto_910533 ?auto_910534 ) ) ( not ( = ?auto_910533 ?auto_910535 ) ) ( not ( = ?auto_910533 ?auto_910536 ) ) ( not ( = ?auto_910533 ?auto_910537 ) ) ( not ( = ?auto_910533 ?auto_910538 ) ) ( not ( = ?auto_910533 ?auto_910539 ) ) ( not ( = ?auto_910533 ?auto_910540 ) ) ( not ( = ?auto_910533 ?auto_910541 ) ) ( not ( = ?auto_910534 ?auto_910535 ) ) ( not ( = ?auto_910534 ?auto_910536 ) ) ( not ( = ?auto_910534 ?auto_910537 ) ) ( not ( = ?auto_910534 ?auto_910538 ) ) ( not ( = ?auto_910534 ?auto_910539 ) ) ( not ( = ?auto_910534 ?auto_910540 ) ) ( not ( = ?auto_910534 ?auto_910541 ) ) ( not ( = ?auto_910535 ?auto_910536 ) ) ( not ( = ?auto_910535 ?auto_910537 ) ) ( not ( = ?auto_910535 ?auto_910538 ) ) ( not ( = ?auto_910535 ?auto_910539 ) ) ( not ( = ?auto_910535 ?auto_910540 ) ) ( not ( = ?auto_910535 ?auto_910541 ) ) ( not ( = ?auto_910536 ?auto_910537 ) ) ( not ( = ?auto_910536 ?auto_910538 ) ) ( not ( = ?auto_910536 ?auto_910539 ) ) ( not ( = ?auto_910536 ?auto_910540 ) ) ( not ( = ?auto_910536 ?auto_910541 ) ) ( not ( = ?auto_910537 ?auto_910538 ) ) ( not ( = ?auto_910537 ?auto_910539 ) ) ( not ( = ?auto_910537 ?auto_910540 ) ) ( not ( = ?auto_910537 ?auto_910541 ) ) ( not ( = ?auto_910538 ?auto_910539 ) ) ( not ( = ?auto_910538 ?auto_910540 ) ) ( not ( = ?auto_910538 ?auto_910541 ) ) ( not ( = ?auto_910539 ?auto_910540 ) ) ( not ( = ?auto_910539 ?auto_910541 ) ) ( not ( = ?auto_910540 ?auto_910541 ) ) ( ON ?auto_910539 ?auto_910540 ) ( ON ?auto_910538 ?auto_910539 ) ( ON ?auto_910537 ?auto_910538 ) ( CLEAR ?auto_910535 ) ( ON ?auto_910536 ?auto_910537 ) ( CLEAR ?auto_910536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_910527 ?auto_910528 ?auto_910529 ?auto_910530 ?auto_910531 ?auto_910532 ?auto_910533 ?auto_910534 ?auto_910535 ?auto_910536 )
      ( MAKE-14PILE ?auto_910527 ?auto_910528 ?auto_910529 ?auto_910530 ?auto_910531 ?auto_910532 ?auto_910533 ?auto_910534 ?auto_910535 ?auto_910536 ?auto_910537 ?auto_910538 ?auto_910539 ?auto_910540 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910585 - BLOCK
      ?auto_910586 - BLOCK
      ?auto_910587 - BLOCK
      ?auto_910588 - BLOCK
      ?auto_910589 - BLOCK
      ?auto_910590 - BLOCK
      ?auto_910591 - BLOCK
      ?auto_910592 - BLOCK
      ?auto_910593 - BLOCK
      ?auto_910594 - BLOCK
      ?auto_910595 - BLOCK
      ?auto_910596 - BLOCK
      ?auto_910597 - BLOCK
      ?auto_910598 - BLOCK
    )
    :vars
    (
      ?auto_910599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910598 ?auto_910599 ) ( ON-TABLE ?auto_910585 ) ( ON ?auto_910586 ?auto_910585 ) ( ON ?auto_910587 ?auto_910586 ) ( ON ?auto_910588 ?auto_910587 ) ( ON ?auto_910589 ?auto_910588 ) ( ON ?auto_910590 ?auto_910589 ) ( ON ?auto_910591 ?auto_910590 ) ( ON ?auto_910592 ?auto_910591 ) ( not ( = ?auto_910585 ?auto_910586 ) ) ( not ( = ?auto_910585 ?auto_910587 ) ) ( not ( = ?auto_910585 ?auto_910588 ) ) ( not ( = ?auto_910585 ?auto_910589 ) ) ( not ( = ?auto_910585 ?auto_910590 ) ) ( not ( = ?auto_910585 ?auto_910591 ) ) ( not ( = ?auto_910585 ?auto_910592 ) ) ( not ( = ?auto_910585 ?auto_910593 ) ) ( not ( = ?auto_910585 ?auto_910594 ) ) ( not ( = ?auto_910585 ?auto_910595 ) ) ( not ( = ?auto_910585 ?auto_910596 ) ) ( not ( = ?auto_910585 ?auto_910597 ) ) ( not ( = ?auto_910585 ?auto_910598 ) ) ( not ( = ?auto_910585 ?auto_910599 ) ) ( not ( = ?auto_910586 ?auto_910587 ) ) ( not ( = ?auto_910586 ?auto_910588 ) ) ( not ( = ?auto_910586 ?auto_910589 ) ) ( not ( = ?auto_910586 ?auto_910590 ) ) ( not ( = ?auto_910586 ?auto_910591 ) ) ( not ( = ?auto_910586 ?auto_910592 ) ) ( not ( = ?auto_910586 ?auto_910593 ) ) ( not ( = ?auto_910586 ?auto_910594 ) ) ( not ( = ?auto_910586 ?auto_910595 ) ) ( not ( = ?auto_910586 ?auto_910596 ) ) ( not ( = ?auto_910586 ?auto_910597 ) ) ( not ( = ?auto_910586 ?auto_910598 ) ) ( not ( = ?auto_910586 ?auto_910599 ) ) ( not ( = ?auto_910587 ?auto_910588 ) ) ( not ( = ?auto_910587 ?auto_910589 ) ) ( not ( = ?auto_910587 ?auto_910590 ) ) ( not ( = ?auto_910587 ?auto_910591 ) ) ( not ( = ?auto_910587 ?auto_910592 ) ) ( not ( = ?auto_910587 ?auto_910593 ) ) ( not ( = ?auto_910587 ?auto_910594 ) ) ( not ( = ?auto_910587 ?auto_910595 ) ) ( not ( = ?auto_910587 ?auto_910596 ) ) ( not ( = ?auto_910587 ?auto_910597 ) ) ( not ( = ?auto_910587 ?auto_910598 ) ) ( not ( = ?auto_910587 ?auto_910599 ) ) ( not ( = ?auto_910588 ?auto_910589 ) ) ( not ( = ?auto_910588 ?auto_910590 ) ) ( not ( = ?auto_910588 ?auto_910591 ) ) ( not ( = ?auto_910588 ?auto_910592 ) ) ( not ( = ?auto_910588 ?auto_910593 ) ) ( not ( = ?auto_910588 ?auto_910594 ) ) ( not ( = ?auto_910588 ?auto_910595 ) ) ( not ( = ?auto_910588 ?auto_910596 ) ) ( not ( = ?auto_910588 ?auto_910597 ) ) ( not ( = ?auto_910588 ?auto_910598 ) ) ( not ( = ?auto_910588 ?auto_910599 ) ) ( not ( = ?auto_910589 ?auto_910590 ) ) ( not ( = ?auto_910589 ?auto_910591 ) ) ( not ( = ?auto_910589 ?auto_910592 ) ) ( not ( = ?auto_910589 ?auto_910593 ) ) ( not ( = ?auto_910589 ?auto_910594 ) ) ( not ( = ?auto_910589 ?auto_910595 ) ) ( not ( = ?auto_910589 ?auto_910596 ) ) ( not ( = ?auto_910589 ?auto_910597 ) ) ( not ( = ?auto_910589 ?auto_910598 ) ) ( not ( = ?auto_910589 ?auto_910599 ) ) ( not ( = ?auto_910590 ?auto_910591 ) ) ( not ( = ?auto_910590 ?auto_910592 ) ) ( not ( = ?auto_910590 ?auto_910593 ) ) ( not ( = ?auto_910590 ?auto_910594 ) ) ( not ( = ?auto_910590 ?auto_910595 ) ) ( not ( = ?auto_910590 ?auto_910596 ) ) ( not ( = ?auto_910590 ?auto_910597 ) ) ( not ( = ?auto_910590 ?auto_910598 ) ) ( not ( = ?auto_910590 ?auto_910599 ) ) ( not ( = ?auto_910591 ?auto_910592 ) ) ( not ( = ?auto_910591 ?auto_910593 ) ) ( not ( = ?auto_910591 ?auto_910594 ) ) ( not ( = ?auto_910591 ?auto_910595 ) ) ( not ( = ?auto_910591 ?auto_910596 ) ) ( not ( = ?auto_910591 ?auto_910597 ) ) ( not ( = ?auto_910591 ?auto_910598 ) ) ( not ( = ?auto_910591 ?auto_910599 ) ) ( not ( = ?auto_910592 ?auto_910593 ) ) ( not ( = ?auto_910592 ?auto_910594 ) ) ( not ( = ?auto_910592 ?auto_910595 ) ) ( not ( = ?auto_910592 ?auto_910596 ) ) ( not ( = ?auto_910592 ?auto_910597 ) ) ( not ( = ?auto_910592 ?auto_910598 ) ) ( not ( = ?auto_910592 ?auto_910599 ) ) ( not ( = ?auto_910593 ?auto_910594 ) ) ( not ( = ?auto_910593 ?auto_910595 ) ) ( not ( = ?auto_910593 ?auto_910596 ) ) ( not ( = ?auto_910593 ?auto_910597 ) ) ( not ( = ?auto_910593 ?auto_910598 ) ) ( not ( = ?auto_910593 ?auto_910599 ) ) ( not ( = ?auto_910594 ?auto_910595 ) ) ( not ( = ?auto_910594 ?auto_910596 ) ) ( not ( = ?auto_910594 ?auto_910597 ) ) ( not ( = ?auto_910594 ?auto_910598 ) ) ( not ( = ?auto_910594 ?auto_910599 ) ) ( not ( = ?auto_910595 ?auto_910596 ) ) ( not ( = ?auto_910595 ?auto_910597 ) ) ( not ( = ?auto_910595 ?auto_910598 ) ) ( not ( = ?auto_910595 ?auto_910599 ) ) ( not ( = ?auto_910596 ?auto_910597 ) ) ( not ( = ?auto_910596 ?auto_910598 ) ) ( not ( = ?auto_910596 ?auto_910599 ) ) ( not ( = ?auto_910597 ?auto_910598 ) ) ( not ( = ?auto_910597 ?auto_910599 ) ) ( not ( = ?auto_910598 ?auto_910599 ) ) ( ON ?auto_910597 ?auto_910598 ) ( ON ?auto_910596 ?auto_910597 ) ( ON ?auto_910595 ?auto_910596 ) ( ON ?auto_910594 ?auto_910595 ) ( CLEAR ?auto_910592 ) ( ON ?auto_910593 ?auto_910594 ) ( CLEAR ?auto_910593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_910585 ?auto_910586 ?auto_910587 ?auto_910588 ?auto_910589 ?auto_910590 ?auto_910591 ?auto_910592 ?auto_910593 )
      ( MAKE-14PILE ?auto_910585 ?auto_910586 ?auto_910587 ?auto_910588 ?auto_910589 ?auto_910590 ?auto_910591 ?auto_910592 ?auto_910593 ?auto_910594 ?auto_910595 ?auto_910596 ?auto_910597 ?auto_910598 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910643 - BLOCK
      ?auto_910644 - BLOCK
      ?auto_910645 - BLOCK
      ?auto_910646 - BLOCK
      ?auto_910647 - BLOCK
      ?auto_910648 - BLOCK
      ?auto_910649 - BLOCK
      ?auto_910650 - BLOCK
      ?auto_910651 - BLOCK
      ?auto_910652 - BLOCK
      ?auto_910653 - BLOCK
      ?auto_910654 - BLOCK
      ?auto_910655 - BLOCK
      ?auto_910656 - BLOCK
    )
    :vars
    (
      ?auto_910657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910656 ?auto_910657 ) ( ON-TABLE ?auto_910643 ) ( ON ?auto_910644 ?auto_910643 ) ( ON ?auto_910645 ?auto_910644 ) ( ON ?auto_910646 ?auto_910645 ) ( ON ?auto_910647 ?auto_910646 ) ( ON ?auto_910648 ?auto_910647 ) ( ON ?auto_910649 ?auto_910648 ) ( not ( = ?auto_910643 ?auto_910644 ) ) ( not ( = ?auto_910643 ?auto_910645 ) ) ( not ( = ?auto_910643 ?auto_910646 ) ) ( not ( = ?auto_910643 ?auto_910647 ) ) ( not ( = ?auto_910643 ?auto_910648 ) ) ( not ( = ?auto_910643 ?auto_910649 ) ) ( not ( = ?auto_910643 ?auto_910650 ) ) ( not ( = ?auto_910643 ?auto_910651 ) ) ( not ( = ?auto_910643 ?auto_910652 ) ) ( not ( = ?auto_910643 ?auto_910653 ) ) ( not ( = ?auto_910643 ?auto_910654 ) ) ( not ( = ?auto_910643 ?auto_910655 ) ) ( not ( = ?auto_910643 ?auto_910656 ) ) ( not ( = ?auto_910643 ?auto_910657 ) ) ( not ( = ?auto_910644 ?auto_910645 ) ) ( not ( = ?auto_910644 ?auto_910646 ) ) ( not ( = ?auto_910644 ?auto_910647 ) ) ( not ( = ?auto_910644 ?auto_910648 ) ) ( not ( = ?auto_910644 ?auto_910649 ) ) ( not ( = ?auto_910644 ?auto_910650 ) ) ( not ( = ?auto_910644 ?auto_910651 ) ) ( not ( = ?auto_910644 ?auto_910652 ) ) ( not ( = ?auto_910644 ?auto_910653 ) ) ( not ( = ?auto_910644 ?auto_910654 ) ) ( not ( = ?auto_910644 ?auto_910655 ) ) ( not ( = ?auto_910644 ?auto_910656 ) ) ( not ( = ?auto_910644 ?auto_910657 ) ) ( not ( = ?auto_910645 ?auto_910646 ) ) ( not ( = ?auto_910645 ?auto_910647 ) ) ( not ( = ?auto_910645 ?auto_910648 ) ) ( not ( = ?auto_910645 ?auto_910649 ) ) ( not ( = ?auto_910645 ?auto_910650 ) ) ( not ( = ?auto_910645 ?auto_910651 ) ) ( not ( = ?auto_910645 ?auto_910652 ) ) ( not ( = ?auto_910645 ?auto_910653 ) ) ( not ( = ?auto_910645 ?auto_910654 ) ) ( not ( = ?auto_910645 ?auto_910655 ) ) ( not ( = ?auto_910645 ?auto_910656 ) ) ( not ( = ?auto_910645 ?auto_910657 ) ) ( not ( = ?auto_910646 ?auto_910647 ) ) ( not ( = ?auto_910646 ?auto_910648 ) ) ( not ( = ?auto_910646 ?auto_910649 ) ) ( not ( = ?auto_910646 ?auto_910650 ) ) ( not ( = ?auto_910646 ?auto_910651 ) ) ( not ( = ?auto_910646 ?auto_910652 ) ) ( not ( = ?auto_910646 ?auto_910653 ) ) ( not ( = ?auto_910646 ?auto_910654 ) ) ( not ( = ?auto_910646 ?auto_910655 ) ) ( not ( = ?auto_910646 ?auto_910656 ) ) ( not ( = ?auto_910646 ?auto_910657 ) ) ( not ( = ?auto_910647 ?auto_910648 ) ) ( not ( = ?auto_910647 ?auto_910649 ) ) ( not ( = ?auto_910647 ?auto_910650 ) ) ( not ( = ?auto_910647 ?auto_910651 ) ) ( not ( = ?auto_910647 ?auto_910652 ) ) ( not ( = ?auto_910647 ?auto_910653 ) ) ( not ( = ?auto_910647 ?auto_910654 ) ) ( not ( = ?auto_910647 ?auto_910655 ) ) ( not ( = ?auto_910647 ?auto_910656 ) ) ( not ( = ?auto_910647 ?auto_910657 ) ) ( not ( = ?auto_910648 ?auto_910649 ) ) ( not ( = ?auto_910648 ?auto_910650 ) ) ( not ( = ?auto_910648 ?auto_910651 ) ) ( not ( = ?auto_910648 ?auto_910652 ) ) ( not ( = ?auto_910648 ?auto_910653 ) ) ( not ( = ?auto_910648 ?auto_910654 ) ) ( not ( = ?auto_910648 ?auto_910655 ) ) ( not ( = ?auto_910648 ?auto_910656 ) ) ( not ( = ?auto_910648 ?auto_910657 ) ) ( not ( = ?auto_910649 ?auto_910650 ) ) ( not ( = ?auto_910649 ?auto_910651 ) ) ( not ( = ?auto_910649 ?auto_910652 ) ) ( not ( = ?auto_910649 ?auto_910653 ) ) ( not ( = ?auto_910649 ?auto_910654 ) ) ( not ( = ?auto_910649 ?auto_910655 ) ) ( not ( = ?auto_910649 ?auto_910656 ) ) ( not ( = ?auto_910649 ?auto_910657 ) ) ( not ( = ?auto_910650 ?auto_910651 ) ) ( not ( = ?auto_910650 ?auto_910652 ) ) ( not ( = ?auto_910650 ?auto_910653 ) ) ( not ( = ?auto_910650 ?auto_910654 ) ) ( not ( = ?auto_910650 ?auto_910655 ) ) ( not ( = ?auto_910650 ?auto_910656 ) ) ( not ( = ?auto_910650 ?auto_910657 ) ) ( not ( = ?auto_910651 ?auto_910652 ) ) ( not ( = ?auto_910651 ?auto_910653 ) ) ( not ( = ?auto_910651 ?auto_910654 ) ) ( not ( = ?auto_910651 ?auto_910655 ) ) ( not ( = ?auto_910651 ?auto_910656 ) ) ( not ( = ?auto_910651 ?auto_910657 ) ) ( not ( = ?auto_910652 ?auto_910653 ) ) ( not ( = ?auto_910652 ?auto_910654 ) ) ( not ( = ?auto_910652 ?auto_910655 ) ) ( not ( = ?auto_910652 ?auto_910656 ) ) ( not ( = ?auto_910652 ?auto_910657 ) ) ( not ( = ?auto_910653 ?auto_910654 ) ) ( not ( = ?auto_910653 ?auto_910655 ) ) ( not ( = ?auto_910653 ?auto_910656 ) ) ( not ( = ?auto_910653 ?auto_910657 ) ) ( not ( = ?auto_910654 ?auto_910655 ) ) ( not ( = ?auto_910654 ?auto_910656 ) ) ( not ( = ?auto_910654 ?auto_910657 ) ) ( not ( = ?auto_910655 ?auto_910656 ) ) ( not ( = ?auto_910655 ?auto_910657 ) ) ( not ( = ?auto_910656 ?auto_910657 ) ) ( ON ?auto_910655 ?auto_910656 ) ( ON ?auto_910654 ?auto_910655 ) ( ON ?auto_910653 ?auto_910654 ) ( ON ?auto_910652 ?auto_910653 ) ( ON ?auto_910651 ?auto_910652 ) ( CLEAR ?auto_910649 ) ( ON ?auto_910650 ?auto_910651 ) ( CLEAR ?auto_910650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_910643 ?auto_910644 ?auto_910645 ?auto_910646 ?auto_910647 ?auto_910648 ?auto_910649 ?auto_910650 )
      ( MAKE-14PILE ?auto_910643 ?auto_910644 ?auto_910645 ?auto_910646 ?auto_910647 ?auto_910648 ?auto_910649 ?auto_910650 ?auto_910651 ?auto_910652 ?auto_910653 ?auto_910654 ?auto_910655 ?auto_910656 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910701 - BLOCK
      ?auto_910702 - BLOCK
      ?auto_910703 - BLOCK
      ?auto_910704 - BLOCK
      ?auto_910705 - BLOCK
      ?auto_910706 - BLOCK
      ?auto_910707 - BLOCK
      ?auto_910708 - BLOCK
      ?auto_910709 - BLOCK
      ?auto_910710 - BLOCK
      ?auto_910711 - BLOCK
      ?auto_910712 - BLOCK
      ?auto_910713 - BLOCK
      ?auto_910714 - BLOCK
    )
    :vars
    (
      ?auto_910715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910714 ?auto_910715 ) ( ON-TABLE ?auto_910701 ) ( ON ?auto_910702 ?auto_910701 ) ( ON ?auto_910703 ?auto_910702 ) ( ON ?auto_910704 ?auto_910703 ) ( ON ?auto_910705 ?auto_910704 ) ( ON ?auto_910706 ?auto_910705 ) ( not ( = ?auto_910701 ?auto_910702 ) ) ( not ( = ?auto_910701 ?auto_910703 ) ) ( not ( = ?auto_910701 ?auto_910704 ) ) ( not ( = ?auto_910701 ?auto_910705 ) ) ( not ( = ?auto_910701 ?auto_910706 ) ) ( not ( = ?auto_910701 ?auto_910707 ) ) ( not ( = ?auto_910701 ?auto_910708 ) ) ( not ( = ?auto_910701 ?auto_910709 ) ) ( not ( = ?auto_910701 ?auto_910710 ) ) ( not ( = ?auto_910701 ?auto_910711 ) ) ( not ( = ?auto_910701 ?auto_910712 ) ) ( not ( = ?auto_910701 ?auto_910713 ) ) ( not ( = ?auto_910701 ?auto_910714 ) ) ( not ( = ?auto_910701 ?auto_910715 ) ) ( not ( = ?auto_910702 ?auto_910703 ) ) ( not ( = ?auto_910702 ?auto_910704 ) ) ( not ( = ?auto_910702 ?auto_910705 ) ) ( not ( = ?auto_910702 ?auto_910706 ) ) ( not ( = ?auto_910702 ?auto_910707 ) ) ( not ( = ?auto_910702 ?auto_910708 ) ) ( not ( = ?auto_910702 ?auto_910709 ) ) ( not ( = ?auto_910702 ?auto_910710 ) ) ( not ( = ?auto_910702 ?auto_910711 ) ) ( not ( = ?auto_910702 ?auto_910712 ) ) ( not ( = ?auto_910702 ?auto_910713 ) ) ( not ( = ?auto_910702 ?auto_910714 ) ) ( not ( = ?auto_910702 ?auto_910715 ) ) ( not ( = ?auto_910703 ?auto_910704 ) ) ( not ( = ?auto_910703 ?auto_910705 ) ) ( not ( = ?auto_910703 ?auto_910706 ) ) ( not ( = ?auto_910703 ?auto_910707 ) ) ( not ( = ?auto_910703 ?auto_910708 ) ) ( not ( = ?auto_910703 ?auto_910709 ) ) ( not ( = ?auto_910703 ?auto_910710 ) ) ( not ( = ?auto_910703 ?auto_910711 ) ) ( not ( = ?auto_910703 ?auto_910712 ) ) ( not ( = ?auto_910703 ?auto_910713 ) ) ( not ( = ?auto_910703 ?auto_910714 ) ) ( not ( = ?auto_910703 ?auto_910715 ) ) ( not ( = ?auto_910704 ?auto_910705 ) ) ( not ( = ?auto_910704 ?auto_910706 ) ) ( not ( = ?auto_910704 ?auto_910707 ) ) ( not ( = ?auto_910704 ?auto_910708 ) ) ( not ( = ?auto_910704 ?auto_910709 ) ) ( not ( = ?auto_910704 ?auto_910710 ) ) ( not ( = ?auto_910704 ?auto_910711 ) ) ( not ( = ?auto_910704 ?auto_910712 ) ) ( not ( = ?auto_910704 ?auto_910713 ) ) ( not ( = ?auto_910704 ?auto_910714 ) ) ( not ( = ?auto_910704 ?auto_910715 ) ) ( not ( = ?auto_910705 ?auto_910706 ) ) ( not ( = ?auto_910705 ?auto_910707 ) ) ( not ( = ?auto_910705 ?auto_910708 ) ) ( not ( = ?auto_910705 ?auto_910709 ) ) ( not ( = ?auto_910705 ?auto_910710 ) ) ( not ( = ?auto_910705 ?auto_910711 ) ) ( not ( = ?auto_910705 ?auto_910712 ) ) ( not ( = ?auto_910705 ?auto_910713 ) ) ( not ( = ?auto_910705 ?auto_910714 ) ) ( not ( = ?auto_910705 ?auto_910715 ) ) ( not ( = ?auto_910706 ?auto_910707 ) ) ( not ( = ?auto_910706 ?auto_910708 ) ) ( not ( = ?auto_910706 ?auto_910709 ) ) ( not ( = ?auto_910706 ?auto_910710 ) ) ( not ( = ?auto_910706 ?auto_910711 ) ) ( not ( = ?auto_910706 ?auto_910712 ) ) ( not ( = ?auto_910706 ?auto_910713 ) ) ( not ( = ?auto_910706 ?auto_910714 ) ) ( not ( = ?auto_910706 ?auto_910715 ) ) ( not ( = ?auto_910707 ?auto_910708 ) ) ( not ( = ?auto_910707 ?auto_910709 ) ) ( not ( = ?auto_910707 ?auto_910710 ) ) ( not ( = ?auto_910707 ?auto_910711 ) ) ( not ( = ?auto_910707 ?auto_910712 ) ) ( not ( = ?auto_910707 ?auto_910713 ) ) ( not ( = ?auto_910707 ?auto_910714 ) ) ( not ( = ?auto_910707 ?auto_910715 ) ) ( not ( = ?auto_910708 ?auto_910709 ) ) ( not ( = ?auto_910708 ?auto_910710 ) ) ( not ( = ?auto_910708 ?auto_910711 ) ) ( not ( = ?auto_910708 ?auto_910712 ) ) ( not ( = ?auto_910708 ?auto_910713 ) ) ( not ( = ?auto_910708 ?auto_910714 ) ) ( not ( = ?auto_910708 ?auto_910715 ) ) ( not ( = ?auto_910709 ?auto_910710 ) ) ( not ( = ?auto_910709 ?auto_910711 ) ) ( not ( = ?auto_910709 ?auto_910712 ) ) ( not ( = ?auto_910709 ?auto_910713 ) ) ( not ( = ?auto_910709 ?auto_910714 ) ) ( not ( = ?auto_910709 ?auto_910715 ) ) ( not ( = ?auto_910710 ?auto_910711 ) ) ( not ( = ?auto_910710 ?auto_910712 ) ) ( not ( = ?auto_910710 ?auto_910713 ) ) ( not ( = ?auto_910710 ?auto_910714 ) ) ( not ( = ?auto_910710 ?auto_910715 ) ) ( not ( = ?auto_910711 ?auto_910712 ) ) ( not ( = ?auto_910711 ?auto_910713 ) ) ( not ( = ?auto_910711 ?auto_910714 ) ) ( not ( = ?auto_910711 ?auto_910715 ) ) ( not ( = ?auto_910712 ?auto_910713 ) ) ( not ( = ?auto_910712 ?auto_910714 ) ) ( not ( = ?auto_910712 ?auto_910715 ) ) ( not ( = ?auto_910713 ?auto_910714 ) ) ( not ( = ?auto_910713 ?auto_910715 ) ) ( not ( = ?auto_910714 ?auto_910715 ) ) ( ON ?auto_910713 ?auto_910714 ) ( ON ?auto_910712 ?auto_910713 ) ( ON ?auto_910711 ?auto_910712 ) ( ON ?auto_910710 ?auto_910711 ) ( ON ?auto_910709 ?auto_910710 ) ( ON ?auto_910708 ?auto_910709 ) ( CLEAR ?auto_910706 ) ( ON ?auto_910707 ?auto_910708 ) ( CLEAR ?auto_910707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_910701 ?auto_910702 ?auto_910703 ?auto_910704 ?auto_910705 ?auto_910706 ?auto_910707 )
      ( MAKE-14PILE ?auto_910701 ?auto_910702 ?auto_910703 ?auto_910704 ?auto_910705 ?auto_910706 ?auto_910707 ?auto_910708 ?auto_910709 ?auto_910710 ?auto_910711 ?auto_910712 ?auto_910713 ?auto_910714 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910759 - BLOCK
      ?auto_910760 - BLOCK
      ?auto_910761 - BLOCK
      ?auto_910762 - BLOCK
      ?auto_910763 - BLOCK
      ?auto_910764 - BLOCK
      ?auto_910765 - BLOCK
      ?auto_910766 - BLOCK
      ?auto_910767 - BLOCK
      ?auto_910768 - BLOCK
      ?auto_910769 - BLOCK
      ?auto_910770 - BLOCK
      ?auto_910771 - BLOCK
      ?auto_910772 - BLOCK
    )
    :vars
    (
      ?auto_910773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910772 ?auto_910773 ) ( ON-TABLE ?auto_910759 ) ( ON ?auto_910760 ?auto_910759 ) ( ON ?auto_910761 ?auto_910760 ) ( ON ?auto_910762 ?auto_910761 ) ( ON ?auto_910763 ?auto_910762 ) ( not ( = ?auto_910759 ?auto_910760 ) ) ( not ( = ?auto_910759 ?auto_910761 ) ) ( not ( = ?auto_910759 ?auto_910762 ) ) ( not ( = ?auto_910759 ?auto_910763 ) ) ( not ( = ?auto_910759 ?auto_910764 ) ) ( not ( = ?auto_910759 ?auto_910765 ) ) ( not ( = ?auto_910759 ?auto_910766 ) ) ( not ( = ?auto_910759 ?auto_910767 ) ) ( not ( = ?auto_910759 ?auto_910768 ) ) ( not ( = ?auto_910759 ?auto_910769 ) ) ( not ( = ?auto_910759 ?auto_910770 ) ) ( not ( = ?auto_910759 ?auto_910771 ) ) ( not ( = ?auto_910759 ?auto_910772 ) ) ( not ( = ?auto_910759 ?auto_910773 ) ) ( not ( = ?auto_910760 ?auto_910761 ) ) ( not ( = ?auto_910760 ?auto_910762 ) ) ( not ( = ?auto_910760 ?auto_910763 ) ) ( not ( = ?auto_910760 ?auto_910764 ) ) ( not ( = ?auto_910760 ?auto_910765 ) ) ( not ( = ?auto_910760 ?auto_910766 ) ) ( not ( = ?auto_910760 ?auto_910767 ) ) ( not ( = ?auto_910760 ?auto_910768 ) ) ( not ( = ?auto_910760 ?auto_910769 ) ) ( not ( = ?auto_910760 ?auto_910770 ) ) ( not ( = ?auto_910760 ?auto_910771 ) ) ( not ( = ?auto_910760 ?auto_910772 ) ) ( not ( = ?auto_910760 ?auto_910773 ) ) ( not ( = ?auto_910761 ?auto_910762 ) ) ( not ( = ?auto_910761 ?auto_910763 ) ) ( not ( = ?auto_910761 ?auto_910764 ) ) ( not ( = ?auto_910761 ?auto_910765 ) ) ( not ( = ?auto_910761 ?auto_910766 ) ) ( not ( = ?auto_910761 ?auto_910767 ) ) ( not ( = ?auto_910761 ?auto_910768 ) ) ( not ( = ?auto_910761 ?auto_910769 ) ) ( not ( = ?auto_910761 ?auto_910770 ) ) ( not ( = ?auto_910761 ?auto_910771 ) ) ( not ( = ?auto_910761 ?auto_910772 ) ) ( not ( = ?auto_910761 ?auto_910773 ) ) ( not ( = ?auto_910762 ?auto_910763 ) ) ( not ( = ?auto_910762 ?auto_910764 ) ) ( not ( = ?auto_910762 ?auto_910765 ) ) ( not ( = ?auto_910762 ?auto_910766 ) ) ( not ( = ?auto_910762 ?auto_910767 ) ) ( not ( = ?auto_910762 ?auto_910768 ) ) ( not ( = ?auto_910762 ?auto_910769 ) ) ( not ( = ?auto_910762 ?auto_910770 ) ) ( not ( = ?auto_910762 ?auto_910771 ) ) ( not ( = ?auto_910762 ?auto_910772 ) ) ( not ( = ?auto_910762 ?auto_910773 ) ) ( not ( = ?auto_910763 ?auto_910764 ) ) ( not ( = ?auto_910763 ?auto_910765 ) ) ( not ( = ?auto_910763 ?auto_910766 ) ) ( not ( = ?auto_910763 ?auto_910767 ) ) ( not ( = ?auto_910763 ?auto_910768 ) ) ( not ( = ?auto_910763 ?auto_910769 ) ) ( not ( = ?auto_910763 ?auto_910770 ) ) ( not ( = ?auto_910763 ?auto_910771 ) ) ( not ( = ?auto_910763 ?auto_910772 ) ) ( not ( = ?auto_910763 ?auto_910773 ) ) ( not ( = ?auto_910764 ?auto_910765 ) ) ( not ( = ?auto_910764 ?auto_910766 ) ) ( not ( = ?auto_910764 ?auto_910767 ) ) ( not ( = ?auto_910764 ?auto_910768 ) ) ( not ( = ?auto_910764 ?auto_910769 ) ) ( not ( = ?auto_910764 ?auto_910770 ) ) ( not ( = ?auto_910764 ?auto_910771 ) ) ( not ( = ?auto_910764 ?auto_910772 ) ) ( not ( = ?auto_910764 ?auto_910773 ) ) ( not ( = ?auto_910765 ?auto_910766 ) ) ( not ( = ?auto_910765 ?auto_910767 ) ) ( not ( = ?auto_910765 ?auto_910768 ) ) ( not ( = ?auto_910765 ?auto_910769 ) ) ( not ( = ?auto_910765 ?auto_910770 ) ) ( not ( = ?auto_910765 ?auto_910771 ) ) ( not ( = ?auto_910765 ?auto_910772 ) ) ( not ( = ?auto_910765 ?auto_910773 ) ) ( not ( = ?auto_910766 ?auto_910767 ) ) ( not ( = ?auto_910766 ?auto_910768 ) ) ( not ( = ?auto_910766 ?auto_910769 ) ) ( not ( = ?auto_910766 ?auto_910770 ) ) ( not ( = ?auto_910766 ?auto_910771 ) ) ( not ( = ?auto_910766 ?auto_910772 ) ) ( not ( = ?auto_910766 ?auto_910773 ) ) ( not ( = ?auto_910767 ?auto_910768 ) ) ( not ( = ?auto_910767 ?auto_910769 ) ) ( not ( = ?auto_910767 ?auto_910770 ) ) ( not ( = ?auto_910767 ?auto_910771 ) ) ( not ( = ?auto_910767 ?auto_910772 ) ) ( not ( = ?auto_910767 ?auto_910773 ) ) ( not ( = ?auto_910768 ?auto_910769 ) ) ( not ( = ?auto_910768 ?auto_910770 ) ) ( not ( = ?auto_910768 ?auto_910771 ) ) ( not ( = ?auto_910768 ?auto_910772 ) ) ( not ( = ?auto_910768 ?auto_910773 ) ) ( not ( = ?auto_910769 ?auto_910770 ) ) ( not ( = ?auto_910769 ?auto_910771 ) ) ( not ( = ?auto_910769 ?auto_910772 ) ) ( not ( = ?auto_910769 ?auto_910773 ) ) ( not ( = ?auto_910770 ?auto_910771 ) ) ( not ( = ?auto_910770 ?auto_910772 ) ) ( not ( = ?auto_910770 ?auto_910773 ) ) ( not ( = ?auto_910771 ?auto_910772 ) ) ( not ( = ?auto_910771 ?auto_910773 ) ) ( not ( = ?auto_910772 ?auto_910773 ) ) ( ON ?auto_910771 ?auto_910772 ) ( ON ?auto_910770 ?auto_910771 ) ( ON ?auto_910769 ?auto_910770 ) ( ON ?auto_910768 ?auto_910769 ) ( ON ?auto_910767 ?auto_910768 ) ( ON ?auto_910766 ?auto_910767 ) ( ON ?auto_910765 ?auto_910766 ) ( CLEAR ?auto_910763 ) ( ON ?auto_910764 ?auto_910765 ) ( CLEAR ?auto_910764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_910759 ?auto_910760 ?auto_910761 ?auto_910762 ?auto_910763 ?auto_910764 )
      ( MAKE-14PILE ?auto_910759 ?auto_910760 ?auto_910761 ?auto_910762 ?auto_910763 ?auto_910764 ?auto_910765 ?auto_910766 ?auto_910767 ?auto_910768 ?auto_910769 ?auto_910770 ?auto_910771 ?auto_910772 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910817 - BLOCK
      ?auto_910818 - BLOCK
      ?auto_910819 - BLOCK
      ?auto_910820 - BLOCK
      ?auto_910821 - BLOCK
      ?auto_910822 - BLOCK
      ?auto_910823 - BLOCK
      ?auto_910824 - BLOCK
      ?auto_910825 - BLOCK
      ?auto_910826 - BLOCK
      ?auto_910827 - BLOCK
      ?auto_910828 - BLOCK
      ?auto_910829 - BLOCK
      ?auto_910830 - BLOCK
    )
    :vars
    (
      ?auto_910831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910830 ?auto_910831 ) ( ON-TABLE ?auto_910817 ) ( ON ?auto_910818 ?auto_910817 ) ( ON ?auto_910819 ?auto_910818 ) ( ON ?auto_910820 ?auto_910819 ) ( not ( = ?auto_910817 ?auto_910818 ) ) ( not ( = ?auto_910817 ?auto_910819 ) ) ( not ( = ?auto_910817 ?auto_910820 ) ) ( not ( = ?auto_910817 ?auto_910821 ) ) ( not ( = ?auto_910817 ?auto_910822 ) ) ( not ( = ?auto_910817 ?auto_910823 ) ) ( not ( = ?auto_910817 ?auto_910824 ) ) ( not ( = ?auto_910817 ?auto_910825 ) ) ( not ( = ?auto_910817 ?auto_910826 ) ) ( not ( = ?auto_910817 ?auto_910827 ) ) ( not ( = ?auto_910817 ?auto_910828 ) ) ( not ( = ?auto_910817 ?auto_910829 ) ) ( not ( = ?auto_910817 ?auto_910830 ) ) ( not ( = ?auto_910817 ?auto_910831 ) ) ( not ( = ?auto_910818 ?auto_910819 ) ) ( not ( = ?auto_910818 ?auto_910820 ) ) ( not ( = ?auto_910818 ?auto_910821 ) ) ( not ( = ?auto_910818 ?auto_910822 ) ) ( not ( = ?auto_910818 ?auto_910823 ) ) ( not ( = ?auto_910818 ?auto_910824 ) ) ( not ( = ?auto_910818 ?auto_910825 ) ) ( not ( = ?auto_910818 ?auto_910826 ) ) ( not ( = ?auto_910818 ?auto_910827 ) ) ( not ( = ?auto_910818 ?auto_910828 ) ) ( not ( = ?auto_910818 ?auto_910829 ) ) ( not ( = ?auto_910818 ?auto_910830 ) ) ( not ( = ?auto_910818 ?auto_910831 ) ) ( not ( = ?auto_910819 ?auto_910820 ) ) ( not ( = ?auto_910819 ?auto_910821 ) ) ( not ( = ?auto_910819 ?auto_910822 ) ) ( not ( = ?auto_910819 ?auto_910823 ) ) ( not ( = ?auto_910819 ?auto_910824 ) ) ( not ( = ?auto_910819 ?auto_910825 ) ) ( not ( = ?auto_910819 ?auto_910826 ) ) ( not ( = ?auto_910819 ?auto_910827 ) ) ( not ( = ?auto_910819 ?auto_910828 ) ) ( not ( = ?auto_910819 ?auto_910829 ) ) ( not ( = ?auto_910819 ?auto_910830 ) ) ( not ( = ?auto_910819 ?auto_910831 ) ) ( not ( = ?auto_910820 ?auto_910821 ) ) ( not ( = ?auto_910820 ?auto_910822 ) ) ( not ( = ?auto_910820 ?auto_910823 ) ) ( not ( = ?auto_910820 ?auto_910824 ) ) ( not ( = ?auto_910820 ?auto_910825 ) ) ( not ( = ?auto_910820 ?auto_910826 ) ) ( not ( = ?auto_910820 ?auto_910827 ) ) ( not ( = ?auto_910820 ?auto_910828 ) ) ( not ( = ?auto_910820 ?auto_910829 ) ) ( not ( = ?auto_910820 ?auto_910830 ) ) ( not ( = ?auto_910820 ?auto_910831 ) ) ( not ( = ?auto_910821 ?auto_910822 ) ) ( not ( = ?auto_910821 ?auto_910823 ) ) ( not ( = ?auto_910821 ?auto_910824 ) ) ( not ( = ?auto_910821 ?auto_910825 ) ) ( not ( = ?auto_910821 ?auto_910826 ) ) ( not ( = ?auto_910821 ?auto_910827 ) ) ( not ( = ?auto_910821 ?auto_910828 ) ) ( not ( = ?auto_910821 ?auto_910829 ) ) ( not ( = ?auto_910821 ?auto_910830 ) ) ( not ( = ?auto_910821 ?auto_910831 ) ) ( not ( = ?auto_910822 ?auto_910823 ) ) ( not ( = ?auto_910822 ?auto_910824 ) ) ( not ( = ?auto_910822 ?auto_910825 ) ) ( not ( = ?auto_910822 ?auto_910826 ) ) ( not ( = ?auto_910822 ?auto_910827 ) ) ( not ( = ?auto_910822 ?auto_910828 ) ) ( not ( = ?auto_910822 ?auto_910829 ) ) ( not ( = ?auto_910822 ?auto_910830 ) ) ( not ( = ?auto_910822 ?auto_910831 ) ) ( not ( = ?auto_910823 ?auto_910824 ) ) ( not ( = ?auto_910823 ?auto_910825 ) ) ( not ( = ?auto_910823 ?auto_910826 ) ) ( not ( = ?auto_910823 ?auto_910827 ) ) ( not ( = ?auto_910823 ?auto_910828 ) ) ( not ( = ?auto_910823 ?auto_910829 ) ) ( not ( = ?auto_910823 ?auto_910830 ) ) ( not ( = ?auto_910823 ?auto_910831 ) ) ( not ( = ?auto_910824 ?auto_910825 ) ) ( not ( = ?auto_910824 ?auto_910826 ) ) ( not ( = ?auto_910824 ?auto_910827 ) ) ( not ( = ?auto_910824 ?auto_910828 ) ) ( not ( = ?auto_910824 ?auto_910829 ) ) ( not ( = ?auto_910824 ?auto_910830 ) ) ( not ( = ?auto_910824 ?auto_910831 ) ) ( not ( = ?auto_910825 ?auto_910826 ) ) ( not ( = ?auto_910825 ?auto_910827 ) ) ( not ( = ?auto_910825 ?auto_910828 ) ) ( not ( = ?auto_910825 ?auto_910829 ) ) ( not ( = ?auto_910825 ?auto_910830 ) ) ( not ( = ?auto_910825 ?auto_910831 ) ) ( not ( = ?auto_910826 ?auto_910827 ) ) ( not ( = ?auto_910826 ?auto_910828 ) ) ( not ( = ?auto_910826 ?auto_910829 ) ) ( not ( = ?auto_910826 ?auto_910830 ) ) ( not ( = ?auto_910826 ?auto_910831 ) ) ( not ( = ?auto_910827 ?auto_910828 ) ) ( not ( = ?auto_910827 ?auto_910829 ) ) ( not ( = ?auto_910827 ?auto_910830 ) ) ( not ( = ?auto_910827 ?auto_910831 ) ) ( not ( = ?auto_910828 ?auto_910829 ) ) ( not ( = ?auto_910828 ?auto_910830 ) ) ( not ( = ?auto_910828 ?auto_910831 ) ) ( not ( = ?auto_910829 ?auto_910830 ) ) ( not ( = ?auto_910829 ?auto_910831 ) ) ( not ( = ?auto_910830 ?auto_910831 ) ) ( ON ?auto_910829 ?auto_910830 ) ( ON ?auto_910828 ?auto_910829 ) ( ON ?auto_910827 ?auto_910828 ) ( ON ?auto_910826 ?auto_910827 ) ( ON ?auto_910825 ?auto_910826 ) ( ON ?auto_910824 ?auto_910825 ) ( ON ?auto_910823 ?auto_910824 ) ( ON ?auto_910822 ?auto_910823 ) ( CLEAR ?auto_910820 ) ( ON ?auto_910821 ?auto_910822 ) ( CLEAR ?auto_910821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_910817 ?auto_910818 ?auto_910819 ?auto_910820 ?auto_910821 )
      ( MAKE-14PILE ?auto_910817 ?auto_910818 ?auto_910819 ?auto_910820 ?auto_910821 ?auto_910822 ?auto_910823 ?auto_910824 ?auto_910825 ?auto_910826 ?auto_910827 ?auto_910828 ?auto_910829 ?auto_910830 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910875 - BLOCK
      ?auto_910876 - BLOCK
      ?auto_910877 - BLOCK
      ?auto_910878 - BLOCK
      ?auto_910879 - BLOCK
      ?auto_910880 - BLOCK
      ?auto_910881 - BLOCK
      ?auto_910882 - BLOCK
      ?auto_910883 - BLOCK
      ?auto_910884 - BLOCK
      ?auto_910885 - BLOCK
      ?auto_910886 - BLOCK
      ?auto_910887 - BLOCK
      ?auto_910888 - BLOCK
    )
    :vars
    (
      ?auto_910889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910888 ?auto_910889 ) ( ON-TABLE ?auto_910875 ) ( ON ?auto_910876 ?auto_910875 ) ( ON ?auto_910877 ?auto_910876 ) ( not ( = ?auto_910875 ?auto_910876 ) ) ( not ( = ?auto_910875 ?auto_910877 ) ) ( not ( = ?auto_910875 ?auto_910878 ) ) ( not ( = ?auto_910875 ?auto_910879 ) ) ( not ( = ?auto_910875 ?auto_910880 ) ) ( not ( = ?auto_910875 ?auto_910881 ) ) ( not ( = ?auto_910875 ?auto_910882 ) ) ( not ( = ?auto_910875 ?auto_910883 ) ) ( not ( = ?auto_910875 ?auto_910884 ) ) ( not ( = ?auto_910875 ?auto_910885 ) ) ( not ( = ?auto_910875 ?auto_910886 ) ) ( not ( = ?auto_910875 ?auto_910887 ) ) ( not ( = ?auto_910875 ?auto_910888 ) ) ( not ( = ?auto_910875 ?auto_910889 ) ) ( not ( = ?auto_910876 ?auto_910877 ) ) ( not ( = ?auto_910876 ?auto_910878 ) ) ( not ( = ?auto_910876 ?auto_910879 ) ) ( not ( = ?auto_910876 ?auto_910880 ) ) ( not ( = ?auto_910876 ?auto_910881 ) ) ( not ( = ?auto_910876 ?auto_910882 ) ) ( not ( = ?auto_910876 ?auto_910883 ) ) ( not ( = ?auto_910876 ?auto_910884 ) ) ( not ( = ?auto_910876 ?auto_910885 ) ) ( not ( = ?auto_910876 ?auto_910886 ) ) ( not ( = ?auto_910876 ?auto_910887 ) ) ( not ( = ?auto_910876 ?auto_910888 ) ) ( not ( = ?auto_910876 ?auto_910889 ) ) ( not ( = ?auto_910877 ?auto_910878 ) ) ( not ( = ?auto_910877 ?auto_910879 ) ) ( not ( = ?auto_910877 ?auto_910880 ) ) ( not ( = ?auto_910877 ?auto_910881 ) ) ( not ( = ?auto_910877 ?auto_910882 ) ) ( not ( = ?auto_910877 ?auto_910883 ) ) ( not ( = ?auto_910877 ?auto_910884 ) ) ( not ( = ?auto_910877 ?auto_910885 ) ) ( not ( = ?auto_910877 ?auto_910886 ) ) ( not ( = ?auto_910877 ?auto_910887 ) ) ( not ( = ?auto_910877 ?auto_910888 ) ) ( not ( = ?auto_910877 ?auto_910889 ) ) ( not ( = ?auto_910878 ?auto_910879 ) ) ( not ( = ?auto_910878 ?auto_910880 ) ) ( not ( = ?auto_910878 ?auto_910881 ) ) ( not ( = ?auto_910878 ?auto_910882 ) ) ( not ( = ?auto_910878 ?auto_910883 ) ) ( not ( = ?auto_910878 ?auto_910884 ) ) ( not ( = ?auto_910878 ?auto_910885 ) ) ( not ( = ?auto_910878 ?auto_910886 ) ) ( not ( = ?auto_910878 ?auto_910887 ) ) ( not ( = ?auto_910878 ?auto_910888 ) ) ( not ( = ?auto_910878 ?auto_910889 ) ) ( not ( = ?auto_910879 ?auto_910880 ) ) ( not ( = ?auto_910879 ?auto_910881 ) ) ( not ( = ?auto_910879 ?auto_910882 ) ) ( not ( = ?auto_910879 ?auto_910883 ) ) ( not ( = ?auto_910879 ?auto_910884 ) ) ( not ( = ?auto_910879 ?auto_910885 ) ) ( not ( = ?auto_910879 ?auto_910886 ) ) ( not ( = ?auto_910879 ?auto_910887 ) ) ( not ( = ?auto_910879 ?auto_910888 ) ) ( not ( = ?auto_910879 ?auto_910889 ) ) ( not ( = ?auto_910880 ?auto_910881 ) ) ( not ( = ?auto_910880 ?auto_910882 ) ) ( not ( = ?auto_910880 ?auto_910883 ) ) ( not ( = ?auto_910880 ?auto_910884 ) ) ( not ( = ?auto_910880 ?auto_910885 ) ) ( not ( = ?auto_910880 ?auto_910886 ) ) ( not ( = ?auto_910880 ?auto_910887 ) ) ( not ( = ?auto_910880 ?auto_910888 ) ) ( not ( = ?auto_910880 ?auto_910889 ) ) ( not ( = ?auto_910881 ?auto_910882 ) ) ( not ( = ?auto_910881 ?auto_910883 ) ) ( not ( = ?auto_910881 ?auto_910884 ) ) ( not ( = ?auto_910881 ?auto_910885 ) ) ( not ( = ?auto_910881 ?auto_910886 ) ) ( not ( = ?auto_910881 ?auto_910887 ) ) ( not ( = ?auto_910881 ?auto_910888 ) ) ( not ( = ?auto_910881 ?auto_910889 ) ) ( not ( = ?auto_910882 ?auto_910883 ) ) ( not ( = ?auto_910882 ?auto_910884 ) ) ( not ( = ?auto_910882 ?auto_910885 ) ) ( not ( = ?auto_910882 ?auto_910886 ) ) ( not ( = ?auto_910882 ?auto_910887 ) ) ( not ( = ?auto_910882 ?auto_910888 ) ) ( not ( = ?auto_910882 ?auto_910889 ) ) ( not ( = ?auto_910883 ?auto_910884 ) ) ( not ( = ?auto_910883 ?auto_910885 ) ) ( not ( = ?auto_910883 ?auto_910886 ) ) ( not ( = ?auto_910883 ?auto_910887 ) ) ( not ( = ?auto_910883 ?auto_910888 ) ) ( not ( = ?auto_910883 ?auto_910889 ) ) ( not ( = ?auto_910884 ?auto_910885 ) ) ( not ( = ?auto_910884 ?auto_910886 ) ) ( not ( = ?auto_910884 ?auto_910887 ) ) ( not ( = ?auto_910884 ?auto_910888 ) ) ( not ( = ?auto_910884 ?auto_910889 ) ) ( not ( = ?auto_910885 ?auto_910886 ) ) ( not ( = ?auto_910885 ?auto_910887 ) ) ( not ( = ?auto_910885 ?auto_910888 ) ) ( not ( = ?auto_910885 ?auto_910889 ) ) ( not ( = ?auto_910886 ?auto_910887 ) ) ( not ( = ?auto_910886 ?auto_910888 ) ) ( not ( = ?auto_910886 ?auto_910889 ) ) ( not ( = ?auto_910887 ?auto_910888 ) ) ( not ( = ?auto_910887 ?auto_910889 ) ) ( not ( = ?auto_910888 ?auto_910889 ) ) ( ON ?auto_910887 ?auto_910888 ) ( ON ?auto_910886 ?auto_910887 ) ( ON ?auto_910885 ?auto_910886 ) ( ON ?auto_910884 ?auto_910885 ) ( ON ?auto_910883 ?auto_910884 ) ( ON ?auto_910882 ?auto_910883 ) ( ON ?auto_910881 ?auto_910882 ) ( ON ?auto_910880 ?auto_910881 ) ( ON ?auto_910879 ?auto_910880 ) ( CLEAR ?auto_910877 ) ( ON ?auto_910878 ?auto_910879 ) ( CLEAR ?auto_910878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_910875 ?auto_910876 ?auto_910877 ?auto_910878 )
      ( MAKE-14PILE ?auto_910875 ?auto_910876 ?auto_910877 ?auto_910878 ?auto_910879 ?auto_910880 ?auto_910881 ?auto_910882 ?auto_910883 ?auto_910884 ?auto_910885 ?auto_910886 ?auto_910887 ?auto_910888 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910933 - BLOCK
      ?auto_910934 - BLOCK
      ?auto_910935 - BLOCK
      ?auto_910936 - BLOCK
      ?auto_910937 - BLOCK
      ?auto_910938 - BLOCK
      ?auto_910939 - BLOCK
      ?auto_910940 - BLOCK
      ?auto_910941 - BLOCK
      ?auto_910942 - BLOCK
      ?auto_910943 - BLOCK
      ?auto_910944 - BLOCK
      ?auto_910945 - BLOCK
      ?auto_910946 - BLOCK
    )
    :vars
    (
      ?auto_910947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_910946 ?auto_910947 ) ( ON-TABLE ?auto_910933 ) ( ON ?auto_910934 ?auto_910933 ) ( not ( = ?auto_910933 ?auto_910934 ) ) ( not ( = ?auto_910933 ?auto_910935 ) ) ( not ( = ?auto_910933 ?auto_910936 ) ) ( not ( = ?auto_910933 ?auto_910937 ) ) ( not ( = ?auto_910933 ?auto_910938 ) ) ( not ( = ?auto_910933 ?auto_910939 ) ) ( not ( = ?auto_910933 ?auto_910940 ) ) ( not ( = ?auto_910933 ?auto_910941 ) ) ( not ( = ?auto_910933 ?auto_910942 ) ) ( not ( = ?auto_910933 ?auto_910943 ) ) ( not ( = ?auto_910933 ?auto_910944 ) ) ( not ( = ?auto_910933 ?auto_910945 ) ) ( not ( = ?auto_910933 ?auto_910946 ) ) ( not ( = ?auto_910933 ?auto_910947 ) ) ( not ( = ?auto_910934 ?auto_910935 ) ) ( not ( = ?auto_910934 ?auto_910936 ) ) ( not ( = ?auto_910934 ?auto_910937 ) ) ( not ( = ?auto_910934 ?auto_910938 ) ) ( not ( = ?auto_910934 ?auto_910939 ) ) ( not ( = ?auto_910934 ?auto_910940 ) ) ( not ( = ?auto_910934 ?auto_910941 ) ) ( not ( = ?auto_910934 ?auto_910942 ) ) ( not ( = ?auto_910934 ?auto_910943 ) ) ( not ( = ?auto_910934 ?auto_910944 ) ) ( not ( = ?auto_910934 ?auto_910945 ) ) ( not ( = ?auto_910934 ?auto_910946 ) ) ( not ( = ?auto_910934 ?auto_910947 ) ) ( not ( = ?auto_910935 ?auto_910936 ) ) ( not ( = ?auto_910935 ?auto_910937 ) ) ( not ( = ?auto_910935 ?auto_910938 ) ) ( not ( = ?auto_910935 ?auto_910939 ) ) ( not ( = ?auto_910935 ?auto_910940 ) ) ( not ( = ?auto_910935 ?auto_910941 ) ) ( not ( = ?auto_910935 ?auto_910942 ) ) ( not ( = ?auto_910935 ?auto_910943 ) ) ( not ( = ?auto_910935 ?auto_910944 ) ) ( not ( = ?auto_910935 ?auto_910945 ) ) ( not ( = ?auto_910935 ?auto_910946 ) ) ( not ( = ?auto_910935 ?auto_910947 ) ) ( not ( = ?auto_910936 ?auto_910937 ) ) ( not ( = ?auto_910936 ?auto_910938 ) ) ( not ( = ?auto_910936 ?auto_910939 ) ) ( not ( = ?auto_910936 ?auto_910940 ) ) ( not ( = ?auto_910936 ?auto_910941 ) ) ( not ( = ?auto_910936 ?auto_910942 ) ) ( not ( = ?auto_910936 ?auto_910943 ) ) ( not ( = ?auto_910936 ?auto_910944 ) ) ( not ( = ?auto_910936 ?auto_910945 ) ) ( not ( = ?auto_910936 ?auto_910946 ) ) ( not ( = ?auto_910936 ?auto_910947 ) ) ( not ( = ?auto_910937 ?auto_910938 ) ) ( not ( = ?auto_910937 ?auto_910939 ) ) ( not ( = ?auto_910937 ?auto_910940 ) ) ( not ( = ?auto_910937 ?auto_910941 ) ) ( not ( = ?auto_910937 ?auto_910942 ) ) ( not ( = ?auto_910937 ?auto_910943 ) ) ( not ( = ?auto_910937 ?auto_910944 ) ) ( not ( = ?auto_910937 ?auto_910945 ) ) ( not ( = ?auto_910937 ?auto_910946 ) ) ( not ( = ?auto_910937 ?auto_910947 ) ) ( not ( = ?auto_910938 ?auto_910939 ) ) ( not ( = ?auto_910938 ?auto_910940 ) ) ( not ( = ?auto_910938 ?auto_910941 ) ) ( not ( = ?auto_910938 ?auto_910942 ) ) ( not ( = ?auto_910938 ?auto_910943 ) ) ( not ( = ?auto_910938 ?auto_910944 ) ) ( not ( = ?auto_910938 ?auto_910945 ) ) ( not ( = ?auto_910938 ?auto_910946 ) ) ( not ( = ?auto_910938 ?auto_910947 ) ) ( not ( = ?auto_910939 ?auto_910940 ) ) ( not ( = ?auto_910939 ?auto_910941 ) ) ( not ( = ?auto_910939 ?auto_910942 ) ) ( not ( = ?auto_910939 ?auto_910943 ) ) ( not ( = ?auto_910939 ?auto_910944 ) ) ( not ( = ?auto_910939 ?auto_910945 ) ) ( not ( = ?auto_910939 ?auto_910946 ) ) ( not ( = ?auto_910939 ?auto_910947 ) ) ( not ( = ?auto_910940 ?auto_910941 ) ) ( not ( = ?auto_910940 ?auto_910942 ) ) ( not ( = ?auto_910940 ?auto_910943 ) ) ( not ( = ?auto_910940 ?auto_910944 ) ) ( not ( = ?auto_910940 ?auto_910945 ) ) ( not ( = ?auto_910940 ?auto_910946 ) ) ( not ( = ?auto_910940 ?auto_910947 ) ) ( not ( = ?auto_910941 ?auto_910942 ) ) ( not ( = ?auto_910941 ?auto_910943 ) ) ( not ( = ?auto_910941 ?auto_910944 ) ) ( not ( = ?auto_910941 ?auto_910945 ) ) ( not ( = ?auto_910941 ?auto_910946 ) ) ( not ( = ?auto_910941 ?auto_910947 ) ) ( not ( = ?auto_910942 ?auto_910943 ) ) ( not ( = ?auto_910942 ?auto_910944 ) ) ( not ( = ?auto_910942 ?auto_910945 ) ) ( not ( = ?auto_910942 ?auto_910946 ) ) ( not ( = ?auto_910942 ?auto_910947 ) ) ( not ( = ?auto_910943 ?auto_910944 ) ) ( not ( = ?auto_910943 ?auto_910945 ) ) ( not ( = ?auto_910943 ?auto_910946 ) ) ( not ( = ?auto_910943 ?auto_910947 ) ) ( not ( = ?auto_910944 ?auto_910945 ) ) ( not ( = ?auto_910944 ?auto_910946 ) ) ( not ( = ?auto_910944 ?auto_910947 ) ) ( not ( = ?auto_910945 ?auto_910946 ) ) ( not ( = ?auto_910945 ?auto_910947 ) ) ( not ( = ?auto_910946 ?auto_910947 ) ) ( ON ?auto_910945 ?auto_910946 ) ( ON ?auto_910944 ?auto_910945 ) ( ON ?auto_910943 ?auto_910944 ) ( ON ?auto_910942 ?auto_910943 ) ( ON ?auto_910941 ?auto_910942 ) ( ON ?auto_910940 ?auto_910941 ) ( ON ?auto_910939 ?auto_910940 ) ( ON ?auto_910938 ?auto_910939 ) ( ON ?auto_910937 ?auto_910938 ) ( ON ?auto_910936 ?auto_910937 ) ( CLEAR ?auto_910934 ) ( ON ?auto_910935 ?auto_910936 ) ( CLEAR ?auto_910935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_910933 ?auto_910934 ?auto_910935 )
      ( MAKE-14PILE ?auto_910933 ?auto_910934 ?auto_910935 ?auto_910936 ?auto_910937 ?auto_910938 ?auto_910939 ?auto_910940 ?auto_910941 ?auto_910942 ?auto_910943 ?auto_910944 ?auto_910945 ?auto_910946 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_910991 - BLOCK
      ?auto_910992 - BLOCK
      ?auto_910993 - BLOCK
      ?auto_910994 - BLOCK
      ?auto_910995 - BLOCK
      ?auto_910996 - BLOCK
      ?auto_910997 - BLOCK
      ?auto_910998 - BLOCK
      ?auto_910999 - BLOCK
      ?auto_911000 - BLOCK
      ?auto_911001 - BLOCK
      ?auto_911002 - BLOCK
      ?auto_911003 - BLOCK
      ?auto_911004 - BLOCK
    )
    :vars
    (
      ?auto_911005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911004 ?auto_911005 ) ( ON-TABLE ?auto_910991 ) ( not ( = ?auto_910991 ?auto_910992 ) ) ( not ( = ?auto_910991 ?auto_910993 ) ) ( not ( = ?auto_910991 ?auto_910994 ) ) ( not ( = ?auto_910991 ?auto_910995 ) ) ( not ( = ?auto_910991 ?auto_910996 ) ) ( not ( = ?auto_910991 ?auto_910997 ) ) ( not ( = ?auto_910991 ?auto_910998 ) ) ( not ( = ?auto_910991 ?auto_910999 ) ) ( not ( = ?auto_910991 ?auto_911000 ) ) ( not ( = ?auto_910991 ?auto_911001 ) ) ( not ( = ?auto_910991 ?auto_911002 ) ) ( not ( = ?auto_910991 ?auto_911003 ) ) ( not ( = ?auto_910991 ?auto_911004 ) ) ( not ( = ?auto_910991 ?auto_911005 ) ) ( not ( = ?auto_910992 ?auto_910993 ) ) ( not ( = ?auto_910992 ?auto_910994 ) ) ( not ( = ?auto_910992 ?auto_910995 ) ) ( not ( = ?auto_910992 ?auto_910996 ) ) ( not ( = ?auto_910992 ?auto_910997 ) ) ( not ( = ?auto_910992 ?auto_910998 ) ) ( not ( = ?auto_910992 ?auto_910999 ) ) ( not ( = ?auto_910992 ?auto_911000 ) ) ( not ( = ?auto_910992 ?auto_911001 ) ) ( not ( = ?auto_910992 ?auto_911002 ) ) ( not ( = ?auto_910992 ?auto_911003 ) ) ( not ( = ?auto_910992 ?auto_911004 ) ) ( not ( = ?auto_910992 ?auto_911005 ) ) ( not ( = ?auto_910993 ?auto_910994 ) ) ( not ( = ?auto_910993 ?auto_910995 ) ) ( not ( = ?auto_910993 ?auto_910996 ) ) ( not ( = ?auto_910993 ?auto_910997 ) ) ( not ( = ?auto_910993 ?auto_910998 ) ) ( not ( = ?auto_910993 ?auto_910999 ) ) ( not ( = ?auto_910993 ?auto_911000 ) ) ( not ( = ?auto_910993 ?auto_911001 ) ) ( not ( = ?auto_910993 ?auto_911002 ) ) ( not ( = ?auto_910993 ?auto_911003 ) ) ( not ( = ?auto_910993 ?auto_911004 ) ) ( not ( = ?auto_910993 ?auto_911005 ) ) ( not ( = ?auto_910994 ?auto_910995 ) ) ( not ( = ?auto_910994 ?auto_910996 ) ) ( not ( = ?auto_910994 ?auto_910997 ) ) ( not ( = ?auto_910994 ?auto_910998 ) ) ( not ( = ?auto_910994 ?auto_910999 ) ) ( not ( = ?auto_910994 ?auto_911000 ) ) ( not ( = ?auto_910994 ?auto_911001 ) ) ( not ( = ?auto_910994 ?auto_911002 ) ) ( not ( = ?auto_910994 ?auto_911003 ) ) ( not ( = ?auto_910994 ?auto_911004 ) ) ( not ( = ?auto_910994 ?auto_911005 ) ) ( not ( = ?auto_910995 ?auto_910996 ) ) ( not ( = ?auto_910995 ?auto_910997 ) ) ( not ( = ?auto_910995 ?auto_910998 ) ) ( not ( = ?auto_910995 ?auto_910999 ) ) ( not ( = ?auto_910995 ?auto_911000 ) ) ( not ( = ?auto_910995 ?auto_911001 ) ) ( not ( = ?auto_910995 ?auto_911002 ) ) ( not ( = ?auto_910995 ?auto_911003 ) ) ( not ( = ?auto_910995 ?auto_911004 ) ) ( not ( = ?auto_910995 ?auto_911005 ) ) ( not ( = ?auto_910996 ?auto_910997 ) ) ( not ( = ?auto_910996 ?auto_910998 ) ) ( not ( = ?auto_910996 ?auto_910999 ) ) ( not ( = ?auto_910996 ?auto_911000 ) ) ( not ( = ?auto_910996 ?auto_911001 ) ) ( not ( = ?auto_910996 ?auto_911002 ) ) ( not ( = ?auto_910996 ?auto_911003 ) ) ( not ( = ?auto_910996 ?auto_911004 ) ) ( not ( = ?auto_910996 ?auto_911005 ) ) ( not ( = ?auto_910997 ?auto_910998 ) ) ( not ( = ?auto_910997 ?auto_910999 ) ) ( not ( = ?auto_910997 ?auto_911000 ) ) ( not ( = ?auto_910997 ?auto_911001 ) ) ( not ( = ?auto_910997 ?auto_911002 ) ) ( not ( = ?auto_910997 ?auto_911003 ) ) ( not ( = ?auto_910997 ?auto_911004 ) ) ( not ( = ?auto_910997 ?auto_911005 ) ) ( not ( = ?auto_910998 ?auto_910999 ) ) ( not ( = ?auto_910998 ?auto_911000 ) ) ( not ( = ?auto_910998 ?auto_911001 ) ) ( not ( = ?auto_910998 ?auto_911002 ) ) ( not ( = ?auto_910998 ?auto_911003 ) ) ( not ( = ?auto_910998 ?auto_911004 ) ) ( not ( = ?auto_910998 ?auto_911005 ) ) ( not ( = ?auto_910999 ?auto_911000 ) ) ( not ( = ?auto_910999 ?auto_911001 ) ) ( not ( = ?auto_910999 ?auto_911002 ) ) ( not ( = ?auto_910999 ?auto_911003 ) ) ( not ( = ?auto_910999 ?auto_911004 ) ) ( not ( = ?auto_910999 ?auto_911005 ) ) ( not ( = ?auto_911000 ?auto_911001 ) ) ( not ( = ?auto_911000 ?auto_911002 ) ) ( not ( = ?auto_911000 ?auto_911003 ) ) ( not ( = ?auto_911000 ?auto_911004 ) ) ( not ( = ?auto_911000 ?auto_911005 ) ) ( not ( = ?auto_911001 ?auto_911002 ) ) ( not ( = ?auto_911001 ?auto_911003 ) ) ( not ( = ?auto_911001 ?auto_911004 ) ) ( not ( = ?auto_911001 ?auto_911005 ) ) ( not ( = ?auto_911002 ?auto_911003 ) ) ( not ( = ?auto_911002 ?auto_911004 ) ) ( not ( = ?auto_911002 ?auto_911005 ) ) ( not ( = ?auto_911003 ?auto_911004 ) ) ( not ( = ?auto_911003 ?auto_911005 ) ) ( not ( = ?auto_911004 ?auto_911005 ) ) ( ON ?auto_911003 ?auto_911004 ) ( ON ?auto_911002 ?auto_911003 ) ( ON ?auto_911001 ?auto_911002 ) ( ON ?auto_911000 ?auto_911001 ) ( ON ?auto_910999 ?auto_911000 ) ( ON ?auto_910998 ?auto_910999 ) ( ON ?auto_910997 ?auto_910998 ) ( ON ?auto_910996 ?auto_910997 ) ( ON ?auto_910995 ?auto_910996 ) ( ON ?auto_910994 ?auto_910995 ) ( ON ?auto_910993 ?auto_910994 ) ( CLEAR ?auto_910991 ) ( ON ?auto_910992 ?auto_910993 ) ( CLEAR ?auto_910992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_910991 ?auto_910992 )
      ( MAKE-14PILE ?auto_910991 ?auto_910992 ?auto_910993 ?auto_910994 ?auto_910995 ?auto_910996 ?auto_910997 ?auto_910998 ?auto_910999 ?auto_911000 ?auto_911001 ?auto_911002 ?auto_911003 ?auto_911004 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_911049 - BLOCK
      ?auto_911050 - BLOCK
      ?auto_911051 - BLOCK
      ?auto_911052 - BLOCK
      ?auto_911053 - BLOCK
      ?auto_911054 - BLOCK
      ?auto_911055 - BLOCK
      ?auto_911056 - BLOCK
      ?auto_911057 - BLOCK
      ?auto_911058 - BLOCK
      ?auto_911059 - BLOCK
      ?auto_911060 - BLOCK
      ?auto_911061 - BLOCK
      ?auto_911062 - BLOCK
    )
    :vars
    (
      ?auto_911063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911062 ?auto_911063 ) ( not ( = ?auto_911049 ?auto_911050 ) ) ( not ( = ?auto_911049 ?auto_911051 ) ) ( not ( = ?auto_911049 ?auto_911052 ) ) ( not ( = ?auto_911049 ?auto_911053 ) ) ( not ( = ?auto_911049 ?auto_911054 ) ) ( not ( = ?auto_911049 ?auto_911055 ) ) ( not ( = ?auto_911049 ?auto_911056 ) ) ( not ( = ?auto_911049 ?auto_911057 ) ) ( not ( = ?auto_911049 ?auto_911058 ) ) ( not ( = ?auto_911049 ?auto_911059 ) ) ( not ( = ?auto_911049 ?auto_911060 ) ) ( not ( = ?auto_911049 ?auto_911061 ) ) ( not ( = ?auto_911049 ?auto_911062 ) ) ( not ( = ?auto_911049 ?auto_911063 ) ) ( not ( = ?auto_911050 ?auto_911051 ) ) ( not ( = ?auto_911050 ?auto_911052 ) ) ( not ( = ?auto_911050 ?auto_911053 ) ) ( not ( = ?auto_911050 ?auto_911054 ) ) ( not ( = ?auto_911050 ?auto_911055 ) ) ( not ( = ?auto_911050 ?auto_911056 ) ) ( not ( = ?auto_911050 ?auto_911057 ) ) ( not ( = ?auto_911050 ?auto_911058 ) ) ( not ( = ?auto_911050 ?auto_911059 ) ) ( not ( = ?auto_911050 ?auto_911060 ) ) ( not ( = ?auto_911050 ?auto_911061 ) ) ( not ( = ?auto_911050 ?auto_911062 ) ) ( not ( = ?auto_911050 ?auto_911063 ) ) ( not ( = ?auto_911051 ?auto_911052 ) ) ( not ( = ?auto_911051 ?auto_911053 ) ) ( not ( = ?auto_911051 ?auto_911054 ) ) ( not ( = ?auto_911051 ?auto_911055 ) ) ( not ( = ?auto_911051 ?auto_911056 ) ) ( not ( = ?auto_911051 ?auto_911057 ) ) ( not ( = ?auto_911051 ?auto_911058 ) ) ( not ( = ?auto_911051 ?auto_911059 ) ) ( not ( = ?auto_911051 ?auto_911060 ) ) ( not ( = ?auto_911051 ?auto_911061 ) ) ( not ( = ?auto_911051 ?auto_911062 ) ) ( not ( = ?auto_911051 ?auto_911063 ) ) ( not ( = ?auto_911052 ?auto_911053 ) ) ( not ( = ?auto_911052 ?auto_911054 ) ) ( not ( = ?auto_911052 ?auto_911055 ) ) ( not ( = ?auto_911052 ?auto_911056 ) ) ( not ( = ?auto_911052 ?auto_911057 ) ) ( not ( = ?auto_911052 ?auto_911058 ) ) ( not ( = ?auto_911052 ?auto_911059 ) ) ( not ( = ?auto_911052 ?auto_911060 ) ) ( not ( = ?auto_911052 ?auto_911061 ) ) ( not ( = ?auto_911052 ?auto_911062 ) ) ( not ( = ?auto_911052 ?auto_911063 ) ) ( not ( = ?auto_911053 ?auto_911054 ) ) ( not ( = ?auto_911053 ?auto_911055 ) ) ( not ( = ?auto_911053 ?auto_911056 ) ) ( not ( = ?auto_911053 ?auto_911057 ) ) ( not ( = ?auto_911053 ?auto_911058 ) ) ( not ( = ?auto_911053 ?auto_911059 ) ) ( not ( = ?auto_911053 ?auto_911060 ) ) ( not ( = ?auto_911053 ?auto_911061 ) ) ( not ( = ?auto_911053 ?auto_911062 ) ) ( not ( = ?auto_911053 ?auto_911063 ) ) ( not ( = ?auto_911054 ?auto_911055 ) ) ( not ( = ?auto_911054 ?auto_911056 ) ) ( not ( = ?auto_911054 ?auto_911057 ) ) ( not ( = ?auto_911054 ?auto_911058 ) ) ( not ( = ?auto_911054 ?auto_911059 ) ) ( not ( = ?auto_911054 ?auto_911060 ) ) ( not ( = ?auto_911054 ?auto_911061 ) ) ( not ( = ?auto_911054 ?auto_911062 ) ) ( not ( = ?auto_911054 ?auto_911063 ) ) ( not ( = ?auto_911055 ?auto_911056 ) ) ( not ( = ?auto_911055 ?auto_911057 ) ) ( not ( = ?auto_911055 ?auto_911058 ) ) ( not ( = ?auto_911055 ?auto_911059 ) ) ( not ( = ?auto_911055 ?auto_911060 ) ) ( not ( = ?auto_911055 ?auto_911061 ) ) ( not ( = ?auto_911055 ?auto_911062 ) ) ( not ( = ?auto_911055 ?auto_911063 ) ) ( not ( = ?auto_911056 ?auto_911057 ) ) ( not ( = ?auto_911056 ?auto_911058 ) ) ( not ( = ?auto_911056 ?auto_911059 ) ) ( not ( = ?auto_911056 ?auto_911060 ) ) ( not ( = ?auto_911056 ?auto_911061 ) ) ( not ( = ?auto_911056 ?auto_911062 ) ) ( not ( = ?auto_911056 ?auto_911063 ) ) ( not ( = ?auto_911057 ?auto_911058 ) ) ( not ( = ?auto_911057 ?auto_911059 ) ) ( not ( = ?auto_911057 ?auto_911060 ) ) ( not ( = ?auto_911057 ?auto_911061 ) ) ( not ( = ?auto_911057 ?auto_911062 ) ) ( not ( = ?auto_911057 ?auto_911063 ) ) ( not ( = ?auto_911058 ?auto_911059 ) ) ( not ( = ?auto_911058 ?auto_911060 ) ) ( not ( = ?auto_911058 ?auto_911061 ) ) ( not ( = ?auto_911058 ?auto_911062 ) ) ( not ( = ?auto_911058 ?auto_911063 ) ) ( not ( = ?auto_911059 ?auto_911060 ) ) ( not ( = ?auto_911059 ?auto_911061 ) ) ( not ( = ?auto_911059 ?auto_911062 ) ) ( not ( = ?auto_911059 ?auto_911063 ) ) ( not ( = ?auto_911060 ?auto_911061 ) ) ( not ( = ?auto_911060 ?auto_911062 ) ) ( not ( = ?auto_911060 ?auto_911063 ) ) ( not ( = ?auto_911061 ?auto_911062 ) ) ( not ( = ?auto_911061 ?auto_911063 ) ) ( not ( = ?auto_911062 ?auto_911063 ) ) ( ON ?auto_911061 ?auto_911062 ) ( ON ?auto_911060 ?auto_911061 ) ( ON ?auto_911059 ?auto_911060 ) ( ON ?auto_911058 ?auto_911059 ) ( ON ?auto_911057 ?auto_911058 ) ( ON ?auto_911056 ?auto_911057 ) ( ON ?auto_911055 ?auto_911056 ) ( ON ?auto_911054 ?auto_911055 ) ( ON ?auto_911053 ?auto_911054 ) ( ON ?auto_911052 ?auto_911053 ) ( ON ?auto_911051 ?auto_911052 ) ( ON ?auto_911050 ?auto_911051 ) ( ON ?auto_911049 ?auto_911050 ) ( CLEAR ?auto_911049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_911049 )
      ( MAKE-14PILE ?auto_911049 ?auto_911050 ?auto_911051 ?auto_911052 ?auto_911053 ?auto_911054 ?auto_911055 ?auto_911056 ?auto_911057 ?auto_911058 ?auto_911059 ?auto_911060 ?auto_911061 ?auto_911062 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911108 - BLOCK
      ?auto_911109 - BLOCK
      ?auto_911110 - BLOCK
      ?auto_911111 - BLOCK
      ?auto_911112 - BLOCK
      ?auto_911113 - BLOCK
      ?auto_911114 - BLOCK
      ?auto_911115 - BLOCK
      ?auto_911116 - BLOCK
      ?auto_911117 - BLOCK
      ?auto_911118 - BLOCK
      ?auto_911119 - BLOCK
      ?auto_911120 - BLOCK
      ?auto_911121 - BLOCK
      ?auto_911122 - BLOCK
    )
    :vars
    (
      ?auto_911123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_911121 ) ( ON ?auto_911122 ?auto_911123 ) ( CLEAR ?auto_911122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_911108 ) ( ON ?auto_911109 ?auto_911108 ) ( ON ?auto_911110 ?auto_911109 ) ( ON ?auto_911111 ?auto_911110 ) ( ON ?auto_911112 ?auto_911111 ) ( ON ?auto_911113 ?auto_911112 ) ( ON ?auto_911114 ?auto_911113 ) ( ON ?auto_911115 ?auto_911114 ) ( ON ?auto_911116 ?auto_911115 ) ( ON ?auto_911117 ?auto_911116 ) ( ON ?auto_911118 ?auto_911117 ) ( ON ?auto_911119 ?auto_911118 ) ( ON ?auto_911120 ?auto_911119 ) ( ON ?auto_911121 ?auto_911120 ) ( not ( = ?auto_911108 ?auto_911109 ) ) ( not ( = ?auto_911108 ?auto_911110 ) ) ( not ( = ?auto_911108 ?auto_911111 ) ) ( not ( = ?auto_911108 ?auto_911112 ) ) ( not ( = ?auto_911108 ?auto_911113 ) ) ( not ( = ?auto_911108 ?auto_911114 ) ) ( not ( = ?auto_911108 ?auto_911115 ) ) ( not ( = ?auto_911108 ?auto_911116 ) ) ( not ( = ?auto_911108 ?auto_911117 ) ) ( not ( = ?auto_911108 ?auto_911118 ) ) ( not ( = ?auto_911108 ?auto_911119 ) ) ( not ( = ?auto_911108 ?auto_911120 ) ) ( not ( = ?auto_911108 ?auto_911121 ) ) ( not ( = ?auto_911108 ?auto_911122 ) ) ( not ( = ?auto_911108 ?auto_911123 ) ) ( not ( = ?auto_911109 ?auto_911110 ) ) ( not ( = ?auto_911109 ?auto_911111 ) ) ( not ( = ?auto_911109 ?auto_911112 ) ) ( not ( = ?auto_911109 ?auto_911113 ) ) ( not ( = ?auto_911109 ?auto_911114 ) ) ( not ( = ?auto_911109 ?auto_911115 ) ) ( not ( = ?auto_911109 ?auto_911116 ) ) ( not ( = ?auto_911109 ?auto_911117 ) ) ( not ( = ?auto_911109 ?auto_911118 ) ) ( not ( = ?auto_911109 ?auto_911119 ) ) ( not ( = ?auto_911109 ?auto_911120 ) ) ( not ( = ?auto_911109 ?auto_911121 ) ) ( not ( = ?auto_911109 ?auto_911122 ) ) ( not ( = ?auto_911109 ?auto_911123 ) ) ( not ( = ?auto_911110 ?auto_911111 ) ) ( not ( = ?auto_911110 ?auto_911112 ) ) ( not ( = ?auto_911110 ?auto_911113 ) ) ( not ( = ?auto_911110 ?auto_911114 ) ) ( not ( = ?auto_911110 ?auto_911115 ) ) ( not ( = ?auto_911110 ?auto_911116 ) ) ( not ( = ?auto_911110 ?auto_911117 ) ) ( not ( = ?auto_911110 ?auto_911118 ) ) ( not ( = ?auto_911110 ?auto_911119 ) ) ( not ( = ?auto_911110 ?auto_911120 ) ) ( not ( = ?auto_911110 ?auto_911121 ) ) ( not ( = ?auto_911110 ?auto_911122 ) ) ( not ( = ?auto_911110 ?auto_911123 ) ) ( not ( = ?auto_911111 ?auto_911112 ) ) ( not ( = ?auto_911111 ?auto_911113 ) ) ( not ( = ?auto_911111 ?auto_911114 ) ) ( not ( = ?auto_911111 ?auto_911115 ) ) ( not ( = ?auto_911111 ?auto_911116 ) ) ( not ( = ?auto_911111 ?auto_911117 ) ) ( not ( = ?auto_911111 ?auto_911118 ) ) ( not ( = ?auto_911111 ?auto_911119 ) ) ( not ( = ?auto_911111 ?auto_911120 ) ) ( not ( = ?auto_911111 ?auto_911121 ) ) ( not ( = ?auto_911111 ?auto_911122 ) ) ( not ( = ?auto_911111 ?auto_911123 ) ) ( not ( = ?auto_911112 ?auto_911113 ) ) ( not ( = ?auto_911112 ?auto_911114 ) ) ( not ( = ?auto_911112 ?auto_911115 ) ) ( not ( = ?auto_911112 ?auto_911116 ) ) ( not ( = ?auto_911112 ?auto_911117 ) ) ( not ( = ?auto_911112 ?auto_911118 ) ) ( not ( = ?auto_911112 ?auto_911119 ) ) ( not ( = ?auto_911112 ?auto_911120 ) ) ( not ( = ?auto_911112 ?auto_911121 ) ) ( not ( = ?auto_911112 ?auto_911122 ) ) ( not ( = ?auto_911112 ?auto_911123 ) ) ( not ( = ?auto_911113 ?auto_911114 ) ) ( not ( = ?auto_911113 ?auto_911115 ) ) ( not ( = ?auto_911113 ?auto_911116 ) ) ( not ( = ?auto_911113 ?auto_911117 ) ) ( not ( = ?auto_911113 ?auto_911118 ) ) ( not ( = ?auto_911113 ?auto_911119 ) ) ( not ( = ?auto_911113 ?auto_911120 ) ) ( not ( = ?auto_911113 ?auto_911121 ) ) ( not ( = ?auto_911113 ?auto_911122 ) ) ( not ( = ?auto_911113 ?auto_911123 ) ) ( not ( = ?auto_911114 ?auto_911115 ) ) ( not ( = ?auto_911114 ?auto_911116 ) ) ( not ( = ?auto_911114 ?auto_911117 ) ) ( not ( = ?auto_911114 ?auto_911118 ) ) ( not ( = ?auto_911114 ?auto_911119 ) ) ( not ( = ?auto_911114 ?auto_911120 ) ) ( not ( = ?auto_911114 ?auto_911121 ) ) ( not ( = ?auto_911114 ?auto_911122 ) ) ( not ( = ?auto_911114 ?auto_911123 ) ) ( not ( = ?auto_911115 ?auto_911116 ) ) ( not ( = ?auto_911115 ?auto_911117 ) ) ( not ( = ?auto_911115 ?auto_911118 ) ) ( not ( = ?auto_911115 ?auto_911119 ) ) ( not ( = ?auto_911115 ?auto_911120 ) ) ( not ( = ?auto_911115 ?auto_911121 ) ) ( not ( = ?auto_911115 ?auto_911122 ) ) ( not ( = ?auto_911115 ?auto_911123 ) ) ( not ( = ?auto_911116 ?auto_911117 ) ) ( not ( = ?auto_911116 ?auto_911118 ) ) ( not ( = ?auto_911116 ?auto_911119 ) ) ( not ( = ?auto_911116 ?auto_911120 ) ) ( not ( = ?auto_911116 ?auto_911121 ) ) ( not ( = ?auto_911116 ?auto_911122 ) ) ( not ( = ?auto_911116 ?auto_911123 ) ) ( not ( = ?auto_911117 ?auto_911118 ) ) ( not ( = ?auto_911117 ?auto_911119 ) ) ( not ( = ?auto_911117 ?auto_911120 ) ) ( not ( = ?auto_911117 ?auto_911121 ) ) ( not ( = ?auto_911117 ?auto_911122 ) ) ( not ( = ?auto_911117 ?auto_911123 ) ) ( not ( = ?auto_911118 ?auto_911119 ) ) ( not ( = ?auto_911118 ?auto_911120 ) ) ( not ( = ?auto_911118 ?auto_911121 ) ) ( not ( = ?auto_911118 ?auto_911122 ) ) ( not ( = ?auto_911118 ?auto_911123 ) ) ( not ( = ?auto_911119 ?auto_911120 ) ) ( not ( = ?auto_911119 ?auto_911121 ) ) ( not ( = ?auto_911119 ?auto_911122 ) ) ( not ( = ?auto_911119 ?auto_911123 ) ) ( not ( = ?auto_911120 ?auto_911121 ) ) ( not ( = ?auto_911120 ?auto_911122 ) ) ( not ( = ?auto_911120 ?auto_911123 ) ) ( not ( = ?auto_911121 ?auto_911122 ) ) ( not ( = ?auto_911121 ?auto_911123 ) ) ( not ( = ?auto_911122 ?auto_911123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_911122 ?auto_911123 )
      ( !STACK ?auto_911122 ?auto_911121 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911170 - BLOCK
      ?auto_911171 - BLOCK
      ?auto_911172 - BLOCK
      ?auto_911173 - BLOCK
      ?auto_911174 - BLOCK
      ?auto_911175 - BLOCK
      ?auto_911176 - BLOCK
      ?auto_911177 - BLOCK
      ?auto_911178 - BLOCK
      ?auto_911179 - BLOCK
      ?auto_911180 - BLOCK
      ?auto_911181 - BLOCK
      ?auto_911182 - BLOCK
      ?auto_911183 - BLOCK
      ?auto_911184 - BLOCK
    )
    :vars
    (
      ?auto_911185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911184 ?auto_911185 ) ( ON-TABLE ?auto_911170 ) ( ON ?auto_911171 ?auto_911170 ) ( ON ?auto_911172 ?auto_911171 ) ( ON ?auto_911173 ?auto_911172 ) ( ON ?auto_911174 ?auto_911173 ) ( ON ?auto_911175 ?auto_911174 ) ( ON ?auto_911176 ?auto_911175 ) ( ON ?auto_911177 ?auto_911176 ) ( ON ?auto_911178 ?auto_911177 ) ( ON ?auto_911179 ?auto_911178 ) ( ON ?auto_911180 ?auto_911179 ) ( ON ?auto_911181 ?auto_911180 ) ( ON ?auto_911182 ?auto_911181 ) ( not ( = ?auto_911170 ?auto_911171 ) ) ( not ( = ?auto_911170 ?auto_911172 ) ) ( not ( = ?auto_911170 ?auto_911173 ) ) ( not ( = ?auto_911170 ?auto_911174 ) ) ( not ( = ?auto_911170 ?auto_911175 ) ) ( not ( = ?auto_911170 ?auto_911176 ) ) ( not ( = ?auto_911170 ?auto_911177 ) ) ( not ( = ?auto_911170 ?auto_911178 ) ) ( not ( = ?auto_911170 ?auto_911179 ) ) ( not ( = ?auto_911170 ?auto_911180 ) ) ( not ( = ?auto_911170 ?auto_911181 ) ) ( not ( = ?auto_911170 ?auto_911182 ) ) ( not ( = ?auto_911170 ?auto_911183 ) ) ( not ( = ?auto_911170 ?auto_911184 ) ) ( not ( = ?auto_911170 ?auto_911185 ) ) ( not ( = ?auto_911171 ?auto_911172 ) ) ( not ( = ?auto_911171 ?auto_911173 ) ) ( not ( = ?auto_911171 ?auto_911174 ) ) ( not ( = ?auto_911171 ?auto_911175 ) ) ( not ( = ?auto_911171 ?auto_911176 ) ) ( not ( = ?auto_911171 ?auto_911177 ) ) ( not ( = ?auto_911171 ?auto_911178 ) ) ( not ( = ?auto_911171 ?auto_911179 ) ) ( not ( = ?auto_911171 ?auto_911180 ) ) ( not ( = ?auto_911171 ?auto_911181 ) ) ( not ( = ?auto_911171 ?auto_911182 ) ) ( not ( = ?auto_911171 ?auto_911183 ) ) ( not ( = ?auto_911171 ?auto_911184 ) ) ( not ( = ?auto_911171 ?auto_911185 ) ) ( not ( = ?auto_911172 ?auto_911173 ) ) ( not ( = ?auto_911172 ?auto_911174 ) ) ( not ( = ?auto_911172 ?auto_911175 ) ) ( not ( = ?auto_911172 ?auto_911176 ) ) ( not ( = ?auto_911172 ?auto_911177 ) ) ( not ( = ?auto_911172 ?auto_911178 ) ) ( not ( = ?auto_911172 ?auto_911179 ) ) ( not ( = ?auto_911172 ?auto_911180 ) ) ( not ( = ?auto_911172 ?auto_911181 ) ) ( not ( = ?auto_911172 ?auto_911182 ) ) ( not ( = ?auto_911172 ?auto_911183 ) ) ( not ( = ?auto_911172 ?auto_911184 ) ) ( not ( = ?auto_911172 ?auto_911185 ) ) ( not ( = ?auto_911173 ?auto_911174 ) ) ( not ( = ?auto_911173 ?auto_911175 ) ) ( not ( = ?auto_911173 ?auto_911176 ) ) ( not ( = ?auto_911173 ?auto_911177 ) ) ( not ( = ?auto_911173 ?auto_911178 ) ) ( not ( = ?auto_911173 ?auto_911179 ) ) ( not ( = ?auto_911173 ?auto_911180 ) ) ( not ( = ?auto_911173 ?auto_911181 ) ) ( not ( = ?auto_911173 ?auto_911182 ) ) ( not ( = ?auto_911173 ?auto_911183 ) ) ( not ( = ?auto_911173 ?auto_911184 ) ) ( not ( = ?auto_911173 ?auto_911185 ) ) ( not ( = ?auto_911174 ?auto_911175 ) ) ( not ( = ?auto_911174 ?auto_911176 ) ) ( not ( = ?auto_911174 ?auto_911177 ) ) ( not ( = ?auto_911174 ?auto_911178 ) ) ( not ( = ?auto_911174 ?auto_911179 ) ) ( not ( = ?auto_911174 ?auto_911180 ) ) ( not ( = ?auto_911174 ?auto_911181 ) ) ( not ( = ?auto_911174 ?auto_911182 ) ) ( not ( = ?auto_911174 ?auto_911183 ) ) ( not ( = ?auto_911174 ?auto_911184 ) ) ( not ( = ?auto_911174 ?auto_911185 ) ) ( not ( = ?auto_911175 ?auto_911176 ) ) ( not ( = ?auto_911175 ?auto_911177 ) ) ( not ( = ?auto_911175 ?auto_911178 ) ) ( not ( = ?auto_911175 ?auto_911179 ) ) ( not ( = ?auto_911175 ?auto_911180 ) ) ( not ( = ?auto_911175 ?auto_911181 ) ) ( not ( = ?auto_911175 ?auto_911182 ) ) ( not ( = ?auto_911175 ?auto_911183 ) ) ( not ( = ?auto_911175 ?auto_911184 ) ) ( not ( = ?auto_911175 ?auto_911185 ) ) ( not ( = ?auto_911176 ?auto_911177 ) ) ( not ( = ?auto_911176 ?auto_911178 ) ) ( not ( = ?auto_911176 ?auto_911179 ) ) ( not ( = ?auto_911176 ?auto_911180 ) ) ( not ( = ?auto_911176 ?auto_911181 ) ) ( not ( = ?auto_911176 ?auto_911182 ) ) ( not ( = ?auto_911176 ?auto_911183 ) ) ( not ( = ?auto_911176 ?auto_911184 ) ) ( not ( = ?auto_911176 ?auto_911185 ) ) ( not ( = ?auto_911177 ?auto_911178 ) ) ( not ( = ?auto_911177 ?auto_911179 ) ) ( not ( = ?auto_911177 ?auto_911180 ) ) ( not ( = ?auto_911177 ?auto_911181 ) ) ( not ( = ?auto_911177 ?auto_911182 ) ) ( not ( = ?auto_911177 ?auto_911183 ) ) ( not ( = ?auto_911177 ?auto_911184 ) ) ( not ( = ?auto_911177 ?auto_911185 ) ) ( not ( = ?auto_911178 ?auto_911179 ) ) ( not ( = ?auto_911178 ?auto_911180 ) ) ( not ( = ?auto_911178 ?auto_911181 ) ) ( not ( = ?auto_911178 ?auto_911182 ) ) ( not ( = ?auto_911178 ?auto_911183 ) ) ( not ( = ?auto_911178 ?auto_911184 ) ) ( not ( = ?auto_911178 ?auto_911185 ) ) ( not ( = ?auto_911179 ?auto_911180 ) ) ( not ( = ?auto_911179 ?auto_911181 ) ) ( not ( = ?auto_911179 ?auto_911182 ) ) ( not ( = ?auto_911179 ?auto_911183 ) ) ( not ( = ?auto_911179 ?auto_911184 ) ) ( not ( = ?auto_911179 ?auto_911185 ) ) ( not ( = ?auto_911180 ?auto_911181 ) ) ( not ( = ?auto_911180 ?auto_911182 ) ) ( not ( = ?auto_911180 ?auto_911183 ) ) ( not ( = ?auto_911180 ?auto_911184 ) ) ( not ( = ?auto_911180 ?auto_911185 ) ) ( not ( = ?auto_911181 ?auto_911182 ) ) ( not ( = ?auto_911181 ?auto_911183 ) ) ( not ( = ?auto_911181 ?auto_911184 ) ) ( not ( = ?auto_911181 ?auto_911185 ) ) ( not ( = ?auto_911182 ?auto_911183 ) ) ( not ( = ?auto_911182 ?auto_911184 ) ) ( not ( = ?auto_911182 ?auto_911185 ) ) ( not ( = ?auto_911183 ?auto_911184 ) ) ( not ( = ?auto_911183 ?auto_911185 ) ) ( not ( = ?auto_911184 ?auto_911185 ) ) ( CLEAR ?auto_911182 ) ( ON ?auto_911183 ?auto_911184 ) ( CLEAR ?auto_911183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_911170 ?auto_911171 ?auto_911172 ?auto_911173 ?auto_911174 ?auto_911175 ?auto_911176 ?auto_911177 ?auto_911178 ?auto_911179 ?auto_911180 ?auto_911181 ?auto_911182 ?auto_911183 )
      ( MAKE-15PILE ?auto_911170 ?auto_911171 ?auto_911172 ?auto_911173 ?auto_911174 ?auto_911175 ?auto_911176 ?auto_911177 ?auto_911178 ?auto_911179 ?auto_911180 ?auto_911181 ?auto_911182 ?auto_911183 ?auto_911184 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911232 - BLOCK
      ?auto_911233 - BLOCK
      ?auto_911234 - BLOCK
      ?auto_911235 - BLOCK
      ?auto_911236 - BLOCK
      ?auto_911237 - BLOCK
      ?auto_911238 - BLOCK
      ?auto_911239 - BLOCK
      ?auto_911240 - BLOCK
      ?auto_911241 - BLOCK
      ?auto_911242 - BLOCK
      ?auto_911243 - BLOCK
      ?auto_911244 - BLOCK
      ?auto_911245 - BLOCK
      ?auto_911246 - BLOCK
    )
    :vars
    (
      ?auto_911247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911246 ?auto_911247 ) ( ON-TABLE ?auto_911232 ) ( ON ?auto_911233 ?auto_911232 ) ( ON ?auto_911234 ?auto_911233 ) ( ON ?auto_911235 ?auto_911234 ) ( ON ?auto_911236 ?auto_911235 ) ( ON ?auto_911237 ?auto_911236 ) ( ON ?auto_911238 ?auto_911237 ) ( ON ?auto_911239 ?auto_911238 ) ( ON ?auto_911240 ?auto_911239 ) ( ON ?auto_911241 ?auto_911240 ) ( ON ?auto_911242 ?auto_911241 ) ( ON ?auto_911243 ?auto_911242 ) ( not ( = ?auto_911232 ?auto_911233 ) ) ( not ( = ?auto_911232 ?auto_911234 ) ) ( not ( = ?auto_911232 ?auto_911235 ) ) ( not ( = ?auto_911232 ?auto_911236 ) ) ( not ( = ?auto_911232 ?auto_911237 ) ) ( not ( = ?auto_911232 ?auto_911238 ) ) ( not ( = ?auto_911232 ?auto_911239 ) ) ( not ( = ?auto_911232 ?auto_911240 ) ) ( not ( = ?auto_911232 ?auto_911241 ) ) ( not ( = ?auto_911232 ?auto_911242 ) ) ( not ( = ?auto_911232 ?auto_911243 ) ) ( not ( = ?auto_911232 ?auto_911244 ) ) ( not ( = ?auto_911232 ?auto_911245 ) ) ( not ( = ?auto_911232 ?auto_911246 ) ) ( not ( = ?auto_911232 ?auto_911247 ) ) ( not ( = ?auto_911233 ?auto_911234 ) ) ( not ( = ?auto_911233 ?auto_911235 ) ) ( not ( = ?auto_911233 ?auto_911236 ) ) ( not ( = ?auto_911233 ?auto_911237 ) ) ( not ( = ?auto_911233 ?auto_911238 ) ) ( not ( = ?auto_911233 ?auto_911239 ) ) ( not ( = ?auto_911233 ?auto_911240 ) ) ( not ( = ?auto_911233 ?auto_911241 ) ) ( not ( = ?auto_911233 ?auto_911242 ) ) ( not ( = ?auto_911233 ?auto_911243 ) ) ( not ( = ?auto_911233 ?auto_911244 ) ) ( not ( = ?auto_911233 ?auto_911245 ) ) ( not ( = ?auto_911233 ?auto_911246 ) ) ( not ( = ?auto_911233 ?auto_911247 ) ) ( not ( = ?auto_911234 ?auto_911235 ) ) ( not ( = ?auto_911234 ?auto_911236 ) ) ( not ( = ?auto_911234 ?auto_911237 ) ) ( not ( = ?auto_911234 ?auto_911238 ) ) ( not ( = ?auto_911234 ?auto_911239 ) ) ( not ( = ?auto_911234 ?auto_911240 ) ) ( not ( = ?auto_911234 ?auto_911241 ) ) ( not ( = ?auto_911234 ?auto_911242 ) ) ( not ( = ?auto_911234 ?auto_911243 ) ) ( not ( = ?auto_911234 ?auto_911244 ) ) ( not ( = ?auto_911234 ?auto_911245 ) ) ( not ( = ?auto_911234 ?auto_911246 ) ) ( not ( = ?auto_911234 ?auto_911247 ) ) ( not ( = ?auto_911235 ?auto_911236 ) ) ( not ( = ?auto_911235 ?auto_911237 ) ) ( not ( = ?auto_911235 ?auto_911238 ) ) ( not ( = ?auto_911235 ?auto_911239 ) ) ( not ( = ?auto_911235 ?auto_911240 ) ) ( not ( = ?auto_911235 ?auto_911241 ) ) ( not ( = ?auto_911235 ?auto_911242 ) ) ( not ( = ?auto_911235 ?auto_911243 ) ) ( not ( = ?auto_911235 ?auto_911244 ) ) ( not ( = ?auto_911235 ?auto_911245 ) ) ( not ( = ?auto_911235 ?auto_911246 ) ) ( not ( = ?auto_911235 ?auto_911247 ) ) ( not ( = ?auto_911236 ?auto_911237 ) ) ( not ( = ?auto_911236 ?auto_911238 ) ) ( not ( = ?auto_911236 ?auto_911239 ) ) ( not ( = ?auto_911236 ?auto_911240 ) ) ( not ( = ?auto_911236 ?auto_911241 ) ) ( not ( = ?auto_911236 ?auto_911242 ) ) ( not ( = ?auto_911236 ?auto_911243 ) ) ( not ( = ?auto_911236 ?auto_911244 ) ) ( not ( = ?auto_911236 ?auto_911245 ) ) ( not ( = ?auto_911236 ?auto_911246 ) ) ( not ( = ?auto_911236 ?auto_911247 ) ) ( not ( = ?auto_911237 ?auto_911238 ) ) ( not ( = ?auto_911237 ?auto_911239 ) ) ( not ( = ?auto_911237 ?auto_911240 ) ) ( not ( = ?auto_911237 ?auto_911241 ) ) ( not ( = ?auto_911237 ?auto_911242 ) ) ( not ( = ?auto_911237 ?auto_911243 ) ) ( not ( = ?auto_911237 ?auto_911244 ) ) ( not ( = ?auto_911237 ?auto_911245 ) ) ( not ( = ?auto_911237 ?auto_911246 ) ) ( not ( = ?auto_911237 ?auto_911247 ) ) ( not ( = ?auto_911238 ?auto_911239 ) ) ( not ( = ?auto_911238 ?auto_911240 ) ) ( not ( = ?auto_911238 ?auto_911241 ) ) ( not ( = ?auto_911238 ?auto_911242 ) ) ( not ( = ?auto_911238 ?auto_911243 ) ) ( not ( = ?auto_911238 ?auto_911244 ) ) ( not ( = ?auto_911238 ?auto_911245 ) ) ( not ( = ?auto_911238 ?auto_911246 ) ) ( not ( = ?auto_911238 ?auto_911247 ) ) ( not ( = ?auto_911239 ?auto_911240 ) ) ( not ( = ?auto_911239 ?auto_911241 ) ) ( not ( = ?auto_911239 ?auto_911242 ) ) ( not ( = ?auto_911239 ?auto_911243 ) ) ( not ( = ?auto_911239 ?auto_911244 ) ) ( not ( = ?auto_911239 ?auto_911245 ) ) ( not ( = ?auto_911239 ?auto_911246 ) ) ( not ( = ?auto_911239 ?auto_911247 ) ) ( not ( = ?auto_911240 ?auto_911241 ) ) ( not ( = ?auto_911240 ?auto_911242 ) ) ( not ( = ?auto_911240 ?auto_911243 ) ) ( not ( = ?auto_911240 ?auto_911244 ) ) ( not ( = ?auto_911240 ?auto_911245 ) ) ( not ( = ?auto_911240 ?auto_911246 ) ) ( not ( = ?auto_911240 ?auto_911247 ) ) ( not ( = ?auto_911241 ?auto_911242 ) ) ( not ( = ?auto_911241 ?auto_911243 ) ) ( not ( = ?auto_911241 ?auto_911244 ) ) ( not ( = ?auto_911241 ?auto_911245 ) ) ( not ( = ?auto_911241 ?auto_911246 ) ) ( not ( = ?auto_911241 ?auto_911247 ) ) ( not ( = ?auto_911242 ?auto_911243 ) ) ( not ( = ?auto_911242 ?auto_911244 ) ) ( not ( = ?auto_911242 ?auto_911245 ) ) ( not ( = ?auto_911242 ?auto_911246 ) ) ( not ( = ?auto_911242 ?auto_911247 ) ) ( not ( = ?auto_911243 ?auto_911244 ) ) ( not ( = ?auto_911243 ?auto_911245 ) ) ( not ( = ?auto_911243 ?auto_911246 ) ) ( not ( = ?auto_911243 ?auto_911247 ) ) ( not ( = ?auto_911244 ?auto_911245 ) ) ( not ( = ?auto_911244 ?auto_911246 ) ) ( not ( = ?auto_911244 ?auto_911247 ) ) ( not ( = ?auto_911245 ?auto_911246 ) ) ( not ( = ?auto_911245 ?auto_911247 ) ) ( not ( = ?auto_911246 ?auto_911247 ) ) ( ON ?auto_911245 ?auto_911246 ) ( CLEAR ?auto_911243 ) ( ON ?auto_911244 ?auto_911245 ) ( CLEAR ?auto_911244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_911232 ?auto_911233 ?auto_911234 ?auto_911235 ?auto_911236 ?auto_911237 ?auto_911238 ?auto_911239 ?auto_911240 ?auto_911241 ?auto_911242 ?auto_911243 ?auto_911244 )
      ( MAKE-15PILE ?auto_911232 ?auto_911233 ?auto_911234 ?auto_911235 ?auto_911236 ?auto_911237 ?auto_911238 ?auto_911239 ?auto_911240 ?auto_911241 ?auto_911242 ?auto_911243 ?auto_911244 ?auto_911245 ?auto_911246 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911294 - BLOCK
      ?auto_911295 - BLOCK
      ?auto_911296 - BLOCK
      ?auto_911297 - BLOCK
      ?auto_911298 - BLOCK
      ?auto_911299 - BLOCK
      ?auto_911300 - BLOCK
      ?auto_911301 - BLOCK
      ?auto_911302 - BLOCK
      ?auto_911303 - BLOCK
      ?auto_911304 - BLOCK
      ?auto_911305 - BLOCK
      ?auto_911306 - BLOCK
      ?auto_911307 - BLOCK
      ?auto_911308 - BLOCK
    )
    :vars
    (
      ?auto_911309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911308 ?auto_911309 ) ( ON-TABLE ?auto_911294 ) ( ON ?auto_911295 ?auto_911294 ) ( ON ?auto_911296 ?auto_911295 ) ( ON ?auto_911297 ?auto_911296 ) ( ON ?auto_911298 ?auto_911297 ) ( ON ?auto_911299 ?auto_911298 ) ( ON ?auto_911300 ?auto_911299 ) ( ON ?auto_911301 ?auto_911300 ) ( ON ?auto_911302 ?auto_911301 ) ( ON ?auto_911303 ?auto_911302 ) ( ON ?auto_911304 ?auto_911303 ) ( not ( = ?auto_911294 ?auto_911295 ) ) ( not ( = ?auto_911294 ?auto_911296 ) ) ( not ( = ?auto_911294 ?auto_911297 ) ) ( not ( = ?auto_911294 ?auto_911298 ) ) ( not ( = ?auto_911294 ?auto_911299 ) ) ( not ( = ?auto_911294 ?auto_911300 ) ) ( not ( = ?auto_911294 ?auto_911301 ) ) ( not ( = ?auto_911294 ?auto_911302 ) ) ( not ( = ?auto_911294 ?auto_911303 ) ) ( not ( = ?auto_911294 ?auto_911304 ) ) ( not ( = ?auto_911294 ?auto_911305 ) ) ( not ( = ?auto_911294 ?auto_911306 ) ) ( not ( = ?auto_911294 ?auto_911307 ) ) ( not ( = ?auto_911294 ?auto_911308 ) ) ( not ( = ?auto_911294 ?auto_911309 ) ) ( not ( = ?auto_911295 ?auto_911296 ) ) ( not ( = ?auto_911295 ?auto_911297 ) ) ( not ( = ?auto_911295 ?auto_911298 ) ) ( not ( = ?auto_911295 ?auto_911299 ) ) ( not ( = ?auto_911295 ?auto_911300 ) ) ( not ( = ?auto_911295 ?auto_911301 ) ) ( not ( = ?auto_911295 ?auto_911302 ) ) ( not ( = ?auto_911295 ?auto_911303 ) ) ( not ( = ?auto_911295 ?auto_911304 ) ) ( not ( = ?auto_911295 ?auto_911305 ) ) ( not ( = ?auto_911295 ?auto_911306 ) ) ( not ( = ?auto_911295 ?auto_911307 ) ) ( not ( = ?auto_911295 ?auto_911308 ) ) ( not ( = ?auto_911295 ?auto_911309 ) ) ( not ( = ?auto_911296 ?auto_911297 ) ) ( not ( = ?auto_911296 ?auto_911298 ) ) ( not ( = ?auto_911296 ?auto_911299 ) ) ( not ( = ?auto_911296 ?auto_911300 ) ) ( not ( = ?auto_911296 ?auto_911301 ) ) ( not ( = ?auto_911296 ?auto_911302 ) ) ( not ( = ?auto_911296 ?auto_911303 ) ) ( not ( = ?auto_911296 ?auto_911304 ) ) ( not ( = ?auto_911296 ?auto_911305 ) ) ( not ( = ?auto_911296 ?auto_911306 ) ) ( not ( = ?auto_911296 ?auto_911307 ) ) ( not ( = ?auto_911296 ?auto_911308 ) ) ( not ( = ?auto_911296 ?auto_911309 ) ) ( not ( = ?auto_911297 ?auto_911298 ) ) ( not ( = ?auto_911297 ?auto_911299 ) ) ( not ( = ?auto_911297 ?auto_911300 ) ) ( not ( = ?auto_911297 ?auto_911301 ) ) ( not ( = ?auto_911297 ?auto_911302 ) ) ( not ( = ?auto_911297 ?auto_911303 ) ) ( not ( = ?auto_911297 ?auto_911304 ) ) ( not ( = ?auto_911297 ?auto_911305 ) ) ( not ( = ?auto_911297 ?auto_911306 ) ) ( not ( = ?auto_911297 ?auto_911307 ) ) ( not ( = ?auto_911297 ?auto_911308 ) ) ( not ( = ?auto_911297 ?auto_911309 ) ) ( not ( = ?auto_911298 ?auto_911299 ) ) ( not ( = ?auto_911298 ?auto_911300 ) ) ( not ( = ?auto_911298 ?auto_911301 ) ) ( not ( = ?auto_911298 ?auto_911302 ) ) ( not ( = ?auto_911298 ?auto_911303 ) ) ( not ( = ?auto_911298 ?auto_911304 ) ) ( not ( = ?auto_911298 ?auto_911305 ) ) ( not ( = ?auto_911298 ?auto_911306 ) ) ( not ( = ?auto_911298 ?auto_911307 ) ) ( not ( = ?auto_911298 ?auto_911308 ) ) ( not ( = ?auto_911298 ?auto_911309 ) ) ( not ( = ?auto_911299 ?auto_911300 ) ) ( not ( = ?auto_911299 ?auto_911301 ) ) ( not ( = ?auto_911299 ?auto_911302 ) ) ( not ( = ?auto_911299 ?auto_911303 ) ) ( not ( = ?auto_911299 ?auto_911304 ) ) ( not ( = ?auto_911299 ?auto_911305 ) ) ( not ( = ?auto_911299 ?auto_911306 ) ) ( not ( = ?auto_911299 ?auto_911307 ) ) ( not ( = ?auto_911299 ?auto_911308 ) ) ( not ( = ?auto_911299 ?auto_911309 ) ) ( not ( = ?auto_911300 ?auto_911301 ) ) ( not ( = ?auto_911300 ?auto_911302 ) ) ( not ( = ?auto_911300 ?auto_911303 ) ) ( not ( = ?auto_911300 ?auto_911304 ) ) ( not ( = ?auto_911300 ?auto_911305 ) ) ( not ( = ?auto_911300 ?auto_911306 ) ) ( not ( = ?auto_911300 ?auto_911307 ) ) ( not ( = ?auto_911300 ?auto_911308 ) ) ( not ( = ?auto_911300 ?auto_911309 ) ) ( not ( = ?auto_911301 ?auto_911302 ) ) ( not ( = ?auto_911301 ?auto_911303 ) ) ( not ( = ?auto_911301 ?auto_911304 ) ) ( not ( = ?auto_911301 ?auto_911305 ) ) ( not ( = ?auto_911301 ?auto_911306 ) ) ( not ( = ?auto_911301 ?auto_911307 ) ) ( not ( = ?auto_911301 ?auto_911308 ) ) ( not ( = ?auto_911301 ?auto_911309 ) ) ( not ( = ?auto_911302 ?auto_911303 ) ) ( not ( = ?auto_911302 ?auto_911304 ) ) ( not ( = ?auto_911302 ?auto_911305 ) ) ( not ( = ?auto_911302 ?auto_911306 ) ) ( not ( = ?auto_911302 ?auto_911307 ) ) ( not ( = ?auto_911302 ?auto_911308 ) ) ( not ( = ?auto_911302 ?auto_911309 ) ) ( not ( = ?auto_911303 ?auto_911304 ) ) ( not ( = ?auto_911303 ?auto_911305 ) ) ( not ( = ?auto_911303 ?auto_911306 ) ) ( not ( = ?auto_911303 ?auto_911307 ) ) ( not ( = ?auto_911303 ?auto_911308 ) ) ( not ( = ?auto_911303 ?auto_911309 ) ) ( not ( = ?auto_911304 ?auto_911305 ) ) ( not ( = ?auto_911304 ?auto_911306 ) ) ( not ( = ?auto_911304 ?auto_911307 ) ) ( not ( = ?auto_911304 ?auto_911308 ) ) ( not ( = ?auto_911304 ?auto_911309 ) ) ( not ( = ?auto_911305 ?auto_911306 ) ) ( not ( = ?auto_911305 ?auto_911307 ) ) ( not ( = ?auto_911305 ?auto_911308 ) ) ( not ( = ?auto_911305 ?auto_911309 ) ) ( not ( = ?auto_911306 ?auto_911307 ) ) ( not ( = ?auto_911306 ?auto_911308 ) ) ( not ( = ?auto_911306 ?auto_911309 ) ) ( not ( = ?auto_911307 ?auto_911308 ) ) ( not ( = ?auto_911307 ?auto_911309 ) ) ( not ( = ?auto_911308 ?auto_911309 ) ) ( ON ?auto_911307 ?auto_911308 ) ( ON ?auto_911306 ?auto_911307 ) ( CLEAR ?auto_911304 ) ( ON ?auto_911305 ?auto_911306 ) ( CLEAR ?auto_911305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_911294 ?auto_911295 ?auto_911296 ?auto_911297 ?auto_911298 ?auto_911299 ?auto_911300 ?auto_911301 ?auto_911302 ?auto_911303 ?auto_911304 ?auto_911305 )
      ( MAKE-15PILE ?auto_911294 ?auto_911295 ?auto_911296 ?auto_911297 ?auto_911298 ?auto_911299 ?auto_911300 ?auto_911301 ?auto_911302 ?auto_911303 ?auto_911304 ?auto_911305 ?auto_911306 ?auto_911307 ?auto_911308 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911356 - BLOCK
      ?auto_911357 - BLOCK
      ?auto_911358 - BLOCK
      ?auto_911359 - BLOCK
      ?auto_911360 - BLOCK
      ?auto_911361 - BLOCK
      ?auto_911362 - BLOCK
      ?auto_911363 - BLOCK
      ?auto_911364 - BLOCK
      ?auto_911365 - BLOCK
      ?auto_911366 - BLOCK
      ?auto_911367 - BLOCK
      ?auto_911368 - BLOCK
      ?auto_911369 - BLOCK
      ?auto_911370 - BLOCK
    )
    :vars
    (
      ?auto_911371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911370 ?auto_911371 ) ( ON-TABLE ?auto_911356 ) ( ON ?auto_911357 ?auto_911356 ) ( ON ?auto_911358 ?auto_911357 ) ( ON ?auto_911359 ?auto_911358 ) ( ON ?auto_911360 ?auto_911359 ) ( ON ?auto_911361 ?auto_911360 ) ( ON ?auto_911362 ?auto_911361 ) ( ON ?auto_911363 ?auto_911362 ) ( ON ?auto_911364 ?auto_911363 ) ( ON ?auto_911365 ?auto_911364 ) ( not ( = ?auto_911356 ?auto_911357 ) ) ( not ( = ?auto_911356 ?auto_911358 ) ) ( not ( = ?auto_911356 ?auto_911359 ) ) ( not ( = ?auto_911356 ?auto_911360 ) ) ( not ( = ?auto_911356 ?auto_911361 ) ) ( not ( = ?auto_911356 ?auto_911362 ) ) ( not ( = ?auto_911356 ?auto_911363 ) ) ( not ( = ?auto_911356 ?auto_911364 ) ) ( not ( = ?auto_911356 ?auto_911365 ) ) ( not ( = ?auto_911356 ?auto_911366 ) ) ( not ( = ?auto_911356 ?auto_911367 ) ) ( not ( = ?auto_911356 ?auto_911368 ) ) ( not ( = ?auto_911356 ?auto_911369 ) ) ( not ( = ?auto_911356 ?auto_911370 ) ) ( not ( = ?auto_911356 ?auto_911371 ) ) ( not ( = ?auto_911357 ?auto_911358 ) ) ( not ( = ?auto_911357 ?auto_911359 ) ) ( not ( = ?auto_911357 ?auto_911360 ) ) ( not ( = ?auto_911357 ?auto_911361 ) ) ( not ( = ?auto_911357 ?auto_911362 ) ) ( not ( = ?auto_911357 ?auto_911363 ) ) ( not ( = ?auto_911357 ?auto_911364 ) ) ( not ( = ?auto_911357 ?auto_911365 ) ) ( not ( = ?auto_911357 ?auto_911366 ) ) ( not ( = ?auto_911357 ?auto_911367 ) ) ( not ( = ?auto_911357 ?auto_911368 ) ) ( not ( = ?auto_911357 ?auto_911369 ) ) ( not ( = ?auto_911357 ?auto_911370 ) ) ( not ( = ?auto_911357 ?auto_911371 ) ) ( not ( = ?auto_911358 ?auto_911359 ) ) ( not ( = ?auto_911358 ?auto_911360 ) ) ( not ( = ?auto_911358 ?auto_911361 ) ) ( not ( = ?auto_911358 ?auto_911362 ) ) ( not ( = ?auto_911358 ?auto_911363 ) ) ( not ( = ?auto_911358 ?auto_911364 ) ) ( not ( = ?auto_911358 ?auto_911365 ) ) ( not ( = ?auto_911358 ?auto_911366 ) ) ( not ( = ?auto_911358 ?auto_911367 ) ) ( not ( = ?auto_911358 ?auto_911368 ) ) ( not ( = ?auto_911358 ?auto_911369 ) ) ( not ( = ?auto_911358 ?auto_911370 ) ) ( not ( = ?auto_911358 ?auto_911371 ) ) ( not ( = ?auto_911359 ?auto_911360 ) ) ( not ( = ?auto_911359 ?auto_911361 ) ) ( not ( = ?auto_911359 ?auto_911362 ) ) ( not ( = ?auto_911359 ?auto_911363 ) ) ( not ( = ?auto_911359 ?auto_911364 ) ) ( not ( = ?auto_911359 ?auto_911365 ) ) ( not ( = ?auto_911359 ?auto_911366 ) ) ( not ( = ?auto_911359 ?auto_911367 ) ) ( not ( = ?auto_911359 ?auto_911368 ) ) ( not ( = ?auto_911359 ?auto_911369 ) ) ( not ( = ?auto_911359 ?auto_911370 ) ) ( not ( = ?auto_911359 ?auto_911371 ) ) ( not ( = ?auto_911360 ?auto_911361 ) ) ( not ( = ?auto_911360 ?auto_911362 ) ) ( not ( = ?auto_911360 ?auto_911363 ) ) ( not ( = ?auto_911360 ?auto_911364 ) ) ( not ( = ?auto_911360 ?auto_911365 ) ) ( not ( = ?auto_911360 ?auto_911366 ) ) ( not ( = ?auto_911360 ?auto_911367 ) ) ( not ( = ?auto_911360 ?auto_911368 ) ) ( not ( = ?auto_911360 ?auto_911369 ) ) ( not ( = ?auto_911360 ?auto_911370 ) ) ( not ( = ?auto_911360 ?auto_911371 ) ) ( not ( = ?auto_911361 ?auto_911362 ) ) ( not ( = ?auto_911361 ?auto_911363 ) ) ( not ( = ?auto_911361 ?auto_911364 ) ) ( not ( = ?auto_911361 ?auto_911365 ) ) ( not ( = ?auto_911361 ?auto_911366 ) ) ( not ( = ?auto_911361 ?auto_911367 ) ) ( not ( = ?auto_911361 ?auto_911368 ) ) ( not ( = ?auto_911361 ?auto_911369 ) ) ( not ( = ?auto_911361 ?auto_911370 ) ) ( not ( = ?auto_911361 ?auto_911371 ) ) ( not ( = ?auto_911362 ?auto_911363 ) ) ( not ( = ?auto_911362 ?auto_911364 ) ) ( not ( = ?auto_911362 ?auto_911365 ) ) ( not ( = ?auto_911362 ?auto_911366 ) ) ( not ( = ?auto_911362 ?auto_911367 ) ) ( not ( = ?auto_911362 ?auto_911368 ) ) ( not ( = ?auto_911362 ?auto_911369 ) ) ( not ( = ?auto_911362 ?auto_911370 ) ) ( not ( = ?auto_911362 ?auto_911371 ) ) ( not ( = ?auto_911363 ?auto_911364 ) ) ( not ( = ?auto_911363 ?auto_911365 ) ) ( not ( = ?auto_911363 ?auto_911366 ) ) ( not ( = ?auto_911363 ?auto_911367 ) ) ( not ( = ?auto_911363 ?auto_911368 ) ) ( not ( = ?auto_911363 ?auto_911369 ) ) ( not ( = ?auto_911363 ?auto_911370 ) ) ( not ( = ?auto_911363 ?auto_911371 ) ) ( not ( = ?auto_911364 ?auto_911365 ) ) ( not ( = ?auto_911364 ?auto_911366 ) ) ( not ( = ?auto_911364 ?auto_911367 ) ) ( not ( = ?auto_911364 ?auto_911368 ) ) ( not ( = ?auto_911364 ?auto_911369 ) ) ( not ( = ?auto_911364 ?auto_911370 ) ) ( not ( = ?auto_911364 ?auto_911371 ) ) ( not ( = ?auto_911365 ?auto_911366 ) ) ( not ( = ?auto_911365 ?auto_911367 ) ) ( not ( = ?auto_911365 ?auto_911368 ) ) ( not ( = ?auto_911365 ?auto_911369 ) ) ( not ( = ?auto_911365 ?auto_911370 ) ) ( not ( = ?auto_911365 ?auto_911371 ) ) ( not ( = ?auto_911366 ?auto_911367 ) ) ( not ( = ?auto_911366 ?auto_911368 ) ) ( not ( = ?auto_911366 ?auto_911369 ) ) ( not ( = ?auto_911366 ?auto_911370 ) ) ( not ( = ?auto_911366 ?auto_911371 ) ) ( not ( = ?auto_911367 ?auto_911368 ) ) ( not ( = ?auto_911367 ?auto_911369 ) ) ( not ( = ?auto_911367 ?auto_911370 ) ) ( not ( = ?auto_911367 ?auto_911371 ) ) ( not ( = ?auto_911368 ?auto_911369 ) ) ( not ( = ?auto_911368 ?auto_911370 ) ) ( not ( = ?auto_911368 ?auto_911371 ) ) ( not ( = ?auto_911369 ?auto_911370 ) ) ( not ( = ?auto_911369 ?auto_911371 ) ) ( not ( = ?auto_911370 ?auto_911371 ) ) ( ON ?auto_911369 ?auto_911370 ) ( ON ?auto_911368 ?auto_911369 ) ( ON ?auto_911367 ?auto_911368 ) ( CLEAR ?auto_911365 ) ( ON ?auto_911366 ?auto_911367 ) ( CLEAR ?auto_911366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_911356 ?auto_911357 ?auto_911358 ?auto_911359 ?auto_911360 ?auto_911361 ?auto_911362 ?auto_911363 ?auto_911364 ?auto_911365 ?auto_911366 )
      ( MAKE-15PILE ?auto_911356 ?auto_911357 ?auto_911358 ?auto_911359 ?auto_911360 ?auto_911361 ?auto_911362 ?auto_911363 ?auto_911364 ?auto_911365 ?auto_911366 ?auto_911367 ?auto_911368 ?auto_911369 ?auto_911370 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911418 - BLOCK
      ?auto_911419 - BLOCK
      ?auto_911420 - BLOCK
      ?auto_911421 - BLOCK
      ?auto_911422 - BLOCK
      ?auto_911423 - BLOCK
      ?auto_911424 - BLOCK
      ?auto_911425 - BLOCK
      ?auto_911426 - BLOCK
      ?auto_911427 - BLOCK
      ?auto_911428 - BLOCK
      ?auto_911429 - BLOCK
      ?auto_911430 - BLOCK
      ?auto_911431 - BLOCK
      ?auto_911432 - BLOCK
    )
    :vars
    (
      ?auto_911433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911432 ?auto_911433 ) ( ON-TABLE ?auto_911418 ) ( ON ?auto_911419 ?auto_911418 ) ( ON ?auto_911420 ?auto_911419 ) ( ON ?auto_911421 ?auto_911420 ) ( ON ?auto_911422 ?auto_911421 ) ( ON ?auto_911423 ?auto_911422 ) ( ON ?auto_911424 ?auto_911423 ) ( ON ?auto_911425 ?auto_911424 ) ( ON ?auto_911426 ?auto_911425 ) ( not ( = ?auto_911418 ?auto_911419 ) ) ( not ( = ?auto_911418 ?auto_911420 ) ) ( not ( = ?auto_911418 ?auto_911421 ) ) ( not ( = ?auto_911418 ?auto_911422 ) ) ( not ( = ?auto_911418 ?auto_911423 ) ) ( not ( = ?auto_911418 ?auto_911424 ) ) ( not ( = ?auto_911418 ?auto_911425 ) ) ( not ( = ?auto_911418 ?auto_911426 ) ) ( not ( = ?auto_911418 ?auto_911427 ) ) ( not ( = ?auto_911418 ?auto_911428 ) ) ( not ( = ?auto_911418 ?auto_911429 ) ) ( not ( = ?auto_911418 ?auto_911430 ) ) ( not ( = ?auto_911418 ?auto_911431 ) ) ( not ( = ?auto_911418 ?auto_911432 ) ) ( not ( = ?auto_911418 ?auto_911433 ) ) ( not ( = ?auto_911419 ?auto_911420 ) ) ( not ( = ?auto_911419 ?auto_911421 ) ) ( not ( = ?auto_911419 ?auto_911422 ) ) ( not ( = ?auto_911419 ?auto_911423 ) ) ( not ( = ?auto_911419 ?auto_911424 ) ) ( not ( = ?auto_911419 ?auto_911425 ) ) ( not ( = ?auto_911419 ?auto_911426 ) ) ( not ( = ?auto_911419 ?auto_911427 ) ) ( not ( = ?auto_911419 ?auto_911428 ) ) ( not ( = ?auto_911419 ?auto_911429 ) ) ( not ( = ?auto_911419 ?auto_911430 ) ) ( not ( = ?auto_911419 ?auto_911431 ) ) ( not ( = ?auto_911419 ?auto_911432 ) ) ( not ( = ?auto_911419 ?auto_911433 ) ) ( not ( = ?auto_911420 ?auto_911421 ) ) ( not ( = ?auto_911420 ?auto_911422 ) ) ( not ( = ?auto_911420 ?auto_911423 ) ) ( not ( = ?auto_911420 ?auto_911424 ) ) ( not ( = ?auto_911420 ?auto_911425 ) ) ( not ( = ?auto_911420 ?auto_911426 ) ) ( not ( = ?auto_911420 ?auto_911427 ) ) ( not ( = ?auto_911420 ?auto_911428 ) ) ( not ( = ?auto_911420 ?auto_911429 ) ) ( not ( = ?auto_911420 ?auto_911430 ) ) ( not ( = ?auto_911420 ?auto_911431 ) ) ( not ( = ?auto_911420 ?auto_911432 ) ) ( not ( = ?auto_911420 ?auto_911433 ) ) ( not ( = ?auto_911421 ?auto_911422 ) ) ( not ( = ?auto_911421 ?auto_911423 ) ) ( not ( = ?auto_911421 ?auto_911424 ) ) ( not ( = ?auto_911421 ?auto_911425 ) ) ( not ( = ?auto_911421 ?auto_911426 ) ) ( not ( = ?auto_911421 ?auto_911427 ) ) ( not ( = ?auto_911421 ?auto_911428 ) ) ( not ( = ?auto_911421 ?auto_911429 ) ) ( not ( = ?auto_911421 ?auto_911430 ) ) ( not ( = ?auto_911421 ?auto_911431 ) ) ( not ( = ?auto_911421 ?auto_911432 ) ) ( not ( = ?auto_911421 ?auto_911433 ) ) ( not ( = ?auto_911422 ?auto_911423 ) ) ( not ( = ?auto_911422 ?auto_911424 ) ) ( not ( = ?auto_911422 ?auto_911425 ) ) ( not ( = ?auto_911422 ?auto_911426 ) ) ( not ( = ?auto_911422 ?auto_911427 ) ) ( not ( = ?auto_911422 ?auto_911428 ) ) ( not ( = ?auto_911422 ?auto_911429 ) ) ( not ( = ?auto_911422 ?auto_911430 ) ) ( not ( = ?auto_911422 ?auto_911431 ) ) ( not ( = ?auto_911422 ?auto_911432 ) ) ( not ( = ?auto_911422 ?auto_911433 ) ) ( not ( = ?auto_911423 ?auto_911424 ) ) ( not ( = ?auto_911423 ?auto_911425 ) ) ( not ( = ?auto_911423 ?auto_911426 ) ) ( not ( = ?auto_911423 ?auto_911427 ) ) ( not ( = ?auto_911423 ?auto_911428 ) ) ( not ( = ?auto_911423 ?auto_911429 ) ) ( not ( = ?auto_911423 ?auto_911430 ) ) ( not ( = ?auto_911423 ?auto_911431 ) ) ( not ( = ?auto_911423 ?auto_911432 ) ) ( not ( = ?auto_911423 ?auto_911433 ) ) ( not ( = ?auto_911424 ?auto_911425 ) ) ( not ( = ?auto_911424 ?auto_911426 ) ) ( not ( = ?auto_911424 ?auto_911427 ) ) ( not ( = ?auto_911424 ?auto_911428 ) ) ( not ( = ?auto_911424 ?auto_911429 ) ) ( not ( = ?auto_911424 ?auto_911430 ) ) ( not ( = ?auto_911424 ?auto_911431 ) ) ( not ( = ?auto_911424 ?auto_911432 ) ) ( not ( = ?auto_911424 ?auto_911433 ) ) ( not ( = ?auto_911425 ?auto_911426 ) ) ( not ( = ?auto_911425 ?auto_911427 ) ) ( not ( = ?auto_911425 ?auto_911428 ) ) ( not ( = ?auto_911425 ?auto_911429 ) ) ( not ( = ?auto_911425 ?auto_911430 ) ) ( not ( = ?auto_911425 ?auto_911431 ) ) ( not ( = ?auto_911425 ?auto_911432 ) ) ( not ( = ?auto_911425 ?auto_911433 ) ) ( not ( = ?auto_911426 ?auto_911427 ) ) ( not ( = ?auto_911426 ?auto_911428 ) ) ( not ( = ?auto_911426 ?auto_911429 ) ) ( not ( = ?auto_911426 ?auto_911430 ) ) ( not ( = ?auto_911426 ?auto_911431 ) ) ( not ( = ?auto_911426 ?auto_911432 ) ) ( not ( = ?auto_911426 ?auto_911433 ) ) ( not ( = ?auto_911427 ?auto_911428 ) ) ( not ( = ?auto_911427 ?auto_911429 ) ) ( not ( = ?auto_911427 ?auto_911430 ) ) ( not ( = ?auto_911427 ?auto_911431 ) ) ( not ( = ?auto_911427 ?auto_911432 ) ) ( not ( = ?auto_911427 ?auto_911433 ) ) ( not ( = ?auto_911428 ?auto_911429 ) ) ( not ( = ?auto_911428 ?auto_911430 ) ) ( not ( = ?auto_911428 ?auto_911431 ) ) ( not ( = ?auto_911428 ?auto_911432 ) ) ( not ( = ?auto_911428 ?auto_911433 ) ) ( not ( = ?auto_911429 ?auto_911430 ) ) ( not ( = ?auto_911429 ?auto_911431 ) ) ( not ( = ?auto_911429 ?auto_911432 ) ) ( not ( = ?auto_911429 ?auto_911433 ) ) ( not ( = ?auto_911430 ?auto_911431 ) ) ( not ( = ?auto_911430 ?auto_911432 ) ) ( not ( = ?auto_911430 ?auto_911433 ) ) ( not ( = ?auto_911431 ?auto_911432 ) ) ( not ( = ?auto_911431 ?auto_911433 ) ) ( not ( = ?auto_911432 ?auto_911433 ) ) ( ON ?auto_911431 ?auto_911432 ) ( ON ?auto_911430 ?auto_911431 ) ( ON ?auto_911429 ?auto_911430 ) ( ON ?auto_911428 ?auto_911429 ) ( CLEAR ?auto_911426 ) ( ON ?auto_911427 ?auto_911428 ) ( CLEAR ?auto_911427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_911418 ?auto_911419 ?auto_911420 ?auto_911421 ?auto_911422 ?auto_911423 ?auto_911424 ?auto_911425 ?auto_911426 ?auto_911427 )
      ( MAKE-15PILE ?auto_911418 ?auto_911419 ?auto_911420 ?auto_911421 ?auto_911422 ?auto_911423 ?auto_911424 ?auto_911425 ?auto_911426 ?auto_911427 ?auto_911428 ?auto_911429 ?auto_911430 ?auto_911431 ?auto_911432 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911480 - BLOCK
      ?auto_911481 - BLOCK
      ?auto_911482 - BLOCK
      ?auto_911483 - BLOCK
      ?auto_911484 - BLOCK
      ?auto_911485 - BLOCK
      ?auto_911486 - BLOCK
      ?auto_911487 - BLOCK
      ?auto_911488 - BLOCK
      ?auto_911489 - BLOCK
      ?auto_911490 - BLOCK
      ?auto_911491 - BLOCK
      ?auto_911492 - BLOCK
      ?auto_911493 - BLOCK
      ?auto_911494 - BLOCK
    )
    :vars
    (
      ?auto_911495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911494 ?auto_911495 ) ( ON-TABLE ?auto_911480 ) ( ON ?auto_911481 ?auto_911480 ) ( ON ?auto_911482 ?auto_911481 ) ( ON ?auto_911483 ?auto_911482 ) ( ON ?auto_911484 ?auto_911483 ) ( ON ?auto_911485 ?auto_911484 ) ( ON ?auto_911486 ?auto_911485 ) ( ON ?auto_911487 ?auto_911486 ) ( not ( = ?auto_911480 ?auto_911481 ) ) ( not ( = ?auto_911480 ?auto_911482 ) ) ( not ( = ?auto_911480 ?auto_911483 ) ) ( not ( = ?auto_911480 ?auto_911484 ) ) ( not ( = ?auto_911480 ?auto_911485 ) ) ( not ( = ?auto_911480 ?auto_911486 ) ) ( not ( = ?auto_911480 ?auto_911487 ) ) ( not ( = ?auto_911480 ?auto_911488 ) ) ( not ( = ?auto_911480 ?auto_911489 ) ) ( not ( = ?auto_911480 ?auto_911490 ) ) ( not ( = ?auto_911480 ?auto_911491 ) ) ( not ( = ?auto_911480 ?auto_911492 ) ) ( not ( = ?auto_911480 ?auto_911493 ) ) ( not ( = ?auto_911480 ?auto_911494 ) ) ( not ( = ?auto_911480 ?auto_911495 ) ) ( not ( = ?auto_911481 ?auto_911482 ) ) ( not ( = ?auto_911481 ?auto_911483 ) ) ( not ( = ?auto_911481 ?auto_911484 ) ) ( not ( = ?auto_911481 ?auto_911485 ) ) ( not ( = ?auto_911481 ?auto_911486 ) ) ( not ( = ?auto_911481 ?auto_911487 ) ) ( not ( = ?auto_911481 ?auto_911488 ) ) ( not ( = ?auto_911481 ?auto_911489 ) ) ( not ( = ?auto_911481 ?auto_911490 ) ) ( not ( = ?auto_911481 ?auto_911491 ) ) ( not ( = ?auto_911481 ?auto_911492 ) ) ( not ( = ?auto_911481 ?auto_911493 ) ) ( not ( = ?auto_911481 ?auto_911494 ) ) ( not ( = ?auto_911481 ?auto_911495 ) ) ( not ( = ?auto_911482 ?auto_911483 ) ) ( not ( = ?auto_911482 ?auto_911484 ) ) ( not ( = ?auto_911482 ?auto_911485 ) ) ( not ( = ?auto_911482 ?auto_911486 ) ) ( not ( = ?auto_911482 ?auto_911487 ) ) ( not ( = ?auto_911482 ?auto_911488 ) ) ( not ( = ?auto_911482 ?auto_911489 ) ) ( not ( = ?auto_911482 ?auto_911490 ) ) ( not ( = ?auto_911482 ?auto_911491 ) ) ( not ( = ?auto_911482 ?auto_911492 ) ) ( not ( = ?auto_911482 ?auto_911493 ) ) ( not ( = ?auto_911482 ?auto_911494 ) ) ( not ( = ?auto_911482 ?auto_911495 ) ) ( not ( = ?auto_911483 ?auto_911484 ) ) ( not ( = ?auto_911483 ?auto_911485 ) ) ( not ( = ?auto_911483 ?auto_911486 ) ) ( not ( = ?auto_911483 ?auto_911487 ) ) ( not ( = ?auto_911483 ?auto_911488 ) ) ( not ( = ?auto_911483 ?auto_911489 ) ) ( not ( = ?auto_911483 ?auto_911490 ) ) ( not ( = ?auto_911483 ?auto_911491 ) ) ( not ( = ?auto_911483 ?auto_911492 ) ) ( not ( = ?auto_911483 ?auto_911493 ) ) ( not ( = ?auto_911483 ?auto_911494 ) ) ( not ( = ?auto_911483 ?auto_911495 ) ) ( not ( = ?auto_911484 ?auto_911485 ) ) ( not ( = ?auto_911484 ?auto_911486 ) ) ( not ( = ?auto_911484 ?auto_911487 ) ) ( not ( = ?auto_911484 ?auto_911488 ) ) ( not ( = ?auto_911484 ?auto_911489 ) ) ( not ( = ?auto_911484 ?auto_911490 ) ) ( not ( = ?auto_911484 ?auto_911491 ) ) ( not ( = ?auto_911484 ?auto_911492 ) ) ( not ( = ?auto_911484 ?auto_911493 ) ) ( not ( = ?auto_911484 ?auto_911494 ) ) ( not ( = ?auto_911484 ?auto_911495 ) ) ( not ( = ?auto_911485 ?auto_911486 ) ) ( not ( = ?auto_911485 ?auto_911487 ) ) ( not ( = ?auto_911485 ?auto_911488 ) ) ( not ( = ?auto_911485 ?auto_911489 ) ) ( not ( = ?auto_911485 ?auto_911490 ) ) ( not ( = ?auto_911485 ?auto_911491 ) ) ( not ( = ?auto_911485 ?auto_911492 ) ) ( not ( = ?auto_911485 ?auto_911493 ) ) ( not ( = ?auto_911485 ?auto_911494 ) ) ( not ( = ?auto_911485 ?auto_911495 ) ) ( not ( = ?auto_911486 ?auto_911487 ) ) ( not ( = ?auto_911486 ?auto_911488 ) ) ( not ( = ?auto_911486 ?auto_911489 ) ) ( not ( = ?auto_911486 ?auto_911490 ) ) ( not ( = ?auto_911486 ?auto_911491 ) ) ( not ( = ?auto_911486 ?auto_911492 ) ) ( not ( = ?auto_911486 ?auto_911493 ) ) ( not ( = ?auto_911486 ?auto_911494 ) ) ( not ( = ?auto_911486 ?auto_911495 ) ) ( not ( = ?auto_911487 ?auto_911488 ) ) ( not ( = ?auto_911487 ?auto_911489 ) ) ( not ( = ?auto_911487 ?auto_911490 ) ) ( not ( = ?auto_911487 ?auto_911491 ) ) ( not ( = ?auto_911487 ?auto_911492 ) ) ( not ( = ?auto_911487 ?auto_911493 ) ) ( not ( = ?auto_911487 ?auto_911494 ) ) ( not ( = ?auto_911487 ?auto_911495 ) ) ( not ( = ?auto_911488 ?auto_911489 ) ) ( not ( = ?auto_911488 ?auto_911490 ) ) ( not ( = ?auto_911488 ?auto_911491 ) ) ( not ( = ?auto_911488 ?auto_911492 ) ) ( not ( = ?auto_911488 ?auto_911493 ) ) ( not ( = ?auto_911488 ?auto_911494 ) ) ( not ( = ?auto_911488 ?auto_911495 ) ) ( not ( = ?auto_911489 ?auto_911490 ) ) ( not ( = ?auto_911489 ?auto_911491 ) ) ( not ( = ?auto_911489 ?auto_911492 ) ) ( not ( = ?auto_911489 ?auto_911493 ) ) ( not ( = ?auto_911489 ?auto_911494 ) ) ( not ( = ?auto_911489 ?auto_911495 ) ) ( not ( = ?auto_911490 ?auto_911491 ) ) ( not ( = ?auto_911490 ?auto_911492 ) ) ( not ( = ?auto_911490 ?auto_911493 ) ) ( not ( = ?auto_911490 ?auto_911494 ) ) ( not ( = ?auto_911490 ?auto_911495 ) ) ( not ( = ?auto_911491 ?auto_911492 ) ) ( not ( = ?auto_911491 ?auto_911493 ) ) ( not ( = ?auto_911491 ?auto_911494 ) ) ( not ( = ?auto_911491 ?auto_911495 ) ) ( not ( = ?auto_911492 ?auto_911493 ) ) ( not ( = ?auto_911492 ?auto_911494 ) ) ( not ( = ?auto_911492 ?auto_911495 ) ) ( not ( = ?auto_911493 ?auto_911494 ) ) ( not ( = ?auto_911493 ?auto_911495 ) ) ( not ( = ?auto_911494 ?auto_911495 ) ) ( ON ?auto_911493 ?auto_911494 ) ( ON ?auto_911492 ?auto_911493 ) ( ON ?auto_911491 ?auto_911492 ) ( ON ?auto_911490 ?auto_911491 ) ( ON ?auto_911489 ?auto_911490 ) ( CLEAR ?auto_911487 ) ( ON ?auto_911488 ?auto_911489 ) ( CLEAR ?auto_911488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_911480 ?auto_911481 ?auto_911482 ?auto_911483 ?auto_911484 ?auto_911485 ?auto_911486 ?auto_911487 ?auto_911488 )
      ( MAKE-15PILE ?auto_911480 ?auto_911481 ?auto_911482 ?auto_911483 ?auto_911484 ?auto_911485 ?auto_911486 ?auto_911487 ?auto_911488 ?auto_911489 ?auto_911490 ?auto_911491 ?auto_911492 ?auto_911493 ?auto_911494 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911542 - BLOCK
      ?auto_911543 - BLOCK
      ?auto_911544 - BLOCK
      ?auto_911545 - BLOCK
      ?auto_911546 - BLOCK
      ?auto_911547 - BLOCK
      ?auto_911548 - BLOCK
      ?auto_911549 - BLOCK
      ?auto_911550 - BLOCK
      ?auto_911551 - BLOCK
      ?auto_911552 - BLOCK
      ?auto_911553 - BLOCK
      ?auto_911554 - BLOCK
      ?auto_911555 - BLOCK
      ?auto_911556 - BLOCK
    )
    :vars
    (
      ?auto_911557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911556 ?auto_911557 ) ( ON-TABLE ?auto_911542 ) ( ON ?auto_911543 ?auto_911542 ) ( ON ?auto_911544 ?auto_911543 ) ( ON ?auto_911545 ?auto_911544 ) ( ON ?auto_911546 ?auto_911545 ) ( ON ?auto_911547 ?auto_911546 ) ( ON ?auto_911548 ?auto_911547 ) ( not ( = ?auto_911542 ?auto_911543 ) ) ( not ( = ?auto_911542 ?auto_911544 ) ) ( not ( = ?auto_911542 ?auto_911545 ) ) ( not ( = ?auto_911542 ?auto_911546 ) ) ( not ( = ?auto_911542 ?auto_911547 ) ) ( not ( = ?auto_911542 ?auto_911548 ) ) ( not ( = ?auto_911542 ?auto_911549 ) ) ( not ( = ?auto_911542 ?auto_911550 ) ) ( not ( = ?auto_911542 ?auto_911551 ) ) ( not ( = ?auto_911542 ?auto_911552 ) ) ( not ( = ?auto_911542 ?auto_911553 ) ) ( not ( = ?auto_911542 ?auto_911554 ) ) ( not ( = ?auto_911542 ?auto_911555 ) ) ( not ( = ?auto_911542 ?auto_911556 ) ) ( not ( = ?auto_911542 ?auto_911557 ) ) ( not ( = ?auto_911543 ?auto_911544 ) ) ( not ( = ?auto_911543 ?auto_911545 ) ) ( not ( = ?auto_911543 ?auto_911546 ) ) ( not ( = ?auto_911543 ?auto_911547 ) ) ( not ( = ?auto_911543 ?auto_911548 ) ) ( not ( = ?auto_911543 ?auto_911549 ) ) ( not ( = ?auto_911543 ?auto_911550 ) ) ( not ( = ?auto_911543 ?auto_911551 ) ) ( not ( = ?auto_911543 ?auto_911552 ) ) ( not ( = ?auto_911543 ?auto_911553 ) ) ( not ( = ?auto_911543 ?auto_911554 ) ) ( not ( = ?auto_911543 ?auto_911555 ) ) ( not ( = ?auto_911543 ?auto_911556 ) ) ( not ( = ?auto_911543 ?auto_911557 ) ) ( not ( = ?auto_911544 ?auto_911545 ) ) ( not ( = ?auto_911544 ?auto_911546 ) ) ( not ( = ?auto_911544 ?auto_911547 ) ) ( not ( = ?auto_911544 ?auto_911548 ) ) ( not ( = ?auto_911544 ?auto_911549 ) ) ( not ( = ?auto_911544 ?auto_911550 ) ) ( not ( = ?auto_911544 ?auto_911551 ) ) ( not ( = ?auto_911544 ?auto_911552 ) ) ( not ( = ?auto_911544 ?auto_911553 ) ) ( not ( = ?auto_911544 ?auto_911554 ) ) ( not ( = ?auto_911544 ?auto_911555 ) ) ( not ( = ?auto_911544 ?auto_911556 ) ) ( not ( = ?auto_911544 ?auto_911557 ) ) ( not ( = ?auto_911545 ?auto_911546 ) ) ( not ( = ?auto_911545 ?auto_911547 ) ) ( not ( = ?auto_911545 ?auto_911548 ) ) ( not ( = ?auto_911545 ?auto_911549 ) ) ( not ( = ?auto_911545 ?auto_911550 ) ) ( not ( = ?auto_911545 ?auto_911551 ) ) ( not ( = ?auto_911545 ?auto_911552 ) ) ( not ( = ?auto_911545 ?auto_911553 ) ) ( not ( = ?auto_911545 ?auto_911554 ) ) ( not ( = ?auto_911545 ?auto_911555 ) ) ( not ( = ?auto_911545 ?auto_911556 ) ) ( not ( = ?auto_911545 ?auto_911557 ) ) ( not ( = ?auto_911546 ?auto_911547 ) ) ( not ( = ?auto_911546 ?auto_911548 ) ) ( not ( = ?auto_911546 ?auto_911549 ) ) ( not ( = ?auto_911546 ?auto_911550 ) ) ( not ( = ?auto_911546 ?auto_911551 ) ) ( not ( = ?auto_911546 ?auto_911552 ) ) ( not ( = ?auto_911546 ?auto_911553 ) ) ( not ( = ?auto_911546 ?auto_911554 ) ) ( not ( = ?auto_911546 ?auto_911555 ) ) ( not ( = ?auto_911546 ?auto_911556 ) ) ( not ( = ?auto_911546 ?auto_911557 ) ) ( not ( = ?auto_911547 ?auto_911548 ) ) ( not ( = ?auto_911547 ?auto_911549 ) ) ( not ( = ?auto_911547 ?auto_911550 ) ) ( not ( = ?auto_911547 ?auto_911551 ) ) ( not ( = ?auto_911547 ?auto_911552 ) ) ( not ( = ?auto_911547 ?auto_911553 ) ) ( not ( = ?auto_911547 ?auto_911554 ) ) ( not ( = ?auto_911547 ?auto_911555 ) ) ( not ( = ?auto_911547 ?auto_911556 ) ) ( not ( = ?auto_911547 ?auto_911557 ) ) ( not ( = ?auto_911548 ?auto_911549 ) ) ( not ( = ?auto_911548 ?auto_911550 ) ) ( not ( = ?auto_911548 ?auto_911551 ) ) ( not ( = ?auto_911548 ?auto_911552 ) ) ( not ( = ?auto_911548 ?auto_911553 ) ) ( not ( = ?auto_911548 ?auto_911554 ) ) ( not ( = ?auto_911548 ?auto_911555 ) ) ( not ( = ?auto_911548 ?auto_911556 ) ) ( not ( = ?auto_911548 ?auto_911557 ) ) ( not ( = ?auto_911549 ?auto_911550 ) ) ( not ( = ?auto_911549 ?auto_911551 ) ) ( not ( = ?auto_911549 ?auto_911552 ) ) ( not ( = ?auto_911549 ?auto_911553 ) ) ( not ( = ?auto_911549 ?auto_911554 ) ) ( not ( = ?auto_911549 ?auto_911555 ) ) ( not ( = ?auto_911549 ?auto_911556 ) ) ( not ( = ?auto_911549 ?auto_911557 ) ) ( not ( = ?auto_911550 ?auto_911551 ) ) ( not ( = ?auto_911550 ?auto_911552 ) ) ( not ( = ?auto_911550 ?auto_911553 ) ) ( not ( = ?auto_911550 ?auto_911554 ) ) ( not ( = ?auto_911550 ?auto_911555 ) ) ( not ( = ?auto_911550 ?auto_911556 ) ) ( not ( = ?auto_911550 ?auto_911557 ) ) ( not ( = ?auto_911551 ?auto_911552 ) ) ( not ( = ?auto_911551 ?auto_911553 ) ) ( not ( = ?auto_911551 ?auto_911554 ) ) ( not ( = ?auto_911551 ?auto_911555 ) ) ( not ( = ?auto_911551 ?auto_911556 ) ) ( not ( = ?auto_911551 ?auto_911557 ) ) ( not ( = ?auto_911552 ?auto_911553 ) ) ( not ( = ?auto_911552 ?auto_911554 ) ) ( not ( = ?auto_911552 ?auto_911555 ) ) ( not ( = ?auto_911552 ?auto_911556 ) ) ( not ( = ?auto_911552 ?auto_911557 ) ) ( not ( = ?auto_911553 ?auto_911554 ) ) ( not ( = ?auto_911553 ?auto_911555 ) ) ( not ( = ?auto_911553 ?auto_911556 ) ) ( not ( = ?auto_911553 ?auto_911557 ) ) ( not ( = ?auto_911554 ?auto_911555 ) ) ( not ( = ?auto_911554 ?auto_911556 ) ) ( not ( = ?auto_911554 ?auto_911557 ) ) ( not ( = ?auto_911555 ?auto_911556 ) ) ( not ( = ?auto_911555 ?auto_911557 ) ) ( not ( = ?auto_911556 ?auto_911557 ) ) ( ON ?auto_911555 ?auto_911556 ) ( ON ?auto_911554 ?auto_911555 ) ( ON ?auto_911553 ?auto_911554 ) ( ON ?auto_911552 ?auto_911553 ) ( ON ?auto_911551 ?auto_911552 ) ( ON ?auto_911550 ?auto_911551 ) ( CLEAR ?auto_911548 ) ( ON ?auto_911549 ?auto_911550 ) ( CLEAR ?auto_911549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_911542 ?auto_911543 ?auto_911544 ?auto_911545 ?auto_911546 ?auto_911547 ?auto_911548 ?auto_911549 )
      ( MAKE-15PILE ?auto_911542 ?auto_911543 ?auto_911544 ?auto_911545 ?auto_911546 ?auto_911547 ?auto_911548 ?auto_911549 ?auto_911550 ?auto_911551 ?auto_911552 ?auto_911553 ?auto_911554 ?auto_911555 ?auto_911556 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911604 - BLOCK
      ?auto_911605 - BLOCK
      ?auto_911606 - BLOCK
      ?auto_911607 - BLOCK
      ?auto_911608 - BLOCK
      ?auto_911609 - BLOCK
      ?auto_911610 - BLOCK
      ?auto_911611 - BLOCK
      ?auto_911612 - BLOCK
      ?auto_911613 - BLOCK
      ?auto_911614 - BLOCK
      ?auto_911615 - BLOCK
      ?auto_911616 - BLOCK
      ?auto_911617 - BLOCK
      ?auto_911618 - BLOCK
    )
    :vars
    (
      ?auto_911619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911618 ?auto_911619 ) ( ON-TABLE ?auto_911604 ) ( ON ?auto_911605 ?auto_911604 ) ( ON ?auto_911606 ?auto_911605 ) ( ON ?auto_911607 ?auto_911606 ) ( ON ?auto_911608 ?auto_911607 ) ( ON ?auto_911609 ?auto_911608 ) ( not ( = ?auto_911604 ?auto_911605 ) ) ( not ( = ?auto_911604 ?auto_911606 ) ) ( not ( = ?auto_911604 ?auto_911607 ) ) ( not ( = ?auto_911604 ?auto_911608 ) ) ( not ( = ?auto_911604 ?auto_911609 ) ) ( not ( = ?auto_911604 ?auto_911610 ) ) ( not ( = ?auto_911604 ?auto_911611 ) ) ( not ( = ?auto_911604 ?auto_911612 ) ) ( not ( = ?auto_911604 ?auto_911613 ) ) ( not ( = ?auto_911604 ?auto_911614 ) ) ( not ( = ?auto_911604 ?auto_911615 ) ) ( not ( = ?auto_911604 ?auto_911616 ) ) ( not ( = ?auto_911604 ?auto_911617 ) ) ( not ( = ?auto_911604 ?auto_911618 ) ) ( not ( = ?auto_911604 ?auto_911619 ) ) ( not ( = ?auto_911605 ?auto_911606 ) ) ( not ( = ?auto_911605 ?auto_911607 ) ) ( not ( = ?auto_911605 ?auto_911608 ) ) ( not ( = ?auto_911605 ?auto_911609 ) ) ( not ( = ?auto_911605 ?auto_911610 ) ) ( not ( = ?auto_911605 ?auto_911611 ) ) ( not ( = ?auto_911605 ?auto_911612 ) ) ( not ( = ?auto_911605 ?auto_911613 ) ) ( not ( = ?auto_911605 ?auto_911614 ) ) ( not ( = ?auto_911605 ?auto_911615 ) ) ( not ( = ?auto_911605 ?auto_911616 ) ) ( not ( = ?auto_911605 ?auto_911617 ) ) ( not ( = ?auto_911605 ?auto_911618 ) ) ( not ( = ?auto_911605 ?auto_911619 ) ) ( not ( = ?auto_911606 ?auto_911607 ) ) ( not ( = ?auto_911606 ?auto_911608 ) ) ( not ( = ?auto_911606 ?auto_911609 ) ) ( not ( = ?auto_911606 ?auto_911610 ) ) ( not ( = ?auto_911606 ?auto_911611 ) ) ( not ( = ?auto_911606 ?auto_911612 ) ) ( not ( = ?auto_911606 ?auto_911613 ) ) ( not ( = ?auto_911606 ?auto_911614 ) ) ( not ( = ?auto_911606 ?auto_911615 ) ) ( not ( = ?auto_911606 ?auto_911616 ) ) ( not ( = ?auto_911606 ?auto_911617 ) ) ( not ( = ?auto_911606 ?auto_911618 ) ) ( not ( = ?auto_911606 ?auto_911619 ) ) ( not ( = ?auto_911607 ?auto_911608 ) ) ( not ( = ?auto_911607 ?auto_911609 ) ) ( not ( = ?auto_911607 ?auto_911610 ) ) ( not ( = ?auto_911607 ?auto_911611 ) ) ( not ( = ?auto_911607 ?auto_911612 ) ) ( not ( = ?auto_911607 ?auto_911613 ) ) ( not ( = ?auto_911607 ?auto_911614 ) ) ( not ( = ?auto_911607 ?auto_911615 ) ) ( not ( = ?auto_911607 ?auto_911616 ) ) ( not ( = ?auto_911607 ?auto_911617 ) ) ( not ( = ?auto_911607 ?auto_911618 ) ) ( not ( = ?auto_911607 ?auto_911619 ) ) ( not ( = ?auto_911608 ?auto_911609 ) ) ( not ( = ?auto_911608 ?auto_911610 ) ) ( not ( = ?auto_911608 ?auto_911611 ) ) ( not ( = ?auto_911608 ?auto_911612 ) ) ( not ( = ?auto_911608 ?auto_911613 ) ) ( not ( = ?auto_911608 ?auto_911614 ) ) ( not ( = ?auto_911608 ?auto_911615 ) ) ( not ( = ?auto_911608 ?auto_911616 ) ) ( not ( = ?auto_911608 ?auto_911617 ) ) ( not ( = ?auto_911608 ?auto_911618 ) ) ( not ( = ?auto_911608 ?auto_911619 ) ) ( not ( = ?auto_911609 ?auto_911610 ) ) ( not ( = ?auto_911609 ?auto_911611 ) ) ( not ( = ?auto_911609 ?auto_911612 ) ) ( not ( = ?auto_911609 ?auto_911613 ) ) ( not ( = ?auto_911609 ?auto_911614 ) ) ( not ( = ?auto_911609 ?auto_911615 ) ) ( not ( = ?auto_911609 ?auto_911616 ) ) ( not ( = ?auto_911609 ?auto_911617 ) ) ( not ( = ?auto_911609 ?auto_911618 ) ) ( not ( = ?auto_911609 ?auto_911619 ) ) ( not ( = ?auto_911610 ?auto_911611 ) ) ( not ( = ?auto_911610 ?auto_911612 ) ) ( not ( = ?auto_911610 ?auto_911613 ) ) ( not ( = ?auto_911610 ?auto_911614 ) ) ( not ( = ?auto_911610 ?auto_911615 ) ) ( not ( = ?auto_911610 ?auto_911616 ) ) ( not ( = ?auto_911610 ?auto_911617 ) ) ( not ( = ?auto_911610 ?auto_911618 ) ) ( not ( = ?auto_911610 ?auto_911619 ) ) ( not ( = ?auto_911611 ?auto_911612 ) ) ( not ( = ?auto_911611 ?auto_911613 ) ) ( not ( = ?auto_911611 ?auto_911614 ) ) ( not ( = ?auto_911611 ?auto_911615 ) ) ( not ( = ?auto_911611 ?auto_911616 ) ) ( not ( = ?auto_911611 ?auto_911617 ) ) ( not ( = ?auto_911611 ?auto_911618 ) ) ( not ( = ?auto_911611 ?auto_911619 ) ) ( not ( = ?auto_911612 ?auto_911613 ) ) ( not ( = ?auto_911612 ?auto_911614 ) ) ( not ( = ?auto_911612 ?auto_911615 ) ) ( not ( = ?auto_911612 ?auto_911616 ) ) ( not ( = ?auto_911612 ?auto_911617 ) ) ( not ( = ?auto_911612 ?auto_911618 ) ) ( not ( = ?auto_911612 ?auto_911619 ) ) ( not ( = ?auto_911613 ?auto_911614 ) ) ( not ( = ?auto_911613 ?auto_911615 ) ) ( not ( = ?auto_911613 ?auto_911616 ) ) ( not ( = ?auto_911613 ?auto_911617 ) ) ( not ( = ?auto_911613 ?auto_911618 ) ) ( not ( = ?auto_911613 ?auto_911619 ) ) ( not ( = ?auto_911614 ?auto_911615 ) ) ( not ( = ?auto_911614 ?auto_911616 ) ) ( not ( = ?auto_911614 ?auto_911617 ) ) ( not ( = ?auto_911614 ?auto_911618 ) ) ( not ( = ?auto_911614 ?auto_911619 ) ) ( not ( = ?auto_911615 ?auto_911616 ) ) ( not ( = ?auto_911615 ?auto_911617 ) ) ( not ( = ?auto_911615 ?auto_911618 ) ) ( not ( = ?auto_911615 ?auto_911619 ) ) ( not ( = ?auto_911616 ?auto_911617 ) ) ( not ( = ?auto_911616 ?auto_911618 ) ) ( not ( = ?auto_911616 ?auto_911619 ) ) ( not ( = ?auto_911617 ?auto_911618 ) ) ( not ( = ?auto_911617 ?auto_911619 ) ) ( not ( = ?auto_911618 ?auto_911619 ) ) ( ON ?auto_911617 ?auto_911618 ) ( ON ?auto_911616 ?auto_911617 ) ( ON ?auto_911615 ?auto_911616 ) ( ON ?auto_911614 ?auto_911615 ) ( ON ?auto_911613 ?auto_911614 ) ( ON ?auto_911612 ?auto_911613 ) ( ON ?auto_911611 ?auto_911612 ) ( CLEAR ?auto_911609 ) ( ON ?auto_911610 ?auto_911611 ) ( CLEAR ?auto_911610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_911604 ?auto_911605 ?auto_911606 ?auto_911607 ?auto_911608 ?auto_911609 ?auto_911610 )
      ( MAKE-15PILE ?auto_911604 ?auto_911605 ?auto_911606 ?auto_911607 ?auto_911608 ?auto_911609 ?auto_911610 ?auto_911611 ?auto_911612 ?auto_911613 ?auto_911614 ?auto_911615 ?auto_911616 ?auto_911617 ?auto_911618 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911666 - BLOCK
      ?auto_911667 - BLOCK
      ?auto_911668 - BLOCK
      ?auto_911669 - BLOCK
      ?auto_911670 - BLOCK
      ?auto_911671 - BLOCK
      ?auto_911672 - BLOCK
      ?auto_911673 - BLOCK
      ?auto_911674 - BLOCK
      ?auto_911675 - BLOCK
      ?auto_911676 - BLOCK
      ?auto_911677 - BLOCK
      ?auto_911678 - BLOCK
      ?auto_911679 - BLOCK
      ?auto_911680 - BLOCK
    )
    :vars
    (
      ?auto_911681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911680 ?auto_911681 ) ( ON-TABLE ?auto_911666 ) ( ON ?auto_911667 ?auto_911666 ) ( ON ?auto_911668 ?auto_911667 ) ( ON ?auto_911669 ?auto_911668 ) ( ON ?auto_911670 ?auto_911669 ) ( not ( = ?auto_911666 ?auto_911667 ) ) ( not ( = ?auto_911666 ?auto_911668 ) ) ( not ( = ?auto_911666 ?auto_911669 ) ) ( not ( = ?auto_911666 ?auto_911670 ) ) ( not ( = ?auto_911666 ?auto_911671 ) ) ( not ( = ?auto_911666 ?auto_911672 ) ) ( not ( = ?auto_911666 ?auto_911673 ) ) ( not ( = ?auto_911666 ?auto_911674 ) ) ( not ( = ?auto_911666 ?auto_911675 ) ) ( not ( = ?auto_911666 ?auto_911676 ) ) ( not ( = ?auto_911666 ?auto_911677 ) ) ( not ( = ?auto_911666 ?auto_911678 ) ) ( not ( = ?auto_911666 ?auto_911679 ) ) ( not ( = ?auto_911666 ?auto_911680 ) ) ( not ( = ?auto_911666 ?auto_911681 ) ) ( not ( = ?auto_911667 ?auto_911668 ) ) ( not ( = ?auto_911667 ?auto_911669 ) ) ( not ( = ?auto_911667 ?auto_911670 ) ) ( not ( = ?auto_911667 ?auto_911671 ) ) ( not ( = ?auto_911667 ?auto_911672 ) ) ( not ( = ?auto_911667 ?auto_911673 ) ) ( not ( = ?auto_911667 ?auto_911674 ) ) ( not ( = ?auto_911667 ?auto_911675 ) ) ( not ( = ?auto_911667 ?auto_911676 ) ) ( not ( = ?auto_911667 ?auto_911677 ) ) ( not ( = ?auto_911667 ?auto_911678 ) ) ( not ( = ?auto_911667 ?auto_911679 ) ) ( not ( = ?auto_911667 ?auto_911680 ) ) ( not ( = ?auto_911667 ?auto_911681 ) ) ( not ( = ?auto_911668 ?auto_911669 ) ) ( not ( = ?auto_911668 ?auto_911670 ) ) ( not ( = ?auto_911668 ?auto_911671 ) ) ( not ( = ?auto_911668 ?auto_911672 ) ) ( not ( = ?auto_911668 ?auto_911673 ) ) ( not ( = ?auto_911668 ?auto_911674 ) ) ( not ( = ?auto_911668 ?auto_911675 ) ) ( not ( = ?auto_911668 ?auto_911676 ) ) ( not ( = ?auto_911668 ?auto_911677 ) ) ( not ( = ?auto_911668 ?auto_911678 ) ) ( not ( = ?auto_911668 ?auto_911679 ) ) ( not ( = ?auto_911668 ?auto_911680 ) ) ( not ( = ?auto_911668 ?auto_911681 ) ) ( not ( = ?auto_911669 ?auto_911670 ) ) ( not ( = ?auto_911669 ?auto_911671 ) ) ( not ( = ?auto_911669 ?auto_911672 ) ) ( not ( = ?auto_911669 ?auto_911673 ) ) ( not ( = ?auto_911669 ?auto_911674 ) ) ( not ( = ?auto_911669 ?auto_911675 ) ) ( not ( = ?auto_911669 ?auto_911676 ) ) ( not ( = ?auto_911669 ?auto_911677 ) ) ( not ( = ?auto_911669 ?auto_911678 ) ) ( not ( = ?auto_911669 ?auto_911679 ) ) ( not ( = ?auto_911669 ?auto_911680 ) ) ( not ( = ?auto_911669 ?auto_911681 ) ) ( not ( = ?auto_911670 ?auto_911671 ) ) ( not ( = ?auto_911670 ?auto_911672 ) ) ( not ( = ?auto_911670 ?auto_911673 ) ) ( not ( = ?auto_911670 ?auto_911674 ) ) ( not ( = ?auto_911670 ?auto_911675 ) ) ( not ( = ?auto_911670 ?auto_911676 ) ) ( not ( = ?auto_911670 ?auto_911677 ) ) ( not ( = ?auto_911670 ?auto_911678 ) ) ( not ( = ?auto_911670 ?auto_911679 ) ) ( not ( = ?auto_911670 ?auto_911680 ) ) ( not ( = ?auto_911670 ?auto_911681 ) ) ( not ( = ?auto_911671 ?auto_911672 ) ) ( not ( = ?auto_911671 ?auto_911673 ) ) ( not ( = ?auto_911671 ?auto_911674 ) ) ( not ( = ?auto_911671 ?auto_911675 ) ) ( not ( = ?auto_911671 ?auto_911676 ) ) ( not ( = ?auto_911671 ?auto_911677 ) ) ( not ( = ?auto_911671 ?auto_911678 ) ) ( not ( = ?auto_911671 ?auto_911679 ) ) ( not ( = ?auto_911671 ?auto_911680 ) ) ( not ( = ?auto_911671 ?auto_911681 ) ) ( not ( = ?auto_911672 ?auto_911673 ) ) ( not ( = ?auto_911672 ?auto_911674 ) ) ( not ( = ?auto_911672 ?auto_911675 ) ) ( not ( = ?auto_911672 ?auto_911676 ) ) ( not ( = ?auto_911672 ?auto_911677 ) ) ( not ( = ?auto_911672 ?auto_911678 ) ) ( not ( = ?auto_911672 ?auto_911679 ) ) ( not ( = ?auto_911672 ?auto_911680 ) ) ( not ( = ?auto_911672 ?auto_911681 ) ) ( not ( = ?auto_911673 ?auto_911674 ) ) ( not ( = ?auto_911673 ?auto_911675 ) ) ( not ( = ?auto_911673 ?auto_911676 ) ) ( not ( = ?auto_911673 ?auto_911677 ) ) ( not ( = ?auto_911673 ?auto_911678 ) ) ( not ( = ?auto_911673 ?auto_911679 ) ) ( not ( = ?auto_911673 ?auto_911680 ) ) ( not ( = ?auto_911673 ?auto_911681 ) ) ( not ( = ?auto_911674 ?auto_911675 ) ) ( not ( = ?auto_911674 ?auto_911676 ) ) ( not ( = ?auto_911674 ?auto_911677 ) ) ( not ( = ?auto_911674 ?auto_911678 ) ) ( not ( = ?auto_911674 ?auto_911679 ) ) ( not ( = ?auto_911674 ?auto_911680 ) ) ( not ( = ?auto_911674 ?auto_911681 ) ) ( not ( = ?auto_911675 ?auto_911676 ) ) ( not ( = ?auto_911675 ?auto_911677 ) ) ( not ( = ?auto_911675 ?auto_911678 ) ) ( not ( = ?auto_911675 ?auto_911679 ) ) ( not ( = ?auto_911675 ?auto_911680 ) ) ( not ( = ?auto_911675 ?auto_911681 ) ) ( not ( = ?auto_911676 ?auto_911677 ) ) ( not ( = ?auto_911676 ?auto_911678 ) ) ( not ( = ?auto_911676 ?auto_911679 ) ) ( not ( = ?auto_911676 ?auto_911680 ) ) ( not ( = ?auto_911676 ?auto_911681 ) ) ( not ( = ?auto_911677 ?auto_911678 ) ) ( not ( = ?auto_911677 ?auto_911679 ) ) ( not ( = ?auto_911677 ?auto_911680 ) ) ( not ( = ?auto_911677 ?auto_911681 ) ) ( not ( = ?auto_911678 ?auto_911679 ) ) ( not ( = ?auto_911678 ?auto_911680 ) ) ( not ( = ?auto_911678 ?auto_911681 ) ) ( not ( = ?auto_911679 ?auto_911680 ) ) ( not ( = ?auto_911679 ?auto_911681 ) ) ( not ( = ?auto_911680 ?auto_911681 ) ) ( ON ?auto_911679 ?auto_911680 ) ( ON ?auto_911678 ?auto_911679 ) ( ON ?auto_911677 ?auto_911678 ) ( ON ?auto_911676 ?auto_911677 ) ( ON ?auto_911675 ?auto_911676 ) ( ON ?auto_911674 ?auto_911675 ) ( ON ?auto_911673 ?auto_911674 ) ( ON ?auto_911672 ?auto_911673 ) ( CLEAR ?auto_911670 ) ( ON ?auto_911671 ?auto_911672 ) ( CLEAR ?auto_911671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_911666 ?auto_911667 ?auto_911668 ?auto_911669 ?auto_911670 ?auto_911671 )
      ( MAKE-15PILE ?auto_911666 ?auto_911667 ?auto_911668 ?auto_911669 ?auto_911670 ?auto_911671 ?auto_911672 ?auto_911673 ?auto_911674 ?auto_911675 ?auto_911676 ?auto_911677 ?auto_911678 ?auto_911679 ?auto_911680 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911728 - BLOCK
      ?auto_911729 - BLOCK
      ?auto_911730 - BLOCK
      ?auto_911731 - BLOCK
      ?auto_911732 - BLOCK
      ?auto_911733 - BLOCK
      ?auto_911734 - BLOCK
      ?auto_911735 - BLOCK
      ?auto_911736 - BLOCK
      ?auto_911737 - BLOCK
      ?auto_911738 - BLOCK
      ?auto_911739 - BLOCK
      ?auto_911740 - BLOCK
      ?auto_911741 - BLOCK
      ?auto_911742 - BLOCK
    )
    :vars
    (
      ?auto_911743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911742 ?auto_911743 ) ( ON-TABLE ?auto_911728 ) ( ON ?auto_911729 ?auto_911728 ) ( ON ?auto_911730 ?auto_911729 ) ( ON ?auto_911731 ?auto_911730 ) ( not ( = ?auto_911728 ?auto_911729 ) ) ( not ( = ?auto_911728 ?auto_911730 ) ) ( not ( = ?auto_911728 ?auto_911731 ) ) ( not ( = ?auto_911728 ?auto_911732 ) ) ( not ( = ?auto_911728 ?auto_911733 ) ) ( not ( = ?auto_911728 ?auto_911734 ) ) ( not ( = ?auto_911728 ?auto_911735 ) ) ( not ( = ?auto_911728 ?auto_911736 ) ) ( not ( = ?auto_911728 ?auto_911737 ) ) ( not ( = ?auto_911728 ?auto_911738 ) ) ( not ( = ?auto_911728 ?auto_911739 ) ) ( not ( = ?auto_911728 ?auto_911740 ) ) ( not ( = ?auto_911728 ?auto_911741 ) ) ( not ( = ?auto_911728 ?auto_911742 ) ) ( not ( = ?auto_911728 ?auto_911743 ) ) ( not ( = ?auto_911729 ?auto_911730 ) ) ( not ( = ?auto_911729 ?auto_911731 ) ) ( not ( = ?auto_911729 ?auto_911732 ) ) ( not ( = ?auto_911729 ?auto_911733 ) ) ( not ( = ?auto_911729 ?auto_911734 ) ) ( not ( = ?auto_911729 ?auto_911735 ) ) ( not ( = ?auto_911729 ?auto_911736 ) ) ( not ( = ?auto_911729 ?auto_911737 ) ) ( not ( = ?auto_911729 ?auto_911738 ) ) ( not ( = ?auto_911729 ?auto_911739 ) ) ( not ( = ?auto_911729 ?auto_911740 ) ) ( not ( = ?auto_911729 ?auto_911741 ) ) ( not ( = ?auto_911729 ?auto_911742 ) ) ( not ( = ?auto_911729 ?auto_911743 ) ) ( not ( = ?auto_911730 ?auto_911731 ) ) ( not ( = ?auto_911730 ?auto_911732 ) ) ( not ( = ?auto_911730 ?auto_911733 ) ) ( not ( = ?auto_911730 ?auto_911734 ) ) ( not ( = ?auto_911730 ?auto_911735 ) ) ( not ( = ?auto_911730 ?auto_911736 ) ) ( not ( = ?auto_911730 ?auto_911737 ) ) ( not ( = ?auto_911730 ?auto_911738 ) ) ( not ( = ?auto_911730 ?auto_911739 ) ) ( not ( = ?auto_911730 ?auto_911740 ) ) ( not ( = ?auto_911730 ?auto_911741 ) ) ( not ( = ?auto_911730 ?auto_911742 ) ) ( not ( = ?auto_911730 ?auto_911743 ) ) ( not ( = ?auto_911731 ?auto_911732 ) ) ( not ( = ?auto_911731 ?auto_911733 ) ) ( not ( = ?auto_911731 ?auto_911734 ) ) ( not ( = ?auto_911731 ?auto_911735 ) ) ( not ( = ?auto_911731 ?auto_911736 ) ) ( not ( = ?auto_911731 ?auto_911737 ) ) ( not ( = ?auto_911731 ?auto_911738 ) ) ( not ( = ?auto_911731 ?auto_911739 ) ) ( not ( = ?auto_911731 ?auto_911740 ) ) ( not ( = ?auto_911731 ?auto_911741 ) ) ( not ( = ?auto_911731 ?auto_911742 ) ) ( not ( = ?auto_911731 ?auto_911743 ) ) ( not ( = ?auto_911732 ?auto_911733 ) ) ( not ( = ?auto_911732 ?auto_911734 ) ) ( not ( = ?auto_911732 ?auto_911735 ) ) ( not ( = ?auto_911732 ?auto_911736 ) ) ( not ( = ?auto_911732 ?auto_911737 ) ) ( not ( = ?auto_911732 ?auto_911738 ) ) ( not ( = ?auto_911732 ?auto_911739 ) ) ( not ( = ?auto_911732 ?auto_911740 ) ) ( not ( = ?auto_911732 ?auto_911741 ) ) ( not ( = ?auto_911732 ?auto_911742 ) ) ( not ( = ?auto_911732 ?auto_911743 ) ) ( not ( = ?auto_911733 ?auto_911734 ) ) ( not ( = ?auto_911733 ?auto_911735 ) ) ( not ( = ?auto_911733 ?auto_911736 ) ) ( not ( = ?auto_911733 ?auto_911737 ) ) ( not ( = ?auto_911733 ?auto_911738 ) ) ( not ( = ?auto_911733 ?auto_911739 ) ) ( not ( = ?auto_911733 ?auto_911740 ) ) ( not ( = ?auto_911733 ?auto_911741 ) ) ( not ( = ?auto_911733 ?auto_911742 ) ) ( not ( = ?auto_911733 ?auto_911743 ) ) ( not ( = ?auto_911734 ?auto_911735 ) ) ( not ( = ?auto_911734 ?auto_911736 ) ) ( not ( = ?auto_911734 ?auto_911737 ) ) ( not ( = ?auto_911734 ?auto_911738 ) ) ( not ( = ?auto_911734 ?auto_911739 ) ) ( not ( = ?auto_911734 ?auto_911740 ) ) ( not ( = ?auto_911734 ?auto_911741 ) ) ( not ( = ?auto_911734 ?auto_911742 ) ) ( not ( = ?auto_911734 ?auto_911743 ) ) ( not ( = ?auto_911735 ?auto_911736 ) ) ( not ( = ?auto_911735 ?auto_911737 ) ) ( not ( = ?auto_911735 ?auto_911738 ) ) ( not ( = ?auto_911735 ?auto_911739 ) ) ( not ( = ?auto_911735 ?auto_911740 ) ) ( not ( = ?auto_911735 ?auto_911741 ) ) ( not ( = ?auto_911735 ?auto_911742 ) ) ( not ( = ?auto_911735 ?auto_911743 ) ) ( not ( = ?auto_911736 ?auto_911737 ) ) ( not ( = ?auto_911736 ?auto_911738 ) ) ( not ( = ?auto_911736 ?auto_911739 ) ) ( not ( = ?auto_911736 ?auto_911740 ) ) ( not ( = ?auto_911736 ?auto_911741 ) ) ( not ( = ?auto_911736 ?auto_911742 ) ) ( not ( = ?auto_911736 ?auto_911743 ) ) ( not ( = ?auto_911737 ?auto_911738 ) ) ( not ( = ?auto_911737 ?auto_911739 ) ) ( not ( = ?auto_911737 ?auto_911740 ) ) ( not ( = ?auto_911737 ?auto_911741 ) ) ( not ( = ?auto_911737 ?auto_911742 ) ) ( not ( = ?auto_911737 ?auto_911743 ) ) ( not ( = ?auto_911738 ?auto_911739 ) ) ( not ( = ?auto_911738 ?auto_911740 ) ) ( not ( = ?auto_911738 ?auto_911741 ) ) ( not ( = ?auto_911738 ?auto_911742 ) ) ( not ( = ?auto_911738 ?auto_911743 ) ) ( not ( = ?auto_911739 ?auto_911740 ) ) ( not ( = ?auto_911739 ?auto_911741 ) ) ( not ( = ?auto_911739 ?auto_911742 ) ) ( not ( = ?auto_911739 ?auto_911743 ) ) ( not ( = ?auto_911740 ?auto_911741 ) ) ( not ( = ?auto_911740 ?auto_911742 ) ) ( not ( = ?auto_911740 ?auto_911743 ) ) ( not ( = ?auto_911741 ?auto_911742 ) ) ( not ( = ?auto_911741 ?auto_911743 ) ) ( not ( = ?auto_911742 ?auto_911743 ) ) ( ON ?auto_911741 ?auto_911742 ) ( ON ?auto_911740 ?auto_911741 ) ( ON ?auto_911739 ?auto_911740 ) ( ON ?auto_911738 ?auto_911739 ) ( ON ?auto_911737 ?auto_911738 ) ( ON ?auto_911736 ?auto_911737 ) ( ON ?auto_911735 ?auto_911736 ) ( ON ?auto_911734 ?auto_911735 ) ( ON ?auto_911733 ?auto_911734 ) ( CLEAR ?auto_911731 ) ( ON ?auto_911732 ?auto_911733 ) ( CLEAR ?auto_911732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_911728 ?auto_911729 ?auto_911730 ?auto_911731 ?auto_911732 )
      ( MAKE-15PILE ?auto_911728 ?auto_911729 ?auto_911730 ?auto_911731 ?auto_911732 ?auto_911733 ?auto_911734 ?auto_911735 ?auto_911736 ?auto_911737 ?auto_911738 ?auto_911739 ?auto_911740 ?auto_911741 ?auto_911742 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911790 - BLOCK
      ?auto_911791 - BLOCK
      ?auto_911792 - BLOCK
      ?auto_911793 - BLOCK
      ?auto_911794 - BLOCK
      ?auto_911795 - BLOCK
      ?auto_911796 - BLOCK
      ?auto_911797 - BLOCK
      ?auto_911798 - BLOCK
      ?auto_911799 - BLOCK
      ?auto_911800 - BLOCK
      ?auto_911801 - BLOCK
      ?auto_911802 - BLOCK
      ?auto_911803 - BLOCK
      ?auto_911804 - BLOCK
    )
    :vars
    (
      ?auto_911805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911804 ?auto_911805 ) ( ON-TABLE ?auto_911790 ) ( ON ?auto_911791 ?auto_911790 ) ( ON ?auto_911792 ?auto_911791 ) ( not ( = ?auto_911790 ?auto_911791 ) ) ( not ( = ?auto_911790 ?auto_911792 ) ) ( not ( = ?auto_911790 ?auto_911793 ) ) ( not ( = ?auto_911790 ?auto_911794 ) ) ( not ( = ?auto_911790 ?auto_911795 ) ) ( not ( = ?auto_911790 ?auto_911796 ) ) ( not ( = ?auto_911790 ?auto_911797 ) ) ( not ( = ?auto_911790 ?auto_911798 ) ) ( not ( = ?auto_911790 ?auto_911799 ) ) ( not ( = ?auto_911790 ?auto_911800 ) ) ( not ( = ?auto_911790 ?auto_911801 ) ) ( not ( = ?auto_911790 ?auto_911802 ) ) ( not ( = ?auto_911790 ?auto_911803 ) ) ( not ( = ?auto_911790 ?auto_911804 ) ) ( not ( = ?auto_911790 ?auto_911805 ) ) ( not ( = ?auto_911791 ?auto_911792 ) ) ( not ( = ?auto_911791 ?auto_911793 ) ) ( not ( = ?auto_911791 ?auto_911794 ) ) ( not ( = ?auto_911791 ?auto_911795 ) ) ( not ( = ?auto_911791 ?auto_911796 ) ) ( not ( = ?auto_911791 ?auto_911797 ) ) ( not ( = ?auto_911791 ?auto_911798 ) ) ( not ( = ?auto_911791 ?auto_911799 ) ) ( not ( = ?auto_911791 ?auto_911800 ) ) ( not ( = ?auto_911791 ?auto_911801 ) ) ( not ( = ?auto_911791 ?auto_911802 ) ) ( not ( = ?auto_911791 ?auto_911803 ) ) ( not ( = ?auto_911791 ?auto_911804 ) ) ( not ( = ?auto_911791 ?auto_911805 ) ) ( not ( = ?auto_911792 ?auto_911793 ) ) ( not ( = ?auto_911792 ?auto_911794 ) ) ( not ( = ?auto_911792 ?auto_911795 ) ) ( not ( = ?auto_911792 ?auto_911796 ) ) ( not ( = ?auto_911792 ?auto_911797 ) ) ( not ( = ?auto_911792 ?auto_911798 ) ) ( not ( = ?auto_911792 ?auto_911799 ) ) ( not ( = ?auto_911792 ?auto_911800 ) ) ( not ( = ?auto_911792 ?auto_911801 ) ) ( not ( = ?auto_911792 ?auto_911802 ) ) ( not ( = ?auto_911792 ?auto_911803 ) ) ( not ( = ?auto_911792 ?auto_911804 ) ) ( not ( = ?auto_911792 ?auto_911805 ) ) ( not ( = ?auto_911793 ?auto_911794 ) ) ( not ( = ?auto_911793 ?auto_911795 ) ) ( not ( = ?auto_911793 ?auto_911796 ) ) ( not ( = ?auto_911793 ?auto_911797 ) ) ( not ( = ?auto_911793 ?auto_911798 ) ) ( not ( = ?auto_911793 ?auto_911799 ) ) ( not ( = ?auto_911793 ?auto_911800 ) ) ( not ( = ?auto_911793 ?auto_911801 ) ) ( not ( = ?auto_911793 ?auto_911802 ) ) ( not ( = ?auto_911793 ?auto_911803 ) ) ( not ( = ?auto_911793 ?auto_911804 ) ) ( not ( = ?auto_911793 ?auto_911805 ) ) ( not ( = ?auto_911794 ?auto_911795 ) ) ( not ( = ?auto_911794 ?auto_911796 ) ) ( not ( = ?auto_911794 ?auto_911797 ) ) ( not ( = ?auto_911794 ?auto_911798 ) ) ( not ( = ?auto_911794 ?auto_911799 ) ) ( not ( = ?auto_911794 ?auto_911800 ) ) ( not ( = ?auto_911794 ?auto_911801 ) ) ( not ( = ?auto_911794 ?auto_911802 ) ) ( not ( = ?auto_911794 ?auto_911803 ) ) ( not ( = ?auto_911794 ?auto_911804 ) ) ( not ( = ?auto_911794 ?auto_911805 ) ) ( not ( = ?auto_911795 ?auto_911796 ) ) ( not ( = ?auto_911795 ?auto_911797 ) ) ( not ( = ?auto_911795 ?auto_911798 ) ) ( not ( = ?auto_911795 ?auto_911799 ) ) ( not ( = ?auto_911795 ?auto_911800 ) ) ( not ( = ?auto_911795 ?auto_911801 ) ) ( not ( = ?auto_911795 ?auto_911802 ) ) ( not ( = ?auto_911795 ?auto_911803 ) ) ( not ( = ?auto_911795 ?auto_911804 ) ) ( not ( = ?auto_911795 ?auto_911805 ) ) ( not ( = ?auto_911796 ?auto_911797 ) ) ( not ( = ?auto_911796 ?auto_911798 ) ) ( not ( = ?auto_911796 ?auto_911799 ) ) ( not ( = ?auto_911796 ?auto_911800 ) ) ( not ( = ?auto_911796 ?auto_911801 ) ) ( not ( = ?auto_911796 ?auto_911802 ) ) ( not ( = ?auto_911796 ?auto_911803 ) ) ( not ( = ?auto_911796 ?auto_911804 ) ) ( not ( = ?auto_911796 ?auto_911805 ) ) ( not ( = ?auto_911797 ?auto_911798 ) ) ( not ( = ?auto_911797 ?auto_911799 ) ) ( not ( = ?auto_911797 ?auto_911800 ) ) ( not ( = ?auto_911797 ?auto_911801 ) ) ( not ( = ?auto_911797 ?auto_911802 ) ) ( not ( = ?auto_911797 ?auto_911803 ) ) ( not ( = ?auto_911797 ?auto_911804 ) ) ( not ( = ?auto_911797 ?auto_911805 ) ) ( not ( = ?auto_911798 ?auto_911799 ) ) ( not ( = ?auto_911798 ?auto_911800 ) ) ( not ( = ?auto_911798 ?auto_911801 ) ) ( not ( = ?auto_911798 ?auto_911802 ) ) ( not ( = ?auto_911798 ?auto_911803 ) ) ( not ( = ?auto_911798 ?auto_911804 ) ) ( not ( = ?auto_911798 ?auto_911805 ) ) ( not ( = ?auto_911799 ?auto_911800 ) ) ( not ( = ?auto_911799 ?auto_911801 ) ) ( not ( = ?auto_911799 ?auto_911802 ) ) ( not ( = ?auto_911799 ?auto_911803 ) ) ( not ( = ?auto_911799 ?auto_911804 ) ) ( not ( = ?auto_911799 ?auto_911805 ) ) ( not ( = ?auto_911800 ?auto_911801 ) ) ( not ( = ?auto_911800 ?auto_911802 ) ) ( not ( = ?auto_911800 ?auto_911803 ) ) ( not ( = ?auto_911800 ?auto_911804 ) ) ( not ( = ?auto_911800 ?auto_911805 ) ) ( not ( = ?auto_911801 ?auto_911802 ) ) ( not ( = ?auto_911801 ?auto_911803 ) ) ( not ( = ?auto_911801 ?auto_911804 ) ) ( not ( = ?auto_911801 ?auto_911805 ) ) ( not ( = ?auto_911802 ?auto_911803 ) ) ( not ( = ?auto_911802 ?auto_911804 ) ) ( not ( = ?auto_911802 ?auto_911805 ) ) ( not ( = ?auto_911803 ?auto_911804 ) ) ( not ( = ?auto_911803 ?auto_911805 ) ) ( not ( = ?auto_911804 ?auto_911805 ) ) ( ON ?auto_911803 ?auto_911804 ) ( ON ?auto_911802 ?auto_911803 ) ( ON ?auto_911801 ?auto_911802 ) ( ON ?auto_911800 ?auto_911801 ) ( ON ?auto_911799 ?auto_911800 ) ( ON ?auto_911798 ?auto_911799 ) ( ON ?auto_911797 ?auto_911798 ) ( ON ?auto_911796 ?auto_911797 ) ( ON ?auto_911795 ?auto_911796 ) ( ON ?auto_911794 ?auto_911795 ) ( CLEAR ?auto_911792 ) ( ON ?auto_911793 ?auto_911794 ) ( CLEAR ?auto_911793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_911790 ?auto_911791 ?auto_911792 ?auto_911793 )
      ( MAKE-15PILE ?auto_911790 ?auto_911791 ?auto_911792 ?auto_911793 ?auto_911794 ?auto_911795 ?auto_911796 ?auto_911797 ?auto_911798 ?auto_911799 ?auto_911800 ?auto_911801 ?auto_911802 ?auto_911803 ?auto_911804 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911852 - BLOCK
      ?auto_911853 - BLOCK
      ?auto_911854 - BLOCK
      ?auto_911855 - BLOCK
      ?auto_911856 - BLOCK
      ?auto_911857 - BLOCK
      ?auto_911858 - BLOCK
      ?auto_911859 - BLOCK
      ?auto_911860 - BLOCK
      ?auto_911861 - BLOCK
      ?auto_911862 - BLOCK
      ?auto_911863 - BLOCK
      ?auto_911864 - BLOCK
      ?auto_911865 - BLOCK
      ?auto_911866 - BLOCK
    )
    :vars
    (
      ?auto_911867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911866 ?auto_911867 ) ( ON-TABLE ?auto_911852 ) ( ON ?auto_911853 ?auto_911852 ) ( not ( = ?auto_911852 ?auto_911853 ) ) ( not ( = ?auto_911852 ?auto_911854 ) ) ( not ( = ?auto_911852 ?auto_911855 ) ) ( not ( = ?auto_911852 ?auto_911856 ) ) ( not ( = ?auto_911852 ?auto_911857 ) ) ( not ( = ?auto_911852 ?auto_911858 ) ) ( not ( = ?auto_911852 ?auto_911859 ) ) ( not ( = ?auto_911852 ?auto_911860 ) ) ( not ( = ?auto_911852 ?auto_911861 ) ) ( not ( = ?auto_911852 ?auto_911862 ) ) ( not ( = ?auto_911852 ?auto_911863 ) ) ( not ( = ?auto_911852 ?auto_911864 ) ) ( not ( = ?auto_911852 ?auto_911865 ) ) ( not ( = ?auto_911852 ?auto_911866 ) ) ( not ( = ?auto_911852 ?auto_911867 ) ) ( not ( = ?auto_911853 ?auto_911854 ) ) ( not ( = ?auto_911853 ?auto_911855 ) ) ( not ( = ?auto_911853 ?auto_911856 ) ) ( not ( = ?auto_911853 ?auto_911857 ) ) ( not ( = ?auto_911853 ?auto_911858 ) ) ( not ( = ?auto_911853 ?auto_911859 ) ) ( not ( = ?auto_911853 ?auto_911860 ) ) ( not ( = ?auto_911853 ?auto_911861 ) ) ( not ( = ?auto_911853 ?auto_911862 ) ) ( not ( = ?auto_911853 ?auto_911863 ) ) ( not ( = ?auto_911853 ?auto_911864 ) ) ( not ( = ?auto_911853 ?auto_911865 ) ) ( not ( = ?auto_911853 ?auto_911866 ) ) ( not ( = ?auto_911853 ?auto_911867 ) ) ( not ( = ?auto_911854 ?auto_911855 ) ) ( not ( = ?auto_911854 ?auto_911856 ) ) ( not ( = ?auto_911854 ?auto_911857 ) ) ( not ( = ?auto_911854 ?auto_911858 ) ) ( not ( = ?auto_911854 ?auto_911859 ) ) ( not ( = ?auto_911854 ?auto_911860 ) ) ( not ( = ?auto_911854 ?auto_911861 ) ) ( not ( = ?auto_911854 ?auto_911862 ) ) ( not ( = ?auto_911854 ?auto_911863 ) ) ( not ( = ?auto_911854 ?auto_911864 ) ) ( not ( = ?auto_911854 ?auto_911865 ) ) ( not ( = ?auto_911854 ?auto_911866 ) ) ( not ( = ?auto_911854 ?auto_911867 ) ) ( not ( = ?auto_911855 ?auto_911856 ) ) ( not ( = ?auto_911855 ?auto_911857 ) ) ( not ( = ?auto_911855 ?auto_911858 ) ) ( not ( = ?auto_911855 ?auto_911859 ) ) ( not ( = ?auto_911855 ?auto_911860 ) ) ( not ( = ?auto_911855 ?auto_911861 ) ) ( not ( = ?auto_911855 ?auto_911862 ) ) ( not ( = ?auto_911855 ?auto_911863 ) ) ( not ( = ?auto_911855 ?auto_911864 ) ) ( not ( = ?auto_911855 ?auto_911865 ) ) ( not ( = ?auto_911855 ?auto_911866 ) ) ( not ( = ?auto_911855 ?auto_911867 ) ) ( not ( = ?auto_911856 ?auto_911857 ) ) ( not ( = ?auto_911856 ?auto_911858 ) ) ( not ( = ?auto_911856 ?auto_911859 ) ) ( not ( = ?auto_911856 ?auto_911860 ) ) ( not ( = ?auto_911856 ?auto_911861 ) ) ( not ( = ?auto_911856 ?auto_911862 ) ) ( not ( = ?auto_911856 ?auto_911863 ) ) ( not ( = ?auto_911856 ?auto_911864 ) ) ( not ( = ?auto_911856 ?auto_911865 ) ) ( not ( = ?auto_911856 ?auto_911866 ) ) ( not ( = ?auto_911856 ?auto_911867 ) ) ( not ( = ?auto_911857 ?auto_911858 ) ) ( not ( = ?auto_911857 ?auto_911859 ) ) ( not ( = ?auto_911857 ?auto_911860 ) ) ( not ( = ?auto_911857 ?auto_911861 ) ) ( not ( = ?auto_911857 ?auto_911862 ) ) ( not ( = ?auto_911857 ?auto_911863 ) ) ( not ( = ?auto_911857 ?auto_911864 ) ) ( not ( = ?auto_911857 ?auto_911865 ) ) ( not ( = ?auto_911857 ?auto_911866 ) ) ( not ( = ?auto_911857 ?auto_911867 ) ) ( not ( = ?auto_911858 ?auto_911859 ) ) ( not ( = ?auto_911858 ?auto_911860 ) ) ( not ( = ?auto_911858 ?auto_911861 ) ) ( not ( = ?auto_911858 ?auto_911862 ) ) ( not ( = ?auto_911858 ?auto_911863 ) ) ( not ( = ?auto_911858 ?auto_911864 ) ) ( not ( = ?auto_911858 ?auto_911865 ) ) ( not ( = ?auto_911858 ?auto_911866 ) ) ( not ( = ?auto_911858 ?auto_911867 ) ) ( not ( = ?auto_911859 ?auto_911860 ) ) ( not ( = ?auto_911859 ?auto_911861 ) ) ( not ( = ?auto_911859 ?auto_911862 ) ) ( not ( = ?auto_911859 ?auto_911863 ) ) ( not ( = ?auto_911859 ?auto_911864 ) ) ( not ( = ?auto_911859 ?auto_911865 ) ) ( not ( = ?auto_911859 ?auto_911866 ) ) ( not ( = ?auto_911859 ?auto_911867 ) ) ( not ( = ?auto_911860 ?auto_911861 ) ) ( not ( = ?auto_911860 ?auto_911862 ) ) ( not ( = ?auto_911860 ?auto_911863 ) ) ( not ( = ?auto_911860 ?auto_911864 ) ) ( not ( = ?auto_911860 ?auto_911865 ) ) ( not ( = ?auto_911860 ?auto_911866 ) ) ( not ( = ?auto_911860 ?auto_911867 ) ) ( not ( = ?auto_911861 ?auto_911862 ) ) ( not ( = ?auto_911861 ?auto_911863 ) ) ( not ( = ?auto_911861 ?auto_911864 ) ) ( not ( = ?auto_911861 ?auto_911865 ) ) ( not ( = ?auto_911861 ?auto_911866 ) ) ( not ( = ?auto_911861 ?auto_911867 ) ) ( not ( = ?auto_911862 ?auto_911863 ) ) ( not ( = ?auto_911862 ?auto_911864 ) ) ( not ( = ?auto_911862 ?auto_911865 ) ) ( not ( = ?auto_911862 ?auto_911866 ) ) ( not ( = ?auto_911862 ?auto_911867 ) ) ( not ( = ?auto_911863 ?auto_911864 ) ) ( not ( = ?auto_911863 ?auto_911865 ) ) ( not ( = ?auto_911863 ?auto_911866 ) ) ( not ( = ?auto_911863 ?auto_911867 ) ) ( not ( = ?auto_911864 ?auto_911865 ) ) ( not ( = ?auto_911864 ?auto_911866 ) ) ( not ( = ?auto_911864 ?auto_911867 ) ) ( not ( = ?auto_911865 ?auto_911866 ) ) ( not ( = ?auto_911865 ?auto_911867 ) ) ( not ( = ?auto_911866 ?auto_911867 ) ) ( ON ?auto_911865 ?auto_911866 ) ( ON ?auto_911864 ?auto_911865 ) ( ON ?auto_911863 ?auto_911864 ) ( ON ?auto_911862 ?auto_911863 ) ( ON ?auto_911861 ?auto_911862 ) ( ON ?auto_911860 ?auto_911861 ) ( ON ?auto_911859 ?auto_911860 ) ( ON ?auto_911858 ?auto_911859 ) ( ON ?auto_911857 ?auto_911858 ) ( ON ?auto_911856 ?auto_911857 ) ( ON ?auto_911855 ?auto_911856 ) ( CLEAR ?auto_911853 ) ( ON ?auto_911854 ?auto_911855 ) ( CLEAR ?auto_911854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_911852 ?auto_911853 ?auto_911854 )
      ( MAKE-15PILE ?auto_911852 ?auto_911853 ?auto_911854 ?auto_911855 ?auto_911856 ?auto_911857 ?auto_911858 ?auto_911859 ?auto_911860 ?auto_911861 ?auto_911862 ?auto_911863 ?auto_911864 ?auto_911865 ?auto_911866 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911914 - BLOCK
      ?auto_911915 - BLOCK
      ?auto_911916 - BLOCK
      ?auto_911917 - BLOCK
      ?auto_911918 - BLOCK
      ?auto_911919 - BLOCK
      ?auto_911920 - BLOCK
      ?auto_911921 - BLOCK
      ?auto_911922 - BLOCK
      ?auto_911923 - BLOCK
      ?auto_911924 - BLOCK
      ?auto_911925 - BLOCK
      ?auto_911926 - BLOCK
      ?auto_911927 - BLOCK
      ?auto_911928 - BLOCK
    )
    :vars
    (
      ?auto_911929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911928 ?auto_911929 ) ( ON-TABLE ?auto_911914 ) ( not ( = ?auto_911914 ?auto_911915 ) ) ( not ( = ?auto_911914 ?auto_911916 ) ) ( not ( = ?auto_911914 ?auto_911917 ) ) ( not ( = ?auto_911914 ?auto_911918 ) ) ( not ( = ?auto_911914 ?auto_911919 ) ) ( not ( = ?auto_911914 ?auto_911920 ) ) ( not ( = ?auto_911914 ?auto_911921 ) ) ( not ( = ?auto_911914 ?auto_911922 ) ) ( not ( = ?auto_911914 ?auto_911923 ) ) ( not ( = ?auto_911914 ?auto_911924 ) ) ( not ( = ?auto_911914 ?auto_911925 ) ) ( not ( = ?auto_911914 ?auto_911926 ) ) ( not ( = ?auto_911914 ?auto_911927 ) ) ( not ( = ?auto_911914 ?auto_911928 ) ) ( not ( = ?auto_911914 ?auto_911929 ) ) ( not ( = ?auto_911915 ?auto_911916 ) ) ( not ( = ?auto_911915 ?auto_911917 ) ) ( not ( = ?auto_911915 ?auto_911918 ) ) ( not ( = ?auto_911915 ?auto_911919 ) ) ( not ( = ?auto_911915 ?auto_911920 ) ) ( not ( = ?auto_911915 ?auto_911921 ) ) ( not ( = ?auto_911915 ?auto_911922 ) ) ( not ( = ?auto_911915 ?auto_911923 ) ) ( not ( = ?auto_911915 ?auto_911924 ) ) ( not ( = ?auto_911915 ?auto_911925 ) ) ( not ( = ?auto_911915 ?auto_911926 ) ) ( not ( = ?auto_911915 ?auto_911927 ) ) ( not ( = ?auto_911915 ?auto_911928 ) ) ( not ( = ?auto_911915 ?auto_911929 ) ) ( not ( = ?auto_911916 ?auto_911917 ) ) ( not ( = ?auto_911916 ?auto_911918 ) ) ( not ( = ?auto_911916 ?auto_911919 ) ) ( not ( = ?auto_911916 ?auto_911920 ) ) ( not ( = ?auto_911916 ?auto_911921 ) ) ( not ( = ?auto_911916 ?auto_911922 ) ) ( not ( = ?auto_911916 ?auto_911923 ) ) ( not ( = ?auto_911916 ?auto_911924 ) ) ( not ( = ?auto_911916 ?auto_911925 ) ) ( not ( = ?auto_911916 ?auto_911926 ) ) ( not ( = ?auto_911916 ?auto_911927 ) ) ( not ( = ?auto_911916 ?auto_911928 ) ) ( not ( = ?auto_911916 ?auto_911929 ) ) ( not ( = ?auto_911917 ?auto_911918 ) ) ( not ( = ?auto_911917 ?auto_911919 ) ) ( not ( = ?auto_911917 ?auto_911920 ) ) ( not ( = ?auto_911917 ?auto_911921 ) ) ( not ( = ?auto_911917 ?auto_911922 ) ) ( not ( = ?auto_911917 ?auto_911923 ) ) ( not ( = ?auto_911917 ?auto_911924 ) ) ( not ( = ?auto_911917 ?auto_911925 ) ) ( not ( = ?auto_911917 ?auto_911926 ) ) ( not ( = ?auto_911917 ?auto_911927 ) ) ( not ( = ?auto_911917 ?auto_911928 ) ) ( not ( = ?auto_911917 ?auto_911929 ) ) ( not ( = ?auto_911918 ?auto_911919 ) ) ( not ( = ?auto_911918 ?auto_911920 ) ) ( not ( = ?auto_911918 ?auto_911921 ) ) ( not ( = ?auto_911918 ?auto_911922 ) ) ( not ( = ?auto_911918 ?auto_911923 ) ) ( not ( = ?auto_911918 ?auto_911924 ) ) ( not ( = ?auto_911918 ?auto_911925 ) ) ( not ( = ?auto_911918 ?auto_911926 ) ) ( not ( = ?auto_911918 ?auto_911927 ) ) ( not ( = ?auto_911918 ?auto_911928 ) ) ( not ( = ?auto_911918 ?auto_911929 ) ) ( not ( = ?auto_911919 ?auto_911920 ) ) ( not ( = ?auto_911919 ?auto_911921 ) ) ( not ( = ?auto_911919 ?auto_911922 ) ) ( not ( = ?auto_911919 ?auto_911923 ) ) ( not ( = ?auto_911919 ?auto_911924 ) ) ( not ( = ?auto_911919 ?auto_911925 ) ) ( not ( = ?auto_911919 ?auto_911926 ) ) ( not ( = ?auto_911919 ?auto_911927 ) ) ( not ( = ?auto_911919 ?auto_911928 ) ) ( not ( = ?auto_911919 ?auto_911929 ) ) ( not ( = ?auto_911920 ?auto_911921 ) ) ( not ( = ?auto_911920 ?auto_911922 ) ) ( not ( = ?auto_911920 ?auto_911923 ) ) ( not ( = ?auto_911920 ?auto_911924 ) ) ( not ( = ?auto_911920 ?auto_911925 ) ) ( not ( = ?auto_911920 ?auto_911926 ) ) ( not ( = ?auto_911920 ?auto_911927 ) ) ( not ( = ?auto_911920 ?auto_911928 ) ) ( not ( = ?auto_911920 ?auto_911929 ) ) ( not ( = ?auto_911921 ?auto_911922 ) ) ( not ( = ?auto_911921 ?auto_911923 ) ) ( not ( = ?auto_911921 ?auto_911924 ) ) ( not ( = ?auto_911921 ?auto_911925 ) ) ( not ( = ?auto_911921 ?auto_911926 ) ) ( not ( = ?auto_911921 ?auto_911927 ) ) ( not ( = ?auto_911921 ?auto_911928 ) ) ( not ( = ?auto_911921 ?auto_911929 ) ) ( not ( = ?auto_911922 ?auto_911923 ) ) ( not ( = ?auto_911922 ?auto_911924 ) ) ( not ( = ?auto_911922 ?auto_911925 ) ) ( not ( = ?auto_911922 ?auto_911926 ) ) ( not ( = ?auto_911922 ?auto_911927 ) ) ( not ( = ?auto_911922 ?auto_911928 ) ) ( not ( = ?auto_911922 ?auto_911929 ) ) ( not ( = ?auto_911923 ?auto_911924 ) ) ( not ( = ?auto_911923 ?auto_911925 ) ) ( not ( = ?auto_911923 ?auto_911926 ) ) ( not ( = ?auto_911923 ?auto_911927 ) ) ( not ( = ?auto_911923 ?auto_911928 ) ) ( not ( = ?auto_911923 ?auto_911929 ) ) ( not ( = ?auto_911924 ?auto_911925 ) ) ( not ( = ?auto_911924 ?auto_911926 ) ) ( not ( = ?auto_911924 ?auto_911927 ) ) ( not ( = ?auto_911924 ?auto_911928 ) ) ( not ( = ?auto_911924 ?auto_911929 ) ) ( not ( = ?auto_911925 ?auto_911926 ) ) ( not ( = ?auto_911925 ?auto_911927 ) ) ( not ( = ?auto_911925 ?auto_911928 ) ) ( not ( = ?auto_911925 ?auto_911929 ) ) ( not ( = ?auto_911926 ?auto_911927 ) ) ( not ( = ?auto_911926 ?auto_911928 ) ) ( not ( = ?auto_911926 ?auto_911929 ) ) ( not ( = ?auto_911927 ?auto_911928 ) ) ( not ( = ?auto_911927 ?auto_911929 ) ) ( not ( = ?auto_911928 ?auto_911929 ) ) ( ON ?auto_911927 ?auto_911928 ) ( ON ?auto_911926 ?auto_911927 ) ( ON ?auto_911925 ?auto_911926 ) ( ON ?auto_911924 ?auto_911925 ) ( ON ?auto_911923 ?auto_911924 ) ( ON ?auto_911922 ?auto_911923 ) ( ON ?auto_911921 ?auto_911922 ) ( ON ?auto_911920 ?auto_911921 ) ( ON ?auto_911919 ?auto_911920 ) ( ON ?auto_911918 ?auto_911919 ) ( ON ?auto_911917 ?auto_911918 ) ( ON ?auto_911916 ?auto_911917 ) ( CLEAR ?auto_911914 ) ( ON ?auto_911915 ?auto_911916 ) ( CLEAR ?auto_911915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_911914 ?auto_911915 )
      ( MAKE-15PILE ?auto_911914 ?auto_911915 ?auto_911916 ?auto_911917 ?auto_911918 ?auto_911919 ?auto_911920 ?auto_911921 ?auto_911922 ?auto_911923 ?auto_911924 ?auto_911925 ?auto_911926 ?auto_911927 ?auto_911928 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_911976 - BLOCK
      ?auto_911977 - BLOCK
      ?auto_911978 - BLOCK
      ?auto_911979 - BLOCK
      ?auto_911980 - BLOCK
      ?auto_911981 - BLOCK
      ?auto_911982 - BLOCK
      ?auto_911983 - BLOCK
      ?auto_911984 - BLOCK
      ?auto_911985 - BLOCK
      ?auto_911986 - BLOCK
      ?auto_911987 - BLOCK
      ?auto_911988 - BLOCK
      ?auto_911989 - BLOCK
      ?auto_911990 - BLOCK
    )
    :vars
    (
      ?auto_911991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_911990 ?auto_911991 ) ( not ( = ?auto_911976 ?auto_911977 ) ) ( not ( = ?auto_911976 ?auto_911978 ) ) ( not ( = ?auto_911976 ?auto_911979 ) ) ( not ( = ?auto_911976 ?auto_911980 ) ) ( not ( = ?auto_911976 ?auto_911981 ) ) ( not ( = ?auto_911976 ?auto_911982 ) ) ( not ( = ?auto_911976 ?auto_911983 ) ) ( not ( = ?auto_911976 ?auto_911984 ) ) ( not ( = ?auto_911976 ?auto_911985 ) ) ( not ( = ?auto_911976 ?auto_911986 ) ) ( not ( = ?auto_911976 ?auto_911987 ) ) ( not ( = ?auto_911976 ?auto_911988 ) ) ( not ( = ?auto_911976 ?auto_911989 ) ) ( not ( = ?auto_911976 ?auto_911990 ) ) ( not ( = ?auto_911976 ?auto_911991 ) ) ( not ( = ?auto_911977 ?auto_911978 ) ) ( not ( = ?auto_911977 ?auto_911979 ) ) ( not ( = ?auto_911977 ?auto_911980 ) ) ( not ( = ?auto_911977 ?auto_911981 ) ) ( not ( = ?auto_911977 ?auto_911982 ) ) ( not ( = ?auto_911977 ?auto_911983 ) ) ( not ( = ?auto_911977 ?auto_911984 ) ) ( not ( = ?auto_911977 ?auto_911985 ) ) ( not ( = ?auto_911977 ?auto_911986 ) ) ( not ( = ?auto_911977 ?auto_911987 ) ) ( not ( = ?auto_911977 ?auto_911988 ) ) ( not ( = ?auto_911977 ?auto_911989 ) ) ( not ( = ?auto_911977 ?auto_911990 ) ) ( not ( = ?auto_911977 ?auto_911991 ) ) ( not ( = ?auto_911978 ?auto_911979 ) ) ( not ( = ?auto_911978 ?auto_911980 ) ) ( not ( = ?auto_911978 ?auto_911981 ) ) ( not ( = ?auto_911978 ?auto_911982 ) ) ( not ( = ?auto_911978 ?auto_911983 ) ) ( not ( = ?auto_911978 ?auto_911984 ) ) ( not ( = ?auto_911978 ?auto_911985 ) ) ( not ( = ?auto_911978 ?auto_911986 ) ) ( not ( = ?auto_911978 ?auto_911987 ) ) ( not ( = ?auto_911978 ?auto_911988 ) ) ( not ( = ?auto_911978 ?auto_911989 ) ) ( not ( = ?auto_911978 ?auto_911990 ) ) ( not ( = ?auto_911978 ?auto_911991 ) ) ( not ( = ?auto_911979 ?auto_911980 ) ) ( not ( = ?auto_911979 ?auto_911981 ) ) ( not ( = ?auto_911979 ?auto_911982 ) ) ( not ( = ?auto_911979 ?auto_911983 ) ) ( not ( = ?auto_911979 ?auto_911984 ) ) ( not ( = ?auto_911979 ?auto_911985 ) ) ( not ( = ?auto_911979 ?auto_911986 ) ) ( not ( = ?auto_911979 ?auto_911987 ) ) ( not ( = ?auto_911979 ?auto_911988 ) ) ( not ( = ?auto_911979 ?auto_911989 ) ) ( not ( = ?auto_911979 ?auto_911990 ) ) ( not ( = ?auto_911979 ?auto_911991 ) ) ( not ( = ?auto_911980 ?auto_911981 ) ) ( not ( = ?auto_911980 ?auto_911982 ) ) ( not ( = ?auto_911980 ?auto_911983 ) ) ( not ( = ?auto_911980 ?auto_911984 ) ) ( not ( = ?auto_911980 ?auto_911985 ) ) ( not ( = ?auto_911980 ?auto_911986 ) ) ( not ( = ?auto_911980 ?auto_911987 ) ) ( not ( = ?auto_911980 ?auto_911988 ) ) ( not ( = ?auto_911980 ?auto_911989 ) ) ( not ( = ?auto_911980 ?auto_911990 ) ) ( not ( = ?auto_911980 ?auto_911991 ) ) ( not ( = ?auto_911981 ?auto_911982 ) ) ( not ( = ?auto_911981 ?auto_911983 ) ) ( not ( = ?auto_911981 ?auto_911984 ) ) ( not ( = ?auto_911981 ?auto_911985 ) ) ( not ( = ?auto_911981 ?auto_911986 ) ) ( not ( = ?auto_911981 ?auto_911987 ) ) ( not ( = ?auto_911981 ?auto_911988 ) ) ( not ( = ?auto_911981 ?auto_911989 ) ) ( not ( = ?auto_911981 ?auto_911990 ) ) ( not ( = ?auto_911981 ?auto_911991 ) ) ( not ( = ?auto_911982 ?auto_911983 ) ) ( not ( = ?auto_911982 ?auto_911984 ) ) ( not ( = ?auto_911982 ?auto_911985 ) ) ( not ( = ?auto_911982 ?auto_911986 ) ) ( not ( = ?auto_911982 ?auto_911987 ) ) ( not ( = ?auto_911982 ?auto_911988 ) ) ( not ( = ?auto_911982 ?auto_911989 ) ) ( not ( = ?auto_911982 ?auto_911990 ) ) ( not ( = ?auto_911982 ?auto_911991 ) ) ( not ( = ?auto_911983 ?auto_911984 ) ) ( not ( = ?auto_911983 ?auto_911985 ) ) ( not ( = ?auto_911983 ?auto_911986 ) ) ( not ( = ?auto_911983 ?auto_911987 ) ) ( not ( = ?auto_911983 ?auto_911988 ) ) ( not ( = ?auto_911983 ?auto_911989 ) ) ( not ( = ?auto_911983 ?auto_911990 ) ) ( not ( = ?auto_911983 ?auto_911991 ) ) ( not ( = ?auto_911984 ?auto_911985 ) ) ( not ( = ?auto_911984 ?auto_911986 ) ) ( not ( = ?auto_911984 ?auto_911987 ) ) ( not ( = ?auto_911984 ?auto_911988 ) ) ( not ( = ?auto_911984 ?auto_911989 ) ) ( not ( = ?auto_911984 ?auto_911990 ) ) ( not ( = ?auto_911984 ?auto_911991 ) ) ( not ( = ?auto_911985 ?auto_911986 ) ) ( not ( = ?auto_911985 ?auto_911987 ) ) ( not ( = ?auto_911985 ?auto_911988 ) ) ( not ( = ?auto_911985 ?auto_911989 ) ) ( not ( = ?auto_911985 ?auto_911990 ) ) ( not ( = ?auto_911985 ?auto_911991 ) ) ( not ( = ?auto_911986 ?auto_911987 ) ) ( not ( = ?auto_911986 ?auto_911988 ) ) ( not ( = ?auto_911986 ?auto_911989 ) ) ( not ( = ?auto_911986 ?auto_911990 ) ) ( not ( = ?auto_911986 ?auto_911991 ) ) ( not ( = ?auto_911987 ?auto_911988 ) ) ( not ( = ?auto_911987 ?auto_911989 ) ) ( not ( = ?auto_911987 ?auto_911990 ) ) ( not ( = ?auto_911987 ?auto_911991 ) ) ( not ( = ?auto_911988 ?auto_911989 ) ) ( not ( = ?auto_911988 ?auto_911990 ) ) ( not ( = ?auto_911988 ?auto_911991 ) ) ( not ( = ?auto_911989 ?auto_911990 ) ) ( not ( = ?auto_911989 ?auto_911991 ) ) ( not ( = ?auto_911990 ?auto_911991 ) ) ( ON ?auto_911989 ?auto_911990 ) ( ON ?auto_911988 ?auto_911989 ) ( ON ?auto_911987 ?auto_911988 ) ( ON ?auto_911986 ?auto_911987 ) ( ON ?auto_911985 ?auto_911986 ) ( ON ?auto_911984 ?auto_911985 ) ( ON ?auto_911983 ?auto_911984 ) ( ON ?auto_911982 ?auto_911983 ) ( ON ?auto_911981 ?auto_911982 ) ( ON ?auto_911980 ?auto_911981 ) ( ON ?auto_911979 ?auto_911980 ) ( ON ?auto_911978 ?auto_911979 ) ( ON ?auto_911977 ?auto_911978 ) ( ON ?auto_911976 ?auto_911977 ) ( CLEAR ?auto_911976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_911976 )
      ( MAKE-15PILE ?auto_911976 ?auto_911977 ?auto_911978 ?auto_911979 ?auto_911980 ?auto_911981 ?auto_911982 ?auto_911983 ?auto_911984 ?auto_911985 ?auto_911986 ?auto_911987 ?auto_911988 ?auto_911989 ?auto_911990 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912039 - BLOCK
      ?auto_912040 - BLOCK
      ?auto_912041 - BLOCK
      ?auto_912042 - BLOCK
      ?auto_912043 - BLOCK
      ?auto_912044 - BLOCK
      ?auto_912045 - BLOCK
      ?auto_912046 - BLOCK
      ?auto_912047 - BLOCK
      ?auto_912048 - BLOCK
      ?auto_912049 - BLOCK
      ?auto_912050 - BLOCK
      ?auto_912051 - BLOCK
      ?auto_912052 - BLOCK
      ?auto_912053 - BLOCK
      ?auto_912054 - BLOCK
    )
    :vars
    (
      ?auto_912055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_912053 ) ( ON ?auto_912054 ?auto_912055 ) ( CLEAR ?auto_912054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_912039 ) ( ON ?auto_912040 ?auto_912039 ) ( ON ?auto_912041 ?auto_912040 ) ( ON ?auto_912042 ?auto_912041 ) ( ON ?auto_912043 ?auto_912042 ) ( ON ?auto_912044 ?auto_912043 ) ( ON ?auto_912045 ?auto_912044 ) ( ON ?auto_912046 ?auto_912045 ) ( ON ?auto_912047 ?auto_912046 ) ( ON ?auto_912048 ?auto_912047 ) ( ON ?auto_912049 ?auto_912048 ) ( ON ?auto_912050 ?auto_912049 ) ( ON ?auto_912051 ?auto_912050 ) ( ON ?auto_912052 ?auto_912051 ) ( ON ?auto_912053 ?auto_912052 ) ( not ( = ?auto_912039 ?auto_912040 ) ) ( not ( = ?auto_912039 ?auto_912041 ) ) ( not ( = ?auto_912039 ?auto_912042 ) ) ( not ( = ?auto_912039 ?auto_912043 ) ) ( not ( = ?auto_912039 ?auto_912044 ) ) ( not ( = ?auto_912039 ?auto_912045 ) ) ( not ( = ?auto_912039 ?auto_912046 ) ) ( not ( = ?auto_912039 ?auto_912047 ) ) ( not ( = ?auto_912039 ?auto_912048 ) ) ( not ( = ?auto_912039 ?auto_912049 ) ) ( not ( = ?auto_912039 ?auto_912050 ) ) ( not ( = ?auto_912039 ?auto_912051 ) ) ( not ( = ?auto_912039 ?auto_912052 ) ) ( not ( = ?auto_912039 ?auto_912053 ) ) ( not ( = ?auto_912039 ?auto_912054 ) ) ( not ( = ?auto_912039 ?auto_912055 ) ) ( not ( = ?auto_912040 ?auto_912041 ) ) ( not ( = ?auto_912040 ?auto_912042 ) ) ( not ( = ?auto_912040 ?auto_912043 ) ) ( not ( = ?auto_912040 ?auto_912044 ) ) ( not ( = ?auto_912040 ?auto_912045 ) ) ( not ( = ?auto_912040 ?auto_912046 ) ) ( not ( = ?auto_912040 ?auto_912047 ) ) ( not ( = ?auto_912040 ?auto_912048 ) ) ( not ( = ?auto_912040 ?auto_912049 ) ) ( not ( = ?auto_912040 ?auto_912050 ) ) ( not ( = ?auto_912040 ?auto_912051 ) ) ( not ( = ?auto_912040 ?auto_912052 ) ) ( not ( = ?auto_912040 ?auto_912053 ) ) ( not ( = ?auto_912040 ?auto_912054 ) ) ( not ( = ?auto_912040 ?auto_912055 ) ) ( not ( = ?auto_912041 ?auto_912042 ) ) ( not ( = ?auto_912041 ?auto_912043 ) ) ( not ( = ?auto_912041 ?auto_912044 ) ) ( not ( = ?auto_912041 ?auto_912045 ) ) ( not ( = ?auto_912041 ?auto_912046 ) ) ( not ( = ?auto_912041 ?auto_912047 ) ) ( not ( = ?auto_912041 ?auto_912048 ) ) ( not ( = ?auto_912041 ?auto_912049 ) ) ( not ( = ?auto_912041 ?auto_912050 ) ) ( not ( = ?auto_912041 ?auto_912051 ) ) ( not ( = ?auto_912041 ?auto_912052 ) ) ( not ( = ?auto_912041 ?auto_912053 ) ) ( not ( = ?auto_912041 ?auto_912054 ) ) ( not ( = ?auto_912041 ?auto_912055 ) ) ( not ( = ?auto_912042 ?auto_912043 ) ) ( not ( = ?auto_912042 ?auto_912044 ) ) ( not ( = ?auto_912042 ?auto_912045 ) ) ( not ( = ?auto_912042 ?auto_912046 ) ) ( not ( = ?auto_912042 ?auto_912047 ) ) ( not ( = ?auto_912042 ?auto_912048 ) ) ( not ( = ?auto_912042 ?auto_912049 ) ) ( not ( = ?auto_912042 ?auto_912050 ) ) ( not ( = ?auto_912042 ?auto_912051 ) ) ( not ( = ?auto_912042 ?auto_912052 ) ) ( not ( = ?auto_912042 ?auto_912053 ) ) ( not ( = ?auto_912042 ?auto_912054 ) ) ( not ( = ?auto_912042 ?auto_912055 ) ) ( not ( = ?auto_912043 ?auto_912044 ) ) ( not ( = ?auto_912043 ?auto_912045 ) ) ( not ( = ?auto_912043 ?auto_912046 ) ) ( not ( = ?auto_912043 ?auto_912047 ) ) ( not ( = ?auto_912043 ?auto_912048 ) ) ( not ( = ?auto_912043 ?auto_912049 ) ) ( not ( = ?auto_912043 ?auto_912050 ) ) ( not ( = ?auto_912043 ?auto_912051 ) ) ( not ( = ?auto_912043 ?auto_912052 ) ) ( not ( = ?auto_912043 ?auto_912053 ) ) ( not ( = ?auto_912043 ?auto_912054 ) ) ( not ( = ?auto_912043 ?auto_912055 ) ) ( not ( = ?auto_912044 ?auto_912045 ) ) ( not ( = ?auto_912044 ?auto_912046 ) ) ( not ( = ?auto_912044 ?auto_912047 ) ) ( not ( = ?auto_912044 ?auto_912048 ) ) ( not ( = ?auto_912044 ?auto_912049 ) ) ( not ( = ?auto_912044 ?auto_912050 ) ) ( not ( = ?auto_912044 ?auto_912051 ) ) ( not ( = ?auto_912044 ?auto_912052 ) ) ( not ( = ?auto_912044 ?auto_912053 ) ) ( not ( = ?auto_912044 ?auto_912054 ) ) ( not ( = ?auto_912044 ?auto_912055 ) ) ( not ( = ?auto_912045 ?auto_912046 ) ) ( not ( = ?auto_912045 ?auto_912047 ) ) ( not ( = ?auto_912045 ?auto_912048 ) ) ( not ( = ?auto_912045 ?auto_912049 ) ) ( not ( = ?auto_912045 ?auto_912050 ) ) ( not ( = ?auto_912045 ?auto_912051 ) ) ( not ( = ?auto_912045 ?auto_912052 ) ) ( not ( = ?auto_912045 ?auto_912053 ) ) ( not ( = ?auto_912045 ?auto_912054 ) ) ( not ( = ?auto_912045 ?auto_912055 ) ) ( not ( = ?auto_912046 ?auto_912047 ) ) ( not ( = ?auto_912046 ?auto_912048 ) ) ( not ( = ?auto_912046 ?auto_912049 ) ) ( not ( = ?auto_912046 ?auto_912050 ) ) ( not ( = ?auto_912046 ?auto_912051 ) ) ( not ( = ?auto_912046 ?auto_912052 ) ) ( not ( = ?auto_912046 ?auto_912053 ) ) ( not ( = ?auto_912046 ?auto_912054 ) ) ( not ( = ?auto_912046 ?auto_912055 ) ) ( not ( = ?auto_912047 ?auto_912048 ) ) ( not ( = ?auto_912047 ?auto_912049 ) ) ( not ( = ?auto_912047 ?auto_912050 ) ) ( not ( = ?auto_912047 ?auto_912051 ) ) ( not ( = ?auto_912047 ?auto_912052 ) ) ( not ( = ?auto_912047 ?auto_912053 ) ) ( not ( = ?auto_912047 ?auto_912054 ) ) ( not ( = ?auto_912047 ?auto_912055 ) ) ( not ( = ?auto_912048 ?auto_912049 ) ) ( not ( = ?auto_912048 ?auto_912050 ) ) ( not ( = ?auto_912048 ?auto_912051 ) ) ( not ( = ?auto_912048 ?auto_912052 ) ) ( not ( = ?auto_912048 ?auto_912053 ) ) ( not ( = ?auto_912048 ?auto_912054 ) ) ( not ( = ?auto_912048 ?auto_912055 ) ) ( not ( = ?auto_912049 ?auto_912050 ) ) ( not ( = ?auto_912049 ?auto_912051 ) ) ( not ( = ?auto_912049 ?auto_912052 ) ) ( not ( = ?auto_912049 ?auto_912053 ) ) ( not ( = ?auto_912049 ?auto_912054 ) ) ( not ( = ?auto_912049 ?auto_912055 ) ) ( not ( = ?auto_912050 ?auto_912051 ) ) ( not ( = ?auto_912050 ?auto_912052 ) ) ( not ( = ?auto_912050 ?auto_912053 ) ) ( not ( = ?auto_912050 ?auto_912054 ) ) ( not ( = ?auto_912050 ?auto_912055 ) ) ( not ( = ?auto_912051 ?auto_912052 ) ) ( not ( = ?auto_912051 ?auto_912053 ) ) ( not ( = ?auto_912051 ?auto_912054 ) ) ( not ( = ?auto_912051 ?auto_912055 ) ) ( not ( = ?auto_912052 ?auto_912053 ) ) ( not ( = ?auto_912052 ?auto_912054 ) ) ( not ( = ?auto_912052 ?auto_912055 ) ) ( not ( = ?auto_912053 ?auto_912054 ) ) ( not ( = ?auto_912053 ?auto_912055 ) ) ( not ( = ?auto_912054 ?auto_912055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_912054 ?auto_912055 )
      ( !STACK ?auto_912054 ?auto_912053 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912105 - BLOCK
      ?auto_912106 - BLOCK
      ?auto_912107 - BLOCK
      ?auto_912108 - BLOCK
      ?auto_912109 - BLOCK
      ?auto_912110 - BLOCK
      ?auto_912111 - BLOCK
      ?auto_912112 - BLOCK
      ?auto_912113 - BLOCK
      ?auto_912114 - BLOCK
      ?auto_912115 - BLOCK
      ?auto_912116 - BLOCK
      ?auto_912117 - BLOCK
      ?auto_912118 - BLOCK
      ?auto_912119 - BLOCK
      ?auto_912120 - BLOCK
    )
    :vars
    (
      ?auto_912121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912120 ?auto_912121 ) ( ON-TABLE ?auto_912105 ) ( ON ?auto_912106 ?auto_912105 ) ( ON ?auto_912107 ?auto_912106 ) ( ON ?auto_912108 ?auto_912107 ) ( ON ?auto_912109 ?auto_912108 ) ( ON ?auto_912110 ?auto_912109 ) ( ON ?auto_912111 ?auto_912110 ) ( ON ?auto_912112 ?auto_912111 ) ( ON ?auto_912113 ?auto_912112 ) ( ON ?auto_912114 ?auto_912113 ) ( ON ?auto_912115 ?auto_912114 ) ( ON ?auto_912116 ?auto_912115 ) ( ON ?auto_912117 ?auto_912116 ) ( ON ?auto_912118 ?auto_912117 ) ( not ( = ?auto_912105 ?auto_912106 ) ) ( not ( = ?auto_912105 ?auto_912107 ) ) ( not ( = ?auto_912105 ?auto_912108 ) ) ( not ( = ?auto_912105 ?auto_912109 ) ) ( not ( = ?auto_912105 ?auto_912110 ) ) ( not ( = ?auto_912105 ?auto_912111 ) ) ( not ( = ?auto_912105 ?auto_912112 ) ) ( not ( = ?auto_912105 ?auto_912113 ) ) ( not ( = ?auto_912105 ?auto_912114 ) ) ( not ( = ?auto_912105 ?auto_912115 ) ) ( not ( = ?auto_912105 ?auto_912116 ) ) ( not ( = ?auto_912105 ?auto_912117 ) ) ( not ( = ?auto_912105 ?auto_912118 ) ) ( not ( = ?auto_912105 ?auto_912119 ) ) ( not ( = ?auto_912105 ?auto_912120 ) ) ( not ( = ?auto_912105 ?auto_912121 ) ) ( not ( = ?auto_912106 ?auto_912107 ) ) ( not ( = ?auto_912106 ?auto_912108 ) ) ( not ( = ?auto_912106 ?auto_912109 ) ) ( not ( = ?auto_912106 ?auto_912110 ) ) ( not ( = ?auto_912106 ?auto_912111 ) ) ( not ( = ?auto_912106 ?auto_912112 ) ) ( not ( = ?auto_912106 ?auto_912113 ) ) ( not ( = ?auto_912106 ?auto_912114 ) ) ( not ( = ?auto_912106 ?auto_912115 ) ) ( not ( = ?auto_912106 ?auto_912116 ) ) ( not ( = ?auto_912106 ?auto_912117 ) ) ( not ( = ?auto_912106 ?auto_912118 ) ) ( not ( = ?auto_912106 ?auto_912119 ) ) ( not ( = ?auto_912106 ?auto_912120 ) ) ( not ( = ?auto_912106 ?auto_912121 ) ) ( not ( = ?auto_912107 ?auto_912108 ) ) ( not ( = ?auto_912107 ?auto_912109 ) ) ( not ( = ?auto_912107 ?auto_912110 ) ) ( not ( = ?auto_912107 ?auto_912111 ) ) ( not ( = ?auto_912107 ?auto_912112 ) ) ( not ( = ?auto_912107 ?auto_912113 ) ) ( not ( = ?auto_912107 ?auto_912114 ) ) ( not ( = ?auto_912107 ?auto_912115 ) ) ( not ( = ?auto_912107 ?auto_912116 ) ) ( not ( = ?auto_912107 ?auto_912117 ) ) ( not ( = ?auto_912107 ?auto_912118 ) ) ( not ( = ?auto_912107 ?auto_912119 ) ) ( not ( = ?auto_912107 ?auto_912120 ) ) ( not ( = ?auto_912107 ?auto_912121 ) ) ( not ( = ?auto_912108 ?auto_912109 ) ) ( not ( = ?auto_912108 ?auto_912110 ) ) ( not ( = ?auto_912108 ?auto_912111 ) ) ( not ( = ?auto_912108 ?auto_912112 ) ) ( not ( = ?auto_912108 ?auto_912113 ) ) ( not ( = ?auto_912108 ?auto_912114 ) ) ( not ( = ?auto_912108 ?auto_912115 ) ) ( not ( = ?auto_912108 ?auto_912116 ) ) ( not ( = ?auto_912108 ?auto_912117 ) ) ( not ( = ?auto_912108 ?auto_912118 ) ) ( not ( = ?auto_912108 ?auto_912119 ) ) ( not ( = ?auto_912108 ?auto_912120 ) ) ( not ( = ?auto_912108 ?auto_912121 ) ) ( not ( = ?auto_912109 ?auto_912110 ) ) ( not ( = ?auto_912109 ?auto_912111 ) ) ( not ( = ?auto_912109 ?auto_912112 ) ) ( not ( = ?auto_912109 ?auto_912113 ) ) ( not ( = ?auto_912109 ?auto_912114 ) ) ( not ( = ?auto_912109 ?auto_912115 ) ) ( not ( = ?auto_912109 ?auto_912116 ) ) ( not ( = ?auto_912109 ?auto_912117 ) ) ( not ( = ?auto_912109 ?auto_912118 ) ) ( not ( = ?auto_912109 ?auto_912119 ) ) ( not ( = ?auto_912109 ?auto_912120 ) ) ( not ( = ?auto_912109 ?auto_912121 ) ) ( not ( = ?auto_912110 ?auto_912111 ) ) ( not ( = ?auto_912110 ?auto_912112 ) ) ( not ( = ?auto_912110 ?auto_912113 ) ) ( not ( = ?auto_912110 ?auto_912114 ) ) ( not ( = ?auto_912110 ?auto_912115 ) ) ( not ( = ?auto_912110 ?auto_912116 ) ) ( not ( = ?auto_912110 ?auto_912117 ) ) ( not ( = ?auto_912110 ?auto_912118 ) ) ( not ( = ?auto_912110 ?auto_912119 ) ) ( not ( = ?auto_912110 ?auto_912120 ) ) ( not ( = ?auto_912110 ?auto_912121 ) ) ( not ( = ?auto_912111 ?auto_912112 ) ) ( not ( = ?auto_912111 ?auto_912113 ) ) ( not ( = ?auto_912111 ?auto_912114 ) ) ( not ( = ?auto_912111 ?auto_912115 ) ) ( not ( = ?auto_912111 ?auto_912116 ) ) ( not ( = ?auto_912111 ?auto_912117 ) ) ( not ( = ?auto_912111 ?auto_912118 ) ) ( not ( = ?auto_912111 ?auto_912119 ) ) ( not ( = ?auto_912111 ?auto_912120 ) ) ( not ( = ?auto_912111 ?auto_912121 ) ) ( not ( = ?auto_912112 ?auto_912113 ) ) ( not ( = ?auto_912112 ?auto_912114 ) ) ( not ( = ?auto_912112 ?auto_912115 ) ) ( not ( = ?auto_912112 ?auto_912116 ) ) ( not ( = ?auto_912112 ?auto_912117 ) ) ( not ( = ?auto_912112 ?auto_912118 ) ) ( not ( = ?auto_912112 ?auto_912119 ) ) ( not ( = ?auto_912112 ?auto_912120 ) ) ( not ( = ?auto_912112 ?auto_912121 ) ) ( not ( = ?auto_912113 ?auto_912114 ) ) ( not ( = ?auto_912113 ?auto_912115 ) ) ( not ( = ?auto_912113 ?auto_912116 ) ) ( not ( = ?auto_912113 ?auto_912117 ) ) ( not ( = ?auto_912113 ?auto_912118 ) ) ( not ( = ?auto_912113 ?auto_912119 ) ) ( not ( = ?auto_912113 ?auto_912120 ) ) ( not ( = ?auto_912113 ?auto_912121 ) ) ( not ( = ?auto_912114 ?auto_912115 ) ) ( not ( = ?auto_912114 ?auto_912116 ) ) ( not ( = ?auto_912114 ?auto_912117 ) ) ( not ( = ?auto_912114 ?auto_912118 ) ) ( not ( = ?auto_912114 ?auto_912119 ) ) ( not ( = ?auto_912114 ?auto_912120 ) ) ( not ( = ?auto_912114 ?auto_912121 ) ) ( not ( = ?auto_912115 ?auto_912116 ) ) ( not ( = ?auto_912115 ?auto_912117 ) ) ( not ( = ?auto_912115 ?auto_912118 ) ) ( not ( = ?auto_912115 ?auto_912119 ) ) ( not ( = ?auto_912115 ?auto_912120 ) ) ( not ( = ?auto_912115 ?auto_912121 ) ) ( not ( = ?auto_912116 ?auto_912117 ) ) ( not ( = ?auto_912116 ?auto_912118 ) ) ( not ( = ?auto_912116 ?auto_912119 ) ) ( not ( = ?auto_912116 ?auto_912120 ) ) ( not ( = ?auto_912116 ?auto_912121 ) ) ( not ( = ?auto_912117 ?auto_912118 ) ) ( not ( = ?auto_912117 ?auto_912119 ) ) ( not ( = ?auto_912117 ?auto_912120 ) ) ( not ( = ?auto_912117 ?auto_912121 ) ) ( not ( = ?auto_912118 ?auto_912119 ) ) ( not ( = ?auto_912118 ?auto_912120 ) ) ( not ( = ?auto_912118 ?auto_912121 ) ) ( not ( = ?auto_912119 ?auto_912120 ) ) ( not ( = ?auto_912119 ?auto_912121 ) ) ( not ( = ?auto_912120 ?auto_912121 ) ) ( CLEAR ?auto_912118 ) ( ON ?auto_912119 ?auto_912120 ) ( CLEAR ?auto_912119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_912105 ?auto_912106 ?auto_912107 ?auto_912108 ?auto_912109 ?auto_912110 ?auto_912111 ?auto_912112 ?auto_912113 ?auto_912114 ?auto_912115 ?auto_912116 ?auto_912117 ?auto_912118 ?auto_912119 )
      ( MAKE-16PILE ?auto_912105 ?auto_912106 ?auto_912107 ?auto_912108 ?auto_912109 ?auto_912110 ?auto_912111 ?auto_912112 ?auto_912113 ?auto_912114 ?auto_912115 ?auto_912116 ?auto_912117 ?auto_912118 ?auto_912119 ?auto_912120 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912171 - BLOCK
      ?auto_912172 - BLOCK
      ?auto_912173 - BLOCK
      ?auto_912174 - BLOCK
      ?auto_912175 - BLOCK
      ?auto_912176 - BLOCK
      ?auto_912177 - BLOCK
      ?auto_912178 - BLOCK
      ?auto_912179 - BLOCK
      ?auto_912180 - BLOCK
      ?auto_912181 - BLOCK
      ?auto_912182 - BLOCK
      ?auto_912183 - BLOCK
      ?auto_912184 - BLOCK
      ?auto_912185 - BLOCK
      ?auto_912186 - BLOCK
    )
    :vars
    (
      ?auto_912187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912186 ?auto_912187 ) ( ON-TABLE ?auto_912171 ) ( ON ?auto_912172 ?auto_912171 ) ( ON ?auto_912173 ?auto_912172 ) ( ON ?auto_912174 ?auto_912173 ) ( ON ?auto_912175 ?auto_912174 ) ( ON ?auto_912176 ?auto_912175 ) ( ON ?auto_912177 ?auto_912176 ) ( ON ?auto_912178 ?auto_912177 ) ( ON ?auto_912179 ?auto_912178 ) ( ON ?auto_912180 ?auto_912179 ) ( ON ?auto_912181 ?auto_912180 ) ( ON ?auto_912182 ?auto_912181 ) ( ON ?auto_912183 ?auto_912182 ) ( not ( = ?auto_912171 ?auto_912172 ) ) ( not ( = ?auto_912171 ?auto_912173 ) ) ( not ( = ?auto_912171 ?auto_912174 ) ) ( not ( = ?auto_912171 ?auto_912175 ) ) ( not ( = ?auto_912171 ?auto_912176 ) ) ( not ( = ?auto_912171 ?auto_912177 ) ) ( not ( = ?auto_912171 ?auto_912178 ) ) ( not ( = ?auto_912171 ?auto_912179 ) ) ( not ( = ?auto_912171 ?auto_912180 ) ) ( not ( = ?auto_912171 ?auto_912181 ) ) ( not ( = ?auto_912171 ?auto_912182 ) ) ( not ( = ?auto_912171 ?auto_912183 ) ) ( not ( = ?auto_912171 ?auto_912184 ) ) ( not ( = ?auto_912171 ?auto_912185 ) ) ( not ( = ?auto_912171 ?auto_912186 ) ) ( not ( = ?auto_912171 ?auto_912187 ) ) ( not ( = ?auto_912172 ?auto_912173 ) ) ( not ( = ?auto_912172 ?auto_912174 ) ) ( not ( = ?auto_912172 ?auto_912175 ) ) ( not ( = ?auto_912172 ?auto_912176 ) ) ( not ( = ?auto_912172 ?auto_912177 ) ) ( not ( = ?auto_912172 ?auto_912178 ) ) ( not ( = ?auto_912172 ?auto_912179 ) ) ( not ( = ?auto_912172 ?auto_912180 ) ) ( not ( = ?auto_912172 ?auto_912181 ) ) ( not ( = ?auto_912172 ?auto_912182 ) ) ( not ( = ?auto_912172 ?auto_912183 ) ) ( not ( = ?auto_912172 ?auto_912184 ) ) ( not ( = ?auto_912172 ?auto_912185 ) ) ( not ( = ?auto_912172 ?auto_912186 ) ) ( not ( = ?auto_912172 ?auto_912187 ) ) ( not ( = ?auto_912173 ?auto_912174 ) ) ( not ( = ?auto_912173 ?auto_912175 ) ) ( not ( = ?auto_912173 ?auto_912176 ) ) ( not ( = ?auto_912173 ?auto_912177 ) ) ( not ( = ?auto_912173 ?auto_912178 ) ) ( not ( = ?auto_912173 ?auto_912179 ) ) ( not ( = ?auto_912173 ?auto_912180 ) ) ( not ( = ?auto_912173 ?auto_912181 ) ) ( not ( = ?auto_912173 ?auto_912182 ) ) ( not ( = ?auto_912173 ?auto_912183 ) ) ( not ( = ?auto_912173 ?auto_912184 ) ) ( not ( = ?auto_912173 ?auto_912185 ) ) ( not ( = ?auto_912173 ?auto_912186 ) ) ( not ( = ?auto_912173 ?auto_912187 ) ) ( not ( = ?auto_912174 ?auto_912175 ) ) ( not ( = ?auto_912174 ?auto_912176 ) ) ( not ( = ?auto_912174 ?auto_912177 ) ) ( not ( = ?auto_912174 ?auto_912178 ) ) ( not ( = ?auto_912174 ?auto_912179 ) ) ( not ( = ?auto_912174 ?auto_912180 ) ) ( not ( = ?auto_912174 ?auto_912181 ) ) ( not ( = ?auto_912174 ?auto_912182 ) ) ( not ( = ?auto_912174 ?auto_912183 ) ) ( not ( = ?auto_912174 ?auto_912184 ) ) ( not ( = ?auto_912174 ?auto_912185 ) ) ( not ( = ?auto_912174 ?auto_912186 ) ) ( not ( = ?auto_912174 ?auto_912187 ) ) ( not ( = ?auto_912175 ?auto_912176 ) ) ( not ( = ?auto_912175 ?auto_912177 ) ) ( not ( = ?auto_912175 ?auto_912178 ) ) ( not ( = ?auto_912175 ?auto_912179 ) ) ( not ( = ?auto_912175 ?auto_912180 ) ) ( not ( = ?auto_912175 ?auto_912181 ) ) ( not ( = ?auto_912175 ?auto_912182 ) ) ( not ( = ?auto_912175 ?auto_912183 ) ) ( not ( = ?auto_912175 ?auto_912184 ) ) ( not ( = ?auto_912175 ?auto_912185 ) ) ( not ( = ?auto_912175 ?auto_912186 ) ) ( not ( = ?auto_912175 ?auto_912187 ) ) ( not ( = ?auto_912176 ?auto_912177 ) ) ( not ( = ?auto_912176 ?auto_912178 ) ) ( not ( = ?auto_912176 ?auto_912179 ) ) ( not ( = ?auto_912176 ?auto_912180 ) ) ( not ( = ?auto_912176 ?auto_912181 ) ) ( not ( = ?auto_912176 ?auto_912182 ) ) ( not ( = ?auto_912176 ?auto_912183 ) ) ( not ( = ?auto_912176 ?auto_912184 ) ) ( not ( = ?auto_912176 ?auto_912185 ) ) ( not ( = ?auto_912176 ?auto_912186 ) ) ( not ( = ?auto_912176 ?auto_912187 ) ) ( not ( = ?auto_912177 ?auto_912178 ) ) ( not ( = ?auto_912177 ?auto_912179 ) ) ( not ( = ?auto_912177 ?auto_912180 ) ) ( not ( = ?auto_912177 ?auto_912181 ) ) ( not ( = ?auto_912177 ?auto_912182 ) ) ( not ( = ?auto_912177 ?auto_912183 ) ) ( not ( = ?auto_912177 ?auto_912184 ) ) ( not ( = ?auto_912177 ?auto_912185 ) ) ( not ( = ?auto_912177 ?auto_912186 ) ) ( not ( = ?auto_912177 ?auto_912187 ) ) ( not ( = ?auto_912178 ?auto_912179 ) ) ( not ( = ?auto_912178 ?auto_912180 ) ) ( not ( = ?auto_912178 ?auto_912181 ) ) ( not ( = ?auto_912178 ?auto_912182 ) ) ( not ( = ?auto_912178 ?auto_912183 ) ) ( not ( = ?auto_912178 ?auto_912184 ) ) ( not ( = ?auto_912178 ?auto_912185 ) ) ( not ( = ?auto_912178 ?auto_912186 ) ) ( not ( = ?auto_912178 ?auto_912187 ) ) ( not ( = ?auto_912179 ?auto_912180 ) ) ( not ( = ?auto_912179 ?auto_912181 ) ) ( not ( = ?auto_912179 ?auto_912182 ) ) ( not ( = ?auto_912179 ?auto_912183 ) ) ( not ( = ?auto_912179 ?auto_912184 ) ) ( not ( = ?auto_912179 ?auto_912185 ) ) ( not ( = ?auto_912179 ?auto_912186 ) ) ( not ( = ?auto_912179 ?auto_912187 ) ) ( not ( = ?auto_912180 ?auto_912181 ) ) ( not ( = ?auto_912180 ?auto_912182 ) ) ( not ( = ?auto_912180 ?auto_912183 ) ) ( not ( = ?auto_912180 ?auto_912184 ) ) ( not ( = ?auto_912180 ?auto_912185 ) ) ( not ( = ?auto_912180 ?auto_912186 ) ) ( not ( = ?auto_912180 ?auto_912187 ) ) ( not ( = ?auto_912181 ?auto_912182 ) ) ( not ( = ?auto_912181 ?auto_912183 ) ) ( not ( = ?auto_912181 ?auto_912184 ) ) ( not ( = ?auto_912181 ?auto_912185 ) ) ( not ( = ?auto_912181 ?auto_912186 ) ) ( not ( = ?auto_912181 ?auto_912187 ) ) ( not ( = ?auto_912182 ?auto_912183 ) ) ( not ( = ?auto_912182 ?auto_912184 ) ) ( not ( = ?auto_912182 ?auto_912185 ) ) ( not ( = ?auto_912182 ?auto_912186 ) ) ( not ( = ?auto_912182 ?auto_912187 ) ) ( not ( = ?auto_912183 ?auto_912184 ) ) ( not ( = ?auto_912183 ?auto_912185 ) ) ( not ( = ?auto_912183 ?auto_912186 ) ) ( not ( = ?auto_912183 ?auto_912187 ) ) ( not ( = ?auto_912184 ?auto_912185 ) ) ( not ( = ?auto_912184 ?auto_912186 ) ) ( not ( = ?auto_912184 ?auto_912187 ) ) ( not ( = ?auto_912185 ?auto_912186 ) ) ( not ( = ?auto_912185 ?auto_912187 ) ) ( not ( = ?auto_912186 ?auto_912187 ) ) ( ON ?auto_912185 ?auto_912186 ) ( CLEAR ?auto_912183 ) ( ON ?auto_912184 ?auto_912185 ) ( CLEAR ?auto_912184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_912171 ?auto_912172 ?auto_912173 ?auto_912174 ?auto_912175 ?auto_912176 ?auto_912177 ?auto_912178 ?auto_912179 ?auto_912180 ?auto_912181 ?auto_912182 ?auto_912183 ?auto_912184 )
      ( MAKE-16PILE ?auto_912171 ?auto_912172 ?auto_912173 ?auto_912174 ?auto_912175 ?auto_912176 ?auto_912177 ?auto_912178 ?auto_912179 ?auto_912180 ?auto_912181 ?auto_912182 ?auto_912183 ?auto_912184 ?auto_912185 ?auto_912186 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912237 - BLOCK
      ?auto_912238 - BLOCK
      ?auto_912239 - BLOCK
      ?auto_912240 - BLOCK
      ?auto_912241 - BLOCK
      ?auto_912242 - BLOCK
      ?auto_912243 - BLOCK
      ?auto_912244 - BLOCK
      ?auto_912245 - BLOCK
      ?auto_912246 - BLOCK
      ?auto_912247 - BLOCK
      ?auto_912248 - BLOCK
      ?auto_912249 - BLOCK
      ?auto_912250 - BLOCK
      ?auto_912251 - BLOCK
      ?auto_912252 - BLOCK
    )
    :vars
    (
      ?auto_912253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912252 ?auto_912253 ) ( ON-TABLE ?auto_912237 ) ( ON ?auto_912238 ?auto_912237 ) ( ON ?auto_912239 ?auto_912238 ) ( ON ?auto_912240 ?auto_912239 ) ( ON ?auto_912241 ?auto_912240 ) ( ON ?auto_912242 ?auto_912241 ) ( ON ?auto_912243 ?auto_912242 ) ( ON ?auto_912244 ?auto_912243 ) ( ON ?auto_912245 ?auto_912244 ) ( ON ?auto_912246 ?auto_912245 ) ( ON ?auto_912247 ?auto_912246 ) ( ON ?auto_912248 ?auto_912247 ) ( not ( = ?auto_912237 ?auto_912238 ) ) ( not ( = ?auto_912237 ?auto_912239 ) ) ( not ( = ?auto_912237 ?auto_912240 ) ) ( not ( = ?auto_912237 ?auto_912241 ) ) ( not ( = ?auto_912237 ?auto_912242 ) ) ( not ( = ?auto_912237 ?auto_912243 ) ) ( not ( = ?auto_912237 ?auto_912244 ) ) ( not ( = ?auto_912237 ?auto_912245 ) ) ( not ( = ?auto_912237 ?auto_912246 ) ) ( not ( = ?auto_912237 ?auto_912247 ) ) ( not ( = ?auto_912237 ?auto_912248 ) ) ( not ( = ?auto_912237 ?auto_912249 ) ) ( not ( = ?auto_912237 ?auto_912250 ) ) ( not ( = ?auto_912237 ?auto_912251 ) ) ( not ( = ?auto_912237 ?auto_912252 ) ) ( not ( = ?auto_912237 ?auto_912253 ) ) ( not ( = ?auto_912238 ?auto_912239 ) ) ( not ( = ?auto_912238 ?auto_912240 ) ) ( not ( = ?auto_912238 ?auto_912241 ) ) ( not ( = ?auto_912238 ?auto_912242 ) ) ( not ( = ?auto_912238 ?auto_912243 ) ) ( not ( = ?auto_912238 ?auto_912244 ) ) ( not ( = ?auto_912238 ?auto_912245 ) ) ( not ( = ?auto_912238 ?auto_912246 ) ) ( not ( = ?auto_912238 ?auto_912247 ) ) ( not ( = ?auto_912238 ?auto_912248 ) ) ( not ( = ?auto_912238 ?auto_912249 ) ) ( not ( = ?auto_912238 ?auto_912250 ) ) ( not ( = ?auto_912238 ?auto_912251 ) ) ( not ( = ?auto_912238 ?auto_912252 ) ) ( not ( = ?auto_912238 ?auto_912253 ) ) ( not ( = ?auto_912239 ?auto_912240 ) ) ( not ( = ?auto_912239 ?auto_912241 ) ) ( not ( = ?auto_912239 ?auto_912242 ) ) ( not ( = ?auto_912239 ?auto_912243 ) ) ( not ( = ?auto_912239 ?auto_912244 ) ) ( not ( = ?auto_912239 ?auto_912245 ) ) ( not ( = ?auto_912239 ?auto_912246 ) ) ( not ( = ?auto_912239 ?auto_912247 ) ) ( not ( = ?auto_912239 ?auto_912248 ) ) ( not ( = ?auto_912239 ?auto_912249 ) ) ( not ( = ?auto_912239 ?auto_912250 ) ) ( not ( = ?auto_912239 ?auto_912251 ) ) ( not ( = ?auto_912239 ?auto_912252 ) ) ( not ( = ?auto_912239 ?auto_912253 ) ) ( not ( = ?auto_912240 ?auto_912241 ) ) ( not ( = ?auto_912240 ?auto_912242 ) ) ( not ( = ?auto_912240 ?auto_912243 ) ) ( not ( = ?auto_912240 ?auto_912244 ) ) ( not ( = ?auto_912240 ?auto_912245 ) ) ( not ( = ?auto_912240 ?auto_912246 ) ) ( not ( = ?auto_912240 ?auto_912247 ) ) ( not ( = ?auto_912240 ?auto_912248 ) ) ( not ( = ?auto_912240 ?auto_912249 ) ) ( not ( = ?auto_912240 ?auto_912250 ) ) ( not ( = ?auto_912240 ?auto_912251 ) ) ( not ( = ?auto_912240 ?auto_912252 ) ) ( not ( = ?auto_912240 ?auto_912253 ) ) ( not ( = ?auto_912241 ?auto_912242 ) ) ( not ( = ?auto_912241 ?auto_912243 ) ) ( not ( = ?auto_912241 ?auto_912244 ) ) ( not ( = ?auto_912241 ?auto_912245 ) ) ( not ( = ?auto_912241 ?auto_912246 ) ) ( not ( = ?auto_912241 ?auto_912247 ) ) ( not ( = ?auto_912241 ?auto_912248 ) ) ( not ( = ?auto_912241 ?auto_912249 ) ) ( not ( = ?auto_912241 ?auto_912250 ) ) ( not ( = ?auto_912241 ?auto_912251 ) ) ( not ( = ?auto_912241 ?auto_912252 ) ) ( not ( = ?auto_912241 ?auto_912253 ) ) ( not ( = ?auto_912242 ?auto_912243 ) ) ( not ( = ?auto_912242 ?auto_912244 ) ) ( not ( = ?auto_912242 ?auto_912245 ) ) ( not ( = ?auto_912242 ?auto_912246 ) ) ( not ( = ?auto_912242 ?auto_912247 ) ) ( not ( = ?auto_912242 ?auto_912248 ) ) ( not ( = ?auto_912242 ?auto_912249 ) ) ( not ( = ?auto_912242 ?auto_912250 ) ) ( not ( = ?auto_912242 ?auto_912251 ) ) ( not ( = ?auto_912242 ?auto_912252 ) ) ( not ( = ?auto_912242 ?auto_912253 ) ) ( not ( = ?auto_912243 ?auto_912244 ) ) ( not ( = ?auto_912243 ?auto_912245 ) ) ( not ( = ?auto_912243 ?auto_912246 ) ) ( not ( = ?auto_912243 ?auto_912247 ) ) ( not ( = ?auto_912243 ?auto_912248 ) ) ( not ( = ?auto_912243 ?auto_912249 ) ) ( not ( = ?auto_912243 ?auto_912250 ) ) ( not ( = ?auto_912243 ?auto_912251 ) ) ( not ( = ?auto_912243 ?auto_912252 ) ) ( not ( = ?auto_912243 ?auto_912253 ) ) ( not ( = ?auto_912244 ?auto_912245 ) ) ( not ( = ?auto_912244 ?auto_912246 ) ) ( not ( = ?auto_912244 ?auto_912247 ) ) ( not ( = ?auto_912244 ?auto_912248 ) ) ( not ( = ?auto_912244 ?auto_912249 ) ) ( not ( = ?auto_912244 ?auto_912250 ) ) ( not ( = ?auto_912244 ?auto_912251 ) ) ( not ( = ?auto_912244 ?auto_912252 ) ) ( not ( = ?auto_912244 ?auto_912253 ) ) ( not ( = ?auto_912245 ?auto_912246 ) ) ( not ( = ?auto_912245 ?auto_912247 ) ) ( not ( = ?auto_912245 ?auto_912248 ) ) ( not ( = ?auto_912245 ?auto_912249 ) ) ( not ( = ?auto_912245 ?auto_912250 ) ) ( not ( = ?auto_912245 ?auto_912251 ) ) ( not ( = ?auto_912245 ?auto_912252 ) ) ( not ( = ?auto_912245 ?auto_912253 ) ) ( not ( = ?auto_912246 ?auto_912247 ) ) ( not ( = ?auto_912246 ?auto_912248 ) ) ( not ( = ?auto_912246 ?auto_912249 ) ) ( not ( = ?auto_912246 ?auto_912250 ) ) ( not ( = ?auto_912246 ?auto_912251 ) ) ( not ( = ?auto_912246 ?auto_912252 ) ) ( not ( = ?auto_912246 ?auto_912253 ) ) ( not ( = ?auto_912247 ?auto_912248 ) ) ( not ( = ?auto_912247 ?auto_912249 ) ) ( not ( = ?auto_912247 ?auto_912250 ) ) ( not ( = ?auto_912247 ?auto_912251 ) ) ( not ( = ?auto_912247 ?auto_912252 ) ) ( not ( = ?auto_912247 ?auto_912253 ) ) ( not ( = ?auto_912248 ?auto_912249 ) ) ( not ( = ?auto_912248 ?auto_912250 ) ) ( not ( = ?auto_912248 ?auto_912251 ) ) ( not ( = ?auto_912248 ?auto_912252 ) ) ( not ( = ?auto_912248 ?auto_912253 ) ) ( not ( = ?auto_912249 ?auto_912250 ) ) ( not ( = ?auto_912249 ?auto_912251 ) ) ( not ( = ?auto_912249 ?auto_912252 ) ) ( not ( = ?auto_912249 ?auto_912253 ) ) ( not ( = ?auto_912250 ?auto_912251 ) ) ( not ( = ?auto_912250 ?auto_912252 ) ) ( not ( = ?auto_912250 ?auto_912253 ) ) ( not ( = ?auto_912251 ?auto_912252 ) ) ( not ( = ?auto_912251 ?auto_912253 ) ) ( not ( = ?auto_912252 ?auto_912253 ) ) ( ON ?auto_912251 ?auto_912252 ) ( ON ?auto_912250 ?auto_912251 ) ( CLEAR ?auto_912248 ) ( ON ?auto_912249 ?auto_912250 ) ( CLEAR ?auto_912249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_912237 ?auto_912238 ?auto_912239 ?auto_912240 ?auto_912241 ?auto_912242 ?auto_912243 ?auto_912244 ?auto_912245 ?auto_912246 ?auto_912247 ?auto_912248 ?auto_912249 )
      ( MAKE-16PILE ?auto_912237 ?auto_912238 ?auto_912239 ?auto_912240 ?auto_912241 ?auto_912242 ?auto_912243 ?auto_912244 ?auto_912245 ?auto_912246 ?auto_912247 ?auto_912248 ?auto_912249 ?auto_912250 ?auto_912251 ?auto_912252 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912303 - BLOCK
      ?auto_912304 - BLOCK
      ?auto_912305 - BLOCK
      ?auto_912306 - BLOCK
      ?auto_912307 - BLOCK
      ?auto_912308 - BLOCK
      ?auto_912309 - BLOCK
      ?auto_912310 - BLOCK
      ?auto_912311 - BLOCK
      ?auto_912312 - BLOCK
      ?auto_912313 - BLOCK
      ?auto_912314 - BLOCK
      ?auto_912315 - BLOCK
      ?auto_912316 - BLOCK
      ?auto_912317 - BLOCK
      ?auto_912318 - BLOCK
    )
    :vars
    (
      ?auto_912319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912318 ?auto_912319 ) ( ON-TABLE ?auto_912303 ) ( ON ?auto_912304 ?auto_912303 ) ( ON ?auto_912305 ?auto_912304 ) ( ON ?auto_912306 ?auto_912305 ) ( ON ?auto_912307 ?auto_912306 ) ( ON ?auto_912308 ?auto_912307 ) ( ON ?auto_912309 ?auto_912308 ) ( ON ?auto_912310 ?auto_912309 ) ( ON ?auto_912311 ?auto_912310 ) ( ON ?auto_912312 ?auto_912311 ) ( ON ?auto_912313 ?auto_912312 ) ( not ( = ?auto_912303 ?auto_912304 ) ) ( not ( = ?auto_912303 ?auto_912305 ) ) ( not ( = ?auto_912303 ?auto_912306 ) ) ( not ( = ?auto_912303 ?auto_912307 ) ) ( not ( = ?auto_912303 ?auto_912308 ) ) ( not ( = ?auto_912303 ?auto_912309 ) ) ( not ( = ?auto_912303 ?auto_912310 ) ) ( not ( = ?auto_912303 ?auto_912311 ) ) ( not ( = ?auto_912303 ?auto_912312 ) ) ( not ( = ?auto_912303 ?auto_912313 ) ) ( not ( = ?auto_912303 ?auto_912314 ) ) ( not ( = ?auto_912303 ?auto_912315 ) ) ( not ( = ?auto_912303 ?auto_912316 ) ) ( not ( = ?auto_912303 ?auto_912317 ) ) ( not ( = ?auto_912303 ?auto_912318 ) ) ( not ( = ?auto_912303 ?auto_912319 ) ) ( not ( = ?auto_912304 ?auto_912305 ) ) ( not ( = ?auto_912304 ?auto_912306 ) ) ( not ( = ?auto_912304 ?auto_912307 ) ) ( not ( = ?auto_912304 ?auto_912308 ) ) ( not ( = ?auto_912304 ?auto_912309 ) ) ( not ( = ?auto_912304 ?auto_912310 ) ) ( not ( = ?auto_912304 ?auto_912311 ) ) ( not ( = ?auto_912304 ?auto_912312 ) ) ( not ( = ?auto_912304 ?auto_912313 ) ) ( not ( = ?auto_912304 ?auto_912314 ) ) ( not ( = ?auto_912304 ?auto_912315 ) ) ( not ( = ?auto_912304 ?auto_912316 ) ) ( not ( = ?auto_912304 ?auto_912317 ) ) ( not ( = ?auto_912304 ?auto_912318 ) ) ( not ( = ?auto_912304 ?auto_912319 ) ) ( not ( = ?auto_912305 ?auto_912306 ) ) ( not ( = ?auto_912305 ?auto_912307 ) ) ( not ( = ?auto_912305 ?auto_912308 ) ) ( not ( = ?auto_912305 ?auto_912309 ) ) ( not ( = ?auto_912305 ?auto_912310 ) ) ( not ( = ?auto_912305 ?auto_912311 ) ) ( not ( = ?auto_912305 ?auto_912312 ) ) ( not ( = ?auto_912305 ?auto_912313 ) ) ( not ( = ?auto_912305 ?auto_912314 ) ) ( not ( = ?auto_912305 ?auto_912315 ) ) ( not ( = ?auto_912305 ?auto_912316 ) ) ( not ( = ?auto_912305 ?auto_912317 ) ) ( not ( = ?auto_912305 ?auto_912318 ) ) ( not ( = ?auto_912305 ?auto_912319 ) ) ( not ( = ?auto_912306 ?auto_912307 ) ) ( not ( = ?auto_912306 ?auto_912308 ) ) ( not ( = ?auto_912306 ?auto_912309 ) ) ( not ( = ?auto_912306 ?auto_912310 ) ) ( not ( = ?auto_912306 ?auto_912311 ) ) ( not ( = ?auto_912306 ?auto_912312 ) ) ( not ( = ?auto_912306 ?auto_912313 ) ) ( not ( = ?auto_912306 ?auto_912314 ) ) ( not ( = ?auto_912306 ?auto_912315 ) ) ( not ( = ?auto_912306 ?auto_912316 ) ) ( not ( = ?auto_912306 ?auto_912317 ) ) ( not ( = ?auto_912306 ?auto_912318 ) ) ( not ( = ?auto_912306 ?auto_912319 ) ) ( not ( = ?auto_912307 ?auto_912308 ) ) ( not ( = ?auto_912307 ?auto_912309 ) ) ( not ( = ?auto_912307 ?auto_912310 ) ) ( not ( = ?auto_912307 ?auto_912311 ) ) ( not ( = ?auto_912307 ?auto_912312 ) ) ( not ( = ?auto_912307 ?auto_912313 ) ) ( not ( = ?auto_912307 ?auto_912314 ) ) ( not ( = ?auto_912307 ?auto_912315 ) ) ( not ( = ?auto_912307 ?auto_912316 ) ) ( not ( = ?auto_912307 ?auto_912317 ) ) ( not ( = ?auto_912307 ?auto_912318 ) ) ( not ( = ?auto_912307 ?auto_912319 ) ) ( not ( = ?auto_912308 ?auto_912309 ) ) ( not ( = ?auto_912308 ?auto_912310 ) ) ( not ( = ?auto_912308 ?auto_912311 ) ) ( not ( = ?auto_912308 ?auto_912312 ) ) ( not ( = ?auto_912308 ?auto_912313 ) ) ( not ( = ?auto_912308 ?auto_912314 ) ) ( not ( = ?auto_912308 ?auto_912315 ) ) ( not ( = ?auto_912308 ?auto_912316 ) ) ( not ( = ?auto_912308 ?auto_912317 ) ) ( not ( = ?auto_912308 ?auto_912318 ) ) ( not ( = ?auto_912308 ?auto_912319 ) ) ( not ( = ?auto_912309 ?auto_912310 ) ) ( not ( = ?auto_912309 ?auto_912311 ) ) ( not ( = ?auto_912309 ?auto_912312 ) ) ( not ( = ?auto_912309 ?auto_912313 ) ) ( not ( = ?auto_912309 ?auto_912314 ) ) ( not ( = ?auto_912309 ?auto_912315 ) ) ( not ( = ?auto_912309 ?auto_912316 ) ) ( not ( = ?auto_912309 ?auto_912317 ) ) ( not ( = ?auto_912309 ?auto_912318 ) ) ( not ( = ?auto_912309 ?auto_912319 ) ) ( not ( = ?auto_912310 ?auto_912311 ) ) ( not ( = ?auto_912310 ?auto_912312 ) ) ( not ( = ?auto_912310 ?auto_912313 ) ) ( not ( = ?auto_912310 ?auto_912314 ) ) ( not ( = ?auto_912310 ?auto_912315 ) ) ( not ( = ?auto_912310 ?auto_912316 ) ) ( not ( = ?auto_912310 ?auto_912317 ) ) ( not ( = ?auto_912310 ?auto_912318 ) ) ( not ( = ?auto_912310 ?auto_912319 ) ) ( not ( = ?auto_912311 ?auto_912312 ) ) ( not ( = ?auto_912311 ?auto_912313 ) ) ( not ( = ?auto_912311 ?auto_912314 ) ) ( not ( = ?auto_912311 ?auto_912315 ) ) ( not ( = ?auto_912311 ?auto_912316 ) ) ( not ( = ?auto_912311 ?auto_912317 ) ) ( not ( = ?auto_912311 ?auto_912318 ) ) ( not ( = ?auto_912311 ?auto_912319 ) ) ( not ( = ?auto_912312 ?auto_912313 ) ) ( not ( = ?auto_912312 ?auto_912314 ) ) ( not ( = ?auto_912312 ?auto_912315 ) ) ( not ( = ?auto_912312 ?auto_912316 ) ) ( not ( = ?auto_912312 ?auto_912317 ) ) ( not ( = ?auto_912312 ?auto_912318 ) ) ( not ( = ?auto_912312 ?auto_912319 ) ) ( not ( = ?auto_912313 ?auto_912314 ) ) ( not ( = ?auto_912313 ?auto_912315 ) ) ( not ( = ?auto_912313 ?auto_912316 ) ) ( not ( = ?auto_912313 ?auto_912317 ) ) ( not ( = ?auto_912313 ?auto_912318 ) ) ( not ( = ?auto_912313 ?auto_912319 ) ) ( not ( = ?auto_912314 ?auto_912315 ) ) ( not ( = ?auto_912314 ?auto_912316 ) ) ( not ( = ?auto_912314 ?auto_912317 ) ) ( not ( = ?auto_912314 ?auto_912318 ) ) ( not ( = ?auto_912314 ?auto_912319 ) ) ( not ( = ?auto_912315 ?auto_912316 ) ) ( not ( = ?auto_912315 ?auto_912317 ) ) ( not ( = ?auto_912315 ?auto_912318 ) ) ( not ( = ?auto_912315 ?auto_912319 ) ) ( not ( = ?auto_912316 ?auto_912317 ) ) ( not ( = ?auto_912316 ?auto_912318 ) ) ( not ( = ?auto_912316 ?auto_912319 ) ) ( not ( = ?auto_912317 ?auto_912318 ) ) ( not ( = ?auto_912317 ?auto_912319 ) ) ( not ( = ?auto_912318 ?auto_912319 ) ) ( ON ?auto_912317 ?auto_912318 ) ( ON ?auto_912316 ?auto_912317 ) ( ON ?auto_912315 ?auto_912316 ) ( CLEAR ?auto_912313 ) ( ON ?auto_912314 ?auto_912315 ) ( CLEAR ?auto_912314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_912303 ?auto_912304 ?auto_912305 ?auto_912306 ?auto_912307 ?auto_912308 ?auto_912309 ?auto_912310 ?auto_912311 ?auto_912312 ?auto_912313 ?auto_912314 )
      ( MAKE-16PILE ?auto_912303 ?auto_912304 ?auto_912305 ?auto_912306 ?auto_912307 ?auto_912308 ?auto_912309 ?auto_912310 ?auto_912311 ?auto_912312 ?auto_912313 ?auto_912314 ?auto_912315 ?auto_912316 ?auto_912317 ?auto_912318 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912369 - BLOCK
      ?auto_912370 - BLOCK
      ?auto_912371 - BLOCK
      ?auto_912372 - BLOCK
      ?auto_912373 - BLOCK
      ?auto_912374 - BLOCK
      ?auto_912375 - BLOCK
      ?auto_912376 - BLOCK
      ?auto_912377 - BLOCK
      ?auto_912378 - BLOCK
      ?auto_912379 - BLOCK
      ?auto_912380 - BLOCK
      ?auto_912381 - BLOCK
      ?auto_912382 - BLOCK
      ?auto_912383 - BLOCK
      ?auto_912384 - BLOCK
    )
    :vars
    (
      ?auto_912385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912384 ?auto_912385 ) ( ON-TABLE ?auto_912369 ) ( ON ?auto_912370 ?auto_912369 ) ( ON ?auto_912371 ?auto_912370 ) ( ON ?auto_912372 ?auto_912371 ) ( ON ?auto_912373 ?auto_912372 ) ( ON ?auto_912374 ?auto_912373 ) ( ON ?auto_912375 ?auto_912374 ) ( ON ?auto_912376 ?auto_912375 ) ( ON ?auto_912377 ?auto_912376 ) ( ON ?auto_912378 ?auto_912377 ) ( not ( = ?auto_912369 ?auto_912370 ) ) ( not ( = ?auto_912369 ?auto_912371 ) ) ( not ( = ?auto_912369 ?auto_912372 ) ) ( not ( = ?auto_912369 ?auto_912373 ) ) ( not ( = ?auto_912369 ?auto_912374 ) ) ( not ( = ?auto_912369 ?auto_912375 ) ) ( not ( = ?auto_912369 ?auto_912376 ) ) ( not ( = ?auto_912369 ?auto_912377 ) ) ( not ( = ?auto_912369 ?auto_912378 ) ) ( not ( = ?auto_912369 ?auto_912379 ) ) ( not ( = ?auto_912369 ?auto_912380 ) ) ( not ( = ?auto_912369 ?auto_912381 ) ) ( not ( = ?auto_912369 ?auto_912382 ) ) ( not ( = ?auto_912369 ?auto_912383 ) ) ( not ( = ?auto_912369 ?auto_912384 ) ) ( not ( = ?auto_912369 ?auto_912385 ) ) ( not ( = ?auto_912370 ?auto_912371 ) ) ( not ( = ?auto_912370 ?auto_912372 ) ) ( not ( = ?auto_912370 ?auto_912373 ) ) ( not ( = ?auto_912370 ?auto_912374 ) ) ( not ( = ?auto_912370 ?auto_912375 ) ) ( not ( = ?auto_912370 ?auto_912376 ) ) ( not ( = ?auto_912370 ?auto_912377 ) ) ( not ( = ?auto_912370 ?auto_912378 ) ) ( not ( = ?auto_912370 ?auto_912379 ) ) ( not ( = ?auto_912370 ?auto_912380 ) ) ( not ( = ?auto_912370 ?auto_912381 ) ) ( not ( = ?auto_912370 ?auto_912382 ) ) ( not ( = ?auto_912370 ?auto_912383 ) ) ( not ( = ?auto_912370 ?auto_912384 ) ) ( not ( = ?auto_912370 ?auto_912385 ) ) ( not ( = ?auto_912371 ?auto_912372 ) ) ( not ( = ?auto_912371 ?auto_912373 ) ) ( not ( = ?auto_912371 ?auto_912374 ) ) ( not ( = ?auto_912371 ?auto_912375 ) ) ( not ( = ?auto_912371 ?auto_912376 ) ) ( not ( = ?auto_912371 ?auto_912377 ) ) ( not ( = ?auto_912371 ?auto_912378 ) ) ( not ( = ?auto_912371 ?auto_912379 ) ) ( not ( = ?auto_912371 ?auto_912380 ) ) ( not ( = ?auto_912371 ?auto_912381 ) ) ( not ( = ?auto_912371 ?auto_912382 ) ) ( not ( = ?auto_912371 ?auto_912383 ) ) ( not ( = ?auto_912371 ?auto_912384 ) ) ( not ( = ?auto_912371 ?auto_912385 ) ) ( not ( = ?auto_912372 ?auto_912373 ) ) ( not ( = ?auto_912372 ?auto_912374 ) ) ( not ( = ?auto_912372 ?auto_912375 ) ) ( not ( = ?auto_912372 ?auto_912376 ) ) ( not ( = ?auto_912372 ?auto_912377 ) ) ( not ( = ?auto_912372 ?auto_912378 ) ) ( not ( = ?auto_912372 ?auto_912379 ) ) ( not ( = ?auto_912372 ?auto_912380 ) ) ( not ( = ?auto_912372 ?auto_912381 ) ) ( not ( = ?auto_912372 ?auto_912382 ) ) ( not ( = ?auto_912372 ?auto_912383 ) ) ( not ( = ?auto_912372 ?auto_912384 ) ) ( not ( = ?auto_912372 ?auto_912385 ) ) ( not ( = ?auto_912373 ?auto_912374 ) ) ( not ( = ?auto_912373 ?auto_912375 ) ) ( not ( = ?auto_912373 ?auto_912376 ) ) ( not ( = ?auto_912373 ?auto_912377 ) ) ( not ( = ?auto_912373 ?auto_912378 ) ) ( not ( = ?auto_912373 ?auto_912379 ) ) ( not ( = ?auto_912373 ?auto_912380 ) ) ( not ( = ?auto_912373 ?auto_912381 ) ) ( not ( = ?auto_912373 ?auto_912382 ) ) ( not ( = ?auto_912373 ?auto_912383 ) ) ( not ( = ?auto_912373 ?auto_912384 ) ) ( not ( = ?auto_912373 ?auto_912385 ) ) ( not ( = ?auto_912374 ?auto_912375 ) ) ( not ( = ?auto_912374 ?auto_912376 ) ) ( not ( = ?auto_912374 ?auto_912377 ) ) ( not ( = ?auto_912374 ?auto_912378 ) ) ( not ( = ?auto_912374 ?auto_912379 ) ) ( not ( = ?auto_912374 ?auto_912380 ) ) ( not ( = ?auto_912374 ?auto_912381 ) ) ( not ( = ?auto_912374 ?auto_912382 ) ) ( not ( = ?auto_912374 ?auto_912383 ) ) ( not ( = ?auto_912374 ?auto_912384 ) ) ( not ( = ?auto_912374 ?auto_912385 ) ) ( not ( = ?auto_912375 ?auto_912376 ) ) ( not ( = ?auto_912375 ?auto_912377 ) ) ( not ( = ?auto_912375 ?auto_912378 ) ) ( not ( = ?auto_912375 ?auto_912379 ) ) ( not ( = ?auto_912375 ?auto_912380 ) ) ( not ( = ?auto_912375 ?auto_912381 ) ) ( not ( = ?auto_912375 ?auto_912382 ) ) ( not ( = ?auto_912375 ?auto_912383 ) ) ( not ( = ?auto_912375 ?auto_912384 ) ) ( not ( = ?auto_912375 ?auto_912385 ) ) ( not ( = ?auto_912376 ?auto_912377 ) ) ( not ( = ?auto_912376 ?auto_912378 ) ) ( not ( = ?auto_912376 ?auto_912379 ) ) ( not ( = ?auto_912376 ?auto_912380 ) ) ( not ( = ?auto_912376 ?auto_912381 ) ) ( not ( = ?auto_912376 ?auto_912382 ) ) ( not ( = ?auto_912376 ?auto_912383 ) ) ( not ( = ?auto_912376 ?auto_912384 ) ) ( not ( = ?auto_912376 ?auto_912385 ) ) ( not ( = ?auto_912377 ?auto_912378 ) ) ( not ( = ?auto_912377 ?auto_912379 ) ) ( not ( = ?auto_912377 ?auto_912380 ) ) ( not ( = ?auto_912377 ?auto_912381 ) ) ( not ( = ?auto_912377 ?auto_912382 ) ) ( not ( = ?auto_912377 ?auto_912383 ) ) ( not ( = ?auto_912377 ?auto_912384 ) ) ( not ( = ?auto_912377 ?auto_912385 ) ) ( not ( = ?auto_912378 ?auto_912379 ) ) ( not ( = ?auto_912378 ?auto_912380 ) ) ( not ( = ?auto_912378 ?auto_912381 ) ) ( not ( = ?auto_912378 ?auto_912382 ) ) ( not ( = ?auto_912378 ?auto_912383 ) ) ( not ( = ?auto_912378 ?auto_912384 ) ) ( not ( = ?auto_912378 ?auto_912385 ) ) ( not ( = ?auto_912379 ?auto_912380 ) ) ( not ( = ?auto_912379 ?auto_912381 ) ) ( not ( = ?auto_912379 ?auto_912382 ) ) ( not ( = ?auto_912379 ?auto_912383 ) ) ( not ( = ?auto_912379 ?auto_912384 ) ) ( not ( = ?auto_912379 ?auto_912385 ) ) ( not ( = ?auto_912380 ?auto_912381 ) ) ( not ( = ?auto_912380 ?auto_912382 ) ) ( not ( = ?auto_912380 ?auto_912383 ) ) ( not ( = ?auto_912380 ?auto_912384 ) ) ( not ( = ?auto_912380 ?auto_912385 ) ) ( not ( = ?auto_912381 ?auto_912382 ) ) ( not ( = ?auto_912381 ?auto_912383 ) ) ( not ( = ?auto_912381 ?auto_912384 ) ) ( not ( = ?auto_912381 ?auto_912385 ) ) ( not ( = ?auto_912382 ?auto_912383 ) ) ( not ( = ?auto_912382 ?auto_912384 ) ) ( not ( = ?auto_912382 ?auto_912385 ) ) ( not ( = ?auto_912383 ?auto_912384 ) ) ( not ( = ?auto_912383 ?auto_912385 ) ) ( not ( = ?auto_912384 ?auto_912385 ) ) ( ON ?auto_912383 ?auto_912384 ) ( ON ?auto_912382 ?auto_912383 ) ( ON ?auto_912381 ?auto_912382 ) ( ON ?auto_912380 ?auto_912381 ) ( CLEAR ?auto_912378 ) ( ON ?auto_912379 ?auto_912380 ) ( CLEAR ?auto_912379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_912369 ?auto_912370 ?auto_912371 ?auto_912372 ?auto_912373 ?auto_912374 ?auto_912375 ?auto_912376 ?auto_912377 ?auto_912378 ?auto_912379 )
      ( MAKE-16PILE ?auto_912369 ?auto_912370 ?auto_912371 ?auto_912372 ?auto_912373 ?auto_912374 ?auto_912375 ?auto_912376 ?auto_912377 ?auto_912378 ?auto_912379 ?auto_912380 ?auto_912381 ?auto_912382 ?auto_912383 ?auto_912384 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912435 - BLOCK
      ?auto_912436 - BLOCK
      ?auto_912437 - BLOCK
      ?auto_912438 - BLOCK
      ?auto_912439 - BLOCK
      ?auto_912440 - BLOCK
      ?auto_912441 - BLOCK
      ?auto_912442 - BLOCK
      ?auto_912443 - BLOCK
      ?auto_912444 - BLOCK
      ?auto_912445 - BLOCK
      ?auto_912446 - BLOCK
      ?auto_912447 - BLOCK
      ?auto_912448 - BLOCK
      ?auto_912449 - BLOCK
      ?auto_912450 - BLOCK
    )
    :vars
    (
      ?auto_912451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912450 ?auto_912451 ) ( ON-TABLE ?auto_912435 ) ( ON ?auto_912436 ?auto_912435 ) ( ON ?auto_912437 ?auto_912436 ) ( ON ?auto_912438 ?auto_912437 ) ( ON ?auto_912439 ?auto_912438 ) ( ON ?auto_912440 ?auto_912439 ) ( ON ?auto_912441 ?auto_912440 ) ( ON ?auto_912442 ?auto_912441 ) ( ON ?auto_912443 ?auto_912442 ) ( not ( = ?auto_912435 ?auto_912436 ) ) ( not ( = ?auto_912435 ?auto_912437 ) ) ( not ( = ?auto_912435 ?auto_912438 ) ) ( not ( = ?auto_912435 ?auto_912439 ) ) ( not ( = ?auto_912435 ?auto_912440 ) ) ( not ( = ?auto_912435 ?auto_912441 ) ) ( not ( = ?auto_912435 ?auto_912442 ) ) ( not ( = ?auto_912435 ?auto_912443 ) ) ( not ( = ?auto_912435 ?auto_912444 ) ) ( not ( = ?auto_912435 ?auto_912445 ) ) ( not ( = ?auto_912435 ?auto_912446 ) ) ( not ( = ?auto_912435 ?auto_912447 ) ) ( not ( = ?auto_912435 ?auto_912448 ) ) ( not ( = ?auto_912435 ?auto_912449 ) ) ( not ( = ?auto_912435 ?auto_912450 ) ) ( not ( = ?auto_912435 ?auto_912451 ) ) ( not ( = ?auto_912436 ?auto_912437 ) ) ( not ( = ?auto_912436 ?auto_912438 ) ) ( not ( = ?auto_912436 ?auto_912439 ) ) ( not ( = ?auto_912436 ?auto_912440 ) ) ( not ( = ?auto_912436 ?auto_912441 ) ) ( not ( = ?auto_912436 ?auto_912442 ) ) ( not ( = ?auto_912436 ?auto_912443 ) ) ( not ( = ?auto_912436 ?auto_912444 ) ) ( not ( = ?auto_912436 ?auto_912445 ) ) ( not ( = ?auto_912436 ?auto_912446 ) ) ( not ( = ?auto_912436 ?auto_912447 ) ) ( not ( = ?auto_912436 ?auto_912448 ) ) ( not ( = ?auto_912436 ?auto_912449 ) ) ( not ( = ?auto_912436 ?auto_912450 ) ) ( not ( = ?auto_912436 ?auto_912451 ) ) ( not ( = ?auto_912437 ?auto_912438 ) ) ( not ( = ?auto_912437 ?auto_912439 ) ) ( not ( = ?auto_912437 ?auto_912440 ) ) ( not ( = ?auto_912437 ?auto_912441 ) ) ( not ( = ?auto_912437 ?auto_912442 ) ) ( not ( = ?auto_912437 ?auto_912443 ) ) ( not ( = ?auto_912437 ?auto_912444 ) ) ( not ( = ?auto_912437 ?auto_912445 ) ) ( not ( = ?auto_912437 ?auto_912446 ) ) ( not ( = ?auto_912437 ?auto_912447 ) ) ( not ( = ?auto_912437 ?auto_912448 ) ) ( not ( = ?auto_912437 ?auto_912449 ) ) ( not ( = ?auto_912437 ?auto_912450 ) ) ( not ( = ?auto_912437 ?auto_912451 ) ) ( not ( = ?auto_912438 ?auto_912439 ) ) ( not ( = ?auto_912438 ?auto_912440 ) ) ( not ( = ?auto_912438 ?auto_912441 ) ) ( not ( = ?auto_912438 ?auto_912442 ) ) ( not ( = ?auto_912438 ?auto_912443 ) ) ( not ( = ?auto_912438 ?auto_912444 ) ) ( not ( = ?auto_912438 ?auto_912445 ) ) ( not ( = ?auto_912438 ?auto_912446 ) ) ( not ( = ?auto_912438 ?auto_912447 ) ) ( not ( = ?auto_912438 ?auto_912448 ) ) ( not ( = ?auto_912438 ?auto_912449 ) ) ( not ( = ?auto_912438 ?auto_912450 ) ) ( not ( = ?auto_912438 ?auto_912451 ) ) ( not ( = ?auto_912439 ?auto_912440 ) ) ( not ( = ?auto_912439 ?auto_912441 ) ) ( not ( = ?auto_912439 ?auto_912442 ) ) ( not ( = ?auto_912439 ?auto_912443 ) ) ( not ( = ?auto_912439 ?auto_912444 ) ) ( not ( = ?auto_912439 ?auto_912445 ) ) ( not ( = ?auto_912439 ?auto_912446 ) ) ( not ( = ?auto_912439 ?auto_912447 ) ) ( not ( = ?auto_912439 ?auto_912448 ) ) ( not ( = ?auto_912439 ?auto_912449 ) ) ( not ( = ?auto_912439 ?auto_912450 ) ) ( not ( = ?auto_912439 ?auto_912451 ) ) ( not ( = ?auto_912440 ?auto_912441 ) ) ( not ( = ?auto_912440 ?auto_912442 ) ) ( not ( = ?auto_912440 ?auto_912443 ) ) ( not ( = ?auto_912440 ?auto_912444 ) ) ( not ( = ?auto_912440 ?auto_912445 ) ) ( not ( = ?auto_912440 ?auto_912446 ) ) ( not ( = ?auto_912440 ?auto_912447 ) ) ( not ( = ?auto_912440 ?auto_912448 ) ) ( not ( = ?auto_912440 ?auto_912449 ) ) ( not ( = ?auto_912440 ?auto_912450 ) ) ( not ( = ?auto_912440 ?auto_912451 ) ) ( not ( = ?auto_912441 ?auto_912442 ) ) ( not ( = ?auto_912441 ?auto_912443 ) ) ( not ( = ?auto_912441 ?auto_912444 ) ) ( not ( = ?auto_912441 ?auto_912445 ) ) ( not ( = ?auto_912441 ?auto_912446 ) ) ( not ( = ?auto_912441 ?auto_912447 ) ) ( not ( = ?auto_912441 ?auto_912448 ) ) ( not ( = ?auto_912441 ?auto_912449 ) ) ( not ( = ?auto_912441 ?auto_912450 ) ) ( not ( = ?auto_912441 ?auto_912451 ) ) ( not ( = ?auto_912442 ?auto_912443 ) ) ( not ( = ?auto_912442 ?auto_912444 ) ) ( not ( = ?auto_912442 ?auto_912445 ) ) ( not ( = ?auto_912442 ?auto_912446 ) ) ( not ( = ?auto_912442 ?auto_912447 ) ) ( not ( = ?auto_912442 ?auto_912448 ) ) ( not ( = ?auto_912442 ?auto_912449 ) ) ( not ( = ?auto_912442 ?auto_912450 ) ) ( not ( = ?auto_912442 ?auto_912451 ) ) ( not ( = ?auto_912443 ?auto_912444 ) ) ( not ( = ?auto_912443 ?auto_912445 ) ) ( not ( = ?auto_912443 ?auto_912446 ) ) ( not ( = ?auto_912443 ?auto_912447 ) ) ( not ( = ?auto_912443 ?auto_912448 ) ) ( not ( = ?auto_912443 ?auto_912449 ) ) ( not ( = ?auto_912443 ?auto_912450 ) ) ( not ( = ?auto_912443 ?auto_912451 ) ) ( not ( = ?auto_912444 ?auto_912445 ) ) ( not ( = ?auto_912444 ?auto_912446 ) ) ( not ( = ?auto_912444 ?auto_912447 ) ) ( not ( = ?auto_912444 ?auto_912448 ) ) ( not ( = ?auto_912444 ?auto_912449 ) ) ( not ( = ?auto_912444 ?auto_912450 ) ) ( not ( = ?auto_912444 ?auto_912451 ) ) ( not ( = ?auto_912445 ?auto_912446 ) ) ( not ( = ?auto_912445 ?auto_912447 ) ) ( not ( = ?auto_912445 ?auto_912448 ) ) ( not ( = ?auto_912445 ?auto_912449 ) ) ( not ( = ?auto_912445 ?auto_912450 ) ) ( not ( = ?auto_912445 ?auto_912451 ) ) ( not ( = ?auto_912446 ?auto_912447 ) ) ( not ( = ?auto_912446 ?auto_912448 ) ) ( not ( = ?auto_912446 ?auto_912449 ) ) ( not ( = ?auto_912446 ?auto_912450 ) ) ( not ( = ?auto_912446 ?auto_912451 ) ) ( not ( = ?auto_912447 ?auto_912448 ) ) ( not ( = ?auto_912447 ?auto_912449 ) ) ( not ( = ?auto_912447 ?auto_912450 ) ) ( not ( = ?auto_912447 ?auto_912451 ) ) ( not ( = ?auto_912448 ?auto_912449 ) ) ( not ( = ?auto_912448 ?auto_912450 ) ) ( not ( = ?auto_912448 ?auto_912451 ) ) ( not ( = ?auto_912449 ?auto_912450 ) ) ( not ( = ?auto_912449 ?auto_912451 ) ) ( not ( = ?auto_912450 ?auto_912451 ) ) ( ON ?auto_912449 ?auto_912450 ) ( ON ?auto_912448 ?auto_912449 ) ( ON ?auto_912447 ?auto_912448 ) ( ON ?auto_912446 ?auto_912447 ) ( ON ?auto_912445 ?auto_912446 ) ( CLEAR ?auto_912443 ) ( ON ?auto_912444 ?auto_912445 ) ( CLEAR ?auto_912444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_912435 ?auto_912436 ?auto_912437 ?auto_912438 ?auto_912439 ?auto_912440 ?auto_912441 ?auto_912442 ?auto_912443 ?auto_912444 )
      ( MAKE-16PILE ?auto_912435 ?auto_912436 ?auto_912437 ?auto_912438 ?auto_912439 ?auto_912440 ?auto_912441 ?auto_912442 ?auto_912443 ?auto_912444 ?auto_912445 ?auto_912446 ?auto_912447 ?auto_912448 ?auto_912449 ?auto_912450 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912501 - BLOCK
      ?auto_912502 - BLOCK
      ?auto_912503 - BLOCK
      ?auto_912504 - BLOCK
      ?auto_912505 - BLOCK
      ?auto_912506 - BLOCK
      ?auto_912507 - BLOCK
      ?auto_912508 - BLOCK
      ?auto_912509 - BLOCK
      ?auto_912510 - BLOCK
      ?auto_912511 - BLOCK
      ?auto_912512 - BLOCK
      ?auto_912513 - BLOCK
      ?auto_912514 - BLOCK
      ?auto_912515 - BLOCK
      ?auto_912516 - BLOCK
    )
    :vars
    (
      ?auto_912517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912516 ?auto_912517 ) ( ON-TABLE ?auto_912501 ) ( ON ?auto_912502 ?auto_912501 ) ( ON ?auto_912503 ?auto_912502 ) ( ON ?auto_912504 ?auto_912503 ) ( ON ?auto_912505 ?auto_912504 ) ( ON ?auto_912506 ?auto_912505 ) ( ON ?auto_912507 ?auto_912506 ) ( ON ?auto_912508 ?auto_912507 ) ( not ( = ?auto_912501 ?auto_912502 ) ) ( not ( = ?auto_912501 ?auto_912503 ) ) ( not ( = ?auto_912501 ?auto_912504 ) ) ( not ( = ?auto_912501 ?auto_912505 ) ) ( not ( = ?auto_912501 ?auto_912506 ) ) ( not ( = ?auto_912501 ?auto_912507 ) ) ( not ( = ?auto_912501 ?auto_912508 ) ) ( not ( = ?auto_912501 ?auto_912509 ) ) ( not ( = ?auto_912501 ?auto_912510 ) ) ( not ( = ?auto_912501 ?auto_912511 ) ) ( not ( = ?auto_912501 ?auto_912512 ) ) ( not ( = ?auto_912501 ?auto_912513 ) ) ( not ( = ?auto_912501 ?auto_912514 ) ) ( not ( = ?auto_912501 ?auto_912515 ) ) ( not ( = ?auto_912501 ?auto_912516 ) ) ( not ( = ?auto_912501 ?auto_912517 ) ) ( not ( = ?auto_912502 ?auto_912503 ) ) ( not ( = ?auto_912502 ?auto_912504 ) ) ( not ( = ?auto_912502 ?auto_912505 ) ) ( not ( = ?auto_912502 ?auto_912506 ) ) ( not ( = ?auto_912502 ?auto_912507 ) ) ( not ( = ?auto_912502 ?auto_912508 ) ) ( not ( = ?auto_912502 ?auto_912509 ) ) ( not ( = ?auto_912502 ?auto_912510 ) ) ( not ( = ?auto_912502 ?auto_912511 ) ) ( not ( = ?auto_912502 ?auto_912512 ) ) ( not ( = ?auto_912502 ?auto_912513 ) ) ( not ( = ?auto_912502 ?auto_912514 ) ) ( not ( = ?auto_912502 ?auto_912515 ) ) ( not ( = ?auto_912502 ?auto_912516 ) ) ( not ( = ?auto_912502 ?auto_912517 ) ) ( not ( = ?auto_912503 ?auto_912504 ) ) ( not ( = ?auto_912503 ?auto_912505 ) ) ( not ( = ?auto_912503 ?auto_912506 ) ) ( not ( = ?auto_912503 ?auto_912507 ) ) ( not ( = ?auto_912503 ?auto_912508 ) ) ( not ( = ?auto_912503 ?auto_912509 ) ) ( not ( = ?auto_912503 ?auto_912510 ) ) ( not ( = ?auto_912503 ?auto_912511 ) ) ( not ( = ?auto_912503 ?auto_912512 ) ) ( not ( = ?auto_912503 ?auto_912513 ) ) ( not ( = ?auto_912503 ?auto_912514 ) ) ( not ( = ?auto_912503 ?auto_912515 ) ) ( not ( = ?auto_912503 ?auto_912516 ) ) ( not ( = ?auto_912503 ?auto_912517 ) ) ( not ( = ?auto_912504 ?auto_912505 ) ) ( not ( = ?auto_912504 ?auto_912506 ) ) ( not ( = ?auto_912504 ?auto_912507 ) ) ( not ( = ?auto_912504 ?auto_912508 ) ) ( not ( = ?auto_912504 ?auto_912509 ) ) ( not ( = ?auto_912504 ?auto_912510 ) ) ( not ( = ?auto_912504 ?auto_912511 ) ) ( not ( = ?auto_912504 ?auto_912512 ) ) ( not ( = ?auto_912504 ?auto_912513 ) ) ( not ( = ?auto_912504 ?auto_912514 ) ) ( not ( = ?auto_912504 ?auto_912515 ) ) ( not ( = ?auto_912504 ?auto_912516 ) ) ( not ( = ?auto_912504 ?auto_912517 ) ) ( not ( = ?auto_912505 ?auto_912506 ) ) ( not ( = ?auto_912505 ?auto_912507 ) ) ( not ( = ?auto_912505 ?auto_912508 ) ) ( not ( = ?auto_912505 ?auto_912509 ) ) ( not ( = ?auto_912505 ?auto_912510 ) ) ( not ( = ?auto_912505 ?auto_912511 ) ) ( not ( = ?auto_912505 ?auto_912512 ) ) ( not ( = ?auto_912505 ?auto_912513 ) ) ( not ( = ?auto_912505 ?auto_912514 ) ) ( not ( = ?auto_912505 ?auto_912515 ) ) ( not ( = ?auto_912505 ?auto_912516 ) ) ( not ( = ?auto_912505 ?auto_912517 ) ) ( not ( = ?auto_912506 ?auto_912507 ) ) ( not ( = ?auto_912506 ?auto_912508 ) ) ( not ( = ?auto_912506 ?auto_912509 ) ) ( not ( = ?auto_912506 ?auto_912510 ) ) ( not ( = ?auto_912506 ?auto_912511 ) ) ( not ( = ?auto_912506 ?auto_912512 ) ) ( not ( = ?auto_912506 ?auto_912513 ) ) ( not ( = ?auto_912506 ?auto_912514 ) ) ( not ( = ?auto_912506 ?auto_912515 ) ) ( not ( = ?auto_912506 ?auto_912516 ) ) ( not ( = ?auto_912506 ?auto_912517 ) ) ( not ( = ?auto_912507 ?auto_912508 ) ) ( not ( = ?auto_912507 ?auto_912509 ) ) ( not ( = ?auto_912507 ?auto_912510 ) ) ( not ( = ?auto_912507 ?auto_912511 ) ) ( not ( = ?auto_912507 ?auto_912512 ) ) ( not ( = ?auto_912507 ?auto_912513 ) ) ( not ( = ?auto_912507 ?auto_912514 ) ) ( not ( = ?auto_912507 ?auto_912515 ) ) ( not ( = ?auto_912507 ?auto_912516 ) ) ( not ( = ?auto_912507 ?auto_912517 ) ) ( not ( = ?auto_912508 ?auto_912509 ) ) ( not ( = ?auto_912508 ?auto_912510 ) ) ( not ( = ?auto_912508 ?auto_912511 ) ) ( not ( = ?auto_912508 ?auto_912512 ) ) ( not ( = ?auto_912508 ?auto_912513 ) ) ( not ( = ?auto_912508 ?auto_912514 ) ) ( not ( = ?auto_912508 ?auto_912515 ) ) ( not ( = ?auto_912508 ?auto_912516 ) ) ( not ( = ?auto_912508 ?auto_912517 ) ) ( not ( = ?auto_912509 ?auto_912510 ) ) ( not ( = ?auto_912509 ?auto_912511 ) ) ( not ( = ?auto_912509 ?auto_912512 ) ) ( not ( = ?auto_912509 ?auto_912513 ) ) ( not ( = ?auto_912509 ?auto_912514 ) ) ( not ( = ?auto_912509 ?auto_912515 ) ) ( not ( = ?auto_912509 ?auto_912516 ) ) ( not ( = ?auto_912509 ?auto_912517 ) ) ( not ( = ?auto_912510 ?auto_912511 ) ) ( not ( = ?auto_912510 ?auto_912512 ) ) ( not ( = ?auto_912510 ?auto_912513 ) ) ( not ( = ?auto_912510 ?auto_912514 ) ) ( not ( = ?auto_912510 ?auto_912515 ) ) ( not ( = ?auto_912510 ?auto_912516 ) ) ( not ( = ?auto_912510 ?auto_912517 ) ) ( not ( = ?auto_912511 ?auto_912512 ) ) ( not ( = ?auto_912511 ?auto_912513 ) ) ( not ( = ?auto_912511 ?auto_912514 ) ) ( not ( = ?auto_912511 ?auto_912515 ) ) ( not ( = ?auto_912511 ?auto_912516 ) ) ( not ( = ?auto_912511 ?auto_912517 ) ) ( not ( = ?auto_912512 ?auto_912513 ) ) ( not ( = ?auto_912512 ?auto_912514 ) ) ( not ( = ?auto_912512 ?auto_912515 ) ) ( not ( = ?auto_912512 ?auto_912516 ) ) ( not ( = ?auto_912512 ?auto_912517 ) ) ( not ( = ?auto_912513 ?auto_912514 ) ) ( not ( = ?auto_912513 ?auto_912515 ) ) ( not ( = ?auto_912513 ?auto_912516 ) ) ( not ( = ?auto_912513 ?auto_912517 ) ) ( not ( = ?auto_912514 ?auto_912515 ) ) ( not ( = ?auto_912514 ?auto_912516 ) ) ( not ( = ?auto_912514 ?auto_912517 ) ) ( not ( = ?auto_912515 ?auto_912516 ) ) ( not ( = ?auto_912515 ?auto_912517 ) ) ( not ( = ?auto_912516 ?auto_912517 ) ) ( ON ?auto_912515 ?auto_912516 ) ( ON ?auto_912514 ?auto_912515 ) ( ON ?auto_912513 ?auto_912514 ) ( ON ?auto_912512 ?auto_912513 ) ( ON ?auto_912511 ?auto_912512 ) ( ON ?auto_912510 ?auto_912511 ) ( CLEAR ?auto_912508 ) ( ON ?auto_912509 ?auto_912510 ) ( CLEAR ?auto_912509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_912501 ?auto_912502 ?auto_912503 ?auto_912504 ?auto_912505 ?auto_912506 ?auto_912507 ?auto_912508 ?auto_912509 )
      ( MAKE-16PILE ?auto_912501 ?auto_912502 ?auto_912503 ?auto_912504 ?auto_912505 ?auto_912506 ?auto_912507 ?auto_912508 ?auto_912509 ?auto_912510 ?auto_912511 ?auto_912512 ?auto_912513 ?auto_912514 ?auto_912515 ?auto_912516 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912567 - BLOCK
      ?auto_912568 - BLOCK
      ?auto_912569 - BLOCK
      ?auto_912570 - BLOCK
      ?auto_912571 - BLOCK
      ?auto_912572 - BLOCK
      ?auto_912573 - BLOCK
      ?auto_912574 - BLOCK
      ?auto_912575 - BLOCK
      ?auto_912576 - BLOCK
      ?auto_912577 - BLOCK
      ?auto_912578 - BLOCK
      ?auto_912579 - BLOCK
      ?auto_912580 - BLOCK
      ?auto_912581 - BLOCK
      ?auto_912582 - BLOCK
    )
    :vars
    (
      ?auto_912583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912582 ?auto_912583 ) ( ON-TABLE ?auto_912567 ) ( ON ?auto_912568 ?auto_912567 ) ( ON ?auto_912569 ?auto_912568 ) ( ON ?auto_912570 ?auto_912569 ) ( ON ?auto_912571 ?auto_912570 ) ( ON ?auto_912572 ?auto_912571 ) ( ON ?auto_912573 ?auto_912572 ) ( not ( = ?auto_912567 ?auto_912568 ) ) ( not ( = ?auto_912567 ?auto_912569 ) ) ( not ( = ?auto_912567 ?auto_912570 ) ) ( not ( = ?auto_912567 ?auto_912571 ) ) ( not ( = ?auto_912567 ?auto_912572 ) ) ( not ( = ?auto_912567 ?auto_912573 ) ) ( not ( = ?auto_912567 ?auto_912574 ) ) ( not ( = ?auto_912567 ?auto_912575 ) ) ( not ( = ?auto_912567 ?auto_912576 ) ) ( not ( = ?auto_912567 ?auto_912577 ) ) ( not ( = ?auto_912567 ?auto_912578 ) ) ( not ( = ?auto_912567 ?auto_912579 ) ) ( not ( = ?auto_912567 ?auto_912580 ) ) ( not ( = ?auto_912567 ?auto_912581 ) ) ( not ( = ?auto_912567 ?auto_912582 ) ) ( not ( = ?auto_912567 ?auto_912583 ) ) ( not ( = ?auto_912568 ?auto_912569 ) ) ( not ( = ?auto_912568 ?auto_912570 ) ) ( not ( = ?auto_912568 ?auto_912571 ) ) ( not ( = ?auto_912568 ?auto_912572 ) ) ( not ( = ?auto_912568 ?auto_912573 ) ) ( not ( = ?auto_912568 ?auto_912574 ) ) ( not ( = ?auto_912568 ?auto_912575 ) ) ( not ( = ?auto_912568 ?auto_912576 ) ) ( not ( = ?auto_912568 ?auto_912577 ) ) ( not ( = ?auto_912568 ?auto_912578 ) ) ( not ( = ?auto_912568 ?auto_912579 ) ) ( not ( = ?auto_912568 ?auto_912580 ) ) ( not ( = ?auto_912568 ?auto_912581 ) ) ( not ( = ?auto_912568 ?auto_912582 ) ) ( not ( = ?auto_912568 ?auto_912583 ) ) ( not ( = ?auto_912569 ?auto_912570 ) ) ( not ( = ?auto_912569 ?auto_912571 ) ) ( not ( = ?auto_912569 ?auto_912572 ) ) ( not ( = ?auto_912569 ?auto_912573 ) ) ( not ( = ?auto_912569 ?auto_912574 ) ) ( not ( = ?auto_912569 ?auto_912575 ) ) ( not ( = ?auto_912569 ?auto_912576 ) ) ( not ( = ?auto_912569 ?auto_912577 ) ) ( not ( = ?auto_912569 ?auto_912578 ) ) ( not ( = ?auto_912569 ?auto_912579 ) ) ( not ( = ?auto_912569 ?auto_912580 ) ) ( not ( = ?auto_912569 ?auto_912581 ) ) ( not ( = ?auto_912569 ?auto_912582 ) ) ( not ( = ?auto_912569 ?auto_912583 ) ) ( not ( = ?auto_912570 ?auto_912571 ) ) ( not ( = ?auto_912570 ?auto_912572 ) ) ( not ( = ?auto_912570 ?auto_912573 ) ) ( not ( = ?auto_912570 ?auto_912574 ) ) ( not ( = ?auto_912570 ?auto_912575 ) ) ( not ( = ?auto_912570 ?auto_912576 ) ) ( not ( = ?auto_912570 ?auto_912577 ) ) ( not ( = ?auto_912570 ?auto_912578 ) ) ( not ( = ?auto_912570 ?auto_912579 ) ) ( not ( = ?auto_912570 ?auto_912580 ) ) ( not ( = ?auto_912570 ?auto_912581 ) ) ( not ( = ?auto_912570 ?auto_912582 ) ) ( not ( = ?auto_912570 ?auto_912583 ) ) ( not ( = ?auto_912571 ?auto_912572 ) ) ( not ( = ?auto_912571 ?auto_912573 ) ) ( not ( = ?auto_912571 ?auto_912574 ) ) ( not ( = ?auto_912571 ?auto_912575 ) ) ( not ( = ?auto_912571 ?auto_912576 ) ) ( not ( = ?auto_912571 ?auto_912577 ) ) ( not ( = ?auto_912571 ?auto_912578 ) ) ( not ( = ?auto_912571 ?auto_912579 ) ) ( not ( = ?auto_912571 ?auto_912580 ) ) ( not ( = ?auto_912571 ?auto_912581 ) ) ( not ( = ?auto_912571 ?auto_912582 ) ) ( not ( = ?auto_912571 ?auto_912583 ) ) ( not ( = ?auto_912572 ?auto_912573 ) ) ( not ( = ?auto_912572 ?auto_912574 ) ) ( not ( = ?auto_912572 ?auto_912575 ) ) ( not ( = ?auto_912572 ?auto_912576 ) ) ( not ( = ?auto_912572 ?auto_912577 ) ) ( not ( = ?auto_912572 ?auto_912578 ) ) ( not ( = ?auto_912572 ?auto_912579 ) ) ( not ( = ?auto_912572 ?auto_912580 ) ) ( not ( = ?auto_912572 ?auto_912581 ) ) ( not ( = ?auto_912572 ?auto_912582 ) ) ( not ( = ?auto_912572 ?auto_912583 ) ) ( not ( = ?auto_912573 ?auto_912574 ) ) ( not ( = ?auto_912573 ?auto_912575 ) ) ( not ( = ?auto_912573 ?auto_912576 ) ) ( not ( = ?auto_912573 ?auto_912577 ) ) ( not ( = ?auto_912573 ?auto_912578 ) ) ( not ( = ?auto_912573 ?auto_912579 ) ) ( not ( = ?auto_912573 ?auto_912580 ) ) ( not ( = ?auto_912573 ?auto_912581 ) ) ( not ( = ?auto_912573 ?auto_912582 ) ) ( not ( = ?auto_912573 ?auto_912583 ) ) ( not ( = ?auto_912574 ?auto_912575 ) ) ( not ( = ?auto_912574 ?auto_912576 ) ) ( not ( = ?auto_912574 ?auto_912577 ) ) ( not ( = ?auto_912574 ?auto_912578 ) ) ( not ( = ?auto_912574 ?auto_912579 ) ) ( not ( = ?auto_912574 ?auto_912580 ) ) ( not ( = ?auto_912574 ?auto_912581 ) ) ( not ( = ?auto_912574 ?auto_912582 ) ) ( not ( = ?auto_912574 ?auto_912583 ) ) ( not ( = ?auto_912575 ?auto_912576 ) ) ( not ( = ?auto_912575 ?auto_912577 ) ) ( not ( = ?auto_912575 ?auto_912578 ) ) ( not ( = ?auto_912575 ?auto_912579 ) ) ( not ( = ?auto_912575 ?auto_912580 ) ) ( not ( = ?auto_912575 ?auto_912581 ) ) ( not ( = ?auto_912575 ?auto_912582 ) ) ( not ( = ?auto_912575 ?auto_912583 ) ) ( not ( = ?auto_912576 ?auto_912577 ) ) ( not ( = ?auto_912576 ?auto_912578 ) ) ( not ( = ?auto_912576 ?auto_912579 ) ) ( not ( = ?auto_912576 ?auto_912580 ) ) ( not ( = ?auto_912576 ?auto_912581 ) ) ( not ( = ?auto_912576 ?auto_912582 ) ) ( not ( = ?auto_912576 ?auto_912583 ) ) ( not ( = ?auto_912577 ?auto_912578 ) ) ( not ( = ?auto_912577 ?auto_912579 ) ) ( not ( = ?auto_912577 ?auto_912580 ) ) ( not ( = ?auto_912577 ?auto_912581 ) ) ( not ( = ?auto_912577 ?auto_912582 ) ) ( not ( = ?auto_912577 ?auto_912583 ) ) ( not ( = ?auto_912578 ?auto_912579 ) ) ( not ( = ?auto_912578 ?auto_912580 ) ) ( not ( = ?auto_912578 ?auto_912581 ) ) ( not ( = ?auto_912578 ?auto_912582 ) ) ( not ( = ?auto_912578 ?auto_912583 ) ) ( not ( = ?auto_912579 ?auto_912580 ) ) ( not ( = ?auto_912579 ?auto_912581 ) ) ( not ( = ?auto_912579 ?auto_912582 ) ) ( not ( = ?auto_912579 ?auto_912583 ) ) ( not ( = ?auto_912580 ?auto_912581 ) ) ( not ( = ?auto_912580 ?auto_912582 ) ) ( not ( = ?auto_912580 ?auto_912583 ) ) ( not ( = ?auto_912581 ?auto_912582 ) ) ( not ( = ?auto_912581 ?auto_912583 ) ) ( not ( = ?auto_912582 ?auto_912583 ) ) ( ON ?auto_912581 ?auto_912582 ) ( ON ?auto_912580 ?auto_912581 ) ( ON ?auto_912579 ?auto_912580 ) ( ON ?auto_912578 ?auto_912579 ) ( ON ?auto_912577 ?auto_912578 ) ( ON ?auto_912576 ?auto_912577 ) ( ON ?auto_912575 ?auto_912576 ) ( CLEAR ?auto_912573 ) ( ON ?auto_912574 ?auto_912575 ) ( CLEAR ?auto_912574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_912567 ?auto_912568 ?auto_912569 ?auto_912570 ?auto_912571 ?auto_912572 ?auto_912573 ?auto_912574 )
      ( MAKE-16PILE ?auto_912567 ?auto_912568 ?auto_912569 ?auto_912570 ?auto_912571 ?auto_912572 ?auto_912573 ?auto_912574 ?auto_912575 ?auto_912576 ?auto_912577 ?auto_912578 ?auto_912579 ?auto_912580 ?auto_912581 ?auto_912582 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912633 - BLOCK
      ?auto_912634 - BLOCK
      ?auto_912635 - BLOCK
      ?auto_912636 - BLOCK
      ?auto_912637 - BLOCK
      ?auto_912638 - BLOCK
      ?auto_912639 - BLOCK
      ?auto_912640 - BLOCK
      ?auto_912641 - BLOCK
      ?auto_912642 - BLOCK
      ?auto_912643 - BLOCK
      ?auto_912644 - BLOCK
      ?auto_912645 - BLOCK
      ?auto_912646 - BLOCK
      ?auto_912647 - BLOCK
      ?auto_912648 - BLOCK
    )
    :vars
    (
      ?auto_912649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912648 ?auto_912649 ) ( ON-TABLE ?auto_912633 ) ( ON ?auto_912634 ?auto_912633 ) ( ON ?auto_912635 ?auto_912634 ) ( ON ?auto_912636 ?auto_912635 ) ( ON ?auto_912637 ?auto_912636 ) ( ON ?auto_912638 ?auto_912637 ) ( not ( = ?auto_912633 ?auto_912634 ) ) ( not ( = ?auto_912633 ?auto_912635 ) ) ( not ( = ?auto_912633 ?auto_912636 ) ) ( not ( = ?auto_912633 ?auto_912637 ) ) ( not ( = ?auto_912633 ?auto_912638 ) ) ( not ( = ?auto_912633 ?auto_912639 ) ) ( not ( = ?auto_912633 ?auto_912640 ) ) ( not ( = ?auto_912633 ?auto_912641 ) ) ( not ( = ?auto_912633 ?auto_912642 ) ) ( not ( = ?auto_912633 ?auto_912643 ) ) ( not ( = ?auto_912633 ?auto_912644 ) ) ( not ( = ?auto_912633 ?auto_912645 ) ) ( not ( = ?auto_912633 ?auto_912646 ) ) ( not ( = ?auto_912633 ?auto_912647 ) ) ( not ( = ?auto_912633 ?auto_912648 ) ) ( not ( = ?auto_912633 ?auto_912649 ) ) ( not ( = ?auto_912634 ?auto_912635 ) ) ( not ( = ?auto_912634 ?auto_912636 ) ) ( not ( = ?auto_912634 ?auto_912637 ) ) ( not ( = ?auto_912634 ?auto_912638 ) ) ( not ( = ?auto_912634 ?auto_912639 ) ) ( not ( = ?auto_912634 ?auto_912640 ) ) ( not ( = ?auto_912634 ?auto_912641 ) ) ( not ( = ?auto_912634 ?auto_912642 ) ) ( not ( = ?auto_912634 ?auto_912643 ) ) ( not ( = ?auto_912634 ?auto_912644 ) ) ( not ( = ?auto_912634 ?auto_912645 ) ) ( not ( = ?auto_912634 ?auto_912646 ) ) ( not ( = ?auto_912634 ?auto_912647 ) ) ( not ( = ?auto_912634 ?auto_912648 ) ) ( not ( = ?auto_912634 ?auto_912649 ) ) ( not ( = ?auto_912635 ?auto_912636 ) ) ( not ( = ?auto_912635 ?auto_912637 ) ) ( not ( = ?auto_912635 ?auto_912638 ) ) ( not ( = ?auto_912635 ?auto_912639 ) ) ( not ( = ?auto_912635 ?auto_912640 ) ) ( not ( = ?auto_912635 ?auto_912641 ) ) ( not ( = ?auto_912635 ?auto_912642 ) ) ( not ( = ?auto_912635 ?auto_912643 ) ) ( not ( = ?auto_912635 ?auto_912644 ) ) ( not ( = ?auto_912635 ?auto_912645 ) ) ( not ( = ?auto_912635 ?auto_912646 ) ) ( not ( = ?auto_912635 ?auto_912647 ) ) ( not ( = ?auto_912635 ?auto_912648 ) ) ( not ( = ?auto_912635 ?auto_912649 ) ) ( not ( = ?auto_912636 ?auto_912637 ) ) ( not ( = ?auto_912636 ?auto_912638 ) ) ( not ( = ?auto_912636 ?auto_912639 ) ) ( not ( = ?auto_912636 ?auto_912640 ) ) ( not ( = ?auto_912636 ?auto_912641 ) ) ( not ( = ?auto_912636 ?auto_912642 ) ) ( not ( = ?auto_912636 ?auto_912643 ) ) ( not ( = ?auto_912636 ?auto_912644 ) ) ( not ( = ?auto_912636 ?auto_912645 ) ) ( not ( = ?auto_912636 ?auto_912646 ) ) ( not ( = ?auto_912636 ?auto_912647 ) ) ( not ( = ?auto_912636 ?auto_912648 ) ) ( not ( = ?auto_912636 ?auto_912649 ) ) ( not ( = ?auto_912637 ?auto_912638 ) ) ( not ( = ?auto_912637 ?auto_912639 ) ) ( not ( = ?auto_912637 ?auto_912640 ) ) ( not ( = ?auto_912637 ?auto_912641 ) ) ( not ( = ?auto_912637 ?auto_912642 ) ) ( not ( = ?auto_912637 ?auto_912643 ) ) ( not ( = ?auto_912637 ?auto_912644 ) ) ( not ( = ?auto_912637 ?auto_912645 ) ) ( not ( = ?auto_912637 ?auto_912646 ) ) ( not ( = ?auto_912637 ?auto_912647 ) ) ( not ( = ?auto_912637 ?auto_912648 ) ) ( not ( = ?auto_912637 ?auto_912649 ) ) ( not ( = ?auto_912638 ?auto_912639 ) ) ( not ( = ?auto_912638 ?auto_912640 ) ) ( not ( = ?auto_912638 ?auto_912641 ) ) ( not ( = ?auto_912638 ?auto_912642 ) ) ( not ( = ?auto_912638 ?auto_912643 ) ) ( not ( = ?auto_912638 ?auto_912644 ) ) ( not ( = ?auto_912638 ?auto_912645 ) ) ( not ( = ?auto_912638 ?auto_912646 ) ) ( not ( = ?auto_912638 ?auto_912647 ) ) ( not ( = ?auto_912638 ?auto_912648 ) ) ( not ( = ?auto_912638 ?auto_912649 ) ) ( not ( = ?auto_912639 ?auto_912640 ) ) ( not ( = ?auto_912639 ?auto_912641 ) ) ( not ( = ?auto_912639 ?auto_912642 ) ) ( not ( = ?auto_912639 ?auto_912643 ) ) ( not ( = ?auto_912639 ?auto_912644 ) ) ( not ( = ?auto_912639 ?auto_912645 ) ) ( not ( = ?auto_912639 ?auto_912646 ) ) ( not ( = ?auto_912639 ?auto_912647 ) ) ( not ( = ?auto_912639 ?auto_912648 ) ) ( not ( = ?auto_912639 ?auto_912649 ) ) ( not ( = ?auto_912640 ?auto_912641 ) ) ( not ( = ?auto_912640 ?auto_912642 ) ) ( not ( = ?auto_912640 ?auto_912643 ) ) ( not ( = ?auto_912640 ?auto_912644 ) ) ( not ( = ?auto_912640 ?auto_912645 ) ) ( not ( = ?auto_912640 ?auto_912646 ) ) ( not ( = ?auto_912640 ?auto_912647 ) ) ( not ( = ?auto_912640 ?auto_912648 ) ) ( not ( = ?auto_912640 ?auto_912649 ) ) ( not ( = ?auto_912641 ?auto_912642 ) ) ( not ( = ?auto_912641 ?auto_912643 ) ) ( not ( = ?auto_912641 ?auto_912644 ) ) ( not ( = ?auto_912641 ?auto_912645 ) ) ( not ( = ?auto_912641 ?auto_912646 ) ) ( not ( = ?auto_912641 ?auto_912647 ) ) ( not ( = ?auto_912641 ?auto_912648 ) ) ( not ( = ?auto_912641 ?auto_912649 ) ) ( not ( = ?auto_912642 ?auto_912643 ) ) ( not ( = ?auto_912642 ?auto_912644 ) ) ( not ( = ?auto_912642 ?auto_912645 ) ) ( not ( = ?auto_912642 ?auto_912646 ) ) ( not ( = ?auto_912642 ?auto_912647 ) ) ( not ( = ?auto_912642 ?auto_912648 ) ) ( not ( = ?auto_912642 ?auto_912649 ) ) ( not ( = ?auto_912643 ?auto_912644 ) ) ( not ( = ?auto_912643 ?auto_912645 ) ) ( not ( = ?auto_912643 ?auto_912646 ) ) ( not ( = ?auto_912643 ?auto_912647 ) ) ( not ( = ?auto_912643 ?auto_912648 ) ) ( not ( = ?auto_912643 ?auto_912649 ) ) ( not ( = ?auto_912644 ?auto_912645 ) ) ( not ( = ?auto_912644 ?auto_912646 ) ) ( not ( = ?auto_912644 ?auto_912647 ) ) ( not ( = ?auto_912644 ?auto_912648 ) ) ( not ( = ?auto_912644 ?auto_912649 ) ) ( not ( = ?auto_912645 ?auto_912646 ) ) ( not ( = ?auto_912645 ?auto_912647 ) ) ( not ( = ?auto_912645 ?auto_912648 ) ) ( not ( = ?auto_912645 ?auto_912649 ) ) ( not ( = ?auto_912646 ?auto_912647 ) ) ( not ( = ?auto_912646 ?auto_912648 ) ) ( not ( = ?auto_912646 ?auto_912649 ) ) ( not ( = ?auto_912647 ?auto_912648 ) ) ( not ( = ?auto_912647 ?auto_912649 ) ) ( not ( = ?auto_912648 ?auto_912649 ) ) ( ON ?auto_912647 ?auto_912648 ) ( ON ?auto_912646 ?auto_912647 ) ( ON ?auto_912645 ?auto_912646 ) ( ON ?auto_912644 ?auto_912645 ) ( ON ?auto_912643 ?auto_912644 ) ( ON ?auto_912642 ?auto_912643 ) ( ON ?auto_912641 ?auto_912642 ) ( ON ?auto_912640 ?auto_912641 ) ( CLEAR ?auto_912638 ) ( ON ?auto_912639 ?auto_912640 ) ( CLEAR ?auto_912639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_912633 ?auto_912634 ?auto_912635 ?auto_912636 ?auto_912637 ?auto_912638 ?auto_912639 )
      ( MAKE-16PILE ?auto_912633 ?auto_912634 ?auto_912635 ?auto_912636 ?auto_912637 ?auto_912638 ?auto_912639 ?auto_912640 ?auto_912641 ?auto_912642 ?auto_912643 ?auto_912644 ?auto_912645 ?auto_912646 ?auto_912647 ?auto_912648 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912699 - BLOCK
      ?auto_912700 - BLOCK
      ?auto_912701 - BLOCK
      ?auto_912702 - BLOCK
      ?auto_912703 - BLOCK
      ?auto_912704 - BLOCK
      ?auto_912705 - BLOCK
      ?auto_912706 - BLOCK
      ?auto_912707 - BLOCK
      ?auto_912708 - BLOCK
      ?auto_912709 - BLOCK
      ?auto_912710 - BLOCK
      ?auto_912711 - BLOCK
      ?auto_912712 - BLOCK
      ?auto_912713 - BLOCK
      ?auto_912714 - BLOCK
    )
    :vars
    (
      ?auto_912715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912714 ?auto_912715 ) ( ON-TABLE ?auto_912699 ) ( ON ?auto_912700 ?auto_912699 ) ( ON ?auto_912701 ?auto_912700 ) ( ON ?auto_912702 ?auto_912701 ) ( ON ?auto_912703 ?auto_912702 ) ( not ( = ?auto_912699 ?auto_912700 ) ) ( not ( = ?auto_912699 ?auto_912701 ) ) ( not ( = ?auto_912699 ?auto_912702 ) ) ( not ( = ?auto_912699 ?auto_912703 ) ) ( not ( = ?auto_912699 ?auto_912704 ) ) ( not ( = ?auto_912699 ?auto_912705 ) ) ( not ( = ?auto_912699 ?auto_912706 ) ) ( not ( = ?auto_912699 ?auto_912707 ) ) ( not ( = ?auto_912699 ?auto_912708 ) ) ( not ( = ?auto_912699 ?auto_912709 ) ) ( not ( = ?auto_912699 ?auto_912710 ) ) ( not ( = ?auto_912699 ?auto_912711 ) ) ( not ( = ?auto_912699 ?auto_912712 ) ) ( not ( = ?auto_912699 ?auto_912713 ) ) ( not ( = ?auto_912699 ?auto_912714 ) ) ( not ( = ?auto_912699 ?auto_912715 ) ) ( not ( = ?auto_912700 ?auto_912701 ) ) ( not ( = ?auto_912700 ?auto_912702 ) ) ( not ( = ?auto_912700 ?auto_912703 ) ) ( not ( = ?auto_912700 ?auto_912704 ) ) ( not ( = ?auto_912700 ?auto_912705 ) ) ( not ( = ?auto_912700 ?auto_912706 ) ) ( not ( = ?auto_912700 ?auto_912707 ) ) ( not ( = ?auto_912700 ?auto_912708 ) ) ( not ( = ?auto_912700 ?auto_912709 ) ) ( not ( = ?auto_912700 ?auto_912710 ) ) ( not ( = ?auto_912700 ?auto_912711 ) ) ( not ( = ?auto_912700 ?auto_912712 ) ) ( not ( = ?auto_912700 ?auto_912713 ) ) ( not ( = ?auto_912700 ?auto_912714 ) ) ( not ( = ?auto_912700 ?auto_912715 ) ) ( not ( = ?auto_912701 ?auto_912702 ) ) ( not ( = ?auto_912701 ?auto_912703 ) ) ( not ( = ?auto_912701 ?auto_912704 ) ) ( not ( = ?auto_912701 ?auto_912705 ) ) ( not ( = ?auto_912701 ?auto_912706 ) ) ( not ( = ?auto_912701 ?auto_912707 ) ) ( not ( = ?auto_912701 ?auto_912708 ) ) ( not ( = ?auto_912701 ?auto_912709 ) ) ( not ( = ?auto_912701 ?auto_912710 ) ) ( not ( = ?auto_912701 ?auto_912711 ) ) ( not ( = ?auto_912701 ?auto_912712 ) ) ( not ( = ?auto_912701 ?auto_912713 ) ) ( not ( = ?auto_912701 ?auto_912714 ) ) ( not ( = ?auto_912701 ?auto_912715 ) ) ( not ( = ?auto_912702 ?auto_912703 ) ) ( not ( = ?auto_912702 ?auto_912704 ) ) ( not ( = ?auto_912702 ?auto_912705 ) ) ( not ( = ?auto_912702 ?auto_912706 ) ) ( not ( = ?auto_912702 ?auto_912707 ) ) ( not ( = ?auto_912702 ?auto_912708 ) ) ( not ( = ?auto_912702 ?auto_912709 ) ) ( not ( = ?auto_912702 ?auto_912710 ) ) ( not ( = ?auto_912702 ?auto_912711 ) ) ( not ( = ?auto_912702 ?auto_912712 ) ) ( not ( = ?auto_912702 ?auto_912713 ) ) ( not ( = ?auto_912702 ?auto_912714 ) ) ( not ( = ?auto_912702 ?auto_912715 ) ) ( not ( = ?auto_912703 ?auto_912704 ) ) ( not ( = ?auto_912703 ?auto_912705 ) ) ( not ( = ?auto_912703 ?auto_912706 ) ) ( not ( = ?auto_912703 ?auto_912707 ) ) ( not ( = ?auto_912703 ?auto_912708 ) ) ( not ( = ?auto_912703 ?auto_912709 ) ) ( not ( = ?auto_912703 ?auto_912710 ) ) ( not ( = ?auto_912703 ?auto_912711 ) ) ( not ( = ?auto_912703 ?auto_912712 ) ) ( not ( = ?auto_912703 ?auto_912713 ) ) ( not ( = ?auto_912703 ?auto_912714 ) ) ( not ( = ?auto_912703 ?auto_912715 ) ) ( not ( = ?auto_912704 ?auto_912705 ) ) ( not ( = ?auto_912704 ?auto_912706 ) ) ( not ( = ?auto_912704 ?auto_912707 ) ) ( not ( = ?auto_912704 ?auto_912708 ) ) ( not ( = ?auto_912704 ?auto_912709 ) ) ( not ( = ?auto_912704 ?auto_912710 ) ) ( not ( = ?auto_912704 ?auto_912711 ) ) ( not ( = ?auto_912704 ?auto_912712 ) ) ( not ( = ?auto_912704 ?auto_912713 ) ) ( not ( = ?auto_912704 ?auto_912714 ) ) ( not ( = ?auto_912704 ?auto_912715 ) ) ( not ( = ?auto_912705 ?auto_912706 ) ) ( not ( = ?auto_912705 ?auto_912707 ) ) ( not ( = ?auto_912705 ?auto_912708 ) ) ( not ( = ?auto_912705 ?auto_912709 ) ) ( not ( = ?auto_912705 ?auto_912710 ) ) ( not ( = ?auto_912705 ?auto_912711 ) ) ( not ( = ?auto_912705 ?auto_912712 ) ) ( not ( = ?auto_912705 ?auto_912713 ) ) ( not ( = ?auto_912705 ?auto_912714 ) ) ( not ( = ?auto_912705 ?auto_912715 ) ) ( not ( = ?auto_912706 ?auto_912707 ) ) ( not ( = ?auto_912706 ?auto_912708 ) ) ( not ( = ?auto_912706 ?auto_912709 ) ) ( not ( = ?auto_912706 ?auto_912710 ) ) ( not ( = ?auto_912706 ?auto_912711 ) ) ( not ( = ?auto_912706 ?auto_912712 ) ) ( not ( = ?auto_912706 ?auto_912713 ) ) ( not ( = ?auto_912706 ?auto_912714 ) ) ( not ( = ?auto_912706 ?auto_912715 ) ) ( not ( = ?auto_912707 ?auto_912708 ) ) ( not ( = ?auto_912707 ?auto_912709 ) ) ( not ( = ?auto_912707 ?auto_912710 ) ) ( not ( = ?auto_912707 ?auto_912711 ) ) ( not ( = ?auto_912707 ?auto_912712 ) ) ( not ( = ?auto_912707 ?auto_912713 ) ) ( not ( = ?auto_912707 ?auto_912714 ) ) ( not ( = ?auto_912707 ?auto_912715 ) ) ( not ( = ?auto_912708 ?auto_912709 ) ) ( not ( = ?auto_912708 ?auto_912710 ) ) ( not ( = ?auto_912708 ?auto_912711 ) ) ( not ( = ?auto_912708 ?auto_912712 ) ) ( not ( = ?auto_912708 ?auto_912713 ) ) ( not ( = ?auto_912708 ?auto_912714 ) ) ( not ( = ?auto_912708 ?auto_912715 ) ) ( not ( = ?auto_912709 ?auto_912710 ) ) ( not ( = ?auto_912709 ?auto_912711 ) ) ( not ( = ?auto_912709 ?auto_912712 ) ) ( not ( = ?auto_912709 ?auto_912713 ) ) ( not ( = ?auto_912709 ?auto_912714 ) ) ( not ( = ?auto_912709 ?auto_912715 ) ) ( not ( = ?auto_912710 ?auto_912711 ) ) ( not ( = ?auto_912710 ?auto_912712 ) ) ( not ( = ?auto_912710 ?auto_912713 ) ) ( not ( = ?auto_912710 ?auto_912714 ) ) ( not ( = ?auto_912710 ?auto_912715 ) ) ( not ( = ?auto_912711 ?auto_912712 ) ) ( not ( = ?auto_912711 ?auto_912713 ) ) ( not ( = ?auto_912711 ?auto_912714 ) ) ( not ( = ?auto_912711 ?auto_912715 ) ) ( not ( = ?auto_912712 ?auto_912713 ) ) ( not ( = ?auto_912712 ?auto_912714 ) ) ( not ( = ?auto_912712 ?auto_912715 ) ) ( not ( = ?auto_912713 ?auto_912714 ) ) ( not ( = ?auto_912713 ?auto_912715 ) ) ( not ( = ?auto_912714 ?auto_912715 ) ) ( ON ?auto_912713 ?auto_912714 ) ( ON ?auto_912712 ?auto_912713 ) ( ON ?auto_912711 ?auto_912712 ) ( ON ?auto_912710 ?auto_912711 ) ( ON ?auto_912709 ?auto_912710 ) ( ON ?auto_912708 ?auto_912709 ) ( ON ?auto_912707 ?auto_912708 ) ( ON ?auto_912706 ?auto_912707 ) ( ON ?auto_912705 ?auto_912706 ) ( CLEAR ?auto_912703 ) ( ON ?auto_912704 ?auto_912705 ) ( CLEAR ?auto_912704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_912699 ?auto_912700 ?auto_912701 ?auto_912702 ?auto_912703 ?auto_912704 )
      ( MAKE-16PILE ?auto_912699 ?auto_912700 ?auto_912701 ?auto_912702 ?auto_912703 ?auto_912704 ?auto_912705 ?auto_912706 ?auto_912707 ?auto_912708 ?auto_912709 ?auto_912710 ?auto_912711 ?auto_912712 ?auto_912713 ?auto_912714 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912765 - BLOCK
      ?auto_912766 - BLOCK
      ?auto_912767 - BLOCK
      ?auto_912768 - BLOCK
      ?auto_912769 - BLOCK
      ?auto_912770 - BLOCK
      ?auto_912771 - BLOCK
      ?auto_912772 - BLOCK
      ?auto_912773 - BLOCK
      ?auto_912774 - BLOCK
      ?auto_912775 - BLOCK
      ?auto_912776 - BLOCK
      ?auto_912777 - BLOCK
      ?auto_912778 - BLOCK
      ?auto_912779 - BLOCK
      ?auto_912780 - BLOCK
    )
    :vars
    (
      ?auto_912781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912780 ?auto_912781 ) ( ON-TABLE ?auto_912765 ) ( ON ?auto_912766 ?auto_912765 ) ( ON ?auto_912767 ?auto_912766 ) ( ON ?auto_912768 ?auto_912767 ) ( not ( = ?auto_912765 ?auto_912766 ) ) ( not ( = ?auto_912765 ?auto_912767 ) ) ( not ( = ?auto_912765 ?auto_912768 ) ) ( not ( = ?auto_912765 ?auto_912769 ) ) ( not ( = ?auto_912765 ?auto_912770 ) ) ( not ( = ?auto_912765 ?auto_912771 ) ) ( not ( = ?auto_912765 ?auto_912772 ) ) ( not ( = ?auto_912765 ?auto_912773 ) ) ( not ( = ?auto_912765 ?auto_912774 ) ) ( not ( = ?auto_912765 ?auto_912775 ) ) ( not ( = ?auto_912765 ?auto_912776 ) ) ( not ( = ?auto_912765 ?auto_912777 ) ) ( not ( = ?auto_912765 ?auto_912778 ) ) ( not ( = ?auto_912765 ?auto_912779 ) ) ( not ( = ?auto_912765 ?auto_912780 ) ) ( not ( = ?auto_912765 ?auto_912781 ) ) ( not ( = ?auto_912766 ?auto_912767 ) ) ( not ( = ?auto_912766 ?auto_912768 ) ) ( not ( = ?auto_912766 ?auto_912769 ) ) ( not ( = ?auto_912766 ?auto_912770 ) ) ( not ( = ?auto_912766 ?auto_912771 ) ) ( not ( = ?auto_912766 ?auto_912772 ) ) ( not ( = ?auto_912766 ?auto_912773 ) ) ( not ( = ?auto_912766 ?auto_912774 ) ) ( not ( = ?auto_912766 ?auto_912775 ) ) ( not ( = ?auto_912766 ?auto_912776 ) ) ( not ( = ?auto_912766 ?auto_912777 ) ) ( not ( = ?auto_912766 ?auto_912778 ) ) ( not ( = ?auto_912766 ?auto_912779 ) ) ( not ( = ?auto_912766 ?auto_912780 ) ) ( not ( = ?auto_912766 ?auto_912781 ) ) ( not ( = ?auto_912767 ?auto_912768 ) ) ( not ( = ?auto_912767 ?auto_912769 ) ) ( not ( = ?auto_912767 ?auto_912770 ) ) ( not ( = ?auto_912767 ?auto_912771 ) ) ( not ( = ?auto_912767 ?auto_912772 ) ) ( not ( = ?auto_912767 ?auto_912773 ) ) ( not ( = ?auto_912767 ?auto_912774 ) ) ( not ( = ?auto_912767 ?auto_912775 ) ) ( not ( = ?auto_912767 ?auto_912776 ) ) ( not ( = ?auto_912767 ?auto_912777 ) ) ( not ( = ?auto_912767 ?auto_912778 ) ) ( not ( = ?auto_912767 ?auto_912779 ) ) ( not ( = ?auto_912767 ?auto_912780 ) ) ( not ( = ?auto_912767 ?auto_912781 ) ) ( not ( = ?auto_912768 ?auto_912769 ) ) ( not ( = ?auto_912768 ?auto_912770 ) ) ( not ( = ?auto_912768 ?auto_912771 ) ) ( not ( = ?auto_912768 ?auto_912772 ) ) ( not ( = ?auto_912768 ?auto_912773 ) ) ( not ( = ?auto_912768 ?auto_912774 ) ) ( not ( = ?auto_912768 ?auto_912775 ) ) ( not ( = ?auto_912768 ?auto_912776 ) ) ( not ( = ?auto_912768 ?auto_912777 ) ) ( not ( = ?auto_912768 ?auto_912778 ) ) ( not ( = ?auto_912768 ?auto_912779 ) ) ( not ( = ?auto_912768 ?auto_912780 ) ) ( not ( = ?auto_912768 ?auto_912781 ) ) ( not ( = ?auto_912769 ?auto_912770 ) ) ( not ( = ?auto_912769 ?auto_912771 ) ) ( not ( = ?auto_912769 ?auto_912772 ) ) ( not ( = ?auto_912769 ?auto_912773 ) ) ( not ( = ?auto_912769 ?auto_912774 ) ) ( not ( = ?auto_912769 ?auto_912775 ) ) ( not ( = ?auto_912769 ?auto_912776 ) ) ( not ( = ?auto_912769 ?auto_912777 ) ) ( not ( = ?auto_912769 ?auto_912778 ) ) ( not ( = ?auto_912769 ?auto_912779 ) ) ( not ( = ?auto_912769 ?auto_912780 ) ) ( not ( = ?auto_912769 ?auto_912781 ) ) ( not ( = ?auto_912770 ?auto_912771 ) ) ( not ( = ?auto_912770 ?auto_912772 ) ) ( not ( = ?auto_912770 ?auto_912773 ) ) ( not ( = ?auto_912770 ?auto_912774 ) ) ( not ( = ?auto_912770 ?auto_912775 ) ) ( not ( = ?auto_912770 ?auto_912776 ) ) ( not ( = ?auto_912770 ?auto_912777 ) ) ( not ( = ?auto_912770 ?auto_912778 ) ) ( not ( = ?auto_912770 ?auto_912779 ) ) ( not ( = ?auto_912770 ?auto_912780 ) ) ( not ( = ?auto_912770 ?auto_912781 ) ) ( not ( = ?auto_912771 ?auto_912772 ) ) ( not ( = ?auto_912771 ?auto_912773 ) ) ( not ( = ?auto_912771 ?auto_912774 ) ) ( not ( = ?auto_912771 ?auto_912775 ) ) ( not ( = ?auto_912771 ?auto_912776 ) ) ( not ( = ?auto_912771 ?auto_912777 ) ) ( not ( = ?auto_912771 ?auto_912778 ) ) ( not ( = ?auto_912771 ?auto_912779 ) ) ( not ( = ?auto_912771 ?auto_912780 ) ) ( not ( = ?auto_912771 ?auto_912781 ) ) ( not ( = ?auto_912772 ?auto_912773 ) ) ( not ( = ?auto_912772 ?auto_912774 ) ) ( not ( = ?auto_912772 ?auto_912775 ) ) ( not ( = ?auto_912772 ?auto_912776 ) ) ( not ( = ?auto_912772 ?auto_912777 ) ) ( not ( = ?auto_912772 ?auto_912778 ) ) ( not ( = ?auto_912772 ?auto_912779 ) ) ( not ( = ?auto_912772 ?auto_912780 ) ) ( not ( = ?auto_912772 ?auto_912781 ) ) ( not ( = ?auto_912773 ?auto_912774 ) ) ( not ( = ?auto_912773 ?auto_912775 ) ) ( not ( = ?auto_912773 ?auto_912776 ) ) ( not ( = ?auto_912773 ?auto_912777 ) ) ( not ( = ?auto_912773 ?auto_912778 ) ) ( not ( = ?auto_912773 ?auto_912779 ) ) ( not ( = ?auto_912773 ?auto_912780 ) ) ( not ( = ?auto_912773 ?auto_912781 ) ) ( not ( = ?auto_912774 ?auto_912775 ) ) ( not ( = ?auto_912774 ?auto_912776 ) ) ( not ( = ?auto_912774 ?auto_912777 ) ) ( not ( = ?auto_912774 ?auto_912778 ) ) ( not ( = ?auto_912774 ?auto_912779 ) ) ( not ( = ?auto_912774 ?auto_912780 ) ) ( not ( = ?auto_912774 ?auto_912781 ) ) ( not ( = ?auto_912775 ?auto_912776 ) ) ( not ( = ?auto_912775 ?auto_912777 ) ) ( not ( = ?auto_912775 ?auto_912778 ) ) ( not ( = ?auto_912775 ?auto_912779 ) ) ( not ( = ?auto_912775 ?auto_912780 ) ) ( not ( = ?auto_912775 ?auto_912781 ) ) ( not ( = ?auto_912776 ?auto_912777 ) ) ( not ( = ?auto_912776 ?auto_912778 ) ) ( not ( = ?auto_912776 ?auto_912779 ) ) ( not ( = ?auto_912776 ?auto_912780 ) ) ( not ( = ?auto_912776 ?auto_912781 ) ) ( not ( = ?auto_912777 ?auto_912778 ) ) ( not ( = ?auto_912777 ?auto_912779 ) ) ( not ( = ?auto_912777 ?auto_912780 ) ) ( not ( = ?auto_912777 ?auto_912781 ) ) ( not ( = ?auto_912778 ?auto_912779 ) ) ( not ( = ?auto_912778 ?auto_912780 ) ) ( not ( = ?auto_912778 ?auto_912781 ) ) ( not ( = ?auto_912779 ?auto_912780 ) ) ( not ( = ?auto_912779 ?auto_912781 ) ) ( not ( = ?auto_912780 ?auto_912781 ) ) ( ON ?auto_912779 ?auto_912780 ) ( ON ?auto_912778 ?auto_912779 ) ( ON ?auto_912777 ?auto_912778 ) ( ON ?auto_912776 ?auto_912777 ) ( ON ?auto_912775 ?auto_912776 ) ( ON ?auto_912774 ?auto_912775 ) ( ON ?auto_912773 ?auto_912774 ) ( ON ?auto_912772 ?auto_912773 ) ( ON ?auto_912771 ?auto_912772 ) ( ON ?auto_912770 ?auto_912771 ) ( CLEAR ?auto_912768 ) ( ON ?auto_912769 ?auto_912770 ) ( CLEAR ?auto_912769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_912765 ?auto_912766 ?auto_912767 ?auto_912768 ?auto_912769 )
      ( MAKE-16PILE ?auto_912765 ?auto_912766 ?auto_912767 ?auto_912768 ?auto_912769 ?auto_912770 ?auto_912771 ?auto_912772 ?auto_912773 ?auto_912774 ?auto_912775 ?auto_912776 ?auto_912777 ?auto_912778 ?auto_912779 ?auto_912780 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912831 - BLOCK
      ?auto_912832 - BLOCK
      ?auto_912833 - BLOCK
      ?auto_912834 - BLOCK
      ?auto_912835 - BLOCK
      ?auto_912836 - BLOCK
      ?auto_912837 - BLOCK
      ?auto_912838 - BLOCK
      ?auto_912839 - BLOCK
      ?auto_912840 - BLOCK
      ?auto_912841 - BLOCK
      ?auto_912842 - BLOCK
      ?auto_912843 - BLOCK
      ?auto_912844 - BLOCK
      ?auto_912845 - BLOCK
      ?auto_912846 - BLOCK
    )
    :vars
    (
      ?auto_912847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912846 ?auto_912847 ) ( ON-TABLE ?auto_912831 ) ( ON ?auto_912832 ?auto_912831 ) ( ON ?auto_912833 ?auto_912832 ) ( not ( = ?auto_912831 ?auto_912832 ) ) ( not ( = ?auto_912831 ?auto_912833 ) ) ( not ( = ?auto_912831 ?auto_912834 ) ) ( not ( = ?auto_912831 ?auto_912835 ) ) ( not ( = ?auto_912831 ?auto_912836 ) ) ( not ( = ?auto_912831 ?auto_912837 ) ) ( not ( = ?auto_912831 ?auto_912838 ) ) ( not ( = ?auto_912831 ?auto_912839 ) ) ( not ( = ?auto_912831 ?auto_912840 ) ) ( not ( = ?auto_912831 ?auto_912841 ) ) ( not ( = ?auto_912831 ?auto_912842 ) ) ( not ( = ?auto_912831 ?auto_912843 ) ) ( not ( = ?auto_912831 ?auto_912844 ) ) ( not ( = ?auto_912831 ?auto_912845 ) ) ( not ( = ?auto_912831 ?auto_912846 ) ) ( not ( = ?auto_912831 ?auto_912847 ) ) ( not ( = ?auto_912832 ?auto_912833 ) ) ( not ( = ?auto_912832 ?auto_912834 ) ) ( not ( = ?auto_912832 ?auto_912835 ) ) ( not ( = ?auto_912832 ?auto_912836 ) ) ( not ( = ?auto_912832 ?auto_912837 ) ) ( not ( = ?auto_912832 ?auto_912838 ) ) ( not ( = ?auto_912832 ?auto_912839 ) ) ( not ( = ?auto_912832 ?auto_912840 ) ) ( not ( = ?auto_912832 ?auto_912841 ) ) ( not ( = ?auto_912832 ?auto_912842 ) ) ( not ( = ?auto_912832 ?auto_912843 ) ) ( not ( = ?auto_912832 ?auto_912844 ) ) ( not ( = ?auto_912832 ?auto_912845 ) ) ( not ( = ?auto_912832 ?auto_912846 ) ) ( not ( = ?auto_912832 ?auto_912847 ) ) ( not ( = ?auto_912833 ?auto_912834 ) ) ( not ( = ?auto_912833 ?auto_912835 ) ) ( not ( = ?auto_912833 ?auto_912836 ) ) ( not ( = ?auto_912833 ?auto_912837 ) ) ( not ( = ?auto_912833 ?auto_912838 ) ) ( not ( = ?auto_912833 ?auto_912839 ) ) ( not ( = ?auto_912833 ?auto_912840 ) ) ( not ( = ?auto_912833 ?auto_912841 ) ) ( not ( = ?auto_912833 ?auto_912842 ) ) ( not ( = ?auto_912833 ?auto_912843 ) ) ( not ( = ?auto_912833 ?auto_912844 ) ) ( not ( = ?auto_912833 ?auto_912845 ) ) ( not ( = ?auto_912833 ?auto_912846 ) ) ( not ( = ?auto_912833 ?auto_912847 ) ) ( not ( = ?auto_912834 ?auto_912835 ) ) ( not ( = ?auto_912834 ?auto_912836 ) ) ( not ( = ?auto_912834 ?auto_912837 ) ) ( not ( = ?auto_912834 ?auto_912838 ) ) ( not ( = ?auto_912834 ?auto_912839 ) ) ( not ( = ?auto_912834 ?auto_912840 ) ) ( not ( = ?auto_912834 ?auto_912841 ) ) ( not ( = ?auto_912834 ?auto_912842 ) ) ( not ( = ?auto_912834 ?auto_912843 ) ) ( not ( = ?auto_912834 ?auto_912844 ) ) ( not ( = ?auto_912834 ?auto_912845 ) ) ( not ( = ?auto_912834 ?auto_912846 ) ) ( not ( = ?auto_912834 ?auto_912847 ) ) ( not ( = ?auto_912835 ?auto_912836 ) ) ( not ( = ?auto_912835 ?auto_912837 ) ) ( not ( = ?auto_912835 ?auto_912838 ) ) ( not ( = ?auto_912835 ?auto_912839 ) ) ( not ( = ?auto_912835 ?auto_912840 ) ) ( not ( = ?auto_912835 ?auto_912841 ) ) ( not ( = ?auto_912835 ?auto_912842 ) ) ( not ( = ?auto_912835 ?auto_912843 ) ) ( not ( = ?auto_912835 ?auto_912844 ) ) ( not ( = ?auto_912835 ?auto_912845 ) ) ( not ( = ?auto_912835 ?auto_912846 ) ) ( not ( = ?auto_912835 ?auto_912847 ) ) ( not ( = ?auto_912836 ?auto_912837 ) ) ( not ( = ?auto_912836 ?auto_912838 ) ) ( not ( = ?auto_912836 ?auto_912839 ) ) ( not ( = ?auto_912836 ?auto_912840 ) ) ( not ( = ?auto_912836 ?auto_912841 ) ) ( not ( = ?auto_912836 ?auto_912842 ) ) ( not ( = ?auto_912836 ?auto_912843 ) ) ( not ( = ?auto_912836 ?auto_912844 ) ) ( not ( = ?auto_912836 ?auto_912845 ) ) ( not ( = ?auto_912836 ?auto_912846 ) ) ( not ( = ?auto_912836 ?auto_912847 ) ) ( not ( = ?auto_912837 ?auto_912838 ) ) ( not ( = ?auto_912837 ?auto_912839 ) ) ( not ( = ?auto_912837 ?auto_912840 ) ) ( not ( = ?auto_912837 ?auto_912841 ) ) ( not ( = ?auto_912837 ?auto_912842 ) ) ( not ( = ?auto_912837 ?auto_912843 ) ) ( not ( = ?auto_912837 ?auto_912844 ) ) ( not ( = ?auto_912837 ?auto_912845 ) ) ( not ( = ?auto_912837 ?auto_912846 ) ) ( not ( = ?auto_912837 ?auto_912847 ) ) ( not ( = ?auto_912838 ?auto_912839 ) ) ( not ( = ?auto_912838 ?auto_912840 ) ) ( not ( = ?auto_912838 ?auto_912841 ) ) ( not ( = ?auto_912838 ?auto_912842 ) ) ( not ( = ?auto_912838 ?auto_912843 ) ) ( not ( = ?auto_912838 ?auto_912844 ) ) ( not ( = ?auto_912838 ?auto_912845 ) ) ( not ( = ?auto_912838 ?auto_912846 ) ) ( not ( = ?auto_912838 ?auto_912847 ) ) ( not ( = ?auto_912839 ?auto_912840 ) ) ( not ( = ?auto_912839 ?auto_912841 ) ) ( not ( = ?auto_912839 ?auto_912842 ) ) ( not ( = ?auto_912839 ?auto_912843 ) ) ( not ( = ?auto_912839 ?auto_912844 ) ) ( not ( = ?auto_912839 ?auto_912845 ) ) ( not ( = ?auto_912839 ?auto_912846 ) ) ( not ( = ?auto_912839 ?auto_912847 ) ) ( not ( = ?auto_912840 ?auto_912841 ) ) ( not ( = ?auto_912840 ?auto_912842 ) ) ( not ( = ?auto_912840 ?auto_912843 ) ) ( not ( = ?auto_912840 ?auto_912844 ) ) ( not ( = ?auto_912840 ?auto_912845 ) ) ( not ( = ?auto_912840 ?auto_912846 ) ) ( not ( = ?auto_912840 ?auto_912847 ) ) ( not ( = ?auto_912841 ?auto_912842 ) ) ( not ( = ?auto_912841 ?auto_912843 ) ) ( not ( = ?auto_912841 ?auto_912844 ) ) ( not ( = ?auto_912841 ?auto_912845 ) ) ( not ( = ?auto_912841 ?auto_912846 ) ) ( not ( = ?auto_912841 ?auto_912847 ) ) ( not ( = ?auto_912842 ?auto_912843 ) ) ( not ( = ?auto_912842 ?auto_912844 ) ) ( not ( = ?auto_912842 ?auto_912845 ) ) ( not ( = ?auto_912842 ?auto_912846 ) ) ( not ( = ?auto_912842 ?auto_912847 ) ) ( not ( = ?auto_912843 ?auto_912844 ) ) ( not ( = ?auto_912843 ?auto_912845 ) ) ( not ( = ?auto_912843 ?auto_912846 ) ) ( not ( = ?auto_912843 ?auto_912847 ) ) ( not ( = ?auto_912844 ?auto_912845 ) ) ( not ( = ?auto_912844 ?auto_912846 ) ) ( not ( = ?auto_912844 ?auto_912847 ) ) ( not ( = ?auto_912845 ?auto_912846 ) ) ( not ( = ?auto_912845 ?auto_912847 ) ) ( not ( = ?auto_912846 ?auto_912847 ) ) ( ON ?auto_912845 ?auto_912846 ) ( ON ?auto_912844 ?auto_912845 ) ( ON ?auto_912843 ?auto_912844 ) ( ON ?auto_912842 ?auto_912843 ) ( ON ?auto_912841 ?auto_912842 ) ( ON ?auto_912840 ?auto_912841 ) ( ON ?auto_912839 ?auto_912840 ) ( ON ?auto_912838 ?auto_912839 ) ( ON ?auto_912837 ?auto_912838 ) ( ON ?auto_912836 ?auto_912837 ) ( ON ?auto_912835 ?auto_912836 ) ( CLEAR ?auto_912833 ) ( ON ?auto_912834 ?auto_912835 ) ( CLEAR ?auto_912834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_912831 ?auto_912832 ?auto_912833 ?auto_912834 )
      ( MAKE-16PILE ?auto_912831 ?auto_912832 ?auto_912833 ?auto_912834 ?auto_912835 ?auto_912836 ?auto_912837 ?auto_912838 ?auto_912839 ?auto_912840 ?auto_912841 ?auto_912842 ?auto_912843 ?auto_912844 ?auto_912845 ?auto_912846 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912897 - BLOCK
      ?auto_912898 - BLOCK
      ?auto_912899 - BLOCK
      ?auto_912900 - BLOCK
      ?auto_912901 - BLOCK
      ?auto_912902 - BLOCK
      ?auto_912903 - BLOCK
      ?auto_912904 - BLOCK
      ?auto_912905 - BLOCK
      ?auto_912906 - BLOCK
      ?auto_912907 - BLOCK
      ?auto_912908 - BLOCK
      ?auto_912909 - BLOCK
      ?auto_912910 - BLOCK
      ?auto_912911 - BLOCK
      ?auto_912912 - BLOCK
    )
    :vars
    (
      ?auto_912913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912912 ?auto_912913 ) ( ON-TABLE ?auto_912897 ) ( ON ?auto_912898 ?auto_912897 ) ( not ( = ?auto_912897 ?auto_912898 ) ) ( not ( = ?auto_912897 ?auto_912899 ) ) ( not ( = ?auto_912897 ?auto_912900 ) ) ( not ( = ?auto_912897 ?auto_912901 ) ) ( not ( = ?auto_912897 ?auto_912902 ) ) ( not ( = ?auto_912897 ?auto_912903 ) ) ( not ( = ?auto_912897 ?auto_912904 ) ) ( not ( = ?auto_912897 ?auto_912905 ) ) ( not ( = ?auto_912897 ?auto_912906 ) ) ( not ( = ?auto_912897 ?auto_912907 ) ) ( not ( = ?auto_912897 ?auto_912908 ) ) ( not ( = ?auto_912897 ?auto_912909 ) ) ( not ( = ?auto_912897 ?auto_912910 ) ) ( not ( = ?auto_912897 ?auto_912911 ) ) ( not ( = ?auto_912897 ?auto_912912 ) ) ( not ( = ?auto_912897 ?auto_912913 ) ) ( not ( = ?auto_912898 ?auto_912899 ) ) ( not ( = ?auto_912898 ?auto_912900 ) ) ( not ( = ?auto_912898 ?auto_912901 ) ) ( not ( = ?auto_912898 ?auto_912902 ) ) ( not ( = ?auto_912898 ?auto_912903 ) ) ( not ( = ?auto_912898 ?auto_912904 ) ) ( not ( = ?auto_912898 ?auto_912905 ) ) ( not ( = ?auto_912898 ?auto_912906 ) ) ( not ( = ?auto_912898 ?auto_912907 ) ) ( not ( = ?auto_912898 ?auto_912908 ) ) ( not ( = ?auto_912898 ?auto_912909 ) ) ( not ( = ?auto_912898 ?auto_912910 ) ) ( not ( = ?auto_912898 ?auto_912911 ) ) ( not ( = ?auto_912898 ?auto_912912 ) ) ( not ( = ?auto_912898 ?auto_912913 ) ) ( not ( = ?auto_912899 ?auto_912900 ) ) ( not ( = ?auto_912899 ?auto_912901 ) ) ( not ( = ?auto_912899 ?auto_912902 ) ) ( not ( = ?auto_912899 ?auto_912903 ) ) ( not ( = ?auto_912899 ?auto_912904 ) ) ( not ( = ?auto_912899 ?auto_912905 ) ) ( not ( = ?auto_912899 ?auto_912906 ) ) ( not ( = ?auto_912899 ?auto_912907 ) ) ( not ( = ?auto_912899 ?auto_912908 ) ) ( not ( = ?auto_912899 ?auto_912909 ) ) ( not ( = ?auto_912899 ?auto_912910 ) ) ( not ( = ?auto_912899 ?auto_912911 ) ) ( not ( = ?auto_912899 ?auto_912912 ) ) ( not ( = ?auto_912899 ?auto_912913 ) ) ( not ( = ?auto_912900 ?auto_912901 ) ) ( not ( = ?auto_912900 ?auto_912902 ) ) ( not ( = ?auto_912900 ?auto_912903 ) ) ( not ( = ?auto_912900 ?auto_912904 ) ) ( not ( = ?auto_912900 ?auto_912905 ) ) ( not ( = ?auto_912900 ?auto_912906 ) ) ( not ( = ?auto_912900 ?auto_912907 ) ) ( not ( = ?auto_912900 ?auto_912908 ) ) ( not ( = ?auto_912900 ?auto_912909 ) ) ( not ( = ?auto_912900 ?auto_912910 ) ) ( not ( = ?auto_912900 ?auto_912911 ) ) ( not ( = ?auto_912900 ?auto_912912 ) ) ( not ( = ?auto_912900 ?auto_912913 ) ) ( not ( = ?auto_912901 ?auto_912902 ) ) ( not ( = ?auto_912901 ?auto_912903 ) ) ( not ( = ?auto_912901 ?auto_912904 ) ) ( not ( = ?auto_912901 ?auto_912905 ) ) ( not ( = ?auto_912901 ?auto_912906 ) ) ( not ( = ?auto_912901 ?auto_912907 ) ) ( not ( = ?auto_912901 ?auto_912908 ) ) ( not ( = ?auto_912901 ?auto_912909 ) ) ( not ( = ?auto_912901 ?auto_912910 ) ) ( not ( = ?auto_912901 ?auto_912911 ) ) ( not ( = ?auto_912901 ?auto_912912 ) ) ( not ( = ?auto_912901 ?auto_912913 ) ) ( not ( = ?auto_912902 ?auto_912903 ) ) ( not ( = ?auto_912902 ?auto_912904 ) ) ( not ( = ?auto_912902 ?auto_912905 ) ) ( not ( = ?auto_912902 ?auto_912906 ) ) ( not ( = ?auto_912902 ?auto_912907 ) ) ( not ( = ?auto_912902 ?auto_912908 ) ) ( not ( = ?auto_912902 ?auto_912909 ) ) ( not ( = ?auto_912902 ?auto_912910 ) ) ( not ( = ?auto_912902 ?auto_912911 ) ) ( not ( = ?auto_912902 ?auto_912912 ) ) ( not ( = ?auto_912902 ?auto_912913 ) ) ( not ( = ?auto_912903 ?auto_912904 ) ) ( not ( = ?auto_912903 ?auto_912905 ) ) ( not ( = ?auto_912903 ?auto_912906 ) ) ( not ( = ?auto_912903 ?auto_912907 ) ) ( not ( = ?auto_912903 ?auto_912908 ) ) ( not ( = ?auto_912903 ?auto_912909 ) ) ( not ( = ?auto_912903 ?auto_912910 ) ) ( not ( = ?auto_912903 ?auto_912911 ) ) ( not ( = ?auto_912903 ?auto_912912 ) ) ( not ( = ?auto_912903 ?auto_912913 ) ) ( not ( = ?auto_912904 ?auto_912905 ) ) ( not ( = ?auto_912904 ?auto_912906 ) ) ( not ( = ?auto_912904 ?auto_912907 ) ) ( not ( = ?auto_912904 ?auto_912908 ) ) ( not ( = ?auto_912904 ?auto_912909 ) ) ( not ( = ?auto_912904 ?auto_912910 ) ) ( not ( = ?auto_912904 ?auto_912911 ) ) ( not ( = ?auto_912904 ?auto_912912 ) ) ( not ( = ?auto_912904 ?auto_912913 ) ) ( not ( = ?auto_912905 ?auto_912906 ) ) ( not ( = ?auto_912905 ?auto_912907 ) ) ( not ( = ?auto_912905 ?auto_912908 ) ) ( not ( = ?auto_912905 ?auto_912909 ) ) ( not ( = ?auto_912905 ?auto_912910 ) ) ( not ( = ?auto_912905 ?auto_912911 ) ) ( not ( = ?auto_912905 ?auto_912912 ) ) ( not ( = ?auto_912905 ?auto_912913 ) ) ( not ( = ?auto_912906 ?auto_912907 ) ) ( not ( = ?auto_912906 ?auto_912908 ) ) ( not ( = ?auto_912906 ?auto_912909 ) ) ( not ( = ?auto_912906 ?auto_912910 ) ) ( not ( = ?auto_912906 ?auto_912911 ) ) ( not ( = ?auto_912906 ?auto_912912 ) ) ( not ( = ?auto_912906 ?auto_912913 ) ) ( not ( = ?auto_912907 ?auto_912908 ) ) ( not ( = ?auto_912907 ?auto_912909 ) ) ( not ( = ?auto_912907 ?auto_912910 ) ) ( not ( = ?auto_912907 ?auto_912911 ) ) ( not ( = ?auto_912907 ?auto_912912 ) ) ( not ( = ?auto_912907 ?auto_912913 ) ) ( not ( = ?auto_912908 ?auto_912909 ) ) ( not ( = ?auto_912908 ?auto_912910 ) ) ( not ( = ?auto_912908 ?auto_912911 ) ) ( not ( = ?auto_912908 ?auto_912912 ) ) ( not ( = ?auto_912908 ?auto_912913 ) ) ( not ( = ?auto_912909 ?auto_912910 ) ) ( not ( = ?auto_912909 ?auto_912911 ) ) ( not ( = ?auto_912909 ?auto_912912 ) ) ( not ( = ?auto_912909 ?auto_912913 ) ) ( not ( = ?auto_912910 ?auto_912911 ) ) ( not ( = ?auto_912910 ?auto_912912 ) ) ( not ( = ?auto_912910 ?auto_912913 ) ) ( not ( = ?auto_912911 ?auto_912912 ) ) ( not ( = ?auto_912911 ?auto_912913 ) ) ( not ( = ?auto_912912 ?auto_912913 ) ) ( ON ?auto_912911 ?auto_912912 ) ( ON ?auto_912910 ?auto_912911 ) ( ON ?auto_912909 ?auto_912910 ) ( ON ?auto_912908 ?auto_912909 ) ( ON ?auto_912907 ?auto_912908 ) ( ON ?auto_912906 ?auto_912907 ) ( ON ?auto_912905 ?auto_912906 ) ( ON ?auto_912904 ?auto_912905 ) ( ON ?auto_912903 ?auto_912904 ) ( ON ?auto_912902 ?auto_912903 ) ( ON ?auto_912901 ?auto_912902 ) ( ON ?auto_912900 ?auto_912901 ) ( CLEAR ?auto_912898 ) ( ON ?auto_912899 ?auto_912900 ) ( CLEAR ?auto_912899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_912897 ?auto_912898 ?auto_912899 )
      ( MAKE-16PILE ?auto_912897 ?auto_912898 ?auto_912899 ?auto_912900 ?auto_912901 ?auto_912902 ?auto_912903 ?auto_912904 ?auto_912905 ?auto_912906 ?auto_912907 ?auto_912908 ?auto_912909 ?auto_912910 ?auto_912911 ?auto_912912 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_912963 - BLOCK
      ?auto_912964 - BLOCK
      ?auto_912965 - BLOCK
      ?auto_912966 - BLOCK
      ?auto_912967 - BLOCK
      ?auto_912968 - BLOCK
      ?auto_912969 - BLOCK
      ?auto_912970 - BLOCK
      ?auto_912971 - BLOCK
      ?auto_912972 - BLOCK
      ?auto_912973 - BLOCK
      ?auto_912974 - BLOCK
      ?auto_912975 - BLOCK
      ?auto_912976 - BLOCK
      ?auto_912977 - BLOCK
      ?auto_912978 - BLOCK
    )
    :vars
    (
      ?auto_912979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912978 ?auto_912979 ) ( ON-TABLE ?auto_912963 ) ( not ( = ?auto_912963 ?auto_912964 ) ) ( not ( = ?auto_912963 ?auto_912965 ) ) ( not ( = ?auto_912963 ?auto_912966 ) ) ( not ( = ?auto_912963 ?auto_912967 ) ) ( not ( = ?auto_912963 ?auto_912968 ) ) ( not ( = ?auto_912963 ?auto_912969 ) ) ( not ( = ?auto_912963 ?auto_912970 ) ) ( not ( = ?auto_912963 ?auto_912971 ) ) ( not ( = ?auto_912963 ?auto_912972 ) ) ( not ( = ?auto_912963 ?auto_912973 ) ) ( not ( = ?auto_912963 ?auto_912974 ) ) ( not ( = ?auto_912963 ?auto_912975 ) ) ( not ( = ?auto_912963 ?auto_912976 ) ) ( not ( = ?auto_912963 ?auto_912977 ) ) ( not ( = ?auto_912963 ?auto_912978 ) ) ( not ( = ?auto_912963 ?auto_912979 ) ) ( not ( = ?auto_912964 ?auto_912965 ) ) ( not ( = ?auto_912964 ?auto_912966 ) ) ( not ( = ?auto_912964 ?auto_912967 ) ) ( not ( = ?auto_912964 ?auto_912968 ) ) ( not ( = ?auto_912964 ?auto_912969 ) ) ( not ( = ?auto_912964 ?auto_912970 ) ) ( not ( = ?auto_912964 ?auto_912971 ) ) ( not ( = ?auto_912964 ?auto_912972 ) ) ( not ( = ?auto_912964 ?auto_912973 ) ) ( not ( = ?auto_912964 ?auto_912974 ) ) ( not ( = ?auto_912964 ?auto_912975 ) ) ( not ( = ?auto_912964 ?auto_912976 ) ) ( not ( = ?auto_912964 ?auto_912977 ) ) ( not ( = ?auto_912964 ?auto_912978 ) ) ( not ( = ?auto_912964 ?auto_912979 ) ) ( not ( = ?auto_912965 ?auto_912966 ) ) ( not ( = ?auto_912965 ?auto_912967 ) ) ( not ( = ?auto_912965 ?auto_912968 ) ) ( not ( = ?auto_912965 ?auto_912969 ) ) ( not ( = ?auto_912965 ?auto_912970 ) ) ( not ( = ?auto_912965 ?auto_912971 ) ) ( not ( = ?auto_912965 ?auto_912972 ) ) ( not ( = ?auto_912965 ?auto_912973 ) ) ( not ( = ?auto_912965 ?auto_912974 ) ) ( not ( = ?auto_912965 ?auto_912975 ) ) ( not ( = ?auto_912965 ?auto_912976 ) ) ( not ( = ?auto_912965 ?auto_912977 ) ) ( not ( = ?auto_912965 ?auto_912978 ) ) ( not ( = ?auto_912965 ?auto_912979 ) ) ( not ( = ?auto_912966 ?auto_912967 ) ) ( not ( = ?auto_912966 ?auto_912968 ) ) ( not ( = ?auto_912966 ?auto_912969 ) ) ( not ( = ?auto_912966 ?auto_912970 ) ) ( not ( = ?auto_912966 ?auto_912971 ) ) ( not ( = ?auto_912966 ?auto_912972 ) ) ( not ( = ?auto_912966 ?auto_912973 ) ) ( not ( = ?auto_912966 ?auto_912974 ) ) ( not ( = ?auto_912966 ?auto_912975 ) ) ( not ( = ?auto_912966 ?auto_912976 ) ) ( not ( = ?auto_912966 ?auto_912977 ) ) ( not ( = ?auto_912966 ?auto_912978 ) ) ( not ( = ?auto_912966 ?auto_912979 ) ) ( not ( = ?auto_912967 ?auto_912968 ) ) ( not ( = ?auto_912967 ?auto_912969 ) ) ( not ( = ?auto_912967 ?auto_912970 ) ) ( not ( = ?auto_912967 ?auto_912971 ) ) ( not ( = ?auto_912967 ?auto_912972 ) ) ( not ( = ?auto_912967 ?auto_912973 ) ) ( not ( = ?auto_912967 ?auto_912974 ) ) ( not ( = ?auto_912967 ?auto_912975 ) ) ( not ( = ?auto_912967 ?auto_912976 ) ) ( not ( = ?auto_912967 ?auto_912977 ) ) ( not ( = ?auto_912967 ?auto_912978 ) ) ( not ( = ?auto_912967 ?auto_912979 ) ) ( not ( = ?auto_912968 ?auto_912969 ) ) ( not ( = ?auto_912968 ?auto_912970 ) ) ( not ( = ?auto_912968 ?auto_912971 ) ) ( not ( = ?auto_912968 ?auto_912972 ) ) ( not ( = ?auto_912968 ?auto_912973 ) ) ( not ( = ?auto_912968 ?auto_912974 ) ) ( not ( = ?auto_912968 ?auto_912975 ) ) ( not ( = ?auto_912968 ?auto_912976 ) ) ( not ( = ?auto_912968 ?auto_912977 ) ) ( not ( = ?auto_912968 ?auto_912978 ) ) ( not ( = ?auto_912968 ?auto_912979 ) ) ( not ( = ?auto_912969 ?auto_912970 ) ) ( not ( = ?auto_912969 ?auto_912971 ) ) ( not ( = ?auto_912969 ?auto_912972 ) ) ( not ( = ?auto_912969 ?auto_912973 ) ) ( not ( = ?auto_912969 ?auto_912974 ) ) ( not ( = ?auto_912969 ?auto_912975 ) ) ( not ( = ?auto_912969 ?auto_912976 ) ) ( not ( = ?auto_912969 ?auto_912977 ) ) ( not ( = ?auto_912969 ?auto_912978 ) ) ( not ( = ?auto_912969 ?auto_912979 ) ) ( not ( = ?auto_912970 ?auto_912971 ) ) ( not ( = ?auto_912970 ?auto_912972 ) ) ( not ( = ?auto_912970 ?auto_912973 ) ) ( not ( = ?auto_912970 ?auto_912974 ) ) ( not ( = ?auto_912970 ?auto_912975 ) ) ( not ( = ?auto_912970 ?auto_912976 ) ) ( not ( = ?auto_912970 ?auto_912977 ) ) ( not ( = ?auto_912970 ?auto_912978 ) ) ( not ( = ?auto_912970 ?auto_912979 ) ) ( not ( = ?auto_912971 ?auto_912972 ) ) ( not ( = ?auto_912971 ?auto_912973 ) ) ( not ( = ?auto_912971 ?auto_912974 ) ) ( not ( = ?auto_912971 ?auto_912975 ) ) ( not ( = ?auto_912971 ?auto_912976 ) ) ( not ( = ?auto_912971 ?auto_912977 ) ) ( not ( = ?auto_912971 ?auto_912978 ) ) ( not ( = ?auto_912971 ?auto_912979 ) ) ( not ( = ?auto_912972 ?auto_912973 ) ) ( not ( = ?auto_912972 ?auto_912974 ) ) ( not ( = ?auto_912972 ?auto_912975 ) ) ( not ( = ?auto_912972 ?auto_912976 ) ) ( not ( = ?auto_912972 ?auto_912977 ) ) ( not ( = ?auto_912972 ?auto_912978 ) ) ( not ( = ?auto_912972 ?auto_912979 ) ) ( not ( = ?auto_912973 ?auto_912974 ) ) ( not ( = ?auto_912973 ?auto_912975 ) ) ( not ( = ?auto_912973 ?auto_912976 ) ) ( not ( = ?auto_912973 ?auto_912977 ) ) ( not ( = ?auto_912973 ?auto_912978 ) ) ( not ( = ?auto_912973 ?auto_912979 ) ) ( not ( = ?auto_912974 ?auto_912975 ) ) ( not ( = ?auto_912974 ?auto_912976 ) ) ( not ( = ?auto_912974 ?auto_912977 ) ) ( not ( = ?auto_912974 ?auto_912978 ) ) ( not ( = ?auto_912974 ?auto_912979 ) ) ( not ( = ?auto_912975 ?auto_912976 ) ) ( not ( = ?auto_912975 ?auto_912977 ) ) ( not ( = ?auto_912975 ?auto_912978 ) ) ( not ( = ?auto_912975 ?auto_912979 ) ) ( not ( = ?auto_912976 ?auto_912977 ) ) ( not ( = ?auto_912976 ?auto_912978 ) ) ( not ( = ?auto_912976 ?auto_912979 ) ) ( not ( = ?auto_912977 ?auto_912978 ) ) ( not ( = ?auto_912977 ?auto_912979 ) ) ( not ( = ?auto_912978 ?auto_912979 ) ) ( ON ?auto_912977 ?auto_912978 ) ( ON ?auto_912976 ?auto_912977 ) ( ON ?auto_912975 ?auto_912976 ) ( ON ?auto_912974 ?auto_912975 ) ( ON ?auto_912973 ?auto_912974 ) ( ON ?auto_912972 ?auto_912973 ) ( ON ?auto_912971 ?auto_912972 ) ( ON ?auto_912970 ?auto_912971 ) ( ON ?auto_912969 ?auto_912970 ) ( ON ?auto_912968 ?auto_912969 ) ( ON ?auto_912967 ?auto_912968 ) ( ON ?auto_912966 ?auto_912967 ) ( ON ?auto_912965 ?auto_912966 ) ( CLEAR ?auto_912963 ) ( ON ?auto_912964 ?auto_912965 ) ( CLEAR ?auto_912964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_912963 ?auto_912964 )
      ( MAKE-16PILE ?auto_912963 ?auto_912964 ?auto_912965 ?auto_912966 ?auto_912967 ?auto_912968 ?auto_912969 ?auto_912970 ?auto_912971 ?auto_912972 ?auto_912973 ?auto_912974 ?auto_912975 ?auto_912976 ?auto_912977 ?auto_912978 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_913029 - BLOCK
      ?auto_913030 - BLOCK
      ?auto_913031 - BLOCK
      ?auto_913032 - BLOCK
      ?auto_913033 - BLOCK
      ?auto_913034 - BLOCK
      ?auto_913035 - BLOCK
      ?auto_913036 - BLOCK
      ?auto_913037 - BLOCK
      ?auto_913038 - BLOCK
      ?auto_913039 - BLOCK
      ?auto_913040 - BLOCK
      ?auto_913041 - BLOCK
      ?auto_913042 - BLOCK
      ?auto_913043 - BLOCK
      ?auto_913044 - BLOCK
    )
    :vars
    (
      ?auto_913045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913044 ?auto_913045 ) ( not ( = ?auto_913029 ?auto_913030 ) ) ( not ( = ?auto_913029 ?auto_913031 ) ) ( not ( = ?auto_913029 ?auto_913032 ) ) ( not ( = ?auto_913029 ?auto_913033 ) ) ( not ( = ?auto_913029 ?auto_913034 ) ) ( not ( = ?auto_913029 ?auto_913035 ) ) ( not ( = ?auto_913029 ?auto_913036 ) ) ( not ( = ?auto_913029 ?auto_913037 ) ) ( not ( = ?auto_913029 ?auto_913038 ) ) ( not ( = ?auto_913029 ?auto_913039 ) ) ( not ( = ?auto_913029 ?auto_913040 ) ) ( not ( = ?auto_913029 ?auto_913041 ) ) ( not ( = ?auto_913029 ?auto_913042 ) ) ( not ( = ?auto_913029 ?auto_913043 ) ) ( not ( = ?auto_913029 ?auto_913044 ) ) ( not ( = ?auto_913029 ?auto_913045 ) ) ( not ( = ?auto_913030 ?auto_913031 ) ) ( not ( = ?auto_913030 ?auto_913032 ) ) ( not ( = ?auto_913030 ?auto_913033 ) ) ( not ( = ?auto_913030 ?auto_913034 ) ) ( not ( = ?auto_913030 ?auto_913035 ) ) ( not ( = ?auto_913030 ?auto_913036 ) ) ( not ( = ?auto_913030 ?auto_913037 ) ) ( not ( = ?auto_913030 ?auto_913038 ) ) ( not ( = ?auto_913030 ?auto_913039 ) ) ( not ( = ?auto_913030 ?auto_913040 ) ) ( not ( = ?auto_913030 ?auto_913041 ) ) ( not ( = ?auto_913030 ?auto_913042 ) ) ( not ( = ?auto_913030 ?auto_913043 ) ) ( not ( = ?auto_913030 ?auto_913044 ) ) ( not ( = ?auto_913030 ?auto_913045 ) ) ( not ( = ?auto_913031 ?auto_913032 ) ) ( not ( = ?auto_913031 ?auto_913033 ) ) ( not ( = ?auto_913031 ?auto_913034 ) ) ( not ( = ?auto_913031 ?auto_913035 ) ) ( not ( = ?auto_913031 ?auto_913036 ) ) ( not ( = ?auto_913031 ?auto_913037 ) ) ( not ( = ?auto_913031 ?auto_913038 ) ) ( not ( = ?auto_913031 ?auto_913039 ) ) ( not ( = ?auto_913031 ?auto_913040 ) ) ( not ( = ?auto_913031 ?auto_913041 ) ) ( not ( = ?auto_913031 ?auto_913042 ) ) ( not ( = ?auto_913031 ?auto_913043 ) ) ( not ( = ?auto_913031 ?auto_913044 ) ) ( not ( = ?auto_913031 ?auto_913045 ) ) ( not ( = ?auto_913032 ?auto_913033 ) ) ( not ( = ?auto_913032 ?auto_913034 ) ) ( not ( = ?auto_913032 ?auto_913035 ) ) ( not ( = ?auto_913032 ?auto_913036 ) ) ( not ( = ?auto_913032 ?auto_913037 ) ) ( not ( = ?auto_913032 ?auto_913038 ) ) ( not ( = ?auto_913032 ?auto_913039 ) ) ( not ( = ?auto_913032 ?auto_913040 ) ) ( not ( = ?auto_913032 ?auto_913041 ) ) ( not ( = ?auto_913032 ?auto_913042 ) ) ( not ( = ?auto_913032 ?auto_913043 ) ) ( not ( = ?auto_913032 ?auto_913044 ) ) ( not ( = ?auto_913032 ?auto_913045 ) ) ( not ( = ?auto_913033 ?auto_913034 ) ) ( not ( = ?auto_913033 ?auto_913035 ) ) ( not ( = ?auto_913033 ?auto_913036 ) ) ( not ( = ?auto_913033 ?auto_913037 ) ) ( not ( = ?auto_913033 ?auto_913038 ) ) ( not ( = ?auto_913033 ?auto_913039 ) ) ( not ( = ?auto_913033 ?auto_913040 ) ) ( not ( = ?auto_913033 ?auto_913041 ) ) ( not ( = ?auto_913033 ?auto_913042 ) ) ( not ( = ?auto_913033 ?auto_913043 ) ) ( not ( = ?auto_913033 ?auto_913044 ) ) ( not ( = ?auto_913033 ?auto_913045 ) ) ( not ( = ?auto_913034 ?auto_913035 ) ) ( not ( = ?auto_913034 ?auto_913036 ) ) ( not ( = ?auto_913034 ?auto_913037 ) ) ( not ( = ?auto_913034 ?auto_913038 ) ) ( not ( = ?auto_913034 ?auto_913039 ) ) ( not ( = ?auto_913034 ?auto_913040 ) ) ( not ( = ?auto_913034 ?auto_913041 ) ) ( not ( = ?auto_913034 ?auto_913042 ) ) ( not ( = ?auto_913034 ?auto_913043 ) ) ( not ( = ?auto_913034 ?auto_913044 ) ) ( not ( = ?auto_913034 ?auto_913045 ) ) ( not ( = ?auto_913035 ?auto_913036 ) ) ( not ( = ?auto_913035 ?auto_913037 ) ) ( not ( = ?auto_913035 ?auto_913038 ) ) ( not ( = ?auto_913035 ?auto_913039 ) ) ( not ( = ?auto_913035 ?auto_913040 ) ) ( not ( = ?auto_913035 ?auto_913041 ) ) ( not ( = ?auto_913035 ?auto_913042 ) ) ( not ( = ?auto_913035 ?auto_913043 ) ) ( not ( = ?auto_913035 ?auto_913044 ) ) ( not ( = ?auto_913035 ?auto_913045 ) ) ( not ( = ?auto_913036 ?auto_913037 ) ) ( not ( = ?auto_913036 ?auto_913038 ) ) ( not ( = ?auto_913036 ?auto_913039 ) ) ( not ( = ?auto_913036 ?auto_913040 ) ) ( not ( = ?auto_913036 ?auto_913041 ) ) ( not ( = ?auto_913036 ?auto_913042 ) ) ( not ( = ?auto_913036 ?auto_913043 ) ) ( not ( = ?auto_913036 ?auto_913044 ) ) ( not ( = ?auto_913036 ?auto_913045 ) ) ( not ( = ?auto_913037 ?auto_913038 ) ) ( not ( = ?auto_913037 ?auto_913039 ) ) ( not ( = ?auto_913037 ?auto_913040 ) ) ( not ( = ?auto_913037 ?auto_913041 ) ) ( not ( = ?auto_913037 ?auto_913042 ) ) ( not ( = ?auto_913037 ?auto_913043 ) ) ( not ( = ?auto_913037 ?auto_913044 ) ) ( not ( = ?auto_913037 ?auto_913045 ) ) ( not ( = ?auto_913038 ?auto_913039 ) ) ( not ( = ?auto_913038 ?auto_913040 ) ) ( not ( = ?auto_913038 ?auto_913041 ) ) ( not ( = ?auto_913038 ?auto_913042 ) ) ( not ( = ?auto_913038 ?auto_913043 ) ) ( not ( = ?auto_913038 ?auto_913044 ) ) ( not ( = ?auto_913038 ?auto_913045 ) ) ( not ( = ?auto_913039 ?auto_913040 ) ) ( not ( = ?auto_913039 ?auto_913041 ) ) ( not ( = ?auto_913039 ?auto_913042 ) ) ( not ( = ?auto_913039 ?auto_913043 ) ) ( not ( = ?auto_913039 ?auto_913044 ) ) ( not ( = ?auto_913039 ?auto_913045 ) ) ( not ( = ?auto_913040 ?auto_913041 ) ) ( not ( = ?auto_913040 ?auto_913042 ) ) ( not ( = ?auto_913040 ?auto_913043 ) ) ( not ( = ?auto_913040 ?auto_913044 ) ) ( not ( = ?auto_913040 ?auto_913045 ) ) ( not ( = ?auto_913041 ?auto_913042 ) ) ( not ( = ?auto_913041 ?auto_913043 ) ) ( not ( = ?auto_913041 ?auto_913044 ) ) ( not ( = ?auto_913041 ?auto_913045 ) ) ( not ( = ?auto_913042 ?auto_913043 ) ) ( not ( = ?auto_913042 ?auto_913044 ) ) ( not ( = ?auto_913042 ?auto_913045 ) ) ( not ( = ?auto_913043 ?auto_913044 ) ) ( not ( = ?auto_913043 ?auto_913045 ) ) ( not ( = ?auto_913044 ?auto_913045 ) ) ( ON ?auto_913043 ?auto_913044 ) ( ON ?auto_913042 ?auto_913043 ) ( ON ?auto_913041 ?auto_913042 ) ( ON ?auto_913040 ?auto_913041 ) ( ON ?auto_913039 ?auto_913040 ) ( ON ?auto_913038 ?auto_913039 ) ( ON ?auto_913037 ?auto_913038 ) ( ON ?auto_913036 ?auto_913037 ) ( ON ?auto_913035 ?auto_913036 ) ( ON ?auto_913034 ?auto_913035 ) ( ON ?auto_913033 ?auto_913034 ) ( ON ?auto_913032 ?auto_913033 ) ( ON ?auto_913031 ?auto_913032 ) ( ON ?auto_913030 ?auto_913031 ) ( ON ?auto_913029 ?auto_913030 ) ( CLEAR ?auto_913029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_913029 )
      ( MAKE-16PILE ?auto_913029 ?auto_913030 ?auto_913031 ?auto_913032 ?auto_913033 ?auto_913034 ?auto_913035 ?auto_913036 ?auto_913037 ?auto_913038 ?auto_913039 ?auto_913040 ?auto_913041 ?auto_913042 ?auto_913043 ?auto_913044 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913096 - BLOCK
      ?auto_913097 - BLOCK
      ?auto_913098 - BLOCK
      ?auto_913099 - BLOCK
      ?auto_913100 - BLOCK
      ?auto_913101 - BLOCK
      ?auto_913102 - BLOCK
      ?auto_913103 - BLOCK
      ?auto_913104 - BLOCK
      ?auto_913105 - BLOCK
      ?auto_913106 - BLOCK
      ?auto_913107 - BLOCK
      ?auto_913108 - BLOCK
      ?auto_913109 - BLOCK
      ?auto_913110 - BLOCK
      ?auto_913111 - BLOCK
      ?auto_913112 - BLOCK
    )
    :vars
    (
      ?auto_913113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_913111 ) ( ON ?auto_913112 ?auto_913113 ) ( CLEAR ?auto_913112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_913096 ) ( ON ?auto_913097 ?auto_913096 ) ( ON ?auto_913098 ?auto_913097 ) ( ON ?auto_913099 ?auto_913098 ) ( ON ?auto_913100 ?auto_913099 ) ( ON ?auto_913101 ?auto_913100 ) ( ON ?auto_913102 ?auto_913101 ) ( ON ?auto_913103 ?auto_913102 ) ( ON ?auto_913104 ?auto_913103 ) ( ON ?auto_913105 ?auto_913104 ) ( ON ?auto_913106 ?auto_913105 ) ( ON ?auto_913107 ?auto_913106 ) ( ON ?auto_913108 ?auto_913107 ) ( ON ?auto_913109 ?auto_913108 ) ( ON ?auto_913110 ?auto_913109 ) ( ON ?auto_913111 ?auto_913110 ) ( not ( = ?auto_913096 ?auto_913097 ) ) ( not ( = ?auto_913096 ?auto_913098 ) ) ( not ( = ?auto_913096 ?auto_913099 ) ) ( not ( = ?auto_913096 ?auto_913100 ) ) ( not ( = ?auto_913096 ?auto_913101 ) ) ( not ( = ?auto_913096 ?auto_913102 ) ) ( not ( = ?auto_913096 ?auto_913103 ) ) ( not ( = ?auto_913096 ?auto_913104 ) ) ( not ( = ?auto_913096 ?auto_913105 ) ) ( not ( = ?auto_913096 ?auto_913106 ) ) ( not ( = ?auto_913096 ?auto_913107 ) ) ( not ( = ?auto_913096 ?auto_913108 ) ) ( not ( = ?auto_913096 ?auto_913109 ) ) ( not ( = ?auto_913096 ?auto_913110 ) ) ( not ( = ?auto_913096 ?auto_913111 ) ) ( not ( = ?auto_913096 ?auto_913112 ) ) ( not ( = ?auto_913096 ?auto_913113 ) ) ( not ( = ?auto_913097 ?auto_913098 ) ) ( not ( = ?auto_913097 ?auto_913099 ) ) ( not ( = ?auto_913097 ?auto_913100 ) ) ( not ( = ?auto_913097 ?auto_913101 ) ) ( not ( = ?auto_913097 ?auto_913102 ) ) ( not ( = ?auto_913097 ?auto_913103 ) ) ( not ( = ?auto_913097 ?auto_913104 ) ) ( not ( = ?auto_913097 ?auto_913105 ) ) ( not ( = ?auto_913097 ?auto_913106 ) ) ( not ( = ?auto_913097 ?auto_913107 ) ) ( not ( = ?auto_913097 ?auto_913108 ) ) ( not ( = ?auto_913097 ?auto_913109 ) ) ( not ( = ?auto_913097 ?auto_913110 ) ) ( not ( = ?auto_913097 ?auto_913111 ) ) ( not ( = ?auto_913097 ?auto_913112 ) ) ( not ( = ?auto_913097 ?auto_913113 ) ) ( not ( = ?auto_913098 ?auto_913099 ) ) ( not ( = ?auto_913098 ?auto_913100 ) ) ( not ( = ?auto_913098 ?auto_913101 ) ) ( not ( = ?auto_913098 ?auto_913102 ) ) ( not ( = ?auto_913098 ?auto_913103 ) ) ( not ( = ?auto_913098 ?auto_913104 ) ) ( not ( = ?auto_913098 ?auto_913105 ) ) ( not ( = ?auto_913098 ?auto_913106 ) ) ( not ( = ?auto_913098 ?auto_913107 ) ) ( not ( = ?auto_913098 ?auto_913108 ) ) ( not ( = ?auto_913098 ?auto_913109 ) ) ( not ( = ?auto_913098 ?auto_913110 ) ) ( not ( = ?auto_913098 ?auto_913111 ) ) ( not ( = ?auto_913098 ?auto_913112 ) ) ( not ( = ?auto_913098 ?auto_913113 ) ) ( not ( = ?auto_913099 ?auto_913100 ) ) ( not ( = ?auto_913099 ?auto_913101 ) ) ( not ( = ?auto_913099 ?auto_913102 ) ) ( not ( = ?auto_913099 ?auto_913103 ) ) ( not ( = ?auto_913099 ?auto_913104 ) ) ( not ( = ?auto_913099 ?auto_913105 ) ) ( not ( = ?auto_913099 ?auto_913106 ) ) ( not ( = ?auto_913099 ?auto_913107 ) ) ( not ( = ?auto_913099 ?auto_913108 ) ) ( not ( = ?auto_913099 ?auto_913109 ) ) ( not ( = ?auto_913099 ?auto_913110 ) ) ( not ( = ?auto_913099 ?auto_913111 ) ) ( not ( = ?auto_913099 ?auto_913112 ) ) ( not ( = ?auto_913099 ?auto_913113 ) ) ( not ( = ?auto_913100 ?auto_913101 ) ) ( not ( = ?auto_913100 ?auto_913102 ) ) ( not ( = ?auto_913100 ?auto_913103 ) ) ( not ( = ?auto_913100 ?auto_913104 ) ) ( not ( = ?auto_913100 ?auto_913105 ) ) ( not ( = ?auto_913100 ?auto_913106 ) ) ( not ( = ?auto_913100 ?auto_913107 ) ) ( not ( = ?auto_913100 ?auto_913108 ) ) ( not ( = ?auto_913100 ?auto_913109 ) ) ( not ( = ?auto_913100 ?auto_913110 ) ) ( not ( = ?auto_913100 ?auto_913111 ) ) ( not ( = ?auto_913100 ?auto_913112 ) ) ( not ( = ?auto_913100 ?auto_913113 ) ) ( not ( = ?auto_913101 ?auto_913102 ) ) ( not ( = ?auto_913101 ?auto_913103 ) ) ( not ( = ?auto_913101 ?auto_913104 ) ) ( not ( = ?auto_913101 ?auto_913105 ) ) ( not ( = ?auto_913101 ?auto_913106 ) ) ( not ( = ?auto_913101 ?auto_913107 ) ) ( not ( = ?auto_913101 ?auto_913108 ) ) ( not ( = ?auto_913101 ?auto_913109 ) ) ( not ( = ?auto_913101 ?auto_913110 ) ) ( not ( = ?auto_913101 ?auto_913111 ) ) ( not ( = ?auto_913101 ?auto_913112 ) ) ( not ( = ?auto_913101 ?auto_913113 ) ) ( not ( = ?auto_913102 ?auto_913103 ) ) ( not ( = ?auto_913102 ?auto_913104 ) ) ( not ( = ?auto_913102 ?auto_913105 ) ) ( not ( = ?auto_913102 ?auto_913106 ) ) ( not ( = ?auto_913102 ?auto_913107 ) ) ( not ( = ?auto_913102 ?auto_913108 ) ) ( not ( = ?auto_913102 ?auto_913109 ) ) ( not ( = ?auto_913102 ?auto_913110 ) ) ( not ( = ?auto_913102 ?auto_913111 ) ) ( not ( = ?auto_913102 ?auto_913112 ) ) ( not ( = ?auto_913102 ?auto_913113 ) ) ( not ( = ?auto_913103 ?auto_913104 ) ) ( not ( = ?auto_913103 ?auto_913105 ) ) ( not ( = ?auto_913103 ?auto_913106 ) ) ( not ( = ?auto_913103 ?auto_913107 ) ) ( not ( = ?auto_913103 ?auto_913108 ) ) ( not ( = ?auto_913103 ?auto_913109 ) ) ( not ( = ?auto_913103 ?auto_913110 ) ) ( not ( = ?auto_913103 ?auto_913111 ) ) ( not ( = ?auto_913103 ?auto_913112 ) ) ( not ( = ?auto_913103 ?auto_913113 ) ) ( not ( = ?auto_913104 ?auto_913105 ) ) ( not ( = ?auto_913104 ?auto_913106 ) ) ( not ( = ?auto_913104 ?auto_913107 ) ) ( not ( = ?auto_913104 ?auto_913108 ) ) ( not ( = ?auto_913104 ?auto_913109 ) ) ( not ( = ?auto_913104 ?auto_913110 ) ) ( not ( = ?auto_913104 ?auto_913111 ) ) ( not ( = ?auto_913104 ?auto_913112 ) ) ( not ( = ?auto_913104 ?auto_913113 ) ) ( not ( = ?auto_913105 ?auto_913106 ) ) ( not ( = ?auto_913105 ?auto_913107 ) ) ( not ( = ?auto_913105 ?auto_913108 ) ) ( not ( = ?auto_913105 ?auto_913109 ) ) ( not ( = ?auto_913105 ?auto_913110 ) ) ( not ( = ?auto_913105 ?auto_913111 ) ) ( not ( = ?auto_913105 ?auto_913112 ) ) ( not ( = ?auto_913105 ?auto_913113 ) ) ( not ( = ?auto_913106 ?auto_913107 ) ) ( not ( = ?auto_913106 ?auto_913108 ) ) ( not ( = ?auto_913106 ?auto_913109 ) ) ( not ( = ?auto_913106 ?auto_913110 ) ) ( not ( = ?auto_913106 ?auto_913111 ) ) ( not ( = ?auto_913106 ?auto_913112 ) ) ( not ( = ?auto_913106 ?auto_913113 ) ) ( not ( = ?auto_913107 ?auto_913108 ) ) ( not ( = ?auto_913107 ?auto_913109 ) ) ( not ( = ?auto_913107 ?auto_913110 ) ) ( not ( = ?auto_913107 ?auto_913111 ) ) ( not ( = ?auto_913107 ?auto_913112 ) ) ( not ( = ?auto_913107 ?auto_913113 ) ) ( not ( = ?auto_913108 ?auto_913109 ) ) ( not ( = ?auto_913108 ?auto_913110 ) ) ( not ( = ?auto_913108 ?auto_913111 ) ) ( not ( = ?auto_913108 ?auto_913112 ) ) ( not ( = ?auto_913108 ?auto_913113 ) ) ( not ( = ?auto_913109 ?auto_913110 ) ) ( not ( = ?auto_913109 ?auto_913111 ) ) ( not ( = ?auto_913109 ?auto_913112 ) ) ( not ( = ?auto_913109 ?auto_913113 ) ) ( not ( = ?auto_913110 ?auto_913111 ) ) ( not ( = ?auto_913110 ?auto_913112 ) ) ( not ( = ?auto_913110 ?auto_913113 ) ) ( not ( = ?auto_913111 ?auto_913112 ) ) ( not ( = ?auto_913111 ?auto_913113 ) ) ( not ( = ?auto_913112 ?auto_913113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_913112 ?auto_913113 )
      ( !STACK ?auto_913112 ?auto_913111 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913166 - BLOCK
      ?auto_913167 - BLOCK
      ?auto_913168 - BLOCK
      ?auto_913169 - BLOCK
      ?auto_913170 - BLOCK
      ?auto_913171 - BLOCK
      ?auto_913172 - BLOCK
      ?auto_913173 - BLOCK
      ?auto_913174 - BLOCK
      ?auto_913175 - BLOCK
      ?auto_913176 - BLOCK
      ?auto_913177 - BLOCK
      ?auto_913178 - BLOCK
      ?auto_913179 - BLOCK
      ?auto_913180 - BLOCK
      ?auto_913181 - BLOCK
      ?auto_913182 - BLOCK
    )
    :vars
    (
      ?auto_913183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913182 ?auto_913183 ) ( ON-TABLE ?auto_913166 ) ( ON ?auto_913167 ?auto_913166 ) ( ON ?auto_913168 ?auto_913167 ) ( ON ?auto_913169 ?auto_913168 ) ( ON ?auto_913170 ?auto_913169 ) ( ON ?auto_913171 ?auto_913170 ) ( ON ?auto_913172 ?auto_913171 ) ( ON ?auto_913173 ?auto_913172 ) ( ON ?auto_913174 ?auto_913173 ) ( ON ?auto_913175 ?auto_913174 ) ( ON ?auto_913176 ?auto_913175 ) ( ON ?auto_913177 ?auto_913176 ) ( ON ?auto_913178 ?auto_913177 ) ( ON ?auto_913179 ?auto_913178 ) ( ON ?auto_913180 ?auto_913179 ) ( not ( = ?auto_913166 ?auto_913167 ) ) ( not ( = ?auto_913166 ?auto_913168 ) ) ( not ( = ?auto_913166 ?auto_913169 ) ) ( not ( = ?auto_913166 ?auto_913170 ) ) ( not ( = ?auto_913166 ?auto_913171 ) ) ( not ( = ?auto_913166 ?auto_913172 ) ) ( not ( = ?auto_913166 ?auto_913173 ) ) ( not ( = ?auto_913166 ?auto_913174 ) ) ( not ( = ?auto_913166 ?auto_913175 ) ) ( not ( = ?auto_913166 ?auto_913176 ) ) ( not ( = ?auto_913166 ?auto_913177 ) ) ( not ( = ?auto_913166 ?auto_913178 ) ) ( not ( = ?auto_913166 ?auto_913179 ) ) ( not ( = ?auto_913166 ?auto_913180 ) ) ( not ( = ?auto_913166 ?auto_913181 ) ) ( not ( = ?auto_913166 ?auto_913182 ) ) ( not ( = ?auto_913166 ?auto_913183 ) ) ( not ( = ?auto_913167 ?auto_913168 ) ) ( not ( = ?auto_913167 ?auto_913169 ) ) ( not ( = ?auto_913167 ?auto_913170 ) ) ( not ( = ?auto_913167 ?auto_913171 ) ) ( not ( = ?auto_913167 ?auto_913172 ) ) ( not ( = ?auto_913167 ?auto_913173 ) ) ( not ( = ?auto_913167 ?auto_913174 ) ) ( not ( = ?auto_913167 ?auto_913175 ) ) ( not ( = ?auto_913167 ?auto_913176 ) ) ( not ( = ?auto_913167 ?auto_913177 ) ) ( not ( = ?auto_913167 ?auto_913178 ) ) ( not ( = ?auto_913167 ?auto_913179 ) ) ( not ( = ?auto_913167 ?auto_913180 ) ) ( not ( = ?auto_913167 ?auto_913181 ) ) ( not ( = ?auto_913167 ?auto_913182 ) ) ( not ( = ?auto_913167 ?auto_913183 ) ) ( not ( = ?auto_913168 ?auto_913169 ) ) ( not ( = ?auto_913168 ?auto_913170 ) ) ( not ( = ?auto_913168 ?auto_913171 ) ) ( not ( = ?auto_913168 ?auto_913172 ) ) ( not ( = ?auto_913168 ?auto_913173 ) ) ( not ( = ?auto_913168 ?auto_913174 ) ) ( not ( = ?auto_913168 ?auto_913175 ) ) ( not ( = ?auto_913168 ?auto_913176 ) ) ( not ( = ?auto_913168 ?auto_913177 ) ) ( not ( = ?auto_913168 ?auto_913178 ) ) ( not ( = ?auto_913168 ?auto_913179 ) ) ( not ( = ?auto_913168 ?auto_913180 ) ) ( not ( = ?auto_913168 ?auto_913181 ) ) ( not ( = ?auto_913168 ?auto_913182 ) ) ( not ( = ?auto_913168 ?auto_913183 ) ) ( not ( = ?auto_913169 ?auto_913170 ) ) ( not ( = ?auto_913169 ?auto_913171 ) ) ( not ( = ?auto_913169 ?auto_913172 ) ) ( not ( = ?auto_913169 ?auto_913173 ) ) ( not ( = ?auto_913169 ?auto_913174 ) ) ( not ( = ?auto_913169 ?auto_913175 ) ) ( not ( = ?auto_913169 ?auto_913176 ) ) ( not ( = ?auto_913169 ?auto_913177 ) ) ( not ( = ?auto_913169 ?auto_913178 ) ) ( not ( = ?auto_913169 ?auto_913179 ) ) ( not ( = ?auto_913169 ?auto_913180 ) ) ( not ( = ?auto_913169 ?auto_913181 ) ) ( not ( = ?auto_913169 ?auto_913182 ) ) ( not ( = ?auto_913169 ?auto_913183 ) ) ( not ( = ?auto_913170 ?auto_913171 ) ) ( not ( = ?auto_913170 ?auto_913172 ) ) ( not ( = ?auto_913170 ?auto_913173 ) ) ( not ( = ?auto_913170 ?auto_913174 ) ) ( not ( = ?auto_913170 ?auto_913175 ) ) ( not ( = ?auto_913170 ?auto_913176 ) ) ( not ( = ?auto_913170 ?auto_913177 ) ) ( not ( = ?auto_913170 ?auto_913178 ) ) ( not ( = ?auto_913170 ?auto_913179 ) ) ( not ( = ?auto_913170 ?auto_913180 ) ) ( not ( = ?auto_913170 ?auto_913181 ) ) ( not ( = ?auto_913170 ?auto_913182 ) ) ( not ( = ?auto_913170 ?auto_913183 ) ) ( not ( = ?auto_913171 ?auto_913172 ) ) ( not ( = ?auto_913171 ?auto_913173 ) ) ( not ( = ?auto_913171 ?auto_913174 ) ) ( not ( = ?auto_913171 ?auto_913175 ) ) ( not ( = ?auto_913171 ?auto_913176 ) ) ( not ( = ?auto_913171 ?auto_913177 ) ) ( not ( = ?auto_913171 ?auto_913178 ) ) ( not ( = ?auto_913171 ?auto_913179 ) ) ( not ( = ?auto_913171 ?auto_913180 ) ) ( not ( = ?auto_913171 ?auto_913181 ) ) ( not ( = ?auto_913171 ?auto_913182 ) ) ( not ( = ?auto_913171 ?auto_913183 ) ) ( not ( = ?auto_913172 ?auto_913173 ) ) ( not ( = ?auto_913172 ?auto_913174 ) ) ( not ( = ?auto_913172 ?auto_913175 ) ) ( not ( = ?auto_913172 ?auto_913176 ) ) ( not ( = ?auto_913172 ?auto_913177 ) ) ( not ( = ?auto_913172 ?auto_913178 ) ) ( not ( = ?auto_913172 ?auto_913179 ) ) ( not ( = ?auto_913172 ?auto_913180 ) ) ( not ( = ?auto_913172 ?auto_913181 ) ) ( not ( = ?auto_913172 ?auto_913182 ) ) ( not ( = ?auto_913172 ?auto_913183 ) ) ( not ( = ?auto_913173 ?auto_913174 ) ) ( not ( = ?auto_913173 ?auto_913175 ) ) ( not ( = ?auto_913173 ?auto_913176 ) ) ( not ( = ?auto_913173 ?auto_913177 ) ) ( not ( = ?auto_913173 ?auto_913178 ) ) ( not ( = ?auto_913173 ?auto_913179 ) ) ( not ( = ?auto_913173 ?auto_913180 ) ) ( not ( = ?auto_913173 ?auto_913181 ) ) ( not ( = ?auto_913173 ?auto_913182 ) ) ( not ( = ?auto_913173 ?auto_913183 ) ) ( not ( = ?auto_913174 ?auto_913175 ) ) ( not ( = ?auto_913174 ?auto_913176 ) ) ( not ( = ?auto_913174 ?auto_913177 ) ) ( not ( = ?auto_913174 ?auto_913178 ) ) ( not ( = ?auto_913174 ?auto_913179 ) ) ( not ( = ?auto_913174 ?auto_913180 ) ) ( not ( = ?auto_913174 ?auto_913181 ) ) ( not ( = ?auto_913174 ?auto_913182 ) ) ( not ( = ?auto_913174 ?auto_913183 ) ) ( not ( = ?auto_913175 ?auto_913176 ) ) ( not ( = ?auto_913175 ?auto_913177 ) ) ( not ( = ?auto_913175 ?auto_913178 ) ) ( not ( = ?auto_913175 ?auto_913179 ) ) ( not ( = ?auto_913175 ?auto_913180 ) ) ( not ( = ?auto_913175 ?auto_913181 ) ) ( not ( = ?auto_913175 ?auto_913182 ) ) ( not ( = ?auto_913175 ?auto_913183 ) ) ( not ( = ?auto_913176 ?auto_913177 ) ) ( not ( = ?auto_913176 ?auto_913178 ) ) ( not ( = ?auto_913176 ?auto_913179 ) ) ( not ( = ?auto_913176 ?auto_913180 ) ) ( not ( = ?auto_913176 ?auto_913181 ) ) ( not ( = ?auto_913176 ?auto_913182 ) ) ( not ( = ?auto_913176 ?auto_913183 ) ) ( not ( = ?auto_913177 ?auto_913178 ) ) ( not ( = ?auto_913177 ?auto_913179 ) ) ( not ( = ?auto_913177 ?auto_913180 ) ) ( not ( = ?auto_913177 ?auto_913181 ) ) ( not ( = ?auto_913177 ?auto_913182 ) ) ( not ( = ?auto_913177 ?auto_913183 ) ) ( not ( = ?auto_913178 ?auto_913179 ) ) ( not ( = ?auto_913178 ?auto_913180 ) ) ( not ( = ?auto_913178 ?auto_913181 ) ) ( not ( = ?auto_913178 ?auto_913182 ) ) ( not ( = ?auto_913178 ?auto_913183 ) ) ( not ( = ?auto_913179 ?auto_913180 ) ) ( not ( = ?auto_913179 ?auto_913181 ) ) ( not ( = ?auto_913179 ?auto_913182 ) ) ( not ( = ?auto_913179 ?auto_913183 ) ) ( not ( = ?auto_913180 ?auto_913181 ) ) ( not ( = ?auto_913180 ?auto_913182 ) ) ( not ( = ?auto_913180 ?auto_913183 ) ) ( not ( = ?auto_913181 ?auto_913182 ) ) ( not ( = ?auto_913181 ?auto_913183 ) ) ( not ( = ?auto_913182 ?auto_913183 ) ) ( CLEAR ?auto_913180 ) ( ON ?auto_913181 ?auto_913182 ) ( CLEAR ?auto_913181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_913166 ?auto_913167 ?auto_913168 ?auto_913169 ?auto_913170 ?auto_913171 ?auto_913172 ?auto_913173 ?auto_913174 ?auto_913175 ?auto_913176 ?auto_913177 ?auto_913178 ?auto_913179 ?auto_913180 ?auto_913181 )
      ( MAKE-17PILE ?auto_913166 ?auto_913167 ?auto_913168 ?auto_913169 ?auto_913170 ?auto_913171 ?auto_913172 ?auto_913173 ?auto_913174 ?auto_913175 ?auto_913176 ?auto_913177 ?auto_913178 ?auto_913179 ?auto_913180 ?auto_913181 ?auto_913182 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913236 - BLOCK
      ?auto_913237 - BLOCK
      ?auto_913238 - BLOCK
      ?auto_913239 - BLOCK
      ?auto_913240 - BLOCK
      ?auto_913241 - BLOCK
      ?auto_913242 - BLOCK
      ?auto_913243 - BLOCK
      ?auto_913244 - BLOCK
      ?auto_913245 - BLOCK
      ?auto_913246 - BLOCK
      ?auto_913247 - BLOCK
      ?auto_913248 - BLOCK
      ?auto_913249 - BLOCK
      ?auto_913250 - BLOCK
      ?auto_913251 - BLOCK
      ?auto_913252 - BLOCK
    )
    :vars
    (
      ?auto_913253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913252 ?auto_913253 ) ( ON-TABLE ?auto_913236 ) ( ON ?auto_913237 ?auto_913236 ) ( ON ?auto_913238 ?auto_913237 ) ( ON ?auto_913239 ?auto_913238 ) ( ON ?auto_913240 ?auto_913239 ) ( ON ?auto_913241 ?auto_913240 ) ( ON ?auto_913242 ?auto_913241 ) ( ON ?auto_913243 ?auto_913242 ) ( ON ?auto_913244 ?auto_913243 ) ( ON ?auto_913245 ?auto_913244 ) ( ON ?auto_913246 ?auto_913245 ) ( ON ?auto_913247 ?auto_913246 ) ( ON ?auto_913248 ?auto_913247 ) ( ON ?auto_913249 ?auto_913248 ) ( not ( = ?auto_913236 ?auto_913237 ) ) ( not ( = ?auto_913236 ?auto_913238 ) ) ( not ( = ?auto_913236 ?auto_913239 ) ) ( not ( = ?auto_913236 ?auto_913240 ) ) ( not ( = ?auto_913236 ?auto_913241 ) ) ( not ( = ?auto_913236 ?auto_913242 ) ) ( not ( = ?auto_913236 ?auto_913243 ) ) ( not ( = ?auto_913236 ?auto_913244 ) ) ( not ( = ?auto_913236 ?auto_913245 ) ) ( not ( = ?auto_913236 ?auto_913246 ) ) ( not ( = ?auto_913236 ?auto_913247 ) ) ( not ( = ?auto_913236 ?auto_913248 ) ) ( not ( = ?auto_913236 ?auto_913249 ) ) ( not ( = ?auto_913236 ?auto_913250 ) ) ( not ( = ?auto_913236 ?auto_913251 ) ) ( not ( = ?auto_913236 ?auto_913252 ) ) ( not ( = ?auto_913236 ?auto_913253 ) ) ( not ( = ?auto_913237 ?auto_913238 ) ) ( not ( = ?auto_913237 ?auto_913239 ) ) ( not ( = ?auto_913237 ?auto_913240 ) ) ( not ( = ?auto_913237 ?auto_913241 ) ) ( not ( = ?auto_913237 ?auto_913242 ) ) ( not ( = ?auto_913237 ?auto_913243 ) ) ( not ( = ?auto_913237 ?auto_913244 ) ) ( not ( = ?auto_913237 ?auto_913245 ) ) ( not ( = ?auto_913237 ?auto_913246 ) ) ( not ( = ?auto_913237 ?auto_913247 ) ) ( not ( = ?auto_913237 ?auto_913248 ) ) ( not ( = ?auto_913237 ?auto_913249 ) ) ( not ( = ?auto_913237 ?auto_913250 ) ) ( not ( = ?auto_913237 ?auto_913251 ) ) ( not ( = ?auto_913237 ?auto_913252 ) ) ( not ( = ?auto_913237 ?auto_913253 ) ) ( not ( = ?auto_913238 ?auto_913239 ) ) ( not ( = ?auto_913238 ?auto_913240 ) ) ( not ( = ?auto_913238 ?auto_913241 ) ) ( not ( = ?auto_913238 ?auto_913242 ) ) ( not ( = ?auto_913238 ?auto_913243 ) ) ( not ( = ?auto_913238 ?auto_913244 ) ) ( not ( = ?auto_913238 ?auto_913245 ) ) ( not ( = ?auto_913238 ?auto_913246 ) ) ( not ( = ?auto_913238 ?auto_913247 ) ) ( not ( = ?auto_913238 ?auto_913248 ) ) ( not ( = ?auto_913238 ?auto_913249 ) ) ( not ( = ?auto_913238 ?auto_913250 ) ) ( not ( = ?auto_913238 ?auto_913251 ) ) ( not ( = ?auto_913238 ?auto_913252 ) ) ( not ( = ?auto_913238 ?auto_913253 ) ) ( not ( = ?auto_913239 ?auto_913240 ) ) ( not ( = ?auto_913239 ?auto_913241 ) ) ( not ( = ?auto_913239 ?auto_913242 ) ) ( not ( = ?auto_913239 ?auto_913243 ) ) ( not ( = ?auto_913239 ?auto_913244 ) ) ( not ( = ?auto_913239 ?auto_913245 ) ) ( not ( = ?auto_913239 ?auto_913246 ) ) ( not ( = ?auto_913239 ?auto_913247 ) ) ( not ( = ?auto_913239 ?auto_913248 ) ) ( not ( = ?auto_913239 ?auto_913249 ) ) ( not ( = ?auto_913239 ?auto_913250 ) ) ( not ( = ?auto_913239 ?auto_913251 ) ) ( not ( = ?auto_913239 ?auto_913252 ) ) ( not ( = ?auto_913239 ?auto_913253 ) ) ( not ( = ?auto_913240 ?auto_913241 ) ) ( not ( = ?auto_913240 ?auto_913242 ) ) ( not ( = ?auto_913240 ?auto_913243 ) ) ( not ( = ?auto_913240 ?auto_913244 ) ) ( not ( = ?auto_913240 ?auto_913245 ) ) ( not ( = ?auto_913240 ?auto_913246 ) ) ( not ( = ?auto_913240 ?auto_913247 ) ) ( not ( = ?auto_913240 ?auto_913248 ) ) ( not ( = ?auto_913240 ?auto_913249 ) ) ( not ( = ?auto_913240 ?auto_913250 ) ) ( not ( = ?auto_913240 ?auto_913251 ) ) ( not ( = ?auto_913240 ?auto_913252 ) ) ( not ( = ?auto_913240 ?auto_913253 ) ) ( not ( = ?auto_913241 ?auto_913242 ) ) ( not ( = ?auto_913241 ?auto_913243 ) ) ( not ( = ?auto_913241 ?auto_913244 ) ) ( not ( = ?auto_913241 ?auto_913245 ) ) ( not ( = ?auto_913241 ?auto_913246 ) ) ( not ( = ?auto_913241 ?auto_913247 ) ) ( not ( = ?auto_913241 ?auto_913248 ) ) ( not ( = ?auto_913241 ?auto_913249 ) ) ( not ( = ?auto_913241 ?auto_913250 ) ) ( not ( = ?auto_913241 ?auto_913251 ) ) ( not ( = ?auto_913241 ?auto_913252 ) ) ( not ( = ?auto_913241 ?auto_913253 ) ) ( not ( = ?auto_913242 ?auto_913243 ) ) ( not ( = ?auto_913242 ?auto_913244 ) ) ( not ( = ?auto_913242 ?auto_913245 ) ) ( not ( = ?auto_913242 ?auto_913246 ) ) ( not ( = ?auto_913242 ?auto_913247 ) ) ( not ( = ?auto_913242 ?auto_913248 ) ) ( not ( = ?auto_913242 ?auto_913249 ) ) ( not ( = ?auto_913242 ?auto_913250 ) ) ( not ( = ?auto_913242 ?auto_913251 ) ) ( not ( = ?auto_913242 ?auto_913252 ) ) ( not ( = ?auto_913242 ?auto_913253 ) ) ( not ( = ?auto_913243 ?auto_913244 ) ) ( not ( = ?auto_913243 ?auto_913245 ) ) ( not ( = ?auto_913243 ?auto_913246 ) ) ( not ( = ?auto_913243 ?auto_913247 ) ) ( not ( = ?auto_913243 ?auto_913248 ) ) ( not ( = ?auto_913243 ?auto_913249 ) ) ( not ( = ?auto_913243 ?auto_913250 ) ) ( not ( = ?auto_913243 ?auto_913251 ) ) ( not ( = ?auto_913243 ?auto_913252 ) ) ( not ( = ?auto_913243 ?auto_913253 ) ) ( not ( = ?auto_913244 ?auto_913245 ) ) ( not ( = ?auto_913244 ?auto_913246 ) ) ( not ( = ?auto_913244 ?auto_913247 ) ) ( not ( = ?auto_913244 ?auto_913248 ) ) ( not ( = ?auto_913244 ?auto_913249 ) ) ( not ( = ?auto_913244 ?auto_913250 ) ) ( not ( = ?auto_913244 ?auto_913251 ) ) ( not ( = ?auto_913244 ?auto_913252 ) ) ( not ( = ?auto_913244 ?auto_913253 ) ) ( not ( = ?auto_913245 ?auto_913246 ) ) ( not ( = ?auto_913245 ?auto_913247 ) ) ( not ( = ?auto_913245 ?auto_913248 ) ) ( not ( = ?auto_913245 ?auto_913249 ) ) ( not ( = ?auto_913245 ?auto_913250 ) ) ( not ( = ?auto_913245 ?auto_913251 ) ) ( not ( = ?auto_913245 ?auto_913252 ) ) ( not ( = ?auto_913245 ?auto_913253 ) ) ( not ( = ?auto_913246 ?auto_913247 ) ) ( not ( = ?auto_913246 ?auto_913248 ) ) ( not ( = ?auto_913246 ?auto_913249 ) ) ( not ( = ?auto_913246 ?auto_913250 ) ) ( not ( = ?auto_913246 ?auto_913251 ) ) ( not ( = ?auto_913246 ?auto_913252 ) ) ( not ( = ?auto_913246 ?auto_913253 ) ) ( not ( = ?auto_913247 ?auto_913248 ) ) ( not ( = ?auto_913247 ?auto_913249 ) ) ( not ( = ?auto_913247 ?auto_913250 ) ) ( not ( = ?auto_913247 ?auto_913251 ) ) ( not ( = ?auto_913247 ?auto_913252 ) ) ( not ( = ?auto_913247 ?auto_913253 ) ) ( not ( = ?auto_913248 ?auto_913249 ) ) ( not ( = ?auto_913248 ?auto_913250 ) ) ( not ( = ?auto_913248 ?auto_913251 ) ) ( not ( = ?auto_913248 ?auto_913252 ) ) ( not ( = ?auto_913248 ?auto_913253 ) ) ( not ( = ?auto_913249 ?auto_913250 ) ) ( not ( = ?auto_913249 ?auto_913251 ) ) ( not ( = ?auto_913249 ?auto_913252 ) ) ( not ( = ?auto_913249 ?auto_913253 ) ) ( not ( = ?auto_913250 ?auto_913251 ) ) ( not ( = ?auto_913250 ?auto_913252 ) ) ( not ( = ?auto_913250 ?auto_913253 ) ) ( not ( = ?auto_913251 ?auto_913252 ) ) ( not ( = ?auto_913251 ?auto_913253 ) ) ( not ( = ?auto_913252 ?auto_913253 ) ) ( ON ?auto_913251 ?auto_913252 ) ( CLEAR ?auto_913249 ) ( ON ?auto_913250 ?auto_913251 ) ( CLEAR ?auto_913250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_913236 ?auto_913237 ?auto_913238 ?auto_913239 ?auto_913240 ?auto_913241 ?auto_913242 ?auto_913243 ?auto_913244 ?auto_913245 ?auto_913246 ?auto_913247 ?auto_913248 ?auto_913249 ?auto_913250 )
      ( MAKE-17PILE ?auto_913236 ?auto_913237 ?auto_913238 ?auto_913239 ?auto_913240 ?auto_913241 ?auto_913242 ?auto_913243 ?auto_913244 ?auto_913245 ?auto_913246 ?auto_913247 ?auto_913248 ?auto_913249 ?auto_913250 ?auto_913251 ?auto_913252 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913306 - BLOCK
      ?auto_913307 - BLOCK
      ?auto_913308 - BLOCK
      ?auto_913309 - BLOCK
      ?auto_913310 - BLOCK
      ?auto_913311 - BLOCK
      ?auto_913312 - BLOCK
      ?auto_913313 - BLOCK
      ?auto_913314 - BLOCK
      ?auto_913315 - BLOCK
      ?auto_913316 - BLOCK
      ?auto_913317 - BLOCK
      ?auto_913318 - BLOCK
      ?auto_913319 - BLOCK
      ?auto_913320 - BLOCK
      ?auto_913321 - BLOCK
      ?auto_913322 - BLOCK
    )
    :vars
    (
      ?auto_913323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913322 ?auto_913323 ) ( ON-TABLE ?auto_913306 ) ( ON ?auto_913307 ?auto_913306 ) ( ON ?auto_913308 ?auto_913307 ) ( ON ?auto_913309 ?auto_913308 ) ( ON ?auto_913310 ?auto_913309 ) ( ON ?auto_913311 ?auto_913310 ) ( ON ?auto_913312 ?auto_913311 ) ( ON ?auto_913313 ?auto_913312 ) ( ON ?auto_913314 ?auto_913313 ) ( ON ?auto_913315 ?auto_913314 ) ( ON ?auto_913316 ?auto_913315 ) ( ON ?auto_913317 ?auto_913316 ) ( ON ?auto_913318 ?auto_913317 ) ( not ( = ?auto_913306 ?auto_913307 ) ) ( not ( = ?auto_913306 ?auto_913308 ) ) ( not ( = ?auto_913306 ?auto_913309 ) ) ( not ( = ?auto_913306 ?auto_913310 ) ) ( not ( = ?auto_913306 ?auto_913311 ) ) ( not ( = ?auto_913306 ?auto_913312 ) ) ( not ( = ?auto_913306 ?auto_913313 ) ) ( not ( = ?auto_913306 ?auto_913314 ) ) ( not ( = ?auto_913306 ?auto_913315 ) ) ( not ( = ?auto_913306 ?auto_913316 ) ) ( not ( = ?auto_913306 ?auto_913317 ) ) ( not ( = ?auto_913306 ?auto_913318 ) ) ( not ( = ?auto_913306 ?auto_913319 ) ) ( not ( = ?auto_913306 ?auto_913320 ) ) ( not ( = ?auto_913306 ?auto_913321 ) ) ( not ( = ?auto_913306 ?auto_913322 ) ) ( not ( = ?auto_913306 ?auto_913323 ) ) ( not ( = ?auto_913307 ?auto_913308 ) ) ( not ( = ?auto_913307 ?auto_913309 ) ) ( not ( = ?auto_913307 ?auto_913310 ) ) ( not ( = ?auto_913307 ?auto_913311 ) ) ( not ( = ?auto_913307 ?auto_913312 ) ) ( not ( = ?auto_913307 ?auto_913313 ) ) ( not ( = ?auto_913307 ?auto_913314 ) ) ( not ( = ?auto_913307 ?auto_913315 ) ) ( not ( = ?auto_913307 ?auto_913316 ) ) ( not ( = ?auto_913307 ?auto_913317 ) ) ( not ( = ?auto_913307 ?auto_913318 ) ) ( not ( = ?auto_913307 ?auto_913319 ) ) ( not ( = ?auto_913307 ?auto_913320 ) ) ( not ( = ?auto_913307 ?auto_913321 ) ) ( not ( = ?auto_913307 ?auto_913322 ) ) ( not ( = ?auto_913307 ?auto_913323 ) ) ( not ( = ?auto_913308 ?auto_913309 ) ) ( not ( = ?auto_913308 ?auto_913310 ) ) ( not ( = ?auto_913308 ?auto_913311 ) ) ( not ( = ?auto_913308 ?auto_913312 ) ) ( not ( = ?auto_913308 ?auto_913313 ) ) ( not ( = ?auto_913308 ?auto_913314 ) ) ( not ( = ?auto_913308 ?auto_913315 ) ) ( not ( = ?auto_913308 ?auto_913316 ) ) ( not ( = ?auto_913308 ?auto_913317 ) ) ( not ( = ?auto_913308 ?auto_913318 ) ) ( not ( = ?auto_913308 ?auto_913319 ) ) ( not ( = ?auto_913308 ?auto_913320 ) ) ( not ( = ?auto_913308 ?auto_913321 ) ) ( not ( = ?auto_913308 ?auto_913322 ) ) ( not ( = ?auto_913308 ?auto_913323 ) ) ( not ( = ?auto_913309 ?auto_913310 ) ) ( not ( = ?auto_913309 ?auto_913311 ) ) ( not ( = ?auto_913309 ?auto_913312 ) ) ( not ( = ?auto_913309 ?auto_913313 ) ) ( not ( = ?auto_913309 ?auto_913314 ) ) ( not ( = ?auto_913309 ?auto_913315 ) ) ( not ( = ?auto_913309 ?auto_913316 ) ) ( not ( = ?auto_913309 ?auto_913317 ) ) ( not ( = ?auto_913309 ?auto_913318 ) ) ( not ( = ?auto_913309 ?auto_913319 ) ) ( not ( = ?auto_913309 ?auto_913320 ) ) ( not ( = ?auto_913309 ?auto_913321 ) ) ( not ( = ?auto_913309 ?auto_913322 ) ) ( not ( = ?auto_913309 ?auto_913323 ) ) ( not ( = ?auto_913310 ?auto_913311 ) ) ( not ( = ?auto_913310 ?auto_913312 ) ) ( not ( = ?auto_913310 ?auto_913313 ) ) ( not ( = ?auto_913310 ?auto_913314 ) ) ( not ( = ?auto_913310 ?auto_913315 ) ) ( not ( = ?auto_913310 ?auto_913316 ) ) ( not ( = ?auto_913310 ?auto_913317 ) ) ( not ( = ?auto_913310 ?auto_913318 ) ) ( not ( = ?auto_913310 ?auto_913319 ) ) ( not ( = ?auto_913310 ?auto_913320 ) ) ( not ( = ?auto_913310 ?auto_913321 ) ) ( not ( = ?auto_913310 ?auto_913322 ) ) ( not ( = ?auto_913310 ?auto_913323 ) ) ( not ( = ?auto_913311 ?auto_913312 ) ) ( not ( = ?auto_913311 ?auto_913313 ) ) ( not ( = ?auto_913311 ?auto_913314 ) ) ( not ( = ?auto_913311 ?auto_913315 ) ) ( not ( = ?auto_913311 ?auto_913316 ) ) ( not ( = ?auto_913311 ?auto_913317 ) ) ( not ( = ?auto_913311 ?auto_913318 ) ) ( not ( = ?auto_913311 ?auto_913319 ) ) ( not ( = ?auto_913311 ?auto_913320 ) ) ( not ( = ?auto_913311 ?auto_913321 ) ) ( not ( = ?auto_913311 ?auto_913322 ) ) ( not ( = ?auto_913311 ?auto_913323 ) ) ( not ( = ?auto_913312 ?auto_913313 ) ) ( not ( = ?auto_913312 ?auto_913314 ) ) ( not ( = ?auto_913312 ?auto_913315 ) ) ( not ( = ?auto_913312 ?auto_913316 ) ) ( not ( = ?auto_913312 ?auto_913317 ) ) ( not ( = ?auto_913312 ?auto_913318 ) ) ( not ( = ?auto_913312 ?auto_913319 ) ) ( not ( = ?auto_913312 ?auto_913320 ) ) ( not ( = ?auto_913312 ?auto_913321 ) ) ( not ( = ?auto_913312 ?auto_913322 ) ) ( not ( = ?auto_913312 ?auto_913323 ) ) ( not ( = ?auto_913313 ?auto_913314 ) ) ( not ( = ?auto_913313 ?auto_913315 ) ) ( not ( = ?auto_913313 ?auto_913316 ) ) ( not ( = ?auto_913313 ?auto_913317 ) ) ( not ( = ?auto_913313 ?auto_913318 ) ) ( not ( = ?auto_913313 ?auto_913319 ) ) ( not ( = ?auto_913313 ?auto_913320 ) ) ( not ( = ?auto_913313 ?auto_913321 ) ) ( not ( = ?auto_913313 ?auto_913322 ) ) ( not ( = ?auto_913313 ?auto_913323 ) ) ( not ( = ?auto_913314 ?auto_913315 ) ) ( not ( = ?auto_913314 ?auto_913316 ) ) ( not ( = ?auto_913314 ?auto_913317 ) ) ( not ( = ?auto_913314 ?auto_913318 ) ) ( not ( = ?auto_913314 ?auto_913319 ) ) ( not ( = ?auto_913314 ?auto_913320 ) ) ( not ( = ?auto_913314 ?auto_913321 ) ) ( not ( = ?auto_913314 ?auto_913322 ) ) ( not ( = ?auto_913314 ?auto_913323 ) ) ( not ( = ?auto_913315 ?auto_913316 ) ) ( not ( = ?auto_913315 ?auto_913317 ) ) ( not ( = ?auto_913315 ?auto_913318 ) ) ( not ( = ?auto_913315 ?auto_913319 ) ) ( not ( = ?auto_913315 ?auto_913320 ) ) ( not ( = ?auto_913315 ?auto_913321 ) ) ( not ( = ?auto_913315 ?auto_913322 ) ) ( not ( = ?auto_913315 ?auto_913323 ) ) ( not ( = ?auto_913316 ?auto_913317 ) ) ( not ( = ?auto_913316 ?auto_913318 ) ) ( not ( = ?auto_913316 ?auto_913319 ) ) ( not ( = ?auto_913316 ?auto_913320 ) ) ( not ( = ?auto_913316 ?auto_913321 ) ) ( not ( = ?auto_913316 ?auto_913322 ) ) ( not ( = ?auto_913316 ?auto_913323 ) ) ( not ( = ?auto_913317 ?auto_913318 ) ) ( not ( = ?auto_913317 ?auto_913319 ) ) ( not ( = ?auto_913317 ?auto_913320 ) ) ( not ( = ?auto_913317 ?auto_913321 ) ) ( not ( = ?auto_913317 ?auto_913322 ) ) ( not ( = ?auto_913317 ?auto_913323 ) ) ( not ( = ?auto_913318 ?auto_913319 ) ) ( not ( = ?auto_913318 ?auto_913320 ) ) ( not ( = ?auto_913318 ?auto_913321 ) ) ( not ( = ?auto_913318 ?auto_913322 ) ) ( not ( = ?auto_913318 ?auto_913323 ) ) ( not ( = ?auto_913319 ?auto_913320 ) ) ( not ( = ?auto_913319 ?auto_913321 ) ) ( not ( = ?auto_913319 ?auto_913322 ) ) ( not ( = ?auto_913319 ?auto_913323 ) ) ( not ( = ?auto_913320 ?auto_913321 ) ) ( not ( = ?auto_913320 ?auto_913322 ) ) ( not ( = ?auto_913320 ?auto_913323 ) ) ( not ( = ?auto_913321 ?auto_913322 ) ) ( not ( = ?auto_913321 ?auto_913323 ) ) ( not ( = ?auto_913322 ?auto_913323 ) ) ( ON ?auto_913321 ?auto_913322 ) ( ON ?auto_913320 ?auto_913321 ) ( CLEAR ?auto_913318 ) ( ON ?auto_913319 ?auto_913320 ) ( CLEAR ?auto_913319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_913306 ?auto_913307 ?auto_913308 ?auto_913309 ?auto_913310 ?auto_913311 ?auto_913312 ?auto_913313 ?auto_913314 ?auto_913315 ?auto_913316 ?auto_913317 ?auto_913318 ?auto_913319 )
      ( MAKE-17PILE ?auto_913306 ?auto_913307 ?auto_913308 ?auto_913309 ?auto_913310 ?auto_913311 ?auto_913312 ?auto_913313 ?auto_913314 ?auto_913315 ?auto_913316 ?auto_913317 ?auto_913318 ?auto_913319 ?auto_913320 ?auto_913321 ?auto_913322 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913376 - BLOCK
      ?auto_913377 - BLOCK
      ?auto_913378 - BLOCK
      ?auto_913379 - BLOCK
      ?auto_913380 - BLOCK
      ?auto_913381 - BLOCK
      ?auto_913382 - BLOCK
      ?auto_913383 - BLOCK
      ?auto_913384 - BLOCK
      ?auto_913385 - BLOCK
      ?auto_913386 - BLOCK
      ?auto_913387 - BLOCK
      ?auto_913388 - BLOCK
      ?auto_913389 - BLOCK
      ?auto_913390 - BLOCK
      ?auto_913391 - BLOCK
      ?auto_913392 - BLOCK
    )
    :vars
    (
      ?auto_913393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913392 ?auto_913393 ) ( ON-TABLE ?auto_913376 ) ( ON ?auto_913377 ?auto_913376 ) ( ON ?auto_913378 ?auto_913377 ) ( ON ?auto_913379 ?auto_913378 ) ( ON ?auto_913380 ?auto_913379 ) ( ON ?auto_913381 ?auto_913380 ) ( ON ?auto_913382 ?auto_913381 ) ( ON ?auto_913383 ?auto_913382 ) ( ON ?auto_913384 ?auto_913383 ) ( ON ?auto_913385 ?auto_913384 ) ( ON ?auto_913386 ?auto_913385 ) ( ON ?auto_913387 ?auto_913386 ) ( not ( = ?auto_913376 ?auto_913377 ) ) ( not ( = ?auto_913376 ?auto_913378 ) ) ( not ( = ?auto_913376 ?auto_913379 ) ) ( not ( = ?auto_913376 ?auto_913380 ) ) ( not ( = ?auto_913376 ?auto_913381 ) ) ( not ( = ?auto_913376 ?auto_913382 ) ) ( not ( = ?auto_913376 ?auto_913383 ) ) ( not ( = ?auto_913376 ?auto_913384 ) ) ( not ( = ?auto_913376 ?auto_913385 ) ) ( not ( = ?auto_913376 ?auto_913386 ) ) ( not ( = ?auto_913376 ?auto_913387 ) ) ( not ( = ?auto_913376 ?auto_913388 ) ) ( not ( = ?auto_913376 ?auto_913389 ) ) ( not ( = ?auto_913376 ?auto_913390 ) ) ( not ( = ?auto_913376 ?auto_913391 ) ) ( not ( = ?auto_913376 ?auto_913392 ) ) ( not ( = ?auto_913376 ?auto_913393 ) ) ( not ( = ?auto_913377 ?auto_913378 ) ) ( not ( = ?auto_913377 ?auto_913379 ) ) ( not ( = ?auto_913377 ?auto_913380 ) ) ( not ( = ?auto_913377 ?auto_913381 ) ) ( not ( = ?auto_913377 ?auto_913382 ) ) ( not ( = ?auto_913377 ?auto_913383 ) ) ( not ( = ?auto_913377 ?auto_913384 ) ) ( not ( = ?auto_913377 ?auto_913385 ) ) ( not ( = ?auto_913377 ?auto_913386 ) ) ( not ( = ?auto_913377 ?auto_913387 ) ) ( not ( = ?auto_913377 ?auto_913388 ) ) ( not ( = ?auto_913377 ?auto_913389 ) ) ( not ( = ?auto_913377 ?auto_913390 ) ) ( not ( = ?auto_913377 ?auto_913391 ) ) ( not ( = ?auto_913377 ?auto_913392 ) ) ( not ( = ?auto_913377 ?auto_913393 ) ) ( not ( = ?auto_913378 ?auto_913379 ) ) ( not ( = ?auto_913378 ?auto_913380 ) ) ( not ( = ?auto_913378 ?auto_913381 ) ) ( not ( = ?auto_913378 ?auto_913382 ) ) ( not ( = ?auto_913378 ?auto_913383 ) ) ( not ( = ?auto_913378 ?auto_913384 ) ) ( not ( = ?auto_913378 ?auto_913385 ) ) ( not ( = ?auto_913378 ?auto_913386 ) ) ( not ( = ?auto_913378 ?auto_913387 ) ) ( not ( = ?auto_913378 ?auto_913388 ) ) ( not ( = ?auto_913378 ?auto_913389 ) ) ( not ( = ?auto_913378 ?auto_913390 ) ) ( not ( = ?auto_913378 ?auto_913391 ) ) ( not ( = ?auto_913378 ?auto_913392 ) ) ( not ( = ?auto_913378 ?auto_913393 ) ) ( not ( = ?auto_913379 ?auto_913380 ) ) ( not ( = ?auto_913379 ?auto_913381 ) ) ( not ( = ?auto_913379 ?auto_913382 ) ) ( not ( = ?auto_913379 ?auto_913383 ) ) ( not ( = ?auto_913379 ?auto_913384 ) ) ( not ( = ?auto_913379 ?auto_913385 ) ) ( not ( = ?auto_913379 ?auto_913386 ) ) ( not ( = ?auto_913379 ?auto_913387 ) ) ( not ( = ?auto_913379 ?auto_913388 ) ) ( not ( = ?auto_913379 ?auto_913389 ) ) ( not ( = ?auto_913379 ?auto_913390 ) ) ( not ( = ?auto_913379 ?auto_913391 ) ) ( not ( = ?auto_913379 ?auto_913392 ) ) ( not ( = ?auto_913379 ?auto_913393 ) ) ( not ( = ?auto_913380 ?auto_913381 ) ) ( not ( = ?auto_913380 ?auto_913382 ) ) ( not ( = ?auto_913380 ?auto_913383 ) ) ( not ( = ?auto_913380 ?auto_913384 ) ) ( not ( = ?auto_913380 ?auto_913385 ) ) ( not ( = ?auto_913380 ?auto_913386 ) ) ( not ( = ?auto_913380 ?auto_913387 ) ) ( not ( = ?auto_913380 ?auto_913388 ) ) ( not ( = ?auto_913380 ?auto_913389 ) ) ( not ( = ?auto_913380 ?auto_913390 ) ) ( not ( = ?auto_913380 ?auto_913391 ) ) ( not ( = ?auto_913380 ?auto_913392 ) ) ( not ( = ?auto_913380 ?auto_913393 ) ) ( not ( = ?auto_913381 ?auto_913382 ) ) ( not ( = ?auto_913381 ?auto_913383 ) ) ( not ( = ?auto_913381 ?auto_913384 ) ) ( not ( = ?auto_913381 ?auto_913385 ) ) ( not ( = ?auto_913381 ?auto_913386 ) ) ( not ( = ?auto_913381 ?auto_913387 ) ) ( not ( = ?auto_913381 ?auto_913388 ) ) ( not ( = ?auto_913381 ?auto_913389 ) ) ( not ( = ?auto_913381 ?auto_913390 ) ) ( not ( = ?auto_913381 ?auto_913391 ) ) ( not ( = ?auto_913381 ?auto_913392 ) ) ( not ( = ?auto_913381 ?auto_913393 ) ) ( not ( = ?auto_913382 ?auto_913383 ) ) ( not ( = ?auto_913382 ?auto_913384 ) ) ( not ( = ?auto_913382 ?auto_913385 ) ) ( not ( = ?auto_913382 ?auto_913386 ) ) ( not ( = ?auto_913382 ?auto_913387 ) ) ( not ( = ?auto_913382 ?auto_913388 ) ) ( not ( = ?auto_913382 ?auto_913389 ) ) ( not ( = ?auto_913382 ?auto_913390 ) ) ( not ( = ?auto_913382 ?auto_913391 ) ) ( not ( = ?auto_913382 ?auto_913392 ) ) ( not ( = ?auto_913382 ?auto_913393 ) ) ( not ( = ?auto_913383 ?auto_913384 ) ) ( not ( = ?auto_913383 ?auto_913385 ) ) ( not ( = ?auto_913383 ?auto_913386 ) ) ( not ( = ?auto_913383 ?auto_913387 ) ) ( not ( = ?auto_913383 ?auto_913388 ) ) ( not ( = ?auto_913383 ?auto_913389 ) ) ( not ( = ?auto_913383 ?auto_913390 ) ) ( not ( = ?auto_913383 ?auto_913391 ) ) ( not ( = ?auto_913383 ?auto_913392 ) ) ( not ( = ?auto_913383 ?auto_913393 ) ) ( not ( = ?auto_913384 ?auto_913385 ) ) ( not ( = ?auto_913384 ?auto_913386 ) ) ( not ( = ?auto_913384 ?auto_913387 ) ) ( not ( = ?auto_913384 ?auto_913388 ) ) ( not ( = ?auto_913384 ?auto_913389 ) ) ( not ( = ?auto_913384 ?auto_913390 ) ) ( not ( = ?auto_913384 ?auto_913391 ) ) ( not ( = ?auto_913384 ?auto_913392 ) ) ( not ( = ?auto_913384 ?auto_913393 ) ) ( not ( = ?auto_913385 ?auto_913386 ) ) ( not ( = ?auto_913385 ?auto_913387 ) ) ( not ( = ?auto_913385 ?auto_913388 ) ) ( not ( = ?auto_913385 ?auto_913389 ) ) ( not ( = ?auto_913385 ?auto_913390 ) ) ( not ( = ?auto_913385 ?auto_913391 ) ) ( not ( = ?auto_913385 ?auto_913392 ) ) ( not ( = ?auto_913385 ?auto_913393 ) ) ( not ( = ?auto_913386 ?auto_913387 ) ) ( not ( = ?auto_913386 ?auto_913388 ) ) ( not ( = ?auto_913386 ?auto_913389 ) ) ( not ( = ?auto_913386 ?auto_913390 ) ) ( not ( = ?auto_913386 ?auto_913391 ) ) ( not ( = ?auto_913386 ?auto_913392 ) ) ( not ( = ?auto_913386 ?auto_913393 ) ) ( not ( = ?auto_913387 ?auto_913388 ) ) ( not ( = ?auto_913387 ?auto_913389 ) ) ( not ( = ?auto_913387 ?auto_913390 ) ) ( not ( = ?auto_913387 ?auto_913391 ) ) ( not ( = ?auto_913387 ?auto_913392 ) ) ( not ( = ?auto_913387 ?auto_913393 ) ) ( not ( = ?auto_913388 ?auto_913389 ) ) ( not ( = ?auto_913388 ?auto_913390 ) ) ( not ( = ?auto_913388 ?auto_913391 ) ) ( not ( = ?auto_913388 ?auto_913392 ) ) ( not ( = ?auto_913388 ?auto_913393 ) ) ( not ( = ?auto_913389 ?auto_913390 ) ) ( not ( = ?auto_913389 ?auto_913391 ) ) ( not ( = ?auto_913389 ?auto_913392 ) ) ( not ( = ?auto_913389 ?auto_913393 ) ) ( not ( = ?auto_913390 ?auto_913391 ) ) ( not ( = ?auto_913390 ?auto_913392 ) ) ( not ( = ?auto_913390 ?auto_913393 ) ) ( not ( = ?auto_913391 ?auto_913392 ) ) ( not ( = ?auto_913391 ?auto_913393 ) ) ( not ( = ?auto_913392 ?auto_913393 ) ) ( ON ?auto_913391 ?auto_913392 ) ( ON ?auto_913390 ?auto_913391 ) ( ON ?auto_913389 ?auto_913390 ) ( CLEAR ?auto_913387 ) ( ON ?auto_913388 ?auto_913389 ) ( CLEAR ?auto_913388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_913376 ?auto_913377 ?auto_913378 ?auto_913379 ?auto_913380 ?auto_913381 ?auto_913382 ?auto_913383 ?auto_913384 ?auto_913385 ?auto_913386 ?auto_913387 ?auto_913388 )
      ( MAKE-17PILE ?auto_913376 ?auto_913377 ?auto_913378 ?auto_913379 ?auto_913380 ?auto_913381 ?auto_913382 ?auto_913383 ?auto_913384 ?auto_913385 ?auto_913386 ?auto_913387 ?auto_913388 ?auto_913389 ?auto_913390 ?auto_913391 ?auto_913392 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913446 - BLOCK
      ?auto_913447 - BLOCK
      ?auto_913448 - BLOCK
      ?auto_913449 - BLOCK
      ?auto_913450 - BLOCK
      ?auto_913451 - BLOCK
      ?auto_913452 - BLOCK
      ?auto_913453 - BLOCK
      ?auto_913454 - BLOCK
      ?auto_913455 - BLOCK
      ?auto_913456 - BLOCK
      ?auto_913457 - BLOCK
      ?auto_913458 - BLOCK
      ?auto_913459 - BLOCK
      ?auto_913460 - BLOCK
      ?auto_913461 - BLOCK
      ?auto_913462 - BLOCK
    )
    :vars
    (
      ?auto_913463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913462 ?auto_913463 ) ( ON-TABLE ?auto_913446 ) ( ON ?auto_913447 ?auto_913446 ) ( ON ?auto_913448 ?auto_913447 ) ( ON ?auto_913449 ?auto_913448 ) ( ON ?auto_913450 ?auto_913449 ) ( ON ?auto_913451 ?auto_913450 ) ( ON ?auto_913452 ?auto_913451 ) ( ON ?auto_913453 ?auto_913452 ) ( ON ?auto_913454 ?auto_913453 ) ( ON ?auto_913455 ?auto_913454 ) ( ON ?auto_913456 ?auto_913455 ) ( not ( = ?auto_913446 ?auto_913447 ) ) ( not ( = ?auto_913446 ?auto_913448 ) ) ( not ( = ?auto_913446 ?auto_913449 ) ) ( not ( = ?auto_913446 ?auto_913450 ) ) ( not ( = ?auto_913446 ?auto_913451 ) ) ( not ( = ?auto_913446 ?auto_913452 ) ) ( not ( = ?auto_913446 ?auto_913453 ) ) ( not ( = ?auto_913446 ?auto_913454 ) ) ( not ( = ?auto_913446 ?auto_913455 ) ) ( not ( = ?auto_913446 ?auto_913456 ) ) ( not ( = ?auto_913446 ?auto_913457 ) ) ( not ( = ?auto_913446 ?auto_913458 ) ) ( not ( = ?auto_913446 ?auto_913459 ) ) ( not ( = ?auto_913446 ?auto_913460 ) ) ( not ( = ?auto_913446 ?auto_913461 ) ) ( not ( = ?auto_913446 ?auto_913462 ) ) ( not ( = ?auto_913446 ?auto_913463 ) ) ( not ( = ?auto_913447 ?auto_913448 ) ) ( not ( = ?auto_913447 ?auto_913449 ) ) ( not ( = ?auto_913447 ?auto_913450 ) ) ( not ( = ?auto_913447 ?auto_913451 ) ) ( not ( = ?auto_913447 ?auto_913452 ) ) ( not ( = ?auto_913447 ?auto_913453 ) ) ( not ( = ?auto_913447 ?auto_913454 ) ) ( not ( = ?auto_913447 ?auto_913455 ) ) ( not ( = ?auto_913447 ?auto_913456 ) ) ( not ( = ?auto_913447 ?auto_913457 ) ) ( not ( = ?auto_913447 ?auto_913458 ) ) ( not ( = ?auto_913447 ?auto_913459 ) ) ( not ( = ?auto_913447 ?auto_913460 ) ) ( not ( = ?auto_913447 ?auto_913461 ) ) ( not ( = ?auto_913447 ?auto_913462 ) ) ( not ( = ?auto_913447 ?auto_913463 ) ) ( not ( = ?auto_913448 ?auto_913449 ) ) ( not ( = ?auto_913448 ?auto_913450 ) ) ( not ( = ?auto_913448 ?auto_913451 ) ) ( not ( = ?auto_913448 ?auto_913452 ) ) ( not ( = ?auto_913448 ?auto_913453 ) ) ( not ( = ?auto_913448 ?auto_913454 ) ) ( not ( = ?auto_913448 ?auto_913455 ) ) ( not ( = ?auto_913448 ?auto_913456 ) ) ( not ( = ?auto_913448 ?auto_913457 ) ) ( not ( = ?auto_913448 ?auto_913458 ) ) ( not ( = ?auto_913448 ?auto_913459 ) ) ( not ( = ?auto_913448 ?auto_913460 ) ) ( not ( = ?auto_913448 ?auto_913461 ) ) ( not ( = ?auto_913448 ?auto_913462 ) ) ( not ( = ?auto_913448 ?auto_913463 ) ) ( not ( = ?auto_913449 ?auto_913450 ) ) ( not ( = ?auto_913449 ?auto_913451 ) ) ( not ( = ?auto_913449 ?auto_913452 ) ) ( not ( = ?auto_913449 ?auto_913453 ) ) ( not ( = ?auto_913449 ?auto_913454 ) ) ( not ( = ?auto_913449 ?auto_913455 ) ) ( not ( = ?auto_913449 ?auto_913456 ) ) ( not ( = ?auto_913449 ?auto_913457 ) ) ( not ( = ?auto_913449 ?auto_913458 ) ) ( not ( = ?auto_913449 ?auto_913459 ) ) ( not ( = ?auto_913449 ?auto_913460 ) ) ( not ( = ?auto_913449 ?auto_913461 ) ) ( not ( = ?auto_913449 ?auto_913462 ) ) ( not ( = ?auto_913449 ?auto_913463 ) ) ( not ( = ?auto_913450 ?auto_913451 ) ) ( not ( = ?auto_913450 ?auto_913452 ) ) ( not ( = ?auto_913450 ?auto_913453 ) ) ( not ( = ?auto_913450 ?auto_913454 ) ) ( not ( = ?auto_913450 ?auto_913455 ) ) ( not ( = ?auto_913450 ?auto_913456 ) ) ( not ( = ?auto_913450 ?auto_913457 ) ) ( not ( = ?auto_913450 ?auto_913458 ) ) ( not ( = ?auto_913450 ?auto_913459 ) ) ( not ( = ?auto_913450 ?auto_913460 ) ) ( not ( = ?auto_913450 ?auto_913461 ) ) ( not ( = ?auto_913450 ?auto_913462 ) ) ( not ( = ?auto_913450 ?auto_913463 ) ) ( not ( = ?auto_913451 ?auto_913452 ) ) ( not ( = ?auto_913451 ?auto_913453 ) ) ( not ( = ?auto_913451 ?auto_913454 ) ) ( not ( = ?auto_913451 ?auto_913455 ) ) ( not ( = ?auto_913451 ?auto_913456 ) ) ( not ( = ?auto_913451 ?auto_913457 ) ) ( not ( = ?auto_913451 ?auto_913458 ) ) ( not ( = ?auto_913451 ?auto_913459 ) ) ( not ( = ?auto_913451 ?auto_913460 ) ) ( not ( = ?auto_913451 ?auto_913461 ) ) ( not ( = ?auto_913451 ?auto_913462 ) ) ( not ( = ?auto_913451 ?auto_913463 ) ) ( not ( = ?auto_913452 ?auto_913453 ) ) ( not ( = ?auto_913452 ?auto_913454 ) ) ( not ( = ?auto_913452 ?auto_913455 ) ) ( not ( = ?auto_913452 ?auto_913456 ) ) ( not ( = ?auto_913452 ?auto_913457 ) ) ( not ( = ?auto_913452 ?auto_913458 ) ) ( not ( = ?auto_913452 ?auto_913459 ) ) ( not ( = ?auto_913452 ?auto_913460 ) ) ( not ( = ?auto_913452 ?auto_913461 ) ) ( not ( = ?auto_913452 ?auto_913462 ) ) ( not ( = ?auto_913452 ?auto_913463 ) ) ( not ( = ?auto_913453 ?auto_913454 ) ) ( not ( = ?auto_913453 ?auto_913455 ) ) ( not ( = ?auto_913453 ?auto_913456 ) ) ( not ( = ?auto_913453 ?auto_913457 ) ) ( not ( = ?auto_913453 ?auto_913458 ) ) ( not ( = ?auto_913453 ?auto_913459 ) ) ( not ( = ?auto_913453 ?auto_913460 ) ) ( not ( = ?auto_913453 ?auto_913461 ) ) ( not ( = ?auto_913453 ?auto_913462 ) ) ( not ( = ?auto_913453 ?auto_913463 ) ) ( not ( = ?auto_913454 ?auto_913455 ) ) ( not ( = ?auto_913454 ?auto_913456 ) ) ( not ( = ?auto_913454 ?auto_913457 ) ) ( not ( = ?auto_913454 ?auto_913458 ) ) ( not ( = ?auto_913454 ?auto_913459 ) ) ( not ( = ?auto_913454 ?auto_913460 ) ) ( not ( = ?auto_913454 ?auto_913461 ) ) ( not ( = ?auto_913454 ?auto_913462 ) ) ( not ( = ?auto_913454 ?auto_913463 ) ) ( not ( = ?auto_913455 ?auto_913456 ) ) ( not ( = ?auto_913455 ?auto_913457 ) ) ( not ( = ?auto_913455 ?auto_913458 ) ) ( not ( = ?auto_913455 ?auto_913459 ) ) ( not ( = ?auto_913455 ?auto_913460 ) ) ( not ( = ?auto_913455 ?auto_913461 ) ) ( not ( = ?auto_913455 ?auto_913462 ) ) ( not ( = ?auto_913455 ?auto_913463 ) ) ( not ( = ?auto_913456 ?auto_913457 ) ) ( not ( = ?auto_913456 ?auto_913458 ) ) ( not ( = ?auto_913456 ?auto_913459 ) ) ( not ( = ?auto_913456 ?auto_913460 ) ) ( not ( = ?auto_913456 ?auto_913461 ) ) ( not ( = ?auto_913456 ?auto_913462 ) ) ( not ( = ?auto_913456 ?auto_913463 ) ) ( not ( = ?auto_913457 ?auto_913458 ) ) ( not ( = ?auto_913457 ?auto_913459 ) ) ( not ( = ?auto_913457 ?auto_913460 ) ) ( not ( = ?auto_913457 ?auto_913461 ) ) ( not ( = ?auto_913457 ?auto_913462 ) ) ( not ( = ?auto_913457 ?auto_913463 ) ) ( not ( = ?auto_913458 ?auto_913459 ) ) ( not ( = ?auto_913458 ?auto_913460 ) ) ( not ( = ?auto_913458 ?auto_913461 ) ) ( not ( = ?auto_913458 ?auto_913462 ) ) ( not ( = ?auto_913458 ?auto_913463 ) ) ( not ( = ?auto_913459 ?auto_913460 ) ) ( not ( = ?auto_913459 ?auto_913461 ) ) ( not ( = ?auto_913459 ?auto_913462 ) ) ( not ( = ?auto_913459 ?auto_913463 ) ) ( not ( = ?auto_913460 ?auto_913461 ) ) ( not ( = ?auto_913460 ?auto_913462 ) ) ( not ( = ?auto_913460 ?auto_913463 ) ) ( not ( = ?auto_913461 ?auto_913462 ) ) ( not ( = ?auto_913461 ?auto_913463 ) ) ( not ( = ?auto_913462 ?auto_913463 ) ) ( ON ?auto_913461 ?auto_913462 ) ( ON ?auto_913460 ?auto_913461 ) ( ON ?auto_913459 ?auto_913460 ) ( ON ?auto_913458 ?auto_913459 ) ( CLEAR ?auto_913456 ) ( ON ?auto_913457 ?auto_913458 ) ( CLEAR ?auto_913457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_913446 ?auto_913447 ?auto_913448 ?auto_913449 ?auto_913450 ?auto_913451 ?auto_913452 ?auto_913453 ?auto_913454 ?auto_913455 ?auto_913456 ?auto_913457 )
      ( MAKE-17PILE ?auto_913446 ?auto_913447 ?auto_913448 ?auto_913449 ?auto_913450 ?auto_913451 ?auto_913452 ?auto_913453 ?auto_913454 ?auto_913455 ?auto_913456 ?auto_913457 ?auto_913458 ?auto_913459 ?auto_913460 ?auto_913461 ?auto_913462 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913516 - BLOCK
      ?auto_913517 - BLOCK
      ?auto_913518 - BLOCK
      ?auto_913519 - BLOCK
      ?auto_913520 - BLOCK
      ?auto_913521 - BLOCK
      ?auto_913522 - BLOCK
      ?auto_913523 - BLOCK
      ?auto_913524 - BLOCK
      ?auto_913525 - BLOCK
      ?auto_913526 - BLOCK
      ?auto_913527 - BLOCK
      ?auto_913528 - BLOCK
      ?auto_913529 - BLOCK
      ?auto_913530 - BLOCK
      ?auto_913531 - BLOCK
      ?auto_913532 - BLOCK
    )
    :vars
    (
      ?auto_913533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913532 ?auto_913533 ) ( ON-TABLE ?auto_913516 ) ( ON ?auto_913517 ?auto_913516 ) ( ON ?auto_913518 ?auto_913517 ) ( ON ?auto_913519 ?auto_913518 ) ( ON ?auto_913520 ?auto_913519 ) ( ON ?auto_913521 ?auto_913520 ) ( ON ?auto_913522 ?auto_913521 ) ( ON ?auto_913523 ?auto_913522 ) ( ON ?auto_913524 ?auto_913523 ) ( ON ?auto_913525 ?auto_913524 ) ( not ( = ?auto_913516 ?auto_913517 ) ) ( not ( = ?auto_913516 ?auto_913518 ) ) ( not ( = ?auto_913516 ?auto_913519 ) ) ( not ( = ?auto_913516 ?auto_913520 ) ) ( not ( = ?auto_913516 ?auto_913521 ) ) ( not ( = ?auto_913516 ?auto_913522 ) ) ( not ( = ?auto_913516 ?auto_913523 ) ) ( not ( = ?auto_913516 ?auto_913524 ) ) ( not ( = ?auto_913516 ?auto_913525 ) ) ( not ( = ?auto_913516 ?auto_913526 ) ) ( not ( = ?auto_913516 ?auto_913527 ) ) ( not ( = ?auto_913516 ?auto_913528 ) ) ( not ( = ?auto_913516 ?auto_913529 ) ) ( not ( = ?auto_913516 ?auto_913530 ) ) ( not ( = ?auto_913516 ?auto_913531 ) ) ( not ( = ?auto_913516 ?auto_913532 ) ) ( not ( = ?auto_913516 ?auto_913533 ) ) ( not ( = ?auto_913517 ?auto_913518 ) ) ( not ( = ?auto_913517 ?auto_913519 ) ) ( not ( = ?auto_913517 ?auto_913520 ) ) ( not ( = ?auto_913517 ?auto_913521 ) ) ( not ( = ?auto_913517 ?auto_913522 ) ) ( not ( = ?auto_913517 ?auto_913523 ) ) ( not ( = ?auto_913517 ?auto_913524 ) ) ( not ( = ?auto_913517 ?auto_913525 ) ) ( not ( = ?auto_913517 ?auto_913526 ) ) ( not ( = ?auto_913517 ?auto_913527 ) ) ( not ( = ?auto_913517 ?auto_913528 ) ) ( not ( = ?auto_913517 ?auto_913529 ) ) ( not ( = ?auto_913517 ?auto_913530 ) ) ( not ( = ?auto_913517 ?auto_913531 ) ) ( not ( = ?auto_913517 ?auto_913532 ) ) ( not ( = ?auto_913517 ?auto_913533 ) ) ( not ( = ?auto_913518 ?auto_913519 ) ) ( not ( = ?auto_913518 ?auto_913520 ) ) ( not ( = ?auto_913518 ?auto_913521 ) ) ( not ( = ?auto_913518 ?auto_913522 ) ) ( not ( = ?auto_913518 ?auto_913523 ) ) ( not ( = ?auto_913518 ?auto_913524 ) ) ( not ( = ?auto_913518 ?auto_913525 ) ) ( not ( = ?auto_913518 ?auto_913526 ) ) ( not ( = ?auto_913518 ?auto_913527 ) ) ( not ( = ?auto_913518 ?auto_913528 ) ) ( not ( = ?auto_913518 ?auto_913529 ) ) ( not ( = ?auto_913518 ?auto_913530 ) ) ( not ( = ?auto_913518 ?auto_913531 ) ) ( not ( = ?auto_913518 ?auto_913532 ) ) ( not ( = ?auto_913518 ?auto_913533 ) ) ( not ( = ?auto_913519 ?auto_913520 ) ) ( not ( = ?auto_913519 ?auto_913521 ) ) ( not ( = ?auto_913519 ?auto_913522 ) ) ( not ( = ?auto_913519 ?auto_913523 ) ) ( not ( = ?auto_913519 ?auto_913524 ) ) ( not ( = ?auto_913519 ?auto_913525 ) ) ( not ( = ?auto_913519 ?auto_913526 ) ) ( not ( = ?auto_913519 ?auto_913527 ) ) ( not ( = ?auto_913519 ?auto_913528 ) ) ( not ( = ?auto_913519 ?auto_913529 ) ) ( not ( = ?auto_913519 ?auto_913530 ) ) ( not ( = ?auto_913519 ?auto_913531 ) ) ( not ( = ?auto_913519 ?auto_913532 ) ) ( not ( = ?auto_913519 ?auto_913533 ) ) ( not ( = ?auto_913520 ?auto_913521 ) ) ( not ( = ?auto_913520 ?auto_913522 ) ) ( not ( = ?auto_913520 ?auto_913523 ) ) ( not ( = ?auto_913520 ?auto_913524 ) ) ( not ( = ?auto_913520 ?auto_913525 ) ) ( not ( = ?auto_913520 ?auto_913526 ) ) ( not ( = ?auto_913520 ?auto_913527 ) ) ( not ( = ?auto_913520 ?auto_913528 ) ) ( not ( = ?auto_913520 ?auto_913529 ) ) ( not ( = ?auto_913520 ?auto_913530 ) ) ( not ( = ?auto_913520 ?auto_913531 ) ) ( not ( = ?auto_913520 ?auto_913532 ) ) ( not ( = ?auto_913520 ?auto_913533 ) ) ( not ( = ?auto_913521 ?auto_913522 ) ) ( not ( = ?auto_913521 ?auto_913523 ) ) ( not ( = ?auto_913521 ?auto_913524 ) ) ( not ( = ?auto_913521 ?auto_913525 ) ) ( not ( = ?auto_913521 ?auto_913526 ) ) ( not ( = ?auto_913521 ?auto_913527 ) ) ( not ( = ?auto_913521 ?auto_913528 ) ) ( not ( = ?auto_913521 ?auto_913529 ) ) ( not ( = ?auto_913521 ?auto_913530 ) ) ( not ( = ?auto_913521 ?auto_913531 ) ) ( not ( = ?auto_913521 ?auto_913532 ) ) ( not ( = ?auto_913521 ?auto_913533 ) ) ( not ( = ?auto_913522 ?auto_913523 ) ) ( not ( = ?auto_913522 ?auto_913524 ) ) ( not ( = ?auto_913522 ?auto_913525 ) ) ( not ( = ?auto_913522 ?auto_913526 ) ) ( not ( = ?auto_913522 ?auto_913527 ) ) ( not ( = ?auto_913522 ?auto_913528 ) ) ( not ( = ?auto_913522 ?auto_913529 ) ) ( not ( = ?auto_913522 ?auto_913530 ) ) ( not ( = ?auto_913522 ?auto_913531 ) ) ( not ( = ?auto_913522 ?auto_913532 ) ) ( not ( = ?auto_913522 ?auto_913533 ) ) ( not ( = ?auto_913523 ?auto_913524 ) ) ( not ( = ?auto_913523 ?auto_913525 ) ) ( not ( = ?auto_913523 ?auto_913526 ) ) ( not ( = ?auto_913523 ?auto_913527 ) ) ( not ( = ?auto_913523 ?auto_913528 ) ) ( not ( = ?auto_913523 ?auto_913529 ) ) ( not ( = ?auto_913523 ?auto_913530 ) ) ( not ( = ?auto_913523 ?auto_913531 ) ) ( not ( = ?auto_913523 ?auto_913532 ) ) ( not ( = ?auto_913523 ?auto_913533 ) ) ( not ( = ?auto_913524 ?auto_913525 ) ) ( not ( = ?auto_913524 ?auto_913526 ) ) ( not ( = ?auto_913524 ?auto_913527 ) ) ( not ( = ?auto_913524 ?auto_913528 ) ) ( not ( = ?auto_913524 ?auto_913529 ) ) ( not ( = ?auto_913524 ?auto_913530 ) ) ( not ( = ?auto_913524 ?auto_913531 ) ) ( not ( = ?auto_913524 ?auto_913532 ) ) ( not ( = ?auto_913524 ?auto_913533 ) ) ( not ( = ?auto_913525 ?auto_913526 ) ) ( not ( = ?auto_913525 ?auto_913527 ) ) ( not ( = ?auto_913525 ?auto_913528 ) ) ( not ( = ?auto_913525 ?auto_913529 ) ) ( not ( = ?auto_913525 ?auto_913530 ) ) ( not ( = ?auto_913525 ?auto_913531 ) ) ( not ( = ?auto_913525 ?auto_913532 ) ) ( not ( = ?auto_913525 ?auto_913533 ) ) ( not ( = ?auto_913526 ?auto_913527 ) ) ( not ( = ?auto_913526 ?auto_913528 ) ) ( not ( = ?auto_913526 ?auto_913529 ) ) ( not ( = ?auto_913526 ?auto_913530 ) ) ( not ( = ?auto_913526 ?auto_913531 ) ) ( not ( = ?auto_913526 ?auto_913532 ) ) ( not ( = ?auto_913526 ?auto_913533 ) ) ( not ( = ?auto_913527 ?auto_913528 ) ) ( not ( = ?auto_913527 ?auto_913529 ) ) ( not ( = ?auto_913527 ?auto_913530 ) ) ( not ( = ?auto_913527 ?auto_913531 ) ) ( not ( = ?auto_913527 ?auto_913532 ) ) ( not ( = ?auto_913527 ?auto_913533 ) ) ( not ( = ?auto_913528 ?auto_913529 ) ) ( not ( = ?auto_913528 ?auto_913530 ) ) ( not ( = ?auto_913528 ?auto_913531 ) ) ( not ( = ?auto_913528 ?auto_913532 ) ) ( not ( = ?auto_913528 ?auto_913533 ) ) ( not ( = ?auto_913529 ?auto_913530 ) ) ( not ( = ?auto_913529 ?auto_913531 ) ) ( not ( = ?auto_913529 ?auto_913532 ) ) ( not ( = ?auto_913529 ?auto_913533 ) ) ( not ( = ?auto_913530 ?auto_913531 ) ) ( not ( = ?auto_913530 ?auto_913532 ) ) ( not ( = ?auto_913530 ?auto_913533 ) ) ( not ( = ?auto_913531 ?auto_913532 ) ) ( not ( = ?auto_913531 ?auto_913533 ) ) ( not ( = ?auto_913532 ?auto_913533 ) ) ( ON ?auto_913531 ?auto_913532 ) ( ON ?auto_913530 ?auto_913531 ) ( ON ?auto_913529 ?auto_913530 ) ( ON ?auto_913528 ?auto_913529 ) ( ON ?auto_913527 ?auto_913528 ) ( CLEAR ?auto_913525 ) ( ON ?auto_913526 ?auto_913527 ) ( CLEAR ?auto_913526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_913516 ?auto_913517 ?auto_913518 ?auto_913519 ?auto_913520 ?auto_913521 ?auto_913522 ?auto_913523 ?auto_913524 ?auto_913525 ?auto_913526 )
      ( MAKE-17PILE ?auto_913516 ?auto_913517 ?auto_913518 ?auto_913519 ?auto_913520 ?auto_913521 ?auto_913522 ?auto_913523 ?auto_913524 ?auto_913525 ?auto_913526 ?auto_913527 ?auto_913528 ?auto_913529 ?auto_913530 ?auto_913531 ?auto_913532 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913586 - BLOCK
      ?auto_913587 - BLOCK
      ?auto_913588 - BLOCK
      ?auto_913589 - BLOCK
      ?auto_913590 - BLOCK
      ?auto_913591 - BLOCK
      ?auto_913592 - BLOCK
      ?auto_913593 - BLOCK
      ?auto_913594 - BLOCK
      ?auto_913595 - BLOCK
      ?auto_913596 - BLOCK
      ?auto_913597 - BLOCK
      ?auto_913598 - BLOCK
      ?auto_913599 - BLOCK
      ?auto_913600 - BLOCK
      ?auto_913601 - BLOCK
      ?auto_913602 - BLOCK
    )
    :vars
    (
      ?auto_913603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913602 ?auto_913603 ) ( ON-TABLE ?auto_913586 ) ( ON ?auto_913587 ?auto_913586 ) ( ON ?auto_913588 ?auto_913587 ) ( ON ?auto_913589 ?auto_913588 ) ( ON ?auto_913590 ?auto_913589 ) ( ON ?auto_913591 ?auto_913590 ) ( ON ?auto_913592 ?auto_913591 ) ( ON ?auto_913593 ?auto_913592 ) ( ON ?auto_913594 ?auto_913593 ) ( not ( = ?auto_913586 ?auto_913587 ) ) ( not ( = ?auto_913586 ?auto_913588 ) ) ( not ( = ?auto_913586 ?auto_913589 ) ) ( not ( = ?auto_913586 ?auto_913590 ) ) ( not ( = ?auto_913586 ?auto_913591 ) ) ( not ( = ?auto_913586 ?auto_913592 ) ) ( not ( = ?auto_913586 ?auto_913593 ) ) ( not ( = ?auto_913586 ?auto_913594 ) ) ( not ( = ?auto_913586 ?auto_913595 ) ) ( not ( = ?auto_913586 ?auto_913596 ) ) ( not ( = ?auto_913586 ?auto_913597 ) ) ( not ( = ?auto_913586 ?auto_913598 ) ) ( not ( = ?auto_913586 ?auto_913599 ) ) ( not ( = ?auto_913586 ?auto_913600 ) ) ( not ( = ?auto_913586 ?auto_913601 ) ) ( not ( = ?auto_913586 ?auto_913602 ) ) ( not ( = ?auto_913586 ?auto_913603 ) ) ( not ( = ?auto_913587 ?auto_913588 ) ) ( not ( = ?auto_913587 ?auto_913589 ) ) ( not ( = ?auto_913587 ?auto_913590 ) ) ( not ( = ?auto_913587 ?auto_913591 ) ) ( not ( = ?auto_913587 ?auto_913592 ) ) ( not ( = ?auto_913587 ?auto_913593 ) ) ( not ( = ?auto_913587 ?auto_913594 ) ) ( not ( = ?auto_913587 ?auto_913595 ) ) ( not ( = ?auto_913587 ?auto_913596 ) ) ( not ( = ?auto_913587 ?auto_913597 ) ) ( not ( = ?auto_913587 ?auto_913598 ) ) ( not ( = ?auto_913587 ?auto_913599 ) ) ( not ( = ?auto_913587 ?auto_913600 ) ) ( not ( = ?auto_913587 ?auto_913601 ) ) ( not ( = ?auto_913587 ?auto_913602 ) ) ( not ( = ?auto_913587 ?auto_913603 ) ) ( not ( = ?auto_913588 ?auto_913589 ) ) ( not ( = ?auto_913588 ?auto_913590 ) ) ( not ( = ?auto_913588 ?auto_913591 ) ) ( not ( = ?auto_913588 ?auto_913592 ) ) ( not ( = ?auto_913588 ?auto_913593 ) ) ( not ( = ?auto_913588 ?auto_913594 ) ) ( not ( = ?auto_913588 ?auto_913595 ) ) ( not ( = ?auto_913588 ?auto_913596 ) ) ( not ( = ?auto_913588 ?auto_913597 ) ) ( not ( = ?auto_913588 ?auto_913598 ) ) ( not ( = ?auto_913588 ?auto_913599 ) ) ( not ( = ?auto_913588 ?auto_913600 ) ) ( not ( = ?auto_913588 ?auto_913601 ) ) ( not ( = ?auto_913588 ?auto_913602 ) ) ( not ( = ?auto_913588 ?auto_913603 ) ) ( not ( = ?auto_913589 ?auto_913590 ) ) ( not ( = ?auto_913589 ?auto_913591 ) ) ( not ( = ?auto_913589 ?auto_913592 ) ) ( not ( = ?auto_913589 ?auto_913593 ) ) ( not ( = ?auto_913589 ?auto_913594 ) ) ( not ( = ?auto_913589 ?auto_913595 ) ) ( not ( = ?auto_913589 ?auto_913596 ) ) ( not ( = ?auto_913589 ?auto_913597 ) ) ( not ( = ?auto_913589 ?auto_913598 ) ) ( not ( = ?auto_913589 ?auto_913599 ) ) ( not ( = ?auto_913589 ?auto_913600 ) ) ( not ( = ?auto_913589 ?auto_913601 ) ) ( not ( = ?auto_913589 ?auto_913602 ) ) ( not ( = ?auto_913589 ?auto_913603 ) ) ( not ( = ?auto_913590 ?auto_913591 ) ) ( not ( = ?auto_913590 ?auto_913592 ) ) ( not ( = ?auto_913590 ?auto_913593 ) ) ( not ( = ?auto_913590 ?auto_913594 ) ) ( not ( = ?auto_913590 ?auto_913595 ) ) ( not ( = ?auto_913590 ?auto_913596 ) ) ( not ( = ?auto_913590 ?auto_913597 ) ) ( not ( = ?auto_913590 ?auto_913598 ) ) ( not ( = ?auto_913590 ?auto_913599 ) ) ( not ( = ?auto_913590 ?auto_913600 ) ) ( not ( = ?auto_913590 ?auto_913601 ) ) ( not ( = ?auto_913590 ?auto_913602 ) ) ( not ( = ?auto_913590 ?auto_913603 ) ) ( not ( = ?auto_913591 ?auto_913592 ) ) ( not ( = ?auto_913591 ?auto_913593 ) ) ( not ( = ?auto_913591 ?auto_913594 ) ) ( not ( = ?auto_913591 ?auto_913595 ) ) ( not ( = ?auto_913591 ?auto_913596 ) ) ( not ( = ?auto_913591 ?auto_913597 ) ) ( not ( = ?auto_913591 ?auto_913598 ) ) ( not ( = ?auto_913591 ?auto_913599 ) ) ( not ( = ?auto_913591 ?auto_913600 ) ) ( not ( = ?auto_913591 ?auto_913601 ) ) ( not ( = ?auto_913591 ?auto_913602 ) ) ( not ( = ?auto_913591 ?auto_913603 ) ) ( not ( = ?auto_913592 ?auto_913593 ) ) ( not ( = ?auto_913592 ?auto_913594 ) ) ( not ( = ?auto_913592 ?auto_913595 ) ) ( not ( = ?auto_913592 ?auto_913596 ) ) ( not ( = ?auto_913592 ?auto_913597 ) ) ( not ( = ?auto_913592 ?auto_913598 ) ) ( not ( = ?auto_913592 ?auto_913599 ) ) ( not ( = ?auto_913592 ?auto_913600 ) ) ( not ( = ?auto_913592 ?auto_913601 ) ) ( not ( = ?auto_913592 ?auto_913602 ) ) ( not ( = ?auto_913592 ?auto_913603 ) ) ( not ( = ?auto_913593 ?auto_913594 ) ) ( not ( = ?auto_913593 ?auto_913595 ) ) ( not ( = ?auto_913593 ?auto_913596 ) ) ( not ( = ?auto_913593 ?auto_913597 ) ) ( not ( = ?auto_913593 ?auto_913598 ) ) ( not ( = ?auto_913593 ?auto_913599 ) ) ( not ( = ?auto_913593 ?auto_913600 ) ) ( not ( = ?auto_913593 ?auto_913601 ) ) ( not ( = ?auto_913593 ?auto_913602 ) ) ( not ( = ?auto_913593 ?auto_913603 ) ) ( not ( = ?auto_913594 ?auto_913595 ) ) ( not ( = ?auto_913594 ?auto_913596 ) ) ( not ( = ?auto_913594 ?auto_913597 ) ) ( not ( = ?auto_913594 ?auto_913598 ) ) ( not ( = ?auto_913594 ?auto_913599 ) ) ( not ( = ?auto_913594 ?auto_913600 ) ) ( not ( = ?auto_913594 ?auto_913601 ) ) ( not ( = ?auto_913594 ?auto_913602 ) ) ( not ( = ?auto_913594 ?auto_913603 ) ) ( not ( = ?auto_913595 ?auto_913596 ) ) ( not ( = ?auto_913595 ?auto_913597 ) ) ( not ( = ?auto_913595 ?auto_913598 ) ) ( not ( = ?auto_913595 ?auto_913599 ) ) ( not ( = ?auto_913595 ?auto_913600 ) ) ( not ( = ?auto_913595 ?auto_913601 ) ) ( not ( = ?auto_913595 ?auto_913602 ) ) ( not ( = ?auto_913595 ?auto_913603 ) ) ( not ( = ?auto_913596 ?auto_913597 ) ) ( not ( = ?auto_913596 ?auto_913598 ) ) ( not ( = ?auto_913596 ?auto_913599 ) ) ( not ( = ?auto_913596 ?auto_913600 ) ) ( not ( = ?auto_913596 ?auto_913601 ) ) ( not ( = ?auto_913596 ?auto_913602 ) ) ( not ( = ?auto_913596 ?auto_913603 ) ) ( not ( = ?auto_913597 ?auto_913598 ) ) ( not ( = ?auto_913597 ?auto_913599 ) ) ( not ( = ?auto_913597 ?auto_913600 ) ) ( not ( = ?auto_913597 ?auto_913601 ) ) ( not ( = ?auto_913597 ?auto_913602 ) ) ( not ( = ?auto_913597 ?auto_913603 ) ) ( not ( = ?auto_913598 ?auto_913599 ) ) ( not ( = ?auto_913598 ?auto_913600 ) ) ( not ( = ?auto_913598 ?auto_913601 ) ) ( not ( = ?auto_913598 ?auto_913602 ) ) ( not ( = ?auto_913598 ?auto_913603 ) ) ( not ( = ?auto_913599 ?auto_913600 ) ) ( not ( = ?auto_913599 ?auto_913601 ) ) ( not ( = ?auto_913599 ?auto_913602 ) ) ( not ( = ?auto_913599 ?auto_913603 ) ) ( not ( = ?auto_913600 ?auto_913601 ) ) ( not ( = ?auto_913600 ?auto_913602 ) ) ( not ( = ?auto_913600 ?auto_913603 ) ) ( not ( = ?auto_913601 ?auto_913602 ) ) ( not ( = ?auto_913601 ?auto_913603 ) ) ( not ( = ?auto_913602 ?auto_913603 ) ) ( ON ?auto_913601 ?auto_913602 ) ( ON ?auto_913600 ?auto_913601 ) ( ON ?auto_913599 ?auto_913600 ) ( ON ?auto_913598 ?auto_913599 ) ( ON ?auto_913597 ?auto_913598 ) ( ON ?auto_913596 ?auto_913597 ) ( CLEAR ?auto_913594 ) ( ON ?auto_913595 ?auto_913596 ) ( CLEAR ?auto_913595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_913586 ?auto_913587 ?auto_913588 ?auto_913589 ?auto_913590 ?auto_913591 ?auto_913592 ?auto_913593 ?auto_913594 ?auto_913595 )
      ( MAKE-17PILE ?auto_913586 ?auto_913587 ?auto_913588 ?auto_913589 ?auto_913590 ?auto_913591 ?auto_913592 ?auto_913593 ?auto_913594 ?auto_913595 ?auto_913596 ?auto_913597 ?auto_913598 ?auto_913599 ?auto_913600 ?auto_913601 ?auto_913602 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913656 - BLOCK
      ?auto_913657 - BLOCK
      ?auto_913658 - BLOCK
      ?auto_913659 - BLOCK
      ?auto_913660 - BLOCK
      ?auto_913661 - BLOCK
      ?auto_913662 - BLOCK
      ?auto_913663 - BLOCK
      ?auto_913664 - BLOCK
      ?auto_913665 - BLOCK
      ?auto_913666 - BLOCK
      ?auto_913667 - BLOCK
      ?auto_913668 - BLOCK
      ?auto_913669 - BLOCK
      ?auto_913670 - BLOCK
      ?auto_913671 - BLOCK
      ?auto_913672 - BLOCK
    )
    :vars
    (
      ?auto_913673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913672 ?auto_913673 ) ( ON-TABLE ?auto_913656 ) ( ON ?auto_913657 ?auto_913656 ) ( ON ?auto_913658 ?auto_913657 ) ( ON ?auto_913659 ?auto_913658 ) ( ON ?auto_913660 ?auto_913659 ) ( ON ?auto_913661 ?auto_913660 ) ( ON ?auto_913662 ?auto_913661 ) ( ON ?auto_913663 ?auto_913662 ) ( not ( = ?auto_913656 ?auto_913657 ) ) ( not ( = ?auto_913656 ?auto_913658 ) ) ( not ( = ?auto_913656 ?auto_913659 ) ) ( not ( = ?auto_913656 ?auto_913660 ) ) ( not ( = ?auto_913656 ?auto_913661 ) ) ( not ( = ?auto_913656 ?auto_913662 ) ) ( not ( = ?auto_913656 ?auto_913663 ) ) ( not ( = ?auto_913656 ?auto_913664 ) ) ( not ( = ?auto_913656 ?auto_913665 ) ) ( not ( = ?auto_913656 ?auto_913666 ) ) ( not ( = ?auto_913656 ?auto_913667 ) ) ( not ( = ?auto_913656 ?auto_913668 ) ) ( not ( = ?auto_913656 ?auto_913669 ) ) ( not ( = ?auto_913656 ?auto_913670 ) ) ( not ( = ?auto_913656 ?auto_913671 ) ) ( not ( = ?auto_913656 ?auto_913672 ) ) ( not ( = ?auto_913656 ?auto_913673 ) ) ( not ( = ?auto_913657 ?auto_913658 ) ) ( not ( = ?auto_913657 ?auto_913659 ) ) ( not ( = ?auto_913657 ?auto_913660 ) ) ( not ( = ?auto_913657 ?auto_913661 ) ) ( not ( = ?auto_913657 ?auto_913662 ) ) ( not ( = ?auto_913657 ?auto_913663 ) ) ( not ( = ?auto_913657 ?auto_913664 ) ) ( not ( = ?auto_913657 ?auto_913665 ) ) ( not ( = ?auto_913657 ?auto_913666 ) ) ( not ( = ?auto_913657 ?auto_913667 ) ) ( not ( = ?auto_913657 ?auto_913668 ) ) ( not ( = ?auto_913657 ?auto_913669 ) ) ( not ( = ?auto_913657 ?auto_913670 ) ) ( not ( = ?auto_913657 ?auto_913671 ) ) ( not ( = ?auto_913657 ?auto_913672 ) ) ( not ( = ?auto_913657 ?auto_913673 ) ) ( not ( = ?auto_913658 ?auto_913659 ) ) ( not ( = ?auto_913658 ?auto_913660 ) ) ( not ( = ?auto_913658 ?auto_913661 ) ) ( not ( = ?auto_913658 ?auto_913662 ) ) ( not ( = ?auto_913658 ?auto_913663 ) ) ( not ( = ?auto_913658 ?auto_913664 ) ) ( not ( = ?auto_913658 ?auto_913665 ) ) ( not ( = ?auto_913658 ?auto_913666 ) ) ( not ( = ?auto_913658 ?auto_913667 ) ) ( not ( = ?auto_913658 ?auto_913668 ) ) ( not ( = ?auto_913658 ?auto_913669 ) ) ( not ( = ?auto_913658 ?auto_913670 ) ) ( not ( = ?auto_913658 ?auto_913671 ) ) ( not ( = ?auto_913658 ?auto_913672 ) ) ( not ( = ?auto_913658 ?auto_913673 ) ) ( not ( = ?auto_913659 ?auto_913660 ) ) ( not ( = ?auto_913659 ?auto_913661 ) ) ( not ( = ?auto_913659 ?auto_913662 ) ) ( not ( = ?auto_913659 ?auto_913663 ) ) ( not ( = ?auto_913659 ?auto_913664 ) ) ( not ( = ?auto_913659 ?auto_913665 ) ) ( not ( = ?auto_913659 ?auto_913666 ) ) ( not ( = ?auto_913659 ?auto_913667 ) ) ( not ( = ?auto_913659 ?auto_913668 ) ) ( not ( = ?auto_913659 ?auto_913669 ) ) ( not ( = ?auto_913659 ?auto_913670 ) ) ( not ( = ?auto_913659 ?auto_913671 ) ) ( not ( = ?auto_913659 ?auto_913672 ) ) ( not ( = ?auto_913659 ?auto_913673 ) ) ( not ( = ?auto_913660 ?auto_913661 ) ) ( not ( = ?auto_913660 ?auto_913662 ) ) ( not ( = ?auto_913660 ?auto_913663 ) ) ( not ( = ?auto_913660 ?auto_913664 ) ) ( not ( = ?auto_913660 ?auto_913665 ) ) ( not ( = ?auto_913660 ?auto_913666 ) ) ( not ( = ?auto_913660 ?auto_913667 ) ) ( not ( = ?auto_913660 ?auto_913668 ) ) ( not ( = ?auto_913660 ?auto_913669 ) ) ( not ( = ?auto_913660 ?auto_913670 ) ) ( not ( = ?auto_913660 ?auto_913671 ) ) ( not ( = ?auto_913660 ?auto_913672 ) ) ( not ( = ?auto_913660 ?auto_913673 ) ) ( not ( = ?auto_913661 ?auto_913662 ) ) ( not ( = ?auto_913661 ?auto_913663 ) ) ( not ( = ?auto_913661 ?auto_913664 ) ) ( not ( = ?auto_913661 ?auto_913665 ) ) ( not ( = ?auto_913661 ?auto_913666 ) ) ( not ( = ?auto_913661 ?auto_913667 ) ) ( not ( = ?auto_913661 ?auto_913668 ) ) ( not ( = ?auto_913661 ?auto_913669 ) ) ( not ( = ?auto_913661 ?auto_913670 ) ) ( not ( = ?auto_913661 ?auto_913671 ) ) ( not ( = ?auto_913661 ?auto_913672 ) ) ( not ( = ?auto_913661 ?auto_913673 ) ) ( not ( = ?auto_913662 ?auto_913663 ) ) ( not ( = ?auto_913662 ?auto_913664 ) ) ( not ( = ?auto_913662 ?auto_913665 ) ) ( not ( = ?auto_913662 ?auto_913666 ) ) ( not ( = ?auto_913662 ?auto_913667 ) ) ( not ( = ?auto_913662 ?auto_913668 ) ) ( not ( = ?auto_913662 ?auto_913669 ) ) ( not ( = ?auto_913662 ?auto_913670 ) ) ( not ( = ?auto_913662 ?auto_913671 ) ) ( not ( = ?auto_913662 ?auto_913672 ) ) ( not ( = ?auto_913662 ?auto_913673 ) ) ( not ( = ?auto_913663 ?auto_913664 ) ) ( not ( = ?auto_913663 ?auto_913665 ) ) ( not ( = ?auto_913663 ?auto_913666 ) ) ( not ( = ?auto_913663 ?auto_913667 ) ) ( not ( = ?auto_913663 ?auto_913668 ) ) ( not ( = ?auto_913663 ?auto_913669 ) ) ( not ( = ?auto_913663 ?auto_913670 ) ) ( not ( = ?auto_913663 ?auto_913671 ) ) ( not ( = ?auto_913663 ?auto_913672 ) ) ( not ( = ?auto_913663 ?auto_913673 ) ) ( not ( = ?auto_913664 ?auto_913665 ) ) ( not ( = ?auto_913664 ?auto_913666 ) ) ( not ( = ?auto_913664 ?auto_913667 ) ) ( not ( = ?auto_913664 ?auto_913668 ) ) ( not ( = ?auto_913664 ?auto_913669 ) ) ( not ( = ?auto_913664 ?auto_913670 ) ) ( not ( = ?auto_913664 ?auto_913671 ) ) ( not ( = ?auto_913664 ?auto_913672 ) ) ( not ( = ?auto_913664 ?auto_913673 ) ) ( not ( = ?auto_913665 ?auto_913666 ) ) ( not ( = ?auto_913665 ?auto_913667 ) ) ( not ( = ?auto_913665 ?auto_913668 ) ) ( not ( = ?auto_913665 ?auto_913669 ) ) ( not ( = ?auto_913665 ?auto_913670 ) ) ( not ( = ?auto_913665 ?auto_913671 ) ) ( not ( = ?auto_913665 ?auto_913672 ) ) ( not ( = ?auto_913665 ?auto_913673 ) ) ( not ( = ?auto_913666 ?auto_913667 ) ) ( not ( = ?auto_913666 ?auto_913668 ) ) ( not ( = ?auto_913666 ?auto_913669 ) ) ( not ( = ?auto_913666 ?auto_913670 ) ) ( not ( = ?auto_913666 ?auto_913671 ) ) ( not ( = ?auto_913666 ?auto_913672 ) ) ( not ( = ?auto_913666 ?auto_913673 ) ) ( not ( = ?auto_913667 ?auto_913668 ) ) ( not ( = ?auto_913667 ?auto_913669 ) ) ( not ( = ?auto_913667 ?auto_913670 ) ) ( not ( = ?auto_913667 ?auto_913671 ) ) ( not ( = ?auto_913667 ?auto_913672 ) ) ( not ( = ?auto_913667 ?auto_913673 ) ) ( not ( = ?auto_913668 ?auto_913669 ) ) ( not ( = ?auto_913668 ?auto_913670 ) ) ( not ( = ?auto_913668 ?auto_913671 ) ) ( not ( = ?auto_913668 ?auto_913672 ) ) ( not ( = ?auto_913668 ?auto_913673 ) ) ( not ( = ?auto_913669 ?auto_913670 ) ) ( not ( = ?auto_913669 ?auto_913671 ) ) ( not ( = ?auto_913669 ?auto_913672 ) ) ( not ( = ?auto_913669 ?auto_913673 ) ) ( not ( = ?auto_913670 ?auto_913671 ) ) ( not ( = ?auto_913670 ?auto_913672 ) ) ( not ( = ?auto_913670 ?auto_913673 ) ) ( not ( = ?auto_913671 ?auto_913672 ) ) ( not ( = ?auto_913671 ?auto_913673 ) ) ( not ( = ?auto_913672 ?auto_913673 ) ) ( ON ?auto_913671 ?auto_913672 ) ( ON ?auto_913670 ?auto_913671 ) ( ON ?auto_913669 ?auto_913670 ) ( ON ?auto_913668 ?auto_913669 ) ( ON ?auto_913667 ?auto_913668 ) ( ON ?auto_913666 ?auto_913667 ) ( ON ?auto_913665 ?auto_913666 ) ( CLEAR ?auto_913663 ) ( ON ?auto_913664 ?auto_913665 ) ( CLEAR ?auto_913664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_913656 ?auto_913657 ?auto_913658 ?auto_913659 ?auto_913660 ?auto_913661 ?auto_913662 ?auto_913663 ?auto_913664 )
      ( MAKE-17PILE ?auto_913656 ?auto_913657 ?auto_913658 ?auto_913659 ?auto_913660 ?auto_913661 ?auto_913662 ?auto_913663 ?auto_913664 ?auto_913665 ?auto_913666 ?auto_913667 ?auto_913668 ?auto_913669 ?auto_913670 ?auto_913671 ?auto_913672 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913726 - BLOCK
      ?auto_913727 - BLOCK
      ?auto_913728 - BLOCK
      ?auto_913729 - BLOCK
      ?auto_913730 - BLOCK
      ?auto_913731 - BLOCK
      ?auto_913732 - BLOCK
      ?auto_913733 - BLOCK
      ?auto_913734 - BLOCK
      ?auto_913735 - BLOCK
      ?auto_913736 - BLOCK
      ?auto_913737 - BLOCK
      ?auto_913738 - BLOCK
      ?auto_913739 - BLOCK
      ?auto_913740 - BLOCK
      ?auto_913741 - BLOCK
      ?auto_913742 - BLOCK
    )
    :vars
    (
      ?auto_913743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913742 ?auto_913743 ) ( ON-TABLE ?auto_913726 ) ( ON ?auto_913727 ?auto_913726 ) ( ON ?auto_913728 ?auto_913727 ) ( ON ?auto_913729 ?auto_913728 ) ( ON ?auto_913730 ?auto_913729 ) ( ON ?auto_913731 ?auto_913730 ) ( ON ?auto_913732 ?auto_913731 ) ( not ( = ?auto_913726 ?auto_913727 ) ) ( not ( = ?auto_913726 ?auto_913728 ) ) ( not ( = ?auto_913726 ?auto_913729 ) ) ( not ( = ?auto_913726 ?auto_913730 ) ) ( not ( = ?auto_913726 ?auto_913731 ) ) ( not ( = ?auto_913726 ?auto_913732 ) ) ( not ( = ?auto_913726 ?auto_913733 ) ) ( not ( = ?auto_913726 ?auto_913734 ) ) ( not ( = ?auto_913726 ?auto_913735 ) ) ( not ( = ?auto_913726 ?auto_913736 ) ) ( not ( = ?auto_913726 ?auto_913737 ) ) ( not ( = ?auto_913726 ?auto_913738 ) ) ( not ( = ?auto_913726 ?auto_913739 ) ) ( not ( = ?auto_913726 ?auto_913740 ) ) ( not ( = ?auto_913726 ?auto_913741 ) ) ( not ( = ?auto_913726 ?auto_913742 ) ) ( not ( = ?auto_913726 ?auto_913743 ) ) ( not ( = ?auto_913727 ?auto_913728 ) ) ( not ( = ?auto_913727 ?auto_913729 ) ) ( not ( = ?auto_913727 ?auto_913730 ) ) ( not ( = ?auto_913727 ?auto_913731 ) ) ( not ( = ?auto_913727 ?auto_913732 ) ) ( not ( = ?auto_913727 ?auto_913733 ) ) ( not ( = ?auto_913727 ?auto_913734 ) ) ( not ( = ?auto_913727 ?auto_913735 ) ) ( not ( = ?auto_913727 ?auto_913736 ) ) ( not ( = ?auto_913727 ?auto_913737 ) ) ( not ( = ?auto_913727 ?auto_913738 ) ) ( not ( = ?auto_913727 ?auto_913739 ) ) ( not ( = ?auto_913727 ?auto_913740 ) ) ( not ( = ?auto_913727 ?auto_913741 ) ) ( not ( = ?auto_913727 ?auto_913742 ) ) ( not ( = ?auto_913727 ?auto_913743 ) ) ( not ( = ?auto_913728 ?auto_913729 ) ) ( not ( = ?auto_913728 ?auto_913730 ) ) ( not ( = ?auto_913728 ?auto_913731 ) ) ( not ( = ?auto_913728 ?auto_913732 ) ) ( not ( = ?auto_913728 ?auto_913733 ) ) ( not ( = ?auto_913728 ?auto_913734 ) ) ( not ( = ?auto_913728 ?auto_913735 ) ) ( not ( = ?auto_913728 ?auto_913736 ) ) ( not ( = ?auto_913728 ?auto_913737 ) ) ( not ( = ?auto_913728 ?auto_913738 ) ) ( not ( = ?auto_913728 ?auto_913739 ) ) ( not ( = ?auto_913728 ?auto_913740 ) ) ( not ( = ?auto_913728 ?auto_913741 ) ) ( not ( = ?auto_913728 ?auto_913742 ) ) ( not ( = ?auto_913728 ?auto_913743 ) ) ( not ( = ?auto_913729 ?auto_913730 ) ) ( not ( = ?auto_913729 ?auto_913731 ) ) ( not ( = ?auto_913729 ?auto_913732 ) ) ( not ( = ?auto_913729 ?auto_913733 ) ) ( not ( = ?auto_913729 ?auto_913734 ) ) ( not ( = ?auto_913729 ?auto_913735 ) ) ( not ( = ?auto_913729 ?auto_913736 ) ) ( not ( = ?auto_913729 ?auto_913737 ) ) ( not ( = ?auto_913729 ?auto_913738 ) ) ( not ( = ?auto_913729 ?auto_913739 ) ) ( not ( = ?auto_913729 ?auto_913740 ) ) ( not ( = ?auto_913729 ?auto_913741 ) ) ( not ( = ?auto_913729 ?auto_913742 ) ) ( not ( = ?auto_913729 ?auto_913743 ) ) ( not ( = ?auto_913730 ?auto_913731 ) ) ( not ( = ?auto_913730 ?auto_913732 ) ) ( not ( = ?auto_913730 ?auto_913733 ) ) ( not ( = ?auto_913730 ?auto_913734 ) ) ( not ( = ?auto_913730 ?auto_913735 ) ) ( not ( = ?auto_913730 ?auto_913736 ) ) ( not ( = ?auto_913730 ?auto_913737 ) ) ( not ( = ?auto_913730 ?auto_913738 ) ) ( not ( = ?auto_913730 ?auto_913739 ) ) ( not ( = ?auto_913730 ?auto_913740 ) ) ( not ( = ?auto_913730 ?auto_913741 ) ) ( not ( = ?auto_913730 ?auto_913742 ) ) ( not ( = ?auto_913730 ?auto_913743 ) ) ( not ( = ?auto_913731 ?auto_913732 ) ) ( not ( = ?auto_913731 ?auto_913733 ) ) ( not ( = ?auto_913731 ?auto_913734 ) ) ( not ( = ?auto_913731 ?auto_913735 ) ) ( not ( = ?auto_913731 ?auto_913736 ) ) ( not ( = ?auto_913731 ?auto_913737 ) ) ( not ( = ?auto_913731 ?auto_913738 ) ) ( not ( = ?auto_913731 ?auto_913739 ) ) ( not ( = ?auto_913731 ?auto_913740 ) ) ( not ( = ?auto_913731 ?auto_913741 ) ) ( not ( = ?auto_913731 ?auto_913742 ) ) ( not ( = ?auto_913731 ?auto_913743 ) ) ( not ( = ?auto_913732 ?auto_913733 ) ) ( not ( = ?auto_913732 ?auto_913734 ) ) ( not ( = ?auto_913732 ?auto_913735 ) ) ( not ( = ?auto_913732 ?auto_913736 ) ) ( not ( = ?auto_913732 ?auto_913737 ) ) ( not ( = ?auto_913732 ?auto_913738 ) ) ( not ( = ?auto_913732 ?auto_913739 ) ) ( not ( = ?auto_913732 ?auto_913740 ) ) ( not ( = ?auto_913732 ?auto_913741 ) ) ( not ( = ?auto_913732 ?auto_913742 ) ) ( not ( = ?auto_913732 ?auto_913743 ) ) ( not ( = ?auto_913733 ?auto_913734 ) ) ( not ( = ?auto_913733 ?auto_913735 ) ) ( not ( = ?auto_913733 ?auto_913736 ) ) ( not ( = ?auto_913733 ?auto_913737 ) ) ( not ( = ?auto_913733 ?auto_913738 ) ) ( not ( = ?auto_913733 ?auto_913739 ) ) ( not ( = ?auto_913733 ?auto_913740 ) ) ( not ( = ?auto_913733 ?auto_913741 ) ) ( not ( = ?auto_913733 ?auto_913742 ) ) ( not ( = ?auto_913733 ?auto_913743 ) ) ( not ( = ?auto_913734 ?auto_913735 ) ) ( not ( = ?auto_913734 ?auto_913736 ) ) ( not ( = ?auto_913734 ?auto_913737 ) ) ( not ( = ?auto_913734 ?auto_913738 ) ) ( not ( = ?auto_913734 ?auto_913739 ) ) ( not ( = ?auto_913734 ?auto_913740 ) ) ( not ( = ?auto_913734 ?auto_913741 ) ) ( not ( = ?auto_913734 ?auto_913742 ) ) ( not ( = ?auto_913734 ?auto_913743 ) ) ( not ( = ?auto_913735 ?auto_913736 ) ) ( not ( = ?auto_913735 ?auto_913737 ) ) ( not ( = ?auto_913735 ?auto_913738 ) ) ( not ( = ?auto_913735 ?auto_913739 ) ) ( not ( = ?auto_913735 ?auto_913740 ) ) ( not ( = ?auto_913735 ?auto_913741 ) ) ( not ( = ?auto_913735 ?auto_913742 ) ) ( not ( = ?auto_913735 ?auto_913743 ) ) ( not ( = ?auto_913736 ?auto_913737 ) ) ( not ( = ?auto_913736 ?auto_913738 ) ) ( not ( = ?auto_913736 ?auto_913739 ) ) ( not ( = ?auto_913736 ?auto_913740 ) ) ( not ( = ?auto_913736 ?auto_913741 ) ) ( not ( = ?auto_913736 ?auto_913742 ) ) ( not ( = ?auto_913736 ?auto_913743 ) ) ( not ( = ?auto_913737 ?auto_913738 ) ) ( not ( = ?auto_913737 ?auto_913739 ) ) ( not ( = ?auto_913737 ?auto_913740 ) ) ( not ( = ?auto_913737 ?auto_913741 ) ) ( not ( = ?auto_913737 ?auto_913742 ) ) ( not ( = ?auto_913737 ?auto_913743 ) ) ( not ( = ?auto_913738 ?auto_913739 ) ) ( not ( = ?auto_913738 ?auto_913740 ) ) ( not ( = ?auto_913738 ?auto_913741 ) ) ( not ( = ?auto_913738 ?auto_913742 ) ) ( not ( = ?auto_913738 ?auto_913743 ) ) ( not ( = ?auto_913739 ?auto_913740 ) ) ( not ( = ?auto_913739 ?auto_913741 ) ) ( not ( = ?auto_913739 ?auto_913742 ) ) ( not ( = ?auto_913739 ?auto_913743 ) ) ( not ( = ?auto_913740 ?auto_913741 ) ) ( not ( = ?auto_913740 ?auto_913742 ) ) ( not ( = ?auto_913740 ?auto_913743 ) ) ( not ( = ?auto_913741 ?auto_913742 ) ) ( not ( = ?auto_913741 ?auto_913743 ) ) ( not ( = ?auto_913742 ?auto_913743 ) ) ( ON ?auto_913741 ?auto_913742 ) ( ON ?auto_913740 ?auto_913741 ) ( ON ?auto_913739 ?auto_913740 ) ( ON ?auto_913738 ?auto_913739 ) ( ON ?auto_913737 ?auto_913738 ) ( ON ?auto_913736 ?auto_913737 ) ( ON ?auto_913735 ?auto_913736 ) ( ON ?auto_913734 ?auto_913735 ) ( CLEAR ?auto_913732 ) ( ON ?auto_913733 ?auto_913734 ) ( CLEAR ?auto_913733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_913726 ?auto_913727 ?auto_913728 ?auto_913729 ?auto_913730 ?auto_913731 ?auto_913732 ?auto_913733 )
      ( MAKE-17PILE ?auto_913726 ?auto_913727 ?auto_913728 ?auto_913729 ?auto_913730 ?auto_913731 ?auto_913732 ?auto_913733 ?auto_913734 ?auto_913735 ?auto_913736 ?auto_913737 ?auto_913738 ?auto_913739 ?auto_913740 ?auto_913741 ?auto_913742 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913796 - BLOCK
      ?auto_913797 - BLOCK
      ?auto_913798 - BLOCK
      ?auto_913799 - BLOCK
      ?auto_913800 - BLOCK
      ?auto_913801 - BLOCK
      ?auto_913802 - BLOCK
      ?auto_913803 - BLOCK
      ?auto_913804 - BLOCK
      ?auto_913805 - BLOCK
      ?auto_913806 - BLOCK
      ?auto_913807 - BLOCK
      ?auto_913808 - BLOCK
      ?auto_913809 - BLOCK
      ?auto_913810 - BLOCK
      ?auto_913811 - BLOCK
      ?auto_913812 - BLOCK
    )
    :vars
    (
      ?auto_913813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913812 ?auto_913813 ) ( ON-TABLE ?auto_913796 ) ( ON ?auto_913797 ?auto_913796 ) ( ON ?auto_913798 ?auto_913797 ) ( ON ?auto_913799 ?auto_913798 ) ( ON ?auto_913800 ?auto_913799 ) ( ON ?auto_913801 ?auto_913800 ) ( not ( = ?auto_913796 ?auto_913797 ) ) ( not ( = ?auto_913796 ?auto_913798 ) ) ( not ( = ?auto_913796 ?auto_913799 ) ) ( not ( = ?auto_913796 ?auto_913800 ) ) ( not ( = ?auto_913796 ?auto_913801 ) ) ( not ( = ?auto_913796 ?auto_913802 ) ) ( not ( = ?auto_913796 ?auto_913803 ) ) ( not ( = ?auto_913796 ?auto_913804 ) ) ( not ( = ?auto_913796 ?auto_913805 ) ) ( not ( = ?auto_913796 ?auto_913806 ) ) ( not ( = ?auto_913796 ?auto_913807 ) ) ( not ( = ?auto_913796 ?auto_913808 ) ) ( not ( = ?auto_913796 ?auto_913809 ) ) ( not ( = ?auto_913796 ?auto_913810 ) ) ( not ( = ?auto_913796 ?auto_913811 ) ) ( not ( = ?auto_913796 ?auto_913812 ) ) ( not ( = ?auto_913796 ?auto_913813 ) ) ( not ( = ?auto_913797 ?auto_913798 ) ) ( not ( = ?auto_913797 ?auto_913799 ) ) ( not ( = ?auto_913797 ?auto_913800 ) ) ( not ( = ?auto_913797 ?auto_913801 ) ) ( not ( = ?auto_913797 ?auto_913802 ) ) ( not ( = ?auto_913797 ?auto_913803 ) ) ( not ( = ?auto_913797 ?auto_913804 ) ) ( not ( = ?auto_913797 ?auto_913805 ) ) ( not ( = ?auto_913797 ?auto_913806 ) ) ( not ( = ?auto_913797 ?auto_913807 ) ) ( not ( = ?auto_913797 ?auto_913808 ) ) ( not ( = ?auto_913797 ?auto_913809 ) ) ( not ( = ?auto_913797 ?auto_913810 ) ) ( not ( = ?auto_913797 ?auto_913811 ) ) ( not ( = ?auto_913797 ?auto_913812 ) ) ( not ( = ?auto_913797 ?auto_913813 ) ) ( not ( = ?auto_913798 ?auto_913799 ) ) ( not ( = ?auto_913798 ?auto_913800 ) ) ( not ( = ?auto_913798 ?auto_913801 ) ) ( not ( = ?auto_913798 ?auto_913802 ) ) ( not ( = ?auto_913798 ?auto_913803 ) ) ( not ( = ?auto_913798 ?auto_913804 ) ) ( not ( = ?auto_913798 ?auto_913805 ) ) ( not ( = ?auto_913798 ?auto_913806 ) ) ( not ( = ?auto_913798 ?auto_913807 ) ) ( not ( = ?auto_913798 ?auto_913808 ) ) ( not ( = ?auto_913798 ?auto_913809 ) ) ( not ( = ?auto_913798 ?auto_913810 ) ) ( not ( = ?auto_913798 ?auto_913811 ) ) ( not ( = ?auto_913798 ?auto_913812 ) ) ( not ( = ?auto_913798 ?auto_913813 ) ) ( not ( = ?auto_913799 ?auto_913800 ) ) ( not ( = ?auto_913799 ?auto_913801 ) ) ( not ( = ?auto_913799 ?auto_913802 ) ) ( not ( = ?auto_913799 ?auto_913803 ) ) ( not ( = ?auto_913799 ?auto_913804 ) ) ( not ( = ?auto_913799 ?auto_913805 ) ) ( not ( = ?auto_913799 ?auto_913806 ) ) ( not ( = ?auto_913799 ?auto_913807 ) ) ( not ( = ?auto_913799 ?auto_913808 ) ) ( not ( = ?auto_913799 ?auto_913809 ) ) ( not ( = ?auto_913799 ?auto_913810 ) ) ( not ( = ?auto_913799 ?auto_913811 ) ) ( not ( = ?auto_913799 ?auto_913812 ) ) ( not ( = ?auto_913799 ?auto_913813 ) ) ( not ( = ?auto_913800 ?auto_913801 ) ) ( not ( = ?auto_913800 ?auto_913802 ) ) ( not ( = ?auto_913800 ?auto_913803 ) ) ( not ( = ?auto_913800 ?auto_913804 ) ) ( not ( = ?auto_913800 ?auto_913805 ) ) ( not ( = ?auto_913800 ?auto_913806 ) ) ( not ( = ?auto_913800 ?auto_913807 ) ) ( not ( = ?auto_913800 ?auto_913808 ) ) ( not ( = ?auto_913800 ?auto_913809 ) ) ( not ( = ?auto_913800 ?auto_913810 ) ) ( not ( = ?auto_913800 ?auto_913811 ) ) ( not ( = ?auto_913800 ?auto_913812 ) ) ( not ( = ?auto_913800 ?auto_913813 ) ) ( not ( = ?auto_913801 ?auto_913802 ) ) ( not ( = ?auto_913801 ?auto_913803 ) ) ( not ( = ?auto_913801 ?auto_913804 ) ) ( not ( = ?auto_913801 ?auto_913805 ) ) ( not ( = ?auto_913801 ?auto_913806 ) ) ( not ( = ?auto_913801 ?auto_913807 ) ) ( not ( = ?auto_913801 ?auto_913808 ) ) ( not ( = ?auto_913801 ?auto_913809 ) ) ( not ( = ?auto_913801 ?auto_913810 ) ) ( not ( = ?auto_913801 ?auto_913811 ) ) ( not ( = ?auto_913801 ?auto_913812 ) ) ( not ( = ?auto_913801 ?auto_913813 ) ) ( not ( = ?auto_913802 ?auto_913803 ) ) ( not ( = ?auto_913802 ?auto_913804 ) ) ( not ( = ?auto_913802 ?auto_913805 ) ) ( not ( = ?auto_913802 ?auto_913806 ) ) ( not ( = ?auto_913802 ?auto_913807 ) ) ( not ( = ?auto_913802 ?auto_913808 ) ) ( not ( = ?auto_913802 ?auto_913809 ) ) ( not ( = ?auto_913802 ?auto_913810 ) ) ( not ( = ?auto_913802 ?auto_913811 ) ) ( not ( = ?auto_913802 ?auto_913812 ) ) ( not ( = ?auto_913802 ?auto_913813 ) ) ( not ( = ?auto_913803 ?auto_913804 ) ) ( not ( = ?auto_913803 ?auto_913805 ) ) ( not ( = ?auto_913803 ?auto_913806 ) ) ( not ( = ?auto_913803 ?auto_913807 ) ) ( not ( = ?auto_913803 ?auto_913808 ) ) ( not ( = ?auto_913803 ?auto_913809 ) ) ( not ( = ?auto_913803 ?auto_913810 ) ) ( not ( = ?auto_913803 ?auto_913811 ) ) ( not ( = ?auto_913803 ?auto_913812 ) ) ( not ( = ?auto_913803 ?auto_913813 ) ) ( not ( = ?auto_913804 ?auto_913805 ) ) ( not ( = ?auto_913804 ?auto_913806 ) ) ( not ( = ?auto_913804 ?auto_913807 ) ) ( not ( = ?auto_913804 ?auto_913808 ) ) ( not ( = ?auto_913804 ?auto_913809 ) ) ( not ( = ?auto_913804 ?auto_913810 ) ) ( not ( = ?auto_913804 ?auto_913811 ) ) ( not ( = ?auto_913804 ?auto_913812 ) ) ( not ( = ?auto_913804 ?auto_913813 ) ) ( not ( = ?auto_913805 ?auto_913806 ) ) ( not ( = ?auto_913805 ?auto_913807 ) ) ( not ( = ?auto_913805 ?auto_913808 ) ) ( not ( = ?auto_913805 ?auto_913809 ) ) ( not ( = ?auto_913805 ?auto_913810 ) ) ( not ( = ?auto_913805 ?auto_913811 ) ) ( not ( = ?auto_913805 ?auto_913812 ) ) ( not ( = ?auto_913805 ?auto_913813 ) ) ( not ( = ?auto_913806 ?auto_913807 ) ) ( not ( = ?auto_913806 ?auto_913808 ) ) ( not ( = ?auto_913806 ?auto_913809 ) ) ( not ( = ?auto_913806 ?auto_913810 ) ) ( not ( = ?auto_913806 ?auto_913811 ) ) ( not ( = ?auto_913806 ?auto_913812 ) ) ( not ( = ?auto_913806 ?auto_913813 ) ) ( not ( = ?auto_913807 ?auto_913808 ) ) ( not ( = ?auto_913807 ?auto_913809 ) ) ( not ( = ?auto_913807 ?auto_913810 ) ) ( not ( = ?auto_913807 ?auto_913811 ) ) ( not ( = ?auto_913807 ?auto_913812 ) ) ( not ( = ?auto_913807 ?auto_913813 ) ) ( not ( = ?auto_913808 ?auto_913809 ) ) ( not ( = ?auto_913808 ?auto_913810 ) ) ( not ( = ?auto_913808 ?auto_913811 ) ) ( not ( = ?auto_913808 ?auto_913812 ) ) ( not ( = ?auto_913808 ?auto_913813 ) ) ( not ( = ?auto_913809 ?auto_913810 ) ) ( not ( = ?auto_913809 ?auto_913811 ) ) ( not ( = ?auto_913809 ?auto_913812 ) ) ( not ( = ?auto_913809 ?auto_913813 ) ) ( not ( = ?auto_913810 ?auto_913811 ) ) ( not ( = ?auto_913810 ?auto_913812 ) ) ( not ( = ?auto_913810 ?auto_913813 ) ) ( not ( = ?auto_913811 ?auto_913812 ) ) ( not ( = ?auto_913811 ?auto_913813 ) ) ( not ( = ?auto_913812 ?auto_913813 ) ) ( ON ?auto_913811 ?auto_913812 ) ( ON ?auto_913810 ?auto_913811 ) ( ON ?auto_913809 ?auto_913810 ) ( ON ?auto_913808 ?auto_913809 ) ( ON ?auto_913807 ?auto_913808 ) ( ON ?auto_913806 ?auto_913807 ) ( ON ?auto_913805 ?auto_913806 ) ( ON ?auto_913804 ?auto_913805 ) ( ON ?auto_913803 ?auto_913804 ) ( CLEAR ?auto_913801 ) ( ON ?auto_913802 ?auto_913803 ) ( CLEAR ?auto_913802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_913796 ?auto_913797 ?auto_913798 ?auto_913799 ?auto_913800 ?auto_913801 ?auto_913802 )
      ( MAKE-17PILE ?auto_913796 ?auto_913797 ?auto_913798 ?auto_913799 ?auto_913800 ?auto_913801 ?auto_913802 ?auto_913803 ?auto_913804 ?auto_913805 ?auto_913806 ?auto_913807 ?auto_913808 ?auto_913809 ?auto_913810 ?auto_913811 ?auto_913812 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913866 - BLOCK
      ?auto_913867 - BLOCK
      ?auto_913868 - BLOCK
      ?auto_913869 - BLOCK
      ?auto_913870 - BLOCK
      ?auto_913871 - BLOCK
      ?auto_913872 - BLOCK
      ?auto_913873 - BLOCK
      ?auto_913874 - BLOCK
      ?auto_913875 - BLOCK
      ?auto_913876 - BLOCK
      ?auto_913877 - BLOCK
      ?auto_913878 - BLOCK
      ?auto_913879 - BLOCK
      ?auto_913880 - BLOCK
      ?auto_913881 - BLOCK
      ?auto_913882 - BLOCK
    )
    :vars
    (
      ?auto_913883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913882 ?auto_913883 ) ( ON-TABLE ?auto_913866 ) ( ON ?auto_913867 ?auto_913866 ) ( ON ?auto_913868 ?auto_913867 ) ( ON ?auto_913869 ?auto_913868 ) ( ON ?auto_913870 ?auto_913869 ) ( not ( = ?auto_913866 ?auto_913867 ) ) ( not ( = ?auto_913866 ?auto_913868 ) ) ( not ( = ?auto_913866 ?auto_913869 ) ) ( not ( = ?auto_913866 ?auto_913870 ) ) ( not ( = ?auto_913866 ?auto_913871 ) ) ( not ( = ?auto_913866 ?auto_913872 ) ) ( not ( = ?auto_913866 ?auto_913873 ) ) ( not ( = ?auto_913866 ?auto_913874 ) ) ( not ( = ?auto_913866 ?auto_913875 ) ) ( not ( = ?auto_913866 ?auto_913876 ) ) ( not ( = ?auto_913866 ?auto_913877 ) ) ( not ( = ?auto_913866 ?auto_913878 ) ) ( not ( = ?auto_913866 ?auto_913879 ) ) ( not ( = ?auto_913866 ?auto_913880 ) ) ( not ( = ?auto_913866 ?auto_913881 ) ) ( not ( = ?auto_913866 ?auto_913882 ) ) ( not ( = ?auto_913866 ?auto_913883 ) ) ( not ( = ?auto_913867 ?auto_913868 ) ) ( not ( = ?auto_913867 ?auto_913869 ) ) ( not ( = ?auto_913867 ?auto_913870 ) ) ( not ( = ?auto_913867 ?auto_913871 ) ) ( not ( = ?auto_913867 ?auto_913872 ) ) ( not ( = ?auto_913867 ?auto_913873 ) ) ( not ( = ?auto_913867 ?auto_913874 ) ) ( not ( = ?auto_913867 ?auto_913875 ) ) ( not ( = ?auto_913867 ?auto_913876 ) ) ( not ( = ?auto_913867 ?auto_913877 ) ) ( not ( = ?auto_913867 ?auto_913878 ) ) ( not ( = ?auto_913867 ?auto_913879 ) ) ( not ( = ?auto_913867 ?auto_913880 ) ) ( not ( = ?auto_913867 ?auto_913881 ) ) ( not ( = ?auto_913867 ?auto_913882 ) ) ( not ( = ?auto_913867 ?auto_913883 ) ) ( not ( = ?auto_913868 ?auto_913869 ) ) ( not ( = ?auto_913868 ?auto_913870 ) ) ( not ( = ?auto_913868 ?auto_913871 ) ) ( not ( = ?auto_913868 ?auto_913872 ) ) ( not ( = ?auto_913868 ?auto_913873 ) ) ( not ( = ?auto_913868 ?auto_913874 ) ) ( not ( = ?auto_913868 ?auto_913875 ) ) ( not ( = ?auto_913868 ?auto_913876 ) ) ( not ( = ?auto_913868 ?auto_913877 ) ) ( not ( = ?auto_913868 ?auto_913878 ) ) ( not ( = ?auto_913868 ?auto_913879 ) ) ( not ( = ?auto_913868 ?auto_913880 ) ) ( not ( = ?auto_913868 ?auto_913881 ) ) ( not ( = ?auto_913868 ?auto_913882 ) ) ( not ( = ?auto_913868 ?auto_913883 ) ) ( not ( = ?auto_913869 ?auto_913870 ) ) ( not ( = ?auto_913869 ?auto_913871 ) ) ( not ( = ?auto_913869 ?auto_913872 ) ) ( not ( = ?auto_913869 ?auto_913873 ) ) ( not ( = ?auto_913869 ?auto_913874 ) ) ( not ( = ?auto_913869 ?auto_913875 ) ) ( not ( = ?auto_913869 ?auto_913876 ) ) ( not ( = ?auto_913869 ?auto_913877 ) ) ( not ( = ?auto_913869 ?auto_913878 ) ) ( not ( = ?auto_913869 ?auto_913879 ) ) ( not ( = ?auto_913869 ?auto_913880 ) ) ( not ( = ?auto_913869 ?auto_913881 ) ) ( not ( = ?auto_913869 ?auto_913882 ) ) ( not ( = ?auto_913869 ?auto_913883 ) ) ( not ( = ?auto_913870 ?auto_913871 ) ) ( not ( = ?auto_913870 ?auto_913872 ) ) ( not ( = ?auto_913870 ?auto_913873 ) ) ( not ( = ?auto_913870 ?auto_913874 ) ) ( not ( = ?auto_913870 ?auto_913875 ) ) ( not ( = ?auto_913870 ?auto_913876 ) ) ( not ( = ?auto_913870 ?auto_913877 ) ) ( not ( = ?auto_913870 ?auto_913878 ) ) ( not ( = ?auto_913870 ?auto_913879 ) ) ( not ( = ?auto_913870 ?auto_913880 ) ) ( not ( = ?auto_913870 ?auto_913881 ) ) ( not ( = ?auto_913870 ?auto_913882 ) ) ( not ( = ?auto_913870 ?auto_913883 ) ) ( not ( = ?auto_913871 ?auto_913872 ) ) ( not ( = ?auto_913871 ?auto_913873 ) ) ( not ( = ?auto_913871 ?auto_913874 ) ) ( not ( = ?auto_913871 ?auto_913875 ) ) ( not ( = ?auto_913871 ?auto_913876 ) ) ( not ( = ?auto_913871 ?auto_913877 ) ) ( not ( = ?auto_913871 ?auto_913878 ) ) ( not ( = ?auto_913871 ?auto_913879 ) ) ( not ( = ?auto_913871 ?auto_913880 ) ) ( not ( = ?auto_913871 ?auto_913881 ) ) ( not ( = ?auto_913871 ?auto_913882 ) ) ( not ( = ?auto_913871 ?auto_913883 ) ) ( not ( = ?auto_913872 ?auto_913873 ) ) ( not ( = ?auto_913872 ?auto_913874 ) ) ( not ( = ?auto_913872 ?auto_913875 ) ) ( not ( = ?auto_913872 ?auto_913876 ) ) ( not ( = ?auto_913872 ?auto_913877 ) ) ( not ( = ?auto_913872 ?auto_913878 ) ) ( not ( = ?auto_913872 ?auto_913879 ) ) ( not ( = ?auto_913872 ?auto_913880 ) ) ( not ( = ?auto_913872 ?auto_913881 ) ) ( not ( = ?auto_913872 ?auto_913882 ) ) ( not ( = ?auto_913872 ?auto_913883 ) ) ( not ( = ?auto_913873 ?auto_913874 ) ) ( not ( = ?auto_913873 ?auto_913875 ) ) ( not ( = ?auto_913873 ?auto_913876 ) ) ( not ( = ?auto_913873 ?auto_913877 ) ) ( not ( = ?auto_913873 ?auto_913878 ) ) ( not ( = ?auto_913873 ?auto_913879 ) ) ( not ( = ?auto_913873 ?auto_913880 ) ) ( not ( = ?auto_913873 ?auto_913881 ) ) ( not ( = ?auto_913873 ?auto_913882 ) ) ( not ( = ?auto_913873 ?auto_913883 ) ) ( not ( = ?auto_913874 ?auto_913875 ) ) ( not ( = ?auto_913874 ?auto_913876 ) ) ( not ( = ?auto_913874 ?auto_913877 ) ) ( not ( = ?auto_913874 ?auto_913878 ) ) ( not ( = ?auto_913874 ?auto_913879 ) ) ( not ( = ?auto_913874 ?auto_913880 ) ) ( not ( = ?auto_913874 ?auto_913881 ) ) ( not ( = ?auto_913874 ?auto_913882 ) ) ( not ( = ?auto_913874 ?auto_913883 ) ) ( not ( = ?auto_913875 ?auto_913876 ) ) ( not ( = ?auto_913875 ?auto_913877 ) ) ( not ( = ?auto_913875 ?auto_913878 ) ) ( not ( = ?auto_913875 ?auto_913879 ) ) ( not ( = ?auto_913875 ?auto_913880 ) ) ( not ( = ?auto_913875 ?auto_913881 ) ) ( not ( = ?auto_913875 ?auto_913882 ) ) ( not ( = ?auto_913875 ?auto_913883 ) ) ( not ( = ?auto_913876 ?auto_913877 ) ) ( not ( = ?auto_913876 ?auto_913878 ) ) ( not ( = ?auto_913876 ?auto_913879 ) ) ( not ( = ?auto_913876 ?auto_913880 ) ) ( not ( = ?auto_913876 ?auto_913881 ) ) ( not ( = ?auto_913876 ?auto_913882 ) ) ( not ( = ?auto_913876 ?auto_913883 ) ) ( not ( = ?auto_913877 ?auto_913878 ) ) ( not ( = ?auto_913877 ?auto_913879 ) ) ( not ( = ?auto_913877 ?auto_913880 ) ) ( not ( = ?auto_913877 ?auto_913881 ) ) ( not ( = ?auto_913877 ?auto_913882 ) ) ( not ( = ?auto_913877 ?auto_913883 ) ) ( not ( = ?auto_913878 ?auto_913879 ) ) ( not ( = ?auto_913878 ?auto_913880 ) ) ( not ( = ?auto_913878 ?auto_913881 ) ) ( not ( = ?auto_913878 ?auto_913882 ) ) ( not ( = ?auto_913878 ?auto_913883 ) ) ( not ( = ?auto_913879 ?auto_913880 ) ) ( not ( = ?auto_913879 ?auto_913881 ) ) ( not ( = ?auto_913879 ?auto_913882 ) ) ( not ( = ?auto_913879 ?auto_913883 ) ) ( not ( = ?auto_913880 ?auto_913881 ) ) ( not ( = ?auto_913880 ?auto_913882 ) ) ( not ( = ?auto_913880 ?auto_913883 ) ) ( not ( = ?auto_913881 ?auto_913882 ) ) ( not ( = ?auto_913881 ?auto_913883 ) ) ( not ( = ?auto_913882 ?auto_913883 ) ) ( ON ?auto_913881 ?auto_913882 ) ( ON ?auto_913880 ?auto_913881 ) ( ON ?auto_913879 ?auto_913880 ) ( ON ?auto_913878 ?auto_913879 ) ( ON ?auto_913877 ?auto_913878 ) ( ON ?auto_913876 ?auto_913877 ) ( ON ?auto_913875 ?auto_913876 ) ( ON ?auto_913874 ?auto_913875 ) ( ON ?auto_913873 ?auto_913874 ) ( ON ?auto_913872 ?auto_913873 ) ( CLEAR ?auto_913870 ) ( ON ?auto_913871 ?auto_913872 ) ( CLEAR ?auto_913871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_913866 ?auto_913867 ?auto_913868 ?auto_913869 ?auto_913870 ?auto_913871 )
      ( MAKE-17PILE ?auto_913866 ?auto_913867 ?auto_913868 ?auto_913869 ?auto_913870 ?auto_913871 ?auto_913872 ?auto_913873 ?auto_913874 ?auto_913875 ?auto_913876 ?auto_913877 ?auto_913878 ?auto_913879 ?auto_913880 ?auto_913881 ?auto_913882 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_913936 - BLOCK
      ?auto_913937 - BLOCK
      ?auto_913938 - BLOCK
      ?auto_913939 - BLOCK
      ?auto_913940 - BLOCK
      ?auto_913941 - BLOCK
      ?auto_913942 - BLOCK
      ?auto_913943 - BLOCK
      ?auto_913944 - BLOCK
      ?auto_913945 - BLOCK
      ?auto_913946 - BLOCK
      ?auto_913947 - BLOCK
      ?auto_913948 - BLOCK
      ?auto_913949 - BLOCK
      ?auto_913950 - BLOCK
      ?auto_913951 - BLOCK
      ?auto_913952 - BLOCK
    )
    :vars
    (
      ?auto_913953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_913952 ?auto_913953 ) ( ON-TABLE ?auto_913936 ) ( ON ?auto_913937 ?auto_913936 ) ( ON ?auto_913938 ?auto_913937 ) ( ON ?auto_913939 ?auto_913938 ) ( not ( = ?auto_913936 ?auto_913937 ) ) ( not ( = ?auto_913936 ?auto_913938 ) ) ( not ( = ?auto_913936 ?auto_913939 ) ) ( not ( = ?auto_913936 ?auto_913940 ) ) ( not ( = ?auto_913936 ?auto_913941 ) ) ( not ( = ?auto_913936 ?auto_913942 ) ) ( not ( = ?auto_913936 ?auto_913943 ) ) ( not ( = ?auto_913936 ?auto_913944 ) ) ( not ( = ?auto_913936 ?auto_913945 ) ) ( not ( = ?auto_913936 ?auto_913946 ) ) ( not ( = ?auto_913936 ?auto_913947 ) ) ( not ( = ?auto_913936 ?auto_913948 ) ) ( not ( = ?auto_913936 ?auto_913949 ) ) ( not ( = ?auto_913936 ?auto_913950 ) ) ( not ( = ?auto_913936 ?auto_913951 ) ) ( not ( = ?auto_913936 ?auto_913952 ) ) ( not ( = ?auto_913936 ?auto_913953 ) ) ( not ( = ?auto_913937 ?auto_913938 ) ) ( not ( = ?auto_913937 ?auto_913939 ) ) ( not ( = ?auto_913937 ?auto_913940 ) ) ( not ( = ?auto_913937 ?auto_913941 ) ) ( not ( = ?auto_913937 ?auto_913942 ) ) ( not ( = ?auto_913937 ?auto_913943 ) ) ( not ( = ?auto_913937 ?auto_913944 ) ) ( not ( = ?auto_913937 ?auto_913945 ) ) ( not ( = ?auto_913937 ?auto_913946 ) ) ( not ( = ?auto_913937 ?auto_913947 ) ) ( not ( = ?auto_913937 ?auto_913948 ) ) ( not ( = ?auto_913937 ?auto_913949 ) ) ( not ( = ?auto_913937 ?auto_913950 ) ) ( not ( = ?auto_913937 ?auto_913951 ) ) ( not ( = ?auto_913937 ?auto_913952 ) ) ( not ( = ?auto_913937 ?auto_913953 ) ) ( not ( = ?auto_913938 ?auto_913939 ) ) ( not ( = ?auto_913938 ?auto_913940 ) ) ( not ( = ?auto_913938 ?auto_913941 ) ) ( not ( = ?auto_913938 ?auto_913942 ) ) ( not ( = ?auto_913938 ?auto_913943 ) ) ( not ( = ?auto_913938 ?auto_913944 ) ) ( not ( = ?auto_913938 ?auto_913945 ) ) ( not ( = ?auto_913938 ?auto_913946 ) ) ( not ( = ?auto_913938 ?auto_913947 ) ) ( not ( = ?auto_913938 ?auto_913948 ) ) ( not ( = ?auto_913938 ?auto_913949 ) ) ( not ( = ?auto_913938 ?auto_913950 ) ) ( not ( = ?auto_913938 ?auto_913951 ) ) ( not ( = ?auto_913938 ?auto_913952 ) ) ( not ( = ?auto_913938 ?auto_913953 ) ) ( not ( = ?auto_913939 ?auto_913940 ) ) ( not ( = ?auto_913939 ?auto_913941 ) ) ( not ( = ?auto_913939 ?auto_913942 ) ) ( not ( = ?auto_913939 ?auto_913943 ) ) ( not ( = ?auto_913939 ?auto_913944 ) ) ( not ( = ?auto_913939 ?auto_913945 ) ) ( not ( = ?auto_913939 ?auto_913946 ) ) ( not ( = ?auto_913939 ?auto_913947 ) ) ( not ( = ?auto_913939 ?auto_913948 ) ) ( not ( = ?auto_913939 ?auto_913949 ) ) ( not ( = ?auto_913939 ?auto_913950 ) ) ( not ( = ?auto_913939 ?auto_913951 ) ) ( not ( = ?auto_913939 ?auto_913952 ) ) ( not ( = ?auto_913939 ?auto_913953 ) ) ( not ( = ?auto_913940 ?auto_913941 ) ) ( not ( = ?auto_913940 ?auto_913942 ) ) ( not ( = ?auto_913940 ?auto_913943 ) ) ( not ( = ?auto_913940 ?auto_913944 ) ) ( not ( = ?auto_913940 ?auto_913945 ) ) ( not ( = ?auto_913940 ?auto_913946 ) ) ( not ( = ?auto_913940 ?auto_913947 ) ) ( not ( = ?auto_913940 ?auto_913948 ) ) ( not ( = ?auto_913940 ?auto_913949 ) ) ( not ( = ?auto_913940 ?auto_913950 ) ) ( not ( = ?auto_913940 ?auto_913951 ) ) ( not ( = ?auto_913940 ?auto_913952 ) ) ( not ( = ?auto_913940 ?auto_913953 ) ) ( not ( = ?auto_913941 ?auto_913942 ) ) ( not ( = ?auto_913941 ?auto_913943 ) ) ( not ( = ?auto_913941 ?auto_913944 ) ) ( not ( = ?auto_913941 ?auto_913945 ) ) ( not ( = ?auto_913941 ?auto_913946 ) ) ( not ( = ?auto_913941 ?auto_913947 ) ) ( not ( = ?auto_913941 ?auto_913948 ) ) ( not ( = ?auto_913941 ?auto_913949 ) ) ( not ( = ?auto_913941 ?auto_913950 ) ) ( not ( = ?auto_913941 ?auto_913951 ) ) ( not ( = ?auto_913941 ?auto_913952 ) ) ( not ( = ?auto_913941 ?auto_913953 ) ) ( not ( = ?auto_913942 ?auto_913943 ) ) ( not ( = ?auto_913942 ?auto_913944 ) ) ( not ( = ?auto_913942 ?auto_913945 ) ) ( not ( = ?auto_913942 ?auto_913946 ) ) ( not ( = ?auto_913942 ?auto_913947 ) ) ( not ( = ?auto_913942 ?auto_913948 ) ) ( not ( = ?auto_913942 ?auto_913949 ) ) ( not ( = ?auto_913942 ?auto_913950 ) ) ( not ( = ?auto_913942 ?auto_913951 ) ) ( not ( = ?auto_913942 ?auto_913952 ) ) ( not ( = ?auto_913942 ?auto_913953 ) ) ( not ( = ?auto_913943 ?auto_913944 ) ) ( not ( = ?auto_913943 ?auto_913945 ) ) ( not ( = ?auto_913943 ?auto_913946 ) ) ( not ( = ?auto_913943 ?auto_913947 ) ) ( not ( = ?auto_913943 ?auto_913948 ) ) ( not ( = ?auto_913943 ?auto_913949 ) ) ( not ( = ?auto_913943 ?auto_913950 ) ) ( not ( = ?auto_913943 ?auto_913951 ) ) ( not ( = ?auto_913943 ?auto_913952 ) ) ( not ( = ?auto_913943 ?auto_913953 ) ) ( not ( = ?auto_913944 ?auto_913945 ) ) ( not ( = ?auto_913944 ?auto_913946 ) ) ( not ( = ?auto_913944 ?auto_913947 ) ) ( not ( = ?auto_913944 ?auto_913948 ) ) ( not ( = ?auto_913944 ?auto_913949 ) ) ( not ( = ?auto_913944 ?auto_913950 ) ) ( not ( = ?auto_913944 ?auto_913951 ) ) ( not ( = ?auto_913944 ?auto_913952 ) ) ( not ( = ?auto_913944 ?auto_913953 ) ) ( not ( = ?auto_913945 ?auto_913946 ) ) ( not ( = ?auto_913945 ?auto_913947 ) ) ( not ( = ?auto_913945 ?auto_913948 ) ) ( not ( = ?auto_913945 ?auto_913949 ) ) ( not ( = ?auto_913945 ?auto_913950 ) ) ( not ( = ?auto_913945 ?auto_913951 ) ) ( not ( = ?auto_913945 ?auto_913952 ) ) ( not ( = ?auto_913945 ?auto_913953 ) ) ( not ( = ?auto_913946 ?auto_913947 ) ) ( not ( = ?auto_913946 ?auto_913948 ) ) ( not ( = ?auto_913946 ?auto_913949 ) ) ( not ( = ?auto_913946 ?auto_913950 ) ) ( not ( = ?auto_913946 ?auto_913951 ) ) ( not ( = ?auto_913946 ?auto_913952 ) ) ( not ( = ?auto_913946 ?auto_913953 ) ) ( not ( = ?auto_913947 ?auto_913948 ) ) ( not ( = ?auto_913947 ?auto_913949 ) ) ( not ( = ?auto_913947 ?auto_913950 ) ) ( not ( = ?auto_913947 ?auto_913951 ) ) ( not ( = ?auto_913947 ?auto_913952 ) ) ( not ( = ?auto_913947 ?auto_913953 ) ) ( not ( = ?auto_913948 ?auto_913949 ) ) ( not ( = ?auto_913948 ?auto_913950 ) ) ( not ( = ?auto_913948 ?auto_913951 ) ) ( not ( = ?auto_913948 ?auto_913952 ) ) ( not ( = ?auto_913948 ?auto_913953 ) ) ( not ( = ?auto_913949 ?auto_913950 ) ) ( not ( = ?auto_913949 ?auto_913951 ) ) ( not ( = ?auto_913949 ?auto_913952 ) ) ( not ( = ?auto_913949 ?auto_913953 ) ) ( not ( = ?auto_913950 ?auto_913951 ) ) ( not ( = ?auto_913950 ?auto_913952 ) ) ( not ( = ?auto_913950 ?auto_913953 ) ) ( not ( = ?auto_913951 ?auto_913952 ) ) ( not ( = ?auto_913951 ?auto_913953 ) ) ( not ( = ?auto_913952 ?auto_913953 ) ) ( ON ?auto_913951 ?auto_913952 ) ( ON ?auto_913950 ?auto_913951 ) ( ON ?auto_913949 ?auto_913950 ) ( ON ?auto_913948 ?auto_913949 ) ( ON ?auto_913947 ?auto_913948 ) ( ON ?auto_913946 ?auto_913947 ) ( ON ?auto_913945 ?auto_913946 ) ( ON ?auto_913944 ?auto_913945 ) ( ON ?auto_913943 ?auto_913944 ) ( ON ?auto_913942 ?auto_913943 ) ( ON ?auto_913941 ?auto_913942 ) ( CLEAR ?auto_913939 ) ( ON ?auto_913940 ?auto_913941 ) ( CLEAR ?auto_913940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_913936 ?auto_913937 ?auto_913938 ?auto_913939 ?auto_913940 )
      ( MAKE-17PILE ?auto_913936 ?auto_913937 ?auto_913938 ?auto_913939 ?auto_913940 ?auto_913941 ?auto_913942 ?auto_913943 ?auto_913944 ?auto_913945 ?auto_913946 ?auto_913947 ?auto_913948 ?auto_913949 ?auto_913950 ?auto_913951 ?auto_913952 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_914006 - BLOCK
      ?auto_914007 - BLOCK
      ?auto_914008 - BLOCK
      ?auto_914009 - BLOCK
      ?auto_914010 - BLOCK
      ?auto_914011 - BLOCK
      ?auto_914012 - BLOCK
      ?auto_914013 - BLOCK
      ?auto_914014 - BLOCK
      ?auto_914015 - BLOCK
      ?auto_914016 - BLOCK
      ?auto_914017 - BLOCK
      ?auto_914018 - BLOCK
      ?auto_914019 - BLOCK
      ?auto_914020 - BLOCK
      ?auto_914021 - BLOCK
      ?auto_914022 - BLOCK
    )
    :vars
    (
      ?auto_914023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914022 ?auto_914023 ) ( ON-TABLE ?auto_914006 ) ( ON ?auto_914007 ?auto_914006 ) ( ON ?auto_914008 ?auto_914007 ) ( not ( = ?auto_914006 ?auto_914007 ) ) ( not ( = ?auto_914006 ?auto_914008 ) ) ( not ( = ?auto_914006 ?auto_914009 ) ) ( not ( = ?auto_914006 ?auto_914010 ) ) ( not ( = ?auto_914006 ?auto_914011 ) ) ( not ( = ?auto_914006 ?auto_914012 ) ) ( not ( = ?auto_914006 ?auto_914013 ) ) ( not ( = ?auto_914006 ?auto_914014 ) ) ( not ( = ?auto_914006 ?auto_914015 ) ) ( not ( = ?auto_914006 ?auto_914016 ) ) ( not ( = ?auto_914006 ?auto_914017 ) ) ( not ( = ?auto_914006 ?auto_914018 ) ) ( not ( = ?auto_914006 ?auto_914019 ) ) ( not ( = ?auto_914006 ?auto_914020 ) ) ( not ( = ?auto_914006 ?auto_914021 ) ) ( not ( = ?auto_914006 ?auto_914022 ) ) ( not ( = ?auto_914006 ?auto_914023 ) ) ( not ( = ?auto_914007 ?auto_914008 ) ) ( not ( = ?auto_914007 ?auto_914009 ) ) ( not ( = ?auto_914007 ?auto_914010 ) ) ( not ( = ?auto_914007 ?auto_914011 ) ) ( not ( = ?auto_914007 ?auto_914012 ) ) ( not ( = ?auto_914007 ?auto_914013 ) ) ( not ( = ?auto_914007 ?auto_914014 ) ) ( not ( = ?auto_914007 ?auto_914015 ) ) ( not ( = ?auto_914007 ?auto_914016 ) ) ( not ( = ?auto_914007 ?auto_914017 ) ) ( not ( = ?auto_914007 ?auto_914018 ) ) ( not ( = ?auto_914007 ?auto_914019 ) ) ( not ( = ?auto_914007 ?auto_914020 ) ) ( not ( = ?auto_914007 ?auto_914021 ) ) ( not ( = ?auto_914007 ?auto_914022 ) ) ( not ( = ?auto_914007 ?auto_914023 ) ) ( not ( = ?auto_914008 ?auto_914009 ) ) ( not ( = ?auto_914008 ?auto_914010 ) ) ( not ( = ?auto_914008 ?auto_914011 ) ) ( not ( = ?auto_914008 ?auto_914012 ) ) ( not ( = ?auto_914008 ?auto_914013 ) ) ( not ( = ?auto_914008 ?auto_914014 ) ) ( not ( = ?auto_914008 ?auto_914015 ) ) ( not ( = ?auto_914008 ?auto_914016 ) ) ( not ( = ?auto_914008 ?auto_914017 ) ) ( not ( = ?auto_914008 ?auto_914018 ) ) ( not ( = ?auto_914008 ?auto_914019 ) ) ( not ( = ?auto_914008 ?auto_914020 ) ) ( not ( = ?auto_914008 ?auto_914021 ) ) ( not ( = ?auto_914008 ?auto_914022 ) ) ( not ( = ?auto_914008 ?auto_914023 ) ) ( not ( = ?auto_914009 ?auto_914010 ) ) ( not ( = ?auto_914009 ?auto_914011 ) ) ( not ( = ?auto_914009 ?auto_914012 ) ) ( not ( = ?auto_914009 ?auto_914013 ) ) ( not ( = ?auto_914009 ?auto_914014 ) ) ( not ( = ?auto_914009 ?auto_914015 ) ) ( not ( = ?auto_914009 ?auto_914016 ) ) ( not ( = ?auto_914009 ?auto_914017 ) ) ( not ( = ?auto_914009 ?auto_914018 ) ) ( not ( = ?auto_914009 ?auto_914019 ) ) ( not ( = ?auto_914009 ?auto_914020 ) ) ( not ( = ?auto_914009 ?auto_914021 ) ) ( not ( = ?auto_914009 ?auto_914022 ) ) ( not ( = ?auto_914009 ?auto_914023 ) ) ( not ( = ?auto_914010 ?auto_914011 ) ) ( not ( = ?auto_914010 ?auto_914012 ) ) ( not ( = ?auto_914010 ?auto_914013 ) ) ( not ( = ?auto_914010 ?auto_914014 ) ) ( not ( = ?auto_914010 ?auto_914015 ) ) ( not ( = ?auto_914010 ?auto_914016 ) ) ( not ( = ?auto_914010 ?auto_914017 ) ) ( not ( = ?auto_914010 ?auto_914018 ) ) ( not ( = ?auto_914010 ?auto_914019 ) ) ( not ( = ?auto_914010 ?auto_914020 ) ) ( not ( = ?auto_914010 ?auto_914021 ) ) ( not ( = ?auto_914010 ?auto_914022 ) ) ( not ( = ?auto_914010 ?auto_914023 ) ) ( not ( = ?auto_914011 ?auto_914012 ) ) ( not ( = ?auto_914011 ?auto_914013 ) ) ( not ( = ?auto_914011 ?auto_914014 ) ) ( not ( = ?auto_914011 ?auto_914015 ) ) ( not ( = ?auto_914011 ?auto_914016 ) ) ( not ( = ?auto_914011 ?auto_914017 ) ) ( not ( = ?auto_914011 ?auto_914018 ) ) ( not ( = ?auto_914011 ?auto_914019 ) ) ( not ( = ?auto_914011 ?auto_914020 ) ) ( not ( = ?auto_914011 ?auto_914021 ) ) ( not ( = ?auto_914011 ?auto_914022 ) ) ( not ( = ?auto_914011 ?auto_914023 ) ) ( not ( = ?auto_914012 ?auto_914013 ) ) ( not ( = ?auto_914012 ?auto_914014 ) ) ( not ( = ?auto_914012 ?auto_914015 ) ) ( not ( = ?auto_914012 ?auto_914016 ) ) ( not ( = ?auto_914012 ?auto_914017 ) ) ( not ( = ?auto_914012 ?auto_914018 ) ) ( not ( = ?auto_914012 ?auto_914019 ) ) ( not ( = ?auto_914012 ?auto_914020 ) ) ( not ( = ?auto_914012 ?auto_914021 ) ) ( not ( = ?auto_914012 ?auto_914022 ) ) ( not ( = ?auto_914012 ?auto_914023 ) ) ( not ( = ?auto_914013 ?auto_914014 ) ) ( not ( = ?auto_914013 ?auto_914015 ) ) ( not ( = ?auto_914013 ?auto_914016 ) ) ( not ( = ?auto_914013 ?auto_914017 ) ) ( not ( = ?auto_914013 ?auto_914018 ) ) ( not ( = ?auto_914013 ?auto_914019 ) ) ( not ( = ?auto_914013 ?auto_914020 ) ) ( not ( = ?auto_914013 ?auto_914021 ) ) ( not ( = ?auto_914013 ?auto_914022 ) ) ( not ( = ?auto_914013 ?auto_914023 ) ) ( not ( = ?auto_914014 ?auto_914015 ) ) ( not ( = ?auto_914014 ?auto_914016 ) ) ( not ( = ?auto_914014 ?auto_914017 ) ) ( not ( = ?auto_914014 ?auto_914018 ) ) ( not ( = ?auto_914014 ?auto_914019 ) ) ( not ( = ?auto_914014 ?auto_914020 ) ) ( not ( = ?auto_914014 ?auto_914021 ) ) ( not ( = ?auto_914014 ?auto_914022 ) ) ( not ( = ?auto_914014 ?auto_914023 ) ) ( not ( = ?auto_914015 ?auto_914016 ) ) ( not ( = ?auto_914015 ?auto_914017 ) ) ( not ( = ?auto_914015 ?auto_914018 ) ) ( not ( = ?auto_914015 ?auto_914019 ) ) ( not ( = ?auto_914015 ?auto_914020 ) ) ( not ( = ?auto_914015 ?auto_914021 ) ) ( not ( = ?auto_914015 ?auto_914022 ) ) ( not ( = ?auto_914015 ?auto_914023 ) ) ( not ( = ?auto_914016 ?auto_914017 ) ) ( not ( = ?auto_914016 ?auto_914018 ) ) ( not ( = ?auto_914016 ?auto_914019 ) ) ( not ( = ?auto_914016 ?auto_914020 ) ) ( not ( = ?auto_914016 ?auto_914021 ) ) ( not ( = ?auto_914016 ?auto_914022 ) ) ( not ( = ?auto_914016 ?auto_914023 ) ) ( not ( = ?auto_914017 ?auto_914018 ) ) ( not ( = ?auto_914017 ?auto_914019 ) ) ( not ( = ?auto_914017 ?auto_914020 ) ) ( not ( = ?auto_914017 ?auto_914021 ) ) ( not ( = ?auto_914017 ?auto_914022 ) ) ( not ( = ?auto_914017 ?auto_914023 ) ) ( not ( = ?auto_914018 ?auto_914019 ) ) ( not ( = ?auto_914018 ?auto_914020 ) ) ( not ( = ?auto_914018 ?auto_914021 ) ) ( not ( = ?auto_914018 ?auto_914022 ) ) ( not ( = ?auto_914018 ?auto_914023 ) ) ( not ( = ?auto_914019 ?auto_914020 ) ) ( not ( = ?auto_914019 ?auto_914021 ) ) ( not ( = ?auto_914019 ?auto_914022 ) ) ( not ( = ?auto_914019 ?auto_914023 ) ) ( not ( = ?auto_914020 ?auto_914021 ) ) ( not ( = ?auto_914020 ?auto_914022 ) ) ( not ( = ?auto_914020 ?auto_914023 ) ) ( not ( = ?auto_914021 ?auto_914022 ) ) ( not ( = ?auto_914021 ?auto_914023 ) ) ( not ( = ?auto_914022 ?auto_914023 ) ) ( ON ?auto_914021 ?auto_914022 ) ( ON ?auto_914020 ?auto_914021 ) ( ON ?auto_914019 ?auto_914020 ) ( ON ?auto_914018 ?auto_914019 ) ( ON ?auto_914017 ?auto_914018 ) ( ON ?auto_914016 ?auto_914017 ) ( ON ?auto_914015 ?auto_914016 ) ( ON ?auto_914014 ?auto_914015 ) ( ON ?auto_914013 ?auto_914014 ) ( ON ?auto_914012 ?auto_914013 ) ( ON ?auto_914011 ?auto_914012 ) ( ON ?auto_914010 ?auto_914011 ) ( CLEAR ?auto_914008 ) ( ON ?auto_914009 ?auto_914010 ) ( CLEAR ?auto_914009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_914006 ?auto_914007 ?auto_914008 ?auto_914009 )
      ( MAKE-17PILE ?auto_914006 ?auto_914007 ?auto_914008 ?auto_914009 ?auto_914010 ?auto_914011 ?auto_914012 ?auto_914013 ?auto_914014 ?auto_914015 ?auto_914016 ?auto_914017 ?auto_914018 ?auto_914019 ?auto_914020 ?auto_914021 ?auto_914022 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_914076 - BLOCK
      ?auto_914077 - BLOCK
      ?auto_914078 - BLOCK
      ?auto_914079 - BLOCK
      ?auto_914080 - BLOCK
      ?auto_914081 - BLOCK
      ?auto_914082 - BLOCK
      ?auto_914083 - BLOCK
      ?auto_914084 - BLOCK
      ?auto_914085 - BLOCK
      ?auto_914086 - BLOCK
      ?auto_914087 - BLOCK
      ?auto_914088 - BLOCK
      ?auto_914089 - BLOCK
      ?auto_914090 - BLOCK
      ?auto_914091 - BLOCK
      ?auto_914092 - BLOCK
    )
    :vars
    (
      ?auto_914093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914092 ?auto_914093 ) ( ON-TABLE ?auto_914076 ) ( ON ?auto_914077 ?auto_914076 ) ( not ( = ?auto_914076 ?auto_914077 ) ) ( not ( = ?auto_914076 ?auto_914078 ) ) ( not ( = ?auto_914076 ?auto_914079 ) ) ( not ( = ?auto_914076 ?auto_914080 ) ) ( not ( = ?auto_914076 ?auto_914081 ) ) ( not ( = ?auto_914076 ?auto_914082 ) ) ( not ( = ?auto_914076 ?auto_914083 ) ) ( not ( = ?auto_914076 ?auto_914084 ) ) ( not ( = ?auto_914076 ?auto_914085 ) ) ( not ( = ?auto_914076 ?auto_914086 ) ) ( not ( = ?auto_914076 ?auto_914087 ) ) ( not ( = ?auto_914076 ?auto_914088 ) ) ( not ( = ?auto_914076 ?auto_914089 ) ) ( not ( = ?auto_914076 ?auto_914090 ) ) ( not ( = ?auto_914076 ?auto_914091 ) ) ( not ( = ?auto_914076 ?auto_914092 ) ) ( not ( = ?auto_914076 ?auto_914093 ) ) ( not ( = ?auto_914077 ?auto_914078 ) ) ( not ( = ?auto_914077 ?auto_914079 ) ) ( not ( = ?auto_914077 ?auto_914080 ) ) ( not ( = ?auto_914077 ?auto_914081 ) ) ( not ( = ?auto_914077 ?auto_914082 ) ) ( not ( = ?auto_914077 ?auto_914083 ) ) ( not ( = ?auto_914077 ?auto_914084 ) ) ( not ( = ?auto_914077 ?auto_914085 ) ) ( not ( = ?auto_914077 ?auto_914086 ) ) ( not ( = ?auto_914077 ?auto_914087 ) ) ( not ( = ?auto_914077 ?auto_914088 ) ) ( not ( = ?auto_914077 ?auto_914089 ) ) ( not ( = ?auto_914077 ?auto_914090 ) ) ( not ( = ?auto_914077 ?auto_914091 ) ) ( not ( = ?auto_914077 ?auto_914092 ) ) ( not ( = ?auto_914077 ?auto_914093 ) ) ( not ( = ?auto_914078 ?auto_914079 ) ) ( not ( = ?auto_914078 ?auto_914080 ) ) ( not ( = ?auto_914078 ?auto_914081 ) ) ( not ( = ?auto_914078 ?auto_914082 ) ) ( not ( = ?auto_914078 ?auto_914083 ) ) ( not ( = ?auto_914078 ?auto_914084 ) ) ( not ( = ?auto_914078 ?auto_914085 ) ) ( not ( = ?auto_914078 ?auto_914086 ) ) ( not ( = ?auto_914078 ?auto_914087 ) ) ( not ( = ?auto_914078 ?auto_914088 ) ) ( not ( = ?auto_914078 ?auto_914089 ) ) ( not ( = ?auto_914078 ?auto_914090 ) ) ( not ( = ?auto_914078 ?auto_914091 ) ) ( not ( = ?auto_914078 ?auto_914092 ) ) ( not ( = ?auto_914078 ?auto_914093 ) ) ( not ( = ?auto_914079 ?auto_914080 ) ) ( not ( = ?auto_914079 ?auto_914081 ) ) ( not ( = ?auto_914079 ?auto_914082 ) ) ( not ( = ?auto_914079 ?auto_914083 ) ) ( not ( = ?auto_914079 ?auto_914084 ) ) ( not ( = ?auto_914079 ?auto_914085 ) ) ( not ( = ?auto_914079 ?auto_914086 ) ) ( not ( = ?auto_914079 ?auto_914087 ) ) ( not ( = ?auto_914079 ?auto_914088 ) ) ( not ( = ?auto_914079 ?auto_914089 ) ) ( not ( = ?auto_914079 ?auto_914090 ) ) ( not ( = ?auto_914079 ?auto_914091 ) ) ( not ( = ?auto_914079 ?auto_914092 ) ) ( not ( = ?auto_914079 ?auto_914093 ) ) ( not ( = ?auto_914080 ?auto_914081 ) ) ( not ( = ?auto_914080 ?auto_914082 ) ) ( not ( = ?auto_914080 ?auto_914083 ) ) ( not ( = ?auto_914080 ?auto_914084 ) ) ( not ( = ?auto_914080 ?auto_914085 ) ) ( not ( = ?auto_914080 ?auto_914086 ) ) ( not ( = ?auto_914080 ?auto_914087 ) ) ( not ( = ?auto_914080 ?auto_914088 ) ) ( not ( = ?auto_914080 ?auto_914089 ) ) ( not ( = ?auto_914080 ?auto_914090 ) ) ( not ( = ?auto_914080 ?auto_914091 ) ) ( not ( = ?auto_914080 ?auto_914092 ) ) ( not ( = ?auto_914080 ?auto_914093 ) ) ( not ( = ?auto_914081 ?auto_914082 ) ) ( not ( = ?auto_914081 ?auto_914083 ) ) ( not ( = ?auto_914081 ?auto_914084 ) ) ( not ( = ?auto_914081 ?auto_914085 ) ) ( not ( = ?auto_914081 ?auto_914086 ) ) ( not ( = ?auto_914081 ?auto_914087 ) ) ( not ( = ?auto_914081 ?auto_914088 ) ) ( not ( = ?auto_914081 ?auto_914089 ) ) ( not ( = ?auto_914081 ?auto_914090 ) ) ( not ( = ?auto_914081 ?auto_914091 ) ) ( not ( = ?auto_914081 ?auto_914092 ) ) ( not ( = ?auto_914081 ?auto_914093 ) ) ( not ( = ?auto_914082 ?auto_914083 ) ) ( not ( = ?auto_914082 ?auto_914084 ) ) ( not ( = ?auto_914082 ?auto_914085 ) ) ( not ( = ?auto_914082 ?auto_914086 ) ) ( not ( = ?auto_914082 ?auto_914087 ) ) ( not ( = ?auto_914082 ?auto_914088 ) ) ( not ( = ?auto_914082 ?auto_914089 ) ) ( not ( = ?auto_914082 ?auto_914090 ) ) ( not ( = ?auto_914082 ?auto_914091 ) ) ( not ( = ?auto_914082 ?auto_914092 ) ) ( not ( = ?auto_914082 ?auto_914093 ) ) ( not ( = ?auto_914083 ?auto_914084 ) ) ( not ( = ?auto_914083 ?auto_914085 ) ) ( not ( = ?auto_914083 ?auto_914086 ) ) ( not ( = ?auto_914083 ?auto_914087 ) ) ( not ( = ?auto_914083 ?auto_914088 ) ) ( not ( = ?auto_914083 ?auto_914089 ) ) ( not ( = ?auto_914083 ?auto_914090 ) ) ( not ( = ?auto_914083 ?auto_914091 ) ) ( not ( = ?auto_914083 ?auto_914092 ) ) ( not ( = ?auto_914083 ?auto_914093 ) ) ( not ( = ?auto_914084 ?auto_914085 ) ) ( not ( = ?auto_914084 ?auto_914086 ) ) ( not ( = ?auto_914084 ?auto_914087 ) ) ( not ( = ?auto_914084 ?auto_914088 ) ) ( not ( = ?auto_914084 ?auto_914089 ) ) ( not ( = ?auto_914084 ?auto_914090 ) ) ( not ( = ?auto_914084 ?auto_914091 ) ) ( not ( = ?auto_914084 ?auto_914092 ) ) ( not ( = ?auto_914084 ?auto_914093 ) ) ( not ( = ?auto_914085 ?auto_914086 ) ) ( not ( = ?auto_914085 ?auto_914087 ) ) ( not ( = ?auto_914085 ?auto_914088 ) ) ( not ( = ?auto_914085 ?auto_914089 ) ) ( not ( = ?auto_914085 ?auto_914090 ) ) ( not ( = ?auto_914085 ?auto_914091 ) ) ( not ( = ?auto_914085 ?auto_914092 ) ) ( not ( = ?auto_914085 ?auto_914093 ) ) ( not ( = ?auto_914086 ?auto_914087 ) ) ( not ( = ?auto_914086 ?auto_914088 ) ) ( not ( = ?auto_914086 ?auto_914089 ) ) ( not ( = ?auto_914086 ?auto_914090 ) ) ( not ( = ?auto_914086 ?auto_914091 ) ) ( not ( = ?auto_914086 ?auto_914092 ) ) ( not ( = ?auto_914086 ?auto_914093 ) ) ( not ( = ?auto_914087 ?auto_914088 ) ) ( not ( = ?auto_914087 ?auto_914089 ) ) ( not ( = ?auto_914087 ?auto_914090 ) ) ( not ( = ?auto_914087 ?auto_914091 ) ) ( not ( = ?auto_914087 ?auto_914092 ) ) ( not ( = ?auto_914087 ?auto_914093 ) ) ( not ( = ?auto_914088 ?auto_914089 ) ) ( not ( = ?auto_914088 ?auto_914090 ) ) ( not ( = ?auto_914088 ?auto_914091 ) ) ( not ( = ?auto_914088 ?auto_914092 ) ) ( not ( = ?auto_914088 ?auto_914093 ) ) ( not ( = ?auto_914089 ?auto_914090 ) ) ( not ( = ?auto_914089 ?auto_914091 ) ) ( not ( = ?auto_914089 ?auto_914092 ) ) ( not ( = ?auto_914089 ?auto_914093 ) ) ( not ( = ?auto_914090 ?auto_914091 ) ) ( not ( = ?auto_914090 ?auto_914092 ) ) ( not ( = ?auto_914090 ?auto_914093 ) ) ( not ( = ?auto_914091 ?auto_914092 ) ) ( not ( = ?auto_914091 ?auto_914093 ) ) ( not ( = ?auto_914092 ?auto_914093 ) ) ( ON ?auto_914091 ?auto_914092 ) ( ON ?auto_914090 ?auto_914091 ) ( ON ?auto_914089 ?auto_914090 ) ( ON ?auto_914088 ?auto_914089 ) ( ON ?auto_914087 ?auto_914088 ) ( ON ?auto_914086 ?auto_914087 ) ( ON ?auto_914085 ?auto_914086 ) ( ON ?auto_914084 ?auto_914085 ) ( ON ?auto_914083 ?auto_914084 ) ( ON ?auto_914082 ?auto_914083 ) ( ON ?auto_914081 ?auto_914082 ) ( ON ?auto_914080 ?auto_914081 ) ( ON ?auto_914079 ?auto_914080 ) ( CLEAR ?auto_914077 ) ( ON ?auto_914078 ?auto_914079 ) ( CLEAR ?auto_914078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_914076 ?auto_914077 ?auto_914078 )
      ( MAKE-17PILE ?auto_914076 ?auto_914077 ?auto_914078 ?auto_914079 ?auto_914080 ?auto_914081 ?auto_914082 ?auto_914083 ?auto_914084 ?auto_914085 ?auto_914086 ?auto_914087 ?auto_914088 ?auto_914089 ?auto_914090 ?auto_914091 ?auto_914092 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_914146 - BLOCK
      ?auto_914147 - BLOCK
      ?auto_914148 - BLOCK
      ?auto_914149 - BLOCK
      ?auto_914150 - BLOCK
      ?auto_914151 - BLOCK
      ?auto_914152 - BLOCK
      ?auto_914153 - BLOCK
      ?auto_914154 - BLOCK
      ?auto_914155 - BLOCK
      ?auto_914156 - BLOCK
      ?auto_914157 - BLOCK
      ?auto_914158 - BLOCK
      ?auto_914159 - BLOCK
      ?auto_914160 - BLOCK
      ?auto_914161 - BLOCK
      ?auto_914162 - BLOCK
    )
    :vars
    (
      ?auto_914163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914162 ?auto_914163 ) ( ON-TABLE ?auto_914146 ) ( not ( = ?auto_914146 ?auto_914147 ) ) ( not ( = ?auto_914146 ?auto_914148 ) ) ( not ( = ?auto_914146 ?auto_914149 ) ) ( not ( = ?auto_914146 ?auto_914150 ) ) ( not ( = ?auto_914146 ?auto_914151 ) ) ( not ( = ?auto_914146 ?auto_914152 ) ) ( not ( = ?auto_914146 ?auto_914153 ) ) ( not ( = ?auto_914146 ?auto_914154 ) ) ( not ( = ?auto_914146 ?auto_914155 ) ) ( not ( = ?auto_914146 ?auto_914156 ) ) ( not ( = ?auto_914146 ?auto_914157 ) ) ( not ( = ?auto_914146 ?auto_914158 ) ) ( not ( = ?auto_914146 ?auto_914159 ) ) ( not ( = ?auto_914146 ?auto_914160 ) ) ( not ( = ?auto_914146 ?auto_914161 ) ) ( not ( = ?auto_914146 ?auto_914162 ) ) ( not ( = ?auto_914146 ?auto_914163 ) ) ( not ( = ?auto_914147 ?auto_914148 ) ) ( not ( = ?auto_914147 ?auto_914149 ) ) ( not ( = ?auto_914147 ?auto_914150 ) ) ( not ( = ?auto_914147 ?auto_914151 ) ) ( not ( = ?auto_914147 ?auto_914152 ) ) ( not ( = ?auto_914147 ?auto_914153 ) ) ( not ( = ?auto_914147 ?auto_914154 ) ) ( not ( = ?auto_914147 ?auto_914155 ) ) ( not ( = ?auto_914147 ?auto_914156 ) ) ( not ( = ?auto_914147 ?auto_914157 ) ) ( not ( = ?auto_914147 ?auto_914158 ) ) ( not ( = ?auto_914147 ?auto_914159 ) ) ( not ( = ?auto_914147 ?auto_914160 ) ) ( not ( = ?auto_914147 ?auto_914161 ) ) ( not ( = ?auto_914147 ?auto_914162 ) ) ( not ( = ?auto_914147 ?auto_914163 ) ) ( not ( = ?auto_914148 ?auto_914149 ) ) ( not ( = ?auto_914148 ?auto_914150 ) ) ( not ( = ?auto_914148 ?auto_914151 ) ) ( not ( = ?auto_914148 ?auto_914152 ) ) ( not ( = ?auto_914148 ?auto_914153 ) ) ( not ( = ?auto_914148 ?auto_914154 ) ) ( not ( = ?auto_914148 ?auto_914155 ) ) ( not ( = ?auto_914148 ?auto_914156 ) ) ( not ( = ?auto_914148 ?auto_914157 ) ) ( not ( = ?auto_914148 ?auto_914158 ) ) ( not ( = ?auto_914148 ?auto_914159 ) ) ( not ( = ?auto_914148 ?auto_914160 ) ) ( not ( = ?auto_914148 ?auto_914161 ) ) ( not ( = ?auto_914148 ?auto_914162 ) ) ( not ( = ?auto_914148 ?auto_914163 ) ) ( not ( = ?auto_914149 ?auto_914150 ) ) ( not ( = ?auto_914149 ?auto_914151 ) ) ( not ( = ?auto_914149 ?auto_914152 ) ) ( not ( = ?auto_914149 ?auto_914153 ) ) ( not ( = ?auto_914149 ?auto_914154 ) ) ( not ( = ?auto_914149 ?auto_914155 ) ) ( not ( = ?auto_914149 ?auto_914156 ) ) ( not ( = ?auto_914149 ?auto_914157 ) ) ( not ( = ?auto_914149 ?auto_914158 ) ) ( not ( = ?auto_914149 ?auto_914159 ) ) ( not ( = ?auto_914149 ?auto_914160 ) ) ( not ( = ?auto_914149 ?auto_914161 ) ) ( not ( = ?auto_914149 ?auto_914162 ) ) ( not ( = ?auto_914149 ?auto_914163 ) ) ( not ( = ?auto_914150 ?auto_914151 ) ) ( not ( = ?auto_914150 ?auto_914152 ) ) ( not ( = ?auto_914150 ?auto_914153 ) ) ( not ( = ?auto_914150 ?auto_914154 ) ) ( not ( = ?auto_914150 ?auto_914155 ) ) ( not ( = ?auto_914150 ?auto_914156 ) ) ( not ( = ?auto_914150 ?auto_914157 ) ) ( not ( = ?auto_914150 ?auto_914158 ) ) ( not ( = ?auto_914150 ?auto_914159 ) ) ( not ( = ?auto_914150 ?auto_914160 ) ) ( not ( = ?auto_914150 ?auto_914161 ) ) ( not ( = ?auto_914150 ?auto_914162 ) ) ( not ( = ?auto_914150 ?auto_914163 ) ) ( not ( = ?auto_914151 ?auto_914152 ) ) ( not ( = ?auto_914151 ?auto_914153 ) ) ( not ( = ?auto_914151 ?auto_914154 ) ) ( not ( = ?auto_914151 ?auto_914155 ) ) ( not ( = ?auto_914151 ?auto_914156 ) ) ( not ( = ?auto_914151 ?auto_914157 ) ) ( not ( = ?auto_914151 ?auto_914158 ) ) ( not ( = ?auto_914151 ?auto_914159 ) ) ( not ( = ?auto_914151 ?auto_914160 ) ) ( not ( = ?auto_914151 ?auto_914161 ) ) ( not ( = ?auto_914151 ?auto_914162 ) ) ( not ( = ?auto_914151 ?auto_914163 ) ) ( not ( = ?auto_914152 ?auto_914153 ) ) ( not ( = ?auto_914152 ?auto_914154 ) ) ( not ( = ?auto_914152 ?auto_914155 ) ) ( not ( = ?auto_914152 ?auto_914156 ) ) ( not ( = ?auto_914152 ?auto_914157 ) ) ( not ( = ?auto_914152 ?auto_914158 ) ) ( not ( = ?auto_914152 ?auto_914159 ) ) ( not ( = ?auto_914152 ?auto_914160 ) ) ( not ( = ?auto_914152 ?auto_914161 ) ) ( not ( = ?auto_914152 ?auto_914162 ) ) ( not ( = ?auto_914152 ?auto_914163 ) ) ( not ( = ?auto_914153 ?auto_914154 ) ) ( not ( = ?auto_914153 ?auto_914155 ) ) ( not ( = ?auto_914153 ?auto_914156 ) ) ( not ( = ?auto_914153 ?auto_914157 ) ) ( not ( = ?auto_914153 ?auto_914158 ) ) ( not ( = ?auto_914153 ?auto_914159 ) ) ( not ( = ?auto_914153 ?auto_914160 ) ) ( not ( = ?auto_914153 ?auto_914161 ) ) ( not ( = ?auto_914153 ?auto_914162 ) ) ( not ( = ?auto_914153 ?auto_914163 ) ) ( not ( = ?auto_914154 ?auto_914155 ) ) ( not ( = ?auto_914154 ?auto_914156 ) ) ( not ( = ?auto_914154 ?auto_914157 ) ) ( not ( = ?auto_914154 ?auto_914158 ) ) ( not ( = ?auto_914154 ?auto_914159 ) ) ( not ( = ?auto_914154 ?auto_914160 ) ) ( not ( = ?auto_914154 ?auto_914161 ) ) ( not ( = ?auto_914154 ?auto_914162 ) ) ( not ( = ?auto_914154 ?auto_914163 ) ) ( not ( = ?auto_914155 ?auto_914156 ) ) ( not ( = ?auto_914155 ?auto_914157 ) ) ( not ( = ?auto_914155 ?auto_914158 ) ) ( not ( = ?auto_914155 ?auto_914159 ) ) ( not ( = ?auto_914155 ?auto_914160 ) ) ( not ( = ?auto_914155 ?auto_914161 ) ) ( not ( = ?auto_914155 ?auto_914162 ) ) ( not ( = ?auto_914155 ?auto_914163 ) ) ( not ( = ?auto_914156 ?auto_914157 ) ) ( not ( = ?auto_914156 ?auto_914158 ) ) ( not ( = ?auto_914156 ?auto_914159 ) ) ( not ( = ?auto_914156 ?auto_914160 ) ) ( not ( = ?auto_914156 ?auto_914161 ) ) ( not ( = ?auto_914156 ?auto_914162 ) ) ( not ( = ?auto_914156 ?auto_914163 ) ) ( not ( = ?auto_914157 ?auto_914158 ) ) ( not ( = ?auto_914157 ?auto_914159 ) ) ( not ( = ?auto_914157 ?auto_914160 ) ) ( not ( = ?auto_914157 ?auto_914161 ) ) ( not ( = ?auto_914157 ?auto_914162 ) ) ( not ( = ?auto_914157 ?auto_914163 ) ) ( not ( = ?auto_914158 ?auto_914159 ) ) ( not ( = ?auto_914158 ?auto_914160 ) ) ( not ( = ?auto_914158 ?auto_914161 ) ) ( not ( = ?auto_914158 ?auto_914162 ) ) ( not ( = ?auto_914158 ?auto_914163 ) ) ( not ( = ?auto_914159 ?auto_914160 ) ) ( not ( = ?auto_914159 ?auto_914161 ) ) ( not ( = ?auto_914159 ?auto_914162 ) ) ( not ( = ?auto_914159 ?auto_914163 ) ) ( not ( = ?auto_914160 ?auto_914161 ) ) ( not ( = ?auto_914160 ?auto_914162 ) ) ( not ( = ?auto_914160 ?auto_914163 ) ) ( not ( = ?auto_914161 ?auto_914162 ) ) ( not ( = ?auto_914161 ?auto_914163 ) ) ( not ( = ?auto_914162 ?auto_914163 ) ) ( ON ?auto_914161 ?auto_914162 ) ( ON ?auto_914160 ?auto_914161 ) ( ON ?auto_914159 ?auto_914160 ) ( ON ?auto_914158 ?auto_914159 ) ( ON ?auto_914157 ?auto_914158 ) ( ON ?auto_914156 ?auto_914157 ) ( ON ?auto_914155 ?auto_914156 ) ( ON ?auto_914154 ?auto_914155 ) ( ON ?auto_914153 ?auto_914154 ) ( ON ?auto_914152 ?auto_914153 ) ( ON ?auto_914151 ?auto_914152 ) ( ON ?auto_914150 ?auto_914151 ) ( ON ?auto_914149 ?auto_914150 ) ( ON ?auto_914148 ?auto_914149 ) ( CLEAR ?auto_914146 ) ( ON ?auto_914147 ?auto_914148 ) ( CLEAR ?auto_914147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_914146 ?auto_914147 )
      ( MAKE-17PILE ?auto_914146 ?auto_914147 ?auto_914148 ?auto_914149 ?auto_914150 ?auto_914151 ?auto_914152 ?auto_914153 ?auto_914154 ?auto_914155 ?auto_914156 ?auto_914157 ?auto_914158 ?auto_914159 ?auto_914160 ?auto_914161 ?auto_914162 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_914216 - BLOCK
      ?auto_914217 - BLOCK
      ?auto_914218 - BLOCK
      ?auto_914219 - BLOCK
      ?auto_914220 - BLOCK
      ?auto_914221 - BLOCK
      ?auto_914222 - BLOCK
      ?auto_914223 - BLOCK
      ?auto_914224 - BLOCK
      ?auto_914225 - BLOCK
      ?auto_914226 - BLOCK
      ?auto_914227 - BLOCK
      ?auto_914228 - BLOCK
      ?auto_914229 - BLOCK
      ?auto_914230 - BLOCK
      ?auto_914231 - BLOCK
      ?auto_914232 - BLOCK
    )
    :vars
    (
      ?auto_914233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914232 ?auto_914233 ) ( not ( = ?auto_914216 ?auto_914217 ) ) ( not ( = ?auto_914216 ?auto_914218 ) ) ( not ( = ?auto_914216 ?auto_914219 ) ) ( not ( = ?auto_914216 ?auto_914220 ) ) ( not ( = ?auto_914216 ?auto_914221 ) ) ( not ( = ?auto_914216 ?auto_914222 ) ) ( not ( = ?auto_914216 ?auto_914223 ) ) ( not ( = ?auto_914216 ?auto_914224 ) ) ( not ( = ?auto_914216 ?auto_914225 ) ) ( not ( = ?auto_914216 ?auto_914226 ) ) ( not ( = ?auto_914216 ?auto_914227 ) ) ( not ( = ?auto_914216 ?auto_914228 ) ) ( not ( = ?auto_914216 ?auto_914229 ) ) ( not ( = ?auto_914216 ?auto_914230 ) ) ( not ( = ?auto_914216 ?auto_914231 ) ) ( not ( = ?auto_914216 ?auto_914232 ) ) ( not ( = ?auto_914216 ?auto_914233 ) ) ( not ( = ?auto_914217 ?auto_914218 ) ) ( not ( = ?auto_914217 ?auto_914219 ) ) ( not ( = ?auto_914217 ?auto_914220 ) ) ( not ( = ?auto_914217 ?auto_914221 ) ) ( not ( = ?auto_914217 ?auto_914222 ) ) ( not ( = ?auto_914217 ?auto_914223 ) ) ( not ( = ?auto_914217 ?auto_914224 ) ) ( not ( = ?auto_914217 ?auto_914225 ) ) ( not ( = ?auto_914217 ?auto_914226 ) ) ( not ( = ?auto_914217 ?auto_914227 ) ) ( not ( = ?auto_914217 ?auto_914228 ) ) ( not ( = ?auto_914217 ?auto_914229 ) ) ( not ( = ?auto_914217 ?auto_914230 ) ) ( not ( = ?auto_914217 ?auto_914231 ) ) ( not ( = ?auto_914217 ?auto_914232 ) ) ( not ( = ?auto_914217 ?auto_914233 ) ) ( not ( = ?auto_914218 ?auto_914219 ) ) ( not ( = ?auto_914218 ?auto_914220 ) ) ( not ( = ?auto_914218 ?auto_914221 ) ) ( not ( = ?auto_914218 ?auto_914222 ) ) ( not ( = ?auto_914218 ?auto_914223 ) ) ( not ( = ?auto_914218 ?auto_914224 ) ) ( not ( = ?auto_914218 ?auto_914225 ) ) ( not ( = ?auto_914218 ?auto_914226 ) ) ( not ( = ?auto_914218 ?auto_914227 ) ) ( not ( = ?auto_914218 ?auto_914228 ) ) ( not ( = ?auto_914218 ?auto_914229 ) ) ( not ( = ?auto_914218 ?auto_914230 ) ) ( not ( = ?auto_914218 ?auto_914231 ) ) ( not ( = ?auto_914218 ?auto_914232 ) ) ( not ( = ?auto_914218 ?auto_914233 ) ) ( not ( = ?auto_914219 ?auto_914220 ) ) ( not ( = ?auto_914219 ?auto_914221 ) ) ( not ( = ?auto_914219 ?auto_914222 ) ) ( not ( = ?auto_914219 ?auto_914223 ) ) ( not ( = ?auto_914219 ?auto_914224 ) ) ( not ( = ?auto_914219 ?auto_914225 ) ) ( not ( = ?auto_914219 ?auto_914226 ) ) ( not ( = ?auto_914219 ?auto_914227 ) ) ( not ( = ?auto_914219 ?auto_914228 ) ) ( not ( = ?auto_914219 ?auto_914229 ) ) ( not ( = ?auto_914219 ?auto_914230 ) ) ( not ( = ?auto_914219 ?auto_914231 ) ) ( not ( = ?auto_914219 ?auto_914232 ) ) ( not ( = ?auto_914219 ?auto_914233 ) ) ( not ( = ?auto_914220 ?auto_914221 ) ) ( not ( = ?auto_914220 ?auto_914222 ) ) ( not ( = ?auto_914220 ?auto_914223 ) ) ( not ( = ?auto_914220 ?auto_914224 ) ) ( not ( = ?auto_914220 ?auto_914225 ) ) ( not ( = ?auto_914220 ?auto_914226 ) ) ( not ( = ?auto_914220 ?auto_914227 ) ) ( not ( = ?auto_914220 ?auto_914228 ) ) ( not ( = ?auto_914220 ?auto_914229 ) ) ( not ( = ?auto_914220 ?auto_914230 ) ) ( not ( = ?auto_914220 ?auto_914231 ) ) ( not ( = ?auto_914220 ?auto_914232 ) ) ( not ( = ?auto_914220 ?auto_914233 ) ) ( not ( = ?auto_914221 ?auto_914222 ) ) ( not ( = ?auto_914221 ?auto_914223 ) ) ( not ( = ?auto_914221 ?auto_914224 ) ) ( not ( = ?auto_914221 ?auto_914225 ) ) ( not ( = ?auto_914221 ?auto_914226 ) ) ( not ( = ?auto_914221 ?auto_914227 ) ) ( not ( = ?auto_914221 ?auto_914228 ) ) ( not ( = ?auto_914221 ?auto_914229 ) ) ( not ( = ?auto_914221 ?auto_914230 ) ) ( not ( = ?auto_914221 ?auto_914231 ) ) ( not ( = ?auto_914221 ?auto_914232 ) ) ( not ( = ?auto_914221 ?auto_914233 ) ) ( not ( = ?auto_914222 ?auto_914223 ) ) ( not ( = ?auto_914222 ?auto_914224 ) ) ( not ( = ?auto_914222 ?auto_914225 ) ) ( not ( = ?auto_914222 ?auto_914226 ) ) ( not ( = ?auto_914222 ?auto_914227 ) ) ( not ( = ?auto_914222 ?auto_914228 ) ) ( not ( = ?auto_914222 ?auto_914229 ) ) ( not ( = ?auto_914222 ?auto_914230 ) ) ( not ( = ?auto_914222 ?auto_914231 ) ) ( not ( = ?auto_914222 ?auto_914232 ) ) ( not ( = ?auto_914222 ?auto_914233 ) ) ( not ( = ?auto_914223 ?auto_914224 ) ) ( not ( = ?auto_914223 ?auto_914225 ) ) ( not ( = ?auto_914223 ?auto_914226 ) ) ( not ( = ?auto_914223 ?auto_914227 ) ) ( not ( = ?auto_914223 ?auto_914228 ) ) ( not ( = ?auto_914223 ?auto_914229 ) ) ( not ( = ?auto_914223 ?auto_914230 ) ) ( not ( = ?auto_914223 ?auto_914231 ) ) ( not ( = ?auto_914223 ?auto_914232 ) ) ( not ( = ?auto_914223 ?auto_914233 ) ) ( not ( = ?auto_914224 ?auto_914225 ) ) ( not ( = ?auto_914224 ?auto_914226 ) ) ( not ( = ?auto_914224 ?auto_914227 ) ) ( not ( = ?auto_914224 ?auto_914228 ) ) ( not ( = ?auto_914224 ?auto_914229 ) ) ( not ( = ?auto_914224 ?auto_914230 ) ) ( not ( = ?auto_914224 ?auto_914231 ) ) ( not ( = ?auto_914224 ?auto_914232 ) ) ( not ( = ?auto_914224 ?auto_914233 ) ) ( not ( = ?auto_914225 ?auto_914226 ) ) ( not ( = ?auto_914225 ?auto_914227 ) ) ( not ( = ?auto_914225 ?auto_914228 ) ) ( not ( = ?auto_914225 ?auto_914229 ) ) ( not ( = ?auto_914225 ?auto_914230 ) ) ( not ( = ?auto_914225 ?auto_914231 ) ) ( not ( = ?auto_914225 ?auto_914232 ) ) ( not ( = ?auto_914225 ?auto_914233 ) ) ( not ( = ?auto_914226 ?auto_914227 ) ) ( not ( = ?auto_914226 ?auto_914228 ) ) ( not ( = ?auto_914226 ?auto_914229 ) ) ( not ( = ?auto_914226 ?auto_914230 ) ) ( not ( = ?auto_914226 ?auto_914231 ) ) ( not ( = ?auto_914226 ?auto_914232 ) ) ( not ( = ?auto_914226 ?auto_914233 ) ) ( not ( = ?auto_914227 ?auto_914228 ) ) ( not ( = ?auto_914227 ?auto_914229 ) ) ( not ( = ?auto_914227 ?auto_914230 ) ) ( not ( = ?auto_914227 ?auto_914231 ) ) ( not ( = ?auto_914227 ?auto_914232 ) ) ( not ( = ?auto_914227 ?auto_914233 ) ) ( not ( = ?auto_914228 ?auto_914229 ) ) ( not ( = ?auto_914228 ?auto_914230 ) ) ( not ( = ?auto_914228 ?auto_914231 ) ) ( not ( = ?auto_914228 ?auto_914232 ) ) ( not ( = ?auto_914228 ?auto_914233 ) ) ( not ( = ?auto_914229 ?auto_914230 ) ) ( not ( = ?auto_914229 ?auto_914231 ) ) ( not ( = ?auto_914229 ?auto_914232 ) ) ( not ( = ?auto_914229 ?auto_914233 ) ) ( not ( = ?auto_914230 ?auto_914231 ) ) ( not ( = ?auto_914230 ?auto_914232 ) ) ( not ( = ?auto_914230 ?auto_914233 ) ) ( not ( = ?auto_914231 ?auto_914232 ) ) ( not ( = ?auto_914231 ?auto_914233 ) ) ( not ( = ?auto_914232 ?auto_914233 ) ) ( ON ?auto_914231 ?auto_914232 ) ( ON ?auto_914230 ?auto_914231 ) ( ON ?auto_914229 ?auto_914230 ) ( ON ?auto_914228 ?auto_914229 ) ( ON ?auto_914227 ?auto_914228 ) ( ON ?auto_914226 ?auto_914227 ) ( ON ?auto_914225 ?auto_914226 ) ( ON ?auto_914224 ?auto_914225 ) ( ON ?auto_914223 ?auto_914224 ) ( ON ?auto_914222 ?auto_914223 ) ( ON ?auto_914221 ?auto_914222 ) ( ON ?auto_914220 ?auto_914221 ) ( ON ?auto_914219 ?auto_914220 ) ( ON ?auto_914218 ?auto_914219 ) ( ON ?auto_914217 ?auto_914218 ) ( ON ?auto_914216 ?auto_914217 ) ( CLEAR ?auto_914216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_914216 )
      ( MAKE-17PILE ?auto_914216 ?auto_914217 ?auto_914218 ?auto_914219 ?auto_914220 ?auto_914221 ?auto_914222 ?auto_914223 ?auto_914224 ?auto_914225 ?auto_914226 ?auto_914227 ?auto_914228 ?auto_914229 ?auto_914230 ?auto_914231 ?auto_914232 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914287 - BLOCK
      ?auto_914288 - BLOCK
      ?auto_914289 - BLOCK
      ?auto_914290 - BLOCK
      ?auto_914291 - BLOCK
      ?auto_914292 - BLOCK
      ?auto_914293 - BLOCK
      ?auto_914294 - BLOCK
      ?auto_914295 - BLOCK
      ?auto_914296 - BLOCK
      ?auto_914297 - BLOCK
      ?auto_914298 - BLOCK
      ?auto_914299 - BLOCK
      ?auto_914300 - BLOCK
      ?auto_914301 - BLOCK
      ?auto_914302 - BLOCK
      ?auto_914303 - BLOCK
      ?auto_914304 - BLOCK
    )
    :vars
    (
      ?auto_914305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_914303 ) ( ON ?auto_914304 ?auto_914305 ) ( CLEAR ?auto_914304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_914287 ) ( ON ?auto_914288 ?auto_914287 ) ( ON ?auto_914289 ?auto_914288 ) ( ON ?auto_914290 ?auto_914289 ) ( ON ?auto_914291 ?auto_914290 ) ( ON ?auto_914292 ?auto_914291 ) ( ON ?auto_914293 ?auto_914292 ) ( ON ?auto_914294 ?auto_914293 ) ( ON ?auto_914295 ?auto_914294 ) ( ON ?auto_914296 ?auto_914295 ) ( ON ?auto_914297 ?auto_914296 ) ( ON ?auto_914298 ?auto_914297 ) ( ON ?auto_914299 ?auto_914298 ) ( ON ?auto_914300 ?auto_914299 ) ( ON ?auto_914301 ?auto_914300 ) ( ON ?auto_914302 ?auto_914301 ) ( ON ?auto_914303 ?auto_914302 ) ( not ( = ?auto_914287 ?auto_914288 ) ) ( not ( = ?auto_914287 ?auto_914289 ) ) ( not ( = ?auto_914287 ?auto_914290 ) ) ( not ( = ?auto_914287 ?auto_914291 ) ) ( not ( = ?auto_914287 ?auto_914292 ) ) ( not ( = ?auto_914287 ?auto_914293 ) ) ( not ( = ?auto_914287 ?auto_914294 ) ) ( not ( = ?auto_914287 ?auto_914295 ) ) ( not ( = ?auto_914287 ?auto_914296 ) ) ( not ( = ?auto_914287 ?auto_914297 ) ) ( not ( = ?auto_914287 ?auto_914298 ) ) ( not ( = ?auto_914287 ?auto_914299 ) ) ( not ( = ?auto_914287 ?auto_914300 ) ) ( not ( = ?auto_914287 ?auto_914301 ) ) ( not ( = ?auto_914287 ?auto_914302 ) ) ( not ( = ?auto_914287 ?auto_914303 ) ) ( not ( = ?auto_914287 ?auto_914304 ) ) ( not ( = ?auto_914287 ?auto_914305 ) ) ( not ( = ?auto_914288 ?auto_914289 ) ) ( not ( = ?auto_914288 ?auto_914290 ) ) ( not ( = ?auto_914288 ?auto_914291 ) ) ( not ( = ?auto_914288 ?auto_914292 ) ) ( not ( = ?auto_914288 ?auto_914293 ) ) ( not ( = ?auto_914288 ?auto_914294 ) ) ( not ( = ?auto_914288 ?auto_914295 ) ) ( not ( = ?auto_914288 ?auto_914296 ) ) ( not ( = ?auto_914288 ?auto_914297 ) ) ( not ( = ?auto_914288 ?auto_914298 ) ) ( not ( = ?auto_914288 ?auto_914299 ) ) ( not ( = ?auto_914288 ?auto_914300 ) ) ( not ( = ?auto_914288 ?auto_914301 ) ) ( not ( = ?auto_914288 ?auto_914302 ) ) ( not ( = ?auto_914288 ?auto_914303 ) ) ( not ( = ?auto_914288 ?auto_914304 ) ) ( not ( = ?auto_914288 ?auto_914305 ) ) ( not ( = ?auto_914289 ?auto_914290 ) ) ( not ( = ?auto_914289 ?auto_914291 ) ) ( not ( = ?auto_914289 ?auto_914292 ) ) ( not ( = ?auto_914289 ?auto_914293 ) ) ( not ( = ?auto_914289 ?auto_914294 ) ) ( not ( = ?auto_914289 ?auto_914295 ) ) ( not ( = ?auto_914289 ?auto_914296 ) ) ( not ( = ?auto_914289 ?auto_914297 ) ) ( not ( = ?auto_914289 ?auto_914298 ) ) ( not ( = ?auto_914289 ?auto_914299 ) ) ( not ( = ?auto_914289 ?auto_914300 ) ) ( not ( = ?auto_914289 ?auto_914301 ) ) ( not ( = ?auto_914289 ?auto_914302 ) ) ( not ( = ?auto_914289 ?auto_914303 ) ) ( not ( = ?auto_914289 ?auto_914304 ) ) ( not ( = ?auto_914289 ?auto_914305 ) ) ( not ( = ?auto_914290 ?auto_914291 ) ) ( not ( = ?auto_914290 ?auto_914292 ) ) ( not ( = ?auto_914290 ?auto_914293 ) ) ( not ( = ?auto_914290 ?auto_914294 ) ) ( not ( = ?auto_914290 ?auto_914295 ) ) ( not ( = ?auto_914290 ?auto_914296 ) ) ( not ( = ?auto_914290 ?auto_914297 ) ) ( not ( = ?auto_914290 ?auto_914298 ) ) ( not ( = ?auto_914290 ?auto_914299 ) ) ( not ( = ?auto_914290 ?auto_914300 ) ) ( not ( = ?auto_914290 ?auto_914301 ) ) ( not ( = ?auto_914290 ?auto_914302 ) ) ( not ( = ?auto_914290 ?auto_914303 ) ) ( not ( = ?auto_914290 ?auto_914304 ) ) ( not ( = ?auto_914290 ?auto_914305 ) ) ( not ( = ?auto_914291 ?auto_914292 ) ) ( not ( = ?auto_914291 ?auto_914293 ) ) ( not ( = ?auto_914291 ?auto_914294 ) ) ( not ( = ?auto_914291 ?auto_914295 ) ) ( not ( = ?auto_914291 ?auto_914296 ) ) ( not ( = ?auto_914291 ?auto_914297 ) ) ( not ( = ?auto_914291 ?auto_914298 ) ) ( not ( = ?auto_914291 ?auto_914299 ) ) ( not ( = ?auto_914291 ?auto_914300 ) ) ( not ( = ?auto_914291 ?auto_914301 ) ) ( not ( = ?auto_914291 ?auto_914302 ) ) ( not ( = ?auto_914291 ?auto_914303 ) ) ( not ( = ?auto_914291 ?auto_914304 ) ) ( not ( = ?auto_914291 ?auto_914305 ) ) ( not ( = ?auto_914292 ?auto_914293 ) ) ( not ( = ?auto_914292 ?auto_914294 ) ) ( not ( = ?auto_914292 ?auto_914295 ) ) ( not ( = ?auto_914292 ?auto_914296 ) ) ( not ( = ?auto_914292 ?auto_914297 ) ) ( not ( = ?auto_914292 ?auto_914298 ) ) ( not ( = ?auto_914292 ?auto_914299 ) ) ( not ( = ?auto_914292 ?auto_914300 ) ) ( not ( = ?auto_914292 ?auto_914301 ) ) ( not ( = ?auto_914292 ?auto_914302 ) ) ( not ( = ?auto_914292 ?auto_914303 ) ) ( not ( = ?auto_914292 ?auto_914304 ) ) ( not ( = ?auto_914292 ?auto_914305 ) ) ( not ( = ?auto_914293 ?auto_914294 ) ) ( not ( = ?auto_914293 ?auto_914295 ) ) ( not ( = ?auto_914293 ?auto_914296 ) ) ( not ( = ?auto_914293 ?auto_914297 ) ) ( not ( = ?auto_914293 ?auto_914298 ) ) ( not ( = ?auto_914293 ?auto_914299 ) ) ( not ( = ?auto_914293 ?auto_914300 ) ) ( not ( = ?auto_914293 ?auto_914301 ) ) ( not ( = ?auto_914293 ?auto_914302 ) ) ( not ( = ?auto_914293 ?auto_914303 ) ) ( not ( = ?auto_914293 ?auto_914304 ) ) ( not ( = ?auto_914293 ?auto_914305 ) ) ( not ( = ?auto_914294 ?auto_914295 ) ) ( not ( = ?auto_914294 ?auto_914296 ) ) ( not ( = ?auto_914294 ?auto_914297 ) ) ( not ( = ?auto_914294 ?auto_914298 ) ) ( not ( = ?auto_914294 ?auto_914299 ) ) ( not ( = ?auto_914294 ?auto_914300 ) ) ( not ( = ?auto_914294 ?auto_914301 ) ) ( not ( = ?auto_914294 ?auto_914302 ) ) ( not ( = ?auto_914294 ?auto_914303 ) ) ( not ( = ?auto_914294 ?auto_914304 ) ) ( not ( = ?auto_914294 ?auto_914305 ) ) ( not ( = ?auto_914295 ?auto_914296 ) ) ( not ( = ?auto_914295 ?auto_914297 ) ) ( not ( = ?auto_914295 ?auto_914298 ) ) ( not ( = ?auto_914295 ?auto_914299 ) ) ( not ( = ?auto_914295 ?auto_914300 ) ) ( not ( = ?auto_914295 ?auto_914301 ) ) ( not ( = ?auto_914295 ?auto_914302 ) ) ( not ( = ?auto_914295 ?auto_914303 ) ) ( not ( = ?auto_914295 ?auto_914304 ) ) ( not ( = ?auto_914295 ?auto_914305 ) ) ( not ( = ?auto_914296 ?auto_914297 ) ) ( not ( = ?auto_914296 ?auto_914298 ) ) ( not ( = ?auto_914296 ?auto_914299 ) ) ( not ( = ?auto_914296 ?auto_914300 ) ) ( not ( = ?auto_914296 ?auto_914301 ) ) ( not ( = ?auto_914296 ?auto_914302 ) ) ( not ( = ?auto_914296 ?auto_914303 ) ) ( not ( = ?auto_914296 ?auto_914304 ) ) ( not ( = ?auto_914296 ?auto_914305 ) ) ( not ( = ?auto_914297 ?auto_914298 ) ) ( not ( = ?auto_914297 ?auto_914299 ) ) ( not ( = ?auto_914297 ?auto_914300 ) ) ( not ( = ?auto_914297 ?auto_914301 ) ) ( not ( = ?auto_914297 ?auto_914302 ) ) ( not ( = ?auto_914297 ?auto_914303 ) ) ( not ( = ?auto_914297 ?auto_914304 ) ) ( not ( = ?auto_914297 ?auto_914305 ) ) ( not ( = ?auto_914298 ?auto_914299 ) ) ( not ( = ?auto_914298 ?auto_914300 ) ) ( not ( = ?auto_914298 ?auto_914301 ) ) ( not ( = ?auto_914298 ?auto_914302 ) ) ( not ( = ?auto_914298 ?auto_914303 ) ) ( not ( = ?auto_914298 ?auto_914304 ) ) ( not ( = ?auto_914298 ?auto_914305 ) ) ( not ( = ?auto_914299 ?auto_914300 ) ) ( not ( = ?auto_914299 ?auto_914301 ) ) ( not ( = ?auto_914299 ?auto_914302 ) ) ( not ( = ?auto_914299 ?auto_914303 ) ) ( not ( = ?auto_914299 ?auto_914304 ) ) ( not ( = ?auto_914299 ?auto_914305 ) ) ( not ( = ?auto_914300 ?auto_914301 ) ) ( not ( = ?auto_914300 ?auto_914302 ) ) ( not ( = ?auto_914300 ?auto_914303 ) ) ( not ( = ?auto_914300 ?auto_914304 ) ) ( not ( = ?auto_914300 ?auto_914305 ) ) ( not ( = ?auto_914301 ?auto_914302 ) ) ( not ( = ?auto_914301 ?auto_914303 ) ) ( not ( = ?auto_914301 ?auto_914304 ) ) ( not ( = ?auto_914301 ?auto_914305 ) ) ( not ( = ?auto_914302 ?auto_914303 ) ) ( not ( = ?auto_914302 ?auto_914304 ) ) ( not ( = ?auto_914302 ?auto_914305 ) ) ( not ( = ?auto_914303 ?auto_914304 ) ) ( not ( = ?auto_914303 ?auto_914305 ) ) ( not ( = ?auto_914304 ?auto_914305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_914304 ?auto_914305 )
      ( !STACK ?auto_914304 ?auto_914303 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914324 - BLOCK
      ?auto_914325 - BLOCK
      ?auto_914326 - BLOCK
      ?auto_914327 - BLOCK
      ?auto_914328 - BLOCK
      ?auto_914329 - BLOCK
      ?auto_914330 - BLOCK
      ?auto_914331 - BLOCK
      ?auto_914332 - BLOCK
      ?auto_914333 - BLOCK
      ?auto_914334 - BLOCK
      ?auto_914335 - BLOCK
      ?auto_914336 - BLOCK
      ?auto_914337 - BLOCK
      ?auto_914338 - BLOCK
      ?auto_914339 - BLOCK
      ?auto_914340 - BLOCK
      ?auto_914341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_914340 ) ( ON-TABLE ?auto_914341 ) ( CLEAR ?auto_914341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_914324 ) ( ON ?auto_914325 ?auto_914324 ) ( ON ?auto_914326 ?auto_914325 ) ( ON ?auto_914327 ?auto_914326 ) ( ON ?auto_914328 ?auto_914327 ) ( ON ?auto_914329 ?auto_914328 ) ( ON ?auto_914330 ?auto_914329 ) ( ON ?auto_914331 ?auto_914330 ) ( ON ?auto_914332 ?auto_914331 ) ( ON ?auto_914333 ?auto_914332 ) ( ON ?auto_914334 ?auto_914333 ) ( ON ?auto_914335 ?auto_914334 ) ( ON ?auto_914336 ?auto_914335 ) ( ON ?auto_914337 ?auto_914336 ) ( ON ?auto_914338 ?auto_914337 ) ( ON ?auto_914339 ?auto_914338 ) ( ON ?auto_914340 ?auto_914339 ) ( not ( = ?auto_914324 ?auto_914325 ) ) ( not ( = ?auto_914324 ?auto_914326 ) ) ( not ( = ?auto_914324 ?auto_914327 ) ) ( not ( = ?auto_914324 ?auto_914328 ) ) ( not ( = ?auto_914324 ?auto_914329 ) ) ( not ( = ?auto_914324 ?auto_914330 ) ) ( not ( = ?auto_914324 ?auto_914331 ) ) ( not ( = ?auto_914324 ?auto_914332 ) ) ( not ( = ?auto_914324 ?auto_914333 ) ) ( not ( = ?auto_914324 ?auto_914334 ) ) ( not ( = ?auto_914324 ?auto_914335 ) ) ( not ( = ?auto_914324 ?auto_914336 ) ) ( not ( = ?auto_914324 ?auto_914337 ) ) ( not ( = ?auto_914324 ?auto_914338 ) ) ( not ( = ?auto_914324 ?auto_914339 ) ) ( not ( = ?auto_914324 ?auto_914340 ) ) ( not ( = ?auto_914324 ?auto_914341 ) ) ( not ( = ?auto_914325 ?auto_914326 ) ) ( not ( = ?auto_914325 ?auto_914327 ) ) ( not ( = ?auto_914325 ?auto_914328 ) ) ( not ( = ?auto_914325 ?auto_914329 ) ) ( not ( = ?auto_914325 ?auto_914330 ) ) ( not ( = ?auto_914325 ?auto_914331 ) ) ( not ( = ?auto_914325 ?auto_914332 ) ) ( not ( = ?auto_914325 ?auto_914333 ) ) ( not ( = ?auto_914325 ?auto_914334 ) ) ( not ( = ?auto_914325 ?auto_914335 ) ) ( not ( = ?auto_914325 ?auto_914336 ) ) ( not ( = ?auto_914325 ?auto_914337 ) ) ( not ( = ?auto_914325 ?auto_914338 ) ) ( not ( = ?auto_914325 ?auto_914339 ) ) ( not ( = ?auto_914325 ?auto_914340 ) ) ( not ( = ?auto_914325 ?auto_914341 ) ) ( not ( = ?auto_914326 ?auto_914327 ) ) ( not ( = ?auto_914326 ?auto_914328 ) ) ( not ( = ?auto_914326 ?auto_914329 ) ) ( not ( = ?auto_914326 ?auto_914330 ) ) ( not ( = ?auto_914326 ?auto_914331 ) ) ( not ( = ?auto_914326 ?auto_914332 ) ) ( not ( = ?auto_914326 ?auto_914333 ) ) ( not ( = ?auto_914326 ?auto_914334 ) ) ( not ( = ?auto_914326 ?auto_914335 ) ) ( not ( = ?auto_914326 ?auto_914336 ) ) ( not ( = ?auto_914326 ?auto_914337 ) ) ( not ( = ?auto_914326 ?auto_914338 ) ) ( not ( = ?auto_914326 ?auto_914339 ) ) ( not ( = ?auto_914326 ?auto_914340 ) ) ( not ( = ?auto_914326 ?auto_914341 ) ) ( not ( = ?auto_914327 ?auto_914328 ) ) ( not ( = ?auto_914327 ?auto_914329 ) ) ( not ( = ?auto_914327 ?auto_914330 ) ) ( not ( = ?auto_914327 ?auto_914331 ) ) ( not ( = ?auto_914327 ?auto_914332 ) ) ( not ( = ?auto_914327 ?auto_914333 ) ) ( not ( = ?auto_914327 ?auto_914334 ) ) ( not ( = ?auto_914327 ?auto_914335 ) ) ( not ( = ?auto_914327 ?auto_914336 ) ) ( not ( = ?auto_914327 ?auto_914337 ) ) ( not ( = ?auto_914327 ?auto_914338 ) ) ( not ( = ?auto_914327 ?auto_914339 ) ) ( not ( = ?auto_914327 ?auto_914340 ) ) ( not ( = ?auto_914327 ?auto_914341 ) ) ( not ( = ?auto_914328 ?auto_914329 ) ) ( not ( = ?auto_914328 ?auto_914330 ) ) ( not ( = ?auto_914328 ?auto_914331 ) ) ( not ( = ?auto_914328 ?auto_914332 ) ) ( not ( = ?auto_914328 ?auto_914333 ) ) ( not ( = ?auto_914328 ?auto_914334 ) ) ( not ( = ?auto_914328 ?auto_914335 ) ) ( not ( = ?auto_914328 ?auto_914336 ) ) ( not ( = ?auto_914328 ?auto_914337 ) ) ( not ( = ?auto_914328 ?auto_914338 ) ) ( not ( = ?auto_914328 ?auto_914339 ) ) ( not ( = ?auto_914328 ?auto_914340 ) ) ( not ( = ?auto_914328 ?auto_914341 ) ) ( not ( = ?auto_914329 ?auto_914330 ) ) ( not ( = ?auto_914329 ?auto_914331 ) ) ( not ( = ?auto_914329 ?auto_914332 ) ) ( not ( = ?auto_914329 ?auto_914333 ) ) ( not ( = ?auto_914329 ?auto_914334 ) ) ( not ( = ?auto_914329 ?auto_914335 ) ) ( not ( = ?auto_914329 ?auto_914336 ) ) ( not ( = ?auto_914329 ?auto_914337 ) ) ( not ( = ?auto_914329 ?auto_914338 ) ) ( not ( = ?auto_914329 ?auto_914339 ) ) ( not ( = ?auto_914329 ?auto_914340 ) ) ( not ( = ?auto_914329 ?auto_914341 ) ) ( not ( = ?auto_914330 ?auto_914331 ) ) ( not ( = ?auto_914330 ?auto_914332 ) ) ( not ( = ?auto_914330 ?auto_914333 ) ) ( not ( = ?auto_914330 ?auto_914334 ) ) ( not ( = ?auto_914330 ?auto_914335 ) ) ( not ( = ?auto_914330 ?auto_914336 ) ) ( not ( = ?auto_914330 ?auto_914337 ) ) ( not ( = ?auto_914330 ?auto_914338 ) ) ( not ( = ?auto_914330 ?auto_914339 ) ) ( not ( = ?auto_914330 ?auto_914340 ) ) ( not ( = ?auto_914330 ?auto_914341 ) ) ( not ( = ?auto_914331 ?auto_914332 ) ) ( not ( = ?auto_914331 ?auto_914333 ) ) ( not ( = ?auto_914331 ?auto_914334 ) ) ( not ( = ?auto_914331 ?auto_914335 ) ) ( not ( = ?auto_914331 ?auto_914336 ) ) ( not ( = ?auto_914331 ?auto_914337 ) ) ( not ( = ?auto_914331 ?auto_914338 ) ) ( not ( = ?auto_914331 ?auto_914339 ) ) ( not ( = ?auto_914331 ?auto_914340 ) ) ( not ( = ?auto_914331 ?auto_914341 ) ) ( not ( = ?auto_914332 ?auto_914333 ) ) ( not ( = ?auto_914332 ?auto_914334 ) ) ( not ( = ?auto_914332 ?auto_914335 ) ) ( not ( = ?auto_914332 ?auto_914336 ) ) ( not ( = ?auto_914332 ?auto_914337 ) ) ( not ( = ?auto_914332 ?auto_914338 ) ) ( not ( = ?auto_914332 ?auto_914339 ) ) ( not ( = ?auto_914332 ?auto_914340 ) ) ( not ( = ?auto_914332 ?auto_914341 ) ) ( not ( = ?auto_914333 ?auto_914334 ) ) ( not ( = ?auto_914333 ?auto_914335 ) ) ( not ( = ?auto_914333 ?auto_914336 ) ) ( not ( = ?auto_914333 ?auto_914337 ) ) ( not ( = ?auto_914333 ?auto_914338 ) ) ( not ( = ?auto_914333 ?auto_914339 ) ) ( not ( = ?auto_914333 ?auto_914340 ) ) ( not ( = ?auto_914333 ?auto_914341 ) ) ( not ( = ?auto_914334 ?auto_914335 ) ) ( not ( = ?auto_914334 ?auto_914336 ) ) ( not ( = ?auto_914334 ?auto_914337 ) ) ( not ( = ?auto_914334 ?auto_914338 ) ) ( not ( = ?auto_914334 ?auto_914339 ) ) ( not ( = ?auto_914334 ?auto_914340 ) ) ( not ( = ?auto_914334 ?auto_914341 ) ) ( not ( = ?auto_914335 ?auto_914336 ) ) ( not ( = ?auto_914335 ?auto_914337 ) ) ( not ( = ?auto_914335 ?auto_914338 ) ) ( not ( = ?auto_914335 ?auto_914339 ) ) ( not ( = ?auto_914335 ?auto_914340 ) ) ( not ( = ?auto_914335 ?auto_914341 ) ) ( not ( = ?auto_914336 ?auto_914337 ) ) ( not ( = ?auto_914336 ?auto_914338 ) ) ( not ( = ?auto_914336 ?auto_914339 ) ) ( not ( = ?auto_914336 ?auto_914340 ) ) ( not ( = ?auto_914336 ?auto_914341 ) ) ( not ( = ?auto_914337 ?auto_914338 ) ) ( not ( = ?auto_914337 ?auto_914339 ) ) ( not ( = ?auto_914337 ?auto_914340 ) ) ( not ( = ?auto_914337 ?auto_914341 ) ) ( not ( = ?auto_914338 ?auto_914339 ) ) ( not ( = ?auto_914338 ?auto_914340 ) ) ( not ( = ?auto_914338 ?auto_914341 ) ) ( not ( = ?auto_914339 ?auto_914340 ) ) ( not ( = ?auto_914339 ?auto_914341 ) ) ( not ( = ?auto_914340 ?auto_914341 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_914341 )
      ( !STACK ?auto_914341 ?auto_914340 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914360 - BLOCK
      ?auto_914361 - BLOCK
      ?auto_914362 - BLOCK
      ?auto_914363 - BLOCK
      ?auto_914364 - BLOCK
      ?auto_914365 - BLOCK
      ?auto_914366 - BLOCK
      ?auto_914367 - BLOCK
      ?auto_914368 - BLOCK
      ?auto_914369 - BLOCK
      ?auto_914370 - BLOCK
      ?auto_914371 - BLOCK
      ?auto_914372 - BLOCK
      ?auto_914373 - BLOCK
      ?auto_914374 - BLOCK
      ?auto_914375 - BLOCK
      ?auto_914376 - BLOCK
      ?auto_914377 - BLOCK
    )
    :vars
    (
      ?auto_914378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914377 ?auto_914378 ) ( ON-TABLE ?auto_914360 ) ( ON ?auto_914361 ?auto_914360 ) ( ON ?auto_914362 ?auto_914361 ) ( ON ?auto_914363 ?auto_914362 ) ( ON ?auto_914364 ?auto_914363 ) ( ON ?auto_914365 ?auto_914364 ) ( ON ?auto_914366 ?auto_914365 ) ( ON ?auto_914367 ?auto_914366 ) ( ON ?auto_914368 ?auto_914367 ) ( ON ?auto_914369 ?auto_914368 ) ( ON ?auto_914370 ?auto_914369 ) ( ON ?auto_914371 ?auto_914370 ) ( ON ?auto_914372 ?auto_914371 ) ( ON ?auto_914373 ?auto_914372 ) ( ON ?auto_914374 ?auto_914373 ) ( ON ?auto_914375 ?auto_914374 ) ( not ( = ?auto_914360 ?auto_914361 ) ) ( not ( = ?auto_914360 ?auto_914362 ) ) ( not ( = ?auto_914360 ?auto_914363 ) ) ( not ( = ?auto_914360 ?auto_914364 ) ) ( not ( = ?auto_914360 ?auto_914365 ) ) ( not ( = ?auto_914360 ?auto_914366 ) ) ( not ( = ?auto_914360 ?auto_914367 ) ) ( not ( = ?auto_914360 ?auto_914368 ) ) ( not ( = ?auto_914360 ?auto_914369 ) ) ( not ( = ?auto_914360 ?auto_914370 ) ) ( not ( = ?auto_914360 ?auto_914371 ) ) ( not ( = ?auto_914360 ?auto_914372 ) ) ( not ( = ?auto_914360 ?auto_914373 ) ) ( not ( = ?auto_914360 ?auto_914374 ) ) ( not ( = ?auto_914360 ?auto_914375 ) ) ( not ( = ?auto_914360 ?auto_914376 ) ) ( not ( = ?auto_914360 ?auto_914377 ) ) ( not ( = ?auto_914360 ?auto_914378 ) ) ( not ( = ?auto_914361 ?auto_914362 ) ) ( not ( = ?auto_914361 ?auto_914363 ) ) ( not ( = ?auto_914361 ?auto_914364 ) ) ( not ( = ?auto_914361 ?auto_914365 ) ) ( not ( = ?auto_914361 ?auto_914366 ) ) ( not ( = ?auto_914361 ?auto_914367 ) ) ( not ( = ?auto_914361 ?auto_914368 ) ) ( not ( = ?auto_914361 ?auto_914369 ) ) ( not ( = ?auto_914361 ?auto_914370 ) ) ( not ( = ?auto_914361 ?auto_914371 ) ) ( not ( = ?auto_914361 ?auto_914372 ) ) ( not ( = ?auto_914361 ?auto_914373 ) ) ( not ( = ?auto_914361 ?auto_914374 ) ) ( not ( = ?auto_914361 ?auto_914375 ) ) ( not ( = ?auto_914361 ?auto_914376 ) ) ( not ( = ?auto_914361 ?auto_914377 ) ) ( not ( = ?auto_914361 ?auto_914378 ) ) ( not ( = ?auto_914362 ?auto_914363 ) ) ( not ( = ?auto_914362 ?auto_914364 ) ) ( not ( = ?auto_914362 ?auto_914365 ) ) ( not ( = ?auto_914362 ?auto_914366 ) ) ( not ( = ?auto_914362 ?auto_914367 ) ) ( not ( = ?auto_914362 ?auto_914368 ) ) ( not ( = ?auto_914362 ?auto_914369 ) ) ( not ( = ?auto_914362 ?auto_914370 ) ) ( not ( = ?auto_914362 ?auto_914371 ) ) ( not ( = ?auto_914362 ?auto_914372 ) ) ( not ( = ?auto_914362 ?auto_914373 ) ) ( not ( = ?auto_914362 ?auto_914374 ) ) ( not ( = ?auto_914362 ?auto_914375 ) ) ( not ( = ?auto_914362 ?auto_914376 ) ) ( not ( = ?auto_914362 ?auto_914377 ) ) ( not ( = ?auto_914362 ?auto_914378 ) ) ( not ( = ?auto_914363 ?auto_914364 ) ) ( not ( = ?auto_914363 ?auto_914365 ) ) ( not ( = ?auto_914363 ?auto_914366 ) ) ( not ( = ?auto_914363 ?auto_914367 ) ) ( not ( = ?auto_914363 ?auto_914368 ) ) ( not ( = ?auto_914363 ?auto_914369 ) ) ( not ( = ?auto_914363 ?auto_914370 ) ) ( not ( = ?auto_914363 ?auto_914371 ) ) ( not ( = ?auto_914363 ?auto_914372 ) ) ( not ( = ?auto_914363 ?auto_914373 ) ) ( not ( = ?auto_914363 ?auto_914374 ) ) ( not ( = ?auto_914363 ?auto_914375 ) ) ( not ( = ?auto_914363 ?auto_914376 ) ) ( not ( = ?auto_914363 ?auto_914377 ) ) ( not ( = ?auto_914363 ?auto_914378 ) ) ( not ( = ?auto_914364 ?auto_914365 ) ) ( not ( = ?auto_914364 ?auto_914366 ) ) ( not ( = ?auto_914364 ?auto_914367 ) ) ( not ( = ?auto_914364 ?auto_914368 ) ) ( not ( = ?auto_914364 ?auto_914369 ) ) ( not ( = ?auto_914364 ?auto_914370 ) ) ( not ( = ?auto_914364 ?auto_914371 ) ) ( not ( = ?auto_914364 ?auto_914372 ) ) ( not ( = ?auto_914364 ?auto_914373 ) ) ( not ( = ?auto_914364 ?auto_914374 ) ) ( not ( = ?auto_914364 ?auto_914375 ) ) ( not ( = ?auto_914364 ?auto_914376 ) ) ( not ( = ?auto_914364 ?auto_914377 ) ) ( not ( = ?auto_914364 ?auto_914378 ) ) ( not ( = ?auto_914365 ?auto_914366 ) ) ( not ( = ?auto_914365 ?auto_914367 ) ) ( not ( = ?auto_914365 ?auto_914368 ) ) ( not ( = ?auto_914365 ?auto_914369 ) ) ( not ( = ?auto_914365 ?auto_914370 ) ) ( not ( = ?auto_914365 ?auto_914371 ) ) ( not ( = ?auto_914365 ?auto_914372 ) ) ( not ( = ?auto_914365 ?auto_914373 ) ) ( not ( = ?auto_914365 ?auto_914374 ) ) ( not ( = ?auto_914365 ?auto_914375 ) ) ( not ( = ?auto_914365 ?auto_914376 ) ) ( not ( = ?auto_914365 ?auto_914377 ) ) ( not ( = ?auto_914365 ?auto_914378 ) ) ( not ( = ?auto_914366 ?auto_914367 ) ) ( not ( = ?auto_914366 ?auto_914368 ) ) ( not ( = ?auto_914366 ?auto_914369 ) ) ( not ( = ?auto_914366 ?auto_914370 ) ) ( not ( = ?auto_914366 ?auto_914371 ) ) ( not ( = ?auto_914366 ?auto_914372 ) ) ( not ( = ?auto_914366 ?auto_914373 ) ) ( not ( = ?auto_914366 ?auto_914374 ) ) ( not ( = ?auto_914366 ?auto_914375 ) ) ( not ( = ?auto_914366 ?auto_914376 ) ) ( not ( = ?auto_914366 ?auto_914377 ) ) ( not ( = ?auto_914366 ?auto_914378 ) ) ( not ( = ?auto_914367 ?auto_914368 ) ) ( not ( = ?auto_914367 ?auto_914369 ) ) ( not ( = ?auto_914367 ?auto_914370 ) ) ( not ( = ?auto_914367 ?auto_914371 ) ) ( not ( = ?auto_914367 ?auto_914372 ) ) ( not ( = ?auto_914367 ?auto_914373 ) ) ( not ( = ?auto_914367 ?auto_914374 ) ) ( not ( = ?auto_914367 ?auto_914375 ) ) ( not ( = ?auto_914367 ?auto_914376 ) ) ( not ( = ?auto_914367 ?auto_914377 ) ) ( not ( = ?auto_914367 ?auto_914378 ) ) ( not ( = ?auto_914368 ?auto_914369 ) ) ( not ( = ?auto_914368 ?auto_914370 ) ) ( not ( = ?auto_914368 ?auto_914371 ) ) ( not ( = ?auto_914368 ?auto_914372 ) ) ( not ( = ?auto_914368 ?auto_914373 ) ) ( not ( = ?auto_914368 ?auto_914374 ) ) ( not ( = ?auto_914368 ?auto_914375 ) ) ( not ( = ?auto_914368 ?auto_914376 ) ) ( not ( = ?auto_914368 ?auto_914377 ) ) ( not ( = ?auto_914368 ?auto_914378 ) ) ( not ( = ?auto_914369 ?auto_914370 ) ) ( not ( = ?auto_914369 ?auto_914371 ) ) ( not ( = ?auto_914369 ?auto_914372 ) ) ( not ( = ?auto_914369 ?auto_914373 ) ) ( not ( = ?auto_914369 ?auto_914374 ) ) ( not ( = ?auto_914369 ?auto_914375 ) ) ( not ( = ?auto_914369 ?auto_914376 ) ) ( not ( = ?auto_914369 ?auto_914377 ) ) ( not ( = ?auto_914369 ?auto_914378 ) ) ( not ( = ?auto_914370 ?auto_914371 ) ) ( not ( = ?auto_914370 ?auto_914372 ) ) ( not ( = ?auto_914370 ?auto_914373 ) ) ( not ( = ?auto_914370 ?auto_914374 ) ) ( not ( = ?auto_914370 ?auto_914375 ) ) ( not ( = ?auto_914370 ?auto_914376 ) ) ( not ( = ?auto_914370 ?auto_914377 ) ) ( not ( = ?auto_914370 ?auto_914378 ) ) ( not ( = ?auto_914371 ?auto_914372 ) ) ( not ( = ?auto_914371 ?auto_914373 ) ) ( not ( = ?auto_914371 ?auto_914374 ) ) ( not ( = ?auto_914371 ?auto_914375 ) ) ( not ( = ?auto_914371 ?auto_914376 ) ) ( not ( = ?auto_914371 ?auto_914377 ) ) ( not ( = ?auto_914371 ?auto_914378 ) ) ( not ( = ?auto_914372 ?auto_914373 ) ) ( not ( = ?auto_914372 ?auto_914374 ) ) ( not ( = ?auto_914372 ?auto_914375 ) ) ( not ( = ?auto_914372 ?auto_914376 ) ) ( not ( = ?auto_914372 ?auto_914377 ) ) ( not ( = ?auto_914372 ?auto_914378 ) ) ( not ( = ?auto_914373 ?auto_914374 ) ) ( not ( = ?auto_914373 ?auto_914375 ) ) ( not ( = ?auto_914373 ?auto_914376 ) ) ( not ( = ?auto_914373 ?auto_914377 ) ) ( not ( = ?auto_914373 ?auto_914378 ) ) ( not ( = ?auto_914374 ?auto_914375 ) ) ( not ( = ?auto_914374 ?auto_914376 ) ) ( not ( = ?auto_914374 ?auto_914377 ) ) ( not ( = ?auto_914374 ?auto_914378 ) ) ( not ( = ?auto_914375 ?auto_914376 ) ) ( not ( = ?auto_914375 ?auto_914377 ) ) ( not ( = ?auto_914375 ?auto_914378 ) ) ( not ( = ?auto_914376 ?auto_914377 ) ) ( not ( = ?auto_914376 ?auto_914378 ) ) ( not ( = ?auto_914377 ?auto_914378 ) ) ( CLEAR ?auto_914375 ) ( ON ?auto_914376 ?auto_914377 ) ( CLEAR ?auto_914376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_914360 ?auto_914361 ?auto_914362 ?auto_914363 ?auto_914364 ?auto_914365 ?auto_914366 ?auto_914367 ?auto_914368 ?auto_914369 ?auto_914370 ?auto_914371 ?auto_914372 ?auto_914373 ?auto_914374 ?auto_914375 ?auto_914376 )
      ( MAKE-18PILE ?auto_914360 ?auto_914361 ?auto_914362 ?auto_914363 ?auto_914364 ?auto_914365 ?auto_914366 ?auto_914367 ?auto_914368 ?auto_914369 ?auto_914370 ?auto_914371 ?auto_914372 ?auto_914373 ?auto_914374 ?auto_914375 ?auto_914376 ?auto_914377 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914397 - BLOCK
      ?auto_914398 - BLOCK
      ?auto_914399 - BLOCK
      ?auto_914400 - BLOCK
      ?auto_914401 - BLOCK
      ?auto_914402 - BLOCK
      ?auto_914403 - BLOCK
      ?auto_914404 - BLOCK
      ?auto_914405 - BLOCK
      ?auto_914406 - BLOCK
      ?auto_914407 - BLOCK
      ?auto_914408 - BLOCK
      ?auto_914409 - BLOCK
      ?auto_914410 - BLOCK
      ?auto_914411 - BLOCK
      ?auto_914412 - BLOCK
      ?auto_914413 - BLOCK
      ?auto_914414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914414 ) ( ON-TABLE ?auto_914397 ) ( ON ?auto_914398 ?auto_914397 ) ( ON ?auto_914399 ?auto_914398 ) ( ON ?auto_914400 ?auto_914399 ) ( ON ?auto_914401 ?auto_914400 ) ( ON ?auto_914402 ?auto_914401 ) ( ON ?auto_914403 ?auto_914402 ) ( ON ?auto_914404 ?auto_914403 ) ( ON ?auto_914405 ?auto_914404 ) ( ON ?auto_914406 ?auto_914405 ) ( ON ?auto_914407 ?auto_914406 ) ( ON ?auto_914408 ?auto_914407 ) ( ON ?auto_914409 ?auto_914408 ) ( ON ?auto_914410 ?auto_914409 ) ( ON ?auto_914411 ?auto_914410 ) ( ON ?auto_914412 ?auto_914411 ) ( not ( = ?auto_914397 ?auto_914398 ) ) ( not ( = ?auto_914397 ?auto_914399 ) ) ( not ( = ?auto_914397 ?auto_914400 ) ) ( not ( = ?auto_914397 ?auto_914401 ) ) ( not ( = ?auto_914397 ?auto_914402 ) ) ( not ( = ?auto_914397 ?auto_914403 ) ) ( not ( = ?auto_914397 ?auto_914404 ) ) ( not ( = ?auto_914397 ?auto_914405 ) ) ( not ( = ?auto_914397 ?auto_914406 ) ) ( not ( = ?auto_914397 ?auto_914407 ) ) ( not ( = ?auto_914397 ?auto_914408 ) ) ( not ( = ?auto_914397 ?auto_914409 ) ) ( not ( = ?auto_914397 ?auto_914410 ) ) ( not ( = ?auto_914397 ?auto_914411 ) ) ( not ( = ?auto_914397 ?auto_914412 ) ) ( not ( = ?auto_914397 ?auto_914413 ) ) ( not ( = ?auto_914397 ?auto_914414 ) ) ( not ( = ?auto_914398 ?auto_914399 ) ) ( not ( = ?auto_914398 ?auto_914400 ) ) ( not ( = ?auto_914398 ?auto_914401 ) ) ( not ( = ?auto_914398 ?auto_914402 ) ) ( not ( = ?auto_914398 ?auto_914403 ) ) ( not ( = ?auto_914398 ?auto_914404 ) ) ( not ( = ?auto_914398 ?auto_914405 ) ) ( not ( = ?auto_914398 ?auto_914406 ) ) ( not ( = ?auto_914398 ?auto_914407 ) ) ( not ( = ?auto_914398 ?auto_914408 ) ) ( not ( = ?auto_914398 ?auto_914409 ) ) ( not ( = ?auto_914398 ?auto_914410 ) ) ( not ( = ?auto_914398 ?auto_914411 ) ) ( not ( = ?auto_914398 ?auto_914412 ) ) ( not ( = ?auto_914398 ?auto_914413 ) ) ( not ( = ?auto_914398 ?auto_914414 ) ) ( not ( = ?auto_914399 ?auto_914400 ) ) ( not ( = ?auto_914399 ?auto_914401 ) ) ( not ( = ?auto_914399 ?auto_914402 ) ) ( not ( = ?auto_914399 ?auto_914403 ) ) ( not ( = ?auto_914399 ?auto_914404 ) ) ( not ( = ?auto_914399 ?auto_914405 ) ) ( not ( = ?auto_914399 ?auto_914406 ) ) ( not ( = ?auto_914399 ?auto_914407 ) ) ( not ( = ?auto_914399 ?auto_914408 ) ) ( not ( = ?auto_914399 ?auto_914409 ) ) ( not ( = ?auto_914399 ?auto_914410 ) ) ( not ( = ?auto_914399 ?auto_914411 ) ) ( not ( = ?auto_914399 ?auto_914412 ) ) ( not ( = ?auto_914399 ?auto_914413 ) ) ( not ( = ?auto_914399 ?auto_914414 ) ) ( not ( = ?auto_914400 ?auto_914401 ) ) ( not ( = ?auto_914400 ?auto_914402 ) ) ( not ( = ?auto_914400 ?auto_914403 ) ) ( not ( = ?auto_914400 ?auto_914404 ) ) ( not ( = ?auto_914400 ?auto_914405 ) ) ( not ( = ?auto_914400 ?auto_914406 ) ) ( not ( = ?auto_914400 ?auto_914407 ) ) ( not ( = ?auto_914400 ?auto_914408 ) ) ( not ( = ?auto_914400 ?auto_914409 ) ) ( not ( = ?auto_914400 ?auto_914410 ) ) ( not ( = ?auto_914400 ?auto_914411 ) ) ( not ( = ?auto_914400 ?auto_914412 ) ) ( not ( = ?auto_914400 ?auto_914413 ) ) ( not ( = ?auto_914400 ?auto_914414 ) ) ( not ( = ?auto_914401 ?auto_914402 ) ) ( not ( = ?auto_914401 ?auto_914403 ) ) ( not ( = ?auto_914401 ?auto_914404 ) ) ( not ( = ?auto_914401 ?auto_914405 ) ) ( not ( = ?auto_914401 ?auto_914406 ) ) ( not ( = ?auto_914401 ?auto_914407 ) ) ( not ( = ?auto_914401 ?auto_914408 ) ) ( not ( = ?auto_914401 ?auto_914409 ) ) ( not ( = ?auto_914401 ?auto_914410 ) ) ( not ( = ?auto_914401 ?auto_914411 ) ) ( not ( = ?auto_914401 ?auto_914412 ) ) ( not ( = ?auto_914401 ?auto_914413 ) ) ( not ( = ?auto_914401 ?auto_914414 ) ) ( not ( = ?auto_914402 ?auto_914403 ) ) ( not ( = ?auto_914402 ?auto_914404 ) ) ( not ( = ?auto_914402 ?auto_914405 ) ) ( not ( = ?auto_914402 ?auto_914406 ) ) ( not ( = ?auto_914402 ?auto_914407 ) ) ( not ( = ?auto_914402 ?auto_914408 ) ) ( not ( = ?auto_914402 ?auto_914409 ) ) ( not ( = ?auto_914402 ?auto_914410 ) ) ( not ( = ?auto_914402 ?auto_914411 ) ) ( not ( = ?auto_914402 ?auto_914412 ) ) ( not ( = ?auto_914402 ?auto_914413 ) ) ( not ( = ?auto_914402 ?auto_914414 ) ) ( not ( = ?auto_914403 ?auto_914404 ) ) ( not ( = ?auto_914403 ?auto_914405 ) ) ( not ( = ?auto_914403 ?auto_914406 ) ) ( not ( = ?auto_914403 ?auto_914407 ) ) ( not ( = ?auto_914403 ?auto_914408 ) ) ( not ( = ?auto_914403 ?auto_914409 ) ) ( not ( = ?auto_914403 ?auto_914410 ) ) ( not ( = ?auto_914403 ?auto_914411 ) ) ( not ( = ?auto_914403 ?auto_914412 ) ) ( not ( = ?auto_914403 ?auto_914413 ) ) ( not ( = ?auto_914403 ?auto_914414 ) ) ( not ( = ?auto_914404 ?auto_914405 ) ) ( not ( = ?auto_914404 ?auto_914406 ) ) ( not ( = ?auto_914404 ?auto_914407 ) ) ( not ( = ?auto_914404 ?auto_914408 ) ) ( not ( = ?auto_914404 ?auto_914409 ) ) ( not ( = ?auto_914404 ?auto_914410 ) ) ( not ( = ?auto_914404 ?auto_914411 ) ) ( not ( = ?auto_914404 ?auto_914412 ) ) ( not ( = ?auto_914404 ?auto_914413 ) ) ( not ( = ?auto_914404 ?auto_914414 ) ) ( not ( = ?auto_914405 ?auto_914406 ) ) ( not ( = ?auto_914405 ?auto_914407 ) ) ( not ( = ?auto_914405 ?auto_914408 ) ) ( not ( = ?auto_914405 ?auto_914409 ) ) ( not ( = ?auto_914405 ?auto_914410 ) ) ( not ( = ?auto_914405 ?auto_914411 ) ) ( not ( = ?auto_914405 ?auto_914412 ) ) ( not ( = ?auto_914405 ?auto_914413 ) ) ( not ( = ?auto_914405 ?auto_914414 ) ) ( not ( = ?auto_914406 ?auto_914407 ) ) ( not ( = ?auto_914406 ?auto_914408 ) ) ( not ( = ?auto_914406 ?auto_914409 ) ) ( not ( = ?auto_914406 ?auto_914410 ) ) ( not ( = ?auto_914406 ?auto_914411 ) ) ( not ( = ?auto_914406 ?auto_914412 ) ) ( not ( = ?auto_914406 ?auto_914413 ) ) ( not ( = ?auto_914406 ?auto_914414 ) ) ( not ( = ?auto_914407 ?auto_914408 ) ) ( not ( = ?auto_914407 ?auto_914409 ) ) ( not ( = ?auto_914407 ?auto_914410 ) ) ( not ( = ?auto_914407 ?auto_914411 ) ) ( not ( = ?auto_914407 ?auto_914412 ) ) ( not ( = ?auto_914407 ?auto_914413 ) ) ( not ( = ?auto_914407 ?auto_914414 ) ) ( not ( = ?auto_914408 ?auto_914409 ) ) ( not ( = ?auto_914408 ?auto_914410 ) ) ( not ( = ?auto_914408 ?auto_914411 ) ) ( not ( = ?auto_914408 ?auto_914412 ) ) ( not ( = ?auto_914408 ?auto_914413 ) ) ( not ( = ?auto_914408 ?auto_914414 ) ) ( not ( = ?auto_914409 ?auto_914410 ) ) ( not ( = ?auto_914409 ?auto_914411 ) ) ( not ( = ?auto_914409 ?auto_914412 ) ) ( not ( = ?auto_914409 ?auto_914413 ) ) ( not ( = ?auto_914409 ?auto_914414 ) ) ( not ( = ?auto_914410 ?auto_914411 ) ) ( not ( = ?auto_914410 ?auto_914412 ) ) ( not ( = ?auto_914410 ?auto_914413 ) ) ( not ( = ?auto_914410 ?auto_914414 ) ) ( not ( = ?auto_914411 ?auto_914412 ) ) ( not ( = ?auto_914411 ?auto_914413 ) ) ( not ( = ?auto_914411 ?auto_914414 ) ) ( not ( = ?auto_914412 ?auto_914413 ) ) ( not ( = ?auto_914412 ?auto_914414 ) ) ( not ( = ?auto_914413 ?auto_914414 ) ) ( CLEAR ?auto_914412 ) ( ON ?auto_914413 ?auto_914414 ) ( CLEAR ?auto_914413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_914397 ?auto_914398 ?auto_914399 ?auto_914400 ?auto_914401 ?auto_914402 ?auto_914403 ?auto_914404 ?auto_914405 ?auto_914406 ?auto_914407 ?auto_914408 ?auto_914409 ?auto_914410 ?auto_914411 ?auto_914412 ?auto_914413 )
      ( MAKE-18PILE ?auto_914397 ?auto_914398 ?auto_914399 ?auto_914400 ?auto_914401 ?auto_914402 ?auto_914403 ?auto_914404 ?auto_914405 ?auto_914406 ?auto_914407 ?auto_914408 ?auto_914409 ?auto_914410 ?auto_914411 ?auto_914412 ?auto_914413 ?auto_914414 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914433 - BLOCK
      ?auto_914434 - BLOCK
      ?auto_914435 - BLOCK
      ?auto_914436 - BLOCK
      ?auto_914437 - BLOCK
      ?auto_914438 - BLOCK
      ?auto_914439 - BLOCK
      ?auto_914440 - BLOCK
      ?auto_914441 - BLOCK
      ?auto_914442 - BLOCK
      ?auto_914443 - BLOCK
      ?auto_914444 - BLOCK
      ?auto_914445 - BLOCK
      ?auto_914446 - BLOCK
      ?auto_914447 - BLOCK
      ?auto_914448 - BLOCK
      ?auto_914449 - BLOCK
      ?auto_914450 - BLOCK
    )
    :vars
    (
      ?auto_914451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914450 ?auto_914451 ) ( ON-TABLE ?auto_914433 ) ( ON ?auto_914434 ?auto_914433 ) ( ON ?auto_914435 ?auto_914434 ) ( ON ?auto_914436 ?auto_914435 ) ( ON ?auto_914437 ?auto_914436 ) ( ON ?auto_914438 ?auto_914437 ) ( ON ?auto_914439 ?auto_914438 ) ( ON ?auto_914440 ?auto_914439 ) ( ON ?auto_914441 ?auto_914440 ) ( ON ?auto_914442 ?auto_914441 ) ( ON ?auto_914443 ?auto_914442 ) ( ON ?auto_914444 ?auto_914443 ) ( ON ?auto_914445 ?auto_914444 ) ( ON ?auto_914446 ?auto_914445 ) ( ON ?auto_914447 ?auto_914446 ) ( not ( = ?auto_914433 ?auto_914434 ) ) ( not ( = ?auto_914433 ?auto_914435 ) ) ( not ( = ?auto_914433 ?auto_914436 ) ) ( not ( = ?auto_914433 ?auto_914437 ) ) ( not ( = ?auto_914433 ?auto_914438 ) ) ( not ( = ?auto_914433 ?auto_914439 ) ) ( not ( = ?auto_914433 ?auto_914440 ) ) ( not ( = ?auto_914433 ?auto_914441 ) ) ( not ( = ?auto_914433 ?auto_914442 ) ) ( not ( = ?auto_914433 ?auto_914443 ) ) ( not ( = ?auto_914433 ?auto_914444 ) ) ( not ( = ?auto_914433 ?auto_914445 ) ) ( not ( = ?auto_914433 ?auto_914446 ) ) ( not ( = ?auto_914433 ?auto_914447 ) ) ( not ( = ?auto_914433 ?auto_914448 ) ) ( not ( = ?auto_914433 ?auto_914449 ) ) ( not ( = ?auto_914433 ?auto_914450 ) ) ( not ( = ?auto_914433 ?auto_914451 ) ) ( not ( = ?auto_914434 ?auto_914435 ) ) ( not ( = ?auto_914434 ?auto_914436 ) ) ( not ( = ?auto_914434 ?auto_914437 ) ) ( not ( = ?auto_914434 ?auto_914438 ) ) ( not ( = ?auto_914434 ?auto_914439 ) ) ( not ( = ?auto_914434 ?auto_914440 ) ) ( not ( = ?auto_914434 ?auto_914441 ) ) ( not ( = ?auto_914434 ?auto_914442 ) ) ( not ( = ?auto_914434 ?auto_914443 ) ) ( not ( = ?auto_914434 ?auto_914444 ) ) ( not ( = ?auto_914434 ?auto_914445 ) ) ( not ( = ?auto_914434 ?auto_914446 ) ) ( not ( = ?auto_914434 ?auto_914447 ) ) ( not ( = ?auto_914434 ?auto_914448 ) ) ( not ( = ?auto_914434 ?auto_914449 ) ) ( not ( = ?auto_914434 ?auto_914450 ) ) ( not ( = ?auto_914434 ?auto_914451 ) ) ( not ( = ?auto_914435 ?auto_914436 ) ) ( not ( = ?auto_914435 ?auto_914437 ) ) ( not ( = ?auto_914435 ?auto_914438 ) ) ( not ( = ?auto_914435 ?auto_914439 ) ) ( not ( = ?auto_914435 ?auto_914440 ) ) ( not ( = ?auto_914435 ?auto_914441 ) ) ( not ( = ?auto_914435 ?auto_914442 ) ) ( not ( = ?auto_914435 ?auto_914443 ) ) ( not ( = ?auto_914435 ?auto_914444 ) ) ( not ( = ?auto_914435 ?auto_914445 ) ) ( not ( = ?auto_914435 ?auto_914446 ) ) ( not ( = ?auto_914435 ?auto_914447 ) ) ( not ( = ?auto_914435 ?auto_914448 ) ) ( not ( = ?auto_914435 ?auto_914449 ) ) ( not ( = ?auto_914435 ?auto_914450 ) ) ( not ( = ?auto_914435 ?auto_914451 ) ) ( not ( = ?auto_914436 ?auto_914437 ) ) ( not ( = ?auto_914436 ?auto_914438 ) ) ( not ( = ?auto_914436 ?auto_914439 ) ) ( not ( = ?auto_914436 ?auto_914440 ) ) ( not ( = ?auto_914436 ?auto_914441 ) ) ( not ( = ?auto_914436 ?auto_914442 ) ) ( not ( = ?auto_914436 ?auto_914443 ) ) ( not ( = ?auto_914436 ?auto_914444 ) ) ( not ( = ?auto_914436 ?auto_914445 ) ) ( not ( = ?auto_914436 ?auto_914446 ) ) ( not ( = ?auto_914436 ?auto_914447 ) ) ( not ( = ?auto_914436 ?auto_914448 ) ) ( not ( = ?auto_914436 ?auto_914449 ) ) ( not ( = ?auto_914436 ?auto_914450 ) ) ( not ( = ?auto_914436 ?auto_914451 ) ) ( not ( = ?auto_914437 ?auto_914438 ) ) ( not ( = ?auto_914437 ?auto_914439 ) ) ( not ( = ?auto_914437 ?auto_914440 ) ) ( not ( = ?auto_914437 ?auto_914441 ) ) ( not ( = ?auto_914437 ?auto_914442 ) ) ( not ( = ?auto_914437 ?auto_914443 ) ) ( not ( = ?auto_914437 ?auto_914444 ) ) ( not ( = ?auto_914437 ?auto_914445 ) ) ( not ( = ?auto_914437 ?auto_914446 ) ) ( not ( = ?auto_914437 ?auto_914447 ) ) ( not ( = ?auto_914437 ?auto_914448 ) ) ( not ( = ?auto_914437 ?auto_914449 ) ) ( not ( = ?auto_914437 ?auto_914450 ) ) ( not ( = ?auto_914437 ?auto_914451 ) ) ( not ( = ?auto_914438 ?auto_914439 ) ) ( not ( = ?auto_914438 ?auto_914440 ) ) ( not ( = ?auto_914438 ?auto_914441 ) ) ( not ( = ?auto_914438 ?auto_914442 ) ) ( not ( = ?auto_914438 ?auto_914443 ) ) ( not ( = ?auto_914438 ?auto_914444 ) ) ( not ( = ?auto_914438 ?auto_914445 ) ) ( not ( = ?auto_914438 ?auto_914446 ) ) ( not ( = ?auto_914438 ?auto_914447 ) ) ( not ( = ?auto_914438 ?auto_914448 ) ) ( not ( = ?auto_914438 ?auto_914449 ) ) ( not ( = ?auto_914438 ?auto_914450 ) ) ( not ( = ?auto_914438 ?auto_914451 ) ) ( not ( = ?auto_914439 ?auto_914440 ) ) ( not ( = ?auto_914439 ?auto_914441 ) ) ( not ( = ?auto_914439 ?auto_914442 ) ) ( not ( = ?auto_914439 ?auto_914443 ) ) ( not ( = ?auto_914439 ?auto_914444 ) ) ( not ( = ?auto_914439 ?auto_914445 ) ) ( not ( = ?auto_914439 ?auto_914446 ) ) ( not ( = ?auto_914439 ?auto_914447 ) ) ( not ( = ?auto_914439 ?auto_914448 ) ) ( not ( = ?auto_914439 ?auto_914449 ) ) ( not ( = ?auto_914439 ?auto_914450 ) ) ( not ( = ?auto_914439 ?auto_914451 ) ) ( not ( = ?auto_914440 ?auto_914441 ) ) ( not ( = ?auto_914440 ?auto_914442 ) ) ( not ( = ?auto_914440 ?auto_914443 ) ) ( not ( = ?auto_914440 ?auto_914444 ) ) ( not ( = ?auto_914440 ?auto_914445 ) ) ( not ( = ?auto_914440 ?auto_914446 ) ) ( not ( = ?auto_914440 ?auto_914447 ) ) ( not ( = ?auto_914440 ?auto_914448 ) ) ( not ( = ?auto_914440 ?auto_914449 ) ) ( not ( = ?auto_914440 ?auto_914450 ) ) ( not ( = ?auto_914440 ?auto_914451 ) ) ( not ( = ?auto_914441 ?auto_914442 ) ) ( not ( = ?auto_914441 ?auto_914443 ) ) ( not ( = ?auto_914441 ?auto_914444 ) ) ( not ( = ?auto_914441 ?auto_914445 ) ) ( not ( = ?auto_914441 ?auto_914446 ) ) ( not ( = ?auto_914441 ?auto_914447 ) ) ( not ( = ?auto_914441 ?auto_914448 ) ) ( not ( = ?auto_914441 ?auto_914449 ) ) ( not ( = ?auto_914441 ?auto_914450 ) ) ( not ( = ?auto_914441 ?auto_914451 ) ) ( not ( = ?auto_914442 ?auto_914443 ) ) ( not ( = ?auto_914442 ?auto_914444 ) ) ( not ( = ?auto_914442 ?auto_914445 ) ) ( not ( = ?auto_914442 ?auto_914446 ) ) ( not ( = ?auto_914442 ?auto_914447 ) ) ( not ( = ?auto_914442 ?auto_914448 ) ) ( not ( = ?auto_914442 ?auto_914449 ) ) ( not ( = ?auto_914442 ?auto_914450 ) ) ( not ( = ?auto_914442 ?auto_914451 ) ) ( not ( = ?auto_914443 ?auto_914444 ) ) ( not ( = ?auto_914443 ?auto_914445 ) ) ( not ( = ?auto_914443 ?auto_914446 ) ) ( not ( = ?auto_914443 ?auto_914447 ) ) ( not ( = ?auto_914443 ?auto_914448 ) ) ( not ( = ?auto_914443 ?auto_914449 ) ) ( not ( = ?auto_914443 ?auto_914450 ) ) ( not ( = ?auto_914443 ?auto_914451 ) ) ( not ( = ?auto_914444 ?auto_914445 ) ) ( not ( = ?auto_914444 ?auto_914446 ) ) ( not ( = ?auto_914444 ?auto_914447 ) ) ( not ( = ?auto_914444 ?auto_914448 ) ) ( not ( = ?auto_914444 ?auto_914449 ) ) ( not ( = ?auto_914444 ?auto_914450 ) ) ( not ( = ?auto_914444 ?auto_914451 ) ) ( not ( = ?auto_914445 ?auto_914446 ) ) ( not ( = ?auto_914445 ?auto_914447 ) ) ( not ( = ?auto_914445 ?auto_914448 ) ) ( not ( = ?auto_914445 ?auto_914449 ) ) ( not ( = ?auto_914445 ?auto_914450 ) ) ( not ( = ?auto_914445 ?auto_914451 ) ) ( not ( = ?auto_914446 ?auto_914447 ) ) ( not ( = ?auto_914446 ?auto_914448 ) ) ( not ( = ?auto_914446 ?auto_914449 ) ) ( not ( = ?auto_914446 ?auto_914450 ) ) ( not ( = ?auto_914446 ?auto_914451 ) ) ( not ( = ?auto_914447 ?auto_914448 ) ) ( not ( = ?auto_914447 ?auto_914449 ) ) ( not ( = ?auto_914447 ?auto_914450 ) ) ( not ( = ?auto_914447 ?auto_914451 ) ) ( not ( = ?auto_914448 ?auto_914449 ) ) ( not ( = ?auto_914448 ?auto_914450 ) ) ( not ( = ?auto_914448 ?auto_914451 ) ) ( not ( = ?auto_914449 ?auto_914450 ) ) ( not ( = ?auto_914449 ?auto_914451 ) ) ( not ( = ?auto_914450 ?auto_914451 ) ) ( ON ?auto_914449 ?auto_914450 ) ( CLEAR ?auto_914447 ) ( ON ?auto_914448 ?auto_914449 ) ( CLEAR ?auto_914448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_914433 ?auto_914434 ?auto_914435 ?auto_914436 ?auto_914437 ?auto_914438 ?auto_914439 ?auto_914440 ?auto_914441 ?auto_914442 ?auto_914443 ?auto_914444 ?auto_914445 ?auto_914446 ?auto_914447 ?auto_914448 )
      ( MAKE-18PILE ?auto_914433 ?auto_914434 ?auto_914435 ?auto_914436 ?auto_914437 ?auto_914438 ?auto_914439 ?auto_914440 ?auto_914441 ?auto_914442 ?auto_914443 ?auto_914444 ?auto_914445 ?auto_914446 ?auto_914447 ?auto_914448 ?auto_914449 ?auto_914450 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914470 - BLOCK
      ?auto_914471 - BLOCK
      ?auto_914472 - BLOCK
      ?auto_914473 - BLOCK
      ?auto_914474 - BLOCK
      ?auto_914475 - BLOCK
      ?auto_914476 - BLOCK
      ?auto_914477 - BLOCK
      ?auto_914478 - BLOCK
      ?auto_914479 - BLOCK
      ?auto_914480 - BLOCK
      ?auto_914481 - BLOCK
      ?auto_914482 - BLOCK
      ?auto_914483 - BLOCK
      ?auto_914484 - BLOCK
      ?auto_914485 - BLOCK
      ?auto_914486 - BLOCK
      ?auto_914487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914487 ) ( ON-TABLE ?auto_914470 ) ( ON ?auto_914471 ?auto_914470 ) ( ON ?auto_914472 ?auto_914471 ) ( ON ?auto_914473 ?auto_914472 ) ( ON ?auto_914474 ?auto_914473 ) ( ON ?auto_914475 ?auto_914474 ) ( ON ?auto_914476 ?auto_914475 ) ( ON ?auto_914477 ?auto_914476 ) ( ON ?auto_914478 ?auto_914477 ) ( ON ?auto_914479 ?auto_914478 ) ( ON ?auto_914480 ?auto_914479 ) ( ON ?auto_914481 ?auto_914480 ) ( ON ?auto_914482 ?auto_914481 ) ( ON ?auto_914483 ?auto_914482 ) ( ON ?auto_914484 ?auto_914483 ) ( not ( = ?auto_914470 ?auto_914471 ) ) ( not ( = ?auto_914470 ?auto_914472 ) ) ( not ( = ?auto_914470 ?auto_914473 ) ) ( not ( = ?auto_914470 ?auto_914474 ) ) ( not ( = ?auto_914470 ?auto_914475 ) ) ( not ( = ?auto_914470 ?auto_914476 ) ) ( not ( = ?auto_914470 ?auto_914477 ) ) ( not ( = ?auto_914470 ?auto_914478 ) ) ( not ( = ?auto_914470 ?auto_914479 ) ) ( not ( = ?auto_914470 ?auto_914480 ) ) ( not ( = ?auto_914470 ?auto_914481 ) ) ( not ( = ?auto_914470 ?auto_914482 ) ) ( not ( = ?auto_914470 ?auto_914483 ) ) ( not ( = ?auto_914470 ?auto_914484 ) ) ( not ( = ?auto_914470 ?auto_914485 ) ) ( not ( = ?auto_914470 ?auto_914486 ) ) ( not ( = ?auto_914470 ?auto_914487 ) ) ( not ( = ?auto_914471 ?auto_914472 ) ) ( not ( = ?auto_914471 ?auto_914473 ) ) ( not ( = ?auto_914471 ?auto_914474 ) ) ( not ( = ?auto_914471 ?auto_914475 ) ) ( not ( = ?auto_914471 ?auto_914476 ) ) ( not ( = ?auto_914471 ?auto_914477 ) ) ( not ( = ?auto_914471 ?auto_914478 ) ) ( not ( = ?auto_914471 ?auto_914479 ) ) ( not ( = ?auto_914471 ?auto_914480 ) ) ( not ( = ?auto_914471 ?auto_914481 ) ) ( not ( = ?auto_914471 ?auto_914482 ) ) ( not ( = ?auto_914471 ?auto_914483 ) ) ( not ( = ?auto_914471 ?auto_914484 ) ) ( not ( = ?auto_914471 ?auto_914485 ) ) ( not ( = ?auto_914471 ?auto_914486 ) ) ( not ( = ?auto_914471 ?auto_914487 ) ) ( not ( = ?auto_914472 ?auto_914473 ) ) ( not ( = ?auto_914472 ?auto_914474 ) ) ( not ( = ?auto_914472 ?auto_914475 ) ) ( not ( = ?auto_914472 ?auto_914476 ) ) ( not ( = ?auto_914472 ?auto_914477 ) ) ( not ( = ?auto_914472 ?auto_914478 ) ) ( not ( = ?auto_914472 ?auto_914479 ) ) ( not ( = ?auto_914472 ?auto_914480 ) ) ( not ( = ?auto_914472 ?auto_914481 ) ) ( not ( = ?auto_914472 ?auto_914482 ) ) ( not ( = ?auto_914472 ?auto_914483 ) ) ( not ( = ?auto_914472 ?auto_914484 ) ) ( not ( = ?auto_914472 ?auto_914485 ) ) ( not ( = ?auto_914472 ?auto_914486 ) ) ( not ( = ?auto_914472 ?auto_914487 ) ) ( not ( = ?auto_914473 ?auto_914474 ) ) ( not ( = ?auto_914473 ?auto_914475 ) ) ( not ( = ?auto_914473 ?auto_914476 ) ) ( not ( = ?auto_914473 ?auto_914477 ) ) ( not ( = ?auto_914473 ?auto_914478 ) ) ( not ( = ?auto_914473 ?auto_914479 ) ) ( not ( = ?auto_914473 ?auto_914480 ) ) ( not ( = ?auto_914473 ?auto_914481 ) ) ( not ( = ?auto_914473 ?auto_914482 ) ) ( not ( = ?auto_914473 ?auto_914483 ) ) ( not ( = ?auto_914473 ?auto_914484 ) ) ( not ( = ?auto_914473 ?auto_914485 ) ) ( not ( = ?auto_914473 ?auto_914486 ) ) ( not ( = ?auto_914473 ?auto_914487 ) ) ( not ( = ?auto_914474 ?auto_914475 ) ) ( not ( = ?auto_914474 ?auto_914476 ) ) ( not ( = ?auto_914474 ?auto_914477 ) ) ( not ( = ?auto_914474 ?auto_914478 ) ) ( not ( = ?auto_914474 ?auto_914479 ) ) ( not ( = ?auto_914474 ?auto_914480 ) ) ( not ( = ?auto_914474 ?auto_914481 ) ) ( not ( = ?auto_914474 ?auto_914482 ) ) ( not ( = ?auto_914474 ?auto_914483 ) ) ( not ( = ?auto_914474 ?auto_914484 ) ) ( not ( = ?auto_914474 ?auto_914485 ) ) ( not ( = ?auto_914474 ?auto_914486 ) ) ( not ( = ?auto_914474 ?auto_914487 ) ) ( not ( = ?auto_914475 ?auto_914476 ) ) ( not ( = ?auto_914475 ?auto_914477 ) ) ( not ( = ?auto_914475 ?auto_914478 ) ) ( not ( = ?auto_914475 ?auto_914479 ) ) ( not ( = ?auto_914475 ?auto_914480 ) ) ( not ( = ?auto_914475 ?auto_914481 ) ) ( not ( = ?auto_914475 ?auto_914482 ) ) ( not ( = ?auto_914475 ?auto_914483 ) ) ( not ( = ?auto_914475 ?auto_914484 ) ) ( not ( = ?auto_914475 ?auto_914485 ) ) ( not ( = ?auto_914475 ?auto_914486 ) ) ( not ( = ?auto_914475 ?auto_914487 ) ) ( not ( = ?auto_914476 ?auto_914477 ) ) ( not ( = ?auto_914476 ?auto_914478 ) ) ( not ( = ?auto_914476 ?auto_914479 ) ) ( not ( = ?auto_914476 ?auto_914480 ) ) ( not ( = ?auto_914476 ?auto_914481 ) ) ( not ( = ?auto_914476 ?auto_914482 ) ) ( not ( = ?auto_914476 ?auto_914483 ) ) ( not ( = ?auto_914476 ?auto_914484 ) ) ( not ( = ?auto_914476 ?auto_914485 ) ) ( not ( = ?auto_914476 ?auto_914486 ) ) ( not ( = ?auto_914476 ?auto_914487 ) ) ( not ( = ?auto_914477 ?auto_914478 ) ) ( not ( = ?auto_914477 ?auto_914479 ) ) ( not ( = ?auto_914477 ?auto_914480 ) ) ( not ( = ?auto_914477 ?auto_914481 ) ) ( not ( = ?auto_914477 ?auto_914482 ) ) ( not ( = ?auto_914477 ?auto_914483 ) ) ( not ( = ?auto_914477 ?auto_914484 ) ) ( not ( = ?auto_914477 ?auto_914485 ) ) ( not ( = ?auto_914477 ?auto_914486 ) ) ( not ( = ?auto_914477 ?auto_914487 ) ) ( not ( = ?auto_914478 ?auto_914479 ) ) ( not ( = ?auto_914478 ?auto_914480 ) ) ( not ( = ?auto_914478 ?auto_914481 ) ) ( not ( = ?auto_914478 ?auto_914482 ) ) ( not ( = ?auto_914478 ?auto_914483 ) ) ( not ( = ?auto_914478 ?auto_914484 ) ) ( not ( = ?auto_914478 ?auto_914485 ) ) ( not ( = ?auto_914478 ?auto_914486 ) ) ( not ( = ?auto_914478 ?auto_914487 ) ) ( not ( = ?auto_914479 ?auto_914480 ) ) ( not ( = ?auto_914479 ?auto_914481 ) ) ( not ( = ?auto_914479 ?auto_914482 ) ) ( not ( = ?auto_914479 ?auto_914483 ) ) ( not ( = ?auto_914479 ?auto_914484 ) ) ( not ( = ?auto_914479 ?auto_914485 ) ) ( not ( = ?auto_914479 ?auto_914486 ) ) ( not ( = ?auto_914479 ?auto_914487 ) ) ( not ( = ?auto_914480 ?auto_914481 ) ) ( not ( = ?auto_914480 ?auto_914482 ) ) ( not ( = ?auto_914480 ?auto_914483 ) ) ( not ( = ?auto_914480 ?auto_914484 ) ) ( not ( = ?auto_914480 ?auto_914485 ) ) ( not ( = ?auto_914480 ?auto_914486 ) ) ( not ( = ?auto_914480 ?auto_914487 ) ) ( not ( = ?auto_914481 ?auto_914482 ) ) ( not ( = ?auto_914481 ?auto_914483 ) ) ( not ( = ?auto_914481 ?auto_914484 ) ) ( not ( = ?auto_914481 ?auto_914485 ) ) ( not ( = ?auto_914481 ?auto_914486 ) ) ( not ( = ?auto_914481 ?auto_914487 ) ) ( not ( = ?auto_914482 ?auto_914483 ) ) ( not ( = ?auto_914482 ?auto_914484 ) ) ( not ( = ?auto_914482 ?auto_914485 ) ) ( not ( = ?auto_914482 ?auto_914486 ) ) ( not ( = ?auto_914482 ?auto_914487 ) ) ( not ( = ?auto_914483 ?auto_914484 ) ) ( not ( = ?auto_914483 ?auto_914485 ) ) ( not ( = ?auto_914483 ?auto_914486 ) ) ( not ( = ?auto_914483 ?auto_914487 ) ) ( not ( = ?auto_914484 ?auto_914485 ) ) ( not ( = ?auto_914484 ?auto_914486 ) ) ( not ( = ?auto_914484 ?auto_914487 ) ) ( not ( = ?auto_914485 ?auto_914486 ) ) ( not ( = ?auto_914485 ?auto_914487 ) ) ( not ( = ?auto_914486 ?auto_914487 ) ) ( ON ?auto_914486 ?auto_914487 ) ( CLEAR ?auto_914484 ) ( ON ?auto_914485 ?auto_914486 ) ( CLEAR ?auto_914485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_914470 ?auto_914471 ?auto_914472 ?auto_914473 ?auto_914474 ?auto_914475 ?auto_914476 ?auto_914477 ?auto_914478 ?auto_914479 ?auto_914480 ?auto_914481 ?auto_914482 ?auto_914483 ?auto_914484 ?auto_914485 )
      ( MAKE-18PILE ?auto_914470 ?auto_914471 ?auto_914472 ?auto_914473 ?auto_914474 ?auto_914475 ?auto_914476 ?auto_914477 ?auto_914478 ?auto_914479 ?auto_914480 ?auto_914481 ?auto_914482 ?auto_914483 ?auto_914484 ?auto_914485 ?auto_914486 ?auto_914487 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914506 - BLOCK
      ?auto_914507 - BLOCK
      ?auto_914508 - BLOCK
      ?auto_914509 - BLOCK
      ?auto_914510 - BLOCK
      ?auto_914511 - BLOCK
      ?auto_914512 - BLOCK
      ?auto_914513 - BLOCK
      ?auto_914514 - BLOCK
      ?auto_914515 - BLOCK
      ?auto_914516 - BLOCK
      ?auto_914517 - BLOCK
      ?auto_914518 - BLOCK
      ?auto_914519 - BLOCK
      ?auto_914520 - BLOCK
      ?auto_914521 - BLOCK
      ?auto_914522 - BLOCK
      ?auto_914523 - BLOCK
    )
    :vars
    (
      ?auto_914524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914523 ?auto_914524 ) ( ON-TABLE ?auto_914506 ) ( ON ?auto_914507 ?auto_914506 ) ( ON ?auto_914508 ?auto_914507 ) ( ON ?auto_914509 ?auto_914508 ) ( ON ?auto_914510 ?auto_914509 ) ( ON ?auto_914511 ?auto_914510 ) ( ON ?auto_914512 ?auto_914511 ) ( ON ?auto_914513 ?auto_914512 ) ( ON ?auto_914514 ?auto_914513 ) ( ON ?auto_914515 ?auto_914514 ) ( ON ?auto_914516 ?auto_914515 ) ( ON ?auto_914517 ?auto_914516 ) ( ON ?auto_914518 ?auto_914517 ) ( ON ?auto_914519 ?auto_914518 ) ( not ( = ?auto_914506 ?auto_914507 ) ) ( not ( = ?auto_914506 ?auto_914508 ) ) ( not ( = ?auto_914506 ?auto_914509 ) ) ( not ( = ?auto_914506 ?auto_914510 ) ) ( not ( = ?auto_914506 ?auto_914511 ) ) ( not ( = ?auto_914506 ?auto_914512 ) ) ( not ( = ?auto_914506 ?auto_914513 ) ) ( not ( = ?auto_914506 ?auto_914514 ) ) ( not ( = ?auto_914506 ?auto_914515 ) ) ( not ( = ?auto_914506 ?auto_914516 ) ) ( not ( = ?auto_914506 ?auto_914517 ) ) ( not ( = ?auto_914506 ?auto_914518 ) ) ( not ( = ?auto_914506 ?auto_914519 ) ) ( not ( = ?auto_914506 ?auto_914520 ) ) ( not ( = ?auto_914506 ?auto_914521 ) ) ( not ( = ?auto_914506 ?auto_914522 ) ) ( not ( = ?auto_914506 ?auto_914523 ) ) ( not ( = ?auto_914506 ?auto_914524 ) ) ( not ( = ?auto_914507 ?auto_914508 ) ) ( not ( = ?auto_914507 ?auto_914509 ) ) ( not ( = ?auto_914507 ?auto_914510 ) ) ( not ( = ?auto_914507 ?auto_914511 ) ) ( not ( = ?auto_914507 ?auto_914512 ) ) ( not ( = ?auto_914507 ?auto_914513 ) ) ( not ( = ?auto_914507 ?auto_914514 ) ) ( not ( = ?auto_914507 ?auto_914515 ) ) ( not ( = ?auto_914507 ?auto_914516 ) ) ( not ( = ?auto_914507 ?auto_914517 ) ) ( not ( = ?auto_914507 ?auto_914518 ) ) ( not ( = ?auto_914507 ?auto_914519 ) ) ( not ( = ?auto_914507 ?auto_914520 ) ) ( not ( = ?auto_914507 ?auto_914521 ) ) ( not ( = ?auto_914507 ?auto_914522 ) ) ( not ( = ?auto_914507 ?auto_914523 ) ) ( not ( = ?auto_914507 ?auto_914524 ) ) ( not ( = ?auto_914508 ?auto_914509 ) ) ( not ( = ?auto_914508 ?auto_914510 ) ) ( not ( = ?auto_914508 ?auto_914511 ) ) ( not ( = ?auto_914508 ?auto_914512 ) ) ( not ( = ?auto_914508 ?auto_914513 ) ) ( not ( = ?auto_914508 ?auto_914514 ) ) ( not ( = ?auto_914508 ?auto_914515 ) ) ( not ( = ?auto_914508 ?auto_914516 ) ) ( not ( = ?auto_914508 ?auto_914517 ) ) ( not ( = ?auto_914508 ?auto_914518 ) ) ( not ( = ?auto_914508 ?auto_914519 ) ) ( not ( = ?auto_914508 ?auto_914520 ) ) ( not ( = ?auto_914508 ?auto_914521 ) ) ( not ( = ?auto_914508 ?auto_914522 ) ) ( not ( = ?auto_914508 ?auto_914523 ) ) ( not ( = ?auto_914508 ?auto_914524 ) ) ( not ( = ?auto_914509 ?auto_914510 ) ) ( not ( = ?auto_914509 ?auto_914511 ) ) ( not ( = ?auto_914509 ?auto_914512 ) ) ( not ( = ?auto_914509 ?auto_914513 ) ) ( not ( = ?auto_914509 ?auto_914514 ) ) ( not ( = ?auto_914509 ?auto_914515 ) ) ( not ( = ?auto_914509 ?auto_914516 ) ) ( not ( = ?auto_914509 ?auto_914517 ) ) ( not ( = ?auto_914509 ?auto_914518 ) ) ( not ( = ?auto_914509 ?auto_914519 ) ) ( not ( = ?auto_914509 ?auto_914520 ) ) ( not ( = ?auto_914509 ?auto_914521 ) ) ( not ( = ?auto_914509 ?auto_914522 ) ) ( not ( = ?auto_914509 ?auto_914523 ) ) ( not ( = ?auto_914509 ?auto_914524 ) ) ( not ( = ?auto_914510 ?auto_914511 ) ) ( not ( = ?auto_914510 ?auto_914512 ) ) ( not ( = ?auto_914510 ?auto_914513 ) ) ( not ( = ?auto_914510 ?auto_914514 ) ) ( not ( = ?auto_914510 ?auto_914515 ) ) ( not ( = ?auto_914510 ?auto_914516 ) ) ( not ( = ?auto_914510 ?auto_914517 ) ) ( not ( = ?auto_914510 ?auto_914518 ) ) ( not ( = ?auto_914510 ?auto_914519 ) ) ( not ( = ?auto_914510 ?auto_914520 ) ) ( not ( = ?auto_914510 ?auto_914521 ) ) ( not ( = ?auto_914510 ?auto_914522 ) ) ( not ( = ?auto_914510 ?auto_914523 ) ) ( not ( = ?auto_914510 ?auto_914524 ) ) ( not ( = ?auto_914511 ?auto_914512 ) ) ( not ( = ?auto_914511 ?auto_914513 ) ) ( not ( = ?auto_914511 ?auto_914514 ) ) ( not ( = ?auto_914511 ?auto_914515 ) ) ( not ( = ?auto_914511 ?auto_914516 ) ) ( not ( = ?auto_914511 ?auto_914517 ) ) ( not ( = ?auto_914511 ?auto_914518 ) ) ( not ( = ?auto_914511 ?auto_914519 ) ) ( not ( = ?auto_914511 ?auto_914520 ) ) ( not ( = ?auto_914511 ?auto_914521 ) ) ( not ( = ?auto_914511 ?auto_914522 ) ) ( not ( = ?auto_914511 ?auto_914523 ) ) ( not ( = ?auto_914511 ?auto_914524 ) ) ( not ( = ?auto_914512 ?auto_914513 ) ) ( not ( = ?auto_914512 ?auto_914514 ) ) ( not ( = ?auto_914512 ?auto_914515 ) ) ( not ( = ?auto_914512 ?auto_914516 ) ) ( not ( = ?auto_914512 ?auto_914517 ) ) ( not ( = ?auto_914512 ?auto_914518 ) ) ( not ( = ?auto_914512 ?auto_914519 ) ) ( not ( = ?auto_914512 ?auto_914520 ) ) ( not ( = ?auto_914512 ?auto_914521 ) ) ( not ( = ?auto_914512 ?auto_914522 ) ) ( not ( = ?auto_914512 ?auto_914523 ) ) ( not ( = ?auto_914512 ?auto_914524 ) ) ( not ( = ?auto_914513 ?auto_914514 ) ) ( not ( = ?auto_914513 ?auto_914515 ) ) ( not ( = ?auto_914513 ?auto_914516 ) ) ( not ( = ?auto_914513 ?auto_914517 ) ) ( not ( = ?auto_914513 ?auto_914518 ) ) ( not ( = ?auto_914513 ?auto_914519 ) ) ( not ( = ?auto_914513 ?auto_914520 ) ) ( not ( = ?auto_914513 ?auto_914521 ) ) ( not ( = ?auto_914513 ?auto_914522 ) ) ( not ( = ?auto_914513 ?auto_914523 ) ) ( not ( = ?auto_914513 ?auto_914524 ) ) ( not ( = ?auto_914514 ?auto_914515 ) ) ( not ( = ?auto_914514 ?auto_914516 ) ) ( not ( = ?auto_914514 ?auto_914517 ) ) ( not ( = ?auto_914514 ?auto_914518 ) ) ( not ( = ?auto_914514 ?auto_914519 ) ) ( not ( = ?auto_914514 ?auto_914520 ) ) ( not ( = ?auto_914514 ?auto_914521 ) ) ( not ( = ?auto_914514 ?auto_914522 ) ) ( not ( = ?auto_914514 ?auto_914523 ) ) ( not ( = ?auto_914514 ?auto_914524 ) ) ( not ( = ?auto_914515 ?auto_914516 ) ) ( not ( = ?auto_914515 ?auto_914517 ) ) ( not ( = ?auto_914515 ?auto_914518 ) ) ( not ( = ?auto_914515 ?auto_914519 ) ) ( not ( = ?auto_914515 ?auto_914520 ) ) ( not ( = ?auto_914515 ?auto_914521 ) ) ( not ( = ?auto_914515 ?auto_914522 ) ) ( not ( = ?auto_914515 ?auto_914523 ) ) ( not ( = ?auto_914515 ?auto_914524 ) ) ( not ( = ?auto_914516 ?auto_914517 ) ) ( not ( = ?auto_914516 ?auto_914518 ) ) ( not ( = ?auto_914516 ?auto_914519 ) ) ( not ( = ?auto_914516 ?auto_914520 ) ) ( not ( = ?auto_914516 ?auto_914521 ) ) ( not ( = ?auto_914516 ?auto_914522 ) ) ( not ( = ?auto_914516 ?auto_914523 ) ) ( not ( = ?auto_914516 ?auto_914524 ) ) ( not ( = ?auto_914517 ?auto_914518 ) ) ( not ( = ?auto_914517 ?auto_914519 ) ) ( not ( = ?auto_914517 ?auto_914520 ) ) ( not ( = ?auto_914517 ?auto_914521 ) ) ( not ( = ?auto_914517 ?auto_914522 ) ) ( not ( = ?auto_914517 ?auto_914523 ) ) ( not ( = ?auto_914517 ?auto_914524 ) ) ( not ( = ?auto_914518 ?auto_914519 ) ) ( not ( = ?auto_914518 ?auto_914520 ) ) ( not ( = ?auto_914518 ?auto_914521 ) ) ( not ( = ?auto_914518 ?auto_914522 ) ) ( not ( = ?auto_914518 ?auto_914523 ) ) ( not ( = ?auto_914518 ?auto_914524 ) ) ( not ( = ?auto_914519 ?auto_914520 ) ) ( not ( = ?auto_914519 ?auto_914521 ) ) ( not ( = ?auto_914519 ?auto_914522 ) ) ( not ( = ?auto_914519 ?auto_914523 ) ) ( not ( = ?auto_914519 ?auto_914524 ) ) ( not ( = ?auto_914520 ?auto_914521 ) ) ( not ( = ?auto_914520 ?auto_914522 ) ) ( not ( = ?auto_914520 ?auto_914523 ) ) ( not ( = ?auto_914520 ?auto_914524 ) ) ( not ( = ?auto_914521 ?auto_914522 ) ) ( not ( = ?auto_914521 ?auto_914523 ) ) ( not ( = ?auto_914521 ?auto_914524 ) ) ( not ( = ?auto_914522 ?auto_914523 ) ) ( not ( = ?auto_914522 ?auto_914524 ) ) ( not ( = ?auto_914523 ?auto_914524 ) ) ( ON ?auto_914522 ?auto_914523 ) ( ON ?auto_914521 ?auto_914522 ) ( CLEAR ?auto_914519 ) ( ON ?auto_914520 ?auto_914521 ) ( CLEAR ?auto_914520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_914506 ?auto_914507 ?auto_914508 ?auto_914509 ?auto_914510 ?auto_914511 ?auto_914512 ?auto_914513 ?auto_914514 ?auto_914515 ?auto_914516 ?auto_914517 ?auto_914518 ?auto_914519 ?auto_914520 )
      ( MAKE-18PILE ?auto_914506 ?auto_914507 ?auto_914508 ?auto_914509 ?auto_914510 ?auto_914511 ?auto_914512 ?auto_914513 ?auto_914514 ?auto_914515 ?auto_914516 ?auto_914517 ?auto_914518 ?auto_914519 ?auto_914520 ?auto_914521 ?auto_914522 ?auto_914523 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914543 - BLOCK
      ?auto_914544 - BLOCK
      ?auto_914545 - BLOCK
      ?auto_914546 - BLOCK
      ?auto_914547 - BLOCK
      ?auto_914548 - BLOCK
      ?auto_914549 - BLOCK
      ?auto_914550 - BLOCK
      ?auto_914551 - BLOCK
      ?auto_914552 - BLOCK
      ?auto_914553 - BLOCK
      ?auto_914554 - BLOCK
      ?auto_914555 - BLOCK
      ?auto_914556 - BLOCK
      ?auto_914557 - BLOCK
      ?auto_914558 - BLOCK
      ?auto_914559 - BLOCK
      ?auto_914560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914560 ) ( ON-TABLE ?auto_914543 ) ( ON ?auto_914544 ?auto_914543 ) ( ON ?auto_914545 ?auto_914544 ) ( ON ?auto_914546 ?auto_914545 ) ( ON ?auto_914547 ?auto_914546 ) ( ON ?auto_914548 ?auto_914547 ) ( ON ?auto_914549 ?auto_914548 ) ( ON ?auto_914550 ?auto_914549 ) ( ON ?auto_914551 ?auto_914550 ) ( ON ?auto_914552 ?auto_914551 ) ( ON ?auto_914553 ?auto_914552 ) ( ON ?auto_914554 ?auto_914553 ) ( ON ?auto_914555 ?auto_914554 ) ( ON ?auto_914556 ?auto_914555 ) ( not ( = ?auto_914543 ?auto_914544 ) ) ( not ( = ?auto_914543 ?auto_914545 ) ) ( not ( = ?auto_914543 ?auto_914546 ) ) ( not ( = ?auto_914543 ?auto_914547 ) ) ( not ( = ?auto_914543 ?auto_914548 ) ) ( not ( = ?auto_914543 ?auto_914549 ) ) ( not ( = ?auto_914543 ?auto_914550 ) ) ( not ( = ?auto_914543 ?auto_914551 ) ) ( not ( = ?auto_914543 ?auto_914552 ) ) ( not ( = ?auto_914543 ?auto_914553 ) ) ( not ( = ?auto_914543 ?auto_914554 ) ) ( not ( = ?auto_914543 ?auto_914555 ) ) ( not ( = ?auto_914543 ?auto_914556 ) ) ( not ( = ?auto_914543 ?auto_914557 ) ) ( not ( = ?auto_914543 ?auto_914558 ) ) ( not ( = ?auto_914543 ?auto_914559 ) ) ( not ( = ?auto_914543 ?auto_914560 ) ) ( not ( = ?auto_914544 ?auto_914545 ) ) ( not ( = ?auto_914544 ?auto_914546 ) ) ( not ( = ?auto_914544 ?auto_914547 ) ) ( not ( = ?auto_914544 ?auto_914548 ) ) ( not ( = ?auto_914544 ?auto_914549 ) ) ( not ( = ?auto_914544 ?auto_914550 ) ) ( not ( = ?auto_914544 ?auto_914551 ) ) ( not ( = ?auto_914544 ?auto_914552 ) ) ( not ( = ?auto_914544 ?auto_914553 ) ) ( not ( = ?auto_914544 ?auto_914554 ) ) ( not ( = ?auto_914544 ?auto_914555 ) ) ( not ( = ?auto_914544 ?auto_914556 ) ) ( not ( = ?auto_914544 ?auto_914557 ) ) ( not ( = ?auto_914544 ?auto_914558 ) ) ( not ( = ?auto_914544 ?auto_914559 ) ) ( not ( = ?auto_914544 ?auto_914560 ) ) ( not ( = ?auto_914545 ?auto_914546 ) ) ( not ( = ?auto_914545 ?auto_914547 ) ) ( not ( = ?auto_914545 ?auto_914548 ) ) ( not ( = ?auto_914545 ?auto_914549 ) ) ( not ( = ?auto_914545 ?auto_914550 ) ) ( not ( = ?auto_914545 ?auto_914551 ) ) ( not ( = ?auto_914545 ?auto_914552 ) ) ( not ( = ?auto_914545 ?auto_914553 ) ) ( not ( = ?auto_914545 ?auto_914554 ) ) ( not ( = ?auto_914545 ?auto_914555 ) ) ( not ( = ?auto_914545 ?auto_914556 ) ) ( not ( = ?auto_914545 ?auto_914557 ) ) ( not ( = ?auto_914545 ?auto_914558 ) ) ( not ( = ?auto_914545 ?auto_914559 ) ) ( not ( = ?auto_914545 ?auto_914560 ) ) ( not ( = ?auto_914546 ?auto_914547 ) ) ( not ( = ?auto_914546 ?auto_914548 ) ) ( not ( = ?auto_914546 ?auto_914549 ) ) ( not ( = ?auto_914546 ?auto_914550 ) ) ( not ( = ?auto_914546 ?auto_914551 ) ) ( not ( = ?auto_914546 ?auto_914552 ) ) ( not ( = ?auto_914546 ?auto_914553 ) ) ( not ( = ?auto_914546 ?auto_914554 ) ) ( not ( = ?auto_914546 ?auto_914555 ) ) ( not ( = ?auto_914546 ?auto_914556 ) ) ( not ( = ?auto_914546 ?auto_914557 ) ) ( not ( = ?auto_914546 ?auto_914558 ) ) ( not ( = ?auto_914546 ?auto_914559 ) ) ( not ( = ?auto_914546 ?auto_914560 ) ) ( not ( = ?auto_914547 ?auto_914548 ) ) ( not ( = ?auto_914547 ?auto_914549 ) ) ( not ( = ?auto_914547 ?auto_914550 ) ) ( not ( = ?auto_914547 ?auto_914551 ) ) ( not ( = ?auto_914547 ?auto_914552 ) ) ( not ( = ?auto_914547 ?auto_914553 ) ) ( not ( = ?auto_914547 ?auto_914554 ) ) ( not ( = ?auto_914547 ?auto_914555 ) ) ( not ( = ?auto_914547 ?auto_914556 ) ) ( not ( = ?auto_914547 ?auto_914557 ) ) ( not ( = ?auto_914547 ?auto_914558 ) ) ( not ( = ?auto_914547 ?auto_914559 ) ) ( not ( = ?auto_914547 ?auto_914560 ) ) ( not ( = ?auto_914548 ?auto_914549 ) ) ( not ( = ?auto_914548 ?auto_914550 ) ) ( not ( = ?auto_914548 ?auto_914551 ) ) ( not ( = ?auto_914548 ?auto_914552 ) ) ( not ( = ?auto_914548 ?auto_914553 ) ) ( not ( = ?auto_914548 ?auto_914554 ) ) ( not ( = ?auto_914548 ?auto_914555 ) ) ( not ( = ?auto_914548 ?auto_914556 ) ) ( not ( = ?auto_914548 ?auto_914557 ) ) ( not ( = ?auto_914548 ?auto_914558 ) ) ( not ( = ?auto_914548 ?auto_914559 ) ) ( not ( = ?auto_914548 ?auto_914560 ) ) ( not ( = ?auto_914549 ?auto_914550 ) ) ( not ( = ?auto_914549 ?auto_914551 ) ) ( not ( = ?auto_914549 ?auto_914552 ) ) ( not ( = ?auto_914549 ?auto_914553 ) ) ( not ( = ?auto_914549 ?auto_914554 ) ) ( not ( = ?auto_914549 ?auto_914555 ) ) ( not ( = ?auto_914549 ?auto_914556 ) ) ( not ( = ?auto_914549 ?auto_914557 ) ) ( not ( = ?auto_914549 ?auto_914558 ) ) ( not ( = ?auto_914549 ?auto_914559 ) ) ( not ( = ?auto_914549 ?auto_914560 ) ) ( not ( = ?auto_914550 ?auto_914551 ) ) ( not ( = ?auto_914550 ?auto_914552 ) ) ( not ( = ?auto_914550 ?auto_914553 ) ) ( not ( = ?auto_914550 ?auto_914554 ) ) ( not ( = ?auto_914550 ?auto_914555 ) ) ( not ( = ?auto_914550 ?auto_914556 ) ) ( not ( = ?auto_914550 ?auto_914557 ) ) ( not ( = ?auto_914550 ?auto_914558 ) ) ( not ( = ?auto_914550 ?auto_914559 ) ) ( not ( = ?auto_914550 ?auto_914560 ) ) ( not ( = ?auto_914551 ?auto_914552 ) ) ( not ( = ?auto_914551 ?auto_914553 ) ) ( not ( = ?auto_914551 ?auto_914554 ) ) ( not ( = ?auto_914551 ?auto_914555 ) ) ( not ( = ?auto_914551 ?auto_914556 ) ) ( not ( = ?auto_914551 ?auto_914557 ) ) ( not ( = ?auto_914551 ?auto_914558 ) ) ( not ( = ?auto_914551 ?auto_914559 ) ) ( not ( = ?auto_914551 ?auto_914560 ) ) ( not ( = ?auto_914552 ?auto_914553 ) ) ( not ( = ?auto_914552 ?auto_914554 ) ) ( not ( = ?auto_914552 ?auto_914555 ) ) ( not ( = ?auto_914552 ?auto_914556 ) ) ( not ( = ?auto_914552 ?auto_914557 ) ) ( not ( = ?auto_914552 ?auto_914558 ) ) ( not ( = ?auto_914552 ?auto_914559 ) ) ( not ( = ?auto_914552 ?auto_914560 ) ) ( not ( = ?auto_914553 ?auto_914554 ) ) ( not ( = ?auto_914553 ?auto_914555 ) ) ( not ( = ?auto_914553 ?auto_914556 ) ) ( not ( = ?auto_914553 ?auto_914557 ) ) ( not ( = ?auto_914553 ?auto_914558 ) ) ( not ( = ?auto_914553 ?auto_914559 ) ) ( not ( = ?auto_914553 ?auto_914560 ) ) ( not ( = ?auto_914554 ?auto_914555 ) ) ( not ( = ?auto_914554 ?auto_914556 ) ) ( not ( = ?auto_914554 ?auto_914557 ) ) ( not ( = ?auto_914554 ?auto_914558 ) ) ( not ( = ?auto_914554 ?auto_914559 ) ) ( not ( = ?auto_914554 ?auto_914560 ) ) ( not ( = ?auto_914555 ?auto_914556 ) ) ( not ( = ?auto_914555 ?auto_914557 ) ) ( not ( = ?auto_914555 ?auto_914558 ) ) ( not ( = ?auto_914555 ?auto_914559 ) ) ( not ( = ?auto_914555 ?auto_914560 ) ) ( not ( = ?auto_914556 ?auto_914557 ) ) ( not ( = ?auto_914556 ?auto_914558 ) ) ( not ( = ?auto_914556 ?auto_914559 ) ) ( not ( = ?auto_914556 ?auto_914560 ) ) ( not ( = ?auto_914557 ?auto_914558 ) ) ( not ( = ?auto_914557 ?auto_914559 ) ) ( not ( = ?auto_914557 ?auto_914560 ) ) ( not ( = ?auto_914558 ?auto_914559 ) ) ( not ( = ?auto_914558 ?auto_914560 ) ) ( not ( = ?auto_914559 ?auto_914560 ) ) ( ON ?auto_914559 ?auto_914560 ) ( ON ?auto_914558 ?auto_914559 ) ( CLEAR ?auto_914556 ) ( ON ?auto_914557 ?auto_914558 ) ( CLEAR ?auto_914557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_914543 ?auto_914544 ?auto_914545 ?auto_914546 ?auto_914547 ?auto_914548 ?auto_914549 ?auto_914550 ?auto_914551 ?auto_914552 ?auto_914553 ?auto_914554 ?auto_914555 ?auto_914556 ?auto_914557 )
      ( MAKE-18PILE ?auto_914543 ?auto_914544 ?auto_914545 ?auto_914546 ?auto_914547 ?auto_914548 ?auto_914549 ?auto_914550 ?auto_914551 ?auto_914552 ?auto_914553 ?auto_914554 ?auto_914555 ?auto_914556 ?auto_914557 ?auto_914558 ?auto_914559 ?auto_914560 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914579 - BLOCK
      ?auto_914580 - BLOCK
      ?auto_914581 - BLOCK
      ?auto_914582 - BLOCK
      ?auto_914583 - BLOCK
      ?auto_914584 - BLOCK
      ?auto_914585 - BLOCK
      ?auto_914586 - BLOCK
      ?auto_914587 - BLOCK
      ?auto_914588 - BLOCK
      ?auto_914589 - BLOCK
      ?auto_914590 - BLOCK
      ?auto_914591 - BLOCK
      ?auto_914592 - BLOCK
      ?auto_914593 - BLOCK
      ?auto_914594 - BLOCK
      ?auto_914595 - BLOCK
      ?auto_914596 - BLOCK
    )
    :vars
    (
      ?auto_914597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914596 ?auto_914597 ) ( ON-TABLE ?auto_914579 ) ( ON ?auto_914580 ?auto_914579 ) ( ON ?auto_914581 ?auto_914580 ) ( ON ?auto_914582 ?auto_914581 ) ( ON ?auto_914583 ?auto_914582 ) ( ON ?auto_914584 ?auto_914583 ) ( ON ?auto_914585 ?auto_914584 ) ( ON ?auto_914586 ?auto_914585 ) ( ON ?auto_914587 ?auto_914586 ) ( ON ?auto_914588 ?auto_914587 ) ( ON ?auto_914589 ?auto_914588 ) ( ON ?auto_914590 ?auto_914589 ) ( ON ?auto_914591 ?auto_914590 ) ( not ( = ?auto_914579 ?auto_914580 ) ) ( not ( = ?auto_914579 ?auto_914581 ) ) ( not ( = ?auto_914579 ?auto_914582 ) ) ( not ( = ?auto_914579 ?auto_914583 ) ) ( not ( = ?auto_914579 ?auto_914584 ) ) ( not ( = ?auto_914579 ?auto_914585 ) ) ( not ( = ?auto_914579 ?auto_914586 ) ) ( not ( = ?auto_914579 ?auto_914587 ) ) ( not ( = ?auto_914579 ?auto_914588 ) ) ( not ( = ?auto_914579 ?auto_914589 ) ) ( not ( = ?auto_914579 ?auto_914590 ) ) ( not ( = ?auto_914579 ?auto_914591 ) ) ( not ( = ?auto_914579 ?auto_914592 ) ) ( not ( = ?auto_914579 ?auto_914593 ) ) ( not ( = ?auto_914579 ?auto_914594 ) ) ( not ( = ?auto_914579 ?auto_914595 ) ) ( not ( = ?auto_914579 ?auto_914596 ) ) ( not ( = ?auto_914579 ?auto_914597 ) ) ( not ( = ?auto_914580 ?auto_914581 ) ) ( not ( = ?auto_914580 ?auto_914582 ) ) ( not ( = ?auto_914580 ?auto_914583 ) ) ( not ( = ?auto_914580 ?auto_914584 ) ) ( not ( = ?auto_914580 ?auto_914585 ) ) ( not ( = ?auto_914580 ?auto_914586 ) ) ( not ( = ?auto_914580 ?auto_914587 ) ) ( not ( = ?auto_914580 ?auto_914588 ) ) ( not ( = ?auto_914580 ?auto_914589 ) ) ( not ( = ?auto_914580 ?auto_914590 ) ) ( not ( = ?auto_914580 ?auto_914591 ) ) ( not ( = ?auto_914580 ?auto_914592 ) ) ( not ( = ?auto_914580 ?auto_914593 ) ) ( not ( = ?auto_914580 ?auto_914594 ) ) ( not ( = ?auto_914580 ?auto_914595 ) ) ( not ( = ?auto_914580 ?auto_914596 ) ) ( not ( = ?auto_914580 ?auto_914597 ) ) ( not ( = ?auto_914581 ?auto_914582 ) ) ( not ( = ?auto_914581 ?auto_914583 ) ) ( not ( = ?auto_914581 ?auto_914584 ) ) ( not ( = ?auto_914581 ?auto_914585 ) ) ( not ( = ?auto_914581 ?auto_914586 ) ) ( not ( = ?auto_914581 ?auto_914587 ) ) ( not ( = ?auto_914581 ?auto_914588 ) ) ( not ( = ?auto_914581 ?auto_914589 ) ) ( not ( = ?auto_914581 ?auto_914590 ) ) ( not ( = ?auto_914581 ?auto_914591 ) ) ( not ( = ?auto_914581 ?auto_914592 ) ) ( not ( = ?auto_914581 ?auto_914593 ) ) ( not ( = ?auto_914581 ?auto_914594 ) ) ( not ( = ?auto_914581 ?auto_914595 ) ) ( not ( = ?auto_914581 ?auto_914596 ) ) ( not ( = ?auto_914581 ?auto_914597 ) ) ( not ( = ?auto_914582 ?auto_914583 ) ) ( not ( = ?auto_914582 ?auto_914584 ) ) ( not ( = ?auto_914582 ?auto_914585 ) ) ( not ( = ?auto_914582 ?auto_914586 ) ) ( not ( = ?auto_914582 ?auto_914587 ) ) ( not ( = ?auto_914582 ?auto_914588 ) ) ( not ( = ?auto_914582 ?auto_914589 ) ) ( not ( = ?auto_914582 ?auto_914590 ) ) ( not ( = ?auto_914582 ?auto_914591 ) ) ( not ( = ?auto_914582 ?auto_914592 ) ) ( not ( = ?auto_914582 ?auto_914593 ) ) ( not ( = ?auto_914582 ?auto_914594 ) ) ( not ( = ?auto_914582 ?auto_914595 ) ) ( not ( = ?auto_914582 ?auto_914596 ) ) ( not ( = ?auto_914582 ?auto_914597 ) ) ( not ( = ?auto_914583 ?auto_914584 ) ) ( not ( = ?auto_914583 ?auto_914585 ) ) ( not ( = ?auto_914583 ?auto_914586 ) ) ( not ( = ?auto_914583 ?auto_914587 ) ) ( not ( = ?auto_914583 ?auto_914588 ) ) ( not ( = ?auto_914583 ?auto_914589 ) ) ( not ( = ?auto_914583 ?auto_914590 ) ) ( not ( = ?auto_914583 ?auto_914591 ) ) ( not ( = ?auto_914583 ?auto_914592 ) ) ( not ( = ?auto_914583 ?auto_914593 ) ) ( not ( = ?auto_914583 ?auto_914594 ) ) ( not ( = ?auto_914583 ?auto_914595 ) ) ( not ( = ?auto_914583 ?auto_914596 ) ) ( not ( = ?auto_914583 ?auto_914597 ) ) ( not ( = ?auto_914584 ?auto_914585 ) ) ( not ( = ?auto_914584 ?auto_914586 ) ) ( not ( = ?auto_914584 ?auto_914587 ) ) ( not ( = ?auto_914584 ?auto_914588 ) ) ( not ( = ?auto_914584 ?auto_914589 ) ) ( not ( = ?auto_914584 ?auto_914590 ) ) ( not ( = ?auto_914584 ?auto_914591 ) ) ( not ( = ?auto_914584 ?auto_914592 ) ) ( not ( = ?auto_914584 ?auto_914593 ) ) ( not ( = ?auto_914584 ?auto_914594 ) ) ( not ( = ?auto_914584 ?auto_914595 ) ) ( not ( = ?auto_914584 ?auto_914596 ) ) ( not ( = ?auto_914584 ?auto_914597 ) ) ( not ( = ?auto_914585 ?auto_914586 ) ) ( not ( = ?auto_914585 ?auto_914587 ) ) ( not ( = ?auto_914585 ?auto_914588 ) ) ( not ( = ?auto_914585 ?auto_914589 ) ) ( not ( = ?auto_914585 ?auto_914590 ) ) ( not ( = ?auto_914585 ?auto_914591 ) ) ( not ( = ?auto_914585 ?auto_914592 ) ) ( not ( = ?auto_914585 ?auto_914593 ) ) ( not ( = ?auto_914585 ?auto_914594 ) ) ( not ( = ?auto_914585 ?auto_914595 ) ) ( not ( = ?auto_914585 ?auto_914596 ) ) ( not ( = ?auto_914585 ?auto_914597 ) ) ( not ( = ?auto_914586 ?auto_914587 ) ) ( not ( = ?auto_914586 ?auto_914588 ) ) ( not ( = ?auto_914586 ?auto_914589 ) ) ( not ( = ?auto_914586 ?auto_914590 ) ) ( not ( = ?auto_914586 ?auto_914591 ) ) ( not ( = ?auto_914586 ?auto_914592 ) ) ( not ( = ?auto_914586 ?auto_914593 ) ) ( not ( = ?auto_914586 ?auto_914594 ) ) ( not ( = ?auto_914586 ?auto_914595 ) ) ( not ( = ?auto_914586 ?auto_914596 ) ) ( not ( = ?auto_914586 ?auto_914597 ) ) ( not ( = ?auto_914587 ?auto_914588 ) ) ( not ( = ?auto_914587 ?auto_914589 ) ) ( not ( = ?auto_914587 ?auto_914590 ) ) ( not ( = ?auto_914587 ?auto_914591 ) ) ( not ( = ?auto_914587 ?auto_914592 ) ) ( not ( = ?auto_914587 ?auto_914593 ) ) ( not ( = ?auto_914587 ?auto_914594 ) ) ( not ( = ?auto_914587 ?auto_914595 ) ) ( not ( = ?auto_914587 ?auto_914596 ) ) ( not ( = ?auto_914587 ?auto_914597 ) ) ( not ( = ?auto_914588 ?auto_914589 ) ) ( not ( = ?auto_914588 ?auto_914590 ) ) ( not ( = ?auto_914588 ?auto_914591 ) ) ( not ( = ?auto_914588 ?auto_914592 ) ) ( not ( = ?auto_914588 ?auto_914593 ) ) ( not ( = ?auto_914588 ?auto_914594 ) ) ( not ( = ?auto_914588 ?auto_914595 ) ) ( not ( = ?auto_914588 ?auto_914596 ) ) ( not ( = ?auto_914588 ?auto_914597 ) ) ( not ( = ?auto_914589 ?auto_914590 ) ) ( not ( = ?auto_914589 ?auto_914591 ) ) ( not ( = ?auto_914589 ?auto_914592 ) ) ( not ( = ?auto_914589 ?auto_914593 ) ) ( not ( = ?auto_914589 ?auto_914594 ) ) ( not ( = ?auto_914589 ?auto_914595 ) ) ( not ( = ?auto_914589 ?auto_914596 ) ) ( not ( = ?auto_914589 ?auto_914597 ) ) ( not ( = ?auto_914590 ?auto_914591 ) ) ( not ( = ?auto_914590 ?auto_914592 ) ) ( not ( = ?auto_914590 ?auto_914593 ) ) ( not ( = ?auto_914590 ?auto_914594 ) ) ( not ( = ?auto_914590 ?auto_914595 ) ) ( not ( = ?auto_914590 ?auto_914596 ) ) ( not ( = ?auto_914590 ?auto_914597 ) ) ( not ( = ?auto_914591 ?auto_914592 ) ) ( not ( = ?auto_914591 ?auto_914593 ) ) ( not ( = ?auto_914591 ?auto_914594 ) ) ( not ( = ?auto_914591 ?auto_914595 ) ) ( not ( = ?auto_914591 ?auto_914596 ) ) ( not ( = ?auto_914591 ?auto_914597 ) ) ( not ( = ?auto_914592 ?auto_914593 ) ) ( not ( = ?auto_914592 ?auto_914594 ) ) ( not ( = ?auto_914592 ?auto_914595 ) ) ( not ( = ?auto_914592 ?auto_914596 ) ) ( not ( = ?auto_914592 ?auto_914597 ) ) ( not ( = ?auto_914593 ?auto_914594 ) ) ( not ( = ?auto_914593 ?auto_914595 ) ) ( not ( = ?auto_914593 ?auto_914596 ) ) ( not ( = ?auto_914593 ?auto_914597 ) ) ( not ( = ?auto_914594 ?auto_914595 ) ) ( not ( = ?auto_914594 ?auto_914596 ) ) ( not ( = ?auto_914594 ?auto_914597 ) ) ( not ( = ?auto_914595 ?auto_914596 ) ) ( not ( = ?auto_914595 ?auto_914597 ) ) ( not ( = ?auto_914596 ?auto_914597 ) ) ( ON ?auto_914595 ?auto_914596 ) ( ON ?auto_914594 ?auto_914595 ) ( ON ?auto_914593 ?auto_914594 ) ( CLEAR ?auto_914591 ) ( ON ?auto_914592 ?auto_914593 ) ( CLEAR ?auto_914592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_914579 ?auto_914580 ?auto_914581 ?auto_914582 ?auto_914583 ?auto_914584 ?auto_914585 ?auto_914586 ?auto_914587 ?auto_914588 ?auto_914589 ?auto_914590 ?auto_914591 ?auto_914592 )
      ( MAKE-18PILE ?auto_914579 ?auto_914580 ?auto_914581 ?auto_914582 ?auto_914583 ?auto_914584 ?auto_914585 ?auto_914586 ?auto_914587 ?auto_914588 ?auto_914589 ?auto_914590 ?auto_914591 ?auto_914592 ?auto_914593 ?auto_914594 ?auto_914595 ?auto_914596 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914616 - BLOCK
      ?auto_914617 - BLOCK
      ?auto_914618 - BLOCK
      ?auto_914619 - BLOCK
      ?auto_914620 - BLOCK
      ?auto_914621 - BLOCK
      ?auto_914622 - BLOCK
      ?auto_914623 - BLOCK
      ?auto_914624 - BLOCK
      ?auto_914625 - BLOCK
      ?auto_914626 - BLOCK
      ?auto_914627 - BLOCK
      ?auto_914628 - BLOCK
      ?auto_914629 - BLOCK
      ?auto_914630 - BLOCK
      ?auto_914631 - BLOCK
      ?auto_914632 - BLOCK
      ?auto_914633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914633 ) ( ON-TABLE ?auto_914616 ) ( ON ?auto_914617 ?auto_914616 ) ( ON ?auto_914618 ?auto_914617 ) ( ON ?auto_914619 ?auto_914618 ) ( ON ?auto_914620 ?auto_914619 ) ( ON ?auto_914621 ?auto_914620 ) ( ON ?auto_914622 ?auto_914621 ) ( ON ?auto_914623 ?auto_914622 ) ( ON ?auto_914624 ?auto_914623 ) ( ON ?auto_914625 ?auto_914624 ) ( ON ?auto_914626 ?auto_914625 ) ( ON ?auto_914627 ?auto_914626 ) ( ON ?auto_914628 ?auto_914627 ) ( not ( = ?auto_914616 ?auto_914617 ) ) ( not ( = ?auto_914616 ?auto_914618 ) ) ( not ( = ?auto_914616 ?auto_914619 ) ) ( not ( = ?auto_914616 ?auto_914620 ) ) ( not ( = ?auto_914616 ?auto_914621 ) ) ( not ( = ?auto_914616 ?auto_914622 ) ) ( not ( = ?auto_914616 ?auto_914623 ) ) ( not ( = ?auto_914616 ?auto_914624 ) ) ( not ( = ?auto_914616 ?auto_914625 ) ) ( not ( = ?auto_914616 ?auto_914626 ) ) ( not ( = ?auto_914616 ?auto_914627 ) ) ( not ( = ?auto_914616 ?auto_914628 ) ) ( not ( = ?auto_914616 ?auto_914629 ) ) ( not ( = ?auto_914616 ?auto_914630 ) ) ( not ( = ?auto_914616 ?auto_914631 ) ) ( not ( = ?auto_914616 ?auto_914632 ) ) ( not ( = ?auto_914616 ?auto_914633 ) ) ( not ( = ?auto_914617 ?auto_914618 ) ) ( not ( = ?auto_914617 ?auto_914619 ) ) ( not ( = ?auto_914617 ?auto_914620 ) ) ( not ( = ?auto_914617 ?auto_914621 ) ) ( not ( = ?auto_914617 ?auto_914622 ) ) ( not ( = ?auto_914617 ?auto_914623 ) ) ( not ( = ?auto_914617 ?auto_914624 ) ) ( not ( = ?auto_914617 ?auto_914625 ) ) ( not ( = ?auto_914617 ?auto_914626 ) ) ( not ( = ?auto_914617 ?auto_914627 ) ) ( not ( = ?auto_914617 ?auto_914628 ) ) ( not ( = ?auto_914617 ?auto_914629 ) ) ( not ( = ?auto_914617 ?auto_914630 ) ) ( not ( = ?auto_914617 ?auto_914631 ) ) ( not ( = ?auto_914617 ?auto_914632 ) ) ( not ( = ?auto_914617 ?auto_914633 ) ) ( not ( = ?auto_914618 ?auto_914619 ) ) ( not ( = ?auto_914618 ?auto_914620 ) ) ( not ( = ?auto_914618 ?auto_914621 ) ) ( not ( = ?auto_914618 ?auto_914622 ) ) ( not ( = ?auto_914618 ?auto_914623 ) ) ( not ( = ?auto_914618 ?auto_914624 ) ) ( not ( = ?auto_914618 ?auto_914625 ) ) ( not ( = ?auto_914618 ?auto_914626 ) ) ( not ( = ?auto_914618 ?auto_914627 ) ) ( not ( = ?auto_914618 ?auto_914628 ) ) ( not ( = ?auto_914618 ?auto_914629 ) ) ( not ( = ?auto_914618 ?auto_914630 ) ) ( not ( = ?auto_914618 ?auto_914631 ) ) ( not ( = ?auto_914618 ?auto_914632 ) ) ( not ( = ?auto_914618 ?auto_914633 ) ) ( not ( = ?auto_914619 ?auto_914620 ) ) ( not ( = ?auto_914619 ?auto_914621 ) ) ( not ( = ?auto_914619 ?auto_914622 ) ) ( not ( = ?auto_914619 ?auto_914623 ) ) ( not ( = ?auto_914619 ?auto_914624 ) ) ( not ( = ?auto_914619 ?auto_914625 ) ) ( not ( = ?auto_914619 ?auto_914626 ) ) ( not ( = ?auto_914619 ?auto_914627 ) ) ( not ( = ?auto_914619 ?auto_914628 ) ) ( not ( = ?auto_914619 ?auto_914629 ) ) ( not ( = ?auto_914619 ?auto_914630 ) ) ( not ( = ?auto_914619 ?auto_914631 ) ) ( not ( = ?auto_914619 ?auto_914632 ) ) ( not ( = ?auto_914619 ?auto_914633 ) ) ( not ( = ?auto_914620 ?auto_914621 ) ) ( not ( = ?auto_914620 ?auto_914622 ) ) ( not ( = ?auto_914620 ?auto_914623 ) ) ( not ( = ?auto_914620 ?auto_914624 ) ) ( not ( = ?auto_914620 ?auto_914625 ) ) ( not ( = ?auto_914620 ?auto_914626 ) ) ( not ( = ?auto_914620 ?auto_914627 ) ) ( not ( = ?auto_914620 ?auto_914628 ) ) ( not ( = ?auto_914620 ?auto_914629 ) ) ( not ( = ?auto_914620 ?auto_914630 ) ) ( not ( = ?auto_914620 ?auto_914631 ) ) ( not ( = ?auto_914620 ?auto_914632 ) ) ( not ( = ?auto_914620 ?auto_914633 ) ) ( not ( = ?auto_914621 ?auto_914622 ) ) ( not ( = ?auto_914621 ?auto_914623 ) ) ( not ( = ?auto_914621 ?auto_914624 ) ) ( not ( = ?auto_914621 ?auto_914625 ) ) ( not ( = ?auto_914621 ?auto_914626 ) ) ( not ( = ?auto_914621 ?auto_914627 ) ) ( not ( = ?auto_914621 ?auto_914628 ) ) ( not ( = ?auto_914621 ?auto_914629 ) ) ( not ( = ?auto_914621 ?auto_914630 ) ) ( not ( = ?auto_914621 ?auto_914631 ) ) ( not ( = ?auto_914621 ?auto_914632 ) ) ( not ( = ?auto_914621 ?auto_914633 ) ) ( not ( = ?auto_914622 ?auto_914623 ) ) ( not ( = ?auto_914622 ?auto_914624 ) ) ( not ( = ?auto_914622 ?auto_914625 ) ) ( not ( = ?auto_914622 ?auto_914626 ) ) ( not ( = ?auto_914622 ?auto_914627 ) ) ( not ( = ?auto_914622 ?auto_914628 ) ) ( not ( = ?auto_914622 ?auto_914629 ) ) ( not ( = ?auto_914622 ?auto_914630 ) ) ( not ( = ?auto_914622 ?auto_914631 ) ) ( not ( = ?auto_914622 ?auto_914632 ) ) ( not ( = ?auto_914622 ?auto_914633 ) ) ( not ( = ?auto_914623 ?auto_914624 ) ) ( not ( = ?auto_914623 ?auto_914625 ) ) ( not ( = ?auto_914623 ?auto_914626 ) ) ( not ( = ?auto_914623 ?auto_914627 ) ) ( not ( = ?auto_914623 ?auto_914628 ) ) ( not ( = ?auto_914623 ?auto_914629 ) ) ( not ( = ?auto_914623 ?auto_914630 ) ) ( not ( = ?auto_914623 ?auto_914631 ) ) ( not ( = ?auto_914623 ?auto_914632 ) ) ( not ( = ?auto_914623 ?auto_914633 ) ) ( not ( = ?auto_914624 ?auto_914625 ) ) ( not ( = ?auto_914624 ?auto_914626 ) ) ( not ( = ?auto_914624 ?auto_914627 ) ) ( not ( = ?auto_914624 ?auto_914628 ) ) ( not ( = ?auto_914624 ?auto_914629 ) ) ( not ( = ?auto_914624 ?auto_914630 ) ) ( not ( = ?auto_914624 ?auto_914631 ) ) ( not ( = ?auto_914624 ?auto_914632 ) ) ( not ( = ?auto_914624 ?auto_914633 ) ) ( not ( = ?auto_914625 ?auto_914626 ) ) ( not ( = ?auto_914625 ?auto_914627 ) ) ( not ( = ?auto_914625 ?auto_914628 ) ) ( not ( = ?auto_914625 ?auto_914629 ) ) ( not ( = ?auto_914625 ?auto_914630 ) ) ( not ( = ?auto_914625 ?auto_914631 ) ) ( not ( = ?auto_914625 ?auto_914632 ) ) ( not ( = ?auto_914625 ?auto_914633 ) ) ( not ( = ?auto_914626 ?auto_914627 ) ) ( not ( = ?auto_914626 ?auto_914628 ) ) ( not ( = ?auto_914626 ?auto_914629 ) ) ( not ( = ?auto_914626 ?auto_914630 ) ) ( not ( = ?auto_914626 ?auto_914631 ) ) ( not ( = ?auto_914626 ?auto_914632 ) ) ( not ( = ?auto_914626 ?auto_914633 ) ) ( not ( = ?auto_914627 ?auto_914628 ) ) ( not ( = ?auto_914627 ?auto_914629 ) ) ( not ( = ?auto_914627 ?auto_914630 ) ) ( not ( = ?auto_914627 ?auto_914631 ) ) ( not ( = ?auto_914627 ?auto_914632 ) ) ( not ( = ?auto_914627 ?auto_914633 ) ) ( not ( = ?auto_914628 ?auto_914629 ) ) ( not ( = ?auto_914628 ?auto_914630 ) ) ( not ( = ?auto_914628 ?auto_914631 ) ) ( not ( = ?auto_914628 ?auto_914632 ) ) ( not ( = ?auto_914628 ?auto_914633 ) ) ( not ( = ?auto_914629 ?auto_914630 ) ) ( not ( = ?auto_914629 ?auto_914631 ) ) ( not ( = ?auto_914629 ?auto_914632 ) ) ( not ( = ?auto_914629 ?auto_914633 ) ) ( not ( = ?auto_914630 ?auto_914631 ) ) ( not ( = ?auto_914630 ?auto_914632 ) ) ( not ( = ?auto_914630 ?auto_914633 ) ) ( not ( = ?auto_914631 ?auto_914632 ) ) ( not ( = ?auto_914631 ?auto_914633 ) ) ( not ( = ?auto_914632 ?auto_914633 ) ) ( ON ?auto_914632 ?auto_914633 ) ( ON ?auto_914631 ?auto_914632 ) ( ON ?auto_914630 ?auto_914631 ) ( CLEAR ?auto_914628 ) ( ON ?auto_914629 ?auto_914630 ) ( CLEAR ?auto_914629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_914616 ?auto_914617 ?auto_914618 ?auto_914619 ?auto_914620 ?auto_914621 ?auto_914622 ?auto_914623 ?auto_914624 ?auto_914625 ?auto_914626 ?auto_914627 ?auto_914628 ?auto_914629 )
      ( MAKE-18PILE ?auto_914616 ?auto_914617 ?auto_914618 ?auto_914619 ?auto_914620 ?auto_914621 ?auto_914622 ?auto_914623 ?auto_914624 ?auto_914625 ?auto_914626 ?auto_914627 ?auto_914628 ?auto_914629 ?auto_914630 ?auto_914631 ?auto_914632 ?auto_914633 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914652 - BLOCK
      ?auto_914653 - BLOCK
      ?auto_914654 - BLOCK
      ?auto_914655 - BLOCK
      ?auto_914656 - BLOCK
      ?auto_914657 - BLOCK
      ?auto_914658 - BLOCK
      ?auto_914659 - BLOCK
      ?auto_914660 - BLOCK
      ?auto_914661 - BLOCK
      ?auto_914662 - BLOCK
      ?auto_914663 - BLOCK
      ?auto_914664 - BLOCK
      ?auto_914665 - BLOCK
      ?auto_914666 - BLOCK
      ?auto_914667 - BLOCK
      ?auto_914668 - BLOCK
      ?auto_914669 - BLOCK
    )
    :vars
    (
      ?auto_914670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914669 ?auto_914670 ) ( ON-TABLE ?auto_914652 ) ( ON ?auto_914653 ?auto_914652 ) ( ON ?auto_914654 ?auto_914653 ) ( ON ?auto_914655 ?auto_914654 ) ( ON ?auto_914656 ?auto_914655 ) ( ON ?auto_914657 ?auto_914656 ) ( ON ?auto_914658 ?auto_914657 ) ( ON ?auto_914659 ?auto_914658 ) ( ON ?auto_914660 ?auto_914659 ) ( ON ?auto_914661 ?auto_914660 ) ( ON ?auto_914662 ?auto_914661 ) ( ON ?auto_914663 ?auto_914662 ) ( not ( = ?auto_914652 ?auto_914653 ) ) ( not ( = ?auto_914652 ?auto_914654 ) ) ( not ( = ?auto_914652 ?auto_914655 ) ) ( not ( = ?auto_914652 ?auto_914656 ) ) ( not ( = ?auto_914652 ?auto_914657 ) ) ( not ( = ?auto_914652 ?auto_914658 ) ) ( not ( = ?auto_914652 ?auto_914659 ) ) ( not ( = ?auto_914652 ?auto_914660 ) ) ( not ( = ?auto_914652 ?auto_914661 ) ) ( not ( = ?auto_914652 ?auto_914662 ) ) ( not ( = ?auto_914652 ?auto_914663 ) ) ( not ( = ?auto_914652 ?auto_914664 ) ) ( not ( = ?auto_914652 ?auto_914665 ) ) ( not ( = ?auto_914652 ?auto_914666 ) ) ( not ( = ?auto_914652 ?auto_914667 ) ) ( not ( = ?auto_914652 ?auto_914668 ) ) ( not ( = ?auto_914652 ?auto_914669 ) ) ( not ( = ?auto_914652 ?auto_914670 ) ) ( not ( = ?auto_914653 ?auto_914654 ) ) ( not ( = ?auto_914653 ?auto_914655 ) ) ( not ( = ?auto_914653 ?auto_914656 ) ) ( not ( = ?auto_914653 ?auto_914657 ) ) ( not ( = ?auto_914653 ?auto_914658 ) ) ( not ( = ?auto_914653 ?auto_914659 ) ) ( not ( = ?auto_914653 ?auto_914660 ) ) ( not ( = ?auto_914653 ?auto_914661 ) ) ( not ( = ?auto_914653 ?auto_914662 ) ) ( not ( = ?auto_914653 ?auto_914663 ) ) ( not ( = ?auto_914653 ?auto_914664 ) ) ( not ( = ?auto_914653 ?auto_914665 ) ) ( not ( = ?auto_914653 ?auto_914666 ) ) ( not ( = ?auto_914653 ?auto_914667 ) ) ( not ( = ?auto_914653 ?auto_914668 ) ) ( not ( = ?auto_914653 ?auto_914669 ) ) ( not ( = ?auto_914653 ?auto_914670 ) ) ( not ( = ?auto_914654 ?auto_914655 ) ) ( not ( = ?auto_914654 ?auto_914656 ) ) ( not ( = ?auto_914654 ?auto_914657 ) ) ( not ( = ?auto_914654 ?auto_914658 ) ) ( not ( = ?auto_914654 ?auto_914659 ) ) ( not ( = ?auto_914654 ?auto_914660 ) ) ( not ( = ?auto_914654 ?auto_914661 ) ) ( not ( = ?auto_914654 ?auto_914662 ) ) ( not ( = ?auto_914654 ?auto_914663 ) ) ( not ( = ?auto_914654 ?auto_914664 ) ) ( not ( = ?auto_914654 ?auto_914665 ) ) ( not ( = ?auto_914654 ?auto_914666 ) ) ( not ( = ?auto_914654 ?auto_914667 ) ) ( not ( = ?auto_914654 ?auto_914668 ) ) ( not ( = ?auto_914654 ?auto_914669 ) ) ( not ( = ?auto_914654 ?auto_914670 ) ) ( not ( = ?auto_914655 ?auto_914656 ) ) ( not ( = ?auto_914655 ?auto_914657 ) ) ( not ( = ?auto_914655 ?auto_914658 ) ) ( not ( = ?auto_914655 ?auto_914659 ) ) ( not ( = ?auto_914655 ?auto_914660 ) ) ( not ( = ?auto_914655 ?auto_914661 ) ) ( not ( = ?auto_914655 ?auto_914662 ) ) ( not ( = ?auto_914655 ?auto_914663 ) ) ( not ( = ?auto_914655 ?auto_914664 ) ) ( not ( = ?auto_914655 ?auto_914665 ) ) ( not ( = ?auto_914655 ?auto_914666 ) ) ( not ( = ?auto_914655 ?auto_914667 ) ) ( not ( = ?auto_914655 ?auto_914668 ) ) ( not ( = ?auto_914655 ?auto_914669 ) ) ( not ( = ?auto_914655 ?auto_914670 ) ) ( not ( = ?auto_914656 ?auto_914657 ) ) ( not ( = ?auto_914656 ?auto_914658 ) ) ( not ( = ?auto_914656 ?auto_914659 ) ) ( not ( = ?auto_914656 ?auto_914660 ) ) ( not ( = ?auto_914656 ?auto_914661 ) ) ( not ( = ?auto_914656 ?auto_914662 ) ) ( not ( = ?auto_914656 ?auto_914663 ) ) ( not ( = ?auto_914656 ?auto_914664 ) ) ( not ( = ?auto_914656 ?auto_914665 ) ) ( not ( = ?auto_914656 ?auto_914666 ) ) ( not ( = ?auto_914656 ?auto_914667 ) ) ( not ( = ?auto_914656 ?auto_914668 ) ) ( not ( = ?auto_914656 ?auto_914669 ) ) ( not ( = ?auto_914656 ?auto_914670 ) ) ( not ( = ?auto_914657 ?auto_914658 ) ) ( not ( = ?auto_914657 ?auto_914659 ) ) ( not ( = ?auto_914657 ?auto_914660 ) ) ( not ( = ?auto_914657 ?auto_914661 ) ) ( not ( = ?auto_914657 ?auto_914662 ) ) ( not ( = ?auto_914657 ?auto_914663 ) ) ( not ( = ?auto_914657 ?auto_914664 ) ) ( not ( = ?auto_914657 ?auto_914665 ) ) ( not ( = ?auto_914657 ?auto_914666 ) ) ( not ( = ?auto_914657 ?auto_914667 ) ) ( not ( = ?auto_914657 ?auto_914668 ) ) ( not ( = ?auto_914657 ?auto_914669 ) ) ( not ( = ?auto_914657 ?auto_914670 ) ) ( not ( = ?auto_914658 ?auto_914659 ) ) ( not ( = ?auto_914658 ?auto_914660 ) ) ( not ( = ?auto_914658 ?auto_914661 ) ) ( not ( = ?auto_914658 ?auto_914662 ) ) ( not ( = ?auto_914658 ?auto_914663 ) ) ( not ( = ?auto_914658 ?auto_914664 ) ) ( not ( = ?auto_914658 ?auto_914665 ) ) ( not ( = ?auto_914658 ?auto_914666 ) ) ( not ( = ?auto_914658 ?auto_914667 ) ) ( not ( = ?auto_914658 ?auto_914668 ) ) ( not ( = ?auto_914658 ?auto_914669 ) ) ( not ( = ?auto_914658 ?auto_914670 ) ) ( not ( = ?auto_914659 ?auto_914660 ) ) ( not ( = ?auto_914659 ?auto_914661 ) ) ( not ( = ?auto_914659 ?auto_914662 ) ) ( not ( = ?auto_914659 ?auto_914663 ) ) ( not ( = ?auto_914659 ?auto_914664 ) ) ( not ( = ?auto_914659 ?auto_914665 ) ) ( not ( = ?auto_914659 ?auto_914666 ) ) ( not ( = ?auto_914659 ?auto_914667 ) ) ( not ( = ?auto_914659 ?auto_914668 ) ) ( not ( = ?auto_914659 ?auto_914669 ) ) ( not ( = ?auto_914659 ?auto_914670 ) ) ( not ( = ?auto_914660 ?auto_914661 ) ) ( not ( = ?auto_914660 ?auto_914662 ) ) ( not ( = ?auto_914660 ?auto_914663 ) ) ( not ( = ?auto_914660 ?auto_914664 ) ) ( not ( = ?auto_914660 ?auto_914665 ) ) ( not ( = ?auto_914660 ?auto_914666 ) ) ( not ( = ?auto_914660 ?auto_914667 ) ) ( not ( = ?auto_914660 ?auto_914668 ) ) ( not ( = ?auto_914660 ?auto_914669 ) ) ( not ( = ?auto_914660 ?auto_914670 ) ) ( not ( = ?auto_914661 ?auto_914662 ) ) ( not ( = ?auto_914661 ?auto_914663 ) ) ( not ( = ?auto_914661 ?auto_914664 ) ) ( not ( = ?auto_914661 ?auto_914665 ) ) ( not ( = ?auto_914661 ?auto_914666 ) ) ( not ( = ?auto_914661 ?auto_914667 ) ) ( not ( = ?auto_914661 ?auto_914668 ) ) ( not ( = ?auto_914661 ?auto_914669 ) ) ( not ( = ?auto_914661 ?auto_914670 ) ) ( not ( = ?auto_914662 ?auto_914663 ) ) ( not ( = ?auto_914662 ?auto_914664 ) ) ( not ( = ?auto_914662 ?auto_914665 ) ) ( not ( = ?auto_914662 ?auto_914666 ) ) ( not ( = ?auto_914662 ?auto_914667 ) ) ( not ( = ?auto_914662 ?auto_914668 ) ) ( not ( = ?auto_914662 ?auto_914669 ) ) ( not ( = ?auto_914662 ?auto_914670 ) ) ( not ( = ?auto_914663 ?auto_914664 ) ) ( not ( = ?auto_914663 ?auto_914665 ) ) ( not ( = ?auto_914663 ?auto_914666 ) ) ( not ( = ?auto_914663 ?auto_914667 ) ) ( not ( = ?auto_914663 ?auto_914668 ) ) ( not ( = ?auto_914663 ?auto_914669 ) ) ( not ( = ?auto_914663 ?auto_914670 ) ) ( not ( = ?auto_914664 ?auto_914665 ) ) ( not ( = ?auto_914664 ?auto_914666 ) ) ( not ( = ?auto_914664 ?auto_914667 ) ) ( not ( = ?auto_914664 ?auto_914668 ) ) ( not ( = ?auto_914664 ?auto_914669 ) ) ( not ( = ?auto_914664 ?auto_914670 ) ) ( not ( = ?auto_914665 ?auto_914666 ) ) ( not ( = ?auto_914665 ?auto_914667 ) ) ( not ( = ?auto_914665 ?auto_914668 ) ) ( not ( = ?auto_914665 ?auto_914669 ) ) ( not ( = ?auto_914665 ?auto_914670 ) ) ( not ( = ?auto_914666 ?auto_914667 ) ) ( not ( = ?auto_914666 ?auto_914668 ) ) ( not ( = ?auto_914666 ?auto_914669 ) ) ( not ( = ?auto_914666 ?auto_914670 ) ) ( not ( = ?auto_914667 ?auto_914668 ) ) ( not ( = ?auto_914667 ?auto_914669 ) ) ( not ( = ?auto_914667 ?auto_914670 ) ) ( not ( = ?auto_914668 ?auto_914669 ) ) ( not ( = ?auto_914668 ?auto_914670 ) ) ( not ( = ?auto_914669 ?auto_914670 ) ) ( ON ?auto_914668 ?auto_914669 ) ( ON ?auto_914667 ?auto_914668 ) ( ON ?auto_914666 ?auto_914667 ) ( ON ?auto_914665 ?auto_914666 ) ( CLEAR ?auto_914663 ) ( ON ?auto_914664 ?auto_914665 ) ( CLEAR ?auto_914664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_914652 ?auto_914653 ?auto_914654 ?auto_914655 ?auto_914656 ?auto_914657 ?auto_914658 ?auto_914659 ?auto_914660 ?auto_914661 ?auto_914662 ?auto_914663 ?auto_914664 )
      ( MAKE-18PILE ?auto_914652 ?auto_914653 ?auto_914654 ?auto_914655 ?auto_914656 ?auto_914657 ?auto_914658 ?auto_914659 ?auto_914660 ?auto_914661 ?auto_914662 ?auto_914663 ?auto_914664 ?auto_914665 ?auto_914666 ?auto_914667 ?auto_914668 ?auto_914669 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914689 - BLOCK
      ?auto_914690 - BLOCK
      ?auto_914691 - BLOCK
      ?auto_914692 - BLOCK
      ?auto_914693 - BLOCK
      ?auto_914694 - BLOCK
      ?auto_914695 - BLOCK
      ?auto_914696 - BLOCK
      ?auto_914697 - BLOCK
      ?auto_914698 - BLOCK
      ?auto_914699 - BLOCK
      ?auto_914700 - BLOCK
      ?auto_914701 - BLOCK
      ?auto_914702 - BLOCK
      ?auto_914703 - BLOCK
      ?auto_914704 - BLOCK
      ?auto_914705 - BLOCK
      ?auto_914706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914706 ) ( ON-TABLE ?auto_914689 ) ( ON ?auto_914690 ?auto_914689 ) ( ON ?auto_914691 ?auto_914690 ) ( ON ?auto_914692 ?auto_914691 ) ( ON ?auto_914693 ?auto_914692 ) ( ON ?auto_914694 ?auto_914693 ) ( ON ?auto_914695 ?auto_914694 ) ( ON ?auto_914696 ?auto_914695 ) ( ON ?auto_914697 ?auto_914696 ) ( ON ?auto_914698 ?auto_914697 ) ( ON ?auto_914699 ?auto_914698 ) ( ON ?auto_914700 ?auto_914699 ) ( not ( = ?auto_914689 ?auto_914690 ) ) ( not ( = ?auto_914689 ?auto_914691 ) ) ( not ( = ?auto_914689 ?auto_914692 ) ) ( not ( = ?auto_914689 ?auto_914693 ) ) ( not ( = ?auto_914689 ?auto_914694 ) ) ( not ( = ?auto_914689 ?auto_914695 ) ) ( not ( = ?auto_914689 ?auto_914696 ) ) ( not ( = ?auto_914689 ?auto_914697 ) ) ( not ( = ?auto_914689 ?auto_914698 ) ) ( not ( = ?auto_914689 ?auto_914699 ) ) ( not ( = ?auto_914689 ?auto_914700 ) ) ( not ( = ?auto_914689 ?auto_914701 ) ) ( not ( = ?auto_914689 ?auto_914702 ) ) ( not ( = ?auto_914689 ?auto_914703 ) ) ( not ( = ?auto_914689 ?auto_914704 ) ) ( not ( = ?auto_914689 ?auto_914705 ) ) ( not ( = ?auto_914689 ?auto_914706 ) ) ( not ( = ?auto_914690 ?auto_914691 ) ) ( not ( = ?auto_914690 ?auto_914692 ) ) ( not ( = ?auto_914690 ?auto_914693 ) ) ( not ( = ?auto_914690 ?auto_914694 ) ) ( not ( = ?auto_914690 ?auto_914695 ) ) ( not ( = ?auto_914690 ?auto_914696 ) ) ( not ( = ?auto_914690 ?auto_914697 ) ) ( not ( = ?auto_914690 ?auto_914698 ) ) ( not ( = ?auto_914690 ?auto_914699 ) ) ( not ( = ?auto_914690 ?auto_914700 ) ) ( not ( = ?auto_914690 ?auto_914701 ) ) ( not ( = ?auto_914690 ?auto_914702 ) ) ( not ( = ?auto_914690 ?auto_914703 ) ) ( not ( = ?auto_914690 ?auto_914704 ) ) ( not ( = ?auto_914690 ?auto_914705 ) ) ( not ( = ?auto_914690 ?auto_914706 ) ) ( not ( = ?auto_914691 ?auto_914692 ) ) ( not ( = ?auto_914691 ?auto_914693 ) ) ( not ( = ?auto_914691 ?auto_914694 ) ) ( not ( = ?auto_914691 ?auto_914695 ) ) ( not ( = ?auto_914691 ?auto_914696 ) ) ( not ( = ?auto_914691 ?auto_914697 ) ) ( not ( = ?auto_914691 ?auto_914698 ) ) ( not ( = ?auto_914691 ?auto_914699 ) ) ( not ( = ?auto_914691 ?auto_914700 ) ) ( not ( = ?auto_914691 ?auto_914701 ) ) ( not ( = ?auto_914691 ?auto_914702 ) ) ( not ( = ?auto_914691 ?auto_914703 ) ) ( not ( = ?auto_914691 ?auto_914704 ) ) ( not ( = ?auto_914691 ?auto_914705 ) ) ( not ( = ?auto_914691 ?auto_914706 ) ) ( not ( = ?auto_914692 ?auto_914693 ) ) ( not ( = ?auto_914692 ?auto_914694 ) ) ( not ( = ?auto_914692 ?auto_914695 ) ) ( not ( = ?auto_914692 ?auto_914696 ) ) ( not ( = ?auto_914692 ?auto_914697 ) ) ( not ( = ?auto_914692 ?auto_914698 ) ) ( not ( = ?auto_914692 ?auto_914699 ) ) ( not ( = ?auto_914692 ?auto_914700 ) ) ( not ( = ?auto_914692 ?auto_914701 ) ) ( not ( = ?auto_914692 ?auto_914702 ) ) ( not ( = ?auto_914692 ?auto_914703 ) ) ( not ( = ?auto_914692 ?auto_914704 ) ) ( not ( = ?auto_914692 ?auto_914705 ) ) ( not ( = ?auto_914692 ?auto_914706 ) ) ( not ( = ?auto_914693 ?auto_914694 ) ) ( not ( = ?auto_914693 ?auto_914695 ) ) ( not ( = ?auto_914693 ?auto_914696 ) ) ( not ( = ?auto_914693 ?auto_914697 ) ) ( not ( = ?auto_914693 ?auto_914698 ) ) ( not ( = ?auto_914693 ?auto_914699 ) ) ( not ( = ?auto_914693 ?auto_914700 ) ) ( not ( = ?auto_914693 ?auto_914701 ) ) ( not ( = ?auto_914693 ?auto_914702 ) ) ( not ( = ?auto_914693 ?auto_914703 ) ) ( not ( = ?auto_914693 ?auto_914704 ) ) ( not ( = ?auto_914693 ?auto_914705 ) ) ( not ( = ?auto_914693 ?auto_914706 ) ) ( not ( = ?auto_914694 ?auto_914695 ) ) ( not ( = ?auto_914694 ?auto_914696 ) ) ( not ( = ?auto_914694 ?auto_914697 ) ) ( not ( = ?auto_914694 ?auto_914698 ) ) ( not ( = ?auto_914694 ?auto_914699 ) ) ( not ( = ?auto_914694 ?auto_914700 ) ) ( not ( = ?auto_914694 ?auto_914701 ) ) ( not ( = ?auto_914694 ?auto_914702 ) ) ( not ( = ?auto_914694 ?auto_914703 ) ) ( not ( = ?auto_914694 ?auto_914704 ) ) ( not ( = ?auto_914694 ?auto_914705 ) ) ( not ( = ?auto_914694 ?auto_914706 ) ) ( not ( = ?auto_914695 ?auto_914696 ) ) ( not ( = ?auto_914695 ?auto_914697 ) ) ( not ( = ?auto_914695 ?auto_914698 ) ) ( not ( = ?auto_914695 ?auto_914699 ) ) ( not ( = ?auto_914695 ?auto_914700 ) ) ( not ( = ?auto_914695 ?auto_914701 ) ) ( not ( = ?auto_914695 ?auto_914702 ) ) ( not ( = ?auto_914695 ?auto_914703 ) ) ( not ( = ?auto_914695 ?auto_914704 ) ) ( not ( = ?auto_914695 ?auto_914705 ) ) ( not ( = ?auto_914695 ?auto_914706 ) ) ( not ( = ?auto_914696 ?auto_914697 ) ) ( not ( = ?auto_914696 ?auto_914698 ) ) ( not ( = ?auto_914696 ?auto_914699 ) ) ( not ( = ?auto_914696 ?auto_914700 ) ) ( not ( = ?auto_914696 ?auto_914701 ) ) ( not ( = ?auto_914696 ?auto_914702 ) ) ( not ( = ?auto_914696 ?auto_914703 ) ) ( not ( = ?auto_914696 ?auto_914704 ) ) ( not ( = ?auto_914696 ?auto_914705 ) ) ( not ( = ?auto_914696 ?auto_914706 ) ) ( not ( = ?auto_914697 ?auto_914698 ) ) ( not ( = ?auto_914697 ?auto_914699 ) ) ( not ( = ?auto_914697 ?auto_914700 ) ) ( not ( = ?auto_914697 ?auto_914701 ) ) ( not ( = ?auto_914697 ?auto_914702 ) ) ( not ( = ?auto_914697 ?auto_914703 ) ) ( not ( = ?auto_914697 ?auto_914704 ) ) ( not ( = ?auto_914697 ?auto_914705 ) ) ( not ( = ?auto_914697 ?auto_914706 ) ) ( not ( = ?auto_914698 ?auto_914699 ) ) ( not ( = ?auto_914698 ?auto_914700 ) ) ( not ( = ?auto_914698 ?auto_914701 ) ) ( not ( = ?auto_914698 ?auto_914702 ) ) ( not ( = ?auto_914698 ?auto_914703 ) ) ( not ( = ?auto_914698 ?auto_914704 ) ) ( not ( = ?auto_914698 ?auto_914705 ) ) ( not ( = ?auto_914698 ?auto_914706 ) ) ( not ( = ?auto_914699 ?auto_914700 ) ) ( not ( = ?auto_914699 ?auto_914701 ) ) ( not ( = ?auto_914699 ?auto_914702 ) ) ( not ( = ?auto_914699 ?auto_914703 ) ) ( not ( = ?auto_914699 ?auto_914704 ) ) ( not ( = ?auto_914699 ?auto_914705 ) ) ( not ( = ?auto_914699 ?auto_914706 ) ) ( not ( = ?auto_914700 ?auto_914701 ) ) ( not ( = ?auto_914700 ?auto_914702 ) ) ( not ( = ?auto_914700 ?auto_914703 ) ) ( not ( = ?auto_914700 ?auto_914704 ) ) ( not ( = ?auto_914700 ?auto_914705 ) ) ( not ( = ?auto_914700 ?auto_914706 ) ) ( not ( = ?auto_914701 ?auto_914702 ) ) ( not ( = ?auto_914701 ?auto_914703 ) ) ( not ( = ?auto_914701 ?auto_914704 ) ) ( not ( = ?auto_914701 ?auto_914705 ) ) ( not ( = ?auto_914701 ?auto_914706 ) ) ( not ( = ?auto_914702 ?auto_914703 ) ) ( not ( = ?auto_914702 ?auto_914704 ) ) ( not ( = ?auto_914702 ?auto_914705 ) ) ( not ( = ?auto_914702 ?auto_914706 ) ) ( not ( = ?auto_914703 ?auto_914704 ) ) ( not ( = ?auto_914703 ?auto_914705 ) ) ( not ( = ?auto_914703 ?auto_914706 ) ) ( not ( = ?auto_914704 ?auto_914705 ) ) ( not ( = ?auto_914704 ?auto_914706 ) ) ( not ( = ?auto_914705 ?auto_914706 ) ) ( ON ?auto_914705 ?auto_914706 ) ( ON ?auto_914704 ?auto_914705 ) ( ON ?auto_914703 ?auto_914704 ) ( ON ?auto_914702 ?auto_914703 ) ( CLEAR ?auto_914700 ) ( ON ?auto_914701 ?auto_914702 ) ( CLEAR ?auto_914701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_914689 ?auto_914690 ?auto_914691 ?auto_914692 ?auto_914693 ?auto_914694 ?auto_914695 ?auto_914696 ?auto_914697 ?auto_914698 ?auto_914699 ?auto_914700 ?auto_914701 )
      ( MAKE-18PILE ?auto_914689 ?auto_914690 ?auto_914691 ?auto_914692 ?auto_914693 ?auto_914694 ?auto_914695 ?auto_914696 ?auto_914697 ?auto_914698 ?auto_914699 ?auto_914700 ?auto_914701 ?auto_914702 ?auto_914703 ?auto_914704 ?auto_914705 ?auto_914706 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914725 - BLOCK
      ?auto_914726 - BLOCK
      ?auto_914727 - BLOCK
      ?auto_914728 - BLOCK
      ?auto_914729 - BLOCK
      ?auto_914730 - BLOCK
      ?auto_914731 - BLOCK
      ?auto_914732 - BLOCK
      ?auto_914733 - BLOCK
      ?auto_914734 - BLOCK
      ?auto_914735 - BLOCK
      ?auto_914736 - BLOCK
      ?auto_914737 - BLOCK
      ?auto_914738 - BLOCK
      ?auto_914739 - BLOCK
      ?auto_914740 - BLOCK
      ?auto_914741 - BLOCK
      ?auto_914742 - BLOCK
    )
    :vars
    (
      ?auto_914743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914742 ?auto_914743 ) ( ON-TABLE ?auto_914725 ) ( ON ?auto_914726 ?auto_914725 ) ( ON ?auto_914727 ?auto_914726 ) ( ON ?auto_914728 ?auto_914727 ) ( ON ?auto_914729 ?auto_914728 ) ( ON ?auto_914730 ?auto_914729 ) ( ON ?auto_914731 ?auto_914730 ) ( ON ?auto_914732 ?auto_914731 ) ( ON ?auto_914733 ?auto_914732 ) ( ON ?auto_914734 ?auto_914733 ) ( ON ?auto_914735 ?auto_914734 ) ( not ( = ?auto_914725 ?auto_914726 ) ) ( not ( = ?auto_914725 ?auto_914727 ) ) ( not ( = ?auto_914725 ?auto_914728 ) ) ( not ( = ?auto_914725 ?auto_914729 ) ) ( not ( = ?auto_914725 ?auto_914730 ) ) ( not ( = ?auto_914725 ?auto_914731 ) ) ( not ( = ?auto_914725 ?auto_914732 ) ) ( not ( = ?auto_914725 ?auto_914733 ) ) ( not ( = ?auto_914725 ?auto_914734 ) ) ( not ( = ?auto_914725 ?auto_914735 ) ) ( not ( = ?auto_914725 ?auto_914736 ) ) ( not ( = ?auto_914725 ?auto_914737 ) ) ( not ( = ?auto_914725 ?auto_914738 ) ) ( not ( = ?auto_914725 ?auto_914739 ) ) ( not ( = ?auto_914725 ?auto_914740 ) ) ( not ( = ?auto_914725 ?auto_914741 ) ) ( not ( = ?auto_914725 ?auto_914742 ) ) ( not ( = ?auto_914725 ?auto_914743 ) ) ( not ( = ?auto_914726 ?auto_914727 ) ) ( not ( = ?auto_914726 ?auto_914728 ) ) ( not ( = ?auto_914726 ?auto_914729 ) ) ( not ( = ?auto_914726 ?auto_914730 ) ) ( not ( = ?auto_914726 ?auto_914731 ) ) ( not ( = ?auto_914726 ?auto_914732 ) ) ( not ( = ?auto_914726 ?auto_914733 ) ) ( not ( = ?auto_914726 ?auto_914734 ) ) ( not ( = ?auto_914726 ?auto_914735 ) ) ( not ( = ?auto_914726 ?auto_914736 ) ) ( not ( = ?auto_914726 ?auto_914737 ) ) ( not ( = ?auto_914726 ?auto_914738 ) ) ( not ( = ?auto_914726 ?auto_914739 ) ) ( not ( = ?auto_914726 ?auto_914740 ) ) ( not ( = ?auto_914726 ?auto_914741 ) ) ( not ( = ?auto_914726 ?auto_914742 ) ) ( not ( = ?auto_914726 ?auto_914743 ) ) ( not ( = ?auto_914727 ?auto_914728 ) ) ( not ( = ?auto_914727 ?auto_914729 ) ) ( not ( = ?auto_914727 ?auto_914730 ) ) ( not ( = ?auto_914727 ?auto_914731 ) ) ( not ( = ?auto_914727 ?auto_914732 ) ) ( not ( = ?auto_914727 ?auto_914733 ) ) ( not ( = ?auto_914727 ?auto_914734 ) ) ( not ( = ?auto_914727 ?auto_914735 ) ) ( not ( = ?auto_914727 ?auto_914736 ) ) ( not ( = ?auto_914727 ?auto_914737 ) ) ( not ( = ?auto_914727 ?auto_914738 ) ) ( not ( = ?auto_914727 ?auto_914739 ) ) ( not ( = ?auto_914727 ?auto_914740 ) ) ( not ( = ?auto_914727 ?auto_914741 ) ) ( not ( = ?auto_914727 ?auto_914742 ) ) ( not ( = ?auto_914727 ?auto_914743 ) ) ( not ( = ?auto_914728 ?auto_914729 ) ) ( not ( = ?auto_914728 ?auto_914730 ) ) ( not ( = ?auto_914728 ?auto_914731 ) ) ( not ( = ?auto_914728 ?auto_914732 ) ) ( not ( = ?auto_914728 ?auto_914733 ) ) ( not ( = ?auto_914728 ?auto_914734 ) ) ( not ( = ?auto_914728 ?auto_914735 ) ) ( not ( = ?auto_914728 ?auto_914736 ) ) ( not ( = ?auto_914728 ?auto_914737 ) ) ( not ( = ?auto_914728 ?auto_914738 ) ) ( not ( = ?auto_914728 ?auto_914739 ) ) ( not ( = ?auto_914728 ?auto_914740 ) ) ( not ( = ?auto_914728 ?auto_914741 ) ) ( not ( = ?auto_914728 ?auto_914742 ) ) ( not ( = ?auto_914728 ?auto_914743 ) ) ( not ( = ?auto_914729 ?auto_914730 ) ) ( not ( = ?auto_914729 ?auto_914731 ) ) ( not ( = ?auto_914729 ?auto_914732 ) ) ( not ( = ?auto_914729 ?auto_914733 ) ) ( not ( = ?auto_914729 ?auto_914734 ) ) ( not ( = ?auto_914729 ?auto_914735 ) ) ( not ( = ?auto_914729 ?auto_914736 ) ) ( not ( = ?auto_914729 ?auto_914737 ) ) ( not ( = ?auto_914729 ?auto_914738 ) ) ( not ( = ?auto_914729 ?auto_914739 ) ) ( not ( = ?auto_914729 ?auto_914740 ) ) ( not ( = ?auto_914729 ?auto_914741 ) ) ( not ( = ?auto_914729 ?auto_914742 ) ) ( not ( = ?auto_914729 ?auto_914743 ) ) ( not ( = ?auto_914730 ?auto_914731 ) ) ( not ( = ?auto_914730 ?auto_914732 ) ) ( not ( = ?auto_914730 ?auto_914733 ) ) ( not ( = ?auto_914730 ?auto_914734 ) ) ( not ( = ?auto_914730 ?auto_914735 ) ) ( not ( = ?auto_914730 ?auto_914736 ) ) ( not ( = ?auto_914730 ?auto_914737 ) ) ( not ( = ?auto_914730 ?auto_914738 ) ) ( not ( = ?auto_914730 ?auto_914739 ) ) ( not ( = ?auto_914730 ?auto_914740 ) ) ( not ( = ?auto_914730 ?auto_914741 ) ) ( not ( = ?auto_914730 ?auto_914742 ) ) ( not ( = ?auto_914730 ?auto_914743 ) ) ( not ( = ?auto_914731 ?auto_914732 ) ) ( not ( = ?auto_914731 ?auto_914733 ) ) ( not ( = ?auto_914731 ?auto_914734 ) ) ( not ( = ?auto_914731 ?auto_914735 ) ) ( not ( = ?auto_914731 ?auto_914736 ) ) ( not ( = ?auto_914731 ?auto_914737 ) ) ( not ( = ?auto_914731 ?auto_914738 ) ) ( not ( = ?auto_914731 ?auto_914739 ) ) ( not ( = ?auto_914731 ?auto_914740 ) ) ( not ( = ?auto_914731 ?auto_914741 ) ) ( not ( = ?auto_914731 ?auto_914742 ) ) ( not ( = ?auto_914731 ?auto_914743 ) ) ( not ( = ?auto_914732 ?auto_914733 ) ) ( not ( = ?auto_914732 ?auto_914734 ) ) ( not ( = ?auto_914732 ?auto_914735 ) ) ( not ( = ?auto_914732 ?auto_914736 ) ) ( not ( = ?auto_914732 ?auto_914737 ) ) ( not ( = ?auto_914732 ?auto_914738 ) ) ( not ( = ?auto_914732 ?auto_914739 ) ) ( not ( = ?auto_914732 ?auto_914740 ) ) ( not ( = ?auto_914732 ?auto_914741 ) ) ( not ( = ?auto_914732 ?auto_914742 ) ) ( not ( = ?auto_914732 ?auto_914743 ) ) ( not ( = ?auto_914733 ?auto_914734 ) ) ( not ( = ?auto_914733 ?auto_914735 ) ) ( not ( = ?auto_914733 ?auto_914736 ) ) ( not ( = ?auto_914733 ?auto_914737 ) ) ( not ( = ?auto_914733 ?auto_914738 ) ) ( not ( = ?auto_914733 ?auto_914739 ) ) ( not ( = ?auto_914733 ?auto_914740 ) ) ( not ( = ?auto_914733 ?auto_914741 ) ) ( not ( = ?auto_914733 ?auto_914742 ) ) ( not ( = ?auto_914733 ?auto_914743 ) ) ( not ( = ?auto_914734 ?auto_914735 ) ) ( not ( = ?auto_914734 ?auto_914736 ) ) ( not ( = ?auto_914734 ?auto_914737 ) ) ( not ( = ?auto_914734 ?auto_914738 ) ) ( not ( = ?auto_914734 ?auto_914739 ) ) ( not ( = ?auto_914734 ?auto_914740 ) ) ( not ( = ?auto_914734 ?auto_914741 ) ) ( not ( = ?auto_914734 ?auto_914742 ) ) ( not ( = ?auto_914734 ?auto_914743 ) ) ( not ( = ?auto_914735 ?auto_914736 ) ) ( not ( = ?auto_914735 ?auto_914737 ) ) ( not ( = ?auto_914735 ?auto_914738 ) ) ( not ( = ?auto_914735 ?auto_914739 ) ) ( not ( = ?auto_914735 ?auto_914740 ) ) ( not ( = ?auto_914735 ?auto_914741 ) ) ( not ( = ?auto_914735 ?auto_914742 ) ) ( not ( = ?auto_914735 ?auto_914743 ) ) ( not ( = ?auto_914736 ?auto_914737 ) ) ( not ( = ?auto_914736 ?auto_914738 ) ) ( not ( = ?auto_914736 ?auto_914739 ) ) ( not ( = ?auto_914736 ?auto_914740 ) ) ( not ( = ?auto_914736 ?auto_914741 ) ) ( not ( = ?auto_914736 ?auto_914742 ) ) ( not ( = ?auto_914736 ?auto_914743 ) ) ( not ( = ?auto_914737 ?auto_914738 ) ) ( not ( = ?auto_914737 ?auto_914739 ) ) ( not ( = ?auto_914737 ?auto_914740 ) ) ( not ( = ?auto_914737 ?auto_914741 ) ) ( not ( = ?auto_914737 ?auto_914742 ) ) ( not ( = ?auto_914737 ?auto_914743 ) ) ( not ( = ?auto_914738 ?auto_914739 ) ) ( not ( = ?auto_914738 ?auto_914740 ) ) ( not ( = ?auto_914738 ?auto_914741 ) ) ( not ( = ?auto_914738 ?auto_914742 ) ) ( not ( = ?auto_914738 ?auto_914743 ) ) ( not ( = ?auto_914739 ?auto_914740 ) ) ( not ( = ?auto_914739 ?auto_914741 ) ) ( not ( = ?auto_914739 ?auto_914742 ) ) ( not ( = ?auto_914739 ?auto_914743 ) ) ( not ( = ?auto_914740 ?auto_914741 ) ) ( not ( = ?auto_914740 ?auto_914742 ) ) ( not ( = ?auto_914740 ?auto_914743 ) ) ( not ( = ?auto_914741 ?auto_914742 ) ) ( not ( = ?auto_914741 ?auto_914743 ) ) ( not ( = ?auto_914742 ?auto_914743 ) ) ( ON ?auto_914741 ?auto_914742 ) ( ON ?auto_914740 ?auto_914741 ) ( ON ?auto_914739 ?auto_914740 ) ( ON ?auto_914738 ?auto_914739 ) ( ON ?auto_914737 ?auto_914738 ) ( CLEAR ?auto_914735 ) ( ON ?auto_914736 ?auto_914737 ) ( CLEAR ?auto_914736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_914725 ?auto_914726 ?auto_914727 ?auto_914728 ?auto_914729 ?auto_914730 ?auto_914731 ?auto_914732 ?auto_914733 ?auto_914734 ?auto_914735 ?auto_914736 )
      ( MAKE-18PILE ?auto_914725 ?auto_914726 ?auto_914727 ?auto_914728 ?auto_914729 ?auto_914730 ?auto_914731 ?auto_914732 ?auto_914733 ?auto_914734 ?auto_914735 ?auto_914736 ?auto_914737 ?auto_914738 ?auto_914739 ?auto_914740 ?auto_914741 ?auto_914742 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914762 - BLOCK
      ?auto_914763 - BLOCK
      ?auto_914764 - BLOCK
      ?auto_914765 - BLOCK
      ?auto_914766 - BLOCK
      ?auto_914767 - BLOCK
      ?auto_914768 - BLOCK
      ?auto_914769 - BLOCK
      ?auto_914770 - BLOCK
      ?auto_914771 - BLOCK
      ?auto_914772 - BLOCK
      ?auto_914773 - BLOCK
      ?auto_914774 - BLOCK
      ?auto_914775 - BLOCK
      ?auto_914776 - BLOCK
      ?auto_914777 - BLOCK
      ?auto_914778 - BLOCK
      ?auto_914779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914779 ) ( ON-TABLE ?auto_914762 ) ( ON ?auto_914763 ?auto_914762 ) ( ON ?auto_914764 ?auto_914763 ) ( ON ?auto_914765 ?auto_914764 ) ( ON ?auto_914766 ?auto_914765 ) ( ON ?auto_914767 ?auto_914766 ) ( ON ?auto_914768 ?auto_914767 ) ( ON ?auto_914769 ?auto_914768 ) ( ON ?auto_914770 ?auto_914769 ) ( ON ?auto_914771 ?auto_914770 ) ( ON ?auto_914772 ?auto_914771 ) ( not ( = ?auto_914762 ?auto_914763 ) ) ( not ( = ?auto_914762 ?auto_914764 ) ) ( not ( = ?auto_914762 ?auto_914765 ) ) ( not ( = ?auto_914762 ?auto_914766 ) ) ( not ( = ?auto_914762 ?auto_914767 ) ) ( not ( = ?auto_914762 ?auto_914768 ) ) ( not ( = ?auto_914762 ?auto_914769 ) ) ( not ( = ?auto_914762 ?auto_914770 ) ) ( not ( = ?auto_914762 ?auto_914771 ) ) ( not ( = ?auto_914762 ?auto_914772 ) ) ( not ( = ?auto_914762 ?auto_914773 ) ) ( not ( = ?auto_914762 ?auto_914774 ) ) ( not ( = ?auto_914762 ?auto_914775 ) ) ( not ( = ?auto_914762 ?auto_914776 ) ) ( not ( = ?auto_914762 ?auto_914777 ) ) ( not ( = ?auto_914762 ?auto_914778 ) ) ( not ( = ?auto_914762 ?auto_914779 ) ) ( not ( = ?auto_914763 ?auto_914764 ) ) ( not ( = ?auto_914763 ?auto_914765 ) ) ( not ( = ?auto_914763 ?auto_914766 ) ) ( not ( = ?auto_914763 ?auto_914767 ) ) ( not ( = ?auto_914763 ?auto_914768 ) ) ( not ( = ?auto_914763 ?auto_914769 ) ) ( not ( = ?auto_914763 ?auto_914770 ) ) ( not ( = ?auto_914763 ?auto_914771 ) ) ( not ( = ?auto_914763 ?auto_914772 ) ) ( not ( = ?auto_914763 ?auto_914773 ) ) ( not ( = ?auto_914763 ?auto_914774 ) ) ( not ( = ?auto_914763 ?auto_914775 ) ) ( not ( = ?auto_914763 ?auto_914776 ) ) ( not ( = ?auto_914763 ?auto_914777 ) ) ( not ( = ?auto_914763 ?auto_914778 ) ) ( not ( = ?auto_914763 ?auto_914779 ) ) ( not ( = ?auto_914764 ?auto_914765 ) ) ( not ( = ?auto_914764 ?auto_914766 ) ) ( not ( = ?auto_914764 ?auto_914767 ) ) ( not ( = ?auto_914764 ?auto_914768 ) ) ( not ( = ?auto_914764 ?auto_914769 ) ) ( not ( = ?auto_914764 ?auto_914770 ) ) ( not ( = ?auto_914764 ?auto_914771 ) ) ( not ( = ?auto_914764 ?auto_914772 ) ) ( not ( = ?auto_914764 ?auto_914773 ) ) ( not ( = ?auto_914764 ?auto_914774 ) ) ( not ( = ?auto_914764 ?auto_914775 ) ) ( not ( = ?auto_914764 ?auto_914776 ) ) ( not ( = ?auto_914764 ?auto_914777 ) ) ( not ( = ?auto_914764 ?auto_914778 ) ) ( not ( = ?auto_914764 ?auto_914779 ) ) ( not ( = ?auto_914765 ?auto_914766 ) ) ( not ( = ?auto_914765 ?auto_914767 ) ) ( not ( = ?auto_914765 ?auto_914768 ) ) ( not ( = ?auto_914765 ?auto_914769 ) ) ( not ( = ?auto_914765 ?auto_914770 ) ) ( not ( = ?auto_914765 ?auto_914771 ) ) ( not ( = ?auto_914765 ?auto_914772 ) ) ( not ( = ?auto_914765 ?auto_914773 ) ) ( not ( = ?auto_914765 ?auto_914774 ) ) ( not ( = ?auto_914765 ?auto_914775 ) ) ( not ( = ?auto_914765 ?auto_914776 ) ) ( not ( = ?auto_914765 ?auto_914777 ) ) ( not ( = ?auto_914765 ?auto_914778 ) ) ( not ( = ?auto_914765 ?auto_914779 ) ) ( not ( = ?auto_914766 ?auto_914767 ) ) ( not ( = ?auto_914766 ?auto_914768 ) ) ( not ( = ?auto_914766 ?auto_914769 ) ) ( not ( = ?auto_914766 ?auto_914770 ) ) ( not ( = ?auto_914766 ?auto_914771 ) ) ( not ( = ?auto_914766 ?auto_914772 ) ) ( not ( = ?auto_914766 ?auto_914773 ) ) ( not ( = ?auto_914766 ?auto_914774 ) ) ( not ( = ?auto_914766 ?auto_914775 ) ) ( not ( = ?auto_914766 ?auto_914776 ) ) ( not ( = ?auto_914766 ?auto_914777 ) ) ( not ( = ?auto_914766 ?auto_914778 ) ) ( not ( = ?auto_914766 ?auto_914779 ) ) ( not ( = ?auto_914767 ?auto_914768 ) ) ( not ( = ?auto_914767 ?auto_914769 ) ) ( not ( = ?auto_914767 ?auto_914770 ) ) ( not ( = ?auto_914767 ?auto_914771 ) ) ( not ( = ?auto_914767 ?auto_914772 ) ) ( not ( = ?auto_914767 ?auto_914773 ) ) ( not ( = ?auto_914767 ?auto_914774 ) ) ( not ( = ?auto_914767 ?auto_914775 ) ) ( not ( = ?auto_914767 ?auto_914776 ) ) ( not ( = ?auto_914767 ?auto_914777 ) ) ( not ( = ?auto_914767 ?auto_914778 ) ) ( not ( = ?auto_914767 ?auto_914779 ) ) ( not ( = ?auto_914768 ?auto_914769 ) ) ( not ( = ?auto_914768 ?auto_914770 ) ) ( not ( = ?auto_914768 ?auto_914771 ) ) ( not ( = ?auto_914768 ?auto_914772 ) ) ( not ( = ?auto_914768 ?auto_914773 ) ) ( not ( = ?auto_914768 ?auto_914774 ) ) ( not ( = ?auto_914768 ?auto_914775 ) ) ( not ( = ?auto_914768 ?auto_914776 ) ) ( not ( = ?auto_914768 ?auto_914777 ) ) ( not ( = ?auto_914768 ?auto_914778 ) ) ( not ( = ?auto_914768 ?auto_914779 ) ) ( not ( = ?auto_914769 ?auto_914770 ) ) ( not ( = ?auto_914769 ?auto_914771 ) ) ( not ( = ?auto_914769 ?auto_914772 ) ) ( not ( = ?auto_914769 ?auto_914773 ) ) ( not ( = ?auto_914769 ?auto_914774 ) ) ( not ( = ?auto_914769 ?auto_914775 ) ) ( not ( = ?auto_914769 ?auto_914776 ) ) ( not ( = ?auto_914769 ?auto_914777 ) ) ( not ( = ?auto_914769 ?auto_914778 ) ) ( not ( = ?auto_914769 ?auto_914779 ) ) ( not ( = ?auto_914770 ?auto_914771 ) ) ( not ( = ?auto_914770 ?auto_914772 ) ) ( not ( = ?auto_914770 ?auto_914773 ) ) ( not ( = ?auto_914770 ?auto_914774 ) ) ( not ( = ?auto_914770 ?auto_914775 ) ) ( not ( = ?auto_914770 ?auto_914776 ) ) ( not ( = ?auto_914770 ?auto_914777 ) ) ( not ( = ?auto_914770 ?auto_914778 ) ) ( not ( = ?auto_914770 ?auto_914779 ) ) ( not ( = ?auto_914771 ?auto_914772 ) ) ( not ( = ?auto_914771 ?auto_914773 ) ) ( not ( = ?auto_914771 ?auto_914774 ) ) ( not ( = ?auto_914771 ?auto_914775 ) ) ( not ( = ?auto_914771 ?auto_914776 ) ) ( not ( = ?auto_914771 ?auto_914777 ) ) ( not ( = ?auto_914771 ?auto_914778 ) ) ( not ( = ?auto_914771 ?auto_914779 ) ) ( not ( = ?auto_914772 ?auto_914773 ) ) ( not ( = ?auto_914772 ?auto_914774 ) ) ( not ( = ?auto_914772 ?auto_914775 ) ) ( not ( = ?auto_914772 ?auto_914776 ) ) ( not ( = ?auto_914772 ?auto_914777 ) ) ( not ( = ?auto_914772 ?auto_914778 ) ) ( not ( = ?auto_914772 ?auto_914779 ) ) ( not ( = ?auto_914773 ?auto_914774 ) ) ( not ( = ?auto_914773 ?auto_914775 ) ) ( not ( = ?auto_914773 ?auto_914776 ) ) ( not ( = ?auto_914773 ?auto_914777 ) ) ( not ( = ?auto_914773 ?auto_914778 ) ) ( not ( = ?auto_914773 ?auto_914779 ) ) ( not ( = ?auto_914774 ?auto_914775 ) ) ( not ( = ?auto_914774 ?auto_914776 ) ) ( not ( = ?auto_914774 ?auto_914777 ) ) ( not ( = ?auto_914774 ?auto_914778 ) ) ( not ( = ?auto_914774 ?auto_914779 ) ) ( not ( = ?auto_914775 ?auto_914776 ) ) ( not ( = ?auto_914775 ?auto_914777 ) ) ( not ( = ?auto_914775 ?auto_914778 ) ) ( not ( = ?auto_914775 ?auto_914779 ) ) ( not ( = ?auto_914776 ?auto_914777 ) ) ( not ( = ?auto_914776 ?auto_914778 ) ) ( not ( = ?auto_914776 ?auto_914779 ) ) ( not ( = ?auto_914777 ?auto_914778 ) ) ( not ( = ?auto_914777 ?auto_914779 ) ) ( not ( = ?auto_914778 ?auto_914779 ) ) ( ON ?auto_914778 ?auto_914779 ) ( ON ?auto_914777 ?auto_914778 ) ( ON ?auto_914776 ?auto_914777 ) ( ON ?auto_914775 ?auto_914776 ) ( ON ?auto_914774 ?auto_914775 ) ( CLEAR ?auto_914772 ) ( ON ?auto_914773 ?auto_914774 ) ( CLEAR ?auto_914773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_914762 ?auto_914763 ?auto_914764 ?auto_914765 ?auto_914766 ?auto_914767 ?auto_914768 ?auto_914769 ?auto_914770 ?auto_914771 ?auto_914772 ?auto_914773 )
      ( MAKE-18PILE ?auto_914762 ?auto_914763 ?auto_914764 ?auto_914765 ?auto_914766 ?auto_914767 ?auto_914768 ?auto_914769 ?auto_914770 ?auto_914771 ?auto_914772 ?auto_914773 ?auto_914774 ?auto_914775 ?auto_914776 ?auto_914777 ?auto_914778 ?auto_914779 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914798 - BLOCK
      ?auto_914799 - BLOCK
      ?auto_914800 - BLOCK
      ?auto_914801 - BLOCK
      ?auto_914802 - BLOCK
      ?auto_914803 - BLOCK
      ?auto_914804 - BLOCK
      ?auto_914805 - BLOCK
      ?auto_914806 - BLOCK
      ?auto_914807 - BLOCK
      ?auto_914808 - BLOCK
      ?auto_914809 - BLOCK
      ?auto_914810 - BLOCK
      ?auto_914811 - BLOCK
      ?auto_914812 - BLOCK
      ?auto_914813 - BLOCK
      ?auto_914814 - BLOCK
      ?auto_914815 - BLOCK
    )
    :vars
    (
      ?auto_914816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914815 ?auto_914816 ) ( ON-TABLE ?auto_914798 ) ( ON ?auto_914799 ?auto_914798 ) ( ON ?auto_914800 ?auto_914799 ) ( ON ?auto_914801 ?auto_914800 ) ( ON ?auto_914802 ?auto_914801 ) ( ON ?auto_914803 ?auto_914802 ) ( ON ?auto_914804 ?auto_914803 ) ( ON ?auto_914805 ?auto_914804 ) ( ON ?auto_914806 ?auto_914805 ) ( ON ?auto_914807 ?auto_914806 ) ( not ( = ?auto_914798 ?auto_914799 ) ) ( not ( = ?auto_914798 ?auto_914800 ) ) ( not ( = ?auto_914798 ?auto_914801 ) ) ( not ( = ?auto_914798 ?auto_914802 ) ) ( not ( = ?auto_914798 ?auto_914803 ) ) ( not ( = ?auto_914798 ?auto_914804 ) ) ( not ( = ?auto_914798 ?auto_914805 ) ) ( not ( = ?auto_914798 ?auto_914806 ) ) ( not ( = ?auto_914798 ?auto_914807 ) ) ( not ( = ?auto_914798 ?auto_914808 ) ) ( not ( = ?auto_914798 ?auto_914809 ) ) ( not ( = ?auto_914798 ?auto_914810 ) ) ( not ( = ?auto_914798 ?auto_914811 ) ) ( not ( = ?auto_914798 ?auto_914812 ) ) ( not ( = ?auto_914798 ?auto_914813 ) ) ( not ( = ?auto_914798 ?auto_914814 ) ) ( not ( = ?auto_914798 ?auto_914815 ) ) ( not ( = ?auto_914798 ?auto_914816 ) ) ( not ( = ?auto_914799 ?auto_914800 ) ) ( not ( = ?auto_914799 ?auto_914801 ) ) ( not ( = ?auto_914799 ?auto_914802 ) ) ( not ( = ?auto_914799 ?auto_914803 ) ) ( not ( = ?auto_914799 ?auto_914804 ) ) ( not ( = ?auto_914799 ?auto_914805 ) ) ( not ( = ?auto_914799 ?auto_914806 ) ) ( not ( = ?auto_914799 ?auto_914807 ) ) ( not ( = ?auto_914799 ?auto_914808 ) ) ( not ( = ?auto_914799 ?auto_914809 ) ) ( not ( = ?auto_914799 ?auto_914810 ) ) ( not ( = ?auto_914799 ?auto_914811 ) ) ( not ( = ?auto_914799 ?auto_914812 ) ) ( not ( = ?auto_914799 ?auto_914813 ) ) ( not ( = ?auto_914799 ?auto_914814 ) ) ( not ( = ?auto_914799 ?auto_914815 ) ) ( not ( = ?auto_914799 ?auto_914816 ) ) ( not ( = ?auto_914800 ?auto_914801 ) ) ( not ( = ?auto_914800 ?auto_914802 ) ) ( not ( = ?auto_914800 ?auto_914803 ) ) ( not ( = ?auto_914800 ?auto_914804 ) ) ( not ( = ?auto_914800 ?auto_914805 ) ) ( not ( = ?auto_914800 ?auto_914806 ) ) ( not ( = ?auto_914800 ?auto_914807 ) ) ( not ( = ?auto_914800 ?auto_914808 ) ) ( not ( = ?auto_914800 ?auto_914809 ) ) ( not ( = ?auto_914800 ?auto_914810 ) ) ( not ( = ?auto_914800 ?auto_914811 ) ) ( not ( = ?auto_914800 ?auto_914812 ) ) ( not ( = ?auto_914800 ?auto_914813 ) ) ( not ( = ?auto_914800 ?auto_914814 ) ) ( not ( = ?auto_914800 ?auto_914815 ) ) ( not ( = ?auto_914800 ?auto_914816 ) ) ( not ( = ?auto_914801 ?auto_914802 ) ) ( not ( = ?auto_914801 ?auto_914803 ) ) ( not ( = ?auto_914801 ?auto_914804 ) ) ( not ( = ?auto_914801 ?auto_914805 ) ) ( not ( = ?auto_914801 ?auto_914806 ) ) ( not ( = ?auto_914801 ?auto_914807 ) ) ( not ( = ?auto_914801 ?auto_914808 ) ) ( not ( = ?auto_914801 ?auto_914809 ) ) ( not ( = ?auto_914801 ?auto_914810 ) ) ( not ( = ?auto_914801 ?auto_914811 ) ) ( not ( = ?auto_914801 ?auto_914812 ) ) ( not ( = ?auto_914801 ?auto_914813 ) ) ( not ( = ?auto_914801 ?auto_914814 ) ) ( not ( = ?auto_914801 ?auto_914815 ) ) ( not ( = ?auto_914801 ?auto_914816 ) ) ( not ( = ?auto_914802 ?auto_914803 ) ) ( not ( = ?auto_914802 ?auto_914804 ) ) ( not ( = ?auto_914802 ?auto_914805 ) ) ( not ( = ?auto_914802 ?auto_914806 ) ) ( not ( = ?auto_914802 ?auto_914807 ) ) ( not ( = ?auto_914802 ?auto_914808 ) ) ( not ( = ?auto_914802 ?auto_914809 ) ) ( not ( = ?auto_914802 ?auto_914810 ) ) ( not ( = ?auto_914802 ?auto_914811 ) ) ( not ( = ?auto_914802 ?auto_914812 ) ) ( not ( = ?auto_914802 ?auto_914813 ) ) ( not ( = ?auto_914802 ?auto_914814 ) ) ( not ( = ?auto_914802 ?auto_914815 ) ) ( not ( = ?auto_914802 ?auto_914816 ) ) ( not ( = ?auto_914803 ?auto_914804 ) ) ( not ( = ?auto_914803 ?auto_914805 ) ) ( not ( = ?auto_914803 ?auto_914806 ) ) ( not ( = ?auto_914803 ?auto_914807 ) ) ( not ( = ?auto_914803 ?auto_914808 ) ) ( not ( = ?auto_914803 ?auto_914809 ) ) ( not ( = ?auto_914803 ?auto_914810 ) ) ( not ( = ?auto_914803 ?auto_914811 ) ) ( not ( = ?auto_914803 ?auto_914812 ) ) ( not ( = ?auto_914803 ?auto_914813 ) ) ( not ( = ?auto_914803 ?auto_914814 ) ) ( not ( = ?auto_914803 ?auto_914815 ) ) ( not ( = ?auto_914803 ?auto_914816 ) ) ( not ( = ?auto_914804 ?auto_914805 ) ) ( not ( = ?auto_914804 ?auto_914806 ) ) ( not ( = ?auto_914804 ?auto_914807 ) ) ( not ( = ?auto_914804 ?auto_914808 ) ) ( not ( = ?auto_914804 ?auto_914809 ) ) ( not ( = ?auto_914804 ?auto_914810 ) ) ( not ( = ?auto_914804 ?auto_914811 ) ) ( not ( = ?auto_914804 ?auto_914812 ) ) ( not ( = ?auto_914804 ?auto_914813 ) ) ( not ( = ?auto_914804 ?auto_914814 ) ) ( not ( = ?auto_914804 ?auto_914815 ) ) ( not ( = ?auto_914804 ?auto_914816 ) ) ( not ( = ?auto_914805 ?auto_914806 ) ) ( not ( = ?auto_914805 ?auto_914807 ) ) ( not ( = ?auto_914805 ?auto_914808 ) ) ( not ( = ?auto_914805 ?auto_914809 ) ) ( not ( = ?auto_914805 ?auto_914810 ) ) ( not ( = ?auto_914805 ?auto_914811 ) ) ( not ( = ?auto_914805 ?auto_914812 ) ) ( not ( = ?auto_914805 ?auto_914813 ) ) ( not ( = ?auto_914805 ?auto_914814 ) ) ( not ( = ?auto_914805 ?auto_914815 ) ) ( not ( = ?auto_914805 ?auto_914816 ) ) ( not ( = ?auto_914806 ?auto_914807 ) ) ( not ( = ?auto_914806 ?auto_914808 ) ) ( not ( = ?auto_914806 ?auto_914809 ) ) ( not ( = ?auto_914806 ?auto_914810 ) ) ( not ( = ?auto_914806 ?auto_914811 ) ) ( not ( = ?auto_914806 ?auto_914812 ) ) ( not ( = ?auto_914806 ?auto_914813 ) ) ( not ( = ?auto_914806 ?auto_914814 ) ) ( not ( = ?auto_914806 ?auto_914815 ) ) ( not ( = ?auto_914806 ?auto_914816 ) ) ( not ( = ?auto_914807 ?auto_914808 ) ) ( not ( = ?auto_914807 ?auto_914809 ) ) ( not ( = ?auto_914807 ?auto_914810 ) ) ( not ( = ?auto_914807 ?auto_914811 ) ) ( not ( = ?auto_914807 ?auto_914812 ) ) ( not ( = ?auto_914807 ?auto_914813 ) ) ( not ( = ?auto_914807 ?auto_914814 ) ) ( not ( = ?auto_914807 ?auto_914815 ) ) ( not ( = ?auto_914807 ?auto_914816 ) ) ( not ( = ?auto_914808 ?auto_914809 ) ) ( not ( = ?auto_914808 ?auto_914810 ) ) ( not ( = ?auto_914808 ?auto_914811 ) ) ( not ( = ?auto_914808 ?auto_914812 ) ) ( not ( = ?auto_914808 ?auto_914813 ) ) ( not ( = ?auto_914808 ?auto_914814 ) ) ( not ( = ?auto_914808 ?auto_914815 ) ) ( not ( = ?auto_914808 ?auto_914816 ) ) ( not ( = ?auto_914809 ?auto_914810 ) ) ( not ( = ?auto_914809 ?auto_914811 ) ) ( not ( = ?auto_914809 ?auto_914812 ) ) ( not ( = ?auto_914809 ?auto_914813 ) ) ( not ( = ?auto_914809 ?auto_914814 ) ) ( not ( = ?auto_914809 ?auto_914815 ) ) ( not ( = ?auto_914809 ?auto_914816 ) ) ( not ( = ?auto_914810 ?auto_914811 ) ) ( not ( = ?auto_914810 ?auto_914812 ) ) ( not ( = ?auto_914810 ?auto_914813 ) ) ( not ( = ?auto_914810 ?auto_914814 ) ) ( not ( = ?auto_914810 ?auto_914815 ) ) ( not ( = ?auto_914810 ?auto_914816 ) ) ( not ( = ?auto_914811 ?auto_914812 ) ) ( not ( = ?auto_914811 ?auto_914813 ) ) ( not ( = ?auto_914811 ?auto_914814 ) ) ( not ( = ?auto_914811 ?auto_914815 ) ) ( not ( = ?auto_914811 ?auto_914816 ) ) ( not ( = ?auto_914812 ?auto_914813 ) ) ( not ( = ?auto_914812 ?auto_914814 ) ) ( not ( = ?auto_914812 ?auto_914815 ) ) ( not ( = ?auto_914812 ?auto_914816 ) ) ( not ( = ?auto_914813 ?auto_914814 ) ) ( not ( = ?auto_914813 ?auto_914815 ) ) ( not ( = ?auto_914813 ?auto_914816 ) ) ( not ( = ?auto_914814 ?auto_914815 ) ) ( not ( = ?auto_914814 ?auto_914816 ) ) ( not ( = ?auto_914815 ?auto_914816 ) ) ( ON ?auto_914814 ?auto_914815 ) ( ON ?auto_914813 ?auto_914814 ) ( ON ?auto_914812 ?auto_914813 ) ( ON ?auto_914811 ?auto_914812 ) ( ON ?auto_914810 ?auto_914811 ) ( ON ?auto_914809 ?auto_914810 ) ( CLEAR ?auto_914807 ) ( ON ?auto_914808 ?auto_914809 ) ( CLEAR ?auto_914808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_914798 ?auto_914799 ?auto_914800 ?auto_914801 ?auto_914802 ?auto_914803 ?auto_914804 ?auto_914805 ?auto_914806 ?auto_914807 ?auto_914808 )
      ( MAKE-18PILE ?auto_914798 ?auto_914799 ?auto_914800 ?auto_914801 ?auto_914802 ?auto_914803 ?auto_914804 ?auto_914805 ?auto_914806 ?auto_914807 ?auto_914808 ?auto_914809 ?auto_914810 ?auto_914811 ?auto_914812 ?auto_914813 ?auto_914814 ?auto_914815 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914835 - BLOCK
      ?auto_914836 - BLOCK
      ?auto_914837 - BLOCK
      ?auto_914838 - BLOCK
      ?auto_914839 - BLOCK
      ?auto_914840 - BLOCK
      ?auto_914841 - BLOCK
      ?auto_914842 - BLOCK
      ?auto_914843 - BLOCK
      ?auto_914844 - BLOCK
      ?auto_914845 - BLOCK
      ?auto_914846 - BLOCK
      ?auto_914847 - BLOCK
      ?auto_914848 - BLOCK
      ?auto_914849 - BLOCK
      ?auto_914850 - BLOCK
      ?auto_914851 - BLOCK
      ?auto_914852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914852 ) ( ON-TABLE ?auto_914835 ) ( ON ?auto_914836 ?auto_914835 ) ( ON ?auto_914837 ?auto_914836 ) ( ON ?auto_914838 ?auto_914837 ) ( ON ?auto_914839 ?auto_914838 ) ( ON ?auto_914840 ?auto_914839 ) ( ON ?auto_914841 ?auto_914840 ) ( ON ?auto_914842 ?auto_914841 ) ( ON ?auto_914843 ?auto_914842 ) ( ON ?auto_914844 ?auto_914843 ) ( not ( = ?auto_914835 ?auto_914836 ) ) ( not ( = ?auto_914835 ?auto_914837 ) ) ( not ( = ?auto_914835 ?auto_914838 ) ) ( not ( = ?auto_914835 ?auto_914839 ) ) ( not ( = ?auto_914835 ?auto_914840 ) ) ( not ( = ?auto_914835 ?auto_914841 ) ) ( not ( = ?auto_914835 ?auto_914842 ) ) ( not ( = ?auto_914835 ?auto_914843 ) ) ( not ( = ?auto_914835 ?auto_914844 ) ) ( not ( = ?auto_914835 ?auto_914845 ) ) ( not ( = ?auto_914835 ?auto_914846 ) ) ( not ( = ?auto_914835 ?auto_914847 ) ) ( not ( = ?auto_914835 ?auto_914848 ) ) ( not ( = ?auto_914835 ?auto_914849 ) ) ( not ( = ?auto_914835 ?auto_914850 ) ) ( not ( = ?auto_914835 ?auto_914851 ) ) ( not ( = ?auto_914835 ?auto_914852 ) ) ( not ( = ?auto_914836 ?auto_914837 ) ) ( not ( = ?auto_914836 ?auto_914838 ) ) ( not ( = ?auto_914836 ?auto_914839 ) ) ( not ( = ?auto_914836 ?auto_914840 ) ) ( not ( = ?auto_914836 ?auto_914841 ) ) ( not ( = ?auto_914836 ?auto_914842 ) ) ( not ( = ?auto_914836 ?auto_914843 ) ) ( not ( = ?auto_914836 ?auto_914844 ) ) ( not ( = ?auto_914836 ?auto_914845 ) ) ( not ( = ?auto_914836 ?auto_914846 ) ) ( not ( = ?auto_914836 ?auto_914847 ) ) ( not ( = ?auto_914836 ?auto_914848 ) ) ( not ( = ?auto_914836 ?auto_914849 ) ) ( not ( = ?auto_914836 ?auto_914850 ) ) ( not ( = ?auto_914836 ?auto_914851 ) ) ( not ( = ?auto_914836 ?auto_914852 ) ) ( not ( = ?auto_914837 ?auto_914838 ) ) ( not ( = ?auto_914837 ?auto_914839 ) ) ( not ( = ?auto_914837 ?auto_914840 ) ) ( not ( = ?auto_914837 ?auto_914841 ) ) ( not ( = ?auto_914837 ?auto_914842 ) ) ( not ( = ?auto_914837 ?auto_914843 ) ) ( not ( = ?auto_914837 ?auto_914844 ) ) ( not ( = ?auto_914837 ?auto_914845 ) ) ( not ( = ?auto_914837 ?auto_914846 ) ) ( not ( = ?auto_914837 ?auto_914847 ) ) ( not ( = ?auto_914837 ?auto_914848 ) ) ( not ( = ?auto_914837 ?auto_914849 ) ) ( not ( = ?auto_914837 ?auto_914850 ) ) ( not ( = ?auto_914837 ?auto_914851 ) ) ( not ( = ?auto_914837 ?auto_914852 ) ) ( not ( = ?auto_914838 ?auto_914839 ) ) ( not ( = ?auto_914838 ?auto_914840 ) ) ( not ( = ?auto_914838 ?auto_914841 ) ) ( not ( = ?auto_914838 ?auto_914842 ) ) ( not ( = ?auto_914838 ?auto_914843 ) ) ( not ( = ?auto_914838 ?auto_914844 ) ) ( not ( = ?auto_914838 ?auto_914845 ) ) ( not ( = ?auto_914838 ?auto_914846 ) ) ( not ( = ?auto_914838 ?auto_914847 ) ) ( not ( = ?auto_914838 ?auto_914848 ) ) ( not ( = ?auto_914838 ?auto_914849 ) ) ( not ( = ?auto_914838 ?auto_914850 ) ) ( not ( = ?auto_914838 ?auto_914851 ) ) ( not ( = ?auto_914838 ?auto_914852 ) ) ( not ( = ?auto_914839 ?auto_914840 ) ) ( not ( = ?auto_914839 ?auto_914841 ) ) ( not ( = ?auto_914839 ?auto_914842 ) ) ( not ( = ?auto_914839 ?auto_914843 ) ) ( not ( = ?auto_914839 ?auto_914844 ) ) ( not ( = ?auto_914839 ?auto_914845 ) ) ( not ( = ?auto_914839 ?auto_914846 ) ) ( not ( = ?auto_914839 ?auto_914847 ) ) ( not ( = ?auto_914839 ?auto_914848 ) ) ( not ( = ?auto_914839 ?auto_914849 ) ) ( not ( = ?auto_914839 ?auto_914850 ) ) ( not ( = ?auto_914839 ?auto_914851 ) ) ( not ( = ?auto_914839 ?auto_914852 ) ) ( not ( = ?auto_914840 ?auto_914841 ) ) ( not ( = ?auto_914840 ?auto_914842 ) ) ( not ( = ?auto_914840 ?auto_914843 ) ) ( not ( = ?auto_914840 ?auto_914844 ) ) ( not ( = ?auto_914840 ?auto_914845 ) ) ( not ( = ?auto_914840 ?auto_914846 ) ) ( not ( = ?auto_914840 ?auto_914847 ) ) ( not ( = ?auto_914840 ?auto_914848 ) ) ( not ( = ?auto_914840 ?auto_914849 ) ) ( not ( = ?auto_914840 ?auto_914850 ) ) ( not ( = ?auto_914840 ?auto_914851 ) ) ( not ( = ?auto_914840 ?auto_914852 ) ) ( not ( = ?auto_914841 ?auto_914842 ) ) ( not ( = ?auto_914841 ?auto_914843 ) ) ( not ( = ?auto_914841 ?auto_914844 ) ) ( not ( = ?auto_914841 ?auto_914845 ) ) ( not ( = ?auto_914841 ?auto_914846 ) ) ( not ( = ?auto_914841 ?auto_914847 ) ) ( not ( = ?auto_914841 ?auto_914848 ) ) ( not ( = ?auto_914841 ?auto_914849 ) ) ( not ( = ?auto_914841 ?auto_914850 ) ) ( not ( = ?auto_914841 ?auto_914851 ) ) ( not ( = ?auto_914841 ?auto_914852 ) ) ( not ( = ?auto_914842 ?auto_914843 ) ) ( not ( = ?auto_914842 ?auto_914844 ) ) ( not ( = ?auto_914842 ?auto_914845 ) ) ( not ( = ?auto_914842 ?auto_914846 ) ) ( not ( = ?auto_914842 ?auto_914847 ) ) ( not ( = ?auto_914842 ?auto_914848 ) ) ( not ( = ?auto_914842 ?auto_914849 ) ) ( not ( = ?auto_914842 ?auto_914850 ) ) ( not ( = ?auto_914842 ?auto_914851 ) ) ( not ( = ?auto_914842 ?auto_914852 ) ) ( not ( = ?auto_914843 ?auto_914844 ) ) ( not ( = ?auto_914843 ?auto_914845 ) ) ( not ( = ?auto_914843 ?auto_914846 ) ) ( not ( = ?auto_914843 ?auto_914847 ) ) ( not ( = ?auto_914843 ?auto_914848 ) ) ( not ( = ?auto_914843 ?auto_914849 ) ) ( not ( = ?auto_914843 ?auto_914850 ) ) ( not ( = ?auto_914843 ?auto_914851 ) ) ( not ( = ?auto_914843 ?auto_914852 ) ) ( not ( = ?auto_914844 ?auto_914845 ) ) ( not ( = ?auto_914844 ?auto_914846 ) ) ( not ( = ?auto_914844 ?auto_914847 ) ) ( not ( = ?auto_914844 ?auto_914848 ) ) ( not ( = ?auto_914844 ?auto_914849 ) ) ( not ( = ?auto_914844 ?auto_914850 ) ) ( not ( = ?auto_914844 ?auto_914851 ) ) ( not ( = ?auto_914844 ?auto_914852 ) ) ( not ( = ?auto_914845 ?auto_914846 ) ) ( not ( = ?auto_914845 ?auto_914847 ) ) ( not ( = ?auto_914845 ?auto_914848 ) ) ( not ( = ?auto_914845 ?auto_914849 ) ) ( not ( = ?auto_914845 ?auto_914850 ) ) ( not ( = ?auto_914845 ?auto_914851 ) ) ( not ( = ?auto_914845 ?auto_914852 ) ) ( not ( = ?auto_914846 ?auto_914847 ) ) ( not ( = ?auto_914846 ?auto_914848 ) ) ( not ( = ?auto_914846 ?auto_914849 ) ) ( not ( = ?auto_914846 ?auto_914850 ) ) ( not ( = ?auto_914846 ?auto_914851 ) ) ( not ( = ?auto_914846 ?auto_914852 ) ) ( not ( = ?auto_914847 ?auto_914848 ) ) ( not ( = ?auto_914847 ?auto_914849 ) ) ( not ( = ?auto_914847 ?auto_914850 ) ) ( not ( = ?auto_914847 ?auto_914851 ) ) ( not ( = ?auto_914847 ?auto_914852 ) ) ( not ( = ?auto_914848 ?auto_914849 ) ) ( not ( = ?auto_914848 ?auto_914850 ) ) ( not ( = ?auto_914848 ?auto_914851 ) ) ( not ( = ?auto_914848 ?auto_914852 ) ) ( not ( = ?auto_914849 ?auto_914850 ) ) ( not ( = ?auto_914849 ?auto_914851 ) ) ( not ( = ?auto_914849 ?auto_914852 ) ) ( not ( = ?auto_914850 ?auto_914851 ) ) ( not ( = ?auto_914850 ?auto_914852 ) ) ( not ( = ?auto_914851 ?auto_914852 ) ) ( ON ?auto_914851 ?auto_914852 ) ( ON ?auto_914850 ?auto_914851 ) ( ON ?auto_914849 ?auto_914850 ) ( ON ?auto_914848 ?auto_914849 ) ( ON ?auto_914847 ?auto_914848 ) ( ON ?auto_914846 ?auto_914847 ) ( CLEAR ?auto_914844 ) ( ON ?auto_914845 ?auto_914846 ) ( CLEAR ?auto_914845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_914835 ?auto_914836 ?auto_914837 ?auto_914838 ?auto_914839 ?auto_914840 ?auto_914841 ?auto_914842 ?auto_914843 ?auto_914844 ?auto_914845 )
      ( MAKE-18PILE ?auto_914835 ?auto_914836 ?auto_914837 ?auto_914838 ?auto_914839 ?auto_914840 ?auto_914841 ?auto_914842 ?auto_914843 ?auto_914844 ?auto_914845 ?auto_914846 ?auto_914847 ?auto_914848 ?auto_914849 ?auto_914850 ?auto_914851 ?auto_914852 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914871 - BLOCK
      ?auto_914872 - BLOCK
      ?auto_914873 - BLOCK
      ?auto_914874 - BLOCK
      ?auto_914875 - BLOCK
      ?auto_914876 - BLOCK
      ?auto_914877 - BLOCK
      ?auto_914878 - BLOCK
      ?auto_914879 - BLOCK
      ?auto_914880 - BLOCK
      ?auto_914881 - BLOCK
      ?auto_914882 - BLOCK
      ?auto_914883 - BLOCK
      ?auto_914884 - BLOCK
      ?auto_914885 - BLOCK
      ?auto_914886 - BLOCK
      ?auto_914887 - BLOCK
      ?auto_914888 - BLOCK
    )
    :vars
    (
      ?auto_914889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914888 ?auto_914889 ) ( ON-TABLE ?auto_914871 ) ( ON ?auto_914872 ?auto_914871 ) ( ON ?auto_914873 ?auto_914872 ) ( ON ?auto_914874 ?auto_914873 ) ( ON ?auto_914875 ?auto_914874 ) ( ON ?auto_914876 ?auto_914875 ) ( ON ?auto_914877 ?auto_914876 ) ( ON ?auto_914878 ?auto_914877 ) ( ON ?auto_914879 ?auto_914878 ) ( not ( = ?auto_914871 ?auto_914872 ) ) ( not ( = ?auto_914871 ?auto_914873 ) ) ( not ( = ?auto_914871 ?auto_914874 ) ) ( not ( = ?auto_914871 ?auto_914875 ) ) ( not ( = ?auto_914871 ?auto_914876 ) ) ( not ( = ?auto_914871 ?auto_914877 ) ) ( not ( = ?auto_914871 ?auto_914878 ) ) ( not ( = ?auto_914871 ?auto_914879 ) ) ( not ( = ?auto_914871 ?auto_914880 ) ) ( not ( = ?auto_914871 ?auto_914881 ) ) ( not ( = ?auto_914871 ?auto_914882 ) ) ( not ( = ?auto_914871 ?auto_914883 ) ) ( not ( = ?auto_914871 ?auto_914884 ) ) ( not ( = ?auto_914871 ?auto_914885 ) ) ( not ( = ?auto_914871 ?auto_914886 ) ) ( not ( = ?auto_914871 ?auto_914887 ) ) ( not ( = ?auto_914871 ?auto_914888 ) ) ( not ( = ?auto_914871 ?auto_914889 ) ) ( not ( = ?auto_914872 ?auto_914873 ) ) ( not ( = ?auto_914872 ?auto_914874 ) ) ( not ( = ?auto_914872 ?auto_914875 ) ) ( not ( = ?auto_914872 ?auto_914876 ) ) ( not ( = ?auto_914872 ?auto_914877 ) ) ( not ( = ?auto_914872 ?auto_914878 ) ) ( not ( = ?auto_914872 ?auto_914879 ) ) ( not ( = ?auto_914872 ?auto_914880 ) ) ( not ( = ?auto_914872 ?auto_914881 ) ) ( not ( = ?auto_914872 ?auto_914882 ) ) ( not ( = ?auto_914872 ?auto_914883 ) ) ( not ( = ?auto_914872 ?auto_914884 ) ) ( not ( = ?auto_914872 ?auto_914885 ) ) ( not ( = ?auto_914872 ?auto_914886 ) ) ( not ( = ?auto_914872 ?auto_914887 ) ) ( not ( = ?auto_914872 ?auto_914888 ) ) ( not ( = ?auto_914872 ?auto_914889 ) ) ( not ( = ?auto_914873 ?auto_914874 ) ) ( not ( = ?auto_914873 ?auto_914875 ) ) ( not ( = ?auto_914873 ?auto_914876 ) ) ( not ( = ?auto_914873 ?auto_914877 ) ) ( not ( = ?auto_914873 ?auto_914878 ) ) ( not ( = ?auto_914873 ?auto_914879 ) ) ( not ( = ?auto_914873 ?auto_914880 ) ) ( not ( = ?auto_914873 ?auto_914881 ) ) ( not ( = ?auto_914873 ?auto_914882 ) ) ( not ( = ?auto_914873 ?auto_914883 ) ) ( not ( = ?auto_914873 ?auto_914884 ) ) ( not ( = ?auto_914873 ?auto_914885 ) ) ( not ( = ?auto_914873 ?auto_914886 ) ) ( not ( = ?auto_914873 ?auto_914887 ) ) ( not ( = ?auto_914873 ?auto_914888 ) ) ( not ( = ?auto_914873 ?auto_914889 ) ) ( not ( = ?auto_914874 ?auto_914875 ) ) ( not ( = ?auto_914874 ?auto_914876 ) ) ( not ( = ?auto_914874 ?auto_914877 ) ) ( not ( = ?auto_914874 ?auto_914878 ) ) ( not ( = ?auto_914874 ?auto_914879 ) ) ( not ( = ?auto_914874 ?auto_914880 ) ) ( not ( = ?auto_914874 ?auto_914881 ) ) ( not ( = ?auto_914874 ?auto_914882 ) ) ( not ( = ?auto_914874 ?auto_914883 ) ) ( not ( = ?auto_914874 ?auto_914884 ) ) ( not ( = ?auto_914874 ?auto_914885 ) ) ( not ( = ?auto_914874 ?auto_914886 ) ) ( not ( = ?auto_914874 ?auto_914887 ) ) ( not ( = ?auto_914874 ?auto_914888 ) ) ( not ( = ?auto_914874 ?auto_914889 ) ) ( not ( = ?auto_914875 ?auto_914876 ) ) ( not ( = ?auto_914875 ?auto_914877 ) ) ( not ( = ?auto_914875 ?auto_914878 ) ) ( not ( = ?auto_914875 ?auto_914879 ) ) ( not ( = ?auto_914875 ?auto_914880 ) ) ( not ( = ?auto_914875 ?auto_914881 ) ) ( not ( = ?auto_914875 ?auto_914882 ) ) ( not ( = ?auto_914875 ?auto_914883 ) ) ( not ( = ?auto_914875 ?auto_914884 ) ) ( not ( = ?auto_914875 ?auto_914885 ) ) ( not ( = ?auto_914875 ?auto_914886 ) ) ( not ( = ?auto_914875 ?auto_914887 ) ) ( not ( = ?auto_914875 ?auto_914888 ) ) ( not ( = ?auto_914875 ?auto_914889 ) ) ( not ( = ?auto_914876 ?auto_914877 ) ) ( not ( = ?auto_914876 ?auto_914878 ) ) ( not ( = ?auto_914876 ?auto_914879 ) ) ( not ( = ?auto_914876 ?auto_914880 ) ) ( not ( = ?auto_914876 ?auto_914881 ) ) ( not ( = ?auto_914876 ?auto_914882 ) ) ( not ( = ?auto_914876 ?auto_914883 ) ) ( not ( = ?auto_914876 ?auto_914884 ) ) ( not ( = ?auto_914876 ?auto_914885 ) ) ( not ( = ?auto_914876 ?auto_914886 ) ) ( not ( = ?auto_914876 ?auto_914887 ) ) ( not ( = ?auto_914876 ?auto_914888 ) ) ( not ( = ?auto_914876 ?auto_914889 ) ) ( not ( = ?auto_914877 ?auto_914878 ) ) ( not ( = ?auto_914877 ?auto_914879 ) ) ( not ( = ?auto_914877 ?auto_914880 ) ) ( not ( = ?auto_914877 ?auto_914881 ) ) ( not ( = ?auto_914877 ?auto_914882 ) ) ( not ( = ?auto_914877 ?auto_914883 ) ) ( not ( = ?auto_914877 ?auto_914884 ) ) ( not ( = ?auto_914877 ?auto_914885 ) ) ( not ( = ?auto_914877 ?auto_914886 ) ) ( not ( = ?auto_914877 ?auto_914887 ) ) ( not ( = ?auto_914877 ?auto_914888 ) ) ( not ( = ?auto_914877 ?auto_914889 ) ) ( not ( = ?auto_914878 ?auto_914879 ) ) ( not ( = ?auto_914878 ?auto_914880 ) ) ( not ( = ?auto_914878 ?auto_914881 ) ) ( not ( = ?auto_914878 ?auto_914882 ) ) ( not ( = ?auto_914878 ?auto_914883 ) ) ( not ( = ?auto_914878 ?auto_914884 ) ) ( not ( = ?auto_914878 ?auto_914885 ) ) ( not ( = ?auto_914878 ?auto_914886 ) ) ( not ( = ?auto_914878 ?auto_914887 ) ) ( not ( = ?auto_914878 ?auto_914888 ) ) ( not ( = ?auto_914878 ?auto_914889 ) ) ( not ( = ?auto_914879 ?auto_914880 ) ) ( not ( = ?auto_914879 ?auto_914881 ) ) ( not ( = ?auto_914879 ?auto_914882 ) ) ( not ( = ?auto_914879 ?auto_914883 ) ) ( not ( = ?auto_914879 ?auto_914884 ) ) ( not ( = ?auto_914879 ?auto_914885 ) ) ( not ( = ?auto_914879 ?auto_914886 ) ) ( not ( = ?auto_914879 ?auto_914887 ) ) ( not ( = ?auto_914879 ?auto_914888 ) ) ( not ( = ?auto_914879 ?auto_914889 ) ) ( not ( = ?auto_914880 ?auto_914881 ) ) ( not ( = ?auto_914880 ?auto_914882 ) ) ( not ( = ?auto_914880 ?auto_914883 ) ) ( not ( = ?auto_914880 ?auto_914884 ) ) ( not ( = ?auto_914880 ?auto_914885 ) ) ( not ( = ?auto_914880 ?auto_914886 ) ) ( not ( = ?auto_914880 ?auto_914887 ) ) ( not ( = ?auto_914880 ?auto_914888 ) ) ( not ( = ?auto_914880 ?auto_914889 ) ) ( not ( = ?auto_914881 ?auto_914882 ) ) ( not ( = ?auto_914881 ?auto_914883 ) ) ( not ( = ?auto_914881 ?auto_914884 ) ) ( not ( = ?auto_914881 ?auto_914885 ) ) ( not ( = ?auto_914881 ?auto_914886 ) ) ( not ( = ?auto_914881 ?auto_914887 ) ) ( not ( = ?auto_914881 ?auto_914888 ) ) ( not ( = ?auto_914881 ?auto_914889 ) ) ( not ( = ?auto_914882 ?auto_914883 ) ) ( not ( = ?auto_914882 ?auto_914884 ) ) ( not ( = ?auto_914882 ?auto_914885 ) ) ( not ( = ?auto_914882 ?auto_914886 ) ) ( not ( = ?auto_914882 ?auto_914887 ) ) ( not ( = ?auto_914882 ?auto_914888 ) ) ( not ( = ?auto_914882 ?auto_914889 ) ) ( not ( = ?auto_914883 ?auto_914884 ) ) ( not ( = ?auto_914883 ?auto_914885 ) ) ( not ( = ?auto_914883 ?auto_914886 ) ) ( not ( = ?auto_914883 ?auto_914887 ) ) ( not ( = ?auto_914883 ?auto_914888 ) ) ( not ( = ?auto_914883 ?auto_914889 ) ) ( not ( = ?auto_914884 ?auto_914885 ) ) ( not ( = ?auto_914884 ?auto_914886 ) ) ( not ( = ?auto_914884 ?auto_914887 ) ) ( not ( = ?auto_914884 ?auto_914888 ) ) ( not ( = ?auto_914884 ?auto_914889 ) ) ( not ( = ?auto_914885 ?auto_914886 ) ) ( not ( = ?auto_914885 ?auto_914887 ) ) ( not ( = ?auto_914885 ?auto_914888 ) ) ( not ( = ?auto_914885 ?auto_914889 ) ) ( not ( = ?auto_914886 ?auto_914887 ) ) ( not ( = ?auto_914886 ?auto_914888 ) ) ( not ( = ?auto_914886 ?auto_914889 ) ) ( not ( = ?auto_914887 ?auto_914888 ) ) ( not ( = ?auto_914887 ?auto_914889 ) ) ( not ( = ?auto_914888 ?auto_914889 ) ) ( ON ?auto_914887 ?auto_914888 ) ( ON ?auto_914886 ?auto_914887 ) ( ON ?auto_914885 ?auto_914886 ) ( ON ?auto_914884 ?auto_914885 ) ( ON ?auto_914883 ?auto_914884 ) ( ON ?auto_914882 ?auto_914883 ) ( ON ?auto_914881 ?auto_914882 ) ( CLEAR ?auto_914879 ) ( ON ?auto_914880 ?auto_914881 ) ( CLEAR ?auto_914880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_914871 ?auto_914872 ?auto_914873 ?auto_914874 ?auto_914875 ?auto_914876 ?auto_914877 ?auto_914878 ?auto_914879 ?auto_914880 )
      ( MAKE-18PILE ?auto_914871 ?auto_914872 ?auto_914873 ?auto_914874 ?auto_914875 ?auto_914876 ?auto_914877 ?auto_914878 ?auto_914879 ?auto_914880 ?auto_914881 ?auto_914882 ?auto_914883 ?auto_914884 ?auto_914885 ?auto_914886 ?auto_914887 ?auto_914888 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914908 - BLOCK
      ?auto_914909 - BLOCK
      ?auto_914910 - BLOCK
      ?auto_914911 - BLOCK
      ?auto_914912 - BLOCK
      ?auto_914913 - BLOCK
      ?auto_914914 - BLOCK
      ?auto_914915 - BLOCK
      ?auto_914916 - BLOCK
      ?auto_914917 - BLOCK
      ?auto_914918 - BLOCK
      ?auto_914919 - BLOCK
      ?auto_914920 - BLOCK
      ?auto_914921 - BLOCK
      ?auto_914922 - BLOCK
      ?auto_914923 - BLOCK
      ?auto_914924 - BLOCK
      ?auto_914925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914925 ) ( ON-TABLE ?auto_914908 ) ( ON ?auto_914909 ?auto_914908 ) ( ON ?auto_914910 ?auto_914909 ) ( ON ?auto_914911 ?auto_914910 ) ( ON ?auto_914912 ?auto_914911 ) ( ON ?auto_914913 ?auto_914912 ) ( ON ?auto_914914 ?auto_914913 ) ( ON ?auto_914915 ?auto_914914 ) ( ON ?auto_914916 ?auto_914915 ) ( not ( = ?auto_914908 ?auto_914909 ) ) ( not ( = ?auto_914908 ?auto_914910 ) ) ( not ( = ?auto_914908 ?auto_914911 ) ) ( not ( = ?auto_914908 ?auto_914912 ) ) ( not ( = ?auto_914908 ?auto_914913 ) ) ( not ( = ?auto_914908 ?auto_914914 ) ) ( not ( = ?auto_914908 ?auto_914915 ) ) ( not ( = ?auto_914908 ?auto_914916 ) ) ( not ( = ?auto_914908 ?auto_914917 ) ) ( not ( = ?auto_914908 ?auto_914918 ) ) ( not ( = ?auto_914908 ?auto_914919 ) ) ( not ( = ?auto_914908 ?auto_914920 ) ) ( not ( = ?auto_914908 ?auto_914921 ) ) ( not ( = ?auto_914908 ?auto_914922 ) ) ( not ( = ?auto_914908 ?auto_914923 ) ) ( not ( = ?auto_914908 ?auto_914924 ) ) ( not ( = ?auto_914908 ?auto_914925 ) ) ( not ( = ?auto_914909 ?auto_914910 ) ) ( not ( = ?auto_914909 ?auto_914911 ) ) ( not ( = ?auto_914909 ?auto_914912 ) ) ( not ( = ?auto_914909 ?auto_914913 ) ) ( not ( = ?auto_914909 ?auto_914914 ) ) ( not ( = ?auto_914909 ?auto_914915 ) ) ( not ( = ?auto_914909 ?auto_914916 ) ) ( not ( = ?auto_914909 ?auto_914917 ) ) ( not ( = ?auto_914909 ?auto_914918 ) ) ( not ( = ?auto_914909 ?auto_914919 ) ) ( not ( = ?auto_914909 ?auto_914920 ) ) ( not ( = ?auto_914909 ?auto_914921 ) ) ( not ( = ?auto_914909 ?auto_914922 ) ) ( not ( = ?auto_914909 ?auto_914923 ) ) ( not ( = ?auto_914909 ?auto_914924 ) ) ( not ( = ?auto_914909 ?auto_914925 ) ) ( not ( = ?auto_914910 ?auto_914911 ) ) ( not ( = ?auto_914910 ?auto_914912 ) ) ( not ( = ?auto_914910 ?auto_914913 ) ) ( not ( = ?auto_914910 ?auto_914914 ) ) ( not ( = ?auto_914910 ?auto_914915 ) ) ( not ( = ?auto_914910 ?auto_914916 ) ) ( not ( = ?auto_914910 ?auto_914917 ) ) ( not ( = ?auto_914910 ?auto_914918 ) ) ( not ( = ?auto_914910 ?auto_914919 ) ) ( not ( = ?auto_914910 ?auto_914920 ) ) ( not ( = ?auto_914910 ?auto_914921 ) ) ( not ( = ?auto_914910 ?auto_914922 ) ) ( not ( = ?auto_914910 ?auto_914923 ) ) ( not ( = ?auto_914910 ?auto_914924 ) ) ( not ( = ?auto_914910 ?auto_914925 ) ) ( not ( = ?auto_914911 ?auto_914912 ) ) ( not ( = ?auto_914911 ?auto_914913 ) ) ( not ( = ?auto_914911 ?auto_914914 ) ) ( not ( = ?auto_914911 ?auto_914915 ) ) ( not ( = ?auto_914911 ?auto_914916 ) ) ( not ( = ?auto_914911 ?auto_914917 ) ) ( not ( = ?auto_914911 ?auto_914918 ) ) ( not ( = ?auto_914911 ?auto_914919 ) ) ( not ( = ?auto_914911 ?auto_914920 ) ) ( not ( = ?auto_914911 ?auto_914921 ) ) ( not ( = ?auto_914911 ?auto_914922 ) ) ( not ( = ?auto_914911 ?auto_914923 ) ) ( not ( = ?auto_914911 ?auto_914924 ) ) ( not ( = ?auto_914911 ?auto_914925 ) ) ( not ( = ?auto_914912 ?auto_914913 ) ) ( not ( = ?auto_914912 ?auto_914914 ) ) ( not ( = ?auto_914912 ?auto_914915 ) ) ( not ( = ?auto_914912 ?auto_914916 ) ) ( not ( = ?auto_914912 ?auto_914917 ) ) ( not ( = ?auto_914912 ?auto_914918 ) ) ( not ( = ?auto_914912 ?auto_914919 ) ) ( not ( = ?auto_914912 ?auto_914920 ) ) ( not ( = ?auto_914912 ?auto_914921 ) ) ( not ( = ?auto_914912 ?auto_914922 ) ) ( not ( = ?auto_914912 ?auto_914923 ) ) ( not ( = ?auto_914912 ?auto_914924 ) ) ( not ( = ?auto_914912 ?auto_914925 ) ) ( not ( = ?auto_914913 ?auto_914914 ) ) ( not ( = ?auto_914913 ?auto_914915 ) ) ( not ( = ?auto_914913 ?auto_914916 ) ) ( not ( = ?auto_914913 ?auto_914917 ) ) ( not ( = ?auto_914913 ?auto_914918 ) ) ( not ( = ?auto_914913 ?auto_914919 ) ) ( not ( = ?auto_914913 ?auto_914920 ) ) ( not ( = ?auto_914913 ?auto_914921 ) ) ( not ( = ?auto_914913 ?auto_914922 ) ) ( not ( = ?auto_914913 ?auto_914923 ) ) ( not ( = ?auto_914913 ?auto_914924 ) ) ( not ( = ?auto_914913 ?auto_914925 ) ) ( not ( = ?auto_914914 ?auto_914915 ) ) ( not ( = ?auto_914914 ?auto_914916 ) ) ( not ( = ?auto_914914 ?auto_914917 ) ) ( not ( = ?auto_914914 ?auto_914918 ) ) ( not ( = ?auto_914914 ?auto_914919 ) ) ( not ( = ?auto_914914 ?auto_914920 ) ) ( not ( = ?auto_914914 ?auto_914921 ) ) ( not ( = ?auto_914914 ?auto_914922 ) ) ( not ( = ?auto_914914 ?auto_914923 ) ) ( not ( = ?auto_914914 ?auto_914924 ) ) ( not ( = ?auto_914914 ?auto_914925 ) ) ( not ( = ?auto_914915 ?auto_914916 ) ) ( not ( = ?auto_914915 ?auto_914917 ) ) ( not ( = ?auto_914915 ?auto_914918 ) ) ( not ( = ?auto_914915 ?auto_914919 ) ) ( not ( = ?auto_914915 ?auto_914920 ) ) ( not ( = ?auto_914915 ?auto_914921 ) ) ( not ( = ?auto_914915 ?auto_914922 ) ) ( not ( = ?auto_914915 ?auto_914923 ) ) ( not ( = ?auto_914915 ?auto_914924 ) ) ( not ( = ?auto_914915 ?auto_914925 ) ) ( not ( = ?auto_914916 ?auto_914917 ) ) ( not ( = ?auto_914916 ?auto_914918 ) ) ( not ( = ?auto_914916 ?auto_914919 ) ) ( not ( = ?auto_914916 ?auto_914920 ) ) ( not ( = ?auto_914916 ?auto_914921 ) ) ( not ( = ?auto_914916 ?auto_914922 ) ) ( not ( = ?auto_914916 ?auto_914923 ) ) ( not ( = ?auto_914916 ?auto_914924 ) ) ( not ( = ?auto_914916 ?auto_914925 ) ) ( not ( = ?auto_914917 ?auto_914918 ) ) ( not ( = ?auto_914917 ?auto_914919 ) ) ( not ( = ?auto_914917 ?auto_914920 ) ) ( not ( = ?auto_914917 ?auto_914921 ) ) ( not ( = ?auto_914917 ?auto_914922 ) ) ( not ( = ?auto_914917 ?auto_914923 ) ) ( not ( = ?auto_914917 ?auto_914924 ) ) ( not ( = ?auto_914917 ?auto_914925 ) ) ( not ( = ?auto_914918 ?auto_914919 ) ) ( not ( = ?auto_914918 ?auto_914920 ) ) ( not ( = ?auto_914918 ?auto_914921 ) ) ( not ( = ?auto_914918 ?auto_914922 ) ) ( not ( = ?auto_914918 ?auto_914923 ) ) ( not ( = ?auto_914918 ?auto_914924 ) ) ( not ( = ?auto_914918 ?auto_914925 ) ) ( not ( = ?auto_914919 ?auto_914920 ) ) ( not ( = ?auto_914919 ?auto_914921 ) ) ( not ( = ?auto_914919 ?auto_914922 ) ) ( not ( = ?auto_914919 ?auto_914923 ) ) ( not ( = ?auto_914919 ?auto_914924 ) ) ( not ( = ?auto_914919 ?auto_914925 ) ) ( not ( = ?auto_914920 ?auto_914921 ) ) ( not ( = ?auto_914920 ?auto_914922 ) ) ( not ( = ?auto_914920 ?auto_914923 ) ) ( not ( = ?auto_914920 ?auto_914924 ) ) ( not ( = ?auto_914920 ?auto_914925 ) ) ( not ( = ?auto_914921 ?auto_914922 ) ) ( not ( = ?auto_914921 ?auto_914923 ) ) ( not ( = ?auto_914921 ?auto_914924 ) ) ( not ( = ?auto_914921 ?auto_914925 ) ) ( not ( = ?auto_914922 ?auto_914923 ) ) ( not ( = ?auto_914922 ?auto_914924 ) ) ( not ( = ?auto_914922 ?auto_914925 ) ) ( not ( = ?auto_914923 ?auto_914924 ) ) ( not ( = ?auto_914923 ?auto_914925 ) ) ( not ( = ?auto_914924 ?auto_914925 ) ) ( ON ?auto_914924 ?auto_914925 ) ( ON ?auto_914923 ?auto_914924 ) ( ON ?auto_914922 ?auto_914923 ) ( ON ?auto_914921 ?auto_914922 ) ( ON ?auto_914920 ?auto_914921 ) ( ON ?auto_914919 ?auto_914920 ) ( ON ?auto_914918 ?auto_914919 ) ( CLEAR ?auto_914916 ) ( ON ?auto_914917 ?auto_914918 ) ( CLEAR ?auto_914917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_914908 ?auto_914909 ?auto_914910 ?auto_914911 ?auto_914912 ?auto_914913 ?auto_914914 ?auto_914915 ?auto_914916 ?auto_914917 )
      ( MAKE-18PILE ?auto_914908 ?auto_914909 ?auto_914910 ?auto_914911 ?auto_914912 ?auto_914913 ?auto_914914 ?auto_914915 ?auto_914916 ?auto_914917 ?auto_914918 ?auto_914919 ?auto_914920 ?auto_914921 ?auto_914922 ?auto_914923 ?auto_914924 ?auto_914925 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914944 - BLOCK
      ?auto_914945 - BLOCK
      ?auto_914946 - BLOCK
      ?auto_914947 - BLOCK
      ?auto_914948 - BLOCK
      ?auto_914949 - BLOCK
      ?auto_914950 - BLOCK
      ?auto_914951 - BLOCK
      ?auto_914952 - BLOCK
      ?auto_914953 - BLOCK
      ?auto_914954 - BLOCK
      ?auto_914955 - BLOCK
      ?auto_914956 - BLOCK
      ?auto_914957 - BLOCK
      ?auto_914958 - BLOCK
      ?auto_914959 - BLOCK
      ?auto_914960 - BLOCK
      ?auto_914961 - BLOCK
    )
    :vars
    (
      ?auto_914962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_914961 ?auto_914962 ) ( ON-TABLE ?auto_914944 ) ( ON ?auto_914945 ?auto_914944 ) ( ON ?auto_914946 ?auto_914945 ) ( ON ?auto_914947 ?auto_914946 ) ( ON ?auto_914948 ?auto_914947 ) ( ON ?auto_914949 ?auto_914948 ) ( ON ?auto_914950 ?auto_914949 ) ( ON ?auto_914951 ?auto_914950 ) ( not ( = ?auto_914944 ?auto_914945 ) ) ( not ( = ?auto_914944 ?auto_914946 ) ) ( not ( = ?auto_914944 ?auto_914947 ) ) ( not ( = ?auto_914944 ?auto_914948 ) ) ( not ( = ?auto_914944 ?auto_914949 ) ) ( not ( = ?auto_914944 ?auto_914950 ) ) ( not ( = ?auto_914944 ?auto_914951 ) ) ( not ( = ?auto_914944 ?auto_914952 ) ) ( not ( = ?auto_914944 ?auto_914953 ) ) ( not ( = ?auto_914944 ?auto_914954 ) ) ( not ( = ?auto_914944 ?auto_914955 ) ) ( not ( = ?auto_914944 ?auto_914956 ) ) ( not ( = ?auto_914944 ?auto_914957 ) ) ( not ( = ?auto_914944 ?auto_914958 ) ) ( not ( = ?auto_914944 ?auto_914959 ) ) ( not ( = ?auto_914944 ?auto_914960 ) ) ( not ( = ?auto_914944 ?auto_914961 ) ) ( not ( = ?auto_914944 ?auto_914962 ) ) ( not ( = ?auto_914945 ?auto_914946 ) ) ( not ( = ?auto_914945 ?auto_914947 ) ) ( not ( = ?auto_914945 ?auto_914948 ) ) ( not ( = ?auto_914945 ?auto_914949 ) ) ( not ( = ?auto_914945 ?auto_914950 ) ) ( not ( = ?auto_914945 ?auto_914951 ) ) ( not ( = ?auto_914945 ?auto_914952 ) ) ( not ( = ?auto_914945 ?auto_914953 ) ) ( not ( = ?auto_914945 ?auto_914954 ) ) ( not ( = ?auto_914945 ?auto_914955 ) ) ( not ( = ?auto_914945 ?auto_914956 ) ) ( not ( = ?auto_914945 ?auto_914957 ) ) ( not ( = ?auto_914945 ?auto_914958 ) ) ( not ( = ?auto_914945 ?auto_914959 ) ) ( not ( = ?auto_914945 ?auto_914960 ) ) ( not ( = ?auto_914945 ?auto_914961 ) ) ( not ( = ?auto_914945 ?auto_914962 ) ) ( not ( = ?auto_914946 ?auto_914947 ) ) ( not ( = ?auto_914946 ?auto_914948 ) ) ( not ( = ?auto_914946 ?auto_914949 ) ) ( not ( = ?auto_914946 ?auto_914950 ) ) ( not ( = ?auto_914946 ?auto_914951 ) ) ( not ( = ?auto_914946 ?auto_914952 ) ) ( not ( = ?auto_914946 ?auto_914953 ) ) ( not ( = ?auto_914946 ?auto_914954 ) ) ( not ( = ?auto_914946 ?auto_914955 ) ) ( not ( = ?auto_914946 ?auto_914956 ) ) ( not ( = ?auto_914946 ?auto_914957 ) ) ( not ( = ?auto_914946 ?auto_914958 ) ) ( not ( = ?auto_914946 ?auto_914959 ) ) ( not ( = ?auto_914946 ?auto_914960 ) ) ( not ( = ?auto_914946 ?auto_914961 ) ) ( not ( = ?auto_914946 ?auto_914962 ) ) ( not ( = ?auto_914947 ?auto_914948 ) ) ( not ( = ?auto_914947 ?auto_914949 ) ) ( not ( = ?auto_914947 ?auto_914950 ) ) ( not ( = ?auto_914947 ?auto_914951 ) ) ( not ( = ?auto_914947 ?auto_914952 ) ) ( not ( = ?auto_914947 ?auto_914953 ) ) ( not ( = ?auto_914947 ?auto_914954 ) ) ( not ( = ?auto_914947 ?auto_914955 ) ) ( not ( = ?auto_914947 ?auto_914956 ) ) ( not ( = ?auto_914947 ?auto_914957 ) ) ( not ( = ?auto_914947 ?auto_914958 ) ) ( not ( = ?auto_914947 ?auto_914959 ) ) ( not ( = ?auto_914947 ?auto_914960 ) ) ( not ( = ?auto_914947 ?auto_914961 ) ) ( not ( = ?auto_914947 ?auto_914962 ) ) ( not ( = ?auto_914948 ?auto_914949 ) ) ( not ( = ?auto_914948 ?auto_914950 ) ) ( not ( = ?auto_914948 ?auto_914951 ) ) ( not ( = ?auto_914948 ?auto_914952 ) ) ( not ( = ?auto_914948 ?auto_914953 ) ) ( not ( = ?auto_914948 ?auto_914954 ) ) ( not ( = ?auto_914948 ?auto_914955 ) ) ( not ( = ?auto_914948 ?auto_914956 ) ) ( not ( = ?auto_914948 ?auto_914957 ) ) ( not ( = ?auto_914948 ?auto_914958 ) ) ( not ( = ?auto_914948 ?auto_914959 ) ) ( not ( = ?auto_914948 ?auto_914960 ) ) ( not ( = ?auto_914948 ?auto_914961 ) ) ( not ( = ?auto_914948 ?auto_914962 ) ) ( not ( = ?auto_914949 ?auto_914950 ) ) ( not ( = ?auto_914949 ?auto_914951 ) ) ( not ( = ?auto_914949 ?auto_914952 ) ) ( not ( = ?auto_914949 ?auto_914953 ) ) ( not ( = ?auto_914949 ?auto_914954 ) ) ( not ( = ?auto_914949 ?auto_914955 ) ) ( not ( = ?auto_914949 ?auto_914956 ) ) ( not ( = ?auto_914949 ?auto_914957 ) ) ( not ( = ?auto_914949 ?auto_914958 ) ) ( not ( = ?auto_914949 ?auto_914959 ) ) ( not ( = ?auto_914949 ?auto_914960 ) ) ( not ( = ?auto_914949 ?auto_914961 ) ) ( not ( = ?auto_914949 ?auto_914962 ) ) ( not ( = ?auto_914950 ?auto_914951 ) ) ( not ( = ?auto_914950 ?auto_914952 ) ) ( not ( = ?auto_914950 ?auto_914953 ) ) ( not ( = ?auto_914950 ?auto_914954 ) ) ( not ( = ?auto_914950 ?auto_914955 ) ) ( not ( = ?auto_914950 ?auto_914956 ) ) ( not ( = ?auto_914950 ?auto_914957 ) ) ( not ( = ?auto_914950 ?auto_914958 ) ) ( not ( = ?auto_914950 ?auto_914959 ) ) ( not ( = ?auto_914950 ?auto_914960 ) ) ( not ( = ?auto_914950 ?auto_914961 ) ) ( not ( = ?auto_914950 ?auto_914962 ) ) ( not ( = ?auto_914951 ?auto_914952 ) ) ( not ( = ?auto_914951 ?auto_914953 ) ) ( not ( = ?auto_914951 ?auto_914954 ) ) ( not ( = ?auto_914951 ?auto_914955 ) ) ( not ( = ?auto_914951 ?auto_914956 ) ) ( not ( = ?auto_914951 ?auto_914957 ) ) ( not ( = ?auto_914951 ?auto_914958 ) ) ( not ( = ?auto_914951 ?auto_914959 ) ) ( not ( = ?auto_914951 ?auto_914960 ) ) ( not ( = ?auto_914951 ?auto_914961 ) ) ( not ( = ?auto_914951 ?auto_914962 ) ) ( not ( = ?auto_914952 ?auto_914953 ) ) ( not ( = ?auto_914952 ?auto_914954 ) ) ( not ( = ?auto_914952 ?auto_914955 ) ) ( not ( = ?auto_914952 ?auto_914956 ) ) ( not ( = ?auto_914952 ?auto_914957 ) ) ( not ( = ?auto_914952 ?auto_914958 ) ) ( not ( = ?auto_914952 ?auto_914959 ) ) ( not ( = ?auto_914952 ?auto_914960 ) ) ( not ( = ?auto_914952 ?auto_914961 ) ) ( not ( = ?auto_914952 ?auto_914962 ) ) ( not ( = ?auto_914953 ?auto_914954 ) ) ( not ( = ?auto_914953 ?auto_914955 ) ) ( not ( = ?auto_914953 ?auto_914956 ) ) ( not ( = ?auto_914953 ?auto_914957 ) ) ( not ( = ?auto_914953 ?auto_914958 ) ) ( not ( = ?auto_914953 ?auto_914959 ) ) ( not ( = ?auto_914953 ?auto_914960 ) ) ( not ( = ?auto_914953 ?auto_914961 ) ) ( not ( = ?auto_914953 ?auto_914962 ) ) ( not ( = ?auto_914954 ?auto_914955 ) ) ( not ( = ?auto_914954 ?auto_914956 ) ) ( not ( = ?auto_914954 ?auto_914957 ) ) ( not ( = ?auto_914954 ?auto_914958 ) ) ( not ( = ?auto_914954 ?auto_914959 ) ) ( not ( = ?auto_914954 ?auto_914960 ) ) ( not ( = ?auto_914954 ?auto_914961 ) ) ( not ( = ?auto_914954 ?auto_914962 ) ) ( not ( = ?auto_914955 ?auto_914956 ) ) ( not ( = ?auto_914955 ?auto_914957 ) ) ( not ( = ?auto_914955 ?auto_914958 ) ) ( not ( = ?auto_914955 ?auto_914959 ) ) ( not ( = ?auto_914955 ?auto_914960 ) ) ( not ( = ?auto_914955 ?auto_914961 ) ) ( not ( = ?auto_914955 ?auto_914962 ) ) ( not ( = ?auto_914956 ?auto_914957 ) ) ( not ( = ?auto_914956 ?auto_914958 ) ) ( not ( = ?auto_914956 ?auto_914959 ) ) ( not ( = ?auto_914956 ?auto_914960 ) ) ( not ( = ?auto_914956 ?auto_914961 ) ) ( not ( = ?auto_914956 ?auto_914962 ) ) ( not ( = ?auto_914957 ?auto_914958 ) ) ( not ( = ?auto_914957 ?auto_914959 ) ) ( not ( = ?auto_914957 ?auto_914960 ) ) ( not ( = ?auto_914957 ?auto_914961 ) ) ( not ( = ?auto_914957 ?auto_914962 ) ) ( not ( = ?auto_914958 ?auto_914959 ) ) ( not ( = ?auto_914958 ?auto_914960 ) ) ( not ( = ?auto_914958 ?auto_914961 ) ) ( not ( = ?auto_914958 ?auto_914962 ) ) ( not ( = ?auto_914959 ?auto_914960 ) ) ( not ( = ?auto_914959 ?auto_914961 ) ) ( not ( = ?auto_914959 ?auto_914962 ) ) ( not ( = ?auto_914960 ?auto_914961 ) ) ( not ( = ?auto_914960 ?auto_914962 ) ) ( not ( = ?auto_914961 ?auto_914962 ) ) ( ON ?auto_914960 ?auto_914961 ) ( ON ?auto_914959 ?auto_914960 ) ( ON ?auto_914958 ?auto_914959 ) ( ON ?auto_914957 ?auto_914958 ) ( ON ?auto_914956 ?auto_914957 ) ( ON ?auto_914955 ?auto_914956 ) ( ON ?auto_914954 ?auto_914955 ) ( ON ?auto_914953 ?auto_914954 ) ( CLEAR ?auto_914951 ) ( ON ?auto_914952 ?auto_914953 ) ( CLEAR ?auto_914952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_914944 ?auto_914945 ?auto_914946 ?auto_914947 ?auto_914948 ?auto_914949 ?auto_914950 ?auto_914951 ?auto_914952 )
      ( MAKE-18PILE ?auto_914944 ?auto_914945 ?auto_914946 ?auto_914947 ?auto_914948 ?auto_914949 ?auto_914950 ?auto_914951 ?auto_914952 ?auto_914953 ?auto_914954 ?auto_914955 ?auto_914956 ?auto_914957 ?auto_914958 ?auto_914959 ?auto_914960 ?auto_914961 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_914981 - BLOCK
      ?auto_914982 - BLOCK
      ?auto_914983 - BLOCK
      ?auto_914984 - BLOCK
      ?auto_914985 - BLOCK
      ?auto_914986 - BLOCK
      ?auto_914987 - BLOCK
      ?auto_914988 - BLOCK
      ?auto_914989 - BLOCK
      ?auto_914990 - BLOCK
      ?auto_914991 - BLOCK
      ?auto_914992 - BLOCK
      ?auto_914993 - BLOCK
      ?auto_914994 - BLOCK
      ?auto_914995 - BLOCK
      ?auto_914996 - BLOCK
      ?auto_914997 - BLOCK
      ?auto_914998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_914998 ) ( ON-TABLE ?auto_914981 ) ( ON ?auto_914982 ?auto_914981 ) ( ON ?auto_914983 ?auto_914982 ) ( ON ?auto_914984 ?auto_914983 ) ( ON ?auto_914985 ?auto_914984 ) ( ON ?auto_914986 ?auto_914985 ) ( ON ?auto_914987 ?auto_914986 ) ( ON ?auto_914988 ?auto_914987 ) ( not ( = ?auto_914981 ?auto_914982 ) ) ( not ( = ?auto_914981 ?auto_914983 ) ) ( not ( = ?auto_914981 ?auto_914984 ) ) ( not ( = ?auto_914981 ?auto_914985 ) ) ( not ( = ?auto_914981 ?auto_914986 ) ) ( not ( = ?auto_914981 ?auto_914987 ) ) ( not ( = ?auto_914981 ?auto_914988 ) ) ( not ( = ?auto_914981 ?auto_914989 ) ) ( not ( = ?auto_914981 ?auto_914990 ) ) ( not ( = ?auto_914981 ?auto_914991 ) ) ( not ( = ?auto_914981 ?auto_914992 ) ) ( not ( = ?auto_914981 ?auto_914993 ) ) ( not ( = ?auto_914981 ?auto_914994 ) ) ( not ( = ?auto_914981 ?auto_914995 ) ) ( not ( = ?auto_914981 ?auto_914996 ) ) ( not ( = ?auto_914981 ?auto_914997 ) ) ( not ( = ?auto_914981 ?auto_914998 ) ) ( not ( = ?auto_914982 ?auto_914983 ) ) ( not ( = ?auto_914982 ?auto_914984 ) ) ( not ( = ?auto_914982 ?auto_914985 ) ) ( not ( = ?auto_914982 ?auto_914986 ) ) ( not ( = ?auto_914982 ?auto_914987 ) ) ( not ( = ?auto_914982 ?auto_914988 ) ) ( not ( = ?auto_914982 ?auto_914989 ) ) ( not ( = ?auto_914982 ?auto_914990 ) ) ( not ( = ?auto_914982 ?auto_914991 ) ) ( not ( = ?auto_914982 ?auto_914992 ) ) ( not ( = ?auto_914982 ?auto_914993 ) ) ( not ( = ?auto_914982 ?auto_914994 ) ) ( not ( = ?auto_914982 ?auto_914995 ) ) ( not ( = ?auto_914982 ?auto_914996 ) ) ( not ( = ?auto_914982 ?auto_914997 ) ) ( not ( = ?auto_914982 ?auto_914998 ) ) ( not ( = ?auto_914983 ?auto_914984 ) ) ( not ( = ?auto_914983 ?auto_914985 ) ) ( not ( = ?auto_914983 ?auto_914986 ) ) ( not ( = ?auto_914983 ?auto_914987 ) ) ( not ( = ?auto_914983 ?auto_914988 ) ) ( not ( = ?auto_914983 ?auto_914989 ) ) ( not ( = ?auto_914983 ?auto_914990 ) ) ( not ( = ?auto_914983 ?auto_914991 ) ) ( not ( = ?auto_914983 ?auto_914992 ) ) ( not ( = ?auto_914983 ?auto_914993 ) ) ( not ( = ?auto_914983 ?auto_914994 ) ) ( not ( = ?auto_914983 ?auto_914995 ) ) ( not ( = ?auto_914983 ?auto_914996 ) ) ( not ( = ?auto_914983 ?auto_914997 ) ) ( not ( = ?auto_914983 ?auto_914998 ) ) ( not ( = ?auto_914984 ?auto_914985 ) ) ( not ( = ?auto_914984 ?auto_914986 ) ) ( not ( = ?auto_914984 ?auto_914987 ) ) ( not ( = ?auto_914984 ?auto_914988 ) ) ( not ( = ?auto_914984 ?auto_914989 ) ) ( not ( = ?auto_914984 ?auto_914990 ) ) ( not ( = ?auto_914984 ?auto_914991 ) ) ( not ( = ?auto_914984 ?auto_914992 ) ) ( not ( = ?auto_914984 ?auto_914993 ) ) ( not ( = ?auto_914984 ?auto_914994 ) ) ( not ( = ?auto_914984 ?auto_914995 ) ) ( not ( = ?auto_914984 ?auto_914996 ) ) ( not ( = ?auto_914984 ?auto_914997 ) ) ( not ( = ?auto_914984 ?auto_914998 ) ) ( not ( = ?auto_914985 ?auto_914986 ) ) ( not ( = ?auto_914985 ?auto_914987 ) ) ( not ( = ?auto_914985 ?auto_914988 ) ) ( not ( = ?auto_914985 ?auto_914989 ) ) ( not ( = ?auto_914985 ?auto_914990 ) ) ( not ( = ?auto_914985 ?auto_914991 ) ) ( not ( = ?auto_914985 ?auto_914992 ) ) ( not ( = ?auto_914985 ?auto_914993 ) ) ( not ( = ?auto_914985 ?auto_914994 ) ) ( not ( = ?auto_914985 ?auto_914995 ) ) ( not ( = ?auto_914985 ?auto_914996 ) ) ( not ( = ?auto_914985 ?auto_914997 ) ) ( not ( = ?auto_914985 ?auto_914998 ) ) ( not ( = ?auto_914986 ?auto_914987 ) ) ( not ( = ?auto_914986 ?auto_914988 ) ) ( not ( = ?auto_914986 ?auto_914989 ) ) ( not ( = ?auto_914986 ?auto_914990 ) ) ( not ( = ?auto_914986 ?auto_914991 ) ) ( not ( = ?auto_914986 ?auto_914992 ) ) ( not ( = ?auto_914986 ?auto_914993 ) ) ( not ( = ?auto_914986 ?auto_914994 ) ) ( not ( = ?auto_914986 ?auto_914995 ) ) ( not ( = ?auto_914986 ?auto_914996 ) ) ( not ( = ?auto_914986 ?auto_914997 ) ) ( not ( = ?auto_914986 ?auto_914998 ) ) ( not ( = ?auto_914987 ?auto_914988 ) ) ( not ( = ?auto_914987 ?auto_914989 ) ) ( not ( = ?auto_914987 ?auto_914990 ) ) ( not ( = ?auto_914987 ?auto_914991 ) ) ( not ( = ?auto_914987 ?auto_914992 ) ) ( not ( = ?auto_914987 ?auto_914993 ) ) ( not ( = ?auto_914987 ?auto_914994 ) ) ( not ( = ?auto_914987 ?auto_914995 ) ) ( not ( = ?auto_914987 ?auto_914996 ) ) ( not ( = ?auto_914987 ?auto_914997 ) ) ( not ( = ?auto_914987 ?auto_914998 ) ) ( not ( = ?auto_914988 ?auto_914989 ) ) ( not ( = ?auto_914988 ?auto_914990 ) ) ( not ( = ?auto_914988 ?auto_914991 ) ) ( not ( = ?auto_914988 ?auto_914992 ) ) ( not ( = ?auto_914988 ?auto_914993 ) ) ( not ( = ?auto_914988 ?auto_914994 ) ) ( not ( = ?auto_914988 ?auto_914995 ) ) ( not ( = ?auto_914988 ?auto_914996 ) ) ( not ( = ?auto_914988 ?auto_914997 ) ) ( not ( = ?auto_914988 ?auto_914998 ) ) ( not ( = ?auto_914989 ?auto_914990 ) ) ( not ( = ?auto_914989 ?auto_914991 ) ) ( not ( = ?auto_914989 ?auto_914992 ) ) ( not ( = ?auto_914989 ?auto_914993 ) ) ( not ( = ?auto_914989 ?auto_914994 ) ) ( not ( = ?auto_914989 ?auto_914995 ) ) ( not ( = ?auto_914989 ?auto_914996 ) ) ( not ( = ?auto_914989 ?auto_914997 ) ) ( not ( = ?auto_914989 ?auto_914998 ) ) ( not ( = ?auto_914990 ?auto_914991 ) ) ( not ( = ?auto_914990 ?auto_914992 ) ) ( not ( = ?auto_914990 ?auto_914993 ) ) ( not ( = ?auto_914990 ?auto_914994 ) ) ( not ( = ?auto_914990 ?auto_914995 ) ) ( not ( = ?auto_914990 ?auto_914996 ) ) ( not ( = ?auto_914990 ?auto_914997 ) ) ( not ( = ?auto_914990 ?auto_914998 ) ) ( not ( = ?auto_914991 ?auto_914992 ) ) ( not ( = ?auto_914991 ?auto_914993 ) ) ( not ( = ?auto_914991 ?auto_914994 ) ) ( not ( = ?auto_914991 ?auto_914995 ) ) ( not ( = ?auto_914991 ?auto_914996 ) ) ( not ( = ?auto_914991 ?auto_914997 ) ) ( not ( = ?auto_914991 ?auto_914998 ) ) ( not ( = ?auto_914992 ?auto_914993 ) ) ( not ( = ?auto_914992 ?auto_914994 ) ) ( not ( = ?auto_914992 ?auto_914995 ) ) ( not ( = ?auto_914992 ?auto_914996 ) ) ( not ( = ?auto_914992 ?auto_914997 ) ) ( not ( = ?auto_914992 ?auto_914998 ) ) ( not ( = ?auto_914993 ?auto_914994 ) ) ( not ( = ?auto_914993 ?auto_914995 ) ) ( not ( = ?auto_914993 ?auto_914996 ) ) ( not ( = ?auto_914993 ?auto_914997 ) ) ( not ( = ?auto_914993 ?auto_914998 ) ) ( not ( = ?auto_914994 ?auto_914995 ) ) ( not ( = ?auto_914994 ?auto_914996 ) ) ( not ( = ?auto_914994 ?auto_914997 ) ) ( not ( = ?auto_914994 ?auto_914998 ) ) ( not ( = ?auto_914995 ?auto_914996 ) ) ( not ( = ?auto_914995 ?auto_914997 ) ) ( not ( = ?auto_914995 ?auto_914998 ) ) ( not ( = ?auto_914996 ?auto_914997 ) ) ( not ( = ?auto_914996 ?auto_914998 ) ) ( not ( = ?auto_914997 ?auto_914998 ) ) ( ON ?auto_914997 ?auto_914998 ) ( ON ?auto_914996 ?auto_914997 ) ( ON ?auto_914995 ?auto_914996 ) ( ON ?auto_914994 ?auto_914995 ) ( ON ?auto_914993 ?auto_914994 ) ( ON ?auto_914992 ?auto_914993 ) ( ON ?auto_914991 ?auto_914992 ) ( ON ?auto_914990 ?auto_914991 ) ( CLEAR ?auto_914988 ) ( ON ?auto_914989 ?auto_914990 ) ( CLEAR ?auto_914989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_914981 ?auto_914982 ?auto_914983 ?auto_914984 ?auto_914985 ?auto_914986 ?auto_914987 ?auto_914988 ?auto_914989 )
      ( MAKE-18PILE ?auto_914981 ?auto_914982 ?auto_914983 ?auto_914984 ?auto_914985 ?auto_914986 ?auto_914987 ?auto_914988 ?auto_914989 ?auto_914990 ?auto_914991 ?auto_914992 ?auto_914993 ?auto_914994 ?auto_914995 ?auto_914996 ?auto_914997 ?auto_914998 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915017 - BLOCK
      ?auto_915018 - BLOCK
      ?auto_915019 - BLOCK
      ?auto_915020 - BLOCK
      ?auto_915021 - BLOCK
      ?auto_915022 - BLOCK
      ?auto_915023 - BLOCK
      ?auto_915024 - BLOCK
      ?auto_915025 - BLOCK
      ?auto_915026 - BLOCK
      ?auto_915027 - BLOCK
      ?auto_915028 - BLOCK
      ?auto_915029 - BLOCK
      ?auto_915030 - BLOCK
      ?auto_915031 - BLOCK
      ?auto_915032 - BLOCK
      ?auto_915033 - BLOCK
      ?auto_915034 - BLOCK
    )
    :vars
    (
      ?auto_915035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915034 ?auto_915035 ) ( ON-TABLE ?auto_915017 ) ( ON ?auto_915018 ?auto_915017 ) ( ON ?auto_915019 ?auto_915018 ) ( ON ?auto_915020 ?auto_915019 ) ( ON ?auto_915021 ?auto_915020 ) ( ON ?auto_915022 ?auto_915021 ) ( ON ?auto_915023 ?auto_915022 ) ( not ( = ?auto_915017 ?auto_915018 ) ) ( not ( = ?auto_915017 ?auto_915019 ) ) ( not ( = ?auto_915017 ?auto_915020 ) ) ( not ( = ?auto_915017 ?auto_915021 ) ) ( not ( = ?auto_915017 ?auto_915022 ) ) ( not ( = ?auto_915017 ?auto_915023 ) ) ( not ( = ?auto_915017 ?auto_915024 ) ) ( not ( = ?auto_915017 ?auto_915025 ) ) ( not ( = ?auto_915017 ?auto_915026 ) ) ( not ( = ?auto_915017 ?auto_915027 ) ) ( not ( = ?auto_915017 ?auto_915028 ) ) ( not ( = ?auto_915017 ?auto_915029 ) ) ( not ( = ?auto_915017 ?auto_915030 ) ) ( not ( = ?auto_915017 ?auto_915031 ) ) ( not ( = ?auto_915017 ?auto_915032 ) ) ( not ( = ?auto_915017 ?auto_915033 ) ) ( not ( = ?auto_915017 ?auto_915034 ) ) ( not ( = ?auto_915017 ?auto_915035 ) ) ( not ( = ?auto_915018 ?auto_915019 ) ) ( not ( = ?auto_915018 ?auto_915020 ) ) ( not ( = ?auto_915018 ?auto_915021 ) ) ( not ( = ?auto_915018 ?auto_915022 ) ) ( not ( = ?auto_915018 ?auto_915023 ) ) ( not ( = ?auto_915018 ?auto_915024 ) ) ( not ( = ?auto_915018 ?auto_915025 ) ) ( not ( = ?auto_915018 ?auto_915026 ) ) ( not ( = ?auto_915018 ?auto_915027 ) ) ( not ( = ?auto_915018 ?auto_915028 ) ) ( not ( = ?auto_915018 ?auto_915029 ) ) ( not ( = ?auto_915018 ?auto_915030 ) ) ( not ( = ?auto_915018 ?auto_915031 ) ) ( not ( = ?auto_915018 ?auto_915032 ) ) ( not ( = ?auto_915018 ?auto_915033 ) ) ( not ( = ?auto_915018 ?auto_915034 ) ) ( not ( = ?auto_915018 ?auto_915035 ) ) ( not ( = ?auto_915019 ?auto_915020 ) ) ( not ( = ?auto_915019 ?auto_915021 ) ) ( not ( = ?auto_915019 ?auto_915022 ) ) ( not ( = ?auto_915019 ?auto_915023 ) ) ( not ( = ?auto_915019 ?auto_915024 ) ) ( not ( = ?auto_915019 ?auto_915025 ) ) ( not ( = ?auto_915019 ?auto_915026 ) ) ( not ( = ?auto_915019 ?auto_915027 ) ) ( not ( = ?auto_915019 ?auto_915028 ) ) ( not ( = ?auto_915019 ?auto_915029 ) ) ( not ( = ?auto_915019 ?auto_915030 ) ) ( not ( = ?auto_915019 ?auto_915031 ) ) ( not ( = ?auto_915019 ?auto_915032 ) ) ( not ( = ?auto_915019 ?auto_915033 ) ) ( not ( = ?auto_915019 ?auto_915034 ) ) ( not ( = ?auto_915019 ?auto_915035 ) ) ( not ( = ?auto_915020 ?auto_915021 ) ) ( not ( = ?auto_915020 ?auto_915022 ) ) ( not ( = ?auto_915020 ?auto_915023 ) ) ( not ( = ?auto_915020 ?auto_915024 ) ) ( not ( = ?auto_915020 ?auto_915025 ) ) ( not ( = ?auto_915020 ?auto_915026 ) ) ( not ( = ?auto_915020 ?auto_915027 ) ) ( not ( = ?auto_915020 ?auto_915028 ) ) ( not ( = ?auto_915020 ?auto_915029 ) ) ( not ( = ?auto_915020 ?auto_915030 ) ) ( not ( = ?auto_915020 ?auto_915031 ) ) ( not ( = ?auto_915020 ?auto_915032 ) ) ( not ( = ?auto_915020 ?auto_915033 ) ) ( not ( = ?auto_915020 ?auto_915034 ) ) ( not ( = ?auto_915020 ?auto_915035 ) ) ( not ( = ?auto_915021 ?auto_915022 ) ) ( not ( = ?auto_915021 ?auto_915023 ) ) ( not ( = ?auto_915021 ?auto_915024 ) ) ( not ( = ?auto_915021 ?auto_915025 ) ) ( not ( = ?auto_915021 ?auto_915026 ) ) ( not ( = ?auto_915021 ?auto_915027 ) ) ( not ( = ?auto_915021 ?auto_915028 ) ) ( not ( = ?auto_915021 ?auto_915029 ) ) ( not ( = ?auto_915021 ?auto_915030 ) ) ( not ( = ?auto_915021 ?auto_915031 ) ) ( not ( = ?auto_915021 ?auto_915032 ) ) ( not ( = ?auto_915021 ?auto_915033 ) ) ( not ( = ?auto_915021 ?auto_915034 ) ) ( not ( = ?auto_915021 ?auto_915035 ) ) ( not ( = ?auto_915022 ?auto_915023 ) ) ( not ( = ?auto_915022 ?auto_915024 ) ) ( not ( = ?auto_915022 ?auto_915025 ) ) ( not ( = ?auto_915022 ?auto_915026 ) ) ( not ( = ?auto_915022 ?auto_915027 ) ) ( not ( = ?auto_915022 ?auto_915028 ) ) ( not ( = ?auto_915022 ?auto_915029 ) ) ( not ( = ?auto_915022 ?auto_915030 ) ) ( not ( = ?auto_915022 ?auto_915031 ) ) ( not ( = ?auto_915022 ?auto_915032 ) ) ( not ( = ?auto_915022 ?auto_915033 ) ) ( not ( = ?auto_915022 ?auto_915034 ) ) ( not ( = ?auto_915022 ?auto_915035 ) ) ( not ( = ?auto_915023 ?auto_915024 ) ) ( not ( = ?auto_915023 ?auto_915025 ) ) ( not ( = ?auto_915023 ?auto_915026 ) ) ( not ( = ?auto_915023 ?auto_915027 ) ) ( not ( = ?auto_915023 ?auto_915028 ) ) ( not ( = ?auto_915023 ?auto_915029 ) ) ( not ( = ?auto_915023 ?auto_915030 ) ) ( not ( = ?auto_915023 ?auto_915031 ) ) ( not ( = ?auto_915023 ?auto_915032 ) ) ( not ( = ?auto_915023 ?auto_915033 ) ) ( not ( = ?auto_915023 ?auto_915034 ) ) ( not ( = ?auto_915023 ?auto_915035 ) ) ( not ( = ?auto_915024 ?auto_915025 ) ) ( not ( = ?auto_915024 ?auto_915026 ) ) ( not ( = ?auto_915024 ?auto_915027 ) ) ( not ( = ?auto_915024 ?auto_915028 ) ) ( not ( = ?auto_915024 ?auto_915029 ) ) ( not ( = ?auto_915024 ?auto_915030 ) ) ( not ( = ?auto_915024 ?auto_915031 ) ) ( not ( = ?auto_915024 ?auto_915032 ) ) ( not ( = ?auto_915024 ?auto_915033 ) ) ( not ( = ?auto_915024 ?auto_915034 ) ) ( not ( = ?auto_915024 ?auto_915035 ) ) ( not ( = ?auto_915025 ?auto_915026 ) ) ( not ( = ?auto_915025 ?auto_915027 ) ) ( not ( = ?auto_915025 ?auto_915028 ) ) ( not ( = ?auto_915025 ?auto_915029 ) ) ( not ( = ?auto_915025 ?auto_915030 ) ) ( not ( = ?auto_915025 ?auto_915031 ) ) ( not ( = ?auto_915025 ?auto_915032 ) ) ( not ( = ?auto_915025 ?auto_915033 ) ) ( not ( = ?auto_915025 ?auto_915034 ) ) ( not ( = ?auto_915025 ?auto_915035 ) ) ( not ( = ?auto_915026 ?auto_915027 ) ) ( not ( = ?auto_915026 ?auto_915028 ) ) ( not ( = ?auto_915026 ?auto_915029 ) ) ( not ( = ?auto_915026 ?auto_915030 ) ) ( not ( = ?auto_915026 ?auto_915031 ) ) ( not ( = ?auto_915026 ?auto_915032 ) ) ( not ( = ?auto_915026 ?auto_915033 ) ) ( not ( = ?auto_915026 ?auto_915034 ) ) ( not ( = ?auto_915026 ?auto_915035 ) ) ( not ( = ?auto_915027 ?auto_915028 ) ) ( not ( = ?auto_915027 ?auto_915029 ) ) ( not ( = ?auto_915027 ?auto_915030 ) ) ( not ( = ?auto_915027 ?auto_915031 ) ) ( not ( = ?auto_915027 ?auto_915032 ) ) ( not ( = ?auto_915027 ?auto_915033 ) ) ( not ( = ?auto_915027 ?auto_915034 ) ) ( not ( = ?auto_915027 ?auto_915035 ) ) ( not ( = ?auto_915028 ?auto_915029 ) ) ( not ( = ?auto_915028 ?auto_915030 ) ) ( not ( = ?auto_915028 ?auto_915031 ) ) ( not ( = ?auto_915028 ?auto_915032 ) ) ( not ( = ?auto_915028 ?auto_915033 ) ) ( not ( = ?auto_915028 ?auto_915034 ) ) ( not ( = ?auto_915028 ?auto_915035 ) ) ( not ( = ?auto_915029 ?auto_915030 ) ) ( not ( = ?auto_915029 ?auto_915031 ) ) ( not ( = ?auto_915029 ?auto_915032 ) ) ( not ( = ?auto_915029 ?auto_915033 ) ) ( not ( = ?auto_915029 ?auto_915034 ) ) ( not ( = ?auto_915029 ?auto_915035 ) ) ( not ( = ?auto_915030 ?auto_915031 ) ) ( not ( = ?auto_915030 ?auto_915032 ) ) ( not ( = ?auto_915030 ?auto_915033 ) ) ( not ( = ?auto_915030 ?auto_915034 ) ) ( not ( = ?auto_915030 ?auto_915035 ) ) ( not ( = ?auto_915031 ?auto_915032 ) ) ( not ( = ?auto_915031 ?auto_915033 ) ) ( not ( = ?auto_915031 ?auto_915034 ) ) ( not ( = ?auto_915031 ?auto_915035 ) ) ( not ( = ?auto_915032 ?auto_915033 ) ) ( not ( = ?auto_915032 ?auto_915034 ) ) ( not ( = ?auto_915032 ?auto_915035 ) ) ( not ( = ?auto_915033 ?auto_915034 ) ) ( not ( = ?auto_915033 ?auto_915035 ) ) ( not ( = ?auto_915034 ?auto_915035 ) ) ( ON ?auto_915033 ?auto_915034 ) ( ON ?auto_915032 ?auto_915033 ) ( ON ?auto_915031 ?auto_915032 ) ( ON ?auto_915030 ?auto_915031 ) ( ON ?auto_915029 ?auto_915030 ) ( ON ?auto_915028 ?auto_915029 ) ( ON ?auto_915027 ?auto_915028 ) ( ON ?auto_915026 ?auto_915027 ) ( ON ?auto_915025 ?auto_915026 ) ( CLEAR ?auto_915023 ) ( ON ?auto_915024 ?auto_915025 ) ( CLEAR ?auto_915024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_915017 ?auto_915018 ?auto_915019 ?auto_915020 ?auto_915021 ?auto_915022 ?auto_915023 ?auto_915024 )
      ( MAKE-18PILE ?auto_915017 ?auto_915018 ?auto_915019 ?auto_915020 ?auto_915021 ?auto_915022 ?auto_915023 ?auto_915024 ?auto_915025 ?auto_915026 ?auto_915027 ?auto_915028 ?auto_915029 ?auto_915030 ?auto_915031 ?auto_915032 ?auto_915033 ?auto_915034 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915054 - BLOCK
      ?auto_915055 - BLOCK
      ?auto_915056 - BLOCK
      ?auto_915057 - BLOCK
      ?auto_915058 - BLOCK
      ?auto_915059 - BLOCK
      ?auto_915060 - BLOCK
      ?auto_915061 - BLOCK
      ?auto_915062 - BLOCK
      ?auto_915063 - BLOCK
      ?auto_915064 - BLOCK
      ?auto_915065 - BLOCK
      ?auto_915066 - BLOCK
      ?auto_915067 - BLOCK
      ?auto_915068 - BLOCK
      ?auto_915069 - BLOCK
      ?auto_915070 - BLOCK
      ?auto_915071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915071 ) ( ON-TABLE ?auto_915054 ) ( ON ?auto_915055 ?auto_915054 ) ( ON ?auto_915056 ?auto_915055 ) ( ON ?auto_915057 ?auto_915056 ) ( ON ?auto_915058 ?auto_915057 ) ( ON ?auto_915059 ?auto_915058 ) ( ON ?auto_915060 ?auto_915059 ) ( not ( = ?auto_915054 ?auto_915055 ) ) ( not ( = ?auto_915054 ?auto_915056 ) ) ( not ( = ?auto_915054 ?auto_915057 ) ) ( not ( = ?auto_915054 ?auto_915058 ) ) ( not ( = ?auto_915054 ?auto_915059 ) ) ( not ( = ?auto_915054 ?auto_915060 ) ) ( not ( = ?auto_915054 ?auto_915061 ) ) ( not ( = ?auto_915054 ?auto_915062 ) ) ( not ( = ?auto_915054 ?auto_915063 ) ) ( not ( = ?auto_915054 ?auto_915064 ) ) ( not ( = ?auto_915054 ?auto_915065 ) ) ( not ( = ?auto_915054 ?auto_915066 ) ) ( not ( = ?auto_915054 ?auto_915067 ) ) ( not ( = ?auto_915054 ?auto_915068 ) ) ( not ( = ?auto_915054 ?auto_915069 ) ) ( not ( = ?auto_915054 ?auto_915070 ) ) ( not ( = ?auto_915054 ?auto_915071 ) ) ( not ( = ?auto_915055 ?auto_915056 ) ) ( not ( = ?auto_915055 ?auto_915057 ) ) ( not ( = ?auto_915055 ?auto_915058 ) ) ( not ( = ?auto_915055 ?auto_915059 ) ) ( not ( = ?auto_915055 ?auto_915060 ) ) ( not ( = ?auto_915055 ?auto_915061 ) ) ( not ( = ?auto_915055 ?auto_915062 ) ) ( not ( = ?auto_915055 ?auto_915063 ) ) ( not ( = ?auto_915055 ?auto_915064 ) ) ( not ( = ?auto_915055 ?auto_915065 ) ) ( not ( = ?auto_915055 ?auto_915066 ) ) ( not ( = ?auto_915055 ?auto_915067 ) ) ( not ( = ?auto_915055 ?auto_915068 ) ) ( not ( = ?auto_915055 ?auto_915069 ) ) ( not ( = ?auto_915055 ?auto_915070 ) ) ( not ( = ?auto_915055 ?auto_915071 ) ) ( not ( = ?auto_915056 ?auto_915057 ) ) ( not ( = ?auto_915056 ?auto_915058 ) ) ( not ( = ?auto_915056 ?auto_915059 ) ) ( not ( = ?auto_915056 ?auto_915060 ) ) ( not ( = ?auto_915056 ?auto_915061 ) ) ( not ( = ?auto_915056 ?auto_915062 ) ) ( not ( = ?auto_915056 ?auto_915063 ) ) ( not ( = ?auto_915056 ?auto_915064 ) ) ( not ( = ?auto_915056 ?auto_915065 ) ) ( not ( = ?auto_915056 ?auto_915066 ) ) ( not ( = ?auto_915056 ?auto_915067 ) ) ( not ( = ?auto_915056 ?auto_915068 ) ) ( not ( = ?auto_915056 ?auto_915069 ) ) ( not ( = ?auto_915056 ?auto_915070 ) ) ( not ( = ?auto_915056 ?auto_915071 ) ) ( not ( = ?auto_915057 ?auto_915058 ) ) ( not ( = ?auto_915057 ?auto_915059 ) ) ( not ( = ?auto_915057 ?auto_915060 ) ) ( not ( = ?auto_915057 ?auto_915061 ) ) ( not ( = ?auto_915057 ?auto_915062 ) ) ( not ( = ?auto_915057 ?auto_915063 ) ) ( not ( = ?auto_915057 ?auto_915064 ) ) ( not ( = ?auto_915057 ?auto_915065 ) ) ( not ( = ?auto_915057 ?auto_915066 ) ) ( not ( = ?auto_915057 ?auto_915067 ) ) ( not ( = ?auto_915057 ?auto_915068 ) ) ( not ( = ?auto_915057 ?auto_915069 ) ) ( not ( = ?auto_915057 ?auto_915070 ) ) ( not ( = ?auto_915057 ?auto_915071 ) ) ( not ( = ?auto_915058 ?auto_915059 ) ) ( not ( = ?auto_915058 ?auto_915060 ) ) ( not ( = ?auto_915058 ?auto_915061 ) ) ( not ( = ?auto_915058 ?auto_915062 ) ) ( not ( = ?auto_915058 ?auto_915063 ) ) ( not ( = ?auto_915058 ?auto_915064 ) ) ( not ( = ?auto_915058 ?auto_915065 ) ) ( not ( = ?auto_915058 ?auto_915066 ) ) ( not ( = ?auto_915058 ?auto_915067 ) ) ( not ( = ?auto_915058 ?auto_915068 ) ) ( not ( = ?auto_915058 ?auto_915069 ) ) ( not ( = ?auto_915058 ?auto_915070 ) ) ( not ( = ?auto_915058 ?auto_915071 ) ) ( not ( = ?auto_915059 ?auto_915060 ) ) ( not ( = ?auto_915059 ?auto_915061 ) ) ( not ( = ?auto_915059 ?auto_915062 ) ) ( not ( = ?auto_915059 ?auto_915063 ) ) ( not ( = ?auto_915059 ?auto_915064 ) ) ( not ( = ?auto_915059 ?auto_915065 ) ) ( not ( = ?auto_915059 ?auto_915066 ) ) ( not ( = ?auto_915059 ?auto_915067 ) ) ( not ( = ?auto_915059 ?auto_915068 ) ) ( not ( = ?auto_915059 ?auto_915069 ) ) ( not ( = ?auto_915059 ?auto_915070 ) ) ( not ( = ?auto_915059 ?auto_915071 ) ) ( not ( = ?auto_915060 ?auto_915061 ) ) ( not ( = ?auto_915060 ?auto_915062 ) ) ( not ( = ?auto_915060 ?auto_915063 ) ) ( not ( = ?auto_915060 ?auto_915064 ) ) ( not ( = ?auto_915060 ?auto_915065 ) ) ( not ( = ?auto_915060 ?auto_915066 ) ) ( not ( = ?auto_915060 ?auto_915067 ) ) ( not ( = ?auto_915060 ?auto_915068 ) ) ( not ( = ?auto_915060 ?auto_915069 ) ) ( not ( = ?auto_915060 ?auto_915070 ) ) ( not ( = ?auto_915060 ?auto_915071 ) ) ( not ( = ?auto_915061 ?auto_915062 ) ) ( not ( = ?auto_915061 ?auto_915063 ) ) ( not ( = ?auto_915061 ?auto_915064 ) ) ( not ( = ?auto_915061 ?auto_915065 ) ) ( not ( = ?auto_915061 ?auto_915066 ) ) ( not ( = ?auto_915061 ?auto_915067 ) ) ( not ( = ?auto_915061 ?auto_915068 ) ) ( not ( = ?auto_915061 ?auto_915069 ) ) ( not ( = ?auto_915061 ?auto_915070 ) ) ( not ( = ?auto_915061 ?auto_915071 ) ) ( not ( = ?auto_915062 ?auto_915063 ) ) ( not ( = ?auto_915062 ?auto_915064 ) ) ( not ( = ?auto_915062 ?auto_915065 ) ) ( not ( = ?auto_915062 ?auto_915066 ) ) ( not ( = ?auto_915062 ?auto_915067 ) ) ( not ( = ?auto_915062 ?auto_915068 ) ) ( not ( = ?auto_915062 ?auto_915069 ) ) ( not ( = ?auto_915062 ?auto_915070 ) ) ( not ( = ?auto_915062 ?auto_915071 ) ) ( not ( = ?auto_915063 ?auto_915064 ) ) ( not ( = ?auto_915063 ?auto_915065 ) ) ( not ( = ?auto_915063 ?auto_915066 ) ) ( not ( = ?auto_915063 ?auto_915067 ) ) ( not ( = ?auto_915063 ?auto_915068 ) ) ( not ( = ?auto_915063 ?auto_915069 ) ) ( not ( = ?auto_915063 ?auto_915070 ) ) ( not ( = ?auto_915063 ?auto_915071 ) ) ( not ( = ?auto_915064 ?auto_915065 ) ) ( not ( = ?auto_915064 ?auto_915066 ) ) ( not ( = ?auto_915064 ?auto_915067 ) ) ( not ( = ?auto_915064 ?auto_915068 ) ) ( not ( = ?auto_915064 ?auto_915069 ) ) ( not ( = ?auto_915064 ?auto_915070 ) ) ( not ( = ?auto_915064 ?auto_915071 ) ) ( not ( = ?auto_915065 ?auto_915066 ) ) ( not ( = ?auto_915065 ?auto_915067 ) ) ( not ( = ?auto_915065 ?auto_915068 ) ) ( not ( = ?auto_915065 ?auto_915069 ) ) ( not ( = ?auto_915065 ?auto_915070 ) ) ( not ( = ?auto_915065 ?auto_915071 ) ) ( not ( = ?auto_915066 ?auto_915067 ) ) ( not ( = ?auto_915066 ?auto_915068 ) ) ( not ( = ?auto_915066 ?auto_915069 ) ) ( not ( = ?auto_915066 ?auto_915070 ) ) ( not ( = ?auto_915066 ?auto_915071 ) ) ( not ( = ?auto_915067 ?auto_915068 ) ) ( not ( = ?auto_915067 ?auto_915069 ) ) ( not ( = ?auto_915067 ?auto_915070 ) ) ( not ( = ?auto_915067 ?auto_915071 ) ) ( not ( = ?auto_915068 ?auto_915069 ) ) ( not ( = ?auto_915068 ?auto_915070 ) ) ( not ( = ?auto_915068 ?auto_915071 ) ) ( not ( = ?auto_915069 ?auto_915070 ) ) ( not ( = ?auto_915069 ?auto_915071 ) ) ( not ( = ?auto_915070 ?auto_915071 ) ) ( ON ?auto_915070 ?auto_915071 ) ( ON ?auto_915069 ?auto_915070 ) ( ON ?auto_915068 ?auto_915069 ) ( ON ?auto_915067 ?auto_915068 ) ( ON ?auto_915066 ?auto_915067 ) ( ON ?auto_915065 ?auto_915066 ) ( ON ?auto_915064 ?auto_915065 ) ( ON ?auto_915063 ?auto_915064 ) ( ON ?auto_915062 ?auto_915063 ) ( CLEAR ?auto_915060 ) ( ON ?auto_915061 ?auto_915062 ) ( CLEAR ?auto_915061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_915054 ?auto_915055 ?auto_915056 ?auto_915057 ?auto_915058 ?auto_915059 ?auto_915060 ?auto_915061 )
      ( MAKE-18PILE ?auto_915054 ?auto_915055 ?auto_915056 ?auto_915057 ?auto_915058 ?auto_915059 ?auto_915060 ?auto_915061 ?auto_915062 ?auto_915063 ?auto_915064 ?auto_915065 ?auto_915066 ?auto_915067 ?auto_915068 ?auto_915069 ?auto_915070 ?auto_915071 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915090 - BLOCK
      ?auto_915091 - BLOCK
      ?auto_915092 - BLOCK
      ?auto_915093 - BLOCK
      ?auto_915094 - BLOCK
      ?auto_915095 - BLOCK
      ?auto_915096 - BLOCK
      ?auto_915097 - BLOCK
      ?auto_915098 - BLOCK
      ?auto_915099 - BLOCK
      ?auto_915100 - BLOCK
      ?auto_915101 - BLOCK
      ?auto_915102 - BLOCK
      ?auto_915103 - BLOCK
      ?auto_915104 - BLOCK
      ?auto_915105 - BLOCK
      ?auto_915106 - BLOCK
      ?auto_915107 - BLOCK
    )
    :vars
    (
      ?auto_915108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915107 ?auto_915108 ) ( ON-TABLE ?auto_915090 ) ( ON ?auto_915091 ?auto_915090 ) ( ON ?auto_915092 ?auto_915091 ) ( ON ?auto_915093 ?auto_915092 ) ( ON ?auto_915094 ?auto_915093 ) ( ON ?auto_915095 ?auto_915094 ) ( not ( = ?auto_915090 ?auto_915091 ) ) ( not ( = ?auto_915090 ?auto_915092 ) ) ( not ( = ?auto_915090 ?auto_915093 ) ) ( not ( = ?auto_915090 ?auto_915094 ) ) ( not ( = ?auto_915090 ?auto_915095 ) ) ( not ( = ?auto_915090 ?auto_915096 ) ) ( not ( = ?auto_915090 ?auto_915097 ) ) ( not ( = ?auto_915090 ?auto_915098 ) ) ( not ( = ?auto_915090 ?auto_915099 ) ) ( not ( = ?auto_915090 ?auto_915100 ) ) ( not ( = ?auto_915090 ?auto_915101 ) ) ( not ( = ?auto_915090 ?auto_915102 ) ) ( not ( = ?auto_915090 ?auto_915103 ) ) ( not ( = ?auto_915090 ?auto_915104 ) ) ( not ( = ?auto_915090 ?auto_915105 ) ) ( not ( = ?auto_915090 ?auto_915106 ) ) ( not ( = ?auto_915090 ?auto_915107 ) ) ( not ( = ?auto_915090 ?auto_915108 ) ) ( not ( = ?auto_915091 ?auto_915092 ) ) ( not ( = ?auto_915091 ?auto_915093 ) ) ( not ( = ?auto_915091 ?auto_915094 ) ) ( not ( = ?auto_915091 ?auto_915095 ) ) ( not ( = ?auto_915091 ?auto_915096 ) ) ( not ( = ?auto_915091 ?auto_915097 ) ) ( not ( = ?auto_915091 ?auto_915098 ) ) ( not ( = ?auto_915091 ?auto_915099 ) ) ( not ( = ?auto_915091 ?auto_915100 ) ) ( not ( = ?auto_915091 ?auto_915101 ) ) ( not ( = ?auto_915091 ?auto_915102 ) ) ( not ( = ?auto_915091 ?auto_915103 ) ) ( not ( = ?auto_915091 ?auto_915104 ) ) ( not ( = ?auto_915091 ?auto_915105 ) ) ( not ( = ?auto_915091 ?auto_915106 ) ) ( not ( = ?auto_915091 ?auto_915107 ) ) ( not ( = ?auto_915091 ?auto_915108 ) ) ( not ( = ?auto_915092 ?auto_915093 ) ) ( not ( = ?auto_915092 ?auto_915094 ) ) ( not ( = ?auto_915092 ?auto_915095 ) ) ( not ( = ?auto_915092 ?auto_915096 ) ) ( not ( = ?auto_915092 ?auto_915097 ) ) ( not ( = ?auto_915092 ?auto_915098 ) ) ( not ( = ?auto_915092 ?auto_915099 ) ) ( not ( = ?auto_915092 ?auto_915100 ) ) ( not ( = ?auto_915092 ?auto_915101 ) ) ( not ( = ?auto_915092 ?auto_915102 ) ) ( not ( = ?auto_915092 ?auto_915103 ) ) ( not ( = ?auto_915092 ?auto_915104 ) ) ( not ( = ?auto_915092 ?auto_915105 ) ) ( not ( = ?auto_915092 ?auto_915106 ) ) ( not ( = ?auto_915092 ?auto_915107 ) ) ( not ( = ?auto_915092 ?auto_915108 ) ) ( not ( = ?auto_915093 ?auto_915094 ) ) ( not ( = ?auto_915093 ?auto_915095 ) ) ( not ( = ?auto_915093 ?auto_915096 ) ) ( not ( = ?auto_915093 ?auto_915097 ) ) ( not ( = ?auto_915093 ?auto_915098 ) ) ( not ( = ?auto_915093 ?auto_915099 ) ) ( not ( = ?auto_915093 ?auto_915100 ) ) ( not ( = ?auto_915093 ?auto_915101 ) ) ( not ( = ?auto_915093 ?auto_915102 ) ) ( not ( = ?auto_915093 ?auto_915103 ) ) ( not ( = ?auto_915093 ?auto_915104 ) ) ( not ( = ?auto_915093 ?auto_915105 ) ) ( not ( = ?auto_915093 ?auto_915106 ) ) ( not ( = ?auto_915093 ?auto_915107 ) ) ( not ( = ?auto_915093 ?auto_915108 ) ) ( not ( = ?auto_915094 ?auto_915095 ) ) ( not ( = ?auto_915094 ?auto_915096 ) ) ( not ( = ?auto_915094 ?auto_915097 ) ) ( not ( = ?auto_915094 ?auto_915098 ) ) ( not ( = ?auto_915094 ?auto_915099 ) ) ( not ( = ?auto_915094 ?auto_915100 ) ) ( not ( = ?auto_915094 ?auto_915101 ) ) ( not ( = ?auto_915094 ?auto_915102 ) ) ( not ( = ?auto_915094 ?auto_915103 ) ) ( not ( = ?auto_915094 ?auto_915104 ) ) ( not ( = ?auto_915094 ?auto_915105 ) ) ( not ( = ?auto_915094 ?auto_915106 ) ) ( not ( = ?auto_915094 ?auto_915107 ) ) ( not ( = ?auto_915094 ?auto_915108 ) ) ( not ( = ?auto_915095 ?auto_915096 ) ) ( not ( = ?auto_915095 ?auto_915097 ) ) ( not ( = ?auto_915095 ?auto_915098 ) ) ( not ( = ?auto_915095 ?auto_915099 ) ) ( not ( = ?auto_915095 ?auto_915100 ) ) ( not ( = ?auto_915095 ?auto_915101 ) ) ( not ( = ?auto_915095 ?auto_915102 ) ) ( not ( = ?auto_915095 ?auto_915103 ) ) ( not ( = ?auto_915095 ?auto_915104 ) ) ( not ( = ?auto_915095 ?auto_915105 ) ) ( not ( = ?auto_915095 ?auto_915106 ) ) ( not ( = ?auto_915095 ?auto_915107 ) ) ( not ( = ?auto_915095 ?auto_915108 ) ) ( not ( = ?auto_915096 ?auto_915097 ) ) ( not ( = ?auto_915096 ?auto_915098 ) ) ( not ( = ?auto_915096 ?auto_915099 ) ) ( not ( = ?auto_915096 ?auto_915100 ) ) ( not ( = ?auto_915096 ?auto_915101 ) ) ( not ( = ?auto_915096 ?auto_915102 ) ) ( not ( = ?auto_915096 ?auto_915103 ) ) ( not ( = ?auto_915096 ?auto_915104 ) ) ( not ( = ?auto_915096 ?auto_915105 ) ) ( not ( = ?auto_915096 ?auto_915106 ) ) ( not ( = ?auto_915096 ?auto_915107 ) ) ( not ( = ?auto_915096 ?auto_915108 ) ) ( not ( = ?auto_915097 ?auto_915098 ) ) ( not ( = ?auto_915097 ?auto_915099 ) ) ( not ( = ?auto_915097 ?auto_915100 ) ) ( not ( = ?auto_915097 ?auto_915101 ) ) ( not ( = ?auto_915097 ?auto_915102 ) ) ( not ( = ?auto_915097 ?auto_915103 ) ) ( not ( = ?auto_915097 ?auto_915104 ) ) ( not ( = ?auto_915097 ?auto_915105 ) ) ( not ( = ?auto_915097 ?auto_915106 ) ) ( not ( = ?auto_915097 ?auto_915107 ) ) ( not ( = ?auto_915097 ?auto_915108 ) ) ( not ( = ?auto_915098 ?auto_915099 ) ) ( not ( = ?auto_915098 ?auto_915100 ) ) ( not ( = ?auto_915098 ?auto_915101 ) ) ( not ( = ?auto_915098 ?auto_915102 ) ) ( not ( = ?auto_915098 ?auto_915103 ) ) ( not ( = ?auto_915098 ?auto_915104 ) ) ( not ( = ?auto_915098 ?auto_915105 ) ) ( not ( = ?auto_915098 ?auto_915106 ) ) ( not ( = ?auto_915098 ?auto_915107 ) ) ( not ( = ?auto_915098 ?auto_915108 ) ) ( not ( = ?auto_915099 ?auto_915100 ) ) ( not ( = ?auto_915099 ?auto_915101 ) ) ( not ( = ?auto_915099 ?auto_915102 ) ) ( not ( = ?auto_915099 ?auto_915103 ) ) ( not ( = ?auto_915099 ?auto_915104 ) ) ( not ( = ?auto_915099 ?auto_915105 ) ) ( not ( = ?auto_915099 ?auto_915106 ) ) ( not ( = ?auto_915099 ?auto_915107 ) ) ( not ( = ?auto_915099 ?auto_915108 ) ) ( not ( = ?auto_915100 ?auto_915101 ) ) ( not ( = ?auto_915100 ?auto_915102 ) ) ( not ( = ?auto_915100 ?auto_915103 ) ) ( not ( = ?auto_915100 ?auto_915104 ) ) ( not ( = ?auto_915100 ?auto_915105 ) ) ( not ( = ?auto_915100 ?auto_915106 ) ) ( not ( = ?auto_915100 ?auto_915107 ) ) ( not ( = ?auto_915100 ?auto_915108 ) ) ( not ( = ?auto_915101 ?auto_915102 ) ) ( not ( = ?auto_915101 ?auto_915103 ) ) ( not ( = ?auto_915101 ?auto_915104 ) ) ( not ( = ?auto_915101 ?auto_915105 ) ) ( not ( = ?auto_915101 ?auto_915106 ) ) ( not ( = ?auto_915101 ?auto_915107 ) ) ( not ( = ?auto_915101 ?auto_915108 ) ) ( not ( = ?auto_915102 ?auto_915103 ) ) ( not ( = ?auto_915102 ?auto_915104 ) ) ( not ( = ?auto_915102 ?auto_915105 ) ) ( not ( = ?auto_915102 ?auto_915106 ) ) ( not ( = ?auto_915102 ?auto_915107 ) ) ( not ( = ?auto_915102 ?auto_915108 ) ) ( not ( = ?auto_915103 ?auto_915104 ) ) ( not ( = ?auto_915103 ?auto_915105 ) ) ( not ( = ?auto_915103 ?auto_915106 ) ) ( not ( = ?auto_915103 ?auto_915107 ) ) ( not ( = ?auto_915103 ?auto_915108 ) ) ( not ( = ?auto_915104 ?auto_915105 ) ) ( not ( = ?auto_915104 ?auto_915106 ) ) ( not ( = ?auto_915104 ?auto_915107 ) ) ( not ( = ?auto_915104 ?auto_915108 ) ) ( not ( = ?auto_915105 ?auto_915106 ) ) ( not ( = ?auto_915105 ?auto_915107 ) ) ( not ( = ?auto_915105 ?auto_915108 ) ) ( not ( = ?auto_915106 ?auto_915107 ) ) ( not ( = ?auto_915106 ?auto_915108 ) ) ( not ( = ?auto_915107 ?auto_915108 ) ) ( ON ?auto_915106 ?auto_915107 ) ( ON ?auto_915105 ?auto_915106 ) ( ON ?auto_915104 ?auto_915105 ) ( ON ?auto_915103 ?auto_915104 ) ( ON ?auto_915102 ?auto_915103 ) ( ON ?auto_915101 ?auto_915102 ) ( ON ?auto_915100 ?auto_915101 ) ( ON ?auto_915099 ?auto_915100 ) ( ON ?auto_915098 ?auto_915099 ) ( ON ?auto_915097 ?auto_915098 ) ( CLEAR ?auto_915095 ) ( ON ?auto_915096 ?auto_915097 ) ( CLEAR ?auto_915096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_915090 ?auto_915091 ?auto_915092 ?auto_915093 ?auto_915094 ?auto_915095 ?auto_915096 )
      ( MAKE-18PILE ?auto_915090 ?auto_915091 ?auto_915092 ?auto_915093 ?auto_915094 ?auto_915095 ?auto_915096 ?auto_915097 ?auto_915098 ?auto_915099 ?auto_915100 ?auto_915101 ?auto_915102 ?auto_915103 ?auto_915104 ?auto_915105 ?auto_915106 ?auto_915107 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915127 - BLOCK
      ?auto_915128 - BLOCK
      ?auto_915129 - BLOCK
      ?auto_915130 - BLOCK
      ?auto_915131 - BLOCK
      ?auto_915132 - BLOCK
      ?auto_915133 - BLOCK
      ?auto_915134 - BLOCK
      ?auto_915135 - BLOCK
      ?auto_915136 - BLOCK
      ?auto_915137 - BLOCK
      ?auto_915138 - BLOCK
      ?auto_915139 - BLOCK
      ?auto_915140 - BLOCK
      ?auto_915141 - BLOCK
      ?auto_915142 - BLOCK
      ?auto_915143 - BLOCK
      ?auto_915144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915144 ) ( ON-TABLE ?auto_915127 ) ( ON ?auto_915128 ?auto_915127 ) ( ON ?auto_915129 ?auto_915128 ) ( ON ?auto_915130 ?auto_915129 ) ( ON ?auto_915131 ?auto_915130 ) ( ON ?auto_915132 ?auto_915131 ) ( not ( = ?auto_915127 ?auto_915128 ) ) ( not ( = ?auto_915127 ?auto_915129 ) ) ( not ( = ?auto_915127 ?auto_915130 ) ) ( not ( = ?auto_915127 ?auto_915131 ) ) ( not ( = ?auto_915127 ?auto_915132 ) ) ( not ( = ?auto_915127 ?auto_915133 ) ) ( not ( = ?auto_915127 ?auto_915134 ) ) ( not ( = ?auto_915127 ?auto_915135 ) ) ( not ( = ?auto_915127 ?auto_915136 ) ) ( not ( = ?auto_915127 ?auto_915137 ) ) ( not ( = ?auto_915127 ?auto_915138 ) ) ( not ( = ?auto_915127 ?auto_915139 ) ) ( not ( = ?auto_915127 ?auto_915140 ) ) ( not ( = ?auto_915127 ?auto_915141 ) ) ( not ( = ?auto_915127 ?auto_915142 ) ) ( not ( = ?auto_915127 ?auto_915143 ) ) ( not ( = ?auto_915127 ?auto_915144 ) ) ( not ( = ?auto_915128 ?auto_915129 ) ) ( not ( = ?auto_915128 ?auto_915130 ) ) ( not ( = ?auto_915128 ?auto_915131 ) ) ( not ( = ?auto_915128 ?auto_915132 ) ) ( not ( = ?auto_915128 ?auto_915133 ) ) ( not ( = ?auto_915128 ?auto_915134 ) ) ( not ( = ?auto_915128 ?auto_915135 ) ) ( not ( = ?auto_915128 ?auto_915136 ) ) ( not ( = ?auto_915128 ?auto_915137 ) ) ( not ( = ?auto_915128 ?auto_915138 ) ) ( not ( = ?auto_915128 ?auto_915139 ) ) ( not ( = ?auto_915128 ?auto_915140 ) ) ( not ( = ?auto_915128 ?auto_915141 ) ) ( not ( = ?auto_915128 ?auto_915142 ) ) ( not ( = ?auto_915128 ?auto_915143 ) ) ( not ( = ?auto_915128 ?auto_915144 ) ) ( not ( = ?auto_915129 ?auto_915130 ) ) ( not ( = ?auto_915129 ?auto_915131 ) ) ( not ( = ?auto_915129 ?auto_915132 ) ) ( not ( = ?auto_915129 ?auto_915133 ) ) ( not ( = ?auto_915129 ?auto_915134 ) ) ( not ( = ?auto_915129 ?auto_915135 ) ) ( not ( = ?auto_915129 ?auto_915136 ) ) ( not ( = ?auto_915129 ?auto_915137 ) ) ( not ( = ?auto_915129 ?auto_915138 ) ) ( not ( = ?auto_915129 ?auto_915139 ) ) ( not ( = ?auto_915129 ?auto_915140 ) ) ( not ( = ?auto_915129 ?auto_915141 ) ) ( not ( = ?auto_915129 ?auto_915142 ) ) ( not ( = ?auto_915129 ?auto_915143 ) ) ( not ( = ?auto_915129 ?auto_915144 ) ) ( not ( = ?auto_915130 ?auto_915131 ) ) ( not ( = ?auto_915130 ?auto_915132 ) ) ( not ( = ?auto_915130 ?auto_915133 ) ) ( not ( = ?auto_915130 ?auto_915134 ) ) ( not ( = ?auto_915130 ?auto_915135 ) ) ( not ( = ?auto_915130 ?auto_915136 ) ) ( not ( = ?auto_915130 ?auto_915137 ) ) ( not ( = ?auto_915130 ?auto_915138 ) ) ( not ( = ?auto_915130 ?auto_915139 ) ) ( not ( = ?auto_915130 ?auto_915140 ) ) ( not ( = ?auto_915130 ?auto_915141 ) ) ( not ( = ?auto_915130 ?auto_915142 ) ) ( not ( = ?auto_915130 ?auto_915143 ) ) ( not ( = ?auto_915130 ?auto_915144 ) ) ( not ( = ?auto_915131 ?auto_915132 ) ) ( not ( = ?auto_915131 ?auto_915133 ) ) ( not ( = ?auto_915131 ?auto_915134 ) ) ( not ( = ?auto_915131 ?auto_915135 ) ) ( not ( = ?auto_915131 ?auto_915136 ) ) ( not ( = ?auto_915131 ?auto_915137 ) ) ( not ( = ?auto_915131 ?auto_915138 ) ) ( not ( = ?auto_915131 ?auto_915139 ) ) ( not ( = ?auto_915131 ?auto_915140 ) ) ( not ( = ?auto_915131 ?auto_915141 ) ) ( not ( = ?auto_915131 ?auto_915142 ) ) ( not ( = ?auto_915131 ?auto_915143 ) ) ( not ( = ?auto_915131 ?auto_915144 ) ) ( not ( = ?auto_915132 ?auto_915133 ) ) ( not ( = ?auto_915132 ?auto_915134 ) ) ( not ( = ?auto_915132 ?auto_915135 ) ) ( not ( = ?auto_915132 ?auto_915136 ) ) ( not ( = ?auto_915132 ?auto_915137 ) ) ( not ( = ?auto_915132 ?auto_915138 ) ) ( not ( = ?auto_915132 ?auto_915139 ) ) ( not ( = ?auto_915132 ?auto_915140 ) ) ( not ( = ?auto_915132 ?auto_915141 ) ) ( not ( = ?auto_915132 ?auto_915142 ) ) ( not ( = ?auto_915132 ?auto_915143 ) ) ( not ( = ?auto_915132 ?auto_915144 ) ) ( not ( = ?auto_915133 ?auto_915134 ) ) ( not ( = ?auto_915133 ?auto_915135 ) ) ( not ( = ?auto_915133 ?auto_915136 ) ) ( not ( = ?auto_915133 ?auto_915137 ) ) ( not ( = ?auto_915133 ?auto_915138 ) ) ( not ( = ?auto_915133 ?auto_915139 ) ) ( not ( = ?auto_915133 ?auto_915140 ) ) ( not ( = ?auto_915133 ?auto_915141 ) ) ( not ( = ?auto_915133 ?auto_915142 ) ) ( not ( = ?auto_915133 ?auto_915143 ) ) ( not ( = ?auto_915133 ?auto_915144 ) ) ( not ( = ?auto_915134 ?auto_915135 ) ) ( not ( = ?auto_915134 ?auto_915136 ) ) ( not ( = ?auto_915134 ?auto_915137 ) ) ( not ( = ?auto_915134 ?auto_915138 ) ) ( not ( = ?auto_915134 ?auto_915139 ) ) ( not ( = ?auto_915134 ?auto_915140 ) ) ( not ( = ?auto_915134 ?auto_915141 ) ) ( not ( = ?auto_915134 ?auto_915142 ) ) ( not ( = ?auto_915134 ?auto_915143 ) ) ( not ( = ?auto_915134 ?auto_915144 ) ) ( not ( = ?auto_915135 ?auto_915136 ) ) ( not ( = ?auto_915135 ?auto_915137 ) ) ( not ( = ?auto_915135 ?auto_915138 ) ) ( not ( = ?auto_915135 ?auto_915139 ) ) ( not ( = ?auto_915135 ?auto_915140 ) ) ( not ( = ?auto_915135 ?auto_915141 ) ) ( not ( = ?auto_915135 ?auto_915142 ) ) ( not ( = ?auto_915135 ?auto_915143 ) ) ( not ( = ?auto_915135 ?auto_915144 ) ) ( not ( = ?auto_915136 ?auto_915137 ) ) ( not ( = ?auto_915136 ?auto_915138 ) ) ( not ( = ?auto_915136 ?auto_915139 ) ) ( not ( = ?auto_915136 ?auto_915140 ) ) ( not ( = ?auto_915136 ?auto_915141 ) ) ( not ( = ?auto_915136 ?auto_915142 ) ) ( not ( = ?auto_915136 ?auto_915143 ) ) ( not ( = ?auto_915136 ?auto_915144 ) ) ( not ( = ?auto_915137 ?auto_915138 ) ) ( not ( = ?auto_915137 ?auto_915139 ) ) ( not ( = ?auto_915137 ?auto_915140 ) ) ( not ( = ?auto_915137 ?auto_915141 ) ) ( not ( = ?auto_915137 ?auto_915142 ) ) ( not ( = ?auto_915137 ?auto_915143 ) ) ( not ( = ?auto_915137 ?auto_915144 ) ) ( not ( = ?auto_915138 ?auto_915139 ) ) ( not ( = ?auto_915138 ?auto_915140 ) ) ( not ( = ?auto_915138 ?auto_915141 ) ) ( not ( = ?auto_915138 ?auto_915142 ) ) ( not ( = ?auto_915138 ?auto_915143 ) ) ( not ( = ?auto_915138 ?auto_915144 ) ) ( not ( = ?auto_915139 ?auto_915140 ) ) ( not ( = ?auto_915139 ?auto_915141 ) ) ( not ( = ?auto_915139 ?auto_915142 ) ) ( not ( = ?auto_915139 ?auto_915143 ) ) ( not ( = ?auto_915139 ?auto_915144 ) ) ( not ( = ?auto_915140 ?auto_915141 ) ) ( not ( = ?auto_915140 ?auto_915142 ) ) ( not ( = ?auto_915140 ?auto_915143 ) ) ( not ( = ?auto_915140 ?auto_915144 ) ) ( not ( = ?auto_915141 ?auto_915142 ) ) ( not ( = ?auto_915141 ?auto_915143 ) ) ( not ( = ?auto_915141 ?auto_915144 ) ) ( not ( = ?auto_915142 ?auto_915143 ) ) ( not ( = ?auto_915142 ?auto_915144 ) ) ( not ( = ?auto_915143 ?auto_915144 ) ) ( ON ?auto_915143 ?auto_915144 ) ( ON ?auto_915142 ?auto_915143 ) ( ON ?auto_915141 ?auto_915142 ) ( ON ?auto_915140 ?auto_915141 ) ( ON ?auto_915139 ?auto_915140 ) ( ON ?auto_915138 ?auto_915139 ) ( ON ?auto_915137 ?auto_915138 ) ( ON ?auto_915136 ?auto_915137 ) ( ON ?auto_915135 ?auto_915136 ) ( ON ?auto_915134 ?auto_915135 ) ( CLEAR ?auto_915132 ) ( ON ?auto_915133 ?auto_915134 ) ( CLEAR ?auto_915133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_915127 ?auto_915128 ?auto_915129 ?auto_915130 ?auto_915131 ?auto_915132 ?auto_915133 )
      ( MAKE-18PILE ?auto_915127 ?auto_915128 ?auto_915129 ?auto_915130 ?auto_915131 ?auto_915132 ?auto_915133 ?auto_915134 ?auto_915135 ?auto_915136 ?auto_915137 ?auto_915138 ?auto_915139 ?auto_915140 ?auto_915141 ?auto_915142 ?auto_915143 ?auto_915144 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915163 - BLOCK
      ?auto_915164 - BLOCK
      ?auto_915165 - BLOCK
      ?auto_915166 - BLOCK
      ?auto_915167 - BLOCK
      ?auto_915168 - BLOCK
      ?auto_915169 - BLOCK
      ?auto_915170 - BLOCK
      ?auto_915171 - BLOCK
      ?auto_915172 - BLOCK
      ?auto_915173 - BLOCK
      ?auto_915174 - BLOCK
      ?auto_915175 - BLOCK
      ?auto_915176 - BLOCK
      ?auto_915177 - BLOCK
      ?auto_915178 - BLOCK
      ?auto_915179 - BLOCK
      ?auto_915180 - BLOCK
    )
    :vars
    (
      ?auto_915181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915180 ?auto_915181 ) ( ON-TABLE ?auto_915163 ) ( ON ?auto_915164 ?auto_915163 ) ( ON ?auto_915165 ?auto_915164 ) ( ON ?auto_915166 ?auto_915165 ) ( ON ?auto_915167 ?auto_915166 ) ( not ( = ?auto_915163 ?auto_915164 ) ) ( not ( = ?auto_915163 ?auto_915165 ) ) ( not ( = ?auto_915163 ?auto_915166 ) ) ( not ( = ?auto_915163 ?auto_915167 ) ) ( not ( = ?auto_915163 ?auto_915168 ) ) ( not ( = ?auto_915163 ?auto_915169 ) ) ( not ( = ?auto_915163 ?auto_915170 ) ) ( not ( = ?auto_915163 ?auto_915171 ) ) ( not ( = ?auto_915163 ?auto_915172 ) ) ( not ( = ?auto_915163 ?auto_915173 ) ) ( not ( = ?auto_915163 ?auto_915174 ) ) ( not ( = ?auto_915163 ?auto_915175 ) ) ( not ( = ?auto_915163 ?auto_915176 ) ) ( not ( = ?auto_915163 ?auto_915177 ) ) ( not ( = ?auto_915163 ?auto_915178 ) ) ( not ( = ?auto_915163 ?auto_915179 ) ) ( not ( = ?auto_915163 ?auto_915180 ) ) ( not ( = ?auto_915163 ?auto_915181 ) ) ( not ( = ?auto_915164 ?auto_915165 ) ) ( not ( = ?auto_915164 ?auto_915166 ) ) ( not ( = ?auto_915164 ?auto_915167 ) ) ( not ( = ?auto_915164 ?auto_915168 ) ) ( not ( = ?auto_915164 ?auto_915169 ) ) ( not ( = ?auto_915164 ?auto_915170 ) ) ( not ( = ?auto_915164 ?auto_915171 ) ) ( not ( = ?auto_915164 ?auto_915172 ) ) ( not ( = ?auto_915164 ?auto_915173 ) ) ( not ( = ?auto_915164 ?auto_915174 ) ) ( not ( = ?auto_915164 ?auto_915175 ) ) ( not ( = ?auto_915164 ?auto_915176 ) ) ( not ( = ?auto_915164 ?auto_915177 ) ) ( not ( = ?auto_915164 ?auto_915178 ) ) ( not ( = ?auto_915164 ?auto_915179 ) ) ( not ( = ?auto_915164 ?auto_915180 ) ) ( not ( = ?auto_915164 ?auto_915181 ) ) ( not ( = ?auto_915165 ?auto_915166 ) ) ( not ( = ?auto_915165 ?auto_915167 ) ) ( not ( = ?auto_915165 ?auto_915168 ) ) ( not ( = ?auto_915165 ?auto_915169 ) ) ( not ( = ?auto_915165 ?auto_915170 ) ) ( not ( = ?auto_915165 ?auto_915171 ) ) ( not ( = ?auto_915165 ?auto_915172 ) ) ( not ( = ?auto_915165 ?auto_915173 ) ) ( not ( = ?auto_915165 ?auto_915174 ) ) ( not ( = ?auto_915165 ?auto_915175 ) ) ( not ( = ?auto_915165 ?auto_915176 ) ) ( not ( = ?auto_915165 ?auto_915177 ) ) ( not ( = ?auto_915165 ?auto_915178 ) ) ( not ( = ?auto_915165 ?auto_915179 ) ) ( not ( = ?auto_915165 ?auto_915180 ) ) ( not ( = ?auto_915165 ?auto_915181 ) ) ( not ( = ?auto_915166 ?auto_915167 ) ) ( not ( = ?auto_915166 ?auto_915168 ) ) ( not ( = ?auto_915166 ?auto_915169 ) ) ( not ( = ?auto_915166 ?auto_915170 ) ) ( not ( = ?auto_915166 ?auto_915171 ) ) ( not ( = ?auto_915166 ?auto_915172 ) ) ( not ( = ?auto_915166 ?auto_915173 ) ) ( not ( = ?auto_915166 ?auto_915174 ) ) ( not ( = ?auto_915166 ?auto_915175 ) ) ( not ( = ?auto_915166 ?auto_915176 ) ) ( not ( = ?auto_915166 ?auto_915177 ) ) ( not ( = ?auto_915166 ?auto_915178 ) ) ( not ( = ?auto_915166 ?auto_915179 ) ) ( not ( = ?auto_915166 ?auto_915180 ) ) ( not ( = ?auto_915166 ?auto_915181 ) ) ( not ( = ?auto_915167 ?auto_915168 ) ) ( not ( = ?auto_915167 ?auto_915169 ) ) ( not ( = ?auto_915167 ?auto_915170 ) ) ( not ( = ?auto_915167 ?auto_915171 ) ) ( not ( = ?auto_915167 ?auto_915172 ) ) ( not ( = ?auto_915167 ?auto_915173 ) ) ( not ( = ?auto_915167 ?auto_915174 ) ) ( not ( = ?auto_915167 ?auto_915175 ) ) ( not ( = ?auto_915167 ?auto_915176 ) ) ( not ( = ?auto_915167 ?auto_915177 ) ) ( not ( = ?auto_915167 ?auto_915178 ) ) ( not ( = ?auto_915167 ?auto_915179 ) ) ( not ( = ?auto_915167 ?auto_915180 ) ) ( not ( = ?auto_915167 ?auto_915181 ) ) ( not ( = ?auto_915168 ?auto_915169 ) ) ( not ( = ?auto_915168 ?auto_915170 ) ) ( not ( = ?auto_915168 ?auto_915171 ) ) ( not ( = ?auto_915168 ?auto_915172 ) ) ( not ( = ?auto_915168 ?auto_915173 ) ) ( not ( = ?auto_915168 ?auto_915174 ) ) ( not ( = ?auto_915168 ?auto_915175 ) ) ( not ( = ?auto_915168 ?auto_915176 ) ) ( not ( = ?auto_915168 ?auto_915177 ) ) ( not ( = ?auto_915168 ?auto_915178 ) ) ( not ( = ?auto_915168 ?auto_915179 ) ) ( not ( = ?auto_915168 ?auto_915180 ) ) ( not ( = ?auto_915168 ?auto_915181 ) ) ( not ( = ?auto_915169 ?auto_915170 ) ) ( not ( = ?auto_915169 ?auto_915171 ) ) ( not ( = ?auto_915169 ?auto_915172 ) ) ( not ( = ?auto_915169 ?auto_915173 ) ) ( not ( = ?auto_915169 ?auto_915174 ) ) ( not ( = ?auto_915169 ?auto_915175 ) ) ( not ( = ?auto_915169 ?auto_915176 ) ) ( not ( = ?auto_915169 ?auto_915177 ) ) ( not ( = ?auto_915169 ?auto_915178 ) ) ( not ( = ?auto_915169 ?auto_915179 ) ) ( not ( = ?auto_915169 ?auto_915180 ) ) ( not ( = ?auto_915169 ?auto_915181 ) ) ( not ( = ?auto_915170 ?auto_915171 ) ) ( not ( = ?auto_915170 ?auto_915172 ) ) ( not ( = ?auto_915170 ?auto_915173 ) ) ( not ( = ?auto_915170 ?auto_915174 ) ) ( not ( = ?auto_915170 ?auto_915175 ) ) ( not ( = ?auto_915170 ?auto_915176 ) ) ( not ( = ?auto_915170 ?auto_915177 ) ) ( not ( = ?auto_915170 ?auto_915178 ) ) ( not ( = ?auto_915170 ?auto_915179 ) ) ( not ( = ?auto_915170 ?auto_915180 ) ) ( not ( = ?auto_915170 ?auto_915181 ) ) ( not ( = ?auto_915171 ?auto_915172 ) ) ( not ( = ?auto_915171 ?auto_915173 ) ) ( not ( = ?auto_915171 ?auto_915174 ) ) ( not ( = ?auto_915171 ?auto_915175 ) ) ( not ( = ?auto_915171 ?auto_915176 ) ) ( not ( = ?auto_915171 ?auto_915177 ) ) ( not ( = ?auto_915171 ?auto_915178 ) ) ( not ( = ?auto_915171 ?auto_915179 ) ) ( not ( = ?auto_915171 ?auto_915180 ) ) ( not ( = ?auto_915171 ?auto_915181 ) ) ( not ( = ?auto_915172 ?auto_915173 ) ) ( not ( = ?auto_915172 ?auto_915174 ) ) ( not ( = ?auto_915172 ?auto_915175 ) ) ( not ( = ?auto_915172 ?auto_915176 ) ) ( not ( = ?auto_915172 ?auto_915177 ) ) ( not ( = ?auto_915172 ?auto_915178 ) ) ( not ( = ?auto_915172 ?auto_915179 ) ) ( not ( = ?auto_915172 ?auto_915180 ) ) ( not ( = ?auto_915172 ?auto_915181 ) ) ( not ( = ?auto_915173 ?auto_915174 ) ) ( not ( = ?auto_915173 ?auto_915175 ) ) ( not ( = ?auto_915173 ?auto_915176 ) ) ( not ( = ?auto_915173 ?auto_915177 ) ) ( not ( = ?auto_915173 ?auto_915178 ) ) ( not ( = ?auto_915173 ?auto_915179 ) ) ( not ( = ?auto_915173 ?auto_915180 ) ) ( not ( = ?auto_915173 ?auto_915181 ) ) ( not ( = ?auto_915174 ?auto_915175 ) ) ( not ( = ?auto_915174 ?auto_915176 ) ) ( not ( = ?auto_915174 ?auto_915177 ) ) ( not ( = ?auto_915174 ?auto_915178 ) ) ( not ( = ?auto_915174 ?auto_915179 ) ) ( not ( = ?auto_915174 ?auto_915180 ) ) ( not ( = ?auto_915174 ?auto_915181 ) ) ( not ( = ?auto_915175 ?auto_915176 ) ) ( not ( = ?auto_915175 ?auto_915177 ) ) ( not ( = ?auto_915175 ?auto_915178 ) ) ( not ( = ?auto_915175 ?auto_915179 ) ) ( not ( = ?auto_915175 ?auto_915180 ) ) ( not ( = ?auto_915175 ?auto_915181 ) ) ( not ( = ?auto_915176 ?auto_915177 ) ) ( not ( = ?auto_915176 ?auto_915178 ) ) ( not ( = ?auto_915176 ?auto_915179 ) ) ( not ( = ?auto_915176 ?auto_915180 ) ) ( not ( = ?auto_915176 ?auto_915181 ) ) ( not ( = ?auto_915177 ?auto_915178 ) ) ( not ( = ?auto_915177 ?auto_915179 ) ) ( not ( = ?auto_915177 ?auto_915180 ) ) ( not ( = ?auto_915177 ?auto_915181 ) ) ( not ( = ?auto_915178 ?auto_915179 ) ) ( not ( = ?auto_915178 ?auto_915180 ) ) ( not ( = ?auto_915178 ?auto_915181 ) ) ( not ( = ?auto_915179 ?auto_915180 ) ) ( not ( = ?auto_915179 ?auto_915181 ) ) ( not ( = ?auto_915180 ?auto_915181 ) ) ( ON ?auto_915179 ?auto_915180 ) ( ON ?auto_915178 ?auto_915179 ) ( ON ?auto_915177 ?auto_915178 ) ( ON ?auto_915176 ?auto_915177 ) ( ON ?auto_915175 ?auto_915176 ) ( ON ?auto_915174 ?auto_915175 ) ( ON ?auto_915173 ?auto_915174 ) ( ON ?auto_915172 ?auto_915173 ) ( ON ?auto_915171 ?auto_915172 ) ( ON ?auto_915170 ?auto_915171 ) ( ON ?auto_915169 ?auto_915170 ) ( CLEAR ?auto_915167 ) ( ON ?auto_915168 ?auto_915169 ) ( CLEAR ?auto_915168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_915163 ?auto_915164 ?auto_915165 ?auto_915166 ?auto_915167 ?auto_915168 )
      ( MAKE-18PILE ?auto_915163 ?auto_915164 ?auto_915165 ?auto_915166 ?auto_915167 ?auto_915168 ?auto_915169 ?auto_915170 ?auto_915171 ?auto_915172 ?auto_915173 ?auto_915174 ?auto_915175 ?auto_915176 ?auto_915177 ?auto_915178 ?auto_915179 ?auto_915180 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915200 - BLOCK
      ?auto_915201 - BLOCK
      ?auto_915202 - BLOCK
      ?auto_915203 - BLOCK
      ?auto_915204 - BLOCK
      ?auto_915205 - BLOCK
      ?auto_915206 - BLOCK
      ?auto_915207 - BLOCK
      ?auto_915208 - BLOCK
      ?auto_915209 - BLOCK
      ?auto_915210 - BLOCK
      ?auto_915211 - BLOCK
      ?auto_915212 - BLOCK
      ?auto_915213 - BLOCK
      ?auto_915214 - BLOCK
      ?auto_915215 - BLOCK
      ?auto_915216 - BLOCK
      ?auto_915217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915217 ) ( ON-TABLE ?auto_915200 ) ( ON ?auto_915201 ?auto_915200 ) ( ON ?auto_915202 ?auto_915201 ) ( ON ?auto_915203 ?auto_915202 ) ( ON ?auto_915204 ?auto_915203 ) ( not ( = ?auto_915200 ?auto_915201 ) ) ( not ( = ?auto_915200 ?auto_915202 ) ) ( not ( = ?auto_915200 ?auto_915203 ) ) ( not ( = ?auto_915200 ?auto_915204 ) ) ( not ( = ?auto_915200 ?auto_915205 ) ) ( not ( = ?auto_915200 ?auto_915206 ) ) ( not ( = ?auto_915200 ?auto_915207 ) ) ( not ( = ?auto_915200 ?auto_915208 ) ) ( not ( = ?auto_915200 ?auto_915209 ) ) ( not ( = ?auto_915200 ?auto_915210 ) ) ( not ( = ?auto_915200 ?auto_915211 ) ) ( not ( = ?auto_915200 ?auto_915212 ) ) ( not ( = ?auto_915200 ?auto_915213 ) ) ( not ( = ?auto_915200 ?auto_915214 ) ) ( not ( = ?auto_915200 ?auto_915215 ) ) ( not ( = ?auto_915200 ?auto_915216 ) ) ( not ( = ?auto_915200 ?auto_915217 ) ) ( not ( = ?auto_915201 ?auto_915202 ) ) ( not ( = ?auto_915201 ?auto_915203 ) ) ( not ( = ?auto_915201 ?auto_915204 ) ) ( not ( = ?auto_915201 ?auto_915205 ) ) ( not ( = ?auto_915201 ?auto_915206 ) ) ( not ( = ?auto_915201 ?auto_915207 ) ) ( not ( = ?auto_915201 ?auto_915208 ) ) ( not ( = ?auto_915201 ?auto_915209 ) ) ( not ( = ?auto_915201 ?auto_915210 ) ) ( not ( = ?auto_915201 ?auto_915211 ) ) ( not ( = ?auto_915201 ?auto_915212 ) ) ( not ( = ?auto_915201 ?auto_915213 ) ) ( not ( = ?auto_915201 ?auto_915214 ) ) ( not ( = ?auto_915201 ?auto_915215 ) ) ( not ( = ?auto_915201 ?auto_915216 ) ) ( not ( = ?auto_915201 ?auto_915217 ) ) ( not ( = ?auto_915202 ?auto_915203 ) ) ( not ( = ?auto_915202 ?auto_915204 ) ) ( not ( = ?auto_915202 ?auto_915205 ) ) ( not ( = ?auto_915202 ?auto_915206 ) ) ( not ( = ?auto_915202 ?auto_915207 ) ) ( not ( = ?auto_915202 ?auto_915208 ) ) ( not ( = ?auto_915202 ?auto_915209 ) ) ( not ( = ?auto_915202 ?auto_915210 ) ) ( not ( = ?auto_915202 ?auto_915211 ) ) ( not ( = ?auto_915202 ?auto_915212 ) ) ( not ( = ?auto_915202 ?auto_915213 ) ) ( not ( = ?auto_915202 ?auto_915214 ) ) ( not ( = ?auto_915202 ?auto_915215 ) ) ( not ( = ?auto_915202 ?auto_915216 ) ) ( not ( = ?auto_915202 ?auto_915217 ) ) ( not ( = ?auto_915203 ?auto_915204 ) ) ( not ( = ?auto_915203 ?auto_915205 ) ) ( not ( = ?auto_915203 ?auto_915206 ) ) ( not ( = ?auto_915203 ?auto_915207 ) ) ( not ( = ?auto_915203 ?auto_915208 ) ) ( not ( = ?auto_915203 ?auto_915209 ) ) ( not ( = ?auto_915203 ?auto_915210 ) ) ( not ( = ?auto_915203 ?auto_915211 ) ) ( not ( = ?auto_915203 ?auto_915212 ) ) ( not ( = ?auto_915203 ?auto_915213 ) ) ( not ( = ?auto_915203 ?auto_915214 ) ) ( not ( = ?auto_915203 ?auto_915215 ) ) ( not ( = ?auto_915203 ?auto_915216 ) ) ( not ( = ?auto_915203 ?auto_915217 ) ) ( not ( = ?auto_915204 ?auto_915205 ) ) ( not ( = ?auto_915204 ?auto_915206 ) ) ( not ( = ?auto_915204 ?auto_915207 ) ) ( not ( = ?auto_915204 ?auto_915208 ) ) ( not ( = ?auto_915204 ?auto_915209 ) ) ( not ( = ?auto_915204 ?auto_915210 ) ) ( not ( = ?auto_915204 ?auto_915211 ) ) ( not ( = ?auto_915204 ?auto_915212 ) ) ( not ( = ?auto_915204 ?auto_915213 ) ) ( not ( = ?auto_915204 ?auto_915214 ) ) ( not ( = ?auto_915204 ?auto_915215 ) ) ( not ( = ?auto_915204 ?auto_915216 ) ) ( not ( = ?auto_915204 ?auto_915217 ) ) ( not ( = ?auto_915205 ?auto_915206 ) ) ( not ( = ?auto_915205 ?auto_915207 ) ) ( not ( = ?auto_915205 ?auto_915208 ) ) ( not ( = ?auto_915205 ?auto_915209 ) ) ( not ( = ?auto_915205 ?auto_915210 ) ) ( not ( = ?auto_915205 ?auto_915211 ) ) ( not ( = ?auto_915205 ?auto_915212 ) ) ( not ( = ?auto_915205 ?auto_915213 ) ) ( not ( = ?auto_915205 ?auto_915214 ) ) ( not ( = ?auto_915205 ?auto_915215 ) ) ( not ( = ?auto_915205 ?auto_915216 ) ) ( not ( = ?auto_915205 ?auto_915217 ) ) ( not ( = ?auto_915206 ?auto_915207 ) ) ( not ( = ?auto_915206 ?auto_915208 ) ) ( not ( = ?auto_915206 ?auto_915209 ) ) ( not ( = ?auto_915206 ?auto_915210 ) ) ( not ( = ?auto_915206 ?auto_915211 ) ) ( not ( = ?auto_915206 ?auto_915212 ) ) ( not ( = ?auto_915206 ?auto_915213 ) ) ( not ( = ?auto_915206 ?auto_915214 ) ) ( not ( = ?auto_915206 ?auto_915215 ) ) ( not ( = ?auto_915206 ?auto_915216 ) ) ( not ( = ?auto_915206 ?auto_915217 ) ) ( not ( = ?auto_915207 ?auto_915208 ) ) ( not ( = ?auto_915207 ?auto_915209 ) ) ( not ( = ?auto_915207 ?auto_915210 ) ) ( not ( = ?auto_915207 ?auto_915211 ) ) ( not ( = ?auto_915207 ?auto_915212 ) ) ( not ( = ?auto_915207 ?auto_915213 ) ) ( not ( = ?auto_915207 ?auto_915214 ) ) ( not ( = ?auto_915207 ?auto_915215 ) ) ( not ( = ?auto_915207 ?auto_915216 ) ) ( not ( = ?auto_915207 ?auto_915217 ) ) ( not ( = ?auto_915208 ?auto_915209 ) ) ( not ( = ?auto_915208 ?auto_915210 ) ) ( not ( = ?auto_915208 ?auto_915211 ) ) ( not ( = ?auto_915208 ?auto_915212 ) ) ( not ( = ?auto_915208 ?auto_915213 ) ) ( not ( = ?auto_915208 ?auto_915214 ) ) ( not ( = ?auto_915208 ?auto_915215 ) ) ( not ( = ?auto_915208 ?auto_915216 ) ) ( not ( = ?auto_915208 ?auto_915217 ) ) ( not ( = ?auto_915209 ?auto_915210 ) ) ( not ( = ?auto_915209 ?auto_915211 ) ) ( not ( = ?auto_915209 ?auto_915212 ) ) ( not ( = ?auto_915209 ?auto_915213 ) ) ( not ( = ?auto_915209 ?auto_915214 ) ) ( not ( = ?auto_915209 ?auto_915215 ) ) ( not ( = ?auto_915209 ?auto_915216 ) ) ( not ( = ?auto_915209 ?auto_915217 ) ) ( not ( = ?auto_915210 ?auto_915211 ) ) ( not ( = ?auto_915210 ?auto_915212 ) ) ( not ( = ?auto_915210 ?auto_915213 ) ) ( not ( = ?auto_915210 ?auto_915214 ) ) ( not ( = ?auto_915210 ?auto_915215 ) ) ( not ( = ?auto_915210 ?auto_915216 ) ) ( not ( = ?auto_915210 ?auto_915217 ) ) ( not ( = ?auto_915211 ?auto_915212 ) ) ( not ( = ?auto_915211 ?auto_915213 ) ) ( not ( = ?auto_915211 ?auto_915214 ) ) ( not ( = ?auto_915211 ?auto_915215 ) ) ( not ( = ?auto_915211 ?auto_915216 ) ) ( not ( = ?auto_915211 ?auto_915217 ) ) ( not ( = ?auto_915212 ?auto_915213 ) ) ( not ( = ?auto_915212 ?auto_915214 ) ) ( not ( = ?auto_915212 ?auto_915215 ) ) ( not ( = ?auto_915212 ?auto_915216 ) ) ( not ( = ?auto_915212 ?auto_915217 ) ) ( not ( = ?auto_915213 ?auto_915214 ) ) ( not ( = ?auto_915213 ?auto_915215 ) ) ( not ( = ?auto_915213 ?auto_915216 ) ) ( not ( = ?auto_915213 ?auto_915217 ) ) ( not ( = ?auto_915214 ?auto_915215 ) ) ( not ( = ?auto_915214 ?auto_915216 ) ) ( not ( = ?auto_915214 ?auto_915217 ) ) ( not ( = ?auto_915215 ?auto_915216 ) ) ( not ( = ?auto_915215 ?auto_915217 ) ) ( not ( = ?auto_915216 ?auto_915217 ) ) ( ON ?auto_915216 ?auto_915217 ) ( ON ?auto_915215 ?auto_915216 ) ( ON ?auto_915214 ?auto_915215 ) ( ON ?auto_915213 ?auto_915214 ) ( ON ?auto_915212 ?auto_915213 ) ( ON ?auto_915211 ?auto_915212 ) ( ON ?auto_915210 ?auto_915211 ) ( ON ?auto_915209 ?auto_915210 ) ( ON ?auto_915208 ?auto_915209 ) ( ON ?auto_915207 ?auto_915208 ) ( ON ?auto_915206 ?auto_915207 ) ( CLEAR ?auto_915204 ) ( ON ?auto_915205 ?auto_915206 ) ( CLEAR ?auto_915205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_915200 ?auto_915201 ?auto_915202 ?auto_915203 ?auto_915204 ?auto_915205 )
      ( MAKE-18PILE ?auto_915200 ?auto_915201 ?auto_915202 ?auto_915203 ?auto_915204 ?auto_915205 ?auto_915206 ?auto_915207 ?auto_915208 ?auto_915209 ?auto_915210 ?auto_915211 ?auto_915212 ?auto_915213 ?auto_915214 ?auto_915215 ?auto_915216 ?auto_915217 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915236 - BLOCK
      ?auto_915237 - BLOCK
      ?auto_915238 - BLOCK
      ?auto_915239 - BLOCK
      ?auto_915240 - BLOCK
      ?auto_915241 - BLOCK
      ?auto_915242 - BLOCK
      ?auto_915243 - BLOCK
      ?auto_915244 - BLOCK
      ?auto_915245 - BLOCK
      ?auto_915246 - BLOCK
      ?auto_915247 - BLOCK
      ?auto_915248 - BLOCK
      ?auto_915249 - BLOCK
      ?auto_915250 - BLOCK
      ?auto_915251 - BLOCK
      ?auto_915252 - BLOCK
      ?auto_915253 - BLOCK
    )
    :vars
    (
      ?auto_915254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915253 ?auto_915254 ) ( ON-TABLE ?auto_915236 ) ( ON ?auto_915237 ?auto_915236 ) ( ON ?auto_915238 ?auto_915237 ) ( ON ?auto_915239 ?auto_915238 ) ( not ( = ?auto_915236 ?auto_915237 ) ) ( not ( = ?auto_915236 ?auto_915238 ) ) ( not ( = ?auto_915236 ?auto_915239 ) ) ( not ( = ?auto_915236 ?auto_915240 ) ) ( not ( = ?auto_915236 ?auto_915241 ) ) ( not ( = ?auto_915236 ?auto_915242 ) ) ( not ( = ?auto_915236 ?auto_915243 ) ) ( not ( = ?auto_915236 ?auto_915244 ) ) ( not ( = ?auto_915236 ?auto_915245 ) ) ( not ( = ?auto_915236 ?auto_915246 ) ) ( not ( = ?auto_915236 ?auto_915247 ) ) ( not ( = ?auto_915236 ?auto_915248 ) ) ( not ( = ?auto_915236 ?auto_915249 ) ) ( not ( = ?auto_915236 ?auto_915250 ) ) ( not ( = ?auto_915236 ?auto_915251 ) ) ( not ( = ?auto_915236 ?auto_915252 ) ) ( not ( = ?auto_915236 ?auto_915253 ) ) ( not ( = ?auto_915236 ?auto_915254 ) ) ( not ( = ?auto_915237 ?auto_915238 ) ) ( not ( = ?auto_915237 ?auto_915239 ) ) ( not ( = ?auto_915237 ?auto_915240 ) ) ( not ( = ?auto_915237 ?auto_915241 ) ) ( not ( = ?auto_915237 ?auto_915242 ) ) ( not ( = ?auto_915237 ?auto_915243 ) ) ( not ( = ?auto_915237 ?auto_915244 ) ) ( not ( = ?auto_915237 ?auto_915245 ) ) ( not ( = ?auto_915237 ?auto_915246 ) ) ( not ( = ?auto_915237 ?auto_915247 ) ) ( not ( = ?auto_915237 ?auto_915248 ) ) ( not ( = ?auto_915237 ?auto_915249 ) ) ( not ( = ?auto_915237 ?auto_915250 ) ) ( not ( = ?auto_915237 ?auto_915251 ) ) ( not ( = ?auto_915237 ?auto_915252 ) ) ( not ( = ?auto_915237 ?auto_915253 ) ) ( not ( = ?auto_915237 ?auto_915254 ) ) ( not ( = ?auto_915238 ?auto_915239 ) ) ( not ( = ?auto_915238 ?auto_915240 ) ) ( not ( = ?auto_915238 ?auto_915241 ) ) ( not ( = ?auto_915238 ?auto_915242 ) ) ( not ( = ?auto_915238 ?auto_915243 ) ) ( not ( = ?auto_915238 ?auto_915244 ) ) ( not ( = ?auto_915238 ?auto_915245 ) ) ( not ( = ?auto_915238 ?auto_915246 ) ) ( not ( = ?auto_915238 ?auto_915247 ) ) ( not ( = ?auto_915238 ?auto_915248 ) ) ( not ( = ?auto_915238 ?auto_915249 ) ) ( not ( = ?auto_915238 ?auto_915250 ) ) ( not ( = ?auto_915238 ?auto_915251 ) ) ( not ( = ?auto_915238 ?auto_915252 ) ) ( not ( = ?auto_915238 ?auto_915253 ) ) ( not ( = ?auto_915238 ?auto_915254 ) ) ( not ( = ?auto_915239 ?auto_915240 ) ) ( not ( = ?auto_915239 ?auto_915241 ) ) ( not ( = ?auto_915239 ?auto_915242 ) ) ( not ( = ?auto_915239 ?auto_915243 ) ) ( not ( = ?auto_915239 ?auto_915244 ) ) ( not ( = ?auto_915239 ?auto_915245 ) ) ( not ( = ?auto_915239 ?auto_915246 ) ) ( not ( = ?auto_915239 ?auto_915247 ) ) ( not ( = ?auto_915239 ?auto_915248 ) ) ( not ( = ?auto_915239 ?auto_915249 ) ) ( not ( = ?auto_915239 ?auto_915250 ) ) ( not ( = ?auto_915239 ?auto_915251 ) ) ( not ( = ?auto_915239 ?auto_915252 ) ) ( not ( = ?auto_915239 ?auto_915253 ) ) ( not ( = ?auto_915239 ?auto_915254 ) ) ( not ( = ?auto_915240 ?auto_915241 ) ) ( not ( = ?auto_915240 ?auto_915242 ) ) ( not ( = ?auto_915240 ?auto_915243 ) ) ( not ( = ?auto_915240 ?auto_915244 ) ) ( not ( = ?auto_915240 ?auto_915245 ) ) ( not ( = ?auto_915240 ?auto_915246 ) ) ( not ( = ?auto_915240 ?auto_915247 ) ) ( not ( = ?auto_915240 ?auto_915248 ) ) ( not ( = ?auto_915240 ?auto_915249 ) ) ( not ( = ?auto_915240 ?auto_915250 ) ) ( not ( = ?auto_915240 ?auto_915251 ) ) ( not ( = ?auto_915240 ?auto_915252 ) ) ( not ( = ?auto_915240 ?auto_915253 ) ) ( not ( = ?auto_915240 ?auto_915254 ) ) ( not ( = ?auto_915241 ?auto_915242 ) ) ( not ( = ?auto_915241 ?auto_915243 ) ) ( not ( = ?auto_915241 ?auto_915244 ) ) ( not ( = ?auto_915241 ?auto_915245 ) ) ( not ( = ?auto_915241 ?auto_915246 ) ) ( not ( = ?auto_915241 ?auto_915247 ) ) ( not ( = ?auto_915241 ?auto_915248 ) ) ( not ( = ?auto_915241 ?auto_915249 ) ) ( not ( = ?auto_915241 ?auto_915250 ) ) ( not ( = ?auto_915241 ?auto_915251 ) ) ( not ( = ?auto_915241 ?auto_915252 ) ) ( not ( = ?auto_915241 ?auto_915253 ) ) ( not ( = ?auto_915241 ?auto_915254 ) ) ( not ( = ?auto_915242 ?auto_915243 ) ) ( not ( = ?auto_915242 ?auto_915244 ) ) ( not ( = ?auto_915242 ?auto_915245 ) ) ( not ( = ?auto_915242 ?auto_915246 ) ) ( not ( = ?auto_915242 ?auto_915247 ) ) ( not ( = ?auto_915242 ?auto_915248 ) ) ( not ( = ?auto_915242 ?auto_915249 ) ) ( not ( = ?auto_915242 ?auto_915250 ) ) ( not ( = ?auto_915242 ?auto_915251 ) ) ( not ( = ?auto_915242 ?auto_915252 ) ) ( not ( = ?auto_915242 ?auto_915253 ) ) ( not ( = ?auto_915242 ?auto_915254 ) ) ( not ( = ?auto_915243 ?auto_915244 ) ) ( not ( = ?auto_915243 ?auto_915245 ) ) ( not ( = ?auto_915243 ?auto_915246 ) ) ( not ( = ?auto_915243 ?auto_915247 ) ) ( not ( = ?auto_915243 ?auto_915248 ) ) ( not ( = ?auto_915243 ?auto_915249 ) ) ( not ( = ?auto_915243 ?auto_915250 ) ) ( not ( = ?auto_915243 ?auto_915251 ) ) ( not ( = ?auto_915243 ?auto_915252 ) ) ( not ( = ?auto_915243 ?auto_915253 ) ) ( not ( = ?auto_915243 ?auto_915254 ) ) ( not ( = ?auto_915244 ?auto_915245 ) ) ( not ( = ?auto_915244 ?auto_915246 ) ) ( not ( = ?auto_915244 ?auto_915247 ) ) ( not ( = ?auto_915244 ?auto_915248 ) ) ( not ( = ?auto_915244 ?auto_915249 ) ) ( not ( = ?auto_915244 ?auto_915250 ) ) ( not ( = ?auto_915244 ?auto_915251 ) ) ( not ( = ?auto_915244 ?auto_915252 ) ) ( not ( = ?auto_915244 ?auto_915253 ) ) ( not ( = ?auto_915244 ?auto_915254 ) ) ( not ( = ?auto_915245 ?auto_915246 ) ) ( not ( = ?auto_915245 ?auto_915247 ) ) ( not ( = ?auto_915245 ?auto_915248 ) ) ( not ( = ?auto_915245 ?auto_915249 ) ) ( not ( = ?auto_915245 ?auto_915250 ) ) ( not ( = ?auto_915245 ?auto_915251 ) ) ( not ( = ?auto_915245 ?auto_915252 ) ) ( not ( = ?auto_915245 ?auto_915253 ) ) ( not ( = ?auto_915245 ?auto_915254 ) ) ( not ( = ?auto_915246 ?auto_915247 ) ) ( not ( = ?auto_915246 ?auto_915248 ) ) ( not ( = ?auto_915246 ?auto_915249 ) ) ( not ( = ?auto_915246 ?auto_915250 ) ) ( not ( = ?auto_915246 ?auto_915251 ) ) ( not ( = ?auto_915246 ?auto_915252 ) ) ( not ( = ?auto_915246 ?auto_915253 ) ) ( not ( = ?auto_915246 ?auto_915254 ) ) ( not ( = ?auto_915247 ?auto_915248 ) ) ( not ( = ?auto_915247 ?auto_915249 ) ) ( not ( = ?auto_915247 ?auto_915250 ) ) ( not ( = ?auto_915247 ?auto_915251 ) ) ( not ( = ?auto_915247 ?auto_915252 ) ) ( not ( = ?auto_915247 ?auto_915253 ) ) ( not ( = ?auto_915247 ?auto_915254 ) ) ( not ( = ?auto_915248 ?auto_915249 ) ) ( not ( = ?auto_915248 ?auto_915250 ) ) ( not ( = ?auto_915248 ?auto_915251 ) ) ( not ( = ?auto_915248 ?auto_915252 ) ) ( not ( = ?auto_915248 ?auto_915253 ) ) ( not ( = ?auto_915248 ?auto_915254 ) ) ( not ( = ?auto_915249 ?auto_915250 ) ) ( not ( = ?auto_915249 ?auto_915251 ) ) ( not ( = ?auto_915249 ?auto_915252 ) ) ( not ( = ?auto_915249 ?auto_915253 ) ) ( not ( = ?auto_915249 ?auto_915254 ) ) ( not ( = ?auto_915250 ?auto_915251 ) ) ( not ( = ?auto_915250 ?auto_915252 ) ) ( not ( = ?auto_915250 ?auto_915253 ) ) ( not ( = ?auto_915250 ?auto_915254 ) ) ( not ( = ?auto_915251 ?auto_915252 ) ) ( not ( = ?auto_915251 ?auto_915253 ) ) ( not ( = ?auto_915251 ?auto_915254 ) ) ( not ( = ?auto_915252 ?auto_915253 ) ) ( not ( = ?auto_915252 ?auto_915254 ) ) ( not ( = ?auto_915253 ?auto_915254 ) ) ( ON ?auto_915252 ?auto_915253 ) ( ON ?auto_915251 ?auto_915252 ) ( ON ?auto_915250 ?auto_915251 ) ( ON ?auto_915249 ?auto_915250 ) ( ON ?auto_915248 ?auto_915249 ) ( ON ?auto_915247 ?auto_915248 ) ( ON ?auto_915246 ?auto_915247 ) ( ON ?auto_915245 ?auto_915246 ) ( ON ?auto_915244 ?auto_915245 ) ( ON ?auto_915243 ?auto_915244 ) ( ON ?auto_915242 ?auto_915243 ) ( ON ?auto_915241 ?auto_915242 ) ( CLEAR ?auto_915239 ) ( ON ?auto_915240 ?auto_915241 ) ( CLEAR ?auto_915240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_915236 ?auto_915237 ?auto_915238 ?auto_915239 ?auto_915240 )
      ( MAKE-18PILE ?auto_915236 ?auto_915237 ?auto_915238 ?auto_915239 ?auto_915240 ?auto_915241 ?auto_915242 ?auto_915243 ?auto_915244 ?auto_915245 ?auto_915246 ?auto_915247 ?auto_915248 ?auto_915249 ?auto_915250 ?auto_915251 ?auto_915252 ?auto_915253 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915273 - BLOCK
      ?auto_915274 - BLOCK
      ?auto_915275 - BLOCK
      ?auto_915276 - BLOCK
      ?auto_915277 - BLOCK
      ?auto_915278 - BLOCK
      ?auto_915279 - BLOCK
      ?auto_915280 - BLOCK
      ?auto_915281 - BLOCK
      ?auto_915282 - BLOCK
      ?auto_915283 - BLOCK
      ?auto_915284 - BLOCK
      ?auto_915285 - BLOCK
      ?auto_915286 - BLOCK
      ?auto_915287 - BLOCK
      ?auto_915288 - BLOCK
      ?auto_915289 - BLOCK
      ?auto_915290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915290 ) ( ON-TABLE ?auto_915273 ) ( ON ?auto_915274 ?auto_915273 ) ( ON ?auto_915275 ?auto_915274 ) ( ON ?auto_915276 ?auto_915275 ) ( not ( = ?auto_915273 ?auto_915274 ) ) ( not ( = ?auto_915273 ?auto_915275 ) ) ( not ( = ?auto_915273 ?auto_915276 ) ) ( not ( = ?auto_915273 ?auto_915277 ) ) ( not ( = ?auto_915273 ?auto_915278 ) ) ( not ( = ?auto_915273 ?auto_915279 ) ) ( not ( = ?auto_915273 ?auto_915280 ) ) ( not ( = ?auto_915273 ?auto_915281 ) ) ( not ( = ?auto_915273 ?auto_915282 ) ) ( not ( = ?auto_915273 ?auto_915283 ) ) ( not ( = ?auto_915273 ?auto_915284 ) ) ( not ( = ?auto_915273 ?auto_915285 ) ) ( not ( = ?auto_915273 ?auto_915286 ) ) ( not ( = ?auto_915273 ?auto_915287 ) ) ( not ( = ?auto_915273 ?auto_915288 ) ) ( not ( = ?auto_915273 ?auto_915289 ) ) ( not ( = ?auto_915273 ?auto_915290 ) ) ( not ( = ?auto_915274 ?auto_915275 ) ) ( not ( = ?auto_915274 ?auto_915276 ) ) ( not ( = ?auto_915274 ?auto_915277 ) ) ( not ( = ?auto_915274 ?auto_915278 ) ) ( not ( = ?auto_915274 ?auto_915279 ) ) ( not ( = ?auto_915274 ?auto_915280 ) ) ( not ( = ?auto_915274 ?auto_915281 ) ) ( not ( = ?auto_915274 ?auto_915282 ) ) ( not ( = ?auto_915274 ?auto_915283 ) ) ( not ( = ?auto_915274 ?auto_915284 ) ) ( not ( = ?auto_915274 ?auto_915285 ) ) ( not ( = ?auto_915274 ?auto_915286 ) ) ( not ( = ?auto_915274 ?auto_915287 ) ) ( not ( = ?auto_915274 ?auto_915288 ) ) ( not ( = ?auto_915274 ?auto_915289 ) ) ( not ( = ?auto_915274 ?auto_915290 ) ) ( not ( = ?auto_915275 ?auto_915276 ) ) ( not ( = ?auto_915275 ?auto_915277 ) ) ( not ( = ?auto_915275 ?auto_915278 ) ) ( not ( = ?auto_915275 ?auto_915279 ) ) ( not ( = ?auto_915275 ?auto_915280 ) ) ( not ( = ?auto_915275 ?auto_915281 ) ) ( not ( = ?auto_915275 ?auto_915282 ) ) ( not ( = ?auto_915275 ?auto_915283 ) ) ( not ( = ?auto_915275 ?auto_915284 ) ) ( not ( = ?auto_915275 ?auto_915285 ) ) ( not ( = ?auto_915275 ?auto_915286 ) ) ( not ( = ?auto_915275 ?auto_915287 ) ) ( not ( = ?auto_915275 ?auto_915288 ) ) ( not ( = ?auto_915275 ?auto_915289 ) ) ( not ( = ?auto_915275 ?auto_915290 ) ) ( not ( = ?auto_915276 ?auto_915277 ) ) ( not ( = ?auto_915276 ?auto_915278 ) ) ( not ( = ?auto_915276 ?auto_915279 ) ) ( not ( = ?auto_915276 ?auto_915280 ) ) ( not ( = ?auto_915276 ?auto_915281 ) ) ( not ( = ?auto_915276 ?auto_915282 ) ) ( not ( = ?auto_915276 ?auto_915283 ) ) ( not ( = ?auto_915276 ?auto_915284 ) ) ( not ( = ?auto_915276 ?auto_915285 ) ) ( not ( = ?auto_915276 ?auto_915286 ) ) ( not ( = ?auto_915276 ?auto_915287 ) ) ( not ( = ?auto_915276 ?auto_915288 ) ) ( not ( = ?auto_915276 ?auto_915289 ) ) ( not ( = ?auto_915276 ?auto_915290 ) ) ( not ( = ?auto_915277 ?auto_915278 ) ) ( not ( = ?auto_915277 ?auto_915279 ) ) ( not ( = ?auto_915277 ?auto_915280 ) ) ( not ( = ?auto_915277 ?auto_915281 ) ) ( not ( = ?auto_915277 ?auto_915282 ) ) ( not ( = ?auto_915277 ?auto_915283 ) ) ( not ( = ?auto_915277 ?auto_915284 ) ) ( not ( = ?auto_915277 ?auto_915285 ) ) ( not ( = ?auto_915277 ?auto_915286 ) ) ( not ( = ?auto_915277 ?auto_915287 ) ) ( not ( = ?auto_915277 ?auto_915288 ) ) ( not ( = ?auto_915277 ?auto_915289 ) ) ( not ( = ?auto_915277 ?auto_915290 ) ) ( not ( = ?auto_915278 ?auto_915279 ) ) ( not ( = ?auto_915278 ?auto_915280 ) ) ( not ( = ?auto_915278 ?auto_915281 ) ) ( not ( = ?auto_915278 ?auto_915282 ) ) ( not ( = ?auto_915278 ?auto_915283 ) ) ( not ( = ?auto_915278 ?auto_915284 ) ) ( not ( = ?auto_915278 ?auto_915285 ) ) ( not ( = ?auto_915278 ?auto_915286 ) ) ( not ( = ?auto_915278 ?auto_915287 ) ) ( not ( = ?auto_915278 ?auto_915288 ) ) ( not ( = ?auto_915278 ?auto_915289 ) ) ( not ( = ?auto_915278 ?auto_915290 ) ) ( not ( = ?auto_915279 ?auto_915280 ) ) ( not ( = ?auto_915279 ?auto_915281 ) ) ( not ( = ?auto_915279 ?auto_915282 ) ) ( not ( = ?auto_915279 ?auto_915283 ) ) ( not ( = ?auto_915279 ?auto_915284 ) ) ( not ( = ?auto_915279 ?auto_915285 ) ) ( not ( = ?auto_915279 ?auto_915286 ) ) ( not ( = ?auto_915279 ?auto_915287 ) ) ( not ( = ?auto_915279 ?auto_915288 ) ) ( not ( = ?auto_915279 ?auto_915289 ) ) ( not ( = ?auto_915279 ?auto_915290 ) ) ( not ( = ?auto_915280 ?auto_915281 ) ) ( not ( = ?auto_915280 ?auto_915282 ) ) ( not ( = ?auto_915280 ?auto_915283 ) ) ( not ( = ?auto_915280 ?auto_915284 ) ) ( not ( = ?auto_915280 ?auto_915285 ) ) ( not ( = ?auto_915280 ?auto_915286 ) ) ( not ( = ?auto_915280 ?auto_915287 ) ) ( not ( = ?auto_915280 ?auto_915288 ) ) ( not ( = ?auto_915280 ?auto_915289 ) ) ( not ( = ?auto_915280 ?auto_915290 ) ) ( not ( = ?auto_915281 ?auto_915282 ) ) ( not ( = ?auto_915281 ?auto_915283 ) ) ( not ( = ?auto_915281 ?auto_915284 ) ) ( not ( = ?auto_915281 ?auto_915285 ) ) ( not ( = ?auto_915281 ?auto_915286 ) ) ( not ( = ?auto_915281 ?auto_915287 ) ) ( not ( = ?auto_915281 ?auto_915288 ) ) ( not ( = ?auto_915281 ?auto_915289 ) ) ( not ( = ?auto_915281 ?auto_915290 ) ) ( not ( = ?auto_915282 ?auto_915283 ) ) ( not ( = ?auto_915282 ?auto_915284 ) ) ( not ( = ?auto_915282 ?auto_915285 ) ) ( not ( = ?auto_915282 ?auto_915286 ) ) ( not ( = ?auto_915282 ?auto_915287 ) ) ( not ( = ?auto_915282 ?auto_915288 ) ) ( not ( = ?auto_915282 ?auto_915289 ) ) ( not ( = ?auto_915282 ?auto_915290 ) ) ( not ( = ?auto_915283 ?auto_915284 ) ) ( not ( = ?auto_915283 ?auto_915285 ) ) ( not ( = ?auto_915283 ?auto_915286 ) ) ( not ( = ?auto_915283 ?auto_915287 ) ) ( not ( = ?auto_915283 ?auto_915288 ) ) ( not ( = ?auto_915283 ?auto_915289 ) ) ( not ( = ?auto_915283 ?auto_915290 ) ) ( not ( = ?auto_915284 ?auto_915285 ) ) ( not ( = ?auto_915284 ?auto_915286 ) ) ( not ( = ?auto_915284 ?auto_915287 ) ) ( not ( = ?auto_915284 ?auto_915288 ) ) ( not ( = ?auto_915284 ?auto_915289 ) ) ( not ( = ?auto_915284 ?auto_915290 ) ) ( not ( = ?auto_915285 ?auto_915286 ) ) ( not ( = ?auto_915285 ?auto_915287 ) ) ( not ( = ?auto_915285 ?auto_915288 ) ) ( not ( = ?auto_915285 ?auto_915289 ) ) ( not ( = ?auto_915285 ?auto_915290 ) ) ( not ( = ?auto_915286 ?auto_915287 ) ) ( not ( = ?auto_915286 ?auto_915288 ) ) ( not ( = ?auto_915286 ?auto_915289 ) ) ( not ( = ?auto_915286 ?auto_915290 ) ) ( not ( = ?auto_915287 ?auto_915288 ) ) ( not ( = ?auto_915287 ?auto_915289 ) ) ( not ( = ?auto_915287 ?auto_915290 ) ) ( not ( = ?auto_915288 ?auto_915289 ) ) ( not ( = ?auto_915288 ?auto_915290 ) ) ( not ( = ?auto_915289 ?auto_915290 ) ) ( ON ?auto_915289 ?auto_915290 ) ( ON ?auto_915288 ?auto_915289 ) ( ON ?auto_915287 ?auto_915288 ) ( ON ?auto_915286 ?auto_915287 ) ( ON ?auto_915285 ?auto_915286 ) ( ON ?auto_915284 ?auto_915285 ) ( ON ?auto_915283 ?auto_915284 ) ( ON ?auto_915282 ?auto_915283 ) ( ON ?auto_915281 ?auto_915282 ) ( ON ?auto_915280 ?auto_915281 ) ( ON ?auto_915279 ?auto_915280 ) ( ON ?auto_915278 ?auto_915279 ) ( CLEAR ?auto_915276 ) ( ON ?auto_915277 ?auto_915278 ) ( CLEAR ?auto_915277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_915273 ?auto_915274 ?auto_915275 ?auto_915276 ?auto_915277 )
      ( MAKE-18PILE ?auto_915273 ?auto_915274 ?auto_915275 ?auto_915276 ?auto_915277 ?auto_915278 ?auto_915279 ?auto_915280 ?auto_915281 ?auto_915282 ?auto_915283 ?auto_915284 ?auto_915285 ?auto_915286 ?auto_915287 ?auto_915288 ?auto_915289 ?auto_915290 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915309 - BLOCK
      ?auto_915310 - BLOCK
      ?auto_915311 - BLOCK
      ?auto_915312 - BLOCK
      ?auto_915313 - BLOCK
      ?auto_915314 - BLOCK
      ?auto_915315 - BLOCK
      ?auto_915316 - BLOCK
      ?auto_915317 - BLOCK
      ?auto_915318 - BLOCK
      ?auto_915319 - BLOCK
      ?auto_915320 - BLOCK
      ?auto_915321 - BLOCK
      ?auto_915322 - BLOCK
      ?auto_915323 - BLOCK
      ?auto_915324 - BLOCK
      ?auto_915325 - BLOCK
      ?auto_915326 - BLOCK
    )
    :vars
    (
      ?auto_915327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915326 ?auto_915327 ) ( ON-TABLE ?auto_915309 ) ( ON ?auto_915310 ?auto_915309 ) ( ON ?auto_915311 ?auto_915310 ) ( not ( = ?auto_915309 ?auto_915310 ) ) ( not ( = ?auto_915309 ?auto_915311 ) ) ( not ( = ?auto_915309 ?auto_915312 ) ) ( not ( = ?auto_915309 ?auto_915313 ) ) ( not ( = ?auto_915309 ?auto_915314 ) ) ( not ( = ?auto_915309 ?auto_915315 ) ) ( not ( = ?auto_915309 ?auto_915316 ) ) ( not ( = ?auto_915309 ?auto_915317 ) ) ( not ( = ?auto_915309 ?auto_915318 ) ) ( not ( = ?auto_915309 ?auto_915319 ) ) ( not ( = ?auto_915309 ?auto_915320 ) ) ( not ( = ?auto_915309 ?auto_915321 ) ) ( not ( = ?auto_915309 ?auto_915322 ) ) ( not ( = ?auto_915309 ?auto_915323 ) ) ( not ( = ?auto_915309 ?auto_915324 ) ) ( not ( = ?auto_915309 ?auto_915325 ) ) ( not ( = ?auto_915309 ?auto_915326 ) ) ( not ( = ?auto_915309 ?auto_915327 ) ) ( not ( = ?auto_915310 ?auto_915311 ) ) ( not ( = ?auto_915310 ?auto_915312 ) ) ( not ( = ?auto_915310 ?auto_915313 ) ) ( not ( = ?auto_915310 ?auto_915314 ) ) ( not ( = ?auto_915310 ?auto_915315 ) ) ( not ( = ?auto_915310 ?auto_915316 ) ) ( not ( = ?auto_915310 ?auto_915317 ) ) ( not ( = ?auto_915310 ?auto_915318 ) ) ( not ( = ?auto_915310 ?auto_915319 ) ) ( not ( = ?auto_915310 ?auto_915320 ) ) ( not ( = ?auto_915310 ?auto_915321 ) ) ( not ( = ?auto_915310 ?auto_915322 ) ) ( not ( = ?auto_915310 ?auto_915323 ) ) ( not ( = ?auto_915310 ?auto_915324 ) ) ( not ( = ?auto_915310 ?auto_915325 ) ) ( not ( = ?auto_915310 ?auto_915326 ) ) ( not ( = ?auto_915310 ?auto_915327 ) ) ( not ( = ?auto_915311 ?auto_915312 ) ) ( not ( = ?auto_915311 ?auto_915313 ) ) ( not ( = ?auto_915311 ?auto_915314 ) ) ( not ( = ?auto_915311 ?auto_915315 ) ) ( not ( = ?auto_915311 ?auto_915316 ) ) ( not ( = ?auto_915311 ?auto_915317 ) ) ( not ( = ?auto_915311 ?auto_915318 ) ) ( not ( = ?auto_915311 ?auto_915319 ) ) ( not ( = ?auto_915311 ?auto_915320 ) ) ( not ( = ?auto_915311 ?auto_915321 ) ) ( not ( = ?auto_915311 ?auto_915322 ) ) ( not ( = ?auto_915311 ?auto_915323 ) ) ( not ( = ?auto_915311 ?auto_915324 ) ) ( not ( = ?auto_915311 ?auto_915325 ) ) ( not ( = ?auto_915311 ?auto_915326 ) ) ( not ( = ?auto_915311 ?auto_915327 ) ) ( not ( = ?auto_915312 ?auto_915313 ) ) ( not ( = ?auto_915312 ?auto_915314 ) ) ( not ( = ?auto_915312 ?auto_915315 ) ) ( not ( = ?auto_915312 ?auto_915316 ) ) ( not ( = ?auto_915312 ?auto_915317 ) ) ( not ( = ?auto_915312 ?auto_915318 ) ) ( not ( = ?auto_915312 ?auto_915319 ) ) ( not ( = ?auto_915312 ?auto_915320 ) ) ( not ( = ?auto_915312 ?auto_915321 ) ) ( not ( = ?auto_915312 ?auto_915322 ) ) ( not ( = ?auto_915312 ?auto_915323 ) ) ( not ( = ?auto_915312 ?auto_915324 ) ) ( not ( = ?auto_915312 ?auto_915325 ) ) ( not ( = ?auto_915312 ?auto_915326 ) ) ( not ( = ?auto_915312 ?auto_915327 ) ) ( not ( = ?auto_915313 ?auto_915314 ) ) ( not ( = ?auto_915313 ?auto_915315 ) ) ( not ( = ?auto_915313 ?auto_915316 ) ) ( not ( = ?auto_915313 ?auto_915317 ) ) ( not ( = ?auto_915313 ?auto_915318 ) ) ( not ( = ?auto_915313 ?auto_915319 ) ) ( not ( = ?auto_915313 ?auto_915320 ) ) ( not ( = ?auto_915313 ?auto_915321 ) ) ( not ( = ?auto_915313 ?auto_915322 ) ) ( not ( = ?auto_915313 ?auto_915323 ) ) ( not ( = ?auto_915313 ?auto_915324 ) ) ( not ( = ?auto_915313 ?auto_915325 ) ) ( not ( = ?auto_915313 ?auto_915326 ) ) ( not ( = ?auto_915313 ?auto_915327 ) ) ( not ( = ?auto_915314 ?auto_915315 ) ) ( not ( = ?auto_915314 ?auto_915316 ) ) ( not ( = ?auto_915314 ?auto_915317 ) ) ( not ( = ?auto_915314 ?auto_915318 ) ) ( not ( = ?auto_915314 ?auto_915319 ) ) ( not ( = ?auto_915314 ?auto_915320 ) ) ( not ( = ?auto_915314 ?auto_915321 ) ) ( not ( = ?auto_915314 ?auto_915322 ) ) ( not ( = ?auto_915314 ?auto_915323 ) ) ( not ( = ?auto_915314 ?auto_915324 ) ) ( not ( = ?auto_915314 ?auto_915325 ) ) ( not ( = ?auto_915314 ?auto_915326 ) ) ( not ( = ?auto_915314 ?auto_915327 ) ) ( not ( = ?auto_915315 ?auto_915316 ) ) ( not ( = ?auto_915315 ?auto_915317 ) ) ( not ( = ?auto_915315 ?auto_915318 ) ) ( not ( = ?auto_915315 ?auto_915319 ) ) ( not ( = ?auto_915315 ?auto_915320 ) ) ( not ( = ?auto_915315 ?auto_915321 ) ) ( not ( = ?auto_915315 ?auto_915322 ) ) ( not ( = ?auto_915315 ?auto_915323 ) ) ( not ( = ?auto_915315 ?auto_915324 ) ) ( not ( = ?auto_915315 ?auto_915325 ) ) ( not ( = ?auto_915315 ?auto_915326 ) ) ( not ( = ?auto_915315 ?auto_915327 ) ) ( not ( = ?auto_915316 ?auto_915317 ) ) ( not ( = ?auto_915316 ?auto_915318 ) ) ( not ( = ?auto_915316 ?auto_915319 ) ) ( not ( = ?auto_915316 ?auto_915320 ) ) ( not ( = ?auto_915316 ?auto_915321 ) ) ( not ( = ?auto_915316 ?auto_915322 ) ) ( not ( = ?auto_915316 ?auto_915323 ) ) ( not ( = ?auto_915316 ?auto_915324 ) ) ( not ( = ?auto_915316 ?auto_915325 ) ) ( not ( = ?auto_915316 ?auto_915326 ) ) ( not ( = ?auto_915316 ?auto_915327 ) ) ( not ( = ?auto_915317 ?auto_915318 ) ) ( not ( = ?auto_915317 ?auto_915319 ) ) ( not ( = ?auto_915317 ?auto_915320 ) ) ( not ( = ?auto_915317 ?auto_915321 ) ) ( not ( = ?auto_915317 ?auto_915322 ) ) ( not ( = ?auto_915317 ?auto_915323 ) ) ( not ( = ?auto_915317 ?auto_915324 ) ) ( not ( = ?auto_915317 ?auto_915325 ) ) ( not ( = ?auto_915317 ?auto_915326 ) ) ( not ( = ?auto_915317 ?auto_915327 ) ) ( not ( = ?auto_915318 ?auto_915319 ) ) ( not ( = ?auto_915318 ?auto_915320 ) ) ( not ( = ?auto_915318 ?auto_915321 ) ) ( not ( = ?auto_915318 ?auto_915322 ) ) ( not ( = ?auto_915318 ?auto_915323 ) ) ( not ( = ?auto_915318 ?auto_915324 ) ) ( not ( = ?auto_915318 ?auto_915325 ) ) ( not ( = ?auto_915318 ?auto_915326 ) ) ( not ( = ?auto_915318 ?auto_915327 ) ) ( not ( = ?auto_915319 ?auto_915320 ) ) ( not ( = ?auto_915319 ?auto_915321 ) ) ( not ( = ?auto_915319 ?auto_915322 ) ) ( not ( = ?auto_915319 ?auto_915323 ) ) ( not ( = ?auto_915319 ?auto_915324 ) ) ( not ( = ?auto_915319 ?auto_915325 ) ) ( not ( = ?auto_915319 ?auto_915326 ) ) ( not ( = ?auto_915319 ?auto_915327 ) ) ( not ( = ?auto_915320 ?auto_915321 ) ) ( not ( = ?auto_915320 ?auto_915322 ) ) ( not ( = ?auto_915320 ?auto_915323 ) ) ( not ( = ?auto_915320 ?auto_915324 ) ) ( not ( = ?auto_915320 ?auto_915325 ) ) ( not ( = ?auto_915320 ?auto_915326 ) ) ( not ( = ?auto_915320 ?auto_915327 ) ) ( not ( = ?auto_915321 ?auto_915322 ) ) ( not ( = ?auto_915321 ?auto_915323 ) ) ( not ( = ?auto_915321 ?auto_915324 ) ) ( not ( = ?auto_915321 ?auto_915325 ) ) ( not ( = ?auto_915321 ?auto_915326 ) ) ( not ( = ?auto_915321 ?auto_915327 ) ) ( not ( = ?auto_915322 ?auto_915323 ) ) ( not ( = ?auto_915322 ?auto_915324 ) ) ( not ( = ?auto_915322 ?auto_915325 ) ) ( not ( = ?auto_915322 ?auto_915326 ) ) ( not ( = ?auto_915322 ?auto_915327 ) ) ( not ( = ?auto_915323 ?auto_915324 ) ) ( not ( = ?auto_915323 ?auto_915325 ) ) ( not ( = ?auto_915323 ?auto_915326 ) ) ( not ( = ?auto_915323 ?auto_915327 ) ) ( not ( = ?auto_915324 ?auto_915325 ) ) ( not ( = ?auto_915324 ?auto_915326 ) ) ( not ( = ?auto_915324 ?auto_915327 ) ) ( not ( = ?auto_915325 ?auto_915326 ) ) ( not ( = ?auto_915325 ?auto_915327 ) ) ( not ( = ?auto_915326 ?auto_915327 ) ) ( ON ?auto_915325 ?auto_915326 ) ( ON ?auto_915324 ?auto_915325 ) ( ON ?auto_915323 ?auto_915324 ) ( ON ?auto_915322 ?auto_915323 ) ( ON ?auto_915321 ?auto_915322 ) ( ON ?auto_915320 ?auto_915321 ) ( ON ?auto_915319 ?auto_915320 ) ( ON ?auto_915318 ?auto_915319 ) ( ON ?auto_915317 ?auto_915318 ) ( ON ?auto_915316 ?auto_915317 ) ( ON ?auto_915315 ?auto_915316 ) ( ON ?auto_915314 ?auto_915315 ) ( ON ?auto_915313 ?auto_915314 ) ( CLEAR ?auto_915311 ) ( ON ?auto_915312 ?auto_915313 ) ( CLEAR ?auto_915312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_915309 ?auto_915310 ?auto_915311 ?auto_915312 )
      ( MAKE-18PILE ?auto_915309 ?auto_915310 ?auto_915311 ?auto_915312 ?auto_915313 ?auto_915314 ?auto_915315 ?auto_915316 ?auto_915317 ?auto_915318 ?auto_915319 ?auto_915320 ?auto_915321 ?auto_915322 ?auto_915323 ?auto_915324 ?auto_915325 ?auto_915326 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915346 - BLOCK
      ?auto_915347 - BLOCK
      ?auto_915348 - BLOCK
      ?auto_915349 - BLOCK
      ?auto_915350 - BLOCK
      ?auto_915351 - BLOCK
      ?auto_915352 - BLOCK
      ?auto_915353 - BLOCK
      ?auto_915354 - BLOCK
      ?auto_915355 - BLOCK
      ?auto_915356 - BLOCK
      ?auto_915357 - BLOCK
      ?auto_915358 - BLOCK
      ?auto_915359 - BLOCK
      ?auto_915360 - BLOCK
      ?auto_915361 - BLOCK
      ?auto_915362 - BLOCK
      ?auto_915363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915363 ) ( ON-TABLE ?auto_915346 ) ( ON ?auto_915347 ?auto_915346 ) ( ON ?auto_915348 ?auto_915347 ) ( not ( = ?auto_915346 ?auto_915347 ) ) ( not ( = ?auto_915346 ?auto_915348 ) ) ( not ( = ?auto_915346 ?auto_915349 ) ) ( not ( = ?auto_915346 ?auto_915350 ) ) ( not ( = ?auto_915346 ?auto_915351 ) ) ( not ( = ?auto_915346 ?auto_915352 ) ) ( not ( = ?auto_915346 ?auto_915353 ) ) ( not ( = ?auto_915346 ?auto_915354 ) ) ( not ( = ?auto_915346 ?auto_915355 ) ) ( not ( = ?auto_915346 ?auto_915356 ) ) ( not ( = ?auto_915346 ?auto_915357 ) ) ( not ( = ?auto_915346 ?auto_915358 ) ) ( not ( = ?auto_915346 ?auto_915359 ) ) ( not ( = ?auto_915346 ?auto_915360 ) ) ( not ( = ?auto_915346 ?auto_915361 ) ) ( not ( = ?auto_915346 ?auto_915362 ) ) ( not ( = ?auto_915346 ?auto_915363 ) ) ( not ( = ?auto_915347 ?auto_915348 ) ) ( not ( = ?auto_915347 ?auto_915349 ) ) ( not ( = ?auto_915347 ?auto_915350 ) ) ( not ( = ?auto_915347 ?auto_915351 ) ) ( not ( = ?auto_915347 ?auto_915352 ) ) ( not ( = ?auto_915347 ?auto_915353 ) ) ( not ( = ?auto_915347 ?auto_915354 ) ) ( not ( = ?auto_915347 ?auto_915355 ) ) ( not ( = ?auto_915347 ?auto_915356 ) ) ( not ( = ?auto_915347 ?auto_915357 ) ) ( not ( = ?auto_915347 ?auto_915358 ) ) ( not ( = ?auto_915347 ?auto_915359 ) ) ( not ( = ?auto_915347 ?auto_915360 ) ) ( not ( = ?auto_915347 ?auto_915361 ) ) ( not ( = ?auto_915347 ?auto_915362 ) ) ( not ( = ?auto_915347 ?auto_915363 ) ) ( not ( = ?auto_915348 ?auto_915349 ) ) ( not ( = ?auto_915348 ?auto_915350 ) ) ( not ( = ?auto_915348 ?auto_915351 ) ) ( not ( = ?auto_915348 ?auto_915352 ) ) ( not ( = ?auto_915348 ?auto_915353 ) ) ( not ( = ?auto_915348 ?auto_915354 ) ) ( not ( = ?auto_915348 ?auto_915355 ) ) ( not ( = ?auto_915348 ?auto_915356 ) ) ( not ( = ?auto_915348 ?auto_915357 ) ) ( not ( = ?auto_915348 ?auto_915358 ) ) ( not ( = ?auto_915348 ?auto_915359 ) ) ( not ( = ?auto_915348 ?auto_915360 ) ) ( not ( = ?auto_915348 ?auto_915361 ) ) ( not ( = ?auto_915348 ?auto_915362 ) ) ( not ( = ?auto_915348 ?auto_915363 ) ) ( not ( = ?auto_915349 ?auto_915350 ) ) ( not ( = ?auto_915349 ?auto_915351 ) ) ( not ( = ?auto_915349 ?auto_915352 ) ) ( not ( = ?auto_915349 ?auto_915353 ) ) ( not ( = ?auto_915349 ?auto_915354 ) ) ( not ( = ?auto_915349 ?auto_915355 ) ) ( not ( = ?auto_915349 ?auto_915356 ) ) ( not ( = ?auto_915349 ?auto_915357 ) ) ( not ( = ?auto_915349 ?auto_915358 ) ) ( not ( = ?auto_915349 ?auto_915359 ) ) ( not ( = ?auto_915349 ?auto_915360 ) ) ( not ( = ?auto_915349 ?auto_915361 ) ) ( not ( = ?auto_915349 ?auto_915362 ) ) ( not ( = ?auto_915349 ?auto_915363 ) ) ( not ( = ?auto_915350 ?auto_915351 ) ) ( not ( = ?auto_915350 ?auto_915352 ) ) ( not ( = ?auto_915350 ?auto_915353 ) ) ( not ( = ?auto_915350 ?auto_915354 ) ) ( not ( = ?auto_915350 ?auto_915355 ) ) ( not ( = ?auto_915350 ?auto_915356 ) ) ( not ( = ?auto_915350 ?auto_915357 ) ) ( not ( = ?auto_915350 ?auto_915358 ) ) ( not ( = ?auto_915350 ?auto_915359 ) ) ( not ( = ?auto_915350 ?auto_915360 ) ) ( not ( = ?auto_915350 ?auto_915361 ) ) ( not ( = ?auto_915350 ?auto_915362 ) ) ( not ( = ?auto_915350 ?auto_915363 ) ) ( not ( = ?auto_915351 ?auto_915352 ) ) ( not ( = ?auto_915351 ?auto_915353 ) ) ( not ( = ?auto_915351 ?auto_915354 ) ) ( not ( = ?auto_915351 ?auto_915355 ) ) ( not ( = ?auto_915351 ?auto_915356 ) ) ( not ( = ?auto_915351 ?auto_915357 ) ) ( not ( = ?auto_915351 ?auto_915358 ) ) ( not ( = ?auto_915351 ?auto_915359 ) ) ( not ( = ?auto_915351 ?auto_915360 ) ) ( not ( = ?auto_915351 ?auto_915361 ) ) ( not ( = ?auto_915351 ?auto_915362 ) ) ( not ( = ?auto_915351 ?auto_915363 ) ) ( not ( = ?auto_915352 ?auto_915353 ) ) ( not ( = ?auto_915352 ?auto_915354 ) ) ( not ( = ?auto_915352 ?auto_915355 ) ) ( not ( = ?auto_915352 ?auto_915356 ) ) ( not ( = ?auto_915352 ?auto_915357 ) ) ( not ( = ?auto_915352 ?auto_915358 ) ) ( not ( = ?auto_915352 ?auto_915359 ) ) ( not ( = ?auto_915352 ?auto_915360 ) ) ( not ( = ?auto_915352 ?auto_915361 ) ) ( not ( = ?auto_915352 ?auto_915362 ) ) ( not ( = ?auto_915352 ?auto_915363 ) ) ( not ( = ?auto_915353 ?auto_915354 ) ) ( not ( = ?auto_915353 ?auto_915355 ) ) ( not ( = ?auto_915353 ?auto_915356 ) ) ( not ( = ?auto_915353 ?auto_915357 ) ) ( not ( = ?auto_915353 ?auto_915358 ) ) ( not ( = ?auto_915353 ?auto_915359 ) ) ( not ( = ?auto_915353 ?auto_915360 ) ) ( not ( = ?auto_915353 ?auto_915361 ) ) ( not ( = ?auto_915353 ?auto_915362 ) ) ( not ( = ?auto_915353 ?auto_915363 ) ) ( not ( = ?auto_915354 ?auto_915355 ) ) ( not ( = ?auto_915354 ?auto_915356 ) ) ( not ( = ?auto_915354 ?auto_915357 ) ) ( not ( = ?auto_915354 ?auto_915358 ) ) ( not ( = ?auto_915354 ?auto_915359 ) ) ( not ( = ?auto_915354 ?auto_915360 ) ) ( not ( = ?auto_915354 ?auto_915361 ) ) ( not ( = ?auto_915354 ?auto_915362 ) ) ( not ( = ?auto_915354 ?auto_915363 ) ) ( not ( = ?auto_915355 ?auto_915356 ) ) ( not ( = ?auto_915355 ?auto_915357 ) ) ( not ( = ?auto_915355 ?auto_915358 ) ) ( not ( = ?auto_915355 ?auto_915359 ) ) ( not ( = ?auto_915355 ?auto_915360 ) ) ( not ( = ?auto_915355 ?auto_915361 ) ) ( not ( = ?auto_915355 ?auto_915362 ) ) ( not ( = ?auto_915355 ?auto_915363 ) ) ( not ( = ?auto_915356 ?auto_915357 ) ) ( not ( = ?auto_915356 ?auto_915358 ) ) ( not ( = ?auto_915356 ?auto_915359 ) ) ( not ( = ?auto_915356 ?auto_915360 ) ) ( not ( = ?auto_915356 ?auto_915361 ) ) ( not ( = ?auto_915356 ?auto_915362 ) ) ( not ( = ?auto_915356 ?auto_915363 ) ) ( not ( = ?auto_915357 ?auto_915358 ) ) ( not ( = ?auto_915357 ?auto_915359 ) ) ( not ( = ?auto_915357 ?auto_915360 ) ) ( not ( = ?auto_915357 ?auto_915361 ) ) ( not ( = ?auto_915357 ?auto_915362 ) ) ( not ( = ?auto_915357 ?auto_915363 ) ) ( not ( = ?auto_915358 ?auto_915359 ) ) ( not ( = ?auto_915358 ?auto_915360 ) ) ( not ( = ?auto_915358 ?auto_915361 ) ) ( not ( = ?auto_915358 ?auto_915362 ) ) ( not ( = ?auto_915358 ?auto_915363 ) ) ( not ( = ?auto_915359 ?auto_915360 ) ) ( not ( = ?auto_915359 ?auto_915361 ) ) ( not ( = ?auto_915359 ?auto_915362 ) ) ( not ( = ?auto_915359 ?auto_915363 ) ) ( not ( = ?auto_915360 ?auto_915361 ) ) ( not ( = ?auto_915360 ?auto_915362 ) ) ( not ( = ?auto_915360 ?auto_915363 ) ) ( not ( = ?auto_915361 ?auto_915362 ) ) ( not ( = ?auto_915361 ?auto_915363 ) ) ( not ( = ?auto_915362 ?auto_915363 ) ) ( ON ?auto_915362 ?auto_915363 ) ( ON ?auto_915361 ?auto_915362 ) ( ON ?auto_915360 ?auto_915361 ) ( ON ?auto_915359 ?auto_915360 ) ( ON ?auto_915358 ?auto_915359 ) ( ON ?auto_915357 ?auto_915358 ) ( ON ?auto_915356 ?auto_915357 ) ( ON ?auto_915355 ?auto_915356 ) ( ON ?auto_915354 ?auto_915355 ) ( ON ?auto_915353 ?auto_915354 ) ( ON ?auto_915352 ?auto_915353 ) ( ON ?auto_915351 ?auto_915352 ) ( ON ?auto_915350 ?auto_915351 ) ( CLEAR ?auto_915348 ) ( ON ?auto_915349 ?auto_915350 ) ( CLEAR ?auto_915349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_915346 ?auto_915347 ?auto_915348 ?auto_915349 )
      ( MAKE-18PILE ?auto_915346 ?auto_915347 ?auto_915348 ?auto_915349 ?auto_915350 ?auto_915351 ?auto_915352 ?auto_915353 ?auto_915354 ?auto_915355 ?auto_915356 ?auto_915357 ?auto_915358 ?auto_915359 ?auto_915360 ?auto_915361 ?auto_915362 ?auto_915363 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915382 - BLOCK
      ?auto_915383 - BLOCK
      ?auto_915384 - BLOCK
      ?auto_915385 - BLOCK
      ?auto_915386 - BLOCK
      ?auto_915387 - BLOCK
      ?auto_915388 - BLOCK
      ?auto_915389 - BLOCK
      ?auto_915390 - BLOCK
      ?auto_915391 - BLOCK
      ?auto_915392 - BLOCK
      ?auto_915393 - BLOCK
      ?auto_915394 - BLOCK
      ?auto_915395 - BLOCK
      ?auto_915396 - BLOCK
      ?auto_915397 - BLOCK
      ?auto_915398 - BLOCK
      ?auto_915399 - BLOCK
    )
    :vars
    (
      ?auto_915400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915399 ?auto_915400 ) ( ON-TABLE ?auto_915382 ) ( ON ?auto_915383 ?auto_915382 ) ( not ( = ?auto_915382 ?auto_915383 ) ) ( not ( = ?auto_915382 ?auto_915384 ) ) ( not ( = ?auto_915382 ?auto_915385 ) ) ( not ( = ?auto_915382 ?auto_915386 ) ) ( not ( = ?auto_915382 ?auto_915387 ) ) ( not ( = ?auto_915382 ?auto_915388 ) ) ( not ( = ?auto_915382 ?auto_915389 ) ) ( not ( = ?auto_915382 ?auto_915390 ) ) ( not ( = ?auto_915382 ?auto_915391 ) ) ( not ( = ?auto_915382 ?auto_915392 ) ) ( not ( = ?auto_915382 ?auto_915393 ) ) ( not ( = ?auto_915382 ?auto_915394 ) ) ( not ( = ?auto_915382 ?auto_915395 ) ) ( not ( = ?auto_915382 ?auto_915396 ) ) ( not ( = ?auto_915382 ?auto_915397 ) ) ( not ( = ?auto_915382 ?auto_915398 ) ) ( not ( = ?auto_915382 ?auto_915399 ) ) ( not ( = ?auto_915382 ?auto_915400 ) ) ( not ( = ?auto_915383 ?auto_915384 ) ) ( not ( = ?auto_915383 ?auto_915385 ) ) ( not ( = ?auto_915383 ?auto_915386 ) ) ( not ( = ?auto_915383 ?auto_915387 ) ) ( not ( = ?auto_915383 ?auto_915388 ) ) ( not ( = ?auto_915383 ?auto_915389 ) ) ( not ( = ?auto_915383 ?auto_915390 ) ) ( not ( = ?auto_915383 ?auto_915391 ) ) ( not ( = ?auto_915383 ?auto_915392 ) ) ( not ( = ?auto_915383 ?auto_915393 ) ) ( not ( = ?auto_915383 ?auto_915394 ) ) ( not ( = ?auto_915383 ?auto_915395 ) ) ( not ( = ?auto_915383 ?auto_915396 ) ) ( not ( = ?auto_915383 ?auto_915397 ) ) ( not ( = ?auto_915383 ?auto_915398 ) ) ( not ( = ?auto_915383 ?auto_915399 ) ) ( not ( = ?auto_915383 ?auto_915400 ) ) ( not ( = ?auto_915384 ?auto_915385 ) ) ( not ( = ?auto_915384 ?auto_915386 ) ) ( not ( = ?auto_915384 ?auto_915387 ) ) ( not ( = ?auto_915384 ?auto_915388 ) ) ( not ( = ?auto_915384 ?auto_915389 ) ) ( not ( = ?auto_915384 ?auto_915390 ) ) ( not ( = ?auto_915384 ?auto_915391 ) ) ( not ( = ?auto_915384 ?auto_915392 ) ) ( not ( = ?auto_915384 ?auto_915393 ) ) ( not ( = ?auto_915384 ?auto_915394 ) ) ( not ( = ?auto_915384 ?auto_915395 ) ) ( not ( = ?auto_915384 ?auto_915396 ) ) ( not ( = ?auto_915384 ?auto_915397 ) ) ( not ( = ?auto_915384 ?auto_915398 ) ) ( not ( = ?auto_915384 ?auto_915399 ) ) ( not ( = ?auto_915384 ?auto_915400 ) ) ( not ( = ?auto_915385 ?auto_915386 ) ) ( not ( = ?auto_915385 ?auto_915387 ) ) ( not ( = ?auto_915385 ?auto_915388 ) ) ( not ( = ?auto_915385 ?auto_915389 ) ) ( not ( = ?auto_915385 ?auto_915390 ) ) ( not ( = ?auto_915385 ?auto_915391 ) ) ( not ( = ?auto_915385 ?auto_915392 ) ) ( not ( = ?auto_915385 ?auto_915393 ) ) ( not ( = ?auto_915385 ?auto_915394 ) ) ( not ( = ?auto_915385 ?auto_915395 ) ) ( not ( = ?auto_915385 ?auto_915396 ) ) ( not ( = ?auto_915385 ?auto_915397 ) ) ( not ( = ?auto_915385 ?auto_915398 ) ) ( not ( = ?auto_915385 ?auto_915399 ) ) ( not ( = ?auto_915385 ?auto_915400 ) ) ( not ( = ?auto_915386 ?auto_915387 ) ) ( not ( = ?auto_915386 ?auto_915388 ) ) ( not ( = ?auto_915386 ?auto_915389 ) ) ( not ( = ?auto_915386 ?auto_915390 ) ) ( not ( = ?auto_915386 ?auto_915391 ) ) ( not ( = ?auto_915386 ?auto_915392 ) ) ( not ( = ?auto_915386 ?auto_915393 ) ) ( not ( = ?auto_915386 ?auto_915394 ) ) ( not ( = ?auto_915386 ?auto_915395 ) ) ( not ( = ?auto_915386 ?auto_915396 ) ) ( not ( = ?auto_915386 ?auto_915397 ) ) ( not ( = ?auto_915386 ?auto_915398 ) ) ( not ( = ?auto_915386 ?auto_915399 ) ) ( not ( = ?auto_915386 ?auto_915400 ) ) ( not ( = ?auto_915387 ?auto_915388 ) ) ( not ( = ?auto_915387 ?auto_915389 ) ) ( not ( = ?auto_915387 ?auto_915390 ) ) ( not ( = ?auto_915387 ?auto_915391 ) ) ( not ( = ?auto_915387 ?auto_915392 ) ) ( not ( = ?auto_915387 ?auto_915393 ) ) ( not ( = ?auto_915387 ?auto_915394 ) ) ( not ( = ?auto_915387 ?auto_915395 ) ) ( not ( = ?auto_915387 ?auto_915396 ) ) ( not ( = ?auto_915387 ?auto_915397 ) ) ( not ( = ?auto_915387 ?auto_915398 ) ) ( not ( = ?auto_915387 ?auto_915399 ) ) ( not ( = ?auto_915387 ?auto_915400 ) ) ( not ( = ?auto_915388 ?auto_915389 ) ) ( not ( = ?auto_915388 ?auto_915390 ) ) ( not ( = ?auto_915388 ?auto_915391 ) ) ( not ( = ?auto_915388 ?auto_915392 ) ) ( not ( = ?auto_915388 ?auto_915393 ) ) ( not ( = ?auto_915388 ?auto_915394 ) ) ( not ( = ?auto_915388 ?auto_915395 ) ) ( not ( = ?auto_915388 ?auto_915396 ) ) ( not ( = ?auto_915388 ?auto_915397 ) ) ( not ( = ?auto_915388 ?auto_915398 ) ) ( not ( = ?auto_915388 ?auto_915399 ) ) ( not ( = ?auto_915388 ?auto_915400 ) ) ( not ( = ?auto_915389 ?auto_915390 ) ) ( not ( = ?auto_915389 ?auto_915391 ) ) ( not ( = ?auto_915389 ?auto_915392 ) ) ( not ( = ?auto_915389 ?auto_915393 ) ) ( not ( = ?auto_915389 ?auto_915394 ) ) ( not ( = ?auto_915389 ?auto_915395 ) ) ( not ( = ?auto_915389 ?auto_915396 ) ) ( not ( = ?auto_915389 ?auto_915397 ) ) ( not ( = ?auto_915389 ?auto_915398 ) ) ( not ( = ?auto_915389 ?auto_915399 ) ) ( not ( = ?auto_915389 ?auto_915400 ) ) ( not ( = ?auto_915390 ?auto_915391 ) ) ( not ( = ?auto_915390 ?auto_915392 ) ) ( not ( = ?auto_915390 ?auto_915393 ) ) ( not ( = ?auto_915390 ?auto_915394 ) ) ( not ( = ?auto_915390 ?auto_915395 ) ) ( not ( = ?auto_915390 ?auto_915396 ) ) ( not ( = ?auto_915390 ?auto_915397 ) ) ( not ( = ?auto_915390 ?auto_915398 ) ) ( not ( = ?auto_915390 ?auto_915399 ) ) ( not ( = ?auto_915390 ?auto_915400 ) ) ( not ( = ?auto_915391 ?auto_915392 ) ) ( not ( = ?auto_915391 ?auto_915393 ) ) ( not ( = ?auto_915391 ?auto_915394 ) ) ( not ( = ?auto_915391 ?auto_915395 ) ) ( not ( = ?auto_915391 ?auto_915396 ) ) ( not ( = ?auto_915391 ?auto_915397 ) ) ( not ( = ?auto_915391 ?auto_915398 ) ) ( not ( = ?auto_915391 ?auto_915399 ) ) ( not ( = ?auto_915391 ?auto_915400 ) ) ( not ( = ?auto_915392 ?auto_915393 ) ) ( not ( = ?auto_915392 ?auto_915394 ) ) ( not ( = ?auto_915392 ?auto_915395 ) ) ( not ( = ?auto_915392 ?auto_915396 ) ) ( not ( = ?auto_915392 ?auto_915397 ) ) ( not ( = ?auto_915392 ?auto_915398 ) ) ( not ( = ?auto_915392 ?auto_915399 ) ) ( not ( = ?auto_915392 ?auto_915400 ) ) ( not ( = ?auto_915393 ?auto_915394 ) ) ( not ( = ?auto_915393 ?auto_915395 ) ) ( not ( = ?auto_915393 ?auto_915396 ) ) ( not ( = ?auto_915393 ?auto_915397 ) ) ( not ( = ?auto_915393 ?auto_915398 ) ) ( not ( = ?auto_915393 ?auto_915399 ) ) ( not ( = ?auto_915393 ?auto_915400 ) ) ( not ( = ?auto_915394 ?auto_915395 ) ) ( not ( = ?auto_915394 ?auto_915396 ) ) ( not ( = ?auto_915394 ?auto_915397 ) ) ( not ( = ?auto_915394 ?auto_915398 ) ) ( not ( = ?auto_915394 ?auto_915399 ) ) ( not ( = ?auto_915394 ?auto_915400 ) ) ( not ( = ?auto_915395 ?auto_915396 ) ) ( not ( = ?auto_915395 ?auto_915397 ) ) ( not ( = ?auto_915395 ?auto_915398 ) ) ( not ( = ?auto_915395 ?auto_915399 ) ) ( not ( = ?auto_915395 ?auto_915400 ) ) ( not ( = ?auto_915396 ?auto_915397 ) ) ( not ( = ?auto_915396 ?auto_915398 ) ) ( not ( = ?auto_915396 ?auto_915399 ) ) ( not ( = ?auto_915396 ?auto_915400 ) ) ( not ( = ?auto_915397 ?auto_915398 ) ) ( not ( = ?auto_915397 ?auto_915399 ) ) ( not ( = ?auto_915397 ?auto_915400 ) ) ( not ( = ?auto_915398 ?auto_915399 ) ) ( not ( = ?auto_915398 ?auto_915400 ) ) ( not ( = ?auto_915399 ?auto_915400 ) ) ( ON ?auto_915398 ?auto_915399 ) ( ON ?auto_915397 ?auto_915398 ) ( ON ?auto_915396 ?auto_915397 ) ( ON ?auto_915395 ?auto_915396 ) ( ON ?auto_915394 ?auto_915395 ) ( ON ?auto_915393 ?auto_915394 ) ( ON ?auto_915392 ?auto_915393 ) ( ON ?auto_915391 ?auto_915392 ) ( ON ?auto_915390 ?auto_915391 ) ( ON ?auto_915389 ?auto_915390 ) ( ON ?auto_915388 ?auto_915389 ) ( ON ?auto_915387 ?auto_915388 ) ( ON ?auto_915386 ?auto_915387 ) ( ON ?auto_915385 ?auto_915386 ) ( CLEAR ?auto_915383 ) ( ON ?auto_915384 ?auto_915385 ) ( CLEAR ?auto_915384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_915382 ?auto_915383 ?auto_915384 )
      ( MAKE-18PILE ?auto_915382 ?auto_915383 ?auto_915384 ?auto_915385 ?auto_915386 ?auto_915387 ?auto_915388 ?auto_915389 ?auto_915390 ?auto_915391 ?auto_915392 ?auto_915393 ?auto_915394 ?auto_915395 ?auto_915396 ?auto_915397 ?auto_915398 ?auto_915399 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915419 - BLOCK
      ?auto_915420 - BLOCK
      ?auto_915421 - BLOCK
      ?auto_915422 - BLOCK
      ?auto_915423 - BLOCK
      ?auto_915424 - BLOCK
      ?auto_915425 - BLOCK
      ?auto_915426 - BLOCK
      ?auto_915427 - BLOCK
      ?auto_915428 - BLOCK
      ?auto_915429 - BLOCK
      ?auto_915430 - BLOCK
      ?auto_915431 - BLOCK
      ?auto_915432 - BLOCK
      ?auto_915433 - BLOCK
      ?auto_915434 - BLOCK
      ?auto_915435 - BLOCK
      ?auto_915436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915436 ) ( ON-TABLE ?auto_915419 ) ( ON ?auto_915420 ?auto_915419 ) ( not ( = ?auto_915419 ?auto_915420 ) ) ( not ( = ?auto_915419 ?auto_915421 ) ) ( not ( = ?auto_915419 ?auto_915422 ) ) ( not ( = ?auto_915419 ?auto_915423 ) ) ( not ( = ?auto_915419 ?auto_915424 ) ) ( not ( = ?auto_915419 ?auto_915425 ) ) ( not ( = ?auto_915419 ?auto_915426 ) ) ( not ( = ?auto_915419 ?auto_915427 ) ) ( not ( = ?auto_915419 ?auto_915428 ) ) ( not ( = ?auto_915419 ?auto_915429 ) ) ( not ( = ?auto_915419 ?auto_915430 ) ) ( not ( = ?auto_915419 ?auto_915431 ) ) ( not ( = ?auto_915419 ?auto_915432 ) ) ( not ( = ?auto_915419 ?auto_915433 ) ) ( not ( = ?auto_915419 ?auto_915434 ) ) ( not ( = ?auto_915419 ?auto_915435 ) ) ( not ( = ?auto_915419 ?auto_915436 ) ) ( not ( = ?auto_915420 ?auto_915421 ) ) ( not ( = ?auto_915420 ?auto_915422 ) ) ( not ( = ?auto_915420 ?auto_915423 ) ) ( not ( = ?auto_915420 ?auto_915424 ) ) ( not ( = ?auto_915420 ?auto_915425 ) ) ( not ( = ?auto_915420 ?auto_915426 ) ) ( not ( = ?auto_915420 ?auto_915427 ) ) ( not ( = ?auto_915420 ?auto_915428 ) ) ( not ( = ?auto_915420 ?auto_915429 ) ) ( not ( = ?auto_915420 ?auto_915430 ) ) ( not ( = ?auto_915420 ?auto_915431 ) ) ( not ( = ?auto_915420 ?auto_915432 ) ) ( not ( = ?auto_915420 ?auto_915433 ) ) ( not ( = ?auto_915420 ?auto_915434 ) ) ( not ( = ?auto_915420 ?auto_915435 ) ) ( not ( = ?auto_915420 ?auto_915436 ) ) ( not ( = ?auto_915421 ?auto_915422 ) ) ( not ( = ?auto_915421 ?auto_915423 ) ) ( not ( = ?auto_915421 ?auto_915424 ) ) ( not ( = ?auto_915421 ?auto_915425 ) ) ( not ( = ?auto_915421 ?auto_915426 ) ) ( not ( = ?auto_915421 ?auto_915427 ) ) ( not ( = ?auto_915421 ?auto_915428 ) ) ( not ( = ?auto_915421 ?auto_915429 ) ) ( not ( = ?auto_915421 ?auto_915430 ) ) ( not ( = ?auto_915421 ?auto_915431 ) ) ( not ( = ?auto_915421 ?auto_915432 ) ) ( not ( = ?auto_915421 ?auto_915433 ) ) ( not ( = ?auto_915421 ?auto_915434 ) ) ( not ( = ?auto_915421 ?auto_915435 ) ) ( not ( = ?auto_915421 ?auto_915436 ) ) ( not ( = ?auto_915422 ?auto_915423 ) ) ( not ( = ?auto_915422 ?auto_915424 ) ) ( not ( = ?auto_915422 ?auto_915425 ) ) ( not ( = ?auto_915422 ?auto_915426 ) ) ( not ( = ?auto_915422 ?auto_915427 ) ) ( not ( = ?auto_915422 ?auto_915428 ) ) ( not ( = ?auto_915422 ?auto_915429 ) ) ( not ( = ?auto_915422 ?auto_915430 ) ) ( not ( = ?auto_915422 ?auto_915431 ) ) ( not ( = ?auto_915422 ?auto_915432 ) ) ( not ( = ?auto_915422 ?auto_915433 ) ) ( not ( = ?auto_915422 ?auto_915434 ) ) ( not ( = ?auto_915422 ?auto_915435 ) ) ( not ( = ?auto_915422 ?auto_915436 ) ) ( not ( = ?auto_915423 ?auto_915424 ) ) ( not ( = ?auto_915423 ?auto_915425 ) ) ( not ( = ?auto_915423 ?auto_915426 ) ) ( not ( = ?auto_915423 ?auto_915427 ) ) ( not ( = ?auto_915423 ?auto_915428 ) ) ( not ( = ?auto_915423 ?auto_915429 ) ) ( not ( = ?auto_915423 ?auto_915430 ) ) ( not ( = ?auto_915423 ?auto_915431 ) ) ( not ( = ?auto_915423 ?auto_915432 ) ) ( not ( = ?auto_915423 ?auto_915433 ) ) ( not ( = ?auto_915423 ?auto_915434 ) ) ( not ( = ?auto_915423 ?auto_915435 ) ) ( not ( = ?auto_915423 ?auto_915436 ) ) ( not ( = ?auto_915424 ?auto_915425 ) ) ( not ( = ?auto_915424 ?auto_915426 ) ) ( not ( = ?auto_915424 ?auto_915427 ) ) ( not ( = ?auto_915424 ?auto_915428 ) ) ( not ( = ?auto_915424 ?auto_915429 ) ) ( not ( = ?auto_915424 ?auto_915430 ) ) ( not ( = ?auto_915424 ?auto_915431 ) ) ( not ( = ?auto_915424 ?auto_915432 ) ) ( not ( = ?auto_915424 ?auto_915433 ) ) ( not ( = ?auto_915424 ?auto_915434 ) ) ( not ( = ?auto_915424 ?auto_915435 ) ) ( not ( = ?auto_915424 ?auto_915436 ) ) ( not ( = ?auto_915425 ?auto_915426 ) ) ( not ( = ?auto_915425 ?auto_915427 ) ) ( not ( = ?auto_915425 ?auto_915428 ) ) ( not ( = ?auto_915425 ?auto_915429 ) ) ( not ( = ?auto_915425 ?auto_915430 ) ) ( not ( = ?auto_915425 ?auto_915431 ) ) ( not ( = ?auto_915425 ?auto_915432 ) ) ( not ( = ?auto_915425 ?auto_915433 ) ) ( not ( = ?auto_915425 ?auto_915434 ) ) ( not ( = ?auto_915425 ?auto_915435 ) ) ( not ( = ?auto_915425 ?auto_915436 ) ) ( not ( = ?auto_915426 ?auto_915427 ) ) ( not ( = ?auto_915426 ?auto_915428 ) ) ( not ( = ?auto_915426 ?auto_915429 ) ) ( not ( = ?auto_915426 ?auto_915430 ) ) ( not ( = ?auto_915426 ?auto_915431 ) ) ( not ( = ?auto_915426 ?auto_915432 ) ) ( not ( = ?auto_915426 ?auto_915433 ) ) ( not ( = ?auto_915426 ?auto_915434 ) ) ( not ( = ?auto_915426 ?auto_915435 ) ) ( not ( = ?auto_915426 ?auto_915436 ) ) ( not ( = ?auto_915427 ?auto_915428 ) ) ( not ( = ?auto_915427 ?auto_915429 ) ) ( not ( = ?auto_915427 ?auto_915430 ) ) ( not ( = ?auto_915427 ?auto_915431 ) ) ( not ( = ?auto_915427 ?auto_915432 ) ) ( not ( = ?auto_915427 ?auto_915433 ) ) ( not ( = ?auto_915427 ?auto_915434 ) ) ( not ( = ?auto_915427 ?auto_915435 ) ) ( not ( = ?auto_915427 ?auto_915436 ) ) ( not ( = ?auto_915428 ?auto_915429 ) ) ( not ( = ?auto_915428 ?auto_915430 ) ) ( not ( = ?auto_915428 ?auto_915431 ) ) ( not ( = ?auto_915428 ?auto_915432 ) ) ( not ( = ?auto_915428 ?auto_915433 ) ) ( not ( = ?auto_915428 ?auto_915434 ) ) ( not ( = ?auto_915428 ?auto_915435 ) ) ( not ( = ?auto_915428 ?auto_915436 ) ) ( not ( = ?auto_915429 ?auto_915430 ) ) ( not ( = ?auto_915429 ?auto_915431 ) ) ( not ( = ?auto_915429 ?auto_915432 ) ) ( not ( = ?auto_915429 ?auto_915433 ) ) ( not ( = ?auto_915429 ?auto_915434 ) ) ( not ( = ?auto_915429 ?auto_915435 ) ) ( not ( = ?auto_915429 ?auto_915436 ) ) ( not ( = ?auto_915430 ?auto_915431 ) ) ( not ( = ?auto_915430 ?auto_915432 ) ) ( not ( = ?auto_915430 ?auto_915433 ) ) ( not ( = ?auto_915430 ?auto_915434 ) ) ( not ( = ?auto_915430 ?auto_915435 ) ) ( not ( = ?auto_915430 ?auto_915436 ) ) ( not ( = ?auto_915431 ?auto_915432 ) ) ( not ( = ?auto_915431 ?auto_915433 ) ) ( not ( = ?auto_915431 ?auto_915434 ) ) ( not ( = ?auto_915431 ?auto_915435 ) ) ( not ( = ?auto_915431 ?auto_915436 ) ) ( not ( = ?auto_915432 ?auto_915433 ) ) ( not ( = ?auto_915432 ?auto_915434 ) ) ( not ( = ?auto_915432 ?auto_915435 ) ) ( not ( = ?auto_915432 ?auto_915436 ) ) ( not ( = ?auto_915433 ?auto_915434 ) ) ( not ( = ?auto_915433 ?auto_915435 ) ) ( not ( = ?auto_915433 ?auto_915436 ) ) ( not ( = ?auto_915434 ?auto_915435 ) ) ( not ( = ?auto_915434 ?auto_915436 ) ) ( not ( = ?auto_915435 ?auto_915436 ) ) ( ON ?auto_915435 ?auto_915436 ) ( ON ?auto_915434 ?auto_915435 ) ( ON ?auto_915433 ?auto_915434 ) ( ON ?auto_915432 ?auto_915433 ) ( ON ?auto_915431 ?auto_915432 ) ( ON ?auto_915430 ?auto_915431 ) ( ON ?auto_915429 ?auto_915430 ) ( ON ?auto_915428 ?auto_915429 ) ( ON ?auto_915427 ?auto_915428 ) ( ON ?auto_915426 ?auto_915427 ) ( ON ?auto_915425 ?auto_915426 ) ( ON ?auto_915424 ?auto_915425 ) ( ON ?auto_915423 ?auto_915424 ) ( ON ?auto_915422 ?auto_915423 ) ( CLEAR ?auto_915420 ) ( ON ?auto_915421 ?auto_915422 ) ( CLEAR ?auto_915421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_915419 ?auto_915420 ?auto_915421 )
      ( MAKE-18PILE ?auto_915419 ?auto_915420 ?auto_915421 ?auto_915422 ?auto_915423 ?auto_915424 ?auto_915425 ?auto_915426 ?auto_915427 ?auto_915428 ?auto_915429 ?auto_915430 ?auto_915431 ?auto_915432 ?auto_915433 ?auto_915434 ?auto_915435 ?auto_915436 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915455 - BLOCK
      ?auto_915456 - BLOCK
      ?auto_915457 - BLOCK
      ?auto_915458 - BLOCK
      ?auto_915459 - BLOCK
      ?auto_915460 - BLOCK
      ?auto_915461 - BLOCK
      ?auto_915462 - BLOCK
      ?auto_915463 - BLOCK
      ?auto_915464 - BLOCK
      ?auto_915465 - BLOCK
      ?auto_915466 - BLOCK
      ?auto_915467 - BLOCK
      ?auto_915468 - BLOCK
      ?auto_915469 - BLOCK
      ?auto_915470 - BLOCK
      ?auto_915471 - BLOCK
      ?auto_915472 - BLOCK
    )
    :vars
    (
      ?auto_915473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915472 ?auto_915473 ) ( ON-TABLE ?auto_915455 ) ( not ( = ?auto_915455 ?auto_915456 ) ) ( not ( = ?auto_915455 ?auto_915457 ) ) ( not ( = ?auto_915455 ?auto_915458 ) ) ( not ( = ?auto_915455 ?auto_915459 ) ) ( not ( = ?auto_915455 ?auto_915460 ) ) ( not ( = ?auto_915455 ?auto_915461 ) ) ( not ( = ?auto_915455 ?auto_915462 ) ) ( not ( = ?auto_915455 ?auto_915463 ) ) ( not ( = ?auto_915455 ?auto_915464 ) ) ( not ( = ?auto_915455 ?auto_915465 ) ) ( not ( = ?auto_915455 ?auto_915466 ) ) ( not ( = ?auto_915455 ?auto_915467 ) ) ( not ( = ?auto_915455 ?auto_915468 ) ) ( not ( = ?auto_915455 ?auto_915469 ) ) ( not ( = ?auto_915455 ?auto_915470 ) ) ( not ( = ?auto_915455 ?auto_915471 ) ) ( not ( = ?auto_915455 ?auto_915472 ) ) ( not ( = ?auto_915455 ?auto_915473 ) ) ( not ( = ?auto_915456 ?auto_915457 ) ) ( not ( = ?auto_915456 ?auto_915458 ) ) ( not ( = ?auto_915456 ?auto_915459 ) ) ( not ( = ?auto_915456 ?auto_915460 ) ) ( not ( = ?auto_915456 ?auto_915461 ) ) ( not ( = ?auto_915456 ?auto_915462 ) ) ( not ( = ?auto_915456 ?auto_915463 ) ) ( not ( = ?auto_915456 ?auto_915464 ) ) ( not ( = ?auto_915456 ?auto_915465 ) ) ( not ( = ?auto_915456 ?auto_915466 ) ) ( not ( = ?auto_915456 ?auto_915467 ) ) ( not ( = ?auto_915456 ?auto_915468 ) ) ( not ( = ?auto_915456 ?auto_915469 ) ) ( not ( = ?auto_915456 ?auto_915470 ) ) ( not ( = ?auto_915456 ?auto_915471 ) ) ( not ( = ?auto_915456 ?auto_915472 ) ) ( not ( = ?auto_915456 ?auto_915473 ) ) ( not ( = ?auto_915457 ?auto_915458 ) ) ( not ( = ?auto_915457 ?auto_915459 ) ) ( not ( = ?auto_915457 ?auto_915460 ) ) ( not ( = ?auto_915457 ?auto_915461 ) ) ( not ( = ?auto_915457 ?auto_915462 ) ) ( not ( = ?auto_915457 ?auto_915463 ) ) ( not ( = ?auto_915457 ?auto_915464 ) ) ( not ( = ?auto_915457 ?auto_915465 ) ) ( not ( = ?auto_915457 ?auto_915466 ) ) ( not ( = ?auto_915457 ?auto_915467 ) ) ( not ( = ?auto_915457 ?auto_915468 ) ) ( not ( = ?auto_915457 ?auto_915469 ) ) ( not ( = ?auto_915457 ?auto_915470 ) ) ( not ( = ?auto_915457 ?auto_915471 ) ) ( not ( = ?auto_915457 ?auto_915472 ) ) ( not ( = ?auto_915457 ?auto_915473 ) ) ( not ( = ?auto_915458 ?auto_915459 ) ) ( not ( = ?auto_915458 ?auto_915460 ) ) ( not ( = ?auto_915458 ?auto_915461 ) ) ( not ( = ?auto_915458 ?auto_915462 ) ) ( not ( = ?auto_915458 ?auto_915463 ) ) ( not ( = ?auto_915458 ?auto_915464 ) ) ( not ( = ?auto_915458 ?auto_915465 ) ) ( not ( = ?auto_915458 ?auto_915466 ) ) ( not ( = ?auto_915458 ?auto_915467 ) ) ( not ( = ?auto_915458 ?auto_915468 ) ) ( not ( = ?auto_915458 ?auto_915469 ) ) ( not ( = ?auto_915458 ?auto_915470 ) ) ( not ( = ?auto_915458 ?auto_915471 ) ) ( not ( = ?auto_915458 ?auto_915472 ) ) ( not ( = ?auto_915458 ?auto_915473 ) ) ( not ( = ?auto_915459 ?auto_915460 ) ) ( not ( = ?auto_915459 ?auto_915461 ) ) ( not ( = ?auto_915459 ?auto_915462 ) ) ( not ( = ?auto_915459 ?auto_915463 ) ) ( not ( = ?auto_915459 ?auto_915464 ) ) ( not ( = ?auto_915459 ?auto_915465 ) ) ( not ( = ?auto_915459 ?auto_915466 ) ) ( not ( = ?auto_915459 ?auto_915467 ) ) ( not ( = ?auto_915459 ?auto_915468 ) ) ( not ( = ?auto_915459 ?auto_915469 ) ) ( not ( = ?auto_915459 ?auto_915470 ) ) ( not ( = ?auto_915459 ?auto_915471 ) ) ( not ( = ?auto_915459 ?auto_915472 ) ) ( not ( = ?auto_915459 ?auto_915473 ) ) ( not ( = ?auto_915460 ?auto_915461 ) ) ( not ( = ?auto_915460 ?auto_915462 ) ) ( not ( = ?auto_915460 ?auto_915463 ) ) ( not ( = ?auto_915460 ?auto_915464 ) ) ( not ( = ?auto_915460 ?auto_915465 ) ) ( not ( = ?auto_915460 ?auto_915466 ) ) ( not ( = ?auto_915460 ?auto_915467 ) ) ( not ( = ?auto_915460 ?auto_915468 ) ) ( not ( = ?auto_915460 ?auto_915469 ) ) ( not ( = ?auto_915460 ?auto_915470 ) ) ( not ( = ?auto_915460 ?auto_915471 ) ) ( not ( = ?auto_915460 ?auto_915472 ) ) ( not ( = ?auto_915460 ?auto_915473 ) ) ( not ( = ?auto_915461 ?auto_915462 ) ) ( not ( = ?auto_915461 ?auto_915463 ) ) ( not ( = ?auto_915461 ?auto_915464 ) ) ( not ( = ?auto_915461 ?auto_915465 ) ) ( not ( = ?auto_915461 ?auto_915466 ) ) ( not ( = ?auto_915461 ?auto_915467 ) ) ( not ( = ?auto_915461 ?auto_915468 ) ) ( not ( = ?auto_915461 ?auto_915469 ) ) ( not ( = ?auto_915461 ?auto_915470 ) ) ( not ( = ?auto_915461 ?auto_915471 ) ) ( not ( = ?auto_915461 ?auto_915472 ) ) ( not ( = ?auto_915461 ?auto_915473 ) ) ( not ( = ?auto_915462 ?auto_915463 ) ) ( not ( = ?auto_915462 ?auto_915464 ) ) ( not ( = ?auto_915462 ?auto_915465 ) ) ( not ( = ?auto_915462 ?auto_915466 ) ) ( not ( = ?auto_915462 ?auto_915467 ) ) ( not ( = ?auto_915462 ?auto_915468 ) ) ( not ( = ?auto_915462 ?auto_915469 ) ) ( not ( = ?auto_915462 ?auto_915470 ) ) ( not ( = ?auto_915462 ?auto_915471 ) ) ( not ( = ?auto_915462 ?auto_915472 ) ) ( not ( = ?auto_915462 ?auto_915473 ) ) ( not ( = ?auto_915463 ?auto_915464 ) ) ( not ( = ?auto_915463 ?auto_915465 ) ) ( not ( = ?auto_915463 ?auto_915466 ) ) ( not ( = ?auto_915463 ?auto_915467 ) ) ( not ( = ?auto_915463 ?auto_915468 ) ) ( not ( = ?auto_915463 ?auto_915469 ) ) ( not ( = ?auto_915463 ?auto_915470 ) ) ( not ( = ?auto_915463 ?auto_915471 ) ) ( not ( = ?auto_915463 ?auto_915472 ) ) ( not ( = ?auto_915463 ?auto_915473 ) ) ( not ( = ?auto_915464 ?auto_915465 ) ) ( not ( = ?auto_915464 ?auto_915466 ) ) ( not ( = ?auto_915464 ?auto_915467 ) ) ( not ( = ?auto_915464 ?auto_915468 ) ) ( not ( = ?auto_915464 ?auto_915469 ) ) ( not ( = ?auto_915464 ?auto_915470 ) ) ( not ( = ?auto_915464 ?auto_915471 ) ) ( not ( = ?auto_915464 ?auto_915472 ) ) ( not ( = ?auto_915464 ?auto_915473 ) ) ( not ( = ?auto_915465 ?auto_915466 ) ) ( not ( = ?auto_915465 ?auto_915467 ) ) ( not ( = ?auto_915465 ?auto_915468 ) ) ( not ( = ?auto_915465 ?auto_915469 ) ) ( not ( = ?auto_915465 ?auto_915470 ) ) ( not ( = ?auto_915465 ?auto_915471 ) ) ( not ( = ?auto_915465 ?auto_915472 ) ) ( not ( = ?auto_915465 ?auto_915473 ) ) ( not ( = ?auto_915466 ?auto_915467 ) ) ( not ( = ?auto_915466 ?auto_915468 ) ) ( not ( = ?auto_915466 ?auto_915469 ) ) ( not ( = ?auto_915466 ?auto_915470 ) ) ( not ( = ?auto_915466 ?auto_915471 ) ) ( not ( = ?auto_915466 ?auto_915472 ) ) ( not ( = ?auto_915466 ?auto_915473 ) ) ( not ( = ?auto_915467 ?auto_915468 ) ) ( not ( = ?auto_915467 ?auto_915469 ) ) ( not ( = ?auto_915467 ?auto_915470 ) ) ( not ( = ?auto_915467 ?auto_915471 ) ) ( not ( = ?auto_915467 ?auto_915472 ) ) ( not ( = ?auto_915467 ?auto_915473 ) ) ( not ( = ?auto_915468 ?auto_915469 ) ) ( not ( = ?auto_915468 ?auto_915470 ) ) ( not ( = ?auto_915468 ?auto_915471 ) ) ( not ( = ?auto_915468 ?auto_915472 ) ) ( not ( = ?auto_915468 ?auto_915473 ) ) ( not ( = ?auto_915469 ?auto_915470 ) ) ( not ( = ?auto_915469 ?auto_915471 ) ) ( not ( = ?auto_915469 ?auto_915472 ) ) ( not ( = ?auto_915469 ?auto_915473 ) ) ( not ( = ?auto_915470 ?auto_915471 ) ) ( not ( = ?auto_915470 ?auto_915472 ) ) ( not ( = ?auto_915470 ?auto_915473 ) ) ( not ( = ?auto_915471 ?auto_915472 ) ) ( not ( = ?auto_915471 ?auto_915473 ) ) ( not ( = ?auto_915472 ?auto_915473 ) ) ( ON ?auto_915471 ?auto_915472 ) ( ON ?auto_915470 ?auto_915471 ) ( ON ?auto_915469 ?auto_915470 ) ( ON ?auto_915468 ?auto_915469 ) ( ON ?auto_915467 ?auto_915468 ) ( ON ?auto_915466 ?auto_915467 ) ( ON ?auto_915465 ?auto_915466 ) ( ON ?auto_915464 ?auto_915465 ) ( ON ?auto_915463 ?auto_915464 ) ( ON ?auto_915462 ?auto_915463 ) ( ON ?auto_915461 ?auto_915462 ) ( ON ?auto_915460 ?auto_915461 ) ( ON ?auto_915459 ?auto_915460 ) ( ON ?auto_915458 ?auto_915459 ) ( ON ?auto_915457 ?auto_915458 ) ( CLEAR ?auto_915455 ) ( ON ?auto_915456 ?auto_915457 ) ( CLEAR ?auto_915456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_915455 ?auto_915456 )
      ( MAKE-18PILE ?auto_915455 ?auto_915456 ?auto_915457 ?auto_915458 ?auto_915459 ?auto_915460 ?auto_915461 ?auto_915462 ?auto_915463 ?auto_915464 ?auto_915465 ?auto_915466 ?auto_915467 ?auto_915468 ?auto_915469 ?auto_915470 ?auto_915471 ?auto_915472 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915492 - BLOCK
      ?auto_915493 - BLOCK
      ?auto_915494 - BLOCK
      ?auto_915495 - BLOCK
      ?auto_915496 - BLOCK
      ?auto_915497 - BLOCK
      ?auto_915498 - BLOCK
      ?auto_915499 - BLOCK
      ?auto_915500 - BLOCK
      ?auto_915501 - BLOCK
      ?auto_915502 - BLOCK
      ?auto_915503 - BLOCK
      ?auto_915504 - BLOCK
      ?auto_915505 - BLOCK
      ?auto_915506 - BLOCK
      ?auto_915507 - BLOCK
      ?auto_915508 - BLOCK
      ?auto_915509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915509 ) ( ON-TABLE ?auto_915492 ) ( not ( = ?auto_915492 ?auto_915493 ) ) ( not ( = ?auto_915492 ?auto_915494 ) ) ( not ( = ?auto_915492 ?auto_915495 ) ) ( not ( = ?auto_915492 ?auto_915496 ) ) ( not ( = ?auto_915492 ?auto_915497 ) ) ( not ( = ?auto_915492 ?auto_915498 ) ) ( not ( = ?auto_915492 ?auto_915499 ) ) ( not ( = ?auto_915492 ?auto_915500 ) ) ( not ( = ?auto_915492 ?auto_915501 ) ) ( not ( = ?auto_915492 ?auto_915502 ) ) ( not ( = ?auto_915492 ?auto_915503 ) ) ( not ( = ?auto_915492 ?auto_915504 ) ) ( not ( = ?auto_915492 ?auto_915505 ) ) ( not ( = ?auto_915492 ?auto_915506 ) ) ( not ( = ?auto_915492 ?auto_915507 ) ) ( not ( = ?auto_915492 ?auto_915508 ) ) ( not ( = ?auto_915492 ?auto_915509 ) ) ( not ( = ?auto_915493 ?auto_915494 ) ) ( not ( = ?auto_915493 ?auto_915495 ) ) ( not ( = ?auto_915493 ?auto_915496 ) ) ( not ( = ?auto_915493 ?auto_915497 ) ) ( not ( = ?auto_915493 ?auto_915498 ) ) ( not ( = ?auto_915493 ?auto_915499 ) ) ( not ( = ?auto_915493 ?auto_915500 ) ) ( not ( = ?auto_915493 ?auto_915501 ) ) ( not ( = ?auto_915493 ?auto_915502 ) ) ( not ( = ?auto_915493 ?auto_915503 ) ) ( not ( = ?auto_915493 ?auto_915504 ) ) ( not ( = ?auto_915493 ?auto_915505 ) ) ( not ( = ?auto_915493 ?auto_915506 ) ) ( not ( = ?auto_915493 ?auto_915507 ) ) ( not ( = ?auto_915493 ?auto_915508 ) ) ( not ( = ?auto_915493 ?auto_915509 ) ) ( not ( = ?auto_915494 ?auto_915495 ) ) ( not ( = ?auto_915494 ?auto_915496 ) ) ( not ( = ?auto_915494 ?auto_915497 ) ) ( not ( = ?auto_915494 ?auto_915498 ) ) ( not ( = ?auto_915494 ?auto_915499 ) ) ( not ( = ?auto_915494 ?auto_915500 ) ) ( not ( = ?auto_915494 ?auto_915501 ) ) ( not ( = ?auto_915494 ?auto_915502 ) ) ( not ( = ?auto_915494 ?auto_915503 ) ) ( not ( = ?auto_915494 ?auto_915504 ) ) ( not ( = ?auto_915494 ?auto_915505 ) ) ( not ( = ?auto_915494 ?auto_915506 ) ) ( not ( = ?auto_915494 ?auto_915507 ) ) ( not ( = ?auto_915494 ?auto_915508 ) ) ( not ( = ?auto_915494 ?auto_915509 ) ) ( not ( = ?auto_915495 ?auto_915496 ) ) ( not ( = ?auto_915495 ?auto_915497 ) ) ( not ( = ?auto_915495 ?auto_915498 ) ) ( not ( = ?auto_915495 ?auto_915499 ) ) ( not ( = ?auto_915495 ?auto_915500 ) ) ( not ( = ?auto_915495 ?auto_915501 ) ) ( not ( = ?auto_915495 ?auto_915502 ) ) ( not ( = ?auto_915495 ?auto_915503 ) ) ( not ( = ?auto_915495 ?auto_915504 ) ) ( not ( = ?auto_915495 ?auto_915505 ) ) ( not ( = ?auto_915495 ?auto_915506 ) ) ( not ( = ?auto_915495 ?auto_915507 ) ) ( not ( = ?auto_915495 ?auto_915508 ) ) ( not ( = ?auto_915495 ?auto_915509 ) ) ( not ( = ?auto_915496 ?auto_915497 ) ) ( not ( = ?auto_915496 ?auto_915498 ) ) ( not ( = ?auto_915496 ?auto_915499 ) ) ( not ( = ?auto_915496 ?auto_915500 ) ) ( not ( = ?auto_915496 ?auto_915501 ) ) ( not ( = ?auto_915496 ?auto_915502 ) ) ( not ( = ?auto_915496 ?auto_915503 ) ) ( not ( = ?auto_915496 ?auto_915504 ) ) ( not ( = ?auto_915496 ?auto_915505 ) ) ( not ( = ?auto_915496 ?auto_915506 ) ) ( not ( = ?auto_915496 ?auto_915507 ) ) ( not ( = ?auto_915496 ?auto_915508 ) ) ( not ( = ?auto_915496 ?auto_915509 ) ) ( not ( = ?auto_915497 ?auto_915498 ) ) ( not ( = ?auto_915497 ?auto_915499 ) ) ( not ( = ?auto_915497 ?auto_915500 ) ) ( not ( = ?auto_915497 ?auto_915501 ) ) ( not ( = ?auto_915497 ?auto_915502 ) ) ( not ( = ?auto_915497 ?auto_915503 ) ) ( not ( = ?auto_915497 ?auto_915504 ) ) ( not ( = ?auto_915497 ?auto_915505 ) ) ( not ( = ?auto_915497 ?auto_915506 ) ) ( not ( = ?auto_915497 ?auto_915507 ) ) ( not ( = ?auto_915497 ?auto_915508 ) ) ( not ( = ?auto_915497 ?auto_915509 ) ) ( not ( = ?auto_915498 ?auto_915499 ) ) ( not ( = ?auto_915498 ?auto_915500 ) ) ( not ( = ?auto_915498 ?auto_915501 ) ) ( not ( = ?auto_915498 ?auto_915502 ) ) ( not ( = ?auto_915498 ?auto_915503 ) ) ( not ( = ?auto_915498 ?auto_915504 ) ) ( not ( = ?auto_915498 ?auto_915505 ) ) ( not ( = ?auto_915498 ?auto_915506 ) ) ( not ( = ?auto_915498 ?auto_915507 ) ) ( not ( = ?auto_915498 ?auto_915508 ) ) ( not ( = ?auto_915498 ?auto_915509 ) ) ( not ( = ?auto_915499 ?auto_915500 ) ) ( not ( = ?auto_915499 ?auto_915501 ) ) ( not ( = ?auto_915499 ?auto_915502 ) ) ( not ( = ?auto_915499 ?auto_915503 ) ) ( not ( = ?auto_915499 ?auto_915504 ) ) ( not ( = ?auto_915499 ?auto_915505 ) ) ( not ( = ?auto_915499 ?auto_915506 ) ) ( not ( = ?auto_915499 ?auto_915507 ) ) ( not ( = ?auto_915499 ?auto_915508 ) ) ( not ( = ?auto_915499 ?auto_915509 ) ) ( not ( = ?auto_915500 ?auto_915501 ) ) ( not ( = ?auto_915500 ?auto_915502 ) ) ( not ( = ?auto_915500 ?auto_915503 ) ) ( not ( = ?auto_915500 ?auto_915504 ) ) ( not ( = ?auto_915500 ?auto_915505 ) ) ( not ( = ?auto_915500 ?auto_915506 ) ) ( not ( = ?auto_915500 ?auto_915507 ) ) ( not ( = ?auto_915500 ?auto_915508 ) ) ( not ( = ?auto_915500 ?auto_915509 ) ) ( not ( = ?auto_915501 ?auto_915502 ) ) ( not ( = ?auto_915501 ?auto_915503 ) ) ( not ( = ?auto_915501 ?auto_915504 ) ) ( not ( = ?auto_915501 ?auto_915505 ) ) ( not ( = ?auto_915501 ?auto_915506 ) ) ( not ( = ?auto_915501 ?auto_915507 ) ) ( not ( = ?auto_915501 ?auto_915508 ) ) ( not ( = ?auto_915501 ?auto_915509 ) ) ( not ( = ?auto_915502 ?auto_915503 ) ) ( not ( = ?auto_915502 ?auto_915504 ) ) ( not ( = ?auto_915502 ?auto_915505 ) ) ( not ( = ?auto_915502 ?auto_915506 ) ) ( not ( = ?auto_915502 ?auto_915507 ) ) ( not ( = ?auto_915502 ?auto_915508 ) ) ( not ( = ?auto_915502 ?auto_915509 ) ) ( not ( = ?auto_915503 ?auto_915504 ) ) ( not ( = ?auto_915503 ?auto_915505 ) ) ( not ( = ?auto_915503 ?auto_915506 ) ) ( not ( = ?auto_915503 ?auto_915507 ) ) ( not ( = ?auto_915503 ?auto_915508 ) ) ( not ( = ?auto_915503 ?auto_915509 ) ) ( not ( = ?auto_915504 ?auto_915505 ) ) ( not ( = ?auto_915504 ?auto_915506 ) ) ( not ( = ?auto_915504 ?auto_915507 ) ) ( not ( = ?auto_915504 ?auto_915508 ) ) ( not ( = ?auto_915504 ?auto_915509 ) ) ( not ( = ?auto_915505 ?auto_915506 ) ) ( not ( = ?auto_915505 ?auto_915507 ) ) ( not ( = ?auto_915505 ?auto_915508 ) ) ( not ( = ?auto_915505 ?auto_915509 ) ) ( not ( = ?auto_915506 ?auto_915507 ) ) ( not ( = ?auto_915506 ?auto_915508 ) ) ( not ( = ?auto_915506 ?auto_915509 ) ) ( not ( = ?auto_915507 ?auto_915508 ) ) ( not ( = ?auto_915507 ?auto_915509 ) ) ( not ( = ?auto_915508 ?auto_915509 ) ) ( ON ?auto_915508 ?auto_915509 ) ( ON ?auto_915507 ?auto_915508 ) ( ON ?auto_915506 ?auto_915507 ) ( ON ?auto_915505 ?auto_915506 ) ( ON ?auto_915504 ?auto_915505 ) ( ON ?auto_915503 ?auto_915504 ) ( ON ?auto_915502 ?auto_915503 ) ( ON ?auto_915501 ?auto_915502 ) ( ON ?auto_915500 ?auto_915501 ) ( ON ?auto_915499 ?auto_915500 ) ( ON ?auto_915498 ?auto_915499 ) ( ON ?auto_915497 ?auto_915498 ) ( ON ?auto_915496 ?auto_915497 ) ( ON ?auto_915495 ?auto_915496 ) ( ON ?auto_915494 ?auto_915495 ) ( CLEAR ?auto_915492 ) ( ON ?auto_915493 ?auto_915494 ) ( CLEAR ?auto_915493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_915492 ?auto_915493 )
      ( MAKE-18PILE ?auto_915492 ?auto_915493 ?auto_915494 ?auto_915495 ?auto_915496 ?auto_915497 ?auto_915498 ?auto_915499 ?auto_915500 ?auto_915501 ?auto_915502 ?auto_915503 ?auto_915504 ?auto_915505 ?auto_915506 ?auto_915507 ?auto_915508 ?auto_915509 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915528 - BLOCK
      ?auto_915529 - BLOCK
      ?auto_915530 - BLOCK
      ?auto_915531 - BLOCK
      ?auto_915532 - BLOCK
      ?auto_915533 - BLOCK
      ?auto_915534 - BLOCK
      ?auto_915535 - BLOCK
      ?auto_915536 - BLOCK
      ?auto_915537 - BLOCK
      ?auto_915538 - BLOCK
      ?auto_915539 - BLOCK
      ?auto_915540 - BLOCK
      ?auto_915541 - BLOCK
      ?auto_915542 - BLOCK
      ?auto_915543 - BLOCK
      ?auto_915544 - BLOCK
      ?auto_915545 - BLOCK
    )
    :vars
    (
      ?auto_915546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_915545 ?auto_915546 ) ( not ( = ?auto_915528 ?auto_915529 ) ) ( not ( = ?auto_915528 ?auto_915530 ) ) ( not ( = ?auto_915528 ?auto_915531 ) ) ( not ( = ?auto_915528 ?auto_915532 ) ) ( not ( = ?auto_915528 ?auto_915533 ) ) ( not ( = ?auto_915528 ?auto_915534 ) ) ( not ( = ?auto_915528 ?auto_915535 ) ) ( not ( = ?auto_915528 ?auto_915536 ) ) ( not ( = ?auto_915528 ?auto_915537 ) ) ( not ( = ?auto_915528 ?auto_915538 ) ) ( not ( = ?auto_915528 ?auto_915539 ) ) ( not ( = ?auto_915528 ?auto_915540 ) ) ( not ( = ?auto_915528 ?auto_915541 ) ) ( not ( = ?auto_915528 ?auto_915542 ) ) ( not ( = ?auto_915528 ?auto_915543 ) ) ( not ( = ?auto_915528 ?auto_915544 ) ) ( not ( = ?auto_915528 ?auto_915545 ) ) ( not ( = ?auto_915528 ?auto_915546 ) ) ( not ( = ?auto_915529 ?auto_915530 ) ) ( not ( = ?auto_915529 ?auto_915531 ) ) ( not ( = ?auto_915529 ?auto_915532 ) ) ( not ( = ?auto_915529 ?auto_915533 ) ) ( not ( = ?auto_915529 ?auto_915534 ) ) ( not ( = ?auto_915529 ?auto_915535 ) ) ( not ( = ?auto_915529 ?auto_915536 ) ) ( not ( = ?auto_915529 ?auto_915537 ) ) ( not ( = ?auto_915529 ?auto_915538 ) ) ( not ( = ?auto_915529 ?auto_915539 ) ) ( not ( = ?auto_915529 ?auto_915540 ) ) ( not ( = ?auto_915529 ?auto_915541 ) ) ( not ( = ?auto_915529 ?auto_915542 ) ) ( not ( = ?auto_915529 ?auto_915543 ) ) ( not ( = ?auto_915529 ?auto_915544 ) ) ( not ( = ?auto_915529 ?auto_915545 ) ) ( not ( = ?auto_915529 ?auto_915546 ) ) ( not ( = ?auto_915530 ?auto_915531 ) ) ( not ( = ?auto_915530 ?auto_915532 ) ) ( not ( = ?auto_915530 ?auto_915533 ) ) ( not ( = ?auto_915530 ?auto_915534 ) ) ( not ( = ?auto_915530 ?auto_915535 ) ) ( not ( = ?auto_915530 ?auto_915536 ) ) ( not ( = ?auto_915530 ?auto_915537 ) ) ( not ( = ?auto_915530 ?auto_915538 ) ) ( not ( = ?auto_915530 ?auto_915539 ) ) ( not ( = ?auto_915530 ?auto_915540 ) ) ( not ( = ?auto_915530 ?auto_915541 ) ) ( not ( = ?auto_915530 ?auto_915542 ) ) ( not ( = ?auto_915530 ?auto_915543 ) ) ( not ( = ?auto_915530 ?auto_915544 ) ) ( not ( = ?auto_915530 ?auto_915545 ) ) ( not ( = ?auto_915530 ?auto_915546 ) ) ( not ( = ?auto_915531 ?auto_915532 ) ) ( not ( = ?auto_915531 ?auto_915533 ) ) ( not ( = ?auto_915531 ?auto_915534 ) ) ( not ( = ?auto_915531 ?auto_915535 ) ) ( not ( = ?auto_915531 ?auto_915536 ) ) ( not ( = ?auto_915531 ?auto_915537 ) ) ( not ( = ?auto_915531 ?auto_915538 ) ) ( not ( = ?auto_915531 ?auto_915539 ) ) ( not ( = ?auto_915531 ?auto_915540 ) ) ( not ( = ?auto_915531 ?auto_915541 ) ) ( not ( = ?auto_915531 ?auto_915542 ) ) ( not ( = ?auto_915531 ?auto_915543 ) ) ( not ( = ?auto_915531 ?auto_915544 ) ) ( not ( = ?auto_915531 ?auto_915545 ) ) ( not ( = ?auto_915531 ?auto_915546 ) ) ( not ( = ?auto_915532 ?auto_915533 ) ) ( not ( = ?auto_915532 ?auto_915534 ) ) ( not ( = ?auto_915532 ?auto_915535 ) ) ( not ( = ?auto_915532 ?auto_915536 ) ) ( not ( = ?auto_915532 ?auto_915537 ) ) ( not ( = ?auto_915532 ?auto_915538 ) ) ( not ( = ?auto_915532 ?auto_915539 ) ) ( not ( = ?auto_915532 ?auto_915540 ) ) ( not ( = ?auto_915532 ?auto_915541 ) ) ( not ( = ?auto_915532 ?auto_915542 ) ) ( not ( = ?auto_915532 ?auto_915543 ) ) ( not ( = ?auto_915532 ?auto_915544 ) ) ( not ( = ?auto_915532 ?auto_915545 ) ) ( not ( = ?auto_915532 ?auto_915546 ) ) ( not ( = ?auto_915533 ?auto_915534 ) ) ( not ( = ?auto_915533 ?auto_915535 ) ) ( not ( = ?auto_915533 ?auto_915536 ) ) ( not ( = ?auto_915533 ?auto_915537 ) ) ( not ( = ?auto_915533 ?auto_915538 ) ) ( not ( = ?auto_915533 ?auto_915539 ) ) ( not ( = ?auto_915533 ?auto_915540 ) ) ( not ( = ?auto_915533 ?auto_915541 ) ) ( not ( = ?auto_915533 ?auto_915542 ) ) ( not ( = ?auto_915533 ?auto_915543 ) ) ( not ( = ?auto_915533 ?auto_915544 ) ) ( not ( = ?auto_915533 ?auto_915545 ) ) ( not ( = ?auto_915533 ?auto_915546 ) ) ( not ( = ?auto_915534 ?auto_915535 ) ) ( not ( = ?auto_915534 ?auto_915536 ) ) ( not ( = ?auto_915534 ?auto_915537 ) ) ( not ( = ?auto_915534 ?auto_915538 ) ) ( not ( = ?auto_915534 ?auto_915539 ) ) ( not ( = ?auto_915534 ?auto_915540 ) ) ( not ( = ?auto_915534 ?auto_915541 ) ) ( not ( = ?auto_915534 ?auto_915542 ) ) ( not ( = ?auto_915534 ?auto_915543 ) ) ( not ( = ?auto_915534 ?auto_915544 ) ) ( not ( = ?auto_915534 ?auto_915545 ) ) ( not ( = ?auto_915534 ?auto_915546 ) ) ( not ( = ?auto_915535 ?auto_915536 ) ) ( not ( = ?auto_915535 ?auto_915537 ) ) ( not ( = ?auto_915535 ?auto_915538 ) ) ( not ( = ?auto_915535 ?auto_915539 ) ) ( not ( = ?auto_915535 ?auto_915540 ) ) ( not ( = ?auto_915535 ?auto_915541 ) ) ( not ( = ?auto_915535 ?auto_915542 ) ) ( not ( = ?auto_915535 ?auto_915543 ) ) ( not ( = ?auto_915535 ?auto_915544 ) ) ( not ( = ?auto_915535 ?auto_915545 ) ) ( not ( = ?auto_915535 ?auto_915546 ) ) ( not ( = ?auto_915536 ?auto_915537 ) ) ( not ( = ?auto_915536 ?auto_915538 ) ) ( not ( = ?auto_915536 ?auto_915539 ) ) ( not ( = ?auto_915536 ?auto_915540 ) ) ( not ( = ?auto_915536 ?auto_915541 ) ) ( not ( = ?auto_915536 ?auto_915542 ) ) ( not ( = ?auto_915536 ?auto_915543 ) ) ( not ( = ?auto_915536 ?auto_915544 ) ) ( not ( = ?auto_915536 ?auto_915545 ) ) ( not ( = ?auto_915536 ?auto_915546 ) ) ( not ( = ?auto_915537 ?auto_915538 ) ) ( not ( = ?auto_915537 ?auto_915539 ) ) ( not ( = ?auto_915537 ?auto_915540 ) ) ( not ( = ?auto_915537 ?auto_915541 ) ) ( not ( = ?auto_915537 ?auto_915542 ) ) ( not ( = ?auto_915537 ?auto_915543 ) ) ( not ( = ?auto_915537 ?auto_915544 ) ) ( not ( = ?auto_915537 ?auto_915545 ) ) ( not ( = ?auto_915537 ?auto_915546 ) ) ( not ( = ?auto_915538 ?auto_915539 ) ) ( not ( = ?auto_915538 ?auto_915540 ) ) ( not ( = ?auto_915538 ?auto_915541 ) ) ( not ( = ?auto_915538 ?auto_915542 ) ) ( not ( = ?auto_915538 ?auto_915543 ) ) ( not ( = ?auto_915538 ?auto_915544 ) ) ( not ( = ?auto_915538 ?auto_915545 ) ) ( not ( = ?auto_915538 ?auto_915546 ) ) ( not ( = ?auto_915539 ?auto_915540 ) ) ( not ( = ?auto_915539 ?auto_915541 ) ) ( not ( = ?auto_915539 ?auto_915542 ) ) ( not ( = ?auto_915539 ?auto_915543 ) ) ( not ( = ?auto_915539 ?auto_915544 ) ) ( not ( = ?auto_915539 ?auto_915545 ) ) ( not ( = ?auto_915539 ?auto_915546 ) ) ( not ( = ?auto_915540 ?auto_915541 ) ) ( not ( = ?auto_915540 ?auto_915542 ) ) ( not ( = ?auto_915540 ?auto_915543 ) ) ( not ( = ?auto_915540 ?auto_915544 ) ) ( not ( = ?auto_915540 ?auto_915545 ) ) ( not ( = ?auto_915540 ?auto_915546 ) ) ( not ( = ?auto_915541 ?auto_915542 ) ) ( not ( = ?auto_915541 ?auto_915543 ) ) ( not ( = ?auto_915541 ?auto_915544 ) ) ( not ( = ?auto_915541 ?auto_915545 ) ) ( not ( = ?auto_915541 ?auto_915546 ) ) ( not ( = ?auto_915542 ?auto_915543 ) ) ( not ( = ?auto_915542 ?auto_915544 ) ) ( not ( = ?auto_915542 ?auto_915545 ) ) ( not ( = ?auto_915542 ?auto_915546 ) ) ( not ( = ?auto_915543 ?auto_915544 ) ) ( not ( = ?auto_915543 ?auto_915545 ) ) ( not ( = ?auto_915543 ?auto_915546 ) ) ( not ( = ?auto_915544 ?auto_915545 ) ) ( not ( = ?auto_915544 ?auto_915546 ) ) ( not ( = ?auto_915545 ?auto_915546 ) ) ( ON ?auto_915544 ?auto_915545 ) ( ON ?auto_915543 ?auto_915544 ) ( ON ?auto_915542 ?auto_915543 ) ( ON ?auto_915541 ?auto_915542 ) ( ON ?auto_915540 ?auto_915541 ) ( ON ?auto_915539 ?auto_915540 ) ( ON ?auto_915538 ?auto_915539 ) ( ON ?auto_915537 ?auto_915538 ) ( ON ?auto_915536 ?auto_915537 ) ( ON ?auto_915535 ?auto_915536 ) ( ON ?auto_915534 ?auto_915535 ) ( ON ?auto_915533 ?auto_915534 ) ( ON ?auto_915532 ?auto_915533 ) ( ON ?auto_915531 ?auto_915532 ) ( ON ?auto_915530 ?auto_915531 ) ( ON ?auto_915529 ?auto_915530 ) ( ON ?auto_915528 ?auto_915529 ) ( CLEAR ?auto_915528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_915528 )
      ( MAKE-18PILE ?auto_915528 ?auto_915529 ?auto_915530 ?auto_915531 ?auto_915532 ?auto_915533 ?auto_915534 ?auto_915535 ?auto_915536 ?auto_915537 ?auto_915538 ?auto_915539 ?auto_915540 ?auto_915541 ?auto_915542 ?auto_915543 ?auto_915544 ?auto_915545 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915565 - BLOCK
      ?auto_915566 - BLOCK
      ?auto_915567 - BLOCK
      ?auto_915568 - BLOCK
      ?auto_915569 - BLOCK
      ?auto_915570 - BLOCK
      ?auto_915571 - BLOCK
      ?auto_915572 - BLOCK
      ?auto_915573 - BLOCK
      ?auto_915574 - BLOCK
      ?auto_915575 - BLOCK
      ?auto_915576 - BLOCK
      ?auto_915577 - BLOCK
      ?auto_915578 - BLOCK
      ?auto_915579 - BLOCK
      ?auto_915580 - BLOCK
      ?auto_915581 - BLOCK
      ?auto_915582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_915582 ) ( not ( = ?auto_915565 ?auto_915566 ) ) ( not ( = ?auto_915565 ?auto_915567 ) ) ( not ( = ?auto_915565 ?auto_915568 ) ) ( not ( = ?auto_915565 ?auto_915569 ) ) ( not ( = ?auto_915565 ?auto_915570 ) ) ( not ( = ?auto_915565 ?auto_915571 ) ) ( not ( = ?auto_915565 ?auto_915572 ) ) ( not ( = ?auto_915565 ?auto_915573 ) ) ( not ( = ?auto_915565 ?auto_915574 ) ) ( not ( = ?auto_915565 ?auto_915575 ) ) ( not ( = ?auto_915565 ?auto_915576 ) ) ( not ( = ?auto_915565 ?auto_915577 ) ) ( not ( = ?auto_915565 ?auto_915578 ) ) ( not ( = ?auto_915565 ?auto_915579 ) ) ( not ( = ?auto_915565 ?auto_915580 ) ) ( not ( = ?auto_915565 ?auto_915581 ) ) ( not ( = ?auto_915565 ?auto_915582 ) ) ( not ( = ?auto_915566 ?auto_915567 ) ) ( not ( = ?auto_915566 ?auto_915568 ) ) ( not ( = ?auto_915566 ?auto_915569 ) ) ( not ( = ?auto_915566 ?auto_915570 ) ) ( not ( = ?auto_915566 ?auto_915571 ) ) ( not ( = ?auto_915566 ?auto_915572 ) ) ( not ( = ?auto_915566 ?auto_915573 ) ) ( not ( = ?auto_915566 ?auto_915574 ) ) ( not ( = ?auto_915566 ?auto_915575 ) ) ( not ( = ?auto_915566 ?auto_915576 ) ) ( not ( = ?auto_915566 ?auto_915577 ) ) ( not ( = ?auto_915566 ?auto_915578 ) ) ( not ( = ?auto_915566 ?auto_915579 ) ) ( not ( = ?auto_915566 ?auto_915580 ) ) ( not ( = ?auto_915566 ?auto_915581 ) ) ( not ( = ?auto_915566 ?auto_915582 ) ) ( not ( = ?auto_915567 ?auto_915568 ) ) ( not ( = ?auto_915567 ?auto_915569 ) ) ( not ( = ?auto_915567 ?auto_915570 ) ) ( not ( = ?auto_915567 ?auto_915571 ) ) ( not ( = ?auto_915567 ?auto_915572 ) ) ( not ( = ?auto_915567 ?auto_915573 ) ) ( not ( = ?auto_915567 ?auto_915574 ) ) ( not ( = ?auto_915567 ?auto_915575 ) ) ( not ( = ?auto_915567 ?auto_915576 ) ) ( not ( = ?auto_915567 ?auto_915577 ) ) ( not ( = ?auto_915567 ?auto_915578 ) ) ( not ( = ?auto_915567 ?auto_915579 ) ) ( not ( = ?auto_915567 ?auto_915580 ) ) ( not ( = ?auto_915567 ?auto_915581 ) ) ( not ( = ?auto_915567 ?auto_915582 ) ) ( not ( = ?auto_915568 ?auto_915569 ) ) ( not ( = ?auto_915568 ?auto_915570 ) ) ( not ( = ?auto_915568 ?auto_915571 ) ) ( not ( = ?auto_915568 ?auto_915572 ) ) ( not ( = ?auto_915568 ?auto_915573 ) ) ( not ( = ?auto_915568 ?auto_915574 ) ) ( not ( = ?auto_915568 ?auto_915575 ) ) ( not ( = ?auto_915568 ?auto_915576 ) ) ( not ( = ?auto_915568 ?auto_915577 ) ) ( not ( = ?auto_915568 ?auto_915578 ) ) ( not ( = ?auto_915568 ?auto_915579 ) ) ( not ( = ?auto_915568 ?auto_915580 ) ) ( not ( = ?auto_915568 ?auto_915581 ) ) ( not ( = ?auto_915568 ?auto_915582 ) ) ( not ( = ?auto_915569 ?auto_915570 ) ) ( not ( = ?auto_915569 ?auto_915571 ) ) ( not ( = ?auto_915569 ?auto_915572 ) ) ( not ( = ?auto_915569 ?auto_915573 ) ) ( not ( = ?auto_915569 ?auto_915574 ) ) ( not ( = ?auto_915569 ?auto_915575 ) ) ( not ( = ?auto_915569 ?auto_915576 ) ) ( not ( = ?auto_915569 ?auto_915577 ) ) ( not ( = ?auto_915569 ?auto_915578 ) ) ( not ( = ?auto_915569 ?auto_915579 ) ) ( not ( = ?auto_915569 ?auto_915580 ) ) ( not ( = ?auto_915569 ?auto_915581 ) ) ( not ( = ?auto_915569 ?auto_915582 ) ) ( not ( = ?auto_915570 ?auto_915571 ) ) ( not ( = ?auto_915570 ?auto_915572 ) ) ( not ( = ?auto_915570 ?auto_915573 ) ) ( not ( = ?auto_915570 ?auto_915574 ) ) ( not ( = ?auto_915570 ?auto_915575 ) ) ( not ( = ?auto_915570 ?auto_915576 ) ) ( not ( = ?auto_915570 ?auto_915577 ) ) ( not ( = ?auto_915570 ?auto_915578 ) ) ( not ( = ?auto_915570 ?auto_915579 ) ) ( not ( = ?auto_915570 ?auto_915580 ) ) ( not ( = ?auto_915570 ?auto_915581 ) ) ( not ( = ?auto_915570 ?auto_915582 ) ) ( not ( = ?auto_915571 ?auto_915572 ) ) ( not ( = ?auto_915571 ?auto_915573 ) ) ( not ( = ?auto_915571 ?auto_915574 ) ) ( not ( = ?auto_915571 ?auto_915575 ) ) ( not ( = ?auto_915571 ?auto_915576 ) ) ( not ( = ?auto_915571 ?auto_915577 ) ) ( not ( = ?auto_915571 ?auto_915578 ) ) ( not ( = ?auto_915571 ?auto_915579 ) ) ( not ( = ?auto_915571 ?auto_915580 ) ) ( not ( = ?auto_915571 ?auto_915581 ) ) ( not ( = ?auto_915571 ?auto_915582 ) ) ( not ( = ?auto_915572 ?auto_915573 ) ) ( not ( = ?auto_915572 ?auto_915574 ) ) ( not ( = ?auto_915572 ?auto_915575 ) ) ( not ( = ?auto_915572 ?auto_915576 ) ) ( not ( = ?auto_915572 ?auto_915577 ) ) ( not ( = ?auto_915572 ?auto_915578 ) ) ( not ( = ?auto_915572 ?auto_915579 ) ) ( not ( = ?auto_915572 ?auto_915580 ) ) ( not ( = ?auto_915572 ?auto_915581 ) ) ( not ( = ?auto_915572 ?auto_915582 ) ) ( not ( = ?auto_915573 ?auto_915574 ) ) ( not ( = ?auto_915573 ?auto_915575 ) ) ( not ( = ?auto_915573 ?auto_915576 ) ) ( not ( = ?auto_915573 ?auto_915577 ) ) ( not ( = ?auto_915573 ?auto_915578 ) ) ( not ( = ?auto_915573 ?auto_915579 ) ) ( not ( = ?auto_915573 ?auto_915580 ) ) ( not ( = ?auto_915573 ?auto_915581 ) ) ( not ( = ?auto_915573 ?auto_915582 ) ) ( not ( = ?auto_915574 ?auto_915575 ) ) ( not ( = ?auto_915574 ?auto_915576 ) ) ( not ( = ?auto_915574 ?auto_915577 ) ) ( not ( = ?auto_915574 ?auto_915578 ) ) ( not ( = ?auto_915574 ?auto_915579 ) ) ( not ( = ?auto_915574 ?auto_915580 ) ) ( not ( = ?auto_915574 ?auto_915581 ) ) ( not ( = ?auto_915574 ?auto_915582 ) ) ( not ( = ?auto_915575 ?auto_915576 ) ) ( not ( = ?auto_915575 ?auto_915577 ) ) ( not ( = ?auto_915575 ?auto_915578 ) ) ( not ( = ?auto_915575 ?auto_915579 ) ) ( not ( = ?auto_915575 ?auto_915580 ) ) ( not ( = ?auto_915575 ?auto_915581 ) ) ( not ( = ?auto_915575 ?auto_915582 ) ) ( not ( = ?auto_915576 ?auto_915577 ) ) ( not ( = ?auto_915576 ?auto_915578 ) ) ( not ( = ?auto_915576 ?auto_915579 ) ) ( not ( = ?auto_915576 ?auto_915580 ) ) ( not ( = ?auto_915576 ?auto_915581 ) ) ( not ( = ?auto_915576 ?auto_915582 ) ) ( not ( = ?auto_915577 ?auto_915578 ) ) ( not ( = ?auto_915577 ?auto_915579 ) ) ( not ( = ?auto_915577 ?auto_915580 ) ) ( not ( = ?auto_915577 ?auto_915581 ) ) ( not ( = ?auto_915577 ?auto_915582 ) ) ( not ( = ?auto_915578 ?auto_915579 ) ) ( not ( = ?auto_915578 ?auto_915580 ) ) ( not ( = ?auto_915578 ?auto_915581 ) ) ( not ( = ?auto_915578 ?auto_915582 ) ) ( not ( = ?auto_915579 ?auto_915580 ) ) ( not ( = ?auto_915579 ?auto_915581 ) ) ( not ( = ?auto_915579 ?auto_915582 ) ) ( not ( = ?auto_915580 ?auto_915581 ) ) ( not ( = ?auto_915580 ?auto_915582 ) ) ( not ( = ?auto_915581 ?auto_915582 ) ) ( ON ?auto_915581 ?auto_915582 ) ( ON ?auto_915580 ?auto_915581 ) ( ON ?auto_915579 ?auto_915580 ) ( ON ?auto_915578 ?auto_915579 ) ( ON ?auto_915577 ?auto_915578 ) ( ON ?auto_915576 ?auto_915577 ) ( ON ?auto_915575 ?auto_915576 ) ( ON ?auto_915574 ?auto_915575 ) ( ON ?auto_915573 ?auto_915574 ) ( ON ?auto_915572 ?auto_915573 ) ( ON ?auto_915571 ?auto_915572 ) ( ON ?auto_915570 ?auto_915571 ) ( ON ?auto_915569 ?auto_915570 ) ( ON ?auto_915568 ?auto_915569 ) ( ON ?auto_915567 ?auto_915568 ) ( ON ?auto_915566 ?auto_915567 ) ( ON ?auto_915565 ?auto_915566 ) ( CLEAR ?auto_915565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_915565 )
      ( MAKE-18PILE ?auto_915565 ?auto_915566 ?auto_915567 ?auto_915568 ?auto_915569 ?auto_915570 ?auto_915571 ?auto_915572 ?auto_915573 ?auto_915574 ?auto_915575 ?auto_915576 ?auto_915577 ?auto_915578 ?auto_915579 ?auto_915580 ?auto_915581 ?auto_915582 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_915601 - BLOCK
      ?auto_915602 - BLOCK
      ?auto_915603 - BLOCK
      ?auto_915604 - BLOCK
      ?auto_915605 - BLOCK
      ?auto_915606 - BLOCK
      ?auto_915607 - BLOCK
      ?auto_915608 - BLOCK
      ?auto_915609 - BLOCK
      ?auto_915610 - BLOCK
      ?auto_915611 - BLOCK
      ?auto_915612 - BLOCK
      ?auto_915613 - BLOCK
      ?auto_915614 - BLOCK
      ?auto_915615 - BLOCK
      ?auto_915616 - BLOCK
      ?auto_915617 - BLOCK
      ?auto_915618 - BLOCK
    )
    :vars
    (
      ?auto_915619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_915601 ?auto_915602 ) ) ( not ( = ?auto_915601 ?auto_915603 ) ) ( not ( = ?auto_915601 ?auto_915604 ) ) ( not ( = ?auto_915601 ?auto_915605 ) ) ( not ( = ?auto_915601 ?auto_915606 ) ) ( not ( = ?auto_915601 ?auto_915607 ) ) ( not ( = ?auto_915601 ?auto_915608 ) ) ( not ( = ?auto_915601 ?auto_915609 ) ) ( not ( = ?auto_915601 ?auto_915610 ) ) ( not ( = ?auto_915601 ?auto_915611 ) ) ( not ( = ?auto_915601 ?auto_915612 ) ) ( not ( = ?auto_915601 ?auto_915613 ) ) ( not ( = ?auto_915601 ?auto_915614 ) ) ( not ( = ?auto_915601 ?auto_915615 ) ) ( not ( = ?auto_915601 ?auto_915616 ) ) ( not ( = ?auto_915601 ?auto_915617 ) ) ( not ( = ?auto_915601 ?auto_915618 ) ) ( not ( = ?auto_915602 ?auto_915603 ) ) ( not ( = ?auto_915602 ?auto_915604 ) ) ( not ( = ?auto_915602 ?auto_915605 ) ) ( not ( = ?auto_915602 ?auto_915606 ) ) ( not ( = ?auto_915602 ?auto_915607 ) ) ( not ( = ?auto_915602 ?auto_915608 ) ) ( not ( = ?auto_915602 ?auto_915609 ) ) ( not ( = ?auto_915602 ?auto_915610 ) ) ( not ( = ?auto_915602 ?auto_915611 ) ) ( not ( = ?auto_915602 ?auto_915612 ) ) ( not ( = ?auto_915602 ?auto_915613 ) ) ( not ( = ?auto_915602 ?auto_915614 ) ) ( not ( = ?auto_915602 ?auto_915615 ) ) ( not ( = ?auto_915602 ?auto_915616 ) ) ( not ( = ?auto_915602 ?auto_915617 ) ) ( not ( = ?auto_915602 ?auto_915618 ) ) ( not ( = ?auto_915603 ?auto_915604 ) ) ( not ( = ?auto_915603 ?auto_915605 ) ) ( not ( = ?auto_915603 ?auto_915606 ) ) ( not ( = ?auto_915603 ?auto_915607 ) ) ( not ( = ?auto_915603 ?auto_915608 ) ) ( not ( = ?auto_915603 ?auto_915609 ) ) ( not ( = ?auto_915603 ?auto_915610 ) ) ( not ( = ?auto_915603 ?auto_915611 ) ) ( not ( = ?auto_915603 ?auto_915612 ) ) ( not ( = ?auto_915603 ?auto_915613 ) ) ( not ( = ?auto_915603 ?auto_915614 ) ) ( not ( = ?auto_915603 ?auto_915615 ) ) ( not ( = ?auto_915603 ?auto_915616 ) ) ( not ( = ?auto_915603 ?auto_915617 ) ) ( not ( = ?auto_915603 ?auto_915618 ) ) ( not ( = ?auto_915604 ?auto_915605 ) ) ( not ( = ?auto_915604 ?auto_915606 ) ) ( not ( = ?auto_915604 ?auto_915607 ) ) ( not ( = ?auto_915604 ?auto_915608 ) ) ( not ( = ?auto_915604 ?auto_915609 ) ) ( not ( = ?auto_915604 ?auto_915610 ) ) ( not ( = ?auto_915604 ?auto_915611 ) ) ( not ( = ?auto_915604 ?auto_915612 ) ) ( not ( = ?auto_915604 ?auto_915613 ) ) ( not ( = ?auto_915604 ?auto_915614 ) ) ( not ( = ?auto_915604 ?auto_915615 ) ) ( not ( = ?auto_915604 ?auto_915616 ) ) ( not ( = ?auto_915604 ?auto_915617 ) ) ( not ( = ?auto_915604 ?auto_915618 ) ) ( not ( = ?auto_915605 ?auto_915606 ) ) ( not ( = ?auto_915605 ?auto_915607 ) ) ( not ( = ?auto_915605 ?auto_915608 ) ) ( not ( = ?auto_915605 ?auto_915609 ) ) ( not ( = ?auto_915605 ?auto_915610 ) ) ( not ( = ?auto_915605 ?auto_915611 ) ) ( not ( = ?auto_915605 ?auto_915612 ) ) ( not ( = ?auto_915605 ?auto_915613 ) ) ( not ( = ?auto_915605 ?auto_915614 ) ) ( not ( = ?auto_915605 ?auto_915615 ) ) ( not ( = ?auto_915605 ?auto_915616 ) ) ( not ( = ?auto_915605 ?auto_915617 ) ) ( not ( = ?auto_915605 ?auto_915618 ) ) ( not ( = ?auto_915606 ?auto_915607 ) ) ( not ( = ?auto_915606 ?auto_915608 ) ) ( not ( = ?auto_915606 ?auto_915609 ) ) ( not ( = ?auto_915606 ?auto_915610 ) ) ( not ( = ?auto_915606 ?auto_915611 ) ) ( not ( = ?auto_915606 ?auto_915612 ) ) ( not ( = ?auto_915606 ?auto_915613 ) ) ( not ( = ?auto_915606 ?auto_915614 ) ) ( not ( = ?auto_915606 ?auto_915615 ) ) ( not ( = ?auto_915606 ?auto_915616 ) ) ( not ( = ?auto_915606 ?auto_915617 ) ) ( not ( = ?auto_915606 ?auto_915618 ) ) ( not ( = ?auto_915607 ?auto_915608 ) ) ( not ( = ?auto_915607 ?auto_915609 ) ) ( not ( = ?auto_915607 ?auto_915610 ) ) ( not ( = ?auto_915607 ?auto_915611 ) ) ( not ( = ?auto_915607 ?auto_915612 ) ) ( not ( = ?auto_915607 ?auto_915613 ) ) ( not ( = ?auto_915607 ?auto_915614 ) ) ( not ( = ?auto_915607 ?auto_915615 ) ) ( not ( = ?auto_915607 ?auto_915616 ) ) ( not ( = ?auto_915607 ?auto_915617 ) ) ( not ( = ?auto_915607 ?auto_915618 ) ) ( not ( = ?auto_915608 ?auto_915609 ) ) ( not ( = ?auto_915608 ?auto_915610 ) ) ( not ( = ?auto_915608 ?auto_915611 ) ) ( not ( = ?auto_915608 ?auto_915612 ) ) ( not ( = ?auto_915608 ?auto_915613 ) ) ( not ( = ?auto_915608 ?auto_915614 ) ) ( not ( = ?auto_915608 ?auto_915615 ) ) ( not ( = ?auto_915608 ?auto_915616 ) ) ( not ( = ?auto_915608 ?auto_915617 ) ) ( not ( = ?auto_915608 ?auto_915618 ) ) ( not ( = ?auto_915609 ?auto_915610 ) ) ( not ( = ?auto_915609 ?auto_915611 ) ) ( not ( = ?auto_915609 ?auto_915612 ) ) ( not ( = ?auto_915609 ?auto_915613 ) ) ( not ( = ?auto_915609 ?auto_915614 ) ) ( not ( = ?auto_915609 ?auto_915615 ) ) ( not ( = ?auto_915609 ?auto_915616 ) ) ( not ( = ?auto_915609 ?auto_915617 ) ) ( not ( = ?auto_915609 ?auto_915618 ) ) ( not ( = ?auto_915610 ?auto_915611 ) ) ( not ( = ?auto_915610 ?auto_915612 ) ) ( not ( = ?auto_915610 ?auto_915613 ) ) ( not ( = ?auto_915610 ?auto_915614 ) ) ( not ( = ?auto_915610 ?auto_915615 ) ) ( not ( = ?auto_915610 ?auto_915616 ) ) ( not ( = ?auto_915610 ?auto_915617 ) ) ( not ( = ?auto_915610 ?auto_915618 ) ) ( not ( = ?auto_915611 ?auto_915612 ) ) ( not ( = ?auto_915611 ?auto_915613 ) ) ( not ( = ?auto_915611 ?auto_915614 ) ) ( not ( = ?auto_915611 ?auto_915615 ) ) ( not ( = ?auto_915611 ?auto_915616 ) ) ( not ( = ?auto_915611 ?auto_915617 ) ) ( not ( = ?auto_915611 ?auto_915618 ) ) ( not ( = ?auto_915612 ?auto_915613 ) ) ( not ( = ?auto_915612 ?auto_915614 ) ) ( not ( = ?auto_915612 ?auto_915615 ) ) ( not ( = ?auto_915612 ?auto_915616 ) ) ( not ( = ?auto_915612 ?auto_915617 ) ) ( not ( = ?auto_915612 ?auto_915618 ) ) ( not ( = ?auto_915613 ?auto_915614 ) ) ( not ( = ?auto_915613 ?auto_915615 ) ) ( not ( = ?auto_915613 ?auto_915616 ) ) ( not ( = ?auto_915613 ?auto_915617 ) ) ( not ( = ?auto_915613 ?auto_915618 ) ) ( not ( = ?auto_915614 ?auto_915615 ) ) ( not ( = ?auto_915614 ?auto_915616 ) ) ( not ( = ?auto_915614 ?auto_915617 ) ) ( not ( = ?auto_915614 ?auto_915618 ) ) ( not ( = ?auto_915615 ?auto_915616 ) ) ( not ( = ?auto_915615 ?auto_915617 ) ) ( not ( = ?auto_915615 ?auto_915618 ) ) ( not ( = ?auto_915616 ?auto_915617 ) ) ( not ( = ?auto_915616 ?auto_915618 ) ) ( not ( = ?auto_915617 ?auto_915618 ) ) ( ON ?auto_915601 ?auto_915619 ) ( not ( = ?auto_915618 ?auto_915619 ) ) ( not ( = ?auto_915617 ?auto_915619 ) ) ( not ( = ?auto_915616 ?auto_915619 ) ) ( not ( = ?auto_915615 ?auto_915619 ) ) ( not ( = ?auto_915614 ?auto_915619 ) ) ( not ( = ?auto_915613 ?auto_915619 ) ) ( not ( = ?auto_915612 ?auto_915619 ) ) ( not ( = ?auto_915611 ?auto_915619 ) ) ( not ( = ?auto_915610 ?auto_915619 ) ) ( not ( = ?auto_915609 ?auto_915619 ) ) ( not ( = ?auto_915608 ?auto_915619 ) ) ( not ( = ?auto_915607 ?auto_915619 ) ) ( not ( = ?auto_915606 ?auto_915619 ) ) ( not ( = ?auto_915605 ?auto_915619 ) ) ( not ( = ?auto_915604 ?auto_915619 ) ) ( not ( = ?auto_915603 ?auto_915619 ) ) ( not ( = ?auto_915602 ?auto_915619 ) ) ( not ( = ?auto_915601 ?auto_915619 ) ) ( ON ?auto_915602 ?auto_915601 ) ( ON ?auto_915603 ?auto_915602 ) ( ON ?auto_915604 ?auto_915603 ) ( ON ?auto_915605 ?auto_915604 ) ( ON ?auto_915606 ?auto_915605 ) ( ON ?auto_915607 ?auto_915606 ) ( ON ?auto_915608 ?auto_915607 ) ( ON ?auto_915609 ?auto_915608 ) ( ON ?auto_915610 ?auto_915609 ) ( ON ?auto_915611 ?auto_915610 ) ( ON ?auto_915612 ?auto_915611 ) ( ON ?auto_915613 ?auto_915612 ) ( ON ?auto_915614 ?auto_915613 ) ( ON ?auto_915615 ?auto_915614 ) ( ON ?auto_915616 ?auto_915615 ) ( ON ?auto_915617 ?auto_915616 ) ( ON ?auto_915618 ?auto_915617 ) ( CLEAR ?auto_915618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_915618 ?auto_915617 ?auto_915616 ?auto_915615 ?auto_915614 ?auto_915613 ?auto_915612 ?auto_915611 ?auto_915610 ?auto_915609 ?auto_915608 ?auto_915607 ?auto_915606 ?auto_915605 ?auto_915604 ?auto_915603 ?auto_915602 ?auto_915601 )
      ( MAKE-18PILE ?auto_915601 ?auto_915602 ?auto_915603 ?auto_915604 ?auto_915605 ?auto_915606 ?auto_915607 ?auto_915608 ?auto_915609 ?auto_915610 ?auto_915611 ?auto_915612 ?auto_915613 ?auto_915614 ?auto_915615 ?auto_915616 ?auto_915617 ?auto_915618 ) )
  )

)

