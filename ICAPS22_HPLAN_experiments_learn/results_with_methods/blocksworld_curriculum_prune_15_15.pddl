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
      ?auto_438861 - BLOCK
    )
    :vars
    (
      ?auto_438862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438861 ?auto_438862 ) ( CLEAR ?auto_438861 ) ( HAND-EMPTY ) ( not ( = ?auto_438861 ?auto_438862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_438861 ?auto_438862 )
      ( !PUTDOWN ?auto_438861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_438868 - BLOCK
      ?auto_438869 - BLOCK
    )
    :vars
    (
      ?auto_438870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_438868 ) ( ON ?auto_438869 ?auto_438870 ) ( CLEAR ?auto_438869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_438868 ) ( not ( = ?auto_438868 ?auto_438869 ) ) ( not ( = ?auto_438868 ?auto_438870 ) ) ( not ( = ?auto_438869 ?auto_438870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_438869 ?auto_438870 )
      ( !STACK ?auto_438869 ?auto_438868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_438878 - BLOCK
      ?auto_438879 - BLOCK
    )
    :vars
    (
      ?auto_438880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438879 ?auto_438880 ) ( not ( = ?auto_438878 ?auto_438879 ) ) ( not ( = ?auto_438878 ?auto_438880 ) ) ( not ( = ?auto_438879 ?auto_438880 ) ) ( ON ?auto_438878 ?auto_438879 ) ( CLEAR ?auto_438878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_438878 )
      ( MAKE-2PILE ?auto_438878 ?auto_438879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_438889 - BLOCK
      ?auto_438890 - BLOCK
      ?auto_438891 - BLOCK
    )
    :vars
    (
      ?auto_438892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_438890 ) ( ON ?auto_438891 ?auto_438892 ) ( CLEAR ?auto_438891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_438889 ) ( ON ?auto_438890 ?auto_438889 ) ( not ( = ?auto_438889 ?auto_438890 ) ) ( not ( = ?auto_438889 ?auto_438891 ) ) ( not ( = ?auto_438889 ?auto_438892 ) ) ( not ( = ?auto_438890 ?auto_438891 ) ) ( not ( = ?auto_438890 ?auto_438892 ) ) ( not ( = ?auto_438891 ?auto_438892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_438891 ?auto_438892 )
      ( !STACK ?auto_438891 ?auto_438890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_438903 - BLOCK
      ?auto_438904 - BLOCK
      ?auto_438905 - BLOCK
    )
    :vars
    (
      ?auto_438906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438905 ?auto_438906 ) ( ON-TABLE ?auto_438903 ) ( not ( = ?auto_438903 ?auto_438904 ) ) ( not ( = ?auto_438903 ?auto_438905 ) ) ( not ( = ?auto_438903 ?auto_438906 ) ) ( not ( = ?auto_438904 ?auto_438905 ) ) ( not ( = ?auto_438904 ?auto_438906 ) ) ( not ( = ?auto_438905 ?auto_438906 ) ) ( CLEAR ?auto_438903 ) ( ON ?auto_438904 ?auto_438905 ) ( CLEAR ?auto_438904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_438903 ?auto_438904 )
      ( MAKE-3PILE ?auto_438903 ?auto_438904 ?auto_438905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_438917 - BLOCK
      ?auto_438918 - BLOCK
      ?auto_438919 - BLOCK
    )
    :vars
    (
      ?auto_438920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438919 ?auto_438920 ) ( not ( = ?auto_438917 ?auto_438918 ) ) ( not ( = ?auto_438917 ?auto_438919 ) ) ( not ( = ?auto_438917 ?auto_438920 ) ) ( not ( = ?auto_438918 ?auto_438919 ) ) ( not ( = ?auto_438918 ?auto_438920 ) ) ( not ( = ?auto_438919 ?auto_438920 ) ) ( ON ?auto_438918 ?auto_438919 ) ( ON ?auto_438917 ?auto_438918 ) ( CLEAR ?auto_438917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_438917 )
      ( MAKE-3PILE ?auto_438917 ?auto_438918 ?auto_438919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_438932 - BLOCK
      ?auto_438933 - BLOCK
      ?auto_438934 - BLOCK
      ?auto_438935 - BLOCK
    )
    :vars
    (
      ?auto_438936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_438934 ) ( ON ?auto_438935 ?auto_438936 ) ( CLEAR ?auto_438935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_438932 ) ( ON ?auto_438933 ?auto_438932 ) ( ON ?auto_438934 ?auto_438933 ) ( not ( = ?auto_438932 ?auto_438933 ) ) ( not ( = ?auto_438932 ?auto_438934 ) ) ( not ( = ?auto_438932 ?auto_438935 ) ) ( not ( = ?auto_438932 ?auto_438936 ) ) ( not ( = ?auto_438933 ?auto_438934 ) ) ( not ( = ?auto_438933 ?auto_438935 ) ) ( not ( = ?auto_438933 ?auto_438936 ) ) ( not ( = ?auto_438934 ?auto_438935 ) ) ( not ( = ?auto_438934 ?auto_438936 ) ) ( not ( = ?auto_438935 ?auto_438936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_438935 ?auto_438936 )
      ( !STACK ?auto_438935 ?auto_438934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_438950 - BLOCK
      ?auto_438951 - BLOCK
      ?auto_438952 - BLOCK
      ?auto_438953 - BLOCK
    )
    :vars
    (
      ?auto_438954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438953 ?auto_438954 ) ( ON-TABLE ?auto_438950 ) ( ON ?auto_438951 ?auto_438950 ) ( not ( = ?auto_438950 ?auto_438951 ) ) ( not ( = ?auto_438950 ?auto_438952 ) ) ( not ( = ?auto_438950 ?auto_438953 ) ) ( not ( = ?auto_438950 ?auto_438954 ) ) ( not ( = ?auto_438951 ?auto_438952 ) ) ( not ( = ?auto_438951 ?auto_438953 ) ) ( not ( = ?auto_438951 ?auto_438954 ) ) ( not ( = ?auto_438952 ?auto_438953 ) ) ( not ( = ?auto_438952 ?auto_438954 ) ) ( not ( = ?auto_438953 ?auto_438954 ) ) ( CLEAR ?auto_438951 ) ( ON ?auto_438952 ?auto_438953 ) ( CLEAR ?auto_438952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_438950 ?auto_438951 ?auto_438952 )
      ( MAKE-4PILE ?auto_438950 ?auto_438951 ?auto_438952 ?auto_438953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_438968 - BLOCK
      ?auto_438969 - BLOCK
      ?auto_438970 - BLOCK
      ?auto_438971 - BLOCK
    )
    :vars
    (
      ?auto_438972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438971 ?auto_438972 ) ( ON-TABLE ?auto_438968 ) ( not ( = ?auto_438968 ?auto_438969 ) ) ( not ( = ?auto_438968 ?auto_438970 ) ) ( not ( = ?auto_438968 ?auto_438971 ) ) ( not ( = ?auto_438968 ?auto_438972 ) ) ( not ( = ?auto_438969 ?auto_438970 ) ) ( not ( = ?auto_438969 ?auto_438971 ) ) ( not ( = ?auto_438969 ?auto_438972 ) ) ( not ( = ?auto_438970 ?auto_438971 ) ) ( not ( = ?auto_438970 ?auto_438972 ) ) ( not ( = ?auto_438971 ?auto_438972 ) ) ( ON ?auto_438970 ?auto_438971 ) ( CLEAR ?auto_438968 ) ( ON ?auto_438969 ?auto_438970 ) ( CLEAR ?auto_438969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_438968 ?auto_438969 )
      ( MAKE-4PILE ?auto_438968 ?auto_438969 ?auto_438970 ?auto_438971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_438986 - BLOCK
      ?auto_438987 - BLOCK
      ?auto_438988 - BLOCK
      ?auto_438989 - BLOCK
    )
    :vars
    (
      ?auto_438990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438989 ?auto_438990 ) ( not ( = ?auto_438986 ?auto_438987 ) ) ( not ( = ?auto_438986 ?auto_438988 ) ) ( not ( = ?auto_438986 ?auto_438989 ) ) ( not ( = ?auto_438986 ?auto_438990 ) ) ( not ( = ?auto_438987 ?auto_438988 ) ) ( not ( = ?auto_438987 ?auto_438989 ) ) ( not ( = ?auto_438987 ?auto_438990 ) ) ( not ( = ?auto_438988 ?auto_438989 ) ) ( not ( = ?auto_438988 ?auto_438990 ) ) ( not ( = ?auto_438989 ?auto_438990 ) ) ( ON ?auto_438988 ?auto_438989 ) ( ON ?auto_438987 ?auto_438988 ) ( ON ?auto_438986 ?auto_438987 ) ( CLEAR ?auto_438986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_438986 )
      ( MAKE-4PILE ?auto_438986 ?auto_438987 ?auto_438988 ?auto_438989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_439005 - BLOCK
      ?auto_439006 - BLOCK
      ?auto_439007 - BLOCK
      ?auto_439008 - BLOCK
      ?auto_439009 - BLOCK
    )
    :vars
    (
      ?auto_439010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_439008 ) ( ON ?auto_439009 ?auto_439010 ) ( CLEAR ?auto_439009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_439005 ) ( ON ?auto_439006 ?auto_439005 ) ( ON ?auto_439007 ?auto_439006 ) ( ON ?auto_439008 ?auto_439007 ) ( not ( = ?auto_439005 ?auto_439006 ) ) ( not ( = ?auto_439005 ?auto_439007 ) ) ( not ( = ?auto_439005 ?auto_439008 ) ) ( not ( = ?auto_439005 ?auto_439009 ) ) ( not ( = ?auto_439005 ?auto_439010 ) ) ( not ( = ?auto_439006 ?auto_439007 ) ) ( not ( = ?auto_439006 ?auto_439008 ) ) ( not ( = ?auto_439006 ?auto_439009 ) ) ( not ( = ?auto_439006 ?auto_439010 ) ) ( not ( = ?auto_439007 ?auto_439008 ) ) ( not ( = ?auto_439007 ?auto_439009 ) ) ( not ( = ?auto_439007 ?auto_439010 ) ) ( not ( = ?auto_439008 ?auto_439009 ) ) ( not ( = ?auto_439008 ?auto_439010 ) ) ( not ( = ?auto_439009 ?auto_439010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439009 ?auto_439010 )
      ( !STACK ?auto_439009 ?auto_439008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_439027 - BLOCK
      ?auto_439028 - BLOCK
      ?auto_439029 - BLOCK
      ?auto_439030 - BLOCK
      ?auto_439031 - BLOCK
    )
    :vars
    (
      ?auto_439032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439031 ?auto_439032 ) ( ON-TABLE ?auto_439027 ) ( ON ?auto_439028 ?auto_439027 ) ( ON ?auto_439029 ?auto_439028 ) ( not ( = ?auto_439027 ?auto_439028 ) ) ( not ( = ?auto_439027 ?auto_439029 ) ) ( not ( = ?auto_439027 ?auto_439030 ) ) ( not ( = ?auto_439027 ?auto_439031 ) ) ( not ( = ?auto_439027 ?auto_439032 ) ) ( not ( = ?auto_439028 ?auto_439029 ) ) ( not ( = ?auto_439028 ?auto_439030 ) ) ( not ( = ?auto_439028 ?auto_439031 ) ) ( not ( = ?auto_439028 ?auto_439032 ) ) ( not ( = ?auto_439029 ?auto_439030 ) ) ( not ( = ?auto_439029 ?auto_439031 ) ) ( not ( = ?auto_439029 ?auto_439032 ) ) ( not ( = ?auto_439030 ?auto_439031 ) ) ( not ( = ?auto_439030 ?auto_439032 ) ) ( not ( = ?auto_439031 ?auto_439032 ) ) ( CLEAR ?auto_439029 ) ( ON ?auto_439030 ?auto_439031 ) ( CLEAR ?auto_439030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_439027 ?auto_439028 ?auto_439029 ?auto_439030 )
      ( MAKE-5PILE ?auto_439027 ?auto_439028 ?auto_439029 ?auto_439030 ?auto_439031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_439049 - BLOCK
      ?auto_439050 - BLOCK
      ?auto_439051 - BLOCK
      ?auto_439052 - BLOCK
      ?auto_439053 - BLOCK
    )
    :vars
    (
      ?auto_439054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439053 ?auto_439054 ) ( ON-TABLE ?auto_439049 ) ( ON ?auto_439050 ?auto_439049 ) ( not ( = ?auto_439049 ?auto_439050 ) ) ( not ( = ?auto_439049 ?auto_439051 ) ) ( not ( = ?auto_439049 ?auto_439052 ) ) ( not ( = ?auto_439049 ?auto_439053 ) ) ( not ( = ?auto_439049 ?auto_439054 ) ) ( not ( = ?auto_439050 ?auto_439051 ) ) ( not ( = ?auto_439050 ?auto_439052 ) ) ( not ( = ?auto_439050 ?auto_439053 ) ) ( not ( = ?auto_439050 ?auto_439054 ) ) ( not ( = ?auto_439051 ?auto_439052 ) ) ( not ( = ?auto_439051 ?auto_439053 ) ) ( not ( = ?auto_439051 ?auto_439054 ) ) ( not ( = ?auto_439052 ?auto_439053 ) ) ( not ( = ?auto_439052 ?auto_439054 ) ) ( not ( = ?auto_439053 ?auto_439054 ) ) ( ON ?auto_439052 ?auto_439053 ) ( CLEAR ?auto_439050 ) ( ON ?auto_439051 ?auto_439052 ) ( CLEAR ?auto_439051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_439049 ?auto_439050 ?auto_439051 )
      ( MAKE-5PILE ?auto_439049 ?auto_439050 ?auto_439051 ?auto_439052 ?auto_439053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_439071 - BLOCK
      ?auto_439072 - BLOCK
      ?auto_439073 - BLOCK
      ?auto_439074 - BLOCK
      ?auto_439075 - BLOCK
    )
    :vars
    (
      ?auto_439076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439075 ?auto_439076 ) ( ON-TABLE ?auto_439071 ) ( not ( = ?auto_439071 ?auto_439072 ) ) ( not ( = ?auto_439071 ?auto_439073 ) ) ( not ( = ?auto_439071 ?auto_439074 ) ) ( not ( = ?auto_439071 ?auto_439075 ) ) ( not ( = ?auto_439071 ?auto_439076 ) ) ( not ( = ?auto_439072 ?auto_439073 ) ) ( not ( = ?auto_439072 ?auto_439074 ) ) ( not ( = ?auto_439072 ?auto_439075 ) ) ( not ( = ?auto_439072 ?auto_439076 ) ) ( not ( = ?auto_439073 ?auto_439074 ) ) ( not ( = ?auto_439073 ?auto_439075 ) ) ( not ( = ?auto_439073 ?auto_439076 ) ) ( not ( = ?auto_439074 ?auto_439075 ) ) ( not ( = ?auto_439074 ?auto_439076 ) ) ( not ( = ?auto_439075 ?auto_439076 ) ) ( ON ?auto_439074 ?auto_439075 ) ( ON ?auto_439073 ?auto_439074 ) ( CLEAR ?auto_439071 ) ( ON ?auto_439072 ?auto_439073 ) ( CLEAR ?auto_439072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_439071 ?auto_439072 )
      ( MAKE-5PILE ?auto_439071 ?auto_439072 ?auto_439073 ?auto_439074 ?auto_439075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_439093 - BLOCK
      ?auto_439094 - BLOCK
      ?auto_439095 - BLOCK
      ?auto_439096 - BLOCK
      ?auto_439097 - BLOCK
    )
    :vars
    (
      ?auto_439098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439097 ?auto_439098 ) ( not ( = ?auto_439093 ?auto_439094 ) ) ( not ( = ?auto_439093 ?auto_439095 ) ) ( not ( = ?auto_439093 ?auto_439096 ) ) ( not ( = ?auto_439093 ?auto_439097 ) ) ( not ( = ?auto_439093 ?auto_439098 ) ) ( not ( = ?auto_439094 ?auto_439095 ) ) ( not ( = ?auto_439094 ?auto_439096 ) ) ( not ( = ?auto_439094 ?auto_439097 ) ) ( not ( = ?auto_439094 ?auto_439098 ) ) ( not ( = ?auto_439095 ?auto_439096 ) ) ( not ( = ?auto_439095 ?auto_439097 ) ) ( not ( = ?auto_439095 ?auto_439098 ) ) ( not ( = ?auto_439096 ?auto_439097 ) ) ( not ( = ?auto_439096 ?auto_439098 ) ) ( not ( = ?auto_439097 ?auto_439098 ) ) ( ON ?auto_439096 ?auto_439097 ) ( ON ?auto_439095 ?auto_439096 ) ( ON ?auto_439094 ?auto_439095 ) ( ON ?auto_439093 ?auto_439094 ) ( CLEAR ?auto_439093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_439093 )
      ( MAKE-5PILE ?auto_439093 ?auto_439094 ?auto_439095 ?auto_439096 ?auto_439097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439116 - BLOCK
      ?auto_439117 - BLOCK
      ?auto_439118 - BLOCK
      ?auto_439119 - BLOCK
      ?auto_439120 - BLOCK
      ?auto_439121 - BLOCK
    )
    :vars
    (
      ?auto_439122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_439120 ) ( ON ?auto_439121 ?auto_439122 ) ( CLEAR ?auto_439121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_439116 ) ( ON ?auto_439117 ?auto_439116 ) ( ON ?auto_439118 ?auto_439117 ) ( ON ?auto_439119 ?auto_439118 ) ( ON ?auto_439120 ?auto_439119 ) ( not ( = ?auto_439116 ?auto_439117 ) ) ( not ( = ?auto_439116 ?auto_439118 ) ) ( not ( = ?auto_439116 ?auto_439119 ) ) ( not ( = ?auto_439116 ?auto_439120 ) ) ( not ( = ?auto_439116 ?auto_439121 ) ) ( not ( = ?auto_439116 ?auto_439122 ) ) ( not ( = ?auto_439117 ?auto_439118 ) ) ( not ( = ?auto_439117 ?auto_439119 ) ) ( not ( = ?auto_439117 ?auto_439120 ) ) ( not ( = ?auto_439117 ?auto_439121 ) ) ( not ( = ?auto_439117 ?auto_439122 ) ) ( not ( = ?auto_439118 ?auto_439119 ) ) ( not ( = ?auto_439118 ?auto_439120 ) ) ( not ( = ?auto_439118 ?auto_439121 ) ) ( not ( = ?auto_439118 ?auto_439122 ) ) ( not ( = ?auto_439119 ?auto_439120 ) ) ( not ( = ?auto_439119 ?auto_439121 ) ) ( not ( = ?auto_439119 ?auto_439122 ) ) ( not ( = ?auto_439120 ?auto_439121 ) ) ( not ( = ?auto_439120 ?auto_439122 ) ) ( not ( = ?auto_439121 ?auto_439122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439121 ?auto_439122 )
      ( !STACK ?auto_439121 ?auto_439120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439142 - BLOCK
      ?auto_439143 - BLOCK
      ?auto_439144 - BLOCK
      ?auto_439145 - BLOCK
      ?auto_439146 - BLOCK
      ?auto_439147 - BLOCK
    )
    :vars
    (
      ?auto_439148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439147 ?auto_439148 ) ( ON-TABLE ?auto_439142 ) ( ON ?auto_439143 ?auto_439142 ) ( ON ?auto_439144 ?auto_439143 ) ( ON ?auto_439145 ?auto_439144 ) ( not ( = ?auto_439142 ?auto_439143 ) ) ( not ( = ?auto_439142 ?auto_439144 ) ) ( not ( = ?auto_439142 ?auto_439145 ) ) ( not ( = ?auto_439142 ?auto_439146 ) ) ( not ( = ?auto_439142 ?auto_439147 ) ) ( not ( = ?auto_439142 ?auto_439148 ) ) ( not ( = ?auto_439143 ?auto_439144 ) ) ( not ( = ?auto_439143 ?auto_439145 ) ) ( not ( = ?auto_439143 ?auto_439146 ) ) ( not ( = ?auto_439143 ?auto_439147 ) ) ( not ( = ?auto_439143 ?auto_439148 ) ) ( not ( = ?auto_439144 ?auto_439145 ) ) ( not ( = ?auto_439144 ?auto_439146 ) ) ( not ( = ?auto_439144 ?auto_439147 ) ) ( not ( = ?auto_439144 ?auto_439148 ) ) ( not ( = ?auto_439145 ?auto_439146 ) ) ( not ( = ?auto_439145 ?auto_439147 ) ) ( not ( = ?auto_439145 ?auto_439148 ) ) ( not ( = ?auto_439146 ?auto_439147 ) ) ( not ( = ?auto_439146 ?auto_439148 ) ) ( not ( = ?auto_439147 ?auto_439148 ) ) ( CLEAR ?auto_439145 ) ( ON ?auto_439146 ?auto_439147 ) ( CLEAR ?auto_439146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_439142 ?auto_439143 ?auto_439144 ?auto_439145 ?auto_439146 )
      ( MAKE-6PILE ?auto_439142 ?auto_439143 ?auto_439144 ?auto_439145 ?auto_439146 ?auto_439147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439168 - BLOCK
      ?auto_439169 - BLOCK
      ?auto_439170 - BLOCK
      ?auto_439171 - BLOCK
      ?auto_439172 - BLOCK
      ?auto_439173 - BLOCK
    )
    :vars
    (
      ?auto_439174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439173 ?auto_439174 ) ( ON-TABLE ?auto_439168 ) ( ON ?auto_439169 ?auto_439168 ) ( ON ?auto_439170 ?auto_439169 ) ( not ( = ?auto_439168 ?auto_439169 ) ) ( not ( = ?auto_439168 ?auto_439170 ) ) ( not ( = ?auto_439168 ?auto_439171 ) ) ( not ( = ?auto_439168 ?auto_439172 ) ) ( not ( = ?auto_439168 ?auto_439173 ) ) ( not ( = ?auto_439168 ?auto_439174 ) ) ( not ( = ?auto_439169 ?auto_439170 ) ) ( not ( = ?auto_439169 ?auto_439171 ) ) ( not ( = ?auto_439169 ?auto_439172 ) ) ( not ( = ?auto_439169 ?auto_439173 ) ) ( not ( = ?auto_439169 ?auto_439174 ) ) ( not ( = ?auto_439170 ?auto_439171 ) ) ( not ( = ?auto_439170 ?auto_439172 ) ) ( not ( = ?auto_439170 ?auto_439173 ) ) ( not ( = ?auto_439170 ?auto_439174 ) ) ( not ( = ?auto_439171 ?auto_439172 ) ) ( not ( = ?auto_439171 ?auto_439173 ) ) ( not ( = ?auto_439171 ?auto_439174 ) ) ( not ( = ?auto_439172 ?auto_439173 ) ) ( not ( = ?auto_439172 ?auto_439174 ) ) ( not ( = ?auto_439173 ?auto_439174 ) ) ( ON ?auto_439172 ?auto_439173 ) ( CLEAR ?auto_439170 ) ( ON ?auto_439171 ?auto_439172 ) ( CLEAR ?auto_439171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_439168 ?auto_439169 ?auto_439170 ?auto_439171 )
      ( MAKE-6PILE ?auto_439168 ?auto_439169 ?auto_439170 ?auto_439171 ?auto_439172 ?auto_439173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439194 - BLOCK
      ?auto_439195 - BLOCK
      ?auto_439196 - BLOCK
      ?auto_439197 - BLOCK
      ?auto_439198 - BLOCK
      ?auto_439199 - BLOCK
    )
    :vars
    (
      ?auto_439200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439199 ?auto_439200 ) ( ON-TABLE ?auto_439194 ) ( ON ?auto_439195 ?auto_439194 ) ( not ( = ?auto_439194 ?auto_439195 ) ) ( not ( = ?auto_439194 ?auto_439196 ) ) ( not ( = ?auto_439194 ?auto_439197 ) ) ( not ( = ?auto_439194 ?auto_439198 ) ) ( not ( = ?auto_439194 ?auto_439199 ) ) ( not ( = ?auto_439194 ?auto_439200 ) ) ( not ( = ?auto_439195 ?auto_439196 ) ) ( not ( = ?auto_439195 ?auto_439197 ) ) ( not ( = ?auto_439195 ?auto_439198 ) ) ( not ( = ?auto_439195 ?auto_439199 ) ) ( not ( = ?auto_439195 ?auto_439200 ) ) ( not ( = ?auto_439196 ?auto_439197 ) ) ( not ( = ?auto_439196 ?auto_439198 ) ) ( not ( = ?auto_439196 ?auto_439199 ) ) ( not ( = ?auto_439196 ?auto_439200 ) ) ( not ( = ?auto_439197 ?auto_439198 ) ) ( not ( = ?auto_439197 ?auto_439199 ) ) ( not ( = ?auto_439197 ?auto_439200 ) ) ( not ( = ?auto_439198 ?auto_439199 ) ) ( not ( = ?auto_439198 ?auto_439200 ) ) ( not ( = ?auto_439199 ?auto_439200 ) ) ( ON ?auto_439198 ?auto_439199 ) ( ON ?auto_439197 ?auto_439198 ) ( CLEAR ?auto_439195 ) ( ON ?auto_439196 ?auto_439197 ) ( CLEAR ?auto_439196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_439194 ?auto_439195 ?auto_439196 )
      ( MAKE-6PILE ?auto_439194 ?auto_439195 ?auto_439196 ?auto_439197 ?auto_439198 ?auto_439199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439220 - BLOCK
      ?auto_439221 - BLOCK
      ?auto_439222 - BLOCK
      ?auto_439223 - BLOCK
      ?auto_439224 - BLOCK
      ?auto_439225 - BLOCK
    )
    :vars
    (
      ?auto_439226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439225 ?auto_439226 ) ( ON-TABLE ?auto_439220 ) ( not ( = ?auto_439220 ?auto_439221 ) ) ( not ( = ?auto_439220 ?auto_439222 ) ) ( not ( = ?auto_439220 ?auto_439223 ) ) ( not ( = ?auto_439220 ?auto_439224 ) ) ( not ( = ?auto_439220 ?auto_439225 ) ) ( not ( = ?auto_439220 ?auto_439226 ) ) ( not ( = ?auto_439221 ?auto_439222 ) ) ( not ( = ?auto_439221 ?auto_439223 ) ) ( not ( = ?auto_439221 ?auto_439224 ) ) ( not ( = ?auto_439221 ?auto_439225 ) ) ( not ( = ?auto_439221 ?auto_439226 ) ) ( not ( = ?auto_439222 ?auto_439223 ) ) ( not ( = ?auto_439222 ?auto_439224 ) ) ( not ( = ?auto_439222 ?auto_439225 ) ) ( not ( = ?auto_439222 ?auto_439226 ) ) ( not ( = ?auto_439223 ?auto_439224 ) ) ( not ( = ?auto_439223 ?auto_439225 ) ) ( not ( = ?auto_439223 ?auto_439226 ) ) ( not ( = ?auto_439224 ?auto_439225 ) ) ( not ( = ?auto_439224 ?auto_439226 ) ) ( not ( = ?auto_439225 ?auto_439226 ) ) ( ON ?auto_439224 ?auto_439225 ) ( ON ?auto_439223 ?auto_439224 ) ( ON ?auto_439222 ?auto_439223 ) ( CLEAR ?auto_439220 ) ( ON ?auto_439221 ?auto_439222 ) ( CLEAR ?auto_439221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_439220 ?auto_439221 )
      ( MAKE-6PILE ?auto_439220 ?auto_439221 ?auto_439222 ?auto_439223 ?auto_439224 ?auto_439225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_439246 - BLOCK
      ?auto_439247 - BLOCK
      ?auto_439248 - BLOCK
      ?auto_439249 - BLOCK
      ?auto_439250 - BLOCK
      ?auto_439251 - BLOCK
    )
    :vars
    (
      ?auto_439252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439251 ?auto_439252 ) ( not ( = ?auto_439246 ?auto_439247 ) ) ( not ( = ?auto_439246 ?auto_439248 ) ) ( not ( = ?auto_439246 ?auto_439249 ) ) ( not ( = ?auto_439246 ?auto_439250 ) ) ( not ( = ?auto_439246 ?auto_439251 ) ) ( not ( = ?auto_439246 ?auto_439252 ) ) ( not ( = ?auto_439247 ?auto_439248 ) ) ( not ( = ?auto_439247 ?auto_439249 ) ) ( not ( = ?auto_439247 ?auto_439250 ) ) ( not ( = ?auto_439247 ?auto_439251 ) ) ( not ( = ?auto_439247 ?auto_439252 ) ) ( not ( = ?auto_439248 ?auto_439249 ) ) ( not ( = ?auto_439248 ?auto_439250 ) ) ( not ( = ?auto_439248 ?auto_439251 ) ) ( not ( = ?auto_439248 ?auto_439252 ) ) ( not ( = ?auto_439249 ?auto_439250 ) ) ( not ( = ?auto_439249 ?auto_439251 ) ) ( not ( = ?auto_439249 ?auto_439252 ) ) ( not ( = ?auto_439250 ?auto_439251 ) ) ( not ( = ?auto_439250 ?auto_439252 ) ) ( not ( = ?auto_439251 ?auto_439252 ) ) ( ON ?auto_439250 ?auto_439251 ) ( ON ?auto_439249 ?auto_439250 ) ( ON ?auto_439248 ?auto_439249 ) ( ON ?auto_439247 ?auto_439248 ) ( ON ?auto_439246 ?auto_439247 ) ( CLEAR ?auto_439246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_439246 )
      ( MAKE-6PILE ?auto_439246 ?auto_439247 ?auto_439248 ?auto_439249 ?auto_439250 ?auto_439251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439273 - BLOCK
      ?auto_439274 - BLOCK
      ?auto_439275 - BLOCK
      ?auto_439276 - BLOCK
      ?auto_439277 - BLOCK
      ?auto_439278 - BLOCK
      ?auto_439279 - BLOCK
    )
    :vars
    (
      ?auto_439280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_439278 ) ( ON ?auto_439279 ?auto_439280 ) ( CLEAR ?auto_439279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_439273 ) ( ON ?auto_439274 ?auto_439273 ) ( ON ?auto_439275 ?auto_439274 ) ( ON ?auto_439276 ?auto_439275 ) ( ON ?auto_439277 ?auto_439276 ) ( ON ?auto_439278 ?auto_439277 ) ( not ( = ?auto_439273 ?auto_439274 ) ) ( not ( = ?auto_439273 ?auto_439275 ) ) ( not ( = ?auto_439273 ?auto_439276 ) ) ( not ( = ?auto_439273 ?auto_439277 ) ) ( not ( = ?auto_439273 ?auto_439278 ) ) ( not ( = ?auto_439273 ?auto_439279 ) ) ( not ( = ?auto_439273 ?auto_439280 ) ) ( not ( = ?auto_439274 ?auto_439275 ) ) ( not ( = ?auto_439274 ?auto_439276 ) ) ( not ( = ?auto_439274 ?auto_439277 ) ) ( not ( = ?auto_439274 ?auto_439278 ) ) ( not ( = ?auto_439274 ?auto_439279 ) ) ( not ( = ?auto_439274 ?auto_439280 ) ) ( not ( = ?auto_439275 ?auto_439276 ) ) ( not ( = ?auto_439275 ?auto_439277 ) ) ( not ( = ?auto_439275 ?auto_439278 ) ) ( not ( = ?auto_439275 ?auto_439279 ) ) ( not ( = ?auto_439275 ?auto_439280 ) ) ( not ( = ?auto_439276 ?auto_439277 ) ) ( not ( = ?auto_439276 ?auto_439278 ) ) ( not ( = ?auto_439276 ?auto_439279 ) ) ( not ( = ?auto_439276 ?auto_439280 ) ) ( not ( = ?auto_439277 ?auto_439278 ) ) ( not ( = ?auto_439277 ?auto_439279 ) ) ( not ( = ?auto_439277 ?auto_439280 ) ) ( not ( = ?auto_439278 ?auto_439279 ) ) ( not ( = ?auto_439278 ?auto_439280 ) ) ( not ( = ?auto_439279 ?auto_439280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439279 ?auto_439280 )
      ( !STACK ?auto_439279 ?auto_439278 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439303 - BLOCK
      ?auto_439304 - BLOCK
      ?auto_439305 - BLOCK
      ?auto_439306 - BLOCK
      ?auto_439307 - BLOCK
      ?auto_439308 - BLOCK
      ?auto_439309 - BLOCK
    )
    :vars
    (
      ?auto_439310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439309 ?auto_439310 ) ( ON-TABLE ?auto_439303 ) ( ON ?auto_439304 ?auto_439303 ) ( ON ?auto_439305 ?auto_439304 ) ( ON ?auto_439306 ?auto_439305 ) ( ON ?auto_439307 ?auto_439306 ) ( not ( = ?auto_439303 ?auto_439304 ) ) ( not ( = ?auto_439303 ?auto_439305 ) ) ( not ( = ?auto_439303 ?auto_439306 ) ) ( not ( = ?auto_439303 ?auto_439307 ) ) ( not ( = ?auto_439303 ?auto_439308 ) ) ( not ( = ?auto_439303 ?auto_439309 ) ) ( not ( = ?auto_439303 ?auto_439310 ) ) ( not ( = ?auto_439304 ?auto_439305 ) ) ( not ( = ?auto_439304 ?auto_439306 ) ) ( not ( = ?auto_439304 ?auto_439307 ) ) ( not ( = ?auto_439304 ?auto_439308 ) ) ( not ( = ?auto_439304 ?auto_439309 ) ) ( not ( = ?auto_439304 ?auto_439310 ) ) ( not ( = ?auto_439305 ?auto_439306 ) ) ( not ( = ?auto_439305 ?auto_439307 ) ) ( not ( = ?auto_439305 ?auto_439308 ) ) ( not ( = ?auto_439305 ?auto_439309 ) ) ( not ( = ?auto_439305 ?auto_439310 ) ) ( not ( = ?auto_439306 ?auto_439307 ) ) ( not ( = ?auto_439306 ?auto_439308 ) ) ( not ( = ?auto_439306 ?auto_439309 ) ) ( not ( = ?auto_439306 ?auto_439310 ) ) ( not ( = ?auto_439307 ?auto_439308 ) ) ( not ( = ?auto_439307 ?auto_439309 ) ) ( not ( = ?auto_439307 ?auto_439310 ) ) ( not ( = ?auto_439308 ?auto_439309 ) ) ( not ( = ?auto_439308 ?auto_439310 ) ) ( not ( = ?auto_439309 ?auto_439310 ) ) ( CLEAR ?auto_439307 ) ( ON ?auto_439308 ?auto_439309 ) ( CLEAR ?auto_439308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_439303 ?auto_439304 ?auto_439305 ?auto_439306 ?auto_439307 ?auto_439308 )
      ( MAKE-7PILE ?auto_439303 ?auto_439304 ?auto_439305 ?auto_439306 ?auto_439307 ?auto_439308 ?auto_439309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439333 - BLOCK
      ?auto_439334 - BLOCK
      ?auto_439335 - BLOCK
      ?auto_439336 - BLOCK
      ?auto_439337 - BLOCK
      ?auto_439338 - BLOCK
      ?auto_439339 - BLOCK
    )
    :vars
    (
      ?auto_439340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439339 ?auto_439340 ) ( ON-TABLE ?auto_439333 ) ( ON ?auto_439334 ?auto_439333 ) ( ON ?auto_439335 ?auto_439334 ) ( ON ?auto_439336 ?auto_439335 ) ( not ( = ?auto_439333 ?auto_439334 ) ) ( not ( = ?auto_439333 ?auto_439335 ) ) ( not ( = ?auto_439333 ?auto_439336 ) ) ( not ( = ?auto_439333 ?auto_439337 ) ) ( not ( = ?auto_439333 ?auto_439338 ) ) ( not ( = ?auto_439333 ?auto_439339 ) ) ( not ( = ?auto_439333 ?auto_439340 ) ) ( not ( = ?auto_439334 ?auto_439335 ) ) ( not ( = ?auto_439334 ?auto_439336 ) ) ( not ( = ?auto_439334 ?auto_439337 ) ) ( not ( = ?auto_439334 ?auto_439338 ) ) ( not ( = ?auto_439334 ?auto_439339 ) ) ( not ( = ?auto_439334 ?auto_439340 ) ) ( not ( = ?auto_439335 ?auto_439336 ) ) ( not ( = ?auto_439335 ?auto_439337 ) ) ( not ( = ?auto_439335 ?auto_439338 ) ) ( not ( = ?auto_439335 ?auto_439339 ) ) ( not ( = ?auto_439335 ?auto_439340 ) ) ( not ( = ?auto_439336 ?auto_439337 ) ) ( not ( = ?auto_439336 ?auto_439338 ) ) ( not ( = ?auto_439336 ?auto_439339 ) ) ( not ( = ?auto_439336 ?auto_439340 ) ) ( not ( = ?auto_439337 ?auto_439338 ) ) ( not ( = ?auto_439337 ?auto_439339 ) ) ( not ( = ?auto_439337 ?auto_439340 ) ) ( not ( = ?auto_439338 ?auto_439339 ) ) ( not ( = ?auto_439338 ?auto_439340 ) ) ( not ( = ?auto_439339 ?auto_439340 ) ) ( ON ?auto_439338 ?auto_439339 ) ( CLEAR ?auto_439336 ) ( ON ?auto_439337 ?auto_439338 ) ( CLEAR ?auto_439337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_439333 ?auto_439334 ?auto_439335 ?auto_439336 ?auto_439337 )
      ( MAKE-7PILE ?auto_439333 ?auto_439334 ?auto_439335 ?auto_439336 ?auto_439337 ?auto_439338 ?auto_439339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439363 - BLOCK
      ?auto_439364 - BLOCK
      ?auto_439365 - BLOCK
      ?auto_439366 - BLOCK
      ?auto_439367 - BLOCK
      ?auto_439368 - BLOCK
      ?auto_439369 - BLOCK
    )
    :vars
    (
      ?auto_439370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439369 ?auto_439370 ) ( ON-TABLE ?auto_439363 ) ( ON ?auto_439364 ?auto_439363 ) ( ON ?auto_439365 ?auto_439364 ) ( not ( = ?auto_439363 ?auto_439364 ) ) ( not ( = ?auto_439363 ?auto_439365 ) ) ( not ( = ?auto_439363 ?auto_439366 ) ) ( not ( = ?auto_439363 ?auto_439367 ) ) ( not ( = ?auto_439363 ?auto_439368 ) ) ( not ( = ?auto_439363 ?auto_439369 ) ) ( not ( = ?auto_439363 ?auto_439370 ) ) ( not ( = ?auto_439364 ?auto_439365 ) ) ( not ( = ?auto_439364 ?auto_439366 ) ) ( not ( = ?auto_439364 ?auto_439367 ) ) ( not ( = ?auto_439364 ?auto_439368 ) ) ( not ( = ?auto_439364 ?auto_439369 ) ) ( not ( = ?auto_439364 ?auto_439370 ) ) ( not ( = ?auto_439365 ?auto_439366 ) ) ( not ( = ?auto_439365 ?auto_439367 ) ) ( not ( = ?auto_439365 ?auto_439368 ) ) ( not ( = ?auto_439365 ?auto_439369 ) ) ( not ( = ?auto_439365 ?auto_439370 ) ) ( not ( = ?auto_439366 ?auto_439367 ) ) ( not ( = ?auto_439366 ?auto_439368 ) ) ( not ( = ?auto_439366 ?auto_439369 ) ) ( not ( = ?auto_439366 ?auto_439370 ) ) ( not ( = ?auto_439367 ?auto_439368 ) ) ( not ( = ?auto_439367 ?auto_439369 ) ) ( not ( = ?auto_439367 ?auto_439370 ) ) ( not ( = ?auto_439368 ?auto_439369 ) ) ( not ( = ?auto_439368 ?auto_439370 ) ) ( not ( = ?auto_439369 ?auto_439370 ) ) ( ON ?auto_439368 ?auto_439369 ) ( ON ?auto_439367 ?auto_439368 ) ( CLEAR ?auto_439365 ) ( ON ?auto_439366 ?auto_439367 ) ( CLEAR ?auto_439366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_439363 ?auto_439364 ?auto_439365 ?auto_439366 )
      ( MAKE-7PILE ?auto_439363 ?auto_439364 ?auto_439365 ?auto_439366 ?auto_439367 ?auto_439368 ?auto_439369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439393 - BLOCK
      ?auto_439394 - BLOCK
      ?auto_439395 - BLOCK
      ?auto_439396 - BLOCK
      ?auto_439397 - BLOCK
      ?auto_439398 - BLOCK
      ?auto_439399 - BLOCK
    )
    :vars
    (
      ?auto_439400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439399 ?auto_439400 ) ( ON-TABLE ?auto_439393 ) ( ON ?auto_439394 ?auto_439393 ) ( not ( = ?auto_439393 ?auto_439394 ) ) ( not ( = ?auto_439393 ?auto_439395 ) ) ( not ( = ?auto_439393 ?auto_439396 ) ) ( not ( = ?auto_439393 ?auto_439397 ) ) ( not ( = ?auto_439393 ?auto_439398 ) ) ( not ( = ?auto_439393 ?auto_439399 ) ) ( not ( = ?auto_439393 ?auto_439400 ) ) ( not ( = ?auto_439394 ?auto_439395 ) ) ( not ( = ?auto_439394 ?auto_439396 ) ) ( not ( = ?auto_439394 ?auto_439397 ) ) ( not ( = ?auto_439394 ?auto_439398 ) ) ( not ( = ?auto_439394 ?auto_439399 ) ) ( not ( = ?auto_439394 ?auto_439400 ) ) ( not ( = ?auto_439395 ?auto_439396 ) ) ( not ( = ?auto_439395 ?auto_439397 ) ) ( not ( = ?auto_439395 ?auto_439398 ) ) ( not ( = ?auto_439395 ?auto_439399 ) ) ( not ( = ?auto_439395 ?auto_439400 ) ) ( not ( = ?auto_439396 ?auto_439397 ) ) ( not ( = ?auto_439396 ?auto_439398 ) ) ( not ( = ?auto_439396 ?auto_439399 ) ) ( not ( = ?auto_439396 ?auto_439400 ) ) ( not ( = ?auto_439397 ?auto_439398 ) ) ( not ( = ?auto_439397 ?auto_439399 ) ) ( not ( = ?auto_439397 ?auto_439400 ) ) ( not ( = ?auto_439398 ?auto_439399 ) ) ( not ( = ?auto_439398 ?auto_439400 ) ) ( not ( = ?auto_439399 ?auto_439400 ) ) ( ON ?auto_439398 ?auto_439399 ) ( ON ?auto_439397 ?auto_439398 ) ( ON ?auto_439396 ?auto_439397 ) ( CLEAR ?auto_439394 ) ( ON ?auto_439395 ?auto_439396 ) ( CLEAR ?auto_439395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_439393 ?auto_439394 ?auto_439395 )
      ( MAKE-7PILE ?auto_439393 ?auto_439394 ?auto_439395 ?auto_439396 ?auto_439397 ?auto_439398 ?auto_439399 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439423 - BLOCK
      ?auto_439424 - BLOCK
      ?auto_439425 - BLOCK
      ?auto_439426 - BLOCK
      ?auto_439427 - BLOCK
      ?auto_439428 - BLOCK
      ?auto_439429 - BLOCK
    )
    :vars
    (
      ?auto_439430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439429 ?auto_439430 ) ( ON-TABLE ?auto_439423 ) ( not ( = ?auto_439423 ?auto_439424 ) ) ( not ( = ?auto_439423 ?auto_439425 ) ) ( not ( = ?auto_439423 ?auto_439426 ) ) ( not ( = ?auto_439423 ?auto_439427 ) ) ( not ( = ?auto_439423 ?auto_439428 ) ) ( not ( = ?auto_439423 ?auto_439429 ) ) ( not ( = ?auto_439423 ?auto_439430 ) ) ( not ( = ?auto_439424 ?auto_439425 ) ) ( not ( = ?auto_439424 ?auto_439426 ) ) ( not ( = ?auto_439424 ?auto_439427 ) ) ( not ( = ?auto_439424 ?auto_439428 ) ) ( not ( = ?auto_439424 ?auto_439429 ) ) ( not ( = ?auto_439424 ?auto_439430 ) ) ( not ( = ?auto_439425 ?auto_439426 ) ) ( not ( = ?auto_439425 ?auto_439427 ) ) ( not ( = ?auto_439425 ?auto_439428 ) ) ( not ( = ?auto_439425 ?auto_439429 ) ) ( not ( = ?auto_439425 ?auto_439430 ) ) ( not ( = ?auto_439426 ?auto_439427 ) ) ( not ( = ?auto_439426 ?auto_439428 ) ) ( not ( = ?auto_439426 ?auto_439429 ) ) ( not ( = ?auto_439426 ?auto_439430 ) ) ( not ( = ?auto_439427 ?auto_439428 ) ) ( not ( = ?auto_439427 ?auto_439429 ) ) ( not ( = ?auto_439427 ?auto_439430 ) ) ( not ( = ?auto_439428 ?auto_439429 ) ) ( not ( = ?auto_439428 ?auto_439430 ) ) ( not ( = ?auto_439429 ?auto_439430 ) ) ( ON ?auto_439428 ?auto_439429 ) ( ON ?auto_439427 ?auto_439428 ) ( ON ?auto_439426 ?auto_439427 ) ( ON ?auto_439425 ?auto_439426 ) ( CLEAR ?auto_439423 ) ( ON ?auto_439424 ?auto_439425 ) ( CLEAR ?auto_439424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_439423 ?auto_439424 )
      ( MAKE-7PILE ?auto_439423 ?auto_439424 ?auto_439425 ?auto_439426 ?auto_439427 ?auto_439428 ?auto_439429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_439453 - BLOCK
      ?auto_439454 - BLOCK
      ?auto_439455 - BLOCK
      ?auto_439456 - BLOCK
      ?auto_439457 - BLOCK
      ?auto_439458 - BLOCK
      ?auto_439459 - BLOCK
    )
    :vars
    (
      ?auto_439460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439459 ?auto_439460 ) ( not ( = ?auto_439453 ?auto_439454 ) ) ( not ( = ?auto_439453 ?auto_439455 ) ) ( not ( = ?auto_439453 ?auto_439456 ) ) ( not ( = ?auto_439453 ?auto_439457 ) ) ( not ( = ?auto_439453 ?auto_439458 ) ) ( not ( = ?auto_439453 ?auto_439459 ) ) ( not ( = ?auto_439453 ?auto_439460 ) ) ( not ( = ?auto_439454 ?auto_439455 ) ) ( not ( = ?auto_439454 ?auto_439456 ) ) ( not ( = ?auto_439454 ?auto_439457 ) ) ( not ( = ?auto_439454 ?auto_439458 ) ) ( not ( = ?auto_439454 ?auto_439459 ) ) ( not ( = ?auto_439454 ?auto_439460 ) ) ( not ( = ?auto_439455 ?auto_439456 ) ) ( not ( = ?auto_439455 ?auto_439457 ) ) ( not ( = ?auto_439455 ?auto_439458 ) ) ( not ( = ?auto_439455 ?auto_439459 ) ) ( not ( = ?auto_439455 ?auto_439460 ) ) ( not ( = ?auto_439456 ?auto_439457 ) ) ( not ( = ?auto_439456 ?auto_439458 ) ) ( not ( = ?auto_439456 ?auto_439459 ) ) ( not ( = ?auto_439456 ?auto_439460 ) ) ( not ( = ?auto_439457 ?auto_439458 ) ) ( not ( = ?auto_439457 ?auto_439459 ) ) ( not ( = ?auto_439457 ?auto_439460 ) ) ( not ( = ?auto_439458 ?auto_439459 ) ) ( not ( = ?auto_439458 ?auto_439460 ) ) ( not ( = ?auto_439459 ?auto_439460 ) ) ( ON ?auto_439458 ?auto_439459 ) ( ON ?auto_439457 ?auto_439458 ) ( ON ?auto_439456 ?auto_439457 ) ( ON ?auto_439455 ?auto_439456 ) ( ON ?auto_439454 ?auto_439455 ) ( ON ?auto_439453 ?auto_439454 ) ( CLEAR ?auto_439453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_439453 )
      ( MAKE-7PILE ?auto_439453 ?auto_439454 ?auto_439455 ?auto_439456 ?auto_439457 ?auto_439458 ?auto_439459 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439484 - BLOCK
      ?auto_439485 - BLOCK
      ?auto_439486 - BLOCK
      ?auto_439487 - BLOCK
      ?auto_439488 - BLOCK
      ?auto_439489 - BLOCK
      ?auto_439490 - BLOCK
      ?auto_439491 - BLOCK
    )
    :vars
    (
      ?auto_439492 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_439490 ) ( ON ?auto_439491 ?auto_439492 ) ( CLEAR ?auto_439491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_439484 ) ( ON ?auto_439485 ?auto_439484 ) ( ON ?auto_439486 ?auto_439485 ) ( ON ?auto_439487 ?auto_439486 ) ( ON ?auto_439488 ?auto_439487 ) ( ON ?auto_439489 ?auto_439488 ) ( ON ?auto_439490 ?auto_439489 ) ( not ( = ?auto_439484 ?auto_439485 ) ) ( not ( = ?auto_439484 ?auto_439486 ) ) ( not ( = ?auto_439484 ?auto_439487 ) ) ( not ( = ?auto_439484 ?auto_439488 ) ) ( not ( = ?auto_439484 ?auto_439489 ) ) ( not ( = ?auto_439484 ?auto_439490 ) ) ( not ( = ?auto_439484 ?auto_439491 ) ) ( not ( = ?auto_439484 ?auto_439492 ) ) ( not ( = ?auto_439485 ?auto_439486 ) ) ( not ( = ?auto_439485 ?auto_439487 ) ) ( not ( = ?auto_439485 ?auto_439488 ) ) ( not ( = ?auto_439485 ?auto_439489 ) ) ( not ( = ?auto_439485 ?auto_439490 ) ) ( not ( = ?auto_439485 ?auto_439491 ) ) ( not ( = ?auto_439485 ?auto_439492 ) ) ( not ( = ?auto_439486 ?auto_439487 ) ) ( not ( = ?auto_439486 ?auto_439488 ) ) ( not ( = ?auto_439486 ?auto_439489 ) ) ( not ( = ?auto_439486 ?auto_439490 ) ) ( not ( = ?auto_439486 ?auto_439491 ) ) ( not ( = ?auto_439486 ?auto_439492 ) ) ( not ( = ?auto_439487 ?auto_439488 ) ) ( not ( = ?auto_439487 ?auto_439489 ) ) ( not ( = ?auto_439487 ?auto_439490 ) ) ( not ( = ?auto_439487 ?auto_439491 ) ) ( not ( = ?auto_439487 ?auto_439492 ) ) ( not ( = ?auto_439488 ?auto_439489 ) ) ( not ( = ?auto_439488 ?auto_439490 ) ) ( not ( = ?auto_439488 ?auto_439491 ) ) ( not ( = ?auto_439488 ?auto_439492 ) ) ( not ( = ?auto_439489 ?auto_439490 ) ) ( not ( = ?auto_439489 ?auto_439491 ) ) ( not ( = ?auto_439489 ?auto_439492 ) ) ( not ( = ?auto_439490 ?auto_439491 ) ) ( not ( = ?auto_439490 ?auto_439492 ) ) ( not ( = ?auto_439491 ?auto_439492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439491 ?auto_439492 )
      ( !STACK ?auto_439491 ?auto_439490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439518 - BLOCK
      ?auto_439519 - BLOCK
      ?auto_439520 - BLOCK
      ?auto_439521 - BLOCK
      ?auto_439522 - BLOCK
      ?auto_439523 - BLOCK
      ?auto_439524 - BLOCK
      ?auto_439525 - BLOCK
    )
    :vars
    (
      ?auto_439526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439525 ?auto_439526 ) ( ON-TABLE ?auto_439518 ) ( ON ?auto_439519 ?auto_439518 ) ( ON ?auto_439520 ?auto_439519 ) ( ON ?auto_439521 ?auto_439520 ) ( ON ?auto_439522 ?auto_439521 ) ( ON ?auto_439523 ?auto_439522 ) ( not ( = ?auto_439518 ?auto_439519 ) ) ( not ( = ?auto_439518 ?auto_439520 ) ) ( not ( = ?auto_439518 ?auto_439521 ) ) ( not ( = ?auto_439518 ?auto_439522 ) ) ( not ( = ?auto_439518 ?auto_439523 ) ) ( not ( = ?auto_439518 ?auto_439524 ) ) ( not ( = ?auto_439518 ?auto_439525 ) ) ( not ( = ?auto_439518 ?auto_439526 ) ) ( not ( = ?auto_439519 ?auto_439520 ) ) ( not ( = ?auto_439519 ?auto_439521 ) ) ( not ( = ?auto_439519 ?auto_439522 ) ) ( not ( = ?auto_439519 ?auto_439523 ) ) ( not ( = ?auto_439519 ?auto_439524 ) ) ( not ( = ?auto_439519 ?auto_439525 ) ) ( not ( = ?auto_439519 ?auto_439526 ) ) ( not ( = ?auto_439520 ?auto_439521 ) ) ( not ( = ?auto_439520 ?auto_439522 ) ) ( not ( = ?auto_439520 ?auto_439523 ) ) ( not ( = ?auto_439520 ?auto_439524 ) ) ( not ( = ?auto_439520 ?auto_439525 ) ) ( not ( = ?auto_439520 ?auto_439526 ) ) ( not ( = ?auto_439521 ?auto_439522 ) ) ( not ( = ?auto_439521 ?auto_439523 ) ) ( not ( = ?auto_439521 ?auto_439524 ) ) ( not ( = ?auto_439521 ?auto_439525 ) ) ( not ( = ?auto_439521 ?auto_439526 ) ) ( not ( = ?auto_439522 ?auto_439523 ) ) ( not ( = ?auto_439522 ?auto_439524 ) ) ( not ( = ?auto_439522 ?auto_439525 ) ) ( not ( = ?auto_439522 ?auto_439526 ) ) ( not ( = ?auto_439523 ?auto_439524 ) ) ( not ( = ?auto_439523 ?auto_439525 ) ) ( not ( = ?auto_439523 ?auto_439526 ) ) ( not ( = ?auto_439524 ?auto_439525 ) ) ( not ( = ?auto_439524 ?auto_439526 ) ) ( not ( = ?auto_439525 ?auto_439526 ) ) ( CLEAR ?auto_439523 ) ( ON ?auto_439524 ?auto_439525 ) ( CLEAR ?auto_439524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_439518 ?auto_439519 ?auto_439520 ?auto_439521 ?auto_439522 ?auto_439523 ?auto_439524 )
      ( MAKE-8PILE ?auto_439518 ?auto_439519 ?auto_439520 ?auto_439521 ?auto_439522 ?auto_439523 ?auto_439524 ?auto_439525 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439552 - BLOCK
      ?auto_439553 - BLOCK
      ?auto_439554 - BLOCK
      ?auto_439555 - BLOCK
      ?auto_439556 - BLOCK
      ?auto_439557 - BLOCK
      ?auto_439558 - BLOCK
      ?auto_439559 - BLOCK
    )
    :vars
    (
      ?auto_439560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439559 ?auto_439560 ) ( ON-TABLE ?auto_439552 ) ( ON ?auto_439553 ?auto_439552 ) ( ON ?auto_439554 ?auto_439553 ) ( ON ?auto_439555 ?auto_439554 ) ( ON ?auto_439556 ?auto_439555 ) ( not ( = ?auto_439552 ?auto_439553 ) ) ( not ( = ?auto_439552 ?auto_439554 ) ) ( not ( = ?auto_439552 ?auto_439555 ) ) ( not ( = ?auto_439552 ?auto_439556 ) ) ( not ( = ?auto_439552 ?auto_439557 ) ) ( not ( = ?auto_439552 ?auto_439558 ) ) ( not ( = ?auto_439552 ?auto_439559 ) ) ( not ( = ?auto_439552 ?auto_439560 ) ) ( not ( = ?auto_439553 ?auto_439554 ) ) ( not ( = ?auto_439553 ?auto_439555 ) ) ( not ( = ?auto_439553 ?auto_439556 ) ) ( not ( = ?auto_439553 ?auto_439557 ) ) ( not ( = ?auto_439553 ?auto_439558 ) ) ( not ( = ?auto_439553 ?auto_439559 ) ) ( not ( = ?auto_439553 ?auto_439560 ) ) ( not ( = ?auto_439554 ?auto_439555 ) ) ( not ( = ?auto_439554 ?auto_439556 ) ) ( not ( = ?auto_439554 ?auto_439557 ) ) ( not ( = ?auto_439554 ?auto_439558 ) ) ( not ( = ?auto_439554 ?auto_439559 ) ) ( not ( = ?auto_439554 ?auto_439560 ) ) ( not ( = ?auto_439555 ?auto_439556 ) ) ( not ( = ?auto_439555 ?auto_439557 ) ) ( not ( = ?auto_439555 ?auto_439558 ) ) ( not ( = ?auto_439555 ?auto_439559 ) ) ( not ( = ?auto_439555 ?auto_439560 ) ) ( not ( = ?auto_439556 ?auto_439557 ) ) ( not ( = ?auto_439556 ?auto_439558 ) ) ( not ( = ?auto_439556 ?auto_439559 ) ) ( not ( = ?auto_439556 ?auto_439560 ) ) ( not ( = ?auto_439557 ?auto_439558 ) ) ( not ( = ?auto_439557 ?auto_439559 ) ) ( not ( = ?auto_439557 ?auto_439560 ) ) ( not ( = ?auto_439558 ?auto_439559 ) ) ( not ( = ?auto_439558 ?auto_439560 ) ) ( not ( = ?auto_439559 ?auto_439560 ) ) ( ON ?auto_439558 ?auto_439559 ) ( CLEAR ?auto_439556 ) ( ON ?auto_439557 ?auto_439558 ) ( CLEAR ?auto_439557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_439552 ?auto_439553 ?auto_439554 ?auto_439555 ?auto_439556 ?auto_439557 )
      ( MAKE-8PILE ?auto_439552 ?auto_439553 ?auto_439554 ?auto_439555 ?auto_439556 ?auto_439557 ?auto_439558 ?auto_439559 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439586 - BLOCK
      ?auto_439587 - BLOCK
      ?auto_439588 - BLOCK
      ?auto_439589 - BLOCK
      ?auto_439590 - BLOCK
      ?auto_439591 - BLOCK
      ?auto_439592 - BLOCK
      ?auto_439593 - BLOCK
    )
    :vars
    (
      ?auto_439594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439593 ?auto_439594 ) ( ON-TABLE ?auto_439586 ) ( ON ?auto_439587 ?auto_439586 ) ( ON ?auto_439588 ?auto_439587 ) ( ON ?auto_439589 ?auto_439588 ) ( not ( = ?auto_439586 ?auto_439587 ) ) ( not ( = ?auto_439586 ?auto_439588 ) ) ( not ( = ?auto_439586 ?auto_439589 ) ) ( not ( = ?auto_439586 ?auto_439590 ) ) ( not ( = ?auto_439586 ?auto_439591 ) ) ( not ( = ?auto_439586 ?auto_439592 ) ) ( not ( = ?auto_439586 ?auto_439593 ) ) ( not ( = ?auto_439586 ?auto_439594 ) ) ( not ( = ?auto_439587 ?auto_439588 ) ) ( not ( = ?auto_439587 ?auto_439589 ) ) ( not ( = ?auto_439587 ?auto_439590 ) ) ( not ( = ?auto_439587 ?auto_439591 ) ) ( not ( = ?auto_439587 ?auto_439592 ) ) ( not ( = ?auto_439587 ?auto_439593 ) ) ( not ( = ?auto_439587 ?auto_439594 ) ) ( not ( = ?auto_439588 ?auto_439589 ) ) ( not ( = ?auto_439588 ?auto_439590 ) ) ( not ( = ?auto_439588 ?auto_439591 ) ) ( not ( = ?auto_439588 ?auto_439592 ) ) ( not ( = ?auto_439588 ?auto_439593 ) ) ( not ( = ?auto_439588 ?auto_439594 ) ) ( not ( = ?auto_439589 ?auto_439590 ) ) ( not ( = ?auto_439589 ?auto_439591 ) ) ( not ( = ?auto_439589 ?auto_439592 ) ) ( not ( = ?auto_439589 ?auto_439593 ) ) ( not ( = ?auto_439589 ?auto_439594 ) ) ( not ( = ?auto_439590 ?auto_439591 ) ) ( not ( = ?auto_439590 ?auto_439592 ) ) ( not ( = ?auto_439590 ?auto_439593 ) ) ( not ( = ?auto_439590 ?auto_439594 ) ) ( not ( = ?auto_439591 ?auto_439592 ) ) ( not ( = ?auto_439591 ?auto_439593 ) ) ( not ( = ?auto_439591 ?auto_439594 ) ) ( not ( = ?auto_439592 ?auto_439593 ) ) ( not ( = ?auto_439592 ?auto_439594 ) ) ( not ( = ?auto_439593 ?auto_439594 ) ) ( ON ?auto_439592 ?auto_439593 ) ( ON ?auto_439591 ?auto_439592 ) ( CLEAR ?auto_439589 ) ( ON ?auto_439590 ?auto_439591 ) ( CLEAR ?auto_439590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_439586 ?auto_439587 ?auto_439588 ?auto_439589 ?auto_439590 )
      ( MAKE-8PILE ?auto_439586 ?auto_439587 ?auto_439588 ?auto_439589 ?auto_439590 ?auto_439591 ?auto_439592 ?auto_439593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439620 - BLOCK
      ?auto_439621 - BLOCK
      ?auto_439622 - BLOCK
      ?auto_439623 - BLOCK
      ?auto_439624 - BLOCK
      ?auto_439625 - BLOCK
      ?auto_439626 - BLOCK
      ?auto_439627 - BLOCK
    )
    :vars
    (
      ?auto_439628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439627 ?auto_439628 ) ( ON-TABLE ?auto_439620 ) ( ON ?auto_439621 ?auto_439620 ) ( ON ?auto_439622 ?auto_439621 ) ( not ( = ?auto_439620 ?auto_439621 ) ) ( not ( = ?auto_439620 ?auto_439622 ) ) ( not ( = ?auto_439620 ?auto_439623 ) ) ( not ( = ?auto_439620 ?auto_439624 ) ) ( not ( = ?auto_439620 ?auto_439625 ) ) ( not ( = ?auto_439620 ?auto_439626 ) ) ( not ( = ?auto_439620 ?auto_439627 ) ) ( not ( = ?auto_439620 ?auto_439628 ) ) ( not ( = ?auto_439621 ?auto_439622 ) ) ( not ( = ?auto_439621 ?auto_439623 ) ) ( not ( = ?auto_439621 ?auto_439624 ) ) ( not ( = ?auto_439621 ?auto_439625 ) ) ( not ( = ?auto_439621 ?auto_439626 ) ) ( not ( = ?auto_439621 ?auto_439627 ) ) ( not ( = ?auto_439621 ?auto_439628 ) ) ( not ( = ?auto_439622 ?auto_439623 ) ) ( not ( = ?auto_439622 ?auto_439624 ) ) ( not ( = ?auto_439622 ?auto_439625 ) ) ( not ( = ?auto_439622 ?auto_439626 ) ) ( not ( = ?auto_439622 ?auto_439627 ) ) ( not ( = ?auto_439622 ?auto_439628 ) ) ( not ( = ?auto_439623 ?auto_439624 ) ) ( not ( = ?auto_439623 ?auto_439625 ) ) ( not ( = ?auto_439623 ?auto_439626 ) ) ( not ( = ?auto_439623 ?auto_439627 ) ) ( not ( = ?auto_439623 ?auto_439628 ) ) ( not ( = ?auto_439624 ?auto_439625 ) ) ( not ( = ?auto_439624 ?auto_439626 ) ) ( not ( = ?auto_439624 ?auto_439627 ) ) ( not ( = ?auto_439624 ?auto_439628 ) ) ( not ( = ?auto_439625 ?auto_439626 ) ) ( not ( = ?auto_439625 ?auto_439627 ) ) ( not ( = ?auto_439625 ?auto_439628 ) ) ( not ( = ?auto_439626 ?auto_439627 ) ) ( not ( = ?auto_439626 ?auto_439628 ) ) ( not ( = ?auto_439627 ?auto_439628 ) ) ( ON ?auto_439626 ?auto_439627 ) ( ON ?auto_439625 ?auto_439626 ) ( ON ?auto_439624 ?auto_439625 ) ( CLEAR ?auto_439622 ) ( ON ?auto_439623 ?auto_439624 ) ( CLEAR ?auto_439623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_439620 ?auto_439621 ?auto_439622 ?auto_439623 )
      ( MAKE-8PILE ?auto_439620 ?auto_439621 ?auto_439622 ?auto_439623 ?auto_439624 ?auto_439625 ?auto_439626 ?auto_439627 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439654 - BLOCK
      ?auto_439655 - BLOCK
      ?auto_439656 - BLOCK
      ?auto_439657 - BLOCK
      ?auto_439658 - BLOCK
      ?auto_439659 - BLOCK
      ?auto_439660 - BLOCK
      ?auto_439661 - BLOCK
    )
    :vars
    (
      ?auto_439662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439661 ?auto_439662 ) ( ON-TABLE ?auto_439654 ) ( ON ?auto_439655 ?auto_439654 ) ( not ( = ?auto_439654 ?auto_439655 ) ) ( not ( = ?auto_439654 ?auto_439656 ) ) ( not ( = ?auto_439654 ?auto_439657 ) ) ( not ( = ?auto_439654 ?auto_439658 ) ) ( not ( = ?auto_439654 ?auto_439659 ) ) ( not ( = ?auto_439654 ?auto_439660 ) ) ( not ( = ?auto_439654 ?auto_439661 ) ) ( not ( = ?auto_439654 ?auto_439662 ) ) ( not ( = ?auto_439655 ?auto_439656 ) ) ( not ( = ?auto_439655 ?auto_439657 ) ) ( not ( = ?auto_439655 ?auto_439658 ) ) ( not ( = ?auto_439655 ?auto_439659 ) ) ( not ( = ?auto_439655 ?auto_439660 ) ) ( not ( = ?auto_439655 ?auto_439661 ) ) ( not ( = ?auto_439655 ?auto_439662 ) ) ( not ( = ?auto_439656 ?auto_439657 ) ) ( not ( = ?auto_439656 ?auto_439658 ) ) ( not ( = ?auto_439656 ?auto_439659 ) ) ( not ( = ?auto_439656 ?auto_439660 ) ) ( not ( = ?auto_439656 ?auto_439661 ) ) ( not ( = ?auto_439656 ?auto_439662 ) ) ( not ( = ?auto_439657 ?auto_439658 ) ) ( not ( = ?auto_439657 ?auto_439659 ) ) ( not ( = ?auto_439657 ?auto_439660 ) ) ( not ( = ?auto_439657 ?auto_439661 ) ) ( not ( = ?auto_439657 ?auto_439662 ) ) ( not ( = ?auto_439658 ?auto_439659 ) ) ( not ( = ?auto_439658 ?auto_439660 ) ) ( not ( = ?auto_439658 ?auto_439661 ) ) ( not ( = ?auto_439658 ?auto_439662 ) ) ( not ( = ?auto_439659 ?auto_439660 ) ) ( not ( = ?auto_439659 ?auto_439661 ) ) ( not ( = ?auto_439659 ?auto_439662 ) ) ( not ( = ?auto_439660 ?auto_439661 ) ) ( not ( = ?auto_439660 ?auto_439662 ) ) ( not ( = ?auto_439661 ?auto_439662 ) ) ( ON ?auto_439660 ?auto_439661 ) ( ON ?auto_439659 ?auto_439660 ) ( ON ?auto_439658 ?auto_439659 ) ( ON ?auto_439657 ?auto_439658 ) ( CLEAR ?auto_439655 ) ( ON ?auto_439656 ?auto_439657 ) ( CLEAR ?auto_439656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_439654 ?auto_439655 ?auto_439656 )
      ( MAKE-8PILE ?auto_439654 ?auto_439655 ?auto_439656 ?auto_439657 ?auto_439658 ?auto_439659 ?auto_439660 ?auto_439661 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439688 - BLOCK
      ?auto_439689 - BLOCK
      ?auto_439690 - BLOCK
      ?auto_439691 - BLOCK
      ?auto_439692 - BLOCK
      ?auto_439693 - BLOCK
      ?auto_439694 - BLOCK
      ?auto_439695 - BLOCK
    )
    :vars
    (
      ?auto_439696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439695 ?auto_439696 ) ( ON-TABLE ?auto_439688 ) ( not ( = ?auto_439688 ?auto_439689 ) ) ( not ( = ?auto_439688 ?auto_439690 ) ) ( not ( = ?auto_439688 ?auto_439691 ) ) ( not ( = ?auto_439688 ?auto_439692 ) ) ( not ( = ?auto_439688 ?auto_439693 ) ) ( not ( = ?auto_439688 ?auto_439694 ) ) ( not ( = ?auto_439688 ?auto_439695 ) ) ( not ( = ?auto_439688 ?auto_439696 ) ) ( not ( = ?auto_439689 ?auto_439690 ) ) ( not ( = ?auto_439689 ?auto_439691 ) ) ( not ( = ?auto_439689 ?auto_439692 ) ) ( not ( = ?auto_439689 ?auto_439693 ) ) ( not ( = ?auto_439689 ?auto_439694 ) ) ( not ( = ?auto_439689 ?auto_439695 ) ) ( not ( = ?auto_439689 ?auto_439696 ) ) ( not ( = ?auto_439690 ?auto_439691 ) ) ( not ( = ?auto_439690 ?auto_439692 ) ) ( not ( = ?auto_439690 ?auto_439693 ) ) ( not ( = ?auto_439690 ?auto_439694 ) ) ( not ( = ?auto_439690 ?auto_439695 ) ) ( not ( = ?auto_439690 ?auto_439696 ) ) ( not ( = ?auto_439691 ?auto_439692 ) ) ( not ( = ?auto_439691 ?auto_439693 ) ) ( not ( = ?auto_439691 ?auto_439694 ) ) ( not ( = ?auto_439691 ?auto_439695 ) ) ( not ( = ?auto_439691 ?auto_439696 ) ) ( not ( = ?auto_439692 ?auto_439693 ) ) ( not ( = ?auto_439692 ?auto_439694 ) ) ( not ( = ?auto_439692 ?auto_439695 ) ) ( not ( = ?auto_439692 ?auto_439696 ) ) ( not ( = ?auto_439693 ?auto_439694 ) ) ( not ( = ?auto_439693 ?auto_439695 ) ) ( not ( = ?auto_439693 ?auto_439696 ) ) ( not ( = ?auto_439694 ?auto_439695 ) ) ( not ( = ?auto_439694 ?auto_439696 ) ) ( not ( = ?auto_439695 ?auto_439696 ) ) ( ON ?auto_439694 ?auto_439695 ) ( ON ?auto_439693 ?auto_439694 ) ( ON ?auto_439692 ?auto_439693 ) ( ON ?auto_439691 ?auto_439692 ) ( ON ?auto_439690 ?auto_439691 ) ( CLEAR ?auto_439688 ) ( ON ?auto_439689 ?auto_439690 ) ( CLEAR ?auto_439689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_439688 ?auto_439689 )
      ( MAKE-8PILE ?auto_439688 ?auto_439689 ?auto_439690 ?auto_439691 ?auto_439692 ?auto_439693 ?auto_439694 ?auto_439695 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_439722 - BLOCK
      ?auto_439723 - BLOCK
      ?auto_439724 - BLOCK
      ?auto_439725 - BLOCK
      ?auto_439726 - BLOCK
      ?auto_439727 - BLOCK
      ?auto_439728 - BLOCK
      ?auto_439729 - BLOCK
    )
    :vars
    (
      ?auto_439730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439729 ?auto_439730 ) ( not ( = ?auto_439722 ?auto_439723 ) ) ( not ( = ?auto_439722 ?auto_439724 ) ) ( not ( = ?auto_439722 ?auto_439725 ) ) ( not ( = ?auto_439722 ?auto_439726 ) ) ( not ( = ?auto_439722 ?auto_439727 ) ) ( not ( = ?auto_439722 ?auto_439728 ) ) ( not ( = ?auto_439722 ?auto_439729 ) ) ( not ( = ?auto_439722 ?auto_439730 ) ) ( not ( = ?auto_439723 ?auto_439724 ) ) ( not ( = ?auto_439723 ?auto_439725 ) ) ( not ( = ?auto_439723 ?auto_439726 ) ) ( not ( = ?auto_439723 ?auto_439727 ) ) ( not ( = ?auto_439723 ?auto_439728 ) ) ( not ( = ?auto_439723 ?auto_439729 ) ) ( not ( = ?auto_439723 ?auto_439730 ) ) ( not ( = ?auto_439724 ?auto_439725 ) ) ( not ( = ?auto_439724 ?auto_439726 ) ) ( not ( = ?auto_439724 ?auto_439727 ) ) ( not ( = ?auto_439724 ?auto_439728 ) ) ( not ( = ?auto_439724 ?auto_439729 ) ) ( not ( = ?auto_439724 ?auto_439730 ) ) ( not ( = ?auto_439725 ?auto_439726 ) ) ( not ( = ?auto_439725 ?auto_439727 ) ) ( not ( = ?auto_439725 ?auto_439728 ) ) ( not ( = ?auto_439725 ?auto_439729 ) ) ( not ( = ?auto_439725 ?auto_439730 ) ) ( not ( = ?auto_439726 ?auto_439727 ) ) ( not ( = ?auto_439726 ?auto_439728 ) ) ( not ( = ?auto_439726 ?auto_439729 ) ) ( not ( = ?auto_439726 ?auto_439730 ) ) ( not ( = ?auto_439727 ?auto_439728 ) ) ( not ( = ?auto_439727 ?auto_439729 ) ) ( not ( = ?auto_439727 ?auto_439730 ) ) ( not ( = ?auto_439728 ?auto_439729 ) ) ( not ( = ?auto_439728 ?auto_439730 ) ) ( not ( = ?auto_439729 ?auto_439730 ) ) ( ON ?auto_439728 ?auto_439729 ) ( ON ?auto_439727 ?auto_439728 ) ( ON ?auto_439726 ?auto_439727 ) ( ON ?auto_439725 ?auto_439726 ) ( ON ?auto_439724 ?auto_439725 ) ( ON ?auto_439723 ?auto_439724 ) ( ON ?auto_439722 ?auto_439723 ) ( CLEAR ?auto_439722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_439722 )
      ( MAKE-8PILE ?auto_439722 ?auto_439723 ?auto_439724 ?auto_439725 ?auto_439726 ?auto_439727 ?auto_439728 ?auto_439729 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439757 - BLOCK
      ?auto_439758 - BLOCK
      ?auto_439759 - BLOCK
      ?auto_439760 - BLOCK
      ?auto_439761 - BLOCK
      ?auto_439762 - BLOCK
      ?auto_439763 - BLOCK
      ?auto_439764 - BLOCK
      ?auto_439765 - BLOCK
    )
    :vars
    (
      ?auto_439766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_439764 ) ( ON ?auto_439765 ?auto_439766 ) ( CLEAR ?auto_439765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_439757 ) ( ON ?auto_439758 ?auto_439757 ) ( ON ?auto_439759 ?auto_439758 ) ( ON ?auto_439760 ?auto_439759 ) ( ON ?auto_439761 ?auto_439760 ) ( ON ?auto_439762 ?auto_439761 ) ( ON ?auto_439763 ?auto_439762 ) ( ON ?auto_439764 ?auto_439763 ) ( not ( = ?auto_439757 ?auto_439758 ) ) ( not ( = ?auto_439757 ?auto_439759 ) ) ( not ( = ?auto_439757 ?auto_439760 ) ) ( not ( = ?auto_439757 ?auto_439761 ) ) ( not ( = ?auto_439757 ?auto_439762 ) ) ( not ( = ?auto_439757 ?auto_439763 ) ) ( not ( = ?auto_439757 ?auto_439764 ) ) ( not ( = ?auto_439757 ?auto_439765 ) ) ( not ( = ?auto_439757 ?auto_439766 ) ) ( not ( = ?auto_439758 ?auto_439759 ) ) ( not ( = ?auto_439758 ?auto_439760 ) ) ( not ( = ?auto_439758 ?auto_439761 ) ) ( not ( = ?auto_439758 ?auto_439762 ) ) ( not ( = ?auto_439758 ?auto_439763 ) ) ( not ( = ?auto_439758 ?auto_439764 ) ) ( not ( = ?auto_439758 ?auto_439765 ) ) ( not ( = ?auto_439758 ?auto_439766 ) ) ( not ( = ?auto_439759 ?auto_439760 ) ) ( not ( = ?auto_439759 ?auto_439761 ) ) ( not ( = ?auto_439759 ?auto_439762 ) ) ( not ( = ?auto_439759 ?auto_439763 ) ) ( not ( = ?auto_439759 ?auto_439764 ) ) ( not ( = ?auto_439759 ?auto_439765 ) ) ( not ( = ?auto_439759 ?auto_439766 ) ) ( not ( = ?auto_439760 ?auto_439761 ) ) ( not ( = ?auto_439760 ?auto_439762 ) ) ( not ( = ?auto_439760 ?auto_439763 ) ) ( not ( = ?auto_439760 ?auto_439764 ) ) ( not ( = ?auto_439760 ?auto_439765 ) ) ( not ( = ?auto_439760 ?auto_439766 ) ) ( not ( = ?auto_439761 ?auto_439762 ) ) ( not ( = ?auto_439761 ?auto_439763 ) ) ( not ( = ?auto_439761 ?auto_439764 ) ) ( not ( = ?auto_439761 ?auto_439765 ) ) ( not ( = ?auto_439761 ?auto_439766 ) ) ( not ( = ?auto_439762 ?auto_439763 ) ) ( not ( = ?auto_439762 ?auto_439764 ) ) ( not ( = ?auto_439762 ?auto_439765 ) ) ( not ( = ?auto_439762 ?auto_439766 ) ) ( not ( = ?auto_439763 ?auto_439764 ) ) ( not ( = ?auto_439763 ?auto_439765 ) ) ( not ( = ?auto_439763 ?auto_439766 ) ) ( not ( = ?auto_439764 ?auto_439765 ) ) ( not ( = ?auto_439764 ?auto_439766 ) ) ( not ( = ?auto_439765 ?auto_439766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439765 ?auto_439766 )
      ( !STACK ?auto_439765 ?auto_439764 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439795 - BLOCK
      ?auto_439796 - BLOCK
      ?auto_439797 - BLOCK
      ?auto_439798 - BLOCK
      ?auto_439799 - BLOCK
      ?auto_439800 - BLOCK
      ?auto_439801 - BLOCK
      ?auto_439802 - BLOCK
      ?auto_439803 - BLOCK
    )
    :vars
    (
      ?auto_439804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439803 ?auto_439804 ) ( ON-TABLE ?auto_439795 ) ( ON ?auto_439796 ?auto_439795 ) ( ON ?auto_439797 ?auto_439796 ) ( ON ?auto_439798 ?auto_439797 ) ( ON ?auto_439799 ?auto_439798 ) ( ON ?auto_439800 ?auto_439799 ) ( ON ?auto_439801 ?auto_439800 ) ( not ( = ?auto_439795 ?auto_439796 ) ) ( not ( = ?auto_439795 ?auto_439797 ) ) ( not ( = ?auto_439795 ?auto_439798 ) ) ( not ( = ?auto_439795 ?auto_439799 ) ) ( not ( = ?auto_439795 ?auto_439800 ) ) ( not ( = ?auto_439795 ?auto_439801 ) ) ( not ( = ?auto_439795 ?auto_439802 ) ) ( not ( = ?auto_439795 ?auto_439803 ) ) ( not ( = ?auto_439795 ?auto_439804 ) ) ( not ( = ?auto_439796 ?auto_439797 ) ) ( not ( = ?auto_439796 ?auto_439798 ) ) ( not ( = ?auto_439796 ?auto_439799 ) ) ( not ( = ?auto_439796 ?auto_439800 ) ) ( not ( = ?auto_439796 ?auto_439801 ) ) ( not ( = ?auto_439796 ?auto_439802 ) ) ( not ( = ?auto_439796 ?auto_439803 ) ) ( not ( = ?auto_439796 ?auto_439804 ) ) ( not ( = ?auto_439797 ?auto_439798 ) ) ( not ( = ?auto_439797 ?auto_439799 ) ) ( not ( = ?auto_439797 ?auto_439800 ) ) ( not ( = ?auto_439797 ?auto_439801 ) ) ( not ( = ?auto_439797 ?auto_439802 ) ) ( not ( = ?auto_439797 ?auto_439803 ) ) ( not ( = ?auto_439797 ?auto_439804 ) ) ( not ( = ?auto_439798 ?auto_439799 ) ) ( not ( = ?auto_439798 ?auto_439800 ) ) ( not ( = ?auto_439798 ?auto_439801 ) ) ( not ( = ?auto_439798 ?auto_439802 ) ) ( not ( = ?auto_439798 ?auto_439803 ) ) ( not ( = ?auto_439798 ?auto_439804 ) ) ( not ( = ?auto_439799 ?auto_439800 ) ) ( not ( = ?auto_439799 ?auto_439801 ) ) ( not ( = ?auto_439799 ?auto_439802 ) ) ( not ( = ?auto_439799 ?auto_439803 ) ) ( not ( = ?auto_439799 ?auto_439804 ) ) ( not ( = ?auto_439800 ?auto_439801 ) ) ( not ( = ?auto_439800 ?auto_439802 ) ) ( not ( = ?auto_439800 ?auto_439803 ) ) ( not ( = ?auto_439800 ?auto_439804 ) ) ( not ( = ?auto_439801 ?auto_439802 ) ) ( not ( = ?auto_439801 ?auto_439803 ) ) ( not ( = ?auto_439801 ?auto_439804 ) ) ( not ( = ?auto_439802 ?auto_439803 ) ) ( not ( = ?auto_439802 ?auto_439804 ) ) ( not ( = ?auto_439803 ?auto_439804 ) ) ( CLEAR ?auto_439801 ) ( ON ?auto_439802 ?auto_439803 ) ( CLEAR ?auto_439802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_439795 ?auto_439796 ?auto_439797 ?auto_439798 ?auto_439799 ?auto_439800 ?auto_439801 ?auto_439802 )
      ( MAKE-9PILE ?auto_439795 ?auto_439796 ?auto_439797 ?auto_439798 ?auto_439799 ?auto_439800 ?auto_439801 ?auto_439802 ?auto_439803 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439833 - BLOCK
      ?auto_439834 - BLOCK
      ?auto_439835 - BLOCK
      ?auto_439836 - BLOCK
      ?auto_439837 - BLOCK
      ?auto_439838 - BLOCK
      ?auto_439839 - BLOCK
      ?auto_439840 - BLOCK
      ?auto_439841 - BLOCK
    )
    :vars
    (
      ?auto_439842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439841 ?auto_439842 ) ( ON-TABLE ?auto_439833 ) ( ON ?auto_439834 ?auto_439833 ) ( ON ?auto_439835 ?auto_439834 ) ( ON ?auto_439836 ?auto_439835 ) ( ON ?auto_439837 ?auto_439836 ) ( ON ?auto_439838 ?auto_439837 ) ( not ( = ?auto_439833 ?auto_439834 ) ) ( not ( = ?auto_439833 ?auto_439835 ) ) ( not ( = ?auto_439833 ?auto_439836 ) ) ( not ( = ?auto_439833 ?auto_439837 ) ) ( not ( = ?auto_439833 ?auto_439838 ) ) ( not ( = ?auto_439833 ?auto_439839 ) ) ( not ( = ?auto_439833 ?auto_439840 ) ) ( not ( = ?auto_439833 ?auto_439841 ) ) ( not ( = ?auto_439833 ?auto_439842 ) ) ( not ( = ?auto_439834 ?auto_439835 ) ) ( not ( = ?auto_439834 ?auto_439836 ) ) ( not ( = ?auto_439834 ?auto_439837 ) ) ( not ( = ?auto_439834 ?auto_439838 ) ) ( not ( = ?auto_439834 ?auto_439839 ) ) ( not ( = ?auto_439834 ?auto_439840 ) ) ( not ( = ?auto_439834 ?auto_439841 ) ) ( not ( = ?auto_439834 ?auto_439842 ) ) ( not ( = ?auto_439835 ?auto_439836 ) ) ( not ( = ?auto_439835 ?auto_439837 ) ) ( not ( = ?auto_439835 ?auto_439838 ) ) ( not ( = ?auto_439835 ?auto_439839 ) ) ( not ( = ?auto_439835 ?auto_439840 ) ) ( not ( = ?auto_439835 ?auto_439841 ) ) ( not ( = ?auto_439835 ?auto_439842 ) ) ( not ( = ?auto_439836 ?auto_439837 ) ) ( not ( = ?auto_439836 ?auto_439838 ) ) ( not ( = ?auto_439836 ?auto_439839 ) ) ( not ( = ?auto_439836 ?auto_439840 ) ) ( not ( = ?auto_439836 ?auto_439841 ) ) ( not ( = ?auto_439836 ?auto_439842 ) ) ( not ( = ?auto_439837 ?auto_439838 ) ) ( not ( = ?auto_439837 ?auto_439839 ) ) ( not ( = ?auto_439837 ?auto_439840 ) ) ( not ( = ?auto_439837 ?auto_439841 ) ) ( not ( = ?auto_439837 ?auto_439842 ) ) ( not ( = ?auto_439838 ?auto_439839 ) ) ( not ( = ?auto_439838 ?auto_439840 ) ) ( not ( = ?auto_439838 ?auto_439841 ) ) ( not ( = ?auto_439838 ?auto_439842 ) ) ( not ( = ?auto_439839 ?auto_439840 ) ) ( not ( = ?auto_439839 ?auto_439841 ) ) ( not ( = ?auto_439839 ?auto_439842 ) ) ( not ( = ?auto_439840 ?auto_439841 ) ) ( not ( = ?auto_439840 ?auto_439842 ) ) ( not ( = ?auto_439841 ?auto_439842 ) ) ( ON ?auto_439840 ?auto_439841 ) ( CLEAR ?auto_439838 ) ( ON ?auto_439839 ?auto_439840 ) ( CLEAR ?auto_439839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_439833 ?auto_439834 ?auto_439835 ?auto_439836 ?auto_439837 ?auto_439838 ?auto_439839 )
      ( MAKE-9PILE ?auto_439833 ?auto_439834 ?auto_439835 ?auto_439836 ?auto_439837 ?auto_439838 ?auto_439839 ?auto_439840 ?auto_439841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439871 - BLOCK
      ?auto_439872 - BLOCK
      ?auto_439873 - BLOCK
      ?auto_439874 - BLOCK
      ?auto_439875 - BLOCK
      ?auto_439876 - BLOCK
      ?auto_439877 - BLOCK
      ?auto_439878 - BLOCK
      ?auto_439879 - BLOCK
    )
    :vars
    (
      ?auto_439880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439879 ?auto_439880 ) ( ON-TABLE ?auto_439871 ) ( ON ?auto_439872 ?auto_439871 ) ( ON ?auto_439873 ?auto_439872 ) ( ON ?auto_439874 ?auto_439873 ) ( ON ?auto_439875 ?auto_439874 ) ( not ( = ?auto_439871 ?auto_439872 ) ) ( not ( = ?auto_439871 ?auto_439873 ) ) ( not ( = ?auto_439871 ?auto_439874 ) ) ( not ( = ?auto_439871 ?auto_439875 ) ) ( not ( = ?auto_439871 ?auto_439876 ) ) ( not ( = ?auto_439871 ?auto_439877 ) ) ( not ( = ?auto_439871 ?auto_439878 ) ) ( not ( = ?auto_439871 ?auto_439879 ) ) ( not ( = ?auto_439871 ?auto_439880 ) ) ( not ( = ?auto_439872 ?auto_439873 ) ) ( not ( = ?auto_439872 ?auto_439874 ) ) ( not ( = ?auto_439872 ?auto_439875 ) ) ( not ( = ?auto_439872 ?auto_439876 ) ) ( not ( = ?auto_439872 ?auto_439877 ) ) ( not ( = ?auto_439872 ?auto_439878 ) ) ( not ( = ?auto_439872 ?auto_439879 ) ) ( not ( = ?auto_439872 ?auto_439880 ) ) ( not ( = ?auto_439873 ?auto_439874 ) ) ( not ( = ?auto_439873 ?auto_439875 ) ) ( not ( = ?auto_439873 ?auto_439876 ) ) ( not ( = ?auto_439873 ?auto_439877 ) ) ( not ( = ?auto_439873 ?auto_439878 ) ) ( not ( = ?auto_439873 ?auto_439879 ) ) ( not ( = ?auto_439873 ?auto_439880 ) ) ( not ( = ?auto_439874 ?auto_439875 ) ) ( not ( = ?auto_439874 ?auto_439876 ) ) ( not ( = ?auto_439874 ?auto_439877 ) ) ( not ( = ?auto_439874 ?auto_439878 ) ) ( not ( = ?auto_439874 ?auto_439879 ) ) ( not ( = ?auto_439874 ?auto_439880 ) ) ( not ( = ?auto_439875 ?auto_439876 ) ) ( not ( = ?auto_439875 ?auto_439877 ) ) ( not ( = ?auto_439875 ?auto_439878 ) ) ( not ( = ?auto_439875 ?auto_439879 ) ) ( not ( = ?auto_439875 ?auto_439880 ) ) ( not ( = ?auto_439876 ?auto_439877 ) ) ( not ( = ?auto_439876 ?auto_439878 ) ) ( not ( = ?auto_439876 ?auto_439879 ) ) ( not ( = ?auto_439876 ?auto_439880 ) ) ( not ( = ?auto_439877 ?auto_439878 ) ) ( not ( = ?auto_439877 ?auto_439879 ) ) ( not ( = ?auto_439877 ?auto_439880 ) ) ( not ( = ?auto_439878 ?auto_439879 ) ) ( not ( = ?auto_439878 ?auto_439880 ) ) ( not ( = ?auto_439879 ?auto_439880 ) ) ( ON ?auto_439878 ?auto_439879 ) ( ON ?auto_439877 ?auto_439878 ) ( CLEAR ?auto_439875 ) ( ON ?auto_439876 ?auto_439877 ) ( CLEAR ?auto_439876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_439871 ?auto_439872 ?auto_439873 ?auto_439874 ?auto_439875 ?auto_439876 )
      ( MAKE-9PILE ?auto_439871 ?auto_439872 ?auto_439873 ?auto_439874 ?auto_439875 ?auto_439876 ?auto_439877 ?auto_439878 ?auto_439879 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439909 - BLOCK
      ?auto_439910 - BLOCK
      ?auto_439911 - BLOCK
      ?auto_439912 - BLOCK
      ?auto_439913 - BLOCK
      ?auto_439914 - BLOCK
      ?auto_439915 - BLOCK
      ?auto_439916 - BLOCK
      ?auto_439917 - BLOCK
    )
    :vars
    (
      ?auto_439918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439917 ?auto_439918 ) ( ON-TABLE ?auto_439909 ) ( ON ?auto_439910 ?auto_439909 ) ( ON ?auto_439911 ?auto_439910 ) ( ON ?auto_439912 ?auto_439911 ) ( not ( = ?auto_439909 ?auto_439910 ) ) ( not ( = ?auto_439909 ?auto_439911 ) ) ( not ( = ?auto_439909 ?auto_439912 ) ) ( not ( = ?auto_439909 ?auto_439913 ) ) ( not ( = ?auto_439909 ?auto_439914 ) ) ( not ( = ?auto_439909 ?auto_439915 ) ) ( not ( = ?auto_439909 ?auto_439916 ) ) ( not ( = ?auto_439909 ?auto_439917 ) ) ( not ( = ?auto_439909 ?auto_439918 ) ) ( not ( = ?auto_439910 ?auto_439911 ) ) ( not ( = ?auto_439910 ?auto_439912 ) ) ( not ( = ?auto_439910 ?auto_439913 ) ) ( not ( = ?auto_439910 ?auto_439914 ) ) ( not ( = ?auto_439910 ?auto_439915 ) ) ( not ( = ?auto_439910 ?auto_439916 ) ) ( not ( = ?auto_439910 ?auto_439917 ) ) ( not ( = ?auto_439910 ?auto_439918 ) ) ( not ( = ?auto_439911 ?auto_439912 ) ) ( not ( = ?auto_439911 ?auto_439913 ) ) ( not ( = ?auto_439911 ?auto_439914 ) ) ( not ( = ?auto_439911 ?auto_439915 ) ) ( not ( = ?auto_439911 ?auto_439916 ) ) ( not ( = ?auto_439911 ?auto_439917 ) ) ( not ( = ?auto_439911 ?auto_439918 ) ) ( not ( = ?auto_439912 ?auto_439913 ) ) ( not ( = ?auto_439912 ?auto_439914 ) ) ( not ( = ?auto_439912 ?auto_439915 ) ) ( not ( = ?auto_439912 ?auto_439916 ) ) ( not ( = ?auto_439912 ?auto_439917 ) ) ( not ( = ?auto_439912 ?auto_439918 ) ) ( not ( = ?auto_439913 ?auto_439914 ) ) ( not ( = ?auto_439913 ?auto_439915 ) ) ( not ( = ?auto_439913 ?auto_439916 ) ) ( not ( = ?auto_439913 ?auto_439917 ) ) ( not ( = ?auto_439913 ?auto_439918 ) ) ( not ( = ?auto_439914 ?auto_439915 ) ) ( not ( = ?auto_439914 ?auto_439916 ) ) ( not ( = ?auto_439914 ?auto_439917 ) ) ( not ( = ?auto_439914 ?auto_439918 ) ) ( not ( = ?auto_439915 ?auto_439916 ) ) ( not ( = ?auto_439915 ?auto_439917 ) ) ( not ( = ?auto_439915 ?auto_439918 ) ) ( not ( = ?auto_439916 ?auto_439917 ) ) ( not ( = ?auto_439916 ?auto_439918 ) ) ( not ( = ?auto_439917 ?auto_439918 ) ) ( ON ?auto_439916 ?auto_439917 ) ( ON ?auto_439915 ?auto_439916 ) ( ON ?auto_439914 ?auto_439915 ) ( CLEAR ?auto_439912 ) ( ON ?auto_439913 ?auto_439914 ) ( CLEAR ?auto_439913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_439909 ?auto_439910 ?auto_439911 ?auto_439912 ?auto_439913 )
      ( MAKE-9PILE ?auto_439909 ?auto_439910 ?auto_439911 ?auto_439912 ?auto_439913 ?auto_439914 ?auto_439915 ?auto_439916 ?auto_439917 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439947 - BLOCK
      ?auto_439948 - BLOCK
      ?auto_439949 - BLOCK
      ?auto_439950 - BLOCK
      ?auto_439951 - BLOCK
      ?auto_439952 - BLOCK
      ?auto_439953 - BLOCK
      ?auto_439954 - BLOCK
      ?auto_439955 - BLOCK
    )
    :vars
    (
      ?auto_439956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439955 ?auto_439956 ) ( ON-TABLE ?auto_439947 ) ( ON ?auto_439948 ?auto_439947 ) ( ON ?auto_439949 ?auto_439948 ) ( not ( = ?auto_439947 ?auto_439948 ) ) ( not ( = ?auto_439947 ?auto_439949 ) ) ( not ( = ?auto_439947 ?auto_439950 ) ) ( not ( = ?auto_439947 ?auto_439951 ) ) ( not ( = ?auto_439947 ?auto_439952 ) ) ( not ( = ?auto_439947 ?auto_439953 ) ) ( not ( = ?auto_439947 ?auto_439954 ) ) ( not ( = ?auto_439947 ?auto_439955 ) ) ( not ( = ?auto_439947 ?auto_439956 ) ) ( not ( = ?auto_439948 ?auto_439949 ) ) ( not ( = ?auto_439948 ?auto_439950 ) ) ( not ( = ?auto_439948 ?auto_439951 ) ) ( not ( = ?auto_439948 ?auto_439952 ) ) ( not ( = ?auto_439948 ?auto_439953 ) ) ( not ( = ?auto_439948 ?auto_439954 ) ) ( not ( = ?auto_439948 ?auto_439955 ) ) ( not ( = ?auto_439948 ?auto_439956 ) ) ( not ( = ?auto_439949 ?auto_439950 ) ) ( not ( = ?auto_439949 ?auto_439951 ) ) ( not ( = ?auto_439949 ?auto_439952 ) ) ( not ( = ?auto_439949 ?auto_439953 ) ) ( not ( = ?auto_439949 ?auto_439954 ) ) ( not ( = ?auto_439949 ?auto_439955 ) ) ( not ( = ?auto_439949 ?auto_439956 ) ) ( not ( = ?auto_439950 ?auto_439951 ) ) ( not ( = ?auto_439950 ?auto_439952 ) ) ( not ( = ?auto_439950 ?auto_439953 ) ) ( not ( = ?auto_439950 ?auto_439954 ) ) ( not ( = ?auto_439950 ?auto_439955 ) ) ( not ( = ?auto_439950 ?auto_439956 ) ) ( not ( = ?auto_439951 ?auto_439952 ) ) ( not ( = ?auto_439951 ?auto_439953 ) ) ( not ( = ?auto_439951 ?auto_439954 ) ) ( not ( = ?auto_439951 ?auto_439955 ) ) ( not ( = ?auto_439951 ?auto_439956 ) ) ( not ( = ?auto_439952 ?auto_439953 ) ) ( not ( = ?auto_439952 ?auto_439954 ) ) ( not ( = ?auto_439952 ?auto_439955 ) ) ( not ( = ?auto_439952 ?auto_439956 ) ) ( not ( = ?auto_439953 ?auto_439954 ) ) ( not ( = ?auto_439953 ?auto_439955 ) ) ( not ( = ?auto_439953 ?auto_439956 ) ) ( not ( = ?auto_439954 ?auto_439955 ) ) ( not ( = ?auto_439954 ?auto_439956 ) ) ( not ( = ?auto_439955 ?auto_439956 ) ) ( ON ?auto_439954 ?auto_439955 ) ( ON ?auto_439953 ?auto_439954 ) ( ON ?auto_439952 ?auto_439953 ) ( ON ?auto_439951 ?auto_439952 ) ( CLEAR ?auto_439949 ) ( ON ?auto_439950 ?auto_439951 ) ( CLEAR ?auto_439950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_439947 ?auto_439948 ?auto_439949 ?auto_439950 )
      ( MAKE-9PILE ?auto_439947 ?auto_439948 ?auto_439949 ?auto_439950 ?auto_439951 ?auto_439952 ?auto_439953 ?auto_439954 ?auto_439955 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_439985 - BLOCK
      ?auto_439986 - BLOCK
      ?auto_439987 - BLOCK
      ?auto_439988 - BLOCK
      ?auto_439989 - BLOCK
      ?auto_439990 - BLOCK
      ?auto_439991 - BLOCK
      ?auto_439992 - BLOCK
      ?auto_439993 - BLOCK
    )
    :vars
    (
      ?auto_439994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439993 ?auto_439994 ) ( ON-TABLE ?auto_439985 ) ( ON ?auto_439986 ?auto_439985 ) ( not ( = ?auto_439985 ?auto_439986 ) ) ( not ( = ?auto_439985 ?auto_439987 ) ) ( not ( = ?auto_439985 ?auto_439988 ) ) ( not ( = ?auto_439985 ?auto_439989 ) ) ( not ( = ?auto_439985 ?auto_439990 ) ) ( not ( = ?auto_439985 ?auto_439991 ) ) ( not ( = ?auto_439985 ?auto_439992 ) ) ( not ( = ?auto_439985 ?auto_439993 ) ) ( not ( = ?auto_439985 ?auto_439994 ) ) ( not ( = ?auto_439986 ?auto_439987 ) ) ( not ( = ?auto_439986 ?auto_439988 ) ) ( not ( = ?auto_439986 ?auto_439989 ) ) ( not ( = ?auto_439986 ?auto_439990 ) ) ( not ( = ?auto_439986 ?auto_439991 ) ) ( not ( = ?auto_439986 ?auto_439992 ) ) ( not ( = ?auto_439986 ?auto_439993 ) ) ( not ( = ?auto_439986 ?auto_439994 ) ) ( not ( = ?auto_439987 ?auto_439988 ) ) ( not ( = ?auto_439987 ?auto_439989 ) ) ( not ( = ?auto_439987 ?auto_439990 ) ) ( not ( = ?auto_439987 ?auto_439991 ) ) ( not ( = ?auto_439987 ?auto_439992 ) ) ( not ( = ?auto_439987 ?auto_439993 ) ) ( not ( = ?auto_439987 ?auto_439994 ) ) ( not ( = ?auto_439988 ?auto_439989 ) ) ( not ( = ?auto_439988 ?auto_439990 ) ) ( not ( = ?auto_439988 ?auto_439991 ) ) ( not ( = ?auto_439988 ?auto_439992 ) ) ( not ( = ?auto_439988 ?auto_439993 ) ) ( not ( = ?auto_439988 ?auto_439994 ) ) ( not ( = ?auto_439989 ?auto_439990 ) ) ( not ( = ?auto_439989 ?auto_439991 ) ) ( not ( = ?auto_439989 ?auto_439992 ) ) ( not ( = ?auto_439989 ?auto_439993 ) ) ( not ( = ?auto_439989 ?auto_439994 ) ) ( not ( = ?auto_439990 ?auto_439991 ) ) ( not ( = ?auto_439990 ?auto_439992 ) ) ( not ( = ?auto_439990 ?auto_439993 ) ) ( not ( = ?auto_439990 ?auto_439994 ) ) ( not ( = ?auto_439991 ?auto_439992 ) ) ( not ( = ?auto_439991 ?auto_439993 ) ) ( not ( = ?auto_439991 ?auto_439994 ) ) ( not ( = ?auto_439992 ?auto_439993 ) ) ( not ( = ?auto_439992 ?auto_439994 ) ) ( not ( = ?auto_439993 ?auto_439994 ) ) ( ON ?auto_439992 ?auto_439993 ) ( ON ?auto_439991 ?auto_439992 ) ( ON ?auto_439990 ?auto_439991 ) ( ON ?auto_439989 ?auto_439990 ) ( ON ?auto_439988 ?auto_439989 ) ( CLEAR ?auto_439986 ) ( ON ?auto_439987 ?auto_439988 ) ( CLEAR ?auto_439987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_439985 ?auto_439986 ?auto_439987 )
      ( MAKE-9PILE ?auto_439985 ?auto_439986 ?auto_439987 ?auto_439988 ?auto_439989 ?auto_439990 ?auto_439991 ?auto_439992 ?auto_439993 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_440023 - BLOCK
      ?auto_440024 - BLOCK
      ?auto_440025 - BLOCK
      ?auto_440026 - BLOCK
      ?auto_440027 - BLOCK
      ?auto_440028 - BLOCK
      ?auto_440029 - BLOCK
      ?auto_440030 - BLOCK
      ?auto_440031 - BLOCK
    )
    :vars
    (
      ?auto_440032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440031 ?auto_440032 ) ( ON-TABLE ?auto_440023 ) ( not ( = ?auto_440023 ?auto_440024 ) ) ( not ( = ?auto_440023 ?auto_440025 ) ) ( not ( = ?auto_440023 ?auto_440026 ) ) ( not ( = ?auto_440023 ?auto_440027 ) ) ( not ( = ?auto_440023 ?auto_440028 ) ) ( not ( = ?auto_440023 ?auto_440029 ) ) ( not ( = ?auto_440023 ?auto_440030 ) ) ( not ( = ?auto_440023 ?auto_440031 ) ) ( not ( = ?auto_440023 ?auto_440032 ) ) ( not ( = ?auto_440024 ?auto_440025 ) ) ( not ( = ?auto_440024 ?auto_440026 ) ) ( not ( = ?auto_440024 ?auto_440027 ) ) ( not ( = ?auto_440024 ?auto_440028 ) ) ( not ( = ?auto_440024 ?auto_440029 ) ) ( not ( = ?auto_440024 ?auto_440030 ) ) ( not ( = ?auto_440024 ?auto_440031 ) ) ( not ( = ?auto_440024 ?auto_440032 ) ) ( not ( = ?auto_440025 ?auto_440026 ) ) ( not ( = ?auto_440025 ?auto_440027 ) ) ( not ( = ?auto_440025 ?auto_440028 ) ) ( not ( = ?auto_440025 ?auto_440029 ) ) ( not ( = ?auto_440025 ?auto_440030 ) ) ( not ( = ?auto_440025 ?auto_440031 ) ) ( not ( = ?auto_440025 ?auto_440032 ) ) ( not ( = ?auto_440026 ?auto_440027 ) ) ( not ( = ?auto_440026 ?auto_440028 ) ) ( not ( = ?auto_440026 ?auto_440029 ) ) ( not ( = ?auto_440026 ?auto_440030 ) ) ( not ( = ?auto_440026 ?auto_440031 ) ) ( not ( = ?auto_440026 ?auto_440032 ) ) ( not ( = ?auto_440027 ?auto_440028 ) ) ( not ( = ?auto_440027 ?auto_440029 ) ) ( not ( = ?auto_440027 ?auto_440030 ) ) ( not ( = ?auto_440027 ?auto_440031 ) ) ( not ( = ?auto_440027 ?auto_440032 ) ) ( not ( = ?auto_440028 ?auto_440029 ) ) ( not ( = ?auto_440028 ?auto_440030 ) ) ( not ( = ?auto_440028 ?auto_440031 ) ) ( not ( = ?auto_440028 ?auto_440032 ) ) ( not ( = ?auto_440029 ?auto_440030 ) ) ( not ( = ?auto_440029 ?auto_440031 ) ) ( not ( = ?auto_440029 ?auto_440032 ) ) ( not ( = ?auto_440030 ?auto_440031 ) ) ( not ( = ?auto_440030 ?auto_440032 ) ) ( not ( = ?auto_440031 ?auto_440032 ) ) ( ON ?auto_440030 ?auto_440031 ) ( ON ?auto_440029 ?auto_440030 ) ( ON ?auto_440028 ?auto_440029 ) ( ON ?auto_440027 ?auto_440028 ) ( ON ?auto_440026 ?auto_440027 ) ( ON ?auto_440025 ?auto_440026 ) ( CLEAR ?auto_440023 ) ( ON ?auto_440024 ?auto_440025 ) ( CLEAR ?auto_440024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_440023 ?auto_440024 )
      ( MAKE-9PILE ?auto_440023 ?auto_440024 ?auto_440025 ?auto_440026 ?auto_440027 ?auto_440028 ?auto_440029 ?auto_440030 ?auto_440031 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_440061 - BLOCK
      ?auto_440062 - BLOCK
      ?auto_440063 - BLOCK
      ?auto_440064 - BLOCK
      ?auto_440065 - BLOCK
      ?auto_440066 - BLOCK
      ?auto_440067 - BLOCK
      ?auto_440068 - BLOCK
      ?auto_440069 - BLOCK
    )
    :vars
    (
      ?auto_440070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440069 ?auto_440070 ) ( not ( = ?auto_440061 ?auto_440062 ) ) ( not ( = ?auto_440061 ?auto_440063 ) ) ( not ( = ?auto_440061 ?auto_440064 ) ) ( not ( = ?auto_440061 ?auto_440065 ) ) ( not ( = ?auto_440061 ?auto_440066 ) ) ( not ( = ?auto_440061 ?auto_440067 ) ) ( not ( = ?auto_440061 ?auto_440068 ) ) ( not ( = ?auto_440061 ?auto_440069 ) ) ( not ( = ?auto_440061 ?auto_440070 ) ) ( not ( = ?auto_440062 ?auto_440063 ) ) ( not ( = ?auto_440062 ?auto_440064 ) ) ( not ( = ?auto_440062 ?auto_440065 ) ) ( not ( = ?auto_440062 ?auto_440066 ) ) ( not ( = ?auto_440062 ?auto_440067 ) ) ( not ( = ?auto_440062 ?auto_440068 ) ) ( not ( = ?auto_440062 ?auto_440069 ) ) ( not ( = ?auto_440062 ?auto_440070 ) ) ( not ( = ?auto_440063 ?auto_440064 ) ) ( not ( = ?auto_440063 ?auto_440065 ) ) ( not ( = ?auto_440063 ?auto_440066 ) ) ( not ( = ?auto_440063 ?auto_440067 ) ) ( not ( = ?auto_440063 ?auto_440068 ) ) ( not ( = ?auto_440063 ?auto_440069 ) ) ( not ( = ?auto_440063 ?auto_440070 ) ) ( not ( = ?auto_440064 ?auto_440065 ) ) ( not ( = ?auto_440064 ?auto_440066 ) ) ( not ( = ?auto_440064 ?auto_440067 ) ) ( not ( = ?auto_440064 ?auto_440068 ) ) ( not ( = ?auto_440064 ?auto_440069 ) ) ( not ( = ?auto_440064 ?auto_440070 ) ) ( not ( = ?auto_440065 ?auto_440066 ) ) ( not ( = ?auto_440065 ?auto_440067 ) ) ( not ( = ?auto_440065 ?auto_440068 ) ) ( not ( = ?auto_440065 ?auto_440069 ) ) ( not ( = ?auto_440065 ?auto_440070 ) ) ( not ( = ?auto_440066 ?auto_440067 ) ) ( not ( = ?auto_440066 ?auto_440068 ) ) ( not ( = ?auto_440066 ?auto_440069 ) ) ( not ( = ?auto_440066 ?auto_440070 ) ) ( not ( = ?auto_440067 ?auto_440068 ) ) ( not ( = ?auto_440067 ?auto_440069 ) ) ( not ( = ?auto_440067 ?auto_440070 ) ) ( not ( = ?auto_440068 ?auto_440069 ) ) ( not ( = ?auto_440068 ?auto_440070 ) ) ( not ( = ?auto_440069 ?auto_440070 ) ) ( ON ?auto_440068 ?auto_440069 ) ( ON ?auto_440067 ?auto_440068 ) ( ON ?auto_440066 ?auto_440067 ) ( ON ?auto_440065 ?auto_440066 ) ( ON ?auto_440064 ?auto_440065 ) ( ON ?auto_440063 ?auto_440064 ) ( ON ?auto_440062 ?auto_440063 ) ( ON ?auto_440061 ?auto_440062 ) ( CLEAR ?auto_440061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_440061 )
      ( MAKE-9PILE ?auto_440061 ?auto_440062 ?auto_440063 ?auto_440064 ?auto_440065 ?auto_440066 ?auto_440067 ?auto_440068 ?auto_440069 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440100 - BLOCK
      ?auto_440101 - BLOCK
      ?auto_440102 - BLOCK
      ?auto_440103 - BLOCK
      ?auto_440104 - BLOCK
      ?auto_440105 - BLOCK
      ?auto_440106 - BLOCK
      ?auto_440107 - BLOCK
      ?auto_440108 - BLOCK
      ?auto_440109 - BLOCK
    )
    :vars
    (
      ?auto_440110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_440108 ) ( ON ?auto_440109 ?auto_440110 ) ( CLEAR ?auto_440109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_440100 ) ( ON ?auto_440101 ?auto_440100 ) ( ON ?auto_440102 ?auto_440101 ) ( ON ?auto_440103 ?auto_440102 ) ( ON ?auto_440104 ?auto_440103 ) ( ON ?auto_440105 ?auto_440104 ) ( ON ?auto_440106 ?auto_440105 ) ( ON ?auto_440107 ?auto_440106 ) ( ON ?auto_440108 ?auto_440107 ) ( not ( = ?auto_440100 ?auto_440101 ) ) ( not ( = ?auto_440100 ?auto_440102 ) ) ( not ( = ?auto_440100 ?auto_440103 ) ) ( not ( = ?auto_440100 ?auto_440104 ) ) ( not ( = ?auto_440100 ?auto_440105 ) ) ( not ( = ?auto_440100 ?auto_440106 ) ) ( not ( = ?auto_440100 ?auto_440107 ) ) ( not ( = ?auto_440100 ?auto_440108 ) ) ( not ( = ?auto_440100 ?auto_440109 ) ) ( not ( = ?auto_440100 ?auto_440110 ) ) ( not ( = ?auto_440101 ?auto_440102 ) ) ( not ( = ?auto_440101 ?auto_440103 ) ) ( not ( = ?auto_440101 ?auto_440104 ) ) ( not ( = ?auto_440101 ?auto_440105 ) ) ( not ( = ?auto_440101 ?auto_440106 ) ) ( not ( = ?auto_440101 ?auto_440107 ) ) ( not ( = ?auto_440101 ?auto_440108 ) ) ( not ( = ?auto_440101 ?auto_440109 ) ) ( not ( = ?auto_440101 ?auto_440110 ) ) ( not ( = ?auto_440102 ?auto_440103 ) ) ( not ( = ?auto_440102 ?auto_440104 ) ) ( not ( = ?auto_440102 ?auto_440105 ) ) ( not ( = ?auto_440102 ?auto_440106 ) ) ( not ( = ?auto_440102 ?auto_440107 ) ) ( not ( = ?auto_440102 ?auto_440108 ) ) ( not ( = ?auto_440102 ?auto_440109 ) ) ( not ( = ?auto_440102 ?auto_440110 ) ) ( not ( = ?auto_440103 ?auto_440104 ) ) ( not ( = ?auto_440103 ?auto_440105 ) ) ( not ( = ?auto_440103 ?auto_440106 ) ) ( not ( = ?auto_440103 ?auto_440107 ) ) ( not ( = ?auto_440103 ?auto_440108 ) ) ( not ( = ?auto_440103 ?auto_440109 ) ) ( not ( = ?auto_440103 ?auto_440110 ) ) ( not ( = ?auto_440104 ?auto_440105 ) ) ( not ( = ?auto_440104 ?auto_440106 ) ) ( not ( = ?auto_440104 ?auto_440107 ) ) ( not ( = ?auto_440104 ?auto_440108 ) ) ( not ( = ?auto_440104 ?auto_440109 ) ) ( not ( = ?auto_440104 ?auto_440110 ) ) ( not ( = ?auto_440105 ?auto_440106 ) ) ( not ( = ?auto_440105 ?auto_440107 ) ) ( not ( = ?auto_440105 ?auto_440108 ) ) ( not ( = ?auto_440105 ?auto_440109 ) ) ( not ( = ?auto_440105 ?auto_440110 ) ) ( not ( = ?auto_440106 ?auto_440107 ) ) ( not ( = ?auto_440106 ?auto_440108 ) ) ( not ( = ?auto_440106 ?auto_440109 ) ) ( not ( = ?auto_440106 ?auto_440110 ) ) ( not ( = ?auto_440107 ?auto_440108 ) ) ( not ( = ?auto_440107 ?auto_440109 ) ) ( not ( = ?auto_440107 ?auto_440110 ) ) ( not ( = ?auto_440108 ?auto_440109 ) ) ( not ( = ?auto_440108 ?auto_440110 ) ) ( not ( = ?auto_440109 ?auto_440110 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_440109 ?auto_440110 )
      ( !STACK ?auto_440109 ?auto_440108 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440142 - BLOCK
      ?auto_440143 - BLOCK
      ?auto_440144 - BLOCK
      ?auto_440145 - BLOCK
      ?auto_440146 - BLOCK
      ?auto_440147 - BLOCK
      ?auto_440148 - BLOCK
      ?auto_440149 - BLOCK
      ?auto_440150 - BLOCK
      ?auto_440151 - BLOCK
    )
    :vars
    (
      ?auto_440152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440151 ?auto_440152 ) ( ON-TABLE ?auto_440142 ) ( ON ?auto_440143 ?auto_440142 ) ( ON ?auto_440144 ?auto_440143 ) ( ON ?auto_440145 ?auto_440144 ) ( ON ?auto_440146 ?auto_440145 ) ( ON ?auto_440147 ?auto_440146 ) ( ON ?auto_440148 ?auto_440147 ) ( ON ?auto_440149 ?auto_440148 ) ( not ( = ?auto_440142 ?auto_440143 ) ) ( not ( = ?auto_440142 ?auto_440144 ) ) ( not ( = ?auto_440142 ?auto_440145 ) ) ( not ( = ?auto_440142 ?auto_440146 ) ) ( not ( = ?auto_440142 ?auto_440147 ) ) ( not ( = ?auto_440142 ?auto_440148 ) ) ( not ( = ?auto_440142 ?auto_440149 ) ) ( not ( = ?auto_440142 ?auto_440150 ) ) ( not ( = ?auto_440142 ?auto_440151 ) ) ( not ( = ?auto_440142 ?auto_440152 ) ) ( not ( = ?auto_440143 ?auto_440144 ) ) ( not ( = ?auto_440143 ?auto_440145 ) ) ( not ( = ?auto_440143 ?auto_440146 ) ) ( not ( = ?auto_440143 ?auto_440147 ) ) ( not ( = ?auto_440143 ?auto_440148 ) ) ( not ( = ?auto_440143 ?auto_440149 ) ) ( not ( = ?auto_440143 ?auto_440150 ) ) ( not ( = ?auto_440143 ?auto_440151 ) ) ( not ( = ?auto_440143 ?auto_440152 ) ) ( not ( = ?auto_440144 ?auto_440145 ) ) ( not ( = ?auto_440144 ?auto_440146 ) ) ( not ( = ?auto_440144 ?auto_440147 ) ) ( not ( = ?auto_440144 ?auto_440148 ) ) ( not ( = ?auto_440144 ?auto_440149 ) ) ( not ( = ?auto_440144 ?auto_440150 ) ) ( not ( = ?auto_440144 ?auto_440151 ) ) ( not ( = ?auto_440144 ?auto_440152 ) ) ( not ( = ?auto_440145 ?auto_440146 ) ) ( not ( = ?auto_440145 ?auto_440147 ) ) ( not ( = ?auto_440145 ?auto_440148 ) ) ( not ( = ?auto_440145 ?auto_440149 ) ) ( not ( = ?auto_440145 ?auto_440150 ) ) ( not ( = ?auto_440145 ?auto_440151 ) ) ( not ( = ?auto_440145 ?auto_440152 ) ) ( not ( = ?auto_440146 ?auto_440147 ) ) ( not ( = ?auto_440146 ?auto_440148 ) ) ( not ( = ?auto_440146 ?auto_440149 ) ) ( not ( = ?auto_440146 ?auto_440150 ) ) ( not ( = ?auto_440146 ?auto_440151 ) ) ( not ( = ?auto_440146 ?auto_440152 ) ) ( not ( = ?auto_440147 ?auto_440148 ) ) ( not ( = ?auto_440147 ?auto_440149 ) ) ( not ( = ?auto_440147 ?auto_440150 ) ) ( not ( = ?auto_440147 ?auto_440151 ) ) ( not ( = ?auto_440147 ?auto_440152 ) ) ( not ( = ?auto_440148 ?auto_440149 ) ) ( not ( = ?auto_440148 ?auto_440150 ) ) ( not ( = ?auto_440148 ?auto_440151 ) ) ( not ( = ?auto_440148 ?auto_440152 ) ) ( not ( = ?auto_440149 ?auto_440150 ) ) ( not ( = ?auto_440149 ?auto_440151 ) ) ( not ( = ?auto_440149 ?auto_440152 ) ) ( not ( = ?auto_440150 ?auto_440151 ) ) ( not ( = ?auto_440150 ?auto_440152 ) ) ( not ( = ?auto_440151 ?auto_440152 ) ) ( CLEAR ?auto_440149 ) ( ON ?auto_440150 ?auto_440151 ) ( CLEAR ?auto_440150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_440142 ?auto_440143 ?auto_440144 ?auto_440145 ?auto_440146 ?auto_440147 ?auto_440148 ?auto_440149 ?auto_440150 )
      ( MAKE-10PILE ?auto_440142 ?auto_440143 ?auto_440144 ?auto_440145 ?auto_440146 ?auto_440147 ?auto_440148 ?auto_440149 ?auto_440150 ?auto_440151 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440184 - BLOCK
      ?auto_440185 - BLOCK
      ?auto_440186 - BLOCK
      ?auto_440187 - BLOCK
      ?auto_440188 - BLOCK
      ?auto_440189 - BLOCK
      ?auto_440190 - BLOCK
      ?auto_440191 - BLOCK
      ?auto_440192 - BLOCK
      ?auto_440193 - BLOCK
    )
    :vars
    (
      ?auto_440194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440193 ?auto_440194 ) ( ON-TABLE ?auto_440184 ) ( ON ?auto_440185 ?auto_440184 ) ( ON ?auto_440186 ?auto_440185 ) ( ON ?auto_440187 ?auto_440186 ) ( ON ?auto_440188 ?auto_440187 ) ( ON ?auto_440189 ?auto_440188 ) ( ON ?auto_440190 ?auto_440189 ) ( not ( = ?auto_440184 ?auto_440185 ) ) ( not ( = ?auto_440184 ?auto_440186 ) ) ( not ( = ?auto_440184 ?auto_440187 ) ) ( not ( = ?auto_440184 ?auto_440188 ) ) ( not ( = ?auto_440184 ?auto_440189 ) ) ( not ( = ?auto_440184 ?auto_440190 ) ) ( not ( = ?auto_440184 ?auto_440191 ) ) ( not ( = ?auto_440184 ?auto_440192 ) ) ( not ( = ?auto_440184 ?auto_440193 ) ) ( not ( = ?auto_440184 ?auto_440194 ) ) ( not ( = ?auto_440185 ?auto_440186 ) ) ( not ( = ?auto_440185 ?auto_440187 ) ) ( not ( = ?auto_440185 ?auto_440188 ) ) ( not ( = ?auto_440185 ?auto_440189 ) ) ( not ( = ?auto_440185 ?auto_440190 ) ) ( not ( = ?auto_440185 ?auto_440191 ) ) ( not ( = ?auto_440185 ?auto_440192 ) ) ( not ( = ?auto_440185 ?auto_440193 ) ) ( not ( = ?auto_440185 ?auto_440194 ) ) ( not ( = ?auto_440186 ?auto_440187 ) ) ( not ( = ?auto_440186 ?auto_440188 ) ) ( not ( = ?auto_440186 ?auto_440189 ) ) ( not ( = ?auto_440186 ?auto_440190 ) ) ( not ( = ?auto_440186 ?auto_440191 ) ) ( not ( = ?auto_440186 ?auto_440192 ) ) ( not ( = ?auto_440186 ?auto_440193 ) ) ( not ( = ?auto_440186 ?auto_440194 ) ) ( not ( = ?auto_440187 ?auto_440188 ) ) ( not ( = ?auto_440187 ?auto_440189 ) ) ( not ( = ?auto_440187 ?auto_440190 ) ) ( not ( = ?auto_440187 ?auto_440191 ) ) ( not ( = ?auto_440187 ?auto_440192 ) ) ( not ( = ?auto_440187 ?auto_440193 ) ) ( not ( = ?auto_440187 ?auto_440194 ) ) ( not ( = ?auto_440188 ?auto_440189 ) ) ( not ( = ?auto_440188 ?auto_440190 ) ) ( not ( = ?auto_440188 ?auto_440191 ) ) ( not ( = ?auto_440188 ?auto_440192 ) ) ( not ( = ?auto_440188 ?auto_440193 ) ) ( not ( = ?auto_440188 ?auto_440194 ) ) ( not ( = ?auto_440189 ?auto_440190 ) ) ( not ( = ?auto_440189 ?auto_440191 ) ) ( not ( = ?auto_440189 ?auto_440192 ) ) ( not ( = ?auto_440189 ?auto_440193 ) ) ( not ( = ?auto_440189 ?auto_440194 ) ) ( not ( = ?auto_440190 ?auto_440191 ) ) ( not ( = ?auto_440190 ?auto_440192 ) ) ( not ( = ?auto_440190 ?auto_440193 ) ) ( not ( = ?auto_440190 ?auto_440194 ) ) ( not ( = ?auto_440191 ?auto_440192 ) ) ( not ( = ?auto_440191 ?auto_440193 ) ) ( not ( = ?auto_440191 ?auto_440194 ) ) ( not ( = ?auto_440192 ?auto_440193 ) ) ( not ( = ?auto_440192 ?auto_440194 ) ) ( not ( = ?auto_440193 ?auto_440194 ) ) ( ON ?auto_440192 ?auto_440193 ) ( CLEAR ?auto_440190 ) ( ON ?auto_440191 ?auto_440192 ) ( CLEAR ?auto_440191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_440184 ?auto_440185 ?auto_440186 ?auto_440187 ?auto_440188 ?auto_440189 ?auto_440190 ?auto_440191 )
      ( MAKE-10PILE ?auto_440184 ?auto_440185 ?auto_440186 ?auto_440187 ?auto_440188 ?auto_440189 ?auto_440190 ?auto_440191 ?auto_440192 ?auto_440193 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440226 - BLOCK
      ?auto_440227 - BLOCK
      ?auto_440228 - BLOCK
      ?auto_440229 - BLOCK
      ?auto_440230 - BLOCK
      ?auto_440231 - BLOCK
      ?auto_440232 - BLOCK
      ?auto_440233 - BLOCK
      ?auto_440234 - BLOCK
      ?auto_440235 - BLOCK
    )
    :vars
    (
      ?auto_440236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440235 ?auto_440236 ) ( ON-TABLE ?auto_440226 ) ( ON ?auto_440227 ?auto_440226 ) ( ON ?auto_440228 ?auto_440227 ) ( ON ?auto_440229 ?auto_440228 ) ( ON ?auto_440230 ?auto_440229 ) ( ON ?auto_440231 ?auto_440230 ) ( not ( = ?auto_440226 ?auto_440227 ) ) ( not ( = ?auto_440226 ?auto_440228 ) ) ( not ( = ?auto_440226 ?auto_440229 ) ) ( not ( = ?auto_440226 ?auto_440230 ) ) ( not ( = ?auto_440226 ?auto_440231 ) ) ( not ( = ?auto_440226 ?auto_440232 ) ) ( not ( = ?auto_440226 ?auto_440233 ) ) ( not ( = ?auto_440226 ?auto_440234 ) ) ( not ( = ?auto_440226 ?auto_440235 ) ) ( not ( = ?auto_440226 ?auto_440236 ) ) ( not ( = ?auto_440227 ?auto_440228 ) ) ( not ( = ?auto_440227 ?auto_440229 ) ) ( not ( = ?auto_440227 ?auto_440230 ) ) ( not ( = ?auto_440227 ?auto_440231 ) ) ( not ( = ?auto_440227 ?auto_440232 ) ) ( not ( = ?auto_440227 ?auto_440233 ) ) ( not ( = ?auto_440227 ?auto_440234 ) ) ( not ( = ?auto_440227 ?auto_440235 ) ) ( not ( = ?auto_440227 ?auto_440236 ) ) ( not ( = ?auto_440228 ?auto_440229 ) ) ( not ( = ?auto_440228 ?auto_440230 ) ) ( not ( = ?auto_440228 ?auto_440231 ) ) ( not ( = ?auto_440228 ?auto_440232 ) ) ( not ( = ?auto_440228 ?auto_440233 ) ) ( not ( = ?auto_440228 ?auto_440234 ) ) ( not ( = ?auto_440228 ?auto_440235 ) ) ( not ( = ?auto_440228 ?auto_440236 ) ) ( not ( = ?auto_440229 ?auto_440230 ) ) ( not ( = ?auto_440229 ?auto_440231 ) ) ( not ( = ?auto_440229 ?auto_440232 ) ) ( not ( = ?auto_440229 ?auto_440233 ) ) ( not ( = ?auto_440229 ?auto_440234 ) ) ( not ( = ?auto_440229 ?auto_440235 ) ) ( not ( = ?auto_440229 ?auto_440236 ) ) ( not ( = ?auto_440230 ?auto_440231 ) ) ( not ( = ?auto_440230 ?auto_440232 ) ) ( not ( = ?auto_440230 ?auto_440233 ) ) ( not ( = ?auto_440230 ?auto_440234 ) ) ( not ( = ?auto_440230 ?auto_440235 ) ) ( not ( = ?auto_440230 ?auto_440236 ) ) ( not ( = ?auto_440231 ?auto_440232 ) ) ( not ( = ?auto_440231 ?auto_440233 ) ) ( not ( = ?auto_440231 ?auto_440234 ) ) ( not ( = ?auto_440231 ?auto_440235 ) ) ( not ( = ?auto_440231 ?auto_440236 ) ) ( not ( = ?auto_440232 ?auto_440233 ) ) ( not ( = ?auto_440232 ?auto_440234 ) ) ( not ( = ?auto_440232 ?auto_440235 ) ) ( not ( = ?auto_440232 ?auto_440236 ) ) ( not ( = ?auto_440233 ?auto_440234 ) ) ( not ( = ?auto_440233 ?auto_440235 ) ) ( not ( = ?auto_440233 ?auto_440236 ) ) ( not ( = ?auto_440234 ?auto_440235 ) ) ( not ( = ?auto_440234 ?auto_440236 ) ) ( not ( = ?auto_440235 ?auto_440236 ) ) ( ON ?auto_440234 ?auto_440235 ) ( ON ?auto_440233 ?auto_440234 ) ( CLEAR ?auto_440231 ) ( ON ?auto_440232 ?auto_440233 ) ( CLEAR ?auto_440232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_440226 ?auto_440227 ?auto_440228 ?auto_440229 ?auto_440230 ?auto_440231 ?auto_440232 )
      ( MAKE-10PILE ?auto_440226 ?auto_440227 ?auto_440228 ?auto_440229 ?auto_440230 ?auto_440231 ?auto_440232 ?auto_440233 ?auto_440234 ?auto_440235 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440268 - BLOCK
      ?auto_440269 - BLOCK
      ?auto_440270 - BLOCK
      ?auto_440271 - BLOCK
      ?auto_440272 - BLOCK
      ?auto_440273 - BLOCK
      ?auto_440274 - BLOCK
      ?auto_440275 - BLOCK
      ?auto_440276 - BLOCK
      ?auto_440277 - BLOCK
    )
    :vars
    (
      ?auto_440278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440277 ?auto_440278 ) ( ON-TABLE ?auto_440268 ) ( ON ?auto_440269 ?auto_440268 ) ( ON ?auto_440270 ?auto_440269 ) ( ON ?auto_440271 ?auto_440270 ) ( ON ?auto_440272 ?auto_440271 ) ( not ( = ?auto_440268 ?auto_440269 ) ) ( not ( = ?auto_440268 ?auto_440270 ) ) ( not ( = ?auto_440268 ?auto_440271 ) ) ( not ( = ?auto_440268 ?auto_440272 ) ) ( not ( = ?auto_440268 ?auto_440273 ) ) ( not ( = ?auto_440268 ?auto_440274 ) ) ( not ( = ?auto_440268 ?auto_440275 ) ) ( not ( = ?auto_440268 ?auto_440276 ) ) ( not ( = ?auto_440268 ?auto_440277 ) ) ( not ( = ?auto_440268 ?auto_440278 ) ) ( not ( = ?auto_440269 ?auto_440270 ) ) ( not ( = ?auto_440269 ?auto_440271 ) ) ( not ( = ?auto_440269 ?auto_440272 ) ) ( not ( = ?auto_440269 ?auto_440273 ) ) ( not ( = ?auto_440269 ?auto_440274 ) ) ( not ( = ?auto_440269 ?auto_440275 ) ) ( not ( = ?auto_440269 ?auto_440276 ) ) ( not ( = ?auto_440269 ?auto_440277 ) ) ( not ( = ?auto_440269 ?auto_440278 ) ) ( not ( = ?auto_440270 ?auto_440271 ) ) ( not ( = ?auto_440270 ?auto_440272 ) ) ( not ( = ?auto_440270 ?auto_440273 ) ) ( not ( = ?auto_440270 ?auto_440274 ) ) ( not ( = ?auto_440270 ?auto_440275 ) ) ( not ( = ?auto_440270 ?auto_440276 ) ) ( not ( = ?auto_440270 ?auto_440277 ) ) ( not ( = ?auto_440270 ?auto_440278 ) ) ( not ( = ?auto_440271 ?auto_440272 ) ) ( not ( = ?auto_440271 ?auto_440273 ) ) ( not ( = ?auto_440271 ?auto_440274 ) ) ( not ( = ?auto_440271 ?auto_440275 ) ) ( not ( = ?auto_440271 ?auto_440276 ) ) ( not ( = ?auto_440271 ?auto_440277 ) ) ( not ( = ?auto_440271 ?auto_440278 ) ) ( not ( = ?auto_440272 ?auto_440273 ) ) ( not ( = ?auto_440272 ?auto_440274 ) ) ( not ( = ?auto_440272 ?auto_440275 ) ) ( not ( = ?auto_440272 ?auto_440276 ) ) ( not ( = ?auto_440272 ?auto_440277 ) ) ( not ( = ?auto_440272 ?auto_440278 ) ) ( not ( = ?auto_440273 ?auto_440274 ) ) ( not ( = ?auto_440273 ?auto_440275 ) ) ( not ( = ?auto_440273 ?auto_440276 ) ) ( not ( = ?auto_440273 ?auto_440277 ) ) ( not ( = ?auto_440273 ?auto_440278 ) ) ( not ( = ?auto_440274 ?auto_440275 ) ) ( not ( = ?auto_440274 ?auto_440276 ) ) ( not ( = ?auto_440274 ?auto_440277 ) ) ( not ( = ?auto_440274 ?auto_440278 ) ) ( not ( = ?auto_440275 ?auto_440276 ) ) ( not ( = ?auto_440275 ?auto_440277 ) ) ( not ( = ?auto_440275 ?auto_440278 ) ) ( not ( = ?auto_440276 ?auto_440277 ) ) ( not ( = ?auto_440276 ?auto_440278 ) ) ( not ( = ?auto_440277 ?auto_440278 ) ) ( ON ?auto_440276 ?auto_440277 ) ( ON ?auto_440275 ?auto_440276 ) ( ON ?auto_440274 ?auto_440275 ) ( CLEAR ?auto_440272 ) ( ON ?auto_440273 ?auto_440274 ) ( CLEAR ?auto_440273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_440268 ?auto_440269 ?auto_440270 ?auto_440271 ?auto_440272 ?auto_440273 )
      ( MAKE-10PILE ?auto_440268 ?auto_440269 ?auto_440270 ?auto_440271 ?auto_440272 ?auto_440273 ?auto_440274 ?auto_440275 ?auto_440276 ?auto_440277 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440310 - BLOCK
      ?auto_440311 - BLOCK
      ?auto_440312 - BLOCK
      ?auto_440313 - BLOCK
      ?auto_440314 - BLOCK
      ?auto_440315 - BLOCK
      ?auto_440316 - BLOCK
      ?auto_440317 - BLOCK
      ?auto_440318 - BLOCK
      ?auto_440319 - BLOCK
    )
    :vars
    (
      ?auto_440320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440319 ?auto_440320 ) ( ON-TABLE ?auto_440310 ) ( ON ?auto_440311 ?auto_440310 ) ( ON ?auto_440312 ?auto_440311 ) ( ON ?auto_440313 ?auto_440312 ) ( not ( = ?auto_440310 ?auto_440311 ) ) ( not ( = ?auto_440310 ?auto_440312 ) ) ( not ( = ?auto_440310 ?auto_440313 ) ) ( not ( = ?auto_440310 ?auto_440314 ) ) ( not ( = ?auto_440310 ?auto_440315 ) ) ( not ( = ?auto_440310 ?auto_440316 ) ) ( not ( = ?auto_440310 ?auto_440317 ) ) ( not ( = ?auto_440310 ?auto_440318 ) ) ( not ( = ?auto_440310 ?auto_440319 ) ) ( not ( = ?auto_440310 ?auto_440320 ) ) ( not ( = ?auto_440311 ?auto_440312 ) ) ( not ( = ?auto_440311 ?auto_440313 ) ) ( not ( = ?auto_440311 ?auto_440314 ) ) ( not ( = ?auto_440311 ?auto_440315 ) ) ( not ( = ?auto_440311 ?auto_440316 ) ) ( not ( = ?auto_440311 ?auto_440317 ) ) ( not ( = ?auto_440311 ?auto_440318 ) ) ( not ( = ?auto_440311 ?auto_440319 ) ) ( not ( = ?auto_440311 ?auto_440320 ) ) ( not ( = ?auto_440312 ?auto_440313 ) ) ( not ( = ?auto_440312 ?auto_440314 ) ) ( not ( = ?auto_440312 ?auto_440315 ) ) ( not ( = ?auto_440312 ?auto_440316 ) ) ( not ( = ?auto_440312 ?auto_440317 ) ) ( not ( = ?auto_440312 ?auto_440318 ) ) ( not ( = ?auto_440312 ?auto_440319 ) ) ( not ( = ?auto_440312 ?auto_440320 ) ) ( not ( = ?auto_440313 ?auto_440314 ) ) ( not ( = ?auto_440313 ?auto_440315 ) ) ( not ( = ?auto_440313 ?auto_440316 ) ) ( not ( = ?auto_440313 ?auto_440317 ) ) ( not ( = ?auto_440313 ?auto_440318 ) ) ( not ( = ?auto_440313 ?auto_440319 ) ) ( not ( = ?auto_440313 ?auto_440320 ) ) ( not ( = ?auto_440314 ?auto_440315 ) ) ( not ( = ?auto_440314 ?auto_440316 ) ) ( not ( = ?auto_440314 ?auto_440317 ) ) ( not ( = ?auto_440314 ?auto_440318 ) ) ( not ( = ?auto_440314 ?auto_440319 ) ) ( not ( = ?auto_440314 ?auto_440320 ) ) ( not ( = ?auto_440315 ?auto_440316 ) ) ( not ( = ?auto_440315 ?auto_440317 ) ) ( not ( = ?auto_440315 ?auto_440318 ) ) ( not ( = ?auto_440315 ?auto_440319 ) ) ( not ( = ?auto_440315 ?auto_440320 ) ) ( not ( = ?auto_440316 ?auto_440317 ) ) ( not ( = ?auto_440316 ?auto_440318 ) ) ( not ( = ?auto_440316 ?auto_440319 ) ) ( not ( = ?auto_440316 ?auto_440320 ) ) ( not ( = ?auto_440317 ?auto_440318 ) ) ( not ( = ?auto_440317 ?auto_440319 ) ) ( not ( = ?auto_440317 ?auto_440320 ) ) ( not ( = ?auto_440318 ?auto_440319 ) ) ( not ( = ?auto_440318 ?auto_440320 ) ) ( not ( = ?auto_440319 ?auto_440320 ) ) ( ON ?auto_440318 ?auto_440319 ) ( ON ?auto_440317 ?auto_440318 ) ( ON ?auto_440316 ?auto_440317 ) ( ON ?auto_440315 ?auto_440316 ) ( CLEAR ?auto_440313 ) ( ON ?auto_440314 ?auto_440315 ) ( CLEAR ?auto_440314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_440310 ?auto_440311 ?auto_440312 ?auto_440313 ?auto_440314 )
      ( MAKE-10PILE ?auto_440310 ?auto_440311 ?auto_440312 ?auto_440313 ?auto_440314 ?auto_440315 ?auto_440316 ?auto_440317 ?auto_440318 ?auto_440319 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440352 - BLOCK
      ?auto_440353 - BLOCK
      ?auto_440354 - BLOCK
      ?auto_440355 - BLOCK
      ?auto_440356 - BLOCK
      ?auto_440357 - BLOCK
      ?auto_440358 - BLOCK
      ?auto_440359 - BLOCK
      ?auto_440360 - BLOCK
      ?auto_440361 - BLOCK
    )
    :vars
    (
      ?auto_440362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440361 ?auto_440362 ) ( ON-TABLE ?auto_440352 ) ( ON ?auto_440353 ?auto_440352 ) ( ON ?auto_440354 ?auto_440353 ) ( not ( = ?auto_440352 ?auto_440353 ) ) ( not ( = ?auto_440352 ?auto_440354 ) ) ( not ( = ?auto_440352 ?auto_440355 ) ) ( not ( = ?auto_440352 ?auto_440356 ) ) ( not ( = ?auto_440352 ?auto_440357 ) ) ( not ( = ?auto_440352 ?auto_440358 ) ) ( not ( = ?auto_440352 ?auto_440359 ) ) ( not ( = ?auto_440352 ?auto_440360 ) ) ( not ( = ?auto_440352 ?auto_440361 ) ) ( not ( = ?auto_440352 ?auto_440362 ) ) ( not ( = ?auto_440353 ?auto_440354 ) ) ( not ( = ?auto_440353 ?auto_440355 ) ) ( not ( = ?auto_440353 ?auto_440356 ) ) ( not ( = ?auto_440353 ?auto_440357 ) ) ( not ( = ?auto_440353 ?auto_440358 ) ) ( not ( = ?auto_440353 ?auto_440359 ) ) ( not ( = ?auto_440353 ?auto_440360 ) ) ( not ( = ?auto_440353 ?auto_440361 ) ) ( not ( = ?auto_440353 ?auto_440362 ) ) ( not ( = ?auto_440354 ?auto_440355 ) ) ( not ( = ?auto_440354 ?auto_440356 ) ) ( not ( = ?auto_440354 ?auto_440357 ) ) ( not ( = ?auto_440354 ?auto_440358 ) ) ( not ( = ?auto_440354 ?auto_440359 ) ) ( not ( = ?auto_440354 ?auto_440360 ) ) ( not ( = ?auto_440354 ?auto_440361 ) ) ( not ( = ?auto_440354 ?auto_440362 ) ) ( not ( = ?auto_440355 ?auto_440356 ) ) ( not ( = ?auto_440355 ?auto_440357 ) ) ( not ( = ?auto_440355 ?auto_440358 ) ) ( not ( = ?auto_440355 ?auto_440359 ) ) ( not ( = ?auto_440355 ?auto_440360 ) ) ( not ( = ?auto_440355 ?auto_440361 ) ) ( not ( = ?auto_440355 ?auto_440362 ) ) ( not ( = ?auto_440356 ?auto_440357 ) ) ( not ( = ?auto_440356 ?auto_440358 ) ) ( not ( = ?auto_440356 ?auto_440359 ) ) ( not ( = ?auto_440356 ?auto_440360 ) ) ( not ( = ?auto_440356 ?auto_440361 ) ) ( not ( = ?auto_440356 ?auto_440362 ) ) ( not ( = ?auto_440357 ?auto_440358 ) ) ( not ( = ?auto_440357 ?auto_440359 ) ) ( not ( = ?auto_440357 ?auto_440360 ) ) ( not ( = ?auto_440357 ?auto_440361 ) ) ( not ( = ?auto_440357 ?auto_440362 ) ) ( not ( = ?auto_440358 ?auto_440359 ) ) ( not ( = ?auto_440358 ?auto_440360 ) ) ( not ( = ?auto_440358 ?auto_440361 ) ) ( not ( = ?auto_440358 ?auto_440362 ) ) ( not ( = ?auto_440359 ?auto_440360 ) ) ( not ( = ?auto_440359 ?auto_440361 ) ) ( not ( = ?auto_440359 ?auto_440362 ) ) ( not ( = ?auto_440360 ?auto_440361 ) ) ( not ( = ?auto_440360 ?auto_440362 ) ) ( not ( = ?auto_440361 ?auto_440362 ) ) ( ON ?auto_440360 ?auto_440361 ) ( ON ?auto_440359 ?auto_440360 ) ( ON ?auto_440358 ?auto_440359 ) ( ON ?auto_440357 ?auto_440358 ) ( ON ?auto_440356 ?auto_440357 ) ( CLEAR ?auto_440354 ) ( ON ?auto_440355 ?auto_440356 ) ( CLEAR ?auto_440355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_440352 ?auto_440353 ?auto_440354 ?auto_440355 )
      ( MAKE-10PILE ?auto_440352 ?auto_440353 ?auto_440354 ?auto_440355 ?auto_440356 ?auto_440357 ?auto_440358 ?auto_440359 ?auto_440360 ?auto_440361 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440394 - BLOCK
      ?auto_440395 - BLOCK
      ?auto_440396 - BLOCK
      ?auto_440397 - BLOCK
      ?auto_440398 - BLOCK
      ?auto_440399 - BLOCK
      ?auto_440400 - BLOCK
      ?auto_440401 - BLOCK
      ?auto_440402 - BLOCK
      ?auto_440403 - BLOCK
    )
    :vars
    (
      ?auto_440404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440403 ?auto_440404 ) ( ON-TABLE ?auto_440394 ) ( ON ?auto_440395 ?auto_440394 ) ( not ( = ?auto_440394 ?auto_440395 ) ) ( not ( = ?auto_440394 ?auto_440396 ) ) ( not ( = ?auto_440394 ?auto_440397 ) ) ( not ( = ?auto_440394 ?auto_440398 ) ) ( not ( = ?auto_440394 ?auto_440399 ) ) ( not ( = ?auto_440394 ?auto_440400 ) ) ( not ( = ?auto_440394 ?auto_440401 ) ) ( not ( = ?auto_440394 ?auto_440402 ) ) ( not ( = ?auto_440394 ?auto_440403 ) ) ( not ( = ?auto_440394 ?auto_440404 ) ) ( not ( = ?auto_440395 ?auto_440396 ) ) ( not ( = ?auto_440395 ?auto_440397 ) ) ( not ( = ?auto_440395 ?auto_440398 ) ) ( not ( = ?auto_440395 ?auto_440399 ) ) ( not ( = ?auto_440395 ?auto_440400 ) ) ( not ( = ?auto_440395 ?auto_440401 ) ) ( not ( = ?auto_440395 ?auto_440402 ) ) ( not ( = ?auto_440395 ?auto_440403 ) ) ( not ( = ?auto_440395 ?auto_440404 ) ) ( not ( = ?auto_440396 ?auto_440397 ) ) ( not ( = ?auto_440396 ?auto_440398 ) ) ( not ( = ?auto_440396 ?auto_440399 ) ) ( not ( = ?auto_440396 ?auto_440400 ) ) ( not ( = ?auto_440396 ?auto_440401 ) ) ( not ( = ?auto_440396 ?auto_440402 ) ) ( not ( = ?auto_440396 ?auto_440403 ) ) ( not ( = ?auto_440396 ?auto_440404 ) ) ( not ( = ?auto_440397 ?auto_440398 ) ) ( not ( = ?auto_440397 ?auto_440399 ) ) ( not ( = ?auto_440397 ?auto_440400 ) ) ( not ( = ?auto_440397 ?auto_440401 ) ) ( not ( = ?auto_440397 ?auto_440402 ) ) ( not ( = ?auto_440397 ?auto_440403 ) ) ( not ( = ?auto_440397 ?auto_440404 ) ) ( not ( = ?auto_440398 ?auto_440399 ) ) ( not ( = ?auto_440398 ?auto_440400 ) ) ( not ( = ?auto_440398 ?auto_440401 ) ) ( not ( = ?auto_440398 ?auto_440402 ) ) ( not ( = ?auto_440398 ?auto_440403 ) ) ( not ( = ?auto_440398 ?auto_440404 ) ) ( not ( = ?auto_440399 ?auto_440400 ) ) ( not ( = ?auto_440399 ?auto_440401 ) ) ( not ( = ?auto_440399 ?auto_440402 ) ) ( not ( = ?auto_440399 ?auto_440403 ) ) ( not ( = ?auto_440399 ?auto_440404 ) ) ( not ( = ?auto_440400 ?auto_440401 ) ) ( not ( = ?auto_440400 ?auto_440402 ) ) ( not ( = ?auto_440400 ?auto_440403 ) ) ( not ( = ?auto_440400 ?auto_440404 ) ) ( not ( = ?auto_440401 ?auto_440402 ) ) ( not ( = ?auto_440401 ?auto_440403 ) ) ( not ( = ?auto_440401 ?auto_440404 ) ) ( not ( = ?auto_440402 ?auto_440403 ) ) ( not ( = ?auto_440402 ?auto_440404 ) ) ( not ( = ?auto_440403 ?auto_440404 ) ) ( ON ?auto_440402 ?auto_440403 ) ( ON ?auto_440401 ?auto_440402 ) ( ON ?auto_440400 ?auto_440401 ) ( ON ?auto_440399 ?auto_440400 ) ( ON ?auto_440398 ?auto_440399 ) ( ON ?auto_440397 ?auto_440398 ) ( CLEAR ?auto_440395 ) ( ON ?auto_440396 ?auto_440397 ) ( CLEAR ?auto_440396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_440394 ?auto_440395 ?auto_440396 )
      ( MAKE-10PILE ?auto_440394 ?auto_440395 ?auto_440396 ?auto_440397 ?auto_440398 ?auto_440399 ?auto_440400 ?auto_440401 ?auto_440402 ?auto_440403 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440436 - BLOCK
      ?auto_440437 - BLOCK
      ?auto_440438 - BLOCK
      ?auto_440439 - BLOCK
      ?auto_440440 - BLOCK
      ?auto_440441 - BLOCK
      ?auto_440442 - BLOCK
      ?auto_440443 - BLOCK
      ?auto_440444 - BLOCK
      ?auto_440445 - BLOCK
    )
    :vars
    (
      ?auto_440446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440445 ?auto_440446 ) ( ON-TABLE ?auto_440436 ) ( not ( = ?auto_440436 ?auto_440437 ) ) ( not ( = ?auto_440436 ?auto_440438 ) ) ( not ( = ?auto_440436 ?auto_440439 ) ) ( not ( = ?auto_440436 ?auto_440440 ) ) ( not ( = ?auto_440436 ?auto_440441 ) ) ( not ( = ?auto_440436 ?auto_440442 ) ) ( not ( = ?auto_440436 ?auto_440443 ) ) ( not ( = ?auto_440436 ?auto_440444 ) ) ( not ( = ?auto_440436 ?auto_440445 ) ) ( not ( = ?auto_440436 ?auto_440446 ) ) ( not ( = ?auto_440437 ?auto_440438 ) ) ( not ( = ?auto_440437 ?auto_440439 ) ) ( not ( = ?auto_440437 ?auto_440440 ) ) ( not ( = ?auto_440437 ?auto_440441 ) ) ( not ( = ?auto_440437 ?auto_440442 ) ) ( not ( = ?auto_440437 ?auto_440443 ) ) ( not ( = ?auto_440437 ?auto_440444 ) ) ( not ( = ?auto_440437 ?auto_440445 ) ) ( not ( = ?auto_440437 ?auto_440446 ) ) ( not ( = ?auto_440438 ?auto_440439 ) ) ( not ( = ?auto_440438 ?auto_440440 ) ) ( not ( = ?auto_440438 ?auto_440441 ) ) ( not ( = ?auto_440438 ?auto_440442 ) ) ( not ( = ?auto_440438 ?auto_440443 ) ) ( not ( = ?auto_440438 ?auto_440444 ) ) ( not ( = ?auto_440438 ?auto_440445 ) ) ( not ( = ?auto_440438 ?auto_440446 ) ) ( not ( = ?auto_440439 ?auto_440440 ) ) ( not ( = ?auto_440439 ?auto_440441 ) ) ( not ( = ?auto_440439 ?auto_440442 ) ) ( not ( = ?auto_440439 ?auto_440443 ) ) ( not ( = ?auto_440439 ?auto_440444 ) ) ( not ( = ?auto_440439 ?auto_440445 ) ) ( not ( = ?auto_440439 ?auto_440446 ) ) ( not ( = ?auto_440440 ?auto_440441 ) ) ( not ( = ?auto_440440 ?auto_440442 ) ) ( not ( = ?auto_440440 ?auto_440443 ) ) ( not ( = ?auto_440440 ?auto_440444 ) ) ( not ( = ?auto_440440 ?auto_440445 ) ) ( not ( = ?auto_440440 ?auto_440446 ) ) ( not ( = ?auto_440441 ?auto_440442 ) ) ( not ( = ?auto_440441 ?auto_440443 ) ) ( not ( = ?auto_440441 ?auto_440444 ) ) ( not ( = ?auto_440441 ?auto_440445 ) ) ( not ( = ?auto_440441 ?auto_440446 ) ) ( not ( = ?auto_440442 ?auto_440443 ) ) ( not ( = ?auto_440442 ?auto_440444 ) ) ( not ( = ?auto_440442 ?auto_440445 ) ) ( not ( = ?auto_440442 ?auto_440446 ) ) ( not ( = ?auto_440443 ?auto_440444 ) ) ( not ( = ?auto_440443 ?auto_440445 ) ) ( not ( = ?auto_440443 ?auto_440446 ) ) ( not ( = ?auto_440444 ?auto_440445 ) ) ( not ( = ?auto_440444 ?auto_440446 ) ) ( not ( = ?auto_440445 ?auto_440446 ) ) ( ON ?auto_440444 ?auto_440445 ) ( ON ?auto_440443 ?auto_440444 ) ( ON ?auto_440442 ?auto_440443 ) ( ON ?auto_440441 ?auto_440442 ) ( ON ?auto_440440 ?auto_440441 ) ( ON ?auto_440439 ?auto_440440 ) ( ON ?auto_440438 ?auto_440439 ) ( CLEAR ?auto_440436 ) ( ON ?auto_440437 ?auto_440438 ) ( CLEAR ?auto_440437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_440436 ?auto_440437 )
      ( MAKE-10PILE ?auto_440436 ?auto_440437 ?auto_440438 ?auto_440439 ?auto_440440 ?auto_440441 ?auto_440442 ?auto_440443 ?auto_440444 ?auto_440445 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_440478 - BLOCK
      ?auto_440479 - BLOCK
      ?auto_440480 - BLOCK
      ?auto_440481 - BLOCK
      ?auto_440482 - BLOCK
      ?auto_440483 - BLOCK
      ?auto_440484 - BLOCK
      ?auto_440485 - BLOCK
      ?auto_440486 - BLOCK
      ?auto_440487 - BLOCK
    )
    :vars
    (
      ?auto_440488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440487 ?auto_440488 ) ( not ( = ?auto_440478 ?auto_440479 ) ) ( not ( = ?auto_440478 ?auto_440480 ) ) ( not ( = ?auto_440478 ?auto_440481 ) ) ( not ( = ?auto_440478 ?auto_440482 ) ) ( not ( = ?auto_440478 ?auto_440483 ) ) ( not ( = ?auto_440478 ?auto_440484 ) ) ( not ( = ?auto_440478 ?auto_440485 ) ) ( not ( = ?auto_440478 ?auto_440486 ) ) ( not ( = ?auto_440478 ?auto_440487 ) ) ( not ( = ?auto_440478 ?auto_440488 ) ) ( not ( = ?auto_440479 ?auto_440480 ) ) ( not ( = ?auto_440479 ?auto_440481 ) ) ( not ( = ?auto_440479 ?auto_440482 ) ) ( not ( = ?auto_440479 ?auto_440483 ) ) ( not ( = ?auto_440479 ?auto_440484 ) ) ( not ( = ?auto_440479 ?auto_440485 ) ) ( not ( = ?auto_440479 ?auto_440486 ) ) ( not ( = ?auto_440479 ?auto_440487 ) ) ( not ( = ?auto_440479 ?auto_440488 ) ) ( not ( = ?auto_440480 ?auto_440481 ) ) ( not ( = ?auto_440480 ?auto_440482 ) ) ( not ( = ?auto_440480 ?auto_440483 ) ) ( not ( = ?auto_440480 ?auto_440484 ) ) ( not ( = ?auto_440480 ?auto_440485 ) ) ( not ( = ?auto_440480 ?auto_440486 ) ) ( not ( = ?auto_440480 ?auto_440487 ) ) ( not ( = ?auto_440480 ?auto_440488 ) ) ( not ( = ?auto_440481 ?auto_440482 ) ) ( not ( = ?auto_440481 ?auto_440483 ) ) ( not ( = ?auto_440481 ?auto_440484 ) ) ( not ( = ?auto_440481 ?auto_440485 ) ) ( not ( = ?auto_440481 ?auto_440486 ) ) ( not ( = ?auto_440481 ?auto_440487 ) ) ( not ( = ?auto_440481 ?auto_440488 ) ) ( not ( = ?auto_440482 ?auto_440483 ) ) ( not ( = ?auto_440482 ?auto_440484 ) ) ( not ( = ?auto_440482 ?auto_440485 ) ) ( not ( = ?auto_440482 ?auto_440486 ) ) ( not ( = ?auto_440482 ?auto_440487 ) ) ( not ( = ?auto_440482 ?auto_440488 ) ) ( not ( = ?auto_440483 ?auto_440484 ) ) ( not ( = ?auto_440483 ?auto_440485 ) ) ( not ( = ?auto_440483 ?auto_440486 ) ) ( not ( = ?auto_440483 ?auto_440487 ) ) ( not ( = ?auto_440483 ?auto_440488 ) ) ( not ( = ?auto_440484 ?auto_440485 ) ) ( not ( = ?auto_440484 ?auto_440486 ) ) ( not ( = ?auto_440484 ?auto_440487 ) ) ( not ( = ?auto_440484 ?auto_440488 ) ) ( not ( = ?auto_440485 ?auto_440486 ) ) ( not ( = ?auto_440485 ?auto_440487 ) ) ( not ( = ?auto_440485 ?auto_440488 ) ) ( not ( = ?auto_440486 ?auto_440487 ) ) ( not ( = ?auto_440486 ?auto_440488 ) ) ( not ( = ?auto_440487 ?auto_440488 ) ) ( ON ?auto_440486 ?auto_440487 ) ( ON ?auto_440485 ?auto_440486 ) ( ON ?auto_440484 ?auto_440485 ) ( ON ?auto_440483 ?auto_440484 ) ( ON ?auto_440482 ?auto_440483 ) ( ON ?auto_440481 ?auto_440482 ) ( ON ?auto_440480 ?auto_440481 ) ( ON ?auto_440479 ?auto_440480 ) ( ON ?auto_440478 ?auto_440479 ) ( CLEAR ?auto_440478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_440478 )
      ( MAKE-10PILE ?auto_440478 ?auto_440479 ?auto_440480 ?auto_440481 ?auto_440482 ?auto_440483 ?auto_440484 ?auto_440485 ?auto_440486 ?auto_440487 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440521 - BLOCK
      ?auto_440522 - BLOCK
      ?auto_440523 - BLOCK
      ?auto_440524 - BLOCK
      ?auto_440525 - BLOCK
      ?auto_440526 - BLOCK
      ?auto_440527 - BLOCK
      ?auto_440528 - BLOCK
      ?auto_440529 - BLOCK
      ?auto_440530 - BLOCK
      ?auto_440531 - BLOCK
    )
    :vars
    (
      ?auto_440532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_440530 ) ( ON ?auto_440531 ?auto_440532 ) ( CLEAR ?auto_440531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_440521 ) ( ON ?auto_440522 ?auto_440521 ) ( ON ?auto_440523 ?auto_440522 ) ( ON ?auto_440524 ?auto_440523 ) ( ON ?auto_440525 ?auto_440524 ) ( ON ?auto_440526 ?auto_440525 ) ( ON ?auto_440527 ?auto_440526 ) ( ON ?auto_440528 ?auto_440527 ) ( ON ?auto_440529 ?auto_440528 ) ( ON ?auto_440530 ?auto_440529 ) ( not ( = ?auto_440521 ?auto_440522 ) ) ( not ( = ?auto_440521 ?auto_440523 ) ) ( not ( = ?auto_440521 ?auto_440524 ) ) ( not ( = ?auto_440521 ?auto_440525 ) ) ( not ( = ?auto_440521 ?auto_440526 ) ) ( not ( = ?auto_440521 ?auto_440527 ) ) ( not ( = ?auto_440521 ?auto_440528 ) ) ( not ( = ?auto_440521 ?auto_440529 ) ) ( not ( = ?auto_440521 ?auto_440530 ) ) ( not ( = ?auto_440521 ?auto_440531 ) ) ( not ( = ?auto_440521 ?auto_440532 ) ) ( not ( = ?auto_440522 ?auto_440523 ) ) ( not ( = ?auto_440522 ?auto_440524 ) ) ( not ( = ?auto_440522 ?auto_440525 ) ) ( not ( = ?auto_440522 ?auto_440526 ) ) ( not ( = ?auto_440522 ?auto_440527 ) ) ( not ( = ?auto_440522 ?auto_440528 ) ) ( not ( = ?auto_440522 ?auto_440529 ) ) ( not ( = ?auto_440522 ?auto_440530 ) ) ( not ( = ?auto_440522 ?auto_440531 ) ) ( not ( = ?auto_440522 ?auto_440532 ) ) ( not ( = ?auto_440523 ?auto_440524 ) ) ( not ( = ?auto_440523 ?auto_440525 ) ) ( not ( = ?auto_440523 ?auto_440526 ) ) ( not ( = ?auto_440523 ?auto_440527 ) ) ( not ( = ?auto_440523 ?auto_440528 ) ) ( not ( = ?auto_440523 ?auto_440529 ) ) ( not ( = ?auto_440523 ?auto_440530 ) ) ( not ( = ?auto_440523 ?auto_440531 ) ) ( not ( = ?auto_440523 ?auto_440532 ) ) ( not ( = ?auto_440524 ?auto_440525 ) ) ( not ( = ?auto_440524 ?auto_440526 ) ) ( not ( = ?auto_440524 ?auto_440527 ) ) ( not ( = ?auto_440524 ?auto_440528 ) ) ( not ( = ?auto_440524 ?auto_440529 ) ) ( not ( = ?auto_440524 ?auto_440530 ) ) ( not ( = ?auto_440524 ?auto_440531 ) ) ( not ( = ?auto_440524 ?auto_440532 ) ) ( not ( = ?auto_440525 ?auto_440526 ) ) ( not ( = ?auto_440525 ?auto_440527 ) ) ( not ( = ?auto_440525 ?auto_440528 ) ) ( not ( = ?auto_440525 ?auto_440529 ) ) ( not ( = ?auto_440525 ?auto_440530 ) ) ( not ( = ?auto_440525 ?auto_440531 ) ) ( not ( = ?auto_440525 ?auto_440532 ) ) ( not ( = ?auto_440526 ?auto_440527 ) ) ( not ( = ?auto_440526 ?auto_440528 ) ) ( not ( = ?auto_440526 ?auto_440529 ) ) ( not ( = ?auto_440526 ?auto_440530 ) ) ( not ( = ?auto_440526 ?auto_440531 ) ) ( not ( = ?auto_440526 ?auto_440532 ) ) ( not ( = ?auto_440527 ?auto_440528 ) ) ( not ( = ?auto_440527 ?auto_440529 ) ) ( not ( = ?auto_440527 ?auto_440530 ) ) ( not ( = ?auto_440527 ?auto_440531 ) ) ( not ( = ?auto_440527 ?auto_440532 ) ) ( not ( = ?auto_440528 ?auto_440529 ) ) ( not ( = ?auto_440528 ?auto_440530 ) ) ( not ( = ?auto_440528 ?auto_440531 ) ) ( not ( = ?auto_440528 ?auto_440532 ) ) ( not ( = ?auto_440529 ?auto_440530 ) ) ( not ( = ?auto_440529 ?auto_440531 ) ) ( not ( = ?auto_440529 ?auto_440532 ) ) ( not ( = ?auto_440530 ?auto_440531 ) ) ( not ( = ?auto_440530 ?auto_440532 ) ) ( not ( = ?auto_440531 ?auto_440532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_440531 ?auto_440532 )
      ( !STACK ?auto_440531 ?auto_440530 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440567 - BLOCK
      ?auto_440568 - BLOCK
      ?auto_440569 - BLOCK
      ?auto_440570 - BLOCK
      ?auto_440571 - BLOCK
      ?auto_440572 - BLOCK
      ?auto_440573 - BLOCK
      ?auto_440574 - BLOCK
      ?auto_440575 - BLOCK
      ?auto_440576 - BLOCK
      ?auto_440577 - BLOCK
    )
    :vars
    (
      ?auto_440578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440577 ?auto_440578 ) ( ON-TABLE ?auto_440567 ) ( ON ?auto_440568 ?auto_440567 ) ( ON ?auto_440569 ?auto_440568 ) ( ON ?auto_440570 ?auto_440569 ) ( ON ?auto_440571 ?auto_440570 ) ( ON ?auto_440572 ?auto_440571 ) ( ON ?auto_440573 ?auto_440572 ) ( ON ?auto_440574 ?auto_440573 ) ( ON ?auto_440575 ?auto_440574 ) ( not ( = ?auto_440567 ?auto_440568 ) ) ( not ( = ?auto_440567 ?auto_440569 ) ) ( not ( = ?auto_440567 ?auto_440570 ) ) ( not ( = ?auto_440567 ?auto_440571 ) ) ( not ( = ?auto_440567 ?auto_440572 ) ) ( not ( = ?auto_440567 ?auto_440573 ) ) ( not ( = ?auto_440567 ?auto_440574 ) ) ( not ( = ?auto_440567 ?auto_440575 ) ) ( not ( = ?auto_440567 ?auto_440576 ) ) ( not ( = ?auto_440567 ?auto_440577 ) ) ( not ( = ?auto_440567 ?auto_440578 ) ) ( not ( = ?auto_440568 ?auto_440569 ) ) ( not ( = ?auto_440568 ?auto_440570 ) ) ( not ( = ?auto_440568 ?auto_440571 ) ) ( not ( = ?auto_440568 ?auto_440572 ) ) ( not ( = ?auto_440568 ?auto_440573 ) ) ( not ( = ?auto_440568 ?auto_440574 ) ) ( not ( = ?auto_440568 ?auto_440575 ) ) ( not ( = ?auto_440568 ?auto_440576 ) ) ( not ( = ?auto_440568 ?auto_440577 ) ) ( not ( = ?auto_440568 ?auto_440578 ) ) ( not ( = ?auto_440569 ?auto_440570 ) ) ( not ( = ?auto_440569 ?auto_440571 ) ) ( not ( = ?auto_440569 ?auto_440572 ) ) ( not ( = ?auto_440569 ?auto_440573 ) ) ( not ( = ?auto_440569 ?auto_440574 ) ) ( not ( = ?auto_440569 ?auto_440575 ) ) ( not ( = ?auto_440569 ?auto_440576 ) ) ( not ( = ?auto_440569 ?auto_440577 ) ) ( not ( = ?auto_440569 ?auto_440578 ) ) ( not ( = ?auto_440570 ?auto_440571 ) ) ( not ( = ?auto_440570 ?auto_440572 ) ) ( not ( = ?auto_440570 ?auto_440573 ) ) ( not ( = ?auto_440570 ?auto_440574 ) ) ( not ( = ?auto_440570 ?auto_440575 ) ) ( not ( = ?auto_440570 ?auto_440576 ) ) ( not ( = ?auto_440570 ?auto_440577 ) ) ( not ( = ?auto_440570 ?auto_440578 ) ) ( not ( = ?auto_440571 ?auto_440572 ) ) ( not ( = ?auto_440571 ?auto_440573 ) ) ( not ( = ?auto_440571 ?auto_440574 ) ) ( not ( = ?auto_440571 ?auto_440575 ) ) ( not ( = ?auto_440571 ?auto_440576 ) ) ( not ( = ?auto_440571 ?auto_440577 ) ) ( not ( = ?auto_440571 ?auto_440578 ) ) ( not ( = ?auto_440572 ?auto_440573 ) ) ( not ( = ?auto_440572 ?auto_440574 ) ) ( not ( = ?auto_440572 ?auto_440575 ) ) ( not ( = ?auto_440572 ?auto_440576 ) ) ( not ( = ?auto_440572 ?auto_440577 ) ) ( not ( = ?auto_440572 ?auto_440578 ) ) ( not ( = ?auto_440573 ?auto_440574 ) ) ( not ( = ?auto_440573 ?auto_440575 ) ) ( not ( = ?auto_440573 ?auto_440576 ) ) ( not ( = ?auto_440573 ?auto_440577 ) ) ( not ( = ?auto_440573 ?auto_440578 ) ) ( not ( = ?auto_440574 ?auto_440575 ) ) ( not ( = ?auto_440574 ?auto_440576 ) ) ( not ( = ?auto_440574 ?auto_440577 ) ) ( not ( = ?auto_440574 ?auto_440578 ) ) ( not ( = ?auto_440575 ?auto_440576 ) ) ( not ( = ?auto_440575 ?auto_440577 ) ) ( not ( = ?auto_440575 ?auto_440578 ) ) ( not ( = ?auto_440576 ?auto_440577 ) ) ( not ( = ?auto_440576 ?auto_440578 ) ) ( not ( = ?auto_440577 ?auto_440578 ) ) ( CLEAR ?auto_440575 ) ( ON ?auto_440576 ?auto_440577 ) ( CLEAR ?auto_440576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_440567 ?auto_440568 ?auto_440569 ?auto_440570 ?auto_440571 ?auto_440572 ?auto_440573 ?auto_440574 ?auto_440575 ?auto_440576 )
      ( MAKE-11PILE ?auto_440567 ?auto_440568 ?auto_440569 ?auto_440570 ?auto_440571 ?auto_440572 ?auto_440573 ?auto_440574 ?auto_440575 ?auto_440576 ?auto_440577 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440613 - BLOCK
      ?auto_440614 - BLOCK
      ?auto_440615 - BLOCK
      ?auto_440616 - BLOCK
      ?auto_440617 - BLOCK
      ?auto_440618 - BLOCK
      ?auto_440619 - BLOCK
      ?auto_440620 - BLOCK
      ?auto_440621 - BLOCK
      ?auto_440622 - BLOCK
      ?auto_440623 - BLOCK
    )
    :vars
    (
      ?auto_440624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440623 ?auto_440624 ) ( ON-TABLE ?auto_440613 ) ( ON ?auto_440614 ?auto_440613 ) ( ON ?auto_440615 ?auto_440614 ) ( ON ?auto_440616 ?auto_440615 ) ( ON ?auto_440617 ?auto_440616 ) ( ON ?auto_440618 ?auto_440617 ) ( ON ?auto_440619 ?auto_440618 ) ( ON ?auto_440620 ?auto_440619 ) ( not ( = ?auto_440613 ?auto_440614 ) ) ( not ( = ?auto_440613 ?auto_440615 ) ) ( not ( = ?auto_440613 ?auto_440616 ) ) ( not ( = ?auto_440613 ?auto_440617 ) ) ( not ( = ?auto_440613 ?auto_440618 ) ) ( not ( = ?auto_440613 ?auto_440619 ) ) ( not ( = ?auto_440613 ?auto_440620 ) ) ( not ( = ?auto_440613 ?auto_440621 ) ) ( not ( = ?auto_440613 ?auto_440622 ) ) ( not ( = ?auto_440613 ?auto_440623 ) ) ( not ( = ?auto_440613 ?auto_440624 ) ) ( not ( = ?auto_440614 ?auto_440615 ) ) ( not ( = ?auto_440614 ?auto_440616 ) ) ( not ( = ?auto_440614 ?auto_440617 ) ) ( not ( = ?auto_440614 ?auto_440618 ) ) ( not ( = ?auto_440614 ?auto_440619 ) ) ( not ( = ?auto_440614 ?auto_440620 ) ) ( not ( = ?auto_440614 ?auto_440621 ) ) ( not ( = ?auto_440614 ?auto_440622 ) ) ( not ( = ?auto_440614 ?auto_440623 ) ) ( not ( = ?auto_440614 ?auto_440624 ) ) ( not ( = ?auto_440615 ?auto_440616 ) ) ( not ( = ?auto_440615 ?auto_440617 ) ) ( not ( = ?auto_440615 ?auto_440618 ) ) ( not ( = ?auto_440615 ?auto_440619 ) ) ( not ( = ?auto_440615 ?auto_440620 ) ) ( not ( = ?auto_440615 ?auto_440621 ) ) ( not ( = ?auto_440615 ?auto_440622 ) ) ( not ( = ?auto_440615 ?auto_440623 ) ) ( not ( = ?auto_440615 ?auto_440624 ) ) ( not ( = ?auto_440616 ?auto_440617 ) ) ( not ( = ?auto_440616 ?auto_440618 ) ) ( not ( = ?auto_440616 ?auto_440619 ) ) ( not ( = ?auto_440616 ?auto_440620 ) ) ( not ( = ?auto_440616 ?auto_440621 ) ) ( not ( = ?auto_440616 ?auto_440622 ) ) ( not ( = ?auto_440616 ?auto_440623 ) ) ( not ( = ?auto_440616 ?auto_440624 ) ) ( not ( = ?auto_440617 ?auto_440618 ) ) ( not ( = ?auto_440617 ?auto_440619 ) ) ( not ( = ?auto_440617 ?auto_440620 ) ) ( not ( = ?auto_440617 ?auto_440621 ) ) ( not ( = ?auto_440617 ?auto_440622 ) ) ( not ( = ?auto_440617 ?auto_440623 ) ) ( not ( = ?auto_440617 ?auto_440624 ) ) ( not ( = ?auto_440618 ?auto_440619 ) ) ( not ( = ?auto_440618 ?auto_440620 ) ) ( not ( = ?auto_440618 ?auto_440621 ) ) ( not ( = ?auto_440618 ?auto_440622 ) ) ( not ( = ?auto_440618 ?auto_440623 ) ) ( not ( = ?auto_440618 ?auto_440624 ) ) ( not ( = ?auto_440619 ?auto_440620 ) ) ( not ( = ?auto_440619 ?auto_440621 ) ) ( not ( = ?auto_440619 ?auto_440622 ) ) ( not ( = ?auto_440619 ?auto_440623 ) ) ( not ( = ?auto_440619 ?auto_440624 ) ) ( not ( = ?auto_440620 ?auto_440621 ) ) ( not ( = ?auto_440620 ?auto_440622 ) ) ( not ( = ?auto_440620 ?auto_440623 ) ) ( not ( = ?auto_440620 ?auto_440624 ) ) ( not ( = ?auto_440621 ?auto_440622 ) ) ( not ( = ?auto_440621 ?auto_440623 ) ) ( not ( = ?auto_440621 ?auto_440624 ) ) ( not ( = ?auto_440622 ?auto_440623 ) ) ( not ( = ?auto_440622 ?auto_440624 ) ) ( not ( = ?auto_440623 ?auto_440624 ) ) ( ON ?auto_440622 ?auto_440623 ) ( CLEAR ?auto_440620 ) ( ON ?auto_440621 ?auto_440622 ) ( CLEAR ?auto_440621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_440613 ?auto_440614 ?auto_440615 ?auto_440616 ?auto_440617 ?auto_440618 ?auto_440619 ?auto_440620 ?auto_440621 )
      ( MAKE-11PILE ?auto_440613 ?auto_440614 ?auto_440615 ?auto_440616 ?auto_440617 ?auto_440618 ?auto_440619 ?auto_440620 ?auto_440621 ?auto_440622 ?auto_440623 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440659 - BLOCK
      ?auto_440660 - BLOCK
      ?auto_440661 - BLOCK
      ?auto_440662 - BLOCK
      ?auto_440663 - BLOCK
      ?auto_440664 - BLOCK
      ?auto_440665 - BLOCK
      ?auto_440666 - BLOCK
      ?auto_440667 - BLOCK
      ?auto_440668 - BLOCK
      ?auto_440669 - BLOCK
    )
    :vars
    (
      ?auto_440670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440669 ?auto_440670 ) ( ON-TABLE ?auto_440659 ) ( ON ?auto_440660 ?auto_440659 ) ( ON ?auto_440661 ?auto_440660 ) ( ON ?auto_440662 ?auto_440661 ) ( ON ?auto_440663 ?auto_440662 ) ( ON ?auto_440664 ?auto_440663 ) ( ON ?auto_440665 ?auto_440664 ) ( not ( = ?auto_440659 ?auto_440660 ) ) ( not ( = ?auto_440659 ?auto_440661 ) ) ( not ( = ?auto_440659 ?auto_440662 ) ) ( not ( = ?auto_440659 ?auto_440663 ) ) ( not ( = ?auto_440659 ?auto_440664 ) ) ( not ( = ?auto_440659 ?auto_440665 ) ) ( not ( = ?auto_440659 ?auto_440666 ) ) ( not ( = ?auto_440659 ?auto_440667 ) ) ( not ( = ?auto_440659 ?auto_440668 ) ) ( not ( = ?auto_440659 ?auto_440669 ) ) ( not ( = ?auto_440659 ?auto_440670 ) ) ( not ( = ?auto_440660 ?auto_440661 ) ) ( not ( = ?auto_440660 ?auto_440662 ) ) ( not ( = ?auto_440660 ?auto_440663 ) ) ( not ( = ?auto_440660 ?auto_440664 ) ) ( not ( = ?auto_440660 ?auto_440665 ) ) ( not ( = ?auto_440660 ?auto_440666 ) ) ( not ( = ?auto_440660 ?auto_440667 ) ) ( not ( = ?auto_440660 ?auto_440668 ) ) ( not ( = ?auto_440660 ?auto_440669 ) ) ( not ( = ?auto_440660 ?auto_440670 ) ) ( not ( = ?auto_440661 ?auto_440662 ) ) ( not ( = ?auto_440661 ?auto_440663 ) ) ( not ( = ?auto_440661 ?auto_440664 ) ) ( not ( = ?auto_440661 ?auto_440665 ) ) ( not ( = ?auto_440661 ?auto_440666 ) ) ( not ( = ?auto_440661 ?auto_440667 ) ) ( not ( = ?auto_440661 ?auto_440668 ) ) ( not ( = ?auto_440661 ?auto_440669 ) ) ( not ( = ?auto_440661 ?auto_440670 ) ) ( not ( = ?auto_440662 ?auto_440663 ) ) ( not ( = ?auto_440662 ?auto_440664 ) ) ( not ( = ?auto_440662 ?auto_440665 ) ) ( not ( = ?auto_440662 ?auto_440666 ) ) ( not ( = ?auto_440662 ?auto_440667 ) ) ( not ( = ?auto_440662 ?auto_440668 ) ) ( not ( = ?auto_440662 ?auto_440669 ) ) ( not ( = ?auto_440662 ?auto_440670 ) ) ( not ( = ?auto_440663 ?auto_440664 ) ) ( not ( = ?auto_440663 ?auto_440665 ) ) ( not ( = ?auto_440663 ?auto_440666 ) ) ( not ( = ?auto_440663 ?auto_440667 ) ) ( not ( = ?auto_440663 ?auto_440668 ) ) ( not ( = ?auto_440663 ?auto_440669 ) ) ( not ( = ?auto_440663 ?auto_440670 ) ) ( not ( = ?auto_440664 ?auto_440665 ) ) ( not ( = ?auto_440664 ?auto_440666 ) ) ( not ( = ?auto_440664 ?auto_440667 ) ) ( not ( = ?auto_440664 ?auto_440668 ) ) ( not ( = ?auto_440664 ?auto_440669 ) ) ( not ( = ?auto_440664 ?auto_440670 ) ) ( not ( = ?auto_440665 ?auto_440666 ) ) ( not ( = ?auto_440665 ?auto_440667 ) ) ( not ( = ?auto_440665 ?auto_440668 ) ) ( not ( = ?auto_440665 ?auto_440669 ) ) ( not ( = ?auto_440665 ?auto_440670 ) ) ( not ( = ?auto_440666 ?auto_440667 ) ) ( not ( = ?auto_440666 ?auto_440668 ) ) ( not ( = ?auto_440666 ?auto_440669 ) ) ( not ( = ?auto_440666 ?auto_440670 ) ) ( not ( = ?auto_440667 ?auto_440668 ) ) ( not ( = ?auto_440667 ?auto_440669 ) ) ( not ( = ?auto_440667 ?auto_440670 ) ) ( not ( = ?auto_440668 ?auto_440669 ) ) ( not ( = ?auto_440668 ?auto_440670 ) ) ( not ( = ?auto_440669 ?auto_440670 ) ) ( ON ?auto_440668 ?auto_440669 ) ( ON ?auto_440667 ?auto_440668 ) ( CLEAR ?auto_440665 ) ( ON ?auto_440666 ?auto_440667 ) ( CLEAR ?auto_440666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_440659 ?auto_440660 ?auto_440661 ?auto_440662 ?auto_440663 ?auto_440664 ?auto_440665 ?auto_440666 )
      ( MAKE-11PILE ?auto_440659 ?auto_440660 ?auto_440661 ?auto_440662 ?auto_440663 ?auto_440664 ?auto_440665 ?auto_440666 ?auto_440667 ?auto_440668 ?auto_440669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440705 - BLOCK
      ?auto_440706 - BLOCK
      ?auto_440707 - BLOCK
      ?auto_440708 - BLOCK
      ?auto_440709 - BLOCK
      ?auto_440710 - BLOCK
      ?auto_440711 - BLOCK
      ?auto_440712 - BLOCK
      ?auto_440713 - BLOCK
      ?auto_440714 - BLOCK
      ?auto_440715 - BLOCK
    )
    :vars
    (
      ?auto_440716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440715 ?auto_440716 ) ( ON-TABLE ?auto_440705 ) ( ON ?auto_440706 ?auto_440705 ) ( ON ?auto_440707 ?auto_440706 ) ( ON ?auto_440708 ?auto_440707 ) ( ON ?auto_440709 ?auto_440708 ) ( ON ?auto_440710 ?auto_440709 ) ( not ( = ?auto_440705 ?auto_440706 ) ) ( not ( = ?auto_440705 ?auto_440707 ) ) ( not ( = ?auto_440705 ?auto_440708 ) ) ( not ( = ?auto_440705 ?auto_440709 ) ) ( not ( = ?auto_440705 ?auto_440710 ) ) ( not ( = ?auto_440705 ?auto_440711 ) ) ( not ( = ?auto_440705 ?auto_440712 ) ) ( not ( = ?auto_440705 ?auto_440713 ) ) ( not ( = ?auto_440705 ?auto_440714 ) ) ( not ( = ?auto_440705 ?auto_440715 ) ) ( not ( = ?auto_440705 ?auto_440716 ) ) ( not ( = ?auto_440706 ?auto_440707 ) ) ( not ( = ?auto_440706 ?auto_440708 ) ) ( not ( = ?auto_440706 ?auto_440709 ) ) ( not ( = ?auto_440706 ?auto_440710 ) ) ( not ( = ?auto_440706 ?auto_440711 ) ) ( not ( = ?auto_440706 ?auto_440712 ) ) ( not ( = ?auto_440706 ?auto_440713 ) ) ( not ( = ?auto_440706 ?auto_440714 ) ) ( not ( = ?auto_440706 ?auto_440715 ) ) ( not ( = ?auto_440706 ?auto_440716 ) ) ( not ( = ?auto_440707 ?auto_440708 ) ) ( not ( = ?auto_440707 ?auto_440709 ) ) ( not ( = ?auto_440707 ?auto_440710 ) ) ( not ( = ?auto_440707 ?auto_440711 ) ) ( not ( = ?auto_440707 ?auto_440712 ) ) ( not ( = ?auto_440707 ?auto_440713 ) ) ( not ( = ?auto_440707 ?auto_440714 ) ) ( not ( = ?auto_440707 ?auto_440715 ) ) ( not ( = ?auto_440707 ?auto_440716 ) ) ( not ( = ?auto_440708 ?auto_440709 ) ) ( not ( = ?auto_440708 ?auto_440710 ) ) ( not ( = ?auto_440708 ?auto_440711 ) ) ( not ( = ?auto_440708 ?auto_440712 ) ) ( not ( = ?auto_440708 ?auto_440713 ) ) ( not ( = ?auto_440708 ?auto_440714 ) ) ( not ( = ?auto_440708 ?auto_440715 ) ) ( not ( = ?auto_440708 ?auto_440716 ) ) ( not ( = ?auto_440709 ?auto_440710 ) ) ( not ( = ?auto_440709 ?auto_440711 ) ) ( not ( = ?auto_440709 ?auto_440712 ) ) ( not ( = ?auto_440709 ?auto_440713 ) ) ( not ( = ?auto_440709 ?auto_440714 ) ) ( not ( = ?auto_440709 ?auto_440715 ) ) ( not ( = ?auto_440709 ?auto_440716 ) ) ( not ( = ?auto_440710 ?auto_440711 ) ) ( not ( = ?auto_440710 ?auto_440712 ) ) ( not ( = ?auto_440710 ?auto_440713 ) ) ( not ( = ?auto_440710 ?auto_440714 ) ) ( not ( = ?auto_440710 ?auto_440715 ) ) ( not ( = ?auto_440710 ?auto_440716 ) ) ( not ( = ?auto_440711 ?auto_440712 ) ) ( not ( = ?auto_440711 ?auto_440713 ) ) ( not ( = ?auto_440711 ?auto_440714 ) ) ( not ( = ?auto_440711 ?auto_440715 ) ) ( not ( = ?auto_440711 ?auto_440716 ) ) ( not ( = ?auto_440712 ?auto_440713 ) ) ( not ( = ?auto_440712 ?auto_440714 ) ) ( not ( = ?auto_440712 ?auto_440715 ) ) ( not ( = ?auto_440712 ?auto_440716 ) ) ( not ( = ?auto_440713 ?auto_440714 ) ) ( not ( = ?auto_440713 ?auto_440715 ) ) ( not ( = ?auto_440713 ?auto_440716 ) ) ( not ( = ?auto_440714 ?auto_440715 ) ) ( not ( = ?auto_440714 ?auto_440716 ) ) ( not ( = ?auto_440715 ?auto_440716 ) ) ( ON ?auto_440714 ?auto_440715 ) ( ON ?auto_440713 ?auto_440714 ) ( ON ?auto_440712 ?auto_440713 ) ( CLEAR ?auto_440710 ) ( ON ?auto_440711 ?auto_440712 ) ( CLEAR ?auto_440711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_440705 ?auto_440706 ?auto_440707 ?auto_440708 ?auto_440709 ?auto_440710 ?auto_440711 )
      ( MAKE-11PILE ?auto_440705 ?auto_440706 ?auto_440707 ?auto_440708 ?auto_440709 ?auto_440710 ?auto_440711 ?auto_440712 ?auto_440713 ?auto_440714 ?auto_440715 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440751 - BLOCK
      ?auto_440752 - BLOCK
      ?auto_440753 - BLOCK
      ?auto_440754 - BLOCK
      ?auto_440755 - BLOCK
      ?auto_440756 - BLOCK
      ?auto_440757 - BLOCK
      ?auto_440758 - BLOCK
      ?auto_440759 - BLOCK
      ?auto_440760 - BLOCK
      ?auto_440761 - BLOCK
    )
    :vars
    (
      ?auto_440762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440761 ?auto_440762 ) ( ON-TABLE ?auto_440751 ) ( ON ?auto_440752 ?auto_440751 ) ( ON ?auto_440753 ?auto_440752 ) ( ON ?auto_440754 ?auto_440753 ) ( ON ?auto_440755 ?auto_440754 ) ( not ( = ?auto_440751 ?auto_440752 ) ) ( not ( = ?auto_440751 ?auto_440753 ) ) ( not ( = ?auto_440751 ?auto_440754 ) ) ( not ( = ?auto_440751 ?auto_440755 ) ) ( not ( = ?auto_440751 ?auto_440756 ) ) ( not ( = ?auto_440751 ?auto_440757 ) ) ( not ( = ?auto_440751 ?auto_440758 ) ) ( not ( = ?auto_440751 ?auto_440759 ) ) ( not ( = ?auto_440751 ?auto_440760 ) ) ( not ( = ?auto_440751 ?auto_440761 ) ) ( not ( = ?auto_440751 ?auto_440762 ) ) ( not ( = ?auto_440752 ?auto_440753 ) ) ( not ( = ?auto_440752 ?auto_440754 ) ) ( not ( = ?auto_440752 ?auto_440755 ) ) ( not ( = ?auto_440752 ?auto_440756 ) ) ( not ( = ?auto_440752 ?auto_440757 ) ) ( not ( = ?auto_440752 ?auto_440758 ) ) ( not ( = ?auto_440752 ?auto_440759 ) ) ( not ( = ?auto_440752 ?auto_440760 ) ) ( not ( = ?auto_440752 ?auto_440761 ) ) ( not ( = ?auto_440752 ?auto_440762 ) ) ( not ( = ?auto_440753 ?auto_440754 ) ) ( not ( = ?auto_440753 ?auto_440755 ) ) ( not ( = ?auto_440753 ?auto_440756 ) ) ( not ( = ?auto_440753 ?auto_440757 ) ) ( not ( = ?auto_440753 ?auto_440758 ) ) ( not ( = ?auto_440753 ?auto_440759 ) ) ( not ( = ?auto_440753 ?auto_440760 ) ) ( not ( = ?auto_440753 ?auto_440761 ) ) ( not ( = ?auto_440753 ?auto_440762 ) ) ( not ( = ?auto_440754 ?auto_440755 ) ) ( not ( = ?auto_440754 ?auto_440756 ) ) ( not ( = ?auto_440754 ?auto_440757 ) ) ( not ( = ?auto_440754 ?auto_440758 ) ) ( not ( = ?auto_440754 ?auto_440759 ) ) ( not ( = ?auto_440754 ?auto_440760 ) ) ( not ( = ?auto_440754 ?auto_440761 ) ) ( not ( = ?auto_440754 ?auto_440762 ) ) ( not ( = ?auto_440755 ?auto_440756 ) ) ( not ( = ?auto_440755 ?auto_440757 ) ) ( not ( = ?auto_440755 ?auto_440758 ) ) ( not ( = ?auto_440755 ?auto_440759 ) ) ( not ( = ?auto_440755 ?auto_440760 ) ) ( not ( = ?auto_440755 ?auto_440761 ) ) ( not ( = ?auto_440755 ?auto_440762 ) ) ( not ( = ?auto_440756 ?auto_440757 ) ) ( not ( = ?auto_440756 ?auto_440758 ) ) ( not ( = ?auto_440756 ?auto_440759 ) ) ( not ( = ?auto_440756 ?auto_440760 ) ) ( not ( = ?auto_440756 ?auto_440761 ) ) ( not ( = ?auto_440756 ?auto_440762 ) ) ( not ( = ?auto_440757 ?auto_440758 ) ) ( not ( = ?auto_440757 ?auto_440759 ) ) ( not ( = ?auto_440757 ?auto_440760 ) ) ( not ( = ?auto_440757 ?auto_440761 ) ) ( not ( = ?auto_440757 ?auto_440762 ) ) ( not ( = ?auto_440758 ?auto_440759 ) ) ( not ( = ?auto_440758 ?auto_440760 ) ) ( not ( = ?auto_440758 ?auto_440761 ) ) ( not ( = ?auto_440758 ?auto_440762 ) ) ( not ( = ?auto_440759 ?auto_440760 ) ) ( not ( = ?auto_440759 ?auto_440761 ) ) ( not ( = ?auto_440759 ?auto_440762 ) ) ( not ( = ?auto_440760 ?auto_440761 ) ) ( not ( = ?auto_440760 ?auto_440762 ) ) ( not ( = ?auto_440761 ?auto_440762 ) ) ( ON ?auto_440760 ?auto_440761 ) ( ON ?auto_440759 ?auto_440760 ) ( ON ?auto_440758 ?auto_440759 ) ( ON ?auto_440757 ?auto_440758 ) ( CLEAR ?auto_440755 ) ( ON ?auto_440756 ?auto_440757 ) ( CLEAR ?auto_440756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_440751 ?auto_440752 ?auto_440753 ?auto_440754 ?auto_440755 ?auto_440756 )
      ( MAKE-11PILE ?auto_440751 ?auto_440752 ?auto_440753 ?auto_440754 ?auto_440755 ?auto_440756 ?auto_440757 ?auto_440758 ?auto_440759 ?auto_440760 ?auto_440761 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440797 - BLOCK
      ?auto_440798 - BLOCK
      ?auto_440799 - BLOCK
      ?auto_440800 - BLOCK
      ?auto_440801 - BLOCK
      ?auto_440802 - BLOCK
      ?auto_440803 - BLOCK
      ?auto_440804 - BLOCK
      ?auto_440805 - BLOCK
      ?auto_440806 - BLOCK
      ?auto_440807 - BLOCK
    )
    :vars
    (
      ?auto_440808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440807 ?auto_440808 ) ( ON-TABLE ?auto_440797 ) ( ON ?auto_440798 ?auto_440797 ) ( ON ?auto_440799 ?auto_440798 ) ( ON ?auto_440800 ?auto_440799 ) ( not ( = ?auto_440797 ?auto_440798 ) ) ( not ( = ?auto_440797 ?auto_440799 ) ) ( not ( = ?auto_440797 ?auto_440800 ) ) ( not ( = ?auto_440797 ?auto_440801 ) ) ( not ( = ?auto_440797 ?auto_440802 ) ) ( not ( = ?auto_440797 ?auto_440803 ) ) ( not ( = ?auto_440797 ?auto_440804 ) ) ( not ( = ?auto_440797 ?auto_440805 ) ) ( not ( = ?auto_440797 ?auto_440806 ) ) ( not ( = ?auto_440797 ?auto_440807 ) ) ( not ( = ?auto_440797 ?auto_440808 ) ) ( not ( = ?auto_440798 ?auto_440799 ) ) ( not ( = ?auto_440798 ?auto_440800 ) ) ( not ( = ?auto_440798 ?auto_440801 ) ) ( not ( = ?auto_440798 ?auto_440802 ) ) ( not ( = ?auto_440798 ?auto_440803 ) ) ( not ( = ?auto_440798 ?auto_440804 ) ) ( not ( = ?auto_440798 ?auto_440805 ) ) ( not ( = ?auto_440798 ?auto_440806 ) ) ( not ( = ?auto_440798 ?auto_440807 ) ) ( not ( = ?auto_440798 ?auto_440808 ) ) ( not ( = ?auto_440799 ?auto_440800 ) ) ( not ( = ?auto_440799 ?auto_440801 ) ) ( not ( = ?auto_440799 ?auto_440802 ) ) ( not ( = ?auto_440799 ?auto_440803 ) ) ( not ( = ?auto_440799 ?auto_440804 ) ) ( not ( = ?auto_440799 ?auto_440805 ) ) ( not ( = ?auto_440799 ?auto_440806 ) ) ( not ( = ?auto_440799 ?auto_440807 ) ) ( not ( = ?auto_440799 ?auto_440808 ) ) ( not ( = ?auto_440800 ?auto_440801 ) ) ( not ( = ?auto_440800 ?auto_440802 ) ) ( not ( = ?auto_440800 ?auto_440803 ) ) ( not ( = ?auto_440800 ?auto_440804 ) ) ( not ( = ?auto_440800 ?auto_440805 ) ) ( not ( = ?auto_440800 ?auto_440806 ) ) ( not ( = ?auto_440800 ?auto_440807 ) ) ( not ( = ?auto_440800 ?auto_440808 ) ) ( not ( = ?auto_440801 ?auto_440802 ) ) ( not ( = ?auto_440801 ?auto_440803 ) ) ( not ( = ?auto_440801 ?auto_440804 ) ) ( not ( = ?auto_440801 ?auto_440805 ) ) ( not ( = ?auto_440801 ?auto_440806 ) ) ( not ( = ?auto_440801 ?auto_440807 ) ) ( not ( = ?auto_440801 ?auto_440808 ) ) ( not ( = ?auto_440802 ?auto_440803 ) ) ( not ( = ?auto_440802 ?auto_440804 ) ) ( not ( = ?auto_440802 ?auto_440805 ) ) ( not ( = ?auto_440802 ?auto_440806 ) ) ( not ( = ?auto_440802 ?auto_440807 ) ) ( not ( = ?auto_440802 ?auto_440808 ) ) ( not ( = ?auto_440803 ?auto_440804 ) ) ( not ( = ?auto_440803 ?auto_440805 ) ) ( not ( = ?auto_440803 ?auto_440806 ) ) ( not ( = ?auto_440803 ?auto_440807 ) ) ( not ( = ?auto_440803 ?auto_440808 ) ) ( not ( = ?auto_440804 ?auto_440805 ) ) ( not ( = ?auto_440804 ?auto_440806 ) ) ( not ( = ?auto_440804 ?auto_440807 ) ) ( not ( = ?auto_440804 ?auto_440808 ) ) ( not ( = ?auto_440805 ?auto_440806 ) ) ( not ( = ?auto_440805 ?auto_440807 ) ) ( not ( = ?auto_440805 ?auto_440808 ) ) ( not ( = ?auto_440806 ?auto_440807 ) ) ( not ( = ?auto_440806 ?auto_440808 ) ) ( not ( = ?auto_440807 ?auto_440808 ) ) ( ON ?auto_440806 ?auto_440807 ) ( ON ?auto_440805 ?auto_440806 ) ( ON ?auto_440804 ?auto_440805 ) ( ON ?auto_440803 ?auto_440804 ) ( ON ?auto_440802 ?auto_440803 ) ( CLEAR ?auto_440800 ) ( ON ?auto_440801 ?auto_440802 ) ( CLEAR ?auto_440801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_440797 ?auto_440798 ?auto_440799 ?auto_440800 ?auto_440801 )
      ( MAKE-11PILE ?auto_440797 ?auto_440798 ?auto_440799 ?auto_440800 ?auto_440801 ?auto_440802 ?auto_440803 ?auto_440804 ?auto_440805 ?auto_440806 ?auto_440807 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440843 - BLOCK
      ?auto_440844 - BLOCK
      ?auto_440845 - BLOCK
      ?auto_440846 - BLOCK
      ?auto_440847 - BLOCK
      ?auto_440848 - BLOCK
      ?auto_440849 - BLOCK
      ?auto_440850 - BLOCK
      ?auto_440851 - BLOCK
      ?auto_440852 - BLOCK
      ?auto_440853 - BLOCK
    )
    :vars
    (
      ?auto_440854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440853 ?auto_440854 ) ( ON-TABLE ?auto_440843 ) ( ON ?auto_440844 ?auto_440843 ) ( ON ?auto_440845 ?auto_440844 ) ( not ( = ?auto_440843 ?auto_440844 ) ) ( not ( = ?auto_440843 ?auto_440845 ) ) ( not ( = ?auto_440843 ?auto_440846 ) ) ( not ( = ?auto_440843 ?auto_440847 ) ) ( not ( = ?auto_440843 ?auto_440848 ) ) ( not ( = ?auto_440843 ?auto_440849 ) ) ( not ( = ?auto_440843 ?auto_440850 ) ) ( not ( = ?auto_440843 ?auto_440851 ) ) ( not ( = ?auto_440843 ?auto_440852 ) ) ( not ( = ?auto_440843 ?auto_440853 ) ) ( not ( = ?auto_440843 ?auto_440854 ) ) ( not ( = ?auto_440844 ?auto_440845 ) ) ( not ( = ?auto_440844 ?auto_440846 ) ) ( not ( = ?auto_440844 ?auto_440847 ) ) ( not ( = ?auto_440844 ?auto_440848 ) ) ( not ( = ?auto_440844 ?auto_440849 ) ) ( not ( = ?auto_440844 ?auto_440850 ) ) ( not ( = ?auto_440844 ?auto_440851 ) ) ( not ( = ?auto_440844 ?auto_440852 ) ) ( not ( = ?auto_440844 ?auto_440853 ) ) ( not ( = ?auto_440844 ?auto_440854 ) ) ( not ( = ?auto_440845 ?auto_440846 ) ) ( not ( = ?auto_440845 ?auto_440847 ) ) ( not ( = ?auto_440845 ?auto_440848 ) ) ( not ( = ?auto_440845 ?auto_440849 ) ) ( not ( = ?auto_440845 ?auto_440850 ) ) ( not ( = ?auto_440845 ?auto_440851 ) ) ( not ( = ?auto_440845 ?auto_440852 ) ) ( not ( = ?auto_440845 ?auto_440853 ) ) ( not ( = ?auto_440845 ?auto_440854 ) ) ( not ( = ?auto_440846 ?auto_440847 ) ) ( not ( = ?auto_440846 ?auto_440848 ) ) ( not ( = ?auto_440846 ?auto_440849 ) ) ( not ( = ?auto_440846 ?auto_440850 ) ) ( not ( = ?auto_440846 ?auto_440851 ) ) ( not ( = ?auto_440846 ?auto_440852 ) ) ( not ( = ?auto_440846 ?auto_440853 ) ) ( not ( = ?auto_440846 ?auto_440854 ) ) ( not ( = ?auto_440847 ?auto_440848 ) ) ( not ( = ?auto_440847 ?auto_440849 ) ) ( not ( = ?auto_440847 ?auto_440850 ) ) ( not ( = ?auto_440847 ?auto_440851 ) ) ( not ( = ?auto_440847 ?auto_440852 ) ) ( not ( = ?auto_440847 ?auto_440853 ) ) ( not ( = ?auto_440847 ?auto_440854 ) ) ( not ( = ?auto_440848 ?auto_440849 ) ) ( not ( = ?auto_440848 ?auto_440850 ) ) ( not ( = ?auto_440848 ?auto_440851 ) ) ( not ( = ?auto_440848 ?auto_440852 ) ) ( not ( = ?auto_440848 ?auto_440853 ) ) ( not ( = ?auto_440848 ?auto_440854 ) ) ( not ( = ?auto_440849 ?auto_440850 ) ) ( not ( = ?auto_440849 ?auto_440851 ) ) ( not ( = ?auto_440849 ?auto_440852 ) ) ( not ( = ?auto_440849 ?auto_440853 ) ) ( not ( = ?auto_440849 ?auto_440854 ) ) ( not ( = ?auto_440850 ?auto_440851 ) ) ( not ( = ?auto_440850 ?auto_440852 ) ) ( not ( = ?auto_440850 ?auto_440853 ) ) ( not ( = ?auto_440850 ?auto_440854 ) ) ( not ( = ?auto_440851 ?auto_440852 ) ) ( not ( = ?auto_440851 ?auto_440853 ) ) ( not ( = ?auto_440851 ?auto_440854 ) ) ( not ( = ?auto_440852 ?auto_440853 ) ) ( not ( = ?auto_440852 ?auto_440854 ) ) ( not ( = ?auto_440853 ?auto_440854 ) ) ( ON ?auto_440852 ?auto_440853 ) ( ON ?auto_440851 ?auto_440852 ) ( ON ?auto_440850 ?auto_440851 ) ( ON ?auto_440849 ?auto_440850 ) ( ON ?auto_440848 ?auto_440849 ) ( ON ?auto_440847 ?auto_440848 ) ( CLEAR ?auto_440845 ) ( ON ?auto_440846 ?auto_440847 ) ( CLEAR ?auto_440846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_440843 ?auto_440844 ?auto_440845 ?auto_440846 )
      ( MAKE-11PILE ?auto_440843 ?auto_440844 ?auto_440845 ?auto_440846 ?auto_440847 ?auto_440848 ?auto_440849 ?auto_440850 ?auto_440851 ?auto_440852 ?auto_440853 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440889 - BLOCK
      ?auto_440890 - BLOCK
      ?auto_440891 - BLOCK
      ?auto_440892 - BLOCK
      ?auto_440893 - BLOCK
      ?auto_440894 - BLOCK
      ?auto_440895 - BLOCK
      ?auto_440896 - BLOCK
      ?auto_440897 - BLOCK
      ?auto_440898 - BLOCK
      ?auto_440899 - BLOCK
    )
    :vars
    (
      ?auto_440900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440899 ?auto_440900 ) ( ON-TABLE ?auto_440889 ) ( ON ?auto_440890 ?auto_440889 ) ( not ( = ?auto_440889 ?auto_440890 ) ) ( not ( = ?auto_440889 ?auto_440891 ) ) ( not ( = ?auto_440889 ?auto_440892 ) ) ( not ( = ?auto_440889 ?auto_440893 ) ) ( not ( = ?auto_440889 ?auto_440894 ) ) ( not ( = ?auto_440889 ?auto_440895 ) ) ( not ( = ?auto_440889 ?auto_440896 ) ) ( not ( = ?auto_440889 ?auto_440897 ) ) ( not ( = ?auto_440889 ?auto_440898 ) ) ( not ( = ?auto_440889 ?auto_440899 ) ) ( not ( = ?auto_440889 ?auto_440900 ) ) ( not ( = ?auto_440890 ?auto_440891 ) ) ( not ( = ?auto_440890 ?auto_440892 ) ) ( not ( = ?auto_440890 ?auto_440893 ) ) ( not ( = ?auto_440890 ?auto_440894 ) ) ( not ( = ?auto_440890 ?auto_440895 ) ) ( not ( = ?auto_440890 ?auto_440896 ) ) ( not ( = ?auto_440890 ?auto_440897 ) ) ( not ( = ?auto_440890 ?auto_440898 ) ) ( not ( = ?auto_440890 ?auto_440899 ) ) ( not ( = ?auto_440890 ?auto_440900 ) ) ( not ( = ?auto_440891 ?auto_440892 ) ) ( not ( = ?auto_440891 ?auto_440893 ) ) ( not ( = ?auto_440891 ?auto_440894 ) ) ( not ( = ?auto_440891 ?auto_440895 ) ) ( not ( = ?auto_440891 ?auto_440896 ) ) ( not ( = ?auto_440891 ?auto_440897 ) ) ( not ( = ?auto_440891 ?auto_440898 ) ) ( not ( = ?auto_440891 ?auto_440899 ) ) ( not ( = ?auto_440891 ?auto_440900 ) ) ( not ( = ?auto_440892 ?auto_440893 ) ) ( not ( = ?auto_440892 ?auto_440894 ) ) ( not ( = ?auto_440892 ?auto_440895 ) ) ( not ( = ?auto_440892 ?auto_440896 ) ) ( not ( = ?auto_440892 ?auto_440897 ) ) ( not ( = ?auto_440892 ?auto_440898 ) ) ( not ( = ?auto_440892 ?auto_440899 ) ) ( not ( = ?auto_440892 ?auto_440900 ) ) ( not ( = ?auto_440893 ?auto_440894 ) ) ( not ( = ?auto_440893 ?auto_440895 ) ) ( not ( = ?auto_440893 ?auto_440896 ) ) ( not ( = ?auto_440893 ?auto_440897 ) ) ( not ( = ?auto_440893 ?auto_440898 ) ) ( not ( = ?auto_440893 ?auto_440899 ) ) ( not ( = ?auto_440893 ?auto_440900 ) ) ( not ( = ?auto_440894 ?auto_440895 ) ) ( not ( = ?auto_440894 ?auto_440896 ) ) ( not ( = ?auto_440894 ?auto_440897 ) ) ( not ( = ?auto_440894 ?auto_440898 ) ) ( not ( = ?auto_440894 ?auto_440899 ) ) ( not ( = ?auto_440894 ?auto_440900 ) ) ( not ( = ?auto_440895 ?auto_440896 ) ) ( not ( = ?auto_440895 ?auto_440897 ) ) ( not ( = ?auto_440895 ?auto_440898 ) ) ( not ( = ?auto_440895 ?auto_440899 ) ) ( not ( = ?auto_440895 ?auto_440900 ) ) ( not ( = ?auto_440896 ?auto_440897 ) ) ( not ( = ?auto_440896 ?auto_440898 ) ) ( not ( = ?auto_440896 ?auto_440899 ) ) ( not ( = ?auto_440896 ?auto_440900 ) ) ( not ( = ?auto_440897 ?auto_440898 ) ) ( not ( = ?auto_440897 ?auto_440899 ) ) ( not ( = ?auto_440897 ?auto_440900 ) ) ( not ( = ?auto_440898 ?auto_440899 ) ) ( not ( = ?auto_440898 ?auto_440900 ) ) ( not ( = ?auto_440899 ?auto_440900 ) ) ( ON ?auto_440898 ?auto_440899 ) ( ON ?auto_440897 ?auto_440898 ) ( ON ?auto_440896 ?auto_440897 ) ( ON ?auto_440895 ?auto_440896 ) ( ON ?auto_440894 ?auto_440895 ) ( ON ?auto_440893 ?auto_440894 ) ( ON ?auto_440892 ?auto_440893 ) ( CLEAR ?auto_440890 ) ( ON ?auto_440891 ?auto_440892 ) ( CLEAR ?auto_440891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_440889 ?auto_440890 ?auto_440891 )
      ( MAKE-11PILE ?auto_440889 ?auto_440890 ?auto_440891 ?auto_440892 ?auto_440893 ?auto_440894 ?auto_440895 ?auto_440896 ?auto_440897 ?auto_440898 ?auto_440899 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440935 - BLOCK
      ?auto_440936 - BLOCK
      ?auto_440937 - BLOCK
      ?auto_440938 - BLOCK
      ?auto_440939 - BLOCK
      ?auto_440940 - BLOCK
      ?auto_440941 - BLOCK
      ?auto_440942 - BLOCK
      ?auto_440943 - BLOCK
      ?auto_440944 - BLOCK
      ?auto_440945 - BLOCK
    )
    :vars
    (
      ?auto_440946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440945 ?auto_440946 ) ( ON-TABLE ?auto_440935 ) ( not ( = ?auto_440935 ?auto_440936 ) ) ( not ( = ?auto_440935 ?auto_440937 ) ) ( not ( = ?auto_440935 ?auto_440938 ) ) ( not ( = ?auto_440935 ?auto_440939 ) ) ( not ( = ?auto_440935 ?auto_440940 ) ) ( not ( = ?auto_440935 ?auto_440941 ) ) ( not ( = ?auto_440935 ?auto_440942 ) ) ( not ( = ?auto_440935 ?auto_440943 ) ) ( not ( = ?auto_440935 ?auto_440944 ) ) ( not ( = ?auto_440935 ?auto_440945 ) ) ( not ( = ?auto_440935 ?auto_440946 ) ) ( not ( = ?auto_440936 ?auto_440937 ) ) ( not ( = ?auto_440936 ?auto_440938 ) ) ( not ( = ?auto_440936 ?auto_440939 ) ) ( not ( = ?auto_440936 ?auto_440940 ) ) ( not ( = ?auto_440936 ?auto_440941 ) ) ( not ( = ?auto_440936 ?auto_440942 ) ) ( not ( = ?auto_440936 ?auto_440943 ) ) ( not ( = ?auto_440936 ?auto_440944 ) ) ( not ( = ?auto_440936 ?auto_440945 ) ) ( not ( = ?auto_440936 ?auto_440946 ) ) ( not ( = ?auto_440937 ?auto_440938 ) ) ( not ( = ?auto_440937 ?auto_440939 ) ) ( not ( = ?auto_440937 ?auto_440940 ) ) ( not ( = ?auto_440937 ?auto_440941 ) ) ( not ( = ?auto_440937 ?auto_440942 ) ) ( not ( = ?auto_440937 ?auto_440943 ) ) ( not ( = ?auto_440937 ?auto_440944 ) ) ( not ( = ?auto_440937 ?auto_440945 ) ) ( not ( = ?auto_440937 ?auto_440946 ) ) ( not ( = ?auto_440938 ?auto_440939 ) ) ( not ( = ?auto_440938 ?auto_440940 ) ) ( not ( = ?auto_440938 ?auto_440941 ) ) ( not ( = ?auto_440938 ?auto_440942 ) ) ( not ( = ?auto_440938 ?auto_440943 ) ) ( not ( = ?auto_440938 ?auto_440944 ) ) ( not ( = ?auto_440938 ?auto_440945 ) ) ( not ( = ?auto_440938 ?auto_440946 ) ) ( not ( = ?auto_440939 ?auto_440940 ) ) ( not ( = ?auto_440939 ?auto_440941 ) ) ( not ( = ?auto_440939 ?auto_440942 ) ) ( not ( = ?auto_440939 ?auto_440943 ) ) ( not ( = ?auto_440939 ?auto_440944 ) ) ( not ( = ?auto_440939 ?auto_440945 ) ) ( not ( = ?auto_440939 ?auto_440946 ) ) ( not ( = ?auto_440940 ?auto_440941 ) ) ( not ( = ?auto_440940 ?auto_440942 ) ) ( not ( = ?auto_440940 ?auto_440943 ) ) ( not ( = ?auto_440940 ?auto_440944 ) ) ( not ( = ?auto_440940 ?auto_440945 ) ) ( not ( = ?auto_440940 ?auto_440946 ) ) ( not ( = ?auto_440941 ?auto_440942 ) ) ( not ( = ?auto_440941 ?auto_440943 ) ) ( not ( = ?auto_440941 ?auto_440944 ) ) ( not ( = ?auto_440941 ?auto_440945 ) ) ( not ( = ?auto_440941 ?auto_440946 ) ) ( not ( = ?auto_440942 ?auto_440943 ) ) ( not ( = ?auto_440942 ?auto_440944 ) ) ( not ( = ?auto_440942 ?auto_440945 ) ) ( not ( = ?auto_440942 ?auto_440946 ) ) ( not ( = ?auto_440943 ?auto_440944 ) ) ( not ( = ?auto_440943 ?auto_440945 ) ) ( not ( = ?auto_440943 ?auto_440946 ) ) ( not ( = ?auto_440944 ?auto_440945 ) ) ( not ( = ?auto_440944 ?auto_440946 ) ) ( not ( = ?auto_440945 ?auto_440946 ) ) ( ON ?auto_440944 ?auto_440945 ) ( ON ?auto_440943 ?auto_440944 ) ( ON ?auto_440942 ?auto_440943 ) ( ON ?auto_440941 ?auto_440942 ) ( ON ?auto_440940 ?auto_440941 ) ( ON ?auto_440939 ?auto_440940 ) ( ON ?auto_440938 ?auto_440939 ) ( ON ?auto_440937 ?auto_440938 ) ( CLEAR ?auto_440935 ) ( ON ?auto_440936 ?auto_440937 ) ( CLEAR ?auto_440936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_440935 ?auto_440936 )
      ( MAKE-11PILE ?auto_440935 ?auto_440936 ?auto_440937 ?auto_440938 ?auto_440939 ?auto_440940 ?auto_440941 ?auto_440942 ?auto_440943 ?auto_440944 ?auto_440945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_440981 - BLOCK
      ?auto_440982 - BLOCK
      ?auto_440983 - BLOCK
      ?auto_440984 - BLOCK
      ?auto_440985 - BLOCK
      ?auto_440986 - BLOCK
      ?auto_440987 - BLOCK
      ?auto_440988 - BLOCK
      ?auto_440989 - BLOCK
      ?auto_440990 - BLOCK
      ?auto_440991 - BLOCK
    )
    :vars
    (
      ?auto_440992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_440991 ?auto_440992 ) ( not ( = ?auto_440981 ?auto_440982 ) ) ( not ( = ?auto_440981 ?auto_440983 ) ) ( not ( = ?auto_440981 ?auto_440984 ) ) ( not ( = ?auto_440981 ?auto_440985 ) ) ( not ( = ?auto_440981 ?auto_440986 ) ) ( not ( = ?auto_440981 ?auto_440987 ) ) ( not ( = ?auto_440981 ?auto_440988 ) ) ( not ( = ?auto_440981 ?auto_440989 ) ) ( not ( = ?auto_440981 ?auto_440990 ) ) ( not ( = ?auto_440981 ?auto_440991 ) ) ( not ( = ?auto_440981 ?auto_440992 ) ) ( not ( = ?auto_440982 ?auto_440983 ) ) ( not ( = ?auto_440982 ?auto_440984 ) ) ( not ( = ?auto_440982 ?auto_440985 ) ) ( not ( = ?auto_440982 ?auto_440986 ) ) ( not ( = ?auto_440982 ?auto_440987 ) ) ( not ( = ?auto_440982 ?auto_440988 ) ) ( not ( = ?auto_440982 ?auto_440989 ) ) ( not ( = ?auto_440982 ?auto_440990 ) ) ( not ( = ?auto_440982 ?auto_440991 ) ) ( not ( = ?auto_440982 ?auto_440992 ) ) ( not ( = ?auto_440983 ?auto_440984 ) ) ( not ( = ?auto_440983 ?auto_440985 ) ) ( not ( = ?auto_440983 ?auto_440986 ) ) ( not ( = ?auto_440983 ?auto_440987 ) ) ( not ( = ?auto_440983 ?auto_440988 ) ) ( not ( = ?auto_440983 ?auto_440989 ) ) ( not ( = ?auto_440983 ?auto_440990 ) ) ( not ( = ?auto_440983 ?auto_440991 ) ) ( not ( = ?auto_440983 ?auto_440992 ) ) ( not ( = ?auto_440984 ?auto_440985 ) ) ( not ( = ?auto_440984 ?auto_440986 ) ) ( not ( = ?auto_440984 ?auto_440987 ) ) ( not ( = ?auto_440984 ?auto_440988 ) ) ( not ( = ?auto_440984 ?auto_440989 ) ) ( not ( = ?auto_440984 ?auto_440990 ) ) ( not ( = ?auto_440984 ?auto_440991 ) ) ( not ( = ?auto_440984 ?auto_440992 ) ) ( not ( = ?auto_440985 ?auto_440986 ) ) ( not ( = ?auto_440985 ?auto_440987 ) ) ( not ( = ?auto_440985 ?auto_440988 ) ) ( not ( = ?auto_440985 ?auto_440989 ) ) ( not ( = ?auto_440985 ?auto_440990 ) ) ( not ( = ?auto_440985 ?auto_440991 ) ) ( not ( = ?auto_440985 ?auto_440992 ) ) ( not ( = ?auto_440986 ?auto_440987 ) ) ( not ( = ?auto_440986 ?auto_440988 ) ) ( not ( = ?auto_440986 ?auto_440989 ) ) ( not ( = ?auto_440986 ?auto_440990 ) ) ( not ( = ?auto_440986 ?auto_440991 ) ) ( not ( = ?auto_440986 ?auto_440992 ) ) ( not ( = ?auto_440987 ?auto_440988 ) ) ( not ( = ?auto_440987 ?auto_440989 ) ) ( not ( = ?auto_440987 ?auto_440990 ) ) ( not ( = ?auto_440987 ?auto_440991 ) ) ( not ( = ?auto_440987 ?auto_440992 ) ) ( not ( = ?auto_440988 ?auto_440989 ) ) ( not ( = ?auto_440988 ?auto_440990 ) ) ( not ( = ?auto_440988 ?auto_440991 ) ) ( not ( = ?auto_440988 ?auto_440992 ) ) ( not ( = ?auto_440989 ?auto_440990 ) ) ( not ( = ?auto_440989 ?auto_440991 ) ) ( not ( = ?auto_440989 ?auto_440992 ) ) ( not ( = ?auto_440990 ?auto_440991 ) ) ( not ( = ?auto_440990 ?auto_440992 ) ) ( not ( = ?auto_440991 ?auto_440992 ) ) ( ON ?auto_440990 ?auto_440991 ) ( ON ?auto_440989 ?auto_440990 ) ( ON ?auto_440988 ?auto_440989 ) ( ON ?auto_440987 ?auto_440988 ) ( ON ?auto_440986 ?auto_440987 ) ( ON ?auto_440985 ?auto_440986 ) ( ON ?auto_440984 ?auto_440985 ) ( ON ?auto_440983 ?auto_440984 ) ( ON ?auto_440982 ?auto_440983 ) ( ON ?auto_440981 ?auto_440982 ) ( CLEAR ?auto_440981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_440981 )
      ( MAKE-11PILE ?auto_440981 ?auto_440982 ?auto_440983 ?auto_440984 ?auto_440985 ?auto_440986 ?auto_440987 ?auto_440988 ?auto_440989 ?auto_440990 ?auto_440991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441028 - BLOCK
      ?auto_441029 - BLOCK
      ?auto_441030 - BLOCK
      ?auto_441031 - BLOCK
      ?auto_441032 - BLOCK
      ?auto_441033 - BLOCK
      ?auto_441034 - BLOCK
      ?auto_441035 - BLOCK
      ?auto_441036 - BLOCK
      ?auto_441037 - BLOCK
      ?auto_441038 - BLOCK
      ?auto_441039 - BLOCK
    )
    :vars
    (
      ?auto_441040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_441038 ) ( ON ?auto_441039 ?auto_441040 ) ( CLEAR ?auto_441039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_441028 ) ( ON ?auto_441029 ?auto_441028 ) ( ON ?auto_441030 ?auto_441029 ) ( ON ?auto_441031 ?auto_441030 ) ( ON ?auto_441032 ?auto_441031 ) ( ON ?auto_441033 ?auto_441032 ) ( ON ?auto_441034 ?auto_441033 ) ( ON ?auto_441035 ?auto_441034 ) ( ON ?auto_441036 ?auto_441035 ) ( ON ?auto_441037 ?auto_441036 ) ( ON ?auto_441038 ?auto_441037 ) ( not ( = ?auto_441028 ?auto_441029 ) ) ( not ( = ?auto_441028 ?auto_441030 ) ) ( not ( = ?auto_441028 ?auto_441031 ) ) ( not ( = ?auto_441028 ?auto_441032 ) ) ( not ( = ?auto_441028 ?auto_441033 ) ) ( not ( = ?auto_441028 ?auto_441034 ) ) ( not ( = ?auto_441028 ?auto_441035 ) ) ( not ( = ?auto_441028 ?auto_441036 ) ) ( not ( = ?auto_441028 ?auto_441037 ) ) ( not ( = ?auto_441028 ?auto_441038 ) ) ( not ( = ?auto_441028 ?auto_441039 ) ) ( not ( = ?auto_441028 ?auto_441040 ) ) ( not ( = ?auto_441029 ?auto_441030 ) ) ( not ( = ?auto_441029 ?auto_441031 ) ) ( not ( = ?auto_441029 ?auto_441032 ) ) ( not ( = ?auto_441029 ?auto_441033 ) ) ( not ( = ?auto_441029 ?auto_441034 ) ) ( not ( = ?auto_441029 ?auto_441035 ) ) ( not ( = ?auto_441029 ?auto_441036 ) ) ( not ( = ?auto_441029 ?auto_441037 ) ) ( not ( = ?auto_441029 ?auto_441038 ) ) ( not ( = ?auto_441029 ?auto_441039 ) ) ( not ( = ?auto_441029 ?auto_441040 ) ) ( not ( = ?auto_441030 ?auto_441031 ) ) ( not ( = ?auto_441030 ?auto_441032 ) ) ( not ( = ?auto_441030 ?auto_441033 ) ) ( not ( = ?auto_441030 ?auto_441034 ) ) ( not ( = ?auto_441030 ?auto_441035 ) ) ( not ( = ?auto_441030 ?auto_441036 ) ) ( not ( = ?auto_441030 ?auto_441037 ) ) ( not ( = ?auto_441030 ?auto_441038 ) ) ( not ( = ?auto_441030 ?auto_441039 ) ) ( not ( = ?auto_441030 ?auto_441040 ) ) ( not ( = ?auto_441031 ?auto_441032 ) ) ( not ( = ?auto_441031 ?auto_441033 ) ) ( not ( = ?auto_441031 ?auto_441034 ) ) ( not ( = ?auto_441031 ?auto_441035 ) ) ( not ( = ?auto_441031 ?auto_441036 ) ) ( not ( = ?auto_441031 ?auto_441037 ) ) ( not ( = ?auto_441031 ?auto_441038 ) ) ( not ( = ?auto_441031 ?auto_441039 ) ) ( not ( = ?auto_441031 ?auto_441040 ) ) ( not ( = ?auto_441032 ?auto_441033 ) ) ( not ( = ?auto_441032 ?auto_441034 ) ) ( not ( = ?auto_441032 ?auto_441035 ) ) ( not ( = ?auto_441032 ?auto_441036 ) ) ( not ( = ?auto_441032 ?auto_441037 ) ) ( not ( = ?auto_441032 ?auto_441038 ) ) ( not ( = ?auto_441032 ?auto_441039 ) ) ( not ( = ?auto_441032 ?auto_441040 ) ) ( not ( = ?auto_441033 ?auto_441034 ) ) ( not ( = ?auto_441033 ?auto_441035 ) ) ( not ( = ?auto_441033 ?auto_441036 ) ) ( not ( = ?auto_441033 ?auto_441037 ) ) ( not ( = ?auto_441033 ?auto_441038 ) ) ( not ( = ?auto_441033 ?auto_441039 ) ) ( not ( = ?auto_441033 ?auto_441040 ) ) ( not ( = ?auto_441034 ?auto_441035 ) ) ( not ( = ?auto_441034 ?auto_441036 ) ) ( not ( = ?auto_441034 ?auto_441037 ) ) ( not ( = ?auto_441034 ?auto_441038 ) ) ( not ( = ?auto_441034 ?auto_441039 ) ) ( not ( = ?auto_441034 ?auto_441040 ) ) ( not ( = ?auto_441035 ?auto_441036 ) ) ( not ( = ?auto_441035 ?auto_441037 ) ) ( not ( = ?auto_441035 ?auto_441038 ) ) ( not ( = ?auto_441035 ?auto_441039 ) ) ( not ( = ?auto_441035 ?auto_441040 ) ) ( not ( = ?auto_441036 ?auto_441037 ) ) ( not ( = ?auto_441036 ?auto_441038 ) ) ( not ( = ?auto_441036 ?auto_441039 ) ) ( not ( = ?auto_441036 ?auto_441040 ) ) ( not ( = ?auto_441037 ?auto_441038 ) ) ( not ( = ?auto_441037 ?auto_441039 ) ) ( not ( = ?auto_441037 ?auto_441040 ) ) ( not ( = ?auto_441038 ?auto_441039 ) ) ( not ( = ?auto_441038 ?auto_441040 ) ) ( not ( = ?auto_441039 ?auto_441040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_441039 ?auto_441040 )
      ( !STACK ?auto_441039 ?auto_441038 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441078 - BLOCK
      ?auto_441079 - BLOCK
      ?auto_441080 - BLOCK
      ?auto_441081 - BLOCK
      ?auto_441082 - BLOCK
      ?auto_441083 - BLOCK
      ?auto_441084 - BLOCK
      ?auto_441085 - BLOCK
      ?auto_441086 - BLOCK
      ?auto_441087 - BLOCK
      ?auto_441088 - BLOCK
      ?auto_441089 - BLOCK
    )
    :vars
    (
      ?auto_441090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441089 ?auto_441090 ) ( ON-TABLE ?auto_441078 ) ( ON ?auto_441079 ?auto_441078 ) ( ON ?auto_441080 ?auto_441079 ) ( ON ?auto_441081 ?auto_441080 ) ( ON ?auto_441082 ?auto_441081 ) ( ON ?auto_441083 ?auto_441082 ) ( ON ?auto_441084 ?auto_441083 ) ( ON ?auto_441085 ?auto_441084 ) ( ON ?auto_441086 ?auto_441085 ) ( ON ?auto_441087 ?auto_441086 ) ( not ( = ?auto_441078 ?auto_441079 ) ) ( not ( = ?auto_441078 ?auto_441080 ) ) ( not ( = ?auto_441078 ?auto_441081 ) ) ( not ( = ?auto_441078 ?auto_441082 ) ) ( not ( = ?auto_441078 ?auto_441083 ) ) ( not ( = ?auto_441078 ?auto_441084 ) ) ( not ( = ?auto_441078 ?auto_441085 ) ) ( not ( = ?auto_441078 ?auto_441086 ) ) ( not ( = ?auto_441078 ?auto_441087 ) ) ( not ( = ?auto_441078 ?auto_441088 ) ) ( not ( = ?auto_441078 ?auto_441089 ) ) ( not ( = ?auto_441078 ?auto_441090 ) ) ( not ( = ?auto_441079 ?auto_441080 ) ) ( not ( = ?auto_441079 ?auto_441081 ) ) ( not ( = ?auto_441079 ?auto_441082 ) ) ( not ( = ?auto_441079 ?auto_441083 ) ) ( not ( = ?auto_441079 ?auto_441084 ) ) ( not ( = ?auto_441079 ?auto_441085 ) ) ( not ( = ?auto_441079 ?auto_441086 ) ) ( not ( = ?auto_441079 ?auto_441087 ) ) ( not ( = ?auto_441079 ?auto_441088 ) ) ( not ( = ?auto_441079 ?auto_441089 ) ) ( not ( = ?auto_441079 ?auto_441090 ) ) ( not ( = ?auto_441080 ?auto_441081 ) ) ( not ( = ?auto_441080 ?auto_441082 ) ) ( not ( = ?auto_441080 ?auto_441083 ) ) ( not ( = ?auto_441080 ?auto_441084 ) ) ( not ( = ?auto_441080 ?auto_441085 ) ) ( not ( = ?auto_441080 ?auto_441086 ) ) ( not ( = ?auto_441080 ?auto_441087 ) ) ( not ( = ?auto_441080 ?auto_441088 ) ) ( not ( = ?auto_441080 ?auto_441089 ) ) ( not ( = ?auto_441080 ?auto_441090 ) ) ( not ( = ?auto_441081 ?auto_441082 ) ) ( not ( = ?auto_441081 ?auto_441083 ) ) ( not ( = ?auto_441081 ?auto_441084 ) ) ( not ( = ?auto_441081 ?auto_441085 ) ) ( not ( = ?auto_441081 ?auto_441086 ) ) ( not ( = ?auto_441081 ?auto_441087 ) ) ( not ( = ?auto_441081 ?auto_441088 ) ) ( not ( = ?auto_441081 ?auto_441089 ) ) ( not ( = ?auto_441081 ?auto_441090 ) ) ( not ( = ?auto_441082 ?auto_441083 ) ) ( not ( = ?auto_441082 ?auto_441084 ) ) ( not ( = ?auto_441082 ?auto_441085 ) ) ( not ( = ?auto_441082 ?auto_441086 ) ) ( not ( = ?auto_441082 ?auto_441087 ) ) ( not ( = ?auto_441082 ?auto_441088 ) ) ( not ( = ?auto_441082 ?auto_441089 ) ) ( not ( = ?auto_441082 ?auto_441090 ) ) ( not ( = ?auto_441083 ?auto_441084 ) ) ( not ( = ?auto_441083 ?auto_441085 ) ) ( not ( = ?auto_441083 ?auto_441086 ) ) ( not ( = ?auto_441083 ?auto_441087 ) ) ( not ( = ?auto_441083 ?auto_441088 ) ) ( not ( = ?auto_441083 ?auto_441089 ) ) ( not ( = ?auto_441083 ?auto_441090 ) ) ( not ( = ?auto_441084 ?auto_441085 ) ) ( not ( = ?auto_441084 ?auto_441086 ) ) ( not ( = ?auto_441084 ?auto_441087 ) ) ( not ( = ?auto_441084 ?auto_441088 ) ) ( not ( = ?auto_441084 ?auto_441089 ) ) ( not ( = ?auto_441084 ?auto_441090 ) ) ( not ( = ?auto_441085 ?auto_441086 ) ) ( not ( = ?auto_441085 ?auto_441087 ) ) ( not ( = ?auto_441085 ?auto_441088 ) ) ( not ( = ?auto_441085 ?auto_441089 ) ) ( not ( = ?auto_441085 ?auto_441090 ) ) ( not ( = ?auto_441086 ?auto_441087 ) ) ( not ( = ?auto_441086 ?auto_441088 ) ) ( not ( = ?auto_441086 ?auto_441089 ) ) ( not ( = ?auto_441086 ?auto_441090 ) ) ( not ( = ?auto_441087 ?auto_441088 ) ) ( not ( = ?auto_441087 ?auto_441089 ) ) ( not ( = ?auto_441087 ?auto_441090 ) ) ( not ( = ?auto_441088 ?auto_441089 ) ) ( not ( = ?auto_441088 ?auto_441090 ) ) ( not ( = ?auto_441089 ?auto_441090 ) ) ( CLEAR ?auto_441087 ) ( ON ?auto_441088 ?auto_441089 ) ( CLEAR ?auto_441088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_441078 ?auto_441079 ?auto_441080 ?auto_441081 ?auto_441082 ?auto_441083 ?auto_441084 ?auto_441085 ?auto_441086 ?auto_441087 ?auto_441088 )
      ( MAKE-12PILE ?auto_441078 ?auto_441079 ?auto_441080 ?auto_441081 ?auto_441082 ?auto_441083 ?auto_441084 ?auto_441085 ?auto_441086 ?auto_441087 ?auto_441088 ?auto_441089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441128 - BLOCK
      ?auto_441129 - BLOCK
      ?auto_441130 - BLOCK
      ?auto_441131 - BLOCK
      ?auto_441132 - BLOCK
      ?auto_441133 - BLOCK
      ?auto_441134 - BLOCK
      ?auto_441135 - BLOCK
      ?auto_441136 - BLOCK
      ?auto_441137 - BLOCK
      ?auto_441138 - BLOCK
      ?auto_441139 - BLOCK
    )
    :vars
    (
      ?auto_441140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441139 ?auto_441140 ) ( ON-TABLE ?auto_441128 ) ( ON ?auto_441129 ?auto_441128 ) ( ON ?auto_441130 ?auto_441129 ) ( ON ?auto_441131 ?auto_441130 ) ( ON ?auto_441132 ?auto_441131 ) ( ON ?auto_441133 ?auto_441132 ) ( ON ?auto_441134 ?auto_441133 ) ( ON ?auto_441135 ?auto_441134 ) ( ON ?auto_441136 ?auto_441135 ) ( not ( = ?auto_441128 ?auto_441129 ) ) ( not ( = ?auto_441128 ?auto_441130 ) ) ( not ( = ?auto_441128 ?auto_441131 ) ) ( not ( = ?auto_441128 ?auto_441132 ) ) ( not ( = ?auto_441128 ?auto_441133 ) ) ( not ( = ?auto_441128 ?auto_441134 ) ) ( not ( = ?auto_441128 ?auto_441135 ) ) ( not ( = ?auto_441128 ?auto_441136 ) ) ( not ( = ?auto_441128 ?auto_441137 ) ) ( not ( = ?auto_441128 ?auto_441138 ) ) ( not ( = ?auto_441128 ?auto_441139 ) ) ( not ( = ?auto_441128 ?auto_441140 ) ) ( not ( = ?auto_441129 ?auto_441130 ) ) ( not ( = ?auto_441129 ?auto_441131 ) ) ( not ( = ?auto_441129 ?auto_441132 ) ) ( not ( = ?auto_441129 ?auto_441133 ) ) ( not ( = ?auto_441129 ?auto_441134 ) ) ( not ( = ?auto_441129 ?auto_441135 ) ) ( not ( = ?auto_441129 ?auto_441136 ) ) ( not ( = ?auto_441129 ?auto_441137 ) ) ( not ( = ?auto_441129 ?auto_441138 ) ) ( not ( = ?auto_441129 ?auto_441139 ) ) ( not ( = ?auto_441129 ?auto_441140 ) ) ( not ( = ?auto_441130 ?auto_441131 ) ) ( not ( = ?auto_441130 ?auto_441132 ) ) ( not ( = ?auto_441130 ?auto_441133 ) ) ( not ( = ?auto_441130 ?auto_441134 ) ) ( not ( = ?auto_441130 ?auto_441135 ) ) ( not ( = ?auto_441130 ?auto_441136 ) ) ( not ( = ?auto_441130 ?auto_441137 ) ) ( not ( = ?auto_441130 ?auto_441138 ) ) ( not ( = ?auto_441130 ?auto_441139 ) ) ( not ( = ?auto_441130 ?auto_441140 ) ) ( not ( = ?auto_441131 ?auto_441132 ) ) ( not ( = ?auto_441131 ?auto_441133 ) ) ( not ( = ?auto_441131 ?auto_441134 ) ) ( not ( = ?auto_441131 ?auto_441135 ) ) ( not ( = ?auto_441131 ?auto_441136 ) ) ( not ( = ?auto_441131 ?auto_441137 ) ) ( not ( = ?auto_441131 ?auto_441138 ) ) ( not ( = ?auto_441131 ?auto_441139 ) ) ( not ( = ?auto_441131 ?auto_441140 ) ) ( not ( = ?auto_441132 ?auto_441133 ) ) ( not ( = ?auto_441132 ?auto_441134 ) ) ( not ( = ?auto_441132 ?auto_441135 ) ) ( not ( = ?auto_441132 ?auto_441136 ) ) ( not ( = ?auto_441132 ?auto_441137 ) ) ( not ( = ?auto_441132 ?auto_441138 ) ) ( not ( = ?auto_441132 ?auto_441139 ) ) ( not ( = ?auto_441132 ?auto_441140 ) ) ( not ( = ?auto_441133 ?auto_441134 ) ) ( not ( = ?auto_441133 ?auto_441135 ) ) ( not ( = ?auto_441133 ?auto_441136 ) ) ( not ( = ?auto_441133 ?auto_441137 ) ) ( not ( = ?auto_441133 ?auto_441138 ) ) ( not ( = ?auto_441133 ?auto_441139 ) ) ( not ( = ?auto_441133 ?auto_441140 ) ) ( not ( = ?auto_441134 ?auto_441135 ) ) ( not ( = ?auto_441134 ?auto_441136 ) ) ( not ( = ?auto_441134 ?auto_441137 ) ) ( not ( = ?auto_441134 ?auto_441138 ) ) ( not ( = ?auto_441134 ?auto_441139 ) ) ( not ( = ?auto_441134 ?auto_441140 ) ) ( not ( = ?auto_441135 ?auto_441136 ) ) ( not ( = ?auto_441135 ?auto_441137 ) ) ( not ( = ?auto_441135 ?auto_441138 ) ) ( not ( = ?auto_441135 ?auto_441139 ) ) ( not ( = ?auto_441135 ?auto_441140 ) ) ( not ( = ?auto_441136 ?auto_441137 ) ) ( not ( = ?auto_441136 ?auto_441138 ) ) ( not ( = ?auto_441136 ?auto_441139 ) ) ( not ( = ?auto_441136 ?auto_441140 ) ) ( not ( = ?auto_441137 ?auto_441138 ) ) ( not ( = ?auto_441137 ?auto_441139 ) ) ( not ( = ?auto_441137 ?auto_441140 ) ) ( not ( = ?auto_441138 ?auto_441139 ) ) ( not ( = ?auto_441138 ?auto_441140 ) ) ( not ( = ?auto_441139 ?auto_441140 ) ) ( ON ?auto_441138 ?auto_441139 ) ( CLEAR ?auto_441136 ) ( ON ?auto_441137 ?auto_441138 ) ( CLEAR ?auto_441137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_441128 ?auto_441129 ?auto_441130 ?auto_441131 ?auto_441132 ?auto_441133 ?auto_441134 ?auto_441135 ?auto_441136 ?auto_441137 )
      ( MAKE-12PILE ?auto_441128 ?auto_441129 ?auto_441130 ?auto_441131 ?auto_441132 ?auto_441133 ?auto_441134 ?auto_441135 ?auto_441136 ?auto_441137 ?auto_441138 ?auto_441139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441178 - BLOCK
      ?auto_441179 - BLOCK
      ?auto_441180 - BLOCK
      ?auto_441181 - BLOCK
      ?auto_441182 - BLOCK
      ?auto_441183 - BLOCK
      ?auto_441184 - BLOCK
      ?auto_441185 - BLOCK
      ?auto_441186 - BLOCK
      ?auto_441187 - BLOCK
      ?auto_441188 - BLOCK
      ?auto_441189 - BLOCK
    )
    :vars
    (
      ?auto_441190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441189 ?auto_441190 ) ( ON-TABLE ?auto_441178 ) ( ON ?auto_441179 ?auto_441178 ) ( ON ?auto_441180 ?auto_441179 ) ( ON ?auto_441181 ?auto_441180 ) ( ON ?auto_441182 ?auto_441181 ) ( ON ?auto_441183 ?auto_441182 ) ( ON ?auto_441184 ?auto_441183 ) ( ON ?auto_441185 ?auto_441184 ) ( not ( = ?auto_441178 ?auto_441179 ) ) ( not ( = ?auto_441178 ?auto_441180 ) ) ( not ( = ?auto_441178 ?auto_441181 ) ) ( not ( = ?auto_441178 ?auto_441182 ) ) ( not ( = ?auto_441178 ?auto_441183 ) ) ( not ( = ?auto_441178 ?auto_441184 ) ) ( not ( = ?auto_441178 ?auto_441185 ) ) ( not ( = ?auto_441178 ?auto_441186 ) ) ( not ( = ?auto_441178 ?auto_441187 ) ) ( not ( = ?auto_441178 ?auto_441188 ) ) ( not ( = ?auto_441178 ?auto_441189 ) ) ( not ( = ?auto_441178 ?auto_441190 ) ) ( not ( = ?auto_441179 ?auto_441180 ) ) ( not ( = ?auto_441179 ?auto_441181 ) ) ( not ( = ?auto_441179 ?auto_441182 ) ) ( not ( = ?auto_441179 ?auto_441183 ) ) ( not ( = ?auto_441179 ?auto_441184 ) ) ( not ( = ?auto_441179 ?auto_441185 ) ) ( not ( = ?auto_441179 ?auto_441186 ) ) ( not ( = ?auto_441179 ?auto_441187 ) ) ( not ( = ?auto_441179 ?auto_441188 ) ) ( not ( = ?auto_441179 ?auto_441189 ) ) ( not ( = ?auto_441179 ?auto_441190 ) ) ( not ( = ?auto_441180 ?auto_441181 ) ) ( not ( = ?auto_441180 ?auto_441182 ) ) ( not ( = ?auto_441180 ?auto_441183 ) ) ( not ( = ?auto_441180 ?auto_441184 ) ) ( not ( = ?auto_441180 ?auto_441185 ) ) ( not ( = ?auto_441180 ?auto_441186 ) ) ( not ( = ?auto_441180 ?auto_441187 ) ) ( not ( = ?auto_441180 ?auto_441188 ) ) ( not ( = ?auto_441180 ?auto_441189 ) ) ( not ( = ?auto_441180 ?auto_441190 ) ) ( not ( = ?auto_441181 ?auto_441182 ) ) ( not ( = ?auto_441181 ?auto_441183 ) ) ( not ( = ?auto_441181 ?auto_441184 ) ) ( not ( = ?auto_441181 ?auto_441185 ) ) ( not ( = ?auto_441181 ?auto_441186 ) ) ( not ( = ?auto_441181 ?auto_441187 ) ) ( not ( = ?auto_441181 ?auto_441188 ) ) ( not ( = ?auto_441181 ?auto_441189 ) ) ( not ( = ?auto_441181 ?auto_441190 ) ) ( not ( = ?auto_441182 ?auto_441183 ) ) ( not ( = ?auto_441182 ?auto_441184 ) ) ( not ( = ?auto_441182 ?auto_441185 ) ) ( not ( = ?auto_441182 ?auto_441186 ) ) ( not ( = ?auto_441182 ?auto_441187 ) ) ( not ( = ?auto_441182 ?auto_441188 ) ) ( not ( = ?auto_441182 ?auto_441189 ) ) ( not ( = ?auto_441182 ?auto_441190 ) ) ( not ( = ?auto_441183 ?auto_441184 ) ) ( not ( = ?auto_441183 ?auto_441185 ) ) ( not ( = ?auto_441183 ?auto_441186 ) ) ( not ( = ?auto_441183 ?auto_441187 ) ) ( not ( = ?auto_441183 ?auto_441188 ) ) ( not ( = ?auto_441183 ?auto_441189 ) ) ( not ( = ?auto_441183 ?auto_441190 ) ) ( not ( = ?auto_441184 ?auto_441185 ) ) ( not ( = ?auto_441184 ?auto_441186 ) ) ( not ( = ?auto_441184 ?auto_441187 ) ) ( not ( = ?auto_441184 ?auto_441188 ) ) ( not ( = ?auto_441184 ?auto_441189 ) ) ( not ( = ?auto_441184 ?auto_441190 ) ) ( not ( = ?auto_441185 ?auto_441186 ) ) ( not ( = ?auto_441185 ?auto_441187 ) ) ( not ( = ?auto_441185 ?auto_441188 ) ) ( not ( = ?auto_441185 ?auto_441189 ) ) ( not ( = ?auto_441185 ?auto_441190 ) ) ( not ( = ?auto_441186 ?auto_441187 ) ) ( not ( = ?auto_441186 ?auto_441188 ) ) ( not ( = ?auto_441186 ?auto_441189 ) ) ( not ( = ?auto_441186 ?auto_441190 ) ) ( not ( = ?auto_441187 ?auto_441188 ) ) ( not ( = ?auto_441187 ?auto_441189 ) ) ( not ( = ?auto_441187 ?auto_441190 ) ) ( not ( = ?auto_441188 ?auto_441189 ) ) ( not ( = ?auto_441188 ?auto_441190 ) ) ( not ( = ?auto_441189 ?auto_441190 ) ) ( ON ?auto_441188 ?auto_441189 ) ( ON ?auto_441187 ?auto_441188 ) ( CLEAR ?auto_441185 ) ( ON ?auto_441186 ?auto_441187 ) ( CLEAR ?auto_441186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_441178 ?auto_441179 ?auto_441180 ?auto_441181 ?auto_441182 ?auto_441183 ?auto_441184 ?auto_441185 ?auto_441186 )
      ( MAKE-12PILE ?auto_441178 ?auto_441179 ?auto_441180 ?auto_441181 ?auto_441182 ?auto_441183 ?auto_441184 ?auto_441185 ?auto_441186 ?auto_441187 ?auto_441188 ?auto_441189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441228 - BLOCK
      ?auto_441229 - BLOCK
      ?auto_441230 - BLOCK
      ?auto_441231 - BLOCK
      ?auto_441232 - BLOCK
      ?auto_441233 - BLOCK
      ?auto_441234 - BLOCK
      ?auto_441235 - BLOCK
      ?auto_441236 - BLOCK
      ?auto_441237 - BLOCK
      ?auto_441238 - BLOCK
      ?auto_441239 - BLOCK
    )
    :vars
    (
      ?auto_441240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441239 ?auto_441240 ) ( ON-TABLE ?auto_441228 ) ( ON ?auto_441229 ?auto_441228 ) ( ON ?auto_441230 ?auto_441229 ) ( ON ?auto_441231 ?auto_441230 ) ( ON ?auto_441232 ?auto_441231 ) ( ON ?auto_441233 ?auto_441232 ) ( ON ?auto_441234 ?auto_441233 ) ( not ( = ?auto_441228 ?auto_441229 ) ) ( not ( = ?auto_441228 ?auto_441230 ) ) ( not ( = ?auto_441228 ?auto_441231 ) ) ( not ( = ?auto_441228 ?auto_441232 ) ) ( not ( = ?auto_441228 ?auto_441233 ) ) ( not ( = ?auto_441228 ?auto_441234 ) ) ( not ( = ?auto_441228 ?auto_441235 ) ) ( not ( = ?auto_441228 ?auto_441236 ) ) ( not ( = ?auto_441228 ?auto_441237 ) ) ( not ( = ?auto_441228 ?auto_441238 ) ) ( not ( = ?auto_441228 ?auto_441239 ) ) ( not ( = ?auto_441228 ?auto_441240 ) ) ( not ( = ?auto_441229 ?auto_441230 ) ) ( not ( = ?auto_441229 ?auto_441231 ) ) ( not ( = ?auto_441229 ?auto_441232 ) ) ( not ( = ?auto_441229 ?auto_441233 ) ) ( not ( = ?auto_441229 ?auto_441234 ) ) ( not ( = ?auto_441229 ?auto_441235 ) ) ( not ( = ?auto_441229 ?auto_441236 ) ) ( not ( = ?auto_441229 ?auto_441237 ) ) ( not ( = ?auto_441229 ?auto_441238 ) ) ( not ( = ?auto_441229 ?auto_441239 ) ) ( not ( = ?auto_441229 ?auto_441240 ) ) ( not ( = ?auto_441230 ?auto_441231 ) ) ( not ( = ?auto_441230 ?auto_441232 ) ) ( not ( = ?auto_441230 ?auto_441233 ) ) ( not ( = ?auto_441230 ?auto_441234 ) ) ( not ( = ?auto_441230 ?auto_441235 ) ) ( not ( = ?auto_441230 ?auto_441236 ) ) ( not ( = ?auto_441230 ?auto_441237 ) ) ( not ( = ?auto_441230 ?auto_441238 ) ) ( not ( = ?auto_441230 ?auto_441239 ) ) ( not ( = ?auto_441230 ?auto_441240 ) ) ( not ( = ?auto_441231 ?auto_441232 ) ) ( not ( = ?auto_441231 ?auto_441233 ) ) ( not ( = ?auto_441231 ?auto_441234 ) ) ( not ( = ?auto_441231 ?auto_441235 ) ) ( not ( = ?auto_441231 ?auto_441236 ) ) ( not ( = ?auto_441231 ?auto_441237 ) ) ( not ( = ?auto_441231 ?auto_441238 ) ) ( not ( = ?auto_441231 ?auto_441239 ) ) ( not ( = ?auto_441231 ?auto_441240 ) ) ( not ( = ?auto_441232 ?auto_441233 ) ) ( not ( = ?auto_441232 ?auto_441234 ) ) ( not ( = ?auto_441232 ?auto_441235 ) ) ( not ( = ?auto_441232 ?auto_441236 ) ) ( not ( = ?auto_441232 ?auto_441237 ) ) ( not ( = ?auto_441232 ?auto_441238 ) ) ( not ( = ?auto_441232 ?auto_441239 ) ) ( not ( = ?auto_441232 ?auto_441240 ) ) ( not ( = ?auto_441233 ?auto_441234 ) ) ( not ( = ?auto_441233 ?auto_441235 ) ) ( not ( = ?auto_441233 ?auto_441236 ) ) ( not ( = ?auto_441233 ?auto_441237 ) ) ( not ( = ?auto_441233 ?auto_441238 ) ) ( not ( = ?auto_441233 ?auto_441239 ) ) ( not ( = ?auto_441233 ?auto_441240 ) ) ( not ( = ?auto_441234 ?auto_441235 ) ) ( not ( = ?auto_441234 ?auto_441236 ) ) ( not ( = ?auto_441234 ?auto_441237 ) ) ( not ( = ?auto_441234 ?auto_441238 ) ) ( not ( = ?auto_441234 ?auto_441239 ) ) ( not ( = ?auto_441234 ?auto_441240 ) ) ( not ( = ?auto_441235 ?auto_441236 ) ) ( not ( = ?auto_441235 ?auto_441237 ) ) ( not ( = ?auto_441235 ?auto_441238 ) ) ( not ( = ?auto_441235 ?auto_441239 ) ) ( not ( = ?auto_441235 ?auto_441240 ) ) ( not ( = ?auto_441236 ?auto_441237 ) ) ( not ( = ?auto_441236 ?auto_441238 ) ) ( not ( = ?auto_441236 ?auto_441239 ) ) ( not ( = ?auto_441236 ?auto_441240 ) ) ( not ( = ?auto_441237 ?auto_441238 ) ) ( not ( = ?auto_441237 ?auto_441239 ) ) ( not ( = ?auto_441237 ?auto_441240 ) ) ( not ( = ?auto_441238 ?auto_441239 ) ) ( not ( = ?auto_441238 ?auto_441240 ) ) ( not ( = ?auto_441239 ?auto_441240 ) ) ( ON ?auto_441238 ?auto_441239 ) ( ON ?auto_441237 ?auto_441238 ) ( ON ?auto_441236 ?auto_441237 ) ( CLEAR ?auto_441234 ) ( ON ?auto_441235 ?auto_441236 ) ( CLEAR ?auto_441235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_441228 ?auto_441229 ?auto_441230 ?auto_441231 ?auto_441232 ?auto_441233 ?auto_441234 ?auto_441235 )
      ( MAKE-12PILE ?auto_441228 ?auto_441229 ?auto_441230 ?auto_441231 ?auto_441232 ?auto_441233 ?auto_441234 ?auto_441235 ?auto_441236 ?auto_441237 ?auto_441238 ?auto_441239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441278 - BLOCK
      ?auto_441279 - BLOCK
      ?auto_441280 - BLOCK
      ?auto_441281 - BLOCK
      ?auto_441282 - BLOCK
      ?auto_441283 - BLOCK
      ?auto_441284 - BLOCK
      ?auto_441285 - BLOCK
      ?auto_441286 - BLOCK
      ?auto_441287 - BLOCK
      ?auto_441288 - BLOCK
      ?auto_441289 - BLOCK
    )
    :vars
    (
      ?auto_441290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441289 ?auto_441290 ) ( ON-TABLE ?auto_441278 ) ( ON ?auto_441279 ?auto_441278 ) ( ON ?auto_441280 ?auto_441279 ) ( ON ?auto_441281 ?auto_441280 ) ( ON ?auto_441282 ?auto_441281 ) ( ON ?auto_441283 ?auto_441282 ) ( not ( = ?auto_441278 ?auto_441279 ) ) ( not ( = ?auto_441278 ?auto_441280 ) ) ( not ( = ?auto_441278 ?auto_441281 ) ) ( not ( = ?auto_441278 ?auto_441282 ) ) ( not ( = ?auto_441278 ?auto_441283 ) ) ( not ( = ?auto_441278 ?auto_441284 ) ) ( not ( = ?auto_441278 ?auto_441285 ) ) ( not ( = ?auto_441278 ?auto_441286 ) ) ( not ( = ?auto_441278 ?auto_441287 ) ) ( not ( = ?auto_441278 ?auto_441288 ) ) ( not ( = ?auto_441278 ?auto_441289 ) ) ( not ( = ?auto_441278 ?auto_441290 ) ) ( not ( = ?auto_441279 ?auto_441280 ) ) ( not ( = ?auto_441279 ?auto_441281 ) ) ( not ( = ?auto_441279 ?auto_441282 ) ) ( not ( = ?auto_441279 ?auto_441283 ) ) ( not ( = ?auto_441279 ?auto_441284 ) ) ( not ( = ?auto_441279 ?auto_441285 ) ) ( not ( = ?auto_441279 ?auto_441286 ) ) ( not ( = ?auto_441279 ?auto_441287 ) ) ( not ( = ?auto_441279 ?auto_441288 ) ) ( not ( = ?auto_441279 ?auto_441289 ) ) ( not ( = ?auto_441279 ?auto_441290 ) ) ( not ( = ?auto_441280 ?auto_441281 ) ) ( not ( = ?auto_441280 ?auto_441282 ) ) ( not ( = ?auto_441280 ?auto_441283 ) ) ( not ( = ?auto_441280 ?auto_441284 ) ) ( not ( = ?auto_441280 ?auto_441285 ) ) ( not ( = ?auto_441280 ?auto_441286 ) ) ( not ( = ?auto_441280 ?auto_441287 ) ) ( not ( = ?auto_441280 ?auto_441288 ) ) ( not ( = ?auto_441280 ?auto_441289 ) ) ( not ( = ?auto_441280 ?auto_441290 ) ) ( not ( = ?auto_441281 ?auto_441282 ) ) ( not ( = ?auto_441281 ?auto_441283 ) ) ( not ( = ?auto_441281 ?auto_441284 ) ) ( not ( = ?auto_441281 ?auto_441285 ) ) ( not ( = ?auto_441281 ?auto_441286 ) ) ( not ( = ?auto_441281 ?auto_441287 ) ) ( not ( = ?auto_441281 ?auto_441288 ) ) ( not ( = ?auto_441281 ?auto_441289 ) ) ( not ( = ?auto_441281 ?auto_441290 ) ) ( not ( = ?auto_441282 ?auto_441283 ) ) ( not ( = ?auto_441282 ?auto_441284 ) ) ( not ( = ?auto_441282 ?auto_441285 ) ) ( not ( = ?auto_441282 ?auto_441286 ) ) ( not ( = ?auto_441282 ?auto_441287 ) ) ( not ( = ?auto_441282 ?auto_441288 ) ) ( not ( = ?auto_441282 ?auto_441289 ) ) ( not ( = ?auto_441282 ?auto_441290 ) ) ( not ( = ?auto_441283 ?auto_441284 ) ) ( not ( = ?auto_441283 ?auto_441285 ) ) ( not ( = ?auto_441283 ?auto_441286 ) ) ( not ( = ?auto_441283 ?auto_441287 ) ) ( not ( = ?auto_441283 ?auto_441288 ) ) ( not ( = ?auto_441283 ?auto_441289 ) ) ( not ( = ?auto_441283 ?auto_441290 ) ) ( not ( = ?auto_441284 ?auto_441285 ) ) ( not ( = ?auto_441284 ?auto_441286 ) ) ( not ( = ?auto_441284 ?auto_441287 ) ) ( not ( = ?auto_441284 ?auto_441288 ) ) ( not ( = ?auto_441284 ?auto_441289 ) ) ( not ( = ?auto_441284 ?auto_441290 ) ) ( not ( = ?auto_441285 ?auto_441286 ) ) ( not ( = ?auto_441285 ?auto_441287 ) ) ( not ( = ?auto_441285 ?auto_441288 ) ) ( not ( = ?auto_441285 ?auto_441289 ) ) ( not ( = ?auto_441285 ?auto_441290 ) ) ( not ( = ?auto_441286 ?auto_441287 ) ) ( not ( = ?auto_441286 ?auto_441288 ) ) ( not ( = ?auto_441286 ?auto_441289 ) ) ( not ( = ?auto_441286 ?auto_441290 ) ) ( not ( = ?auto_441287 ?auto_441288 ) ) ( not ( = ?auto_441287 ?auto_441289 ) ) ( not ( = ?auto_441287 ?auto_441290 ) ) ( not ( = ?auto_441288 ?auto_441289 ) ) ( not ( = ?auto_441288 ?auto_441290 ) ) ( not ( = ?auto_441289 ?auto_441290 ) ) ( ON ?auto_441288 ?auto_441289 ) ( ON ?auto_441287 ?auto_441288 ) ( ON ?auto_441286 ?auto_441287 ) ( ON ?auto_441285 ?auto_441286 ) ( CLEAR ?auto_441283 ) ( ON ?auto_441284 ?auto_441285 ) ( CLEAR ?auto_441284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_441278 ?auto_441279 ?auto_441280 ?auto_441281 ?auto_441282 ?auto_441283 ?auto_441284 )
      ( MAKE-12PILE ?auto_441278 ?auto_441279 ?auto_441280 ?auto_441281 ?auto_441282 ?auto_441283 ?auto_441284 ?auto_441285 ?auto_441286 ?auto_441287 ?auto_441288 ?auto_441289 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441328 - BLOCK
      ?auto_441329 - BLOCK
      ?auto_441330 - BLOCK
      ?auto_441331 - BLOCK
      ?auto_441332 - BLOCK
      ?auto_441333 - BLOCK
      ?auto_441334 - BLOCK
      ?auto_441335 - BLOCK
      ?auto_441336 - BLOCK
      ?auto_441337 - BLOCK
      ?auto_441338 - BLOCK
      ?auto_441339 - BLOCK
    )
    :vars
    (
      ?auto_441340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441339 ?auto_441340 ) ( ON-TABLE ?auto_441328 ) ( ON ?auto_441329 ?auto_441328 ) ( ON ?auto_441330 ?auto_441329 ) ( ON ?auto_441331 ?auto_441330 ) ( ON ?auto_441332 ?auto_441331 ) ( not ( = ?auto_441328 ?auto_441329 ) ) ( not ( = ?auto_441328 ?auto_441330 ) ) ( not ( = ?auto_441328 ?auto_441331 ) ) ( not ( = ?auto_441328 ?auto_441332 ) ) ( not ( = ?auto_441328 ?auto_441333 ) ) ( not ( = ?auto_441328 ?auto_441334 ) ) ( not ( = ?auto_441328 ?auto_441335 ) ) ( not ( = ?auto_441328 ?auto_441336 ) ) ( not ( = ?auto_441328 ?auto_441337 ) ) ( not ( = ?auto_441328 ?auto_441338 ) ) ( not ( = ?auto_441328 ?auto_441339 ) ) ( not ( = ?auto_441328 ?auto_441340 ) ) ( not ( = ?auto_441329 ?auto_441330 ) ) ( not ( = ?auto_441329 ?auto_441331 ) ) ( not ( = ?auto_441329 ?auto_441332 ) ) ( not ( = ?auto_441329 ?auto_441333 ) ) ( not ( = ?auto_441329 ?auto_441334 ) ) ( not ( = ?auto_441329 ?auto_441335 ) ) ( not ( = ?auto_441329 ?auto_441336 ) ) ( not ( = ?auto_441329 ?auto_441337 ) ) ( not ( = ?auto_441329 ?auto_441338 ) ) ( not ( = ?auto_441329 ?auto_441339 ) ) ( not ( = ?auto_441329 ?auto_441340 ) ) ( not ( = ?auto_441330 ?auto_441331 ) ) ( not ( = ?auto_441330 ?auto_441332 ) ) ( not ( = ?auto_441330 ?auto_441333 ) ) ( not ( = ?auto_441330 ?auto_441334 ) ) ( not ( = ?auto_441330 ?auto_441335 ) ) ( not ( = ?auto_441330 ?auto_441336 ) ) ( not ( = ?auto_441330 ?auto_441337 ) ) ( not ( = ?auto_441330 ?auto_441338 ) ) ( not ( = ?auto_441330 ?auto_441339 ) ) ( not ( = ?auto_441330 ?auto_441340 ) ) ( not ( = ?auto_441331 ?auto_441332 ) ) ( not ( = ?auto_441331 ?auto_441333 ) ) ( not ( = ?auto_441331 ?auto_441334 ) ) ( not ( = ?auto_441331 ?auto_441335 ) ) ( not ( = ?auto_441331 ?auto_441336 ) ) ( not ( = ?auto_441331 ?auto_441337 ) ) ( not ( = ?auto_441331 ?auto_441338 ) ) ( not ( = ?auto_441331 ?auto_441339 ) ) ( not ( = ?auto_441331 ?auto_441340 ) ) ( not ( = ?auto_441332 ?auto_441333 ) ) ( not ( = ?auto_441332 ?auto_441334 ) ) ( not ( = ?auto_441332 ?auto_441335 ) ) ( not ( = ?auto_441332 ?auto_441336 ) ) ( not ( = ?auto_441332 ?auto_441337 ) ) ( not ( = ?auto_441332 ?auto_441338 ) ) ( not ( = ?auto_441332 ?auto_441339 ) ) ( not ( = ?auto_441332 ?auto_441340 ) ) ( not ( = ?auto_441333 ?auto_441334 ) ) ( not ( = ?auto_441333 ?auto_441335 ) ) ( not ( = ?auto_441333 ?auto_441336 ) ) ( not ( = ?auto_441333 ?auto_441337 ) ) ( not ( = ?auto_441333 ?auto_441338 ) ) ( not ( = ?auto_441333 ?auto_441339 ) ) ( not ( = ?auto_441333 ?auto_441340 ) ) ( not ( = ?auto_441334 ?auto_441335 ) ) ( not ( = ?auto_441334 ?auto_441336 ) ) ( not ( = ?auto_441334 ?auto_441337 ) ) ( not ( = ?auto_441334 ?auto_441338 ) ) ( not ( = ?auto_441334 ?auto_441339 ) ) ( not ( = ?auto_441334 ?auto_441340 ) ) ( not ( = ?auto_441335 ?auto_441336 ) ) ( not ( = ?auto_441335 ?auto_441337 ) ) ( not ( = ?auto_441335 ?auto_441338 ) ) ( not ( = ?auto_441335 ?auto_441339 ) ) ( not ( = ?auto_441335 ?auto_441340 ) ) ( not ( = ?auto_441336 ?auto_441337 ) ) ( not ( = ?auto_441336 ?auto_441338 ) ) ( not ( = ?auto_441336 ?auto_441339 ) ) ( not ( = ?auto_441336 ?auto_441340 ) ) ( not ( = ?auto_441337 ?auto_441338 ) ) ( not ( = ?auto_441337 ?auto_441339 ) ) ( not ( = ?auto_441337 ?auto_441340 ) ) ( not ( = ?auto_441338 ?auto_441339 ) ) ( not ( = ?auto_441338 ?auto_441340 ) ) ( not ( = ?auto_441339 ?auto_441340 ) ) ( ON ?auto_441338 ?auto_441339 ) ( ON ?auto_441337 ?auto_441338 ) ( ON ?auto_441336 ?auto_441337 ) ( ON ?auto_441335 ?auto_441336 ) ( ON ?auto_441334 ?auto_441335 ) ( CLEAR ?auto_441332 ) ( ON ?auto_441333 ?auto_441334 ) ( CLEAR ?auto_441333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_441328 ?auto_441329 ?auto_441330 ?auto_441331 ?auto_441332 ?auto_441333 )
      ( MAKE-12PILE ?auto_441328 ?auto_441329 ?auto_441330 ?auto_441331 ?auto_441332 ?auto_441333 ?auto_441334 ?auto_441335 ?auto_441336 ?auto_441337 ?auto_441338 ?auto_441339 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441378 - BLOCK
      ?auto_441379 - BLOCK
      ?auto_441380 - BLOCK
      ?auto_441381 - BLOCK
      ?auto_441382 - BLOCK
      ?auto_441383 - BLOCK
      ?auto_441384 - BLOCK
      ?auto_441385 - BLOCK
      ?auto_441386 - BLOCK
      ?auto_441387 - BLOCK
      ?auto_441388 - BLOCK
      ?auto_441389 - BLOCK
    )
    :vars
    (
      ?auto_441390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441389 ?auto_441390 ) ( ON-TABLE ?auto_441378 ) ( ON ?auto_441379 ?auto_441378 ) ( ON ?auto_441380 ?auto_441379 ) ( ON ?auto_441381 ?auto_441380 ) ( not ( = ?auto_441378 ?auto_441379 ) ) ( not ( = ?auto_441378 ?auto_441380 ) ) ( not ( = ?auto_441378 ?auto_441381 ) ) ( not ( = ?auto_441378 ?auto_441382 ) ) ( not ( = ?auto_441378 ?auto_441383 ) ) ( not ( = ?auto_441378 ?auto_441384 ) ) ( not ( = ?auto_441378 ?auto_441385 ) ) ( not ( = ?auto_441378 ?auto_441386 ) ) ( not ( = ?auto_441378 ?auto_441387 ) ) ( not ( = ?auto_441378 ?auto_441388 ) ) ( not ( = ?auto_441378 ?auto_441389 ) ) ( not ( = ?auto_441378 ?auto_441390 ) ) ( not ( = ?auto_441379 ?auto_441380 ) ) ( not ( = ?auto_441379 ?auto_441381 ) ) ( not ( = ?auto_441379 ?auto_441382 ) ) ( not ( = ?auto_441379 ?auto_441383 ) ) ( not ( = ?auto_441379 ?auto_441384 ) ) ( not ( = ?auto_441379 ?auto_441385 ) ) ( not ( = ?auto_441379 ?auto_441386 ) ) ( not ( = ?auto_441379 ?auto_441387 ) ) ( not ( = ?auto_441379 ?auto_441388 ) ) ( not ( = ?auto_441379 ?auto_441389 ) ) ( not ( = ?auto_441379 ?auto_441390 ) ) ( not ( = ?auto_441380 ?auto_441381 ) ) ( not ( = ?auto_441380 ?auto_441382 ) ) ( not ( = ?auto_441380 ?auto_441383 ) ) ( not ( = ?auto_441380 ?auto_441384 ) ) ( not ( = ?auto_441380 ?auto_441385 ) ) ( not ( = ?auto_441380 ?auto_441386 ) ) ( not ( = ?auto_441380 ?auto_441387 ) ) ( not ( = ?auto_441380 ?auto_441388 ) ) ( not ( = ?auto_441380 ?auto_441389 ) ) ( not ( = ?auto_441380 ?auto_441390 ) ) ( not ( = ?auto_441381 ?auto_441382 ) ) ( not ( = ?auto_441381 ?auto_441383 ) ) ( not ( = ?auto_441381 ?auto_441384 ) ) ( not ( = ?auto_441381 ?auto_441385 ) ) ( not ( = ?auto_441381 ?auto_441386 ) ) ( not ( = ?auto_441381 ?auto_441387 ) ) ( not ( = ?auto_441381 ?auto_441388 ) ) ( not ( = ?auto_441381 ?auto_441389 ) ) ( not ( = ?auto_441381 ?auto_441390 ) ) ( not ( = ?auto_441382 ?auto_441383 ) ) ( not ( = ?auto_441382 ?auto_441384 ) ) ( not ( = ?auto_441382 ?auto_441385 ) ) ( not ( = ?auto_441382 ?auto_441386 ) ) ( not ( = ?auto_441382 ?auto_441387 ) ) ( not ( = ?auto_441382 ?auto_441388 ) ) ( not ( = ?auto_441382 ?auto_441389 ) ) ( not ( = ?auto_441382 ?auto_441390 ) ) ( not ( = ?auto_441383 ?auto_441384 ) ) ( not ( = ?auto_441383 ?auto_441385 ) ) ( not ( = ?auto_441383 ?auto_441386 ) ) ( not ( = ?auto_441383 ?auto_441387 ) ) ( not ( = ?auto_441383 ?auto_441388 ) ) ( not ( = ?auto_441383 ?auto_441389 ) ) ( not ( = ?auto_441383 ?auto_441390 ) ) ( not ( = ?auto_441384 ?auto_441385 ) ) ( not ( = ?auto_441384 ?auto_441386 ) ) ( not ( = ?auto_441384 ?auto_441387 ) ) ( not ( = ?auto_441384 ?auto_441388 ) ) ( not ( = ?auto_441384 ?auto_441389 ) ) ( not ( = ?auto_441384 ?auto_441390 ) ) ( not ( = ?auto_441385 ?auto_441386 ) ) ( not ( = ?auto_441385 ?auto_441387 ) ) ( not ( = ?auto_441385 ?auto_441388 ) ) ( not ( = ?auto_441385 ?auto_441389 ) ) ( not ( = ?auto_441385 ?auto_441390 ) ) ( not ( = ?auto_441386 ?auto_441387 ) ) ( not ( = ?auto_441386 ?auto_441388 ) ) ( not ( = ?auto_441386 ?auto_441389 ) ) ( not ( = ?auto_441386 ?auto_441390 ) ) ( not ( = ?auto_441387 ?auto_441388 ) ) ( not ( = ?auto_441387 ?auto_441389 ) ) ( not ( = ?auto_441387 ?auto_441390 ) ) ( not ( = ?auto_441388 ?auto_441389 ) ) ( not ( = ?auto_441388 ?auto_441390 ) ) ( not ( = ?auto_441389 ?auto_441390 ) ) ( ON ?auto_441388 ?auto_441389 ) ( ON ?auto_441387 ?auto_441388 ) ( ON ?auto_441386 ?auto_441387 ) ( ON ?auto_441385 ?auto_441386 ) ( ON ?auto_441384 ?auto_441385 ) ( ON ?auto_441383 ?auto_441384 ) ( CLEAR ?auto_441381 ) ( ON ?auto_441382 ?auto_441383 ) ( CLEAR ?auto_441382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_441378 ?auto_441379 ?auto_441380 ?auto_441381 ?auto_441382 )
      ( MAKE-12PILE ?auto_441378 ?auto_441379 ?auto_441380 ?auto_441381 ?auto_441382 ?auto_441383 ?auto_441384 ?auto_441385 ?auto_441386 ?auto_441387 ?auto_441388 ?auto_441389 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441428 - BLOCK
      ?auto_441429 - BLOCK
      ?auto_441430 - BLOCK
      ?auto_441431 - BLOCK
      ?auto_441432 - BLOCK
      ?auto_441433 - BLOCK
      ?auto_441434 - BLOCK
      ?auto_441435 - BLOCK
      ?auto_441436 - BLOCK
      ?auto_441437 - BLOCK
      ?auto_441438 - BLOCK
      ?auto_441439 - BLOCK
    )
    :vars
    (
      ?auto_441440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441439 ?auto_441440 ) ( ON-TABLE ?auto_441428 ) ( ON ?auto_441429 ?auto_441428 ) ( ON ?auto_441430 ?auto_441429 ) ( not ( = ?auto_441428 ?auto_441429 ) ) ( not ( = ?auto_441428 ?auto_441430 ) ) ( not ( = ?auto_441428 ?auto_441431 ) ) ( not ( = ?auto_441428 ?auto_441432 ) ) ( not ( = ?auto_441428 ?auto_441433 ) ) ( not ( = ?auto_441428 ?auto_441434 ) ) ( not ( = ?auto_441428 ?auto_441435 ) ) ( not ( = ?auto_441428 ?auto_441436 ) ) ( not ( = ?auto_441428 ?auto_441437 ) ) ( not ( = ?auto_441428 ?auto_441438 ) ) ( not ( = ?auto_441428 ?auto_441439 ) ) ( not ( = ?auto_441428 ?auto_441440 ) ) ( not ( = ?auto_441429 ?auto_441430 ) ) ( not ( = ?auto_441429 ?auto_441431 ) ) ( not ( = ?auto_441429 ?auto_441432 ) ) ( not ( = ?auto_441429 ?auto_441433 ) ) ( not ( = ?auto_441429 ?auto_441434 ) ) ( not ( = ?auto_441429 ?auto_441435 ) ) ( not ( = ?auto_441429 ?auto_441436 ) ) ( not ( = ?auto_441429 ?auto_441437 ) ) ( not ( = ?auto_441429 ?auto_441438 ) ) ( not ( = ?auto_441429 ?auto_441439 ) ) ( not ( = ?auto_441429 ?auto_441440 ) ) ( not ( = ?auto_441430 ?auto_441431 ) ) ( not ( = ?auto_441430 ?auto_441432 ) ) ( not ( = ?auto_441430 ?auto_441433 ) ) ( not ( = ?auto_441430 ?auto_441434 ) ) ( not ( = ?auto_441430 ?auto_441435 ) ) ( not ( = ?auto_441430 ?auto_441436 ) ) ( not ( = ?auto_441430 ?auto_441437 ) ) ( not ( = ?auto_441430 ?auto_441438 ) ) ( not ( = ?auto_441430 ?auto_441439 ) ) ( not ( = ?auto_441430 ?auto_441440 ) ) ( not ( = ?auto_441431 ?auto_441432 ) ) ( not ( = ?auto_441431 ?auto_441433 ) ) ( not ( = ?auto_441431 ?auto_441434 ) ) ( not ( = ?auto_441431 ?auto_441435 ) ) ( not ( = ?auto_441431 ?auto_441436 ) ) ( not ( = ?auto_441431 ?auto_441437 ) ) ( not ( = ?auto_441431 ?auto_441438 ) ) ( not ( = ?auto_441431 ?auto_441439 ) ) ( not ( = ?auto_441431 ?auto_441440 ) ) ( not ( = ?auto_441432 ?auto_441433 ) ) ( not ( = ?auto_441432 ?auto_441434 ) ) ( not ( = ?auto_441432 ?auto_441435 ) ) ( not ( = ?auto_441432 ?auto_441436 ) ) ( not ( = ?auto_441432 ?auto_441437 ) ) ( not ( = ?auto_441432 ?auto_441438 ) ) ( not ( = ?auto_441432 ?auto_441439 ) ) ( not ( = ?auto_441432 ?auto_441440 ) ) ( not ( = ?auto_441433 ?auto_441434 ) ) ( not ( = ?auto_441433 ?auto_441435 ) ) ( not ( = ?auto_441433 ?auto_441436 ) ) ( not ( = ?auto_441433 ?auto_441437 ) ) ( not ( = ?auto_441433 ?auto_441438 ) ) ( not ( = ?auto_441433 ?auto_441439 ) ) ( not ( = ?auto_441433 ?auto_441440 ) ) ( not ( = ?auto_441434 ?auto_441435 ) ) ( not ( = ?auto_441434 ?auto_441436 ) ) ( not ( = ?auto_441434 ?auto_441437 ) ) ( not ( = ?auto_441434 ?auto_441438 ) ) ( not ( = ?auto_441434 ?auto_441439 ) ) ( not ( = ?auto_441434 ?auto_441440 ) ) ( not ( = ?auto_441435 ?auto_441436 ) ) ( not ( = ?auto_441435 ?auto_441437 ) ) ( not ( = ?auto_441435 ?auto_441438 ) ) ( not ( = ?auto_441435 ?auto_441439 ) ) ( not ( = ?auto_441435 ?auto_441440 ) ) ( not ( = ?auto_441436 ?auto_441437 ) ) ( not ( = ?auto_441436 ?auto_441438 ) ) ( not ( = ?auto_441436 ?auto_441439 ) ) ( not ( = ?auto_441436 ?auto_441440 ) ) ( not ( = ?auto_441437 ?auto_441438 ) ) ( not ( = ?auto_441437 ?auto_441439 ) ) ( not ( = ?auto_441437 ?auto_441440 ) ) ( not ( = ?auto_441438 ?auto_441439 ) ) ( not ( = ?auto_441438 ?auto_441440 ) ) ( not ( = ?auto_441439 ?auto_441440 ) ) ( ON ?auto_441438 ?auto_441439 ) ( ON ?auto_441437 ?auto_441438 ) ( ON ?auto_441436 ?auto_441437 ) ( ON ?auto_441435 ?auto_441436 ) ( ON ?auto_441434 ?auto_441435 ) ( ON ?auto_441433 ?auto_441434 ) ( ON ?auto_441432 ?auto_441433 ) ( CLEAR ?auto_441430 ) ( ON ?auto_441431 ?auto_441432 ) ( CLEAR ?auto_441431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_441428 ?auto_441429 ?auto_441430 ?auto_441431 )
      ( MAKE-12PILE ?auto_441428 ?auto_441429 ?auto_441430 ?auto_441431 ?auto_441432 ?auto_441433 ?auto_441434 ?auto_441435 ?auto_441436 ?auto_441437 ?auto_441438 ?auto_441439 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441478 - BLOCK
      ?auto_441479 - BLOCK
      ?auto_441480 - BLOCK
      ?auto_441481 - BLOCK
      ?auto_441482 - BLOCK
      ?auto_441483 - BLOCK
      ?auto_441484 - BLOCK
      ?auto_441485 - BLOCK
      ?auto_441486 - BLOCK
      ?auto_441487 - BLOCK
      ?auto_441488 - BLOCK
      ?auto_441489 - BLOCK
    )
    :vars
    (
      ?auto_441490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441489 ?auto_441490 ) ( ON-TABLE ?auto_441478 ) ( ON ?auto_441479 ?auto_441478 ) ( not ( = ?auto_441478 ?auto_441479 ) ) ( not ( = ?auto_441478 ?auto_441480 ) ) ( not ( = ?auto_441478 ?auto_441481 ) ) ( not ( = ?auto_441478 ?auto_441482 ) ) ( not ( = ?auto_441478 ?auto_441483 ) ) ( not ( = ?auto_441478 ?auto_441484 ) ) ( not ( = ?auto_441478 ?auto_441485 ) ) ( not ( = ?auto_441478 ?auto_441486 ) ) ( not ( = ?auto_441478 ?auto_441487 ) ) ( not ( = ?auto_441478 ?auto_441488 ) ) ( not ( = ?auto_441478 ?auto_441489 ) ) ( not ( = ?auto_441478 ?auto_441490 ) ) ( not ( = ?auto_441479 ?auto_441480 ) ) ( not ( = ?auto_441479 ?auto_441481 ) ) ( not ( = ?auto_441479 ?auto_441482 ) ) ( not ( = ?auto_441479 ?auto_441483 ) ) ( not ( = ?auto_441479 ?auto_441484 ) ) ( not ( = ?auto_441479 ?auto_441485 ) ) ( not ( = ?auto_441479 ?auto_441486 ) ) ( not ( = ?auto_441479 ?auto_441487 ) ) ( not ( = ?auto_441479 ?auto_441488 ) ) ( not ( = ?auto_441479 ?auto_441489 ) ) ( not ( = ?auto_441479 ?auto_441490 ) ) ( not ( = ?auto_441480 ?auto_441481 ) ) ( not ( = ?auto_441480 ?auto_441482 ) ) ( not ( = ?auto_441480 ?auto_441483 ) ) ( not ( = ?auto_441480 ?auto_441484 ) ) ( not ( = ?auto_441480 ?auto_441485 ) ) ( not ( = ?auto_441480 ?auto_441486 ) ) ( not ( = ?auto_441480 ?auto_441487 ) ) ( not ( = ?auto_441480 ?auto_441488 ) ) ( not ( = ?auto_441480 ?auto_441489 ) ) ( not ( = ?auto_441480 ?auto_441490 ) ) ( not ( = ?auto_441481 ?auto_441482 ) ) ( not ( = ?auto_441481 ?auto_441483 ) ) ( not ( = ?auto_441481 ?auto_441484 ) ) ( not ( = ?auto_441481 ?auto_441485 ) ) ( not ( = ?auto_441481 ?auto_441486 ) ) ( not ( = ?auto_441481 ?auto_441487 ) ) ( not ( = ?auto_441481 ?auto_441488 ) ) ( not ( = ?auto_441481 ?auto_441489 ) ) ( not ( = ?auto_441481 ?auto_441490 ) ) ( not ( = ?auto_441482 ?auto_441483 ) ) ( not ( = ?auto_441482 ?auto_441484 ) ) ( not ( = ?auto_441482 ?auto_441485 ) ) ( not ( = ?auto_441482 ?auto_441486 ) ) ( not ( = ?auto_441482 ?auto_441487 ) ) ( not ( = ?auto_441482 ?auto_441488 ) ) ( not ( = ?auto_441482 ?auto_441489 ) ) ( not ( = ?auto_441482 ?auto_441490 ) ) ( not ( = ?auto_441483 ?auto_441484 ) ) ( not ( = ?auto_441483 ?auto_441485 ) ) ( not ( = ?auto_441483 ?auto_441486 ) ) ( not ( = ?auto_441483 ?auto_441487 ) ) ( not ( = ?auto_441483 ?auto_441488 ) ) ( not ( = ?auto_441483 ?auto_441489 ) ) ( not ( = ?auto_441483 ?auto_441490 ) ) ( not ( = ?auto_441484 ?auto_441485 ) ) ( not ( = ?auto_441484 ?auto_441486 ) ) ( not ( = ?auto_441484 ?auto_441487 ) ) ( not ( = ?auto_441484 ?auto_441488 ) ) ( not ( = ?auto_441484 ?auto_441489 ) ) ( not ( = ?auto_441484 ?auto_441490 ) ) ( not ( = ?auto_441485 ?auto_441486 ) ) ( not ( = ?auto_441485 ?auto_441487 ) ) ( not ( = ?auto_441485 ?auto_441488 ) ) ( not ( = ?auto_441485 ?auto_441489 ) ) ( not ( = ?auto_441485 ?auto_441490 ) ) ( not ( = ?auto_441486 ?auto_441487 ) ) ( not ( = ?auto_441486 ?auto_441488 ) ) ( not ( = ?auto_441486 ?auto_441489 ) ) ( not ( = ?auto_441486 ?auto_441490 ) ) ( not ( = ?auto_441487 ?auto_441488 ) ) ( not ( = ?auto_441487 ?auto_441489 ) ) ( not ( = ?auto_441487 ?auto_441490 ) ) ( not ( = ?auto_441488 ?auto_441489 ) ) ( not ( = ?auto_441488 ?auto_441490 ) ) ( not ( = ?auto_441489 ?auto_441490 ) ) ( ON ?auto_441488 ?auto_441489 ) ( ON ?auto_441487 ?auto_441488 ) ( ON ?auto_441486 ?auto_441487 ) ( ON ?auto_441485 ?auto_441486 ) ( ON ?auto_441484 ?auto_441485 ) ( ON ?auto_441483 ?auto_441484 ) ( ON ?auto_441482 ?auto_441483 ) ( ON ?auto_441481 ?auto_441482 ) ( CLEAR ?auto_441479 ) ( ON ?auto_441480 ?auto_441481 ) ( CLEAR ?auto_441480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_441478 ?auto_441479 ?auto_441480 )
      ( MAKE-12PILE ?auto_441478 ?auto_441479 ?auto_441480 ?auto_441481 ?auto_441482 ?auto_441483 ?auto_441484 ?auto_441485 ?auto_441486 ?auto_441487 ?auto_441488 ?auto_441489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441528 - BLOCK
      ?auto_441529 - BLOCK
      ?auto_441530 - BLOCK
      ?auto_441531 - BLOCK
      ?auto_441532 - BLOCK
      ?auto_441533 - BLOCK
      ?auto_441534 - BLOCK
      ?auto_441535 - BLOCK
      ?auto_441536 - BLOCK
      ?auto_441537 - BLOCK
      ?auto_441538 - BLOCK
      ?auto_441539 - BLOCK
    )
    :vars
    (
      ?auto_441540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441539 ?auto_441540 ) ( ON-TABLE ?auto_441528 ) ( not ( = ?auto_441528 ?auto_441529 ) ) ( not ( = ?auto_441528 ?auto_441530 ) ) ( not ( = ?auto_441528 ?auto_441531 ) ) ( not ( = ?auto_441528 ?auto_441532 ) ) ( not ( = ?auto_441528 ?auto_441533 ) ) ( not ( = ?auto_441528 ?auto_441534 ) ) ( not ( = ?auto_441528 ?auto_441535 ) ) ( not ( = ?auto_441528 ?auto_441536 ) ) ( not ( = ?auto_441528 ?auto_441537 ) ) ( not ( = ?auto_441528 ?auto_441538 ) ) ( not ( = ?auto_441528 ?auto_441539 ) ) ( not ( = ?auto_441528 ?auto_441540 ) ) ( not ( = ?auto_441529 ?auto_441530 ) ) ( not ( = ?auto_441529 ?auto_441531 ) ) ( not ( = ?auto_441529 ?auto_441532 ) ) ( not ( = ?auto_441529 ?auto_441533 ) ) ( not ( = ?auto_441529 ?auto_441534 ) ) ( not ( = ?auto_441529 ?auto_441535 ) ) ( not ( = ?auto_441529 ?auto_441536 ) ) ( not ( = ?auto_441529 ?auto_441537 ) ) ( not ( = ?auto_441529 ?auto_441538 ) ) ( not ( = ?auto_441529 ?auto_441539 ) ) ( not ( = ?auto_441529 ?auto_441540 ) ) ( not ( = ?auto_441530 ?auto_441531 ) ) ( not ( = ?auto_441530 ?auto_441532 ) ) ( not ( = ?auto_441530 ?auto_441533 ) ) ( not ( = ?auto_441530 ?auto_441534 ) ) ( not ( = ?auto_441530 ?auto_441535 ) ) ( not ( = ?auto_441530 ?auto_441536 ) ) ( not ( = ?auto_441530 ?auto_441537 ) ) ( not ( = ?auto_441530 ?auto_441538 ) ) ( not ( = ?auto_441530 ?auto_441539 ) ) ( not ( = ?auto_441530 ?auto_441540 ) ) ( not ( = ?auto_441531 ?auto_441532 ) ) ( not ( = ?auto_441531 ?auto_441533 ) ) ( not ( = ?auto_441531 ?auto_441534 ) ) ( not ( = ?auto_441531 ?auto_441535 ) ) ( not ( = ?auto_441531 ?auto_441536 ) ) ( not ( = ?auto_441531 ?auto_441537 ) ) ( not ( = ?auto_441531 ?auto_441538 ) ) ( not ( = ?auto_441531 ?auto_441539 ) ) ( not ( = ?auto_441531 ?auto_441540 ) ) ( not ( = ?auto_441532 ?auto_441533 ) ) ( not ( = ?auto_441532 ?auto_441534 ) ) ( not ( = ?auto_441532 ?auto_441535 ) ) ( not ( = ?auto_441532 ?auto_441536 ) ) ( not ( = ?auto_441532 ?auto_441537 ) ) ( not ( = ?auto_441532 ?auto_441538 ) ) ( not ( = ?auto_441532 ?auto_441539 ) ) ( not ( = ?auto_441532 ?auto_441540 ) ) ( not ( = ?auto_441533 ?auto_441534 ) ) ( not ( = ?auto_441533 ?auto_441535 ) ) ( not ( = ?auto_441533 ?auto_441536 ) ) ( not ( = ?auto_441533 ?auto_441537 ) ) ( not ( = ?auto_441533 ?auto_441538 ) ) ( not ( = ?auto_441533 ?auto_441539 ) ) ( not ( = ?auto_441533 ?auto_441540 ) ) ( not ( = ?auto_441534 ?auto_441535 ) ) ( not ( = ?auto_441534 ?auto_441536 ) ) ( not ( = ?auto_441534 ?auto_441537 ) ) ( not ( = ?auto_441534 ?auto_441538 ) ) ( not ( = ?auto_441534 ?auto_441539 ) ) ( not ( = ?auto_441534 ?auto_441540 ) ) ( not ( = ?auto_441535 ?auto_441536 ) ) ( not ( = ?auto_441535 ?auto_441537 ) ) ( not ( = ?auto_441535 ?auto_441538 ) ) ( not ( = ?auto_441535 ?auto_441539 ) ) ( not ( = ?auto_441535 ?auto_441540 ) ) ( not ( = ?auto_441536 ?auto_441537 ) ) ( not ( = ?auto_441536 ?auto_441538 ) ) ( not ( = ?auto_441536 ?auto_441539 ) ) ( not ( = ?auto_441536 ?auto_441540 ) ) ( not ( = ?auto_441537 ?auto_441538 ) ) ( not ( = ?auto_441537 ?auto_441539 ) ) ( not ( = ?auto_441537 ?auto_441540 ) ) ( not ( = ?auto_441538 ?auto_441539 ) ) ( not ( = ?auto_441538 ?auto_441540 ) ) ( not ( = ?auto_441539 ?auto_441540 ) ) ( ON ?auto_441538 ?auto_441539 ) ( ON ?auto_441537 ?auto_441538 ) ( ON ?auto_441536 ?auto_441537 ) ( ON ?auto_441535 ?auto_441536 ) ( ON ?auto_441534 ?auto_441535 ) ( ON ?auto_441533 ?auto_441534 ) ( ON ?auto_441532 ?auto_441533 ) ( ON ?auto_441531 ?auto_441532 ) ( ON ?auto_441530 ?auto_441531 ) ( CLEAR ?auto_441528 ) ( ON ?auto_441529 ?auto_441530 ) ( CLEAR ?auto_441529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_441528 ?auto_441529 )
      ( MAKE-12PILE ?auto_441528 ?auto_441529 ?auto_441530 ?auto_441531 ?auto_441532 ?auto_441533 ?auto_441534 ?auto_441535 ?auto_441536 ?auto_441537 ?auto_441538 ?auto_441539 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_441578 - BLOCK
      ?auto_441579 - BLOCK
      ?auto_441580 - BLOCK
      ?auto_441581 - BLOCK
      ?auto_441582 - BLOCK
      ?auto_441583 - BLOCK
      ?auto_441584 - BLOCK
      ?auto_441585 - BLOCK
      ?auto_441586 - BLOCK
      ?auto_441587 - BLOCK
      ?auto_441588 - BLOCK
      ?auto_441589 - BLOCK
    )
    :vars
    (
      ?auto_441590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441589 ?auto_441590 ) ( not ( = ?auto_441578 ?auto_441579 ) ) ( not ( = ?auto_441578 ?auto_441580 ) ) ( not ( = ?auto_441578 ?auto_441581 ) ) ( not ( = ?auto_441578 ?auto_441582 ) ) ( not ( = ?auto_441578 ?auto_441583 ) ) ( not ( = ?auto_441578 ?auto_441584 ) ) ( not ( = ?auto_441578 ?auto_441585 ) ) ( not ( = ?auto_441578 ?auto_441586 ) ) ( not ( = ?auto_441578 ?auto_441587 ) ) ( not ( = ?auto_441578 ?auto_441588 ) ) ( not ( = ?auto_441578 ?auto_441589 ) ) ( not ( = ?auto_441578 ?auto_441590 ) ) ( not ( = ?auto_441579 ?auto_441580 ) ) ( not ( = ?auto_441579 ?auto_441581 ) ) ( not ( = ?auto_441579 ?auto_441582 ) ) ( not ( = ?auto_441579 ?auto_441583 ) ) ( not ( = ?auto_441579 ?auto_441584 ) ) ( not ( = ?auto_441579 ?auto_441585 ) ) ( not ( = ?auto_441579 ?auto_441586 ) ) ( not ( = ?auto_441579 ?auto_441587 ) ) ( not ( = ?auto_441579 ?auto_441588 ) ) ( not ( = ?auto_441579 ?auto_441589 ) ) ( not ( = ?auto_441579 ?auto_441590 ) ) ( not ( = ?auto_441580 ?auto_441581 ) ) ( not ( = ?auto_441580 ?auto_441582 ) ) ( not ( = ?auto_441580 ?auto_441583 ) ) ( not ( = ?auto_441580 ?auto_441584 ) ) ( not ( = ?auto_441580 ?auto_441585 ) ) ( not ( = ?auto_441580 ?auto_441586 ) ) ( not ( = ?auto_441580 ?auto_441587 ) ) ( not ( = ?auto_441580 ?auto_441588 ) ) ( not ( = ?auto_441580 ?auto_441589 ) ) ( not ( = ?auto_441580 ?auto_441590 ) ) ( not ( = ?auto_441581 ?auto_441582 ) ) ( not ( = ?auto_441581 ?auto_441583 ) ) ( not ( = ?auto_441581 ?auto_441584 ) ) ( not ( = ?auto_441581 ?auto_441585 ) ) ( not ( = ?auto_441581 ?auto_441586 ) ) ( not ( = ?auto_441581 ?auto_441587 ) ) ( not ( = ?auto_441581 ?auto_441588 ) ) ( not ( = ?auto_441581 ?auto_441589 ) ) ( not ( = ?auto_441581 ?auto_441590 ) ) ( not ( = ?auto_441582 ?auto_441583 ) ) ( not ( = ?auto_441582 ?auto_441584 ) ) ( not ( = ?auto_441582 ?auto_441585 ) ) ( not ( = ?auto_441582 ?auto_441586 ) ) ( not ( = ?auto_441582 ?auto_441587 ) ) ( not ( = ?auto_441582 ?auto_441588 ) ) ( not ( = ?auto_441582 ?auto_441589 ) ) ( not ( = ?auto_441582 ?auto_441590 ) ) ( not ( = ?auto_441583 ?auto_441584 ) ) ( not ( = ?auto_441583 ?auto_441585 ) ) ( not ( = ?auto_441583 ?auto_441586 ) ) ( not ( = ?auto_441583 ?auto_441587 ) ) ( not ( = ?auto_441583 ?auto_441588 ) ) ( not ( = ?auto_441583 ?auto_441589 ) ) ( not ( = ?auto_441583 ?auto_441590 ) ) ( not ( = ?auto_441584 ?auto_441585 ) ) ( not ( = ?auto_441584 ?auto_441586 ) ) ( not ( = ?auto_441584 ?auto_441587 ) ) ( not ( = ?auto_441584 ?auto_441588 ) ) ( not ( = ?auto_441584 ?auto_441589 ) ) ( not ( = ?auto_441584 ?auto_441590 ) ) ( not ( = ?auto_441585 ?auto_441586 ) ) ( not ( = ?auto_441585 ?auto_441587 ) ) ( not ( = ?auto_441585 ?auto_441588 ) ) ( not ( = ?auto_441585 ?auto_441589 ) ) ( not ( = ?auto_441585 ?auto_441590 ) ) ( not ( = ?auto_441586 ?auto_441587 ) ) ( not ( = ?auto_441586 ?auto_441588 ) ) ( not ( = ?auto_441586 ?auto_441589 ) ) ( not ( = ?auto_441586 ?auto_441590 ) ) ( not ( = ?auto_441587 ?auto_441588 ) ) ( not ( = ?auto_441587 ?auto_441589 ) ) ( not ( = ?auto_441587 ?auto_441590 ) ) ( not ( = ?auto_441588 ?auto_441589 ) ) ( not ( = ?auto_441588 ?auto_441590 ) ) ( not ( = ?auto_441589 ?auto_441590 ) ) ( ON ?auto_441588 ?auto_441589 ) ( ON ?auto_441587 ?auto_441588 ) ( ON ?auto_441586 ?auto_441587 ) ( ON ?auto_441585 ?auto_441586 ) ( ON ?auto_441584 ?auto_441585 ) ( ON ?auto_441583 ?auto_441584 ) ( ON ?auto_441582 ?auto_441583 ) ( ON ?auto_441581 ?auto_441582 ) ( ON ?auto_441580 ?auto_441581 ) ( ON ?auto_441579 ?auto_441580 ) ( ON ?auto_441578 ?auto_441579 ) ( CLEAR ?auto_441578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_441578 )
      ( MAKE-12PILE ?auto_441578 ?auto_441579 ?auto_441580 ?auto_441581 ?auto_441582 ?auto_441583 ?auto_441584 ?auto_441585 ?auto_441586 ?auto_441587 ?auto_441588 ?auto_441589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441629 - BLOCK
      ?auto_441630 - BLOCK
      ?auto_441631 - BLOCK
      ?auto_441632 - BLOCK
      ?auto_441633 - BLOCK
      ?auto_441634 - BLOCK
      ?auto_441635 - BLOCK
      ?auto_441636 - BLOCK
      ?auto_441637 - BLOCK
      ?auto_441638 - BLOCK
      ?auto_441639 - BLOCK
      ?auto_441640 - BLOCK
      ?auto_441641 - BLOCK
    )
    :vars
    (
      ?auto_441642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_441640 ) ( ON ?auto_441641 ?auto_441642 ) ( CLEAR ?auto_441641 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_441629 ) ( ON ?auto_441630 ?auto_441629 ) ( ON ?auto_441631 ?auto_441630 ) ( ON ?auto_441632 ?auto_441631 ) ( ON ?auto_441633 ?auto_441632 ) ( ON ?auto_441634 ?auto_441633 ) ( ON ?auto_441635 ?auto_441634 ) ( ON ?auto_441636 ?auto_441635 ) ( ON ?auto_441637 ?auto_441636 ) ( ON ?auto_441638 ?auto_441637 ) ( ON ?auto_441639 ?auto_441638 ) ( ON ?auto_441640 ?auto_441639 ) ( not ( = ?auto_441629 ?auto_441630 ) ) ( not ( = ?auto_441629 ?auto_441631 ) ) ( not ( = ?auto_441629 ?auto_441632 ) ) ( not ( = ?auto_441629 ?auto_441633 ) ) ( not ( = ?auto_441629 ?auto_441634 ) ) ( not ( = ?auto_441629 ?auto_441635 ) ) ( not ( = ?auto_441629 ?auto_441636 ) ) ( not ( = ?auto_441629 ?auto_441637 ) ) ( not ( = ?auto_441629 ?auto_441638 ) ) ( not ( = ?auto_441629 ?auto_441639 ) ) ( not ( = ?auto_441629 ?auto_441640 ) ) ( not ( = ?auto_441629 ?auto_441641 ) ) ( not ( = ?auto_441629 ?auto_441642 ) ) ( not ( = ?auto_441630 ?auto_441631 ) ) ( not ( = ?auto_441630 ?auto_441632 ) ) ( not ( = ?auto_441630 ?auto_441633 ) ) ( not ( = ?auto_441630 ?auto_441634 ) ) ( not ( = ?auto_441630 ?auto_441635 ) ) ( not ( = ?auto_441630 ?auto_441636 ) ) ( not ( = ?auto_441630 ?auto_441637 ) ) ( not ( = ?auto_441630 ?auto_441638 ) ) ( not ( = ?auto_441630 ?auto_441639 ) ) ( not ( = ?auto_441630 ?auto_441640 ) ) ( not ( = ?auto_441630 ?auto_441641 ) ) ( not ( = ?auto_441630 ?auto_441642 ) ) ( not ( = ?auto_441631 ?auto_441632 ) ) ( not ( = ?auto_441631 ?auto_441633 ) ) ( not ( = ?auto_441631 ?auto_441634 ) ) ( not ( = ?auto_441631 ?auto_441635 ) ) ( not ( = ?auto_441631 ?auto_441636 ) ) ( not ( = ?auto_441631 ?auto_441637 ) ) ( not ( = ?auto_441631 ?auto_441638 ) ) ( not ( = ?auto_441631 ?auto_441639 ) ) ( not ( = ?auto_441631 ?auto_441640 ) ) ( not ( = ?auto_441631 ?auto_441641 ) ) ( not ( = ?auto_441631 ?auto_441642 ) ) ( not ( = ?auto_441632 ?auto_441633 ) ) ( not ( = ?auto_441632 ?auto_441634 ) ) ( not ( = ?auto_441632 ?auto_441635 ) ) ( not ( = ?auto_441632 ?auto_441636 ) ) ( not ( = ?auto_441632 ?auto_441637 ) ) ( not ( = ?auto_441632 ?auto_441638 ) ) ( not ( = ?auto_441632 ?auto_441639 ) ) ( not ( = ?auto_441632 ?auto_441640 ) ) ( not ( = ?auto_441632 ?auto_441641 ) ) ( not ( = ?auto_441632 ?auto_441642 ) ) ( not ( = ?auto_441633 ?auto_441634 ) ) ( not ( = ?auto_441633 ?auto_441635 ) ) ( not ( = ?auto_441633 ?auto_441636 ) ) ( not ( = ?auto_441633 ?auto_441637 ) ) ( not ( = ?auto_441633 ?auto_441638 ) ) ( not ( = ?auto_441633 ?auto_441639 ) ) ( not ( = ?auto_441633 ?auto_441640 ) ) ( not ( = ?auto_441633 ?auto_441641 ) ) ( not ( = ?auto_441633 ?auto_441642 ) ) ( not ( = ?auto_441634 ?auto_441635 ) ) ( not ( = ?auto_441634 ?auto_441636 ) ) ( not ( = ?auto_441634 ?auto_441637 ) ) ( not ( = ?auto_441634 ?auto_441638 ) ) ( not ( = ?auto_441634 ?auto_441639 ) ) ( not ( = ?auto_441634 ?auto_441640 ) ) ( not ( = ?auto_441634 ?auto_441641 ) ) ( not ( = ?auto_441634 ?auto_441642 ) ) ( not ( = ?auto_441635 ?auto_441636 ) ) ( not ( = ?auto_441635 ?auto_441637 ) ) ( not ( = ?auto_441635 ?auto_441638 ) ) ( not ( = ?auto_441635 ?auto_441639 ) ) ( not ( = ?auto_441635 ?auto_441640 ) ) ( not ( = ?auto_441635 ?auto_441641 ) ) ( not ( = ?auto_441635 ?auto_441642 ) ) ( not ( = ?auto_441636 ?auto_441637 ) ) ( not ( = ?auto_441636 ?auto_441638 ) ) ( not ( = ?auto_441636 ?auto_441639 ) ) ( not ( = ?auto_441636 ?auto_441640 ) ) ( not ( = ?auto_441636 ?auto_441641 ) ) ( not ( = ?auto_441636 ?auto_441642 ) ) ( not ( = ?auto_441637 ?auto_441638 ) ) ( not ( = ?auto_441637 ?auto_441639 ) ) ( not ( = ?auto_441637 ?auto_441640 ) ) ( not ( = ?auto_441637 ?auto_441641 ) ) ( not ( = ?auto_441637 ?auto_441642 ) ) ( not ( = ?auto_441638 ?auto_441639 ) ) ( not ( = ?auto_441638 ?auto_441640 ) ) ( not ( = ?auto_441638 ?auto_441641 ) ) ( not ( = ?auto_441638 ?auto_441642 ) ) ( not ( = ?auto_441639 ?auto_441640 ) ) ( not ( = ?auto_441639 ?auto_441641 ) ) ( not ( = ?auto_441639 ?auto_441642 ) ) ( not ( = ?auto_441640 ?auto_441641 ) ) ( not ( = ?auto_441640 ?auto_441642 ) ) ( not ( = ?auto_441641 ?auto_441642 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_441641 ?auto_441642 )
      ( !STACK ?auto_441641 ?auto_441640 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441683 - BLOCK
      ?auto_441684 - BLOCK
      ?auto_441685 - BLOCK
      ?auto_441686 - BLOCK
      ?auto_441687 - BLOCK
      ?auto_441688 - BLOCK
      ?auto_441689 - BLOCK
      ?auto_441690 - BLOCK
      ?auto_441691 - BLOCK
      ?auto_441692 - BLOCK
      ?auto_441693 - BLOCK
      ?auto_441694 - BLOCK
      ?auto_441695 - BLOCK
    )
    :vars
    (
      ?auto_441696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441695 ?auto_441696 ) ( ON-TABLE ?auto_441683 ) ( ON ?auto_441684 ?auto_441683 ) ( ON ?auto_441685 ?auto_441684 ) ( ON ?auto_441686 ?auto_441685 ) ( ON ?auto_441687 ?auto_441686 ) ( ON ?auto_441688 ?auto_441687 ) ( ON ?auto_441689 ?auto_441688 ) ( ON ?auto_441690 ?auto_441689 ) ( ON ?auto_441691 ?auto_441690 ) ( ON ?auto_441692 ?auto_441691 ) ( ON ?auto_441693 ?auto_441692 ) ( not ( = ?auto_441683 ?auto_441684 ) ) ( not ( = ?auto_441683 ?auto_441685 ) ) ( not ( = ?auto_441683 ?auto_441686 ) ) ( not ( = ?auto_441683 ?auto_441687 ) ) ( not ( = ?auto_441683 ?auto_441688 ) ) ( not ( = ?auto_441683 ?auto_441689 ) ) ( not ( = ?auto_441683 ?auto_441690 ) ) ( not ( = ?auto_441683 ?auto_441691 ) ) ( not ( = ?auto_441683 ?auto_441692 ) ) ( not ( = ?auto_441683 ?auto_441693 ) ) ( not ( = ?auto_441683 ?auto_441694 ) ) ( not ( = ?auto_441683 ?auto_441695 ) ) ( not ( = ?auto_441683 ?auto_441696 ) ) ( not ( = ?auto_441684 ?auto_441685 ) ) ( not ( = ?auto_441684 ?auto_441686 ) ) ( not ( = ?auto_441684 ?auto_441687 ) ) ( not ( = ?auto_441684 ?auto_441688 ) ) ( not ( = ?auto_441684 ?auto_441689 ) ) ( not ( = ?auto_441684 ?auto_441690 ) ) ( not ( = ?auto_441684 ?auto_441691 ) ) ( not ( = ?auto_441684 ?auto_441692 ) ) ( not ( = ?auto_441684 ?auto_441693 ) ) ( not ( = ?auto_441684 ?auto_441694 ) ) ( not ( = ?auto_441684 ?auto_441695 ) ) ( not ( = ?auto_441684 ?auto_441696 ) ) ( not ( = ?auto_441685 ?auto_441686 ) ) ( not ( = ?auto_441685 ?auto_441687 ) ) ( not ( = ?auto_441685 ?auto_441688 ) ) ( not ( = ?auto_441685 ?auto_441689 ) ) ( not ( = ?auto_441685 ?auto_441690 ) ) ( not ( = ?auto_441685 ?auto_441691 ) ) ( not ( = ?auto_441685 ?auto_441692 ) ) ( not ( = ?auto_441685 ?auto_441693 ) ) ( not ( = ?auto_441685 ?auto_441694 ) ) ( not ( = ?auto_441685 ?auto_441695 ) ) ( not ( = ?auto_441685 ?auto_441696 ) ) ( not ( = ?auto_441686 ?auto_441687 ) ) ( not ( = ?auto_441686 ?auto_441688 ) ) ( not ( = ?auto_441686 ?auto_441689 ) ) ( not ( = ?auto_441686 ?auto_441690 ) ) ( not ( = ?auto_441686 ?auto_441691 ) ) ( not ( = ?auto_441686 ?auto_441692 ) ) ( not ( = ?auto_441686 ?auto_441693 ) ) ( not ( = ?auto_441686 ?auto_441694 ) ) ( not ( = ?auto_441686 ?auto_441695 ) ) ( not ( = ?auto_441686 ?auto_441696 ) ) ( not ( = ?auto_441687 ?auto_441688 ) ) ( not ( = ?auto_441687 ?auto_441689 ) ) ( not ( = ?auto_441687 ?auto_441690 ) ) ( not ( = ?auto_441687 ?auto_441691 ) ) ( not ( = ?auto_441687 ?auto_441692 ) ) ( not ( = ?auto_441687 ?auto_441693 ) ) ( not ( = ?auto_441687 ?auto_441694 ) ) ( not ( = ?auto_441687 ?auto_441695 ) ) ( not ( = ?auto_441687 ?auto_441696 ) ) ( not ( = ?auto_441688 ?auto_441689 ) ) ( not ( = ?auto_441688 ?auto_441690 ) ) ( not ( = ?auto_441688 ?auto_441691 ) ) ( not ( = ?auto_441688 ?auto_441692 ) ) ( not ( = ?auto_441688 ?auto_441693 ) ) ( not ( = ?auto_441688 ?auto_441694 ) ) ( not ( = ?auto_441688 ?auto_441695 ) ) ( not ( = ?auto_441688 ?auto_441696 ) ) ( not ( = ?auto_441689 ?auto_441690 ) ) ( not ( = ?auto_441689 ?auto_441691 ) ) ( not ( = ?auto_441689 ?auto_441692 ) ) ( not ( = ?auto_441689 ?auto_441693 ) ) ( not ( = ?auto_441689 ?auto_441694 ) ) ( not ( = ?auto_441689 ?auto_441695 ) ) ( not ( = ?auto_441689 ?auto_441696 ) ) ( not ( = ?auto_441690 ?auto_441691 ) ) ( not ( = ?auto_441690 ?auto_441692 ) ) ( not ( = ?auto_441690 ?auto_441693 ) ) ( not ( = ?auto_441690 ?auto_441694 ) ) ( not ( = ?auto_441690 ?auto_441695 ) ) ( not ( = ?auto_441690 ?auto_441696 ) ) ( not ( = ?auto_441691 ?auto_441692 ) ) ( not ( = ?auto_441691 ?auto_441693 ) ) ( not ( = ?auto_441691 ?auto_441694 ) ) ( not ( = ?auto_441691 ?auto_441695 ) ) ( not ( = ?auto_441691 ?auto_441696 ) ) ( not ( = ?auto_441692 ?auto_441693 ) ) ( not ( = ?auto_441692 ?auto_441694 ) ) ( not ( = ?auto_441692 ?auto_441695 ) ) ( not ( = ?auto_441692 ?auto_441696 ) ) ( not ( = ?auto_441693 ?auto_441694 ) ) ( not ( = ?auto_441693 ?auto_441695 ) ) ( not ( = ?auto_441693 ?auto_441696 ) ) ( not ( = ?auto_441694 ?auto_441695 ) ) ( not ( = ?auto_441694 ?auto_441696 ) ) ( not ( = ?auto_441695 ?auto_441696 ) ) ( CLEAR ?auto_441693 ) ( ON ?auto_441694 ?auto_441695 ) ( CLEAR ?auto_441694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_441683 ?auto_441684 ?auto_441685 ?auto_441686 ?auto_441687 ?auto_441688 ?auto_441689 ?auto_441690 ?auto_441691 ?auto_441692 ?auto_441693 ?auto_441694 )
      ( MAKE-13PILE ?auto_441683 ?auto_441684 ?auto_441685 ?auto_441686 ?auto_441687 ?auto_441688 ?auto_441689 ?auto_441690 ?auto_441691 ?auto_441692 ?auto_441693 ?auto_441694 ?auto_441695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441737 - BLOCK
      ?auto_441738 - BLOCK
      ?auto_441739 - BLOCK
      ?auto_441740 - BLOCK
      ?auto_441741 - BLOCK
      ?auto_441742 - BLOCK
      ?auto_441743 - BLOCK
      ?auto_441744 - BLOCK
      ?auto_441745 - BLOCK
      ?auto_441746 - BLOCK
      ?auto_441747 - BLOCK
      ?auto_441748 - BLOCK
      ?auto_441749 - BLOCK
    )
    :vars
    (
      ?auto_441750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441749 ?auto_441750 ) ( ON-TABLE ?auto_441737 ) ( ON ?auto_441738 ?auto_441737 ) ( ON ?auto_441739 ?auto_441738 ) ( ON ?auto_441740 ?auto_441739 ) ( ON ?auto_441741 ?auto_441740 ) ( ON ?auto_441742 ?auto_441741 ) ( ON ?auto_441743 ?auto_441742 ) ( ON ?auto_441744 ?auto_441743 ) ( ON ?auto_441745 ?auto_441744 ) ( ON ?auto_441746 ?auto_441745 ) ( not ( = ?auto_441737 ?auto_441738 ) ) ( not ( = ?auto_441737 ?auto_441739 ) ) ( not ( = ?auto_441737 ?auto_441740 ) ) ( not ( = ?auto_441737 ?auto_441741 ) ) ( not ( = ?auto_441737 ?auto_441742 ) ) ( not ( = ?auto_441737 ?auto_441743 ) ) ( not ( = ?auto_441737 ?auto_441744 ) ) ( not ( = ?auto_441737 ?auto_441745 ) ) ( not ( = ?auto_441737 ?auto_441746 ) ) ( not ( = ?auto_441737 ?auto_441747 ) ) ( not ( = ?auto_441737 ?auto_441748 ) ) ( not ( = ?auto_441737 ?auto_441749 ) ) ( not ( = ?auto_441737 ?auto_441750 ) ) ( not ( = ?auto_441738 ?auto_441739 ) ) ( not ( = ?auto_441738 ?auto_441740 ) ) ( not ( = ?auto_441738 ?auto_441741 ) ) ( not ( = ?auto_441738 ?auto_441742 ) ) ( not ( = ?auto_441738 ?auto_441743 ) ) ( not ( = ?auto_441738 ?auto_441744 ) ) ( not ( = ?auto_441738 ?auto_441745 ) ) ( not ( = ?auto_441738 ?auto_441746 ) ) ( not ( = ?auto_441738 ?auto_441747 ) ) ( not ( = ?auto_441738 ?auto_441748 ) ) ( not ( = ?auto_441738 ?auto_441749 ) ) ( not ( = ?auto_441738 ?auto_441750 ) ) ( not ( = ?auto_441739 ?auto_441740 ) ) ( not ( = ?auto_441739 ?auto_441741 ) ) ( not ( = ?auto_441739 ?auto_441742 ) ) ( not ( = ?auto_441739 ?auto_441743 ) ) ( not ( = ?auto_441739 ?auto_441744 ) ) ( not ( = ?auto_441739 ?auto_441745 ) ) ( not ( = ?auto_441739 ?auto_441746 ) ) ( not ( = ?auto_441739 ?auto_441747 ) ) ( not ( = ?auto_441739 ?auto_441748 ) ) ( not ( = ?auto_441739 ?auto_441749 ) ) ( not ( = ?auto_441739 ?auto_441750 ) ) ( not ( = ?auto_441740 ?auto_441741 ) ) ( not ( = ?auto_441740 ?auto_441742 ) ) ( not ( = ?auto_441740 ?auto_441743 ) ) ( not ( = ?auto_441740 ?auto_441744 ) ) ( not ( = ?auto_441740 ?auto_441745 ) ) ( not ( = ?auto_441740 ?auto_441746 ) ) ( not ( = ?auto_441740 ?auto_441747 ) ) ( not ( = ?auto_441740 ?auto_441748 ) ) ( not ( = ?auto_441740 ?auto_441749 ) ) ( not ( = ?auto_441740 ?auto_441750 ) ) ( not ( = ?auto_441741 ?auto_441742 ) ) ( not ( = ?auto_441741 ?auto_441743 ) ) ( not ( = ?auto_441741 ?auto_441744 ) ) ( not ( = ?auto_441741 ?auto_441745 ) ) ( not ( = ?auto_441741 ?auto_441746 ) ) ( not ( = ?auto_441741 ?auto_441747 ) ) ( not ( = ?auto_441741 ?auto_441748 ) ) ( not ( = ?auto_441741 ?auto_441749 ) ) ( not ( = ?auto_441741 ?auto_441750 ) ) ( not ( = ?auto_441742 ?auto_441743 ) ) ( not ( = ?auto_441742 ?auto_441744 ) ) ( not ( = ?auto_441742 ?auto_441745 ) ) ( not ( = ?auto_441742 ?auto_441746 ) ) ( not ( = ?auto_441742 ?auto_441747 ) ) ( not ( = ?auto_441742 ?auto_441748 ) ) ( not ( = ?auto_441742 ?auto_441749 ) ) ( not ( = ?auto_441742 ?auto_441750 ) ) ( not ( = ?auto_441743 ?auto_441744 ) ) ( not ( = ?auto_441743 ?auto_441745 ) ) ( not ( = ?auto_441743 ?auto_441746 ) ) ( not ( = ?auto_441743 ?auto_441747 ) ) ( not ( = ?auto_441743 ?auto_441748 ) ) ( not ( = ?auto_441743 ?auto_441749 ) ) ( not ( = ?auto_441743 ?auto_441750 ) ) ( not ( = ?auto_441744 ?auto_441745 ) ) ( not ( = ?auto_441744 ?auto_441746 ) ) ( not ( = ?auto_441744 ?auto_441747 ) ) ( not ( = ?auto_441744 ?auto_441748 ) ) ( not ( = ?auto_441744 ?auto_441749 ) ) ( not ( = ?auto_441744 ?auto_441750 ) ) ( not ( = ?auto_441745 ?auto_441746 ) ) ( not ( = ?auto_441745 ?auto_441747 ) ) ( not ( = ?auto_441745 ?auto_441748 ) ) ( not ( = ?auto_441745 ?auto_441749 ) ) ( not ( = ?auto_441745 ?auto_441750 ) ) ( not ( = ?auto_441746 ?auto_441747 ) ) ( not ( = ?auto_441746 ?auto_441748 ) ) ( not ( = ?auto_441746 ?auto_441749 ) ) ( not ( = ?auto_441746 ?auto_441750 ) ) ( not ( = ?auto_441747 ?auto_441748 ) ) ( not ( = ?auto_441747 ?auto_441749 ) ) ( not ( = ?auto_441747 ?auto_441750 ) ) ( not ( = ?auto_441748 ?auto_441749 ) ) ( not ( = ?auto_441748 ?auto_441750 ) ) ( not ( = ?auto_441749 ?auto_441750 ) ) ( ON ?auto_441748 ?auto_441749 ) ( CLEAR ?auto_441746 ) ( ON ?auto_441747 ?auto_441748 ) ( CLEAR ?auto_441747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_441737 ?auto_441738 ?auto_441739 ?auto_441740 ?auto_441741 ?auto_441742 ?auto_441743 ?auto_441744 ?auto_441745 ?auto_441746 ?auto_441747 )
      ( MAKE-13PILE ?auto_441737 ?auto_441738 ?auto_441739 ?auto_441740 ?auto_441741 ?auto_441742 ?auto_441743 ?auto_441744 ?auto_441745 ?auto_441746 ?auto_441747 ?auto_441748 ?auto_441749 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441791 - BLOCK
      ?auto_441792 - BLOCK
      ?auto_441793 - BLOCK
      ?auto_441794 - BLOCK
      ?auto_441795 - BLOCK
      ?auto_441796 - BLOCK
      ?auto_441797 - BLOCK
      ?auto_441798 - BLOCK
      ?auto_441799 - BLOCK
      ?auto_441800 - BLOCK
      ?auto_441801 - BLOCK
      ?auto_441802 - BLOCK
      ?auto_441803 - BLOCK
    )
    :vars
    (
      ?auto_441804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441803 ?auto_441804 ) ( ON-TABLE ?auto_441791 ) ( ON ?auto_441792 ?auto_441791 ) ( ON ?auto_441793 ?auto_441792 ) ( ON ?auto_441794 ?auto_441793 ) ( ON ?auto_441795 ?auto_441794 ) ( ON ?auto_441796 ?auto_441795 ) ( ON ?auto_441797 ?auto_441796 ) ( ON ?auto_441798 ?auto_441797 ) ( ON ?auto_441799 ?auto_441798 ) ( not ( = ?auto_441791 ?auto_441792 ) ) ( not ( = ?auto_441791 ?auto_441793 ) ) ( not ( = ?auto_441791 ?auto_441794 ) ) ( not ( = ?auto_441791 ?auto_441795 ) ) ( not ( = ?auto_441791 ?auto_441796 ) ) ( not ( = ?auto_441791 ?auto_441797 ) ) ( not ( = ?auto_441791 ?auto_441798 ) ) ( not ( = ?auto_441791 ?auto_441799 ) ) ( not ( = ?auto_441791 ?auto_441800 ) ) ( not ( = ?auto_441791 ?auto_441801 ) ) ( not ( = ?auto_441791 ?auto_441802 ) ) ( not ( = ?auto_441791 ?auto_441803 ) ) ( not ( = ?auto_441791 ?auto_441804 ) ) ( not ( = ?auto_441792 ?auto_441793 ) ) ( not ( = ?auto_441792 ?auto_441794 ) ) ( not ( = ?auto_441792 ?auto_441795 ) ) ( not ( = ?auto_441792 ?auto_441796 ) ) ( not ( = ?auto_441792 ?auto_441797 ) ) ( not ( = ?auto_441792 ?auto_441798 ) ) ( not ( = ?auto_441792 ?auto_441799 ) ) ( not ( = ?auto_441792 ?auto_441800 ) ) ( not ( = ?auto_441792 ?auto_441801 ) ) ( not ( = ?auto_441792 ?auto_441802 ) ) ( not ( = ?auto_441792 ?auto_441803 ) ) ( not ( = ?auto_441792 ?auto_441804 ) ) ( not ( = ?auto_441793 ?auto_441794 ) ) ( not ( = ?auto_441793 ?auto_441795 ) ) ( not ( = ?auto_441793 ?auto_441796 ) ) ( not ( = ?auto_441793 ?auto_441797 ) ) ( not ( = ?auto_441793 ?auto_441798 ) ) ( not ( = ?auto_441793 ?auto_441799 ) ) ( not ( = ?auto_441793 ?auto_441800 ) ) ( not ( = ?auto_441793 ?auto_441801 ) ) ( not ( = ?auto_441793 ?auto_441802 ) ) ( not ( = ?auto_441793 ?auto_441803 ) ) ( not ( = ?auto_441793 ?auto_441804 ) ) ( not ( = ?auto_441794 ?auto_441795 ) ) ( not ( = ?auto_441794 ?auto_441796 ) ) ( not ( = ?auto_441794 ?auto_441797 ) ) ( not ( = ?auto_441794 ?auto_441798 ) ) ( not ( = ?auto_441794 ?auto_441799 ) ) ( not ( = ?auto_441794 ?auto_441800 ) ) ( not ( = ?auto_441794 ?auto_441801 ) ) ( not ( = ?auto_441794 ?auto_441802 ) ) ( not ( = ?auto_441794 ?auto_441803 ) ) ( not ( = ?auto_441794 ?auto_441804 ) ) ( not ( = ?auto_441795 ?auto_441796 ) ) ( not ( = ?auto_441795 ?auto_441797 ) ) ( not ( = ?auto_441795 ?auto_441798 ) ) ( not ( = ?auto_441795 ?auto_441799 ) ) ( not ( = ?auto_441795 ?auto_441800 ) ) ( not ( = ?auto_441795 ?auto_441801 ) ) ( not ( = ?auto_441795 ?auto_441802 ) ) ( not ( = ?auto_441795 ?auto_441803 ) ) ( not ( = ?auto_441795 ?auto_441804 ) ) ( not ( = ?auto_441796 ?auto_441797 ) ) ( not ( = ?auto_441796 ?auto_441798 ) ) ( not ( = ?auto_441796 ?auto_441799 ) ) ( not ( = ?auto_441796 ?auto_441800 ) ) ( not ( = ?auto_441796 ?auto_441801 ) ) ( not ( = ?auto_441796 ?auto_441802 ) ) ( not ( = ?auto_441796 ?auto_441803 ) ) ( not ( = ?auto_441796 ?auto_441804 ) ) ( not ( = ?auto_441797 ?auto_441798 ) ) ( not ( = ?auto_441797 ?auto_441799 ) ) ( not ( = ?auto_441797 ?auto_441800 ) ) ( not ( = ?auto_441797 ?auto_441801 ) ) ( not ( = ?auto_441797 ?auto_441802 ) ) ( not ( = ?auto_441797 ?auto_441803 ) ) ( not ( = ?auto_441797 ?auto_441804 ) ) ( not ( = ?auto_441798 ?auto_441799 ) ) ( not ( = ?auto_441798 ?auto_441800 ) ) ( not ( = ?auto_441798 ?auto_441801 ) ) ( not ( = ?auto_441798 ?auto_441802 ) ) ( not ( = ?auto_441798 ?auto_441803 ) ) ( not ( = ?auto_441798 ?auto_441804 ) ) ( not ( = ?auto_441799 ?auto_441800 ) ) ( not ( = ?auto_441799 ?auto_441801 ) ) ( not ( = ?auto_441799 ?auto_441802 ) ) ( not ( = ?auto_441799 ?auto_441803 ) ) ( not ( = ?auto_441799 ?auto_441804 ) ) ( not ( = ?auto_441800 ?auto_441801 ) ) ( not ( = ?auto_441800 ?auto_441802 ) ) ( not ( = ?auto_441800 ?auto_441803 ) ) ( not ( = ?auto_441800 ?auto_441804 ) ) ( not ( = ?auto_441801 ?auto_441802 ) ) ( not ( = ?auto_441801 ?auto_441803 ) ) ( not ( = ?auto_441801 ?auto_441804 ) ) ( not ( = ?auto_441802 ?auto_441803 ) ) ( not ( = ?auto_441802 ?auto_441804 ) ) ( not ( = ?auto_441803 ?auto_441804 ) ) ( ON ?auto_441802 ?auto_441803 ) ( ON ?auto_441801 ?auto_441802 ) ( CLEAR ?auto_441799 ) ( ON ?auto_441800 ?auto_441801 ) ( CLEAR ?auto_441800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_441791 ?auto_441792 ?auto_441793 ?auto_441794 ?auto_441795 ?auto_441796 ?auto_441797 ?auto_441798 ?auto_441799 ?auto_441800 )
      ( MAKE-13PILE ?auto_441791 ?auto_441792 ?auto_441793 ?auto_441794 ?auto_441795 ?auto_441796 ?auto_441797 ?auto_441798 ?auto_441799 ?auto_441800 ?auto_441801 ?auto_441802 ?auto_441803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441845 - BLOCK
      ?auto_441846 - BLOCK
      ?auto_441847 - BLOCK
      ?auto_441848 - BLOCK
      ?auto_441849 - BLOCK
      ?auto_441850 - BLOCK
      ?auto_441851 - BLOCK
      ?auto_441852 - BLOCK
      ?auto_441853 - BLOCK
      ?auto_441854 - BLOCK
      ?auto_441855 - BLOCK
      ?auto_441856 - BLOCK
      ?auto_441857 - BLOCK
    )
    :vars
    (
      ?auto_441858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441857 ?auto_441858 ) ( ON-TABLE ?auto_441845 ) ( ON ?auto_441846 ?auto_441845 ) ( ON ?auto_441847 ?auto_441846 ) ( ON ?auto_441848 ?auto_441847 ) ( ON ?auto_441849 ?auto_441848 ) ( ON ?auto_441850 ?auto_441849 ) ( ON ?auto_441851 ?auto_441850 ) ( ON ?auto_441852 ?auto_441851 ) ( not ( = ?auto_441845 ?auto_441846 ) ) ( not ( = ?auto_441845 ?auto_441847 ) ) ( not ( = ?auto_441845 ?auto_441848 ) ) ( not ( = ?auto_441845 ?auto_441849 ) ) ( not ( = ?auto_441845 ?auto_441850 ) ) ( not ( = ?auto_441845 ?auto_441851 ) ) ( not ( = ?auto_441845 ?auto_441852 ) ) ( not ( = ?auto_441845 ?auto_441853 ) ) ( not ( = ?auto_441845 ?auto_441854 ) ) ( not ( = ?auto_441845 ?auto_441855 ) ) ( not ( = ?auto_441845 ?auto_441856 ) ) ( not ( = ?auto_441845 ?auto_441857 ) ) ( not ( = ?auto_441845 ?auto_441858 ) ) ( not ( = ?auto_441846 ?auto_441847 ) ) ( not ( = ?auto_441846 ?auto_441848 ) ) ( not ( = ?auto_441846 ?auto_441849 ) ) ( not ( = ?auto_441846 ?auto_441850 ) ) ( not ( = ?auto_441846 ?auto_441851 ) ) ( not ( = ?auto_441846 ?auto_441852 ) ) ( not ( = ?auto_441846 ?auto_441853 ) ) ( not ( = ?auto_441846 ?auto_441854 ) ) ( not ( = ?auto_441846 ?auto_441855 ) ) ( not ( = ?auto_441846 ?auto_441856 ) ) ( not ( = ?auto_441846 ?auto_441857 ) ) ( not ( = ?auto_441846 ?auto_441858 ) ) ( not ( = ?auto_441847 ?auto_441848 ) ) ( not ( = ?auto_441847 ?auto_441849 ) ) ( not ( = ?auto_441847 ?auto_441850 ) ) ( not ( = ?auto_441847 ?auto_441851 ) ) ( not ( = ?auto_441847 ?auto_441852 ) ) ( not ( = ?auto_441847 ?auto_441853 ) ) ( not ( = ?auto_441847 ?auto_441854 ) ) ( not ( = ?auto_441847 ?auto_441855 ) ) ( not ( = ?auto_441847 ?auto_441856 ) ) ( not ( = ?auto_441847 ?auto_441857 ) ) ( not ( = ?auto_441847 ?auto_441858 ) ) ( not ( = ?auto_441848 ?auto_441849 ) ) ( not ( = ?auto_441848 ?auto_441850 ) ) ( not ( = ?auto_441848 ?auto_441851 ) ) ( not ( = ?auto_441848 ?auto_441852 ) ) ( not ( = ?auto_441848 ?auto_441853 ) ) ( not ( = ?auto_441848 ?auto_441854 ) ) ( not ( = ?auto_441848 ?auto_441855 ) ) ( not ( = ?auto_441848 ?auto_441856 ) ) ( not ( = ?auto_441848 ?auto_441857 ) ) ( not ( = ?auto_441848 ?auto_441858 ) ) ( not ( = ?auto_441849 ?auto_441850 ) ) ( not ( = ?auto_441849 ?auto_441851 ) ) ( not ( = ?auto_441849 ?auto_441852 ) ) ( not ( = ?auto_441849 ?auto_441853 ) ) ( not ( = ?auto_441849 ?auto_441854 ) ) ( not ( = ?auto_441849 ?auto_441855 ) ) ( not ( = ?auto_441849 ?auto_441856 ) ) ( not ( = ?auto_441849 ?auto_441857 ) ) ( not ( = ?auto_441849 ?auto_441858 ) ) ( not ( = ?auto_441850 ?auto_441851 ) ) ( not ( = ?auto_441850 ?auto_441852 ) ) ( not ( = ?auto_441850 ?auto_441853 ) ) ( not ( = ?auto_441850 ?auto_441854 ) ) ( not ( = ?auto_441850 ?auto_441855 ) ) ( not ( = ?auto_441850 ?auto_441856 ) ) ( not ( = ?auto_441850 ?auto_441857 ) ) ( not ( = ?auto_441850 ?auto_441858 ) ) ( not ( = ?auto_441851 ?auto_441852 ) ) ( not ( = ?auto_441851 ?auto_441853 ) ) ( not ( = ?auto_441851 ?auto_441854 ) ) ( not ( = ?auto_441851 ?auto_441855 ) ) ( not ( = ?auto_441851 ?auto_441856 ) ) ( not ( = ?auto_441851 ?auto_441857 ) ) ( not ( = ?auto_441851 ?auto_441858 ) ) ( not ( = ?auto_441852 ?auto_441853 ) ) ( not ( = ?auto_441852 ?auto_441854 ) ) ( not ( = ?auto_441852 ?auto_441855 ) ) ( not ( = ?auto_441852 ?auto_441856 ) ) ( not ( = ?auto_441852 ?auto_441857 ) ) ( not ( = ?auto_441852 ?auto_441858 ) ) ( not ( = ?auto_441853 ?auto_441854 ) ) ( not ( = ?auto_441853 ?auto_441855 ) ) ( not ( = ?auto_441853 ?auto_441856 ) ) ( not ( = ?auto_441853 ?auto_441857 ) ) ( not ( = ?auto_441853 ?auto_441858 ) ) ( not ( = ?auto_441854 ?auto_441855 ) ) ( not ( = ?auto_441854 ?auto_441856 ) ) ( not ( = ?auto_441854 ?auto_441857 ) ) ( not ( = ?auto_441854 ?auto_441858 ) ) ( not ( = ?auto_441855 ?auto_441856 ) ) ( not ( = ?auto_441855 ?auto_441857 ) ) ( not ( = ?auto_441855 ?auto_441858 ) ) ( not ( = ?auto_441856 ?auto_441857 ) ) ( not ( = ?auto_441856 ?auto_441858 ) ) ( not ( = ?auto_441857 ?auto_441858 ) ) ( ON ?auto_441856 ?auto_441857 ) ( ON ?auto_441855 ?auto_441856 ) ( ON ?auto_441854 ?auto_441855 ) ( CLEAR ?auto_441852 ) ( ON ?auto_441853 ?auto_441854 ) ( CLEAR ?auto_441853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_441845 ?auto_441846 ?auto_441847 ?auto_441848 ?auto_441849 ?auto_441850 ?auto_441851 ?auto_441852 ?auto_441853 )
      ( MAKE-13PILE ?auto_441845 ?auto_441846 ?auto_441847 ?auto_441848 ?auto_441849 ?auto_441850 ?auto_441851 ?auto_441852 ?auto_441853 ?auto_441854 ?auto_441855 ?auto_441856 ?auto_441857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441899 - BLOCK
      ?auto_441900 - BLOCK
      ?auto_441901 - BLOCK
      ?auto_441902 - BLOCK
      ?auto_441903 - BLOCK
      ?auto_441904 - BLOCK
      ?auto_441905 - BLOCK
      ?auto_441906 - BLOCK
      ?auto_441907 - BLOCK
      ?auto_441908 - BLOCK
      ?auto_441909 - BLOCK
      ?auto_441910 - BLOCK
      ?auto_441911 - BLOCK
    )
    :vars
    (
      ?auto_441912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441911 ?auto_441912 ) ( ON-TABLE ?auto_441899 ) ( ON ?auto_441900 ?auto_441899 ) ( ON ?auto_441901 ?auto_441900 ) ( ON ?auto_441902 ?auto_441901 ) ( ON ?auto_441903 ?auto_441902 ) ( ON ?auto_441904 ?auto_441903 ) ( ON ?auto_441905 ?auto_441904 ) ( not ( = ?auto_441899 ?auto_441900 ) ) ( not ( = ?auto_441899 ?auto_441901 ) ) ( not ( = ?auto_441899 ?auto_441902 ) ) ( not ( = ?auto_441899 ?auto_441903 ) ) ( not ( = ?auto_441899 ?auto_441904 ) ) ( not ( = ?auto_441899 ?auto_441905 ) ) ( not ( = ?auto_441899 ?auto_441906 ) ) ( not ( = ?auto_441899 ?auto_441907 ) ) ( not ( = ?auto_441899 ?auto_441908 ) ) ( not ( = ?auto_441899 ?auto_441909 ) ) ( not ( = ?auto_441899 ?auto_441910 ) ) ( not ( = ?auto_441899 ?auto_441911 ) ) ( not ( = ?auto_441899 ?auto_441912 ) ) ( not ( = ?auto_441900 ?auto_441901 ) ) ( not ( = ?auto_441900 ?auto_441902 ) ) ( not ( = ?auto_441900 ?auto_441903 ) ) ( not ( = ?auto_441900 ?auto_441904 ) ) ( not ( = ?auto_441900 ?auto_441905 ) ) ( not ( = ?auto_441900 ?auto_441906 ) ) ( not ( = ?auto_441900 ?auto_441907 ) ) ( not ( = ?auto_441900 ?auto_441908 ) ) ( not ( = ?auto_441900 ?auto_441909 ) ) ( not ( = ?auto_441900 ?auto_441910 ) ) ( not ( = ?auto_441900 ?auto_441911 ) ) ( not ( = ?auto_441900 ?auto_441912 ) ) ( not ( = ?auto_441901 ?auto_441902 ) ) ( not ( = ?auto_441901 ?auto_441903 ) ) ( not ( = ?auto_441901 ?auto_441904 ) ) ( not ( = ?auto_441901 ?auto_441905 ) ) ( not ( = ?auto_441901 ?auto_441906 ) ) ( not ( = ?auto_441901 ?auto_441907 ) ) ( not ( = ?auto_441901 ?auto_441908 ) ) ( not ( = ?auto_441901 ?auto_441909 ) ) ( not ( = ?auto_441901 ?auto_441910 ) ) ( not ( = ?auto_441901 ?auto_441911 ) ) ( not ( = ?auto_441901 ?auto_441912 ) ) ( not ( = ?auto_441902 ?auto_441903 ) ) ( not ( = ?auto_441902 ?auto_441904 ) ) ( not ( = ?auto_441902 ?auto_441905 ) ) ( not ( = ?auto_441902 ?auto_441906 ) ) ( not ( = ?auto_441902 ?auto_441907 ) ) ( not ( = ?auto_441902 ?auto_441908 ) ) ( not ( = ?auto_441902 ?auto_441909 ) ) ( not ( = ?auto_441902 ?auto_441910 ) ) ( not ( = ?auto_441902 ?auto_441911 ) ) ( not ( = ?auto_441902 ?auto_441912 ) ) ( not ( = ?auto_441903 ?auto_441904 ) ) ( not ( = ?auto_441903 ?auto_441905 ) ) ( not ( = ?auto_441903 ?auto_441906 ) ) ( not ( = ?auto_441903 ?auto_441907 ) ) ( not ( = ?auto_441903 ?auto_441908 ) ) ( not ( = ?auto_441903 ?auto_441909 ) ) ( not ( = ?auto_441903 ?auto_441910 ) ) ( not ( = ?auto_441903 ?auto_441911 ) ) ( not ( = ?auto_441903 ?auto_441912 ) ) ( not ( = ?auto_441904 ?auto_441905 ) ) ( not ( = ?auto_441904 ?auto_441906 ) ) ( not ( = ?auto_441904 ?auto_441907 ) ) ( not ( = ?auto_441904 ?auto_441908 ) ) ( not ( = ?auto_441904 ?auto_441909 ) ) ( not ( = ?auto_441904 ?auto_441910 ) ) ( not ( = ?auto_441904 ?auto_441911 ) ) ( not ( = ?auto_441904 ?auto_441912 ) ) ( not ( = ?auto_441905 ?auto_441906 ) ) ( not ( = ?auto_441905 ?auto_441907 ) ) ( not ( = ?auto_441905 ?auto_441908 ) ) ( not ( = ?auto_441905 ?auto_441909 ) ) ( not ( = ?auto_441905 ?auto_441910 ) ) ( not ( = ?auto_441905 ?auto_441911 ) ) ( not ( = ?auto_441905 ?auto_441912 ) ) ( not ( = ?auto_441906 ?auto_441907 ) ) ( not ( = ?auto_441906 ?auto_441908 ) ) ( not ( = ?auto_441906 ?auto_441909 ) ) ( not ( = ?auto_441906 ?auto_441910 ) ) ( not ( = ?auto_441906 ?auto_441911 ) ) ( not ( = ?auto_441906 ?auto_441912 ) ) ( not ( = ?auto_441907 ?auto_441908 ) ) ( not ( = ?auto_441907 ?auto_441909 ) ) ( not ( = ?auto_441907 ?auto_441910 ) ) ( not ( = ?auto_441907 ?auto_441911 ) ) ( not ( = ?auto_441907 ?auto_441912 ) ) ( not ( = ?auto_441908 ?auto_441909 ) ) ( not ( = ?auto_441908 ?auto_441910 ) ) ( not ( = ?auto_441908 ?auto_441911 ) ) ( not ( = ?auto_441908 ?auto_441912 ) ) ( not ( = ?auto_441909 ?auto_441910 ) ) ( not ( = ?auto_441909 ?auto_441911 ) ) ( not ( = ?auto_441909 ?auto_441912 ) ) ( not ( = ?auto_441910 ?auto_441911 ) ) ( not ( = ?auto_441910 ?auto_441912 ) ) ( not ( = ?auto_441911 ?auto_441912 ) ) ( ON ?auto_441910 ?auto_441911 ) ( ON ?auto_441909 ?auto_441910 ) ( ON ?auto_441908 ?auto_441909 ) ( ON ?auto_441907 ?auto_441908 ) ( CLEAR ?auto_441905 ) ( ON ?auto_441906 ?auto_441907 ) ( CLEAR ?auto_441906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_441899 ?auto_441900 ?auto_441901 ?auto_441902 ?auto_441903 ?auto_441904 ?auto_441905 ?auto_441906 )
      ( MAKE-13PILE ?auto_441899 ?auto_441900 ?auto_441901 ?auto_441902 ?auto_441903 ?auto_441904 ?auto_441905 ?auto_441906 ?auto_441907 ?auto_441908 ?auto_441909 ?auto_441910 ?auto_441911 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_441953 - BLOCK
      ?auto_441954 - BLOCK
      ?auto_441955 - BLOCK
      ?auto_441956 - BLOCK
      ?auto_441957 - BLOCK
      ?auto_441958 - BLOCK
      ?auto_441959 - BLOCK
      ?auto_441960 - BLOCK
      ?auto_441961 - BLOCK
      ?auto_441962 - BLOCK
      ?auto_441963 - BLOCK
      ?auto_441964 - BLOCK
      ?auto_441965 - BLOCK
    )
    :vars
    (
      ?auto_441966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_441965 ?auto_441966 ) ( ON-TABLE ?auto_441953 ) ( ON ?auto_441954 ?auto_441953 ) ( ON ?auto_441955 ?auto_441954 ) ( ON ?auto_441956 ?auto_441955 ) ( ON ?auto_441957 ?auto_441956 ) ( ON ?auto_441958 ?auto_441957 ) ( not ( = ?auto_441953 ?auto_441954 ) ) ( not ( = ?auto_441953 ?auto_441955 ) ) ( not ( = ?auto_441953 ?auto_441956 ) ) ( not ( = ?auto_441953 ?auto_441957 ) ) ( not ( = ?auto_441953 ?auto_441958 ) ) ( not ( = ?auto_441953 ?auto_441959 ) ) ( not ( = ?auto_441953 ?auto_441960 ) ) ( not ( = ?auto_441953 ?auto_441961 ) ) ( not ( = ?auto_441953 ?auto_441962 ) ) ( not ( = ?auto_441953 ?auto_441963 ) ) ( not ( = ?auto_441953 ?auto_441964 ) ) ( not ( = ?auto_441953 ?auto_441965 ) ) ( not ( = ?auto_441953 ?auto_441966 ) ) ( not ( = ?auto_441954 ?auto_441955 ) ) ( not ( = ?auto_441954 ?auto_441956 ) ) ( not ( = ?auto_441954 ?auto_441957 ) ) ( not ( = ?auto_441954 ?auto_441958 ) ) ( not ( = ?auto_441954 ?auto_441959 ) ) ( not ( = ?auto_441954 ?auto_441960 ) ) ( not ( = ?auto_441954 ?auto_441961 ) ) ( not ( = ?auto_441954 ?auto_441962 ) ) ( not ( = ?auto_441954 ?auto_441963 ) ) ( not ( = ?auto_441954 ?auto_441964 ) ) ( not ( = ?auto_441954 ?auto_441965 ) ) ( not ( = ?auto_441954 ?auto_441966 ) ) ( not ( = ?auto_441955 ?auto_441956 ) ) ( not ( = ?auto_441955 ?auto_441957 ) ) ( not ( = ?auto_441955 ?auto_441958 ) ) ( not ( = ?auto_441955 ?auto_441959 ) ) ( not ( = ?auto_441955 ?auto_441960 ) ) ( not ( = ?auto_441955 ?auto_441961 ) ) ( not ( = ?auto_441955 ?auto_441962 ) ) ( not ( = ?auto_441955 ?auto_441963 ) ) ( not ( = ?auto_441955 ?auto_441964 ) ) ( not ( = ?auto_441955 ?auto_441965 ) ) ( not ( = ?auto_441955 ?auto_441966 ) ) ( not ( = ?auto_441956 ?auto_441957 ) ) ( not ( = ?auto_441956 ?auto_441958 ) ) ( not ( = ?auto_441956 ?auto_441959 ) ) ( not ( = ?auto_441956 ?auto_441960 ) ) ( not ( = ?auto_441956 ?auto_441961 ) ) ( not ( = ?auto_441956 ?auto_441962 ) ) ( not ( = ?auto_441956 ?auto_441963 ) ) ( not ( = ?auto_441956 ?auto_441964 ) ) ( not ( = ?auto_441956 ?auto_441965 ) ) ( not ( = ?auto_441956 ?auto_441966 ) ) ( not ( = ?auto_441957 ?auto_441958 ) ) ( not ( = ?auto_441957 ?auto_441959 ) ) ( not ( = ?auto_441957 ?auto_441960 ) ) ( not ( = ?auto_441957 ?auto_441961 ) ) ( not ( = ?auto_441957 ?auto_441962 ) ) ( not ( = ?auto_441957 ?auto_441963 ) ) ( not ( = ?auto_441957 ?auto_441964 ) ) ( not ( = ?auto_441957 ?auto_441965 ) ) ( not ( = ?auto_441957 ?auto_441966 ) ) ( not ( = ?auto_441958 ?auto_441959 ) ) ( not ( = ?auto_441958 ?auto_441960 ) ) ( not ( = ?auto_441958 ?auto_441961 ) ) ( not ( = ?auto_441958 ?auto_441962 ) ) ( not ( = ?auto_441958 ?auto_441963 ) ) ( not ( = ?auto_441958 ?auto_441964 ) ) ( not ( = ?auto_441958 ?auto_441965 ) ) ( not ( = ?auto_441958 ?auto_441966 ) ) ( not ( = ?auto_441959 ?auto_441960 ) ) ( not ( = ?auto_441959 ?auto_441961 ) ) ( not ( = ?auto_441959 ?auto_441962 ) ) ( not ( = ?auto_441959 ?auto_441963 ) ) ( not ( = ?auto_441959 ?auto_441964 ) ) ( not ( = ?auto_441959 ?auto_441965 ) ) ( not ( = ?auto_441959 ?auto_441966 ) ) ( not ( = ?auto_441960 ?auto_441961 ) ) ( not ( = ?auto_441960 ?auto_441962 ) ) ( not ( = ?auto_441960 ?auto_441963 ) ) ( not ( = ?auto_441960 ?auto_441964 ) ) ( not ( = ?auto_441960 ?auto_441965 ) ) ( not ( = ?auto_441960 ?auto_441966 ) ) ( not ( = ?auto_441961 ?auto_441962 ) ) ( not ( = ?auto_441961 ?auto_441963 ) ) ( not ( = ?auto_441961 ?auto_441964 ) ) ( not ( = ?auto_441961 ?auto_441965 ) ) ( not ( = ?auto_441961 ?auto_441966 ) ) ( not ( = ?auto_441962 ?auto_441963 ) ) ( not ( = ?auto_441962 ?auto_441964 ) ) ( not ( = ?auto_441962 ?auto_441965 ) ) ( not ( = ?auto_441962 ?auto_441966 ) ) ( not ( = ?auto_441963 ?auto_441964 ) ) ( not ( = ?auto_441963 ?auto_441965 ) ) ( not ( = ?auto_441963 ?auto_441966 ) ) ( not ( = ?auto_441964 ?auto_441965 ) ) ( not ( = ?auto_441964 ?auto_441966 ) ) ( not ( = ?auto_441965 ?auto_441966 ) ) ( ON ?auto_441964 ?auto_441965 ) ( ON ?auto_441963 ?auto_441964 ) ( ON ?auto_441962 ?auto_441963 ) ( ON ?auto_441961 ?auto_441962 ) ( ON ?auto_441960 ?auto_441961 ) ( CLEAR ?auto_441958 ) ( ON ?auto_441959 ?auto_441960 ) ( CLEAR ?auto_441959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_441953 ?auto_441954 ?auto_441955 ?auto_441956 ?auto_441957 ?auto_441958 ?auto_441959 )
      ( MAKE-13PILE ?auto_441953 ?auto_441954 ?auto_441955 ?auto_441956 ?auto_441957 ?auto_441958 ?auto_441959 ?auto_441960 ?auto_441961 ?auto_441962 ?auto_441963 ?auto_441964 ?auto_441965 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442007 - BLOCK
      ?auto_442008 - BLOCK
      ?auto_442009 - BLOCK
      ?auto_442010 - BLOCK
      ?auto_442011 - BLOCK
      ?auto_442012 - BLOCK
      ?auto_442013 - BLOCK
      ?auto_442014 - BLOCK
      ?auto_442015 - BLOCK
      ?auto_442016 - BLOCK
      ?auto_442017 - BLOCK
      ?auto_442018 - BLOCK
      ?auto_442019 - BLOCK
    )
    :vars
    (
      ?auto_442020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442019 ?auto_442020 ) ( ON-TABLE ?auto_442007 ) ( ON ?auto_442008 ?auto_442007 ) ( ON ?auto_442009 ?auto_442008 ) ( ON ?auto_442010 ?auto_442009 ) ( ON ?auto_442011 ?auto_442010 ) ( not ( = ?auto_442007 ?auto_442008 ) ) ( not ( = ?auto_442007 ?auto_442009 ) ) ( not ( = ?auto_442007 ?auto_442010 ) ) ( not ( = ?auto_442007 ?auto_442011 ) ) ( not ( = ?auto_442007 ?auto_442012 ) ) ( not ( = ?auto_442007 ?auto_442013 ) ) ( not ( = ?auto_442007 ?auto_442014 ) ) ( not ( = ?auto_442007 ?auto_442015 ) ) ( not ( = ?auto_442007 ?auto_442016 ) ) ( not ( = ?auto_442007 ?auto_442017 ) ) ( not ( = ?auto_442007 ?auto_442018 ) ) ( not ( = ?auto_442007 ?auto_442019 ) ) ( not ( = ?auto_442007 ?auto_442020 ) ) ( not ( = ?auto_442008 ?auto_442009 ) ) ( not ( = ?auto_442008 ?auto_442010 ) ) ( not ( = ?auto_442008 ?auto_442011 ) ) ( not ( = ?auto_442008 ?auto_442012 ) ) ( not ( = ?auto_442008 ?auto_442013 ) ) ( not ( = ?auto_442008 ?auto_442014 ) ) ( not ( = ?auto_442008 ?auto_442015 ) ) ( not ( = ?auto_442008 ?auto_442016 ) ) ( not ( = ?auto_442008 ?auto_442017 ) ) ( not ( = ?auto_442008 ?auto_442018 ) ) ( not ( = ?auto_442008 ?auto_442019 ) ) ( not ( = ?auto_442008 ?auto_442020 ) ) ( not ( = ?auto_442009 ?auto_442010 ) ) ( not ( = ?auto_442009 ?auto_442011 ) ) ( not ( = ?auto_442009 ?auto_442012 ) ) ( not ( = ?auto_442009 ?auto_442013 ) ) ( not ( = ?auto_442009 ?auto_442014 ) ) ( not ( = ?auto_442009 ?auto_442015 ) ) ( not ( = ?auto_442009 ?auto_442016 ) ) ( not ( = ?auto_442009 ?auto_442017 ) ) ( not ( = ?auto_442009 ?auto_442018 ) ) ( not ( = ?auto_442009 ?auto_442019 ) ) ( not ( = ?auto_442009 ?auto_442020 ) ) ( not ( = ?auto_442010 ?auto_442011 ) ) ( not ( = ?auto_442010 ?auto_442012 ) ) ( not ( = ?auto_442010 ?auto_442013 ) ) ( not ( = ?auto_442010 ?auto_442014 ) ) ( not ( = ?auto_442010 ?auto_442015 ) ) ( not ( = ?auto_442010 ?auto_442016 ) ) ( not ( = ?auto_442010 ?auto_442017 ) ) ( not ( = ?auto_442010 ?auto_442018 ) ) ( not ( = ?auto_442010 ?auto_442019 ) ) ( not ( = ?auto_442010 ?auto_442020 ) ) ( not ( = ?auto_442011 ?auto_442012 ) ) ( not ( = ?auto_442011 ?auto_442013 ) ) ( not ( = ?auto_442011 ?auto_442014 ) ) ( not ( = ?auto_442011 ?auto_442015 ) ) ( not ( = ?auto_442011 ?auto_442016 ) ) ( not ( = ?auto_442011 ?auto_442017 ) ) ( not ( = ?auto_442011 ?auto_442018 ) ) ( not ( = ?auto_442011 ?auto_442019 ) ) ( not ( = ?auto_442011 ?auto_442020 ) ) ( not ( = ?auto_442012 ?auto_442013 ) ) ( not ( = ?auto_442012 ?auto_442014 ) ) ( not ( = ?auto_442012 ?auto_442015 ) ) ( not ( = ?auto_442012 ?auto_442016 ) ) ( not ( = ?auto_442012 ?auto_442017 ) ) ( not ( = ?auto_442012 ?auto_442018 ) ) ( not ( = ?auto_442012 ?auto_442019 ) ) ( not ( = ?auto_442012 ?auto_442020 ) ) ( not ( = ?auto_442013 ?auto_442014 ) ) ( not ( = ?auto_442013 ?auto_442015 ) ) ( not ( = ?auto_442013 ?auto_442016 ) ) ( not ( = ?auto_442013 ?auto_442017 ) ) ( not ( = ?auto_442013 ?auto_442018 ) ) ( not ( = ?auto_442013 ?auto_442019 ) ) ( not ( = ?auto_442013 ?auto_442020 ) ) ( not ( = ?auto_442014 ?auto_442015 ) ) ( not ( = ?auto_442014 ?auto_442016 ) ) ( not ( = ?auto_442014 ?auto_442017 ) ) ( not ( = ?auto_442014 ?auto_442018 ) ) ( not ( = ?auto_442014 ?auto_442019 ) ) ( not ( = ?auto_442014 ?auto_442020 ) ) ( not ( = ?auto_442015 ?auto_442016 ) ) ( not ( = ?auto_442015 ?auto_442017 ) ) ( not ( = ?auto_442015 ?auto_442018 ) ) ( not ( = ?auto_442015 ?auto_442019 ) ) ( not ( = ?auto_442015 ?auto_442020 ) ) ( not ( = ?auto_442016 ?auto_442017 ) ) ( not ( = ?auto_442016 ?auto_442018 ) ) ( not ( = ?auto_442016 ?auto_442019 ) ) ( not ( = ?auto_442016 ?auto_442020 ) ) ( not ( = ?auto_442017 ?auto_442018 ) ) ( not ( = ?auto_442017 ?auto_442019 ) ) ( not ( = ?auto_442017 ?auto_442020 ) ) ( not ( = ?auto_442018 ?auto_442019 ) ) ( not ( = ?auto_442018 ?auto_442020 ) ) ( not ( = ?auto_442019 ?auto_442020 ) ) ( ON ?auto_442018 ?auto_442019 ) ( ON ?auto_442017 ?auto_442018 ) ( ON ?auto_442016 ?auto_442017 ) ( ON ?auto_442015 ?auto_442016 ) ( ON ?auto_442014 ?auto_442015 ) ( ON ?auto_442013 ?auto_442014 ) ( CLEAR ?auto_442011 ) ( ON ?auto_442012 ?auto_442013 ) ( CLEAR ?auto_442012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_442007 ?auto_442008 ?auto_442009 ?auto_442010 ?auto_442011 ?auto_442012 )
      ( MAKE-13PILE ?auto_442007 ?auto_442008 ?auto_442009 ?auto_442010 ?auto_442011 ?auto_442012 ?auto_442013 ?auto_442014 ?auto_442015 ?auto_442016 ?auto_442017 ?auto_442018 ?auto_442019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442061 - BLOCK
      ?auto_442062 - BLOCK
      ?auto_442063 - BLOCK
      ?auto_442064 - BLOCK
      ?auto_442065 - BLOCK
      ?auto_442066 - BLOCK
      ?auto_442067 - BLOCK
      ?auto_442068 - BLOCK
      ?auto_442069 - BLOCK
      ?auto_442070 - BLOCK
      ?auto_442071 - BLOCK
      ?auto_442072 - BLOCK
      ?auto_442073 - BLOCK
    )
    :vars
    (
      ?auto_442074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442073 ?auto_442074 ) ( ON-TABLE ?auto_442061 ) ( ON ?auto_442062 ?auto_442061 ) ( ON ?auto_442063 ?auto_442062 ) ( ON ?auto_442064 ?auto_442063 ) ( not ( = ?auto_442061 ?auto_442062 ) ) ( not ( = ?auto_442061 ?auto_442063 ) ) ( not ( = ?auto_442061 ?auto_442064 ) ) ( not ( = ?auto_442061 ?auto_442065 ) ) ( not ( = ?auto_442061 ?auto_442066 ) ) ( not ( = ?auto_442061 ?auto_442067 ) ) ( not ( = ?auto_442061 ?auto_442068 ) ) ( not ( = ?auto_442061 ?auto_442069 ) ) ( not ( = ?auto_442061 ?auto_442070 ) ) ( not ( = ?auto_442061 ?auto_442071 ) ) ( not ( = ?auto_442061 ?auto_442072 ) ) ( not ( = ?auto_442061 ?auto_442073 ) ) ( not ( = ?auto_442061 ?auto_442074 ) ) ( not ( = ?auto_442062 ?auto_442063 ) ) ( not ( = ?auto_442062 ?auto_442064 ) ) ( not ( = ?auto_442062 ?auto_442065 ) ) ( not ( = ?auto_442062 ?auto_442066 ) ) ( not ( = ?auto_442062 ?auto_442067 ) ) ( not ( = ?auto_442062 ?auto_442068 ) ) ( not ( = ?auto_442062 ?auto_442069 ) ) ( not ( = ?auto_442062 ?auto_442070 ) ) ( not ( = ?auto_442062 ?auto_442071 ) ) ( not ( = ?auto_442062 ?auto_442072 ) ) ( not ( = ?auto_442062 ?auto_442073 ) ) ( not ( = ?auto_442062 ?auto_442074 ) ) ( not ( = ?auto_442063 ?auto_442064 ) ) ( not ( = ?auto_442063 ?auto_442065 ) ) ( not ( = ?auto_442063 ?auto_442066 ) ) ( not ( = ?auto_442063 ?auto_442067 ) ) ( not ( = ?auto_442063 ?auto_442068 ) ) ( not ( = ?auto_442063 ?auto_442069 ) ) ( not ( = ?auto_442063 ?auto_442070 ) ) ( not ( = ?auto_442063 ?auto_442071 ) ) ( not ( = ?auto_442063 ?auto_442072 ) ) ( not ( = ?auto_442063 ?auto_442073 ) ) ( not ( = ?auto_442063 ?auto_442074 ) ) ( not ( = ?auto_442064 ?auto_442065 ) ) ( not ( = ?auto_442064 ?auto_442066 ) ) ( not ( = ?auto_442064 ?auto_442067 ) ) ( not ( = ?auto_442064 ?auto_442068 ) ) ( not ( = ?auto_442064 ?auto_442069 ) ) ( not ( = ?auto_442064 ?auto_442070 ) ) ( not ( = ?auto_442064 ?auto_442071 ) ) ( not ( = ?auto_442064 ?auto_442072 ) ) ( not ( = ?auto_442064 ?auto_442073 ) ) ( not ( = ?auto_442064 ?auto_442074 ) ) ( not ( = ?auto_442065 ?auto_442066 ) ) ( not ( = ?auto_442065 ?auto_442067 ) ) ( not ( = ?auto_442065 ?auto_442068 ) ) ( not ( = ?auto_442065 ?auto_442069 ) ) ( not ( = ?auto_442065 ?auto_442070 ) ) ( not ( = ?auto_442065 ?auto_442071 ) ) ( not ( = ?auto_442065 ?auto_442072 ) ) ( not ( = ?auto_442065 ?auto_442073 ) ) ( not ( = ?auto_442065 ?auto_442074 ) ) ( not ( = ?auto_442066 ?auto_442067 ) ) ( not ( = ?auto_442066 ?auto_442068 ) ) ( not ( = ?auto_442066 ?auto_442069 ) ) ( not ( = ?auto_442066 ?auto_442070 ) ) ( not ( = ?auto_442066 ?auto_442071 ) ) ( not ( = ?auto_442066 ?auto_442072 ) ) ( not ( = ?auto_442066 ?auto_442073 ) ) ( not ( = ?auto_442066 ?auto_442074 ) ) ( not ( = ?auto_442067 ?auto_442068 ) ) ( not ( = ?auto_442067 ?auto_442069 ) ) ( not ( = ?auto_442067 ?auto_442070 ) ) ( not ( = ?auto_442067 ?auto_442071 ) ) ( not ( = ?auto_442067 ?auto_442072 ) ) ( not ( = ?auto_442067 ?auto_442073 ) ) ( not ( = ?auto_442067 ?auto_442074 ) ) ( not ( = ?auto_442068 ?auto_442069 ) ) ( not ( = ?auto_442068 ?auto_442070 ) ) ( not ( = ?auto_442068 ?auto_442071 ) ) ( not ( = ?auto_442068 ?auto_442072 ) ) ( not ( = ?auto_442068 ?auto_442073 ) ) ( not ( = ?auto_442068 ?auto_442074 ) ) ( not ( = ?auto_442069 ?auto_442070 ) ) ( not ( = ?auto_442069 ?auto_442071 ) ) ( not ( = ?auto_442069 ?auto_442072 ) ) ( not ( = ?auto_442069 ?auto_442073 ) ) ( not ( = ?auto_442069 ?auto_442074 ) ) ( not ( = ?auto_442070 ?auto_442071 ) ) ( not ( = ?auto_442070 ?auto_442072 ) ) ( not ( = ?auto_442070 ?auto_442073 ) ) ( not ( = ?auto_442070 ?auto_442074 ) ) ( not ( = ?auto_442071 ?auto_442072 ) ) ( not ( = ?auto_442071 ?auto_442073 ) ) ( not ( = ?auto_442071 ?auto_442074 ) ) ( not ( = ?auto_442072 ?auto_442073 ) ) ( not ( = ?auto_442072 ?auto_442074 ) ) ( not ( = ?auto_442073 ?auto_442074 ) ) ( ON ?auto_442072 ?auto_442073 ) ( ON ?auto_442071 ?auto_442072 ) ( ON ?auto_442070 ?auto_442071 ) ( ON ?auto_442069 ?auto_442070 ) ( ON ?auto_442068 ?auto_442069 ) ( ON ?auto_442067 ?auto_442068 ) ( ON ?auto_442066 ?auto_442067 ) ( CLEAR ?auto_442064 ) ( ON ?auto_442065 ?auto_442066 ) ( CLEAR ?auto_442065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_442061 ?auto_442062 ?auto_442063 ?auto_442064 ?auto_442065 )
      ( MAKE-13PILE ?auto_442061 ?auto_442062 ?auto_442063 ?auto_442064 ?auto_442065 ?auto_442066 ?auto_442067 ?auto_442068 ?auto_442069 ?auto_442070 ?auto_442071 ?auto_442072 ?auto_442073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442115 - BLOCK
      ?auto_442116 - BLOCK
      ?auto_442117 - BLOCK
      ?auto_442118 - BLOCK
      ?auto_442119 - BLOCK
      ?auto_442120 - BLOCK
      ?auto_442121 - BLOCK
      ?auto_442122 - BLOCK
      ?auto_442123 - BLOCK
      ?auto_442124 - BLOCK
      ?auto_442125 - BLOCK
      ?auto_442126 - BLOCK
      ?auto_442127 - BLOCK
    )
    :vars
    (
      ?auto_442128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442127 ?auto_442128 ) ( ON-TABLE ?auto_442115 ) ( ON ?auto_442116 ?auto_442115 ) ( ON ?auto_442117 ?auto_442116 ) ( not ( = ?auto_442115 ?auto_442116 ) ) ( not ( = ?auto_442115 ?auto_442117 ) ) ( not ( = ?auto_442115 ?auto_442118 ) ) ( not ( = ?auto_442115 ?auto_442119 ) ) ( not ( = ?auto_442115 ?auto_442120 ) ) ( not ( = ?auto_442115 ?auto_442121 ) ) ( not ( = ?auto_442115 ?auto_442122 ) ) ( not ( = ?auto_442115 ?auto_442123 ) ) ( not ( = ?auto_442115 ?auto_442124 ) ) ( not ( = ?auto_442115 ?auto_442125 ) ) ( not ( = ?auto_442115 ?auto_442126 ) ) ( not ( = ?auto_442115 ?auto_442127 ) ) ( not ( = ?auto_442115 ?auto_442128 ) ) ( not ( = ?auto_442116 ?auto_442117 ) ) ( not ( = ?auto_442116 ?auto_442118 ) ) ( not ( = ?auto_442116 ?auto_442119 ) ) ( not ( = ?auto_442116 ?auto_442120 ) ) ( not ( = ?auto_442116 ?auto_442121 ) ) ( not ( = ?auto_442116 ?auto_442122 ) ) ( not ( = ?auto_442116 ?auto_442123 ) ) ( not ( = ?auto_442116 ?auto_442124 ) ) ( not ( = ?auto_442116 ?auto_442125 ) ) ( not ( = ?auto_442116 ?auto_442126 ) ) ( not ( = ?auto_442116 ?auto_442127 ) ) ( not ( = ?auto_442116 ?auto_442128 ) ) ( not ( = ?auto_442117 ?auto_442118 ) ) ( not ( = ?auto_442117 ?auto_442119 ) ) ( not ( = ?auto_442117 ?auto_442120 ) ) ( not ( = ?auto_442117 ?auto_442121 ) ) ( not ( = ?auto_442117 ?auto_442122 ) ) ( not ( = ?auto_442117 ?auto_442123 ) ) ( not ( = ?auto_442117 ?auto_442124 ) ) ( not ( = ?auto_442117 ?auto_442125 ) ) ( not ( = ?auto_442117 ?auto_442126 ) ) ( not ( = ?auto_442117 ?auto_442127 ) ) ( not ( = ?auto_442117 ?auto_442128 ) ) ( not ( = ?auto_442118 ?auto_442119 ) ) ( not ( = ?auto_442118 ?auto_442120 ) ) ( not ( = ?auto_442118 ?auto_442121 ) ) ( not ( = ?auto_442118 ?auto_442122 ) ) ( not ( = ?auto_442118 ?auto_442123 ) ) ( not ( = ?auto_442118 ?auto_442124 ) ) ( not ( = ?auto_442118 ?auto_442125 ) ) ( not ( = ?auto_442118 ?auto_442126 ) ) ( not ( = ?auto_442118 ?auto_442127 ) ) ( not ( = ?auto_442118 ?auto_442128 ) ) ( not ( = ?auto_442119 ?auto_442120 ) ) ( not ( = ?auto_442119 ?auto_442121 ) ) ( not ( = ?auto_442119 ?auto_442122 ) ) ( not ( = ?auto_442119 ?auto_442123 ) ) ( not ( = ?auto_442119 ?auto_442124 ) ) ( not ( = ?auto_442119 ?auto_442125 ) ) ( not ( = ?auto_442119 ?auto_442126 ) ) ( not ( = ?auto_442119 ?auto_442127 ) ) ( not ( = ?auto_442119 ?auto_442128 ) ) ( not ( = ?auto_442120 ?auto_442121 ) ) ( not ( = ?auto_442120 ?auto_442122 ) ) ( not ( = ?auto_442120 ?auto_442123 ) ) ( not ( = ?auto_442120 ?auto_442124 ) ) ( not ( = ?auto_442120 ?auto_442125 ) ) ( not ( = ?auto_442120 ?auto_442126 ) ) ( not ( = ?auto_442120 ?auto_442127 ) ) ( not ( = ?auto_442120 ?auto_442128 ) ) ( not ( = ?auto_442121 ?auto_442122 ) ) ( not ( = ?auto_442121 ?auto_442123 ) ) ( not ( = ?auto_442121 ?auto_442124 ) ) ( not ( = ?auto_442121 ?auto_442125 ) ) ( not ( = ?auto_442121 ?auto_442126 ) ) ( not ( = ?auto_442121 ?auto_442127 ) ) ( not ( = ?auto_442121 ?auto_442128 ) ) ( not ( = ?auto_442122 ?auto_442123 ) ) ( not ( = ?auto_442122 ?auto_442124 ) ) ( not ( = ?auto_442122 ?auto_442125 ) ) ( not ( = ?auto_442122 ?auto_442126 ) ) ( not ( = ?auto_442122 ?auto_442127 ) ) ( not ( = ?auto_442122 ?auto_442128 ) ) ( not ( = ?auto_442123 ?auto_442124 ) ) ( not ( = ?auto_442123 ?auto_442125 ) ) ( not ( = ?auto_442123 ?auto_442126 ) ) ( not ( = ?auto_442123 ?auto_442127 ) ) ( not ( = ?auto_442123 ?auto_442128 ) ) ( not ( = ?auto_442124 ?auto_442125 ) ) ( not ( = ?auto_442124 ?auto_442126 ) ) ( not ( = ?auto_442124 ?auto_442127 ) ) ( not ( = ?auto_442124 ?auto_442128 ) ) ( not ( = ?auto_442125 ?auto_442126 ) ) ( not ( = ?auto_442125 ?auto_442127 ) ) ( not ( = ?auto_442125 ?auto_442128 ) ) ( not ( = ?auto_442126 ?auto_442127 ) ) ( not ( = ?auto_442126 ?auto_442128 ) ) ( not ( = ?auto_442127 ?auto_442128 ) ) ( ON ?auto_442126 ?auto_442127 ) ( ON ?auto_442125 ?auto_442126 ) ( ON ?auto_442124 ?auto_442125 ) ( ON ?auto_442123 ?auto_442124 ) ( ON ?auto_442122 ?auto_442123 ) ( ON ?auto_442121 ?auto_442122 ) ( ON ?auto_442120 ?auto_442121 ) ( ON ?auto_442119 ?auto_442120 ) ( CLEAR ?auto_442117 ) ( ON ?auto_442118 ?auto_442119 ) ( CLEAR ?auto_442118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_442115 ?auto_442116 ?auto_442117 ?auto_442118 )
      ( MAKE-13PILE ?auto_442115 ?auto_442116 ?auto_442117 ?auto_442118 ?auto_442119 ?auto_442120 ?auto_442121 ?auto_442122 ?auto_442123 ?auto_442124 ?auto_442125 ?auto_442126 ?auto_442127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442169 - BLOCK
      ?auto_442170 - BLOCK
      ?auto_442171 - BLOCK
      ?auto_442172 - BLOCK
      ?auto_442173 - BLOCK
      ?auto_442174 - BLOCK
      ?auto_442175 - BLOCK
      ?auto_442176 - BLOCK
      ?auto_442177 - BLOCK
      ?auto_442178 - BLOCK
      ?auto_442179 - BLOCK
      ?auto_442180 - BLOCK
      ?auto_442181 - BLOCK
    )
    :vars
    (
      ?auto_442182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442181 ?auto_442182 ) ( ON-TABLE ?auto_442169 ) ( ON ?auto_442170 ?auto_442169 ) ( not ( = ?auto_442169 ?auto_442170 ) ) ( not ( = ?auto_442169 ?auto_442171 ) ) ( not ( = ?auto_442169 ?auto_442172 ) ) ( not ( = ?auto_442169 ?auto_442173 ) ) ( not ( = ?auto_442169 ?auto_442174 ) ) ( not ( = ?auto_442169 ?auto_442175 ) ) ( not ( = ?auto_442169 ?auto_442176 ) ) ( not ( = ?auto_442169 ?auto_442177 ) ) ( not ( = ?auto_442169 ?auto_442178 ) ) ( not ( = ?auto_442169 ?auto_442179 ) ) ( not ( = ?auto_442169 ?auto_442180 ) ) ( not ( = ?auto_442169 ?auto_442181 ) ) ( not ( = ?auto_442169 ?auto_442182 ) ) ( not ( = ?auto_442170 ?auto_442171 ) ) ( not ( = ?auto_442170 ?auto_442172 ) ) ( not ( = ?auto_442170 ?auto_442173 ) ) ( not ( = ?auto_442170 ?auto_442174 ) ) ( not ( = ?auto_442170 ?auto_442175 ) ) ( not ( = ?auto_442170 ?auto_442176 ) ) ( not ( = ?auto_442170 ?auto_442177 ) ) ( not ( = ?auto_442170 ?auto_442178 ) ) ( not ( = ?auto_442170 ?auto_442179 ) ) ( not ( = ?auto_442170 ?auto_442180 ) ) ( not ( = ?auto_442170 ?auto_442181 ) ) ( not ( = ?auto_442170 ?auto_442182 ) ) ( not ( = ?auto_442171 ?auto_442172 ) ) ( not ( = ?auto_442171 ?auto_442173 ) ) ( not ( = ?auto_442171 ?auto_442174 ) ) ( not ( = ?auto_442171 ?auto_442175 ) ) ( not ( = ?auto_442171 ?auto_442176 ) ) ( not ( = ?auto_442171 ?auto_442177 ) ) ( not ( = ?auto_442171 ?auto_442178 ) ) ( not ( = ?auto_442171 ?auto_442179 ) ) ( not ( = ?auto_442171 ?auto_442180 ) ) ( not ( = ?auto_442171 ?auto_442181 ) ) ( not ( = ?auto_442171 ?auto_442182 ) ) ( not ( = ?auto_442172 ?auto_442173 ) ) ( not ( = ?auto_442172 ?auto_442174 ) ) ( not ( = ?auto_442172 ?auto_442175 ) ) ( not ( = ?auto_442172 ?auto_442176 ) ) ( not ( = ?auto_442172 ?auto_442177 ) ) ( not ( = ?auto_442172 ?auto_442178 ) ) ( not ( = ?auto_442172 ?auto_442179 ) ) ( not ( = ?auto_442172 ?auto_442180 ) ) ( not ( = ?auto_442172 ?auto_442181 ) ) ( not ( = ?auto_442172 ?auto_442182 ) ) ( not ( = ?auto_442173 ?auto_442174 ) ) ( not ( = ?auto_442173 ?auto_442175 ) ) ( not ( = ?auto_442173 ?auto_442176 ) ) ( not ( = ?auto_442173 ?auto_442177 ) ) ( not ( = ?auto_442173 ?auto_442178 ) ) ( not ( = ?auto_442173 ?auto_442179 ) ) ( not ( = ?auto_442173 ?auto_442180 ) ) ( not ( = ?auto_442173 ?auto_442181 ) ) ( not ( = ?auto_442173 ?auto_442182 ) ) ( not ( = ?auto_442174 ?auto_442175 ) ) ( not ( = ?auto_442174 ?auto_442176 ) ) ( not ( = ?auto_442174 ?auto_442177 ) ) ( not ( = ?auto_442174 ?auto_442178 ) ) ( not ( = ?auto_442174 ?auto_442179 ) ) ( not ( = ?auto_442174 ?auto_442180 ) ) ( not ( = ?auto_442174 ?auto_442181 ) ) ( not ( = ?auto_442174 ?auto_442182 ) ) ( not ( = ?auto_442175 ?auto_442176 ) ) ( not ( = ?auto_442175 ?auto_442177 ) ) ( not ( = ?auto_442175 ?auto_442178 ) ) ( not ( = ?auto_442175 ?auto_442179 ) ) ( not ( = ?auto_442175 ?auto_442180 ) ) ( not ( = ?auto_442175 ?auto_442181 ) ) ( not ( = ?auto_442175 ?auto_442182 ) ) ( not ( = ?auto_442176 ?auto_442177 ) ) ( not ( = ?auto_442176 ?auto_442178 ) ) ( not ( = ?auto_442176 ?auto_442179 ) ) ( not ( = ?auto_442176 ?auto_442180 ) ) ( not ( = ?auto_442176 ?auto_442181 ) ) ( not ( = ?auto_442176 ?auto_442182 ) ) ( not ( = ?auto_442177 ?auto_442178 ) ) ( not ( = ?auto_442177 ?auto_442179 ) ) ( not ( = ?auto_442177 ?auto_442180 ) ) ( not ( = ?auto_442177 ?auto_442181 ) ) ( not ( = ?auto_442177 ?auto_442182 ) ) ( not ( = ?auto_442178 ?auto_442179 ) ) ( not ( = ?auto_442178 ?auto_442180 ) ) ( not ( = ?auto_442178 ?auto_442181 ) ) ( not ( = ?auto_442178 ?auto_442182 ) ) ( not ( = ?auto_442179 ?auto_442180 ) ) ( not ( = ?auto_442179 ?auto_442181 ) ) ( not ( = ?auto_442179 ?auto_442182 ) ) ( not ( = ?auto_442180 ?auto_442181 ) ) ( not ( = ?auto_442180 ?auto_442182 ) ) ( not ( = ?auto_442181 ?auto_442182 ) ) ( ON ?auto_442180 ?auto_442181 ) ( ON ?auto_442179 ?auto_442180 ) ( ON ?auto_442178 ?auto_442179 ) ( ON ?auto_442177 ?auto_442178 ) ( ON ?auto_442176 ?auto_442177 ) ( ON ?auto_442175 ?auto_442176 ) ( ON ?auto_442174 ?auto_442175 ) ( ON ?auto_442173 ?auto_442174 ) ( ON ?auto_442172 ?auto_442173 ) ( CLEAR ?auto_442170 ) ( ON ?auto_442171 ?auto_442172 ) ( CLEAR ?auto_442171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_442169 ?auto_442170 ?auto_442171 )
      ( MAKE-13PILE ?auto_442169 ?auto_442170 ?auto_442171 ?auto_442172 ?auto_442173 ?auto_442174 ?auto_442175 ?auto_442176 ?auto_442177 ?auto_442178 ?auto_442179 ?auto_442180 ?auto_442181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442223 - BLOCK
      ?auto_442224 - BLOCK
      ?auto_442225 - BLOCK
      ?auto_442226 - BLOCK
      ?auto_442227 - BLOCK
      ?auto_442228 - BLOCK
      ?auto_442229 - BLOCK
      ?auto_442230 - BLOCK
      ?auto_442231 - BLOCK
      ?auto_442232 - BLOCK
      ?auto_442233 - BLOCK
      ?auto_442234 - BLOCK
      ?auto_442235 - BLOCK
    )
    :vars
    (
      ?auto_442236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442235 ?auto_442236 ) ( ON-TABLE ?auto_442223 ) ( not ( = ?auto_442223 ?auto_442224 ) ) ( not ( = ?auto_442223 ?auto_442225 ) ) ( not ( = ?auto_442223 ?auto_442226 ) ) ( not ( = ?auto_442223 ?auto_442227 ) ) ( not ( = ?auto_442223 ?auto_442228 ) ) ( not ( = ?auto_442223 ?auto_442229 ) ) ( not ( = ?auto_442223 ?auto_442230 ) ) ( not ( = ?auto_442223 ?auto_442231 ) ) ( not ( = ?auto_442223 ?auto_442232 ) ) ( not ( = ?auto_442223 ?auto_442233 ) ) ( not ( = ?auto_442223 ?auto_442234 ) ) ( not ( = ?auto_442223 ?auto_442235 ) ) ( not ( = ?auto_442223 ?auto_442236 ) ) ( not ( = ?auto_442224 ?auto_442225 ) ) ( not ( = ?auto_442224 ?auto_442226 ) ) ( not ( = ?auto_442224 ?auto_442227 ) ) ( not ( = ?auto_442224 ?auto_442228 ) ) ( not ( = ?auto_442224 ?auto_442229 ) ) ( not ( = ?auto_442224 ?auto_442230 ) ) ( not ( = ?auto_442224 ?auto_442231 ) ) ( not ( = ?auto_442224 ?auto_442232 ) ) ( not ( = ?auto_442224 ?auto_442233 ) ) ( not ( = ?auto_442224 ?auto_442234 ) ) ( not ( = ?auto_442224 ?auto_442235 ) ) ( not ( = ?auto_442224 ?auto_442236 ) ) ( not ( = ?auto_442225 ?auto_442226 ) ) ( not ( = ?auto_442225 ?auto_442227 ) ) ( not ( = ?auto_442225 ?auto_442228 ) ) ( not ( = ?auto_442225 ?auto_442229 ) ) ( not ( = ?auto_442225 ?auto_442230 ) ) ( not ( = ?auto_442225 ?auto_442231 ) ) ( not ( = ?auto_442225 ?auto_442232 ) ) ( not ( = ?auto_442225 ?auto_442233 ) ) ( not ( = ?auto_442225 ?auto_442234 ) ) ( not ( = ?auto_442225 ?auto_442235 ) ) ( not ( = ?auto_442225 ?auto_442236 ) ) ( not ( = ?auto_442226 ?auto_442227 ) ) ( not ( = ?auto_442226 ?auto_442228 ) ) ( not ( = ?auto_442226 ?auto_442229 ) ) ( not ( = ?auto_442226 ?auto_442230 ) ) ( not ( = ?auto_442226 ?auto_442231 ) ) ( not ( = ?auto_442226 ?auto_442232 ) ) ( not ( = ?auto_442226 ?auto_442233 ) ) ( not ( = ?auto_442226 ?auto_442234 ) ) ( not ( = ?auto_442226 ?auto_442235 ) ) ( not ( = ?auto_442226 ?auto_442236 ) ) ( not ( = ?auto_442227 ?auto_442228 ) ) ( not ( = ?auto_442227 ?auto_442229 ) ) ( not ( = ?auto_442227 ?auto_442230 ) ) ( not ( = ?auto_442227 ?auto_442231 ) ) ( not ( = ?auto_442227 ?auto_442232 ) ) ( not ( = ?auto_442227 ?auto_442233 ) ) ( not ( = ?auto_442227 ?auto_442234 ) ) ( not ( = ?auto_442227 ?auto_442235 ) ) ( not ( = ?auto_442227 ?auto_442236 ) ) ( not ( = ?auto_442228 ?auto_442229 ) ) ( not ( = ?auto_442228 ?auto_442230 ) ) ( not ( = ?auto_442228 ?auto_442231 ) ) ( not ( = ?auto_442228 ?auto_442232 ) ) ( not ( = ?auto_442228 ?auto_442233 ) ) ( not ( = ?auto_442228 ?auto_442234 ) ) ( not ( = ?auto_442228 ?auto_442235 ) ) ( not ( = ?auto_442228 ?auto_442236 ) ) ( not ( = ?auto_442229 ?auto_442230 ) ) ( not ( = ?auto_442229 ?auto_442231 ) ) ( not ( = ?auto_442229 ?auto_442232 ) ) ( not ( = ?auto_442229 ?auto_442233 ) ) ( not ( = ?auto_442229 ?auto_442234 ) ) ( not ( = ?auto_442229 ?auto_442235 ) ) ( not ( = ?auto_442229 ?auto_442236 ) ) ( not ( = ?auto_442230 ?auto_442231 ) ) ( not ( = ?auto_442230 ?auto_442232 ) ) ( not ( = ?auto_442230 ?auto_442233 ) ) ( not ( = ?auto_442230 ?auto_442234 ) ) ( not ( = ?auto_442230 ?auto_442235 ) ) ( not ( = ?auto_442230 ?auto_442236 ) ) ( not ( = ?auto_442231 ?auto_442232 ) ) ( not ( = ?auto_442231 ?auto_442233 ) ) ( not ( = ?auto_442231 ?auto_442234 ) ) ( not ( = ?auto_442231 ?auto_442235 ) ) ( not ( = ?auto_442231 ?auto_442236 ) ) ( not ( = ?auto_442232 ?auto_442233 ) ) ( not ( = ?auto_442232 ?auto_442234 ) ) ( not ( = ?auto_442232 ?auto_442235 ) ) ( not ( = ?auto_442232 ?auto_442236 ) ) ( not ( = ?auto_442233 ?auto_442234 ) ) ( not ( = ?auto_442233 ?auto_442235 ) ) ( not ( = ?auto_442233 ?auto_442236 ) ) ( not ( = ?auto_442234 ?auto_442235 ) ) ( not ( = ?auto_442234 ?auto_442236 ) ) ( not ( = ?auto_442235 ?auto_442236 ) ) ( ON ?auto_442234 ?auto_442235 ) ( ON ?auto_442233 ?auto_442234 ) ( ON ?auto_442232 ?auto_442233 ) ( ON ?auto_442231 ?auto_442232 ) ( ON ?auto_442230 ?auto_442231 ) ( ON ?auto_442229 ?auto_442230 ) ( ON ?auto_442228 ?auto_442229 ) ( ON ?auto_442227 ?auto_442228 ) ( ON ?auto_442226 ?auto_442227 ) ( ON ?auto_442225 ?auto_442226 ) ( CLEAR ?auto_442223 ) ( ON ?auto_442224 ?auto_442225 ) ( CLEAR ?auto_442224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_442223 ?auto_442224 )
      ( MAKE-13PILE ?auto_442223 ?auto_442224 ?auto_442225 ?auto_442226 ?auto_442227 ?auto_442228 ?auto_442229 ?auto_442230 ?auto_442231 ?auto_442232 ?auto_442233 ?auto_442234 ?auto_442235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_442277 - BLOCK
      ?auto_442278 - BLOCK
      ?auto_442279 - BLOCK
      ?auto_442280 - BLOCK
      ?auto_442281 - BLOCK
      ?auto_442282 - BLOCK
      ?auto_442283 - BLOCK
      ?auto_442284 - BLOCK
      ?auto_442285 - BLOCK
      ?auto_442286 - BLOCK
      ?auto_442287 - BLOCK
      ?auto_442288 - BLOCK
      ?auto_442289 - BLOCK
    )
    :vars
    (
      ?auto_442290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442289 ?auto_442290 ) ( not ( = ?auto_442277 ?auto_442278 ) ) ( not ( = ?auto_442277 ?auto_442279 ) ) ( not ( = ?auto_442277 ?auto_442280 ) ) ( not ( = ?auto_442277 ?auto_442281 ) ) ( not ( = ?auto_442277 ?auto_442282 ) ) ( not ( = ?auto_442277 ?auto_442283 ) ) ( not ( = ?auto_442277 ?auto_442284 ) ) ( not ( = ?auto_442277 ?auto_442285 ) ) ( not ( = ?auto_442277 ?auto_442286 ) ) ( not ( = ?auto_442277 ?auto_442287 ) ) ( not ( = ?auto_442277 ?auto_442288 ) ) ( not ( = ?auto_442277 ?auto_442289 ) ) ( not ( = ?auto_442277 ?auto_442290 ) ) ( not ( = ?auto_442278 ?auto_442279 ) ) ( not ( = ?auto_442278 ?auto_442280 ) ) ( not ( = ?auto_442278 ?auto_442281 ) ) ( not ( = ?auto_442278 ?auto_442282 ) ) ( not ( = ?auto_442278 ?auto_442283 ) ) ( not ( = ?auto_442278 ?auto_442284 ) ) ( not ( = ?auto_442278 ?auto_442285 ) ) ( not ( = ?auto_442278 ?auto_442286 ) ) ( not ( = ?auto_442278 ?auto_442287 ) ) ( not ( = ?auto_442278 ?auto_442288 ) ) ( not ( = ?auto_442278 ?auto_442289 ) ) ( not ( = ?auto_442278 ?auto_442290 ) ) ( not ( = ?auto_442279 ?auto_442280 ) ) ( not ( = ?auto_442279 ?auto_442281 ) ) ( not ( = ?auto_442279 ?auto_442282 ) ) ( not ( = ?auto_442279 ?auto_442283 ) ) ( not ( = ?auto_442279 ?auto_442284 ) ) ( not ( = ?auto_442279 ?auto_442285 ) ) ( not ( = ?auto_442279 ?auto_442286 ) ) ( not ( = ?auto_442279 ?auto_442287 ) ) ( not ( = ?auto_442279 ?auto_442288 ) ) ( not ( = ?auto_442279 ?auto_442289 ) ) ( not ( = ?auto_442279 ?auto_442290 ) ) ( not ( = ?auto_442280 ?auto_442281 ) ) ( not ( = ?auto_442280 ?auto_442282 ) ) ( not ( = ?auto_442280 ?auto_442283 ) ) ( not ( = ?auto_442280 ?auto_442284 ) ) ( not ( = ?auto_442280 ?auto_442285 ) ) ( not ( = ?auto_442280 ?auto_442286 ) ) ( not ( = ?auto_442280 ?auto_442287 ) ) ( not ( = ?auto_442280 ?auto_442288 ) ) ( not ( = ?auto_442280 ?auto_442289 ) ) ( not ( = ?auto_442280 ?auto_442290 ) ) ( not ( = ?auto_442281 ?auto_442282 ) ) ( not ( = ?auto_442281 ?auto_442283 ) ) ( not ( = ?auto_442281 ?auto_442284 ) ) ( not ( = ?auto_442281 ?auto_442285 ) ) ( not ( = ?auto_442281 ?auto_442286 ) ) ( not ( = ?auto_442281 ?auto_442287 ) ) ( not ( = ?auto_442281 ?auto_442288 ) ) ( not ( = ?auto_442281 ?auto_442289 ) ) ( not ( = ?auto_442281 ?auto_442290 ) ) ( not ( = ?auto_442282 ?auto_442283 ) ) ( not ( = ?auto_442282 ?auto_442284 ) ) ( not ( = ?auto_442282 ?auto_442285 ) ) ( not ( = ?auto_442282 ?auto_442286 ) ) ( not ( = ?auto_442282 ?auto_442287 ) ) ( not ( = ?auto_442282 ?auto_442288 ) ) ( not ( = ?auto_442282 ?auto_442289 ) ) ( not ( = ?auto_442282 ?auto_442290 ) ) ( not ( = ?auto_442283 ?auto_442284 ) ) ( not ( = ?auto_442283 ?auto_442285 ) ) ( not ( = ?auto_442283 ?auto_442286 ) ) ( not ( = ?auto_442283 ?auto_442287 ) ) ( not ( = ?auto_442283 ?auto_442288 ) ) ( not ( = ?auto_442283 ?auto_442289 ) ) ( not ( = ?auto_442283 ?auto_442290 ) ) ( not ( = ?auto_442284 ?auto_442285 ) ) ( not ( = ?auto_442284 ?auto_442286 ) ) ( not ( = ?auto_442284 ?auto_442287 ) ) ( not ( = ?auto_442284 ?auto_442288 ) ) ( not ( = ?auto_442284 ?auto_442289 ) ) ( not ( = ?auto_442284 ?auto_442290 ) ) ( not ( = ?auto_442285 ?auto_442286 ) ) ( not ( = ?auto_442285 ?auto_442287 ) ) ( not ( = ?auto_442285 ?auto_442288 ) ) ( not ( = ?auto_442285 ?auto_442289 ) ) ( not ( = ?auto_442285 ?auto_442290 ) ) ( not ( = ?auto_442286 ?auto_442287 ) ) ( not ( = ?auto_442286 ?auto_442288 ) ) ( not ( = ?auto_442286 ?auto_442289 ) ) ( not ( = ?auto_442286 ?auto_442290 ) ) ( not ( = ?auto_442287 ?auto_442288 ) ) ( not ( = ?auto_442287 ?auto_442289 ) ) ( not ( = ?auto_442287 ?auto_442290 ) ) ( not ( = ?auto_442288 ?auto_442289 ) ) ( not ( = ?auto_442288 ?auto_442290 ) ) ( not ( = ?auto_442289 ?auto_442290 ) ) ( ON ?auto_442288 ?auto_442289 ) ( ON ?auto_442287 ?auto_442288 ) ( ON ?auto_442286 ?auto_442287 ) ( ON ?auto_442285 ?auto_442286 ) ( ON ?auto_442284 ?auto_442285 ) ( ON ?auto_442283 ?auto_442284 ) ( ON ?auto_442282 ?auto_442283 ) ( ON ?auto_442281 ?auto_442282 ) ( ON ?auto_442280 ?auto_442281 ) ( ON ?auto_442279 ?auto_442280 ) ( ON ?auto_442278 ?auto_442279 ) ( ON ?auto_442277 ?auto_442278 ) ( CLEAR ?auto_442277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_442277 )
      ( MAKE-13PILE ?auto_442277 ?auto_442278 ?auto_442279 ?auto_442280 ?auto_442281 ?auto_442282 ?auto_442283 ?auto_442284 ?auto_442285 ?auto_442286 ?auto_442287 ?auto_442288 ?auto_442289 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442332 - BLOCK
      ?auto_442333 - BLOCK
      ?auto_442334 - BLOCK
      ?auto_442335 - BLOCK
      ?auto_442336 - BLOCK
      ?auto_442337 - BLOCK
      ?auto_442338 - BLOCK
      ?auto_442339 - BLOCK
      ?auto_442340 - BLOCK
      ?auto_442341 - BLOCK
      ?auto_442342 - BLOCK
      ?auto_442343 - BLOCK
      ?auto_442344 - BLOCK
      ?auto_442345 - BLOCK
    )
    :vars
    (
      ?auto_442346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_442344 ) ( ON ?auto_442345 ?auto_442346 ) ( CLEAR ?auto_442345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_442332 ) ( ON ?auto_442333 ?auto_442332 ) ( ON ?auto_442334 ?auto_442333 ) ( ON ?auto_442335 ?auto_442334 ) ( ON ?auto_442336 ?auto_442335 ) ( ON ?auto_442337 ?auto_442336 ) ( ON ?auto_442338 ?auto_442337 ) ( ON ?auto_442339 ?auto_442338 ) ( ON ?auto_442340 ?auto_442339 ) ( ON ?auto_442341 ?auto_442340 ) ( ON ?auto_442342 ?auto_442341 ) ( ON ?auto_442343 ?auto_442342 ) ( ON ?auto_442344 ?auto_442343 ) ( not ( = ?auto_442332 ?auto_442333 ) ) ( not ( = ?auto_442332 ?auto_442334 ) ) ( not ( = ?auto_442332 ?auto_442335 ) ) ( not ( = ?auto_442332 ?auto_442336 ) ) ( not ( = ?auto_442332 ?auto_442337 ) ) ( not ( = ?auto_442332 ?auto_442338 ) ) ( not ( = ?auto_442332 ?auto_442339 ) ) ( not ( = ?auto_442332 ?auto_442340 ) ) ( not ( = ?auto_442332 ?auto_442341 ) ) ( not ( = ?auto_442332 ?auto_442342 ) ) ( not ( = ?auto_442332 ?auto_442343 ) ) ( not ( = ?auto_442332 ?auto_442344 ) ) ( not ( = ?auto_442332 ?auto_442345 ) ) ( not ( = ?auto_442332 ?auto_442346 ) ) ( not ( = ?auto_442333 ?auto_442334 ) ) ( not ( = ?auto_442333 ?auto_442335 ) ) ( not ( = ?auto_442333 ?auto_442336 ) ) ( not ( = ?auto_442333 ?auto_442337 ) ) ( not ( = ?auto_442333 ?auto_442338 ) ) ( not ( = ?auto_442333 ?auto_442339 ) ) ( not ( = ?auto_442333 ?auto_442340 ) ) ( not ( = ?auto_442333 ?auto_442341 ) ) ( not ( = ?auto_442333 ?auto_442342 ) ) ( not ( = ?auto_442333 ?auto_442343 ) ) ( not ( = ?auto_442333 ?auto_442344 ) ) ( not ( = ?auto_442333 ?auto_442345 ) ) ( not ( = ?auto_442333 ?auto_442346 ) ) ( not ( = ?auto_442334 ?auto_442335 ) ) ( not ( = ?auto_442334 ?auto_442336 ) ) ( not ( = ?auto_442334 ?auto_442337 ) ) ( not ( = ?auto_442334 ?auto_442338 ) ) ( not ( = ?auto_442334 ?auto_442339 ) ) ( not ( = ?auto_442334 ?auto_442340 ) ) ( not ( = ?auto_442334 ?auto_442341 ) ) ( not ( = ?auto_442334 ?auto_442342 ) ) ( not ( = ?auto_442334 ?auto_442343 ) ) ( not ( = ?auto_442334 ?auto_442344 ) ) ( not ( = ?auto_442334 ?auto_442345 ) ) ( not ( = ?auto_442334 ?auto_442346 ) ) ( not ( = ?auto_442335 ?auto_442336 ) ) ( not ( = ?auto_442335 ?auto_442337 ) ) ( not ( = ?auto_442335 ?auto_442338 ) ) ( not ( = ?auto_442335 ?auto_442339 ) ) ( not ( = ?auto_442335 ?auto_442340 ) ) ( not ( = ?auto_442335 ?auto_442341 ) ) ( not ( = ?auto_442335 ?auto_442342 ) ) ( not ( = ?auto_442335 ?auto_442343 ) ) ( not ( = ?auto_442335 ?auto_442344 ) ) ( not ( = ?auto_442335 ?auto_442345 ) ) ( not ( = ?auto_442335 ?auto_442346 ) ) ( not ( = ?auto_442336 ?auto_442337 ) ) ( not ( = ?auto_442336 ?auto_442338 ) ) ( not ( = ?auto_442336 ?auto_442339 ) ) ( not ( = ?auto_442336 ?auto_442340 ) ) ( not ( = ?auto_442336 ?auto_442341 ) ) ( not ( = ?auto_442336 ?auto_442342 ) ) ( not ( = ?auto_442336 ?auto_442343 ) ) ( not ( = ?auto_442336 ?auto_442344 ) ) ( not ( = ?auto_442336 ?auto_442345 ) ) ( not ( = ?auto_442336 ?auto_442346 ) ) ( not ( = ?auto_442337 ?auto_442338 ) ) ( not ( = ?auto_442337 ?auto_442339 ) ) ( not ( = ?auto_442337 ?auto_442340 ) ) ( not ( = ?auto_442337 ?auto_442341 ) ) ( not ( = ?auto_442337 ?auto_442342 ) ) ( not ( = ?auto_442337 ?auto_442343 ) ) ( not ( = ?auto_442337 ?auto_442344 ) ) ( not ( = ?auto_442337 ?auto_442345 ) ) ( not ( = ?auto_442337 ?auto_442346 ) ) ( not ( = ?auto_442338 ?auto_442339 ) ) ( not ( = ?auto_442338 ?auto_442340 ) ) ( not ( = ?auto_442338 ?auto_442341 ) ) ( not ( = ?auto_442338 ?auto_442342 ) ) ( not ( = ?auto_442338 ?auto_442343 ) ) ( not ( = ?auto_442338 ?auto_442344 ) ) ( not ( = ?auto_442338 ?auto_442345 ) ) ( not ( = ?auto_442338 ?auto_442346 ) ) ( not ( = ?auto_442339 ?auto_442340 ) ) ( not ( = ?auto_442339 ?auto_442341 ) ) ( not ( = ?auto_442339 ?auto_442342 ) ) ( not ( = ?auto_442339 ?auto_442343 ) ) ( not ( = ?auto_442339 ?auto_442344 ) ) ( not ( = ?auto_442339 ?auto_442345 ) ) ( not ( = ?auto_442339 ?auto_442346 ) ) ( not ( = ?auto_442340 ?auto_442341 ) ) ( not ( = ?auto_442340 ?auto_442342 ) ) ( not ( = ?auto_442340 ?auto_442343 ) ) ( not ( = ?auto_442340 ?auto_442344 ) ) ( not ( = ?auto_442340 ?auto_442345 ) ) ( not ( = ?auto_442340 ?auto_442346 ) ) ( not ( = ?auto_442341 ?auto_442342 ) ) ( not ( = ?auto_442341 ?auto_442343 ) ) ( not ( = ?auto_442341 ?auto_442344 ) ) ( not ( = ?auto_442341 ?auto_442345 ) ) ( not ( = ?auto_442341 ?auto_442346 ) ) ( not ( = ?auto_442342 ?auto_442343 ) ) ( not ( = ?auto_442342 ?auto_442344 ) ) ( not ( = ?auto_442342 ?auto_442345 ) ) ( not ( = ?auto_442342 ?auto_442346 ) ) ( not ( = ?auto_442343 ?auto_442344 ) ) ( not ( = ?auto_442343 ?auto_442345 ) ) ( not ( = ?auto_442343 ?auto_442346 ) ) ( not ( = ?auto_442344 ?auto_442345 ) ) ( not ( = ?auto_442344 ?auto_442346 ) ) ( not ( = ?auto_442345 ?auto_442346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_442345 ?auto_442346 )
      ( !STACK ?auto_442345 ?auto_442344 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442390 - BLOCK
      ?auto_442391 - BLOCK
      ?auto_442392 - BLOCK
      ?auto_442393 - BLOCK
      ?auto_442394 - BLOCK
      ?auto_442395 - BLOCK
      ?auto_442396 - BLOCK
      ?auto_442397 - BLOCK
      ?auto_442398 - BLOCK
      ?auto_442399 - BLOCK
      ?auto_442400 - BLOCK
      ?auto_442401 - BLOCK
      ?auto_442402 - BLOCK
      ?auto_442403 - BLOCK
    )
    :vars
    (
      ?auto_442404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442403 ?auto_442404 ) ( ON-TABLE ?auto_442390 ) ( ON ?auto_442391 ?auto_442390 ) ( ON ?auto_442392 ?auto_442391 ) ( ON ?auto_442393 ?auto_442392 ) ( ON ?auto_442394 ?auto_442393 ) ( ON ?auto_442395 ?auto_442394 ) ( ON ?auto_442396 ?auto_442395 ) ( ON ?auto_442397 ?auto_442396 ) ( ON ?auto_442398 ?auto_442397 ) ( ON ?auto_442399 ?auto_442398 ) ( ON ?auto_442400 ?auto_442399 ) ( ON ?auto_442401 ?auto_442400 ) ( not ( = ?auto_442390 ?auto_442391 ) ) ( not ( = ?auto_442390 ?auto_442392 ) ) ( not ( = ?auto_442390 ?auto_442393 ) ) ( not ( = ?auto_442390 ?auto_442394 ) ) ( not ( = ?auto_442390 ?auto_442395 ) ) ( not ( = ?auto_442390 ?auto_442396 ) ) ( not ( = ?auto_442390 ?auto_442397 ) ) ( not ( = ?auto_442390 ?auto_442398 ) ) ( not ( = ?auto_442390 ?auto_442399 ) ) ( not ( = ?auto_442390 ?auto_442400 ) ) ( not ( = ?auto_442390 ?auto_442401 ) ) ( not ( = ?auto_442390 ?auto_442402 ) ) ( not ( = ?auto_442390 ?auto_442403 ) ) ( not ( = ?auto_442390 ?auto_442404 ) ) ( not ( = ?auto_442391 ?auto_442392 ) ) ( not ( = ?auto_442391 ?auto_442393 ) ) ( not ( = ?auto_442391 ?auto_442394 ) ) ( not ( = ?auto_442391 ?auto_442395 ) ) ( not ( = ?auto_442391 ?auto_442396 ) ) ( not ( = ?auto_442391 ?auto_442397 ) ) ( not ( = ?auto_442391 ?auto_442398 ) ) ( not ( = ?auto_442391 ?auto_442399 ) ) ( not ( = ?auto_442391 ?auto_442400 ) ) ( not ( = ?auto_442391 ?auto_442401 ) ) ( not ( = ?auto_442391 ?auto_442402 ) ) ( not ( = ?auto_442391 ?auto_442403 ) ) ( not ( = ?auto_442391 ?auto_442404 ) ) ( not ( = ?auto_442392 ?auto_442393 ) ) ( not ( = ?auto_442392 ?auto_442394 ) ) ( not ( = ?auto_442392 ?auto_442395 ) ) ( not ( = ?auto_442392 ?auto_442396 ) ) ( not ( = ?auto_442392 ?auto_442397 ) ) ( not ( = ?auto_442392 ?auto_442398 ) ) ( not ( = ?auto_442392 ?auto_442399 ) ) ( not ( = ?auto_442392 ?auto_442400 ) ) ( not ( = ?auto_442392 ?auto_442401 ) ) ( not ( = ?auto_442392 ?auto_442402 ) ) ( not ( = ?auto_442392 ?auto_442403 ) ) ( not ( = ?auto_442392 ?auto_442404 ) ) ( not ( = ?auto_442393 ?auto_442394 ) ) ( not ( = ?auto_442393 ?auto_442395 ) ) ( not ( = ?auto_442393 ?auto_442396 ) ) ( not ( = ?auto_442393 ?auto_442397 ) ) ( not ( = ?auto_442393 ?auto_442398 ) ) ( not ( = ?auto_442393 ?auto_442399 ) ) ( not ( = ?auto_442393 ?auto_442400 ) ) ( not ( = ?auto_442393 ?auto_442401 ) ) ( not ( = ?auto_442393 ?auto_442402 ) ) ( not ( = ?auto_442393 ?auto_442403 ) ) ( not ( = ?auto_442393 ?auto_442404 ) ) ( not ( = ?auto_442394 ?auto_442395 ) ) ( not ( = ?auto_442394 ?auto_442396 ) ) ( not ( = ?auto_442394 ?auto_442397 ) ) ( not ( = ?auto_442394 ?auto_442398 ) ) ( not ( = ?auto_442394 ?auto_442399 ) ) ( not ( = ?auto_442394 ?auto_442400 ) ) ( not ( = ?auto_442394 ?auto_442401 ) ) ( not ( = ?auto_442394 ?auto_442402 ) ) ( not ( = ?auto_442394 ?auto_442403 ) ) ( not ( = ?auto_442394 ?auto_442404 ) ) ( not ( = ?auto_442395 ?auto_442396 ) ) ( not ( = ?auto_442395 ?auto_442397 ) ) ( not ( = ?auto_442395 ?auto_442398 ) ) ( not ( = ?auto_442395 ?auto_442399 ) ) ( not ( = ?auto_442395 ?auto_442400 ) ) ( not ( = ?auto_442395 ?auto_442401 ) ) ( not ( = ?auto_442395 ?auto_442402 ) ) ( not ( = ?auto_442395 ?auto_442403 ) ) ( not ( = ?auto_442395 ?auto_442404 ) ) ( not ( = ?auto_442396 ?auto_442397 ) ) ( not ( = ?auto_442396 ?auto_442398 ) ) ( not ( = ?auto_442396 ?auto_442399 ) ) ( not ( = ?auto_442396 ?auto_442400 ) ) ( not ( = ?auto_442396 ?auto_442401 ) ) ( not ( = ?auto_442396 ?auto_442402 ) ) ( not ( = ?auto_442396 ?auto_442403 ) ) ( not ( = ?auto_442396 ?auto_442404 ) ) ( not ( = ?auto_442397 ?auto_442398 ) ) ( not ( = ?auto_442397 ?auto_442399 ) ) ( not ( = ?auto_442397 ?auto_442400 ) ) ( not ( = ?auto_442397 ?auto_442401 ) ) ( not ( = ?auto_442397 ?auto_442402 ) ) ( not ( = ?auto_442397 ?auto_442403 ) ) ( not ( = ?auto_442397 ?auto_442404 ) ) ( not ( = ?auto_442398 ?auto_442399 ) ) ( not ( = ?auto_442398 ?auto_442400 ) ) ( not ( = ?auto_442398 ?auto_442401 ) ) ( not ( = ?auto_442398 ?auto_442402 ) ) ( not ( = ?auto_442398 ?auto_442403 ) ) ( not ( = ?auto_442398 ?auto_442404 ) ) ( not ( = ?auto_442399 ?auto_442400 ) ) ( not ( = ?auto_442399 ?auto_442401 ) ) ( not ( = ?auto_442399 ?auto_442402 ) ) ( not ( = ?auto_442399 ?auto_442403 ) ) ( not ( = ?auto_442399 ?auto_442404 ) ) ( not ( = ?auto_442400 ?auto_442401 ) ) ( not ( = ?auto_442400 ?auto_442402 ) ) ( not ( = ?auto_442400 ?auto_442403 ) ) ( not ( = ?auto_442400 ?auto_442404 ) ) ( not ( = ?auto_442401 ?auto_442402 ) ) ( not ( = ?auto_442401 ?auto_442403 ) ) ( not ( = ?auto_442401 ?auto_442404 ) ) ( not ( = ?auto_442402 ?auto_442403 ) ) ( not ( = ?auto_442402 ?auto_442404 ) ) ( not ( = ?auto_442403 ?auto_442404 ) ) ( CLEAR ?auto_442401 ) ( ON ?auto_442402 ?auto_442403 ) ( CLEAR ?auto_442402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_442390 ?auto_442391 ?auto_442392 ?auto_442393 ?auto_442394 ?auto_442395 ?auto_442396 ?auto_442397 ?auto_442398 ?auto_442399 ?auto_442400 ?auto_442401 ?auto_442402 )
      ( MAKE-14PILE ?auto_442390 ?auto_442391 ?auto_442392 ?auto_442393 ?auto_442394 ?auto_442395 ?auto_442396 ?auto_442397 ?auto_442398 ?auto_442399 ?auto_442400 ?auto_442401 ?auto_442402 ?auto_442403 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442448 - BLOCK
      ?auto_442449 - BLOCK
      ?auto_442450 - BLOCK
      ?auto_442451 - BLOCK
      ?auto_442452 - BLOCK
      ?auto_442453 - BLOCK
      ?auto_442454 - BLOCK
      ?auto_442455 - BLOCK
      ?auto_442456 - BLOCK
      ?auto_442457 - BLOCK
      ?auto_442458 - BLOCK
      ?auto_442459 - BLOCK
      ?auto_442460 - BLOCK
      ?auto_442461 - BLOCK
    )
    :vars
    (
      ?auto_442462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442461 ?auto_442462 ) ( ON-TABLE ?auto_442448 ) ( ON ?auto_442449 ?auto_442448 ) ( ON ?auto_442450 ?auto_442449 ) ( ON ?auto_442451 ?auto_442450 ) ( ON ?auto_442452 ?auto_442451 ) ( ON ?auto_442453 ?auto_442452 ) ( ON ?auto_442454 ?auto_442453 ) ( ON ?auto_442455 ?auto_442454 ) ( ON ?auto_442456 ?auto_442455 ) ( ON ?auto_442457 ?auto_442456 ) ( ON ?auto_442458 ?auto_442457 ) ( not ( = ?auto_442448 ?auto_442449 ) ) ( not ( = ?auto_442448 ?auto_442450 ) ) ( not ( = ?auto_442448 ?auto_442451 ) ) ( not ( = ?auto_442448 ?auto_442452 ) ) ( not ( = ?auto_442448 ?auto_442453 ) ) ( not ( = ?auto_442448 ?auto_442454 ) ) ( not ( = ?auto_442448 ?auto_442455 ) ) ( not ( = ?auto_442448 ?auto_442456 ) ) ( not ( = ?auto_442448 ?auto_442457 ) ) ( not ( = ?auto_442448 ?auto_442458 ) ) ( not ( = ?auto_442448 ?auto_442459 ) ) ( not ( = ?auto_442448 ?auto_442460 ) ) ( not ( = ?auto_442448 ?auto_442461 ) ) ( not ( = ?auto_442448 ?auto_442462 ) ) ( not ( = ?auto_442449 ?auto_442450 ) ) ( not ( = ?auto_442449 ?auto_442451 ) ) ( not ( = ?auto_442449 ?auto_442452 ) ) ( not ( = ?auto_442449 ?auto_442453 ) ) ( not ( = ?auto_442449 ?auto_442454 ) ) ( not ( = ?auto_442449 ?auto_442455 ) ) ( not ( = ?auto_442449 ?auto_442456 ) ) ( not ( = ?auto_442449 ?auto_442457 ) ) ( not ( = ?auto_442449 ?auto_442458 ) ) ( not ( = ?auto_442449 ?auto_442459 ) ) ( not ( = ?auto_442449 ?auto_442460 ) ) ( not ( = ?auto_442449 ?auto_442461 ) ) ( not ( = ?auto_442449 ?auto_442462 ) ) ( not ( = ?auto_442450 ?auto_442451 ) ) ( not ( = ?auto_442450 ?auto_442452 ) ) ( not ( = ?auto_442450 ?auto_442453 ) ) ( not ( = ?auto_442450 ?auto_442454 ) ) ( not ( = ?auto_442450 ?auto_442455 ) ) ( not ( = ?auto_442450 ?auto_442456 ) ) ( not ( = ?auto_442450 ?auto_442457 ) ) ( not ( = ?auto_442450 ?auto_442458 ) ) ( not ( = ?auto_442450 ?auto_442459 ) ) ( not ( = ?auto_442450 ?auto_442460 ) ) ( not ( = ?auto_442450 ?auto_442461 ) ) ( not ( = ?auto_442450 ?auto_442462 ) ) ( not ( = ?auto_442451 ?auto_442452 ) ) ( not ( = ?auto_442451 ?auto_442453 ) ) ( not ( = ?auto_442451 ?auto_442454 ) ) ( not ( = ?auto_442451 ?auto_442455 ) ) ( not ( = ?auto_442451 ?auto_442456 ) ) ( not ( = ?auto_442451 ?auto_442457 ) ) ( not ( = ?auto_442451 ?auto_442458 ) ) ( not ( = ?auto_442451 ?auto_442459 ) ) ( not ( = ?auto_442451 ?auto_442460 ) ) ( not ( = ?auto_442451 ?auto_442461 ) ) ( not ( = ?auto_442451 ?auto_442462 ) ) ( not ( = ?auto_442452 ?auto_442453 ) ) ( not ( = ?auto_442452 ?auto_442454 ) ) ( not ( = ?auto_442452 ?auto_442455 ) ) ( not ( = ?auto_442452 ?auto_442456 ) ) ( not ( = ?auto_442452 ?auto_442457 ) ) ( not ( = ?auto_442452 ?auto_442458 ) ) ( not ( = ?auto_442452 ?auto_442459 ) ) ( not ( = ?auto_442452 ?auto_442460 ) ) ( not ( = ?auto_442452 ?auto_442461 ) ) ( not ( = ?auto_442452 ?auto_442462 ) ) ( not ( = ?auto_442453 ?auto_442454 ) ) ( not ( = ?auto_442453 ?auto_442455 ) ) ( not ( = ?auto_442453 ?auto_442456 ) ) ( not ( = ?auto_442453 ?auto_442457 ) ) ( not ( = ?auto_442453 ?auto_442458 ) ) ( not ( = ?auto_442453 ?auto_442459 ) ) ( not ( = ?auto_442453 ?auto_442460 ) ) ( not ( = ?auto_442453 ?auto_442461 ) ) ( not ( = ?auto_442453 ?auto_442462 ) ) ( not ( = ?auto_442454 ?auto_442455 ) ) ( not ( = ?auto_442454 ?auto_442456 ) ) ( not ( = ?auto_442454 ?auto_442457 ) ) ( not ( = ?auto_442454 ?auto_442458 ) ) ( not ( = ?auto_442454 ?auto_442459 ) ) ( not ( = ?auto_442454 ?auto_442460 ) ) ( not ( = ?auto_442454 ?auto_442461 ) ) ( not ( = ?auto_442454 ?auto_442462 ) ) ( not ( = ?auto_442455 ?auto_442456 ) ) ( not ( = ?auto_442455 ?auto_442457 ) ) ( not ( = ?auto_442455 ?auto_442458 ) ) ( not ( = ?auto_442455 ?auto_442459 ) ) ( not ( = ?auto_442455 ?auto_442460 ) ) ( not ( = ?auto_442455 ?auto_442461 ) ) ( not ( = ?auto_442455 ?auto_442462 ) ) ( not ( = ?auto_442456 ?auto_442457 ) ) ( not ( = ?auto_442456 ?auto_442458 ) ) ( not ( = ?auto_442456 ?auto_442459 ) ) ( not ( = ?auto_442456 ?auto_442460 ) ) ( not ( = ?auto_442456 ?auto_442461 ) ) ( not ( = ?auto_442456 ?auto_442462 ) ) ( not ( = ?auto_442457 ?auto_442458 ) ) ( not ( = ?auto_442457 ?auto_442459 ) ) ( not ( = ?auto_442457 ?auto_442460 ) ) ( not ( = ?auto_442457 ?auto_442461 ) ) ( not ( = ?auto_442457 ?auto_442462 ) ) ( not ( = ?auto_442458 ?auto_442459 ) ) ( not ( = ?auto_442458 ?auto_442460 ) ) ( not ( = ?auto_442458 ?auto_442461 ) ) ( not ( = ?auto_442458 ?auto_442462 ) ) ( not ( = ?auto_442459 ?auto_442460 ) ) ( not ( = ?auto_442459 ?auto_442461 ) ) ( not ( = ?auto_442459 ?auto_442462 ) ) ( not ( = ?auto_442460 ?auto_442461 ) ) ( not ( = ?auto_442460 ?auto_442462 ) ) ( not ( = ?auto_442461 ?auto_442462 ) ) ( ON ?auto_442460 ?auto_442461 ) ( CLEAR ?auto_442458 ) ( ON ?auto_442459 ?auto_442460 ) ( CLEAR ?auto_442459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_442448 ?auto_442449 ?auto_442450 ?auto_442451 ?auto_442452 ?auto_442453 ?auto_442454 ?auto_442455 ?auto_442456 ?auto_442457 ?auto_442458 ?auto_442459 )
      ( MAKE-14PILE ?auto_442448 ?auto_442449 ?auto_442450 ?auto_442451 ?auto_442452 ?auto_442453 ?auto_442454 ?auto_442455 ?auto_442456 ?auto_442457 ?auto_442458 ?auto_442459 ?auto_442460 ?auto_442461 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442506 - BLOCK
      ?auto_442507 - BLOCK
      ?auto_442508 - BLOCK
      ?auto_442509 - BLOCK
      ?auto_442510 - BLOCK
      ?auto_442511 - BLOCK
      ?auto_442512 - BLOCK
      ?auto_442513 - BLOCK
      ?auto_442514 - BLOCK
      ?auto_442515 - BLOCK
      ?auto_442516 - BLOCK
      ?auto_442517 - BLOCK
      ?auto_442518 - BLOCK
      ?auto_442519 - BLOCK
    )
    :vars
    (
      ?auto_442520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442519 ?auto_442520 ) ( ON-TABLE ?auto_442506 ) ( ON ?auto_442507 ?auto_442506 ) ( ON ?auto_442508 ?auto_442507 ) ( ON ?auto_442509 ?auto_442508 ) ( ON ?auto_442510 ?auto_442509 ) ( ON ?auto_442511 ?auto_442510 ) ( ON ?auto_442512 ?auto_442511 ) ( ON ?auto_442513 ?auto_442512 ) ( ON ?auto_442514 ?auto_442513 ) ( ON ?auto_442515 ?auto_442514 ) ( not ( = ?auto_442506 ?auto_442507 ) ) ( not ( = ?auto_442506 ?auto_442508 ) ) ( not ( = ?auto_442506 ?auto_442509 ) ) ( not ( = ?auto_442506 ?auto_442510 ) ) ( not ( = ?auto_442506 ?auto_442511 ) ) ( not ( = ?auto_442506 ?auto_442512 ) ) ( not ( = ?auto_442506 ?auto_442513 ) ) ( not ( = ?auto_442506 ?auto_442514 ) ) ( not ( = ?auto_442506 ?auto_442515 ) ) ( not ( = ?auto_442506 ?auto_442516 ) ) ( not ( = ?auto_442506 ?auto_442517 ) ) ( not ( = ?auto_442506 ?auto_442518 ) ) ( not ( = ?auto_442506 ?auto_442519 ) ) ( not ( = ?auto_442506 ?auto_442520 ) ) ( not ( = ?auto_442507 ?auto_442508 ) ) ( not ( = ?auto_442507 ?auto_442509 ) ) ( not ( = ?auto_442507 ?auto_442510 ) ) ( not ( = ?auto_442507 ?auto_442511 ) ) ( not ( = ?auto_442507 ?auto_442512 ) ) ( not ( = ?auto_442507 ?auto_442513 ) ) ( not ( = ?auto_442507 ?auto_442514 ) ) ( not ( = ?auto_442507 ?auto_442515 ) ) ( not ( = ?auto_442507 ?auto_442516 ) ) ( not ( = ?auto_442507 ?auto_442517 ) ) ( not ( = ?auto_442507 ?auto_442518 ) ) ( not ( = ?auto_442507 ?auto_442519 ) ) ( not ( = ?auto_442507 ?auto_442520 ) ) ( not ( = ?auto_442508 ?auto_442509 ) ) ( not ( = ?auto_442508 ?auto_442510 ) ) ( not ( = ?auto_442508 ?auto_442511 ) ) ( not ( = ?auto_442508 ?auto_442512 ) ) ( not ( = ?auto_442508 ?auto_442513 ) ) ( not ( = ?auto_442508 ?auto_442514 ) ) ( not ( = ?auto_442508 ?auto_442515 ) ) ( not ( = ?auto_442508 ?auto_442516 ) ) ( not ( = ?auto_442508 ?auto_442517 ) ) ( not ( = ?auto_442508 ?auto_442518 ) ) ( not ( = ?auto_442508 ?auto_442519 ) ) ( not ( = ?auto_442508 ?auto_442520 ) ) ( not ( = ?auto_442509 ?auto_442510 ) ) ( not ( = ?auto_442509 ?auto_442511 ) ) ( not ( = ?auto_442509 ?auto_442512 ) ) ( not ( = ?auto_442509 ?auto_442513 ) ) ( not ( = ?auto_442509 ?auto_442514 ) ) ( not ( = ?auto_442509 ?auto_442515 ) ) ( not ( = ?auto_442509 ?auto_442516 ) ) ( not ( = ?auto_442509 ?auto_442517 ) ) ( not ( = ?auto_442509 ?auto_442518 ) ) ( not ( = ?auto_442509 ?auto_442519 ) ) ( not ( = ?auto_442509 ?auto_442520 ) ) ( not ( = ?auto_442510 ?auto_442511 ) ) ( not ( = ?auto_442510 ?auto_442512 ) ) ( not ( = ?auto_442510 ?auto_442513 ) ) ( not ( = ?auto_442510 ?auto_442514 ) ) ( not ( = ?auto_442510 ?auto_442515 ) ) ( not ( = ?auto_442510 ?auto_442516 ) ) ( not ( = ?auto_442510 ?auto_442517 ) ) ( not ( = ?auto_442510 ?auto_442518 ) ) ( not ( = ?auto_442510 ?auto_442519 ) ) ( not ( = ?auto_442510 ?auto_442520 ) ) ( not ( = ?auto_442511 ?auto_442512 ) ) ( not ( = ?auto_442511 ?auto_442513 ) ) ( not ( = ?auto_442511 ?auto_442514 ) ) ( not ( = ?auto_442511 ?auto_442515 ) ) ( not ( = ?auto_442511 ?auto_442516 ) ) ( not ( = ?auto_442511 ?auto_442517 ) ) ( not ( = ?auto_442511 ?auto_442518 ) ) ( not ( = ?auto_442511 ?auto_442519 ) ) ( not ( = ?auto_442511 ?auto_442520 ) ) ( not ( = ?auto_442512 ?auto_442513 ) ) ( not ( = ?auto_442512 ?auto_442514 ) ) ( not ( = ?auto_442512 ?auto_442515 ) ) ( not ( = ?auto_442512 ?auto_442516 ) ) ( not ( = ?auto_442512 ?auto_442517 ) ) ( not ( = ?auto_442512 ?auto_442518 ) ) ( not ( = ?auto_442512 ?auto_442519 ) ) ( not ( = ?auto_442512 ?auto_442520 ) ) ( not ( = ?auto_442513 ?auto_442514 ) ) ( not ( = ?auto_442513 ?auto_442515 ) ) ( not ( = ?auto_442513 ?auto_442516 ) ) ( not ( = ?auto_442513 ?auto_442517 ) ) ( not ( = ?auto_442513 ?auto_442518 ) ) ( not ( = ?auto_442513 ?auto_442519 ) ) ( not ( = ?auto_442513 ?auto_442520 ) ) ( not ( = ?auto_442514 ?auto_442515 ) ) ( not ( = ?auto_442514 ?auto_442516 ) ) ( not ( = ?auto_442514 ?auto_442517 ) ) ( not ( = ?auto_442514 ?auto_442518 ) ) ( not ( = ?auto_442514 ?auto_442519 ) ) ( not ( = ?auto_442514 ?auto_442520 ) ) ( not ( = ?auto_442515 ?auto_442516 ) ) ( not ( = ?auto_442515 ?auto_442517 ) ) ( not ( = ?auto_442515 ?auto_442518 ) ) ( not ( = ?auto_442515 ?auto_442519 ) ) ( not ( = ?auto_442515 ?auto_442520 ) ) ( not ( = ?auto_442516 ?auto_442517 ) ) ( not ( = ?auto_442516 ?auto_442518 ) ) ( not ( = ?auto_442516 ?auto_442519 ) ) ( not ( = ?auto_442516 ?auto_442520 ) ) ( not ( = ?auto_442517 ?auto_442518 ) ) ( not ( = ?auto_442517 ?auto_442519 ) ) ( not ( = ?auto_442517 ?auto_442520 ) ) ( not ( = ?auto_442518 ?auto_442519 ) ) ( not ( = ?auto_442518 ?auto_442520 ) ) ( not ( = ?auto_442519 ?auto_442520 ) ) ( ON ?auto_442518 ?auto_442519 ) ( ON ?auto_442517 ?auto_442518 ) ( CLEAR ?auto_442515 ) ( ON ?auto_442516 ?auto_442517 ) ( CLEAR ?auto_442516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_442506 ?auto_442507 ?auto_442508 ?auto_442509 ?auto_442510 ?auto_442511 ?auto_442512 ?auto_442513 ?auto_442514 ?auto_442515 ?auto_442516 )
      ( MAKE-14PILE ?auto_442506 ?auto_442507 ?auto_442508 ?auto_442509 ?auto_442510 ?auto_442511 ?auto_442512 ?auto_442513 ?auto_442514 ?auto_442515 ?auto_442516 ?auto_442517 ?auto_442518 ?auto_442519 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442564 - BLOCK
      ?auto_442565 - BLOCK
      ?auto_442566 - BLOCK
      ?auto_442567 - BLOCK
      ?auto_442568 - BLOCK
      ?auto_442569 - BLOCK
      ?auto_442570 - BLOCK
      ?auto_442571 - BLOCK
      ?auto_442572 - BLOCK
      ?auto_442573 - BLOCK
      ?auto_442574 - BLOCK
      ?auto_442575 - BLOCK
      ?auto_442576 - BLOCK
      ?auto_442577 - BLOCK
    )
    :vars
    (
      ?auto_442578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442577 ?auto_442578 ) ( ON-TABLE ?auto_442564 ) ( ON ?auto_442565 ?auto_442564 ) ( ON ?auto_442566 ?auto_442565 ) ( ON ?auto_442567 ?auto_442566 ) ( ON ?auto_442568 ?auto_442567 ) ( ON ?auto_442569 ?auto_442568 ) ( ON ?auto_442570 ?auto_442569 ) ( ON ?auto_442571 ?auto_442570 ) ( ON ?auto_442572 ?auto_442571 ) ( not ( = ?auto_442564 ?auto_442565 ) ) ( not ( = ?auto_442564 ?auto_442566 ) ) ( not ( = ?auto_442564 ?auto_442567 ) ) ( not ( = ?auto_442564 ?auto_442568 ) ) ( not ( = ?auto_442564 ?auto_442569 ) ) ( not ( = ?auto_442564 ?auto_442570 ) ) ( not ( = ?auto_442564 ?auto_442571 ) ) ( not ( = ?auto_442564 ?auto_442572 ) ) ( not ( = ?auto_442564 ?auto_442573 ) ) ( not ( = ?auto_442564 ?auto_442574 ) ) ( not ( = ?auto_442564 ?auto_442575 ) ) ( not ( = ?auto_442564 ?auto_442576 ) ) ( not ( = ?auto_442564 ?auto_442577 ) ) ( not ( = ?auto_442564 ?auto_442578 ) ) ( not ( = ?auto_442565 ?auto_442566 ) ) ( not ( = ?auto_442565 ?auto_442567 ) ) ( not ( = ?auto_442565 ?auto_442568 ) ) ( not ( = ?auto_442565 ?auto_442569 ) ) ( not ( = ?auto_442565 ?auto_442570 ) ) ( not ( = ?auto_442565 ?auto_442571 ) ) ( not ( = ?auto_442565 ?auto_442572 ) ) ( not ( = ?auto_442565 ?auto_442573 ) ) ( not ( = ?auto_442565 ?auto_442574 ) ) ( not ( = ?auto_442565 ?auto_442575 ) ) ( not ( = ?auto_442565 ?auto_442576 ) ) ( not ( = ?auto_442565 ?auto_442577 ) ) ( not ( = ?auto_442565 ?auto_442578 ) ) ( not ( = ?auto_442566 ?auto_442567 ) ) ( not ( = ?auto_442566 ?auto_442568 ) ) ( not ( = ?auto_442566 ?auto_442569 ) ) ( not ( = ?auto_442566 ?auto_442570 ) ) ( not ( = ?auto_442566 ?auto_442571 ) ) ( not ( = ?auto_442566 ?auto_442572 ) ) ( not ( = ?auto_442566 ?auto_442573 ) ) ( not ( = ?auto_442566 ?auto_442574 ) ) ( not ( = ?auto_442566 ?auto_442575 ) ) ( not ( = ?auto_442566 ?auto_442576 ) ) ( not ( = ?auto_442566 ?auto_442577 ) ) ( not ( = ?auto_442566 ?auto_442578 ) ) ( not ( = ?auto_442567 ?auto_442568 ) ) ( not ( = ?auto_442567 ?auto_442569 ) ) ( not ( = ?auto_442567 ?auto_442570 ) ) ( not ( = ?auto_442567 ?auto_442571 ) ) ( not ( = ?auto_442567 ?auto_442572 ) ) ( not ( = ?auto_442567 ?auto_442573 ) ) ( not ( = ?auto_442567 ?auto_442574 ) ) ( not ( = ?auto_442567 ?auto_442575 ) ) ( not ( = ?auto_442567 ?auto_442576 ) ) ( not ( = ?auto_442567 ?auto_442577 ) ) ( not ( = ?auto_442567 ?auto_442578 ) ) ( not ( = ?auto_442568 ?auto_442569 ) ) ( not ( = ?auto_442568 ?auto_442570 ) ) ( not ( = ?auto_442568 ?auto_442571 ) ) ( not ( = ?auto_442568 ?auto_442572 ) ) ( not ( = ?auto_442568 ?auto_442573 ) ) ( not ( = ?auto_442568 ?auto_442574 ) ) ( not ( = ?auto_442568 ?auto_442575 ) ) ( not ( = ?auto_442568 ?auto_442576 ) ) ( not ( = ?auto_442568 ?auto_442577 ) ) ( not ( = ?auto_442568 ?auto_442578 ) ) ( not ( = ?auto_442569 ?auto_442570 ) ) ( not ( = ?auto_442569 ?auto_442571 ) ) ( not ( = ?auto_442569 ?auto_442572 ) ) ( not ( = ?auto_442569 ?auto_442573 ) ) ( not ( = ?auto_442569 ?auto_442574 ) ) ( not ( = ?auto_442569 ?auto_442575 ) ) ( not ( = ?auto_442569 ?auto_442576 ) ) ( not ( = ?auto_442569 ?auto_442577 ) ) ( not ( = ?auto_442569 ?auto_442578 ) ) ( not ( = ?auto_442570 ?auto_442571 ) ) ( not ( = ?auto_442570 ?auto_442572 ) ) ( not ( = ?auto_442570 ?auto_442573 ) ) ( not ( = ?auto_442570 ?auto_442574 ) ) ( not ( = ?auto_442570 ?auto_442575 ) ) ( not ( = ?auto_442570 ?auto_442576 ) ) ( not ( = ?auto_442570 ?auto_442577 ) ) ( not ( = ?auto_442570 ?auto_442578 ) ) ( not ( = ?auto_442571 ?auto_442572 ) ) ( not ( = ?auto_442571 ?auto_442573 ) ) ( not ( = ?auto_442571 ?auto_442574 ) ) ( not ( = ?auto_442571 ?auto_442575 ) ) ( not ( = ?auto_442571 ?auto_442576 ) ) ( not ( = ?auto_442571 ?auto_442577 ) ) ( not ( = ?auto_442571 ?auto_442578 ) ) ( not ( = ?auto_442572 ?auto_442573 ) ) ( not ( = ?auto_442572 ?auto_442574 ) ) ( not ( = ?auto_442572 ?auto_442575 ) ) ( not ( = ?auto_442572 ?auto_442576 ) ) ( not ( = ?auto_442572 ?auto_442577 ) ) ( not ( = ?auto_442572 ?auto_442578 ) ) ( not ( = ?auto_442573 ?auto_442574 ) ) ( not ( = ?auto_442573 ?auto_442575 ) ) ( not ( = ?auto_442573 ?auto_442576 ) ) ( not ( = ?auto_442573 ?auto_442577 ) ) ( not ( = ?auto_442573 ?auto_442578 ) ) ( not ( = ?auto_442574 ?auto_442575 ) ) ( not ( = ?auto_442574 ?auto_442576 ) ) ( not ( = ?auto_442574 ?auto_442577 ) ) ( not ( = ?auto_442574 ?auto_442578 ) ) ( not ( = ?auto_442575 ?auto_442576 ) ) ( not ( = ?auto_442575 ?auto_442577 ) ) ( not ( = ?auto_442575 ?auto_442578 ) ) ( not ( = ?auto_442576 ?auto_442577 ) ) ( not ( = ?auto_442576 ?auto_442578 ) ) ( not ( = ?auto_442577 ?auto_442578 ) ) ( ON ?auto_442576 ?auto_442577 ) ( ON ?auto_442575 ?auto_442576 ) ( ON ?auto_442574 ?auto_442575 ) ( CLEAR ?auto_442572 ) ( ON ?auto_442573 ?auto_442574 ) ( CLEAR ?auto_442573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_442564 ?auto_442565 ?auto_442566 ?auto_442567 ?auto_442568 ?auto_442569 ?auto_442570 ?auto_442571 ?auto_442572 ?auto_442573 )
      ( MAKE-14PILE ?auto_442564 ?auto_442565 ?auto_442566 ?auto_442567 ?auto_442568 ?auto_442569 ?auto_442570 ?auto_442571 ?auto_442572 ?auto_442573 ?auto_442574 ?auto_442575 ?auto_442576 ?auto_442577 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442622 - BLOCK
      ?auto_442623 - BLOCK
      ?auto_442624 - BLOCK
      ?auto_442625 - BLOCK
      ?auto_442626 - BLOCK
      ?auto_442627 - BLOCK
      ?auto_442628 - BLOCK
      ?auto_442629 - BLOCK
      ?auto_442630 - BLOCK
      ?auto_442631 - BLOCK
      ?auto_442632 - BLOCK
      ?auto_442633 - BLOCK
      ?auto_442634 - BLOCK
      ?auto_442635 - BLOCK
    )
    :vars
    (
      ?auto_442636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442635 ?auto_442636 ) ( ON-TABLE ?auto_442622 ) ( ON ?auto_442623 ?auto_442622 ) ( ON ?auto_442624 ?auto_442623 ) ( ON ?auto_442625 ?auto_442624 ) ( ON ?auto_442626 ?auto_442625 ) ( ON ?auto_442627 ?auto_442626 ) ( ON ?auto_442628 ?auto_442627 ) ( ON ?auto_442629 ?auto_442628 ) ( not ( = ?auto_442622 ?auto_442623 ) ) ( not ( = ?auto_442622 ?auto_442624 ) ) ( not ( = ?auto_442622 ?auto_442625 ) ) ( not ( = ?auto_442622 ?auto_442626 ) ) ( not ( = ?auto_442622 ?auto_442627 ) ) ( not ( = ?auto_442622 ?auto_442628 ) ) ( not ( = ?auto_442622 ?auto_442629 ) ) ( not ( = ?auto_442622 ?auto_442630 ) ) ( not ( = ?auto_442622 ?auto_442631 ) ) ( not ( = ?auto_442622 ?auto_442632 ) ) ( not ( = ?auto_442622 ?auto_442633 ) ) ( not ( = ?auto_442622 ?auto_442634 ) ) ( not ( = ?auto_442622 ?auto_442635 ) ) ( not ( = ?auto_442622 ?auto_442636 ) ) ( not ( = ?auto_442623 ?auto_442624 ) ) ( not ( = ?auto_442623 ?auto_442625 ) ) ( not ( = ?auto_442623 ?auto_442626 ) ) ( not ( = ?auto_442623 ?auto_442627 ) ) ( not ( = ?auto_442623 ?auto_442628 ) ) ( not ( = ?auto_442623 ?auto_442629 ) ) ( not ( = ?auto_442623 ?auto_442630 ) ) ( not ( = ?auto_442623 ?auto_442631 ) ) ( not ( = ?auto_442623 ?auto_442632 ) ) ( not ( = ?auto_442623 ?auto_442633 ) ) ( not ( = ?auto_442623 ?auto_442634 ) ) ( not ( = ?auto_442623 ?auto_442635 ) ) ( not ( = ?auto_442623 ?auto_442636 ) ) ( not ( = ?auto_442624 ?auto_442625 ) ) ( not ( = ?auto_442624 ?auto_442626 ) ) ( not ( = ?auto_442624 ?auto_442627 ) ) ( not ( = ?auto_442624 ?auto_442628 ) ) ( not ( = ?auto_442624 ?auto_442629 ) ) ( not ( = ?auto_442624 ?auto_442630 ) ) ( not ( = ?auto_442624 ?auto_442631 ) ) ( not ( = ?auto_442624 ?auto_442632 ) ) ( not ( = ?auto_442624 ?auto_442633 ) ) ( not ( = ?auto_442624 ?auto_442634 ) ) ( not ( = ?auto_442624 ?auto_442635 ) ) ( not ( = ?auto_442624 ?auto_442636 ) ) ( not ( = ?auto_442625 ?auto_442626 ) ) ( not ( = ?auto_442625 ?auto_442627 ) ) ( not ( = ?auto_442625 ?auto_442628 ) ) ( not ( = ?auto_442625 ?auto_442629 ) ) ( not ( = ?auto_442625 ?auto_442630 ) ) ( not ( = ?auto_442625 ?auto_442631 ) ) ( not ( = ?auto_442625 ?auto_442632 ) ) ( not ( = ?auto_442625 ?auto_442633 ) ) ( not ( = ?auto_442625 ?auto_442634 ) ) ( not ( = ?auto_442625 ?auto_442635 ) ) ( not ( = ?auto_442625 ?auto_442636 ) ) ( not ( = ?auto_442626 ?auto_442627 ) ) ( not ( = ?auto_442626 ?auto_442628 ) ) ( not ( = ?auto_442626 ?auto_442629 ) ) ( not ( = ?auto_442626 ?auto_442630 ) ) ( not ( = ?auto_442626 ?auto_442631 ) ) ( not ( = ?auto_442626 ?auto_442632 ) ) ( not ( = ?auto_442626 ?auto_442633 ) ) ( not ( = ?auto_442626 ?auto_442634 ) ) ( not ( = ?auto_442626 ?auto_442635 ) ) ( not ( = ?auto_442626 ?auto_442636 ) ) ( not ( = ?auto_442627 ?auto_442628 ) ) ( not ( = ?auto_442627 ?auto_442629 ) ) ( not ( = ?auto_442627 ?auto_442630 ) ) ( not ( = ?auto_442627 ?auto_442631 ) ) ( not ( = ?auto_442627 ?auto_442632 ) ) ( not ( = ?auto_442627 ?auto_442633 ) ) ( not ( = ?auto_442627 ?auto_442634 ) ) ( not ( = ?auto_442627 ?auto_442635 ) ) ( not ( = ?auto_442627 ?auto_442636 ) ) ( not ( = ?auto_442628 ?auto_442629 ) ) ( not ( = ?auto_442628 ?auto_442630 ) ) ( not ( = ?auto_442628 ?auto_442631 ) ) ( not ( = ?auto_442628 ?auto_442632 ) ) ( not ( = ?auto_442628 ?auto_442633 ) ) ( not ( = ?auto_442628 ?auto_442634 ) ) ( not ( = ?auto_442628 ?auto_442635 ) ) ( not ( = ?auto_442628 ?auto_442636 ) ) ( not ( = ?auto_442629 ?auto_442630 ) ) ( not ( = ?auto_442629 ?auto_442631 ) ) ( not ( = ?auto_442629 ?auto_442632 ) ) ( not ( = ?auto_442629 ?auto_442633 ) ) ( not ( = ?auto_442629 ?auto_442634 ) ) ( not ( = ?auto_442629 ?auto_442635 ) ) ( not ( = ?auto_442629 ?auto_442636 ) ) ( not ( = ?auto_442630 ?auto_442631 ) ) ( not ( = ?auto_442630 ?auto_442632 ) ) ( not ( = ?auto_442630 ?auto_442633 ) ) ( not ( = ?auto_442630 ?auto_442634 ) ) ( not ( = ?auto_442630 ?auto_442635 ) ) ( not ( = ?auto_442630 ?auto_442636 ) ) ( not ( = ?auto_442631 ?auto_442632 ) ) ( not ( = ?auto_442631 ?auto_442633 ) ) ( not ( = ?auto_442631 ?auto_442634 ) ) ( not ( = ?auto_442631 ?auto_442635 ) ) ( not ( = ?auto_442631 ?auto_442636 ) ) ( not ( = ?auto_442632 ?auto_442633 ) ) ( not ( = ?auto_442632 ?auto_442634 ) ) ( not ( = ?auto_442632 ?auto_442635 ) ) ( not ( = ?auto_442632 ?auto_442636 ) ) ( not ( = ?auto_442633 ?auto_442634 ) ) ( not ( = ?auto_442633 ?auto_442635 ) ) ( not ( = ?auto_442633 ?auto_442636 ) ) ( not ( = ?auto_442634 ?auto_442635 ) ) ( not ( = ?auto_442634 ?auto_442636 ) ) ( not ( = ?auto_442635 ?auto_442636 ) ) ( ON ?auto_442634 ?auto_442635 ) ( ON ?auto_442633 ?auto_442634 ) ( ON ?auto_442632 ?auto_442633 ) ( ON ?auto_442631 ?auto_442632 ) ( CLEAR ?auto_442629 ) ( ON ?auto_442630 ?auto_442631 ) ( CLEAR ?auto_442630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_442622 ?auto_442623 ?auto_442624 ?auto_442625 ?auto_442626 ?auto_442627 ?auto_442628 ?auto_442629 ?auto_442630 )
      ( MAKE-14PILE ?auto_442622 ?auto_442623 ?auto_442624 ?auto_442625 ?auto_442626 ?auto_442627 ?auto_442628 ?auto_442629 ?auto_442630 ?auto_442631 ?auto_442632 ?auto_442633 ?auto_442634 ?auto_442635 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442680 - BLOCK
      ?auto_442681 - BLOCK
      ?auto_442682 - BLOCK
      ?auto_442683 - BLOCK
      ?auto_442684 - BLOCK
      ?auto_442685 - BLOCK
      ?auto_442686 - BLOCK
      ?auto_442687 - BLOCK
      ?auto_442688 - BLOCK
      ?auto_442689 - BLOCK
      ?auto_442690 - BLOCK
      ?auto_442691 - BLOCK
      ?auto_442692 - BLOCK
      ?auto_442693 - BLOCK
    )
    :vars
    (
      ?auto_442694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442693 ?auto_442694 ) ( ON-TABLE ?auto_442680 ) ( ON ?auto_442681 ?auto_442680 ) ( ON ?auto_442682 ?auto_442681 ) ( ON ?auto_442683 ?auto_442682 ) ( ON ?auto_442684 ?auto_442683 ) ( ON ?auto_442685 ?auto_442684 ) ( ON ?auto_442686 ?auto_442685 ) ( not ( = ?auto_442680 ?auto_442681 ) ) ( not ( = ?auto_442680 ?auto_442682 ) ) ( not ( = ?auto_442680 ?auto_442683 ) ) ( not ( = ?auto_442680 ?auto_442684 ) ) ( not ( = ?auto_442680 ?auto_442685 ) ) ( not ( = ?auto_442680 ?auto_442686 ) ) ( not ( = ?auto_442680 ?auto_442687 ) ) ( not ( = ?auto_442680 ?auto_442688 ) ) ( not ( = ?auto_442680 ?auto_442689 ) ) ( not ( = ?auto_442680 ?auto_442690 ) ) ( not ( = ?auto_442680 ?auto_442691 ) ) ( not ( = ?auto_442680 ?auto_442692 ) ) ( not ( = ?auto_442680 ?auto_442693 ) ) ( not ( = ?auto_442680 ?auto_442694 ) ) ( not ( = ?auto_442681 ?auto_442682 ) ) ( not ( = ?auto_442681 ?auto_442683 ) ) ( not ( = ?auto_442681 ?auto_442684 ) ) ( not ( = ?auto_442681 ?auto_442685 ) ) ( not ( = ?auto_442681 ?auto_442686 ) ) ( not ( = ?auto_442681 ?auto_442687 ) ) ( not ( = ?auto_442681 ?auto_442688 ) ) ( not ( = ?auto_442681 ?auto_442689 ) ) ( not ( = ?auto_442681 ?auto_442690 ) ) ( not ( = ?auto_442681 ?auto_442691 ) ) ( not ( = ?auto_442681 ?auto_442692 ) ) ( not ( = ?auto_442681 ?auto_442693 ) ) ( not ( = ?auto_442681 ?auto_442694 ) ) ( not ( = ?auto_442682 ?auto_442683 ) ) ( not ( = ?auto_442682 ?auto_442684 ) ) ( not ( = ?auto_442682 ?auto_442685 ) ) ( not ( = ?auto_442682 ?auto_442686 ) ) ( not ( = ?auto_442682 ?auto_442687 ) ) ( not ( = ?auto_442682 ?auto_442688 ) ) ( not ( = ?auto_442682 ?auto_442689 ) ) ( not ( = ?auto_442682 ?auto_442690 ) ) ( not ( = ?auto_442682 ?auto_442691 ) ) ( not ( = ?auto_442682 ?auto_442692 ) ) ( not ( = ?auto_442682 ?auto_442693 ) ) ( not ( = ?auto_442682 ?auto_442694 ) ) ( not ( = ?auto_442683 ?auto_442684 ) ) ( not ( = ?auto_442683 ?auto_442685 ) ) ( not ( = ?auto_442683 ?auto_442686 ) ) ( not ( = ?auto_442683 ?auto_442687 ) ) ( not ( = ?auto_442683 ?auto_442688 ) ) ( not ( = ?auto_442683 ?auto_442689 ) ) ( not ( = ?auto_442683 ?auto_442690 ) ) ( not ( = ?auto_442683 ?auto_442691 ) ) ( not ( = ?auto_442683 ?auto_442692 ) ) ( not ( = ?auto_442683 ?auto_442693 ) ) ( not ( = ?auto_442683 ?auto_442694 ) ) ( not ( = ?auto_442684 ?auto_442685 ) ) ( not ( = ?auto_442684 ?auto_442686 ) ) ( not ( = ?auto_442684 ?auto_442687 ) ) ( not ( = ?auto_442684 ?auto_442688 ) ) ( not ( = ?auto_442684 ?auto_442689 ) ) ( not ( = ?auto_442684 ?auto_442690 ) ) ( not ( = ?auto_442684 ?auto_442691 ) ) ( not ( = ?auto_442684 ?auto_442692 ) ) ( not ( = ?auto_442684 ?auto_442693 ) ) ( not ( = ?auto_442684 ?auto_442694 ) ) ( not ( = ?auto_442685 ?auto_442686 ) ) ( not ( = ?auto_442685 ?auto_442687 ) ) ( not ( = ?auto_442685 ?auto_442688 ) ) ( not ( = ?auto_442685 ?auto_442689 ) ) ( not ( = ?auto_442685 ?auto_442690 ) ) ( not ( = ?auto_442685 ?auto_442691 ) ) ( not ( = ?auto_442685 ?auto_442692 ) ) ( not ( = ?auto_442685 ?auto_442693 ) ) ( not ( = ?auto_442685 ?auto_442694 ) ) ( not ( = ?auto_442686 ?auto_442687 ) ) ( not ( = ?auto_442686 ?auto_442688 ) ) ( not ( = ?auto_442686 ?auto_442689 ) ) ( not ( = ?auto_442686 ?auto_442690 ) ) ( not ( = ?auto_442686 ?auto_442691 ) ) ( not ( = ?auto_442686 ?auto_442692 ) ) ( not ( = ?auto_442686 ?auto_442693 ) ) ( not ( = ?auto_442686 ?auto_442694 ) ) ( not ( = ?auto_442687 ?auto_442688 ) ) ( not ( = ?auto_442687 ?auto_442689 ) ) ( not ( = ?auto_442687 ?auto_442690 ) ) ( not ( = ?auto_442687 ?auto_442691 ) ) ( not ( = ?auto_442687 ?auto_442692 ) ) ( not ( = ?auto_442687 ?auto_442693 ) ) ( not ( = ?auto_442687 ?auto_442694 ) ) ( not ( = ?auto_442688 ?auto_442689 ) ) ( not ( = ?auto_442688 ?auto_442690 ) ) ( not ( = ?auto_442688 ?auto_442691 ) ) ( not ( = ?auto_442688 ?auto_442692 ) ) ( not ( = ?auto_442688 ?auto_442693 ) ) ( not ( = ?auto_442688 ?auto_442694 ) ) ( not ( = ?auto_442689 ?auto_442690 ) ) ( not ( = ?auto_442689 ?auto_442691 ) ) ( not ( = ?auto_442689 ?auto_442692 ) ) ( not ( = ?auto_442689 ?auto_442693 ) ) ( not ( = ?auto_442689 ?auto_442694 ) ) ( not ( = ?auto_442690 ?auto_442691 ) ) ( not ( = ?auto_442690 ?auto_442692 ) ) ( not ( = ?auto_442690 ?auto_442693 ) ) ( not ( = ?auto_442690 ?auto_442694 ) ) ( not ( = ?auto_442691 ?auto_442692 ) ) ( not ( = ?auto_442691 ?auto_442693 ) ) ( not ( = ?auto_442691 ?auto_442694 ) ) ( not ( = ?auto_442692 ?auto_442693 ) ) ( not ( = ?auto_442692 ?auto_442694 ) ) ( not ( = ?auto_442693 ?auto_442694 ) ) ( ON ?auto_442692 ?auto_442693 ) ( ON ?auto_442691 ?auto_442692 ) ( ON ?auto_442690 ?auto_442691 ) ( ON ?auto_442689 ?auto_442690 ) ( ON ?auto_442688 ?auto_442689 ) ( CLEAR ?auto_442686 ) ( ON ?auto_442687 ?auto_442688 ) ( CLEAR ?auto_442687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_442680 ?auto_442681 ?auto_442682 ?auto_442683 ?auto_442684 ?auto_442685 ?auto_442686 ?auto_442687 )
      ( MAKE-14PILE ?auto_442680 ?auto_442681 ?auto_442682 ?auto_442683 ?auto_442684 ?auto_442685 ?auto_442686 ?auto_442687 ?auto_442688 ?auto_442689 ?auto_442690 ?auto_442691 ?auto_442692 ?auto_442693 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442738 - BLOCK
      ?auto_442739 - BLOCK
      ?auto_442740 - BLOCK
      ?auto_442741 - BLOCK
      ?auto_442742 - BLOCK
      ?auto_442743 - BLOCK
      ?auto_442744 - BLOCK
      ?auto_442745 - BLOCK
      ?auto_442746 - BLOCK
      ?auto_442747 - BLOCK
      ?auto_442748 - BLOCK
      ?auto_442749 - BLOCK
      ?auto_442750 - BLOCK
      ?auto_442751 - BLOCK
    )
    :vars
    (
      ?auto_442752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442751 ?auto_442752 ) ( ON-TABLE ?auto_442738 ) ( ON ?auto_442739 ?auto_442738 ) ( ON ?auto_442740 ?auto_442739 ) ( ON ?auto_442741 ?auto_442740 ) ( ON ?auto_442742 ?auto_442741 ) ( ON ?auto_442743 ?auto_442742 ) ( not ( = ?auto_442738 ?auto_442739 ) ) ( not ( = ?auto_442738 ?auto_442740 ) ) ( not ( = ?auto_442738 ?auto_442741 ) ) ( not ( = ?auto_442738 ?auto_442742 ) ) ( not ( = ?auto_442738 ?auto_442743 ) ) ( not ( = ?auto_442738 ?auto_442744 ) ) ( not ( = ?auto_442738 ?auto_442745 ) ) ( not ( = ?auto_442738 ?auto_442746 ) ) ( not ( = ?auto_442738 ?auto_442747 ) ) ( not ( = ?auto_442738 ?auto_442748 ) ) ( not ( = ?auto_442738 ?auto_442749 ) ) ( not ( = ?auto_442738 ?auto_442750 ) ) ( not ( = ?auto_442738 ?auto_442751 ) ) ( not ( = ?auto_442738 ?auto_442752 ) ) ( not ( = ?auto_442739 ?auto_442740 ) ) ( not ( = ?auto_442739 ?auto_442741 ) ) ( not ( = ?auto_442739 ?auto_442742 ) ) ( not ( = ?auto_442739 ?auto_442743 ) ) ( not ( = ?auto_442739 ?auto_442744 ) ) ( not ( = ?auto_442739 ?auto_442745 ) ) ( not ( = ?auto_442739 ?auto_442746 ) ) ( not ( = ?auto_442739 ?auto_442747 ) ) ( not ( = ?auto_442739 ?auto_442748 ) ) ( not ( = ?auto_442739 ?auto_442749 ) ) ( not ( = ?auto_442739 ?auto_442750 ) ) ( not ( = ?auto_442739 ?auto_442751 ) ) ( not ( = ?auto_442739 ?auto_442752 ) ) ( not ( = ?auto_442740 ?auto_442741 ) ) ( not ( = ?auto_442740 ?auto_442742 ) ) ( not ( = ?auto_442740 ?auto_442743 ) ) ( not ( = ?auto_442740 ?auto_442744 ) ) ( not ( = ?auto_442740 ?auto_442745 ) ) ( not ( = ?auto_442740 ?auto_442746 ) ) ( not ( = ?auto_442740 ?auto_442747 ) ) ( not ( = ?auto_442740 ?auto_442748 ) ) ( not ( = ?auto_442740 ?auto_442749 ) ) ( not ( = ?auto_442740 ?auto_442750 ) ) ( not ( = ?auto_442740 ?auto_442751 ) ) ( not ( = ?auto_442740 ?auto_442752 ) ) ( not ( = ?auto_442741 ?auto_442742 ) ) ( not ( = ?auto_442741 ?auto_442743 ) ) ( not ( = ?auto_442741 ?auto_442744 ) ) ( not ( = ?auto_442741 ?auto_442745 ) ) ( not ( = ?auto_442741 ?auto_442746 ) ) ( not ( = ?auto_442741 ?auto_442747 ) ) ( not ( = ?auto_442741 ?auto_442748 ) ) ( not ( = ?auto_442741 ?auto_442749 ) ) ( not ( = ?auto_442741 ?auto_442750 ) ) ( not ( = ?auto_442741 ?auto_442751 ) ) ( not ( = ?auto_442741 ?auto_442752 ) ) ( not ( = ?auto_442742 ?auto_442743 ) ) ( not ( = ?auto_442742 ?auto_442744 ) ) ( not ( = ?auto_442742 ?auto_442745 ) ) ( not ( = ?auto_442742 ?auto_442746 ) ) ( not ( = ?auto_442742 ?auto_442747 ) ) ( not ( = ?auto_442742 ?auto_442748 ) ) ( not ( = ?auto_442742 ?auto_442749 ) ) ( not ( = ?auto_442742 ?auto_442750 ) ) ( not ( = ?auto_442742 ?auto_442751 ) ) ( not ( = ?auto_442742 ?auto_442752 ) ) ( not ( = ?auto_442743 ?auto_442744 ) ) ( not ( = ?auto_442743 ?auto_442745 ) ) ( not ( = ?auto_442743 ?auto_442746 ) ) ( not ( = ?auto_442743 ?auto_442747 ) ) ( not ( = ?auto_442743 ?auto_442748 ) ) ( not ( = ?auto_442743 ?auto_442749 ) ) ( not ( = ?auto_442743 ?auto_442750 ) ) ( not ( = ?auto_442743 ?auto_442751 ) ) ( not ( = ?auto_442743 ?auto_442752 ) ) ( not ( = ?auto_442744 ?auto_442745 ) ) ( not ( = ?auto_442744 ?auto_442746 ) ) ( not ( = ?auto_442744 ?auto_442747 ) ) ( not ( = ?auto_442744 ?auto_442748 ) ) ( not ( = ?auto_442744 ?auto_442749 ) ) ( not ( = ?auto_442744 ?auto_442750 ) ) ( not ( = ?auto_442744 ?auto_442751 ) ) ( not ( = ?auto_442744 ?auto_442752 ) ) ( not ( = ?auto_442745 ?auto_442746 ) ) ( not ( = ?auto_442745 ?auto_442747 ) ) ( not ( = ?auto_442745 ?auto_442748 ) ) ( not ( = ?auto_442745 ?auto_442749 ) ) ( not ( = ?auto_442745 ?auto_442750 ) ) ( not ( = ?auto_442745 ?auto_442751 ) ) ( not ( = ?auto_442745 ?auto_442752 ) ) ( not ( = ?auto_442746 ?auto_442747 ) ) ( not ( = ?auto_442746 ?auto_442748 ) ) ( not ( = ?auto_442746 ?auto_442749 ) ) ( not ( = ?auto_442746 ?auto_442750 ) ) ( not ( = ?auto_442746 ?auto_442751 ) ) ( not ( = ?auto_442746 ?auto_442752 ) ) ( not ( = ?auto_442747 ?auto_442748 ) ) ( not ( = ?auto_442747 ?auto_442749 ) ) ( not ( = ?auto_442747 ?auto_442750 ) ) ( not ( = ?auto_442747 ?auto_442751 ) ) ( not ( = ?auto_442747 ?auto_442752 ) ) ( not ( = ?auto_442748 ?auto_442749 ) ) ( not ( = ?auto_442748 ?auto_442750 ) ) ( not ( = ?auto_442748 ?auto_442751 ) ) ( not ( = ?auto_442748 ?auto_442752 ) ) ( not ( = ?auto_442749 ?auto_442750 ) ) ( not ( = ?auto_442749 ?auto_442751 ) ) ( not ( = ?auto_442749 ?auto_442752 ) ) ( not ( = ?auto_442750 ?auto_442751 ) ) ( not ( = ?auto_442750 ?auto_442752 ) ) ( not ( = ?auto_442751 ?auto_442752 ) ) ( ON ?auto_442750 ?auto_442751 ) ( ON ?auto_442749 ?auto_442750 ) ( ON ?auto_442748 ?auto_442749 ) ( ON ?auto_442747 ?auto_442748 ) ( ON ?auto_442746 ?auto_442747 ) ( ON ?auto_442745 ?auto_442746 ) ( CLEAR ?auto_442743 ) ( ON ?auto_442744 ?auto_442745 ) ( CLEAR ?auto_442744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_442738 ?auto_442739 ?auto_442740 ?auto_442741 ?auto_442742 ?auto_442743 ?auto_442744 )
      ( MAKE-14PILE ?auto_442738 ?auto_442739 ?auto_442740 ?auto_442741 ?auto_442742 ?auto_442743 ?auto_442744 ?auto_442745 ?auto_442746 ?auto_442747 ?auto_442748 ?auto_442749 ?auto_442750 ?auto_442751 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442796 - BLOCK
      ?auto_442797 - BLOCK
      ?auto_442798 - BLOCK
      ?auto_442799 - BLOCK
      ?auto_442800 - BLOCK
      ?auto_442801 - BLOCK
      ?auto_442802 - BLOCK
      ?auto_442803 - BLOCK
      ?auto_442804 - BLOCK
      ?auto_442805 - BLOCK
      ?auto_442806 - BLOCK
      ?auto_442807 - BLOCK
      ?auto_442808 - BLOCK
      ?auto_442809 - BLOCK
    )
    :vars
    (
      ?auto_442810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442809 ?auto_442810 ) ( ON-TABLE ?auto_442796 ) ( ON ?auto_442797 ?auto_442796 ) ( ON ?auto_442798 ?auto_442797 ) ( ON ?auto_442799 ?auto_442798 ) ( ON ?auto_442800 ?auto_442799 ) ( not ( = ?auto_442796 ?auto_442797 ) ) ( not ( = ?auto_442796 ?auto_442798 ) ) ( not ( = ?auto_442796 ?auto_442799 ) ) ( not ( = ?auto_442796 ?auto_442800 ) ) ( not ( = ?auto_442796 ?auto_442801 ) ) ( not ( = ?auto_442796 ?auto_442802 ) ) ( not ( = ?auto_442796 ?auto_442803 ) ) ( not ( = ?auto_442796 ?auto_442804 ) ) ( not ( = ?auto_442796 ?auto_442805 ) ) ( not ( = ?auto_442796 ?auto_442806 ) ) ( not ( = ?auto_442796 ?auto_442807 ) ) ( not ( = ?auto_442796 ?auto_442808 ) ) ( not ( = ?auto_442796 ?auto_442809 ) ) ( not ( = ?auto_442796 ?auto_442810 ) ) ( not ( = ?auto_442797 ?auto_442798 ) ) ( not ( = ?auto_442797 ?auto_442799 ) ) ( not ( = ?auto_442797 ?auto_442800 ) ) ( not ( = ?auto_442797 ?auto_442801 ) ) ( not ( = ?auto_442797 ?auto_442802 ) ) ( not ( = ?auto_442797 ?auto_442803 ) ) ( not ( = ?auto_442797 ?auto_442804 ) ) ( not ( = ?auto_442797 ?auto_442805 ) ) ( not ( = ?auto_442797 ?auto_442806 ) ) ( not ( = ?auto_442797 ?auto_442807 ) ) ( not ( = ?auto_442797 ?auto_442808 ) ) ( not ( = ?auto_442797 ?auto_442809 ) ) ( not ( = ?auto_442797 ?auto_442810 ) ) ( not ( = ?auto_442798 ?auto_442799 ) ) ( not ( = ?auto_442798 ?auto_442800 ) ) ( not ( = ?auto_442798 ?auto_442801 ) ) ( not ( = ?auto_442798 ?auto_442802 ) ) ( not ( = ?auto_442798 ?auto_442803 ) ) ( not ( = ?auto_442798 ?auto_442804 ) ) ( not ( = ?auto_442798 ?auto_442805 ) ) ( not ( = ?auto_442798 ?auto_442806 ) ) ( not ( = ?auto_442798 ?auto_442807 ) ) ( not ( = ?auto_442798 ?auto_442808 ) ) ( not ( = ?auto_442798 ?auto_442809 ) ) ( not ( = ?auto_442798 ?auto_442810 ) ) ( not ( = ?auto_442799 ?auto_442800 ) ) ( not ( = ?auto_442799 ?auto_442801 ) ) ( not ( = ?auto_442799 ?auto_442802 ) ) ( not ( = ?auto_442799 ?auto_442803 ) ) ( not ( = ?auto_442799 ?auto_442804 ) ) ( not ( = ?auto_442799 ?auto_442805 ) ) ( not ( = ?auto_442799 ?auto_442806 ) ) ( not ( = ?auto_442799 ?auto_442807 ) ) ( not ( = ?auto_442799 ?auto_442808 ) ) ( not ( = ?auto_442799 ?auto_442809 ) ) ( not ( = ?auto_442799 ?auto_442810 ) ) ( not ( = ?auto_442800 ?auto_442801 ) ) ( not ( = ?auto_442800 ?auto_442802 ) ) ( not ( = ?auto_442800 ?auto_442803 ) ) ( not ( = ?auto_442800 ?auto_442804 ) ) ( not ( = ?auto_442800 ?auto_442805 ) ) ( not ( = ?auto_442800 ?auto_442806 ) ) ( not ( = ?auto_442800 ?auto_442807 ) ) ( not ( = ?auto_442800 ?auto_442808 ) ) ( not ( = ?auto_442800 ?auto_442809 ) ) ( not ( = ?auto_442800 ?auto_442810 ) ) ( not ( = ?auto_442801 ?auto_442802 ) ) ( not ( = ?auto_442801 ?auto_442803 ) ) ( not ( = ?auto_442801 ?auto_442804 ) ) ( not ( = ?auto_442801 ?auto_442805 ) ) ( not ( = ?auto_442801 ?auto_442806 ) ) ( not ( = ?auto_442801 ?auto_442807 ) ) ( not ( = ?auto_442801 ?auto_442808 ) ) ( not ( = ?auto_442801 ?auto_442809 ) ) ( not ( = ?auto_442801 ?auto_442810 ) ) ( not ( = ?auto_442802 ?auto_442803 ) ) ( not ( = ?auto_442802 ?auto_442804 ) ) ( not ( = ?auto_442802 ?auto_442805 ) ) ( not ( = ?auto_442802 ?auto_442806 ) ) ( not ( = ?auto_442802 ?auto_442807 ) ) ( not ( = ?auto_442802 ?auto_442808 ) ) ( not ( = ?auto_442802 ?auto_442809 ) ) ( not ( = ?auto_442802 ?auto_442810 ) ) ( not ( = ?auto_442803 ?auto_442804 ) ) ( not ( = ?auto_442803 ?auto_442805 ) ) ( not ( = ?auto_442803 ?auto_442806 ) ) ( not ( = ?auto_442803 ?auto_442807 ) ) ( not ( = ?auto_442803 ?auto_442808 ) ) ( not ( = ?auto_442803 ?auto_442809 ) ) ( not ( = ?auto_442803 ?auto_442810 ) ) ( not ( = ?auto_442804 ?auto_442805 ) ) ( not ( = ?auto_442804 ?auto_442806 ) ) ( not ( = ?auto_442804 ?auto_442807 ) ) ( not ( = ?auto_442804 ?auto_442808 ) ) ( not ( = ?auto_442804 ?auto_442809 ) ) ( not ( = ?auto_442804 ?auto_442810 ) ) ( not ( = ?auto_442805 ?auto_442806 ) ) ( not ( = ?auto_442805 ?auto_442807 ) ) ( not ( = ?auto_442805 ?auto_442808 ) ) ( not ( = ?auto_442805 ?auto_442809 ) ) ( not ( = ?auto_442805 ?auto_442810 ) ) ( not ( = ?auto_442806 ?auto_442807 ) ) ( not ( = ?auto_442806 ?auto_442808 ) ) ( not ( = ?auto_442806 ?auto_442809 ) ) ( not ( = ?auto_442806 ?auto_442810 ) ) ( not ( = ?auto_442807 ?auto_442808 ) ) ( not ( = ?auto_442807 ?auto_442809 ) ) ( not ( = ?auto_442807 ?auto_442810 ) ) ( not ( = ?auto_442808 ?auto_442809 ) ) ( not ( = ?auto_442808 ?auto_442810 ) ) ( not ( = ?auto_442809 ?auto_442810 ) ) ( ON ?auto_442808 ?auto_442809 ) ( ON ?auto_442807 ?auto_442808 ) ( ON ?auto_442806 ?auto_442807 ) ( ON ?auto_442805 ?auto_442806 ) ( ON ?auto_442804 ?auto_442805 ) ( ON ?auto_442803 ?auto_442804 ) ( ON ?auto_442802 ?auto_442803 ) ( CLEAR ?auto_442800 ) ( ON ?auto_442801 ?auto_442802 ) ( CLEAR ?auto_442801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_442796 ?auto_442797 ?auto_442798 ?auto_442799 ?auto_442800 ?auto_442801 )
      ( MAKE-14PILE ?auto_442796 ?auto_442797 ?auto_442798 ?auto_442799 ?auto_442800 ?auto_442801 ?auto_442802 ?auto_442803 ?auto_442804 ?auto_442805 ?auto_442806 ?auto_442807 ?auto_442808 ?auto_442809 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442854 - BLOCK
      ?auto_442855 - BLOCK
      ?auto_442856 - BLOCK
      ?auto_442857 - BLOCK
      ?auto_442858 - BLOCK
      ?auto_442859 - BLOCK
      ?auto_442860 - BLOCK
      ?auto_442861 - BLOCK
      ?auto_442862 - BLOCK
      ?auto_442863 - BLOCK
      ?auto_442864 - BLOCK
      ?auto_442865 - BLOCK
      ?auto_442866 - BLOCK
      ?auto_442867 - BLOCK
    )
    :vars
    (
      ?auto_442868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442867 ?auto_442868 ) ( ON-TABLE ?auto_442854 ) ( ON ?auto_442855 ?auto_442854 ) ( ON ?auto_442856 ?auto_442855 ) ( ON ?auto_442857 ?auto_442856 ) ( not ( = ?auto_442854 ?auto_442855 ) ) ( not ( = ?auto_442854 ?auto_442856 ) ) ( not ( = ?auto_442854 ?auto_442857 ) ) ( not ( = ?auto_442854 ?auto_442858 ) ) ( not ( = ?auto_442854 ?auto_442859 ) ) ( not ( = ?auto_442854 ?auto_442860 ) ) ( not ( = ?auto_442854 ?auto_442861 ) ) ( not ( = ?auto_442854 ?auto_442862 ) ) ( not ( = ?auto_442854 ?auto_442863 ) ) ( not ( = ?auto_442854 ?auto_442864 ) ) ( not ( = ?auto_442854 ?auto_442865 ) ) ( not ( = ?auto_442854 ?auto_442866 ) ) ( not ( = ?auto_442854 ?auto_442867 ) ) ( not ( = ?auto_442854 ?auto_442868 ) ) ( not ( = ?auto_442855 ?auto_442856 ) ) ( not ( = ?auto_442855 ?auto_442857 ) ) ( not ( = ?auto_442855 ?auto_442858 ) ) ( not ( = ?auto_442855 ?auto_442859 ) ) ( not ( = ?auto_442855 ?auto_442860 ) ) ( not ( = ?auto_442855 ?auto_442861 ) ) ( not ( = ?auto_442855 ?auto_442862 ) ) ( not ( = ?auto_442855 ?auto_442863 ) ) ( not ( = ?auto_442855 ?auto_442864 ) ) ( not ( = ?auto_442855 ?auto_442865 ) ) ( not ( = ?auto_442855 ?auto_442866 ) ) ( not ( = ?auto_442855 ?auto_442867 ) ) ( not ( = ?auto_442855 ?auto_442868 ) ) ( not ( = ?auto_442856 ?auto_442857 ) ) ( not ( = ?auto_442856 ?auto_442858 ) ) ( not ( = ?auto_442856 ?auto_442859 ) ) ( not ( = ?auto_442856 ?auto_442860 ) ) ( not ( = ?auto_442856 ?auto_442861 ) ) ( not ( = ?auto_442856 ?auto_442862 ) ) ( not ( = ?auto_442856 ?auto_442863 ) ) ( not ( = ?auto_442856 ?auto_442864 ) ) ( not ( = ?auto_442856 ?auto_442865 ) ) ( not ( = ?auto_442856 ?auto_442866 ) ) ( not ( = ?auto_442856 ?auto_442867 ) ) ( not ( = ?auto_442856 ?auto_442868 ) ) ( not ( = ?auto_442857 ?auto_442858 ) ) ( not ( = ?auto_442857 ?auto_442859 ) ) ( not ( = ?auto_442857 ?auto_442860 ) ) ( not ( = ?auto_442857 ?auto_442861 ) ) ( not ( = ?auto_442857 ?auto_442862 ) ) ( not ( = ?auto_442857 ?auto_442863 ) ) ( not ( = ?auto_442857 ?auto_442864 ) ) ( not ( = ?auto_442857 ?auto_442865 ) ) ( not ( = ?auto_442857 ?auto_442866 ) ) ( not ( = ?auto_442857 ?auto_442867 ) ) ( not ( = ?auto_442857 ?auto_442868 ) ) ( not ( = ?auto_442858 ?auto_442859 ) ) ( not ( = ?auto_442858 ?auto_442860 ) ) ( not ( = ?auto_442858 ?auto_442861 ) ) ( not ( = ?auto_442858 ?auto_442862 ) ) ( not ( = ?auto_442858 ?auto_442863 ) ) ( not ( = ?auto_442858 ?auto_442864 ) ) ( not ( = ?auto_442858 ?auto_442865 ) ) ( not ( = ?auto_442858 ?auto_442866 ) ) ( not ( = ?auto_442858 ?auto_442867 ) ) ( not ( = ?auto_442858 ?auto_442868 ) ) ( not ( = ?auto_442859 ?auto_442860 ) ) ( not ( = ?auto_442859 ?auto_442861 ) ) ( not ( = ?auto_442859 ?auto_442862 ) ) ( not ( = ?auto_442859 ?auto_442863 ) ) ( not ( = ?auto_442859 ?auto_442864 ) ) ( not ( = ?auto_442859 ?auto_442865 ) ) ( not ( = ?auto_442859 ?auto_442866 ) ) ( not ( = ?auto_442859 ?auto_442867 ) ) ( not ( = ?auto_442859 ?auto_442868 ) ) ( not ( = ?auto_442860 ?auto_442861 ) ) ( not ( = ?auto_442860 ?auto_442862 ) ) ( not ( = ?auto_442860 ?auto_442863 ) ) ( not ( = ?auto_442860 ?auto_442864 ) ) ( not ( = ?auto_442860 ?auto_442865 ) ) ( not ( = ?auto_442860 ?auto_442866 ) ) ( not ( = ?auto_442860 ?auto_442867 ) ) ( not ( = ?auto_442860 ?auto_442868 ) ) ( not ( = ?auto_442861 ?auto_442862 ) ) ( not ( = ?auto_442861 ?auto_442863 ) ) ( not ( = ?auto_442861 ?auto_442864 ) ) ( not ( = ?auto_442861 ?auto_442865 ) ) ( not ( = ?auto_442861 ?auto_442866 ) ) ( not ( = ?auto_442861 ?auto_442867 ) ) ( not ( = ?auto_442861 ?auto_442868 ) ) ( not ( = ?auto_442862 ?auto_442863 ) ) ( not ( = ?auto_442862 ?auto_442864 ) ) ( not ( = ?auto_442862 ?auto_442865 ) ) ( not ( = ?auto_442862 ?auto_442866 ) ) ( not ( = ?auto_442862 ?auto_442867 ) ) ( not ( = ?auto_442862 ?auto_442868 ) ) ( not ( = ?auto_442863 ?auto_442864 ) ) ( not ( = ?auto_442863 ?auto_442865 ) ) ( not ( = ?auto_442863 ?auto_442866 ) ) ( not ( = ?auto_442863 ?auto_442867 ) ) ( not ( = ?auto_442863 ?auto_442868 ) ) ( not ( = ?auto_442864 ?auto_442865 ) ) ( not ( = ?auto_442864 ?auto_442866 ) ) ( not ( = ?auto_442864 ?auto_442867 ) ) ( not ( = ?auto_442864 ?auto_442868 ) ) ( not ( = ?auto_442865 ?auto_442866 ) ) ( not ( = ?auto_442865 ?auto_442867 ) ) ( not ( = ?auto_442865 ?auto_442868 ) ) ( not ( = ?auto_442866 ?auto_442867 ) ) ( not ( = ?auto_442866 ?auto_442868 ) ) ( not ( = ?auto_442867 ?auto_442868 ) ) ( ON ?auto_442866 ?auto_442867 ) ( ON ?auto_442865 ?auto_442866 ) ( ON ?auto_442864 ?auto_442865 ) ( ON ?auto_442863 ?auto_442864 ) ( ON ?auto_442862 ?auto_442863 ) ( ON ?auto_442861 ?auto_442862 ) ( ON ?auto_442860 ?auto_442861 ) ( ON ?auto_442859 ?auto_442860 ) ( CLEAR ?auto_442857 ) ( ON ?auto_442858 ?auto_442859 ) ( CLEAR ?auto_442858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_442854 ?auto_442855 ?auto_442856 ?auto_442857 ?auto_442858 )
      ( MAKE-14PILE ?auto_442854 ?auto_442855 ?auto_442856 ?auto_442857 ?auto_442858 ?auto_442859 ?auto_442860 ?auto_442861 ?auto_442862 ?auto_442863 ?auto_442864 ?auto_442865 ?auto_442866 ?auto_442867 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442912 - BLOCK
      ?auto_442913 - BLOCK
      ?auto_442914 - BLOCK
      ?auto_442915 - BLOCK
      ?auto_442916 - BLOCK
      ?auto_442917 - BLOCK
      ?auto_442918 - BLOCK
      ?auto_442919 - BLOCK
      ?auto_442920 - BLOCK
      ?auto_442921 - BLOCK
      ?auto_442922 - BLOCK
      ?auto_442923 - BLOCK
      ?auto_442924 - BLOCK
      ?auto_442925 - BLOCK
    )
    :vars
    (
      ?auto_442926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442925 ?auto_442926 ) ( ON-TABLE ?auto_442912 ) ( ON ?auto_442913 ?auto_442912 ) ( ON ?auto_442914 ?auto_442913 ) ( not ( = ?auto_442912 ?auto_442913 ) ) ( not ( = ?auto_442912 ?auto_442914 ) ) ( not ( = ?auto_442912 ?auto_442915 ) ) ( not ( = ?auto_442912 ?auto_442916 ) ) ( not ( = ?auto_442912 ?auto_442917 ) ) ( not ( = ?auto_442912 ?auto_442918 ) ) ( not ( = ?auto_442912 ?auto_442919 ) ) ( not ( = ?auto_442912 ?auto_442920 ) ) ( not ( = ?auto_442912 ?auto_442921 ) ) ( not ( = ?auto_442912 ?auto_442922 ) ) ( not ( = ?auto_442912 ?auto_442923 ) ) ( not ( = ?auto_442912 ?auto_442924 ) ) ( not ( = ?auto_442912 ?auto_442925 ) ) ( not ( = ?auto_442912 ?auto_442926 ) ) ( not ( = ?auto_442913 ?auto_442914 ) ) ( not ( = ?auto_442913 ?auto_442915 ) ) ( not ( = ?auto_442913 ?auto_442916 ) ) ( not ( = ?auto_442913 ?auto_442917 ) ) ( not ( = ?auto_442913 ?auto_442918 ) ) ( not ( = ?auto_442913 ?auto_442919 ) ) ( not ( = ?auto_442913 ?auto_442920 ) ) ( not ( = ?auto_442913 ?auto_442921 ) ) ( not ( = ?auto_442913 ?auto_442922 ) ) ( not ( = ?auto_442913 ?auto_442923 ) ) ( not ( = ?auto_442913 ?auto_442924 ) ) ( not ( = ?auto_442913 ?auto_442925 ) ) ( not ( = ?auto_442913 ?auto_442926 ) ) ( not ( = ?auto_442914 ?auto_442915 ) ) ( not ( = ?auto_442914 ?auto_442916 ) ) ( not ( = ?auto_442914 ?auto_442917 ) ) ( not ( = ?auto_442914 ?auto_442918 ) ) ( not ( = ?auto_442914 ?auto_442919 ) ) ( not ( = ?auto_442914 ?auto_442920 ) ) ( not ( = ?auto_442914 ?auto_442921 ) ) ( not ( = ?auto_442914 ?auto_442922 ) ) ( not ( = ?auto_442914 ?auto_442923 ) ) ( not ( = ?auto_442914 ?auto_442924 ) ) ( not ( = ?auto_442914 ?auto_442925 ) ) ( not ( = ?auto_442914 ?auto_442926 ) ) ( not ( = ?auto_442915 ?auto_442916 ) ) ( not ( = ?auto_442915 ?auto_442917 ) ) ( not ( = ?auto_442915 ?auto_442918 ) ) ( not ( = ?auto_442915 ?auto_442919 ) ) ( not ( = ?auto_442915 ?auto_442920 ) ) ( not ( = ?auto_442915 ?auto_442921 ) ) ( not ( = ?auto_442915 ?auto_442922 ) ) ( not ( = ?auto_442915 ?auto_442923 ) ) ( not ( = ?auto_442915 ?auto_442924 ) ) ( not ( = ?auto_442915 ?auto_442925 ) ) ( not ( = ?auto_442915 ?auto_442926 ) ) ( not ( = ?auto_442916 ?auto_442917 ) ) ( not ( = ?auto_442916 ?auto_442918 ) ) ( not ( = ?auto_442916 ?auto_442919 ) ) ( not ( = ?auto_442916 ?auto_442920 ) ) ( not ( = ?auto_442916 ?auto_442921 ) ) ( not ( = ?auto_442916 ?auto_442922 ) ) ( not ( = ?auto_442916 ?auto_442923 ) ) ( not ( = ?auto_442916 ?auto_442924 ) ) ( not ( = ?auto_442916 ?auto_442925 ) ) ( not ( = ?auto_442916 ?auto_442926 ) ) ( not ( = ?auto_442917 ?auto_442918 ) ) ( not ( = ?auto_442917 ?auto_442919 ) ) ( not ( = ?auto_442917 ?auto_442920 ) ) ( not ( = ?auto_442917 ?auto_442921 ) ) ( not ( = ?auto_442917 ?auto_442922 ) ) ( not ( = ?auto_442917 ?auto_442923 ) ) ( not ( = ?auto_442917 ?auto_442924 ) ) ( not ( = ?auto_442917 ?auto_442925 ) ) ( not ( = ?auto_442917 ?auto_442926 ) ) ( not ( = ?auto_442918 ?auto_442919 ) ) ( not ( = ?auto_442918 ?auto_442920 ) ) ( not ( = ?auto_442918 ?auto_442921 ) ) ( not ( = ?auto_442918 ?auto_442922 ) ) ( not ( = ?auto_442918 ?auto_442923 ) ) ( not ( = ?auto_442918 ?auto_442924 ) ) ( not ( = ?auto_442918 ?auto_442925 ) ) ( not ( = ?auto_442918 ?auto_442926 ) ) ( not ( = ?auto_442919 ?auto_442920 ) ) ( not ( = ?auto_442919 ?auto_442921 ) ) ( not ( = ?auto_442919 ?auto_442922 ) ) ( not ( = ?auto_442919 ?auto_442923 ) ) ( not ( = ?auto_442919 ?auto_442924 ) ) ( not ( = ?auto_442919 ?auto_442925 ) ) ( not ( = ?auto_442919 ?auto_442926 ) ) ( not ( = ?auto_442920 ?auto_442921 ) ) ( not ( = ?auto_442920 ?auto_442922 ) ) ( not ( = ?auto_442920 ?auto_442923 ) ) ( not ( = ?auto_442920 ?auto_442924 ) ) ( not ( = ?auto_442920 ?auto_442925 ) ) ( not ( = ?auto_442920 ?auto_442926 ) ) ( not ( = ?auto_442921 ?auto_442922 ) ) ( not ( = ?auto_442921 ?auto_442923 ) ) ( not ( = ?auto_442921 ?auto_442924 ) ) ( not ( = ?auto_442921 ?auto_442925 ) ) ( not ( = ?auto_442921 ?auto_442926 ) ) ( not ( = ?auto_442922 ?auto_442923 ) ) ( not ( = ?auto_442922 ?auto_442924 ) ) ( not ( = ?auto_442922 ?auto_442925 ) ) ( not ( = ?auto_442922 ?auto_442926 ) ) ( not ( = ?auto_442923 ?auto_442924 ) ) ( not ( = ?auto_442923 ?auto_442925 ) ) ( not ( = ?auto_442923 ?auto_442926 ) ) ( not ( = ?auto_442924 ?auto_442925 ) ) ( not ( = ?auto_442924 ?auto_442926 ) ) ( not ( = ?auto_442925 ?auto_442926 ) ) ( ON ?auto_442924 ?auto_442925 ) ( ON ?auto_442923 ?auto_442924 ) ( ON ?auto_442922 ?auto_442923 ) ( ON ?auto_442921 ?auto_442922 ) ( ON ?auto_442920 ?auto_442921 ) ( ON ?auto_442919 ?auto_442920 ) ( ON ?auto_442918 ?auto_442919 ) ( ON ?auto_442917 ?auto_442918 ) ( ON ?auto_442916 ?auto_442917 ) ( CLEAR ?auto_442914 ) ( ON ?auto_442915 ?auto_442916 ) ( CLEAR ?auto_442915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_442912 ?auto_442913 ?auto_442914 ?auto_442915 )
      ( MAKE-14PILE ?auto_442912 ?auto_442913 ?auto_442914 ?auto_442915 ?auto_442916 ?auto_442917 ?auto_442918 ?auto_442919 ?auto_442920 ?auto_442921 ?auto_442922 ?auto_442923 ?auto_442924 ?auto_442925 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_442970 - BLOCK
      ?auto_442971 - BLOCK
      ?auto_442972 - BLOCK
      ?auto_442973 - BLOCK
      ?auto_442974 - BLOCK
      ?auto_442975 - BLOCK
      ?auto_442976 - BLOCK
      ?auto_442977 - BLOCK
      ?auto_442978 - BLOCK
      ?auto_442979 - BLOCK
      ?auto_442980 - BLOCK
      ?auto_442981 - BLOCK
      ?auto_442982 - BLOCK
      ?auto_442983 - BLOCK
    )
    :vars
    (
      ?auto_442984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_442983 ?auto_442984 ) ( ON-TABLE ?auto_442970 ) ( ON ?auto_442971 ?auto_442970 ) ( not ( = ?auto_442970 ?auto_442971 ) ) ( not ( = ?auto_442970 ?auto_442972 ) ) ( not ( = ?auto_442970 ?auto_442973 ) ) ( not ( = ?auto_442970 ?auto_442974 ) ) ( not ( = ?auto_442970 ?auto_442975 ) ) ( not ( = ?auto_442970 ?auto_442976 ) ) ( not ( = ?auto_442970 ?auto_442977 ) ) ( not ( = ?auto_442970 ?auto_442978 ) ) ( not ( = ?auto_442970 ?auto_442979 ) ) ( not ( = ?auto_442970 ?auto_442980 ) ) ( not ( = ?auto_442970 ?auto_442981 ) ) ( not ( = ?auto_442970 ?auto_442982 ) ) ( not ( = ?auto_442970 ?auto_442983 ) ) ( not ( = ?auto_442970 ?auto_442984 ) ) ( not ( = ?auto_442971 ?auto_442972 ) ) ( not ( = ?auto_442971 ?auto_442973 ) ) ( not ( = ?auto_442971 ?auto_442974 ) ) ( not ( = ?auto_442971 ?auto_442975 ) ) ( not ( = ?auto_442971 ?auto_442976 ) ) ( not ( = ?auto_442971 ?auto_442977 ) ) ( not ( = ?auto_442971 ?auto_442978 ) ) ( not ( = ?auto_442971 ?auto_442979 ) ) ( not ( = ?auto_442971 ?auto_442980 ) ) ( not ( = ?auto_442971 ?auto_442981 ) ) ( not ( = ?auto_442971 ?auto_442982 ) ) ( not ( = ?auto_442971 ?auto_442983 ) ) ( not ( = ?auto_442971 ?auto_442984 ) ) ( not ( = ?auto_442972 ?auto_442973 ) ) ( not ( = ?auto_442972 ?auto_442974 ) ) ( not ( = ?auto_442972 ?auto_442975 ) ) ( not ( = ?auto_442972 ?auto_442976 ) ) ( not ( = ?auto_442972 ?auto_442977 ) ) ( not ( = ?auto_442972 ?auto_442978 ) ) ( not ( = ?auto_442972 ?auto_442979 ) ) ( not ( = ?auto_442972 ?auto_442980 ) ) ( not ( = ?auto_442972 ?auto_442981 ) ) ( not ( = ?auto_442972 ?auto_442982 ) ) ( not ( = ?auto_442972 ?auto_442983 ) ) ( not ( = ?auto_442972 ?auto_442984 ) ) ( not ( = ?auto_442973 ?auto_442974 ) ) ( not ( = ?auto_442973 ?auto_442975 ) ) ( not ( = ?auto_442973 ?auto_442976 ) ) ( not ( = ?auto_442973 ?auto_442977 ) ) ( not ( = ?auto_442973 ?auto_442978 ) ) ( not ( = ?auto_442973 ?auto_442979 ) ) ( not ( = ?auto_442973 ?auto_442980 ) ) ( not ( = ?auto_442973 ?auto_442981 ) ) ( not ( = ?auto_442973 ?auto_442982 ) ) ( not ( = ?auto_442973 ?auto_442983 ) ) ( not ( = ?auto_442973 ?auto_442984 ) ) ( not ( = ?auto_442974 ?auto_442975 ) ) ( not ( = ?auto_442974 ?auto_442976 ) ) ( not ( = ?auto_442974 ?auto_442977 ) ) ( not ( = ?auto_442974 ?auto_442978 ) ) ( not ( = ?auto_442974 ?auto_442979 ) ) ( not ( = ?auto_442974 ?auto_442980 ) ) ( not ( = ?auto_442974 ?auto_442981 ) ) ( not ( = ?auto_442974 ?auto_442982 ) ) ( not ( = ?auto_442974 ?auto_442983 ) ) ( not ( = ?auto_442974 ?auto_442984 ) ) ( not ( = ?auto_442975 ?auto_442976 ) ) ( not ( = ?auto_442975 ?auto_442977 ) ) ( not ( = ?auto_442975 ?auto_442978 ) ) ( not ( = ?auto_442975 ?auto_442979 ) ) ( not ( = ?auto_442975 ?auto_442980 ) ) ( not ( = ?auto_442975 ?auto_442981 ) ) ( not ( = ?auto_442975 ?auto_442982 ) ) ( not ( = ?auto_442975 ?auto_442983 ) ) ( not ( = ?auto_442975 ?auto_442984 ) ) ( not ( = ?auto_442976 ?auto_442977 ) ) ( not ( = ?auto_442976 ?auto_442978 ) ) ( not ( = ?auto_442976 ?auto_442979 ) ) ( not ( = ?auto_442976 ?auto_442980 ) ) ( not ( = ?auto_442976 ?auto_442981 ) ) ( not ( = ?auto_442976 ?auto_442982 ) ) ( not ( = ?auto_442976 ?auto_442983 ) ) ( not ( = ?auto_442976 ?auto_442984 ) ) ( not ( = ?auto_442977 ?auto_442978 ) ) ( not ( = ?auto_442977 ?auto_442979 ) ) ( not ( = ?auto_442977 ?auto_442980 ) ) ( not ( = ?auto_442977 ?auto_442981 ) ) ( not ( = ?auto_442977 ?auto_442982 ) ) ( not ( = ?auto_442977 ?auto_442983 ) ) ( not ( = ?auto_442977 ?auto_442984 ) ) ( not ( = ?auto_442978 ?auto_442979 ) ) ( not ( = ?auto_442978 ?auto_442980 ) ) ( not ( = ?auto_442978 ?auto_442981 ) ) ( not ( = ?auto_442978 ?auto_442982 ) ) ( not ( = ?auto_442978 ?auto_442983 ) ) ( not ( = ?auto_442978 ?auto_442984 ) ) ( not ( = ?auto_442979 ?auto_442980 ) ) ( not ( = ?auto_442979 ?auto_442981 ) ) ( not ( = ?auto_442979 ?auto_442982 ) ) ( not ( = ?auto_442979 ?auto_442983 ) ) ( not ( = ?auto_442979 ?auto_442984 ) ) ( not ( = ?auto_442980 ?auto_442981 ) ) ( not ( = ?auto_442980 ?auto_442982 ) ) ( not ( = ?auto_442980 ?auto_442983 ) ) ( not ( = ?auto_442980 ?auto_442984 ) ) ( not ( = ?auto_442981 ?auto_442982 ) ) ( not ( = ?auto_442981 ?auto_442983 ) ) ( not ( = ?auto_442981 ?auto_442984 ) ) ( not ( = ?auto_442982 ?auto_442983 ) ) ( not ( = ?auto_442982 ?auto_442984 ) ) ( not ( = ?auto_442983 ?auto_442984 ) ) ( ON ?auto_442982 ?auto_442983 ) ( ON ?auto_442981 ?auto_442982 ) ( ON ?auto_442980 ?auto_442981 ) ( ON ?auto_442979 ?auto_442980 ) ( ON ?auto_442978 ?auto_442979 ) ( ON ?auto_442977 ?auto_442978 ) ( ON ?auto_442976 ?auto_442977 ) ( ON ?auto_442975 ?auto_442976 ) ( ON ?auto_442974 ?auto_442975 ) ( ON ?auto_442973 ?auto_442974 ) ( CLEAR ?auto_442971 ) ( ON ?auto_442972 ?auto_442973 ) ( CLEAR ?auto_442972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_442970 ?auto_442971 ?auto_442972 )
      ( MAKE-14PILE ?auto_442970 ?auto_442971 ?auto_442972 ?auto_442973 ?auto_442974 ?auto_442975 ?auto_442976 ?auto_442977 ?auto_442978 ?auto_442979 ?auto_442980 ?auto_442981 ?auto_442982 ?auto_442983 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_443028 - BLOCK
      ?auto_443029 - BLOCK
      ?auto_443030 - BLOCK
      ?auto_443031 - BLOCK
      ?auto_443032 - BLOCK
      ?auto_443033 - BLOCK
      ?auto_443034 - BLOCK
      ?auto_443035 - BLOCK
      ?auto_443036 - BLOCK
      ?auto_443037 - BLOCK
      ?auto_443038 - BLOCK
      ?auto_443039 - BLOCK
      ?auto_443040 - BLOCK
      ?auto_443041 - BLOCK
    )
    :vars
    (
      ?auto_443042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443041 ?auto_443042 ) ( ON-TABLE ?auto_443028 ) ( not ( = ?auto_443028 ?auto_443029 ) ) ( not ( = ?auto_443028 ?auto_443030 ) ) ( not ( = ?auto_443028 ?auto_443031 ) ) ( not ( = ?auto_443028 ?auto_443032 ) ) ( not ( = ?auto_443028 ?auto_443033 ) ) ( not ( = ?auto_443028 ?auto_443034 ) ) ( not ( = ?auto_443028 ?auto_443035 ) ) ( not ( = ?auto_443028 ?auto_443036 ) ) ( not ( = ?auto_443028 ?auto_443037 ) ) ( not ( = ?auto_443028 ?auto_443038 ) ) ( not ( = ?auto_443028 ?auto_443039 ) ) ( not ( = ?auto_443028 ?auto_443040 ) ) ( not ( = ?auto_443028 ?auto_443041 ) ) ( not ( = ?auto_443028 ?auto_443042 ) ) ( not ( = ?auto_443029 ?auto_443030 ) ) ( not ( = ?auto_443029 ?auto_443031 ) ) ( not ( = ?auto_443029 ?auto_443032 ) ) ( not ( = ?auto_443029 ?auto_443033 ) ) ( not ( = ?auto_443029 ?auto_443034 ) ) ( not ( = ?auto_443029 ?auto_443035 ) ) ( not ( = ?auto_443029 ?auto_443036 ) ) ( not ( = ?auto_443029 ?auto_443037 ) ) ( not ( = ?auto_443029 ?auto_443038 ) ) ( not ( = ?auto_443029 ?auto_443039 ) ) ( not ( = ?auto_443029 ?auto_443040 ) ) ( not ( = ?auto_443029 ?auto_443041 ) ) ( not ( = ?auto_443029 ?auto_443042 ) ) ( not ( = ?auto_443030 ?auto_443031 ) ) ( not ( = ?auto_443030 ?auto_443032 ) ) ( not ( = ?auto_443030 ?auto_443033 ) ) ( not ( = ?auto_443030 ?auto_443034 ) ) ( not ( = ?auto_443030 ?auto_443035 ) ) ( not ( = ?auto_443030 ?auto_443036 ) ) ( not ( = ?auto_443030 ?auto_443037 ) ) ( not ( = ?auto_443030 ?auto_443038 ) ) ( not ( = ?auto_443030 ?auto_443039 ) ) ( not ( = ?auto_443030 ?auto_443040 ) ) ( not ( = ?auto_443030 ?auto_443041 ) ) ( not ( = ?auto_443030 ?auto_443042 ) ) ( not ( = ?auto_443031 ?auto_443032 ) ) ( not ( = ?auto_443031 ?auto_443033 ) ) ( not ( = ?auto_443031 ?auto_443034 ) ) ( not ( = ?auto_443031 ?auto_443035 ) ) ( not ( = ?auto_443031 ?auto_443036 ) ) ( not ( = ?auto_443031 ?auto_443037 ) ) ( not ( = ?auto_443031 ?auto_443038 ) ) ( not ( = ?auto_443031 ?auto_443039 ) ) ( not ( = ?auto_443031 ?auto_443040 ) ) ( not ( = ?auto_443031 ?auto_443041 ) ) ( not ( = ?auto_443031 ?auto_443042 ) ) ( not ( = ?auto_443032 ?auto_443033 ) ) ( not ( = ?auto_443032 ?auto_443034 ) ) ( not ( = ?auto_443032 ?auto_443035 ) ) ( not ( = ?auto_443032 ?auto_443036 ) ) ( not ( = ?auto_443032 ?auto_443037 ) ) ( not ( = ?auto_443032 ?auto_443038 ) ) ( not ( = ?auto_443032 ?auto_443039 ) ) ( not ( = ?auto_443032 ?auto_443040 ) ) ( not ( = ?auto_443032 ?auto_443041 ) ) ( not ( = ?auto_443032 ?auto_443042 ) ) ( not ( = ?auto_443033 ?auto_443034 ) ) ( not ( = ?auto_443033 ?auto_443035 ) ) ( not ( = ?auto_443033 ?auto_443036 ) ) ( not ( = ?auto_443033 ?auto_443037 ) ) ( not ( = ?auto_443033 ?auto_443038 ) ) ( not ( = ?auto_443033 ?auto_443039 ) ) ( not ( = ?auto_443033 ?auto_443040 ) ) ( not ( = ?auto_443033 ?auto_443041 ) ) ( not ( = ?auto_443033 ?auto_443042 ) ) ( not ( = ?auto_443034 ?auto_443035 ) ) ( not ( = ?auto_443034 ?auto_443036 ) ) ( not ( = ?auto_443034 ?auto_443037 ) ) ( not ( = ?auto_443034 ?auto_443038 ) ) ( not ( = ?auto_443034 ?auto_443039 ) ) ( not ( = ?auto_443034 ?auto_443040 ) ) ( not ( = ?auto_443034 ?auto_443041 ) ) ( not ( = ?auto_443034 ?auto_443042 ) ) ( not ( = ?auto_443035 ?auto_443036 ) ) ( not ( = ?auto_443035 ?auto_443037 ) ) ( not ( = ?auto_443035 ?auto_443038 ) ) ( not ( = ?auto_443035 ?auto_443039 ) ) ( not ( = ?auto_443035 ?auto_443040 ) ) ( not ( = ?auto_443035 ?auto_443041 ) ) ( not ( = ?auto_443035 ?auto_443042 ) ) ( not ( = ?auto_443036 ?auto_443037 ) ) ( not ( = ?auto_443036 ?auto_443038 ) ) ( not ( = ?auto_443036 ?auto_443039 ) ) ( not ( = ?auto_443036 ?auto_443040 ) ) ( not ( = ?auto_443036 ?auto_443041 ) ) ( not ( = ?auto_443036 ?auto_443042 ) ) ( not ( = ?auto_443037 ?auto_443038 ) ) ( not ( = ?auto_443037 ?auto_443039 ) ) ( not ( = ?auto_443037 ?auto_443040 ) ) ( not ( = ?auto_443037 ?auto_443041 ) ) ( not ( = ?auto_443037 ?auto_443042 ) ) ( not ( = ?auto_443038 ?auto_443039 ) ) ( not ( = ?auto_443038 ?auto_443040 ) ) ( not ( = ?auto_443038 ?auto_443041 ) ) ( not ( = ?auto_443038 ?auto_443042 ) ) ( not ( = ?auto_443039 ?auto_443040 ) ) ( not ( = ?auto_443039 ?auto_443041 ) ) ( not ( = ?auto_443039 ?auto_443042 ) ) ( not ( = ?auto_443040 ?auto_443041 ) ) ( not ( = ?auto_443040 ?auto_443042 ) ) ( not ( = ?auto_443041 ?auto_443042 ) ) ( ON ?auto_443040 ?auto_443041 ) ( ON ?auto_443039 ?auto_443040 ) ( ON ?auto_443038 ?auto_443039 ) ( ON ?auto_443037 ?auto_443038 ) ( ON ?auto_443036 ?auto_443037 ) ( ON ?auto_443035 ?auto_443036 ) ( ON ?auto_443034 ?auto_443035 ) ( ON ?auto_443033 ?auto_443034 ) ( ON ?auto_443032 ?auto_443033 ) ( ON ?auto_443031 ?auto_443032 ) ( ON ?auto_443030 ?auto_443031 ) ( CLEAR ?auto_443028 ) ( ON ?auto_443029 ?auto_443030 ) ( CLEAR ?auto_443029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_443028 ?auto_443029 )
      ( MAKE-14PILE ?auto_443028 ?auto_443029 ?auto_443030 ?auto_443031 ?auto_443032 ?auto_443033 ?auto_443034 ?auto_443035 ?auto_443036 ?auto_443037 ?auto_443038 ?auto_443039 ?auto_443040 ?auto_443041 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_443086 - BLOCK
      ?auto_443087 - BLOCK
      ?auto_443088 - BLOCK
      ?auto_443089 - BLOCK
      ?auto_443090 - BLOCK
      ?auto_443091 - BLOCK
      ?auto_443092 - BLOCK
      ?auto_443093 - BLOCK
      ?auto_443094 - BLOCK
      ?auto_443095 - BLOCK
      ?auto_443096 - BLOCK
      ?auto_443097 - BLOCK
      ?auto_443098 - BLOCK
      ?auto_443099 - BLOCK
    )
    :vars
    (
      ?auto_443100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443099 ?auto_443100 ) ( not ( = ?auto_443086 ?auto_443087 ) ) ( not ( = ?auto_443086 ?auto_443088 ) ) ( not ( = ?auto_443086 ?auto_443089 ) ) ( not ( = ?auto_443086 ?auto_443090 ) ) ( not ( = ?auto_443086 ?auto_443091 ) ) ( not ( = ?auto_443086 ?auto_443092 ) ) ( not ( = ?auto_443086 ?auto_443093 ) ) ( not ( = ?auto_443086 ?auto_443094 ) ) ( not ( = ?auto_443086 ?auto_443095 ) ) ( not ( = ?auto_443086 ?auto_443096 ) ) ( not ( = ?auto_443086 ?auto_443097 ) ) ( not ( = ?auto_443086 ?auto_443098 ) ) ( not ( = ?auto_443086 ?auto_443099 ) ) ( not ( = ?auto_443086 ?auto_443100 ) ) ( not ( = ?auto_443087 ?auto_443088 ) ) ( not ( = ?auto_443087 ?auto_443089 ) ) ( not ( = ?auto_443087 ?auto_443090 ) ) ( not ( = ?auto_443087 ?auto_443091 ) ) ( not ( = ?auto_443087 ?auto_443092 ) ) ( not ( = ?auto_443087 ?auto_443093 ) ) ( not ( = ?auto_443087 ?auto_443094 ) ) ( not ( = ?auto_443087 ?auto_443095 ) ) ( not ( = ?auto_443087 ?auto_443096 ) ) ( not ( = ?auto_443087 ?auto_443097 ) ) ( not ( = ?auto_443087 ?auto_443098 ) ) ( not ( = ?auto_443087 ?auto_443099 ) ) ( not ( = ?auto_443087 ?auto_443100 ) ) ( not ( = ?auto_443088 ?auto_443089 ) ) ( not ( = ?auto_443088 ?auto_443090 ) ) ( not ( = ?auto_443088 ?auto_443091 ) ) ( not ( = ?auto_443088 ?auto_443092 ) ) ( not ( = ?auto_443088 ?auto_443093 ) ) ( not ( = ?auto_443088 ?auto_443094 ) ) ( not ( = ?auto_443088 ?auto_443095 ) ) ( not ( = ?auto_443088 ?auto_443096 ) ) ( not ( = ?auto_443088 ?auto_443097 ) ) ( not ( = ?auto_443088 ?auto_443098 ) ) ( not ( = ?auto_443088 ?auto_443099 ) ) ( not ( = ?auto_443088 ?auto_443100 ) ) ( not ( = ?auto_443089 ?auto_443090 ) ) ( not ( = ?auto_443089 ?auto_443091 ) ) ( not ( = ?auto_443089 ?auto_443092 ) ) ( not ( = ?auto_443089 ?auto_443093 ) ) ( not ( = ?auto_443089 ?auto_443094 ) ) ( not ( = ?auto_443089 ?auto_443095 ) ) ( not ( = ?auto_443089 ?auto_443096 ) ) ( not ( = ?auto_443089 ?auto_443097 ) ) ( not ( = ?auto_443089 ?auto_443098 ) ) ( not ( = ?auto_443089 ?auto_443099 ) ) ( not ( = ?auto_443089 ?auto_443100 ) ) ( not ( = ?auto_443090 ?auto_443091 ) ) ( not ( = ?auto_443090 ?auto_443092 ) ) ( not ( = ?auto_443090 ?auto_443093 ) ) ( not ( = ?auto_443090 ?auto_443094 ) ) ( not ( = ?auto_443090 ?auto_443095 ) ) ( not ( = ?auto_443090 ?auto_443096 ) ) ( not ( = ?auto_443090 ?auto_443097 ) ) ( not ( = ?auto_443090 ?auto_443098 ) ) ( not ( = ?auto_443090 ?auto_443099 ) ) ( not ( = ?auto_443090 ?auto_443100 ) ) ( not ( = ?auto_443091 ?auto_443092 ) ) ( not ( = ?auto_443091 ?auto_443093 ) ) ( not ( = ?auto_443091 ?auto_443094 ) ) ( not ( = ?auto_443091 ?auto_443095 ) ) ( not ( = ?auto_443091 ?auto_443096 ) ) ( not ( = ?auto_443091 ?auto_443097 ) ) ( not ( = ?auto_443091 ?auto_443098 ) ) ( not ( = ?auto_443091 ?auto_443099 ) ) ( not ( = ?auto_443091 ?auto_443100 ) ) ( not ( = ?auto_443092 ?auto_443093 ) ) ( not ( = ?auto_443092 ?auto_443094 ) ) ( not ( = ?auto_443092 ?auto_443095 ) ) ( not ( = ?auto_443092 ?auto_443096 ) ) ( not ( = ?auto_443092 ?auto_443097 ) ) ( not ( = ?auto_443092 ?auto_443098 ) ) ( not ( = ?auto_443092 ?auto_443099 ) ) ( not ( = ?auto_443092 ?auto_443100 ) ) ( not ( = ?auto_443093 ?auto_443094 ) ) ( not ( = ?auto_443093 ?auto_443095 ) ) ( not ( = ?auto_443093 ?auto_443096 ) ) ( not ( = ?auto_443093 ?auto_443097 ) ) ( not ( = ?auto_443093 ?auto_443098 ) ) ( not ( = ?auto_443093 ?auto_443099 ) ) ( not ( = ?auto_443093 ?auto_443100 ) ) ( not ( = ?auto_443094 ?auto_443095 ) ) ( not ( = ?auto_443094 ?auto_443096 ) ) ( not ( = ?auto_443094 ?auto_443097 ) ) ( not ( = ?auto_443094 ?auto_443098 ) ) ( not ( = ?auto_443094 ?auto_443099 ) ) ( not ( = ?auto_443094 ?auto_443100 ) ) ( not ( = ?auto_443095 ?auto_443096 ) ) ( not ( = ?auto_443095 ?auto_443097 ) ) ( not ( = ?auto_443095 ?auto_443098 ) ) ( not ( = ?auto_443095 ?auto_443099 ) ) ( not ( = ?auto_443095 ?auto_443100 ) ) ( not ( = ?auto_443096 ?auto_443097 ) ) ( not ( = ?auto_443096 ?auto_443098 ) ) ( not ( = ?auto_443096 ?auto_443099 ) ) ( not ( = ?auto_443096 ?auto_443100 ) ) ( not ( = ?auto_443097 ?auto_443098 ) ) ( not ( = ?auto_443097 ?auto_443099 ) ) ( not ( = ?auto_443097 ?auto_443100 ) ) ( not ( = ?auto_443098 ?auto_443099 ) ) ( not ( = ?auto_443098 ?auto_443100 ) ) ( not ( = ?auto_443099 ?auto_443100 ) ) ( ON ?auto_443098 ?auto_443099 ) ( ON ?auto_443097 ?auto_443098 ) ( ON ?auto_443096 ?auto_443097 ) ( ON ?auto_443095 ?auto_443096 ) ( ON ?auto_443094 ?auto_443095 ) ( ON ?auto_443093 ?auto_443094 ) ( ON ?auto_443092 ?auto_443093 ) ( ON ?auto_443091 ?auto_443092 ) ( ON ?auto_443090 ?auto_443091 ) ( ON ?auto_443089 ?auto_443090 ) ( ON ?auto_443088 ?auto_443089 ) ( ON ?auto_443087 ?auto_443088 ) ( ON ?auto_443086 ?auto_443087 ) ( CLEAR ?auto_443086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_443086 )
      ( MAKE-14PILE ?auto_443086 ?auto_443087 ?auto_443088 ?auto_443089 ?auto_443090 ?auto_443091 ?auto_443092 ?auto_443093 ?auto_443094 ?auto_443095 ?auto_443096 ?auto_443097 ?auto_443098 ?auto_443099 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443145 - BLOCK
      ?auto_443146 - BLOCK
      ?auto_443147 - BLOCK
      ?auto_443148 - BLOCK
      ?auto_443149 - BLOCK
      ?auto_443150 - BLOCK
      ?auto_443151 - BLOCK
      ?auto_443152 - BLOCK
      ?auto_443153 - BLOCK
      ?auto_443154 - BLOCK
      ?auto_443155 - BLOCK
      ?auto_443156 - BLOCK
      ?auto_443157 - BLOCK
      ?auto_443158 - BLOCK
      ?auto_443159 - BLOCK
    )
    :vars
    (
      ?auto_443160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_443158 ) ( ON ?auto_443159 ?auto_443160 ) ( CLEAR ?auto_443159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_443145 ) ( ON ?auto_443146 ?auto_443145 ) ( ON ?auto_443147 ?auto_443146 ) ( ON ?auto_443148 ?auto_443147 ) ( ON ?auto_443149 ?auto_443148 ) ( ON ?auto_443150 ?auto_443149 ) ( ON ?auto_443151 ?auto_443150 ) ( ON ?auto_443152 ?auto_443151 ) ( ON ?auto_443153 ?auto_443152 ) ( ON ?auto_443154 ?auto_443153 ) ( ON ?auto_443155 ?auto_443154 ) ( ON ?auto_443156 ?auto_443155 ) ( ON ?auto_443157 ?auto_443156 ) ( ON ?auto_443158 ?auto_443157 ) ( not ( = ?auto_443145 ?auto_443146 ) ) ( not ( = ?auto_443145 ?auto_443147 ) ) ( not ( = ?auto_443145 ?auto_443148 ) ) ( not ( = ?auto_443145 ?auto_443149 ) ) ( not ( = ?auto_443145 ?auto_443150 ) ) ( not ( = ?auto_443145 ?auto_443151 ) ) ( not ( = ?auto_443145 ?auto_443152 ) ) ( not ( = ?auto_443145 ?auto_443153 ) ) ( not ( = ?auto_443145 ?auto_443154 ) ) ( not ( = ?auto_443145 ?auto_443155 ) ) ( not ( = ?auto_443145 ?auto_443156 ) ) ( not ( = ?auto_443145 ?auto_443157 ) ) ( not ( = ?auto_443145 ?auto_443158 ) ) ( not ( = ?auto_443145 ?auto_443159 ) ) ( not ( = ?auto_443145 ?auto_443160 ) ) ( not ( = ?auto_443146 ?auto_443147 ) ) ( not ( = ?auto_443146 ?auto_443148 ) ) ( not ( = ?auto_443146 ?auto_443149 ) ) ( not ( = ?auto_443146 ?auto_443150 ) ) ( not ( = ?auto_443146 ?auto_443151 ) ) ( not ( = ?auto_443146 ?auto_443152 ) ) ( not ( = ?auto_443146 ?auto_443153 ) ) ( not ( = ?auto_443146 ?auto_443154 ) ) ( not ( = ?auto_443146 ?auto_443155 ) ) ( not ( = ?auto_443146 ?auto_443156 ) ) ( not ( = ?auto_443146 ?auto_443157 ) ) ( not ( = ?auto_443146 ?auto_443158 ) ) ( not ( = ?auto_443146 ?auto_443159 ) ) ( not ( = ?auto_443146 ?auto_443160 ) ) ( not ( = ?auto_443147 ?auto_443148 ) ) ( not ( = ?auto_443147 ?auto_443149 ) ) ( not ( = ?auto_443147 ?auto_443150 ) ) ( not ( = ?auto_443147 ?auto_443151 ) ) ( not ( = ?auto_443147 ?auto_443152 ) ) ( not ( = ?auto_443147 ?auto_443153 ) ) ( not ( = ?auto_443147 ?auto_443154 ) ) ( not ( = ?auto_443147 ?auto_443155 ) ) ( not ( = ?auto_443147 ?auto_443156 ) ) ( not ( = ?auto_443147 ?auto_443157 ) ) ( not ( = ?auto_443147 ?auto_443158 ) ) ( not ( = ?auto_443147 ?auto_443159 ) ) ( not ( = ?auto_443147 ?auto_443160 ) ) ( not ( = ?auto_443148 ?auto_443149 ) ) ( not ( = ?auto_443148 ?auto_443150 ) ) ( not ( = ?auto_443148 ?auto_443151 ) ) ( not ( = ?auto_443148 ?auto_443152 ) ) ( not ( = ?auto_443148 ?auto_443153 ) ) ( not ( = ?auto_443148 ?auto_443154 ) ) ( not ( = ?auto_443148 ?auto_443155 ) ) ( not ( = ?auto_443148 ?auto_443156 ) ) ( not ( = ?auto_443148 ?auto_443157 ) ) ( not ( = ?auto_443148 ?auto_443158 ) ) ( not ( = ?auto_443148 ?auto_443159 ) ) ( not ( = ?auto_443148 ?auto_443160 ) ) ( not ( = ?auto_443149 ?auto_443150 ) ) ( not ( = ?auto_443149 ?auto_443151 ) ) ( not ( = ?auto_443149 ?auto_443152 ) ) ( not ( = ?auto_443149 ?auto_443153 ) ) ( not ( = ?auto_443149 ?auto_443154 ) ) ( not ( = ?auto_443149 ?auto_443155 ) ) ( not ( = ?auto_443149 ?auto_443156 ) ) ( not ( = ?auto_443149 ?auto_443157 ) ) ( not ( = ?auto_443149 ?auto_443158 ) ) ( not ( = ?auto_443149 ?auto_443159 ) ) ( not ( = ?auto_443149 ?auto_443160 ) ) ( not ( = ?auto_443150 ?auto_443151 ) ) ( not ( = ?auto_443150 ?auto_443152 ) ) ( not ( = ?auto_443150 ?auto_443153 ) ) ( not ( = ?auto_443150 ?auto_443154 ) ) ( not ( = ?auto_443150 ?auto_443155 ) ) ( not ( = ?auto_443150 ?auto_443156 ) ) ( not ( = ?auto_443150 ?auto_443157 ) ) ( not ( = ?auto_443150 ?auto_443158 ) ) ( not ( = ?auto_443150 ?auto_443159 ) ) ( not ( = ?auto_443150 ?auto_443160 ) ) ( not ( = ?auto_443151 ?auto_443152 ) ) ( not ( = ?auto_443151 ?auto_443153 ) ) ( not ( = ?auto_443151 ?auto_443154 ) ) ( not ( = ?auto_443151 ?auto_443155 ) ) ( not ( = ?auto_443151 ?auto_443156 ) ) ( not ( = ?auto_443151 ?auto_443157 ) ) ( not ( = ?auto_443151 ?auto_443158 ) ) ( not ( = ?auto_443151 ?auto_443159 ) ) ( not ( = ?auto_443151 ?auto_443160 ) ) ( not ( = ?auto_443152 ?auto_443153 ) ) ( not ( = ?auto_443152 ?auto_443154 ) ) ( not ( = ?auto_443152 ?auto_443155 ) ) ( not ( = ?auto_443152 ?auto_443156 ) ) ( not ( = ?auto_443152 ?auto_443157 ) ) ( not ( = ?auto_443152 ?auto_443158 ) ) ( not ( = ?auto_443152 ?auto_443159 ) ) ( not ( = ?auto_443152 ?auto_443160 ) ) ( not ( = ?auto_443153 ?auto_443154 ) ) ( not ( = ?auto_443153 ?auto_443155 ) ) ( not ( = ?auto_443153 ?auto_443156 ) ) ( not ( = ?auto_443153 ?auto_443157 ) ) ( not ( = ?auto_443153 ?auto_443158 ) ) ( not ( = ?auto_443153 ?auto_443159 ) ) ( not ( = ?auto_443153 ?auto_443160 ) ) ( not ( = ?auto_443154 ?auto_443155 ) ) ( not ( = ?auto_443154 ?auto_443156 ) ) ( not ( = ?auto_443154 ?auto_443157 ) ) ( not ( = ?auto_443154 ?auto_443158 ) ) ( not ( = ?auto_443154 ?auto_443159 ) ) ( not ( = ?auto_443154 ?auto_443160 ) ) ( not ( = ?auto_443155 ?auto_443156 ) ) ( not ( = ?auto_443155 ?auto_443157 ) ) ( not ( = ?auto_443155 ?auto_443158 ) ) ( not ( = ?auto_443155 ?auto_443159 ) ) ( not ( = ?auto_443155 ?auto_443160 ) ) ( not ( = ?auto_443156 ?auto_443157 ) ) ( not ( = ?auto_443156 ?auto_443158 ) ) ( not ( = ?auto_443156 ?auto_443159 ) ) ( not ( = ?auto_443156 ?auto_443160 ) ) ( not ( = ?auto_443157 ?auto_443158 ) ) ( not ( = ?auto_443157 ?auto_443159 ) ) ( not ( = ?auto_443157 ?auto_443160 ) ) ( not ( = ?auto_443158 ?auto_443159 ) ) ( not ( = ?auto_443158 ?auto_443160 ) ) ( not ( = ?auto_443159 ?auto_443160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_443159 ?auto_443160 )
      ( !STACK ?auto_443159 ?auto_443158 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443176 - BLOCK
      ?auto_443177 - BLOCK
      ?auto_443178 - BLOCK
      ?auto_443179 - BLOCK
      ?auto_443180 - BLOCK
      ?auto_443181 - BLOCK
      ?auto_443182 - BLOCK
      ?auto_443183 - BLOCK
      ?auto_443184 - BLOCK
      ?auto_443185 - BLOCK
      ?auto_443186 - BLOCK
      ?auto_443187 - BLOCK
      ?auto_443188 - BLOCK
      ?auto_443189 - BLOCK
      ?auto_443190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_443189 ) ( ON-TABLE ?auto_443190 ) ( CLEAR ?auto_443190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_443176 ) ( ON ?auto_443177 ?auto_443176 ) ( ON ?auto_443178 ?auto_443177 ) ( ON ?auto_443179 ?auto_443178 ) ( ON ?auto_443180 ?auto_443179 ) ( ON ?auto_443181 ?auto_443180 ) ( ON ?auto_443182 ?auto_443181 ) ( ON ?auto_443183 ?auto_443182 ) ( ON ?auto_443184 ?auto_443183 ) ( ON ?auto_443185 ?auto_443184 ) ( ON ?auto_443186 ?auto_443185 ) ( ON ?auto_443187 ?auto_443186 ) ( ON ?auto_443188 ?auto_443187 ) ( ON ?auto_443189 ?auto_443188 ) ( not ( = ?auto_443176 ?auto_443177 ) ) ( not ( = ?auto_443176 ?auto_443178 ) ) ( not ( = ?auto_443176 ?auto_443179 ) ) ( not ( = ?auto_443176 ?auto_443180 ) ) ( not ( = ?auto_443176 ?auto_443181 ) ) ( not ( = ?auto_443176 ?auto_443182 ) ) ( not ( = ?auto_443176 ?auto_443183 ) ) ( not ( = ?auto_443176 ?auto_443184 ) ) ( not ( = ?auto_443176 ?auto_443185 ) ) ( not ( = ?auto_443176 ?auto_443186 ) ) ( not ( = ?auto_443176 ?auto_443187 ) ) ( not ( = ?auto_443176 ?auto_443188 ) ) ( not ( = ?auto_443176 ?auto_443189 ) ) ( not ( = ?auto_443176 ?auto_443190 ) ) ( not ( = ?auto_443177 ?auto_443178 ) ) ( not ( = ?auto_443177 ?auto_443179 ) ) ( not ( = ?auto_443177 ?auto_443180 ) ) ( not ( = ?auto_443177 ?auto_443181 ) ) ( not ( = ?auto_443177 ?auto_443182 ) ) ( not ( = ?auto_443177 ?auto_443183 ) ) ( not ( = ?auto_443177 ?auto_443184 ) ) ( not ( = ?auto_443177 ?auto_443185 ) ) ( not ( = ?auto_443177 ?auto_443186 ) ) ( not ( = ?auto_443177 ?auto_443187 ) ) ( not ( = ?auto_443177 ?auto_443188 ) ) ( not ( = ?auto_443177 ?auto_443189 ) ) ( not ( = ?auto_443177 ?auto_443190 ) ) ( not ( = ?auto_443178 ?auto_443179 ) ) ( not ( = ?auto_443178 ?auto_443180 ) ) ( not ( = ?auto_443178 ?auto_443181 ) ) ( not ( = ?auto_443178 ?auto_443182 ) ) ( not ( = ?auto_443178 ?auto_443183 ) ) ( not ( = ?auto_443178 ?auto_443184 ) ) ( not ( = ?auto_443178 ?auto_443185 ) ) ( not ( = ?auto_443178 ?auto_443186 ) ) ( not ( = ?auto_443178 ?auto_443187 ) ) ( not ( = ?auto_443178 ?auto_443188 ) ) ( not ( = ?auto_443178 ?auto_443189 ) ) ( not ( = ?auto_443178 ?auto_443190 ) ) ( not ( = ?auto_443179 ?auto_443180 ) ) ( not ( = ?auto_443179 ?auto_443181 ) ) ( not ( = ?auto_443179 ?auto_443182 ) ) ( not ( = ?auto_443179 ?auto_443183 ) ) ( not ( = ?auto_443179 ?auto_443184 ) ) ( not ( = ?auto_443179 ?auto_443185 ) ) ( not ( = ?auto_443179 ?auto_443186 ) ) ( not ( = ?auto_443179 ?auto_443187 ) ) ( not ( = ?auto_443179 ?auto_443188 ) ) ( not ( = ?auto_443179 ?auto_443189 ) ) ( not ( = ?auto_443179 ?auto_443190 ) ) ( not ( = ?auto_443180 ?auto_443181 ) ) ( not ( = ?auto_443180 ?auto_443182 ) ) ( not ( = ?auto_443180 ?auto_443183 ) ) ( not ( = ?auto_443180 ?auto_443184 ) ) ( not ( = ?auto_443180 ?auto_443185 ) ) ( not ( = ?auto_443180 ?auto_443186 ) ) ( not ( = ?auto_443180 ?auto_443187 ) ) ( not ( = ?auto_443180 ?auto_443188 ) ) ( not ( = ?auto_443180 ?auto_443189 ) ) ( not ( = ?auto_443180 ?auto_443190 ) ) ( not ( = ?auto_443181 ?auto_443182 ) ) ( not ( = ?auto_443181 ?auto_443183 ) ) ( not ( = ?auto_443181 ?auto_443184 ) ) ( not ( = ?auto_443181 ?auto_443185 ) ) ( not ( = ?auto_443181 ?auto_443186 ) ) ( not ( = ?auto_443181 ?auto_443187 ) ) ( not ( = ?auto_443181 ?auto_443188 ) ) ( not ( = ?auto_443181 ?auto_443189 ) ) ( not ( = ?auto_443181 ?auto_443190 ) ) ( not ( = ?auto_443182 ?auto_443183 ) ) ( not ( = ?auto_443182 ?auto_443184 ) ) ( not ( = ?auto_443182 ?auto_443185 ) ) ( not ( = ?auto_443182 ?auto_443186 ) ) ( not ( = ?auto_443182 ?auto_443187 ) ) ( not ( = ?auto_443182 ?auto_443188 ) ) ( not ( = ?auto_443182 ?auto_443189 ) ) ( not ( = ?auto_443182 ?auto_443190 ) ) ( not ( = ?auto_443183 ?auto_443184 ) ) ( not ( = ?auto_443183 ?auto_443185 ) ) ( not ( = ?auto_443183 ?auto_443186 ) ) ( not ( = ?auto_443183 ?auto_443187 ) ) ( not ( = ?auto_443183 ?auto_443188 ) ) ( not ( = ?auto_443183 ?auto_443189 ) ) ( not ( = ?auto_443183 ?auto_443190 ) ) ( not ( = ?auto_443184 ?auto_443185 ) ) ( not ( = ?auto_443184 ?auto_443186 ) ) ( not ( = ?auto_443184 ?auto_443187 ) ) ( not ( = ?auto_443184 ?auto_443188 ) ) ( not ( = ?auto_443184 ?auto_443189 ) ) ( not ( = ?auto_443184 ?auto_443190 ) ) ( not ( = ?auto_443185 ?auto_443186 ) ) ( not ( = ?auto_443185 ?auto_443187 ) ) ( not ( = ?auto_443185 ?auto_443188 ) ) ( not ( = ?auto_443185 ?auto_443189 ) ) ( not ( = ?auto_443185 ?auto_443190 ) ) ( not ( = ?auto_443186 ?auto_443187 ) ) ( not ( = ?auto_443186 ?auto_443188 ) ) ( not ( = ?auto_443186 ?auto_443189 ) ) ( not ( = ?auto_443186 ?auto_443190 ) ) ( not ( = ?auto_443187 ?auto_443188 ) ) ( not ( = ?auto_443187 ?auto_443189 ) ) ( not ( = ?auto_443187 ?auto_443190 ) ) ( not ( = ?auto_443188 ?auto_443189 ) ) ( not ( = ?auto_443188 ?auto_443190 ) ) ( not ( = ?auto_443189 ?auto_443190 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_443190 )
      ( !STACK ?auto_443190 ?auto_443189 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443206 - BLOCK
      ?auto_443207 - BLOCK
      ?auto_443208 - BLOCK
      ?auto_443209 - BLOCK
      ?auto_443210 - BLOCK
      ?auto_443211 - BLOCK
      ?auto_443212 - BLOCK
      ?auto_443213 - BLOCK
      ?auto_443214 - BLOCK
      ?auto_443215 - BLOCK
      ?auto_443216 - BLOCK
      ?auto_443217 - BLOCK
      ?auto_443218 - BLOCK
      ?auto_443219 - BLOCK
      ?auto_443220 - BLOCK
    )
    :vars
    (
      ?auto_443221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443220 ?auto_443221 ) ( ON-TABLE ?auto_443206 ) ( ON ?auto_443207 ?auto_443206 ) ( ON ?auto_443208 ?auto_443207 ) ( ON ?auto_443209 ?auto_443208 ) ( ON ?auto_443210 ?auto_443209 ) ( ON ?auto_443211 ?auto_443210 ) ( ON ?auto_443212 ?auto_443211 ) ( ON ?auto_443213 ?auto_443212 ) ( ON ?auto_443214 ?auto_443213 ) ( ON ?auto_443215 ?auto_443214 ) ( ON ?auto_443216 ?auto_443215 ) ( ON ?auto_443217 ?auto_443216 ) ( ON ?auto_443218 ?auto_443217 ) ( not ( = ?auto_443206 ?auto_443207 ) ) ( not ( = ?auto_443206 ?auto_443208 ) ) ( not ( = ?auto_443206 ?auto_443209 ) ) ( not ( = ?auto_443206 ?auto_443210 ) ) ( not ( = ?auto_443206 ?auto_443211 ) ) ( not ( = ?auto_443206 ?auto_443212 ) ) ( not ( = ?auto_443206 ?auto_443213 ) ) ( not ( = ?auto_443206 ?auto_443214 ) ) ( not ( = ?auto_443206 ?auto_443215 ) ) ( not ( = ?auto_443206 ?auto_443216 ) ) ( not ( = ?auto_443206 ?auto_443217 ) ) ( not ( = ?auto_443206 ?auto_443218 ) ) ( not ( = ?auto_443206 ?auto_443219 ) ) ( not ( = ?auto_443206 ?auto_443220 ) ) ( not ( = ?auto_443206 ?auto_443221 ) ) ( not ( = ?auto_443207 ?auto_443208 ) ) ( not ( = ?auto_443207 ?auto_443209 ) ) ( not ( = ?auto_443207 ?auto_443210 ) ) ( not ( = ?auto_443207 ?auto_443211 ) ) ( not ( = ?auto_443207 ?auto_443212 ) ) ( not ( = ?auto_443207 ?auto_443213 ) ) ( not ( = ?auto_443207 ?auto_443214 ) ) ( not ( = ?auto_443207 ?auto_443215 ) ) ( not ( = ?auto_443207 ?auto_443216 ) ) ( not ( = ?auto_443207 ?auto_443217 ) ) ( not ( = ?auto_443207 ?auto_443218 ) ) ( not ( = ?auto_443207 ?auto_443219 ) ) ( not ( = ?auto_443207 ?auto_443220 ) ) ( not ( = ?auto_443207 ?auto_443221 ) ) ( not ( = ?auto_443208 ?auto_443209 ) ) ( not ( = ?auto_443208 ?auto_443210 ) ) ( not ( = ?auto_443208 ?auto_443211 ) ) ( not ( = ?auto_443208 ?auto_443212 ) ) ( not ( = ?auto_443208 ?auto_443213 ) ) ( not ( = ?auto_443208 ?auto_443214 ) ) ( not ( = ?auto_443208 ?auto_443215 ) ) ( not ( = ?auto_443208 ?auto_443216 ) ) ( not ( = ?auto_443208 ?auto_443217 ) ) ( not ( = ?auto_443208 ?auto_443218 ) ) ( not ( = ?auto_443208 ?auto_443219 ) ) ( not ( = ?auto_443208 ?auto_443220 ) ) ( not ( = ?auto_443208 ?auto_443221 ) ) ( not ( = ?auto_443209 ?auto_443210 ) ) ( not ( = ?auto_443209 ?auto_443211 ) ) ( not ( = ?auto_443209 ?auto_443212 ) ) ( not ( = ?auto_443209 ?auto_443213 ) ) ( not ( = ?auto_443209 ?auto_443214 ) ) ( not ( = ?auto_443209 ?auto_443215 ) ) ( not ( = ?auto_443209 ?auto_443216 ) ) ( not ( = ?auto_443209 ?auto_443217 ) ) ( not ( = ?auto_443209 ?auto_443218 ) ) ( not ( = ?auto_443209 ?auto_443219 ) ) ( not ( = ?auto_443209 ?auto_443220 ) ) ( not ( = ?auto_443209 ?auto_443221 ) ) ( not ( = ?auto_443210 ?auto_443211 ) ) ( not ( = ?auto_443210 ?auto_443212 ) ) ( not ( = ?auto_443210 ?auto_443213 ) ) ( not ( = ?auto_443210 ?auto_443214 ) ) ( not ( = ?auto_443210 ?auto_443215 ) ) ( not ( = ?auto_443210 ?auto_443216 ) ) ( not ( = ?auto_443210 ?auto_443217 ) ) ( not ( = ?auto_443210 ?auto_443218 ) ) ( not ( = ?auto_443210 ?auto_443219 ) ) ( not ( = ?auto_443210 ?auto_443220 ) ) ( not ( = ?auto_443210 ?auto_443221 ) ) ( not ( = ?auto_443211 ?auto_443212 ) ) ( not ( = ?auto_443211 ?auto_443213 ) ) ( not ( = ?auto_443211 ?auto_443214 ) ) ( not ( = ?auto_443211 ?auto_443215 ) ) ( not ( = ?auto_443211 ?auto_443216 ) ) ( not ( = ?auto_443211 ?auto_443217 ) ) ( not ( = ?auto_443211 ?auto_443218 ) ) ( not ( = ?auto_443211 ?auto_443219 ) ) ( not ( = ?auto_443211 ?auto_443220 ) ) ( not ( = ?auto_443211 ?auto_443221 ) ) ( not ( = ?auto_443212 ?auto_443213 ) ) ( not ( = ?auto_443212 ?auto_443214 ) ) ( not ( = ?auto_443212 ?auto_443215 ) ) ( not ( = ?auto_443212 ?auto_443216 ) ) ( not ( = ?auto_443212 ?auto_443217 ) ) ( not ( = ?auto_443212 ?auto_443218 ) ) ( not ( = ?auto_443212 ?auto_443219 ) ) ( not ( = ?auto_443212 ?auto_443220 ) ) ( not ( = ?auto_443212 ?auto_443221 ) ) ( not ( = ?auto_443213 ?auto_443214 ) ) ( not ( = ?auto_443213 ?auto_443215 ) ) ( not ( = ?auto_443213 ?auto_443216 ) ) ( not ( = ?auto_443213 ?auto_443217 ) ) ( not ( = ?auto_443213 ?auto_443218 ) ) ( not ( = ?auto_443213 ?auto_443219 ) ) ( not ( = ?auto_443213 ?auto_443220 ) ) ( not ( = ?auto_443213 ?auto_443221 ) ) ( not ( = ?auto_443214 ?auto_443215 ) ) ( not ( = ?auto_443214 ?auto_443216 ) ) ( not ( = ?auto_443214 ?auto_443217 ) ) ( not ( = ?auto_443214 ?auto_443218 ) ) ( not ( = ?auto_443214 ?auto_443219 ) ) ( not ( = ?auto_443214 ?auto_443220 ) ) ( not ( = ?auto_443214 ?auto_443221 ) ) ( not ( = ?auto_443215 ?auto_443216 ) ) ( not ( = ?auto_443215 ?auto_443217 ) ) ( not ( = ?auto_443215 ?auto_443218 ) ) ( not ( = ?auto_443215 ?auto_443219 ) ) ( not ( = ?auto_443215 ?auto_443220 ) ) ( not ( = ?auto_443215 ?auto_443221 ) ) ( not ( = ?auto_443216 ?auto_443217 ) ) ( not ( = ?auto_443216 ?auto_443218 ) ) ( not ( = ?auto_443216 ?auto_443219 ) ) ( not ( = ?auto_443216 ?auto_443220 ) ) ( not ( = ?auto_443216 ?auto_443221 ) ) ( not ( = ?auto_443217 ?auto_443218 ) ) ( not ( = ?auto_443217 ?auto_443219 ) ) ( not ( = ?auto_443217 ?auto_443220 ) ) ( not ( = ?auto_443217 ?auto_443221 ) ) ( not ( = ?auto_443218 ?auto_443219 ) ) ( not ( = ?auto_443218 ?auto_443220 ) ) ( not ( = ?auto_443218 ?auto_443221 ) ) ( not ( = ?auto_443219 ?auto_443220 ) ) ( not ( = ?auto_443219 ?auto_443221 ) ) ( not ( = ?auto_443220 ?auto_443221 ) ) ( CLEAR ?auto_443218 ) ( ON ?auto_443219 ?auto_443220 ) ( CLEAR ?auto_443219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_443206 ?auto_443207 ?auto_443208 ?auto_443209 ?auto_443210 ?auto_443211 ?auto_443212 ?auto_443213 ?auto_443214 ?auto_443215 ?auto_443216 ?auto_443217 ?auto_443218 ?auto_443219 )
      ( MAKE-15PILE ?auto_443206 ?auto_443207 ?auto_443208 ?auto_443209 ?auto_443210 ?auto_443211 ?auto_443212 ?auto_443213 ?auto_443214 ?auto_443215 ?auto_443216 ?auto_443217 ?auto_443218 ?auto_443219 ?auto_443220 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443237 - BLOCK
      ?auto_443238 - BLOCK
      ?auto_443239 - BLOCK
      ?auto_443240 - BLOCK
      ?auto_443241 - BLOCK
      ?auto_443242 - BLOCK
      ?auto_443243 - BLOCK
      ?auto_443244 - BLOCK
      ?auto_443245 - BLOCK
      ?auto_443246 - BLOCK
      ?auto_443247 - BLOCK
      ?auto_443248 - BLOCK
      ?auto_443249 - BLOCK
      ?auto_443250 - BLOCK
      ?auto_443251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443251 ) ( ON-TABLE ?auto_443237 ) ( ON ?auto_443238 ?auto_443237 ) ( ON ?auto_443239 ?auto_443238 ) ( ON ?auto_443240 ?auto_443239 ) ( ON ?auto_443241 ?auto_443240 ) ( ON ?auto_443242 ?auto_443241 ) ( ON ?auto_443243 ?auto_443242 ) ( ON ?auto_443244 ?auto_443243 ) ( ON ?auto_443245 ?auto_443244 ) ( ON ?auto_443246 ?auto_443245 ) ( ON ?auto_443247 ?auto_443246 ) ( ON ?auto_443248 ?auto_443247 ) ( ON ?auto_443249 ?auto_443248 ) ( not ( = ?auto_443237 ?auto_443238 ) ) ( not ( = ?auto_443237 ?auto_443239 ) ) ( not ( = ?auto_443237 ?auto_443240 ) ) ( not ( = ?auto_443237 ?auto_443241 ) ) ( not ( = ?auto_443237 ?auto_443242 ) ) ( not ( = ?auto_443237 ?auto_443243 ) ) ( not ( = ?auto_443237 ?auto_443244 ) ) ( not ( = ?auto_443237 ?auto_443245 ) ) ( not ( = ?auto_443237 ?auto_443246 ) ) ( not ( = ?auto_443237 ?auto_443247 ) ) ( not ( = ?auto_443237 ?auto_443248 ) ) ( not ( = ?auto_443237 ?auto_443249 ) ) ( not ( = ?auto_443237 ?auto_443250 ) ) ( not ( = ?auto_443237 ?auto_443251 ) ) ( not ( = ?auto_443238 ?auto_443239 ) ) ( not ( = ?auto_443238 ?auto_443240 ) ) ( not ( = ?auto_443238 ?auto_443241 ) ) ( not ( = ?auto_443238 ?auto_443242 ) ) ( not ( = ?auto_443238 ?auto_443243 ) ) ( not ( = ?auto_443238 ?auto_443244 ) ) ( not ( = ?auto_443238 ?auto_443245 ) ) ( not ( = ?auto_443238 ?auto_443246 ) ) ( not ( = ?auto_443238 ?auto_443247 ) ) ( not ( = ?auto_443238 ?auto_443248 ) ) ( not ( = ?auto_443238 ?auto_443249 ) ) ( not ( = ?auto_443238 ?auto_443250 ) ) ( not ( = ?auto_443238 ?auto_443251 ) ) ( not ( = ?auto_443239 ?auto_443240 ) ) ( not ( = ?auto_443239 ?auto_443241 ) ) ( not ( = ?auto_443239 ?auto_443242 ) ) ( not ( = ?auto_443239 ?auto_443243 ) ) ( not ( = ?auto_443239 ?auto_443244 ) ) ( not ( = ?auto_443239 ?auto_443245 ) ) ( not ( = ?auto_443239 ?auto_443246 ) ) ( not ( = ?auto_443239 ?auto_443247 ) ) ( not ( = ?auto_443239 ?auto_443248 ) ) ( not ( = ?auto_443239 ?auto_443249 ) ) ( not ( = ?auto_443239 ?auto_443250 ) ) ( not ( = ?auto_443239 ?auto_443251 ) ) ( not ( = ?auto_443240 ?auto_443241 ) ) ( not ( = ?auto_443240 ?auto_443242 ) ) ( not ( = ?auto_443240 ?auto_443243 ) ) ( not ( = ?auto_443240 ?auto_443244 ) ) ( not ( = ?auto_443240 ?auto_443245 ) ) ( not ( = ?auto_443240 ?auto_443246 ) ) ( not ( = ?auto_443240 ?auto_443247 ) ) ( not ( = ?auto_443240 ?auto_443248 ) ) ( not ( = ?auto_443240 ?auto_443249 ) ) ( not ( = ?auto_443240 ?auto_443250 ) ) ( not ( = ?auto_443240 ?auto_443251 ) ) ( not ( = ?auto_443241 ?auto_443242 ) ) ( not ( = ?auto_443241 ?auto_443243 ) ) ( not ( = ?auto_443241 ?auto_443244 ) ) ( not ( = ?auto_443241 ?auto_443245 ) ) ( not ( = ?auto_443241 ?auto_443246 ) ) ( not ( = ?auto_443241 ?auto_443247 ) ) ( not ( = ?auto_443241 ?auto_443248 ) ) ( not ( = ?auto_443241 ?auto_443249 ) ) ( not ( = ?auto_443241 ?auto_443250 ) ) ( not ( = ?auto_443241 ?auto_443251 ) ) ( not ( = ?auto_443242 ?auto_443243 ) ) ( not ( = ?auto_443242 ?auto_443244 ) ) ( not ( = ?auto_443242 ?auto_443245 ) ) ( not ( = ?auto_443242 ?auto_443246 ) ) ( not ( = ?auto_443242 ?auto_443247 ) ) ( not ( = ?auto_443242 ?auto_443248 ) ) ( not ( = ?auto_443242 ?auto_443249 ) ) ( not ( = ?auto_443242 ?auto_443250 ) ) ( not ( = ?auto_443242 ?auto_443251 ) ) ( not ( = ?auto_443243 ?auto_443244 ) ) ( not ( = ?auto_443243 ?auto_443245 ) ) ( not ( = ?auto_443243 ?auto_443246 ) ) ( not ( = ?auto_443243 ?auto_443247 ) ) ( not ( = ?auto_443243 ?auto_443248 ) ) ( not ( = ?auto_443243 ?auto_443249 ) ) ( not ( = ?auto_443243 ?auto_443250 ) ) ( not ( = ?auto_443243 ?auto_443251 ) ) ( not ( = ?auto_443244 ?auto_443245 ) ) ( not ( = ?auto_443244 ?auto_443246 ) ) ( not ( = ?auto_443244 ?auto_443247 ) ) ( not ( = ?auto_443244 ?auto_443248 ) ) ( not ( = ?auto_443244 ?auto_443249 ) ) ( not ( = ?auto_443244 ?auto_443250 ) ) ( not ( = ?auto_443244 ?auto_443251 ) ) ( not ( = ?auto_443245 ?auto_443246 ) ) ( not ( = ?auto_443245 ?auto_443247 ) ) ( not ( = ?auto_443245 ?auto_443248 ) ) ( not ( = ?auto_443245 ?auto_443249 ) ) ( not ( = ?auto_443245 ?auto_443250 ) ) ( not ( = ?auto_443245 ?auto_443251 ) ) ( not ( = ?auto_443246 ?auto_443247 ) ) ( not ( = ?auto_443246 ?auto_443248 ) ) ( not ( = ?auto_443246 ?auto_443249 ) ) ( not ( = ?auto_443246 ?auto_443250 ) ) ( not ( = ?auto_443246 ?auto_443251 ) ) ( not ( = ?auto_443247 ?auto_443248 ) ) ( not ( = ?auto_443247 ?auto_443249 ) ) ( not ( = ?auto_443247 ?auto_443250 ) ) ( not ( = ?auto_443247 ?auto_443251 ) ) ( not ( = ?auto_443248 ?auto_443249 ) ) ( not ( = ?auto_443248 ?auto_443250 ) ) ( not ( = ?auto_443248 ?auto_443251 ) ) ( not ( = ?auto_443249 ?auto_443250 ) ) ( not ( = ?auto_443249 ?auto_443251 ) ) ( not ( = ?auto_443250 ?auto_443251 ) ) ( CLEAR ?auto_443249 ) ( ON ?auto_443250 ?auto_443251 ) ( CLEAR ?auto_443250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_443237 ?auto_443238 ?auto_443239 ?auto_443240 ?auto_443241 ?auto_443242 ?auto_443243 ?auto_443244 ?auto_443245 ?auto_443246 ?auto_443247 ?auto_443248 ?auto_443249 ?auto_443250 )
      ( MAKE-15PILE ?auto_443237 ?auto_443238 ?auto_443239 ?auto_443240 ?auto_443241 ?auto_443242 ?auto_443243 ?auto_443244 ?auto_443245 ?auto_443246 ?auto_443247 ?auto_443248 ?auto_443249 ?auto_443250 ?auto_443251 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443267 - BLOCK
      ?auto_443268 - BLOCK
      ?auto_443269 - BLOCK
      ?auto_443270 - BLOCK
      ?auto_443271 - BLOCK
      ?auto_443272 - BLOCK
      ?auto_443273 - BLOCK
      ?auto_443274 - BLOCK
      ?auto_443275 - BLOCK
      ?auto_443276 - BLOCK
      ?auto_443277 - BLOCK
      ?auto_443278 - BLOCK
      ?auto_443279 - BLOCK
      ?auto_443280 - BLOCK
      ?auto_443281 - BLOCK
    )
    :vars
    (
      ?auto_443282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443281 ?auto_443282 ) ( ON-TABLE ?auto_443267 ) ( ON ?auto_443268 ?auto_443267 ) ( ON ?auto_443269 ?auto_443268 ) ( ON ?auto_443270 ?auto_443269 ) ( ON ?auto_443271 ?auto_443270 ) ( ON ?auto_443272 ?auto_443271 ) ( ON ?auto_443273 ?auto_443272 ) ( ON ?auto_443274 ?auto_443273 ) ( ON ?auto_443275 ?auto_443274 ) ( ON ?auto_443276 ?auto_443275 ) ( ON ?auto_443277 ?auto_443276 ) ( ON ?auto_443278 ?auto_443277 ) ( not ( = ?auto_443267 ?auto_443268 ) ) ( not ( = ?auto_443267 ?auto_443269 ) ) ( not ( = ?auto_443267 ?auto_443270 ) ) ( not ( = ?auto_443267 ?auto_443271 ) ) ( not ( = ?auto_443267 ?auto_443272 ) ) ( not ( = ?auto_443267 ?auto_443273 ) ) ( not ( = ?auto_443267 ?auto_443274 ) ) ( not ( = ?auto_443267 ?auto_443275 ) ) ( not ( = ?auto_443267 ?auto_443276 ) ) ( not ( = ?auto_443267 ?auto_443277 ) ) ( not ( = ?auto_443267 ?auto_443278 ) ) ( not ( = ?auto_443267 ?auto_443279 ) ) ( not ( = ?auto_443267 ?auto_443280 ) ) ( not ( = ?auto_443267 ?auto_443281 ) ) ( not ( = ?auto_443267 ?auto_443282 ) ) ( not ( = ?auto_443268 ?auto_443269 ) ) ( not ( = ?auto_443268 ?auto_443270 ) ) ( not ( = ?auto_443268 ?auto_443271 ) ) ( not ( = ?auto_443268 ?auto_443272 ) ) ( not ( = ?auto_443268 ?auto_443273 ) ) ( not ( = ?auto_443268 ?auto_443274 ) ) ( not ( = ?auto_443268 ?auto_443275 ) ) ( not ( = ?auto_443268 ?auto_443276 ) ) ( not ( = ?auto_443268 ?auto_443277 ) ) ( not ( = ?auto_443268 ?auto_443278 ) ) ( not ( = ?auto_443268 ?auto_443279 ) ) ( not ( = ?auto_443268 ?auto_443280 ) ) ( not ( = ?auto_443268 ?auto_443281 ) ) ( not ( = ?auto_443268 ?auto_443282 ) ) ( not ( = ?auto_443269 ?auto_443270 ) ) ( not ( = ?auto_443269 ?auto_443271 ) ) ( not ( = ?auto_443269 ?auto_443272 ) ) ( not ( = ?auto_443269 ?auto_443273 ) ) ( not ( = ?auto_443269 ?auto_443274 ) ) ( not ( = ?auto_443269 ?auto_443275 ) ) ( not ( = ?auto_443269 ?auto_443276 ) ) ( not ( = ?auto_443269 ?auto_443277 ) ) ( not ( = ?auto_443269 ?auto_443278 ) ) ( not ( = ?auto_443269 ?auto_443279 ) ) ( not ( = ?auto_443269 ?auto_443280 ) ) ( not ( = ?auto_443269 ?auto_443281 ) ) ( not ( = ?auto_443269 ?auto_443282 ) ) ( not ( = ?auto_443270 ?auto_443271 ) ) ( not ( = ?auto_443270 ?auto_443272 ) ) ( not ( = ?auto_443270 ?auto_443273 ) ) ( not ( = ?auto_443270 ?auto_443274 ) ) ( not ( = ?auto_443270 ?auto_443275 ) ) ( not ( = ?auto_443270 ?auto_443276 ) ) ( not ( = ?auto_443270 ?auto_443277 ) ) ( not ( = ?auto_443270 ?auto_443278 ) ) ( not ( = ?auto_443270 ?auto_443279 ) ) ( not ( = ?auto_443270 ?auto_443280 ) ) ( not ( = ?auto_443270 ?auto_443281 ) ) ( not ( = ?auto_443270 ?auto_443282 ) ) ( not ( = ?auto_443271 ?auto_443272 ) ) ( not ( = ?auto_443271 ?auto_443273 ) ) ( not ( = ?auto_443271 ?auto_443274 ) ) ( not ( = ?auto_443271 ?auto_443275 ) ) ( not ( = ?auto_443271 ?auto_443276 ) ) ( not ( = ?auto_443271 ?auto_443277 ) ) ( not ( = ?auto_443271 ?auto_443278 ) ) ( not ( = ?auto_443271 ?auto_443279 ) ) ( not ( = ?auto_443271 ?auto_443280 ) ) ( not ( = ?auto_443271 ?auto_443281 ) ) ( not ( = ?auto_443271 ?auto_443282 ) ) ( not ( = ?auto_443272 ?auto_443273 ) ) ( not ( = ?auto_443272 ?auto_443274 ) ) ( not ( = ?auto_443272 ?auto_443275 ) ) ( not ( = ?auto_443272 ?auto_443276 ) ) ( not ( = ?auto_443272 ?auto_443277 ) ) ( not ( = ?auto_443272 ?auto_443278 ) ) ( not ( = ?auto_443272 ?auto_443279 ) ) ( not ( = ?auto_443272 ?auto_443280 ) ) ( not ( = ?auto_443272 ?auto_443281 ) ) ( not ( = ?auto_443272 ?auto_443282 ) ) ( not ( = ?auto_443273 ?auto_443274 ) ) ( not ( = ?auto_443273 ?auto_443275 ) ) ( not ( = ?auto_443273 ?auto_443276 ) ) ( not ( = ?auto_443273 ?auto_443277 ) ) ( not ( = ?auto_443273 ?auto_443278 ) ) ( not ( = ?auto_443273 ?auto_443279 ) ) ( not ( = ?auto_443273 ?auto_443280 ) ) ( not ( = ?auto_443273 ?auto_443281 ) ) ( not ( = ?auto_443273 ?auto_443282 ) ) ( not ( = ?auto_443274 ?auto_443275 ) ) ( not ( = ?auto_443274 ?auto_443276 ) ) ( not ( = ?auto_443274 ?auto_443277 ) ) ( not ( = ?auto_443274 ?auto_443278 ) ) ( not ( = ?auto_443274 ?auto_443279 ) ) ( not ( = ?auto_443274 ?auto_443280 ) ) ( not ( = ?auto_443274 ?auto_443281 ) ) ( not ( = ?auto_443274 ?auto_443282 ) ) ( not ( = ?auto_443275 ?auto_443276 ) ) ( not ( = ?auto_443275 ?auto_443277 ) ) ( not ( = ?auto_443275 ?auto_443278 ) ) ( not ( = ?auto_443275 ?auto_443279 ) ) ( not ( = ?auto_443275 ?auto_443280 ) ) ( not ( = ?auto_443275 ?auto_443281 ) ) ( not ( = ?auto_443275 ?auto_443282 ) ) ( not ( = ?auto_443276 ?auto_443277 ) ) ( not ( = ?auto_443276 ?auto_443278 ) ) ( not ( = ?auto_443276 ?auto_443279 ) ) ( not ( = ?auto_443276 ?auto_443280 ) ) ( not ( = ?auto_443276 ?auto_443281 ) ) ( not ( = ?auto_443276 ?auto_443282 ) ) ( not ( = ?auto_443277 ?auto_443278 ) ) ( not ( = ?auto_443277 ?auto_443279 ) ) ( not ( = ?auto_443277 ?auto_443280 ) ) ( not ( = ?auto_443277 ?auto_443281 ) ) ( not ( = ?auto_443277 ?auto_443282 ) ) ( not ( = ?auto_443278 ?auto_443279 ) ) ( not ( = ?auto_443278 ?auto_443280 ) ) ( not ( = ?auto_443278 ?auto_443281 ) ) ( not ( = ?auto_443278 ?auto_443282 ) ) ( not ( = ?auto_443279 ?auto_443280 ) ) ( not ( = ?auto_443279 ?auto_443281 ) ) ( not ( = ?auto_443279 ?auto_443282 ) ) ( not ( = ?auto_443280 ?auto_443281 ) ) ( not ( = ?auto_443280 ?auto_443282 ) ) ( not ( = ?auto_443281 ?auto_443282 ) ) ( ON ?auto_443280 ?auto_443281 ) ( CLEAR ?auto_443278 ) ( ON ?auto_443279 ?auto_443280 ) ( CLEAR ?auto_443279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_443267 ?auto_443268 ?auto_443269 ?auto_443270 ?auto_443271 ?auto_443272 ?auto_443273 ?auto_443274 ?auto_443275 ?auto_443276 ?auto_443277 ?auto_443278 ?auto_443279 )
      ( MAKE-15PILE ?auto_443267 ?auto_443268 ?auto_443269 ?auto_443270 ?auto_443271 ?auto_443272 ?auto_443273 ?auto_443274 ?auto_443275 ?auto_443276 ?auto_443277 ?auto_443278 ?auto_443279 ?auto_443280 ?auto_443281 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443298 - BLOCK
      ?auto_443299 - BLOCK
      ?auto_443300 - BLOCK
      ?auto_443301 - BLOCK
      ?auto_443302 - BLOCK
      ?auto_443303 - BLOCK
      ?auto_443304 - BLOCK
      ?auto_443305 - BLOCK
      ?auto_443306 - BLOCK
      ?auto_443307 - BLOCK
      ?auto_443308 - BLOCK
      ?auto_443309 - BLOCK
      ?auto_443310 - BLOCK
      ?auto_443311 - BLOCK
      ?auto_443312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443312 ) ( ON-TABLE ?auto_443298 ) ( ON ?auto_443299 ?auto_443298 ) ( ON ?auto_443300 ?auto_443299 ) ( ON ?auto_443301 ?auto_443300 ) ( ON ?auto_443302 ?auto_443301 ) ( ON ?auto_443303 ?auto_443302 ) ( ON ?auto_443304 ?auto_443303 ) ( ON ?auto_443305 ?auto_443304 ) ( ON ?auto_443306 ?auto_443305 ) ( ON ?auto_443307 ?auto_443306 ) ( ON ?auto_443308 ?auto_443307 ) ( ON ?auto_443309 ?auto_443308 ) ( not ( = ?auto_443298 ?auto_443299 ) ) ( not ( = ?auto_443298 ?auto_443300 ) ) ( not ( = ?auto_443298 ?auto_443301 ) ) ( not ( = ?auto_443298 ?auto_443302 ) ) ( not ( = ?auto_443298 ?auto_443303 ) ) ( not ( = ?auto_443298 ?auto_443304 ) ) ( not ( = ?auto_443298 ?auto_443305 ) ) ( not ( = ?auto_443298 ?auto_443306 ) ) ( not ( = ?auto_443298 ?auto_443307 ) ) ( not ( = ?auto_443298 ?auto_443308 ) ) ( not ( = ?auto_443298 ?auto_443309 ) ) ( not ( = ?auto_443298 ?auto_443310 ) ) ( not ( = ?auto_443298 ?auto_443311 ) ) ( not ( = ?auto_443298 ?auto_443312 ) ) ( not ( = ?auto_443299 ?auto_443300 ) ) ( not ( = ?auto_443299 ?auto_443301 ) ) ( not ( = ?auto_443299 ?auto_443302 ) ) ( not ( = ?auto_443299 ?auto_443303 ) ) ( not ( = ?auto_443299 ?auto_443304 ) ) ( not ( = ?auto_443299 ?auto_443305 ) ) ( not ( = ?auto_443299 ?auto_443306 ) ) ( not ( = ?auto_443299 ?auto_443307 ) ) ( not ( = ?auto_443299 ?auto_443308 ) ) ( not ( = ?auto_443299 ?auto_443309 ) ) ( not ( = ?auto_443299 ?auto_443310 ) ) ( not ( = ?auto_443299 ?auto_443311 ) ) ( not ( = ?auto_443299 ?auto_443312 ) ) ( not ( = ?auto_443300 ?auto_443301 ) ) ( not ( = ?auto_443300 ?auto_443302 ) ) ( not ( = ?auto_443300 ?auto_443303 ) ) ( not ( = ?auto_443300 ?auto_443304 ) ) ( not ( = ?auto_443300 ?auto_443305 ) ) ( not ( = ?auto_443300 ?auto_443306 ) ) ( not ( = ?auto_443300 ?auto_443307 ) ) ( not ( = ?auto_443300 ?auto_443308 ) ) ( not ( = ?auto_443300 ?auto_443309 ) ) ( not ( = ?auto_443300 ?auto_443310 ) ) ( not ( = ?auto_443300 ?auto_443311 ) ) ( not ( = ?auto_443300 ?auto_443312 ) ) ( not ( = ?auto_443301 ?auto_443302 ) ) ( not ( = ?auto_443301 ?auto_443303 ) ) ( not ( = ?auto_443301 ?auto_443304 ) ) ( not ( = ?auto_443301 ?auto_443305 ) ) ( not ( = ?auto_443301 ?auto_443306 ) ) ( not ( = ?auto_443301 ?auto_443307 ) ) ( not ( = ?auto_443301 ?auto_443308 ) ) ( not ( = ?auto_443301 ?auto_443309 ) ) ( not ( = ?auto_443301 ?auto_443310 ) ) ( not ( = ?auto_443301 ?auto_443311 ) ) ( not ( = ?auto_443301 ?auto_443312 ) ) ( not ( = ?auto_443302 ?auto_443303 ) ) ( not ( = ?auto_443302 ?auto_443304 ) ) ( not ( = ?auto_443302 ?auto_443305 ) ) ( not ( = ?auto_443302 ?auto_443306 ) ) ( not ( = ?auto_443302 ?auto_443307 ) ) ( not ( = ?auto_443302 ?auto_443308 ) ) ( not ( = ?auto_443302 ?auto_443309 ) ) ( not ( = ?auto_443302 ?auto_443310 ) ) ( not ( = ?auto_443302 ?auto_443311 ) ) ( not ( = ?auto_443302 ?auto_443312 ) ) ( not ( = ?auto_443303 ?auto_443304 ) ) ( not ( = ?auto_443303 ?auto_443305 ) ) ( not ( = ?auto_443303 ?auto_443306 ) ) ( not ( = ?auto_443303 ?auto_443307 ) ) ( not ( = ?auto_443303 ?auto_443308 ) ) ( not ( = ?auto_443303 ?auto_443309 ) ) ( not ( = ?auto_443303 ?auto_443310 ) ) ( not ( = ?auto_443303 ?auto_443311 ) ) ( not ( = ?auto_443303 ?auto_443312 ) ) ( not ( = ?auto_443304 ?auto_443305 ) ) ( not ( = ?auto_443304 ?auto_443306 ) ) ( not ( = ?auto_443304 ?auto_443307 ) ) ( not ( = ?auto_443304 ?auto_443308 ) ) ( not ( = ?auto_443304 ?auto_443309 ) ) ( not ( = ?auto_443304 ?auto_443310 ) ) ( not ( = ?auto_443304 ?auto_443311 ) ) ( not ( = ?auto_443304 ?auto_443312 ) ) ( not ( = ?auto_443305 ?auto_443306 ) ) ( not ( = ?auto_443305 ?auto_443307 ) ) ( not ( = ?auto_443305 ?auto_443308 ) ) ( not ( = ?auto_443305 ?auto_443309 ) ) ( not ( = ?auto_443305 ?auto_443310 ) ) ( not ( = ?auto_443305 ?auto_443311 ) ) ( not ( = ?auto_443305 ?auto_443312 ) ) ( not ( = ?auto_443306 ?auto_443307 ) ) ( not ( = ?auto_443306 ?auto_443308 ) ) ( not ( = ?auto_443306 ?auto_443309 ) ) ( not ( = ?auto_443306 ?auto_443310 ) ) ( not ( = ?auto_443306 ?auto_443311 ) ) ( not ( = ?auto_443306 ?auto_443312 ) ) ( not ( = ?auto_443307 ?auto_443308 ) ) ( not ( = ?auto_443307 ?auto_443309 ) ) ( not ( = ?auto_443307 ?auto_443310 ) ) ( not ( = ?auto_443307 ?auto_443311 ) ) ( not ( = ?auto_443307 ?auto_443312 ) ) ( not ( = ?auto_443308 ?auto_443309 ) ) ( not ( = ?auto_443308 ?auto_443310 ) ) ( not ( = ?auto_443308 ?auto_443311 ) ) ( not ( = ?auto_443308 ?auto_443312 ) ) ( not ( = ?auto_443309 ?auto_443310 ) ) ( not ( = ?auto_443309 ?auto_443311 ) ) ( not ( = ?auto_443309 ?auto_443312 ) ) ( not ( = ?auto_443310 ?auto_443311 ) ) ( not ( = ?auto_443310 ?auto_443312 ) ) ( not ( = ?auto_443311 ?auto_443312 ) ) ( ON ?auto_443311 ?auto_443312 ) ( CLEAR ?auto_443309 ) ( ON ?auto_443310 ?auto_443311 ) ( CLEAR ?auto_443310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_443298 ?auto_443299 ?auto_443300 ?auto_443301 ?auto_443302 ?auto_443303 ?auto_443304 ?auto_443305 ?auto_443306 ?auto_443307 ?auto_443308 ?auto_443309 ?auto_443310 )
      ( MAKE-15PILE ?auto_443298 ?auto_443299 ?auto_443300 ?auto_443301 ?auto_443302 ?auto_443303 ?auto_443304 ?auto_443305 ?auto_443306 ?auto_443307 ?auto_443308 ?auto_443309 ?auto_443310 ?auto_443311 ?auto_443312 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443328 - BLOCK
      ?auto_443329 - BLOCK
      ?auto_443330 - BLOCK
      ?auto_443331 - BLOCK
      ?auto_443332 - BLOCK
      ?auto_443333 - BLOCK
      ?auto_443334 - BLOCK
      ?auto_443335 - BLOCK
      ?auto_443336 - BLOCK
      ?auto_443337 - BLOCK
      ?auto_443338 - BLOCK
      ?auto_443339 - BLOCK
      ?auto_443340 - BLOCK
      ?auto_443341 - BLOCK
      ?auto_443342 - BLOCK
    )
    :vars
    (
      ?auto_443343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443342 ?auto_443343 ) ( ON-TABLE ?auto_443328 ) ( ON ?auto_443329 ?auto_443328 ) ( ON ?auto_443330 ?auto_443329 ) ( ON ?auto_443331 ?auto_443330 ) ( ON ?auto_443332 ?auto_443331 ) ( ON ?auto_443333 ?auto_443332 ) ( ON ?auto_443334 ?auto_443333 ) ( ON ?auto_443335 ?auto_443334 ) ( ON ?auto_443336 ?auto_443335 ) ( ON ?auto_443337 ?auto_443336 ) ( ON ?auto_443338 ?auto_443337 ) ( not ( = ?auto_443328 ?auto_443329 ) ) ( not ( = ?auto_443328 ?auto_443330 ) ) ( not ( = ?auto_443328 ?auto_443331 ) ) ( not ( = ?auto_443328 ?auto_443332 ) ) ( not ( = ?auto_443328 ?auto_443333 ) ) ( not ( = ?auto_443328 ?auto_443334 ) ) ( not ( = ?auto_443328 ?auto_443335 ) ) ( not ( = ?auto_443328 ?auto_443336 ) ) ( not ( = ?auto_443328 ?auto_443337 ) ) ( not ( = ?auto_443328 ?auto_443338 ) ) ( not ( = ?auto_443328 ?auto_443339 ) ) ( not ( = ?auto_443328 ?auto_443340 ) ) ( not ( = ?auto_443328 ?auto_443341 ) ) ( not ( = ?auto_443328 ?auto_443342 ) ) ( not ( = ?auto_443328 ?auto_443343 ) ) ( not ( = ?auto_443329 ?auto_443330 ) ) ( not ( = ?auto_443329 ?auto_443331 ) ) ( not ( = ?auto_443329 ?auto_443332 ) ) ( not ( = ?auto_443329 ?auto_443333 ) ) ( not ( = ?auto_443329 ?auto_443334 ) ) ( not ( = ?auto_443329 ?auto_443335 ) ) ( not ( = ?auto_443329 ?auto_443336 ) ) ( not ( = ?auto_443329 ?auto_443337 ) ) ( not ( = ?auto_443329 ?auto_443338 ) ) ( not ( = ?auto_443329 ?auto_443339 ) ) ( not ( = ?auto_443329 ?auto_443340 ) ) ( not ( = ?auto_443329 ?auto_443341 ) ) ( not ( = ?auto_443329 ?auto_443342 ) ) ( not ( = ?auto_443329 ?auto_443343 ) ) ( not ( = ?auto_443330 ?auto_443331 ) ) ( not ( = ?auto_443330 ?auto_443332 ) ) ( not ( = ?auto_443330 ?auto_443333 ) ) ( not ( = ?auto_443330 ?auto_443334 ) ) ( not ( = ?auto_443330 ?auto_443335 ) ) ( not ( = ?auto_443330 ?auto_443336 ) ) ( not ( = ?auto_443330 ?auto_443337 ) ) ( not ( = ?auto_443330 ?auto_443338 ) ) ( not ( = ?auto_443330 ?auto_443339 ) ) ( not ( = ?auto_443330 ?auto_443340 ) ) ( not ( = ?auto_443330 ?auto_443341 ) ) ( not ( = ?auto_443330 ?auto_443342 ) ) ( not ( = ?auto_443330 ?auto_443343 ) ) ( not ( = ?auto_443331 ?auto_443332 ) ) ( not ( = ?auto_443331 ?auto_443333 ) ) ( not ( = ?auto_443331 ?auto_443334 ) ) ( not ( = ?auto_443331 ?auto_443335 ) ) ( not ( = ?auto_443331 ?auto_443336 ) ) ( not ( = ?auto_443331 ?auto_443337 ) ) ( not ( = ?auto_443331 ?auto_443338 ) ) ( not ( = ?auto_443331 ?auto_443339 ) ) ( not ( = ?auto_443331 ?auto_443340 ) ) ( not ( = ?auto_443331 ?auto_443341 ) ) ( not ( = ?auto_443331 ?auto_443342 ) ) ( not ( = ?auto_443331 ?auto_443343 ) ) ( not ( = ?auto_443332 ?auto_443333 ) ) ( not ( = ?auto_443332 ?auto_443334 ) ) ( not ( = ?auto_443332 ?auto_443335 ) ) ( not ( = ?auto_443332 ?auto_443336 ) ) ( not ( = ?auto_443332 ?auto_443337 ) ) ( not ( = ?auto_443332 ?auto_443338 ) ) ( not ( = ?auto_443332 ?auto_443339 ) ) ( not ( = ?auto_443332 ?auto_443340 ) ) ( not ( = ?auto_443332 ?auto_443341 ) ) ( not ( = ?auto_443332 ?auto_443342 ) ) ( not ( = ?auto_443332 ?auto_443343 ) ) ( not ( = ?auto_443333 ?auto_443334 ) ) ( not ( = ?auto_443333 ?auto_443335 ) ) ( not ( = ?auto_443333 ?auto_443336 ) ) ( not ( = ?auto_443333 ?auto_443337 ) ) ( not ( = ?auto_443333 ?auto_443338 ) ) ( not ( = ?auto_443333 ?auto_443339 ) ) ( not ( = ?auto_443333 ?auto_443340 ) ) ( not ( = ?auto_443333 ?auto_443341 ) ) ( not ( = ?auto_443333 ?auto_443342 ) ) ( not ( = ?auto_443333 ?auto_443343 ) ) ( not ( = ?auto_443334 ?auto_443335 ) ) ( not ( = ?auto_443334 ?auto_443336 ) ) ( not ( = ?auto_443334 ?auto_443337 ) ) ( not ( = ?auto_443334 ?auto_443338 ) ) ( not ( = ?auto_443334 ?auto_443339 ) ) ( not ( = ?auto_443334 ?auto_443340 ) ) ( not ( = ?auto_443334 ?auto_443341 ) ) ( not ( = ?auto_443334 ?auto_443342 ) ) ( not ( = ?auto_443334 ?auto_443343 ) ) ( not ( = ?auto_443335 ?auto_443336 ) ) ( not ( = ?auto_443335 ?auto_443337 ) ) ( not ( = ?auto_443335 ?auto_443338 ) ) ( not ( = ?auto_443335 ?auto_443339 ) ) ( not ( = ?auto_443335 ?auto_443340 ) ) ( not ( = ?auto_443335 ?auto_443341 ) ) ( not ( = ?auto_443335 ?auto_443342 ) ) ( not ( = ?auto_443335 ?auto_443343 ) ) ( not ( = ?auto_443336 ?auto_443337 ) ) ( not ( = ?auto_443336 ?auto_443338 ) ) ( not ( = ?auto_443336 ?auto_443339 ) ) ( not ( = ?auto_443336 ?auto_443340 ) ) ( not ( = ?auto_443336 ?auto_443341 ) ) ( not ( = ?auto_443336 ?auto_443342 ) ) ( not ( = ?auto_443336 ?auto_443343 ) ) ( not ( = ?auto_443337 ?auto_443338 ) ) ( not ( = ?auto_443337 ?auto_443339 ) ) ( not ( = ?auto_443337 ?auto_443340 ) ) ( not ( = ?auto_443337 ?auto_443341 ) ) ( not ( = ?auto_443337 ?auto_443342 ) ) ( not ( = ?auto_443337 ?auto_443343 ) ) ( not ( = ?auto_443338 ?auto_443339 ) ) ( not ( = ?auto_443338 ?auto_443340 ) ) ( not ( = ?auto_443338 ?auto_443341 ) ) ( not ( = ?auto_443338 ?auto_443342 ) ) ( not ( = ?auto_443338 ?auto_443343 ) ) ( not ( = ?auto_443339 ?auto_443340 ) ) ( not ( = ?auto_443339 ?auto_443341 ) ) ( not ( = ?auto_443339 ?auto_443342 ) ) ( not ( = ?auto_443339 ?auto_443343 ) ) ( not ( = ?auto_443340 ?auto_443341 ) ) ( not ( = ?auto_443340 ?auto_443342 ) ) ( not ( = ?auto_443340 ?auto_443343 ) ) ( not ( = ?auto_443341 ?auto_443342 ) ) ( not ( = ?auto_443341 ?auto_443343 ) ) ( not ( = ?auto_443342 ?auto_443343 ) ) ( ON ?auto_443341 ?auto_443342 ) ( ON ?auto_443340 ?auto_443341 ) ( CLEAR ?auto_443338 ) ( ON ?auto_443339 ?auto_443340 ) ( CLEAR ?auto_443339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_443328 ?auto_443329 ?auto_443330 ?auto_443331 ?auto_443332 ?auto_443333 ?auto_443334 ?auto_443335 ?auto_443336 ?auto_443337 ?auto_443338 ?auto_443339 )
      ( MAKE-15PILE ?auto_443328 ?auto_443329 ?auto_443330 ?auto_443331 ?auto_443332 ?auto_443333 ?auto_443334 ?auto_443335 ?auto_443336 ?auto_443337 ?auto_443338 ?auto_443339 ?auto_443340 ?auto_443341 ?auto_443342 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443359 - BLOCK
      ?auto_443360 - BLOCK
      ?auto_443361 - BLOCK
      ?auto_443362 - BLOCK
      ?auto_443363 - BLOCK
      ?auto_443364 - BLOCK
      ?auto_443365 - BLOCK
      ?auto_443366 - BLOCK
      ?auto_443367 - BLOCK
      ?auto_443368 - BLOCK
      ?auto_443369 - BLOCK
      ?auto_443370 - BLOCK
      ?auto_443371 - BLOCK
      ?auto_443372 - BLOCK
      ?auto_443373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443373 ) ( ON-TABLE ?auto_443359 ) ( ON ?auto_443360 ?auto_443359 ) ( ON ?auto_443361 ?auto_443360 ) ( ON ?auto_443362 ?auto_443361 ) ( ON ?auto_443363 ?auto_443362 ) ( ON ?auto_443364 ?auto_443363 ) ( ON ?auto_443365 ?auto_443364 ) ( ON ?auto_443366 ?auto_443365 ) ( ON ?auto_443367 ?auto_443366 ) ( ON ?auto_443368 ?auto_443367 ) ( ON ?auto_443369 ?auto_443368 ) ( not ( = ?auto_443359 ?auto_443360 ) ) ( not ( = ?auto_443359 ?auto_443361 ) ) ( not ( = ?auto_443359 ?auto_443362 ) ) ( not ( = ?auto_443359 ?auto_443363 ) ) ( not ( = ?auto_443359 ?auto_443364 ) ) ( not ( = ?auto_443359 ?auto_443365 ) ) ( not ( = ?auto_443359 ?auto_443366 ) ) ( not ( = ?auto_443359 ?auto_443367 ) ) ( not ( = ?auto_443359 ?auto_443368 ) ) ( not ( = ?auto_443359 ?auto_443369 ) ) ( not ( = ?auto_443359 ?auto_443370 ) ) ( not ( = ?auto_443359 ?auto_443371 ) ) ( not ( = ?auto_443359 ?auto_443372 ) ) ( not ( = ?auto_443359 ?auto_443373 ) ) ( not ( = ?auto_443360 ?auto_443361 ) ) ( not ( = ?auto_443360 ?auto_443362 ) ) ( not ( = ?auto_443360 ?auto_443363 ) ) ( not ( = ?auto_443360 ?auto_443364 ) ) ( not ( = ?auto_443360 ?auto_443365 ) ) ( not ( = ?auto_443360 ?auto_443366 ) ) ( not ( = ?auto_443360 ?auto_443367 ) ) ( not ( = ?auto_443360 ?auto_443368 ) ) ( not ( = ?auto_443360 ?auto_443369 ) ) ( not ( = ?auto_443360 ?auto_443370 ) ) ( not ( = ?auto_443360 ?auto_443371 ) ) ( not ( = ?auto_443360 ?auto_443372 ) ) ( not ( = ?auto_443360 ?auto_443373 ) ) ( not ( = ?auto_443361 ?auto_443362 ) ) ( not ( = ?auto_443361 ?auto_443363 ) ) ( not ( = ?auto_443361 ?auto_443364 ) ) ( not ( = ?auto_443361 ?auto_443365 ) ) ( not ( = ?auto_443361 ?auto_443366 ) ) ( not ( = ?auto_443361 ?auto_443367 ) ) ( not ( = ?auto_443361 ?auto_443368 ) ) ( not ( = ?auto_443361 ?auto_443369 ) ) ( not ( = ?auto_443361 ?auto_443370 ) ) ( not ( = ?auto_443361 ?auto_443371 ) ) ( not ( = ?auto_443361 ?auto_443372 ) ) ( not ( = ?auto_443361 ?auto_443373 ) ) ( not ( = ?auto_443362 ?auto_443363 ) ) ( not ( = ?auto_443362 ?auto_443364 ) ) ( not ( = ?auto_443362 ?auto_443365 ) ) ( not ( = ?auto_443362 ?auto_443366 ) ) ( not ( = ?auto_443362 ?auto_443367 ) ) ( not ( = ?auto_443362 ?auto_443368 ) ) ( not ( = ?auto_443362 ?auto_443369 ) ) ( not ( = ?auto_443362 ?auto_443370 ) ) ( not ( = ?auto_443362 ?auto_443371 ) ) ( not ( = ?auto_443362 ?auto_443372 ) ) ( not ( = ?auto_443362 ?auto_443373 ) ) ( not ( = ?auto_443363 ?auto_443364 ) ) ( not ( = ?auto_443363 ?auto_443365 ) ) ( not ( = ?auto_443363 ?auto_443366 ) ) ( not ( = ?auto_443363 ?auto_443367 ) ) ( not ( = ?auto_443363 ?auto_443368 ) ) ( not ( = ?auto_443363 ?auto_443369 ) ) ( not ( = ?auto_443363 ?auto_443370 ) ) ( not ( = ?auto_443363 ?auto_443371 ) ) ( not ( = ?auto_443363 ?auto_443372 ) ) ( not ( = ?auto_443363 ?auto_443373 ) ) ( not ( = ?auto_443364 ?auto_443365 ) ) ( not ( = ?auto_443364 ?auto_443366 ) ) ( not ( = ?auto_443364 ?auto_443367 ) ) ( not ( = ?auto_443364 ?auto_443368 ) ) ( not ( = ?auto_443364 ?auto_443369 ) ) ( not ( = ?auto_443364 ?auto_443370 ) ) ( not ( = ?auto_443364 ?auto_443371 ) ) ( not ( = ?auto_443364 ?auto_443372 ) ) ( not ( = ?auto_443364 ?auto_443373 ) ) ( not ( = ?auto_443365 ?auto_443366 ) ) ( not ( = ?auto_443365 ?auto_443367 ) ) ( not ( = ?auto_443365 ?auto_443368 ) ) ( not ( = ?auto_443365 ?auto_443369 ) ) ( not ( = ?auto_443365 ?auto_443370 ) ) ( not ( = ?auto_443365 ?auto_443371 ) ) ( not ( = ?auto_443365 ?auto_443372 ) ) ( not ( = ?auto_443365 ?auto_443373 ) ) ( not ( = ?auto_443366 ?auto_443367 ) ) ( not ( = ?auto_443366 ?auto_443368 ) ) ( not ( = ?auto_443366 ?auto_443369 ) ) ( not ( = ?auto_443366 ?auto_443370 ) ) ( not ( = ?auto_443366 ?auto_443371 ) ) ( not ( = ?auto_443366 ?auto_443372 ) ) ( not ( = ?auto_443366 ?auto_443373 ) ) ( not ( = ?auto_443367 ?auto_443368 ) ) ( not ( = ?auto_443367 ?auto_443369 ) ) ( not ( = ?auto_443367 ?auto_443370 ) ) ( not ( = ?auto_443367 ?auto_443371 ) ) ( not ( = ?auto_443367 ?auto_443372 ) ) ( not ( = ?auto_443367 ?auto_443373 ) ) ( not ( = ?auto_443368 ?auto_443369 ) ) ( not ( = ?auto_443368 ?auto_443370 ) ) ( not ( = ?auto_443368 ?auto_443371 ) ) ( not ( = ?auto_443368 ?auto_443372 ) ) ( not ( = ?auto_443368 ?auto_443373 ) ) ( not ( = ?auto_443369 ?auto_443370 ) ) ( not ( = ?auto_443369 ?auto_443371 ) ) ( not ( = ?auto_443369 ?auto_443372 ) ) ( not ( = ?auto_443369 ?auto_443373 ) ) ( not ( = ?auto_443370 ?auto_443371 ) ) ( not ( = ?auto_443370 ?auto_443372 ) ) ( not ( = ?auto_443370 ?auto_443373 ) ) ( not ( = ?auto_443371 ?auto_443372 ) ) ( not ( = ?auto_443371 ?auto_443373 ) ) ( not ( = ?auto_443372 ?auto_443373 ) ) ( ON ?auto_443372 ?auto_443373 ) ( ON ?auto_443371 ?auto_443372 ) ( CLEAR ?auto_443369 ) ( ON ?auto_443370 ?auto_443371 ) ( CLEAR ?auto_443370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_443359 ?auto_443360 ?auto_443361 ?auto_443362 ?auto_443363 ?auto_443364 ?auto_443365 ?auto_443366 ?auto_443367 ?auto_443368 ?auto_443369 ?auto_443370 )
      ( MAKE-15PILE ?auto_443359 ?auto_443360 ?auto_443361 ?auto_443362 ?auto_443363 ?auto_443364 ?auto_443365 ?auto_443366 ?auto_443367 ?auto_443368 ?auto_443369 ?auto_443370 ?auto_443371 ?auto_443372 ?auto_443373 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443389 - BLOCK
      ?auto_443390 - BLOCK
      ?auto_443391 - BLOCK
      ?auto_443392 - BLOCK
      ?auto_443393 - BLOCK
      ?auto_443394 - BLOCK
      ?auto_443395 - BLOCK
      ?auto_443396 - BLOCK
      ?auto_443397 - BLOCK
      ?auto_443398 - BLOCK
      ?auto_443399 - BLOCK
      ?auto_443400 - BLOCK
      ?auto_443401 - BLOCK
      ?auto_443402 - BLOCK
      ?auto_443403 - BLOCK
    )
    :vars
    (
      ?auto_443404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443403 ?auto_443404 ) ( ON-TABLE ?auto_443389 ) ( ON ?auto_443390 ?auto_443389 ) ( ON ?auto_443391 ?auto_443390 ) ( ON ?auto_443392 ?auto_443391 ) ( ON ?auto_443393 ?auto_443392 ) ( ON ?auto_443394 ?auto_443393 ) ( ON ?auto_443395 ?auto_443394 ) ( ON ?auto_443396 ?auto_443395 ) ( ON ?auto_443397 ?auto_443396 ) ( ON ?auto_443398 ?auto_443397 ) ( not ( = ?auto_443389 ?auto_443390 ) ) ( not ( = ?auto_443389 ?auto_443391 ) ) ( not ( = ?auto_443389 ?auto_443392 ) ) ( not ( = ?auto_443389 ?auto_443393 ) ) ( not ( = ?auto_443389 ?auto_443394 ) ) ( not ( = ?auto_443389 ?auto_443395 ) ) ( not ( = ?auto_443389 ?auto_443396 ) ) ( not ( = ?auto_443389 ?auto_443397 ) ) ( not ( = ?auto_443389 ?auto_443398 ) ) ( not ( = ?auto_443389 ?auto_443399 ) ) ( not ( = ?auto_443389 ?auto_443400 ) ) ( not ( = ?auto_443389 ?auto_443401 ) ) ( not ( = ?auto_443389 ?auto_443402 ) ) ( not ( = ?auto_443389 ?auto_443403 ) ) ( not ( = ?auto_443389 ?auto_443404 ) ) ( not ( = ?auto_443390 ?auto_443391 ) ) ( not ( = ?auto_443390 ?auto_443392 ) ) ( not ( = ?auto_443390 ?auto_443393 ) ) ( not ( = ?auto_443390 ?auto_443394 ) ) ( not ( = ?auto_443390 ?auto_443395 ) ) ( not ( = ?auto_443390 ?auto_443396 ) ) ( not ( = ?auto_443390 ?auto_443397 ) ) ( not ( = ?auto_443390 ?auto_443398 ) ) ( not ( = ?auto_443390 ?auto_443399 ) ) ( not ( = ?auto_443390 ?auto_443400 ) ) ( not ( = ?auto_443390 ?auto_443401 ) ) ( not ( = ?auto_443390 ?auto_443402 ) ) ( not ( = ?auto_443390 ?auto_443403 ) ) ( not ( = ?auto_443390 ?auto_443404 ) ) ( not ( = ?auto_443391 ?auto_443392 ) ) ( not ( = ?auto_443391 ?auto_443393 ) ) ( not ( = ?auto_443391 ?auto_443394 ) ) ( not ( = ?auto_443391 ?auto_443395 ) ) ( not ( = ?auto_443391 ?auto_443396 ) ) ( not ( = ?auto_443391 ?auto_443397 ) ) ( not ( = ?auto_443391 ?auto_443398 ) ) ( not ( = ?auto_443391 ?auto_443399 ) ) ( not ( = ?auto_443391 ?auto_443400 ) ) ( not ( = ?auto_443391 ?auto_443401 ) ) ( not ( = ?auto_443391 ?auto_443402 ) ) ( not ( = ?auto_443391 ?auto_443403 ) ) ( not ( = ?auto_443391 ?auto_443404 ) ) ( not ( = ?auto_443392 ?auto_443393 ) ) ( not ( = ?auto_443392 ?auto_443394 ) ) ( not ( = ?auto_443392 ?auto_443395 ) ) ( not ( = ?auto_443392 ?auto_443396 ) ) ( not ( = ?auto_443392 ?auto_443397 ) ) ( not ( = ?auto_443392 ?auto_443398 ) ) ( not ( = ?auto_443392 ?auto_443399 ) ) ( not ( = ?auto_443392 ?auto_443400 ) ) ( not ( = ?auto_443392 ?auto_443401 ) ) ( not ( = ?auto_443392 ?auto_443402 ) ) ( not ( = ?auto_443392 ?auto_443403 ) ) ( not ( = ?auto_443392 ?auto_443404 ) ) ( not ( = ?auto_443393 ?auto_443394 ) ) ( not ( = ?auto_443393 ?auto_443395 ) ) ( not ( = ?auto_443393 ?auto_443396 ) ) ( not ( = ?auto_443393 ?auto_443397 ) ) ( not ( = ?auto_443393 ?auto_443398 ) ) ( not ( = ?auto_443393 ?auto_443399 ) ) ( not ( = ?auto_443393 ?auto_443400 ) ) ( not ( = ?auto_443393 ?auto_443401 ) ) ( not ( = ?auto_443393 ?auto_443402 ) ) ( not ( = ?auto_443393 ?auto_443403 ) ) ( not ( = ?auto_443393 ?auto_443404 ) ) ( not ( = ?auto_443394 ?auto_443395 ) ) ( not ( = ?auto_443394 ?auto_443396 ) ) ( not ( = ?auto_443394 ?auto_443397 ) ) ( not ( = ?auto_443394 ?auto_443398 ) ) ( not ( = ?auto_443394 ?auto_443399 ) ) ( not ( = ?auto_443394 ?auto_443400 ) ) ( not ( = ?auto_443394 ?auto_443401 ) ) ( not ( = ?auto_443394 ?auto_443402 ) ) ( not ( = ?auto_443394 ?auto_443403 ) ) ( not ( = ?auto_443394 ?auto_443404 ) ) ( not ( = ?auto_443395 ?auto_443396 ) ) ( not ( = ?auto_443395 ?auto_443397 ) ) ( not ( = ?auto_443395 ?auto_443398 ) ) ( not ( = ?auto_443395 ?auto_443399 ) ) ( not ( = ?auto_443395 ?auto_443400 ) ) ( not ( = ?auto_443395 ?auto_443401 ) ) ( not ( = ?auto_443395 ?auto_443402 ) ) ( not ( = ?auto_443395 ?auto_443403 ) ) ( not ( = ?auto_443395 ?auto_443404 ) ) ( not ( = ?auto_443396 ?auto_443397 ) ) ( not ( = ?auto_443396 ?auto_443398 ) ) ( not ( = ?auto_443396 ?auto_443399 ) ) ( not ( = ?auto_443396 ?auto_443400 ) ) ( not ( = ?auto_443396 ?auto_443401 ) ) ( not ( = ?auto_443396 ?auto_443402 ) ) ( not ( = ?auto_443396 ?auto_443403 ) ) ( not ( = ?auto_443396 ?auto_443404 ) ) ( not ( = ?auto_443397 ?auto_443398 ) ) ( not ( = ?auto_443397 ?auto_443399 ) ) ( not ( = ?auto_443397 ?auto_443400 ) ) ( not ( = ?auto_443397 ?auto_443401 ) ) ( not ( = ?auto_443397 ?auto_443402 ) ) ( not ( = ?auto_443397 ?auto_443403 ) ) ( not ( = ?auto_443397 ?auto_443404 ) ) ( not ( = ?auto_443398 ?auto_443399 ) ) ( not ( = ?auto_443398 ?auto_443400 ) ) ( not ( = ?auto_443398 ?auto_443401 ) ) ( not ( = ?auto_443398 ?auto_443402 ) ) ( not ( = ?auto_443398 ?auto_443403 ) ) ( not ( = ?auto_443398 ?auto_443404 ) ) ( not ( = ?auto_443399 ?auto_443400 ) ) ( not ( = ?auto_443399 ?auto_443401 ) ) ( not ( = ?auto_443399 ?auto_443402 ) ) ( not ( = ?auto_443399 ?auto_443403 ) ) ( not ( = ?auto_443399 ?auto_443404 ) ) ( not ( = ?auto_443400 ?auto_443401 ) ) ( not ( = ?auto_443400 ?auto_443402 ) ) ( not ( = ?auto_443400 ?auto_443403 ) ) ( not ( = ?auto_443400 ?auto_443404 ) ) ( not ( = ?auto_443401 ?auto_443402 ) ) ( not ( = ?auto_443401 ?auto_443403 ) ) ( not ( = ?auto_443401 ?auto_443404 ) ) ( not ( = ?auto_443402 ?auto_443403 ) ) ( not ( = ?auto_443402 ?auto_443404 ) ) ( not ( = ?auto_443403 ?auto_443404 ) ) ( ON ?auto_443402 ?auto_443403 ) ( ON ?auto_443401 ?auto_443402 ) ( ON ?auto_443400 ?auto_443401 ) ( CLEAR ?auto_443398 ) ( ON ?auto_443399 ?auto_443400 ) ( CLEAR ?auto_443399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_443389 ?auto_443390 ?auto_443391 ?auto_443392 ?auto_443393 ?auto_443394 ?auto_443395 ?auto_443396 ?auto_443397 ?auto_443398 ?auto_443399 )
      ( MAKE-15PILE ?auto_443389 ?auto_443390 ?auto_443391 ?auto_443392 ?auto_443393 ?auto_443394 ?auto_443395 ?auto_443396 ?auto_443397 ?auto_443398 ?auto_443399 ?auto_443400 ?auto_443401 ?auto_443402 ?auto_443403 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443420 - BLOCK
      ?auto_443421 - BLOCK
      ?auto_443422 - BLOCK
      ?auto_443423 - BLOCK
      ?auto_443424 - BLOCK
      ?auto_443425 - BLOCK
      ?auto_443426 - BLOCK
      ?auto_443427 - BLOCK
      ?auto_443428 - BLOCK
      ?auto_443429 - BLOCK
      ?auto_443430 - BLOCK
      ?auto_443431 - BLOCK
      ?auto_443432 - BLOCK
      ?auto_443433 - BLOCK
      ?auto_443434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443434 ) ( ON-TABLE ?auto_443420 ) ( ON ?auto_443421 ?auto_443420 ) ( ON ?auto_443422 ?auto_443421 ) ( ON ?auto_443423 ?auto_443422 ) ( ON ?auto_443424 ?auto_443423 ) ( ON ?auto_443425 ?auto_443424 ) ( ON ?auto_443426 ?auto_443425 ) ( ON ?auto_443427 ?auto_443426 ) ( ON ?auto_443428 ?auto_443427 ) ( ON ?auto_443429 ?auto_443428 ) ( not ( = ?auto_443420 ?auto_443421 ) ) ( not ( = ?auto_443420 ?auto_443422 ) ) ( not ( = ?auto_443420 ?auto_443423 ) ) ( not ( = ?auto_443420 ?auto_443424 ) ) ( not ( = ?auto_443420 ?auto_443425 ) ) ( not ( = ?auto_443420 ?auto_443426 ) ) ( not ( = ?auto_443420 ?auto_443427 ) ) ( not ( = ?auto_443420 ?auto_443428 ) ) ( not ( = ?auto_443420 ?auto_443429 ) ) ( not ( = ?auto_443420 ?auto_443430 ) ) ( not ( = ?auto_443420 ?auto_443431 ) ) ( not ( = ?auto_443420 ?auto_443432 ) ) ( not ( = ?auto_443420 ?auto_443433 ) ) ( not ( = ?auto_443420 ?auto_443434 ) ) ( not ( = ?auto_443421 ?auto_443422 ) ) ( not ( = ?auto_443421 ?auto_443423 ) ) ( not ( = ?auto_443421 ?auto_443424 ) ) ( not ( = ?auto_443421 ?auto_443425 ) ) ( not ( = ?auto_443421 ?auto_443426 ) ) ( not ( = ?auto_443421 ?auto_443427 ) ) ( not ( = ?auto_443421 ?auto_443428 ) ) ( not ( = ?auto_443421 ?auto_443429 ) ) ( not ( = ?auto_443421 ?auto_443430 ) ) ( not ( = ?auto_443421 ?auto_443431 ) ) ( not ( = ?auto_443421 ?auto_443432 ) ) ( not ( = ?auto_443421 ?auto_443433 ) ) ( not ( = ?auto_443421 ?auto_443434 ) ) ( not ( = ?auto_443422 ?auto_443423 ) ) ( not ( = ?auto_443422 ?auto_443424 ) ) ( not ( = ?auto_443422 ?auto_443425 ) ) ( not ( = ?auto_443422 ?auto_443426 ) ) ( not ( = ?auto_443422 ?auto_443427 ) ) ( not ( = ?auto_443422 ?auto_443428 ) ) ( not ( = ?auto_443422 ?auto_443429 ) ) ( not ( = ?auto_443422 ?auto_443430 ) ) ( not ( = ?auto_443422 ?auto_443431 ) ) ( not ( = ?auto_443422 ?auto_443432 ) ) ( not ( = ?auto_443422 ?auto_443433 ) ) ( not ( = ?auto_443422 ?auto_443434 ) ) ( not ( = ?auto_443423 ?auto_443424 ) ) ( not ( = ?auto_443423 ?auto_443425 ) ) ( not ( = ?auto_443423 ?auto_443426 ) ) ( not ( = ?auto_443423 ?auto_443427 ) ) ( not ( = ?auto_443423 ?auto_443428 ) ) ( not ( = ?auto_443423 ?auto_443429 ) ) ( not ( = ?auto_443423 ?auto_443430 ) ) ( not ( = ?auto_443423 ?auto_443431 ) ) ( not ( = ?auto_443423 ?auto_443432 ) ) ( not ( = ?auto_443423 ?auto_443433 ) ) ( not ( = ?auto_443423 ?auto_443434 ) ) ( not ( = ?auto_443424 ?auto_443425 ) ) ( not ( = ?auto_443424 ?auto_443426 ) ) ( not ( = ?auto_443424 ?auto_443427 ) ) ( not ( = ?auto_443424 ?auto_443428 ) ) ( not ( = ?auto_443424 ?auto_443429 ) ) ( not ( = ?auto_443424 ?auto_443430 ) ) ( not ( = ?auto_443424 ?auto_443431 ) ) ( not ( = ?auto_443424 ?auto_443432 ) ) ( not ( = ?auto_443424 ?auto_443433 ) ) ( not ( = ?auto_443424 ?auto_443434 ) ) ( not ( = ?auto_443425 ?auto_443426 ) ) ( not ( = ?auto_443425 ?auto_443427 ) ) ( not ( = ?auto_443425 ?auto_443428 ) ) ( not ( = ?auto_443425 ?auto_443429 ) ) ( not ( = ?auto_443425 ?auto_443430 ) ) ( not ( = ?auto_443425 ?auto_443431 ) ) ( not ( = ?auto_443425 ?auto_443432 ) ) ( not ( = ?auto_443425 ?auto_443433 ) ) ( not ( = ?auto_443425 ?auto_443434 ) ) ( not ( = ?auto_443426 ?auto_443427 ) ) ( not ( = ?auto_443426 ?auto_443428 ) ) ( not ( = ?auto_443426 ?auto_443429 ) ) ( not ( = ?auto_443426 ?auto_443430 ) ) ( not ( = ?auto_443426 ?auto_443431 ) ) ( not ( = ?auto_443426 ?auto_443432 ) ) ( not ( = ?auto_443426 ?auto_443433 ) ) ( not ( = ?auto_443426 ?auto_443434 ) ) ( not ( = ?auto_443427 ?auto_443428 ) ) ( not ( = ?auto_443427 ?auto_443429 ) ) ( not ( = ?auto_443427 ?auto_443430 ) ) ( not ( = ?auto_443427 ?auto_443431 ) ) ( not ( = ?auto_443427 ?auto_443432 ) ) ( not ( = ?auto_443427 ?auto_443433 ) ) ( not ( = ?auto_443427 ?auto_443434 ) ) ( not ( = ?auto_443428 ?auto_443429 ) ) ( not ( = ?auto_443428 ?auto_443430 ) ) ( not ( = ?auto_443428 ?auto_443431 ) ) ( not ( = ?auto_443428 ?auto_443432 ) ) ( not ( = ?auto_443428 ?auto_443433 ) ) ( not ( = ?auto_443428 ?auto_443434 ) ) ( not ( = ?auto_443429 ?auto_443430 ) ) ( not ( = ?auto_443429 ?auto_443431 ) ) ( not ( = ?auto_443429 ?auto_443432 ) ) ( not ( = ?auto_443429 ?auto_443433 ) ) ( not ( = ?auto_443429 ?auto_443434 ) ) ( not ( = ?auto_443430 ?auto_443431 ) ) ( not ( = ?auto_443430 ?auto_443432 ) ) ( not ( = ?auto_443430 ?auto_443433 ) ) ( not ( = ?auto_443430 ?auto_443434 ) ) ( not ( = ?auto_443431 ?auto_443432 ) ) ( not ( = ?auto_443431 ?auto_443433 ) ) ( not ( = ?auto_443431 ?auto_443434 ) ) ( not ( = ?auto_443432 ?auto_443433 ) ) ( not ( = ?auto_443432 ?auto_443434 ) ) ( not ( = ?auto_443433 ?auto_443434 ) ) ( ON ?auto_443433 ?auto_443434 ) ( ON ?auto_443432 ?auto_443433 ) ( ON ?auto_443431 ?auto_443432 ) ( CLEAR ?auto_443429 ) ( ON ?auto_443430 ?auto_443431 ) ( CLEAR ?auto_443430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_443420 ?auto_443421 ?auto_443422 ?auto_443423 ?auto_443424 ?auto_443425 ?auto_443426 ?auto_443427 ?auto_443428 ?auto_443429 ?auto_443430 )
      ( MAKE-15PILE ?auto_443420 ?auto_443421 ?auto_443422 ?auto_443423 ?auto_443424 ?auto_443425 ?auto_443426 ?auto_443427 ?auto_443428 ?auto_443429 ?auto_443430 ?auto_443431 ?auto_443432 ?auto_443433 ?auto_443434 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443450 - BLOCK
      ?auto_443451 - BLOCK
      ?auto_443452 - BLOCK
      ?auto_443453 - BLOCK
      ?auto_443454 - BLOCK
      ?auto_443455 - BLOCK
      ?auto_443456 - BLOCK
      ?auto_443457 - BLOCK
      ?auto_443458 - BLOCK
      ?auto_443459 - BLOCK
      ?auto_443460 - BLOCK
      ?auto_443461 - BLOCK
      ?auto_443462 - BLOCK
      ?auto_443463 - BLOCK
      ?auto_443464 - BLOCK
    )
    :vars
    (
      ?auto_443465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443464 ?auto_443465 ) ( ON-TABLE ?auto_443450 ) ( ON ?auto_443451 ?auto_443450 ) ( ON ?auto_443452 ?auto_443451 ) ( ON ?auto_443453 ?auto_443452 ) ( ON ?auto_443454 ?auto_443453 ) ( ON ?auto_443455 ?auto_443454 ) ( ON ?auto_443456 ?auto_443455 ) ( ON ?auto_443457 ?auto_443456 ) ( ON ?auto_443458 ?auto_443457 ) ( not ( = ?auto_443450 ?auto_443451 ) ) ( not ( = ?auto_443450 ?auto_443452 ) ) ( not ( = ?auto_443450 ?auto_443453 ) ) ( not ( = ?auto_443450 ?auto_443454 ) ) ( not ( = ?auto_443450 ?auto_443455 ) ) ( not ( = ?auto_443450 ?auto_443456 ) ) ( not ( = ?auto_443450 ?auto_443457 ) ) ( not ( = ?auto_443450 ?auto_443458 ) ) ( not ( = ?auto_443450 ?auto_443459 ) ) ( not ( = ?auto_443450 ?auto_443460 ) ) ( not ( = ?auto_443450 ?auto_443461 ) ) ( not ( = ?auto_443450 ?auto_443462 ) ) ( not ( = ?auto_443450 ?auto_443463 ) ) ( not ( = ?auto_443450 ?auto_443464 ) ) ( not ( = ?auto_443450 ?auto_443465 ) ) ( not ( = ?auto_443451 ?auto_443452 ) ) ( not ( = ?auto_443451 ?auto_443453 ) ) ( not ( = ?auto_443451 ?auto_443454 ) ) ( not ( = ?auto_443451 ?auto_443455 ) ) ( not ( = ?auto_443451 ?auto_443456 ) ) ( not ( = ?auto_443451 ?auto_443457 ) ) ( not ( = ?auto_443451 ?auto_443458 ) ) ( not ( = ?auto_443451 ?auto_443459 ) ) ( not ( = ?auto_443451 ?auto_443460 ) ) ( not ( = ?auto_443451 ?auto_443461 ) ) ( not ( = ?auto_443451 ?auto_443462 ) ) ( not ( = ?auto_443451 ?auto_443463 ) ) ( not ( = ?auto_443451 ?auto_443464 ) ) ( not ( = ?auto_443451 ?auto_443465 ) ) ( not ( = ?auto_443452 ?auto_443453 ) ) ( not ( = ?auto_443452 ?auto_443454 ) ) ( not ( = ?auto_443452 ?auto_443455 ) ) ( not ( = ?auto_443452 ?auto_443456 ) ) ( not ( = ?auto_443452 ?auto_443457 ) ) ( not ( = ?auto_443452 ?auto_443458 ) ) ( not ( = ?auto_443452 ?auto_443459 ) ) ( not ( = ?auto_443452 ?auto_443460 ) ) ( not ( = ?auto_443452 ?auto_443461 ) ) ( not ( = ?auto_443452 ?auto_443462 ) ) ( not ( = ?auto_443452 ?auto_443463 ) ) ( not ( = ?auto_443452 ?auto_443464 ) ) ( not ( = ?auto_443452 ?auto_443465 ) ) ( not ( = ?auto_443453 ?auto_443454 ) ) ( not ( = ?auto_443453 ?auto_443455 ) ) ( not ( = ?auto_443453 ?auto_443456 ) ) ( not ( = ?auto_443453 ?auto_443457 ) ) ( not ( = ?auto_443453 ?auto_443458 ) ) ( not ( = ?auto_443453 ?auto_443459 ) ) ( not ( = ?auto_443453 ?auto_443460 ) ) ( not ( = ?auto_443453 ?auto_443461 ) ) ( not ( = ?auto_443453 ?auto_443462 ) ) ( not ( = ?auto_443453 ?auto_443463 ) ) ( not ( = ?auto_443453 ?auto_443464 ) ) ( not ( = ?auto_443453 ?auto_443465 ) ) ( not ( = ?auto_443454 ?auto_443455 ) ) ( not ( = ?auto_443454 ?auto_443456 ) ) ( not ( = ?auto_443454 ?auto_443457 ) ) ( not ( = ?auto_443454 ?auto_443458 ) ) ( not ( = ?auto_443454 ?auto_443459 ) ) ( not ( = ?auto_443454 ?auto_443460 ) ) ( not ( = ?auto_443454 ?auto_443461 ) ) ( not ( = ?auto_443454 ?auto_443462 ) ) ( not ( = ?auto_443454 ?auto_443463 ) ) ( not ( = ?auto_443454 ?auto_443464 ) ) ( not ( = ?auto_443454 ?auto_443465 ) ) ( not ( = ?auto_443455 ?auto_443456 ) ) ( not ( = ?auto_443455 ?auto_443457 ) ) ( not ( = ?auto_443455 ?auto_443458 ) ) ( not ( = ?auto_443455 ?auto_443459 ) ) ( not ( = ?auto_443455 ?auto_443460 ) ) ( not ( = ?auto_443455 ?auto_443461 ) ) ( not ( = ?auto_443455 ?auto_443462 ) ) ( not ( = ?auto_443455 ?auto_443463 ) ) ( not ( = ?auto_443455 ?auto_443464 ) ) ( not ( = ?auto_443455 ?auto_443465 ) ) ( not ( = ?auto_443456 ?auto_443457 ) ) ( not ( = ?auto_443456 ?auto_443458 ) ) ( not ( = ?auto_443456 ?auto_443459 ) ) ( not ( = ?auto_443456 ?auto_443460 ) ) ( not ( = ?auto_443456 ?auto_443461 ) ) ( not ( = ?auto_443456 ?auto_443462 ) ) ( not ( = ?auto_443456 ?auto_443463 ) ) ( not ( = ?auto_443456 ?auto_443464 ) ) ( not ( = ?auto_443456 ?auto_443465 ) ) ( not ( = ?auto_443457 ?auto_443458 ) ) ( not ( = ?auto_443457 ?auto_443459 ) ) ( not ( = ?auto_443457 ?auto_443460 ) ) ( not ( = ?auto_443457 ?auto_443461 ) ) ( not ( = ?auto_443457 ?auto_443462 ) ) ( not ( = ?auto_443457 ?auto_443463 ) ) ( not ( = ?auto_443457 ?auto_443464 ) ) ( not ( = ?auto_443457 ?auto_443465 ) ) ( not ( = ?auto_443458 ?auto_443459 ) ) ( not ( = ?auto_443458 ?auto_443460 ) ) ( not ( = ?auto_443458 ?auto_443461 ) ) ( not ( = ?auto_443458 ?auto_443462 ) ) ( not ( = ?auto_443458 ?auto_443463 ) ) ( not ( = ?auto_443458 ?auto_443464 ) ) ( not ( = ?auto_443458 ?auto_443465 ) ) ( not ( = ?auto_443459 ?auto_443460 ) ) ( not ( = ?auto_443459 ?auto_443461 ) ) ( not ( = ?auto_443459 ?auto_443462 ) ) ( not ( = ?auto_443459 ?auto_443463 ) ) ( not ( = ?auto_443459 ?auto_443464 ) ) ( not ( = ?auto_443459 ?auto_443465 ) ) ( not ( = ?auto_443460 ?auto_443461 ) ) ( not ( = ?auto_443460 ?auto_443462 ) ) ( not ( = ?auto_443460 ?auto_443463 ) ) ( not ( = ?auto_443460 ?auto_443464 ) ) ( not ( = ?auto_443460 ?auto_443465 ) ) ( not ( = ?auto_443461 ?auto_443462 ) ) ( not ( = ?auto_443461 ?auto_443463 ) ) ( not ( = ?auto_443461 ?auto_443464 ) ) ( not ( = ?auto_443461 ?auto_443465 ) ) ( not ( = ?auto_443462 ?auto_443463 ) ) ( not ( = ?auto_443462 ?auto_443464 ) ) ( not ( = ?auto_443462 ?auto_443465 ) ) ( not ( = ?auto_443463 ?auto_443464 ) ) ( not ( = ?auto_443463 ?auto_443465 ) ) ( not ( = ?auto_443464 ?auto_443465 ) ) ( ON ?auto_443463 ?auto_443464 ) ( ON ?auto_443462 ?auto_443463 ) ( ON ?auto_443461 ?auto_443462 ) ( ON ?auto_443460 ?auto_443461 ) ( CLEAR ?auto_443458 ) ( ON ?auto_443459 ?auto_443460 ) ( CLEAR ?auto_443459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_443450 ?auto_443451 ?auto_443452 ?auto_443453 ?auto_443454 ?auto_443455 ?auto_443456 ?auto_443457 ?auto_443458 ?auto_443459 )
      ( MAKE-15PILE ?auto_443450 ?auto_443451 ?auto_443452 ?auto_443453 ?auto_443454 ?auto_443455 ?auto_443456 ?auto_443457 ?auto_443458 ?auto_443459 ?auto_443460 ?auto_443461 ?auto_443462 ?auto_443463 ?auto_443464 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443481 - BLOCK
      ?auto_443482 - BLOCK
      ?auto_443483 - BLOCK
      ?auto_443484 - BLOCK
      ?auto_443485 - BLOCK
      ?auto_443486 - BLOCK
      ?auto_443487 - BLOCK
      ?auto_443488 - BLOCK
      ?auto_443489 - BLOCK
      ?auto_443490 - BLOCK
      ?auto_443491 - BLOCK
      ?auto_443492 - BLOCK
      ?auto_443493 - BLOCK
      ?auto_443494 - BLOCK
      ?auto_443495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443495 ) ( ON-TABLE ?auto_443481 ) ( ON ?auto_443482 ?auto_443481 ) ( ON ?auto_443483 ?auto_443482 ) ( ON ?auto_443484 ?auto_443483 ) ( ON ?auto_443485 ?auto_443484 ) ( ON ?auto_443486 ?auto_443485 ) ( ON ?auto_443487 ?auto_443486 ) ( ON ?auto_443488 ?auto_443487 ) ( ON ?auto_443489 ?auto_443488 ) ( not ( = ?auto_443481 ?auto_443482 ) ) ( not ( = ?auto_443481 ?auto_443483 ) ) ( not ( = ?auto_443481 ?auto_443484 ) ) ( not ( = ?auto_443481 ?auto_443485 ) ) ( not ( = ?auto_443481 ?auto_443486 ) ) ( not ( = ?auto_443481 ?auto_443487 ) ) ( not ( = ?auto_443481 ?auto_443488 ) ) ( not ( = ?auto_443481 ?auto_443489 ) ) ( not ( = ?auto_443481 ?auto_443490 ) ) ( not ( = ?auto_443481 ?auto_443491 ) ) ( not ( = ?auto_443481 ?auto_443492 ) ) ( not ( = ?auto_443481 ?auto_443493 ) ) ( not ( = ?auto_443481 ?auto_443494 ) ) ( not ( = ?auto_443481 ?auto_443495 ) ) ( not ( = ?auto_443482 ?auto_443483 ) ) ( not ( = ?auto_443482 ?auto_443484 ) ) ( not ( = ?auto_443482 ?auto_443485 ) ) ( not ( = ?auto_443482 ?auto_443486 ) ) ( not ( = ?auto_443482 ?auto_443487 ) ) ( not ( = ?auto_443482 ?auto_443488 ) ) ( not ( = ?auto_443482 ?auto_443489 ) ) ( not ( = ?auto_443482 ?auto_443490 ) ) ( not ( = ?auto_443482 ?auto_443491 ) ) ( not ( = ?auto_443482 ?auto_443492 ) ) ( not ( = ?auto_443482 ?auto_443493 ) ) ( not ( = ?auto_443482 ?auto_443494 ) ) ( not ( = ?auto_443482 ?auto_443495 ) ) ( not ( = ?auto_443483 ?auto_443484 ) ) ( not ( = ?auto_443483 ?auto_443485 ) ) ( not ( = ?auto_443483 ?auto_443486 ) ) ( not ( = ?auto_443483 ?auto_443487 ) ) ( not ( = ?auto_443483 ?auto_443488 ) ) ( not ( = ?auto_443483 ?auto_443489 ) ) ( not ( = ?auto_443483 ?auto_443490 ) ) ( not ( = ?auto_443483 ?auto_443491 ) ) ( not ( = ?auto_443483 ?auto_443492 ) ) ( not ( = ?auto_443483 ?auto_443493 ) ) ( not ( = ?auto_443483 ?auto_443494 ) ) ( not ( = ?auto_443483 ?auto_443495 ) ) ( not ( = ?auto_443484 ?auto_443485 ) ) ( not ( = ?auto_443484 ?auto_443486 ) ) ( not ( = ?auto_443484 ?auto_443487 ) ) ( not ( = ?auto_443484 ?auto_443488 ) ) ( not ( = ?auto_443484 ?auto_443489 ) ) ( not ( = ?auto_443484 ?auto_443490 ) ) ( not ( = ?auto_443484 ?auto_443491 ) ) ( not ( = ?auto_443484 ?auto_443492 ) ) ( not ( = ?auto_443484 ?auto_443493 ) ) ( not ( = ?auto_443484 ?auto_443494 ) ) ( not ( = ?auto_443484 ?auto_443495 ) ) ( not ( = ?auto_443485 ?auto_443486 ) ) ( not ( = ?auto_443485 ?auto_443487 ) ) ( not ( = ?auto_443485 ?auto_443488 ) ) ( not ( = ?auto_443485 ?auto_443489 ) ) ( not ( = ?auto_443485 ?auto_443490 ) ) ( not ( = ?auto_443485 ?auto_443491 ) ) ( not ( = ?auto_443485 ?auto_443492 ) ) ( not ( = ?auto_443485 ?auto_443493 ) ) ( not ( = ?auto_443485 ?auto_443494 ) ) ( not ( = ?auto_443485 ?auto_443495 ) ) ( not ( = ?auto_443486 ?auto_443487 ) ) ( not ( = ?auto_443486 ?auto_443488 ) ) ( not ( = ?auto_443486 ?auto_443489 ) ) ( not ( = ?auto_443486 ?auto_443490 ) ) ( not ( = ?auto_443486 ?auto_443491 ) ) ( not ( = ?auto_443486 ?auto_443492 ) ) ( not ( = ?auto_443486 ?auto_443493 ) ) ( not ( = ?auto_443486 ?auto_443494 ) ) ( not ( = ?auto_443486 ?auto_443495 ) ) ( not ( = ?auto_443487 ?auto_443488 ) ) ( not ( = ?auto_443487 ?auto_443489 ) ) ( not ( = ?auto_443487 ?auto_443490 ) ) ( not ( = ?auto_443487 ?auto_443491 ) ) ( not ( = ?auto_443487 ?auto_443492 ) ) ( not ( = ?auto_443487 ?auto_443493 ) ) ( not ( = ?auto_443487 ?auto_443494 ) ) ( not ( = ?auto_443487 ?auto_443495 ) ) ( not ( = ?auto_443488 ?auto_443489 ) ) ( not ( = ?auto_443488 ?auto_443490 ) ) ( not ( = ?auto_443488 ?auto_443491 ) ) ( not ( = ?auto_443488 ?auto_443492 ) ) ( not ( = ?auto_443488 ?auto_443493 ) ) ( not ( = ?auto_443488 ?auto_443494 ) ) ( not ( = ?auto_443488 ?auto_443495 ) ) ( not ( = ?auto_443489 ?auto_443490 ) ) ( not ( = ?auto_443489 ?auto_443491 ) ) ( not ( = ?auto_443489 ?auto_443492 ) ) ( not ( = ?auto_443489 ?auto_443493 ) ) ( not ( = ?auto_443489 ?auto_443494 ) ) ( not ( = ?auto_443489 ?auto_443495 ) ) ( not ( = ?auto_443490 ?auto_443491 ) ) ( not ( = ?auto_443490 ?auto_443492 ) ) ( not ( = ?auto_443490 ?auto_443493 ) ) ( not ( = ?auto_443490 ?auto_443494 ) ) ( not ( = ?auto_443490 ?auto_443495 ) ) ( not ( = ?auto_443491 ?auto_443492 ) ) ( not ( = ?auto_443491 ?auto_443493 ) ) ( not ( = ?auto_443491 ?auto_443494 ) ) ( not ( = ?auto_443491 ?auto_443495 ) ) ( not ( = ?auto_443492 ?auto_443493 ) ) ( not ( = ?auto_443492 ?auto_443494 ) ) ( not ( = ?auto_443492 ?auto_443495 ) ) ( not ( = ?auto_443493 ?auto_443494 ) ) ( not ( = ?auto_443493 ?auto_443495 ) ) ( not ( = ?auto_443494 ?auto_443495 ) ) ( ON ?auto_443494 ?auto_443495 ) ( ON ?auto_443493 ?auto_443494 ) ( ON ?auto_443492 ?auto_443493 ) ( ON ?auto_443491 ?auto_443492 ) ( CLEAR ?auto_443489 ) ( ON ?auto_443490 ?auto_443491 ) ( CLEAR ?auto_443490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_443481 ?auto_443482 ?auto_443483 ?auto_443484 ?auto_443485 ?auto_443486 ?auto_443487 ?auto_443488 ?auto_443489 ?auto_443490 )
      ( MAKE-15PILE ?auto_443481 ?auto_443482 ?auto_443483 ?auto_443484 ?auto_443485 ?auto_443486 ?auto_443487 ?auto_443488 ?auto_443489 ?auto_443490 ?auto_443491 ?auto_443492 ?auto_443493 ?auto_443494 ?auto_443495 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443511 - BLOCK
      ?auto_443512 - BLOCK
      ?auto_443513 - BLOCK
      ?auto_443514 - BLOCK
      ?auto_443515 - BLOCK
      ?auto_443516 - BLOCK
      ?auto_443517 - BLOCK
      ?auto_443518 - BLOCK
      ?auto_443519 - BLOCK
      ?auto_443520 - BLOCK
      ?auto_443521 - BLOCK
      ?auto_443522 - BLOCK
      ?auto_443523 - BLOCK
      ?auto_443524 - BLOCK
      ?auto_443525 - BLOCK
    )
    :vars
    (
      ?auto_443526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443525 ?auto_443526 ) ( ON-TABLE ?auto_443511 ) ( ON ?auto_443512 ?auto_443511 ) ( ON ?auto_443513 ?auto_443512 ) ( ON ?auto_443514 ?auto_443513 ) ( ON ?auto_443515 ?auto_443514 ) ( ON ?auto_443516 ?auto_443515 ) ( ON ?auto_443517 ?auto_443516 ) ( ON ?auto_443518 ?auto_443517 ) ( not ( = ?auto_443511 ?auto_443512 ) ) ( not ( = ?auto_443511 ?auto_443513 ) ) ( not ( = ?auto_443511 ?auto_443514 ) ) ( not ( = ?auto_443511 ?auto_443515 ) ) ( not ( = ?auto_443511 ?auto_443516 ) ) ( not ( = ?auto_443511 ?auto_443517 ) ) ( not ( = ?auto_443511 ?auto_443518 ) ) ( not ( = ?auto_443511 ?auto_443519 ) ) ( not ( = ?auto_443511 ?auto_443520 ) ) ( not ( = ?auto_443511 ?auto_443521 ) ) ( not ( = ?auto_443511 ?auto_443522 ) ) ( not ( = ?auto_443511 ?auto_443523 ) ) ( not ( = ?auto_443511 ?auto_443524 ) ) ( not ( = ?auto_443511 ?auto_443525 ) ) ( not ( = ?auto_443511 ?auto_443526 ) ) ( not ( = ?auto_443512 ?auto_443513 ) ) ( not ( = ?auto_443512 ?auto_443514 ) ) ( not ( = ?auto_443512 ?auto_443515 ) ) ( not ( = ?auto_443512 ?auto_443516 ) ) ( not ( = ?auto_443512 ?auto_443517 ) ) ( not ( = ?auto_443512 ?auto_443518 ) ) ( not ( = ?auto_443512 ?auto_443519 ) ) ( not ( = ?auto_443512 ?auto_443520 ) ) ( not ( = ?auto_443512 ?auto_443521 ) ) ( not ( = ?auto_443512 ?auto_443522 ) ) ( not ( = ?auto_443512 ?auto_443523 ) ) ( not ( = ?auto_443512 ?auto_443524 ) ) ( not ( = ?auto_443512 ?auto_443525 ) ) ( not ( = ?auto_443512 ?auto_443526 ) ) ( not ( = ?auto_443513 ?auto_443514 ) ) ( not ( = ?auto_443513 ?auto_443515 ) ) ( not ( = ?auto_443513 ?auto_443516 ) ) ( not ( = ?auto_443513 ?auto_443517 ) ) ( not ( = ?auto_443513 ?auto_443518 ) ) ( not ( = ?auto_443513 ?auto_443519 ) ) ( not ( = ?auto_443513 ?auto_443520 ) ) ( not ( = ?auto_443513 ?auto_443521 ) ) ( not ( = ?auto_443513 ?auto_443522 ) ) ( not ( = ?auto_443513 ?auto_443523 ) ) ( not ( = ?auto_443513 ?auto_443524 ) ) ( not ( = ?auto_443513 ?auto_443525 ) ) ( not ( = ?auto_443513 ?auto_443526 ) ) ( not ( = ?auto_443514 ?auto_443515 ) ) ( not ( = ?auto_443514 ?auto_443516 ) ) ( not ( = ?auto_443514 ?auto_443517 ) ) ( not ( = ?auto_443514 ?auto_443518 ) ) ( not ( = ?auto_443514 ?auto_443519 ) ) ( not ( = ?auto_443514 ?auto_443520 ) ) ( not ( = ?auto_443514 ?auto_443521 ) ) ( not ( = ?auto_443514 ?auto_443522 ) ) ( not ( = ?auto_443514 ?auto_443523 ) ) ( not ( = ?auto_443514 ?auto_443524 ) ) ( not ( = ?auto_443514 ?auto_443525 ) ) ( not ( = ?auto_443514 ?auto_443526 ) ) ( not ( = ?auto_443515 ?auto_443516 ) ) ( not ( = ?auto_443515 ?auto_443517 ) ) ( not ( = ?auto_443515 ?auto_443518 ) ) ( not ( = ?auto_443515 ?auto_443519 ) ) ( not ( = ?auto_443515 ?auto_443520 ) ) ( not ( = ?auto_443515 ?auto_443521 ) ) ( not ( = ?auto_443515 ?auto_443522 ) ) ( not ( = ?auto_443515 ?auto_443523 ) ) ( not ( = ?auto_443515 ?auto_443524 ) ) ( not ( = ?auto_443515 ?auto_443525 ) ) ( not ( = ?auto_443515 ?auto_443526 ) ) ( not ( = ?auto_443516 ?auto_443517 ) ) ( not ( = ?auto_443516 ?auto_443518 ) ) ( not ( = ?auto_443516 ?auto_443519 ) ) ( not ( = ?auto_443516 ?auto_443520 ) ) ( not ( = ?auto_443516 ?auto_443521 ) ) ( not ( = ?auto_443516 ?auto_443522 ) ) ( not ( = ?auto_443516 ?auto_443523 ) ) ( not ( = ?auto_443516 ?auto_443524 ) ) ( not ( = ?auto_443516 ?auto_443525 ) ) ( not ( = ?auto_443516 ?auto_443526 ) ) ( not ( = ?auto_443517 ?auto_443518 ) ) ( not ( = ?auto_443517 ?auto_443519 ) ) ( not ( = ?auto_443517 ?auto_443520 ) ) ( not ( = ?auto_443517 ?auto_443521 ) ) ( not ( = ?auto_443517 ?auto_443522 ) ) ( not ( = ?auto_443517 ?auto_443523 ) ) ( not ( = ?auto_443517 ?auto_443524 ) ) ( not ( = ?auto_443517 ?auto_443525 ) ) ( not ( = ?auto_443517 ?auto_443526 ) ) ( not ( = ?auto_443518 ?auto_443519 ) ) ( not ( = ?auto_443518 ?auto_443520 ) ) ( not ( = ?auto_443518 ?auto_443521 ) ) ( not ( = ?auto_443518 ?auto_443522 ) ) ( not ( = ?auto_443518 ?auto_443523 ) ) ( not ( = ?auto_443518 ?auto_443524 ) ) ( not ( = ?auto_443518 ?auto_443525 ) ) ( not ( = ?auto_443518 ?auto_443526 ) ) ( not ( = ?auto_443519 ?auto_443520 ) ) ( not ( = ?auto_443519 ?auto_443521 ) ) ( not ( = ?auto_443519 ?auto_443522 ) ) ( not ( = ?auto_443519 ?auto_443523 ) ) ( not ( = ?auto_443519 ?auto_443524 ) ) ( not ( = ?auto_443519 ?auto_443525 ) ) ( not ( = ?auto_443519 ?auto_443526 ) ) ( not ( = ?auto_443520 ?auto_443521 ) ) ( not ( = ?auto_443520 ?auto_443522 ) ) ( not ( = ?auto_443520 ?auto_443523 ) ) ( not ( = ?auto_443520 ?auto_443524 ) ) ( not ( = ?auto_443520 ?auto_443525 ) ) ( not ( = ?auto_443520 ?auto_443526 ) ) ( not ( = ?auto_443521 ?auto_443522 ) ) ( not ( = ?auto_443521 ?auto_443523 ) ) ( not ( = ?auto_443521 ?auto_443524 ) ) ( not ( = ?auto_443521 ?auto_443525 ) ) ( not ( = ?auto_443521 ?auto_443526 ) ) ( not ( = ?auto_443522 ?auto_443523 ) ) ( not ( = ?auto_443522 ?auto_443524 ) ) ( not ( = ?auto_443522 ?auto_443525 ) ) ( not ( = ?auto_443522 ?auto_443526 ) ) ( not ( = ?auto_443523 ?auto_443524 ) ) ( not ( = ?auto_443523 ?auto_443525 ) ) ( not ( = ?auto_443523 ?auto_443526 ) ) ( not ( = ?auto_443524 ?auto_443525 ) ) ( not ( = ?auto_443524 ?auto_443526 ) ) ( not ( = ?auto_443525 ?auto_443526 ) ) ( ON ?auto_443524 ?auto_443525 ) ( ON ?auto_443523 ?auto_443524 ) ( ON ?auto_443522 ?auto_443523 ) ( ON ?auto_443521 ?auto_443522 ) ( ON ?auto_443520 ?auto_443521 ) ( CLEAR ?auto_443518 ) ( ON ?auto_443519 ?auto_443520 ) ( CLEAR ?auto_443519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_443511 ?auto_443512 ?auto_443513 ?auto_443514 ?auto_443515 ?auto_443516 ?auto_443517 ?auto_443518 ?auto_443519 )
      ( MAKE-15PILE ?auto_443511 ?auto_443512 ?auto_443513 ?auto_443514 ?auto_443515 ?auto_443516 ?auto_443517 ?auto_443518 ?auto_443519 ?auto_443520 ?auto_443521 ?auto_443522 ?auto_443523 ?auto_443524 ?auto_443525 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443542 - BLOCK
      ?auto_443543 - BLOCK
      ?auto_443544 - BLOCK
      ?auto_443545 - BLOCK
      ?auto_443546 - BLOCK
      ?auto_443547 - BLOCK
      ?auto_443548 - BLOCK
      ?auto_443549 - BLOCK
      ?auto_443550 - BLOCK
      ?auto_443551 - BLOCK
      ?auto_443552 - BLOCK
      ?auto_443553 - BLOCK
      ?auto_443554 - BLOCK
      ?auto_443555 - BLOCK
      ?auto_443556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443556 ) ( ON-TABLE ?auto_443542 ) ( ON ?auto_443543 ?auto_443542 ) ( ON ?auto_443544 ?auto_443543 ) ( ON ?auto_443545 ?auto_443544 ) ( ON ?auto_443546 ?auto_443545 ) ( ON ?auto_443547 ?auto_443546 ) ( ON ?auto_443548 ?auto_443547 ) ( ON ?auto_443549 ?auto_443548 ) ( not ( = ?auto_443542 ?auto_443543 ) ) ( not ( = ?auto_443542 ?auto_443544 ) ) ( not ( = ?auto_443542 ?auto_443545 ) ) ( not ( = ?auto_443542 ?auto_443546 ) ) ( not ( = ?auto_443542 ?auto_443547 ) ) ( not ( = ?auto_443542 ?auto_443548 ) ) ( not ( = ?auto_443542 ?auto_443549 ) ) ( not ( = ?auto_443542 ?auto_443550 ) ) ( not ( = ?auto_443542 ?auto_443551 ) ) ( not ( = ?auto_443542 ?auto_443552 ) ) ( not ( = ?auto_443542 ?auto_443553 ) ) ( not ( = ?auto_443542 ?auto_443554 ) ) ( not ( = ?auto_443542 ?auto_443555 ) ) ( not ( = ?auto_443542 ?auto_443556 ) ) ( not ( = ?auto_443543 ?auto_443544 ) ) ( not ( = ?auto_443543 ?auto_443545 ) ) ( not ( = ?auto_443543 ?auto_443546 ) ) ( not ( = ?auto_443543 ?auto_443547 ) ) ( not ( = ?auto_443543 ?auto_443548 ) ) ( not ( = ?auto_443543 ?auto_443549 ) ) ( not ( = ?auto_443543 ?auto_443550 ) ) ( not ( = ?auto_443543 ?auto_443551 ) ) ( not ( = ?auto_443543 ?auto_443552 ) ) ( not ( = ?auto_443543 ?auto_443553 ) ) ( not ( = ?auto_443543 ?auto_443554 ) ) ( not ( = ?auto_443543 ?auto_443555 ) ) ( not ( = ?auto_443543 ?auto_443556 ) ) ( not ( = ?auto_443544 ?auto_443545 ) ) ( not ( = ?auto_443544 ?auto_443546 ) ) ( not ( = ?auto_443544 ?auto_443547 ) ) ( not ( = ?auto_443544 ?auto_443548 ) ) ( not ( = ?auto_443544 ?auto_443549 ) ) ( not ( = ?auto_443544 ?auto_443550 ) ) ( not ( = ?auto_443544 ?auto_443551 ) ) ( not ( = ?auto_443544 ?auto_443552 ) ) ( not ( = ?auto_443544 ?auto_443553 ) ) ( not ( = ?auto_443544 ?auto_443554 ) ) ( not ( = ?auto_443544 ?auto_443555 ) ) ( not ( = ?auto_443544 ?auto_443556 ) ) ( not ( = ?auto_443545 ?auto_443546 ) ) ( not ( = ?auto_443545 ?auto_443547 ) ) ( not ( = ?auto_443545 ?auto_443548 ) ) ( not ( = ?auto_443545 ?auto_443549 ) ) ( not ( = ?auto_443545 ?auto_443550 ) ) ( not ( = ?auto_443545 ?auto_443551 ) ) ( not ( = ?auto_443545 ?auto_443552 ) ) ( not ( = ?auto_443545 ?auto_443553 ) ) ( not ( = ?auto_443545 ?auto_443554 ) ) ( not ( = ?auto_443545 ?auto_443555 ) ) ( not ( = ?auto_443545 ?auto_443556 ) ) ( not ( = ?auto_443546 ?auto_443547 ) ) ( not ( = ?auto_443546 ?auto_443548 ) ) ( not ( = ?auto_443546 ?auto_443549 ) ) ( not ( = ?auto_443546 ?auto_443550 ) ) ( not ( = ?auto_443546 ?auto_443551 ) ) ( not ( = ?auto_443546 ?auto_443552 ) ) ( not ( = ?auto_443546 ?auto_443553 ) ) ( not ( = ?auto_443546 ?auto_443554 ) ) ( not ( = ?auto_443546 ?auto_443555 ) ) ( not ( = ?auto_443546 ?auto_443556 ) ) ( not ( = ?auto_443547 ?auto_443548 ) ) ( not ( = ?auto_443547 ?auto_443549 ) ) ( not ( = ?auto_443547 ?auto_443550 ) ) ( not ( = ?auto_443547 ?auto_443551 ) ) ( not ( = ?auto_443547 ?auto_443552 ) ) ( not ( = ?auto_443547 ?auto_443553 ) ) ( not ( = ?auto_443547 ?auto_443554 ) ) ( not ( = ?auto_443547 ?auto_443555 ) ) ( not ( = ?auto_443547 ?auto_443556 ) ) ( not ( = ?auto_443548 ?auto_443549 ) ) ( not ( = ?auto_443548 ?auto_443550 ) ) ( not ( = ?auto_443548 ?auto_443551 ) ) ( not ( = ?auto_443548 ?auto_443552 ) ) ( not ( = ?auto_443548 ?auto_443553 ) ) ( not ( = ?auto_443548 ?auto_443554 ) ) ( not ( = ?auto_443548 ?auto_443555 ) ) ( not ( = ?auto_443548 ?auto_443556 ) ) ( not ( = ?auto_443549 ?auto_443550 ) ) ( not ( = ?auto_443549 ?auto_443551 ) ) ( not ( = ?auto_443549 ?auto_443552 ) ) ( not ( = ?auto_443549 ?auto_443553 ) ) ( not ( = ?auto_443549 ?auto_443554 ) ) ( not ( = ?auto_443549 ?auto_443555 ) ) ( not ( = ?auto_443549 ?auto_443556 ) ) ( not ( = ?auto_443550 ?auto_443551 ) ) ( not ( = ?auto_443550 ?auto_443552 ) ) ( not ( = ?auto_443550 ?auto_443553 ) ) ( not ( = ?auto_443550 ?auto_443554 ) ) ( not ( = ?auto_443550 ?auto_443555 ) ) ( not ( = ?auto_443550 ?auto_443556 ) ) ( not ( = ?auto_443551 ?auto_443552 ) ) ( not ( = ?auto_443551 ?auto_443553 ) ) ( not ( = ?auto_443551 ?auto_443554 ) ) ( not ( = ?auto_443551 ?auto_443555 ) ) ( not ( = ?auto_443551 ?auto_443556 ) ) ( not ( = ?auto_443552 ?auto_443553 ) ) ( not ( = ?auto_443552 ?auto_443554 ) ) ( not ( = ?auto_443552 ?auto_443555 ) ) ( not ( = ?auto_443552 ?auto_443556 ) ) ( not ( = ?auto_443553 ?auto_443554 ) ) ( not ( = ?auto_443553 ?auto_443555 ) ) ( not ( = ?auto_443553 ?auto_443556 ) ) ( not ( = ?auto_443554 ?auto_443555 ) ) ( not ( = ?auto_443554 ?auto_443556 ) ) ( not ( = ?auto_443555 ?auto_443556 ) ) ( ON ?auto_443555 ?auto_443556 ) ( ON ?auto_443554 ?auto_443555 ) ( ON ?auto_443553 ?auto_443554 ) ( ON ?auto_443552 ?auto_443553 ) ( ON ?auto_443551 ?auto_443552 ) ( CLEAR ?auto_443549 ) ( ON ?auto_443550 ?auto_443551 ) ( CLEAR ?auto_443550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_443542 ?auto_443543 ?auto_443544 ?auto_443545 ?auto_443546 ?auto_443547 ?auto_443548 ?auto_443549 ?auto_443550 )
      ( MAKE-15PILE ?auto_443542 ?auto_443543 ?auto_443544 ?auto_443545 ?auto_443546 ?auto_443547 ?auto_443548 ?auto_443549 ?auto_443550 ?auto_443551 ?auto_443552 ?auto_443553 ?auto_443554 ?auto_443555 ?auto_443556 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443572 - BLOCK
      ?auto_443573 - BLOCK
      ?auto_443574 - BLOCK
      ?auto_443575 - BLOCK
      ?auto_443576 - BLOCK
      ?auto_443577 - BLOCK
      ?auto_443578 - BLOCK
      ?auto_443579 - BLOCK
      ?auto_443580 - BLOCK
      ?auto_443581 - BLOCK
      ?auto_443582 - BLOCK
      ?auto_443583 - BLOCK
      ?auto_443584 - BLOCK
      ?auto_443585 - BLOCK
      ?auto_443586 - BLOCK
    )
    :vars
    (
      ?auto_443587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443586 ?auto_443587 ) ( ON-TABLE ?auto_443572 ) ( ON ?auto_443573 ?auto_443572 ) ( ON ?auto_443574 ?auto_443573 ) ( ON ?auto_443575 ?auto_443574 ) ( ON ?auto_443576 ?auto_443575 ) ( ON ?auto_443577 ?auto_443576 ) ( ON ?auto_443578 ?auto_443577 ) ( not ( = ?auto_443572 ?auto_443573 ) ) ( not ( = ?auto_443572 ?auto_443574 ) ) ( not ( = ?auto_443572 ?auto_443575 ) ) ( not ( = ?auto_443572 ?auto_443576 ) ) ( not ( = ?auto_443572 ?auto_443577 ) ) ( not ( = ?auto_443572 ?auto_443578 ) ) ( not ( = ?auto_443572 ?auto_443579 ) ) ( not ( = ?auto_443572 ?auto_443580 ) ) ( not ( = ?auto_443572 ?auto_443581 ) ) ( not ( = ?auto_443572 ?auto_443582 ) ) ( not ( = ?auto_443572 ?auto_443583 ) ) ( not ( = ?auto_443572 ?auto_443584 ) ) ( not ( = ?auto_443572 ?auto_443585 ) ) ( not ( = ?auto_443572 ?auto_443586 ) ) ( not ( = ?auto_443572 ?auto_443587 ) ) ( not ( = ?auto_443573 ?auto_443574 ) ) ( not ( = ?auto_443573 ?auto_443575 ) ) ( not ( = ?auto_443573 ?auto_443576 ) ) ( not ( = ?auto_443573 ?auto_443577 ) ) ( not ( = ?auto_443573 ?auto_443578 ) ) ( not ( = ?auto_443573 ?auto_443579 ) ) ( not ( = ?auto_443573 ?auto_443580 ) ) ( not ( = ?auto_443573 ?auto_443581 ) ) ( not ( = ?auto_443573 ?auto_443582 ) ) ( not ( = ?auto_443573 ?auto_443583 ) ) ( not ( = ?auto_443573 ?auto_443584 ) ) ( not ( = ?auto_443573 ?auto_443585 ) ) ( not ( = ?auto_443573 ?auto_443586 ) ) ( not ( = ?auto_443573 ?auto_443587 ) ) ( not ( = ?auto_443574 ?auto_443575 ) ) ( not ( = ?auto_443574 ?auto_443576 ) ) ( not ( = ?auto_443574 ?auto_443577 ) ) ( not ( = ?auto_443574 ?auto_443578 ) ) ( not ( = ?auto_443574 ?auto_443579 ) ) ( not ( = ?auto_443574 ?auto_443580 ) ) ( not ( = ?auto_443574 ?auto_443581 ) ) ( not ( = ?auto_443574 ?auto_443582 ) ) ( not ( = ?auto_443574 ?auto_443583 ) ) ( not ( = ?auto_443574 ?auto_443584 ) ) ( not ( = ?auto_443574 ?auto_443585 ) ) ( not ( = ?auto_443574 ?auto_443586 ) ) ( not ( = ?auto_443574 ?auto_443587 ) ) ( not ( = ?auto_443575 ?auto_443576 ) ) ( not ( = ?auto_443575 ?auto_443577 ) ) ( not ( = ?auto_443575 ?auto_443578 ) ) ( not ( = ?auto_443575 ?auto_443579 ) ) ( not ( = ?auto_443575 ?auto_443580 ) ) ( not ( = ?auto_443575 ?auto_443581 ) ) ( not ( = ?auto_443575 ?auto_443582 ) ) ( not ( = ?auto_443575 ?auto_443583 ) ) ( not ( = ?auto_443575 ?auto_443584 ) ) ( not ( = ?auto_443575 ?auto_443585 ) ) ( not ( = ?auto_443575 ?auto_443586 ) ) ( not ( = ?auto_443575 ?auto_443587 ) ) ( not ( = ?auto_443576 ?auto_443577 ) ) ( not ( = ?auto_443576 ?auto_443578 ) ) ( not ( = ?auto_443576 ?auto_443579 ) ) ( not ( = ?auto_443576 ?auto_443580 ) ) ( not ( = ?auto_443576 ?auto_443581 ) ) ( not ( = ?auto_443576 ?auto_443582 ) ) ( not ( = ?auto_443576 ?auto_443583 ) ) ( not ( = ?auto_443576 ?auto_443584 ) ) ( not ( = ?auto_443576 ?auto_443585 ) ) ( not ( = ?auto_443576 ?auto_443586 ) ) ( not ( = ?auto_443576 ?auto_443587 ) ) ( not ( = ?auto_443577 ?auto_443578 ) ) ( not ( = ?auto_443577 ?auto_443579 ) ) ( not ( = ?auto_443577 ?auto_443580 ) ) ( not ( = ?auto_443577 ?auto_443581 ) ) ( not ( = ?auto_443577 ?auto_443582 ) ) ( not ( = ?auto_443577 ?auto_443583 ) ) ( not ( = ?auto_443577 ?auto_443584 ) ) ( not ( = ?auto_443577 ?auto_443585 ) ) ( not ( = ?auto_443577 ?auto_443586 ) ) ( not ( = ?auto_443577 ?auto_443587 ) ) ( not ( = ?auto_443578 ?auto_443579 ) ) ( not ( = ?auto_443578 ?auto_443580 ) ) ( not ( = ?auto_443578 ?auto_443581 ) ) ( not ( = ?auto_443578 ?auto_443582 ) ) ( not ( = ?auto_443578 ?auto_443583 ) ) ( not ( = ?auto_443578 ?auto_443584 ) ) ( not ( = ?auto_443578 ?auto_443585 ) ) ( not ( = ?auto_443578 ?auto_443586 ) ) ( not ( = ?auto_443578 ?auto_443587 ) ) ( not ( = ?auto_443579 ?auto_443580 ) ) ( not ( = ?auto_443579 ?auto_443581 ) ) ( not ( = ?auto_443579 ?auto_443582 ) ) ( not ( = ?auto_443579 ?auto_443583 ) ) ( not ( = ?auto_443579 ?auto_443584 ) ) ( not ( = ?auto_443579 ?auto_443585 ) ) ( not ( = ?auto_443579 ?auto_443586 ) ) ( not ( = ?auto_443579 ?auto_443587 ) ) ( not ( = ?auto_443580 ?auto_443581 ) ) ( not ( = ?auto_443580 ?auto_443582 ) ) ( not ( = ?auto_443580 ?auto_443583 ) ) ( not ( = ?auto_443580 ?auto_443584 ) ) ( not ( = ?auto_443580 ?auto_443585 ) ) ( not ( = ?auto_443580 ?auto_443586 ) ) ( not ( = ?auto_443580 ?auto_443587 ) ) ( not ( = ?auto_443581 ?auto_443582 ) ) ( not ( = ?auto_443581 ?auto_443583 ) ) ( not ( = ?auto_443581 ?auto_443584 ) ) ( not ( = ?auto_443581 ?auto_443585 ) ) ( not ( = ?auto_443581 ?auto_443586 ) ) ( not ( = ?auto_443581 ?auto_443587 ) ) ( not ( = ?auto_443582 ?auto_443583 ) ) ( not ( = ?auto_443582 ?auto_443584 ) ) ( not ( = ?auto_443582 ?auto_443585 ) ) ( not ( = ?auto_443582 ?auto_443586 ) ) ( not ( = ?auto_443582 ?auto_443587 ) ) ( not ( = ?auto_443583 ?auto_443584 ) ) ( not ( = ?auto_443583 ?auto_443585 ) ) ( not ( = ?auto_443583 ?auto_443586 ) ) ( not ( = ?auto_443583 ?auto_443587 ) ) ( not ( = ?auto_443584 ?auto_443585 ) ) ( not ( = ?auto_443584 ?auto_443586 ) ) ( not ( = ?auto_443584 ?auto_443587 ) ) ( not ( = ?auto_443585 ?auto_443586 ) ) ( not ( = ?auto_443585 ?auto_443587 ) ) ( not ( = ?auto_443586 ?auto_443587 ) ) ( ON ?auto_443585 ?auto_443586 ) ( ON ?auto_443584 ?auto_443585 ) ( ON ?auto_443583 ?auto_443584 ) ( ON ?auto_443582 ?auto_443583 ) ( ON ?auto_443581 ?auto_443582 ) ( ON ?auto_443580 ?auto_443581 ) ( CLEAR ?auto_443578 ) ( ON ?auto_443579 ?auto_443580 ) ( CLEAR ?auto_443579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_443572 ?auto_443573 ?auto_443574 ?auto_443575 ?auto_443576 ?auto_443577 ?auto_443578 ?auto_443579 )
      ( MAKE-15PILE ?auto_443572 ?auto_443573 ?auto_443574 ?auto_443575 ?auto_443576 ?auto_443577 ?auto_443578 ?auto_443579 ?auto_443580 ?auto_443581 ?auto_443582 ?auto_443583 ?auto_443584 ?auto_443585 ?auto_443586 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443603 - BLOCK
      ?auto_443604 - BLOCK
      ?auto_443605 - BLOCK
      ?auto_443606 - BLOCK
      ?auto_443607 - BLOCK
      ?auto_443608 - BLOCK
      ?auto_443609 - BLOCK
      ?auto_443610 - BLOCK
      ?auto_443611 - BLOCK
      ?auto_443612 - BLOCK
      ?auto_443613 - BLOCK
      ?auto_443614 - BLOCK
      ?auto_443615 - BLOCK
      ?auto_443616 - BLOCK
      ?auto_443617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443617 ) ( ON-TABLE ?auto_443603 ) ( ON ?auto_443604 ?auto_443603 ) ( ON ?auto_443605 ?auto_443604 ) ( ON ?auto_443606 ?auto_443605 ) ( ON ?auto_443607 ?auto_443606 ) ( ON ?auto_443608 ?auto_443607 ) ( ON ?auto_443609 ?auto_443608 ) ( not ( = ?auto_443603 ?auto_443604 ) ) ( not ( = ?auto_443603 ?auto_443605 ) ) ( not ( = ?auto_443603 ?auto_443606 ) ) ( not ( = ?auto_443603 ?auto_443607 ) ) ( not ( = ?auto_443603 ?auto_443608 ) ) ( not ( = ?auto_443603 ?auto_443609 ) ) ( not ( = ?auto_443603 ?auto_443610 ) ) ( not ( = ?auto_443603 ?auto_443611 ) ) ( not ( = ?auto_443603 ?auto_443612 ) ) ( not ( = ?auto_443603 ?auto_443613 ) ) ( not ( = ?auto_443603 ?auto_443614 ) ) ( not ( = ?auto_443603 ?auto_443615 ) ) ( not ( = ?auto_443603 ?auto_443616 ) ) ( not ( = ?auto_443603 ?auto_443617 ) ) ( not ( = ?auto_443604 ?auto_443605 ) ) ( not ( = ?auto_443604 ?auto_443606 ) ) ( not ( = ?auto_443604 ?auto_443607 ) ) ( not ( = ?auto_443604 ?auto_443608 ) ) ( not ( = ?auto_443604 ?auto_443609 ) ) ( not ( = ?auto_443604 ?auto_443610 ) ) ( not ( = ?auto_443604 ?auto_443611 ) ) ( not ( = ?auto_443604 ?auto_443612 ) ) ( not ( = ?auto_443604 ?auto_443613 ) ) ( not ( = ?auto_443604 ?auto_443614 ) ) ( not ( = ?auto_443604 ?auto_443615 ) ) ( not ( = ?auto_443604 ?auto_443616 ) ) ( not ( = ?auto_443604 ?auto_443617 ) ) ( not ( = ?auto_443605 ?auto_443606 ) ) ( not ( = ?auto_443605 ?auto_443607 ) ) ( not ( = ?auto_443605 ?auto_443608 ) ) ( not ( = ?auto_443605 ?auto_443609 ) ) ( not ( = ?auto_443605 ?auto_443610 ) ) ( not ( = ?auto_443605 ?auto_443611 ) ) ( not ( = ?auto_443605 ?auto_443612 ) ) ( not ( = ?auto_443605 ?auto_443613 ) ) ( not ( = ?auto_443605 ?auto_443614 ) ) ( not ( = ?auto_443605 ?auto_443615 ) ) ( not ( = ?auto_443605 ?auto_443616 ) ) ( not ( = ?auto_443605 ?auto_443617 ) ) ( not ( = ?auto_443606 ?auto_443607 ) ) ( not ( = ?auto_443606 ?auto_443608 ) ) ( not ( = ?auto_443606 ?auto_443609 ) ) ( not ( = ?auto_443606 ?auto_443610 ) ) ( not ( = ?auto_443606 ?auto_443611 ) ) ( not ( = ?auto_443606 ?auto_443612 ) ) ( not ( = ?auto_443606 ?auto_443613 ) ) ( not ( = ?auto_443606 ?auto_443614 ) ) ( not ( = ?auto_443606 ?auto_443615 ) ) ( not ( = ?auto_443606 ?auto_443616 ) ) ( not ( = ?auto_443606 ?auto_443617 ) ) ( not ( = ?auto_443607 ?auto_443608 ) ) ( not ( = ?auto_443607 ?auto_443609 ) ) ( not ( = ?auto_443607 ?auto_443610 ) ) ( not ( = ?auto_443607 ?auto_443611 ) ) ( not ( = ?auto_443607 ?auto_443612 ) ) ( not ( = ?auto_443607 ?auto_443613 ) ) ( not ( = ?auto_443607 ?auto_443614 ) ) ( not ( = ?auto_443607 ?auto_443615 ) ) ( not ( = ?auto_443607 ?auto_443616 ) ) ( not ( = ?auto_443607 ?auto_443617 ) ) ( not ( = ?auto_443608 ?auto_443609 ) ) ( not ( = ?auto_443608 ?auto_443610 ) ) ( not ( = ?auto_443608 ?auto_443611 ) ) ( not ( = ?auto_443608 ?auto_443612 ) ) ( not ( = ?auto_443608 ?auto_443613 ) ) ( not ( = ?auto_443608 ?auto_443614 ) ) ( not ( = ?auto_443608 ?auto_443615 ) ) ( not ( = ?auto_443608 ?auto_443616 ) ) ( not ( = ?auto_443608 ?auto_443617 ) ) ( not ( = ?auto_443609 ?auto_443610 ) ) ( not ( = ?auto_443609 ?auto_443611 ) ) ( not ( = ?auto_443609 ?auto_443612 ) ) ( not ( = ?auto_443609 ?auto_443613 ) ) ( not ( = ?auto_443609 ?auto_443614 ) ) ( not ( = ?auto_443609 ?auto_443615 ) ) ( not ( = ?auto_443609 ?auto_443616 ) ) ( not ( = ?auto_443609 ?auto_443617 ) ) ( not ( = ?auto_443610 ?auto_443611 ) ) ( not ( = ?auto_443610 ?auto_443612 ) ) ( not ( = ?auto_443610 ?auto_443613 ) ) ( not ( = ?auto_443610 ?auto_443614 ) ) ( not ( = ?auto_443610 ?auto_443615 ) ) ( not ( = ?auto_443610 ?auto_443616 ) ) ( not ( = ?auto_443610 ?auto_443617 ) ) ( not ( = ?auto_443611 ?auto_443612 ) ) ( not ( = ?auto_443611 ?auto_443613 ) ) ( not ( = ?auto_443611 ?auto_443614 ) ) ( not ( = ?auto_443611 ?auto_443615 ) ) ( not ( = ?auto_443611 ?auto_443616 ) ) ( not ( = ?auto_443611 ?auto_443617 ) ) ( not ( = ?auto_443612 ?auto_443613 ) ) ( not ( = ?auto_443612 ?auto_443614 ) ) ( not ( = ?auto_443612 ?auto_443615 ) ) ( not ( = ?auto_443612 ?auto_443616 ) ) ( not ( = ?auto_443612 ?auto_443617 ) ) ( not ( = ?auto_443613 ?auto_443614 ) ) ( not ( = ?auto_443613 ?auto_443615 ) ) ( not ( = ?auto_443613 ?auto_443616 ) ) ( not ( = ?auto_443613 ?auto_443617 ) ) ( not ( = ?auto_443614 ?auto_443615 ) ) ( not ( = ?auto_443614 ?auto_443616 ) ) ( not ( = ?auto_443614 ?auto_443617 ) ) ( not ( = ?auto_443615 ?auto_443616 ) ) ( not ( = ?auto_443615 ?auto_443617 ) ) ( not ( = ?auto_443616 ?auto_443617 ) ) ( ON ?auto_443616 ?auto_443617 ) ( ON ?auto_443615 ?auto_443616 ) ( ON ?auto_443614 ?auto_443615 ) ( ON ?auto_443613 ?auto_443614 ) ( ON ?auto_443612 ?auto_443613 ) ( ON ?auto_443611 ?auto_443612 ) ( CLEAR ?auto_443609 ) ( ON ?auto_443610 ?auto_443611 ) ( CLEAR ?auto_443610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_443603 ?auto_443604 ?auto_443605 ?auto_443606 ?auto_443607 ?auto_443608 ?auto_443609 ?auto_443610 )
      ( MAKE-15PILE ?auto_443603 ?auto_443604 ?auto_443605 ?auto_443606 ?auto_443607 ?auto_443608 ?auto_443609 ?auto_443610 ?auto_443611 ?auto_443612 ?auto_443613 ?auto_443614 ?auto_443615 ?auto_443616 ?auto_443617 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443633 - BLOCK
      ?auto_443634 - BLOCK
      ?auto_443635 - BLOCK
      ?auto_443636 - BLOCK
      ?auto_443637 - BLOCK
      ?auto_443638 - BLOCK
      ?auto_443639 - BLOCK
      ?auto_443640 - BLOCK
      ?auto_443641 - BLOCK
      ?auto_443642 - BLOCK
      ?auto_443643 - BLOCK
      ?auto_443644 - BLOCK
      ?auto_443645 - BLOCK
      ?auto_443646 - BLOCK
      ?auto_443647 - BLOCK
    )
    :vars
    (
      ?auto_443648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443647 ?auto_443648 ) ( ON-TABLE ?auto_443633 ) ( ON ?auto_443634 ?auto_443633 ) ( ON ?auto_443635 ?auto_443634 ) ( ON ?auto_443636 ?auto_443635 ) ( ON ?auto_443637 ?auto_443636 ) ( ON ?auto_443638 ?auto_443637 ) ( not ( = ?auto_443633 ?auto_443634 ) ) ( not ( = ?auto_443633 ?auto_443635 ) ) ( not ( = ?auto_443633 ?auto_443636 ) ) ( not ( = ?auto_443633 ?auto_443637 ) ) ( not ( = ?auto_443633 ?auto_443638 ) ) ( not ( = ?auto_443633 ?auto_443639 ) ) ( not ( = ?auto_443633 ?auto_443640 ) ) ( not ( = ?auto_443633 ?auto_443641 ) ) ( not ( = ?auto_443633 ?auto_443642 ) ) ( not ( = ?auto_443633 ?auto_443643 ) ) ( not ( = ?auto_443633 ?auto_443644 ) ) ( not ( = ?auto_443633 ?auto_443645 ) ) ( not ( = ?auto_443633 ?auto_443646 ) ) ( not ( = ?auto_443633 ?auto_443647 ) ) ( not ( = ?auto_443633 ?auto_443648 ) ) ( not ( = ?auto_443634 ?auto_443635 ) ) ( not ( = ?auto_443634 ?auto_443636 ) ) ( not ( = ?auto_443634 ?auto_443637 ) ) ( not ( = ?auto_443634 ?auto_443638 ) ) ( not ( = ?auto_443634 ?auto_443639 ) ) ( not ( = ?auto_443634 ?auto_443640 ) ) ( not ( = ?auto_443634 ?auto_443641 ) ) ( not ( = ?auto_443634 ?auto_443642 ) ) ( not ( = ?auto_443634 ?auto_443643 ) ) ( not ( = ?auto_443634 ?auto_443644 ) ) ( not ( = ?auto_443634 ?auto_443645 ) ) ( not ( = ?auto_443634 ?auto_443646 ) ) ( not ( = ?auto_443634 ?auto_443647 ) ) ( not ( = ?auto_443634 ?auto_443648 ) ) ( not ( = ?auto_443635 ?auto_443636 ) ) ( not ( = ?auto_443635 ?auto_443637 ) ) ( not ( = ?auto_443635 ?auto_443638 ) ) ( not ( = ?auto_443635 ?auto_443639 ) ) ( not ( = ?auto_443635 ?auto_443640 ) ) ( not ( = ?auto_443635 ?auto_443641 ) ) ( not ( = ?auto_443635 ?auto_443642 ) ) ( not ( = ?auto_443635 ?auto_443643 ) ) ( not ( = ?auto_443635 ?auto_443644 ) ) ( not ( = ?auto_443635 ?auto_443645 ) ) ( not ( = ?auto_443635 ?auto_443646 ) ) ( not ( = ?auto_443635 ?auto_443647 ) ) ( not ( = ?auto_443635 ?auto_443648 ) ) ( not ( = ?auto_443636 ?auto_443637 ) ) ( not ( = ?auto_443636 ?auto_443638 ) ) ( not ( = ?auto_443636 ?auto_443639 ) ) ( not ( = ?auto_443636 ?auto_443640 ) ) ( not ( = ?auto_443636 ?auto_443641 ) ) ( not ( = ?auto_443636 ?auto_443642 ) ) ( not ( = ?auto_443636 ?auto_443643 ) ) ( not ( = ?auto_443636 ?auto_443644 ) ) ( not ( = ?auto_443636 ?auto_443645 ) ) ( not ( = ?auto_443636 ?auto_443646 ) ) ( not ( = ?auto_443636 ?auto_443647 ) ) ( not ( = ?auto_443636 ?auto_443648 ) ) ( not ( = ?auto_443637 ?auto_443638 ) ) ( not ( = ?auto_443637 ?auto_443639 ) ) ( not ( = ?auto_443637 ?auto_443640 ) ) ( not ( = ?auto_443637 ?auto_443641 ) ) ( not ( = ?auto_443637 ?auto_443642 ) ) ( not ( = ?auto_443637 ?auto_443643 ) ) ( not ( = ?auto_443637 ?auto_443644 ) ) ( not ( = ?auto_443637 ?auto_443645 ) ) ( not ( = ?auto_443637 ?auto_443646 ) ) ( not ( = ?auto_443637 ?auto_443647 ) ) ( not ( = ?auto_443637 ?auto_443648 ) ) ( not ( = ?auto_443638 ?auto_443639 ) ) ( not ( = ?auto_443638 ?auto_443640 ) ) ( not ( = ?auto_443638 ?auto_443641 ) ) ( not ( = ?auto_443638 ?auto_443642 ) ) ( not ( = ?auto_443638 ?auto_443643 ) ) ( not ( = ?auto_443638 ?auto_443644 ) ) ( not ( = ?auto_443638 ?auto_443645 ) ) ( not ( = ?auto_443638 ?auto_443646 ) ) ( not ( = ?auto_443638 ?auto_443647 ) ) ( not ( = ?auto_443638 ?auto_443648 ) ) ( not ( = ?auto_443639 ?auto_443640 ) ) ( not ( = ?auto_443639 ?auto_443641 ) ) ( not ( = ?auto_443639 ?auto_443642 ) ) ( not ( = ?auto_443639 ?auto_443643 ) ) ( not ( = ?auto_443639 ?auto_443644 ) ) ( not ( = ?auto_443639 ?auto_443645 ) ) ( not ( = ?auto_443639 ?auto_443646 ) ) ( not ( = ?auto_443639 ?auto_443647 ) ) ( not ( = ?auto_443639 ?auto_443648 ) ) ( not ( = ?auto_443640 ?auto_443641 ) ) ( not ( = ?auto_443640 ?auto_443642 ) ) ( not ( = ?auto_443640 ?auto_443643 ) ) ( not ( = ?auto_443640 ?auto_443644 ) ) ( not ( = ?auto_443640 ?auto_443645 ) ) ( not ( = ?auto_443640 ?auto_443646 ) ) ( not ( = ?auto_443640 ?auto_443647 ) ) ( not ( = ?auto_443640 ?auto_443648 ) ) ( not ( = ?auto_443641 ?auto_443642 ) ) ( not ( = ?auto_443641 ?auto_443643 ) ) ( not ( = ?auto_443641 ?auto_443644 ) ) ( not ( = ?auto_443641 ?auto_443645 ) ) ( not ( = ?auto_443641 ?auto_443646 ) ) ( not ( = ?auto_443641 ?auto_443647 ) ) ( not ( = ?auto_443641 ?auto_443648 ) ) ( not ( = ?auto_443642 ?auto_443643 ) ) ( not ( = ?auto_443642 ?auto_443644 ) ) ( not ( = ?auto_443642 ?auto_443645 ) ) ( not ( = ?auto_443642 ?auto_443646 ) ) ( not ( = ?auto_443642 ?auto_443647 ) ) ( not ( = ?auto_443642 ?auto_443648 ) ) ( not ( = ?auto_443643 ?auto_443644 ) ) ( not ( = ?auto_443643 ?auto_443645 ) ) ( not ( = ?auto_443643 ?auto_443646 ) ) ( not ( = ?auto_443643 ?auto_443647 ) ) ( not ( = ?auto_443643 ?auto_443648 ) ) ( not ( = ?auto_443644 ?auto_443645 ) ) ( not ( = ?auto_443644 ?auto_443646 ) ) ( not ( = ?auto_443644 ?auto_443647 ) ) ( not ( = ?auto_443644 ?auto_443648 ) ) ( not ( = ?auto_443645 ?auto_443646 ) ) ( not ( = ?auto_443645 ?auto_443647 ) ) ( not ( = ?auto_443645 ?auto_443648 ) ) ( not ( = ?auto_443646 ?auto_443647 ) ) ( not ( = ?auto_443646 ?auto_443648 ) ) ( not ( = ?auto_443647 ?auto_443648 ) ) ( ON ?auto_443646 ?auto_443647 ) ( ON ?auto_443645 ?auto_443646 ) ( ON ?auto_443644 ?auto_443645 ) ( ON ?auto_443643 ?auto_443644 ) ( ON ?auto_443642 ?auto_443643 ) ( ON ?auto_443641 ?auto_443642 ) ( ON ?auto_443640 ?auto_443641 ) ( CLEAR ?auto_443638 ) ( ON ?auto_443639 ?auto_443640 ) ( CLEAR ?auto_443639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_443633 ?auto_443634 ?auto_443635 ?auto_443636 ?auto_443637 ?auto_443638 ?auto_443639 )
      ( MAKE-15PILE ?auto_443633 ?auto_443634 ?auto_443635 ?auto_443636 ?auto_443637 ?auto_443638 ?auto_443639 ?auto_443640 ?auto_443641 ?auto_443642 ?auto_443643 ?auto_443644 ?auto_443645 ?auto_443646 ?auto_443647 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443664 - BLOCK
      ?auto_443665 - BLOCK
      ?auto_443666 - BLOCK
      ?auto_443667 - BLOCK
      ?auto_443668 - BLOCK
      ?auto_443669 - BLOCK
      ?auto_443670 - BLOCK
      ?auto_443671 - BLOCK
      ?auto_443672 - BLOCK
      ?auto_443673 - BLOCK
      ?auto_443674 - BLOCK
      ?auto_443675 - BLOCK
      ?auto_443676 - BLOCK
      ?auto_443677 - BLOCK
      ?auto_443678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443678 ) ( ON-TABLE ?auto_443664 ) ( ON ?auto_443665 ?auto_443664 ) ( ON ?auto_443666 ?auto_443665 ) ( ON ?auto_443667 ?auto_443666 ) ( ON ?auto_443668 ?auto_443667 ) ( ON ?auto_443669 ?auto_443668 ) ( not ( = ?auto_443664 ?auto_443665 ) ) ( not ( = ?auto_443664 ?auto_443666 ) ) ( not ( = ?auto_443664 ?auto_443667 ) ) ( not ( = ?auto_443664 ?auto_443668 ) ) ( not ( = ?auto_443664 ?auto_443669 ) ) ( not ( = ?auto_443664 ?auto_443670 ) ) ( not ( = ?auto_443664 ?auto_443671 ) ) ( not ( = ?auto_443664 ?auto_443672 ) ) ( not ( = ?auto_443664 ?auto_443673 ) ) ( not ( = ?auto_443664 ?auto_443674 ) ) ( not ( = ?auto_443664 ?auto_443675 ) ) ( not ( = ?auto_443664 ?auto_443676 ) ) ( not ( = ?auto_443664 ?auto_443677 ) ) ( not ( = ?auto_443664 ?auto_443678 ) ) ( not ( = ?auto_443665 ?auto_443666 ) ) ( not ( = ?auto_443665 ?auto_443667 ) ) ( not ( = ?auto_443665 ?auto_443668 ) ) ( not ( = ?auto_443665 ?auto_443669 ) ) ( not ( = ?auto_443665 ?auto_443670 ) ) ( not ( = ?auto_443665 ?auto_443671 ) ) ( not ( = ?auto_443665 ?auto_443672 ) ) ( not ( = ?auto_443665 ?auto_443673 ) ) ( not ( = ?auto_443665 ?auto_443674 ) ) ( not ( = ?auto_443665 ?auto_443675 ) ) ( not ( = ?auto_443665 ?auto_443676 ) ) ( not ( = ?auto_443665 ?auto_443677 ) ) ( not ( = ?auto_443665 ?auto_443678 ) ) ( not ( = ?auto_443666 ?auto_443667 ) ) ( not ( = ?auto_443666 ?auto_443668 ) ) ( not ( = ?auto_443666 ?auto_443669 ) ) ( not ( = ?auto_443666 ?auto_443670 ) ) ( not ( = ?auto_443666 ?auto_443671 ) ) ( not ( = ?auto_443666 ?auto_443672 ) ) ( not ( = ?auto_443666 ?auto_443673 ) ) ( not ( = ?auto_443666 ?auto_443674 ) ) ( not ( = ?auto_443666 ?auto_443675 ) ) ( not ( = ?auto_443666 ?auto_443676 ) ) ( not ( = ?auto_443666 ?auto_443677 ) ) ( not ( = ?auto_443666 ?auto_443678 ) ) ( not ( = ?auto_443667 ?auto_443668 ) ) ( not ( = ?auto_443667 ?auto_443669 ) ) ( not ( = ?auto_443667 ?auto_443670 ) ) ( not ( = ?auto_443667 ?auto_443671 ) ) ( not ( = ?auto_443667 ?auto_443672 ) ) ( not ( = ?auto_443667 ?auto_443673 ) ) ( not ( = ?auto_443667 ?auto_443674 ) ) ( not ( = ?auto_443667 ?auto_443675 ) ) ( not ( = ?auto_443667 ?auto_443676 ) ) ( not ( = ?auto_443667 ?auto_443677 ) ) ( not ( = ?auto_443667 ?auto_443678 ) ) ( not ( = ?auto_443668 ?auto_443669 ) ) ( not ( = ?auto_443668 ?auto_443670 ) ) ( not ( = ?auto_443668 ?auto_443671 ) ) ( not ( = ?auto_443668 ?auto_443672 ) ) ( not ( = ?auto_443668 ?auto_443673 ) ) ( not ( = ?auto_443668 ?auto_443674 ) ) ( not ( = ?auto_443668 ?auto_443675 ) ) ( not ( = ?auto_443668 ?auto_443676 ) ) ( not ( = ?auto_443668 ?auto_443677 ) ) ( not ( = ?auto_443668 ?auto_443678 ) ) ( not ( = ?auto_443669 ?auto_443670 ) ) ( not ( = ?auto_443669 ?auto_443671 ) ) ( not ( = ?auto_443669 ?auto_443672 ) ) ( not ( = ?auto_443669 ?auto_443673 ) ) ( not ( = ?auto_443669 ?auto_443674 ) ) ( not ( = ?auto_443669 ?auto_443675 ) ) ( not ( = ?auto_443669 ?auto_443676 ) ) ( not ( = ?auto_443669 ?auto_443677 ) ) ( not ( = ?auto_443669 ?auto_443678 ) ) ( not ( = ?auto_443670 ?auto_443671 ) ) ( not ( = ?auto_443670 ?auto_443672 ) ) ( not ( = ?auto_443670 ?auto_443673 ) ) ( not ( = ?auto_443670 ?auto_443674 ) ) ( not ( = ?auto_443670 ?auto_443675 ) ) ( not ( = ?auto_443670 ?auto_443676 ) ) ( not ( = ?auto_443670 ?auto_443677 ) ) ( not ( = ?auto_443670 ?auto_443678 ) ) ( not ( = ?auto_443671 ?auto_443672 ) ) ( not ( = ?auto_443671 ?auto_443673 ) ) ( not ( = ?auto_443671 ?auto_443674 ) ) ( not ( = ?auto_443671 ?auto_443675 ) ) ( not ( = ?auto_443671 ?auto_443676 ) ) ( not ( = ?auto_443671 ?auto_443677 ) ) ( not ( = ?auto_443671 ?auto_443678 ) ) ( not ( = ?auto_443672 ?auto_443673 ) ) ( not ( = ?auto_443672 ?auto_443674 ) ) ( not ( = ?auto_443672 ?auto_443675 ) ) ( not ( = ?auto_443672 ?auto_443676 ) ) ( not ( = ?auto_443672 ?auto_443677 ) ) ( not ( = ?auto_443672 ?auto_443678 ) ) ( not ( = ?auto_443673 ?auto_443674 ) ) ( not ( = ?auto_443673 ?auto_443675 ) ) ( not ( = ?auto_443673 ?auto_443676 ) ) ( not ( = ?auto_443673 ?auto_443677 ) ) ( not ( = ?auto_443673 ?auto_443678 ) ) ( not ( = ?auto_443674 ?auto_443675 ) ) ( not ( = ?auto_443674 ?auto_443676 ) ) ( not ( = ?auto_443674 ?auto_443677 ) ) ( not ( = ?auto_443674 ?auto_443678 ) ) ( not ( = ?auto_443675 ?auto_443676 ) ) ( not ( = ?auto_443675 ?auto_443677 ) ) ( not ( = ?auto_443675 ?auto_443678 ) ) ( not ( = ?auto_443676 ?auto_443677 ) ) ( not ( = ?auto_443676 ?auto_443678 ) ) ( not ( = ?auto_443677 ?auto_443678 ) ) ( ON ?auto_443677 ?auto_443678 ) ( ON ?auto_443676 ?auto_443677 ) ( ON ?auto_443675 ?auto_443676 ) ( ON ?auto_443674 ?auto_443675 ) ( ON ?auto_443673 ?auto_443674 ) ( ON ?auto_443672 ?auto_443673 ) ( ON ?auto_443671 ?auto_443672 ) ( CLEAR ?auto_443669 ) ( ON ?auto_443670 ?auto_443671 ) ( CLEAR ?auto_443670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_443664 ?auto_443665 ?auto_443666 ?auto_443667 ?auto_443668 ?auto_443669 ?auto_443670 )
      ( MAKE-15PILE ?auto_443664 ?auto_443665 ?auto_443666 ?auto_443667 ?auto_443668 ?auto_443669 ?auto_443670 ?auto_443671 ?auto_443672 ?auto_443673 ?auto_443674 ?auto_443675 ?auto_443676 ?auto_443677 ?auto_443678 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443694 - BLOCK
      ?auto_443695 - BLOCK
      ?auto_443696 - BLOCK
      ?auto_443697 - BLOCK
      ?auto_443698 - BLOCK
      ?auto_443699 - BLOCK
      ?auto_443700 - BLOCK
      ?auto_443701 - BLOCK
      ?auto_443702 - BLOCK
      ?auto_443703 - BLOCK
      ?auto_443704 - BLOCK
      ?auto_443705 - BLOCK
      ?auto_443706 - BLOCK
      ?auto_443707 - BLOCK
      ?auto_443708 - BLOCK
    )
    :vars
    (
      ?auto_443709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443708 ?auto_443709 ) ( ON-TABLE ?auto_443694 ) ( ON ?auto_443695 ?auto_443694 ) ( ON ?auto_443696 ?auto_443695 ) ( ON ?auto_443697 ?auto_443696 ) ( ON ?auto_443698 ?auto_443697 ) ( not ( = ?auto_443694 ?auto_443695 ) ) ( not ( = ?auto_443694 ?auto_443696 ) ) ( not ( = ?auto_443694 ?auto_443697 ) ) ( not ( = ?auto_443694 ?auto_443698 ) ) ( not ( = ?auto_443694 ?auto_443699 ) ) ( not ( = ?auto_443694 ?auto_443700 ) ) ( not ( = ?auto_443694 ?auto_443701 ) ) ( not ( = ?auto_443694 ?auto_443702 ) ) ( not ( = ?auto_443694 ?auto_443703 ) ) ( not ( = ?auto_443694 ?auto_443704 ) ) ( not ( = ?auto_443694 ?auto_443705 ) ) ( not ( = ?auto_443694 ?auto_443706 ) ) ( not ( = ?auto_443694 ?auto_443707 ) ) ( not ( = ?auto_443694 ?auto_443708 ) ) ( not ( = ?auto_443694 ?auto_443709 ) ) ( not ( = ?auto_443695 ?auto_443696 ) ) ( not ( = ?auto_443695 ?auto_443697 ) ) ( not ( = ?auto_443695 ?auto_443698 ) ) ( not ( = ?auto_443695 ?auto_443699 ) ) ( not ( = ?auto_443695 ?auto_443700 ) ) ( not ( = ?auto_443695 ?auto_443701 ) ) ( not ( = ?auto_443695 ?auto_443702 ) ) ( not ( = ?auto_443695 ?auto_443703 ) ) ( not ( = ?auto_443695 ?auto_443704 ) ) ( not ( = ?auto_443695 ?auto_443705 ) ) ( not ( = ?auto_443695 ?auto_443706 ) ) ( not ( = ?auto_443695 ?auto_443707 ) ) ( not ( = ?auto_443695 ?auto_443708 ) ) ( not ( = ?auto_443695 ?auto_443709 ) ) ( not ( = ?auto_443696 ?auto_443697 ) ) ( not ( = ?auto_443696 ?auto_443698 ) ) ( not ( = ?auto_443696 ?auto_443699 ) ) ( not ( = ?auto_443696 ?auto_443700 ) ) ( not ( = ?auto_443696 ?auto_443701 ) ) ( not ( = ?auto_443696 ?auto_443702 ) ) ( not ( = ?auto_443696 ?auto_443703 ) ) ( not ( = ?auto_443696 ?auto_443704 ) ) ( not ( = ?auto_443696 ?auto_443705 ) ) ( not ( = ?auto_443696 ?auto_443706 ) ) ( not ( = ?auto_443696 ?auto_443707 ) ) ( not ( = ?auto_443696 ?auto_443708 ) ) ( not ( = ?auto_443696 ?auto_443709 ) ) ( not ( = ?auto_443697 ?auto_443698 ) ) ( not ( = ?auto_443697 ?auto_443699 ) ) ( not ( = ?auto_443697 ?auto_443700 ) ) ( not ( = ?auto_443697 ?auto_443701 ) ) ( not ( = ?auto_443697 ?auto_443702 ) ) ( not ( = ?auto_443697 ?auto_443703 ) ) ( not ( = ?auto_443697 ?auto_443704 ) ) ( not ( = ?auto_443697 ?auto_443705 ) ) ( not ( = ?auto_443697 ?auto_443706 ) ) ( not ( = ?auto_443697 ?auto_443707 ) ) ( not ( = ?auto_443697 ?auto_443708 ) ) ( not ( = ?auto_443697 ?auto_443709 ) ) ( not ( = ?auto_443698 ?auto_443699 ) ) ( not ( = ?auto_443698 ?auto_443700 ) ) ( not ( = ?auto_443698 ?auto_443701 ) ) ( not ( = ?auto_443698 ?auto_443702 ) ) ( not ( = ?auto_443698 ?auto_443703 ) ) ( not ( = ?auto_443698 ?auto_443704 ) ) ( not ( = ?auto_443698 ?auto_443705 ) ) ( not ( = ?auto_443698 ?auto_443706 ) ) ( not ( = ?auto_443698 ?auto_443707 ) ) ( not ( = ?auto_443698 ?auto_443708 ) ) ( not ( = ?auto_443698 ?auto_443709 ) ) ( not ( = ?auto_443699 ?auto_443700 ) ) ( not ( = ?auto_443699 ?auto_443701 ) ) ( not ( = ?auto_443699 ?auto_443702 ) ) ( not ( = ?auto_443699 ?auto_443703 ) ) ( not ( = ?auto_443699 ?auto_443704 ) ) ( not ( = ?auto_443699 ?auto_443705 ) ) ( not ( = ?auto_443699 ?auto_443706 ) ) ( not ( = ?auto_443699 ?auto_443707 ) ) ( not ( = ?auto_443699 ?auto_443708 ) ) ( not ( = ?auto_443699 ?auto_443709 ) ) ( not ( = ?auto_443700 ?auto_443701 ) ) ( not ( = ?auto_443700 ?auto_443702 ) ) ( not ( = ?auto_443700 ?auto_443703 ) ) ( not ( = ?auto_443700 ?auto_443704 ) ) ( not ( = ?auto_443700 ?auto_443705 ) ) ( not ( = ?auto_443700 ?auto_443706 ) ) ( not ( = ?auto_443700 ?auto_443707 ) ) ( not ( = ?auto_443700 ?auto_443708 ) ) ( not ( = ?auto_443700 ?auto_443709 ) ) ( not ( = ?auto_443701 ?auto_443702 ) ) ( not ( = ?auto_443701 ?auto_443703 ) ) ( not ( = ?auto_443701 ?auto_443704 ) ) ( not ( = ?auto_443701 ?auto_443705 ) ) ( not ( = ?auto_443701 ?auto_443706 ) ) ( not ( = ?auto_443701 ?auto_443707 ) ) ( not ( = ?auto_443701 ?auto_443708 ) ) ( not ( = ?auto_443701 ?auto_443709 ) ) ( not ( = ?auto_443702 ?auto_443703 ) ) ( not ( = ?auto_443702 ?auto_443704 ) ) ( not ( = ?auto_443702 ?auto_443705 ) ) ( not ( = ?auto_443702 ?auto_443706 ) ) ( not ( = ?auto_443702 ?auto_443707 ) ) ( not ( = ?auto_443702 ?auto_443708 ) ) ( not ( = ?auto_443702 ?auto_443709 ) ) ( not ( = ?auto_443703 ?auto_443704 ) ) ( not ( = ?auto_443703 ?auto_443705 ) ) ( not ( = ?auto_443703 ?auto_443706 ) ) ( not ( = ?auto_443703 ?auto_443707 ) ) ( not ( = ?auto_443703 ?auto_443708 ) ) ( not ( = ?auto_443703 ?auto_443709 ) ) ( not ( = ?auto_443704 ?auto_443705 ) ) ( not ( = ?auto_443704 ?auto_443706 ) ) ( not ( = ?auto_443704 ?auto_443707 ) ) ( not ( = ?auto_443704 ?auto_443708 ) ) ( not ( = ?auto_443704 ?auto_443709 ) ) ( not ( = ?auto_443705 ?auto_443706 ) ) ( not ( = ?auto_443705 ?auto_443707 ) ) ( not ( = ?auto_443705 ?auto_443708 ) ) ( not ( = ?auto_443705 ?auto_443709 ) ) ( not ( = ?auto_443706 ?auto_443707 ) ) ( not ( = ?auto_443706 ?auto_443708 ) ) ( not ( = ?auto_443706 ?auto_443709 ) ) ( not ( = ?auto_443707 ?auto_443708 ) ) ( not ( = ?auto_443707 ?auto_443709 ) ) ( not ( = ?auto_443708 ?auto_443709 ) ) ( ON ?auto_443707 ?auto_443708 ) ( ON ?auto_443706 ?auto_443707 ) ( ON ?auto_443705 ?auto_443706 ) ( ON ?auto_443704 ?auto_443705 ) ( ON ?auto_443703 ?auto_443704 ) ( ON ?auto_443702 ?auto_443703 ) ( ON ?auto_443701 ?auto_443702 ) ( ON ?auto_443700 ?auto_443701 ) ( CLEAR ?auto_443698 ) ( ON ?auto_443699 ?auto_443700 ) ( CLEAR ?auto_443699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_443694 ?auto_443695 ?auto_443696 ?auto_443697 ?auto_443698 ?auto_443699 )
      ( MAKE-15PILE ?auto_443694 ?auto_443695 ?auto_443696 ?auto_443697 ?auto_443698 ?auto_443699 ?auto_443700 ?auto_443701 ?auto_443702 ?auto_443703 ?auto_443704 ?auto_443705 ?auto_443706 ?auto_443707 ?auto_443708 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443725 - BLOCK
      ?auto_443726 - BLOCK
      ?auto_443727 - BLOCK
      ?auto_443728 - BLOCK
      ?auto_443729 - BLOCK
      ?auto_443730 - BLOCK
      ?auto_443731 - BLOCK
      ?auto_443732 - BLOCK
      ?auto_443733 - BLOCK
      ?auto_443734 - BLOCK
      ?auto_443735 - BLOCK
      ?auto_443736 - BLOCK
      ?auto_443737 - BLOCK
      ?auto_443738 - BLOCK
      ?auto_443739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443739 ) ( ON-TABLE ?auto_443725 ) ( ON ?auto_443726 ?auto_443725 ) ( ON ?auto_443727 ?auto_443726 ) ( ON ?auto_443728 ?auto_443727 ) ( ON ?auto_443729 ?auto_443728 ) ( not ( = ?auto_443725 ?auto_443726 ) ) ( not ( = ?auto_443725 ?auto_443727 ) ) ( not ( = ?auto_443725 ?auto_443728 ) ) ( not ( = ?auto_443725 ?auto_443729 ) ) ( not ( = ?auto_443725 ?auto_443730 ) ) ( not ( = ?auto_443725 ?auto_443731 ) ) ( not ( = ?auto_443725 ?auto_443732 ) ) ( not ( = ?auto_443725 ?auto_443733 ) ) ( not ( = ?auto_443725 ?auto_443734 ) ) ( not ( = ?auto_443725 ?auto_443735 ) ) ( not ( = ?auto_443725 ?auto_443736 ) ) ( not ( = ?auto_443725 ?auto_443737 ) ) ( not ( = ?auto_443725 ?auto_443738 ) ) ( not ( = ?auto_443725 ?auto_443739 ) ) ( not ( = ?auto_443726 ?auto_443727 ) ) ( not ( = ?auto_443726 ?auto_443728 ) ) ( not ( = ?auto_443726 ?auto_443729 ) ) ( not ( = ?auto_443726 ?auto_443730 ) ) ( not ( = ?auto_443726 ?auto_443731 ) ) ( not ( = ?auto_443726 ?auto_443732 ) ) ( not ( = ?auto_443726 ?auto_443733 ) ) ( not ( = ?auto_443726 ?auto_443734 ) ) ( not ( = ?auto_443726 ?auto_443735 ) ) ( not ( = ?auto_443726 ?auto_443736 ) ) ( not ( = ?auto_443726 ?auto_443737 ) ) ( not ( = ?auto_443726 ?auto_443738 ) ) ( not ( = ?auto_443726 ?auto_443739 ) ) ( not ( = ?auto_443727 ?auto_443728 ) ) ( not ( = ?auto_443727 ?auto_443729 ) ) ( not ( = ?auto_443727 ?auto_443730 ) ) ( not ( = ?auto_443727 ?auto_443731 ) ) ( not ( = ?auto_443727 ?auto_443732 ) ) ( not ( = ?auto_443727 ?auto_443733 ) ) ( not ( = ?auto_443727 ?auto_443734 ) ) ( not ( = ?auto_443727 ?auto_443735 ) ) ( not ( = ?auto_443727 ?auto_443736 ) ) ( not ( = ?auto_443727 ?auto_443737 ) ) ( not ( = ?auto_443727 ?auto_443738 ) ) ( not ( = ?auto_443727 ?auto_443739 ) ) ( not ( = ?auto_443728 ?auto_443729 ) ) ( not ( = ?auto_443728 ?auto_443730 ) ) ( not ( = ?auto_443728 ?auto_443731 ) ) ( not ( = ?auto_443728 ?auto_443732 ) ) ( not ( = ?auto_443728 ?auto_443733 ) ) ( not ( = ?auto_443728 ?auto_443734 ) ) ( not ( = ?auto_443728 ?auto_443735 ) ) ( not ( = ?auto_443728 ?auto_443736 ) ) ( not ( = ?auto_443728 ?auto_443737 ) ) ( not ( = ?auto_443728 ?auto_443738 ) ) ( not ( = ?auto_443728 ?auto_443739 ) ) ( not ( = ?auto_443729 ?auto_443730 ) ) ( not ( = ?auto_443729 ?auto_443731 ) ) ( not ( = ?auto_443729 ?auto_443732 ) ) ( not ( = ?auto_443729 ?auto_443733 ) ) ( not ( = ?auto_443729 ?auto_443734 ) ) ( not ( = ?auto_443729 ?auto_443735 ) ) ( not ( = ?auto_443729 ?auto_443736 ) ) ( not ( = ?auto_443729 ?auto_443737 ) ) ( not ( = ?auto_443729 ?auto_443738 ) ) ( not ( = ?auto_443729 ?auto_443739 ) ) ( not ( = ?auto_443730 ?auto_443731 ) ) ( not ( = ?auto_443730 ?auto_443732 ) ) ( not ( = ?auto_443730 ?auto_443733 ) ) ( not ( = ?auto_443730 ?auto_443734 ) ) ( not ( = ?auto_443730 ?auto_443735 ) ) ( not ( = ?auto_443730 ?auto_443736 ) ) ( not ( = ?auto_443730 ?auto_443737 ) ) ( not ( = ?auto_443730 ?auto_443738 ) ) ( not ( = ?auto_443730 ?auto_443739 ) ) ( not ( = ?auto_443731 ?auto_443732 ) ) ( not ( = ?auto_443731 ?auto_443733 ) ) ( not ( = ?auto_443731 ?auto_443734 ) ) ( not ( = ?auto_443731 ?auto_443735 ) ) ( not ( = ?auto_443731 ?auto_443736 ) ) ( not ( = ?auto_443731 ?auto_443737 ) ) ( not ( = ?auto_443731 ?auto_443738 ) ) ( not ( = ?auto_443731 ?auto_443739 ) ) ( not ( = ?auto_443732 ?auto_443733 ) ) ( not ( = ?auto_443732 ?auto_443734 ) ) ( not ( = ?auto_443732 ?auto_443735 ) ) ( not ( = ?auto_443732 ?auto_443736 ) ) ( not ( = ?auto_443732 ?auto_443737 ) ) ( not ( = ?auto_443732 ?auto_443738 ) ) ( not ( = ?auto_443732 ?auto_443739 ) ) ( not ( = ?auto_443733 ?auto_443734 ) ) ( not ( = ?auto_443733 ?auto_443735 ) ) ( not ( = ?auto_443733 ?auto_443736 ) ) ( not ( = ?auto_443733 ?auto_443737 ) ) ( not ( = ?auto_443733 ?auto_443738 ) ) ( not ( = ?auto_443733 ?auto_443739 ) ) ( not ( = ?auto_443734 ?auto_443735 ) ) ( not ( = ?auto_443734 ?auto_443736 ) ) ( not ( = ?auto_443734 ?auto_443737 ) ) ( not ( = ?auto_443734 ?auto_443738 ) ) ( not ( = ?auto_443734 ?auto_443739 ) ) ( not ( = ?auto_443735 ?auto_443736 ) ) ( not ( = ?auto_443735 ?auto_443737 ) ) ( not ( = ?auto_443735 ?auto_443738 ) ) ( not ( = ?auto_443735 ?auto_443739 ) ) ( not ( = ?auto_443736 ?auto_443737 ) ) ( not ( = ?auto_443736 ?auto_443738 ) ) ( not ( = ?auto_443736 ?auto_443739 ) ) ( not ( = ?auto_443737 ?auto_443738 ) ) ( not ( = ?auto_443737 ?auto_443739 ) ) ( not ( = ?auto_443738 ?auto_443739 ) ) ( ON ?auto_443738 ?auto_443739 ) ( ON ?auto_443737 ?auto_443738 ) ( ON ?auto_443736 ?auto_443737 ) ( ON ?auto_443735 ?auto_443736 ) ( ON ?auto_443734 ?auto_443735 ) ( ON ?auto_443733 ?auto_443734 ) ( ON ?auto_443732 ?auto_443733 ) ( ON ?auto_443731 ?auto_443732 ) ( CLEAR ?auto_443729 ) ( ON ?auto_443730 ?auto_443731 ) ( CLEAR ?auto_443730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_443725 ?auto_443726 ?auto_443727 ?auto_443728 ?auto_443729 ?auto_443730 )
      ( MAKE-15PILE ?auto_443725 ?auto_443726 ?auto_443727 ?auto_443728 ?auto_443729 ?auto_443730 ?auto_443731 ?auto_443732 ?auto_443733 ?auto_443734 ?auto_443735 ?auto_443736 ?auto_443737 ?auto_443738 ?auto_443739 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443755 - BLOCK
      ?auto_443756 - BLOCK
      ?auto_443757 - BLOCK
      ?auto_443758 - BLOCK
      ?auto_443759 - BLOCK
      ?auto_443760 - BLOCK
      ?auto_443761 - BLOCK
      ?auto_443762 - BLOCK
      ?auto_443763 - BLOCK
      ?auto_443764 - BLOCK
      ?auto_443765 - BLOCK
      ?auto_443766 - BLOCK
      ?auto_443767 - BLOCK
      ?auto_443768 - BLOCK
      ?auto_443769 - BLOCK
    )
    :vars
    (
      ?auto_443770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443769 ?auto_443770 ) ( ON-TABLE ?auto_443755 ) ( ON ?auto_443756 ?auto_443755 ) ( ON ?auto_443757 ?auto_443756 ) ( ON ?auto_443758 ?auto_443757 ) ( not ( = ?auto_443755 ?auto_443756 ) ) ( not ( = ?auto_443755 ?auto_443757 ) ) ( not ( = ?auto_443755 ?auto_443758 ) ) ( not ( = ?auto_443755 ?auto_443759 ) ) ( not ( = ?auto_443755 ?auto_443760 ) ) ( not ( = ?auto_443755 ?auto_443761 ) ) ( not ( = ?auto_443755 ?auto_443762 ) ) ( not ( = ?auto_443755 ?auto_443763 ) ) ( not ( = ?auto_443755 ?auto_443764 ) ) ( not ( = ?auto_443755 ?auto_443765 ) ) ( not ( = ?auto_443755 ?auto_443766 ) ) ( not ( = ?auto_443755 ?auto_443767 ) ) ( not ( = ?auto_443755 ?auto_443768 ) ) ( not ( = ?auto_443755 ?auto_443769 ) ) ( not ( = ?auto_443755 ?auto_443770 ) ) ( not ( = ?auto_443756 ?auto_443757 ) ) ( not ( = ?auto_443756 ?auto_443758 ) ) ( not ( = ?auto_443756 ?auto_443759 ) ) ( not ( = ?auto_443756 ?auto_443760 ) ) ( not ( = ?auto_443756 ?auto_443761 ) ) ( not ( = ?auto_443756 ?auto_443762 ) ) ( not ( = ?auto_443756 ?auto_443763 ) ) ( not ( = ?auto_443756 ?auto_443764 ) ) ( not ( = ?auto_443756 ?auto_443765 ) ) ( not ( = ?auto_443756 ?auto_443766 ) ) ( not ( = ?auto_443756 ?auto_443767 ) ) ( not ( = ?auto_443756 ?auto_443768 ) ) ( not ( = ?auto_443756 ?auto_443769 ) ) ( not ( = ?auto_443756 ?auto_443770 ) ) ( not ( = ?auto_443757 ?auto_443758 ) ) ( not ( = ?auto_443757 ?auto_443759 ) ) ( not ( = ?auto_443757 ?auto_443760 ) ) ( not ( = ?auto_443757 ?auto_443761 ) ) ( not ( = ?auto_443757 ?auto_443762 ) ) ( not ( = ?auto_443757 ?auto_443763 ) ) ( not ( = ?auto_443757 ?auto_443764 ) ) ( not ( = ?auto_443757 ?auto_443765 ) ) ( not ( = ?auto_443757 ?auto_443766 ) ) ( not ( = ?auto_443757 ?auto_443767 ) ) ( not ( = ?auto_443757 ?auto_443768 ) ) ( not ( = ?auto_443757 ?auto_443769 ) ) ( not ( = ?auto_443757 ?auto_443770 ) ) ( not ( = ?auto_443758 ?auto_443759 ) ) ( not ( = ?auto_443758 ?auto_443760 ) ) ( not ( = ?auto_443758 ?auto_443761 ) ) ( not ( = ?auto_443758 ?auto_443762 ) ) ( not ( = ?auto_443758 ?auto_443763 ) ) ( not ( = ?auto_443758 ?auto_443764 ) ) ( not ( = ?auto_443758 ?auto_443765 ) ) ( not ( = ?auto_443758 ?auto_443766 ) ) ( not ( = ?auto_443758 ?auto_443767 ) ) ( not ( = ?auto_443758 ?auto_443768 ) ) ( not ( = ?auto_443758 ?auto_443769 ) ) ( not ( = ?auto_443758 ?auto_443770 ) ) ( not ( = ?auto_443759 ?auto_443760 ) ) ( not ( = ?auto_443759 ?auto_443761 ) ) ( not ( = ?auto_443759 ?auto_443762 ) ) ( not ( = ?auto_443759 ?auto_443763 ) ) ( not ( = ?auto_443759 ?auto_443764 ) ) ( not ( = ?auto_443759 ?auto_443765 ) ) ( not ( = ?auto_443759 ?auto_443766 ) ) ( not ( = ?auto_443759 ?auto_443767 ) ) ( not ( = ?auto_443759 ?auto_443768 ) ) ( not ( = ?auto_443759 ?auto_443769 ) ) ( not ( = ?auto_443759 ?auto_443770 ) ) ( not ( = ?auto_443760 ?auto_443761 ) ) ( not ( = ?auto_443760 ?auto_443762 ) ) ( not ( = ?auto_443760 ?auto_443763 ) ) ( not ( = ?auto_443760 ?auto_443764 ) ) ( not ( = ?auto_443760 ?auto_443765 ) ) ( not ( = ?auto_443760 ?auto_443766 ) ) ( not ( = ?auto_443760 ?auto_443767 ) ) ( not ( = ?auto_443760 ?auto_443768 ) ) ( not ( = ?auto_443760 ?auto_443769 ) ) ( not ( = ?auto_443760 ?auto_443770 ) ) ( not ( = ?auto_443761 ?auto_443762 ) ) ( not ( = ?auto_443761 ?auto_443763 ) ) ( not ( = ?auto_443761 ?auto_443764 ) ) ( not ( = ?auto_443761 ?auto_443765 ) ) ( not ( = ?auto_443761 ?auto_443766 ) ) ( not ( = ?auto_443761 ?auto_443767 ) ) ( not ( = ?auto_443761 ?auto_443768 ) ) ( not ( = ?auto_443761 ?auto_443769 ) ) ( not ( = ?auto_443761 ?auto_443770 ) ) ( not ( = ?auto_443762 ?auto_443763 ) ) ( not ( = ?auto_443762 ?auto_443764 ) ) ( not ( = ?auto_443762 ?auto_443765 ) ) ( not ( = ?auto_443762 ?auto_443766 ) ) ( not ( = ?auto_443762 ?auto_443767 ) ) ( not ( = ?auto_443762 ?auto_443768 ) ) ( not ( = ?auto_443762 ?auto_443769 ) ) ( not ( = ?auto_443762 ?auto_443770 ) ) ( not ( = ?auto_443763 ?auto_443764 ) ) ( not ( = ?auto_443763 ?auto_443765 ) ) ( not ( = ?auto_443763 ?auto_443766 ) ) ( not ( = ?auto_443763 ?auto_443767 ) ) ( not ( = ?auto_443763 ?auto_443768 ) ) ( not ( = ?auto_443763 ?auto_443769 ) ) ( not ( = ?auto_443763 ?auto_443770 ) ) ( not ( = ?auto_443764 ?auto_443765 ) ) ( not ( = ?auto_443764 ?auto_443766 ) ) ( not ( = ?auto_443764 ?auto_443767 ) ) ( not ( = ?auto_443764 ?auto_443768 ) ) ( not ( = ?auto_443764 ?auto_443769 ) ) ( not ( = ?auto_443764 ?auto_443770 ) ) ( not ( = ?auto_443765 ?auto_443766 ) ) ( not ( = ?auto_443765 ?auto_443767 ) ) ( not ( = ?auto_443765 ?auto_443768 ) ) ( not ( = ?auto_443765 ?auto_443769 ) ) ( not ( = ?auto_443765 ?auto_443770 ) ) ( not ( = ?auto_443766 ?auto_443767 ) ) ( not ( = ?auto_443766 ?auto_443768 ) ) ( not ( = ?auto_443766 ?auto_443769 ) ) ( not ( = ?auto_443766 ?auto_443770 ) ) ( not ( = ?auto_443767 ?auto_443768 ) ) ( not ( = ?auto_443767 ?auto_443769 ) ) ( not ( = ?auto_443767 ?auto_443770 ) ) ( not ( = ?auto_443768 ?auto_443769 ) ) ( not ( = ?auto_443768 ?auto_443770 ) ) ( not ( = ?auto_443769 ?auto_443770 ) ) ( ON ?auto_443768 ?auto_443769 ) ( ON ?auto_443767 ?auto_443768 ) ( ON ?auto_443766 ?auto_443767 ) ( ON ?auto_443765 ?auto_443766 ) ( ON ?auto_443764 ?auto_443765 ) ( ON ?auto_443763 ?auto_443764 ) ( ON ?auto_443762 ?auto_443763 ) ( ON ?auto_443761 ?auto_443762 ) ( ON ?auto_443760 ?auto_443761 ) ( CLEAR ?auto_443758 ) ( ON ?auto_443759 ?auto_443760 ) ( CLEAR ?auto_443759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_443755 ?auto_443756 ?auto_443757 ?auto_443758 ?auto_443759 )
      ( MAKE-15PILE ?auto_443755 ?auto_443756 ?auto_443757 ?auto_443758 ?auto_443759 ?auto_443760 ?auto_443761 ?auto_443762 ?auto_443763 ?auto_443764 ?auto_443765 ?auto_443766 ?auto_443767 ?auto_443768 ?auto_443769 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443786 - BLOCK
      ?auto_443787 - BLOCK
      ?auto_443788 - BLOCK
      ?auto_443789 - BLOCK
      ?auto_443790 - BLOCK
      ?auto_443791 - BLOCK
      ?auto_443792 - BLOCK
      ?auto_443793 - BLOCK
      ?auto_443794 - BLOCK
      ?auto_443795 - BLOCK
      ?auto_443796 - BLOCK
      ?auto_443797 - BLOCK
      ?auto_443798 - BLOCK
      ?auto_443799 - BLOCK
      ?auto_443800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443800 ) ( ON-TABLE ?auto_443786 ) ( ON ?auto_443787 ?auto_443786 ) ( ON ?auto_443788 ?auto_443787 ) ( ON ?auto_443789 ?auto_443788 ) ( not ( = ?auto_443786 ?auto_443787 ) ) ( not ( = ?auto_443786 ?auto_443788 ) ) ( not ( = ?auto_443786 ?auto_443789 ) ) ( not ( = ?auto_443786 ?auto_443790 ) ) ( not ( = ?auto_443786 ?auto_443791 ) ) ( not ( = ?auto_443786 ?auto_443792 ) ) ( not ( = ?auto_443786 ?auto_443793 ) ) ( not ( = ?auto_443786 ?auto_443794 ) ) ( not ( = ?auto_443786 ?auto_443795 ) ) ( not ( = ?auto_443786 ?auto_443796 ) ) ( not ( = ?auto_443786 ?auto_443797 ) ) ( not ( = ?auto_443786 ?auto_443798 ) ) ( not ( = ?auto_443786 ?auto_443799 ) ) ( not ( = ?auto_443786 ?auto_443800 ) ) ( not ( = ?auto_443787 ?auto_443788 ) ) ( not ( = ?auto_443787 ?auto_443789 ) ) ( not ( = ?auto_443787 ?auto_443790 ) ) ( not ( = ?auto_443787 ?auto_443791 ) ) ( not ( = ?auto_443787 ?auto_443792 ) ) ( not ( = ?auto_443787 ?auto_443793 ) ) ( not ( = ?auto_443787 ?auto_443794 ) ) ( not ( = ?auto_443787 ?auto_443795 ) ) ( not ( = ?auto_443787 ?auto_443796 ) ) ( not ( = ?auto_443787 ?auto_443797 ) ) ( not ( = ?auto_443787 ?auto_443798 ) ) ( not ( = ?auto_443787 ?auto_443799 ) ) ( not ( = ?auto_443787 ?auto_443800 ) ) ( not ( = ?auto_443788 ?auto_443789 ) ) ( not ( = ?auto_443788 ?auto_443790 ) ) ( not ( = ?auto_443788 ?auto_443791 ) ) ( not ( = ?auto_443788 ?auto_443792 ) ) ( not ( = ?auto_443788 ?auto_443793 ) ) ( not ( = ?auto_443788 ?auto_443794 ) ) ( not ( = ?auto_443788 ?auto_443795 ) ) ( not ( = ?auto_443788 ?auto_443796 ) ) ( not ( = ?auto_443788 ?auto_443797 ) ) ( not ( = ?auto_443788 ?auto_443798 ) ) ( not ( = ?auto_443788 ?auto_443799 ) ) ( not ( = ?auto_443788 ?auto_443800 ) ) ( not ( = ?auto_443789 ?auto_443790 ) ) ( not ( = ?auto_443789 ?auto_443791 ) ) ( not ( = ?auto_443789 ?auto_443792 ) ) ( not ( = ?auto_443789 ?auto_443793 ) ) ( not ( = ?auto_443789 ?auto_443794 ) ) ( not ( = ?auto_443789 ?auto_443795 ) ) ( not ( = ?auto_443789 ?auto_443796 ) ) ( not ( = ?auto_443789 ?auto_443797 ) ) ( not ( = ?auto_443789 ?auto_443798 ) ) ( not ( = ?auto_443789 ?auto_443799 ) ) ( not ( = ?auto_443789 ?auto_443800 ) ) ( not ( = ?auto_443790 ?auto_443791 ) ) ( not ( = ?auto_443790 ?auto_443792 ) ) ( not ( = ?auto_443790 ?auto_443793 ) ) ( not ( = ?auto_443790 ?auto_443794 ) ) ( not ( = ?auto_443790 ?auto_443795 ) ) ( not ( = ?auto_443790 ?auto_443796 ) ) ( not ( = ?auto_443790 ?auto_443797 ) ) ( not ( = ?auto_443790 ?auto_443798 ) ) ( not ( = ?auto_443790 ?auto_443799 ) ) ( not ( = ?auto_443790 ?auto_443800 ) ) ( not ( = ?auto_443791 ?auto_443792 ) ) ( not ( = ?auto_443791 ?auto_443793 ) ) ( not ( = ?auto_443791 ?auto_443794 ) ) ( not ( = ?auto_443791 ?auto_443795 ) ) ( not ( = ?auto_443791 ?auto_443796 ) ) ( not ( = ?auto_443791 ?auto_443797 ) ) ( not ( = ?auto_443791 ?auto_443798 ) ) ( not ( = ?auto_443791 ?auto_443799 ) ) ( not ( = ?auto_443791 ?auto_443800 ) ) ( not ( = ?auto_443792 ?auto_443793 ) ) ( not ( = ?auto_443792 ?auto_443794 ) ) ( not ( = ?auto_443792 ?auto_443795 ) ) ( not ( = ?auto_443792 ?auto_443796 ) ) ( not ( = ?auto_443792 ?auto_443797 ) ) ( not ( = ?auto_443792 ?auto_443798 ) ) ( not ( = ?auto_443792 ?auto_443799 ) ) ( not ( = ?auto_443792 ?auto_443800 ) ) ( not ( = ?auto_443793 ?auto_443794 ) ) ( not ( = ?auto_443793 ?auto_443795 ) ) ( not ( = ?auto_443793 ?auto_443796 ) ) ( not ( = ?auto_443793 ?auto_443797 ) ) ( not ( = ?auto_443793 ?auto_443798 ) ) ( not ( = ?auto_443793 ?auto_443799 ) ) ( not ( = ?auto_443793 ?auto_443800 ) ) ( not ( = ?auto_443794 ?auto_443795 ) ) ( not ( = ?auto_443794 ?auto_443796 ) ) ( not ( = ?auto_443794 ?auto_443797 ) ) ( not ( = ?auto_443794 ?auto_443798 ) ) ( not ( = ?auto_443794 ?auto_443799 ) ) ( not ( = ?auto_443794 ?auto_443800 ) ) ( not ( = ?auto_443795 ?auto_443796 ) ) ( not ( = ?auto_443795 ?auto_443797 ) ) ( not ( = ?auto_443795 ?auto_443798 ) ) ( not ( = ?auto_443795 ?auto_443799 ) ) ( not ( = ?auto_443795 ?auto_443800 ) ) ( not ( = ?auto_443796 ?auto_443797 ) ) ( not ( = ?auto_443796 ?auto_443798 ) ) ( not ( = ?auto_443796 ?auto_443799 ) ) ( not ( = ?auto_443796 ?auto_443800 ) ) ( not ( = ?auto_443797 ?auto_443798 ) ) ( not ( = ?auto_443797 ?auto_443799 ) ) ( not ( = ?auto_443797 ?auto_443800 ) ) ( not ( = ?auto_443798 ?auto_443799 ) ) ( not ( = ?auto_443798 ?auto_443800 ) ) ( not ( = ?auto_443799 ?auto_443800 ) ) ( ON ?auto_443799 ?auto_443800 ) ( ON ?auto_443798 ?auto_443799 ) ( ON ?auto_443797 ?auto_443798 ) ( ON ?auto_443796 ?auto_443797 ) ( ON ?auto_443795 ?auto_443796 ) ( ON ?auto_443794 ?auto_443795 ) ( ON ?auto_443793 ?auto_443794 ) ( ON ?auto_443792 ?auto_443793 ) ( ON ?auto_443791 ?auto_443792 ) ( CLEAR ?auto_443789 ) ( ON ?auto_443790 ?auto_443791 ) ( CLEAR ?auto_443790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_443786 ?auto_443787 ?auto_443788 ?auto_443789 ?auto_443790 )
      ( MAKE-15PILE ?auto_443786 ?auto_443787 ?auto_443788 ?auto_443789 ?auto_443790 ?auto_443791 ?auto_443792 ?auto_443793 ?auto_443794 ?auto_443795 ?auto_443796 ?auto_443797 ?auto_443798 ?auto_443799 ?auto_443800 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443816 - BLOCK
      ?auto_443817 - BLOCK
      ?auto_443818 - BLOCK
      ?auto_443819 - BLOCK
      ?auto_443820 - BLOCK
      ?auto_443821 - BLOCK
      ?auto_443822 - BLOCK
      ?auto_443823 - BLOCK
      ?auto_443824 - BLOCK
      ?auto_443825 - BLOCK
      ?auto_443826 - BLOCK
      ?auto_443827 - BLOCK
      ?auto_443828 - BLOCK
      ?auto_443829 - BLOCK
      ?auto_443830 - BLOCK
    )
    :vars
    (
      ?auto_443831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443830 ?auto_443831 ) ( ON-TABLE ?auto_443816 ) ( ON ?auto_443817 ?auto_443816 ) ( ON ?auto_443818 ?auto_443817 ) ( not ( = ?auto_443816 ?auto_443817 ) ) ( not ( = ?auto_443816 ?auto_443818 ) ) ( not ( = ?auto_443816 ?auto_443819 ) ) ( not ( = ?auto_443816 ?auto_443820 ) ) ( not ( = ?auto_443816 ?auto_443821 ) ) ( not ( = ?auto_443816 ?auto_443822 ) ) ( not ( = ?auto_443816 ?auto_443823 ) ) ( not ( = ?auto_443816 ?auto_443824 ) ) ( not ( = ?auto_443816 ?auto_443825 ) ) ( not ( = ?auto_443816 ?auto_443826 ) ) ( not ( = ?auto_443816 ?auto_443827 ) ) ( not ( = ?auto_443816 ?auto_443828 ) ) ( not ( = ?auto_443816 ?auto_443829 ) ) ( not ( = ?auto_443816 ?auto_443830 ) ) ( not ( = ?auto_443816 ?auto_443831 ) ) ( not ( = ?auto_443817 ?auto_443818 ) ) ( not ( = ?auto_443817 ?auto_443819 ) ) ( not ( = ?auto_443817 ?auto_443820 ) ) ( not ( = ?auto_443817 ?auto_443821 ) ) ( not ( = ?auto_443817 ?auto_443822 ) ) ( not ( = ?auto_443817 ?auto_443823 ) ) ( not ( = ?auto_443817 ?auto_443824 ) ) ( not ( = ?auto_443817 ?auto_443825 ) ) ( not ( = ?auto_443817 ?auto_443826 ) ) ( not ( = ?auto_443817 ?auto_443827 ) ) ( not ( = ?auto_443817 ?auto_443828 ) ) ( not ( = ?auto_443817 ?auto_443829 ) ) ( not ( = ?auto_443817 ?auto_443830 ) ) ( not ( = ?auto_443817 ?auto_443831 ) ) ( not ( = ?auto_443818 ?auto_443819 ) ) ( not ( = ?auto_443818 ?auto_443820 ) ) ( not ( = ?auto_443818 ?auto_443821 ) ) ( not ( = ?auto_443818 ?auto_443822 ) ) ( not ( = ?auto_443818 ?auto_443823 ) ) ( not ( = ?auto_443818 ?auto_443824 ) ) ( not ( = ?auto_443818 ?auto_443825 ) ) ( not ( = ?auto_443818 ?auto_443826 ) ) ( not ( = ?auto_443818 ?auto_443827 ) ) ( not ( = ?auto_443818 ?auto_443828 ) ) ( not ( = ?auto_443818 ?auto_443829 ) ) ( not ( = ?auto_443818 ?auto_443830 ) ) ( not ( = ?auto_443818 ?auto_443831 ) ) ( not ( = ?auto_443819 ?auto_443820 ) ) ( not ( = ?auto_443819 ?auto_443821 ) ) ( not ( = ?auto_443819 ?auto_443822 ) ) ( not ( = ?auto_443819 ?auto_443823 ) ) ( not ( = ?auto_443819 ?auto_443824 ) ) ( not ( = ?auto_443819 ?auto_443825 ) ) ( not ( = ?auto_443819 ?auto_443826 ) ) ( not ( = ?auto_443819 ?auto_443827 ) ) ( not ( = ?auto_443819 ?auto_443828 ) ) ( not ( = ?auto_443819 ?auto_443829 ) ) ( not ( = ?auto_443819 ?auto_443830 ) ) ( not ( = ?auto_443819 ?auto_443831 ) ) ( not ( = ?auto_443820 ?auto_443821 ) ) ( not ( = ?auto_443820 ?auto_443822 ) ) ( not ( = ?auto_443820 ?auto_443823 ) ) ( not ( = ?auto_443820 ?auto_443824 ) ) ( not ( = ?auto_443820 ?auto_443825 ) ) ( not ( = ?auto_443820 ?auto_443826 ) ) ( not ( = ?auto_443820 ?auto_443827 ) ) ( not ( = ?auto_443820 ?auto_443828 ) ) ( not ( = ?auto_443820 ?auto_443829 ) ) ( not ( = ?auto_443820 ?auto_443830 ) ) ( not ( = ?auto_443820 ?auto_443831 ) ) ( not ( = ?auto_443821 ?auto_443822 ) ) ( not ( = ?auto_443821 ?auto_443823 ) ) ( not ( = ?auto_443821 ?auto_443824 ) ) ( not ( = ?auto_443821 ?auto_443825 ) ) ( not ( = ?auto_443821 ?auto_443826 ) ) ( not ( = ?auto_443821 ?auto_443827 ) ) ( not ( = ?auto_443821 ?auto_443828 ) ) ( not ( = ?auto_443821 ?auto_443829 ) ) ( not ( = ?auto_443821 ?auto_443830 ) ) ( not ( = ?auto_443821 ?auto_443831 ) ) ( not ( = ?auto_443822 ?auto_443823 ) ) ( not ( = ?auto_443822 ?auto_443824 ) ) ( not ( = ?auto_443822 ?auto_443825 ) ) ( not ( = ?auto_443822 ?auto_443826 ) ) ( not ( = ?auto_443822 ?auto_443827 ) ) ( not ( = ?auto_443822 ?auto_443828 ) ) ( not ( = ?auto_443822 ?auto_443829 ) ) ( not ( = ?auto_443822 ?auto_443830 ) ) ( not ( = ?auto_443822 ?auto_443831 ) ) ( not ( = ?auto_443823 ?auto_443824 ) ) ( not ( = ?auto_443823 ?auto_443825 ) ) ( not ( = ?auto_443823 ?auto_443826 ) ) ( not ( = ?auto_443823 ?auto_443827 ) ) ( not ( = ?auto_443823 ?auto_443828 ) ) ( not ( = ?auto_443823 ?auto_443829 ) ) ( not ( = ?auto_443823 ?auto_443830 ) ) ( not ( = ?auto_443823 ?auto_443831 ) ) ( not ( = ?auto_443824 ?auto_443825 ) ) ( not ( = ?auto_443824 ?auto_443826 ) ) ( not ( = ?auto_443824 ?auto_443827 ) ) ( not ( = ?auto_443824 ?auto_443828 ) ) ( not ( = ?auto_443824 ?auto_443829 ) ) ( not ( = ?auto_443824 ?auto_443830 ) ) ( not ( = ?auto_443824 ?auto_443831 ) ) ( not ( = ?auto_443825 ?auto_443826 ) ) ( not ( = ?auto_443825 ?auto_443827 ) ) ( not ( = ?auto_443825 ?auto_443828 ) ) ( not ( = ?auto_443825 ?auto_443829 ) ) ( not ( = ?auto_443825 ?auto_443830 ) ) ( not ( = ?auto_443825 ?auto_443831 ) ) ( not ( = ?auto_443826 ?auto_443827 ) ) ( not ( = ?auto_443826 ?auto_443828 ) ) ( not ( = ?auto_443826 ?auto_443829 ) ) ( not ( = ?auto_443826 ?auto_443830 ) ) ( not ( = ?auto_443826 ?auto_443831 ) ) ( not ( = ?auto_443827 ?auto_443828 ) ) ( not ( = ?auto_443827 ?auto_443829 ) ) ( not ( = ?auto_443827 ?auto_443830 ) ) ( not ( = ?auto_443827 ?auto_443831 ) ) ( not ( = ?auto_443828 ?auto_443829 ) ) ( not ( = ?auto_443828 ?auto_443830 ) ) ( not ( = ?auto_443828 ?auto_443831 ) ) ( not ( = ?auto_443829 ?auto_443830 ) ) ( not ( = ?auto_443829 ?auto_443831 ) ) ( not ( = ?auto_443830 ?auto_443831 ) ) ( ON ?auto_443829 ?auto_443830 ) ( ON ?auto_443828 ?auto_443829 ) ( ON ?auto_443827 ?auto_443828 ) ( ON ?auto_443826 ?auto_443827 ) ( ON ?auto_443825 ?auto_443826 ) ( ON ?auto_443824 ?auto_443825 ) ( ON ?auto_443823 ?auto_443824 ) ( ON ?auto_443822 ?auto_443823 ) ( ON ?auto_443821 ?auto_443822 ) ( ON ?auto_443820 ?auto_443821 ) ( CLEAR ?auto_443818 ) ( ON ?auto_443819 ?auto_443820 ) ( CLEAR ?auto_443819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_443816 ?auto_443817 ?auto_443818 ?auto_443819 )
      ( MAKE-15PILE ?auto_443816 ?auto_443817 ?auto_443818 ?auto_443819 ?auto_443820 ?auto_443821 ?auto_443822 ?auto_443823 ?auto_443824 ?auto_443825 ?auto_443826 ?auto_443827 ?auto_443828 ?auto_443829 ?auto_443830 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443847 - BLOCK
      ?auto_443848 - BLOCK
      ?auto_443849 - BLOCK
      ?auto_443850 - BLOCK
      ?auto_443851 - BLOCK
      ?auto_443852 - BLOCK
      ?auto_443853 - BLOCK
      ?auto_443854 - BLOCK
      ?auto_443855 - BLOCK
      ?auto_443856 - BLOCK
      ?auto_443857 - BLOCK
      ?auto_443858 - BLOCK
      ?auto_443859 - BLOCK
      ?auto_443860 - BLOCK
      ?auto_443861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443861 ) ( ON-TABLE ?auto_443847 ) ( ON ?auto_443848 ?auto_443847 ) ( ON ?auto_443849 ?auto_443848 ) ( not ( = ?auto_443847 ?auto_443848 ) ) ( not ( = ?auto_443847 ?auto_443849 ) ) ( not ( = ?auto_443847 ?auto_443850 ) ) ( not ( = ?auto_443847 ?auto_443851 ) ) ( not ( = ?auto_443847 ?auto_443852 ) ) ( not ( = ?auto_443847 ?auto_443853 ) ) ( not ( = ?auto_443847 ?auto_443854 ) ) ( not ( = ?auto_443847 ?auto_443855 ) ) ( not ( = ?auto_443847 ?auto_443856 ) ) ( not ( = ?auto_443847 ?auto_443857 ) ) ( not ( = ?auto_443847 ?auto_443858 ) ) ( not ( = ?auto_443847 ?auto_443859 ) ) ( not ( = ?auto_443847 ?auto_443860 ) ) ( not ( = ?auto_443847 ?auto_443861 ) ) ( not ( = ?auto_443848 ?auto_443849 ) ) ( not ( = ?auto_443848 ?auto_443850 ) ) ( not ( = ?auto_443848 ?auto_443851 ) ) ( not ( = ?auto_443848 ?auto_443852 ) ) ( not ( = ?auto_443848 ?auto_443853 ) ) ( not ( = ?auto_443848 ?auto_443854 ) ) ( not ( = ?auto_443848 ?auto_443855 ) ) ( not ( = ?auto_443848 ?auto_443856 ) ) ( not ( = ?auto_443848 ?auto_443857 ) ) ( not ( = ?auto_443848 ?auto_443858 ) ) ( not ( = ?auto_443848 ?auto_443859 ) ) ( not ( = ?auto_443848 ?auto_443860 ) ) ( not ( = ?auto_443848 ?auto_443861 ) ) ( not ( = ?auto_443849 ?auto_443850 ) ) ( not ( = ?auto_443849 ?auto_443851 ) ) ( not ( = ?auto_443849 ?auto_443852 ) ) ( not ( = ?auto_443849 ?auto_443853 ) ) ( not ( = ?auto_443849 ?auto_443854 ) ) ( not ( = ?auto_443849 ?auto_443855 ) ) ( not ( = ?auto_443849 ?auto_443856 ) ) ( not ( = ?auto_443849 ?auto_443857 ) ) ( not ( = ?auto_443849 ?auto_443858 ) ) ( not ( = ?auto_443849 ?auto_443859 ) ) ( not ( = ?auto_443849 ?auto_443860 ) ) ( not ( = ?auto_443849 ?auto_443861 ) ) ( not ( = ?auto_443850 ?auto_443851 ) ) ( not ( = ?auto_443850 ?auto_443852 ) ) ( not ( = ?auto_443850 ?auto_443853 ) ) ( not ( = ?auto_443850 ?auto_443854 ) ) ( not ( = ?auto_443850 ?auto_443855 ) ) ( not ( = ?auto_443850 ?auto_443856 ) ) ( not ( = ?auto_443850 ?auto_443857 ) ) ( not ( = ?auto_443850 ?auto_443858 ) ) ( not ( = ?auto_443850 ?auto_443859 ) ) ( not ( = ?auto_443850 ?auto_443860 ) ) ( not ( = ?auto_443850 ?auto_443861 ) ) ( not ( = ?auto_443851 ?auto_443852 ) ) ( not ( = ?auto_443851 ?auto_443853 ) ) ( not ( = ?auto_443851 ?auto_443854 ) ) ( not ( = ?auto_443851 ?auto_443855 ) ) ( not ( = ?auto_443851 ?auto_443856 ) ) ( not ( = ?auto_443851 ?auto_443857 ) ) ( not ( = ?auto_443851 ?auto_443858 ) ) ( not ( = ?auto_443851 ?auto_443859 ) ) ( not ( = ?auto_443851 ?auto_443860 ) ) ( not ( = ?auto_443851 ?auto_443861 ) ) ( not ( = ?auto_443852 ?auto_443853 ) ) ( not ( = ?auto_443852 ?auto_443854 ) ) ( not ( = ?auto_443852 ?auto_443855 ) ) ( not ( = ?auto_443852 ?auto_443856 ) ) ( not ( = ?auto_443852 ?auto_443857 ) ) ( not ( = ?auto_443852 ?auto_443858 ) ) ( not ( = ?auto_443852 ?auto_443859 ) ) ( not ( = ?auto_443852 ?auto_443860 ) ) ( not ( = ?auto_443852 ?auto_443861 ) ) ( not ( = ?auto_443853 ?auto_443854 ) ) ( not ( = ?auto_443853 ?auto_443855 ) ) ( not ( = ?auto_443853 ?auto_443856 ) ) ( not ( = ?auto_443853 ?auto_443857 ) ) ( not ( = ?auto_443853 ?auto_443858 ) ) ( not ( = ?auto_443853 ?auto_443859 ) ) ( not ( = ?auto_443853 ?auto_443860 ) ) ( not ( = ?auto_443853 ?auto_443861 ) ) ( not ( = ?auto_443854 ?auto_443855 ) ) ( not ( = ?auto_443854 ?auto_443856 ) ) ( not ( = ?auto_443854 ?auto_443857 ) ) ( not ( = ?auto_443854 ?auto_443858 ) ) ( not ( = ?auto_443854 ?auto_443859 ) ) ( not ( = ?auto_443854 ?auto_443860 ) ) ( not ( = ?auto_443854 ?auto_443861 ) ) ( not ( = ?auto_443855 ?auto_443856 ) ) ( not ( = ?auto_443855 ?auto_443857 ) ) ( not ( = ?auto_443855 ?auto_443858 ) ) ( not ( = ?auto_443855 ?auto_443859 ) ) ( not ( = ?auto_443855 ?auto_443860 ) ) ( not ( = ?auto_443855 ?auto_443861 ) ) ( not ( = ?auto_443856 ?auto_443857 ) ) ( not ( = ?auto_443856 ?auto_443858 ) ) ( not ( = ?auto_443856 ?auto_443859 ) ) ( not ( = ?auto_443856 ?auto_443860 ) ) ( not ( = ?auto_443856 ?auto_443861 ) ) ( not ( = ?auto_443857 ?auto_443858 ) ) ( not ( = ?auto_443857 ?auto_443859 ) ) ( not ( = ?auto_443857 ?auto_443860 ) ) ( not ( = ?auto_443857 ?auto_443861 ) ) ( not ( = ?auto_443858 ?auto_443859 ) ) ( not ( = ?auto_443858 ?auto_443860 ) ) ( not ( = ?auto_443858 ?auto_443861 ) ) ( not ( = ?auto_443859 ?auto_443860 ) ) ( not ( = ?auto_443859 ?auto_443861 ) ) ( not ( = ?auto_443860 ?auto_443861 ) ) ( ON ?auto_443860 ?auto_443861 ) ( ON ?auto_443859 ?auto_443860 ) ( ON ?auto_443858 ?auto_443859 ) ( ON ?auto_443857 ?auto_443858 ) ( ON ?auto_443856 ?auto_443857 ) ( ON ?auto_443855 ?auto_443856 ) ( ON ?auto_443854 ?auto_443855 ) ( ON ?auto_443853 ?auto_443854 ) ( ON ?auto_443852 ?auto_443853 ) ( ON ?auto_443851 ?auto_443852 ) ( CLEAR ?auto_443849 ) ( ON ?auto_443850 ?auto_443851 ) ( CLEAR ?auto_443850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_443847 ?auto_443848 ?auto_443849 ?auto_443850 )
      ( MAKE-15PILE ?auto_443847 ?auto_443848 ?auto_443849 ?auto_443850 ?auto_443851 ?auto_443852 ?auto_443853 ?auto_443854 ?auto_443855 ?auto_443856 ?auto_443857 ?auto_443858 ?auto_443859 ?auto_443860 ?auto_443861 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443877 - BLOCK
      ?auto_443878 - BLOCK
      ?auto_443879 - BLOCK
      ?auto_443880 - BLOCK
      ?auto_443881 - BLOCK
      ?auto_443882 - BLOCK
      ?auto_443883 - BLOCK
      ?auto_443884 - BLOCK
      ?auto_443885 - BLOCK
      ?auto_443886 - BLOCK
      ?auto_443887 - BLOCK
      ?auto_443888 - BLOCK
      ?auto_443889 - BLOCK
      ?auto_443890 - BLOCK
      ?auto_443891 - BLOCK
    )
    :vars
    (
      ?auto_443892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443891 ?auto_443892 ) ( ON-TABLE ?auto_443877 ) ( ON ?auto_443878 ?auto_443877 ) ( not ( = ?auto_443877 ?auto_443878 ) ) ( not ( = ?auto_443877 ?auto_443879 ) ) ( not ( = ?auto_443877 ?auto_443880 ) ) ( not ( = ?auto_443877 ?auto_443881 ) ) ( not ( = ?auto_443877 ?auto_443882 ) ) ( not ( = ?auto_443877 ?auto_443883 ) ) ( not ( = ?auto_443877 ?auto_443884 ) ) ( not ( = ?auto_443877 ?auto_443885 ) ) ( not ( = ?auto_443877 ?auto_443886 ) ) ( not ( = ?auto_443877 ?auto_443887 ) ) ( not ( = ?auto_443877 ?auto_443888 ) ) ( not ( = ?auto_443877 ?auto_443889 ) ) ( not ( = ?auto_443877 ?auto_443890 ) ) ( not ( = ?auto_443877 ?auto_443891 ) ) ( not ( = ?auto_443877 ?auto_443892 ) ) ( not ( = ?auto_443878 ?auto_443879 ) ) ( not ( = ?auto_443878 ?auto_443880 ) ) ( not ( = ?auto_443878 ?auto_443881 ) ) ( not ( = ?auto_443878 ?auto_443882 ) ) ( not ( = ?auto_443878 ?auto_443883 ) ) ( not ( = ?auto_443878 ?auto_443884 ) ) ( not ( = ?auto_443878 ?auto_443885 ) ) ( not ( = ?auto_443878 ?auto_443886 ) ) ( not ( = ?auto_443878 ?auto_443887 ) ) ( not ( = ?auto_443878 ?auto_443888 ) ) ( not ( = ?auto_443878 ?auto_443889 ) ) ( not ( = ?auto_443878 ?auto_443890 ) ) ( not ( = ?auto_443878 ?auto_443891 ) ) ( not ( = ?auto_443878 ?auto_443892 ) ) ( not ( = ?auto_443879 ?auto_443880 ) ) ( not ( = ?auto_443879 ?auto_443881 ) ) ( not ( = ?auto_443879 ?auto_443882 ) ) ( not ( = ?auto_443879 ?auto_443883 ) ) ( not ( = ?auto_443879 ?auto_443884 ) ) ( not ( = ?auto_443879 ?auto_443885 ) ) ( not ( = ?auto_443879 ?auto_443886 ) ) ( not ( = ?auto_443879 ?auto_443887 ) ) ( not ( = ?auto_443879 ?auto_443888 ) ) ( not ( = ?auto_443879 ?auto_443889 ) ) ( not ( = ?auto_443879 ?auto_443890 ) ) ( not ( = ?auto_443879 ?auto_443891 ) ) ( not ( = ?auto_443879 ?auto_443892 ) ) ( not ( = ?auto_443880 ?auto_443881 ) ) ( not ( = ?auto_443880 ?auto_443882 ) ) ( not ( = ?auto_443880 ?auto_443883 ) ) ( not ( = ?auto_443880 ?auto_443884 ) ) ( not ( = ?auto_443880 ?auto_443885 ) ) ( not ( = ?auto_443880 ?auto_443886 ) ) ( not ( = ?auto_443880 ?auto_443887 ) ) ( not ( = ?auto_443880 ?auto_443888 ) ) ( not ( = ?auto_443880 ?auto_443889 ) ) ( not ( = ?auto_443880 ?auto_443890 ) ) ( not ( = ?auto_443880 ?auto_443891 ) ) ( not ( = ?auto_443880 ?auto_443892 ) ) ( not ( = ?auto_443881 ?auto_443882 ) ) ( not ( = ?auto_443881 ?auto_443883 ) ) ( not ( = ?auto_443881 ?auto_443884 ) ) ( not ( = ?auto_443881 ?auto_443885 ) ) ( not ( = ?auto_443881 ?auto_443886 ) ) ( not ( = ?auto_443881 ?auto_443887 ) ) ( not ( = ?auto_443881 ?auto_443888 ) ) ( not ( = ?auto_443881 ?auto_443889 ) ) ( not ( = ?auto_443881 ?auto_443890 ) ) ( not ( = ?auto_443881 ?auto_443891 ) ) ( not ( = ?auto_443881 ?auto_443892 ) ) ( not ( = ?auto_443882 ?auto_443883 ) ) ( not ( = ?auto_443882 ?auto_443884 ) ) ( not ( = ?auto_443882 ?auto_443885 ) ) ( not ( = ?auto_443882 ?auto_443886 ) ) ( not ( = ?auto_443882 ?auto_443887 ) ) ( not ( = ?auto_443882 ?auto_443888 ) ) ( not ( = ?auto_443882 ?auto_443889 ) ) ( not ( = ?auto_443882 ?auto_443890 ) ) ( not ( = ?auto_443882 ?auto_443891 ) ) ( not ( = ?auto_443882 ?auto_443892 ) ) ( not ( = ?auto_443883 ?auto_443884 ) ) ( not ( = ?auto_443883 ?auto_443885 ) ) ( not ( = ?auto_443883 ?auto_443886 ) ) ( not ( = ?auto_443883 ?auto_443887 ) ) ( not ( = ?auto_443883 ?auto_443888 ) ) ( not ( = ?auto_443883 ?auto_443889 ) ) ( not ( = ?auto_443883 ?auto_443890 ) ) ( not ( = ?auto_443883 ?auto_443891 ) ) ( not ( = ?auto_443883 ?auto_443892 ) ) ( not ( = ?auto_443884 ?auto_443885 ) ) ( not ( = ?auto_443884 ?auto_443886 ) ) ( not ( = ?auto_443884 ?auto_443887 ) ) ( not ( = ?auto_443884 ?auto_443888 ) ) ( not ( = ?auto_443884 ?auto_443889 ) ) ( not ( = ?auto_443884 ?auto_443890 ) ) ( not ( = ?auto_443884 ?auto_443891 ) ) ( not ( = ?auto_443884 ?auto_443892 ) ) ( not ( = ?auto_443885 ?auto_443886 ) ) ( not ( = ?auto_443885 ?auto_443887 ) ) ( not ( = ?auto_443885 ?auto_443888 ) ) ( not ( = ?auto_443885 ?auto_443889 ) ) ( not ( = ?auto_443885 ?auto_443890 ) ) ( not ( = ?auto_443885 ?auto_443891 ) ) ( not ( = ?auto_443885 ?auto_443892 ) ) ( not ( = ?auto_443886 ?auto_443887 ) ) ( not ( = ?auto_443886 ?auto_443888 ) ) ( not ( = ?auto_443886 ?auto_443889 ) ) ( not ( = ?auto_443886 ?auto_443890 ) ) ( not ( = ?auto_443886 ?auto_443891 ) ) ( not ( = ?auto_443886 ?auto_443892 ) ) ( not ( = ?auto_443887 ?auto_443888 ) ) ( not ( = ?auto_443887 ?auto_443889 ) ) ( not ( = ?auto_443887 ?auto_443890 ) ) ( not ( = ?auto_443887 ?auto_443891 ) ) ( not ( = ?auto_443887 ?auto_443892 ) ) ( not ( = ?auto_443888 ?auto_443889 ) ) ( not ( = ?auto_443888 ?auto_443890 ) ) ( not ( = ?auto_443888 ?auto_443891 ) ) ( not ( = ?auto_443888 ?auto_443892 ) ) ( not ( = ?auto_443889 ?auto_443890 ) ) ( not ( = ?auto_443889 ?auto_443891 ) ) ( not ( = ?auto_443889 ?auto_443892 ) ) ( not ( = ?auto_443890 ?auto_443891 ) ) ( not ( = ?auto_443890 ?auto_443892 ) ) ( not ( = ?auto_443891 ?auto_443892 ) ) ( ON ?auto_443890 ?auto_443891 ) ( ON ?auto_443889 ?auto_443890 ) ( ON ?auto_443888 ?auto_443889 ) ( ON ?auto_443887 ?auto_443888 ) ( ON ?auto_443886 ?auto_443887 ) ( ON ?auto_443885 ?auto_443886 ) ( ON ?auto_443884 ?auto_443885 ) ( ON ?auto_443883 ?auto_443884 ) ( ON ?auto_443882 ?auto_443883 ) ( ON ?auto_443881 ?auto_443882 ) ( ON ?auto_443880 ?auto_443881 ) ( CLEAR ?auto_443878 ) ( ON ?auto_443879 ?auto_443880 ) ( CLEAR ?auto_443879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_443877 ?auto_443878 ?auto_443879 )
      ( MAKE-15PILE ?auto_443877 ?auto_443878 ?auto_443879 ?auto_443880 ?auto_443881 ?auto_443882 ?auto_443883 ?auto_443884 ?auto_443885 ?auto_443886 ?auto_443887 ?auto_443888 ?auto_443889 ?auto_443890 ?auto_443891 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443908 - BLOCK
      ?auto_443909 - BLOCK
      ?auto_443910 - BLOCK
      ?auto_443911 - BLOCK
      ?auto_443912 - BLOCK
      ?auto_443913 - BLOCK
      ?auto_443914 - BLOCK
      ?auto_443915 - BLOCK
      ?auto_443916 - BLOCK
      ?auto_443917 - BLOCK
      ?auto_443918 - BLOCK
      ?auto_443919 - BLOCK
      ?auto_443920 - BLOCK
      ?auto_443921 - BLOCK
      ?auto_443922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443922 ) ( ON-TABLE ?auto_443908 ) ( ON ?auto_443909 ?auto_443908 ) ( not ( = ?auto_443908 ?auto_443909 ) ) ( not ( = ?auto_443908 ?auto_443910 ) ) ( not ( = ?auto_443908 ?auto_443911 ) ) ( not ( = ?auto_443908 ?auto_443912 ) ) ( not ( = ?auto_443908 ?auto_443913 ) ) ( not ( = ?auto_443908 ?auto_443914 ) ) ( not ( = ?auto_443908 ?auto_443915 ) ) ( not ( = ?auto_443908 ?auto_443916 ) ) ( not ( = ?auto_443908 ?auto_443917 ) ) ( not ( = ?auto_443908 ?auto_443918 ) ) ( not ( = ?auto_443908 ?auto_443919 ) ) ( not ( = ?auto_443908 ?auto_443920 ) ) ( not ( = ?auto_443908 ?auto_443921 ) ) ( not ( = ?auto_443908 ?auto_443922 ) ) ( not ( = ?auto_443909 ?auto_443910 ) ) ( not ( = ?auto_443909 ?auto_443911 ) ) ( not ( = ?auto_443909 ?auto_443912 ) ) ( not ( = ?auto_443909 ?auto_443913 ) ) ( not ( = ?auto_443909 ?auto_443914 ) ) ( not ( = ?auto_443909 ?auto_443915 ) ) ( not ( = ?auto_443909 ?auto_443916 ) ) ( not ( = ?auto_443909 ?auto_443917 ) ) ( not ( = ?auto_443909 ?auto_443918 ) ) ( not ( = ?auto_443909 ?auto_443919 ) ) ( not ( = ?auto_443909 ?auto_443920 ) ) ( not ( = ?auto_443909 ?auto_443921 ) ) ( not ( = ?auto_443909 ?auto_443922 ) ) ( not ( = ?auto_443910 ?auto_443911 ) ) ( not ( = ?auto_443910 ?auto_443912 ) ) ( not ( = ?auto_443910 ?auto_443913 ) ) ( not ( = ?auto_443910 ?auto_443914 ) ) ( not ( = ?auto_443910 ?auto_443915 ) ) ( not ( = ?auto_443910 ?auto_443916 ) ) ( not ( = ?auto_443910 ?auto_443917 ) ) ( not ( = ?auto_443910 ?auto_443918 ) ) ( not ( = ?auto_443910 ?auto_443919 ) ) ( not ( = ?auto_443910 ?auto_443920 ) ) ( not ( = ?auto_443910 ?auto_443921 ) ) ( not ( = ?auto_443910 ?auto_443922 ) ) ( not ( = ?auto_443911 ?auto_443912 ) ) ( not ( = ?auto_443911 ?auto_443913 ) ) ( not ( = ?auto_443911 ?auto_443914 ) ) ( not ( = ?auto_443911 ?auto_443915 ) ) ( not ( = ?auto_443911 ?auto_443916 ) ) ( not ( = ?auto_443911 ?auto_443917 ) ) ( not ( = ?auto_443911 ?auto_443918 ) ) ( not ( = ?auto_443911 ?auto_443919 ) ) ( not ( = ?auto_443911 ?auto_443920 ) ) ( not ( = ?auto_443911 ?auto_443921 ) ) ( not ( = ?auto_443911 ?auto_443922 ) ) ( not ( = ?auto_443912 ?auto_443913 ) ) ( not ( = ?auto_443912 ?auto_443914 ) ) ( not ( = ?auto_443912 ?auto_443915 ) ) ( not ( = ?auto_443912 ?auto_443916 ) ) ( not ( = ?auto_443912 ?auto_443917 ) ) ( not ( = ?auto_443912 ?auto_443918 ) ) ( not ( = ?auto_443912 ?auto_443919 ) ) ( not ( = ?auto_443912 ?auto_443920 ) ) ( not ( = ?auto_443912 ?auto_443921 ) ) ( not ( = ?auto_443912 ?auto_443922 ) ) ( not ( = ?auto_443913 ?auto_443914 ) ) ( not ( = ?auto_443913 ?auto_443915 ) ) ( not ( = ?auto_443913 ?auto_443916 ) ) ( not ( = ?auto_443913 ?auto_443917 ) ) ( not ( = ?auto_443913 ?auto_443918 ) ) ( not ( = ?auto_443913 ?auto_443919 ) ) ( not ( = ?auto_443913 ?auto_443920 ) ) ( not ( = ?auto_443913 ?auto_443921 ) ) ( not ( = ?auto_443913 ?auto_443922 ) ) ( not ( = ?auto_443914 ?auto_443915 ) ) ( not ( = ?auto_443914 ?auto_443916 ) ) ( not ( = ?auto_443914 ?auto_443917 ) ) ( not ( = ?auto_443914 ?auto_443918 ) ) ( not ( = ?auto_443914 ?auto_443919 ) ) ( not ( = ?auto_443914 ?auto_443920 ) ) ( not ( = ?auto_443914 ?auto_443921 ) ) ( not ( = ?auto_443914 ?auto_443922 ) ) ( not ( = ?auto_443915 ?auto_443916 ) ) ( not ( = ?auto_443915 ?auto_443917 ) ) ( not ( = ?auto_443915 ?auto_443918 ) ) ( not ( = ?auto_443915 ?auto_443919 ) ) ( not ( = ?auto_443915 ?auto_443920 ) ) ( not ( = ?auto_443915 ?auto_443921 ) ) ( not ( = ?auto_443915 ?auto_443922 ) ) ( not ( = ?auto_443916 ?auto_443917 ) ) ( not ( = ?auto_443916 ?auto_443918 ) ) ( not ( = ?auto_443916 ?auto_443919 ) ) ( not ( = ?auto_443916 ?auto_443920 ) ) ( not ( = ?auto_443916 ?auto_443921 ) ) ( not ( = ?auto_443916 ?auto_443922 ) ) ( not ( = ?auto_443917 ?auto_443918 ) ) ( not ( = ?auto_443917 ?auto_443919 ) ) ( not ( = ?auto_443917 ?auto_443920 ) ) ( not ( = ?auto_443917 ?auto_443921 ) ) ( not ( = ?auto_443917 ?auto_443922 ) ) ( not ( = ?auto_443918 ?auto_443919 ) ) ( not ( = ?auto_443918 ?auto_443920 ) ) ( not ( = ?auto_443918 ?auto_443921 ) ) ( not ( = ?auto_443918 ?auto_443922 ) ) ( not ( = ?auto_443919 ?auto_443920 ) ) ( not ( = ?auto_443919 ?auto_443921 ) ) ( not ( = ?auto_443919 ?auto_443922 ) ) ( not ( = ?auto_443920 ?auto_443921 ) ) ( not ( = ?auto_443920 ?auto_443922 ) ) ( not ( = ?auto_443921 ?auto_443922 ) ) ( ON ?auto_443921 ?auto_443922 ) ( ON ?auto_443920 ?auto_443921 ) ( ON ?auto_443919 ?auto_443920 ) ( ON ?auto_443918 ?auto_443919 ) ( ON ?auto_443917 ?auto_443918 ) ( ON ?auto_443916 ?auto_443917 ) ( ON ?auto_443915 ?auto_443916 ) ( ON ?auto_443914 ?auto_443915 ) ( ON ?auto_443913 ?auto_443914 ) ( ON ?auto_443912 ?auto_443913 ) ( ON ?auto_443911 ?auto_443912 ) ( CLEAR ?auto_443909 ) ( ON ?auto_443910 ?auto_443911 ) ( CLEAR ?auto_443910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_443908 ?auto_443909 ?auto_443910 )
      ( MAKE-15PILE ?auto_443908 ?auto_443909 ?auto_443910 ?auto_443911 ?auto_443912 ?auto_443913 ?auto_443914 ?auto_443915 ?auto_443916 ?auto_443917 ?auto_443918 ?auto_443919 ?auto_443920 ?auto_443921 ?auto_443922 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443938 - BLOCK
      ?auto_443939 - BLOCK
      ?auto_443940 - BLOCK
      ?auto_443941 - BLOCK
      ?auto_443942 - BLOCK
      ?auto_443943 - BLOCK
      ?auto_443944 - BLOCK
      ?auto_443945 - BLOCK
      ?auto_443946 - BLOCK
      ?auto_443947 - BLOCK
      ?auto_443948 - BLOCK
      ?auto_443949 - BLOCK
      ?auto_443950 - BLOCK
      ?auto_443951 - BLOCK
      ?auto_443952 - BLOCK
    )
    :vars
    (
      ?auto_443953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_443952 ?auto_443953 ) ( ON-TABLE ?auto_443938 ) ( not ( = ?auto_443938 ?auto_443939 ) ) ( not ( = ?auto_443938 ?auto_443940 ) ) ( not ( = ?auto_443938 ?auto_443941 ) ) ( not ( = ?auto_443938 ?auto_443942 ) ) ( not ( = ?auto_443938 ?auto_443943 ) ) ( not ( = ?auto_443938 ?auto_443944 ) ) ( not ( = ?auto_443938 ?auto_443945 ) ) ( not ( = ?auto_443938 ?auto_443946 ) ) ( not ( = ?auto_443938 ?auto_443947 ) ) ( not ( = ?auto_443938 ?auto_443948 ) ) ( not ( = ?auto_443938 ?auto_443949 ) ) ( not ( = ?auto_443938 ?auto_443950 ) ) ( not ( = ?auto_443938 ?auto_443951 ) ) ( not ( = ?auto_443938 ?auto_443952 ) ) ( not ( = ?auto_443938 ?auto_443953 ) ) ( not ( = ?auto_443939 ?auto_443940 ) ) ( not ( = ?auto_443939 ?auto_443941 ) ) ( not ( = ?auto_443939 ?auto_443942 ) ) ( not ( = ?auto_443939 ?auto_443943 ) ) ( not ( = ?auto_443939 ?auto_443944 ) ) ( not ( = ?auto_443939 ?auto_443945 ) ) ( not ( = ?auto_443939 ?auto_443946 ) ) ( not ( = ?auto_443939 ?auto_443947 ) ) ( not ( = ?auto_443939 ?auto_443948 ) ) ( not ( = ?auto_443939 ?auto_443949 ) ) ( not ( = ?auto_443939 ?auto_443950 ) ) ( not ( = ?auto_443939 ?auto_443951 ) ) ( not ( = ?auto_443939 ?auto_443952 ) ) ( not ( = ?auto_443939 ?auto_443953 ) ) ( not ( = ?auto_443940 ?auto_443941 ) ) ( not ( = ?auto_443940 ?auto_443942 ) ) ( not ( = ?auto_443940 ?auto_443943 ) ) ( not ( = ?auto_443940 ?auto_443944 ) ) ( not ( = ?auto_443940 ?auto_443945 ) ) ( not ( = ?auto_443940 ?auto_443946 ) ) ( not ( = ?auto_443940 ?auto_443947 ) ) ( not ( = ?auto_443940 ?auto_443948 ) ) ( not ( = ?auto_443940 ?auto_443949 ) ) ( not ( = ?auto_443940 ?auto_443950 ) ) ( not ( = ?auto_443940 ?auto_443951 ) ) ( not ( = ?auto_443940 ?auto_443952 ) ) ( not ( = ?auto_443940 ?auto_443953 ) ) ( not ( = ?auto_443941 ?auto_443942 ) ) ( not ( = ?auto_443941 ?auto_443943 ) ) ( not ( = ?auto_443941 ?auto_443944 ) ) ( not ( = ?auto_443941 ?auto_443945 ) ) ( not ( = ?auto_443941 ?auto_443946 ) ) ( not ( = ?auto_443941 ?auto_443947 ) ) ( not ( = ?auto_443941 ?auto_443948 ) ) ( not ( = ?auto_443941 ?auto_443949 ) ) ( not ( = ?auto_443941 ?auto_443950 ) ) ( not ( = ?auto_443941 ?auto_443951 ) ) ( not ( = ?auto_443941 ?auto_443952 ) ) ( not ( = ?auto_443941 ?auto_443953 ) ) ( not ( = ?auto_443942 ?auto_443943 ) ) ( not ( = ?auto_443942 ?auto_443944 ) ) ( not ( = ?auto_443942 ?auto_443945 ) ) ( not ( = ?auto_443942 ?auto_443946 ) ) ( not ( = ?auto_443942 ?auto_443947 ) ) ( not ( = ?auto_443942 ?auto_443948 ) ) ( not ( = ?auto_443942 ?auto_443949 ) ) ( not ( = ?auto_443942 ?auto_443950 ) ) ( not ( = ?auto_443942 ?auto_443951 ) ) ( not ( = ?auto_443942 ?auto_443952 ) ) ( not ( = ?auto_443942 ?auto_443953 ) ) ( not ( = ?auto_443943 ?auto_443944 ) ) ( not ( = ?auto_443943 ?auto_443945 ) ) ( not ( = ?auto_443943 ?auto_443946 ) ) ( not ( = ?auto_443943 ?auto_443947 ) ) ( not ( = ?auto_443943 ?auto_443948 ) ) ( not ( = ?auto_443943 ?auto_443949 ) ) ( not ( = ?auto_443943 ?auto_443950 ) ) ( not ( = ?auto_443943 ?auto_443951 ) ) ( not ( = ?auto_443943 ?auto_443952 ) ) ( not ( = ?auto_443943 ?auto_443953 ) ) ( not ( = ?auto_443944 ?auto_443945 ) ) ( not ( = ?auto_443944 ?auto_443946 ) ) ( not ( = ?auto_443944 ?auto_443947 ) ) ( not ( = ?auto_443944 ?auto_443948 ) ) ( not ( = ?auto_443944 ?auto_443949 ) ) ( not ( = ?auto_443944 ?auto_443950 ) ) ( not ( = ?auto_443944 ?auto_443951 ) ) ( not ( = ?auto_443944 ?auto_443952 ) ) ( not ( = ?auto_443944 ?auto_443953 ) ) ( not ( = ?auto_443945 ?auto_443946 ) ) ( not ( = ?auto_443945 ?auto_443947 ) ) ( not ( = ?auto_443945 ?auto_443948 ) ) ( not ( = ?auto_443945 ?auto_443949 ) ) ( not ( = ?auto_443945 ?auto_443950 ) ) ( not ( = ?auto_443945 ?auto_443951 ) ) ( not ( = ?auto_443945 ?auto_443952 ) ) ( not ( = ?auto_443945 ?auto_443953 ) ) ( not ( = ?auto_443946 ?auto_443947 ) ) ( not ( = ?auto_443946 ?auto_443948 ) ) ( not ( = ?auto_443946 ?auto_443949 ) ) ( not ( = ?auto_443946 ?auto_443950 ) ) ( not ( = ?auto_443946 ?auto_443951 ) ) ( not ( = ?auto_443946 ?auto_443952 ) ) ( not ( = ?auto_443946 ?auto_443953 ) ) ( not ( = ?auto_443947 ?auto_443948 ) ) ( not ( = ?auto_443947 ?auto_443949 ) ) ( not ( = ?auto_443947 ?auto_443950 ) ) ( not ( = ?auto_443947 ?auto_443951 ) ) ( not ( = ?auto_443947 ?auto_443952 ) ) ( not ( = ?auto_443947 ?auto_443953 ) ) ( not ( = ?auto_443948 ?auto_443949 ) ) ( not ( = ?auto_443948 ?auto_443950 ) ) ( not ( = ?auto_443948 ?auto_443951 ) ) ( not ( = ?auto_443948 ?auto_443952 ) ) ( not ( = ?auto_443948 ?auto_443953 ) ) ( not ( = ?auto_443949 ?auto_443950 ) ) ( not ( = ?auto_443949 ?auto_443951 ) ) ( not ( = ?auto_443949 ?auto_443952 ) ) ( not ( = ?auto_443949 ?auto_443953 ) ) ( not ( = ?auto_443950 ?auto_443951 ) ) ( not ( = ?auto_443950 ?auto_443952 ) ) ( not ( = ?auto_443950 ?auto_443953 ) ) ( not ( = ?auto_443951 ?auto_443952 ) ) ( not ( = ?auto_443951 ?auto_443953 ) ) ( not ( = ?auto_443952 ?auto_443953 ) ) ( ON ?auto_443951 ?auto_443952 ) ( ON ?auto_443950 ?auto_443951 ) ( ON ?auto_443949 ?auto_443950 ) ( ON ?auto_443948 ?auto_443949 ) ( ON ?auto_443947 ?auto_443948 ) ( ON ?auto_443946 ?auto_443947 ) ( ON ?auto_443945 ?auto_443946 ) ( ON ?auto_443944 ?auto_443945 ) ( ON ?auto_443943 ?auto_443944 ) ( ON ?auto_443942 ?auto_443943 ) ( ON ?auto_443941 ?auto_443942 ) ( ON ?auto_443940 ?auto_443941 ) ( CLEAR ?auto_443938 ) ( ON ?auto_443939 ?auto_443940 ) ( CLEAR ?auto_443939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_443938 ?auto_443939 )
      ( MAKE-15PILE ?auto_443938 ?auto_443939 ?auto_443940 ?auto_443941 ?auto_443942 ?auto_443943 ?auto_443944 ?auto_443945 ?auto_443946 ?auto_443947 ?auto_443948 ?auto_443949 ?auto_443950 ?auto_443951 ?auto_443952 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443969 - BLOCK
      ?auto_443970 - BLOCK
      ?auto_443971 - BLOCK
      ?auto_443972 - BLOCK
      ?auto_443973 - BLOCK
      ?auto_443974 - BLOCK
      ?auto_443975 - BLOCK
      ?auto_443976 - BLOCK
      ?auto_443977 - BLOCK
      ?auto_443978 - BLOCK
      ?auto_443979 - BLOCK
      ?auto_443980 - BLOCK
      ?auto_443981 - BLOCK
      ?auto_443982 - BLOCK
      ?auto_443983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_443983 ) ( ON-TABLE ?auto_443969 ) ( not ( = ?auto_443969 ?auto_443970 ) ) ( not ( = ?auto_443969 ?auto_443971 ) ) ( not ( = ?auto_443969 ?auto_443972 ) ) ( not ( = ?auto_443969 ?auto_443973 ) ) ( not ( = ?auto_443969 ?auto_443974 ) ) ( not ( = ?auto_443969 ?auto_443975 ) ) ( not ( = ?auto_443969 ?auto_443976 ) ) ( not ( = ?auto_443969 ?auto_443977 ) ) ( not ( = ?auto_443969 ?auto_443978 ) ) ( not ( = ?auto_443969 ?auto_443979 ) ) ( not ( = ?auto_443969 ?auto_443980 ) ) ( not ( = ?auto_443969 ?auto_443981 ) ) ( not ( = ?auto_443969 ?auto_443982 ) ) ( not ( = ?auto_443969 ?auto_443983 ) ) ( not ( = ?auto_443970 ?auto_443971 ) ) ( not ( = ?auto_443970 ?auto_443972 ) ) ( not ( = ?auto_443970 ?auto_443973 ) ) ( not ( = ?auto_443970 ?auto_443974 ) ) ( not ( = ?auto_443970 ?auto_443975 ) ) ( not ( = ?auto_443970 ?auto_443976 ) ) ( not ( = ?auto_443970 ?auto_443977 ) ) ( not ( = ?auto_443970 ?auto_443978 ) ) ( not ( = ?auto_443970 ?auto_443979 ) ) ( not ( = ?auto_443970 ?auto_443980 ) ) ( not ( = ?auto_443970 ?auto_443981 ) ) ( not ( = ?auto_443970 ?auto_443982 ) ) ( not ( = ?auto_443970 ?auto_443983 ) ) ( not ( = ?auto_443971 ?auto_443972 ) ) ( not ( = ?auto_443971 ?auto_443973 ) ) ( not ( = ?auto_443971 ?auto_443974 ) ) ( not ( = ?auto_443971 ?auto_443975 ) ) ( not ( = ?auto_443971 ?auto_443976 ) ) ( not ( = ?auto_443971 ?auto_443977 ) ) ( not ( = ?auto_443971 ?auto_443978 ) ) ( not ( = ?auto_443971 ?auto_443979 ) ) ( not ( = ?auto_443971 ?auto_443980 ) ) ( not ( = ?auto_443971 ?auto_443981 ) ) ( not ( = ?auto_443971 ?auto_443982 ) ) ( not ( = ?auto_443971 ?auto_443983 ) ) ( not ( = ?auto_443972 ?auto_443973 ) ) ( not ( = ?auto_443972 ?auto_443974 ) ) ( not ( = ?auto_443972 ?auto_443975 ) ) ( not ( = ?auto_443972 ?auto_443976 ) ) ( not ( = ?auto_443972 ?auto_443977 ) ) ( not ( = ?auto_443972 ?auto_443978 ) ) ( not ( = ?auto_443972 ?auto_443979 ) ) ( not ( = ?auto_443972 ?auto_443980 ) ) ( not ( = ?auto_443972 ?auto_443981 ) ) ( not ( = ?auto_443972 ?auto_443982 ) ) ( not ( = ?auto_443972 ?auto_443983 ) ) ( not ( = ?auto_443973 ?auto_443974 ) ) ( not ( = ?auto_443973 ?auto_443975 ) ) ( not ( = ?auto_443973 ?auto_443976 ) ) ( not ( = ?auto_443973 ?auto_443977 ) ) ( not ( = ?auto_443973 ?auto_443978 ) ) ( not ( = ?auto_443973 ?auto_443979 ) ) ( not ( = ?auto_443973 ?auto_443980 ) ) ( not ( = ?auto_443973 ?auto_443981 ) ) ( not ( = ?auto_443973 ?auto_443982 ) ) ( not ( = ?auto_443973 ?auto_443983 ) ) ( not ( = ?auto_443974 ?auto_443975 ) ) ( not ( = ?auto_443974 ?auto_443976 ) ) ( not ( = ?auto_443974 ?auto_443977 ) ) ( not ( = ?auto_443974 ?auto_443978 ) ) ( not ( = ?auto_443974 ?auto_443979 ) ) ( not ( = ?auto_443974 ?auto_443980 ) ) ( not ( = ?auto_443974 ?auto_443981 ) ) ( not ( = ?auto_443974 ?auto_443982 ) ) ( not ( = ?auto_443974 ?auto_443983 ) ) ( not ( = ?auto_443975 ?auto_443976 ) ) ( not ( = ?auto_443975 ?auto_443977 ) ) ( not ( = ?auto_443975 ?auto_443978 ) ) ( not ( = ?auto_443975 ?auto_443979 ) ) ( not ( = ?auto_443975 ?auto_443980 ) ) ( not ( = ?auto_443975 ?auto_443981 ) ) ( not ( = ?auto_443975 ?auto_443982 ) ) ( not ( = ?auto_443975 ?auto_443983 ) ) ( not ( = ?auto_443976 ?auto_443977 ) ) ( not ( = ?auto_443976 ?auto_443978 ) ) ( not ( = ?auto_443976 ?auto_443979 ) ) ( not ( = ?auto_443976 ?auto_443980 ) ) ( not ( = ?auto_443976 ?auto_443981 ) ) ( not ( = ?auto_443976 ?auto_443982 ) ) ( not ( = ?auto_443976 ?auto_443983 ) ) ( not ( = ?auto_443977 ?auto_443978 ) ) ( not ( = ?auto_443977 ?auto_443979 ) ) ( not ( = ?auto_443977 ?auto_443980 ) ) ( not ( = ?auto_443977 ?auto_443981 ) ) ( not ( = ?auto_443977 ?auto_443982 ) ) ( not ( = ?auto_443977 ?auto_443983 ) ) ( not ( = ?auto_443978 ?auto_443979 ) ) ( not ( = ?auto_443978 ?auto_443980 ) ) ( not ( = ?auto_443978 ?auto_443981 ) ) ( not ( = ?auto_443978 ?auto_443982 ) ) ( not ( = ?auto_443978 ?auto_443983 ) ) ( not ( = ?auto_443979 ?auto_443980 ) ) ( not ( = ?auto_443979 ?auto_443981 ) ) ( not ( = ?auto_443979 ?auto_443982 ) ) ( not ( = ?auto_443979 ?auto_443983 ) ) ( not ( = ?auto_443980 ?auto_443981 ) ) ( not ( = ?auto_443980 ?auto_443982 ) ) ( not ( = ?auto_443980 ?auto_443983 ) ) ( not ( = ?auto_443981 ?auto_443982 ) ) ( not ( = ?auto_443981 ?auto_443983 ) ) ( not ( = ?auto_443982 ?auto_443983 ) ) ( ON ?auto_443982 ?auto_443983 ) ( ON ?auto_443981 ?auto_443982 ) ( ON ?auto_443980 ?auto_443981 ) ( ON ?auto_443979 ?auto_443980 ) ( ON ?auto_443978 ?auto_443979 ) ( ON ?auto_443977 ?auto_443978 ) ( ON ?auto_443976 ?auto_443977 ) ( ON ?auto_443975 ?auto_443976 ) ( ON ?auto_443974 ?auto_443975 ) ( ON ?auto_443973 ?auto_443974 ) ( ON ?auto_443972 ?auto_443973 ) ( ON ?auto_443971 ?auto_443972 ) ( CLEAR ?auto_443969 ) ( ON ?auto_443970 ?auto_443971 ) ( CLEAR ?auto_443970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_443969 ?auto_443970 )
      ( MAKE-15PILE ?auto_443969 ?auto_443970 ?auto_443971 ?auto_443972 ?auto_443973 ?auto_443974 ?auto_443975 ?auto_443976 ?auto_443977 ?auto_443978 ?auto_443979 ?auto_443980 ?auto_443981 ?auto_443982 ?auto_443983 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_443999 - BLOCK
      ?auto_444000 - BLOCK
      ?auto_444001 - BLOCK
      ?auto_444002 - BLOCK
      ?auto_444003 - BLOCK
      ?auto_444004 - BLOCK
      ?auto_444005 - BLOCK
      ?auto_444006 - BLOCK
      ?auto_444007 - BLOCK
      ?auto_444008 - BLOCK
      ?auto_444009 - BLOCK
      ?auto_444010 - BLOCK
      ?auto_444011 - BLOCK
      ?auto_444012 - BLOCK
      ?auto_444013 - BLOCK
    )
    :vars
    (
      ?auto_444014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444013 ?auto_444014 ) ( not ( = ?auto_443999 ?auto_444000 ) ) ( not ( = ?auto_443999 ?auto_444001 ) ) ( not ( = ?auto_443999 ?auto_444002 ) ) ( not ( = ?auto_443999 ?auto_444003 ) ) ( not ( = ?auto_443999 ?auto_444004 ) ) ( not ( = ?auto_443999 ?auto_444005 ) ) ( not ( = ?auto_443999 ?auto_444006 ) ) ( not ( = ?auto_443999 ?auto_444007 ) ) ( not ( = ?auto_443999 ?auto_444008 ) ) ( not ( = ?auto_443999 ?auto_444009 ) ) ( not ( = ?auto_443999 ?auto_444010 ) ) ( not ( = ?auto_443999 ?auto_444011 ) ) ( not ( = ?auto_443999 ?auto_444012 ) ) ( not ( = ?auto_443999 ?auto_444013 ) ) ( not ( = ?auto_443999 ?auto_444014 ) ) ( not ( = ?auto_444000 ?auto_444001 ) ) ( not ( = ?auto_444000 ?auto_444002 ) ) ( not ( = ?auto_444000 ?auto_444003 ) ) ( not ( = ?auto_444000 ?auto_444004 ) ) ( not ( = ?auto_444000 ?auto_444005 ) ) ( not ( = ?auto_444000 ?auto_444006 ) ) ( not ( = ?auto_444000 ?auto_444007 ) ) ( not ( = ?auto_444000 ?auto_444008 ) ) ( not ( = ?auto_444000 ?auto_444009 ) ) ( not ( = ?auto_444000 ?auto_444010 ) ) ( not ( = ?auto_444000 ?auto_444011 ) ) ( not ( = ?auto_444000 ?auto_444012 ) ) ( not ( = ?auto_444000 ?auto_444013 ) ) ( not ( = ?auto_444000 ?auto_444014 ) ) ( not ( = ?auto_444001 ?auto_444002 ) ) ( not ( = ?auto_444001 ?auto_444003 ) ) ( not ( = ?auto_444001 ?auto_444004 ) ) ( not ( = ?auto_444001 ?auto_444005 ) ) ( not ( = ?auto_444001 ?auto_444006 ) ) ( not ( = ?auto_444001 ?auto_444007 ) ) ( not ( = ?auto_444001 ?auto_444008 ) ) ( not ( = ?auto_444001 ?auto_444009 ) ) ( not ( = ?auto_444001 ?auto_444010 ) ) ( not ( = ?auto_444001 ?auto_444011 ) ) ( not ( = ?auto_444001 ?auto_444012 ) ) ( not ( = ?auto_444001 ?auto_444013 ) ) ( not ( = ?auto_444001 ?auto_444014 ) ) ( not ( = ?auto_444002 ?auto_444003 ) ) ( not ( = ?auto_444002 ?auto_444004 ) ) ( not ( = ?auto_444002 ?auto_444005 ) ) ( not ( = ?auto_444002 ?auto_444006 ) ) ( not ( = ?auto_444002 ?auto_444007 ) ) ( not ( = ?auto_444002 ?auto_444008 ) ) ( not ( = ?auto_444002 ?auto_444009 ) ) ( not ( = ?auto_444002 ?auto_444010 ) ) ( not ( = ?auto_444002 ?auto_444011 ) ) ( not ( = ?auto_444002 ?auto_444012 ) ) ( not ( = ?auto_444002 ?auto_444013 ) ) ( not ( = ?auto_444002 ?auto_444014 ) ) ( not ( = ?auto_444003 ?auto_444004 ) ) ( not ( = ?auto_444003 ?auto_444005 ) ) ( not ( = ?auto_444003 ?auto_444006 ) ) ( not ( = ?auto_444003 ?auto_444007 ) ) ( not ( = ?auto_444003 ?auto_444008 ) ) ( not ( = ?auto_444003 ?auto_444009 ) ) ( not ( = ?auto_444003 ?auto_444010 ) ) ( not ( = ?auto_444003 ?auto_444011 ) ) ( not ( = ?auto_444003 ?auto_444012 ) ) ( not ( = ?auto_444003 ?auto_444013 ) ) ( not ( = ?auto_444003 ?auto_444014 ) ) ( not ( = ?auto_444004 ?auto_444005 ) ) ( not ( = ?auto_444004 ?auto_444006 ) ) ( not ( = ?auto_444004 ?auto_444007 ) ) ( not ( = ?auto_444004 ?auto_444008 ) ) ( not ( = ?auto_444004 ?auto_444009 ) ) ( not ( = ?auto_444004 ?auto_444010 ) ) ( not ( = ?auto_444004 ?auto_444011 ) ) ( not ( = ?auto_444004 ?auto_444012 ) ) ( not ( = ?auto_444004 ?auto_444013 ) ) ( not ( = ?auto_444004 ?auto_444014 ) ) ( not ( = ?auto_444005 ?auto_444006 ) ) ( not ( = ?auto_444005 ?auto_444007 ) ) ( not ( = ?auto_444005 ?auto_444008 ) ) ( not ( = ?auto_444005 ?auto_444009 ) ) ( not ( = ?auto_444005 ?auto_444010 ) ) ( not ( = ?auto_444005 ?auto_444011 ) ) ( not ( = ?auto_444005 ?auto_444012 ) ) ( not ( = ?auto_444005 ?auto_444013 ) ) ( not ( = ?auto_444005 ?auto_444014 ) ) ( not ( = ?auto_444006 ?auto_444007 ) ) ( not ( = ?auto_444006 ?auto_444008 ) ) ( not ( = ?auto_444006 ?auto_444009 ) ) ( not ( = ?auto_444006 ?auto_444010 ) ) ( not ( = ?auto_444006 ?auto_444011 ) ) ( not ( = ?auto_444006 ?auto_444012 ) ) ( not ( = ?auto_444006 ?auto_444013 ) ) ( not ( = ?auto_444006 ?auto_444014 ) ) ( not ( = ?auto_444007 ?auto_444008 ) ) ( not ( = ?auto_444007 ?auto_444009 ) ) ( not ( = ?auto_444007 ?auto_444010 ) ) ( not ( = ?auto_444007 ?auto_444011 ) ) ( not ( = ?auto_444007 ?auto_444012 ) ) ( not ( = ?auto_444007 ?auto_444013 ) ) ( not ( = ?auto_444007 ?auto_444014 ) ) ( not ( = ?auto_444008 ?auto_444009 ) ) ( not ( = ?auto_444008 ?auto_444010 ) ) ( not ( = ?auto_444008 ?auto_444011 ) ) ( not ( = ?auto_444008 ?auto_444012 ) ) ( not ( = ?auto_444008 ?auto_444013 ) ) ( not ( = ?auto_444008 ?auto_444014 ) ) ( not ( = ?auto_444009 ?auto_444010 ) ) ( not ( = ?auto_444009 ?auto_444011 ) ) ( not ( = ?auto_444009 ?auto_444012 ) ) ( not ( = ?auto_444009 ?auto_444013 ) ) ( not ( = ?auto_444009 ?auto_444014 ) ) ( not ( = ?auto_444010 ?auto_444011 ) ) ( not ( = ?auto_444010 ?auto_444012 ) ) ( not ( = ?auto_444010 ?auto_444013 ) ) ( not ( = ?auto_444010 ?auto_444014 ) ) ( not ( = ?auto_444011 ?auto_444012 ) ) ( not ( = ?auto_444011 ?auto_444013 ) ) ( not ( = ?auto_444011 ?auto_444014 ) ) ( not ( = ?auto_444012 ?auto_444013 ) ) ( not ( = ?auto_444012 ?auto_444014 ) ) ( not ( = ?auto_444013 ?auto_444014 ) ) ( ON ?auto_444012 ?auto_444013 ) ( ON ?auto_444011 ?auto_444012 ) ( ON ?auto_444010 ?auto_444011 ) ( ON ?auto_444009 ?auto_444010 ) ( ON ?auto_444008 ?auto_444009 ) ( ON ?auto_444007 ?auto_444008 ) ( ON ?auto_444006 ?auto_444007 ) ( ON ?auto_444005 ?auto_444006 ) ( ON ?auto_444004 ?auto_444005 ) ( ON ?auto_444003 ?auto_444004 ) ( ON ?auto_444002 ?auto_444003 ) ( ON ?auto_444001 ?auto_444002 ) ( ON ?auto_444000 ?auto_444001 ) ( ON ?auto_443999 ?auto_444000 ) ( CLEAR ?auto_443999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_443999 )
      ( MAKE-15PILE ?auto_443999 ?auto_444000 ?auto_444001 ?auto_444002 ?auto_444003 ?auto_444004 ?auto_444005 ?auto_444006 ?auto_444007 ?auto_444008 ?auto_444009 ?auto_444010 ?auto_444011 ?auto_444012 ?auto_444013 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_444030 - BLOCK
      ?auto_444031 - BLOCK
      ?auto_444032 - BLOCK
      ?auto_444033 - BLOCK
      ?auto_444034 - BLOCK
      ?auto_444035 - BLOCK
      ?auto_444036 - BLOCK
      ?auto_444037 - BLOCK
      ?auto_444038 - BLOCK
      ?auto_444039 - BLOCK
      ?auto_444040 - BLOCK
      ?auto_444041 - BLOCK
      ?auto_444042 - BLOCK
      ?auto_444043 - BLOCK
      ?auto_444044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_444044 ) ( not ( = ?auto_444030 ?auto_444031 ) ) ( not ( = ?auto_444030 ?auto_444032 ) ) ( not ( = ?auto_444030 ?auto_444033 ) ) ( not ( = ?auto_444030 ?auto_444034 ) ) ( not ( = ?auto_444030 ?auto_444035 ) ) ( not ( = ?auto_444030 ?auto_444036 ) ) ( not ( = ?auto_444030 ?auto_444037 ) ) ( not ( = ?auto_444030 ?auto_444038 ) ) ( not ( = ?auto_444030 ?auto_444039 ) ) ( not ( = ?auto_444030 ?auto_444040 ) ) ( not ( = ?auto_444030 ?auto_444041 ) ) ( not ( = ?auto_444030 ?auto_444042 ) ) ( not ( = ?auto_444030 ?auto_444043 ) ) ( not ( = ?auto_444030 ?auto_444044 ) ) ( not ( = ?auto_444031 ?auto_444032 ) ) ( not ( = ?auto_444031 ?auto_444033 ) ) ( not ( = ?auto_444031 ?auto_444034 ) ) ( not ( = ?auto_444031 ?auto_444035 ) ) ( not ( = ?auto_444031 ?auto_444036 ) ) ( not ( = ?auto_444031 ?auto_444037 ) ) ( not ( = ?auto_444031 ?auto_444038 ) ) ( not ( = ?auto_444031 ?auto_444039 ) ) ( not ( = ?auto_444031 ?auto_444040 ) ) ( not ( = ?auto_444031 ?auto_444041 ) ) ( not ( = ?auto_444031 ?auto_444042 ) ) ( not ( = ?auto_444031 ?auto_444043 ) ) ( not ( = ?auto_444031 ?auto_444044 ) ) ( not ( = ?auto_444032 ?auto_444033 ) ) ( not ( = ?auto_444032 ?auto_444034 ) ) ( not ( = ?auto_444032 ?auto_444035 ) ) ( not ( = ?auto_444032 ?auto_444036 ) ) ( not ( = ?auto_444032 ?auto_444037 ) ) ( not ( = ?auto_444032 ?auto_444038 ) ) ( not ( = ?auto_444032 ?auto_444039 ) ) ( not ( = ?auto_444032 ?auto_444040 ) ) ( not ( = ?auto_444032 ?auto_444041 ) ) ( not ( = ?auto_444032 ?auto_444042 ) ) ( not ( = ?auto_444032 ?auto_444043 ) ) ( not ( = ?auto_444032 ?auto_444044 ) ) ( not ( = ?auto_444033 ?auto_444034 ) ) ( not ( = ?auto_444033 ?auto_444035 ) ) ( not ( = ?auto_444033 ?auto_444036 ) ) ( not ( = ?auto_444033 ?auto_444037 ) ) ( not ( = ?auto_444033 ?auto_444038 ) ) ( not ( = ?auto_444033 ?auto_444039 ) ) ( not ( = ?auto_444033 ?auto_444040 ) ) ( not ( = ?auto_444033 ?auto_444041 ) ) ( not ( = ?auto_444033 ?auto_444042 ) ) ( not ( = ?auto_444033 ?auto_444043 ) ) ( not ( = ?auto_444033 ?auto_444044 ) ) ( not ( = ?auto_444034 ?auto_444035 ) ) ( not ( = ?auto_444034 ?auto_444036 ) ) ( not ( = ?auto_444034 ?auto_444037 ) ) ( not ( = ?auto_444034 ?auto_444038 ) ) ( not ( = ?auto_444034 ?auto_444039 ) ) ( not ( = ?auto_444034 ?auto_444040 ) ) ( not ( = ?auto_444034 ?auto_444041 ) ) ( not ( = ?auto_444034 ?auto_444042 ) ) ( not ( = ?auto_444034 ?auto_444043 ) ) ( not ( = ?auto_444034 ?auto_444044 ) ) ( not ( = ?auto_444035 ?auto_444036 ) ) ( not ( = ?auto_444035 ?auto_444037 ) ) ( not ( = ?auto_444035 ?auto_444038 ) ) ( not ( = ?auto_444035 ?auto_444039 ) ) ( not ( = ?auto_444035 ?auto_444040 ) ) ( not ( = ?auto_444035 ?auto_444041 ) ) ( not ( = ?auto_444035 ?auto_444042 ) ) ( not ( = ?auto_444035 ?auto_444043 ) ) ( not ( = ?auto_444035 ?auto_444044 ) ) ( not ( = ?auto_444036 ?auto_444037 ) ) ( not ( = ?auto_444036 ?auto_444038 ) ) ( not ( = ?auto_444036 ?auto_444039 ) ) ( not ( = ?auto_444036 ?auto_444040 ) ) ( not ( = ?auto_444036 ?auto_444041 ) ) ( not ( = ?auto_444036 ?auto_444042 ) ) ( not ( = ?auto_444036 ?auto_444043 ) ) ( not ( = ?auto_444036 ?auto_444044 ) ) ( not ( = ?auto_444037 ?auto_444038 ) ) ( not ( = ?auto_444037 ?auto_444039 ) ) ( not ( = ?auto_444037 ?auto_444040 ) ) ( not ( = ?auto_444037 ?auto_444041 ) ) ( not ( = ?auto_444037 ?auto_444042 ) ) ( not ( = ?auto_444037 ?auto_444043 ) ) ( not ( = ?auto_444037 ?auto_444044 ) ) ( not ( = ?auto_444038 ?auto_444039 ) ) ( not ( = ?auto_444038 ?auto_444040 ) ) ( not ( = ?auto_444038 ?auto_444041 ) ) ( not ( = ?auto_444038 ?auto_444042 ) ) ( not ( = ?auto_444038 ?auto_444043 ) ) ( not ( = ?auto_444038 ?auto_444044 ) ) ( not ( = ?auto_444039 ?auto_444040 ) ) ( not ( = ?auto_444039 ?auto_444041 ) ) ( not ( = ?auto_444039 ?auto_444042 ) ) ( not ( = ?auto_444039 ?auto_444043 ) ) ( not ( = ?auto_444039 ?auto_444044 ) ) ( not ( = ?auto_444040 ?auto_444041 ) ) ( not ( = ?auto_444040 ?auto_444042 ) ) ( not ( = ?auto_444040 ?auto_444043 ) ) ( not ( = ?auto_444040 ?auto_444044 ) ) ( not ( = ?auto_444041 ?auto_444042 ) ) ( not ( = ?auto_444041 ?auto_444043 ) ) ( not ( = ?auto_444041 ?auto_444044 ) ) ( not ( = ?auto_444042 ?auto_444043 ) ) ( not ( = ?auto_444042 ?auto_444044 ) ) ( not ( = ?auto_444043 ?auto_444044 ) ) ( ON ?auto_444043 ?auto_444044 ) ( ON ?auto_444042 ?auto_444043 ) ( ON ?auto_444041 ?auto_444042 ) ( ON ?auto_444040 ?auto_444041 ) ( ON ?auto_444039 ?auto_444040 ) ( ON ?auto_444038 ?auto_444039 ) ( ON ?auto_444037 ?auto_444038 ) ( ON ?auto_444036 ?auto_444037 ) ( ON ?auto_444035 ?auto_444036 ) ( ON ?auto_444034 ?auto_444035 ) ( ON ?auto_444033 ?auto_444034 ) ( ON ?auto_444032 ?auto_444033 ) ( ON ?auto_444031 ?auto_444032 ) ( ON ?auto_444030 ?auto_444031 ) ( CLEAR ?auto_444030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444030 )
      ( MAKE-15PILE ?auto_444030 ?auto_444031 ?auto_444032 ?auto_444033 ?auto_444034 ?auto_444035 ?auto_444036 ?auto_444037 ?auto_444038 ?auto_444039 ?auto_444040 ?auto_444041 ?auto_444042 ?auto_444043 ?auto_444044 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_444060 - BLOCK
      ?auto_444061 - BLOCK
      ?auto_444062 - BLOCK
      ?auto_444063 - BLOCK
      ?auto_444064 - BLOCK
      ?auto_444065 - BLOCK
      ?auto_444066 - BLOCK
      ?auto_444067 - BLOCK
      ?auto_444068 - BLOCK
      ?auto_444069 - BLOCK
      ?auto_444070 - BLOCK
      ?auto_444071 - BLOCK
      ?auto_444072 - BLOCK
      ?auto_444073 - BLOCK
      ?auto_444074 - BLOCK
    )
    :vars
    (
      ?auto_444075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_444060 ?auto_444061 ) ) ( not ( = ?auto_444060 ?auto_444062 ) ) ( not ( = ?auto_444060 ?auto_444063 ) ) ( not ( = ?auto_444060 ?auto_444064 ) ) ( not ( = ?auto_444060 ?auto_444065 ) ) ( not ( = ?auto_444060 ?auto_444066 ) ) ( not ( = ?auto_444060 ?auto_444067 ) ) ( not ( = ?auto_444060 ?auto_444068 ) ) ( not ( = ?auto_444060 ?auto_444069 ) ) ( not ( = ?auto_444060 ?auto_444070 ) ) ( not ( = ?auto_444060 ?auto_444071 ) ) ( not ( = ?auto_444060 ?auto_444072 ) ) ( not ( = ?auto_444060 ?auto_444073 ) ) ( not ( = ?auto_444060 ?auto_444074 ) ) ( not ( = ?auto_444061 ?auto_444062 ) ) ( not ( = ?auto_444061 ?auto_444063 ) ) ( not ( = ?auto_444061 ?auto_444064 ) ) ( not ( = ?auto_444061 ?auto_444065 ) ) ( not ( = ?auto_444061 ?auto_444066 ) ) ( not ( = ?auto_444061 ?auto_444067 ) ) ( not ( = ?auto_444061 ?auto_444068 ) ) ( not ( = ?auto_444061 ?auto_444069 ) ) ( not ( = ?auto_444061 ?auto_444070 ) ) ( not ( = ?auto_444061 ?auto_444071 ) ) ( not ( = ?auto_444061 ?auto_444072 ) ) ( not ( = ?auto_444061 ?auto_444073 ) ) ( not ( = ?auto_444061 ?auto_444074 ) ) ( not ( = ?auto_444062 ?auto_444063 ) ) ( not ( = ?auto_444062 ?auto_444064 ) ) ( not ( = ?auto_444062 ?auto_444065 ) ) ( not ( = ?auto_444062 ?auto_444066 ) ) ( not ( = ?auto_444062 ?auto_444067 ) ) ( not ( = ?auto_444062 ?auto_444068 ) ) ( not ( = ?auto_444062 ?auto_444069 ) ) ( not ( = ?auto_444062 ?auto_444070 ) ) ( not ( = ?auto_444062 ?auto_444071 ) ) ( not ( = ?auto_444062 ?auto_444072 ) ) ( not ( = ?auto_444062 ?auto_444073 ) ) ( not ( = ?auto_444062 ?auto_444074 ) ) ( not ( = ?auto_444063 ?auto_444064 ) ) ( not ( = ?auto_444063 ?auto_444065 ) ) ( not ( = ?auto_444063 ?auto_444066 ) ) ( not ( = ?auto_444063 ?auto_444067 ) ) ( not ( = ?auto_444063 ?auto_444068 ) ) ( not ( = ?auto_444063 ?auto_444069 ) ) ( not ( = ?auto_444063 ?auto_444070 ) ) ( not ( = ?auto_444063 ?auto_444071 ) ) ( not ( = ?auto_444063 ?auto_444072 ) ) ( not ( = ?auto_444063 ?auto_444073 ) ) ( not ( = ?auto_444063 ?auto_444074 ) ) ( not ( = ?auto_444064 ?auto_444065 ) ) ( not ( = ?auto_444064 ?auto_444066 ) ) ( not ( = ?auto_444064 ?auto_444067 ) ) ( not ( = ?auto_444064 ?auto_444068 ) ) ( not ( = ?auto_444064 ?auto_444069 ) ) ( not ( = ?auto_444064 ?auto_444070 ) ) ( not ( = ?auto_444064 ?auto_444071 ) ) ( not ( = ?auto_444064 ?auto_444072 ) ) ( not ( = ?auto_444064 ?auto_444073 ) ) ( not ( = ?auto_444064 ?auto_444074 ) ) ( not ( = ?auto_444065 ?auto_444066 ) ) ( not ( = ?auto_444065 ?auto_444067 ) ) ( not ( = ?auto_444065 ?auto_444068 ) ) ( not ( = ?auto_444065 ?auto_444069 ) ) ( not ( = ?auto_444065 ?auto_444070 ) ) ( not ( = ?auto_444065 ?auto_444071 ) ) ( not ( = ?auto_444065 ?auto_444072 ) ) ( not ( = ?auto_444065 ?auto_444073 ) ) ( not ( = ?auto_444065 ?auto_444074 ) ) ( not ( = ?auto_444066 ?auto_444067 ) ) ( not ( = ?auto_444066 ?auto_444068 ) ) ( not ( = ?auto_444066 ?auto_444069 ) ) ( not ( = ?auto_444066 ?auto_444070 ) ) ( not ( = ?auto_444066 ?auto_444071 ) ) ( not ( = ?auto_444066 ?auto_444072 ) ) ( not ( = ?auto_444066 ?auto_444073 ) ) ( not ( = ?auto_444066 ?auto_444074 ) ) ( not ( = ?auto_444067 ?auto_444068 ) ) ( not ( = ?auto_444067 ?auto_444069 ) ) ( not ( = ?auto_444067 ?auto_444070 ) ) ( not ( = ?auto_444067 ?auto_444071 ) ) ( not ( = ?auto_444067 ?auto_444072 ) ) ( not ( = ?auto_444067 ?auto_444073 ) ) ( not ( = ?auto_444067 ?auto_444074 ) ) ( not ( = ?auto_444068 ?auto_444069 ) ) ( not ( = ?auto_444068 ?auto_444070 ) ) ( not ( = ?auto_444068 ?auto_444071 ) ) ( not ( = ?auto_444068 ?auto_444072 ) ) ( not ( = ?auto_444068 ?auto_444073 ) ) ( not ( = ?auto_444068 ?auto_444074 ) ) ( not ( = ?auto_444069 ?auto_444070 ) ) ( not ( = ?auto_444069 ?auto_444071 ) ) ( not ( = ?auto_444069 ?auto_444072 ) ) ( not ( = ?auto_444069 ?auto_444073 ) ) ( not ( = ?auto_444069 ?auto_444074 ) ) ( not ( = ?auto_444070 ?auto_444071 ) ) ( not ( = ?auto_444070 ?auto_444072 ) ) ( not ( = ?auto_444070 ?auto_444073 ) ) ( not ( = ?auto_444070 ?auto_444074 ) ) ( not ( = ?auto_444071 ?auto_444072 ) ) ( not ( = ?auto_444071 ?auto_444073 ) ) ( not ( = ?auto_444071 ?auto_444074 ) ) ( not ( = ?auto_444072 ?auto_444073 ) ) ( not ( = ?auto_444072 ?auto_444074 ) ) ( not ( = ?auto_444073 ?auto_444074 ) ) ( ON ?auto_444060 ?auto_444075 ) ( not ( = ?auto_444074 ?auto_444075 ) ) ( not ( = ?auto_444073 ?auto_444075 ) ) ( not ( = ?auto_444072 ?auto_444075 ) ) ( not ( = ?auto_444071 ?auto_444075 ) ) ( not ( = ?auto_444070 ?auto_444075 ) ) ( not ( = ?auto_444069 ?auto_444075 ) ) ( not ( = ?auto_444068 ?auto_444075 ) ) ( not ( = ?auto_444067 ?auto_444075 ) ) ( not ( = ?auto_444066 ?auto_444075 ) ) ( not ( = ?auto_444065 ?auto_444075 ) ) ( not ( = ?auto_444064 ?auto_444075 ) ) ( not ( = ?auto_444063 ?auto_444075 ) ) ( not ( = ?auto_444062 ?auto_444075 ) ) ( not ( = ?auto_444061 ?auto_444075 ) ) ( not ( = ?auto_444060 ?auto_444075 ) ) ( ON ?auto_444061 ?auto_444060 ) ( ON ?auto_444062 ?auto_444061 ) ( ON ?auto_444063 ?auto_444062 ) ( ON ?auto_444064 ?auto_444063 ) ( ON ?auto_444065 ?auto_444064 ) ( ON ?auto_444066 ?auto_444065 ) ( ON ?auto_444067 ?auto_444066 ) ( ON ?auto_444068 ?auto_444067 ) ( ON ?auto_444069 ?auto_444068 ) ( ON ?auto_444070 ?auto_444069 ) ( ON ?auto_444071 ?auto_444070 ) ( ON ?auto_444072 ?auto_444071 ) ( ON ?auto_444073 ?auto_444072 ) ( ON ?auto_444074 ?auto_444073 ) ( CLEAR ?auto_444074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_444074 ?auto_444073 ?auto_444072 ?auto_444071 ?auto_444070 ?auto_444069 ?auto_444068 ?auto_444067 ?auto_444066 ?auto_444065 ?auto_444064 ?auto_444063 ?auto_444062 ?auto_444061 ?auto_444060 )
      ( MAKE-15PILE ?auto_444060 ?auto_444061 ?auto_444062 ?auto_444063 ?auto_444064 ?auto_444065 ?auto_444066 ?auto_444067 ?auto_444068 ?auto_444069 ?auto_444070 ?auto_444071 ?auto_444072 ?auto_444073 ?auto_444074 ) )
  )

)

