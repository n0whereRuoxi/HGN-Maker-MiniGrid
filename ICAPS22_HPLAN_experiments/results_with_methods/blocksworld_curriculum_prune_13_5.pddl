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
      ?auto_222841 - BLOCK
    )
    :vars
    (
      ?auto_222842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222841 ?auto_222842 ) ( CLEAR ?auto_222841 ) ( HAND-EMPTY ) ( not ( = ?auto_222841 ?auto_222842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222841 ?auto_222842 )
      ( !PUTDOWN ?auto_222841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_222848 - BLOCK
      ?auto_222849 - BLOCK
    )
    :vars
    (
      ?auto_222850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222848 ) ( ON ?auto_222849 ?auto_222850 ) ( CLEAR ?auto_222849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222848 ) ( not ( = ?auto_222848 ?auto_222849 ) ) ( not ( = ?auto_222848 ?auto_222850 ) ) ( not ( = ?auto_222849 ?auto_222850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222849 ?auto_222850 )
      ( !STACK ?auto_222849 ?auto_222848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_222858 - BLOCK
      ?auto_222859 - BLOCK
    )
    :vars
    (
      ?auto_222860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222859 ?auto_222860 ) ( not ( = ?auto_222858 ?auto_222859 ) ) ( not ( = ?auto_222858 ?auto_222860 ) ) ( not ( = ?auto_222859 ?auto_222860 ) ) ( ON ?auto_222858 ?auto_222859 ) ( CLEAR ?auto_222858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222858 )
      ( MAKE-2PILE ?auto_222858 ?auto_222859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_222869 - BLOCK
      ?auto_222870 - BLOCK
      ?auto_222871 - BLOCK
    )
    :vars
    (
      ?auto_222872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222870 ) ( ON ?auto_222871 ?auto_222872 ) ( CLEAR ?auto_222871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222869 ) ( ON ?auto_222870 ?auto_222869 ) ( not ( = ?auto_222869 ?auto_222870 ) ) ( not ( = ?auto_222869 ?auto_222871 ) ) ( not ( = ?auto_222869 ?auto_222872 ) ) ( not ( = ?auto_222870 ?auto_222871 ) ) ( not ( = ?auto_222870 ?auto_222872 ) ) ( not ( = ?auto_222871 ?auto_222872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222871 ?auto_222872 )
      ( !STACK ?auto_222871 ?auto_222870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_222883 - BLOCK
      ?auto_222884 - BLOCK
      ?auto_222885 - BLOCK
    )
    :vars
    (
      ?auto_222886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222885 ?auto_222886 ) ( ON-TABLE ?auto_222883 ) ( not ( = ?auto_222883 ?auto_222884 ) ) ( not ( = ?auto_222883 ?auto_222885 ) ) ( not ( = ?auto_222883 ?auto_222886 ) ) ( not ( = ?auto_222884 ?auto_222885 ) ) ( not ( = ?auto_222884 ?auto_222886 ) ) ( not ( = ?auto_222885 ?auto_222886 ) ) ( CLEAR ?auto_222883 ) ( ON ?auto_222884 ?auto_222885 ) ( CLEAR ?auto_222884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222883 ?auto_222884 )
      ( MAKE-3PILE ?auto_222883 ?auto_222884 ?auto_222885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_222897 - BLOCK
      ?auto_222898 - BLOCK
      ?auto_222899 - BLOCK
    )
    :vars
    (
      ?auto_222900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222899 ?auto_222900 ) ( not ( = ?auto_222897 ?auto_222898 ) ) ( not ( = ?auto_222897 ?auto_222899 ) ) ( not ( = ?auto_222897 ?auto_222900 ) ) ( not ( = ?auto_222898 ?auto_222899 ) ) ( not ( = ?auto_222898 ?auto_222900 ) ) ( not ( = ?auto_222899 ?auto_222900 ) ) ( ON ?auto_222898 ?auto_222899 ) ( ON ?auto_222897 ?auto_222898 ) ( CLEAR ?auto_222897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222897 )
      ( MAKE-3PILE ?auto_222897 ?auto_222898 ?auto_222899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_222912 - BLOCK
      ?auto_222913 - BLOCK
      ?auto_222914 - BLOCK
      ?auto_222915 - BLOCK
    )
    :vars
    (
      ?auto_222916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222914 ) ( ON ?auto_222915 ?auto_222916 ) ( CLEAR ?auto_222915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222912 ) ( ON ?auto_222913 ?auto_222912 ) ( ON ?auto_222914 ?auto_222913 ) ( not ( = ?auto_222912 ?auto_222913 ) ) ( not ( = ?auto_222912 ?auto_222914 ) ) ( not ( = ?auto_222912 ?auto_222915 ) ) ( not ( = ?auto_222912 ?auto_222916 ) ) ( not ( = ?auto_222913 ?auto_222914 ) ) ( not ( = ?auto_222913 ?auto_222915 ) ) ( not ( = ?auto_222913 ?auto_222916 ) ) ( not ( = ?auto_222914 ?auto_222915 ) ) ( not ( = ?auto_222914 ?auto_222916 ) ) ( not ( = ?auto_222915 ?auto_222916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222915 ?auto_222916 )
      ( !STACK ?auto_222915 ?auto_222914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_222930 - BLOCK
      ?auto_222931 - BLOCK
      ?auto_222932 - BLOCK
      ?auto_222933 - BLOCK
    )
    :vars
    (
      ?auto_222934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222933 ?auto_222934 ) ( ON-TABLE ?auto_222930 ) ( ON ?auto_222931 ?auto_222930 ) ( not ( = ?auto_222930 ?auto_222931 ) ) ( not ( = ?auto_222930 ?auto_222932 ) ) ( not ( = ?auto_222930 ?auto_222933 ) ) ( not ( = ?auto_222930 ?auto_222934 ) ) ( not ( = ?auto_222931 ?auto_222932 ) ) ( not ( = ?auto_222931 ?auto_222933 ) ) ( not ( = ?auto_222931 ?auto_222934 ) ) ( not ( = ?auto_222932 ?auto_222933 ) ) ( not ( = ?auto_222932 ?auto_222934 ) ) ( not ( = ?auto_222933 ?auto_222934 ) ) ( CLEAR ?auto_222931 ) ( ON ?auto_222932 ?auto_222933 ) ( CLEAR ?auto_222932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_222930 ?auto_222931 ?auto_222932 )
      ( MAKE-4PILE ?auto_222930 ?auto_222931 ?auto_222932 ?auto_222933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_222948 - BLOCK
      ?auto_222949 - BLOCK
      ?auto_222950 - BLOCK
      ?auto_222951 - BLOCK
    )
    :vars
    (
      ?auto_222952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222951 ?auto_222952 ) ( ON-TABLE ?auto_222948 ) ( not ( = ?auto_222948 ?auto_222949 ) ) ( not ( = ?auto_222948 ?auto_222950 ) ) ( not ( = ?auto_222948 ?auto_222951 ) ) ( not ( = ?auto_222948 ?auto_222952 ) ) ( not ( = ?auto_222949 ?auto_222950 ) ) ( not ( = ?auto_222949 ?auto_222951 ) ) ( not ( = ?auto_222949 ?auto_222952 ) ) ( not ( = ?auto_222950 ?auto_222951 ) ) ( not ( = ?auto_222950 ?auto_222952 ) ) ( not ( = ?auto_222951 ?auto_222952 ) ) ( ON ?auto_222950 ?auto_222951 ) ( CLEAR ?auto_222948 ) ( ON ?auto_222949 ?auto_222950 ) ( CLEAR ?auto_222949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222948 ?auto_222949 )
      ( MAKE-4PILE ?auto_222948 ?auto_222949 ?auto_222950 ?auto_222951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_222966 - BLOCK
      ?auto_222967 - BLOCK
      ?auto_222968 - BLOCK
      ?auto_222969 - BLOCK
    )
    :vars
    (
      ?auto_222970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222969 ?auto_222970 ) ( not ( = ?auto_222966 ?auto_222967 ) ) ( not ( = ?auto_222966 ?auto_222968 ) ) ( not ( = ?auto_222966 ?auto_222969 ) ) ( not ( = ?auto_222966 ?auto_222970 ) ) ( not ( = ?auto_222967 ?auto_222968 ) ) ( not ( = ?auto_222967 ?auto_222969 ) ) ( not ( = ?auto_222967 ?auto_222970 ) ) ( not ( = ?auto_222968 ?auto_222969 ) ) ( not ( = ?auto_222968 ?auto_222970 ) ) ( not ( = ?auto_222969 ?auto_222970 ) ) ( ON ?auto_222968 ?auto_222969 ) ( ON ?auto_222967 ?auto_222968 ) ( ON ?auto_222966 ?auto_222967 ) ( CLEAR ?auto_222966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222966 )
      ( MAKE-4PILE ?auto_222966 ?auto_222967 ?auto_222968 ?auto_222969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_222985 - BLOCK
      ?auto_222986 - BLOCK
      ?auto_222987 - BLOCK
      ?auto_222988 - BLOCK
      ?auto_222989 - BLOCK
    )
    :vars
    (
      ?auto_222990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222988 ) ( ON ?auto_222989 ?auto_222990 ) ( CLEAR ?auto_222989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222985 ) ( ON ?auto_222986 ?auto_222985 ) ( ON ?auto_222987 ?auto_222986 ) ( ON ?auto_222988 ?auto_222987 ) ( not ( = ?auto_222985 ?auto_222986 ) ) ( not ( = ?auto_222985 ?auto_222987 ) ) ( not ( = ?auto_222985 ?auto_222988 ) ) ( not ( = ?auto_222985 ?auto_222989 ) ) ( not ( = ?auto_222985 ?auto_222990 ) ) ( not ( = ?auto_222986 ?auto_222987 ) ) ( not ( = ?auto_222986 ?auto_222988 ) ) ( not ( = ?auto_222986 ?auto_222989 ) ) ( not ( = ?auto_222986 ?auto_222990 ) ) ( not ( = ?auto_222987 ?auto_222988 ) ) ( not ( = ?auto_222987 ?auto_222989 ) ) ( not ( = ?auto_222987 ?auto_222990 ) ) ( not ( = ?auto_222988 ?auto_222989 ) ) ( not ( = ?auto_222988 ?auto_222990 ) ) ( not ( = ?auto_222989 ?auto_222990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222989 ?auto_222990 )
      ( !STACK ?auto_222989 ?auto_222988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_223007 - BLOCK
      ?auto_223008 - BLOCK
      ?auto_223009 - BLOCK
      ?auto_223010 - BLOCK
      ?auto_223011 - BLOCK
    )
    :vars
    (
      ?auto_223012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223011 ?auto_223012 ) ( ON-TABLE ?auto_223007 ) ( ON ?auto_223008 ?auto_223007 ) ( ON ?auto_223009 ?auto_223008 ) ( not ( = ?auto_223007 ?auto_223008 ) ) ( not ( = ?auto_223007 ?auto_223009 ) ) ( not ( = ?auto_223007 ?auto_223010 ) ) ( not ( = ?auto_223007 ?auto_223011 ) ) ( not ( = ?auto_223007 ?auto_223012 ) ) ( not ( = ?auto_223008 ?auto_223009 ) ) ( not ( = ?auto_223008 ?auto_223010 ) ) ( not ( = ?auto_223008 ?auto_223011 ) ) ( not ( = ?auto_223008 ?auto_223012 ) ) ( not ( = ?auto_223009 ?auto_223010 ) ) ( not ( = ?auto_223009 ?auto_223011 ) ) ( not ( = ?auto_223009 ?auto_223012 ) ) ( not ( = ?auto_223010 ?auto_223011 ) ) ( not ( = ?auto_223010 ?auto_223012 ) ) ( not ( = ?auto_223011 ?auto_223012 ) ) ( CLEAR ?auto_223009 ) ( ON ?auto_223010 ?auto_223011 ) ( CLEAR ?auto_223010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_223007 ?auto_223008 ?auto_223009 ?auto_223010 )
      ( MAKE-5PILE ?auto_223007 ?auto_223008 ?auto_223009 ?auto_223010 ?auto_223011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_223029 - BLOCK
      ?auto_223030 - BLOCK
      ?auto_223031 - BLOCK
      ?auto_223032 - BLOCK
      ?auto_223033 - BLOCK
    )
    :vars
    (
      ?auto_223034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223033 ?auto_223034 ) ( ON-TABLE ?auto_223029 ) ( ON ?auto_223030 ?auto_223029 ) ( not ( = ?auto_223029 ?auto_223030 ) ) ( not ( = ?auto_223029 ?auto_223031 ) ) ( not ( = ?auto_223029 ?auto_223032 ) ) ( not ( = ?auto_223029 ?auto_223033 ) ) ( not ( = ?auto_223029 ?auto_223034 ) ) ( not ( = ?auto_223030 ?auto_223031 ) ) ( not ( = ?auto_223030 ?auto_223032 ) ) ( not ( = ?auto_223030 ?auto_223033 ) ) ( not ( = ?auto_223030 ?auto_223034 ) ) ( not ( = ?auto_223031 ?auto_223032 ) ) ( not ( = ?auto_223031 ?auto_223033 ) ) ( not ( = ?auto_223031 ?auto_223034 ) ) ( not ( = ?auto_223032 ?auto_223033 ) ) ( not ( = ?auto_223032 ?auto_223034 ) ) ( not ( = ?auto_223033 ?auto_223034 ) ) ( ON ?auto_223032 ?auto_223033 ) ( CLEAR ?auto_223030 ) ( ON ?auto_223031 ?auto_223032 ) ( CLEAR ?auto_223031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_223029 ?auto_223030 ?auto_223031 )
      ( MAKE-5PILE ?auto_223029 ?auto_223030 ?auto_223031 ?auto_223032 ?auto_223033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_223051 - BLOCK
      ?auto_223052 - BLOCK
      ?auto_223053 - BLOCK
      ?auto_223054 - BLOCK
      ?auto_223055 - BLOCK
    )
    :vars
    (
      ?auto_223056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223055 ?auto_223056 ) ( ON-TABLE ?auto_223051 ) ( not ( = ?auto_223051 ?auto_223052 ) ) ( not ( = ?auto_223051 ?auto_223053 ) ) ( not ( = ?auto_223051 ?auto_223054 ) ) ( not ( = ?auto_223051 ?auto_223055 ) ) ( not ( = ?auto_223051 ?auto_223056 ) ) ( not ( = ?auto_223052 ?auto_223053 ) ) ( not ( = ?auto_223052 ?auto_223054 ) ) ( not ( = ?auto_223052 ?auto_223055 ) ) ( not ( = ?auto_223052 ?auto_223056 ) ) ( not ( = ?auto_223053 ?auto_223054 ) ) ( not ( = ?auto_223053 ?auto_223055 ) ) ( not ( = ?auto_223053 ?auto_223056 ) ) ( not ( = ?auto_223054 ?auto_223055 ) ) ( not ( = ?auto_223054 ?auto_223056 ) ) ( not ( = ?auto_223055 ?auto_223056 ) ) ( ON ?auto_223054 ?auto_223055 ) ( ON ?auto_223053 ?auto_223054 ) ( CLEAR ?auto_223051 ) ( ON ?auto_223052 ?auto_223053 ) ( CLEAR ?auto_223052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_223051 ?auto_223052 )
      ( MAKE-5PILE ?auto_223051 ?auto_223052 ?auto_223053 ?auto_223054 ?auto_223055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_223073 - BLOCK
      ?auto_223074 - BLOCK
      ?auto_223075 - BLOCK
      ?auto_223076 - BLOCK
      ?auto_223077 - BLOCK
    )
    :vars
    (
      ?auto_223078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223077 ?auto_223078 ) ( not ( = ?auto_223073 ?auto_223074 ) ) ( not ( = ?auto_223073 ?auto_223075 ) ) ( not ( = ?auto_223073 ?auto_223076 ) ) ( not ( = ?auto_223073 ?auto_223077 ) ) ( not ( = ?auto_223073 ?auto_223078 ) ) ( not ( = ?auto_223074 ?auto_223075 ) ) ( not ( = ?auto_223074 ?auto_223076 ) ) ( not ( = ?auto_223074 ?auto_223077 ) ) ( not ( = ?auto_223074 ?auto_223078 ) ) ( not ( = ?auto_223075 ?auto_223076 ) ) ( not ( = ?auto_223075 ?auto_223077 ) ) ( not ( = ?auto_223075 ?auto_223078 ) ) ( not ( = ?auto_223076 ?auto_223077 ) ) ( not ( = ?auto_223076 ?auto_223078 ) ) ( not ( = ?auto_223077 ?auto_223078 ) ) ( ON ?auto_223076 ?auto_223077 ) ( ON ?auto_223075 ?auto_223076 ) ( ON ?auto_223074 ?auto_223075 ) ( ON ?auto_223073 ?auto_223074 ) ( CLEAR ?auto_223073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_223073 )
      ( MAKE-5PILE ?auto_223073 ?auto_223074 ?auto_223075 ?auto_223076 ?auto_223077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223096 - BLOCK
      ?auto_223097 - BLOCK
      ?auto_223098 - BLOCK
      ?auto_223099 - BLOCK
      ?auto_223100 - BLOCK
      ?auto_223101 - BLOCK
    )
    :vars
    (
      ?auto_223102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_223100 ) ( ON ?auto_223101 ?auto_223102 ) ( CLEAR ?auto_223101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_223096 ) ( ON ?auto_223097 ?auto_223096 ) ( ON ?auto_223098 ?auto_223097 ) ( ON ?auto_223099 ?auto_223098 ) ( ON ?auto_223100 ?auto_223099 ) ( not ( = ?auto_223096 ?auto_223097 ) ) ( not ( = ?auto_223096 ?auto_223098 ) ) ( not ( = ?auto_223096 ?auto_223099 ) ) ( not ( = ?auto_223096 ?auto_223100 ) ) ( not ( = ?auto_223096 ?auto_223101 ) ) ( not ( = ?auto_223096 ?auto_223102 ) ) ( not ( = ?auto_223097 ?auto_223098 ) ) ( not ( = ?auto_223097 ?auto_223099 ) ) ( not ( = ?auto_223097 ?auto_223100 ) ) ( not ( = ?auto_223097 ?auto_223101 ) ) ( not ( = ?auto_223097 ?auto_223102 ) ) ( not ( = ?auto_223098 ?auto_223099 ) ) ( not ( = ?auto_223098 ?auto_223100 ) ) ( not ( = ?auto_223098 ?auto_223101 ) ) ( not ( = ?auto_223098 ?auto_223102 ) ) ( not ( = ?auto_223099 ?auto_223100 ) ) ( not ( = ?auto_223099 ?auto_223101 ) ) ( not ( = ?auto_223099 ?auto_223102 ) ) ( not ( = ?auto_223100 ?auto_223101 ) ) ( not ( = ?auto_223100 ?auto_223102 ) ) ( not ( = ?auto_223101 ?auto_223102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_223101 ?auto_223102 )
      ( !STACK ?auto_223101 ?auto_223100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223122 - BLOCK
      ?auto_223123 - BLOCK
      ?auto_223124 - BLOCK
      ?auto_223125 - BLOCK
      ?auto_223126 - BLOCK
      ?auto_223127 - BLOCK
    )
    :vars
    (
      ?auto_223128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223127 ?auto_223128 ) ( ON-TABLE ?auto_223122 ) ( ON ?auto_223123 ?auto_223122 ) ( ON ?auto_223124 ?auto_223123 ) ( ON ?auto_223125 ?auto_223124 ) ( not ( = ?auto_223122 ?auto_223123 ) ) ( not ( = ?auto_223122 ?auto_223124 ) ) ( not ( = ?auto_223122 ?auto_223125 ) ) ( not ( = ?auto_223122 ?auto_223126 ) ) ( not ( = ?auto_223122 ?auto_223127 ) ) ( not ( = ?auto_223122 ?auto_223128 ) ) ( not ( = ?auto_223123 ?auto_223124 ) ) ( not ( = ?auto_223123 ?auto_223125 ) ) ( not ( = ?auto_223123 ?auto_223126 ) ) ( not ( = ?auto_223123 ?auto_223127 ) ) ( not ( = ?auto_223123 ?auto_223128 ) ) ( not ( = ?auto_223124 ?auto_223125 ) ) ( not ( = ?auto_223124 ?auto_223126 ) ) ( not ( = ?auto_223124 ?auto_223127 ) ) ( not ( = ?auto_223124 ?auto_223128 ) ) ( not ( = ?auto_223125 ?auto_223126 ) ) ( not ( = ?auto_223125 ?auto_223127 ) ) ( not ( = ?auto_223125 ?auto_223128 ) ) ( not ( = ?auto_223126 ?auto_223127 ) ) ( not ( = ?auto_223126 ?auto_223128 ) ) ( not ( = ?auto_223127 ?auto_223128 ) ) ( CLEAR ?auto_223125 ) ( ON ?auto_223126 ?auto_223127 ) ( CLEAR ?auto_223126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_223122 ?auto_223123 ?auto_223124 ?auto_223125 ?auto_223126 )
      ( MAKE-6PILE ?auto_223122 ?auto_223123 ?auto_223124 ?auto_223125 ?auto_223126 ?auto_223127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223148 - BLOCK
      ?auto_223149 - BLOCK
      ?auto_223150 - BLOCK
      ?auto_223151 - BLOCK
      ?auto_223152 - BLOCK
      ?auto_223153 - BLOCK
    )
    :vars
    (
      ?auto_223154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223153 ?auto_223154 ) ( ON-TABLE ?auto_223148 ) ( ON ?auto_223149 ?auto_223148 ) ( ON ?auto_223150 ?auto_223149 ) ( not ( = ?auto_223148 ?auto_223149 ) ) ( not ( = ?auto_223148 ?auto_223150 ) ) ( not ( = ?auto_223148 ?auto_223151 ) ) ( not ( = ?auto_223148 ?auto_223152 ) ) ( not ( = ?auto_223148 ?auto_223153 ) ) ( not ( = ?auto_223148 ?auto_223154 ) ) ( not ( = ?auto_223149 ?auto_223150 ) ) ( not ( = ?auto_223149 ?auto_223151 ) ) ( not ( = ?auto_223149 ?auto_223152 ) ) ( not ( = ?auto_223149 ?auto_223153 ) ) ( not ( = ?auto_223149 ?auto_223154 ) ) ( not ( = ?auto_223150 ?auto_223151 ) ) ( not ( = ?auto_223150 ?auto_223152 ) ) ( not ( = ?auto_223150 ?auto_223153 ) ) ( not ( = ?auto_223150 ?auto_223154 ) ) ( not ( = ?auto_223151 ?auto_223152 ) ) ( not ( = ?auto_223151 ?auto_223153 ) ) ( not ( = ?auto_223151 ?auto_223154 ) ) ( not ( = ?auto_223152 ?auto_223153 ) ) ( not ( = ?auto_223152 ?auto_223154 ) ) ( not ( = ?auto_223153 ?auto_223154 ) ) ( ON ?auto_223152 ?auto_223153 ) ( CLEAR ?auto_223150 ) ( ON ?auto_223151 ?auto_223152 ) ( CLEAR ?auto_223151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_223148 ?auto_223149 ?auto_223150 ?auto_223151 )
      ( MAKE-6PILE ?auto_223148 ?auto_223149 ?auto_223150 ?auto_223151 ?auto_223152 ?auto_223153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223174 - BLOCK
      ?auto_223175 - BLOCK
      ?auto_223176 - BLOCK
      ?auto_223177 - BLOCK
      ?auto_223178 - BLOCK
      ?auto_223179 - BLOCK
    )
    :vars
    (
      ?auto_223180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223179 ?auto_223180 ) ( ON-TABLE ?auto_223174 ) ( ON ?auto_223175 ?auto_223174 ) ( not ( = ?auto_223174 ?auto_223175 ) ) ( not ( = ?auto_223174 ?auto_223176 ) ) ( not ( = ?auto_223174 ?auto_223177 ) ) ( not ( = ?auto_223174 ?auto_223178 ) ) ( not ( = ?auto_223174 ?auto_223179 ) ) ( not ( = ?auto_223174 ?auto_223180 ) ) ( not ( = ?auto_223175 ?auto_223176 ) ) ( not ( = ?auto_223175 ?auto_223177 ) ) ( not ( = ?auto_223175 ?auto_223178 ) ) ( not ( = ?auto_223175 ?auto_223179 ) ) ( not ( = ?auto_223175 ?auto_223180 ) ) ( not ( = ?auto_223176 ?auto_223177 ) ) ( not ( = ?auto_223176 ?auto_223178 ) ) ( not ( = ?auto_223176 ?auto_223179 ) ) ( not ( = ?auto_223176 ?auto_223180 ) ) ( not ( = ?auto_223177 ?auto_223178 ) ) ( not ( = ?auto_223177 ?auto_223179 ) ) ( not ( = ?auto_223177 ?auto_223180 ) ) ( not ( = ?auto_223178 ?auto_223179 ) ) ( not ( = ?auto_223178 ?auto_223180 ) ) ( not ( = ?auto_223179 ?auto_223180 ) ) ( ON ?auto_223178 ?auto_223179 ) ( ON ?auto_223177 ?auto_223178 ) ( CLEAR ?auto_223175 ) ( ON ?auto_223176 ?auto_223177 ) ( CLEAR ?auto_223176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_223174 ?auto_223175 ?auto_223176 )
      ( MAKE-6PILE ?auto_223174 ?auto_223175 ?auto_223176 ?auto_223177 ?auto_223178 ?auto_223179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223200 - BLOCK
      ?auto_223201 - BLOCK
      ?auto_223202 - BLOCK
      ?auto_223203 - BLOCK
      ?auto_223204 - BLOCK
      ?auto_223205 - BLOCK
    )
    :vars
    (
      ?auto_223206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223205 ?auto_223206 ) ( ON-TABLE ?auto_223200 ) ( not ( = ?auto_223200 ?auto_223201 ) ) ( not ( = ?auto_223200 ?auto_223202 ) ) ( not ( = ?auto_223200 ?auto_223203 ) ) ( not ( = ?auto_223200 ?auto_223204 ) ) ( not ( = ?auto_223200 ?auto_223205 ) ) ( not ( = ?auto_223200 ?auto_223206 ) ) ( not ( = ?auto_223201 ?auto_223202 ) ) ( not ( = ?auto_223201 ?auto_223203 ) ) ( not ( = ?auto_223201 ?auto_223204 ) ) ( not ( = ?auto_223201 ?auto_223205 ) ) ( not ( = ?auto_223201 ?auto_223206 ) ) ( not ( = ?auto_223202 ?auto_223203 ) ) ( not ( = ?auto_223202 ?auto_223204 ) ) ( not ( = ?auto_223202 ?auto_223205 ) ) ( not ( = ?auto_223202 ?auto_223206 ) ) ( not ( = ?auto_223203 ?auto_223204 ) ) ( not ( = ?auto_223203 ?auto_223205 ) ) ( not ( = ?auto_223203 ?auto_223206 ) ) ( not ( = ?auto_223204 ?auto_223205 ) ) ( not ( = ?auto_223204 ?auto_223206 ) ) ( not ( = ?auto_223205 ?auto_223206 ) ) ( ON ?auto_223204 ?auto_223205 ) ( ON ?auto_223203 ?auto_223204 ) ( ON ?auto_223202 ?auto_223203 ) ( CLEAR ?auto_223200 ) ( ON ?auto_223201 ?auto_223202 ) ( CLEAR ?auto_223201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_223200 ?auto_223201 )
      ( MAKE-6PILE ?auto_223200 ?auto_223201 ?auto_223202 ?auto_223203 ?auto_223204 ?auto_223205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_223226 - BLOCK
      ?auto_223227 - BLOCK
      ?auto_223228 - BLOCK
      ?auto_223229 - BLOCK
      ?auto_223230 - BLOCK
      ?auto_223231 - BLOCK
    )
    :vars
    (
      ?auto_223232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223231 ?auto_223232 ) ( not ( = ?auto_223226 ?auto_223227 ) ) ( not ( = ?auto_223226 ?auto_223228 ) ) ( not ( = ?auto_223226 ?auto_223229 ) ) ( not ( = ?auto_223226 ?auto_223230 ) ) ( not ( = ?auto_223226 ?auto_223231 ) ) ( not ( = ?auto_223226 ?auto_223232 ) ) ( not ( = ?auto_223227 ?auto_223228 ) ) ( not ( = ?auto_223227 ?auto_223229 ) ) ( not ( = ?auto_223227 ?auto_223230 ) ) ( not ( = ?auto_223227 ?auto_223231 ) ) ( not ( = ?auto_223227 ?auto_223232 ) ) ( not ( = ?auto_223228 ?auto_223229 ) ) ( not ( = ?auto_223228 ?auto_223230 ) ) ( not ( = ?auto_223228 ?auto_223231 ) ) ( not ( = ?auto_223228 ?auto_223232 ) ) ( not ( = ?auto_223229 ?auto_223230 ) ) ( not ( = ?auto_223229 ?auto_223231 ) ) ( not ( = ?auto_223229 ?auto_223232 ) ) ( not ( = ?auto_223230 ?auto_223231 ) ) ( not ( = ?auto_223230 ?auto_223232 ) ) ( not ( = ?auto_223231 ?auto_223232 ) ) ( ON ?auto_223230 ?auto_223231 ) ( ON ?auto_223229 ?auto_223230 ) ( ON ?auto_223228 ?auto_223229 ) ( ON ?auto_223227 ?auto_223228 ) ( ON ?auto_223226 ?auto_223227 ) ( CLEAR ?auto_223226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_223226 )
      ( MAKE-6PILE ?auto_223226 ?auto_223227 ?auto_223228 ?auto_223229 ?auto_223230 ?auto_223231 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223253 - BLOCK
      ?auto_223254 - BLOCK
      ?auto_223255 - BLOCK
      ?auto_223256 - BLOCK
      ?auto_223257 - BLOCK
      ?auto_223258 - BLOCK
      ?auto_223259 - BLOCK
    )
    :vars
    (
      ?auto_223260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_223258 ) ( ON ?auto_223259 ?auto_223260 ) ( CLEAR ?auto_223259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_223253 ) ( ON ?auto_223254 ?auto_223253 ) ( ON ?auto_223255 ?auto_223254 ) ( ON ?auto_223256 ?auto_223255 ) ( ON ?auto_223257 ?auto_223256 ) ( ON ?auto_223258 ?auto_223257 ) ( not ( = ?auto_223253 ?auto_223254 ) ) ( not ( = ?auto_223253 ?auto_223255 ) ) ( not ( = ?auto_223253 ?auto_223256 ) ) ( not ( = ?auto_223253 ?auto_223257 ) ) ( not ( = ?auto_223253 ?auto_223258 ) ) ( not ( = ?auto_223253 ?auto_223259 ) ) ( not ( = ?auto_223253 ?auto_223260 ) ) ( not ( = ?auto_223254 ?auto_223255 ) ) ( not ( = ?auto_223254 ?auto_223256 ) ) ( not ( = ?auto_223254 ?auto_223257 ) ) ( not ( = ?auto_223254 ?auto_223258 ) ) ( not ( = ?auto_223254 ?auto_223259 ) ) ( not ( = ?auto_223254 ?auto_223260 ) ) ( not ( = ?auto_223255 ?auto_223256 ) ) ( not ( = ?auto_223255 ?auto_223257 ) ) ( not ( = ?auto_223255 ?auto_223258 ) ) ( not ( = ?auto_223255 ?auto_223259 ) ) ( not ( = ?auto_223255 ?auto_223260 ) ) ( not ( = ?auto_223256 ?auto_223257 ) ) ( not ( = ?auto_223256 ?auto_223258 ) ) ( not ( = ?auto_223256 ?auto_223259 ) ) ( not ( = ?auto_223256 ?auto_223260 ) ) ( not ( = ?auto_223257 ?auto_223258 ) ) ( not ( = ?auto_223257 ?auto_223259 ) ) ( not ( = ?auto_223257 ?auto_223260 ) ) ( not ( = ?auto_223258 ?auto_223259 ) ) ( not ( = ?auto_223258 ?auto_223260 ) ) ( not ( = ?auto_223259 ?auto_223260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_223259 ?auto_223260 )
      ( !STACK ?auto_223259 ?auto_223258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223283 - BLOCK
      ?auto_223284 - BLOCK
      ?auto_223285 - BLOCK
      ?auto_223286 - BLOCK
      ?auto_223287 - BLOCK
      ?auto_223288 - BLOCK
      ?auto_223289 - BLOCK
    )
    :vars
    (
      ?auto_223290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223289 ?auto_223290 ) ( ON-TABLE ?auto_223283 ) ( ON ?auto_223284 ?auto_223283 ) ( ON ?auto_223285 ?auto_223284 ) ( ON ?auto_223286 ?auto_223285 ) ( ON ?auto_223287 ?auto_223286 ) ( not ( = ?auto_223283 ?auto_223284 ) ) ( not ( = ?auto_223283 ?auto_223285 ) ) ( not ( = ?auto_223283 ?auto_223286 ) ) ( not ( = ?auto_223283 ?auto_223287 ) ) ( not ( = ?auto_223283 ?auto_223288 ) ) ( not ( = ?auto_223283 ?auto_223289 ) ) ( not ( = ?auto_223283 ?auto_223290 ) ) ( not ( = ?auto_223284 ?auto_223285 ) ) ( not ( = ?auto_223284 ?auto_223286 ) ) ( not ( = ?auto_223284 ?auto_223287 ) ) ( not ( = ?auto_223284 ?auto_223288 ) ) ( not ( = ?auto_223284 ?auto_223289 ) ) ( not ( = ?auto_223284 ?auto_223290 ) ) ( not ( = ?auto_223285 ?auto_223286 ) ) ( not ( = ?auto_223285 ?auto_223287 ) ) ( not ( = ?auto_223285 ?auto_223288 ) ) ( not ( = ?auto_223285 ?auto_223289 ) ) ( not ( = ?auto_223285 ?auto_223290 ) ) ( not ( = ?auto_223286 ?auto_223287 ) ) ( not ( = ?auto_223286 ?auto_223288 ) ) ( not ( = ?auto_223286 ?auto_223289 ) ) ( not ( = ?auto_223286 ?auto_223290 ) ) ( not ( = ?auto_223287 ?auto_223288 ) ) ( not ( = ?auto_223287 ?auto_223289 ) ) ( not ( = ?auto_223287 ?auto_223290 ) ) ( not ( = ?auto_223288 ?auto_223289 ) ) ( not ( = ?auto_223288 ?auto_223290 ) ) ( not ( = ?auto_223289 ?auto_223290 ) ) ( CLEAR ?auto_223287 ) ( ON ?auto_223288 ?auto_223289 ) ( CLEAR ?auto_223288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_223283 ?auto_223284 ?auto_223285 ?auto_223286 ?auto_223287 ?auto_223288 )
      ( MAKE-7PILE ?auto_223283 ?auto_223284 ?auto_223285 ?auto_223286 ?auto_223287 ?auto_223288 ?auto_223289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223313 - BLOCK
      ?auto_223314 - BLOCK
      ?auto_223315 - BLOCK
      ?auto_223316 - BLOCK
      ?auto_223317 - BLOCK
      ?auto_223318 - BLOCK
      ?auto_223319 - BLOCK
    )
    :vars
    (
      ?auto_223320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223319 ?auto_223320 ) ( ON-TABLE ?auto_223313 ) ( ON ?auto_223314 ?auto_223313 ) ( ON ?auto_223315 ?auto_223314 ) ( ON ?auto_223316 ?auto_223315 ) ( not ( = ?auto_223313 ?auto_223314 ) ) ( not ( = ?auto_223313 ?auto_223315 ) ) ( not ( = ?auto_223313 ?auto_223316 ) ) ( not ( = ?auto_223313 ?auto_223317 ) ) ( not ( = ?auto_223313 ?auto_223318 ) ) ( not ( = ?auto_223313 ?auto_223319 ) ) ( not ( = ?auto_223313 ?auto_223320 ) ) ( not ( = ?auto_223314 ?auto_223315 ) ) ( not ( = ?auto_223314 ?auto_223316 ) ) ( not ( = ?auto_223314 ?auto_223317 ) ) ( not ( = ?auto_223314 ?auto_223318 ) ) ( not ( = ?auto_223314 ?auto_223319 ) ) ( not ( = ?auto_223314 ?auto_223320 ) ) ( not ( = ?auto_223315 ?auto_223316 ) ) ( not ( = ?auto_223315 ?auto_223317 ) ) ( not ( = ?auto_223315 ?auto_223318 ) ) ( not ( = ?auto_223315 ?auto_223319 ) ) ( not ( = ?auto_223315 ?auto_223320 ) ) ( not ( = ?auto_223316 ?auto_223317 ) ) ( not ( = ?auto_223316 ?auto_223318 ) ) ( not ( = ?auto_223316 ?auto_223319 ) ) ( not ( = ?auto_223316 ?auto_223320 ) ) ( not ( = ?auto_223317 ?auto_223318 ) ) ( not ( = ?auto_223317 ?auto_223319 ) ) ( not ( = ?auto_223317 ?auto_223320 ) ) ( not ( = ?auto_223318 ?auto_223319 ) ) ( not ( = ?auto_223318 ?auto_223320 ) ) ( not ( = ?auto_223319 ?auto_223320 ) ) ( ON ?auto_223318 ?auto_223319 ) ( CLEAR ?auto_223316 ) ( ON ?auto_223317 ?auto_223318 ) ( CLEAR ?auto_223317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_223313 ?auto_223314 ?auto_223315 ?auto_223316 ?auto_223317 )
      ( MAKE-7PILE ?auto_223313 ?auto_223314 ?auto_223315 ?auto_223316 ?auto_223317 ?auto_223318 ?auto_223319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223343 - BLOCK
      ?auto_223344 - BLOCK
      ?auto_223345 - BLOCK
      ?auto_223346 - BLOCK
      ?auto_223347 - BLOCK
      ?auto_223348 - BLOCK
      ?auto_223349 - BLOCK
    )
    :vars
    (
      ?auto_223350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223349 ?auto_223350 ) ( ON-TABLE ?auto_223343 ) ( ON ?auto_223344 ?auto_223343 ) ( ON ?auto_223345 ?auto_223344 ) ( not ( = ?auto_223343 ?auto_223344 ) ) ( not ( = ?auto_223343 ?auto_223345 ) ) ( not ( = ?auto_223343 ?auto_223346 ) ) ( not ( = ?auto_223343 ?auto_223347 ) ) ( not ( = ?auto_223343 ?auto_223348 ) ) ( not ( = ?auto_223343 ?auto_223349 ) ) ( not ( = ?auto_223343 ?auto_223350 ) ) ( not ( = ?auto_223344 ?auto_223345 ) ) ( not ( = ?auto_223344 ?auto_223346 ) ) ( not ( = ?auto_223344 ?auto_223347 ) ) ( not ( = ?auto_223344 ?auto_223348 ) ) ( not ( = ?auto_223344 ?auto_223349 ) ) ( not ( = ?auto_223344 ?auto_223350 ) ) ( not ( = ?auto_223345 ?auto_223346 ) ) ( not ( = ?auto_223345 ?auto_223347 ) ) ( not ( = ?auto_223345 ?auto_223348 ) ) ( not ( = ?auto_223345 ?auto_223349 ) ) ( not ( = ?auto_223345 ?auto_223350 ) ) ( not ( = ?auto_223346 ?auto_223347 ) ) ( not ( = ?auto_223346 ?auto_223348 ) ) ( not ( = ?auto_223346 ?auto_223349 ) ) ( not ( = ?auto_223346 ?auto_223350 ) ) ( not ( = ?auto_223347 ?auto_223348 ) ) ( not ( = ?auto_223347 ?auto_223349 ) ) ( not ( = ?auto_223347 ?auto_223350 ) ) ( not ( = ?auto_223348 ?auto_223349 ) ) ( not ( = ?auto_223348 ?auto_223350 ) ) ( not ( = ?auto_223349 ?auto_223350 ) ) ( ON ?auto_223348 ?auto_223349 ) ( ON ?auto_223347 ?auto_223348 ) ( CLEAR ?auto_223345 ) ( ON ?auto_223346 ?auto_223347 ) ( CLEAR ?auto_223346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_223343 ?auto_223344 ?auto_223345 ?auto_223346 )
      ( MAKE-7PILE ?auto_223343 ?auto_223344 ?auto_223345 ?auto_223346 ?auto_223347 ?auto_223348 ?auto_223349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223373 - BLOCK
      ?auto_223374 - BLOCK
      ?auto_223375 - BLOCK
      ?auto_223376 - BLOCK
      ?auto_223377 - BLOCK
      ?auto_223378 - BLOCK
      ?auto_223379 - BLOCK
    )
    :vars
    (
      ?auto_223380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223379 ?auto_223380 ) ( ON-TABLE ?auto_223373 ) ( ON ?auto_223374 ?auto_223373 ) ( not ( = ?auto_223373 ?auto_223374 ) ) ( not ( = ?auto_223373 ?auto_223375 ) ) ( not ( = ?auto_223373 ?auto_223376 ) ) ( not ( = ?auto_223373 ?auto_223377 ) ) ( not ( = ?auto_223373 ?auto_223378 ) ) ( not ( = ?auto_223373 ?auto_223379 ) ) ( not ( = ?auto_223373 ?auto_223380 ) ) ( not ( = ?auto_223374 ?auto_223375 ) ) ( not ( = ?auto_223374 ?auto_223376 ) ) ( not ( = ?auto_223374 ?auto_223377 ) ) ( not ( = ?auto_223374 ?auto_223378 ) ) ( not ( = ?auto_223374 ?auto_223379 ) ) ( not ( = ?auto_223374 ?auto_223380 ) ) ( not ( = ?auto_223375 ?auto_223376 ) ) ( not ( = ?auto_223375 ?auto_223377 ) ) ( not ( = ?auto_223375 ?auto_223378 ) ) ( not ( = ?auto_223375 ?auto_223379 ) ) ( not ( = ?auto_223375 ?auto_223380 ) ) ( not ( = ?auto_223376 ?auto_223377 ) ) ( not ( = ?auto_223376 ?auto_223378 ) ) ( not ( = ?auto_223376 ?auto_223379 ) ) ( not ( = ?auto_223376 ?auto_223380 ) ) ( not ( = ?auto_223377 ?auto_223378 ) ) ( not ( = ?auto_223377 ?auto_223379 ) ) ( not ( = ?auto_223377 ?auto_223380 ) ) ( not ( = ?auto_223378 ?auto_223379 ) ) ( not ( = ?auto_223378 ?auto_223380 ) ) ( not ( = ?auto_223379 ?auto_223380 ) ) ( ON ?auto_223378 ?auto_223379 ) ( ON ?auto_223377 ?auto_223378 ) ( ON ?auto_223376 ?auto_223377 ) ( CLEAR ?auto_223374 ) ( ON ?auto_223375 ?auto_223376 ) ( CLEAR ?auto_223375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_223373 ?auto_223374 ?auto_223375 )
      ( MAKE-7PILE ?auto_223373 ?auto_223374 ?auto_223375 ?auto_223376 ?auto_223377 ?auto_223378 ?auto_223379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223403 - BLOCK
      ?auto_223404 - BLOCK
      ?auto_223405 - BLOCK
      ?auto_223406 - BLOCK
      ?auto_223407 - BLOCK
      ?auto_223408 - BLOCK
      ?auto_223409 - BLOCK
    )
    :vars
    (
      ?auto_223410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223409 ?auto_223410 ) ( ON-TABLE ?auto_223403 ) ( not ( = ?auto_223403 ?auto_223404 ) ) ( not ( = ?auto_223403 ?auto_223405 ) ) ( not ( = ?auto_223403 ?auto_223406 ) ) ( not ( = ?auto_223403 ?auto_223407 ) ) ( not ( = ?auto_223403 ?auto_223408 ) ) ( not ( = ?auto_223403 ?auto_223409 ) ) ( not ( = ?auto_223403 ?auto_223410 ) ) ( not ( = ?auto_223404 ?auto_223405 ) ) ( not ( = ?auto_223404 ?auto_223406 ) ) ( not ( = ?auto_223404 ?auto_223407 ) ) ( not ( = ?auto_223404 ?auto_223408 ) ) ( not ( = ?auto_223404 ?auto_223409 ) ) ( not ( = ?auto_223404 ?auto_223410 ) ) ( not ( = ?auto_223405 ?auto_223406 ) ) ( not ( = ?auto_223405 ?auto_223407 ) ) ( not ( = ?auto_223405 ?auto_223408 ) ) ( not ( = ?auto_223405 ?auto_223409 ) ) ( not ( = ?auto_223405 ?auto_223410 ) ) ( not ( = ?auto_223406 ?auto_223407 ) ) ( not ( = ?auto_223406 ?auto_223408 ) ) ( not ( = ?auto_223406 ?auto_223409 ) ) ( not ( = ?auto_223406 ?auto_223410 ) ) ( not ( = ?auto_223407 ?auto_223408 ) ) ( not ( = ?auto_223407 ?auto_223409 ) ) ( not ( = ?auto_223407 ?auto_223410 ) ) ( not ( = ?auto_223408 ?auto_223409 ) ) ( not ( = ?auto_223408 ?auto_223410 ) ) ( not ( = ?auto_223409 ?auto_223410 ) ) ( ON ?auto_223408 ?auto_223409 ) ( ON ?auto_223407 ?auto_223408 ) ( ON ?auto_223406 ?auto_223407 ) ( ON ?auto_223405 ?auto_223406 ) ( CLEAR ?auto_223403 ) ( ON ?auto_223404 ?auto_223405 ) ( CLEAR ?auto_223404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_223403 ?auto_223404 )
      ( MAKE-7PILE ?auto_223403 ?auto_223404 ?auto_223405 ?auto_223406 ?auto_223407 ?auto_223408 ?auto_223409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_223433 - BLOCK
      ?auto_223434 - BLOCK
      ?auto_223435 - BLOCK
      ?auto_223436 - BLOCK
      ?auto_223437 - BLOCK
      ?auto_223438 - BLOCK
      ?auto_223439 - BLOCK
    )
    :vars
    (
      ?auto_223440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223439 ?auto_223440 ) ( not ( = ?auto_223433 ?auto_223434 ) ) ( not ( = ?auto_223433 ?auto_223435 ) ) ( not ( = ?auto_223433 ?auto_223436 ) ) ( not ( = ?auto_223433 ?auto_223437 ) ) ( not ( = ?auto_223433 ?auto_223438 ) ) ( not ( = ?auto_223433 ?auto_223439 ) ) ( not ( = ?auto_223433 ?auto_223440 ) ) ( not ( = ?auto_223434 ?auto_223435 ) ) ( not ( = ?auto_223434 ?auto_223436 ) ) ( not ( = ?auto_223434 ?auto_223437 ) ) ( not ( = ?auto_223434 ?auto_223438 ) ) ( not ( = ?auto_223434 ?auto_223439 ) ) ( not ( = ?auto_223434 ?auto_223440 ) ) ( not ( = ?auto_223435 ?auto_223436 ) ) ( not ( = ?auto_223435 ?auto_223437 ) ) ( not ( = ?auto_223435 ?auto_223438 ) ) ( not ( = ?auto_223435 ?auto_223439 ) ) ( not ( = ?auto_223435 ?auto_223440 ) ) ( not ( = ?auto_223436 ?auto_223437 ) ) ( not ( = ?auto_223436 ?auto_223438 ) ) ( not ( = ?auto_223436 ?auto_223439 ) ) ( not ( = ?auto_223436 ?auto_223440 ) ) ( not ( = ?auto_223437 ?auto_223438 ) ) ( not ( = ?auto_223437 ?auto_223439 ) ) ( not ( = ?auto_223437 ?auto_223440 ) ) ( not ( = ?auto_223438 ?auto_223439 ) ) ( not ( = ?auto_223438 ?auto_223440 ) ) ( not ( = ?auto_223439 ?auto_223440 ) ) ( ON ?auto_223438 ?auto_223439 ) ( ON ?auto_223437 ?auto_223438 ) ( ON ?auto_223436 ?auto_223437 ) ( ON ?auto_223435 ?auto_223436 ) ( ON ?auto_223434 ?auto_223435 ) ( ON ?auto_223433 ?auto_223434 ) ( CLEAR ?auto_223433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_223433 )
      ( MAKE-7PILE ?auto_223433 ?auto_223434 ?auto_223435 ?auto_223436 ?auto_223437 ?auto_223438 ?auto_223439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223464 - BLOCK
      ?auto_223465 - BLOCK
      ?auto_223466 - BLOCK
      ?auto_223467 - BLOCK
      ?auto_223468 - BLOCK
      ?auto_223469 - BLOCK
      ?auto_223470 - BLOCK
      ?auto_223471 - BLOCK
    )
    :vars
    (
      ?auto_223472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_223470 ) ( ON ?auto_223471 ?auto_223472 ) ( CLEAR ?auto_223471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_223464 ) ( ON ?auto_223465 ?auto_223464 ) ( ON ?auto_223466 ?auto_223465 ) ( ON ?auto_223467 ?auto_223466 ) ( ON ?auto_223468 ?auto_223467 ) ( ON ?auto_223469 ?auto_223468 ) ( ON ?auto_223470 ?auto_223469 ) ( not ( = ?auto_223464 ?auto_223465 ) ) ( not ( = ?auto_223464 ?auto_223466 ) ) ( not ( = ?auto_223464 ?auto_223467 ) ) ( not ( = ?auto_223464 ?auto_223468 ) ) ( not ( = ?auto_223464 ?auto_223469 ) ) ( not ( = ?auto_223464 ?auto_223470 ) ) ( not ( = ?auto_223464 ?auto_223471 ) ) ( not ( = ?auto_223464 ?auto_223472 ) ) ( not ( = ?auto_223465 ?auto_223466 ) ) ( not ( = ?auto_223465 ?auto_223467 ) ) ( not ( = ?auto_223465 ?auto_223468 ) ) ( not ( = ?auto_223465 ?auto_223469 ) ) ( not ( = ?auto_223465 ?auto_223470 ) ) ( not ( = ?auto_223465 ?auto_223471 ) ) ( not ( = ?auto_223465 ?auto_223472 ) ) ( not ( = ?auto_223466 ?auto_223467 ) ) ( not ( = ?auto_223466 ?auto_223468 ) ) ( not ( = ?auto_223466 ?auto_223469 ) ) ( not ( = ?auto_223466 ?auto_223470 ) ) ( not ( = ?auto_223466 ?auto_223471 ) ) ( not ( = ?auto_223466 ?auto_223472 ) ) ( not ( = ?auto_223467 ?auto_223468 ) ) ( not ( = ?auto_223467 ?auto_223469 ) ) ( not ( = ?auto_223467 ?auto_223470 ) ) ( not ( = ?auto_223467 ?auto_223471 ) ) ( not ( = ?auto_223467 ?auto_223472 ) ) ( not ( = ?auto_223468 ?auto_223469 ) ) ( not ( = ?auto_223468 ?auto_223470 ) ) ( not ( = ?auto_223468 ?auto_223471 ) ) ( not ( = ?auto_223468 ?auto_223472 ) ) ( not ( = ?auto_223469 ?auto_223470 ) ) ( not ( = ?auto_223469 ?auto_223471 ) ) ( not ( = ?auto_223469 ?auto_223472 ) ) ( not ( = ?auto_223470 ?auto_223471 ) ) ( not ( = ?auto_223470 ?auto_223472 ) ) ( not ( = ?auto_223471 ?auto_223472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_223471 ?auto_223472 )
      ( !STACK ?auto_223471 ?auto_223470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223498 - BLOCK
      ?auto_223499 - BLOCK
      ?auto_223500 - BLOCK
      ?auto_223501 - BLOCK
      ?auto_223502 - BLOCK
      ?auto_223503 - BLOCK
      ?auto_223504 - BLOCK
      ?auto_223505 - BLOCK
    )
    :vars
    (
      ?auto_223506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223505 ?auto_223506 ) ( ON-TABLE ?auto_223498 ) ( ON ?auto_223499 ?auto_223498 ) ( ON ?auto_223500 ?auto_223499 ) ( ON ?auto_223501 ?auto_223500 ) ( ON ?auto_223502 ?auto_223501 ) ( ON ?auto_223503 ?auto_223502 ) ( not ( = ?auto_223498 ?auto_223499 ) ) ( not ( = ?auto_223498 ?auto_223500 ) ) ( not ( = ?auto_223498 ?auto_223501 ) ) ( not ( = ?auto_223498 ?auto_223502 ) ) ( not ( = ?auto_223498 ?auto_223503 ) ) ( not ( = ?auto_223498 ?auto_223504 ) ) ( not ( = ?auto_223498 ?auto_223505 ) ) ( not ( = ?auto_223498 ?auto_223506 ) ) ( not ( = ?auto_223499 ?auto_223500 ) ) ( not ( = ?auto_223499 ?auto_223501 ) ) ( not ( = ?auto_223499 ?auto_223502 ) ) ( not ( = ?auto_223499 ?auto_223503 ) ) ( not ( = ?auto_223499 ?auto_223504 ) ) ( not ( = ?auto_223499 ?auto_223505 ) ) ( not ( = ?auto_223499 ?auto_223506 ) ) ( not ( = ?auto_223500 ?auto_223501 ) ) ( not ( = ?auto_223500 ?auto_223502 ) ) ( not ( = ?auto_223500 ?auto_223503 ) ) ( not ( = ?auto_223500 ?auto_223504 ) ) ( not ( = ?auto_223500 ?auto_223505 ) ) ( not ( = ?auto_223500 ?auto_223506 ) ) ( not ( = ?auto_223501 ?auto_223502 ) ) ( not ( = ?auto_223501 ?auto_223503 ) ) ( not ( = ?auto_223501 ?auto_223504 ) ) ( not ( = ?auto_223501 ?auto_223505 ) ) ( not ( = ?auto_223501 ?auto_223506 ) ) ( not ( = ?auto_223502 ?auto_223503 ) ) ( not ( = ?auto_223502 ?auto_223504 ) ) ( not ( = ?auto_223502 ?auto_223505 ) ) ( not ( = ?auto_223502 ?auto_223506 ) ) ( not ( = ?auto_223503 ?auto_223504 ) ) ( not ( = ?auto_223503 ?auto_223505 ) ) ( not ( = ?auto_223503 ?auto_223506 ) ) ( not ( = ?auto_223504 ?auto_223505 ) ) ( not ( = ?auto_223504 ?auto_223506 ) ) ( not ( = ?auto_223505 ?auto_223506 ) ) ( CLEAR ?auto_223503 ) ( ON ?auto_223504 ?auto_223505 ) ( CLEAR ?auto_223504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_223498 ?auto_223499 ?auto_223500 ?auto_223501 ?auto_223502 ?auto_223503 ?auto_223504 )
      ( MAKE-8PILE ?auto_223498 ?auto_223499 ?auto_223500 ?auto_223501 ?auto_223502 ?auto_223503 ?auto_223504 ?auto_223505 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223532 - BLOCK
      ?auto_223533 - BLOCK
      ?auto_223534 - BLOCK
      ?auto_223535 - BLOCK
      ?auto_223536 - BLOCK
      ?auto_223537 - BLOCK
      ?auto_223538 - BLOCK
      ?auto_223539 - BLOCK
    )
    :vars
    (
      ?auto_223540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223539 ?auto_223540 ) ( ON-TABLE ?auto_223532 ) ( ON ?auto_223533 ?auto_223532 ) ( ON ?auto_223534 ?auto_223533 ) ( ON ?auto_223535 ?auto_223534 ) ( ON ?auto_223536 ?auto_223535 ) ( not ( = ?auto_223532 ?auto_223533 ) ) ( not ( = ?auto_223532 ?auto_223534 ) ) ( not ( = ?auto_223532 ?auto_223535 ) ) ( not ( = ?auto_223532 ?auto_223536 ) ) ( not ( = ?auto_223532 ?auto_223537 ) ) ( not ( = ?auto_223532 ?auto_223538 ) ) ( not ( = ?auto_223532 ?auto_223539 ) ) ( not ( = ?auto_223532 ?auto_223540 ) ) ( not ( = ?auto_223533 ?auto_223534 ) ) ( not ( = ?auto_223533 ?auto_223535 ) ) ( not ( = ?auto_223533 ?auto_223536 ) ) ( not ( = ?auto_223533 ?auto_223537 ) ) ( not ( = ?auto_223533 ?auto_223538 ) ) ( not ( = ?auto_223533 ?auto_223539 ) ) ( not ( = ?auto_223533 ?auto_223540 ) ) ( not ( = ?auto_223534 ?auto_223535 ) ) ( not ( = ?auto_223534 ?auto_223536 ) ) ( not ( = ?auto_223534 ?auto_223537 ) ) ( not ( = ?auto_223534 ?auto_223538 ) ) ( not ( = ?auto_223534 ?auto_223539 ) ) ( not ( = ?auto_223534 ?auto_223540 ) ) ( not ( = ?auto_223535 ?auto_223536 ) ) ( not ( = ?auto_223535 ?auto_223537 ) ) ( not ( = ?auto_223535 ?auto_223538 ) ) ( not ( = ?auto_223535 ?auto_223539 ) ) ( not ( = ?auto_223535 ?auto_223540 ) ) ( not ( = ?auto_223536 ?auto_223537 ) ) ( not ( = ?auto_223536 ?auto_223538 ) ) ( not ( = ?auto_223536 ?auto_223539 ) ) ( not ( = ?auto_223536 ?auto_223540 ) ) ( not ( = ?auto_223537 ?auto_223538 ) ) ( not ( = ?auto_223537 ?auto_223539 ) ) ( not ( = ?auto_223537 ?auto_223540 ) ) ( not ( = ?auto_223538 ?auto_223539 ) ) ( not ( = ?auto_223538 ?auto_223540 ) ) ( not ( = ?auto_223539 ?auto_223540 ) ) ( ON ?auto_223538 ?auto_223539 ) ( CLEAR ?auto_223536 ) ( ON ?auto_223537 ?auto_223538 ) ( CLEAR ?auto_223537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_223532 ?auto_223533 ?auto_223534 ?auto_223535 ?auto_223536 ?auto_223537 )
      ( MAKE-8PILE ?auto_223532 ?auto_223533 ?auto_223534 ?auto_223535 ?auto_223536 ?auto_223537 ?auto_223538 ?auto_223539 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223566 - BLOCK
      ?auto_223567 - BLOCK
      ?auto_223568 - BLOCK
      ?auto_223569 - BLOCK
      ?auto_223570 - BLOCK
      ?auto_223571 - BLOCK
      ?auto_223572 - BLOCK
      ?auto_223573 - BLOCK
    )
    :vars
    (
      ?auto_223574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223573 ?auto_223574 ) ( ON-TABLE ?auto_223566 ) ( ON ?auto_223567 ?auto_223566 ) ( ON ?auto_223568 ?auto_223567 ) ( ON ?auto_223569 ?auto_223568 ) ( not ( = ?auto_223566 ?auto_223567 ) ) ( not ( = ?auto_223566 ?auto_223568 ) ) ( not ( = ?auto_223566 ?auto_223569 ) ) ( not ( = ?auto_223566 ?auto_223570 ) ) ( not ( = ?auto_223566 ?auto_223571 ) ) ( not ( = ?auto_223566 ?auto_223572 ) ) ( not ( = ?auto_223566 ?auto_223573 ) ) ( not ( = ?auto_223566 ?auto_223574 ) ) ( not ( = ?auto_223567 ?auto_223568 ) ) ( not ( = ?auto_223567 ?auto_223569 ) ) ( not ( = ?auto_223567 ?auto_223570 ) ) ( not ( = ?auto_223567 ?auto_223571 ) ) ( not ( = ?auto_223567 ?auto_223572 ) ) ( not ( = ?auto_223567 ?auto_223573 ) ) ( not ( = ?auto_223567 ?auto_223574 ) ) ( not ( = ?auto_223568 ?auto_223569 ) ) ( not ( = ?auto_223568 ?auto_223570 ) ) ( not ( = ?auto_223568 ?auto_223571 ) ) ( not ( = ?auto_223568 ?auto_223572 ) ) ( not ( = ?auto_223568 ?auto_223573 ) ) ( not ( = ?auto_223568 ?auto_223574 ) ) ( not ( = ?auto_223569 ?auto_223570 ) ) ( not ( = ?auto_223569 ?auto_223571 ) ) ( not ( = ?auto_223569 ?auto_223572 ) ) ( not ( = ?auto_223569 ?auto_223573 ) ) ( not ( = ?auto_223569 ?auto_223574 ) ) ( not ( = ?auto_223570 ?auto_223571 ) ) ( not ( = ?auto_223570 ?auto_223572 ) ) ( not ( = ?auto_223570 ?auto_223573 ) ) ( not ( = ?auto_223570 ?auto_223574 ) ) ( not ( = ?auto_223571 ?auto_223572 ) ) ( not ( = ?auto_223571 ?auto_223573 ) ) ( not ( = ?auto_223571 ?auto_223574 ) ) ( not ( = ?auto_223572 ?auto_223573 ) ) ( not ( = ?auto_223572 ?auto_223574 ) ) ( not ( = ?auto_223573 ?auto_223574 ) ) ( ON ?auto_223572 ?auto_223573 ) ( ON ?auto_223571 ?auto_223572 ) ( CLEAR ?auto_223569 ) ( ON ?auto_223570 ?auto_223571 ) ( CLEAR ?auto_223570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_223566 ?auto_223567 ?auto_223568 ?auto_223569 ?auto_223570 )
      ( MAKE-8PILE ?auto_223566 ?auto_223567 ?auto_223568 ?auto_223569 ?auto_223570 ?auto_223571 ?auto_223572 ?auto_223573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223600 - BLOCK
      ?auto_223601 - BLOCK
      ?auto_223602 - BLOCK
      ?auto_223603 - BLOCK
      ?auto_223604 - BLOCK
      ?auto_223605 - BLOCK
      ?auto_223606 - BLOCK
      ?auto_223607 - BLOCK
    )
    :vars
    (
      ?auto_223608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223607 ?auto_223608 ) ( ON-TABLE ?auto_223600 ) ( ON ?auto_223601 ?auto_223600 ) ( ON ?auto_223602 ?auto_223601 ) ( not ( = ?auto_223600 ?auto_223601 ) ) ( not ( = ?auto_223600 ?auto_223602 ) ) ( not ( = ?auto_223600 ?auto_223603 ) ) ( not ( = ?auto_223600 ?auto_223604 ) ) ( not ( = ?auto_223600 ?auto_223605 ) ) ( not ( = ?auto_223600 ?auto_223606 ) ) ( not ( = ?auto_223600 ?auto_223607 ) ) ( not ( = ?auto_223600 ?auto_223608 ) ) ( not ( = ?auto_223601 ?auto_223602 ) ) ( not ( = ?auto_223601 ?auto_223603 ) ) ( not ( = ?auto_223601 ?auto_223604 ) ) ( not ( = ?auto_223601 ?auto_223605 ) ) ( not ( = ?auto_223601 ?auto_223606 ) ) ( not ( = ?auto_223601 ?auto_223607 ) ) ( not ( = ?auto_223601 ?auto_223608 ) ) ( not ( = ?auto_223602 ?auto_223603 ) ) ( not ( = ?auto_223602 ?auto_223604 ) ) ( not ( = ?auto_223602 ?auto_223605 ) ) ( not ( = ?auto_223602 ?auto_223606 ) ) ( not ( = ?auto_223602 ?auto_223607 ) ) ( not ( = ?auto_223602 ?auto_223608 ) ) ( not ( = ?auto_223603 ?auto_223604 ) ) ( not ( = ?auto_223603 ?auto_223605 ) ) ( not ( = ?auto_223603 ?auto_223606 ) ) ( not ( = ?auto_223603 ?auto_223607 ) ) ( not ( = ?auto_223603 ?auto_223608 ) ) ( not ( = ?auto_223604 ?auto_223605 ) ) ( not ( = ?auto_223604 ?auto_223606 ) ) ( not ( = ?auto_223604 ?auto_223607 ) ) ( not ( = ?auto_223604 ?auto_223608 ) ) ( not ( = ?auto_223605 ?auto_223606 ) ) ( not ( = ?auto_223605 ?auto_223607 ) ) ( not ( = ?auto_223605 ?auto_223608 ) ) ( not ( = ?auto_223606 ?auto_223607 ) ) ( not ( = ?auto_223606 ?auto_223608 ) ) ( not ( = ?auto_223607 ?auto_223608 ) ) ( ON ?auto_223606 ?auto_223607 ) ( ON ?auto_223605 ?auto_223606 ) ( ON ?auto_223604 ?auto_223605 ) ( CLEAR ?auto_223602 ) ( ON ?auto_223603 ?auto_223604 ) ( CLEAR ?auto_223603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_223600 ?auto_223601 ?auto_223602 ?auto_223603 )
      ( MAKE-8PILE ?auto_223600 ?auto_223601 ?auto_223602 ?auto_223603 ?auto_223604 ?auto_223605 ?auto_223606 ?auto_223607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223634 - BLOCK
      ?auto_223635 - BLOCK
      ?auto_223636 - BLOCK
      ?auto_223637 - BLOCK
      ?auto_223638 - BLOCK
      ?auto_223639 - BLOCK
      ?auto_223640 - BLOCK
      ?auto_223641 - BLOCK
    )
    :vars
    (
      ?auto_223642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223641 ?auto_223642 ) ( ON-TABLE ?auto_223634 ) ( ON ?auto_223635 ?auto_223634 ) ( not ( = ?auto_223634 ?auto_223635 ) ) ( not ( = ?auto_223634 ?auto_223636 ) ) ( not ( = ?auto_223634 ?auto_223637 ) ) ( not ( = ?auto_223634 ?auto_223638 ) ) ( not ( = ?auto_223634 ?auto_223639 ) ) ( not ( = ?auto_223634 ?auto_223640 ) ) ( not ( = ?auto_223634 ?auto_223641 ) ) ( not ( = ?auto_223634 ?auto_223642 ) ) ( not ( = ?auto_223635 ?auto_223636 ) ) ( not ( = ?auto_223635 ?auto_223637 ) ) ( not ( = ?auto_223635 ?auto_223638 ) ) ( not ( = ?auto_223635 ?auto_223639 ) ) ( not ( = ?auto_223635 ?auto_223640 ) ) ( not ( = ?auto_223635 ?auto_223641 ) ) ( not ( = ?auto_223635 ?auto_223642 ) ) ( not ( = ?auto_223636 ?auto_223637 ) ) ( not ( = ?auto_223636 ?auto_223638 ) ) ( not ( = ?auto_223636 ?auto_223639 ) ) ( not ( = ?auto_223636 ?auto_223640 ) ) ( not ( = ?auto_223636 ?auto_223641 ) ) ( not ( = ?auto_223636 ?auto_223642 ) ) ( not ( = ?auto_223637 ?auto_223638 ) ) ( not ( = ?auto_223637 ?auto_223639 ) ) ( not ( = ?auto_223637 ?auto_223640 ) ) ( not ( = ?auto_223637 ?auto_223641 ) ) ( not ( = ?auto_223637 ?auto_223642 ) ) ( not ( = ?auto_223638 ?auto_223639 ) ) ( not ( = ?auto_223638 ?auto_223640 ) ) ( not ( = ?auto_223638 ?auto_223641 ) ) ( not ( = ?auto_223638 ?auto_223642 ) ) ( not ( = ?auto_223639 ?auto_223640 ) ) ( not ( = ?auto_223639 ?auto_223641 ) ) ( not ( = ?auto_223639 ?auto_223642 ) ) ( not ( = ?auto_223640 ?auto_223641 ) ) ( not ( = ?auto_223640 ?auto_223642 ) ) ( not ( = ?auto_223641 ?auto_223642 ) ) ( ON ?auto_223640 ?auto_223641 ) ( ON ?auto_223639 ?auto_223640 ) ( ON ?auto_223638 ?auto_223639 ) ( ON ?auto_223637 ?auto_223638 ) ( CLEAR ?auto_223635 ) ( ON ?auto_223636 ?auto_223637 ) ( CLEAR ?auto_223636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_223634 ?auto_223635 ?auto_223636 )
      ( MAKE-8PILE ?auto_223634 ?auto_223635 ?auto_223636 ?auto_223637 ?auto_223638 ?auto_223639 ?auto_223640 ?auto_223641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223668 - BLOCK
      ?auto_223669 - BLOCK
      ?auto_223670 - BLOCK
      ?auto_223671 - BLOCK
      ?auto_223672 - BLOCK
      ?auto_223673 - BLOCK
      ?auto_223674 - BLOCK
      ?auto_223675 - BLOCK
    )
    :vars
    (
      ?auto_223676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223675 ?auto_223676 ) ( ON-TABLE ?auto_223668 ) ( not ( = ?auto_223668 ?auto_223669 ) ) ( not ( = ?auto_223668 ?auto_223670 ) ) ( not ( = ?auto_223668 ?auto_223671 ) ) ( not ( = ?auto_223668 ?auto_223672 ) ) ( not ( = ?auto_223668 ?auto_223673 ) ) ( not ( = ?auto_223668 ?auto_223674 ) ) ( not ( = ?auto_223668 ?auto_223675 ) ) ( not ( = ?auto_223668 ?auto_223676 ) ) ( not ( = ?auto_223669 ?auto_223670 ) ) ( not ( = ?auto_223669 ?auto_223671 ) ) ( not ( = ?auto_223669 ?auto_223672 ) ) ( not ( = ?auto_223669 ?auto_223673 ) ) ( not ( = ?auto_223669 ?auto_223674 ) ) ( not ( = ?auto_223669 ?auto_223675 ) ) ( not ( = ?auto_223669 ?auto_223676 ) ) ( not ( = ?auto_223670 ?auto_223671 ) ) ( not ( = ?auto_223670 ?auto_223672 ) ) ( not ( = ?auto_223670 ?auto_223673 ) ) ( not ( = ?auto_223670 ?auto_223674 ) ) ( not ( = ?auto_223670 ?auto_223675 ) ) ( not ( = ?auto_223670 ?auto_223676 ) ) ( not ( = ?auto_223671 ?auto_223672 ) ) ( not ( = ?auto_223671 ?auto_223673 ) ) ( not ( = ?auto_223671 ?auto_223674 ) ) ( not ( = ?auto_223671 ?auto_223675 ) ) ( not ( = ?auto_223671 ?auto_223676 ) ) ( not ( = ?auto_223672 ?auto_223673 ) ) ( not ( = ?auto_223672 ?auto_223674 ) ) ( not ( = ?auto_223672 ?auto_223675 ) ) ( not ( = ?auto_223672 ?auto_223676 ) ) ( not ( = ?auto_223673 ?auto_223674 ) ) ( not ( = ?auto_223673 ?auto_223675 ) ) ( not ( = ?auto_223673 ?auto_223676 ) ) ( not ( = ?auto_223674 ?auto_223675 ) ) ( not ( = ?auto_223674 ?auto_223676 ) ) ( not ( = ?auto_223675 ?auto_223676 ) ) ( ON ?auto_223674 ?auto_223675 ) ( ON ?auto_223673 ?auto_223674 ) ( ON ?auto_223672 ?auto_223673 ) ( ON ?auto_223671 ?auto_223672 ) ( ON ?auto_223670 ?auto_223671 ) ( CLEAR ?auto_223668 ) ( ON ?auto_223669 ?auto_223670 ) ( CLEAR ?auto_223669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_223668 ?auto_223669 )
      ( MAKE-8PILE ?auto_223668 ?auto_223669 ?auto_223670 ?auto_223671 ?auto_223672 ?auto_223673 ?auto_223674 ?auto_223675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_223702 - BLOCK
      ?auto_223703 - BLOCK
      ?auto_223704 - BLOCK
      ?auto_223705 - BLOCK
      ?auto_223706 - BLOCK
      ?auto_223707 - BLOCK
      ?auto_223708 - BLOCK
      ?auto_223709 - BLOCK
    )
    :vars
    (
      ?auto_223710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223709 ?auto_223710 ) ( not ( = ?auto_223702 ?auto_223703 ) ) ( not ( = ?auto_223702 ?auto_223704 ) ) ( not ( = ?auto_223702 ?auto_223705 ) ) ( not ( = ?auto_223702 ?auto_223706 ) ) ( not ( = ?auto_223702 ?auto_223707 ) ) ( not ( = ?auto_223702 ?auto_223708 ) ) ( not ( = ?auto_223702 ?auto_223709 ) ) ( not ( = ?auto_223702 ?auto_223710 ) ) ( not ( = ?auto_223703 ?auto_223704 ) ) ( not ( = ?auto_223703 ?auto_223705 ) ) ( not ( = ?auto_223703 ?auto_223706 ) ) ( not ( = ?auto_223703 ?auto_223707 ) ) ( not ( = ?auto_223703 ?auto_223708 ) ) ( not ( = ?auto_223703 ?auto_223709 ) ) ( not ( = ?auto_223703 ?auto_223710 ) ) ( not ( = ?auto_223704 ?auto_223705 ) ) ( not ( = ?auto_223704 ?auto_223706 ) ) ( not ( = ?auto_223704 ?auto_223707 ) ) ( not ( = ?auto_223704 ?auto_223708 ) ) ( not ( = ?auto_223704 ?auto_223709 ) ) ( not ( = ?auto_223704 ?auto_223710 ) ) ( not ( = ?auto_223705 ?auto_223706 ) ) ( not ( = ?auto_223705 ?auto_223707 ) ) ( not ( = ?auto_223705 ?auto_223708 ) ) ( not ( = ?auto_223705 ?auto_223709 ) ) ( not ( = ?auto_223705 ?auto_223710 ) ) ( not ( = ?auto_223706 ?auto_223707 ) ) ( not ( = ?auto_223706 ?auto_223708 ) ) ( not ( = ?auto_223706 ?auto_223709 ) ) ( not ( = ?auto_223706 ?auto_223710 ) ) ( not ( = ?auto_223707 ?auto_223708 ) ) ( not ( = ?auto_223707 ?auto_223709 ) ) ( not ( = ?auto_223707 ?auto_223710 ) ) ( not ( = ?auto_223708 ?auto_223709 ) ) ( not ( = ?auto_223708 ?auto_223710 ) ) ( not ( = ?auto_223709 ?auto_223710 ) ) ( ON ?auto_223708 ?auto_223709 ) ( ON ?auto_223707 ?auto_223708 ) ( ON ?auto_223706 ?auto_223707 ) ( ON ?auto_223705 ?auto_223706 ) ( ON ?auto_223704 ?auto_223705 ) ( ON ?auto_223703 ?auto_223704 ) ( ON ?auto_223702 ?auto_223703 ) ( CLEAR ?auto_223702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_223702 )
      ( MAKE-8PILE ?auto_223702 ?auto_223703 ?auto_223704 ?auto_223705 ?auto_223706 ?auto_223707 ?auto_223708 ?auto_223709 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223737 - BLOCK
      ?auto_223738 - BLOCK
      ?auto_223739 - BLOCK
      ?auto_223740 - BLOCK
      ?auto_223741 - BLOCK
      ?auto_223742 - BLOCK
      ?auto_223743 - BLOCK
      ?auto_223744 - BLOCK
      ?auto_223745 - BLOCK
    )
    :vars
    (
      ?auto_223746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_223744 ) ( ON ?auto_223745 ?auto_223746 ) ( CLEAR ?auto_223745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_223737 ) ( ON ?auto_223738 ?auto_223737 ) ( ON ?auto_223739 ?auto_223738 ) ( ON ?auto_223740 ?auto_223739 ) ( ON ?auto_223741 ?auto_223740 ) ( ON ?auto_223742 ?auto_223741 ) ( ON ?auto_223743 ?auto_223742 ) ( ON ?auto_223744 ?auto_223743 ) ( not ( = ?auto_223737 ?auto_223738 ) ) ( not ( = ?auto_223737 ?auto_223739 ) ) ( not ( = ?auto_223737 ?auto_223740 ) ) ( not ( = ?auto_223737 ?auto_223741 ) ) ( not ( = ?auto_223737 ?auto_223742 ) ) ( not ( = ?auto_223737 ?auto_223743 ) ) ( not ( = ?auto_223737 ?auto_223744 ) ) ( not ( = ?auto_223737 ?auto_223745 ) ) ( not ( = ?auto_223737 ?auto_223746 ) ) ( not ( = ?auto_223738 ?auto_223739 ) ) ( not ( = ?auto_223738 ?auto_223740 ) ) ( not ( = ?auto_223738 ?auto_223741 ) ) ( not ( = ?auto_223738 ?auto_223742 ) ) ( not ( = ?auto_223738 ?auto_223743 ) ) ( not ( = ?auto_223738 ?auto_223744 ) ) ( not ( = ?auto_223738 ?auto_223745 ) ) ( not ( = ?auto_223738 ?auto_223746 ) ) ( not ( = ?auto_223739 ?auto_223740 ) ) ( not ( = ?auto_223739 ?auto_223741 ) ) ( not ( = ?auto_223739 ?auto_223742 ) ) ( not ( = ?auto_223739 ?auto_223743 ) ) ( not ( = ?auto_223739 ?auto_223744 ) ) ( not ( = ?auto_223739 ?auto_223745 ) ) ( not ( = ?auto_223739 ?auto_223746 ) ) ( not ( = ?auto_223740 ?auto_223741 ) ) ( not ( = ?auto_223740 ?auto_223742 ) ) ( not ( = ?auto_223740 ?auto_223743 ) ) ( not ( = ?auto_223740 ?auto_223744 ) ) ( not ( = ?auto_223740 ?auto_223745 ) ) ( not ( = ?auto_223740 ?auto_223746 ) ) ( not ( = ?auto_223741 ?auto_223742 ) ) ( not ( = ?auto_223741 ?auto_223743 ) ) ( not ( = ?auto_223741 ?auto_223744 ) ) ( not ( = ?auto_223741 ?auto_223745 ) ) ( not ( = ?auto_223741 ?auto_223746 ) ) ( not ( = ?auto_223742 ?auto_223743 ) ) ( not ( = ?auto_223742 ?auto_223744 ) ) ( not ( = ?auto_223742 ?auto_223745 ) ) ( not ( = ?auto_223742 ?auto_223746 ) ) ( not ( = ?auto_223743 ?auto_223744 ) ) ( not ( = ?auto_223743 ?auto_223745 ) ) ( not ( = ?auto_223743 ?auto_223746 ) ) ( not ( = ?auto_223744 ?auto_223745 ) ) ( not ( = ?auto_223744 ?auto_223746 ) ) ( not ( = ?auto_223745 ?auto_223746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_223745 ?auto_223746 )
      ( !STACK ?auto_223745 ?auto_223744 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223775 - BLOCK
      ?auto_223776 - BLOCK
      ?auto_223777 - BLOCK
      ?auto_223778 - BLOCK
      ?auto_223779 - BLOCK
      ?auto_223780 - BLOCK
      ?auto_223781 - BLOCK
      ?auto_223782 - BLOCK
      ?auto_223783 - BLOCK
    )
    :vars
    (
      ?auto_223784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223783 ?auto_223784 ) ( ON-TABLE ?auto_223775 ) ( ON ?auto_223776 ?auto_223775 ) ( ON ?auto_223777 ?auto_223776 ) ( ON ?auto_223778 ?auto_223777 ) ( ON ?auto_223779 ?auto_223778 ) ( ON ?auto_223780 ?auto_223779 ) ( ON ?auto_223781 ?auto_223780 ) ( not ( = ?auto_223775 ?auto_223776 ) ) ( not ( = ?auto_223775 ?auto_223777 ) ) ( not ( = ?auto_223775 ?auto_223778 ) ) ( not ( = ?auto_223775 ?auto_223779 ) ) ( not ( = ?auto_223775 ?auto_223780 ) ) ( not ( = ?auto_223775 ?auto_223781 ) ) ( not ( = ?auto_223775 ?auto_223782 ) ) ( not ( = ?auto_223775 ?auto_223783 ) ) ( not ( = ?auto_223775 ?auto_223784 ) ) ( not ( = ?auto_223776 ?auto_223777 ) ) ( not ( = ?auto_223776 ?auto_223778 ) ) ( not ( = ?auto_223776 ?auto_223779 ) ) ( not ( = ?auto_223776 ?auto_223780 ) ) ( not ( = ?auto_223776 ?auto_223781 ) ) ( not ( = ?auto_223776 ?auto_223782 ) ) ( not ( = ?auto_223776 ?auto_223783 ) ) ( not ( = ?auto_223776 ?auto_223784 ) ) ( not ( = ?auto_223777 ?auto_223778 ) ) ( not ( = ?auto_223777 ?auto_223779 ) ) ( not ( = ?auto_223777 ?auto_223780 ) ) ( not ( = ?auto_223777 ?auto_223781 ) ) ( not ( = ?auto_223777 ?auto_223782 ) ) ( not ( = ?auto_223777 ?auto_223783 ) ) ( not ( = ?auto_223777 ?auto_223784 ) ) ( not ( = ?auto_223778 ?auto_223779 ) ) ( not ( = ?auto_223778 ?auto_223780 ) ) ( not ( = ?auto_223778 ?auto_223781 ) ) ( not ( = ?auto_223778 ?auto_223782 ) ) ( not ( = ?auto_223778 ?auto_223783 ) ) ( not ( = ?auto_223778 ?auto_223784 ) ) ( not ( = ?auto_223779 ?auto_223780 ) ) ( not ( = ?auto_223779 ?auto_223781 ) ) ( not ( = ?auto_223779 ?auto_223782 ) ) ( not ( = ?auto_223779 ?auto_223783 ) ) ( not ( = ?auto_223779 ?auto_223784 ) ) ( not ( = ?auto_223780 ?auto_223781 ) ) ( not ( = ?auto_223780 ?auto_223782 ) ) ( not ( = ?auto_223780 ?auto_223783 ) ) ( not ( = ?auto_223780 ?auto_223784 ) ) ( not ( = ?auto_223781 ?auto_223782 ) ) ( not ( = ?auto_223781 ?auto_223783 ) ) ( not ( = ?auto_223781 ?auto_223784 ) ) ( not ( = ?auto_223782 ?auto_223783 ) ) ( not ( = ?auto_223782 ?auto_223784 ) ) ( not ( = ?auto_223783 ?auto_223784 ) ) ( CLEAR ?auto_223781 ) ( ON ?auto_223782 ?auto_223783 ) ( CLEAR ?auto_223782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_223775 ?auto_223776 ?auto_223777 ?auto_223778 ?auto_223779 ?auto_223780 ?auto_223781 ?auto_223782 )
      ( MAKE-9PILE ?auto_223775 ?auto_223776 ?auto_223777 ?auto_223778 ?auto_223779 ?auto_223780 ?auto_223781 ?auto_223782 ?auto_223783 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223813 - BLOCK
      ?auto_223814 - BLOCK
      ?auto_223815 - BLOCK
      ?auto_223816 - BLOCK
      ?auto_223817 - BLOCK
      ?auto_223818 - BLOCK
      ?auto_223819 - BLOCK
      ?auto_223820 - BLOCK
      ?auto_223821 - BLOCK
    )
    :vars
    (
      ?auto_223822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223821 ?auto_223822 ) ( ON-TABLE ?auto_223813 ) ( ON ?auto_223814 ?auto_223813 ) ( ON ?auto_223815 ?auto_223814 ) ( ON ?auto_223816 ?auto_223815 ) ( ON ?auto_223817 ?auto_223816 ) ( ON ?auto_223818 ?auto_223817 ) ( not ( = ?auto_223813 ?auto_223814 ) ) ( not ( = ?auto_223813 ?auto_223815 ) ) ( not ( = ?auto_223813 ?auto_223816 ) ) ( not ( = ?auto_223813 ?auto_223817 ) ) ( not ( = ?auto_223813 ?auto_223818 ) ) ( not ( = ?auto_223813 ?auto_223819 ) ) ( not ( = ?auto_223813 ?auto_223820 ) ) ( not ( = ?auto_223813 ?auto_223821 ) ) ( not ( = ?auto_223813 ?auto_223822 ) ) ( not ( = ?auto_223814 ?auto_223815 ) ) ( not ( = ?auto_223814 ?auto_223816 ) ) ( not ( = ?auto_223814 ?auto_223817 ) ) ( not ( = ?auto_223814 ?auto_223818 ) ) ( not ( = ?auto_223814 ?auto_223819 ) ) ( not ( = ?auto_223814 ?auto_223820 ) ) ( not ( = ?auto_223814 ?auto_223821 ) ) ( not ( = ?auto_223814 ?auto_223822 ) ) ( not ( = ?auto_223815 ?auto_223816 ) ) ( not ( = ?auto_223815 ?auto_223817 ) ) ( not ( = ?auto_223815 ?auto_223818 ) ) ( not ( = ?auto_223815 ?auto_223819 ) ) ( not ( = ?auto_223815 ?auto_223820 ) ) ( not ( = ?auto_223815 ?auto_223821 ) ) ( not ( = ?auto_223815 ?auto_223822 ) ) ( not ( = ?auto_223816 ?auto_223817 ) ) ( not ( = ?auto_223816 ?auto_223818 ) ) ( not ( = ?auto_223816 ?auto_223819 ) ) ( not ( = ?auto_223816 ?auto_223820 ) ) ( not ( = ?auto_223816 ?auto_223821 ) ) ( not ( = ?auto_223816 ?auto_223822 ) ) ( not ( = ?auto_223817 ?auto_223818 ) ) ( not ( = ?auto_223817 ?auto_223819 ) ) ( not ( = ?auto_223817 ?auto_223820 ) ) ( not ( = ?auto_223817 ?auto_223821 ) ) ( not ( = ?auto_223817 ?auto_223822 ) ) ( not ( = ?auto_223818 ?auto_223819 ) ) ( not ( = ?auto_223818 ?auto_223820 ) ) ( not ( = ?auto_223818 ?auto_223821 ) ) ( not ( = ?auto_223818 ?auto_223822 ) ) ( not ( = ?auto_223819 ?auto_223820 ) ) ( not ( = ?auto_223819 ?auto_223821 ) ) ( not ( = ?auto_223819 ?auto_223822 ) ) ( not ( = ?auto_223820 ?auto_223821 ) ) ( not ( = ?auto_223820 ?auto_223822 ) ) ( not ( = ?auto_223821 ?auto_223822 ) ) ( ON ?auto_223820 ?auto_223821 ) ( CLEAR ?auto_223818 ) ( ON ?auto_223819 ?auto_223820 ) ( CLEAR ?auto_223819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_223813 ?auto_223814 ?auto_223815 ?auto_223816 ?auto_223817 ?auto_223818 ?auto_223819 )
      ( MAKE-9PILE ?auto_223813 ?auto_223814 ?auto_223815 ?auto_223816 ?auto_223817 ?auto_223818 ?auto_223819 ?auto_223820 ?auto_223821 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223851 - BLOCK
      ?auto_223852 - BLOCK
      ?auto_223853 - BLOCK
      ?auto_223854 - BLOCK
      ?auto_223855 - BLOCK
      ?auto_223856 - BLOCK
      ?auto_223857 - BLOCK
      ?auto_223858 - BLOCK
      ?auto_223859 - BLOCK
    )
    :vars
    (
      ?auto_223860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223859 ?auto_223860 ) ( ON-TABLE ?auto_223851 ) ( ON ?auto_223852 ?auto_223851 ) ( ON ?auto_223853 ?auto_223852 ) ( ON ?auto_223854 ?auto_223853 ) ( ON ?auto_223855 ?auto_223854 ) ( not ( = ?auto_223851 ?auto_223852 ) ) ( not ( = ?auto_223851 ?auto_223853 ) ) ( not ( = ?auto_223851 ?auto_223854 ) ) ( not ( = ?auto_223851 ?auto_223855 ) ) ( not ( = ?auto_223851 ?auto_223856 ) ) ( not ( = ?auto_223851 ?auto_223857 ) ) ( not ( = ?auto_223851 ?auto_223858 ) ) ( not ( = ?auto_223851 ?auto_223859 ) ) ( not ( = ?auto_223851 ?auto_223860 ) ) ( not ( = ?auto_223852 ?auto_223853 ) ) ( not ( = ?auto_223852 ?auto_223854 ) ) ( not ( = ?auto_223852 ?auto_223855 ) ) ( not ( = ?auto_223852 ?auto_223856 ) ) ( not ( = ?auto_223852 ?auto_223857 ) ) ( not ( = ?auto_223852 ?auto_223858 ) ) ( not ( = ?auto_223852 ?auto_223859 ) ) ( not ( = ?auto_223852 ?auto_223860 ) ) ( not ( = ?auto_223853 ?auto_223854 ) ) ( not ( = ?auto_223853 ?auto_223855 ) ) ( not ( = ?auto_223853 ?auto_223856 ) ) ( not ( = ?auto_223853 ?auto_223857 ) ) ( not ( = ?auto_223853 ?auto_223858 ) ) ( not ( = ?auto_223853 ?auto_223859 ) ) ( not ( = ?auto_223853 ?auto_223860 ) ) ( not ( = ?auto_223854 ?auto_223855 ) ) ( not ( = ?auto_223854 ?auto_223856 ) ) ( not ( = ?auto_223854 ?auto_223857 ) ) ( not ( = ?auto_223854 ?auto_223858 ) ) ( not ( = ?auto_223854 ?auto_223859 ) ) ( not ( = ?auto_223854 ?auto_223860 ) ) ( not ( = ?auto_223855 ?auto_223856 ) ) ( not ( = ?auto_223855 ?auto_223857 ) ) ( not ( = ?auto_223855 ?auto_223858 ) ) ( not ( = ?auto_223855 ?auto_223859 ) ) ( not ( = ?auto_223855 ?auto_223860 ) ) ( not ( = ?auto_223856 ?auto_223857 ) ) ( not ( = ?auto_223856 ?auto_223858 ) ) ( not ( = ?auto_223856 ?auto_223859 ) ) ( not ( = ?auto_223856 ?auto_223860 ) ) ( not ( = ?auto_223857 ?auto_223858 ) ) ( not ( = ?auto_223857 ?auto_223859 ) ) ( not ( = ?auto_223857 ?auto_223860 ) ) ( not ( = ?auto_223858 ?auto_223859 ) ) ( not ( = ?auto_223858 ?auto_223860 ) ) ( not ( = ?auto_223859 ?auto_223860 ) ) ( ON ?auto_223858 ?auto_223859 ) ( ON ?auto_223857 ?auto_223858 ) ( CLEAR ?auto_223855 ) ( ON ?auto_223856 ?auto_223857 ) ( CLEAR ?auto_223856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_223851 ?auto_223852 ?auto_223853 ?auto_223854 ?auto_223855 ?auto_223856 )
      ( MAKE-9PILE ?auto_223851 ?auto_223852 ?auto_223853 ?auto_223854 ?auto_223855 ?auto_223856 ?auto_223857 ?auto_223858 ?auto_223859 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223889 - BLOCK
      ?auto_223890 - BLOCK
      ?auto_223891 - BLOCK
      ?auto_223892 - BLOCK
      ?auto_223893 - BLOCK
      ?auto_223894 - BLOCK
      ?auto_223895 - BLOCK
      ?auto_223896 - BLOCK
      ?auto_223897 - BLOCK
    )
    :vars
    (
      ?auto_223898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223897 ?auto_223898 ) ( ON-TABLE ?auto_223889 ) ( ON ?auto_223890 ?auto_223889 ) ( ON ?auto_223891 ?auto_223890 ) ( ON ?auto_223892 ?auto_223891 ) ( not ( = ?auto_223889 ?auto_223890 ) ) ( not ( = ?auto_223889 ?auto_223891 ) ) ( not ( = ?auto_223889 ?auto_223892 ) ) ( not ( = ?auto_223889 ?auto_223893 ) ) ( not ( = ?auto_223889 ?auto_223894 ) ) ( not ( = ?auto_223889 ?auto_223895 ) ) ( not ( = ?auto_223889 ?auto_223896 ) ) ( not ( = ?auto_223889 ?auto_223897 ) ) ( not ( = ?auto_223889 ?auto_223898 ) ) ( not ( = ?auto_223890 ?auto_223891 ) ) ( not ( = ?auto_223890 ?auto_223892 ) ) ( not ( = ?auto_223890 ?auto_223893 ) ) ( not ( = ?auto_223890 ?auto_223894 ) ) ( not ( = ?auto_223890 ?auto_223895 ) ) ( not ( = ?auto_223890 ?auto_223896 ) ) ( not ( = ?auto_223890 ?auto_223897 ) ) ( not ( = ?auto_223890 ?auto_223898 ) ) ( not ( = ?auto_223891 ?auto_223892 ) ) ( not ( = ?auto_223891 ?auto_223893 ) ) ( not ( = ?auto_223891 ?auto_223894 ) ) ( not ( = ?auto_223891 ?auto_223895 ) ) ( not ( = ?auto_223891 ?auto_223896 ) ) ( not ( = ?auto_223891 ?auto_223897 ) ) ( not ( = ?auto_223891 ?auto_223898 ) ) ( not ( = ?auto_223892 ?auto_223893 ) ) ( not ( = ?auto_223892 ?auto_223894 ) ) ( not ( = ?auto_223892 ?auto_223895 ) ) ( not ( = ?auto_223892 ?auto_223896 ) ) ( not ( = ?auto_223892 ?auto_223897 ) ) ( not ( = ?auto_223892 ?auto_223898 ) ) ( not ( = ?auto_223893 ?auto_223894 ) ) ( not ( = ?auto_223893 ?auto_223895 ) ) ( not ( = ?auto_223893 ?auto_223896 ) ) ( not ( = ?auto_223893 ?auto_223897 ) ) ( not ( = ?auto_223893 ?auto_223898 ) ) ( not ( = ?auto_223894 ?auto_223895 ) ) ( not ( = ?auto_223894 ?auto_223896 ) ) ( not ( = ?auto_223894 ?auto_223897 ) ) ( not ( = ?auto_223894 ?auto_223898 ) ) ( not ( = ?auto_223895 ?auto_223896 ) ) ( not ( = ?auto_223895 ?auto_223897 ) ) ( not ( = ?auto_223895 ?auto_223898 ) ) ( not ( = ?auto_223896 ?auto_223897 ) ) ( not ( = ?auto_223896 ?auto_223898 ) ) ( not ( = ?auto_223897 ?auto_223898 ) ) ( ON ?auto_223896 ?auto_223897 ) ( ON ?auto_223895 ?auto_223896 ) ( ON ?auto_223894 ?auto_223895 ) ( CLEAR ?auto_223892 ) ( ON ?auto_223893 ?auto_223894 ) ( CLEAR ?auto_223893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_223889 ?auto_223890 ?auto_223891 ?auto_223892 ?auto_223893 )
      ( MAKE-9PILE ?auto_223889 ?auto_223890 ?auto_223891 ?auto_223892 ?auto_223893 ?auto_223894 ?auto_223895 ?auto_223896 ?auto_223897 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223927 - BLOCK
      ?auto_223928 - BLOCK
      ?auto_223929 - BLOCK
      ?auto_223930 - BLOCK
      ?auto_223931 - BLOCK
      ?auto_223932 - BLOCK
      ?auto_223933 - BLOCK
      ?auto_223934 - BLOCK
      ?auto_223935 - BLOCK
    )
    :vars
    (
      ?auto_223936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223935 ?auto_223936 ) ( ON-TABLE ?auto_223927 ) ( ON ?auto_223928 ?auto_223927 ) ( ON ?auto_223929 ?auto_223928 ) ( not ( = ?auto_223927 ?auto_223928 ) ) ( not ( = ?auto_223927 ?auto_223929 ) ) ( not ( = ?auto_223927 ?auto_223930 ) ) ( not ( = ?auto_223927 ?auto_223931 ) ) ( not ( = ?auto_223927 ?auto_223932 ) ) ( not ( = ?auto_223927 ?auto_223933 ) ) ( not ( = ?auto_223927 ?auto_223934 ) ) ( not ( = ?auto_223927 ?auto_223935 ) ) ( not ( = ?auto_223927 ?auto_223936 ) ) ( not ( = ?auto_223928 ?auto_223929 ) ) ( not ( = ?auto_223928 ?auto_223930 ) ) ( not ( = ?auto_223928 ?auto_223931 ) ) ( not ( = ?auto_223928 ?auto_223932 ) ) ( not ( = ?auto_223928 ?auto_223933 ) ) ( not ( = ?auto_223928 ?auto_223934 ) ) ( not ( = ?auto_223928 ?auto_223935 ) ) ( not ( = ?auto_223928 ?auto_223936 ) ) ( not ( = ?auto_223929 ?auto_223930 ) ) ( not ( = ?auto_223929 ?auto_223931 ) ) ( not ( = ?auto_223929 ?auto_223932 ) ) ( not ( = ?auto_223929 ?auto_223933 ) ) ( not ( = ?auto_223929 ?auto_223934 ) ) ( not ( = ?auto_223929 ?auto_223935 ) ) ( not ( = ?auto_223929 ?auto_223936 ) ) ( not ( = ?auto_223930 ?auto_223931 ) ) ( not ( = ?auto_223930 ?auto_223932 ) ) ( not ( = ?auto_223930 ?auto_223933 ) ) ( not ( = ?auto_223930 ?auto_223934 ) ) ( not ( = ?auto_223930 ?auto_223935 ) ) ( not ( = ?auto_223930 ?auto_223936 ) ) ( not ( = ?auto_223931 ?auto_223932 ) ) ( not ( = ?auto_223931 ?auto_223933 ) ) ( not ( = ?auto_223931 ?auto_223934 ) ) ( not ( = ?auto_223931 ?auto_223935 ) ) ( not ( = ?auto_223931 ?auto_223936 ) ) ( not ( = ?auto_223932 ?auto_223933 ) ) ( not ( = ?auto_223932 ?auto_223934 ) ) ( not ( = ?auto_223932 ?auto_223935 ) ) ( not ( = ?auto_223932 ?auto_223936 ) ) ( not ( = ?auto_223933 ?auto_223934 ) ) ( not ( = ?auto_223933 ?auto_223935 ) ) ( not ( = ?auto_223933 ?auto_223936 ) ) ( not ( = ?auto_223934 ?auto_223935 ) ) ( not ( = ?auto_223934 ?auto_223936 ) ) ( not ( = ?auto_223935 ?auto_223936 ) ) ( ON ?auto_223934 ?auto_223935 ) ( ON ?auto_223933 ?auto_223934 ) ( ON ?auto_223932 ?auto_223933 ) ( ON ?auto_223931 ?auto_223932 ) ( CLEAR ?auto_223929 ) ( ON ?auto_223930 ?auto_223931 ) ( CLEAR ?auto_223930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_223927 ?auto_223928 ?auto_223929 ?auto_223930 )
      ( MAKE-9PILE ?auto_223927 ?auto_223928 ?auto_223929 ?auto_223930 ?auto_223931 ?auto_223932 ?auto_223933 ?auto_223934 ?auto_223935 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_223965 - BLOCK
      ?auto_223966 - BLOCK
      ?auto_223967 - BLOCK
      ?auto_223968 - BLOCK
      ?auto_223969 - BLOCK
      ?auto_223970 - BLOCK
      ?auto_223971 - BLOCK
      ?auto_223972 - BLOCK
      ?auto_223973 - BLOCK
    )
    :vars
    (
      ?auto_223974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_223973 ?auto_223974 ) ( ON-TABLE ?auto_223965 ) ( ON ?auto_223966 ?auto_223965 ) ( not ( = ?auto_223965 ?auto_223966 ) ) ( not ( = ?auto_223965 ?auto_223967 ) ) ( not ( = ?auto_223965 ?auto_223968 ) ) ( not ( = ?auto_223965 ?auto_223969 ) ) ( not ( = ?auto_223965 ?auto_223970 ) ) ( not ( = ?auto_223965 ?auto_223971 ) ) ( not ( = ?auto_223965 ?auto_223972 ) ) ( not ( = ?auto_223965 ?auto_223973 ) ) ( not ( = ?auto_223965 ?auto_223974 ) ) ( not ( = ?auto_223966 ?auto_223967 ) ) ( not ( = ?auto_223966 ?auto_223968 ) ) ( not ( = ?auto_223966 ?auto_223969 ) ) ( not ( = ?auto_223966 ?auto_223970 ) ) ( not ( = ?auto_223966 ?auto_223971 ) ) ( not ( = ?auto_223966 ?auto_223972 ) ) ( not ( = ?auto_223966 ?auto_223973 ) ) ( not ( = ?auto_223966 ?auto_223974 ) ) ( not ( = ?auto_223967 ?auto_223968 ) ) ( not ( = ?auto_223967 ?auto_223969 ) ) ( not ( = ?auto_223967 ?auto_223970 ) ) ( not ( = ?auto_223967 ?auto_223971 ) ) ( not ( = ?auto_223967 ?auto_223972 ) ) ( not ( = ?auto_223967 ?auto_223973 ) ) ( not ( = ?auto_223967 ?auto_223974 ) ) ( not ( = ?auto_223968 ?auto_223969 ) ) ( not ( = ?auto_223968 ?auto_223970 ) ) ( not ( = ?auto_223968 ?auto_223971 ) ) ( not ( = ?auto_223968 ?auto_223972 ) ) ( not ( = ?auto_223968 ?auto_223973 ) ) ( not ( = ?auto_223968 ?auto_223974 ) ) ( not ( = ?auto_223969 ?auto_223970 ) ) ( not ( = ?auto_223969 ?auto_223971 ) ) ( not ( = ?auto_223969 ?auto_223972 ) ) ( not ( = ?auto_223969 ?auto_223973 ) ) ( not ( = ?auto_223969 ?auto_223974 ) ) ( not ( = ?auto_223970 ?auto_223971 ) ) ( not ( = ?auto_223970 ?auto_223972 ) ) ( not ( = ?auto_223970 ?auto_223973 ) ) ( not ( = ?auto_223970 ?auto_223974 ) ) ( not ( = ?auto_223971 ?auto_223972 ) ) ( not ( = ?auto_223971 ?auto_223973 ) ) ( not ( = ?auto_223971 ?auto_223974 ) ) ( not ( = ?auto_223972 ?auto_223973 ) ) ( not ( = ?auto_223972 ?auto_223974 ) ) ( not ( = ?auto_223973 ?auto_223974 ) ) ( ON ?auto_223972 ?auto_223973 ) ( ON ?auto_223971 ?auto_223972 ) ( ON ?auto_223970 ?auto_223971 ) ( ON ?auto_223969 ?auto_223970 ) ( ON ?auto_223968 ?auto_223969 ) ( CLEAR ?auto_223966 ) ( ON ?auto_223967 ?auto_223968 ) ( CLEAR ?auto_223967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_223965 ?auto_223966 ?auto_223967 )
      ( MAKE-9PILE ?auto_223965 ?auto_223966 ?auto_223967 ?auto_223968 ?auto_223969 ?auto_223970 ?auto_223971 ?auto_223972 ?auto_223973 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_224003 - BLOCK
      ?auto_224004 - BLOCK
      ?auto_224005 - BLOCK
      ?auto_224006 - BLOCK
      ?auto_224007 - BLOCK
      ?auto_224008 - BLOCK
      ?auto_224009 - BLOCK
      ?auto_224010 - BLOCK
      ?auto_224011 - BLOCK
    )
    :vars
    (
      ?auto_224012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224011 ?auto_224012 ) ( ON-TABLE ?auto_224003 ) ( not ( = ?auto_224003 ?auto_224004 ) ) ( not ( = ?auto_224003 ?auto_224005 ) ) ( not ( = ?auto_224003 ?auto_224006 ) ) ( not ( = ?auto_224003 ?auto_224007 ) ) ( not ( = ?auto_224003 ?auto_224008 ) ) ( not ( = ?auto_224003 ?auto_224009 ) ) ( not ( = ?auto_224003 ?auto_224010 ) ) ( not ( = ?auto_224003 ?auto_224011 ) ) ( not ( = ?auto_224003 ?auto_224012 ) ) ( not ( = ?auto_224004 ?auto_224005 ) ) ( not ( = ?auto_224004 ?auto_224006 ) ) ( not ( = ?auto_224004 ?auto_224007 ) ) ( not ( = ?auto_224004 ?auto_224008 ) ) ( not ( = ?auto_224004 ?auto_224009 ) ) ( not ( = ?auto_224004 ?auto_224010 ) ) ( not ( = ?auto_224004 ?auto_224011 ) ) ( not ( = ?auto_224004 ?auto_224012 ) ) ( not ( = ?auto_224005 ?auto_224006 ) ) ( not ( = ?auto_224005 ?auto_224007 ) ) ( not ( = ?auto_224005 ?auto_224008 ) ) ( not ( = ?auto_224005 ?auto_224009 ) ) ( not ( = ?auto_224005 ?auto_224010 ) ) ( not ( = ?auto_224005 ?auto_224011 ) ) ( not ( = ?auto_224005 ?auto_224012 ) ) ( not ( = ?auto_224006 ?auto_224007 ) ) ( not ( = ?auto_224006 ?auto_224008 ) ) ( not ( = ?auto_224006 ?auto_224009 ) ) ( not ( = ?auto_224006 ?auto_224010 ) ) ( not ( = ?auto_224006 ?auto_224011 ) ) ( not ( = ?auto_224006 ?auto_224012 ) ) ( not ( = ?auto_224007 ?auto_224008 ) ) ( not ( = ?auto_224007 ?auto_224009 ) ) ( not ( = ?auto_224007 ?auto_224010 ) ) ( not ( = ?auto_224007 ?auto_224011 ) ) ( not ( = ?auto_224007 ?auto_224012 ) ) ( not ( = ?auto_224008 ?auto_224009 ) ) ( not ( = ?auto_224008 ?auto_224010 ) ) ( not ( = ?auto_224008 ?auto_224011 ) ) ( not ( = ?auto_224008 ?auto_224012 ) ) ( not ( = ?auto_224009 ?auto_224010 ) ) ( not ( = ?auto_224009 ?auto_224011 ) ) ( not ( = ?auto_224009 ?auto_224012 ) ) ( not ( = ?auto_224010 ?auto_224011 ) ) ( not ( = ?auto_224010 ?auto_224012 ) ) ( not ( = ?auto_224011 ?auto_224012 ) ) ( ON ?auto_224010 ?auto_224011 ) ( ON ?auto_224009 ?auto_224010 ) ( ON ?auto_224008 ?auto_224009 ) ( ON ?auto_224007 ?auto_224008 ) ( ON ?auto_224006 ?auto_224007 ) ( ON ?auto_224005 ?auto_224006 ) ( CLEAR ?auto_224003 ) ( ON ?auto_224004 ?auto_224005 ) ( CLEAR ?auto_224004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_224003 ?auto_224004 )
      ( MAKE-9PILE ?auto_224003 ?auto_224004 ?auto_224005 ?auto_224006 ?auto_224007 ?auto_224008 ?auto_224009 ?auto_224010 ?auto_224011 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_224041 - BLOCK
      ?auto_224042 - BLOCK
      ?auto_224043 - BLOCK
      ?auto_224044 - BLOCK
      ?auto_224045 - BLOCK
      ?auto_224046 - BLOCK
      ?auto_224047 - BLOCK
      ?auto_224048 - BLOCK
      ?auto_224049 - BLOCK
    )
    :vars
    (
      ?auto_224050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224049 ?auto_224050 ) ( not ( = ?auto_224041 ?auto_224042 ) ) ( not ( = ?auto_224041 ?auto_224043 ) ) ( not ( = ?auto_224041 ?auto_224044 ) ) ( not ( = ?auto_224041 ?auto_224045 ) ) ( not ( = ?auto_224041 ?auto_224046 ) ) ( not ( = ?auto_224041 ?auto_224047 ) ) ( not ( = ?auto_224041 ?auto_224048 ) ) ( not ( = ?auto_224041 ?auto_224049 ) ) ( not ( = ?auto_224041 ?auto_224050 ) ) ( not ( = ?auto_224042 ?auto_224043 ) ) ( not ( = ?auto_224042 ?auto_224044 ) ) ( not ( = ?auto_224042 ?auto_224045 ) ) ( not ( = ?auto_224042 ?auto_224046 ) ) ( not ( = ?auto_224042 ?auto_224047 ) ) ( not ( = ?auto_224042 ?auto_224048 ) ) ( not ( = ?auto_224042 ?auto_224049 ) ) ( not ( = ?auto_224042 ?auto_224050 ) ) ( not ( = ?auto_224043 ?auto_224044 ) ) ( not ( = ?auto_224043 ?auto_224045 ) ) ( not ( = ?auto_224043 ?auto_224046 ) ) ( not ( = ?auto_224043 ?auto_224047 ) ) ( not ( = ?auto_224043 ?auto_224048 ) ) ( not ( = ?auto_224043 ?auto_224049 ) ) ( not ( = ?auto_224043 ?auto_224050 ) ) ( not ( = ?auto_224044 ?auto_224045 ) ) ( not ( = ?auto_224044 ?auto_224046 ) ) ( not ( = ?auto_224044 ?auto_224047 ) ) ( not ( = ?auto_224044 ?auto_224048 ) ) ( not ( = ?auto_224044 ?auto_224049 ) ) ( not ( = ?auto_224044 ?auto_224050 ) ) ( not ( = ?auto_224045 ?auto_224046 ) ) ( not ( = ?auto_224045 ?auto_224047 ) ) ( not ( = ?auto_224045 ?auto_224048 ) ) ( not ( = ?auto_224045 ?auto_224049 ) ) ( not ( = ?auto_224045 ?auto_224050 ) ) ( not ( = ?auto_224046 ?auto_224047 ) ) ( not ( = ?auto_224046 ?auto_224048 ) ) ( not ( = ?auto_224046 ?auto_224049 ) ) ( not ( = ?auto_224046 ?auto_224050 ) ) ( not ( = ?auto_224047 ?auto_224048 ) ) ( not ( = ?auto_224047 ?auto_224049 ) ) ( not ( = ?auto_224047 ?auto_224050 ) ) ( not ( = ?auto_224048 ?auto_224049 ) ) ( not ( = ?auto_224048 ?auto_224050 ) ) ( not ( = ?auto_224049 ?auto_224050 ) ) ( ON ?auto_224048 ?auto_224049 ) ( ON ?auto_224047 ?auto_224048 ) ( ON ?auto_224046 ?auto_224047 ) ( ON ?auto_224045 ?auto_224046 ) ( ON ?auto_224044 ?auto_224045 ) ( ON ?auto_224043 ?auto_224044 ) ( ON ?auto_224042 ?auto_224043 ) ( ON ?auto_224041 ?auto_224042 ) ( CLEAR ?auto_224041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_224041 )
      ( MAKE-9PILE ?auto_224041 ?auto_224042 ?auto_224043 ?auto_224044 ?auto_224045 ?auto_224046 ?auto_224047 ?auto_224048 ?auto_224049 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224080 - BLOCK
      ?auto_224081 - BLOCK
      ?auto_224082 - BLOCK
      ?auto_224083 - BLOCK
      ?auto_224084 - BLOCK
      ?auto_224085 - BLOCK
      ?auto_224086 - BLOCK
      ?auto_224087 - BLOCK
      ?auto_224088 - BLOCK
      ?auto_224089 - BLOCK
    )
    :vars
    (
      ?auto_224090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_224088 ) ( ON ?auto_224089 ?auto_224090 ) ( CLEAR ?auto_224089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_224080 ) ( ON ?auto_224081 ?auto_224080 ) ( ON ?auto_224082 ?auto_224081 ) ( ON ?auto_224083 ?auto_224082 ) ( ON ?auto_224084 ?auto_224083 ) ( ON ?auto_224085 ?auto_224084 ) ( ON ?auto_224086 ?auto_224085 ) ( ON ?auto_224087 ?auto_224086 ) ( ON ?auto_224088 ?auto_224087 ) ( not ( = ?auto_224080 ?auto_224081 ) ) ( not ( = ?auto_224080 ?auto_224082 ) ) ( not ( = ?auto_224080 ?auto_224083 ) ) ( not ( = ?auto_224080 ?auto_224084 ) ) ( not ( = ?auto_224080 ?auto_224085 ) ) ( not ( = ?auto_224080 ?auto_224086 ) ) ( not ( = ?auto_224080 ?auto_224087 ) ) ( not ( = ?auto_224080 ?auto_224088 ) ) ( not ( = ?auto_224080 ?auto_224089 ) ) ( not ( = ?auto_224080 ?auto_224090 ) ) ( not ( = ?auto_224081 ?auto_224082 ) ) ( not ( = ?auto_224081 ?auto_224083 ) ) ( not ( = ?auto_224081 ?auto_224084 ) ) ( not ( = ?auto_224081 ?auto_224085 ) ) ( not ( = ?auto_224081 ?auto_224086 ) ) ( not ( = ?auto_224081 ?auto_224087 ) ) ( not ( = ?auto_224081 ?auto_224088 ) ) ( not ( = ?auto_224081 ?auto_224089 ) ) ( not ( = ?auto_224081 ?auto_224090 ) ) ( not ( = ?auto_224082 ?auto_224083 ) ) ( not ( = ?auto_224082 ?auto_224084 ) ) ( not ( = ?auto_224082 ?auto_224085 ) ) ( not ( = ?auto_224082 ?auto_224086 ) ) ( not ( = ?auto_224082 ?auto_224087 ) ) ( not ( = ?auto_224082 ?auto_224088 ) ) ( not ( = ?auto_224082 ?auto_224089 ) ) ( not ( = ?auto_224082 ?auto_224090 ) ) ( not ( = ?auto_224083 ?auto_224084 ) ) ( not ( = ?auto_224083 ?auto_224085 ) ) ( not ( = ?auto_224083 ?auto_224086 ) ) ( not ( = ?auto_224083 ?auto_224087 ) ) ( not ( = ?auto_224083 ?auto_224088 ) ) ( not ( = ?auto_224083 ?auto_224089 ) ) ( not ( = ?auto_224083 ?auto_224090 ) ) ( not ( = ?auto_224084 ?auto_224085 ) ) ( not ( = ?auto_224084 ?auto_224086 ) ) ( not ( = ?auto_224084 ?auto_224087 ) ) ( not ( = ?auto_224084 ?auto_224088 ) ) ( not ( = ?auto_224084 ?auto_224089 ) ) ( not ( = ?auto_224084 ?auto_224090 ) ) ( not ( = ?auto_224085 ?auto_224086 ) ) ( not ( = ?auto_224085 ?auto_224087 ) ) ( not ( = ?auto_224085 ?auto_224088 ) ) ( not ( = ?auto_224085 ?auto_224089 ) ) ( not ( = ?auto_224085 ?auto_224090 ) ) ( not ( = ?auto_224086 ?auto_224087 ) ) ( not ( = ?auto_224086 ?auto_224088 ) ) ( not ( = ?auto_224086 ?auto_224089 ) ) ( not ( = ?auto_224086 ?auto_224090 ) ) ( not ( = ?auto_224087 ?auto_224088 ) ) ( not ( = ?auto_224087 ?auto_224089 ) ) ( not ( = ?auto_224087 ?auto_224090 ) ) ( not ( = ?auto_224088 ?auto_224089 ) ) ( not ( = ?auto_224088 ?auto_224090 ) ) ( not ( = ?auto_224089 ?auto_224090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_224089 ?auto_224090 )
      ( !STACK ?auto_224089 ?auto_224088 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224122 - BLOCK
      ?auto_224123 - BLOCK
      ?auto_224124 - BLOCK
      ?auto_224125 - BLOCK
      ?auto_224126 - BLOCK
      ?auto_224127 - BLOCK
      ?auto_224128 - BLOCK
      ?auto_224129 - BLOCK
      ?auto_224130 - BLOCK
      ?auto_224131 - BLOCK
    )
    :vars
    (
      ?auto_224132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224131 ?auto_224132 ) ( ON-TABLE ?auto_224122 ) ( ON ?auto_224123 ?auto_224122 ) ( ON ?auto_224124 ?auto_224123 ) ( ON ?auto_224125 ?auto_224124 ) ( ON ?auto_224126 ?auto_224125 ) ( ON ?auto_224127 ?auto_224126 ) ( ON ?auto_224128 ?auto_224127 ) ( ON ?auto_224129 ?auto_224128 ) ( not ( = ?auto_224122 ?auto_224123 ) ) ( not ( = ?auto_224122 ?auto_224124 ) ) ( not ( = ?auto_224122 ?auto_224125 ) ) ( not ( = ?auto_224122 ?auto_224126 ) ) ( not ( = ?auto_224122 ?auto_224127 ) ) ( not ( = ?auto_224122 ?auto_224128 ) ) ( not ( = ?auto_224122 ?auto_224129 ) ) ( not ( = ?auto_224122 ?auto_224130 ) ) ( not ( = ?auto_224122 ?auto_224131 ) ) ( not ( = ?auto_224122 ?auto_224132 ) ) ( not ( = ?auto_224123 ?auto_224124 ) ) ( not ( = ?auto_224123 ?auto_224125 ) ) ( not ( = ?auto_224123 ?auto_224126 ) ) ( not ( = ?auto_224123 ?auto_224127 ) ) ( not ( = ?auto_224123 ?auto_224128 ) ) ( not ( = ?auto_224123 ?auto_224129 ) ) ( not ( = ?auto_224123 ?auto_224130 ) ) ( not ( = ?auto_224123 ?auto_224131 ) ) ( not ( = ?auto_224123 ?auto_224132 ) ) ( not ( = ?auto_224124 ?auto_224125 ) ) ( not ( = ?auto_224124 ?auto_224126 ) ) ( not ( = ?auto_224124 ?auto_224127 ) ) ( not ( = ?auto_224124 ?auto_224128 ) ) ( not ( = ?auto_224124 ?auto_224129 ) ) ( not ( = ?auto_224124 ?auto_224130 ) ) ( not ( = ?auto_224124 ?auto_224131 ) ) ( not ( = ?auto_224124 ?auto_224132 ) ) ( not ( = ?auto_224125 ?auto_224126 ) ) ( not ( = ?auto_224125 ?auto_224127 ) ) ( not ( = ?auto_224125 ?auto_224128 ) ) ( not ( = ?auto_224125 ?auto_224129 ) ) ( not ( = ?auto_224125 ?auto_224130 ) ) ( not ( = ?auto_224125 ?auto_224131 ) ) ( not ( = ?auto_224125 ?auto_224132 ) ) ( not ( = ?auto_224126 ?auto_224127 ) ) ( not ( = ?auto_224126 ?auto_224128 ) ) ( not ( = ?auto_224126 ?auto_224129 ) ) ( not ( = ?auto_224126 ?auto_224130 ) ) ( not ( = ?auto_224126 ?auto_224131 ) ) ( not ( = ?auto_224126 ?auto_224132 ) ) ( not ( = ?auto_224127 ?auto_224128 ) ) ( not ( = ?auto_224127 ?auto_224129 ) ) ( not ( = ?auto_224127 ?auto_224130 ) ) ( not ( = ?auto_224127 ?auto_224131 ) ) ( not ( = ?auto_224127 ?auto_224132 ) ) ( not ( = ?auto_224128 ?auto_224129 ) ) ( not ( = ?auto_224128 ?auto_224130 ) ) ( not ( = ?auto_224128 ?auto_224131 ) ) ( not ( = ?auto_224128 ?auto_224132 ) ) ( not ( = ?auto_224129 ?auto_224130 ) ) ( not ( = ?auto_224129 ?auto_224131 ) ) ( not ( = ?auto_224129 ?auto_224132 ) ) ( not ( = ?auto_224130 ?auto_224131 ) ) ( not ( = ?auto_224130 ?auto_224132 ) ) ( not ( = ?auto_224131 ?auto_224132 ) ) ( CLEAR ?auto_224129 ) ( ON ?auto_224130 ?auto_224131 ) ( CLEAR ?auto_224130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_224122 ?auto_224123 ?auto_224124 ?auto_224125 ?auto_224126 ?auto_224127 ?auto_224128 ?auto_224129 ?auto_224130 )
      ( MAKE-10PILE ?auto_224122 ?auto_224123 ?auto_224124 ?auto_224125 ?auto_224126 ?auto_224127 ?auto_224128 ?auto_224129 ?auto_224130 ?auto_224131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224164 - BLOCK
      ?auto_224165 - BLOCK
      ?auto_224166 - BLOCK
      ?auto_224167 - BLOCK
      ?auto_224168 - BLOCK
      ?auto_224169 - BLOCK
      ?auto_224170 - BLOCK
      ?auto_224171 - BLOCK
      ?auto_224172 - BLOCK
      ?auto_224173 - BLOCK
    )
    :vars
    (
      ?auto_224174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224173 ?auto_224174 ) ( ON-TABLE ?auto_224164 ) ( ON ?auto_224165 ?auto_224164 ) ( ON ?auto_224166 ?auto_224165 ) ( ON ?auto_224167 ?auto_224166 ) ( ON ?auto_224168 ?auto_224167 ) ( ON ?auto_224169 ?auto_224168 ) ( ON ?auto_224170 ?auto_224169 ) ( not ( = ?auto_224164 ?auto_224165 ) ) ( not ( = ?auto_224164 ?auto_224166 ) ) ( not ( = ?auto_224164 ?auto_224167 ) ) ( not ( = ?auto_224164 ?auto_224168 ) ) ( not ( = ?auto_224164 ?auto_224169 ) ) ( not ( = ?auto_224164 ?auto_224170 ) ) ( not ( = ?auto_224164 ?auto_224171 ) ) ( not ( = ?auto_224164 ?auto_224172 ) ) ( not ( = ?auto_224164 ?auto_224173 ) ) ( not ( = ?auto_224164 ?auto_224174 ) ) ( not ( = ?auto_224165 ?auto_224166 ) ) ( not ( = ?auto_224165 ?auto_224167 ) ) ( not ( = ?auto_224165 ?auto_224168 ) ) ( not ( = ?auto_224165 ?auto_224169 ) ) ( not ( = ?auto_224165 ?auto_224170 ) ) ( not ( = ?auto_224165 ?auto_224171 ) ) ( not ( = ?auto_224165 ?auto_224172 ) ) ( not ( = ?auto_224165 ?auto_224173 ) ) ( not ( = ?auto_224165 ?auto_224174 ) ) ( not ( = ?auto_224166 ?auto_224167 ) ) ( not ( = ?auto_224166 ?auto_224168 ) ) ( not ( = ?auto_224166 ?auto_224169 ) ) ( not ( = ?auto_224166 ?auto_224170 ) ) ( not ( = ?auto_224166 ?auto_224171 ) ) ( not ( = ?auto_224166 ?auto_224172 ) ) ( not ( = ?auto_224166 ?auto_224173 ) ) ( not ( = ?auto_224166 ?auto_224174 ) ) ( not ( = ?auto_224167 ?auto_224168 ) ) ( not ( = ?auto_224167 ?auto_224169 ) ) ( not ( = ?auto_224167 ?auto_224170 ) ) ( not ( = ?auto_224167 ?auto_224171 ) ) ( not ( = ?auto_224167 ?auto_224172 ) ) ( not ( = ?auto_224167 ?auto_224173 ) ) ( not ( = ?auto_224167 ?auto_224174 ) ) ( not ( = ?auto_224168 ?auto_224169 ) ) ( not ( = ?auto_224168 ?auto_224170 ) ) ( not ( = ?auto_224168 ?auto_224171 ) ) ( not ( = ?auto_224168 ?auto_224172 ) ) ( not ( = ?auto_224168 ?auto_224173 ) ) ( not ( = ?auto_224168 ?auto_224174 ) ) ( not ( = ?auto_224169 ?auto_224170 ) ) ( not ( = ?auto_224169 ?auto_224171 ) ) ( not ( = ?auto_224169 ?auto_224172 ) ) ( not ( = ?auto_224169 ?auto_224173 ) ) ( not ( = ?auto_224169 ?auto_224174 ) ) ( not ( = ?auto_224170 ?auto_224171 ) ) ( not ( = ?auto_224170 ?auto_224172 ) ) ( not ( = ?auto_224170 ?auto_224173 ) ) ( not ( = ?auto_224170 ?auto_224174 ) ) ( not ( = ?auto_224171 ?auto_224172 ) ) ( not ( = ?auto_224171 ?auto_224173 ) ) ( not ( = ?auto_224171 ?auto_224174 ) ) ( not ( = ?auto_224172 ?auto_224173 ) ) ( not ( = ?auto_224172 ?auto_224174 ) ) ( not ( = ?auto_224173 ?auto_224174 ) ) ( ON ?auto_224172 ?auto_224173 ) ( CLEAR ?auto_224170 ) ( ON ?auto_224171 ?auto_224172 ) ( CLEAR ?auto_224171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_224164 ?auto_224165 ?auto_224166 ?auto_224167 ?auto_224168 ?auto_224169 ?auto_224170 ?auto_224171 )
      ( MAKE-10PILE ?auto_224164 ?auto_224165 ?auto_224166 ?auto_224167 ?auto_224168 ?auto_224169 ?auto_224170 ?auto_224171 ?auto_224172 ?auto_224173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224206 - BLOCK
      ?auto_224207 - BLOCK
      ?auto_224208 - BLOCK
      ?auto_224209 - BLOCK
      ?auto_224210 - BLOCK
      ?auto_224211 - BLOCK
      ?auto_224212 - BLOCK
      ?auto_224213 - BLOCK
      ?auto_224214 - BLOCK
      ?auto_224215 - BLOCK
    )
    :vars
    (
      ?auto_224216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224215 ?auto_224216 ) ( ON-TABLE ?auto_224206 ) ( ON ?auto_224207 ?auto_224206 ) ( ON ?auto_224208 ?auto_224207 ) ( ON ?auto_224209 ?auto_224208 ) ( ON ?auto_224210 ?auto_224209 ) ( ON ?auto_224211 ?auto_224210 ) ( not ( = ?auto_224206 ?auto_224207 ) ) ( not ( = ?auto_224206 ?auto_224208 ) ) ( not ( = ?auto_224206 ?auto_224209 ) ) ( not ( = ?auto_224206 ?auto_224210 ) ) ( not ( = ?auto_224206 ?auto_224211 ) ) ( not ( = ?auto_224206 ?auto_224212 ) ) ( not ( = ?auto_224206 ?auto_224213 ) ) ( not ( = ?auto_224206 ?auto_224214 ) ) ( not ( = ?auto_224206 ?auto_224215 ) ) ( not ( = ?auto_224206 ?auto_224216 ) ) ( not ( = ?auto_224207 ?auto_224208 ) ) ( not ( = ?auto_224207 ?auto_224209 ) ) ( not ( = ?auto_224207 ?auto_224210 ) ) ( not ( = ?auto_224207 ?auto_224211 ) ) ( not ( = ?auto_224207 ?auto_224212 ) ) ( not ( = ?auto_224207 ?auto_224213 ) ) ( not ( = ?auto_224207 ?auto_224214 ) ) ( not ( = ?auto_224207 ?auto_224215 ) ) ( not ( = ?auto_224207 ?auto_224216 ) ) ( not ( = ?auto_224208 ?auto_224209 ) ) ( not ( = ?auto_224208 ?auto_224210 ) ) ( not ( = ?auto_224208 ?auto_224211 ) ) ( not ( = ?auto_224208 ?auto_224212 ) ) ( not ( = ?auto_224208 ?auto_224213 ) ) ( not ( = ?auto_224208 ?auto_224214 ) ) ( not ( = ?auto_224208 ?auto_224215 ) ) ( not ( = ?auto_224208 ?auto_224216 ) ) ( not ( = ?auto_224209 ?auto_224210 ) ) ( not ( = ?auto_224209 ?auto_224211 ) ) ( not ( = ?auto_224209 ?auto_224212 ) ) ( not ( = ?auto_224209 ?auto_224213 ) ) ( not ( = ?auto_224209 ?auto_224214 ) ) ( not ( = ?auto_224209 ?auto_224215 ) ) ( not ( = ?auto_224209 ?auto_224216 ) ) ( not ( = ?auto_224210 ?auto_224211 ) ) ( not ( = ?auto_224210 ?auto_224212 ) ) ( not ( = ?auto_224210 ?auto_224213 ) ) ( not ( = ?auto_224210 ?auto_224214 ) ) ( not ( = ?auto_224210 ?auto_224215 ) ) ( not ( = ?auto_224210 ?auto_224216 ) ) ( not ( = ?auto_224211 ?auto_224212 ) ) ( not ( = ?auto_224211 ?auto_224213 ) ) ( not ( = ?auto_224211 ?auto_224214 ) ) ( not ( = ?auto_224211 ?auto_224215 ) ) ( not ( = ?auto_224211 ?auto_224216 ) ) ( not ( = ?auto_224212 ?auto_224213 ) ) ( not ( = ?auto_224212 ?auto_224214 ) ) ( not ( = ?auto_224212 ?auto_224215 ) ) ( not ( = ?auto_224212 ?auto_224216 ) ) ( not ( = ?auto_224213 ?auto_224214 ) ) ( not ( = ?auto_224213 ?auto_224215 ) ) ( not ( = ?auto_224213 ?auto_224216 ) ) ( not ( = ?auto_224214 ?auto_224215 ) ) ( not ( = ?auto_224214 ?auto_224216 ) ) ( not ( = ?auto_224215 ?auto_224216 ) ) ( ON ?auto_224214 ?auto_224215 ) ( ON ?auto_224213 ?auto_224214 ) ( CLEAR ?auto_224211 ) ( ON ?auto_224212 ?auto_224213 ) ( CLEAR ?auto_224212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_224206 ?auto_224207 ?auto_224208 ?auto_224209 ?auto_224210 ?auto_224211 ?auto_224212 )
      ( MAKE-10PILE ?auto_224206 ?auto_224207 ?auto_224208 ?auto_224209 ?auto_224210 ?auto_224211 ?auto_224212 ?auto_224213 ?auto_224214 ?auto_224215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224248 - BLOCK
      ?auto_224249 - BLOCK
      ?auto_224250 - BLOCK
      ?auto_224251 - BLOCK
      ?auto_224252 - BLOCK
      ?auto_224253 - BLOCK
      ?auto_224254 - BLOCK
      ?auto_224255 - BLOCK
      ?auto_224256 - BLOCK
      ?auto_224257 - BLOCK
    )
    :vars
    (
      ?auto_224258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224257 ?auto_224258 ) ( ON-TABLE ?auto_224248 ) ( ON ?auto_224249 ?auto_224248 ) ( ON ?auto_224250 ?auto_224249 ) ( ON ?auto_224251 ?auto_224250 ) ( ON ?auto_224252 ?auto_224251 ) ( not ( = ?auto_224248 ?auto_224249 ) ) ( not ( = ?auto_224248 ?auto_224250 ) ) ( not ( = ?auto_224248 ?auto_224251 ) ) ( not ( = ?auto_224248 ?auto_224252 ) ) ( not ( = ?auto_224248 ?auto_224253 ) ) ( not ( = ?auto_224248 ?auto_224254 ) ) ( not ( = ?auto_224248 ?auto_224255 ) ) ( not ( = ?auto_224248 ?auto_224256 ) ) ( not ( = ?auto_224248 ?auto_224257 ) ) ( not ( = ?auto_224248 ?auto_224258 ) ) ( not ( = ?auto_224249 ?auto_224250 ) ) ( not ( = ?auto_224249 ?auto_224251 ) ) ( not ( = ?auto_224249 ?auto_224252 ) ) ( not ( = ?auto_224249 ?auto_224253 ) ) ( not ( = ?auto_224249 ?auto_224254 ) ) ( not ( = ?auto_224249 ?auto_224255 ) ) ( not ( = ?auto_224249 ?auto_224256 ) ) ( not ( = ?auto_224249 ?auto_224257 ) ) ( not ( = ?auto_224249 ?auto_224258 ) ) ( not ( = ?auto_224250 ?auto_224251 ) ) ( not ( = ?auto_224250 ?auto_224252 ) ) ( not ( = ?auto_224250 ?auto_224253 ) ) ( not ( = ?auto_224250 ?auto_224254 ) ) ( not ( = ?auto_224250 ?auto_224255 ) ) ( not ( = ?auto_224250 ?auto_224256 ) ) ( not ( = ?auto_224250 ?auto_224257 ) ) ( not ( = ?auto_224250 ?auto_224258 ) ) ( not ( = ?auto_224251 ?auto_224252 ) ) ( not ( = ?auto_224251 ?auto_224253 ) ) ( not ( = ?auto_224251 ?auto_224254 ) ) ( not ( = ?auto_224251 ?auto_224255 ) ) ( not ( = ?auto_224251 ?auto_224256 ) ) ( not ( = ?auto_224251 ?auto_224257 ) ) ( not ( = ?auto_224251 ?auto_224258 ) ) ( not ( = ?auto_224252 ?auto_224253 ) ) ( not ( = ?auto_224252 ?auto_224254 ) ) ( not ( = ?auto_224252 ?auto_224255 ) ) ( not ( = ?auto_224252 ?auto_224256 ) ) ( not ( = ?auto_224252 ?auto_224257 ) ) ( not ( = ?auto_224252 ?auto_224258 ) ) ( not ( = ?auto_224253 ?auto_224254 ) ) ( not ( = ?auto_224253 ?auto_224255 ) ) ( not ( = ?auto_224253 ?auto_224256 ) ) ( not ( = ?auto_224253 ?auto_224257 ) ) ( not ( = ?auto_224253 ?auto_224258 ) ) ( not ( = ?auto_224254 ?auto_224255 ) ) ( not ( = ?auto_224254 ?auto_224256 ) ) ( not ( = ?auto_224254 ?auto_224257 ) ) ( not ( = ?auto_224254 ?auto_224258 ) ) ( not ( = ?auto_224255 ?auto_224256 ) ) ( not ( = ?auto_224255 ?auto_224257 ) ) ( not ( = ?auto_224255 ?auto_224258 ) ) ( not ( = ?auto_224256 ?auto_224257 ) ) ( not ( = ?auto_224256 ?auto_224258 ) ) ( not ( = ?auto_224257 ?auto_224258 ) ) ( ON ?auto_224256 ?auto_224257 ) ( ON ?auto_224255 ?auto_224256 ) ( ON ?auto_224254 ?auto_224255 ) ( CLEAR ?auto_224252 ) ( ON ?auto_224253 ?auto_224254 ) ( CLEAR ?auto_224253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_224248 ?auto_224249 ?auto_224250 ?auto_224251 ?auto_224252 ?auto_224253 )
      ( MAKE-10PILE ?auto_224248 ?auto_224249 ?auto_224250 ?auto_224251 ?auto_224252 ?auto_224253 ?auto_224254 ?auto_224255 ?auto_224256 ?auto_224257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224290 - BLOCK
      ?auto_224291 - BLOCK
      ?auto_224292 - BLOCK
      ?auto_224293 - BLOCK
      ?auto_224294 - BLOCK
      ?auto_224295 - BLOCK
      ?auto_224296 - BLOCK
      ?auto_224297 - BLOCK
      ?auto_224298 - BLOCK
      ?auto_224299 - BLOCK
    )
    :vars
    (
      ?auto_224300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224299 ?auto_224300 ) ( ON-TABLE ?auto_224290 ) ( ON ?auto_224291 ?auto_224290 ) ( ON ?auto_224292 ?auto_224291 ) ( ON ?auto_224293 ?auto_224292 ) ( not ( = ?auto_224290 ?auto_224291 ) ) ( not ( = ?auto_224290 ?auto_224292 ) ) ( not ( = ?auto_224290 ?auto_224293 ) ) ( not ( = ?auto_224290 ?auto_224294 ) ) ( not ( = ?auto_224290 ?auto_224295 ) ) ( not ( = ?auto_224290 ?auto_224296 ) ) ( not ( = ?auto_224290 ?auto_224297 ) ) ( not ( = ?auto_224290 ?auto_224298 ) ) ( not ( = ?auto_224290 ?auto_224299 ) ) ( not ( = ?auto_224290 ?auto_224300 ) ) ( not ( = ?auto_224291 ?auto_224292 ) ) ( not ( = ?auto_224291 ?auto_224293 ) ) ( not ( = ?auto_224291 ?auto_224294 ) ) ( not ( = ?auto_224291 ?auto_224295 ) ) ( not ( = ?auto_224291 ?auto_224296 ) ) ( not ( = ?auto_224291 ?auto_224297 ) ) ( not ( = ?auto_224291 ?auto_224298 ) ) ( not ( = ?auto_224291 ?auto_224299 ) ) ( not ( = ?auto_224291 ?auto_224300 ) ) ( not ( = ?auto_224292 ?auto_224293 ) ) ( not ( = ?auto_224292 ?auto_224294 ) ) ( not ( = ?auto_224292 ?auto_224295 ) ) ( not ( = ?auto_224292 ?auto_224296 ) ) ( not ( = ?auto_224292 ?auto_224297 ) ) ( not ( = ?auto_224292 ?auto_224298 ) ) ( not ( = ?auto_224292 ?auto_224299 ) ) ( not ( = ?auto_224292 ?auto_224300 ) ) ( not ( = ?auto_224293 ?auto_224294 ) ) ( not ( = ?auto_224293 ?auto_224295 ) ) ( not ( = ?auto_224293 ?auto_224296 ) ) ( not ( = ?auto_224293 ?auto_224297 ) ) ( not ( = ?auto_224293 ?auto_224298 ) ) ( not ( = ?auto_224293 ?auto_224299 ) ) ( not ( = ?auto_224293 ?auto_224300 ) ) ( not ( = ?auto_224294 ?auto_224295 ) ) ( not ( = ?auto_224294 ?auto_224296 ) ) ( not ( = ?auto_224294 ?auto_224297 ) ) ( not ( = ?auto_224294 ?auto_224298 ) ) ( not ( = ?auto_224294 ?auto_224299 ) ) ( not ( = ?auto_224294 ?auto_224300 ) ) ( not ( = ?auto_224295 ?auto_224296 ) ) ( not ( = ?auto_224295 ?auto_224297 ) ) ( not ( = ?auto_224295 ?auto_224298 ) ) ( not ( = ?auto_224295 ?auto_224299 ) ) ( not ( = ?auto_224295 ?auto_224300 ) ) ( not ( = ?auto_224296 ?auto_224297 ) ) ( not ( = ?auto_224296 ?auto_224298 ) ) ( not ( = ?auto_224296 ?auto_224299 ) ) ( not ( = ?auto_224296 ?auto_224300 ) ) ( not ( = ?auto_224297 ?auto_224298 ) ) ( not ( = ?auto_224297 ?auto_224299 ) ) ( not ( = ?auto_224297 ?auto_224300 ) ) ( not ( = ?auto_224298 ?auto_224299 ) ) ( not ( = ?auto_224298 ?auto_224300 ) ) ( not ( = ?auto_224299 ?auto_224300 ) ) ( ON ?auto_224298 ?auto_224299 ) ( ON ?auto_224297 ?auto_224298 ) ( ON ?auto_224296 ?auto_224297 ) ( ON ?auto_224295 ?auto_224296 ) ( CLEAR ?auto_224293 ) ( ON ?auto_224294 ?auto_224295 ) ( CLEAR ?auto_224294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_224290 ?auto_224291 ?auto_224292 ?auto_224293 ?auto_224294 )
      ( MAKE-10PILE ?auto_224290 ?auto_224291 ?auto_224292 ?auto_224293 ?auto_224294 ?auto_224295 ?auto_224296 ?auto_224297 ?auto_224298 ?auto_224299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224332 - BLOCK
      ?auto_224333 - BLOCK
      ?auto_224334 - BLOCK
      ?auto_224335 - BLOCK
      ?auto_224336 - BLOCK
      ?auto_224337 - BLOCK
      ?auto_224338 - BLOCK
      ?auto_224339 - BLOCK
      ?auto_224340 - BLOCK
      ?auto_224341 - BLOCK
    )
    :vars
    (
      ?auto_224342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224341 ?auto_224342 ) ( ON-TABLE ?auto_224332 ) ( ON ?auto_224333 ?auto_224332 ) ( ON ?auto_224334 ?auto_224333 ) ( not ( = ?auto_224332 ?auto_224333 ) ) ( not ( = ?auto_224332 ?auto_224334 ) ) ( not ( = ?auto_224332 ?auto_224335 ) ) ( not ( = ?auto_224332 ?auto_224336 ) ) ( not ( = ?auto_224332 ?auto_224337 ) ) ( not ( = ?auto_224332 ?auto_224338 ) ) ( not ( = ?auto_224332 ?auto_224339 ) ) ( not ( = ?auto_224332 ?auto_224340 ) ) ( not ( = ?auto_224332 ?auto_224341 ) ) ( not ( = ?auto_224332 ?auto_224342 ) ) ( not ( = ?auto_224333 ?auto_224334 ) ) ( not ( = ?auto_224333 ?auto_224335 ) ) ( not ( = ?auto_224333 ?auto_224336 ) ) ( not ( = ?auto_224333 ?auto_224337 ) ) ( not ( = ?auto_224333 ?auto_224338 ) ) ( not ( = ?auto_224333 ?auto_224339 ) ) ( not ( = ?auto_224333 ?auto_224340 ) ) ( not ( = ?auto_224333 ?auto_224341 ) ) ( not ( = ?auto_224333 ?auto_224342 ) ) ( not ( = ?auto_224334 ?auto_224335 ) ) ( not ( = ?auto_224334 ?auto_224336 ) ) ( not ( = ?auto_224334 ?auto_224337 ) ) ( not ( = ?auto_224334 ?auto_224338 ) ) ( not ( = ?auto_224334 ?auto_224339 ) ) ( not ( = ?auto_224334 ?auto_224340 ) ) ( not ( = ?auto_224334 ?auto_224341 ) ) ( not ( = ?auto_224334 ?auto_224342 ) ) ( not ( = ?auto_224335 ?auto_224336 ) ) ( not ( = ?auto_224335 ?auto_224337 ) ) ( not ( = ?auto_224335 ?auto_224338 ) ) ( not ( = ?auto_224335 ?auto_224339 ) ) ( not ( = ?auto_224335 ?auto_224340 ) ) ( not ( = ?auto_224335 ?auto_224341 ) ) ( not ( = ?auto_224335 ?auto_224342 ) ) ( not ( = ?auto_224336 ?auto_224337 ) ) ( not ( = ?auto_224336 ?auto_224338 ) ) ( not ( = ?auto_224336 ?auto_224339 ) ) ( not ( = ?auto_224336 ?auto_224340 ) ) ( not ( = ?auto_224336 ?auto_224341 ) ) ( not ( = ?auto_224336 ?auto_224342 ) ) ( not ( = ?auto_224337 ?auto_224338 ) ) ( not ( = ?auto_224337 ?auto_224339 ) ) ( not ( = ?auto_224337 ?auto_224340 ) ) ( not ( = ?auto_224337 ?auto_224341 ) ) ( not ( = ?auto_224337 ?auto_224342 ) ) ( not ( = ?auto_224338 ?auto_224339 ) ) ( not ( = ?auto_224338 ?auto_224340 ) ) ( not ( = ?auto_224338 ?auto_224341 ) ) ( not ( = ?auto_224338 ?auto_224342 ) ) ( not ( = ?auto_224339 ?auto_224340 ) ) ( not ( = ?auto_224339 ?auto_224341 ) ) ( not ( = ?auto_224339 ?auto_224342 ) ) ( not ( = ?auto_224340 ?auto_224341 ) ) ( not ( = ?auto_224340 ?auto_224342 ) ) ( not ( = ?auto_224341 ?auto_224342 ) ) ( ON ?auto_224340 ?auto_224341 ) ( ON ?auto_224339 ?auto_224340 ) ( ON ?auto_224338 ?auto_224339 ) ( ON ?auto_224337 ?auto_224338 ) ( ON ?auto_224336 ?auto_224337 ) ( CLEAR ?auto_224334 ) ( ON ?auto_224335 ?auto_224336 ) ( CLEAR ?auto_224335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_224332 ?auto_224333 ?auto_224334 ?auto_224335 )
      ( MAKE-10PILE ?auto_224332 ?auto_224333 ?auto_224334 ?auto_224335 ?auto_224336 ?auto_224337 ?auto_224338 ?auto_224339 ?auto_224340 ?auto_224341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224374 - BLOCK
      ?auto_224375 - BLOCK
      ?auto_224376 - BLOCK
      ?auto_224377 - BLOCK
      ?auto_224378 - BLOCK
      ?auto_224379 - BLOCK
      ?auto_224380 - BLOCK
      ?auto_224381 - BLOCK
      ?auto_224382 - BLOCK
      ?auto_224383 - BLOCK
    )
    :vars
    (
      ?auto_224384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224383 ?auto_224384 ) ( ON-TABLE ?auto_224374 ) ( ON ?auto_224375 ?auto_224374 ) ( not ( = ?auto_224374 ?auto_224375 ) ) ( not ( = ?auto_224374 ?auto_224376 ) ) ( not ( = ?auto_224374 ?auto_224377 ) ) ( not ( = ?auto_224374 ?auto_224378 ) ) ( not ( = ?auto_224374 ?auto_224379 ) ) ( not ( = ?auto_224374 ?auto_224380 ) ) ( not ( = ?auto_224374 ?auto_224381 ) ) ( not ( = ?auto_224374 ?auto_224382 ) ) ( not ( = ?auto_224374 ?auto_224383 ) ) ( not ( = ?auto_224374 ?auto_224384 ) ) ( not ( = ?auto_224375 ?auto_224376 ) ) ( not ( = ?auto_224375 ?auto_224377 ) ) ( not ( = ?auto_224375 ?auto_224378 ) ) ( not ( = ?auto_224375 ?auto_224379 ) ) ( not ( = ?auto_224375 ?auto_224380 ) ) ( not ( = ?auto_224375 ?auto_224381 ) ) ( not ( = ?auto_224375 ?auto_224382 ) ) ( not ( = ?auto_224375 ?auto_224383 ) ) ( not ( = ?auto_224375 ?auto_224384 ) ) ( not ( = ?auto_224376 ?auto_224377 ) ) ( not ( = ?auto_224376 ?auto_224378 ) ) ( not ( = ?auto_224376 ?auto_224379 ) ) ( not ( = ?auto_224376 ?auto_224380 ) ) ( not ( = ?auto_224376 ?auto_224381 ) ) ( not ( = ?auto_224376 ?auto_224382 ) ) ( not ( = ?auto_224376 ?auto_224383 ) ) ( not ( = ?auto_224376 ?auto_224384 ) ) ( not ( = ?auto_224377 ?auto_224378 ) ) ( not ( = ?auto_224377 ?auto_224379 ) ) ( not ( = ?auto_224377 ?auto_224380 ) ) ( not ( = ?auto_224377 ?auto_224381 ) ) ( not ( = ?auto_224377 ?auto_224382 ) ) ( not ( = ?auto_224377 ?auto_224383 ) ) ( not ( = ?auto_224377 ?auto_224384 ) ) ( not ( = ?auto_224378 ?auto_224379 ) ) ( not ( = ?auto_224378 ?auto_224380 ) ) ( not ( = ?auto_224378 ?auto_224381 ) ) ( not ( = ?auto_224378 ?auto_224382 ) ) ( not ( = ?auto_224378 ?auto_224383 ) ) ( not ( = ?auto_224378 ?auto_224384 ) ) ( not ( = ?auto_224379 ?auto_224380 ) ) ( not ( = ?auto_224379 ?auto_224381 ) ) ( not ( = ?auto_224379 ?auto_224382 ) ) ( not ( = ?auto_224379 ?auto_224383 ) ) ( not ( = ?auto_224379 ?auto_224384 ) ) ( not ( = ?auto_224380 ?auto_224381 ) ) ( not ( = ?auto_224380 ?auto_224382 ) ) ( not ( = ?auto_224380 ?auto_224383 ) ) ( not ( = ?auto_224380 ?auto_224384 ) ) ( not ( = ?auto_224381 ?auto_224382 ) ) ( not ( = ?auto_224381 ?auto_224383 ) ) ( not ( = ?auto_224381 ?auto_224384 ) ) ( not ( = ?auto_224382 ?auto_224383 ) ) ( not ( = ?auto_224382 ?auto_224384 ) ) ( not ( = ?auto_224383 ?auto_224384 ) ) ( ON ?auto_224382 ?auto_224383 ) ( ON ?auto_224381 ?auto_224382 ) ( ON ?auto_224380 ?auto_224381 ) ( ON ?auto_224379 ?auto_224380 ) ( ON ?auto_224378 ?auto_224379 ) ( ON ?auto_224377 ?auto_224378 ) ( CLEAR ?auto_224375 ) ( ON ?auto_224376 ?auto_224377 ) ( CLEAR ?auto_224376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_224374 ?auto_224375 ?auto_224376 )
      ( MAKE-10PILE ?auto_224374 ?auto_224375 ?auto_224376 ?auto_224377 ?auto_224378 ?auto_224379 ?auto_224380 ?auto_224381 ?auto_224382 ?auto_224383 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224416 - BLOCK
      ?auto_224417 - BLOCK
      ?auto_224418 - BLOCK
      ?auto_224419 - BLOCK
      ?auto_224420 - BLOCK
      ?auto_224421 - BLOCK
      ?auto_224422 - BLOCK
      ?auto_224423 - BLOCK
      ?auto_224424 - BLOCK
      ?auto_224425 - BLOCK
    )
    :vars
    (
      ?auto_224426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224425 ?auto_224426 ) ( ON-TABLE ?auto_224416 ) ( not ( = ?auto_224416 ?auto_224417 ) ) ( not ( = ?auto_224416 ?auto_224418 ) ) ( not ( = ?auto_224416 ?auto_224419 ) ) ( not ( = ?auto_224416 ?auto_224420 ) ) ( not ( = ?auto_224416 ?auto_224421 ) ) ( not ( = ?auto_224416 ?auto_224422 ) ) ( not ( = ?auto_224416 ?auto_224423 ) ) ( not ( = ?auto_224416 ?auto_224424 ) ) ( not ( = ?auto_224416 ?auto_224425 ) ) ( not ( = ?auto_224416 ?auto_224426 ) ) ( not ( = ?auto_224417 ?auto_224418 ) ) ( not ( = ?auto_224417 ?auto_224419 ) ) ( not ( = ?auto_224417 ?auto_224420 ) ) ( not ( = ?auto_224417 ?auto_224421 ) ) ( not ( = ?auto_224417 ?auto_224422 ) ) ( not ( = ?auto_224417 ?auto_224423 ) ) ( not ( = ?auto_224417 ?auto_224424 ) ) ( not ( = ?auto_224417 ?auto_224425 ) ) ( not ( = ?auto_224417 ?auto_224426 ) ) ( not ( = ?auto_224418 ?auto_224419 ) ) ( not ( = ?auto_224418 ?auto_224420 ) ) ( not ( = ?auto_224418 ?auto_224421 ) ) ( not ( = ?auto_224418 ?auto_224422 ) ) ( not ( = ?auto_224418 ?auto_224423 ) ) ( not ( = ?auto_224418 ?auto_224424 ) ) ( not ( = ?auto_224418 ?auto_224425 ) ) ( not ( = ?auto_224418 ?auto_224426 ) ) ( not ( = ?auto_224419 ?auto_224420 ) ) ( not ( = ?auto_224419 ?auto_224421 ) ) ( not ( = ?auto_224419 ?auto_224422 ) ) ( not ( = ?auto_224419 ?auto_224423 ) ) ( not ( = ?auto_224419 ?auto_224424 ) ) ( not ( = ?auto_224419 ?auto_224425 ) ) ( not ( = ?auto_224419 ?auto_224426 ) ) ( not ( = ?auto_224420 ?auto_224421 ) ) ( not ( = ?auto_224420 ?auto_224422 ) ) ( not ( = ?auto_224420 ?auto_224423 ) ) ( not ( = ?auto_224420 ?auto_224424 ) ) ( not ( = ?auto_224420 ?auto_224425 ) ) ( not ( = ?auto_224420 ?auto_224426 ) ) ( not ( = ?auto_224421 ?auto_224422 ) ) ( not ( = ?auto_224421 ?auto_224423 ) ) ( not ( = ?auto_224421 ?auto_224424 ) ) ( not ( = ?auto_224421 ?auto_224425 ) ) ( not ( = ?auto_224421 ?auto_224426 ) ) ( not ( = ?auto_224422 ?auto_224423 ) ) ( not ( = ?auto_224422 ?auto_224424 ) ) ( not ( = ?auto_224422 ?auto_224425 ) ) ( not ( = ?auto_224422 ?auto_224426 ) ) ( not ( = ?auto_224423 ?auto_224424 ) ) ( not ( = ?auto_224423 ?auto_224425 ) ) ( not ( = ?auto_224423 ?auto_224426 ) ) ( not ( = ?auto_224424 ?auto_224425 ) ) ( not ( = ?auto_224424 ?auto_224426 ) ) ( not ( = ?auto_224425 ?auto_224426 ) ) ( ON ?auto_224424 ?auto_224425 ) ( ON ?auto_224423 ?auto_224424 ) ( ON ?auto_224422 ?auto_224423 ) ( ON ?auto_224421 ?auto_224422 ) ( ON ?auto_224420 ?auto_224421 ) ( ON ?auto_224419 ?auto_224420 ) ( ON ?auto_224418 ?auto_224419 ) ( CLEAR ?auto_224416 ) ( ON ?auto_224417 ?auto_224418 ) ( CLEAR ?auto_224417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_224416 ?auto_224417 )
      ( MAKE-10PILE ?auto_224416 ?auto_224417 ?auto_224418 ?auto_224419 ?auto_224420 ?auto_224421 ?auto_224422 ?auto_224423 ?auto_224424 ?auto_224425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_224458 - BLOCK
      ?auto_224459 - BLOCK
      ?auto_224460 - BLOCK
      ?auto_224461 - BLOCK
      ?auto_224462 - BLOCK
      ?auto_224463 - BLOCK
      ?auto_224464 - BLOCK
      ?auto_224465 - BLOCK
      ?auto_224466 - BLOCK
      ?auto_224467 - BLOCK
    )
    :vars
    (
      ?auto_224468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224467 ?auto_224468 ) ( not ( = ?auto_224458 ?auto_224459 ) ) ( not ( = ?auto_224458 ?auto_224460 ) ) ( not ( = ?auto_224458 ?auto_224461 ) ) ( not ( = ?auto_224458 ?auto_224462 ) ) ( not ( = ?auto_224458 ?auto_224463 ) ) ( not ( = ?auto_224458 ?auto_224464 ) ) ( not ( = ?auto_224458 ?auto_224465 ) ) ( not ( = ?auto_224458 ?auto_224466 ) ) ( not ( = ?auto_224458 ?auto_224467 ) ) ( not ( = ?auto_224458 ?auto_224468 ) ) ( not ( = ?auto_224459 ?auto_224460 ) ) ( not ( = ?auto_224459 ?auto_224461 ) ) ( not ( = ?auto_224459 ?auto_224462 ) ) ( not ( = ?auto_224459 ?auto_224463 ) ) ( not ( = ?auto_224459 ?auto_224464 ) ) ( not ( = ?auto_224459 ?auto_224465 ) ) ( not ( = ?auto_224459 ?auto_224466 ) ) ( not ( = ?auto_224459 ?auto_224467 ) ) ( not ( = ?auto_224459 ?auto_224468 ) ) ( not ( = ?auto_224460 ?auto_224461 ) ) ( not ( = ?auto_224460 ?auto_224462 ) ) ( not ( = ?auto_224460 ?auto_224463 ) ) ( not ( = ?auto_224460 ?auto_224464 ) ) ( not ( = ?auto_224460 ?auto_224465 ) ) ( not ( = ?auto_224460 ?auto_224466 ) ) ( not ( = ?auto_224460 ?auto_224467 ) ) ( not ( = ?auto_224460 ?auto_224468 ) ) ( not ( = ?auto_224461 ?auto_224462 ) ) ( not ( = ?auto_224461 ?auto_224463 ) ) ( not ( = ?auto_224461 ?auto_224464 ) ) ( not ( = ?auto_224461 ?auto_224465 ) ) ( not ( = ?auto_224461 ?auto_224466 ) ) ( not ( = ?auto_224461 ?auto_224467 ) ) ( not ( = ?auto_224461 ?auto_224468 ) ) ( not ( = ?auto_224462 ?auto_224463 ) ) ( not ( = ?auto_224462 ?auto_224464 ) ) ( not ( = ?auto_224462 ?auto_224465 ) ) ( not ( = ?auto_224462 ?auto_224466 ) ) ( not ( = ?auto_224462 ?auto_224467 ) ) ( not ( = ?auto_224462 ?auto_224468 ) ) ( not ( = ?auto_224463 ?auto_224464 ) ) ( not ( = ?auto_224463 ?auto_224465 ) ) ( not ( = ?auto_224463 ?auto_224466 ) ) ( not ( = ?auto_224463 ?auto_224467 ) ) ( not ( = ?auto_224463 ?auto_224468 ) ) ( not ( = ?auto_224464 ?auto_224465 ) ) ( not ( = ?auto_224464 ?auto_224466 ) ) ( not ( = ?auto_224464 ?auto_224467 ) ) ( not ( = ?auto_224464 ?auto_224468 ) ) ( not ( = ?auto_224465 ?auto_224466 ) ) ( not ( = ?auto_224465 ?auto_224467 ) ) ( not ( = ?auto_224465 ?auto_224468 ) ) ( not ( = ?auto_224466 ?auto_224467 ) ) ( not ( = ?auto_224466 ?auto_224468 ) ) ( not ( = ?auto_224467 ?auto_224468 ) ) ( ON ?auto_224466 ?auto_224467 ) ( ON ?auto_224465 ?auto_224466 ) ( ON ?auto_224464 ?auto_224465 ) ( ON ?auto_224463 ?auto_224464 ) ( ON ?auto_224462 ?auto_224463 ) ( ON ?auto_224461 ?auto_224462 ) ( ON ?auto_224460 ?auto_224461 ) ( ON ?auto_224459 ?auto_224460 ) ( ON ?auto_224458 ?auto_224459 ) ( CLEAR ?auto_224458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_224458 )
      ( MAKE-10PILE ?auto_224458 ?auto_224459 ?auto_224460 ?auto_224461 ?auto_224462 ?auto_224463 ?auto_224464 ?auto_224465 ?auto_224466 ?auto_224467 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224501 - BLOCK
      ?auto_224502 - BLOCK
      ?auto_224503 - BLOCK
      ?auto_224504 - BLOCK
      ?auto_224505 - BLOCK
      ?auto_224506 - BLOCK
      ?auto_224507 - BLOCK
      ?auto_224508 - BLOCK
      ?auto_224509 - BLOCK
      ?auto_224510 - BLOCK
      ?auto_224511 - BLOCK
    )
    :vars
    (
      ?auto_224512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_224510 ) ( ON ?auto_224511 ?auto_224512 ) ( CLEAR ?auto_224511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_224501 ) ( ON ?auto_224502 ?auto_224501 ) ( ON ?auto_224503 ?auto_224502 ) ( ON ?auto_224504 ?auto_224503 ) ( ON ?auto_224505 ?auto_224504 ) ( ON ?auto_224506 ?auto_224505 ) ( ON ?auto_224507 ?auto_224506 ) ( ON ?auto_224508 ?auto_224507 ) ( ON ?auto_224509 ?auto_224508 ) ( ON ?auto_224510 ?auto_224509 ) ( not ( = ?auto_224501 ?auto_224502 ) ) ( not ( = ?auto_224501 ?auto_224503 ) ) ( not ( = ?auto_224501 ?auto_224504 ) ) ( not ( = ?auto_224501 ?auto_224505 ) ) ( not ( = ?auto_224501 ?auto_224506 ) ) ( not ( = ?auto_224501 ?auto_224507 ) ) ( not ( = ?auto_224501 ?auto_224508 ) ) ( not ( = ?auto_224501 ?auto_224509 ) ) ( not ( = ?auto_224501 ?auto_224510 ) ) ( not ( = ?auto_224501 ?auto_224511 ) ) ( not ( = ?auto_224501 ?auto_224512 ) ) ( not ( = ?auto_224502 ?auto_224503 ) ) ( not ( = ?auto_224502 ?auto_224504 ) ) ( not ( = ?auto_224502 ?auto_224505 ) ) ( not ( = ?auto_224502 ?auto_224506 ) ) ( not ( = ?auto_224502 ?auto_224507 ) ) ( not ( = ?auto_224502 ?auto_224508 ) ) ( not ( = ?auto_224502 ?auto_224509 ) ) ( not ( = ?auto_224502 ?auto_224510 ) ) ( not ( = ?auto_224502 ?auto_224511 ) ) ( not ( = ?auto_224502 ?auto_224512 ) ) ( not ( = ?auto_224503 ?auto_224504 ) ) ( not ( = ?auto_224503 ?auto_224505 ) ) ( not ( = ?auto_224503 ?auto_224506 ) ) ( not ( = ?auto_224503 ?auto_224507 ) ) ( not ( = ?auto_224503 ?auto_224508 ) ) ( not ( = ?auto_224503 ?auto_224509 ) ) ( not ( = ?auto_224503 ?auto_224510 ) ) ( not ( = ?auto_224503 ?auto_224511 ) ) ( not ( = ?auto_224503 ?auto_224512 ) ) ( not ( = ?auto_224504 ?auto_224505 ) ) ( not ( = ?auto_224504 ?auto_224506 ) ) ( not ( = ?auto_224504 ?auto_224507 ) ) ( not ( = ?auto_224504 ?auto_224508 ) ) ( not ( = ?auto_224504 ?auto_224509 ) ) ( not ( = ?auto_224504 ?auto_224510 ) ) ( not ( = ?auto_224504 ?auto_224511 ) ) ( not ( = ?auto_224504 ?auto_224512 ) ) ( not ( = ?auto_224505 ?auto_224506 ) ) ( not ( = ?auto_224505 ?auto_224507 ) ) ( not ( = ?auto_224505 ?auto_224508 ) ) ( not ( = ?auto_224505 ?auto_224509 ) ) ( not ( = ?auto_224505 ?auto_224510 ) ) ( not ( = ?auto_224505 ?auto_224511 ) ) ( not ( = ?auto_224505 ?auto_224512 ) ) ( not ( = ?auto_224506 ?auto_224507 ) ) ( not ( = ?auto_224506 ?auto_224508 ) ) ( not ( = ?auto_224506 ?auto_224509 ) ) ( not ( = ?auto_224506 ?auto_224510 ) ) ( not ( = ?auto_224506 ?auto_224511 ) ) ( not ( = ?auto_224506 ?auto_224512 ) ) ( not ( = ?auto_224507 ?auto_224508 ) ) ( not ( = ?auto_224507 ?auto_224509 ) ) ( not ( = ?auto_224507 ?auto_224510 ) ) ( not ( = ?auto_224507 ?auto_224511 ) ) ( not ( = ?auto_224507 ?auto_224512 ) ) ( not ( = ?auto_224508 ?auto_224509 ) ) ( not ( = ?auto_224508 ?auto_224510 ) ) ( not ( = ?auto_224508 ?auto_224511 ) ) ( not ( = ?auto_224508 ?auto_224512 ) ) ( not ( = ?auto_224509 ?auto_224510 ) ) ( not ( = ?auto_224509 ?auto_224511 ) ) ( not ( = ?auto_224509 ?auto_224512 ) ) ( not ( = ?auto_224510 ?auto_224511 ) ) ( not ( = ?auto_224510 ?auto_224512 ) ) ( not ( = ?auto_224511 ?auto_224512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_224511 ?auto_224512 )
      ( !STACK ?auto_224511 ?auto_224510 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224547 - BLOCK
      ?auto_224548 - BLOCK
      ?auto_224549 - BLOCK
      ?auto_224550 - BLOCK
      ?auto_224551 - BLOCK
      ?auto_224552 - BLOCK
      ?auto_224553 - BLOCK
      ?auto_224554 - BLOCK
      ?auto_224555 - BLOCK
      ?auto_224556 - BLOCK
      ?auto_224557 - BLOCK
    )
    :vars
    (
      ?auto_224558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224557 ?auto_224558 ) ( ON-TABLE ?auto_224547 ) ( ON ?auto_224548 ?auto_224547 ) ( ON ?auto_224549 ?auto_224548 ) ( ON ?auto_224550 ?auto_224549 ) ( ON ?auto_224551 ?auto_224550 ) ( ON ?auto_224552 ?auto_224551 ) ( ON ?auto_224553 ?auto_224552 ) ( ON ?auto_224554 ?auto_224553 ) ( ON ?auto_224555 ?auto_224554 ) ( not ( = ?auto_224547 ?auto_224548 ) ) ( not ( = ?auto_224547 ?auto_224549 ) ) ( not ( = ?auto_224547 ?auto_224550 ) ) ( not ( = ?auto_224547 ?auto_224551 ) ) ( not ( = ?auto_224547 ?auto_224552 ) ) ( not ( = ?auto_224547 ?auto_224553 ) ) ( not ( = ?auto_224547 ?auto_224554 ) ) ( not ( = ?auto_224547 ?auto_224555 ) ) ( not ( = ?auto_224547 ?auto_224556 ) ) ( not ( = ?auto_224547 ?auto_224557 ) ) ( not ( = ?auto_224547 ?auto_224558 ) ) ( not ( = ?auto_224548 ?auto_224549 ) ) ( not ( = ?auto_224548 ?auto_224550 ) ) ( not ( = ?auto_224548 ?auto_224551 ) ) ( not ( = ?auto_224548 ?auto_224552 ) ) ( not ( = ?auto_224548 ?auto_224553 ) ) ( not ( = ?auto_224548 ?auto_224554 ) ) ( not ( = ?auto_224548 ?auto_224555 ) ) ( not ( = ?auto_224548 ?auto_224556 ) ) ( not ( = ?auto_224548 ?auto_224557 ) ) ( not ( = ?auto_224548 ?auto_224558 ) ) ( not ( = ?auto_224549 ?auto_224550 ) ) ( not ( = ?auto_224549 ?auto_224551 ) ) ( not ( = ?auto_224549 ?auto_224552 ) ) ( not ( = ?auto_224549 ?auto_224553 ) ) ( not ( = ?auto_224549 ?auto_224554 ) ) ( not ( = ?auto_224549 ?auto_224555 ) ) ( not ( = ?auto_224549 ?auto_224556 ) ) ( not ( = ?auto_224549 ?auto_224557 ) ) ( not ( = ?auto_224549 ?auto_224558 ) ) ( not ( = ?auto_224550 ?auto_224551 ) ) ( not ( = ?auto_224550 ?auto_224552 ) ) ( not ( = ?auto_224550 ?auto_224553 ) ) ( not ( = ?auto_224550 ?auto_224554 ) ) ( not ( = ?auto_224550 ?auto_224555 ) ) ( not ( = ?auto_224550 ?auto_224556 ) ) ( not ( = ?auto_224550 ?auto_224557 ) ) ( not ( = ?auto_224550 ?auto_224558 ) ) ( not ( = ?auto_224551 ?auto_224552 ) ) ( not ( = ?auto_224551 ?auto_224553 ) ) ( not ( = ?auto_224551 ?auto_224554 ) ) ( not ( = ?auto_224551 ?auto_224555 ) ) ( not ( = ?auto_224551 ?auto_224556 ) ) ( not ( = ?auto_224551 ?auto_224557 ) ) ( not ( = ?auto_224551 ?auto_224558 ) ) ( not ( = ?auto_224552 ?auto_224553 ) ) ( not ( = ?auto_224552 ?auto_224554 ) ) ( not ( = ?auto_224552 ?auto_224555 ) ) ( not ( = ?auto_224552 ?auto_224556 ) ) ( not ( = ?auto_224552 ?auto_224557 ) ) ( not ( = ?auto_224552 ?auto_224558 ) ) ( not ( = ?auto_224553 ?auto_224554 ) ) ( not ( = ?auto_224553 ?auto_224555 ) ) ( not ( = ?auto_224553 ?auto_224556 ) ) ( not ( = ?auto_224553 ?auto_224557 ) ) ( not ( = ?auto_224553 ?auto_224558 ) ) ( not ( = ?auto_224554 ?auto_224555 ) ) ( not ( = ?auto_224554 ?auto_224556 ) ) ( not ( = ?auto_224554 ?auto_224557 ) ) ( not ( = ?auto_224554 ?auto_224558 ) ) ( not ( = ?auto_224555 ?auto_224556 ) ) ( not ( = ?auto_224555 ?auto_224557 ) ) ( not ( = ?auto_224555 ?auto_224558 ) ) ( not ( = ?auto_224556 ?auto_224557 ) ) ( not ( = ?auto_224556 ?auto_224558 ) ) ( not ( = ?auto_224557 ?auto_224558 ) ) ( CLEAR ?auto_224555 ) ( ON ?auto_224556 ?auto_224557 ) ( CLEAR ?auto_224556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_224547 ?auto_224548 ?auto_224549 ?auto_224550 ?auto_224551 ?auto_224552 ?auto_224553 ?auto_224554 ?auto_224555 ?auto_224556 )
      ( MAKE-11PILE ?auto_224547 ?auto_224548 ?auto_224549 ?auto_224550 ?auto_224551 ?auto_224552 ?auto_224553 ?auto_224554 ?auto_224555 ?auto_224556 ?auto_224557 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224593 - BLOCK
      ?auto_224594 - BLOCK
      ?auto_224595 - BLOCK
      ?auto_224596 - BLOCK
      ?auto_224597 - BLOCK
      ?auto_224598 - BLOCK
      ?auto_224599 - BLOCK
      ?auto_224600 - BLOCK
      ?auto_224601 - BLOCK
      ?auto_224602 - BLOCK
      ?auto_224603 - BLOCK
    )
    :vars
    (
      ?auto_224604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224603 ?auto_224604 ) ( ON-TABLE ?auto_224593 ) ( ON ?auto_224594 ?auto_224593 ) ( ON ?auto_224595 ?auto_224594 ) ( ON ?auto_224596 ?auto_224595 ) ( ON ?auto_224597 ?auto_224596 ) ( ON ?auto_224598 ?auto_224597 ) ( ON ?auto_224599 ?auto_224598 ) ( ON ?auto_224600 ?auto_224599 ) ( not ( = ?auto_224593 ?auto_224594 ) ) ( not ( = ?auto_224593 ?auto_224595 ) ) ( not ( = ?auto_224593 ?auto_224596 ) ) ( not ( = ?auto_224593 ?auto_224597 ) ) ( not ( = ?auto_224593 ?auto_224598 ) ) ( not ( = ?auto_224593 ?auto_224599 ) ) ( not ( = ?auto_224593 ?auto_224600 ) ) ( not ( = ?auto_224593 ?auto_224601 ) ) ( not ( = ?auto_224593 ?auto_224602 ) ) ( not ( = ?auto_224593 ?auto_224603 ) ) ( not ( = ?auto_224593 ?auto_224604 ) ) ( not ( = ?auto_224594 ?auto_224595 ) ) ( not ( = ?auto_224594 ?auto_224596 ) ) ( not ( = ?auto_224594 ?auto_224597 ) ) ( not ( = ?auto_224594 ?auto_224598 ) ) ( not ( = ?auto_224594 ?auto_224599 ) ) ( not ( = ?auto_224594 ?auto_224600 ) ) ( not ( = ?auto_224594 ?auto_224601 ) ) ( not ( = ?auto_224594 ?auto_224602 ) ) ( not ( = ?auto_224594 ?auto_224603 ) ) ( not ( = ?auto_224594 ?auto_224604 ) ) ( not ( = ?auto_224595 ?auto_224596 ) ) ( not ( = ?auto_224595 ?auto_224597 ) ) ( not ( = ?auto_224595 ?auto_224598 ) ) ( not ( = ?auto_224595 ?auto_224599 ) ) ( not ( = ?auto_224595 ?auto_224600 ) ) ( not ( = ?auto_224595 ?auto_224601 ) ) ( not ( = ?auto_224595 ?auto_224602 ) ) ( not ( = ?auto_224595 ?auto_224603 ) ) ( not ( = ?auto_224595 ?auto_224604 ) ) ( not ( = ?auto_224596 ?auto_224597 ) ) ( not ( = ?auto_224596 ?auto_224598 ) ) ( not ( = ?auto_224596 ?auto_224599 ) ) ( not ( = ?auto_224596 ?auto_224600 ) ) ( not ( = ?auto_224596 ?auto_224601 ) ) ( not ( = ?auto_224596 ?auto_224602 ) ) ( not ( = ?auto_224596 ?auto_224603 ) ) ( not ( = ?auto_224596 ?auto_224604 ) ) ( not ( = ?auto_224597 ?auto_224598 ) ) ( not ( = ?auto_224597 ?auto_224599 ) ) ( not ( = ?auto_224597 ?auto_224600 ) ) ( not ( = ?auto_224597 ?auto_224601 ) ) ( not ( = ?auto_224597 ?auto_224602 ) ) ( not ( = ?auto_224597 ?auto_224603 ) ) ( not ( = ?auto_224597 ?auto_224604 ) ) ( not ( = ?auto_224598 ?auto_224599 ) ) ( not ( = ?auto_224598 ?auto_224600 ) ) ( not ( = ?auto_224598 ?auto_224601 ) ) ( not ( = ?auto_224598 ?auto_224602 ) ) ( not ( = ?auto_224598 ?auto_224603 ) ) ( not ( = ?auto_224598 ?auto_224604 ) ) ( not ( = ?auto_224599 ?auto_224600 ) ) ( not ( = ?auto_224599 ?auto_224601 ) ) ( not ( = ?auto_224599 ?auto_224602 ) ) ( not ( = ?auto_224599 ?auto_224603 ) ) ( not ( = ?auto_224599 ?auto_224604 ) ) ( not ( = ?auto_224600 ?auto_224601 ) ) ( not ( = ?auto_224600 ?auto_224602 ) ) ( not ( = ?auto_224600 ?auto_224603 ) ) ( not ( = ?auto_224600 ?auto_224604 ) ) ( not ( = ?auto_224601 ?auto_224602 ) ) ( not ( = ?auto_224601 ?auto_224603 ) ) ( not ( = ?auto_224601 ?auto_224604 ) ) ( not ( = ?auto_224602 ?auto_224603 ) ) ( not ( = ?auto_224602 ?auto_224604 ) ) ( not ( = ?auto_224603 ?auto_224604 ) ) ( ON ?auto_224602 ?auto_224603 ) ( CLEAR ?auto_224600 ) ( ON ?auto_224601 ?auto_224602 ) ( CLEAR ?auto_224601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_224593 ?auto_224594 ?auto_224595 ?auto_224596 ?auto_224597 ?auto_224598 ?auto_224599 ?auto_224600 ?auto_224601 )
      ( MAKE-11PILE ?auto_224593 ?auto_224594 ?auto_224595 ?auto_224596 ?auto_224597 ?auto_224598 ?auto_224599 ?auto_224600 ?auto_224601 ?auto_224602 ?auto_224603 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224639 - BLOCK
      ?auto_224640 - BLOCK
      ?auto_224641 - BLOCK
      ?auto_224642 - BLOCK
      ?auto_224643 - BLOCK
      ?auto_224644 - BLOCK
      ?auto_224645 - BLOCK
      ?auto_224646 - BLOCK
      ?auto_224647 - BLOCK
      ?auto_224648 - BLOCK
      ?auto_224649 - BLOCK
    )
    :vars
    (
      ?auto_224650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224649 ?auto_224650 ) ( ON-TABLE ?auto_224639 ) ( ON ?auto_224640 ?auto_224639 ) ( ON ?auto_224641 ?auto_224640 ) ( ON ?auto_224642 ?auto_224641 ) ( ON ?auto_224643 ?auto_224642 ) ( ON ?auto_224644 ?auto_224643 ) ( ON ?auto_224645 ?auto_224644 ) ( not ( = ?auto_224639 ?auto_224640 ) ) ( not ( = ?auto_224639 ?auto_224641 ) ) ( not ( = ?auto_224639 ?auto_224642 ) ) ( not ( = ?auto_224639 ?auto_224643 ) ) ( not ( = ?auto_224639 ?auto_224644 ) ) ( not ( = ?auto_224639 ?auto_224645 ) ) ( not ( = ?auto_224639 ?auto_224646 ) ) ( not ( = ?auto_224639 ?auto_224647 ) ) ( not ( = ?auto_224639 ?auto_224648 ) ) ( not ( = ?auto_224639 ?auto_224649 ) ) ( not ( = ?auto_224639 ?auto_224650 ) ) ( not ( = ?auto_224640 ?auto_224641 ) ) ( not ( = ?auto_224640 ?auto_224642 ) ) ( not ( = ?auto_224640 ?auto_224643 ) ) ( not ( = ?auto_224640 ?auto_224644 ) ) ( not ( = ?auto_224640 ?auto_224645 ) ) ( not ( = ?auto_224640 ?auto_224646 ) ) ( not ( = ?auto_224640 ?auto_224647 ) ) ( not ( = ?auto_224640 ?auto_224648 ) ) ( not ( = ?auto_224640 ?auto_224649 ) ) ( not ( = ?auto_224640 ?auto_224650 ) ) ( not ( = ?auto_224641 ?auto_224642 ) ) ( not ( = ?auto_224641 ?auto_224643 ) ) ( not ( = ?auto_224641 ?auto_224644 ) ) ( not ( = ?auto_224641 ?auto_224645 ) ) ( not ( = ?auto_224641 ?auto_224646 ) ) ( not ( = ?auto_224641 ?auto_224647 ) ) ( not ( = ?auto_224641 ?auto_224648 ) ) ( not ( = ?auto_224641 ?auto_224649 ) ) ( not ( = ?auto_224641 ?auto_224650 ) ) ( not ( = ?auto_224642 ?auto_224643 ) ) ( not ( = ?auto_224642 ?auto_224644 ) ) ( not ( = ?auto_224642 ?auto_224645 ) ) ( not ( = ?auto_224642 ?auto_224646 ) ) ( not ( = ?auto_224642 ?auto_224647 ) ) ( not ( = ?auto_224642 ?auto_224648 ) ) ( not ( = ?auto_224642 ?auto_224649 ) ) ( not ( = ?auto_224642 ?auto_224650 ) ) ( not ( = ?auto_224643 ?auto_224644 ) ) ( not ( = ?auto_224643 ?auto_224645 ) ) ( not ( = ?auto_224643 ?auto_224646 ) ) ( not ( = ?auto_224643 ?auto_224647 ) ) ( not ( = ?auto_224643 ?auto_224648 ) ) ( not ( = ?auto_224643 ?auto_224649 ) ) ( not ( = ?auto_224643 ?auto_224650 ) ) ( not ( = ?auto_224644 ?auto_224645 ) ) ( not ( = ?auto_224644 ?auto_224646 ) ) ( not ( = ?auto_224644 ?auto_224647 ) ) ( not ( = ?auto_224644 ?auto_224648 ) ) ( not ( = ?auto_224644 ?auto_224649 ) ) ( not ( = ?auto_224644 ?auto_224650 ) ) ( not ( = ?auto_224645 ?auto_224646 ) ) ( not ( = ?auto_224645 ?auto_224647 ) ) ( not ( = ?auto_224645 ?auto_224648 ) ) ( not ( = ?auto_224645 ?auto_224649 ) ) ( not ( = ?auto_224645 ?auto_224650 ) ) ( not ( = ?auto_224646 ?auto_224647 ) ) ( not ( = ?auto_224646 ?auto_224648 ) ) ( not ( = ?auto_224646 ?auto_224649 ) ) ( not ( = ?auto_224646 ?auto_224650 ) ) ( not ( = ?auto_224647 ?auto_224648 ) ) ( not ( = ?auto_224647 ?auto_224649 ) ) ( not ( = ?auto_224647 ?auto_224650 ) ) ( not ( = ?auto_224648 ?auto_224649 ) ) ( not ( = ?auto_224648 ?auto_224650 ) ) ( not ( = ?auto_224649 ?auto_224650 ) ) ( ON ?auto_224648 ?auto_224649 ) ( ON ?auto_224647 ?auto_224648 ) ( CLEAR ?auto_224645 ) ( ON ?auto_224646 ?auto_224647 ) ( CLEAR ?auto_224646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_224639 ?auto_224640 ?auto_224641 ?auto_224642 ?auto_224643 ?auto_224644 ?auto_224645 ?auto_224646 )
      ( MAKE-11PILE ?auto_224639 ?auto_224640 ?auto_224641 ?auto_224642 ?auto_224643 ?auto_224644 ?auto_224645 ?auto_224646 ?auto_224647 ?auto_224648 ?auto_224649 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224685 - BLOCK
      ?auto_224686 - BLOCK
      ?auto_224687 - BLOCK
      ?auto_224688 - BLOCK
      ?auto_224689 - BLOCK
      ?auto_224690 - BLOCK
      ?auto_224691 - BLOCK
      ?auto_224692 - BLOCK
      ?auto_224693 - BLOCK
      ?auto_224694 - BLOCK
      ?auto_224695 - BLOCK
    )
    :vars
    (
      ?auto_224696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224695 ?auto_224696 ) ( ON-TABLE ?auto_224685 ) ( ON ?auto_224686 ?auto_224685 ) ( ON ?auto_224687 ?auto_224686 ) ( ON ?auto_224688 ?auto_224687 ) ( ON ?auto_224689 ?auto_224688 ) ( ON ?auto_224690 ?auto_224689 ) ( not ( = ?auto_224685 ?auto_224686 ) ) ( not ( = ?auto_224685 ?auto_224687 ) ) ( not ( = ?auto_224685 ?auto_224688 ) ) ( not ( = ?auto_224685 ?auto_224689 ) ) ( not ( = ?auto_224685 ?auto_224690 ) ) ( not ( = ?auto_224685 ?auto_224691 ) ) ( not ( = ?auto_224685 ?auto_224692 ) ) ( not ( = ?auto_224685 ?auto_224693 ) ) ( not ( = ?auto_224685 ?auto_224694 ) ) ( not ( = ?auto_224685 ?auto_224695 ) ) ( not ( = ?auto_224685 ?auto_224696 ) ) ( not ( = ?auto_224686 ?auto_224687 ) ) ( not ( = ?auto_224686 ?auto_224688 ) ) ( not ( = ?auto_224686 ?auto_224689 ) ) ( not ( = ?auto_224686 ?auto_224690 ) ) ( not ( = ?auto_224686 ?auto_224691 ) ) ( not ( = ?auto_224686 ?auto_224692 ) ) ( not ( = ?auto_224686 ?auto_224693 ) ) ( not ( = ?auto_224686 ?auto_224694 ) ) ( not ( = ?auto_224686 ?auto_224695 ) ) ( not ( = ?auto_224686 ?auto_224696 ) ) ( not ( = ?auto_224687 ?auto_224688 ) ) ( not ( = ?auto_224687 ?auto_224689 ) ) ( not ( = ?auto_224687 ?auto_224690 ) ) ( not ( = ?auto_224687 ?auto_224691 ) ) ( not ( = ?auto_224687 ?auto_224692 ) ) ( not ( = ?auto_224687 ?auto_224693 ) ) ( not ( = ?auto_224687 ?auto_224694 ) ) ( not ( = ?auto_224687 ?auto_224695 ) ) ( not ( = ?auto_224687 ?auto_224696 ) ) ( not ( = ?auto_224688 ?auto_224689 ) ) ( not ( = ?auto_224688 ?auto_224690 ) ) ( not ( = ?auto_224688 ?auto_224691 ) ) ( not ( = ?auto_224688 ?auto_224692 ) ) ( not ( = ?auto_224688 ?auto_224693 ) ) ( not ( = ?auto_224688 ?auto_224694 ) ) ( not ( = ?auto_224688 ?auto_224695 ) ) ( not ( = ?auto_224688 ?auto_224696 ) ) ( not ( = ?auto_224689 ?auto_224690 ) ) ( not ( = ?auto_224689 ?auto_224691 ) ) ( not ( = ?auto_224689 ?auto_224692 ) ) ( not ( = ?auto_224689 ?auto_224693 ) ) ( not ( = ?auto_224689 ?auto_224694 ) ) ( not ( = ?auto_224689 ?auto_224695 ) ) ( not ( = ?auto_224689 ?auto_224696 ) ) ( not ( = ?auto_224690 ?auto_224691 ) ) ( not ( = ?auto_224690 ?auto_224692 ) ) ( not ( = ?auto_224690 ?auto_224693 ) ) ( not ( = ?auto_224690 ?auto_224694 ) ) ( not ( = ?auto_224690 ?auto_224695 ) ) ( not ( = ?auto_224690 ?auto_224696 ) ) ( not ( = ?auto_224691 ?auto_224692 ) ) ( not ( = ?auto_224691 ?auto_224693 ) ) ( not ( = ?auto_224691 ?auto_224694 ) ) ( not ( = ?auto_224691 ?auto_224695 ) ) ( not ( = ?auto_224691 ?auto_224696 ) ) ( not ( = ?auto_224692 ?auto_224693 ) ) ( not ( = ?auto_224692 ?auto_224694 ) ) ( not ( = ?auto_224692 ?auto_224695 ) ) ( not ( = ?auto_224692 ?auto_224696 ) ) ( not ( = ?auto_224693 ?auto_224694 ) ) ( not ( = ?auto_224693 ?auto_224695 ) ) ( not ( = ?auto_224693 ?auto_224696 ) ) ( not ( = ?auto_224694 ?auto_224695 ) ) ( not ( = ?auto_224694 ?auto_224696 ) ) ( not ( = ?auto_224695 ?auto_224696 ) ) ( ON ?auto_224694 ?auto_224695 ) ( ON ?auto_224693 ?auto_224694 ) ( ON ?auto_224692 ?auto_224693 ) ( CLEAR ?auto_224690 ) ( ON ?auto_224691 ?auto_224692 ) ( CLEAR ?auto_224691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_224685 ?auto_224686 ?auto_224687 ?auto_224688 ?auto_224689 ?auto_224690 ?auto_224691 )
      ( MAKE-11PILE ?auto_224685 ?auto_224686 ?auto_224687 ?auto_224688 ?auto_224689 ?auto_224690 ?auto_224691 ?auto_224692 ?auto_224693 ?auto_224694 ?auto_224695 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224731 - BLOCK
      ?auto_224732 - BLOCK
      ?auto_224733 - BLOCK
      ?auto_224734 - BLOCK
      ?auto_224735 - BLOCK
      ?auto_224736 - BLOCK
      ?auto_224737 - BLOCK
      ?auto_224738 - BLOCK
      ?auto_224739 - BLOCK
      ?auto_224740 - BLOCK
      ?auto_224741 - BLOCK
    )
    :vars
    (
      ?auto_224742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224741 ?auto_224742 ) ( ON-TABLE ?auto_224731 ) ( ON ?auto_224732 ?auto_224731 ) ( ON ?auto_224733 ?auto_224732 ) ( ON ?auto_224734 ?auto_224733 ) ( ON ?auto_224735 ?auto_224734 ) ( not ( = ?auto_224731 ?auto_224732 ) ) ( not ( = ?auto_224731 ?auto_224733 ) ) ( not ( = ?auto_224731 ?auto_224734 ) ) ( not ( = ?auto_224731 ?auto_224735 ) ) ( not ( = ?auto_224731 ?auto_224736 ) ) ( not ( = ?auto_224731 ?auto_224737 ) ) ( not ( = ?auto_224731 ?auto_224738 ) ) ( not ( = ?auto_224731 ?auto_224739 ) ) ( not ( = ?auto_224731 ?auto_224740 ) ) ( not ( = ?auto_224731 ?auto_224741 ) ) ( not ( = ?auto_224731 ?auto_224742 ) ) ( not ( = ?auto_224732 ?auto_224733 ) ) ( not ( = ?auto_224732 ?auto_224734 ) ) ( not ( = ?auto_224732 ?auto_224735 ) ) ( not ( = ?auto_224732 ?auto_224736 ) ) ( not ( = ?auto_224732 ?auto_224737 ) ) ( not ( = ?auto_224732 ?auto_224738 ) ) ( not ( = ?auto_224732 ?auto_224739 ) ) ( not ( = ?auto_224732 ?auto_224740 ) ) ( not ( = ?auto_224732 ?auto_224741 ) ) ( not ( = ?auto_224732 ?auto_224742 ) ) ( not ( = ?auto_224733 ?auto_224734 ) ) ( not ( = ?auto_224733 ?auto_224735 ) ) ( not ( = ?auto_224733 ?auto_224736 ) ) ( not ( = ?auto_224733 ?auto_224737 ) ) ( not ( = ?auto_224733 ?auto_224738 ) ) ( not ( = ?auto_224733 ?auto_224739 ) ) ( not ( = ?auto_224733 ?auto_224740 ) ) ( not ( = ?auto_224733 ?auto_224741 ) ) ( not ( = ?auto_224733 ?auto_224742 ) ) ( not ( = ?auto_224734 ?auto_224735 ) ) ( not ( = ?auto_224734 ?auto_224736 ) ) ( not ( = ?auto_224734 ?auto_224737 ) ) ( not ( = ?auto_224734 ?auto_224738 ) ) ( not ( = ?auto_224734 ?auto_224739 ) ) ( not ( = ?auto_224734 ?auto_224740 ) ) ( not ( = ?auto_224734 ?auto_224741 ) ) ( not ( = ?auto_224734 ?auto_224742 ) ) ( not ( = ?auto_224735 ?auto_224736 ) ) ( not ( = ?auto_224735 ?auto_224737 ) ) ( not ( = ?auto_224735 ?auto_224738 ) ) ( not ( = ?auto_224735 ?auto_224739 ) ) ( not ( = ?auto_224735 ?auto_224740 ) ) ( not ( = ?auto_224735 ?auto_224741 ) ) ( not ( = ?auto_224735 ?auto_224742 ) ) ( not ( = ?auto_224736 ?auto_224737 ) ) ( not ( = ?auto_224736 ?auto_224738 ) ) ( not ( = ?auto_224736 ?auto_224739 ) ) ( not ( = ?auto_224736 ?auto_224740 ) ) ( not ( = ?auto_224736 ?auto_224741 ) ) ( not ( = ?auto_224736 ?auto_224742 ) ) ( not ( = ?auto_224737 ?auto_224738 ) ) ( not ( = ?auto_224737 ?auto_224739 ) ) ( not ( = ?auto_224737 ?auto_224740 ) ) ( not ( = ?auto_224737 ?auto_224741 ) ) ( not ( = ?auto_224737 ?auto_224742 ) ) ( not ( = ?auto_224738 ?auto_224739 ) ) ( not ( = ?auto_224738 ?auto_224740 ) ) ( not ( = ?auto_224738 ?auto_224741 ) ) ( not ( = ?auto_224738 ?auto_224742 ) ) ( not ( = ?auto_224739 ?auto_224740 ) ) ( not ( = ?auto_224739 ?auto_224741 ) ) ( not ( = ?auto_224739 ?auto_224742 ) ) ( not ( = ?auto_224740 ?auto_224741 ) ) ( not ( = ?auto_224740 ?auto_224742 ) ) ( not ( = ?auto_224741 ?auto_224742 ) ) ( ON ?auto_224740 ?auto_224741 ) ( ON ?auto_224739 ?auto_224740 ) ( ON ?auto_224738 ?auto_224739 ) ( ON ?auto_224737 ?auto_224738 ) ( CLEAR ?auto_224735 ) ( ON ?auto_224736 ?auto_224737 ) ( CLEAR ?auto_224736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_224731 ?auto_224732 ?auto_224733 ?auto_224734 ?auto_224735 ?auto_224736 )
      ( MAKE-11PILE ?auto_224731 ?auto_224732 ?auto_224733 ?auto_224734 ?auto_224735 ?auto_224736 ?auto_224737 ?auto_224738 ?auto_224739 ?auto_224740 ?auto_224741 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224777 - BLOCK
      ?auto_224778 - BLOCK
      ?auto_224779 - BLOCK
      ?auto_224780 - BLOCK
      ?auto_224781 - BLOCK
      ?auto_224782 - BLOCK
      ?auto_224783 - BLOCK
      ?auto_224784 - BLOCK
      ?auto_224785 - BLOCK
      ?auto_224786 - BLOCK
      ?auto_224787 - BLOCK
    )
    :vars
    (
      ?auto_224788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224787 ?auto_224788 ) ( ON-TABLE ?auto_224777 ) ( ON ?auto_224778 ?auto_224777 ) ( ON ?auto_224779 ?auto_224778 ) ( ON ?auto_224780 ?auto_224779 ) ( not ( = ?auto_224777 ?auto_224778 ) ) ( not ( = ?auto_224777 ?auto_224779 ) ) ( not ( = ?auto_224777 ?auto_224780 ) ) ( not ( = ?auto_224777 ?auto_224781 ) ) ( not ( = ?auto_224777 ?auto_224782 ) ) ( not ( = ?auto_224777 ?auto_224783 ) ) ( not ( = ?auto_224777 ?auto_224784 ) ) ( not ( = ?auto_224777 ?auto_224785 ) ) ( not ( = ?auto_224777 ?auto_224786 ) ) ( not ( = ?auto_224777 ?auto_224787 ) ) ( not ( = ?auto_224777 ?auto_224788 ) ) ( not ( = ?auto_224778 ?auto_224779 ) ) ( not ( = ?auto_224778 ?auto_224780 ) ) ( not ( = ?auto_224778 ?auto_224781 ) ) ( not ( = ?auto_224778 ?auto_224782 ) ) ( not ( = ?auto_224778 ?auto_224783 ) ) ( not ( = ?auto_224778 ?auto_224784 ) ) ( not ( = ?auto_224778 ?auto_224785 ) ) ( not ( = ?auto_224778 ?auto_224786 ) ) ( not ( = ?auto_224778 ?auto_224787 ) ) ( not ( = ?auto_224778 ?auto_224788 ) ) ( not ( = ?auto_224779 ?auto_224780 ) ) ( not ( = ?auto_224779 ?auto_224781 ) ) ( not ( = ?auto_224779 ?auto_224782 ) ) ( not ( = ?auto_224779 ?auto_224783 ) ) ( not ( = ?auto_224779 ?auto_224784 ) ) ( not ( = ?auto_224779 ?auto_224785 ) ) ( not ( = ?auto_224779 ?auto_224786 ) ) ( not ( = ?auto_224779 ?auto_224787 ) ) ( not ( = ?auto_224779 ?auto_224788 ) ) ( not ( = ?auto_224780 ?auto_224781 ) ) ( not ( = ?auto_224780 ?auto_224782 ) ) ( not ( = ?auto_224780 ?auto_224783 ) ) ( not ( = ?auto_224780 ?auto_224784 ) ) ( not ( = ?auto_224780 ?auto_224785 ) ) ( not ( = ?auto_224780 ?auto_224786 ) ) ( not ( = ?auto_224780 ?auto_224787 ) ) ( not ( = ?auto_224780 ?auto_224788 ) ) ( not ( = ?auto_224781 ?auto_224782 ) ) ( not ( = ?auto_224781 ?auto_224783 ) ) ( not ( = ?auto_224781 ?auto_224784 ) ) ( not ( = ?auto_224781 ?auto_224785 ) ) ( not ( = ?auto_224781 ?auto_224786 ) ) ( not ( = ?auto_224781 ?auto_224787 ) ) ( not ( = ?auto_224781 ?auto_224788 ) ) ( not ( = ?auto_224782 ?auto_224783 ) ) ( not ( = ?auto_224782 ?auto_224784 ) ) ( not ( = ?auto_224782 ?auto_224785 ) ) ( not ( = ?auto_224782 ?auto_224786 ) ) ( not ( = ?auto_224782 ?auto_224787 ) ) ( not ( = ?auto_224782 ?auto_224788 ) ) ( not ( = ?auto_224783 ?auto_224784 ) ) ( not ( = ?auto_224783 ?auto_224785 ) ) ( not ( = ?auto_224783 ?auto_224786 ) ) ( not ( = ?auto_224783 ?auto_224787 ) ) ( not ( = ?auto_224783 ?auto_224788 ) ) ( not ( = ?auto_224784 ?auto_224785 ) ) ( not ( = ?auto_224784 ?auto_224786 ) ) ( not ( = ?auto_224784 ?auto_224787 ) ) ( not ( = ?auto_224784 ?auto_224788 ) ) ( not ( = ?auto_224785 ?auto_224786 ) ) ( not ( = ?auto_224785 ?auto_224787 ) ) ( not ( = ?auto_224785 ?auto_224788 ) ) ( not ( = ?auto_224786 ?auto_224787 ) ) ( not ( = ?auto_224786 ?auto_224788 ) ) ( not ( = ?auto_224787 ?auto_224788 ) ) ( ON ?auto_224786 ?auto_224787 ) ( ON ?auto_224785 ?auto_224786 ) ( ON ?auto_224784 ?auto_224785 ) ( ON ?auto_224783 ?auto_224784 ) ( ON ?auto_224782 ?auto_224783 ) ( CLEAR ?auto_224780 ) ( ON ?auto_224781 ?auto_224782 ) ( CLEAR ?auto_224781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_224777 ?auto_224778 ?auto_224779 ?auto_224780 ?auto_224781 )
      ( MAKE-11PILE ?auto_224777 ?auto_224778 ?auto_224779 ?auto_224780 ?auto_224781 ?auto_224782 ?auto_224783 ?auto_224784 ?auto_224785 ?auto_224786 ?auto_224787 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224823 - BLOCK
      ?auto_224824 - BLOCK
      ?auto_224825 - BLOCK
      ?auto_224826 - BLOCK
      ?auto_224827 - BLOCK
      ?auto_224828 - BLOCK
      ?auto_224829 - BLOCK
      ?auto_224830 - BLOCK
      ?auto_224831 - BLOCK
      ?auto_224832 - BLOCK
      ?auto_224833 - BLOCK
    )
    :vars
    (
      ?auto_224834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224833 ?auto_224834 ) ( ON-TABLE ?auto_224823 ) ( ON ?auto_224824 ?auto_224823 ) ( ON ?auto_224825 ?auto_224824 ) ( not ( = ?auto_224823 ?auto_224824 ) ) ( not ( = ?auto_224823 ?auto_224825 ) ) ( not ( = ?auto_224823 ?auto_224826 ) ) ( not ( = ?auto_224823 ?auto_224827 ) ) ( not ( = ?auto_224823 ?auto_224828 ) ) ( not ( = ?auto_224823 ?auto_224829 ) ) ( not ( = ?auto_224823 ?auto_224830 ) ) ( not ( = ?auto_224823 ?auto_224831 ) ) ( not ( = ?auto_224823 ?auto_224832 ) ) ( not ( = ?auto_224823 ?auto_224833 ) ) ( not ( = ?auto_224823 ?auto_224834 ) ) ( not ( = ?auto_224824 ?auto_224825 ) ) ( not ( = ?auto_224824 ?auto_224826 ) ) ( not ( = ?auto_224824 ?auto_224827 ) ) ( not ( = ?auto_224824 ?auto_224828 ) ) ( not ( = ?auto_224824 ?auto_224829 ) ) ( not ( = ?auto_224824 ?auto_224830 ) ) ( not ( = ?auto_224824 ?auto_224831 ) ) ( not ( = ?auto_224824 ?auto_224832 ) ) ( not ( = ?auto_224824 ?auto_224833 ) ) ( not ( = ?auto_224824 ?auto_224834 ) ) ( not ( = ?auto_224825 ?auto_224826 ) ) ( not ( = ?auto_224825 ?auto_224827 ) ) ( not ( = ?auto_224825 ?auto_224828 ) ) ( not ( = ?auto_224825 ?auto_224829 ) ) ( not ( = ?auto_224825 ?auto_224830 ) ) ( not ( = ?auto_224825 ?auto_224831 ) ) ( not ( = ?auto_224825 ?auto_224832 ) ) ( not ( = ?auto_224825 ?auto_224833 ) ) ( not ( = ?auto_224825 ?auto_224834 ) ) ( not ( = ?auto_224826 ?auto_224827 ) ) ( not ( = ?auto_224826 ?auto_224828 ) ) ( not ( = ?auto_224826 ?auto_224829 ) ) ( not ( = ?auto_224826 ?auto_224830 ) ) ( not ( = ?auto_224826 ?auto_224831 ) ) ( not ( = ?auto_224826 ?auto_224832 ) ) ( not ( = ?auto_224826 ?auto_224833 ) ) ( not ( = ?auto_224826 ?auto_224834 ) ) ( not ( = ?auto_224827 ?auto_224828 ) ) ( not ( = ?auto_224827 ?auto_224829 ) ) ( not ( = ?auto_224827 ?auto_224830 ) ) ( not ( = ?auto_224827 ?auto_224831 ) ) ( not ( = ?auto_224827 ?auto_224832 ) ) ( not ( = ?auto_224827 ?auto_224833 ) ) ( not ( = ?auto_224827 ?auto_224834 ) ) ( not ( = ?auto_224828 ?auto_224829 ) ) ( not ( = ?auto_224828 ?auto_224830 ) ) ( not ( = ?auto_224828 ?auto_224831 ) ) ( not ( = ?auto_224828 ?auto_224832 ) ) ( not ( = ?auto_224828 ?auto_224833 ) ) ( not ( = ?auto_224828 ?auto_224834 ) ) ( not ( = ?auto_224829 ?auto_224830 ) ) ( not ( = ?auto_224829 ?auto_224831 ) ) ( not ( = ?auto_224829 ?auto_224832 ) ) ( not ( = ?auto_224829 ?auto_224833 ) ) ( not ( = ?auto_224829 ?auto_224834 ) ) ( not ( = ?auto_224830 ?auto_224831 ) ) ( not ( = ?auto_224830 ?auto_224832 ) ) ( not ( = ?auto_224830 ?auto_224833 ) ) ( not ( = ?auto_224830 ?auto_224834 ) ) ( not ( = ?auto_224831 ?auto_224832 ) ) ( not ( = ?auto_224831 ?auto_224833 ) ) ( not ( = ?auto_224831 ?auto_224834 ) ) ( not ( = ?auto_224832 ?auto_224833 ) ) ( not ( = ?auto_224832 ?auto_224834 ) ) ( not ( = ?auto_224833 ?auto_224834 ) ) ( ON ?auto_224832 ?auto_224833 ) ( ON ?auto_224831 ?auto_224832 ) ( ON ?auto_224830 ?auto_224831 ) ( ON ?auto_224829 ?auto_224830 ) ( ON ?auto_224828 ?auto_224829 ) ( ON ?auto_224827 ?auto_224828 ) ( CLEAR ?auto_224825 ) ( ON ?auto_224826 ?auto_224827 ) ( CLEAR ?auto_224826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_224823 ?auto_224824 ?auto_224825 ?auto_224826 )
      ( MAKE-11PILE ?auto_224823 ?auto_224824 ?auto_224825 ?auto_224826 ?auto_224827 ?auto_224828 ?auto_224829 ?auto_224830 ?auto_224831 ?auto_224832 ?auto_224833 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224869 - BLOCK
      ?auto_224870 - BLOCK
      ?auto_224871 - BLOCK
      ?auto_224872 - BLOCK
      ?auto_224873 - BLOCK
      ?auto_224874 - BLOCK
      ?auto_224875 - BLOCK
      ?auto_224876 - BLOCK
      ?auto_224877 - BLOCK
      ?auto_224878 - BLOCK
      ?auto_224879 - BLOCK
    )
    :vars
    (
      ?auto_224880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224879 ?auto_224880 ) ( ON-TABLE ?auto_224869 ) ( ON ?auto_224870 ?auto_224869 ) ( not ( = ?auto_224869 ?auto_224870 ) ) ( not ( = ?auto_224869 ?auto_224871 ) ) ( not ( = ?auto_224869 ?auto_224872 ) ) ( not ( = ?auto_224869 ?auto_224873 ) ) ( not ( = ?auto_224869 ?auto_224874 ) ) ( not ( = ?auto_224869 ?auto_224875 ) ) ( not ( = ?auto_224869 ?auto_224876 ) ) ( not ( = ?auto_224869 ?auto_224877 ) ) ( not ( = ?auto_224869 ?auto_224878 ) ) ( not ( = ?auto_224869 ?auto_224879 ) ) ( not ( = ?auto_224869 ?auto_224880 ) ) ( not ( = ?auto_224870 ?auto_224871 ) ) ( not ( = ?auto_224870 ?auto_224872 ) ) ( not ( = ?auto_224870 ?auto_224873 ) ) ( not ( = ?auto_224870 ?auto_224874 ) ) ( not ( = ?auto_224870 ?auto_224875 ) ) ( not ( = ?auto_224870 ?auto_224876 ) ) ( not ( = ?auto_224870 ?auto_224877 ) ) ( not ( = ?auto_224870 ?auto_224878 ) ) ( not ( = ?auto_224870 ?auto_224879 ) ) ( not ( = ?auto_224870 ?auto_224880 ) ) ( not ( = ?auto_224871 ?auto_224872 ) ) ( not ( = ?auto_224871 ?auto_224873 ) ) ( not ( = ?auto_224871 ?auto_224874 ) ) ( not ( = ?auto_224871 ?auto_224875 ) ) ( not ( = ?auto_224871 ?auto_224876 ) ) ( not ( = ?auto_224871 ?auto_224877 ) ) ( not ( = ?auto_224871 ?auto_224878 ) ) ( not ( = ?auto_224871 ?auto_224879 ) ) ( not ( = ?auto_224871 ?auto_224880 ) ) ( not ( = ?auto_224872 ?auto_224873 ) ) ( not ( = ?auto_224872 ?auto_224874 ) ) ( not ( = ?auto_224872 ?auto_224875 ) ) ( not ( = ?auto_224872 ?auto_224876 ) ) ( not ( = ?auto_224872 ?auto_224877 ) ) ( not ( = ?auto_224872 ?auto_224878 ) ) ( not ( = ?auto_224872 ?auto_224879 ) ) ( not ( = ?auto_224872 ?auto_224880 ) ) ( not ( = ?auto_224873 ?auto_224874 ) ) ( not ( = ?auto_224873 ?auto_224875 ) ) ( not ( = ?auto_224873 ?auto_224876 ) ) ( not ( = ?auto_224873 ?auto_224877 ) ) ( not ( = ?auto_224873 ?auto_224878 ) ) ( not ( = ?auto_224873 ?auto_224879 ) ) ( not ( = ?auto_224873 ?auto_224880 ) ) ( not ( = ?auto_224874 ?auto_224875 ) ) ( not ( = ?auto_224874 ?auto_224876 ) ) ( not ( = ?auto_224874 ?auto_224877 ) ) ( not ( = ?auto_224874 ?auto_224878 ) ) ( not ( = ?auto_224874 ?auto_224879 ) ) ( not ( = ?auto_224874 ?auto_224880 ) ) ( not ( = ?auto_224875 ?auto_224876 ) ) ( not ( = ?auto_224875 ?auto_224877 ) ) ( not ( = ?auto_224875 ?auto_224878 ) ) ( not ( = ?auto_224875 ?auto_224879 ) ) ( not ( = ?auto_224875 ?auto_224880 ) ) ( not ( = ?auto_224876 ?auto_224877 ) ) ( not ( = ?auto_224876 ?auto_224878 ) ) ( not ( = ?auto_224876 ?auto_224879 ) ) ( not ( = ?auto_224876 ?auto_224880 ) ) ( not ( = ?auto_224877 ?auto_224878 ) ) ( not ( = ?auto_224877 ?auto_224879 ) ) ( not ( = ?auto_224877 ?auto_224880 ) ) ( not ( = ?auto_224878 ?auto_224879 ) ) ( not ( = ?auto_224878 ?auto_224880 ) ) ( not ( = ?auto_224879 ?auto_224880 ) ) ( ON ?auto_224878 ?auto_224879 ) ( ON ?auto_224877 ?auto_224878 ) ( ON ?auto_224876 ?auto_224877 ) ( ON ?auto_224875 ?auto_224876 ) ( ON ?auto_224874 ?auto_224875 ) ( ON ?auto_224873 ?auto_224874 ) ( ON ?auto_224872 ?auto_224873 ) ( CLEAR ?auto_224870 ) ( ON ?auto_224871 ?auto_224872 ) ( CLEAR ?auto_224871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_224869 ?auto_224870 ?auto_224871 )
      ( MAKE-11PILE ?auto_224869 ?auto_224870 ?auto_224871 ?auto_224872 ?auto_224873 ?auto_224874 ?auto_224875 ?auto_224876 ?auto_224877 ?auto_224878 ?auto_224879 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224915 - BLOCK
      ?auto_224916 - BLOCK
      ?auto_224917 - BLOCK
      ?auto_224918 - BLOCK
      ?auto_224919 - BLOCK
      ?auto_224920 - BLOCK
      ?auto_224921 - BLOCK
      ?auto_224922 - BLOCK
      ?auto_224923 - BLOCK
      ?auto_224924 - BLOCK
      ?auto_224925 - BLOCK
    )
    :vars
    (
      ?auto_224926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224925 ?auto_224926 ) ( ON-TABLE ?auto_224915 ) ( not ( = ?auto_224915 ?auto_224916 ) ) ( not ( = ?auto_224915 ?auto_224917 ) ) ( not ( = ?auto_224915 ?auto_224918 ) ) ( not ( = ?auto_224915 ?auto_224919 ) ) ( not ( = ?auto_224915 ?auto_224920 ) ) ( not ( = ?auto_224915 ?auto_224921 ) ) ( not ( = ?auto_224915 ?auto_224922 ) ) ( not ( = ?auto_224915 ?auto_224923 ) ) ( not ( = ?auto_224915 ?auto_224924 ) ) ( not ( = ?auto_224915 ?auto_224925 ) ) ( not ( = ?auto_224915 ?auto_224926 ) ) ( not ( = ?auto_224916 ?auto_224917 ) ) ( not ( = ?auto_224916 ?auto_224918 ) ) ( not ( = ?auto_224916 ?auto_224919 ) ) ( not ( = ?auto_224916 ?auto_224920 ) ) ( not ( = ?auto_224916 ?auto_224921 ) ) ( not ( = ?auto_224916 ?auto_224922 ) ) ( not ( = ?auto_224916 ?auto_224923 ) ) ( not ( = ?auto_224916 ?auto_224924 ) ) ( not ( = ?auto_224916 ?auto_224925 ) ) ( not ( = ?auto_224916 ?auto_224926 ) ) ( not ( = ?auto_224917 ?auto_224918 ) ) ( not ( = ?auto_224917 ?auto_224919 ) ) ( not ( = ?auto_224917 ?auto_224920 ) ) ( not ( = ?auto_224917 ?auto_224921 ) ) ( not ( = ?auto_224917 ?auto_224922 ) ) ( not ( = ?auto_224917 ?auto_224923 ) ) ( not ( = ?auto_224917 ?auto_224924 ) ) ( not ( = ?auto_224917 ?auto_224925 ) ) ( not ( = ?auto_224917 ?auto_224926 ) ) ( not ( = ?auto_224918 ?auto_224919 ) ) ( not ( = ?auto_224918 ?auto_224920 ) ) ( not ( = ?auto_224918 ?auto_224921 ) ) ( not ( = ?auto_224918 ?auto_224922 ) ) ( not ( = ?auto_224918 ?auto_224923 ) ) ( not ( = ?auto_224918 ?auto_224924 ) ) ( not ( = ?auto_224918 ?auto_224925 ) ) ( not ( = ?auto_224918 ?auto_224926 ) ) ( not ( = ?auto_224919 ?auto_224920 ) ) ( not ( = ?auto_224919 ?auto_224921 ) ) ( not ( = ?auto_224919 ?auto_224922 ) ) ( not ( = ?auto_224919 ?auto_224923 ) ) ( not ( = ?auto_224919 ?auto_224924 ) ) ( not ( = ?auto_224919 ?auto_224925 ) ) ( not ( = ?auto_224919 ?auto_224926 ) ) ( not ( = ?auto_224920 ?auto_224921 ) ) ( not ( = ?auto_224920 ?auto_224922 ) ) ( not ( = ?auto_224920 ?auto_224923 ) ) ( not ( = ?auto_224920 ?auto_224924 ) ) ( not ( = ?auto_224920 ?auto_224925 ) ) ( not ( = ?auto_224920 ?auto_224926 ) ) ( not ( = ?auto_224921 ?auto_224922 ) ) ( not ( = ?auto_224921 ?auto_224923 ) ) ( not ( = ?auto_224921 ?auto_224924 ) ) ( not ( = ?auto_224921 ?auto_224925 ) ) ( not ( = ?auto_224921 ?auto_224926 ) ) ( not ( = ?auto_224922 ?auto_224923 ) ) ( not ( = ?auto_224922 ?auto_224924 ) ) ( not ( = ?auto_224922 ?auto_224925 ) ) ( not ( = ?auto_224922 ?auto_224926 ) ) ( not ( = ?auto_224923 ?auto_224924 ) ) ( not ( = ?auto_224923 ?auto_224925 ) ) ( not ( = ?auto_224923 ?auto_224926 ) ) ( not ( = ?auto_224924 ?auto_224925 ) ) ( not ( = ?auto_224924 ?auto_224926 ) ) ( not ( = ?auto_224925 ?auto_224926 ) ) ( ON ?auto_224924 ?auto_224925 ) ( ON ?auto_224923 ?auto_224924 ) ( ON ?auto_224922 ?auto_224923 ) ( ON ?auto_224921 ?auto_224922 ) ( ON ?auto_224920 ?auto_224921 ) ( ON ?auto_224919 ?auto_224920 ) ( ON ?auto_224918 ?auto_224919 ) ( ON ?auto_224917 ?auto_224918 ) ( CLEAR ?auto_224915 ) ( ON ?auto_224916 ?auto_224917 ) ( CLEAR ?auto_224916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_224915 ?auto_224916 )
      ( MAKE-11PILE ?auto_224915 ?auto_224916 ?auto_224917 ?auto_224918 ?auto_224919 ?auto_224920 ?auto_224921 ?auto_224922 ?auto_224923 ?auto_224924 ?auto_224925 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_224961 - BLOCK
      ?auto_224962 - BLOCK
      ?auto_224963 - BLOCK
      ?auto_224964 - BLOCK
      ?auto_224965 - BLOCK
      ?auto_224966 - BLOCK
      ?auto_224967 - BLOCK
      ?auto_224968 - BLOCK
      ?auto_224969 - BLOCK
      ?auto_224970 - BLOCK
      ?auto_224971 - BLOCK
    )
    :vars
    (
      ?auto_224972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_224971 ?auto_224972 ) ( not ( = ?auto_224961 ?auto_224962 ) ) ( not ( = ?auto_224961 ?auto_224963 ) ) ( not ( = ?auto_224961 ?auto_224964 ) ) ( not ( = ?auto_224961 ?auto_224965 ) ) ( not ( = ?auto_224961 ?auto_224966 ) ) ( not ( = ?auto_224961 ?auto_224967 ) ) ( not ( = ?auto_224961 ?auto_224968 ) ) ( not ( = ?auto_224961 ?auto_224969 ) ) ( not ( = ?auto_224961 ?auto_224970 ) ) ( not ( = ?auto_224961 ?auto_224971 ) ) ( not ( = ?auto_224961 ?auto_224972 ) ) ( not ( = ?auto_224962 ?auto_224963 ) ) ( not ( = ?auto_224962 ?auto_224964 ) ) ( not ( = ?auto_224962 ?auto_224965 ) ) ( not ( = ?auto_224962 ?auto_224966 ) ) ( not ( = ?auto_224962 ?auto_224967 ) ) ( not ( = ?auto_224962 ?auto_224968 ) ) ( not ( = ?auto_224962 ?auto_224969 ) ) ( not ( = ?auto_224962 ?auto_224970 ) ) ( not ( = ?auto_224962 ?auto_224971 ) ) ( not ( = ?auto_224962 ?auto_224972 ) ) ( not ( = ?auto_224963 ?auto_224964 ) ) ( not ( = ?auto_224963 ?auto_224965 ) ) ( not ( = ?auto_224963 ?auto_224966 ) ) ( not ( = ?auto_224963 ?auto_224967 ) ) ( not ( = ?auto_224963 ?auto_224968 ) ) ( not ( = ?auto_224963 ?auto_224969 ) ) ( not ( = ?auto_224963 ?auto_224970 ) ) ( not ( = ?auto_224963 ?auto_224971 ) ) ( not ( = ?auto_224963 ?auto_224972 ) ) ( not ( = ?auto_224964 ?auto_224965 ) ) ( not ( = ?auto_224964 ?auto_224966 ) ) ( not ( = ?auto_224964 ?auto_224967 ) ) ( not ( = ?auto_224964 ?auto_224968 ) ) ( not ( = ?auto_224964 ?auto_224969 ) ) ( not ( = ?auto_224964 ?auto_224970 ) ) ( not ( = ?auto_224964 ?auto_224971 ) ) ( not ( = ?auto_224964 ?auto_224972 ) ) ( not ( = ?auto_224965 ?auto_224966 ) ) ( not ( = ?auto_224965 ?auto_224967 ) ) ( not ( = ?auto_224965 ?auto_224968 ) ) ( not ( = ?auto_224965 ?auto_224969 ) ) ( not ( = ?auto_224965 ?auto_224970 ) ) ( not ( = ?auto_224965 ?auto_224971 ) ) ( not ( = ?auto_224965 ?auto_224972 ) ) ( not ( = ?auto_224966 ?auto_224967 ) ) ( not ( = ?auto_224966 ?auto_224968 ) ) ( not ( = ?auto_224966 ?auto_224969 ) ) ( not ( = ?auto_224966 ?auto_224970 ) ) ( not ( = ?auto_224966 ?auto_224971 ) ) ( not ( = ?auto_224966 ?auto_224972 ) ) ( not ( = ?auto_224967 ?auto_224968 ) ) ( not ( = ?auto_224967 ?auto_224969 ) ) ( not ( = ?auto_224967 ?auto_224970 ) ) ( not ( = ?auto_224967 ?auto_224971 ) ) ( not ( = ?auto_224967 ?auto_224972 ) ) ( not ( = ?auto_224968 ?auto_224969 ) ) ( not ( = ?auto_224968 ?auto_224970 ) ) ( not ( = ?auto_224968 ?auto_224971 ) ) ( not ( = ?auto_224968 ?auto_224972 ) ) ( not ( = ?auto_224969 ?auto_224970 ) ) ( not ( = ?auto_224969 ?auto_224971 ) ) ( not ( = ?auto_224969 ?auto_224972 ) ) ( not ( = ?auto_224970 ?auto_224971 ) ) ( not ( = ?auto_224970 ?auto_224972 ) ) ( not ( = ?auto_224971 ?auto_224972 ) ) ( ON ?auto_224970 ?auto_224971 ) ( ON ?auto_224969 ?auto_224970 ) ( ON ?auto_224968 ?auto_224969 ) ( ON ?auto_224967 ?auto_224968 ) ( ON ?auto_224966 ?auto_224967 ) ( ON ?auto_224965 ?auto_224966 ) ( ON ?auto_224964 ?auto_224965 ) ( ON ?auto_224963 ?auto_224964 ) ( ON ?auto_224962 ?auto_224963 ) ( ON ?auto_224961 ?auto_224962 ) ( CLEAR ?auto_224961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_224961 )
      ( MAKE-11PILE ?auto_224961 ?auto_224962 ?auto_224963 ?auto_224964 ?auto_224965 ?auto_224966 ?auto_224967 ?auto_224968 ?auto_224969 ?auto_224970 ?auto_224971 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225008 - BLOCK
      ?auto_225009 - BLOCK
      ?auto_225010 - BLOCK
      ?auto_225011 - BLOCK
      ?auto_225012 - BLOCK
      ?auto_225013 - BLOCK
      ?auto_225014 - BLOCK
      ?auto_225015 - BLOCK
      ?auto_225016 - BLOCK
      ?auto_225017 - BLOCK
      ?auto_225018 - BLOCK
      ?auto_225019 - BLOCK
    )
    :vars
    (
      ?auto_225020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_225018 ) ( ON ?auto_225019 ?auto_225020 ) ( CLEAR ?auto_225019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_225008 ) ( ON ?auto_225009 ?auto_225008 ) ( ON ?auto_225010 ?auto_225009 ) ( ON ?auto_225011 ?auto_225010 ) ( ON ?auto_225012 ?auto_225011 ) ( ON ?auto_225013 ?auto_225012 ) ( ON ?auto_225014 ?auto_225013 ) ( ON ?auto_225015 ?auto_225014 ) ( ON ?auto_225016 ?auto_225015 ) ( ON ?auto_225017 ?auto_225016 ) ( ON ?auto_225018 ?auto_225017 ) ( not ( = ?auto_225008 ?auto_225009 ) ) ( not ( = ?auto_225008 ?auto_225010 ) ) ( not ( = ?auto_225008 ?auto_225011 ) ) ( not ( = ?auto_225008 ?auto_225012 ) ) ( not ( = ?auto_225008 ?auto_225013 ) ) ( not ( = ?auto_225008 ?auto_225014 ) ) ( not ( = ?auto_225008 ?auto_225015 ) ) ( not ( = ?auto_225008 ?auto_225016 ) ) ( not ( = ?auto_225008 ?auto_225017 ) ) ( not ( = ?auto_225008 ?auto_225018 ) ) ( not ( = ?auto_225008 ?auto_225019 ) ) ( not ( = ?auto_225008 ?auto_225020 ) ) ( not ( = ?auto_225009 ?auto_225010 ) ) ( not ( = ?auto_225009 ?auto_225011 ) ) ( not ( = ?auto_225009 ?auto_225012 ) ) ( not ( = ?auto_225009 ?auto_225013 ) ) ( not ( = ?auto_225009 ?auto_225014 ) ) ( not ( = ?auto_225009 ?auto_225015 ) ) ( not ( = ?auto_225009 ?auto_225016 ) ) ( not ( = ?auto_225009 ?auto_225017 ) ) ( not ( = ?auto_225009 ?auto_225018 ) ) ( not ( = ?auto_225009 ?auto_225019 ) ) ( not ( = ?auto_225009 ?auto_225020 ) ) ( not ( = ?auto_225010 ?auto_225011 ) ) ( not ( = ?auto_225010 ?auto_225012 ) ) ( not ( = ?auto_225010 ?auto_225013 ) ) ( not ( = ?auto_225010 ?auto_225014 ) ) ( not ( = ?auto_225010 ?auto_225015 ) ) ( not ( = ?auto_225010 ?auto_225016 ) ) ( not ( = ?auto_225010 ?auto_225017 ) ) ( not ( = ?auto_225010 ?auto_225018 ) ) ( not ( = ?auto_225010 ?auto_225019 ) ) ( not ( = ?auto_225010 ?auto_225020 ) ) ( not ( = ?auto_225011 ?auto_225012 ) ) ( not ( = ?auto_225011 ?auto_225013 ) ) ( not ( = ?auto_225011 ?auto_225014 ) ) ( not ( = ?auto_225011 ?auto_225015 ) ) ( not ( = ?auto_225011 ?auto_225016 ) ) ( not ( = ?auto_225011 ?auto_225017 ) ) ( not ( = ?auto_225011 ?auto_225018 ) ) ( not ( = ?auto_225011 ?auto_225019 ) ) ( not ( = ?auto_225011 ?auto_225020 ) ) ( not ( = ?auto_225012 ?auto_225013 ) ) ( not ( = ?auto_225012 ?auto_225014 ) ) ( not ( = ?auto_225012 ?auto_225015 ) ) ( not ( = ?auto_225012 ?auto_225016 ) ) ( not ( = ?auto_225012 ?auto_225017 ) ) ( not ( = ?auto_225012 ?auto_225018 ) ) ( not ( = ?auto_225012 ?auto_225019 ) ) ( not ( = ?auto_225012 ?auto_225020 ) ) ( not ( = ?auto_225013 ?auto_225014 ) ) ( not ( = ?auto_225013 ?auto_225015 ) ) ( not ( = ?auto_225013 ?auto_225016 ) ) ( not ( = ?auto_225013 ?auto_225017 ) ) ( not ( = ?auto_225013 ?auto_225018 ) ) ( not ( = ?auto_225013 ?auto_225019 ) ) ( not ( = ?auto_225013 ?auto_225020 ) ) ( not ( = ?auto_225014 ?auto_225015 ) ) ( not ( = ?auto_225014 ?auto_225016 ) ) ( not ( = ?auto_225014 ?auto_225017 ) ) ( not ( = ?auto_225014 ?auto_225018 ) ) ( not ( = ?auto_225014 ?auto_225019 ) ) ( not ( = ?auto_225014 ?auto_225020 ) ) ( not ( = ?auto_225015 ?auto_225016 ) ) ( not ( = ?auto_225015 ?auto_225017 ) ) ( not ( = ?auto_225015 ?auto_225018 ) ) ( not ( = ?auto_225015 ?auto_225019 ) ) ( not ( = ?auto_225015 ?auto_225020 ) ) ( not ( = ?auto_225016 ?auto_225017 ) ) ( not ( = ?auto_225016 ?auto_225018 ) ) ( not ( = ?auto_225016 ?auto_225019 ) ) ( not ( = ?auto_225016 ?auto_225020 ) ) ( not ( = ?auto_225017 ?auto_225018 ) ) ( not ( = ?auto_225017 ?auto_225019 ) ) ( not ( = ?auto_225017 ?auto_225020 ) ) ( not ( = ?auto_225018 ?auto_225019 ) ) ( not ( = ?auto_225018 ?auto_225020 ) ) ( not ( = ?auto_225019 ?auto_225020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_225019 ?auto_225020 )
      ( !STACK ?auto_225019 ?auto_225018 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225058 - BLOCK
      ?auto_225059 - BLOCK
      ?auto_225060 - BLOCK
      ?auto_225061 - BLOCK
      ?auto_225062 - BLOCK
      ?auto_225063 - BLOCK
      ?auto_225064 - BLOCK
      ?auto_225065 - BLOCK
      ?auto_225066 - BLOCK
      ?auto_225067 - BLOCK
      ?auto_225068 - BLOCK
      ?auto_225069 - BLOCK
    )
    :vars
    (
      ?auto_225070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225069 ?auto_225070 ) ( ON-TABLE ?auto_225058 ) ( ON ?auto_225059 ?auto_225058 ) ( ON ?auto_225060 ?auto_225059 ) ( ON ?auto_225061 ?auto_225060 ) ( ON ?auto_225062 ?auto_225061 ) ( ON ?auto_225063 ?auto_225062 ) ( ON ?auto_225064 ?auto_225063 ) ( ON ?auto_225065 ?auto_225064 ) ( ON ?auto_225066 ?auto_225065 ) ( ON ?auto_225067 ?auto_225066 ) ( not ( = ?auto_225058 ?auto_225059 ) ) ( not ( = ?auto_225058 ?auto_225060 ) ) ( not ( = ?auto_225058 ?auto_225061 ) ) ( not ( = ?auto_225058 ?auto_225062 ) ) ( not ( = ?auto_225058 ?auto_225063 ) ) ( not ( = ?auto_225058 ?auto_225064 ) ) ( not ( = ?auto_225058 ?auto_225065 ) ) ( not ( = ?auto_225058 ?auto_225066 ) ) ( not ( = ?auto_225058 ?auto_225067 ) ) ( not ( = ?auto_225058 ?auto_225068 ) ) ( not ( = ?auto_225058 ?auto_225069 ) ) ( not ( = ?auto_225058 ?auto_225070 ) ) ( not ( = ?auto_225059 ?auto_225060 ) ) ( not ( = ?auto_225059 ?auto_225061 ) ) ( not ( = ?auto_225059 ?auto_225062 ) ) ( not ( = ?auto_225059 ?auto_225063 ) ) ( not ( = ?auto_225059 ?auto_225064 ) ) ( not ( = ?auto_225059 ?auto_225065 ) ) ( not ( = ?auto_225059 ?auto_225066 ) ) ( not ( = ?auto_225059 ?auto_225067 ) ) ( not ( = ?auto_225059 ?auto_225068 ) ) ( not ( = ?auto_225059 ?auto_225069 ) ) ( not ( = ?auto_225059 ?auto_225070 ) ) ( not ( = ?auto_225060 ?auto_225061 ) ) ( not ( = ?auto_225060 ?auto_225062 ) ) ( not ( = ?auto_225060 ?auto_225063 ) ) ( not ( = ?auto_225060 ?auto_225064 ) ) ( not ( = ?auto_225060 ?auto_225065 ) ) ( not ( = ?auto_225060 ?auto_225066 ) ) ( not ( = ?auto_225060 ?auto_225067 ) ) ( not ( = ?auto_225060 ?auto_225068 ) ) ( not ( = ?auto_225060 ?auto_225069 ) ) ( not ( = ?auto_225060 ?auto_225070 ) ) ( not ( = ?auto_225061 ?auto_225062 ) ) ( not ( = ?auto_225061 ?auto_225063 ) ) ( not ( = ?auto_225061 ?auto_225064 ) ) ( not ( = ?auto_225061 ?auto_225065 ) ) ( not ( = ?auto_225061 ?auto_225066 ) ) ( not ( = ?auto_225061 ?auto_225067 ) ) ( not ( = ?auto_225061 ?auto_225068 ) ) ( not ( = ?auto_225061 ?auto_225069 ) ) ( not ( = ?auto_225061 ?auto_225070 ) ) ( not ( = ?auto_225062 ?auto_225063 ) ) ( not ( = ?auto_225062 ?auto_225064 ) ) ( not ( = ?auto_225062 ?auto_225065 ) ) ( not ( = ?auto_225062 ?auto_225066 ) ) ( not ( = ?auto_225062 ?auto_225067 ) ) ( not ( = ?auto_225062 ?auto_225068 ) ) ( not ( = ?auto_225062 ?auto_225069 ) ) ( not ( = ?auto_225062 ?auto_225070 ) ) ( not ( = ?auto_225063 ?auto_225064 ) ) ( not ( = ?auto_225063 ?auto_225065 ) ) ( not ( = ?auto_225063 ?auto_225066 ) ) ( not ( = ?auto_225063 ?auto_225067 ) ) ( not ( = ?auto_225063 ?auto_225068 ) ) ( not ( = ?auto_225063 ?auto_225069 ) ) ( not ( = ?auto_225063 ?auto_225070 ) ) ( not ( = ?auto_225064 ?auto_225065 ) ) ( not ( = ?auto_225064 ?auto_225066 ) ) ( not ( = ?auto_225064 ?auto_225067 ) ) ( not ( = ?auto_225064 ?auto_225068 ) ) ( not ( = ?auto_225064 ?auto_225069 ) ) ( not ( = ?auto_225064 ?auto_225070 ) ) ( not ( = ?auto_225065 ?auto_225066 ) ) ( not ( = ?auto_225065 ?auto_225067 ) ) ( not ( = ?auto_225065 ?auto_225068 ) ) ( not ( = ?auto_225065 ?auto_225069 ) ) ( not ( = ?auto_225065 ?auto_225070 ) ) ( not ( = ?auto_225066 ?auto_225067 ) ) ( not ( = ?auto_225066 ?auto_225068 ) ) ( not ( = ?auto_225066 ?auto_225069 ) ) ( not ( = ?auto_225066 ?auto_225070 ) ) ( not ( = ?auto_225067 ?auto_225068 ) ) ( not ( = ?auto_225067 ?auto_225069 ) ) ( not ( = ?auto_225067 ?auto_225070 ) ) ( not ( = ?auto_225068 ?auto_225069 ) ) ( not ( = ?auto_225068 ?auto_225070 ) ) ( not ( = ?auto_225069 ?auto_225070 ) ) ( CLEAR ?auto_225067 ) ( ON ?auto_225068 ?auto_225069 ) ( CLEAR ?auto_225068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_225058 ?auto_225059 ?auto_225060 ?auto_225061 ?auto_225062 ?auto_225063 ?auto_225064 ?auto_225065 ?auto_225066 ?auto_225067 ?auto_225068 )
      ( MAKE-12PILE ?auto_225058 ?auto_225059 ?auto_225060 ?auto_225061 ?auto_225062 ?auto_225063 ?auto_225064 ?auto_225065 ?auto_225066 ?auto_225067 ?auto_225068 ?auto_225069 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225108 - BLOCK
      ?auto_225109 - BLOCK
      ?auto_225110 - BLOCK
      ?auto_225111 - BLOCK
      ?auto_225112 - BLOCK
      ?auto_225113 - BLOCK
      ?auto_225114 - BLOCK
      ?auto_225115 - BLOCK
      ?auto_225116 - BLOCK
      ?auto_225117 - BLOCK
      ?auto_225118 - BLOCK
      ?auto_225119 - BLOCK
    )
    :vars
    (
      ?auto_225120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225119 ?auto_225120 ) ( ON-TABLE ?auto_225108 ) ( ON ?auto_225109 ?auto_225108 ) ( ON ?auto_225110 ?auto_225109 ) ( ON ?auto_225111 ?auto_225110 ) ( ON ?auto_225112 ?auto_225111 ) ( ON ?auto_225113 ?auto_225112 ) ( ON ?auto_225114 ?auto_225113 ) ( ON ?auto_225115 ?auto_225114 ) ( ON ?auto_225116 ?auto_225115 ) ( not ( = ?auto_225108 ?auto_225109 ) ) ( not ( = ?auto_225108 ?auto_225110 ) ) ( not ( = ?auto_225108 ?auto_225111 ) ) ( not ( = ?auto_225108 ?auto_225112 ) ) ( not ( = ?auto_225108 ?auto_225113 ) ) ( not ( = ?auto_225108 ?auto_225114 ) ) ( not ( = ?auto_225108 ?auto_225115 ) ) ( not ( = ?auto_225108 ?auto_225116 ) ) ( not ( = ?auto_225108 ?auto_225117 ) ) ( not ( = ?auto_225108 ?auto_225118 ) ) ( not ( = ?auto_225108 ?auto_225119 ) ) ( not ( = ?auto_225108 ?auto_225120 ) ) ( not ( = ?auto_225109 ?auto_225110 ) ) ( not ( = ?auto_225109 ?auto_225111 ) ) ( not ( = ?auto_225109 ?auto_225112 ) ) ( not ( = ?auto_225109 ?auto_225113 ) ) ( not ( = ?auto_225109 ?auto_225114 ) ) ( not ( = ?auto_225109 ?auto_225115 ) ) ( not ( = ?auto_225109 ?auto_225116 ) ) ( not ( = ?auto_225109 ?auto_225117 ) ) ( not ( = ?auto_225109 ?auto_225118 ) ) ( not ( = ?auto_225109 ?auto_225119 ) ) ( not ( = ?auto_225109 ?auto_225120 ) ) ( not ( = ?auto_225110 ?auto_225111 ) ) ( not ( = ?auto_225110 ?auto_225112 ) ) ( not ( = ?auto_225110 ?auto_225113 ) ) ( not ( = ?auto_225110 ?auto_225114 ) ) ( not ( = ?auto_225110 ?auto_225115 ) ) ( not ( = ?auto_225110 ?auto_225116 ) ) ( not ( = ?auto_225110 ?auto_225117 ) ) ( not ( = ?auto_225110 ?auto_225118 ) ) ( not ( = ?auto_225110 ?auto_225119 ) ) ( not ( = ?auto_225110 ?auto_225120 ) ) ( not ( = ?auto_225111 ?auto_225112 ) ) ( not ( = ?auto_225111 ?auto_225113 ) ) ( not ( = ?auto_225111 ?auto_225114 ) ) ( not ( = ?auto_225111 ?auto_225115 ) ) ( not ( = ?auto_225111 ?auto_225116 ) ) ( not ( = ?auto_225111 ?auto_225117 ) ) ( not ( = ?auto_225111 ?auto_225118 ) ) ( not ( = ?auto_225111 ?auto_225119 ) ) ( not ( = ?auto_225111 ?auto_225120 ) ) ( not ( = ?auto_225112 ?auto_225113 ) ) ( not ( = ?auto_225112 ?auto_225114 ) ) ( not ( = ?auto_225112 ?auto_225115 ) ) ( not ( = ?auto_225112 ?auto_225116 ) ) ( not ( = ?auto_225112 ?auto_225117 ) ) ( not ( = ?auto_225112 ?auto_225118 ) ) ( not ( = ?auto_225112 ?auto_225119 ) ) ( not ( = ?auto_225112 ?auto_225120 ) ) ( not ( = ?auto_225113 ?auto_225114 ) ) ( not ( = ?auto_225113 ?auto_225115 ) ) ( not ( = ?auto_225113 ?auto_225116 ) ) ( not ( = ?auto_225113 ?auto_225117 ) ) ( not ( = ?auto_225113 ?auto_225118 ) ) ( not ( = ?auto_225113 ?auto_225119 ) ) ( not ( = ?auto_225113 ?auto_225120 ) ) ( not ( = ?auto_225114 ?auto_225115 ) ) ( not ( = ?auto_225114 ?auto_225116 ) ) ( not ( = ?auto_225114 ?auto_225117 ) ) ( not ( = ?auto_225114 ?auto_225118 ) ) ( not ( = ?auto_225114 ?auto_225119 ) ) ( not ( = ?auto_225114 ?auto_225120 ) ) ( not ( = ?auto_225115 ?auto_225116 ) ) ( not ( = ?auto_225115 ?auto_225117 ) ) ( not ( = ?auto_225115 ?auto_225118 ) ) ( not ( = ?auto_225115 ?auto_225119 ) ) ( not ( = ?auto_225115 ?auto_225120 ) ) ( not ( = ?auto_225116 ?auto_225117 ) ) ( not ( = ?auto_225116 ?auto_225118 ) ) ( not ( = ?auto_225116 ?auto_225119 ) ) ( not ( = ?auto_225116 ?auto_225120 ) ) ( not ( = ?auto_225117 ?auto_225118 ) ) ( not ( = ?auto_225117 ?auto_225119 ) ) ( not ( = ?auto_225117 ?auto_225120 ) ) ( not ( = ?auto_225118 ?auto_225119 ) ) ( not ( = ?auto_225118 ?auto_225120 ) ) ( not ( = ?auto_225119 ?auto_225120 ) ) ( ON ?auto_225118 ?auto_225119 ) ( CLEAR ?auto_225116 ) ( ON ?auto_225117 ?auto_225118 ) ( CLEAR ?auto_225117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_225108 ?auto_225109 ?auto_225110 ?auto_225111 ?auto_225112 ?auto_225113 ?auto_225114 ?auto_225115 ?auto_225116 ?auto_225117 )
      ( MAKE-12PILE ?auto_225108 ?auto_225109 ?auto_225110 ?auto_225111 ?auto_225112 ?auto_225113 ?auto_225114 ?auto_225115 ?auto_225116 ?auto_225117 ?auto_225118 ?auto_225119 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225158 - BLOCK
      ?auto_225159 - BLOCK
      ?auto_225160 - BLOCK
      ?auto_225161 - BLOCK
      ?auto_225162 - BLOCK
      ?auto_225163 - BLOCK
      ?auto_225164 - BLOCK
      ?auto_225165 - BLOCK
      ?auto_225166 - BLOCK
      ?auto_225167 - BLOCK
      ?auto_225168 - BLOCK
      ?auto_225169 - BLOCK
    )
    :vars
    (
      ?auto_225170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225169 ?auto_225170 ) ( ON-TABLE ?auto_225158 ) ( ON ?auto_225159 ?auto_225158 ) ( ON ?auto_225160 ?auto_225159 ) ( ON ?auto_225161 ?auto_225160 ) ( ON ?auto_225162 ?auto_225161 ) ( ON ?auto_225163 ?auto_225162 ) ( ON ?auto_225164 ?auto_225163 ) ( ON ?auto_225165 ?auto_225164 ) ( not ( = ?auto_225158 ?auto_225159 ) ) ( not ( = ?auto_225158 ?auto_225160 ) ) ( not ( = ?auto_225158 ?auto_225161 ) ) ( not ( = ?auto_225158 ?auto_225162 ) ) ( not ( = ?auto_225158 ?auto_225163 ) ) ( not ( = ?auto_225158 ?auto_225164 ) ) ( not ( = ?auto_225158 ?auto_225165 ) ) ( not ( = ?auto_225158 ?auto_225166 ) ) ( not ( = ?auto_225158 ?auto_225167 ) ) ( not ( = ?auto_225158 ?auto_225168 ) ) ( not ( = ?auto_225158 ?auto_225169 ) ) ( not ( = ?auto_225158 ?auto_225170 ) ) ( not ( = ?auto_225159 ?auto_225160 ) ) ( not ( = ?auto_225159 ?auto_225161 ) ) ( not ( = ?auto_225159 ?auto_225162 ) ) ( not ( = ?auto_225159 ?auto_225163 ) ) ( not ( = ?auto_225159 ?auto_225164 ) ) ( not ( = ?auto_225159 ?auto_225165 ) ) ( not ( = ?auto_225159 ?auto_225166 ) ) ( not ( = ?auto_225159 ?auto_225167 ) ) ( not ( = ?auto_225159 ?auto_225168 ) ) ( not ( = ?auto_225159 ?auto_225169 ) ) ( not ( = ?auto_225159 ?auto_225170 ) ) ( not ( = ?auto_225160 ?auto_225161 ) ) ( not ( = ?auto_225160 ?auto_225162 ) ) ( not ( = ?auto_225160 ?auto_225163 ) ) ( not ( = ?auto_225160 ?auto_225164 ) ) ( not ( = ?auto_225160 ?auto_225165 ) ) ( not ( = ?auto_225160 ?auto_225166 ) ) ( not ( = ?auto_225160 ?auto_225167 ) ) ( not ( = ?auto_225160 ?auto_225168 ) ) ( not ( = ?auto_225160 ?auto_225169 ) ) ( not ( = ?auto_225160 ?auto_225170 ) ) ( not ( = ?auto_225161 ?auto_225162 ) ) ( not ( = ?auto_225161 ?auto_225163 ) ) ( not ( = ?auto_225161 ?auto_225164 ) ) ( not ( = ?auto_225161 ?auto_225165 ) ) ( not ( = ?auto_225161 ?auto_225166 ) ) ( not ( = ?auto_225161 ?auto_225167 ) ) ( not ( = ?auto_225161 ?auto_225168 ) ) ( not ( = ?auto_225161 ?auto_225169 ) ) ( not ( = ?auto_225161 ?auto_225170 ) ) ( not ( = ?auto_225162 ?auto_225163 ) ) ( not ( = ?auto_225162 ?auto_225164 ) ) ( not ( = ?auto_225162 ?auto_225165 ) ) ( not ( = ?auto_225162 ?auto_225166 ) ) ( not ( = ?auto_225162 ?auto_225167 ) ) ( not ( = ?auto_225162 ?auto_225168 ) ) ( not ( = ?auto_225162 ?auto_225169 ) ) ( not ( = ?auto_225162 ?auto_225170 ) ) ( not ( = ?auto_225163 ?auto_225164 ) ) ( not ( = ?auto_225163 ?auto_225165 ) ) ( not ( = ?auto_225163 ?auto_225166 ) ) ( not ( = ?auto_225163 ?auto_225167 ) ) ( not ( = ?auto_225163 ?auto_225168 ) ) ( not ( = ?auto_225163 ?auto_225169 ) ) ( not ( = ?auto_225163 ?auto_225170 ) ) ( not ( = ?auto_225164 ?auto_225165 ) ) ( not ( = ?auto_225164 ?auto_225166 ) ) ( not ( = ?auto_225164 ?auto_225167 ) ) ( not ( = ?auto_225164 ?auto_225168 ) ) ( not ( = ?auto_225164 ?auto_225169 ) ) ( not ( = ?auto_225164 ?auto_225170 ) ) ( not ( = ?auto_225165 ?auto_225166 ) ) ( not ( = ?auto_225165 ?auto_225167 ) ) ( not ( = ?auto_225165 ?auto_225168 ) ) ( not ( = ?auto_225165 ?auto_225169 ) ) ( not ( = ?auto_225165 ?auto_225170 ) ) ( not ( = ?auto_225166 ?auto_225167 ) ) ( not ( = ?auto_225166 ?auto_225168 ) ) ( not ( = ?auto_225166 ?auto_225169 ) ) ( not ( = ?auto_225166 ?auto_225170 ) ) ( not ( = ?auto_225167 ?auto_225168 ) ) ( not ( = ?auto_225167 ?auto_225169 ) ) ( not ( = ?auto_225167 ?auto_225170 ) ) ( not ( = ?auto_225168 ?auto_225169 ) ) ( not ( = ?auto_225168 ?auto_225170 ) ) ( not ( = ?auto_225169 ?auto_225170 ) ) ( ON ?auto_225168 ?auto_225169 ) ( ON ?auto_225167 ?auto_225168 ) ( CLEAR ?auto_225165 ) ( ON ?auto_225166 ?auto_225167 ) ( CLEAR ?auto_225166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_225158 ?auto_225159 ?auto_225160 ?auto_225161 ?auto_225162 ?auto_225163 ?auto_225164 ?auto_225165 ?auto_225166 )
      ( MAKE-12PILE ?auto_225158 ?auto_225159 ?auto_225160 ?auto_225161 ?auto_225162 ?auto_225163 ?auto_225164 ?auto_225165 ?auto_225166 ?auto_225167 ?auto_225168 ?auto_225169 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225208 - BLOCK
      ?auto_225209 - BLOCK
      ?auto_225210 - BLOCK
      ?auto_225211 - BLOCK
      ?auto_225212 - BLOCK
      ?auto_225213 - BLOCK
      ?auto_225214 - BLOCK
      ?auto_225215 - BLOCK
      ?auto_225216 - BLOCK
      ?auto_225217 - BLOCK
      ?auto_225218 - BLOCK
      ?auto_225219 - BLOCK
    )
    :vars
    (
      ?auto_225220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225219 ?auto_225220 ) ( ON-TABLE ?auto_225208 ) ( ON ?auto_225209 ?auto_225208 ) ( ON ?auto_225210 ?auto_225209 ) ( ON ?auto_225211 ?auto_225210 ) ( ON ?auto_225212 ?auto_225211 ) ( ON ?auto_225213 ?auto_225212 ) ( ON ?auto_225214 ?auto_225213 ) ( not ( = ?auto_225208 ?auto_225209 ) ) ( not ( = ?auto_225208 ?auto_225210 ) ) ( not ( = ?auto_225208 ?auto_225211 ) ) ( not ( = ?auto_225208 ?auto_225212 ) ) ( not ( = ?auto_225208 ?auto_225213 ) ) ( not ( = ?auto_225208 ?auto_225214 ) ) ( not ( = ?auto_225208 ?auto_225215 ) ) ( not ( = ?auto_225208 ?auto_225216 ) ) ( not ( = ?auto_225208 ?auto_225217 ) ) ( not ( = ?auto_225208 ?auto_225218 ) ) ( not ( = ?auto_225208 ?auto_225219 ) ) ( not ( = ?auto_225208 ?auto_225220 ) ) ( not ( = ?auto_225209 ?auto_225210 ) ) ( not ( = ?auto_225209 ?auto_225211 ) ) ( not ( = ?auto_225209 ?auto_225212 ) ) ( not ( = ?auto_225209 ?auto_225213 ) ) ( not ( = ?auto_225209 ?auto_225214 ) ) ( not ( = ?auto_225209 ?auto_225215 ) ) ( not ( = ?auto_225209 ?auto_225216 ) ) ( not ( = ?auto_225209 ?auto_225217 ) ) ( not ( = ?auto_225209 ?auto_225218 ) ) ( not ( = ?auto_225209 ?auto_225219 ) ) ( not ( = ?auto_225209 ?auto_225220 ) ) ( not ( = ?auto_225210 ?auto_225211 ) ) ( not ( = ?auto_225210 ?auto_225212 ) ) ( not ( = ?auto_225210 ?auto_225213 ) ) ( not ( = ?auto_225210 ?auto_225214 ) ) ( not ( = ?auto_225210 ?auto_225215 ) ) ( not ( = ?auto_225210 ?auto_225216 ) ) ( not ( = ?auto_225210 ?auto_225217 ) ) ( not ( = ?auto_225210 ?auto_225218 ) ) ( not ( = ?auto_225210 ?auto_225219 ) ) ( not ( = ?auto_225210 ?auto_225220 ) ) ( not ( = ?auto_225211 ?auto_225212 ) ) ( not ( = ?auto_225211 ?auto_225213 ) ) ( not ( = ?auto_225211 ?auto_225214 ) ) ( not ( = ?auto_225211 ?auto_225215 ) ) ( not ( = ?auto_225211 ?auto_225216 ) ) ( not ( = ?auto_225211 ?auto_225217 ) ) ( not ( = ?auto_225211 ?auto_225218 ) ) ( not ( = ?auto_225211 ?auto_225219 ) ) ( not ( = ?auto_225211 ?auto_225220 ) ) ( not ( = ?auto_225212 ?auto_225213 ) ) ( not ( = ?auto_225212 ?auto_225214 ) ) ( not ( = ?auto_225212 ?auto_225215 ) ) ( not ( = ?auto_225212 ?auto_225216 ) ) ( not ( = ?auto_225212 ?auto_225217 ) ) ( not ( = ?auto_225212 ?auto_225218 ) ) ( not ( = ?auto_225212 ?auto_225219 ) ) ( not ( = ?auto_225212 ?auto_225220 ) ) ( not ( = ?auto_225213 ?auto_225214 ) ) ( not ( = ?auto_225213 ?auto_225215 ) ) ( not ( = ?auto_225213 ?auto_225216 ) ) ( not ( = ?auto_225213 ?auto_225217 ) ) ( not ( = ?auto_225213 ?auto_225218 ) ) ( not ( = ?auto_225213 ?auto_225219 ) ) ( not ( = ?auto_225213 ?auto_225220 ) ) ( not ( = ?auto_225214 ?auto_225215 ) ) ( not ( = ?auto_225214 ?auto_225216 ) ) ( not ( = ?auto_225214 ?auto_225217 ) ) ( not ( = ?auto_225214 ?auto_225218 ) ) ( not ( = ?auto_225214 ?auto_225219 ) ) ( not ( = ?auto_225214 ?auto_225220 ) ) ( not ( = ?auto_225215 ?auto_225216 ) ) ( not ( = ?auto_225215 ?auto_225217 ) ) ( not ( = ?auto_225215 ?auto_225218 ) ) ( not ( = ?auto_225215 ?auto_225219 ) ) ( not ( = ?auto_225215 ?auto_225220 ) ) ( not ( = ?auto_225216 ?auto_225217 ) ) ( not ( = ?auto_225216 ?auto_225218 ) ) ( not ( = ?auto_225216 ?auto_225219 ) ) ( not ( = ?auto_225216 ?auto_225220 ) ) ( not ( = ?auto_225217 ?auto_225218 ) ) ( not ( = ?auto_225217 ?auto_225219 ) ) ( not ( = ?auto_225217 ?auto_225220 ) ) ( not ( = ?auto_225218 ?auto_225219 ) ) ( not ( = ?auto_225218 ?auto_225220 ) ) ( not ( = ?auto_225219 ?auto_225220 ) ) ( ON ?auto_225218 ?auto_225219 ) ( ON ?auto_225217 ?auto_225218 ) ( ON ?auto_225216 ?auto_225217 ) ( CLEAR ?auto_225214 ) ( ON ?auto_225215 ?auto_225216 ) ( CLEAR ?auto_225215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_225208 ?auto_225209 ?auto_225210 ?auto_225211 ?auto_225212 ?auto_225213 ?auto_225214 ?auto_225215 )
      ( MAKE-12PILE ?auto_225208 ?auto_225209 ?auto_225210 ?auto_225211 ?auto_225212 ?auto_225213 ?auto_225214 ?auto_225215 ?auto_225216 ?auto_225217 ?auto_225218 ?auto_225219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225258 - BLOCK
      ?auto_225259 - BLOCK
      ?auto_225260 - BLOCK
      ?auto_225261 - BLOCK
      ?auto_225262 - BLOCK
      ?auto_225263 - BLOCK
      ?auto_225264 - BLOCK
      ?auto_225265 - BLOCK
      ?auto_225266 - BLOCK
      ?auto_225267 - BLOCK
      ?auto_225268 - BLOCK
      ?auto_225269 - BLOCK
    )
    :vars
    (
      ?auto_225270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225269 ?auto_225270 ) ( ON-TABLE ?auto_225258 ) ( ON ?auto_225259 ?auto_225258 ) ( ON ?auto_225260 ?auto_225259 ) ( ON ?auto_225261 ?auto_225260 ) ( ON ?auto_225262 ?auto_225261 ) ( ON ?auto_225263 ?auto_225262 ) ( not ( = ?auto_225258 ?auto_225259 ) ) ( not ( = ?auto_225258 ?auto_225260 ) ) ( not ( = ?auto_225258 ?auto_225261 ) ) ( not ( = ?auto_225258 ?auto_225262 ) ) ( not ( = ?auto_225258 ?auto_225263 ) ) ( not ( = ?auto_225258 ?auto_225264 ) ) ( not ( = ?auto_225258 ?auto_225265 ) ) ( not ( = ?auto_225258 ?auto_225266 ) ) ( not ( = ?auto_225258 ?auto_225267 ) ) ( not ( = ?auto_225258 ?auto_225268 ) ) ( not ( = ?auto_225258 ?auto_225269 ) ) ( not ( = ?auto_225258 ?auto_225270 ) ) ( not ( = ?auto_225259 ?auto_225260 ) ) ( not ( = ?auto_225259 ?auto_225261 ) ) ( not ( = ?auto_225259 ?auto_225262 ) ) ( not ( = ?auto_225259 ?auto_225263 ) ) ( not ( = ?auto_225259 ?auto_225264 ) ) ( not ( = ?auto_225259 ?auto_225265 ) ) ( not ( = ?auto_225259 ?auto_225266 ) ) ( not ( = ?auto_225259 ?auto_225267 ) ) ( not ( = ?auto_225259 ?auto_225268 ) ) ( not ( = ?auto_225259 ?auto_225269 ) ) ( not ( = ?auto_225259 ?auto_225270 ) ) ( not ( = ?auto_225260 ?auto_225261 ) ) ( not ( = ?auto_225260 ?auto_225262 ) ) ( not ( = ?auto_225260 ?auto_225263 ) ) ( not ( = ?auto_225260 ?auto_225264 ) ) ( not ( = ?auto_225260 ?auto_225265 ) ) ( not ( = ?auto_225260 ?auto_225266 ) ) ( not ( = ?auto_225260 ?auto_225267 ) ) ( not ( = ?auto_225260 ?auto_225268 ) ) ( not ( = ?auto_225260 ?auto_225269 ) ) ( not ( = ?auto_225260 ?auto_225270 ) ) ( not ( = ?auto_225261 ?auto_225262 ) ) ( not ( = ?auto_225261 ?auto_225263 ) ) ( not ( = ?auto_225261 ?auto_225264 ) ) ( not ( = ?auto_225261 ?auto_225265 ) ) ( not ( = ?auto_225261 ?auto_225266 ) ) ( not ( = ?auto_225261 ?auto_225267 ) ) ( not ( = ?auto_225261 ?auto_225268 ) ) ( not ( = ?auto_225261 ?auto_225269 ) ) ( not ( = ?auto_225261 ?auto_225270 ) ) ( not ( = ?auto_225262 ?auto_225263 ) ) ( not ( = ?auto_225262 ?auto_225264 ) ) ( not ( = ?auto_225262 ?auto_225265 ) ) ( not ( = ?auto_225262 ?auto_225266 ) ) ( not ( = ?auto_225262 ?auto_225267 ) ) ( not ( = ?auto_225262 ?auto_225268 ) ) ( not ( = ?auto_225262 ?auto_225269 ) ) ( not ( = ?auto_225262 ?auto_225270 ) ) ( not ( = ?auto_225263 ?auto_225264 ) ) ( not ( = ?auto_225263 ?auto_225265 ) ) ( not ( = ?auto_225263 ?auto_225266 ) ) ( not ( = ?auto_225263 ?auto_225267 ) ) ( not ( = ?auto_225263 ?auto_225268 ) ) ( not ( = ?auto_225263 ?auto_225269 ) ) ( not ( = ?auto_225263 ?auto_225270 ) ) ( not ( = ?auto_225264 ?auto_225265 ) ) ( not ( = ?auto_225264 ?auto_225266 ) ) ( not ( = ?auto_225264 ?auto_225267 ) ) ( not ( = ?auto_225264 ?auto_225268 ) ) ( not ( = ?auto_225264 ?auto_225269 ) ) ( not ( = ?auto_225264 ?auto_225270 ) ) ( not ( = ?auto_225265 ?auto_225266 ) ) ( not ( = ?auto_225265 ?auto_225267 ) ) ( not ( = ?auto_225265 ?auto_225268 ) ) ( not ( = ?auto_225265 ?auto_225269 ) ) ( not ( = ?auto_225265 ?auto_225270 ) ) ( not ( = ?auto_225266 ?auto_225267 ) ) ( not ( = ?auto_225266 ?auto_225268 ) ) ( not ( = ?auto_225266 ?auto_225269 ) ) ( not ( = ?auto_225266 ?auto_225270 ) ) ( not ( = ?auto_225267 ?auto_225268 ) ) ( not ( = ?auto_225267 ?auto_225269 ) ) ( not ( = ?auto_225267 ?auto_225270 ) ) ( not ( = ?auto_225268 ?auto_225269 ) ) ( not ( = ?auto_225268 ?auto_225270 ) ) ( not ( = ?auto_225269 ?auto_225270 ) ) ( ON ?auto_225268 ?auto_225269 ) ( ON ?auto_225267 ?auto_225268 ) ( ON ?auto_225266 ?auto_225267 ) ( ON ?auto_225265 ?auto_225266 ) ( CLEAR ?auto_225263 ) ( ON ?auto_225264 ?auto_225265 ) ( CLEAR ?auto_225264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_225258 ?auto_225259 ?auto_225260 ?auto_225261 ?auto_225262 ?auto_225263 ?auto_225264 )
      ( MAKE-12PILE ?auto_225258 ?auto_225259 ?auto_225260 ?auto_225261 ?auto_225262 ?auto_225263 ?auto_225264 ?auto_225265 ?auto_225266 ?auto_225267 ?auto_225268 ?auto_225269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225308 - BLOCK
      ?auto_225309 - BLOCK
      ?auto_225310 - BLOCK
      ?auto_225311 - BLOCK
      ?auto_225312 - BLOCK
      ?auto_225313 - BLOCK
      ?auto_225314 - BLOCK
      ?auto_225315 - BLOCK
      ?auto_225316 - BLOCK
      ?auto_225317 - BLOCK
      ?auto_225318 - BLOCK
      ?auto_225319 - BLOCK
    )
    :vars
    (
      ?auto_225320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225319 ?auto_225320 ) ( ON-TABLE ?auto_225308 ) ( ON ?auto_225309 ?auto_225308 ) ( ON ?auto_225310 ?auto_225309 ) ( ON ?auto_225311 ?auto_225310 ) ( ON ?auto_225312 ?auto_225311 ) ( not ( = ?auto_225308 ?auto_225309 ) ) ( not ( = ?auto_225308 ?auto_225310 ) ) ( not ( = ?auto_225308 ?auto_225311 ) ) ( not ( = ?auto_225308 ?auto_225312 ) ) ( not ( = ?auto_225308 ?auto_225313 ) ) ( not ( = ?auto_225308 ?auto_225314 ) ) ( not ( = ?auto_225308 ?auto_225315 ) ) ( not ( = ?auto_225308 ?auto_225316 ) ) ( not ( = ?auto_225308 ?auto_225317 ) ) ( not ( = ?auto_225308 ?auto_225318 ) ) ( not ( = ?auto_225308 ?auto_225319 ) ) ( not ( = ?auto_225308 ?auto_225320 ) ) ( not ( = ?auto_225309 ?auto_225310 ) ) ( not ( = ?auto_225309 ?auto_225311 ) ) ( not ( = ?auto_225309 ?auto_225312 ) ) ( not ( = ?auto_225309 ?auto_225313 ) ) ( not ( = ?auto_225309 ?auto_225314 ) ) ( not ( = ?auto_225309 ?auto_225315 ) ) ( not ( = ?auto_225309 ?auto_225316 ) ) ( not ( = ?auto_225309 ?auto_225317 ) ) ( not ( = ?auto_225309 ?auto_225318 ) ) ( not ( = ?auto_225309 ?auto_225319 ) ) ( not ( = ?auto_225309 ?auto_225320 ) ) ( not ( = ?auto_225310 ?auto_225311 ) ) ( not ( = ?auto_225310 ?auto_225312 ) ) ( not ( = ?auto_225310 ?auto_225313 ) ) ( not ( = ?auto_225310 ?auto_225314 ) ) ( not ( = ?auto_225310 ?auto_225315 ) ) ( not ( = ?auto_225310 ?auto_225316 ) ) ( not ( = ?auto_225310 ?auto_225317 ) ) ( not ( = ?auto_225310 ?auto_225318 ) ) ( not ( = ?auto_225310 ?auto_225319 ) ) ( not ( = ?auto_225310 ?auto_225320 ) ) ( not ( = ?auto_225311 ?auto_225312 ) ) ( not ( = ?auto_225311 ?auto_225313 ) ) ( not ( = ?auto_225311 ?auto_225314 ) ) ( not ( = ?auto_225311 ?auto_225315 ) ) ( not ( = ?auto_225311 ?auto_225316 ) ) ( not ( = ?auto_225311 ?auto_225317 ) ) ( not ( = ?auto_225311 ?auto_225318 ) ) ( not ( = ?auto_225311 ?auto_225319 ) ) ( not ( = ?auto_225311 ?auto_225320 ) ) ( not ( = ?auto_225312 ?auto_225313 ) ) ( not ( = ?auto_225312 ?auto_225314 ) ) ( not ( = ?auto_225312 ?auto_225315 ) ) ( not ( = ?auto_225312 ?auto_225316 ) ) ( not ( = ?auto_225312 ?auto_225317 ) ) ( not ( = ?auto_225312 ?auto_225318 ) ) ( not ( = ?auto_225312 ?auto_225319 ) ) ( not ( = ?auto_225312 ?auto_225320 ) ) ( not ( = ?auto_225313 ?auto_225314 ) ) ( not ( = ?auto_225313 ?auto_225315 ) ) ( not ( = ?auto_225313 ?auto_225316 ) ) ( not ( = ?auto_225313 ?auto_225317 ) ) ( not ( = ?auto_225313 ?auto_225318 ) ) ( not ( = ?auto_225313 ?auto_225319 ) ) ( not ( = ?auto_225313 ?auto_225320 ) ) ( not ( = ?auto_225314 ?auto_225315 ) ) ( not ( = ?auto_225314 ?auto_225316 ) ) ( not ( = ?auto_225314 ?auto_225317 ) ) ( not ( = ?auto_225314 ?auto_225318 ) ) ( not ( = ?auto_225314 ?auto_225319 ) ) ( not ( = ?auto_225314 ?auto_225320 ) ) ( not ( = ?auto_225315 ?auto_225316 ) ) ( not ( = ?auto_225315 ?auto_225317 ) ) ( not ( = ?auto_225315 ?auto_225318 ) ) ( not ( = ?auto_225315 ?auto_225319 ) ) ( not ( = ?auto_225315 ?auto_225320 ) ) ( not ( = ?auto_225316 ?auto_225317 ) ) ( not ( = ?auto_225316 ?auto_225318 ) ) ( not ( = ?auto_225316 ?auto_225319 ) ) ( not ( = ?auto_225316 ?auto_225320 ) ) ( not ( = ?auto_225317 ?auto_225318 ) ) ( not ( = ?auto_225317 ?auto_225319 ) ) ( not ( = ?auto_225317 ?auto_225320 ) ) ( not ( = ?auto_225318 ?auto_225319 ) ) ( not ( = ?auto_225318 ?auto_225320 ) ) ( not ( = ?auto_225319 ?auto_225320 ) ) ( ON ?auto_225318 ?auto_225319 ) ( ON ?auto_225317 ?auto_225318 ) ( ON ?auto_225316 ?auto_225317 ) ( ON ?auto_225315 ?auto_225316 ) ( ON ?auto_225314 ?auto_225315 ) ( CLEAR ?auto_225312 ) ( ON ?auto_225313 ?auto_225314 ) ( CLEAR ?auto_225313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_225308 ?auto_225309 ?auto_225310 ?auto_225311 ?auto_225312 ?auto_225313 )
      ( MAKE-12PILE ?auto_225308 ?auto_225309 ?auto_225310 ?auto_225311 ?auto_225312 ?auto_225313 ?auto_225314 ?auto_225315 ?auto_225316 ?auto_225317 ?auto_225318 ?auto_225319 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225358 - BLOCK
      ?auto_225359 - BLOCK
      ?auto_225360 - BLOCK
      ?auto_225361 - BLOCK
      ?auto_225362 - BLOCK
      ?auto_225363 - BLOCK
      ?auto_225364 - BLOCK
      ?auto_225365 - BLOCK
      ?auto_225366 - BLOCK
      ?auto_225367 - BLOCK
      ?auto_225368 - BLOCK
      ?auto_225369 - BLOCK
    )
    :vars
    (
      ?auto_225370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225369 ?auto_225370 ) ( ON-TABLE ?auto_225358 ) ( ON ?auto_225359 ?auto_225358 ) ( ON ?auto_225360 ?auto_225359 ) ( ON ?auto_225361 ?auto_225360 ) ( not ( = ?auto_225358 ?auto_225359 ) ) ( not ( = ?auto_225358 ?auto_225360 ) ) ( not ( = ?auto_225358 ?auto_225361 ) ) ( not ( = ?auto_225358 ?auto_225362 ) ) ( not ( = ?auto_225358 ?auto_225363 ) ) ( not ( = ?auto_225358 ?auto_225364 ) ) ( not ( = ?auto_225358 ?auto_225365 ) ) ( not ( = ?auto_225358 ?auto_225366 ) ) ( not ( = ?auto_225358 ?auto_225367 ) ) ( not ( = ?auto_225358 ?auto_225368 ) ) ( not ( = ?auto_225358 ?auto_225369 ) ) ( not ( = ?auto_225358 ?auto_225370 ) ) ( not ( = ?auto_225359 ?auto_225360 ) ) ( not ( = ?auto_225359 ?auto_225361 ) ) ( not ( = ?auto_225359 ?auto_225362 ) ) ( not ( = ?auto_225359 ?auto_225363 ) ) ( not ( = ?auto_225359 ?auto_225364 ) ) ( not ( = ?auto_225359 ?auto_225365 ) ) ( not ( = ?auto_225359 ?auto_225366 ) ) ( not ( = ?auto_225359 ?auto_225367 ) ) ( not ( = ?auto_225359 ?auto_225368 ) ) ( not ( = ?auto_225359 ?auto_225369 ) ) ( not ( = ?auto_225359 ?auto_225370 ) ) ( not ( = ?auto_225360 ?auto_225361 ) ) ( not ( = ?auto_225360 ?auto_225362 ) ) ( not ( = ?auto_225360 ?auto_225363 ) ) ( not ( = ?auto_225360 ?auto_225364 ) ) ( not ( = ?auto_225360 ?auto_225365 ) ) ( not ( = ?auto_225360 ?auto_225366 ) ) ( not ( = ?auto_225360 ?auto_225367 ) ) ( not ( = ?auto_225360 ?auto_225368 ) ) ( not ( = ?auto_225360 ?auto_225369 ) ) ( not ( = ?auto_225360 ?auto_225370 ) ) ( not ( = ?auto_225361 ?auto_225362 ) ) ( not ( = ?auto_225361 ?auto_225363 ) ) ( not ( = ?auto_225361 ?auto_225364 ) ) ( not ( = ?auto_225361 ?auto_225365 ) ) ( not ( = ?auto_225361 ?auto_225366 ) ) ( not ( = ?auto_225361 ?auto_225367 ) ) ( not ( = ?auto_225361 ?auto_225368 ) ) ( not ( = ?auto_225361 ?auto_225369 ) ) ( not ( = ?auto_225361 ?auto_225370 ) ) ( not ( = ?auto_225362 ?auto_225363 ) ) ( not ( = ?auto_225362 ?auto_225364 ) ) ( not ( = ?auto_225362 ?auto_225365 ) ) ( not ( = ?auto_225362 ?auto_225366 ) ) ( not ( = ?auto_225362 ?auto_225367 ) ) ( not ( = ?auto_225362 ?auto_225368 ) ) ( not ( = ?auto_225362 ?auto_225369 ) ) ( not ( = ?auto_225362 ?auto_225370 ) ) ( not ( = ?auto_225363 ?auto_225364 ) ) ( not ( = ?auto_225363 ?auto_225365 ) ) ( not ( = ?auto_225363 ?auto_225366 ) ) ( not ( = ?auto_225363 ?auto_225367 ) ) ( not ( = ?auto_225363 ?auto_225368 ) ) ( not ( = ?auto_225363 ?auto_225369 ) ) ( not ( = ?auto_225363 ?auto_225370 ) ) ( not ( = ?auto_225364 ?auto_225365 ) ) ( not ( = ?auto_225364 ?auto_225366 ) ) ( not ( = ?auto_225364 ?auto_225367 ) ) ( not ( = ?auto_225364 ?auto_225368 ) ) ( not ( = ?auto_225364 ?auto_225369 ) ) ( not ( = ?auto_225364 ?auto_225370 ) ) ( not ( = ?auto_225365 ?auto_225366 ) ) ( not ( = ?auto_225365 ?auto_225367 ) ) ( not ( = ?auto_225365 ?auto_225368 ) ) ( not ( = ?auto_225365 ?auto_225369 ) ) ( not ( = ?auto_225365 ?auto_225370 ) ) ( not ( = ?auto_225366 ?auto_225367 ) ) ( not ( = ?auto_225366 ?auto_225368 ) ) ( not ( = ?auto_225366 ?auto_225369 ) ) ( not ( = ?auto_225366 ?auto_225370 ) ) ( not ( = ?auto_225367 ?auto_225368 ) ) ( not ( = ?auto_225367 ?auto_225369 ) ) ( not ( = ?auto_225367 ?auto_225370 ) ) ( not ( = ?auto_225368 ?auto_225369 ) ) ( not ( = ?auto_225368 ?auto_225370 ) ) ( not ( = ?auto_225369 ?auto_225370 ) ) ( ON ?auto_225368 ?auto_225369 ) ( ON ?auto_225367 ?auto_225368 ) ( ON ?auto_225366 ?auto_225367 ) ( ON ?auto_225365 ?auto_225366 ) ( ON ?auto_225364 ?auto_225365 ) ( ON ?auto_225363 ?auto_225364 ) ( CLEAR ?auto_225361 ) ( ON ?auto_225362 ?auto_225363 ) ( CLEAR ?auto_225362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_225358 ?auto_225359 ?auto_225360 ?auto_225361 ?auto_225362 )
      ( MAKE-12PILE ?auto_225358 ?auto_225359 ?auto_225360 ?auto_225361 ?auto_225362 ?auto_225363 ?auto_225364 ?auto_225365 ?auto_225366 ?auto_225367 ?auto_225368 ?auto_225369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225408 - BLOCK
      ?auto_225409 - BLOCK
      ?auto_225410 - BLOCK
      ?auto_225411 - BLOCK
      ?auto_225412 - BLOCK
      ?auto_225413 - BLOCK
      ?auto_225414 - BLOCK
      ?auto_225415 - BLOCK
      ?auto_225416 - BLOCK
      ?auto_225417 - BLOCK
      ?auto_225418 - BLOCK
      ?auto_225419 - BLOCK
    )
    :vars
    (
      ?auto_225420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225419 ?auto_225420 ) ( ON-TABLE ?auto_225408 ) ( ON ?auto_225409 ?auto_225408 ) ( ON ?auto_225410 ?auto_225409 ) ( not ( = ?auto_225408 ?auto_225409 ) ) ( not ( = ?auto_225408 ?auto_225410 ) ) ( not ( = ?auto_225408 ?auto_225411 ) ) ( not ( = ?auto_225408 ?auto_225412 ) ) ( not ( = ?auto_225408 ?auto_225413 ) ) ( not ( = ?auto_225408 ?auto_225414 ) ) ( not ( = ?auto_225408 ?auto_225415 ) ) ( not ( = ?auto_225408 ?auto_225416 ) ) ( not ( = ?auto_225408 ?auto_225417 ) ) ( not ( = ?auto_225408 ?auto_225418 ) ) ( not ( = ?auto_225408 ?auto_225419 ) ) ( not ( = ?auto_225408 ?auto_225420 ) ) ( not ( = ?auto_225409 ?auto_225410 ) ) ( not ( = ?auto_225409 ?auto_225411 ) ) ( not ( = ?auto_225409 ?auto_225412 ) ) ( not ( = ?auto_225409 ?auto_225413 ) ) ( not ( = ?auto_225409 ?auto_225414 ) ) ( not ( = ?auto_225409 ?auto_225415 ) ) ( not ( = ?auto_225409 ?auto_225416 ) ) ( not ( = ?auto_225409 ?auto_225417 ) ) ( not ( = ?auto_225409 ?auto_225418 ) ) ( not ( = ?auto_225409 ?auto_225419 ) ) ( not ( = ?auto_225409 ?auto_225420 ) ) ( not ( = ?auto_225410 ?auto_225411 ) ) ( not ( = ?auto_225410 ?auto_225412 ) ) ( not ( = ?auto_225410 ?auto_225413 ) ) ( not ( = ?auto_225410 ?auto_225414 ) ) ( not ( = ?auto_225410 ?auto_225415 ) ) ( not ( = ?auto_225410 ?auto_225416 ) ) ( not ( = ?auto_225410 ?auto_225417 ) ) ( not ( = ?auto_225410 ?auto_225418 ) ) ( not ( = ?auto_225410 ?auto_225419 ) ) ( not ( = ?auto_225410 ?auto_225420 ) ) ( not ( = ?auto_225411 ?auto_225412 ) ) ( not ( = ?auto_225411 ?auto_225413 ) ) ( not ( = ?auto_225411 ?auto_225414 ) ) ( not ( = ?auto_225411 ?auto_225415 ) ) ( not ( = ?auto_225411 ?auto_225416 ) ) ( not ( = ?auto_225411 ?auto_225417 ) ) ( not ( = ?auto_225411 ?auto_225418 ) ) ( not ( = ?auto_225411 ?auto_225419 ) ) ( not ( = ?auto_225411 ?auto_225420 ) ) ( not ( = ?auto_225412 ?auto_225413 ) ) ( not ( = ?auto_225412 ?auto_225414 ) ) ( not ( = ?auto_225412 ?auto_225415 ) ) ( not ( = ?auto_225412 ?auto_225416 ) ) ( not ( = ?auto_225412 ?auto_225417 ) ) ( not ( = ?auto_225412 ?auto_225418 ) ) ( not ( = ?auto_225412 ?auto_225419 ) ) ( not ( = ?auto_225412 ?auto_225420 ) ) ( not ( = ?auto_225413 ?auto_225414 ) ) ( not ( = ?auto_225413 ?auto_225415 ) ) ( not ( = ?auto_225413 ?auto_225416 ) ) ( not ( = ?auto_225413 ?auto_225417 ) ) ( not ( = ?auto_225413 ?auto_225418 ) ) ( not ( = ?auto_225413 ?auto_225419 ) ) ( not ( = ?auto_225413 ?auto_225420 ) ) ( not ( = ?auto_225414 ?auto_225415 ) ) ( not ( = ?auto_225414 ?auto_225416 ) ) ( not ( = ?auto_225414 ?auto_225417 ) ) ( not ( = ?auto_225414 ?auto_225418 ) ) ( not ( = ?auto_225414 ?auto_225419 ) ) ( not ( = ?auto_225414 ?auto_225420 ) ) ( not ( = ?auto_225415 ?auto_225416 ) ) ( not ( = ?auto_225415 ?auto_225417 ) ) ( not ( = ?auto_225415 ?auto_225418 ) ) ( not ( = ?auto_225415 ?auto_225419 ) ) ( not ( = ?auto_225415 ?auto_225420 ) ) ( not ( = ?auto_225416 ?auto_225417 ) ) ( not ( = ?auto_225416 ?auto_225418 ) ) ( not ( = ?auto_225416 ?auto_225419 ) ) ( not ( = ?auto_225416 ?auto_225420 ) ) ( not ( = ?auto_225417 ?auto_225418 ) ) ( not ( = ?auto_225417 ?auto_225419 ) ) ( not ( = ?auto_225417 ?auto_225420 ) ) ( not ( = ?auto_225418 ?auto_225419 ) ) ( not ( = ?auto_225418 ?auto_225420 ) ) ( not ( = ?auto_225419 ?auto_225420 ) ) ( ON ?auto_225418 ?auto_225419 ) ( ON ?auto_225417 ?auto_225418 ) ( ON ?auto_225416 ?auto_225417 ) ( ON ?auto_225415 ?auto_225416 ) ( ON ?auto_225414 ?auto_225415 ) ( ON ?auto_225413 ?auto_225414 ) ( ON ?auto_225412 ?auto_225413 ) ( CLEAR ?auto_225410 ) ( ON ?auto_225411 ?auto_225412 ) ( CLEAR ?auto_225411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_225408 ?auto_225409 ?auto_225410 ?auto_225411 )
      ( MAKE-12PILE ?auto_225408 ?auto_225409 ?auto_225410 ?auto_225411 ?auto_225412 ?auto_225413 ?auto_225414 ?auto_225415 ?auto_225416 ?auto_225417 ?auto_225418 ?auto_225419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225458 - BLOCK
      ?auto_225459 - BLOCK
      ?auto_225460 - BLOCK
      ?auto_225461 - BLOCK
      ?auto_225462 - BLOCK
      ?auto_225463 - BLOCK
      ?auto_225464 - BLOCK
      ?auto_225465 - BLOCK
      ?auto_225466 - BLOCK
      ?auto_225467 - BLOCK
      ?auto_225468 - BLOCK
      ?auto_225469 - BLOCK
    )
    :vars
    (
      ?auto_225470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225469 ?auto_225470 ) ( ON-TABLE ?auto_225458 ) ( ON ?auto_225459 ?auto_225458 ) ( not ( = ?auto_225458 ?auto_225459 ) ) ( not ( = ?auto_225458 ?auto_225460 ) ) ( not ( = ?auto_225458 ?auto_225461 ) ) ( not ( = ?auto_225458 ?auto_225462 ) ) ( not ( = ?auto_225458 ?auto_225463 ) ) ( not ( = ?auto_225458 ?auto_225464 ) ) ( not ( = ?auto_225458 ?auto_225465 ) ) ( not ( = ?auto_225458 ?auto_225466 ) ) ( not ( = ?auto_225458 ?auto_225467 ) ) ( not ( = ?auto_225458 ?auto_225468 ) ) ( not ( = ?auto_225458 ?auto_225469 ) ) ( not ( = ?auto_225458 ?auto_225470 ) ) ( not ( = ?auto_225459 ?auto_225460 ) ) ( not ( = ?auto_225459 ?auto_225461 ) ) ( not ( = ?auto_225459 ?auto_225462 ) ) ( not ( = ?auto_225459 ?auto_225463 ) ) ( not ( = ?auto_225459 ?auto_225464 ) ) ( not ( = ?auto_225459 ?auto_225465 ) ) ( not ( = ?auto_225459 ?auto_225466 ) ) ( not ( = ?auto_225459 ?auto_225467 ) ) ( not ( = ?auto_225459 ?auto_225468 ) ) ( not ( = ?auto_225459 ?auto_225469 ) ) ( not ( = ?auto_225459 ?auto_225470 ) ) ( not ( = ?auto_225460 ?auto_225461 ) ) ( not ( = ?auto_225460 ?auto_225462 ) ) ( not ( = ?auto_225460 ?auto_225463 ) ) ( not ( = ?auto_225460 ?auto_225464 ) ) ( not ( = ?auto_225460 ?auto_225465 ) ) ( not ( = ?auto_225460 ?auto_225466 ) ) ( not ( = ?auto_225460 ?auto_225467 ) ) ( not ( = ?auto_225460 ?auto_225468 ) ) ( not ( = ?auto_225460 ?auto_225469 ) ) ( not ( = ?auto_225460 ?auto_225470 ) ) ( not ( = ?auto_225461 ?auto_225462 ) ) ( not ( = ?auto_225461 ?auto_225463 ) ) ( not ( = ?auto_225461 ?auto_225464 ) ) ( not ( = ?auto_225461 ?auto_225465 ) ) ( not ( = ?auto_225461 ?auto_225466 ) ) ( not ( = ?auto_225461 ?auto_225467 ) ) ( not ( = ?auto_225461 ?auto_225468 ) ) ( not ( = ?auto_225461 ?auto_225469 ) ) ( not ( = ?auto_225461 ?auto_225470 ) ) ( not ( = ?auto_225462 ?auto_225463 ) ) ( not ( = ?auto_225462 ?auto_225464 ) ) ( not ( = ?auto_225462 ?auto_225465 ) ) ( not ( = ?auto_225462 ?auto_225466 ) ) ( not ( = ?auto_225462 ?auto_225467 ) ) ( not ( = ?auto_225462 ?auto_225468 ) ) ( not ( = ?auto_225462 ?auto_225469 ) ) ( not ( = ?auto_225462 ?auto_225470 ) ) ( not ( = ?auto_225463 ?auto_225464 ) ) ( not ( = ?auto_225463 ?auto_225465 ) ) ( not ( = ?auto_225463 ?auto_225466 ) ) ( not ( = ?auto_225463 ?auto_225467 ) ) ( not ( = ?auto_225463 ?auto_225468 ) ) ( not ( = ?auto_225463 ?auto_225469 ) ) ( not ( = ?auto_225463 ?auto_225470 ) ) ( not ( = ?auto_225464 ?auto_225465 ) ) ( not ( = ?auto_225464 ?auto_225466 ) ) ( not ( = ?auto_225464 ?auto_225467 ) ) ( not ( = ?auto_225464 ?auto_225468 ) ) ( not ( = ?auto_225464 ?auto_225469 ) ) ( not ( = ?auto_225464 ?auto_225470 ) ) ( not ( = ?auto_225465 ?auto_225466 ) ) ( not ( = ?auto_225465 ?auto_225467 ) ) ( not ( = ?auto_225465 ?auto_225468 ) ) ( not ( = ?auto_225465 ?auto_225469 ) ) ( not ( = ?auto_225465 ?auto_225470 ) ) ( not ( = ?auto_225466 ?auto_225467 ) ) ( not ( = ?auto_225466 ?auto_225468 ) ) ( not ( = ?auto_225466 ?auto_225469 ) ) ( not ( = ?auto_225466 ?auto_225470 ) ) ( not ( = ?auto_225467 ?auto_225468 ) ) ( not ( = ?auto_225467 ?auto_225469 ) ) ( not ( = ?auto_225467 ?auto_225470 ) ) ( not ( = ?auto_225468 ?auto_225469 ) ) ( not ( = ?auto_225468 ?auto_225470 ) ) ( not ( = ?auto_225469 ?auto_225470 ) ) ( ON ?auto_225468 ?auto_225469 ) ( ON ?auto_225467 ?auto_225468 ) ( ON ?auto_225466 ?auto_225467 ) ( ON ?auto_225465 ?auto_225466 ) ( ON ?auto_225464 ?auto_225465 ) ( ON ?auto_225463 ?auto_225464 ) ( ON ?auto_225462 ?auto_225463 ) ( ON ?auto_225461 ?auto_225462 ) ( CLEAR ?auto_225459 ) ( ON ?auto_225460 ?auto_225461 ) ( CLEAR ?auto_225460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_225458 ?auto_225459 ?auto_225460 )
      ( MAKE-12PILE ?auto_225458 ?auto_225459 ?auto_225460 ?auto_225461 ?auto_225462 ?auto_225463 ?auto_225464 ?auto_225465 ?auto_225466 ?auto_225467 ?auto_225468 ?auto_225469 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225508 - BLOCK
      ?auto_225509 - BLOCK
      ?auto_225510 - BLOCK
      ?auto_225511 - BLOCK
      ?auto_225512 - BLOCK
      ?auto_225513 - BLOCK
      ?auto_225514 - BLOCK
      ?auto_225515 - BLOCK
      ?auto_225516 - BLOCK
      ?auto_225517 - BLOCK
      ?auto_225518 - BLOCK
      ?auto_225519 - BLOCK
    )
    :vars
    (
      ?auto_225520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225519 ?auto_225520 ) ( ON-TABLE ?auto_225508 ) ( not ( = ?auto_225508 ?auto_225509 ) ) ( not ( = ?auto_225508 ?auto_225510 ) ) ( not ( = ?auto_225508 ?auto_225511 ) ) ( not ( = ?auto_225508 ?auto_225512 ) ) ( not ( = ?auto_225508 ?auto_225513 ) ) ( not ( = ?auto_225508 ?auto_225514 ) ) ( not ( = ?auto_225508 ?auto_225515 ) ) ( not ( = ?auto_225508 ?auto_225516 ) ) ( not ( = ?auto_225508 ?auto_225517 ) ) ( not ( = ?auto_225508 ?auto_225518 ) ) ( not ( = ?auto_225508 ?auto_225519 ) ) ( not ( = ?auto_225508 ?auto_225520 ) ) ( not ( = ?auto_225509 ?auto_225510 ) ) ( not ( = ?auto_225509 ?auto_225511 ) ) ( not ( = ?auto_225509 ?auto_225512 ) ) ( not ( = ?auto_225509 ?auto_225513 ) ) ( not ( = ?auto_225509 ?auto_225514 ) ) ( not ( = ?auto_225509 ?auto_225515 ) ) ( not ( = ?auto_225509 ?auto_225516 ) ) ( not ( = ?auto_225509 ?auto_225517 ) ) ( not ( = ?auto_225509 ?auto_225518 ) ) ( not ( = ?auto_225509 ?auto_225519 ) ) ( not ( = ?auto_225509 ?auto_225520 ) ) ( not ( = ?auto_225510 ?auto_225511 ) ) ( not ( = ?auto_225510 ?auto_225512 ) ) ( not ( = ?auto_225510 ?auto_225513 ) ) ( not ( = ?auto_225510 ?auto_225514 ) ) ( not ( = ?auto_225510 ?auto_225515 ) ) ( not ( = ?auto_225510 ?auto_225516 ) ) ( not ( = ?auto_225510 ?auto_225517 ) ) ( not ( = ?auto_225510 ?auto_225518 ) ) ( not ( = ?auto_225510 ?auto_225519 ) ) ( not ( = ?auto_225510 ?auto_225520 ) ) ( not ( = ?auto_225511 ?auto_225512 ) ) ( not ( = ?auto_225511 ?auto_225513 ) ) ( not ( = ?auto_225511 ?auto_225514 ) ) ( not ( = ?auto_225511 ?auto_225515 ) ) ( not ( = ?auto_225511 ?auto_225516 ) ) ( not ( = ?auto_225511 ?auto_225517 ) ) ( not ( = ?auto_225511 ?auto_225518 ) ) ( not ( = ?auto_225511 ?auto_225519 ) ) ( not ( = ?auto_225511 ?auto_225520 ) ) ( not ( = ?auto_225512 ?auto_225513 ) ) ( not ( = ?auto_225512 ?auto_225514 ) ) ( not ( = ?auto_225512 ?auto_225515 ) ) ( not ( = ?auto_225512 ?auto_225516 ) ) ( not ( = ?auto_225512 ?auto_225517 ) ) ( not ( = ?auto_225512 ?auto_225518 ) ) ( not ( = ?auto_225512 ?auto_225519 ) ) ( not ( = ?auto_225512 ?auto_225520 ) ) ( not ( = ?auto_225513 ?auto_225514 ) ) ( not ( = ?auto_225513 ?auto_225515 ) ) ( not ( = ?auto_225513 ?auto_225516 ) ) ( not ( = ?auto_225513 ?auto_225517 ) ) ( not ( = ?auto_225513 ?auto_225518 ) ) ( not ( = ?auto_225513 ?auto_225519 ) ) ( not ( = ?auto_225513 ?auto_225520 ) ) ( not ( = ?auto_225514 ?auto_225515 ) ) ( not ( = ?auto_225514 ?auto_225516 ) ) ( not ( = ?auto_225514 ?auto_225517 ) ) ( not ( = ?auto_225514 ?auto_225518 ) ) ( not ( = ?auto_225514 ?auto_225519 ) ) ( not ( = ?auto_225514 ?auto_225520 ) ) ( not ( = ?auto_225515 ?auto_225516 ) ) ( not ( = ?auto_225515 ?auto_225517 ) ) ( not ( = ?auto_225515 ?auto_225518 ) ) ( not ( = ?auto_225515 ?auto_225519 ) ) ( not ( = ?auto_225515 ?auto_225520 ) ) ( not ( = ?auto_225516 ?auto_225517 ) ) ( not ( = ?auto_225516 ?auto_225518 ) ) ( not ( = ?auto_225516 ?auto_225519 ) ) ( not ( = ?auto_225516 ?auto_225520 ) ) ( not ( = ?auto_225517 ?auto_225518 ) ) ( not ( = ?auto_225517 ?auto_225519 ) ) ( not ( = ?auto_225517 ?auto_225520 ) ) ( not ( = ?auto_225518 ?auto_225519 ) ) ( not ( = ?auto_225518 ?auto_225520 ) ) ( not ( = ?auto_225519 ?auto_225520 ) ) ( ON ?auto_225518 ?auto_225519 ) ( ON ?auto_225517 ?auto_225518 ) ( ON ?auto_225516 ?auto_225517 ) ( ON ?auto_225515 ?auto_225516 ) ( ON ?auto_225514 ?auto_225515 ) ( ON ?auto_225513 ?auto_225514 ) ( ON ?auto_225512 ?auto_225513 ) ( ON ?auto_225511 ?auto_225512 ) ( ON ?auto_225510 ?auto_225511 ) ( CLEAR ?auto_225508 ) ( ON ?auto_225509 ?auto_225510 ) ( CLEAR ?auto_225509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_225508 ?auto_225509 )
      ( MAKE-12PILE ?auto_225508 ?auto_225509 ?auto_225510 ?auto_225511 ?auto_225512 ?auto_225513 ?auto_225514 ?auto_225515 ?auto_225516 ?auto_225517 ?auto_225518 ?auto_225519 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_225558 - BLOCK
      ?auto_225559 - BLOCK
      ?auto_225560 - BLOCK
      ?auto_225561 - BLOCK
      ?auto_225562 - BLOCK
      ?auto_225563 - BLOCK
      ?auto_225564 - BLOCK
      ?auto_225565 - BLOCK
      ?auto_225566 - BLOCK
      ?auto_225567 - BLOCK
      ?auto_225568 - BLOCK
      ?auto_225569 - BLOCK
    )
    :vars
    (
      ?auto_225570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225569 ?auto_225570 ) ( not ( = ?auto_225558 ?auto_225559 ) ) ( not ( = ?auto_225558 ?auto_225560 ) ) ( not ( = ?auto_225558 ?auto_225561 ) ) ( not ( = ?auto_225558 ?auto_225562 ) ) ( not ( = ?auto_225558 ?auto_225563 ) ) ( not ( = ?auto_225558 ?auto_225564 ) ) ( not ( = ?auto_225558 ?auto_225565 ) ) ( not ( = ?auto_225558 ?auto_225566 ) ) ( not ( = ?auto_225558 ?auto_225567 ) ) ( not ( = ?auto_225558 ?auto_225568 ) ) ( not ( = ?auto_225558 ?auto_225569 ) ) ( not ( = ?auto_225558 ?auto_225570 ) ) ( not ( = ?auto_225559 ?auto_225560 ) ) ( not ( = ?auto_225559 ?auto_225561 ) ) ( not ( = ?auto_225559 ?auto_225562 ) ) ( not ( = ?auto_225559 ?auto_225563 ) ) ( not ( = ?auto_225559 ?auto_225564 ) ) ( not ( = ?auto_225559 ?auto_225565 ) ) ( not ( = ?auto_225559 ?auto_225566 ) ) ( not ( = ?auto_225559 ?auto_225567 ) ) ( not ( = ?auto_225559 ?auto_225568 ) ) ( not ( = ?auto_225559 ?auto_225569 ) ) ( not ( = ?auto_225559 ?auto_225570 ) ) ( not ( = ?auto_225560 ?auto_225561 ) ) ( not ( = ?auto_225560 ?auto_225562 ) ) ( not ( = ?auto_225560 ?auto_225563 ) ) ( not ( = ?auto_225560 ?auto_225564 ) ) ( not ( = ?auto_225560 ?auto_225565 ) ) ( not ( = ?auto_225560 ?auto_225566 ) ) ( not ( = ?auto_225560 ?auto_225567 ) ) ( not ( = ?auto_225560 ?auto_225568 ) ) ( not ( = ?auto_225560 ?auto_225569 ) ) ( not ( = ?auto_225560 ?auto_225570 ) ) ( not ( = ?auto_225561 ?auto_225562 ) ) ( not ( = ?auto_225561 ?auto_225563 ) ) ( not ( = ?auto_225561 ?auto_225564 ) ) ( not ( = ?auto_225561 ?auto_225565 ) ) ( not ( = ?auto_225561 ?auto_225566 ) ) ( not ( = ?auto_225561 ?auto_225567 ) ) ( not ( = ?auto_225561 ?auto_225568 ) ) ( not ( = ?auto_225561 ?auto_225569 ) ) ( not ( = ?auto_225561 ?auto_225570 ) ) ( not ( = ?auto_225562 ?auto_225563 ) ) ( not ( = ?auto_225562 ?auto_225564 ) ) ( not ( = ?auto_225562 ?auto_225565 ) ) ( not ( = ?auto_225562 ?auto_225566 ) ) ( not ( = ?auto_225562 ?auto_225567 ) ) ( not ( = ?auto_225562 ?auto_225568 ) ) ( not ( = ?auto_225562 ?auto_225569 ) ) ( not ( = ?auto_225562 ?auto_225570 ) ) ( not ( = ?auto_225563 ?auto_225564 ) ) ( not ( = ?auto_225563 ?auto_225565 ) ) ( not ( = ?auto_225563 ?auto_225566 ) ) ( not ( = ?auto_225563 ?auto_225567 ) ) ( not ( = ?auto_225563 ?auto_225568 ) ) ( not ( = ?auto_225563 ?auto_225569 ) ) ( not ( = ?auto_225563 ?auto_225570 ) ) ( not ( = ?auto_225564 ?auto_225565 ) ) ( not ( = ?auto_225564 ?auto_225566 ) ) ( not ( = ?auto_225564 ?auto_225567 ) ) ( not ( = ?auto_225564 ?auto_225568 ) ) ( not ( = ?auto_225564 ?auto_225569 ) ) ( not ( = ?auto_225564 ?auto_225570 ) ) ( not ( = ?auto_225565 ?auto_225566 ) ) ( not ( = ?auto_225565 ?auto_225567 ) ) ( not ( = ?auto_225565 ?auto_225568 ) ) ( not ( = ?auto_225565 ?auto_225569 ) ) ( not ( = ?auto_225565 ?auto_225570 ) ) ( not ( = ?auto_225566 ?auto_225567 ) ) ( not ( = ?auto_225566 ?auto_225568 ) ) ( not ( = ?auto_225566 ?auto_225569 ) ) ( not ( = ?auto_225566 ?auto_225570 ) ) ( not ( = ?auto_225567 ?auto_225568 ) ) ( not ( = ?auto_225567 ?auto_225569 ) ) ( not ( = ?auto_225567 ?auto_225570 ) ) ( not ( = ?auto_225568 ?auto_225569 ) ) ( not ( = ?auto_225568 ?auto_225570 ) ) ( not ( = ?auto_225569 ?auto_225570 ) ) ( ON ?auto_225568 ?auto_225569 ) ( ON ?auto_225567 ?auto_225568 ) ( ON ?auto_225566 ?auto_225567 ) ( ON ?auto_225565 ?auto_225566 ) ( ON ?auto_225564 ?auto_225565 ) ( ON ?auto_225563 ?auto_225564 ) ( ON ?auto_225562 ?auto_225563 ) ( ON ?auto_225561 ?auto_225562 ) ( ON ?auto_225560 ?auto_225561 ) ( ON ?auto_225559 ?auto_225560 ) ( ON ?auto_225558 ?auto_225559 ) ( CLEAR ?auto_225558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_225558 )
      ( MAKE-12PILE ?auto_225558 ?auto_225559 ?auto_225560 ?auto_225561 ?auto_225562 ?auto_225563 ?auto_225564 ?auto_225565 ?auto_225566 ?auto_225567 ?auto_225568 ?auto_225569 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225609 - BLOCK
      ?auto_225610 - BLOCK
      ?auto_225611 - BLOCK
      ?auto_225612 - BLOCK
      ?auto_225613 - BLOCK
      ?auto_225614 - BLOCK
      ?auto_225615 - BLOCK
      ?auto_225616 - BLOCK
      ?auto_225617 - BLOCK
      ?auto_225618 - BLOCK
      ?auto_225619 - BLOCK
      ?auto_225620 - BLOCK
      ?auto_225621 - BLOCK
    )
    :vars
    (
      ?auto_225622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_225620 ) ( ON ?auto_225621 ?auto_225622 ) ( CLEAR ?auto_225621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_225609 ) ( ON ?auto_225610 ?auto_225609 ) ( ON ?auto_225611 ?auto_225610 ) ( ON ?auto_225612 ?auto_225611 ) ( ON ?auto_225613 ?auto_225612 ) ( ON ?auto_225614 ?auto_225613 ) ( ON ?auto_225615 ?auto_225614 ) ( ON ?auto_225616 ?auto_225615 ) ( ON ?auto_225617 ?auto_225616 ) ( ON ?auto_225618 ?auto_225617 ) ( ON ?auto_225619 ?auto_225618 ) ( ON ?auto_225620 ?auto_225619 ) ( not ( = ?auto_225609 ?auto_225610 ) ) ( not ( = ?auto_225609 ?auto_225611 ) ) ( not ( = ?auto_225609 ?auto_225612 ) ) ( not ( = ?auto_225609 ?auto_225613 ) ) ( not ( = ?auto_225609 ?auto_225614 ) ) ( not ( = ?auto_225609 ?auto_225615 ) ) ( not ( = ?auto_225609 ?auto_225616 ) ) ( not ( = ?auto_225609 ?auto_225617 ) ) ( not ( = ?auto_225609 ?auto_225618 ) ) ( not ( = ?auto_225609 ?auto_225619 ) ) ( not ( = ?auto_225609 ?auto_225620 ) ) ( not ( = ?auto_225609 ?auto_225621 ) ) ( not ( = ?auto_225609 ?auto_225622 ) ) ( not ( = ?auto_225610 ?auto_225611 ) ) ( not ( = ?auto_225610 ?auto_225612 ) ) ( not ( = ?auto_225610 ?auto_225613 ) ) ( not ( = ?auto_225610 ?auto_225614 ) ) ( not ( = ?auto_225610 ?auto_225615 ) ) ( not ( = ?auto_225610 ?auto_225616 ) ) ( not ( = ?auto_225610 ?auto_225617 ) ) ( not ( = ?auto_225610 ?auto_225618 ) ) ( not ( = ?auto_225610 ?auto_225619 ) ) ( not ( = ?auto_225610 ?auto_225620 ) ) ( not ( = ?auto_225610 ?auto_225621 ) ) ( not ( = ?auto_225610 ?auto_225622 ) ) ( not ( = ?auto_225611 ?auto_225612 ) ) ( not ( = ?auto_225611 ?auto_225613 ) ) ( not ( = ?auto_225611 ?auto_225614 ) ) ( not ( = ?auto_225611 ?auto_225615 ) ) ( not ( = ?auto_225611 ?auto_225616 ) ) ( not ( = ?auto_225611 ?auto_225617 ) ) ( not ( = ?auto_225611 ?auto_225618 ) ) ( not ( = ?auto_225611 ?auto_225619 ) ) ( not ( = ?auto_225611 ?auto_225620 ) ) ( not ( = ?auto_225611 ?auto_225621 ) ) ( not ( = ?auto_225611 ?auto_225622 ) ) ( not ( = ?auto_225612 ?auto_225613 ) ) ( not ( = ?auto_225612 ?auto_225614 ) ) ( not ( = ?auto_225612 ?auto_225615 ) ) ( not ( = ?auto_225612 ?auto_225616 ) ) ( not ( = ?auto_225612 ?auto_225617 ) ) ( not ( = ?auto_225612 ?auto_225618 ) ) ( not ( = ?auto_225612 ?auto_225619 ) ) ( not ( = ?auto_225612 ?auto_225620 ) ) ( not ( = ?auto_225612 ?auto_225621 ) ) ( not ( = ?auto_225612 ?auto_225622 ) ) ( not ( = ?auto_225613 ?auto_225614 ) ) ( not ( = ?auto_225613 ?auto_225615 ) ) ( not ( = ?auto_225613 ?auto_225616 ) ) ( not ( = ?auto_225613 ?auto_225617 ) ) ( not ( = ?auto_225613 ?auto_225618 ) ) ( not ( = ?auto_225613 ?auto_225619 ) ) ( not ( = ?auto_225613 ?auto_225620 ) ) ( not ( = ?auto_225613 ?auto_225621 ) ) ( not ( = ?auto_225613 ?auto_225622 ) ) ( not ( = ?auto_225614 ?auto_225615 ) ) ( not ( = ?auto_225614 ?auto_225616 ) ) ( not ( = ?auto_225614 ?auto_225617 ) ) ( not ( = ?auto_225614 ?auto_225618 ) ) ( not ( = ?auto_225614 ?auto_225619 ) ) ( not ( = ?auto_225614 ?auto_225620 ) ) ( not ( = ?auto_225614 ?auto_225621 ) ) ( not ( = ?auto_225614 ?auto_225622 ) ) ( not ( = ?auto_225615 ?auto_225616 ) ) ( not ( = ?auto_225615 ?auto_225617 ) ) ( not ( = ?auto_225615 ?auto_225618 ) ) ( not ( = ?auto_225615 ?auto_225619 ) ) ( not ( = ?auto_225615 ?auto_225620 ) ) ( not ( = ?auto_225615 ?auto_225621 ) ) ( not ( = ?auto_225615 ?auto_225622 ) ) ( not ( = ?auto_225616 ?auto_225617 ) ) ( not ( = ?auto_225616 ?auto_225618 ) ) ( not ( = ?auto_225616 ?auto_225619 ) ) ( not ( = ?auto_225616 ?auto_225620 ) ) ( not ( = ?auto_225616 ?auto_225621 ) ) ( not ( = ?auto_225616 ?auto_225622 ) ) ( not ( = ?auto_225617 ?auto_225618 ) ) ( not ( = ?auto_225617 ?auto_225619 ) ) ( not ( = ?auto_225617 ?auto_225620 ) ) ( not ( = ?auto_225617 ?auto_225621 ) ) ( not ( = ?auto_225617 ?auto_225622 ) ) ( not ( = ?auto_225618 ?auto_225619 ) ) ( not ( = ?auto_225618 ?auto_225620 ) ) ( not ( = ?auto_225618 ?auto_225621 ) ) ( not ( = ?auto_225618 ?auto_225622 ) ) ( not ( = ?auto_225619 ?auto_225620 ) ) ( not ( = ?auto_225619 ?auto_225621 ) ) ( not ( = ?auto_225619 ?auto_225622 ) ) ( not ( = ?auto_225620 ?auto_225621 ) ) ( not ( = ?auto_225620 ?auto_225622 ) ) ( not ( = ?auto_225621 ?auto_225622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_225621 ?auto_225622 )
      ( !STACK ?auto_225621 ?auto_225620 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225636 - BLOCK
      ?auto_225637 - BLOCK
      ?auto_225638 - BLOCK
      ?auto_225639 - BLOCK
      ?auto_225640 - BLOCK
      ?auto_225641 - BLOCK
      ?auto_225642 - BLOCK
      ?auto_225643 - BLOCK
      ?auto_225644 - BLOCK
      ?auto_225645 - BLOCK
      ?auto_225646 - BLOCK
      ?auto_225647 - BLOCK
      ?auto_225648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_225647 ) ( ON-TABLE ?auto_225648 ) ( CLEAR ?auto_225648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_225636 ) ( ON ?auto_225637 ?auto_225636 ) ( ON ?auto_225638 ?auto_225637 ) ( ON ?auto_225639 ?auto_225638 ) ( ON ?auto_225640 ?auto_225639 ) ( ON ?auto_225641 ?auto_225640 ) ( ON ?auto_225642 ?auto_225641 ) ( ON ?auto_225643 ?auto_225642 ) ( ON ?auto_225644 ?auto_225643 ) ( ON ?auto_225645 ?auto_225644 ) ( ON ?auto_225646 ?auto_225645 ) ( ON ?auto_225647 ?auto_225646 ) ( not ( = ?auto_225636 ?auto_225637 ) ) ( not ( = ?auto_225636 ?auto_225638 ) ) ( not ( = ?auto_225636 ?auto_225639 ) ) ( not ( = ?auto_225636 ?auto_225640 ) ) ( not ( = ?auto_225636 ?auto_225641 ) ) ( not ( = ?auto_225636 ?auto_225642 ) ) ( not ( = ?auto_225636 ?auto_225643 ) ) ( not ( = ?auto_225636 ?auto_225644 ) ) ( not ( = ?auto_225636 ?auto_225645 ) ) ( not ( = ?auto_225636 ?auto_225646 ) ) ( not ( = ?auto_225636 ?auto_225647 ) ) ( not ( = ?auto_225636 ?auto_225648 ) ) ( not ( = ?auto_225637 ?auto_225638 ) ) ( not ( = ?auto_225637 ?auto_225639 ) ) ( not ( = ?auto_225637 ?auto_225640 ) ) ( not ( = ?auto_225637 ?auto_225641 ) ) ( not ( = ?auto_225637 ?auto_225642 ) ) ( not ( = ?auto_225637 ?auto_225643 ) ) ( not ( = ?auto_225637 ?auto_225644 ) ) ( not ( = ?auto_225637 ?auto_225645 ) ) ( not ( = ?auto_225637 ?auto_225646 ) ) ( not ( = ?auto_225637 ?auto_225647 ) ) ( not ( = ?auto_225637 ?auto_225648 ) ) ( not ( = ?auto_225638 ?auto_225639 ) ) ( not ( = ?auto_225638 ?auto_225640 ) ) ( not ( = ?auto_225638 ?auto_225641 ) ) ( not ( = ?auto_225638 ?auto_225642 ) ) ( not ( = ?auto_225638 ?auto_225643 ) ) ( not ( = ?auto_225638 ?auto_225644 ) ) ( not ( = ?auto_225638 ?auto_225645 ) ) ( not ( = ?auto_225638 ?auto_225646 ) ) ( not ( = ?auto_225638 ?auto_225647 ) ) ( not ( = ?auto_225638 ?auto_225648 ) ) ( not ( = ?auto_225639 ?auto_225640 ) ) ( not ( = ?auto_225639 ?auto_225641 ) ) ( not ( = ?auto_225639 ?auto_225642 ) ) ( not ( = ?auto_225639 ?auto_225643 ) ) ( not ( = ?auto_225639 ?auto_225644 ) ) ( not ( = ?auto_225639 ?auto_225645 ) ) ( not ( = ?auto_225639 ?auto_225646 ) ) ( not ( = ?auto_225639 ?auto_225647 ) ) ( not ( = ?auto_225639 ?auto_225648 ) ) ( not ( = ?auto_225640 ?auto_225641 ) ) ( not ( = ?auto_225640 ?auto_225642 ) ) ( not ( = ?auto_225640 ?auto_225643 ) ) ( not ( = ?auto_225640 ?auto_225644 ) ) ( not ( = ?auto_225640 ?auto_225645 ) ) ( not ( = ?auto_225640 ?auto_225646 ) ) ( not ( = ?auto_225640 ?auto_225647 ) ) ( not ( = ?auto_225640 ?auto_225648 ) ) ( not ( = ?auto_225641 ?auto_225642 ) ) ( not ( = ?auto_225641 ?auto_225643 ) ) ( not ( = ?auto_225641 ?auto_225644 ) ) ( not ( = ?auto_225641 ?auto_225645 ) ) ( not ( = ?auto_225641 ?auto_225646 ) ) ( not ( = ?auto_225641 ?auto_225647 ) ) ( not ( = ?auto_225641 ?auto_225648 ) ) ( not ( = ?auto_225642 ?auto_225643 ) ) ( not ( = ?auto_225642 ?auto_225644 ) ) ( not ( = ?auto_225642 ?auto_225645 ) ) ( not ( = ?auto_225642 ?auto_225646 ) ) ( not ( = ?auto_225642 ?auto_225647 ) ) ( not ( = ?auto_225642 ?auto_225648 ) ) ( not ( = ?auto_225643 ?auto_225644 ) ) ( not ( = ?auto_225643 ?auto_225645 ) ) ( not ( = ?auto_225643 ?auto_225646 ) ) ( not ( = ?auto_225643 ?auto_225647 ) ) ( not ( = ?auto_225643 ?auto_225648 ) ) ( not ( = ?auto_225644 ?auto_225645 ) ) ( not ( = ?auto_225644 ?auto_225646 ) ) ( not ( = ?auto_225644 ?auto_225647 ) ) ( not ( = ?auto_225644 ?auto_225648 ) ) ( not ( = ?auto_225645 ?auto_225646 ) ) ( not ( = ?auto_225645 ?auto_225647 ) ) ( not ( = ?auto_225645 ?auto_225648 ) ) ( not ( = ?auto_225646 ?auto_225647 ) ) ( not ( = ?auto_225646 ?auto_225648 ) ) ( not ( = ?auto_225647 ?auto_225648 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_225648 )
      ( !STACK ?auto_225648 ?auto_225647 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225662 - BLOCK
      ?auto_225663 - BLOCK
      ?auto_225664 - BLOCK
      ?auto_225665 - BLOCK
      ?auto_225666 - BLOCK
      ?auto_225667 - BLOCK
      ?auto_225668 - BLOCK
      ?auto_225669 - BLOCK
      ?auto_225670 - BLOCK
      ?auto_225671 - BLOCK
      ?auto_225672 - BLOCK
      ?auto_225673 - BLOCK
      ?auto_225674 - BLOCK
    )
    :vars
    (
      ?auto_225675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225674 ?auto_225675 ) ( ON-TABLE ?auto_225662 ) ( ON ?auto_225663 ?auto_225662 ) ( ON ?auto_225664 ?auto_225663 ) ( ON ?auto_225665 ?auto_225664 ) ( ON ?auto_225666 ?auto_225665 ) ( ON ?auto_225667 ?auto_225666 ) ( ON ?auto_225668 ?auto_225667 ) ( ON ?auto_225669 ?auto_225668 ) ( ON ?auto_225670 ?auto_225669 ) ( ON ?auto_225671 ?auto_225670 ) ( ON ?auto_225672 ?auto_225671 ) ( not ( = ?auto_225662 ?auto_225663 ) ) ( not ( = ?auto_225662 ?auto_225664 ) ) ( not ( = ?auto_225662 ?auto_225665 ) ) ( not ( = ?auto_225662 ?auto_225666 ) ) ( not ( = ?auto_225662 ?auto_225667 ) ) ( not ( = ?auto_225662 ?auto_225668 ) ) ( not ( = ?auto_225662 ?auto_225669 ) ) ( not ( = ?auto_225662 ?auto_225670 ) ) ( not ( = ?auto_225662 ?auto_225671 ) ) ( not ( = ?auto_225662 ?auto_225672 ) ) ( not ( = ?auto_225662 ?auto_225673 ) ) ( not ( = ?auto_225662 ?auto_225674 ) ) ( not ( = ?auto_225662 ?auto_225675 ) ) ( not ( = ?auto_225663 ?auto_225664 ) ) ( not ( = ?auto_225663 ?auto_225665 ) ) ( not ( = ?auto_225663 ?auto_225666 ) ) ( not ( = ?auto_225663 ?auto_225667 ) ) ( not ( = ?auto_225663 ?auto_225668 ) ) ( not ( = ?auto_225663 ?auto_225669 ) ) ( not ( = ?auto_225663 ?auto_225670 ) ) ( not ( = ?auto_225663 ?auto_225671 ) ) ( not ( = ?auto_225663 ?auto_225672 ) ) ( not ( = ?auto_225663 ?auto_225673 ) ) ( not ( = ?auto_225663 ?auto_225674 ) ) ( not ( = ?auto_225663 ?auto_225675 ) ) ( not ( = ?auto_225664 ?auto_225665 ) ) ( not ( = ?auto_225664 ?auto_225666 ) ) ( not ( = ?auto_225664 ?auto_225667 ) ) ( not ( = ?auto_225664 ?auto_225668 ) ) ( not ( = ?auto_225664 ?auto_225669 ) ) ( not ( = ?auto_225664 ?auto_225670 ) ) ( not ( = ?auto_225664 ?auto_225671 ) ) ( not ( = ?auto_225664 ?auto_225672 ) ) ( not ( = ?auto_225664 ?auto_225673 ) ) ( not ( = ?auto_225664 ?auto_225674 ) ) ( not ( = ?auto_225664 ?auto_225675 ) ) ( not ( = ?auto_225665 ?auto_225666 ) ) ( not ( = ?auto_225665 ?auto_225667 ) ) ( not ( = ?auto_225665 ?auto_225668 ) ) ( not ( = ?auto_225665 ?auto_225669 ) ) ( not ( = ?auto_225665 ?auto_225670 ) ) ( not ( = ?auto_225665 ?auto_225671 ) ) ( not ( = ?auto_225665 ?auto_225672 ) ) ( not ( = ?auto_225665 ?auto_225673 ) ) ( not ( = ?auto_225665 ?auto_225674 ) ) ( not ( = ?auto_225665 ?auto_225675 ) ) ( not ( = ?auto_225666 ?auto_225667 ) ) ( not ( = ?auto_225666 ?auto_225668 ) ) ( not ( = ?auto_225666 ?auto_225669 ) ) ( not ( = ?auto_225666 ?auto_225670 ) ) ( not ( = ?auto_225666 ?auto_225671 ) ) ( not ( = ?auto_225666 ?auto_225672 ) ) ( not ( = ?auto_225666 ?auto_225673 ) ) ( not ( = ?auto_225666 ?auto_225674 ) ) ( not ( = ?auto_225666 ?auto_225675 ) ) ( not ( = ?auto_225667 ?auto_225668 ) ) ( not ( = ?auto_225667 ?auto_225669 ) ) ( not ( = ?auto_225667 ?auto_225670 ) ) ( not ( = ?auto_225667 ?auto_225671 ) ) ( not ( = ?auto_225667 ?auto_225672 ) ) ( not ( = ?auto_225667 ?auto_225673 ) ) ( not ( = ?auto_225667 ?auto_225674 ) ) ( not ( = ?auto_225667 ?auto_225675 ) ) ( not ( = ?auto_225668 ?auto_225669 ) ) ( not ( = ?auto_225668 ?auto_225670 ) ) ( not ( = ?auto_225668 ?auto_225671 ) ) ( not ( = ?auto_225668 ?auto_225672 ) ) ( not ( = ?auto_225668 ?auto_225673 ) ) ( not ( = ?auto_225668 ?auto_225674 ) ) ( not ( = ?auto_225668 ?auto_225675 ) ) ( not ( = ?auto_225669 ?auto_225670 ) ) ( not ( = ?auto_225669 ?auto_225671 ) ) ( not ( = ?auto_225669 ?auto_225672 ) ) ( not ( = ?auto_225669 ?auto_225673 ) ) ( not ( = ?auto_225669 ?auto_225674 ) ) ( not ( = ?auto_225669 ?auto_225675 ) ) ( not ( = ?auto_225670 ?auto_225671 ) ) ( not ( = ?auto_225670 ?auto_225672 ) ) ( not ( = ?auto_225670 ?auto_225673 ) ) ( not ( = ?auto_225670 ?auto_225674 ) ) ( not ( = ?auto_225670 ?auto_225675 ) ) ( not ( = ?auto_225671 ?auto_225672 ) ) ( not ( = ?auto_225671 ?auto_225673 ) ) ( not ( = ?auto_225671 ?auto_225674 ) ) ( not ( = ?auto_225671 ?auto_225675 ) ) ( not ( = ?auto_225672 ?auto_225673 ) ) ( not ( = ?auto_225672 ?auto_225674 ) ) ( not ( = ?auto_225672 ?auto_225675 ) ) ( not ( = ?auto_225673 ?auto_225674 ) ) ( not ( = ?auto_225673 ?auto_225675 ) ) ( not ( = ?auto_225674 ?auto_225675 ) ) ( CLEAR ?auto_225672 ) ( ON ?auto_225673 ?auto_225674 ) ( CLEAR ?auto_225673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_225662 ?auto_225663 ?auto_225664 ?auto_225665 ?auto_225666 ?auto_225667 ?auto_225668 ?auto_225669 ?auto_225670 ?auto_225671 ?auto_225672 ?auto_225673 )
      ( MAKE-13PILE ?auto_225662 ?auto_225663 ?auto_225664 ?auto_225665 ?auto_225666 ?auto_225667 ?auto_225668 ?auto_225669 ?auto_225670 ?auto_225671 ?auto_225672 ?auto_225673 ?auto_225674 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225689 - BLOCK
      ?auto_225690 - BLOCK
      ?auto_225691 - BLOCK
      ?auto_225692 - BLOCK
      ?auto_225693 - BLOCK
      ?auto_225694 - BLOCK
      ?auto_225695 - BLOCK
      ?auto_225696 - BLOCK
      ?auto_225697 - BLOCK
      ?auto_225698 - BLOCK
      ?auto_225699 - BLOCK
      ?auto_225700 - BLOCK
      ?auto_225701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225701 ) ( ON-TABLE ?auto_225689 ) ( ON ?auto_225690 ?auto_225689 ) ( ON ?auto_225691 ?auto_225690 ) ( ON ?auto_225692 ?auto_225691 ) ( ON ?auto_225693 ?auto_225692 ) ( ON ?auto_225694 ?auto_225693 ) ( ON ?auto_225695 ?auto_225694 ) ( ON ?auto_225696 ?auto_225695 ) ( ON ?auto_225697 ?auto_225696 ) ( ON ?auto_225698 ?auto_225697 ) ( ON ?auto_225699 ?auto_225698 ) ( not ( = ?auto_225689 ?auto_225690 ) ) ( not ( = ?auto_225689 ?auto_225691 ) ) ( not ( = ?auto_225689 ?auto_225692 ) ) ( not ( = ?auto_225689 ?auto_225693 ) ) ( not ( = ?auto_225689 ?auto_225694 ) ) ( not ( = ?auto_225689 ?auto_225695 ) ) ( not ( = ?auto_225689 ?auto_225696 ) ) ( not ( = ?auto_225689 ?auto_225697 ) ) ( not ( = ?auto_225689 ?auto_225698 ) ) ( not ( = ?auto_225689 ?auto_225699 ) ) ( not ( = ?auto_225689 ?auto_225700 ) ) ( not ( = ?auto_225689 ?auto_225701 ) ) ( not ( = ?auto_225690 ?auto_225691 ) ) ( not ( = ?auto_225690 ?auto_225692 ) ) ( not ( = ?auto_225690 ?auto_225693 ) ) ( not ( = ?auto_225690 ?auto_225694 ) ) ( not ( = ?auto_225690 ?auto_225695 ) ) ( not ( = ?auto_225690 ?auto_225696 ) ) ( not ( = ?auto_225690 ?auto_225697 ) ) ( not ( = ?auto_225690 ?auto_225698 ) ) ( not ( = ?auto_225690 ?auto_225699 ) ) ( not ( = ?auto_225690 ?auto_225700 ) ) ( not ( = ?auto_225690 ?auto_225701 ) ) ( not ( = ?auto_225691 ?auto_225692 ) ) ( not ( = ?auto_225691 ?auto_225693 ) ) ( not ( = ?auto_225691 ?auto_225694 ) ) ( not ( = ?auto_225691 ?auto_225695 ) ) ( not ( = ?auto_225691 ?auto_225696 ) ) ( not ( = ?auto_225691 ?auto_225697 ) ) ( not ( = ?auto_225691 ?auto_225698 ) ) ( not ( = ?auto_225691 ?auto_225699 ) ) ( not ( = ?auto_225691 ?auto_225700 ) ) ( not ( = ?auto_225691 ?auto_225701 ) ) ( not ( = ?auto_225692 ?auto_225693 ) ) ( not ( = ?auto_225692 ?auto_225694 ) ) ( not ( = ?auto_225692 ?auto_225695 ) ) ( not ( = ?auto_225692 ?auto_225696 ) ) ( not ( = ?auto_225692 ?auto_225697 ) ) ( not ( = ?auto_225692 ?auto_225698 ) ) ( not ( = ?auto_225692 ?auto_225699 ) ) ( not ( = ?auto_225692 ?auto_225700 ) ) ( not ( = ?auto_225692 ?auto_225701 ) ) ( not ( = ?auto_225693 ?auto_225694 ) ) ( not ( = ?auto_225693 ?auto_225695 ) ) ( not ( = ?auto_225693 ?auto_225696 ) ) ( not ( = ?auto_225693 ?auto_225697 ) ) ( not ( = ?auto_225693 ?auto_225698 ) ) ( not ( = ?auto_225693 ?auto_225699 ) ) ( not ( = ?auto_225693 ?auto_225700 ) ) ( not ( = ?auto_225693 ?auto_225701 ) ) ( not ( = ?auto_225694 ?auto_225695 ) ) ( not ( = ?auto_225694 ?auto_225696 ) ) ( not ( = ?auto_225694 ?auto_225697 ) ) ( not ( = ?auto_225694 ?auto_225698 ) ) ( not ( = ?auto_225694 ?auto_225699 ) ) ( not ( = ?auto_225694 ?auto_225700 ) ) ( not ( = ?auto_225694 ?auto_225701 ) ) ( not ( = ?auto_225695 ?auto_225696 ) ) ( not ( = ?auto_225695 ?auto_225697 ) ) ( not ( = ?auto_225695 ?auto_225698 ) ) ( not ( = ?auto_225695 ?auto_225699 ) ) ( not ( = ?auto_225695 ?auto_225700 ) ) ( not ( = ?auto_225695 ?auto_225701 ) ) ( not ( = ?auto_225696 ?auto_225697 ) ) ( not ( = ?auto_225696 ?auto_225698 ) ) ( not ( = ?auto_225696 ?auto_225699 ) ) ( not ( = ?auto_225696 ?auto_225700 ) ) ( not ( = ?auto_225696 ?auto_225701 ) ) ( not ( = ?auto_225697 ?auto_225698 ) ) ( not ( = ?auto_225697 ?auto_225699 ) ) ( not ( = ?auto_225697 ?auto_225700 ) ) ( not ( = ?auto_225697 ?auto_225701 ) ) ( not ( = ?auto_225698 ?auto_225699 ) ) ( not ( = ?auto_225698 ?auto_225700 ) ) ( not ( = ?auto_225698 ?auto_225701 ) ) ( not ( = ?auto_225699 ?auto_225700 ) ) ( not ( = ?auto_225699 ?auto_225701 ) ) ( not ( = ?auto_225700 ?auto_225701 ) ) ( CLEAR ?auto_225699 ) ( ON ?auto_225700 ?auto_225701 ) ( CLEAR ?auto_225700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_225689 ?auto_225690 ?auto_225691 ?auto_225692 ?auto_225693 ?auto_225694 ?auto_225695 ?auto_225696 ?auto_225697 ?auto_225698 ?auto_225699 ?auto_225700 )
      ( MAKE-13PILE ?auto_225689 ?auto_225690 ?auto_225691 ?auto_225692 ?auto_225693 ?auto_225694 ?auto_225695 ?auto_225696 ?auto_225697 ?auto_225698 ?auto_225699 ?auto_225700 ?auto_225701 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225715 - BLOCK
      ?auto_225716 - BLOCK
      ?auto_225717 - BLOCK
      ?auto_225718 - BLOCK
      ?auto_225719 - BLOCK
      ?auto_225720 - BLOCK
      ?auto_225721 - BLOCK
      ?auto_225722 - BLOCK
      ?auto_225723 - BLOCK
      ?auto_225724 - BLOCK
      ?auto_225725 - BLOCK
      ?auto_225726 - BLOCK
      ?auto_225727 - BLOCK
    )
    :vars
    (
      ?auto_225728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225727 ?auto_225728 ) ( ON-TABLE ?auto_225715 ) ( ON ?auto_225716 ?auto_225715 ) ( ON ?auto_225717 ?auto_225716 ) ( ON ?auto_225718 ?auto_225717 ) ( ON ?auto_225719 ?auto_225718 ) ( ON ?auto_225720 ?auto_225719 ) ( ON ?auto_225721 ?auto_225720 ) ( ON ?auto_225722 ?auto_225721 ) ( ON ?auto_225723 ?auto_225722 ) ( ON ?auto_225724 ?auto_225723 ) ( not ( = ?auto_225715 ?auto_225716 ) ) ( not ( = ?auto_225715 ?auto_225717 ) ) ( not ( = ?auto_225715 ?auto_225718 ) ) ( not ( = ?auto_225715 ?auto_225719 ) ) ( not ( = ?auto_225715 ?auto_225720 ) ) ( not ( = ?auto_225715 ?auto_225721 ) ) ( not ( = ?auto_225715 ?auto_225722 ) ) ( not ( = ?auto_225715 ?auto_225723 ) ) ( not ( = ?auto_225715 ?auto_225724 ) ) ( not ( = ?auto_225715 ?auto_225725 ) ) ( not ( = ?auto_225715 ?auto_225726 ) ) ( not ( = ?auto_225715 ?auto_225727 ) ) ( not ( = ?auto_225715 ?auto_225728 ) ) ( not ( = ?auto_225716 ?auto_225717 ) ) ( not ( = ?auto_225716 ?auto_225718 ) ) ( not ( = ?auto_225716 ?auto_225719 ) ) ( not ( = ?auto_225716 ?auto_225720 ) ) ( not ( = ?auto_225716 ?auto_225721 ) ) ( not ( = ?auto_225716 ?auto_225722 ) ) ( not ( = ?auto_225716 ?auto_225723 ) ) ( not ( = ?auto_225716 ?auto_225724 ) ) ( not ( = ?auto_225716 ?auto_225725 ) ) ( not ( = ?auto_225716 ?auto_225726 ) ) ( not ( = ?auto_225716 ?auto_225727 ) ) ( not ( = ?auto_225716 ?auto_225728 ) ) ( not ( = ?auto_225717 ?auto_225718 ) ) ( not ( = ?auto_225717 ?auto_225719 ) ) ( not ( = ?auto_225717 ?auto_225720 ) ) ( not ( = ?auto_225717 ?auto_225721 ) ) ( not ( = ?auto_225717 ?auto_225722 ) ) ( not ( = ?auto_225717 ?auto_225723 ) ) ( not ( = ?auto_225717 ?auto_225724 ) ) ( not ( = ?auto_225717 ?auto_225725 ) ) ( not ( = ?auto_225717 ?auto_225726 ) ) ( not ( = ?auto_225717 ?auto_225727 ) ) ( not ( = ?auto_225717 ?auto_225728 ) ) ( not ( = ?auto_225718 ?auto_225719 ) ) ( not ( = ?auto_225718 ?auto_225720 ) ) ( not ( = ?auto_225718 ?auto_225721 ) ) ( not ( = ?auto_225718 ?auto_225722 ) ) ( not ( = ?auto_225718 ?auto_225723 ) ) ( not ( = ?auto_225718 ?auto_225724 ) ) ( not ( = ?auto_225718 ?auto_225725 ) ) ( not ( = ?auto_225718 ?auto_225726 ) ) ( not ( = ?auto_225718 ?auto_225727 ) ) ( not ( = ?auto_225718 ?auto_225728 ) ) ( not ( = ?auto_225719 ?auto_225720 ) ) ( not ( = ?auto_225719 ?auto_225721 ) ) ( not ( = ?auto_225719 ?auto_225722 ) ) ( not ( = ?auto_225719 ?auto_225723 ) ) ( not ( = ?auto_225719 ?auto_225724 ) ) ( not ( = ?auto_225719 ?auto_225725 ) ) ( not ( = ?auto_225719 ?auto_225726 ) ) ( not ( = ?auto_225719 ?auto_225727 ) ) ( not ( = ?auto_225719 ?auto_225728 ) ) ( not ( = ?auto_225720 ?auto_225721 ) ) ( not ( = ?auto_225720 ?auto_225722 ) ) ( not ( = ?auto_225720 ?auto_225723 ) ) ( not ( = ?auto_225720 ?auto_225724 ) ) ( not ( = ?auto_225720 ?auto_225725 ) ) ( not ( = ?auto_225720 ?auto_225726 ) ) ( not ( = ?auto_225720 ?auto_225727 ) ) ( not ( = ?auto_225720 ?auto_225728 ) ) ( not ( = ?auto_225721 ?auto_225722 ) ) ( not ( = ?auto_225721 ?auto_225723 ) ) ( not ( = ?auto_225721 ?auto_225724 ) ) ( not ( = ?auto_225721 ?auto_225725 ) ) ( not ( = ?auto_225721 ?auto_225726 ) ) ( not ( = ?auto_225721 ?auto_225727 ) ) ( not ( = ?auto_225721 ?auto_225728 ) ) ( not ( = ?auto_225722 ?auto_225723 ) ) ( not ( = ?auto_225722 ?auto_225724 ) ) ( not ( = ?auto_225722 ?auto_225725 ) ) ( not ( = ?auto_225722 ?auto_225726 ) ) ( not ( = ?auto_225722 ?auto_225727 ) ) ( not ( = ?auto_225722 ?auto_225728 ) ) ( not ( = ?auto_225723 ?auto_225724 ) ) ( not ( = ?auto_225723 ?auto_225725 ) ) ( not ( = ?auto_225723 ?auto_225726 ) ) ( not ( = ?auto_225723 ?auto_225727 ) ) ( not ( = ?auto_225723 ?auto_225728 ) ) ( not ( = ?auto_225724 ?auto_225725 ) ) ( not ( = ?auto_225724 ?auto_225726 ) ) ( not ( = ?auto_225724 ?auto_225727 ) ) ( not ( = ?auto_225724 ?auto_225728 ) ) ( not ( = ?auto_225725 ?auto_225726 ) ) ( not ( = ?auto_225725 ?auto_225727 ) ) ( not ( = ?auto_225725 ?auto_225728 ) ) ( not ( = ?auto_225726 ?auto_225727 ) ) ( not ( = ?auto_225726 ?auto_225728 ) ) ( not ( = ?auto_225727 ?auto_225728 ) ) ( ON ?auto_225726 ?auto_225727 ) ( CLEAR ?auto_225724 ) ( ON ?auto_225725 ?auto_225726 ) ( CLEAR ?auto_225725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_225715 ?auto_225716 ?auto_225717 ?auto_225718 ?auto_225719 ?auto_225720 ?auto_225721 ?auto_225722 ?auto_225723 ?auto_225724 ?auto_225725 )
      ( MAKE-13PILE ?auto_225715 ?auto_225716 ?auto_225717 ?auto_225718 ?auto_225719 ?auto_225720 ?auto_225721 ?auto_225722 ?auto_225723 ?auto_225724 ?auto_225725 ?auto_225726 ?auto_225727 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225742 - BLOCK
      ?auto_225743 - BLOCK
      ?auto_225744 - BLOCK
      ?auto_225745 - BLOCK
      ?auto_225746 - BLOCK
      ?auto_225747 - BLOCK
      ?auto_225748 - BLOCK
      ?auto_225749 - BLOCK
      ?auto_225750 - BLOCK
      ?auto_225751 - BLOCK
      ?auto_225752 - BLOCK
      ?auto_225753 - BLOCK
      ?auto_225754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225754 ) ( ON-TABLE ?auto_225742 ) ( ON ?auto_225743 ?auto_225742 ) ( ON ?auto_225744 ?auto_225743 ) ( ON ?auto_225745 ?auto_225744 ) ( ON ?auto_225746 ?auto_225745 ) ( ON ?auto_225747 ?auto_225746 ) ( ON ?auto_225748 ?auto_225747 ) ( ON ?auto_225749 ?auto_225748 ) ( ON ?auto_225750 ?auto_225749 ) ( ON ?auto_225751 ?auto_225750 ) ( not ( = ?auto_225742 ?auto_225743 ) ) ( not ( = ?auto_225742 ?auto_225744 ) ) ( not ( = ?auto_225742 ?auto_225745 ) ) ( not ( = ?auto_225742 ?auto_225746 ) ) ( not ( = ?auto_225742 ?auto_225747 ) ) ( not ( = ?auto_225742 ?auto_225748 ) ) ( not ( = ?auto_225742 ?auto_225749 ) ) ( not ( = ?auto_225742 ?auto_225750 ) ) ( not ( = ?auto_225742 ?auto_225751 ) ) ( not ( = ?auto_225742 ?auto_225752 ) ) ( not ( = ?auto_225742 ?auto_225753 ) ) ( not ( = ?auto_225742 ?auto_225754 ) ) ( not ( = ?auto_225743 ?auto_225744 ) ) ( not ( = ?auto_225743 ?auto_225745 ) ) ( not ( = ?auto_225743 ?auto_225746 ) ) ( not ( = ?auto_225743 ?auto_225747 ) ) ( not ( = ?auto_225743 ?auto_225748 ) ) ( not ( = ?auto_225743 ?auto_225749 ) ) ( not ( = ?auto_225743 ?auto_225750 ) ) ( not ( = ?auto_225743 ?auto_225751 ) ) ( not ( = ?auto_225743 ?auto_225752 ) ) ( not ( = ?auto_225743 ?auto_225753 ) ) ( not ( = ?auto_225743 ?auto_225754 ) ) ( not ( = ?auto_225744 ?auto_225745 ) ) ( not ( = ?auto_225744 ?auto_225746 ) ) ( not ( = ?auto_225744 ?auto_225747 ) ) ( not ( = ?auto_225744 ?auto_225748 ) ) ( not ( = ?auto_225744 ?auto_225749 ) ) ( not ( = ?auto_225744 ?auto_225750 ) ) ( not ( = ?auto_225744 ?auto_225751 ) ) ( not ( = ?auto_225744 ?auto_225752 ) ) ( not ( = ?auto_225744 ?auto_225753 ) ) ( not ( = ?auto_225744 ?auto_225754 ) ) ( not ( = ?auto_225745 ?auto_225746 ) ) ( not ( = ?auto_225745 ?auto_225747 ) ) ( not ( = ?auto_225745 ?auto_225748 ) ) ( not ( = ?auto_225745 ?auto_225749 ) ) ( not ( = ?auto_225745 ?auto_225750 ) ) ( not ( = ?auto_225745 ?auto_225751 ) ) ( not ( = ?auto_225745 ?auto_225752 ) ) ( not ( = ?auto_225745 ?auto_225753 ) ) ( not ( = ?auto_225745 ?auto_225754 ) ) ( not ( = ?auto_225746 ?auto_225747 ) ) ( not ( = ?auto_225746 ?auto_225748 ) ) ( not ( = ?auto_225746 ?auto_225749 ) ) ( not ( = ?auto_225746 ?auto_225750 ) ) ( not ( = ?auto_225746 ?auto_225751 ) ) ( not ( = ?auto_225746 ?auto_225752 ) ) ( not ( = ?auto_225746 ?auto_225753 ) ) ( not ( = ?auto_225746 ?auto_225754 ) ) ( not ( = ?auto_225747 ?auto_225748 ) ) ( not ( = ?auto_225747 ?auto_225749 ) ) ( not ( = ?auto_225747 ?auto_225750 ) ) ( not ( = ?auto_225747 ?auto_225751 ) ) ( not ( = ?auto_225747 ?auto_225752 ) ) ( not ( = ?auto_225747 ?auto_225753 ) ) ( not ( = ?auto_225747 ?auto_225754 ) ) ( not ( = ?auto_225748 ?auto_225749 ) ) ( not ( = ?auto_225748 ?auto_225750 ) ) ( not ( = ?auto_225748 ?auto_225751 ) ) ( not ( = ?auto_225748 ?auto_225752 ) ) ( not ( = ?auto_225748 ?auto_225753 ) ) ( not ( = ?auto_225748 ?auto_225754 ) ) ( not ( = ?auto_225749 ?auto_225750 ) ) ( not ( = ?auto_225749 ?auto_225751 ) ) ( not ( = ?auto_225749 ?auto_225752 ) ) ( not ( = ?auto_225749 ?auto_225753 ) ) ( not ( = ?auto_225749 ?auto_225754 ) ) ( not ( = ?auto_225750 ?auto_225751 ) ) ( not ( = ?auto_225750 ?auto_225752 ) ) ( not ( = ?auto_225750 ?auto_225753 ) ) ( not ( = ?auto_225750 ?auto_225754 ) ) ( not ( = ?auto_225751 ?auto_225752 ) ) ( not ( = ?auto_225751 ?auto_225753 ) ) ( not ( = ?auto_225751 ?auto_225754 ) ) ( not ( = ?auto_225752 ?auto_225753 ) ) ( not ( = ?auto_225752 ?auto_225754 ) ) ( not ( = ?auto_225753 ?auto_225754 ) ) ( ON ?auto_225753 ?auto_225754 ) ( CLEAR ?auto_225751 ) ( ON ?auto_225752 ?auto_225753 ) ( CLEAR ?auto_225752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_225742 ?auto_225743 ?auto_225744 ?auto_225745 ?auto_225746 ?auto_225747 ?auto_225748 ?auto_225749 ?auto_225750 ?auto_225751 ?auto_225752 )
      ( MAKE-13PILE ?auto_225742 ?auto_225743 ?auto_225744 ?auto_225745 ?auto_225746 ?auto_225747 ?auto_225748 ?auto_225749 ?auto_225750 ?auto_225751 ?auto_225752 ?auto_225753 ?auto_225754 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225768 - BLOCK
      ?auto_225769 - BLOCK
      ?auto_225770 - BLOCK
      ?auto_225771 - BLOCK
      ?auto_225772 - BLOCK
      ?auto_225773 - BLOCK
      ?auto_225774 - BLOCK
      ?auto_225775 - BLOCK
      ?auto_225776 - BLOCK
      ?auto_225777 - BLOCK
      ?auto_225778 - BLOCK
      ?auto_225779 - BLOCK
      ?auto_225780 - BLOCK
    )
    :vars
    (
      ?auto_225781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225780 ?auto_225781 ) ( ON-TABLE ?auto_225768 ) ( ON ?auto_225769 ?auto_225768 ) ( ON ?auto_225770 ?auto_225769 ) ( ON ?auto_225771 ?auto_225770 ) ( ON ?auto_225772 ?auto_225771 ) ( ON ?auto_225773 ?auto_225772 ) ( ON ?auto_225774 ?auto_225773 ) ( ON ?auto_225775 ?auto_225774 ) ( ON ?auto_225776 ?auto_225775 ) ( not ( = ?auto_225768 ?auto_225769 ) ) ( not ( = ?auto_225768 ?auto_225770 ) ) ( not ( = ?auto_225768 ?auto_225771 ) ) ( not ( = ?auto_225768 ?auto_225772 ) ) ( not ( = ?auto_225768 ?auto_225773 ) ) ( not ( = ?auto_225768 ?auto_225774 ) ) ( not ( = ?auto_225768 ?auto_225775 ) ) ( not ( = ?auto_225768 ?auto_225776 ) ) ( not ( = ?auto_225768 ?auto_225777 ) ) ( not ( = ?auto_225768 ?auto_225778 ) ) ( not ( = ?auto_225768 ?auto_225779 ) ) ( not ( = ?auto_225768 ?auto_225780 ) ) ( not ( = ?auto_225768 ?auto_225781 ) ) ( not ( = ?auto_225769 ?auto_225770 ) ) ( not ( = ?auto_225769 ?auto_225771 ) ) ( not ( = ?auto_225769 ?auto_225772 ) ) ( not ( = ?auto_225769 ?auto_225773 ) ) ( not ( = ?auto_225769 ?auto_225774 ) ) ( not ( = ?auto_225769 ?auto_225775 ) ) ( not ( = ?auto_225769 ?auto_225776 ) ) ( not ( = ?auto_225769 ?auto_225777 ) ) ( not ( = ?auto_225769 ?auto_225778 ) ) ( not ( = ?auto_225769 ?auto_225779 ) ) ( not ( = ?auto_225769 ?auto_225780 ) ) ( not ( = ?auto_225769 ?auto_225781 ) ) ( not ( = ?auto_225770 ?auto_225771 ) ) ( not ( = ?auto_225770 ?auto_225772 ) ) ( not ( = ?auto_225770 ?auto_225773 ) ) ( not ( = ?auto_225770 ?auto_225774 ) ) ( not ( = ?auto_225770 ?auto_225775 ) ) ( not ( = ?auto_225770 ?auto_225776 ) ) ( not ( = ?auto_225770 ?auto_225777 ) ) ( not ( = ?auto_225770 ?auto_225778 ) ) ( not ( = ?auto_225770 ?auto_225779 ) ) ( not ( = ?auto_225770 ?auto_225780 ) ) ( not ( = ?auto_225770 ?auto_225781 ) ) ( not ( = ?auto_225771 ?auto_225772 ) ) ( not ( = ?auto_225771 ?auto_225773 ) ) ( not ( = ?auto_225771 ?auto_225774 ) ) ( not ( = ?auto_225771 ?auto_225775 ) ) ( not ( = ?auto_225771 ?auto_225776 ) ) ( not ( = ?auto_225771 ?auto_225777 ) ) ( not ( = ?auto_225771 ?auto_225778 ) ) ( not ( = ?auto_225771 ?auto_225779 ) ) ( not ( = ?auto_225771 ?auto_225780 ) ) ( not ( = ?auto_225771 ?auto_225781 ) ) ( not ( = ?auto_225772 ?auto_225773 ) ) ( not ( = ?auto_225772 ?auto_225774 ) ) ( not ( = ?auto_225772 ?auto_225775 ) ) ( not ( = ?auto_225772 ?auto_225776 ) ) ( not ( = ?auto_225772 ?auto_225777 ) ) ( not ( = ?auto_225772 ?auto_225778 ) ) ( not ( = ?auto_225772 ?auto_225779 ) ) ( not ( = ?auto_225772 ?auto_225780 ) ) ( not ( = ?auto_225772 ?auto_225781 ) ) ( not ( = ?auto_225773 ?auto_225774 ) ) ( not ( = ?auto_225773 ?auto_225775 ) ) ( not ( = ?auto_225773 ?auto_225776 ) ) ( not ( = ?auto_225773 ?auto_225777 ) ) ( not ( = ?auto_225773 ?auto_225778 ) ) ( not ( = ?auto_225773 ?auto_225779 ) ) ( not ( = ?auto_225773 ?auto_225780 ) ) ( not ( = ?auto_225773 ?auto_225781 ) ) ( not ( = ?auto_225774 ?auto_225775 ) ) ( not ( = ?auto_225774 ?auto_225776 ) ) ( not ( = ?auto_225774 ?auto_225777 ) ) ( not ( = ?auto_225774 ?auto_225778 ) ) ( not ( = ?auto_225774 ?auto_225779 ) ) ( not ( = ?auto_225774 ?auto_225780 ) ) ( not ( = ?auto_225774 ?auto_225781 ) ) ( not ( = ?auto_225775 ?auto_225776 ) ) ( not ( = ?auto_225775 ?auto_225777 ) ) ( not ( = ?auto_225775 ?auto_225778 ) ) ( not ( = ?auto_225775 ?auto_225779 ) ) ( not ( = ?auto_225775 ?auto_225780 ) ) ( not ( = ?auto_225775 ?auto_225781 ) ) ( not ( = ?auto_225776 ?auto_225777 ) ) ( not ( = ?auto_225776 ?auto_225778 ) ) ( not ( = ?auto_225776 ?auto_225779 ) ) ( not ( = ?auto_225776 ?auto_225780 ) ) ( not ( = ?auto_225776 ?auto_225781 ) ) ( not ( = ?auto_225777 ?auto_225778 ) ) ( not ( = ?auto_225777 ?auto_225779 ) ) ( not ( = ?auto_225777 ?auto_225780 ) ) ( not ( = ?auto_225777 ?auto_225781 ) ) ( not ( = ?auto_225778 ?auto_225779 ) ) ( not ( = ?auto_225778 ?auto_225780 ) ) ( not ( = ?auto_225778 ?auto_225781 ) ) ( not ( = ?auto_225779 ?auto_225780 ) ) ( not ( = ?auto_225779 ?auto_225781 ) ) ( not ( = ?auto_225780 ?auto_225781 ) ) ( ON ?auto_225779 ?auto_225780 ) ( ON ?auto_225778 ?auto_225779 ) ( CLEAR ?auto_225776 ) ( ON ?auto_225777 ?auto_225778 ) ( CLEAR ?auto_225777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_225768 ?auto_225769 ?auto_225770 ?auto_225771 ?auto_225772 ?auto_225773 ?auto_225774 ?auto_225775 ?auto_225776 ?auto_225777 )
      ( MAKE-13PILE ?auto_225768 ?auto_225769 ?auto_225770 ?auto_225771 ?auto_225772 ?auto_225773 ?auto_225774 ?auto_225775 ?auto_225776 ?auto_225777 ?auto_225778 ?auto_225779 ?auto_225780 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225795 - BLOCK
      ?auto_225796 - BLOCK
      ?auto_225797 - BLOCK
      ?auto_225798 - BLOCK
      ?auto_225799 - BLOCK
      ?auto_225800 - BLOCK
      ?auto_225801 - BLOCK
      ?auto_225802 - BLOCK
      ?auto_225803 - BLOCK
      ?auto_225804 - BLOCK
      ?auto_225805 - BLOCK
      ?auto_225806 - BLOCK
      ?auto_225807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225807 ) ( ON-TABLE ?auto_225795 ) ( ON ?auto_225796 ?auto_225795 ) ( ON ?auto_225797 ?auto_225796 ) ( ON ?auto_225798 ?auto_225797 ) ( ON ?auto_225799 ?auto_225798 ) ( ON ?auto_225800 ?auto_225799 ) ( ON ?auto_225801 ?auto_225800 ) ( ON ?auto_225802 ?auto_225801 ) ( ON ?auto_225803 ?auto_225802 ) ( not ( = ?auto_225795 ?auto_225796 ) ) ( not ( = ?auto_225795 ?auto_225797 ) ) ( not ( = ?auto_225795 ?auto_225798 ) ) ( not ( = ?auto_225795 ?auto_225799 ) ) ( not ( = ?auto_225795 ?auto_225800 ) ) ( not ( = ?auto_225795 ?auto_225801 ) ) ( not ( = ?auto_225795 ?auto_225802 ) ) ( not ( = ?auto_225795 ?auto_225803 ) ) ( not ( = ?auto_225795 ?auto_225804 ) ) ( not ( = ?auto_225795 ?auto_225805 ) ) ( not ( = ?auto_225795 ?auto_225806 ) ) ( not ( = ?auto_225795 ?auto_225807 ) ) ( not ( = ?auto_225796 ?auto_225797 ) ) ( not ( = ?auto_225796 ?auto_225798 ) ) ( not ( = ?auto_225796 ?auto_225799 ) ) ( not ( = ?auto_225796 ?auto_225800 ) ) ( not ( = ?auto_225796 ?auto_225801 ) ) ( not ( = ?auto_225796 ?auto_225802 ) ) ( not ( = ?auto_225796 ?auto_225803 ) ) ( not ( = ?auto_225796 ?auto_225804 ) ) ( not ( = ?auto_225796 ?auto_225805 ) ) ( not ( = ?auto_225796 ?auto_225806 ) ) ( not ( = ?auto_225796 ?auto_225807 ) ) ( not ( = ?auto_225797 ?auto_225798 ) ) ( not ( = ?auto_225797 ?auto_225799 ) ) ( not ( = ?auto_225797 ?auto_225800 ) ) ( not ( = ?auto_225797 ?auto_225801 ) ) ( not ( = ?auto_225797 ?auto_225802 ) ) ( not ( = ?auto_225797 ?auto_225803 ) ) ( not ( = ?auto_225797 ?auto_225804 ) ) ( not ( = ?auto_225797 ?auto_225805 ) ) ( not ( = ?auto_225797 ?auto_225806 ) ) ( not ( = ?auto_225797 ?auto_225807 ) ) ( not ( = ?auto_225798 ?auto_225799 ) ) ( not ( = ?auto_225798 ?auto_225800 ) ) ( not ( = ?auto_225798 ?auto_225801 ) ) ( not ( = ?auto_225798 ?auto_225802 ) ) ( not ( = ?auto_225798 ?auto_225803 ) ) ( not ( = ?auto_225798 ?auto_225804 ) ) ( not ( = ?auto_225798 ?auto_225805 ) ) ( not ( = ?auto_225798 ?auto_225806 ) ) ( not ( = ?auto_225798 ?auto_225807 ) ) ( not ( = ?auto_225799 ?auto_225800 ) ) ( not ( = ?auto_225799 ?auto_225801 ) ) ( not ( = ?auto_225799 ?auto_225802 ) ) ( not ( = ?auto_225799 ?auto_225803 ) ) ( not ( = ?auto_225799 ?auto_225804 ) ) ( not ( = ?auto_225799 ?auto_225805 ) ) ( not ( = ?auto_225799 ?auto_225806 ) ) ( not ( = ?auto_225799 ?auto_225807 ) ) ( not ( = ?auto_225800 ?auto_225801 ) ) ( not ( = ?auto_225800 ?auto_225802 ) ) ( not ( = ?auto_225800 ?auto_225803 ) ) ( not ( = ?auto_225800 ?auto_225804 ) ) ( not ( = ?auto_225800 ?auto_225805 ) ) ( not ( = ?auto_225800 ?auto_225806 ) ) ( not ( = ?auto_225800 ?auto_225807 ) ) ( not ( = ?auto_225801 ?auto_225802 ) ) ( not ( = ?auto_225801 ?auto_225803 ) ) ( not ( = ?auto_225801 ?auto_225804 ) ) ( not ( = ?auto_225801 ?auto_225805 ) ) ( not ( = ?auto_225801 ?auto_225806 ) ) ( not ( = ?auto_225801 ?auto_225807 ) ) ( not ( = ?auto_225802 ?auto_225803 ) ) ( not ( = ?auto_225802 ?auto_225804 ) ) ( not ( = ?auto_225802 ?auto_225805 ) ) ( not ( = ?auto_225802 ?auto_225806 ) ) ( not ( = ?auto_225802 ?auto_225807 ) ) ( not ( = ?auto_225803 ?auto_225804 ) ) ( not ( = ?auto_225803 ?auto_225805 ) ) ( not ( = ?auto_225803 ?auto_225806 ) ) ( not ( = ?auto_225803 ?auto_225807 ) ) ( not ( = ?auto_225804 ?auto_225805 ) ) ( not ( = ?auto_225804 ?auto_225806 ) ) ( not ( = ?auto_225804 ?auto_225807 ) ) ( not ( = ?auto_225805 ?auto_225806 ) ) ( not ( = ?auto_225805 ?auto_225807 ) ) ( not ( = ?auto_225806 ?auto_225807 ) ) ( ON ?auto_225806 ?auto_225807 ) ( ON ?auto_225805 ?auto_225806 ) ( CLEAR ?auto_225803 ) ( ON ?auto_225804 ?auto_225805 ) ( CLEAR ?auto_225804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_225795 ?auto_225796 ?auto_225797 ?auto_225798 ?auto_225799 ?auto_225800 ?auto_225801 ?auto_225802 ?auto_225803 ?auto_225804 )
      ( MAKE-13PILE ?auto_225795 ?auto_225796 ?auto_225797 ?auto_225798 ?auto_225799 ?auto_225800 ?auto_225801 ?auto_225802 ?auto_225803 ?auto_225804 ?auto_225805 ?auto_225806 ?auto_225807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225821 - BLOCK
      ?auto_225822 - BLOCK
      ?auto_225823 - BLOCK
      ?auto_225824 - BLOCK
      ?auto_225825 - BLOCK
      ?auto_225826 - BLOCK
      ?auto_225827 - BLOCK
      ?auto_225828 - BLOCK
      ?auto_225829 - BLOCK
      ?auto_225830 - BLOCK
      ?auto_225831 - BLOCK
      ?auto_225832 - BLOCK
      ?auto_225833 - BLOCK
    )
    :vars
    (
      ?auto_225834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225833 ?auto_225834 ) ( ON-TABLE ?auto_225821 ) ( ON ?auto_225822 ?auto_225821 ) ( ON ?auto_225823 ?auto_225822 ) ( ON ?auto_225824 ?auto_225823 ) ( ON ?auto_225825 ?auto_225824 ) ( ON ?auto_225826 ?auto_225825 ) ( ON ?auto_225827 ?auto_225826 ) ( ON ?auto_225828 ?auto_225827 ) ( not ( = ?auto_225821 ?auto_225822 ) ) ( not ( = ?auto_225821 ?auto_225823 ) ) ( not ( = ?auto_225821 ?auto_225824 ) ) ( not ( = ?auto_225821 ?auto_225825 ) ) ( not ( = ?auto_225821 ?auto_225826 ) ) ( not ( = ?auto_225821 ?auto_225827 ) ) ( not ( = ?auto_225821 ?auto_225828 ) ) ( not ( = ?auto_225821 ?auto_225829 ) ) ( not ( = ?auto_225821 ?auto_225830 ) ) ( not ( = ?auto_225821 ?auto_225831 ) ) ( not ( = ?auto_225821 ?auto_225832 ) ) ( not ( = ?auto_225821 ?auto_225833 ) ) ( not ( = ?auto_225821 ?auto_225834 ) ) ( not ( = ?auto_225822 ?auto_225823 ) ) ( not ( = ?auto_225822 ?auto_225824 ) ) ( not ( = ?auto_225822 ?auto_225825 ) ) ( not ( = ?auto_225822 ?auto_225826 ) ) ( not ( = ?auto_225822 ?auto_225827 ) ) ( not ( = ?auto_225822 ?auto_225828 ) ) ( not ( = ?auto_225822 ?auto_225829 ) ) ( not ( = ?auto_225822 ?auto_225830 ) ) ( not ( = ?auto_225822 ?auto_225831 ) ) ( not ( = ?auto_225822 ?auto_225832 ) ) ( not ( = ?auto_225822 ?auto_225833 ) ) ( not ( = ?auto_225822 ?auto_225834 ) ) ( not ( = ?auto_225823 ?auto_225824 ) ) ( not ( = ?auto_225823 ?auto_225825 ) ) ( not ( = ?auto_225823 ?auto_225826 ) ) ( not ( = ?auto_225823 ?auto_225827 ) ) ( not ( = ?auto_225823 ?auto_225828 ) ) ( not ( = ?auto_225823 ?auto_225829 ) ) ( not ( = ?auto_225823 ?auto_225830 ) ) ( not ( = ?auto_225823 ?auto_225831 ) ) ( not ( = ?auto_225823 ?auto_225832 ) ) ( not ( = ?auto_225823 ?auto_225833 ) ) ( not ( = ?auto_225823 ?auto_225834 ) ) ( not ( = ?auto_225824 ?auto_225825 ) ) ( not ( = ?auto_225824 ?auto_225826 ) ) ( not ( = ?auto_225824 ?auto_225827 ) ) ( not ( = ?auto_225824 ?auto_225828 ) ) ( not ( = ?auto_225824 ?auto_225829 ) ) ( not ( = ?auto_225824 ?auto_225830 ) ) ( not ( = ?auto_225824 ?auto_225831 ) ) ( not ( = ?auto_225824 ?auto_225832 ) ) ( not ( = ?auto_225824 ?auto_225833 ) ) ( not ( = ?auto_225824 ?auto_225834 ) ) ( not ( = ?auto_225825 ?auto_225826 ) ) ( not ( = ?auto_225825 ?auto_225827 ) ) ( not ( = ?auto_225825 ?auto_225828 ) ) ( not ( = ?auto_225825 ?auto_225829 ) ) ( not ( = ?auto_225825 ?auto_225830 ) ) ( not ( = ?auto_225825 ?auto_225831 ) ) ( not ( = ?auto_225825 ?auto_225832 ) ) ( not ( = ?auto_225825 ?auto_225833 ) ) ( not ( = ?auto_225825 ?auto_225834 ) ) ( not ( = ?auto_225826 ?auto_225827 ) ) ( not ( = ?auto_225826 ?auto_225828 ) ) ( not ( = ?auto_225826 ?auto_225829 ) ) ( not ( = ?auto_225826 ?auto_225830 ) ) ( not ( = ?auto_225826 ?auto_225831 ) ) ( not ( = ?auto_225826 ?auto_225832 ) ) ( not ( = ?auto_225826 ?auto_225833 ) ) ( not ( = ?auto_225826 ?auto_225834 ) ) ( not ( = ?auto_225827 ?auto_225828 ) ) ( not ( = ?auto_225827 ?auto_225829 ) ) ( not ( = ?auto_225827 ?auto_225830 ) ) ( not ( = ?auto_225827 ?auto_225831 ) ) ( not ( = ?auto_225827 ?auto_225832 ) ) ( not ( = ?auto_225827 ?auto_225833 ) ) ( not ( = ?auto_225827 ?auto_225834 ) ) ( not ( = ?auto_225828 ?auto_225829 ) ) ( not ( = ?auto_225828 ?auto_225830 ) ) ( not ( = ?auto_225828 ?auto_225831 ) ) ( not ( = ?auto_225828 ?auto_225832 ) ) ( not ( = ?auto_225828 ?auto_225833 ) ) ( not ( = ?auto_225828 ?auto_225834 ) ) ( not ( = ?auto_225829 ?auto_225830 ) ) ( not ( = ?auto_225829 ?auto_225831 ) ) ( not ( = ?auto_225829 ?auto_225832 ) ) ( not ( = ?auto_225829 ?auto_225833 ) ) ( not ( = ?auto_225829 ?auto_225834 ) ) ( not ( = ?auto_225830 ?auto_225831 ) ) ( not ( = ?auto_225830 ?auto_225832 ) ) ( not ( = ?auto_225830 ?auto_225833 ) ) ( not ( = ?auto_225830 ?auto_225834 ) ) ( not ( = ?auto_225831 ?auto_225832 ) ) ( not ( = ?auto_225831 ?auto_225833 ) ) ( not ( = ?auto_225831 ?auto_225834 ) ) ( not ( = ?auto_225832 ?auto_225833 ) ) ( not ( = ?auto_225832 ?auto_225834 ) ) ( not ( = ?auto_225833 ?auto_225834 ) ) ( ON ?auto_225832 ?auto_225833 ) ( ON ?auto_225831 ?auto_225832 ) ( ON ?auto_225830 ?auto_225831 ) ( CLEAR ?auto_225828 ) ( ON ?auto_225829 ?auto_225830 ) ( CLEAR ?auto_225829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_225821 ?auto_225822 ?auto_225823 ?auto_225824 ?auto_225825 ?auto_225826 ?auto_225827 ?auto_225828 ?auto_225829 )
      ( MAKE-13PILE ?auto_225821 ?auto_225822 ?auto_225823 ?auto_225824 ?auto_225825 ?auto_225826 ?auto_225827 ?auto_225828 ?auto_225829 ?auto_225830 ?auto_225831 ?auto_225832 ?auto_225833 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225848 - BLOCK
      ?auto_225849 - BLOCK
      ?auto_225850 - BLOCK
      ?auto_225851 - BLOCK
      ?auto_225852 - BLOCK
      ?auto_225853 - BLOCK
      ?auto_225854 - BLOCK
      ?auto_225855 - BLOCK
      ?auto_225856 - BLOCK
      ?auto_225857 - BLOCK
      ?auto_225858 - BLOCK
      ?auto_225859 - BLOCK
      ?auto_225860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225860 ) ( ON-TABLE ?auto_225848 ) ( ON ?auto_225849 ?auto_225848 ) ( ON ?auto_225850 ?auto_225849 ) ( ON ?auto_225851 ?auto_225850 ) ( ON ?auto_225852 ?auto_225851 ) ( ON ?auto_225853 ?auto_225852 ) ( ON ?auto_225854 ?auto_225853 ) ( ON ?auto_225855 ?auto_225854 ) ( not ( = ?auto_225848 ?auto_225849 ) ) ( not ( = ?auto_225848 ?auto_225850 ) ) ( not ( = ?auto_225848 ?auto_225851 ) ) ( not ( = ?auto_225848 ?auto_225852 ) ) ( not ( = ?auto_225848 ?auto_225853 ) ) ( not ( = ?auto_225848 ?auto_225854 ) ) ( not ( = ?auto_225848 ?auto_225855 ) ) ( not ( = ?auto_225848 ?auto_225856 ) ) ( not ( = ?auto_225848 ?auto_225857 ) ) ( not ( = ?auto_225848 ?auto_225858 ) ) ( not ( = ?auto_225848 ?auto_225859 ) ) ( not ( = ?auto_225848 ?auto_225860 ) ) ( not ( = ?auto_225849 ?auto_225850 ) ) ( not ( = ?auto_225849 ?auto_225851 ) ) ( not ( = ?auto_225849 ?auto_225852 ) ) ( not ( = ?auto_225849 ?auto_225853 ) ) ( not ( = ?auto_225849 ?auto_225854 ) ) ( not ( = ?auto_225849 ?auto_225855 ) ) ( not ( = ?auto_225849 ?auto_225856 ) ) ( not ( = ?auto_225849 ?auto_225857 ) ) ( not ( = ?auto_225849 ?auto_225858 ) ) ( not ( = ?auto_225849 ?auto_225859 ) ) ( not ( = ?auto_225849 ?auto_225860 ) ) ( not ( = ?auto_225850 ?auto_225851 ) ) ( not ( = ?auto_225850 ?auto_225852 ) ) ( not ( = ?auto_225850 ?auto_225853 ) ) ( not ( = ?auto_225850 ?auto_225854 ) ) ( not ( = ?auto_225850 ?auto_225855 ) ) ( not ( = ?auto_225850 ?auto_225856 ) ) ( not ( = ?auto_225850 ?auto_225857 ) ) ( not ( = ?auto_225850 ?auto_225858 ) ) ( not ( = ?auto_225850 ?auto_225859 ) ) ( not ( = ?auto_225850 ?auto_225860 ) ) ( not ( = ?auto_225851 ?auto_225852 ) ) ( not ( = ?auto_225851 ?auto_225853 ) ) ( not ( = ?auto_225851 ?auto_225854 ) ) ( not ( = ?auto_225851 ?auto_225855 ) ) ( not ( = ?auto_225851 ?auto_225856 ) ) ( not ( = ?auto_225851 ?auto_225857 ) ) ( not ( = ?auto_225851 ?auto_225858 ) ) ( not ( = ?auto_225851 ?auto_225859 ) ) ( not ( = ?auto_225851 ?auto_225860 ) ) ( not ( = ?auto_225852 ?auto_225853 ) ) ( not ( = ?auto_225852 ?auto_225854 ) ) ( not ( = ?auto_225852 ?auto_225855 ) ) ( not ( = ?auto_225852 ?auto_225856 ) ) ( not ( = ?auto_225852 ?auto_225857 ) ) ( not ( = ?auto_225852 ?auto_225858 ) ) ( not ( = ?auto_225852 ?auto_225859 ) ) ( not ( = ?auto_225852 ?auto_225860 ) ) ( not ( = ?auto_225853 ?auto_225854 ) ) ( not ( = ?auto_225853 ?auto_225855 ) ) ( not ( = ?auto_225853 ?auto_225856 ) ) ( not ( = ?auto_225853 ?auto_225857 ) ) ( not ( = ?auto_225853 ?auto_225858 ) ) ( not ( = ?auto_225853 ?auto_225859 ) ) ( not ( = ?auto_225853 ?auto_225860 ) ) ( not ( = ?auto_225854 ?auto_225855 ) ) ( not ( = ?auto_225854 ?auto_225856 ) ) ( not ( = ?auto_225854 ?auto_225857 ) ) ( not ( = ?auto_225854 ?auto_225858 ) ) ( not ( = ?auto_225854 ?auto_225859 ) ) ( not ( = ?auto_225854 ?auto_225860 ) ) ( not ( = ?auto_225855 ?auto_225856 ) ) ( not ( = ?auto_225855 ?auto_225857 ) ) ( not ( = ?auto_225855 ?auto_225858 ) ) ( not ( = ?auto_225855 ?auto_225859 ) ) ( not ( = ?auto_225855 ?auto_225860 ) ) ( not ( = ?auto_225856 ?auto_225857 ) ) ( not ( = ?auto_225856 ?auto_225858 ) ) ( not ( = ?auto_225856 ?auto_225859 ) ) ( not ( = ?auto_225856 ?auto_225860 ) ) ( not ( = ?auto_225857 ?auto_225858 ) ) ( not ( = ?auto_225857 ?auto_225859 ) ) ( not ( = ?auto_225857 ?auto_225860 ) ) ( not ( = ?auto_225858 ?auto_225859 ) ) ( not ( = ?auto_225858 ?auto_225860 ) ) ( not ( = ?auto_225859 ?auto_225860 ) ) ( ON ?auto_225859 ?auto_225860 ) ( ON ?auto_225858 ?auto_225859 ) ( ON ?auto_225857 ?auto_225858 ) ( CLEAR ?auto_225855 ) ( ON ?auto_225856 ?auto_225857 ) ( CLEAR ?auto_225856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_225848 ?auto_225849 ?auto_225850 ?auto_225851 ?auto_225852 ?auto_225853 ?auto_225854 ?auto_225855 ?auto_225856 )
      ( MAKE-13PILE ?auto_225848 ?auto_225849 ?auto_225850 ?auto_225851 ?auto_225852 ?auto_225853 ?auto_225854 ?auto_225855 ?auto_225856 ?auto_225857 ?auto_225858 ?auto_225859 ?auto_225860 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225874 - BLOCK
      ?auto_225875 - BLOCK
      ?auto_225876 - BLOCK
      ?auto_225877 - BLOCK
      ?auto_225878 - BLOCK
      ?auto_225879 - BLOCK
      ?auto_225880 - BLOCK
      ?auto_225881 - BLOCK
      ?auto_225882 - BLOCK
      ?auto_225883 - BLOCK
      ?auto_225884 - BLOCK
      ?auto_225885 - BLOCK
      ?auto_225886 - BLOCK
    )
    :vars
    (
      ?auto_225887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225886 ?auto_225887 ) ( ON-TABLE ?auto_225874 ) ( ON ?auto_225875 ?auto_225874 ) ( ON ?auto_225876 ?auto_225875 ) ( ON ?auto_225877 ?auto_225876 ) ( ON ?auto_225878 ?auto_225877 ) ( ON ?auto_225879 ?auto_225878 ) ( ON ?auto_225880 ?auto_225879 ) ( not ( = ?auto_225874 ?auto_225875 ) ) ( not ( = ?auto_225874 ?auto_225876 ) ) ( not ( = ?auto_225874 ?auto_225877 ) ) ( not ( = ?auto_225874 ?auto_225878 ) ) ( not ( = ?auto_225874 ?auto_225879 ) ) ( not ( = ?auto_225874 ?auto_225880 ) ) ( not ( = ?auto_225874 ?auto_225881 ) ) ( not ( = ?auto_225874 ?auto_225882 ) ) ( not ( = ?auto_225874 ?auto_225883 ) ) ( not ( = ?auto_225874 ?auto_225884 ) ) ( not ( = ?auto_225874 ?auto_225885 ) ) ( not ( = ?auto_225874 ?auto_225886 ) ) ( not ( = ?auto_225874 ?auto_225887 ) ) ( not ( = ?auto_225875 ?auto_225876 ) ) ( not ( = ?auto_225875 ?auto_225877 ) ) ( not ( = ?auto_225875 ?auto_225878 ) ) ( not ( = ?auto_225875 ?auto_225879 ) ) ( not ( = ?auto_225875 ?auto_225880 ) ) ( not ( = ?auto_225875 ?auto_225881 ) ) ( not ( = ?auto_225875 ?auto_225882 ) ) ( not ( = ?auto_225875 ?auto_225883 ) ) ( not ( = ?auto_225875 ?auto_225884 ) ) ( not ( = ?auto_225875 ?auto_225885 ) ) ( not ( = ?auto_225875 ?auto_225886 ) ) ( not ( = ?auto_225875 ?auto_225887 ) ) ( not ( = ?auto_225876 ?auto_225877 ) ) ( not ( = ?auto_225876 ?auto_225878 ) ) ( not ( = ?auto_225876 ?auto_225879 ) ) ( not ( = ?auto_225876 ?auto_225880 ) ) ( not ( = ?auto_225876 ?auto_225881 ) ) ( not ( = ?auto_225876 ?auto_225882 ) ) ( not ( = ?auto_225876 ?auto_225883 ) ) ( not ( = ?auto_225876 ?auto_225884 ) ) ( not ( = ?auto_225876 ?auto_225885 ) ) ( not ( = ?auto_225876 ?auto_225886 ) ) ( not ( = ?auto_225876 ?auto_225887 ) ) ( not ( = ?auto_225877 ?auto_225878 ) ) ( not ( = ?auto_225877 ?auto_225879 ) ) ( not ( = ?auto_225877 ?auto_225880 ) ) ( not ( = ?auto_225877 ?auto_225881 ) ) ( not ( = ?auto_225877 ?auto_225882 ) ) ( not ( = ?auto_225877 ?auto_225883 ) ) ( not ( = ?auto_225877 ?auto_225884 ) ) ( not ( = ?auto_225877 ?auto_225885 ) ) ( not ( = ?auto_225877 ?auto_225886 ) ) ( not ( = ?auto_225877 ?auto_225887 ) ) ( not ( = ?auto_225878 ?auto_225879 ) ) ( not ( = ?auto_225878 ?auto_225880 ) ) ( not ( = ?auto_225878 ?auto_225881 ) ) ( not ( = ?auto_225878 ?auto_225882 ) ) ( not ( = ?auto_225878 ?auto_225883 ) ) ( not ( = ?auto_225878 ?auto_225884 ) ) ( not ( = ?auto_225878 ?auto_225885 ) ) ( not ( = ?auto_225878 ?auto_225886 ) ) ( not ( = ?auto_225878 ?auto_225887 ) ) ( not ( = ?auto_225879 ?auto_225880 ) ) ( not ( = ?auto_225879 ?auto_225881 ) ) ( not ( = ?auto_225879 ?auto_225882 ) ) ( not ( = ?auto_225879 ?auto_225883 ) ) ( not ( = ?auto_225879 ?auto_225884 ) ) ( not ( = ?auto_225879 ?auto_225885 ) ) ( not ( = ?auto_225879 ?auto_225886 ) ) ( not ( = ?auto_225879 ?auto_225887 ) ) ( not ( = ?auto_225880 ?auto_225881 ) ) ( not ( = ?auto_225880 ?auto_225882 ) ) ( not ( = ?auto_225880 ?auto_225883 ) ) ( not ( = ?auto_225880 ?auto_225884 ) ) ( not ( = ?auto_225880 ?auto_225885 ) ) ( not ( = ?auto_225880 ?auto_225886 ) ) ( not ( = ?auto_225880 ?auto_225887 ) ) ( not ( = ?auto_225881 ?auto_225882 ) ) ( not ( = ?auto_225881 ?auto_225883 ) ) ( not ( = ?auto_225881 ?auto_225884 ) ) ( not ( = ?auto_225881 ?auto_225885 ) ) ( not ( = ?auto_225881 ?auto_225886 ) ) ( not ( = ?auto_225881 ?auto_225887 ) ) ( not ( = ?auto_225882 ?auto_225883 ) ) ( not ( = ?auto_225882 ?auto_225884 ) ) ( not ( = ?auto_225882 ?auto_225885 ) ) ( not ( = ?auto_225882 ?auto_225886 ) ) ( not ( = ?auto_225882 ?auto_225887 ) ) ( not ( = ?auto_225883 ?auto_225884 ) ) ( not ( = ?auto_225883 ?auto_225885 ) ) ( not ( = ?auto_225883 ?auto_225886 ) ) ( not ( = ?auto_225883 ?auto_225887 ) ) ( not ( = ?auto_225884 ?auto_225885 ) ) ( not ( = ?auto_225884 ?auto_225886 ) ) ( not ( = ?auto_225884 ?auto_225887 ) ) ( not ( = ?auto_225885 ?auto_225886 ) ) ( not ( = ?auto_225885 ?auto_225887 ) ) ( not ( = ?auto_225886 ?auto_225887 ) ) ( ON ?auto_225885 ?auto_225886 ) ( ON ?auto_225884 ?auto_225885 ) ( ON ?auto_225883 ?auto_225884 ) ( ON ?auto_225882 ?auto_225883 ) ( CLEAR ?auto_225880 ) ( ON ?auto_225881 ?auto_225882 ) ( CLEAR ?auto_225881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_225874 ?auto_225875 ?auto_225876 ?auto_225877 ?auto_225878 ?auto_225879 ?auto_225880 ?auto_225881 )
      ( MAKE-13PILE ?auto_225874 ?auto_225875 ?auto_225876 ?auto_225877 ?auto_225878 ?auto_225879 ?auto_225880 ?auto_225881 ?auto_225882 ?auto_225883 ?auto_225884 ?auto_225885 ?auto_225886 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225901 - BLOCK
      ?auto_225902 - BLOCK
      ?auto_225903 - BLOCK
      ?auto_225904 - BLOCK
      ?auto_225905 - BLOCK
      ?auto_225906 - BLOCK
      ?auto_225907 - BLOCK
      ?auto_225908 - BLOCK
      ?auto_225909 - BLOCK
      ?auto_225910 - BLOCK
      ?auto_225911 - BLOCK
      ?auto_225912 - BLOCK
      ?auto_225913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225913 ) ( ON-TABLE ?auto_225901 ) ( ON ?auto_225902 ?auto_225901 ) ( ON ?auto_225903 ?auto_225902 ) ( ON ?auto_225904 ?auto_225903 ) ( ON ?auto_225905 ?auto_225904 ) ( ON ?auto_225906 ?auto_225905 ) ( ON ?auto_225907 ?auto_225906 ) ( not ( = ?auto_225901 ?auto_225902 ) ) ( not ( = ?auto_225901 ?auto_225903 ) ) ( not ( = ?auto_225901 ?auto_225904 ) ) ( not ( = ?auto_225901 ?auto_225905 ) ) ( not ( = ?auto_225901 ?auto_225906 ) ) ( not ( = ?auto_225901 ?auto_225907 ) ) ( not ( = ?auto_225901 ?auto_225908 ) ) ( not ( = ?auto_225901 ?auto_225909 ) ) ( not ( = ?auto_225901 ?auto_225910 ) ) ( not ( = ?auto_225901 ?auto_225911 ) ) ( not ( = ?auto_225901 ?auto_225912 ) ) ( not ( = ?auto_225901 ?auto_225913 ) ) ( not ( = ?auto_225902 ?auto_225903 ) ) ( not ( = ?auto_225902 ?auto_225904 ) ) ( not ( = ?auto_225902 ?auto_225905 ) ) ( not ( = ?auto_225902 ?auto_225906 ) ) ( not ( = ?auto_225902 ?auto_225907 ) ) ( not ( = ?auto_225902 ?auto_225908 ) ) ( not ( = ?auto_225902 ?auto_225909 ) ) ( not ( = ?auto_225902 ?auto_225910 ) ) ( not ( = ?auto_225902 ?auto_225911 ) ) ( not ( = ?auto_225902 ?auto_225912 ) ) ( not ( = ?auto_225902 ?auto_225913 ) ) ( not ( = ?auto_225903 ?auto_225904 ) ) ( not ( = ?auto_225903 ?auto_225905 ) ) ( not ( = ?auto_225903 ?auto_225906 ) ) ( not ( = ?auto_225903 ?auto_225907 ) ) ( not ( = ?auto_225903 ?auto_225908 ) ) ( not ( = ?auto_225903 ?auto_225909 ) ) ( not ( = ?auto_225903 ?auto_225910 ) ) ( not ( = ?auto_225903 ?auto_225911 ) ) ( not ( = ?auto_225903 ?auto_225912 ) ) ( not ( = ?auto_225903 ?auto_225913 ) ) ( not ( = ?auto_225904 ?auto_225905 ) ) ( not ( = ?auto_225904 ?auto_225906 ) ) ( not ( = ?auto_225904 ?auto_225907 ) ) ( not ( = ?auto_225904 ?auto_225908 ) ) ( not ( = ?auto_225904 ?auto_225909 ) ) ( not ( = ?auto_225904 ?auto_225910 ) ) ( not ( = ?auto_225904 ?auto_225911 ) ) ( not ( = ?auto_225904 ?auto_225912 ) ) ( not ( = ?auto_225904 ?auto_225913 ) ) ( not ( = ?auto_225905 ?auto_225906 ) ) ( not ( = ?auto_225905 ?auto_225907 ) ) ( not ( = ?auto_225905 ?auto_225908 ) ) ( not ( = ?auto_225905 ?auto_225909 ) ) ( not ( = ?auto_225905 ?auto_225910 ) ) ( not ( = ?auto_225905 ?auto_225911 ) ) ( not ( = ?auto_225905 ?auto_225912 ) ) ( not ( = ?auto_225905 ?auto_225913 ) ) ( not ( = ?auto_225906 ?auto_225907 ) ) ( not ( = ?auto_225906 ?auto_225908 ) ) ( not ( = ?auto_225906 ?auto_225909 ) ) ( not ( = ?auto_225906 ?auto_225910 ) ) ( not ( = ?auto_225906 ?auto_225911 ) ) ( not ( = ?auto_225906 ?auto_225912 ) ) ( not ( = ?auto_225906 ?auto_225913 ) ) ( not ( = ?auto_225907 ?auto_225908 ) ) ( not ( = ?auto_225907 ?auto_225909 ) ) ( not ( = ?auto_225907 ?auto_225910 ) ) ( not ( = ?auto_225907 ?auto_225911 ) ) ( not ( = ?auto_225907 ?auto_225912 ) ) ( not ( = ?auto_225907 ?auto_225913 ) ) ( not ( = ?auto_225908 ?auto_225909 ) ) ( not ( = ?auto_225908 ?auto_225910 ) ) ( not ( = ?auto_225908 ?auto_225911 ) ) ( not ( = ?auto_225908 ?auto_225912 ) ) ( not ( = ?auto_225908 ?auto_225913 ) ) ( not ( = ?auto_225909 ?auto_225910 ) ) ( not ( = ?auto_225909 ?auto_225911 ) ) ( not ( = ?auto_225909 ?auto_225912 ) ) ( not ( = ?auto_225909 ?auto_225913 ) ) ( not ( = ?auto_225910 ?auto_225911 ) ) ( not ( = ?auto_225910 ?auto_225912 ) ) ( not ( = ?auto_225910 ?auto_225913 ) ) ( not ( = ?auto_225911 ?auto_225912 ) ) ( not ( = ?auto_225911 ?auto_225913 ) ) ( not ( = ?auto_225912 ?auto_225913 ) ) ( ON ?auto_225912 ?auto_225913 ) ( ON ?auto_225911 ?auto_225912 ) ( ON ?auto_225910 ?auto_225911 ) ( ON ?auto_225909 ?auto_225910 ) ( CLEAR ?auto_225907 ) ( ON ?auto_225908 ?auto_225909 ) ( CLEAR ?auto_225908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_225901 ?auto_225902 ?auto_225903 ?auto_225904 ?auto_225905 ?auto_225906 ?auto_225907 ?auto_225908 )
      ( MAKE-13PILE ?auto_225901 ?auto_225902 ?auto_225903 ?auto_225904 ?auto_225905 ?auto_225906 ?auto_225907 ?auto_225908 ?auto_225909 ?auto_225910 ?auto_225911 ?auto_225912 ?auto_225913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225927 - BLOCK
      ?auto_225928 - BLOCK
      ?auto_225929 - BLOCK
      ?auto_225930 - BLOCK
      ?auto_225931 - BLOCK
      ?auto_225932 - BLOCK
      ?auto_225933 - BLOCK
      ?auto_225934 - BLOCK
      ?auto_225935 - BLOCK
      ?auto_225936 - BLOCK
      ?auto_225937 - BLOCK
      ?auto_225938 - BLOCK
      ?auto_225939 - BLOCK
    )
    :vars
    (
      ?auto_225940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225939 ?auto_225940 ) ( ON-TABLE ?auto_225927 ) ( ON ?auto_225928 ?auto_225927 ) ( ON ?auto_225929 ?auto_225928 ) ( ON ?auto_225930 ?auto_225929 ) ( ON ?auto_225931 ?auto_225930 ) ( ON ?auto_225932 ?auto_225931 ) ( not ( = ?auto_225927 ?auto_225928 ) ) ( not ( = ?auto_225927 ?auto_225929 ) ) ( not ( = ?auto_225927 ?auto_225930 ) ) ( not ( = ?auto_225927 ?auto_225931 ) ) ( not ( = ?auto_225927 ?auto_225932 ) ) ( not ( = ?auto_225927 ?auto_225933 ) ) ( not ( = ?auto_225927 ?auto_225934 ) ) ( not ( = ?auto_225927 ?auto_225935 ) ) ( not ( = ?auto_225927 ?auto_225936 ) ) ( not ( = ?auto_225927 ?auto_225937 ) ) ( not ( = ?auto_225927 ?auto_225938 ) ) ( not ( = ?auto_225927 ?auto_225939 ) ) ( not ( = ?auto_225927 ?auto_225940 ) ) ( not ( = ?auto_225928 ?auto_225929 ) ) ( not ( = ?auto_225928 ?auto_225930 ) ) ( not ( = ?auto_225928 ?auto_225931 ) ) ( not ( = ?auto_225928 ?auto_225932 ) ) ( not ( = ?auto_225928 ?auto_225933 ) ) ( not ( = ?auto_225928 ?auto_225934 ) ) ( not ( = ?auto_225928 ?auto_225935 ) ) ( not ( = ?auto_225928 ?auto_225936 ) ) ( not ( = ?auto_225928 ?auto_225937 ) ) ( not ( = ?auto_225928 ?auto_225938 ) ) ( not ( = ?auto_225928 ?auto_225939 ) ) ( not ( = ?auto_225928 ?auto_225940 ) ) ( not ( = ?auto_225929 ?auto_225930 ) ) ( not ( = ?auto_225929 ?auto_225931 ) ) ( not ( = ?auto_225929 ?auto_225932 ) ) ( not ( = ?auto_225929 ?auto_225933 ) ) ( not ( = ?auto_225929 ?auto_225934 ) ) ( not ( = ?auto_225929 ?auto_225935 ) ) ( not ( = ?auto_225929 ?auto_225936 ) ) ( not ( = ?auto_225929 ?auto_225937 ) ) ( not ( = ?auto_225929 ?auto_225938 ) ) ( not ( = ?auto_225929 ?auto_225939 ) ) ( not ( = ?auto_225929 ?auto_225940 ) ) ( not ( = ?auto_225930 ?auto_225931 ) ) ( not ( = ?auto_225930 ?auto_225932 ) ) ( not ( = ?auto_225930 ?auto_225933 ) ) ( not ( = ?auto_225930 ?auto_225934 ) ) ( not ( = ?auto_225930 ?auto_225935 ) ) ( not ( = ?auto_225930 ?auto_225936 ) ) ( not ( = ?auto_225930 ?auto_225937 ) ) ( not ( = ?auto_225930 ?auto_225938 ) ) ( not ( = ?auto_225930 ?auto_225939 ) ) ( not ( = ?auto_225930 ?auto_225940 ) ) ( not ( = ?auto_225931 ?auto_225932 ) ) ( not ( = ?auto_225931 ?auto_225933 ) ) ( not ( = ?auto_225931 ?auto_225934 ) ) ( not ( = ?auto_225931 ?auto_225935 ) ) ( not ( = ?auto_225931 ?auto_225936 ) ) ( not ( = ?auto_225931 ?auto_225937 ) ) ( not ( = ?auto_225931 ?auto_225938 ) ) ( not ( = ?auto_225931 ?auto_225939 ) ) ( not ( = ?auto_225931 ?auto_225940 ) ) ( not ( = ?auto_225932 ?auto_225933 ) ) ( not ( = ?auto_225932 ?auto_225934 ) ) ( not ( = ?auto_225932 ?auto_225935 ) ) ( not ( = ?auto_225932 ?auto_225936 ) ) ( not ( = ?auto_225932 ?auto_225937 ) ) ( not ( = ?auto_225932 ?auto_225938 ) ) ( not ( = ?auto_225932 ?auto_225939 ) ) ( not ( = ?auto_225932 ?auto_225940 ) ) ( not ( = ?auto_225933 ?auto_225934 ) ) ( not ( = ?auto_225933 ?auto_225935 ) ) ( not ( = ?auto_225933 ?auto_225936 ) ) ( not ( = ?auto_225933 ?auto_225937 ) ) ( not ( = ?auto_225933 ?auto_225938 ) ) ( not ( = ?auto_225933 ?auto_225939 ) ) ( not ( = ?auto_225933 ?auto_225940 ) ) ( not ( = ?auto_225934 ?auto_225935 ) ) ( not ( = ?auto_225934 ?auto_225936 ) ) ( not ( = ?auto_225934 ?auto_225937 ) ) ( not ( = ?auto_225934 ?auto_225938 ) ) ( not ( = ?auto_225934 ?auto_225939 ) ) ( not ( = ?auto_225934 ?auto_225940 ) ) ( not ( = ?auto_225935 ?auto_225936 ) ) ( not ( = ?auto_225935 ?auto_225937 ) ) ( not ( = ?auto_225935 ?auto_225938 ) ) ( not ( = ?auto_225935 ?auto_225939 ) ) ( not ( = ?auto_225935 ?auto_225940 ) ) ( not ( = ?auto_225936 ?auto_225937 ) ) ( not ( = ?auto_225936 ?auto_225938 ) ) ( not ( = ?auto_225936 ?auto_225939 ) ) ( not ( = ?auto_225936 ?auto_225940 ) ) ( not ( = ?auto_225937 ?auto_225938 ) ) ( not ( = ?auto_225937 ?auto_225939 ) ) ( not ( = ?auto_225937 ?auto_225940 ) ) ( not ( = ?auto_225938 ?auto_225939 ) ) ( not ( = ?auto_225938 ?auto_225940 ) ) ( not ( = ?auto_225939 ?auto_225940 ) ) ( ON ?auto_225938 ?auto_225939 ) ( ON ?auto_225937 ?auto_225938 ) ( ON ?auto_225936 ?auto_225937 ) ( ON ?auto_225935 ?auto_225936 ) ( ON ?auto_225934 ?auto_225935 ) ( CLEAR ?auto_225932 ) ( ON ?auto_225933 ?auto_225934 ) ( CLEAR ?auto_225933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_225927 ?auto_225928 ?auto_225929 ?auto_225930 ?auto_225931 ?auto_225932 ?auto_225933 )
      ( MAKE-13PILE ?auto_225927 ?auto_225928 ?auto_225929 ?auto_225930 ?auto_225931 ?auto_225932 ?auto_225933 ?auto_225934 ?auto_225935 ?auto_225936 ?auto_225937 ?auto_225938 ?auto_225939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225954 - BLOCK
      ?auto_225955 - BLOCK
      ?auto_225956 - BLOCK
      ?auto_225957 - BLOCK
      ?auto_225958 - BLOCK
      ?auto_225959 - BLOCK
      ?auto_225960 - BLOCK
      ?auto_225961 - BLOCK
      ?auto_225962 - BLOCK
      ?auto_225963 - BLOCK
      ?auto_225964 - BLOCK
      ?auto_225965 - BLOCK
      ?auto_225966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_225966 ) ( ON-TABLE ?auto_225954 ) ( ON ?auto_225955 ?auto_225954 ) ( ON ?auto_225956 ?auto_225955 ) ( ON ?auto_225957 ?auto_225956 ) ( ON ?auto_225958 ?auto_225957 ) ( ON ?auto_225959 ?auto_225958 ) ( not ( = ?auto_225954 ?auto_225955 ) ) ( not ( = ?auto_225954 ?auto_225956 ) ) ( not ( = ?auto_225954 ?auto_225957 ) ) ( not ( = ?auto_225954 ?auto_225958 ) ) ( not ( = ?auto_225954 ?auto_225959 ) ) ( not ( = ?auto_225954 ?auto_225960 ) ) ( not ( = ?auto_225954 ?auto_225961 ) ) ( not ( = ?auto_225954 ?auto_225962 ) ) ( not ( = ?auto_225954 ?auto_225963 ) ) ( not ( = ?auto_225954 ?auto_225964 ) ) ( not ( = ?auto_225954 ?auto_225965 ) ) ( not ( = ?auto_225954 ?auto_225966 ) ) ( not ( = ?auto_225955 ?auto_225956 ) ) ( not ( = ?auto_225955 ?auto_225957 ) ) ( not ( = ?auto_225955 ?auto_225958 ) ) ( not ( = ?auto_225955 ?auto_225959 ) ) ( not ( = ?auto_225955 ?auto_225960 ) ) ( not ( = ?auto_225955 ?auto_225961 ) ) ( not ( = ?auto_225955 ?auto_225962 ) ) ( not ( = ?auto_225955 ?auto_225963 ) ) ( not ( = ?auto_225955 ?auto_225964 ) ) ( not ( = ?auto_225955 ?auto_225965 ) ) ( not ( = ?auto_225955 ?auto_225966 ) ) ( not ( = ?auto_225956 ?auto_225957 ) ) ( not ( = ?auto_225956 ?auto_225958 ) ) ( not ( = ?auto_225956 ?auto_225959 ) ) ( not ( = ?auto_225956 ?auto_225960 ) ) ( not ( = ?auto_225956 ?auto_225961 ) ) ( not ( = ?auto_225956 ?auto_225962 ) ) ( not ( = ?auto_225956 ?auto_225963 ) ) ( not ( = ?auto_225956 ?auto_225964 ) ) ( not ( = ?auto_225956 ?auto_225965 ) ) ( not ( = ?auto_225956 ?auto_225966 ) ) ( not ( = ?auto_225957 ?auto_225958 ) ) ( not ( = ?auto_225957 ?auto_225959 ) ) ( not ( = ?auto_225957 ?auto_225960 ) ) ( not ( = ?auto_225957 ?auto_225961 ) ) ( not ( = ?auto_225957 ?auto_225962 ) ) ( not ( = ?auto_225957 ?auto_225963 ) ) ( not ( = ?auto_225957 ?auto_225964 ) ) ( not ( = ?auto_225957 ?auto_225965 ) ) ( not ( = ?auto_225957 ?auto_225966 ) ) ( not ( = ?auto_225958 ?auto_225959 ) ) ( not ( = ?auto_225958 ?auto_225960 ) ) ( not ( = ?auto_225958 ?auto_225961 ) ) ( not ( = ?auto_225958 ?auto_225962 ) ) ( not ( = ?auto_225958 ?auto_225963 ) ) ( not ( = ?auto_225958 ?auto_225964 ) ) ( not ( = ?auto_225958 ?auto_225965 ) ) ( not ( = ?auto_225958 ?auto_225966 ) ) ( not ( = ?auto_225959 ?auto_225960 ) ) ( not ( = ?auto_225959 ?auto_225961 ) ) ( not ( = ?auto_225959 ?auto_225962 ) ) ( not ( = ?auto_225959 ?auto_225963 ) ) ( not ( = ?auto_225959 ?auto_225964 ) ) ( not ( = ?auto_225959 ?auto_225965 ) ) ( not ( = ?auto_225959 ?auto_225966 ) ) ( not ( = ?auto_225960 ?auto_225961 ) ) ( not ( = ?auto_225960 ?auto_225962 ) ) ( not ( = ?auto_225960 ?auto_225963 ) ) ( not ( = ?auto_225960 ?auto_225964 ) ) ( not ( = ?auto_225960 ?auto_225965 ) ) ( not ( = ?auto_225960 ?auto_225966 ) ) ( not ( = ?auto_225961 ?auto_225962 ) ) ( not ( = ?auto_225961 ?auto_225963 ) ) ( not ( = ?auto_225961 ?auto_225964 ) ) ( not ( = ?auto_225961 ?auto_225965 ) ) ( not ( = ?auto_225961 ?auto_225966 ) ) ( not ( = ?auto_225962 ?auto_225963 ) ) ( not ( = ?auto_225962 ?auto_225964 ) ) ( not ( = ?auto_225962 ?auto_225965 ) ) ( not ( = ?auto_225962 ?auto_225966 ) ) ( not ( = ?auto_225963 ?auto_225964 ) ) ( not ( = ?auto_225963 ?auto_225965 ) ) ( not ( = ?auto_225963 ?auto_225966 ) ) ( not ( = ?auto_225964 ?auto_225965 ) ) ( not ( = ?auto_225964 ?auto_225966 ) ) ( not ( = ?auto_225965 ?auto_225966 ) ) ( ON ?auto_225965 ?auto_225966 ) ( ON ?auto_225964 ?auto_225965 ) ( ON ?auto_225963 ?auto_225964 ) ( ON ?auto_225962 ?auto_225963 ) ( ON ?auto_225961 ?auto_225962 ) ( CLEAR ?auto_225959 ) ( ON ?auto_225960 ?auto_225961 ) ( CLEAR ?auto_225960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_225954 ?auto_225955 ?auto_225956 ?auto_225957 ?auto_225958 ?auto_225959 ?auto_225960 )
      ( MAKE-13PILE ?auto_225954 ?auto_225955 ?auto_225956 ?auto_225957 ?auto_225958 ?auto_225959 ?auto_225960 ?auto_225961 ?auto_225962 ?auto_225963 ?auto_225964 ?auto_225965 ?auto_225966 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_225980 - BLOCK
      ?auto_225981 - BLOCK
      ?auto_225982 - BLOCK
      ?auto_225983 - BLOCK
      ?auto_225984 - BLOCK
      ?auto_225985 - BLOCK
      ?auto_225986 - BLOCK
      ?auto_225987 - BLOCK
      ?auto_225988 - BLOCK
      ?auto_225989 - BLOCK
      ?auto_225990 - BLOCK
      ?auto_225991 - BLOCK
      ?auto_225992 - BLOCK
    )
    :vars
    (
      ?auto_225993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_225992 ?auto_225993 ) ( ON-TABLE ?auto_225980 ) ( ON ?auto_225981 ?auto_225980 ) ( ON ?auto_225982 ?auto_225981 ) ( ON ?auto_225983 ?auto_225982 ) ( ON ?auto_225984 ?auto_225983 ) ( not ( = ?auto_225980 ?auto_225981 ) ) ( not ( = ?auto_225980 ?auto_225982 ) ) ( not ( = ?auto_225980 ?auto_225983 ) ) ( not ( = ?auto_225980 ?auto_225984 ) ) ( not ( = ?auto_225980 ?auto_225985 ) ) ( not ( = ?auto_225980 ?auto_225986 ) ) ( not ( = ?auto_225980 ?auto_225987 ) ) ( not ( = ?auto_225980 ?auto_225988 ) ) ( not ( = ?auto_225980 ?auto_225989 ) ) ( not ( = ?auto_225980 ?auto_225990 ) ) ( not ( = ?auto_225980 ?auto_225991 ) ) ( not ( = ?auto_225980 ?auto_225992 ) ) ( not ( = ?auto_225980 ?auto_225993 ) ) ( not ( = ?auto_225981 ?auto_225982 ) ) ( not ( = ?auto_225981 ?auto_225983 ) ) ( not ( = ?auto_225981 ?auto_225984 ) ) ( not ( = ?auto_225981 ?auto_225985 ) ) ( not ( = ?auto_225981 ?auto_225986 ) ) ( not ( = ?auto_225981 ?auto_225987 ) ) ( not ( = ?auto_225981 ?auto_225988 ) ) ( not ( = ?auto_225981 ?auto_225989 ) ) ( not ( = ?auto_225981 ?auto_225990 ) ) ( not ( = ?auto_225981 ?auto_225991 ) ) ( not ( = ?auto_225981 ?auto_225992 ) ) ( not ( = ?auto_225981 ?auto_225993 ) ) ( not ( = ?auto_225982 ?auto_225983 ) ) ( not ( = ?auto_225982 ?auto_225984 ) ) ( not ( = ?auto_225982 ?auto_225985 ) ) ( not ( = ?auto_225982 ?auto_225986 ) ) ( not ( = ?auto_225982 ?auto_225987 ) ) ( not ( = ?auto_225982 ?auto_225988 ) ) ( not ( = ?auto_225982 ?auto_225989 ) ) ( not ( = ?auto_225982 ?auto_225990 ) ) ( not ( = ?auto_225982 ?auto_225991 ) ) ( not ( = ?auto_225982 ?auto_225992 ) ) ( not ( = ?auto_225982 ?auto_225993 ) ) ( not ( = ?auto_225983 ?auto_225984 ) ) ( not ( = ?auto_225983 ?auto_225985 ) ) ( not ( = ?auto_225983 ?auto_225986 ) ) ( not ( = ?auto_225983 ?auto_225987 ) ) ( not ( = ?auto_225983 ?auto_225988 ) ) ( not ( = ?auto_225983 ?auto_225989 ) ) ( not ( = ?auto_225983 ?auto_225990 ) ) ( not ( = ?auto_225983 ?auto_225991 ) ) ( not ( = ?auto_225983 ?auto_225992 ) ) ( not ( = ?auto_225983 ?auto_225993 ) ) ( not ( = ?auto_225984 ?auto_225985 ) ) ( not ( = ?auto_225984 ?auto_225986 ) ) ( not ( = ?auto_225984 ?auto_225987 ) ) ( not ( = ?auto_225984 ?auto_225988 ) ) ( not ( = ?auto_225984 ?auto_225989 ) ) ( not ( = ?auto_225984 ?auto_225990 ) ) ( not ( = ?auto_225984 ?auto_225991 ) ) ( not ( = ?auto_225984 ?auto_225992 ) ) ( not ( = ?auto_225984 ?auto_225993 ) ) ( not ( = ?auto_225985 ?auto_225986 ) ) ( not ( = ?auto_225985 ?auto_225987 ) ) ( not ( = ?auto_225985 ?auto_225988 ) ) ( not ( = ?auto_225985 ?auto_225989 ) ) ( not ( = ?auto_225985 ?auto_225990 ) ) ( not ( = ?auto_225985 ?auto_225991 ) ) ( not ( = ?auto_225985 ?auto_225992 ) ) ( not ( = ?auto_225985 ?auto_225993 ) ) ( not ( = ?auto_225986 ?auto_225987 ) ) ( not ( = ?auto_225986 ?auto_225988 ) ) ( not ( = ?auto_225986 ?auto_225989 ) ) ( not ( = ?auto_225986 ?auto_225990 ) ) ( not ( = ?auto_225986 ?auto_225991 ) ) ( not ( = ?auto_225986 ?auto_225992 ) ) ( not ( = ?auto_225986 ?auto_225993 ) ) ( not ( = ?auto_225987 ?auto_225988 ) ) ( not ( = ?auto_225987 ?auto_225989 ) ) ( not ( = ?auto_225987 ?auto_225990 ) ) ( not ( = ?auto_225987 ?auto_225991 ) ) ( not ( = ?auto_225987 ?auto_225992 ) ) ( not ( = ?auto_225987 ?auto_225993 ) ) ( not ( = ?auto_225988 ?auto_225989 ) ) ( not ( = ?auto_225988 ?auto_225990 ) ) ( not ( = ?auto_225988 ?auto_225991 ) ) ( not ( = ?auto_225988 ?auto_225992 ) ) ( not ( = ?auto_225988 ?auto_225993 ) ) ( not ( = ?auto_225989 ?auto_225990 ) ) ( not ( = ?auto_225989 ?auto_225991 ) ) ( not ( = ?auto_225989 ?auto_225992 ) ) ( not ( = ?auto_225989 ?auto_225993 ) ) ( not ( = ?auto_225990 ?auto_225991 ) ) ( not ( = ?auto_225990 ?auto_225992 ) ) ( not ( = ?auto_225990 ?auto_225993 ) ) ( not ( = ?auto_225991 ?auto_225992 ) ) ( not ( = ?auto_225991 ?auto_225993 ) ) ( not ( = ?auto_225992 ?auto_225993 ) ) ( ON ?auto_225991 ?auto_225992 ) ( ON ?auto_225990 ?auto_225991 ) ( ON ?auto_225989 ?auto_225990 ) ( ON ?auto_225988 ?auto_225989 ) ( ON ?auto_225987 ?auto_225988 ) ( ON ?auto_225986 ?auto_225987 ) ( CLEAR ?auto_225984 ) ( ON ?auto_225985 ?auto_225986 ) ( CLEAR ?auto_225985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_225980 ?auto_225981 ?auto_225982 ?auto_225983 ?auto_225984 ?auto_225985 )
      ( MAKE-13PILE ?auto_225980 ?auto_225981 ?auto_225982 ?auto_225983 ?auto_225984 ?auto_225985 ?auto_225986 ?auto_225987 ?auto_225988 ?auto_225989 ?auto_225990 ?auto_225991 ?auto_225992 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226007 - BLOCK
      ?auto_226008 - BLOCK
      ?auto_226009 - BLOCK
      ?auto_226010 - BLOCK
      ?auto_226011 - BLOCK
      ?auto_226012 - BLOCK
      ?auto_226013 - BLOCK
      ?auto_226014 - BLOCK
      ?auto_226015 - BLOCK
      ?auto_226016 - BLOCK
      ?auto_226017 - BLOCK
      ?auto_226018 - BLOCK
      ?auto_226019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226019 ) ( ON-TABLE ?auto_226007 ) ( ON ?auto_226008 ?auto_226007 ) ( ON ?auto_226009 ?auto_226008 ) ( ON ?auto_226010 ?auto_226009 ) ( ON ?auto_226011 ?auto_226010 ) ( not ( = ?auto_226007 ?auto_226008 ) ) ( not ( = ?auto_226007 ?auto_226009 ) ) ( not ( = ?auto_226007 ?auto_226010 ) ) ( not ( = ?auto_226007 ?auto_226011 ) ) ( not ( = ?auto_226007 ?auto_226012 ) ) ( not ( = ?auto_226007 ?auto_226013 ) ) ( not ( = ?auto_226007 ?auto_226014 ) ) ( not ( = ?auto_226007 ?auto_226015 ) ) ( not ( = ?auto_226007 ?auto_226016 ) ) ( not ( = ?auto_226007 ?auto_226017 ) ) ( not ( = ?auto_226007 ?auto_226018 ) ) ( not ( = ?auto_226007 ?auto_226019 ) ) ( not ( = ?auto_226008 ?auto_226009 ) ) ( not ( = ?auto_226008 ?auto_226010 ) ) ( not ( = ?auto_226008 ?auto_226011 ) ) ( not ( = ?auto_226008 ?auto_226012 ) ) ( not ( = ?auto_226008 ?auto_226013 ) ) ( not ( = ?auto_226008 ?auto_226014 ) ) ( not ( = ?auto_226008 ?auto_226015 ) ) ( not ( = ?auto_226008 ?auto_226016 ) ) ( not ( = ?auto_226008 ?auto_226017 ) ) ( not ( = ?auto_226008 ?auto_226018 ) ) ( not ( = ?auto_226008 ?auto_226019 ) ) ( not ( = ?auto_226009 ?auto_226010 ) ) ( not ( = ?auto_226009 ?auto_226011 ) ) ( not ( = ?auto_226009 ?auto_226012 ) ) ( not ( = ?auto_226009 ?auto_226013 ) ) ( not ( = ?auto_226009 ?auto_226014 ) ) ( not ( = ?auto_226009 ?auto_226015 ) ) ( not ( = ?auto_226009 ?auto_226016 ) ) ( not ( = ?auto_226009 ?auto_226017 ) ) ( not ( = ?auto_226009 ?auto_226018 ) ) ( not ( = ?auto_226009 ?auto_226019 ) ) ( not ( = ?auto_226010 ?auto_226011 ) ) ( not ( = ?auto_226010 ?auto_226012 ) ) ( not ( = ?auto_226010 ?auto_226013 ) ) ( not ( = ?auto_226010 ?auto_226014 ) ) ( not ( = ?auto_226010 ?auto_226015 ) ) ( not ( = ?auto_226010 ?auto_226016 ) ) ( not ( = ?auto_226010 ?auto_226017 ) ) ( not ( = ?auto_226010 ?auto_226018 ) ) ( not ( = ?auto_226010 ?auto_226019 ) ) ( not ( = ?auto_226011 ?auto_226012 ) ) ( not ( = ?auto_226011 ?auto_226013 ) ) ( not ( = ?auto_226011 ?auto_226014 ) ) ( not ( = ?auto_226011 ?auto_226015 ) ) ( not ( = ?auto_226011 ?auto_226016 ) ) ( not ( = ?auto_226011 ?auto_226017 ) ) ( not ( = ?auto_226011 ?auto_226018 ) ) ( not ( = ?auto_226011 ?auto_226019 ) ) ( not ( = ?auto_226012 ?auto_226013 ) ) ( not ( = ?auto_226012 ?auto_226014 ) ) ( not ( = ?auto_226012 ?auto_226015 ) ) ( not ( = ?auto_226012 ?auto_226016 ) ) ( not ( = ?auto_226012 ?auto_226017 ) ) ( not ( = ?auto_226012 ?auto_226018 ) ) ( not ( = ?auto_226012 ?auto_226019 ) ) ( not ( = ?auto_226013 ?auto_226014 ) ) ( not ( = ?auto_226013 ?auto_226015 ) ) ( not ( = ?auto_226013 ?auto_226016 ) ) ( not ( = ?auto_226013 ?auto_226017 ) ) ( not ( = ?auto_226013 ?auto_226018 ) ) ( not ( = ?auto_226013 ?auto_226019 ) ) ( not ( = ?auto_226014 ?auto_226015 ) ) ( not ( = ?auto_226014 ?auto_226016 ) ) ( not ( = ?auto_226014 ?auto_226017 ) ) ( not ( = ?auto_226014 ?auto_226018 ) ) ( not ( = ?auto_226014 ?auto_226019 ) ) ( not ( = ?auto_226015 ?auto_226016 ) ) ( not ( = ?auto_226015 ?auto_226017 ) ) ( not ( = ?auto_226015 ?auto_226018 ) ) ( not ( = ?auto_226015 ?auto_226019 ) ) ( not ( = ?auto_226016 ?auto_226017 ) ) ( not ( = ?auto_226016 ?auto_226018 ) ) ( not ( = ?auto_226016 ?auto_226019 ) ) ( not ( = ?auto_226017 ?auto_226018 ) ) ( not ( = ?auto_226017 ?auto_226019 ) ) ( not ( = ?auto_226018 ?auto_226019 ) ) ( ON ?auto_226018 ?auto_226019 ) ( ON ?auto_226017 ?auto_226018 ) ( ON ?auto_226016 ?auto_226017 ) ( ON ?auto_226015 ?auto_226016 ) ( ON ?auto_226014 ?auto_226015 ) ( ON ?auto_226013 ?auto_226014 ) ( CLEAR ?auto_226011 ) ( ON ?auto_226012 ?auto_226013 ) ( CLEAR ?auto_226012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_226007 ?auto_226008 ?auto_226009 ?auto_226010 ?auto_226011 ?auto_226012 )
      ( MAKE-13PILE ?auto_226007 ?auto_226008 ?auto_226009 ?auto_226010 ?auto_226011 ?auto_226012 ?auto_226013 ?auto_226014 ?auto_226015 ?auto_226016 ?auto_226017 ?auto_226018 ?auto_226019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226033 - BLOCK
      ?auto_226034 - BLOCK
      ?auto_226035 - BLOCK
      ?auto_226036 - BLOCK
      ?auto_226037 - BLOCK
      ?auto_226038 - BLOCK
      ?auto_226039 - BLOCK
      ?auto_226040 - BLOCK
      ?auto_226041 - BLOCK
      ?auto_226042 - BLOCK
      ?auto_226043 - BLOCK
      ?auto_226044 - BLOCK
      ?auto_226045 - BLOCK
    )
    :vars
    (
      ?auto_226046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226045 ?auto_226046 ) ( ON-TABLE ?auto_226033 ) ( ON ?auto_226034 ?auto_226033 ) ( ON ?auto_226035 ?auto_226034 ) ( ON ?auto_226036 ?auto_226035 ) ( not ( = ?auto_226033 ?auto_226034 ) ) ( not ( = ?auto_226033 ?auto_226035 ) ) ( not ( = ?auto_226033 ?auto_226036 ) ) ( not ( = ?auto_226033 ?auto_226037 ) ) ( not ( = ?auto_226033 ?auto_226038 ) ) ( not ( = ?auto_226033 ?auto_226039 ) ) ( not ( = ?auto_226033 ?auto_226040 ) ) ( not ( = ?auto_226033 ?auto_226041 ) ) ( not ( = ?auto_226033 ?auto_226042 ) ) ( not ( = ?auto_226033 ?auto_226043 ) ) ( not ( = ?auto_226033 ?auto_226044 ) ) ( not ( = ?auto_226033 ?auto_226045 ) ) ( not ( = ?auto_226033 ?auto_226046 ) ) ( not ( = ?auto_226034 ?auto_226035 ) ) ( not ( = ?auto_226034 ?auto_226036 ) ) ( not ( = ?auto_226034 ?auto_226037 ) ) ( not ( = ?auto_226034 ?auto_226038 ) ) ( not ( = ?auto_226034 ?auto_226039 ) ) ( not ( = ?auto_226034 ?auto_226040 ) ) ( not ( = ?auto_226034 ?auto_226041 ) ) ( not ( = ?auto_226034 ?auto_226042 ) ) ( not ( = ?auto_226034 ?auto_226043 ) ) ( not ( = ?auto_226034 ?auto_226044 ) ) ( not ( = ?auto_226034 ?auto_226045 ) ) ( not ( = ?auto_226034 ?auto_226046 ) ) ( not ( = ?auto_226035 ?auto_226036 ) ) ( not ( = ?auto_226035 ?auto_226037 ) ) ( not ( = ?auto_226035 ?auto_226038 ) ) ( not ( = ?auto_226035 ?auto_226039 ) ) ( not ( = ?auto_226035 ?auto_226040 ) ) ( not ( = ?auto_226035 ?auto_226041 ) ) ( not ( = ?auto_226035 ?auto_226042 ) ) ( not ( = ?auto_226035 ?auto_226043 ) ) ( not ( = ?auto_226035 ?auto_226044 ) ) ( not ( = ?auto_226035 ?auto_226045 ) ) ( not ( = ?auto_226035 ?auto_226046 ) ) ( not ( = ?auto_226036 ?auto_226037 ) ) ( not ( = ?auto_226036 ?auto_226038 ) ) ( not ( = ?auto_226036 ?auto_226039 ) ) ( not ( = ?auto_226036 ?auto_226040 ) ) ( not ( = ?auto_226036 ?auto_226041 ) ) ( not ( = ?auto_226036 ?auto_226042 ) ) ( not ( = ?auto_226036 ?auto_226043 ) ) ( not ( = ?auto_226036 ?auto_226044 ) ) ( not ( = ?auto_226036 ?auto_226045 ) ) ( not ( = ?auto_226036 ?auto_226046 ) ) ( not ( = ?auto_226037 ?auto_226038 ) ) ( not ( = ?auto_226037 ?auto_226039 ) ) ( not ( = ?auto_226037 ?auto_226040 ) ) ( not ( = ?auto_226037 ?auto_226041 ) ) ( not ( = ?auto_226037 ?auto_226042 ) ) ( not ( = ?auto_226037 ?auto_226043 ) ) ( not ( = ?auto_226037 ?auto_226044 ) ) ( not ( = ?auto_226037 ?auto_226045 ) ) ( not ( = ?auto_226037 ?auto_226046 ) ) ( not ( = ?auto_226038 ?auto_226039 ) ) ( not ( = ?auto_226038 ?auto_226040 ) ) ( not ( = ?auto_226038 ?auto_226041 ) ) ( not ( = ?auto_226038 ?auto_226042 ) ) ( not ( = ?auto_226038 ?auto_226043 ) ) ( not ( = ?auto_226038 ?auto_226044 ) ) ( not ( = ?auto_226038 ?auto_226045 ) ) ( not ( = ?auto_226038 ?auto_226046 ) ) ( not ( = ?auto_226039 ?auto_226040 ) ) ( not ( = ?auto_226039 ?auto_226041 ) ) ( not ( = ?auto_226039 ?auto_226042 ) ) ( not ( = ?auto_226039 ?auto_226043 ) ) ( not ( = ?auto_226039 ?auto_226044 ) ) ( not ( = ?auto_226039 ?auto_226045 ) ) ( not ( = ?auto_226039 ?auto_226046 ) ) ( not ( = ?auto_226040 ?auto_226041 ) ) ( not ( = ?auto_226040 ?auto_226042 ) ) ( not ( = ?auto_226040 ?auto_226043 ) ) ( not ( = ?auto_226040 ?auto_226044 ) ) ( not ( = ?auto_226040 ?auto_226045 ) ) ( not ( = ?auto_226040 ?auto_226046 ) ) ( not ( = ?auto_226041 ?auto_226042 ) ) ( not ( = ?auto_226041 ?auto_226043 ) ) ( not ( = ?auto_226041 ?auto_226044 ) ) ( not ( = ?auto_226041 ?auto_226045 ) ) ( not ( = ?auto_226041 ?auto_226046 ) ) ( not ( = ?auto_226042 ?auto_226043 ) ) ( not ( = ?auto_226042 ?auto_226044 ) ) ( not ( = ?auto_226042 ?auto_226045 ) ) ( not ( = ?auto_226042 ?auto_226046 ) ) ( not ( = ?auto_226043 ?auto_226044 ) ) ( not ( = ?auto_226043 ?auto_226045 ) ) ( not ( = ?auto_226043 ?auto_226046 ) ) ( not ( = ?auto_226044 ?auto_226045 ) ) ( not ( = ?auto_226044 ?auto_226046 ) ) ( not ( = ?auto_226045 ?auto_226046 ) ) ( ON ?auto_226044 ?auto_226045 ) ( ON ?auto_226043 ?auto_226044 ) ( ON ?auto_226042 ?auto_226043 ) ( ON ?auto_226041 ?auto_226042 ) ( ON ?auto_226040 ?auto_226041 ) ( ON ?auto_226039 ?auto_226040 ) ( ON ?auto_226038 ?auto_226039 ) ( CLEAR ?auto_226036 ) ( ON ?auto_226037 ?auto_226038 ) ( CLEAR ?auto_226037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226033 ?auto_226034 ?auto_226035 ?auto_226036 ?auto_226037 )
      ( MAKE-13PILE ?auto_226033 ?auto_226034 ?auto_226035 ?auto_226036 ?auto_226037 ?auto_226038 ?auto_226039 ?auto_226040 ?auto_226041 ?auto_226042 ?auto_226043 ?auto_226044 ?auto_226045 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226060 - BLOCK
      ?auto_226061 - BLOCK
      ?auto_226062 - BLOCK
      ?auto_226063 - BLOCK
      ?auto_226064 - BLOCK
      ?auto_226065 - BLOCK
      ?auto_226066 - BLOCK
      ?auto_226067 - BLOCK
      ?auto_226068 - BLOCK
      ?auto_226069 - BLOCK
      ?auto_226070 - BLOCK
      ?auto_226071 - BLOCK
      ?auto_226072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226072 ) ( ON-TABLE ?auto_226060 ) ( ON ?auto_226061 ?auto_226060 ) ( ON ?auto_226062 ?auto_226061 ) ( ON ?auto_226063 ?auto_226062 ) ( not ( = ?auto_226060 ?auto_226061 ) ) ( not ( = ?auto_226060 ?auto_226062 ) ) ( not ( = ?auto_226060 ?auto_226063 ) ) ( not ( = ?auto_226060 ?auto_226064 ) ) ( not ( = ?auto_226060 ?auto_226065 ) ) ( not ( = ?auto_226060 ?auto_226066 ) ) ( not ( = ?auto_226060 ?auto_226067 ) ) ( not ( = ?auto_226060 ?auto_226068 ) ) ( not ( = ?auto_226060 ?auto_226069 ) ) ( not ( = ?auto_226060 ?auto_226070 ) ) ( not ( = ?auto_226060 ?auto_226071 ) ) ( not ( = ?auto_226060 ?auto_226072 ) ) ( not ( = ?auto_226061 ?auto_226062 ) ) ( not ( = ?auto_226061 ?auto_226063 ) ) ( not ( = ?auto_226061 ?auto_226064 ) ) ( not ( = ?auto_226061 ?auto_226065 ) ) ( not ( = ?auto_226061 ?auto_226066 ) ) ( not ( = ?auto_226061 ?auto_226067 ) ) ( not ( = ?auto_226061 ?auto_226068 ) ) ( not ( = ?auto_226061 ?auto_226069 ) ) ( not ( = ?auto_226061 ?auto_226070 ) ) ( not ( = ?auto_226061 ?auto_226071 ) ) ( not ( = ?auto_226061 ?auto_226072 ) ) ( not ( = ?auto_226062 ?auto_226063 ) ) ( not ( = ?auto_226062 ?auto_226064 ) ) ( not ( = ?auto_226062 ?auto_226065 ) ) ( not ( = ?auto_226062 ?auto_226066 ) ) ( not ( = ?auto_226062 ?auto_226067 ) ) ( not ( = ?auto_226062 ?auto_226068 ) ) ( not ( = ?auto_226062 ?auto_226069 ) ) ( not ( = ?auto_226062 ?auto_226070 ) ) ( not ( = ?auto_226062 ?auto_226071 ) ) ( not ( = ?auto_226062 ?auto_226072 ) ) ( not ( = ?auto_226063 ?auto_226064 ) ) ( not ( = ?auto_226063 ?auto_226065 ) ) ( not ( = ?auto_226063 ?auto_226066 ) ) ( not ( = ?auto_226063 ?auto_226067 ) ) ( not ( = ?auto_226063 ?auto_226068 ) ) ( not ( = ?auto_226063 ?auto_226069 ) ) ( not ( = ?auto_226063 ?auto_226070 ) ) ( not ( = ?auto_226063 ?auto_226071 ) ) ( not ( = ?auto_226063 ?auto_226072 ) ) ( not ( = ?auto_226064 ?auto_226065 ) ) ( not ( = ?auto_226064 ?auto_226066 ) ) ( not ( = ?auto_226064 ?auto_226067 ) ) ( not ( = ?auto_226064 ?auto_226068 ) ) ( not ( = ?auto_226064 ?auto_226069 ) ) ( not ( = ?auto_226064 ?auto_226070 ) ) ( not ( = ?auto_226064 ?auto_226071 ) ) ( not ( = ?auto_226064 ?auto_226072 ) ) ( not ( = ?auto_226065 ?auto_226066 ) ) ( not ( = ?auto_226065 ?auto_226067 ) ) ( not ( = ?auto_226065 ?auto_226068 ) ) ( not ( = ?auto_226065 ?auto_226069 ) ) ( not ( = ?auto_226065 ?auto_226070 ) ) ( not ( = ?auto_226065 ?auto_226071 ) ) ( not ( = ?auto_226065 ?auto_226072 ) ) ( not ( = ?auto_226066 ?auto_226067 ) ) ( not ( = ?auto_226066 ?auto_226068 ) ) ( not ( = ?auto_226066 ?auto_226069 ) ) ( not ( = ?auto_226066 ?auto_226070 ) ) ( not ( = ?auto_226066 ?auto_226071 ) ) ( not ( = ?auto_226066 ?auto_226072 ) ) ( not ( = ?auto_226067 ?auto_226068 ) ) ( not ( = ?auto_226067 ?auto_226069 ) ) ( not ( = ?auto_226067 ?auto_226070 ) ) ( not ( = ?auto_226067 ?auto_226071 ) ) ( not ( = ?auto_226067 ?auto_226072 ) ) ( not ( = ?auto_226068 ?auto_226069 ) ) ( not ( = ?auto_226068 ?auto_226070 ) ) ( not ( = ?auto_226068 ?auto_226071 ) ) ( not ( = ?auto_226068 ?auto_226072 ) ) ( not ( = ?auto_226069 ?auto_226070 ) ) ( not ( = ?auto_226069 ?auto_226071 ) ) ( not ( = ?auto_226069 ?auto_226072 ) ) ( not ( = ?auto_226070 ?auto_226071 ) ) ( not ( = ?auto_226070 ?auto_226072 ) ) ( not ( = ?auto_226071 ?auto_226072 ) ) ( ON ?auto_226071 ?auto_226072 ) ( ON ?auto_226070 ?auto_226071 ) ( ON ?auto_226069 ?auto_226070 ) ( ON ?auto_226068 ?auto_226069 ) ( ON ?auto_226067 ?auto_226068 ) ( ON ?auto_226066 ?auto_226067 ) ( ON ?auto_226065 ?auto_226066 ) ( CLEAR ?auto_226063 ) ( ON ?auto_226064 ?auto_226065 ) ( CLEAR ?auto_226064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226060 ?auto_226061 ?auto_226062 ?auto_226063 ?auto_226064 )
      ( MAKE-13PILE ?auto_226060 ?auto_226061 ?auto_226062 ?auto_226063 ?auto_226064 ?auto_226065 ?auto_226066 ?auto_226067 ?auto_226068 ?auto_226069 ?auto_226070 ?auto_226071 ?auto_226072 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226086 - BLOCK
      ?auto_226087 - BLOCK
      ?auto_226088 - BLOCK
      ?auto_226089 - BLOCK
      ?auto_226090 - BLOCK
      ?auto_226091 - BLOCK
      ?auto_226092 - BLOCK
      ?auto_226093 - BLOCK
      ?auto_226094 - BLOCK
      ?auto_226095 - BLOCK
      ?auto_226096 - BLOCK
      ?auto_226097 - BLOCK
      ?auto_226098 - BLOCK
    )
    :vars
    (
      ?auto_226099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226098 ?auto_226099 ) ( ON-TABLE ?auto_226086 ) ( ON ?auto_226087 ?auto_226086 ) ( ON ?auto_226088 ?auto_226087 ) ( not ( = ?auto_226086 ?auto_226087 ) ) ( not ( = ?auto_226086 ?auto_226088 ) ) ( not ( = ?auto_226086 ?auto_226089 ) ) ( not ( = ?auto_226086 ?auto_226090 ) ) ( not ( = ?auto_226086 ?auto_226091 ) ) ( not ( = ?auto_226086 ?auto_226092 ) ) ( not ( = ?auto_226086 ?auto_226093 ) ) ( not ( = ?auto_226086 ?auto_226094 ) ) ( not ( = ?auto_226086 ?auto_226095 ) ) ( not ( = ?auto_226086 ?auto_226096 ) ) ( not ( = ?auto_226086 ?auto_226097 ) ) ( not ( = ?auto_226086 ?auto_226098 ) ) ( not ( = ?auto_226086 ?auto_226099 ) ) ( not ( = ?auto_226087 ?auto_226088 ) ) ( not ( = ?auto_226087 ?auto_226089 ) ) ( not ( = ?auto_226087 ?auto_226090 ) ) ( not ( = ?auto_226087 ?auto_226091 ) ) ( not ( = ?auto_226087 ?auto_226092 ) ) ( not ( = ?auto_226087 ?auto_226093 ) ) ( not ( = ?auto_226087 ?auto_226094 ) ) ( not ( = ?auto_226087 ?auto_226095 ) ) ( not ( = ?auto_226087 ?auto_226096 ) ) ( not ( = ?auto_226087 ?auto_226097 ) ) ( not ( = ?auto_226087 ?auto_226098 ) ) ( not ( = ?auto_226087 ?auto_226099 ) ) ( not ( = ?auto_226088 ?auto_226089 ) ) ( not ( = ?auto_226088 ?auto_226090 ) ) ( not ( = ?auto_226088 ?auto_226091 ) ) ( not ( = ?auto_226088 ?auto_226092 ) ) ( not ( = ?auto_226088 ?auto_226093 ) ) ( not ( = ?auto_226088 ?auto_226094 ) ) ( not ( = ?auto_226088 ?auto_226095 ) ) ( not ( = ?auto_226088 ?auto_226096 ) ) ( not ( = ?auto_226088 ?auto_226097 ) ) ( not ( = ?auto_226088 ?auto_226098 ) ) ( not ( = ?auto_226088 ?auto_226099 ) ) ( not ( = ?auto_226089 ?auto_226090 ) ) ( not ( = ?auto_226089 ?auto_226091 ) ) ( not ( = ?auto_226089 ?auto_226092 ) ) ( not ( = ?auto_226089 ?auto_226093 ) ) ( not ( = ?auto_226089 ?auto_226094 ) ) ( not ( = ?auto_226089 ?auto_226095 ) ) ( not ( = ?auto_226089 ?auto_226096 ) ) ( not ( = ?auto_226089 ?auto_226097 ) ) ( not ( = ?auto_226089 ?auto_226098 ) ) ( not ( = ?auto_226089 ?auto_226099 ) ) ( not ( = ?auto_226090 ?auto_226091 ) ) ( not ( = ?auto_226090 ?auto_226092 ) ) ( not ( = ?auto_226090 ?auto_226093 ) ) ( not ( = ?auto_226090 ?auto_226094 ) ) ( not ( = ?auto_226090 ?auto_226095 ) ) ( not ( = ?auto_226090 ?auto_226096 ) ) ( not ( = ?auto_226090 ?auto_226097 ) ) ( not ( = ?auto_226090 ?auto_226098 ) ) ( not ( = ?auto_226090 ?auto_226099 ) ) ( not ( = ?auto_226091 ?auto_226092 ) ) ( not ( = ?auto_226091 ?auto_226093 ) ) ( not ( = ?auto_226091 ?auto_226094 ) ) ( not ( = ?auto_226091 ?auto_226095 ) ) ( not ( = ?auto_226091 ?auto_226096 ) ) ( not ( = ?auto_226091 ?auto_226097 ) ) ( not ( = ?auto_226091 ?auto_226098 ) ) ( not ( = ?auto_226091 ?auto_226099 ) ) ( not ( = ?auto_226092 ?auto_226093 ) ) ( not ( = ?auto_226092 ?auto_226094 ) ) ( not ( = ?auto_226092 ?auto_226095 ) ) ( not ( = ?auto_226092 ?auto_226096 ) ) ( not ( = ?auto_226092 ?auto_226097 ) ) ( not ( = ?auto_226092 ?auto_226098 ) ) ( not ( = ?auto_226092 ?auto_226099 ) ) ( not ( = ?auto_226093 ?auto_226094 ) ) ( not ( = ?auto_226093 ?auto_226095 ) ) ( not ( = ?auto_226093 ?auto_226096 ) ) ( not ( = ?auto_226093 ?auto_226097 ) ) ( not ( = ?auto_226093 ?auto_226098 ) ) ( not ( = ?auto_226093 ?auto_226099 ) ) ( not ( = ?auto_226094 ?auto_226095 ) ) ( not ( = ?auto_226094 ?auto_226096 ) ) ( not ( = ?auto_226094 ?auto_226097 ) ) ( not ( = ?auto_226094 ?auto_226098 ) ) ( not ( = ?auto_226094 ?auto_226099 ) ) ( not ( = ?auto_226095 ?auto_226096 ) ) ( not ( = ?auto_226095 ?auto_226097 ) ) ( not ( = ?auto_226095 ?auto_226098 ) ) ( not ( = ?auto_226095 ?auto_226099 ) ) ( not ( = ?auto_226096 ?auto_226097 ) ) ( not ( = ?auto_226096 ?auto_226098 ) ) ( not ( = ?auto_226096 ?auto_226099 ) ) ( not ( = ?auto_226097 ?auto_226098 ) ) ( not ( = ?auto_226097 ?auto_226099 ) ) ( not ( = ?auto_226098 ?auto_226099 ) ) ( ON ?auto_226097 ?auto_226098 ) ( ON ?auto_226096 ?auto_226097 ) ( ON ?auto_226095 ?auto_226096 ) ( ON ?auto_226094 ?auto_226095 ) ( ON ?auto_226093 ?auto_226094 ) ( ON ?auto_226092 ?auto_226093 ) ( ON ?auto_226091 ?auto_226092 ) ( ON ?auto_226090 ?auto_226091 ) ( CLEAR ?auto_226088 ) ( ON ?auto_226089 ?auto_226090 ) ( CLEAR ?auto_226089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226086 ?auto_226087 ?auto_226088 ?auto_226089 )
      ( MAKE-13PILE ?auto_226086 ?auto_226087 ?auto_226088 ?auto_226089 ?auto_226090 ?auto_226091 ?auto_226092 ?auto_226093 ?auto_226094 ?auto_226095 ?auto_226096 ?auto_226097 ?auto_226098 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226113 - BLOCK
      ?auto_226114 - BLOCK
      ?auto_226115 - BLOCK
      ?auto_226116 - BLOCK
      ?auto_226117 - BLOCK
      ?auto_226118 - BLOCK
      ?auto_226119 - BLOCK
      ?auto_226120 - BLOCK
      ?auto_226121 - BLOCK
      ?auto_226122 - BLOCK
      ?auto_226123 - BLOCK
      ?auto_226124 - BLOCK
      ?auto_226125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226125 ) ( ON-TABLE ?auto_226113 ) ( ON ?auto_226114 ?auto_226113 ) ( ON ?auto_226115 ?auto_226114 ) ( not ( = ?auto_226113 ?auto_226114 ) ) ( not ( = ?auto_226113 ?auto_226115 ) ) ( not ( = ?auto_226113 ?auto_226116 ) ) ( not ( = ?auto_226113 ?auto_226117 ) ) ( not ( = ?auto_226113 ?auto_226118 ) ) ( not ( = ?auto_226113 ?auto_226119 ) ) ( not ( = ?auto_226113 ?auto_226120 ) ) ( not ( = ?auto_226113 ?auto_226121 ) ) ( not ( = ?auto_226113 ?auto_226122 ) ) ( not ( = ?auto_226113 ?auto_226123 ) ) ( not ( = ?auto_226113 ?auto_226124 ) ) ( not ( = ?auto_226113 ?auto_226125 ) ) ( not ( = ?auto_226114 ?auto_226115 ) ) ( not ( = ?auto_226114 ?auto_226116 ) ) ( not ( = ?auto_226114 ?auto_226117 ) ) ( not ( = ?auto_226114 ?auto_226118 ) ) ( not ( = ?auto_226114 ?auto_226119 ) ) ( not ( = ?auto_226114 ?auto_226120 ) ) ( not ( = ?auto_226114 ?auto_226121 ) ) ( not ( = ?auto_226114 ?auto_226122 ) ) ( not ( = ?auto_226114 ?auto_226123 ) ) ( not ( = ?auto_226114 ?auto_226124 ) ) ( not ( = ?auto_226114 ?auto_226125 ) ) ( not ( = ?auto_226115 ?auto_226116 ) ) ( not ( = ?auto_226115 ?auto_226117 ) ) ( not ( = ?auto_226115 ?auto_226118 ) ) ( not ( = ?auto_226115 ?auto_226119 ) ) ( not ( = ?auto_226115 ?auto_226120 ) ) ( not ( = ?auto_226115 ?auto_226121 ) ) ( not ( = ?auto_226115 ?auto_226122 ) ) ( not ( = ?auto_226115 ?auto_226123 ) ) ( not ( = ?auto_226115 ?auto_226124 ) ) ( not ( = ?auto_226115 ?auto_226125 ) ) ( not ( = ?auto_226116 ?auto_226117 ) ) ( not ( = ?auto_226116 ?auto_226118 ) ) ( not ( = ?auto_226116 ?auto_226119 ) ) ( not ( = ?auto_226116 ?auto_226120 ) ) ( not ( = ?auto_226116 ?auto_226121 ) ) ( not ( = ?auto_226116 ?auto_226122 ) ) ( not ( = ?auto_226116 ?auto_226123 ) ) ( not ( = ?auto_226116 ?auto_226124 ) ) ( not ( = ?auto_226116 ?auto_226125 ) ) ( not ( = ?auto_226117 ?auto_226118 ) ) ( not ( = ?auto_226117 ?auto_226119 ) ) ( not ( = ?auto_226117 ?auto_226120 ) ) ( not ( = ?auto_226117 ?auto_226121 ) ) ( not ( = ?auto_226117 ?auto_226122 ) ) ( not ( = ?auto_226117 ?auto_226123 ) ) ( not ( = ?auto_226117 ?auto_226124 ) ) ( not ( = ?auto_226117 ?auto_226125 ) ) ( not ( = ?auto_226118 ?auto_226119 ) ) ( not ( = ?auto_226118 ?auto_226120 ) ) ( not ( = ?auto_226118 ?auto_226121 ) ) ( not ( = ?auto_226118 ?auto_226122 ) ) ( not ( = ?auto_226118 ?auto_226123 ) ) ( not ( = ?auto_226118 ?auto_226124 ) ) ( not ( = ?auto_226118 ?auto_226125 ) ) ( not ( = ?auto_226119 ?auto_226120 ) ) ( not ( = ?auto_226119 ?auto_226121 ) ) ( not ( = ?auto_226119 ?auto_226122 ) ) ( not ( = ?auto_226119 ?auto_226123 ) ) ( not ( = ?auto_226119 ?auto_226124 ) ) ( not ( = ?auto_226119 ?auto_226125 ) ) ( not ( = ?auto_226120 ?auto_226121 ) ) ( not ( = ?auto_226120 ?auto_226122 ) ) ( not ( = ?auto_226120 ?auto_226123 ) ) ( not ( = ?auto_226120 ?auto_226124 ) ) ( not ( = ?auto_226120 ?auto_226125 ) ) ( not ( = ?auto_226121 ?auto_226122 ) ) ( not ( = ?auto_226121 ?auto_226123 ) ) ( not ( = ?auto_226121 ?auto_226124 ) ) ( not ( = ?auto_226121 ?auto_226125 ) ) ( not ( = ?auto_226122 ?auto_226123 ) ) ( not ( = ?auto_226122 ?auto_226124 ) ) ( not ( = ?auto_226122 ?auto_226125 ) ) ( not ( = ?auto_226123 ?auto_226124 ) ) ( not ( = ?auto_226123 ?auto_226125 ) ) ( not ( = ?auto_226124 ?auto_226125 ) ) ( ON ?auto_226124 ?auto_226125 ) ( ON ?auto_226123 ?auto_226124 ) ( ON ?auto_226122 ?auto_226123 ) ( ON ?auto_226121 ?auto_226122 ) ( ON ?auto_226120 ?auto_226121 ) ( ON ?auto_226119 ?auto_226120 ) ( ON ?auto_226118 ?auto_226119 ) ( ON ?auto_226117 ?auto_226118 ) ( CLEAR ?auto_226115 ) ( ON ?auto_226116 ?auto_226117 ) ( CLEAR ?auto_226116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226113 ?auto_226114 ?auto_226115 ?auto_226116 )
      ( MAKE-13PILE ?auto_226113 ?auto_226114 ?auto_226115 ?auto_226116 ?auto_226117 ?auto_226118 ?auto_226119 ?auto_226120 ?auto_226121 ?auto_226122 ?auto_226123 ?auto_226124 ?auto_226125 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226139 - BLOCK
      ?auto_226140 - BLOCK
      ?auto_226141 - BLOCK
      ?auto_226142 - BLOCK
      ?auto_226143 - BLOCK
      ?auto_226144 - BLOCK
      ?auto_226145 - BLOCK
      ?auto_226146 - BLOCK
      ?auto_226147 - BLOCK
      ?auto_226148 - BLOCK
      ?auto_226149 - BLOCK
      ?auto_226150 - BLOCK
      ?auto_226151 - BLOCK
    )
    :vars
    (
      ?auto_226152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226151 ?auto_226152 ) ( ON-TABLE ?auto_226139 ) ( ON ?auto_226140 ?auto_226139 ) ( not ( = ?auto_226139 ?auto_226140 ) ) ( not ( = ?auto_226139 ?auto_226141 ) ) ( not ( = ?auto_226139 ?auto_226142 ) ) ( not ( = ?auto_226139 ?auto_226143 ) ) ( not ( = ?auto_226139 ?auto_226144 ) ) ( not ( = ?auto_226139 ?auto_226145 ) ) ( not ( = ?auto_226139 ?auto_226146 ) ) ( not ( = ?auto_226139 ?auto_226147 ) ) ( not ( = ?auto_226139 ?auto_226148 ) ) ( not ( = ?auto_226139 ?auto_226149 ) ) ( not ( = ?auto_226139 ?auto_226150 ) ) ( not ( = ?auto_226139 ?auto_226151 ) ) ( not ( = ?auto_226139 ?auto_226152 ) ) ( not ( = ?auto_226140 ?auto_226141 ) ) ( not ( = ?auto_226140 ?auto_226142 ) ) ( not ( = ?auto_226140 ?auto_226143 ) ) ( not ( = ?auto_226140 ?auto_226144 ) ) ( not ( = ?auto_226140 ?auto_226145 ) ) ( not ( = ?auto_226140 ?auto_226146 ) ) ( not ( = ?auto_226140 ?auto_226147 ) ) ( not ( = ?auto_226140 ?auto_226148 ) ) ( not ( = ?auto_226140 ?auto_226149 ) ) ( not ( = ?auto_226140 ?auto_226150 ) ) ( not ( = ?auto_226140 ?auto_226151 ) ) ( not ( = ?auto_226140 ?auto_226152 ) ) ( not ( = ?auto_226141 ?auto_226142 ) ) ( not ( = ?auto_226141 ?auto_226143 ) ) ( not ( = ?auto_226141 ?auto_226144 ) ) ( not ( = ?auto_226141 ?auto_226145 ) ) ( not ( = ?auto_226141 ?auto_226146 ) ) ( not ( = ?auto_226141 ?auto_226147 ) ) ( not ( = ?auto_226141 ?auto_226148 ) ) ( not ( = ?auto_226141 ?auto_226149 ) ) ( not ( = ?auto_226141 ?auto_226150 ) ) ( not ( = ?auto_226141 ?auto_226151 ) ) ( not ( = ?auto_226141 ?auto_226152 ) ) ( not ( = ?auto_226142 ?auto_226143 ) ) ( not ( = ?auto_226142 ?auto_226144 ) ) ( not ( = ?auto_226142 ?auto_226145 ) ) ( not ( = ?auto_226142 ?auto_226146 ) ) ( not ( = ?auto_226142 ?auto_226147 ) ) ( not ( = ?auto_226142 ?auto_226148 ) ) ( not ( = ?auto_226142 ?auto_226149 ) ) ( not ( = ?auto_226142 ?auto_226150 ) ) ( not ( = ?auto_226142 ?auto_226151 ) ) ( not ( = ?auto_226142 ?auto_226152 ) ) ( not ( = ?auto_226143 ?auto_226144 ) ) ( not ( = ?auto_226143 ?auto_226145 ) ) ( not ( = ?auto_226143 ?auto_226146 ) ) ( not ( = ?auto_226143 ?auto_226147 ) ) ( not ( = ?auto_226143 ?auto_226148 ) ) ( not ( = ?auto_226143 ?auto_226149 ) ) ( not ( = ?auto_226143 ?auto_226150 ) ) ( not ( = ?auto_226143 ?auto_226151 ) ) ( not ( = ?auto_226143 ?auto_226152 ) ) ( not ( = ?auto_226144 ?auto_226145 ) ) ( not ( = ?auto_226144 ?auto_226146 ) ) ( not ( = ?auto_226144 ?auto_226147 ) ) ( not ( = ?auto_226144 ?auto_226148 ) ) ( not ( = ?auto_226144 ?auto_226149 ) ) ( not ( = ?auto_226144 ?auto_226150 ) ) ( not ( = ?auto_226144 ?auto_226151 ) ) ( not ( = ?auto_226144 ?auto_226152 ) ) ( not ( = ?auto_226145 ?auto_226146 ) ) ( not ( = ?auto_226145 ?auto_226147 ) ) ( not ( = ?auto_226145 ?auto_226148 ) ) ( not ( = ?auto_226145 ?auto_226149 ) ) ( not ( = ?auto_226145 ?auto_226150 ) ) ( not ( = ?auto_226145 ?auto_226151 ) ) ( not ( = ?auto_226145 ?auto_226152 ) ) ( not ( = ?auto_226146 ?auto_226147 ) ) ( not ( = ?auto_226146 ?auto_226148 ) ) ( not ( = ?auto_226146 ?auto_226149 ) ) ( not ( = ?auto_226146 ?auto_226150 ) ) ( not ( = ?auto_226146 ?auto_226151 ) ) ( not ( = ?auto_226146 ?auto_226152 ) ) ( not ( = ?auto_226147 ?auto_226148 ) ) ( not ( = ?auto_226147 ?auto_226149 ) ) ( not ( = ?auto_226147 ?auto_226150 ) ) ( not ( = ?auto_226147 ?auto_226151 ) ) ( not ( = ?auto_226147 ?auto_226152 ) ) ( not ( = ?auto_226148 ?auto_226149 ) ) ( not ( = ?auto_226148 ?auto_226150 ) ) ( not ( = ?auto_226148 ?auto_226151 ) ) ( not ( = ?auto_226148 ?auto_226152 ) ) ( not ( = ?auto_226149 ?auto_226150 ) ) ( not ( = ?auto_226149 ?auto_226151 ) ) ( not ( = ?auto_226149 ?auto_226152 ) ) ( not ( = ?auto_226150 ?auto_226151 ) ) ( not ( = ?auto_226150 ?auto_226152 ) ) ( not ( = ?auto_226151 ?auto_226152 ) ) ( ON ?auto_226150 ?auto_226151 ) ( ON ?auto_226149 ?auto_226150 ) ( ON ?auto_226148 ?auto_226149 ) ( ON ?auto_226147 ?auto_226148 ) ( ON ?auto_226146 ?auto_226147 ) ( ON ?auto_226145 ?auto_226146 ) ( ON ?auto_226144 ?auto_226145 ) ( ON ?auto_226143 ?auto_226144 ) ( ON ?auto_226142 ?auto_226143 ) ( CLEAR ?auto_226140 ) ( ON ?auto_226141 ?auto_226142 ) ( CLEAR ?auto_226141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226139 ?auto_226140 ?auto_226141 )
      ( MAKE-13PILE ?auto_226139 ?auto_226140 ?auto_226141 ?auto_226142 ?auto_226143 ?auto_226144 ?auto_226145 ?auto_226146 ?auto_226147 ?auto_226148 ?auto_226149 ?auto_226150 ?auto_226151 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226166 - BLOCK
      ?auto_226167 - BLOCK
      ?auto_226168 - BLOCK
      ?auto_226169 - BLOCK
      ?auto_226170 - BLOCK
      ?auto_226171 - BLOCK
      ?auto_226172 - BLOCK
      ?auto_226173 - BLOCK
      ?auto_226174 - BLOCK
      ?auto_226175 - BLOCK
      ?auto_226176 - BLOCK
      ?auto_226177 - BLOCK
      ?auto_226178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226178 ) ( ON-TABLE ?auto_226166 ) ( ON ?auto_226167 ?auto_226166 ) ( not ( = ?auto_226166 ?auto_226167 ) ) ( not ( = ?auto_226166 ?auto_226168 ) ) ( not ( = ?auto_226166 ?auto_226169 ) ) ( not ( = ?auto_226166 ?auto_226170 ) ) ( not ( = ?auto_226166 ?auto_226171 ) ) ( not ( = ?auto_226166 ?auto_226172 ) ) ( not ( = ?auto_226166 ?auto_226173 ) ) ( not ( = ?auto_226166 ?auto_226174 ) ) ( not ( = ?auto_226166 ?auto_226175 ) ) ( not ( = ?auto_226166 ?auto_226176 ) ) ( not ( = ?auto_226166 ?auto_226177 ) ) ( not ( = ?auto_226166 ?auto_226178 ) ) ( not ( = ?auto_226167 ?auto_226168 ) ) ( not ( = ?auto_226167 ?auto_226169 ) ) ( not ( = ?auto_226167 ?auto_226170 ) ) ( not ( = ?auto_226167 ?auto_226171 ) ) ( not ( = ?auto_226167 ?auto_226172 ) ) ( not ( = ?auto_226167 ?auto_226173 ) ) ( not ( = ?auto_226167 ?auto_226174 ) ) ( not ( = ?auto_226167 ?auto_226175 ) ) ( not ( = ?auto_226167 ?auto_226176 ) ) ( not ( = ?auto_226167 ?auto_226177 ) ) ( not ( = ?auto_226167 ?auto_226178 ) ) ( not ( = ?auto_226168 ?auto_226169 ) ) ( not ( = ?auto_226168 ?auto_226170 ) ) ( not ( = ?auto_226168 ?auto_226171 ) ) ( not ( = ?auto_226168 ?auto_226172 ) ) ( not ( = ?auto_226168 ?auto_226173 ) ) ( not ( = ?auto_226168 ?auto_226174 ) ) ( not ( = ?auto_226168 ?auto_226175 ) ) ( not ( = ?auto_226168 ?auto_226176 ) ) ( not ( = ?auto_226168 ?auto_226177 ) ) ( not ( = ?auto_226168 ?auto_226178 ) ) ( not ( = ?auto_226169 ?auto_226170 ) ) ( not ( = ?auto_226169 ?auto_226171 ) ) ( not ( = ?auto_226169 ?auto_226172 ) ) ( not ( = ?auto_226169 ?auto_226173 ) ) ( not ( = ?auto_226169 ?auto_226174 ) ) ( not ( = ?auto_226169 ?auto_226175 ) ) ( not ( = ?auto_226169 ?auto_226176 ) ) ( not ( = ?auto_226169 ?auto_226177 ) ) ( not ( = ?auto_226169 ?auto_226178 ) ) ( not ( = ?auto_226170 ?auto_226171 ) ) ( not ( = ?auto_226170 ?auto_226172 ) ) ( not ( = ?auto_226170 ?auto_226173 ) ) ( not ( = ?auto_226170 ?auto_226174 ) ) ( not ( = ?auto_226170 ?auto_226175 ) ) ( not ( = ?auto_226170 ?auto_226176 ) ) ( not ( = ?auto_226170 ?auto_226177 ) ) ( not ( = ?auto_226170 ?auto_226178 ) ) ( not ( = ?auto_226171 ?auto_226172 ) ) ( not ( = ?auto_226171 ?auto_226173 ) ) ( not ( = ?auto_226171 ?auto_226174 ) ) ( not ( = ?auto_226171 ?auto_226175 ) ) ( not ( = ?auto_226171 ?auto_226176 ) ) ( not ( = ?auto_226171 ?auto_226177 ) ) ( not ( = ?auto_226171 ?auto_226178 ) ) ( not ( = ?auto_226172 ?auto_226173 ) ) ( not ( = ?auto_226172 ?auto_226174 ) ) ( not ( = ?auto_226172 ?auto_226175 ) ) ( not ( = ?auto_226172 ?auto_226176 ) ) ( not ( = ?auto_226172 ?auto_226177 ) ) ( not ( = ?auto_226172 ?auto_226178 ) ) ( not ( = ?auto_226173 ?auto_226174 ) ) ( not ( = ?auto_226173 ?auto_226175 ) ) ( not ( = ?auto_226173 ?auto_226176 ) ) ( not ( = ?auto_226173 ?auto_226177 ) ) ( not ( = ?auto_226173 ?auto_226178 ) ) ( not ( = ?auto_226174 ?auto_226175 ) ) ( not ( = ?auto_226174 ?auto_226176 ) ) ( not ( = ?auto_226174 ?auto_226177 ) ) ( not ( = ?auto_226174 ?auto_226178 ) ) ( not ( = ?auto_226175 ?auto_226176 ) ) ( not ( = ?auto_226175 ?auto_226177 ) ) ( not ( = ?auto_226175 ?auto_226178 ) ) ( not ( = ?auto_226176 ?auto_226177 ) ) ( not ( = ?auto_226176 ?auto_226178 ) ) ( not ( = ?auto_226177 ?auto_226178 ) ) ( ON ?auto_226177 ?auto_226178 ) ( ON ?auto_226176 ?auto_226177 ) ( ON ?auto_226175 ?auto_226176 ) ( ON ?auto_226174 ?auto_226175 ) ( ON ?auto_226173 ?auto_226174 ) ( ON ?auto_226172 ?auto_226173 ) ( ON ?auto_226171 ?auto_226172 ) ( ON ?auto_226170 ?auto_226171 ) ( ON ?auto_226169 ?auto_226170 ) ( CLEAR ?auto_226167 ) ( ON ?auto_226168 ?auto_226169 ) ( CLEAR ?auto_226168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226166 ?auto_226167 ?auto_226168 )
      ( MAKE-13PILE ?auto_226166 ?auto_226167 ?auto_226168 ?auto_226169 ?auto_226170 ?auto_226171 ?auto_226172 ?auto_226173 ?auto_226174 ?auto_226175 ?auto_226176 ?auto_226177 ?auto_226178 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226192 - BLOCK
      ?auto_226193 - BLOCK
      ?auto_226194 - BLOCK
      ?auto_226195 - BLOCK
      ?auto_226196 - BLOCK
      ?auto_226197 - BLOCK
      ?auto_226198 - BLOCK
      ?auto_226199 - BLOCK
      ?auto_226200 - BLOCK
      ?auto_226201 - BLOCK
      ?auto_226202 - BLOCK
      ?auto_226203 - BLOCK
      ?auto_226204 - BLOCK
    )
    :vars
    (
      ?auto_226205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226204 ?auto_226205 ) ( ON-TABLE ?auto_226192 ) ( not ( = ?auto_226192 ?auto_226193 ) ) ( not ( = ?auto_226192 ?auto_226194 ) ) ( not ( = ?auto_226192 ?auto_226195 ) ) ( not ( = ?auto_226192 ?auto_226196 ) ) ( not ( = ?auto_226192 ?auto_226197 ) ) ( not ( = ?auto_226192 ?auto_226198 ) ) ( not ( = ?auto_226192 ?auto_226199 ) ) ( not ( = ?auto_226192 ?auto_226200 ) ) ( not ( = ?auto_226192 ?auto_226201 ) ) ( not ( = ?auto_226192 ?auto_226202 ) ) ( not ( = ?auto_226192 ?auto_226203 ) ) ( not ( = ?auto_226192 ?auto_226204 ) ) ( not ( = ?auto_226192 ?auto_226205 ) ) ( not ( = ?auto_226193 ?auto_226194 ) ) ( not ( = ?auto_226193 ?auto_226195 ) ) ( not ( = ?auto_226193 ?auto_226196 ) ) ( not ( = ?auto_226193 ?auto_226197 ) ) ( not ( = ?auto_226193 ?auto_226198 ) ) ( not ( = ?auto_226193 ?auto_226199 ) ) ( not ( = ?auto_226193 ?auto_226200 ) ) ( not ( = ?auto_226193 ?auto_226201 ) ) ( not ( = ?auto_226193 ?auto_226202 ) ) ( not ( = ?auto_226193 ?auto_226203 ) ) ( not ( = ?auto_226193 ?auto_226204 ) ) ( not ( = ?auto_226193 ?auto_226205 ) ) ( not ( = ?auto_226194 ?auto_226195 ) ) ( not ( = ?auto_226194 ?auto_226196 ) ) ( not ( = ?auto_226194 ?auto_226197 ) ) ( not ( = ?auto_226194 ?auto_226198 ) ) ( not ( = ?auto_226194 ?auto_226199 ) ) ( not ( = ?auto_226194 ?auto_226200 ) ) ( not ( = ?auto_226194 ?auto_226201 ) ) ( not ( = ?auto_226194 ?auto_226202 ) ) ( not ( = ?auto_226194 ?auto_226203 ) ) ( not ( = ?auto_226194 ?auto_226204 ) ) ( not ( = ?auto_226194 ?auto_226205 ) ) ( not ( = ?auto_226195 ?auto_226196 ) ) ( not ( = ?auto_226195 ?auto_226197 ) ) ( not ( = ?auto_226195 ?auto_226198 ) ) ( not ( = ?auto_226195 ?auto_226199 ) ) ( not ( = ?auto_226195 ?auto_226200 ) ) ( not ( = ?auto_226195 ?auto_226201 ) ) ( not ( = ?auto_226195 ?auto_226202 ) ) ( not ( = ?auto_226195 ?auto_226203 ) ) ( not ( = ?auto_226195 ?auto_226204 ) ) ( not ( = ?auto_226195 ?auto_226205 ) ) ( not ( = ?auto_226196 ?auto_226197 ) ) ( not ( = ?auto_226196 ?auto_226198 ) ) ( not ( = ?auto_226196 ?auto_226199 ) ) ( not ( = ?auto_226196 ?auto_226200 ) ) ( not ( = ?auto_226196 ?auto_226201 ) ) ( not ( = ?auto_226196 ?auto_226202 ) ) ( not ( = ?auto_226196 ?auto_226203 ) ) ( not ( = ?auto_226196 ?auto_226204 ) ) ( not ( = ?auto_226196 ?auto_226205 ) ) ( not ( = ?auto_226197 ?auto_226198 ) ) ( not ( = ?auto_226197 ?auto_226199 ) ) ( not ( = ?auto_226197 ?auto_226200 ) ) ( not ( = ?auto_226197 ?auto_226201 ) ) ( not ( = ?auto_226197 ?auto_226202 ) ) ( not ( = ?auto_226197 ?auto_226203 ) ) ( not ( = ?auto_226197 ?auto_226204 ) ) ( not ( = ?auto_226197 ?auto_226205 ) ) ( not ( = ?auto_226198 ?auto_226199 ) ) ( not ( = ?auto_226198 ?auto_226200 ) ) ( not ( = ?auto_226198 ?auto_226201 ) ) ( not ( = ?auto_226198 ?auto_226202 ) ) ( not ( = ?auto_226198 ?auto_226203 ) ) ( not ( = ?auto_226198 ?auto_226204 ) ) ( not ( = ?auto_226198 ?auto_226205 ) ) ( not ( = ?auto_226199 ?auto_226200 ) ) ( not ( = ?auto_226199 ?auto_226201 ) ) ( not ( = ?auto_226199 ?auto_226202 ) ) ( not ( = ?auto_226199 ?auto_226203 ) ) ( not ( = ?auto_226199 ?auto_226204 ) ) ( not ( = ?auto_226199 ?auto_226205 ) ) ( not ( = ?auto_226200 ?auto_226201 ) ) ( not ( = ?auto_226200 ?auto_226202 ) ) ( not ( = ?auto_226200 ?auto_226203 ) ) ( not ( = ?auto_226200 ?auto_226204 ) ) ( not ( = ?auto_226200 ?auto_226205 ) ) ( not ( = ?auto_226201 ?auto_226202 ) ) ( not ( = ?auto_226201 ?auto_226203 ) ) ( not ( = ?auto_226201 ?auto_226204 ) ) ( not ( = ?auto_226201 ?auto_226205 ) ) ( not ( = ?auto_226202 ?auto_226203 ) ) ( not ( = ?auto_226202 ?auto_226204 ) ) ( not ( = ?auto_226202 ?auto_226205 ) ) ( not ( = ?auto_226203 ?auto_226204 ) ) ( not ( = ?auto_226203 ?auto_226205 ) ) ( not ( = ?auto_226204 ?auto_226205 ) ) ( ON ?auto_226203 ?auto_226204 ) ( ON ?auto_226202 ?auto_226203 ) ( ON ?auto_226201 ?auto_226202 ) ( ON ?auto_226200 ?auto_226201 ) ( ON ?auto_226199 ?auto_226200 ) ( ON ?auto_226198 ?auto_226199 ) ( ON ?auto_226197 ?auto_226198 ) ( ON ?auto_226196 ?auto_226197 ) ( ON ?auto_226195 ?auto_226196 ) ( ON ?auto_226194 ?auto_226195 ) ( CLEAR ?auto_226192 ) ( ON ?auto_226193 ?auto_226194 ) ( CLEAR ?auto_226193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226192 ?auto_226193 )
      ( MAKE-13PILE ?auto_226192 ?auto_226193 ?auto_226194 ?auto_226195 ?auto_226196 ?auto_226197 ?auto_226198 ?auto_226199 ?auto_226200 ?auto_226201 ?auto_226202 ?auto_226203 ?auto_226204 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226219 - BLOCK
      ?auto_226220 - BLOCK
      ?auto_226221 - BLOCK
      ?auto_226222 - BLOCK
      ?auto_226223 - BLOCK
      ?auto_226224 - BLOCK
      ?auto_226225 - BLOCK
      ?auto_226226 - BLOCK
      ?auto_226227 - BLOCK
      ?auto_226228 - BLOCK
      ?auto_226229 - BLOCK
      ?auto_226230 - BLOCK
      ?auto_226231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226231 ) ( ON-TABLE ?auto_226219 ) ( not ( = ?auto_226219 ?auto_226220 ) ) ( not ( = ?auto_226219 ?auto_226221 ) ) ( not ( = ?auto_226219 ?auto_226222 ) ) ( not ( = ?auto_226219 ?auto_226223 ) ) ( not ( = ?auto_226219 ?auto_226224 ) ) ( not ( = ?auto_226219 ?auto_226225 ) ) ( not ( = ?auto_226219 ?auto_226226 ) ) ( not ( = ?auto_226219 ?auto_226227 ) ) ( not ( = ?auto_226219 ?auto_226228 ) ) ( not ( = ?auto_226219 ?auto_226229 ) ) ( not ( = ?auto_226219 ?auto_226230 ) ) ( not ( = ?auto_226219 ?auto_226231 ) ) ( not ( = ?auto_226220 ?auto_226221 ) ) ( not ( = ?auto_226220 ?auto_226222 ) ) ( not ( = ?auto_226220 ?auto_226223 ) ) ( not ( = ?auto_226220 ?auto_226224 ) ) ( not ( = ?auto_226220 ?auto_226225 ) ) ( not ( = ?auto_226220 ?auto_226226 ) ) ( not ( = ?auto_226220 ?auto_226227 ) ) ( not ( = ?auto_226220 ?auto_226228 ) ) ( not ( = ?auto_226220 ?auto_226229 ) ) ( not ( = ?auto_226220 ?auto_226230 ) ) ( not ( = ?auto_226220 ?auto_226231 ) ) ( not ( = ?auto_226221 ?auto_226222 ) ) ( not ( = ?auto_226221 ?auto_226223 ) ) ( not ( = ?auto_226221 ?auto_226224 ) ) ( not ( = ?auto_226221 ?auto_226225 ) ) ( not ( = ?auto_226221 ?auto_226226 ) ) ( not ( = ?auto_226221 ?auto_226227 ) ) ( not ( = ?auto_226221 ?auto_226228 ) ) ( not ( = ?auto_226221 ?auto_226229 ) ) ( not ( = ?auto_226221 ?auto_226230 ) ) ( not ( = ?auto_226221 ?auto_226231 ) ) ( not ( = ?auto_226222 ?auto_226223 ) ) ( not ( = ?auto_226222 ?auto_226224 ) ) ( not ( = ?auto_226222 ?auto_226225 ) ) ( not ( = ?auto_226222 ?auto_226226 ) ) ( not ( = ?auto_226222 ?auto_226227 ) ) ( not ( = ?auto_226222 ?auto_226228 ) ) ( not ( = ?auto_226222 ?auto_226229 ) ) ( not ( = ?auto_226222 ?auto_226230 ) ) ( not ( = ?auto_226222 ?auto_226231 ) ) ( not ( = ?auto_226223 ?auto_226224 ) ) ( not ( = ?auto_226223 ?auto_226225 ) ) ( not ( = ?auto_226223 ?auto_226226 ) ) ( not ( = ?auto_226223 ?auto_226227 ) ) ( not ( = ?auto_226223 ?auto_226228 ) ) ( not ( = ?auto_226223 ?auto_226229 ) ) ( not ( = ?auto_226223 ?auto_226230 ) ) ( not ( = ?auto_226223 ?auto_226231 ) ) ( not ( = ?auto_226224 ?auto_226225 ) ) ( not ( = ?auto_226224 ?auto_226226 ) ) ( not ( = ?auto_226224 ?auto_226227 ) ) ( not ( = ?auto_226224 ?auto_226228 ) ) ( not ( = ?auto_226224 ?auto_226229 ) ) ( not ( = ?auto_226224 ?auto_226230 ) ) ( not ( = ?auto_226224 ?auto_226231 ) ) ( not ( = ?auto_226225 ?auto_226226 ) ) ( not ( = ?auto_226225 ?auto_226227 ) ) ( not ( = ?auto_226225 ?auto_226228 ) ) ( not ( = ?auto_226225 ?auto_226229 ) ) ( not ( = ?auto_226225 ?auto_226230 ) ) ( not ( = ?auto_226225 ?auto_226231 ) ) ( not ( = ?auto_226226 ?auto_226227 ) ) ( not ( = ?auto_226226 ?auto_226228 ) ) ( not ( = ?auto_226226 ?auto_226229 ) ) ( not ( = ?auto_226226 ?auto_226230 ) ) ( not ( = ?auto_226226 ?auto_226231 ) ) ( not ( = ?auto_226227 ?auto_226228 ) ) ( not ( = ?auto_226227 ?auto_226229 ) ) ( not ( = ?auto_226227 ?auto_226230 ) ) ( not ( = ?auto_226227 ?auto_226231 ) ) ( not ( = ?auto_226228 ?auto_226229 ) ) ( not ( = ?auto_226228 ?auto_226230 ) ) ( not ( = ?auto_226228 ?auto_226231 ) ) ( not ( = ?auto_226229 ?auto_226230 ) ) ( not ( = ?auto_226229 ?auto_226231 ) ) ( not ( = ?auto_226230 ?auto_226231 ) ) ( ON ?auto_226230 ?auto_226231 ) ( ON ?auto_226229 ?auto_226230 ) ( ON ?auto_226228 ?auto_226229 ) ( ON ?auto_226227 ?auto_226228 ) ( ON ?auto_226226 ?auto_226227 ) ( ON ?auto_226225 ?auto_226226 ) ( ON ?auto_226224 ?auto_226225 ) ( ON ?auto_226223 ?auto_226224 ) ( ON ?auto_226222 ?auto_226223 ) ( ON ?auto_226221 ?auto_226222 ) ( CLEAR ?auto_226219 ) ( ON ?auto_226220 ?auto_226221 ) ( CLEAR ?auto_226220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226219 ?auto_226220 )
      ( MAKE-13PILE ?auto_226219 ?auto_226220 ?auto_226221 ?auto_226222 ?auto_226223 ?auto_226224 ?auto_226225 ?auto_226226 ?auto_226227 ?auto_226228 ?auto_226229 ?auto_226230 ?auto_226231 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226245 - BLOCK
      ?auto_226246 - BLOCK
      ?auto_226247 - BLOCK
      ?auto_226248 - BLOCK
      ?auto_226249 - BLOCK
      ?auto_226250 - BLOCK
      ?auto_226251 - BLOCK
      ?auto_226252 - BLOCK
      ?auto_226253 - BLOCK
      ?auto_226254 - BLOCK
      ?auto_226255 - BLOCK
      ?auto_226256 - BLOCK
      ?auto_226257 - BLOCK
    )
    :vars
    (
      ?auto_226258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226257 ?auto_226258 ) ( not ( = ?auto_226245 ?auto_226246 ) ) ( not ( = ?auto_226245 ?auto_226247 ) ) ( not ( = ?auto_226245 ?auto_226248 ) ) ( not ( = ?auto_226245 ?auto_226249 ) ) ( not ( = ?auto_226245 ?auto_226250 ) ) ( not ( = ?auto_226245 ?auto_226251 ) ) ( not ( = ?auto_226245 ?auto_226252 ) ) ( not ( = ?auto_226245 ?auto_226253 ) ) ( not ( = ?auto_226245 ?auto_226254 ) ) ( not ( = ?auto_226245 ?auto_226255 ) ) ( not ( = ?auto_226245 ?auto_226256 ) ) ( not ( = ?auto_226245 ?auto_226257 ) ) ( not ( = ?auto_226245 ?auto_226258 ) ) ( not ( = ?auto_226246 ?auto_226247 ) ) ( not ( = ?auto_226246 ?auto_226248 ) ) ( not ( = ?auto_226246 ?auto_226249 ) ) ( not ( = ?auto_226246 ?auto_226250 ) ) ( not ( = ?auto_226246 ?auto_226251 ) ) ( not ( = ?auto_226246 ?auto_226252 ) ) ( not ( = ?auto_226246 ?auto_226253 ) ) ( not ( = ?auto_226246 ?auto_226254 ) ) ( not ( = ?auto_226246 ?auto_226255 ) ) ( not ( = ?auto_226246 ?auto_226256 ) ) ( not ( = ?auto_226246 ?auto_226257 ) ) ( not ( = ?auto_226246 ?auto_226258 ) ) ( not ( = ?auto_226247 ?auto_226248 ) ) ( not ( = ?auto_226247 ?auto_226249 ) ) ( not ( = ?auto_226247 ?auto_226250 ) ) ( not ( = ?auto_226247 ?auto_226251 ) ) ( not ( = ?auto_226247 ?auto_226252 ) ) ( not ( = ?auto_226247 ?auto_226253 ) ) ( not ( = ?auto_226247 ?auto_226254 ) ) ( not ( = ?auto_226247 ?auto_226255 ) ) ( not ( = ?auto_226247 ?auto_226256 ) ) ( not ( = ?auto_226247 ?auto_226257 ) ) ( not ( = ?auto_226247 ?auto_226258 ) ) ( not ( = ?auto_226248 ?auto_226249 ) ) ( not ( = ?auto_226248 ?auto_226250 ) ) ( not ( = ?auto_226248 ?auto_226251 ) ) ( not ( = ?auto_226248 ?auto_226252 ) ) ( not ( = ?auto_226248 ?auto_226253 ) ) ( not ( = ?auto_226248 ?auto_226254 ) ) ( not ( = ?auto_226248 ?auto_226255 ) ) ( not ( = ?auto_226248 ?auto_226256 ) ) ( not ( = ?auto_226248 ?auto_226257 ) ) ( not ( = ?auto_226248 ?auto_226258 ) ) ( not ( = ?auto_226249 ?auto_226250 ) ) ( not ( = ?auto_226249 ?auto_226251 ) ) ( not ( = ?auto_226249 ?auto_226252 ) ) ( not ( = ?auto_226249 ?auto_226253 ) ) ( not ( = ?auto_226249 ?auto_226254 ) ) ( not ( = ?auto_226249 ?auto_226255 ) ) ( not ( = ?auto_226249 ?auto_226256 ) ) ( not ( = ?auto_226249 ?auto_226257 ) ) ( not ( = ?auto_226249 ?auto_226258 ) ) ( not ( = ?auto_226250 ?auto_226251 ) ) ( not ( = ?auto_226250 ?auto_226252 ) ) ( not ( = ?auto_226250 ?auto_226253 ) ) ( not ( = ?auto_226250 ?auto_226254 ) ) ( not ( = ?auto_226250 ?auto_226255 ) ) ( not ( = ?auto_226250 ?auto_226256 ) ) ( not ( = ?auto_226250 ?auto_226257 ) ) ( not ( = ?auto_226250 ?auto_226258 ) ) ( not ( = ?auto_226251 ?auto_226252 ) ) ( not ( = ?auto_226251 ?auto_226253 ) ) ( not ( = ?auto_226251 ?auto_226254 ) ) ( not ( = ?auto_226251 ?auto_226255 ) ) ( not ( = ?auto_226251 ?auto_226256 ) ) ( not ( = ?auto_226251 ?auto_226257 ) ) ( not ( = ?auto_226251 ?auto_226258 ) ) ( not ( = ?auto_226252 ?auto_226253 ) ) ( not ( = ?auto_226252 ?auto_226254 ) ) ( not ( = ?auto_226252 ?auto_226255 ) ) ( not ( = ?auto_226252 ?auto_226256 ) ) ( not ( = ?auto_226252 ?auto_226257 ) ) ( not ( = ?auto_226252 ?auto_226258 ) ) ( not ( = ?auto_226253 ?auto_226254 ) ) ( not ( = ?auto_226253 ?auto_226255 ) ) ( not ( = ?auto_226253 ?auto_226256 ) ) ( not ( = ?auto_226253 ?auto_226257 ) ) ( not ( = ?auto_226253 ?auto_226258 ) ) ( not ( = ?auto_226254 ?auto_226255 ) ) ( not ( = ?auto_226254 ?auto_226256 ) ) ( not ( = ?auto_226254 ?auto_226257 ) ) ( not ( = ?auto_226254 ?auto_226258 ) ) ( not ( = ?auto_226255 ?auto_226256 ) ) ( not ( = ?auto_226255 ?auto_226257 ) ) ( not ( = ?auto_226255 ?auto_226258 ) ) ( not ( = ?auto_226256 ?auto_226257 ) ) ( not ( = ?auto_226256 ?auto_226258 ) ) ( not ( = ?auto_226257 ?auto_226258 ) ) ( ON ?auto_226256 ?auto_226257 ) ( ON ?auto_226255 ?auto_226256 ) ( ON ?auto_226254 ?auto_226255 ) ( ON ?auto_226253 ?auto_226254 ) ( ON ?auto_226252 ?auto_226253 ) ( ON ?auto_226251 ?auto_226252 ) ( ON ?auto_226250 ?auto_226251 ) ( ON ?auto_226249 ?auto_226250 ) ( ON ?auto_226248 ?auto_226249 ) ( ON ?auto_226247 ?auto_226248 ) ( ON ?auto_226246 ?auto_226247 ) ( ON ?auto_226245 ?auto_226246 ) ( CLEAR ?auto_226245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226245 )
      ( MAKE-13PILE ?auto_226245 ?auto_226246 ?auto_226247 ?auto_226248 ?auto_226249 ?auto_226250 ?auto_226251 ?auto_226252 ?auto_226253 ?auto_226254 ?auto_226255 ?auto_226256 ?auto_226257 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226272 - BLOCK
      ?auto_226273 - BLOCK
      ?auto_226274 - BLOCK
      ?auto_226275 - BLOCK
      ?auto_226276 - BLOCK
      ?auto_226277 - BLOCK
      ?auto_226278 - BLOCK
      ?auto_226279 - BLOCK
      ?auto_226280 - BLOCK
      ?auto_226281 - BLOCK
      ?auto_226282 - BLOCK
      ?auto_226283 - BLOCK
      ?auto_226284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226284 ) ( not ( = ?auto_226272 ?auto_226273 ) ) ( not ( = ?auto_226272 ?auto_226274 ) ) ( not ( = ?auto_226272 ?auto_226275 ) ) ( not ( = ?auto_226272 ?auto_226276 ) ) ( not ( = ?auto_226272 ?auto_226277 ) ) ( not ( = ?auto_226272 ?auto_226278 ) ) ( not ( = ?auto_226272 ?auto_226279 ) ) ( not ( = ?auto_226272 ?auto_226280 ) ) ( not ( = ?auto_226272 ?auto_226281 ) ) ( not ( = ?auto_226272 ?auto_226282 ) ) ( not ( = ?auto_226272 ?auto_226283 ) ) ( not ( = ?auto_226272 ?auto_226284 ) ) ( not ( = ?auto_226273 ?auto_226274 ) ) ( not ( = ?auto_226273 ?auto_226275 ) ) ( not ( = ?auto_226273 ?auto_226276 ) ) ( not ( = ?auto_226273 ?auto_226277 ) ) ( not ( = ?auto_226273 ?auto_226278 ) ) ( not ( = ?auto_226273 ?auto_226279 ) ) ( not ( = ?auto_226273 ?auto_226280 ) ) ( not ( = ?auto_226273 ?auto_226281 ) ) ( not ( = ?auto_226273 ?auto_226282 ) ) ( not ( = ?auto_226273 ?auto_226283 ) ) ( not ( = ?auto_226273 ?auto_226284 ) ) ( not ( = ?auto_226274 ?auto_226275 ) ) ( not ( = ?auto_226274 ?auto_226276 ) ) ( not ( = ?auto_226274 ?auto_226277 ) ) ( not ( = ?auto_226274 ?auto_226278 ) ) ( not ( = ?auto_226274 ?auto_226279 ) ) ( not ( = ?auto_226274 ?auto_226280 ) ) ( not ( = ?auto_226274 ?auto_226281 ) ) ( not ( = ?auto_226274 ?auto_226282 ) ) ( not ( = ?auto_226274 ?auto_226283 ) ) ( not ( = ?auto_226274 ?auto_226284 ) ) ( not ( = ?auto_226275 ?auto_226276 ) ) ( not ( = ?auto_226275 ?auto_226277 ) ) ( not ( = ?auto_226275 ?auto_226278 ) ) ( not ( = ?auto_226275 ?auto_226279 ) ) ( not ( = ?auto_226275 ?auto_226280 ) ) ( not ( = ?auto_226275 ?auto_226281 ) ) ( not ( = ?auto_226275 ?auto_226282 ) ) ( not ( = ?auto_226275 ?auto_226283 ) ) ( not ( = ?auto_226275 ?auto_226284 ) ) ( not ( = ?auto_226276 ?auto_226277 ) ) ( not ( = ?auto_226276 ?auto_226278 ) ) ( not ( = ?auto_226276 ?auto_226279 ) ) ( not ( = ?auto_226276 ?auto_226280 ) ) ( not ( = ?auto_226276 ?auto_226281 ) ) ( not ( = ?auto_226276 ?auto_226282 ) ) ( not ( = ?auto_226276 ?auto_226283 ) ) ( not ( = ?auto_226276 ?auto_226284 ) ) ( not ( = ?auto_226277 ?auto_226278 ) ) ( not ( = ?auto_226277 ?auto_226279 ) ) ( not ( = ?auto_226277 ?auto_226280 ) ) ( not ( = ?auto_226277 ?auto_226281 ) ) ( not ( = ?auto_226277 ?auto_226282 ) ) ( not ( = ?auto_226277 ?auto_226283 ) ) ( not ( = ?auto_226277 ?auto_226284 ) ) ( not ( = ?auto_226278 ?auto_226279 ) ) ( not ( = ?auto_226278 ?auto_226280 ) ) ( not ( = ?auto_226278 ?auto_226281 ) ) ( not ( = ?auto_226278 ?auto_226282 ) ) ( not ( = ?auto_226278 ?auto_226283 ) ) ( not ( = ?auto_226278 ?auto_226284 ) ) ( not ( = ?auto_226279 ?auto_226280 ) ) ( not ( = ?auto_226279 ?auto_226281 ) ) ( not ( = ?auto_226279 ?auto_226282 ) ) ( not ( = ?auto_226279 ?auto_226283 ) ) ( not ( = ?auto_226279 ?auto_226284 ) ) ( not ( = ?auto_226280 ?auto_226281 ) ) ( not ( = ?auto_226280 ?auto_226282 ) ) ( not ( = ?auto_226280 ?auto_226283 ) ) ( not ( = ?auto_226280 ?auto_226284 ) ) ( not ( = ?auto_226281 ?auto_226282 ) ) ( not ( = ?auto_226281 ?auto_226283 ) ) ( not ( = ?auto_226281 ?auto_226284 ) ) ( not ( = ?auto_226282 ?auto_226283 ) ) ( not ( = ?auto_226282 ?auto_226284 ) ) ( not ( = ?auto_226283 ?auto_226284 ) ) ( ON ?auto_226283 ?auto_226284 ) ( ON ?auto_226282 ?auto_226283 ) ( ON ?auto_226281 ?auto_226282 ) ( ON ?auto_226280 ?auto_226281 ) ( ON ?auto_226279 ?auto_226280 ) ( ON ?auto_226278 ?auto_226279 ) ( ON ?auto_226277 ?auto_226278 ) ( ON ?auto_226276 ?auto_226277 ) ( ON ?auto_226275 ?auto_226276 ) ( ON ?auto_226274 ?auto_226275 ) ( ON ?auto_226273 ?auto_226274 ) ( ON ?auto_226272 ?auto_226273 ) ( CLEAR ?auto_226272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226272 )
      ( MAKE-13PILE ?auto_226272 ?auto_226273 ?auto_226274 ?auto_226275 ?auto_226276 ?auto_226277 ?auto_226278 ?auto_226279 ?auto_226280 ?auto_226281 ?auto_226282 ?auto_226283 ?auto_226284 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_226298 - BLOCK
      ?auto_226299 - BLOCK
      ?auto_226300 - BLOCK
      ?auto_226301 - BLOCK
      ?auto_226302 - BLOCK
      ?auto_226303 - BLOCK
      ?auto_226304 - BLOCK
      ?auto_226305 - BLOCK
      ?auto_226306 - BLOCK
      ?auto_226307 - BLOCK
      ?auto_226308 - BLOCK
      ?auto_226309 - BLOCK
      ?auto_226310 - BLOCK
    )
    :vars
    (
      ?auto_226311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_226298 ?auto_226299 ) ) ( not ( = ?auto_226298 ?auto_226300 ) ) ( not ( = ?auto_226298 ?auto_226301 ) ) ( not ( = ?auto_226298 ?auto_226302 ) ) ( not ( = ?auto_226298 ?auto_226303 ) ) ( not ( = ?auto_226298 ?auto_226304 ) ) ( not ( = ?auto_226298 ?auto_226305 ) ) ( not ( = ?auto_226298 ?auto_226306 ) ) ( not ( = ?auto_226298 ?auto_226307 ) ) ( not ( = ?auto_226298 ?auto_226308 ) ) ( not ( = ?auto_226298 ?auto_226309 ) ) ( not ( = ?auto_226298 ?auto_226310 ) ) ( not ( = ?auto_226299 ?auto_226300 ) ) ( not ( = ?auto_226299 ?auto_226301 ) ) ( not ( = ?auto_226299 ?auto_226302 ) ) ( not ( = ?auto_226299 ?auto_226303 ) ) ( not ( = ?auto_226299 ?auto_226304 ) ) ( not ( = ?auto_226299 ?auto_226305 ) ) ( not ( = ?auto_226299 ?auto_226306 ) ) ( not ( = ?auto_226299 ?auto_226307 ) ) ( not ( = ?auto_226299 ?auto_226308 ) ) ( not ( = ?auto_226299 ?auto_226309 ) ) ( not ( = ?auto_226299 ?auto_226310 ) ) ( not ( = ?auto_226300 ?auto_226301 ) ) ( not ( = ?auto_226300 ?auto_226302 ) ) ( not ( = ?auto_226300 ?auto_226303 ) ) ( not ( = ?auto_226300 ?auto_226304 ) ) ( not ( = ?auto_226300 ?auto_226305 ) ) ( not ( = ?auto_226300 ?auto_226306 ) ) ( not ( = ?auto_226300 ?auto_226307 ) ) ( not ( = ?auto_226300 ?auto_226308 ) ) ( not ( = ?auto_226300 ?auto_226309 ) ) ( not ( = ?auto_226300 ?auto_226310 ) ) ( not ( = ?auto_226301 ?auto_226302 ) ) ( not ( = ?auto_226301 ?auto_226303 ) ) ( not ( = ?auto_226301 ?auto_226304 ) ) ( not ( = ?auto_226301 ?auto_226305 ) ) ( not ( = ?auto_226301 ?auto_226306 ) ) ( not ( = ?auto_226301 ?auto_226307 ) ) ( not ( = ?auto_226301 ?auto_226308 ) ) ( not ( = ?auto_226301 ?auto_226309 ) ) ( not ( = ?auto_226301 ?auto_226310 ) ) ( not ( = ?auto_226302 ?auto_226303 ) ) ( not ( = ?auto_226302 ?auto_226304 ) ) ( not ( = ?auto_226302 ?auto_226305 ) ) ( not ( = ?auto_226302 ?auto_226306 ) ) ( not ( = ?auto_226302 ?auto_226307 ) ) ( not ( = ?auto_226302 ?auto_226308 ) ) ( not ( = ?auto_226302 ?auto_226309 ) ) ( not ( = ?auto_226302 ?auto_226310 ) ) ( not ( = ?auto_226303 ?auto_226304 ) ) ( not ( = ?auto_226303 ?auto_226305 ) ) ( not ( = ?auto_226303 ?auto_226306 ) ) ( not ( = ?auto_226303 ?auto_226307 ) ) ( not ( = ?auto_226303 ?auto_226308 ) ) ( not ( = ?auto_226303 ?auto_226309 ) ) ( not ( = ?auto_226303 ?auto_226310 ) ) ( not ( = ?auto_226304 ?auto_226305 ) ) ( not ( = ?auto_226304 ?auto_226306 ) ) ( not ( = ?auto_226304 ?auto_226307 ) ) ( not ( = ?auto_226304 ?auto_226308 ) ) ( not ( = ?auto_226304 ?auto_226309 ) ) ( not ( = ?auto_226304 ?auto_226310 ) ) ( not ( = ?auto_226305 ?auto_226306 ) ) ( not ( = ?auto_226305 ?auto_226307 ) ) ( not ( = ?auto_226305 ?auto_226308 ) ) ( not ( = ?auto_226305 ?auto_226309 ) ) ( not ( = ?auto_226305 ?auto_226310 ) ) ( not ( = ?auto_226306 ?auto_226307 ) ) ( not ( = ?auto_226306 ?auto_226308 ) ) ( not ( = ?auto_226306 ?auto_226309 ) ) ( not ( = ?auto_226306 ?auto_226310 ) ) ( not ( = ?auto_226307 ?auto_226308 ) ) ( not ( = ?auto_226307 ?auto_226309 ) ) ( not ( = ?auto_226307 ?auto_226310 ) ) ( not ( = ?auto_226308 ?auto_226309 ) ) ( not ( = ?auto_226308 ?auto_226310 ) ) ( not ( = ?auto_226309 ?auto_226310 ) ) ( ON ?auto_226298 ?auto_226311 ) ( not ( = ?auto_226310 ?auto_226311 ) ) ( not ( = ?auto_226309 ?auto_226311 ) ) ( not ( = ?auto_226308 ?auto_226311 ) ) ( not ( = ?auto_226307 ?auto_226311 ) ) ( not ( = ?auto_226306 ?auto_226311 ) ) ( not ( = ?auto_226305 ?auto_226311 ) ) ( not ( = ?auto_226304 ?auto_226311 ) ) ( not ( = ?auto_226303 ?auto_226311 ) ) ( not ( = ?auto_226302 ?auto_226311 ) ) ( not ( = ?auto_226301 ?auto_226311 ) ) ( not ( = ?auto_226300 ?auto_226311 ) ) ( not ( = ?auto_226299 ?auto_226311 ) ) ( not ( = ?auto_226298 ?auto_226311 ) ) ( ON ?auto_226299 ?auto_226298 ) ( ON ?auto_226300 ?auto_226299 ) ( ON ?auto_226301 ?auto_226300 ) ( ON ?auto_226302 ?auto_226301 ) ( ON ?auto_226303 ?auto_226302 ) ( ON ?auto_226304 ?auto_226303 ) ( ON ?auto_226305 ?auto_226304 ) ( ON ?auto_226306 ?auto_226305 ) ( ON ?auto_226307 ?auto_226306 ) ( ON ?auto_226308 ?auto_226307 ) ( ON ?auto_226309 ?auto_226308 ) ( ON ?auto_226310 ?auto_226309 ) ( CLEAR ?auto_226310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_226310 ?auto_226309 ?auto_226308 ?auto_226307 ?auto_226306 ?auto_226305 ?auto_226304 ?auto_226303 ?auto_226302 ?auto_226301 ?auto_226300 ?auto_226299 ?auto_226298 )
      ( MAKE-13PILE ?auto_226298 ?auto_226299 ?auto_226300 ?auto_226301 ?auto_226302 ?auto_226303 ?auto_226304 ?auto_226305 ?auto_226306 ?auto_226307 ?auto_226308 ?auto_226309 ?auto_226310 ) )
  )

)

