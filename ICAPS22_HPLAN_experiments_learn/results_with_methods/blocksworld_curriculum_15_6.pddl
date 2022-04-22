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
      ?auto_391917 - BLOCK
    )
    :vars
    (
      ?auto_391918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391917 ?auto_391918 ) ( CLEAR ?auto_391917 ) ( HAND-EMPTY ) ( not ( = ?auto_391917 ?auto_391918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391917 ?auto_391918 )
      ( !PUTDOWN ?auto_391917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_391920 - BLOCK
    )
    :vars
    (
      ?auto_391921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391920 ?auto_391921 ) ( CLEAR ?auto_391920 ) ( HAND-EMPTY ) ( not ( = ?auto_391920 ?auto_391921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391920 ?auto_391921 )
      ( !PUTDOWN ?auto_391920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_391924 - BLOCK
      ?auto_391925 - BLOCK
    )
    :vars
    (
      ?auto_391926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391924 ) ( ON ?auto_391925 ?auto_391926 ) ( CLEAR ?auto_391925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391924 ) ( not ( = ?auto_391924 ?auto_391925 ) ) ( not ( = ?auto_391924 ?auto_391926 ) ) ( not ( = ?auto_391925 ?auto_391926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391925 ?auto_391926 )
      ( !STACK ?auto_391925 ?auto_391924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_391929 - BLOCK
      ?auto_391930 - BLOCK
    )
    :vars
    (
      ?auto_391931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391929 ) ( ON ?auto_391930 ?auto_391931 ) ( CLEAR ?auto_391930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391929 ) ( not ( = ?auto_391929 ?auto_391930 ) ) ( not ( = ?auto_391929 ?auto_391931 ) ) ( not ( = ?auto_391930 ?auto_391931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391930 ?auto_391931 )
      ( !STACK ?auto_391930 ?auto_391929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_391934 - BLOCK
      ?auto_391935 - BLOCK
    )
    :vars
    (
      ?auto_391936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391935 ?auto_391936 ) ( not ( = ?auto_391934 ?auto_391935 ) ) ( not ( = ?auto_391934 ?auto_391936 ) ) ( not ( = ?auto_391935 ?auto_391936 ) ) ( ON ?auto_391934 ?auto_391935 ) ( CLEAR ?auto_391934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391934 )
      ( MAKE-2PILE ?auto_391934 ?auto_391935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_391939 - BLOCK
      ?auto_391940 - BLOCK
    )
    :vars
    (
      ?auto_391941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391940 ?auto_391941 ) ( not ( = ?auto_391939 ?auto_391940 ) ) ( not ( = ?auto_391939 ?auto_391941 ) ) ( not ( = ?auto_391940 ?auto_391941 ) ) ( ON ?auto_391939 ?auto_391940 ) ( CLEAR ?auto_391939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391939 )
      ( MAKE-2PILE ?auto_391939 ?auto_391940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391945 - BLOCK
      ?auto_391946 - BLOCK
      ?auto_391947 - BLOCK
    )
    :vars
    (
      ?auto_391948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391946 ) ( ON ?auto_391947 ?auto_391948 ) ( CLEAR ?auto_391947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391945 ) ( ON ?auto_391946 ?auto_391945 ) ( not ( = ?auto_391945 ?auto_391946 ) ) ( not ( = ?auto_391945 ?auto_391947 ) ) ( not ( = ?auto_391945 ?auto_391948 ) ) ( not ( = ?auto_391946 ?auto_391947 ) ) ( not ( = ?auto_391946 ?auto_391948 ) ) ( not ( = ?auto_391947 ?auto_391948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391947 ?auto_391948 )
      ( !STACK ?auto_391947 ?auto_391946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391952 - BLOCK
      ?auto_391953 - BLOCK
      ?auto_391954 - BLOCK
    )
    :vars
    (
      ?auto_391955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391953 ) ( ON ?auto_391954 ?auto_391955 ) ( CLEAR ?auto_391954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391952 ) ( ON ?auto_391953 ?auto_391952 ) ( not ( = ?auto_391952 ?auto_391953 ) ) ( not ( = ?auto_391952 ?auto_391954 ) ) ( not ( = ?auto_391952 ?auto_391955 ) ) ( not ( = ?auto_391953 ?auto_391954 ) ) ( not ( = ?auto_391953 ?auto_391955 ) ) ( not ( = ?auto_391954 ?auto_391955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391954 ?auto_391955 )
      ( !STACK ?auto_391954 ?auto_391953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391959 - BLOCK
      ?auto_391960 - BLOCK
      ?auto_391961 - BLOCK
    )
    :vars
    (
      ?auto_391962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391961 ?auto_391962 ) ( ON-TABLE ?auto_391959 ) ( not ( = ?auto_391959 ?auto_391960 ) ) ( not ( = ?auto_391959 ?auto_391961 ) ) ( not ( = ?auto_391959 ?auto_391962 ) ) ( not ( = ?auto_391960 ?auto_391961 ) ) ( not ( = ?auto_391960 ?auto_391962 ) ) ( not ( = ?auto_391961 ?auto_391962 ) ) ( CLEAR ?auto_391959 ) ( ON ?auto_391960 ?auto_391961 ) ( CLEAR ?auto_391960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391959 ?auto_391960 )
      ( MAKE-3PILE ?auto_391959 ?auto_391960 ?auto_391961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391966 - BLOCK
      ?auto_391967 - BLOCK
      ?auto_391968 - BLOCK
    )
    :vars
    (
      ?auto_391969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391968 ?auto_391969 ) ( ON-TABLE ?auto_391966 ) ( not ( = ?auto_391966 ?auto_391967 ) ) ( not ( = ?auto_391966 ?auto_391968 ) ) ( not ( = ?auto_391966 ?auto_391969 ) ) ( not ( = ?auto_391967 ?auto_391968 ) ) ( not ( = ?auto_391967 ?auto_391969 ) ) ( not ( = ?auto_391968 ?auto_391969 ) ) ( CLEAR ?auto_391966 ) ( ON ?auto_391967 ?auto_391968 ) ( CLEAR ?auto_391967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391966 ?auto_391967 )
      ( MAKE-3PILE ?auto_391966 ?auto_391967 ?auto_391968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391973 - BLOCK
      ?auto_391974 - BLOCK
      ?auto_391975 - BLOCK
    )
    :vars
    (
      ?auto_391976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391975 ?auto_391976 ) ( not ( = ?auto_391973 ?auto_391974 ) ) ( not ( = ?auto_391973 ?auto_391975 ) ) ( not ( = ?auto_391973 ?auto_391976 ) ) ( not ( = ?auto_391974 ?auto_391975 ) ) ( not ( = ?auto_391974 ?auto_391976 ) ) ( not ( = ?auto_391975 ?auto_391976 ) ) ( ON ?auto_391974 ?auto_391975 ) ( ON ?auto_391973 ?auto_391974 ) ( CLEAR ?auto_391973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391973 )
      ( MAKE-3PILE ?auto_391973 ?auto_391974 ?auto_391975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_391980 - BLOCK
      ?auto_391981 - BLOCK
      ?auto_391982 - BLOCK
    )
    :vars
    (
      ?auto_391983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391982 ?auto_391983 ) ( not ( = ?auto_391980 ?auto_391981 ) ) ( not ( = ?auto_391980 ?auto_391982 ) ) ( not ( = ?auto_391980 ?auto_391983 ) ) ( not ( = ?auto_391981 ?auto_391982 ) ) ( not ( = ?auto_391981 ?auto_391983 ) ) ( not ( = ?auto_391982 ?auto_391983 ) ) ( ON ?auto_391981 ?auto_391982 ) ( ON ?auto_391980 ?auto_391981 ) ( CLEAR ?auto_391980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391980 )
      ( MAKE-3PILE ?auto_391980 ?auto_391981 ?auto_391982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_391988 - BLOCK
      ?auto_391989 - BLOCK
      ?auto_391990 - BLOCK
      ?auto_391991 - BLOCK
    )
    :vars
    (
      ?auto_391992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391990 ) ( ON ?auto_391991 ?auto_391992 ) ( CLEAR ?auto_391991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391988 ) ( ON ?auto_391989 ?auto_391988 ) ( ON ?auto_391990 ?auto_391989 ) ( not ( = ?auto_391988 ?auto_391989 ) ) ( not ( = ?auto_391988 ?auto_391990 ) ) ( not ( = ?auto_391988 ?auto_391991 ) ) ( not ( = ?auto_391988 ?auto_391992 ) ) ( not ( = ?auto_391989 ?auto_391990 ) ) ( not ( = ?auto_391989 ?auto_391991 ) ) ( not ( = ?auto_391989 ?auto_391992 ) ) ( not ( = ?auto_391990 ?auto_391991 ) ) ( not ( = ?auto_391990 ?auto_391992 ) ) ( not ( = ?auto_391991 ?auto_391992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_391991 ?auto_391992 )
      ( !STACK ?auto_391991 ?auto_391990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_391997 - BLOCK
      ?auto_391998 - BLOCK
      ?auto_391999 - BLOCK
      ?auto_392000 - BLOCK
    )
    :vars
    (
      ?auto_392001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391999 ) ( ON ?auto_392000 ?auto_392001 ) ( CLEAR ?auto_392000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391997 ) ( ON ?auto_391998 ?auto_391997 ) ( ON ?auto_391999 ?auto_391998 ) ( not ( = ?auto_391997 ?auto_391998 ) ) ( not ( = ?auto_391997 ?auto_391999 ) ) ( not ( = ?auto_391997 ?auto_392000 ) ) ( not ( = ?auto_391997 ?auto_392001 ) ) ( not ( = ?auto_391998 ?auto_391999 ) ) ( not ( = ?auto_391998 ?auto_392000 ) ) ( not ( = ?auto_391998 ?auto_392001 ) ) ( not ( = ?auto_391999 ?auto_392000 ) ) ( not ( = ?auto_391999 ?auto_392001 ) ) ( not ( = ?auto_392000 ?auto_392001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392000 ?auto_392001 )
      ( !STACK ?auto_392000 ?auto_391999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392006 - BLOCK
      ?auto_392007 - BLOCK
      ?auto_392008 - BLOCK
      ?auto_392009 - BLOCK
    )
    :vars
    (
      ?auto_392010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392009 ?auto_392010 ) ( ON-TABLE ?auto_392006 ) ( ON ?auto_392007 ?auto_392006 ) ( not ( = ?auto_392006 ?auto_392007 ) ) ( not ( = ?auto_392006 ?auto_392008 ) ) ( not ( = ?auto_392006 ?auto_392009 ) ) ( not ( = ?auto_392006 ?auto_392010 ) ) ( not ( = ?auto_392007 ?auto_392008 ) ) ( not ( = ?auto_392007 ?auto_392009 ) ) ( not ( = ?auto_392007 ?auto_392010 ) ) ( not ( = ?auto_392008 ?auto_392009 ) ) ( not ( = ?auto_392008 ?auto_392010 ) ) ( not ( = ?auto_392009 ?auto_392010 ) ) ( CLEAR ?auto_392007 ) ( ON ?auto_392008 ?auto_392009 ) ( CLEAR ?auto_392008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392006 ?auto_392007 ?auto_392008 )
      ( MAKE-4PILE ?auto_392006 ?auto_392007 ?auto_392008 ?auto_392009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392015 - BLOCK
      ?auto_392016 - BLOCK
      ?auto_392017 - BLOCK
      ?auto_392018 - BLOCK
    )
    :vars
    (
      ?auto_392019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392018 ?auto_392019 ) ( ON-TABLE ?auto_392015 ) ( ON ?auto_392016 ?auto_392015 ) ( not ( = ?auto_392015 ?auto_392016 ) ) ( not ( = ?auto_392015 ?auto_392017 ) ) ( not ( = ?auto_392015 ?auto_392018 ) ) ( not ( = ?auto_392015 ?auto_392019 ) ) ( not ( = ?auto_392016 ?auto_392017 ) ) ( not ( = ?auto_392016 ?auto_392018 ) ) ( not ( = ?auto_392016 ?auto_392019 ) ) ( not ( = ?auto_392017 ?auto_392018 ) ) ( not ( = ?auto_392017 ?auto_392019 ) ) ( not ( = ?auto_392018 ?auto_392019 ) ) ( CLEAR ?auto_392016 ) ( ON ?auto_392017 ?auto_392018 ) ( CLEAR ?auto_392017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392015 ?auto_392016 ?auto_392017 )
      ( MAKE-4PILE ?auto_392015 ?auto_392016 ?auto_392017 ?auto_392018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392024 - BLOCK
      ?auto_392025 - BLOCK
      ?auto_392026 - BLOCK
      ?auto_392027 - BLOCK
    )
    :vars
    (
      ?auto_392028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392027 ?auto_392028 ) ( ON-TABLE ?auto_392024 ) ( not ( = ?auto_392024 ?auto_392025 ) ) ( not ( = ?auto_392024 ?auto_392026 ) ) ( not ( = ?auto_392024 ?auto_392027 ) ) ( not ( = ?auto_392024 ?auto_392028 ) ) ( not ( = ?auto_392025 ?auto_392026 ) ) ( not ( = ?auto_392025 ?auto_392027 ) ) ( not ( = ?auto_392025 ?auto_392028 ) ) ( not ( = ?auto_392026 ?auto_392027 ) ) ( not ( = ?auto_392026 ?auto_392028 ) ) ( not ( = ?auto_392027 ?auto_392028 ) ) ( ON ?auto_392026 ?auto_392027 ) ( CLEAR ?auto_392024 ) ( ON ?auto_392025 ?auto_392026 ) ( CLEAR ?auto_392025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392024 ?auto_392025 )
      ( MAKE-4PILE ?auto_392024 ?auto_392025 ?auto_392026 ?auto_392027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392033 - BLOCK
      ?auto_392034 - BLOCK
      ?auto_392035 - BLOCK
      ?auto_392036 - BLOCK
    )
    :vars
    (
      ?auto_392037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392036 ?auto_392037 ) ( ON-TABLE ?auto_392033 ) ( not ( = ?auto_392033 ?auto_392034 ) ) ( not ( = ?auto_392033 ?auto_392035 ) ) ( not ( = ?auto_392033 ?auto_392036 ) ) ( not ( = ?auto_392033 ?auto_392037 ) ) ( not ( = ?auto_392034 ?auto_392035 ) ) ( not ( = ?auto_392034 ?auto_392036 ) ) ( not ( = ?auto_392034 ?auto_392037 ) ) ( not ( = ?auto_392035 ?auto_392036 ) ) ( not ( = ?auto_392035 ?auto_392037 ) ) ( not ( = ?auto_392036 ?auto_392037 ) ) ( ON ?auto_392035 ?auto_392036 ) ( CLEAR ?auto_392033 ) ( ON ?auto_392034 ?auto_392035 ) ( CLEAR ?auto_392034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392033 ?auto_392034 )
      ( MAKE-4PILE ?auto_392033 ?auto_392034 ?auto_392035 ?auto_392036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392042 - BLOCK
      ?auto_392043 - BLOCK
      ?auto_392044 - BLOCK
      ?auto_392045 - BLOCK
    )
    :vars
    (
      ?auto_392046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392045 ?auto_392046 ) ( not ( = ?auto_392042 ?auto_392043 ) ) ( not ( = ?auto_392042 ?auto_392044 ) ) ( not ( = ?auto_392042 ?auto_392045 ) ) ( not ( = ?auto_392042 ?auto_392046 ) ) ( not ( = ?auto_392043 ?auto_392044 ) ) ( not ( = ?auto_392043 ?auto_392045 ) ) ( not ( = ?auto_392043 ?auto_392046 ) ) ( not ( = ?auto_392044 ?auto_392045 ) ) ( not ( = ?auto_392044 ?auto_392046 ) ) ( not ( = ?auto_392045 ?auto_392046 ) ) ( ON ?auto_392044 ?auto_392045 ) ( ON ?auto_392043 ?auto_392044 ) ( ON ?auto_392042 ?auto_392043 ) ( CLEAR ?auto_392042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392042 )
      ( MAKE-4PILE ?auto_392042 ?auto_392043 ?auto_392044 ?auto_392045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_392051 - BLOCK
      ?auto_392052 - BLOCK
      ?auto_392053 - BLOCK
      ?auto_392054 - BLOCK
    )
    :vars
    (
      ?auto_392055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392054 ?auto_392055 ) ( not ( = ?auto_392051 ?auto_392052 ) ) ( not ( = ?auto_392051 ?auto_392053 ) ) ( not ( = ?auto_392051 ?auto_392054 ) ) ( not ( = ?auto_392051 ?auto_392055 ) ) ( not ( = ?auto_392052 ?auto_392053 ) ) ( not ( = ?auto_392052 ?auto_392054 ) ) ( not ( = ?auto_392052 ?auto_392055 ) ) ( not ( = ?auto_392053 ?auto_392054 ) ) ( not ( = ?auto_392053 ?auto_392055 ) ) ( not ( = ?auto_392054 ?auto_392055 ) ) ( ON ?auto_392053 ?auto_392054 ) ( ON ?auto_392052 ?auto_392053 ) ( ON ?auto_392051 ?auto_392052 ) ( CLEAR ?auto_392051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392051 )
      ( MAKE-4PILE ?auto_392051 ?auto_392052 ?auto_392053 ?auto_392054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392061 - BLOCK
      ?auto_392062 - BLOCK
      ?auto_392063 - BLOCK
      ?auto_392064 - BLOCK
      ?auto_392065 - BLOCK
    )
    :vars
    (
      ?auto_392066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392064 ) ( ON ?auto_392065 ?auto_392066 ) ( CLEAR ?auto_392065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392061 ) ( ON ?auto_392062 ?auto_392061 ) ( ON ?auto_392063 ?auto_392062 ) ( ON ?auto_392064 ?auto_392063 ) ( not ( = ?auto_392061 ?auto_392062 ) ) ( not ( = ?auto_392061 ?auto_392063 ) ) ( not ( = ?auto_392061 ?auto_392064 ) ) ( not ( = ?auto_392061 ?auto_392065 ) ) ( not ( = ?auto_392061 ?auto_392066 ) ) ( not ( = ?auto_392062 ?auto_392063 ) ) ( not ( = ?auto_392062 ?auto_392064 ) ) ( not ( = ?auto_392062 ?auto_392065 ) ) ( not ( = ?auto_392062 ?auto_392066 ) ) ( not ( = ?auto_392063 ?auto_392064 ) ) ( not ( = ?auto_392063 ?auto_392065 ) ) ( not ( = ?auto_392063 ?auto_392066 ) ) ( not ( = ?auto_392064 ?auto_392065 ) ) ( not ( = ?auto_392064 ?auto_392066 ) ) ( not ( = ?auto_392065 ?auto_392066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392065 ?auto_392066 )
      ( !STACK ?auto_392065 ?auto_392064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392072 - BLOCK
      ?auto_392073 - BLOCK
      ?auto_392074 - BLOCK
      ?auto_392075 - BLOCK
      ?auto_392076 - BLOCK
    )
    :vars
    (
      ?auto_392077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392075 ) ( ON ?auto_392076 ?auto_392077 ) ( CLEAR ?auto_392076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392072 ) ( ON ?auto_392073 ?auto_392072 ) ( ON ?auto_392074 ?auto_392073 ) ( ON ?auto_392075 ?auto_392074 ) ( not ( = ?auto_392072 ?auto_392073 ) ) ( not ( = ?auto_392072 ?auto_392074 ) ) ( not ( = ?auto_392072 ?auto_392075 ) ) ( not ( = ?auto_392072 ?auto_392076 ) ) ( not ( = ?auto_392072 ?auto_392077 ) ) ( not ( = ?auto_392073 ?auto_392074 ) ) ( not ( = ?auto_392073 ?auto_392075 ) ) ( not ( = ?auto_392073 ?auto_392076 ) ) ( not ( = ?auto_392073 ?auto_392077 ) ) ( not ( = ?auto_392074 ?auto_392075 ) ) ( not ( = ?auto_392074 ?auto_392076 ) ) ( not ( = ?auto_392074 ?auto_392077 ) ) ( not ( = ?auto_392075 ?auto_392076 ) ) ( not ( = ?auto_392075 ?auto_392077 ) ) ( not ( = ?auto_392076 ?auto_392077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392076 ?auto_392077 )
      ( !STACK ?auto_392076 ?auto_392075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392083 - BLOCK
      ?auto_392084 - BLOCK
      ?auto_392085 - BLOCK
      ?auto_392086 - BLOCK
      ?auto_392087 - BLOCK
    )
    :vars
    (
      ?auto_392088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392087 ?auto_392088 ) ( ON-TABLE ?auto_392083 ) ( ON ?auto_392084 ?auto_392083 ) ( ON ?auto_392085 ?auto_392084 ) ( not ( = ?auto_392083 ?auto_392084 ) ) ( not ( = ?auto_392083 ?auto_392085 ) ) ( not ( = ?auto_392083 ?auto_392086 ) ) ( not ( = ?auto_392083 ?auto_392087 ) ) ( not ( = ?auto_392083 ?auto_392088 ) ) ( not ( = ?auto_392084 ?auto_392085 ) ) ( not ( = ?auto_392084 ?auto_392086 ) ) ( not ( = ?auto_392084 ?auto_392087 ) ) ( not ( = ?auto_392084 ?auto_392088 ) ) ( not ( = ?auto_392085 ?auto_392086 ) ) ( not ( = ?auto_392085 ?auto_392087 ) ) ( not ( = ?auto_392085 ?auto_392088 ) ) ( not ( = ?auto_392086 ?auto_392087 ) ) ( not ( = ?auto_392086 ?auto_392088 ) ) ( not ( = ?auto_392087 ?auto_392088 ) ) ( CLEAR ?auto_392085 ) ( ON ?auto_392086 ?auto_392087 ) ( CLEAR ?auto_392086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392083 ?auto_392084 ?auto_392085 ?auto_392086 )
      ( MAKE-5PILE ?auto_392083 ?auto_392084 ?auto_392085 ?auto_392086 ?auto_392087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392094 - BLOCK
      ?auto_392095 - BLOCK
      ?auto_392096 - BLOCK
      ?auto_392097 - BLOCK
      ?auto_392098 - BLOCK
    )
    :vars
    (
      ?auto_392099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392098 ?auto_392099 ) ( ON-TABLE ?auto_392094 ) ( ON ?auto_392095 ?auto_392094 ) ( ON ?auto_392096 ?auto_392095 ) ( not ( = ?auto_392094 ?auto_392095 ) ) ( not ( = ?auto_392094 ?auto_392096 ) ) ( not ( = ?auto_392094 ?auto_392097 ) ) ( not ( = ?auto_392094 ?auto_392098 ) ) ( not ( = ?auto_392094 ?auto_392099 ) ) ( not ( = ?auto_392095 ?auto_392096 ) ) ( not ( = ?auto_392095 ?auto_392097 ) ) ( not ( = ?auto_392095 ?auto_392098 ) ) ( not ( = ?auto_392095 ?auto_392099 ) ) ( not ( = ?auto_392096 ?auto_392097 ) ) ( not ( = ?auto_392096 ?auto_392098 ) ) ( not ( = ?auto_392096 ?auto_392099 ) ) ( not ( = ?auto_392097 ?auto_392098 ) ) ( not ( = ?auto_392097 ?auto_392099 ) ) ( not ( = ?auto_392098 ?auto_392099 ) ) ( CLEAR ?auto_392096 ) ( ON ?auto_392097 ?auto_392098 ) ( CLEAR ?auto_392097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392094 ?auto_392095 ?auto_392096 ?auto_392097 )
      ( MAKE-5PILE ?auto_392094 ?auto_392095 ?auto_392096 ?auto_392097 ?auto_392098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392105 - BLOCK
      ?auto_392106 - BLOCK
      ?auto_392107 - BLOCK
      ?auto_392108 - BLOCK
      ?auto_392109 - BLOCK
    )
    :vars
    (
      ?auto_392110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392109 ?auto_392110 ) ( ON-TABLE ?auto_392105 ) ( ON ?auto_392106 ?auto_392105 ) ( not ( = ?auto_392105 ?auto_392106 ) ) ( not ( = ?auto_392105 ?auto_392107 ) ) ( not ( = ?auto_392105 ?auto_392108 ) ) ( not ( = ?auto_392105 ?auto_392109 ) ) ( not ( = ?auto_392105 ?auto_392110 ) ) ( not ( = ?auto_392106 ?auto_392107 ) ) ( not ( = ?auto_392106 ?auto_392108 ) ) ( not ( = ?auto_392106 ?auto_392109 ) ) ( not ( = ?auto_392106 ?auto_392110 ) ) ( not ( = ?auto_392107 ?auto_392108 ) ) ( not ( = ?auto_392107 ?auto_392109 ) ) ( not ( = ?auto_392107 ?auto_392110 ) ) ( not ( = ?auto_392108 ?auto_392109 ) ) ( not ( = ?auto_392108 ?auto_392110 ) ) ( not ( = ?auto_392109 ?auto_392110 ) ) ( ON ?auto_392108 ?auto_392109 ) ( CLEAR ?auto_392106 ) ( ON ?auto_392107 ?auto_392108 ) ( CLEAR ?auto_392107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392105 ?auto_392106 ?auto_392107 )
      ( MAKE-5PILE ?auto_392105 ?auto_392106 ?auto_392107 ?auto_392108 ?auto_392109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392116 - BLOCK
      ?auto_392117 - BLOCK
      ?auto_392118 - BLOCK
      ?auto_392119 - BLOCK
      ?auto_392120 - BLOCK
    )
    :vars
    (
      ?auto_392121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392120 ?auto_392121 ) ( ON-TABLE ?auto_392116 ) ( ON ?auto_392117 ?auto_392116 ) ( not ( = ?auto_392116 ?auto_392117 ) ) ( not ( = ?auto_392116 ?auto_392118 ) ) ( not ( = ?auto_392116 ?auto_392119 ) ) ( not ( = ?auto_392116 ?auto_392120 ) ) ( not ( = ?auto_392116 ?auto_392121 ) ) ( not ( = ?auto_392117 ?auto_392118 ) ) ( not ( = ?auto_392117 ?auto_392119 ) ) ( not ( = ?auto_392117 ?auto_392120 ) ) ( not ( = ?auto_392117 ?auto_392121 ) ) ( not ( = ?auto_392118 ?auto_392119 ) ) ( not ( = ?auto_392118 ?auto_392120 ) ) ( not ( = ?auto_392118 ?auto_392121 ) ) ( not ( = ?auto_392119 ?auto_392120 ) ) ( not ( = ?auto_392119 ?auto_392121 ) ) ( not ( = ?auto_392120 ?auto_392121 ) ) ( ON ?auto_392119 ?auto_392120 ) ( CLEAR ?auto_392117 ) ( ON ?auto_392118 ?auto_392119 ) ( CLEAR ?auto_392118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392116 ?auto_392117 ?auto_392118 )
      ( MAKE-5PILE ?auto_392116 ?auto_392117 ?auto_392118 ?auto_392119 ?auto_392120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392127 - BLOCK
      ?auto_392128 - BLOCK
      ?auto_392129 - BLOCK
      ?auto_392130 - BLOCK
      ?auto_392131 - BLOCK
    )
    :vars
    (
      ?auto_392132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392131 ?auto_392132 ) ( ON-TABLE ?auto_392127 ) ( not ( = ?auto_392127 ?auto_392128 ) ) ( not ( = ?auto_392127 ?auto_392129 ) ) ( not ( = ?auto_392127 ?auto_392130 ) ) ( not ( = ?auto_392127 ?auto_392131 ) ) ( not ( = ?auto_392127 ?auto_392132 ) ) ( not ( = ?auto_392128 ?auto_392129 ) ) ( not ( = ?auto_392128 ?auto_392130 ) ) ( not ( = ?auto_392128 ?auto_392131 ) ) ( not ( = ?auto_392128 ?auto_392132 ) ) ( not ( = ?auto_392129 ?auto_392130 ) ) ( not ( = ?auto_392129 ?auto_392131 ) ) ( not ( = ?auto_392129 ?auto_392132 ) ) ( not ( = ?auto_392130 ?auto_392131 ) ) ( not ( = ?auto_392130 ?auto_392132 ) ) ( not ( = ?auto_392131 ?auto_392132 ) ) ( ON ?auto_392130 ?auto_392131 ) ( ON ?auto_392129 ?auto_392130 ) ( CLEAR ?auto_392127 ) ( ON ?auto_392128 ?auto_392129 ) ( CLEAR ?auto_392128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392127 ?auto_392128 )
      ( MAKE-5PILE ?auto_392127 ?auto_392128 ?auto_392129 ?auto_392130 ?auto_392131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392138 - BLOCK
      ?auto_392139 - BLOCK
      ?auto_392140 - BLOCK
      ?auto_392141 - BLOCK
      ?auto_392142 - BLOCK
    )
    :vars
    (
      ?auto_392143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392142 ?auto_392143 ) ( ON-TABLE ?auto_392138 ) ( not ( = ?auto_392138 ?auto_392139 ) ) ( not ( = ?auto_392138 ?auto_392140 ) ) ( not ( = ?auto_392138 ?auto_392141 ) ) ( not ( = ?auto_392138 ?auto_392142 ) ) ( not ( = ?auto_392138 ?auto_392143 ) ) ( not ( = ?auto_392139 ?auto_392140 ) ) ( not ( = ?auto_392139 ?auto_392141 ) ) ( not ( = ?auto_392139 ?auto_392142 ) ) ( not ( = ?auto_392139 ?auto_392143 ) ) ( not ( = ?auto_392140 ?auto_392141 ) ) ( not ( = ?auto_392140 ?auto_392142 ) ) ( not ( = ?auto_392140 ?auto_392143 ) ) ( not ( = ?auto_392141 ?auto_392142 ) ) ( not ( = ?auto_392141 ?auto_392143 ) ) ( not ( = ?auto_392142 ?auto_392143 ) ) ( ON ?auto_392141 ?auto_392142 ) ( ON ?auto_392140 ?auto_392141 ) ( CLEAR ?auto_392138 ) ( ON ?auto_392139 ?auto_392140 ) ( CLEAR ?auto_392139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392138 ?auto_392139 )
      ( MAKE-5PILE ?auto_392138 ?auto_392139 ?auto_392140 ?auto_392141 ?auto_392142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392149 - BLOCK
      ?auto_392150 - BLOCK
      ?auto_392151 - BLOCK
      ?auto_392152 - BLOCK
      ?auto_392153 - BLOCK
    )
    :vars
    (
      ?auto_392154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392153 ?auto_392154 ) ( not ( = ?auto_392149 ?auto_392150 ) ) ( not ( = ?auto_392149 ?auto_392151 ) ) ( not ( = ?auto_392149 ?auto_392152 ) ) ( not ( = ?auto_392149 ?auto_392153 ) ) ( not ( = ?auto_392149 ?auto_392154 ) ) ( not ( = ?auto_392150 ?auto_392151 ) ) ( not ( = ?auto_392150 ?auto_392152 ) ) ( not ( = ?auto_392150 ?auto_392153 ) ) ( not ( = ?auto_392150 ?auto_392154 ) ) ( not ( = ?auto_392151 ?auto_392152 ) ) ( not ( = ?auto_392151 ?auto_392153 ) ) ( not ( = ?auto_392151 ?auto_392154 ) ) ( not ( = ?auto_392152 ?auto_392153 ) ) ( not ( = ?auto_392152 ?auto_392154 ) ) ( not ( = ?auto_392153 ?auto_392154 ) ) ( ON ?auto_392152 ?auto_392153 ) ( ON ?auto_392151 ?auto_392152 ) ( ON ?auto_392150 ?auto_392151 ) ( ON ?auto_392149 ?auto_392150 ) ( CLEAR ?auto_392149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392149 )
      ( MAKE-5PILE ?auto_392149 ?auto_392150 ?auto_392151 ?auto_392152 ?auto_392153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_392160 - BLOCK
      ?auto_392161 - BLOCK
      ?auto_392162 - BLOCK
      ?auto_392163 - BLOCK
      ?auto_392164 - BLOCK
    )
    :vars
    (
      ?auto_392165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392164 ?auto_392165 ) ( not ( = ?auto_392160 ?auto_392161 ) ) ( not ( = ?auto_392160 ?auto_392162 ) ) ( not ( = ?auto_392160 ?auto_392163 ) ) ( not ( = ?auto_392160 ?auto_392164 ) ) ( not ( = ?auto_392160 ?auto_392165 ) ) ( not ( = ?auto_392161 ?auto_392162 ) ) ( not ( = ?auto_392161 ?auto_392163 ) ) ( not ( = ?auto_392161 ?auto_392164 ) ) ( not ( = ?auto_392161 ?auto_392165 ) ) ( not ( = ?auto_392162 ?auto_392163 ) ) ( not ( = ?auto_392162 ?auto_392164 ) ) ( not ( = ?auto_392162 ?auto_392165 ) ) ( not ( = ?auto_392163 ?auto_392164 ) ) ( not ( = ?auto_392163 ?auto_392165 ) ) ( not ( = ?auto_392164 ?auto_392165 ) ) ( ON ?auto_392163 ?auto_392164 ) ( ON ?auto_392162 ?auto_392163 ) ( ON ?auto_392161 ?auto_392162 ) ( ON ?auto_392160 ?auto_392161 ) ( CLEAR ?auto_392160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392160 )
      ( MAKE-5PILE ?auto_392160 ?auto_392161 ?auto_392162 ?auto_392163 ?auto_392164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392172 - BLOCK
      ?auto_392173 - BLOCK
      ?auto_392174 - BLOCK
      ?auto_392175 - BLOCK
      ?auto_392176 - BLOCK
      ?auto_392177 - BLOCK
    )
    :vars
    (
      ?auto_392178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392176 ) ( ON ?auto_392177 ?auto_392178 ) ( CLEAR ?auto_392177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392172 ) ( ON ?auto_392173 ?auto_392172 ) ( ON ?auto_392174 ?auto_392173 ) ( ON ?auto_392175 ?auto_392174 ) ( ON ?auto_392176 ?auto_392175 ) ( not ( = ?auto_392172 ?auto_392173 ) ) ( not ( = ?auto_392172 ?auto_392174 ) ) ( not ( = ?auto_392172 ?auto_392175 ) ) ( not ( = ?auto_392172 ?auto_392176 ) ) ( not ( = ?auto_392172 ?auto_392177 ) ) ( not ( = ?auto_392172 ?auto_392178 ) ) ( not ( = ?auto_392173 ?auto_392174 ) ) ( not ( = ?auto_392173 ?auto_392175 ) ) ( not ( = ?auto_392173 ?auto_392176 ) ) ( not ( = ?auto_392173 ?auto_392177 ) ) ( not ( = ?auto_392173 ?auto_392178 ) ) ( not ( = ?auto_392174 ?auto_392175 ) ) ( not ( = ?auto_392174 ?auto_392176 ) ) ( not ( = ?auto_392174 ?auto_392177 ) ) ( not ( = ?auto_392174 ?auto_392178 ) ) ( not ( = ?auto_392175 ?auto_392176 ) ) ( not ( = ?auto_392175 ?auto_392177 ) ) ( not ( = ?auto_392175 ?auto_392178 ) ) ( not ( = ?auto_392176 ?auto_392177 ) ) ( not ( = ?auto_392176 ?auto_392178 ) ) ( not ( = ?auto_392177 ?auto_392178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392177 ?auto_392178 )
      ( !STACK ?auto_392177 ?auto_392176 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392185 - BLOCK
      ?auto_392186 - BLOCK
      ?auto_392187 - BLOCK
      ?auto_392188 - BLOCK
      ?auto_392189 - BLOCK
      ?auto_392190 - BLOCK
    )
    :vars
    (
      ?auto_392191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392189 ) ( ON ?auto_392190 ?auto_392191 ) ( CLEAR ?auto_392190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392185 ) ( ON ?auto_392186 ?auto_392185 ) ( ON ?auto_392187 ?auto_392186 ) ( ON ?auto_392188 ?auto_392187 ) ( ON ?auto_392189 ?auto_392188 ) ( not ( = ?auto_392185 ?auto_392186 ) ) ( not ( = ?auto_392185 ?auto_392187 ) ) ( not ( = ?auto_392185 ?auto_392188 ) ) ( not ( = ?auto_392185 ?auto_392189 ) ) ( not ( = ?auto_392185 ?auto_392190 ) ) ( not ( = ?auto_392185 ?auto_392191 ) ) ( not ( = ?auto_392186 ?auto_392187 ) ) ( not ( = ?auto_392186 ?auto_392188 ) ) ( not ( = ?auto_392186 ?auto_392189 ) ) ( not ( = ?auto_392186 ?auto_392190 ) ) ( not ( = ?auto_392186 ?auto_392191 ) ) ( not ( = ?auto_392187 ?auto_392188 ) ) ( not ( = ?auto_392187 ?auto_392189 ) ) ( not ( = ?auto_392187 ?auto_392190 ) ) ( not ( = ?auto_392187 ?auto_392191 ) ) ( not ( = ?auto_392188 ?auto_392189 ) ) ( not ( = ?auto_392188 ?auto_392190 ) ) ( not ( = ?auto_392188 ?auto_392191 ) ) ( not ( = ?auto_392189 ?auto_392190 ) ) ( not ( = ?auto_392189 ?auto_392191 ) ) ( not ( = ?auto_392190 ?auto_392191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392190 ?auto_392191 )
      ( !STACK ?auto_392190 ?auto_392189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392198 - BLOCK
      ?auto_392199 - BLOCK
      ?auto_392200 - BLOCK
      ?auto_392201 - BLOCK
      ?auto_392202 - BLOCK
      ?auto_392203 - BLOCK
    )
    :vars
    (
      ?auto_392204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392203 ?auto_392204 ) ( ON-TABLE ?auto_392198 ) ( ON ?auto_392199 ?auto_392198 ) ( ON ?auto_392200 ?auto_392199 ) ( ON ?auto_392201 ?auto_392200 ) ( not ( = ?auto_392198 ?auto_392199 ) ) ( not ( = ?auto_392198 ?auto_392200 ) ) ( not ( = ?auto_392198 ?auto_392201 ) ) ( not ( = ?auto_392198 ?auto_392202 ) ) ( not ( = ?auto_392198 ?auto_392203 ) ) ( not ( = ?auto_392198 ?auto_392204 ) ) ( not ( = ?auto_392199 ?auto_392200 ) ) ( not ( = ?auto_392199 ?auto_392201 ) ) ( not ( = ?auto_392199 ?auto_392202 ) ) ( not ( = ?auto_392199 ?auto_392203 ) ) ( not ( = ?auto_392199 ?auto_392204 ) ) ( not ( = ?auto_392200 ?auto_392201 ) ) ( not ( = ?auto_392200 ?auto_392202 ) ) ( not ( = ?auto_392200 ?auto_392203 ) ) ( not ( = ?auto_392200 ?auto_392204 ) ) ( not ( = ?auto_392201 ?auto_392202 ) ) ( not ( = ?auto_392201 ?auto_392203 ) ) ( not ( = ?auto_392201 ?auto_392204 ) ) ( not ( = ?auto_392202 ?auto_392203 ) ) ( not ( = ?auto_392202 ?auto_392204 ) ) ( not ( = ?auto_392203 ?auto_392204 ) ) ( CLEAR ?auto_392201 ) ( ON ?auto_392202 ?auto_392203 ) ( CLEAR ?auto_392202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392198 ?auto_392199 ?auto_392200 ?auto_392201 ?auto_392202 )
      ( MAKE-6PILE ?auto_392198 ?auto_392199 ?auto_392200 ?auto_392201 ?auto_392202 ?auto_392203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392211 - BLOCK
      ?auto_392212 - BLOCK
      ?auto_392213 - BLOCK
      ?auto_392214 - BLOCK
      ?auto_392215 - BLOCK
      ?auto_392216 - BLOCK
    )
    :vars
    (
      ?auto_392217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392216 ?auto_392217 ) ( ON-TABLE ?auto_392211 ) ( ON ?auto_392212 ?auto_392211 ) ( ON ?auto_392213 ?auto_392212 ) ( ON ?auto_392214 ?auto_392213 ) ( not ( = ?auto_392211 ?auto_392212 ) ) ( not ( = ?auto_392211 ?auto_392213 ) ) ( not ( = ?auto_392211 ?auto_392214 ) ) ( not ( = ?auto_392211 ?auto_392215 ) ) ( not ( = ?auto_392211 ?auto_392216 ) ) ( not ( = ?auto_392211 ?auto_392217 ) ) ( not ( = ?auto_392212 ?auto_392213 ) ) ( not ( = ?auto_392212 ?auto_392214 ) ) ( not ( = ?auto_392212 ?auto_392215 ) ) ( not ( = ?auto_392212 ?auto_392216 ) ) ( not ( = ?auto_392212 ?auto_392217 ) ) ( not ( = ?auto_392213 ?auto_392214 ) ) ( not ( = ?auto_392213 ?auto_392215 ) ) ( not ( = ?auto_392213 ?auto_392216 ) ) ( not ( = ?auto_392213 ?auto_392217 ) ) ( not ( = ?auto_392214 ?auto_392215 ) ) ( not ( = ?auto_392214 ?auto_392216 ) ) ( not ( = ?auto_392214 ?auto_392217 ) ) ( not ( = ?auto_392215 ?auto_392216 ) ) ( not ( = ?auto_392215 ?auto_392217 ) ) ( not ( = ?auto_392216 ?auto_392217 ) ) ( CLEAR ?auto_392214 ) ( ON ?auto_392215 ?auto_392216 ) ( CLEAR ?auto_392215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392211 ?auto_392212 ?auto_392213 ?auto_392214 ?auto_392215 )
      ( MAKE-6PILE ?auto_392211 ?auto_392212 ?auto_392213 ?auto_392214 ?auto_392215 ?auto_392216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392224 - BLOCK
      ?auto_392225 - BLOCK
      ?auto_392226 - BLOCK
      ?auto_392227 - BLOCK
      ?auto_392228 - BLOCK
      ?auto_392229 - BLOCK
    )
    :vars
    (
      ?auto_392230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392229 ?auto_392230 ) ( ON-TABLE ?auto_392224 ) ( ON ?auto_392225 ?auto_392224 ) ( ON ?auto_392226 ?auto_392225 ) ( not ( = ?auto_392224 ?auto_392225 ) ) ( not ( = ?auto_392224 ?auto_392226 ) ) ( not ( = ?auto_392224 ?auto_392227 ) ) ( not ( = ?auto_392224 ?auto_392228 ) ) ( not ( = ?auto_392224 ?auto_392229 ) ) ( not ( = ?auto_392224 ?auto_392230 ) ) ( not ( = ?auto_392225 ?auto_392226 ) ) ( not ( = ?auto_392225 ?auto_392227 ) ) ( not ( = ?auto_392225 ?auto_392228 ) ) ( not ( = ?auto_392225 ?auto_392229 ) ) ( not ( = ?auto_392225 ?auto_392230 ) ) ( not ( = ?auto_392226 ?auto_392227 ) ) ( not ( = ?auto_392226 ?auto_392228 ) ) ( not ( = ?auto_392226 ?auto_392229 ) ) ( not ( = ?auto_392226 ?auto_392230 ) ) ( not ( = ?auto_392227 ?auto_392228 ) ) ( not ( = ?auto_392227 ?auto_392229 ) ) ( not ( = ?auto_392227 ?auto_392230 ) ) ( not ( = ?auto_392228 ?auto_392229 ) ) ( not ( = ?auto_392228 ?auto_392230 ) ) ( not ( = ?auto_392229 ?auto_392230 ) ) ( ON ?auto_392228 ?auto_392229 ) ( CLEAR ?auto_392226 ) ( ON ?auto_392227 ?auto_392228 ) ( CLEAR ?auto_392227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392224 ?auto_392225 ?auto_392226 ?auto_392227 )
      ( MAKE-6PILE ?auto_392224 ?auto_392225 ?auto_392226 ?auto_392227 ?auto_392228 ?auto_392229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392237 - BLOCK
      ?auto_392238 - BLOCK
      ?auto_392239 - BLOCK
      ?auto_392240 - BLOCK
      ?auto_392241 - BLOCK
      ?auto_392242 - BLOCK
    )
    :vars
    (
      ?auto_392243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392242 ?auto_392243 ) ( ON-TABLE ?auto_392237 ) ( ON ?auto_392238 ?auto_392237 ) ( ON ?auto_392239 ?auto_392238 ) ( not ( = ?auto_392237 ?auto_392238 ) ) ( not ( = ?auto_392237 ?auto_392239 ) ) ( not ( = ?auto_392237 ?auto_392240 ) ) ( not ( = ?auto_392237 ?auto_392241 ) ) ( not ( = ?auto_392237 ?auto_392242 ) ) ( not ( = ?auto_392237 ?auto_392243 ) ) ( not ( = ?auto_392238 ?auto_392239 ) ) ( not ( = ?auto_392238 ?auto_392240 ) ) ( not ( = ?auto_392238 ?auto_392241 ) ) ( not ( = ?auto_392238 ?auto_392242 ) ) ( not ( = ?auto_392238 ?auto_392243 ) ) ( not ( = ?auto_392239 ?auto_392240 ) ) ( not ( = ?auto_392239 ?auto_392241 ) ) ( not ( = ?auto_392239 ?auto_392242 ) ) ( not ( = ?auto_392239 ?auto_392243 ) ) ( not ( = ?auto_392240 ?auto_392241 ) ) ( not ( = ?auto_392240 ?auto_392242 ) ) ( not ( = ?auto_392240 ?auto_392243 ) ) ( not ( = ?auto_392241 ?auto_392242 ) ) ( not ( = ?auto_392241 ?auto_392243 ) ) ( not ( = ?auto_392242 ?auto_392243 ) ) ( ON ?auto_392241 ?auto_392242 ) ( CLEAR ?auto_392239 ) ( ON ?auto_392240 ?auto_392241 ) ( CLEAR ?auto_392240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392237 ?auto_392238 ?auto_392239 ?auto_392240 )
      ( MAKE-6PILE ?auto_392237 ?auto_392238 ?auto_392239 ?auto_392240 ?auto_392241 ?auto_392242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392250 - BLOCK
      ?auto_392251 - BLOCK
      ?auto_392252 - BLOCK
      ?auto_392253 - BLOCK
      ?auto_392254 - BLOCK
      ?auto_392255 - BLOCK
    )
    :vars
    (
      ?auto_392256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392255 ?auto_392256 ) ( ON-TABLE ?auto_392250 ) ( ON ?auto_392251 ?auto_392250 ) ( not ( = ?auto_392250 ?auto_392251 ) ) ( not ( = ?auto_392250 ?auto_392252 ) ) ( not ( = ?auto_392250 ?auto_392253 ) ) ( not ( = ?auto_392250 ?auto_392254 ) ) ( not ( = ?auto_392250 ?auto_392255 ) ) ( not ( = ?auto_392250 ?auto_392256 ) ) ( not ( = ?auto_392251 ?auto_392252 ) ) ( not ( = ?auto_392251 ?auto_392253 ) ) ( not ( = ?auto_392251 ?auto_392254 ) ) ( not ( = ?auto_392251 ?auto_392255 ) ) ( not ( = ?auto_392251 ?auto_392256 ) ) ( not ( = ?auto_392252 ?auto_392253 ) ) ( not ( = ?auto_392252 ?auto_392254 ) ) ( not ( = ?auto_392252 ?auto_392255 ) ) ( not ( = ?auto_392252 ?auto_392256 ) ) ( not ( = ?auto_392253 ?auto_392254 ) ) ( not ( = ?auto_392253 ?auto_392255 ) ) ( not ( = ?auto_392253 ?auto_392256 ) ) ( not ( = ?auto_392254 ?auto_392255 ) ) ( not ( = ?auto_392254 ?auto_392256 ) ) ( not ( = ?auto_392255 ?auto_392256 ) ) ( ON ?auto_392254 ?auto_392255 ) ( ON ?auto_392253 ?auto_392254 ) ( CLEAR ?auto_392251 ) ( ON ?auto_392252 ?auto_392253 ) ( CLEAR ?auto_392252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392250 ?auto_392251 ?auto_392252 )
      ( MAKE-6PILE ?auto_392250 ?auto_392251 ?auto_392252 ?auto_392253 ?auto_392254 ?auto_392255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392263 - BLOCK
      ?auto_392264 - BLOCK
      ?auto_392265 - BLOCK
      ?auto_392266 - BLOCK
      ?auto_392267 - BLOCK
      ?auto_392268 - BLOCK
    )
    :vars
    (
      ?auto_392269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392268 ?auto_392269 ) ( ON-TABLE ?auto_392263 ) ( ON ?auto_392264 ?auto_392263 ) ( not ( = ?auto_392263 ?auto_392264 ) ) ( not ( = ?auto_392263 ?auto_392265 ) ) ( not ( = ?auto_392263 ?auto_392266 ) ) ( not ( = ?auto_392263 ?auto_392267 ) ) ( not ( = ?auto_392263 ?auto_392268 ) ) ( not ( = ?auto_392263 ?auto_392269 ) ) ( not ( = ?auto_392264 ?auto_392265 ) ) ( not ( = ?auto_392264 ?auto_392266 ) ) ( not ( = ?auto_392264 ?auto_392267 ) ) ( not ( = ?auto_392264 ?auto_392268 ) ) ( not ( = ?auto_392264 ?auto_392269 ) ) ( not ( = ?auto_392265 ?auto_392266 ) ) ( not ( = ?auto_392265 ?auto_392267 ) ) ( not ( = ?auto_392265 ?auto_392268 ) ) ( not ( = ?auto_392265 ?auto_392269 ) ) ( not ( = ?auto_392266 ?auto_392267 ) ) ( not ( = ?auto_392266 ?auto_392268 ) ) ( not ( = ?auto_392266 ?auto_392269 ) ) ( not ( = ?auto_392267 ?auto_392268 ) ) ( not ( = ?auto_392267 ?auto_392269 ) ) ( not ( = ?auto_392268 ?auto_392269 ) ) ( ON ?auto_392267 ?auto_392268 ) ( ON ?auto_392266 ?auto_392267 ) ( CLEAR ?auto_392264 ) ( ON ?auto_392265 ?auto_392266 ) ( CLEAR ?auto_392265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392263 ?auto_392264 ?auto_392265 )
      ( MAKE-6PILE ?auto_392263 ?auto_392264 ?auto_392265 ?auto_392266 ?auto_392267 ?auto_392268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392276 - BLOCK
      ?auto_392277 - BLOCK
      ?auto_392278 - BLOCK
      ?auto_392279 - BLOCK
      ?auto_392280 - BLOCK
      ?auto_392281 - BLOCK
    )
    :vars
    (
      ?auto_392282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392281 ?auto_392282 ) ( ON-TABLE ?auto_392276 ) ( not ( = ?auto_392276 ?auto_392277 ) ) ( not ( = ?auto_392276 ?auto_392278 ) ) ( not ( = ?auto_392276 ?auto_392279 ) ) ( not ( = ?auto_392276 ?auto_392280 ) ) ( not ( = ?auto_392276 ?auto_392281 ) ) ( not ( = ?auto_392276 ?auto_392282 ) ) ( not ( = ?auto_392277 ?auto_392278 ) ) ( not ( = ?auto_392277 ?auto_392279 ) ) ( not ( = ?auto_392277 ?auto_392280 ) ) ( not ( = ?auto_392277 ?auto_392281 ) ) ( not ( = ?auto_392277 ?auto_392282 ) ) ( not ( = ?auto_392278 ?auto_392279 ) ) ( not ( = ?auto_392278 ?auto_392280 ) ) ( not ( = ?auto_392278 ?auto_392281 ) ) ( not ( = ?auto_392278 ?auto_392282 ) ) ( not ( = ?auto_392279 ?auto_392280 ) ) ( not ( = ?auto_392279 ?auto_392281 ) ) ( not ( = ?auto_392279 ?auto_392282 ) ) ( not ( = ?auto_392280 ?auto_392281 ) ) ( not ( = ?auto_392280 ?auto_392282 ) ) ( not ( = ?auto_392281 ?auto_392282 ) ) ( ON ?auto_392280 ?auto_392281 ) ( ON ?auto_392279 ?auto_392280 ) ( ON ?auto_392278 ?auto_392279 ) ( CLEAR ?auto_392276 ) ( ON ?auto_392277 ?auto_392278 ) ( CLEAR ?auto_392277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392276 ?auto_392277 )
      ( MAKE-6PILE ?auto_392276 ?auto_392277 ?auto_392278 ?auto_392279 ?auto_392280 ?auto_392281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392289 - BLOCK
      ?auto_392290 - BLOCK
      ?auto_392291 - BLOCK
      ?auto_392292 - BLOCK
      ?auto_392293 - BLOCK
      ?auto_392294 - BLOCK
    )
    :vars
    (
      ?auto_392295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392294 ?auto_392295 ) ( ON-TABLE ?auto_392289 ) ( not ( = ?auto_392289 ?auto_392290 ) ) ( not ( = ?auto_392289 ?auto_392291 ) ) ( not ( = ?auto_392289 ?auto_392292 ) ) ( not ( = ?auto_392289 ?auto_392293 ) ) ( not ( = ?auto_392289 ?auto_392294 ) ) ( not ( = ?auto_392289 ?auto_392295 ) ) ( not ( = ?auto_392290 ?auto_392291 ) ) ( not ( = ?auto_392290 ?auto_392292 ) ) ( not ( = ?auto_392290 ?auto_392293 ) ) ( not ( = ?auto_392290 ?auto_392294 ) ) ( not ( = ?auto_392290 ?auto_392295 ) ) ( not ( = ?auto_392291 ?auto_392292 ) ) ( not ( = ?auto_392291 ?auto_392293 ) ) ( not ( = ?auto_392291 ?auto_392294 ) ) ( not ( = ?auto_392291 ?auto_392295 ) ) ( not ( = ?auto_392292 ?auto_392293 ) ) ( not ( = ?auto_392292 ?auto_392294 ) ) ( not ( = ?auto_392292 ?auto_392295 ) ) ( not ( = ?auto_392293 ?auto_392294 ) ) ( not ( = ?auto_392293 ?auto_392295 ) ) ( not ( = ?auto_392294 ?auto_392295 ) ) ( ON ?auto_392293 ?auto_392294 ) ( ON ?auto_392292 ?auto_392293 ) ( ON ?auto_392291 ?auto_392292 ) ( CLEAR ?auto_392289 ) ( ON ?auto_392290 ?auto_392291 ) ( CLEAR ?auto_392290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392289 ?auto_392290 )
      ( MAKE-6PILE ?auto_392289 ?auto_392290 ?auto_392291 ?auto_392292 ?auto_392293 ?auto_392294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392302 - BLOCK
      ?auto_392303 - BLOCK
      ?auto_392304 - BLOCK
      ?auto_392305 - BLOCK
      ?auto_392306 - BLOCK
      ?auto_392307 - BLOCK
    )
    :vars
    (
      ?auto_392308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392307 ?auto_392308 ) ( not ( = ?auto_392302 ?auto_392303 ) ) ( not ( = ?auto_392302 ?auto_392304 ) ) ( not ( = ?auto_392302 ?auto_392305 ) ) ( not ( = ?auto_392302 ?auto_392306 ) ) ( not ( = ?auto_392302 ?auto_392307 ) ) ( not ( = ?auto_392302 ?auto_392308 ) ) ( not ( = ?auto_392303 ?auto_392304 ) ) ( not ( = ?auto_392303 ?auto_392305 ) ) ( not ( = ?auto_392303 ?auto_392306 ) ) ( not ( = ?auto_392303 ?auto_392307 ) ) ( not ( = ?auto_392303 ?auto_392308 ) ) ( not ( = ?auto_392304 ?auto_392305 ) ) ( not ( = ?auto_392304 ?auto_392306 ) ) ( not ( = ?auto_392304 ?auto_392307 ) ) ( not ( = ?auto_392304 ?auto_392308 ) ) ( not ( = ?auto_392305 ?auto_392306 ) ) ( not ( = ?auto_392305 ?auto_392307 ) ) ( not ( = ?auto_392305 ?auto_392308 ) ) ( not ( = ?auto_392306 ?auto_392307 ) ) ( not ( = ?auto_392306 ?auto_392308 ) ) ( not ( = ?auto_392307 ?auto_392308 ) ) ( ON ?auto_392306 ?auto_392307 ) ( ON ?auto_392305 ?auto_392306 ) ( ON ?auto_392304 ?auto_392305 ) ( ON ?auto_392303 ?auto_392304 ) ( ON ?auto_392302 ?auto_392303 ) ( CLEAR ?auto_392302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392302 )
      ( MAKE-6PILE ?auto_392302 ?auto_392303 ?auto_392304 ?auto_392305 ?auto_392306 ?auto_392307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_392315 - BLOCK
      ?auto_392316 - BLOCK
      ?auto_392317 - BLOCK
      ?auto_392318 - BLOCK
      ?auto_392319 - BLOCK
      ?auto_392320 - BLOCK
    )
    :vars
    (
      ?auto_392321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392320 ?auto_392321 ) ( not ( = ?auto_392315 ?auto_392316 ) ) ( not ( = ?auto_392315 ?auto_392317 ) ) ( not ( = ?auto_392315 ?auto_392318 ) ) ( not ( = ?auto_392315 ?auto_392319 ) ) ( not ( = ?auto_392315 ?auto_392320 ) ) ( not ( = ?auto_392315 ?auto_392321 ) ) ( not ( = ?auto_392316 ?auto_392317 ) ) ( not ( = ?auto_392316 ?auto_392318 ) ) ( not ( = ?auto_392316 ?auto_392319 ) ) ( not ( = ?auto_392316 ?auto_392320 ) ) ( not ( = ?auto_392316 ?auto_392321 ) ) ( not ( = ?auto_392317 ?auto_392318 ) ) ( not ( = ?auto_392317 ?auto_392319 ) ) ( not ( = ?auto_392317 ?auto_392320 ) ) ( not ( = ?auto_392317 ?auto_392321 ) ) ( not ( = ?auto_392318 ?auto_392319 ) ) ( not ( = ?auto_392318 ?auto_392320 ) ) ( not ( = ?auto_392318 ?auto_392321 ) ) ( not ( = ?auto_392319 ?auto_392320 ) ) ( not ( = ?auto_392319 ?auto_392321 ) ) ( not ( = ?auto_392320 ?auto_392321 ) ) ( ON ?auto_392319 ?auto_392320 ) ( ON ?auto_392318 ?auto_392319 ) ( ON ?auto_392317 ?auto_392318 ) ( ON ?auto_392316 ?auto_392317 ) ( ON ?auto_392315 ?auto_392316 ) ( CLEAR ?auto_392315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392315 )
      ( MAKE-6PILE ?auto_392315 ?auto_392316 ?auto_392317 ?auto_392318 ?auto_392319 ?auto_392320 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392329 - BLOCK
      ?auto_392330 - BLOCK
      ?auto_392331 - BLOCK
      ?auto_392332 - BLOCK
      ?auto_392333 - BLOCK
      ?auto_392334 - BLOCK
      ?auto_392335 - BLOCK
    )
    :vars
    (
      ?auto_392336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392334 ) ( ON ?auto_392335 ?auto_392336 ) ( CLEAR ?auto_392335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392329 ) ( ON ?auto_392330 ?auto_392329 ) ( ON ?auto_392331 ?auto_392330 ) ( ON ?auto_392332 ?auto_392331 ) ( ON ?auto_392333 ?auto_392332 ) ( ON ?auto_392334 ?auto_392333 ) ( not ( = ?auto_392329 ?auto_392330 ) ) ( not ( = ?auto_392329 ?auto_392331 ) ) ( not ( = ?auto_392329 ?auto_392332 ) ) ( not ( = ?auto_392329 ?auto_392333 ) ) ( not ( = ?auto_392329 ?auto_392334 ) ) ( not ( = ?auto_392329 ?auto_392335 ) ) ( not ( = ?auto_392329 ?auto_392336 ) ) ( not ( = ?auto_392330 ?auto_392331 ) ) ( not ( = ?auto_392330 ?auto_392332 ) ) ( not ( = ?auto_392330 ?auto_392333 ) ) ( not ( = ?auto_392330 ?auto_392334 ) ) ( not ( = ?auto_392330 ?auto_392335 ) ) ( not ( = ?auto_392330 ?auto_392336 ) ) ( not ( = ?auto_392331 ?auto_392332 ) ) ( not ( = ?auto_392331 ?auto_392333 ) ) ( not ( = ?auto_392331 ?auto_392334 ) ) ( not ( = ?auto_392331 ?auto_392335 ) ) ( not ( = ?auto_392331 ?auto_392336 ) ) ( not ( = ?auto_392332 ?auto_392333 ) ) ( not ( = ?auto_392332 ?auto_392334 ) ) ( not ( = ?auto_392332 ?auto_392335 ) ) ( not ( = ?auto_392332 ?auto_392336 ) ) ( not ( = ?auto_392333 ?auto_392334 ) ) ( not ( = ?auto_392333 ?auto_392335 ) ) ( not ( = ?auto_392333 ?auto_392336 ) ) ( not ( = ?auto_392334 ?auto_392335 ) ) ( not ( = ?auto_392334 ?auto_392336 ) ) ( not ( = ?auto_392335 ?auto_392336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392335 ?auto_392336 )
      ( !STACK ?auto_392335 ?auto_392334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392344 - BLOCK
      ?auto_392345 - BLOCK
      ?auto_392346 - BLOCK
      ?auto_392347 - BLOCK
      ?auto_392348 - BLOCK
      ?auto_392349 - BLOCK
      ?auto_392350 - BLOCK
    )
    :vars
    (
      ?auto_392351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392349 ) ( ON ?auto_392350 ?auto_392351 ) ( CLEAR ?auto_392350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392344 ) ( ON ?auto_392345 ?auto_392344 ) ( ON ?auto_392346 ?auto_392345 ) ( ON ?auto_392347 ?auto_392346 ) ( ON ?auto_392348 ?auto_392347 ) ( ON ?auto_392349 ?auto_392348 ) ( not ( = ?auto_392344 ?auto_392345 ) ) ( not ( = ?auto_392344 ?auto_392346 ) ) ( not ( = ?auto_392344 ?auto_392347 ) ) ( not ( = ?auto_392344 ?auto_392348 ) ) ( not ( = ?auto_392344 ?auto_392349 ) ) ( not ( = ?auto_392344 ?auto_392350 ) ) ( not ( = ?auto_392344 ?auto_392351 ) ) ( not ( = ?auto_392345 ?auto_392346 ) ) ( not ( = ?auto_392345 ?auto_392347 ) ) ( not ( = ?auto_392345 ?auto_392348 ) ) ( not ( = ?auto_392345 ?auto_392349 ) ) ( not ( = ?auto_392345 ?auto_392350 ) ) ( not ( = ?auto_392345 ?auto_392351 ) ) ( not ( = ?auto_392346 ?auto_392347 ) ) ( not ( = ?auto_392346 ?auto_392348 ) ) ( not ( = ?auto_392346 ?auto_392349 ) ) ( not ( = ?auto_392346 ?auto_392350 ) ) ( not ( = ?auto_392346 ?auto_392351 ) ) ( not ( = ?auto_392347 ?auto_392348 ) ) ( not ( = ?auto_392347 ?auto_392349 ) ) ( not ( = ?auto_392347 ?auto_392350 ) ) ( not ( = ?auto_392347 ?auto_392351 ) ) ( not ( = ?auto_392348 ?auto_392349 ) ) ( not ( = ?auto_392348 ?auto_392350 ) ) ( not ( = ?auto_392348 ?auto_392351 ) ) ( not ( = ?auto_392349 ?auto_392350 ) ) ( not ( = ?auto_392349 ?auto_392351 ) ) ( not ( = ?auto_392350 ?auto_392351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392350 ?auto_392351 )
      ( !STACK ?auto_392350 ?auto_392349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392359 - BLOCK
      ?auto_392360 - BLOCK
      ?auto_392361 - BLOCK
      ?auto_392362 - BLOCK
      ?auto_392363 - BLOCK
      ?auto_392364 - BLOCK
      ?auto_392365 - BLOCK
    )
    :vars
    (
      ?auto_392366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392365 ?auto_392366 ) ( ON-TABLE ?auto_392359 ) ( ON ?auto_392360 ?auto_392359 ) ( ON ?auto_392361 ?auto_392360 ) ( ON ?auto_392362 ?auto_392361 ) ( ON ?auto_392363 ?auto_392362 ) ( not ( = ?auto_392359 ?auto_392360 ) ) ( not ( = ?auto_392359 ?auto_392361 ) ) ( not ( = ?auto_392359 ?auto_392362 ) ) ( not ( = ?auto_392359 ?auto_392363 ) ) ( not ( = ?auto_392359 ?auto_392364 ) ) ( not ( = ?auto_392359 ?auto_392365 ) ) ( not ( = ?auto_392359 ?auto_392366 ) ) ( not ( = ?auto_392360 ?auto_392361 ) ) ( not ( = ?auto_392360 ?auto_392362 ) ) ( not ( = ?auto_392360 ?auto_392363 ) ) ( not ( = ?auto_392360 ?auto_392364 ) ) ( not ( = ?auto_392360 ?auto_392365 ) ) ( not ( = ?auto_392360 ?auto_392366 ) ) ( not ( = ?auto_392361 ?auto_392362 ) ) ( not ( = ?auto_392361 ?auto_392363 ) ) ( not ( = ?auto_392361 ?auto_392364 ) ) ( not ( = ?auto_392361 ?auto_392365 ) ) ( not ( = ?auto_392361 ?auto_392366 ) ) ( not ( = ?auto_392362 ?auto_392363 ) ) ( not ( = ?auto_392362 ?auto_392364 ) ) ( not ( = ?auto_392362 ?auto_392365 ) ) ( not ( = ?auto_392362 ?auto_392366 ) ) ( not ( = ?auto_392363 ?auto_392364 ) ) ( not ( = ?auto_392363 ?auto_392365 ) ) ( not ( = ?auto_392363 ?auto_392366 ) ) ( not ( = ?auto_392364 ?auto_392365 ) ) ( not ( = ?auto_392364 ?auto_392366 ) ) ( not ( = ?auto_392365 ?auto_392366 ) ) ( CLEAR ?auto_392363 ) ( ON ?auto_392364 ?auto_392365 ) ( CLEAR ?auto_392364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392359 ?auto_392360 ?auto_392361 ?auto_392362 ?auto_392363 ?auto_392364 )
      ( MAKE-7PILE ?auto_392359 ?auto_392360 ?auto_392361 ?auto_392362 ?auto_392363 ?auto_392364 ?auto_392365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392374 - BLOCK
      ?auto_392375 - BLOCK
      ?auto_392376 - BLOCK
      ?auto_392377 - BLOCK
      ?auto_392378 - BLOCK
      ?auto_392379 - BLOCK
      ?auto_392380 - BLOCK
    )
    :vars
    (
      ?auto_392381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392380 ?auto_392381 ) ( ON-TABLE ?auto_392374 ) ( ON ?auto_392375 ?auto_392374 ) ( ON ?auto_392376 ?auto_392375 ) ( ON ?auto_392377 ?auto_392376 ) ( ON ?auto_392378 ?auto_392377 ) ( not ( = ?auto_392374 ?auto_392375 ) ) ( not ( = ?auto_392374 ?auto_392376 ) ) ( not ( = ?auto_392374 ?auto_392377 ) ) ( not ( = ?auto_392374 ?auto_392378 ) ) ( not ( = ?auto_392374 ?auto_392379 ) ) ( not ( = ?auto_392374 ?auto_392380 ) ) ( not ( = ?auto_392374 ?auto_392381 ) ) ( not ( = ?auto_392375 ?auto_392376 ) ) ( not ( = ?auto_392375 ?auto_392377 ) ) ( not ( = ?auto_392375 ?auto_392378 ) ) ( not ( = ?auto_392375 ?auto_392379 ) ) ( not ( = ?auto_392375 ?auto_392380 ) ) ( not ( = ?auto_392375 ?auto_392381 ) ) ( not ( = ?auto_392376 ?auto_392377 ) ) ( not ( = ?auto_392376 ?auto_392378 ) ) ( not ( = ?auto_392376 ?auto_392379 ) ) ( not ( = ?auto_392376 ?auto_392380 ) ) ( not ( = ?auto_392376 ?auto_392381 ) ) ( not ( = ?auto_392377 ?auto_392378 ) ) ( not ( = ?auto_392377 ?auto_392379 ) ) ( not ( = ?auto_392377 ?auto_392380 ) ) ( not ( = ?auto_392377 ?auto_392381 ) ) ( not ( = ?auto_392378 ?auto_392379 ) ) ( not ( = ?auto_392378 ?auto_392380 ) ) ( not ( = ?auto_392378 ?auto_392381 ) ) ( not ( = ?auto_392379 ?auto_392380 ) ) ( not ( = ?auto_392379 ?auto_392381 ) ) ( not ( = ?auto_392380 ?auto_392381 ) ) ( CLEAR ?auto_392378 ) ( ON ?auto_392379 ?auto_392380 ) ( CLEAR ?auto_392379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392374 ?auto_392375 ?auto_392376 ?auto_392377 ?auto_392378 ?auto_392379 )
      ( MAKE-7PILE ?auto_392374 ?auto_392375 ?auto_392376 ?auto_392377 ?auto_392378 ?auto_392379 ?auto_392380 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392389 - BLOCK
      ?auto_392390 - BLOCK
      ?auto_392391 - BLOCK
      ?auto_392392 - BLOCK
      ?auto_392393 - BLOCK
      ?auto_392394 - BLOCK
      ?auto_392395 - BLOCK
    )
    :vars
    (
      ?auto_392396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392395 ?auto_392396 ) ( ON-TABLE ?auto_392389 ) ( ON ?auto_392390 ?auto_392389 ) ( ON ?auto_392391 ?auto_392390 ) ( ON ?auto_392392 ?auto_392391 ) ( not ( = ?auto_392389 ?auto_392390 ) ) ( not ( = ?auto_392389 ?auto_392391 ) ) ( not ( = ?auto_392389 ?auto_392392 ) ) ( not ( = ?auto_392389 ?auto_392393 ) ) ( not ( = ?auto_392389 ?auto_392394 ) ) ( not ( = ?auto_392389 ?auto_392395 ) ) ( not ( = ?auto_392389 ?auto_392396 ) ) ( not ( = ?auto_392390 ?auto_392391 ) ) ( not ( = ?auto_392390 ?auto_392392 ) ) ( not ( = ?auto_392390 ?auto_392393 ) ) ( not ( = ?auto_392390 ?auto_392394 ) ) ( not ( = ?auto_392390 ?auto_392395 ) ) ( not ( = ?auto_392390 ?auto_392396 ) ) ( not ( = ?auto_392391 ?auto_392392 ) ) ( not ( = ?auto_392391 ?auto_392393 ) ) ( not ( = ?auto_392391 ?auto_392394 ) ) ( not ( = ?auto_392391 ?auto_392395 ) ) ( not ( = ?auto_392391 ?auto_392396 ) ) ( not ( = ?auto_392392 ?auto_392393 ) ) ( not ( = ?auto_392392 ?auto_392394 ) ) ( not ( = ?auto_392392 ?auto_392395 ) ) ( not ( = ?auto_392392 ?auto_392396 ) ) ( not ( = ?auto_392393 ?auto_392394 ) ) ( not ( = ?auto_392393 ?auto_392395 ) ) ( not ( = ?auto_392393 ?auto_392396 ) ) ( not ( = ?auto_392394 ?auto_392395 ) ) ( not ( = ?auto_392394 ?auto_392396 ) ) ( not ( = ?auto_392395 ?auto_392396 ) ) ( ON ?auto_392394 ?auto_392395 ) ( CLEAR ?auto_392392 ) ( ON ?auto_392393 ?auto_392394 ) ( CLEAR ?auto_392393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392389 ?auto_392390 ?auto_392391 ?auto_392392 ?auto_392393 )
      ( MAKE-7PILE ?auto_392389 ?auto_392390 ?auto_392391 ?auto_392392 ?auto_392393 ?auto_392394 ?auto_392395 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392404 - BLOCK
      ?auto_392405 - BLOCK
      ?auto_392406 - BLOCK
      ?auto_392407 - BLOCK
      ?auto_392408 - BLOCK
      ?auto_392409 - BLOCK
      ?auto_392410 - BLOCK
    )
    :vars
    (
      ?auto_392411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392410 ?auto_392411 ) ( ON-TABLE ?auto_392404 ) ( ON ?auto_392405 ?auto_392404 ) ( ON ?auto_392406 ?auto_392405 ) ( ON ?auto_392407 ?auto_392406 ) ( not ( = ?auto_392404 ?auto_392405 ) ) ( not ( = ?auto_392404 ?auto_392406 ) ) ( not ( = ?auto_392404 ?auto_392407 ) ) ( not ( = ?auto_392404 ?auto_392408 ) ) ( not ( = ?auto_392404 ?auto_392409 ) ) ( not ( = ?auto_392404 ?auto_392410 ) ) ( not ( = ?auto_392404 ?auto_392411 ) ) ( not ( = ?auto_392405 ?auto_392406 ) ) ( not ( = ?auto_392405 ?auto_392407 ) ) ( not ( = ?auto_392405 ?auto_392408 ) ) ( not ( = ?auto_392405 ?auto_392409 ) ) ( not ( = ?auto_392405 ?auto_392410 ) ) ( not ( = ?auto_392405 ?auto_392411 ) ) ( not ( = ?auto_392406 ?auto_392407 ) ) ( not ( = ?auto_392406 ?auto_392408 ) ) ( not ( = ?auto_392406 ?auto_392409 ) ) ( not ( = ?auto_392406 ?auto_392410 ) ) ( not ( = ?auto_392406 ?auto_392411 ) ) ( not ( = ?auto_392407 ?auto_392408 ) ) ( not ( = ?auto_392407 ?auto_392409 ) ) ( not ( = ?auto_392407 ?auto_392410 ) ) ( not ( = ?auto_392407 ?auto_392411 ) ) ( not ( = ?auto_392408 ?auto_392409 ) ) ( not ( = ?auto_392408 ?auto_392410 ) ) ( not ( = ?auto_392408 ?auto_392411 ) ) ( not ( = ?auto_392409 ?auto_392410 ) ) ( not ( = ?auto_392409 ?auto_392411 ) ) ( not ( = ?auto_392410 ?auto_392411 ) ) ( ON ?auto_392409 ?auto_392410 ) ( CLEAR ?auto_392407 ) ( ON ?auto_392408 ?auto_392409 ) ( CLEAR ?auto_392408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392404 ?auto_392405 ?auto_392406 ?auto_392407 ?auto_392408 )
      ( MAKE-7PILE ?auto_392404 ?auto_392405 ?auto_392406 ?auto_392407 ?auto_392408 ?auto_392409 ?auto_392410 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392419 - BLOCK
      ?auto_392420 - BLOCK
      ?auto_392421 - BLOCK
      ?auto_392422 - BLOCK
      ?auto_392423 - BLOCK
      ?auto_392424 - BLOCK
      ?auto_392425 - BLOCK
    )
    :vars
    (
      ?auto_392426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392425 ?auto_392426 ) ( ON-TABLE ?auto_392419 ) ( ON ?auto_392420 ?auto_392419 ) ( ON ?auto_392421 ?auto_392420 ) ( not ( = ?auto_392419 ?auto_392420 ) ) ( not ( = ?auto_392419 ?auto_392421 ) ) ( not ( = ?auto_392419 ?auto_392422 ) ) ( not ( = ?auto_392419 ?auto_392423 ) ) ( not ( = ?auto_392419 ?auto_392424 ) ) ( not ( = ?auto_392419 ?auto_392425 ) ) ( not ( = ?auto_392419 ?auto_392426 ) ) ( not ( = ?auto_392420 ?auto_392421 ) ) ( not ( = ?auto_392420 ?auto_392422 ) ) ( not ( = ?auto_392420 ?auto_392423 ) ) ( not ( = ?auto_392420 ?auto_392424 ) ) ( not ( = ?auto_392420 ?auto_392425 ) ) ( not ( = ?auto_392420 ?auto_392426 ) ) ( not ( = ?auto_392421 ?auto_392422 ) ) ( not ( = ?auto_392421 ?auto_392423 ) ) ( not ( = ?auto_392421 ?auto_392424 ) ) ( not ( = ?auto_392421 ?auto_392425 ) ) ( not ( = ?auto_392421 ?auto_392426 ) ) ( not ( = ?auto_392422 ?auto_392423 ) ) ( not ( = ?auto_392422 ?auto_392424 ) ) ( not ( = ?auto_392422 ?auto_392425 ) ) ( not ( = ?auto_392422 ?auto_392426 ) ) ( not ( = ?auto_392423 ?auto_392424 ) ) ( not ( = ?auto_392423 ?auto_392425 ) ) ( not ( = ?auto_392423 ?auto_392426 ) ) ( not ( = ?auto_392424 ?auto_392425 ) ) ( not ( = ?auto_392424 ?auto_392426 ) ) ( not ( = ?auto_392425 ?auto_392426 ) ) ( ON ?auto_392424 ?auto_392425 ) ( ON ?auto_392423 ?auto_392424 ) ( CLEAR ?auto_392421 ) ( ON ?auto_392422 ?auto_392423 ) ( CLEAR ?auto_392422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392419 ?auto_392420 ?auto_392421 ?auto_392422 )
      ( MAKE-7PILE ?auto_392419 ?auto_392420 ?auto_392421 ?auto_392422 ?auto_392423 ?auto_392424 ?auto_392425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392434 - BLOCK
      ?auto_392435 - BLOCK
      ?auto_392436 - BLOCK
      ?auto_392437 - BLOCK
      ?auto_392438 - BLOCK
      ?auto_392439 - BLOCK
      ?auto_392440 - BLOCK
    )
    :vars
    (
      ?auto_392441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392440 ?auto_392441 ) ( ON-TABLE ?auto_392434 ) ( ON ?auto_392435 ?auto_392434 ) ( ON ?auto_392436 ?auto_392435 ) ( not ( = ?auto_392434 ?auto_392435 ) ) ( not ( = ?auto_392434 ?auto_392436 ) ) ( not ( = ?auto_392434 ?auto_392437 ) ) ( not ( = ?auto_392434 ?auto_392438 ) ) ( not ( = ?auto_392434 ?auto_392439 ) ) ( not ( = ?auto_392434 ?auto_392440 ) ) ( not ( = ?auto_392434 ?auto_392441 ) ) ( not ( = ?auto_392435 ?auto_392436 ) ) ( not ( = ?auto_392435 ?auto_392437 ) ) ( not ( = ?auto_392435 ?auto_392438 ) ) ( not ( = ?auto_392435 ?auto_392439 ) ) ( not ( = ?auto_392435 ?auto_392440 ) ) ( not ( = ?auto_392435 ?auto_392441 ) ) ( not ( = ?auto_392436 ?auto_392437 ) ) ( not ( = ?auto_392436 ?auto_392438 ) ) ( not ( = ?auto_392436 ?auto_392439 ) ) ( not ( = ?auto_392436 ?auto_392440 ) ) ( not ( = ?auto_392436 ?auto_392441 ) ) ( not ( = ?auto_392437 ?auto_392438 ) ) ( not ( = ?auto_392437 ?auto_392439 ) ) ( not ( = ?auto_392437 ?auto_392440 ) ) ( not ( = ?auto_392437 ?auto_392441 ) ) ( not ( = ?auto_392438 ?auto_392439 ) ) ( not ( = ?auto_392438 ?auto_392440 ) ) ( not ( = ?auto_392438 ?auto_392441 ) ) ( not ( = ?auto_392439 ?auto_392440 ) ) ( not ( = ?auto_392439 ?auto_392441 ) ) ( not ( = ?auto_392440 ?auto_392441 ) ) ( ON ?auto_392439 ?auto_392440 ) ( ON ?auto_392438 ?auto_392439 ) ( CLEAR ?auto_392436 ) ( ON ?auto_392437 ?auto_392438 ) ( CLEAR ?auto_392437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392434 ?auto_392435 ?auto_392436 ?auto_392437 )
      ( MAKE-7PILE ?auto_392434 ?auto_392435 ?auto_392436 ?auto_392437 ?auto_392438 ?auto_392439 ?auto_392440 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392449 - BLOCK
      ?auto_392450 - BLOCK
      ?auto_392451 - BLOCK
      ?auto_392452 - BLOCK
      ?auto_392453 - BLOCK
      ?auto_392454 - BLOCK
      ?auto_392455 - BLOCK
    )
    :vars
    (
      ?auto_392456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392455 ?auto_392456 ) ( ON-TABLE ?auto_392449 ) ( ON ?auto_392450 ?auto_392449 ) ( not ( = ?auto_392449 ?auto_392450 ) ) ( not ( = ?auto_392449 ?auto_392451 ) ) ( not ( = ?auto_392449 ?auto_392452 ) ) ( not ( = ?auto_392449 ?auto_392453 ) ) ( not ( = ?auto_392449 ?auto_392454 ) ) ( not ( = ?auto_392449 ?auto_392455 ) ) ( not ( = ?auto_392449 ?auto_392456 ) ) ( not ( = ?auto_392450 ?auto_392451 ) ) ( not ( = ?auto_392450 ?auto_392452 ) ) ( not ( = ?auto_392450 ?auto_392453 ) ) ( not ( = ?auto_392450 ?auto_392454 ) ) ( not ( = ?auto_392450 ?auto_392455 ) ) ( not ( = ?auto_392450 ?auto_392456 ) ) ( not ( = ?auto_392451 ?auto_392452 ) ) ( not ( = ?auto_392451 ?auto_392453 ) ) ( not ( = ?auto_392451 ?auto_392454 ) ) ( not ( = ?auto_392451 ?auto_392455 ) ) ( not ( = ?auto_392451 ?auto_392456 ) ) ( not ( = ?auto_392452 ?auto_392453 ) ) ( not ( = ?auto_392452 ?auto_392454 ) ) ( not ( = ?auto_392452 ?auto_392455 ) ) ( not ( = ?auto_392452 ?auto_392456 ) ) ( not ( = ?auto_392453 ?auto_392454 ) ) ( not ( = ?auto_392453 ?auto_392455 ) ) ( not ( = ?auto_392453 ?auto_392456 ) ) ( not ( = ?auto_392454 ?auto_392455 ) ) ( not ( = ?auto_392454 ?auto_392456 ) ) ( not ( = ?auto_392455 ?auto_392456 ) ) ( ON ?auto_392454 ?auto_392455 ) ( ON ?auto_392453 ?auto_392454 ) ( ON ?auto_392452 ?auto_392453 ) ( CLEAR ?auto_392450 ) ( ON ?auto_392451 ?auto_392452 ) ( CLEAR ?auto_392451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392449 ?auto_392450 ?auto_392451 )
      ( MAKE-7PILE ?auto_392449 ?auto_392450 ?auto_392451 ?auto_392452 ?auto_392453 ?auto_392454 ?auto_392455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392464 - BLOCK
      ?auto_392465 - BLOCK
      ?auto_392466 - BLOCK
      ?auto_392467 - BLOCK
      ?auto_392468 - BLOCK
      ?auto_392469 - BLOCK
      ?auto_392470 - BLOCK
    )
    :vars
    (
      ?auto_392471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392470 ?auto_392471 ) ( ON-TABLE ?auto_392464 ) ( ON ?auto_392465 ?auto_392464 ) ( not ( = ?auto_392464 ?auto_392465 ) ) ( not ( = ?auto_392464 ?auto_392466 ) ) ( not ( = ?auto_392464 ?auto_392467 ) ) ( not ( = ?auto_392464 ?auto_392468 ) ) ( not ( = ?auto_392464 ?auto_392469 ) ) ( not ( = ?auto_392464 ?auto_392470 ) ) ( not ( = ?auto_392464 ?auto_392471 ) ) ( not ( = ?auto_392465 ?auto_392466 ) ) ( not ( = ?auto_392465 ?auto_392467 ) ) ( not ( = ?auto_392465 ?auto_392468 ) ) ( not ( = ?auto_392465 ?auto_392469 ) ) ( not ( = ?auto_392465 ?auto_392470 ) ) ( not ( = ?auto_392465 ?auto_392471 ) ) ( not ( = ?auto_392466 ?auto_392467 ) ) ( not ( = ?auto_392466 ?auto_392468 ) ) ( not ( = ?auto_392466 ?auto_392469 ) ) ( not ( = ?auto_392466 ?auto_392470 ) ) ( not ( = ?auto_392466 ?auto_392471 ) ) ( not ( = ?auto_392467 ?auto_392468 ) ) ( not ( = ?auto_392467 ?auto_392469 ) ) ( not ( = ?auto_392467 ?auto_392470 ) ) ( not ( = ?auto_392467 ?auto_392471 ) ) ( not ( = ?auto_392468 ?auto_392469 ) ) ( not ( = ?auto_392468 ?auto_392470 ) ) ( not ( = ?auto_392468 ?auto_392471 ) ) ( not ( = ?auto_392469 ?auto_392470 ) ) ( not ( = ?auto_392469 ?auto_392471 ) ) ( not ( = ?auto_392470 ?auto_392471 ) ) ( ON ?auto_392469 ?auto_392470 ) ( ON ?auto_392468 ?auto_392469 ) ( ON ?auto_392467 ?auto_392468 ) ( CLEAR ?auto_392465 ) ( ON ?auto_392466 ?auto_392467 ) ( CLEAR ?auto_392466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392464 ?auto_392465 ?auto_392466 )
      ( MAKE-7PILE ?auto_392464 ?auto_392465 ?auto_392466 ?auto_392467 ?auto_392468 ?auto_392469 ?auto_392470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392479 - BLOCK
      ?auto_392480 - BLOCK
      ?auto_392481 - BLOCK
      ?auto_392482 - BLOCK
      ?auto_392483 - BLOCK
      ?auto_392484 - BLOCK
      ?auto_392485 - BLOCK
    )
    :vars
    (
      ?auto_392486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392485 ?auto_392486 ) ( ON-TABLE ?auto_392479 ) ( not ( = ?auto_392479 ?auto_392480 ) ) ( not ( = ?auto_392479 ?auto_392481 ) ) ( not ( = ?auto_392479 ?auto_392482 ) ) ( not ( = ?auto_392479 ?auto_392483 ) ) ( not ( = ?auto_392479 ?auto_392484 ) ) ( not ( = ?auto_392479 ?auto_392485 ) ) ( not ( = ?auto_392479 ?auto_392486 ) ) ( not ( = ?auto_392480 ?auto_392481 ) ) ( not ( = ?auto_392480 ?auto_392482 ) ) ( not ( = ?auto_392480 ?auto_392483 ) ) ( not ( = ?auto_392480 ?auto_392484 ) ) ( not ( = ?auto_392480 ?auto_392485 ) ) ( not ( = ?auto_392480 ?auto_392486 ) ) ( not ( = ?auto_392481 ?auto_392482 ) ) ( not ( = ?auto_392481 ?auto_392483 ) ) ( not ( = ?auto_392481 ?auto_392484 ) ) ( not ( = ?auto_392481 ?auto_392485 ) ) ( not ( = ?auto_392481 ?auto_392486 ) ) ( not ( = ?auto_392482 ?auto_392483 ) ) ( not ( = ?auto_392482 ?auto_392484 ) ) ( not ( = ?auto_392482 ?auto_392485 ) ) ( not ( = ?auto_392482 ?auto_392486 ) ) ( not ( = ?auto_392483 ?auto_392484 ) ) ( not ( = ?auto_392483 ?auto_392485 ) ) ( not ( = ?auto_392483 ?auto_392486 ) ) ( not ( = ?auto_392484 ?auto_392485 ) ) ( not ( = ?auto_392484 ?auto_392486 ) ) ( not ( = ?auto_392485 ?auto_392486 ) ) ( ON ?auto_392484 ?auto_392485 ) ( ON ?auto_392483 ?auto_392484 ) ( ON ?auto_392482 ?auto_392483 ) ( ON ?auto_392481 ?auto_392482 ) ( CLEAR ?auto_392479 ) ( ON ?auto_392480 ?auto_392481 ) ( CLEAR ?auto_392480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392479 ?auto_392480 )
      ( MAKE-7PILE ?auto_392479 ?auto_392480 ?auto_392481 ?auto_392482 ?auto_392483 ?auto_392484 ?auto_392485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392494 - BLOCK
      ?auto_392495 - BLOCK
      ?auto_392496 - BLOCK
      ?auto_392497 - BLOCK
      ?auto_392498 - BLOCK
      ?auto_392499 - BLOCK
      ?auto_392500 - BLOCK
    )
    :vars
    (
      ?auto_392501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392500 ?auto_392501 ) ( ON-TABLE ?auto_392494 ) ( not ( = ?auto_392494 ?auto_392495 ) ) ( not ( = ?auto_392494 ?auto_392496 ) ) ( not ( = ?auto_392494 ?auto_392497 ) ) ( not ( = ?auto_392494 ?auto_392498 ) ) ( not ( = ?auto_392494 ?auto_392499 ) ) ( not ( = ?auto_392494 ?auto_392500 ) ) ( not ( = ?auto_392494 ?auto_392501 ) ) ( not ( = ?auto_392495 ?auto_392496 ) ) ( not ( = ?auto_392495 ?auto_392497 ) ) ( not ( = ?auto_392495 ?auto_392498 ) ) ( not ( = ?auto_392495 ?auto_392499 ) ) ( not ( = ?auto_392495 ?auto_392500 ) ) ( not ( = ?auto_392495 ?auto_392501 ) ) ( not ( = ?auto_392496 ?auto_392497 ) ) ( not ( = ?auto_392496 ?auto_392498 ) ) ( not ( = ?auto_392496 ?auto_392499 ) ) ( not ( = ?auto_392496 ?auto_392500 ) ) ( not ( = ?auto_392496 ?auto_392501 ) ) ( not ( = ?auto_392497 ?auto_392498 ) ) ( not ( = ?auto_392497 ?auto_392499 ) ) ( not ( = ?auto_392497 ?auto_392500 ) ) ( not ( = ?auto_392497 ?auto_392501 ) ) ( not ( = ?auto_392498 ?auto_392499 ) ) ( not ( = ?auto_392498 ?auto_392500 ) ) ( not ( = ?auto_392498 ?auto_392501 ) ) ( not ( = ?auto_392499 ?auto_392500 ) ) ( not ( = ?auto_392499 ?auto_392501 ) ) ( not ( = ?auto_392500 ?auto_392501 ) ) ( ON ?auto_392499 ?auto_392500 ) ( ON ?auto_392498 ?auto_392499 ) ( ON ?auto_392497 ?auto_392498 ) ( ON ?auto_392496 ?auto_392497 ) ( CLEAR ?auto_392494 ) ( ON ?auto_392495 ?auto_392496 ) ( CLEAR ?auto_392495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392494 ?auto_392495 )
      ( MAKE-7PILE ?auto_392494 ?auto_392495 ?auto_392496 ?auto_392497 ?auto_392498 ?auto_392499 ?auto_392500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392509 - BLOCK
      ?auto_392510 - BLOCK
      ?auto_392511 - BLOCK
      ?auto_392512 - BLOCK
      ?auto_392513 - BLOCK
      ?auto_392514 - BLOCK
      ?auto_392515 - BLOCK
    )
    :vars
    (
      ?auto_392516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392515 ?auto_392516 ) ( not ( = ?auto_392509 ?auto_392510 ) ) ( not ( = ?auto_392509 ?auto_392511 ) ) ( not ( = ?auto_392509 ?auto_392512 ) ) ( not ( = ?auto_392509 ?auto_392513 ) ) ( not ( = ?auto_392509 ?auto_392514 ) ) ( not ( = ?auto_392509 ?auto_392515 ) ) ( not ( = ?auto_392509 ?auto_392516 ) ) ( not ( = ?auto_392510 ?auto_392511 ) ) ( not ( = ?auto_392510 ?auto_392512 ) ) ( not ( = ?auto_392510 ?auto_392513 ) ) ( not ( = ?auto_392510 ?auto_392514 ) ) ( not ( = ?auto_392510 ?auto_392515 ) ) ( not ( = ?auto_392510 ?auto_392516 ) ) ( not ( = ?auto_392511 ?auto_392512 ) ) ( not ( = ?auto_392511 ?auto_392513 ) ) ( not ( = ?auto_392511 ?auto_392514 ) ) ( not ( = ?auto_392511 ?auto_392515 ) ) ( not ( = ?auto_392511 ?auto_392516 ) ) ( not ( = ?auto_392512 ?auto_392513 ) ) ( not ( = ?auto_392512 ?auto_392514 ) ) ( not ( = ?auto_392512 ?auto_392515 ) ) ( not ( = ?auto_392512 ?auto_392516 ) ) ( not ( = ?auto_392513 ?auto_392514 ) ) ( not ( = ?auto_392513 ?auto_392515 ) ) ( not ( = ?auto_392513 ?auto_392516 ) ) ( not ( = ?auto_392514 ?auto_392515 ) ) ( not ( = ?auto_392514 ?auto_392516 ) ) ( not ( = ?auto_392515 ?auto_392516 ) ) ( ON ?auto_392514 ?auto_392515 ) ( ON ?auto_392513 ?auto_392514 ) ( ON ?auto_392512 ?auto_392513 ) ( ON ?auto_392511 ?auto_392512 ) ( ON ?auto_392510 ?auto_392511 ) ( ON ?auto_392509 ?auto_392510 ) ( CLEAR ?auto_392509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392509 )
      ( MAKE-7PILE ?auto_392509 ?auto_392510 ?auto_392511 ?auto_392512 ?auto_392513 ?auto_392514 ?auto_392515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_392524 - BLOCK
      ?auto_392525 - BLOCK
      ?auto_392526 - BLOCK
      ?auto_392527 - BLOCK
      ?auto_392528 - BLOCK
      ?auto_392529 - BLOCK
      ?auto_392530 - BLOCK
    )
    :vars
    (
      ?auto_392531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392530 ?auto_392531 ) ( not ( = ?auto_392524 ?auto_392525 ) ) ( not ( = ?auto_392524 ?auto_392526 ) ) ( not ( = ?auto_392524 ?auto_392527 ) ) ( not ( = ?auto_392524 ?auto_392528 ) ) ( not ( = ?auto_392524 ?auto_392529 ) ) ( not ( = ?auto_392524 ?auto_392530 ) ) ( not ( = ?auto_392524 ?auto_392531 ) ) ( not ( = ?auto_392525 ?auto_392526 ) ) ( not ( = ?auto_392525 ?auto_392527 ) ) ( not ( = ?auto_392525 ?auto_392528 ) ) ( not ( = ?auto_392525 ?auto_392529 ) ) ( not ( = ?auto_392525 ?auto_392530 ) ) ( not ( = ?auto_392525 ?auto_392531 ) ) ( not ( = ?auto_392526 ?auto_392527 ) ) ( not ( = ?auto_392526 ?auto_392528 ) ) ( not ( = ?auto_392526 ?auto_392529 ) ) ( not ( = ?auto_392526 ?auto_392530 ) ) ( not ( = ?auto_392526 ?auto_392531 ) ) ( not ( = ?auto_392527 ?auto_392528 ) ) ( not ( = ?auto_392527 ?auto_392529 ) ) ( not ( = ?auto_392527 ?auto_392530 ) ) ( not ( = ?auto_392527 ?auto_392531 ) ) ( not ( = ?auto_392528 ?auto_392529 ) ) ( not ( = ?auto_392528 ?auto_392530 ) ) ( not ( = ?auto_392528 ?auto_392531 ) ) ( not ( = ?auto_392529 ?auto_392530 ) ) ( not ( = ?auto_392529 ?auto_392531 ) ) ( not ( = ?auto_392530 ?auto_392531 ) ) ( ON ?auto_392529 ?auto_392530 ) ( ON ?auto_392528 ?auto_392529 ) ( ON ?auto_392527 ?auto_392528 ) ( ON ?auto_392526 ?auto_392527 ) ( ON ?auto_392525 ?auto_392526 ) ( ON ?auto_392524 ?auto_392525 ) ( CLEAR ?auto_392524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392524 )
      ( MAKE-7PILE ?auto_392524 ?auto_392525 ?auto_392526 ?auto_392527 ?auto_392528 ?auto_392529 ?auto_392530 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392540 - BLOCK
      ?auto_392541 - BLOCK
      ?auto_392542 - BLOCK
      ?auto_392543 - BLOCK
      ?auto_392544 - BLOCK
      ?auto_392545 - BLOCK
      ?auto_392546 - BLOCK
      ?auto_392547 - BLOCK
    )
    :vars
    (
      ?auto_392548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392546 ) ( ON ?auto_392547 ?auto_392548 ) ( CLEAR ?auto_392547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392540 ) ( ON ?auto_392541 ?auto_392540 ) ( ON ?auto_392542 ?auto_392541 ) ( ON ?auto_392543 ?auto_392542 ) ( ON ?auto_392544 ?auto_392543 ) ( ON ?auto_392545 ?auto_392544 ) ( ON ?auto_392546 ?auto_392545 ) ( not ( = ?auto_392540 ?auto_392541 ) ) ( not ( = ?auto_392540 ?auto_392542 ) ) ( not ( = ?auto_392540 ?auto_392543 ) ) ( not ( = ?auto_392540 ?auto_392544 ) ) ( not ( = ?auto_392540 ?auto_392545 ) ) ( not ( = ?auto_392540 ?auto_392546 ) ) ( not ( = ?auto_392540 ?auto_392547 ) ) ( not ( = ?auto_392540 ?auto_392548 ) ) ( not ( = ?auto_392541 ?auto_392542 ) ) ( not ( = ?auto_392541 ?auto_392543 ) ) ( not ( = ?auto_392541 ?auto_392544 ) ) ( not ( = ?auto_392541 ?auto_392545 ) ) ( not ( = ?auto_392541 ?auto_392546 ) ) ( not ( = ?auto_392541 ?auto_392547 ) ) ( not ( = ?auto_392541 ?auto_392548 ) ) ( not ( = ?auto_392542 ?auto_392543 ) ) ( not ( = ?auto_392542 ?auto_392544 ) ) ( not ( = ?auto_392542 ?auto_392545 ) ) ( not ( = ?auto_392542 ?auto_392546 ) ) ( not ( = ?auto_392542 ?auto_392547 ) ) ( not ( = ?auto_392542 ?auto_392548 ) ) ( not ( = ?auto_392543 ?auto_392544 ) ) ( not ( = ?auto_392543 ?auto_392545 ) ) ( not ( = ?auto_392543 ?auto_392546 ) ) ( not ( = ?auto_392543 ?auto_392547 ) ) ( not ( = ?auto_392543 ?auto_392548 ) ) ( not ( = ?auto_392544 ?auto_392545 ) ) ( not ( = ?auto_392544 ?auto_392546 ) ) ( not ( = ?auto_392544 ?auto_392547 ) ) ( not ( = ?auto_392544 ?auto_392548 ) ) ( not ( = ?auto_392545 ?auto_392546 ) ) ( not ( = ?auto_392545 ?auto_392547 ) ) ( not ( = ?auto_392545 ?auto_392548 ) ) ( not ( = ?auto_392546 ?auto_392547 ) ) ( not ( = ?auto_392546 ?auto_392548 ) ) ( not ( = ?auto_392547 ?auto_392548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392547 ?auto_392548 )
      ( !STACK ?auto_392547 ?auto_392546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392557 - BLOCK
      ?auto_392558 - BLOCK
      ?auto_392559 - BLOCK
      ?auto_392560 - BLOCK
      ?auto_392561 - BLOCK
      ?auto_392562 - BLOCK
      ?auto_392563 - BLOCK
      ?auto_392564 - BLOCK
    )
    :vars
    (
      ?auto_392565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392563 ) ( ON ?auto_392564 ?auto_392565 ) ( CLEAR ?auto_392564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392557 ) ( ON ?auto_392558 ?auto_392557 ) ( ON ?auto_392559 ?auto_392558 ) ( ON ?auto_392560 ?auto_392559 ) ( ON ?auto_392561 ?auto_392560 ) ( ON ?auto_392562 ?auto_392561 ) ( ON ?auto_392563 ?auto_392562 ) ( not ( = ?auto_392557 ?auto_392558 ) ) ( not ( = ?auto_392557 ?auto_392559 ) ) ( not ( = ?auto_392557 ?auto_392560 ) ) ( not ( = ?auto_392557 ?auto_392561 ) ) ( not ( = ?auto_392557 ?auto_392562 ) ) ( not ( = ?auto_392557 ?auto_392563 ) ) ( not ( = ?auto_392557 ?auto_392564 ) ) ( not ( = ?auto_392557 ?auto_392565 ) ) ( not ( = ?auto_392558 ?auto_392559 ) ) ( not ( = ?auto_392558 ?auto_392560 ) ) ( not ( = ?auto_392558 ?auto_392561 ) ) ( not ( = ?auto_392558 ?auto_392562 ) ) ( not ( = ?auto_392558 ?auto_392563 ) ) ( not ( = ?auto_392558 ?auto_392564 ) ) ( not ( = ?auto_392558 ?auto_392565 ) ) ( not ( = ?auto_392559 ?auto_392560 ) ) ( not ( = ?auto_392559 ?auto_392561 ) ) ( not ( = ?auto_392559 ?auto_392562 ) ) ( not ( = ?auto_392559 ?auto_392563 ) ) ( not ( = ?auto_392559 ?auto_392564 ) ) ( not ( = ?auto_392559 ?auto_392565 ) ) ( not ( = ?auto_392560 ?auto_392561 ) ) ( not ( = ?auto_392560 ?auto_392562 ) ) ( not ( = ?auto_392560 ?auto_392563 ) ) ( not ( = ?auto_392560 ?auto_392564 ) ) ( not ( = ?auto_392560 ?auto_392565 ) ) ( not ( = ?auto_392561 ?auto_392562 ) ) ( not ( = ?auto_392561 ?auto_392563 ) ) ( not ( = ?auto_392561 ?auto_392564 ) ) ( not ( = ?auto_392561 ?auto_392565 ) ) ( not ( = ?auto_392562 ?auto_392563 ) ) ( not ( = ?auto_392562 ?auto_392564 ) ) ( not ( = ?auto_392562 ?auto_392565 ) ) ( not ( = ?auto_392563 ?auto_392564 ) ) ( not ( = ?auto_392563 ?auto_392565 ) ) ( not ( = ?auto_392564 ?auto_392565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392564 ?auto_392565 )
      ( !STACK ?auto_392564 ?auto_392563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392574 - BLOCK
      ?auto_392575 - BLOCK
      ?auto_392576 - BLOCK
      ?auto_392577 - BLOCK
      ?auto_392578 - BLOCK
      ?auto_392579 - BLOCK
      ?auto_392580 - BLOCK
      ?auto_392581 - BLOCK
    )
    :vars
    (
      ?auto_392582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392581 ?auto_392582 ) ( ON-TABLE ?auto_392574 ) ( ON ?auto_392575 ?auto_392574 ) ( ON ?auto_392576 ?auto_392575 ) ( ON ?auto_392577 ?auto_392576 ) ( ON ?auto_392578 ?auto_392577 ) ( ON ?auto_392579 ?auto_392578 ) ( not ( = ?auto_392574 ?auto_392575 ) ) ( not ( = ?auto_392574 ?auto_392576 ) ) ( not ( = ?auto_392574 ?auto_392577 ) ) ( not ( = ?auto_392574 ?auto_392578 ) ) ( not ( = ?auto_392574 ?auto_392579 ) ) ( not ( = ?auto_392574 ?auto_392580 ) ) ( not ( = ?auto_392574 ?auto_392581 ) ) ( not ( = ?auto_392574 ?auto_392582 ) ) ( not ( = ?auto_392575 ?auto_392576 ) ) ( not ( = ?auto_392575 ?auto_392577 ) ) ( not ( = ?auto_392575 ?auto_392578 ) ) ( not ( = ?auto_392575 ?auto_392579 ) ) ( not ( = ?auto_392575 ?auto_392580 ) ) ( not ( = ?auto_392575 ?auto_392581 ) ) ( not ( = ?auto_392575 ?auto_392582 ) ) ( not ( = ?auto_392576 ?auto_392577 ) ) ( not ( = ?auto_392576 ?auto_392578 ) ) ( not ( = ?auto_392576 ?auto_392579 ) ) ( not ( = ?auto_392576 ?auto_392580 ) ) ( not ( = ?auto_392576 ?auto_392581 ) ) ( not ( = ?auto_392576 ?auto_392582 ) ) ( not ( = ?auto_392577 ?auto_392578 ) ) ( not ( = ?auto_392577 ?auto_392579 ) ) ( not ( = ?auto_392577 ?auto_392580 ) ) ( not ( = ?auto_392577 ?auto_392581 ) ) ( not ( = ?auto_392577 ?auto_392582 ) ) ( not ( = ?auto_392578 ?auto_392579 ) ) ( not ( = ?auto_392578 ?auto_392580 ) ) ( not ( = ?auto_392578 ?auto_392581 ) ) ( not ( = ?auto_392578 ?auto_392582 ) ) ( not ( = ?auto_392579 ?auto_392580 ) ) ( not ( = ?auto_392579 ?auto_392581 ) ) ( not ( = ?auto_392579 ?auto_392582 ) ) ( not ( = ?auto_392580 ?auto_392581 ) ) ( not ( = ?auto_392580 ?auto_392582 ) ) ( not ( = ?auto_392581 ?auto_392582 ) ) ( CLEAR ?auto_392579 ) ( ON ?auto_392580 ?auto_392581 ) ( CLEAR ?auto_392580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_392574 ?auto_392575 ?auto_392576 ?auto_392577 ?auto_392578 ?auto_392579 ?auto_392580 )
      ( MAKE-8PILE ?auto_392574 ?auto_392575 ?auto_392576 ?auto_392577 ?auto_392578 ?auto_392579 ?auto_392580 ?auto_392581 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392591 - BLOCK
      ?auto_392592 - BLOCK
      ?auto_392593 - BLOCK
      ?auto_392594 - BLOCK
      ?auto_392595 - BLOCK
      ?auto_392596 - BLOCK
      ?auto_392597 - BLOCK
      ?auto_392598 - BLOCK
    )
    :vars
    (
      ?auto_392599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392598 ?auto_392599 ) ( ON-TABLE ?auto_392591 ) ( ON ?auto_392592 ?auto_392591 ) ( ON ?auto_392593 ?auto_392592 ) ( ON ?auto_392594 ?auto_392593 ) ( ON ?auto_392595 ?auto_392594 ) ( ON ?auto_392596 ?auto_392595 ) ( not ( = ?auto_392591 ?auto_392592 ) ) ( not ( = ?auto_392591 ?auto_392593 ) ) ( not ( = ?auto_392591 ?auto_392594 ) ) ( not ( = ?auto_392591 ?auto_392595 ) ) ( not ( = ?auto_392591 ?auto_392596 ) ) ( not ( = ?auto_392591 ?auto_392597 ) ) ( not ( = ?auto_392591 ?auto_392598 ) ) ( not ( = ?auto_392591 ?auto_392599 ) ) ( not ( = ?auto_392592 ?auto_392593 ) ) ( not ( = ?auto_392592 ?auto_392594 ) ) ( not ( = ?auto_392592 ?auto_392595 ) ) ( not ( = ?auto_392592 ?auto_392596 ) ) ( not ( = ?auto_392592 ?auto_392597 ) ) ( not ( = ?auto_392592 ?auto_392598 ) ) ( not ( = ?auto_392592 ?auto_392599 ) ) ( not ( = ?auto_392593 ?auto_392594 ) ) ( not ( = ?auto_392593 ?auto_392595 ) ) ( not ( = ?auto_392593 ?auto_392596 ) ) ( not ( = ?auto_392593 ?auto_392597 ) ) ( not ( = ?auto_392593 ?auto_392598 ) ) ( not ( = ?auto_392593 ?auto_392599 ) ) ( not ( = ?auto_392594 ?auto_392595 ) ) ( not ( = ?auto_392594 ?auto_392596 ) ) ( not ( = ?auto_392594 ?auto_392597 ) ) ( not ( = ?auto_392594 ?auto_392598 ) ) ( not ( = ?auto_392594 ?auto_392599 ) ) ( not ( = ?auto_392595 ?auto_392596 ) ) ( not ( = ?auto_392595 ?auto_392597 ) ) ( not ( = ?auto_392595 ?auto_392598 ) ) ( not ( = ?auto_392595 ?auto_392599 ) ) ( not ( = ?auto_392596 ?auto_392597 ) ) ( not ( = ?auto_392596 ?auto_392598 ) ) ( not ( = ?auto_392596 ?auto_392599 ) ) ( not ( = ?auto_392597 ?auto_392598 ) ) ( not ( = ?auto_392597 ?auto_392599 ) ) ( not ( = ?auto_392598 ?auto_392599 ) ) ( CLEAR ?auto_392596 ) ( ON ?auto_392597 ?auto_392598 ) ( CLEAR ?auto_392597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_392591 ?auto_392592 ?auto_392593 ?auto_392594 ?auto_392595 ?auto_392596 ?auto_392597 )
      ( MAKE-8PILE ?auto_392591 ?auto_392592 ?auto_392593 ?auto_392594 ?auto_392595 ?auto_392596 ?auto_392597 ?auto_392598 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392608 - BLOCK
      ?auto_392609 - BLOCK
      ?auto_392610 - BLOCK
      ?auto_392611 - BLOCK
      ?auto_392612 - BLOCK
      ?auto_392613 - BLOCK
      ?auto_392614 - BLOCK
      ?auto_392615 - BLOCK
    )
    :vars
    (
      ?auto_392616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392615 ?auto_392616 ) ( ON-TABLE ?auto_392608 ) ( ON ?auto_392609 ?auto_392608 ) ( ON ?auto_392610 ?auto_392609 ) ( ON ?auto_392611 ?auto_392610 ) ( ON ?auto_392612 ?auto_392611 ) ( not ( = ?auto_392608 ?auto_392609 ) ) ( not ( = ?auto_392608 ?auto_392610 ) ) ( not ( = ?auto_392608 ?auto_392611 ) ) ( not ( = ?auto_392608 ?auto_392612 ) ) ( not ( = ?auto_392608 ?auto_392613 ) ) ( not ( = ?auto_392608 ?auto_392614 ) ) ( not ( = ?auto_392608 ?auto_392615 ) ) ( not ( = ?auto_392608 ?auto_392616 ) ) ( not ( = ?auto_392609 ?auto_392610 ) ) ( not ( = ?auto_392609 ?auto_392611 ) ) ( not ( = ?auto_392609 ?auto_392612 ) ) ( not ( = ?auto_392609 ?auto_392613 ) ) ( not ( = ?auto_392609 ?auto_392614 ) ) ( not ( = ?auto_392609 ?auto_392615 ) ) ( not ( = ?auto_392609 ?auto_392616 ) ) ( not ( = ?auto_392610 ?auto_392611 ) ) ( not ( = ?auto_392610 ?auto_392612 ) ) ( not ( = ?auto_392610 ?auto_392613 ) ) ( not ( = ?auto_392610 ?auto_392614 ) ) ( not ( = ?auto_392610 ?auto_392615 ) ) ( not ( = ?auto_392610 ?auto_392616 ) ) ( not ( = ?auto_392611 ?auto_392612 ) ) ( not ( = ?auto_392611 ?auto_392613 ) ) ( not ( = ?auto_392611 ?auto_392614 ) ) ( not ( = ?auto_392611 ?auto_392615 ) ) ( not ( = ?auto_392611 ?auto_392616 ) ) ( not ( = ?auto_392612 ?auto_392613 ) ) ( not ( = ?auto_392612 ?auto_392614 ) ) ( not ( = ?auto_392612 ?auto_392615 ) ) ( not ( = ?auto_392612 ?auto_392616 ) ) ( not ( = ?auto_392613 ?auto_392614 ) ) ( not ( = ?auto_392613 ?auto_392615 ) ) ( not ( = ?auto_392613 ?auto_392616 ) ) ( not ( = ?auto_392614 ?auto_392615 ) ) ( not ( = ?auto_392614 ?auto_392616 ) ) ( not ( = ?auto_392615 ?auto_392616 ) ) ( ON ?auto_392614 ?auto_392615 ) ( CLEAR ?auto_392612 ) ( ON ?auto_392613 ?auto_392614 ) ( CLEAR ?auto_392613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392608 ?auto_392609 ?auto_392610 ?auto_392611 ?auto_392612 ?auto_392613 )
      ( MAKE-8PILE ?auto_392608 ?auto_392609 ?auto_392610 ?auto_392611 ?auto_392612 ?auto_392613 ?auto_392614 ?auto_392615 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392625 - BLOCK
      ?auto_392626 - BLOCK
      ?auto_392627 - BLOCK
      ?auto_392628 - BLOCK
      ?auto_392629 - BLOCK
      ?auto_392630 - BLOCK
      ?auto_392631 - BLOCK
      ?auto_392632 - BLOCK
    )
    :vars
    (
      ?auto_392633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392632 ?auto_392633 ) ( ON-TABLE ?auto_392625 ) ( ON ?auto_392626 ?auto_392625 ) ( ON ?auto_392627 ?auto_392626 ) ( ON ?auto_392628 ?auto_392627 ) ( ON ?auto_392629 ?auto_392628 ) ( not ( = ?auto_392625 ?auto_392626 ) ) ( not ( = ?auto_392625 ?auto_392627 ) ) ( not ( = ?auto_392625 ?auto_392628 ) ) ( not ( = ?auto_392625 ?auto_392629 ) ) ( not ( = ?auto_392625 ?auto_392630 ) ) ( not ( = ?auto_392625 ?auto_392631 ) ) ( not ( = ?auto_392625 ?auto_392632 ) ) ( not ( = ?auto_392625 ?auto_392633 ) ) ( not ( = ?auto_392626 ?auto_392627 ) ) ( not ( = ?auto_392626 ?auto_392628 ) ) ( not ( = ?auto_392626 ?auto_392629 ) ) ( not ( = ?auto_392626 ?auto_392630 ) ) ( not ( = ?auto_392626 ?auto_392631 ) ) ( not ( = ?auto_392626 ?auto_392632 ) ) ( not ( = ?auto_392626 ?auto_392633 ) ) ( not ( = ?auto_392627 ?auto_392628 ) ) ( not ( = ?auto_392627 ?auto_392629 ) ) ( not ( = ?auto_392627 ?auto_392630 ) ) ( not ( = ?auto_392627 ?auto_392631 ) ) ( not ( = ?auto_392627 ?auto_392632 ) ) ( not ( = ?auto_392627 ?auto_392633 ) ) ( not ( = ?auto_392628 ?auto_392629 ) ) ( not ( = ?auto_392628 ?auto_392630 ) ) ( not ( = ?auto_392628 ?auto_392631 ) ) ( not ( = ?auto_392628 ?auto_392632 ) ) ( not ( = ?auto_392628 ?auto_392633 ) ) ( not ( = ?auto_392629 ?auto_392630 ) ) ( not ( = ?auto_392629 ?auto_392631 ) ) ( not ( = ?auto_392629 ?auto_392632 ) ) ( not ( = ?auto_392629 ?auto_392633 ) ) ( not ( = ?auto_392630 ?auto_392631 ) ) ( not ( = ?auto_392630 ?auto_392632 ) ) ( not ( = ?auto_392630 ?auto_392633 ) ) ( not ( = ?auto_392631 ?auto_392632 ) ) ( not ( = ?auto_392631 ?auto_392633 ) ) ( not ( = ?auto_392632 ?auto_392633 ) ) ( ON ?auto_392631 ?auto_392632 ) ( CLEAR ?auto_392629 ) ( ON ?auto_392630 ?auto_392631 ) ( CLEAR ?auto_392630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392625 ?auto_392626 ?auto_392627 ?auto_392628 ?auto_392629 ?auto_392630 )
      ( MAKE-8PILE ?auto_392625 ?auto_392626 ?auto_392627 ?auto_392628 ?auto_392629 ?auto_392630 ?auto_392631 ?auto_392632 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392642 - BLOCK
      ?auto_392643 - BLOCK
      ?auto_392644 - BLOCK
      ?auto_392645 - BLOCK
      ?auto_392646 - BLOCK
      ?auto_392647 - BLOCK
      ?auto_392648 - BLOCK
      ?auto_392649 - BLOCK
    )
    :vars
    (
      ?auto_392650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392649 ?auto_392650 ) ( ON-TABLE ?auto_392642 ) ( ON ?auto_392643 ?auto_392642 ) ( ON ?auto_392644 ?auto_392643 ) ( ON ?auto_392645 ?auto_392644 ) ( not ( = ?auto_392642 ?auto_392643 ) ) ( not ( = ?auto_392642 ?auto_392644 ) ) ( not ( = ?auto_392642 ?auto_392645 ) ) ( not ( = ?auto_392642 ?auto_392646 ) ) ( not ( = ?auto_392642 ?auto_392647 ) ) ( not ( = ?auto_392642 ?auto_392648 ) ) ( not ( = ?auto_392642 ?auto_392649 ) ) ( not ( = ?auto_392642 ?auto_392650 ) ) ( not ( = ?auto_392643 ?auto_392644 ) ) ( not ( = ?auto_392643 ?auto_392645 ) ) ( not ( = ?auto_392643 ?auto_392646 ) ) ( not ( = ?auto_392643 ?auto_392647 ) ) ( not ( = ?auto_392643 ?auto_392648 ) ) ( not ( = ?auto_392643 ?auto_392649 ) ) ( not ( = ?auto_392643 ?auto_392650 ) ) ( not ( = ?auto_392644 ?auto_392645 ) ) ( not ( = ?auto_392644 ?auto_392646 ) ) ( not ( = ?auto_392644 ?auto_392647 ) ) ( not ( = ?auto_392644 ?auto_392648 ) ) ( not ( = ?auto_392644 ?auto_392649 ) ) ( not ( = ?auto_392644 ?auto_392650 ) ) ( not ( = ?auto_392645 ?auto_392646 ) ) ( not ( = ?auto_392645 ?auto_392647 ) ) ( not ( = ?auto_392645 ?auto_392648 ) ) ( not ( = ?auto_392645 ?auto_392649 ) ) ( not ( = ?auto_392645 ?auto_392650 ) ) ( not ( = ?auto_392646 ?auto_392647 ) ) ( not ( = ?auto_392646 ?auto_392648 ) ) ( not ( = ?auto_392646 ?auto_392649 ) ) ( not ( = ?auto_392646 ?auto_392650 ) ) ( not ( = ?auto_392647 ?auto_392648 ) ) ( not ( = ?auto_392647 ?auto_392649 ) ) ( not ( = ?auto_392647 ?auto_392650 ) ) ( not ( = ?auto_392648 ?auto_392649 ) ) ( not ( = ?auto_392648 ?auto_392650 ) ) ( not ( = ?auto_392649 ?auto_392650 ) ) ( ON ?auto_392648 ?auto_392649 ) ( ON ?auto_392647 ?auto_392648 ) ( CLEAR ?auto_392645 ) ( ON ?auto_392646 ?auto_392647 ) ( CLEAR ?auto_392646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392642 ?auto_392643 ?auto_392644 ?auto_392645 ?auto_392646 )
      ( MAKE-8PILE ?auto_392642 ?auto_392643 ?auto_392644 ?auto_392645 ?auto_392646 ?auto_392647 ?auto_392648 ?auto_392649 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392659 - BLOCK
      ?auto_392660 - BLOCK
      ?auto_392661 - BLOCK
      ?auto_392662 - BLOCK
      ?auto_392663 - BLOCK
      ?auto_392664 - BLOCK
      ?auto_392665 - BLOCK
      ?auto_392666 - BLOCK
    )
    :vars
    (
      ?auto_392667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392666 ?auto_392667 ) ( ON-TABLE ?auto_392659 ) ( ON ?auto_392660 ?auto_392659 ) ( ON ?auto_392661 ?auto_392660 ) ( ON ?auto_392662 ?auto_392661 ) ( not ( = ?auto_392659 ?auto_392660 ) ) ( not ( = ?auto_392659 ?auto_392661 ) ) ( not ( = ?auto_392659 ?auto_392662 ) ) ( not ( = ?auto_392659 ?auto_392663 ) ) ( not ( = ?auto_392659 ?auto_392664 ) ) ( not ( = ?auto_392659 ?auto_392665 ) ) ( not ( = ?auto_392659 ?auto_392666 ) ) ( not ( = ?auto_392659 ?auto_392667 ) ) ( not ( = ?auto_392660 ?auto_392661 ) ) ( not ( = ?auto_392660 ?auto_392662 ) ) ( not ( = ?auto_392660 ?auto_392663 ) ) ( not ( = ?auto_392660 ?auto_392664 ) ) ( not ( = ?auto_392660 ?auto_392665 ) ) ( not ( = ?auto_392660 ?auto_392666 ) ) ( not ( = ?auto_392660 ?auto_392667 ) ) ( not ( = ?auto_392661 ?auto_392662 ) ) ( not ( = ?auto_392661 ?auto_392663 ) ) ( not ( = ?auto_392661 ?auto_392664 ) ) ( not ( = ?auto_392661 ?auto_392665 ) ) ( not ( = ?auto_392661 ?auto_392666 ) ) ( not ( = ?auto_392661 ?auto_392667 ) ) ( not ( = ?auto_392662 ?auto_392663 ) ) ( not ( = ?auto_392662 ?auto_392664 ) ) ( not ( = ?auto_392662 ?auto_392665 ) ) ( not ( = ?auto_392662 ?auto_392666 ) ) ( not ( = ?auto_392662 ?auto_392667 ) ) ( not ( = ?auto_392663 ?auto_392664 ) ) ( not ( = ?auto_392663 ?auto_392665 ) ) ( not ( = ?auto_392663 ?auto_392666 ) ) ( not ( = ?auto_392663 ?auto_392667 ) ) ( not ( = ?auto_392664 ?auto_392665 ) ) ( not ( = ?auto_392664 ?auto_392666 ) ) ( not ( = ?auto_392664 ?auto_392667 ) ) ( not ( = ?auto_392665 ?auto_392666 ) ) ( not ( = ?auto_392665 ?auto_392667 ) ) ( not ( = ?auto_392666 ?auto_392667 ) ) ( ON ?auto_392665 ?auto_392666 ) ( ON ?auto_392664 ?auto_392665 ) ( CLEAR ?auto_392662 ) ( ON ?auto_392663 ?auto_392664 ) ( CLEAR ?auto_392663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392659 ?auto_392660 ?auto_392661 ?auto_392662 ?auto_392663 )
      ( MAKE-8PILE ?auto_392659 ?auto_392660 ?auto_392661 ?auto_392662 ?auto_392663 ?auto_392664 ?auto_392665 ?auto_392666 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392676 - BLOCK
      ?auto_392677 - BLOCK
      ?auto_392678 - BLOCK
      ?auto_392679 - BLOCK
      ?auto_392680 - BLOCK
      ?auto_392681 - BLOCK
      ?auto_392682 - BLOCK
      ?auto_392683 - BLOCK
    )
    :vars
    (
      ?auto_392684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392683 ?auto_392684 ) ( ON-TABLE ?auto_392676 ) ( ON ?auto_392677 ?auto_392676 ) ( ON ?auto_392678 ?auto_392677 ) ( not ( = ?auto_392676 ?auto_392677 ) ) ( not ( = ?auto_392676 ?auto_392678 ) ) ( not ( = ?auto_392676 ?auto_392679 ) ) ( not ( = ?auto_392676 ?auto_392680 ) ) ( not ( = ?auto_392676 ?auto_392681 ) ) ( not ( = ?auto_392676 ?auto_392682 ) ) ( not ( = ?auto_392676 ?auto_392683 ) ) ( not ( = ?auto_392676 ?auto_392684 ) ) ( not ( = ?auto_392677 ?auto_392678 ) ) ( not ( = ?auto_392677 ?auto_392679 ) ) ( not ( = ?auto_392677 ?auto_392680 ) ) ( not ( = ?auto_392677 ?auto_392681 ) ) ( not ( = ?auto_392677 ?auto_392682 ) ) ( not ( = ?auto_392677 ?auto_392683 ) ) ( not ( = ?auto_392677 ?auto_392684 ) ) ( not ( = ?auto_392678 ?auto_392679 ) ) ( not ( = ?auto_392678 ?auto_392680 ) ) ( not ( = ?auto_392678 ?auto_392681 ) ) ( not ( = ?auto_392678 ?auto_392682 ) ) ( not ( = ?auto_392678 ?auto_392683 ) ) ( not ( = ?auto_392678 ?auto_392684 ) ) ( not ( = ?auto_392679 ?auto_392680 ) ) ( not ( = ?auto_392679 ?auto_392681 ) ) ( not ( = ?auto_392679 ?auto_392682 ) ) ( not ( = ?auto_392679 ?auto_392683 ) ) ( not ( = ?auto_392679 ?auto_392684 ) ) ( not ( = ?auto_392680 ?auto_392681 ) ) ( not ( = ?auto_392680 ?auto_392682 ) ) ( not ( = ?auto_392680 ?auto_392683 ) ) ( not ( = ?auto_392680 ?auto_392684 ) ) ( not ( = ?auto_392681 ?auto_392682 ) ) ( not ( = ?auto_392681 ?auto_392683 ) ) ( not ( = ?auto_392681 ?auto_392684 ) ) ( not ( = ?auto_392682 ?auto_392683 ) ) ( not ( = ?auto_392682 ?auto_392684 ) ) ( not ( = ?auto_392683 ?auto_392684 ) ) ( ON ?auto_392682 ?auto_392683 ) ( ON ?auto_392681 ?auto_392682 ) ( ON ?auto_392680 ?auto_392681 ) ( CLEAR ?auto_392678 ) ( ON ?auto_392679 ?auto_392680 ) ( CLEAR ?auto_392679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392676 ?auto_392677 ?auto_392678 ?auto_392679 )
      ( MAKE-8PILE ?auto_392676 ?auto_392677 ?auto_392678 ?auto_392679 ?auto_392680 ?auto_392681 ?auto_392682 ?auto_392683 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392693 - BLOCK
      ?auto_392694 - BLOCK
      ?auto_392695 - BLOCK
      ?auto_392696 - BLOCK
      ?auto_392697 - BLOCK
      ?auto_392698 - BLOCK
      ?auto_392699 - BLOCK
      ?auto_392700 - BLOCK
    )
    :vars
    (
      ?auto_392701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392700 ?auto_392701 ) ( ON-TABLE ?auto_392693 ) ( ON ?auto_392694 ?auto_392693 ) ( ON ?auto_392695 ?auto_392694 ) ( not ( = ?auto_392693 ?auto_392694 ) ) ( not ( = ?auto_392693 ?auto_392695 ) ) ( not ( = ?auto_392693 ?auto_392696 ) ) ( not ( = ?auto_392693 ?auto_392697 ) ) ( not ( = ?auto_392693 ?auto_392698 ) ) ( not ( = ?auto_392693 ?auto_392699 ) ) ( not ( = ?auto_392693 ?auto_392700 ) ) ( not ( = ?auto_392693 ?auto_392701 ) ) ( not ( = ?auto_392694 ?auto_392695 ) ) ( not ( = ?auto_392694 ?auto_392696 ) ) ( not ( = ?auto_392694 ?auto_392697 ) ) ( not ( = ?auto_392694 ?auto_392698 ) ) ( not ( = ?auto_392694 ?auto_392699 ) ) ( not ( = ?auto_392694 ?auto_392700 ) ) ( not ( = ?auto_392694 ?auto_392701 ) ) ( not ( = ?auto_392695 ?auto_392696 ) ) ( not ( = ?auto_392695 ?auto_392697 ) ) ( not ( = ?auto_392695 ?auto_392698 ) ) ( not ( = ?auto_392695 ?auto_392699 ) ) ( not ( = ?auto_392695 ?auto_392700 ) ) ( not ( = ?auto_392695 ?auto_392701 ) ) ( not ( = ?auto_392696 ?auto_392697 ) ) ( not ( = ?auto_392696 ?auto_392698 ) ) ( not ( = ?auto_392696 ?auto_392699 ) ) ( not ( = ?auto_392696 ?auto_392700 ) ) ( not ( = ?auto_392696 ?auto_392701 ) ) ( not ( = ?auto_392697 ?auto_392698 ) ) ( not ( = ?auto_392697 ?auto_392699 ) ) ( not ( = ?auto_392697 ?auto_392700 ) ) ( not ( = ?auto_392697 ?auto_392701 ) ) ( not ( = ?auto_392698 ?auto_392699 ) ) ( not ( = ?auto_392698 ?auto_392700 ) ) ( not ( = ?auto_392698 ?auto_392701 ) ) ( not ( = ?auto_392699 ?auto_392700 ) ) ( not ( = ?auto_392699 ?auto_392701 ) ) ( not ( = ?auto_392700 ?auto_392701 ) ) ( ON ?auto_392699 ?auto_392700 ) ( ON ?auto_392698 ?auto_392699 ) ( ON ?auto_392697 ?auto_392698 ) ( CLEAR ?auto_392695 ) ( ON ?auto_392696 ?auto_392697 ) ( CLEAR ?auto_392696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_392693 ?auto_392694 ?auto_392695 ?auto_392696 )
      ( MAKE-8PILE ?auto_392693 ?auto_392694 ?auto_392695 ?auto_392696 ?auto_392697 ?auto_392698 ?auto_392699 ?auto_392700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392710 - BLOCK
      ?auto_392711 - BLOCK
      ?auto_392712 - BLOCK
      ?auto_392713 - BLOCK
      ?auto_392714 - BLOCK
      ?auto_392715 - BLOCK
      ?auto_392716 - BLOCK
      ?auto_392717 - BLOCK
    )
    :vars
    (
      ?auto_392718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392717 ?auto_392718 ) ( ON-TABLE ?auto_392710 ) ( ON ?auto_392711 ?auto_392710 ) ( not ( = ?auto_392710 ?auto_392711 ) ) ( not ( = ?auto_392710 ?auto_392712 ) ) ( not ( = ?auto_392710 ?auto_392713 ) ) ( not ( = ?auto_392710 ?auto_392714 ) ) ( not ( = ?auto_392710 ?auto_392715 ) ) ( not ( = ?auto_392710 ?auto_392716 ) ) ( not ( = ?auto_392710 ?auto_392717 ) ) ( not ( = ?auto_392710 ?auto_392718 ) ) ( not ( = ?auto_392711 ?auto_392712 ) ) ( not ( = ?auto_392711 ?auto_392713 ) ) ( not ( = ?auto_392711 ?auto_392714 ) ) ( not ( = ?auto_392711 ?auto_392715 ) ) ( not ( = ?auto_392711 ?auto_392716 ) ) ( not ( = ?auto_392711 ?auto_392717 ) ) ( not ( = ?auto_392711 ?auto_392718 ) ) ( not ( = ?auto_392712 ?auto_392713 ) ) ( not ( = ?auto_392712 ?auto_392714 ) ) ( not ( = ?auto_392712 ?auto_392715 ) ) ( not ( = ?auto_392712 ?auto_392716 ) ) ( not ( = ?auto_392712 ?auto_392717 ) ) ( not ( = ?auto_392712 ?auto_392718 ) ) ( not ( = ?auto_392713 ?auto_392714 ) ) ( not ( = ?auto_392713 ?auto_392715 ) ) ( not ( = ?auto_392713 ?auto_392716 ) ) ( not ( = ?auto_392713 ?auto_392717 ) ) ( not ( = ?auto_392713 ?auto_392718 ) ) ( not ( = ?auto_392714 ?auto_392715 ) ) ( not ( = ?auto_392714 ?auto_392716 ) ) ( not ( = ?auto_392714 ?auto_392717 ) ) ( not ( = ?auto_392714 ?auto_392718 ) ) ( not ( = ?auto_392715 ?auto_392716 ) ) ( not ( = ?auto_392715 ?auto_392717 ) ) ( not ( = ?auto_392715 ?auto_392718 ) ) ( not ( = ?auto_392716 ?auto_392717 ) ) ( not ( = ?auto_392716 ?auto_392718 ) ) ( not ( = ?auto_392717 ?auto_392718 ) ) ( ON ?auto_392716 ?auto_392717 ) ( ON ?auto_392715 ?auto_392716 ) ( ON ?auto_392714 ?auto_392715 ) ( ON ?auto_392713 ?auto_392714 ) ( CLEAR ?auto_392711 ) ( ON ?auto_392712 ?auto_392713 ) ( CLEAR ?auto_392712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392710 ?auto_392711 ?auto_392712 )
      ( MAKE-8PILE ?auto_392710 ?auto_392711 ?auto_392712 ?auto_392713 ?auto_392714 ?auto_392715 ?auto_392716 ?auto_392717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392727 - BLOCK
      ?auto_392728 - BLOCK
      ?auto_392729 - BLOCK
      ?auto_392730 - BLOCK
      ?auto_392731 - BLOCK
      ?auto_392732 - BLOCK
      ?auto_392733 - BLOCK
      ?auto_392734 - BLOCK
    )
    :vars
    (
      ?auto_392735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392734 ?auto_392735 ) ( ON-TABLE ?auto_392727 ) ( ON ?auto_392728 ?auto_392727 ) ( not ( = ?auto_392727 ?auto_392728 ) ) ( not ( = ?auto_392727 ?auto_392729 ) ) ( not ( = ?auto_392727 ?auto_392730 ) ) ( not ( = ?auto_392727 ?auto_392731 ) ) ( not ( = ?auto_392727 ?auto_392732 ) ) ( not ( = ?auto_392727 ?auto_392733 ) ) ( not ( = ?auto_392727 ?auto_392734 ) ) ( not ( = ?auto_392727 ?auto_392735 ) ) ( not ( = ?auto_392728 ?auto_392729 ) ) ( not ( = ?auto_392728 ?auto_392730 ) ) ( not ( = ?auto_392728 ?auto_392731 ) ) ( not ( = ?auto_392728 ?auto_392732 ) ) ( not ( = ?auto_392728 ?auto_392733 ) ) ( not ( = ?auto_392728 ?auto_392734 ) ) ( not ( = ?auto_392728 ?auto_392735 ) ) ( not ( = ?auto_392729 ?auto_392730 ) ) ( not ( = ?auto_392729 ?auto_392731 ) ) ( not ( = ?auto_392729 ?auto_392732 ) ) ( not ( = ?auto_392729 ?auto_392733 ) ) ( not ( = ?auto_392729 ?auto_392734 ) ) ( not ( = ?auto_392729 ?auto_392735 ) ) ( not ( = ?auto_392730 ?auto_392731 ) ) ( not ( = ?auto_392730 ?auto_392732 ) ) ( not ( = ?auto_392730 ?auto_392733 ) ) ( not ( = ?auto_392730 ?auto_392734 ) ) ( not ( = ?auto_392730 ?auto_392735 ) ) ( not ( = ?auto_392731 ?auto_392732 ) ) ( not ( = ?auto_392731 ?auto_392733 ) ) ( not ( = ?auto_392731 ?auto_392734 ) ) ( not ( = ?auto_392731 ?auto_392735 ) ) ( not ( = ?auto_392732 ?auto_392733 ) ) ( not ( = ?auto_392732 ?auto_392734 ) ) ( not ( = ?auto_392732 ?auto_392735 ) ) ( not ( = ?auto_392733 ?auto_392734 ) ) ( not ( = ?auto_392733 ?auto_392735 ) ) ( not ( = ?auto_392734 ?auto_392735 ) ) ( ON ?auto_392733 ?auto_392734 ) ( ON ?auto_392732 ?auto_392733 ) ( ON ?auto_392731 ?auto_392732 ) ( ON ?auto_392730 ?auto_392731 ) ( CLEAR ?auto_392728 ) ( ON ?auto_392729 ?auto_392730 ) ( CLEAR ?auto_392729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_392727 ?auto_392728 ?auto_392729 )
      ( MAKE-8PILE ?auto_392727 ?auto_392728 ?auto_392729 ?auto_392730 ?auto_392731 ?auto_392732 ?auto_392733 ?auto_392734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392744 - BLOCK
      ?auto_392745 - BLOCK
      ?auto_392746 - BLOCK
      ?auto_392747 - BLOCK
      ?auto_392748 - BLOCK
      ?auto_392749 - BLOCK
      ?auto_392750 - BLOCK
      ?auto_392751 - BLOCK
    )
    :vars
    (
      ?auto_392752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392751 ?auto_392752 ) ( ON-TABLE ?auto_392744 ) ( not ( = ?auto_392744 ?auto_392745 ) ) ( not ( = ?auto_392744 ?auto_392746 ) ) ( not ( = ?auto_392744 ?auto_392747 ) ) ( not ( = ?auto_392744 ?auto_392748 ) ) ( not ( = ?auto_392744 ?auto_392749 ) ) ( not ( = ?auto_392744 ?auto_392750 ) ) ( not ( = ?auto_392744 ?auto_392751 ) ) ( not ( = ?auto_392744 ?auto_392752 ) ) ( not ( = ?auto_392745 ?auto_392746 ) ) ( not ( = ?auto_392745 ?auto_392747 ) ) ( not ( = ?auto_392745 ?auto_392748 ) ) ( not ( = ?auto_392745 ?auto_392749 ) ) ( not ( = ?auto_392745 ?auto_392750 ) ) ( not ( = ?auto_392745 ?auto_392751 ) ) ( not ( = ?auto_392745 ?auto_392752 ) ) ( not ( = ?auto_392746 ?auto_392747 ) ) ( not ( = ?auto_392746 ?auto_392748 ) ) ( not ( = ?auto_392746 ?auto_392749 ) ) ( not ( = ?auto_392746 ?auto_392750 ) ) ( not ( = ?auto_392746 ?auto_392751 ) ) ( not ( = ?auto_392746 ?auto_392752 ) ) ( not ( = ?auto_392747 ?auto_392748 ) ) ( not ( = ?auto_392747 ?auto_392749 ) ) ( not ( = ?auto_392747 ?auto_392750 ) ) ( not ( = ?auto_392747 ?auto_392751 ) ) ( not ( = ?auto_392747 ?auto_392752 ) ) ( not ( = ?auto_392748 ?auto_392749 ) ) ( not ( = ?auto_392748 ?auto_392750 ) ) ( not ( = ?auto_392748 ?auto_392751 ) ) ( not ( = ?auto_392748 ?auto_392752 ) ) ( not ( = ?auto_392749 ?auto_392750 ) ) ( not ( = ?auto_392749 ?auto_392751 ) ) ( not ( = ?auto_392749 ?auto_392752 ) ) ( not ( = ?auto_392750 ?auto_392751 ) ) ( not ( = ?auto_392750 ?auto_392752 ) ) ( not ( = ?auto_392751 ?auto_392752 ) ) ( ON ?auto_392750 ?auto_392751 ) ( ON ?auto_392749 ?auto_392750 ) ( ON ?auto_392748 ?auto_392749 ) ( ON ?auto_392747 ?auto_392748 ) ( ON ?auto_392746 ?auto_392747 ) ( CLEAR ?auto_392744 ) ( ON ?auto_392745 ?auto_392746 ) ( CLEAR ?auto_392745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392744 ?auto_392745 )
      ( MAKE-8PILE ?auto_392744 ?auto_392745 ?auto_392746 ?auto_392747 ?auto_392748 ?auto_392749 ?auto_392750 ?auto_392751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392761 - BLOCK
      ?auto_392762 - BLOCK
      ?auto_392763 - BLOCK
      ?auto_392764 - BLOCK
      ?auto_392765 - BLOCK
      ?auto_392766 - BLOCK
      ?auto_392767 - BLOCK
      ?auto_392768 - BLOCK
    )
    :vars
    (
      ?auto_392769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392768 ?auto_392769 ) ( ON-TABLE ?auto_392761 ) ( not ( = ?auto_392761 ?auto_392762 ) ) ( not ( = ?auto_392761 ?auto_392763 ) ) ( not ( = ?auto_392761 ?auto_392764 ) ) ( not ( = ?auto_392761 ?auto_392765 ) ) ( not ( = ?auto_392761 ?auto_392766 ) ) ( not ( = ?auto_392761 ?auto_392767 ) ) ( not ( = ?auto_392761 ?auto_392768 ) ) ( not ( = ?auto_392761 ?auto_392769 ) ) ( not ( = ?auto_392762 ?auto_392763 ) ) ( not ( = ?auto_392762 ?auto_392764 ) ) ( not ( = ?auto_392762 ?auto_392765 ) ) ( not ( = ?auto_392762 ?auto_392766 ) ) ( not ( = ?auto_392762 ?auto_392767 ) ) ( not ( = ?auto_392762 ?auto_392768 ) ) ( not ( = ?auto_392762 ?auto_392769 ) ) ( not ( = ?auto_392763 ?auto_392764 ) ) ( not ( = ?auto_392763 ?auto_392765 ) ) ( not ( = ?auto_392763 ?auto_392766 ) ) ( not ( = ?auto_392763 ?auto_392767 ) ) ( not ( = ?auto_392763 ?auto_392768 ) ) ( not ( = ?auto_392763 ?auto_392769 ) ) ( not ( = ?auto_392764 ?auto_392765 ) ) ( not ( = ?auto_392764 ?auto_392766 ) ) ( not ( = ?auto_392764 ?auto_392767 ) ) ( not ( = ?auto_392764 ?auto_392768 ) ) ( not ( = ?auto_392764 ?auto_392769 ) ) ( not ( = ?auto_392765 ?auto_392766 ) ) ( not ( = ?auto_392765 ?auto_392767 ) ) ( not ( = ?auto_392765 ?auto_392768 ) ) ( not ( = ?auto_392765 ?auto_392769 ) ) ( not ( = ?auto_392766 ?auto_392767 ) ) ( not ( = ?auto_392766 ?auto_392768 ) ) ( not ( = ?auto_392766 ?auto_392769 ) ) ( not ( = ?auto_392767 ?auto_392768 ) ) ( not ( = ?auto_392767 ?auto_392769 ) ) ( not ( = ?auto_392768 ?auto_392769 ) ) ( ON ?auto_392767 ?auto_392768 ) ( ON ?auto_392766 ?auto_392767 ) ( ON ?auto_392765 ?auto_392766 ) ( ON ?auto_392764 ?auto_392765 ) ( ON ?auto_392763 ?auto_392764 ) ( CLEAR ?auto_392761 ) ( ON ?auto_392762 ?auto_392763 ) ( CLEAR ?auto_392762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_392761 ?auto_392762 )
      ( MAKE-8PILE ?auto_392761 ?auto_392762 ?auto_392763 ?auto_392764 ?auto_392765 ?auto_392766 ?auto_392767 ?auto_392768 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392778 - BLOCK
      ?auto_392779 - BLOCK
      ?auto_392780 - BLOCK
      ?auto_392781 - BLOCK
      ?auto_392782 - BLOCK
      ?auto_392783 - BLOCK
      ?auto_392784 - BLOCK
      ?auto_392785 - BLOCK
    )
    :vars
    (
      ?auto_392786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392785 ?auto_392786 ) ( not ( = ?auto_392778 ?auto_392779 ) ) ( not ( = ?auto_392778 ?auto_392780 ) ) ( not ( = ?auto_392778 ?auto_392781 ) ) ( not ( = ?auto_392778 ?auto_392782 ) ) ( not ( = ?auto_392778 ?auto_392783 ) ) ( not ( = ?auto_392778 ?auto_392784 ) ) ( not ( = ?auto_392778 ?auto_392785 ) ) ( not ( = ?auto_392778 ?auto_392786 ) ) ( not ( = ?auto_392779 ?auto_392780 ) ) ( not ( = ?auto_392779 ?auto_392781 ) ) ( not ( = ?auto_392779 ?auto_392782 ) ) ( not ( = ?auto_392779 ?auto_392783 ) ) ( not ( = ?auto_392779 ?auto_392784 ) ) ( not ( = ?auto_392779 ?auto_392785 ) ) ( not ( = ?auto_392779 ?auto_392786 ) ) ( not ( = ?auto_392780 ?auto_392781 ) ) ( not ( = ?auto_392780 ?auto_392782 ) ) ( not ( = ?auto_392780 ?auto_392783 ) ) ( not ( = ?auto_392780 ?auto_392784 ) ) ( not ( = ?auto_392780 ?auto_392785 ) ) ( not ( = ?auto_392780 ?auto_392786 ) ) ( not ( = ?auto_392781 ?auto_392782 ) ) ( not ( = ?auto_392781 ?auto_392783 ) ) ( not ( = ?auto_392781 ?auto_392784 ) ) ( not ( = ?auto_392781 ?auto_392785 ) ) ( not ( = ?auto_392781 ?auto_392786 ) ) ( not ( = ?auto_392782 ?auto_392783 ) ) ( not ( = ?auto_392782 ?auto_392784 ) ) ( not ( = ?auto_392782 ?auto_392785 ) ) ( not ( = ?auto_392782 ?auto_392786 ) ) ( not ( = ?auto_392783 ?auto_392784 ) ) ( not ( = ?auto_392783 ?auto_392785 ) ) ( not ( = ?auto_392783 ?auto_392786 ) ) ( not ( = ?auto_392784 ?auto_392785 ) ) ( not ( = ?auto_392784 ?auto_392786 ) ) ( not ( = ?auto_392785 ?auto_392786 ) ) ( ON ?auto_392784 ?auto_392785 ) ( ON ?auto_392783 ?auto_392784 ) ( ON ?auto_392782 ?auto_392783 ) ( ON ?auto_392781 ?auto_392782 ) ( ON ?auto_392780 ?auto_392781 ) ( ON ?auto_392779 ?auto_392780 ) ( ON ?auto_392778 ?auto_392779 ) ( CLEAR ?auto_392778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392778 )
      ( MAKE-8PILE ?auto_392778 ?auto_392779 ?auto_392780 ?auto_392781 ?auto_392782 ?auto_392783 ?auto_392784 ?auto_392785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_392795 - BLOCK
      ?auto_392796 - BLOCK
      ?auto_392797 - BLOCK
      ?auto_392798 - BLOCK
      ?auto_392799 - BLOCK
      ?auto_392800 - BLOCK
      ?auto_392801 - BLOCK
      ?auto_392802 - BLOCK
    )
    :vars
    (
      ?auto_392803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392802 ?auto_392803 ) ( not ( = ?auto_392795 ?auto_392796 ) ) ( not ( = ?auto_392795 ?auto_392797 ) ) ( not ( = ?auto_392795 ?auto_392798 ) ) ( not ( = ?auto_392795 ?auto_392799 ) ) ( not ( = ?auto_392795 ?auto_392800 ) ) ( not ( = ?auto_392795 ?auto_392801 ) ) ( not ( = ?auto_392795 ?auto_392802 ) ) ( not ( = ?auto_392795 ?auto_392803 ) ) ( not ( = ?auto_392796 ?auto_392797 ) ) ( not ( = ?auto_392796 ?auto_392798 ) ) ( not ( = ?auto_392796 ?auto_392799 ) ) ( not ( = ?auto_392796 ?auto_392800 ) ) ( not ( = ?auto_392796 ?auto_392801 ) ) ( not ( = ?auto_392796 ?auto_392802 ) ) ( not ( = ?auto_392796 ?auto_392803 ) ) ( not ( = ?auto_392797 ?auto_392798 ) ) ( not ( = ?auto_392797 ?auto_392799 ) ) ( not ( = ?auto_392797 ?auto_392800 ) ) ( not ( = ?auto_392797 ?auto_392801 ) ) ( not ( = ?auto_392797 ?auto_392802 ) ) ( not ( = ?auto_392797 ?auto_392803 ) ) ( not ( = ?auto_392798 ?auto_392799 ) ) ( not ( = ?auto_392798 ?auto_392800 ) ) ( not ( = ?auto_392798 ?auto_392801 ) ) ( not ( = ?auto_392798 ?auto_392802 ) ) ( not ( = ?auto_392798 ?auto_392803 ) ) ( not ( = ?auto_392799 ?auto_392800 ) ) ( not ( = ?auto_392799 ?auto_392801 ) ) ( not ( = ?auto_392799 ?auto_392802 ) ) ( not ( = ?auto_392799 ?auto_392803 ) ) ( not ( = ?auto_392800 ?auto_392801 ) ) ( not ( = ?auto_392800 ?auto_392802 ) ) ( not ( = ?auto_392800 ?auto_392803 ) ) ( not ( = ?auto_392801 ?auto_392802 ) ) ( not ( = ?auto_392801 ?auto_392803 ) ) ( not ( = ?auto_392802 ?auto_392803 ) ) ( ON ?auto_392801 ?auto_392802 ) ( ON ?auto_392800 ?auto_392801 ) ( ON ?auto_392799 ?auto_392800 ) ( ON ?auto_392798 ?auto_392799 ) ( ON ?auto_392797 ?auto_392798 ) ( ON ?auto_392796 ?auto_392797 ) ( ON ?auto_392795 ?auto_392796 ) ( CLEAR ?auto_392795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_392795 )
      ( MAKE-8PILE ?auto_392795 ?auto_392796 ?auto_392797 ?auto_392798 ?auto_392799 ?auto_392800 ?auto_392801 ?auto_392802 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392813 - BLOCK
      ?auto_392814 - BLOCK
      ?auto_392815 - BLOCK
      ?auto_392816 - BLOCK
      ?auto_392817 - BLOCK
      ?auto_392818 - BLOCK
      ?auto_392819 - BLOCK
      ?auto_392820 - BLOCK
      ?auto_392821 - BLOCK
    )
    :vars
    (
      ?auto_392822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392820 ) ( ON ?auto_392821 ?auto_392822 ) ( CLEAR ?auto_392821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392813 ) ( ON ?auto_392814 ?auto_392813 ) ( ON ?auto_392815 ?auto_392814 ) ( ON ?auto_392816 ?auto_392815 ) ( ON ?auto_392817 ?auto_392816 ) ( ON ?auto_392818 ?auto_392817 ) ( ON ?auto_392819 ?auto_392818 ) ( ON ?auto_392820 ?auto_392819 ) ( not ( = ?auto_392813 ?auto_392814 ) ) ( not ( = ?auto_392813 ?auto_392815 ) ) ( not ( = ?auto_392813 ?auto_392816 ) ) ( not ( = ?auto_392813 ?auto_392817 ) ) ( not ( = ?auto_392813 ?auto_392818 ) ) ( not ( = ?auto_392813 ?auto_392819 ) ) ( not ( = ?auto_392813 ?auto_392820 ) ) ( not ( = ?auto_392813 ?auto_392821 ) ) ( not ( = ?auto_392813 ?auto_392822 ) ) ( not ( = ?auto_392814 ?auto_392815 ) ) ( not ( = ?auto_392814 ?auto_392816 ) ) ( not ( = ?auto_392814 ?auto_392817 ) ) ( not ( = ?auto_392814 ?auto_392818 ) ) ( not ( = ?auto_392814 ?auto_392819 ) ) ( not ( = ?auto_392814 ?auto_392820 ) ) ( not ( = ?auto_392814 ?auto_392821 ) ) ( not ( = ?auto_392814 ?auto_392822 ) ) ( not ( = ?auto_392815 ?auto_392816 ) ) ( not ( = ?auto_392815 ?auto_392817 ) ) ( not ( = ?auto_392815 ?auto_392818 ) ) ( not ( = ?auto_392815 ?auto_392819 ) ) ( not ( = ?auto_392815 ?auto_392820 ) ) ( not ( = ?auto_392815 ?auto_392821 ) ) ( not ( = ?auto_392815 ?auto_392822 ) ) ( not ( = ?auto_392816 ?auto_392817 ) ) ( not ( = ?auto_392816 ?auto_392818 ) ) ( not ( = ?auto_392816 ?auto_392819 ) ) ( not ( = ?auto_392816 ?auto_392820 ) ) ( not ( = ?auto_392816 ?auto_392821 ) ) ( not ( = ?auto_392816 ?auto_392822 ) ) ( not ( = ?auto_392817 ?auto_392818 ) ) ( not ( = ?auto_392817 ?auto_392819 ) ) ( not ( = ?auto_392817 ?auto_392820 ) ) ( not ( = ?auto_392817 ?auto_392821 ) ) ( not ( = ?auto_392817 ?auto_392822 ) ) ( not ( = ?auto_392818 ?auto_392819 ) ) ( not ( = ?auto_392818 ?auto_392820 ) ) ( not ( = ?auto_392818 ?auto_392821 ) ) ( not ( = ?auto_392818 ?auto_392822 ) ) ( not ( = ?auto_392819 ?auto_392820 ) ) ( not ( = ?auto_392819 ?auto_392821 ) ) ( not ( = ?auto_392819 ?auto_392822 ) ) ( not ( = ?auto_392820 ?auto_392821 ) ) ( not ( = ?auto_392820 ?auto_392822 ) ) ( not ( = ?auto_392821 ?auto_392822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392821 ?auto_392822 )
      ( !STACK ?auto_392821 ?auto_392820 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392832 - BLOCK
      ?auto_392833 - BLOCK
      ?auto_392834 - BLOCK
      ?auto_392835 - BLOCK
      ?auto_392836 - BLOCK
      ?auto_392837 - BLOCK
      ?auto_392838 - BLOCK
      ?auto_392839 - BLOCK
      ?auto_392840 - BLOCK
    )
    :vars
    (
      ?auto_392841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392839 ) ( ON ?auto_392840 ?auto_392841 ) ( CLEAR ?auto_392840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_392832 ) ( ON ?auto_392833 ?auto_392832 ) ( ON ?auto_392834 ?auto_392833 ) ( ON ?auto_392835 ?auto_392834 ) ( ON ?auto_392836 ?auto_392835 ) ( ON ?auto_392837 ?auto_392836 ) ( ON ?auto_392838 ?auto_392837 ) ( ON ?auto_392839 ?auto_392838 ) ( not ( = ?auto_392832 ?auto_392833 ) ) ( not ( = ?auto_392832 ?auto_392834 ) ) ( not ( = ?auto_392832 ?auto_392835 ) ) ( not ( = ?auto_392832 ?auto_392836 ) ) ( not ( = ?auto_392832 ?auto_392837 ) ) ( not ( = ?auto_392832 ?auto_392838 ) ) ( not ( = ?auto_392832 ?auto_392839 ) ) ( not ( = ?auto_392832 ?auto_392840 ) ) ( not ( = ?auto_392832 ?auto_392841 ) ) ( not ( = ?auto_392833 ?auto_392834 ) ) ( not ( = ?auto_392833 ?auto_392835 ) ) ( not ( = ?auto_392833 ?auto_392836 ) ) ( not ( = ?auto_392833 ?auto_392837 ) ) ( not ( = ?auto_392833 ?auto_392838 ) ) ( not ( = ?auto_392833 ?auto_392839 ) ) ( not ( = ?auto_392833 ?auto_392840 ) ) ( not ( = ?auto_392833 ?auto_392841 ) ) ( not ( = ?auto_392834 ?auto_392835 ) ) ( not ( = ?auto_392834 ?auto_392836 ) ) ( not ( = ?auto_392834 ?auto_392837 ) ) ( not ( = ?auto_392834 ?auto_392838 ) ) ( not ( = ?auto_392834 ?auto_392839 ) ) ( not ( = ?auto_392834 ?auto_392840 ) ) ( not ( = ?auto_392834 ?auto_392841 ) ) ( not ( = ?auto_392835 ?auto_392836 ) ) ( not ( = ?auto_392835 ?auto_392837 ) ) ( not ( = ?auto_392835 ?auto_392838 ) ) ( not ( = ?auto_392835 ?auto_392839 ) ) ( not ( = ?auto_392835 ?auto_392840 ) ) ( not ( = ?auto_392835 ?auto_392841 ) ) ( not ( = ?auto_392836 ?auto_392837 ) ) ( not ( = ?auto_392836 ?auto_392838 ) ) ( not ( = ?auto_392836 ?auto_392839 ) ) ( not ( = ?auto_392836 ?auto_392840 ) ) ( not ( = ?auto_392836 ?auto_392841 ) ) ( not ( = ?auto_392837 ?auto_392838 ) ) ( not ( = ?auto_392837 ?auto_392839 ) ) ( not ( = ?auto_392837 ?auto_392840 ) ) ( not ( = ?auto_392837 ?auto_392841 ) ) ( not ( = ?auto_392838 ?auto_392839 ) ) ( not ( = ?auto_392838 ?auto_392840 ) ) ( not ( = ?auto_392838 ?auto_392841 ) ) ( not ( = ?auto_392839 ?auto_392840 ) ) ( not ( = ?auto_392839 ?auto_392841 ) ) ( not ( = ?auto_392840 ?auto_392841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_392840 ?auto_392841 )
      ( !STACK ?auto_392840 ?auto_392839 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392851 - BLOCK
      ?auto_392852 - BLOCK
      ?auto_392853 - BLOCK
      ?auto_392854 - BLOCK
      ?auto_392855 - BLOCK
      ?auto_392856 - BLOCK
      ?auto_392857 - BLOCK
      ?auto_392858 - BLOCK
      ?auto_392859 - BLOCK
    )
    :vars
    (
      ?auto_392860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392859 ?auto_392860 ) ( ON-TABLE ?auto_392851 ) ( ON ?auto_392852 ?auto_392851 ) ( ON ?auto_392853 ?auto_392852 ) ( ON ?auto_392854 ?auto_392853 ) ( ON ?auto_392855 ?auto_392854 ) ( ON ?auto_392856 ?auto_392855 ) ( ON ?auto_392857 ?auto_392856 ) ( not ( = ?auto_392851 ?auto_392852 ) ) ( not ( = ?auto_392851 ?auto_392853 ) ) ( not ( = ?auto_392851 ?auto_392854 ) ) ( not ( = ?auto_392851 ?auto_392855 ) ) ( not ( = ?auto_392851 ?auto_392856 ) ) ( not ( = ?auto_392851 ?auto_392857 ) ) ( not ( = ?auto_392851 ?auto_392858 ) ) ( not ( = ?auto_392851 ?auto_392859 ) ) ( not ( = ?auto_392851 ?auto_392860 ) ) ( not ( = ?auto_392852 ?auto_392853 ) ) ( not ( = ?auto_392852 ?auto_392854 ) ) ( not ( = ?auto_392852 ?auto_392855 ) ) ( not ( = ?auto_392852 ?auto_392856 ) ) ( not ( = ?auto_392852 ?auto_392857 ) ) ( not ( = ?auto_392852 ?auto_392858 ) ) ( not ( = ?auto_392852 ?auto_392859 ) ) ( not ( = ?auto_392852 ?auto_392860 ) ) ( not ( = ?auto_392853 ?auto_392854 ) ) ( not ( = ?auto_392853 ?auto_392855 ) ) ( not ( = ?auto_392853 ?auto_392856 ) ) ( not ( = ?auto_392853 ?auto_392857 ) ) ( not ( = ?auto_392853 ?auto_392858 ) ) ( not ( = ?auto_392853 ?auto_392859 ) ) ( not ( = ?auto_392853 ?auto_392860 ) ) ( not ( = ?auto_392854 ?auto_392855 ) ) ( not ( = ?auto_392854 ?auto_392856 ) ) ( not ( = ?auto_392854 ?auto_392857 ) ) ( not ( = ?auto_392854 ?auto_392858 ) ) ( not ( = ?auto_392854 ?auto_392859 ) ) ( not ( = ?auto_392854 ?auto_392860 ) ) ( not ( = ?auto_392855 ?auto_392856 ) ) ( not ( = ?auto_392855 ?auto_392857 ) ) ( not ( = ?auto_392855 ?auto_392858 ) ) ( not ( = ?auto_392855 ?auto_392859 ) ) ( not ( = ?auto_392855 ?auto_392860 ) ) ( not ( = ?auto_392856 ?auto_392857 ) ) ( not ( = ?auto_392856 ?auto_392858 ) ) ( not ( = ?auto_392856 ?auto_392859 ) ) ( not ( = ?auto_392856 ?auto_392860 ) ) ( not ( = ?auto_392857 ?auto_392858 ) ) ( not ( = ?auto_392857 ?auto_392859 ) ) ( not ( = ?auto_392857 ?auto_392860 ) ) ( not ( = ?auto_392858 ?auto_392859 ) ) ( not ( = ?auto_392858 ?auto_392860 ) ) ( not ( = ?auto_392859 ?auto_392860 ) ) ( CLEAR ?auto_392857 ) ( ON ?auto_392858 ?auto_392859 ) ( CLEAR ?auto_392858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_392851 ?auto_392852 ?auto_392853 ?auto_392854 ?auto_392855 ?auto_392856 ?auto_392857 ?auto_392858 )
      ( MAKE-9PILE ?auto_392851 ?auto_392852 ?auto_392853 ?auto_392854 ?auto_392855 ?auto_392856 ?auto_392857 ?auto_392858 ?auto_392859 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392870 - BLOCK
      ?auto_392871 - BLOCK
      ?auto_392872 - BLOCK
      ?auto_392873 - BLOCK
      ?auto_392874 - BLOCK
      ?auto_392875 - BLOCK
      ?auto_392876 - BLOCK
      ?auto_392877 - BLOCK
      ?auto_392878 - BLOCK
    )
    :vars
    (
      ?auto_392879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392878 ?auto_392879 ) ( ON-TABLE ?auto_392870 ) ( ON ?auto_392871 ?auto_392870 ) ( ON ?auto_392872 ?auto_392871 ) ( ON ?auto_392873 ?auto_392872 ) ( ON ?auto_392874 ?auto_392873 ) ( ON ?auto_392875 ?auto_392874 ) ( ON ?auto_392876 ?auto_392875 ) ( not ( = ?auto_392870 ?auto_392871 ) ) ( not ( = ?auto_392870 ?auto_392872 ) ) ( not ( = ?auto_392870 ?auto_392873 ) ) ( not ( = ?auto_392870 ?auto_392874 ) ) ( not ( = ?auto_392870 ?auto_392875 ) ) ( not ( = ?auto_392870 ?auto_392876 ) ) ( not ( = ?auto_392870 ?auto_392877 ) ) ( not ( = ?auto_392870 ?auto_392878 ) ) ( not ( = ?auto_392870 ?auto_392879 ) ) ( not ( = ?auto_392871 ?auto_392872 ) ) ( not ( = ?auto_392871 ?auto_392873 ) ) ( not ( = ?auto_392871 ?auto_392874 ) ) ( not ( = ?auto_392871 ?auto_392875 ) ) ( not ( = ?auto_392871 ?auto_392876 ) ) ( not ( = ?auto_392871 ?auto_392877 ) ) ( not ( = ?auto_392871 ?auto_392878 ) ) ( not ( = ?auto_392871 ?auto_392879 ) ) ( not ( = ?auto_392872 ?auto_392873 ) ) ( not ( = ?auto_392872 ?auto_392874 ) ) ( not ( = ?auto_392872 ?auto_392875 ) ) ( not ( = ?auto_392872 ?auto_392876 ) ) ( not ( = ?auto_392872 ?auto_392877 ) ) ( not ( = ?auto_392872 ?auto_392878 ) ) ( not ( = ?auto_392872 ?auto_392879 ) ) ( not ( = ?auto_392873 ?auto_392874 ) ) ( not ( = ?auto_392873 ?auto_392875 ) ) ( not ( = ?auto_392873 ?auto_392876 ) ) ( not ( = ?auto_392873 ?auto_392877 ) ) ( not ( = ?auto_392873 ?auto_392878 ) ) ( not ( = ?auto_392873 ?auto_392879 ) ) ( not ( = ?auto_392874 ?auto_392875 ) ) ( not ( = ?auto_392874 ?auto_392876 ) ) ( not ( = ?auto_392874 ?auto_392877 ) ) ( not ( = ?auto_392874 ?auto_392878 ) ) ( not ( = ?auto_392874 ?auto_392879 ) ) ( not ( = ?auto_392875 ?auto_392876 ) ) ( not ( = ?auto_392875 ?auto_392877 ) ) ( not ( = ?auto_392875 ?auto_392878 ) ) ( not ( = ?auto_392875 ?auto_392879 ) ) ( not ( = ?auto_392876 ?auto_392877 ) ) ( not ( = ?auto_392876 ?auto_392878 ) ) ( not ( = ?auto_392876 ?auto_392879 ) ) ( not ( = ?auto_392877 ?auto_392878 ) ) ( not ( = ?auto_392877 ?auto_392879 ) ) ( not ( = ?auto_392878 ?auto_392879 ) ) ( CLEAR ?auto_392876 ) ( ON ?auto_392877 ?auto_392878 ) ( CLEAR ?auto_392877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_392870 ?auto_392871 ?auto_392872 ?auto_392873 ?auto_392874 ?auto_392875 ?auto_392876 ?auto_392877 )
      ( MAKE-9PILE ?auto_392870 ?auto_392871 ?auto_392872 ?auto_392873 ?auto_392874 ?auto_392875 ?auto_392876 ?auto_392877 ?auto_392878 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392889 - BLOCK
      ?auto_392890 - BLOCK
      ?auto_392891 - BLOCK
      ?auto_392892 - BLOCK
      ?auto_392893 - BLOCK
      ?auto_392894 - BLOCK
      ?auto_392895 - BLOCK
      ?auto_392896 - BLOCK
      ?auto_392897 - BLOCK
    )
    :vars
    (
      ?auto_392898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392897 ?auto_392898 ) ( ON-TABLE ?auto_392889 ) ( ON ?auto_392890 ?auto_392889 ) ( ON ?auto_392891 ?auto_392890 ) ( ON ?auto_392892 ?auto_392891 ) ( ON ?auto_392893 ?auto_392892 ) ( ON ?auto_392894 ?auto_392893 ) ( not ( = ?auto_392889 ?auto_392890 ) ) ( not ( = ?auto_392889 ?auto_392891 ) ) ( not ( = ?auto_392889 ?auto_392892 ) ) ( not ( = ?auto_392889 ?auto_392893 ) ) ( not ( = ?auto_392889 ?auto_392894 ) ) ( not ( = ?auto_392889 ?auto_392895 ) ) ( not ( = ?auto_392889 ?auto_392896 ) ) ( not ( = ?auto_392889 ?auto_392897 ) ) ( not ( = ?auto_392889 ?auto_392898 ) ) ( not ( = ?auto_392890 ?auto_392891 ) ) ( not ( = ?auto_392890 ?auto_392892 ) ) ( not ( = ?auto_392890 ?auto_392893 ) ) ( not ( = ?auto_392890 ?auto_392894 ) ) ( not ( = ?auto_392890 ?auto_392895 ) ) ( not ( = ?auto_392890 ?auto_392896 ) ) ( not ( = ?auto_392890 ?auto_392897 ) ) ( not ( = ?auto_392890 ?auto_392898 ) ) ( not ( = ?auto_392891 ?auto_392892 ) ) ( not ( = ?auto_392891 ?auto_392893 ) ) ( not ( = ?auto_392891 ?auto_392894 ) ) ( not ( = ?auto_392891 ?auto_392895 ) ) ( not ( = ?auto_392891 ?auto_392896 ) ) ( not ( = ?auto_392891 ?auto_392897 ) ) ( not ( = ?auto_392891 ?auto_392898 ) ) ( not ( = ?auto_392892 ?auto_392893 ) ) ( not ( = ?auto_392892 ?auto_392894 ) ) ( not ( = ?auto_392892 ?auto_392895 ) ) ( not ( = ?auto_392892 ?auto_392896 ) ) ( not ( = ?auto_392892 ?auto_392897 ) ) ( not ( = ?auto_392892 ?auto_392898 ) ) ( not ( = ?auto_392893 ?auto_392894 ) ) ( not ( = ?auto_392893 ?auto_392895 ) ) ( not ( = ?auto_392893 ?auto_392896 ) ) ( not ( = ?auto_392893 ?auto_392897 ) ) ( not ( = ?auto_392893 ?auto_392898 ) ) ( not ( = ?auto_392894 ?auto_392895 ) ) ( not ( = ?auto_392894 ?auto_392896 ) ) ( not ( = ?auto_392894 ?auto_392897 ) ) ( not ( = ?auto_392894 ?auto_392898 ) ) ( not ( = ?auto_392895 ?auto_392896 ) ) ( not ( = ?auto_392895 ?auto_392897 ) ) ( not ( = ?auto_392895 ?auto_392898 ) ) ( not ( = ?auto_392896 ?auto_392897 ) ) ( not ( = ?auto_392896 ?auto_392898 ) ) ( not ( = ?auto_392897 ?auto_392898 ) ) ( ON ?auto_392896 ?auto_392897 ) ( CLEAR ?auto_392894 ) ( ON ?auto_392895 ?auto_392896 ) ( CLEAR ?auto_392895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_392889 ?auto_392890 ?auto_392891 ?auto_392892 ?auto_392893 ?auto_392894 ?auto_392895 )
      ( MAKE-9PILE ?auto_392889 ?auto_392890 ?auto_392891 ?auto_392892 ?auto_392893 ?auto_392894 ?auto_392895 ?auto_392896 ?auto_392897 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392908 - BLOCK
      ?auto_392909 - BLOCK
      ?auto_392910 - BLOCK
      ?auto_392911 - BLOCK
      ?auto_392912 - BLOCK
      ?auto_392913 - BLOCK
      ?auto_392914 - BLOCK
      ?auto_392915 - BLOCK
      ?auto_392916 - BLOCK
    )
    :vars
    (
      ?auto_392917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392916 ?auto_392917 ) ( ON-TABLE ?auto_392908 ) ( ON ?auto_392909 ?auto_392908 ) ( ON ?auto_392910 ?auto_392909 ) ( ON ?auto_392911 ?auto_392910 ) ( ON ?auto_392912 ?auto_392911 ) ( ON ?auto_392913 ?auto_392912 ) ( not ( = ?auto_392908 ?auto_392909 ) ) ( not ( = ?auto_392908 ?auto_392910 ) ) ( not ( = ?auto_392908 ?auto_392911 ) ) ( not ( = ?auto_392908 ?auto_392912 ) ) ( not ( = ?auto_392908 ?auto_392913 ) ) ( not ( = ?auto_392908 ?auto_392914 ) ) ( not ( = ?auto_392908 ?auto_392915 ) ) ( not ( = ?auto_392908 ?auto_392916 ) ) ( not ( = ?auto_392908 ?auto_392917 ) ) ( not ( = ?auto_392909 ?auto_392910 ) ) ( not ( = ?auto_392909 ?auto_392911 ) ) ( not ( = ?auto_392909 ?auto_392912 ) ) ( not ( = ?auto_392909 ?auto_392913 ) ) ( not ( = ?auto_392909 ?auto_392914 ) ) ( not ( = ?auto_392909 ?auto_392915 ) ) ( not ( = ?auto_392909 ?auto_392916 ) ) ( not ( = ?auto_392909 ?auto_392917 ) ) ( not ( = ?auto_392910 ?auto_392911 ) ) ( not ( = ?auto_392910 ?auto_392912 ) ) ( not ( = ?auto_392910 ?auto_392913 ) ) ( not ( = ?auto_392910 ?auto_392914 ) ) ( not ( = ?auto_392910 ?auto_392915 ) ) ( not ( = ?auto_392910 ?auto_392916 ) ) ( not ( = ?auto_392910 ?auto_392917 ) ) ( not ( = ?auto_392911 ?auto_392912 ) ) ( not ( = ?auto_392911 ?auto_392913 ) ) ( not ( = ?auto_392911 ?auto_392914 ) ) ( not ( = ?auto_392911 ?auto_392915 ) ) ( not ( = ?auto_392911 ?auto_392916 ) ) ( not ( = ?auto_392911 ?auto_392917 ) ) ( not ( = ?auto_392912 ?auto_392913 ) ) ( not ( = ?auto_392912 ?auto_392914 ) ) ( not ( = ?auto_392912 ?auto_392915 ) ) ( not ( = ?auto_392912 ?auto_392916 ) ) ( not ( = ?auto_392912 ?auto_392917 ) ) ( not ( = ?auto_392913 ?auto_392914 ) ) ( not ( = ?auto_392913 ?auto_392915 ) ) ( not ( = ?auto_392913 ?auto_392916 ) ) ( not ( = ?auto_392913 ?auto_392917 ) ) ( not ( = ?auto_392914 ?auto_392915 ) ) ( not ( = ?auto_392914 ?auto_392916 ) ) ( not ( = ?auto_392914 ?auto_392917 ) ) ( not ( = ?auto_392915 ?auto_392916 ) ) ( not ( = ?auto_392915 ?auto_392917 ) ) ( not ( = ?auto_392916 ?auto_392917 ) ) ( ON ?auto_392915 ?auto_392916 ) ( CLEAR ?auto_392913 ) ( ON ?auto_392914 ?auto_392915 ) ( CLEAR ?auto_392914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_392908 ?auto_392909 ?auto_392910 ?auto_392911 ?auto_392912 ?auto_392913 ?auto_392914 )
      ( MAKE-9PILE ?auto_392908 ?auto_392909 ?auto_392910 ?auto_392911 ?auto_392912 ?auto_392913 ?auto_392914 ?auto_392915 ?auto_392916 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392927 - BLOCK
      ?auto_392928 - BLOCK
      ?auto_392929 - BLOCK
      ?auto_392930 - BLOCK
      ?auto_392931 - BLOCK
      ?auto_392932 - BLOCK
      ?auto_392933 - BLOCK
      ?auto_392934 - BLOCK
      ?auto_392935 - BLOCK
    )
    :vars
    (
      ?auto_392936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392935 ?auto_392936 ) ( ON-TABLE ?auto_392927 ) ( ON ?auto_392928 ?auto_392927 ) ( ON ?auto_392929 ?auto_392928 ) ( ON ?auto_392930 ?auto_392929 ) ( ON ?auto_392931 ?auto_392930 ) ( not ( = ?auto_392927 ?auto_392928 ) ) ( not ( = ?auto_392927 ?auto_392929 ) ) ( not ( = ?auto_392927 ?auto_392930 ) ) ( not ( = ?auto_392927 ?auto_392931 ) ) ( not ( = ?auto_392927 ?auto_392932 ) ) ( not ( = ?auto_392927 ?auto_392933 ) ) ( not ( = ?auto_392927 ?auto_392934 ) ) ( not ( = ?auto_392927 ?auto_392935 ) ) ( not ( = ?auto_392927 ?auto_392936 ) ) ( not ( = ?auto_392928 ?auto_392929 ) ) ( not ( = ?auto_392928 ?auto_392930 ) ) ( not ( = ?auto_392928 ?auto_392931 ) ) ( not ( = ?auto_392928 ?auto_392932 ) ) ( not ( = ?auto_392928 ?auto_392933 ) ) ( not ( = ?auto_392928 ?auto_392934 ) ) ( not ( = ?auto_392928 ?auto_392935 ) ) ( not ( = ?auto_392928 ?auto_392936 ) ) ( not ( = ?auto_392929 ?auto_392930 ) ) ( not ( = ?auto_392929 ?auto_392931 ) ) ( not ( = ?auto_392929 ?auto_392932 ) ) ( not ( = ?auto_392929 ?auto_392933 ) ) ( not ( = ?auto_392929 ?auto_392934 ) ) ( not ( = ?auto_392929 ?auto_392935 ) ) ( not ( = ?auto_392929 ?auto_392936 ) ) ( not ( = ?auto_392930 ?auto_392931 ) ) ( not ( = ?auto_392930 ?auto_392932 ) ) ( not ( = ?auto_392930 ?auto_392933 ) ) ( not ( = ?auto_392930 ?auto_392934 ) ) ( not ( = ?auto_392930 ?auto_392935 ) ) ( not ( = ?auto_392930 ?auto_392936 ) ) ( not ( = ?auto_392931 ?auto_392932 ) ) ( not ( = ?auto_392931 ?auto_392933 ) ) ( not ( = ?auto_392931 ?auto_392934 ) ) ( not ( = ?auto_392931 ?auto_392935 ) ) ( not ( = ?auto_392931 ?auto_392936 ) ) ( not ( = ?auto_392932 ?auto_392933 ) ) ( not ( = ?auto_392932 ?auto_392934 ) ) ( not ( = ?auto_392932 ?auto_392935 ) ) ( not ( = ?auto_392932 ?auto_392936 ) ) ( not ( = ?auto_392933 ?auto_392934 ) ) ( not ( = ?auto_392933 ?auto_392935 ) ) ( not ( = ?auto_392933 ?auto_392936 ) ) ( not ( = ?auto_392934 ?auto_392935 ) ) ( not ( = ?auto_392934 ?auto_392936 ) ) ( not ( = ?auto_392935 ?auto_392936 ) ) ( ON ?auto_392934 ?auto_392935 ) ( ON ?auto_392933 ?auto_392934 ) ( CLEAR ?auto_392931 ) ( ON ?auto_392932 ?auto_392933 ) ( CLEAR ?auto_392932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392927 ?auto_392928 ?auto_392929 ?auto_392930 ?auto_392931 ?auto_392932 )
      ( MAKE-9PILE ?auto_392927 ?auto_392928 ?auto_392929 ?auto_392930 ?auto_392931 ?auto_392932 ?auto_392933 ?auto_392934 ?auto_392935 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392946 - BLOCK
      ?auto_392947 - BLOCK
      ?auto_392948 - BLOCK
      ?auto_392949 - BLOCK
      ?auto_392950 - BLOCK
      ?auto_392951 - BLOCK
      ?auto_392952 - BLOCK
      ?auto_392953 - BLOCK
      ?auto_392954 - BLOCK
    )
    :vars
    (
      ?auto_392955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392954 ?auto_392955 ) ( ON-TABLE ?auto_392946 ) ( ON ?auto_392947 ?auto_392946 ) ( ON ?auto_392948 ?auto_392947 ) ( ON ?auto_392949 ?auto_392948 ) ( ON ?auto_392950 ?auto_392949 ) ( not ( = ?auto_392946 ?auto_392947 ) ) ( not ( = ?auto_392946 ?auto_392948 ) ) ( not ( = ?auto_392946 ?auto_392949 ) ) ( not ( = ?auto_392946 ?auto_392950 ) ) ( not ( = ?auto_392946 ?auto_392951 ) ) ( not ( = ?auto_392946 ?auto_392952 ) ) ( not ( = ?auto_392946 ?auto_392953 ) ) ( not ( = ?auto_392946 ?auto_392954 ) ) ( not ( = ?auto_392946 ?auto_392955 ) ) ( not ( = ?auto_392947 ?auto_392948 ) ) ( not ( = ?auto_392947 ?auto_392949 ) ) ( not ( = ?auto_392947 ?auto_392950 ) ) ( not ( = ?auto_392947 ?auto_392951 ) ) ( not ( = ?auto_392947 ?auto_392952 ) ) ( not ( = ?auto_392947 ?auto_392953 ) ) ( not ( = ?auto_392947 ?auto_392954 ) ) ( not ( = ?auto_392947 ?auto_392955 ) ) ( not ( = ?auto_392948 ?auto_392949 ) ) ( not ( = ?auto_392948 ?auto_392950 ) ) ( not ( = ?auto_392948 ?auto_392951 ) ) ( not ( = ?auto_392948 ?auto_392952 ) ) ( not ( = ?auto_392948 ?auto_392953 ) ) ( not ( = ?auto_392948 ?auto_392954 ) ) ( not ( = ?auto_392948 ?auto_392955 ) ) ( not ( = ?auto_392949 ?auto_392950 ) ) ( not ( = ?auto_392949 ?auto_392951 ) ) ( not ( = ?auto_392949 ?auto_392952 ) ) ( not ( = ?auto_392949 ?auto_392953 ) ) ( not ( = ?auto_392949 ?auto_392954 ) ) ( not ( = ?auto_392949 ?auto_392955 ) ) ( not ( = ?auto_392950 ?auto_392951 ) ) ( not ( = ?auto_392950 ?auto_392952 ) ) ( not ( = ?auto_392950 ?auto_392953 ) ) ( not ( = ?auto_392950 ?auto_392954 ) ) ( not ( = ?auto_392950 ?auto_392955 ) ) ( not ( = ?auto_392951 ?auto_392952 ) ) ( not ( = ?auto_392951 ?auto_392953 ) ) ( not ( = ?auto_392951 ?auto_392954 ) ) ( not ( = ?auto_392951 ?auto_392955 ) ) ( not ( = ?auto_392952 ?auto_392953 ) ) ( not ( = ?auto_392952 ?auto_392954 ) ) ( not ( = ?auto_392952 ?auto_392955 ) ) ( not ( = ?auto_392953 ?auto_392954 ) ) ( not ( = ?auto_392953 ?auto_392955 ) ) ( not ( = ?auto_392954 ?auto_392955 ) ) ( ON ?auto_392953 ?auto_392954 ) ( ON ?auto_392952 ?auto_392953 ) ( CLEAR ?auto_392950 ) ( ON ?auto_392951 ?auto_392952 ) ( CLEAR ?auto_392951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_392946 ?auto_392947 ?auto_392948 ?auto_392949 ?auto_392950 ?auto_392951 )
      ( MAKE-9PILE ?auto_392946 ?auto_392947 ?auto_392948 ?auto_392949 ?auto_392950 ?auto_392951 ?auto_392952 ?auto_392953 ?auto_392954 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392965 - BLOCK
      ?auto_392966 - BLOCK
      ?auto_392967 - BLOCK
      ?auto_392968 - BLOCK
      ?auto_392969 - BLOCK
      ?auto_392970 - BLOCK
      ?auto_392971 - BLOCK
      ?auto_392972 - BLOCK
      ?auto_392973 - BLOCK
    )
    :vars
    (
      ?auto_392974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392973 ?auto_392974 ) ( ON-TABLE ?auto_392965 ) ( ON ?auto_392966 ?auto_392965 ) ( ON ?auto_392967 ?auto_392966 ) ( ON ?auto_392968 ?auto_392967 ) ( not ( = ?auto_392965 ?auto_392966 ) ) ( not ( = ?auto_392965 ?auto_392967 ) ) ( not ( = ?auto_392965 ?auto_392968 ) ) ( not ( = ?auto_392965 ?auto_392969 ) ) ( not ( = ?auto_392965 ?auto_392970 ) ) ( not ( = ?auto_392965 ?auto_392971 ) ) ( not ( = ?auto_392965 ?auto_392972 ) ) ( not ( = ?auto_392965 ?auto_392973 ) ) ( not ( = ?auto_392965 ?auto_392974 ) ) ( not ( = ?auto_392966 ?auto_392967 ) ) ( not ( = ?auto_392966 ?auto_392968 ) ) ( not ( = ?auto_392966 ?auto_392969 ) ) ( not ( = ?auto_392966 ?auto_392970 ) ) ( not ( = ?auto_392966 ?auto_392971 ) ) ( not ( = ?auto_392966 ?auto_392972 ) ) ( not ( = ?auto_392966 ?auto_392973 ) ) ( not ( = ?auto_392966 ?auto_392974 ) ) ( not ( = ?auto_392967 ?auto_392968 ) ) ( not ( = ?auto_392967 ?auto_392969 ) ) ( not ( = ?auto_392967 ?auto_392970 ) ) ( not ( = ?auto_392967 ?auto_392971 ) ) ( not ( = ?auto_392967 ?auto_392972 ) ) ( not ( = ?auto_392967 ?auto_392973 ) ) ( not ( = ?auto_392967 ?auto_392974 ) ) ( not ( = ?auto_392968 ?auto_392969 ) ) ( not ( = ?auto_392968 ?auto_392970 ) ) ( not ( = ?auto_392968 ?auto_392971 ) ) ( not ( = ?auto_392968 ?auto_392972 ) ) ( not ( = ?auto_392968 ?auto_392973 ) ) ( not ( = ?auto_392968 ?auto_392974 ) ) ( not ( = ?auto_392969 ?auto_392970 ) ) ( not ( = ?auto_392969 ?auto_392971 ) ) ( not ( = ?auto_392969 ?auto_392972 ) ) ( not ( = ?auto_392969 ?auto_392973 ) ) ( not ( = ?auto_392969 ?auto_392974 ) ) ( not ( = ?auto_392970 ?auto_392971 ) ) ( not ( = ?auto_392970 ?auto_392972 ) ) ( not ( = ?auto_392970 ?auto_392973 ) ) ( not ( = ?auto_392970 ?auto_392974 ) ) ( not ( = ?auto_392971 ?auto_392972 ) ) ( not ( = ?auto_392971 ?auto_392973 ) ) ( not ( = ?auto_392971 ?auto_392974 ) ) ( not ( = ?auto_392972 ?auto_392973 ) ) ( not ( = ?auto_392972 ?auto_392974 ) ) ( not ( = ?auto_392973 ?auto_392974 ) ) ( ON ?auto_392972 ?auto_392973 ) ( ON ?auto_392971 ?auto_392972 ) ( ON ?auto_392970 ?auto_392971 ) ( CLEAR ?auto_392968 ) ( ON ?auto_392969 ?auto_392970 ) ( CLEAR ?auto_392969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392965 ?auto_392966 ?auto_392967 ?auto_392968 ?auto_392969 )
      ( MAKE-9PILE ?auto_392965 ?auto_392966 ?auto_392967 ?auto_392968 ?auto_392969 ?auto_392970 ?auto_392971 ?auto_392972 ?auto_392973 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_392984 - BLOCK
      ?auto_392985 - BLOCK
      ?auto_392986 - BLOCK
      ?auto_392987 - BLOCK
      ?auto_392988 - BLOCK
      ?auto_392989 - BLOCK
      ?auto_392990 - BLOCK
      ?auto_392991 - BLOCK
      ?auto_392992 - BLOCK
    )
    :vars
    (
      ?auto_392993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_392992 ?auto_392993 ) ( ON-TABLE ?auto_392984 ) ( ON ?auto_392985 ?auto_392984 ) ( ON ?auto_392986 ?auto_392985 ) ( ON ?auto_392987 ?auto_392986 ) ( not ( = ?auto_392984 ?auto_392985 ) ) ( not ( = ?auto_392984 ?auto_392986 ) ) ( not ( = ?auto_392984 ?auto_392987 ) ) ( not ( = ?auto_392984 ?auto_392988 ) ) ( not ( = ?auto_392984 ?auto_392989 ) ) ( not ( = ?auto_392984 ?auto_392990 ) ) ( not ( = ?auto_392984 ?auto_392991 ) ) ( not ( = ?auto_392984 ?auto_392992 ) ) ( not ( = ?auto_392984 ?auto_392993 ) ) ( not ( = ?auto_392985 ?auto_392986 ) ) ( not ( = ?auto_392985 ?auto_392987 ) ) ( not ( = ?auto_392985 ?auto_392988 ) ) ( not ( = ?auto_392985 ?auto_392989 ) ) ( not ( = ?auto_392985 ?auto_392990 ) ) ( not ( = ?auto_392985 ?auto_392991 ) ) ( not ( = ?auto_392985 ?auto_392992 ) ) ( not ( = ?auto_392985 ?auto_392993 ) ) ( not ( = ?auto_392986 ?auto_392987 ) ) ( not ( = ?auto_392986 ?auto_392988 ) ) ( not ( = ?auto_392986 ?auto_392989 ) ) ( not ( = ?auto_392986 ?auto_392990 ) ) ( not ( = ?auto_392986 ?auto_392991 ) ) ( not ( = ?auto_392986 ?auto_392992 ) ) ( not ( = ?auto_392986 ?auto_392993 ) ) ( not ( = ?auto_392987 ?auto_392988 ) ) ( not ( = ?auto_392987 ?auto_392989 ) ) ( not ( = ?auto_392987 ?auto_392990 ) ) ( not ( = ?auto_392987 ?auto_392991 ) ) ( not ( = ?auto_392987 ?auto_392992 ) ) ( not ( = ?auto_392987 ?auto_392993 ) ) ( not ( = ?auto_392988 ?auto_392989 ) ) ( not ( = ?auto_392988 ?auto_392990 ) ) ( not ( = ?auto_392988 ?auto_392991 ) ) ( not ( = ?auto_392988 ?auto_392992 ) ) ( not ( = ?auto_392988 ?auto_392993 ) ) ( not ( = ?auto_392989 ?auto_392990 ) ) ( not ( = ?auto_392989 ?auto_392991 ) ) ( not ( = ?auto_392989 ?auto_392992 ) ) ( not ( = ?auto_392989 ?auto_392993 ) ) ( not ( = ?auto_392990 ?auto_392991 ) ) ( not ( = ?auto_392990 ?auto_392992 ) ) ( not ( = ?auto_392990 ?auto_392993 ) ) ( not ( = ?auto_392991 ?auto_392992 ) ) ( not ( = ?auto_392991 ?auto_392993 ) ) ( not ( = ?auto_392992 ?auto_392993 ) ) ( ON ?auto_392991 ?auto_392992 ) ( ON ?auto_392990 ?auto_392991 ) ( ON ?auto_392989 ?auto_392990 ) ( CLEAR ?auto_392987 ) ( ON ?auto_392988 ?auto_392989 ) ( CLEAR ?auto_392988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_392984 ?auto_392985 ?auto_392986 ?auto_392987 ?auto_392988 )
      ( MAKE-9PILE ?auto_392984 ?auto_392985 ?auto_392986 ?auto_392987 ?auto_392988 ?auto_392989 ?auto_392990 ?auto_392991 ?auto_392992 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393003 - BLOCK
      ?auto_393004 - BLOCK
      ?auto_393005 - BLOCK
      ?auto_393006 - BLOCK
      ?auto_393007 - BLOCK
      ?auto_393008 - BLOCK
      ?auto_393009 - BLOCK
      ?auto_393010 - BLOCK
      ?auto_393011 - BLOCK
    )
    :vars
    (
      ?auto_393012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393011 ?auto_393012 ) ( ON-TABLE ?auto_393003 ) ( ON ?auto_393004 ?auto_393003 ) ( ON ?auto_393005 ?auto_393004 ) ( not ( = ?auto_393003 ?auto_393004 ) ) ( not ( = ?auto_393003 ?auto_393005 ) ) ( not ( = ?auto_393003 ?auto_393006 ) ) ( not ( = ?auto_393003 ?auto_393007 ) ) ( not ( = ?auto_393003 ?auto_393008 ) ) ( not ( = ?auto_393003 ?auto_393009 ) ) ( not ( = ?auto_393003 ?auto_393010 ) ) ( not ( = ?auto_393003 ?auto_393011 ) ) ( not ( = ?auto_393003 ?auto_393012 ) ) ( not ( = ?auto_393004 ?auto_393005 ) ) ( not ( = ?auto_393004 ?auto_393006 ) ) ( not ( = ?auto_393004 ?auto_393007 ) ) ( not ( = ?auto_393004 ?auto_393008 ) ) ( not ( = ?auto_393004 ?auto_393009 ) ) ( not ( = ?auto_393004 ?auto_393010 ) ) ( not ( = ?auto_393004 ?auto_393011 ) ) ( not ( = ?auto_393004 ?auto_393012 ) ) ( not ( = ?auto_393005 ?auto_393006 ) ) ( not ( = ?auto_393005 ?auto_393007 ) ) ( not ( = ?auto_393005 ?auto_393008 ) ) ( not ( = ?auto_393005 ?auto_393009 ) ) ( not ( = ?auto_393005 ?auto_393010 ) ) ( not ( = ?auto_393005 ?auto_393011 ) ) ( not ( = ?auto_393005 ?auto_393012 ) ) ( not ( = ?auto_393006 ?auto_393007 ) ) ( not ( = ?auto_393006 ?auto_393008 ) ) ( not ( = ?auto_393006 ?auto_393009 ) ) ( not ( = ?auto_393006 ?auto_393010 ) ) ( not ( = ?auto_393006 ?auto_393011 ) ) ( not ( = ?auto_393006 ?auto_393012 ) ) ( not ( = ?auto_393007 ?auto_393008 ) ) ( not ( = ?auto_393007 ?auto_393009 ) ) ( not ( = ?auto_393007 ?auto_393010 ) ) ( not ( = ?auto_393007 ?auto_393011 ) ) ( not ( = ?auto_393007 ?auto_393012 ) ) ( not ( = ?auto_393008 ?auto_393009 ) ) ( not ( = ?auto_393008 ?auto_393010 ) ) ( not ( = ?auto_393008 ?auto_393011 ) ) ( not ( = ?auto_393008 ?auto_393012 ) ) ( not ( = ?auto_393009 ?auto_393010 ) ) ( not ( = ?auto_393009 ?auto_393011 ) ) ( not ( = ?auto_393009 ?auto_393012 ) ) ( not ( = ?auto_393010 ?auto_393011 ) ) ( not ( = ?auto_393010 ?auto_393012 ) ) ( not ( = ?auto_393011 ?auto_393012 ) ) ( ON ?auto_393010 ?auto_393011 ) ( ON ?auto_393009 ?auto_393010 ) ( ON ?auto_393008 ?auto_393009 ) ( ON ?auto_393007 ?auto_393008 ) ( CLEAR ?auto_393005 ) ( ON ?auto_393006 ?auto_393007 ) ( CLEAR ?auto_393006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393003 ?auto_393004 ?auto_393005 ?auto_393006 )
      ( MAKE-9PILE ?auto_393003 ?auto_393004 ?auto_393005 ?auto_393006 ?auto_393007 ?auto_393008 ?auto_393009 ?auto_393010 ?auto_393011 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393022 - BLOCK
      ?auto_393023 - BLOCK
      ?auto_393024 - BLOCK
      ?auto_393025 - BLOCK
      ?auto_393026 - BLOCK
      ?auto_393027 - BLOCK
      ?auto_393028 - BLOCK
      ?auto_393029 - BLOCK
      ?auto_393030 - BLOCK
    )
    :vars
    (
      ?auto_393031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393030 ?auto_393031 ) ( ON-TABLE ?auto_393022 ) ( ON ?auto_393023 ?auto_393022 ) ( ON ?auto_393024 ?auto_393023 ) ( not ( = ?auto_393022 ?auto_393023 ) ) ( not ( = ?auto_393022 ?auto_393024 ) ) ( not ( = ?auto_393022 ?auto_393025 ) ) ( not ( = ?auto_393022 ?auto_393026 ) ) ( not ( = ?auto_393022 ?auto_393027 ) ) ( not ( = ?auto_393022 ?auto_393028 ) ) ( not ( = ?auto_393022 ?auto_393029 ) ) ( not ( = ?auto_393022 ?auto_393030 ) ) ( not ( = ?auto_393022 ?auto_393031 ) ) ( not ( = ?auto_393023 ?auto_393024 ) ) ( not ( = ?auto_393023 ?auto_393025 ) ) ( not ( = ?auto_393023 ?auto_393026 ) ) ( not ( = ?auto_393023 ?auto_393027 ) ) ( not ( = ?auto_393023 ?auto_393028 ) ) ( not ( = ?auto_393023 ?auto_393029 ) ) ( not ( = ?auto_393023 ?auto_393030 ) ) ( not ( = ?auto_393023 ?auto_393031 ) ) ( not ( = ?auto_393024 ?auto_393025 ) ) ( not ( = ?auto_393024 ?auto_393026 ) ) ( not ( = ?auto_393024 ?auto_393027 ) ) ( not ( = ?auto_393024 ?auto_393028 ) ) ( not ( = ?auto_393024 ?auto_393029 ) ) ( not ( = ?auto_393024 ?auto_393030 ) ) ( not ( = ?auto_393024 ?auto_393031 ) ) ( not ( = ?auto_393025 ?auto_393026 ) ) ( not ( = ?auto_393025 ?auto_393027 ) ) ( not ( = ?auto_393025 ?auto_393028 ) ) ( not ( = ?auto_393025 ?auto_393029 ) ) ( not ( = ?auto_393025 ?auto_393030 ) ) ( not ( = ?auto_393025 ?auto_393031 ) ) ( not ( = ?auto_393026 ?auto_393027 ) ) ( not ( = ?auto_393026 ?auto_393028 ) ) ( not ( = ?auto_393026 ?auto_393029 ) ) ( not ( = ?auto_393026 ?auto_393030 ) ) ( not ( = ?auto_393026 ?auto_393031 ) ) ( not ( = ?auto_393027 ?auto_393028 ) ) ( not ( = ?auto_393027 ?auto_393029 ) ) ( not ( = ?auto_393027 ?auto_393030 ) ) ( not ( = ?auto_393027 ?auto_393031 ) ) ( not ( = ?auto_393028 ?auto_393029 ) ) ( not ( = ?auto_393028 ?auto_393030 ) ) ( not ( = ?auto_393028 ?auto_393031 ) ) ( not ( = ?auto_393029 ?auto_393030 ) ) ( not ( = ?auto_393029 ?auto_393031 ) ) ( not ( = ?auto_393030 ?auto_393031 ) ) ( ON ?auto_393029 ?auto_393030 ) ( ON ?auto_393028 ?auto_393029 ) ( ON ?auto_393027 ?auto_393028 ) ( ON ?auto_393026 ?auto_393027 ) ( CLEAR ?auto_393024 ) ( ON ?auto_393025 ?auto_393026 ) ( CLEAR ?auto_393025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393022 ?auto_393023 ?auto_393024 ?auto_393025 )
      ( MAKE-9PILE ?auto_393022 ?auto_393023 ?auto_393024 ?auto_393025 ?auto_393026 ?auto_393027 ?auto_393028 ?auto_393029 ?auto_393030 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393041 - BLOCK
      ?auto_393042 - BLOCK
      ?auto_393043 - BLOCK
      ?auto_393044 - BLOCK
      ?auto_393045 - BLOCK
      ?auto_393046 - BLOCK
      ?auto_393047 - BLOCK
      ?auto_393048 - BLOCK
      ?auto_393049 - BLOCK
    )
    :vars
    (
      ?auto_393050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393049 ?auto_393050 ) ( ON-TABLE ?auto_393041 ) ( ON ?auto_393042 ?auto_393041 ) ( not ( = ?auto_393041 ?auto_393042 ) ) ( not ( = ?auto_393041 ?auto_393043 ) ) ( not ( = ?auto_393041 ?auto_393044 ) ) ( not ( = ?auto_393041 ?auto_393045 ) ) ( not ( = ?auto_393041 ?auto_393046 ) ) ( not ( = ?auto_393041 ?auto_393047 ) ) ( not ( = ?auto_393041 ?auto_393048 ) ) ( not ( = ?auto_393041 ?auto_393049 ) ) ( not ( = ?auto_393041 ?auto_393050 ) ) ( not ( = ?auto_393042 ?auto_393043 ) ) ( not ( = ?auto_393042 ?auto_393044 ) ) ( not ( = ?auto_393042 ?auto_393045 ) ) ( not ( = ?auto_393042 ?auto_393046 ) ) ( not ( = ?auto_393042 ?auto_393047 ) ) ( not ( = ?auto_393042 ?auto_393048 ) ) ( not ( = ?auto_393042 ?auto_393049 ) ) ( not ( = ?auto_393042 ?auto_393050 ) ) ( not ( = ?auto_393043 ?auto_393044 ) ) ( not ( = ?auto_393043 ?auto_393045 ) ) ( not ( = ?auto_393043 ?auto_393046 ) ) ( not ( = ?auto_393043 ?auto_393047 ) ) ( not ( = ?auto_393043 ?auto_393048 ) ) ( not ( = ?auto_393043 ?auto_393049 ) ) ( not ( = ?auto_393043 ?auto_393050 ) ) ( not ( = ?auto_393044 ?auto_393045 ) ) ( not ( = ?auto_393044 ?auto_393046 ) ) ( not ( = ?auto_393044 ?auto_393047 ) ) ( not ( = ?auto_393044 ?auto_393048 ) ) ( not ( = ?auto_393044 ?auto_393049 ) ) ( not ( = ?auto_393044 ?auto_393050 ) ) ( not ( = ?auto_393045 ?auto_393046 ) ) ( not ( = ?auto_393045 ?auto_393047 ) ) ( not ( = ?auto_393045 ?auto_393048 ) ) ( not ( = ?auto_393045 ?auto_393049 ) ) ( not ( = ?auto_393045 ?auto_393050 ) ) ( not ( = ?auto_393046 ?auto_393047 ) ) ( not ( = ?auto_393046 ?auto_393048 ) ) ( not ( = ?auto_393046 ?auto_393049 ) ) ( not ( = ?auto_393046 ?auto_393050 ) ) ( not ( = ?auto_393047 ?auto_393048 ) ) ( not ( = ?auto_393047 ?auto_393049 ) ) ( not ( = ?auto_393047 ?auto_393050 ) ) ( not ( = ?auto_393048 ?auto_393049 ) ) ( not ( = ?auto_393048 ?auto_393050 ) ) ( not ( = ?auto_393049 ?auto_393050 ) ) ( ON ?auto_393048 ?auto_393049 ) ( ON ?auto_393047 ?auto_393048 ) ( ON ?auto_393046 ?auto_393047 ) ( ON ?auto_393045 ?auto_393046 ) ( ON ?auto_393044 ?auto_393045 ) ( CLEAR ?auto_393042 ) ( ON ?auto_393043 ?auto_393044 ) ( CLEAR ?auto_393043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393041 ?auto_393042 ?auto_393043 )
      ( MAKE-9PILE ?auto_393041 ?auto_393042 ?auto_393043 ?auto_393044 ?auto_393045 ?auto_393046 ?auto_393047 ?auto_393048 ?auto_393049 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393060 - BLOCK
      ?auto_393061 - BLOCK
      ?auto_393062 - BLOCK
      ?auto_393063 - BLOCK
      ?auto_393064 - BLOCK
      ?auto_393065 - BLOCK
      ?auto_393066 - BLOCK
      ?auto_393067 - BLOCK
      ?auto_393068 - BLOCK
    )
    :vars
    (
      ?auto_393069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393068 ?auto_393069 ) ( ON-TABLE ?auto_393060 ) ( ON ?auto_393061 ?auto_393060 ) ( not ( = ?auto_393060 ?auto_393061 ) ) ( not ( = ?auto_393060 ?auto_393062 ) ) ( not ( = ?auto_393060 ?auto_393063 ) ) ( not ( = ?auto_393060 ?auto_393064 ) ) ( not ( = ?auto_393060 ?auto_393065 ) ) ( not ( = ?auto_393060 ?auto_393066 ) ) ( not ( = ?auto_393060 ?auto_393067 ) ) ( not ( = ?auto_393060 ?auto_393068 ) ) ( not ( = ?auto_393060 ?auto_393069 ) ) ( not ( = ?auto_393061 ?auto_393062 ) ) ( not ( = ?auto_393061 ?auto_393063 ) ) ( not ( = ?auto_393061 ?auto_393064 ) ) ( not ( = ?auto_393061 ?auto_393065 ) ) ( not ( = ?auto_393061 ?auto_393066 ) ) ( not ( = ?auto_393061 ?auto_393067 ) ) ( not ( = ?auto_393061 ?auto_393068 ) ) ( not ( = ?auto_393061 ?auto_393069 ) ) ( not ( = ?auto_393062 ?auto_393063 ) ) ( not ( = ?auto_393062 ?auto_393064 ) ) ( not ( = ?auto_393062 ?auto_393065 ) ) ( not ( = ?auto_393062 ?auto_393066 ) ) ( not ( = ?auto_393062 ?auto_393067 ) ) ( not ( = ?auto_393062 ?auto_393068 ) ) ( not ( = ?auto_393062 ?auto_393069 ) ) ( not ( = ?auto_393063 ?auto_393064 ) ) ( not ( = ?auto_393063 ?auto_393065 ) ) ( not ( = ?auto_393063 ?auto_393066 ) ) ( not ( = ?auto_393063 ?auto_393067 ) ) ( not ( = ?auto_393063 ?auto_393068 ) ) ( not ( = ?auto_393063 ?auto_393069 ) ) ( not ( = ?auto_393064 ?auto_393065 ) ) ( not ( = ?auto_393064 ?auto_393066 ) ) ( not ( = ?auto_393064 ?auto_393067 ) ) ( not ( = ?auto_393064 ?auto_393068 ) ) ( not ( = ?auto_393064 ?auto_393069 ) ) ( not ( = ?auto_393065 ?auto_393066 ) ) ( not ( = ?auto_393065 ?auto_393067 ) ) ( not ( = ?auto_393065 ?auto_393068 ) ) ( not ( = ?auto_393065 ?auto_393069 ) ) ( not ( = ?auto_393066 ?auto_393067 ) ) ( not ( = ?auto_393066 ?auto_393068 ) ) ( not ( = ?auto_393066 ?auto_393069 ) ) ( not ( = ?auto_393067 ?auto_393068 ) ) ( not ( = ?auto_393067 ?auto_393069 ) ) ( not ( = ?auto_393068 ?auto_393069 ) ) ( ON ?auto_393067 ?auto_393068 ) ( ON ?auto_393066 ?auto_393067 ) ( ON ?auto_393065 ?auto_393066 ) ( ON ?auto_393064 ?auto_393065 ) ( ON ?auto_393063 ?auto_393064 ) ( CLEAR ?auto_393061 ) ( ON ?auto_393062 ?auto_393063 ) ( CLEAR ?auto_393062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393060 ?auto_393061 ?auto_393062 )
      ( MAKE-9PILE ?auto_393060 ?auto_393061 ?auto_393062 ?auto_393063 ?auto_393064 ?auto_393065 ?auto_393066 ?auto_393067 ?auto_393068 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393079 - BLOCK
      ?auto_393080 - BLOCK
      ?auto_393081 - BLOCK
      ?auto_393082 - BLOCK
      ?auto_393083 - BLOCK
      ?auto_393084 - BLOCK
      ?auto_393085 - BLOCK
      ?auto_393086 - BLOCK
      ?auto_393087 - BLOCK
    )
    :vars
    (
      ?auto_393088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393087 ?auto_393088 ) ( ON-TABLE ?auto_393079 ) ( not ( = ?auto_393079 ?auto_393080 ) ) ( not ( = ?auto_393079 ?auto_393081 ) ) ( not ( = ?auto_393079 ?auto_393082 ) ) ( not ( = ?auto_393079 ?auto_393083 ) ) ( not ( = ?auto_393079 ?auto_393084 ) ) ( not ( = ?auto_393079 ?auto_393085 ) ) ( not ( = ?auto_393079 ?auto_393086 ) ) ( not ( = ?auto_393079 ?auto_393087 ) ) ( not ( = ?auto_393079 ?auto_393088 ) ) ( not ( = ?auto_393080 ?auto_393081 ) ) ( not ( = ?auto_393080 ?auto_393082 ) ) ( not ( = ?auto_393080 ?auto_393083 ) ) ( not ( = ?auto_393080 ?auto_393084 ) ) ( not ( = ?auto_393080 ?auto_393085 ) ) ( not ( = ?auto_393080 ?auto_393086 ) ) ( not ( = ?auto_393080 ?auto_393087 ) ) ( not ( = ?auto_393080 ?auto_393088 ) ) ( not ( = ?auto_393081 ?auto_393082 ) ) ( not ( = ?auto_393081 ?auto_393083 ) ) ( not ( = ?auto_393081 ?auto_393084 ) ) ( not ( = ?auto_393081 ?auto_393085 ) ) ( not ( = ?auto_393081 ?auto_393086 ) ) ( not ( = ?auto_393081 ?auto_393087 ) ) ( not ( = ?auto_393081 ?auto_393088 ) ) ( not ( = ?auto_393082 ?auto_393083 ) ) ( not ( = ?auto_393082 ?auto_393084 ) ) ( not ( = ?auto_393082 ?auto_393085 ) ) ( not ( = ?auto_393082 ?auto_393086 ) ) ( not ( = ?auto_393082 ?auto_393087 ) ) ( not ( = ?auto_393082 ?auto_393088 ) ) ( not ( = ?auto_393083 ?auto_393084 ) ) ( not ( = ?auto_393083 ?auto_393085 ) ) ( not ( = ?auto_393083 ?auto_393086 ) ) ( not ( = ?auto_393083 ?auto_393087 ) ) ( not ( = ?auto_393083 ?auto_393088 ) ) ( not ( = ?auto_393084 ?auto_393085 ) ) ( not ( = ?auto_393084 ?auto_393086 ) ) ( not ( = ?auto_393084 ?auto_393087 ) ) ( not ( = ?auto_393084 ?auto_393088 ) ) ( not ( = ?auto_393085 ?auto_393086 ) ) ( not ( = ?auto_393085 ?auto_393087 ) ) ( not ( = ?auto_393085 ?auto_393088 ) ) ( not ( = ?auto_393086 ?auto_393087 ) ) ( not ( = ?auto_393086 ?auto_393088 ) ) ( not ( = ?auto_393087 ?auto_393088 ) ) ( ON ?auto_393086 ?auto_393087 ) ( ON ?auto_393085 ?auto_393086 ) ( ON ?auto_393084 ?auto_393085 ) ( ON ?auto_393083 ?auto_393084 ) ( ON ?auto_393082 ?auto_393083 ) ( ON ?auto_393081 ?auto_393082 ) ( CLEAR ?auto_393079 ) ( ON ?auto_393080 ?auto_393081 ) ( CLEAR ?auto_393080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_393079 ?auto_393080 )
      ( MAKE-9PILE ?auto_393079 ?auto_393080 ?auto_393081 ?auto_393082 ?auto_393083 ?auto_393084 ?auto_393085 ?auto_393086 ?auto_393087 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393098 - BLOCK
      ?auto_393099 - BLOCK
      ?auto_393100 - BLOCK
      ?auto_393101 - BLOCK
      ?auto_393102 - BLOCK
      ?auto_393103 - BLOCK
      ?auto_393104 - BLOCK
      ?auto_393105 - BLOCK
      ?auto_393106 - BLOCK
    )
    :vars
    (
      ?auto_393107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393106 ?auto_393107 ) ( ON-TABLE ?auto_393098 ) ( not ( = ?auto_393098 ?auto_393099 ) ) ( not ( = ?auto_393098 ?auto_393100 ) ) ( not ( = ?auto_393098 ?auto_393101 ) ) ( not ( = ?auto_393098 ?auto_393102 ) ) ( not ( = ?auto_393098 ?auto_393103 ) ) ( not ( = ?auto_393098 ?auto_393104 ) ) ( not ( = ?auto_393098 ?auto_393105 ) ) ( not ( = ?auto_393098 ?auto_393106 ) ) ( not ( = ?auto_393098 ?auto_393107 ) ) ( not ( = ?auto_393099 ?auto_393100 ) ) ( not ( = ?auto_393099 ?auto_393101 ) ) ( not ( = ?auto_393099 ?auto_393102 ) ) ( not ( = ?auto_393099 ?auto_393103 ) ) ( not ( = ?auto_393099 ?auto_393104 ) ) ( not ( = ?auto_393099 ?auto_393105 ) ) ( not ( = ?auto_393099 ?auto_393106 ) ) ( not ( = ?auto_393099 ?auto_393107 ) ) ( not ( = ?auto_393100 ?auto_393101 ) ) ( not ( = ?auto_393100 ?auto_393102 ) ) ( not ( = ?auto_393100 ?auto_393103 ) ) ( not ( = ?auto_393100 ?auto_393104 ) ) ( not ( = ?auto_393100 ?auto_393105 ) ) ( not ( = ?auto_393100 ?auto_393106 ) ) ( not ( = ?auto_393100 ?auto_393107 ) ) ( not ( = ?auto_393101 ?auto_393102 ) ) ( not ( = ?auto_393101 ?auto_393103 ) ) ( not ( = ?auto_393101 ?auto_393104 ) ) ( not ( = ?auto_393101 ?auto_393105 ) ) ( not ( = ?auto_393101 ?auto_393106 ) ) ( not ( = ?auto_393101 ?auto_393107 ) ) ( not ( = ?auto_393102 ?auto_393103 ) ) ( not ( = ?auto_393102 ?auto_393104 ) ) ( not ( = ?auto_393102 ?auto_393105 ) ) ( not ( = ?auto_393102 ?auto_393106 ) ) ( not ( = ?auto_393102 ?auto_393107 ) ) ( not ( = ?auto_393103 ?auto_393104 ) ) ( not ( = ?auto_393103 ?auto_393105 ) ) ( not ( = ?auto_393103 ?auto_393106 ) ) ( not ( = ?auto_393103 ?auto_393107 ) ) ( not ( = ?auto_393104 ?auto_393105 ) ) ( not ( = ?auto_393104 ?auto_393106 ) ) ( not ( = ?auto_393104 ?auto_393107 ) ) ( not ( = ?auto_393105 ?auto_393106 ) ) ( not ( = ?auto_393105 ?auto_393107 ) ) ( not ( = ?auto_393106 ?auto_393107 ) ) ( ON ?auto_393105 ?auto_393106 ) ( ON ?auto_393104 ?auto_393105 ) ( ON ?auto_393103 ?auto_393104 ) ( ON ?auto_393102 ?auto_393103 ) ( ON ?auto_393101 ?auto_393102 ) ( ON ?auto_393100 ?auto_393101 ) ( CLEAR ?auto_393098 ) ( ON ?auto_393099 ?auto_393100 ) ( CLEAR ?auto_393099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_393098 ?auto_393099 )
      ( MAKE-9PILE ?auto_393098 ?auto_393099 ?auto_393100 ?auto_393101 ?auto_393102 ?auto_393103 ?auto_393104 ?auto_393105 ?auto_393106 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393117 - BLOCK
      ?auto_393118 - BLOCK
      ?auto_393119 - BLOCK
      ?auto_393120 - BLOCK
      ?auto_393121 - BLOCK
      ?auto_393122 - BLOCK
      ?auto_393123 - BLOCK
      ?auto_393124 - BLOCK
      ?auto_393125 - BLOCK
    )
    :vars
    (
      ?auto_393126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393125 ?auto_393126 ) ( not ( = ?auto_393117 ?auto_393118 ) ) ( not ( = ?auto_393117 ?auto_393119 ) ) ( not ( = ?auto_393117 ?auto_393120 ) ) ( not ( = ?auto_393117 ?auto_393121 ) ) ( not ( = ?auto_393117 ?auto_393122 ) ) ( not ( = ?auto_393117 ?auto_393123 ) ) ( not ( = ?auto_393117 ?auto_393124 ) ) ( not ( = ?auto_393117 ?auto_393125 ) ) ( not ( = ?auto_393117 ?auto_393126 ) ) ( not ( = ?auto_393118 ?auto_393119 ) ) ( not ( = ?auto_393118 ?auto_393120 ) ) ( not ( = ?auto_393118 ?auto_393121 ) ) ( not ( = ?auto_393118 ?auto_393122 ) ) ( not ( = ?auto_393118 ?auto_393123 ) ) ( not ( = ?auto_393118 ?auto_393124 ) ) ( not ( = ?auto_393118 ?auto_393125 ) ) ( not ( = ?auto_393118 ?auto_393126 ) ) ( not ( = ?auto_393119 ?auto_393120 ) ) ( not ( = ?auto_393119 ?auto_393121 ) ) ( not ( = ?auto_393119 ?auto_393122 ) ) ( not ( = ?auto_393119 ?auto_393123 ) ) ( not ( = ?auto_393119 ?auto_393124 ) ) ( not ( = ?auto_393119 ?auto_393125 ) ) ( not ( = ?auto_393119 ?auto_393126 ) ) ( not ( = ?auto_393120 ?auto_393121 ) ) ( not ( = ?auto_393120 ?auto_393122 ) ) ( not ( = ?auto_393120 ?auto_393123 ) ) ( not ( = ?auto_393120 ?auto_393124 ) ) ( not ( = ?auto_393120 ?auto_393125 ) ) ( not ( = ?auto_393120 ?auto_393126 ) ) ( not ( = ?auto_393121 ?auto_393122 ) ) ( not ( = ?auto_393121 ?auto_393123 ) ) ( not ( = ?auto_393121 ?auto_393124 ) ) ( not ( = ?auto_393121 ?auto_393125 ) ) ( not ( = ?auto_393121 ?auto_393126 ) ) ( not ( = ?auto_393122 ?auto_393123 ) ) ( not ( = ?auto_393122 ?auto_393124 ) ) ( not ( = ?auto_393122 ?auto_393125 ) ) ( not ( = ?auto_393122 ?auto_393126 ) ) ( not ( = ?auto_393123 ?auto_393124 ) ) ( not ( = ?auto_393123 ?auto_393125 ) ) ( not ( = ?auto_393123 ?auto_393126 ) ) ( not ( = ?auto_393124 ?auto_393125 ) ) ( not ( = ?auto_393124 ?auto_393126 ) ) ( not ( = ?auto_393125 ?auto_393126 ) ) ( ON ?auto_393124 ?auto_393125 ) ( ON ?auto_393123 ?auto_393124 ) ( ON ?auto_393122 ?auto_393123 ) ( ON ?auto_393121 ?auto_393122 ) ( ON ?auto_393120 ?auto_393121 ) ( ON ?auto_393119 ?auto_393120 ) ( ON ?auto_393118 ?auto_393119 ) ( ON ?auto_393117 ?auto_393118 ) ( CLEAR ?auto_393117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_393117 )
      ( MAKE-9PILE ?auto_393117 ?auto_393118 ?auto_393119 ?auto_393120 ?auto_393121 ?auto_393122 ?auto_393123 ?auto_393124 ?auto_393125 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_393136 - BLOCK
      ?auto_393137 - BLOCK
      ?auto_393138 - BLOCK
      ?auto_393139 - BLOCK
      ?auto_393140 - BLOCK
      ?auto_393141 - BLOCK
      ?auto_393142 - BLOCK
      ?auto_393143 - BLOCK
      ?auto_393144 - BLOCK
    )
    :vars
    (
      ?auto_393145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393144 ?auto_393145 ) ( not ( = ?auto_393136 ?auto_393137 ) ) ( not ( = ?auto_393136 ?auto_393138 ) ) ( not ( = ?auto_393136 ?auto_393139 ) ) ( not ( = ?auto_393136 ?auto_393140 ) ) ( not ( = ?auto_393136 ?auto_393141 ) ) ( not ( = ?auto_393136 ?auto_393142 ) ) ( not ( = ?auto_393136 ?auto_393143 ) ) ( not ( = ?auto_393136 ?auto_393144 ) ) ( not ( = ?auto_393136 ?auto_393145 ) ) ( not ( = ?auto_393137 ?auto_393138 ) ) ( not ( = ?auto_393137 ?auto_393139 ) ) ( not ( = ?auto_393137 ?auto_393140 ) ) ( not ( = ?auto_393137 ?auto_393141 ) ) ( not ( = ?auto_393137 ?auto_393142 ) ) ( not ( = ?auto_393137 ?auto_393143 ) ) ( not ( = ?auto_393137 ?auto_393144 ) ) ( not ( = ?auto_393137 ?auto_393145 ) ) ( not ( = ?auto_393138 ?auto_393139 ) ) ( not ( = ?auto_393138 ?auto_393140 ) ) ( not ( = ?auto_393138 ?auto_393141 ) ) ( not ( = ?auto_393138 ?auto_393142 ) ) ( not ( = ?auto_393138 ?auto_393143 ) ) ( not ( = ?auto_393138 ?auto_393144 ) ) ( not ( = ?auto_393138 ?auto_393145 ) ) ( not ( = ?auto_393139 ?auto_393140 ) ) ( not ( = ?auto_393139 ?auto_393141 ) ) ( not ( = ?auto_393139 ?auto_393142 ) ) ( not ( = ?auto_393139 ?auto_393143 ) ) ( not ( = ?auto_393139 ?auto_393144 ) ) ( not ( = ?auto_393139 ?auto_393145 ) ) ( not ( = ?auto_393140 ?auto_393141 ) ) ( not ( = ?auto_393140 ?auto_393142 ) ) ( not ( = ?auto_393140 ?auto_393143 ) ) ( not ( = ?auto_393140 ?auto_393144 ) ) ( not ( = ?auto_393140 ?auto_393145 ) ) ( not ( = ?auto_393141 ?auto_393142 ) ) ( not ( = ?auto_393141 ?auto_393143 ) ) ( not ( = ?auto_393141 ?auto_393144 ) ) ( not ( = ?auto_393141 ?auto_393145 ) ) ( not ( = ?auto_393142 ?auto_393143 ) ) ( not ( = ?auto_393142 ?auto_393144 ) ) ( not ( = ?auto_393142 ?auto_393145 ) ) ( not ( = ?auto_393143 ?auto_393144 ) ) ( not ( = ?auto_393143 ?auto_393145 ) ) ( not ( = ?auto_393144 ?auto_393145 ) ) ( ON ?auto_393143 ?auto_393144 ) ( ON ?auto_393142 ?auto_393143 ) ( ON ?auto_393141 ?auto_393142 ) ( ON ?auto_393140 ?auto_393141 ) ( ON ?auto_393139 ?auto_393140 ) ( ON ?auto_393138 ?auto_393139 ) ( ON ?auto_393137 ?auto_393138 ) ( ON ?auto_393136 ?auto_393137 ) ( CLEAR ?auto_393136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_393136 )
      ( MAKE-9PILE ?auto_393136 ?auto_393137 ?auto_393138 ?auto_393139 ?auto_393140 ?auto_393141 ?auto_393142 ?auto_393143 ?auto_393144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393156 - BLOCK
      ?auto_393157 - BLOCK
      ?auto_393158 - BLOCK
      ?auto_393159 - BLOCK
      ?auto_393160 - BLOCK
      ?auto_393161 - BLOCK
      ?auto_393162 - BLOCK
      ?auto_393163 - BLOCK
      ?auto_393164 - BLOCK
      ?auto_393165 - BLOCK
    )
    :vars
    (
      ?auto_393166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_393164 ) ( ON ?auto_393165 ?auto_393166 ) ( CLEAR ?auto_393165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_393156 ) ( ON ?auto_393157 ?auto_393156 ) ( ON ?auto_393158 ?auto_393157 ) ( ON ?auto_393159 ?auto_393158 ) ( ON ?auto_393160 ?auto_393159 ) ( ON ?auto_393161 ?auto_393160 ) ( ON ?auto_393162 ?auto_393161 ) ( ON ?auto_393163 ?auto_393162 ) ( ON ?auto_393164 ?auto_393163 ) ( not ( = ?auto_393156 ?auto_393157 ) ) ( not ( = ?auto_393156 ?auto_393158 ) ) ( not ( = ?auto_393156 ?auto_393159 ) ) ( not ( = ?auto_393156 ?auto_393160 ) ) ( not ( = ?auto_393156 ?auto_393161 ) ) ( not ( = ?auto_393156 ?auto_393162 ) ) ( not ( = ?auto_393156 ?auto_393163 ) ) ( not ( = ?auto_393156 ?auto_393164 ) ) ( not ( = ?auto_393156 ?auto_393165 ) ) ( not ( = ?auto_393156 ?auto_393166 ) ) ( not ( = ?auto_393157 ?auto_393158 ) ) ( not ( = ?auto_393157 ?auto_393159 ) ) ( not ( = ?auto_393157 ?auto_393160 ) ) ( not ( = ?auto_393157 ?auto_393161 ) ) ( not ( = ?auto_393157 ?auto_393162 ) ) ( not ( = ?auto_393157 ?auto_393163 ) ) ( not ( = ?auto_393157 ?auto_393164 ) ) ( not ( = ?auto_393157 ?auto_393165 ) ) ( not ( = ?auto_393157 ?auto_393166 ) ) ( not ( = ?auto_393158 ?auto_393159 ) ) ( not ( = ?auto_393158 ?auto_393160 ) ) ( not ( = ?auto_393158 ?auto_393161 ) ) ( not ( = ?auto_393158 ?auto_393162 ) ) ( not ( = ?auto_393158 ?auto_393163 ) ) ( not ( = ?auto_393158 ?auto_393164 ) ) ( not ( = ?auto_393158 ?auto_393165 ) ) ( not ( = ?auto_393158 ?auto_393166 ) ) ( not ( = ?auto_393159 ?auto_393160 ) ) ( not ( = ?auto_393159 ?auto_393161 ) ) ( not ( = ?auto_393159 ?auto_393162 ) ) ( not ( = ?auto_393159 ?auto_393163 ) ) ( not ( = ?auto_393159 ?auto_393164 ) ) ( not ( = ?auto_393159 ?auto_393165 ) ) ( not ( = ?auto_393159 ?auto_393166 ) ) ( not ( = ?auto_393160 ?auto_393161 ) ) ( not ( = ?auto_393160 ?auto_393162 ) ) ( not ( = ?auto_393160 ?auto_393163 ) ) ( not ( = ?auto_393160 ?auto_393164 ) ) ( not ( = ?auto_393160 ?auto_393165 ) ) ( not ( = ?auto_393160 ?auto_393166 ) ) ( not ( = ?auto_393161 ?auto_393162 ) ) ( not ( = ?auto_393161 ?auto_393163 ) ) ( not ( = ?auto_393161 ?auto_393164 ) ) ( not ( = ?auto_393161 ?auto_393165 ) ) ( not ( = ?auto_393161 ?auto_393166 ) ) ( not ( = ?auto_393162 ?auto_393163 ) ) ( not ( = ?auto_393162 ?auto_393164 ) ) ( not ( = ?auto_393162 ?auto_393165 ) ) ( not ( = ?auto_393162 ?auto_393166 ) ) ( not ( = ?auto_393163 ?auto_393164 ) ) ( not ( = ?auto_393163 ?auto_393165 ) ) ( not ( = ?auto_393163 ?auto_393166 ) ) ( not ( = ?auto_393164 ?auto_393165 ) ) ( not ( = ?auto_393164 ?auto_393166 ) ) ( not ( = ?auto_393165 ?auto_393166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_393165 ?auto_393166 )
      ( !STACK ?auto_393165 ?auto_393164 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393177 - BLOCK
      ?auto_393178 - BLOCK
      ?auto_393179 - BLOCK
      ?auto_393180 - BLOCK
      ?auto_393181 - BLOCK
      ?auto_393182 - BLOCK
      ?auto_393183 - BLOCK
      ?auto_393184 - BLOCK
      ?auto_393185 - BLOCK
      ?auto_393186 - BLOCK
    )
    :vars
    (
      ?auto_393187 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_393185 ) ( ON ?auto_393186 ?auto_393187 ) ( CLEAR ?auto_393186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_393177 ) ( ON ?auto_393178 ?auto_393177 ) ( ON ?auto_393179 ?auto_393178 ) ( ON ?auto_393180 ?auto_393179 ) ( ON ?auto_393181 ?auto_393180 ) ( ON ?auto_393182 ?auto_393181 ) ( ON ?auto_393183 ?auto_393182 ) ( ON ?auto_393184 ?auto_393183 ) ( ON ?auto_393185 ?auto_393184 ) ( not ( = ?auto_393177 ?auto_393178 ) ) ( not ( = ?auto_393177 ?auto_393179 ) ) ( not ( = ?auto_393177 ?auto_393180 ) ) ( not ( = ?auto_393177 ?auto_393181 ) ) ( not ( = ?auto_393177 ?auto_393182 ) ) ( not ( = ?auto_393177 ?auto_393183 ) ) ( not ( = ?auto_393177 ?auto_393184 ) ) ( not ( = ?auto_393177 ?auto_393185 ) ) ( not ( = ?auto_393177 ?auto_393186 ) ) ( not ( = ?auto_393177 ?auto_393187 ) ) ( not ( = ?auto_393178 ?auto_393179 ) ) ( not ( = ?auto_393178 ?auto_393180 ) ) ( not ( = ?auto_393178 ?auto_393181 ) ) ( not ( = ?auto_393178 ?auto_393182 ) ) ( not ( = ?auto_393178 ?auto_393183 ) ) ( not ( = ?auto_393178 ?auto_393184 ) ) ( not ( = ?auto_393178 ?auto_393185 ) ) ( not ( = ?auto_393178 ?auto_393186 ) ) ( not ( = ?auto_393178 ?auto_393187 ) ) ( not ( = ?auto_393179 ?auto_393180 ) ) ( not ( = ?auto_393179 ?auto_393181 ) ) ( not ( = ?auto_393179 ?auto_393182 ) ) ( not ( = ?auto_393179 ?auto_393183 ) ) ( not ( = ?auto_393179 ?auto_393184 ) ) ( not ( = ?auto_393179 ?auto_393185 ) ) ( not ( = ?auto_393179 ?auto_393186 ) ) ( not ( = ?auto_393179 ?auto_393187 ) ) ( not ( = ?auto_393180 ?auto_393181 ) ) ( not ( = ?auto_393180 ?auto_393182 ) ) ( not ( = ?auto_393180 ?auto_393183 ) ) ( not ( = ?auto_393180 ?auto_393184 ) ) ( not ( = ?auto_393180 ?auto_393185 ) ) ( not ( = ?auto_393180 ?auto_393186 ) ) ( not ( = ?auto_393180 ?auto_393187 ) ) ( not ( = ?auto_393181 ?auto_393182 ) ) ( not ( = ?auto_393181 ?auto_393183 ) ) ( not ( = ?auto_393181 ?auto_393184 ) ) ( not ( = ?auto_393181 ?auto_393185 ) ) ( not ( = ?auto_393181 ?auto_393186 ) ) ( not ( = ?auto_393181 ?auto_393187 ) ) ( not ( = ?auto_393182 ?auto_393183 ) ) ( not ( = ?auto_393182 ?auto_393184 ) ) ( not ( = ?auto_393182 ?auto_393185 ) ) ( not ( = ?auto_393182 ?auto_393186 ) ) ( not ( = ?auto_393182 ?auto_393187 ) ) ( not ( = ?auto_393183 ?auto_393184 ) ) ( not ( = ?auto_393183 ?auto_393185 ) ) ( not ( = ?auto_393183 ?auto_393186 ) ) ( not ( = ?auto_393183 ?auto_393187 ) ) ( not ( = ?auto_393184 ?auto_393185 ) ) ( not ( = ?auto_393184 ?auto_393186 ) ) ( not ( = ?auto_393184 ?auto_393187 ) ) ( not ( = ?auto_393185 ?auto_393186 ) ) ( not ( = ?auto_393185 ?auto_393187 ) ) ( not ( = ?auto_393186 ?auto_393187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_393186 ?auto_393187 )
      ( !STACK ?auto_393186 ?auto_393185 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393198 - BLOCK
      ?auto_393199 - BLOCK
      ?auto_393200 - BLOCK
      ?auto_393201 - BLOCK
      ?auto_393202 - BLOCK
      ?auto_393203 - BLOCK
      ?auto_393204 - BLOCK
      ?auto_393205 - BLOCK
      ?auto_393206 - BLOCK
      ?auto_393207 - BLOCK
    )
    :vars
    (
      ?auto_393208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393207 ?auto_393208 ) ( ON-TABLE ?auto_393198 ) ( ON ?auto_393199 ?auto_393198 ) ( ON ?auto_393200 ?auto_393199 ) ( ON ?auto_393201 ?auto_393200 ) ( ON ?auto_393202 ?auto_393201 ) ( ON ?auto_393203 ?auto_393202 ) ( ON ?auto_393204 ?auto_393203 ) ( ON ?auto_393205 ?auto_393204 ) ( not ( = ?auto_393198 ?auto_393199 ) ) ( not ( = ?auto_393198 ?auto_393200 ) ) ( not ( = ?auto_393198 ?auto_393201 ) ) ( not ( = ?auto_393198 ?auto_393202 ) ) ( not ( = ?auto_393198 ?auto_393203 ) ) ( not ( = ?auto_393198 ?auto_393204 ) ) ( not ( = ?auto_393198 ?auto_393205 ) ) ( not ( = ?auto_393198 ?auto_393206 ) ) ( not ( = ?auto_393198 ?auto_393207 ) ) ( not ( = ?auto_393198 ?auto_393208 ) ) ( not ( = ?auto_393199 ?auto_393200 ) ) ( not ( = ?auto_393199 ?auto_393201 ) ) ( not ( = ?auto_393199 ?auto_393202 ) ) ( not ( = ?auto_393199 ?auto_393203 ) ) ( not ( = ?auto_393199 ?auto_393204 ) ) ( not ( = ?auto_393199 ?auto_393205 ) ) ( not ( = ?auto_393199 ?auto_393206 ) ) ( not ( = ?auto_393199 ?auto_393207 ) ) ( not ( = ?auto_393199 ?auto_393208 ) ) ( not ( = ?auto_393200 ?auto_393201 ) ) ( not ( = ?auto_393200 ?auto_393202 ) ) ( not ( = ?auto_393200 ?auto_393203 ) ) ( not ( = ?auto_393200 ?auto_393204 ) ) ( not ( = ?auto_393200 ?auto_393205 ) ) ( not ( = ?auto_393200 ?auto_393206 ) ) ( not ( = ?auto_393200 ?auto_393207 ) ) ( not ( = ?auto_393200 ?auto_393208 ) ) ( not ( = ?auto_393201 ?auto_393202 ) ) ( not ( = ?auto_393201 ?auto_393203 ) ) ( not ( = ?auto_393201 ?auto_393204 ) ) ( not ( = ?auto_393201 ?auto_393205 ) ) ( not ( = ?auto_393201 ?auto_393206 ) ) ( not ( = ?auto_393201 ?auto_393207 ) ) ( not ( = ?auto_393201 ?auto_393208 ) ) ( not ( = ?auto_393202 ?auto_393203 ) ) ( not ( = ?auto_393202 ?auto_393204 ) ) ( not ( = ?auto_393202 ?auto_393205 ) ) ( not ( = ?auto_393202 ?auto_393206 ) ) ( not ( = ?auto_393202 ?auto_393207 ) ) ( not ( = ?auto_393202 ?auto_393208 ) ) ( not ( = ?auto_393203 ?auto_393204 ) ) ( not ( = ?auto_393203 ?auto_393205 ) ) ( not ( = ?auto_393203 ?auto_393206 ) ) ( not ( = ?auto_393203 ?auto_393207 ) ) ( not ( = ?auto_393203 ?auto_393208 ) ) ( not ( = ?auto_393204 ?auto_393205 ) ) ( not ( = ?auto_393204 ?auto_393206 ) ) ( not ( = ?auto_393204 ?auto_393207 ) ) ( not ( = ?auto_393204 ?auto_393208 ) ) ( not ( = ?auto_393205 ?auto_393206 ) ) ( not ( = ?auto_393205 ?auto_393207 ) ) ( not ( = ?auto_393205 ?auto_393208 ) ) ( not ( = ?auto_393206 ?auto_393207 ) ) ( not ( = ?auto_393206 ?auto_393208 ) ) ( not ( = ?auto_393207 ?auto_393208 ) ) ( CLEAR ?auto_393205 ) ( ON ?auto_393206 ?auto_393207 ) ( CLEAR ?auto_393206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_393198 ?auto_393199 ?auto_393200 ?auto_393201 ?auto_393202 ?auto_393203 ?auto_393204 ?auto_393205 ?auto_393206 )
      ( MAKE-10PILE ?auto_393198 ?auto_393199 ?auto_393200 ?auto_393201 ?auto_393202 ?auto_393203 ?auto_393204 ?auto_393205 ?auto_393206 ?auto_393207 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393219 - BLOCK
      ?auto_393220 - BLOCK
      ?auto_393221 - BLOCK
      ?auto_393222 - BLOCK
      ?auto_393223 - BLOCK
      ?auto_393224 - BLOCK
      ?auto_393225 - BLOCK
      ?auto_393226 - BLOCK
      ?auto_393227 - BLOCK
      ?auto_393228 - BLOCK
    )
    :vars
    (
      ?auto_393229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393228 ?auto_393229 ) ( ON-TABLE ?auto_393219 ) ( ON ?auto_393220 ?auto_393219 ) ( ON ?auto_393221 ?auto_393220 ) ( ON ?auto_393222 ?auto_393221 ) ( ON ?auto_393223 ?auto_393222 ) ( ON ?auto_393224 ?auto_393223 ) ( ON ?auto_393225 ?auto_393224 ) ( ON ?auto_393226 ?auto_393225 ) ( not ( = ?auto_393219 ?auto_393220 ) ) ( not ( = ?auto_393219 ?auto_393221 ) ) ( not ( = ?auto_393219 ?auto_393222 ) ) ( not ( = ?auto_393219 ?auto_393223 ) ) ( not ( = ?auto_393219 ?auto_393224 ) ) ( not ( = ?auto_393219 ?auto_393225 ) ) ( not ( = ?auto_393219 ?auto_393226 ) ) ( not ( = ?auto_393219 ?auto_393227 ) ) ( not ( = ?auto_393219 ?auto_393228 ) ) ( not ( = ?auto_393219 ?auto_393229 ) ) ( not ( = ?auto_393220 ?auto_393221 ) ) ( not ( = ?auto_393220 ?auto_393222 ) ) ( not ( = ?auto_393220 ?auto_393223 ) ) ( not ( = ?auto_393220 ?auto_393224 ) ) ( not ( = ?auto_393220 ?auto_393225 ) ) ( not ( = ?auto_393220 ?auto_393226 ) ) ( not ( = ?auto_393220 ?auto_393227 ) ) ( not ( = ?auto_393220 ?auto_393228 ) ) ( not ( = ?auto_393220 ?auto_393229 ) ) ( not ( = ?auto_393221 ?auto_393222 ) ) ( not ( = ?auto_393221 ?auto_393223 ) ) ( not ( = ?auto_393221 ?auto_393224 ) ) ( not ( = ?auto_393221 ?auto_393225 ) ) ( not ( = ?auto_393221 ?auto_393226 ) ) ( not ( = ?auto_393221 ?auto_393227 ) ) ( not ( = ?auto_393221 ?auto_393228 ) ) ( not ( = ?auto_393221 ?auto_393229 ) ) ( not ( = ?auto_393222 ?auto_393223 ) ) ( not ( = ?auto_393222 ?auto_393224 ) ) ( not ( = ?auto_393222 ?auto_393225 ) ) ( not ( = ?auto_393222 ?auto_393226 ) ) ( not ( = ?auto_393222 ?auto_393227 ) ) ( not ( = ?auto_393222 ?auto_393228 ) ) ( not ( = ?auto_393222 ?auto_393229 ) ) ( not ( = ?auto_393223 ?auto_393224 ) ) ( not ( = ?auto_393223 ?auto_393225 ) ) ( not ( = ?auto_393223 ?auto_393226 ) ) ( not ( = ?auto_393223 ?auto_393227 ) ) ( not ( = ?auto_393223 ?auto_393228 ) ) ( not ( = ?auto_393223 ?auto_393229 ) ) ( not ( = ?auto_393224 ?auto_393225 ) ) ( not ( = ?auto_393224 ?auto_393226 ) ) ( not ( = ?auto_393224 ?auto_393227 ) ) ( not ( = ?auto_393224 ?auto_393228 ) ) ( not ( = ?auto_393224 ?auto_393229 ) ) ( not ( = ?auto_393225 ?auto_393226 ) ) ( not ( = ?auto_393225 ?auto_393227 ) ) ( not ( = ?auto_393225 ?auto_393228 ) ) ( not ( = ?auto_393225 ?auto_393229 ) ) ( not ( = ?auto_393226 ?auto_393227 ) ) ( not ( = ?auto_393226 ?auto_393228 ) ) ( not ( = ?auto_393226 ?auto_393229 ) ) ( not ( = ?auto_393227 ?auto_393228 ) ) ( not ( = ?auto_393227 ?auto_393229 ) ) ( not ( = ?auto_393228 ?auto_393229 ) ) ( CLEAR ?auto_393226 ) ( ON ?auto_393227 ?auto_393228 ) ( CLEAR ?auto_393227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_393219 ?auto_393220 ?auto_393221 ?auto_393222 ?auto_393223 ?auto_393224 ?auto_393225 ?auto_393226 ?auto_393227 )
      ( MAKE-10PILE ?auto_393219 ?auto_393220 ?auto_393221 ?auto_393222 ?auto_393223 ?auto_393224 ?auto_393225 ?auto_393226 ?auto_393227 ?auto_393228 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393240 - BLOCK
      ?auto_393241 - BLOCK
      ?auto_393242 - BLOCK
      ?auto_393243 - BLOCK
      ?auto_393244 - BLOCK
      ?auto_393245 - BLOCK
      ?auto_393246 - BLOCK
      ?auto_393247 - BLOCK
      ?auto_393248 - BLOCK
      ?auto_393249 - BLOCK
    )
    :vars
    (
      ?auto_393250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393249 ?auto_393250 ) ( ON-TABLE ?auto_393240 ) ( ON ?auto_393241 ?auto_393240 ) ( ON ?auto_393242 ?auto_393241 ) ( ON ?auto_393243 ?auto_393242 ) ( ON ?auto_393244 ?auto_393243 ) ( ON ?auto_393245 ?auto_393244 ) ( ON ?auto_393246 ?auto_393245 ) ( not ( = ?auto_393240 ?auto_393241 ) ) ( not ( = ?auto_393240 ?auto_393242 ) ) ( not ( = ?auto_393240 ?auto_393243 ) ) ( not ( = ?auto_393240 ?auto_393244 ) ) ( not ( = ?auto_393240 ?auto_393245 ) ) ( not ( = ?auto_393240 ?auto_393246 ) ) ( not ( = ?auto_393240 ?auto_393247 ) ) ( not ( = ?auto_393240 ?auto_393248 ) ) ( not ( = ?auto_393240 ?auto_393249 ) ) ( not ( = ?auto_393240 ?auto_393250 ) ) ( not ( = ?auto_393241 ?auto_393242 ) ) ( not ( = ?auto_393241 ?auto_393243 ) ) ( not ( = ?auto_393241 ?auto_393244 ) ) ( not ( = ?auto_393241 ?auto_393245 ) ) ( not ( = ?auto_393241 ?auto_393246 ) ) ( not ( = ?auto_393241 ?auto_393247 ) ) ( not ( = ?auto_393241 ?auto_393248 ) ) ( not ( = ?auto_393241 ?auto_393249 ) ) ( not ( = ?auto_393241 ?auto_393250 ) ) ( not ( = ?auto_393242 ?auto_393243 ) ) ( not ( = ?auto_393242 ?auto_393244 ) ) ( not ( = ?auto_393242 ?auto_393245 ) ) ( not ( = ?auto_393242 ?auto_393246 ) ) ( not ( = ?auto_393242 ?auto_393247 ) ) ( not ( = ?auto_393242 ?auto_393248 ) ) ( not ( = ?auto_393242 ?auto_393249 ) ) ( not ( = ?auto_393242 ?auto_393250 ) ) ( not ( = ?auto_393243 ?auto_393244 ) ) ( not ( = ?auto_393243 ?auto_393245 ) ) ( not ( = ?auto_393243 ?auto_393246 ) ) ( not ( = ?auto_393243 ?auto_393247 ) ) ( not ( = ?auto_393243 ?auto_393248 ) ) ( not ( = ?auto_393243 ?auto_393249 ) ) ( not ( = ?auto_393243 ?auto_393250 ) ) ( not ( = ?auto_393244 ?auto_393245 ) ) ( not ( = ?auto_393244 ?auto_393246 ) ) ( not ( = ?auto_393244 ?auto_393247 ) ) ( not ( = ?auto_393244 ?auto_393248 ) ) ( not ( = ?auto_393244 ?auto_393249 ) ) ( not ( = ?auto_393244 ?auto_393250 ) ) ( not ( = ?auto_393245 ?auto_393246 ) ) ( not ( = ?auto_393245 ?auto_393247 ) ) ( not ( = ?auto_393245 ?auto_393248 ) ) ( not ( = ?auto_393245 ?auto_393249 ) ) ( not ( = ?auto_393245 ?auto_393250 ) ) ( not ( = ?auto_393246 ?auto_393247 ) ) ( not ( = ?auto_393246 ?auto_393248 ) ) ( not ( = ?auto_393246 ?auto_393249 ) ) ( not ( = ?auto_393246 ?auto_393250 ) ) ( not ( = ?auto_393247 ?auto_393248 ) ) ( not ( = ?auto_393247 ?auto_393249 ) ) ( not ( = ?auto_393247 ?auto_393250 ) ) ( not ( = ?auto_393248 ?auto_393249 ) ) ( not ( = ?auto_393248 ?auto_393250 ) ) ( not ( = ?auto_393249 ?auto_393250 ) ) ( ON ?auto_393248 ?auto_393249 ) ( CLEAR ?auto_393246 ) ( ON ?auto_393247 ?auto_393248 ) ( CLEAR ?auto_393247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_393240 ?auto_393241 ?auto_393242 ?auto_393243 ?auto_393244 ?auto_393245 ?auto_393246 ?auto_393247 )
      ( MAKE-10PILE ?auto_393240 ?auto_393241 ?auto_393242 ?auto_393243 ?auto_393244 ?auto_393245 ?auto_393246 ?auto_393247 ?auto_393248 ?auto_393249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393261 - BLOCK
      ?auto_393262 - BLOCK
      ?auto_393263 - BLOCK
      ?auto_393264 - BLOCK
      ?auto_393265 - BLOCK
      ?auto_393266 - BLOCK
      ?auto_393267 - BLOCK
      ?auto_393268 - BLOCK
      ?auto_393269 - BLOCK
      ?auto_393270 - BLOCK
    )
    :vars
    (
      ?auto_393271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393270 ?auto_393271 ) ( ON-TABLE ?auto_393261 ) ( ON ?auto_393262 ?auto_393261 ) ( ON ?auto_393263 ?auto_393262 ) ( ON ?auto_393264 ?auto_393263 ) ( ON ?auto_393265 ?auto_393264 ) ( ON ?auto_393266 ?auto_393265 ) ( ON ?auto_393267 ?auto_393266 ) ( not ( = ?auto_393261 ?auto_393262 ) ) ( not ( = ?auto_393261 ?auto_393263 ) ) ( not ( = ?auto_393261 ?auto_393264 ) ) ( not ( = ?auto_393261 ?auto_393265 ) ) ( not ( = ?auto_393261 ?auto_393266 ) ) ( not ( = ?auto_393261 ?auto_393267 ) ) ( not ( = ?auto_393261 ?auto_393268 ) ) ( not ( = ?auto_393261 ?auto_393269 ) ) ( not ( = ?auto_393261 ?auto_393270 ) ) ( not ( = ?auto_393261 ?auto_393271 ) ) ( not ( = ?auto_393262 ?auto_393263 ) ) ( not ( = ?auto_393262 ?auto_393264 ) ) ( not ( = ?auto_393262 ?auto_393265 ) ) ( not ( = ?auto_393262 ?auto_393266 ) ) ( not ( = ?auto_393262 ?auto_393267 ) ) ( not ( = ?auto_393262 ?auto_393268 ) ) ( not ( = ?auto_393262 ?auto_393269 ) ) ( not ( = ?auto_393262 ?auto_393270 ) ) ( not ( = ?auto_393262 ?auto_393271 ) ) ( not ( = ?auto_393263 ?auto_393264 ) ) ( not ( = ?auto_393263 ?auto_393265 ) ) ( not ( = ?auto_393263 ?auto_393266 ) ) ( not ( = ?auto_393263 ?auto_393267 ) ) ( not ( = ?auto_393263 ?auto_393268 ) ) ( not ( = ?auto_393263 ?auto_393269 ) ) ( not ( = ?auto_393263 ?auto_393270 ) ) ( not ( = ?auto_393263 ?auto_393271 ) ) ( not ( = ?auto_393264 ?auto_393265 ) ) ( not ( = ?auto_393264 ?auto_393266 ) ) ( not ( = ?auto_393264 ?auto_393267 ) ) ( not ( = ?auto_393264 ?auto_393268 ) ) ( not ( = ?auto_393264 ?auto_393269 ) ) ( not ( = ?auto_393264 ?auto_393270 ) ) ( not ( = ?auto_393264 ?auto_393271 ) ) ( not ( = ?auto_393265 ?auto_393266 ) ) ( not ( = ?auto_393265 ?auto_393267 ) ) ( not ( = ?auto_393265 ?auto_393268 ) ) ( not ( = ?auto_393265 ?auto_393269 ) ) ( not ( = ?auto_393265 ?auto_393270 ) ) ( not ( = ?auto_393265 ?auto_393271 ) ) ( not ( = ?auto_393266 ?auto_393267 ) ) ( not ( = ?auto_393266 ?auto_393268 ) ) ( not ( = ?auto_393266 ?auto_393269 ) ) ( not ( = ?auto_393266 ?auto_393270 ) ) ( not ( = ?auto_393266 ?auto_393271 ) ) ( not ( = ?auto_393267 ?auto_393268 ) ) ( not ( = ?auto_393267 ?auto_393269 ) ) ( not ( = ?auto_393267 ?auto_393270 ) ) ( not ( = ?auto_393267 ?auto_393271 ) ) ( not ( = ?auto_393268 ?auto_393269 ) ) ( not ( = ?auto_393268 ?auto_393270 ) ) ( not ( = ?auto_393268 ?auto_393271 ) ) ( not ( = ?auto_393269 ?auto_393270 ) ) ( not ( = ?auto_393269 ?auto_393271 ) ) ( not ( = ?auto_393270 ?auto_393271 ) ) ( ON ?auto_393269 ?auto_393270 ) ( CLEAR ?auto_393267 ) ( ON ?auto_393268 ?auto_393269 ) ( CLEAR ?auto_393268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_393261 ?auto_393262 ?auto_393263 ?auto_393264 ?auto_393265 ?auto_393266 ?auto_393267 ?auto_393268 )
      ( MAKE-10PILE ?auto_393261 ?auto_393262 ?auto_393263 ?auto_393264 ?auto_393265 ?auto_393266 ?auto_393267 ?auto_393268 ?auto_393269 ?auto_393270 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393282 - BLOCK
      ?auto_393283 - BLOCK
      ?auto_393284 - BLOCK
      ?auto_393285 - BLOCK
      ?auto_393286 - BLOCK
      ?auto_393287 - BLOCK
      ?auto_393288 - BLOCK
      ?auto_393289 - BLOCK
      ?auto_393290 - BLOCK
      ?auto_393291 - BLOCK
    )
    :vars
    (
      ?auto_393292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393291 ?auto_393292 ) ( ON-TABLE ?auto_393282 ) ( ON ?auto_393283 ?auto_393282 ) ( ON ?auto_393284 ?auto_393283 ) ( ON ?auto_393285 ?auto_393284 ) ( ON ?auto_393286 ?auto_393285 ) ( ON ?auto_393287 ?auto_393286 ) ( not ( = ?auto_393282 ?auto_393283 ) ) ( not ( = ?auto_393282 ?auto_393284 ) ) ( not ( = ?auto_393282 ?auto_393285 ) ) ( not ( = ?auto_393282 ?auto_393286 ) ) ( not ( = ?auto_393282 ?auto_393287 ) ) ( not ( = ?auto_393282 ?auto_393288 ) ) ( not ( = ?auto_393282 ?auto_393289 ) ) ( not ( = ?auto_393282 ?auto_393290 ) ) ( not ( = ?auto_393282 ?auto_393291 ) ) ( not ( = ?auto_393282 ?auto_393292 ) ) ( not ( = ?auto_393283 ?auto_393284 ) ) ( not ( = ?auto_393283 ?auto_393285 ) ) ( not ( = ?auto_393283 ?auto_393286 ) ) ( not ( = ?auto_393283 ?auto_393287 ) ) ( not ( = ?auto_393283 ?auto_393288 ) ) ( not ( = ?auto_393283 ?auto_393289 ) ) ( not ( = ?auto_393283 ?auto_393290 ) ) ( not ( = ?auto_393283 ?auto_393291 ) ) ( not ( = ?auto_393283 ?auto_393292 ) ) ( not ( = ?auto_393284 ?auto_393285 ) ) ( not ( = ?auto_393284 ?auto_393286 ) ) ( not ( = ?auto_393284 ?auto_393287 ) ) ( not ( = ?auto_393284 ?auto_393288 ) ) ( not ( = ?auto_393284 ?auto_393289 ) ) ( not ( = ?auto_393284 ?auto_393290 ) ) ( not ( = ?auto_393284 ?auto_393291 ) ) ( not ( = ?auto_393284 ?auto_393292 ) ) ( not ( = ?auto_393285 ?auto_393286 ) ) ( not ( = ?auto_393285 ?auto_393287 ) ) ( not ( = ?auto_393285 ?auto_393288 ) ) ( not ( = ?auto_393285 ?auto_393289 ) ) ( not ( = ?auto_393285 ?auto_393290 ) ) ( not ( = ?auto_393285 ?auto_393291 ) ) ( not ( = ?auto_393285 ?auto_393292 ) ) ( not ( = ?auto_393286 ?auto_393287 ) ) ( not ( = ?auto_393286 ?auto_393288 ) ) ( not ( = ?auto_393286 ?auto_393289 ) ) ( not ( = ?auto_393286 ?auto_393290 ) ) ( not ( = ?auto_393286 ?auto_393291 ) ) ( not ( = ?auto_393286 ?auto_393292 ) ) ( not ( = ?auto_393287 ?auto_393288 ) ) ( not ( = ?auto_393287 ?auto_393289 ) ) ( not ( = ?auto_393287 ?auto_393290 ) ) ( not ( = ?auto_393287 ?auto_393291 ) ) ( not ( = ?auto_393287 ?auto_393292 ) ) ( not ( = ?auto_393288 ?auto_393289 ) ) ( not ( = ?auto_393288 ?auto_393290 ) ) ( not ( = ?auto_393288 ?auto_393291 ) ) ( not ( = ?auto_393288 ?auto_393292 ) ) ( not ( = ?auto_393289 ?auto_393290 ) ) ( not ( = ?auto_393289 ?auto_393291 ) ) ( not ( = ?auto_393289 ?auto_393292 ) ) ( not ( = ?auto_393290 ?auto_393291 ) ) ( not ( = ?auto_393290 ?auto_393292 ) ) ( not ( = ?auto_393291 ?auto_393292 ) ) ( ON ?auto_393290 ?auto_393291 ) ( ON ?auto_393289 ?auto_393290 ) ( CLEAR ?auto_393287 ) ( ON ?auto_393288 ?auto_393289 ) ( CLEAR ?auto_393288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_393282 ?auto_393283 ?auto_393284 ?auto_393285 ?auto_393286 ?auto_393287 ?auto_393288 )
      ( MAKE-10PILE ?auto_393282 ?auto_393283 ?auto_393284 ?auto_393285 ?auto_393286 ?auto_393287 ?auto_393288 ?auto_393289 ?auto_393290 ?auto_393291 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393303 - BLOCK
      ?auto_393304 - BLOCK
      ?auto_393305 - BLOCK
      ?auto_393306 - BLOCK
      ?auto_393307 - BLOCK
      ?auto_393308 - BLOCK
      ?auto_393309 - BLOCK
      ?auto_393310 - BLOCK
      ?auto_393311 - BLOCK
      ?auto_393312 - BLOCK
    )
    :vars
    (
      ?auto_393313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393312 ?auto_393313 ) ( ON-TABLE ?auto_393303 ) ( ON ?auto_393304 ?auto_393303 ) ( ON ?auto_393305 ?auto_393304 ) ( ON ?auto_393306 ?auto_393305 ) ( ON ?auto_393307 ?auto_393306 ) ( ON ?auto_393308 ?auto_393307 ) ( not ( = ?auto_393303 ?auto_393304 ) ) ( not ( = ?auto_393303 ?auto_393305 ) ) ( not ( = ?auto_393303 ?auto_393306 ) ) ( not ( = ?auto_393303 ?auto_393307 ) ) ( not ( = ?auto_393303 ?auto_393308 ) ) ( not ( = ?auto_393303 ?auto_393309 ) ) ( not ( = ?auto_393303 ?auto_393310 ) ) ( not ( = ?auto_393303 ?auto_393311 ) ) ( not ( = ?auto_393303 ?auto_393312 ) ) ( not ( = ?auto_393303 ?auto_393313 ) ) ( not ( = ?auto_393304 ?auto_393305 ) ) ( not ( = ?auto_393304 ?auto_393306 ) ) ( not ( = ?auto_393304 ?auto_393307 ) ) ( not ( = ?auto_393304 ?auto_393308 ) ) ( not ( = ?auto_393304 ?auto_393309 ) ) ( not ( = ?auto_393304 ?auto_393310 ) ) ( not ( = ?auto_393304 ?auto_393311 ) ) ( not ( = ?auto_393304 ?auto_393312 ) ) ( not ( = ?auto_393304 ?auto_393313 ) ) ( not ( = ?auto_393305 ?auto_393306 ) ) ( not ( = ?auto_393305 ?auto_393307 ) ) ( not ( = ?auto_393305 ?auto_393308 ) ) ( not ( = ?auto_393305 ?auto_393309 ) ) ( not ( = ?auto_393305 ?auto_393310 ) ) ( not ( = ?auto_393305 ?auto_393311 ) ) ( not ( = ?auto_393305 ?auto_393312 ) ) ( not ( = ?auto_393305 ?auto_393313 ) ) ( not ( = ?auto_393306 ?auto_393307 ) ) ( not ( = ?auto_393306 ?auto_393308 ) ) ( not ( = ?auto_393306 ?auto_393309 ) ) ( not ( = ?auto_393306 ?auto_393310 ) ) ( not ( = ?auto_393306 ?auto_393311 ) ) ( not ( = ?auto_393306 ?auto_393312 ) ) ( not ( = ?auto_393306 ?auto_393313 ) ) ( not ( = ?auto_393307 ?auto_393308 ) ) ( not ( = ?auto_393307 ?auto_393309 ) ) ( not ( = ?auto_393307 ?auto_393310 ) ) ( not ( = ?auto_393307 ?auto_393311 ) ) ( not ( = ?auto_393307 ?auto_393312 ) ) ( not ( = ?auto_393307 ?auto_393313 ) ) ( not ( = ?auto_393308 ?auto_393309 ) ) ( not ( = ?auto_393308 ?auto_393310 ) ) ( not ( = ?auto_393308 ?auto_393311 ) ) ( not ( = ?auto_393308 ?auto_393312 ) ) ( not ( = ?auto_393308 ?auto_393313 ) ) ( not ( = ?auto_393309 ?auto_393310 ) ) ( not ( = ?auto_393309 ?auto_393311 ) ) ( not ( = ?auto_393309 ?auto_393312 ) ) ( not ( = ?auto_393309 ?auto_393313 ) ) ( not ( = ?auto_393310 ?auto_393311 ) ) ( not ( = ?auto_393310 ?auto_393312 ) ) ( not ( = ?auto_393310 ?auto_393313 ) ) ( not ( = ?auto_393311 ?auto_393312 ) ) ( not ( = ?auto_393311 ?auto_393313 ) ) ( not ( = ?auto_393312 ?auto_393313 ) ) ( ON ?auto_393311 ?auto_393312 ) ( ON ?auto_393310 ?auto_393311 ) ( CLEAR ?auto_393308 ) ( ON ?auto_393309 ?auto_393310 ) ( CLEAR ?auto_393309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_393303 ?auto_393304 ?auto_393305 ?auto_393306 ?auto_393307 ?auto_393308 ?auto_393309 )
      ( MAKE-10PILE ?auto_393303 ?auto_393304 ?auto_393305 ?auto_393306 ?auto_393307 ?auto_393308 ?auto_393309 ?auto_393310 ?auto_393311 ?auto_393312 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393324 - BLOCK
      ?auto_393325 - BLOCK
      ?auto_393326 - BLOCK
      ?auto_393327 - BLOCK
      ?auto_393328 - BLOCK
      ?auto_393329 - BLOCK
      ?auto_393330 - BLOCK
      ?auto_393331 - BLOCK
      ?auto_393332 - BLOCK
      ?auto_393333 - BLOCK
    )
    :vars
    (
      ?auto_393334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393333 ?auto_393334 ) ( ON-TABLE ?auto_393324 ) ( ON ?auto_393325 ?auto_393324 ) ( ON ?auto_393326 ?auto_393325 ) ( ON ?auto_393327 ?auto_393326 ) ( ON ?auto_393328 ?auto_393327 ) ( not ( = ?auto_393324 ?auto_393325 ) ) ( not ( = ?auto_393324 ?auto_393326 ) ) ( not ( = ?auto_393324 ?auto_393327 ) ) ( not ( = ?auto_393324 ?auto_393328 ) ) ( not ( = ?auto_393324 ?auto_393329 ) ) ( not ( = ?auto_393324 ?auto_393330 ) ) ( not ( = ?auto_393324 ?auto_393331 ) ) ( not ( = ?auto_393324 ?auto_393332 ) ) ( not ( = ?auto_393324 ?auto_393333 ) ) ( not ( = ?auto_393324 ?auto_393334 ) ) ( not ( = ?auto_393325 ?auto_393326 ) ) ( not ( = ?auto_393325 ?auto_393327 ) ) ( not ( = ?auto_393325 ?auto_393328 ) ) ( not ( = ?auto_393325 ?auto_393329 ) ) ( not ( = ?auto_393325 ?auto_393330 ) ) ( not ( = ?auto_393325 ?auto_393331 ) ) ( not ( = ?auto_393325 ?auto_393332 ) ) ( not ( = ?auto_393325 ?auto_393333 ) ) ( not ( = ?auto_393325 ?auto_393334 ) ) ( not ( = ?auto_393326 ?auto_393327 ) ) ( not ( = ?auto_393326 ?auto_393328 ) ) ( not ( = ?auto_393326 ?auto_393329 ) ) ( not ( = ?auto_393326 ?auto_393330 ) ) ( not ( = ?auto_393326 ?auto_393331 ) ) ( not ( = ?auto_393326 ?auto_393332 ) ) ( not ( = ?auto_393326 ?auto_393333 ) ) ( not ( = ?auto_393326 ?auto_393334 ) ) ( not ( = ?auto_393327 ?auto_393328 ) ) ( not ( = ?auto_393327 ?auto_393329 ) ) ( not ( = ?auto_393327 ?auto_393330 ) ) ( not ( = ?auto_393327 ?auto_393331 ) ) ( not ( = ?auto_393327 ?auto_393332 ) ) ( not ( = ?auto_393327 ?auto_393333 ) ) ( not ( = ?auto_393327 ?auto_393334 ) ) ( not ( = ?auto_393328 ?auto_393329 ) ) ( not ( = ?auto_393328 ?auto_393330 ) ) ( not ( = ?auto_393328 ?auto_393331 ) ) ( not ( = ?auto_393328 ?auto_393332 ) ) ( not ( = ?auto_393328 ?auto_393333 ) ) ( not ( = ?auto_393328 ?auto_393334 ) ) ( not ( = ?auto_393329 ?auto_393330 ) ) ( not ( = ?auto_393329 ?auto_393331 ) ) ( not ( = ?auto_393329 ?auto_393332 ) ) ( not ( = ?auto_393329 ?auto_393333 ) ) ( not ( = ?auto_393329 ?auto_393334 ) ) ( not ( = ?auto_393330 ?auto_393331 ) ) ( not ( = ?auto_393330 ?auto_393332 ) ) ( not ( = ?auto_393330 ?auto_393333 ) ) ( not ( = ?auto_393330 ?auto_393334 ) ) ( not ( = ?auto_393331 ?auto_393332 ) ) ( not ( = ?auto_393331 ?auto_393333 ) ) ( not ( = ?auto_393331 ?auto_393334 ) ) ( not ( = ?auto_393332 ?auto_393333 ) ) ( not ( = ?auto_393332 ?auto_393334 ) ) ( not ( = ?auto_393333 ?auto_393334 ) ) ( ON ?auto_393332 ?auto_393333 ) ( ON ?auto_393331 ?auto_393332 ) ( ON ?auto_393330 ?auto_393331 ) ( CLEAR ?auto_393328 ) ( ON ?auto_393329 ?auto_393330 ) ( CLEAR ?auto_393329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_393324 ?auto_393325 ?auto_393326 ?auto_393327 ?auto_393328 ?auto_393329 )
      ( MAKE-10PILE ?auto_393324 ?auto_393325 ?auto_393326 ?auto_393327 ?auto_393328 ?auto_393329 ?auto_393330 ?auto_393331 ?auto_393332 ?auto_393333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393345 - BLOCK
      ?auto_393346 - BLOCK
      ?auto_393347 - BLOCK
      ?auto_393348 - BLOCK
      ?auto_393349 - BLOCK
      ?auto_393350 - BLOCK
      ?auto_393351 - BLOCK
      ?auto_393352 - BLOCK
      ?auto_393353 - BLOCK
      ?auto_393354 - BLOCK
    )
    :vars
    (
      ?auto_393355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393354 ?auto_393355 ) ( ON-TABLE ?auto_393345 ) ( ON ?auto_393346 ?auto_393345 ) ( ON ?auto_393347 ?auto_393346 ) ( ON ?auto_393348 ?auto_393347 ) ( ON ?auto_393349 ?auto_393348 ) ( not ( = ?auto_393345 ?auto_393346 ) ) ( not ( = ?auto_393345 ?auto_393347 ) ) ( not ( = ?auto_393345 ?auto_393348 ) ) ( not ( = ?auto_393345 ?auto_393349 ) ) ( not ( = ?auto_393345 ?auto_393350 ) ) ( not ( = ?auto_393345 ?auto_393351 ) ) ( not ( = ?auto_393345 ?auto_393352 ) ) ( not ( = ?auto_393345 ?auto_393353 ) ) ( not ( = ?auto_393345 ?auto_393354 ) ) ( not ( = ?auto_393345 ?auto_393355 ) ) ( not ( = ?auto_393346 ?auto_393347 ) ) ( not ( = ?auto_393346 ?auto_393348 ) ) ( not ( = ?auto_393346 ?auto_393349 ) ) ( not ( = ?auto_393346 ?auto_393350 ) ) ( not ( = ?auto_393346 ?auto_393351 ) ) ( not ( = ?auto_393346 ?auto_393352 ) ) ( not ( = ?auto_393346 ?auto_393353 ) ) ( not ( = ?auto_393346 ?auto_393354 ) ) ( not ( = ?auto_393346 ?auto_393355 ) ) ( not ( = ?auto_393347 ?auto_393348 ) ) ( not ( = ?auto_393347 ?auto_393349 ) ) ( not ( = ?auto_393347 ?auto_393350 ) ) ( not ( = ?auto_393347 ?auto_393351 ) ) ( not ( = ?auto_393347 ?auto_393352 ) ) ( not ( = ?auto_393347 ?auto_393353 ) ) ( not ( = ?auto_393347 ?auto_393354 ) ) ( not ( = ?auto_393347 ?auto_393355 ) ) ( not ( = ?auto_393348 ?auto_393349 ) ) ( not ( = ?auto_393348 ?auto_393350 ) ) ( not ( = ?auto_393348 ?auto_393351 ) ) ( not ( = ?auto_393348 ?auto_393352 ) ) ( not ( = ?auto_393348 ?auto_393353 ) ) ( not ( = ?auto_393348 ?auto_393354 ) ) ( not ( = ?auto_393348 ?auto_393355 ) ) ( not ( = ?auto_393349 ?auto_393350 ) ) ( not ( = ?auto_393349 ?auto_393351 ) ) ( not ( = ?auto_393349 ?auto_393352 ) ) ( not ( = ?auto_393349 ?auto_393353 ) ) ( not ( = ?auto_393349 ?auto_393354 ) ) ( not ( = ?auto_393349 ?auto_393355 ) ) ( not ( = ?auto_393350 ?auto_393351 ) ) ( not ( = ?auto_393350 ?auto_393352 ) ) ( not ( = ?auto_393350 ?auto_393353 ) ) ( not ( = ?auto_393350 ?auto_393354 ) ) ( not ( = ?auto_393350 ?auto_393355 ) ) ( not ( = ?auto_393351 ?auto_393352 ) ) ( not ( = ?auto_393351 ?auto_393353 ) ) ( not ( = ?auto_393351 ?auto_393354 ) ) ( not ( = ?auto_393351 ?auto_393355 ) ) ( not ( = ?auto_393352 ?auto_393353 ) ) ( not ( = ?auto_393352 ?auto_393354 ) ) ( not ( = ?auto_393352 ?auto_393355 ) ) ( not ( = ?auto_393353 ?auto_393354 ) ) ( not ( = ?auto_393353 ?auto_393355 ) ) ( not ( = ?auto_393354 ?auto_393355 ) ) ( ON ?auto_393353 ?auto_393354 ) ( ON ?auto_393352 ?auto_393353 ) ( ON ?auto_393351 ?auto_393352 ) ( CLEAR ?auto_393349 ) ( ON ?auto_393350 ?auto_393351 ) ( CLEAR ?auto_393350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_393345 ?auto_393346 ?auto_393347 ?auto_393348 ?auto_393349 ?auto_393350 )
      ( MAKE-10PILE ?auto_393345 ?auto_393346 ?auto_393347 ?auto_393348 ?auto_393349 ?auto_393350 ?auto_393351 ?auto_393352 ?auto_393353 ?auto_393354 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393366 - BLOCK
      ?auto_393367 - BLOCK
      ?auto_393368 - BLOCK
      ?auto_393369 - BLOCK
      ?auto_393370 - BLOCK
      ?auto_393371 - BLOCK
      ?auto_393372 - BLOCK
      ?auto_393373 - BLOCK
      ?auto_393374 - BLOCK
      ?auto_393375 - BLOCK
    )
    :vars
    (
      ?auto_393376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393375 ?auto_393376 ) ( ON-TABLE ?auto_393366 ) ( ON ?auto_393367 ?auto_393366 ) ( ON ?auto_393368 ?auto_393367 ) ( ON ?auto_393369 ?auto_393368 ) ( not ( = ?auto_393366 ?auto_393367 ) ) ( not ( = ?auto_393366 ?auto_393368 ) ) ( not ( = ?auto_393366 ?auto_393369 ) ) ( not ( = ?auto_393366 ?auto_393370 ) ) ( not ( = ?auto_393366 ?auto_393371 ) ) ( not ( = ?auto_393366 ?auto_393372 ) ) ( not ( = ?auto_393366 ?auto_393373 ) ) ( not ( = ?auto_393366 ?auto_393374 ) ) ( not ( = ?auto_393366 ?auto_393375 ) ) ( not ( = ?auto_393366 ?auto_393376 ) ) ( not ( = ?auto_393367 ?auto_393368 ) ) ( not ( = ?auto_393367 ?auto_393369 ) ) ( not ( = ?auto_393367 ?auto_393370 ) ) ( not ( = ?auto_393367 ?auto_393371 ) ) ( not ( = ?auto_393367 ?auto_393372 ) ) ( not ( = ?auto_393367 ?auto_393373 ) ) ( not ( = ?auto_393367 ?auto_393374 ) ) ( not ( = ?auto_393367 ?auto_393375 ) ) ( not ( = ?auto_393367 ?auto_393376 ) ) ( not ( = ?auto_393368 ?auto_393369 ) ) ( not ( = ?auto_393368 ?auto_393370 ) ) ( not ( = ?auto_393368 ?auto_393371 ) ) ( not ( = ?auto_393368 ?auto_393372 ) ) ( not ( = ?auto_393368 ?auto_393373 ) ) ( not ( = ?auto_393368 ?auto_393374 ) ) ( not ( = ?auto_393368 ?auto_393375 ) ) ( not ( = ?auto_393368 ?auto_393376 ) ) ( not ( = ?auto_393369 ?auto_393370 ) ) ( not ( = ?auto_393369 ?auto_393371 ) ) ( not ( = ?auto_393369 ?auto_393372 ) ) ( not ( = ?auto_393369 ?auto_393373 ) ) ( not ( = ?auto_393369 ?auto_393374 ) ) ( not ( = ?auto_393369 ?auto_393375 ) ) ( not ( = ?auto_393369 ?auto_393376 ) ) ( not ( = ?auto_393370 ?auto_393371 ) ) ( not ( = ?auto_393370 ?auto_393372 ) ) ( not ( = ?auto_393370 ?auto_393373 ) ) ( not ( = ?auto_393370 ?auto_393374 ) ) ( not ( = ?auto_393370 ?auto_393375 ) ) ( not ( = ?auto_393370 ?auto_393376 ) ) ( not ( = ?auto_393371 ?auto_393372 ) ) ( not ( = ?auto_393371 ?auto_393373 ) ) ( not ( = ?auto_393371 ?auto_393374 ) ) ( not ( = ?auto_393371 ?auto_393375 ) ) ( not ( = ?auto_393371 ?auto_393376 ) ) ( not ( = ?auto_393372 ?auto_393373 ) ) ( not ( = ?auto_393372 ?auto_393374 ) ) ( not ( = ?auto_393372 ?auto_393375 ) ) ( not ( = ?auto_393372 ?auto_393376 ) ) ( not ( = ?auto_393373 ?auto_393374 ) ) ( not ( = ?auto_393373 ?auto_393375 ) ) ( not ( = ?auto_393373 ?auto_393376 ) ) ( not ( = ?auto_393374 ?auto_393375 ) ) ( not ( = ?auto_393374 ?auto_393376 ) ) ( not ( = ?auto_393375 ?auto_393376 ) ) ( ON ?auto_393374 ?auto_393375 ) ( ON ?auto_393373 ?auto_393374 ) ( ON ?auto_393372 ?auto_393373 ) ( ON ?auto_393371 ?auto_393372 ) ( CLEAR ?auto_393369 ) ( ON ?auto_393370 ?auto_393371 ) ( CLEAR ?auto_393370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_393366 ?auto_393367 ?auto_393368 ?auto_393369 ?auto_393370 )
      ( MAKE-10PILE ?auto_393366 ?auto_393367 ?auto_393368 ?auto_393369 ?auto_393370 ?auto_393371 ?auto_393372 ?auto_393373 ?auto_393374 ?auto_393375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393387 - BLOCK
      ?auto_393388 - BLOCK
      ?auto_393389 - BLOCK
      ?auto_393390 - BLOCK
      ?auto_393391 - BLOCK
      ?auto_393392 - BLOCK
      ?auto_393393 - BLOCK
      ?auto_393394 - BLOCK
      ?auto_393395 - BLOCK
      ?auto_393396 - BLOCK
    )
    :vars
    (
      ?auto_393397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393396 ?auto_393397 ) ( ON-TABLE ?auto_393387 ) ( ON ?auto_393388 ?auto_393387 ) ( ON ?auto_393389 ?auto_393388 ) ( ON ?auto_393390 ?auto_393389 ) ( not ( = ?auto_393387 ?auto_393388 ) ) ( not ( = ?auto_393387 ?auto_393389 ) ) ( not ( = ?auto_393387 ?auto_393390 ) ) ( not ( = ?auto_393387 ?auto_393391 ) ) ( not ( = ?auto_393387 ?auto_393392 ) ) ( not ( = ?auto_393387 ?auto_393393 ) ) ( not ( = ?auto_393387 ?auto_393394 ) ) ( not ( = ?auto_393387 ?auto_393395 ) ) ( not ( = ?auto_393387 ?auto_393396 ) ) ( not ( = ?auto_393387 ?auto_393397 ) ) ( not ( = ?auto_393388 ?auto_393389 ) ) ( not ( = ?auto_393388 ?auto_393390 ) ) ( not ( = ?auto_393388 ?auto_393391 ) ) ( not ( = ?auto_393388 ?auto_393392 ) ) ( not ( = ?auto_393388 ?auto_393393 ) ) ( not ( = ?auto_393388 ?auto_393394 ) ) ( not ( = ?auto_393388 ?auto_393395 ) ) ( not ( = ?auto_393388 ?auto_393396 ) ) ( not ( = ?auto_393388 ?auto_393397 ) ) ( not ( = ?auto_393389 ?auto_393390 ) ) ( not ( = ?auto_393389 ?auto_393391 ) ) ( not ( = ?auto_393389 ?auto_393392 ) ) ( not ( = ?auto_393389 ?auto_393393 ) ) ( not ( = ?auto_393389 ?auto_393394 ) ) ( not ( = ?auto_393389 ?auto_393395 ) ) ( not ( = ?auto_393389 ?auto_393396 ) ) ( not ( = ?auto_393389 ?auto_393397 ) ) ( not ( = ?auto_393390 ?auto_393391 ) ) ( not ( = ?auto_393390 ?auto_393392 ) ) ( not ( = ?auto_393390 ?auto_393393 ) ) ( not ( = ?auto_393390 ?auto_393394 ) ) ( not ( = ?auto_393390 ?auto_393395 ) ) ( not ( = ?auto_393390 ?auto_393396 ) ) ( not ( = ?auto_393390 ?auto_393397 ) ) ( not ( = ?auto_393391 ?auto_393392 ) ) ( not ( = ?auto_393391 ?auto_393393 ) ) ( not ( = ?auto_393391 ?auto_393394 ) ) ( not ( = ?auto_393391 ?auto_393395 ) ) ( not ( = ?auto_393391 ?auto_393396 ) ) ( not ( = ?auto_393391 ?auto_393397 ) ) ( not ( = ?auto_393392 ?auto_393393 ) ) ( not ( = ?auto_393392 ?auto_393394 ) ) ( not ( = ?auto_393392 ?auto_393395 ) ) ( not ( = ?auto_393392 ?auto_393396 ) ) ( not ( = ?auto_393392 ?auto_393397 ) ) ( not ( = ?auto_393393 ?auto_393394 ) ) ( not ( = ?auto_393393 ?auto_393395 ) ) ( not ( = ?auto_393393 ?auto_393396 ) ) ( not ( = ?auto_393393 ?auto_393397 ) ) ( not ( = ?auto_393394 ?auto_393395 ) ) ( not ( = ?auto_393394 ?auto_393396 ) ) ( not ( = ?auto_393394 ?auto_393397 ) ) ( not ( = ?auto_393395 ?auto_393396 ) ) ( not ( = ?auto_393395 ?auto_393397 ) ) ( not ( = ?auto_393396 ?auto_393397 ) ) ( ON ?auto_393395 ?auto_393396 ) ( ON ?auto_393394 ?auto_393395 ) ( ON ?auto_393393 ?auto_393394 ) ( ON ?auto_393392 ?auto_393393 ) ( CLEAR ?auto_393390 ) ( ON ?auto_393391 ?auto_393392 ) ( CLEAR ?auto_393391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_393387 ?auto_393388 ?auto_393389 ?auto_393390 ?auto_393391 )
      ( MAKE-10PILE ?auto_393387 ?auto_393388 ?auto_393389 ?auto_393390 ?auto_393391 ?auto_393392 ?auto_393393 ?auto_393394 ?auto_393395 ?auto_393396 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393408 - BLOCK
      ?auto_393409 - BLOCK
      ?auto_393410 - BLOCK
      ?auto_393411 - BLOCK
      ?auto_393412 - BLOCK
      ?auto_393413 - BLOCK
      ?auto_393414 - BLOCK
      ?auto_393415 - BLOCK
      ?auto_393416 - BLOCK
      ?auto_393417 - BLOCK
    )
    :vars
    (
      ?auto_393418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393417 ?auto_393418 ) ( ON-TABLE ?auto_393408 ) ( ON ?auto_393409 ?auto_393408 ) ( ON ?auto_393410 ?auto_393409 ) ( not ( = ?auto_393408 ?auto_393409 ) ) ( not ( = ?auto_393408 ?auto_393410 ) ) ( not ( = ?auto_393408 ?auto_393411 ) ) ( not ( = ?auto_393408 ?auto_393412 ) ) ( not ( = ?auto_393408 ?auto_393413 ) ) ( not ( = ?auto_393408 ?auto_393414 ) ) ( not ( = ?auto_393408 ?auto_393415 ) ) ( not ( = ?auto_393408 ?auto_393416 ) ) ( not ( = ?auto_393408 ?auto_393417 ) ) ( not ( = ?auto_393408 ?auto_393418 ) ) ( not ( = ?auto_393409 ?auto_393410 ) ) ( not ( = ?auto_393409 ?auto_393411 ) ) ( not ( = ?auto_393409 ?auto_393412 ) ) ( not ( = ?auto_393409 ?auto_393413 ) ) ( not ( = ?auto_393409 ?auto_393414 ) ) ( not ( = ?auto_393409 ?auto_393415 ) ) ( not ( = ?auto_393409 ?auto_393416 ) ) ( not ( = ?auto_393409 ?auto_393417 ) ) ( not ( = ?auto_393409 ?auto_393418 ) ) ( not ( = ?auto_393410 ?auto_393411 ) ) ( not ( = ?auto_393410 ?auto_393412 ) ) ( not ( = ?auto_393410 ?auto_393413 ) ) ( not ( = ?auto_393410 ?auto_393414 ) ) ( not ( = ?auto_393410 ?auto_393415 ) ) ( not ( = ?auto_393410 ?auto_393416 ) ) ( not ( = ?auto_393410 ?auto_393417 ) ) ( not ( = ?auto_393410 ?auto_393418 ) ) ( not ( = ?auto_393411 ?auto_393412 ) ) ( not ( = ?auto_393411 ?auto_393413 ) ) ( not ( = ?auto_393411 ?auto_393414 ) ) ( not ( = ?auto_393411 ?auto_393415 ) ) ( not ( = ?auto_393411 ?auto_393416 ) ) ( not ( = ?auto_393411 ?auto_393417 ) ) ( not ( = ?auto_393411 ?auto_393418 ) ) ( not ( = ?auto_393412 ?auto_393413 ) ) ( not ( = ?auto_393412 ?auto_393414 ) ) ( not ( = ?auto_393412 ?auto_393415 ) ) ( not ( = ?auto_393412 ?auto_393416 ) ) ( not ( = ?auto_393412 ?auto_393417 ) ) ( not ( = ?auto_393412 ?auto_393418 ) ) ( not ( = ?auto_393413 ?auto_393414 ) ) ( not ( = ?auto_393413 ?auto_393415 ) ) ( not ( = ?auto_393413 ?auto_393416 ) ) ( not ( = ?auto_393413 ?auto_393417 ) ) ( not ( = ?auto_393413 ?auto_393418 ) ) ( not ( = ?auto_393414 ?auto_393415 ) ) ( not ( = ?auto_393414 ?auto_393416 ) ) ( not ( = ?auto_393414 ?auto_393417 ) ) ( not ( = ?auto_393414 ?auto_393418 ) ) ( not ( = ?auto_393415 ?auto_393416 ) ) ( not ( = ?auto_393415 ?auto_393417 ) ) ( not ( = ?auto_393415 ?auto_393418 ) ) ( not ( = ?auto_393416 ?auto_393417 ) ) ( not ( = ?auto_393416 ?auto_393418 ) ) ( not ( = ?auto_393417 ?auto_393418 ) ) ( ON ?auto_393416 ?auto_393417 ) ( ON ?auto_393415 ?auto_393416 ) ( ON ?auto_393414 ?auto_393415 ) ( ON ?auto_393413 ?auto_393414 ) ( ON ?auto_393412 ?auto_393413 ) ( CLEAR ?auto_393410 ) ( ON ?auto_393411 ?auto_393412 ) ( CLEAR ?auto_393411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393408 ?auto_393409 ?auto_393410 ?auto_393411 )
      ( MAKE-10PILE ?auto_393408 ?auto_393409 ?auto_393410 ?auto_393411 ?auto_393412 ?auto_393413 ?auto_393414 ?auto_393415 ?auto_393416 ?auto_393417 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393429 - BLOCK
      ?auto_393430 - BLOCK
      ?auto_393431 - BLOCK
      ?auto_393432 - BLOCK
      ?auto_393433 - BLOCK
      ?auto_393434 - BLOCK
      ?auto_393435 - BLOCK
      ?auto_393436 - BLOCK
      ?auto_393437 - BLOCK
      ?auto_393438 - BLOCK
    )
    :vars
    (
      ?auto_393439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393438 ?auto_393439 ) ( ON-TABLE ?auto_393429 ) ( ON ?auto_393430 ?auto_393429 ) ( ON ?auto_393431 ?auto_393430 ) ( not ( = ?auto_393429 ?auto_393430 ) ) ( not ( = ?auto_393429 ?auto_393431 ) ) ( not ( = ?auto_393429 ?auto_393432 ) ) ( not ( = ?auto_393429 ?auto_393433 ) ) ( not ( = ?auto_393429 ?auto_393434 ) ) ( not ( = ?auto_393429 ?auto_393435 ) ) ( not ( = ?auto_393429 ?auto_393436 ) ) ( not ( = ?auto_393429 ?auto_393437 ) ) ( not ( = ?auto_393429 ?auto_393438 ) ) ( not ( = ?auto_393429 ?auto_393439 ) ) ( not ( = ?auto_393430 ?auto_393431 ) ) ( not ( = ?auto_393430 ?auto_393432 ) ) ( not ( = ?auto_393430 ?auto_393433 ) ) ( not ( = ?auto_393430 ?auto_393434 ) ) ( not ( = ?auto_393430 ?auto_393435 ) ) ( not ( = ?auto_393430 ?auto_393436 ) ) ( not ( = ?auto_393430 ?auto_393437 ) ) ( not ( = ?auto_393430 ?auto_393438 ) ) ( not ( = ?auto_393430 ?auto_393439 ) ) ( not ( = ?auto_393431 ?auto_393432 ) ) ( not ( = ?auto_393431 ?auto_393433 ) ) ( not ( = ?auto_393431 ?auto_393434 ) ) ( not ( = ?auto_393431 ?auto_393435 ) ) ( not ( = ?auto_393431 ?auto_393436 ) ) ( not ( = ?auto_393431 ?auto_393437 ) ) ( not ( = ?auto_393431 ?auto_393438 ) ) ( not ( = ?auto_393431 ?auto_393439 ) ) ( not ( = ?auto_393432 ?auto_393433 ) ) ( not ( = ?auto_393432 ?auto_393434 ) ) ( not ( = ?auto_393432 ?auto_393435 ) ) ( not ( = ?auto_393432 ?auto_393436 ) ) ( not ( = ?auto_393432 ?auto_393437 ) ) ( not ( = ?auto_393432 ?auto_393438 ) ) ( not ( = ?auto_393432 ?auto_393439 ) ) ( not ( = ?auto_393433 ?auto_393434 ) ) ( not ( = ?auto_393433 ?auto_393435 ) ) ( not ( = ?auto_393433 ?auto_393436 ) ) ( not ( = ?auto_393433 ?auto_393437 ) ) ( not ( = ?auto_393433 ?auto_393438 ) ) ( not ( = ?auto_393433 ?auto_393439 ) ) ( not ( = ?auto_393434 ?auto_393435 ) ) ( not ( = ?auto_393434 ?auto_393436 ) ) ( not ( = ?auto_393434 ?auto_393437 ) ) ( not ( = ?auto_393434 ?auto_393438 ) ) ( not ( = ?auto_393434 ?auto_393439 ) ) ( not ( = ?auto_393435 ?auto_393436 ) ) ( not ( = ?auto_393435 ?auto_393437 ) ) ( not ( = ?auto_393435 ?auto_393438 ) ) ( not ( = ?auto_393435 ?auto_393439 ) ) ( not ( = ?auto_393436 ?auto_393437 ) ) ( not ( = ?auto_393436 ?auto_393438 ) ) ( not ( = ?auto_393436 ?auto_393439 ) ) ( not ( = ?auto_393437 ?auto_393438 ) ) ( not ( = ?auto_393437 ?auto_393439 ) ) ( not ( = ?auto_393438 ?auto_393439 ) ) ( ON ?auto_393437 ?auto_393438 ) ( ON ?auto_393436 ?auto_393437 ) ( ON ?auto_393435 ?auto_393436 ) ( ON ?auto_393434 ?auto_393435 ) ( ON ?auto_393433 ?auto_393434 ) ( CLEAR ?auto_393431 ) ( ON ?auto_393432 ?auto_393433 ) ( CLEAR ?auto_393432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393429 ?auto_393430 ?auto_393431 ?auto_393432 )
      ( MAKE-10PILE ?auto_393429 ?auto_393430 ?auto_393431 ?auto_393432 ?auto_393433 ?auto_393434 ?auto_393435 ?auto_393436 ?auto_393437 ?auto_393438 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393450 - BLOCK
      ?auto_393451 - BLOCK
      ?auto_393452 - BLOCK
      ?auto_393453 - BLOCK
      ?auto_393454 - BLOCK
      ?auto_393455 - BLOCK
      ?auto_393456 - BLOCK
      ?auto_393457 - BLOCK
      ?auto_393458 - BLOCK
      ?auto_393459 - BLOCK
    )
    :vars
    (
      ?auto_393460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393459 ?auto_393460 ) ( ON-TABLE ?auto_393450 ) ( ON ?auto_393451 ?auto_393450 ) ( not ( = ?auto_393450 ?auto_393451 ) ) ( not ( = ?auto_393450 ?auto_393452 ) ) ( not ( = ?auto_393450 ?auto_393453 ) ) ( not ( = ?auto_393450 ?auto_393454 ) ) ( not ( = ?auto_393450 ?auto_393455 ) ) ( not ( = ?auto_393450 ?auto_393456 ) ) ( not ( = ?auto_393450 ?auto_393457 ) ) ( not ( = ?auto_393450 ?auto_393458 ) ) ( not ( = ?auto_393450 ?auto_393459 ) ) ( not ( = ?auto_393450 ?auto_393460 ) ) ( not ( = ?auto_393451 ?auto_393452 ) ) ( not ( = ?auto_393451 ?auto_393453 ) ) ( not ( = ?auto_393451 ?auto_393454 ) ) ( not ( = ?auto_393451 ?auto_393455 ) ) ( not ( = ?auto_393451 ?auto_393456 ) ) ( not ( = ?auto_393451 ?auto_393457 ) ) ( not ( = ?auto_393451 ?auto_393458 ) ) ( not ( = ?auto_393451 ?auto_393459 ) ) ( not ( = ?auto_393451 ?auto_393460 ) ) ( not ( = ?auto_393452 ?auto_393453 ) ) ( not ( = ?auto_393452 ?auto_393454 ) ) ( not ( = ?auto_393452 ?auto_393455 ) ) ( not ( = ?auto_393452 ?auto_393456 ) ) ( not ( = ?auto_393452 ?auto_393457 ) ) ( not ( = ?auto_393452 ?auto_393458 ) ) ( not ( = ?auto_393452 ?auto_393459 ) ) ( not ( = ?auto_393452 ?auto_393460 ) ) ( not ( = ?auto_393453 ?auto_393454 ) ) ( not ( = ?auto_393453 ?auto_393455 ) ) ( not ( = ?auto_393453 ?auto_393456 ) ) ( not ( = ?auto_393453 ?auto_393457 ) ) ( not ( = ?auto_393453 ?auto_393458 ) ) ( not ( = ?auto_393453 ?auto_393459 ) ) ( not ( = ?auto_393453 ?auto_393460 ) ) ( not ( = ?auto_393454 ?auto_393455 ) ) ( not ( = ?auto_393454 ?auto_393456 ) ) ( not ( = ?auto_393454 ?auto_393457 ) ) ( not ( = ?auto_393454 ?auto_393458 ) ) ( not ( = ?auto_393454 ?auto_393459 ) ) ( not ( = ?auto_393454 ?auto_393460 ) ) ( not ( = ?auto_393455 ?auto_393456 ) ) ( not ( = ?auto_393455 ?auto_393457 ) ) ( not ( = ?auto_393455 ?auto_393458 ) ) ( not ( = ?auto_393455 ?auto_393459 ) ) ( not ( = ?auto_393455 ?auto_393460 ) ) ( not ( = ?auto_393456 ?auto_393457 ) ) ( not ( = ?auto_393456 ?auto_393458 ) ) ( not ( = ?auto_393456 ?auto_393459 ) ) ( not ( = ?auto_393456 ?auto_393460 ) ) ( not ( = ?auto_393457 ?auto_393458 ) ) ( not ( = ?auto_393457 ?auto_393459 ) ) ( not ( = ?auto_393457 ?auto_393460 ) ) ( not ( = ?auto_393458 ?auto_393459 ) ) ( not ( = ?auto_393458 ?auto_393460 ) ) ( not ( = ?auto_393459 ?auto_393460 ) ) ( ON ?auto_393458 ?auto_393459 ) ( ON ?auto_393457 ?auto_393458 ) ( ON ?auto_393456 ?auto_393457 ) ( ON ?auto_393455 ?auto_393456 ) ( ON ?auto_393454 ?auto_393455 ) ( ON ?auto_393453 ?auto_393454 ) ( CLEAR ?auto_393451 ) ( ON ?auto_393452 ?auto_393453 ) ( CLEAR ?auto_393452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393450 ?auto_393451 ?auto_393452 )
      ( MAKE-10PILE ?auto_393450 ?auto_393451 ?auto_393452 ?auto_393453 ?auto_393454 ?auto_393455 ?auto_393456 ?auto_393457 ?auto_393458 ?auto_393459 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393471 - BLOCK
      ?auto_393472 - BLOCK
      ?auto_393473 - BLOCK
      ?auto_393474 - BLOCK
      ?auto_393475 - BLOCK
      ?auto_393476 - BLOCK
      ?auto_393477 - BLOCK
      ?auto_393478 - BLOCK
      ?auto_393479 - BLOCK
      ?auto_393480 - BLOCK
    )
    :vars
    (
      ?auto_393481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393480 ?auto_393481 ) ( ON-TABLE ?auto_393471 ) ( ON ?auto_393472 ?auto_393471 ) ( not ( = ?auto_393471 ?auto_393472 ) ) ( not ( = ?auto_393471 ?auto_393473 ) ) ( not ( = ?auto_393471 ?auto_393474 ) ) ( not ( = ?auto_393471 ?auto_393475 ) ) ( not ( = ?auto_393471 ?auto_393476 ) ) ( not ( = ?auto_393471 ?auto_393477 ) ) ( not ( = ?auto_393471 ?auto_393478 ) ) ( not ( = ?auto_393471 ?auto_393479 ) ) ( not ( = ?auto_393471 ?auto_393480 ) ) ( not ( = ?auto_393471 ?auto_393481 ) ) ( not ( = ?auto_393472 ?auto_393473 ) ) ( not ( = ?auto_393472 ?auto_393474 ) ) ( not ( = ?auto_393472 ?auto_393475 ) ) ( not ( = ?auto_393472 ?auto_393476 ) ) ( not ( = ?auto_393472 ?auto_393477 ) ) ( not ( = ?auto_393472 ?auto_393478 ) ) ( not ( = ?auto_393472 ?auto_393479 ) ) ( not ( = ?auto_393472 ?auto_393480 ) ) ( not ( = ?auto_393472 ?auto_393481 ) ) ( not ( = ?auto_393473 ?auto_393474 ) ) ( not ( = ?auto_393473 ?auto_393475 ) ) ( not ( = ?auto_393473 ?auto_393476 ) ) ( not ( = ?auto_393473 ?auto_393477 ) ) ( not ( = ?auto_393473 ?auto_393478 ) ) ( not ( = ?auto_393473 ?auto_393479 ) ) ( not ( = ?auto_393473 ?auto_393480 ) ) ( not ( = ?auto_393473 ?auto_393481 ) ) ( not ( = ?auto_393474 ?auto_393475 ) ) ( not ( = ?auto_393474 ?auto_393476 ) ) ( not ( = ?auto_393474 ?auto_393477 ) ) ( not ( = ?auto_393474 ?auto_393478 ) ) ( not ( = ?auto_393474 ?auto_393479 ) ) ( not ( = ?auto_393474 ?auto_393480 ) ) ( not ( = ?auto_393474 ?auto_393481 ) ) ( not ( = ?auto_393475 ?auto_393476 ) ) ( not ( = ?auto_393475 ?auto_393477 ) ) ( not ( = ?auto_393475 ?auto_393478 ) ) ( not ( = ?auto_393475 ?auto_393479 ) ) ( not ( = ?auto_393475 ?auto_393480 ) ) ( not ( = ?auto_393475 ?auto_393481 ) ) ( not ( = ?auto_393476 ?auto_393477 ) ) ( not ( = ?auto_393476 ?auto_393478 ) ) ( not ( = ?auto_393476 ?auto_393479 ) ) ( not ( = ?auto_393476 ?auto_393480 ) ) ( not ( = ?auto_393476 ?auto_393481 ) ) ( not ( = ?auto_393477 ?auto_393478 ) ) ( not ( = ?auto_393477 ?auto_393479 ) ) ( not ( = ?auto_393477 ?auto_393480 ) ) ( not ( = ?auto_393477 ?auto_393481 ) ) ( not ( = ?auto_393478 ?auto_393479 ) ) ( not ( = ?auto_393478 ?auto_393480 ) ) ( not ( = ?auto_393478 ?auto_393481 ) ) ( not ( = ?auto_393479 ?auto_393480 ) ) ( not ( = ?auto_393479 ?auto_393481 ) ) ( not ( = ?auto_393480 ?auto_393481 ) ) ( ON ?auto_393479 ?auto_393480 ) ( ON ?auto_393478 ?auto_393479 ) ( ON ?auto_393477 ?auto_393478 ) ( ON ?auto_393476 ?auto_393477 ) ( ON ?auto_393475 ?auto_393476 ) ( ON ?auto_393474 ?auto_393475 ) ( CLEAR ?auto_393472 ) ( ON ?auto_393473 ?auto_393474 ) ( CLEAR ?auto_393473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393471 ?auto_393472 ?auto_393473 )
      ( MAKE-10PILE ?auto_393471 ?auto_393472 ?auto_393473 ?auto_393474 ?auto_393475 ?auto_393476 ?auto_393477 ?auto_393478 ?auto_393479 ?auto_393480 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393492 - BLOCK
      ?auto_393493 - BLOCK
      ?auto_393494 - BLOCK
      ?auto_393495 - BLOCK
      ?auto_393496 - BLOCK
      ?auto_393497 - BLOCK
      ?auto_393498 - BLOCK
      ?auto_393499 - BLOCK
      ?auto_393500 - BLOCK
      ?auto_393501 - BLOCK
    )
    :vars
    (
      ?auto_393502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393501 ?auto_393502 ) ( ON-TABLE ?auto_393492 ) ( not ( = ?auto_393492 ?auto_393493 ) ) ( not ( = ?auto_393492 ?auto_393494 ) ) ( not ( = ?auto_393492 ?auto_393495 ) ) ( not ( = ?auto_393492 ?auto_393496 ) ) ( not ( = ?auto_393492 ?auto_393497 ) ) ( not ( = ?auto_393492 ?auto_393498 ) ) ( not ( = ?auto_393492 ?auto_393499 ) ) ( not ( = ?auto_393492 ?auto_393500 ) ) ( not ( = ?auto_393492 ?auto_393501 ) ) ( not ( = ?auto_393492 ?auto_393502 ) ) ( not ( = ?auto_393493 ?auto_393494 ) ) ( not ( = ?auto_393493 ?auto_393495 ) ) ( not ( = ?auto_393493 ?auto_393496 ) ) ( not ( = ?auto_393493 ?auto_393497 ) ) ( not ( = ?auto_393493 ?auto_393498 ) ) ( not ( = ?auto_393493 ?auto_393499 ) ) ( not ( = ?auto_393493 ?auto_393500 ) ) ( not ( = ?auto_393493 ?auto_393501 ) ) ( not ( = ?auto_393493 ?auto_393502 ) ) ( not ( = ?auto_393494 ?auto_393495 ) ) ( not ( = ?auto_393494 ?auto_393496 ) ) ( not ( = ?auto_393494 ?auto_393497 ) ) ( not ( = ?auto_393494 ?auto_393498 ) ) ( not ( = ?auto_393494 ?auto_393499 ) ) ( not ( = ?auto_393494 ?auto_393500 ) ) ( not ( = ?auto_393494 ?auto_393501 ) ) ( not ( = ?auto_393494 ?auto_393502 ) ) ( not ( = ?auto_393495 ?auto_393496 ) ) ( not ( = ?auto_393495 ?auto_393497 ) ) ( not ( = ?auto_393495 ?auto_393498 ) ) ( not ( = ?auto_393495 ?auto_393499 ) ) ( not ( = ?auto_393495 ?auto_393500 ) ) ( not ( = ?auto_393495 ?auto_393501 ) ) ( not ( = ?auto_393495 ?auto_393502 ) ) ( not ( = ?auto_393496 ?auto_393497 ) ) ( not ( = ?auto_393496 ?auto_393498 ) ) ( not ( = ?auto_393496 ?auto_393499 ) ) ( not ( = ?auto_393496 ?auto_393500 ) ) ( not ( = ?auto_393496 ?auto_393501 ) ) ( not ( = ?auto_393496 ?auto_393502 ) ) ( not ( = ?auto_393497 ?auto_393498 ) ) ( not ( = ?auto_393497 ?auto_393499 ) ) ( not ( = ?auto_393497 ?auto_393500 ) ) ( not ( = ?auto_393497 ?auto_393501 ) ) ( not ( = ?auto_393497 ?auto_393502 ) ) ( not ( = ?auto_393498 ?auto_393499 ) ) ( not ( = ?auto_393498 ?auto_393500 ) ) ( not ( = ?auto_393498 ?auto_393501 ) ) ( not ( = ?auto_393498 ?auto_393502 ) ) ( not ( = ?auto_393499 ?auto_393500 ) ) ( not ( = ?auto_393499 ?auto_393501 ) ) ( not ( = ?auto_393499 ?auto_393502 ) ) ( not ( = ?auto_393500 ?auto_393501 ) ) ( not ( = ?auto_393500 ?auto_393502 ) ) ( not ( = ?auto_393501 ?auto_393502 ) ) ( ON ?auto_393500 ?auto_393501 ) ( ON ?auto_393499 ?auto_393500 ) ( ON ?auto_393498 ?auto_393499 ) ( ON ?auto_393497 ?auto_393498 ) ( ON ?auto_393496 ?auto_393497 ) ( ON ?auto_393495 ?auto_393496 ) ( ON ?auto_393494 ?auto_393495 ) ( CLEAR ?auto_393492 ) ( ON ?auto_393493 ?auto_393494 ) ( CLEAR ?auto_393493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_393492 ?auto_393493 )
      ( MAKE-10PILE ?auto_393492 ?auto_393493 ?auto_393494 ?auto_393495 ?auto_393496 ?auto_393497 ?auto_393498 ?auto_393499 ?auto_393500 ?auto_393501 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393513 - BLOCK
      ?auto_393514 - BLOCK
      ?auto_393515 - BLOCK
      ?auto_393516 - BLOCK
      ?auto_393517 - BLOCK
      ?auto_393518 - BLOCK
      ?auto_393519 - BLOCK
      ?auto_393520 - BLOCK
      ?auto_393521 - BLOCK
      ?auto_393522 - BLOCK
    )
    :vars
    (
      ?auto_393523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393522 ?auto_393523 ) ( ON-TABLE ?auto_393513 ) ( not ( = ?auto_393513 ?auto_393514 ) ) ( not ( = ?auto_393513 ?auto_393515 ) ) ( not ( = ?auto_393513 ?auto_393516 ) ) ( not ( = ?auto_393513 ?auto_393517 ) ) ( not ( = ?auto_393513 ?auto_393518 ) ) ( not ( = ?auto_393513 ?auto_393519 ) ) ( not ( = ?auto_393513 ?auto_393520 ) ) ( not ( = ?auto_393513 ?auto_393521 ) ) ( not ( = ?auto_393513 ?auto_393522 ) ) ( not ( = ?auto_393513 ?auto_393523 ) ) ( not ( = ?auto_393514 ?auto_393515 ) ) ( not ( = ?auto_393514 ?auto_393516 ) ) ( not ( = ?auto_393514 ?auto_393517 ) ) ( not ( = ?auto_393514 ?auto_393518 ) ) ( not ( = ?auto_393514 ?auto_393519 ) ) ( not ( = ?auto_393514 ?auto_393520 ) ) ( not ( = ?auto_393514 ?auto_393521 ) ) ( not ( = ?auto_393514 ?auto_393522 ) ) ( not ( = ?auto_393514 ?auto_393523 ) ) ( not ( = ?auto_393515 ?auto_393516 ) ) ( not ( = ?auto_393515 ?auto_393517 ) ) ( not ( = ?auto_393515 ?auto_393518 ) ) ( not ( = ?auto_393515 ?auto_393519 ) ) ( not ( = ?auto_393515 ?auto_393520 ) ) ( not ( = ?auto_393515 ?auto_393521 ) ) ( not ( = ?auto_393515 ?auto_393522 ) ) ( not ( = ?auto_393515 ?auto_393523 ) ) ( not ( = ?auto_393516 ?auto_393517 ) ) ( not ( = ?auto_393516 ?auto_393518 ) ) ( not ( = ?auto_393516 ?auto_393519 ) ) ( not ( = ?auto_393516 ?auto_393520 ) ) ( not ( = ?auto_393516 ?auto_393521 ) ) ( not ( = ?auto_393516 ?auto_393522 ) ) ( not ( = ?auto_393516 ?auto_393523 ) ) ( not ( = ?auto_393517 ?auto_393518 ) ) ( not ( = ?auto_393517 ?auto_393519 ) ) ( not ( = ?auto_393517 ?auto_393520 ) ) ( not ( = ?auto_393517 ?auto_393521 ) ) ( not ( = ?auto_393517 ?auto_393522 ) ) ( not ( = ?auto_393517 ?auto_393523 ) ) ( not ( = ?auto_393518 ?auto_393519 ) ) ( not ( = ?auto_393518 ?auto_393520 ) ) ( not ( = ?auto_393518 ?auto_393521 ) ) ( not ( = ?auto_393518 ?auto_393522 ) ) ( not ( = ?auto_393518 ?auto_393523 ) ) ( not ( = ?auto_393519 ?auto_393520 ) ) ( not ( = ?auto_393519 ?auto_393521 ) ) ( not ( = ?auto_393519 ?auto_393522 ) ) ( not ( = ?auto_393519 ?auto_393523 ) ) ( not ( = ?auto_393520 ?auto_393521 ) ) ( not ( = ?auto_393520 ?auto_393522 ) ) ( not ( = ?auto_393520 ?auto_393523 ) ) ( not ( = ?auto_393521 ?auto_393522 ) ) ( not ( = ?auto_393521 ?auto_393523 ) ) ( not ( = ?auto_393522 ?auto_393523 ) ) ( ON ?auto_393521 ?auto_393522 ) ( ON ?auto_393520 ?auto_393521 ) ( ON ?auto_393519 ?auto_393520 ) ( ON ?auto_393518 ?auto_393519 ) ( ON ?auto_393517 ?auto_393518 ) ( ON ?auto_393516 ?auto_393517 ) ( ON ?auto_393515 ?auto_393516 ) ( CLEAR ?auto_393513 ) ( ON ?auto_393514 ?auto_393515 ) ( CLEAR ?auto_393514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_393513 ?auto_393514 )
      ( MAKE-10PILE ?auto_393513 ?auto_393514 ?auto_393515 ?auto_393516 ?auto_393517 ?auto_393518 ?auto_393519 ?auto_393520 ?auto_393521 ?auto_393522 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393534 - BLOCK
      ?auto_393535 - BLOCK
      ?auto_393536 - BLOCK
      ?auto_393537 - BLOCK
      ?auto_393538 - BLOCK
      ?auto_393539 - BLOCK
      ?auto_393540 - BLOCK
      ?auto_393541 - BLOCK
      ?auto_393542 - BLOCK
      ?auto_393543 - BLOCK
    )
    :vars
    (
      ?auto_393544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393543 ?auto_393544 ) ( not ( = ?auto_393534 ?auto_393535 ) ) ( not ( = ?auto_393534 ?auto_393536 ) ) ( not ( = ?auto_393534 ?auto_393537 ) ) ( not ( = ?auto_393534 ?auto_393538 ) ) ( not ( = ?auto_393534 ?auto_393539 ) ) ( not ( = ?auto_393534 ?auto_393540 ) ) ( not ( = ?auto_393534 ?auto_393541 ) ) ( not ( = ?auto_393534 ?auto_393542 ) ) ( not ( = ?auto_393534 ?auto_393543 ) ) ( not ( = ?auto_393534 ?auto_393544 ) ) ( not ( = ?auto_393535 ?auto_393536 ) ) ( not ( = ?auto_393535 ?auto_393537 ) ) ( not ( = ?auto_393535 ?auto_393538 ) ) ( not ( = ?auto_393535 ?auto_393539 ) ) ( not ( = ?auto_393535 ?auto_393540 ) ) ( not ( = ?auto_393535 ?auto_393541 ) ) ( not ( = ?auto_393535 ?auto_393542 ) ) ( not ( = ?auto_393535 ?auto_393543 ) ) ( not ( = ?auto_393535 ?auto_393544 ) ) ( not ( = ?auto_393536 ?auto_393537 ) ) ( not ( = ?auto_393536 ?auto_393538 ) ) ( not ( = ?auto_393536 ?auto_393539 ) ) ( not ( = ?auto_393536 ?auto_393540 ) ) ( not ( = ?auto_393536 ?auto_393541 ) ) ( not ( = ?auto_393536 ?auto_393542 ) ) ( not ( = ?auto_393536 ?auto_393543 ) ) ( not ( = ?auto_393536 ?auto_393544 ) ) ( not ( = ?auto_393537 ?auto_393538 ) ) ( not ( = ?auto_393537 ?auto_393539 ) ) ( not ( = ?auto_393537 ?auto_393540 ) ) ( not ( = ?auto_393537 ?auto_393541 ) ) ( not ( = ?auto_393537 ?auto_393542 ) ) ( not ( = ?auto_393537 ?auto_393543 ) ) ( not ( = ?auto_393537 ?auto_393544 ) ) ( not ( = ?auto_393538 ?auto_393539 ) ) ( not ( = ?auto_393538 ?auto_393540 ) ) ( not ( = ?auto_393538 ?auto_393541 ) ) ( not ( = ?auto_393538 ?auto_393542 ) ) ( not ( = ?auto_393538 ?auto_393543 ) ) ( not ( = ?auto_393538 ?auto_393544 ) ) ( not ( = ?auto_393539 ?auto_393540 ) ) ( not ( = ?auto_393539 ?auto_393541 ) ) ( not ( = ?auto_393539 ?auto_393542 ) ) ( not ( = ?auto_393539 ?auto_393543 ) ) ( not ( = ?auto_393539 ?auto_393544 ) ) ( not ( = ?auto_393540 ?auto_393541 ) ) ( not ( = ?auto_393540 ?auto_393542 ) ) ( not ( = ?auto_393540 ?auto_393543 ) ) ( not ( = ?auto_393540 ?auto_393544 ) ) ( not ( = ?auto_393541 ?auto_393542 ) ) ( not ( = ?auto_393541 ?auto_393543 ) ) ( not ( = ?auto_393541 ?auto_393544 ) ) ( not ( = ?auto_393542 ?auto_393543 ) ) ( not ( = ?auto_393542 ?auto_393544 ) ) ( not ( = ?auto_393543 ?auto_393544 ) ) ( ON ?auto_393542 ?auto_393543 ) ( ON ?auto_393541 ?auto_393542 ) ( ON ?auto_393540 ?auto_393541 ) ( ON ?auto_393539 ?auto_393540 ) ( ON ?auto_393538 ?auto_393539 ) ( ON ?auto_393537 ?auto_393538 ) ( ON ?auto_393536 ?auto_393537 ) ( ON ?auto_393535 ?auto_393536 ) ( ON ?auto_393534 ?auto_393535 ) ( CLEAR ?auto_393534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_393534 )
      ( MAKE-10PILE ?auto_393534 ?auto_393535 ?auto_393536 ?auto_393537 ?auto_393538 ?auto_393539 ?auto_393540 ?auto_393541 ?auto_393542 ?auto_393543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_393555 - BLOCK
      ?auto_393556 - BLOCK
      ?auto_393557 - BLOCK
      ?auto_393558 - BLOCK
      ?auto_393559 - BLOCK
      ?auto_393560 - BLOCK
      ?auto_393561 - BLOCK
      ?auto_393562 - BLOCK
      ?auto_393563 - BLOCK
      ?auto_393564 - BLOCK
    )
    :vars
    (
      ?auto_393565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393564 ?auto_393565 ) ( not ( = ?auto_393555 ?auto_393556 ) ) ( not ( = ?auto_393555 ?auto_393557 ) ) ( not ( = ?auto_393555 ?auto_393558 ) ) ( not ( = ?auto_393555 ?auto_393559 ) ) ( not ( = ?auto_393555 ?auto_393560 ) ) ( not ( = ?auto_393555 ?auto_393561 ) ) ( not ( = ?auto_393555 ?auto_393562 ) ) ( not ( = ?auto_393555 ?auto_393563 ) ) ( not ( = ?auto_393555 ?auto_393564 ) ) ( not ( = ?auto_393555 ?auto_393565 ) ) ( not ( = ?auto_393556 ?auto_393557 ) ) ( not ( = ?auto_393556 ?auto_393558 ) ) ( not ( = ?auto_393556 ?auto_393559 ) ) ( not ( = ?auto_393556 ?auto_393560 ) ) ( not ( = ?auto_393556 ?auto_393561 ) ) ( not ( = ?auto_393556 ?auto_393562 ) ) ( not ( = ?auto_393556 ?auto_393563 ) ) ( not ( = ?auto_393556 ?auto_393564 ) ) ( not ( = ?auto_393556 ?auto_393565 ) ) ( not ( = ?auto_393557 ?auto_393558 ) ) ( not ( = ?auto_393557 ?auto_393559 ) ) ( not ( = ?auto_393557 ?auto_393560 ) ) ( not ( = ?auto_393557 ?auto_393561 ) ) ( not ( = ?auto_393557 ?auto_393562 ) ) ( not ( = ?auto_393557 ?auto_393563 ) ) ( not ( = ?auto_393557 ?auto_393564 ) ) ( not ( = ?auto_393557 ?auto_393565 ) ) ( not ( = ?auto_393558 ?auto_393559 ) ) ( not ( = ?auto_393558 ?auto_393560 ) ) ( not ( = ?auto_393558 ?auto_393561 ) ) ( not ( = ?auto_393558 ?auto_393562 ) ) ( not ( = ?auto_393558 ?auto_393563 ) ) ( not ( = ?auto_393558 ?auto_393564 ) ) ( not ( = ?auto_393558 ?auto_393565 ) ) ( not ( = ?auto_393559 ?auto_393560 ) ) ( not ( = ?auto_393559 ?auto_393561 ) ) ( not ( = ?auto_393559 ?auto_393562 ) ) ( not ( = ?auto_393559 ?auto_393563 ) ) ( not ( = ?auto_393559 ?auto_393564 ) ) ( not ( = ?auto_393559 ?auto_393565 ) ) ( not ( = ?auto_393560 ?auto_393561 ) ) ( not ( = ?auto_393560 ?auto_393562 ) ) ( not ( = ?auto_393560 ?auto_393563 ) ) ( not ( = ?auto_393560 ?auto_393564 ) ) ( not ( = ?auto_393560 ?auto_393565 ) ) ( not ( = ?auto_393561 ?auto_393562 ) ) ( not ( = ?auto_393561 ?auto_393563 ) ) ( not ( = ?auto_393561 ?auto_393564 ) ) ( not ( = ?auto_393561 ?auto_393565 ) ) ( not ( = ?auto_393562 ?auto_393563 ) ) ( not ( = ?auto_393562 ?auto_393564 ) ) ( not ( = ?auto_393562 ?auto_393565 ) ) ( not ( = ?auto_393563 ?auto_393564 ) ) ( not ( = ?auto_393563 ?auto_393565 ) ) ( not ( = ?auto_393564 ?auto_393565 ) ) ( ON ?auto_393563 ?auto_393564 ) ( ON ?auto_393562 ?auto_393563 ) ( ON ?auto_393561 ?auto_393562 ) ( ON ?auto_393560 ?auto_393561 ) ( ON ?auto_393559 ?auto_393560 ) ( ON ?auto_393558 ?auto_393559 ) ( ON ?auto_393557 ?auto_393558 ) ( ON ?auto_393556 ?auto_393557 ) ( ON ?auto_393555 ?auto_393556 ) ( CLEAR ?auto_393555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_393555 )
      ( MAKE-10PILE ?auto_393555 ?auto_393556 ?auto_393557 ?auto_393558 ?auto_393559 ?auto_393560 ?auto_393561 ?auto_393562 ?auto_393563 ?auto_393564 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393577 - BLOCK
      ?auto_393578 - BLOCK
      ?auto_393579 - BLOCK
      ?auto_393580 - BLOCK
      ?auto_393581 - BLOCK
      ?auto_393582 - BLOCK
      ?auto_393583 - BLOCK
      ?auto_393584 - BLOCK
      ?auto_393585 - BLOCK
      ?auto_393586 - BLOCK
      ?auto_393587 - BLOCK
    )
    :vars
    (
      ?auto_393588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_393586 ) ( ON ?auto_393587 ?auto_393588 ) ( CLEAR ?auto_393587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_393577 ) ( ON ?auto_393578 ?auto_393577 ) ( ON ?auto_393579 ?auto_393578 ) ( ON ?auto_393580 ?auto_393579 ) ( ON ?auto_393581 ?auto_393580 ) ( ON ?auto_393582 ?auto_393581 ) ( ON ?auto_393583 ?auto_393582 ) ( ON ?auto_393584 ?auto_393583 ) ( ON ?auto_393585 ?auto_393584 ) ( ON ?auto_393586 ?auto_393585 ) ( not ( = ?auto_393577 ?auto_393578 ) ) ( not ( = ?auto_393577 ?auto_393579 ) ) ( not ( = ?auto_393577 ?auto_393580 ) ) ( not ( = ?auto_393577 ?auto_393581 ) ) ( not ( = ?auto_393577 ?auto_393582 ) ) ( not ( = ?auto_393577 ?auto_393583 ) ) ( not ( = ?auto_393577 ?auto_393584 ) ) ( not ( = ?auto_393577 ?auto_393585 ) ) ( not ( = ?auto_393577 ?auto_393586 ) ) ( not ( = ?auto_393577 ?auto_393587 ) ) ( not ( = ?auto_393577 ?auto_393588 ) ) ( not ( = ?auto_393578 ?auto_393579 ) ) ( not ( = ?auto_393578 ?auto_393580 ) ) ( not ( = ?auto_393578 ?auto_393581 ) ) ( not ( = ?auto_393578 ?auto_393582 ) ) ( not ( = ?auto_393578 ?auto_393583 ) ) ( not ( = ?auto_393578 ?auto_393584 ) ) ( not ( = ?auto_393578 ?auto_393585 ) ) ( not ( = ?auto_393578 ?auto_393586 ) ) ( not ( = ?auto_393578 ?auto_393587 ) ) ( not ( = ?auto_393578 ?auto_393588 ) ) ( not ( = ?auto_393579 ?auto_393580 ) ) ( not ( = ?auto_393579 ?auto_393581 ) ) ( not ( = ?auto_393579 ?auto_393582 ) ) ( not ( = ?auto_393579 ?auto_393583 ) ) ( not ( = ?auto_393579 ?auto_393584 ) ) ( not ( = ?auto_393579 ?auto_393585 ) ) ( not ( = ?auto_393579 ?auto_393586 ) ) ( not ( = ?auto_393579 ?auto_393587 ) ) ( not ( = ?auto_393579 ?auto_393588 ) ) ( not ( = ?auto_393580 ?auto_393581 ) ) ( not ( = ?auto_393580 ?auto_393582 ) ) ( not ( = ?auto_393580 ?auto_393583 ) ) ( not ( = ?auto_393580 ?auto_393584 ) ) ( not ( = ?auto_393580 ?auto_393585 ) ) ( not ( = ?auto_393580 ?auto_393586 ) ) ( not ( = ?auto_393580 ?auto_393587 ) ) ( not ( = ?auto_393580 ?auto_393588 ) ) ( not ( = ?auto_393581 ?auto_393582 ) ) ( not ( = ?auto_393581 ?auto_393583 ) ) ( not ( = ?auto_393581 ?auto_393584 ) ) ( not ( = ?auto_393581 ?auto_393585 ) ) ( not ( = ?auto_393581 ?auto_393586 ) ) ( not ( = ?auto_393581 ?auto_393587 ) ) ( not ( = ?auto_393581 ?auto_393588 ) ) ( not ( = ?auto_393582 ?auto_393583 ) ) ( not ( = ?auto_393582 ?auto_393584 ) ) ( not ( = ?auto_393582 ?auto_393585 ) ) ( not ( = ?auto_393582 ?auto_393586 ) ) ( not ( = ?auto_393582 ?auto_393587 ) ) ( not ( = ?auto_393582 ?auto_393588 ) ) ( not ( = ?auto_393583 ?auto_393584 ) ) ( not ( = ?auto_393583 ?auto_393585 ) ) ( not ( = ?auto_393583 ?auto_393586 ) ) ( not ( = ?auto_393583 ?auto_393587 ) ) ( not ( = ?auto_393583 ?auto_393588 ) ) ( not ( = ?auto_393584 ?auto_393585 ) ) ( not ( = ?auto_393584 ?auto_393586 ) ) ( not ( = ?auto_393584 ?auto_393587 ) ) ( not ( = ?auto_393584 ?auto_393588 ) ) ( not ( = ?auto_393585 ?auto_393586 ) ) ( not ( = ?auto_393585 ?auto_393587 ) ) ( not ( = ?auto_393585 ?auto_393588 ) ) ( not ( = ?auto_393586 ?auto_393587 ) ) ( not ( = ?auto_393586 ?auto_393588 ) ) ( not ( = ?auto_393587 ?auto_393588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_393587 ?auto_393588 )
      ( !STACK ?auto_393587 ?auto_393586 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393600 - BLOCK
      ?auto_393601 - BLOCK
      ?auto_393602 - BLOCK
      ?auto_393603 - BLOCK
      ?auto_393604 - BLOCK
      ?auto_393605 - BLOCK
      ?auto_393606 - BLOCK
      ?auto_393607 - BLOCK
      ?auto_393608 - BLOCK
      ?auto_393609 - BLOCK
      ?auto_393610 - BLOCK
    )
    :vars
    (
      ?auto_393611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_393609 ) ( ON ?auto_393610 ?auto_393611 ) ( CLEAR ?auto_393610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_393600 ) ( ON ?auto_393601 ?auto_393600 ) ( ON ?auto_393602 ?auto_393601 ) ( ON ?auto_393603 ?auto_393602 ) ( ON ?auto_393604 ?auto_393603 ) ( ON ?auto_393605 ?auto_393604 ) ( ON ?auto_393606 ?auto_393605 ) ( ON ?auto_393607 ?auto_393606 ) ( ON ?auto_393608 ?auto_393607 ) ( ON ?auto_393609 ?auto_393608 ) ( not ( = ?auto_393600 ?auto_393601 ) ) ( not ( = ?auto_393600 ?auto_393602 ) ) ( not ( = ?auto_393600 ?auto_393603 ) ) ( not ( = ?auto_393600 ?auto_393604 ) ) ( not ( = ?auto_393600 ?auto_393605 ) ) ( not ( = ?auto_393600 ?auto_393606 ) ) ( not ( = ?auto_393600 ?auto_393607 ) ) ( not ( = ?auto_393600 ?auto_393608 ) ) ( not ( = ?auto_393600 ?auto_393609 ) ) ( not ( = ?auto_393600 ?auto_393610 ) ) ( not ( = ?auto_393600 ?auto_393611 ) ) ( not ( = ?auto_393601 ?auto_393602 ) ) ( not ( = ?auto_393601 ?auto_393603 ) ) ( not ( = ?auto_393601 ?auto_393604 ) ) ( not ( = ?auto_393601 ?auto_393605 ) ) ( not ( = ?auto_393601 ?auto_393606 ) ) ( not ( = ?auto_393601 ?auto_393607 ) ) ( not ( = ?auto_393601 ?auto_393608 ) ) ( not ( = ?auto_393601 ?auto_393609 ) ) ( not ( = ?auto_393601 ?auto_393610 ) ) ( not ( = ?auto_393601 ?auto_393611 ) ) ( not ( = ?auto_393602 ?auto_393603 ) ) ( not ( = ?auto_393602 ?auto_393604 ) ) ( not ( = ?auto_393602 ?auto_393605 ) ) ( not ( = ?auto_393602 ?auto_393606 ) ) ( not ( = ?auto_393602 ?auto_393607 ) ) ( not ( = ?auto_393602 ?auto_393608 ) ) ( not ( = ?auto_393602 ?auto_393609 ) ) ( not ( = ?auto_393602 ?auto_393610 ) ) ( not ( = ?auto_393602 ?auto_393611 ) ) ( not ( = ?auto_393603 ?auto_393604 ) ) ( not ( = ?auto_393603 ?auto_393605 ) ) ( not ( = ?auto_393603 ?auto_393606 ) ) ( not ( = ?auto_393603 ?auto_393607 ) ) ( not ( = ?auto_393603 ?auto_393608 ) ) ( not ( = ?auto_393603 ?auto_393609 ) ) ( not ( = ?auto_393603 ?auto_393610 ) ) ( not ( = ?auto_393603 ?auto_393611 ) ) ( not ( = ?auto_393604 ?auto_393605 ) ) ( not ( = ?auto_393604 ?auto_393606 ) ) ( not ( = ?auto_393604 ?auto_393607 ) ) ( not ( = ?auto_393604 ?auto_393608 ) ) ( not ( = ?auto_393604 ?auto_393609 ) ) ( not ( = ?auto_393604 ?auto_393610 ) ) ( not ( = ?auto_393604 ?auto_393611 ) ) ( not ( = ?auto_393605 ?auto_393606 ) ) ( not ( = ?auto_393605 ?auto_393607 ) ) ( not ( = ?auto_393605 ?auto_393608 ) ) ( not ( = ?auto_393605 ?auto_393609 ) ) ( not ( = ?auto_393605 ?auto_393610 ) ) ( not ( = ?auto_393605 ?auto_393611 ) ) ( not ( = ?auto_393606 ?auto_393607 ) ) ( not ( = ?auto_393606 ?auto_393608 ) ) ( not ( = ?auto_393606 ?auto_393609 ) ) ( not ( = ?auto_393606 ?auto_393610 ) ) ( not ( = ?auto_393606 ?auto_393611 ) ) ( not ( = ?auto_393607 ?auto_393608 ) ) ( not ( = ?auto_393607 ?auto_393609 ) ) ( not ( = ?auto_393607 ?auto_393610 ) ) ( not ( = ?auto_393607 ?auto_393611 ) ) ( not ( = ?auto_393608 ?auto_393609 ) ) ( not ( = ?auto_393608 ?auto_393610 ) ) ( not ( = ?auto_393608 ?auto_393611 ) ) ( not ( = ?auto_393609 ?auto_393610 ) ) ( not ( = ?auto_393609 ?auto_393611 ) ) ( not ( = ?auto_393610 ?auto_393611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_393610 ?auto_393611 )
      ( !STACK ?auto_393610 ?auto_393609 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393623 - BLOCK
      ?auto_393624 - BLOCK
      ?auto_393625 - BLOCK
      ?auto_393626 - BLOCK
      ?auto_393627 - BLOCK
      ?auto_393628 - BLOCK
      ?auto_393629 - BLOCK
      ?auto_393630 - BLOCK
      ?auto_393631 - BLOCK
      ?auto_393632 - BLOCK
      ?auto_393633 - BLOCK
    )
    :vars
    (
      ?auto_393634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393633 ?auto_393634 ) ( ON-TABLE ?auto_393623 ) ( ON ?auto_393624 ?auto_393623 ) ( ON ?auto_393625 ?auto_393624 ) ( ON ?auto_393626 ?auto_393625 ) ( ON ?auto_393627 ?auto_393626 ) ( ON ?auto_393628 ?auto_393627 ) ( ON ?auto_393629 ?auto_393628 ) ( ON ?auto_393630 ?auto_393629 ) ( ON ?auto_393631 ?auto_393630 ) ( not ( = ?auto_393623 ?auto_393624 ) ) ( not ( = ?auto_393623 ?auto_393625 ) ) ( not ( = ?auto_393623 ?auto_393626 ) ) ( not ( = ?auto_393623 ?auto_393627 ) ) ( not ( = ?auto_393623 ?auto_393628 ) ) ( not ( = ?auto_393623 ?auto_393629 ) ) ( not ( = ?auto_393623 ?auto_393630 ) ) ( not ( = ?auto_393623 ?auto_393631 ) ) ( not ( = ?auto_393623 ?auto_393632 ) ) ( not ( = ?auto_393623 ?auto_393633 ) ) ( not ( = ?auto_393623 ?auto_393634 ) ) ( not ( = ?auto_393624 ?auto_393625 ) ) ( not ( = ?auto_393624 ?auto_393626 ) ) ( not ( = ?auto_393624 ?auto_393627 ) ) ( not ( = ?auto_393624 ?auto_393628 ) ) ( not ( = ?auto_393624 ?auto_393629 ) ) ( not ( = ?auto_393624 ?auto_393630 ) ) ( not ( = ?auto_393624 ?auto_393631 ) ) ( not ( = ?auto_393624 ?auto_393632 ) ) ( not ( = ?auto_393624 ?auto_393633 ) ) ( not ( = ?auto_393624 ?auto_393634 ) ) ( not ( = ?auto_393625 ?auto_393626 ) ) ( not ( = ?auto_393625 ?auto_393627 ) ) ( not ( = ?auto_393625 ?auto_393628 ) ) ( not ( = ?auto_393625 ?auto_393629 ) ) ( not ( = ?auto_393625 ?auto_393630 ) ) ( not ( = ?auto_393625 ?auto_393631 ) ) ( not ( = ?auto_393625 ?auto_393632 ) ) ( not ( = ?auto_393625 ?auto_393633 ) ) ( not ( = ?auto_393625 ?auto_393634 ) ) ( not ( = ?auto_393626 ?auto_393627 ) ) ( not ( = ?auto_393626 ?auto_393628 ) ) ( not ( = ?auto_393626 ?auto_393629 ) ) ( not ( = ?auto_393626 ?auto_393630 ) ) ( not ( = ?auto_393626 ?auto_393631 ) ) ( not ( = ?auto_393626 ?auto_393632 ) ) ( not ( = ?auto_393626 ?auto_393633 ) ) ( not ( = ?auto_393626 ?auto_393634 ) ) ( not ( = ?auto_393627 ?auto_393628 ) ) ( not ( = ?auto_393627 ?auto_393629 ) ) ( not ( = ?auto_393627 ?auto_393630 ) ) ( not ( = ?auto_393627 ?auto_393631 ) ) ( not ( = ?auto_393627 ?auto_393632 ) ) ( not ( = ?auto_393627 ?auto_393633 ) ) ( not ( = ?auto_393627 ?auto_393634 ) ) ( not ( = ?auto_393628 ?auto_393629 ) ) ( not ( = ?auto_393628 ?auto_393630 ) ) ( not ( = ?auto_393628 ?auto_393631 ) ) ( not ( = ?auto_393628 ?auto_393632 ) ) ( not ( = ?auto_393628 ?auto_393633 ) ) ( not ( = ?auto_393628 ?auto_393634 ) ) ( not ( = ?auto_393629 ?auto_393630 ) ) ( not ( = ?auto_393629 ?auto_393631 ) ) ( not ( = ?auto_393629 ?auto_393632 ) ) ( not ( = ?auto_393629 ?auto_393633 ) ) ( not ( = ?auto_393629 ?auto_393634 ) ) ( not ( = ?auto_393630 ?auto_393631 ) ) ( not ( = ?auto_393630 ?auto_393632 ) ) ( not ( = ?auto_393630 ?auto_393633 ) ) ( not ( = ?auto_393630 ?auto_393634 ) ) ( not ( = ?auto_393631 ?auto_393632 ) ) ( not ( = ?auto_393631 ?auto_393633 ) ) ( not ( = ?auto_393631 ?auto_393634 ) ) ( not ( = ?auto_393632 ?auto_393633 ) ) ( not ( = ?auto_393632 ?auto_393634 ) ) ( not ( = ?auto_393633 ?auto_393634 ) ) ( CLEAR ?auto_393631 ) ( ON ?auto_393632 ?auto_393633 ) ( CLEAR ?auto_393632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_393623 ?auto_393624 ?auto_393625 ?auto_393626 ?auto_393627 ?auto_393628 ?auto_393629 ?auto_393630 ?auto_393631 ?auto_393632 )
      ( MAKE-11PILE ?auto_393623 ?auto_393624 ?auto_393625 ?auto_393626 ?auto_393627 ?auto_393628 ?auto_393629 ?auto_393630 ?auto_393631 ?auto_393632 ?auto_393633 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393646 - BLOCK
      ?auto_393647 - BLOCK
      ?auto_393648 - BLOCK
      ?auto_393649 - BLOCK
      ?auto_393650 - BLOCK
      ?auto_393651 - BLOCK
      ?auto_393652 - BLOCK
      ?auto_393653 - BLOCK
      ?auto_393654 - BLOCK
      ?auto_393655 - BLOCK
      ?auto_393656 - BLOCK
    )
    :vars
    (
      ?auto_393657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393656 ?auto_393657 ) ( ON-TABLE ?auto_393646 ) ( ON ?auto_393647 ?auto_393646 ) ( ON ?auto_393648 ?auto_393647 ) ( ON ?auto_393649 ?auto_393648 ) ( ON ?auto_393650 ?auto_393649 ) ( ON ?auto_393651 ?auto_393650 ) ( ON ?auto_393652 ?auto_393651 ) ( ON ?auto_393653 ?auto_393652 ) ( ON ?auto_393654 ?auto_393653 ) ( not ( = ?auto_393646 ?auto_393647 ) ) ( not ( = ?auto_393646 ?auto_393648 ) ) ( not ( = ?auto_393646 ?auto_393649 ) ) ( not ( = ?auto_393646 ?auto_393650 ) ) ( not ( = ?auto_393646 ?auto_393651 ) ) ( not ( = ?auto_393646 ?auto_393652 ) ) ( not ( = ?auto_393646 ?auto_393653 ) ) ( not ( = ?auto_393646 ?auto_393654 ) ) ( not ( = ?auto_393646 ?auto_393655 ) ) ( not ( = ?auto_393646 ?auto_393656 ) ) ( not ( = ?auto_393646 ?auto_393657 ) ) ( not ( = ?auto_393647 ?auto_393648 ) ) ( not ( = ?auto_393647 ?auto_393649 ) ) ( not ( = ?auto_393647 ?auto_393650 ) ) ( not ( = ?auto_393647 ?auto_393651 ) ) ( not ( = ?auto_393647 ?auto_393652 ) ) ( not ( = ?auto_393647 ?auto_393653 ) ) ( not ( = ?auto_393647 ?auto_393654 ) ) ( not ( = ?auto_393647 ?auto_393655 ) ) ( not ( = ?auto_393647 ?auto_393656 ) ) ( not ( = ?auto_393647 ?auto_393657 ) ) ( not ( = ?auto_393648 ?auto_393649 ) ) ( not ( = ?auto_393648 ?auto_393650 ) ) ( not ( = ?auto_393648 ?auto_393651 ) ) ( not ( = ?auto_393648 ?auto_393652 ) ) ( not ( = ?auto_393648 ?auto_393653 ) ) ( not ( = ?auto_393648 ?auto_393654 ) ) ( not ( = ?auto_393648 ?auto_393655 ) ) ( not ( = ?auto_393648 ?auto_393656 ) ) ( not ( = ?auto_393648 ?auto_393657 ) ) ( not ( = ?auto_393649 ?auto_393650 ) ) ( not ( = ?auto_393649 ?auto_393651 ) ) ( not ( = ?auto_393649 ?auto_393652 ) ) ( not ( = ?auto_393649 ?auto_393653 ) ) ( not ( = ?auto_393649 ?auto_393654 ) ) ( not ( = ?auto_393649 ?auto_393655 ) ) ( not ( = ?auto_393649 ?auto_393656 ) ) ( not ( = ?auto_393649 ?auto_393657 ) ) ( not ( = ?auto_393650 ?auto_393651 ) ) ( not ( = ?auto_393650 ?auto_393652 ) ) ( not ( = ?auto_393650 ?auto_393653 ) ) ( not ( = ?auto_393650 ?auto_393654 ) ) ( not ( = ?auto_393650 ?auto_393655 ) ) ( not ( = ?auto_393650 ?auto_393656 ) ) ( not ( = ?auto_393650 ?auto_393657 ) ) ( not ( = ?auto_393651 ?auto_393652 ) ) ( not ( = ?auto_393651 ?auto_393653 ) ) ( not ( = ?auto_393651 ?auto_393654 ) ) ( not ( = ?auto_393651 ?auto_393655 ) ) ( not ( = ?auto_393651 ?auto_393656 ) ) ( not ( = ?auto_393651 ?auto_393657 ) ) ( not ( = ?auto_393652 ?auto_393653 ) ) ( not ( = ?auto_393652 ?auto_393654 ) ) ( not ( = ?auto_393652 ?auto_393655 ) ) ( not ( = ?auto_393652 ?auto_393656 ) ) ( not ( = ?auto_393652 ?auto_393657 ) ) ( not ( = ?auto_393653 ?auto_393654 ) ) ( not ( = ?auto_393653 ?auto_393655 ) ) ( not ( = ?auto_393653 ?auto_393656 ) ) ( not ( = ?auto_393653 ?auto_393657 ) ) ( not ( = ?auto_393654 ?auto_393655 ) ) ( not ( = ?auto_393654 ?auto_393656 ) ) ( not ( = ?auto_393654 ?auto_393657 ) ) ( not ( = ?auto_393655 ?auto_393656 ) ) ( not ( = ?auto_393655 ?auto_393657 ) ) ( not ( = ?auto_393656 ?auto_393657 ) ) ( CLEAR ?auto_393654 ) ( ON ?auto_393655 ?auto_393656 ) ( CLEAR ?auto_393655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_393646 ?auto_393647 ?auto_393648 ?auto_393649 ?auto_393650 ?auto_393651 ?auto_393652 ?auto_393653 ?auto_393654 ?auto_393655 )
      ( MAKE-11PILE ?auto_393646 ?auto_393647 ?auto_393648 ?auto_393649 ?auto_393650 ?auto_393651 ?auto_393652 ?auto_393653 ?auto_393654 ?auto_393655 ?auto_393656 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393669 - BLOCK
      ?auto_393670 - BLOCK
      ?auto_393671 - BLOCK
      ?auto_393672 - BLOCK
      ?auto_393673 - BLOCK
      ?auto_393674 - BLOCK
      ?auto_393675 - BLOCK
      ?auto_393676 - BLOCK
      ?auto_393677 - BLOCK
      ?auto_393678 - BLOCK
      ?auto_393679 - BLOCK
    )
    :vars
    (
      ?auto_393680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393679 ?auto_393680 ) ( ON-TABLE ?auto_393669 ) ( ON ?auto_393670 ?auto_393669 ) ( ON ?auto_393671 ?auto_393670 ) ( ON ?auto_393672 ?auto_393671 ) ( ON ?auto_393673 ?auto_393672 ) ( ON ?auto_393674 ?auto_393673 ) ( ON ?auto_393675 ?auto_393674 ) ( ON ?auto_393676 ?auto_393675 ) ( not ( = ?auto_393669 ?auto_393670 ) ) ( not ( = ?auto_393669 ?auto_393671 ) ) ( not ( = ?auto_393669 ?auto_393672 ) ) ( not ( = ?auto_393669 ?auto_393673 ) ) ( not ( = ?auto_393669 ?auto_393674 ) ) ( not ( = ?auto_393669 ?auto_393675 ) ) ( not ( = ?auto_393669 ?auto_393676 ) ) ( not ( = ?auto_393669 ?auto_393677 ) ) ( not ( = ?auto_393669 ?auto_393678 ) ) ( not ( = ?auto_393669 ?auto_393679 ) ) ( not ( = ?auto_393669 ?auto_393680 ) ) ( not ( = ?auto_393670 ?auto_393671 ) ) ( not ( = ?auto_393670 ?auto_393672 ) ) ( not ( = ?auto_393670 ?auto_393673 ) ) ( not ( = ?auto_393670 ?auto_393674 ) ) ( not ( = ?auto_393670 ?auto_393675 ) ) ( not ( = ?auto_393670 ?auto_393676 ) ) ( not ( = ?auto_393670 ?auto_393677 ) ) ( not ( = ?auto_393670 ?auto_393678 ) ) ( not ( = ?auto_393670 ?auto_393679 ) ) ( not ( = ?auto_393670 ?auto_393680 ) ) ( not ( = ?auto_393671 ?auto_393672 ) ) ( not ( = ?auto_393671 ?auto_393673 ) ) ( not ( = ?auto_393671 ?auto_393674 ) ) ( not ( = ?auto_393671 ?auto_393675 ) ) ( not ( = ?auto_393671 ?auto_393676 ) ) ( not ( = ?auto_393671 ?auto_393677 ) ) ( not ( = ?auto_393671 ?auto_393678 ) ) ( not ( = ?auto_393671 ?auto_393679 ) ) ( not ( = ?auto_393671 ?auto_393680 ) ) ( not ( = ?auto_393672 ?auto_393673 ) ) ( not ( = ?auto_393672 ?auto_393674 ) ) ( not ( = ?auto_393672 ?auto_393675 ) ) ( not ( = ?auto_393672 ?auto_393676 ) ) ( not ( = ?auto_393672 ?auto_393677 ) ) ( not ( = ?auto_393672 ?auto_393678 ) ) ( not ( = ?auto_393672 ?auto_393679 ) ) ( not ( = ?auto_393672 ?auto_393680 ) ) ( not ( = ?auto_393673 ?auto_393674 ) ) ( not ( = ?auto_393673 ?auto_393675 ) ) ( not ( = ?auto_393673 ?auto_393676 ) ) ( not ( = ?auto_393673 ?auto_393677 ) ) ( not ( = ?auto_393673 ?auto_393678 ) ) ( not ( = ?auto_393673 ?auto_393679 ) ) ( not ( = ?auto_393673 ?auto_393680 ) ) ( not ( = ?auto_393674 ?auto_393675 ) ) ( not ( = ?auto_393674 ?auto_393676 ) ) ( not ( = ?auto_393674 ?auto_393677 ) ) ( not ( = ?auto_393674 ?auto_393678 ) ) ( not ( = ?auto_393674 ?auto_393679 ) ) ( not ( = ?auto_393674 ?auto_393680 ) ) ( not ( = ?auto_393675 ?auto_393676 ) ) ( not ( = ?auto_393675 ?auto_393677 ) ) ( not ( = ?auto_393675 ?auto_393678 ) ) ( not ( = ?auto_393675 ?auto_393679 ) ) ( not ( = ?auto_393675 ?auto_393680 ) ) ( not ( = ?auto_393676 ?auto_393677 ) ) ( not ( = ?auto_393676 ?auto_393678 ) ) ( not ( = ?auto_393676 ?auto_393679 ) ) ( not ( = ?auto_393676 ?auto_393680 ) ) ( not ( = ?auto_393677 ?auto_393678 ) ) ( not ( = ?auto_393677 ?auto_393679 ) ) ( not ( = ?auto_393677 ?auto_393680 ) ) ( not ( = ?auto_393678 ?auto_393679 ) ) ( not ( = ?auto_393678 ?auto_393680 ) ) ( not ( = ?auto_393679 ?auto_393680 ) ) ( ON ?auto_393678 ?auto_393679 ) ( CLEAR ?auto_393676 ) ( ON ?auto_393677 ?auto_393678 ) ( CLEAR ?auto_393677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_393669 ?auto_393670 ?auto_393671 ?auto_393672 ?auto_393673 ?auto_393674 ?auto_393675 ?auto_393676 ?auto_393677 )
      ( MAKE-11PILE ?auto_393669 ?auto_393670 ?auto_393671 ?auto_393672 ?auto_393673 ?auto_393674 ?auto_393675 ?auto_393676 ?auto_393677 ?auto_393678 ?auto_393679 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393692 - BLOCK
      ?auto_393693 - BLOCK
      ?auto_393694 - BLOCK
      ?auto_393695 - BLOCK
      ?auto_393696 - BLOCK
      ?auto_393697 - BLOCK
      ?auto_393698 - BLOCK
      ?auto_393699 - BLOCK
      ?auto_393700 - BLOCK
      ?auto_393701 - BLOCK
      ?auto_393702 - BLOCK
    )
    :vars
    (
      ?auto_393703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393702 ?auto_393703 ) ( ON-TABLE ?auto_393692 ) ( ON ?auto_393693 ?auto_393692 ) ( ON ?auto_393694 ?auto_393693 ) ( ON ?auto_393695 ?auto_393694 ) ( ON ?auto_393696 ?auto_393695 ) ( ON ?auto_393697 ?auto_393696 ) ( ON ?auto_393698 ?auto_393697 ) ( ON ?auto_393699 ?auto_393698 ) ( not ( = ?auto_393692 ?auto_393693 ) ) ( not ( = ?auto_393692 ?auto_393694 ) ) ( not ( = ?auto_393692 ?auto_393695 ) ) ( not ( = ?auto_393692 ?auto_393696 ) ) ( not ( = ?auto_393692 ?auto_393697 ) ) ( not ( = ?auto_393692 ?auto_393698 ) ) ( not ( = ?auto_393692 ?auto_393699 ) ) ( not ( = ?auto_393692 ?auto_393700 ) ) ( not ( = ?auto_393692 ?auto_393701 ) ) ( not ( = ?auto_393692 ?auto_393702 ) ) ( not ( = ?auto_393692 ?auto_393703 ) ) ( not ( = ?auto_393693 ?auto_393694 ) ) ( not ( = ?auto_393693 ?auto_393695 ) ) ( not ( = ?auto_393693 ?auto_393696 ) ) ( not ( = ?auto_393693 ?auto_393697 ) ) ( not ( = ?auto_393693 ?auto_393698 ) ) ( not ( = ?auto_393693 ?auto_393699 ) ) ( not ( = ?auto_393693 ?auto_393700 ) ) ( not ( = ?auto_393693 ?auto_393701 ) ) ( not ( = ?auto_393693 ?auto_393702 ) ) ( not ( = ?auto_393693 ?auto_393703 ) ) ( not ( = ?auto_393694 ?auto_393695 ) ) ( not ( = ?auto_393694 ?auto_393696 ) ) ( not ( = ?auto_393694 ?auto_393697 ) ) ( not ( = ?auto_393694 ?auto_393698 ) ) ( not ( = ?auto_393694 ?auto_393699 ) ) ( not ( = ?auto_393694 ?auto_393700 ) ) ( not ( = ?auto_393694 ?auto_393701 ) ) ( not ( = ?auto_393694 ?auto_393702 ) ) ( not ( = ?auto_393694 ?auto_393703 ) ) ( not ( = ?auto_393695 ?auto_393696 ) ) ( not ( = ?auto_393695 ?auto_393697 ) ) ( not ( = ?auto_393695 ?auto_393698 ) ) ( not ( = ?auto_393695 ?auto_393699 ) ) ( not ( = ?auto_393695 ?auto_393700 ) ) ( not ( = ?auto_393695 ?auto_393701 ) ) ( not ( = ?auto_393695 ?auto_393702 ) ) ( not ( = ?auto_393695 ?auto_393703 ) ) ( not ( = ?auto_393696 ?auto_393697 ) ) ( not ( = ?auto_393696 ?auto_393698 ) ) ( not ( = ?auto_393696 ?auto_393699 ) ) ( not ( = ?auto_393696 ?auto_393700 ) ) ( not ( = ?auto_393696 ?auto_393701 ) ) ( not ( = ?auto_393696 ?auto_393702 ) ) ( not ( = ?auto_393696 ?auto_393703 ) ) ( not ( = ?auto_393697 ?auto_393698 ) ) ( not ( = ?auto_393697 ?auto_393699 ) ) ( not ( = ?auto_393697 ?auto_393700 ) ) ( not ( = ?auto_393697 ?auto_393701 ) ) ( not ( = ?auto_393697 ?auto_393702 ) ) ( not ( = ?auto_393697 ?auto_393703 ) ) ( not ( = ?auto_393698 ?auto_393699 ) ) ( not ( = ?auto_393698 ?auto_393700 ) ) ( not ( = ?auto_393698 ?auto_393701 ) ) ( not ( = ?auto_393698 ?auto_393702 ) ) ( not ( = ?auto_393698 ?auto_393703 ) ) ( not ( = ?auto_393699 ?auto_393700 ) ) ( not ( = ?auto_393699 ?auto_393701 ) ) ( not ( = ?auto_393699 ?auto_393702 ) ) ( not ( = ?auto_393699 ?auto_393703 ) ) ( not ( = ?auto_393700 ?auto_393701 ) ) ( not ( = ?auto_393700 ?auto_393702 ) ) ( not ( = ?auto_393700 ?auto_393703 ) ) ( not ( = ?auto_393701 ?auto_393702 ) ) ( not ( = ?auto_393701 ?auto_393703 ) ) ( not ( = ?auto_393702 ?auto_393703 ) ) ( ON ?auto_393701 ?auto_393702 ) ( CLEAR ?auto_393699 ) ( ON ?auto_393700 ?auto_393701 ) ( CLEAR ?auto_393700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_393692 ?auto_393693 ?auto_393694 ?auto_393695 ?auto_393696 ?auto_393697 ?auto_393698 ?auto_393699 ?auto_393700 )
      ( MAKE-11PILE ?auto_393692 ?auto_393693 ?auto_393694 ?auto_393695 ?auto_393696 ?auto_393697 ?auto_393698 ?auto_393699 ?auto_393700 ?auto_393701 ?auto_393702 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393715 - BLOCK
      ?auto_393716 - BLOCK
      ?auto_393717 - BLOCK
      ?auto_393718 - BLOCK
      ?auto_393719 - BLOCK
      ?auto_393720 - BLOCK
      ?auto_393721 - BLOCK
      ?auto_393722 - BLOCK
      ?auto_393723 - BLOCK
      ?auto_393724 - BLOCK
      ?auto_393725 - BLOCK
    )
    :vars
    (
      ?auto_393726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393725 ?auto_393726 ) ( ON-TABLE ?auto_393715 ) ( ON ?auto_393716 ?auto_393715 ) ( ON ?auto_393717 ?auto_393716 ) ( ON ?auto_393718 ?auto_393717 ) ( ON ?auto_393719 ?auto_393718 ) ( ON ?auto_393720 ?auto_393719 ) ( ON ?auto_393721 ?auto_393720 ) ( not ( = ?auto_393715 ?auto_393716 ) ) ( not ( = ?auto_393715 ?auto_393717 ) ) ( not ( = ?auto_393715 ?auto_393718 ) ) ( not ( = ?auto_393715 ?auto_393719 ) ) ( not ( = ?auto_393715 ?auto_393720 ) ) ( not ( = ?auto_393715 ?auto_393721 ) ) ( not ( = ?auto_393715 ?auto_393722 ) ) ( not ( = ?auto_393715 ?auto_393723 ) ) ( not ( = ?auto_393715 ?auto_393724 ) ) ( not ( = ?auto_393715 ?auto_393725 ) ) ( not ( = ?auto_393715 ?auto_393726 ) ) ( not ( = ?auto_393716 ?auto_393717 ) ) ( not ( = ?auto_393716 ?auto_393718 ) ) ( not ( = ?auto_393716 ?auto_393719 ) ) ( not ( = ?auto_393716 ?auto_393720 ) ) ( not ( = ?auto_393716 ?auto_393721 ) ) ( not ( = ?auto_393716 ?auto_393722 ) ) ( not ( = ?auto_393716 ?auto_393723 ) ) ( not ( = ?auto_393716 ?auto_393724 ) ) ( not ( = ?auto_393716 ?auto_393725 ) ) ( not ( = ?auto_393716 ?auto_393726 ) ) ( not ( = ?auto_393717 ?auto_393718 ) ) ( not ( = ?auto_393717 ?auto_393719 ) ) ( not ( = ?auto_393717 ?auto_393720 ) ) ( not ( = ?auto_393717 ?auto_393721 ) ) ( not ( = ?auto_393717 ?auto_393722 ) ) ( not ( = ?auto_393717 ?auto_393723 ) ) ( not ( = ?auto_393717 ?auto_393724 ) ) ( not ( = ?auto_393717 ?auto_393725 ) ) ( not ( = ?auto_393717 ?auto_393726 ) ) ( not ( = ?auto_393718 ?auto_393719 ) ) ( not ( = ?auto_393718 ?auto_393720 ) ) ( not ( = ?auto_393718 ?auto_393721 ) ) ( not ( = ?auto_393718 ?auto_393722 ) ) ( not ( = ?auto_393718 ?auto_393723 ) ) ( not ( = ?auto_393718 ?auto_393724 ) ) ( not ( = ?auto_393718 ?auto_393725 ) ) ( not ( = ?auto_393718 ?auto_393726 ) ) ( not ( = ?auto_393719 ?auto_393720 ) ) ( not ( = ?auto_393719 ?auto_393721 ) ) ( not ( = ?auto_393719 ?auto_393722 ) ) ( not ( = ?auto_393719 ?auto_393723 ) ) ( not ( = ?auto_393719 ?auto_393724 ) ) ( not ( = ?auto_393719 ?auto_393725 ) ) ( not ( = ?auto_393719 ?auto_393726 ) ) ( not ( = ?auto_393720 ?auto_393721 ) ) ( not ( = ?auto_393720 ?auto_393722 ) ) ( not ( = ?auto_393720 ?auto_393723 ) ) ( not ( = ?auto_393720 ?auto_393724 ) ) ( not ( = ?auto_393720 ?auto_393725 ) ) ( not ( = ?auto_393720 ?auto_393726 ) ) ( not ( = ?auto_393721 ?auto_393722 ) ) ( not ( = ?auto_393721 ?auto_393723 ) ) ( not ( = ?auto_393721 ?auto_393724 ) ) ( not ( = ?auto_393721 ?auto_393725 ) ) ( not ( = ?auto_393721 ?auto_393726 ) ) ( not ( = ?auto_393722 ?auto_393723 ) ) ( not ( = ?auto_393722 ?auto_393724 ) ) ( not ( = ?auto_393722 ?auto_393725 ) ) ( not ( = ?auto_393722 ?auto_393726 ) ) ( not ( = ?auto_393723 ?auto_393724 ) ) ( not ( = ?auto_393723 ?auto_393725 ) ) ( not ( = ?auto_393723 ?auto_393726 ) ) ( not ( = ?auto_393724 ?auto_393725 ) ) ( not ( = ?auto_393724 ?auto_393726 ) ) ( not ( = ?auto_393725 ?auto_393726 ) ) ( ON ?auto_393724 ?auto_393725 ) ( ON ?auto_393723 ?auto_393724 ) ( CLEAR ?auto_393721 ) ( ON ?auto_393722 ?auto_393723 ) ( CLEAR ?auto_393722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_393715 ?auto_393716 ?auto_393717 ?auto_393718 ?auto_393719 ?auto_393720 ?auto_393721 ?auto_393722 )
      ( MAKE-11PILE ?auto_393715 ?auto_393716 ?auto_393717 ?auto_393718 ?auto_393719 ?auto_393720 ?auto_393721 ?auto_393722 ?auto_393723 ?auto_393724 ?auto_393725 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393738 - BLOCK
      ?auto_393739 - BLOCK
      ?auto_393740 - BLOCK
      ?auto_393741 - BLOCK
      ?auto_393742 - BLOCK
      ?auto_393743 - BLOCK
      ?auto_393744 - BLOCK
      ?auto_393745 - BLOCK
      ?auto_393746 - BLOCK
      ?auto_393747 - BLOCK
      ?auto_393748 - BLOCK
    )
    :vars
    (
      ?auto_393749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393748 ?auto_393749 ) ( ON-TABLE ?auto_393738 ) ( ON ?auto_393739 ?auto_393738 ) ( ON ?auto_393740 ?auto_393739 ) ( ON ?auto_393741 ?auto_393740 ) ( ON ?auto_393742 ?auto_393741 ) ( ON ?auto_393743 ?auto_393742 ) ( ON ?auto_393744 ?auto_393743 ) ( not ( = ?auto_393738 ?auto_393739 ) ) ( not ( = ?auto_393738 ?auto_393740 ) ) ( not ( = ?auto_393738 ?auto_393741 ) ) ( not ( = ?auto_393738 ?auto_393742 ) ) ( not ( = ?auto_393738 ?auto_393743 ) ) ( not ( = ?auto_393738 ?auto_393744 ) ) ( not ( = ?auto_393738 ?auto_393745 ) ) ( not ( = ?auto_393738 ?auto_393746 ) ) ( not ( = ?auto_393738 ?auto_393747 ) ) ( not ( = ?auto_393738 ?auto_393748 ) ) ( not ( = ?auto_393738 ?auto_393749 ) ) ( not ( = ?auto_393739 ?auto_393740 ) ) ( not ( = ?auto_393739 ?auto_393741 ) ) ( not ( = ?auto_393739 ?auto_393742 ) ) ( not ( = ?auto_393739 ?auto_393743 ) ) ( not ( = ?auto_393739 ?auto_393744 ) ) ( not ( = ?auto_393739 ?auto_393745 ) ) ( not ( = ?auto_393739 ?auto_393746 ) ) ( not ( = ?auto_393739 ?auto_393747 ) ) ( not ( = ?auto_393739 ?auto_393748 ) ) ( not ( = ?auto_393739 ?auto_393749 ) ) ( not ( = ?auto_393740 ?auto_393741 ) ) ( not ( = ?auto_393740 ?auto_393742 ) ) ( not ( = ?auto_393740 ?auto_393743 ) ) ( not ( = ?auto_393740 ?auto_393744 ) ) ( not ( = ?auto_393740 ?auto_393745 ) ) ( not ( = ?auto_393740 ?auto_393746 ) ) ( not ( = ?auto_393740 ?auto_393747 ) ) ( not ( = ?auto_393740 ?auto_393748 ) ) ( not ( = ?auto_393740 ?auto_393749 ) ) ( not ( = ?auto_393741 ?auto_393742 ) ) ( not ( = ?auto_393741 ?auto_393743 ) ) ( not ( = ?auto_393741 ?auto_393744 ) ) ( not ( = ?auto_393741 ?auto_393745 ) ) ( not ( = ?auto_393741 ?auto_393746 ) ) ( not ( = ?auto_393741 ?auto_393747 ) ) ( not ( = ?auto_393741 ?auto_393748 ) ) ( not ( = ?auto_393741 ?auto_393749 ) ) ( not ( = ?auto_393742 ?auto_393743 ) ) ( not ( = ?auto_393742 ?auto_393744 ) ) ( not ( = ?auto_393742 ?auto_393745 ) ) ( not ( = ?auto_393742 ?auto_393746 ) ) ( not ( = ?auto_393742 ?auto_393747 ) ) ( not ( = ?auto_393742 ?auto_393748 ) ) ( not ( = ?auto_393742 ?auto_393749 ) ) ( not ( = ?auto_393743 ?auto_393744 ) ) ( not ( = ?auto_393743 ?auto_393745 ) ) ( not ( = ?auto_393743 ?auto_393746 ) ) ( not ( = ?auto_393743 ?auto_393747 ) ) ( not ( = ?auto_393743 ?auto_393748 ) ) ( not ( = ?auto_393743 ?auto_393749 ) ) ( not ( = ?auto_393744 ?auto_393745 ) ) ( not ( = ?auto_393744 ?auto_393746 ) ) ( not ( = ?auto_393744 ?auto_393747 ) ) ( not ( = ?auto_393744 ?auto_393748 ) ) ( not ( = ?auto_393744 ?auto_393749 ) ) ( not ( = ?auto_393745 ?auto_393746 ) ) ( not ( = ?auto_393745 ?auto_393747 ) ) ( not ( = ?auto_393745 ?auto_393748 ) ) ( not ( = ?auto_393745 ?auto_393749 ) ) ( not ( = ?auto_393746 ?auto_393747 ) ) ( not ( = ?auto_393746 ?auto_393748 ) ) ( not ( = ?auto_393746 ?auto_393749 ) ) ( not ( = ?auto_393747 ?auto_393748 ) ) ( not ( = ?auto_393747 ?auto_393749 ) ) ( not ( = ?auto_393748 ?auto_393749 ) ) ( ON ?auto_393747 ?auto_393748 ) ( ON ?auto_393746 ?auto_393747 ) ( CLEAR ?auto_393744 ) ( ON ?auto_393745 ?auto_393746 ) ( CLEAR ?auto_393745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_393738 ?auto_393739 ?auto_393740 ?auto_393741 ?auto_393742 ?auto_393743 ?auto_393744 ?auto_393745 )
      ( MAKE-11PILE ?auto_393738 ?auto_393739 ?auto_393740 ?auto_393741 ?auto_393742 ?auto_393743 ?auto_393744 ?auto_393745 ?auto_393746 ?auto_393747 ?auto_393748 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393761 - BLOCK
      ?auto_393762 - BLOCK
      ?auto_393763 - BLOCK
      ?auto_393764 - BLOCK
      ?auto_393765 - BLOCK
      ?auto_393766 - BLOCK
      ?auto_393767 - BLOCK
      ?auto_393768 - BLOCK
      ?auto_393769 - BLOCK
      ?auto_393770 - BLOCK
      ?auto_393771 - BLOCK
    )
    :vars
    (
      ?auto_393772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393771 ?auto_393772 ) ( ON-TABLE ?auto_393761 ) ( ON ?auto_393762 ?auto_393761 ) ( ON ?auto_393763 ?auto_393762 ) ( ON ?auto_393764 ?auto_393763 ) ( ON ?auto_393765 ?auto_393764 ) ( ON ?auto_393766 ?auto_393765 ) ( not ( = ?auto_393761 ?auto_393762 ) ) ( not ( = ?auto_393761 ?auto_393763 ) ) ( not ( = ?auto_393761 ?auto_393764 ) ) ( not ( = ?auto_393761 ?auto_393765 ) ) ( not ( = ?auto_393761 ?auto_393766 ) ) ( not ( = ?auto_393761 ?auto_393767 ) ) ( not ( = ?auto_393761 ?auto_393768 ) ) ( not ( = ?auto_393761 ?auto_393769 ) ) ( not ( = ?auto_393761 ?auto_393770 ) ) ( not ( = ?auto_393761 ?auto_393771 ) ) ( not ( = ?auto_393761 ?auto_393772 ) ) ( not ( = ?auto_393762 ?auto_393763 ) ) ( not ( = ?auto_393762 ?auto_393764 ) ) ( not ( = ?auto_393762 ?auto_393765 ) ) ( not ( = ?auto_393762 ?auto_393766 ) ) ( not ( = ?auto_393762 ?auto_393767 ) ) ( not ( = ?auto_393762 ?auto_393768 ) ) ( not ( = ?auto_393762 ?auto_393769 ) ) ( not ( = ?auto_393762 ?auto_393770 ) ) ( not ( = ?auto_393762 ?auto_393771 ) ) ( not ( = ?auto_393762 ?auto_393772 ) ) ( not ( = ?auto_393763 ?auto_393764 ) ) ( not ( = ?auto_393763 ?auto_393765 ) ) ( not ( = ?auto_393763 ?auto_393766 ) ) ( not ( = ?auto_393763 ?auto_393767 ) ) ( not ( = ?auto_393763 ?auto_393768 ) ) ( not ( = ?auto_393763 ?auto_393769 ) ) ( not ( = ?auto_393763 ?auto_393770 ) ) ( not ( = ?auto_393763 ?auto_393771 ) ) ( not ( = ?auto_393763 ?auto_393772 ) ) ( not ( = ?auto_393764 ?auto_393765 ) ) ( not ( = ?auto_393764 ?auto_393766 ) ) ( not ( = ?auto_393764 ?auto_393767 ) ) ( not ( = ?auto_393764 ?auto_393768 ) ) ( not ( = ?auto_393764 ?auto_393769 ) ) ( not ( = ?auto_393764 ?auto_393770 ) ) ( not ( = ?auto_393764 ?auto_393771 ) ) ( not ( = ?auto_393764 ?auto_393772 ) ) ( not ( = ?auto_393765 ?auto_393766 ) ) ( not ( = ?auto_393765 ?auto_393767 ) ) ( not ( = ?auto_393765 ?auto_393768 ) ) ( not ( = ?auto_393765 ?auto_393769 ) ) ( not ( = ?auto_393765 ?auto_393770 ) ) ( not ( = ?auto_393765 ?auto_393771 ) ) ( not ( = ?auto_393765 ?auto_393772 ) ) ( not ( = ?auto_393766 ?auto_393767 ) ) ( not ( = ?auto_393766 ?auto_393768 ) ) ( not ( = ?auto_393766 ?auto_393769 ) ) ( not ( = ?auto_393766 ?auto_393770 ) ) ( not ( = ?auto_393766 ?auto_393771 ) ) ( not ( = ?auto_393766 ?auto_393772 ) ) ( not ( = ?auto_393767 ?auto_393768 ) ) ( not ( = ?auto_393767 ?auto_393769 ) ) ( not ( = ?auto_393767 ?auto_393770 ) ) ( not ( = ?auto_393767 ?auto_393771 ) ) ( not ( = ?auto_393767 ?auto_393772 ) ) ( not ( = ?auto_393768 ?auto_393769 ) ) ( not ( = ?auto_393768 ?auto_393770 ) ) ( not ( = ?auto_393768 ?auto_393771 ) ) ( not ( = ?auto_393768 ?auto_393772 ) ) ( not ( = ?auto_393769 ?auto_393770 ) ) ( not ( = ?auto_393769 ?auto_393771 ) ) ( not ( = ?auto_393769 ?auto_393772 ) ) ( not ( = ?auto_393770 ?auto_393771 ) ) ( not ( = ?auto_393770 ?auto_393772 ) ) ( not ( = ?auto_393771 ?auto_393772 ) ) ( ON ?auto_393770 ?auto_393771 ) ( ON ?auto_393769 ?auto_393770 ) ( ON ?auto_393768 ?auto_393769 ) ( CLEAR ?auto_393766 ) ( ON ?auto_393767 ?auto_393768 ) ( CLEAR ?auto_393767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_393761 ?auto_393762 ?auto_393763 ?auto_393764 ?auto_393765 ?auto_393766 ?auto_393767 )
      ( MAKE-11PILE ?auto_393761 ?auto_393762 ?auto_393763 ?auto_393764 ?auto_393765 ?auto_393766 ?auto_393767 ?auto_393768 ?auto_393769 ?auto_393770 ?auto_393771 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393784 - BLOCK
      ?auto_393785 - BLOCK
      ?auto_393786 - BLOCK
      ?auto_393787 - BLOCK
      ?auto_393788 - BLOCK
      ?auto_393789 - BLOCK
      ?auto_393790 - BLOCK
      ?auto_393791 - BLOCK
      ?auto_393792 - BLOCK
      ?auto_393793 - BLOCK
      ?auto_393794 - BLOCK
    )
    :vars
    (
      ?auto_393795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393794 ?auto_393795 ) ( ON-TABLE ?auto_393784 ) ( ON ?auto_393785 ?auto_393784 ) ( ON ?auto_393786 ?auto_393785 ) ( ON ?auto_393787 ?auto_393786 ) ( ON ?auto_393788 ?auto_393787 ) ( ON ?auto_393789 ?auto_393788 ) ( not ( = ?auto_393784 ?auto_393785 ) ) ( not ( = ?auto_393784 ?auto_393786 ) ) ( not ( = ?auto_393784 ?auto_393787 ) ) ( not ( = ?auto_393784 ?auto_393788 ) ) ( not ( = ?auto_393784 ?auto_393789 ) ) ( not ( = ?auto_393784 ?auto_393790 ) ) ( not ( = ?auto_393784 ?auto_393791 ) ) ( not ( = ?auto_393784 ?auto_393792 ) ) ( not ( = ?auto_393784 ?auto_393793 ) ) ( not ( = ?auto_393784 ?auto_393794 ) ) ( not ( = ?auto_393784 ?auto_393795 ) ) ( not ( = ?auto_393785 ?auto_393786 ) ) ( not ( = ?auto_393785 ?auto_393787 ) ) ( not ( = ?auto_393785 ?auto_393788 ) ) ( not ( = ?auto_393785 ?auto_393789 ) ) ( not ( = ?auto_393785 ?auto_393790 ) ) ( not ( = ?auto_393785 ?auto_393791 ) ) ( not ( = ?auto_393785 ?auto_393792 ) ) ( not ( = ?auto_393785 ?auto_393793 ) ) ( not ( = ?auto_393785 ?auto_393794 ) ) ( not ( = ?auto_393785 ?auto_393795 ) ) ( not ( = ?auto_393786 ?auto_393787 ) ) ( not ( = ?auto_393786 ?auto_393788 ) ) ( not ( = ?auto_393786 ?auto_393789 ) ) ( not ( = ?auto_393786 ?auto_393790 ) ) ( not ( = ?auto_393786 ?auto_393791 ) ) ( not ( = ?auto_393786 ?auto_393792 ) ) ( not ( = ?auto_393786 ?auto_393793 ) ) ( not ( = ?auto_393786 ?auto_393794 ) ) ( not ( = ?auto_393786 ?auto_393795 ) ) ( not ( = ?auto_393787 ?auto_393788 ) ) ( not ( = ?auto_393787 ?auto_393789 ) ) ( not ( = ?auto_393787 ?auto_393790 ) ) ( not ( = ?auto_393787 ?auto_393791 ) ) ( not ( = ?auto_393787 ?auto_393792 ) ) ( not ( = ?auto_393787 ?auto_393793 ) ) ( not ( = ?auto_393787 ?auto_393794 ) ) ( not ( = ?auto_393787 ?auto_393795 ) ) ( not ( = ?auto_393788 ?auto_393789 ) ) ( not ( = ?auto_393788 ?auto_393790 ) ) ( not ( = ?auto_393788 ?auto_393791 ) ) ( not ( = ?auto_393788 ?auto_393792 ) ) ( not ( = ?auto_393788 ?auto_393793 ) ) ( not ( = ?auto_393788 ?auto_393794 ) ) ( not ( = ?auto_393788 ?auto_393795 ) ) ( not ( = ?auto_393789 ?auto_393790 ) ) ( not ( = ?auto_393789 ?auto_393791 ) ) ( not ( = ?auto_393789 ?auto_393792 ) ) ( not ( = ?auto_393789 ?auto_393793 ) ) ( not ( = ?auto_393789 ?auto_393794 ) ) ( not ( = ?auto_393789 ?auto_393795 ) ) ( not ( = ?auto_393790 ?auto_393791 ) ) ( not ( = ?auto_393790 ?auto_393792 ) ) ( not ( = ?auto_393790 ?auto_393793 ) ) ( not ( = ?auto_393790 ?auto_393794 ) ) ( not ( = ?auto_393790 ?auto_393795 ) ) ( not ( = ?auto_393791 ?auto_393792 ) ) ( not ( = ?auto_393791 ?auto_393793 ) ) ( not ( = ?auto_393791 ?auto_393794 ) ) ( not ( = ?auto_393791 ?auto_393795 ) ) ( not ( = ?auto_393792 ?auto_393793 ) ) ( not ( = ?auto_393792 ?auto_393794 ) ) ( not ( = ?auto_393792 ?auto_393795 ) ) ( not ( = ?auto_393793 ?auto_393794 ) ) ( not ( = ?auto_393793 ?auto_393795 ) ) ( not ( = ?auto_393794 ?auto_393795 ) ) ( ON ?auto_393793 ?auto_393794 ) ( ON ?auto_393792 ?auto_393793 ) ( ON ?auto_393791 ?auto_393792 ) ( CLEAR ?auto_393789 ) ( ON ?auto_393790 ?auto_393791 ) ( CLEAR ?auto_393790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_393784 ?auto_393785 ?auto_393786 ?auto_393787 ?auto_393788 ?auto_393789 ?auto_393790 )
      ( MAKE-11PILE ?auto_393784 ?auto_393785 ?auto_393786 ?auto_393787 ?auto_393788 ?auto_393789 ?auto_393790 ?auto_393791 ?auto_393792 ?auto_393793 ?auto_393794 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393807 - BLOCK
      ?auto_393808 - BLOCK
      ?auto_393809 - BLOCK
      ?auto_393810 - BLOCK
      ?auto_393811 - BLOCK
      ?auto_393812 - BLOCK
      ?auto_393813 - BLOCK
      ?auto_393814 - BLOCK
      ?auto_393815 - BLOCK
      ?auto_393816 - BLOCK
      ?auto_393817 - BLOCK
    )
    :vars
    (
      ?auto_393818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393817 ?auto_393818 ) ( ON-TABLE ?auto_393807 ) ( ON ?auto_393808 ?auto_393807 ) ( ON ?auto_393809 ?auto_393808 ) ( ON ?auto_393810 ?auto_393809 ) ( ON ?auto_393811 ?auto_393810 ) ( not ( = ?auto_393807 ?auto_393808 ) ) ( not ( = ?auto_393807 ?auto_393809 ) ) ( not ( = ?auto_393807 ?auto_393810 ) ) ( not ( = ?auto_393807 ?auto_393811 ) ) ( not ( = ?auto_393807 ?auto_393812 ) ) ( not ( = ?auto_393807 ?auto_393813 ) ) ( not ( = ?auto_393807 ?auto_393814 ) ) ( not ( = ?auto_393807 ?auto_393815 ) ) ( not ( = ?auto_393807 ?auto_393816 ) ) ( not ( = ?auto_393807 ?auto_393817 ) ) ( not ( = ?auto_393807 ?auto_393818 ) ) ( not ( = ?auto_393808 ?auto_393809 ) ) ( not ( = ?auto_393808 ?auto_393810 ) ) ( not ( = ?auto_393808 ?auto_393811 ) ) ( not ( = ?auto_393808 ?auto_393812 ) ) ( not ( = ?auto_393808 ?auto_393813 ) ) ( not ( = ?auto_393808 ?auto_393814 ) ) ( not ( = ?auto_393808 ?auto_393815 ) ) ( not ( = ?auto_393808 ?auto_393816 ) ) ( not ( = ?auto_393808 ?auto_393817 ) ) ( not ( = ?auto_393808 ?auto_393818 ) ) ( not ( = ?auto_393809 ?auto_393810 ) ) ( not ( = ?auto_393809 ?auto_393811 ) ) ( not ( = ?auto_393809 ?auto_393812 ) ) ( not ( = ?auto_393809 ?auto_393813 ) ) ( not ( = ?auto_393809 ?auto_393814 ) ) ( not ( = ?auto_393809 ?auto_393815 ) ) ( not ( = ?auto_393809 ?auto_393816 ) ) ( not ( = ?auto_393809 ?auto_393817 ) ) ( not ( = ?auto_393809 ?auto_393818 ) ) ( not ( = ?auto_393810 ?auto_393811 ) ) ( not ( = ?auto_393810 ?auto_393812 ) ) ( not ( = ?auto_393810 ?auto_393813 ) ) ( not ( = ?auto_393810 ?auto_393814 ) ) ( not ( = ?auto_393810 ?auto_393815 ) ) ( not ( = ?auto_393810 ?auto_393816 ) ) ( not ( = ?auto_393810 ?auto_393817 ) ) ( not ( = ?auto_393810 ?auto_393818 ) ) ( not ( = ?auto_393811 ?auto_393812 ) ) ( not ( = ?auto_393811 ?auto_393813 ) ) ( not ( = ?auto_393811 ?auto_393814 ) ) ( not ( = ?auto_393811 ?auto_393815 ) ) ( not ( = ?auto_393811 ?auto_393816 ) ) ( not ( = ?auto_393811 ?auto_393817 ) ) ( not ( = ?auto_393811 ?auto_393818 ) ) ( not ( = ?auto_393812 ?auto_393813 ) ) ( not ( = ?auto_393812 ?auto_393814 ) ) ( not ( = ?auto_393812 ?auto_393815 ) ) ( not ( = ?auto_393812 ?auto_393816 ) ) ( not ( = ?auto_393812 ?auto_393817 ) ) ( not ( = ?auto_393812 ?auto_393818 ) ) ( not ( = ?auto_393813 ?auto_393814 ) ) ( not ( = ?auto_393813 ?auto_393815 ) ) ( not ( = ?auto_393813 ?auto_393816 ) ) ( not ( = ?auto_393813 ?auto_393817 ) ) ( not ( = ?auto_393813 ?auto_393818 ) ) ( not ( = ?auto_393814 ?auto_393815 ) ) ( not ( = ?auto_393814 ?auto_393816 ) ) ( not ( = ?auto_393814 ?auto_393817 ) ) ( not ( = ?auto_393814 ?auto_393818 ) ) ( not ( = ?auto_393815 ?auto_393816 ) ) ( not ( = ?auto_393815 ?auto_393817 ) ) ( not ( = ?auto_393815 ?auto_393818 ) ) ( not ( = ?auto_393816 ?auto_393817 ) ) ( not ( = ?auto_393816 ?auto_393818 ) ) ( not ( = ?auto_393817 ?auto_393818 ) ) ( ON ?auto_393816 ?auto_393817 ) ( ON ?auto_393815 ?auto_393816 ) ( ON ?auto_393814 ?auto_393815 ) ( ON ?auto_393813 ?auto_393814 ) ( CLEAR ?auto_393811 ) ( ON ?auto_393812 ?auto_393813 ) ( CLEAR ?auto_393812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_393807 ?auto_393808 ?auto_393809 ?auto_393810 ?auto_393811 ?auto_393812 )
      ( MAKE-11PILE ?auto_393807 ?auto_393808 ?auto_393809 ?auto_393810 ?auto_393811 ?auto_393812 ?auto_393813 ?auto_393814 ?auto_393815 ?auto_393816 ?auto_393817 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393830 - BLOCK
      ?auto_393831 - BLOCK
      ?auto_393832 - BLOCK
      ?auto_393833 - BLOCK
      ?auto_393834 - BLOCK
      ?auto_393835 - BLOCK
      ?auto_393836 - BLOCK
      ?auto_393837 - BLOCK
      ?auto_393838 - BLOCK
      ?auto_393839 - BLOCK
      ?auto_393840 - BLOCK
    )
    :vars
    (
      ?auto_393841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393840 ?auto_393841 ) ( ON-TABLE ?auto_393830 ) ( ON ?auto_393831 ?auto_393830 ) ( ON ?auto_393832 ?auto_393831 ) ( ON ?auto_393833 ?auto_393832 ) ( ON ?auto_393834 ?auto_393833 ) ( not ( = ?auto_393830 ?auto_393831 ) ) ( not ( = ?auto_393830 ?auto_393832 ) ) ( not ( = ?auto_393830 ?auto_393833 ) ) ( not ( = ?auto_393830 ?auto_393834 ) ) ( not ( = ?auto_393830 ?auto_393835 ) ) ( not ( = ?auto_393830 ?auto_393836 ) ) ( not ( = ?auto_393830 ?auto_393837 ) ) ( not ( = ?auto_393830 ?auto_393838 ) ) ( not ( = ?auto_393830 ?auto_393839 ) ) ( not ( = ?auto_393830 ?auto_393840 ) ) ( not ( = ?auto_393830 ?auto_393841 ) ) ( not ( = ?auto_393831 ?auto_393832 ) ) ( not ( = ?auto_393831 ?auto_393833 ) ) ( not ( = ?auto_393831 ?auto_393834 ) ) ( not ( = ?auto_393831 ?auto_393835 ) ) ( not ( = ?auto_393831 ?auto_393836 ) ) ( not ( = ?auto_393831 ?auto_393837 ) ) ( not ( = ?auto_393831 ?auto_393838 ) ) ( not ( = ?auto_393831 ?auto_393839 ) ) ( not ( = ?auto_393831 ?auto_393840 ) ) ( not ( = ?auto_393831 ?auto_393841 ) ) ( not ( = ?auto_393832 ?auto_393833 ) ) ( not ( = ?auto_393832 ?auto_393834 ) ) ( not ( = ?auto_393832 ?auto_393835 ) ) ( not ( = ?auto_393832 ?auto_393836 ) ) ( not ( = ?auto_393832 ?auto_393837 ) ) ( not ( = ?auto_393832 ?auto_393838 ) ) ( not ( = ?auto_393832 ?auto_393839 ) ) ( not ( = ?auto_393832 ?auto_393840 ) ) ( not ( = ?auto_393832 ?auto_393841 ) ) ( not ( = ?auto_393833 ?auto_393834 ) ) ( not ( = ?auto_393833 ?auto_393835 ) ) ( not ( = ?auto_393833 ?auto_393836 ) ) ( not ( = ?auto_393833 ?auto_393837 ) ) ( not ( = ?auto_393833 ?auto_393838 ) ) ( not ( = ?auto_393833 ?auto_393839 ) ) ( not ( = ?auto_393833 ?auto_393840 ) ) ( not ( = ?auto_393833 ?auto_393841 ) ) ( not ( = ?auto_393834 ?auto_393835 ) ) ( not ( = ?auto_393834 ?auto_393836 ) ) ( not ( = ?auto_393834 ?auto_393837 ) ) ( not ( = ?auto_393834 ?auto_393838 ) ) ( not ( = ?auto_393834 ?auto_393839 ) ) ( not ( = ?auto_393834 ?auto_393840 ) ) ( not ( = ?auto_393834 ?auto_393841 ) ) ( not ( = ?auto_393835 ?auto_393836 ) ) ( not ( = ?auto_393835 ?auto_393837 ) ) ( not ( = ?auto_393835 ?auto_393838 ) ) ( not ( = ?auto_393835 ?auto_393839 ) ) ( not ( = ?auto_393835 ?auto_393840 ) ) ( not ( = ?auto_393835 ?auto_393841 ) ) ( not ( = ?auto_393836 ?auto_393837 ) ) ( not ( = ?auto_393836 ?auto_393838 ) ) ( not ( = ?auto_393836 ?auto_393839 ) ) ( not ( = ?auto_393836 ?auto_393840 ) ) ( not ( = ?auto_393836 ?auto_393841 ) ) ( not ( = ?auto_393837 ?auto_393838 ) ) ( not ( = ?auto_393837 ?auto_393839 ) ) ( not ( = ?auto_393837 ?auto_393840 ) ) ( not ( = ?auto_393837 ?auto_393841 ) ) ( not ( = ?auto_393838 ?auto_393839 ) ) ( not ( = ?auto_393838 ?auto_393840 ) ) ( not ( = ?auto_393838 ?auto_393841 ) ) ( not ( = ?auto_393839 ?auto_393840 ) ) ( not ( = ?auto_393839 ?auto_393841 ) ) ( not ( = ?auto_393840 ?auto_393841 ) ) ( ON ?auto_393839 ?auto_393840 ) ( ON ?auto_393838 ?auto_393839 ) ( ON ?auto_393837 ?auto_393838 ) ( ON ?auto_393836 ?auto_393837 ) ( CLEAR ?auto_393834 ) ( ON ?auto_393835 ?auto_393836 ) ( CLEAR ?auto_393835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_393830 ?auto_393831 ?auto_393832 ?auto_393833 ?auto_393834 ?auto_393835 )
      ( MAKE-11PILE ?auto_393830 ?auto_393831 ?auto_393832 ?auto_393833 ?auto_393834 ?auto_393835 ?auto_393836 ?auto_393837 ?auto_393838 ?auto_393839 ?auto_393840 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393853 - BLOCK
      ?auto_393854 - BLOCK
      ?auto_393855 - BLOCK
      ?auto_393856 - BLOCK
      ?auto_393857 - BLOCK
      ?auto_393858 - BLOCK
      ?auto_393859 - BLOCK
      ?auto_393860 - BLOCK
      ?auto_393861 - BLOCK
      ?auto_393862 - BLOCK
      ?auto_393863 - BLOCK
    )
    :vars
    (
      ?auto_393864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393863 ?auto_393864 ) ( ON-TABLE ?auto_393853 ) ( ON ?auto_393854 ?auto_393853 ) ( ON ?auto_393855 ?auto_393854 ) ( ON ?auto_393856 ?auto_393855 ) ( not ( = ?auto_393853 ?auto_393854 ) ) ( not ( = ?auto_393853 ?auto_393855 ) ) ( not ( = ?auto_393853 ?auto_393856 ) ) ( not ( = ?auto_393853 ?auto_393857 ) ) ( not ( = ?auto_393853 ?auto_393858 ) ) ( not ( = ?auto_393853 ?auto_393859 ) ) ( not ( = ?auto_393853 ?auto_393860 ) ) ( not ( = ?auto_393853 ?auto_393861 ) ) ( not ( = ?auto_393853 ?auto_393862 ) ) ( not ( = ?auto_393853 ?auto_393863 ) ) ( not ( = ?auto_393853 ?auto_393864 ) ) ( not ( = ?auto_393854 ?auto_393855 ) ) ( not ( = ?auto_393854 ?auto_393856 ) ) ( not ( = ?auto_393854 ?auto_393857 ) ) ( not ( = ?auto_393854 ?auto_393858 ) ) ( not ( = ?auto_393854 ?auto_393859 ) ) ( not ( = ?auto_393854 ?auto_393860 ) ) ( not ( = ?auto_393854 ?auto_393861 ) ) ( not ( = ?auto_393854 ?auto_393862 ) ) ( not ( = ?auto_393854 ?auto_393863 ) ) ( not ( = ?auto_393854 ?auto_393864 ) ) ( not ( = ?auto_393855 ?auto_393856 ) ) ( not ( = ?auto_393855 ?auto_393857 ) ) ( not ( = ?auto_393855 ?auto_393858 ) ) ( not ( = ?auto_393855 ?auto_393859 ) ) ( not ( = ?auto_393855 ?auto_393860 ) ) ( not ( = ?auto_393855 ?auto_393861 ) ) ( not ( = ?auto_393855 ?auto_393862 ) ) ( not ( = ?auto_393855 ?auto_393863 ) ) ( not ( = ?auto_393855 ?auto_393864 ) ) ( not ( = ?auto_393856 ?auto_393857 ) ) ( not ( = ?auto_393856 ?auto_393858 ) ) ( not ( = ?auto_393856 ?auto_393859 ) ) ( not ( = ?auto_393856 ?auto_393860 ) ) ( not ( = ?auto_393856 ?auto_393861 ) ) ( not ( = ?auto_393856 ?auto_393862 ) ) ( not ( = ?auto_393856 ?auto_393863 ) ) ( not ( = ?auto_393856 ?auto_393864 ) ) ( not ( = ?auto_393857 ?auto_393858 ) ) ( not ( = ?auto_393857 ?auto_393859 ) ) ( not ( = ?auto_393857 ?auto_393860 ) ) ( not ( = ?auto_393857 ?auto_393861 ) ) ( not ( = ?auto_393857 ?auto_393862 ) ) ( not ( = ?auto_393857 ?auto_393863 ) ) ( not ( = ?auto_393857 ?auto_393864 ) ) ( not ( = ?auto_393858 ?auto_393859 ) ) ( not ( = ?auto_393858 ?auto_393860 ) ) ( not ( = ?auto_393858 ?auto_393861 ) ) ( not ( = ?auto_393858 ?auto_393862 ) ) ( not ( = ?auto_393858 ?auto_393863 ) ) ( not ( = ?auto_393858 ?auto_393864 ) ) ( not ( = ?auto_393859 ?auto_393860 ) ) ( not ( = ?auto_393859 ?auto_393861 ) ) ( not ( = ?auto_393859 ?auto_393862 ) ) ( not ( = ?auto_393859 ?auto_393863 ) ) ( not ( = ?auto_393859 ?auto_393864 ) ) ( not ( = ?auto_393860 ?auto_393861 ) ) ( not ( = ?auto_393860 ?auto_393862 ) ) ( not ( = ?auto_393860 ?auto_393863 ) ) ( not ( = ?auto_393860 ?auto_393864 ) ) ( not ( = ?auto_393861 ?auto_393862 ) ) ( not ( = ?auto_393861 ?auto_393863 ) ) ( not ( = ?auto_393861 ?auto_393864 ) ) ( not ( = ?auto_393862 ?auto_393863 ) ) ( not ( = ?auto_393862 ?auto_393864 ) ) ( not ( = ?auto_393863 ?auto_393864 ) ) ( ON ?auto_393862 ?auto_393863 ) ( ON ?auto_393861 ?auto_393862 ) ( ON ?auto_393860 ?auto_393861 ) ( ON ?auto_393859 ?auto_393860 ) ( ON ?auto_393858 ?auto_393859 ) ( CLEAR ?auto_393856 ) ( ON ?auto_393857 ?auto_393858 ) ( CLEAR ?auto_393857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_393853 ?auto_393854 ?auto_393855 ?auto_393856 ?auto_393857 )
      ( MAKE-11PILE ?auto_393853 ?auto_393854 ?auto_393855 ?auto_393856 ?auto_393857 ?auto_393858 ?auto_393859 ?auto_393860 ?auto_393861 ?auto_393862 ?auto_393863 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393876 - BLOCK
      ?auto_393877 - BLOCK
      ?auto_393878 - BLOCK
      ?auto_393879 - BLOCK
      ?auto_393880 - BLOCK
      ?auto_393881 - BLOCK
      ?auto_393882 - BLOCK
      ?auto_393883 - BLOCK
      ?auto_393884 - BLOCK
      ?auto_393885 - BLOCK
      ?auto_393886 - BLOCK
    )
    :vars
    (
      ?auto_393887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393886 ?auto_393887 ) ( ON-TABLE ?auto_393876 ) ( ON ?auto_393877 ?auto_393876 ) ( ON ?auto_393878 ?auto_393877 ) ( ON ?auto_393879 ?auto_393878 ) ( not ( = ?auto_393876 ?auto_393877 ) ) ( not ( = ?auto_393876 ?auto_393878 ) ) ( not ( = ?auto_393876 ?auto_393879 ) ) ( not ( = ?auto_393876 ?auto_393880 ) ) ( not ( = ?auto_393876 ?auto_393881 ) ) ( not ( = ?auto_393876 ?auto_393882 ) ) ( not ( = ?auto_393876 ?auto_393883 ) ) ( not ( = ?auto_393876 ?auto_393884 ) ) ( not ( = ?auto_393876 ?auto_393885 ) ) ( not ( = ?auto_393876 ?auto_393886 ) ) ( not ( = ?auto_393876 ?auto_393887 ) ) ( not ( = ?auto_393877 ?auto_393878 ) ) ( not ( = ?auto_393877 ?auto_393879 ) ) ( not ( = ?auto_393877 ?auto_393880 ) ) ( not ( = ?auto_393877 ?auto_393881 ) ) ( not ( = ?auto_393877 ?auto_393882 ) ) ( not ( = ?auto_393877 ?auto_393883 ) ) ( not ( = ?auto_393877 ?auto_393884 ) ) ( not ( = ?auto_393877 ?auto_393885 ) ) ( not ( = ?auto_393877 ?auto_393886 ) ) ( not ( = ?auto_393877 ?auto_393887 ) ) ( not ( = ?auto_393878 ?auto_393879 ) ) ( not ( = ?auto_393878 ?auto_393880 ) ) ( not ( = ?auto_393878 ?auto_393881 ) ) ( not ( = ?auto_393878 ?auto_393882 ) ) ( not ( = ?auto_393878 ?auto_393883 ) ) ( not ( = ?auto_393878 ?auto_393884 ) ) ( not ( = ?auto_393878 ?auto_393885 ) ) ( not ( = ?auto_393878 ?auto_393886 ) ) ( not ( = ?auto_393878 ?auto_393887 ) ) ( not ( = ?auto_393879 ?auto_393880 ) ) ( not ( = ?auto_393879 ?auto_393881 ) ) ( not ( = ?auto_393879 ?auto_393882 ) ) ( not ( = ?auto_393879 ?auto_393883 ) ) ( not ( = ?auto_393879 ?auto_393884 ) ) ( not ( = ?auto_393879 ?auto_393885 ) ) ( not ( = ?auto_393879 ?auto_393886 ) ) ( not ( = ?auto_393879 ?auto_393887 ) ) ( not ( = ?auto_393880 ?auto_393881 ) ) ( not ( = ?auto_393880 ?auto_393882 ) ) ( not ( = ?auto_393880 ?auto_393883 ) ) ( not ( = ?auto_393880 ?auto_393884 ) ) ( not ( = ?auto_393880 ?auto_393885 ) ) ( not ( = ?auto_393880 ?auto_393886 ) ) ( not ( = ?auto_393880 ?auto_393887 ) ) ( not ( = ?auto_393881 ?auto_393882 ) ) ( not ( = ?auto_393881 ?auto_393883 ) ) ( not ( = ?auto_393881 ?auto_393884 ) ) ( not ( = ?auto_393881 ?auto_393885 ) ) ( not ( = ?auto_393881 ?auto_393886 ) ) ( not ( = ?auto_393881 ?auto_393887 ) ) ( not ( = ?auto_393882 ?auto_393883 ) ) ( not ( = ?auto_393882 ?auto_393884 ) ) ( not ( = ?auto_393882 ?auto_393885 ) ) ( not ( = ?auto_393882 ?auto_393886 ) ) ( not ( = ?auto_393882 ?auto_393887 ) ) ( not ( = ?auto_393883 ?auto_393884 ) ) ( not ( = ?auto_393883 ?auto_393885 ) ) ( not ( = ?auto_393883 ?auto_393886 ) ) ( not ( = ?auto_393883 ?auto_393887 ) ) ( not ( = ?auto_393884 ?auto_393885 ) ) ( not ( = ?auto_393884 ?auto_393886 ) ) ( not ( = ?auto_393884 ?auto_393887 ) ) ( not ( = ?auto_393885 ?auto_393886 ) ) ( not ( = ?auto_393885 ?auto_393887 ) ) ( not ( = ?auto_393886 ?auto_393887 ) ) ( ON ?auto_393885 ?auto_393886 ) ( ON ?auto_393884 ?auto_393885 ) ( ON ?auto_393883 ?auto_393884 ) ( ON ?auto_393882 ?auto_393883 ) ( ON ?auto_393881 ?auto_393882 ) ( CLEAR ?auto_393879 ) ( ON ?auto_393880 ?auto_393881 ) ( CLEAR ?auto_393880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_393876 ?auto_393877 ?auto_393878 ?auto_393879 ?auto_393880 )
      ( MAKE-11PILE ?auto_393876 ?auto_393877 ?auto_393878 ?auto_393879 ?auto_393880 ?auto_393881 ?auto_393882 ?auto_393883 ?auto_393884 ?auto_393885 ?auto_393886 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393899 - BLOCK
      ?auto_393900 - BLOCK
      ?auto_393901 - BLOCK
      ?auto_393902 - BLOCK
      ?auto_393903 - BLOCK
      ?auto_393904 - BLOCK
      ?auto_393905 - BLOCK
      ?auto_393906 - BLOCK
      ?auto_393907 - BLOCK
      ?auto_393908 - BLOCK
      ?auto_393909 - BLOCK
    )
    :vars
    (
      ?auto_393910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393909 ?auto_393910 ) ( ON-TABLE ?auto_393899 ) ( ON ?auto_393900 ?auto_393899 ) ( ON ?auto_393901 ?auto_393900 ) ( not ( = ?auto_393899 ?auto_393900 ) ) ( not ( = ?auto_393899 ?auto_393901 ) ) ( not ( = ?auto_393899 ?auto_393902 ) ) ( not ( = ?auto_393899 ?auto_393903 ) ) ( not ( = ?auto_393899 ?auto_393904 ) ) ( not ( = ?auto_393899 ?auto_393905 ) ) ( not ( = ?auto_393899 ?auto_393906 ) ) ( not ( = ?auto_393899 ?auto_393907 ) ) ( not ( = ?auto_393899 ?auto_393908 ) ) ( not ( = ?auto_393899 ?auto_393909 ) ) ( not ( = ?auto_393899 ?auto_393910 ) ) ( not ( = ?auto_393900 ?auto_393901 ) ) ( not ( = ?auto_393900 ?auto_393902 ) ) ( not ( = ?auto_393900 ?auto_393903 ) ) ( not ( = ?auto_393900 ?auto_393904 ) ) ( not ( = ?auto_393900 ?auto_393905 ) ) ( not ( = ?auto_393900 ?auto_393906 ) ) ( not ( = ?auto_393900 ?auto_393907 ) ) ( not ( = ?auto_393900 ?auto_393908 ) ) ( not ( = ?auto_393900 ?auto_393909 ) ) ( not ( = ?auto_393900 ?auto_393910 ) ) ( not ( = ?auto_393901 ?auto_393902 ) ) ( not ( = ?auto_393901 ?auto_393903 ) ) ( not ( = ?auto_393901 ?auto_393904 ) ) ( not ( = ?auto_393901 ?auto_393905 ) ) ( not ( = ?auto_393901 ?auto_393906 ) ) ( not ( = ?auto_393901 ?auto_393907 ) ) ( not ( = ?auto_393901 ?auto_393908 ) ) ( not ( = ?auto_393901 ?auto_393909 ) ) ( not ( = ?auto_393901 ?auto_393910 ) ) ( not ( = ?auto_393902 ?auto_393903 ) ) ( not ( = ?auto_393902 ?auto_393904 ) ) ( not ( = ?auto_393902 ?auto_393905 ) ) ( not ( = ?auto_393902 ?auto_393906 ) ) ( not ( = ?auto_393902 ?auto_393907 ) ) ( not ( = ?auto_393902 ?auto_393908 ) ) ( not ( = ?auto_393902 ?auto_393909 ) ) ( not ( = ?auto_393902 ?auto_393910 ) ) ( not ( = ?auto_393903 ?auto_393904 ) ) ( not ( = ?auto_393903 ?auto_393905 ) ) ( not ( = ?auto_393903 ?auto_393906 ) ) ( not ( = ?auto_393903 ?auto_393907 ) ) ( not ( = ?auto_393903 ?auto_393908 ) ) ( not ( = ?auto_393903 ?auto_393909 ) ) ( not ( = ?auto_393903 ?auto_393910 ) ) ( not ( = ?auto_393904 ?auto_393905 ) ) ( not ( = ?auto_393904 ?auto_393906 ) ) ( not ( = ?auto_393904 ?auto_393907 ) ) ( not ( = ?auto_393904 ?auto_393908 ) ) ( not ( = ?auto_393904 ?auto_393909 ) ) ( not ( = ?auto_393904 ?auto_393910 ) ) ( not ( = ?auto_393905 ?auto_393906 ) ) ( not ( = ?auto_393905 ?auto_393907 ) ) ( not ( = ?auto_393905 ?auto_393908 ) ) ( not ( = ?auto_393905 ?auto_393909 ) ) ( not ( = ?auto_393905 ?auto_393910 ) ) ( not ( = ?auto_393906 ?auto_393907 ) ) ( not ( = ?auto_393906 ?auto_393908 ) ) ( not ( = ?auto_393906 ?auto_393909 ) ) ( not ( = ?auto_393906 ?auto_393910 ) ) ( not ( = ?auto_393907 ?auto_393908 ) ) ( not ( = ?auto_393907 ?auto_393909 ) ) ( not ( = ?auto_393907 ?auto_393910 ) ) ( not ( = ?auto_393908 ?auto_393909 ) ) ( not ( = ?auto_393908 ?auto_393910 ) ) ( not ( = ?auto_393909 ?auto_393910 ) ) ( ON ?auto_393908 ?auto_393909 ) ( ON ?auto_393907 ?auto_393908 ) ( ON ?auto_393906 ?auto_393907 ) ( ON ?auto_393905 ?auto_393906 ) ( ON ?auto_393904 ?auto_393905 ) ( ON ?auto_393903 ?auto_393904 ) ( CLEAR ?auto_393901 ) ( ON ?auto_393902 ?auto_393903 ) ( CLEAR ?auto_393902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393899 ?auto_393900 ?auto_393901 ?auto_393902 )
      ( MAKE-11PILE ?auto_393899 ?auto_393900 ?auto_393901 ?auto_393902 ?auto_393903 ?auto_393904 ?auto_393905 ?auto_393906 ?auto_393907 ?auto_393908 ?auto_393909 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393922 - BLOCK
      ?auto_393923 - BLOCK
      ?auto_393924 - BLOCK
      ?auto_393925 - BLOCK
      ?auto_393926 - BLOCK
      ?auto_393927 - BLOCK
      ?auto_393928 - BLOCK
      ?auto_393929 - BLOCK
      ?auto_393930 - BLOCK
      ?auto_393931 - BLOCK
      ?auto_393932 - BLOCK
    )
    :vars
    (
      ?auto_393933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393932 ?auto_393933 ) ( ON-TABLE ?auto_393922 ) ( ON ?auto_393923 ?auto_393922 ) ( ON ?auto_393924 ?auto_393923 ) ( not ( = ?auto_393922 ?auto_393923 ) ) ( not ( = ?auto_393922 ?auto_393924 ) ) ( not ( = ?auto_393922 ?auto_393925 ) ) ( not ( = ?auto_393922 ?auto_393926 ) ) ( not ( = ?auto_393922 ?auto_393927 ) ) ( not ( = ?auto_393922 ?auto_393928 ) ) ( not ( = ?auto_393922 ?auto_393929 ) ) ( not ( = ?auto_393922 ?auto_393930 ) ) ( not ( = ?auto_393922 ?auto_393931 ) ) ( not ( = ?auto_393922 ?auto_393932 ) ) ( not ( = ?auto_393922 ?auto_393933 ) ) ( not ( = ?auto_393923 ?auto_393924 ) ) ( not ( = ?auto_393923 ?auto_393925 ) ) ( not ( = ?auto_393923 ?auto_393926 ) ) ( not ( = ?auto_393923 ?auto_393927 ) ) ( not ( = ?auto_393923 ?auto_393928 ) ) ( not ( = ?auto_393923 ?auto_393929 ) ) ( not ( = ?auto_393923 ?auto_393930 ) ) ( not ( = ?auto_393923 ?auto_393931 ) ) ( not ( = ?auto_393923 ?auto_393932 ) ) ( not ( = ?auto_393923 ?auto_393933 ) ) ( not ( = ?auto_393924 ?auto_393925 ) ) ( not ( = ?auto_393924 ?auto_393926 ) ) ( not ( = ?auto_393924 ?auto_393927 ) ) ( not ( = ?auto_393924 ?auto_393928 ) ) ( not ( = ?auto_393924 ?auto_393929 ) ) ( not ( = ?auto_393924 ?auto_393930 ) ) ( not ( = ?auto_393924 ?auto_393931 ) ) ( not ( = ?auto_393924 ?auto_393932 ) ) ( not ( = ?auto_393924 ?auto_393933 ) ) ( not ( = ?auto_393925 ?auto_393926 ) ) ( not ( = ?auto_393925 ?auto_393927 ) ) ( not ( = ?auto_393925 ?auto_393928 ) ) ( not ( = ?auto_393925 ?auto_393929 ) ) ( not ( = ?auto_393925 ?auto_393930 ) ) ( not ( = ?auto_393925 ?auto_393931 ) ) ( not ( = ?auto_393925 ?auto_393932 ) ) ( not ( = ?auto_393925 ?auto_393933 ) ) ( not ( = ?auto_393926 ?auto_393927 ) ) ( not ( = ?auto_393926 ?auto_393928 ) ) ( not ( = ?auto_393926 ?auto_393929 ) ) ( not ( = ?auto_393926 ?auto_393930 ) ) ( not ( = ?auto_393926 ?auto_393931 ) ) ( not ( = ?auto_393926 ?auto_393932 ) ) ( not ( = ?auto_393926 ?auto_393933 ) ) ( not ( = ?auto_393927 ?auto_393928 ) ) ( not ( = ?auto_393927 ?auto_393929 ) ) ( not ( = ?auto_393927 ?auto_393930 ) ) ( not ( = ?auto_393927 ?auto_393931 ) ) ( not ( = ?auto_393927 ?auto_393932 ) ) ( not ( = ?auto_393927 ?auto_393933 ) ) ( not ( = ?auto_393928 ?auto_393929 ) ) ( not ( = ?auto_393928 ?auto_393930 ) ) ( not ( = ?auto_393928 ?auto_393931 ) ) ( not ( = ?auto_393928 ?auto_393932 ) ) ( not ( = ?auto_393928 ?auto_393933 ) ) ( not ( = ?auto_393929 ?auto_393930 ) ) ( not ( = ?auto_393929 ?auto_393931 ) ) ( not ( = ?auto_393929 ?auto_393932 ) ) ( not ( = ?auto_393929 ?auto_393933 ) ) ( not ( = ?auto_393930 ?auto_393931 ) ) ( not ( = ?auto_393930 ?auto_393932 ) ) ( not ( = ?auto_393930 ?auto_393933 ) ) ( not ( = ?auto_393931 ?auto_393932 ) ) ( not ( = ?auto_393931 ?auto_393933 ) ) ( not ( = ?auto_393932 ?auto_393933 ) ) ( ON ?auto_393931 ?auto_393932 ) ( ON ?auto_393930 ?auto_393931 ) ( ON ?auto_393929 ?auto_393930 ) ( ON ?auto_393928 ?auto_393929 ) ( ON ?auto_393927 ?auto_393928 ) ( ON ?auto_393926 ?auto_393927 ) ( CLEAR ?auto_393924 ) ( ON ?auto_393925 ?auto_393926 ) ( CLEAR ?auto_393925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_393922 ?auto_393923 ?auto_393924 ?auto_393925 )
      ( MAKE-11PILE ?auto_393922 ?auto_393923 ?auto_393924 ?auto_393925 ?auto_393926 ?auto_393927 ?auto_393928 ?auto_393929 ?auto_393930 ?auto_393931 ?auto_393932 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393945 - BLOCK
      ?auto_393946 - BLOCK
      ?auto_393947 - BLOCK
      ?auto_393948 - BLOCK
      ?auto_393949 - BLOCK
      ?auto_393950 - BLOCK
      ?auto_393951 - BLOCK
      ?auto_393952 - BLOCK
      ?auto_393953 - BLOCK
      ?auto_393954 - BLOCK
      ?auto_393955 - BLOCK
    )
    :vars
    (
      ?auto_393956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393955 ?auto_393956 ) ( ON-TABLE ?auto_393945 ) ( ON ?auto_393946 ?auto_393945 ) ( not ( = ?auto_393945 ?auto_393946 ) ) ( not ( = ?auto_393945 ?auto_393947 ) ) ( not ( = ?auto_393945 ?auto_393948 ) ) ( not ( = ?auto_393945 ?auto_393949 ) ) ( not ( = ?auto_393945 ?auto_393950 ) ) ( not ( = ?auto_393945 ?auto_393951 ) ) ( not ( = ?auto_393945 ?auto_393952 ) ) ( not ( = ?auto_393945 ?auto_393953 ) ) ( not ( = ?auto_393945 ?auto_393954 ) ) ( not ( = ?auto_393945 ?auto_393955 ) ) ( not ( = ?auto_393945 ?auto_393956 ) ) ( not ( = ?auto_393946 ?auto_393947 ) ) ( not ( = ?auto_393946 ?auto_393948 ) ) ( not ( = ?auto_393946 ?auto_393949 ) ) ( not ( = ?auto_393946 ?auto_393950 ) ) ( not ( = ?auto_393946 ?auto_393951 ) ) ( not ( = ?auto_393946 ?auto_393952 ) ) ( not ( = ?auto_393946 ?auto_393953 ) ) ( not ( = ?auto_393946 ?auto_393954 ) ) ( not ( = ?auto_393946 ?auto_393955 ) ) ( not ( = ?auto_393946 ?auto_393956 ) ) ( not ( = ?auto_393947 ?auto_393948 ) ) ( not ( = ?auto_393947 ?auto_393949 ) ) ( not ( = ?auto_393947 ?auto_393950 ) ) ( not ( = ?auto_393947 ?auto_393951 ) ) ( not ( = ?auto_393947 ?auto_393952 ) ) ( not ( = ?auto_393947 ?auto_393953 ) ) ( not ( = ?auto_393947 ?auto_393954 ) ) ( not ( = ?auto_393947 ?auto_393955 ) ) ( not ( = ?auto_393947 ?auto_393956 ) ) ( not ( = ?auto_393948 ?auto_393949 ) ) ( not ( = ?auto_393948 ?auto_393950 ) ) ( not ( = ?auto_393948 ?auto_393951 ) ) ( not ( = ?auto_393948 ?auto_393952 ) ) ( not ( = ?auto_393948 ?auto_393953 ) ) ( not ( = ?auto_393948 ?auto_393954 ) ) ( not ( = ?auto_393948 ?auto_393955 ) ) ( not ( = ?auto_393948 ?auto_393956 ) ) ( not ( = ?auto_393949 ?auto_393950 ) ) ( not ( = ?auto_393949 ?auto_393951 ) ) ( not ( = ?auto_393949 ?auto_393952 ) ) ( not ( = ?auto_393949 ?auto_393953 ) ) ( not ( = ?auto_393949 ?auto_393954 ) ) ( not ( = ?auto_393949 ?auto_393955 ) ) ( not ( = ?auto_393949 ?auto_393956 ) ) ( not ( = ?auto_393950 ?auto_393951 ) ) ( not ( = ?auto_393950 ?auto_393952 ) ) ( not ( = ?auto_393950 ?auto_393953 ) ) ( not ( = ?auto_393950 ?auto_393954 ) ) ( not ( = ?auto_393950 ?auto_393955 ) ) ( not ( = ?auto_393950 ?auto_393956 ) ) ( not ( = ?auto_393951 ?auto_393952 ) ) ( not ( = ?auto_393951 ?auto_393953 ) ) ( not ( = ?auto_393951 ?auto_393954 ) ) ( not ( = ?auto_393951 ?auto_393955 ) ) ( not ( = ?auto_393951 ?auto_393956 ) ) ( not ( = ?auto_393952 ?auto_393953 ) ) ( not ( = ?auto_393952 ?auto_393954 ) ) ( not ( = ?auto_393952 ?auto_393955 ) ) ( not ( = ?auto_393952 ?auto_393956 ) ) ( not ( = ?auto_393953 ?auto_393954 ) ) ( not ( = ?auto_393953 ?auto_393955 ) ) ( not ( = ?auto_393953 ?auto_393956 ) ) ( not ( = ?auto_393954 ?auto_393955 ) ) ( not ( = ?auto_393954 ?auto_393956 ) ) ( not ( = ?auto_393955 ?auto_393956 ) ) ( ON ?auto_393954 ?auto_393955 ) ( ON ?auto_393953 ?auto_393954 ) ( ON ?auto_393952 ?auto_393953 ) ( ON ?auto_393951 ?auto_393952 ) ( ON ?auto_393950 ?auto_393951 ) ( ON ?auto_393949 ?auto_393950 ) ( ON ?auto_393948 ?auto_393949 ) ( CLEAR ?auto_393946 ) ( ON ?auto_393947 ?auto_393948 ) ( CLEAR ?auto_393947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393945 ?auto_393946 ?auto_393947 )
      ( MAKE-11PILE ?auto_393945 ?auto_393946 ?auto_393947 ?auto_393948 ?auto_393949 ?auto_393950 ?auto_393951 ?auto_393952 ?auto_393953 ?auto_393954 ?auto_393955 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393968 - BLOCK
      ?auto_393969 - BLOCK
      ?auto_393970 - BLOCK
      ?auto_393971 - BLOCK
      ?auto_393972 - BLOCK
      ?auto_393973 - BLOCK
      ?auto_393974 - BLOCK
      ?auto_393975 - BLOCK
      ?auto_393976 - BLOCK
      ?auto_393977 - BLOCK
      ?auto_393978 - BLOCK
    )
    :vars
    (
      ?auto_393979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_393978 ?auto_393979 ) ( ON-TABLE ?auto_393968 ) ( ON ?auto_393969 ?auto_393968 ) ( not ( = ?auto_393968 ?auto_393969 ) ) ( not ( = ?auto_393968 ?auto_393970 ) ) ( not ( = ?auto_393968 ?auto_393971 ) ) ( not ( = ?auto_393968 ?auto_393972 ) ) ( not ( = ?auto_393968 ?auto_393973 ) ) ( not ( = ?auto_393968 ?auto_393974 ) ) ( not ( = ?auto_393968 ?auto_393975 ) ) ( not ( = ?auto_393968 ?auto_393976 ) ) ( not ( = ?auto_393968 ?auto_393977 ) ) ( not ( = ?auto_393968 ?auto_393978 ) ) ( not ( = ?auto_393968 ?auto_393979 ) ) ( not ( = ?auto_393969 ?auto_393970 ) ) ( not ( = ?auto_393969 ?auto_393971 ) ) ( not ( = ?auto_393969 ?auto_393972 ) ) ( not ( = ?auto_393969 ?auto_393973 ) ) ( not ( = ?auto_393969 ?auto_393974 ) ) ( not ( = ?auto_393969 ?auto_393975 ) ) ( not ( = ?auto_393969 ?auto_393976 ) ) ( not ( = ?auto_393969 ?auto_393977 ) ) ( not ( = ?auto_393969 ?auto_393978 ) ) ( not ( = ?auto_393969 ?auto_393979 ) ) ( not ( = ?auto_393970 ?auto_393971 ) ) ( not ( = ?auto_393970 ?auto_393972 ) ) ( not ( = ?auto_393970 ?auto_393973 ) ) ( not ( = ?auto_393970 ?auto_393974 ) ) ( not ( = ?auto_393970 ?auto_393975 ) ) ( not ( = ?auto_393970 ?auto_393976 ) ) ( not ( = ?auto_393970 ?auto_393977 ) ) ( not ( = ?auto_393970 ?auto_393978 ) ) ( not ( = ?auto_393970 ?auto_393979 ) ) ( not ( = ?auto_393971 ?auto_393972 ) ) ( not ( = ?auto_393971 ?auto_393973 ) ) ( not ( = ?auto_393971 ?auto_393974 ) ) ( not ( = ?auto_393971 ?auto_393975 ) ) ( not ( = ?auto_393971 ?auto_393976 ) ) ( not ( = ?auto_393971 ?auto_393977 ) ) ( not ( = ?auto_393971 ?auto_393978 ) ) ( not ( = ?auto_393971 ?auto_393979 ) ) ( not ( = ?auto_393972 ?auto_393973 ) ) ( not ( = ?auto_393972 ?auto_393974 ) ) ( not ( = ?auto_393972 ?auto_393975 ) ) ( not ( = ?auto_393972 ?auto_393976 ) ) ( not ( = ?auto_393972 ?auto_393977 ) ) ( not ( = ?auto_393972 ?auto_393978 ) ) ( not ( = ?auto_393972 ?auto_393979 ) ) ( not ( = ?auto_393973 ?auto_393974 ) ) ( not ( = ?auto_393973 ?auto_393975 ) ) ( not ( = ?auto_393973 ?auto_393976 ) ) ( not ( = ?auto_393973 ?auto_393977 ) ) ( not ( = ?auto_393973 ?auto_393978 ) ) ( not ( = ?auto_393973 ?auto_393979 ) ) ( not ( = ?auto_393974 ?auto_393975 ) ) ( not ( = ?auto_393974 ?auto_393976 ) ) ( not ( = ?auto_393974 ?auto_393977 ) ) ( not ( = ?auto_393974 ?auto_393978 ) ) ( not ( = ?auto_393974 ?auto_393979 ) ) ( not ( = ?auto_393975 ?auto_393976 ) ) ( not ( = ?auto_393975 ?auto_393977 ) ) ( not ( = ?auto_393975 ?auto_393978 ) ) ( not ( = ?auto_393975 ?auto_393979 ) ) ( not ( = ?auto_393976 ?auto_393977 ) ) ( not ( = ?auto_393976 ?auto_393978 ) ) ( not ( = ?auto_393976 ?auto_393979 ) ) ( not ( = ?auto_393977 ?auto_393978 ) ) ( not ( = ?auto_393977 ?auto_393979 ) ) ( not ( = ?auto_393978 ?auto_393979 ) ) ( ON ?auto_393977 ?auto_393978 ) ( ON ?auto_393976 ?auto_393977 ) ( ON ?auto_393975 ?auto_393976 ) ( ON ?auto_393974 ?auto_393975 ) ( ON ?auto_393973 ?auto_393974 ) ( ON ?auto_393972 ?auto_393973 ) ( ON ?auto_393971 ?auto_393972 ) ( CLEAR ?auto_393969 ) ( ON ?auto_393970 ?auto_393971 ) ( CLEAR ?auto_393970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_393968 ?auto_393969 ?auto_393970 )
      ( MAKE-11PILE ?auto_393968 ?auto_393969 ?auto_393970 ?auto_393971 ?auto_393972 ?auto_393973 ?auto_393974 ?auto_393975 ?auto_393976 ?auto_393977 ?auto_393978 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_393991 - BLOCK
      ?auto_393992 - BLOCK
      ?auto_393993 - BLOCK
      ?auto_393994 - BLOCK
      ?auto_393995 - BLOCK
      ?auto_393996 - BLOCK
      ?auto_393997 - BLOCK
      ?auto_393998 - BLOCK
      ?auto_393999 - BLOCK
      ?auto_394000 - BLOCK
      ?auto_394001 - BLOCK
    )
    :vars
    (
      ?auto_394002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394001 ?auto_394002 ) ( ON-TABLE ?auto_393991 ) ( not ( = ?auto_393991 ?auto_393992 ) ) ( not ( = ?auto_393991 ?auto_393993 ) ) ( not ( = ?auto_393991 ?auto_393994 ) ) ( not ( = ?auto_393991 ?auto_393995 ) ) ( not ( = ?auto_393991 ?auto_393996 ) ) ( not ( = ?auto_393991 ?auto_393997 ) ) ( not ( = ?auto_393991 ?auto_393998 ) ) ( not ( = ?auto_393991 ?auto_393999 ) ) ( not ( = ?auto_393991 ?auto_394000 ) ) ( not ( = ?auto_393991 ?auto_394001 ) ) ( not ( = ?auto_393991 ?auto_394002 ) ) ( not ( = ?auto_393992 ?auto_393993 ) ) ( not ( = ?auto_393992 ?auto_393994 ) ) ( not ( = ?auto_393992 ?auto_393995 ) ) ( not ( = ?auto_393992 ?auto_393996 ) ) ( not ( = ?auto_393992 ?auto_393997 ) ) ( not ( = ?auto_393992 ?auto_393998 ) ) ( not ( = ?auto_393992 ?auto_393999 ) ) ( not ( = ?auto_393992 ?auto_394000 ) ) ( not ( = ?auto_393992 ?auto_394001 ) ) ( not ( = ?auto_393992 ?auto_394002 ) ) ( not ( = ?auto_393993 ?auto_393994 ) ) ( not ( = ?auto_393993 ?auto_393995 ) ) ( not ( = ?auto_393993 ?auto_393996 ) ) ( not ( = ?auto_393993 ?auto_393997 ) ) ( not ( = ?auto_393993 ?auto_393998 ) ) ( not ( = ?auto_393993 ?auto_393999 ) ) ( not ( = ?auto_393993 ?auto_394000 ) ) ( not ( = ?auto_393993 ?auto_394001 ) ) ( not ( = ?auto_393993 ?auto_394002 ) ) ( not ( = ?auto_393994 ?auto_393995 ) ) ( not ( = ?auto_393994 ?auto_393996 ) ) ( not ( = ?auto_393994 ?auto_393997 ) ) ( not ( = ?auto_393994 ?auto_393998 ) ) ( not ( = ?auto_393994 ?auto_393999 ) ) ( not ( = ?auto_393994 ?auto_394000 ) ) ( not ( = ?auto_393994 ?auto_394001 ) ) ( not ( = ?auto_393994 ?auto_394002 ) ) ( not ( = ?auto_393995 ?auto_393996 ) ) ( not ( = ?auto_393995 ?auto_393997 ) ) ( not ( = ?auto_393995 ?auto_393998 ) ) ( not ( = ?auto_393995 ?auto_393999 ) ) ( not ( = ?auto_393995 ?auto_394000 ) ) ( not ( = ?auto_393995 ?auto_394001 ) ) ( not ( = ?auto_393995 ?auto_394002 ) ) ( not ( = ?auto_393996 ?auto_393997 ) ) ( not ( = ?auto_393996 ?auto_393998 ) ) ( not ( = ?auto_393996 ?auto_393999 ) ) ( not ( = ?auto_393996 ?auto_394000 ) ) ( not ( = ?auto_393996 ?auto_394001 ) ) ( not ( = ?auto_393996 ?auto_394002 ) ) ( not ( = ?auto_393997 ?auto_393998 ) ) ( not ( = ?auto_393997 ?auto_393999 ) ) ( not ( = ?auto_393997 ?auto_394000 ) ) ( not ( = ?auto_393997 ?auto_394001 ) ) ( not ( = ?auto_393997 ?auto_394002 ) ) ( not ( = ?auto_393998 ?auto_393999 ) ) ( not ( = ?auto_393998 ?auto_394000 ) ) ( not ( = ?auto_393998 ?auto_394001 ) ) ( not ( = ?auto_393998 ?auto_394002 ) ) ( not ( = ?auto_393999 ?auto_394000 ) ) ( not ( = ?auto_393999 ?auto_394001 ) ) ( not ( = ?auto_393999 ?auto_394002 ) ) ( not ( = ?auto_394000 ?auto_394001 ) ) ( not ( = ?auto_394000 ?auto_394002 ) ) ( not ( = ?auto_394001 ?auto_394002 ) ) ( ON ?auto_394000 ?auto_394001 ) ( ON ?auto_393999 ?auto_394000 ) ( ON ?auto_393998 ?auto_393999 ) ( ON ?auto_393997 ?auto_393998 ) ( ON ?auto_393996 ?auto_393997 ) ( ON ?auto_393995 ?auto_393996 ) ( ON ?auto_393994 ?auto_393995 ) ( ON ?auto_393993 ?auto_393994 ) ( CLEAR ?auto_393991 ) ( ON ?auto_393992 ?auto_393993 ) ( CLEAR ?auto_393992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_393991 ?auto_393992 )
      ( MAKE-11PILE ?auto_393991 ?auto_393992 ?auto_393993 ?auto_393994 ?auto_393995 ?auto_393996 ?auto_393997 ?auto_393998 ?auto_393999 ?auto_394000 ?auto_394001 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_394014 - BLOCK
      ?auto_394015 - BLOCK
      ?auto_394016 - BLOCK
      ?auto_394017 - BLOCK
      ?auto_394018 - BLOCK
      ?auto_394019 - BLOCK
      ?auto_394020 - BLOCK
      ?auto_394021 - BLOCK
      ?auto_394022 - BLOCK
      ?auto_394023 - BLOCK
      ?auto_394024 - BLOCK
    )
    :vars
    (
      ?auto_394025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394024 ?auto_394025 ) ( ON-TABLE ?auto_394014 ) ( not ( = ?auto_394014 ?auto_394015 ) ) ( not ( = ?auto_394014 ?auto_394016 ) ) ( not ( = ?auto_394014 ?auto_394017 ) ) ( not ( = ?auto_394014 ?auto_394018 ) ) ( not ( = ?auto_394014 ?auto_394019 ) ) ( not ( = ?auto_394014 ?auto_394020 ) ) ( not ( = ?auto_394014 ?auto_394021 ) ) ( not ( = ?auto_394014 ?auto_394022 ) ) ( not ( = ?auto_394014 ?auto_394023 ) ) ( not ( = ?auto_394014 ?auto_394024 ) ) ( not ( = ?auto_394014 ?auto_394025 ) ) ( not ( = ?auto_394015 ?auto_394016 ) ) ( not ( = ?auto_394015 ?auto_394017 ) ) ( not ( = ?auto_394015 ?auto_394018 ) ) ( not ( = ?auto_394015 ?auto_394019 ) ) ( not ( = ?auto_394015 ?auto_394020 ) ) ( not ( = ?auto_394015 ?auto_394021 ) ) ( not ( = ?auto_394015 ?auto_394022 ) ) ( not ( = ?auto_394015 ?auto_394023 ) ) ( not ( = ?auto_394015 ?auto_394024 ) ) ( not ( = ?auto_394015 ?auto_394025 ) ) ( not ( = ?auto_394016 ?auto_394017 ) ) ( not ( = ?auto_394016 ?auto_394018 ) ) ( not ( = ?auto_394016 ?auto_394019 ) ) ( not ( = ?auto_394016 ?auto_394020 ) ) ( not ( = ?auto_394016 ?auto_394021 ) ) ( not ( = ?auto_394016 ?auto_394022 ) ) ( not ( = ?auto_394016 ?auto_394023 ) ) ( not ( = ?auto_394016 ?auto_394024 ) ) ( not ( = ?auto_394016 ?auto_394025 ) ) ( not ( = ?auto_394017 ?auto_394018 ) ) ( not ( = ?auto_394017 ?auto_394019 ) ) ( not ( = ?auto_394017 ?auto_394020 ) ) ( not ( = ?auto_394017 ?auto_394021 ) ) ( not ( = ?auto_394017 ?auto_394022 ) ) ( not ( = ?auto_394017 ?auto_394023 ) ) ( not ( = ?auto_394017 ?auto_394024 ) ) ( not ( = ?auto_394017 ?auto_394025 ) ) ( not ( = ?auto_394018 ?auto_394019 ) ) ( not ( = ?auto_394018 ?auto_394020 ) ) ( not ( = ?auto_394018 ?auto_394021 ) ) ( not ( = ?auto_394018 ?auto_394022 ) ) ( not ( = ?auto_394018 ?auto_394023 ) ) ( not ( = ?auto_394018 ?auto_394024 ) ) ( not ( = ?auto_394018 ?auto_394025 ) ) ( not ( = ?auto_394019 ?auto_394020 ) ) ( not ( = ?auto_394019 ?auto_394021 ) ) ( not ( = ?auto_394019 ?auto_394022 ) ) ( not ( = ?auto_394019 ?auto_394023 ) ) ( not ( = ?auto_394019 ?auto_394024 ) ) ( not ( = ?auto_394019 ?auto_394025 ) ) ( not ( = ?auto_394020 ?auto_394021 ) ) ( not ( = ?auto_394020 ?auto_394022 ) ) ( not ( = ?auto_394020 ?auto_394023 ) ) ( not ( = ?auto_394020 ?auto_394024 ) ) ( not ( = ?auto_394020 ?auto_394025 ) ) ( not ( = ?auto_394021 ?auto_394022 ) ) ( not ( = ?auto_394021 ?auto_394023 ) ) ( not ( = ?auto_394021 ?auto_394024 ) ) ( not ( = ?auto_394021 ?auto_394025 ) ) ( not ( = ?auto_394022 ?auto_394023 ) ) ( not ( = ?auto_394022 ?auto_394024 ) ) ( not ( = ?auto_394022 ?auto_394025 ) ) ( not ( = ?auto_394023 ?auto_394024 ) ) ( not ( = ?auto_394023 ?auto_394025 ) ) ( not ( = ?auto_394024 ?auto_394025 ) ) ( ON ?auto_394023 ?auto_394024 ) ( ON ?auto_394022 ?auto_394023 ) ( ON ?auto_394021 ?auto_394022 ) ( ON ?auto_394020 ?auto_394021 ) ( ON ?auto_394019 ?auto_394020 ) ( ON ?auto_394018 ?auto_394019 ) ( ON ?auto_394017 ?auto_394018 ) ( ON ?auto_394016 ?auto_394017 ) ( CLEAR ?auto_394014 ) ( ON ?auto_394015 ?auto_394016 ) ( CLEAR ?auto_394015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_394014 ?auto_394015 )
      ( MAKE-11PILE ?auto_394014 ?auto_394015 ?auto_394016 ?auto_394017 ?auto_394018 ?auto_394019 ?auto_394020 ?auto_394021 ?auto_394022 ?auto_394023 ?auto_394024 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_394037 - BLOCK
      ?auto_394038 - BLOCK
      ?auto_394039 - BLOCK
      ?auto_394040 - BLOCK
      ?auto_394041 - BLOCK
      ?auto_394042 - BLOCK
      ?auto_394043 - BLOCK
      ?auto_394044 - BLOCK
      ?auto_394045 - BLOCK
      ?auto_394046 - BLOCK
      ?auto_394047 - BLOCK
    )
    :vars
    (
      ?auto_394048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394047 ?auto_394048 ) ( not ( = ?auto_394037 ?auto_394038 ) ) ( not ( = ?auto_394037 ?auto_394039 ) ) ( not ( = ?auto_394037 ?auto_394040 ) ) ( not ( = ?auto_394037 ?auto_394041 ) ) ( not ( = ?auto_394037 ?auto_394042 ) ) ( not ( = ?auto_394037 ?auto_394043 ) ) ( not ( = ?auto_394037 ?auto_394044 ) ) ( not ( = ?auto_394037 ?auto_394045 ) ) ( not ( = ?auto_394037 ?auto_394046 ) ) ( not ( = ?auto_394037 ?auto_394047 ) ) ( not ( = ?auto_394037 ?auto_394048 ) ) ( not ( = ?auto_394038 ?auto_394039 ) ) ( not ( = ?auto_394038 ?auto_394040 ) ) ( not ( = ?auto_394038 ?auto_394041 ) ) ( not ( = ?auto_394038 ?auto_394042 ) ) ( not ( = ?auto_394038 ?auto_394043 ) ) ( not ( = ?auto_394038 ?auto_394044 ) ) ( not ( = ?auto_394038 ?auto_394045 ) ) ( not ( = ?auto_394038 ?auto_394046 ) ) ( not ( = ?auto_394038 ?auto_394047 ) ) ( not ( = ?auto_394038 ?auto_394048 ) ) ( not ( = ?auto_394039 ?auto_394040 ) ) ( not ( = ?auto_394039 ?auto_394041 ) ) ( not ( = ?auto_394039 ?auto_394042 ) ) ( not ( = ?auto_394039 ?auto_394043 ) ) ( not ( = ?auto_394039 ?auto_394044 ) ) ( not ( = ?auto_394039 ?auto_394045 ) ) ( not ( = ?auto_394039 ?auto_394046 ) ) ( not ( = ?auto_394039 ?auto_394047 ) ) ( not ( = ?auto_394039 ?auto_394048 ) ) ( not ( = ?auto_394040 ?auto_394041 ) ) ( not ( = ?auto_394040 ?auto_394042 ) ) ( not ( = ?auto_394040 ?auto_394043 ) ) ( not ( = ?auto_394040 ?auto_394044 ) ) ( not ( = ?auto_394040 ?auto_394045 ) ) ( not ( = ?auto_394040 ?auto_394046 ) ) ( not ( = ?auto_394040 ?auto_394047 ) ) ( not ( = ?auto_394040 ?auto_394048 ) ) ( not ( = ?auto_394041 ?auto_394042 ) ) ( not ( = ?auto_394041 ?auto_394043 ) ) ( not ( = ?auto_394041 ?auto_394044 ) ) ( not ( = ?auto_394041 ?auto_394045 ) ) ( not ( = ?auto_394041 ?auto_394046 ) ) ( not ( = ?auto_394041 ?auto_394047 ) ) ( not ( = ?auto_394041 ?auto_394048 ) ) ( not ( = ?auto_394042 ?auto_394043 ) ) ( not ( = ?auto_394042 ?auto_394044 ) ) ( not ( = ?auto_394042 ?auto_394045 ) ) ( not ( = ?auto_394042 ?auto_394046 ) ) ( not ( = ?auto_394042 ?auto_394047 ) ) ( not ( = ?auto_394042 ?auto_394048 ) ) ( not ( = ?auto_394043 ?auto_394044 ) ) ( not ( = ?auto_394043 ?auto_394045 ) ) ( not ( = ?auto_394043 ?auto_394046 ) ) ( not ( = ?auto_394043 ?auto_394047 ) ) ( not ( = ?auto_394043 ?auto_394048 ) ) ( not ( = ?auto_394044 ?auto_394045 ) ) ( not ( = ?auto_394044 ?auto_394046 ) ) ( not ( = ?auto_394044 ?auto_394047 ) ) ( not ( = ?auto_394044 ?auto_394048 ) ) ( not ( = ?auto_394045 ?auto_394046 ) ) ( not ( = ?auto_394045 ?auto_394047 ) ) ( not ( = ?auto_394045 ?auto_394048 ) ) ( not ( = ?auto_394046 ?auto_394047 ) ) ( not ( = ?auto_394046 ?auto_394048 ) ) ( not ( = ?auto_394047 ?auto_394048 ) ) ( ON ?auto_394046 ?auto_394047 ) ( ON ?auto_394045 ?auto_394046 ) ( ON ?auto_394044 ?auto_394045 ) ( ON ?auto_394043 ?auto_394044 ) ( ON ?auto_394042 ?auto_394043 ) ( ON ?auto_394041 ?auto_394042 ) ( ON ?auto_394040 ?auto_394041 ) ( ON ?auto_394039 ?auto_394040 ) ( ON ?auto_394038 ?auto_394039 ) ( ON ?auto_394037 ?auto_394038 ) ( CLEAR ?auto_394037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_394037 )
      ( MAKE-11PILE ?auto_394037 ?auto_394038 ?auto_394039 ?auto_394040 ?auto_394041 ?auto_394042 ?auto_394043 ?auto_394044 ?auto_394045 ?auto_394046 ?auto_394047 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_394060 - BLOCK
      ?auto_394061 - BLOCK
      ?auto_394062 - BLOCK
      ?auto_394063 - BLOCK
      ?auto_394064 - BLOCK
      ?auto_394065 - BLOCK
      ?auto_394066 - BLOCK
      ?auto_394067 - BLOCK
      ?auto_394068 - BLOCK
      ?auto_394069 - BLOCK
      ?auto_394070 - BLOCK
    )
    :vars
    (
      ?auto_394071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394070 ?auto_394071 ) ( not ( = ?auto_394060 ?auto_394061 ) ) ( not ( = ?auto_394060 ?auto_394062 ) ) ( not ( = ?auto_394060 ?auto_394063 ) ) ( not ( = ?auto_394060 ?auto_394064 ) ) ( not ( = ?auto_394060 ?auto_394065 ) ) ( not ( = ?auto_394060 ?auto_394066 ) ) ( not ( = ?auto_394060 ?auto_394067 ) ) ( not ( = ?auto_394060 ?auto_394068 ) ) ( not ( = ?auto_394060 ?auto_394069 ) ) ( not ( = ?auto_394060 ?auto_394070 ) ) ( not ( = ?auto_394060 ?auto_394071 ) ) ( not ( = ?auto_394061 ?auto_394062 ) ) ( not ( = ?auto_394061 ?auto_394063 ) ) ( not ( = ?auto_394061 ?auto_394064 ) ) ( not ( = ?auto_394061 ?auto_394065 ) ) ( not ( = ?auto_394061 ?auto_394066 ) ) ( not ( = ?auto_394061 ?auto_394067 ) ) ( not ( = ?auto_394061 ?auto_394068 ) ) ( not ( = ?auto_394061 ?auto_394069 ) ) ( not ( = ?auto_394061 ?auto_394070 ) ) ( not ( = ?auto_394061 ?auto_394071 ) ) ( not ( = ?auto_394062 ?auto_394063 ) ) ( not ( = ?auto_394062 ?auto_394064 ) ) ( not ( = ?auto_394062 ?auto_394065 ) ) ( not ( = ?auto_394062 ?auto_394066 ) ) ( not ( = ?auto_394062 ?auto_394067 ) ) ( not ( = ?auto_394062 ?auto_394068 ) ) ( not ( = ?auto_394062 ?auto_394069 ) ) ( not ( = ?auto_394062 ?auto_394070 ) ) ( not ( = ?auto_394062 ?auto_394071 ) ) ( not ( = ?auto_394063 ?auto_394064 ) ) ( not ( = ?auto_394063 ?auto_394065 ) ) ( not ( = ?auto_394063 ?auto_394066 ) ) ( not ( = ?auto_394063 ?auto_394067 ) ) ( not ( = ?auto_394063 ?auto_394068 ) ) ( not ( = ?auto_394063 ?auto_394069 ) ) ( not ( = ?auto_394063 ?auto_394070 ) ) ( not ( = ?auto_394063 ?auto_394071 ) ) ( not ( = ?auto_394064 ?auto_394065 ) ) ( not ( = ?auto_394064 ?auto_394066 ) ) ( not ( = ?auto_394064 ?auto_394067 ) ) ( not ( = ?auto_394064 ?auto_394068 ) ) ( not ( = ?auto_394064 ?auto_394069 ) ) ( not ( = ?auto_394064 ?auto_394070 ) ) ( not ( = ?auto_394064 ?auto_394071 ) ) ( not ( = ?auto_394065 ?auto_394066 ) ) ( not ( = ?auto_394065 ?auto_394067 ) ) ( not ( = ?auto_394065 ?auto_394068 ) ) ( not ( = ?auto_394065 ?auto_394069 ) ) ( not ( = ?auto_394065 ?auto_394070 ) ) ( not ( = ?auto_394065 ?auto_394071 ) ) ( not ( = ?auto_394066 ?auto_394067 ) ) ( not ( = ?auto_394066 ?auto_394068 ) ) ( not ( = ?auto_394066 ?auto_394069 ) ) ( not ( = ?auto_394066 ?auto_394070 ) ) ( not ( = ?auto_394066 ?auto_394071 ) ) ( not ( = ?auto_394067 ?auto_394068 ) ) ( not ( = ?auto_394067 ?auto_394069 ) ) ( not ( = ?auto_394067 ?auto_394070 ) ) ( not ( = ?auto_394067 ?auto_394071 ) ) ( not ( = ?auto_394068 ?auto_394069 ) ) ( not ( = ?auto_394068 ?auto_394070 ) ) ( not ( = ?auto_394068 ?auto_394071 ) ) ( not ( = ?auto_394069 ?auto_394070 ) ) ( not ( = ?auto_394069 ?auto_394071 ) ) ( not ( = ?auto_394070 ?auto_394071 ) ) ( ON ?auto_394069 ?auto_394070 ) ( ON ?auto_394068 ?auto_394069 ) ( ON ?auto_394067 ?auto_394068 ) ( ON ?auto_394066 ?auto_394067 ) ( ON ?auto_394065 ?auto_394066 ) ( ON ?auto_394064 ?auto_394065 ) ( ON ?auto_394063 ?auto_394064 ) ( ON ?auto_394062 ?auto_394063 ) ( ON ?auto_394061 ?auto_394062 ) ( ON ?auto_394060 ?auto_394061 ) ( CLEAR ?auto_394060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_394060 )
      ( MAKE-11PILE ?auto_394060 ?auto_394061 ?auto_394062 ?auto_394063 ?auto_394064 ?auto_394065 ?auto_394066 ?auto_394067 ?auto_394068 ?auto_394069 ?auto_394070 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394084 - BLOCK
      ?auto_394085 - BLOCK
      ?auto_394086 - BLOCK
      ?auto_394087 - BLOCK
      ?auto_394088 - BLOCK
      ?auto_394089 - BLOCK
      ?auto_394090 - BLOCK
      ?auto_394091 - BLOCK
      ?auto_394092 - BLOCK
      ?auto_394093 - BLOCK
      ?auto_394094 - BLOCK
      ?auto_394095 - BLOCK
    )
    :vars
    (
      ?auto_394096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_394094 ) ( ON ?auto_394095 ?auto_394096 ) ( CLEAR ?auto_394095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_394084 ) ( ON ?auto_394085 ?auto_394084 ) ( ON ?auto_394086 ?auto_394085 ) ( ON ?auto_394087 ?auto_394086 ) ( ON ?auto_394088 ?auto_394087 ) ( ON ?auto_394089 ?auto_394088 ) ( ON ?auto_394090 ?auto_394089 ) ( ON ?auto_394091 ?auto_394090 ) ( ON ?auto_394092 ?auto_394091 ) ( ON ?auto_394093 ?auto_394092 ) ( ON ?auto_394094 ?auto_394093 ) ( not ( = ?auto_394084 ?auto_394085 ) ) ( not ( = ?auto_394084 ?auto_394086 ) ) ( not ( = ?auto_394084 ?auto_394087 ) ) ( not ( = ?auto_394084 ?auto_394088 ) ) ( not ( = ?auto_394084 ?auto_394089 ) ) ( not ( = ?auto_394084 ?auto_394090 ) ) ( not ( = ?auto_394084 ?auto_394091 ) ) ( not ( = ?auto_394084 ?auto_394092 ) ) ( not ( = ?auto_394084 ?auto_394093 ) ) ( not ( = ?auto_394084 ?auto_394094 ) ) ( not ( = ?auto_394084 ?auto_394095 ) ) ( not ( = ?auto_394084 ?auto_394096 ) ) ( not ( = ?auto_394085 ?auto_394086 ) ) ( not ( = ?auto_394085 ?auto_394087 ) ) ( not ( = ?auto_394085 ?auto_394088 ) ) ( not ( = ?auto_394085 ?auto_394089 ) ) ( not ( = ?auto_394085 ?auto_394090 ) ) ( not ( = ?auto_394085 ?auto_394091 ) ) ( not ( = ?auto_394085 ?auto_394092 ) ) ( not ( = ?auto_394085 ?auto_394093 ) ) ( not ( = ?auto_394085 ?auto_394094 ) ) ( not ( = ?auto_394085 ?auto_394095 ) ) ( not ( = ?auto_394085 ?auto_394096 ) ) ( not ( = ?auto_394086 ?auto_394087 ) ) ( not ( = ?auto_394086 ?auto_394088 ) ) ( not ( = ?auto_394086 ?auto_394089 ) ) ( not ( = ?auto_394086 ?auto_394090 ) ) ( not ( = ?auto_394086 ?auto_394091 ) ) ( not ( = ?auto_394086 ?auto_394092 ) ) ( not ( = ?auto_394086 ?auto_394093 ) ) ( not ( = ?auto_394086 ?auto_394094 ) ) ( not ( = ?auto_394086 ?auto_394095 ) ) ( not ( = ?auto_394086 ?auto_394096 ) ) ( not ( = ?auto_394087 ?auto_394088 ) ) ( not ( = ?auto_394087 ?auto_394089 ) ) ( not ( = ?auto_394087 ?auto_394090 ) ) ( not ( = ?auto_394087 ?auto_394091 ) ) ( not ( = ?auto_394087 ?auto_394092 ) ) ( not ( = ?auto_394087 ?auto_394093 ) ) ( not ( = ?auto_394087 ?auto_394094 ) ) ( not ( = ?auto_394087 ?auto_394095 ) ) ( not ( = ?auto_394087 ?auto_394096 ) ) ( not ( = ?auto_394088 ?auto_394089 ) ) ( not ( = ?auto_394088 ?auto_394090 ) ) ( not ( = ?auto_394088 ?auto_394091 ) ) ( not ( = ?auto_394088 ?auto_394092 ) ) ( not ( = ?auto_394088 ?auto_394093 ) ) ( not ( = ?auto_394088 ?auto_394094 ) ) ( not ( = ?auto_394088 ?auto_394095 ) ) ( not ( = ?auto_394088 ?auto_394096 ) ) ( not ( = ?auto_394089 ?auto_394090 ) ) ( not ( = ?auto_394089 ?auto_394091 ) ) ( not ( = ?auto_394089 ?auto_394092 ) ) ( not ( = ?auto_394089 ?auto_394093 ) ) ( not ( = ?auto_394089 ?auto_394094 ) ) ( not ( = ?auto_394089 ?auto_394095 ) ) ( not ( = ?auto_394089 ?auto_394096 ) ) ( not ( = ?auto_394090 ?auto_394091 ) ) ( not ( = ?auto_394090 ?auto_394092 ) ) ( not ( = ?auto_394090 ?auto_394093 ) ) ( not ( = ?auto_394090 ?auto_394094 ) ) ( not ( = ?auto_394090 ?auto_394095 ) ) ( not ( = ?auto_394090 ?auto_394096 ) ) ( not ( = ?auto_394091 ?auto_394092 ) ) ( not ( = ?auto_394091 ?auto_394093 ) ) ( not ( = ?auto_394091 ?auto_394094 ) ) ( not ( = ?auto_394091 ?auto_394095 ) ) ( not ( = ?auto_394091 ?auto_394096 ) ) ( not ( = ?auto_394092 ?auto_394093 ) ) ( not ( = ?auto_394092 ?auto_394094 ) ) ( not ( = ?auto_394092 ?auto_394095 ) ) ( not ( = ?auto_394092 ?auto_394096 ) ) ( not ( = ?auto_394093 ?auto_394094 ) ) ( not ( = ?auto_394093 ?auto_394095 ) ) ( not ( = ?auto_394093 ?auto_394096 ) ) ( not ( = ?auto_394094 ?auto_394095 ) ) ( not ( = ?auto_394094 ?auto_394096 ) ) ( not ( = ?auto_394095 ?auto_394096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_394095 ?auto_394096 )
      ( !STACK ?auto_394095 ?auto_394094 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394109 - BLOCK
      ?auto_394110 - BLOCK
      ?auto_394111 - BLOCK
      ?auto_394112 - BLOCK
      ?auto_394113 - BLOCK
      ?auto_394114 - BLOCK
      ?auto_394115 - BLOCK
      ?auto_394116 - BLOCK
      ?auto_394117 - BLOCK
      ?auto_394118 - BLOCK
      ?auto_394119 - BLOCK
      ?auto_394120 - BLOCK
    )
    :vars
    (
      ?auto_394121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_394119 ) ( ON ?auto_394120 ?auto_394121 ) ( CLEAR ?auto_394120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_394109 ) ( ON ?auto_394110 ?auto_394109 ) ( ON ?auto_394111 ?auto_394110 ) ( ON ?auto_394112 ?auto_394111 ) ( ON ?auto_394113 ?auto_394112 ) ( ON ?auto_394114 ?auto_394113 ) ( ON ?auto_394115 ?auto_394114 ) ( ON ?auto_394116 ?auto_394115 ) ( ON ?auto_394117 ?auto_394116 ) ( ON ?auto_394118 ?auto_394117 ) ( ON ?auto_394119 ?auto_394118 ) ( not ( = ?auto_394109 ?auto_394110 ) ) ( not ( = ?auto_394109 ?auto_394111 ) ) ( not ( = ?auto_394109 ?auto_394112 ) ) ( not ( = ?auto_394109 ?auto_394113 ) ) ( not ( = ?auto_394109 ?auto_394114 ) ) ( not ( = ?auto_394109 ?auto_394115 ) ) ( not ( = ?auto_394109 ?auto_394116 ) ) ( not ( = ?auto_394109 ?auto_394117 ) ) ( not ( = ?auto_394109 ?auto_394118 ) ) ( not ( = ?auto_394109 ?auto_394119 ) ) ( not ( = ?auto_394109 ?auto_394120 ) ) ( not ( = ?auto_394109 ?auto_394121 ) ) ( not ( = ?auto_394110 ?auto_394111 ) ) ( not ( = ?auto_394110 ?auto_394112 ) ) ( not ( = ?auto_394110 ?auto_394113 ) ) ( not ( = ?auto_394110 ?auto_394114 ) ) ( not ( = ?auto_394110 ?auto_394115 ) ) ( not ( = ?auto_394110 ?auto_394116 ) ) ( not ( = ?auto_394110 ?auto_394117 ) ) ( not ( = ?auto_394110 ?auto_394118 ) ) ( not ( = ?auto_394110 ?auto_394119 ) ) ( not ( = ?auto_394110 ?auto_394120 ) ) ( not ( = ?auto_394110 ?auto_394121 ) ) ( not ( = ?auto_394111 ?auto_394112 ) ) ( not ( = ?auto_394111 ?auto_394113 ) ) ( not ( = ?auto_394111 ?auto_394114 ) ) ( not ( = ?auto_394111 ?auto_394115 ) ) ( not ( = ?auto_394111 ?auto_394116 ) ) ( not ( = ?auto_394111 ?auto_394117 ) ) ( not ( = ?auto_394111 ?auto_394118 ) ) ( not ( = ?auto_394111 ?auto_394119 ) ) ( not ( = ?auto_394111 ?auto_394120 ) ) ( not ( = ?auto_394111 ?auto_394121 ) ) ( not ( = ?auto_394112 ?auto_394113 ) ) ( not ( = ?auto_394112 ?auto_394114 ) ) ( not ( = ?auto_394112 ?auto_394115 ) ) ( not ( = ?auto_394112 ?auto_394116 ) ) ( not ( = ?auto_394112 ?auto_394117 ) ) ( not ( = ?auto_394112 ?auto_394118 ) ) ( not ( = ?auto_394112 ?auto_394119 ) ) ( not ( = ?auto_394112 ?auto_394120 ) ) ( not ( = ?auto_394112 ?auto_394121 ) ) ( not ( = ?auto_394113 ?auto_394114 ) ) ( not ( = ?auto_394113 ?auto_394115 ) ) ( not ( = ?auto_394113 ?auto_394116 ) ) ( not ( = ?auto_394113 ?auto_394117 ) ) ( not ( = ?auto_394113 ?auto_394118 ) ) ( not ( = ?auto_394113 ?auto_394119 ) ) ( not ( = ?auto_394113 ?auto_394120 ) ) ( not ( = ?auto_394113 ?auto_394121 ) ) ( not ( = ?auto_394114 ?auto_394115 ) ) ( not ( = ?auto_394114 ?auto_394116 ) ) ( not ( = ?auto_394114 ?auto_394117 ) ) ( not ( = ?auto_394114 ?auto_394118 ) ) ( not ( = ?auto_394114 ?auto_394119 ) ) ( not ( = ?auto_394114 ?auto_394120 ) ) ( not ( = ?auto_394114 ?auto_394121 ) ) ( not ( = ?auto_394115 ?auto_394116 ) ) ( not ( = ?auto_394115 ?auto_394117 ) ) ( not ( = ?auto_394115 ?auto_394118 ) ) ( not ( = ?auto_394115 ?auto_394119 ) ) ( not ( = ?auto_394115 ?auto_394120 ) ) ( not ( = ?auto_394115 ?auto_394121 ) ) ( not ( = ?auto_394116 ?auto_394117 ) ) ( not ( = ?auto_394116 ?auto_394118 ) ) ( not ( = ?auto_394116 ?auto_394119 ) ) ( not ( = ?auto_394116 ?auto_394120 ) ) ( not ( = ?auto_394116 ?auto_394121 ) ) ( not ( = ?auto_394117 ?auto_394118 ) ) ( not ( = ?auto_394117 ?auto_394119 ) ) ( not ( = ?auto_394117 ?auto_394120 ) ) ( not ( = ?auto_394117 ?auto_394121 ) ) ( not ( = ?auto_394118 ?auto_394119 ) ) ( not ( = ?auto_394118 ?auto_394120 ) ) ( not ( = ?auto_394118 ?auto_394121 ) ) ( not ( = ?auto_394119 ?auto_394120 ) ) ( not ( = ?auto_394119 ?auto_394121 ) ) ( not ( = ?auto_394120 ?auto_394121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_394120 ?auto_394121 )
      ( !STACK ?auto_394120 ?auto_394119 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394134 - BLOCK
      ?auto_394135 - BLOCK
      ?auto_394136 - BLOCK
      ?auto_394137 - BLOCK
      ?auto_394138 - BLOCK
      ?auto_394139 - BLOCK
      ?auto_394140 - BLOCK
      ?auto_394141 - BLOCK
      ?auto_394142 - BLOCK
      ?auto_394143 - BLOCK
      ?auto_394144 - BLOCK
      ?auto_394145 - BLOCK
    )
    :vars
    (
      ?auto_394146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394145 ?auto_394146 ) ( ON-TABLE ?auto_394134 ) ( ON ?auto_394135 ?auto_394134 ) ( ON ?auto_394136 ?auto_394135 ) ( ON ?auto_394137 ?auto_394136 ) ( ON ?auto_394138 ?auto_394137 ) ( ON ?auto_394139 ?auto_394138 ) ( ON ?auto_394140 ?auto_394139 ) ( ON ?auto_394141 ?auto_394140 ) ( ON ?auto_394142 ?auto_394141 ) ( ON ?auto_394143 ?auto_394142 ) ( not ( = ?auto_394134 ?auto_394135 ) ) ( not ( = ?auto_394134 ?auto_394136 ) ) ( not ( = ?auto_394134 ?auto_394137 ) ) ( not ( = ?auto_394134 ?auto_394138 ) ) ( not ( = ?auto_394134 ?auto_394139 ) ) ( not ( = ?auto_394134 ?auto_394140 ) ) ( not ( = ?auto_394134 ?auto_394141 ) ) ( not ( = ?auto_394134 ?auto_394142 ) ) ( not ( = ?auto_394134 ?auto_394143 ) ) ( not ( = ?auto_394134 ?auto_394144 ) ) ( not ( = ?auto_394134 ?auto_394145 ) ) ( not ( = ?auto_394134 ?auto_394146 ) ) ( not ( = ?auto_394135 ?auto_394136 ) ) ( not ( = ?auto_394135 ?auto_394137 ) ) ( not ( = ?auto_394135 ?auto_394138 ) ) ( not ( = ?auto_394135 ?auto_394139 ) ) ( not ( = ?auto_394135 ?auto_394140 ) ) ( not ( = ?auto_394135 ?auto_394141 ) ) ( not ( = ?auto_394135 ?auto_394142 ) ) ( not ( = ?auto_394135 ?auto_394143 ) ) ( not ( = ?auto_394135 ?auto_394144 ) ) ( not ( = ?auto_394135 ?auto_394145 ) ) ( not ( = ?auto_394135 ?auto_394146 ) ) ( not ( = ?auto_394136 ?auto_394137 ) ) ( not ( = ?auto_394136 ?auto_394138 ) ) ( not ( = ?auto_394136 ?auto_394139 ) ) ( not ( = ?auto_394136 ?auto_394140 ) ) ( not ( = ?auto_394136 ?auto_394141 ) ) ( not ( = ?auto_394136 ?auto_394142 ) ) ( not ( = ?auto_394136 ?auto_394143 ) ) ( not ( = ?auto_394136 ?auto_394144 ) ) ( not ( = ?auto_394136 ?auto_394145 ) ) ( not ( = ?auto_394136 ?auto_394146 ) ) ( not ( = ?auto_394137 ?auto_394138 ) ) ( not ( = ?auto_394137 ?auto_394139 ) ) ( not ( = ?auto_394137 ?auto_394140 ) ) ( not ( = ?auto_394137 ?auto_394141 ) ) ( not ( = ?auto_394137 ?auto_394142 ) ) ( not ( = ?auto_394137 ?auto_394143 ) ) ( not ( = ?auto_394137 ?auto_394144 ) ) ( not ( = ?auto_394137 ?auto_394145 ) ) ( not ( = ?auto_394137 ?auto_394146 ) ) ( not ( = ?auto_394138 ?auto_394139 ) ) ( not ( = ?auto_394138 ?auto_394140 ) ) ( not ( = ?auto_394138 ?auto_394141 ) ) ( not ( = ?auto_394138 ?auto_394142 ) ) ( not ( = ?auto_394138 ?auto_394143 ) ) ( not ( = ?auto_394138 ?auto_394144 ) ) ( not ( = ?auto_394138 ?auto_394145 ) ) ( not ( = ?auto_394138 ?auto_394146 ) ) ( not ( = ?auto_394139 ?auto_394140 ) ) ( not ( = ?auto_394139 ?auto_394141 ) ) ( not ( = ?auto_394139 ?auto_394142 ) ) ( not ( = ?auto_394139 ?auto_394143 ) ) ( not ( = ?auto_394139 ?auto_394144 ) ) ( not ( = ?auto_394139 ?auto_394145 ) ) ( not ( = ?auto_394139 ?auto_394146 ) ) ( not ( = ?auto_394140 ?auto_394141 ) ) ( not ( = ?auto_394140 ?auto_394142 ) ) ( not ( = ?auto_394140 ?auto_394143 ) ) ( not ( = ?auto_394140 ?auto_394144 ) ) ( not ( = ?auto_394140 ?auto_394145 ) ) ( not ( = ?auto_394140 ?auto_394146 ) ) ( not ( = ?auto_394141 ?auto_394142 ) ) ( not ( = ?auto_394141 ?auto_394143 ) ) ( not ( = ?auto_394141 ?auto_394144 ) ) ( not ( = ?auto_394141 ?auto_394145 ) ) ( not ( = ?auto_394141 ?auto_394146 ) ) ( not ( = ?auto_394142 ?auto_394143 ) ) ( not ( = ?auto_394142 ?auto_394144 ) ) ( not ( = ?auto_394142 ?auto_394145 ) ) ( not ( = ?auto_394142 ?auto_394146 ) ) ( not ( = ?auto_394143 ?auto_394144 ) ) ( not ( = ?auto_394143 ?auto_394145 ) ) ( not ( = ?auto_394143 ?auto_394146 ) ) ( not ( = ?auto_394144 ?auto_394145 ) ) ( not ( = ?auto_394144 ?auto_394146 ) ) ( not ( = ?auto_394145 ?auto_394146 ) ) ( CLEAR ?auto_394143 ) ( ON ?auto_394144 ?auto_394145 ) ( CLEAR ?auto_394144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_394134 ?auto_394135 ?auto_394136 ?auto_394137 ?auto_394138 ?auto_394139 ?auto_394140 ?auto_394141 ?auto_394142 ?auto_394143 ?auto_394144 )
      ( MAKE-12PILE ?auto_394134 ?auto_394135 ?auto_394136 ?auto_394137 ?auto_394138 ?auto_394139 ?auto_394140 ?auto_394141 ?auto_394142 ?auto_394143 ?auto_394144 ?auto_394145 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394159 - BLOCK
      ?auto_394160 - BLOCK
      ?auto_394161 - BLOCK
      ?auto_394162 - BLOCK
      ?auto_394163 - BLOCK
      ?auto_394164 - BLOCK
      ?auto_394165 - BLOCK
      ?auto_394166 - BLOCK
      ?auto_394167 - BLOCK
      ?auto_394168 - BLOCK
      ?auto_394169 - BLOCK
      ?auto_394170 - BLOCK
    )
    :vars
    (
      ?auto_394171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394170 ?auto_394171 ) ( ON-TABLE ?auto_394159 ) ( ON ?auto_394160 ?auto_394159 ) ( ON ?auto_394161 ?auto_394160 ) ( ON ?auto_394162 ?auto_394161 ) ( ON ?auto_394163 ?auto_394162 ) ( ON ?auto_394164 ?auto_394163 ) ( ON ?auto_394165 ?auto_394164 ) ( ON ?auto_394166 ?auto_394165 ) ( ON ?auto_394167 ?auto_394166 ) ( ON ?auto_394168 ?auto_394167 ) ( not ( = ?auto_394159 ?auto_394160 ) ) ( not ( = ?auto_394159 ?auto_394161 ) ) ( not ( = ?auto_394159 ?auto_394162 ) ) ( not ( = ?auto_394159 ?auto_394163 ) ) ( not ( = ?auto_394159 ?auto_394164 ) ) ( not ( = ?auto_394159 ?auto_394165 ) ) ( not ( = ?auto_394159 ?auto_394166 ) ) ( not ( = ?auto_394159 ?auto_394167 ) ) ( not ( = ?auto_394159 ?auto_394168 ) ) ( not ( = ?auto_394159 ?auto_394169 ) ) ( not ( = ?auto_394159 ?auto_394170 ) ) ( not ( = ?auto_394159 ?auto_394171 ) ) ( not ( = ?auto_394160 ?auto_394161 ) ) ( not ( = ?auto_394160 ?auto_394162 ) ) ( not ( = ?auto_394160 ?auto_394163 ) ) ( not ( = ?auto_394160 ?auto_394164 ) ) ( not ( = ?auto_394160 ?auto_394165 ) ) ( not ( = ?auto_394160 ?auto_394166 ) ) ( not ( = ?auto_394160 ?auto_394167 ) ) ( not ( = ?auto_394160 ?auto_394168 ) ) ( not ( = ?auto_394160 ?auto_394169 ) ) ( not ( = ?auto_394160 ?auto_394170 ) ) ( not ( = ?auto_394160 ?auto_394171 ) ) ( not ( = ?auto_394161 ?auto_394162 ) ) ( not ( = ?auto_394161 ?auto_394163 ) ) ( not ( = ?auto_394161 ?auto_394164 ) ) ( not ( = ?auto_394161 ?auto_394165 ) ) ( not ( = ?auto_394161 ?auto_394166 ) ) ( not ( = ?auto_394161 ?auto_394167 ) ) ( not ( = ?auto_394161 ?auto_394168 ) ) ( not ( = ?auto_394161 ?auto_394169 ) ) ( not ( = ?auto_394161 ?auto_394170 ) ) ( not ( = ?auto_394161 ?auto_394171 ) ) ( not ( = ?auto_394162 ?auto_394163 ) ) ( not ( = ?auto_394162 ?auto_394164 ) ) ( not ( = ?auto_394162 ?auto_394165 ) ) ( not ( = ?auto_394162 ?auto_394166 ) ) ( not ( = ?auto_394162 ?auto_394167 ) ) ( not ( = ?auto_394162 ?auto_394168 ) ) ( not ( = ?auto_394162 ?auto_394169 ) ) ( not ( = ?auto_394162 ?auto_394170 ) ) ( not ( = ?auto_394162 ?auto_394171 ) ) ( not ( = ?auto_394163 ?auto_394164 ) ) ( not ( = ?auto_394163 ?auto_394165 ) ) ( not ( = ?auto_394163 ?auto_394166 ) ) ( not ( = ?auto_394163 ?auto_394167 ) ) ( not ( = ?auto_394163 ?auto_394168 ) ) ( not ( = ?auto_394163 ?auto_394169 ) ) ( not ( = ?auto_394163 ?auto_394170 ) ) ( not ( = ?auto_394163 ?auto_394171 ) ) ( not ( = ?auto_394164 ?auto_394165 ) ) ( not ( = ?auto_394164 ?auto_394166 ) ) ( not ( = ?auto_394164 ?auto_394167 ) ) ( not ( = ?auto_394164 ?auto_394168 ) ) ( not ( = ?auto_394164 ?auto_394169 ) ) ( not ( = ?auto_394164 ?auto_394170 ) ) ( not ( = ?auto_394164 ?auto_394171 ) ) ( not ( = ?auto_394165 ?auto_394166 ) ) ( not ( = ?auto_394165 ?auto_394167 ) ) ( not ( = ?auto_394165 ?auto_394168 ) ) ( not ( = ?auto_394165 ?auto_394169 ) ) ( not ( = ?auto_394165 ?auto_394170 ) ) ( not ( = ?auto_394165 ?auto_394171 ) ) ( not ( = ?auto_394166 ?auto_394167 ) ) ( not ( = ?auto_394166 ?auto_394168 ) ) ( not ( = ?auto_394166 ?auto_394169 ) ) ( not ( = ?auto_394166 ?auto_394170 ) ) ( not ( = ?auto_394166 ?auto_394171 ) ) ( not ( = ?auto_394167 ?auto_394168 ) ) ( not ( = ?auto_394167 ?auto_394169 ) ) ( not ( = ?auto_394167 ?auto_394170 ) ) ( not ( = ?auto_394167 ?auto_394171 ) ) ( not ( = ?auto_394168 ?auto_394169 ) ) ( not ( = ?auto_394168 ?auto_394170 ) ) ( not ( = ?auto_394168 ?auto_394171 ) ) ( not ( = ?auto_394169 ?auto_394170 ) ) ( not ( = ?auto_394169 ?auto_394171 ) ) ( not ( = ?auto_394170 ?auto_394171 ) ) ( CLEAR ?auto_394168 ) ( ON ?auto_394169 ?auto_394170 ) ( CLEAR ?auto_394169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_394159 ?auto_394160 ?auto_394161 ?auto_394162 ?auto_394163 ?auto_394164 ?auto_394165 ?auto_394166 ?auto_394167 ?auto_394168 ?auto_394169 )
      ( MAKE-12PILE ?auto_394159 ?auto_394160 ?auto_394161 ?auto_394162 ?auto_394163 ?auto_394164 ?auto_394165 ?auto_394166 ?auto_394167 ?auto_394168 ?auto_394169 ?auto_394170 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394184 - BLOCK
      ?auto_394185 - BLOCK
      ?auto_394186 - BLOCK
      ?auto_394187 - BLOCK
      ?auto_394188 - BLOCK
      ?auto_394189 - BLOCK
      ?auto_394190 - BLOCK
      ?auto_394191 - BLOCK
      ?auto_394192 - BLOCK
      ?auto_394193 - BLOCK
      ?auto_394194 - BLOCK
      ?auto_394195 - BLOCK
    )
    :vars
    (
      ?auto_394196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394195 ?auto_394196 ) ( ON-TABLE ?auto_394184 ) ( ON ?auto_394185 ?auto_394184 ) ( ON ?auto_394186 ?auto_394185 ) ( ON ?auto_394187 ?auto_394186 ) ( ON ?auto_394188 ?auto_394187 ) ( ON ?auto_394189 ?auto_394188 ) ( ON ?auto_394190 ?auto_394189 ) ( ON ?auto_394191 ?auto_394190 ) ( ON ?auto_394192 ?auto_394191 ) ( not ( = ?auto_394184 ?auto_394185 ) ) ( not ( = ?auto_394184 ?auto_394186 ) ) ( not ( = ?auto_394184 ?auto_394187 ) ) ( not ( = ?auto_394184 ?auto_394188 ) ) ( not ( = ?auto_394184 ?auto_394189 ) ) ( not ( = ?auto_394184 ?auto_394190 ) ) ( not ( = ?auto_394184 ?auto_394191 ) ) ( not ( = ?auto_394184 ?auto_394192 ) ) ( not ( = ?auto_394184 ?auto_394193 ) ) ( not ( = ?auto_394184 ?auto_394194 ) ) ( not ( = ?auto_394184 ?auto_394195 ) ) ( not ( = ?auto_394184 ?auto_394196 ) ) ( not ( = ?auto_394185 ?auto_394186 ) ) ( not ( = ?auto_394185 ?auto_394187 ) ) ( not ( = ?auto_394185 ?auto_394188 ) ) ( not ( = ?auto_394185 ?auto_394189 ) ) ( not ( = ?auto_394185 ?auto_394190 ) ) ( not ( = ?auto_394185 ?auto_394191 ) ) ( not ( = ?auto_394185 ?auto_394192 ) ) ( not ( = ?auto_394185 ?auto_394193 ) ) ( not ( = ?auto_394185 ?auto_394194 ) ) ( not ( = ?auto_394185 ?auto_394195 ) ) ( not ( = ?auto_394185 ?auto_394196 ) ) ( not ( = ?auto_394186 ?auto_394187 ) ) ( not ( = ?auto_394186 ?auto_394188 ) ) ( not ( = ?auto_394186 ?auto_394189 ) ) ( not ( = ?auto_394186 ?auto_394190 ) ) ( not ( = ?auto_394186 ?auto_394191 ) ) ( not ( = ?auto_394186 ?auto_394192 ) ) ( not ( = ?auto_394186 ?auto_394193 ) ) ( not ( = ?auto_394186 ?auto_394194 ) ) ( not ( = ?auto_394186 ?auto_394195 ) ) ( not ( = ?auto_394186 ?auto_394196 ) ) ( not ( = ?auto_394187 ?auto_394188 ) ) ( not ( = ?auto_394187 ?auto_394189 ) ) ( not ( = ?auto_394187 ?auto_394190 ) ) ( not ( = ?auto_394187 ?auto_394191 ) ) ( not ( = ?auto_394187 ?auto_394192 ) ) ( not ( = ?auto_394187 ?auto_394193 ) ) ( not ( = ?auto_394187 ?auto_394194 ) ) ( not ( = ?auto_394187 ?auto_394195 ) ) ( not ( = ?auto_394187 ?auto_394196 ) ) ( not ( = ?auto_394188 ?auto_394189 ) ) ( not ( = ?auto_394188 ?auto_394190 ) ) ( not ( = ?auto_394188 ?auto_394191 ) ) ( not ( = ?auto_394188 ?auto_394192 ) ) ( not ( = ?auto_394188 ?auto_394193 ) ) ( not ( = ?auto_394188 ?auto_394194 ) ) ( not ( = ?auto_394188 ?auto_394195 ) ) ( not ( = ?auto_394188 ?auto_394196 ) ) ( not ( = ?auto_394189 ?auto_394190 ) ) ( not ( = ?auto_394189 ?auto_394191 ) ) ( not ( = ?auto_394189 ?auto_394192 ) ) ( not ( = ?auto_394189 ?auto_394193 ) ) ( not ( = ?auto_394189 ?auto_394194 ) ) ( not ( = ?auto_394189 ?auto_394195 ) ) ( not ( = ?auto_394189 ?auto_394196 ) ) ( not ( = ?auto_394190 ?auto_394191 ) ) ( not ( = ?auto_394190 ?auto_394192 ) ) ( not ( = ?auto_394190 ?auto_394193 ) ) ( not ( = ?auto_394190 ?auto_394194 ) ) ( not ( = ?auto_394190 ?auto_394195 ) ) ( not ( = ?auto_394190 ?auto_394196 ) ) ( not ( = ?auto_394191 ?auto_394192 ) ) ( not ( = ?auto_394191 ?auto_394193 ) ) ( not ( = ?auto_394191 ?auto_394194 ) ) ( not ( = ?auto_394191 ?auto_394195 ) ) ( not ( = ?auto_394191 ?auto_394196 ) ) ( not ( = ?auto_394192 ?auto_394193 ) ) ( not ( = ?auto_394192 ?auto_394194 ) ) ( not ( = ?auto_394192 ?auto_394195 ) ) ( not ( = ?auto_394192 ?auto_394196 ) ) ( not ( = ?auto_394193 ?auto_394194 ) ) ( not ( = ?auto_394193 ?auto_394195 ) ) ( not ( = ?auto_394193 ?auto_394196 ) ) ( not ( = ?auto_394194 ?auto_394195 ) ) ( not ( = ?auto_394194 ?auto_394196 ) ) ( not ( = ?auto_394195 ?auto_394196 ) ) ( ON ?auto_394194 ?auto_394195 ) ( CLEAR ?auto_394192 ) ( ON ?auto_394193 ?auto_394194 ) ( CLEAR ?auto_394193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_394184 ?auto_394185 ?auto_394186 ?auto_394187 ?auto_394188 ?auto_394189 ?auto_394190 ?auto_394191 ?auto_394192 ?auto_394193 )
      ( MAKE-12PILE ?auto_394184 ?auto_394185 ?auto_394186 ?auto_394187 ?auto_394188 ?auto_394189 ?auto_394190 ?auto_394191 ?auto_394192 ?auto_394193 ?auto_394194 ?auto_394195 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394209 - BLOCK
      ?auto_394210 - BLOCK
      ?auto_394211 - BLOCK
      ?auto_394212 - BLOCK
      ?auto_394213 - BLOCK
      ?auto_394214 - BLOCK
      ?auto_394215 - BLOCK
      ?auto_394216 - BLOCK
      ?auto_394217 - BLOCK
      ?auto_394218 - BLOCK
      ?auto_394219 - BLOCK
      ?auto_394220 - BLOCK
    )
    :vars
    (
      ?auto_394221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394220 ?auto_394221 ) ( ON-TABLE ?auto_394209 ) ( ON ?auto_394210 ?auto_394209 ) ( ON ?auto_394211 ?auto_394210 ) ( ON ?auto_394212 ?auto_394211 ) ( ON ?auto_394213 ?auto_394212 ) ( ON ?auto_394214 ?auto_394213 ) ( ON ?auto_394215 ?auto_394214 ) ( ON ?auto_394216 ?auto_394215 ) ( ON ?auto_394217 ?auto_394216 ) ( not ( = ?auto_394209 ?auto_394210 ) ) ( not ( = ?auto_394209 ?auto_394211 ) ) ( not ( = ?auto_394209 ?auto_394212 ) ) ( not ( = ?auto_394209 ?auto_394213 ) ) ( not ( = ?auto_394209 ?auto_394214 ) ) ( not ( = ?auto_394209 ?auto_394215 ) ) ( not ( = ?auto_394209 ?auto_394216 ) ) ( not ( = ?auto_394209 ?auto_394217 ) ) ( not ( = ?auto_394209 ?auto_394218 ) ) ( not ( = ?auto_394209 ?auto_394219 ) ) ( not ( = ?auto_394209 ?auto_394220 ) ) ( not ( = ?auto_394209 ?auto_394221 ) ) ( not ( = ?auto_394210 ?auto_394211 ) ) ( not ( = ?auto_394210 ?auto_394212 ) ) ( not ( = ?auto_394210 ?auto_394213 ) ) ( not ( = ?auto_394210 ?auto_394214 ) ) ( not ( = ?auto_394210 ?auto_394215 ) ) ( not ( = ?auto_394210 ?auto_394216 ) ) ( not ( = ?auto_394210 ?auto_394217 ) ) ( not ( = ?auto_394210 ?auto_394218 ) ) ( not ( = ?auto_394210 ?auto_394219 ) ) ( not ( = ?auto_394210 ?auto_394220 ) ) ( not ( = ?auto_394210 ?auto_394221 ) ) ( not ( = ?auto_394211 ?auto_394212 ) ) ( not ( = ?auto_394211 ?auto_394213 ) ) ( not ( = ?auto_394211 ?auto_394214 ) ) ( not ( = ?auto_394211 ?auto_394215 ) ) ( not ( = ?auto_394211 ?auto_394216 ) ) ( not ( = ?auto_394211 ?auto_394217 ) ) ( not ( = ?auto_394211 ?auto_394218 ) ) ( not ( = ?auto_394211 ?auto_394219 ) ) ( not ( = ?auto_394211 ?auto_394220 ) ) ( not ( = ?auto_394211 ?auto_394221 ) ) ( not ( = ?auto_394212 ?auto_394213 ) ) ( not ( = ?auto_394212 ?auto_394214 ) ) ( not ( = ?auto_394212 ?auto_394215 ) ) ( not ( = ?auto_394212 ?auto_394216 ) ) ( not ( = ?auto_394212 ?auto_394217 ) ) ( not ( = ?auto_394212 ?auto_394218 ) ) ( not ( = ?auto_394212 ?auto_394219 ) ) ( not ( = ?auto_394212 ?auto_394220 ) ) ( not ( = ?auto_394212 ?auto_394221 ) ) ( not ( = ?auto_394213 ?auto_394214 ) ) ( not ( = ?auto_394213 ?auto_394215 ) ) ( not ( = ?auto_394213 ?auto_394216 ) ) ( not ( = ?auto_394213 ?auto_394217 ) ) ( not ( = ?auto_394213 ?auto_394218 ) ) ( not ( = ?auto_394213 ?auto_394219 ) ) ( not ( = ?auto_394213 ?auto_394220 ) ) ( not ( = ?auto_394213 ?auto_394221 ) ) ( not ( = ?auto_394214 ?auto_394215 ) ) ( not ( = ?auto_394214 ?auto_394216 ) ) ( not ( = ?auto_394214 ?auto_394217 ) ) ( not ( = ?auto_394214 ?auto_394218 ) ) ( not ( = ?auto_394214 ?auto_394219 ) ) ( not ( = ?auto_394214 ?auto_394220 ) ) ( not ( = ?auto_394214 ?auto_394221 ) ) ( not ( = ?auto_394215 ?auto_394216 ) ) ( not ( = ?auto_394215 ?auto_394217 ) ) ( not ( = ?auto_394215 ?auto_394218 ) ) ( not ( = ?auto_394215 ?auto_394219 ) ) ( not ( = ?auto_394215 ?auto_394220 ) ) ( not ( = ?auto_394215 ?auto_394221 ) ) ( not ( = ?auto_394216 ?auto_394217 ) ) ( not ( = ?auto_394216 ?auto_394218 ) ) ( not ( = ?auto_394216 ?auto_394219 ) ) ( not ( = ?auto_394216 ?auto_394220 ) ) ( not ( = ?auto_394216 ?auto_394221 ) ) ( not ( = ?auto_394217 ?auto_394218 ) ) ( not ( = ?auto_394217 ?auto_394219 ) ) ( not ( = ?auto_394217 ?auto_394220 ) ) ( not ( = ?auto_394217 ?auto_394221 ) ) ( not ( = ?auto_394218 ?auto_394219 ) ) ( not ( = ?auto_394218 ?auto_394220 ) ) ( not ( = ?auto_394218 ?auto_394221 ) ) ( not ( = ?auto_394219 ?auto_394220 ) ) ( not ( = ?auto_394219 ?auto_394221 ) ) ( not ( = ?auto_394220 ?auto_394221 ) ) ( ON ?auto_394219 ?auto_394220 ) ( CLEAR ?auto_394217 ) ( ON ?auto_394218 ?auto_394219 ) ( CLEAR ?auto_394218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_394209 ?auto_394210 ?auto_394211 ?auto_394212 ?auto_394213 ?auto_394214 ?auto_394215 ?auto_394216 ?auto_394217 ?auto_394218 )
      ( MAKE-12PILE ?auto_394209 ?auto_394210 ?auto_394211 ?auto_394212 ?auto_394213 ?auto_394214 ?auto_394215 ?auto_394216 ?auto_394217 ?auto_394218 ?auto_394219 ?auto_394220 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394234 - BLOCK
      ?auto_394235 - BLOCK
      ?auto_394236 - BLOCK
      ?auto_394237 - BLOCK
      ?auto_394238 - BLOCK
      ?auto_394239 - BLOCK
      ?auto_394240 - BLOCK
      ?auto_394241 - BLOCK
      ?auto_394242 - BLOCK
      ?auto_394243 - BLOCK
      ?auto_394244 - BLOCK
      ?auto_394245 - BLOCK
    )
    :vars
    (
      ?auto_394246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394245 ?auto_394246 ) ( ON-TABLE ?auto_394234 ) ( ON ?auto_394235 ?auto_394234 ) ( ON ?auto_394236 ?auto_394235 ) ( ON ?auto_394237 ?auto_394236 ) ( ON ?auto_394238 ?auto_394237 ) ( ON ?auto_394239 ?auto_394238 ) ( ON ?auto_394240 ?auto_394239 ) ( ON ?auto_394241 ?auto_394240 ) ( not ( = ?auto_394234 ?auto_394235 ) ) ( not ( = ?auto_394234 ?auto_394236 ) ) ( not ( = ?auto_394234 ?auto_394237 ) ) ( not ( = ?auto_394234 ?auto_394238 ) ) ( not ( = ?auto_394234 ?auto_394239 ) ) ( not ( = ?auto_394234 ?auto_394240 ) ) ( not ( = ?auto_394234 ?auto_394241 ) ) ( not ( = ?auto_394234 ?auto_394242 ) ) ( not ( = ?auto_394234 ?auto_394243 ) ) ( not ( = ?auto_394234 ?auto_394244 ) ) ( not ( = ?auto_394234 ?auto_394245 ) ) ( not ( = ?auto_394234 ?auto_394246 ) ) ( not ( = ?auto_394235 ?auto_394236 ) ) ( not ( = ?auto_394235 ?auto_394237 ) ) ( not ( = ?auto_394235 ?auto_394238 ) ) ( not ( = ?auto_394235 ?auto_394239 ) ) ( not ( = ?auto_394235 ?auto_394240 ) ) ( not ( = ?auto_394235 ?auto_394241 ) ) ( not ( = ?auto_394235 ?auto_394242 ) ) ( not ( = ?auto_394235 ?auto_394243 ) ) ( not ( = ?auto_394235 ?auto_394244 ) ) ( not ( = ?auto_394235 ?auto_394245 ) ) ( not ( = ?auto_394235 ?auto_394246 ) ) ( not ( = ?auto_394236 ?auto_394237 ) ) ( not ( = ?auto_394236 ?auto_394238 ) ) ( not ( = ?auto_394236 ?auto_394239 ) ) ( not ( = ?auto_394236 ?auto_394240 ) ) ( not ( = ?auto_394236 ?auto_394241 ) ) ( not ( = ?auto_394236 ?auto_394242 ) ) ( not ( = ?auto_394236 ?auto_394243 ) ) ( not ( = ?auto_394236 ?auto_394244 ) ) ( not ( = ?auto_394236 ?auto_394245 ) ) ( not ( = ?auto_394236 ?auto_394246 ) ) ( not ( = ?auto_394237 ?auto_394238 ) ) ( not ( = ?auto_394237 ?auto_394239 ) ) ( not ( = ?auto_394237 ?auto_394240 ) ) ( not ( = ?auto_394237 ?auto_394241 ) ) ( not ( = ?auto_394237 ?auto_394242 ) ) ( not ( = ?auto_394237 ?auto_394243 ) ) ( not ( = ?auto_394237 ?auto_394244 ) ) ( not ( = ?auto_394237 ?auto_394245 ) ) ( not ( = ?auto_394237 ?auto_394246 ) ) ( not ( = ?auto_394238 ?auto_394239 ) ) ( not ( = ?auto_394238 ?auto_394240 ) ) ( not ( = ?auto_394238 ?auto_394241 ) ) ( not ( = ?auto_394238 ?auto_394242 ) ) ( not ( = ?auto_394238 ?auto_394243 ) ) ( not ( = ?auto_394238 ?auto_394244 ) ) ( not ( = ?auto_394238 ?auto_394245 ) ) ( not ( = ?auto_394238 ?auto_394246 ) ) ( not ( = ?auto_394239 ?auto_394240 ) ) ( not ( = ?auto_394239 ?auto_394241 ) ) ( not ( = ?auto_394239 ?auto_394242 ) ) ( not ( = ?auto_394239 ?auto_394243 ) ) ( not ( = ?auto_394239 ?auto_394244 ) ) ( not ( = ?auto_394239 ?auto_394245 ) ) ( not ( = ?auto_394239 ?auto_394246 ) ) ( not ( = ?auto_394240 ?auto_394241 ) ) ( not ( = ?auto_394240 ?auto_394242 ) ) ( not ( = ?auto_394240 ?auto_394243 ) ) ( not ( = ?auto_394240 ?auto_394244 ) ) ( not ( = ?auto_394240 ?auto_394245 ) ) ( not ( = ?auto_394240 ?auto_394246 ) ) ( not ( = ?auto_394241 ?auto_394242 ) ) ( not ( = ?auto_394241 ?auto_394243 ) ) ( not ( = ?auto_394241 ?auto_394244 ) ) ( not ( = ?auto_394241 ?auto_394245 ) ) ( not ( = ?auto_394241 ?auto_394246 ) ) ( not ( = ?auto_394242 ?auto_394243 ) ) ( not ( = ?auto_394242 ?auto_394244 ) ) ( not ( = ?auto_394242 ?auto_394245 ) ) ( not ( = ?auto_394242 ?auto_394246 ) ) ( not ( = ?auto_394243 ?auto_394244 ) ) ( not ( = ?auto_394243 ?auto_394245 ) ) ( not ( = ?auto_394243 ?auto_394246 ) ) ( not ( = ?auto_394244 ?auto_394245 ) ) ( not ( = ?auto_394244 ?auto_394246 ) ) ( not ( = ?auto_394245 ?auto_394246 ) ) ( ON ?auto_394244 ?auto_394245 ) ( ON ?auto_394243 ?auto_394244 ) ( CLEAR ?auto_394241 ) ( ON ?auto_394242 ?auto_394243 ) ( CLEAR ?auto_394242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_394234 ?auto_394235 ?auto_394236 ?auto_394237 ?auto_394238 ?auto_394239 ?auto_394240 ?auto_394241 ?auto_394242 )
      ( MAKE-12PILE ?auto_394234 ?auto_394235 ?auto_394236 ?auto_394237 ?auto_394238 ?auto_394239 ?auto_394240 ?auto_394241 ?auto_394242 ?auto_394243 ?auto_394244 ?auto_394245 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394259 - BLOCK
      ?auto_394260 - BLOCK
      ?auto_394261 - BLOCK
      ?auto_394262 - BLOCK
      ?auto_394263 - BLOCK
      ?auto_394264 - BLOCK
      ?auto_394265 - BLOCK
      ?auto_394266 - BLOCK
      ?auto_394267 - BLOCK
      ?auto_394268 - BLOCK
      ?auto_394269 - BLOCK
      ?auto_394270 - BLOCK
    )
    :vars
    (
      ?auto_394271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394270 ?auto_394271 ) ( ON-TABLE ?auto_394259 ) ( ON ?auto_394260 ?auto_394259 ) ( ON ?auto_394261 ?auto_394260 ) ( ON ?auto_394262 ?auto_394261 ) ( ON ?auto_394263 ?auto_394262 ) ( ON ?auto_394264 ?auto_394263 ) ( ON ?auto_394265 ?auto_394264 ) ( ON ?auto_394266 ?auto_394265 ) ( not ( = ?auto_394259 ?auto_394260 ) ) ( not ( = ?auto_394259 ?auto_394261 ) ) ( not ( = ?auto_394259 ?auto_394262 ) ) ( not ( = ?auto_394259 ?auto_394263 ) ) ( not ( = ?auto_394259 ?auto_394264 ) ) ( not ( = ?auto_394259 ?auto_394265 ) ) ( not ( = ?auto_394259 ?auto_394266 ) ) ( not ( = ?auto_394259 ?auto_394267 ) ) ( not ( = ?auto_394259 ?auto_394268 ) ) ( not ( = ?auto_394259 ?auto_394269 ) ) ( not ( = ?auto_394259 ?auto_394270 ) ) ( not ( = ?auto_394259 ?auto_394271 ) ) ( not ( = ?auto_394260 ?auto_394261 ) ) ( not ( = ?auto_394260 ?auto_394262 ) ) ( not ( = ?auto_394260 ?auto_394263 ) ) ( not ( = ?auto_394260 ?auto_394264 ) ) ( not ( = ?auto_394260 ?auto_394265 ) ) ( not ( = ?auto_394260 ?auto_394266 ) ) ( not ( = ?auto_394260 ?auto_394267 ) ) ( not ( = ?auto_394260 ?auto_394268 ) ) ( not ( = ?auto_394260 ?auto_394269 ) ) ( not ( = ?auto_394260 ?auto_394270 ) ) ( not ( = ?auto_394260 ?auto_394271 ) ) ( not ( = ?auto_394261 ?auto_394262 ) ) ( not ( = ?auto_394261 ?auto_394263 ) ) ( not ( = ?auto_394261 ?auto_394264 ) ) ( not ( = ?auto_394261 ?auto_394265 ) ) ( not ( = ?auto_394261 ?auto_394266 ) ) ( not ( = ?auto_394261 ?auto_394267 ) ) ( not ( = ?auto_394261 ?auto_394268 ) ) ( not ( = ?auto_394261 ?auto_394269 ) ) ( not ( = ?auto_394261 ?auto_394270 ) ) ( not ( = ?auto_394261 ?auto_394271 ) ) ( not ( = ?auto_394262 ?auto_394263 ) ) ( not ( = ?auto_394262 ?auto_394264 ) ) ( not ( = ?auto_394262 ?auto_394265 ) ) ( not ( = ?auto_394262 ?auto_394266 ) ) ( not ( = ?auto_394262 ?auto_394267 ) ) ( not ( = ?auto_394262 ?auto_394268 ) ) ( not ( = ?auto_394262 ?auto_394269 ) ) ( not ( = ?auto_394262 ?auto_394270 ) ) ( not ( = ?auto_394262 ?auto_394271 ) ) ( not ( = ?auto_394263 ?auto_394264 ) ) ( not ( = ?auto_394263 ?auto_394265 ) ) ( not ( = ?auto_394263 ?auto_394266 ) ) ( not ( = ?auto_394263 ?auto_394267 ) ) ( not ( = ?auto_394263 ?auto_394268 ) ) ( not ( = ?auto_394263 ?auto_394269 ) ) ( not ( = ?auto_394263 ?auto_394270 ) ) ( not ( = ?auto_394263 ?auto_394271 ) ) ( not ( = ?auto_394264 ?auto_394265 ) ) ( not ( = ?auto_394264 ?auto_394266 ) ) ( not ( = ?auto_394264 ?auto_394267 ) ) ( not ( = ?auto_394264 ?auto_394268 ) ) ( not ( = ?auto_394264 ?auto_394269 ) ) ( not ( = ?auto_394264 ?auto_394270 ) ) ( not ( = ?auto_394264 ?auto_394271 ) ) ( not ( = ?auto_394265 ?auto_394266 ) ) ( not ( = ?auto_394265 ?auto_394267 ) ) ( not ( = ?auto_394265 ?auto_394268 ) ) ( not ( = ?auto_394265 ?auto_394269 ) ) ( not ( = ?auto_394265 ?auto_394270 ) ) ( not ( = ?auto_394265 ?auto_394271 ) ) ( not ( = ?auto_394266 ?auto_394267 ) ) ( not ( = ?auto_394266 ?auto_394268 ) ) ( not ( = ?auto_394266 ?auto_394269 ) ) ( not ( = ?auto_394266 ?auto_394270 ) ) ( not ( = ?auto_394266 ?auto_394271 ) ) ( not ( = ?auto_394267 ?auto_394268 ) ) ( not ( = ?auto_394267 ?auto_394269 ) ) ( not ( = ?auto_394267 ?auto_394270 ) ) ( not ( = ?auto_394267 ?auto_394271 ) ) ( not ( = ?auto_394268 ?auto_394269 ) ) ( not ( = ?auto_394268 ?auto_394270 ) ) ( not ( = ?auto_394268 ?auto_394271 ) ) ( not ( = ?auto_394269 ?auto_394270 ) ) ( not ( = ?auto_394269 ?auto_394271 ) ) ( not ( = ?auto_394270 ?auto_394271 ) ) ( ON ?auto_394269 ?auto_394270 ) ( ON ?auto_394268 ?auto_394269 ) ( CLEAR ?auto_394266 ) ( ON ?auto_394267 ?auto_394268 ) ( CLEAR ?auto_394267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_394259 ?auto_394260 ?auto_394261 ?auto_394262 ?auto_394263 ?auto_394264 ?auto_394265 ?auto_394266 ?auto_394267 )
      ( MAKE-12PILE ?auto_394259 ?auto_394260 ?auto_394261 ?auto_394262 ?auto_394263 ?auto_394264 ?auto_394265 ?auto_394266 ?auto_394267 ?auto_394268 ?auto_394269 ?auto_394270 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394284 - BLOCK
      ?auto_394285 - BLOCK
      ?auto_394286 - BLOCK
      ?auto_394287 - BLOCK
      ?auto_394288 - BLOCK
      ?auto_394289 - BLOCK
      ?auto_394290 - BLOCK
      ?auto_394291 - BLOCK
      ?auto_394292 - BLOCK
      ?auto_394293 - BLOCK
      ?auto_394294 - BLOCK
      ?auto_394295 - BLOCK
    )
    :vars
    (
      ?auto_394296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394295 ?auto_394296 ) ( ON-TABLE ?auto_394284 ) ( ON ?auto_394285 ?auto_394284 ) ( ON ?auto_394286 ?auto_394285 ) ( ON ?auto_394287 ?auto_394286 ) ( ON ?auto_394288 ?auto_394287 ) ( ON ?auto_394289 ?auto_394288 ) ( ON ?auto_394290 ?auto_394289 ) ( not ( = ?auto_394284 ?auto_394285 ) ) ( not ( = ?auto_394284 ?auto_394286 ) ) ( not ( = ?auto_394284 ?auto_394287 ) ) ( not ( = ?auto_394284 ?auto_394288 ) ) ( not ( = ?auto_394284 ?auto_394289 ) ) ( not ( = ?auto_394284 ?auto_394290 ) ) ( not ( = ?auto_394284 ?auto_394291 ) ) ( not ( = ?auto_394284 ?auto_394292 ) ) ( not ( = ?auto_394284 ?auto_394293 ) ) ( not ( = ?auto_394284 ?auto_394294 ) ) ( not ( = ?auto_394284 ?auto_394295 ) ) ( not ( = ?auto_394284 ?auto_394296 ) ) ( not ( = ?auto_394285 ?auto_394286 ) ) ( not ( = ?auto_394285 ?auto_394287 ) ) ( not ( = ?auto_394285 ?auto_394288 ) ) ( not ( = ?auto_394285 ?auto_394289 ) ) ( not ( = ?auto_394285 ?auto_394290 ) ) ( not ( = ?auto_394285 ?auto_394291 ) ) ( not ( = ?auto_394285 ?auto_394292 ) ) ( not ( = ?auto_394285 ?auto_394293 ) ) ( not ( = ?auto_394285 ?auto_394294 ) ) ( not ( = ?auto_394285 ?auto_394295 ) ) ( not ( = ?auto_394285 ?auto_394296 ) ) ( not ( = ?auto_394286 ?auto_394287 ) ) ( not ( = ?auto_394286 ?auto_394288 ) ) ( not ( = ?auto_394286 ?auto_394289 ) ) ( not ( = ?auto_394286 ?auto_394290 ) ) ( not ( = ?auto_394286 ?auto_394291 ) ) ( not ( = ?auto_394286 ?auto_394292 ) ) ( not ( = ?auto_394286 ?auto_394293 ) ) ( not ( = ?auto_394286 ?auto_394294 ) ) ( not ( = ?auto_394286 ?auto_394295 ) ) ( not ( = ?auto_394286 ?auto_394296 ) ) ( not ( = ?auto_394287 ?auto_394288 ) ) ( not ( = ?auto_394287 ?auto_394289 ) ) ( not ( = ?auto_394287 ?auto_394290 ) ) ( not ( = ?auto_394287 ?auto_394291 ) ) ( not ( = ?auto_394287 ?auto_394292 ) ) ( not ( = ?auto_394287 ?auto_394293 ) ) ( not ( = ?auto_394287 ?auto_394294 ) ) ( not ( = ?auto_394287 ?auto_394295 ) ) ( not ( = ?auto_394287 ?auto_394296 ) ) ( not ( = ?auto_394288 ?auto_394289 ) ) ( not ( = ?auto_394288 ?auto_394290 ) ) ( not ( = ?auto_394288 ?auto_394291 ) ) ( not ( = ?auto_394288 ?auto_394292 ) ) ( not ( = ?auto_394288 ?auto_394293 ) ) ( not ( = ?auto_394288 ?auto_394294 ) ) ( not ( = ?auto_394288 ?auto_394295 ) ) ( not ( = ?auto_394288 ?auto_394296 ) ) ( not ( = ?auto_394289 ?auto_394290 ) ) ( not ( = ?auto_394289 ?auto_394291 ) ) ( not ( = ?auto_394289 ?auto_394292 ) ) ( not ( = ?auto_394289 ?auto_394293 ) ) ( not ( = ?auto_394289 ?auto_394294 ) ) ( not ( = ?auto_394289 ?auto_394295 ) ) ( not ( = ?auto_394289 ?auto_394296 ) ) ( not ( = ?auto_394290 ?auto_394291 ) ) ( not ( = ?auto_394290 ?auto_394292 ) ) ( not ( = ?auto_394290 ?auto_394293 ) ) ( not ( = ?auto_394290 ?auto_394294 ) ) ( not ( = ?auto_394290 ?auto_394295 ) ) ( not ( = ?auto_394290 ?auto_394296 ) ) ( not ( = ?auto_394291 ?auto_394292 ) ) ( not ( = ?auto_394291 ?auto_394293 ) ) ( not ( = ?auto_394291 ?auto_394294 ) ) ( not ( = ?auto_394291 ?auto_394295 ) ) ( not ( = ?auto_394291 ?auto_394296 ) ) ( not ( = ?auto_394292 ?auto_394293 ) ) ( not ( = ?auto_394292 ?auto_394294 ) ) ( not ( = ?auto_394292 ?auto_394295 ) ) ( not ( = ?auto_394292 ?auto_394296 ) ) ( not ( = ?auto_394293 ?auto_394294 ) ) ( not ( = ?auto_394293 ?auto_394295 ) ) ( not ( = ?auto_394293 ?auto_394296 ) ) ( not ( = ?auto_394294 ?auto_394295 ) ) ( not ( = ?auto_394294 ?auto_394296 ) ) ( not ( = ?auto_394295 ?auto_394296 ) ) ( ON ?auto_394294 ?auto_394295 ) ( ON ?auto_394293 ?auto_394294 ) ( ON ?auto_394292 ?auto_394293 ) ( CLEAR ?auto_394290 ) ( ON ?auto_394291 ?auto_394292 ) ( CLEAR ?auto_394291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_394284 ?auto_394285 ?auto_394286 ?auto_394287 ?auto_394288 ?auto_394289 ?auto_394290 ?auto_394291 )
      ( MAKE-12PILE ?auto_394284 ?auto_394285 ?auto_394286 ?auto_394287 ?auto_394288 ?auto_394289 ?auto_394290 ?auto_394291 ?auto_394292 ?auto_394293 ?auto_394294 ?auto_394295 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394309 - BLOCK
      ?auto_394310 - BLOCK
      ?auto_394311 - BLOCK
      ?auto_394312 - BLOCK
      ?auto_394313 - BLOCK
      ?auto_394314 - BLOCK
      ?auto_394315 - BLOCK
      ?auto_394316 - BLOCK
      ?auto_394317 - BLOCK
      ?auto_394318 - BLOCK
      ?auto_394319 - BLOCK
      ?auto_394320 - BLOCK
    )
    :vars
    (
      ?auto_394321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394320 ?auto_394321 ) ( ON-TABLE ?auto_394309 ) ( ON ?auto_394310 ?auto_394309 ) ( ON ?auto_394311 ?auto_394310 ) ( ON ?auto_394312 ?auto_394311 ) ( ON ?auto_394313 ?auto_394312 ) ( ON ?auto_394314 ?auto_394313 ) ( ON ?auto_394315 ?auto_394314 ) ( not ( = ?auto_394309 ?auto_394310 ) ) ( not ( = ?auto_394309 ?auto_394311 ) ) ( not ( = ?auto_394309 ?auto_394312 ) ) ( not ( = ?auto_394309 ?auto_394313 ) ) ( not ( = ?auto_394309 ?auto_394314 ) ) ( not ( = ?auto_394309 ?auto_394315 ) ) ( not ( = ?auto_394309 ?auto_394316 ) ) ( not ( = ?auto_394309 ?auto_394317 ) ) ( not ( = ?auto_394309 ?auto_394318 ) ) ( not ( = ?auto_394309 ?auto_394319 ) ) ( not ( = ?auto_394309 ?auto_394320 ) ) ( not ( = ?auto_394309 ?auto_394321 ) ) ( not ( = ?auto_394310 ?auto_394311 ) ) ( not ( = ?auto_394310 ?auto_394312 ) ) ( not ( = ?auto_394310 ?auto_394313 ) ) ( not ( = ?auto_394310 ?auto_394314 ) ) ( not ( = ?auto_394310 ?auto_394315 ) ) ( not ( = ?auto_394310 ?auto_394316 ) ) ( not ( = ?auto_394310 ?auto_394317 ) ) ( not ( = ?auto_394310 ?auto_394318 ) ) ( not ( = ?auto_394310 ?auto_394319 ) ) ( not ( = ?auto_394310 ?auto_394320 ) ) ( not ( = ?auto_394310 ?auto_394321 ) ) ( not ( = ?auto_394311 ?auto_394312 ) ) ( not ( = ?auto_394311 ?auto_394313 ) ) ( not ( = ?auto_394311 ?auto_394314 ) ) ( not ( = ?auto_394311 ?auto_394315 ) ) ( not ( = ?auto_394311 ?auto_394316 ) ) ( not ( = ?auto_394311 ?auto_394317 ) ) ( not ( = ?auto_394311 ?auto_394318 ) ) ( not ( = ?auto_394311 ?auto_394319 ) ) ( not ( = ?auto_394311 ?auto_394320 ) ) ( not ( = ?auto_394311 ?auto_394321 ) ) ( not ( = ?auto_394312 ?auto_394313 ) ) ( not ( = ?auto_394312 ?auto_394314 ) ) ( not ( = ?auto_394312 ?auto_394315 ) ) ( not ( = ?auto_394312 ?auto_394316 ) ) ( not ( = ?auto_394312 ?auto_394317 ) ) ( not ( = ?auto_394312 ?auto_394318 ) ) ( not ( = ?auto_394312 ?auto_394319 ) ) ( not ( = ?auto_394312 ?auto_394320 ) ) ( not ( = ?auto_394312 ?auto_394321 ) ) ( not ( = ?auto_394313 ?auto_394314 ) ) ( not ( = ?auto_394313 ?auto_394315 ) ) ( not ( = ?auto_394313 ?auto_394316 ) ) ( not ( = ?auto_394313 ?auto_394317 ) ) ( not ( = ?auto_394313 ?auto_394318 ) ) ( not ( = ?auto_394313 ?auto_394319 ) ) ( not ( = ?auto_394313 ?auto_394320 ) ) ( not ( = ?auto_394313 ?auto_394321 ) ) ( not ( = ?auto_394314 ?auto_394315 ) ) ( not ( = ?auto_394314 ?auto_394316 ) ) ( not ( = ?auto_394314 ?auto_394317 ) ) ( not ( = ?auto_394314 ?auto_394318 ) ) ( not ( = ?auto_394314 ?auto_394319 ) ) ( not ( = ?auto_394314 ?auto_394320 ) ) ( not ( = ?auto_394314 ?auto_394321 ) ) ( not ( = ?auto_394315 ?auto_394316 ) ) ( not ( = ?auto_394315 ?auto_394317 ) ) ( not ( = ?auto_394315 ?auto_394318 ) ) ( not ( = ?auto_394315 ?auto_394319 ) ) ( not ( = ?auto_394315 ?auto_394320 ) ) ( not ( = ?auto_394315 ?auto_394321 ) ) ( not ( = ?auto_394316 ?auto_394317 ) ) ( not ( = ?auto_394316 ?auto_394318 ) ) ( not ( = ?auto_394316 ?auto_394319 ) ) ( not ( = ?auto_394316 ?auto_394320 ) ) ( not ( = ?auto_394316 ?auto_394321 ) ) ( not ( = ?auto_394317 ?auto_394318 ) ) ( not ( = ?auto_394317 ?auto_394319 ) ) ( not ( = ?auto_394317 ?auto_394320 ) ) ( not ( = ?auto_394317 ?auto_394321 ) ) ( not ( = ?auto_394318 ?auto_394319 ) ) ( not ( = ?auto_394318 ?auto_394320 ) ) ( not ( = ?auto_394318 ?auto_394321 ) ) ( not ( = ?auto_394319 ?auto_394320 ) ) ( not ( = ?auto_394319 ?auto_394321 ) ) ( not ( = ?auto_394320 ?auto_394321 ) ) ( ON ?auto_394319 ?auto_394320 ) ( ON ?auto_394318 ?auto_394319 ) ( ON ?auto_394317 ?auto_394318 ) ( CLEAR ?auto_394315 ) ( ON ?auto_394316 ?auto_394317 ) ( CLEAR ?auto_394316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_394309 ?auto_394310 ?auto_394311 ?auto_394312 ?auto_394313 ?auto_394314 ?auto_394315 ?auto_394316 )
      ( MAKE-12PILE ?auto_394309 ?auto_394310 ?auto_394311 ?auto_394312 ?auto_394313 ?auto_394314 ?auto_394315 ?auto_394316 ?auto_394317 ?auto_394318 ?auto_394319 ?auto_394320 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394334 - BLOCK
      ?auto_394335 - BLOCK
      ?auto_394336 - BLOCK
      ?auto_394337 - BLOCK
      ?auto_394338 - BLOCK
      ?auto_394339 - BLOCK
      ?auto_394340 - BLOCK
      ?auto_394341 - BLOCK
      ?auto_394342 - BLOCK
      ?auto_394343 - BLOCK
      ?auto_394344 - BLOCK
      ?auto_394345 - BLOCK
    )
    :vars
    (
      ?auto_394346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394345 ?auto_394346 ) ( ON-TABLE ?auto_394334 ) ( ON ?auto_394335 ?auto_394334 ) ( ON ?auto_394336 ?auto_394335 ) ( ON ?auto_394337 ?auto_394336 ) ( ON ?auto_394338 ?auto_394337 ) ( ON ?auto_394339 ?auto_394338 ) ( not ( = ?auto_394334 ?auto_394335 ) ) ( not ( = ?auto_394334 ?auto_394336 ) ) ( not ( = ?auto_394334 ?auto_394337 ) ) ( not ( = ?auto_394334 ?auto_394338 ) ) ( not ( = ?auto_394334 ?auto_394339 ) ) ( not ( = ?auto_394334 ?auto_394340 ) ) ( not ( = ?auto_394334 ?auto_394341 ) ) ( not ( = ?auto_394334 ?auto_394342 ) ) ( not ( = ?auto_394334 ?auto_394343 ) ) ( not ( = ?auto_394334 ?auto_394344 ) ) ( not ( = ?auto_394334 ?auto_394345 ) ) ( not ( = ?auto_394334 ?auto_394346 ) ) ( not ( = ?auto_394335 ?auto_394336 ) ) ( not ( = ?auto_394335 ?auto_394337 ) ) ( not ( = ?auto_394335 ?auto_394338 ) ) ( not ( = ?auto_394335 ?auto_394339 ) ) ( not ( = ?auto_394335 ?auto_394340 ) ) ( not ( = ?auto_394335 ?auto_394341 ) ) ( not ( = ?auto_394335 ?auto_394342 ) ) ( not ( = ?auto_394335 ?auto_394343 ) ) ( not ( = ?auto_394335 ?auto_394344 ) ) ( not ( = ?auto_394335 ?auto_394345 ) ) ( not ( = ?auto_394335 ?auto_394346 ) ) ( not ( = ?auto_394336 ?auto_394337 ) ) ( not ( = ?auto_394336 ?auto_394338 ) ) ( not ( = ?auto_394336 ?auto_394339 ) ) ( not ( = ?auto_394336 ?auto_394340 ) ) ( not ( = ?auto_394336 ?auto_394341 ) ) ( not ( = ?auto_394336 ?auto_394342 ) ) ( not ( = ?auto_394336 ?auto_394343 ) ) ( not ( = ?auto_394336 ?auto_394344 ) ) ( not ( = ?auto_394336 ?auto_394345 ) ) ( not ( = ?auto_394336 ?auto_394346 ) ) ( not ( = ?auto_394337 ?auto_394338 ) ) ( not ( = ?auto_394337 ?auto_394339 ) ) ( not ( = ?auto_394337 ?auto_394340 ) ) ( not ( = ?auto_394337 ?auto_394341 ) ) ( not ( = ?auto_394337 ?auto_394342 ) ) ( not ( = ?auto_394337 ?auto_394343 ) ) ( not ( = ?auto_394337 ?auto_394344 ) ) ( not ( = ?auto_394337 ?auto_394345 ) ) ( not ( = ?auto_394337 ?auto_394346 ) ) ( not ( = ?auto_394338 ?auto_394339 ) ) ( not ( = ?auto_394338 ?auto_394340 ) ) ( not ( = ?auto_394338 ?auto_394341 ) ) ( not ( = ?auto_394338 ?auto_394342 ) ) ( not ( = ?auto_394338 ?auto_394343 ) ) ( not ( = ?auto_394338 ?auto_394344 ) ) ( not ( = ?auto_394338 ?auto_394345 ) ) ( not ( = ?auto_394338 ?auto_394346 ) ) ( not ( = ?auto_394339 ?auto_394340 ) ) ( not ( = ?auto_394339 ?auto_394341 ) ) ( not ( = ?auto_394339 ?auto_394342 ) ) ( not ( = ?auto_394339 ?auto_394343 ) ) ( not ( = ?auto_394339 ?auto_394344 ) ) ( not ( = ?auto_394339 ?auto_394345 ) ) ( not ( = ?auto_394339 ?auto_394346 ) ) ( not ( = ?auto_394340 ?auto_394341 ) ) ( not ( = ?auto_394340 ?auto_394342 ) ) ( not ( = ?auto_394340 ?auto_394343 ) ) ( not ( = ?auto_394340 ?auto_394344 ) ) ( not ( = ?auto_394340 ?auto_394345 ) ) ( not ( = ?auto_394340 ?auto_394346 ) ) ( not ( = ?auto_394341 ?auto_394342 ) ) ( not ( = ?auto_394341 ?auto_394343 ) ) ( not ( = ?auto_394341 ?auto_394344 ) ) ( not ( = ?auto_394341 ?auto_394345 ) ) ( not ( = ?auto_394341 ?auto_394346 ) ) ( not ( = ?auto_394342 ?auto_394343 ) ) ( not ( = ?auto_394342 ?auto_394344 ) ) ( not ( = ?auto_394342 ?auto_394345 ) ) ( not ( = ?auto_394342 ?auto_394346 ) ) ( not ( = ?auto_394343 ?auto_394344 ) ) ( not ( = ?auto_394343 ?auto_394345 ) ) ( not ( = ?auto_394343 ?auto_394346 ) ) ( not ( = ?auto_394344 ?auto_394345 ) ) ( not ( = ?auto_394344 ?auto_394346 ) ) ( not ( = ?auto_394345 ?auto_394346 ) ) ( ON ?auto_394344 ?auto_394345 ) ( ON ?auto_394343 ?auto_394344 ) ( ON ?auto_394342 ?auto_394343 ) ( ON ?auto_394341 ?auto_394342 ) ( CLEAR ?auto_394339 ) ( ON ?auto_394340 ?auto_394341 ) ( CLEAR ?auto_394340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_394334 ?auto_394335 ?auto_394336 ?auto_394337 ?auto_394338 ?auto_394339 ?auto_394340 )
      ( MAKE-12PILE ?auto_394334 ?auto_394335 ?auto_394336 ?auto_394337 ?auto_394338 ?auto_394339 ?auto_394340 ?auto_394341 ?auto_394342 ?auto_394343 ?auto_394344 ?auto_394345 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394359 - BLOCK
      ?auto_394360 - BLOCK
      ?auto_394361 - BLOCK
      ?auto_394362 - BLOCK
      ?auto_394363 - BLOCK
      ?auto_394364 - BLOCK
      ?auto_394365 - BLOCK
      ?auto_394366 - BLOCK
      ?auto_394367 - BLOCK
      ?auto_394368 - BLOCK
      ?auto_394369 - BLOCK
      ?auto_394370 - BLOCK
    )
    :vars
    (
      ?auto_394371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394370 ?auto_394371 ) ( ON-TABLE ?auto_394359 ) ( ON ?auto_394360 ?auto_394359 ) ( ON ?auto_394361 ?auto_394360 ) ( ON ?auto_394362 ?auto_394361 ) ( ON ?auto_394363 ?auto_394362 ) ( ON ?auto_394364 ?auto_394363 ) ( not ( = ?auto_394359 ?auto_394360 ) ) ( not ( = ?auto_394359 ?auto_394361 ) ) ( not ( = ?auto_394359 ?auto_394362 ) ) ( not ( = ?auto_394359 ?auto_394363 ) ) ( not ( = ?auto_394359 ?auto_394364 ) ) ( not ( = ?auto_394359 ?auto_394365 ) ) ( not ( = ?auto_394359 ?auto_394366 ) ) ( not ( = ?auto_394359 ?auto_394367 ) ) ( not ( = ?auto_394359 ?auto_394368 ) ) ( not ( = ?auto_394359 ?auto_394369 ) ) ( not ( = ?auto_394359 ?auto_394370 ) ) ( not ( = ?auto_394359 ?auto_394371 ) ) ( not ( = ?auto_394360 ?auto_394361 ) ) ( not ( = ?auto_394360 ?auto_394362 ) ) ( not ( = ?auto_394360 ?auto_394363 ) ) ( not ( = ?auto_394360 ?auto_394364 ) ) ( not ( = ?auto_394360 ?auto_394365 ) ) ( not ( = ?auto_394360 ?auto_394366 ) ) ( not ( = ?auto_394360 ?auto_394367 ) ) ( not ( = ?auto_394360 ?auto_394368 ) ) ( not ( = ?auto_394360 ?auto_394369 ) ) ( not ( = ?auto_394360 ?auto_394370 ) ) ( not ( = ?auto_394360 ?auto_394371 ) ) ( not ( = ?auto_394361 ?auto_394362 ) ) ( not ( = ?auto_394361 ?auto_394363 ) ) ( not ( = ?auto_394361 ?auto_394364 ) ) ( not ( = ?auto_394361 ?auto_394365 ) ) ( not ( = ?auto_394361 ?auto_394366 ) ) ( not ( = ?auto_394361 ?auto_394367 ) ) ( not ( = ?auto_394361 ?auto_394368 ) ) ( not ( = ?auto_394361 ?auto_394369 ) ) ( not ( = ?auto_394361 ?auto_394370 ) ) ( not ( = ?auto_394361 ?auto_394371 ) ) ( not ( = ?auto_394362 ?auto_394363 ) ) ( not ( = ?auto_394362 ?auto_394364 ) ) ( not ( = ?auto_394362 ?auto_394365 ) ) ( not ( = ?auto_394362 ?auto_394366 ) ) ( not ( = ?auto_394362 ?auto_394367 ) ) ( not ( = ?auto_394362 ?auto_394368 ) ) ( not ( = ?auto_394362 ?auto_394369 ) ) ( not ( = ?auto_394362 ?auto_394370 ) ) ( not ( = ?auto_394362 ?auto_394371 ) ) ( not ( = ?auto_394363 ?auto_394364 ) ) ( not ( = ?auto_394363 ?auto_394365 ) ) ( not ( = ?auto_394363 ?auto_394366 ) ) ( not ( = ?auto_394363 ?auto_394367 ) ) ( not ( = ?auto_394363 ?auto_394368 ) ) ( not ( = ?auto_394363 ?auto_394369 ) ) ( not ( = ?auto_394363 ?auto_394370 ) ) ( not ( = ?auto_394363 ?auto_394371 ) ) ( not ( = ?auto_394364 ?auto_394365 ) ) ( not ( = ?auto_394364 ?auto_394366 ) ) ( not ( = ?auto_394364 ?auto_394367 ) ) ( not ( = ?auto_394364 ?auto_394368 ) ) ( not ( = ?auto_394364 ?auto_394369 ) ) ( not ( = ?auto_394364 ?auto_394370 ) ) ( not ( = ?auto_394364 ?auto_394371 ) ) ( not ( = ?auto_394365 ?auto_394366 ) ) ( not ( = ?auto_394365 ?auto_394367 ) ) ( not ( = ?auto_394365 ?auto_394368 ) ) ( not ( = ?auto_394365 ?auto_394369 ) ) ( not ( = ?auto_394365 ?auto_394370 ) ) ( not ( = ?auto_394365 ?auto_394371 ) ) ( not ( = ?auto_394366 ?auto_394367 ) ) ( not ( = ?auto_394366 ?auto_394368 ) ) ( not ( = ?auto_394366 ?auto_394369 ) ) ( not ( = ?auto_394366 ?auto_394370 ) ) ( not ( = ?auto_394366 ?auto_394371 ) ) ( not ( = ?auto_394367 ?auto_394368 ) ) ( not ( = ?auto_394367 ?auto_394369 ) ) ( not ( = ?auto_394367 ?auto_394370 ) ) ( not ( = ?auto_394367 ?auto_394371 ) ) ( not ( = ?auto_394368 ?auto_394369 ) ) ( not ( = ?auto_394368 ?auto_394370 ) ) ( not ( = ?auto_394368 ?auto_394371 ) ) ( not ( = ?auto_394369 ?auto_394370 ) ) ( not ( = ?auto_394369 ?auto_394371 ) ) ( not ( = ?auto_394370 ?auto_394371 ) ) ( ON ?auto_394369 ?auto_394370 ) ( ON ?auto_394368 ?auto_394369 ) ( ON ?auto_394367 ?auto_394368 ) ( ON ?auto_394366 ?auto_394367 ) ( CLEAR ?auto_394364 ) ( ON ?auto_394365 ?auto_394366 ) ( CLEAR ?auto_394365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_394359 ?auto_394360 ?auto_394361 ?auto_394362 ?auto_394363 ?auto_394364 ?auto_394365 )
      ( MAKE-12PILE ?auto_394359 ?auto_394360 ?auto_394361 ?auto_394362 ?auto_394363 ?auto_394364 ?auto_394365 ?auto_394366 ?auto_394367 ?auto_394368 ?auto_394369 ?auto_394370 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394384 - BLOCK
      ?auto_394385 - BLOCK
      ?auto_394386 - BLOCK
      ?auto_394387 - BLOCK
      ?auto_394388 - BLOCK
      ?auto_394389 - BLOCK
      ?auto_394390 - BLOCK
      ?auto_394391 - BLOCK
      ?auto_394392 - BLOCK
      ?auto_394393 - BLOCK
      ?auto_394394 - BLOCK
      ?auto_394395 - BLOCK
    )
    :vars
    (
      ?auto_394396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394395 ?auto_394396 ) ( ON-TABLE ?auto_394384 ) ( ON ?auto_394385 ?auto_394384 ) ( ON ?auto_394386 ?auto_394385 ) ( ON ?auto_394387 ?auto_394386 ) ( ON ?auto_394388 ?auto_394387 ) ( not ( = ?auto_394384 ?auto_394385 ) ) ( not ( = ?auto_394384 ?auto_394386 ) ) ( not ( = ?auto_394384 ?auto_394387 ) ) ( not ( = ?auto_394384 ?auto_394388 ) ) ( not ( = ?auto_394384 ?auto_394389 ) ) ( not ( = ?auto_394384 ?auto_394390 ) ) ( not ( = ?auto_394384 ?auto_394391 ) ) ( not ( = ?auto_394384 ?auto_394392 ) ) ( not ( = ?auto_394384 ?auto_394393 ) ) ( not ( = ?auto_394384 ?auto_394394 ) ) ( not ( = ?auto_394384 ?auto_394395 ) ) ( not ( = ?auto_394384 ?auto_394396 ) ) ( not ( = ?auto_394385 ?auto_394386 ) ) ( not ( = ?auto_394385 ?auto_394387 ) ) ( not ( = ?auto_394385 ?auto_394388 ) ) ( not ( = ?auto_394385 ?auto_394389 ) ) ( not ( = ?auto_394385 ?auto_394390 ) ) ( not ( = ?auto_394385 ?auto_394391 ) ) ( not ( = ?auto_394385 ?auto_394392 ) ) ( not ( = ?auto_394385 ?auto_394393 ) ) ( not ( = ?auto_394385 ?auto_394394 ) ) ( not ( = ?auto_394385 ?auto_394395 ) ) ( not ( = ?auto_394385 ?auto_394396 ) ) ( not ( = ?auto_394386 ?auto_394387 ) ) ( not ( = ?auto_394386 ?auto_394388 ) ) ( not ( = ?auto_394386 ?auto_394389 ) ) ( not ( = ?auto_394386 ?auto_394390 ) ) ( not ( = ?auto_394386 ?auto_394391 ) ) ( not ( = ?auto_394386 ?auto_394392 ) ) ( not ( = ?auto_394386 ?auto_394393 ) ) ( not ( = ?auto_394386 ?auto_394394 ) ) ( not ( = ?auto_394386 ?auto_394395 ) ) ( not ( = ?auto_394386 ?auto_394396 ) ) ( not ( = ?auto_394387 ?auto_394388 ) ) ( not ( = ?auto_394387 ?auto_394389 ) ) ( not ( = ?auto_394387 ?auto_394390 ) ) ( not ( = ?auto_394387 ?auto_394391 ) ) ( not ( = ?auto_394387 ?auto_394392 ) ) ( not ( = ?auto_394387 ?auto_394393 ) ) ( not ( = ?auto_394387 ?auto_394394 ) ) ( not ( = ?auto_394387 ?auto_394395 ) ) ( not ( = ?auto_394387 ?auto_394396 ) ) ( not ( = ?auto_394388 ?auto_394389 ) ) ( not ( = ?auto_394388 ?auto_394390 ) ) ( not ( = ?auto_394388 ?auto_394391 ) ) ( not ( = ?auto_394388 ?auto_394392 ) ) ( not ( = ?auto_394388 ?auto_394393 ) ) ( not ( = ?auto_394388 ?auto_394394 ) ) ( not ( = ?auto_394388 ?auto_394395 ) ) ( not ( = ?auto_394388 ?auto_394396 ) ) ( not ( = ?auto_394389 ?auto_394390 ) ) ( not ( = ?auto_394389 ?auto_394391 ) ) ( not ( = ?auto_394389 ?auto_394392 ) ) ( not ( = ?auto_394389 ?auto_394393 ) ) ( not ( = ?auto_394389 ?auto_394394 ) ) ( not ( = ?auto_394389 ?auto_394395 ) ) ( not ( = ?auto_394389 ?auto_394396 ) ) ( not ( = ?auto_394390 ?auto_394391 ) ) ( not ( = ?auto_394390 ?auto_394392 ) ) ( not ( = ?auto_394390 ?auto_394393 ) ) ( not ( = ?auto_394390 ?auto_394394 ) ) ( not ( = ?auto_394390 ?auto_394395 ) ) ( not ( = ?auto_394390 ?auto_394396 ) ) ( not ( = ?auto_394391 ?auto_394392 ) ) ( not ( = ?auto_394391 ?auto_394393 ) ) ( not ( = ?auto_394391 ?auto_394394 ) ) ( not ( = ?auto_394391 ?auto_394395 ) ) ( not ( = ?auto_394391 ?auto_394396 ) ) ( not ( = ?auto_394392 ?auto_394393 ) ) ( not ( = ?auto_394392 ?auto_394394 ) ) ( not ( = ?auto_394392 ?auto_394395 ) ) ( not ( = ?auto_394392 ?auto_394396 ) ) ( not ( = ?auto_394393 ?auto_394394 ) ) ( not ( = ?auto_394393 ?auto_394395 ) ) ( not ( = ?auto_394393 ?auto_394396 ) ) ( not ( = ?auto_394394 ?auto_394395 ) ) ( not ( = ?auto_394394 ?auto_394396 ) ) ( not ( = ?auto_394395 ?auto_394396 ) ) ( ON ?auto_394394 ?auto_394395 ) ( ON ?auto_394393 ?auto_394394 ) ( ON ?auto_394392 ?auto_394393 ) ( ON ?auto_394391 ?auto_394392 ) ( ON ?auto_394390 ?auto_394391 ) ( CLEAR ?auto_394388 ) ( ON ?auto_394389 ?auto_394390 ) ( CLEAR ?auto_394389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_394384 ?auto_394385 ?auto_394386 ?auto_394387 ?auto_394388 ?auto_394389 )
      ( MAKE-12PILE ?auto_394384 ?auto_394385 ?auto_394386 ?auto_394387 ?auto_394388 ?auto_394389 ?auto_394390 ?auto_394391 ?auto_394392 ?auto_394393 ?auto_394394 ?auto_394395 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394409 - BLOCK
      ?auto_394410 - BLOCK
      ?auto_394411 - BLOCK
      ?auto_394412 - BLOCK
      ?auto_394413 - BLOCK
      ?auto_394414 - BLOCK
      ?auto_394415 - BLOCK
      ?auto_394416 - BLOCK
      ?auto_394417 - BLOCK
      ?auto_394418 - BLOCK
      ?auto_394419 - BLOCK
      ?auto_394420 - BLOCK
    )
    :vars
    (
      ?auto_394421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394420 ?auto_394421 ) ( ON-TABLE ?auto_394409 ) ( ON ?auto_394410 ?auto_394409 ) ( ON ?auto_394411 ?auto_394410 ) ( ON ?auto_394412 ?auto_394411 ) ( ON ?auto_394413 ?auto_394412 ) ( not ( = ?auto_394409 ?auto_394410 ) ) ( not ( = ?auto_394409 ?auto_394411 ) ) ( not ( = ?auto_394409 ?auto_394412 ) ) ( not ( = ?auto_394409 ?auto_394413 ) ) ( not ( = ?auto_394409 ?auto_394414 ) ) ( not ( = ?auto_394409 ?auto_394415 ) ) ( not ( = ?auto_394409 ?auto_394416 ) ) ( not ( = ?auto_394409 ?auto_394417 ) ) ( not ( = ?auto_394409 ?auto_394418 ) ) ( not ( = ?auto_394409 ?auto_394419 ) ) ( not ( = ?auto_394409 ?auto_394420 ) ) ( not ( = ?auto_394409 ?auto_394421 ) ) ( not ( = ?auto_394410 ?auto_394411 ) ) ( not ( = ?auto_394410 ?auto_394412 ) ) ( not ( = ?auto_394410 ?auto_394413 ) ) ( not ( = ?auto_394410 ?auto_394414 ) ) ( not ( = ?auto_394410 ?auto_394415 ) ) ( not ( = ?auto_394410 ?auto_394416 ) ) ( not ( = ?auto_394410 ?auto_394417 ) ) ( not ( = ?auto_394410 ?auto_394418 ) ) ( not ( = ?auto_394410 ?auto_394419 ) ) ( not ( = ?auto_394410 ?auto_394420 ) ) ( not ( = ?auto_394410 ?auto_394421 ) ) ( not ( = ?auto_394411 ?auto_394412 ) ) ( not ( = ?auto_394411 ?auto_394413 ) ) ( not ( = ?auto_394411 ?auto_394414 ) ) ( not ( = ?auto_394411 ?auto_394415 ) ) ( not ( = ?auto_394411 ?auto_394416 ) ) ( not ( = ?auto_394411 ?auto_394417 ) ) ( not ( = ?auto_394411 ?auto_394418 ) ) ( not ( = ?auto_394411 ?auto_394419 ) ) ( not ( = ?auto_394411 ?auto_394420 ) ) ( not ( = ?auto_394411 ?auto_394421 ) ) ( not ( = ?auto_394412 ?auto_394413 ) ) ( not ( = ?auto_394412 ?auto_394414 ) ) ( not ( = ?auto_394412 ?auto_394415 ) ) ( not ( = ?auto_394412 ?auto_394416 ) ) ( not ( = ?auto_394412 ?auto_394417 ) ) ( not ( = ?auto_394412 ?auto_394418 ) ) ( not ( = ?auto_394412 ?auto_394419 ) ) ( not ( = ?auto_394412 ?auto_394420 ) ) ( not ( = ?auto_394412 ?auto_394421 ) ) ( not ( = ?auto_394413 ?auto_394414 ) ) ( not ( = ?auto_394413 ?auto_394415 ) ) ( not ( = ?auto_394413 ?auto_394416 ) ) ( not ( = ?auto_394413 ?auto_394417 ) ) ( not ( = ?auto_394413 ?auto_394418 ) ) ( not ( = ?auto_394413 ?auto_394419 ) ) ( not ( = ?auto_394413 ?auto_394420 ) ) ( not ( = ?auto_394413 ?auto_394421 ) ) ( not ( = ?auto_394414 ?auto_394415 ) ) ( not ( = ?auto_394414 ?auto_394416 ) ) ( not ( = ?auto_394414 ?auto_394417 ) ) ( not ( = ?auto_394414 ?auto_394418 ) ) ( not ( = ?auto_394414 ?auto_394419 ) ) ( not ( = ?auto_394414 ?auto_394420 ) ) ( not ( = ?auto_394414 ?auto_394421 ) ) ( not ( = ?auto_394415 ?auto_394416 ) ) ( not ( = ?auto_394415 ?auto_394417 ) ) ( not ( = ?auto_394415 ?auto_394418 ) ) ( not ( = ?auto_394415 ?auto_394419 ) ) ( not ( = ?auto_394415 ?auto_394420 ) ) ( not ( = ?auto_394415 ?auto_394421 ) ) ( not ( = ?auto_394416 ?auto_394417 ) ) ( not ( = ?auto_394416 ?auto_394418 ) ) ( not ( = ?auto_394416 ?auto_394419 ) ) ( not ( = ?auto_394416 ?auto_394420 ) ) ( not ( = ?auto_394416 ?auto_394421 ) ) ( not ( = ?auto_394417 ?auto_394418 ) ) ( not ( = ?auto_394417 ?auto_394419 ) ) ( not ( = ?auto_394417 ?auto_394420 ) ) ( not ( = ?auto_394417 ?auto_394421 ) ) ( not ( = ?auto_394418 ?auto_394419 ) ) ( not ( = ?auto_394418 ?auto_394420 ) ) ( not ( = ?auto_394418 ?auto_394421 ) ) ( not ( = ?auto_394419 ?auto_394420 ) ) ( not ( = ?auto_394419 ?auto_394421 ) ) ( not ( = ?auto_394420 ?auto_394421 ) ) ( ON ?auto_394419 ?auto_394420 ) ( ON ?auto_394418 ?auto_394419 ) ( ON ?auto_394417 ?auto_394418 ) ( ON ?auto_394416 ?auto_394417 ) ( ON ?auto_394415 ?auto_394416 ) ( CLEAR ?auto_394413 ) ( ON ?auto_394414 ?auto_394415 ) ( CLEAR ?auto_394414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_394409 ?auto_394410 ?auto_394411 ?auto_394412 ?auto_394413 ?auto_394414 )
      ( MAKE-12PILE ?auto_394409 ?auto_394410 ?auto_394411 ?auto_394412 ?auto_394413 ?auto_394414 ?auto_394415 ?auto_394416 ?auto_394417 ?auto_394418 ?auto_394419 ?auto_394420 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394434 - BLOCK
      ?auto_394435 - BLOCK
      ?auto_394436 - BLOCK
      ?auto_394437 - BLOCK
      ?auto_394438 - BLOCK
      ?auto_394439 - BLOCK
      ?auto_394440 - BLOCK
      ?auto_394441 - BLOCK
      ?auto_394442 - BLOCK
      ?auto_394443 - BLOCK
      ?auto_394444 - BLOCK
      ?auto_394445 - BLOCK
    )
    :vars
    (
      ?auto_394446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394445 ?auto_394446 ) ( ON-TABLE ?auto_394434 ) ( ON ?auto_394435 ?auto_394434 ) ( ON ?auto_394436 ?auto_394435 ) ( ON ?auto_394437 ?auto_394436 ) ( not ( = ?auto_394434 ?auto_394435 ) ) ( not ( = ?auto_394434 ?auto_394436 ) ) ( not ( = ?auto_394434 ?auto_394437 ) ) ( not ( = ?auto_394434 ?auto_394438 ) ) ( not ( = ?auto_394434 ?auto_394439 ) ) ( not ( = ?auto_394434 ?auto_394440 ) ) ( not ( = ?auto_394434 ?auto_394441 ) ) ( not ( = ?auto_394434 ?auto_394442 ) ) ( not ( = ?auto_394434 ?auto_394443 ) ) ( not ( = ?auto_394434 ?auto_394444 ) ) ( not ( = ?auto_394434 ?auto_394445 ) ) ( not ( = ?auto_394434 ?auto_394446 ) ) ( not ( = ?auto_394435 ?auto_394436 ) ) ( not ( = ?auto_394435 ?auto_394437 ) ) ( not ( = ?auto_394435 ?auto_394438 ) ) ( not ( = ?auto_394435 ?auto_394439 ) ) ( not ( = ?auto_394435 ?auto_394440 ) ) ( not ( = ?auto_394435 ?auto_394441 ) ) ( not ( = ?auto_394435 ?auto_394442 ) ) ( not ( = ?auto_394435 ?auto_394443 ) ) ( not ( = ?auto_394435 ?auto_394444 ) ) ( not ( = ?auto_394435 ?auto_394445 ) ) ( not ( = ?auto_394435 ?auto_394446 ) ) ( not ( = ?auto_394436 ?auto_394437 ) ) ( not ( = ?auto_394436 ?auto_394438 ) ) ( not ( = ?auto_394436 ?auto_394439 ) ) ( not ( = ?auto_394436 ?auto_394440 ) ) ( not ( = ?auto_394436 ?auto_394441 ) ) ( not ( = ?auto_394436 ?auto_394442 ) ) ( not ( = ?auto_394436 ?auto_394443 ) ) ( not ( = ?auto_394436 ?auto_394444 ) ) ( not ( = ?auto_394436 ?auto_394445 ) ) ( not ( = ?auto_394436 ?auto_394446 ) ) ( not ( = ?auto_394437 ?auto_394438 ) ) ( not ( = ?auto_394437 ?auto_394439 ) ) ( not ( = ?auto_394437 ?auto_394440 ) ) ( not ( = ?auto_394437 ?auto_394441 ) ) ( not ( = ?auto_394437 ?auto_394442 ) ) ( not ( = ?auto_394437 ?auto_394443 ) ) ( not ( = ?auto_394437 ?auto_394444 ) ) ( not ( = ?auto_394437 ?auto_394445 ) ) ( not ( = ?auto_394437 ?auto_394446 ) ) ( not ( = ?auto_394438 ?auto_394439 ) ) ( not ( = ?auto_394438 ?auto_394440 ) ) ( not ( = ?auto_394438 ?auto_394441 ) ) ( not ( = ?auto_394438 ?auto_394442 ) ) ( not ( = ?auto_394438 ?auto_394443 ) ) ( not ( = ?auto_394438 ?auto_394444 ) ) ( not ( = ?auto_394438 ?auto_394445 ) ) ( not ( = ?auto_394438 ?auto_394446 ) ) ( not ( = ?auto_394439 ?auto_394440 ) ) ( not ( = ?auto_394439 ?auto_394441 ) ) ( not ( = ?auto_394439 ?auto_394442 ) ) ( not ( = ?auto_394439 ?auto_394443 ) ) ( not ( = ?auto_394439 ?auto_394444 ) ) ( not ( = ?auto_394439 ?auto_394445 ) ) ( not ( = ?auto_394439 ?auto_394446 ) ) ( not ( = ?auto_394440 ?auto_394441 ) ) ( not ( = ?auto_394440 ?auto_394442 ) ) ( not ( = ?auto_394440 ?auto_394443 ) ) ( not ( = ?auto_394440 ?auto_394444 ) ) ( not ( = ?auto_394440 ?auto_394445 ) ) ( not ( = ?auto_394440 ?auto_394446 ) ) ( not ( = ?auto_394441 ?auto_394442 ) ) ( not ( = ?auto_394441 ?auto_394443 ) ) ( not ( = ?auto_394441 ?auto_394444 ) ) ( not ( = ?auto_394441 ?auto_394445 ) ) ( not ( = ?auto_394441 ?auto_394446 ) ) ( not ( = ?auto_394442 ?auto_394443 ) ) ( not ( = ?auto_394442 ?auto_394444 ) ) ( not ( = ?auto_394442 ?auto_394445 ) ) ( not ( = ?auto_394442 ?auto_394446 ) ) ( not ( = ?auto_394443 ?auto_394444 ) ) ( not ( = ?auto_394443 ?auto_394445 ) ) ( not ( = ?auto_394443 ?auto_394446 ) ) ( not ( = ?auto_394444 ?auto_394445 ) ) ( not ( = ?auto_394444 ?auto_394446 ) ) ( not ( = ?auto_394445 ?auto_394446 ) ) ( ON ?auto_394444 ?auto_394445 ) ( ON ?auto_394443 ?auto_394444 ) ( ON ?auto_394442 ?auto_394443 ) ( ON ?auto_394441 ?auto_394442 ) ( ON ?auto_394440 ?auto_394441 ) ( ON ?auto_394439 ?auto_394440 ) ( CLEAR ?auto_394437 ) ( ON ?auto_394438 ?auto_394439 ) ( CLEAR ?auto_394438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_394434 ?auto_394435 ?auto_394436 ?auto_394437 ?auto_394438 )
      ( MAKE-12PILE ?auto_394434 ?auto_394435 ?auto_394436 ?auto_394437 ?auto_394438 ?auto_394439 ?auto_394440 ?auto_394441 ?auto_394442 ?auto_394443 ?auto_394444 ?auto_394445 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394459 - BLOCK
      ?auto_394460 - BLOCK
      ?auto_394461 - BLOCK
      ?auto_394462 - BLOCK
      ?auto_394463 - BLOCK
      ?auto_394464 - BLOCK
      ?auto_394465 - BLOCK
      ?auto_394466 - BLOCK
      ?auto_394467 - BLOCK
      ?auto_394468 - BLOCK
      ?auto_394469 - BLOCK
      ?auto_394470 - BLOCK
    )
    :vars
    (
      ?auto_394471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394470 ?auto_394471 ) ( ON-TABLE ?auto_394459 ) ( ON ?auto_394460 ?auto_394459 ) ( ON ?auto_394461 ?auto_394460 ) ( ON ?auto_394462 ?auto_394461 ) ( not ( = ?auto_394459 ?auto_394460 ) ) ( not ( = ?auto_394459 ?auto_394461 ) ) ( not ( = ?auto_394459 ?auto_394462 ) ) ( not ( = ?auto_394459 ?auto_394463 ) ) ( not ( = ?auto_394459 ?auto_394464 ) ) ( not ( = ?auto_394459 ?auto_394465 ) ) ( not ( = ?auto_394459 ?auto_394466 ) ) ( not ( = ?auto_394459 ?auto_394467 ) ) ( not ( = ?auto_394459 ?auto_394468 ) ) ( not ( = ?auto_394459 ?auto_394469 ) ) ( not ( = ?auto_394459 ?auto_394470 ) ) ( not ( = ?auto_394459 ?auto_394471 ) ) ( not ( = ?auto_394460 ?auto_394461 ) ) ( not ( = ?auto_394460 ?auto_394462 ) ) ( not ( = ?auto_394460 ?auto_394463 ) ) ( not ( = ?auto_394460 ?auto_394464 ) ) ( not ( = ?auto_394460 ?auto_394465 ) ) ( not ( = ?auto_394460 ?auto_394466 ) ) ( not ( = ?auto_394460 ?auto_394467 ) ) ( not ( = ?auto_394460 ?auto_394468 ) ) ( not ( = ?auto_394460 ?auto_394469 ) ) ( not ( = ?auto_394460 ?auto_394470 ) ) ( not ( = ?auto_394460 ?auto_394471 ) ) ( not ( = ?auto_394461 ?auto_394462 ) ) ( not ( = ?auto_394461 ?auto_394463 ) ) ( not ( = ?auto_394461 ?auto_394464 ) ) ( not ( = ?auto_394461 ?auto_394465 ) ) ( not ( = ?auto_394461 ?auto_394466 ) ) ( not ( = ?auto_394461 ?auto_394467 ) ) ( not ( = ?auto_394461 ?auto_394468 ) ) ( not ( = ?auto_394461 ?auto_394469 ) ) ( not ( = ?auto_394461 ?auto_394470 ) ) ( not ( = ?auto_394461 ?auto_394471 ) ) ( not ( = ?auto_394462 ?auto_394463 ) ) ( not ( = ?auto_394462 ?auto_394464 ) ) ( not ( = ?auto_394462 ?auto_394465 ) ) ( not ( = ?auto_394462 ?auto_394466 ) ) ( not ( = ?auto_394462 ?auto_394467 ) ) ( not ( = ?auto_394462 ?auto_394468 ) ) ( not ( = ?auto_394462 ?auto_394469 ) ) ( not ( = ?auto_394462 ?auto_394470 ) ) ( not ( = ?auto_394462 ?auto_394471 ) ) ( not ( = ?auto_394463 ?auto_394464 ) ) ( not ( = ?auto_394463 ?auto_394465 ) ) ( not ( = ?auto_394463 ?auto_394466 ) ) ( not ( = ?auto_394463 ?auto_394467 ) ) ( not ( = ?auto_394463 ?auto_394468 ) ) ( not ( = ?auto_394463 ?auto_394469 ) ) ( not ( = ?auto_394463 ?auto_394470 ) ) ( not ( = ?auto_394463 ?auto_394471 ) ) ( not ( = ?auto_394464 ?auto_394465 ) ) ( not ( = ?auto_394464 ?auto_394466 ) ) ( not ( = ?auto_394464 ?auto_394467 ) ) ( not ( = ?auto_394464 ?auto_394468 ) ) ( not ( = ?auto_394464 ?auto_394469 ) ) ( not ( = ?auto_394464 ?auto_394470 ) ) ( not ( = ?auto_394464 ?auto_394471 ) ) ( not ( = ?auto_394465 ?auto_394466 ) ) ( not ( = ?auto_394465 ?auto_394467 ) ) ( not ( = ?auto_394465 ?auto_394468 ) ) ( not ( = ?auto_394465 ?auto_394469 ) ) ( not ( = ?auto_394465 ?auto_394470 ) ) ( not ( = ?auto_394465 ?auto_394471 ) ) ( not ( = ?auto_394466 ?auto_394467 ) ) ( not ( = ?auto_394466 ?auto_394468 ) ) ( not ( = ?auto_394466 ?auto_394469 ) ) ( not ( = ?auto_394466 ?auto_394470 ) ) ( not ( = ?auto_394466 ?auto_394471 ) ) ( not ( = ?auto_394467 ?auto_394468 ) ) ( not ( = ?auto_394467 ?auto_394469 ) ) ( not ( = ?auto_394467 ?auto_394470 ) ) ( not ( = ?auto_394467 ?auto_394471 ) ) ( not ( = ?auto_394468 ?auto_394469 ) ) ( not ( = ?auto_394468 ?auto_394470 ) ) ( not ( = ?auto_394468 ?auto_394471 ) ) ( not ( = ?auto_394469 ?auto_394470 ) ) ( not ( = ?auto_394469 ?auto_394471 ) ) ( not ( = ?auto_394470 ?auto_394471 ) ) ( ON ?auto_394469 ?auto_394470 ) ( ON ?auto_394468 ?auto_394469 ) ( ON ?auto_394467 ?auto_394468 ) ( ON ?auto_394466 ?auto_394467 ) ( ON ?auto_394465 ?auto_394466 ) ( ON ?auto_394464 ?auto_394465 ) ( CLEAR ?auto_394462 ) ( ON ?auto_394463 ?auto_394464 ) ( CLEAR ?auto_394463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_394459 ?auto_394460 ?auto_394461 ?auto_394462 ?auto_394463 )
      ( MAKE-12PILE ?auto_394459 ?auto_394460 ?auto_394461 ?auto_394462 ?auto_394463 ?auto_394464 ?auto_394465 ?auto_394466 ?auto_394467 ?auto_394468 ?auto_394469 ?auto_394470 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394484 - BLOCK
      ?auto_394485 - BLOCK
      ?auto_394486 - BLOCK
      ?auto_394487 - BLOCK
      ?auto_394488 - BLOCK
      ?auto_394489 - BLOCK
      ?auto_394490 - BLOCK
      ?auto_394491 - BLOCK
      ?auto_394492 - BLOCK
      ?auto_394493 - BLOCK
      ?auto_394494 - BLOCK
      ?auto_394495 - BLOCK
    )
    :vars
    (
      ?auto_394496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394495 ?auto_394496 ) ( ON-TABLE ?auto_394484 ) ( ON ?auto_394485 ?auto_394484 ) ( ON ?auto_394486 ?auto_394485 ) ( not ( = ?auto_394484 ?auto_394485 ) ) ( not ( = ?auto_394484 ?auto_394486 ) ) ( not ( = ?auto_394484 ?auto_394487 ) ) ( not ( = ?auto_394484 ?auto_394488 ) ) ( not ( = ?auto_394484 ?auto_394489 ) ) ( not ( = ?auto_394484 ?auto_394490 ) ) ( not ( = ?auto_394484 ?auto_394491 ) ) ( not ( = ?auto_394484 ?auto_394492 ) ) ( not ( = ?auto_394484 ?auto_394493 ) ) ( not ( = ?auto_394484 ?auto_394494 ) ) ( not ( = ?auto_394484 ?auto_394495 ) ) ( not ( = ?auto_394484 ?auto_394496 ) ) ( not ( = ?auto_394485 ?auto_394486 ) ) ( not ( = ?auto_394485 ?auto_394487 ) ) ( not ( = ?auto_394485 ?auto_394488 ) ) ( not ( = ?auto_394485 ?auto_394489 ) ) ( not ( = ?auto_394485 ?auto_394490 ) ) ( not ( = ?auto_394485 ?auto_394491 ) ) ( not ( = ?auto_394485 ?auto_394492 ) ) ( not ( = ?auto_394485 ?auto_394493 ) ) ( not ( = ?auto_394485 ?auto_394494 ) ) ( not ( = ?auto_394485 ?auto_394495 ) ) ( not ( = ?auto_394485 ?auto_394496 ) ) ( not ( = ?auto_394486 ?auto_394487 ) ) ( not ( = ?auto_394486 ?auto_394488 ) ) ( not ( = ?auto_394486 ?auto_394489 ) ) ( not ( = ?auto_394486 ?auto_394490 ) ) ( not ( = ?auto_394486 ?auto_394491 ) ) ( not ( = ?auto_394486 ?auto_394492 ) ) ( not ( = ?auto_394486 ?auto_394493 ) ) ( not ( = ?auto_394486 ?auto_394494 ) ) ( not ( = ?auto_394486 ?auto_394495 ) ) ( not ( = ?auto_394486 ?auto_394496 ) ) ( not ( = ?auto_394487 ?auto_394488 ) ) ( not ( = ?auto_394487 ?auto_394489 ) ) ( not ( = ?auto_394487 ?auto_394490 ) ) ( not ( = ?auto_394487 ?auto_394491 ) ) ( not ( = ?auto_394487 ?auto_394492 ) ) ( not ( = ?auto_394487 ?auto_394493 ) ) ( not ( = ?auto_394487 ?auto_394494 ) ) ( not ( = ?auto_394487 ?auto_394495 ) ) ( not ( = ?auto_394487 ?auto_394496 ) ) ( not ( = ?auto_394488 ?auto_394489 ) ) ( not ( = ?auto_394488 ?auto_394490 ) ) ( not ( = ?auto_394488 ?auto_394491 ) ) ( not ( = ?auto_394488 ?auto_394492 ) ) ( not ( = ?auto_394488 ?auto_394493 ) ) ( not ( = ?auto_394488 ?auto_394494 ) ) ( not ( = ?auto_394488 ?auto_394495 ) ) ( not ( = ?auto_394488 ?auto_394496 ) ) ( not ( = ?auto_394489 ?auto_394490 ) ) ( not ( = ?auto_394489 ?auto_394491 ) ) ( not ( = ?auto_394489 ?auto_394492 ) ) ( not ( = ?auto_394489 ?auto_394493 ) ) ( not ( = ?auto_394489 ?auto_394494 ) ) ( not ( = ?auto_394489 ?auto_394495 ) ) ( not ( = ?auto_394489 ?auto_394496 ) ) ( not ( = ?auto_394490 ?auto_394491 ) ) ( not ( = ?auto_394490 ?auto_394492 ) ) ( not ( = ?auto_394490 ?auto_394493 ) ) ( not ( = ?auto_394490 ?auto_394494 ) ) ( not ( = ?auto_394490 ?auto_394495 ) ) ( not ( = ?auto_394490 ?auto_394496 ) ) ( not ( = ?auto_394491 ?auto_394492 ) ) ( not ( = ?auto_394491 ?auto_394493 ) ) ( not ( = ?auto_394491 ?auto_394494 ) ) ( not ( = ?auto_394491 ?auto_394495 ) ) ( not ( = ?auto_394491 ?auto_394496 ) ) ( not ( = ?auto_394492 ?auto_394493 ) ) ( not ( = ?auto_394492 ?auto_394494 ) ) ( not ( = ?auto_394492 ?auto_394495 ) ) ( not ( = ?auto_394492 ?auto_394496 ) ) ( not ( = ?auto_394493 ?auto_394494 ) ) ( not ( = ?auto_394493 ?auto_394495 ) ) ( not ( = ?auto_394493 ?auto_394496 ) ) ( not ( = ?auto_394494 ?auto_394495 ) ) ( not ( = ?auto_394494 ?auto_394496 ) ) ( not ( = ?auto_394495 ?auto_394496 ) ) ( ON ?auto_394494 ?auto_394495 ) ( ON ?auto_394493 ?auto_394494 ) ( ON ?auto_394492 ?auto_394493 ) ( ON ?auto_394491 ?auto_394492 ) ( ON ?auto_394490 ?auto_394491 ) ( ON ?auto_394489 ?auto_394490 ) ( ON ?auto_394488 ?auto_394489 ) ( CLEAR ?auto_394486 ) ( ON ?auto_394487 ?auto_394488 ) ( CLEAR ?auto_394487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_394484 ?auto_394485 ?auto_394486 ?auto_394487 )
      ( MAKE-12PILE ?auto_394484 ?auto_394485 ?auto_394486 ?auto_394487 ?auto_394488 ?auto_394489 ?auto_394490 ?auto_394491 ?auto_394492 ?auto_394493 ?auto_394494 ?auto_394495 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394509 - BLOCK
      ?auto_394510 - BLOCK
      ?auto_394511 - BLOCK
      ?auto_394512 - BLOCK
      ?auto_394513 - BLOCK
      ?auto_394514 - BLOCK
      ?auto_394515 - BLOCK
      ?auto_394516 - BLOCK
      ?auto_394517 - BLOCK
      ?auto_394518 - BLOCK
      ?auto_394519 - BLOCK
      ?auto_394520 - BLOCK
    )
    :vars
    (
      ?auto_394521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394520 ?auto_394521 ) ( ON-TABLE ?auto_394509 ) ( ON ?auto_394510 ?auto_394509 ) ( ON ?auto_394511 ?auto_394510 ) ( not ( = ?auto_394509 ?auto_394510 ) ) ( not ( = ?auto_394509 ?auto_394511 ) ) ( not ( = ?auto_394509 ?auto_394512 ) ) ( not ( = ?auto_394509 ?auto_394513 ) ) ( not ( = ?auto_394509 ?auto_394514 ) ) ( not ( = ?auto_394509 ?auto_394515 ) ) ( not ( = ?auto_394509 ?auto_394516 ) ) ( not ( = ?auto_394509 ?auto_394517 ) ) ( not ( = ?auto_394509 ?auto_394518 ) ) ( not ( = ?auto_394509 ?auto_394519 ) ) ( not ( = ?auto_394509 ?auto_394520 ) ) ( not ( = ?auto_394509 ?auto_394521 ) ) ( not ( = ?auto_394510 ?auto_394511 ) ) ( not ( = ?auto_394510 ?auto_394512 ) ) ( not ( = ?auto_394510 ?auto_394513 ) ) ( not ( = ?auto_394510 ?auto_394514 ) ) ( not ( = ?auto_394510 ?auto_394515 ) ) ( not ( = ?auto_394510 ?auto_394516 ) ) ( not ( = ?auto_394510 ?auto_394517 ) ) ( not ( = ?auto_394510 ?auto_394518 ) ) ( not ( = ?auto_394510 ?auto_394519 ) ) ( not ( = ?auto_394510 ?auto_394520 ) ) ( not ( = ?auto_394510 ?auto_394521 ) ) ( not ( = ?auto_394511 ?auto_394512 ) ) ( not ( = ?auto_394511 ?auto_394513 ) ) ( not ( = ?auto_394511 ?auto_394514 ) ) ( not ( = ?auto_394511 ?auto_394515 ) ) ( not ( = ?auto_394511 ?auto_394516 ) ) ( not ( = ?auto_394511 ?auto_394517 ) ) ( not ( = ?auto_394511 ?auto_394518 ) ) ( not ( = ?auto_394511 ?auto_394519 ) ) ( not ( = ?auto_394511 ?auto_394520 ) ) ( not ( = ?auto_394511 ?auto_394521 ) ) ( not ( = ?auto_394512 ?auto_394513 ) ) ( not ( = ?auto_394512 ?auto_394514 ) ) ( not ( = ?auto_394512 ?auto_394515 ) ) ( not ( = ?auto_394512 ?auto_394516 ) ) ( not ( = ?auto_394512 ?auto_394517 ) ) ( not ( = ?auto_394512 ?auto_394518 ) ) ( not ( = ?auto_394512 ?auto_394519 ) ) ( not ( = ?auto_394512 ?auto_394520 ) ) ( not ( = ?auto_394512 ?auto_394521 ) ) ( not ( = ?auto_394513 ?auto_394514 ) ) ( not ( = ?auto_394513 ?auto_394515 ) ) ( not ( = ?auto_394513 ?auto_394516 ) ) ( not ( = ?auto_394513 ?auto_394517 ) ) ( not ( = ?auto_394513 ?auto_394518 ) ) ( not ( = ?auto_394513 ?auto_394519 ) ) ( not ( = ?auto_394513 ?auto_394520 ) ) ( not ( = ?auto_394513 ?auto_394521 ) ) ( not ( = ?auto_394514 ?auto_394515 ) ) ( not ( = ?auto_394514 ?auto_394516 ) ) ( not ( = ?auto_394514 ?auto_394517 ) ) ( not ( = ?auto_394514 ?auto_394518 ) ) ( not ( = ?auto_394514 ?auto_394519 ) ) ( not ( = ?auto_394514 ?auto_394520 ) ) ( not ( = ?auto_394514 ?auto_394521 ) ) ( not ( = ?auto_394515 ?auto_394516 ) ) ( not ( = ?auto_394515 ?auto_394517 ) ) ( not ( = ?auto_394515 ?auto_394518 ) ) ( not ( = ?auto_394515 ?auto_394519 ) ) ( not ( = ?auto_394515 ?auto_394520 ) ) ( not ( = ?auto_394515 ?auto_394521 ) ) ( not ( = ?auto_394516 ?auto_394517 ) ) ( not ( = ?auto_394516 ?auto_394518 ) ) ( not ( = ?auto_394516 ?auto_394519 ) ) ( not ( = ?auto_394516 ?auto_394520 ) ) ( not ( = ?auto_394516 ?auto_394521 ) ) ( not ( = ?auto_394517 ?auto_394518 ) ) ( not ( = ?auto_394517 ?auto_394519 ) ) ( not ( = ?auto_394517 ?auto_394520 ) ) ( not ( = ?auto_394517 ?auto_394521 ) ) ( not ( = ?auto_394518 ?auto_394519 ) ) ( not ( = ?auto_394518 ?auto_394520 ) ) ( not ( = ?auto_394518 ?auto_394521 ) ) ( not ( = ?auto_394519 ?auto_394520 ) ) ( not ( = ?auto_394519 ?auto_394521 ) ) ( not ( = ?auto_394520 ?auto_394521 ) ) ( ON ?auto_394519 ?auto_394520 ) ( ON ?auto_394518 ?auto_394519 ) ( ON ?auto_394517 ?auto_394518 ) ( ON ?auto_394516 ?auto_394517 ) ( ON ?auto_394515 ?auto_394516 ) ( ON ?auto_394514 ?auto_394515 ) ( ON ?auto_394513 ?auto_394514 ) ( CLEAR ?auto_394511 ) ( ON ?auto_394512 ?auto_394513 ) ( CLEAR ?auto_394512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_394509 ?auto_394510 ?auto_394511 ?auto_394512 )
      ( MAKE-12PILE ?auto_394509 ?auto_394510 ?auto_394511 ?auto_394512 ?auto_394513 ?auto_394514 ?auto_394515 ?auto_394516 ?auto_394517 ?auto_394518 ?auto_394519 ?auto_394520 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394534 - BLOCK
      ?auto_394535 - BLOCK
      ?auto_394536 - BLOCK
      ?auto_394537 - BLOCK
      ?auto_394538 - BLOCK
      ?auto_394539 - BLOCK
      ?auto_394540 - BLOCK
      ?auto_394541 - BLOCK
      ?auto_394542 - BLOCK
      ?auto_394543 - BLOCK
      ?auto_394544 - BLOCK
      ?auto_394545 - BLOCK
    )
    :vars
    (
      ?auto_394546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394545 ?auto_394546 ) ( ON-TABLE ?auto_394534 ) ( ON ?auto_394535 ?auto_394534 ) ( not ( = ?auto_394534 ?auto_394535 ) ) ( not ( = ?auto_394534 ?auto_394536 ) ) ( not ( = ?auto_394534 ?auto_394537 ) ) ( not ( = ?auto_394534 ?auto_394538 ) ) ( not ( = ?auto_394534 ?auto_394539 ) ) ( not ( = ?auto_394534 ?auto_394540 ) ) ( not ( = ?auto_394534 ?auto_394541 ) ) ( not ( = ?auto_394534 ?auto_394542 ) ) ( not ( = ?auto_394534 ?auto_394543 ) ) ( not ( = ?auto_394534 ?auto_394544 ) ) ( not ( = ?auto_394534 ?auto_394545 ) ) ( not ( = ?auto_394534 ?auto_394546 ) ) ( not ( = ?auto_394535 ?auto_394536 ) ) ( not ( = ?auto_394535 ?auto_394537 ) ) ( not ( = ?auto_394535 ?auto_394538 ) ) ( not ( = ?auto_394535 ?auto_394539 ) ) ( not ( = ?auto_394535 ?auto_394540 ) ) ( not ( = ?auto_394535 ?auto_394541 ) ) ( not ( = ?auto_394535 ?auto_394542 ) ) ( not ( = ?auto_394535 ?auto_394543 ) ) ( not ( = ?auto_394535 ?auto_394544 ) ) ( not ( = ?auto_394535 ?auto_394545 ) ) ( not ( = ?auto_394535 ?auto_394546 ) ) ( not ( = ?auto_394536 ?auto_394537 ) ) ( not ( = ?auto_394536 ?auto_394538 ) ) ( not ( = ?auto_394536 ?auto_394539 ) ) ( not ( = ?auto_394536 ?auto_394540 ) ) ( not ( = ?auto_394536 ?auto_394541 ) ) ( not ( = ?auto_394536 ?auto_394542 ) ) ( not ( = ?auto_394536 ?auto_394543 ) ) ( not ( = ?auto_394536 ?auto_394544 ) ) ( not ( = ?auto_394536 ?auto_394545 ) ) ( not ( = ?auto_394536 ?auto_394546 ) ) ( not ( = ?auto_394537 ?auto_394538 ) ) ( not ( = ?auto_394537 ?auto_394539 ) ) ( not ( = ?auto_394537 ?auto_394540 ) ) ( not ( = ?auto_394537 ?auto_394541 ) ) ( not ( = ?auto_394537 ?auto_394542 ) ) ( not ( = ?auto_394537 ?auto_394543 ) ) ( not ( = ?auto_394537 ?auto_394544 ) ) ( not ( = ?auto_394537 ?auto_394545 ) ) ( not ( = ?auto_394537 ?auto_394546 ) ) ( not ( = ?auto_394538 ?auto_394539 ) ) ( not ( = ?auto_394538 ?auto_394540 ) ) ( not ( = ?auto_394538 ?auto_394541 ) ) ( not ( = ?auto_394538 ?auto_394542 ) ) ( not ( = ?auto_394538 ?auto_394543 ) ) ( not ( = ?auto_394538 ?auto_394544 ) ) ( not ( = ?auto_394538 ?auto_394545 ) ) ( not ( = ?auto_394538 ?auto_394546 ) ) ( not ( = ?auto_394539 ?auto_394540 ) ) ( not ( = ?auto_394539 ?auto_394541 ) ) ( not ( = ?auto_394539 ?auto_394542 ) ) ( not ( = ?auto_394539 ?auto_394543 ) ) ( not ( = ?auto_394539 ?auto_394544 ) ) ( not ( = ?auto_394539 ?auto_394545 ) ) ( not ( = ?auto_394539 ?auto_394546 ) ) ( not ( = ?auto_394540 ?auto_394541 ) ) ( not ( = ?auto_394540 ?auto_394542 ) ) ( not ( = ?auto_394540 ?auto_394543 ) ) ( not ( = ?auto_394540 ?auto_394544 ) ) ( not ( = ?auto_394540 ?auto_394545 ) ) ( not ( = ?auto_394540 ?auto_394546 ) ) ( not ( = ?auto_394541 ?auto_394542 ) ) ( not ( = ?auto_394541 ?auto_394543 ) ) ( not ( = ?auto_394541 ?auto_394544 ) ) ( not ( = ?auto_394541 ?auto_394545 ) ) ( not ( = ?auto_394541 ?auto_394546 ) ) ( not ( = ?auto_394542 ?auto_394543 ) ) ( not ( = ?auto_394542 ?auto_394544 ) ) ( not ( = ?auto_394542 ?auto_394545 ) ) ( not ( = ?auto_394542 ?auto_394546 ) ) ( not ( = ?auto_394543 ?auto_394544 ) ) ( not ( = ?auto_394543 ?auto_394545 ) ) ( not ( = ?auto_394543 ?auto_394546 ) ) ( not ( = ?auto_394544 ?auto_394545 ) ) ( not ( = ?auto_394544 ?auto_394546 ) ) ( not ( = ?auto_394545 ?auto_394546 ) ) ( ON ?auto_394544 ?auto_394545 ) ( ON ?auto_394543 ?auto_394544 ) ( ON ?auto_394542 ?auto_394543 ) ( ON ?auto_394541 ?auto_394542 ) ( ON ?auto_394540 ?auto_394541 ) ( ON ?auto_394539 ?auto_394540 ) ( ON ?auto_394538 ?auto_394539 ) ( ON ?auto_394537 ?auto_394538 ) ( CLEAR ?auto_394535 ) ( ON ?auto_394536 ?auto_394537 ) ( CLEAR ?auto_394536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_394534 ?auto_394535 ?auto_394536 )
      ( MAKE-12PILE ?auto_394534 ?auto_394535 ?auto_394536 ?auto_394537 ?auto_394538 ?auto_394539 ?auto_394540 ?auto_394541 ?auto_394542 ?auto_394543 ?auto_394544 ?auto_394545 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394559 - BLOCK
      ?auto_394560 - BLOCK
      ?auto_394561 - BLOCK
      ?auto_394562 - BLOCK
      ?auto_394563 - BLOCK
      ?auto_394564 - BLOCK
      ?auto_394565 - BLOCK
      ?auto_394566 - BLOCK
      ?auto_394567 - BLOCK
      ?auto_394568 - BLOCK
      ?auto_394569 - BLOCK
      ?auto_394570 - BLOCK
    )
    :vars
    (
      ?auto_394571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394570 ?auto_394571 ) ( ON-TABLE ?auto_394559 ) ( ON ?auto_394560 ?auto_394559 ) ( not ( = ?auto_394559 ?auto_394560 ) ) ( not ( = ?auto_394559 ?auto_394561 ) ) ( not ( = ?auto_394559 ?auto_394562 ) ) ( not ( = ?auto_394559 ?auto_394563 ) ) ( not ( = ?auto_394559 ?auto_394564 ) ) ( not ( = ?auto_394559 ?auto_394565 ) ) ( not ( = ?auto_394559 ?auto_394566 ) ) ( not ( = ?auto_394559 ?auto_394567 ) ) ( not ( = ?auto_394559 ?auto_394568 ) ) ( not ( = ?auto_394559 ?auto_394569 ) ) ( not ( = ?auto_394559 ?auto_394570 ) ) ( not ( = ?auto_394559 ?auto_394571 ) ) ( not ( = ?auto_394560 ?auto_394561 ) ) ( not ( = ?auto_394560 ?auto_394562 ) ) ( not ( = ?auto_394560 ?auto_394563 ) ) ( not ( = ?auto_394560 ?auto_394564 ) ) ( not ( = ?auto_394560 ?auto_394565 ) ) ( not ( = ?auto_394560 ?auto_394566 ) ) ( not ( = ?auto_394560 ?auto_394567 ) ) ( not ( = ?auto_394560 ?auto_394568 ) ) ( not ( = ?auto_394560 ?auto_394569 ) ) ( not ( = ?auto_394560 ?auto_394570 ) ) ( not ( = ?auto_394560 ?auto_394571 ) ) ( not ( = ?auto_394561 ?auto_394562 ) ) ( not ( = ?auto_394561 ?auto_394563 ) ) ( not ( = ?auto_394561 ?auto_394564 ) ) ( not ( = ?auto_394561 ?auto_394565 ) ) ( not ( = ?auto_394561 ?auto_394566 ) ) ( not ( = ?auto_394561 ?auto_394567 ) ) ( not ( = ?auto_394561 ?auto_394568 ) ) ( not ( = ?auto_394561 ?auto_394569 ) ) ( not ( = ?auto_394561 ?auto_394570 ) ) ( not ( = ?auto_394561 ?auto_394571 ) ) ( not ( = ?auto_394562 ?auto_394563 ) ) ( not ( = ?auto_394562 ?auto_394564 ) ) ( not ( = ?auto_394562 ?auto_394565 ) ) ( not ( = ?auto_394562 ?auto_394566 ) ) ( not ( = ?auto_394562 ?auto_394567 ) ) ( not ( = ?auto_394562 ?auto_394568 ) ) ( not ( = ?auto_394562 ?auto_394569 ) ) ( not ( = ?auto_394562 ?auto_394570 ) ) ( not ( = ?auto_394562 ?auto_394571 ) ) ( not ( = ?auto_394563 ?auto_394564 ) ) ( not ( = ?auto_394563 ?auto_394565 ) ) ( not ( = ?auto_394563 ?auto_394566 ) ) ( not ( = ?auto_394563 ?auto_394567 ) ) ( not ( = ?auto_394563 ?auto_394568 ) ) ( not ( = ?auto_394563 ?auto_394569 ) ) ( not ( = ?auto_394563 ?auto_394570 ) ) ( not ( = ?auto_394563 ?auto_394571 ) ) ( not ( = ?auto_394564 ?auto_394565 ) ) ( not ( = ?auto_394564 ?auto_394566 ) ) ( not ( = ?auto_394564 ?auto_394567 ) ) ( not ( = ?auto_394564 ?auto_394568 ) ) ( not ( = ?auto_394564 ?auto_394569 ) ) ( not ( = ?auto_394564 ?auto_394570 ) ) ( not ( = ?auto_394564 ?auto_394571 ) ) ( not ( = ?auto_394565 ?auto_394566 ) ) ( not ( = ?auto_394565 ?auto_394567 ) ) ( not ( = ?auto_394565 ?auto_394568 ) ) ( not ( = ?auto_394565 ?auto_394569 ) ) ( not ( = ?auto_394565 ?auto_394570 ) ) ( not ( = ?auto_394565 ?auto_394571 ) ) ( not ( = ?auto_394566 ?auto_394567 ) ) ( not ( = ?auto_394566 ?auto_394568 ) ) ( not ( = ?auto_394566 ?auto_394569 ) ) ( not ( = ?auto_394566 ?auto_394570 ) ) ( not ( = ?auto_394566 ?auto_394571 ) ) ( not ( = ?auto_394567 ?auto_394568 ) ) ( not ( = ?auto_394567 ?auto_394569 ) ) ( not ( = ?auto_394567 ?auto_394570 ) ) ( not ( = ?auto_394567 ?auto_394571 ) ) ( not ( = ?auto_394568 ?auto_394569 ) ) ( not ( = ?auto_394568 ?auto_394570 ) ) ( not ( = ?auto_394568 ?auto_394571 ) ) ( not ( = ?auto_394569 ?auto_394570 ) ) ( not ( = ?auto_394569 ?auto_394571 ) ) ( not ( = ?auto_394570 ?auto_394571 ) ) ( ON ?auto_394569 ?auto_394570 ) ( ON ?auto_394568 ?auto_394569 ) ( ON ?auto_394567 ?auto_394568 ) ( ON ?auto_394566 ?auto_394567 ) ( ON ?auto_394565 ?auto_394566 ) ( ON ?auto_394564 ?auto_394565 ) ( ON ?auto_394563 ?auto_394564 ) ( ON ?auto_394562 ?auto_394563 ) ( CLEAR ?auto_394560 ) ( ON ?auto_394561 ?auto_394562 ) ( CLEAR ?auto_394561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_394559 ?auto_394560 ?auto_394561 )
      ( MAKE-12PILE ?auto_394559 ?auto_394560 ?auto_394561 ?auto_394562 ?auto_394563 ?auto_394564 ?auto_394565 ?auto_394566 ?auto_394567 ?auto_394568 ?auto_394569 ?auto_394570 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394584 - BLOCK
      ?auto_394585 - BLOCK
      ?auto_394586 - BLOCK
      ?auto_394587 - BLOCK
      ?auto_394588 - BLOCK
      ?auto_394589 - BLOCK
      ?auto_394590 - BLOCK
      ?auto_394591 - BLOCK
      ?auto_394592 - BLOCK
      ?auto_394593 - BLOCK
      ?auto_394594 - BLOCK
      ?auto_394595 - BLOCK
    )
    :vars
    (
      ?auto_394596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394595 ?auto_394596 ) ( ON-TABLE ?auto_394584 ) ( not ( = ?auto_394584 ?auto_394585 ) ) ( not ( = ?auto_394584 ?auto_394586 ) ) ( not ( = ?auto_394584 ?auto_394587 ) ) ( not ( = ?auto_394584 ?auto_394588 ) ) ( not ( = ?auto_394584 ?auto_394589 ) ) ( not ( = ?auto_394584 ?auto_394590 ) ) ( not ( = ?auto_394584 ?auto_394591 ) ) ( not ( = ?auto_394584 ?auto_394592 ) ) ( not ( = ?auto_394584 ?auto_394593 ) ) ( not ( = ?auto_394584 ?auto_394594 ) ) ( not ( = ?auto_394584 ?auto_394595 ) ) ( not ( = ?auto_394584 ?auto_394596 ) ) ( not ( = ?auto_394585 ?auto_394586 ) ) ( not ( = ?auto_394585 ?auto_394587 ) ) ( not ( = ?auto_394585 ?auto_394588 ) ) ( not ( = ?auto_394585 ?auto_394589 ) ) ( not ( = ?auto_394585 ?auto_394590 ) ) ( not ( = ?auto_394585 ?auto_394591 ) ) ( not ( = ?auto_394585 ?auto_394592 ) ) ( not ( = ?auto_394585 ?auto_394593 ) ) ( not ( = ?auto_394585 ?auto_394594 ) ) ( not ( = ?auto_394585 ?auto_394595 ) ) ( not ( = ?auto_394585 ?auto_394596 ) ) ( not ( = ?auto_394586 ?auto_394587 ) ) ( not ( = ?auto_394586 ?auto_394588 ) ) ( not ( = ?auto_394586 ?auto_394589 ) ) ( not ( = ?auto_394586 ?auto_394590 ) ) ( not ( = ?auto_394586 ?auto_394591 ) ) ( not ( = ?auto_394586 ?auto_394592 ) ) ( not ( = ?auto_394586 ?auto_394593 ) ) ( not ( = ?auto_394586 ?auto_394594 ) ) ( not ( = ?auto_394586 ?auto_394595 ) ) ( not ( = ?auto_394586 ?auto_394596 ) ) ( not ( = ?auto_394587 ?auto_394588 ) ) ( not ( = ?auto_394587 ?auto_394589 ) ) ( not ( = ?auto_394587 ?auto_394590 ) ) ( not ( = ?auto_394587 ?auto_394591 ) ) ( not ( = ?auto_394587 ?auto_394592 ) ) ( not ( = ?auto_394587 ?auto_394593 ) ) ( not ( = ?auto_394587 ?auto_394594 ) ) ( not ( = ?auto_394587 ?auto_394595 ) ) ( not ( = ?auto_394587 ?auto_394596 ) ) ( not ( = ?auto_394588 ?auto_394589 ) ) ( not ( = ?auto_394588 ?auto_394590 ) ) ( not ( = ?auto_394588 ?auto_394591 ) ) ( not ( = ?auto_394588 ?auto_394592 ) ) ( not ( = ?auto_394588 ?auto_394593 ) ) ( not ( = ?auto_394588 ?auto_394594 ) ) ( not ( = ?auto_394588 ?auto_394595 ) ) ( not ( = ?auto_394588 ?auto_394596 ) ) ( not ( = ?auto_394589 ?auto_394590 ) ) ( not ( = ?auto_394589 ?auto_394591 ) ) ( not ( = ?auto_394589 ?auto_394592 ) ) ( not ( = ?auto_394589 ?auto_394593 ) ) ( not ( = ?auto_394589 ?auto_394594 ) ) ( not ( = ?auto_394589 ?auto_394595 ) ) ( not ( = ?auto_394589 ?auto_394596 ) ) ( not ( = ?auto_394590 ?auto_394591 ) ) ( not ( = ?auto_394590 ?auto_394592 ) ) ( not ( = ?auto_394590 ?auto_394593 ) ) ( not ( = ?auto_394590 ?auto_394594 ) ) ( not ( = ?auto_394590 ?auto_394595 ) ) ( not ( = ?auto_394590 ?auto_394596 ) ) ( not ( = ?auto_394591 ?auto_394592 ) ) ( not ( = ?auto_394591 ?auto_394593 ) ) ( not ( = ?auto_394591 ?auto_394594 ) ) ( not ( = ?auto_394591 ?auto_394595 ) ) ( not ( = ?auto_394591 ?auto_394596 ) ) ( not ( = ?auto_394592 ?auto_394593 ) ) ( not ( = ?auto_394592 ?auto_394594 ) ) ( not ( = ?auto_394592 ?auto_394595 ) ) ( not ( = ?auto_394592 ?auto_394596 ) ) ( not ( = ?auto_394593 ?auto_394594 ) ) ( not ( = ?auto_394593 ?auto_394595 ) ) ( not ( = ?auto_394593 ?auto_394596 ) ) ( not ( = ?auto_394594 ?auto_394595 ) ) ( not ( = ?auto_394594 ?auto_394596 ) ) ( not ( = ?auto_394595 ?auto_394596 ) ) ( ON ?auto_394594 ?auto_394595 ) ( ON ?auto_394593 ?auto_394594 ) ( ON ?auto_394592 ?auto_394593 ) ( ON ?auto_394591 ?auto_394592 ) ( ON ?auto_394590 ?auto_394591 ) ( ON ?auto_394589 ?auto_394590 ) ( ON ?auto_394588 ?auto_394589 ) ( ON ?auto_394587 ?auto_394588 ) ( ON ?auto_394586 ?auto_394587 ) ( CLEAR ?auto_394584 ) ( ON ?auto_394585 ?auto_394586 ) ( CLEAR ?auto_394585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_394584 ?auto_394585 )
      ( MAKE-12PILE ?auto_394584 ?auto_394585 ?auto_394586 ?auto_394587 ?auto_394588 ?auto_394589 ?auto_394590 ?auto_394591 ?auto_394592 ?auto_394593 ?auto_394594 ?auto_394595 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394609 - BLOCK
      ?auto_394610 - BLOCK
      ?auto_394611 - BLOCK
      ?auto_394612 - BLOCK
      ?auto_394613 - BLOCK
      ?auto_394614 - BLOCK
      ?auto_394615 - BLOCK
      ?auto_394616 - BLOCK
      ?auto_394617 - BLOCK
      ?auto_394618 - BLOCK
      ?auto_394619 - BLOCK
      ?auto_394620 - BLOCK
    )
    :vars
    (
      ?auto_394621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394620 ?auto_394621 ) ( ON-TABLE ?auto_394609 ) ( not ( = ?auto_394609 ?auto_394610 ) ) ( not ( = ?auto_394609 ?auto_394611 ) ) ( not ( = ?auto_394609 ?auto_394612 ) ) ( not ( = ?auto_394609 ?auto_394613 ) ) ( not ( = ?auto_394609 ?auto_394614 ) ) ( not ( = ?auto_394609 ?auto_394615 ) ) ( not ( = ?auto_394609 ?auto_394616 ) ) ( not ( = ?auto_394609 ?auto_394617 ) ) ( not ( = ?auto_394609 ?auto_394618 ) ) ( not ( = ?auto_394609 ?auto_394619 ) ) ( not ( = ?auto_394609 ?auto_394620 ) ) ( not ( = ?auto_394609 ?auto_394621 ) ) ( not ( = ?auto_394610 ?auto_394611 ) ) ( not ( = ?auto_394610 ?auto_394612 ) ) ( not ( = ?auto_394610 ?auto_394613 ) ) ( not ( = ?auto_394610 ?auto_394614 ) ) ( not ( = ?auto_394610 ?auto_394615 ) ) ( not ( = ?auto_394610 ?auto_394616 ) ) ( not ( = ?auto_394610 ?auto_394617 ) ) ( not ( = ?auto_394610 ?auto_394618 ) ) ( not ( = ?auto_394610 ?auto_394619 ) ) ( not ( = ?auto_394610 ?auto_394620 ) ) ( not ( = ?auto_394610 ?auto_394621 ) ) ( not ( = ?auto_394611 ?auto_394612 ) ) ( not ( = ?auto_394611 ?auto_394613 ) ) ( not ( = ?auto_394611 ?auto_394614 ) ) ( not ( = ?auto_394611 ?auto_394615 ) ) ( not ( = ?auto_394611 ?auto_394616 ) ) ( not ( = ?auto_394611 ?auto_394617 ) ) ( not ( = ?auto_394611 ?auto_394618 ) ) ( not ( = ?auto_394611 ?auto_394619 ) ) ( not ( = ?auto_394611 ?auto_394620 ) ) ( not ( = ?auto_394611 ?auto_394621 ) ) ( not ( = ?auto_394612 ?auto_394613 ) ) ( not ( = ?auto_394612 ?auto_394614 ) ) ( not ( = ?auto_394612 ?auto_394615 ) ) ( not ( = ?auto_394612 ?auto_394616 ) ) ( not ( = ?auto_394612 ?auto_394617 ) ) ( not ( = ?auto_394612 ?auto_394618 ) ) ( not ( = ?auto_394612 ?auto_394619 ) ) ( not ( = ?auto_394612 ?auto_394620 ) ) ( not ( = ?auto_394612 ?auto_394621 ) ) ( not ( = ?auto_394613 ?auto_394614 ) ) ( not ( = ?auto_394613 ?auto_394615 ) ) ( not ( = ?auto_394613 ?auto_394616 ) ) ( not ( = ?auto_394613 ?auto_394617 ) ) ( not ( = ?auto_394613 ?auto_394618 ) ) ( not ( = ?auto_394613 ?auto_394619 ) ) ( not ( = ?auto_394613 ?auto_394620 ) ) ( not ( = ?auto_394613 ?auto_394621 ) ) ( not ( = ?auto_394614 ?auto_394615 ) ) ( not ( = ?auto_394614 ?auto_394616 ) ) ( not ( = ?auto_394614 ?auto_394617 ) ) ( not ( = ?auto_394614 ?auto_394618 ) ) ( not ( = ?auto_394614 ?auto_394619 ) ) ( not ( = ?auto_394614 ?auto_394620 ) ) ( not ( = ?auto_394614 ?auto_394621 ) ) ( not ( = ?auto_394615 ?auto_394616 ) ) ( not ( = ?auto_394615 ?auto_394617 ) ) ( not ( = ?auto_394615 ?auto_394618 ) ) ( not ( = ?auto_394615 ?auto_394619 ) ) ( not ( = ?auto_394615 ?auto_394620 ) ) ( not ( = ?auto_394615 ?auto_394621 ) ) ( not ( = ?auto_394616 ?auto_394617 ) ) ( not ( = ?auto_394616 ?auto_394618 ) ) ( not ( = ?auto_394616 ?auto_394619 ) ) ( not ( = ?auto_394616 ?auto_394620 ) ) ( not ( = ?auto_394616 ?auto_394621 ) ) ( not ( = ?auto_394617 ?auto_394618 ) ) ( not ( = ?auto_394617 ?auto_394619 ) ) ( not ( = ?auto_394617 ?auto_394620 ) ) ( not ( = ?auto_394617 ?auto_394621 ) ) ( not ( = ?auto_394618 ?auto_394619 ) ) ( not ( = ?auto_394618 ?auto_394620 ) ) ( not ( = ?auto_394618 ?auto_394621 ) ) ( not ( = ?auto_394619 ?auto_394620 ) ) ( not ( = ?auto_394619 ?auto_394621 ) ) ( not ( = ?auto_394620 ?auto_394621 ) ) ( ON ?auto_394619 ?auto_394620 ) ( ON ?auto_394618 ?auto_394619 ) ( ON ?auto_394617 ?auto_394618 ) ( ON ?auto_394616 ?auto_394617 ) ( ON ?auto_394615 ?auto_394616 ) ( ON ?auto_394614 ?auto_394615 ) ( ON ?auto_394613 ?auto_394614 ) ( ON ?auto_394612 ?auto_394613 ) ( ON ?auto_394611 ?auto_394612 ) ( CLEAR ?auto_394609 ) ( ON ?auto_394610 ?auto_394611 ) ( CLEAR ?auto_394610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_394609 ?auto_394610 )
      ( MAKE-12PILE ?auto_394609 ?auto_394610 ?auto_394611 ?auto_394612 ?auto_394613 ?auto_394614 ?auto_394615 ?auto_394616 ?auto_394617 ?auto_394618 ?auto_394619 ?auto_394620 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394634 - BLOCK
      ?auto_394635 - BLOCK
      ?auto_394636 - BLOCK
      ?auto_394637 - BLOCK
      ?auto_394638 - BLOCK
      ?auto_394639 - BLOCK
      ?auto_394640 - BLOCK
      ?auto_394641 - BLOCK
      ?auto_394642 - BLOCK
      ?auto_394643 - BLOCK
      ?auto_394644 - BLOCK
      ?auto_394645 - BLOCK
    )
    :vars
    (
      ?auto_394646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394645 ?auto_394646 ) ( not ( = ?auto_394634 ?auto_394635 ) ) ( not ( = ?auto_394634 ?auto_394636 ) ) ( not ( = ?auto_394634 ?auto_394637 ) ) ( not ( = ?auto_394634 ?auto_394638 ) ) ( not ( = ?auto_394634 ?auto_394639 ) ) ( not ( = ?auto_394634 ?auto_394640 ) ) ( not ( = ?auto_394634 ?auto_394641 ) ) ( not ( = ?auto_394634 ?auto_394642 ) ) ( not ( = ?auto_394634 ?auto_394643 ) ) ( not ( = ?auto_394634 ?auto_394644 ) ) ( not ( = ?auto_394634 ?auto_394645 ) ) ( not ( = ?auto_394634 ?auto_394646 ) ) ( not ( = ?auto_394635 ?auto_394636 ) ) ( not ( = ?auto_394635 ?auto_394637 ) ) ( not ( = ?auto_394635 ?auto_394638 ) ) ( not ( = ?auto_394635 ?auto_394639 ) ) ( not ( = ?auto_394635 ?auto_394640 ) ) ( not ( = ?auto_394635 ?auto_394641 ) ) ( not ( = ?auto_394635 ?auto_394642 ) ) ( not ( = ?auto_394635 ?auto_394643 ) ) ( not ( = ?auto_394635 ?auto_394644 ) ) ( not ( = ?auto_394635 ?auto_394645 ) ) ( not ( = ?auto_394635 ?auto_394646 ) ) ( not ( = ?auto_394636 ?auto_394637 ) ) ( not ( = ?auto_394636 ?auto_394638 ) ) ( not ( = ?auto_394636 ?auto_394639 ) ) ( not ( = ?auto_394636 ?auto_394640 ) ) ( not ( = ?auto_394636 ?auto_394641 ) ) ( not ( = ?auto_394636 ?auto_394642 ) ) ( not ( = ?auto_394636 ?auto_394643 ) ) ( not ( = ?auto_394636 ?auto_394644 ) ) ( not ( = ?auto_394636 ?auto_394645 ) ) ( not ( = ?auto_394636 ?auto_394646 ) ) ( not ( = ?auto_394637 ?auto_394638 ) ) ( not ( = ?auto_394637 ?auto_394639 ) ) ( not ( = ?auto_394637 ?auto_394640 ) ) ( not ( = ?auto_394637 ?auto_394641 ) ) ( not ( = ?auto_394637 ?auto_394642 ) ) ( not ( = ?auto_394637 ?auto_394643 ) ) ( not ( = ?auto_394637 ?auto_394644 ) ) ( not ( = ?auto_394637 ?auto_394645 ) ) ( not ( = ?auto_394637 ?auto_394646 ) ) ( not ( = ?auto_394638 ?auto_394639 ) ) ( not ( = ?auto_394638 ?auto_394640 ) ) ( not ( = ?auto_394638 ?auto_394641 ) ) ( not ( = ?auto_394638 ?auto_394642 ) ) ( not ( = ?auto_394638 ?auto_394643 ) ) ( not ( = ?auto_394638 ?auto_394644 ) ) ( not ( = ?auto_394638 ?auto_394645 ) ) ( not ( = ?auto_394638 ?auto_394646 ) ) ( not ( = ?auto_394639 ?auto_394640 ) ) ( not ( = ?auto_394639 ?auto_394641 ) ) ( not ( = ?auto_394639 ?auto_394642 ) ) ( not ( = ?auto_394639 ?auto_394643 ) ) ( not ( = ?auto_394639 ?auto_394644 ) ) ( not ( = ?auto_394639 ?auto_394645 ) ) ( not ( = ?auto_394639 ?auto_394646 ) ) ( not ( = ?auto_394640 ?auto_394641 ) ) ( not ( = ?auto_394640 ?auto_394642 ) ) ( not ( = ?auto_394640 ?auto_394643 ) ) ( not ( = ?auto_394640 ?auto_394644 ) ) ( not ( = ?auto_394640 ?auto_394645 ) ) ( not ( = ?auto_394640 ?auto_394646 ) ) ( not ( = ?auto_394641 ?auto_394642 ) ) ( not ( = ?auto_394641 ?auto_394643 ) ) ( not ( = ?auto_394641 ?auto_394644 ) ) ( not ( = ?auto_394641 ?auto_394645 ) ) ( not ( = ?auto_394641 ?auto_394646 ) ) ( not ( = ?auto_394642 ?auto_394643 ) ) ( not ( = ?auto_394642 ?auto_394644 ) ) ( not ( = ?auto_394642 ?auto_394645 ) ) ( not ( = ?auto_394642 ?auto_394646 ) ) ( not ( = ?auto_394643 ?auto_394644 ) ) ( not ( = ?auto_394643 ?auto_394645 ) ) ( not ( = ?auto_394643 ?auto_394646 ) ) ( not ( = ?auto_394644 ?auto_394645 ) ) ( not ( = ?auto_394644 ?auto_394646 ) ) ( not ( = ?auto_394645 ?auto_394646 ) ) ( ON ?auto_394644 ?auto_394645 ) ( ON ?auto_394643 ?auto_394644 ) ( ON ?auto_394642 ?auto_394643 ) ( ON ?auto_394641 ?auto_394642 ) ( ON ?auto_394640 ?auto_394641 ) ( ON ?auto_394639 ?auto_394640 ) ( ON ?auto_394638 ?auto_394639 ) ( ON ?auto_394637 ?auto_394638 ) ( ON ?auto_394636 ?auto_394637 ) ( ON ?auto_394635 ?auto_394636 ) ( ON ?auto_394634 ?auto_394635 ) ( CLEAR ?auto_394634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_394634 )
      ( MAKE-12PILE ?auto_394634 ?auto_394635 ?auto_394636 ?auto_394637 ?auto_394638 ?auto_394639 ?auto_394640 ?auto_394641 ?auto_394642 ?auto_394643 ?auto_394644 ?auto_394645 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_394659 - BLOCK
      ?auto_394660 - BLOCK
      ?auto_394661 - BLOCK
      ?auto_394662 - BLOCK
      ?auto_394663 - BLOCK
      ?auto_394664 - BLOCK
      ?auto_394665 - BLOCK
      ?auto_394666 - BLOCK
      ?auto_394667 - BLOCK
      ?auto_394668 - BLOCK
      ?auto_394669 - BLOCK
      ?auto_394670 - BLOCK
    )
    :vars
    (
      ?auto_394671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394670 ?auto_394671 ) ( not ( = ?auto_394659 ?auto_394660 ) ) ( not ( = ?auto_394659 ?auto_394661 ) ) ( not ( = ?auto_394659 ?auto_394662 ) ) ( not ( = ?auto_394659 ?auto_394663 ) ) ( not ( = ?auto_394659 ?auto_394664 ) ) ( not ( = ?auto_394659 ?auto_394665 ) ) ( not ( = ?auto_394659 ?auto_394666 ) ) ( not ( = ?auto_394659 ?auto_394667 ) ) ( not ( = ?auto_394659 ?auto_394668 ) ) ( not ( = ?auto_394659 ?auto_394669 ) ) ( not ( = ?auto_394659 ?auto_394670 ) ) ( not ( = ?auto_394659 ?auto_394671 ) ) ( not ( = ?auto_394660 ?auto_394661 ) ) ( not ( = ?auto_394660 ?auto_394662 ) ) ( not ( = ?auto_394660 ?auto_394663 ) ) ( not ( = ?auto_394660 ?auto_394664 ) ) ( not ( = ?auto_394660 ?auto_394665 ) ) ( not ( = ?auto_394660 ?auto_394666 ) ) ( not ( = ?auto_394660 ?auto_394667 ) ) ( not ( = ?auto_394660 ?auto_394668 ) ) ( not ( = ?auto_394660 ?auto_394669 ) ) ( not ( = ?auto_394660 ?auto_394670 ) ) ( not ( = ?auto_394660 ?auto_394671 ) ) ( not ( = ?auto_394661 ?auto_394662 ) ) ( not ( = ?auto_394661 ?auto_394663 ) ) ( not ( = ?auto_394661 ?auto_394664 ) ) ( not ( = ?auto_394661 ?auto_394665 ) ) ( not ( = ?auto_394661 ?auto_394666 ) ) ( not ( = ?auto_394661 ?auto_394667 ) ) ( not ( = ?auto_394661 ?auto_394668 ) ) ( not ( = ?auto_394661 ?auto_394669 ) ) ( not ( = ?auto_394661 ?auto_394670 ) ) ( not ( = ?auto_394661 ?auto_394671 ) ) ( not ( = ?auto_394662 ?auto_394663 ) ) ( not ( = ?auto_394662 ?auto_394664 ) ) ( not ( = ?auto_394662 ?auto_394665 ) ) ( not ( = ?auto_394662 ?auto_394666 ) ) ( not ( = ?auto_394662 ?auto_394667 ) ) ( not ( = ?auto_394662 ?auto_394668 ) ) ( not ( = ?auto_394662 ?auto_394669 ) ) ( not ( = ?auto_394662 ?auto_394670 ) ) ( not ( = ?auto_394662 ?auto_394671 ) ) ( not ( = ?auto_394663 ?auto_394664 ) ) ( not ( = ?auto_394663 ?auto_394665 ) ) ( not ( = ?auto_394663 ?auto_394666 ) ) ( not ( = ?auto_394663 ?auto_394667 ) ) ( not ( = ?auto_394663 ?auto_394668 ) ) ( not ( = ?auto_394663 ?auto_394669 ) ) ( not ( = ?auto_394663 ?auto_394670 ) ) ( not ( = ?auto_394663 ?auto_394671 ) ) ( not ( = ?auto_394664 ?auto_394665 ) ) ( not ( = ?auto_394664 ?auto_394666 ) ) ( not ( = ?auto_394664 ?auto_394667 ) ) ( not ( = ?auto_394664 ?auto_394668 ) ) ( not ( = ?auto_394664 ?auto_394669 ) ) ( not ( = ?auto_394664 ?auto_394670 ) ) ( not ( = ?auto_394664 ?auto_394671 ) ) ( not ( = ?auto_394665 ?auto_394666 ) ) ( not ( = ?auto_394665 ?auto_394667 ) ) ( not ( = ?auto_394665 ?auto_394668 ) ) ( not ( = ?auto_394665 ?auto_394669 ) ) ( not ( = ?auto_394665 ?auto_394670 ) ) ( not ( = ?auto_394665 ?auto_394671 ) ) ( not ( = ?auto_394666 ?auto_394667 ) ) ( not ( = ?auto_394666 ?auto_394668 ) ) ( not ( = ?auto_394666 ?auto_394669 ) ) ( not ( = ?auto_394666 ?auto_394670 ) ) ( not ( = ?auto_394666 ?auto_394671 ) ) ( not ( = ?auto_394667 ?auto_394668 ) ) ( not ( = ?auto_394667 ?auto_394669 ) ) ( not ( = ?auto_394667 ?auto_394670 ) ) ( not ( = ?auto_394667 ?auto_394671 ) ) ( not ( = ?auto_394668 ?auto_394669 ) ) ( not ( = ?auto_394668 ?auto_394670 ) ) ( not ( = ?auto_394668 ?auto_394671 ) ) ( not ( = ?auto_394669 ?auto_394670 ) ) ( not ( = ?auto_394669 ?auto_394671 ) ) ( not ( = ?auto_394670 ?auto_394671 ) ) ( ON ?auto_394669 ?auto_394670 ) ( ON ?auto_394668 ?auto_394669 ) ( ON ?auto_394667 ?auto_394668 ) ( ON ?auto_394666 ?auto_394667 ) ( ON ?auto_394665 ?auto_394666 ) ( ON ?auto_394664 ?auto_394665 ) ( ON ?auto_394663 ?auto_394664 ) ( ON ?auto_394662 ?auto_394663 ) ( ON ?auto_394661 ?auto_394662 ) ( ON ?auto_394660 ?auto_394661 ) ( ON ?auto_394659 ?auto_394660 ) ( CLEAR ?auto_394659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_394659 )
      ( MAKE-12PILE ?auto_394659 ?auto_394660 ?auto_394661 ?auto_394662 ?auto_394663 ?auto_394664 ?auto_394665 ?auto_394666 ?auto_394667 ?auto_394668 ?auto_394669 ?auto_394670 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394685 - BLOCK
      ?auto_394686 - BLOCK
      ?auto_394687 - BLOCK
      ?auto_394688 - BLOCK
      ?auto_394689 - BLOCK
      ?auto_394690 - BLOCK
      ?auto_394691 - BLOCK
      ?auto_394692 - BLOCK
      ?auto_394693 - BLOCK
      ?auto_394694 - BLOCK
      ?auto_394695 - BLOCK
      ?auto_394696 - BLOCK
      ?auto_394697 - BLOCK
    )
    :vars
    (
      ?auto_394698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_394696 ) ( ON ?auto_394697 ?auto_394698 ) ( CLEAR ?auto_394697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_394685 ) ( ON ?auto_394686 ?auto_394685 ) ( ON ?auto_394687 ?auto_394686 ) ( ON ?auto_394688 ?auto_394687 ) ( ON ?auto_394689 ?auto_394688 ) ( ON ?auto_394690 ?auto_394689 ) ( ON ?auto_394691 ?auto_394690 ) ( ON ?auto_394692 ?auto_394691 ) ( ON ?auto_394693 ?auto_394692 ) ( ON ?auto_394694 ?auto_394693 ) ( ON ?auto_394695 ?auto_394694 ) ( ON ?auto_394696 ?auto_394695 ) ( not ( = ?auto_394685 ?auto_394686 ) ) ( not ( = ?auto_394685 ?auto_394687 ) ) ( not ( = ?auto_394685 ?auto_394688 ) ) ( not ( = ?auto_394685 ?auto_394689 ) ) ( not ( = ?auto_394685 ?auto_394690 ) ) ( not ( = ?auto_394685 ?auto_394691 ) ) ( not ( = ?auto_394685 ?auto_394692 ) ) ( not ( = ?auto_394685 ?auto_394693 ) ) ( not ( = ?auto_394685 ?auto_394694 ) ) ( not ( = ?auto_394685 ?auto_394695 ) ) ( not ( = ?auto_394685 ?auto_394696 ) ) ( not ( = ?auto_394685 ?auto_394697 ) ) ( not ( = ?auto_394685 ?auto_394698 ) ) ( not ( = ?auto_394686 ?auto_394687 ) ) ( not ( = ?auto_394686 ?auto_394688 ) ) ( not ( = ?auto_394686 ?auto_394689 ) ) ( not ( = ?auto_394686 ?auto_394690 ) ) ( not ( = ?auto_394686 ?auto_394691 ) ) ( not ( = ?auto_394686 ?auto_394692 ) ) ( not ( = ?auto_394686 ?auto_394693 ) ) ( not ( = ?auto_394686 ?auto_394694 ) ) ( not ( = ?auto_394686 ?auto_394695 ) ) ( not ( = ?auto_394686 ?auto_394696 ) ) ( not ( = ?auto_394686 ?auto_394697 ) ) ( not ( = ?auto_394686 ?auto_394698 ) ) ( not ( = ?auto_394687 ?auto_394688 ) ) ( not ( = ?auto_394687 ?auto_394689 ) ) ( not ( = ?auto_394687 ?auto_394690 ) ) ( not ( = ?auto_394687 ?auto_394691 ) ) ( not ( = ?auto_394687 ?auto_394692 ) ) ( not ( = ?auto_394687 ?auto_394693 ) ) ( not ( = ?auto_394687 ?auto_394694 ) ) ( not ( = ?auto_394687 ?auto_394695 ) ) ( not ( = ?auto_394687 ?auto_394696 ) ) ( not ( = ?auto_394687 ?auto_394697 ) ) ( not ( = ?auto_394687 ?auto_394698 ) ) ( not ( = ?auto_394688 ?auto_394689 ) ) ( not ( = ?auto_394688 ?auto_394690 ) ) ( not ( = ?auto_394688 ?auto_394691 ) ) ( not ( = ?auto_394688 ?auto_394692 ) ) ( not ( = ?auto_394688 ?auto_394693 ) ) ( not ( = ?auto_394688 ?auto_394694 ) ) ( not ( = ?auto_394688 ?auto_394695 ) ) ( not ( = ?auto_394688 ?auto_394696 ) ) ( not ( = ?auto_394688 ?auto_394697 ) ) ( not ( = ?auto_394688 ?auto_394698 ) ) ( not ( = ?auto_394689 ?auto_394690 ) ) ( not ( = ?auto_394689 ?auto_394691 ) ) ( not ( = ?auto_394689 ?auto_394692 ) ) ( not ( = ?auto_394689 ?auto_394693 ) ) ( not ( = ?auto_394689 ?auto_394694 ) ) ( not ( = ?auto_394689 ?auto_394695 ) ) ( not ( = ?auto_394689 ?auto_394696 ) ) ( not ( = ?auto_394689 ?auto_394697 ) ) ( not ( = ?auto_394689 ?auto_394698 ) ) ( not ( = ?auto_394690 ?auto_394691 ) ) ( not ( = ?auto_394690 ?auto_394692 ) ) ( not ( = ?auto_394690 ?auto_394693 ) ) ( not ( = ?auto_394690 ?auto_394694 ) ) ( not ( = ?auto_394690 ?auto_394695 ) ) ( not ( = ?auto_394690 ?auto_394696 ) ) ( not ( = ?auto_394690 ?auto_394697 ) ) ( not ( = ?auto_394690 ?auto_394698 ) ) ( not ( = ?auto_394691 ?auto_394692 ) ) ( not ( = ?auto_394691 ?auto_394693 ) ) ( not ( = ?auto_394691 ?auto_394694 ) ) ( not ( = ?auto_394691 ?auto_394695 ) ) ( not ( = ?auto_394691 ?auto_394696 ) ) ( not ( = ?auto_394691 ?auto_394697 ) ) ( not ( = ?auto_394691 ?auto_394698 ) ) ( not ( = ?auto_394692 ?auto_394693 ) ) ( not ( = ?auto_394692 ?auto_394694 ) ) ( not ( = ?auto_394692 ?auto_394695 ) ) ( not ( = ?auto_394692 ?auto_394696 ) ) ( not ( = ?auto_394692 ?auto_394697 ) ) ( not ( = ?auto_394692 ?auto_394698 ) ) ( not ( = ?auto_394693 ?auto_394694 ) ) ( not ( = ?auto_394693 ?auto_394695 ) ) ( not ( = ?auto_394693 ?auto_394696 ) ) ( not ( = ?auto_394693 ?auto_394697 ) ) ( not ( = ?auto_394693 ?auto_394698 ) ) ( not ( = ?auto_394694 ?auto_394695 ) ) ( not ( = ?auto_394694 ?auto_394696 ) ) ( not ( = ?auto_394694 ?auto_394697 ) ) ( not ( = ?auto_394694 ?auto_394698 ) ) ( not ( = ?auto_394695 ?auto_394696 ) ) ( not ( = ?auto_394695 ?auto_394697 ) ) ( not ( = ?auto_394695 ?auto_394698 ) ) ( not ( = ?auto_394696 ?auto_394697 ) ) ( not ( = ?auto_394696 ?auto_394698 ) ) ( not ( = ?auto_394697 ?auto_394698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_394697 ?auto_394698 )
      ( !STACK ?auto_394697 ?auto_394696 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394712 - BLOCK
      ?auto_394713 - BLOCK
      ?auto_394714 - BLOCK
      ?auto_394715 - BLOCK
      ?auto_394716 - BLOCK
      ?auto_394717 - BLOCK
      ?auto_394718 - BLOCK
      ?auto_394719 - BLOCK
      ?auto_394720 - BLOCK
      ?auto_394721 - BLOCK
      ?auto_394722 - BLOCK
      ?auto_394723 - BLOCK
      ?auto_394724 - BLOCK
    )
    :vars
    (
      ?auto_394725 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_394723 ) ( ON ?auto_394724 ?auto_394725 ) ( CLEAR ?auto_394724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_394712 ) ( ON ?auto_394713 ?auto_394712 ) ( ON ?auto_394714 ?auto_394713 ) ( ON ?auto_394715 ?auto_394714 ) ( ON ?auto_394716 ?auto_394715 ) ( ON ?auto_394717 ?auto_394716 ) ( ON ?auto_394718 ?auto_394717 ) ( ON ?auto_394719 ?auto_394718 ) ( ON ?auto_394720 ?auto_394719 ) ( ON ?auto_394721 ?auto_394720 ) ( ON ?auto_394722 ?auto_394721 ) ( ON ?auto_394723 ?auto_394722 ) ( not ( = ?auto_394712 ?auto_394713 ) ) ( not ( = ?auto_394712 ?auto_394714 ) ) ( not ( = ?auto_394712 ?auto_394715 ) ) ( not ( = ?auto_394712 ?auto_394716 ) ) ( not ( = ?auto_394712 ?auto_394717 ) ) ( not ( = ?auto_394712 ?auto_394718 ) ) ( not ( = ?auto_394712 ?auto_394719 ) ) ( not ( = ?auto_394712 ?auto_394720 ) ) ( not ( = ?auto_394712 ?auto_394721 ) ) ( not ( = ?auto_394712 ?auto_394722 ) ) ( not ( = ?auto_394712 ?auto_394723 ) ) ( not ( = ?auto_394712 ?auto_394724 ) ) ( not ( = ?auto_394712 ?auto_394725 ) ) ( not ( = ?auto_394713 ?auto_394714 ) ) ( not ( = ?auto_394713 ?auto_394715 ) ) ( not ( = ?auto_394713 ?auto_394716 ) ) ( not ( = ?auto_394713 ?auto_394717 ) ) ( not ( = ?auto_394713 ?auto_394718 ) ) ( not ( = ?auto_394713 ?auto_394719 ) ) ( not ( = ?auto_394713 ?auto_394720 ) ) ( not ( = ?auto_394713 ?auto_394721 ) ) ( not ( = ?auto_394713 ?auto_394722 ) ) ( not ( = ?auto_394713 ?auto_394723 ) ) ( not ( = ?auto_394713 ?auto_394724 ) ) ( not ( = ?auto_394713 ?auto_394725 ) ) ( not ( = ?auto_394714 ?auto_394715 ) ) ( not ( = ?auto_394714 ?auto_394716 ) ) ( not ( = ?auto_394714 ?auto_394717 ) ) ( not ( = ?auto_394714 ?auto_394718 ) ) ( not ( = ?auto_394714 ?auto_394719 ) ) ( not ( = ?auto_394714 ?auto_394720 ) ) ( not ( = ?auto_394714 ?auto_394721 ) ) ( not ( = ?auto_394714 ?auto_394722 ) ) ( not ( = ?auto_394714 ?auto_394723 ) ) ( not ( = ?auto_394714 ?auto_394724 ) ) ( not ( = ?auto_394714 ?auto_394725 ) ) ( not ( = ?auto_394715 ?auto_394716 ) ) ( not ( = ?auto_394715 ?auto_394717 ) ) ( not ( = ?auto_394715 ?auto_394718 ) ) ( not ( = ?auto_394715 ?auto_394719 ) ) ( not ( = ?auto_394715 ?auto_394720 ) ) ( not ( = ?auto_394715 ?auto_394721 ) ) ( not ( = ?auto_394715 ?auto_394722 ) ) ( not ( = ?auto_394715 ?auto_394723 ) ) ( not ( = ?auto_394715 ?auto_394724 ) ) ( not ( = ?auto_394715 ?auto_394725 ) ) ( not ( = ?auto_394716 ?auto_394717 ) ) ( not ( = ?auto_394716 ?auto_394718 ) ) ( not ( = ?auto_394716 ?auto_394719 ) ) ( not ( = ?auto_394716 ?auto_394720 ) ) ( not ( = ?auto_394716 ?auto_394721 ) ) ( not ( = ?auto_394716 ?auto_394722 ) ) ( not ( = ?auto_394716 ?auto_394723 ) ) ( not ( = ?auto_394716 ?auto_394724 ) ) ( not ( = ?auto_394716 ?auto_394725 ) ) ( not ( = ?auto_394717 ?auto_394718 ) ) ( not ( = ?auto_394717 ?auto_394719 ) ) ( not ( = ?auto_394717 ?auto_394720 ) ) ( not ( = ?auto_394717 ?auto_394721 ) ) ( not ( = ?auto_394717 ?auto_394722 ) ) ( not ( = ?auto_394717 ?auto_394723 ) ) ( not ( = ?auto_394717 ?auto_394724 ) ) ( not ( = ?auto_394717 ?auto_394725 ) ) ( not ( = ?auto_394718 ?auto_394719 ) ) ( not ( = ?auto_394718 ?auto_394720 ) ) ( not ( = ?auto_394718 ?auto_394721 ) ) ( not ( = ?auto_394718 ?auto_394722 ) ) ( not ( = ?auto_394718 ?auto_394723 ) ) ( not ( = ?auto_394718 ?auto_394724 ) ) ( not ( = ?auto_394718 ?auto_394725 ) ) ( not ( = ?auto_394719 ?auto_394720 ) ) ( not ( = ?auto_394719 ?auto_394721 ) ) ( not ( = ?auto_394719 ?auto_394722 ) ) ( not ( = ?auto_394719 ?auto_394723 ) ) ( not ( = ?auto_394719 ?auto_394724 ) ) ( not ( = ?auto_394719 ?auto_394725 ) ) ( not ( = ?auto_394720 ?auto_394721 ) ) ( not ( = ?auto_394720 ?auto_394722 ) ) ( not ( = ?auto_394720 ?auto_394723 ) ) ( not ( = ?auto_394720 ?auto_394724 ) ) ( not ( = ?auto_394720 ?auto_394725 ) ) ( not ( = ?auto_394721 ?auto_394722 ) ) ( not ( = ?auto_394721 ?auto_394723 ) ) ( not ( = ?auto_394721 ?auto_394724 ) ) ( not ( = ?auto_394721 ?auto_394725 ) ) ( not ( = ?auto_394722 ?auto_394723 ) ) ( not ( = ?auto_394722 ?auto_394724 ) ) ( not ( = ?auto_394722 ?auto_394725 ) ) ( not ( = ?auto_394723 ?auto_394724 ) ) ( not ( = ?auto_394723 ?auto_394725 ) ) ( not ( = ?auto_394724 ?auto_394725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_394724 ?auto_394725 )
      ( !STACK ?auto_394724 ?auto_394723 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394739 - BLOCK
      ?auto_394740 - BLOCK
      ?auto_394741 - BLOCK
      ?auto_394742 - BLOCK
      ?auto_394743 - BLOCK
      ?auto_394744 - BLOCK
      ?auto_394745 - BLOCK
      ?auto_394746 - BLOCK
      ?auto_394747 - BLOCK
      ?auto_394748 - BLOCK
      ?auto_394749 - BLOCK
      ?auto_394750 - BLOCK
      ?auto_394751 - BLOCK
    )
    :vars
    (
      ?auto_394752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394751 ?auto_394752 ) ( ON-TABLE ?auto_394739 ) ( ON ?auto_394740 ?auto_394739 ) ( ON ?auto_394741 ?auto_394740 ) ( ON ?auto_394742 ?auto_394741 ) ( ON ?auto_394743 ?auto_394742 ) ( ON ?auto_394744 ?auto_394743 ) ( ON ?auto_394745 ?auto_394744 ) ( ON ?auto_394746 ?auto_394745 ) ( ON ?auto_394747 ?auto_394746 ) ( ON ?auto_394748 ?auto_394747 ) ( ON ?auto_394749 ?auto_394748 ) ( not ( = ?auto_394739 ?auto_394740 ) ) ( not ( = ?auto_394739 ?auto_394741 ) ) ( not ( = ?auto_394739 ?auto_394742 ) ) ( not ( = ?auto_394739 ?auto_394743 ) ) ( not ( = ?auto_394739 ?auto_394744 ) ) ( not ( = ?auto_394739 ?auto_394745 ) ) ( not ( = ?auto_394739 ?auto_394746 ) ) ( not ( = ?auto_394739 ?auto_394747 ) ) ( not ( = ?auto_394739 ?auto_394748 ) ) ( not ( = ?auto_394739 ?auto_394749 ) ) ( not ( = ?auto_394739 ?auto_394750 ) ) ( not ( = ?auto_394739 ?auto_394751 ) ) ( not ( = ?auto_394739 ?auto_394752 ) ) ( not ( = ?auto_394740 ?auto_394741 ) ) ( not ( = ?auto_394740 ?auto_394742 ) ) ( not ( = ?auto_394740 ?auto_394743 ) ) ( not ( = ?auto_394740 ?auto_394744 ) ) ( not ( = ?auto_394740 ?auto_394745 ) ) ( not ( = ?auto_394740 ?auto_394746 ) ) ( not ( = ?auto_394740 ?auto_394747 ) ) ( not ( = ?auto_394740 ?auto_394748 ) ) ( not ( = ?auto_394740 ?auto_394749 ) ) ( not ( = ?auto_394740 ?auto_394750 ) ) ( not ( = ?auto_394740 ?auto_394751 ) ) ( not ( = ?auto_394740 ?auto_394752 ) ) ( not ( = ?auto_394741 ?auto_394742 ) ) ( not ( = ?auto_394741 ?auto_394743 ) ) ( not ( = ?auto_394741 ?auto_394744 ) ) ( not ( = ?auto_394741 ?auto_394745 ) ) ( not ( = ?auto_394741 ?auto_394746 ) ) ( not ( = ?auto_394741 ?auto_394747 ) ) ( not ( = ?auto_394741 ?auto_394748 ) ) ( not ( = ?auto_394741 ?auto_394749 ) ) ( not ( = ?auto_394741 ?auto_394750 ) ) ( not ( = ?auto_394741 ?auto_394751 ) ) ( not ( = ?auto_394741 ?auto_394752 ) ) ( not ( = ?auto_394742 ?auto_394743 ) ) ( not ( = ?auto_394742 ?auto_394744 ) ) ( not ( = ?auto_394742 ?auto_394745 ) ) ( not ( = ?auto_394742 ?auto_394746 ) ) ( not ( = ?auto_394742 ?auto_394747 ) ) ( not ( = ?auto_394742 ?auto_394748 ) ) ( not ( = ?auto_394742 ?auto_394749 ) ) ( not ( = ?auto_394742 ?auto_394750 ) ) ( not ( = ?auto_394742 ?auto_394751 ) ) ( not ( = ?auto_394742 ?auto_394752 ) ) ( not ( = ?auto_394743 ?auto_394744 ) ) ( not ( = ?auto_394743 ?auto_394745 ) ) ( not ( = ?auto_394743 ?auto_394746 ) ) ( not ( = ?auto_394743 ?auto_394747 ) ) ( not ( = ?auto_394743 ?auto_394748 ) ) ( not ( = ?auto_394743 ?auto_394749 ) ) ( not ( = ?auto_394743 ?auto_394750 ) ) ( not ( = ?auto_394743 ?auto_394751 ) ) ( not ( = ?auto_394743 ?auto_394752 ) ) ( not ( = ?auto_394744 ?auto_394745 ) ) ( not ( = ?auto_394744 ?auto_394746 ) ) ( not ( = ?auto_394744 ?auto_394747 ) ) ( not ( = ?auto_394744 ?auto_394748 ) ) ( not ( = ?auto_394744 ?auto_394749 ) ) ( not ( = ?auto_394744 ?auto_394750 ) ) ( not ( = ?auto_394744 ?auto_394751 ) ) ( not ( = ?auto_394744 ?auto_394752 ) ) ( not ( = ?auto_394745 ?auto_394746 ) ) ( not ( = ?auto_394745 ?auto_394747 ) ) ( not ( = ?auto_394745 ?auto_394748 ) ) ( not ( = ?auto_394745 ?auto_394749 ) ) ( not ( = ?auto_394745 ?auto_394750 ) ) ( not ( = ?auto_394745 ?auto_394751 ) ) ( not ( = ?auto_394745 ?auto_394752 ) ) ( not ( = ?auto_394746 ?auto_394747 ) ) ( not ( = ?auto_394746 ?auto_394748 ) ) ( not ( = ?auto_394746 ?auto_394749 ) ) ( not ( = ?auto_394746 ?auto_394750 ) ) ( not ( = ?auto_394746 ?auto_394751 ) ) ( not ( = ?auto_394746 ?auto_394752 ) ) ( not ( = ?auto_394747 ?auto_394748 ) ) ( not ( = ?auto_394747 ?auto_394749 ) ) ( not ( = ?auto_394747 ?auto_394750 ) ) ( not ( = ?auto_394747 ?auto_394751 ) ) ( not ( = ?auto_394747 ?auto_394752 ) ) ( not ( = ?auto_394748 ?auto_394749 ) ) ( not ( = ?auto_394748 ?auto_394750 ) ) ( not ( = ?auto_394748 ?auto_394751 ) ) ( not ( = ?auto_394748 ?auto_394752 ) ) ( not ( = ?auto_394749 ?auto_394750 ) ) ( not ( = ?auto_394749 ?auto_394751 ) ) ( not ( = ?auto_394749 ?auto_394752 ) ) ( not ( = ?auto_394750 ?auto_394751 ) ) ( not ( = ?auto_394750 ?auto_394752 ) ) ( not ( = ?auto_394751 ?auto_394752 ) ) ( CLEAR ?auto_394749 ) ( ON ?auto_394750 ?auto_394751 ) ( CLEAR ?auto_394750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_394739 ?auto_394740 ?auto_394741 ?auto_394742 ?auto_394743 ?auto_394744 ?auto_394745 ?auto_394746 ?auto_394747 ?auto_394748 ?auto_394749 ?auto_394750 )
      ( MAKE-13PILE ?auto_394739 ?auto_394740 ?auto_394741 ?auto_394742 ?auto_394743 ?auto_394744 ?auto_394745 ?auto_394746 ?auto_394747 ?auto_394748 ?auto_394749 ?auto_394750 ?auto_394751 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394766 - BLOCK
      ?auto_394767 - BLOCK
      ?auto_394768 - BLOCK
      ?auto_394769 - BLOCK
      ?auto_394770 - BLOCK
      ?auto_394771 - BLOCK
      ?auto_394772 - BLOCK
      ?auto_394773 - BLOCK
      ?auto_394774 - BLOCK
      ?auto_394775 - BLOCK
      ?auto_394776 - BLOCK
      ?auto_394777 - BLOCK
      ?auto_394778 - BLOCK
    )
    :vars
    (
      ?auto_394779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394778 ?auto_394779 ) ( ON-TABLE ?auto_394766 ) ( ON ?auto_394767 ?auto_394766 ) ( ON ?auto_394768 ?auto_394767 ) ( ON ?auto_394769 ?auto_394768 ) ( ON ?auto_394770 ?auto_394769 ) ( ON ?auto_394771 ?auto_394770 ) ( ON ?auto_394772 ?auto_394771 ) ( ON ?auto_394773 ?auto_394772 ) ( ON ?auto_394774 ?auto_394773 ) ( ON ?auto_394775 ?auto_394774 ) ( ON ?auto_394776 ?auto_394775 ) ( not ( = ?auto_394766 ?auto_394767 ) ) ( not ( = ?auto_394766 ?auto_394768 ) ) ( not ( = ?auto_394766 ?auto_394769 ) ) ( not ( = ?auto_394766 ?auto_394770 ) ) ( not ( = ?auto_394766 ?auto_394771 ) ) ( not ( = ?auto_394766 ?auto_394772 ) ) ( not ( = ?auto_394766 ?auto_394773 ) ) ( not ( = ?auto_394766 ?auto_394774 ) ) ( not ( = ?auto_394766 ?auto_394775 ) ) ( not ( = ?auto_394766 ?auto_394776 ) ) ( not ( = ?auto_394766 ?auto_394777 ) ) ( not ( = ?auto_394766 ?auto_394778 ) ) ( not ( = ?auto_394766 ?auto_394779 ) ) ( not ( = ?auto_394767 ?auto_394768 ) ) ( not ( = ?auto_394767 ?auto_394769 ) ) ( not ( = ?auto_394767 ?auto_394770 ) ) ( not ( = ?auto_394767 ?auto_394771 ) ) ( not ( = ?auto_394767 ?auto_394772 ) ) ( not ( = ?auto_394767 ?auto_394773 ) ) ( not ( = ?auto_394767 ?auto_394774 ) ) ( not ( = ?auto_394767 ?auto_394775 ) ) ( not ( = ?auto_394767 ?auto_394776 ) ) ( not ( = ?auto_394767 ?auto_394777 ) ) ( not ( = ?auto_394767 ?auto_394778 ) ) ( not ( = ?auto_394767 ?auto_394779 ) ) ( not ( = ?auto_394768 ?auto_394769 ) ) ( not ( = ?auto_394768 ?auto_394770 ) ) ( not ( = ?auto_394768 ?auto_394771 ) ) ( not ( = ?auto_394768 ?auto_394772 ) ) ( not ( = ?auto_394768 ?auto_394773 ) ) ( not ( = ?auto_394768 ?auto_394774 ) ) ( not ( = ?auto_394768 ?auto_394775 ) ) ( not ( = ?auto_394768 ?auto_394776 ) ) ( not ( = ?auto_394768 ?auto_394777 ) ) ( not ( = ?auto_394768 ?auto_394778 ) ) ( not ( = ?auto_394768 ?auto_394779 ) ) ( not ( = ?auto_394769 ?auto_394770 ) ) ( not ( = ?auto_394769 ?auto_394771 ) ) ( not ( = ?auto_394769 ?auto_394772 ) ) ( not ( = ?auto_394769 ?auto_394773 ) ) ( not ( = ?auto_394769 ?auto_394774 ) ) ( not ( = ?auto_394769 ?auto_394775 ) ) ( not ( = ?auto_394769 ?auto_394776 ) ) ( not ( = ?auto_394769 ?auto_394777 ) ) ( not ( = ?auto_394769 ?auto_394778 ) ) ( not ( = ?auto_394769 ?auto_394779 ) ) ( not ( = ?auto_394770 ?auto_394771 ) ) ( not ( = ?auto_394770 ?auto_394772 ) ) ( not ( = ?auto_394770 ?auto_394773 ) ) ( not ( = ?auto_394770 ?auto_394774 ) ) ( not ( = ?auto_394770 ?auto_394775 ) ) ( not ( = ?auto_394770 ?auto_394776 ) ) ( not ( = ?auto_394770 ?auto_394777 ) ) ( not ( = ?auto_394770 ?auto_394778 ) ) ( not ( = ?auto_394770 ?auto_394779 ) ) ( not ( = ?auto_394771 ?auto_394772 ) ) ( not ( = ?auto_394771 ?auto_394773 ) ) ( not ( = ?auto_394771 ?auto_394774 ) ) ( not ( = ?auto_394771 ?auto_394775 ) ) ( not ( = ?auto_394771 ?auto_394776 ) ) ( not ( = ?auto_394771 ?auto_394777 ) ) ( not ( = ?auto_394771 ?auto_394778 ) ) ( not ( = ?auto_394771 ?auto_394779 ) ) ( not ( = ?auto_394772 ?auto_394773 ) ) ( not ( = ?auto_394772 ?auto_394774 ) ) ( not ( = ?auto_394772 ?auto_394775 ) ) ( not ( = ?auto_394772 ?auto_394776 ) ) ( not ( = ?auto_394772 ?auto_394777 ) ) ( not ( = ?auto_394772 ?auto_394778 ) ) ( not ( = ?auto_394772 ?auto_394779 ) ) ( not ( = ?auto_394773 ?auto_394774 ) ) ( not ( = ?auto_394773 ?auto_394775 ) ) ( not ( = ?auto_394773 ?auto_394776 ) ) ( not ( = ?auto_394773 ?auto_394777 ) ) ( not ( = ?auto_394773 ?auto_394778 ) ) ( not ( = ?auto_394773 ?auto_394779 ) ) ( not ( = ?auto_394774 ?auto_394775 ) ) ( not ( = ?auto_394774 ?auto_394776 ) ) ( not ( = ?auto_394774 ?auto_394777 ) ) ( not ( = ?auto_394774 ?auto_394778 ) ) ( not ( = ?auto_394774 ?auto_394779 ) ) ( not ( = ?auto_394775 ?auto_394776 ) ) ( not ( = ?auto_394775 ?auto_394777 ) ) ( not ( = ?auto_394775 ?auto_394778 ) ) ( not ( = ?auto_394775 ?auto_394779 ) ) ( not ( = ?auto_394776 ?auto_394777 ) ) ( not ( = ?auto_394776 ?auto_394778 ) ) ( not ( = ?auto_394776 ?auto_394779 ) ) ( not ( = ?auto_394777 ?auto_394778 ) ) ( not ( = ?auto_394777 ?auto_394779 ) ) ( not ( = ?auto_394778 ?auto_394779 ) ) ( CLEAR ?auto_394776 ) ( ON ?auto_394777 ?auto_394778 ) ( CLEAR ?auto_394777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_394766 ?auto_394767 ?auto_394768 ?auto_394769 ?auto_394770 ?auto_394771 ?auto_394772 ?auto_394773 ?auto_394774 ?auto_394775 ?auto_394776 ?auto_394777 )
      ( MAKE-13PILE ?auto_394766 ?auto_394767 ?auto_394768 ?auto_394769 ?auto_394770 ?auto_394771 ?auto_394772 ?auto_394773 ?auto_394774 ?auto_394775 ?auto_394776 ?auto_394777 ?auto_394778 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394793 - BLOCK
      ?auto_394794 - BLOCK
      ?auto_394795 - BLOCK
      ?auto_394796 - BLOCK
      ?auto_394797 - BLOCK
      ?auto_394798 - BLOCK
      ?auto_394799 - BLOCK
      ?auto_394800 - BLOCK
      ?auto_394801 - BLOCK
      ?auto_394802 - BLOCK
      ?auto_394803 - BLOCK
      ?auto_394804 - BLOCK
      ?auto_394805 - BLOCK
    )
    :vars
    (
      ?auto_394806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394805 ?auto_394806 ) ( ON-TABLE ?auto_394793 ) ( ON ?auto_394794 ?auto_394793 ) ( ON ?auto_394795 ?auto_394794 ) ( ON ?auto_394796 ?auto_394795 ) ( ON ?auto_394797 ?auto_394796 ) ( ON ?auto_394798 ?auto_394797 ) ( ON ?auto_394799 ?auto_394798 ) ( ON ?auto_394800 ?auto_394799 ) ( ON ?auto_394801 ?auto_394800 ) ( ON ?auto_394802 ?auto_394801 ) ( not ( = ?auto_394793 ?auto_394794 ) ) ( not ( = ?auto_394793 ?auto_394795 ) ) ( not ( = ?auto_394793 ?auto_394796 ) ) ( not ( = ?auto_394793 ?auto_394797 ) ) ( not ( = ?auto_394793 ?auto_394798 ) ) ( not ( = ?auto_394793 ?auto_394799 ) ) ( not ( = ?auto_394793 ?auto_394800 ) ) ( not ( = ?auto_394793 ?auto_394801 ) ) ( not ( = ?auto_394793 ?auto_394802 ) ) ( not ( = ?auto_394793 ?auto_394803 ) ) ( not ( = ?auto_394793 ?auto_394804 ) ) ( not ( = ?auto_394793 ?auto_394805 ) ) ( not ( = ?auto_394793 ?auto_394806 ) ) ( not ( = ?auto_394794 ?auto_394795 ) ) ( not ( = ?auto_394794 ?auto_394796 ) ) ( not ( = ?auto_394794 ?auto_394797 ) ) ( not ( = ?auto_394794 ?auto_394798 ) ) ( not ( = ?auto_394794 ?auto_394799 ) ) ( not ( = ?auto_394794 ?auto_394800 ) ) ( not ( = ?auto_394794 ?auto_394801 ) ) ( not ( = ?auto_394794 ?auto_394802 ) ) ( not ( = ?auto_394794 ?auto_394803 ) ) ( not ( = ?auto_394794 ?auto_394804 ) ) ( not ( = ?auto_394794 ?auto_394805 ) ) ( not ( = ?auto_394794 ?auto_394806 ) ) ( not ( = ?auto_394795 ?auto_394796 ) ) ( not ( = ?auto_394795 ?auto_394797 ) ) ( not ( = ?auto_394795 ?auto_394798 ) ) ( not ( = ?auto_394795 ?auto_394799 ) ) ( not ( = ?auto_394795 ?auto_394800 ) ) ( not ( = ?auto_394795 ?auto_394801 ) ) ( not ( = ?auto_394795 ?auto_394802 ) ) ( not ( = ?auto_394795 ?auto_394803 ) ) ( not ( = ?auto_394795 ?auto_394804 ) ) ( not ( = ?auto_394795 ?auto_394805 ) ) ( not ( = ?auto_394795 ?auto_394806 ) ) ( not ( = ?auto_394796 ?auto_394797 ) ) ( not ( = ?auto_394796 ?auto_394798 ) ) ( not ( = ?auto_394796 ?auto_394799 ) ) ( not ( = ?auto_394796 ?auto_394800 ) ) ( not ( = ?auto_394796 ?auto_394801 ) ) ( not ( = ?auto_394796 ?auto_394802 ) ) ( not ( = ?auto_394796 ?auto_394803 ) ) ( not ( = ?auto_394796 ?auto_394804 ) ) ( not ( = ?auto_394796 ?auto_394805 ) ) ( not ( = ?auto_394796 ?auto_394806 ) ) ( not ( = ?auto_394797 ?auto_394798 ) ) ( not ( = ?auto_394797 ?auto_394799 ) ) ( not ( = ?auto_394797 ?auto_394800 ) ) ( not ( = ?auto_394797 ?auto_394801 ) ) ( not ( = ?auto_394797 ?auto_394802 ) ) ( not ( = ?auto_394797 ?auto_394803 ) ) ( not ( = ?auto_394797 ?auto_394804 ) ) ( not ( = ?auto_394797 ?auto_394805 ) ) ( not ( = ?auto_394797 ?auto_394806 ) ) ( not ( = ?auto_394798 ?auto_394799 ) ) ( not ( = ?auto_394798 ?auto_394800 ) ) ( not ( = ?auto_394798 ?auto_394801 ) ) ( not ( = ?auto_394798 ?auto_394802 ) ) ( not ( = ?auto_394798 ?auto_394803 ) ) ( not ( = ?auto_394798 ?auto_394804 ) ) ( not ( = ?auto_394798 ?auto_394805 ) ) ( not ( = ?auto_394798 ?auto_394806 ) ) ( not ( = ?auto_394799 ?auto_394800 ) ) ( not ( = ?auto_394799 ?auto_394801 ) ) ( not ( = ?auto_394799 ?auto_394802 ) ) ( not ( = ?auto_394799 ?auto_394803 ) ) ( not ( = ?auto_394799 ?auto_394804 ) ) ( not ( = ?auto_394799 ?auto_394805 ) ) ( not ( = ?auto_394799 ?auto_394806 ) ) ( not ( = ?auto_394800 ?auto_394801 ) ) ( not ( = ?auto_394800 ?auto_394802 ) ) ( not ( = ?auto_394800 ?auto_394803 ) ) ( not ( = ?auto_394800 ?auto_394804 ) ) ( not ( = ?auto_394800 ?auto_394805 ) ) ( not ( = ?auto_394800 ?auto_394806 ) ) ( not ( = ?auto_394801 ?auto_394802 ) ) ( not ( = ?auto_394801 ?auto_394803 ) ) ( not ( = ?auto_394801 ?auto_394804 ) ) ( not ( = ?auto_394801 ?auto_394805 ) ) ( not ( = ?auto_394801 ?auto_394806 ) ) ( not ( = ?auto_394802 ?auto_394803 ) ) ( not ( = ?auto_394802 ?auto_394804 ) ) ( not ( = ?auto_394802 ?auto_394805 ) ) ( not ( = ?auto_394802 ?auto_394806 ) ) ( not ( = ?auto_394803 ?auto_394804 ) ) ( not ( = ?auto_394803 ?auto_394805 ) ) ( not ( = ?auto_394803 ?auto_394806 ) ) ( not ( = ?auto_394804 ?auto_394805 ) ) ( not ( = ?auto_394804 ?auto_394806 ) ) ( not ( = ?auto_394805 ?auto_394806 ) ) ( ON ?auto_394804 ?auto_394805 ) ( CLEAR ?auto_394802 ) ( ON ?auto_394803 ?auto_394804 ) ( CLEAR ?auto_394803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_394793 ?auto_394794 ?auto_394795 ?auto_394796 ?auto_394797 ?auto_394798 ?auto_394799 ?auto_394800 ?auto_394801 ?auto_394802 ?auto_394803 )
      ( MAKE-13PILE ?auto_394793 ?auto_394794 ?auto_394795 ?auto_394796 ?auto_394797 ?auto_394798 ?auto_394799 ?auto_394800 ?auto_394801 ?auto_394802 ?auto_394803 ?auto_394804 ?auto_394805 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394820 - BLOCK
      ?auto_394821 - BLOCK
      ?auto_394822 - BLOCK
      ?auto_394823 - BLOCK
      ?auto_394824 - BLOCK
      ?auto_394825 - BLOCK
      ?auto_394826 - BLOCK
      ?auto_394827 - BLOCK
      ?auto_394828 - BLOCK
      ?auto_394829 - BLOCK
      ?auto_394830 - BLOCK
      ?auto_394831 - BLOCK
      ?auto_394832 - BLOCK
    )
    :vars
    (
      ?auto_394833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394832 ?auto_394833 ) ( ON-TABLE ?auto_394820 ) ( ON ?auto_394821 ?auto_394820 ) ( ON ?auto_394822 ?auto_394821 ) ( ON ?auto_394823 ?auto_394822 ) ( ON ?auto_394824 ?auto_394823 ) ( ON ?auto_394825 ?auto_394824 ) ( ON ?auto_394826 ?auto_394825 ) ( ON ?auto_394827 ?auto_394826 ) ( ON ?auto_394828 ?auto_394827 ) ( ON ?auto_394829 ?auto_394828 ) ( not ( = ?auto_394820 ?auto_394821 ) ) ( not ( = ?auto_394820 ?auto_394822 ) ) ( not ( = ?auto_394820 ?auto_394823 ) ) ( not ( = ?auto_394820 ?auto_394824 ) ) ( not ( = ?auto_394820 ?auto_394825 ) ) ( not ( = ?auto_394820 ?auto_394826 ) ) ( not ( = ?auto_394820 ?auto_394827 ) ) ( not ( = ?auto_394820 ?auto_394828 ) ) ( not ( = ?auto_394820 ?auto_394829 ) ) ( not ( = ?auto_394820 ?auto_394830 ) ) ( not ( = ?auto_394820 ?auto_394831 ) ) ( not ( = ?auto_394820 ?auto_394832 ) ) ( not ( = ?auto_394820 ?auto_394833 ) ) ( not ( = ?auto_394821 ?auto_394822 ) ) ( not ( = ?auto_394821 ?auto_394823 ) ) ( not ( = ?auto_394821 ?auto_394824 ) ) ( not ( = ?auto_394821 ?auto_394825 ) ) ( not ( = ?auto_394821 ?auto_394826 ) ) ( not ( = ?auto_394821 ?auto_394827 ) ) ( not ( = ?auto_394821 ?auto_394828 ) ) ( not ( = ?auto_394821 ?auto_394829 ) ) ( not ( = ?auto_394821 ?auto_394830 ) ) ( not ( = ?auto_394821 ?auto_394831 ) ) ( not ( = ?auto_394821 ?auto_394832 ) ) ( not ( = ?auto_394821 ?auto_394833 ) ) ( not ( = ?auto_394822 ?auto_394823 ) ) ( not ( = ?auto_394822 ?auto_394824 ) ) ( not ( = ?auto_394822 ?auto_394825 ) ) ( not ( = ?auto_394822 ?auto_394826 ) ) ( not ( = ?auto_394822 ?auto_394827 ) ) ( not ( = ?auto_394822 ?auto_394828 ) ) ( not ( = ?auto_394822 ?auto_394829 ) ) ( not ( = ?auto_394822 ?auto_394830 ) ) ( not ( = ?auto_394822 ?auto_394831 ) ) ( not ( = ?auto_394822 ?auto_394832 ) ) ( not ( = ?auto_394822 ?auto_394833 ) ) ( not ( = ?auto_394823 ?auto_394824 ) ) ( not ( = ?auto_394823 ?auto_394825 ) ) ( not ( = ?auto_394823 ?auto_394826 ) ) ( not ( = ?auto_394823 ?auto_394827 ) ) ( not ( = ?auto_394823 ?auto_394828 ) ) ( not ( = ?auto_394823 ?auto_394829 ) ) ( not ( = ?auto_394823 ?auto_394830 ) ) ( not ( = ?auto_394823 ?auto_394831 ) ) ( not ( = ?auto_394823 ?auto_394832 ) ) ( not ( = ?auto_394823 ?auto_394833 ) ) ( not ( = ?auto_394824 ?auto_394825 ) ) ( not ( = ?auto_394824 ?auto_394826 ) ) ( not ( = ?auto_394824 ?auto_394827 ) ) ( not ( = ?auto_394824 ?auto_394828 ) ) ( not ( = ?auto_394824 ?auto_394829 ) ) ( not ( = ?auto_394824 ?auto_394830 ) ) ( not ( = ?auto_394824 ?auto_394831 ) ) ( not ( = ?auto_394824 ?auto_394832 ) ) ( not ( = ?auto_394824 ?auto_394833 ) ) ( not ( = ?auto_394825 ?auto_394826 ) ) ( not ( = ?auto_394825 ?auto_394827 ) ) ( not ( = ?auto_394825 ?auto_394828 ) ) ( not ( = ?auto_394825 ?auto_394829 ) ) ( not ( = ?auto_394825 ?auto_394830 ) ) ( not ( = ?auto_394825 ?auto_394831 ) ) ( not ( = ?auto_394825 ?auto_394832 ) ) ( not ( = ?auto_394825 ?auto_394833 ) ) ( not ( = ?auto_394826 ?auto_394827 ) ) ( not ( = ?auto_394826 ?auto_394828 ) ) ( not ( = ?auto_394826 ?auto_394829 ) ) ( not ( = ?auto_394826 ?auto_394830 ) ) ( not ( = ?auto_394826 ?auto_394831 ) ) ( not ( = ?auto_394826 ?auto_394832 ) ) ( not ( = ?auto_394826 ?auto_394833 ) ) ( not ( = ?auto_394827 ?auto_394828 ) ) ( not ( = ?auto_394827 ?auto_394829 ) ) ( not ( = ?auto_394827 ?auto_394830 ) ) ( not ( = ?auto_394827 ?auto_394831 ) ) ( not ( = ?auto_394827 ?auto_394832 ) ) ( not ( = ?auto_394827 ?auto_394833 ) ) ( not ( = ?auto_394828 ?auto_394829 ) ) ( not ( = ?auto_394828 ?auto_394830 ) ) ( not ( = ?auto_394828 ?auto_394831 ) ) ( not ( = ?auto_394828 ?auto_394832 ) ) ( not ( = ?auto_394828 ?auto_394833 ) ) ( not ( = ?auto_394829 ?auto_394830 ) ) ( not ( = ?auto_394829 ?auto_394831 ) ) ( not ( = ?auto_394829 ?auto_394832 ) ) ( not ( = ?auto_394829 ?auto_394833 ) ) ( not ( = ?auto_394830 ?auto_394831 ) ) ( not ( = ?auto_394830 ?auto_394832 ) ) ( not ( = ?auto_394830 ?auto_394833 ) ) ( not ( = ?auto_394831 ?auto_394832 ) ) ( not ( = ?auto_394831 ?auto_394833 ) ) ( not ( = ?auto_394832 ?auto_394833 ) ) ( ON ?auto_394831 ?auto_394832 ) ( CLEAR ?auto_394829 ) ( ON ?auto_394830 ?auto_394831 ) ( CLEAR ?auto_394830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_394820 ?auto_394821 ?auto_394822 ?auto_394823 ?auto_394824 ?auto_394825 ?auto_394826 ?auto_394827 ?auto_394828 ?auto_394829 ?auto_394830 )
      ( MAKE-13PILE ?auto_394820 ?auto_394821 ?auto_394822 ?auto_394823 ?auto_394824 ?auto_394825 ?auto_394826 ?auto_394827 ?auto_394828 ?auto_394829 ?auto_394830 ?auto_394831 ?auto_394832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394847 - BLOCK
      ?auto_394848 - BLOCK
      ?auto_394849 - BLOCK
      ?auto_394850 - BLOCK
      ?auto_394851 - BLOCK
      ?auto_394852 - BLOCK
      ?auto_394853 - BLOCK
      ?auto_394854 - BLOCK
      ?auto_394855 - BLOCK
      ?auto_394856 - BLOCK
      ?auto_394857 - BLOCK
      ?auto_394858 - BLOCK
      ?auto_394859 - BLOCK
    )
    :vars
    (
      ?auto_394860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394859 ?auto_394860 ) ( ON-TABLE ?auto_394847 ) ( ON ?auto_394848 ?auto_394847 ) ( ON ?auto_394849 ?auto_394848 ) ( ON ?auto_394850 ?auto_394849 ) ( ON ?auto_394851 ?auto_394850 ) ( ON ?auto_394852 ?auto_394851 ) ( ON ?auto_394853 ?auto_394852 ) ( ON ?auto_394854 ?auto_394853 ) ( ON ?auto_394855 ?auto_394854 ) ( not ( = ?auto_394847 ?auto_394848 ) ) ( not ( = ?auto_394847 ?auto_394849 ) ) ( not ( = ?auto_394847 ?auto_394850 ) ) ( not ( = ?auto_394847 ?auto_394851 ) ) ( not ( = ?auto_394847 ?auto_394852 ) ) ( not ( = ?auto_394847 ?auto_394853 ) ) ( not ( = ?auto_394847 ?auto_394854 ) ) ( not ( = ?auto_394847 ?auto_394855 ) ) ( not ( = ?auto_394847 ?auto_394856 ) ) ( not ( = ?auto_394847 ?auto_394857 ) ) ( not ( = ?auto_394847 ?auto_394858 ) ) ( not ( = ?auto_394847 ?auto_394859 ) ) ( not ( = ?auto_394847 ?auto_394860 ) ) ( not ( = ?auto_394848 ?auto_394849 ) ) ( not ( = ?auto_394848 ?auto_394850 ) ) ( not ( = ?auto_394848 ?auto_394851 ) ) ( not ( = ?auto_394848 ?auto_394852 ) ) ( not ( = ?auto_394848 ?auto_394853 ) ) ( not ( = ?auto_394848 ?auto_394854 ) ) ( not ( = ?auto_394848 ?auto_394855 ) ) ( not ( = ?auto_394848 ?auto_394856 ) ) ( not ( = ?auto_394848 ?auto_394857 ) ) ( not ( = ?auto_394848 ?auto_394858 ) ) ( not ( = ?auto_394848 ?auto_394859 ) ) ( not ( = ?auto_394848 ?auto_394860 ) ) ( not ( = ?auto_394849 ?auto_394850 ) ) ( not ( = ?auto_394849 ?auto_394851 ) ) ( not ( = ?auto_394849 ?auto_394852 ) ) ( not ( = ?auto_394849 ?auto_394853 ) ) ( not ( = ?auto_394849 ?auto_394854 ) ) ( not ( = ?auto_394849 ?auto_394855 ) ) ( not ( = ?auto_394849 ?auto_394856 ) ) ( not ( = ?auto_394849 ?auto_394857 ) ) ( not ( = ?auto_394849 ?auto_394858 ) ) ( not ( = ?auto_394849 ?auto_394859 ) ) ( not ( = ?auto_394849 ?auto_394860 ) ) ( not ( = ?auto_394850 ?auto_394851 ) ) ( not ( = ?auto_394850 ?auto_394852 ) ) ( not ( = ?auto_394850 ?auto_394853 ) ) ( not ( = ?auto_394850 ?auto_394854 ) ) ( not ( = ?auto_394850 ?auto_394855 ) ) ( not ( = ?auto_394850 ?auto_394856 ) ) ( not ( = ?auto_394850 ?auto_394857 ) ) ( not ( = ?auto_394850 ?auto_394858 ) ) ( not ( = ?auto_394850 ?auto_394859 ) ) ( not ( = ?auto_394850 ?auto_394860 ) ) ( not ( = ?auto_394851 ?auto_394852 ) ) ( not ( = ?auto_394851 ?auto_394853 ) ) ( not ( = ?auto_394851 ?auto_394854 ) ) ( not ( = ?auto_394851 ?auto_394855 ) ) ( not ( = ?auto_394851 ?auto_394856 ) ) ( not ( = ?auto_394851 ?auto_394857 ) ) ( not ( = ?auto_394851 ?auto_394858 ) ) ( not ( = ?auto_394851 ?auto_394859 ) ) ( not ( = ?auto_394851 ?auto_394860 ) ) ( not ( = ?auto_394852 ?auto_394853 ) ) ( not ( = ?auto_394852 ?auto_394854 ) ) ( not ( = ?auto_394852 ?auto_394855 ) ) ( not ( = ?auto_394852 ?auto_394856 ) ) ( not ( = ?auto_394852 ?auto_394857 ) ) ( not ( = ?auto_394852 ?auto_394858 ) ) ( not ( = ?auto_394852 ?auto_394859 ) ) ( not ( = ?auto_394852 ?auto_394860 ) ) ( not ( = ?auto_394853 ?auto_394854 ) ) ( not ( = ?auto_394853 ?auto_394855 ) ) ( not ( = ?auto_394853 ?auto_394856 ) ) ( not ( = ?auto_394853 ?auto_394857 ) ) ( not ( = ?auto_394853 ?auto_394858 ) ) ( not ( = ?auto_394853 ?auto_394859 ) ) ( not ( = ?auto_394853 ?auto_394860 ) ) ( not ( = ?auto_394854 ?auto_394855 ) ) ( not ( = ?auto_394854 ?auto_394856 ) ) ( not ( = ?auto_394854 ?auto_394857 ) ) ( not ( = ?auto_394854 ?auto_394858 ) ) ( not ( = ?auto_394854 ?auto_394859 ) ) ( not ( = ?auto_394854 ?auto_394860 ) ) ( not ( = ?auto_394855 ?auto_394856 ) ) ( not ( = ?auto_394855 ?auto_394857 ) ) ( not ( = ?auto_394855 ?auto_394858 ) ) ( not ( = ?auto_394855 ?auto_394859 ) ) ( not ( = ?auto_394855 ?auto_394860 ) ) ( not ( = ?auto_394856 ?auto_394857 ) ) ( not ( = ?auto_394856 ?auto_394858 ) ) ( not ( = ?auto_394856 ?auto_394859 ) ) ( not ( = ?auto_394856 ?auto_394860 ) ) ( not ( = ?auto_394857 ?auto_394858 ) ) ( not ( = ?auto_394857 ?auto_394859 ) ) ( not ( = ?auto_394857 ?auto_394860 ) ) ( not ( = ?auto_394858 ?auto_394859 ) ) ( not ( = ?auto_394858 ?auto_394860 ) ) ( not ( = ?auto_394859 ?auto_394860 ) ) ( ON ?auto_394858 ?auto_394859 ) ( ON ?auto_394857 ?auto_394858 ) ( CLEAR ?auto_394855 ) ( ON ?auto_394856 ?auto_394857 ) ( CLEAR ?auto_394856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_394847 ?auto_394848 ?auto_394849 ?auto_394850 ?auto_394851 ?auto_394852 ?auto_394853 ?auto_394854 ?auto_394855 ?auto_394856 )
      ( MAKE-13PILE ?auto_394847 ?auto_394848 ?auto_394849 ?auto_394850 ?auto_394851 ?auto_394852 ?auto_394853 ?auto_394854 ?auto_394855 ?auto_394856 ?auto_394857 ?auto_394858 ?auto_394859 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394874 - BLOCK
      ?auto_394875 - BLOCK
      ?auto_394876 - BLOCK
      ?auto_394877 - BLOCK
      ?auto_394878 - BLOCK
      ?auto_394879 - BLOCK
      ?auto_394880 - BLOCK
      ?auto_394881 - BLOCK
      ?auto_394882 - BLOCK
      ?auto_394883 - BLOCK
      ?auto_394884 - BLOCK
      ?auto_394885 - BLOCK
      ?auto_394886 - BLOCK
    )
    :vars
    (
      ?auto_394887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394886 ?auto_394887 ) ( ON-TABLE ?auto_394874 ) ( ON ?auto_394875 ?auto_394874 ) ( ON ?auto_394876 ?auto_394875 ) ( ON ?auto_394877 ?auto_394876 ) ( ON ?auto_394878 ?auto_394877 ) ( ON ?auto_394879 ?auto_394878 ) ( ON ?auto_394880 ?auto_394879 ) ( ON ?auto_394881 ?auto_394880 ) ( ON ?auto_394882 ?auto_394881 ) ( not ( = ?auto_394874 ?auto_394875 ) ) ( not ( = ?auto_394874 ?auto_394876 ) ) ( not ( = ?auto_394874 ?auto_394877 ) ) ( not ( = ?auto_394874 ?auto_394878 ) ) ( not ( = ?auto_394874 ?auto_394879 ) ) ( not ( = ?auto_394874 ?auto_394880 ) ) ( not ( = ?auto_394874 ?auto_394881 ) ) ( not ( = ?auto_394874 ?auto_394882 ) ) ( not ( = ?auto_394874 ?auto_394883 ) ) ( not ( = ?auto_394874 ?auto_394884 ) ) ( not ( = ?auto_394874 ?auto_394885 ) ) ( not ( = ?auto_394874 ?auto_394886 ) ) ( not ( = ?auto_394874 ?auto_394887 ) ) ( not ( = ?auto_394875 ?auto_394876 ) ) ( not ( = ?auto_394875 ?auto_394877 ) ) ( not ( = ?auto_394875 ?auto_394878 ) ) ( not ( = ?auto_394875 ?auto_394879 ) ) ( not ( = ?auto_394875 ?auto_394880 ) ) ( not ( = ?auto_394875 ?auto_394881 ) ) ( not ( = ?auto_394875 ?auto_394882 ) ) ( not ( = ?auto_394875 ?auto_394883 ) ) ( not ( = ?auto_394875 ?auto_394884 ) ) ( not ( = ?auto_394875 ?auto_394885 ) ) ( not ( = ?auto_394875 ?auto_394886 ) ) ( not ( = ?auto_394875 ?auto_394887 ) ) ( not ( = ?auto_394876 ?auto_394877 ) ) ( not ( = ?auto_394876 ?auto_394878 ) ) ( not ( = ?auto_394876 ?auto_394879 ) ) ( not ( = ?auto_394876 ?auto_394880 ) ) ( not ( = ?auto_394876 ?auto_394881 ) ) ( not ( = ?auto_394876 ?auto_394882 ) ) ( not ( = ?auto_394876 ?auto_394883 ) ) ( not ( = ?auto_394876 ?auto_394884 ) ) ( not ( = ?auto_394876 ?auto_394885 ) ) ( not ( = ?auto_394876 ?auto_394886 ) ) ( not ( = ?auto_394876 ?auto_394887 ) ) ( not ( = ?auto_394877 ?auto_394878 ) ) ( not ( = ?auto_394877 ?auto_394879 ) ) ( not ( = ?auto_394877 ?auto_394880 ) ) ( not ( = ?auto_394877 ?auto_394881 ) ) ( not ( = ?auto_394877 ?auto_394882 ) ) ( not ( = ?auto_394877 ?auto_394883 ) ) ( not ( = ?auto_394877 ?auto_394884 ) ) ( not ( = ?auto_394877 ?auto_394885 ) ) ( not ( = ?auto_394877 ?auto_394886 ) ) ( not ( = ?auto_394877 ?auto_394887 ) ) ( not ( = ?auto_394878 ?auto_394879 ) ) ( not ( = ?auto_394878 ?auto_394880 ) ) ( not ( = ?auto_394878 ?auto_394881 ) ) ( not ( = ?auto_394878 ?auto_394882 ) ) ( not ( = ?auto_394878 ?auto_394883 ) ) ( not ( = ?auto_394878 ?auto_394884 ) ) ( not ( = ?auto_394878 ?auto_394885 ) ) ( not ( = ?auto_394878 ?auto_394886 ) ) ( not ( = ?auto_394878 ?auto_394887 ) ) ( not ( = ?auto_394879 ?auto_394880 ) ) ( not ( = ?auto_394879 ?auto_394881 ) ) ( not ( = ?auto_394879 ?auto_394882 ) ) ( not ( = ?auto_394879 ?auto_394883 ) ) ( not ( = ?auto_394879 ?auto_394884 ) ) ( not ( = ?auto_394879 ?auto_394885 ) ) ( not ( = ?auto_394879 ?auto_394886 ) ) ( not ( = ?auto_394879 ?auto_394887 ) ) ( not ( = ?auto_394880 ?auto_394881 ) ) ( not ( = ?auto_394880 ?auto_394882 ) ) ( not ( = ?auto_394880 ?auto_394883 ) ) ( not ( = ?auto_394880 ?auto_394884 ) ) ( not ( = ?auto_394880 ?auto_394885 ) ) ( not ( = ?auto_394880 ?auto_394886 ) ) ( not ( = ?auto_394880 ?auto_394887 ) ) ( not ( = ?auto_394881 ?auto_394882 ) ) ( not ( = ?auto_394881 ?auto_394883 ) ) ( not ( = ?auto_394881 ?auto_394884 ) ) ( not ( = ?auto_394881 ?auto_394885 ) ) ( not ( = ?auto_394881 ?auto_394886 ) ) ( not ( = ?auto_394881 ?auto_394887 ) ) ( not ( = ?auto_394882 ?auto_394883 ) ) ( not ( = ?auto_394882 ?auto_394884 ) ) ( not ( = ?auto_394882 ?auto_394885 ) ) ( not ( = ?auto_394882 ?auto_394886 ) ) ( not ( = ?auto_394882 ?auto_394887 ) ) ( not ( = ?auto_394883 ?auto_394884 ) ) ( not ( = ?auto_394883 ?auto_394885 ) ) ( not ( = ?auto_394883 ?auto_394886 ) ) ( not ( = ?auto_394883 ?auto_394887 ) ) ( not ( = ?auto_394884 ?auto_394885 ) ) ( not ( = ?auto_394884 ?auto_394886 ) ) ( not ( = ?auto_394884 ?auto_394887 ) ) ( not ( = ?auto_394885 ?auto_394886 ) ) ( not ( = ?auto_394885 ?auto_394887 ) ) ( not ( = ?auto_394886 ?auto_394887 ) ) ( ON ?auto_394885 ?auto_394886 ) ( ON ?auto_394884 ?auto_394885 ) ( CLEAR ?auto_394882 ) ( ON ?auto_394883 ?auto_394884 ) ( CLEAR ?auto_394883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_394874 ?auto_394875 ?auto_394876 ?auto_394877 ?auto_394878 ?auto_394879 ?auto_394880 ?auto_394881 ?auto_394882 ?auto_394883 )
      ( MAKE-13PILE ?auto_394874 ?auto_394875 ?auto_394876 ?auto_394877 ?auto_394878 ?auto_394879 ?auto_394880 ?auto_394881 ?auto_394882 ?auto_394883 ?auto_394884 ?auto_394885 ?auto_394886 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394901 - BLOCK
      ?auto_394902 - BLOCK
      ?auto_394903 - BLOCK
      ?auto_394904 - BLOCK
      ?auto_394905 - BLOCK
      ?auto_394906 - BLOCK
      ?auto_394907 - BLOCK
      ?auto_394908 - BLOCK
      ?auto_394909 - BLOCK
      ?auto_394910 - BLOCK
      ?auto_394911 - BLOCK
      ?auto_394912 - BLOCK
      ?auto_394913 - BLOCK
    )
    :vars
    (
      ?auto_394914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394913 ?auto_394914 ) ( ON-TABLE ?auto_394901 ) ( ON ?auto_394902 ?auto_394901 ) ( ON ?auto_394903 ?auto_394902 ) ( ON ?auto_394904 ?auto_394903 ) ( ON ?auto_394905 ?auto_394904 ) ( ON ?auto_394906 ?auto_394905 ) ( ON ?auto_394907 ?auto_394906 ) ( ON ?auto_394908 ?auto_394907 ) ( not ( = ?auto_394901 ?auto_394902 ) ) ( not ( = ?auto_394901 ?auto_394903 ) ) ( not ( = ?auto_394901 ?auto_394904 ) ) ( not ( = ?auto_394901 ?auto_394905 ) ) ( not ( = ?auto_394901 ?auto_394906 ) ) ( not ( = ?auto_394901 ?auto_394907 ) ) ( not ( = ?auto_394901 ?auto_394908 ) ) ( not ( = ?auto_394901 ?auto_394909 ) ) ( not ( = ?auto_394901 ?auto_394910 ) ) ( not ( = ?auto_394901 ?auto_394911 ) ) ( not ( = ?auto_394901 ?auto_394912 ) ) ( not ( = ?auto_394901 ?auto_394913 ) ) ( not ( = ?auto_394901 ?auto_394914 ) ) ( not ( = ?auto_394902 ?auto_394903 ) ) ( not ( = ?auto_394902 ?auto_394904 ) ) ( not ( = ?auto_394902 ?auto_394905 ) ) ( not ( = ?auto_394902 ?auto_394906 ) ) ( not ( = ?auto_394902 ?auto_394907 ) ) ( not ( = ?auto_394902 ?auto_394908 ) ) ( not ( = ?auto_394902 ?auto_394909 ) ) ( not ( = ?auto_394902 ?auto_394910 ) ) ( not ( = ?auto_394902 ?auto_394911 ) ) ( not ( = ?auto_394902 ?auto_394912 ) ) ( not ( = ?auto_394902 ?auto_394913 ) ) ( not ( = ?auto_394902 ?auto_394914 ) ) ( not ( = ?auto_394903 ?auto_394904 ) ) ( not ( = ?auto_394903 ?auto_394905 ) ) ( not ( = ?auto_394903 ?auto_394906 ) ) ( not ( = ?auto_394903 ?auto_394907 ) ) ( not ( = ?auto_394903 ?auto_394908 ) ) ( not ( = ?auto_394903 ?auto_394909 ) ) ( not ( = ?auto_394903 ?auto_394910 ) ) ( not ( = ?auto_394903 ?auto_394911 ) ) ( not ( = ?auto_394903 ?auto_394912 ) ) ( not ( = ?auto_394903 ?auto_394913 ) ) ( not ( = ?auto_394903 ?auto_394914 ) ) ( not ( = ?auto_394904 ?auto_394905 ) ) ( not ( = ?auto_394904 ?auto_394906 ) ) ( not ( = ?auto_394904 ?auto_394907 ) ) ( not ( = ?auto_394904 ?auto_394908 ) ) ( not ( = ?auto_394904 ?auto_394909 ) ) ( not ( = ?auto_394904 ?auto_394910 ) ) ( not ( = ?auto_394904 ?auto_394911 ) ) ( not ( = ?auto_394904 ?auto_394912 ) ) ( not ( = ?auto_394904 ?auto_394913 ) ) ( not ( = ?auto_394904 ?auto_394914 ) ) ( not ( = ?auto_394905 ?auto_394906 ) ) ( not ( = ?auto_394905 ?auto_394907 ) ) ( not ( = ?auto_394905 ?auto_394908 ) ) ( not ( = ?auto_394905 ?auto_394909 ) ) ( not ( = ?auto_394905 ?auto_394910 ) ) ( not ( = ?auto_394905 ?auto_394911 ) ) ( not ( = ?auto_394905 ?auto_394912 ) ) ( not ( = ?auto_394905 ?auto_394913 ) ) ( not ( = ?auto_394905 ?auto_394914 ) ) ( not ( = ?auto_394906 ?auto_394907 ) ) ( not ( = ?auto_394906 ?auto_394908 ) ) ( not ( = ?auto_394906 ?auto_394909 ) ) ( not ( = ?auto_394906 ?auto_394910 ) ) ( not ( = ?auto_394906 ?auto_394911 ) ) ( not ( = ?auto_394906 ?auto_394912 ) ) ( not ( = ?auto_394906 ?auto_394913 ) ) ( not ( = ?auto_394906 ?auto_394914 ) ) ( not ( = ?auto_394907 ?auto_394908 ) ) ( not ( = ?auto_394907 ?auto_394909 ) ) ( not ( = ?auto_394907 ?auto_394910 ) ) ( not ( = ?auto_394907 ?auto_394911 ) ) ( not ( = ?auto_394907 ?auto_394912 ) ) ( not ( = ?auto_394907 ?auto_394913 ) ) ( not ( = ?auto_394907 ?auto_394914 ) ) ( not ( = ?auto_394908 ?auto_394909 ) ) ( not ( = ?auto_394908 ?auto_394910 ) ) ( not ( = ?auto_394908 ?auto_394911 ) ) ( not ( = ?auto_394908 ?auto_394912 ) ) ( not ( = ?auto_394908 ?auto_394913 ) ) ( not ( = ?auto_394908 ?auto_394914 ) ) ( not ( = ?auto_394909 ?auto_394910 ) ) ( not ( = ?auto_394909 ?auto_394911 ) ) ( not ( = ?auto_394909 ?auto_394912 ) ) ( not ( = ?auto_394909 ?auto_394913 ) ) ( not ( = ?auto_394909 ?auto_394914 ) ) ( not ( = ?auto_394910 ?auto_394911 ) ) ( not ( = ?auto_394910 ?auto_394912 ) ) ( not ( = ?auto_394910 ?auto_394913 ) ) ( not ( = ?auto_394910 ?auto_394914 ) ) ( not ( = ?auto_394911 ?auto_394912 ) ) ( not ( = ?auto_394911 ?auto_394913 ) ) ( not ( = ?auto_394911 ?auto_394914 ) ) ( not ( = ?auto_394912 ?auto_394913 ) ) ( not ( = ?auto_394912 ?auto_394914 ) ) ( not ( = ?auto_394913 ?auto_394914 ) ) ( ON ?auto_394912 ?auto_394913 ) ( ON ?auto_394911 ?auto_394912 ) ( ON ?auto_394910 ?auto_394911 ) ( CLEAR ?auto_394908 ) ( ON ?auto_394909 ?auto_394910 ) ( CLEAR ?auto_394909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_394901 ?auto_394902 ?auto_394903 ?auto_394904 ?auto_394905 ?auto_394906 ?auto_394907 ?auto_394908 ?auto_394909 )
      ( MAKE-13PILE ?auto_394901 ?auto_394902 ?auto_394903 ?auto_394904 ?auto_394905 ?auto_394906 ?auto_394907 ?auto_394908 ?auto_394909 ?auto_394910 ?auto_394911 ?auto_394912 ?auto_394913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394928 - BLOCK
      ?auto_394929 - BLOCK
      ?auto_394930 - BLOCK
      ?auto_394931 - BLOCK
      ?auto_394932 - BLOCK
      ?auto_394933 - BLOCK
      ?auto_394934 - BLOCK
      ?auto_394935 - BLOCK
      ?auto_394936 - BLOCK
      ?auto_394937 - BLOCK
      ?auto_394938 - BLOCK
      ?auto_394939 - BLOCK
      ?auto_394940 - BLOCK
    )
    :vars
    (
      ?auto_394941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394940 ?auto_394941 ) ( ON-TABLE ?auto_394928 ) ( ON ?auto_394929 ?auto_394928 ) ( ON ?auto_394930 ?auto_394929 ) ( ON ?auto_394931 ?auto_394930 ) ( ON ?auto_394932 ?auto_394931 ) ( ON ?auto_394933 ?auto_394932 ) ( ON ?auto_394934 ?auto_394933 ) ( ON ?auto_394935 ?auto_394934 ) ( not ( = ?auto_394928 ?auto_394929 ) ) ( not ( = ?auto_394928 ?auto_394930 ) ) ( not ( = ?auto_394928 ?auto_394931 ) ) ( not ( = ?auto_394928 ?auto_394932 ) ) ( not ( = ?auto_394928 ?auto_394933 ) ) ( not ( = ?auto_394928 ?auto_394934 ) ) ( not ( = ?auto_394928 ?auto_394935 ) ) ( not ( = ?auto_394928 ?auto_394936 ) ) ( not ( = ?auto_394928 ?auto_394937 ) ) ( not ( = ?auto_394928 ?auto_394938 ) ) ( not ( = ?auto_394928 ?auto_394939 ) ) ( not ( = ?auto_394928 ?auto_394940 ) ) ( not ( = ?auto_394928 ?auto_394941 ) ) ( not ( = ?auto_394929 ?auto_394930 ) ) ( not ( = ?auto_394929 ?auto_394931 ) ) ( not ( = ?auto_394929 ?auto_394932 ) ) ( not ( = ?auto_394929 ?auto_394933 ) ) ( not ( = ?auto_394929 ?auto_394934 ) ) ( not ( = ?auto_394929 ?auto_394935 ) ) ( not ( = ?auto_394929 ?auto_394936 ) ) ( not ( = ?auto_394929 ?auto_394937 ) ) ( not ( = ?auto_394929 ?auto_394938 ) ) ( not ( = ?auto_394929 ?auto_394939 ) ) ( not ( = ?auto_394929 ?auto_394940 ) ) ( not ( = ?auto_394929 ?auto_394941 ) ) ( not ( = ?auto_394930 ?auto_394931 ) ) ( not ( = ?auto_394930 ?auto_394932 ) ) ( not ( = ?auto_394930 ?auto_394933 ) ) ( not ( = ?auto_394930 ?auto_394934 ) ) ( not ( = ?auto_394930 ?auto_394935 ) ) ( not ( = ?auto_394930 ?auto_394936 ) ) ( not ( = ?auto_394930 ?auto_394937 ) ) ( not ( = ?auto_394930 ?auto_394938 ) ) ( not ( = ?auto_394930 ?auto_394939 ) ) ( not ( = ?auto_394930 ?auto_394940 ) ) ( not ( = ?auto_394930 ?auto_394941 ) ) ( not ( = ?auto_394931 ?auto_394932 ) ) ( not ( = ?auto_394931 ?auto_394933 ) ) ( not ( = ?auto_394931 ?auto_394934 ) ) ( not ( = ?auto_394931 ?auto_394935 ) ) ( not ( = ?auto_394931 ?auto_394936 ) ) ( not ( = ?auto_394931 ?auto_394937 ) ) ( not ( = ?auto_394931 ?auto_394938 ) ) ( not ( = ?auto_394931 ?auto_394939 ) ) ( not ( = ?auto_394931 ?auto_394940 ) ) ( not ( = ?auto_394931 ?auto_394941 ) ) ( not ( = ?auto_394932 ?auto_394933 ) ) ( not ( = ?auto_394932 ?auto_394934 ) ) ( not ( = ?auto_394932 ?auto_394935 ) ) ( not ( = ?auto_394932 ?auto_394936 ) ) ( not ( = ?auto_394932 ?auto_394937 ) ) ( not ( = ?auto_394932 ?auto_394938 ) ) ( not ( = ?auto_394932 ?auto_394939 ) ) ( not ( = ?auto_394932 ?auto_394940 ) ) ( not ( = ?auto_394932 ?auto_394941 ) ) ( not ( = ?auto_394933 ?auto_394934 ) ) ( not ( = ?auto_394933 ?auto_394935 ) ) ( not ( = ?auto_394933 ?auto_394936 ) ) ( not ( = ?auto_394933 ?auto_394937 ) ) ( not ( = ?auto_394933 ?auto_394938 ) ) ( not ( = ?auto_394933 ?auto_394939 ) ) ( not ( = ?auto_394933 ?auto_394940 ) ) ( not ( = ?auto_394933 ?auto_394941 ) ) ( not ( = ?auto_394934 ?auto_394935 ) ) ( not ( = ?auto_394934 ?auto_394936 ) ) ( not ( = ?auto_394934 ?auto_394937 ) ) ( not ( = ?auto_394934 ?auto_394938 ) ) ( not ( = ?auto_394934 ?auto_394939 ) ) ( not ( = ?auto_394934 ?auto_394940 ) ) ( not ( = ?auto_394934 ?auto_394941 ) ) ( not ( = ?auto_394935 ?auto_394936 ) ) ( not ( = ?auto_394935 ?auto_394937 ) ) ( not ( = ?auto_394935 ?auto_394938 ) ) ( not ( = ?auto_394935 ?auto_394939 ) ) ( not ( = ?auto_394935 ?auto_394940 ) ) ( not ( = ?auto_394935 ?auto_394941 ) ) ( not ( = ?auto_394936 ?auto_394937 ) ) ( not ( = ?auto_394936 ?auto_394938 ) ) ( not ( = ?auto_394936 ?auto_394939 ) ) ( not ( = ?auto_394936 ?auto_394940 ) ) ( not ( = ?auto_394936 ?auto_394941 ) ) ( not ( = ?auto_394937 ?auto_394938 ) ) ( not ( = ?auto_394937 ?auto_394939 ) ) ( not ( = ?auto_394937 ?auto_394940 ) ) ( not ( = ?auto_394937 ?auto_394941 ) ) ( not ( = ?auto_394938 ?auto_394939 ) ) ( not ( = ?auto_394938 ?auto_394940 ) ) ( not ( = ?auto_394938 ?auto_394941 ) ) ( not ( = ?auto_394939 ?auto_394940 ) ) ( not ( = ?auto_394939 ?auto_394941 ) ) ( not ( = ?auto_394940 ?auto_394941 ) ) ( ON ?auto_394939 ?auto_394940 ) ( ON ?auto_394938 ?auto_394939 ) ( ON ?auto_394937 ?auto_394938 ) ( CLEAR ?auto_394935 ) ( ON ?auto_394936 ?auto_394937 ) ( CLEAR ?auto_394936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_394928 ?auto_394929 ?auto_394930 ?auto_394931 ?auto_394932 ?auto_394933 ?auto_394934 ?auto_394935 ?auto_394936 )
      ( MAKE-13PILE ?auto_394928 ?auto_394929 ?auto_394930 ?auto_394931 ?auto_394932 ?auto_394933 ?auto_394934 ?auto_394935 ?auto_394936 ?auto_394937 ?auto_394938 ?auto_394939 ?auto_394940 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394955 - BLOCK
      ?auto_394956 - BLOCK
      ?auto_394957 - BLOCK
      ?auto_394958 - BLOCK
      ?auto_394959 - BLOCK
      ?auto_394960 - BLOCK
      ?auto_394961 - BLOCK
      ?auto_394962 - BLOCK
      ?auto_394963 - BLOCK
      ?auto_394964 - BLOCK
      ?auto_394965 - BLOCK
      ?auto_394966 - BLOCK
      ?auto_394967 - BLOCK
    )
    :vars
    (
      ?auto_394968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394967 ?auto_394968 ) ( ON-TABLE ?auto_394955 ) ( ON ?auto_394956 ?auto_394955 ) ( ON ?auto_394957 ?auto_394956 ) ( ON ?auto_394958 ?auto_394957 ) ( ON ?auto_394959 ?auto_394958 ) ( ON ?auto_394960 ?auto_394959 ) ( ON ?auto_394961 ?auto_394960 ) ( not ( = ?auto_394955 ?auto_394956 ) ) ( not ( = ?auto_394955 ?auto_394957 ) ) ( not ( = ?auto_394955 ?auto_394958 ) ) ( not ( = ?auto_394955 ?auto_394959 ) ) ( not ( = ?auto_394955 ?auto_394960 ) ) ( not ( = ?auto_394955 ?auto_394961 ) ) ( not ( = ?auto_394955 ?auto_394962 ) ) ( not ( = ?auto_394955 ?auto_394963 ) ) ( not ( = ?auto_394955 ?auto_394964 ) ) ( not ( = ?auto_394955 ?auto_394965 ) ) ( not ( = ?auto_394955 ?auto_394966 ) ) ( not ( = ?auto_394955 ?auto_394967 ) ) ( not ( = ?auto_394955 ?auto_394968 ) ) ( not ( = ?auto_394956 ?auto_394957 ) ) ( not ( = ?auto_394956 ?auto_394958 ) ) ( not ( = ?auto_394956 ?auto_394959 ) ) ( not ( = ?auto_394956 ?auto_394960 ) ) ( not ( = ?auto_394956 ?auto_394961 ) ) ( not ( = ?auto_394956 ?auto_394962 ) ) ( not ( = ?auto_394956 ?auto_394963 ) ) ( not ( = ?auto_394956 ?auto_394964 ) ) ( not ( = ?auto_394956 ?auto_394965 ) ) ( not ( = ?auto_394956 ?auto_394966 ) ) ( not ( = ?auto_394956 ?auto_394967 ) ) ( not ( = ?auto_394956 ?auto_394968 ) ) ( not ( = ?auto_394957 ?auto_394958 ) ) ( not ( = ?auto_394957 ?auto_394959 ) ) ( not ( = ?auto_394957 ?auto_394960 ) ) ( not ( = ?auto_394957 ?auto_394961 ) ) ( not ( = ?auto_394957 ?auto_394962 ) ) ( not ( = ?auto_394957 ?auto_394963 ) ) ( not ( = ?auto_394957 ?auto_394964 ) ) ( not ( = ?auto_394957 ?auto_394965 ) ) ( not ( = ?auto_394957 ?auto_394966 ) ) ( not ( = ?auto_394957 ?auto_394967 ) ) ( not ( = ?auto_394957 ?auto_394968 ) ) ( not ( = ?auto_394958 ?auto_394959 ) ) ( not ( = ?auto_394958 ?auto_394960 ) ) ( not ( = ?auto_394958 ?auto_394961 ) ) ( not ( = ?auto_394958 ?auto_394962 ) ) ( not ( = ?auto_394958 ?auto_394963 ) ) ( not ( = ?auto_394958 ?auto_394964 ) ) ( not ( = ?auto_394958 ?auto_394965 ) ) ( not ( = ?auto_394958 ?auto_394966 ) ) ( not ( = ?auto_394958 ?auto_394967 ) ) ( not ( = ?auto_394958 ?auto_394968 ) ) ( not ( = ?auto_394959 ?auto_394960 ) ) ( not ( = ?auto_394959 ?auto_394961 ) ) ( not ( = ?auto_394959 ?auto_394962 ) ) ( not ( = ?auto_394959 ?auto_394963 ) ) ( not ( = ?auto_394959 ?auto_394964 ) ) ( not ( = ?auto_394959 ?auto_394965 ) ) ( not ( = ?auto_394959 ?auto_394966 ) ) ( not ( = ?auto_394959 ?auto_394967 ) ) ( not ( = ?auto_394959 ?auto_394968 ) ) ( not ( = ?auto_394960 ?auto_394961 ) ) ( not ( = ?auto_394960 ?auto_394962 ) ) ( not ( = ?auto_394960 ?auto_394963 ) ) ( not ( = ?auto_394960 ?auto_394964 ) ) ( not ( = ?auto_394960 ?auto_394965 ) ) ( not ( = ?auto_394960 ?auto_394966 ) ) ( not ( = ?auto_394960 ?auto_394967 ) ) ( not ( = ?auto_394960 ?auto_394968 ) ) ( not ( = ?auto_394961 ?auto_394962 ) ) ( not ( = ?auto_394961 ?auto_394963 ) ) ( not ( = ?auto_394961 ?auto_394964 ) ) ( not ( = ?auto_394961 ?auto_394965 ) ) ( not ( = ?auto_394961 ?auto_394966 ) ) ( not ( = ?auto_394961 ?auto_394967 ) ) ( not ( = ?auto_394961 ?auto_394968 ) ) ( not ( = ?auto_394962 ?auto_394963 ) ) ( not ( = ?auto_394962 ?auto_394964 ) ) ( not ( = ?auto_394962 ?auto_394965 ) ) ( not ( = ?auto_394962 ?auto_394966 ) ) ( not ( = ?auto_394962 ?auto_394967 ) ) ( not ( = ?auto_394962 ?auto_394968 ) ) ( not ( = ?auto_394963 ?auto_394964 ) ) ( not ( = ?auto_394963 ?auto_394965 ) ) ( not ( = ?auto_394963 ?auto_394966 ) ) ( not ( = ?auto_394963 ?auto_394967 ) ) ( not ( = ?auto_394963 ?auto_394968 ) ) ( not ( = ?auto_394964 ?auto_394965 ) ) ( not ( = ?auto_394964 ?auto_394966 ) ) ( not ( = ?auto_394964 ?auto_394967 ) ) ( not ( = ?auto_394964 ?auto_394968 ) ) ( not ( = ?auto_394965 ?auto_394966 ) ) ( not ( = ?auto_394965 ?auto_394967 ) ) ( not ( = ?auto_394965 ?auto_394968 ) ) ( not ( = ?auto_394966 ?auto_394967 ) ) ( not ( = ?auto_394966 ?auto_394968 ) ) ( not ( = ?auto_394967 ?auto_394968 ) ) ( ON ?auto_394966 ?auto_394967 ) ( ON ?auto_394965 ?auto_394966 ) ( ON ?auto_394964 ?auto_394965 ) ( ON ?auto_394963 ?auto_394964 ) ( CLEAR ?auto_394961 ) ( ON ?auto_394962 ?auto_394963 ) ( CLEAR ?auto_394962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_394955 ?auto_394956 ?auto_394957 ?auto_394958 ?auto_394959 ?auto_394960 ?auto_394961 ?auto_394962 )
      ( MAKE-13PILE ?auto_394955 ?auto_394956 ?auto_394957 ?auto_394958 ?auto_394959 ?auto_394960 ?auto_394961 ?auto_394962 ?auto_394963 ?auto_394964 ?auto_394965 ?auto_394966 ?auto_394967 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_394982 - BLOCK
      ?auto_394983 - BLOCK
      ?auto_394984 - BLOCK
      ?auto_394985 - BLOCK
      ?auto_394986 - BLOCK
      ?auto_394987 - BLOCK
      ?auto_394988 - BLOCK
      ?auto_394989 - BLOCK
      ?auto_394990 - BLOCK
      ?auto_394991 - BLOCK
      ?auto_394992 - BLOCK
      ?auto_394993 - BLOCK
      ?auto_394994 - BLOCK
    )
    :vars
    (
      ?auto_394995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_394994 ?auto_394995 ) ( ON-TABLE ?auto_394982 ) ( ON ?auto_394983 ?auto_394982 ) ( ON ?auto_394984 ?auto_394983 ) ( ON ?auto_394985 ?auto_394984 ) ( ON ?auto_394986 ?auto_394985 ) ( ON ?auto_394987 ?auto_394986 ) ( ON ?auto_394988 ?auto_394987 ) ( not ( = ?auto_394982 ?auto_394983 ) ) ( not ( = ?auto_394982 ?auto_394984 ) ) ( not ( = ?auto_394982 ?auto_394985 ) ) ( not ( = ?auto_394982 ?auto_394986 ) ) ( not ( = ?auto_394982 ?auto_394987 ) ) ( not ( = ?auto_394982 ?auto_394988 ) ) ( not ( = ?auto_394982 ?auto_394989 ) ) ( not ( = ?auto_394982 ?auto_394990 ) ) ( not ( = ?auto_394982 ?auto_394991 ) ) ( not ( = ?auto_394982 ?auto_394992 ) ) ( not ( = ?auto_394982 ?auto_394993 ) ) ( not ( = ?auto_394982 ?auto_394994 ) ) ( not ( = ?auto_394982 ?auto_394995 ) ) ( not ( = ?auto_394983 ?auto_394984 ) ) ( not ( = ?auto_394983 ?auto_394985 ) ) ( not ( = ?auto_394983 ?auto_394986 ) ) ( not ( = ?auto_394983 ?auto_394987 ) ) ( not ( = ?auto_394983 ?auto_394988 ) ) ( not ( = ?auto_394983 ?auto_394989 ) ) ( not ( = ?auto_394983 ?auto_394990 ) ) ( not ( = ?auto_394983 ?auto_394991 ) ) ( not ( = ?auto_394983 ?auto_394992 ) ) ( not ( = ?auto_394983 ?auto_394993 ) ) ( not ( = ?auto_394983 ?auto_394994 ) ) ( not ( = ?auto_394983 ?auto_394995 ) ) ( not ( = ?auto_394984 ?auto_394985 ) ) ( not ( = ?auto_394984 ?auto_394986 ) ) ( not ( = ?auto_394984 ?auto_394987 ) ) ( not ( = ?auto_394984 ?auto_394988 ) ) ( not ( = ?auto_394984 ?auto_394989 ) ) ( not ( = ?auto_394984 ?auto_394990 ) ) ( not ( = ?auto_394984 ?auto_394991 ) ) ( not ( = ?auto_394984 ?auto_394992 ) ) ( not ( = ?auto_394984 ?auto_394993 ) ) ( not ( = ?auto_394984 ?auto_394994 ) ) ( not ( = ?auto_394984 ?auto_394995 ) ) ( not ( = ?auto_394985 ?auto_394986 ) ) ( not ( = ?auto_394985 ?auto_394987 ) ) ( not ( = ?auto_394985 ?auto_394988 ) ) ( not ( = ?auto_394985 ?auto_394989 ) ) ( not ( = ?auto_394985 ?auto_394990 ) ) ( not ( = ?auto_394985 ?auto_394991 ) ) ( not ( = ?auto_394985 ?auto_394992 ) ) ( not ( = ?auto_394985 ?auto_394993 ) ) ( not ( = ?auto_394985 ?auto_394994 ) ) ( not ( = ?auto_394985 ?auto_394995 ) ) ( not ( = ?auto_394986 ?auto_394987 ) ) ( not ( = ?auto_394986 ?auto_394988 ) ) ( not ( = ?auto_394986 ?auto_394989 ) ) ( not ( = ?auto_394986 ?auto_394990 ) ) ( not ( = ?auto_394986 ?auto_394991 ) ) ( not ( = ?auto_394986 ?auto_394992 ) ) ( not ( = ?auto_394986 ?auto_394993 ) ) ( not ( = ?auto_394986 ?auto_394994 ) ) ( not ( = ?auto_394986 ?auto_394995 ) ) ( not ( = ?auto_394987 ?auto_394988 ) ) ( not ( = ?auto_394987 ?auto_394989 ) ) ( not ( = ?auto_394987 ?auto_394990 ) ) ( not ( = ?auto_394987 ?auto_394991 ) ) ( not ( = ?auto_394987 ?auto_394992 ) ) ( not ( = ?auto_394987 ?auto_394993 ) ) ( not ( = ?auto_394987 ?auto_394994 ) ) ( not ( = ?auto_394987 ?auto_394995 ) ) ( not ( = ?auto_394988 ?auto_394989 ) ) ( not ( = ?auto_394988 ?auto_394990 ) ) ( not ( = ?auto_394988 ?auto_394991 ) ) ( not ( = ?auto_394988 ?auto_394992 ) ) ( not ( = ?auto_394988 ?auto_394993 ) ) ( not ( = ?auto_394988 ?auto_394994 ) ) ( not ( = ?auto_394988 ?auto_394995 ) ) ( not ( = ?auto_394989 ?auto_394990 ) ) ( not ( = ?auto_394989 ?auto_394991 ) ) ( not ( = ?auto_394989 ?auto_394992 ) ) ( not ( = ?auto_394989 ?auto_394993 ) ) ( not ( = ?auto_394989 ?auto_394994 ) ) ( not ( = ?auto_394989 ?auto_394995 ) ) ( not ( = ?auto_394990 ?auto_394991 ) ) ( not ( = ?auto_394990 ?auto_394992 ) ) ( not ( = ?auto_394990 ?auto_394993 ) ) ( not ( = ?auto_394990 ?auto_394994 ) ) ( not ( = ?auto_394990 ?auto_394995 ) ) ( not ( = ?auto_394991 ?auto_394992 ) ) ( not ( = ?auto_394991 ?auto_394993 ) ) ( not ( = ?auto_394991 ?auto_394994 ) ) ( not ( = ?auto_394991 ?auto_394995 ) ) ( not ( = ?auto_394992 ?auto_394993 ) ) ( not ( = ?auto_394992 ?auto_394994 ) ) ( not ( = ?auto_394992 ?auto_394995 ) ) ( not ( = ?auto_394993 ?auto_394994 ) ) ( not ( = ?auto_394993 ?auto_394995 ) ) ( not ( = ?auto_394994 ?auto_394995 ) ) ( ON ?auto_394993 ?auto_394994 ) ( ON ?auto_394992 ?auto_394993 ) ( ON ?auto_394991 ?auto_394992 ) ( ON ?auto_394990 ?auto_394991 ) ( CLEAR ?auto_394988 ) ( ON ?auto_394989 ?auto_394990 ) ( CLEAR ?auto_394989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_394982 ?auto_394983 ?auto_394984 ?auto_394985 ?auto_394986 ?auto_394987 ?auto_394988 ?auto_394989 )
      ( MAKE-13PILE ?auto_394982 ?auto_394983 ?auto_394984 ?auto_394985 ?auto_394986 ?auto_394987 ?auto_394988 ?auto_394989 ?auto_394990 ?auto_394991 ?auto_394992 ?auto_394993 ?auto_394994 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395009 - BLOCK
      ?auto_395010 - BLOCK
      ?auto_395011 - BLOCK
      ?auto_395012 - BLOCK
      ?auto_395013 - BLOCK
      ?auto_395014 - BLOCK
      ?auto_395015 - BLOCK
      ?auto_395016 - BLOCK
      ?auto_395017 - BLOCK
      ?auto_395018 - BLOCK
      ?auto_395019 - BLOCK
      ?auto_395020 - BLOCK
      ?auto_395021 - BLOCK
    )
    :vars
    (
      ?auto_395022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395021 ?auto_395022 ) ( ON-TABLE ?auto_395009 ) ( ON ?auto_395010 ?auto_395009 ) ( ON ?auto_395011 ?auto_395010 ) ( ON ?auto_395012 ?auto_395011 ) ( ON ?auto_395013 ?auto_395012 ) ( ON ?auto_395014 ?auto_395013 ) ( not ( = ?auto_395009 ?auto_395010 ) ) ( not ( = ?auto_395009 ?auto_395011 ) ) ( not ( = ?auto_395009 ?auto_395012 ) ) ( not ( = ?auto_395009 ?auto_395013 ) ) ( not ( = ?auto_395009 ?auto_395014 ) ) ( not ( = ?auto_395009 ?auto_395015 ) ) ( not ( = ?auto_395009 ?auto_395016 ) ) ( not ( = ?auto_395009 ?auto_395017 ) ) ( not ( = ?auto_395009 ?auto_395018 ) ) ( not ( = ?auto_395009 ?auto_395019 ) ) ( not ( = ?auto_395009 ?auto_395020 ) ) ( not ( = ?auto_395009 ?auto_395021 ) ) ( not ( = ?auto_395009 ?auto_395022 ) ) ( not ( = ?auto_395010 ?auto_395011 ) ) ( not ( = ?auto_395010 ?auto_395012 ) ) ( not ( = ?auto_395010 ?auto_395013 ) ) ( not ( = ?auto_395010 ?auto_395014 ) ) ( not ( = ?auto_395010 ?auto_395015 ) ) ( not ( = ?auto_395010 ?auto_395016 ) ) ( not ( = ?auto_395010 ?auto_395017 ) ) ( not ( = ?auto_395010 ?auto_395018 ) ) ( not ( = ?auto_395010 ?auto_395019 ) ) ( not ( = ?auto_395010 ?auto_395020 ) ) ( not ( = ?auto_395010 ?auto_395021 ) ) ( not ( = ?auto_395010 ?auto_395022 ) ) ( not ( = ?auto_395011 ?auto_395012 ) ) ( not ( = ?auto_395011 ?auto_395013 ) ) ( not ( = ?auto_395011 ?auto_395014 ) ) ( not ( = ?auto_395011 ?auto_395015 ) ) ( not ( = ?auto_395011 ?auto_395016 ) ) ( not ( = ?auto_395011 ?auto_395017 ) ) ( not ( = ?auto_395011 ?auto_395018 ) ) ( not ( = ?auto_395011 ?auto_395019 ) ) ( not ( = ?auto_395011 ?auto_395020 ) ) ( not ( = ?auto_395011 ?auto_395021 ) ) ( not ( = ?auto_395011 ?auto_395022 ) ) ( not ( = ?auto_395012 ?auto_395013 ) ) ( not ( = ?auto_395012 ?auto_395014 ) ) ( not ( = ?auto_395012 ?auto_395015 ) ) ( not ( = ?auto_395012 ?auto_395016 ) ) ( not ( = ?auto_395012 ?auto_395017 ) ) ( not ( = ?auto_395012 ?auto_395018 ) ) ( not ( = ?auto_395012 ?auto_395019 ) ) ( not ( = ?auto_395012 ?auto_395020 ) ) ( not ( = ?auto_395012 ?auto_395021 ) ) ( not ( = ?auto_395012 ?auto_395022 ) ) ( not ( = ?auto_395013 ?auto_395014 ) ) ( not ( = ?auto_395013 ?auto_395015 ) ) ( not ( = ?auto_395013 ?auto_395016 ) ) ( not ( = ?auto_395013 ?auto_395017 ) ) ( not ( = ?auto_395013 ?auto_395018 ) ) ( not ( = ?auto_395013 ?auto_395019 ) ) ( not ( = ?auto_395013 ?auto_395020 ) ) ( not ( = ?auto_395013 ?auto_395021 ) ) ( not ( = ?auto_395013 ?auto_395022 ) ) ( not ( = ?auto_395014 ?auto_395015 ) ) ( not ( = ?auto_395014 ?auto_395016 ) ) ( not ( = ?auto_395014 ?auto_395017 ) ) ( not ( = ?auto_395014 ?auto_395018 ) ) ( not ( = ?auto_395014 ?auto_395019 ) ) ( not ( = ?auto_395014 ?auto_395020 ) ) ( not ( = ?auto_395014 ?auto_395021 ) ) ( not ( = ?auto_395014 ?auto_395022 ) ) ( not ( = ?auto_395015 ?auto_395016 ) ) ( not ( = ?auto_395015 ?auto_395017 ) ) ( not ( = ?auto_395015 ?auto_395018 ) ) ( not ( = ?auto_395015 ?auto_395019 ) ) ( not ( = ?auto_395015 ?auto_395020 ) ) ( not ( = ?auto_395015 ?auto_395021 ) ) ( not ( = ?auto_395015 ?auto_395022 ) ) ( not ( = ?auto_395016 ?auto_395017 ) ) ( not ( = ?auto_395016 ?auto_395018 ) ) ( not ( = ?auto_395016 ?auto_395019 ) ) ( not ( = ?auto_395016 ?auto_395020 ) ) ( not ( = ?auto_395016 ?auto_395021 ) ) ( not ( = ?auto_395016 ?auto_395022 ) ) ( not ( = ?auto_395017 ?auto_395018 ) ) ( not ( = ?auto_395017 ?auto_395019 ) ) ( not ( = ?auto_395017 ?auto_395020 ) ) ( not ( = ?auto_395017 ?auto_395021 ) ) ( not ( = ?auto_395017 ?auto_395022 ) ) ( not ( = ?auto_395018 ?auto_395019 ) ) ( not ( = ?auto_395018 ?auto_395020 ) ) ( not ( = ?auto_395018 ?auto_395021 ) ) ( not ( = ?auto_395018 ?auto_395022 ) ) ( not ( = ?auto_395019 ?auto_395020 ) ) ( not ( = ?auto_395019 ?auto_395021 ) ) ( not ( = ?auto_395019 ?auto_395022 ) ) ( not ( = ?auto_395020 ?auto_395021 ) ) ( not ( = ?auto_395020 ?auto_395022 ) ) ( not ( = ?auto_395021 ?auto_395022 ) ) ( ON ?auto_395020 ?auto_395021 ) ( ON ?auto_395019 ?auto_395020 ) ( ON ?auto_395018 ?auto_395019 ) ( ON ?auto_395017 ?auto_395018 ) ( ON ?auto_395016 ?auto_395017 ) ( CLEAR ?auto_395014 ) ( ON ?auto_395015 ?auto_395016 ) ( CLEAR ?auto_395015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_395009 ?auto_395010 ?auto_395011 ?auto_395012 ?auto_395013 ?auto_395014 ?auto_395015 )
      ( MAKE-13PILE ?auto_395009 ?auto_395010 ?auto_395011 ?auto_395012 ?auto_395013 ?auto_395014 ?auto_395015 ?auto_395016 ?auto_395017 ?auto_395018 ?auto_395019 ?auto_395020 ?auto_395021 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395036 - BLOCK
      ?auto_395037 - BLOCK
      ?auto_395038 - BLOCK
      ?auto_395039 - BLOCK
      ?auto_395040 - BLOCK
      ?auto_395041 - BLOCK
      ?auto_395042 - BLOCK
      ?auto_395043 - BLOCK
      ?auto_395044 - BLOCK
      ?auto_395045 - BLOCK
      ?auto_395046 - BLOCK
      ?auto_395047 - BLOCK
      ?auto_395048 - BLOCK
    )
    :vars
    (
      ?auto_395049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395048 ?auto_395049 ) ( ON-TABLE ?auto_395036 ) ( ON ?auto_395037 ?auto_395036 ) ( ON ?auto_395038 ?auto_395037 ) ( ON ?auto_395039 ?auto_395038 ) ( ON ?auto_395040 ?auto_395039 ) ( ON ?auto_395041 ?auto_395040 ) ( not ( = ?auto_395036 ?auto_395037 ) ) ( not ( = ?auto_395036 ?auto_395038 ) ) ( not ( = ?auto_395036 ?auto_395039 ) ) ( not ( = ?auto_395036 ?auto_395040 ) ) ( not ( = ?auto_395036 ?auto_395041 ) ) ( not ( = ?auto_395036 ?auto_395042 ) ) ( not ( = ?auto_395036 ?auto_395043 ) ) ( not ( = ?auto_395036 ?auto_395044 ) ) ( not ( = ?auto_395036 ?auto_395045 ) ) ( not ( = ?auto_395036 ?auto_395046 ) ) ( not ( = ?auto_395036 ?auto_395047 ) ) ( not ( = ?auto_395036 ?auto_395048 ) ) ( not ( = ?auto_395036 ?auto_395049 ) ) ( not ( = ?auto_395037 ?auto_395038 ) ) ( not ( = ?auto_395037 ?auto_395039 ) ) ( not ( = ?auto_395037 ?auto_395040 ) ) ( not ( = ?auto_395037 ?auto_395041 ) ) ( not ( = ?auto_395037 ?auto_395042 ) ) ( not ( = ?auto_395037 ?auto_395043 ) ) ( not ( = ?auto_395037 ?auto_395044 ) ) ( not ( = ?auto_395037 ?auto_395045 ) ) ( not ( = ?auto_395037 ?auto_395046 ) ) ( not ( = ?auto_395037 ?auto_395047 ) ) ( not ( = ?auto_395037 ?auto_395048 ) ) ( not ( = ?auto_395037 ?auto_395049 ) ) ( not ( = ?auto_395038 ?auto_395039 ) ) ( not ( = ?auto_395038 ?auto_395040 ) ) ( not ( = ?auto_395038 ?auto_395041 ) ) ( not ( = ?auto_395038 ?auto_395042 ) ) ( not ( = ?auto_395038 ?auto_395043 ) ) ( not ( = ?auto_395038 ?auto_395044 ) ) ( not ( = ?auto_395038 ?auto_395045 ) ) ( not ( = ?auto_395038 ?auto_395046 ) ) ( not ( = ?auto_395038 ?auto_395047 ) ) ( not ( = ?auto_395038 ?auto_395048 ) ) ( not ( = ?auto_395038 ?auto_395049 ) ) ( not ( = ?auto_395039 ?auto_395040 ) ) ( not ( = ?auto_395039 ?auto_395041 ) ) ( not ( = ?auto_395039 ?auto_395042 ) ) ( not ( = ?auto_395039 ?auto_395043 ) ) ( not ( = ?auto_395039 ?auto_395044 ) ) ( not ( = ?auto_395039 ?auto_395045 ) ) ( not ( = ?auto_395039 ?auto_395046 ) ) ( not ( = ?auto_395039 ?auto_395047 ) ) ( not ( = ?auto_395039 ?auto_395048 ) ) ( not ( = ?auto_395039 ?auto_395049 ) ) ( not ( = ?auto_395040 ?auto_395041 ) ) ( not ( = ?auto_395040 ?auto_395042 ) ) ( not ( = ?auto_395040 ?auto_395043 ) ) ( not ( = ?auto_395040 ?auto_395044 ) ) ( not ( = ?auto_395040 ?auto_395045 ) ) ( not ( = ?auto_395040 ?auto_395046 ) ) ( not ( = ?auto_395040 ?auto_395047 ) ) ( not ( = ?auto_395040 ?auto_395048 ) ) ( not ( = ?auto_395040 ?auto_395049 ) ) ( not ( = ?auto_395041 ?auto_395042 ) ) ( not ( = ?auto_395041 ?auto_395043 ) ) ( not ( = ?auto_395041 ?auto_395044 ) ) ( not ( = ?auto_395041 ?auto_395045 ) ) ( not ( = ?auto_395041 ?auto_395046 ) ) ( not ( = ?auto_395041 ?auto_395047 ) ) ( not ( = ?auto_395041 ?auto_395048 ) ) ( not ( = ?auto_395041 ?auto_395049 ) ) ( not ( = ?auto_395042 ?auto_395043 ) ) ( not ( = ?auto_395042 ?auto_395044 ) ) ( not ( = ?auto_395042 ?auto_395045 ) ) ( not ( = ?auto_395042 ?auto_395046 ) ) ( not ( = ?auto_395042 ?auto_395047 ) ) ( not ( = ?auto_395042 ?auto_395048 ) ) ( not ( = ?auto_395042 ?auto_395049 ) ) ( not ( = ?auto_395043 ?auto_395044 ) ) ( not ( = ?auto_395043 ?auto_395045 ) ) ( not ( = ?auto_395043 ?auto_395046 ) ) ( not ( = ?auto_395043 ?auto_395047 ) ) ( not ( = ?auto_395043 ?auto_395048 ) ) ( not ( = ?auto_395043 ?auto_395049 ) ) ( not ( = ?auto_395044 ?auto_395045 ) ) ( not ( = ?auto_395044 ?auto_395046 ) ) ( not ( = ?auto_395044 ?auto_395047 ) ) ( not ( = ?auto_395044 ?auto_395048 ) ) ( not ( = ?auto_395044 ?auto_395049 ) ) ( not ( = ?auto_395045 ?auto_395046 ) ) ( not ( = ?auto_395045 ?auto_395047 ) ) ( not ( = ?auto_395045 ?auto_395048 ) ) ( not ( = ?auto_395045 ?auto_395049 ) ) ( not ( = ?auto_395046 ?auto_395047 ) ) ( not ( = ?auto_395046 ?auto_395048 ) ) ( not ( = ?auto_395046 ?auto_395049 ) ) ( not ( = ?auto_395047 ?auto_395048 ) ) ( not ( = ?auto_395047 ?auto_395049 ) ) ( not ( = ?auto_395048 ?auto_395049 ) ) ( ON ?auto_395047 ?auto_395048 ) ( ON ?auto_395046 ?auto_395047 ) ( ON ?auto_395045 ?auto_395046 ) ( ON ?auto_395044 ?auto_395045 ) ( ON ?auto_395043 ?auto_395044 ) ( CLEAR ?auto_395041 ) ( ON ?auto_395042 ?auto_395043 ) ( CLEAR ?auto_395042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_395036 ?auto_395037 ?auto_395038 ?auto_395039 ?auto_395040 ?auto_395041 ?auto_395042 )
      ( MAKE-13PILE ?auto_395036 ?auto_395037 ?auto_395038 ?auto_395039 ?auto_395040 ?auto_395041 ?auto_395042 ?auto_395043 ?auto_395044 ?auto_395045 ?auto_395046 ?auto_395047 ?auto_395048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395063 - BLOCK
      ?auto_395064 - BLOCK
      ?auto_395065 - BLOCK
      ?auto_395066 - BLOCK
      ?auto_395067 - BLOCK
      ?auto_395068 - BLOCK
      ?auto_395069 - BLOCK
      ?auto_395070 - BLOCK
      ?auto_395071 - BLOCK
      ?auto_395072 - BLOCK
      ?auto_395073 - BLOCK
      ?auto_395074 - BLOCK
      ?auto_395075 - BLOCK
    )
    :vars
    (
      ?auto_395076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395075 ?auto_395076 ) ( ON-TABLE ?auto_395063 ) ( ON ?auto_395064 ?auto_395063 ) ( ON ?auto_395065 ?auto_395064 ) ( ON ?auto_395066 ?auto_395065 ) ( ON ?auto_395067 ?auto_395066 ) ( not ( = ?auto_395063 ?auto_395064 ) ) ( not ( = ?auto_395063 ?auto_395065 ) ) ( not ( = ?auto_395063 ?auto_395066 ) ) ( not ( = ?auto_395063 ?auto_395067 ) ) ( not ( = ?auto_395063 ?auto_395068 ) ) ( not ( = ?auto_395063 ?auto_395069 ) ) ( not ( = ?auto_395063 ?auto_395070 ) ) ( not ( = ?auto_395063 ?auto_395071 ) ) ( not ( = ?auto_395063 ?auto_395072 ) ) ( not ( = ?auto_395063 ?auto_395073 ) ) ( not ( = ?auto_395063 ?auto_395074 ) ) ( not ( = ?auto_395063 ?auto_395075 ) ) ( not ( = ?auto_395063 ?auto_395076 ) ) ( not ( = ?auto_395064 ?auto_395065 ) ) ( not ( = ?auto_395064 ?auto_395066 ) ) ( not ( = ?auto_395064 ?auto_395067 ) ) ( not ( = ?auto_395064 ?auto_395068 ) ) ( not ( = ?auto_395064 ?auto_395069 ) ) ( not ( = ?auto_395064 ?auto_395070 ) ) ( not ( = ?auto_395064 ?auto_395071 ) ) ( not ( = ?auto_395064 ?auto_395072 ) ) ( not ( = ?auto_395064 ?auto_395073 ) ) ( not ( = ?auto_395064 ?auto_395074 ) ) ( not ( = ?auto_395064 ?auto_395075 ) ) ( not ( = ?auto_395064 ?auto_395076 ) ) ( not ( = ?auto_395065 ?auto_395066 ) ) ( not ( = ?auto_395065 ?auto_395067 ) ) ( not ( = ?auto_395065 ?auto_395068 ) ) ( not ( = ?auto_395065 ?auto_395069 ) ) ( not ( = ?auto_395065 ?auto_395070 ) ) ( not ( = ?auto_395065 ?auto_395071 ) ) ( not ( = ?auto_395065 ?auto_395072 ) ) ( not ( = ?auto_395065 ?auto_395073 ) ) ( not ( = ?auto_395065 ?auto_395074 ) ) ( not ( = ?auto_395065 ?auto_395075 ) ) ( not ( = ?auto_395065 ?auto_395076 ) ) ( not ( = ?auto_395066 ?auto_395067 ) ) ( not ( = ?auto_395066 ?auto_395068 ) ) ( not ( = ?auto_395066 ?auto_395069 ) ) ( not ( = ?auto_395066 ?auto_395070 ) ) ( not ( = ?auto_395066 ?auto_395071 ) ) ( not ( = ?auto_395066 ?auto_395072 ) ) ( not ( = ?auto_395066 ?auto_395073 ) ) ( not ( = ?auto_395066 ?auto_395074 ) ) ( not ( = ?auto_395066 ?auto_395075 ) ) ( not ( = ?auto_395066 ?auto_395076 ) ) ( not ( = ?auto_395067 ?auto_395068 ) ) ( not ( = ?auto_395067 ?auto_395069 ) ) ( not ( = ?auto_395067 ?auto_395070 ) ) ( not ( = ?auto_395067 ?auto_395071 ) ) ( not ( = ?auto_395067 ?auto_395072 ) ) ( not ( = ?auto_395067 ?auto_395073 ) ) ( not ( = ?auto_395067 ?auto_395074 ) ) ( not ( = ?auto_395067 ?auto_395075 ) ) ( not ( = ?auto_395067 ?auto_395076 ) ) ( not ( = ?auto_395068 ?auto_395069 ) ) ( not ( = ?auto_395068 ?auto_395070 ) ) ( not ( = ?auto_395068 ?auto_395071 ) ) ( not ( = ?auto_395068 ?auto_395072 ) ) ( not ( = ?auto_395068 ?auto_395073 ) ) ( not ( = ?auto_395068 ?auto_395074 ) ) ( not ( = ?auto_395068 ?auto_395075 ) ) ( not ( = ?auto_395068 ?auto_395076 ) ) ( not ( = ?auto_395069 ?auto_395070 ) ) ( not ( = ?auto_395069 ?auto_395071 ) ) ( not ( = ?auto_395069 ?auto_395072 ) ) ( not ( = ?auto_395069 ?auto_395073 ) ) ( not ( = ?auto_395069 ?auto_395074 ) ) ( not ( = ?auto_395069 ?auto_395075 ) ) ( not ( = ?auto_395069 ?auto_395076 ) ) ( not ( = ?auto_395070 ?auto_395071 ) ) ( not ( = ?auto_395070 ?auto_395072 ) ) ( not ( = ?auto_395070 ?auto_395073 ) ) ( not ( = ?auto_395070 ?auto_395074 ) ) ( not ( = ?auto_395070 ?auto_395075 ) ) ( not ( = ?auto_395070 ?auto_395076 ) ) ( not ( = ?auto_395071 ?auto_395072 ) ) ( not ( = ?auto_395071 ?auto_395073 ) ) ( not ( = ?auto_395071 ?auto_395074 ) ) ( not ( = ?auto_395071 ?auto_395075 ) ) ( not ( = ?auto_395071 ?auto_395076 ) ) ( not ( = ?auto_395072 ?auto_395073 ) ) ( not ( = ?auto_395072 ?auto_395074 ) ) ( not ( = ?auto_395072 ?auto_395075 ) ) ( not ( = ?auto_395072 ?auto_395076 ) ) ( not ( = ?auto_395073 ?auto_395074 ) ) ( not ( = ?auto_395073 ?auto_395075 ) ) ( not ( = ?auto_395073 ?auto_395076 ) ) ( not ( = ?auto_395074 ?auto_395075 ) ) ( not ( = ?auto_395074 ?auto_395076 ) ) ( not ( = ?auto_395075 ?auto_395076 ) ) ( ON ?auto_395074 ?auto_395075 ) ( ON ?auto_395073 ?auto_395074 ) ( ON ?auto_395072 ?auto_395073 ) ( ON ?auto_395071 ?auto_395072 ) ( ON ?auto_395070 ?auto_395071 ) ( ON ?auto_395069 ?auto_395070 ) ( CLEAR ?auto_395067 ) ( ON ?auto_395068 ?auto_395069 ) ( CLEAR ?auto_395068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_395063 ?auto_395064 ?auto_395065 ?auto_395066 ?auto_395067 ?auto_395068 )
      ( MAKE-13PILE ?auto_395063 ?auto_395064 ?auto_395065 ?auto_395066 ?auto_395067 ?auto_395068 ?auto_395069 ?auto_395070 ?auto_395071 ?auto_395072 ?auto_395073 ?auto_395074 ?auto_395075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395090 - BLOCK
      ?auto_395091 - BLOCK
      ?auto_395092 - BLOCK
      ?auto_395093 - BLOCK
      ?auto_395094 - BLOCK
      ?auto_395095 - BLOCK
      ?auto_395096 - BLOCK
      ?auto_395097 - BLOCK
      ?auto_395098 - BLOCK
      ?auto_395099 - BLOCK
      ?auto_395100 - BLOCK
      ?auto_395101 - BLOCK
      ?auto_395102 - BLOCK
    )
    :vars
    (
      ?auto_395103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395102 ?auto_395103 ) ( ON-TABLE ?auto_395090 ) ( ON ?auto_395091 ?auto_395090 ) ( ON ?auto_395092 ?auto_395091 ) ( ON ?auto_395093 ?auto_395092 ) ( ON ?auto_395094 ?auto_395093 ) ( not ( = ?auto_395090 ?auto_395091 ) ) ( not ( = ?auto_395090 ?auto_395092 ) ) ( not ( = ?auto_395090 ?auto_395093 ) ) ( not ( = ?auto_395090 ?auto_395094 ) ) ( not ( = ?auto_395090 ?auto_395095 ) ) ( not ( = ?auto_395090 ?auto_395096 ) ) ( not ( = ?auto_395090 ?auto_395097 ) ) ( not ( = ?auto_395090 ?auto_395098 ) ) ( not ( = ?auto_395090 ?auto_395099 ) ) ( not ( = ?auto_395090 ?auto_395100 ) ) ( not ( = ?auto_395090 ?auto_395101 ) ) ( not ( = ?auto_395090 ?auto_395102 ) ) ( not ( = ?auto_395090 ?auto_395103 ) ) ( not ( = ?auto_395091 ?auto_395092 ) ) ( not ( = ?auto_395091 ?auto_395093 ) ) ( not ( = ?auto_395091 ?auto_395094 ) ) ( not ( = ?auto_395091 ?auto_395095 ) ) ( not ( = ?auto_395091 ?auto_395096 ) ) ( not ( = ?auto_395091 ?auto_395097 ) ) ( not ( = ?auto_395091 ?auto_395098 ) ) ( not ( = ?auto_395091 ?auto_395099 ) ) ( not ( = ?auto_395091 ?auto_395100 ) ) ( not ( = ?auto_395091 ?auto_395101 ) ) ( not ( = ?auto_395091 ?auto_395102 ) ) ( not ( = ?auto_395091 ?auto_395103 ) ) ( not ( = ?auto_395092 ?auto_395093 ) ) ( not ( = ?auto_395092 ?auto_395094 ) ) ( not ( = ?auto_395092 ?auto_395095 ) ) ( not ( = ?auto_395092 ?auto_395096 ) ) ( not ( = ?auto_395092 ?auto_395097 ) ) ( not ( = ?auto_395092 ?auto_395098 ) ) ( not ( = ?auto_395092 ?auto_395099 ) ) ( not ( = ?auto_395092 ?auto_395100 ) ) ( not ( = ?auto_395092 ?auto_395101 ) ) ( not ( = ?auto_395092 ?auto_395102 ) ) ( not ( = ?auto_395092 ?auto_395103 ) ) ( not ( = ?auto_395093 ?auto_395094 ) ) ( not ( = ?auto_395093 ?auto_395095 ) ) ( not ( = ?auto_395093 ?auto_395096 ) ) ( not ( = ?auto_395093 ?auto_395097 ) ) ( not ( = ?auto_395093 ?auto_395098 ) ) ( not ( = ?auto_395093 ?auto_395099 ) ) ( not ( = ?auto_395093 ?auto_395100 ) ) ( not ( = ?auto_395093 ?auto_395101 ) ) ( not ( = ?auto_395093 ?auto_395102 ) ) ( not ( = ?auto_395093 ?auto_395103 ) ) ( not ( = ?auto_395094 ?auto_395095 ) ) ( not ( = ?auto_395094 ?auto_395096 ) ) ( not ( = ?auto_395094 ?auto_395097 ) ) ( not ( = ?auto_395094 ?auto_395098 ) ) ( not ( = ?auto_395094 ?auto_395099 ) ) ( not ( = ?auto_395094 ?auto_395100 ) ) ( not ( = ?auto_395094 ?auto_395101 ) ) ( not ( = ?auto_395094 ?auto_395102 ) ) ( not ( = ?auto_395094 ?auto_395103 ) ) ( not ( = ?auto_395095 ?auto_395096 ) ) ( not ( = ?auto_395095 ?auto_395097 ) ) ( not ( = ?auto_395095 ?auto_395098 ) ) ( not ( = ?auto_395095 ?auto_395099 ) ) ( not ( = ?auto_395095 ?auto_395100 ) ) ( not ( = ?auto_395095 ?auto_395101 ) ) ( not ( = ?auto_395095 ?auto_395102 ) ) ( not ( = ?auto_395095 ?auto_395103 ) ) ( not ( = ?auto_395096 ?auto_395097 ) ) ( not ( = ?auto_395096 ?auto_395098 ) ) ( not ( = ?auto_395096 ?auto_395099 ) ) ( not ( = ?auto_395096 ?auto_395100 ) ) ( not ( = ?auto_395096 ?auto_395101 ) ) ( not ( = ?auto_395096 ?auto_395102 ) ) ( not ( = ?auto_395096 ?auto_395103 ) ) ( not ( = ?auto_395097 ?auto_395098 ) ) ( not ( = ?auto_395097 ?auto_395099 ) ) ( not ( = ?auto_395097 ?auto_395100 ) ) ( not ( = ?auto_395097 ?auto_395101 ) ) ( not ( = ?auto_395097 ?auto_395102 ) ) ( not ( = ?auto_395097 ?auto_395103 ) ) ( not ( = ?auto_395098 ?auto_395099 ) ) ( not ( = ?auto_395098 ?auto_395100 ) ) ( not ( = ?auto_395098 ?auto_395101 ) ) ( not ( = ?auto_395098 ?auto_395102 ) ) ( not ( = ?auto_395098 ?auto_395103 ) ) ( not ( = ?auto_395099 ?auto_395100 ) ) ( not ( = ?auto_395099 ?auto_395101 ) ) ( not ( = ?auto_395099 ?auto_395102 ) ) ( not ( = ?auto_395099 ?auto_395103 ) ) ( not ( = ?auto_395100 ?auto_395101 ) ) ( not ( = ?auto_395100 ?auto_395102 ) ) ( not ( = ?auto_395100 ?auto_395103 ) ) ( not ( = ?auto_395101 ?auto_395102 ) ) ( not ( = ?auto_395101 ?auto_395103 ) ) ( not ( = ?auto_395102 ?auto_395103 ) ) ( ON ?auto_395101 ?auto_395102 ) ( ON ?auto_395100 ?auto_395101 ) ( ON ?auto_395099 ?auto_395100 ) ( ON ?auto_395098 ?auto_395099 ) ( ON ?auto_395097 ?auto_395098 ) ( ON ?auto_395096 ?auto_395097 ) ( CLEAR ?auto_395094 ) ( ON ?auto_395095 ?auto_395096 ) ( CLEAR ?auto_395095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_395090 ?auto_395091 ?auto_395092 ?auto_395093 ?auto_395094 ?auto_395095 )
      ( MAKE-13PILE ?auto_395090 ?auto_395091 ?auto_395092 ?auto_395093 ?auto_395094 ?auto_395095 ?auto_395096 ?auto_395097 ?auto_395098 ?auto_395099 ?auto_395100 ?auto_395101 ?auto_395102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395117 - BLOCK
      ?auto_395118 - BLOCK
      ?auto_395119 - BLOCK
      ?auto_395120 - BLOCK
      ?auto_395121 - BLOCK
      ?auto_395122 - BLOCK
      ?auto_395123 - BLOCK
      ?auto_395124 - BLOCK
      ?auto_395125 - BLOCK
      ?auto_395126 - BLOCK
      ?auto_395127 - BLOCK
      ?auto_395128 - BLOCK
      ?auto_395129 - BLOCK
    )
    :vars
    (
      ?auto_395130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395129 ?auto_395130 ) ( ON-TABLE ?auto_395117 ) ( ON ?auto_395118 ?auto_395117 ) ( ON ?auto_395119 ?auto_395118 ) ( ON ?auto_395120 ?auto_395119 ) ( not ( = ?auto_395117 ?auto_395118 ) ) ( not ( = ?auto_395117 ?auto_395119 ) ) ( not ( = ?auto_395117 ?auto_395120 ) ) ( not ( = ?auto_395117 ?auto_395121 ) ) ( not ( = ?auto_395117 ?auto_395122 ) ) ( not ( = ?auto_395117 ?auto_395123 ) ) ( not ( = ?auto_395117 ?auto_395124 ) ) ( not ( = ?auto_395117 ?auto_395125 ) ) ( not ( = ?auto_395117 ?auto_395126 ) ) ( not ( = ?auto_395117 ?auto_395127 ) ) ( not ( = ?auto_395117 ?auto_395128 ) ) ( not ( = ?auto_395117 ?auto_395129 ) ) ( not ( = ?auto_395117 ?auto_395130 ) ) ( not ( = ?auto_395118 ?auto_395119 ) ) ( not ( = ?auto_395118 ?auto_395120 ) ) ( not ( = ?auto_395118 ?auto_395121 ) ) ( not ( = ?auto_395118 ?auto_395122 ) ) ( not ( = ?auto_395118 ?auto_395123 ) ) ( not ( = ?auto_395118 ?auto_395124 ) ) ( not ( = ?auto_395118 ?auto_395125 ) ) ( not ( = ?auto_395118 ?auto_395126 ) ) ( not ( = ?auto_395118 ?auto_395127 ) ) ( not ( = ?auto_395118 ?auto_395128 ) ) ( not ( = ?auto_395118 ?auto_395129 ) ) ( not ( = ?auto_395118 ?auto_395130 ) ) ( not ( = ?auto_395119 ?auto_395120 ) ) ( not ( = ?auto_395119 ?auto_395121 ) ) ( not ( = ?auto_395119 ?auto_395122 ) ) ( not ( = ?auto_395119 ?auto_395123 ) ) ( not ( = ?auto_395119 ?auto_395124 ) ) ( not ( = ?auto_395119 ?auto_395125 ) ) ( not ( = ?auto_395119 ?auto_395126 ) ) ( not ( = ?auto_395119 ?auto_395127 ) ) ( not ( = ?auto_395119 ?auto_395128 ) ) ( not ( = ?auto_395119 ?auto_395129 ) ) ( not ( = ?auto_395119 ?auto_395130 ) ) ( not ( = ?auto_395120 ?auto_395121 ) ) ( not ( = ?auto_395120 ?auto_395122 ) ) ( not ( = ?auto_395120 ?auto_395123 ) ) ( not ( = ?auto_395120 ?auto_395124 ) ) ( not ( = ?auto_395120 ?auto_395125 ) ) ( not ( = ?auto_395120 ?auto_395126 ) ) ( not ( = ?auto_395120 ?auto_395127 ) ) ( not ( = ?auto_395120 ?auto_395128 ) ) ( not ( = ?auto_395120 ?auto_395129 ) ) ( not ( = ?auto_395120 ?auto_395130 ) ) ( not ( = ?auto_395121 ?auto_395122 ) ) ( not ( = ?auto_395121 ?auto_395123 ) ) ( not ( = ?auto_395121 ?auto_395124 ) ) ( not ( = ?auto_395121 ?auto_395125 ) ) ( not ( = ?auto_395121 ?auto_395126 ) ) ( not ( = ?auto_395121 ?auto_395127 ) ) ( not ( = ?auto_395121 ?auto_395128 ) ) ( not ( = ?auto_395121 ?auto_395129 ) ) ( not ( = ?auto_395121 ?auto_395130 ) ) ( not ( = ?auto_395122 ?auto_395123 ) ) ( not ( = ?auto_395122 ?auto_395124 ) ) ( not ( = ?auto_395122 ?auto_395125 ) ) ( not ( = ?auto_395122 ?auto_395126 ) ) ( not ( = ?auto_395122 ?auto_395127 ) ) ( not ( = ?auto_395122 ?auto_395128 ) ) ( not ( = ?auto_395122 ?auto_395129 ) ) ( not ( = ?auto_395122 ?auto_395130 ) ) ( not ( = ?auto_395123 ?auto_395124 ) ) ( not ( = ?auto_395123 ?auto_395125 ) ) ( not ( = ?auto_395123 ?auto_395126 ) ) ( not ( = ?auto_395123 ?auto_395127 ) ) ( not ( = ?auto_395123 ?auto_395128 ) ) ( not ( = ?auto_395123 ?auto_395129 ) ) ( not ( = ?auto_395123 ?auto_395130 ) ) ( not ( = ?auto_395124 ?auto_395125 ) ) ( not ( = ?auto_395124 ?auto_395126 ) ) ( not ( = ?auto_395124 ?auto_395127 ) ) ( not ( = ?auto_395124 ?auto_395128 ) ) ( not ( = ?auto_395124 ?auto_395129 ) ) ( not ( = ?auto_395124 ?auto_395130 ) ) ( not ( = ?auto_395125 ?auto_395126 ) ) ( not ( = ?auto_395125 ?auto_395127 ) ) ( not ( = ?auto_395125 ?auto_395128 ) ) ( not ( = ?auto_395125 ?auto_395129 ) ) ( not ( = ?auto_395125 ?auto_395130 ) ) ( not ( = ?auto_395126 ?auto_395127 ) ) ( not ( = ?auto_395126 ?auto_395128 ) ) ( not ( = ?auto_395126 ?auto_395129 ) ) ( not ( = ?auto_395126 ?auto_395130 ) ) ( not ( = ?auto_395127 ?auto_395128 ) ) ( not ( = ?auto_395127 ?auto_395129 ) ) ( not ( = ?auto_395127 ?auto_395130 ) ) ( not ( = ?auto_395128 ?auto_395129 ) ) ( not ( = ?auto_395128 ?auto_395130 ) ) ( not ( = ?auto_395129 ?auto_395130 ) ) ( ON ?auto_395128 ?auto_395129 ) ( ON ?auto_395127 ?auto_395128 ) ( ON ?auto_395126 ?auto_395127 ) ( ON ?auto_395125 ?auto_395126 ) ( ON ?auto_395124 ?auto_395125 ) ( ON ?auto_395123 ?auto_395124 ) ( ON ?auto_395122 ?auto_395123 ) ( CLEAR ?auto_395120 ) ( ON ?auto_395121 ?auto_395122 ) ( CLEAR ?auto_395121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_395117 ?auto_395118 ?auto_395119 ?auto_395120 ?auto_395121 )
      ( MAKE-13PILE ?auto_395117 ?auto_395118 ?auto_395119 ?auto_395120 ?auto_395121 ?auto_395122 ?auto_395123 ?auto_395124 ?auto_395125 ?auto_395126 ?auto_395127 ?auto_395128 ?auto_395129 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395144 - BLOCK
      ?auto_395145 - BLOCK
      ?auto_395146 - BLOCK
      ?auto_395147 - BLOCK
      ?auto_395148 - BLOCK
      ?auto_395149 - BLOCK
      ?auto_395150 - BLOCK
      ?auto_395151 - BLOCK
      ?auto_395152 - BLOCK
      ?auto_395153 - BLOCK
      ?auto_395154 - BLOCK
      ?auto_395155 - BLOCK
      ?auto_395156 - BLOCK
    )
    :vars
    (
      ?auto_395157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395156 ?auto_395157 ) ( ON-TABLE ?auto_395144 ) ( ON ?auto_395145 ?auto_395144 ) ( ON ?auto_395146 ?auto_395145 ) ( ON ?auto_395147 ?auto_395146 ) ( not ( = ?auto_395144 ?auto_395145 ) ) ( not ( = ?auto_395144 ?auto_395146 ) ) ( not ( = ?auto_395144 ?auto_395147 ) ) ( not ( = ?auto_395144 ?auto_395148 ) ) ( not ( = ?auto_395144 ?auto_395149 ) ) ( not ( = ?auto_395144 ?auto_395150 ) ) ( not ( = ?auto_395144 ?auto_395151 ) ) ( not ( = ?auto_395144 ?auto_395152 ) ) ( not ( = ?auto_395144 ?auto_395153 ) ) ( not ( = ?auto_395144 ?auto_395154 ) ) ( not ( = ?auto_395144 ?auto_395155 ) ) ( not ( = ?auto_395144 ?auto_395156 ) ) ( not ( = ?auto_395144 ?auto_395157 ) ) ( not ( = ?auto_395145 ?auto_395146 ) ) ( not ( = ?auto_395145 ?auto_395147 ) ) ( not ( = ?auto_395145 ?auto_395148 ) ) ( not ( = ?auto_395145 ?auto_395149 ) ) ( not ( = ?auto_395145 ?auto_395150 ) ) ( not ( = ?auto_395145 ?auto_395151 ) ) ( not ( = ?auto_395145 ?auto_395152 ) ) ( not ( = ?auto_395145 ?auto_395153 ) ) ( not ( = ?auto_395145 ?auto_395154 ) ) ( not ( = ?auto_395145 ?auto_395155 ) ) ( not ( = ?auto_395145 ?auto_395156 ) ) ( not ( = ?auto_395145 ?auto_395157 ) ) ( not ( = ?auto_395146 ?auto_395147 ) ) ( not ( = ?auto_395146 ?auto_395148 ) ) ( not ( = ?auto_395146 ?auto_395149 ) ) ( not ( = ?auto_395146 ?auto_395150 ) ) ( not ( = ?auto_395146 ?auto_395151 ) ) ( not ( = ?auto_395146 ?auto_395152 ) ) ( not ( = ?auto_395146 ?auto_395153 ) ) ( not ( = ?auto_395146 ?auto_395154 ) ) ( not ( = ?auto_395146 ?auto_395155 ) ) ( not ( = ?auto_395146 ?auto_395156 ) ) ( not ( = ?auto_395146 ?auto_395157 ) ) ( not ( = ?auto_395147 ?auto_395148 ) ) ( not ( = ?auto_395147 ?auto_395149 ) ) ( not ( = ?auto_395147 ?auto_395150 ) ) ( not ( = ?auto_395147 ?auto_395151 ) ) ( not ( = ?auto_395147 ?auto_395152 ) ) ( not ( = ?auto_395147 ?auto_395153 ) ) ( not ( = ?auto_395147 ?auto_395154 ) ) ( not ( = ?auto_395147 ?auto_395155 ) ) ( not ( = ?auto_395147 ?auto_395156 ) ) ( not ( = ?auto_395147 ?auto_395157 ) ) ( not ( = ?auto_395148 ?auto_395149 ) ) ( not ( = ?auto_395148 ?auto_395150 ) ) ( not ( = ?auto_395148 ?auto_395151 ) ) ( not ( = ?auto_395148 ?auto_395152 ) ) ( not ( = ?auto_395148 ?auto_395153 ) ) ( not ( = ?auto_395148 ?auto_395154 ) ) ( not ( = ?auto_395148 ?auto_395155 ) ) ( not ( = ?auto_395148 ?auto_395156 ) ) ( not ( = ?auto_395148 ?auto_395157 ) ) ( not ( = ?auto_395149 ?auto_395150 ) ) ( not ( = ?auto_395149 ?auto_395151 ) ) ( not ( = ?auto_395149 ?auto_395152 ) ) ( not ( = ?auto_395149 ?auto_395153 ) ) ( not ( = ?auto_395149 ?auto_395154 ) ) ( not ( = ?auto_395149 ?auto_395155 ) ) ( not ( = ?auto_395149 ?auto_395156 ) ) ( not ( = ?auto_395149 ?auto_395157 ) ) ( not ( = ?auto_395150 ?auto_395151 ) ) ( not ( = ?auto_395150 ?auto_395152 ) ) ( not ( = ?auto_395150 ?auto_395153 ) ) ( not ( = ?auto_395150 ?auto_395154 ) ) ( not ( = ?auto_395150 ?auto_395155 ) ) ( not ( = ?auto_395150 ?auto_395156 ) ) ( not ( = ?auto_395150 ?auto_395157 ) ) ( not ( = ?auto_395151 ?auto_395152 ) ) ( not ( = ?auto_395151 ?auto_395153 ) ) ( not ( = ?auto_395151 ?auto_395154 ) ) ( not ( = ?auto_395151 ?auto_395155 ) ) ( not ( = ?auto_395151 ?auto_395156 ) ) ( not ( = ?auto_395151 ?auto_395157 ) ) ( not ( = ?auto_395152 ?auto_395153 ) ) ( not ( = ?auto_395152 ?auto_395154 ) ) ( not ( = ?auto_395152 ?auto_395155 ) ) ( not ( = ?auto_395152 ?auto_395156 ) ) ( not ( = ?auto_395152 ?auto_395157 ) ) ( not ( = ?auto_395153 ?auto_395154 ) ) ( not ( = ?auto_395153 ?auto_395155 ) ) ( not ( = ?auto_395153 ?auto_395156 ) ) ( not ( = ?auto_395153 ?auto_395157 ) ) ( not ( = ?auto_395154 ?auto_395155 ) ) ( not ( = ?auto_395154 ?auto_395156 ) ) ( not ( = ?auto_395154 ?auto_395157 ) ) ( not ( = ?auto_395155 ?auto_395156 ) ) ( not ( = ?auto_395155 ?auto_395157 ) ) ( not ( = ?auto_395156 ?auto_395157 ) ) ( ON ?auto_395155 ?auto_395156 ) ( ON ?auto_395154 ?auto_395155 ) ( ON ?auto_395153 ?auto_395154 ) ( ON ?auto_395152 ?auto_395153 ) ( ON ?auto_395151 ?auto_395152 ) ( ON ?auto_395150 ?auto_395151 ) ( ON ?auto_395149 ?auto_395150 ) ( CLEAR ?auto_395147 ) ( ON ?auto_395148 ?auto_395149 ) ( CLEAR ?auto_395148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_395144 ?auto_395145 ?auto_395146 ?auto_395147 ?auto_395148 )
      ( MAKE-13PILE ?auto_395144 ?auto_395145 ?auto_395146 ?auto_395147 ?auto_395148 ?auto_395149 ?auto_395150 ?auto_395151 ?auto_395152 ?auto_395153 ?auto_395154 ?auto_395155 ?auto_395156 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395171 - BLOCK
      ?auto_395172 - BLOCK
      ?auto_395173 - BLOCK
      ?auto_395174 - BLOCK
      ?auto_395175 - BLOCK
      ?auto_395176 - BLOCK
      ?auto_395177 - BLOCK
      ?auto_395178 - BLOCK
      ?auto_395179 - BLOCK
      ?auto_395180 - BLOCK
      ?auto_395181 - BLOCK
      ?auto_395182 - BLOCK
      ?auto_395183 - BLOCK
    )
    :vars
    (
      ?auto_395184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395183 ?auto_395184 ) ( ON-TABLE ?auto_395171 ) ( ON ?auto_395172 ?auto_395171 ) ( ON ?auto_395173 ?auto_395172 ) ( not ( = ?auto_395171 ?auto_395172 ) ) ( not ( = ?auto_395171 ?auto_395173 ) ) ( not ( = ?auto_395171 ?auto_395174 ) ) ( not ( = ?auto_395171 ?auto_395175 ) ) ( not ( = ?auto_395171 ?auto_395176 ) ) ( not ( = ?auto_395171 ?auto_395177 ) ) ( not ( = ?auto_395171 ?auto_395178 ) ) ( not ( = ?auto_395171 ?auto_395179 ) ) ( not ( = ?auto_395171 ?auto_395180 ) ) ( not ( = ?auto_395171 ?auto_395181 ) ) ( not ( = ?auto_395171 ?auto_395182 ) ) ( not ( = ?auto_395171 ?auto_395183 ) ) ( not ( = ?auto_395171 ?auto_395184 ) ) ( not ( = ?auto_395172 ?auto_395173 ) ) ( not ( = ?auto_395172 ?auto_395174 ) ) ( not ( = ?auto_395172 ?auto_395175 ) ) ( not ( = ?auto_395172 ?auto_395176 ) ) ( not ( = ?auto_395172 ?auto_395177 ) ) ( not ( = ?auto_395172 ?auto_395178 ) ) ( not ( = ?auto_395172 ?auto_395179 ) ) ( not ( = ?auto_395172 ?auto_395180 ) ) ( not ( = ?auto_395172 ?auto_395181 ) ) ( not ( = ?auto_395172 ?auto_395182 ) ) ( not ( = ?auto_395172 ?auto_395183 ) ) ( not ( = ?auto_395172 ?auto_395184 ) ) ( not ( = ?auto_395173 ?auto_395174 ) ) ( not ( = ?auto_395173 ?auto_395175 ) ) ( not ( = ?auto_395173 ?auto_395176 ) ) ( not ( = ?auto_395173 ?auto_395177 ) ) ( not ( = ?auto_395173 ?auto_395178 ) ) ( not ( = ?auto_395173 ?auto_395179 ) ) ( not ( = ?auto_395173 ?auto_395180 ) ) ( not ( = ?auto_395173 ?auto_395181 ) ) ( not ( = ?auto_395173 ?auto_395182 ) ) ( not ( = ?auto_395173 ?auto_395183 ) ) ( not ( = ?auto_395173 ?auto_395184 ) ) ( not ( = ?auto_395174 ?auto_395175 ) ) ( not ( = ?auto_395174 ?auto_395176 ) ) ( not ( = ?auto_395174 ?auto_395177 ) ) ( not ( = ?auto_395174 ?auto_395178 ) ) ( not ( = ?auto_395174 ?auto_395179 ) ) ( not ( = ?auto_395174 ?auto_395180 ) ) ( not ( = ?auto_395174 ?auto_395181 ) ) ( not ( = ?auto_395174 ?auto_395182 ) ) ( not ( = ?auto_395174 ?auto_395183 ) ) ( not ( = ?auto_395174 ?auto_395184 ) ) ( not ( = ?auto_395175 ?auto_395176 ) ) ( not ( = ?auto_395175 ?auto_395177 ) ) ( not ( = ?auto_395175 ?auto_395178 ) ) ( not ( = ?auto_395175 ?auto_395179 ) ) ( not ( = ?auto_395175 ?auto_395180 ) ) ( not ( = ?auto_395175 ?auto_395181 ) ) ( not ( = ?auto_395175 ?auto_395182 ) ) ( not ( = ?auto_395175 ?auto_395183 ) ) ( not ( = ?auto_395175 ?auto_395184 ) ) ( not ( = ?auto_395176 ?auto_395177 ) ) ( not ( = ?auto_395176 ?auto_395178 ) ) ( not ( = ?auto_395176 ?auto_395179 ) ) ( not ( = ?auto_395176 ?auto_395180 ) ) ( not ( = ?auto_395176 ?auto_395181 ) ) ( not ( = ?auto_395176 ?auto_395182 ) ) ( not ( = ?auto_395176 ?auto_395183 ) ) ( not ( = ?auto_395176 ?auto_395184 ) ) ( not ( = ?auto_395177 ?auto_395178 ) ) ( not ( = ?auto_395177 ?auto_395179 ) ) ( not ( = ?auto_395177 ?auto_395180 ) ) ( not ( = ?auto_395177 ?auto_395181 ) ) ( not ( = ?auto_395177 ?auto_395182 ) ) ( not ( = ?auto_395177 ?auto_395183 ) ) ( not ( = ?auto_395177 ?auto_395184 ) ) ( not ( = ?auto_395178 ?auto_395179 ) ) ( not ( = ?auto_395178 ?auto_395180 ) ) ( not ( = ?auto_395178 ?auto_395181 ) ) ( not ( = ?auto_395178 ?auto_395182 ) ) ( not ( = ?auto_395178 ?auto_395183 ) ) ( not ( = ?auto_395178 ?auto_395184 ) ) ( not ( = ?auto_395179 ?auto_395180 ) ) ( not ( = ?auto_395179 ?auto_395181 ) ) ( not ( = ?auto_395179 ?auto_395182 ) ) ( not ( = ?auto_395179 ?auto_395183 ) ) ( not ( = ?auto_395179 ?auto_395184 ) ) ( not ( = ?auto_395180 ?auto_395181 ) ) ( not ( = ?auto_395180 ?auto_395182 ) ) ( not ( = ?auto_395180 ?auto_395183 ) ) ( not ( = ?auto_395180 ?auto_395184 ) ) ( not ( = ?auto_395181 ?auto_395182 ) ) ( not ( = ?auto_395181 ?auto_395183 ) ) ( not ( = ?auto_395181 ?auto_395184 ) ) ( not ( = ?auto_395182 ?auto_395183 ) ) ( not ( = ?auto_395182 ?auto_395184 ) ) ( not ( = ?auto_395183 ?auto_395184 ) ) ( ON ?auto_395182 ?auto_395183 ) ( ON ?auto_395181 ?auto_395182 ) ( ON ?auto_395180 ?auto_395181 ) ( ON ?auto_395179 ?auto_395180 ) ( ON ?auto_395178 ?auto_395179 ) ( ON ?auto_395177 ?auto_395178 ) ( ON ?auto_395176 ?auto_395177 ) ( ON ?auto_395175 ?auto_395176 ) ( CLEAR ?auto_395173 ) ( ON ?auto_395174 ?auto_395175 ) ( CLEAR ?auto_395174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_395171 ?auto_395172 ?auto_395173 ?auto_395174 )
      ( MAKE-13PILE ?auto_395171 ?auto_395172 ?auto_395173 ?auto_395174 ?auto_395175 ?auto_395176 ?auto_395177 ?auto_395178 ?auto_395179 ?auto_395180 ?auto_395181 ?auto_395182 ?auto_395183 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395198 - BLOCK
      ?auto_395199 - BLOCK
      ?auto_395200 - BLOCK
      ?auto_395201 - BLOCK
      ?auto_395202 - BLOCK
      ?auto_395203 - BLOCK
      ?auto_395204 - BLOCK
      ?auto_395205 - BLOCK
      ?auto_395206 - BLOCK
      ?auto_395207 - BLOCK
      ?auto_395208 - BLOCK
      ?auto_395209 - BLOCK
      ?auto_395210 - BLOCK
    )
    :vars
    (
      ?auto_395211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395210 ?auto_395211 ) ( ON-TABLE ?auto_395198 ) ( ON ?auto_395199 ?auto_395198 ) ( ON ?auto_395200 ?auto_395199 ) ( not ( = ?auto_395198 ?auto_395199 ) ) ( not ( = ?auto_395198 ?auto_395200 ) ) ( not ( = ?auto_395198 ?auto_395201 ) ) ( not ( = ?auto_395198 ?auto_395202 ) ) ( not ( = ?auto_395198 ?auto_395203 ) ) ( not ( = ?auto_395198 ?auto_395204 ) ) ( not ( = ?auto_395198 ?auto_395205 ) ) ( not ( = ?auto_395198 ?auto_395206 ) ) ( not ( = ?auto_395198 ?auto_395207 ) ) ( not ( = ?auto_395198 ?auto_395208 ) ) ( not ( = ?auto_395198 ?auto_395209 ) ) ( not ( = ?auto_395198 ?auto_395210 ) ) ( not ( = ?auto_395198 ?auto_395211 ) ) ( not ( = ?auto_395199 ?auto_395200 ) ) ( not ( = ?auto_395199 ?auto_395201 ) ) ( not ( = ?auto_395199 ?auto_395202 ) ) ( not ( = ?auto_395199 ?auto_395203 ) ) ( not ( = ?auto_395199 ?auto_395204 ) ) ( not ( = ?auto_395199 ?auto_395205 ) ) ( not ( = ?auto_395199 ?auto_395206 ) ) ( not ( = ?auto_395199 ?auto_395207 ) ) ( not ( = ?auto_395199 ?auto_395208 ) ) ( not ( = ?auto_395199 ?auto_395209 ) ) ( not ( = ?auto_395199 ?auto_395210 ) ) ( not ( = ?auto_395199 ?auto_395211 ) ) ( not ( = ?auto_395200 ?auto_395201 ) ) ( not ( = ?auto_395200 ?auto_395202 ) ) ( not ( = ?auto_395200 ?auto_395203 ) ) ( not ( = ?auto_395200 ?auto_395204 ) ) ( not ( = ?auto_395200 ?auto_395205 ) ) ( not ( = ?auto_395200 ?auto_395206 ) ) ( not ( = ?auto_395200 ?auto_395207 ) ) ( not ( = ?auto_395200 ?auto_395208 ) ) ( not ( = ?auto_395200 ?auto_395209 ) ) ( not ( = ?auto_395200 ?auto_395210 ) ) ( not ( = ?auto_395200 ?auto_395211 ) ) ( not ( = ?auto_395201 ?auto_395202 ) ) ( not ( = ?auto_395201 ?auto_395203 ) ) ( not ( = ?auto_395201 ?auto_395204 ) ) ( not ( = ?auto_395201 ?auto_395205 ) ) ( not ( = ?auto_395201 ?auto_395206 ) ) ( not ( = ?auto_395201 ?auto_395207 ) ) ( not ( = ?auto_395201 ?auto_395208 ) ) ( not ( = ?auto_395201 ?auto_395209 ) ) ( not ( = ?auto_395201 ?auto_395210 ) ) ( not ( = ?auto_395201 ?auto_395211 ) ) ( not ( = ?auto_395202 ?auto_395203 ) ) ( not ( = ?auto_395202 ?auto_395204 ) ) ( not ( = ?auto_395202 ?auto_395205 ) ) ( not ( = ?auto_395202 ?auto_395206 ) ) ( not ( = ?auto_395202 ?auto_395207 ) ) ( not ( = ?auto_395202 ?auto_395208 ) ) ( not ( = ?auto_395202 ?auto_395209 ) ) ( not ( = ?auto_395202 ?auto_395210 ) ) ( not ( = ?auto_395202 ?auto_395211 ) ) ( not ( = ?auto_395203 ?auto_395204 ) ) ( not ( = ?auto_395203 ?auto_395205 ) ) ( not ( = ?auto_395203 ?auto_395206 ) ) ( not ( = ?auto_395203 ?auto_395207 ) ) ( not ( = ?auto_395203 ?auto_395208 ) ) ( not ( = ?auto_395203 ?auto_395209 ) ) ( not ( = ?auto_395203 ?auto_395210 ) ) ( not ( = ?auto_395203 ?auto_395211 ) ) ( not ( = ?auto_395204 ?auto_395205 ) ) ( not ( = ?auto_395204 ?auto_395206 ) ) ( not ( = ?auto_395204 ?auto_395207 ) ) ( not ( = ?auto_395204 ?auto_395208 ) ) ( not ( = ?auto_395204 ?auto_395209 ) ) ( not ( = ?auto_395204 ?auto_395210 ) ) ( not ( = ?auto_395204 ?auto_395211 ) ) ( not ( = ?auto_395205 ?auto_395206 ) ) ( not ( = ?auto_395205 ?auto_395207 ) ) ( not ( = ?auto_395205 ?auto_395208 ) ) ( not ( = ?auto_395205 ?auto_395209 ) ) ( not ( = ?auto_395205 ?auto_395210 ) ) ( not ( = ?auto_395205 ?auto_395211 ) ) ( not ( = ?auto_395206 ?auto_395207 ) ) ( not ( = ?auto_395206 ?auto_395208 ) ) ( not ( = ?auto_395206 ?auto_395209 ) ) ( not ( = ?auto_395206 ?auto_395210 ) ) ( not ( = ?auto_395206 ?auto_395211 ) ) ( not ( = ?auto_395207 ?auto_395208 ) ) ( not ( = ?auto_395207 ?auto_395209 ) ) ( not ( = ?auto_395207 ?auto_395210 ) ) ( not ( = ?auto_395207 ?auto_395211 ) ) ( not ( = ?auto_395208 ?auto_395209 ) ) ( not ( = ?auto_395208 ?auto_395210 ) ) ( not ( = ?auto_395208 ?auto_395211 ) ) ( not ( = ?auto_395209 ?auto_395210 ) ) ( not ( = ?auto_395209 ?auto_395211 ) ) ( not ( = ?auto_395210 ?auto_395211 ) ) ( ON ?auto_395209 ?auto_395210 ) ( ON ?auto_395208 ?auto_395209 ) ( ON ?auto_395207 ?auto_395208 ) ( ON ?auto_395206 ?auto_395207 ) ( ON ?auto_395205 ?auto_395206 ) ( ON ?auto_395204 ?auto_395205 ) ( ON ?auto_395203 ?auto_395204 ) ( ON ?auto_395202 ?auto_395203 ) ( CLEAR ?auto_395200 ) ( ON ?auto_395201 ?auto_395202 ) ( CLEAR ?auto_395201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_395198 ?auto_395199 ?auto_395200 ?auto_395201 )
      ( MAKE-13PILE ?auto_395198 ?auto_395199 ?auto_395200 ?auto_395201 ?auto_395202 ?auto_395203 ?auto_395204 ?auto_395205 ?auto_395206 ?auto_395207 ?auto_395208 ?auto_395209 ?auto_395210 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395225 - BLOCK
      ?auto_395226 - BLOCK
      ?auto_395227 - BLOCK
      ?auto_395228 - BLOCK
      ?auto_395229 - BLOCK
      ?auto_395230 - BLOCK
      ?auto_395231 - BLOCK
      ?auto_395232 - BLOCK
      ?auto_395233 - BLOCK
      ?auto_395234 - BLOCK
      ?auto_395235 - BLOCK
      ?auto_395236 - BLOCK
      ?auto_395237 - BLOCK
    )
    :vars
    (
      ?auto_395238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395237 ?auto_395238 ) ( ON-TABLE ?auto_395225 ) ( ON ?auto_395226 ?auto_395225 ) ( not ( = ?auto_395225 ?auto_395226 ) ) ( not ( = ?auto_395225 ?auto_395227 ) ) ( not ( = ?auto_395225 ?auto_395228 ) ) ( not ( = ?auto_395225 ?auto_395229 ) ) ( not ( = ?auto_395225 ?auto_395230 ) ) ( not ( = ?auto_395225 ?auto_395231 ) ) ( not ( = ?auto_395225 ?auto_395232 ) ) ( not ( = ?auto_395225 ?auto_395233 ) ) ( not ( = ?auto_395225 ?auto_395234 ) ) ( not ( = ?auto_395225 ?auto_395235 ) ) ( not ( = ?auto_395225 ?auto_395236 ) ) ( not ( = ?auto_395225 ?auto_395237 ) ) ( not ( = ?auto_395225 ?auto_395238 ) ) ( not ( = ?auto_395226 ?auto_395227 ) ) ( not ( = ?auto_395226 ?auto_395228 ) ) ( not ( = ?auto_395226 ?auto_395229 ) ) ( not ( = ?auto_395226 ?auto_395230 ) ) ( not ( = ?auto_395226 ?auto_395231 ) ) ( not ( = ?auto_395226 ?auto_395232 ) ) ( not ( = ?auto_395226 ?auto_395233 ) ) ( not ( = ?auto_395226 ?auto_395234 ) ) ( not ( = ?auto_395226 ?auto_395235 ) ) ( not ( = ?auto_395226 ?auto_395236 ) ) ( not ( = ?auto_395226 ?auto_395237 ) ) ( not ( = ?auto_395226 ?auto_395238 ) ) ( not ( = ?auto_395227 ?auto_395228 ) ) ( not ( = ?auto_395227 ?auto_395229 ) ) ( not ( = ?auto_395227 ?auto_395230 ) ) ( not ( = ?auto_395227 ?auto_395231 ) ) ( not ( = ?auto_395227 ?auto_395232 ) ) ( not ( = ?auto_395227 ?auto_395233 ) ) ( not ( = ?auto_395227 ?auto_395234 ) ) ( not ( = ?auto_395227 ?auto_395235 ) ) ( not ( = ?auto_395227 ?auto_395236 ) ) ( not ( = ?auto_395227 ?auto_395237 ) ) ( not ( = ?auto_395227 ?auto_395238 ) ) ( not ( = ?auto_395228 ?auto_395229 ) ) ( not ( = ?auto_395228 ?auto_395230 ) ) ( not ( = ?auto_395228 ?auto_395231 ) ) ( not ( = ?auto_395228 ?auto_395232 ) ) ( not ( = ?auto_395228 ?auto_395233 ) ) ( not ( = ?auto_395228 ?auto_395234 ) ) ( not ( = ?auto_395228 ?auto_395235 ) ) ( not ( = ?auto_395228 ?auto_395236 ) ) ( not ( = ?auto_395228 ?auto_395237 ) ) ( not ( = ?auto_395228 ?auto_395238 ) ) ( not ( = ?auto_395229 ?auto_395230 ) ) ( not ( = ?auto_395229 ?auto_395231 ) ) ( not ( = ?auto_395229 ?auto_395232 ) ) ( not ( = ?auto_395229 ?auto_395233 ) ) ( not ( = ?auto_395229 ?auto_395234 ) ) ( not ( = ?auto_395229 ?auto_395235 ) ) ( not ( = ?auto_395229 ?auto_395236 ) ) ( not ( = ?auto_395229 ?auto_395237 ) ) ( not ( = ?auto_395229 ?auto_395238 ) ) ( not ( = ?auto_395230 ?auto_395231 ) ) ( not ( = ?auto_395230 ?auto_395232 ) ) ( not ( = ?auto_395230 ?auto_395233 ) ) ( not ( = ?auto_395230 ?auto_395234 ) ) ( not ( = ?auto_395230 ?auto_395235 ) ) ( not ( = ?auto_395230 ?auto_395236 ) ) ( not ( = ?auto_395230 ?auto_395237 ) ) ( not ( = ?auto_395230 ?auto_395238 ) ) ( not ( = ?auto_395231 ?auto_395232 ) ) ( not ( = ?auto_395231 ?auto_395233 ) ) ( not ( = ?auto_395231 ?auto_395234 ) ) ( not ( = ?auto_395231 ?auto_395235 ) ) ( not ( = ?auto_395231 ?auto_395236 ) ) ( not ( = ?auto_395231 ?auto_395237 ) ) ( not ( = ?auto_395231 ?auto_395238 ) ) ( not ( = ?auto_395232 ?auto_395233 ) ) ( not ( = ?auto_395232 ?auto_395234 ) ) ( not ( = ?auto_395232 ?auto_395235 ) ) ( not ( = ?auto_395232 ?auto_395236 ) ) ( not ( = ?auto_395232 ?auto_395237 ) ) ( not ( = ?auto_395232 ?auto_395238 ) ) ( not ( = ?auto_395233 ?auto_395234 ) ) ( not ( = ?auto_395233 ?auto_395235 ) ) ( not ( = ?auto_395233 ?auto_395236 ) ) ( not ( = ?auto_395233 ?auto_395237 ) ) ( not ( = ?auto_395233 ?auto_395238 ) ) ( not ( = ?auto_395234 ?auto_395235 ) ) ( not ( = ?auto_395234 ?auto_395236 ) ) ( not ( = ?auto_395234 ?auto_395237 ) ) ( not ( = ?auto_395234 ?auto_395238 ) ) ( not ( = ?auto_395235 ?auto_395236 ) ) ( not ( = ?auto_395235 ?auto_395237 ) ) ( not ( = ?auto_395235 ?auto_395238 ) ) ( not ( = ?auto_395236 ?auto_395237 ) ) ( not ( = ?auto_395236 ?auto_395238 ) ) ( not ( = ?auto_395237 ?auto_395238 ) ) ( ON ?auto_395236 ?auto_395237 ) ( ON ?auto_395235 ?auto_395236 ) ( ON ?auto_395234 ?auto_395235 ) ( ON ?auto_395233 ?auto_395234 ) ( ON ?auto_395232 ?auto_395233 ) ( ON ?auto_395231 ?auto_395232 ) ( ON ?auto_395230 ?auto_395231 ) ( ON ?auto_395229 ?auto_395230 ) ( ON ?auto_395228 ?auto_395229 ) ( CLEAR ?auto_395226 ) ( ON ?auto_395227 ?auto_395228 ) ( CLEAR ?auto_395227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_395225 ?auto_395226 ?auto_395227 )
      ( MAKE-13PILE ?auto_395225 ?auto_395226 ?auto_395227 ?auto_395228 ?auto_395229 ?auto_395230 ?auto_395231 ?auto_395232 ?auto_395233 ?auto_395234 ?auto_395235 ?auto_395236 ?auto_395237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395252 - BLOCK
      ?auto_395253 - BLOCK
      ?auto_395254 - BLOCK
      ?auto_395255 - BLOCK
      ?auto_395256 - BLOCK
      ?auto_395257 - BLOCK
      ?auto_395258 - BLOCK
      ?auto_395259 - BLOCK
      ?auto_395260 - BLOCK
      ?auto_395261 - BLOCK
      ?auto_395262 - BLOCK
      ?auto_395263 - BLOCK
      ?auto_395264 - BLOCK
    )
    :vars
    (
      ?auto_395265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395264 ?auto_395265 ) ( ON-TABLE ?auto_395252 ) ( ON ?auto_395253 ?auto_395252 ) ( not ( = ?auto_395252 ?auto_395253 ) ) ( not ( = ?auto_395252 ?auto_395254 ) ) ( not ( = ?auto_395252 ?auto_395255 ) ) ( not ( = ?auto_395252 ?auto_395256 ) ) ( not ( = ?auto_395252 ?auto_395257 ) ) ( not ( = ?auto_395252 ?auto_395258 ) ) ( not ( = ?auto_395252 ?auto_395259 ) ) ( not ( = ?auto_395252 ?auto_395260 ) ) ( not ( = ?auto_395252 ?auto_395261 ) ) ( not ( = ?auto_395252 ?auto_395262 ) ) ( not ( = ?auto_395252 ?auto_395263 ) ) ( not ( = ?auto_395252 ?auto_395264 ) ) ( not ( = ?auto_395252 ?auto_395265 ) ) ( not ( = ?auto_395253 ?auto_395254 ) ) ( not ( = ?auto_395253 ?auto_395255 ) ) ( not ( = ?auto_395253 ?auto_395256 ) ) ( not ( = ?auto_395253 ?auto_395257 ) ) ( not ( = ?auto_395253 ?auto_395258 ) ) ( not ( = ?auto_395253 ?auto_395259 ) ) ( not ( = ?auto_395253 ?auto_395260 ) ) ( not ( = ?auto_395253 ?auto_395261 ) ) ( not ( = ?auto_395253 ?auto_395262 ) ) ( not ( = ?auto_395253 ?auto_395263 ) ) ( not ( = ?auto_395253 ?auto_395264 ) ) ( not ( = ?auto_395253 ?auto_395265 ) ) ( not ( = ?auto_395254 ?auto_395255 ) ) ( not ( = ?auto_395254 ?auto_395256 ) ) ( not ( = ?auto_395254 ?auto_395257 ) ) ( not ( = ?auto_395254 ?auto_395258 ) ) ( not ( = ?auto_395254 ?auto_395259 ) ) ( not ( = ?auto_395254 ?auto_395260 ) ) ( not ( = ?auto_395254 ?auto_395261 ) ) ( not ( = ?auto_395254 ?auto_395262 ) ) ( not ( = ?auto_395254 ?auto_395263 ) ) ( not ( = ?auto_395254 ?auto_395264 ) ) ( not ( = ?auto_395254 ?auto_395265 ) ) ( not ( = ?auto_395255 ?auto_395256 ) ) ( not ( = ?auto_395255 ?auto_395257 ) ) ( not ( = ?auto_395255 ?auto_395258 ) ) ( not ( = ?auto_395255 ?auto_395259 ) ) ( not ( = ?auto_395255 ?auto_395260 ) ) ( not ( = ?auto_395255 ?auto_395261 ) ) ( not ( = ?auto_395255 ?auto_395262 ) ) ( not ( = ?auto_395255 ?auto_395263 ) ) ( not ( = ?auto_395255 ?auto_395264 ) ) ( not ( = ?auto_395255 ?auto_395265 ) ) ( not ( = ?auto_395256 ?auto_395257 ) ) ( not ( = ?auto_395256 ?auto_395258 ) ) ( not ( = ?auto_395256 ?auto_395259 ) ) ( not ( = ?auto_395256 ?auto_395260 ) ) ( not ( = ?auto_395256 ?auto_395261 ) ) ( not ( = ?auto_395256 ?auto_395262 ) ) ( not ( = ?auto_395256 ?auto_395263 ) ) ( not ( = ?auto_395256 ?auto_395264 ) ) ( not ( = ?auto_395256 ?auto_395265 ) ) ( not ( = ?auto_395257 ?auto_395258 ) ) ( not ( = ?auto_395257 ?auto_395259 ) ) ( not ( = ?auto_395257 ?auto_395260 ) ) ( not ( = ?auto_395257 ?auto_395261 ) ) ( not ( = ?auto_395257 ?auto_395262 ) ) ( not ( = ?auto_395257 ?auto_395263 ) ) ( not ( = ?auto_395257 ?auto_395264 ) ) ( not ( = ?auto_395257 ?auto_395265 ) ) ( not ( = ?auto_395258 ?auto_395259 ) ) ( not ( = ?auto_395258 ?auto_395260 ) ) ( not ( = ?auto_395258 ?auto_395261 ) ) ( not ( = ?auto_395258 ?auto_395262 ) ) ( not ( = ?auto_395258 ?auto_395263 ) ) ( not ( = ?auto_395258 ?auto_395264 ) ) ( not ( = ?auto_395258 ?auto_395265 ) ) ( not ( = ?auto_395259 ?auto_395260 ) ) ( not ( = ?auto_395259 ?auto_395261 ) ) ( not ( = ?auto_395259 ?auto_395262 ) ) ( not ( = ?auto_395259 ?auto_395263 ) ) ( not ( = ?auto_395259 ?auto_395264 ) ) ( not ( = ?auto_395259 ?auto_395265 ) ) ( not ( = ?auto_395260 ?auto_395261 ) ) ( not ( = ?auto_395260 ?auto_395262 ) ) ( not ( = ?auto_395260 ?auto_395263 ) ) ( not ( = ?auto_395260 ?auto_395264 ) ) ( not ( = ?auto_395260 ?auto_395265 ) ) ( not ( = ?auto_395261 ?auto_395262 ) ) ( not ( = ?auto_395261 ?auto_395263 ) ) ( not ( = ?auto_395261 ?auto_395264 ) ) ( not ( = ?auto_395261 ?auto_395265 ) ) ( not ( = ?auto_395262 ?auto_395263 ) ) ( not ( = ?auto_395262 ?auto_395264 ) ) ( not ( = ?auto_395262 ?auto_395265 ) ) ( not ( = ?auto_395263 ?auto_395264 ) ) ( not ( = ?auto_395263 ?auto_395265 ) ) ( not ( = ?auto_395264 ?auto_395265 ) ) ( ON ?auto_395263 ?auto_395264 ) ( ON ?auto_395262 ?auto_395263 ) ( ON ?auto_395261 ?auto_395262 ) ( ON ?auto_395260 ?auto_395261 ) ( ON ?auto_395259 ?auto_395260 ) ( ON ?auto_395258 ?auto_395259 ) ( ON ?auto_395257 ?auto_395258 ) ( ON ?auto_395256 ?auto_395257 ) ( ON ?auto_395255 ?auto_395256 ) ( CLEAR ?auto_395253 ) ( ON ?auto_395254 ?auto_395255 ) ( CLEAR ?auto_395254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_395252 ?auto_395253 ?auto_395254 )
      ( MAKE-13PILE ?auto_395252 ?auto_395253 ?auto_395254 ?auto_395255 ?auto_395256 ?auto_395257 ?auto_395258 ?auto_395259 ?auto_395260 ?auto_395261 ?auto_395262 ?auto_395263 ?auto_395264 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395279 - BLOCK
      ?auto_395280 - BLOCK
      ?auto_395281 - BLOCK
      ?auto_395282 - BLOCK
      ?auto_395283 - BLOCK
      ?auto_395284 - BLOCK
      ?auto_395285 - BLOCK
      ?auto_395286 - BLOCK
      ?auto_395287 - BLOCK
      ?auto_395288 - BLOCK
      ?auto_395289 - BLOCK
      ?auto_395290 - BLOCK
      ?auto_395291 - BLOCK
    )
    :vars
    (
      ?auto_395292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395291 ?auto_395292 ) ( ON-TABLE ?auto_395279 ) ( not ( = ?auto_395279 ?auto_395280 ) ) ( not ( = ?auto_395279 ?auto_395281 ) ) ( not ( = ?auto_395279 ?auto_395282 ) ) ( not ( = ?auto_395279 ?auto_395283 ) ) ( not ( = ?auto_395279 ?auto_395284 ) ) ( not ( = ?auto_395279 ?auto_395285 ) ) ( not ( = ?auto_395279 ?auto_395286 ) ) ( not ( = ?auto_395279 ?auto_395287 ) ) ( not ( = ?auto_395279 ?auto_395288 ) ) ( not ( = ?auto_395279 ?auto_395289 ) ) ( not ( = ?auto_395279 ?auto_395290 ) ) ( not ( = ?auto_395279 ?auto_395291 ) ) ( not ( = ?auto_395279 ?auto_395292 ) ) ( not ( = ?auto_395280 ?auto_395281 ) ) ( not ( = ?auto_395280 ?auto_395282 ) ) ( not ( = ?auto_395280 ?auto_395283 ) ) ( not ( = ?auto_395280 ?auto_395284 ) ) ( not ( = ?auto_395280 ?auto_395285 ) ) ( not ( = ?auto_395280 ?auto_395286 ) ) ( not ( = ?auto_395280 ?auto_395287 ) ) ( not ( = ?auto_395280 ?auto_395288 ) ) ( not ( = ?auto_395280 ?auto_395289 ) ) ( not ( = ?auto_395280 ?auto_395290 ) ) ( not ( = ?auto_395280 ?auto_395291 ) ) ( not ( = ?auto_395280 ?auto_395292 ) ) ( not ( = ?auto_395281 ?auto_395282 ) ) ( not ( = ?auto_395281 ?auto_395283 ) ) ( not ( = ?auto_395281 ?auto_395284 ) ) ( not ( = ?auto_395281 ?auto_395285 ) ) ( not ( = ?auto_395281 ?auto_395286 ) ) ( not ( = ?auto_395281 ?auto_395287 ) ) ( not ( = ?auto_395281 ?auto_395288 ) ) ( not ( = ?auto_395281 ?auto_395289 ) ) ( not ( = ?auto_395281 ?auto_395290 ) ) ( not ( = ?auto_395281 ?auto_395291 ) ) ( not ( = ?auto_395281 ?auto_395292 ) ) ( not ( = ?auto_395282 ?auto_395283 ) ) ( not ( = ?auto_395282 ?auto_395284 ) ) ( not ( = ?auto_395282 ?auto_395285 ) ) ( not ( = ?auto_395282 ?auto_395286 ) ) ( not ( = ?auto_395282 ?auto_395287 ) ) ( not ( = ?auto_395282 ?auto_395288 ) ) ( not ( = ?auto_395282 ?auto_395289 ) ) ( not ( = ?auto_395282 ?auto_395290 ) ) ( not ( = ?auto_395282 ?auto_395291 ) ) ( not ( = ?auto_395282 ?auto_395292 ) ) ( not ( = ?auto_395283 ?auto_395284 ) ) ( not ( = ?auto_395283 ?auto_395285 ) ) ( not ( = ?auto_395283 ?auto_395286 ) ) ( not ( = ?auto_395283 ?auto_395287 ) ) ( not ( = ?auto_395283 ?auto_395288 ) ) ( not ( = ?auto_395283 ?auto_395289 ) ) ( not ( = ?auto_395283 ?auto_395290 ) ) ( not ( = ?auto_395283 ?auto_395291 ) ) ( not ( = ?auto_395283 ?auto_395292 ) ) ( not ( = ?auto_395284 ?auto_395285 ) ) ( not ( = ?auto_395284 ?auto_395286 ) ) ( not ( = ?auto_395284 ?auto_395287 ) ) ( not ( = ?auto_395284 ?auto_395288 ) ) ( not ( = ?auto_395284 ?auto_395289 ) ) ( not ( = ?auto_395284 ?auto_395290 ) ) ( not ( = ?auto_395284 ?auto_395291 ) ) ( not ( = ?auto_395284 ?auto_395292 ) ) ( not ( = ?auto_395285 ?auto_395286 ) ) ( not ( = ?auto_395285 ?auto_395287 ) ) ( not ( = ?auto_395285 ?auto_395288 ) ) ( not ( = ?auto_395285 ?auto_395289 ) ) ( not ( = ?auto_395285 ?auto_395290 ) ) ( not ( = ?auto_395285 ?auto_395291 ) ) ( not ( = ?auto_395285 ?auto_395292 ) ) ( not ( = ?auto_395286 ?auto_395287 ) ) ( not ( = ?auto_395286 ?auto_395288 ) ) ( not ( = ?auto_395286 ?auto_395289 ) ) ( not ( = ?auto_395286 ?auto_395290 ) ) ( not ( = ?auto_395286 ?auto_395291 ) ) ( not ( = ?auto_395286 ?auto_395292 ) ) ( not ( = ?auto_395287 ?auto_395288 ) ) ( not ( = ?auto_395287 ?auto_395289 ) ) ( not ( = ?auto_395287 ?auto_395290 ) ) ( not ( = ?auto_395287 ?auto_395291 ) ) ( not ( = ?auto_395287 ?auto_395292 ) ) ( not ( = ?auto_395288 ?auto_395289 ) ) ( not ( = ?auto_395288 ?auto_395290 ) ) ( not ( = ?auto_395288 ?auto_395291 ) ) ( not ( = ?auto_395288 ?auto_395292 ) ) ( not ( = ?auto_395289 ?auto_395290 ) ) ( not ( = ?auto_395289 ?auto_395291 ) ) ( not ( = ?auto_395289 ?auto_395292 ) ) ( not ( = ?auto_395290 ?auto_395291 ) ) ( not ( = ?auto_395290 ?auto_395292 ) ) ( not ( = ?auto_395291 ?auto_395292 ) ) ( ON ?auto_395290 ?auto_395291 ) ( ON ?auto_395289 ?auto_395290 ) ( ON ?auto_395288 ?auto_395289 ) ( ON ?auto_395287 ?auto_395288 ) ( ON ?auto_395286 ?auto_395287 ) ( ON ?auto_395285 ?auto_395286 ) ( ON ?auto_395284 ?auto_395285 ) ( ON ?auto_395283 ?auto_395284 ) ( ON ?auto_395282 ?auto_395283 ) ( ON ?auto_395281 ?auto_395282 ) ( CLEAR ?auto_395279 ) ( ON ?auto_395280 ?auto_395281 ) ( CLEAR ?auto_395280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_395279 ?auto_395280 )
      ( MAKE-13PILE ?auto_395279 ?auto_395280 ?auto_395281 ?auto_395282 ?auto_395283 ?auto_395284 ?auto_395285 ?auto_395286 ?auto_395287 ?auto_395288 ?auto_395289 ?auto_395290 ?auto_395291 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395306 - BLOCK
      ?auto_395307 - BLOCK
      ?auto_395308 - BLOCK
      ?auto_395309 - BLOCK
      ?auto_395310 - BLOCK
      ?auto_395311 - BLOCK
      ?auto_395312 - BLOCK
      ?auto_395313 - BLOCK
      ?auto_395314 - BLOCK
      ?auto_395315 - BLOCK
      ?auto_395316 - BLOCK
      ?auto_395317 - BLOCK
      ?auto_395318 - BLOCK
    )
    :vars
    (
      ?auto_395319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395318 ?auto_395319 ) ( ON-TABLE ?auto_395306 ) ( not ( = ?auto_395306 ?auto_395307 ) ) ( not ( = ?auto_395306 ?auto_395308 ) ) ( not ( = ?auto_395306 ?auto_395309 ) ) ( not ( = ?auto_395306 ?auto_395310 ) ) ( not ( = ?auto_395306 ?auto_395311 ) ) ( not ( = ?auto_395306 ?auto_395312 ) ) ( not ( = ?auto_395306 ?auto_395313 ) ) ( not ( = ?auto_395306 ?auto_395314 ) ) ( not ( = ?auto_395306 ?auto_395315 ) ) ( not ( = ?auto_395306 ?auto_395316 ) ) ( not ( = ?auto_395306 ?auto_395317 ) ) ( not ( = ?auto_395306 ?auto_395318 ) ) ( not ( = ?auto_395306 ?auto_395319 ) ) ( not ( = ?auto_395307 ?auto_395308 ) ) ( not ( = ?auto_395307 ?auto_395309 ) ) ( not ( = ?auto_395307 ?auto_395310 ) ) ( not ( = ?auto_395307 ?auto_395311 ) ) ( not ( = ?auto_395307 ?auto_395312 ) ) ( not ( = ?auto_395307 ?auto_395313 ) ) ( not ( = ?auto_395307 ?auto_395314 ) ) ( not ( = ?auto_395307 ?auto_395315 ) ) ( not ( = ?auto_395307 ?auto_395316 ) ) ( not ( = ?auto_395307 ?auto_395317 ) ) ( not ( = ?auto_395307 ?auto_395318 ) ) ( not ( = ?auto_395307 ?auto_395319 ) ) ( not ( = ?auto_395308 ?auto_395309 ) ) ( not ( = ?auto_395308 ?auto_395310 ) ) ( not ( = ?auto_395308 ?auto_395311 ) ) ( not ( = ?auto_395308 ?auto_395312 ) ) ( not ( = ?auto_395308 ?auto_395313 ) ) ( not ( = ?auto_395308 ?auto_395314 ) ) ( not ( = ?auto_395308 ?auto_395315 ) ) ( not ( = ?auto_395308 ?auto_395316 ) ) ( not ( = ?auto_395308 ?auto_395317 ) ) ( not ( = ?auto_395308 ?auto_395318 ) ) ( not ( = ?auto_395308 ?auto_395319 ) ) ( not ( = ?auto_395309 ?auto_395310 ) ) ( not ( = ?auto_395309 ?auto_395311 ) ) ( not ( = ?auto_395309 ?auto_395312 ) ) ( not ( = ?auto_395309 ?auto_395313 ) ) ( not ( = ?auto_395309 ?auto_395314 ) ) ( not ( = ?auto_395309 ?auto_395315 ) ) ( not ( = ?auto_395309 ?auto_395316 ) ) ( not ( = ?auto_395309 ?auto_395317 ) ) ( not ( = ?auto_395309 ?auto_395318 ) ) ( not ( = ?auto_395309 ?auto_395319 ) ) ( not ( = ?auto_395310 ?auto_395311 ) ) ( not ( = ?auto_395310 ?auto_395312 ) ) ( not ( = ?auto_395310 ?auto_395313 ) ) ( not ( = ?auto_395310 ?auto_395314 ) ) ( not ( = ?auto_395310 ?auto_395315 ) ) ( not ( = ?auto_395310 ?auto_395316 ) ) ( not ( = ?auto_395310 ?auto_395317 ) ) ( not ( = ?auto_395310 ?auto_395318 ) ) ( not ( = ?auto_395310 ?auto_395319 ) ) ( not ( = ?auto_395311 ?auto_395312 ) ) ( not ( = ?auto_395311 ?auto_395313 ) ) ( not ( = ?auto_395311 ?auto_395314 ) ) ( not ( = ?auto_395311 ?auto_395315 ) ) ( not ( = ?auto_395311 ?auto_395316 ) ) ( not ( = ?auto_395311 ?auto_395317 ) ) ( not ( = ?auto_395311 ?auto_395318 ) ) ( not ( = ?auto_395311 ?auto_395319 ) ) ( not ( = ?auto_395312 ?auto_395313 ) ) ( not ( = ?auto_395312 ?auto_395314 ) ) ( not ( = ?auto_395312 ?auto_395315 ) ) ( not ( = ?auto_395312 ?auto_395316 ) ) ( not ( = ?auto_395312 ?auto_395317 ) ) ( not ( = ?auto_395312 ?auto_395318 ) ) ( not ( = ?auto_395312 ?auto_395319 ) ) ( not ( = ?auto_395313 ?auto_395314 ) ) ( not ( = ?auto_395313 ?auto_395315 ) ) ( not ( = ?auto_395313 ?auto_395316 ) ) ( not ( = ?auto_395313 ?auto_395317 ) ) ( not ( = ?auto_395313 ?auto_395318 ) ) ( not ( = ?auto_395313 ?auto_395319 ) ) ( not ( = ?auto_395314 ?auto_395315 ) ) ( not ( = ?auto_395314 ?auto_395316 ) ) ( not ( = ?auto_395314 ?auto_395317 ) ) ( not ( = ?auto_395314 ?auto_395318 ) ) ( not ( = ?auto_395314 ?auto_395319 ) ) ( not ( = ?auto_395315 ?auto_395316 ) ) ( not ( = ?auto_395315 ?auto_395317 ) ) ( not ( = ?auto_395315 ?auto_395318 ) ) ( not ( = ?auto_395315 ?auto_395319 ) ) ( not ( = ?auto_395316 ?auto_395317 ) ) ( not ( = ?auto_395316 ?auto_395318 ) ) ( not ( = ?auto_395316 ?auto_395319 ) ) ( not ( = ?auto_395317 ?auto_395318 ) ) ( not ( = ?auto_395317 ?auto_395319 ) ) ( not ( = ?auto_395318 ?auto_395319 ) ) ( ON ?auto_395317 ?auto_395318 ) ( ON ?auto_395316 ?auto_395317 ) ( ON ?auto_395315 ?auto_395316 ) ( ON ?auto_395314 ?auto_395315 ) ( ON ?auto_395313 ?auto_395314 ) ( ON ?auto_395312 ?auto_395313 ) ( ON ?auto_395311 ?auto_395312 ) ( ON ?auto_395310 ?auto_395311 ) ( ON ?auto_395309 ?auto_395310 ) ( ON ?auto_395308 ?auto_395309 ) ( CLEAR ?auto_395306 ) ( ON ?auto_395307 ?auto_395308 ) ( CLEAR ?auto_395307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_395306 ?auto_395307 )
      ( MAKE-13PILE ?auto_395306 ?auto_395307 ?auto_395308 ?auto_395309 ?auto_395310 ?auto_395311 ?auto_395312 ?auto_395313 ?auto_395314 ?auto_395315 ?auto_395316 ?auto_395317 ?auto_395318 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395333 - BLOCK
      ?auto_395334 - BLOCK
      ?auto_395335 - BLOCK
      ?auto_395336 - BLOCK
      ?auto_395337 - BLOCK
      ?auto_395338 - BLOCK
      ?auto_395339 - BLOCK
      ?auto_395340 - BLOCK
      ?auto_395341 - BLOCK
      ?auto_395342 - BLOCK
      ?auto_395343 - BLOCK
      ?auto_395344 - BLOCK
      ?auto_395345 - BLOCK
    )
    :vars
    (
      ?auto_395346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395345 ?auto_395346 ) ( not ( = ?auto_395333 ?auto_395334 ) ) ( not ( = ?auto_395333 ?auto_395335 ) ) ( not ( = ?auto_395333 ?auto_395336 ) ) ( not ( = ?auto_395333 ?auto_395337 ) ) ( not ( = ?auto_395333 ?auto_395338 ) ) ( not ( = ?auto_395333 ?auto_395339 ) ) ( not ( = ?auto_395333 ?auto_395340 ) ) ( not ( = ?auto_395333 ?auto_395341 ) ) ( not ( = ?auto_395333 ?auto_395342 ) ) ( not ( = ?auto_395333 ?auto_395343 ) ) ( not ( = ?auto_395333 ?auto_395344 ) ) ( not ( = ?auto_395333 ?auto_395345 ) ) ( not ( = ?auto_395333 ?auto_395346 ) ) ( not ( = ?auto_395334 ?auto_395335 ) ) ( not ( = ?auto_395334 ?auto_395336 ) ) ( not ( = ?auto_395334 ?auto_395337 ) ) ( not ( = ?auto_395334 ?auto_395338 ) ) ( not ( = ?auto_395334 ?auto_395339 ) ) ( not ( = ?auto_395334 ?auto_395340 ) ) ( not ( = ?auto_395334 ?auto_395341 ) ) ( not ( = ?auto_395334 ?auto_395342 ) ) ( not ( = ?auto_395334 ?auto_395343 ) ) ( not ( = ?auto_395334 ?auto_395344 ) ) ( not ( = ?auto_395334 ?auto_395345 ) ) ( not ( = ?auto_395334 ?auto_395346 ) ) ( not ( = ?auto_395335 ?auto_395336 ) ) ( not ( = ?auto_395335 ?auto_395337 ) ) ( not ( = ?auto_395335 ?auto_395338 ) ) ( not ( = ?auto_395335 ?auto_395339 ) ) ( not ( = ?auto_395335 ?auto_395340 ) ) ( not ( = ?auto_395335 ?auto_395341 ) ) ( not ( = ?auto_395335 ?auto_395342 ) ) ( not ( = ?auto_395335 ?auto_395343 ) ) ( not ( = ?auto_395335 ?auto_395344 ) ) ( not ( = ?auto_395335 ?auto_395345 ) ) ( not ( = ?auto_395335 ?auto_395346 ) ) ( not ( = ?auto_395336 ?auto_395337 ) ) ( not ( = ?auto_395336 ?auto_395338 ) ) ( not ( = ?auto_395336 ?auto_395339 ) ) ( not ( = ?auto_395336 ?auto_395340 ) ) ( not ( = ?auto_395336 ?auto_395341 ) ) ( not ( = ?auto_395336 ?auto_395342 ) ) ( not ( = ?auto_395336 ?auto_395343 ) ) ( not ( = ?auto_395336 ?auto_395344 ) ) ( not ( = ?auto_395336 ?auto_395345 ) ) ( not ( = ?auto_395336 ?auto_395346 ) ) ( not ( = ?auto_395337 ?auto_395338 ) ) ( not ( = ?auto_395337 ?auto_395339 ) ) ( not ( = ?auto_395337 ?auto_395340 ) ) ( not ( = ?auto_395337 ?auto_395341 ) ) ( not ( = ?auto_395337 ?auto_395342 ) ) ( not ( = ?auto_395337 ?auto_395343 ) ) ( not ( = ?auto_395337 ?auto_395344 ) ) ( not ( = ?auto_395337 ?auto_395345 ) ) ( not ( = ?auto_395337 ?auto_395346 ) ) ( not ( = ?auto_395338 ?auto_395339 ) ) ( not ( = ?auto_395338 ?auto_395340 ) ) ( not ( = ?auto_395338 ?auto_395341 ) ) ( not ( = ?auto_395338 ?auto_395342 ) ) ( not ( = ?auto_395338 ?auto_395343 ) ) ( not ( = ?auto_395338 ?auto_395344 ) ) ( not ( = ?auto_395338 ?auto_395345 ) ) ( not ( = ?auto_395338 ?auto_395346 ) ) ( not ( = ?auto_395339 ?auto_395340 ) ) ( not ( = ?auto_395339 ?auto_395341 ) ) ( not ( = ?auto_395339 ?auto_395342 ) ) ( not ( = ?auto_395339 ?auto_395343 ) ) ( not ( = ?auto_395339 ?auto_395344 ) ) ( not ( = ?auto_395339 ?auto_395345 ) ) ( not ( = ?auto_395339 ?auto_395346 ) ) ( not ( = ?auto_395340 ?auto_395341 ) ) ( not ( = ?auto_395340 ?auto_395342 ) ) ( not ( = ?auto_395340 ?auto_395343 ) ) ( not ( = ?auto_395340 ?auto_395344 ) ) ( not ( = ?auto_395340 ?auto_395345 ) ) ( not ( = ?auto_395340 ?auto_395346 ) ) ( not ( = ?auto_395341 ?auto_395342 ) ) ( not ( = ?auto_395341 ?auto_395343 ) ) ( not ( = ?auto_395341 ?auto_395344 ) ) ( not ( = ?auto_395341 ?auto_395345 ) ) ( not ( = ?auto_395341 ?auto_395346 ) ) ( not ( = ?auto_395342 ?auto_395343 ) ) ( not ( = ?auto_395342 ?auto_395344 ) ) ( not ( = ?auto_395342 ?auto_395345 ) ) ( not ( = ?auto_395342 ?auto_395346 ) ) ( not ( = ?auto_395343 ?auto_395344 ) ) ( not ( = ?auto_395343 ?auto_395345 ) ) ( not ( = ?auto_395343 ?auto_395346 ) ) ( not ( = ?auto_395344 ?auto_395345 ) ) ( not ( = ?auto_395344 ?auto_395346 ) ) ( not ( = ?auto_395345 ?auto_395346 ) ) ( ON ?auto_395344 ?auto_395345 ) ( ON ?auto_395343 ?auto_395344 ) ( ON ?auto_395342 ?auto_395343 ) ( ON ?auto_395341 ?auto_395342 ) ( ON ?auto_395340 ?auto_395341 ) ( ON ?auto_395339 ?auto_395340 ) ( ON ?auto_395338 ?auto_395339 ) ( ON ?auto_395337 ?auto_395338 ) ( ON ?auto_395336 ?auto_395337 ) ( ON ?auto_395335 ?auto_395336 ) ( ON ?auto_395334 ?auto_395335 ) ( ON ?auto_395333 ?auto_395334 ) ( CLEAR ?auto_395333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_395333 )
      ( MAKE-13PILE ?auto_395333 ?auto_395334 ?auto_395335 ?auto_395336 ?auto_395337 ?auto_395338 ?auto_395339 ?auto_395340 ?auto_395341 ?auto_395342 ?auto_395343 ?auto_395344 ?auto_395345 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_395360 - BLOCK
      ?auto_395361 - BLOCK
      ?auto_395362 - BLOCK
      ?auto_395363 - BLOCK
      ?auto_395364 - BLOCK
      ?auto_395365 - BLOCK
      ?auto_395366 - BLOCK
      ?auto_395367 - BLOCK
      ?auto_395368 - BLOCK
      ?auto_395369 - BLOCK
      ?auto_395370 - BLOCK
      ?auto_395371 - BLOCK
      ?auto_395372 - BLOCK
    )
    :vars
    (
      ?auto_395373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395372 ?auto_395373 ) ( not ( = ?auto_395360 ?auto_395361 ) ) ( not ( = ?auto_395360 ?auto_395362 ) ) ( not ( = ?auto_395360 ?auto_395363 ) ) ( not ( = ?auto_395360 ?auto_395364 ) ) ( not ( = ?auto_395360 ?auto_395365 ) ) ( not ( = ?auto_395360 ?auto_395366 ) ) ( not ( = ?auto_395360 ?auto_395367 ) ) ( not ( = ?auto_395360 ?auto_395368 ) ) ( not ( = ?auto_395360 ?auto_395369 ) ) ( not ( = ?auto_395360 ?auto_395370 ) ) ( not ( = ?auto_395360 ?auto_395371 ) ) ( not ( = ?auto_395360 ?auto_395372 ) ) ( not ( = ?auto_395360 ?auto_395373 ) ) ( not ( = ?auto_395361 ?auto_395362 ) ) ( not ( = ?auto_395361 ?auto_395363 ) ) ( not ( = ?auto_395361 ?auto_395364 ) ) ( not ( = ?auto_395361 ?auto_395365 ) ) ( not ( = ?auto_395361 ?auto_395366 ) ) ( not ( = ?auto_395361 ?auto_395367 ) ) ( not ( = ?auto_395361 ?auto_395368 ) ) ( not ( = ?auto_395361 ?auto_395369 ) ) ( not ( = ?auto_395361 ?auto_395370 ) ) ( not ( = ?auto_395361 ?auto_395371 ) ) ( not ( = ?auto_395361 ?auto_395372 ) ) ( not ( = ?auto_395361 ?auto_395373 ) ) ( not ( = ?auto_395362 ?auto_395363 ) ) ( not ( = ?auto_395362 ?auto_395364 ) ) ( not ( = ?auto_395362 ?auto_395365 ) ) ( not ( = ?auto_395362 ?auto_395366 ) ) ( not ( = ?auto_395362 ?auto_395367 ) ) ( not ( = ?auto_395362 ?auto_395368 ) ) ( not ( = ?auto_395362 ?auto_395369 ) ) ( not ( = ?auto_395362 ?auto_395370 ) ) ( not ( = ?auto_395362 ?auto_395371 ) ) ( not ( = ?auto_395362 ?auto_395372 ) ) ( not ( = ?auto_395362 ?auto_395373 ) ) ( not ( = ?auto_395363 ?auto_395364 ) ) ( not ( = ?auto_395363 ?auto_395365 ) ) ( not ( = ?auto_395363 ?auto_395366 ) ) ( not ( = ?auto_395363 ?auto_395367 ) ) ( not ( = ?auto_395363 ?auto_395368 ) ) ( not ( = ?auto_395363 ?auto_395369 ) ) ( not ( = ?auto_395363 ?auto_395370 ) ) ( not ( = ?auto_395363 ?auto_395371 ) ) ( not ( = ?auto_395363 ?auto_395372 ) ) ( not ( = ?auto_395363 ?auto_395373 ) ) ( not ( = ?auto_395364 ?auto_395365 ) ) ( not ( = ?auto_395364 ?auto_395366 ) ) ( not ( = ?auto_395364 ?auto_395367 ) ) ( not ( = ?auto_395364 ?auto_395368 ) ) ( not ( = ?auto_395364 ?auto_395369 ) ) ( not ( = ?auto_395364 ?auto_395370 ) ) ( not ( = ?auto_395364 ?auto_395371 ) ) ( not ( = ?auto_395364 ?auto_395372 ) ) ( not ( = ?auto_395364 ?auto_395373 ) ) ( not ( = ?auto_395365 ?auto_395366 ) ) ( not ( = ?auto_395365 ?auto_395367 ) ) ( not ( = ?auto_395365 ?auto_395368 ) ) ( not ( = ?auto_395365 ?auto_395369 ) ) ( not ( = ?auto_395365 ?auto_395370 ) ) ( not ( = ?auto_395365 ?auto_395371 ) ) ( not ( = ?auto_395365 ?auto_395372 ) ) ( not ( = ?auto_395365 ?auto_395373 ) ) ( not ( = ?auto_395366 ?auto_395367 ) ) ( not ( = ?auto_395366 ?auto_395368 ) ) ( not ( = ?auto_395366 ?auto_395369 ) ) ( not ( = ?auto_395366 ?auto_395370 ) ) ( not ( = ?auto_395366 ?auto_395371 ) ) ( not ( = ?auto_395366 ?auto_395372 ) ) ( not ( = ?auto_395366 ?auto_395373 ) ) ( not ( = ?auto_395367 ?auto_395368 ) ) ( not ( = ?auto_395367 ?auto_395369 ) ) ( not ( = ?auto_395367 ?auto_395370 ) ) ( not ( = ?auto_395367 ?auto_395371 ) ) ( not ( = ?auto_395367 ?auto_395372 ) ) ( not ( = ?auto_395367 ?auto_395373 ) ) ( not ( = ?auto_395368 ?auto_395369 ) ) ( not ( = ?auto_395368 ?auto_395370 ) ) ( not ( = ?auto_395368 ?auto_395371 ) ) ( not ( = ?auto_395368 ?auto_395372 ) ) ( not ( = ?auto_395368 ?auto_395373 ) ) ( not ( = ?auto_395369 ?auto_395370 ) ) ( not ( = ?auto_395369 ?auto_395371 ) ) ( not ( = ?auto_395369 ?auto_395372 ) ) ( not ( = ?auto_395369 ?auto_395373 ) ) ( not ( = ?auto_395370 ?auto_395371 ) ) ( not ( = ?auto_395370 ?auto_395372 ) ) ( not ( = ?auto_395370 ?auto_395373 ) ) ( not ( = ?auto_395371 ?auto_395372 ) ) ( not ( = ?auto_395371 ?auto_395373 ) ) ( not ( = ?auto_395372 ?auto_395373 ) ) ( ON ?auto_395371 ?auto_395372 ) ( ON ?auto_395370 ?auto_395371 ) ( ON ?auto_395369 ?auto_395370 ) ( ON ?auto_395368 ?auto_395369 ) ( ON ?auto_395367 ?auto_395368 ) ( ON ?auto_395366 ?auto_395367 ) ( ON ?auto_395365 ?auto_395366 ) ( ON ?auto_395364 ?auto_395365 ) ( ON ?auto_395363 ?auto_395364 ) ( ON ?auto_395362 ?auto_395363 ) ( ON ?auto_395361 ?auto_395362 ) ( ON ?auto_395360 ?auto_395361 ) ( CLEAR ?auto_395360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_395360 )
      ( MAKE-13PILE ?auto_395360 ?auto_395361 ?auto_395362 ?auto_395363 ?auto_395364 ?auto_395365 ?auto_395366 ?auto_395367 ?auto_395368 ?auto_395369 ?auto_395370 ?auto_395371 ?auto_395372 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395388 - BLOCK
      ?auto_395389 - BLOCK
      ?auto_395390 - BLOCK
      ?auto_395391 - BLOCK
      ?auto_395392 - BLOCK
      ?auto_395393 - BLOCK
      ?auto_395394 - BLOCK
      ?auto_395395 - BLOCK
      ?auto_395396 - BLOCK
      ?auto_395397 - BLOCK
      ?auto_395398 - BLOCK
      ?auto_395399 - BLOCK
      ?auto_395400 - BLOCK
      ?auto_395401 - BLOCK
    )
    :vars
    (
      ?auto_395402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_395400 ) ( ON ?auto_395401 ?auto_395402 ) ( CLEAR ?auto_395401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_395388 ) ( ON ?auto_395389 ?auto_395388 ) ( ON ?auto_395390 ?auto_395389 ) ( ON ?auto_395391 ?auto_395390 ) ( ON ?auto_395392 ?auto_395391 ) ( ON ?auto_395393 ?auto_395392 ) ( ON ?auto_395394 ?auto_395393 ) ( ON ?auto_395395 ?auto_395394 ) ( ON ?auto_395396 ?auto_395395 ) ( ON ?auto_395397 ?auto_395396 ) ( ON ?auto_395398 ?auto_395397 ) ( ON ?auto_395399 ?auto_395398 ) ( ON ?auto_395400 ?auto_395399 ) ( not ( = ?auto_395388 ?auto_395389 ) ) ( not ( = ?auto_395388 ?auto_395390 ) ) ( not ( = ?auto_395388 ?auto_395391 ) ) ( not ( = ?auto_395388 ?auto_395392 ) ) ( not ( = ?auto_395388 ?auto_395393 ) ) ( not ( = ?auto_395388 ?auto_395394 ) ) ( not ( = ?auto_395388 ?auto_395395 ) ) ( not ( = ?auto_395388 ?auto_395396 ) ) ( not ( = ?auto_395388 ?auto_395397 ) ) ( not ( = ?auto_395388 ?auto_395398 ) ) ( not ( = ?auto_395388 ?auto_395399 ) ) ( not ( = ?auto_395388 ?auto_395400 ) ) ( not ( = ?auto_395388 ?auto_395401 ) ) ( not ( = ?auto_395388 ?auto_395402 ) ) ( not ( = ?auto_395389 ?auto_395390 ) ) ( not ( = ?auto_395389 ?auto_395391 ) ) ( not ( = ?auto_395389 ?auto_395392 ) ) ( not ( = ?auto_395389 ?auto_395393 ) ) ( not ( = ?auto_395389 ?auto_395394 ) ) ( not ( = ?auto_395389 ?auto_395395 ) ) ( not ( = ?auto_395389 ?auto_395396 ) ) ( not ( = ?auto_395389 ?auto_395397 ) ) ( not ( = ?auto_395389 ?auto_395398 ) ) ( not ( = ?auto_395389 ?auto_395399 ) ) ( not ( = ?auto_395389 ?auto_395400 ) ) ( not ( = ?auto_395389 ?auto_395401 ) ) ( not ( = ?auto_395389 ?auto_395402 ) ) ( not ( = ?auto_395390 ?auto_395391 ) ) ( not ( = ?auto_395390 ?auto_395392 ) ) ( not ( = ?auto_395390 ?auto_395393 ) ) ( not ( = ?auto_395390 ?auto_395394 ) ) ( not ( = ?auto_395390 ?auto_395395 ) ) ( not ( = ?auto_395390 ?auto_395396 ) ) ( not ( = ?auto_395390 ?auto_395397 ) ) ( not ( = ?auto_395390 ?auto_395398 ) ) ( not ( = ?auto_395390 ?auto_395399 ) ) ( not ( = ?auto_395390 ?auto_395400 ) ) ( not ( = ?auto_395390 ?auto_395401 ) ) ( not ( = ?auto_395390 ?auto_395402 ) ) ( not ( = ?auto_395391 ?auto_395392 ) ) ( not ( = ?auto_395391 ?auto_395393 ) ) ( not ( = ?auto_395391 ?auto_395394 ) ) ( not ( = ?auto_395391 ?auto_395395 ) ) ( not ( = ?auto_395391 ?auto_395396 ) ) ( not ( = ?auto_395391 ?auto_395397 ) ) ( not ( = ?auto_395391 ?auto_395398 ) ) ( not ( = ?auto_395391 ?auto_395399 ) ) ( not ( = ?auto_395391 ?auto_395400 ) ) ( not ( = ?auto_395391 ?auto_395401 ) ) ( not ( = ?auto_395391 ?auto_395402 ) ) ( not ( = ?auto_395392 ?auto_395393 ) ) ( not ( = ?auto_395392 ?auto_395394 ) ) ( not ( = ?auto_395392 ?auto_395395 ) ) ( not ( = ?auto_395392 ?auto_395396 ) ) ( not ( = ?auto_395392 ?auto_395397 ) ) ( not ( = ?auto_395392 ?auto_395398 ) ) ( not ( = ?auto_395392 ?auto_395399 ) ) ( not ( = ?auto_395392 ?auto_395400 ) ) ( not ( = ?auto_395392 ?auto_395401 ) ) ( not ( = ?auto_395392 ?auto_395402 ) ) ( not ( = ?auto_395393 ?auto_395394 ) ) ( not ( = ?auto_395393 ?auto_395395 ) ) ( not ( = ?auto_395393 ?auto_395396 ) ) ( not ( = ?auto_395393 ?auto_395397 ) ) ( not ( = ?auto_395393 ?auto_395398 ) ) ( not ( = ?auto_395393 ?auto_395399 ) ) ( not ( = ?auto_395393 ?auto_395400 ) ) ( not ( = ?auto_395393 ?auto_395401 ) ) ( not ( = ?auto_395393 ?auto_395402 ) ) ( not ( = ?auto_395394 ?auto_395395 ) ) ( not ( = ?auto_395394 ?auto_395396 ) ) ( not ( = ?auto_395394 ?auto_395397 ) ) ( not ( = ?auto_395394 ?auto_395398 ) ) ( not ( = ?auto_395394 ?auto_395399 ) ) ( not ( = ?auto_395394 ?auto_395400 ) ) ( not ( = ?auto_395394 ?auto_395401 ) ) ( not ( = ?auto_395394 ?auto_395402 ) ) ( not ( = ?auto_395395 ?auto_395396 ) ) ( not ( = ?auto_395395 ?auto_395397 ) ) ( not ( = ?auto_395395 ?auto_395398 ) ) ( not ( = ?auto_395395 ?auto_395399 ) ) ( not ( = ?auto_395395 ?auto_395400 ) ) ( not ( = ?auto_395395 ?auto_395401 ) ) ( not ( = ?auto_395395 ?auto_395402 ) ) ( not ( = ?auto_395396 ?auto_395397 ) ) ( not ( = ?auto_395396 ?auto_395398 ) ) ( not ( = ?auto_395396 ?auto_395399 ) ) ( not ( = ?auto_395396 ?auto_395400 ) ) ( not ( = ?auto_395396 ?auto_395401 ) ) ( not ( = ?auto_395396 ?auto_395402 ) ) ( not ( = ?auto_395397 ?auto_395398 ) ) ( not ( = ?auto_395397 ?auto_395399 ) ) ( not ( = ?auto_395397 ?auto_395400 ) ) ( not ( = ?auto_395397 ?auto_395401 ) ) ( not ( = ?auto_395397 ?auto_395402 ) ) ( not ( = ?auto_395398 ?auto_395399 ) ) ( not ( = ?auto_395398 ?auto_395400 ) ) ( not ( = ?auto_395398 ?auto_395401 ) ) ( not ( = ?auto_395398 ?auto_395402 ) ) ( not ( = ?auto_395399 ?auto_395400 ) ) ( not ( = ?auto_395399 ?auto_395401 ) ) ( not ( = ?auto_395399 ?auto_395402 ) ) ( not ( = ?auto_395400 ?auto_395401 ) ) ( not ( = ?auto_395400 ?auto_395402 ) ) ( not ( = ?auto_395401 ?auto_395402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_395401 ?auto_395402 )
      ( !STACK ?auto_395401 ?auto_395400 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395417 - BLOCK
      ?auto_395418 - BLOCK
      ?auto_395419 - BLOCK
      ?auto_395420 - BLOCK
      ?auto_395421 - BLOCK
      ?auto_395422 - BLOCK
      ?auto_395423 - BLOCK
      ?auto_395424 - BLOCK
      ?auto_395425 - BLOCK
      ?auto_395426 - BLOCK
      ?auto_395427 - BLOCK
      ?auto_395428 - BLOCK
      ?auto_395429 - BLOCK
      ?auto_395430 - BLOCK
    )
    :vars
    (
      ?auto_395431 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_395429 ) ( ON ?auto_395430 ?auto_395431 ) ( CLEAR ?auto_395430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_395417 ) ( ON ?auto_395418 ?auto_395417 ) ( ON ?auto_395419 ?auto_395418 ) ( ON ?auto_395420 ?auto_395419 ) ( ON ?auto_395421 ?auto_395420 ) ( ON ?auto_395422 ?auto_395421 ) ( ON ?auto_395423 ?auto_395422 ) ( ON ?auto_395424 ?auto_395423 ) ( ON ?auto_395425 ?auto_395424 ) ( ON ?auto_395426 ?auto_395425 ) ( ON ?auto_395427 ?auto_395426 ) ( ON ?auto_395428 ?auto_395427 ) ( ON ?auto_395429 ?auto_395428 ) ( not ( = ?auto_395417 ?auto_395418 ) ) ( not ( = ?auto_395417 ?auto_395419 ) ) ( not ( = ?auto_395417 ?auto_395420 ) ) ( not ( = ?auto_395417 ?auto_395421 ) ) ( not ( = ?auto_395417 ?auto_395422 ) ) ( not ( = ?auto_395417 ?auto_395423 ) ) ( not ( = ?auto_395417 ?auto_395424 ) ) ( not ( = ?auto_395417 ?auto_395425 ) ) ( not ( = ?auto_395417 ?auto_395426 ) ) ( not ( = ?auto_395417 ?auto_395427 ) ) ( not ( = ?auto_395417 ?auto_395428 ) ) ( not ( = ?auto_395417 ?auto_395429 ) ) ( not ( = ?auto_395417 ?auto_395430 ) ) ( not ( = ?auto_395417 ?auto_395431 ) ) ( not ( = ?auto_395418 ?auto_395419 ) ) ( not ( = ?auto_395418 ?auto_395420 ) ) ( not ( = ?auto_395418 ?auto_395421 ) ) ( not ( = ?auto_395418 ?auto_395422 ) ) ( not ( = ?auto_395418 ?auto_395423 ) ) ( not ( = ?auto_395418 ?auto_395424 ) ) ( not ( = ?auto_395418 ?auto_395425 ) ) ( not ( = ?auto_395418 ?auto_395426 ) ) ( not ( = ?auto_395418 ?auto_395427 ) ) ( not ( = ?auto_395418 ?auto_395428 ) ) ( not ( = ?auto_395418 ?auto_395429 ) ) ( not ( = ?auto_395418 ?auto_395430 ) ) ( not ( = ?auto_395418 ?auto_395431 ) ) ( not ( = ?auto_395419 ?auto_395420 ) ) ( not ( = ?auto_395419 ?auto_395421 ) ) ( not ( = ?auto_395419 ?auto_395422 ) ) ( not ( = ?auto_395419 ?auto_395423 ) ) ( not ( = ?auto_395419 ?auto_395424 ) ) ( not ( = ?auto_395419 ?auto_395425 ) ) ( not ( = ?auto_395419 ?auto_395426 ) ) ( not ( = ?auto_395419 ?auto_395427 ) ) ( not ( = ?auto_395419 ?auto_395428 ) ) ( not ( = ?auto_395419 ?auto_395429 ) ) ( not ( = ?auto_395419 ?auto_395430 ) ) ( not ( = ?auto_395419 ?auto_395431 ) ) ( not ( = ?auto_395420 ?auto_395421 ) ) ( not ( = ?auto_395420 ?auto_395422 ) ) ( not ( = ?auto_395420 ?auto_395423 ) ) ( not ( = ?auto_395420 ?auto_395424 ) ) ( not ( = ?auto_395420 ?auto_395425 ) ) ( not ( = ?auto_395420 ?auto_395426 ) ) ( not ( = ?auto_395420 ?auto_395427 ) ) ( not ( = ?auto_395420 ?auto_395428 ) ) ( not ( = ?auto_395420 ?auto_395429 ) ) ( not ( = ?auto_395420 ?auto_395430 ) ) ( not ( = ?auto_395420 ?auto_395431 ) ) ( not ( = ?auto_395421 ?auto_395422 ) ) ( not ( = ?auto_395421 ?auto_395423 ) ) ( not ( = ?auto_395421 ?auto_395424 ) ) ( not ( = ?auto_395421 ?auto_395425 ) ) ( not ( = ?auto_395421 ?auto_395426 ) ) ( not ( = ?auto_395421 ?auto_395427 ) ) ( not ( = ?auto_395421 ?auto_395428 ) ) ( not ( = ?auto_395421 ?auto_395429 ) ) ( not ( = ?auto_395421 ?auto_395430 ) ) ( not ( = ?auto_395421 ?auto_395431 ) ) ( not ( = ?auto_395422 ?auto_395423 ) ) ( not ( = ?auto_395422 ?auto_395424 ) ) ( not ( = ?auto_395422 ?auto_395425 ) ) ( not ( = ?auto_395422 ?auto_395426 ) ) ( not ( = ?auto_395422 ?auto_395427 ) ) ( not ( = ?auto_395422 ?auto_395428 ) ) ( not ( = ?auto_395422 ?auto_395429 ) ) ( not ( = ?auto_395422 ?auto_395430 ) ) ( not ( = ?auto_395422 ?auto_395431 ) ) ( not ( = ?auto_395423 ?auto_395424 ) ) ( not ( = ?auto_395423 ?auto_395425 ) ) ( not ( = ?auto_395423 ?auto_395426 ) ) ( not ( = ?auto_395423 ?auto_395427 ) ) ( not ( = ?auto_395423 ?auto_395428 ) ) ( not ( = ?auto_395423 ?auto_395429 ) ) ( not ( = ?auto_395423 ?auto_395430 ) ) ( not ( = ?auto_395423 ?auto_395431 ) ) ( not ( = ?auto_395424 ?auto_395425 ) ) ( not ( = ?auto_395424 ?auto_395426 ) ) ( not ( = ?auto_395424 ?auto_395427 ) ) ( not ( = ?auto_395424 ?auto_395428 ) ) ( not ( = ?auto_395424 ?auto_395429 ) ) ( not ( = ?auto_395424 ?auto_395430 ) ) ( not ( = ?auto_395424 ?auto_395431 ) ) ( not ( = ?auto_395425 ?auto_395426 ) ) ( not ( = ?auto_395425 ?auto_395427 ) ) ( not ( = ?auto_395425 ?auto_395428 ) ) ( not ( = ?auto_395425 ?auto_395429 ) ) ( not ( = ?auto_395425 ?auto_395430 ) ) ( not ( = ?auto_395425 ?auto_395431 ) ) ( not ( = ?auto_395426 ?auto_395427 ) ) ( not ( = ?auto_395426 ?auto_395428 ) ) ( not ( = ?auto_395426 ?auto_395429 ) ) ( not ( = ?auto_395426 ?auto_395430 ) ) ( not ( = ?auto_395426 ?auto_395431 ) ) ( not ( = ?auto_395427 ?auto_395428 ) ) ( not ( = ?auto_395427 ?auto_395429 ) ) ( not ( = ?auto_395427 ?auto_395430 ) ) ( not ( = ?auto_395427 ?auto_395431 ) ) ( not ( = ?auto_395428 ?auto_395429 ) ) ( not ( = ?auto_395428 ?auto_395430 ) ) ( not ( = ?auto_395428 ?auto_395431 ) ) ( not ( = ?auto_395429 ?auto_395430 ) ) ( not ( = ?auto_395429 ?auto_395431 ) ) ( not ( = ?auto_395430 ?auto_395431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_395430 ?auto_395431 )
      ( !STACK ?auto_395430 ?auto_395429 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395446 - BLOCK
      ?auto_395447 - BLOCK
      ?auto_395448 - BLOCK
      ?auto_395449 - BLOCK
      ?auto_395450 - BLOCK
      ?auto_395451 - BLOCK
      ?auto_395452 - BLOCK
      ?auto_395453 - BLOCK
      ?auto_395454 - BLOCK
      ?auto_395455 - BLOCK
      ?auto_395456 - BLOCK
      ?auto_395457 - BLOCK
      ?auto_395458 - BLOCK
      ?auto_395459 - BLOCK
    )
    :vars
    (
      ?auto_395460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395459 ?auto_395460 ) ( ON-TABLE ?auto_395446 ) ( ON ?auto_395447 ?auto_395446 ) ( ON ?auto_395448 ?auto_395447 ) ( ON ?auto_395449 ?auto_395448 ) ( ON ?auto_395450 ?auto_395449 ) ( ON ?auto_395451 ?auto_395450 ) ( ON ?auto_395452 ?auto_395451 ) ( ON ?auto_395453 ?auto_395452 ) ( ON ?auto_395454 ?auto_395453 ) ( ON ?auto_395455 ?auto_395454 ) ( ON ?auto_395456 ?auto_395455 ) ( ON ?auto_395457 ?auto_395456 ) ( not ( = ?auto_395446 ?auto_395447 ) ) ( not ( = ?auto_395446 ?auto_395448 ) ) ( not ( = ?auto_395446 ?auto_395449 ) ) ( not ( = ?auto_395446 ?auto_395450 ) ) ( not ( = ?auto_395446 ?auto_395451 ) ) ( not ( = ?auto_395446 ?auto_395452 ) ) ( not ( = ?auto_395446 ?auto_395453 ) ) ( not ( = ?auto_395446 ?auto_395454 ) ) ( not ( = ?auto_395446 ?auto_395455 ) ) ( not ( = ?auto_395446 ?auto_395456 ) ) ( not ( = ?auto_395446 ?auto_395457 ) ) ( not ( = ?auto_395446 ?auto_395458 ) ) ( not ( = ?auto_395446 ?auto_395459 ) ) ( not ( = ?auto_395446 ?auto_395460 ) ) ( not ( = ?auto_395447 ?auto_395448 ) ) ( not ( = ?auto_395447 ?auto_395449 ) ) ( not ( = ?auto_395447 ?auto_395450 ) ) ( not ( = ?auto_395447 ?auto_395451 ) ) ( not ( = ?auto_395447 ?auto_395452 ) ) ( not ( = ?auto_395447 ?auto_395453 ) ) ( not ( = ?auto_395447 ?auto_395454 ) ) ( not ( = ?auto_395447 ?auto_395455 ) ) ( not ( = ?auto_395447 ?auto_395456 ) ) ( not ( = ?auto_395447 ?auto_395457 ) ) ( not ( = ?auto_395447 ?auto_395458 ) ) ( not ( = ?auto_395447 ?auto_395459 ) ) ( not ( = ?auto_395447 ?auto_395460 ) ) ( not ( = ?auto_395448 ?auto_395449 ) ) ( not ( = ?auto_395448 ?auto_395450 ) ) ( not ( = ?auto_395448 ?auto_395451 ) ) ( not ( = ?auto_395448 ?auto_395452 ) ) ( not ( = ?auto_395448 ?auto_395453 ) ) ( not ( = ?auto_395448 ?auto_395454 ) ) ( not ( = ?auto_395448 ?auto_395455 ) ) ( not ( = ?auto_395448 ?auto_395456 ) ) ( not ( = ?auto_395448 ?auto_395457 ) ) ( not ( = ?auto_395448 ?auto_395458 ) ) ( not ( = ?auto_395448 ?auto_395459 ) ) ( not ( = ?auto_395448 ?auto_395460 ) ) ( not ( = ?auto_395449 ?auto_395450 ) ) ( not ( = ?auto_395449 ?auto_395451 ) ) ( not ( = ?auto_395449 ?auto_395452 ) ) ( not ( = ?auto_395449 ?auto_395453 ) ) ( not ( = ?auto_395449 ?auto_395454 ) ) ( not ( = ?auto_395449 ?auto_395455 ) ) ( not ( = ?auto_395449 ?auto_395456 ) ) ( not ( = ?auto_395449 ?auto_395457 ) ) ( not ( = ?auto_395449 ?auto_395458 ) ) ( not ( = ?auto_395449 ?auto_395459 ) ) ( not ( = ?auto_395449 ?auto_395460 ) ) ( not ( = ?auto_395450 ?auto_395451 ) ) ( not ( = ?auto_395450 ?auto_395452 ) ) ( not ( = ?auto_395450 ?auto_395453 ) ) ( not ( = ?auto_395450 ?auto_395454 ) ) ( not ( = ?auto_395450 ?auto_395455 ) ) ( not ( = ?auto_395450 ?auto_395456 ) ) ( not ( = ?auto_395450 ?auto_395457 ) ) ( not ( = ?auto_395450 ?auto_395458 ) ) ( not ( = ?auto_395450 ?auto_395459 ) ) ( not ( = ?auto_395450 ?auto_395460 ) ) ( not ( = ?auto_395451 ?auto_395452 ) ) ( not ( = ?auto_395451 ?auto_395453 ) ) ( not ( = ?auto_395451 ?auto_395454 ) ) ( not ( = ?auto_395451 ?auto_395455 ) ) ( not ( = ?auto_395451 ?auto_395456 ) ) ( not ( = ?auto_395451 ?auto_395457 ) ) ( not ( = ?auto_395451 ?auto_395458 ) ) ( not ( = ?auto_395451 ?auto_395459 ) ) ( not ( = ?auto_395451 ?auto_395460 ) ) ( not ( = ?auto_395452 ?auto_395453 ) ) ( not ( = ?auto_395452 ?auto_395454 ) ) ( not ( = ?auto_395452 ?auto_395455 ) ) ( not ( = ?auto_395452 ?auto_395456 ) ) ( not ( = ?auto_395452 ?auto_395457 ) ) ( not ( = ?auto_395452 ?auto_395458 ) ) ( not ( = ?auto_395452 ?auto_395459 ) ) ( not ( = ?auto_395452 ?auto_395460 ) ) ( not ( = ?auto_395453 ?auto_395454 ) ) ( not ( = ?auto_395453 ?auto_395455 ) ) ( not ( = ?auto_395453 ?auto_395456 ) ) ( not ( = ?auto_395453 ?auto_395457 ) ) ( not ( = ?auto_395453 ?auto_395458 ) ) ( not ( = ?auto_395453 ?auto_395459 ) ) ( not ( = ?auto_395453 ?auto_395460 ) ) ( not ( = ?auto_395454 ?auto_395455 ) ) ( not ( = ?auto_395454 ?auto_395456 ) ) ( not ( = ?auto_395454 ?auto_395457 ) ) ( not ( = ?auto_395454 ?auto_395458 ) ) ( not ( = ?auto_395454 ?auto_395459 ) ) ( not ( = ?auto_395454 ?auto_395460 ) ) ( not ( = ?auto_395455 ?auto_395456 ) ) ( not ( = ?auto_395455 ?auto_395457 ) ) ( not ( = ?auto_395455 ?auto_395458 ) ) ( not ( = ?auto_395455 ?auto_395459 ) ) ( not ( = ?auto_395455 ?auto_395460 ) ) ( not ( = ?auto_395456 ?auto_395457 ) ) ( not ( = ?auto_395456 ?auto_395458 ) ) ( not ( = ?auto_395456 ?auto_395459 ) ) ( not ( = ?auto_395456 ?auto_395460 ) ) ( not ( = ?auto_395457 ?auto_395458 ) ) ( not ( = ?auto_395457 ?auto_395459 ) ) ( not ( = ?auto_395457 ?auto_395460 ) ) ( not ( = ?auto_395458 ?auto_395459 ) ) ( not ( = ?auto_395458 ?auto_395460 ) ) ( not ( = ?auto_395459 ?auto_395460 ) ) ( CLEAR ?auto_395457 ) ( ON ?auto_395458 ?auto_395459 ) ( CLEAR ?auto_395458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_395446 ?auto_395447 ?auto_395448 ?auto_395449 ?auto_395450 ?auto_395451 ?auto_395452 ?auto_395453 ?auto_395454 ?auto_395455 ?auto_395456 ?auto_395457 ?auto_395458 )
      ( MAKE-14PILE ?auto_395446 ?auto_395447 ?auto_395448 ?auto_395449 ?auto_395450 ?auto_395451 ?auto_395452 ?auto_395453 ?auto_395454 ?auto_395455 ?auto_395456 ?auto_395457 ?auto_395458 ?auto_395459 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395475 - BLOCK
      ?auto_395476 - BLOCK
      ?auto_395477 - BLOCK
      ?auto_395478 - BLOCK
      ?auto_395479 - BLOCK
      ?auto_395480 - BLOCK
      ?auto_395481 - BLOCK
      ?auto_395482 - BLOCK
      ?auto_395483 - BLOCK
      ?auto_395484 - BLOCK
      ?auto_395485 - BLOCK
      ?auto_395486 - BLOCK
      ?auto_395487 - BLOCK
      ?auto_395488 - BLOCK
    )
    :vars
    (
      ?auto_395489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395488 ?auto_395489 ) ( ON-TABLE ?auto_395475 ) ( ON ?auto_395476 ?auto_395475 ) ( ON ?auto_395477 ?auto_395476 ) ( ON ?auto_395478 ?auto_395477 ) ( ON ?auto_395479 ?auto_395478 ) ( ON ?auto_395480 ?auto_395479 ) ( ON ?auto_395481 ?auto_395480 ) ( ON ?auto_395482 ?auto_395481 ) ( ON ?auto_395483 ?auto_395482 ) ( ON ?auto_395484 ?auto_395483 ) ( ON ?auto_395485 ?auto_395484 ) ( ON ?auto_395486 ?auto_395485 ) ( not ( = ?auto_395475 ?auto_395476 ) ) ( not ( = ?auto_395475 ?auto_395477 ) ) ( not ( = ?auto_395475 ?auto_395478 ) ) ( not ( = ?auto_395475 ?auto_395479 ) ) ( not ( = ?auto_395475 ?auto_395480 ) ) ( not ( = ?auto_395475 ?auto_395481 ) ) ( not ( = ?auto_395475 ?auto_395482 ) ) ( not ( = ?auto_395475 ?auto_395483 ) ) ( not ( = ?auto_395475 ?auto_395484 ) ) ( not ( = ?auto_395475 ?auto_395485 ) ) ( not ( = ?auto_395475 ?auto_395486 ) ) ( not ( = ?auto_395475 ?auto_395487 ) ) ( not ( = ?auto_395475 ?auto_395488 ) ) ( not ( = ?auto_395475 ?auto_395489 ) ) ( not ( = ?auto_395476 ?auto_395477 ) ) ( not ( = ?auto_395476 ?auto_395478 ) ) ( not ( = ?auto_395476 ?auto_395479 ) ) ( not ( = ?auto_395476 ?auto_395480 ) ) ( not ( = ?auto_395476 ?auto_395481 ) ) ( not ( = ?auto_395476 ?auto_395482 ) ) ( not ( = ?auto_395476 ?auto_395483 ) ) ( not ( = ?auto_395476 ?auto_395484 ) ) ( not ( = ?auto_395476 ?auto_395485 ) ) ( not ( = ?auto_395476 ?auto_395486 ) ) ( not ( = ?auto_395476 ?auto_395487 ) ) ( not ( = ?auto_395476 ?auto_395488 ) ) ( not ( = ?auto_395476 ?auto_395489 ) ) ( not ( = ?auto_395477 ?auto_395478 ) ) ( not ( = ?auto_395477 ?auto_395479 ) ) ( not ( = ?auto_395477 ?auto_395480 ) ) ( not ( = ?auto_395477 ?auto_395481 ) ) ( not ( = ?auto_395477 ?auto_395482 ) ) ( not ( = ?auto_395477 ?auto_395483 ) ) ( not ( = ?auto_395477 ?auto_395484 ) ) ( not ( = ?auto_395477 ?auto_395485 ) ) ( not ( = ?auto_395477 ?auto_395486 ) ) ( not ( = ?auto_395477 ?auto_395487 ) ) ( not ( = ?auto_395477 ?auto_395488 ) ) ( not ( = ?auto_395477 ?auto_395489 ) ) ( not ( = ?auto_395478 ?auto_395479 ) ) ( not ( = ?auto_395478 ?auto_395480 ) ) ( not ( = ?auto_395478 ?auto_395481 ) ) ( not ( = ?auto_395478 ?auto_395482 ) ) ( not ( = ?auto_395478 ?auto_395483 ) ) ( not ( = ?auto_395478 ?auto_395484 ) ) ( not ( = ?auto_395478 ?auto_395485 ) ) ( not ( = ?auto_395478 ?auto_395486 ) ) ( not ( = ?auto_395478 ?auto_395487 ) ) ( not ( = ?auto_395478 ?auto_395488 ) ) ( not ( = ?auto_395478 ?auto_395489 ) ) ( not ( = ?auto_395479 ?auto_395480 ) ) ( not ( = ?auto_395479 ?auto_395481 ) ) ( not ( = ?auto_395479 ?auto_395482 ) ) ( not ( = ?auto_395479 ?auto_395483 ) ) ( not ( = ?auto_395479 ?auto_395484 ) ) ( not ( = ?auto_395479 ?auto_395485 ) ) ( not ( = ?auto_395479 ?auto_395486 ) ) ( not ( = ?auto_395479 ?auto_395487 ) ) ( not ( = ?auto_395479 ?auto_395488 ) ) ( not ( = ?auto_395479 ?auto_395489 ) ) ( not ( = ?auto_395480 ?auto_395481 ) ) ( not ( = ?auto_395480 ?auto_395482 ) ) ( not ( = ?auto_395480 ?auto_395483 ) ) ( not ( = ?auto_395480 ?auto_395484 ) ) ( not ( = ?auto_395480 ?auto_395485 ) ) ( not ( = ?auto_395480 ?auto_395486 ) ) ( not ( = ?auto_395480 ?auto_395487 ) ) ( not ( = ?auto_395480 ?auto_395488 ) ) ( not ( = ?auto_395480 ?auto_395489 ) ) ( not ( = ?auto_395481 ?auto_395482 ) ) ( not ( = ?auto_395481 ?auto_395483 ) ) ( not ( = ?auto_395481 ?auto_395484 ) ) ( not ( = ?auto_395481 ?auto_395485 ) ) ( not ( = ?auto_395481 ?auto_395486 ) ) ( not ( = ?auto_395481 ?auto_395487 ) ) ( not ( = ?auto_395481 ?auto_395488 ) ) ( not ( = ?auto_395481 ?auto_395489 ) ) ( not ( = ?auto_395482 ?auto_395483 ) ) ( not ( = ?auto_395482 ?auto_395484 ) ) ( not ( = ?auto_395482 ?auto_395485 ) ) ( not ( = ?auto_395482 ?auto_395486 ) ) ( not ( = ?auto_395482 ?auto_395487 ) ) ( not ( = ?auto_395482 ?auto_395488 ) ) ( not ( = ?auto_395482 ?auto_395489 ) ) ( not ( = ?auto_395483 ?auto_395484 ) ) ( not ( = ?auto_395483 ?auto_395485 ) ) ( not ( = ?auto_395483 ?auto_395486 ) ) ( not ( = ?auto_395483 ?auto_395487 ) ) ( not ( = ?auto_395483 ?auto_395488 ) ) ( not ( = ?auto_395483 ?auto_395489 ) ) ( not ( = ?auto_395484 ?auto_395485 ) ) ( not ( = ?auto_395484 ?auto_395486 ) ) ( not ( = ?auto_395484 ?auto_395487 ) ) ( not ( = ?auto_395484 ?auto_395488 ) ) ( not ( = ?auto_395484 ?auto_395489 ) ) ( not ( = ?auto_395485 ?auto_395486 ) ) ( not ( = ?auto_395485 ?auto_395487 ) ) ( not ( = ?auto_395485 ?auto_395488 ) ) ( not ( = ?auto_395485 ?auto_395489 ) ) ( not ( = ?auto_395486 ?auto_395487 ) ) ( not ( = ?auto_395486 ?auto_395488 ) ) ( not ( = ?auto_395486 ?auto_395489 ) ) ( not ( = ?auto_395487 ?auto_395488 ) ) ( not ( = ?auto_395487 ?auto_395489 ) ) ( not ( = ?auto_395488 ?auto_395489 ) ) ( CLEAR ?auto_395486 ) ( ON ?auto_395487 ?auto_395488 ) ( CLEAR ?auto_395487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_395475 ?auto_395476 ?auto_395477 ?auto_395478 ?auto_395479 ?auto_395480 ?auto_395481 ?auto_395482 ?auto_395483 ?auto_395484 ?auto_395485 ?auto_395486 ?auto_395487 )
      ( MAKE-14PILE ?auto_395475 ?auto_395476 ?auto_395477 ?auto_395478 ?auto_395479 ?auto_395480 ?auto_395481 ?auto_395482 ?auto_395483 ?auto_395484 ?auto_395485 ?auto_395486 ?auto_395487 ?auto_395488 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395504 - BLOCK
      ?auto_395505 - BLOCK
      ?auto_395506 - BLOCK
      ?auto_395507 - BLOCK
      ?auto_395508 - BLOCK
      ?auto_395509 - BLOCK
      ?auto_395510 - BLOCK
      ?auto_395511 - BLOCK
      ?auto_395512 - BLOCK
      ?auto_395513 - BLOCK
      ?auto_395514 - BLOCK
      ?auto_395515 - BLOCK
      ?auto_395516 - BLOCK
      ?auto_395517 - BLOCK
    )
    :vars
    (
      ?auto_395518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395517 ?auto_395518 ) ( ON-TABLE ?auto_395504 ) ( ON ?auto_395505 ?auto_395504 ) ( ON ?auto_395506 ?auto_395505 ) ( ON ?auto_395507 ?auto_395506 ) ( ON ?auto_395508 ?auto_395507 ) ( ON ?auto_395509 ?auto_395508 ) ( ON ?auto_395510 ?auto_395509 ) ( ON ?auto_395511 ?auto_395510 ) ( ON ?auto_395512 ?auto_395511 ) ( ON ?auto_395513 ?auto_395512 ) ( ON ?auto_395514 ?auto_395513 ) ( not ( = ?auto_395504 ?auto_395505 ) ) ( not ( = ?auto_395504 ?auto_395506 ) ) ( not ( = ?auto_395504 ?auto_395507 ) ) ( not ( = ?auto_395504 ?auto_395508 ) ) ( not ( = ?auto_395504 ?auto_395509 ) ) ( not ( = ?auto_395504 ?auto_395510 ) ) ( not ( = ?auto_395504 ?auto_395511 ) ) ( not ( = ?auto_395504 ?auto_395512 ) ) ( not ( = ?auto_395504 ?auto_395513 ) ) ( not ( = ?auto_395504 ?auto_395514 ) ) ( not ( = ?auto_395504 ?auto_395515 ) ) ( not ( = ?auto_395504 ?auto_395516 ) ) ( not ( = ?auto_395504 ?auto_395517 ) ) ( not ( = ?auto_395504 ?auto_395518 ) ) ( not ( = ?auto_395505 ?auto_395506 ) ) ( not ( = ?auto_395505 ?auto_395507 ) ) ( not ( = ?auto_395505 ?auto_395508 ) ) ( not ( = ?auto_395505 ?auto_395509 ) ) ( not ( = ?auto_395505 ?auto_395510 ) ) ( not ( = ?auto_395505 ?auto_395511 ) ) ( not ( = ?auto_395505 ?auto_395512 ) ) ( not ( = ?auto_395505 ?auto_395513 ) ) ( not ( = ?auto_395505 ?auto_395514 ) ) ( not ( = ?auto_395505 ?auto_395515 ) ) ( not ( = ?auto_395505 ?auto_395516 ) ) ( not ( = ?auto_395505 ?auto_395517 ) ) ( not ( = ?auto_395505 ?auto_395518 ) ) ( not ( = ?auto_395506 ?auto_395507 ) ) ( not ( = ?auto_395506 ?auto_395508 ) ) ( not ( = ?auto_395506 ?auto_395509 ) ) ( not ( = ?auto_395506 ?auto_395510 ) ) ( not ( = ?auto_395506 ?auto_395511 ) ) ( not ( = ?auto_395506 ?auto_395512 ) ) ( not ( = ?auto_395506 ?auto_395513 ) ) ( not ( = ?auto_395506 ?auto_395514 ) ) ( not ( = ?auto_395506 ?auto_395515 ) ) ( not ( = ?auto_395506 ?auto_395516 ) ) ( not ( = ?auto_395506 ?auto_395517 ) ) ( not ( = ?auto_395506 ?auto_395518 ) ) ( not ( = ?auto_395507 ?auto_395508 ) ) ( not ( = ?auto_395507 ?auto_395509 ) ) ( not ( = ?auto_395507 ?auto_395510 ) ) ( not ( = ?auto_395507 ?auto_395511 ) ) ( not ( = ?auto_395507 ?auto_395512 ) ) ( not ( = ?auto_395507 ?auto_395513 ) ) ( not ( = ?auto_395507 ?auto_395514 ) ) ( not ( = ?auto_395507 ?auto_395515 ) ) ( not ( = ?auto_395507 ?auto_395516 ) ) ( not ( = ?auto_395507 ?auto_395517 ) ) ( not ( = ?auto_395507 ?auto_395518 ) ) ( not ( = ?auto_395508 ?auto_395509 ) ) ( not ( = ?auto_395508 ?auto_395510 ) ) ( not ( = ?auto_395508 ?auto_395511 ) ) ( not ( = ?auto_395508 ?auto_395512 ) ) ( not ( = ?auto_395508 ?auto_395513 ) ) ( not ( = ?auto_395508 ?auto_395514 ) ) ( not ( = ?auto_395508 ?auto_395515 ) ) ( not ( = ?auto_395508 ?auto_395516 ) ) ( not ( = ?auto_395508 ?auto_395517 ) ) ( not ( = ?auto_395508 ?auto_395518 ) ) ( not ( = ?auto_395509 ?auto_395510 ) ) ( not ( = ?auto_395509 ?auto_395511 ) ) ( not ( = ?auto_395509 ?auto_395512 ) ) ( not ( = ?auto_395509 ?auto_395513 ) ) ( not ( = ?auto_395509 ?auto_395514 ) ) ( not ( = ?auto_395509 ?auto_395515 ) ) ( not ( = ?auto_395509 ?auto_395516 ) ) ( not ( = ?auto_395509 ?auto_395517 ) ) ( not ( = ?auto_395509 ?auto_395518 ) ) ( not ( = ?auto_395510 ?auto_395511 ) ) ( not ( = ?auto_395510 ?auto_395512 ) ) ( not ( = ?auto_395510 ?auto_395513 ) ) ( not ( = ?auto_395510 ?auto_395514 ) ) ( not ( = ?auto_395510 ?auto_395515 ) ) ( not ( = ?auto_395510 ?auto_395516 ) ) ( not ( = ?auto_395510 ?auto_395517 ) ) ( not ( = ?auto_395510 ?auto_395518 ) ) ( not ( = ?auto_395511 ?auto_395512 ) ) ( not ( = ?auto_395511 ?auto_395513 ) ) ( not ( = ?auto_395511 ?auto_395514 ) ) ( not ( = ?auto_395511 ?auto_395515 ) ) ( not ( = ?auto_395511 ?auto_395516 ) ) ( not ( = ?auto_395511 ?auto_395517 ) ) ( not ( = ?auto_395511 ?auto_395518 ) ) ( not ( = ?auto_395512 ?auto_395513 ) ) ( not ( = ?auto_395512 ?auto_395514 ) ) ( not ( = ?auto_395512 ?auto_395515 ) ) ( not ( = ?auto_395512 ?auto_395516 ) ) ( not ( = ?auto_395512 ?auto_395517 ) ) ( not ( = ?auto_395512 ?auto_395518 ) ) ( not ( = ?auto_395513 ?auto_395514 ) ) ( not ( = ?auto_395513 ?auto_395515 ) ) ( not ( = ?auto_395513 ?auto_395516 ) ) ( not ( = ?auto_395513 ?auto_395517 ) ) ( not ( = ?auto_395513 ?auto_395518 ) ) ( not ( = ?auto_395514 ?auto_395515 ) ) ( not ( = ?auto_395514 ?auto_395516 ) ) ( not ( = ?auto_395514 ?auto_395517 ) ) ( not ( = ?auto_395514 ?auto_395518 ) ) ( not ( = ?auto_395515 ?auto_395516 ) ) ( not ( = ?auto_395515 ?auto_395517 ) ) ( not ( = ?auto_395515 ?auto_395518 ) ) ( not ( = ?auto_395516 ?auto_395517 ) ) ( not ( = ?auto_395516 ?auto_395518 ) ) ( not ( = ?auto_395517 ?auto_395518 ) ) ( ON ?auto_395516 ?auto_395517 ) ( CLEAR ?auto_395514 ) ( ON ?auto_395515 ?auto_395516 ) ( CLEAR ?auto_395515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_395504 ?auto_395505 ?auto_395506 ?auto_395507 ?auto_395508 ?auto_395509 ?auto_395510 ?auto_395511 ?auto_395512 ?auto_395513 ?auto_395514 ?auto_395515 )
      ( MAKE-14PILE ?auto_395504 ?auto_395505 ?auto_395506 ?auto_395507 ?auto_395508 ?auto_395509 ?auto_395510 ?auto_395511 ?auto_395512 ?auto_395513 ?auto_395514 ?auto_395515 ?auto_395516 ?auto_395517 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395533 - BLOCK
      ?auto_395534 - BLOCK
      ?auto_395535 - BLOCK
      ?auto_395536 - BLOCK
      ?auto_395537 - BLOCK
      ?auto_395538 - BLOCK
      ?auto_395539 - BLOCK
      ?auto_395540 - BLOCK
      ?auto_395541 - BLOCK
      ?auto_395542 - BLOCK
      ?auto_395543 - BLOCK
      ?auto_395544 - BLOCK
      ?auto_395545 - BLOCK
      ?auto_395546 - BLOCK
    )
    :vars
    (
      ?auto_395547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395546 ?auto_395547 ) ( ON-TABLE ?auto_395533 ) ( ON ?auto_395534 ?auto_395533 ) ( ON ?auto_395535 ?auto_395534 ) ( ON ?auto_395536 ?auto_395535 ) ( ON ?auto_395537 ?auto_395536 ) ( ON ?auto_395538 ?auto_395537 ) ( ON ?auto_395539 ?auto_395538 ) ( ON ?auto_395540 ?auto_395539 ) ( ON ?auto_395541 ?auto_395540 ) ( ON ?auto_395542 ?auto_395541 ) ( ON ?auto_395543 ?auto_395542 ) ( not ( = ?auto_395533 ?auto_395534 ) ) ( not ( = ?auto_395533 ?auto_395535 ) ) ( not ( = ?auto_395533 ?auto_395536 ) ) ( not ( = ?auto_395533 ?auto_395537 ) ) ( not ( = ?auto_395533 ?auto_395538 ) ) ( not ( = ?auto_395533 ?auto_395539 ) ) ( not ( = ?auto_395533 ?auto_395540 ) ) ( not ( = ?auto_395533 ?auto_395541 ) ) ( not ( = ?auto_395533 ?auto_395542 ) ) ( not ( = ?auto_395533 ?auto_395543 ) ) ( not ( = ?auto_395533 ?auto_395544 ) ) ( not ( = ?auto_395533 ?auto_395545 ) ) ( not ( = ?auto_395533 ?auto_395546 ) ) ( not ( = ?auto_395533 ?auto_395547 ) ) ( not ( = ?auto_395534 ?auto_395535 ) ) ( not ( = ?auto_395534 ?auto_395536 ) ) ( not ( = ?auto_395534 ?auto_395537 ) ) ( not ( = ?auto_395534 ?auto_395538 ) ) ( not ( = ?auto_395534 ?auto_395539 ) ) ( not ( = ?auto_395534 ?auto_395540 ) ) ( not ( = ?auto_395534 ?auto_395541 ) ) ( not ( = ?auto_395534 ?auto_395542 ) ) ( not ( = ?auto_395534 ?auto_395543 ) ) ( not ( = ?auto_395534 ?auto_395544 ) ) ( not ( = ?auto_395534 ?auto_395545 ) ) ( not ( = ?auto_395534 ?auto_395546 ) ) ( not ( = ?auto_395534 ?auto_395547 ) ) ( not ( = ?auto_395535 ?auto_395536 ) ) ( not ( = ?auto_395535 ?auto_395537 ) ) ( not ( = ?auto_395535 ?auto_395538 ) ) ( not ( = ?auto_395535 ?auto_395539 ) ) ( not ( = ?auto_395535 ?auto_395540 ) ) ( not ( = ?auto_395535 ?auto_395541 ) ) ( not ( = ?auto_395535 ?auto_395542 ) ) ( not ( = ?auto_395535 ?auto_395543 ) ) ( not ( = ?auto_395535 ?auto_395544 ) ) ( not ( = ?auto_395535 ?auto_395545 ) ) ( not ( = ?auto_395535 ?auto_395546 ) ) ( not ( = ?auto_395535 ?auto_395547 ) ) ( not ( = ?auto_395536 ?auto_395537 ) ) ( not ( = ?auto_395536 ?auto_395538 ) ) ( not ( = ?auto_395536 ?auto_395539 ) ) ( not ( = ?auto_395536 ?auto_395540 ) ) ( not ( = ?auto_395536 ?auto_395541 ) ) ( not ( = ?auto_395536 ?auto_395542 ) ) ( not ( = ?auto_395536 ?auto_395543 ) ) ( not ( = ?auto_395536 ?auto_395544 ) ) ( not ( = ?auto_395536 ?auto_395545 ) ) ( not ( = ?auto_395536 ?auto_395546 ) ) ( not ( = ?auto_395536 ?auto_395547 ) ) ( not ( = ?auto_395537 ?auto_395538 ) ) ( not ( = ?auto_395537 ?auto_395539 ) ) ( not ( = ?auto_395537 ?auto_395540 ) ) ( not ( = ?auto_395537 ?auto_395541 ) ) ( not ( = ?auto_395537 ?auto_395542 ) ) ( not ( = ?auto_395537 ?auto_395543 ) ) ( not ( = ?auto_395537 ?auto_395544 ) ) ( not ( = ?auto_395537 ?auto_395545 ) ) ( not ( = ?auto_395537 ?auto_395546 ) ) ( not ( = ?auto_395537 ?auto_395547 ) ) ( not ( = ?auto_395538 ?auto_395539 ) ) ( not ( = ?auto_395538 ?auto_395540 ) ) ( not ( = ?auto_395538 ?auto_395541 ) ) ( not ( = ?auto_395538 ?auto_395542 ) ) ( not ( = ?auto_395538 ?auto_395543 ) ) ( not ( = ?auto_395538 ?auto_395544 ) ) ( not ( = ?auto_395538 ?auto_395545 ) ) ( not ( = ?auto_395538 ?auto_395546 ) ) ( not ( = ?auto_395538 ?auto_395547 ) ) ( not ( = ?auto_395539 ?auto_395540 ) ) ( not ( = ?auto_395539 ?auto_395541 ) ) ( not ( = ?auto_395539 ?auto_395542 ) ) ( not ( = ?auto_395539 ?auto_395543 ) ) ( not ( = ?auto_395539 ?auto_395544 ) ) ( not ( = ?auto_395539 ?auto_395545 ) ) ( not ( = ?auto_395539 ?auto_395546 ) ) ( not ( = ?auto_395539 ?auto_395547 ) ) ( not ( = ?auto_395540 ?auto_395541 ) ) ( not ( = ?auto_395540 ?auto_395542 ) ) ( not ( = ?auto_395540 ?auto_395543 ) ) ( not ( = ?auto_395540 ?auto_395544 ) ) ( not ( = ?auto_395540 ?auto_395545 ) ) ( not ( = ?auto_395540 ?auto_395546 ) ) ( not ( = ?auto_395540 ?auto_395547 ) ) ( not ( = ?auto_395541 ?auto_395542 ) ) ( not ( = ?auto_395541 ?auto_395543 ) ) ( not ( = ?auto_395541 ?auto_395544 ) ) ( not ( = ?auto_395541 ?auto_395545 ) ) ( not ( = ?auto_395541 ?auto_395546 ) ) ( not ( = ?auto_395541 ?auto_395547 ) ) ( not ( = ?auto_395542 ?auto_395543 ) ) ( not ( = ?auto_395542 ?auto_395544 ) ) ( not ( = ?auto_395542 ?auto_395545 ) ) ( not ( = ?auto_395542 ?auto_395546 ) ) ( not ( = ?auto_395542 ?auto_395547 ) ) ( not ( = ?auto_395543 ?auto_395544 ) ) ( not ( = ?auto_395543 ?auto_395545 ) ) ( not ( = ?auto_395543 ?auto_395546 ) ) ( not ( = ?auto_395543 ?auto_395547 ) ) ( not ( = ?auto_395544 ?auto_395545 ) ) ( not ( = ?auto_395544 ?auto_395546 ) ) ( not ( = ?auto_395544 ?auto_395547 ) ) ( not ( = ?auto_395545 ?auto_395546 ) ) ( not ( = ?auto_395545 ?auto_395547 ) ) ( not ( = ?auto_395546 ?auto_395547 ) ) ( ON ?auto_395545 ?auto_395546 ) ( CLEAR ?auto_395543 ) ( ON ?auto_395544 ?auto_395545 ) ( CLEAR ?auto_395544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_395533 ?auto_395534 ?auto_395535 ?auto_395536 ?auto_395537 ?auto_395538 ?auto_395539 ?auto_395540 ?auto_395541 ?auto_395542 ?auto_395543 ?auto_395544 )
      ( MAKE-14PILE ?auto_395533 ?auto_395534 ?auto_395535 ?auto_395536 ?auto_395537 ?auto_395538 ?auto_395539 ?auto_395540 ?auto_395541 ?auto_395542 ?auto_395543 ?auto_395544 ?auto_395545 ?auto_395546 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395562 - BLOCK
      ?auto_395563 - BLOCK
      ?auto_395564 - BLOCK
      ?auto_395565 - BLOCK
      ?auto_395566 - BLOCK
      ?auto_395567 - BLOCK
      ?auto_395568 - BLOCK
      ?auto_395569 - BLOCK
      ?auto_395570 - BLOCK
      ?auto_395571 - BLOCK
      ?auto_395572 - BLOCK
      ?auto_395573 - BLOCK
      ?auto_395574 - BLOCK
      ?auto_395575 - BLOCK
    )
    :vars
    (
      ?auto_395576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395575 ?auto_395576 ) ( ON-TABLE ?auto_395562 ) ( ON ?auto_395563 ?auto_395562 ) ( ON ?auto_395564 ?auto_395563 ) ( ON ?auto_395565 ?auto_395564 ) ( ON ?auto_395566 ?auto_395565 ) ( ON ?auto_395567 ?auto_395566 ) ( ON ?auto_395568 ?auto_395567 ) ( ON ?auto_395569 ?auto_395568 ) ( ON ?auto_395570 ?auto_395569 ) ( ON ?auto_395571 ?auto_395570 ) ( not ( = ?auto_395562 ?auto_395563 ) ) ( not ( = ?auto_395562 ?auto_395564 ) ) ( not ( = ?auto_395562 ?auto_395565 ) ) ( not ( = ?auto_395562 ?auto_395566 ) ) ( not ( = ?auto_395562 ?auto_395567 ) ) ( not ( = ?auto_395562 ?auto_395568 ) ) ( not ( = ?auto_395562 ?auto_395569 ) ) ( not ( = ?auto_395562 ?auto_395570 ) ) ( not ( = ?auto_395562 ?auto_395571 ) ) ( not ( = ?auto_395562 ?auto_395572 ) ) ( not ( = ?auto_395562 ?auto_395573 ) ) ( not ( = ?auto_395562 ?auto_395574 ) ) ( not ( = ?auto_395562 ?auto_395575 ) ) ( not ( = ?auto_395562 ?auto_395576 ) ) ( not ( = ?auto_395563 ?auto_395564 ) ) ( not ( = ?auto_395563 ?auto_395565 ) ) ( not ( = ?auto_395563 ?auto_395566 ) ) ( not ( = ?auto_395563 ?auto_395567 ) ) ( not ( = ?auto_395563 ?auto_395568 ) ) ( not ( = ?auto_395563 ?auto_395569 ) ) ( not ( = ?auto_395563 ?auto_395570 ) ) ( not ( = ?auto_395563 ?auto_395571 ) ) ( not ( = ?auto_395563 ?auto_395572 ) ) ( not ( = ?auto_395563 ?auto_395573 ) ) ( not ( = ?auto_395563 ?auto_395574 ) ) ( not ( = ?auto_395563 ?auto_395575 ) ) ( not ( = ?auto_395563 ?auto_395576 ) ) ( not ( = ?auto_395564 ?auto_395565 ) ) ( not ( = ?auto_395564 ?auto_395566 ) ) ( not ( = ?auto_395564 ?auto_395567 ) ) ( not ( = ?auto_395564 ?auto_395568 ) ) ( not ( = ?auto_395564 ?auto_395569 ) ) ( not ( = ?auto_395564 ?auto_395570 ) ) ( not ( = ?auto_395564 ?auto_395571 ) ) ( not ( = ?auto_395564 ?auto_395572 ) ) ( not ( = ?auto_395564 ?auto_395573 ) ) ( not ( = ?auto_395564 ?auto_395574 ) ) ( not ( = ?auto_395564 ?auto_395575 ) ) ( not ( = ?auto_395564 ?auto_395576 ) ) ( not ( = ?auto_395565 ?auto_395566 ) ) ( not ( = ?auto_395565 ?auto_395567 ) ) ( not ( = ?auto_395565 ?auto_395568 ) ) ( not ( = ?auto_395565 ?auto_395569 ) ) ( not ( = ?auto_395565 ?auto_395570 ) ) ( not ( = ?auto_395565 ?auto_395571 ) ) ( not ( = ?auto_395565 ?auto_395572 ) ) ( not ( = ?auto_395565 ?auto_395573 ) ) ( not ( = ?auto_395565 ?auto_395574 ) ) ( not ( = ?auto_395565 ?auto_395575 ) ) ( not ( = ?auto_395565 ?auto_395576 ) ) ( not ( = ?auto_395566 ?auto_395567 ) ) ( not ( = ?auto_395566 ?auto_395568 ) ) ( not ( = ?auto_395566 ?auto_395569 ) ) ( not ( = ?auto_395566 ?auto_395570 ) ) ( not ( = ?auto_395566 ?auto_395571 ) ) ( not ( = ?auto_395566 ?auto_395572 ) ) ( not ( = ?auto_395566 ?auto_395573 ) ) ( not ( = ?auto_395566 ?auto_395574 ) ) ( not ( = ?auto_395566 ?auto_395575 ) ) ( not ( = ?auto_395566 ?auto_395576 ) ) ( not ( = ?auto_395567 ?auto_395568 ) ) ( not ( = ?auto_395567 ?auto_395569 ) ) ( not ( = ?auto_395567 ?auto_395570 ) ) ( not ( = ?auto_395567 ?auto_395571 ) ) ( not ( = ?auto_395567 ?auto_395572 ) ) ( not ( = ?auto_395567 ?auto_395573 ) ) ( not ( = ?auto_395567 ?auto_395574 ) ) ( not ( = ?auto_395567 ?auto_395575 ) ) ( not ( = ?auto_395567 ?auto_395576 ) ) ( not ( = ?auto_395568 ?auto_395569 ) ) ( not ( = ?auto_395568 ?auto_395570 ) ) ( not ( = ?auto_395568 ?auto_395571 ) ) ( not ( = ?auto_395568 ?auto_395572 ) ) ( not ( = ?auto_395568 ?auto_395573 ) ) ( not ( = ?auto_395568 ?auto_395574 ) ) ( not ( = ?auto_395568 ?auto_395575 ) ) ( not ( = ?auto_395568 ?auto_395576 ) ) ( not ( = ?auto_395569 ?auto_395570 ) ) ( not ( = ?auto_395569 ?auto_395571 ) ) ( not ( = ?auto_395569 ?auto_395572 ) ) ( not ( = ?auto_395569 ?auto_395573 ) ) ( not ( = ?auto_395569 ?auto_395574 ) ) ( not ( = ?auto_395569 ?auto_395575 ) ) ( not ( = ?auto_395569 ?auto_395576 ) ) ( not ( = ?auto_395570 ?auto_395571 ) ) ( not ( = ?auto_395570 ?auto_395572 ) ) ( not ( = ?auto_395570 ?auto_395573 ) ) ( not ( = ?auto_395570 ?auto_395574 ) ) ( not ( = ?auto_395570 ?auto_395575 ) ) ( not ( = ?auto_395570 ?auto_395576 ) ) ( not ( = ?auto_395571 ?auto_395572 ) ) ( not ( = ?auto_395571 ?auto_395573 ) ) ( not ( = ?auto_395571 ?auto_395574 ) ) ( not ( = ?auto_395571 ?auto_395575 ) ) ( not ( = ?auto_395571 ?auto_395576 ) ) ( not ( = ?auto_395572 ?auto_395573 ) ) ( not ( = ?auto_395572 ?auto_395574 ) ) ( not ( = ?auto_395572 ?auto_395575 ) ) ( not ( = ?auto_395572 ?auto_395576 ) ) ( not ( = ?auto_395573 ?auto_395574 ) ) ( not ( = ?auto_395573 ?auto_395575 ) ) ( not ( = ?auto_395573 ?auto_395576 ) ) ( not ( = ?auto_395574 ?auto_395575 ) ) ( not ( = ?auto_395574 ?auto_395576 ) ) ( not ( = ?auto_395575 ?auto_395576 ) ) ( ON ?auto_395574 ?auto_395575 ) ( ON ?auto_395573 ?auto_395574 ) ( CLEAR ?auto_395571 ) ( ON ?auto_395572 ?auto_395573 ) ( CLEAR ?auto_395572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_395562 ?auto_395563 ?auto_395564 ?auto_395565 ?auto_395566 ?auto_395567 ?auto_395568 ?auto_395569 ?auto_395570 ?auto_395571 ?auto_395572 )
      ( MAKE-14PILE ?auto_395562 ?auto_395563 ?auto_395564 ?auto_395565 ?auto_395566 ?auto_395567 ?auto_395568 ?auto_395569 ?auto_395570 ?auto_395571 ?auto_395572 ?auto_395573 ?auto_395574 ?auto_395575 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395591 - BLOCK
      ?auto_395592 - BLOCK
      ?auto_395593 - BLOCK
      ?auto_395594 - BLOCK
      ?auto_395595 - BLOCK
      ?auto_395596 - BLOCK
      ?auto_395597 - BLOCK
      ?auto_395598 - BLOCK
      ?auto_395599 - BLOCK
      ?auto_395600 - BLOCK
      ?auto_395601 - BLOCK
      ?auto_395602 - BLOCK
      ?auto_395603 - BLOCK
      ?auto_395604 - BLOCK
    )
    :vars
    (
      ?auto_395605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395604 ?auto_395605 ) ( ON-TABLE ?auto_395591 ) ( ON ?auto_395592 ?auto_395591 ) ( ON ?auto_395593 ?auto_395592 ) ( ON ?auto_395594 ?auto_395593 ) ( ON ?auto_395595 ?auto_395594 ) ( ON ?auto_395596 ?auto_395595 ) ( ON ?auto_395597 ?auto_395596 ) ( ON ?auto_395598 ?auto_395597 ) ( ON ?auto_395599 ?auto_395598 ) ( ON ?auto_395600 ?auto_395599 ) ( not ( = ?auto_395591 ?auto_395592 ) ) ( not ( = ?auto_395591 ?auto_395593 ) ) ( not ( = ?auto_395591 ?auto_395594 ) ) ( not ( = ?auto_395591 ?auto_395595 ) ) ( not ( = ?auto_395591 ?auto_395596 ) ) ( not ( = ?auto_395591 ?auto_395597 ) ) ( not ( = ?auto_395591 ?auto_395598 ) ) ( not ( = ?auto_395591 ?auto_395599 ) ) ( not ( = ?auto_395591 ?auto_395600 ) ) ( not ( = ?auto_395591 ?auto_395601 ) ) ( not ( = ?auto_395591 ?auto_395602 ) ) ( not ( = ?auto_395591 ?auto_395603 ) ) ( not ( = ?auto_395591 ?auto_395604 ) ) ( not ( = ?auto_395591 ?auto_395605 ) ) ( not ( = ?auto_395592 ?auto_395593 ) ) ( not ( = ?auto_395592 ?auto_395594 ) ) ( not ( = ?auto_395592 ?auto_395595 ) ) ( not ( = ?auto_395592 ?auto_395596 ) ) ( not ( = ?auto_395592 ?auto_395597 ) ) ( not ( = ?auto_395592 ?auto_395598 ) ) ( not ( = ?auto_395592 ?auto_395599 ) ) ( not ( = ?auto_395592 ?auto_395600 ) ) ( not ( = ?auto_395592 ?auto_395601 ) ) ( not ( = ?auto_395592 ?auto_395602 ) ) ( not ( = ?auto_395592 ?auto_395603 ) ) ( not ( = ?auto_395592 ?auto_395604 ) ) ( not ( = ?auto_395592 ?auto_395605 ) ) ( not ( = ?auto_395593 ?auto_395594 ) ) ( not ( = ?auto_395593 ?auto_395595 ) ) ( not ( = ?auto_395593 ?auto_395596 ) ) ( not ( = ?auto_395593 ?auto_395597 ) ) ( not ( = ?auto_395593 ?auto_395598 ) ) ( not ( = ?auto_395593 ?auto_395599 ) ) ( not ( = ?auto_395593 ?auto_395600 ) ) ( not ( = ?auto_395593 ?auto_395601 ) ) ( not ( = ?auto_395593 ?auto_395602 ) ) ( not ( = ?auto_395593 ?auto_395603 ) ) ( not ( = ?auto_395593 ?auto_395604 ) ) ( not ( = ?auto_395593 ?auto_395605 ) ) ( not ( = ?auto_395594 ?auto_395595 ) ) ( not ( = ?auto_395594 ?auto_395596 ) ) ( not ( = ?auto_395594 ?auto_395597 ) ) ( not ( = ?auto_395594 ?auto_395598 ) ) ( not ( = ?auto_395594 ?auto_395599 ) ) ( not ( = ?auto_395594 ?auto_395600 ) ) ( not ( = ?auto_395594 ?auto_395601 ) ) ( not ( = ?auto_395594 ?auto_395602 ) ) ( not ( = ?auto_395594 ?auto_395603 ) ) ( not ( = ?auto_395594 ?auto_395604 ) ) ( not ( = ?auto_395594 ?auto_395605 ) ) ( not ( = ?auto_395595 ?auto_395596 ) ) ( not ( = ?auto_395595 ?auto_395597 ) ) ( not ( = ?auto_395595 ?auto_395598 ) ) ( not ( = ?auto_395595 ?auto_395599 ) ) ( not ( = ?auto_395595 ?auto_395600 ) ) ( not ( = ?auto_395595 ?auto_395601 ) ) ( not ( = ?auto_395595 ?auto_395602 ) ) ( not ( = ?auto_395595 ?auto_395603 ) ) ( not ( = ?auto_395595 ?auto_395604 ) ) ( not ( = ?auto_395595 ?auto_395605 ) ) ( not ( = ?auto_395596 ?auto_395597 ) ) ( not ( = ?auto_395596 ?auto_395598 ) ) ( not ( = ?auto_395596 ?auto_395599 ) ) ( not ( = ?auto_395596 ?auto_395600 ) ) ( not ( = ?auto_395596 ?auto_395601 ) ) ( not ( = ?auto_395596 ?auto_395602 ) ) ( not ( = ?auto_395596 ?auto_395603 ) ) ( not ( = ?auto_395596 ?auto_395604 ) ) ( not ( = ?auto_395596 ?auto_395605 ) ) ( not ( = ?auto_395597 ?auto_395598 ) ) ( not ( = ?auto_395597 ?auto_395599 ) ) ( not ( = ?auto_395597 ?auto_395600 ) ) ( not ( = ?auto_395597 ?auto_395601 ) ) ( not ( = ?auto_395597 ?auto_395602 ) ) ( not ( = ?auto_395597 ?auto_395603 ) ) ( not ( = ?auto_395597 ?auto_395604 ) ) ( not ( = ?auto_395597 ?auto_395605 ) ) ( not ( = ?auto_395598 ?auto_395599 ) ) ( not ( = ?auto_395598 ?auto_395600 ) ) ( not ( = ?auto_395598 ?auto_395601 ) ) ( not ( = ?auto_395598 ?auto_395602 ) ) ( not ( = ?auto_395598 ?auto_395603 ) ) ( not ( = ?auto_395598 ?auto_395604 ) ) ( not ( = ?auto_395598 ?auto_395605 ) ) ( not ( = ?auto_395599 ?auto_395600 ) ) ( not ( = ?auto_395599 ?auto_395601 ) ) ( not ( = ?auto_395599 ?auto_395602 ) ) ( not ( = ?auto_395599 ?auto_395603 ) ) ( not ( = ?auto_395599 ?auto_395604 ) ) ( not ( = ?auto_395599 ?auto_395605 ) ) ( not ( = ?auto_395600 ?auto_395601 ) ) ( not ( = ?auto_395600 ?auto_395602 ) ) ( not ( = ?auto_395600 ?auto_395603 ) ) ( not ( = ?auto_395600 ?auto_395604 ) ) ( not ( = ?auto_395600 ?auto_395605 ) ) ( not ( = ?auto_395601 ?auto_395602 ) ) ( not ( = ?auto_395601 ?auto_395603 ) ) ( not ( = ?auto_395601 ?auto_395604 ) ) ( not ( = ?auto_395601 ?auto_395605 ) ) ( not ( = ?auto_395602 ?auto_395603 ) ) ( not ( = ?auto_395602 ?auto_395604 ) ) ( not ( = ?auto_395602 ?auto_395605 ) ) ( not ( = ?auto_395603 ?auto_395604 ) ) ( not ( = ?auto_395603 ?auto_395605 ) ) ( not ( = ?auto_395604 ?auto_395605 ) ) ( ON ?auto_395603 ?auto_395604 ) ( ON ?auto_395602 ?auto_395603 ) ( CLEAR ?auto_395600 ) ( ON ?auto_395601 ?auto_395602 ) ( CLEAR ?auto_395601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_395591 ?auto_395592 ?auto_395593 ?auto_395594 ?auto_395595 ?auto_395596 ?auto_395597 ?auto_395598 ?auto_395599 ?auto_395600 ?auto_395601 )
      ( MAKE-14PILE ?auto_395591 ?auto_395592 ?auto_395593 ?auto_395594 ?auto_395595 ?auto_395596 ?auto_395597 ?auto_395598 ?auto_395599 ?auto_395600 ?auto_395601 ?auto_395602 ?auto_395603 ?auto_395604 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395620 - BLOCK
      ?auto_395621 - BLOCK
      ?auto_395622 - BLOCK
      ?auto_395623 - BLOCK
      ?auto_395624 - BLOCK
      ?auto_395625 - BLOCK
      ?auto_395626 - BLOCK
      ?auto_395627 - BLOCK
      ?auto_395628 - BLOCK
      ?auto_395629 - BLOCK
      ?auto_395630 - BLOCK
      ?auto_395631 - BLOCK
      ?auto_395632 - BLOCK
      ?auto_395633 - BLOCK
    )
    :vars
    (
      ?auto_395634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395633 ?auto_395634 ) ( ON-TABLE ?auto_395620 ) ( ON ?auto_395621 ?auto_395620 ) ( ON ?auto_395622 ?auto_395621 ) ( ON ?auto_395623 ?auto_395622 ) ( ON ?auto_395624 ?auto_395623 ) ( ON ?auto_395625 ?auto_395624 ) ( ON ?auto_395626 ?auto_395625 ) ( ON ?auto_395627 ?auto_395626 ) ( ON ?auto_395628 ?auto_395627 ) ( not ( = ?auto_395620 ?auto_395621 ) ) ( not ( = ?auto_395620 ?auto_395622 ) ) ( not ( = ?auto_395620 ?auto_395623 ) ) ( not ( = ?auto_395620 ?auto_395624 ) ) ( not ( = ?auto_395620 ?auto_395625 ) ) ( not ( = ?auto_395620 ?auto_395626 ) ) ( not ( = ?auto_395620 ?auto_395627 ) ) ( not ( = ?auto_395620 ?auto_395628 ) ) ( not ( = ?auto_395620 ?auto_395629 ) ) ( not ( = ?auto_395620 ?auto_395630 ) ) ( not ( = ?auto_395620 ?auto_395631 ) ) ( not ( = ?auto_395620 ?auto_395632 ) ) ( not ( = ?auto_395620 ?auto_395633 ) ) ( not ( = ?auto_395620 ?auto_395634 ) ) ( not ( = ?auto_395621 ?auto_395622 ) ) ( not ( = ?auto_395621 ?auto_395623 ) ) ( not ( = ?auto_395621 ?auto_395624 ) ) ( not ( = ?auto_395621 ?auto_395625 ) ) ( not ( = ?auto_395621 ?auto_395626 ) ) ( not ( = ?auto_395621 ?auto_395627 ) ) ( not ( = ?auto_395621 ?auto_395628 ) ) ( not ( = ?auto_395621 ?auto_395629 ) ) ( not ( = ?auto_395621 ?auto_395630 ) ) ( not ( = ?auto_395621 ?auto_395631 ) ) ( not ( = ?auto_395621 ?auto_395632 ) ) ( not ( = ?auto_395621 ?auto_395633 ) ) ( not ( = ?auto_395621 ?auto_395634 ) ) ( not ( = ?auto_395622 ?auto_395623 ) ) ( not ( = ?auto_395622 ?auto_395624 ) ) ( not ( = ?auto_395622 ?auto_395625 ) ) ( not ( = ?auto_395622 ?auto_395626 ) ) ( not ( = ?auto_395622 ?auto_395627 ) ) ( not ( = ?auto_395622 ?auto_395628 ) ) ( not ( = ?auto_395622 ?auto_395629 ) ) ( not ( = ?auto_395622 ?auto_395630 ) ) ( not ( = ?auto_395622 ?auto_395631 ) ) ( not ( = ?auto_395622 ?auto_395632 ) ) ( not ( = ?auto_395622 ?auto_395633 ) ) ( not ( = ?auto_395622 ?auto_395634 ) ) ( not ( = ?auto_395623 ?auto_395624 ) ) ( not ( = ?auto_395623 ?auto_395625 ) ) ( not ( = ?auto_395623 ?auto_395626 ) ) ( not ( = ?auto_395623 ?auto_395627 ) ) ( not ( = ?auto_395623 ?auto_395628 ) ) ( not ( = ?auto_395623 ?auto_395629 ) ) ( not ( = ?auto_395623 ?auto_395630 ) ) ( not ( = ?auto_395623 ?auto_395631 ) ) ( not ( = ?auto_395623 ?auto_395632 ) ) ( not ( = ?auto_395623 ?auto_395633 ) ) ( not ( = ?auto_395623 ?auto_395634 ) ) ( not ( = ?auto_395624 ?auto_395625 ) ) ( not ( = ?auto_395624 ?auto_395626 ) ) ( not ( = ?auto_395624 ?auto_395627 ) ) ( not ( = ?auto_395624 ?auto_395628 ) ) ( not ( = ?auto_395624 ?auto_395629 ) ) ( not ( = ?auto_395624 ?auto_395630 ) ) ( not ( = ?auto_395624 ?auto_395631 ) ) ( not ( = ?auto_395624 ?auto_395632 ) ) ( not ( = ?auto_395624 ?auto_395633 ) ) ( not ( = ?auto_395624 ?auto_395634 ) ) ( not ( = ?auto_395625 ?auto_395626 ) ) ( not ( = ?auto_395625 ?auto_395627 ) ) ( not ( = ?auto_395625 ?auto_395628 ) ) ( not ( = ?auto_395625 ?auto_395629 ) ) ( not ( = ?auto_395625 ?auto_395630 ) ) ( not ( = ?auto_395625 ?auto_395631 ) ) ( not ( = ?auto_395625 ?auto_395632 ) ) ( not ( = ?auto_395625 ?auto_395633 ) ) ( not ( = ?auto_395625 ?auto_395634 ) ) ( not ( = ?auto_395626 ?auto_395627 ) ) ( not ( = ?auto_395626 ?auto_395628 ) ) ( not ( = ?auto_395626 ?auto_395629 ) ) ( not ( = ?auto_395626 ?auto_395630 ) ) ( not ( = ?auto_395626 ?auto_395631 ) ) ( not ( = ?auto_395626 ?auto_395632 ) ) ( not ( = ?auto_395626 ?auto_395633 ) ) ( not ( = ?auto_395626 ?auto_395634 ) ) ( not ( = ?auto_395627 ?auto_395628 ) ) ( not ( = ?auto_395627 ?auto_395629 ) ) ( not ( = ?auto_395627 ?auto_395630 ) ) ( not ( = ?auto_395627 ?auto_395631 ) ) ( not ( = ?auto_395627 ?auto_395632 ) ) ( not ( = ?auto_395627 ?auto_395633 ) ) ( not ( = ?auto_395627 ?auto_395634 ) ) ( not ( = ?auto_395628 ?auto_395629 ) ) ( not ( = ?auto_395628 ?auto_395630 ) ) ( not ( = ?auto_395628 ?auto_395631 ) ) ( not ( = ?auto_395628 ?auto_395632 ) ) ( not ( = ?auto_395628 ?auto_395633 ) ) ( not ( = ?auto_395628 ?auto_395634 ) ) ( not ( = ?auto_395629 ?auto_395630 ) ) ( not ( = ?auto_395629 ?auto_395631 ) ) ( not ( = ?auto_395629 ?auto_395632 ) ) ( not ( = ?auto_395629 ?auto_395633 ) ) ( not ( = ?auto_395629 ?auto_395634 ) ) ( not ( = ?auto_395630 ?auto_395631 ) ) ( not ( = ?auto_395630 ?auto_395632 ) ) ( not ( = ?auto_395630 ?auto_395633 ) ) ( not ( = ?auto_395630 ?auto_395634 ) ) ( not ( = ?auto_395631 ?auto_395632 ) ) ( not ( = ?auto_395631 ?auto_395633 ) ) ( not ( = ?auto_395631 ?auto_395634 ) ) ( not ( = ?auto_395632 ?auto_395633 ) ) ( not ( = ?auto_395632 ?auto_395634 ) ) ( not ( = ?auto_395633 ?auto_395634 ) ) ( ON ?auto_395632 ?auto_395633 ) ( ON ?auto_395631 ?auto_395632 ) ( ON ?auto_395630 ?auto_395631 ) ( CLEAR ?auto_395628 ) ( ON ?auto_395629 ?auto_395630 ) ( CLEAR ?auto_395629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_395620 ?auto_395621 ?auto_395622 ?auto_395623 ?auto_395624 ?auto_395625 ?auto_395626 ?auto_395627 ?auto_395628 ?auto_395629 )
      ( MAKE-14PILE ?auto_395620 ?auto_395621 ?auto_395622 ?auto_395623 ?auto_395624 ?auto_395625 ?auto_395626 ?auto_395627 ?auto_395628 ?auto_395629 ?auto_395630 ?auto_395631 ?auto_395632 ?auto_395633 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395649 - BLOCK
      ?auto_395650 - BLOCK
      ?auto_395651 - BLOCK
      ?auto_395652 - BLOCK
      ?auto_395653 - BLOCK
      ?auto_395654 - BLOCK
      ?auto_395655 - BLOCK
      ?auto_395656 - BLOCK
      ?auto_395657 - BLOCK
      ?auto_395658 - BLOCK
      ?auto_395659 - BLOCK
      ?auto_395660 - BLOCK
      ?auto_395661 - BLOCK
      ?auto_395662 - BLOCK
    )
    :vars
    (
      ?auto_395663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395662 ?auto_395663 ) ( ON-TABLE ?auto_395649 ) ( ON ?auto_395650 ?auto_395649 ) ( ON ?auto_395651 ?auto_395650 ) ( ON ?auto_395652 ?auto_395651 ) ( ON ?auto_395653 ?auto_395652 ) ( ON ?auto_395654 ?auto_395653 ) ( ON ?auto_395655 ?auto_395654 ) ( ON ?auto_395656 ?auto_395655 ) ( ON ?auto_395657 ?auto_395656 ) ( not ( = ?auto_395649 ?auto_395650 ) ) ( not ( = ?auto_395649 ?auto_395651 ) ) ( not ( = ?auto_395649 ?auto_395652 ) ) ( not ( = ?auto_395649 ?auto_395653 ) ) ( not ( = ?auto_395649 ?auto_395654 ) ) ( not ( = ?auto_395649 ?auto_395655 ) ) ( not ( = ?auto_395649 ?auto_395656 ) ) ( not ( = ?auto_395649 ?auto_395657 ) ) ( not ( = ?auto_395649 ?auto_395658 ) ) ( not ( = ?auto_395649 ?auto_395659 ) ) ( not ( = ?auto_395649 ?auto_395660 ) ) ( not ( = ?auto_395649 ?auto_395661 ) ) ( not ( = ?auto_395649 ?auto_395662 ) ) ( not ( = ?auto_395649 ?auto_395663 ) ) ( not ( = ?auto_395650 ?auto_395651 ) ) ( not ( = ?auto_395650 ?auto_395652 ) ) ( not ( = ?auto_395650 ?auto_395653 ) ) ( not ( = ?auto_395650 ?auto_395654 ) ) ( not ( = ?auto_395650 ?auto_395655 ) ) ( not ( = ?auto_395650 ?auto_395656 ) ) ( not ( = ?auto_395650 ?auto_395657 ) ) ( not ( = ?auto_395650 ?auto_395658 ) ) ( not ( = ?auto_395650 ?auto_395659 ) ) ( not ( = ?auto_395650 ?auto_395660 ) ) ( not ( = ?auto_395650 ?auto_395661 ) ) ( not ( = ?auto_395650 ?auto_395662 ) ) ( not ( = ?auto_395650 ?auto_395663 ) ) ( not ( = ?auto_395651 ?auto_395652 ) ) ( not ( = ?auto_395651 ?auto_395653 ) ) ( not ( = ?auto_395651 ?auto_395654 ) ) ( not ( = ?auto_395651 ?auto_395655 ) ) ( not ( = ?auto_395651 ?auto_395656 ) ) ( not ( = ?auto_395651 ?auto_395657 ) ) ( not ( = ?auto_395651 ?auto_395658 ) ) ( not ( = ?auto_395651 ?auto_395659 ) ) ( not ( = ?auto_395651 ?auto_395660 ) ) ( not ( = ?auto_395651 ?auto_395661 ) ) ( not ( = ?auto_395651 ?auto_395662 ) ) ( not ( = ?auto_395651 ?auto_395663 ) ) ( not ( = ?auto_395652 ?auto_395653 ) ) ( not ( = ?auto_395652 ?auto_395654 ) ) ( not ( = ?auto_395652 ?auto_395655 ) ) ( not ( = ?auto_395652 ?auto_395656 ) ) ( not ( = ?auto_395652 ?auto_395657 ) ) ( not ( = ?auto_395652 ?auto_395658 ) ) ( not ( = ?auto_395652 ?auto_395659 ) ) ( not ( = ?auto_395652 ?auto_395660 ) ) ( not ( = ?auto_395652 ?auto_395661 ) ) ( not ( = ?auto_395652 ?auto_395662 ) ) ( not ( = ?auto_395652 ?auto_395663 ) ) ( not ( = ?auto_395653 ?auto_395654 ) ) ( not ( = ?auto_395653 ?auto_395655 ) ) ( not ( = ?auto_395653 ?auto_395656 ) ) ( not ( = ?auto_395653 ?auto_395657 ) ) ( not ( = ?auto_395653 ?auto_395658 ) ) ( not ( = ?auto_395653 ?auto_395659 ) ) ( not ( = ?auto_395653 ?auto_395660 ) ) ( not ( = ?auto_395653 ?auto_395661 ) ) ( not ( = ?auto_395653 ?auto_395662 ) ) ( not ( = ?auto_395653 ?auto_395663 ) ) ( not ( = ?auto_395654 ?auto_395655 ) ) ( not ( = ?auto_395654 ?auto_395656 ) ) ( not ( = ?auto_395654 ?auto_395657 ) ) ( not ( = ?auto_395654 ?auto_395658 ) ) ( not ( = ?auto_395654 ?auto_395659 ) ) ( not ( = ?auto_395654 ?auto_395660 ) ) ( not ( = ?auto_395654 ?auto_395661 ) ) ( not ( = ?auto_395654 ?auto_395662 ) ) ( not ( = ?auto_395654 ?auto_395663 ) ) ( not ( = ?auto_395655 ?auto_395656 ) ) ( not ( = ?auto_395655 ?auto_395657 ) ) ( not ( = ?auto_395655 ?auto_395658 ) ) ( not ( = ?auto_395655 ?auto_395659 ) ) ( not ( = ?auto_395655 ?auto_395660 ) ) ( not ( = ?auto_395655 ?auto_395661 ) ) ( not ( = ?auto_395655 ?auto_395662 ) ) ( not ( = ?auto_395655 ?auto_395663 ) ) ( not ( = ?auto_395656 ?auto_395657 ) ) ( not ( = ?auto_395656 ?auto_395658 ) ) ( not ( = ?auto_395656 ?auto_395659 ) ) ( not ( = ?auto_395656 ?auto_395660 ) ) ( not ( = ?auto_395656 ?auto_395661 ) ) ( not ( = ?auto_395656 ?auto_395662 ) ) ( not ( = ?auto_395656 ?auto_395663 ) ) ( not ( = ?auto_395657 ?auto_395658 ) ) ( not ( = ?auto_395657 ?auto_395659 ) ) ( not ( = ?auto_395657 ?auto_395660 ) ) ( not ( = ?auto_395657 ?auto_395661 ) ) ( not ( = ?auto_395657 ?auto_395662 ) ) ( not ( = ?auto_395657 ?auto_395663 ) ) ( not ( = ?auto_395658 ?auto_395659 ) ) ( not ( = ?auto_395658 ?auto_395660 ) ) ( not ( = ?auto_395658 ?auto_395661 ) ) ( not ( = ?auto_395658 ?auto_395662 ) ) ( not ( = ?auto_395658 ?auto_395663 ) ) ( not ( = ?auto_395659 ?auto_395660 ) ) ( not ( = ?auto_395659 ?auto_395661 ) ) ( not ( = ?auto_395659 ?auto_395662 ) ) ( not ( = ?auto_395659 ?auto_395663 ) ) ( not ( = ?auto_395660 ?auto_395661 ) ) ( not ( = ?auto_395660 ?auto_395662 ) ) ( not ( = ?auto_395660 ?auto_395663 ) ) ( not ( = ?auto_395661 ?auto_395662 ) ) ( not ( = ?auto_395661 ?auto_395663 ) ) ( not ( = ?auto_395662 ?auto_395663 ) ) ( ON ?auto_395661 ?auto_395662 ) ( ON ?auto_395660 ?auto_395661 ) ( ON ?auto_395659 ?auto_395660 ) ( CLEAR ?auto_395657 ) ( ON ?auto_395658 ?auto_395659 ) ( CLEAR ?auto_395658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_395649 ?auto_395650 ?auto_395651 ?auto_395652 ?auto_395653 ?auto_395654 ?auto_395655 ?auto_395656 ?auto_395657 ?auto_395658 )
      ( MAKE-14PILE ?auto_395649 ?auto_395650 ?auto_395651 ?auto_395652 ?auto_395653 ?auto_395654 ?auto_395655 ?auto_395656 ?auto_395657 ?auto_395658 ?auto_395659 ?auto_395660 ?auto_395661 ?auto_395662 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395678 - BLOCK
      ?auto_395679 - BLOCK
      ?auto_395680 - BLOCK
      ?auto_395681 - BLOCK
      ?auto_395682 - BLOCK
      ?auto_395683 - BLOCK
      ?auto_395684 - BLOCK
      ?auto_395685 - BLOCK
      ?auto_395686 - BLOCK
      ?auto_395687 - BLOCK
      ?auto_395688 - BLOCK
      ?auto_395689 - BLOCK
      ?auto_395690 - BLOCK
      ?auto_395691 - BLOCK
    )
    :vars
    (
      ?auto_395692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395691 ?auto_395692 ) ( ON-TABLE ?auto_395678 ) ( ON ?auto_395679 ?auto_395678 ) ( ON ?auto_395680 ?auto_395679 ) ( ON ?auto_395681 ?auto_395680 ) ( ON ?auto_395682 ?auto_395681 ) ( ON ?auto_395683 ?auto_395682 ) ( ON ?auto_395684 ?auto_395683 ) ( ON ?auto_395685 ?auto_395684 ) ( not ( = ?auto_395678 ?auto_395679 ) ) ( not ( = ?auto_395678 ?auto_395680 ) ) ( not ( = ?auto_395678 ?auto_395681 ) ) ( not ( = ?auto_395678 ?auto_395682 ) ) ( not ( = ?auto_395678 ?auto_395683 ) ) ( not ( = ?auto_395678 ?auto_395684 ) ) ( not ( = ?auto_395678 ?auto_395685 ) ) ( not ( = ?auto_395678 ?auto_395686 ) ) ( not ( = ?auto_395678 ?auto_395687 ) ) ( not ( = ?auto_395678 ?auto_395688 ) ) ( not ( = ?auto_395678 ?auto_395689 ) ) ( not ( = ?auto_395678 ?auto_395690 ) ) ( not ( = ?auto_395678 ?auto_395691 ) ) ( not ( = ?auto_395678 ?auto_395692 ) ) ( not ( = ?auto_395679 ?auto_395680 ) ) ( not ( = ?auto_395679 ?auto_395681 ) ) ( not ( = ?auto_395679 ?auto_395682 ) ) ( not ( = ?auto_395679 ?auto_395683 ) ) ( not ( = ?auto_395679 ?auto_395684 ) ) ( not ( = ?auto_395679 ?auto_395685 ) ) ( not ( = ?auto_395679 ?auto_395686 ) ) ( not ( = ?auto_395679 ?auto_395687 ) ) ( not ( = ?auto_395679 ?auto_395688 ) ) ( not ( = ?auto_395679 ?auto_395689 ) ) ( not ( = ?auto_395679 ?auto_395690 ) ) ( not ( = ?auto_395679 ?auto_395691 ) ) ( not ( = ?auto_395679 ?auto_395692 ) ) ( not ( = ?auto_395680 ?auto_395681 ) ) ( not ( = ?auto_395680 ?auto_395682 ) ) ( not ( = ?auto_395680 ?auto_395683 ) ) ( not ( = ?auto_395680 ?auto_395684 ) ) ( not ( = ?auto_395680 ?auto_395685 ) ) ( not ( = ?auto_395680 ?auto_395686 ) ) ( not ( = ?auto_395680 ?auto_395687 ) ) ( not ( = ?auto_395680 ?auto_395688 ) ) ( not ( = ?auto_395680 ?auto_395689 ) ) ( not ( = ?auto_395680 ?auto_395690 ) ) ( not ( = ?auto_395680 ?auto_395691 ) ) ( not ( = ?auto_395680 ?auto_395692 ) ) ( not ( = ?auto_395681 ?auto_395682 ) ) ( not ( = ?auto_395681 ?auto_395683 ) ) ( not ( = ?auto_395681 ?auto_395684 ) ) ( not ( = ?auto_395681 ?auto_395685 ) ) ( not ( = ?auto_395681 ?auto_395686 ) ) ( not ( = ?auto_395681 ?auto_395687 ) ) ( not ( = ?auto_395681 ?auto_395688 ) ) ( not ( = ?auto_395681 ?auto_395689 ) ) ( not ( = ?auto_395681 ?auto_395690 ) ) ( not ( = ?auto_395681 ?auto_395691 ) ) ( not ( = ?auto_395681 ?auto_395692 ) ) ( not ( = ?auto_395682 ?auto_395683 ) ) ( not ( = ?auto_395682 ?auto_395684 ) ) ( not ( = ?auto_395682 ?auto_395685 ) ) ( not ( = ?auto_395682 ?auto_395686 ) ) ( not ( = ?auto_395682 ?auto_395687 ) ) ( not ( = ?auto_395682 ?auto_395688 ) ) ( not ( = ?auto_395682 ?auto_395689 ) ) ( not ( = ?auto_395682 ?auto_395690 ) ) ( not ( = ?auto_395682 ?auto_395691 ) ) ( not ( = ?auto_395682 ?auto_395692 ) ) ( not ( = ?auto_395683 ?auto_395684 ) ) ( not ( = ?auto_395683 ?auto_395685 ) ) ( not ( = ?auto_395683 ?auto_395686 ) ) ( not ( = ?auto_395683 ?auto_395687 ) ) ( not ( = ?auto_395683 ?auto_395688 ) ) ( not ( = ?auto_395683 ?auto_395689 ) ) ( not ( = ?auto_395683 ?auto_395690 ) ) ( not ( = ?auto_395683 ?auto_395691 ) ) ( not ( = ?auto_395683 ?auto_395692 ) ) ( not ( = ?auto_395684 ?auto_395685 ) ) ( not ( = ?auto_395684 ?auto_395686 ) ) ( not ( = ?auto_395684 ?auto_395687 ) ) ( not ( = ?auto_395684 ?auto_395688 ) ) ( not ( = ?auto_395684 ?auto_395689 ) ) ( not ( = ?auto_395684 ?auto_395690 ) ) ( not ( = ?auto_395684 ?auto_395691 ) ) ( not ( = ?auto_395684 ?auto_395692 ) ) ( not ( = ?auto_395685 ?auto_395686 ) ) ( not ( = ?auto_395685 ?auto_395687 ) ) ( not ( = ?auto_395685 ?auto_395688 ) ) ( not ( = ?auto_395685 ?auto_395689 ) ) ( not ( = ?auto_395685 ?auto_395690 ) ) ( not ( = ?auto_395685 ?auto_395691 ) ) ( not ( = ?auto_395685 ?auto_395692 ) ) ( not ( = ?auto_395686 ?auto_395687 ) ) ( not ( = ?auto_395686 ?auto_395688 ) ) ( not ( = ?auto_395686 ?auto_395689 ) ) ( not ( = ?auto_395686 ?auto_395690 ) ) ( not ( = ?auto_395686 ?auto_395691 ) ) ( not ( = ?auto_395686 ?auto_395692 ) ) ( not ( = ?auto_395687 ?auto_395688 ) ) ( not ( = ?auto_395687 ?auto_395689 ) ) ( not ( = ?auto_395687 ?auto_395690 ) ) ( not ( = ?auto_395687 ?auto_395691 ) ) ( not ( = ?auto_395687 ?auto_395692 ) ) ( not ( = ?auto_395688 ?auto_395689 ) ) ( not ( = ?auto_395688 ?auto_395690 ) ) ( not ( = ?auto_395688 ?auto_395691 ) ) ( not ( = ?auto_395688 ?auto_395692 ) ) ( not ( = ?auto_395689 ?auto_395690 ) ) ( not ( = ?auto_395689 ?auto_395691 ) ) ( not ( = ?auto_395689 ?auto_395692 ) ) ( not ( = ?auto_395690 ?auto_395691 ) ) ( not ( = ?auto_395690 ?auto_395692 ) ) ( not ( = ?auto_395691 ?auto_395692 ) ) ( ON ?auto_395690 ?auto_395691 ) ( ON ?auto_395689 ?auto_395690 ) ( ON ?auto_395688 ?auto_395689 ) ( ON ?auto_395687 ?auto_395688 ) ( CLEAR ?auto_395685 ) ( ON ?auto_395686 ?auto_395687 ) ( CLEAR ?auto_395686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_395678 ?auto_395679 ?auto_395680 ?auto_395681 ?auto_395682 ?auto_395683 ?auto_395684 ?auto_395685 ?auto_395686 )
      ( MAKE-14PILE ?auto_395678 ?auto_395679 ?auto_395680 ?auto_395681 ?auto_395682 ?auto_395683 ?auto_395684 ?auto_395685 ?auto_395686 ?auto_395687 ?auto_395688 ?auto_395689 ?auto_395690 ?auto_395691 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395707 - BLOCK
      ?auto_395708 - BLOCK
      ?auto_395709 - BLOCK
      ?auto_395710 - BLOCK
      ?auto_395711 - BLOCK
      ?auto_395712 - BLOCK
      ?auto_395713 - BLOCK
      ?auto_395714 - BLOCK
      ?auto_395715 - BLOCK
      ?auto_395716 - BLOCK
      ?auto_395717 - BLOCK
      ?auto_395718 - BLOCK
      ?auto_395719 - BLOCK
      ?auto_395720 - BLOCK
    )
    :vars
    (
      ?auto_395721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395720 ?auto_395721 ) ( ON-TABLE ?auto_395707 ) ( ON ?auto_395708 ?auto_395707 ) ( ON ?auto_395709 ?auto_395708 ) ( ON ?auto_395710 ?auto_395709 ) ( ON ?auto_395711 ?auto_395710 ) ( ON ?auto_395712 ?auto_395711 ) ( ON ?auto_395713 ?auto_395712 ) ( ON ?auto_395714 ?auto_395713 ) ( not ( = ?auto_395707 ?auto_395708 ) ) ( not ( = ?auto_395707 ?auto_395709 ) ) ( not ( = ?auto_395707 ?auto_395710 ) ) ( not ( = ?auto_395707 ?auto_395711 ) ) ( not ( = ?auto_395707 ?auto_395712 ) ) ( not ( = ?auto_395707 ?auto_395713 ) ) ( not ( = ?auto_395707 ?auto_395714 ) ) ( not ( = ?auto_395707 ?auto_395715 ) ) ( not ( = ?auto_395707 ?auto_395716 ) ) ( not ( = ?auto_395707 ?auto_395717 ) ) ( not ( = ?auto_395707 ?auto_395718 ) ) ( not ( = ?auto_395707 ?auto_395719 ) ) ( not ( = ?auto_395707 ?auto_395720 ) ) ( not ( = ?auto_395707 ?auto_395721 ) ) ( not ( = ?auto_395708 ?auto_395709 ) ) ( not ( = ?auto_395708 ?auto_395710 ) ) ( not ( = ?auto_395708 ?auto_395711 ) ) ( not ( = ?auto_395708 ?auto_395712 ) ) ( not ( = ?auto_395708 ?auto_395713 ) ) ( not ( = ?auto_395708 ?auto_395714 ) ) ( not ( = ?auto_395708 ?auto_395715 ) ) ( not ( = ?auto_395708 ?auto_395716 ) ) ( not ( = ?auto_395708 ?auto_395717 ) ) ( not ( = ?auto_395708 ?auto_395718 ) ) ( not ( = ?auto_395708 ?auto_395719 ) ) ( not ( = ?auto_395708 ?auto_395720 ) ) ( not ( = ?auto_395708 ?auto_395721 ) ) ( not ( = ?auto_395709 ?auto_395710 ) ) ( not ( = ?auto_395709 ?auto_395711 ) ) ( not ( = ?auto_395709 ?auto_395712 ) ) ( not ( = ?auto_395709 ?auto_395713 ) ) ( not ( = ?auto_395709 ?auto_395714 ) ) ( not ( = ?auto_395709 ?auto_395715 ) ) ( not ( = ?auto_395709 ?auto_395716 ) ) ( not ( = ?auto_395709 ?auto_395717 ) ) ( not ( = ?auto_395709 ?auto_395718 ) ) ( not ( = ?auto_395709 ?auto_395719 ) ) ( not ( = ?auto_395709 ?auto_395720 ) ) ( not ( = ?auto_395709 ?auto_395721 ) ) ( not ( = ?auto_395710 ?auto_395711 ) ) ( not ( = ?auto_395710 ?auto_395712 ) ) ( not ( = ?auto_395710 ?auto_395713 ) ) ( not ( = ?auto_395710 ?auto_395714 ) ) ( not ( = ?auto_395710 ?auto_395715 ) ) ( not ( = ?auto_395710 ?auto_395716 ) ) ( not ( = ?auto_395710 ?auto_395717 ) ) ( not ( = ?auto_395710 ?auto_395718 ) ) ( not ( = ?auto_395710 ?auto_395719 ) ) ( not ( = ?auto_395710 ?auto_395720 ) ) ( not ( = ?auto_395710 ?auto_395721 ) ) ( not ( = ?auto_395711 ?auto_395712 ) ) ( not ( = ?auto_395711 ?auto_395713 ) ) ( not ( = ?auto_395711 ?auto_395714 ) ) ( not ( = ?auto_395711 ?auto_395715 ) ) ( not ( = ?auto_395711 ?auto_395716 ) ) ( not ( = ?auto_395711 ?auto_395717 ) ) ( not ( = ?auto_395711 ?auto_395718 ) ) ( not ( = ?auto_395711 ?auto_395719 ) ) ( not ( = ?auto_395711 ?auto_395720 ) ) ( not ( = ?auto_395711 ?auto_395721 ) ) ( not ( = ?auto_395712 ?auto_395713 ) ) ( not ( = ?auto_395712 ?auto_395714 ) ) ( not ( = ?auto_395712 ?auto_395715 ) ) ( not ( = ?auto_395712 ?auto_395716 ) ) ( not ( = ?auto_395712 ?auto_395717 ) ) ( not ( = ?auto_395712 ?auto_395718 ) ) ( not ( = ?auto_395712 ?auto_395719 ) ) ( not ( = ?auto_395712 ?auto_395720 ) ) ( not ( = ?auto_395712 ?auto_395721 ) ) ( not ( = ?auto_395713 ?auto_395714 ) ) ( not ( = ?auto_395713 ?auto_395715 ) ) ( not ( = ?auto_395713 ?auto_395716 ) ) ( not ( = ?auto_395713 ?auto_395717 ) ) ( not ( = ?auto_395713 ?auto_395718 ) ) ( not ( = ?auto_395713 ?auto_395719 ) ) ( not ( = ?auto_395713 ?auto_395720 ) ) ( not ( = ?auto_395713 ?auto_395721 ) ) ( not ( = ?auto_395714 ?auto_395715 ) ) ( not ( = ?auto_395714 ?auto_395716 ) ) ( not ( = ?auto_395714 ?auto_395717 ) ) ( not ( = ?auto_395714 ?auto_395718 ) ) ( not ( = ?auto_395714 ?auto_395719 ) ) ( not ( = ?auto_395714 ?auto_395720 ) ) ( not ( = ?auto_395714 ?auto_395721 ) ) ( not ( = ?auto_395715 ?auto_395716 ) ) ( not ( = ?auto_395715 ?auto_395717 ) ) ( not ( = ?auto_395715 ?auto_395718 ) ) ( not ( = ?auto_395715 ?auto_395719 ) ) ( not ( = ?auto_395715 ?auto_395720 ) ) ( not ( = ?auto_395715 ?auto_395721 ) ) ( not ( = ?auto_395716 ?auto_395717 ) ) ( not ( = ?auto_395716 ?auto_395718 ) ) ( not ( = ?auto_395716 ?auto_395719 ) ) ( not ( = ?auto_395716 ?auto_395720 ) ) ( not ( = ?auto_395716 ?auto_395721 ) ) ( not ( = ?auto_395717 ?auto_395718 ) ) ( not ( = ?auto_395717 ?auto_395719 ) ) ( not ( = ?auto_395717 ?auto_395720 ) ) ( not ( = ?auto_395717 ?auto_395721 ) ) ( not ( = ?auto_395718 ?auto_395719 ) ) ( not ( = ?auto_395718 ?auto_395720 ) ) ( not ( = ?auto_395718 ?auto_395721 ) ) ( not ( = ?auto_395719 ?auto_395720 ) ) ( not ( = ?auto_395719 ?auto_395721 ) ) ( not ( = ?auto_395720 ?auto_395721 ) ) ( ON ?auto_395719 ?auto_395720 ) ( ON ?auto_395718 ?auto_395719 ) ( ON ?auto_395717 ?auto_395718 ) ( ON ?auto_395716 ?auto_395717 ) ( CLEAR ?auto_395714 ) ( ON ?auto_395715 ?auto_395716 ) ( CLEAR ?auto_395715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_395707 ?auto_395708 ?auto_395709 ?auto_395710 ?auto_395711 ?auto_395712 ?auto_395713 ?auto_395714 ?auto_395715 )
      ( MAKE-14PILE ?auto_395707 ?auto_395708 ?auto_395709 ?auto_395710 ?auto_395711 ?auto_395712 ?auto_395713 ?auto_395714 ?auto_395715 ?auto_395716 ?auto_395717 ?auto_395718 ?auto_395719 ?auto_395720 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395736 - BLOCK
      ?auto_395737 - BLOCK
      ?auto_395738 - BLOCK
      ?auto_395739 - BLOCK
      ?auto_395740 - BLOCK
      ?auto_395741 - BLOCK
      ?auto_395742 - BLOCK
      ?auto_395743 - BLOCK
      ?auto_395744 - BLOCK
      ?auto_395745 - BLOCK
      ?auto_395746 - BLOCK
      ?auto_395747 - BLOCK
      ?auto_395748 - BLOCK
      ?auto_395749 - BLOCK
    )
    :vars
    (
      ?auto_395750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395749 ?auto_395750 ) ( ON-TABLE ?auto_395736 ) ( ON ?auto_395737 ?auto_395736 ) ( ON ?auto_395738 ?auto_395737 ) ( ON ?auto_395739 ?auto_395738 ) ( ON ?auto_395740 ?auto_395739 ) ( ON ?auto_395741 ?auto_395740 ) ( ON ?auto_395742 ?auto_395741 ) ( not ( = ?auto_395736 ?auto_395737 ) ) ( not ( = ?auto_395736 ?auto_395738 ) ) ( not ( = ?auto_395736 ?auto_395739 ) ) ( not ( = ?auto_395736 ?auto_395740 ) ) ( not ( = ?auto_395736 ?auto_395741 ) ) ( not ( = ?auto_395736 ?auto_395742 ) ) ( not ( = ?auto_395736 ?auto_395743 ) ) ( not ( = ?auto_395736 ?auto_395744 ) ) ( not ( = ?auto_395736 ?auto_395745 ) ) ( not ( = ?auto_395736 ?auto_395746 ) ) ( not ( = ?auto_395736 ?auto_395747 ) ) ( not ( = ?auto_395736 ?auto_395748 ) ) ( not ( = ?auto_395736 ?auto_395749 ) ) ( not ( = ?auto_395736 ?auto_395750 ) ) ( not ( = ?auto_395737 ?auto_395738 ) ) ( not ( = ?auto_395737 ?auto_395739 ) ) ( not ( = ?auto_395737 ?auto_395740 ) ) ( not ( = ?auto_395737 ?auto_395741 ) ) ( not ( = ?auto_395737 ?auto_395742 ) ) ( not ( = ?auto_395737 ?auto_395743 ) ) ( not ( = ?auto_395737 ?auto_395744 ) ) ( not ( = ?auto_395737 ?auto_395745 ) ) ( not ( = ?auto_395737 ?auto_395746 ) ) ( not ( = ?auto_395737 ?auto_395747 ) ) ( not ( = ?auto_395737 ?auto_395748 ) ) ( not ( = ?auto_395737 ?auto_395749 ) ) ( not ( = ?auto_395737 ?auto_395750 ) ) ( not ( = ?auto_395738 ?auto_395739 ) ) ( not ( = ?auto_395738 ?auto_395740 ) ) ( not ( = ?auto_395738 ?auto_395741 ) ) ( not ( = ?auto_395738 ?auto_395742 ) ) ( not ( = ?auto_395738 ?auto_395743 ) ) ( not ( = ?auto_395738 ?auto_395744 ) ) ( not ( = ?auto_395738 ?auto_395745 ) ) ( not ( = ?auto_395738 ?auto_395746 ) ) ( not ( = ?auto_395738 ?auto_395747 ) ) ( not ( = ?auto_395738 ?auto_395748 ) ) ( not ( = ?auto_395738 ?auto_395749 ) ) ( not ( = ?auto_395738 ?auto_395750 ) ) ( not ( = ?auto_395739 ?auto_395740 ) ) ( not ( = ?auto_395739 ?auto_395741 ) ) ( not ( = ?auto_395739 ?auto_395742 ) ) ( not ( = ?auto_395739 ?auto_395743 ) ) ( not ( = ?auto_395739 ?auto_395744 ) ) ( not ( = ?auto_395739 ?auto_395745 ) ) ( not ( = ?auto_395739 ?auto_395746 ) ) ( not ( = ?auto_395739 ?auto_395747 ) ) ( not ( = ?auto_395739 ?auto_395748 ) ) ( not ( = ?auto_395739 ?auto_395749 ) ) ( not ( = ?auto_395739 ?auto_395750 ) ) ( not ( = ?auto_395740 ?auto_395741 ) ) ( not ( = ?auto_395740 ?auto_395742 ) ) ( not ( = ?auto_395740 ?auto_395743 ) ) ( not ( = ?auto_395740 ?auto_395744 ) ) ( not ( = ?auto_395740 ?auto_395745 ) ) ( not ( = ?auto_395740 ?auto_395746 ) ) ( not ( = ?auto_395740 ?auto_395747 ) ) ( not ( = ?auto_395740 ?auto_395748 ) ) ( not ( = ?auto_395740 ?auto_395749 ) ) ( not ( = ?auto_395740 ?auto_395750 ) ) ( not ( = ?auto_395741 ?auto_395742 ) ) ( not ( = ?auto_395741 ?auto_395743 ) ) ( not ( = ?auto_395741 ?auto_395744 ) ) ( not ( = ?auto_395741 ?auto_395745 ) ) ( not ( = ?auto_395741 ?auto_395746 ) ) ( not ( = ?auto_395741 ?auto_395747 ) ) ( not ( = ?auto_395741 ?auto_395748 ) ) ( not ( = ?auto_395741 ?auto_395749 ) ) ( not ( = ?auto_395741 ?auto_395750 ) ) ( not ( = ?auto_395742 ?auto_395743 ) ) ( not ( = ?auto_395742 ?auto_395744 ) ) ( not ( = ?auto_395742 ?auto_395745 ) ) ( not ( = ?auto_395742 ?auto_395746 ) ) ( not ( = ?auto_395742 ?auto_395747 ) ) ( not ( = ?auto_395742 ?auto_395748 ) ) ( not ( = ?auto_395742 ?auto_395749 ) ) ( not ( = ?auto_395742 ?auto_395750 ) ) ( not ( = ?auto_395743 ?auto_395744 ) ) ( not ( = ?auto_395743 ?auto_395745 ) ) ( not ( = ?auto_395743 ?auto_395746 ) ) ( not ( = ?auto_395743 ?auto_395747 ) ) ( not ( = ?auto_395743 ?auto_395748 ) ) ( not ( = ?auto_395743 ?auto_395749 ) ) ( not ( = ?auto_395743 ?auto_395750 ) ) ( not ( = ?auto_395744 ?auto_395745 ) ) ( not ( = ?auto_395744 ?auto_395746 ) ) ( not ( = ?auto_395744 ?auto_395747 ) ) ( not ( = ?auto_395744 ?auto_395748 ) ) ( not ( = ?auto_395744 ?auto_395749 ) ) ( not ( = ?auto_395744 ?auto_395750 ) ) ( not ( = ?auto_395745 ?auto_395746 ) ) ( not ( = ?auto_395745 ?auto_395747 ) ) ( not ( = ?auto_395745 ?auto_395748 ) ) ( not ( = ?auto_395745 ?auto_395749 ) ) ( not ( = ?auto_395745 ?auto_395750 ) ) ( not ( = ?auto_395746 ?auto_395747 ) ) ( not ( = ?auto_395746 ?auto_395748 ) ) ( not ( = ?auto_395746 ?auto_395749 ) ) ( not ( = ?auto_395746 ?auto_395750 ) ) ( not ( = ?auto_395747 ?auto_395748 ) ) ( not ( = ?auto_395747 ?auto_395749 ) ) ( not ( = ?auto_395747 ?auto_395750 ) ) ( not ( = ?auto_395748 ?auto_395749 ) ) ( not ( = ?auto_395748 ?auto_395750 ) ) ( not ( = ?auto_395749 ?auto_395750 ) ) ( ON ?auto_395748 ?auto_395749 ) ( ON ?auto_395747 ?auto_395748 ) ( ON ?auto_395746 ?auto_395747 ) ( ON ?auto_395745 ?auto_395746 ) ( ON ?auto_395744 ?auto_395745 ) ( CLEAR ?auto_395742 ) ( ON ?auto_395743 ?auto_395744 ) ( CLEAR ?auto_395743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_395736 ?auto_395737 ?auto_395738 ?auto_395739 ?auto_395740 ?auto_395741 ?auto_395742 ?auto_395743 )
      ( MAKE-14PILE ?auto_395736 ?auto_395737 ?auto_395738 ?auto_395739 ?auto_395740 ?auto_395741 ?auto_395742 ?auto_395743 ?auto_395744 ?auto_395745 ?auto_395746 ?auto_395747 ?auto_395748 ?auto_395749 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395765 - BLOCK
      ?auto_395766 - BLOCK
      ?auto_395767 - BLOCK
      ?auto_395768 - BLOCK
      ?auto_395769 - BLOCK
      ?auto_395770 - BLOCK
      ?auto_395771 - BLOCK
      ?auto_395772 - BLOCK
      ?auto_395773 - BLOCK
      ?auto_395774 - BLOCK
      ?auto_395775 - BLOCK
      ?auto_395776 - BLOCK
      ?auto_395777 - BLOCK
      ?auto_395778 - BLOCK
    )
    :vars
    (
      ?auto_395779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395778 ?auto_395779 ) ( ON-TABLE ?auto_395765 ) ( ON ?auto_395766 ?auto_395765 ) ( ON ?auto_395767 ?auto_395766 ) ( ON ?auto_395768 ?auto_395767 ) ( ON ?auto_395769 ?auto_395768 ) ( ON ?auto_395770 ?auto_395769 ) ( ON ?auto_395771 ?auto_395770 ) ( not ( = ?auto_395765 ?auto_395766 ) ) ( not ( = ?auto_395765 ?auto_395767 ) ) ( not ( = ?auto_395765 ?auto_395768 ) ) ( not ( = ?auto_395765 ?auto_395769 ) ) ( not ( = ?auto_395765 ?auto_395770 ) ) ( not ( = ?auto_395765 ?auto_395771 ) ) ( not ( = ?auto_395765 ?auto_395772 ) ) ( not ( = ?auto_395765 ?auto_395773 ) ) ( not ( = ?auto_395765 ?auto_395774 ) ) ( not ( = ?auto_395765 ?auto_395775 ) ) ( not ( = ?auto_395765 ?auto_395776 ) ) ( not ( = ?auto_395765 ?auto_395777 ) ) ( not ( = ?auto_395765 ?auto_395778 ) ) ( not ( = ?auto_395765 ?auto_395779 ) ) ( not ( = ?auto_395766 ?auto_395767 ) ) ( not ( = ?auto_395766 ?auto_395768 ) ) ( not ( = ?auto_395766 ?auto_395769 ) ) ( not ( = ?auto_395766 ?auto_395770 ) ) ( not ( = ?auto_395766 ?auto_395771 ) ) ( not ( = ?auto_395766 ?auto_395772 ) ) ( not ( = ?auto_395766 ?auto_395773 ) ) ( not ( = ?auto_395766 ?auto_395774 ) ) ( not ( = ?auto_395766 ?auto_395775 ) ) ( not ( = ?auto_395766 ?auto_395776 ) ) ( not ( = ?auto_395766 ?auto_395777 ) ) ( not ( = ?auto_395766 ?auto_395778 ) ) ( not ( = ?auto_395766 ?auto_395779 ) ) ( not ( = ?auto_395767 ?auto_395768 ) ) ( not ( = ?auto_395767 ?auto_395769 ) ) ( not ( = ?auto_395767 ?auto_395770 ) ) ( not ( = ?auto_395767 ?auto_395771 ) ) ( not ( = ?auto_395767 ?auto_395772 ) ) ( not ( = ?auto_395767 ?auto_395773 ) ) ( not ( = ?auto_395767 ?auto_395774 ) ) ( not ( = ?auto_395767 ?auto_395775 ) ) ( not ( = ?auto_395767 ?auto_395776 ) ) ( not ( = ?auto_395767 ?auto_395777 ) ) ( not ( = ?auto_395767 ?auto_395778 ) ) ( not ( = ?auto_395767 ?auto_395779 ) ) ( not ( = ?auto_395768 ?auto_395769 ) ) ( not ( = ?auto_395768 ?auto_395770 ) ) ( not ( = ?auto_395768 ?auto_395771 ) ) ( not ( = ?auto_395768 ?auto_395772 ) ) ( not ( = ?auto_395768 ?auto_395773 ) ) ( not ( = ?auto_395768 ?auto_395774 ) ) ( not ( = ?auto_395768 ?auto_395775 ) ) ( not ( = ?auto_395768 ?auto_395776 ) ) ( not ( = ?auto_395768 ?auto_395777 ) ) ( not ( = ?auto_395768 ?auto_395778 ) ) ( not ( = ?auto_395768 ?auto_395779 ) ) ( not ( = ?auto_395769 ?auto_395770 ) ) ( not ( = ?auto_395769 ?auto_395771 ) ) ( not ( = ?auto_395769 ?auto_395772 ) ) ( not ( = ?auto_395769 ?auto_395773 ) ) ( not ( = ?auto_395769 ?auto_395774 ) ) ( not ( = ?auto_395769 ?auto_395775 ) ) ( not ( = ?auto_395769 ?auto_395776 ) ) ( not ( = ?auto_395769 ?auto_395777 ) ) ( not ( = ?auto_395769 ?auto_395778 ) ) ( not ( = ?auto_395769 ?auto_395779 ) ) ( not ( = ?auto_395770 ?auto_395771 ) ) ( not ( = ?auto_395770 ?auto_395772 ) ) ( not ( = ?auto_395770 ?auto_395773 ) ) ( not ( = ?auto_395770 ?auto_395774 ) ) ( not ( = ?auto_395770 ?auto_395775 ) ) ( not ( = ?auto_395770 ?auto_395776 ) ) ( not ( = ?auto_395770 ?auto_395777 ) ) ( not ( = ?auto_395770 ?auto_395778 ) ) ( not ( = ?auto_395770 ?auto_395779 ) ) ( not ( = ?auto_395771 ?auto_395772 ) ) ( not ( = ?auto_395771 ?auto_395773 ) ) ( not ( = ?auto_395771 ?auto_395774 ) ) ( not ( = ?auto_395771 ?auto_395775 ) ) ( not ( = ?auto_395771 ?auto_395776 ) ) ( not ( = ?auto_395771 ?auto_395777 ) ) ( not ( = ?auto_395771 ?auto_395778 ) ) ( not ( = ?auto_395771 ?auto_395779 ) ) ( not ( = ?auto_395772 ?auto_395773 ) ) ( not ( = ?auto_395772 ?auto_395774 ) ) ( not ( = ?auto_395772 ?auto_395775 ) ) ( not ( = ?auto_395772 ?auto_395776 ) ) ( not ( = ?auto_395772 ?auto_395777 ) ) ( not ( = ?auto_395772 ?auto_395778 ) ) ( not ( = ?auto_395772 ?auto_395779 ) ) ( not ( = ?auto_395773 ?auto_395774 ) ) ( not ( = ?auto_395773 ?auto_395775 ) ) ( not ( = ?auto_395773 ?auto_395776 ) ) ( not ( = ?auto_395773 ?auto_395777 ) ) ( not ( = ?auto_395773 ?auto_395778 ) ) ( not ( = ?auto_395773 ?auto_395779 ) ) ( not ( = ?auto_395774 ?auto_395775 ) ) ( not ( = ?auto_395774 ?auto_395776 ) ) ( not ( = ?auto_395774 ?auto_395777 ) ) ( not ( = ?auto_395774 ?auto_395778 ) ) ( not ( = ?auto_395774 ?auto_395779 ) ) ( not ( = ?auto_395775 ?auto_395776 ) ) ( not ( = ?auto_395775 ?auto_395777 ) ) ( not ( = ?auto_395775 ?auto_395778 ) ) ( not ( = ?auto_395775 ?auto_395779 ) ) ( not ( = ?auto_395776 ?auto_395777 ) ) ( not ( = ?auto_395776 ?auto_395778 ) ) ( not ( = ?auto_395776 ?auto_395779 ) ) ( not ( = ?auto_395777 ?auto_395778 ) ) ( not ( = ?auto_395777 ?auto_395779 ) ) ( not ( = ?auto_395778 ?auto_395779 ) ) ( ON ?auto_395777 ?auto_395778 ) ( ON ?auto_395776 ?auto_395777 ) ( ON ?auto_395775 ?auto_395776 ) ( ON ?auto_395774 ?auto_395775 ) ( ON ?auto_395773 ?auto_395774 ) ( CLEAR ?auto_395771 ) ( ON ?auto_395772 ?auto_395773 ) ( CLEAR ?auto_395772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_395765 ?auto_395766 ?auto_395767 ?auto_395768 ?auto_395769 ?auto_395770 ?auto_395771 ?auto_395772 )
      ( MAKE-14PILE ?auto_395765 ?auto_395766 ?auto_395767 ?auto_395768 ?auto_395769 ?auto_395770 ?auto_395771 ?auto_395772 ?auto_395773 ?auto_395774 ?auto_395775 ?auto_395776 ?auto_395777 ?auto_395778 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395794 - BLOCK
      ?auto_395795 - BLOCK
      ?auto_395796 - BLOCK
      ?auto_395797 - BLOCK
      ?auto_395798 - BLOCK
      ?auto_395799 - BLOCK
      ?auto_395800 - BLOCK
      ?auto_395801 - BLOCK
      ?auto_395802 - BLOCK
      ?auto_395803 - BLOCK
      ?auto_395804 - BLOCK
      ?auto_395805 - BLOCK
      ?auto_395806 - BLOCK
      ?auto_395807 - BLOCK
    )
    :vars
    (
      ?auto_395808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395807 ?auto_395808 ) ( ON-TABLE ?auto_395794 ) ( ON ?auto_395795 ?auto_395794 ) ( ON ?auto_395796 ?auto_395795 ) ( ON ?auto_395797 ?auto_395796 ) ( ON ?auto_395798 ?auto_395797 ) ( ON ?auto_395799 ?auto_395798 ) ( not ( = ?auto_395794 ?auto_395795 ) ) ( not ( = ?auto_395794 ?auto_395796 ) ) ( not ( = ?auto_395794 ?auto_395797 ) ) ( not ( = ?auto_395794 ?auto_395798 ) ) ( not ( = ?auto_395794 ?auto_395799 ) ) ( not ( = ?auto_395794 ?auto_395800 ) ) ( not ( = ?auto_395794 ?auto_395801 ) ) ( not ( = ?auto_395794 ?auto_395802 ) ) ( not ( = ?auto_395794 ?auto_395803 ) ) ( not ( = ?auto_395794 ?auto_395804 ) ) ( not ( = ?auto_395794 ?auto_395805 ) ) ( not ( = ?auto_395794 ?auto_395806 ) ) ( not ( = ?auto_395794 ?auto_395807 ) ) ( not ( = ?auto_395794 ?auto_395808 ) ) ( not ( = ?auto_395795 ?auto_395796 ) ) ( not ( = ?auto_395795 ?auto_395797 ) ) ( not ( = ?auto_395795 ?auto_395798 ) ) ( not ( = ?auto_395795 ?auto_395799 ) ) ( not ( = ?auto_395795 ?auto_395800 ) ) ( not ( = ?auto_395795 ?auto_395801 ) ) ( not ( = ?auto_395795 ?auto_395802 ) ) ( not ( = ?auto_395795 ?auto_395803 ) ) ( not ( = ?auto_395795 ?auto_395804 ) ) ( not ( = ?auto_395795 ?auto_395805 ) ) ( not ( = ?auto_395795 ?auto_395806 ) ) ( not ( = ?auto_395795 ?auto_395807 ) ) ( not ( = ?auto_395795 ?auto_395808 ) ) ( not ( = ?auto_395796 ?auto_395797 ) ) ( not ( = ?auto_395796 ?auto_395798 ) ) ( not ( = ?auto_395796 ?auto_395799 ) ) ( not ( = ?auto_395796 ?auto_395800 ) ) ( not ( = ?auto_395796 ?auto_395801 ) ) ( not ( = ?auto_395796 ?auto_395802 ) ) ( not ( = ?auto_395796 ?auto_395803 ) ) ( not ( = ?auto_395796 ?auto_395804 ) ) ( not ( = ?auto_395796 ?auto_395805 ) ) ( not ( = ?auto_395796 ?auto_395806 ) ) ( not ( = ?auto_395796 ?auto_395807 ) ) ( not ( = ?auto_395796 ?auto_395808 ) ) ( not ( = ?auto_395797 ?auto_395798 ) ) ( not ( = ?auto_395797 ?auto_395799 ) ) ( not ( = ?auto_395797 ?auto_395800 ) ) ( not ( = ?auto_395797 ?auto_395801 ) ) ( not ( = ?auto_395797 ?auto_395802 ) ) ( not ( = ?auto_395797 ?auto_395803 ) ) ( not ( = ?auto_395797 ?auto_395804 ) ) ( not ( = ?auto_395797 ?auto_395805 ) ) ( not ( = ?auto_395797 ?auto_395806 ) ) ( not ( = ?auto_395797 ?auto_395807 ) ) ( not ( = ?auto_395797 ?auto_395808 ) ) ( not ( = ?auto_395798 ?auto_395799 ) ) ( not ( = ?auto_395798 ?auto_395800 ) ) ( not ( = ?auto_395798 ?auto_395801 ) ) ( not ( = ?auto_395798 ?auto_395802 ) ) ( not ( = ?auto_395798 ?auto_395803 ) ) ( not ( = ?auto_395798 ?auto_395804 ) ) ( not ( = ?auto_395798 ?auto_395805 ) ) ( not ( = ?auto_395798 ?auto_395806 ) ) ( not ( = ?auto_395798 ?auto_395807 ) ) ( not ( = ?auto_395798 ?auto_395808 ) ) ( not ( = ?auto_395799 ?auto_395800 ) ) ( not ( = ?auto_395799 ?auto_395801 ) ) ( not ( = ?auto_395799 ?auto_395802 ) ) ( not ( = ?auto_395799 ?auto_395803 ) ) ( not ( = ?auto_395799 ?auto_395804 ) ) ( not ( = ?auto_395799 ?auto_395805 ) ) ( not ( = ?auto_395799 ?auto_395806 ) ) ( not ( = ?auto_395799 ?auto_395807 ) ) ( not ( = ?auto_395799 ?auto_395808 ) ) ( not ( = ?auto_395800 ?auto_395801 ) ) ( not ( = ?auto_395800 ?auto_395802 ) ) ( not ( = ?auto_395800 ?auto_395803 ) ) ( not ( = ?auto_395800 ?auto_395804 ) ) ( not ( = ?auto_395800 ?auto_395805 ) ) ( not ( = ?auto_395800 ?auto_395806 ) ) ( not ( = ?auto_395800 ?auto_395807 ) ) ( not ( = ?auto_395800 ?auto_395808 ) ) ( not ( = ?auto_395801 ?auto_395802 ) ) ( not ( = ?auto_395801 ?auto_395803 ) ) ( not ( = ?auto_395801 ?auto_395804 ) ) ( not ( = ?auto_395801 ?auto_395805 ) ) ( not ( = ?auto_395801 ?auto_395806 ) ) ( not ( = ?auto_395801 ?auto_395807 ) ) ( not ( = ?auto_395801 ?auto_395808 ) ) ( not ( = ?auto_395802 ?auto_395803 ) ) ( not ( = ?auto_395802 ?auto_395804 ) ) ( not ( = ?auto_395802 ?auto_395805 ) ) ( not ( = ?auto_395802 ?auto_395806 ) ) ( not ( = ?auto_395802 ?auto_395807 ) ) ( not ( = ?auto_395802 ?auto_395808 ) ) ( not ( = ?auto_395803 ?auto_395804 ) ) ( not ( = ?auto_395803 ?auto_395805 ) ) ( not ( = ?auto_395803 ?auto_395806 ) ) ( not ( = ?auto_395803 ?auto_395807 ) ) ( not ( = ?auto_395803 ?auto_395808 ) ) ( not ( = ?auto_395804 ?auto_395805 ) ) ( not ( = ?auto_395804 ?auto_395806 ) ) ( not ( = ?auto_395804 ?auto_395807 ) ) ( not ( = ?auto_395804 ?auto_395808 ) ) ( not ( = ?auto_395805 ?auto_395806 ) ) ( not ( = ?auto_395805 ?auto_395807 ) ) ( not ( = ?auto_395805 ?auto_395808 ) ) ( not ( = ?auto_395806 ?auto_395807 ) ) ( not ( = ?auto_395806 ?auto_395808 ) ) ( not ( = ?auto_395807 ?auto_395808 ) ) ( ON ?auto_395806 ?auto_395807 ) ( ON ?auto_395805 ?auto_395806 ) ( ON ?auto_395804 ?auto_395805 ) ( ON ?auto_395803 ?auto_395804 ) ( ON ?auto_395802 ?auto_395803 ) ( ON ?auto_395801 ?auto_395802 ) ( CLEAR ?auto_395799 ) ( ON ?auto_395800 ?auto_395801 ) ( CLEAR ?auto_395800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_395794 ?auto_395795 ?auto_395796 ?auto_395797 ?auto_395798 ?auto_395799 ?auto_395800 )
      ( MAKE-14PILE ?auto_395794 ?auto_395795 ?auto_395796 ?auto_395797 ?auto_395798 ?auto_395799 ?auto_395800 ?auto_395801 ?auto_395802 ?auto_395803 ?auto_395804 ?auto_395805 ?auto_395806 ?auto_395807 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395823 - BLOCK
      ?auto_395824 - BLOCK
      ?auto_395825 - BLOCK
      ?auto_395826 - BLOCK
      ?auto_395827 - BLOCK
      ?auto_395828 - BLOCK
      ?auto_395829 - BLOCK
      ?auto_395830 - BLOCK
      ?auto_395831 - BLOCK
      ?auto_395832 - BLOCK
      ?auto_395833 - BLOCK
      ?auto_395834 - BLOCK
      ?auto_395835 - BLOCK
      ?auto_395836 - BLOCK
    )
    :vars
    (
      ?auto_395837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395836 ?auto_395837 ) ( ON-TABLE ?auto_395823 ) ( ON ?auto_395824 ?auto_395823 ) ( ON ?auto_395825 ?auto_395824 ) ( ON ?auto_395826 ?auto_395825 ) ( ON ?auto_395827 ?auto_395826 ) ( ON ?auto_395828 ?auto_395827 ) ( not ( = ?auto_395823 ?auto_395824 ) ) ( not ( = ?auto_395823 ?auto_395825 ) ) ( not ( = ?auto_395823 ?auto_395826 ) ) ( not ( = ?auto_395823 ?auto_395827 ) ) ( not ( = ?auto_395823 ?auto_395828 ) ) ( not ( = ?auto_395823 ?auto_395829 ) ) ( not ( = ?auto_395823 ?auto_395830 ) ) ( not ( = ?auto_395823 ?auto_395831 ) ) ( not ( = ?auto_395823 ?auto_395832 ) ) ( not ( = ?auto_395823 ?auto_395833 ) ) ( not ( = ?auto_395823 ?auto_395834 ) ) ( not ( = ?auto_395823 ?auto_395835 ) ) ( not ( = ?auto_395823 ?auto_395836 ) ) ( not ( = ?auto_395823 ?auto_395837 ) ) ( not ( = ?auto_395824 ?auto_395825 ) ) ( not ( = ?auto_395824 ?auto_395826 ) ) ( not ( = ?auto_395824 ?auto_395827 ) ) ( not ( = ?auto_395824 ?auto_395828 ) ) ( not ( = ?auto_395824 ?auto_395829 ) ) ( not ( = ?auto_395824 ?auto_395830 ) ) ( not ( = ?auto_395824 ?auto_395831 ) ) ( not ( = ?auto_395824 ?auto_395832 ) ) ( not ( = ?auto_395824 ?auto_395833 ) ) ( not ( = ?auto_395824 ?auto_395834 ) ) ( not ( = ?auto_395824 ?auto_395835 ) ) ( not ( = ?auto_395824 ?auto_395836 ) ) ( not ( = ?auto_395824 ?auto_395837 ) ) ( not ( = ?auto_395825 ?auto_395826 ) ) ( not ( = ?auto_395825 ?auto_395827 ) ) ( not ( = ?auto_395825 ?auto_395828 ) ) ( not ( = ?auto_395825 ?auto_395829 ) ) ( not ( = ?auto_395825 ?auto_395830 ) ) ( not ( = ?auto_395825 ?auto_395831 ) ) ( not ( = ?auto_395825 ?auto_395832 ) ) ( not ( = ?auto_395825 ?auto_395833 ) ) ( not ( = ?auto_395825 ?auto_395834 ) ) ( not ( = ?auto_395825 ?auto_395835 ) ) ( not ( = ?auto_395825 ?auto_395836 ) ) ( not ( = ?auto_395825 ?auto_395837 ) ) ( not ( = ?auto_395826 ?auto_395827 ) ) ( not ( = ?auto_395826 ?auto_395828 ) ) ( not ( = ?auto_395826 ?auto_395829 ) ) ( not ( = ?auto_395826 ?auto_395830 ) ) ( not ( = ?auto_395826 ?auto_395831 ) ) ( not ( = ?auto_395826 ?auto_395832 ) ) ( not ( = ?auto_395826 ?auto_395833 ) ) ( not ( = ?auto_395826 ?auto_395834 ) ) ( not ( = ?auto_395826 ?auto_395835 ) ) ( not ( = ?auto_395826 ?auto_395836 ) ) ( not ( = ?auto_395826 ?auto_395837 ) ) ( not ( = ?auto_395827 ?auto_395828 ) ) ( not ( = ?auto_395827 ?auto_395829 ) ) ( not ( = ?auto_395827 ?auto_395830 ) ) ( not ( = ?auto_395827 ?auto_395831 ) ) ( not ( = ?auto_395827 ?auto_395832 ) ) ( not ( = ?auto_395827 ?auto_395833 ) ) ( not ( = ?auto_395827 ?auto_395834 ) ) ( not ( = ?auto_395827 ?auto_395835 ) ) ( not ( = ?auto_395827 ?auto_395836 ) ) ( not ( = ?auto_395827 ?auto_395837 ) ) ( not ( = ?auto_395828 ?auto_395829 ) ) ( not ( = ?auto_395828 ?auto_395830 ) ) ( not ( = ?auto_395828 ?auto_395831 ) ) ( not ( = ?auto_395828 ?auto_395832 ) ) ( not ( = ?auto_395828 ?auto_395833 ) ) ( not ( = ?auto_395828 ?auto_395834 ) ) ( not ( = ?auto_395828 ?auto_395835 ) ) ( not ( = ?auto_395828 ?auto_395836 ) ) ( not ( = ?auto_395828 ?auto_395837 ) ) ( not ( = ?auto_395829 ?auto_395830 ) ) ( not ( = ?auto_395829 ?auto_395831 ) ) ( not ( = ?auto_395829 ?auto_395832 ) ) ( not ( = ?auto_395829 ?auto_395833 ) ) ( not ( = ?auto_395829 ?auto_395834 ) ) ( not ( = ?auto_395829 ?auto_395835 ) ) ( not ( = ?auto_395829 ?auto_395836 ) ) ( not ( = ?auto_395829 ?auto_395837 ) ) ( not ( = ?auto_395830 ?auto_395831 ) ) ( not ( = ?auto_395830 ?auto_395832 ) ) ( not ( = ?auto_395830 ?auto_395833 ) ) ( not ( = ?auto_395830 ?auto_395834 ) ) ( not ( = ?auto_395830 ?auto_395835 ) ) ( not ( = ?auto_395830 ?auto_395836 ) ) ( not ( = ?auto_395830 ?auto_395837 ) ) ( not ( = ?auto_395831 ?auto_395832 ) ) ( not ( = ?auto_395831 ?auto_395833 ) ) ( not ( = ?auto_395831 ?auto_395834 ) ) ( not ( = ?auto_395831 ?auto_395835 ) ) ( not ( = ?auto_395831 ?auto_395836 ) ) ( not ( = ?auto_395831 ?auto_395837 ) ) ( not ( = ?auto_395832 ?auto_395833 ) ) ( not ( = ?auto_395832 ?auto_395834 ) ) ( not ( = ?auto_395832 ?auto_395835 ) ) ( not ( = ?auto_395832 ?auto_395836 ) ) ( not ( = ?auto_395832 ?auto_395837 ) ) ( not ( = ?auto_395833 ?auto_395834 ) ) ( not ( = ?auto_395833 ?auto_395835 ) ) ( not ( = ?auto_395833 ?auto_395836 ) ) ( not ( = ?auto_395833 ?auto_395837 ) ) ( not ( = ?auto_395834 ?auto_395835 ) ) ( not ( = ?auto_395834 ?auto_395836 ) ) ( not ( = ?auto_395834 ?auto_395837 ) ) ( not ( = ?auto_395835 ?auto_395836 ) ) ( not ( = ?auto_395835 ?auto_395837 ) ) ( not ( = ?auto_395836 ?auto_395837 ) ) ( ON ?auto_395835 ?auto_395836 ) ( ON ?auto_395834 ?auto_395835 ) ( ON ?auto_395833 ?auto_395834 ) ( ON ?auto_395832 ?auto_395833 ) ( ON ?auto_395831 ?auto_395832 ) ( ON ?auto_395830 ?auto_395831 ) ( CLEAR ?auto_395828 ) ( ON ?auto_395829 ?auto_395830 ) ( CLEAR ?auto_395829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_395823 ?auto_395824 ?auto_395825 ?auto_395826 ?auto_395827 ?auto_395828 ?auto_395829 )
      ( MAKE-14PILE ?auto_395823 ?auto_395824 ?auto_395825 ?auto_395826 ?auto_395827 ?auto_395828 ?auto_395829 ?auto_395830 ?auto_395831 ?auto_395832 ?auto_395833 ?auto_395834 ?auto_395835 ?auto_395836 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395852 - BLOCK
      ?auto_395853 - BLOCK
      ?auto_395854 - BLOCK
      ?auto_395855 - BLOCK
      ?auto_395856 - BLOCK
      ?auto_395857 - BLOCK
      ?auto_395858 - BLOCK
      ?auto_395859 - BLOCK
      ?auto_395860 - BLOCK
      ?auto_395861 - BLOCK
      ?auto_395862 - BLOCK
      ?auto_395863 - BLOCK
      ?auto_395864 - BLOCK
      ?auto_395865 - BLOCK
    )
    :vars
    (
      ?auto_395866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395865 ?auto_395866 ) ( ON-TABLE ?auto_395852 ) ( ON ?auto_395853 ?auto_395852 ) ( ON ?auto_395854 ?auto_395853 ) ( ON ?auto_395855 ?auto_395854 ) ( ON ?auto_395856 ?auto_395855 ) ( not ( = ?auto_395852 ?auto_395853 ) ) ( not ( = ?auto_395852 ?auto_395854 ) ) ( not ( = ?auto_395852 ?auto_395855 ) ) ( not ( = ?auto_395852 ?auto_395856 ) ) ( not ( = ?auto_395852 ?auto_395857 ) ) ( not ( = ?auto_395852 ?auto_395858 ) ) ( not ( = ?auto_395852 ?auto_395859 ) ) ( not ( = ?auto_395852 ?auto_395860 ) ) ( not ( = ?auto_395852 ?auto_395861 ) ) ( not ( = ?auto_395852 ?auto_395862 ) ) ( not ( = ?auto_395852 ?auto_395863 ) ) ( not ( = ?auto_395852 ?auto_395864 ) ) ( not ( = ?auto_395852 ?auto_395865 ) ) ( not ( = ?auto_395852 ?auto_395866 ) ) ( not ( = ?auto_395853 ?auto_395854 ) ) ( not ( = ?auto_395853 ?auto_395855 ) ) ( not ( = ?auto_395853 ?auto_395856 ) ) ( not ( = ?auto_395853 ?auto_395857 ) ) ( not ( = ?auto_395853 ?auto_395858 ) ) ( not ( = ?auto_395853 ?auto_395859 ) ) ( not ( = ?auto_395853 ?auto_395860 ) ) ( not ( = ?auto_395853 ?auto_395861 ) ) ( not ( = ?auto_395853 ?auto_395862 ) ) ( not ( = ?auto_395853 ?auto_395863 ) ) ( not ( = ?auto_395853 ?auto_395864 ) ) ( not ( = ?auto_395853 ?auto_395865 ) ) ( not ( = ?auto_395853 ?auto_395866 ) ) ( not ( = ?auto_395854 ?auto_395855 ) ) ( not ( = ?auto_395854 ?auto_395856 ) ) ( not ( = ?auto_395854 ?auto_395857 ) ) ( not ( = ?auto_395854 ?auto_395858 ) ) ( not ( = ?auto_395854 ?auto_395859 ) ) ( not ( = ?auto_395854 ?auto_395860 ) ) ( not ( = ?auto_395854 ?auto_395861 ) ) ( not ( = ?auto_395854 ?auto_395862 ) ) ( not ( = ?auto_395854 ?auto_395863 ) ) ( not ( = ?auto_395854 ?auto_395864 ) ) ( not ( = ?auto_395854 ?auto_395865 ) ) ( not ( = ?auto_395854 ?auto_395866 ) ) ( not ( = ?auto_395855 ?auto_395856 ) ) ( not ( = ?auto_395855 ?auto_395857 ) ) ( not ( = ?auto_395855 ?auto_395858 ) ) ( not ( = ?auto_395855 ?auto_395859 ) ) ( not ( = ?auto_395855 ?auto_395860 ) ) ( not ( = ?auto_395855 ?auto_395861 ) ) ( not ( = ?auto_395855 ?auto_395862 ) ) ( not ( = ?auto_395855 ?auto_395863 ) ) ( not ( = ?auto_395855 ?auto_395864 ) ) ( not ( = ?auto_395855 ?auto_395865 ) ) ( not ( = ?auto_395855 ?auto_395866 ) ) ( not ( = ?auto_395856 ?auto_395857 ) ) ( not ( = ?auto_395856 ?auto_395858 ) ) ( not ( = ?auto_395856 ?auto_395859 ) ) ( not ( = ?auto_395856 ?auto_395860 ) ) ( not ( = ?auto_395856 ?auto_395861 ) ) ( not ( = ?auto_395856 ?auto_395862 ) ) ( not ( = ?auto_395856 ?auto_395863 ) ) ( not ( = ?auto_395856 ?auto_395864 ) ) ( not ( = ?auto_395856 ?auto_395865 ) ) ( not ( = ?auto_395856 ?auto_395866 ) ) ( not ( = ?auto_395857 ?auto_395858 ) ) ( not ( = ?auto_395857 ?auto_395859 ) ) ( not ( = ?auto_395857 ?auto_395860 ) ) ( not ( = ?auto_395857 ?auto_395861 ) ) ( not ( = ?auto_395857 ?auto_395862 ) ) ( not ( = ?auto_395857 ?auto_395863 ) ) ( not ( = ?auto_395857 ?auto_395864 ) ) ( not ( = ?auto_395857 ?auto_395865 ) ) ( not ( = ?auto_395857 ?auto_395866 ) ) ( not ( = ?auto_395858 ?auto_395859 ) ) ( not ( = ?auto_395858 ?auto_395860 ) ) ( not ( = ?auto_395858 ?auto_395861 ) ) ( not ( = ?auto_395858 ?auto_395862 ) ) ( not ( = ?auto_395858 ?auto_395863 ) ) ( not ( = ?auto_395858 ?auto_395864 ) ) ( not ( = ?auto_395858 ?auto_395865 ) ) ( not ( = ?auto_395858 ?auto_395866 ) ) ( not ( = ?auto_395859 ?auto_395860 ) ) ( not ( = ?auto_395859 ?auto_395861 ) ) ( not ( = ?auto_395859 ?auto_395862 ) ) ( not ( = ?auto_395859 ?auto_395863 ) ) ( not ( = ?auto_395859 ?auto_395864 ) ) ( not ( = ?auto_395859 ?auto_395865 ) ) ( not ( = ?auto_395859 ?auto_395866 ) ) ( not ( = ?auto_395860 ?auto_395861 ) ) ( not ( = ?auto_395860 ?auto_395862 ) ) ( not ( = ?auto_395860 ?auto_395863 ) ) ( not ( = ?auto_395860 ?auto_395864 ) ) ( not ( = ?auto_395860 ?auto_395865 ) ) ( not ( = ?auto_395860 ?auto_395866 ) ) ( not ( = ?auto_395861 ?auto_395862 ) ) ( not ( = ?auto_395861 ?auto_395863 ) ) ( not ( = ?auto_395861 ?auto_395864 ) ) ( not ( = ?auto_395861 ?auto_395865 ) ) ( not ( = ?auto_395861 ?auto_395866 ) ) ( not ( = ?auto_395862 ?auto_395863 ) ) ( not ( = ?auto_395862 ?auto_395864 ) ) ( not ( = ?auto_395862 ?auto_395865 ) ) ( not ( = ?auto_395862 ?auto_395866 ) ) ( not ( = ?auto_395863 ?auto_395864 ) ) ( not ( = ?auto_395863 ?auto_395865 ) ) ( not ( = ?auto_395863 ?auto_395866 ) ) ( not ( = ?auto_395864 ?auto_395865 ) ) ( not ( = ?auto_395864 ?auto_395866 ) ) ( not ( = ?auto_395865 ?auto_395866 ) ) ( ON ?auto_395864 ?auto_395865 ) ( ON ?auto_395863 ?auto_395864 ) ( ON ?auto_395862 ?auto_395863 ) ( ON ?auto_395861 ?auto_395862 ) ( ON ?auto_395860 ?auto_395861 ) ( ON ?auto_395859 ?auto_395860 ) ( ON ?auto_395858 ?auto_395859 ) ( CLEAR ?auto_395856 ) ( ON ?auto_395857 ?auto_395858 ) ( CLEAR ?auto_395857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_395852 ?auto_395853 ?auto_395854 ?auto_395855 ?auto_395856 ?auto_395857 )
      ( MAKE-14PILE ?auto_395852 ?auto_395853 ?auto_395854 ?auto_395855 ?auto_395856 ?auto_395857 ?auto_395858 ?auto_395859 ?auto_395860 ?auto_395861 ?auto_395862 ?auto_395863 ?auto_395864 ?auto_395865 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395881 - BLOCK
      ?auto_395882 - BLOCK
      ?auto_395883 - BLOCK
      ?auto_395884 - BLOCK
      ?auto_395885 - BLOCK
      ?auto_395886 - BLOCK
      ?auto_395887 - BLOCK
      ?auto_395888 - BLOCK
      ?auto_395889 - BLOCK
      ?auto_395890 - BLOCK
      ?auto_395891 - BLOCK
      ?auto_395892 - BLOCK
      ?auto_395893 - BLOCK
      ?auto_395894 - BLOCK
    )
    :vars
    (
      ?auto_395895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395894 ?auto_395895 ) ( ON-TABLE ?auto_395881 ) ( ON ?auto_395882 ?auto_395881 ) ( ON ?auto_395883 ?auto_395882 ) ( ON ?auto_395884 ?auto_395883 ) ( ON ?auto_395885 ?auto_395884 ) ( not ( = ?auto_395881 ?auto_395882 ) ) ( not ( = ?auto_395881 ?auto_395883 ) ) ( not ( = ?auto_395881 ?auto_395884 ) ) ( not ( = ?auto_395881 ?auto_395885 ) ) ( not ( = ?auto_395881 ?auto_395886 ) ) ( not ( = ?auto_395881 ?auto_395887 ) ) ( not ( = ?auto_395881 ?auto_395888 ) ) ( not ( = ?auto_395881 ?auto_395889 ) ) ( not ( = ?auto_395881 ?auto_395890 ) ) ( not ( = ?auto_395881 ?auto_395891 ) ) ( not ( = ?auto_395881 ?auto_395892 ) ) ( not ( = ?auto_395881 ?auto_395893 ) ) ( not ( = ?auto_395881 ?auto_395894 ) ) ( not ( = ?auto_395881 ?auto_395895 ) ) ( not ( = ?auto_395882 ?auto_395883 ) ) ( not ( = ?auto_395882 ?auto_395884 ) ) ( not ( = ?auto_395882 ?auto_395885 ) ) ( not ( = ?auto_395882 ?auto_395886 ) ) ( not ( = ?auto_395882 ?auto_395887 ) ) ( not ( = ?auto_395882 ?auto_395888 ) ) ( not ( = ?auto_395882 ?auto_395889 ) ) ( not ( = ?auto_395882 ?auto_395890 ) ) ( not ( = ?auto_395882 ?auto_395891 ) ) ( not ( = ?auto_395882 ?auto_395892 ) ) ( not ( = ?auto_395882 ?auto_395893 ) ) ( not ( = ?auto_395882 ?auto_395894 ) ) ( not ( = ?auto_395882 ?auto_395895 ) ) ( not ( = ?auto_395883 ?auto_395884 ) ) ( not ( = ?auto_395883 ?auto_395885 ) ) ( not ( = ?auto_395883 ?auto_395886 ) ) ( not ( = ?auto_395883 ?auto_395887 ) ) ( not ( = ?auto_395883 ?auto_395888 ) ) ( not ( = ?auto_395883 ?auto_395889 ) ) ( not ( = ?auto_395883 ?auto_395890 ) ) ( not ( = ?auto_395883 ?auto_395891 ) ) ( not ( = ?auto_395883 ?auto_395892 ) ) ( not ( = ?auto_395883 ?auto_395893 ) ) ( not ( = ?auto_395883 ?auto_395894 ) ) ( not ( = ?auto_395883 ?auto_395895 ) ) ( not ( = ?auto_395884 ?auto_395885 ) ) ( not ( = ?auto_395884 ?auto_395886 ) ) ( not ( = ?auto_395884 ?auto_395887 ) ) ( not ( = ?auto_395884 ?auto_395888 ) ) ( not ( = ?auto_395884 ?auto_395889 ) ) ( not ( = ?auto_395884 ?auto_395890 ) ) ( not ( = ?auto_395884 ?auto_395891 ) ) ( not ( = ?auto_395884 ?auto_395892 ) ) ( not ( = ?auto_395884 ?auto_395893 ) ) ( not ( = ?auto_395884 ?auto_395894 ) ) ( not ( = ?auto_395884 ?auto_395895 ) ) ( not ( = ?auto_395885 ?auto_395886 ) ) ( not ( = ?auto_395885 ?auto_395887 ) ) ( not ( = ?auto_395885 ?auto_395888 ) ) ( not ( = ?auto_395885 ?auto_395889 ) ) ( not ( = ?auto_395885 ?auto_395890 ) ) ( not ( = ?auto_395885 ?auto_395891 ) ) ( not ( = ?auto_395885 ?auto_395892 ) ) ( not ( = ?auto_395885 ?auto_395893 ) ) ( not ( = ?auto_395885 ?auto_395894 ) ) ( not ( = ?auto_395885 ?auto_395895 ) ) ( not ( = ?auto_395886 ?auto_395887 ) ) ( not ( = ?auto_395886 ?auto_395888 ) ) ( not ( = ?auto_395886 ?auto_395889 ) ) ( not ( = ?auto_395886 ?auto_395890 ) ) ( not ( = ?auto_395886 ?auto_395891 ) ) ( not ( = ?auto_395886 ?auto_395892 ) ) ( not ( = ?auto_395886 ?auto_395893 ) ) ( not ( = ?auto_395886 ?auto_395894 ) ) ( not ( = ?auto_395886 ?auto_395895 ) ) ( not ( = ?auto_395887 ?auto_395888 ) ) ( not ( = ?auto_395887 ?auto_395889 ) ) ( not ( = ?auto_395887 ?auto_395890 ) ) ( not ( = ?auto_395887 ?auto_395891 ) ) ( not ( = ?auto_395887 ?auto_395892 ) ) ( not ( = ?auto_395887 ?auto_395893 ) ) ( not ( = ?auto_395887 ?auto_395894 ) ) ( not ( = ?auto_395887 ?auto_395895 ) ) ( not ( = ?auto_395888 ?auto_395889 ) ) ( not ( = ?auto_395888 ?auto_395890 ) ) ( not ( = ?auto_395888 ?auto_395891 ) ) ( not ( = ?auto_395888 ?auto_395892 ) ) ( not ( = ?auto_395888 ?auto_395893 ) ) ( not ( = ?auto_395888 ?auto_395894 ) ) ( not ( = ?auto_395888 ?auto_395895 ) ) ( not ( = ?auto_395889 ?auto_395890 ) ) ( not ( = ?auto_395889 ?auto_395891 ) ) ( not ( = ?auto_395889 ?auto_395892 ) ) ( not ( = ?auto_395889 ?auto_395893 ) ) ( not ( = ?auto_395889 ?auto_395894 ) ) ( not ( = ?auto_395889 ?auto_395895 ) ) ( not ( = ?auto_395890 ?auto_395891 ) ) ( not ( = ?auto_395890 ?auto_395892 ) ) ( not ( = ?auto_395890 ?auto_395893 ) ) ( not ( = ?auto_395890 ?auto_395894 ) ) ( not ( = ?auto_395890 ?auto_395895 ) ) ( not ( = ?auto_395891 ?auto_395892 ) ) ( not ( = ?auto_395891 ?auto_395893 ) ) ( not ( = ?auto_395891 ?auto_395894 ) ) ( not ( = ?auto_395891 ?auto_395895 ) ) ( not ( = ?auto_395892 ?auto_395893 ) ) ( not ( = ?auto_395892 ?auto_395894 ) ) ( not ( = ?auto_395892 ?auto_395895 ) ) ( not ( = ?auto_395893 ?auto_395894 ) ) ( not ( = ?auto_395893 ?auto_395895 ) ) ( not ( = ?auto_395894 ?auto_395895 ) ) ( ON ?auto_395893 ?auto_395894 ) ( ON ?auto_395892 ?auto_395893 ) ( ON ?auto_395891 ?auto_395892 ) ( ON ?auto_395890 ?auto_395891 ) ( ON ?auto_395889 ?auto_395890 ) ( ON ?auto_395888 ?auto_395889 ) ( ON ?auto_395887 ?auto_395888 ) ( CLEAR ?auto_395885 ) ( ON ?auto_395886 ?auto_395887 ) ( CLEAR ?auto_395886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_395881 ?auto_395882 ?auto_395883 ?auto_395884 ?auto_395885 ?auto_395886 )
      ( MAKE-14PILE ?auto_395881 ?auto_395882 ?auto_395883 ?auto_395884 ?auto_395885 ?auto_395886 ?auto_395887 ?auto_395888 ?auto_395889 ?auto_395890 ?auto_395891 ?auto_395892 ?auto_395893 ?auto_395894 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395910 - BLOCK
      ?auto_395911 - BLOCK
      ?auto_395912 - BLOCK
      ?auto_395913 - BLOCK
      ?auto_395914 - BLOCK
      ?auto_395915 - BLOCK
      ?auto_395916 - BLOCK
      ?auto_395917 - BLOCK
      ?auto_395918 - BLOCK
      ?auto_395919 - BLOCK
      ?auto_395920 - BLOCK
      ?auto_395921 - BLOCK
      ?auto_395922 - BLOCK
      ?auto_395923 - BLOCK
    )
    :vars
    (
      ?auto_395924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395923 ?auto_395924 ) ( ON-TABLE ?auto_395910 ) ( ON ?auto_395911 ?auto_395910 ) ( ON ?auto_395912 ?auto_395911 ) ( ON ?auto_395913 ?auto_395912 ) ( not ( = ?auto_395910 ?auto_395911 ) ) ( not ( = ?auto_395910 ?auto_395912 ) ) ( not ( = ?auto_395910 ?auto_395913 ) ) ( not ( = ?auto_395910 ?auto_395914 ) ) ( not ( = ?auto_395910 ?auto_395915 ) ) ( not ( = ?auto_395910 ?auto_395916 ) ) ( not ( = ?auto_395910 ?auto_395917 ) ) ( not ( = ?auto_395910 ?auto_395918 ) ) ( not ( = ?auto_395910 ?auto_395919 ) ) ( not ( = ?auto_395910 ?auto_395920 ) ) ( not ( = ?auto_395910 ?auto_395921 ) ) ( not ( = ?auto_395910 ?auto_395922 ) ) ( not ( = ?auto_395910 ?auto_395923 ) ) ( not ( = ?auto_395910 ?auto_395924 ) ) ( not ( = ?auto_395911 ?auto_395912 ) ) ( not ( = ?auto_395911 ?auto_395913 ) ) ( not ( = ?auto_395911 ?auto_395914 ) ) ( not ( = ?auto_395911 ?auto_395915 ) ) ( not ( = ?auto_395911 ?auto_395916 ) ) ( not ( = ?auto_395911 ?auto_395917 ) ) ( not ( = ?auto_395911 ?auto_395918 ) ) ( not ( = ?auto_395911 ?auto_395919 ) ) ( not ( = ?auto_395911 ?auto_395920 ) ) ( not ( = ?auto_395911 ?auto_395921 ) ) ( not ( = ?auto_395911 ?auto_395922 ) ) ( not ( = ?auto_395911 ?auto_395923 ) ) ( not ( = ?auto_395911 ?auto_395924 ) ) ( not ( = ?auto_395912 ?auto_395913 ) ) ( not ( = ?auto_395912 ?auto_395914 ) ) ( not ( = ?auto_395912 ?auto_395915 ) ) ( not ( = ?auto_395912 ?auto_395916 ) ) ( not ( = ?auto_395912 ?auto_395917 ) ) ( not ( = ?auto_395912 ?auto_395918 ) ) ( not ( = ?auto_395912 ?auto_395919 ) ) ( not ( = ?auto_395912 ?auto_395920 ) ) ( not ( = ?auto_395912 ?auto_395921 ) ) ( not ( = ?auto_395912 ?auto_395922 ) ) ( not ( = ?auto_395912 ?auto_395923 ) ) ( not ( = ?auto_395912 ?auto_395924 ) ) ( not ( = ?auto_395913 ?auto_395914 ) ) ( not ( = ?auto_395913 ?auto_395915 ) ) ( not ( = ?auto_395913 ?auto_395916 ) ) ( not ( = ?auto_395913 ?auto_395917 ) ) ( not ( = ?auto_395913 ?auto_395918 ) ) ( not ( = ?auto_395913 ?auto_395919 ) ) ( not ( = ?auto_395913 ?auto_395920 ) ) ( not ( = ?auto_395913 ?auto_395921 ) ) ( not ( = ?auto_395913 ?auto_395922 ) ) ( not ( = ?auto_395913 ?auto_395923 ) ) ( not ( = ?auto_395913 ?auto_395924 ) ) ( not ( = ?auto_395914 ?auto_395915 ) ) ( not ( = ?auto_395914 ?auto_395916 ) ) ( not ( = ?auto_395914 ?auto_395917 ) ) ( not ( = ?auto_395914 ?auto_395918 ) ) ( not ( = ?auto_395914 ?auto_395919 ) ) ( not ( = ?auto_395914 ?auto_395920 ) ) ( not ( = ?auto_395914 ?auto_395921 ) ) ( not ( = ?auto_395914 ?auto_395922 ) ) ( not ( = ?auto_395914 ?auto_395923 ) ) ( not ( = ?auto_395914 ?auto_395924 ) ) ( not ( = ?auto_395915 ?auto_395916 ) ) ( not ( = ?auto_395915 ?auto_395917 ) ) ( not ( = ?auto_395915 ?auto_395918 ) ) ( not ( = ?auto_395915 ?auto_395919 ) ) ( not ( = ?auto_395915 ?auto_395920 ) ) ( not ( = ?auto_395915 ?auto_395921 ) ) ( not ( = ?auto_395915 ?auto_395922 ) ) ( not ( = ?auto_395915 ?auto_395923 ) ) ( not ( = ?auto_395915 ?auto_395924 ) ) ( not ( = ?auto_395916 ?auto_395917 ) ) ( not ( = ?auto_395916 ?auto_395918 ) ) ( not ( = ?auto_395916 ?auto_395919 ) ) ( not ( = ?auto_395916 ?auto_395920 ) ) ( not ( = ?auto_395916 ?auto_395921 ) ) ( not ( = ?auto_395916 ?auto_395922 ) ) ( not ( = ?auto_395916 ?auto_395923 ) ) ( not ( = ?auto_395916 ?auto_395924 ) ) ( not ( = ?auto_395917 ?auto_395918 ) ) ( not ( = ?auto_395917 ?auto_395919 ) ) ( not ( = ?auto_395917 ?auto_395920 ) ) ( not ( = ?auto_395917 ?auto_395921 ) ) ( not ( = ?auto_395917 ?auto_395922 ) ) ( not ( = ?auto_395917 ?auto_395923 ) ) ( not ( = ?auto_395917 ?auto_395924 ) ) ( not ( = ?auto_395918 ?auto_395919 ) ) ( not ( = ?auto_395918 ?auto_395920 ) ) ( not ( = ?auto_395918 ?auto_395921 ) ) ( not ( = ?auto_395918 ?auto_395922 ) ) ( not ( = ?auto_395918 ?auto_395923 ) ) ( not ( = ?auto_395918 ?auto_395924 ) ) ( not ( = ?auto_395919 ?auto_395920 ) ) ( not ( = ?auto_395919 ?auto_395921 ) ) ( not ( = ?auto_395919 ?auto_395922 ) ) ( not ( = ?auto_395919 ?auto_395923 ) ) ( not ( = ?auto_395919 ?auto_395924 ) ) ( not ( = ?auto_395920 ?auto_395921 ) ) ( not ( = ?auto_395920 ?auto_395922 ) ) ( not ( = ?auto_395920 ?auto_395923 ) ) ( not ( = ?auto_395920 ?auto_395924 ) ) ( not ( = ?auto_395921 ?auto_395922 ) ) ( not ( = ?auto_395921 ?auto_395923 ) ) ( not ( = ?auto_395921 ?auto_395924 ) ) ( not ( = ?auto_395922 ?auto_395923 ) ) ( not ( = ?auto_395922 ?auto_395924 ) ) ( not ( = ?auto_395923 ?auto_395924 ) ) ( ON ?auto_395922 ?auto_395923 ) ( ON ?auto_395921 ?auto_395922 ) ( ON ?auto_395920 ?auto_395921 ) ( ON ?auto_395919 ?auto_395920 ) ( ON ?auto_395918 ?auto_395919 ) ( ON ?auto_395917 ?auto_395918 ) ( ON ?auto_395916 ?auto_395917 ) ( ON ?auto_395915 ?auto_395916 ) ( CLEAR ?auto_395913 ) ( ON ?auto_395914 ?auto_395915 ) ( CLEAR ?auto_395914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_395910 ?auto_395911 ?auto_395912 ?auto_395913 ?auto_395914 )
      ( MAKE-14PILE ?auto_395910 ?auto_395911 ?auto_395912 ?auto_395913 ?auto_395914 ?auto_395915 ?auto_395916 ?auto_395917 ?auto_395918 ?auto_395919 ?auto_395920 ?auto_395921 ?auto_395922 ?auto_395923 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395939 - BLOCK
      ?auto_395940 - BLOCK
      ?auto_395941 - BLOCK
      ?auto_395942 - BLOCK
      ?auto_395943 - BLOCK
      ?auto_395944 - BLOCK
      ?auto_395945 - BLOCK
      ?auto_395946 - BLOCK
      ?auto_395947 - BLOCK
      ?auto_395948 - BLOCK
      ?auto_395949 - BLOCK
      ?auto_395950 - BLOCK
      ?auto_395951 - BLOCK
      ?auto_395952 - BLOCK
    )
    :vars
    (
      ?auto_395953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395952 ?auto_395953 ) ( ON-TABLE ?auto_395939 ) ( ON ?auto_395940 ?auto_395939 ) ( ON ?auto_395941 ?auto_395940 ) ( ON ?auto_395942 ?auto_395941 ) ( not ( = ?auto_395939 ?auto_395940 ) ) ( not ( = ?auto_395939 ?auto_395941 ) ) ( not ( = ?auto_395939 ?auto_395942 ) ) ( not ( = ?auto_395939 ?auto_395943 ) ) ( not ( = ?auto_395939 ?auto_395944 ) ) ( not ( = ?auto_395939 ?auto_395945 ) ) ( not ( = ?auto_395939 ?auto_395946 ) ) ( not ( = ?auto_395939 ?auto_395947 ) ) ( not ( = ?auto_395939 ?auto_395948 ) ) ( not ( = ?auto_395939 ?auto_395949 ) ) ( not ( = ?auto_395939 ?auto_395950 ) ) ( not ( = ?auto_395939 ?auto_395951 ) ) ( not ( = ?auto_395939 ?auto_395952 ) ) ( not ( = ?auto_395939 ?auto_395953 ) ) ( not ( = ?auto_395940 ?auto_395941 ) ) ( not ( = ?auto_395940 ?auto_395942 ) ) ( not ( = ?auto_395940 ?auto_395943 ) ) ( not ( = ?auto_395940 ?auto_395944 ) ) ( not ( = ?auto_395940 ?auto_395945 ) ) ( not ( = ?auto_395940 ?auto_395946 ) ) ( not ( = ?auto_395940 ?auto_395947 ) ) ( not ( = ?auto_395940 ?auto_395948 ) ) ( not ( = ?auto_395940 ?auto_395949 ) ) ( not ( = ?auto_395940 ?auto_395950 ) ) ( not ( = ?auto_395940 ?auto_395951 ) ) ( not ( = ?auto_395940 ?auto_395952 ) ) ( not ( = ?auto_395940 ?auto_395953 ) ) ( not ( = ?auto_395941 ?auto_395942 ) ) ( not ( = ?auto_395941 ?auto_395943 ) ) ( not ( = ?auto_395941 ?auto_395944 ) ) ( not ( = ?auto_395941 ?auto_395945 ) ) ( not ( = ?auto_395941 ?auto_395946 ) ) ( not ( = ?auto_395941 ?auto_395947 ) ) ( not ( = ?auto_395941 ?auto_395948 ) ) ( not ( = ?auto_395941 ?auto_395949 ) ) ( not ( = ?auto_395941 ?auto_395950 ) ) ( not ( = ?auto_395941 ?auto_395951 ) ) ( not ( = ?auto_395941 ?auto_395952 ) ) ( not ( = ?auto_395941 ?auto_395953 ) ) ( not ( = ?auto_395942 ?auto_395943 ) ) ( not ( = ?auto_395942 ?auto_395944 ) ) ( not ( = ?auto_395942 ?auto_395945 ) ) ( not ( = ?auto_395942 ?auto_395946 ) ) ( not ( = ?auto_395942 ?auto_395947 ) ) ( not ( = ?auto_395942 ?auto_395948 ) ) ( not ( = ?auto_395942 ?auto_395949 ) ) ( not ( = ?auto_395942 ?auto_395950 ) ) ( not ( = ?auto_395942 ?auto_395951 ) ) ( not ( = ?auto_395942 ?auto_395952 ) ) ( not ( = ?auto_395942 ?auto_395953 ) ) ( not ( = ?auto_395943 ?auto_395944 ) ) ( not ( = ?auto_395943 ?auto_395945 ) ) ( not ( = ?auto_395943 ?auto_395946 ) ) ( not ( = ?auto_395943 ?auto_395947 ) ) ( not ( = ?auto_395943 ?auto_395948 ) ) ( not ( = ?auto_395943 ?auto_395949 ) ) ( not ( = ?auto_395943 ?auto_395950 ) ) ( not ( = ?auto_395943 ?auto_395951 ) ) ( not ( = ?auto_395943 ?auto_395952 ) ) ( not ( = ?auto_395943 ?auto_395953 ) ) ( not ( = ?auto_395944 ?auto_395945 ) ) ( not ( = ?auto_395944 ?auto_395946 ) ) ( not ( = ?auto_395944 ?auto_395947 ) ) ( not ( = ?auto_395944 ?auto_395948 ) ) ( not ( = ?auto_395944 ?auto_395949 ) ) ( not ( = ?auto_395944 ?auto_395950 ) ) ( not ( = ?auto_395944 ?auto_395951 ) ) ( not ( = ?auto_395944 ?auto_395952 ) ) ( not ( = ?auto_395944 ?auto_395953 ) ) ( not ( = ?auto_395945 ?auto_395946 ) ) ( not ( = ?auto_395945 ?auto_395947 ) ) ( not ( = ?auto_395945 ?auto_395948 ) ) ( not ( = ?auto_395945 ?auto_395949 ) ) ( not ( = ?auto_395945 ?auto_395950 ) ) ( not ( = ?auto_395945 ?auto_395951 ) ) ( not ( = ?auto_395945 ?auto_395952 ) ) ( not ( = ?auto_395945 ?auto_395953 ) ) ( not ( = ?auto_395946 ?auto_395947 ) ) ( not ( = ?auto_395946 ?auto_395948 ) ) ( not ( = ?auto_395946 ?auto_395949 ) ) ( not ( = ?auto_395946 ?auto_395950 ) ) ( not ( = ?auto_395946 ?auto_395951 ) ) ( not ( = ?auto_395946 ?auto_395952 ) ) ( not ( = ?auto_395946 ?auto_395953 ) ) ( not ( = ?auto_395947 ?auto_395948 ) ) ( not ( = ?auto_395947 ?auto_395949 ) ) ( not ( = ?auto_395947 ?auto_395950 ) ) ( not ( = ?auto_395947 ?auto_395951 ) ) ( not ( = ?auto_395947 ?auto_395952 ) ) ( not ( = ?auto_395947 ?auto_395953 ) ) ( not ( = ?auto_395948 ?auto_395949 ) ) ( not ( = ?auto_395948 ?auto_395950 ) ) ( not ( = ?auto_395948 ?auto_395951 ) ) ( not ( = ?auto_395948 ?auto_395952 ) ) ( not ( = ?auto_395948 ?auto_395953 ) ) ( not ( = ?auto_395949 ?auto_395950 ) ) ( not ( = ?auto_395949 ?auto_395951 ) ) ( not ( = ?auto_395949 ?auto_395952 ) ) ( not ( = ?auto_395949 ?auto_395953 ) ) ( not ( = ?auto_395950 ?auto_395951 ) ) ( not ( = ?auto_395950 ?auto_395952 ) ) ( not ( = ?auto_395950 ?auto_395953 ) ) ( not ( = ?auto_395951 ?auto_395952 ) ) ( not ( = ?auto_395951 ?auto_395953 ) ) ( not ( = ?auto_395952 ?auto_395953 ) ) ( ON ?auto_395951 ?auto_395952 ) ( ON ?auto_395950 ?auto_395951 ) ( ON ?auto_395949 ?auto_395950 ) ( ON ?auto_395948 ?auto_395949 ) ( ON ?auto_395947 ?auto_395948 ) ( ON ?auto_395946 ?auto_395947 ) ( ON ?auto_395945 ?auto_395946 ) ( ON ?auto_395944 ?auto_395945 ) ( CLEAR ?auto_395942 ) ( ON ?auto_395943 ?auto_395944 ) ( CLEAR ?auto_395943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_395939 ?auto_395940 ?auto_395941 ?auto_395942 ?auto_395943 )
      ( MAKE-14PILE ?auto_395939 ?auto_395940 ?auto_395941 ?auto_395942 ?auto_395943 ?auto_395944 ?auto_395945 ?auto_395946 ?auto_395947 ?auto_395948 ?auto_395949 ?auto_395950 ?auto_395951 ?auto_395952 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395968 - BLOCK
      ?auto_395969 - BLOCK
      ?auto_395970 - BLOCK
      ?auto_395971 - BLOCK
      ?auto_395972 - BLOCK
      ?auto_395973 - BLOCK
      ?auto_395974 - BLOCK
      ?auto_395975 - BLOCK
      ?auto_395976 - BLOCK
      ?auto_395977 - BLOCK
      ?auto_395978 - BLOCK
      ?auto_395979 - BLOCK
      ?auto_395980 - BLOCK
      ?auto_395981 - BLOCK
    )
    :vars
    (
      ?auto_395982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395981 ?auto_395982 ) ( ON-TABLE ?auto_395968 ) ( ON ?auto_395969 ?auto_395968 ) ( ON ?auto_395970 ?auto_395969 ) ( not ( = ?auto_395968 ?auto_395969 ) ) ( not ( = ?auto_395968 ?auto_395970 ) ) ( not ( = ?auto_395968 ?auto_395971 ) ) ( not ( = ?auto_395968 ?auto_395972 ) ) ( not ( = ?auto_395968 ?auto_395973 ) ) ( not ( = ?auto_395968 ?auto_395974 ) ) ( not ( = ?auto_395968 ?auto_395975 ) ) ( not ( = ?auto_395968 ?auto_395976 ) ) ( not ( = ?auto_395968 ?auto_395977 ) ) ( not ( = ?auto_395968 ?auto_395978 ) ) ( not ( = ?auto_395968 ?auto_395979 ) ) ( not ( = ?auto_395968 ?auto_395980 ) ) ( not ( = ?auto_395968 ?auto_395981 ) ) ( not ( = ?auto_395968 ?auto_395982 ) ) ( not ( = ?auto_395969 ?auto_395970 ) ) ( not ( = ?auto_395969 ?auto_395971 ) ) ( not ( = ?auto_395969 ?auto_395972 ) ) ( not ( = ?auto_395969 ?auto_395973 ) ) ( not ( = ?auto_395969 ?auto_395974 ) ) ( not ( = ?auto_395969 ?auto_395975 ) ) ( not ( = ?auto_395969 ?auto_395976 ) ) ( not ( = ?auto_395969 ?auto_395977 ) ) ( not ( = ?auto_395969 ?auto_395978 ) ) ( not ( = ?auto_395969 ?auto_395979 ) ) ( not ( = ?auto_395969 ?auto_395980 ) ) ( not ( = ?auto_395969 ?auto_395981 ) ) ( not ( = ?auto_395969 ?auto_395982 ) ) ( not ( = ?auto_395970 ?auto_395971 ) ) ( not ( = ?auto_395970 ?auto_395972 ) ) ( not ( = ?auto_395970 ?auto_395973 ) ) ( not ( = ?auto_395970 ?auto_395974 ) ) ( not ( = ?auto_395970 ?auto_395975 ) ) ( not ( = ?auto_395970 ?auto_395976 ) ) ( not ( = ?auto_395970 ?auto_395977 ) ) ( not ( = ?auto_395970 ?auto_395978 ) ) ( not ( = ?auto_395970 ?auto_395979 ) ) ( not ( = ?auto_395970 ?auto_395980 ) ) ( not ( = ?auto_395970 ?auto_395981 ) ) ( not ( = ?auto_395970 ?auto_395982 ) ) ( not ( = ?auto_395971 ?auto_395972 ) ) ( not ( = ?auto_395971 ?auto_395973 ) ) ( not ( = ?auto_395971 ?auto_395974 ) ) ( not ( = ?auto_395971 ?auto_395975 ) ) ( not ( = ?auto_395971 ?auto_395976 ) ) ( not ( = ?auto_395971 ?auto_395977 ) ) ( not ( = ?auto_395971 ?auto_395978 ) ) ( not ( = ?auto_395971 ?auto_395979 ) ) ( not ( = ?auto_395971 ?auto_395980 ) ) ( not ( = ?auto_395971 ?auto_395981 ) ) ( not ( = ?auto_395971 ?auto_395982 ) ) ( not ( = ?auto_395972 ?auto_395973 ) ) ( not ( = ?auto_395972 ?auto_395974 ) ) ( not ( = ?auto_395972 ?auto_395975 ) ) ( not ( = ?auto_395972 ?auto_395976 ) ) ( not ( = ?auto_395972 ?auto_395977 ) ) ( not ( = ?auto_395972 ?auto_395978 ) ) ( not ( = ?auto_395972 ?auto_395979 ) ) ( not ( = ?auto_395972 ?auto_395980 ) ) ( not ( = ?auto_395972 ?auto_395981 ) ) ( not ( = ?auto_395972 ?auto_395982 ) ) ( not ( = ?auto_395973 ?auto_395974 ) ) ( not ( = ?auto_395973 ?auto_395975 ) ) ( not ( = ?auto_395973 ?auto_395976 ) ) ( not ( = ?auto_395973 ?auto_395977 ) ) ( not ( = ?auto_395973 ?auto_395978 ) ) ( not ( = ?auto_395973 ?auto_395979 ) ) ( not ( = ?auto_395973 ?auto_395980 ) ) ( not ( = ?auto_395973 ?auto_395981 ) ) ( not ( = ?auto_395973 ?auto_395982 ) ) ( not ( = ?auto_395974 ?auto_395975 ) ) ( not ( = ?auto_395974 ?auto_395976 ) ) ( not ( = ?auto_395974 ?auto_395977 ) ) ( not ( = ?auto_395974 ?auto_395978 ) ) ( not ( = ?auto_395974 ?auto_395979 ) ) ( not ( = ?auto_395974 ?auto_395980 ) ) ( not ( = ?auto_395974 ?auto_395981 ) ) ( not ( = ?auto_395974 ?auto_395982 ) ) ( not ( = ?auto_395975 ?auto_395976 ) ) ( not ( = ?auto_395975 ?auto_395977 ) ) ( not ( = ?auto_395975 ?auto_395978 ) ) ( not ( = ?auto_395975 ?auto_395979 ) ) ( not ( = ?auto_395975 ?auto_395980 ) ) ( not ( = ?auto_395975 ?auto_395981 ) ) ( not ( = ?auto_395975 ?auto_395982 ) ) ( not ( = ?auto_395976 ?auto_395977 ) ) ( not ( = ?auto_395976 ?auto_395978 ) ) ( not ( = ?auto_395976 ?auto_395979 ) ) ( not ( = ?auto_395976 ?auto_395980 ) ) ( not ( = ?auto_395976 ?auto_395981 ) ) ( not ( = ?auto_395976 ?auto_395982 ) ) ( not ( = ?auto_395977 ?auto_395978 ) ) ( not ( = ?auto_395977 ?auto_395979 ) ) ( not ( = ?auto_395977 ?auto_395980 ) ) ( not ( = ?auto_395977 ?auto_395981 ) ) ( not ( = ?auto_395977 ?auto_395982 ) ) ( not ( = ?auto_395978 ?auto_395979 ) ) ( not ( = ?auto_395978 ?auto_395980 ) ) ( not ( = ?auto_395978 ?auto_395981 ) ) ( not ( = ?auto_395978 ?auto_395982 ) ) ( not ( = ?auto_395979 ?auto_395980 ) ) ( not ( = ?auto_395979 ?auto_395981 ) ) ( not ( = ?auto_395979 ?auto_395982 ) ) ( not ( = ?auto_395980 ?auto_395981 ) ) ( not ( = ?auto_395980 ?auto_395982 ) ) ( not ( = ?auto_395981 ?auto_395982 ) ) ( ON ?auto_395980 ?auto_395981 ) ( ON ?auto_395979 ?auto_395980 ) ( ON ?auto_395978 ?auto_395979 ) ( ON ?auto_395977 ?auto_395978 ) ( ON ?auto_395976 ?auto_395977 ) ( ON ?auto_395975 ?auto_395976 ) ( ON ?auto_395974 ?auto_395975 ) ( ON ?auto_395973 ?auto_395974 ) ( ON ?auto_395972 ?auto_395973 ) ( CLEAR ?auto_395970 ) ( ON ?auto_395971 ?auto_395972 ) ( CLEAR ?auto_395971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_395968 ?auto_395969 ?auto_395970 ?auto_395971 )
      ( MAKE-14PILE ?auto_395968 ?auto_395969 ?auto_395970 ?auto_395971 ?auto_395972 ?auto_395973 ?auto_395974 ?auto_395975 ?auto_395976 ?auto_395977 ?auto_395978 ?auto_395979 ?auto_395980 ?auto_395981 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_395997 - BLOCK
      ?auto_395998 - BLOCK
      ?auto_395999 - BLOCK
      ?auto_396000 - BLOCK
      ?auto_396001 - BLOCK
      ?auto_396002 - BLOCK
      ?auto_396003 - BLOCK
      ?auto_396004 - BLOCK
      ?auto_396005 - BLOCK
      ?auto_396006 - BLOCK
      ?auto_396007 - BLOCK
      ?auto_396008 - BLOCK
      ?auto_396009 - BLOCK
      ?auto_396010 - BLOCK
    )
    :vars
    (
      ?auto_396011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396010 ?auto_396011 ) ( ON-TABLE ?auto_395997 ) ( ON ?auto_395998 ?auto_395997 ) ( ON ?auto_395999 ?auto_395998 ) ( not ( = ?auto_395997 ?auto_395998 ) ) ( not ( = ?auto_395997 ?auto_395999 ) ) ( not ( = ?auto_395997 ?auto_396000 ) ) ( not ( = ?auto_395997 ?auto_396001 ) ) ( not ( = ?auto_395997 ?auto_396002 ) ) ( not ( = ?auto_395997 ?auto_396003 ) ) ( not ( = ?auto_395997 ?auto_396004 ) ) ( not ( = ?auto_395997 ?auto_396005 ) ) ( not ( = ?auto_395997 ?auto_396006 ) ) ( not ( = ?auto_395997 ?auto_396007 ) ) ( not ( = ?auto_395997 ?auto_396008 ) ) ( not ( = ?auto_395997 ?auto_396009 ) ) ( not ( = ?auto_395997 ?auto_396010 ) ) ( not ( = ?auto_395997 ?auto_396011 ) ) ( not ( = ?auto_395998 ?auto_395999 ) ) ( not ( = ?auto_395998 ?auto_396000 ) ) ( not ( = ?auto_395998 ?auto_396001 ) ) ( not ( = ?auto_395998 ?auto_396002 ) ) ( not ( = ?auto_395998 ?auto_396003 ) ) ( not ( = ?auto_395998 ?auto_396004 ) ) ( not ( = ?auto_395998 ?auto_396005 ) ) ( not ( = ?auto_395998 ?auto_396006 ) ) ( not ( = ?auto_395998 ?auto_396007 ) ) ( not ( = ?auto_395998 ?auto_396008 ) ) ( not ( = ?auto_395998 ?auto_396009 ) ) ( not ( = ?auto_395998 ?auto_396010 ) ) ( not ( = ?auto_395998 ?auto_396011 ) ) ( not ( = ?auto_395999 ?auto_396000 ) ) ( not ( = ?auto_395999 ?auto_396001 ) ) ( not ( = ?auto_395999 ?auto_396002 ) ) ( not ( = ?auto_395999 ?auto_396003 ) ) ( not ( = ?auto_395999 ?auto_396004 ) ) ( not ( = ?auto_395999 ?auto_396005 ) ) ( not ( = ?auto_395999 ?auto_396006 ) ) ( not ( = ?auto_395999 ?auto_396007 ) ) ( not ( = ?auto_395999 ?auto_396008 ) ) ( not ( = ?auto_395999 ?auto_396009 ) ) ( not ( = ?auto_395999 ?auto_396010 ) ) ( not ( = ?auto_395999 ?auto_396011 ) ) ( not ( = ?auto_396000 ?auto_396001 ) ) ( not ( = ?auto_396000 ?auto_396002 ) ) ( not ( = ?auto_396000 ?auto_396003 ) ) ( not ( = ?auto_396000 ?auto_396004 ) ) ( not ( = ?auto_396000 ?auto_396005 ) ) ( not ( = ?auto_396000 ?auto_396006 ) ) ( not ( = ?auto_396000 ?auto_396007 ) ) ( not ( = ?auto_396000 ?auto_396008 ) ) ( not ( = ?auto_396000 ?auto_396009 ) ) ( not ( = ?auto_396000 ?auto_396010 ) ) ( not ( = ?auto_396000 ?auto_396011 ) ) ( not ( = ?auto_396001 ?auto_396002 ) ) ( not ( = ?auto_396001 ?auto_396003 ) ) ( not ( = ?auto_396001 ?auto_396004 ) ) ( not ( = ?auto_396001 ?auto_396005 ) ) ( not ( = ?auto_396001 ?auto_396006 ) ) ( not ( = ?auto_396001 ?auto_396007 ) ) ( not ( = ?auto_396001 ?auto_396008 ) ) ( not ( = ?auto_396001 ?auto_396009 ) ) ( not ( = ?auto_396001 ?auto_396010 ) ) ( not ( = ?auto_396001 ?auto_396011 ) ) ( not ( = ?auto_396002 ?auto_396003 ) ) ( not ( = ?auto_396002 ?auto_396004 ) ) ( not ( = ?auto_396002 ?auto_396005 ) ) ( not ( = ?auto_396002 ?auto_396006 ) ) ( not ( = ?auto_396002 ?auto_396007 ) ) ( not ( = ?auto_396002 ?auto_396008 ) ) ( not ( = ?auto_396002 ?auto_396009 ) ) ( not ( = ?auto_396002 ?auto_396010 ) ) ( not ( = ?auto_396002 ?auto_396011 ) ) ( not ( = ?auto_396003 ?auto_396004 ) ) ( not ( = ?auto_396003 ?auto_396005 ) ) ( not ( = ?auto_396003 ?auto_396006 ) ) ( not ( = ?auto_396003 ?auto_396007 ) ) ( not ( = ?auto_396003 ?auto_396008 ) ) ( not ( = ?auto_396003 ?auto_396009 ) ) ( not ( = ?auto_396003 ?auto_396010 ) ) ( not ( = ?auto_396003 ?auto_396011 ) ) ( not ( = ?auto_396004 ?auto_396005 ) ) ( not ( = ?auto_396004 ?auto_396006 ) ) ( not ( = ?auto_396004 ?auto_396007 ) ) ( not ( = ?auto_396004 ?auto_396008 ) ) ( not ( = ?auto_396004 ?auto_396009 ) ) ( not ( = ?auto_396004 ?auto_396010 ) ) ( not ( = ?auto_396004 ?auto_396011 ) ) ( not ( = ?auto_396005 ?auto_396006 ) ) ( not ( = ?auto_396005 ?auto_396007 ) ) ( not ( = ?auto_396005 ?auto_396008 ) ) ( not ( = ?auto_396005 ?auto_396009 ) ) ( not ( = ?auto_396005 ?auto_396010 ) ) ( not ( = ?auto_396005 ?auto_396011 ) ) ( not ( = ?auto_396006 ?auto_396007 ) ) ( not ( = ?auto_396006 ?auto_396008 ) ) ( not ( = ?auto_396006 ?auto_396009 ) ) ( not ( = ?auto_396006 ?auto_396010 ) ) ( not ( = ?auto_396006 ?auto_396011 ) ) ( not ( = ?auto_396007 ?auto_396008 ) ) ( not ( = ?auto_396007 ?auto_396009 ) ) ( not ( = ?auto_396007 ?auto_396010 ) ) ( not ( = ?auto_396007 ?auto_396011 ) ) ( not ( = ?auto_396008 ?auto_396009 ) ) ( not ( = ?auto_396008 ?auto_396010 ) ) ( not ( = ?auto_396008 ?auto_396011 ) ) ( not ( = ?auto_396009 ?auto_396010 ) ) ( not ( = ?auto_396009 ?auto_396011 ) ) ( not ( = ?auto_396010 ?auto_396011 ) ) ( ON ?auto_396009 ?auto_396010 ) ( ON ?auto_396008 ?auto_396009 ) ( ON ?auto_396007 ?auto_396008 ) ( ON ?auto_396006 ?auto_396007 ) ( ON ?auto_396005 ?auto_396006 ) ( ON ?auto_396004 ?auto_396005 ) ( ON ?auto_396003 ?auto_396004 ) ( ON ?auto_396002 ?auto_396003 ) ( ON ?auto_396001 ?auto_396002 ) ( CLEAR ?auto_395999 ) ( ON ?auto_396000 ?auto_396001 ) ( CLEAR ?auto_396000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_395997 ?auto_395998 ?auto_395999 ?auto_396000 )
      ( MAKE-14PILE ?auto_395997 ?auto_395998 ?auto_395999 ?auto_396000 ?auto_396001 ?auto_396002 ?auto_396003 ?auto_396004 ?auto_396005 ?auto_396006 ?auto_396007 ?auto_396008 ?auto_396009 ?auto_396010 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396026 - BLOCK
      ?auto_396027 - BLOCK
      ?auto_396028 - BLOCK
      ?auto_396029 - BLOCK
      ?auto_396030 - BLOCK
      ?auto_396031 - BLOCK
      ?auto_396032 - BLOCK
      ?auto_396033 - BLOCK
      ?auto_396034 - BLOCK
      ?auto_396035 - BLOCK
      ?auto_396036 - BLOCK
      ?auto_396037 - BLOCK
      ?auto_396038 - BLOCK
      ?auto_396039 - BLOCK
    )
    :vars
    (
      ?auto_396040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396039 ?auto_396040 ) ( ON-TABLE ?auto_396026 ) ( ON ?auto_396027 ?auto_396026 ) ( not ( = ?auto_396026 ?auto_396027 ) ) ( not ( = ?auto_396026 ?auto_396028 ) ) ( not ( = ?auto_396026 ?auto_396029 ) ) ( not ( = ?auto_396026 ?auto_396030 ) ) ( not ( = ?auto_396026 ?auto_396031 ) ) ( not ( = ?auto_396026 ?auto_396032 ) ) ( not ( = ?auto_396026 ?auto_396033 ) ) ( not ( = ?auto_396026 ?auto_396034 ) ) ( not ( = ?auto_396026 ?auto_396035 ) ) ( not ( = ?auto_396026 ?auto_396036 ) ) ( not ( = ?auto_396026 ?auto_396037 ) ) ( not ( = ?auto_396026 ?auto_396038 ) ) ( not ( = ?auto_396026 ?auto_396039 ) ) ( not ( = ?auto_396026 ?auto_396040 ) ) ( not ( = ?auto_396027 ?auto_396028 ) ) ( not ( = ?auto_396027 ?auto_396029 ) ) ( not ( = ?auto_396027 ?auto_396030 ) ) ( not ( = ?auto_396027 ?auto_396031 ) ) ( not ( = ?auto_396027 ?auto_396032 ) ) ( not ( = ?auto_396027 ?auto_396033 ) ) ( not ( = ?auto_396027 ?auto_396034 ) ) ( not ( = ?auto_396027 ?auto_396035 ) ) ( not ( = ?auto_396027 ?auto_396036 ) ) ( not ( = ?auto_396027 ?auto_396037 ) ) ( not ( = ?auto_396027 ?auto_396038 ) ) ( not ( = ?auto_396027 ?auto_396039 ) ) ( not ( = ?auto_396027 ?auto_396040 ) ) ( not ( = ?auto_396028 ?auto_396029 ) ) ( not ( = ?auto_396028 ?auto_396030 ) ) ( not ( = ?auto_396028 ?auto_396031 ) ) ( not ( = ?auto_396028 ?auto_396032 ) ) ( not ( = ?auto_396028 ?auto_396033 ) ) ( not ( = ?auto_396028 ?auto_396034 ) ) ( not ( = ?auto_396028 ?auto_396035 ) ) ( not ( = ?auto_396028 ?auto_396036 ) ) ( not ( = ?auto_396028 ?auto_396037 ) ) ( not ( = ?auto_396028 ?auto_396038 ) ) ( not ( = ?auto_396028 ?auto_396039 ) ) ( not ( = ?auto_396028 ?auto_396040 ) ) ( not ( = ?auto_396029 ?auto_396030 ) ) ( not ( = ?auto_396029 ?auto_396031 ) ) ( not ( = ?auto_396029 ?auto_396032 ) ) ( not ( = ?auto_396029 ?auto_396033 ) ) ( not ( = ?auto_396029 ?auto_396034 ) ) ( not ( = ?auto_396029 ?auto_396035 ) ) ( not ( = ?auto_396029 ?auto_396036 ) ) ( not ( = ?auto_396029 ?auto_396037 ) ) ( not ( = ?auto_396029 ?auto_396038 ) ) ( not ( = ?auto_396029 ?auto_396039 ) ) ( not ( = ?auto_396029 ?auto_396040 ) ) ( not ( = ?auto_396030 ?auto_396031 ) ) ( not ( = ?auto_396030 ?auto_396032 ) ) ( not ( = ?auto_396030 ?auto_396033 ) ) ( not ( = ?auto_396030 ?auto_396034 ) ) ( not ( = ?auto_396030 ?auto_396035 ) ) ( not ( = ?auto_396030 ?auto_396036 ) ) ( not ( = ?auto_396030 ?auto_396037 ) ) ( not ( = ?auto_396030 ?auto_396038 ) ) ( not ( = ?auto_396030 ?auto_396039 ) ) ( not ( = ?auto_396030 ?auto_396040 ) ) ( not ( = ?auto_396031 ?auto_396032 ) ) ( not ( = ?auto_396031 ?auto_396033 ) ) ( not ( = ?auto_396031 ?auto_396034 ) ) ( not ( = ?auto_396031 ?auto_396035 ) ) ( not ( = ?auto_396031 ?auto_396036 ) ) ( not ( = ?auto_396031 ?auto_396037 ) ) ( not ( = ?auto_396031 ?auto_396038 ) ) ( not ( = ?auto_396031 ?auto_396039 ) ) ( not ( = ?auto_396031 ?auto_396040 ) ) ( not ( = ?auto_396032 ?auto_396033 ) ) ( not ( = ?auto_396032 ?auto_396034 ) ) ( not ( = ?auto_396032 ?auto_396035 ) ) ( not ( = ?auto_396032 ?auto_396036 ) ) ( not ( = ?auto_396032 ?auto_396037 ) ) ( not ( = ?auto_396032 ?auto_396038 ) ) ( not ( = ?auto_396032 ?auto_396039 ) ) ( not ( = ?auto_396032 ?auto_396040 ) ) ( not ( = ?auto_396033 ?auto_396034 ) ) ( not ( = ?auto_396033 ?auto_396035 ) ) ( not ( = ?auto_396033 ?auto_396036 ) ) ( not ( = ?auto_396033 ?auto_396037 ) ) ( not ( = ?auto_396033 ?auto_396038 ) ) ( not ( = ?auto_396033 ?auto_396039 ) ) ( not ( = ?auto_396033 ?auto_396040 ) ) ( not ( = ?auto_396034 ?auto_396035 ) ) ( not ( = ?auto_396034 ?auto_396036 ) ) ( not ( = ?auto_396034 ?auto_396037 ) ) ( not ( = ?auto_396034 ?auto_396038 ) ) ( not ( = ?auto_396034 ?auto_396039 ) ) ( not ( = ?auto_396034 ?auto_396040 ) ) ( not ( = ?auto_396035 ?auto_396036 ) ) ( not ( = ?auto_396035 ?auto_396037 ) ) ( not ( = ?auto_396035 ?auto_396038 ) ) ( not ( = ?auto_396035 ?auto_396039 ) ) ( not ( = ?auto_396035 ?auto_396040 ) ) ( not ( = ?auto_396036 ?auto_396037 ) ) ( not ( = ?auto_396036 ?auto_396038 ) ) ( not ( = ?auto_396036 ?auto_396039 ) ) ( not ( = ?auto_396036 ?auto_396040 ) ) ( not ( = ?auto_396037 ?auto_396038 ) ) ( not ( = ?auto_396037 ?auto_396039 ) ) ( not ( = ?auto_396037 ?auto_396040 ) ) ( not ( = ?auto_396038 ?auto_396039 ) ) ( not ( = ?auto_396038 ?auto_396040 ) ) ( not ( = ?auto_396039 ?auto_396040 ) ) ( ON ?auto_396038 ?auto_396039 ) ( ON ?auto_396037 ?auto_396038 ) ( ON ?auto_396036 ?auto_396037 ) ( ON ?auto_396035 ?auto_396036 ) ( ON ?auto_396034 ?auto_396035 ) ( ON ?auto_396033 ?auto_396034 ) ( ON ?auto_396032 ?auto_396033 ) ( ON ?auto_396031 ?auto_396032 ) ( ON ?auto_396030 ?auto_396031 ) ( ON ?auto_396029 ?auto_396030 ) ( CLEAR ?auto_396027 ) ( ON ?auto_396028 ?auto_396029 ) ( CLEAR ?auto_396028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_396026 ?auto_396027 ?auto_396028 )
      ( MAKE-14PILE ?auto_396026 ?auto_396027 ?auto_396028 ?auto_396029 ?auto_396030 ?auto_396031 ?auto_396032 ?auto_396033 ?auto_396034 ?auto_396035 ?auto_396036 ?auto_396037 ?auto_396038 ?auto_396039 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396055 - BLOCK
      ?auto_396056 - BLOCK
      ?auto_396057 - BLOCK
      ?auto_396058 - BLOCK
      ?auto_396059 - BLOCK
      ?auto_396060 - BLOCK
      ?auto_396061 - BLOCK
      ?auto_396062 - BLOCK
      ?auto_396063 - BLOCK
      ?auto_396064 - BLOCK
      ?auto_396065 - BLOCK
      ?auto_396066 - BLOCK
      ?auto_396067 - BLOCK
      ?auto_396068 - BLOCK
    )
    :vars
    (
      ?auto_396069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396068 ?auto_396069 ) ( ON-TABLE ?auto_396055 ) ( ON ?auto_396056 ?auto_396055 ) ( not ( = ?auto_396055 ?auto_396056 ) ) ( not ( = ?auto_396055 ?auto_396057 ) ) ( not ( = ?auto_396055 ?auto_396058 ) ) ( not ( = ?auto_396055 ?auto_396059 ) ) ( not ( = ?auto_396055 ?auto_396060 ) ) ( not ( = ?auto_396055 ?auto_396061 ) ) ( not ( = ?auto_396055 ?auto_396062 ) ) ( not ( = ?auto_396055 ?auto_396063 ) ) ( not ( = ?auto_396055 ?auto_396064 ) ) ( not ( = ?auto_396055 ?auto_396065 ) ) ( not ( = ?auto_396055 ?auto_396066 ) ) ( not ( = ?auto_396055 ?auto_396067 ) ) ( not ( = ?auto_396055 ?auto_396068 ) ) ( not ( = ?auto_396055 ?auto_396069 ) ) ( not ( = ?auto_396056 ?auto_396057 ) ) ( not ( = ?auto_396056 ?auto_396058 ) ) ( not ( = ?auto_396056 ?auto_396059 ) ) ( not ( = ?auto_396056 ?auto_396060 ) ) ( not ( = ?auto_396056 ?auto_396061 ) ) ( not ( = ?auto_396056 ?auto_396062 ) ) ( not ( = ?auto_396056 ?auto_396063 ) ) ( not ( = ?auto_396056 ?auto_396064 ) ) ( not ( = ?auto_396056 ?auto_396065 ) ) ( not ( = ?auto_396056 ?auto_396066 ) ) ( not ( = ?auto_396056 ?auto_396067 ) ) ( not ( = ?auto_396056 ?auto_396068 ) ) ( not ( = ?auto_396056 ?auto_396069 ) ) ( not ( = ?auto_396057 ?auto_396058 ) ) ( not ( = ?auto_396057 ?auto_396059 ) ) ( not ( = ?auto_396057 ?auto_396060 ) ) ( not ( = ?auto_396057 ?auto_396061 ) ) ( not ( = ?auto_396057 ?auto_396062 ) ) ( not ( = ?auto_396057 ?auto_396063 ) ) ( not ( = ?auto_396057 ?auto_396064 ) ) ( not ( = ?auto_396057 ?auto_396065 ) ) ( not ( = ?auto_396057 ?auto_396066 ) ) ( not ( = ?auto_396057 ?auto_396067 ) ) ( not ( = ?auto_396057 ?auto_396068 ) ) ( not ( = ?auto_396057 ?auto_396069 ) ) ( not ( = ?auto_396058 ?auto_396059 ) ) ( not ( = ?auto_396058 ?auto_396060 ) ) ( not ( = ?auto_396058 ?auto_396061 ) ) ( not ( = ?auto_396058 ?auto_396062 ) ) ( not ( = ?auto_396058 ?auto_396063 ) ) ( not ( = ?auto_396058 ?auto_396064 ) ) ( not ( = ?auto_396058 ?auto_396065 ) ) ( not ( = ?auto_396058 ?auto_396066 ) ) ( not ( = ?auto_396058 ?auto_396067 ) ) ( not ( = ?auto_396058 ?auto_396068 ) ) ( not ( = ?auto_396058 ?auto_396069 ) ) ( not ( = ?auto_396059 ?auto_396060 ) ) ( not ( = ?auto_396059 ?auto_396061 ) ) ( not ( = ?auto_396059 ?auto_396062 ) ) ( not ( = ?auto_396059 ?auto_396063 ) ) ( not ( = ?auto_396059 ?auto_396064 ) ) ( not ( = ?auto_396059 ?auto_396065 ) ) ( not ( = ?auto_396059 ?auto_396066 ) ) ( not ( = ?auto_396059 ?auto_396067 ) ) ( not ( = ?auto_396059 ?auto_396068 ) ) ( not ( = ?auto_396059 ?auto_396069 ) ) ( not ( = ?auto_396060 ?auto_396061 ) ) ( not ( = ?auto_396060 ?auto_396062 ) ) ( not ( = ?auto_396060 ?auto_396063 ) ) ( not ( = ?auto_396060 ?auto_396064 ) ) ( not ( = ?auto_396060 ?auto_396065 ) ) ( not ( = ?auto_396060 ?auto_396066 ) ) ( not ( = ?auto_396060 ?auto_396067 ) ) ( not ( = ?auto_396060 ?auto_396068 ) ) ( not ( = ?auto_396060 ?auto_396069 ) ) ( not ( = ?auto_396061 ?auto_396062 ) ) ( not ( = ?auto_396061 ?auto_396063 ) ) ( not ( = ?auto_396061 ?auto_396064 ) ) ( not ( = ?auto_396061 ?auto_396065 ) ) ( not ( = ?auto_396061 ?auto_396066 ) ) ( not ( = ?auto_396061 ?auto_396067 ) ) ( not ( = ?auto_396061 ?auto_396068 ) ) ( not ( = ?auto_396061 ?auto_396069 ) ) ( not ( = ?auto_396062 ?auto_396063 ) ) ( not ( = ?auto_396062 ?auto_396064 ) ) ( not ( = ?auto_396062 ?auto_396065 ) ) ( not ( = ?auto_396062 ?auto_396066 ) ) ( not ( = ?auto_396062 ?auto_396067 ) ) ( not ( = ?auto_396062 ?auto_396068 ) ) ( not ( = ?auto_396062 ?auto_396069 ) ) ( not ( = ?auto_396063 ?auto_396064 ) ) ( not ( = ?auto_396063 ?auto_396065 ) ) ( not ( = ?auto_396063 ?auto_396066 ) ) ( not ( = ?auto_396063 ?auto_396067 ) ) ( not ( = ?auto_396063 ?auto_396068 ) ) ( not ( = ?auto_396063 ?auto_396069 ) ) ( not ( = ?auto_396064 ?auto_396065 ) ) ( not ( = ?auto_396064 ?auto_396066 ) ) ( not ( = ?auto_396064 ?auto_396067 ) ) ( not ( = ?auto_396064 ?auto_396068 ) ) ( not ( = ?auto_396064 ?auto_396069 ) ) ( not ( = ?auto_396065 ?auto_396066 ) ) ( not ( = ?auto_396065 ?auto_396067 ) ) ( not ( = ?auto_396065 ?auto_396068 ) ) ( not ( = ?auto_396065 ?auto_396069 ) ) ( not ( = ?auto_396066 ?auto_396067 ) ) ( not ( = ?auto_396066 ?auto_396068 ) ) ( not ( = ?auto_396066 ?auto_396069 ) ) ( not ( = ?auto_396067 ?auto_396068 ) ) ( not ( = ?auto_396067 ?auto_396069 ) ) ( not ( = ?auto_396068 ?auto_396069 ) ) ( ON ?auto_396067 ?auto_396068 ) ( ON ?auto_396066 ?auto_396067 ) ( ON ?auto_396065 ?auto_396066 ) ( ON ?auto_396064 ?auto_396065 ) ( ON ?auto_396063 ?auto_396064 ) ( ON ?auto_396062 ?auto_396063 ) ( ON ?auto_396061 ?auto_396062 ) ( ON ?auto_396060 ?auto_396061 ) ( ON ?auto_396059 ?auto_396060 ) ( ON ?auto_396058 ?auto_396059 ) ( CLEAR ?auto_396056 ) ( ON ?auto_396057 ?auto_396058 ) ( CLEAR ?auto_396057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_396055 ?auto_396056 ?auto_396057 )
      ( MAKE-14PILE ?auto_396055 ?auto_396056 ?auto_396057 ?auto_396058 ?auto_396059 ?auto_396060 ?auto_396061 ?auto_396062 ?auto_396063 ?auto_396064 ?auto_396065 ?auto_396066 ?auto_396067 ?auto_396068 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396084 - BLOCK
      ?auto_396085 - BLOCK
      ?auto_396086 - BLOCK
      ?auto_396087 - BLOCK
      ?auto_396088 - BLOCK
      ?auto_396089 - BLOCK
      ?auto_396090 - BLOCK
      ?auto_396091 - BLOCK
      ?auto_396092 - BLOCK
      ?auto_396093 - BLOCK
      ?auto_396094 - BLOCK
      ?auto_396095 - BLOCK
      ?auto_396096 - BLOCK
      ?auto_396097 - BLOCK
    )
    :vars
    (
      ?auto_396098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396097 ?auto_396098 ) ( ON-TABLE ?auto_396084 ) ( not ( = ?auto_396084 ?auto_396085 ) ) ( not ( = ?auto_396084 ?auto_396086 ) ) ( not ( = ?auto_396084 ?auto_396087 ) ) ( not ( = ?auto_396084 ?auto_396088 ) ) ( not ( = ?auto_396084 ?auto_396089 ) ) ( not ( = ?auto_396084 ?auto_396090 ) ) ( not ( = ?auto_396084 ?auto_396091 ) ) ( not ( = ?auto_396084 ?auto_396092 ) ) ( not ( = ?auto_396084 ?auto_396093 ) ) ( not ( = ?auto_396084 ?auto_396094 ) ) ( not ( = ?auto_396084 ?auto_396095 ) ) ( not ( = ?auto_396084 ?auto_396096 ) ) ( not ( = ?auto_396084 ?auto_396097 ) ) ( not ( = ?auto_396084 ?auto_396098 ) ) ( not ( = ?auto_396085 ?auto_396086 ) ) ( not ( = ?auto_396085 ?auto_396087 ) ) ( not ( = ?auto_396085 ?auto_396088 ) ) ( not ( = ?auto_396085 ?auto_396089 ) ) ( not ( = ?auto_396085 ?auto_396090 ) ) ( not ( = ?auto_396085 ?auto_396091 ) ) ( not ( = ?auto_396085 ?auto_396092 ) ) ( not ( = ?auto_396085 ?auto_396093 ) ) ( not ( = ?auto_396085 ?auto_396094 ) ) ( not ( = ?auto_396085 ?auto_396095 ) ) ( not ( = ?auto_396085 ?auto_396096 ) ) ( not ( = ?auto_396085 ?auto_396097 ) ) ( not ( = ?auto_396085 ?auto_396098 ) ) ( not ( = ?auto_396086 ?auto_396087 ) ) ( not ( = ?auto_396086 ?auto_396088 ) ) ( not ( = ?auto_396086 ?auto_396089 ) ) ( not ( = ?auto_396086 ?auto_396090 ) ) ( not ( = ?auto_396086 ?auto_396091 ) ) ( not ( = ?auto_396086 ?auto_396092 ) ) ( not ( = ?auto_396086 ?auto_396093 ) ) ( not ( = ?auto_396086 ?auto_396094 ) ) ( not ( = ?auto_396086 ?auto_396095 ) ) ( not ( = ?auto_396086 ?auto_396096 ) ) ( not ( = ?auto_396086 ?auto_396097 ) ) ( not ( = ?auto_396086 ?auto_396098 ) ) ( not ( = ?auto_396087 ?auto_396088 ) ) ( not ( = ?auto_396087 ?auto_396089 ) ) ( not ( = ?auto_396087 ?auto_396090 ) ) ( not ( = ?auto_396087 ?auto_396091 ) ) ( not ( = ?auto_396087 ?auto_396092 ) ) ( not ( = ?auto_396087 ?auto_396093 ) ) ( not ( = ?auto_396087 ?auto_396094 ) ) ( not ( = ?auto_396087 ?auto_396095 ) ) ( not ( = ?auto_396087 ?auto_396096 ) ) ( not ( = ?auto_396087 ?auto_396097 ) ) ( not ( = ?auto_396087 ?auto_396098 ) ) ( not ( = ?auto_396088 ?auto_396089 ) ) ( not ( = ?auto_396088 ?auto_396090 ) ) ( not ( = ?auto_396088 ?auto_396091 ) ) ( not ( = ?auto_396088 ?auto_396092 ) ) ( not ( = ?auto_396088 ?auto_396093 ) ) ( not ( = ?auto_396088 ?auto_396094 ) ) ( not ( = ?auto_396088 ?auto_396095 ) ) ( not ( = ?auto_396088 ?auto_396096 ) ) ( not ( = ?auto_396088 ?auto_396097 ) ) ( not ( = ?auto_396088 ?auto_396098 ) ) ( not ( = ?auto_396089 ?auto_396090 ) ) ( not ( = ?auto_396089 ?auto_396091 ) ) ( not ( = ?auto_396089 ?auto_396092 ) ) ( not ( = ?auto_396089 ?auto_396093 ) ) ( not ( = ?auto_396089 ?auto_396094 ) ) ( not ( = ?auto_396089 ?auto_396095 ) ) ( not ( = ?auto_396089 ?auto_396096 ) ) ( not ( = ?auto_396089 ?auto_396097 ) ) ( not ( = ?auto_396089 ?auto_396098 ) ) ( not ( = ?auto_396090 ?auto_396091 ) ) ( not ( = ?auto_396090 ?auto_396092 ) ) ( not ( = ?auto_396090 ?auto_396093 ) ) ( not ( = ?auto_396090 ?auto_396094 ) ) ( not ( = ?auto_396090 ?auto_396095 ) ) ( not ( = ?auto_396090 ?auto_396096 ) ) ( not ( = ?auto_396090 ?auto_396097 ) ) ( not ( = ?auto_396090 ?auto_396098 ) ) ( not ( = ?auto_396091 ?auto_396092 ) ) ( not ( = ?auto_396091 ?auto_396093 ) ) ( not ( = ?auto_396091 ?auto_396094 ) ) ( not ( = ?auto_396091 ?auto_396095 ) ) ( not ( = ?auto_396091 ?auto_396096 ) ) ( not ( = ?auto_396091 ?auto_396097 ) ) ( not ( = ?auto_396091 ?auto_396098 ) ) ( not ( = ?auto_396092 ?auto_396093 ) ) ( not ( = ?auto_396092 ?auto_396094 ) ) ( not ( = ?auto_396092 ?auto_396095 ) ) ( not ( = ?auto_396092 ?auto_396096 ) ) ( not ( = ?auto_396092 ?auto_396097 ) ) ( not ( = ?auto_396092 ?auto_396098 ) ) ( not ( = ?auto_396093 ?auto_396094 ) ) ( not ( = ?auto_396093 ?auto_396095 ) ) ( not ( = ?auto_396093 ?auto_396096 ) ) ( not ( = ?auto_396093 ?auto_396097 ) ) ( not ( = ?auto_396093 ?auto_396098 ) ) ( not ( = ?auto_396094 ?auto_396095 ) ) ( not ( = ?auto_396094 ?auto_396096 ) ) ( not ( = ?auto_396094 ?auto_396097 ) ) ( not ( = ?auto_396094 ?auto_396098 ) ) ( not ( = ?auto_396095 ?auto_396096 ) ) ( not ( = ?auto_396095 ?auto_396097 ) ) ( not ( = ?auto_396095 ?auto_396098 ) ) ( not ( = ?auto_396096 ?auto_396097 ) ) ( not ( = ?auto_396096 ?auto_396098 ) ) ( not ( = ?auto_396097 ?auto_396098 ) ) ( ON ?auto_396096 ?auto_396097 ) ( ON ?auto_396095 ?auto_396096 ) ( ON ?auto_396094 ?auto_396095 ) ( ON ?auto_396093 ?auto_396094 ) ( ON ?auto_396092 ?auto_396093 ) ( ON ?auto_396091 ?auto_396092 ) ( ON ?auto_396090 ?auto_396091 ) ( ON ?auto_396089 ?auto_396090 ) ( ON ?auto_396088 ?auto_396089 ) ( ON ?auto_396087 ?auto_396088 ) ( ON ?auto_396086 ?auto_396087 ) ( CLEAR ?auto_396084 ) ( ON ?auto_396085 ?auto_396086 ) ( CLEAR ?auto_396085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_396084 ?auto_396085 )
      ( MAKE-14PILE ?auto_396084 ?auto_396085 ?auto_396086 ?auto_396087 ?auto_396088 ?auto_396089 ?auto_396090 ?auto_396091 ?auto_396092 ?auto_396093 ?auto_396094 ?auto_396095 ?auto_396096 ?auto_396097 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396113 - BLOCK
      ?auto_396114 - BLOCK
      ?auto_396115 - BLOCK
      ?auto_396116 - BLOCK
      ?auto_396117 - BLOCK
      ?auto_396118 - BLOCK
      ?auto_396119 - BLOCK
      ?auto_396120 - BLOCK
      ?auto_396121 - BLOCK
      ?auto_396122 - BLOCK
      ?auto_396123 - BLOCK
      ?auto_396124 - BLOCK
      ?auto_396125 - BLOCK
      ?auto_396126 - BLOCK
    )
    :vars
    (
      ?auto_396127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396126 ?auto_396127 ) ( ON-TABLE ?auto_396113 ) ( not ( = ?auto_396113 ?auto_396114 ) ) ( not ( = ?auto_396113 ?auto_396115 ) ) ( not ( = ?auto_396113 ?auto_396116 ) ) ( not ( = ?auto_396113 ?auto_396117 ) ) ( not ( = ?auto_396113 ?auto_396118 ) ) ( not ( = ?auto_396113 ?auto_396119 ) ) ( not ( = ?auto_396113 ?auto_396120 ) ) ( not ( = ?auto_396113 ?auto_396121 ) ) ( not ( = ?auto_396113 ?auto_396122 ) ) ( not ( = ?auto_396113 ?auto_396123 ) ) ( not ( = ?auto_396113 ?auto_396124 ) ) ( not ( = ?auto_396113 ?auto_396125 ) ) ( not ( = ?auto_396113 ?auto_396126 ) ) ( not ( = ?auto_396113 ?auto_396127 ) ) ( not ( = ?auto_396114 ?auto_396115 ) ) ( not ( = ?auto_396114 ?auto_396116 ) ) ( not ( = ?auto_396114 ?auto_396117 ) ) ( not ( = ?auto_396114 ?auto_396118 ) ) ( not ( = ?auto_396114 ?auto_396119 ) ) ( not ( = ?auto_396114 ?auto_396120 ) ) ( not ( = ?auto_396114 ?auto_396121 ) ) ( not ( = ?auto_396114 ?auto_396122 ) ) ( not ( = ?auto_396114 ?auto_396123 ) ) ( not ( = ?auto_396114 ?auto_396124 ) ) ( not ( = ?auto_396114 ?auto_396125 ) ) ( not ( = ?auto_396114 ?auto_396126 ) ) ( not ( = ?auto_396114 ?auto_396127 ) ) ( not ( = ?auto_396115 ?auto_396116 ) ) ( not ( = ?auto_396115 ?auto_396117 ) ) ( not ( = ?auto_396115 ?auto_396118 ) ) ( not ( = ?auto_396115 ?auto_396119 ) ) ( not ( = ?auto_396115 ?auto_396120 ) ) ( not ( = ?auto_396115 ?auto_396121 ) ) ( not ( = ?auto_396115 ?auto_396122 ) ) ( not ( = ?auto_396115 ?auto_396123 ) ) ( not ( = ?auto_396115 ?auto_396124 ) ) ( not ( = ?auto_396115 ?auto_396125 ) ) ( not ( = ?auto_396115 ?auto_396126 ) ) ( not ( = ?auto_396115 ?auto_396127 ) ) ( not ( = ?auto_396116 ?auto_396117 ) ) ( not ( = ?auto_396116 ?auto_396118 ) ) ( not ( = ?auto_396116 ?auto_396119 ) ) ( not ( = ?auto_396116 ?auto_396120 ) ) ( not ( = ?auto_396116 ?auto_396121 ) ) ( not ( = ?auto_396116 ?auto_396122 ) ) ( not ( = ?auto_396116 ?auto_396123 ) ) ( not ( = ?auto_396116 ?auto_396124 ) ) ( not ( = ?auto_396116 ?auto_396125 ) ) ( not ( = ?auto_396116 ?auto_396126 ) ) ( not ( = ?auto_396116 ?auto_396127 ) ) ( not ( = ?auto_396117 ?auto_396118 ) ) ( not ( = ?auto_396117 ?auto_396119 ) ) ( not ( = ?auto_396117 ?auto_396120 ) ) ( not ( = ?auto_396117 ?auto_396121 ) ) ( not ( = ?auto_396117 ?auto_396122 ) ) ( not ( = ?auto_396117 ?auto_396123 ) ) ( not ( = ?auto_396117 ?auto_396124 ) ) ( not ( = ?auto_396117 ?auto_396125 ) ) ( not ( = ?auto_396117 ?auto_396126 ) ) ( not ( = ?auto_396117 ?auto_396127 ) ) ( not ( = ?auto_396118 ?auto_396119 ) ) ( not ( = ?auto_396118 ?auto_396120 ) ) ( not ( = ?auto_396118 ?auto_396121 ) ) ( not ( = ?auto_396118 ?auto_396122 ) ) ( not ( = ?auto_396118 ?auto_396123 ) ) ( not ( = ?auto_396118 ?auto_396124 ) ) ( not ( = ?auto_396118 ?auto_396125 ) ) ( not ( = ?auto_396118 ?auto_396126 ) ) ( not ( = ?auto_396118 ?auto_396127 ) ) ( not ( = ?auto_396119 ?auto_396120 ) ) ( not ( = ?auto_396119 ?auto_396121 ) ) ( not ( = ?auto_396119 ?auto_396122 ) ) ( not ( = ?auto_396119 ?auto_396123 ) ) ( not ( = ?auto_396119 ?auto_396124 ) ) ( not ( = ?auto_396119 ?auto_396125 ) ) ( not ( = ?auto_396119 ?auto_396126 ) ) ( not ( = ?auto_396119 ?auto_396127 ) ) ( not ( = ?auto_396120 ?auto_396121 ) ) ( not ( = ?auto_396120 ?auto_396122 ) ) ( not ( = ?auto_396120 ?auto_396123 ) ) ( not ( = ?auto_396120 ?auto_396124 ) ) ( not ( = ?auto_396120 ?auto_396125 ) ) ( not ( = ?auto_396120 ?auto_396126 ) ) ( not ( = ?auto_396120 ?auto_396127 ) ) ( not ( = ?auto_396121 ?auto_396122 ) ) ( not ( = ?auto_396121 ?auto_396123 ) ) ( not ( = ?auto_396121 ?auto_396124 ) ) ( not ( = ?auto_396121 ?auto_396125 ) ) ( not ( = ?auto_396121 ?auto_396126 ) ) ( not ( = ?auto_396121 ?auto_396127 ) ) ( not ( = ?auto_396122 ?auto_396123 ) ) ( not ( = ?auto_396122 ?auto_396124 ) ) ( not ( = ?auto_396122 ?auto_396125 ) ) ( not ( = ?auto_396122 ?auto_396126 ) ) ( not ( = ?auto_396122 ?auto_396127 ) ) ( not ( = ?auto_396123 ?auto_396124 ) ) ( not ( = ?auto_396123 ?auto_396125 ) ) ( not ( = ?auto_396123 ?auto_396126 ) ) ( not ( = ?auto_396123 ?auto_396127 ) ) ( not ( = ?auto_396124 ?auto_396125 ) ) ( not ( = ?auto_396124 ?auto_396126 ) ) ( not ( = ?auto_396124 ?auto_396127 ) ) ( not ( = ?auto_396125 ?auto_396126 ) ) ( not ( = ?auto_396125 ?auto_396127 ) ) ( not ( = ?auto_396126 ?auto_396127 ) ) ( ON ?auto_396125 ?auto_396126 ) ( ON ?auto_396124 ?auto_396125 ) ( ON ?auto_396123 ?auto_396124 ) ( ON ?auto_396122 ?auto_396123 ) ( ON ?auto_396121 ?auto_396122 ) ( ON ?auto_396120 ?auto_396121 ) ( ON ?auto_396119 ?auto_396120 ) ( ON ?auto_396118 ?auto_396119 ) ( ON ?auto_396117 ?auto_396118 ) ( ON ?auto_396116 ?auto_396117 ) ( ON ?auto_396115 ?auto_396116 ) ( CLEAR ?auto_396113 ) ( ON ?auto_396114 ?auto_396115 ) ( CLEAR ?auto_396114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_396113 ?auto_396114 )
      ( MAKE-14PILE ?auto_396113 ?auto_396114 ?auto_396115 ?auto_396116 ?auto_396117 ?auto_396118 ?auto_396119 ?auto_396120 ?auto_396121 ?auto_396122 ?auto_396123 ?auto_396124 ?auto_396125 ?auto_396126 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396142 - BLOCK
      ?auto_396143 - BLOCK
      ?auto_396144 - BLOCK
      ?auto_396145 - BLOCK
      ?auto_396146 - BLOCK
      ?auto_396147 - BLOCK
      ?auto_396148 - BLOCK
      ?auto_396149 - BLOCK
      ?auto_396150 - BLOCK
      ?auto_396151 - BLOCK
      ?auto_396152 - BLOCK
      ?auto_396153 - BLOCK
      ?auto_396154 - BLOCK
      ?auto_396155 - BLOCK
    )
    :vars
    (
      ?auto_396156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396155 ?auto_396156 ) ( not ( = ?auto_396142 ?auto_396143 ) ) ( not ( = ?auto_396142 ?auto_396144 ) ) ( not ( = ?auto_396142 ?auto_396145 ) ) ( not ( = ?auto_396142 ?auto_396146 ) ) ( not ( = ?auto_396142 ?auto_396147 ) ) ( not ( = ?auto_396142 ?auto_396148 ) ) ( not ( = ?auto_396142 ?auto_396149 ) ) ( not ( = ?auto_396142 ?auto_396150 ) ) ( not ( = ?auto_396142 ?auto_396151 ) ) ( not ( = ?auto_396142 ?auto_396152 ) ) ( not ( = ?auto_396142 ?auto_396153 ) ) ( not ( = ?auto_396142 ?auto_396154 ) ) ( not ( = ?auto_396142 ?auto_396155 ) ) ( not ( = ?auto_396142 ?auto_396156 ) ) ( not ( = ?auto_396143 ?auto_396144 ) ) ( not ( = ?auto_396143 ?auto_396145 ) ) ( not ( = ?auto_396143 ?auto_396146 ) ) ( not ( = ?auto_396143 ?auto_396147 ) ) ( not ( = ?auto_396143 ?auto_396148 ) ) ( not ( = ?auto_396143 ?auto_396149 ) ) ( not ( = ?auto_396143 ?auto_396150 ) ) ( not ( = ?auto_396143 ?auto_396151 ) ) ( not ( = ?auto_396143 ?auto_396152 ) ) ( not ( = ?auto_396143 ?auto_396153 ) ) ( not ( = ?auto_396143 ?auto_396154 ) ) ( not ( = ?auto_396143 ?auto_396155 ) ) ( not ( = ?auto_396143 ?auto_396156 ) ) ( not ( = ?auto_396144 ?auto_396145 ) ) ( not ( = ?auto_396144 ?auto_396146 ) ) ( not ( = ?auto_396144 ?auto_396147 ) ) ( not ( = ?auto_396144 ?auto_396148 ) ) ( not ( = ?auto_396144 ?auto_396149 ) ) ( not ( = ?auto_396144 ?auto_396150 ) ) ( not ( = ?auto_396144 ?auto_396151 ) ) ( not ( = ?auto_396144 ?auto_396152 ) ) ( not ( = ?auto_396144 ?auto_396153 ) ) ( not ( = ?auto_396144 ?auto_396154 ) ) ( not ( = ?auto_396144 ?auto_396155 ) ) ( not ( = ?auto_396144 ?auto_396156 ) ) ( not ( = ?auto_396145 ?auto_396146 ) ) ( not ( = ?auto_396145 ?auto_396147 ) ) ( not ( = ?auto_396145 ?auto_396148 ) ) ( not ( = ?auto_396145 ?auto_396149 ) ) ( not ( = ?auto_396145 ?auto_396150 ) ) ( not ( = ?auto_396145 ?auto_396151 ) ) ( not ( = ?auto_396145 ?auto_396152 ) ) ( not ( = ?auto_396145 ?auto_396153 ) ) ( not ( = ?auto_396145 ?auto_396154 ) ) ( not ( = ?auto_396145 ?auto_396155 ) ) ( not ( = ?auto_396145 ?auto_396156 ) ) ( not ( = ?auto_396146 ?auto_396147 ) ) ( not ( = ?auto_396146 ?auto_396148 ) ) ( not ( = ?auto_396146 ?auto_396149 ) ) ( not ( = ?auto_396146 ?auto_396150 ) ) ( not ( = ?auto_396146 ?auto_396151 ) ) ( not ( = ?auto_396146 ?auto_396152 ) ) ( not ( = ?auto_396146 ?auto_396153 ) ) ( not ( = ?auto_396146 ?auto_396154 ) ) ( not ( = ?auto_396146 ?auto_396155 ) ) ( not ( = ?auto_396146 ?auto_396156 ) ) ( not ( = ?auto_396147 ?auto_396148 ) ) ( not ( = ?auto_396147 ?auto_396149 ) ) ( not ( = ?auto_396147 ?auto_396150 ) ) ( not ( = ?auto_396147 ?auto_396151 ) ) ( not ( = ?auto_396147 ?auto_396152 ) ) ( not ( = ?auto_396147 ?auto_396153 ) ) ( not ( = ?auto_396147 ?auto_396154 ) ) ( not ( = ?auto_396147 ?auto_396155 ) ) ( not ( = ?auto_396147 ?auto_396156 ) ) ( not ( = ?auto_396148 ?auto_396149 ) ) ( not ( = ?auto_396148 ?auto_396150 ) ) ( not ( = ?auto_396148 ?auto_396151 ) ) ( not ( = ?auto_396148 ?auto_396152 ) ) ( not ( = ?auto_396148 ?auto_396153 ) ) ( not ( = ?auto_396148 ?auto_396154 ) ) ( not ( = ?auto_396148 ?auto_396155 ) ) ( not ( = ?auto_396148 ?auto_396156 ) ) ( not ( = ?auto_396149 ?auto_396150 ) ) ( not ( = ?auto_396149 ?auto_396151 ) ) ( not ( = ?auto_396149 ?auto_396152 ) ) ( not ( = ?auto_396149 ?auto_396153 ) ) ( not ( = ?auto_396149 ?auto_396154 ) ) ( not ( = ?auto_396149 ?auto_396155 ) ) ( not ( = ?auto_396149 ?auto_396156 ) ) ( not ( = ?auto_396150 ?auto_396151 ) ) ( not ( = ?auto_396150 ?auto_396152 ) ) ( not ( = ?auto_396150 ?auto_396153 ) ) ( not ( = ?auto_396150 ?auto_396154 ) ) ( not ( = ?auto_396150 ?auto_396155 ) ) ( not ( = ?auto_396150 ?auto_396156 ) ) ( not ( = ?auto_396151 ?auto_396152 ) ) ( not ( = ?auto_396151 ?auto_396153 ) ) ( not ( = ?auto_396151 ?auto_396154 ) ) ( not ( = ?auto_396151 ?auto_396155 ) ) ( not ( = ?auto_396151 ?auto_396156 ) ) ( not ( = ?auto_396152 ?auto_396153 ) ) ( not ( = ?auto_396152 ?auto_396154 ) ) ( not ( = ?auto_396152 ?auto_396155 ) ) ( not ( = ?auto_396152 ?auto_396156 ) ) ( not ( = ?auto_396153 ?auto_396154 ) ) ( not ( = ?auto_396153 ?auto_396155 ) ) ( not ( = ?auto_396153 ?auto_396156 ) ) ( not ( = ?auto_396154 ?auto_396155 ) ) ( not ( = ?auto_396154 ?auto_396156 ) ) ( not ( = ?auto_396155 ?auto_396156 ) ) ( ON ?auto_396154 ?auto_396155 ) ( ON ?auto_396153 ?auto_396154 ) ( ON ?auto_396152 ?auto_396153 ) ( ON ?auto_396151 ?auto_396152 ) ( ON ?auto_396150 ?auto_396151 ) ( ON ?auto_396149 ?auto_396150 ) ( ON ?auto_396148 ?auto_396149 ) ( ON ?auto_396147 ?auto_396148 ) ( ON ?auto_396146 ?auto_396147 ) ( ON ?auto_396145 ?auto_396146 ) ( ON ?auto_396144 ?auto_396145 ) ( ON ?auto_396143 ?auto_396144 ) ( ON ?auto_396142 ?auto_396143 ) ( CLEAR ?auto_396142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_396142 )
      ( MAKE-14PILE ?auto_396142 ?auto_396143 ?auto_396144 ?auto_396145 ?auto_396146 ?auto_396147 ?auto_396148 ?auto_396149 ?auto_396150 ?auto_396151 ?auto_396152 ?auto_396153 ?auto_396154 ?auto_396155 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_396171 - BLOCK
      ?auto_396172 - BLOCK
      ?auto_396173 - BLOCK
      ?auto_396174 - BLOCK
      ?auto_396175 - BLOCK
      ?auto_396176 - BLOCK
      ?auto_396177 - BLOCK
      ?auto_396178 - BLOCK
      ?auto_396179 - BLOCK
      ?auto_396180 - BLOCK
      ?auto_396181 - BLOCK
      ?auto_396182 - BLOCK
      ?auto_396183 - BLOCK
      ?auto_396184 - BLOCK
    )
    :vars
    (
      ?auto_396185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396184 ?auto_396185 ) ( not ( = ?auto_396171 ?auto_396172 ) ) ( not ( = ?auto_396171 ?auto_396173 ) ) ( not ( = ?auto_396171 ?auto_396174 ) ) ( not ( = ?auto_396171 ?auto_396175 ) ) ( not ( = ?auto_396171 ?auto_396176 ) ) ( not ( = ?auto_396171 ?auto_396177 ) ) ( not ( = ?auto_396171 ?auto_396178 ) ) ( not ( = ?auto_396171 ?auto_396179 ) ) ( not ( = ?auto_396171 ?auto_396180 ) ) ( not ( = ?auto_396171 ?auto_396181 ) ) ( not ( = ?auto_396171 ?auto_396182 ) ) ( not ( = ?auto_396171 ?auto_396183 ) ) ( not ( = ?auto_396171 ?auto_396184 ) ) ( not ( = ?auto_396171 ?auto_396185 ) ) ( not ( = ?auto_396172 ?auto_396173 ) ) ( not ( = ?auto_396172 ?auto_396174 ) ) ( not ( = ?auto_396172 ?auto_396175 ) ) ( not ( = ?auto_396172 ?auto_396176 ) ) ( not ( = ?auto_396172 ?auto_396177 ) ) ( not ( = ?auto_396172 ?auto_396178 ) ) ( not ( = ?auto_396172 ?auto_396179 ) ) ( not ( = ?auto_396172 ?auto_396180 ) ) ( not ( = ?auto_396172 ?auto_396181 ) ) ( not ( = ?auto_396172 ?auto_396182 ) ) ( not ( = ?auto_396172 ?auto_396183 ) ) ( not ( = ?auto_396172 ?auto_396184 ) ) ( not ( = ?auto_396172 ?auto_396185 ) ) ( not ( = ?auto_396173 ?auto_396174 ) ) ( not ( = ?auto_396173 ?auto_396175 ) ) ( not ( = ?auto_396173 ?auto_396176 ) ) ( not ( = ?auto_396173 ?auto_396177 ) ) ( not ( = ?auto_396173 ?auto_396178 ) ) ( not ( = ?auto_396173 ?auto_396179 ) ) ( not ( = ?auto_396173 ?auto_396180 ) ) ( not ( = ?auto_396173 ?auto_396181 ) ) ( not ( = ?auto_396173 ?auto_396182 ) ) ( not ( = ?auto_396173 ?auto_396183 ) ) ( not ( = ?auto_396173 ?auto_396184 ) ) ( not ( = ?auto_396173 ?auto_396185 ) ) ( not ( = ?auto_396174 ?auto_396175 ) ) ( not ( = ?auto_396174 ?auto_396176 ) ) ( not ( = ?auto_396174 ?auto_396177 ) ) ( not ( = ?auto_396174 ?auto_396178 ) ) ( not ( = ?auto_396174 ?auto_396179 ) ) ( not ( = ?auto_396174 ?auto_396180 ) ) ( not ( = ?auto_396174 ?auto_396181 ) ) ( not ( = ?auto_396174 ?auto_396182 ) ) ( not ( = ?auto_396174 ?auto_396183 ) ) ( not ( = ?auto_396174 ?auto_396184 ) ) ( not ( = ?auto_396174 ?auto_396185 ) ) ( not ( = ?auto_396175 ?auto_396176 ) ) ( not ( = ?auto_396175 ?auto_396177 ) ) ( not ( = ?auto_396175 ?auto_396178 ) ) ( not ( = ?auto_396175 ?auto_396179 ) ) ( not ( = ?auto_396175 ?auto_396180 ) ) ( not ( = ?auto_396175 ?auto_396181 ) ) ( not ( = ?auto_396175 ?auto_396182 ) ) ( not ( = ?auto_396175 ?auto_396183 ) ) ( not ( = ?auto_396175 ?auto_396184 ) ) ( not ( = ?auto_396175 ?auto_396185 ) ) ( not ( = ?auto_396176 ?auto_396177 ) ) ( not ( = ?auto_396176 ?auto_396178 ) ) ( not ( = ?auto_396176 ?auto_396179 ) ) ( not ( = ?auto_396176 ?auto_396180 ) ) ( not ( = ?auto_396176 ?auto_396181 ) ) ( not ( = ?auto_396176 ?auto_396182 ) ) ( not ( = ?auto_396176 ?auto_396183 ) ) ( not ( = ?auto_396176 ?auto_396184 ) ) ( not ( = ?auto_396176 ?auto_396185 ) ) ( not ( = ?auto_396177 ?auto_396178 ) ) ( not ( = ?auto_396177 ?auto_396179 ) ) ( not ( = ?auto_396177 ?auto_396180 ) ) ( not ( = ?auto_396177 ?auto_396181 ) ) ( not ( = ?auto_396177 ?auto_396182 ) ) ( not ( = ?auto_396177 ?auto_396183 ) ) ( not ( = ?auto_396177 ?auto_396184 ) ) ( not ( = ?auto_396177 ?auto_396185 ) ) ( not ( = ?auto_396178 ?auto_396179 ) ) ( not ( = ?auto_396178 ?auto_396180 ) ) ( not ( = ?auto_396178 ?auto_396181 ) ) ( not ( = ?auto_396178 ?auto_396182 ) ) ( not ( = ?auto_396178 ?auto_396183 ) ) ( not ( = ?auto_396178 ?auto_396184 ) ) ( not ( = ?auto_396178 ?auto_396185 ) ) ( not ( = ?auto_396179 ?auto_396180 ) ) ( not ( = ?auto_396179 ?auto_396181 ) ) ( not ( = ?auto_396179 ?auto_396182 ) ) ( not ( = ?auto_396179 ?auto_396183 ) ) ( not ( = ?auto_396179 ?auto_396184 ) ) ( not ( = ?auto_396179 ?auto_396185 ) ) ( not ( = ?auto_396180 ?auto_396181 ) ) ( not ( = ?auto_396180 ?auto_396182 ) ) ( not ( = ?auto_396180 ?auto_396183 ) ) ( not ( = ?auto_396180 ?auto_396184 ) ) ( not ( = ?auto_396180 ?auto_396185 ) ) ( not ( = ?auto_396181 ?auto_396182 ) ) ( not ( = ?auto_396181 ?auto_396183 ) ) ( not ( = ?auto_396181 ?auto_396184 ) ) ( not ( = ?auto_396181 ?auto_396185 ) ) ( not ( = ?auto_396182 ?auto_396183 ) ) ( not ( = ?auto_396182 ?auto_396184 ) ) ( not ( = ?auto_396182 ?auto_396185 ) ) ( not ( = ?auto_396183 ?auto_396184 ) ) ( not ( = ?auto_396183 ?auto_396185 ) ) ( not ( = ?auto_396184 ?auto_396185 ) ) ( ON ?auto_396183 ?auto_396184 ) ( ON ?auto_396182 ?auto_396183 ) ( ON ?auto_396181 ?auto_396182 ) ( ON ?auto_396180 ?auto_396181 ) ( ON ?auto_396179 ?auto_396180 ) ( ON ?auto_396178 ?auto_396179 ) ( ON ?auto_396177 ?auto_396178 ) ( ON ?auto_396176 ?auto_396177 ) ( ON ?auto_396175 ?auto_396176 ) ( ON ?auto_396174 ?auto_396175 ) ( ON ?auto_396173 ?auto_396174 ) ( ON ?auto_396172 ?auto_396173 ) ( ON ?auto_396171 ?auto_396172 ) ( CLEAR ?auto_396171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_396171 )
      ( MAKE-14PILE ?auto_396171 ?auto_396172 ?auto_396173 ?auto_396174 ?auto_396175 ?auto_396176 ?auto_396177 ?auto_396178 ?auto_396179 ?auto_396180 ?auto_396181 ?auto_396182 ?auto_396183 ?auto_396184 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396201 - BLOCK
      ?auto_396202 - BLOCK
      ?auto_396203 - BLOCK
      ?auto_396204 - BLOCK
      ?auto_396205 - BLOCK
      ?auto_396206 - BLOCK
      ?auto_396207 - BLOCK
      ?auto_396208 - BLOCK
      ?auto_396209 - BLOCK
      ?auto_396210 - BLOCK
      ?auto_396211 - BLOCK
      ?auto_396212 - BLOCK
      ?auto_396213 - BLOCK
      ?auto_396214 - BLOCK
      ?auto_396215 - BLOCK
    )
    :vars
    (
      ?auto_396216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_396214 ) ( ON ?auto_396215 ?auto_396216 ) ( CLEAR ?auto_396215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_396201 ) ( ON ?auto_396202 ?auto_396201 ) ( ON ?auto_396203 ?auto_396202 ) ( ON ?auto_396204 ?auto_396203 ) ( ON ?auto_396205 ?auto_396204 ) ( ON ?auto_396206 ?auto_396205 ) ( ON ?auto_396207 ?auto_396206 ) ( ON ?auto_396208 ?auto_396207 ) ( ON ?auto_396209 ?auto_396208 ) ( ON ?auto_396210 ?auto_396209 ) ( ON ?auto_396211 ?auto_396210 ) ( ON ?auto_396212 ?auto_396211 ) ( ON ?auto_396213 ?auto_396212 ) ( ON ?auto_396214 ?auto_396213 ) ( not ( = ?auto_396201 ?auto_396202 ) ) ( not ( = ?auto_396201 ?auto_396203 ) ) ( not ( = ?auto_396201 ?auto_396204 ) ) ( not ( = ?auto_396201 ?auto_396205 ) ) ( not ( = ?auto_396201 ?auto_396206 ) ) ( not ( = ?auto_396201 ?auto_396207 ) ) ( not ( = ?auto_396201 ?auto_396208 ) ) ( not ( = ?auto_396201 ?auto_396209 ) ) ( not ( = ?auto_396201 ?auto_396210 ) ) ( not ( = ?auto_396201 ?auto_396211 ) ) ( not ( = ?auto_396201 ?auto_396212 ) ) ( not ( = ?auto_396201 ?auto_396213 ) ) ( not ( = ?auto_396201 ?auto_396214 ) ) ( not ( = ?auto_396201 ?auto_396215 ) ) ( not ( = ?auto_396201 ?auto_396216 ) ) ( not ( = ?auto_396202 ?auto_396203 ) ) ( not ( = ?auto_396202 ?auto_396204 ) ) ( not ( = ?auto_396202 ?auto_396205 ) ) ( not ( = ?auto_396202 ?auto_396206 ) ) ( not ( = ?auto_396202 ?auto_396207 ) ) ( not ( = ?auto_396202 ?auto_396208 ) ) ( not ( = ?auto_396202 ?auto_396209 ) ) ( not ( = ?auto_396202 ?auto_396210 ) ) ( not ( = ?auto_396202 ?auto_396211 ) ) ( not ( = ?auto_396202 ?auto_396212 ) ) ( not ( = ?auto_396202 ?auto_396213 ) ) ( not ( = ?auto_396202 ?auto_396214 ) ) ( not ( = ?auto_396202 ?auto_396215 ) ) ( not ( = ?auto_396202 ?auto_396216 ) ) ( not ( = ?auto_396203 ?auto_396204 ) ) ( not ( = ?auto_396203 ?auto_396205 ) ) ( not ( = ?auto_396203 ?auto_396206 ) ) ( not ( = ?auto_396203 ?auto_396207 ) ) ( not ( = ?auto_396203 ?auto_396208 ) ) ( not ( = ?auto_396203 ?auto_396209 ) ) ( not ( = ?auto_396203 ?auto_396210 ) ) ( not ( = ?auto_396203 ?auto_396211 ) ) ( not ( = ?auto_396203 ?auto_396212 ) ) ( not ( = ?auto_396203 ?auto_396213 ) ) ( not ( = ?auto_396203 ?auto_396214 ) ) ( not ( = ?auto_396203 ?auto_396215 ) ) ( not ( = ?auto_396203 ?auto_396216 ) ) ( not ( = ?auto_396204 ?auto_396205 ) ) ( not ( = ?auto_396204 ?auto_396206 ) ) ( not ( = ?auto_396204 ?auto_396207 ) ) ( not ( = ?auto_396204 ?auto_396208 ) ) ( not ( = ?auto_396204 ?auto_396209 ) ) ( not ( = ?auto_396204 ?auto_396210 ) ) ( not ( = ?auto_396204 ?auto_396211 ) ) ( not ( = ?auto_396204 ?auto_396212 ) ) ( not ( = ?auto_396204 ?auto_396213 ) ) ( not ( = ?auto_396204 ?auto_396214 ) ) ( not ( = ?auto_396204 ?auto_396215 ) ) ( not ( = ?auto_396204 ?auto_396216 ) ) ( not ( = ?auto_396205 ?auto_396206 ) ) ( not ( = ?auto_396205 ?auto_396207 ) ) ( not ( = ?auto_396205 ?auto_396208 ) ) ( not ( = ?auto_396205 ?auto_396209 ) ) ( not ( = ?auto_396205 ?auto_396210 ) ) ( not ( = ?auto_396205 ?auto_396211 ) ) ( not ( = ?auto_396205 ?auto_396212 ) ) ( not ( = ?auto_396205 ?auto_396213 ) ) ( not ( = ?auto_396205 ?auto_396214 ) ) ( not ( = ?auto_396205 ?auto_396215 ) ) ( not ( = ?auto_396205 ?auto_396216 ) ) ( not ( = ?auto_396206 ?auto_396207 ) ) ( not ( = ?auto_396206 ?auto_396208 ) ) ( not ( = ?auto_396206 ?auto_396209 ) ) ( not ( = ?auto_396206 ?auto_396210 ) ) ( not ( = ?auto_396206 ?auto_396211 ) ) ( not ( = ?auto_396206 ?auto_396212 ) ) ( not ( = ?auto_396206 ?auto_396213 ) ) ( not ( = ?auto_396206 ?auto_396214 ) ) ( not ( = ?auto_396206 ?auto_396215 ) ) ( not ( = ?auto_396206 ?auto_396216 ) ) ( not ( = ?auto_396207 ?auto_396208 ) ) ( not ( = ?auto_396207 ?auto_396209 ) ) ( not ( = ?auto_396207 ?auto_396210 ) ) ( not ( = ?auto_396207 ?auto_396211 ) ) ( not ( = ?auto_396207 ?auto_396212 ) ) ( not ( = ?auto_396207 ?auto_396213 ) ) ( not ( = ?auto_396207 ?auto_396214 ) ) ( not ( = ?auto_396207 ?auto_396215 ) ) ( not ( = ?auto_396207 ?auto_396216 ) ) ( not ( = ?auto_396208 ?auto_396209 ) ) ( not ( = ?auto_396208 ?auto_396210 ) ) ( not ( = ?auto_396208 ?auto_396211 ) ) ( not ( = ?auto_396208 ?auto_396212 ) ) ( not ( = ?auto_396208 ?auto_396213 ) ) ( not ( = ?auto_396208 ?auto_396214 ) ) ( not ( = ?auto_396208 ?auto_396215 ) ) ( not ( = ?auto_396208 ?auto_396216 ) ) ( not ( = ?auto_396209 ?auto_396210 ) ) ( not ( = ?auto_396209 ?auto_396211 ) ) ( not ( = ?auto_396209 ?auto_396212 ) ) ( not ( = ?auto_396209 ?auto_396213 ) ) ( not ( = ?auto_396209 ?auto_396214 ) ) ( not ( = ?auto_396209 ?auto_396215 ) ) ( not ( = ?auto_396209 ?auto_396216 ) ) ( not ( = ?auto_396210 ?auto_396211 ) ) ( not ( = ?auto_396210 ?auto_396212 ) ) ( not ( = ?auto_396210 ?auto_396213 ) ) ( not ( = ?auto_396210 ?auto_396214 ) ) ( not ( = ?auto_396210 ?auto_396215 ) ) ( not ( = ?auto_396210 ?auto_396216 ) ) ( not ( = ?auto_396211 ?auto_396212 ) ) ( not ( = ?auto_396211 ?auto_396213 ) ) ( not ( = ?auto_396211 ?auto_396214 ) ) ( not ( = ?auto_396211 ?auto_396215 ) ) ( not ( = ?auto_396211 ?auto_396216 ) ) ( not ( = ?auto_396212 ?auto_396213 ) ) ( not ( = ?auto_396212 ?auto_396214 ) ) ( not ( = ?auto_396212 ?auto_396215 ) ) ( not ( = ?auto_396212 ?auto_396216 ) ) ( not ( = ?auto_396213 ?auto_396214 ) ) ( not ( = ?auto_396213 ?auto_396215 ) ) ( not ( = ?auto_396213 ?auto_396216 ) ) ( not ( = ?auto_396214 ?auto_396215 ) ) ( not ( = ?auto_396214 ?auto_396216 ) ) ( not ( = ?auto_396215 ?auto_396216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_396215 ?auto_396216 )
      ( !STACK ?auto_396215 ?auto_396214 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396232 - BLOCK
      ?auto_396233 - BLOCK
      ?auto_396234 - BLOCK
      ?auto_396235 - BLOCK
      ?auto_396236 - BLOCK
      ?auto_396237 - BLOCK
      ?auto_396238 - BLOCK
      ?auto_396239 - BLOCK
      ?auto_396240 - BLOCK
      ?auto_396241 - BLOCK
      ?auto_396242 - BLOCK
      ?auto_396243 - BLOCK
      ?auto_396244 - BLOCK
      ?auto_396245 - BLOCK
      ?auto_396246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_396245 ) ( ON-TABLE ?auto_396246 ) ( CLEAR ?auto_396246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_396232 ) ( ON ?auto_396233 ?auto_396232 ) ( ON ?auto_396234 ?auto_396233 ) ( ON ?auto_396235 ?auto_396234 ) ( ON ?auto_396236 ?auto_396235 ) ( ON ?auto_396237 ?auto_396236 ) ( ON ?auto_396238 ?auto_396237 ) ( ON ?auto_396239 ?auto_396238 ) ( ON ?auto_396240 ?auto_396239 ) ( ON ?auto_396241 ?auto_396240 ) ( ON ?auto_396242 ?auto_396241 ) ( ON ?auto_396243 ?auto_396242 ) ( ON ?auto_396244 ?auto_396243 ) ( ON ?auto_396245 ?auto_396244 ) ( not ( = ?auto_396232 ?auto_396233 ) ) ( not ( = ?auto_396232 ?auto_396234 ) ) ( not ( = ?auto_396232 ?auto_396235 ) ) ( not ( = ?auto_396232 ?auto_396236 ) ) ( not ( = ?auto_396232 ?auto_396237 ) ) ( not ( = ?auto_396232 ?auto_396238 ) ) ( not ( = ?auto_396232 ?auto_396239 ) ) ( not ( = ?auto_396232 ?auto_396240 ) ) ( not ( = ?auto_396232 ?auto_396241 ) ) ( not ( = ?auto_396232 ?auto_396242 ) ) ( not ( = ?auto_396232 ?auto_396243 ) ) ( not ( = ?auto_396232 ?auto_396244 ) ) ( not ( = ?auto_396232 ?auto_396245 ) ) ( not ( = ?auto_396232 ?auto_396246 ) ) ( not ( = ?auto_396233 ?auto_396234 ) ) ( not ( = ?auto_396233 ?auto_396235 ) ) ( not ( = ?auto_396233 ?auto_396236 ) ) ( not ( = ?auto_396233 ?auto_396237 ) ) ( not ( = ?auto_396233 ?auto_396238 ) ) ( not ( = ?auto_396233 ?auto_396239 ) ) ( not ( = ?auto_396233 ?auto_396240 ) ) ( not ( = ?auto_396233 ?auto_396241 ) ) ( not ( = ?auto_396233 ?auto_396242 ) ) ( not ( = ?auto_396233 ?auto_396243 ) ) ( not ( = ?auto_396233 ?auto_396244 ) ) ( not ( = ?auto_396233 ?auto_396245 ) ) ( not ( = ?auto_396233 ?auto_396246 ) ) ( not ( = ?auto_396234 ?auto_396235 ) ) ( not ( = ?auto_396234 ?auto_396236 ) ) ( not ( = ?auto_396234 ?auto_396237 ) ) ( not ( = ?auto_396234 ?auto_396238 ) ) ( not ( = ?auto_396234 ?auto_396239 ) ) ( not ( = ?auto_396234 ?auto_396240 ) ) ( not ( = ?auto_396234 ?auto_396241 ) ) ( not ( = ?auto_396234 ?auto_396242 ) ) ( not ( = ?auto_396234 ?auto_396243 ) ) ( not ( = ?auto_396234 ?auto_396244 ) ) ( not ( = ?auto_396234 ?auto_396245 ) ) ( not ( = ?auto_396234 ?auto_396246 ) ) ( not ( = ?auto_396235 ?auto_396236 ) ) ( not ( = ?auto_396235 ?auto_396237 ) ) ( not ( = ?auto_396235 ?auto_396238 ) ) ( not ( = ?auto_396235 ?auto_396239 ) ) ( not ( = ?auto_396235 ?auto_396240 ) ) ( not ( = ?auto_396235 ?auto_396241 ) ) ( not ( = ?auto_396235 ?auto_396242 ) ) ( not ( = ?auto_396235 ?auto_396243 ) ) ( not ( = ?auto_396235 ?auto_396244 ) ) ( not ( = ?auto_396235 ?auto_396245 ) ) ( not ( = ?auto_396235 ?auto_396246 ) ) ( not ( = ?auto_396236 ?auto_396237 ) ) ( not ( = ?auto_396236 ?auto_396238 ) ) ( not ( = ?auto_396236 ?auto_396239 ) ) ( not ( = ?auto_396236 ?auto_396240 ) ) ( not ( = ?auto_396236 ?auto_396241 ) ) ( not ( = ?auto_396236 ?auto_396242 ) ) ( not ( = ?auto_396236 ?auto_396243 ) ) ( not ( = ?auto_396236 ?auto_396244 ) ) ( not ( = ?auto_396236 ?auto_396245 ) ) ( not ( = ?auto_396236 ?auto_396246 ) ) ( not ( = ?auto_396237 ?auto_396238 ) ) ( not ( = ?auto_396237 ?auto_396239 ) ) ( not ( = ?auto_396237 ?auto_396240 ) ) ( not ( = ?auto_396237 ?auto_396241 ) ) ( not ( = ?auto_396237 ?auto_396242 ) ) ( not ( = ?auto_396237 ?auto_396243 ) ) ( not ( = ?auto_396237 ?auto_396244 ) ) ( not ( = ?auto_396237 ?auto_396245 ) ) ( not ( = ?auto_396237 ?auto_396246 ) ) ( not ( = ?auto_396238 ?auto_396239 ) ) ( not ( = ?auto_396238 ?auto_396240 ) ) ( not ( = ?auto_396238 ?auto_396241 ) ) ( not ( = ?auto_396238 ?auto_396242 ) ) ( not ( = ?auto_396238 ?auto_396243 ) ) ( not ( = ?auto_396238 ?auto_396244 ) ) ( not ( = ?auto_396238 ?auto_396245 ) ) ( not ( = ?auto_396238 ?auto_396246 ) ) ( not ( = ?auto_396239 ?auto_396240 ) ) ( not ( = ?auto_396239 ?auto_396241 ) ) ( not ( = ?auto_396239 ?auto_396242 ) ) ( not ( = ?auto_396239 ?auto_396243 ) ) ( not ( = ?auto_396239 ?auto_396244 ) ) ( not ( = ?auto_396239 ?auto_396245 ) ) ( not ( = ?auto_396239 ?auto_396246 ) ) ( not ( = ?auto_396240 ?auto_396241 ) ) ( not ( = ?auto_396240 ?auto_396242 ) ) ( not ( = ?auto_396240 ?auto_396243 ) ) ( not ( = ?auto_396240 ?auto_396244 ) ) ( not ( = ?auto_396240 ?auto_396245 ) ) ( not ( = ?auto_396240 ?auto_396246 ) ) ( not ( = ?auto_396241 ?auto_396242 ) ) ( not ( = ?auto_396241 ?auto_396243 ) ) ( not ( = ?auto_396241 ?auto_396244 ) ) ( not ( = ?auto_396241 ?auto_396245 ) ) ( not ( = ?auto_396241 ?auto_396246 ) ) ( not ( = ?auto_396242 ?auto_396243 ) ) ( not ( = ?auto_396242 ?auto_396244 ) ) ( not ( = ?auto_396242 ?auto_396245 ) ) ( not ( = ?auto_396242 ?auto_396246 ) ) ( not ( = ?auto_396243 ?auto_396244 ) ) ( not ( = ?auto_396243 ?auto_396245 ) ) ( not ( = ?auto_396243 ?auto_396246 ) ) ( not ( = ?auto_396244 ?auto_396245 ) ) ( not ( = ?auto_396244 ?auto_396246 ) ) ( not ( = ?auto_396245 ?auto_396246 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_396246 )
      ( !STACK ?auto_396246 ?auto_396245 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396262 - BLOCK
      ?auto_396263 - BLOCK
      ?auto_396264 - BLOCK
      ?auto_396265 - BLOCK
      ?auto_396266 - BLOCK
      ?auto_396267 - BLOCK
      ?auto_396268 - BLOCK
      ?auto_396269 - BLOCK
      ?auto_396270 - BLOCK
      ?auto_396271 - BLOCK
      ?auto_396272 - BLOCK
      ?auto_396273 - BLOCK
      ?auto_396274 - BLOCK
      ?auto_396275 - BLOCK
      ?auto_396276 - BLOCK
    )
    :vars
    (
      ?auto_396277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396276 ?auto_396277 ) ( ON-TABLE ?auto_396262 ) ( ON ?auto_396263 ?auto_396262 ) ( ON ?auto_396264 ?auto_396263 ) ( ON ?auto_396265 ?auto_396264 ) ( ON ?auto_396266 ?auto_396265 ) ( ON ?auto_396267 ?auto_396266 ) ( ON ?auto_396268 ?auto_396267 ) ( ON ?auto_396269 ?auto_396268 ) ( ON ?auto_396270 ?auto_396269 ) ( ON ?auto_396271 ?auto_396270 ) ( ON ?auto_396272 ?auto_396271 ) ( ON ?auto_396273 ?auto_396272 ) ( ON ?auto_396274 ?auto_396273 ) ( not ( = ?auto_396262 ?auto_396263 ) ) ( not ( = ?auto_396262 ?auto_396264 ) ) ( not ( = ?auto_396262 ?auto_396265 ) ) ( not ( = ?auto_396262 ?auto_396266 ) ) ( not ( = ?auto_396262 ?auto_396267 ) ) ( not ( = ?auto_396262 ?auto_396268 ) ) ( not ( = ?auto_396262 ?auto_396269 ) ) ( not ( = ?auto_396262 ?auto_396270 ) ) ( not ( = ?auto_396262 ?auto_396271 ) ) ( not ( = ?auto_396262 ?auto_396272 ) ) ( not ( = ?auto_396262 ?auto_396273 ) ) ( not ( = ?auto_396262 ?auto_396274 ) ) ( not ( = ?auto_396262 ?auto_396275 ) ) ( not ( = ?auto_396262 ?auto_396276 ) ) ( not ( = ?auto_396262 ?auto_396277 ) ) ( not ( = ?auto_396263 ?auto_396264 ) ) ( not ( = ?auto_396263 ?auto_396265 ) ) ( not ( = ?auto_396263 ?auto_396266 ) ) ( not ( = ?auto_396263 ?auto_396267 ) ) ( not ( = ?auto_396263 ?auto_396268 ) ) ( not ( = ?auto_396263 ?auto_396269 ) ) ( not ( = ?auto_396263 ?auto_396270 ) ) ( not ( = ?auto_396263 ?auto_396271 ) ) ( not ( = ?auto_396263 ?auto_396272 ) ) ( not ( = ?auto_396263 ?auto_396273 ) ) ( not ( = ?auto_396263 ?auto_396274 ) ) ( not ( = ?auto_396263 ?auto_396275 ) ) ( not ( = ?auto_396263 ?auto_396276 ) ) ( not ( = ?auto_396263 ?auto_396277 ) ) ( not ( = ?auto_396264 ?auto_396265 ) ) ( not ( = ?auto_396264 ?auto_396266 ) ) ( not ( = ?auto_396264 ?auto_396267 ) ) ( not ( = ?auto_396264 ?auto_396268 ) ) ( not ( = ?auto_396264 ?auto_396269 ) ) ( not ( = ?auto_396264 ?auto_396270 ) ) ( not ( = ?auto_396264 ?auto_396271 ) ) ( not ( = ?auto_396264 ?auto_396272 ) ) ( not ( = ?auto_396264 ?auto_396273 ) ) ( not ( = ?auto_396264 ?auto_396274 ) ) ( not ( = ?auto_396264 ?auto_396275 ) ) ( not ( = ?auto_396264 ?auto_396276 ) ) ( not ( = ?auto_396264 ?auto_396277 ) ) ( not ( = ?auto_396265 ?auto_396266 ) ) ( not ( = ?auto_396265 ?auto_396267 ) ) ( not ( = ?auto_396265 ?auto_396268 ) ) ( not ( = ?auto_396265 ?auto_396269 ) ) ( not ( = ?auto_396265 ?auto_396270 ) ) ( not ( = ?auto_396265 ?auto_396271 ) ) ( not ( = ?auto_396265 ?auto_396272 ) ) ( not ( = ?auto_396265 ?auto_396273 ) ) ( not ( = ?auto_396265 ?auto_396274 ) ) ( not ( = ?auto_396265 ?auto_396275 ) ) ( not ( = ?auto_396265 ?auto_396276 ) ) ( not ( = ?auto_396265 ?auto_396277 ) ) ( not ( = ?auto_396266 ?auto_396267 ) ) ( not ( = ?auto_396266 ?auto_396268 ) ) ( not ( = ?auto_396266 ?auto_396269 ) ) ( not ( = ?auto_396266 ?auto_396270 ) ) ( not ( = ?auto_396266 ?auto_396271 ) ) ( not ( = ?auto_396266 ?auto_396272 ) ) ( not ( = ?auto_396266 ?auto_396273 ) ) ( not ( = ?auto_396266 ?auto_396274 ) ) ( not ( = ?auto_396266 ?auto_396275 ) ) ( not ( = ?auto_396266 ?auto_396276 ) ) ( not ( = ?auto_396266 ?auto_396277 ) ) ( not ( = ?auto_396267 ?auto_396268 ) ) ( not ( = ?auto_396267 ?auto_396269 ) ) ( not ( = ?auto_396267 ?auto_396270 ) ) ( not ( = ?auto_396267 ?auto_396271 ) ) ( not ( = ?auto_396267 ?auto_396272 ) ) ( not ( = ?auto_396267 ?auto_396273 ) ) ( not ( = ?auto_396267 ?auto_396274 ) ) ( not ( = ?auto_396267 ?auto_396275 ) ) ( not ( = ?auto_396267 ?auto_396276 ) ) ( not ( = ?auto_396267 ?auto_396277 ) ) ( not ( = ?auto_396268 ?auto_396269 ) ) ( not ( = ?auto_396268 ?auto_396270 ) ) ( not ( = ?auto_396268 ?auto_396271 ) ) ( not ( = ?auto_396268 ?auto_396272 ) ) ( not ( = ?auto_396268 ?auto_396273 ) ) ( not ( = ?auto_396268 ?auto_396274 ) ) ( not ( = ?auto_396268 ?auto_396275 ) ) ( not ( = ?auto_396268 ?auto_396276 ) ) ( not ( = ?auto_396268 ?auto_396277 ) ) ( not ( = ?auto_396269 ?auto_396270 ) ) ( not ( = ?auto_396269 ?auto_396271 ) ) ( not ( = ?auto_396269 ?auto_396272 ) ) ( not ( = ?auto_396269 ?auto_396273 ) ) ( not ( = ?auto_396269 ?auto_396274 ) ) ( not ( = ?auto_396269 ?auto_396275 ) ) ( not ( = ?auto_396269 ?auto_396276 ) ) ( not ( = ?auto_396269 ?auto_396277 ) ) ( not ( = ?auto_396270 ?auto_396271 ) ) ( not ( = ?auto_396270 ?auto_396272 ) ) ( not ( = ?auto_396270 ?auto_396273 ) ) ( not ( = ?auto_396270 ?auto_396274 ) ) ( not ( = ?auto_396270 ?auto_396275 ) ) ( not ( = ?auto_396270 ?auto_396276 ) ) ( not ( = ?auto_396270 ?auto_396277 ) ) ( not ( = ?auto_396271 ?auto_396272 ) ) ( not ( = ?auto_396271 ?auto_396273 ) ) ( not ( = ?auto_396271 ?auto_396274 ) ) ( not ( = ?auto_396271 ?auto_396275 ) ) ( not ( = ?auto_396271 ?auto_396276 ) ) ( not ( = ?auto_396271 ?auto_396277 ) ) ( not ( = ?auto_396272 ?auto_396273 ) ) ( not ( = ?auto_396272 ?auto_396274 ) ) ( not ( = ?auto_396272 ?auto_396275 ) ) ( not ( = ?auto_396272 ?auto_396276 ) ) ( not ( = ?auto_396272 ?auto_396277 ) ) ( not ( = ?auto_396273 ?auto_396274 ) ) ( not ( = ?auto_396273 ?auto_396275 ) ) ( not ( = ?auto_396273 ?auto_396276 ) ) ( not ( = ?auto_396273 ?auto_396277 ) ) ( not ( = ?auto_396274 ?auto_396275 ) ) ( not ( = ?auto_396274 ?auto_396276 ) ) ( not ( = ?auto_396274 ?auto_396277 ) ) ( not ( = ?auto_396275 ?auto_396276 ) ) ( not ( = ?auto_396275 ?auto_396277 ) ) ( not ( = ?auto_396276 ?auto_396277 ) ) ( CLEAR ?auto_396274 ) ( ON ?auto_396275 ?auto_396276 ) ( CLEAR ?auto_396275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_396262 ?auto_396263 ?auto_396264 ?auto_396265 ?auto_396266 ?auto_396267 ?auto_396268 ?auto_396269 ?auto_396270 ?auto_396271 ?auto_396272 ?auto_396273 ?auto_396274 ?auto_396275 )
      ( MAKE-15PILE ?auto_396262 ?auto_396263 ?auto_396264 ?auto_396265 ?auto_396266 ?auto_396267 ?auto_396268 ?auto_396269 ?auto_396270 ?auto_396271 ?auto_396272 ?auto_396273 ?auto_396274 ?auto_396275 ?auto_396276 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396293 - BLOCK
      ?auto_396294 - BLOCK
      ?auto_396295 - BLOCK
      ?auto_396296 - BLOCK
      ?auto_396297 - BLOCK
      ?auto_396298 - BLOCK
      ?auto_396299 - BLOCK
      ?auto_396300 - BLOCK
      ?auto_396301 - BLOCK
      ?auto_396302 - BLOCK
      ?auto_396303 - BLOCK
      ?auto_396304 - BLOCK
      ?auto_396305 - BLOCK
      ?auto_396306 - BLOCK
      ?auto_396307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396307 ) ( ON-TABLE ?auto_396293 ) ( ON ?auto_396294 ?auto_396293 ) ( ON ?auto_396295 ?auto_396294 ) ( ON ?auto_396296 ?auto_396295 ) ( ON ?auto_396297 ?auto_396296 ) ( ON ?auto_396298 ?auto_396297 ) ( ON ?auto_396299 ?auto_396298 ) ( ON ?auto_396300 ?auto_396299 ) ( ON ?auto_396301 ?auto_396300 ) ( ON ?auto_396302 ?auto_396301 ) ( ON ?auto_396303 ?auto_396302 ) ( ON ?auto_396304 ?auto_396303 ) ( ON ?auto_396305 ?auto_396304 ) ( not ( = ?auto_396293 ?auto_396294 ) ) ( not ( = ?auto_396293 ?auto_396295 ) ) ( not ( = ?auto_396293 ?auto_396296 ) ) ( not ( = ?auto_396293 ?auto_396297 ) ) ( not ( = ?auto_396293 ?auto_396298 ) ) ( not ( = ?auto_396293 ?auto_396299 ) ) ( not ( = ?auto_396293 ?auto_396300 ) ) ( not ( = ?auto_396293 ?auto_396301 ) ) ( not ( = ?auto_396293 ?auto_396302 ) ) ( not ( = ?auto_396293 ?auto_396303 ) ) ( not ( = ?auto_396293 ?auto_396304 ) ) ( not ( = ?auto_396293 ?auto_396305 ) ) ( not ( = ?auto_396293 ?auto_396306 ) ) ( not ( = ?auto_396293 ?auto_396307 ) ) ( not ( = ?auto_396294 ?auto_396295 ) ) ( not ( = ?auto_396294 ?auto_396296 ) ) ( not ( = ?auto_396294 ?auto_396297 ) ) ( not ( = ?auto_396294 ?auto_396298 ) ) ( not ( = ?auto_396294 ?auto_396299 ) ) ( not ( = ?auto_396294 ?auto_396300 ) ) ( not ( = ?auto_396294 ?auto_396301 ) ) ( not ( = ?auto_396294 ?auto_396302 ) ) ( not ( = ?auto_396294 ?auto_396303 ) ) ( not ( = ?auto_396294 ?auto_396304 ) ) ( not ( = ?auto_396294 ?auto_396305 ) ) ( not ( = ?auto_396294 ?auto_396306 ) ) ( not ( = ?auto_396294 ?auto_396307 ) ) ( not ( = ?auto_396295 ?auto_396296 ) ) ( not ( = ?auto_396295 ?auto_396297 ) ) ( not ( = ?auto_396295 ?auto_396298 ) ) ( not ( = ?auto_396295 ?auto_396299 ) ) ( not ( = ?auto_396295 ?auto_396300 ) ) ( not ( = ?auto_396295 ?auto_396301 ) ) ( not ( = ?auto_396295 ?auto_396302 ) ) ( not ( = ?auto_396295 ?auto_396303 ) ) ( not ( = ?auto_396295 ?auto_396304 ) ) ( not ( = ?auto_396295 ?auto_396305 ) ) ( not ( = ?auto_396295 ?auto_396306 ) ) ( not ( = ?auto_396295 ?auto_396307 ) ) ( not ( = ?auto_396296 ?auto_396297 ) ) ( not ( = ?auto_396296 ?auto_396298 ) ) ( not ( = ?auto_396296 ?auto_396299 ) ) ( not ( = ?auto_396296 ?auto_396300 ) ) ( not ( = ?auto_396296 ?auto_396301 ) ) ( not ( = ?auto_396296 ?auto_396302 ) ) ( not ( = ?auto_396296 ?auto_396303 ) ) ( not ( = ?auto_396296 ?auto_396304 ) ) ( not ( = ?auto_396296 ?auto_396305 ) ) ( not ( = ?auto_396296 ?auto_396306 ) ) ( not ( = ?auto_396296 ?auto_396307 ) ) ( not ( = ?auto_396297 ?auto_396298 ) ) ( not ( = ?auto_396297 ?auto_396299 ) ) ( not ( = ?auto_396297 ?auto_396300 ) ) ( not ( = ?auto_396297 ?auto_396301 ) ) ( not ( = ?auto_396297 ?auto_396302 ) ) ( not ( = ?auto_396297 ?auto_396303 ) ) ( not ( = ?auto_396297 ?auto_396304 ) ) ( not ( = ?auto_396297 ?auto_396305 ) ) ( not ( = ?auto_396297 ?auto_396306 ) ) ( not ( = ?auto_396297 ?auto_396307 ) ) ( not ( = ?auto_396298 ?auto_396299 ) ) ( not ( = ?auto_396298 ?auto_396300 ) ) ( not ( = ?auto_396298 ?auto_396301 ) ) ( not ( = ?auto_396298 ?auto_396302 ) ) ( not ( = ?auto_396298 ?auto_396303 ) ) ( not ( = ?auto_396298 ?auto_396304 ) ) ( not ( = ?auto_396298 ?auto_396305 ) ) ( not ( = ?auto_396298 ?auto_396306 ) ) ( not ( = ?auto_396298 ?auto_396307 ) ) ( not ( = ?auto_396299 ?auto_396300 ) ) ( not ( = ?auto_396299 ?auto_396301 ) ) ( not ( = ?auto_396299 ?auto_396302 ) ) ( not ( = ?auto_396299 ?auto_396303 ) ) ( not ( = ?auto_396299 ?auto_396304 ) ) ( not ( = ?auto_396299 ?auto_396305 ) ) ( not ( = ?auto_396299 ?auto_396306 ) ) ( not ( = ?auto_396299 ?auto_396307 ) ) ( not ( = ?auto_396300 ?auto_396301 ) ) ( not ( = ?auto_396300 ?auto_396302 ) ) ( not ( = ?auto_396300 ?auto_396303 ) ) ( not ( = ?auto_396300 ?auto_396304 ) ) ( not ( = ?auto_396300 ?auto_396305 ) ) ( not ( = ?auto_396300 ?auto_396306 ) ) ( not ( = ?auto_396300 ?auto_396307 ) ) ( not ( = ?auto_396301 ?auto_396302 ) ) ( not ( = ?auto_396301 ?auto_396303 ) ) ( not ( = ?auto_396301 ?auto_396304 ) ) ( not ( = ?auto_396301 ?auto_396305 ) ) ( not ( = ?auto_396301 ?auto_396306 ) ) ( not ( = ?auto_396301 ?auto_396307 ) ) ( not ( = ?auto_396302 ?auto_396303 ) ) ( not ( = ?auto_396302 ?auto_396304 ) ) ( not ( = ?auto_396302 ?auto_396305 ) ) ( not ( = ?auto_396302 ?auto_396306 ) ) ( not ( = ?auto_396302 ?auto_396307 ) ) ( not ( = ?auto_396303 ?auto_396304 ) ) ( not ( = ?auto_396303 ?auto_396305 ) ) ( not ( = ?auto_396303 ?auto_396306 ) ) ( not ( = ?auto_396303 ?auto_396307 ) ) ( not ( = ?auto_396304 ?auto_396305 ) ) ( not ( = ?auto_396304 ?auto_396306 ) ) ( not ( = ?auto_396304 ?auto_396307 ) ) ( not ( = ?auto_396305 ?auto_396306 ) ) ( not ( = ?auto_396305 ?auto_396307 ) ) ( not ( = ?auto_396306 ?auto_396307 ) ) ( CLEAR ?auto_396305 ) ( ON ?auto_396306 ?auto_396307 ) ( CLEAR ?auto_396306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_396293 ?auto_396294 ?auto_396295 ?auto_396296 ?auto_396297 ?auto_396298 ?auto_396299 ?auto_396300 ?auto_396301 ?auto_396302 ?auto_396303 ?auto_396304 ?auto_396305 ?auto_396306 )
      ( MAKE-15PILE ?auto_396293 ?auto_396294 ?auto_396295 ?auto_396296 ?auto_396297 ?auto_396298 ?auto_396299 ?auto_396300 ?auto_396301 ?auto_396302 ?auto_396303 ?auto_396304 ?auto_396305 ?auto_396306 ?auto_396307 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396323 - BLOCK
      ?auto_396324 - BLOCK
      ?auto_396325 - BLOCK
      ?auto_396326 - BLOCK
      ?auto_396327 - BLOCK
      ?auto_396328 - BLOCK
      ?auto_396329 - BLOCK
      ?auto_396330 - BLOCK
      ?auto_396331 - BLOCK
      ?auto_396332 - BLOCK
      ?auto_396333 - BLOCK
      ?auto_396334 - BLOCK
      ?auto_396335 - BLOCK
      ?auto_396336 - BLOCK
      ?auto_396337 - BLOCK
    )
    :vars
    (
      ?auto_396338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396337 ?auto_396338 ) ( ON-TABLE ?auto_396323 ) ( ON ?auto_396324 ?auto_396323 ) ( ON ?auto_396325 ?auto_396324 ) ( ON ?auto_396326 ?auto_396325 ) ( ON ?auto_396327 ?auto_396326 ) ( ON ?auto_396328 ?auto_396327 ) ( ON ?auto_396329 ?auto_396328 ) ( ON ?auto_396330 ?auto_396329 ) ( ON ?auto_396331 ?auto_396330 ) ( ON ?auto_396332 ?auto_396331 ) ( ON ?auto_396333 ?auto_396332 ) ( ON ?auto_396334 ?auto_396333 ) ( not ( = ?auto_396323 ?auto_396324 ) ) ( not ( = ?auto_396323 ?auto_396325 ) ) ( not ( = ?auto_396323 ?auto_396326 ) ) ( not ( = ?auto_396323 ?auto_396327 ) ) ( not ( = ?auto_396323 ?auto_396328 ) ) ( not ( = ?auto_396323 ?auto_396329 ) ) ( not ( = ?auto_396323 ?auto_396330 ) ) ( not ( = ?auto_396323 ?auto_396331 ) ) ( not ( = ?auto_396323 ?auto_396332 ) ) ( not ( = ?auto_396323 ?auto_396333 ) ) ( not ( = ?auto_396323 ?auto_396334 ) ) ( not ( = ?auto_396323 ?auto_396335 ) ) ( not ( = ?auto_396323 ?auto_396336 ) ) ( not ( = ?auto_396323 ?auto_396337 ) ) ( not ( = ?auto_396323 ?auto_396338 ) ) ( not ( = ?auto_396324 ?auto_396325 ) ) ( not ( = ?auto_396324 ?auto_396326 ) ) ( not ( = ?auto_396324 ?auto_396327 ) ) ( not ( = ?auto_396324 ?auto_396328 ) ) ( not ( = ?auto_396324 ?auto_396329 ) ) ( not ( = ?auto_396324 ?auto_396330 ) ) ( not ( = ?auto_396324 ?auto_396331 ) ) ( not ( = ?auto_396324 ?auto_396332 ) ) ( not ( = ?auto_396324 ?auto_396333 ) ) ( not ( = ?auto_396324 ?auto_396334 ) ) ( not ( = ?auto_396324 ?auto_396335 ) ) ( not ( = ?auto_396324 ?auto_396336 ) ) ( not ( = ?auto_396324 ?auto_396337 ) ) ( not ( = ?auto_396324 ?auto_396338 ) ) ( not ( = ?auto_396325 ?auto_396326 ) ) ( not ( = ?auto_396325 ?auto_396327 ) ) ( not ( = ?auto_396325 ?auto_396328 ) ) ( not ( = ?auto_396325 ?auto_396329 ) ) ( not ( = ?auto_396325 ?auto_396330 ) ) ( not ( = ?auto_396325 ?auto_396331 ) ) ( not ( = ?auto_396325 ?auto_396332 ) ) ( not ( = ?auto_396325 ?auto_396333 ) ) ( not ( = ?auto_396325 ?auto_396334 ) ) ( not ( = ?auto_396325 ?auto_396335 ) ) ( not ( = ?auto_396325 ?auto_396336 ) ) ( not ( = ?auto_396325 ?auto_396337 ) ) ( not ( = ?auto_396325 ?auto_396338 ) ) ( not ( = ?auto_396326 ?auto_396327 ) ) ( not ( = ?auto_396326 ?auto_396328 ) ) ( not ( = ?auto_396326 ?auto_396329 ) ) ( not ( = ?auto_396326 ?auto_396330 ) ) ( not ( = ?auto_396326 ?auto_396331 ) ) ( not ( = ?auto_396326 ?auto_396332 ) ) ( not ( = ?auto_396326 ?auto_396333 ) ) ( not ( = ?auto_396326 ?auto_396334 ) ) ( not ( = ?auto_396326 ?auto_396335 ) ) ( not ( = ?auto_396326 ?auto_396336 ) ) ( not ( = ?auto_396326 ?auto_396337 ) ) ( not ( = ?auto_396326 ?auto_396338 ) ) ( not ( = ?auto_396327 ?auto_396328 ) ) ( not ( = ?auto_396327 ?auto_396329 ) ) ( not ( = ?auto_396327 ?auto_396330 ) ) ( not ( = ?auto_396327 ?auto_396331 ) ) ( not ( = ?auto_396327 ?auto_396332 ) ) ( not ( = ?auto_396327 ?auto_396333 ) ) ( not ( = ?auto_396327 ?auto_396334 ) ) ( not ( = ?auto_396327 ?auto_396335 ) ) ( not ( = ?auto_396327 ?auto_396336 ) ) ( not ( = ?auto_396327 ?auto_396337 ) ) ( not ( = ?auto_396327 ?auto_396338 ) ) ( not ( = ?auto_396328 ?auto_396329 ) ) ( not ( = ?auto_396328 ?auto_396330 ) ) ( not ( = ?auto_396328 ?auto_396331 ) ) ( not ( = ?auto_396328 ?auto_396332 ) ) ( not ( = ?auto_396328 ?auto_396333 ) ) ( not ( = ?auto_396328 ?auto_396334 ) ) ( not ( = ?auto_396328 ?auto_396335 ) ) ( not ( = ?auto_396328 ?auto_396336 ) ) ( not ( = ?auto_396328 ?auto_396337 ) ) ( not ( = ?auto_396328 ?auto_396338 ) ) ( not ( = ?auto_396329 ?auto_396330 ) ) ( not ( = ?auto_396329 ?auto_396331 ) ) ( not ( = ?auto_396329 ?auto_396332 ) ) ( not ( = ?auto_396329 ?auto_396333 ) ) ( not ( = ?auto_396329 ?auto_396334 ) ) ( not ( = ?auto_396329 ?auto_396335 ) ) ( not ( = ?auto_396329 ?auto_396336 ) ) ( not ( = ?auto_396329 ?auto_396337 ) ) ( not ( = ?auto_396329 ?auto_396338 ) ) ( not ( = ?auto_396330 ?auto_396331 ) ) ( not ( = ?auto_396330 ?auto_396332 ) ) ( not ( = ?auto_396330 ?auto_396333 ) ) ( not ( = ?auto_396330 ?auto_396334 ) ) ( not ( = ?auto_396330 ?auto_396335 ) ) ( not ( = ?auto_396330 ?auto_396336 ) ) ( not ( = ?auto_396330 ?auto_396337 ) ) ( not ( = ?auto_396330 ?auto_396338 ) ) ( not ( = ?auto_396331 ?auto_396332 ) ) ( not ( = ?auto_396331 ?auto_396333 ) ) ( not ( = ?auto_396331 ?auto_396334 ) ) ( not ( = ?auto_396331 ?auto_396335 ) ) ( not ( = ?auto_396331 ?auto_396336 ) ) ( not ( = ?auto_396331 ?auto_396337 ) ) ( not ( = ?auto_396331 ?auto_396338 ) ) ( not ( = ?auto_396332 ?auto_396333 ) ) ( not ( = ?auto_396332 ?auto_396334 ) ) ( not ( = ?auto_396332 ?auto_396335 ) ) ( not ( = ?auto_396332 ?auto_396336 ) ) ( not ( = ?auto_396332 ?auto_396337 ) ) ( not ( = ?auto_396332 ?auto_396338 ) ) ( not ( = ?auto_396333 ?auto_396334 ) ) ( not ( = ?auto_396333 ?auto_396335 ) ) ( not ( = ?auto_396333 ?auto_396336 ) ) ( not ( = ?auto_396333 ?auto_396337 ) ) ( not ( = ?auto_396333 ?auto_396338 ) ) ( not ( = ?auto_396334 ?auto_396335 ) ) ( not ( = ?auto_396334 ?auto_396336 ) ) ( not ( = ?auto_396334 ?auto_396337 ) ) ( not ( = ?auto_396334 ?auto_396338 ) ) ( not ( = ?auto_396335 ?auto_396336 ) ) ( not ( = ?auto_396335 ?auto_396337 ) ) ( not ( = ?auto_396335 ?auto_396338 ) ) ( not ( = ?auto_396336 ?auto_396337 ) ) ( not ( = ?auto_396336 ?auto_396338 ) ) ( not ( = ?auto_396337 ?auto_396338 ) ) ( ON ?auto_396336 ?auto_396337 ) ( CLEAR ?auto_396334 ) ( ON ?auto_396335 ?auto_396336 ) ( CLEAR ?auto_396335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_396323 ?auto_396324 ?auto_396325 ?auto_396326 ?auto_396327 ?auto_396328 ?auto_396329 ?auto_396330 ?auto_396331 ?auto_396332 ?auto_396333 ?auto_396334 ?auto_396335 )
      ( MAKE-15PILE ?auto_396323 ?auto_396324 ?auto_396325 ?auto_396326 ?auto_396327 ?auto_396328 ?auto_396329 ?auto_396330 ?auto_396331 ?auto_396332 ?auto_396333 ?auto_396334 ?auto_396335 ?auto_396336 ?auto_396337 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396354 - BLOCK
      ?auto_396355 - BLOCK
      ?auto_396356 - BLOCK
      ?auto_396357 - BLOCK
      ?auto_396358 - BLOCK
      ?auto_396359 - BLOCK
      ?auto_396360 - BLOCK
      ?auto_396361 - BLOCK
      ?auto_396362 - BLOCK
      ?auto_396363 - BLOCK
      ?auto_396364 - BLOCK
      ?auto_396365 - BLOCK
      ?auto_396366 - BLOCK
      ?auto_396367 - BLOCK
      ?auto_396368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396368 ) ( ON-TABLE ?auto_396354 ) ( ON ?auto_396355 ?auto_396354 ) ( ON ?auto_396356 ?auto_396355 ) ( ON ?auto_396357 ?auto_396356 ) ( ON ?auto_396358 ?auto_396357 ) ( ON ?auto_396359 ?auto_396358 ) ( ON ?auto_396360 ?auto_396359 ) ( ON ?auto_396361 ?auto_396360 ) ( ON ?auto_396362 ?auto_396361 ) ( ON ?auto_396363 ?auto_396362 ) ( ON ?auto_396364 ?auto_396363 ) ( ON ?auto_396365 ?auto_396364 ) ( not ( = ?auto_396354 ?auto_396355 ) ) ( not ( = ?auto_396354 ?auto_396356 ) ) ( not ( = ?auto_396354 ?auto_396357 ) ) ( not ( = ?auto_396354 ?auto_396358 ) ) ( not ( = ?auto_396354 ?auto_396359 ) ) ( not ( = ?auto_396354 ?auto_396360 ) ) ( not ( = ?auto_396354 ?auto_396361 ) ) ( not ( = ?auto_396354 ?auto_396362 ) ) ( not ( = ?auto_396354 ?auto_396363 ) ) ( not ( = ?auto_396354 ?auto_396364 ) ) ( not ( = ?auto_396354 ?auto_396365 ) ) ( not ( = ?auto_396354 ?auto_396366 ) ) ( not ( = ?auto_396354 ?auto_396367 ) ) ( not ( = ?auto_396354 ?auto_396368 ) ) ( not ( = ?auto_396355 ?auto_396356 ) ) ( not ( = ?auto_396355 ?auto_396357 ) ) ( not ( = ?auto_396355 ?auto_396358 ) ) ( not ( = ?auto_396355 ?auto_396359 ) ) ( not ( = ?auto_396355 ?auto_396360 ) ) ( not ( = ?auto_396355 ?auto_396361 ) ) ( not ( = ?auto_396355 ?auto_396362 ) ) ( not ( = ?auto_396355 ?auto_396363 ) ) ( not ( = ?auto_396355 ?auto_396364 ) ) ( not ( = ?auto_396355 ?auto_396365 ) ) ( not ( = ?auto_396355 ?auto_396366 ) ) ( not ( = ?auto_396355 ?auto_396367 ) ) ( not ( = ?auto_396355 ?auto_396368 ) ) ( not ( = ?auto_396356 ?auto_396357 ) ) ( not ( = ?auto_396356 ?auto_396358 ) ) ( not ( = ?auto_396356 ?auto_396359 ) ) ( not ( = ?auto_396356 ?auto_396360 ) ) ( not ( = ?auto_396356 ?auto_396361 ) ) ( not ( = ?auto_396356 ?auto_396362 ) ) ( not ( = ?auto_396356 ?auto_396363 ) ) ( not ( = ?auto_396356 ?auto_396364 ) ) ( not ( = ?auto_396356 ?auto_396365 ) ) ( not ( = ?auto_396356 ?auto_396366 ) ) ( not ( = ?auto_396356 ?auto_396367 ) ) ( not ( = ?auto_396356 ?auto_396368 ) ) ( not ( = ?auto_396357 ?auto_396358 ) ) ( not ( = ?auto_396357 ?auto_396359 ) ) ( not ( = ?auto_396357 ?auto_396360 ) ) ( not ( = ?auto_396357 ?auto_396361 ) ) ( not ( = ?auto_396357 ?auto_396362 ) ) ( not ( = ?auto_396357 ?auto_396363 ) ) ( not ( = ?auto_396357 ?auto_396364 ) ) ( not ( = ?auto_396357 ?auto_396365 ) ) ( not ( = ?auto_396357 ?auto_396366 ) ) ( not ( = ?auto_396357 ?auto_396367 ) ) ( not ( = ?auto_396357 ?auto_396368 ) ) ( not ( = ?auto_396358 ?auto_396359 ) ) ( not ( = ?auto_396358 ?auto_396360 ) ) ( not ( = ?auto_396358 ?auto_396361 ) ) ( not ( = ?auto_396358 ?auto_396362 ) ) ( not ( = ?auto_396358 ?auto_396363 ) ) ( not ( = ?auto_396358 ?auto_396364 ) ) ( not ( = ?auto_396358 ?auto_396365 ) ) ( not ( = ?auto_396358 ?auto_396366 ) ) ( not ( = ?auto_396358 ?auto_396367 ) ) ( not ( = ?auto_396358 ?auto_396368 ) ) ( not ( = ?auto_396359 ?auto_396360 ) ) ( not ( = ?auto_396359 ?auto_396361 ) ) ( not ( = ?auto_396359 ?auto_396362 ) ) ( not ( = ?auto_396359 ?auto_396363 ) ) ( not ( = ?auto_396359 ?auto_396364 ) ) ( not ( = ?auto_396359 ?auto_396365 ) ) ( not ( = ?auto_396359 ?auto_396366 ) ) ( not ( = ?auto_396359 ?auto_396367 ) ) ( not ( = ?auto_396359 ?auto_396368 ) ) ( not ( = ?auto_396360 ?auto_396361 ) ) ( not ( = ?auto_396360 ?auto_396362 ) ) ( not ( = ?auto_396360 ?auto_396363 ) ) ( not ( = ?auto_396360 ?auto_396364 ) ) ( not ( = ?auto_396360 ?auto_396365 ) ) ( not ( = ?auto_396360 ?auto_396366 ) ) ( not ( = ?auto_396360 ?auto_396367 ) ) ( not ( = ?auto_396360 ?auto_396368 ) ) ( not ( = ?auto_396361 ?auto_396362 ) ) ( not ( = ?auto_396361 ?auto_396363 ) ) ( not ( = ?auto_396361 ?auto_396364 ) ) ( not ( = ?auto_396361 ?auto_396365 ) ) ( not ( = ?auto_396361 ?auto_396366 ) ) ( not ( = ?auto_396361 ?auto_396367 ) ) ( not ( = ?auto_396361 ?auto_396368 ) ) ( not ( = ?auto_396362 ?auto_396363 ) ) ( not ( = ?auto_396362 ?auto_396364 ) ) ( not ( = ?auto_396362 ?auto_396365 ) ) ( not ( = ?auto_396362 ?auto_396366 ) ) ( not ( = ?auto_396362 ?auto_396367 ) ) ( not ( = ?auto_396362 ?auto_396368 ) ) ( not ( = ?auto_396363 ?auto_396364 ) ) ( not ( = ?auto_396363 ?auto_396365 ) ) ( not ( = ?auto_396363 ?auto_396366 ) ) ( not ( = ?auto_396363 ?auto_396367 ) ) ( not ( = ?auto_396363 ?auto_396368 ) ) ( not ( = ?auto_396364 ?auto_396365 ) ) ( not ( = ?auto_396364 ?auto_396366 ) ) ( not ( = ?auto_396364 ?auto_396367 ) ) ( not ( = ?auto_396364 ?auto_396368 ) ) ( not ( = ?auto_396365 ?auto_396366 ) ) ( not ( = ?auto_396365 ?auto_396367 ) ) ( not ( = ?auto_396365 ?auto_396368 ) ) ( not ( = ?auto_396366 ?auto_396367 ) ) ( not ( = ?auto_396366 ?auto_396368 ) ) ( not ( = ?auto_396367 ?auto_396368 ) ) ( ON ?auto_396367 ?auto_396368 ) ( CLEAR ?auto_396365 ) ( ON ?auto_396366 ?auto_396367 ) ( CLEAR ?auto_396366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_396354 ?auto_396355 ?auto_396356 ?auto_396357 ?auto_396358 ?auto_396359 ?auto_396360 ?auto_396361 ?auto_396362 ?auto_396363 ?auto_396364 ?auto_396365 ?auto_396366 )
      ( MAKE-15PILE ?auto_396354 ?auto_396355 ?auto_396356 ?auto_396357 ?auto_396358 ?auto_396359 ?auto_396360 ?auto_396361 ?auto_396362 ?auto_396363 ?auto_396364 ?auto_396365 ?auto_396366 ?auto_396367 ?auto_396368 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396384 - BLOCK
      ?auto_396385 - BLOCK
      ?auto_396386 - BLOCK
      ?auto_396387 - BLOCK
      ?auto_396388 - BLOCK
      ?auto_396389 - BLOCK
      ?auto_396390 - BLOCK
      ?auto_396391 - BLOCK
      ?auto_396392 - BLOCK
      ?auto_396393 - BLOCK
      ?auto_396394 - BLOCK
      ?auto_396395 - BLOCK
      ?auto_396396 - BLOCK
      ?auto_396397 - BLOCK
      ?auto_396398 - BLOCK
    )
    :vars
    (
      ?auto_396399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396398 ?auto_396399 ) ( ON-TABLE ?auto_396384 ) ( ON ?auto_396385 ?auto_396384 ) ( ON ?auto_396386 ?auto_396385 ) ( ON ?auto_396387 ?auto_396386 ) ( ON ?auto_396388 ?auto_396387 ) ( ON ?auto_396389 ?auto_396388 ) ( ON ?auto_396390 ?auto_396389 ) ( ON ?auto_396391 ?auto_396390 ) ( ON ?auto_396392 ?auto_396391 ) ( ON ?auto_396393 ?auto_396392 ) ( ON ?auto_396394 ?auto_396393 ) ( not ( = ?auto_396384 ?auto_396385 ) ) ( not ( = ?auto_396384 ?auto_396386 ) ) ( not ( = ?auto_396384 ?auto_396387 ) ) ( not ( = ?auto_396384 ?auto_396388 ) ) ( not ( = ?auto_396384 ?auto_396389 ) ) ( not ( = ?auto_396384 ?auto_396390 ) ) ( not ( = ?auto_396384 ?auto_396391 ) ) ( not ( = ?auto_396384 ?auto_396392 ) ) ( not ( = ?auto_396384 ?auto_396393 ) ) ( not ( = ?auto_396384 ?auto_396394 ) ) ( not ( = ?auto_396384 ?auto_396395 ) ) ( not ( = ?auto_396384 ?auto_396396 ) ) ( not ( = ?auto_396384 ?auto_396397 ) ) ( not ( = ?auto_396384 ?auto_396398 ) ) ( not ( = ?auto_396384 ?auto_396399 ) ) ( not ( = ?auto_396385 ?auto_396386 ) ) ( not ( = ?auto_396385 ?auto_396387 ) ) ( not ( = ?auto_396385 ?auto_396388 ) ) ( not ( = ?auto_396385 ?auto_396389 ) ) ( not ( = ?auto_396385 ?auto_396390 ) ) ( not ( = ?auto_396385 ?auto_396391 ) ) ( not ( = ?auto_396385 ?auto_396392 ) ) ( not ( = ?auto_396385 ?auto_396393 ) ) ( not ( = ?auto_396385 ?auto_396394 ) ) ( not ( = ?auto_396385 ?auto_396395 ) ) ( not ( = ?auto_396385 ?auto_396396 ) ) ( not ( = ?auto_396385 ?auto_396397 ) ) ( not ( = ?auto_396385 ?auto_396398 ) ) ( not ( = ?auto_396385 ?auto_396399 ) ) ( not ( = ?auto_396386 ?auto_396387 ) ) ( not ( = ?auto_396386 ?auto_396388 ) ) ( not ( = ?auto_396386 ?auto_396389 ) ) ( not ( = ?auto_396386 ?auto_396390 ) ) ( not ( = ?auto_396386 ?auto_396391 ) ) ( not ( = ?auto_396386 ?auto_396392 ) ) ( not ( = ?auto_396386 ?auto_396393 ) ) ( not ( = ?auto_396386 ?auto_396394 ) ) ( not ( = ?auto_396386 ?auto_396395 ) ) ( not ( = ?auto_396386 ?auto_396396 ) ) ( not ( = ?auto_396386 ?auto_396397 ) ) ( not ( = ?auto_396386 ?auto_396398 ) ) ( not ( = ?auto_396386 ?auto_396399 ) ) ( not ( = ?auto_396387 ?auto_396388 ) ) ( not ( = ?auto_396387 ?auto_396389 ) ) ( not ( = ?auto_396387 ?auto_396390 ) ) ( not ( = ?auto_396387 ?auto_396391 ) ) ( not ( = ?auto_396387 ?auto_396392 ) ) ( not ( = ?auto_396387 ?auto_396393 ) ) ( not ( = ?auto_396387 ?auto_396394 ) ) ( not ( = ?auto_396387 ?auto_396395 ) ) ( not ( = ?auto_396387 ?auto_396396 ) ) ( not ( = ?auto_396387 ?auto_396397 ) ) ( not ( = ?auto_396387 ?auto_396398 ) ) ( not ( = ?auto_396387 ?auto_396399 ) ) ( not ( = ?auto_396388 ?auto_396389 ) ) ( not ( = ?auto_396388 ?auto_396390 ) ) ( not ( = ?auto_396388 ?auto_396391 ) ) ( not ( = ?auto_396388 ?auto_396392 ) ) ( not ( = ?auto_396388 ?auto_396393 ) ) ( not ( = ?auto_396388 ?auto_396394 ) ) ( not ( = ?auto_396388 ?auto_396395 ) ) ( not ( = ?auto_396388 ?auto_396396 ) ) ( not ( = ?auto_396388 ?auto_396397 ) ) ( not ( = ?auto_396388 ?auto_396398 ) ) ( not ( = ?auto_396388 ?auto_396399 ) ) ( not ( = ?auto_396389 ?auto_396390 ) ) ( not ( = ?auto_396389 ?auto_396391 ) ) ( not ( = ?auto_396389 ?auto_396392 ) ) ( not ( = ?auto_396389 ?auto_396393 ) ) ( not ( = ?auto_396389 ?auto_396394 ) ) ( not ( = ?auto_396389 ?auto_396395 ) ) ( not ( = ?auto_396389 ?auto_396396 ) ) ( not ( = ?auto_396389 ?auto_396397 ) ) ( not ( = ?auto_396389 ?auto_396398 ) ) ( not ( = ?auto_396389 ?auto_396399 ) ) ( not ( = ?auto_396390 ?auto_396391 ) ) ( not ( = ?auto_396390 ?auto_396392 ) ) ( not ( = ?auto_396390 ?auto_396393 ) ) ( not ( = ?auto_396390 ?auto_396394 ) ) ( not ( = ?auto_396390 ?auto_396395 ) ) ( not ( = ?auto_396390 ?auto_396396 ) ) ( not ( = ?auto_396390 ?auto_396397 ) ) ( not ( = ?auto_396390 ?auto_396398 ) ) ( not ( = ?auto_396390 ?auto_396399 ) ) ( not ( = ?auto_396391 ?auto_396392 ) ) ( not ( = ?auto_396391 ?auto_396393 ) ) ( not ( = ?auto_396391 ?auto_396394 ) ) ( not ( = ?auto_396391 ?auto_396395 ) ) ( not ( = ?auto_396391 ?auto_396396 ) ) ( not ( = ?auto_396391 ?auto_396397 ) ) ( not ( = ?auto_396391 ?auto_396398 ) ) ( not ( = ?auto_396391 ?auto_396399 ) ) ( not ( = ?auto_396392 ?auto_396393 ) ) ( not ( = ?auto_396392 ?auto_396394 ) ) ( not ( = ?auto_396392 ?auto_396395 ) ) ( not ( = ?auto_396392 ?auto_396396 ) ) ( not ( = ?auto_396392 ?auto_396397 ) ) ( not ( = ?auto_396392 ?auto_396398 ) ) ( not ( = ?auto_396392 ?auto_396399 ) ) ( not ( = ?auto_396393 ?auto_396394 ) ) ( not ( = ?auto_396393 ?auto_396395 ) ) ( not ( = ?auto_396393 ?auto_396396 ) ) ( not ( = ?auto_396393 ?auto_396397 ) ) ( not ( = ?auto_396393 ?auto_396398 ) ) ( not ( = ?auto_396393 ?auto_396399 ) ) ( not ( = ?auto_396394 ?auto_396395 ) ) ( not ( = ?auto_396394 ?auto_396396 ) ) ( not ( = ?auto_396394 ?auto_396397 ) ) ( not ( = ?auto_396394 ?auto_396398 ) ) ( not ( = ?auto_396394 ?auto_396399 ) ) ( not ( = ?auto_396395 ?auto_396396 ) ) ( not ( = ?auto_396395 ?auto_396397 ) ) ( not ( = ?auto_396395 ?auto_396398 ) ) ( not ( = ?auto_396395 ?auto_396399 ) ) ( not ( = ?auto_396396 ?auto_396397 ) ) ( not ( = ?auto_396396 ?auto_396398 ) ) ( not ( = ?auto_396396 ?auto_396399 ) ) ( not ( = ?auto_396397 ?auto_396398 ) ) ( not ( = ?auto_396397 ?auto_396399 ) ) ( not ( = ?auto_396398 ?auto_396399 ) ) ( ON ?auto_396397 ?auto_396398 ) ( ON ?auto_396396 ?auto_396397 ) ( CLEAR ?auto_396394 ) ( ON ?auto_396395 ?auto_396396 ) ( CLEAR ?auto_396395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_396384 ?auto_396385 ?auto_396386 ?auto_396387 ?auto_396388 ?auto_396389 ?auto_396390 ?auto_396391 ?auto_396392 ?auto_396393 ?auto_396394 ?auto_396395 )
      ( MAKE-15PILE ?auto_396384 ?auto_396385 ?auto_396386 ?auto_396387 ?auto_396388 ?auto_396389 ?auto_396390 ?auto_396391 ?auto_396392 ?auto_396393 ?auto_396394 ?auto_396395 ?auto_396396 ?auto_396397 ?auto_396398 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396415 - BLOCK
      ?auto_396416 - BLOCK
      ?auto_396417 - BLOCK
      ?auto_396418 - BLOCK
      ?auto_396419 - BLOCK
      ?auto_396420 - BLOCK
      ?auto_396421 - BLOCK
      ?auto_396422 - BLOCK
      ?auto_396423 - BLOCK
      ?auto_396424 - BLOCK
      ?auto_396425 - BLOCK
      ?auto_396426 - BLOCK
      ?auto_396427 - BLOCK
      ?auto_396428 - BLOCK
      ?auto_396429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396429 ) ( ON-TABLE ?auto_396415 ) ( ON ?auto_396416 ?auto_396415 ) ( ON ?auto_396417 ?auto_396416 ) ( ON ?auto_396418 ?auto_396417 ) ( ON ?auto_396419 ?auto_396418 ) ( ON ?auto_396420 ?auto_396419 ) ( ON ?auto_396421 ?auto_396420 ) ( ON ?auto_396422 ?auto_396421 ) ( ON ?auto_396423 ?auto_396422 ) ( ON ?auto_396424 ?auto_396423 ) ( ON ?auto_396425 ?auto_396424 ) ( not ( = ?auto_396415 ?auto_396416 ) ) ( not ( = ?auto_396415 ?auto_396417 ) ) ( not ( = ?auto_396415 ?auto_396418 ) ) ( not ( = ?auto_396415 ?auto_396419 ) ) ( not ( = ?auto_396415 ?auto_396420 ) ) ( not ( = ?auto_396415 ?auto_396421 ) ) ( not ( = ?auto_396415 ?auto_396422 ) ) ( not ( = ?auto_396415 ?auto_396423 ) ) ( not ( = ?auto_396415 ?auto_396424 ) ) ( not ( = ?auto_396415 ?auto_396425 ) ) ( not ( = ?auto_396415 ?auto_396426 ) ) ( not ( = ?auto_396415 ?auto_396427 ) ) ( not ( = ?auto_396415 ?auto_396428 ) ) ( not ( = ?auto_396415 ?auto_396429 ) ) ( not ( = ?auto_396416 ?auto_396417 ) ) ( not ( = ?auto_396416 ?auto_396418 ) ) ( not ( = ?auto_396416 ?auto_396419 ) ) ( not ( = ?auto_396416 ?auto_396420 ) ) ( not ( = ?auto_396416 ?auto_396421 ) ) ( not ( = ?auto_396416 ?auto_396422 ) ) ( not ( = ?auto_396416 ?auto_396423 ) ) ( not ( = ?auto_396416 ?auto_396424 ) ) ( not ( = ?auto_396416 ?auto_396425 ) ) ( not ( = ?auto_396416 ?auto_396426 ) ) ( not ( = ?auto_396416 ?auto_396427 ) ) ( not ( = ?auto_396416 ?auto_396428 ) ) ( not ( = ?auto_396416 ?auto_396429 ) ) ( not ( = ?auto_396417 ?auto_396418 ) ) ( not ( = ?auto_396417 ?auto_396419 ) ) ( not ( = ?auto_396417 ?auto_396420 ) ) ( not ( = ?auto_396417 ?auto_396421 ) ) ( not ( = ?auto_396417 ?auto_396422 ) ) ( not ( = ?auto_396417 ?auto_396423 ) ) ( not ( = ?auto_396417 ?auto_396424 ) ) ( not ( = ?auto_396417 ?auto_396425 ) ) ( not ( = ?auto_396417 ?auto_396426 ) ) ( not ( = ?auto_396417 ?auto_396427 ) ) ( not ( = ?auto_396417 ?auto_396428 ) ) ( not ( = ?auto_396417 ?auto_396429 ) ) ( not ( = ?auto_396418 ?auto_396419 ) ) ( not ( = ?auto_396418 ?auto_396420 ) ) ( not ( = ?auto_396418 ?auto_396421 ) ) ( not ( = ?auto_396418 ?auto_396422 ) ) ( not ( = ?auto_396418 ?auto_396423 ) ) ( not ( = ?auto_396418 ?auto_396424 ) ) ( not ( = ?auto_396418 ?auto_396425 ) ) ( not ( = ?auto_396418 ?auto_396426 ) ) ( not ( = ?auto_396418 ?auto_396427 ) ) ( not ( = ?auto_396418 ?auto_396428 ) ) ( not ( = ?auto_396418 ?auto_396429 ) ) ( not ( = ?auto_396419 ?auto_396420 ) ) ( not ( = ?auto_396419 ?auto_396421 ) ) ( not ( = ?auto_396419 ?auto_396422 ) ) ( not ( = ?auto_396419 ?auto_396423 ) ) ( not ( = ?auto_396419 ?auto_396424 ) ) ( not ( = ?auto_396419 ?auto_396425 ) ) ( not ( = ?auto_396419 ?auto_396426 ) ) ( not ( = ?auto_396419 ?auto_396427 ) ) ( not ( = ?auto_396419 ?auto_396428 ) ) ( not ( = ?auto_396419 ?auto_396429 ) ) ( not ( = ?auto_396420 ?auto_396421 ) ) ( not ( = ?auto_396420 ?auto_396422 ) ) ( not ( = ?auto_396420 ?auto_396423 ) ) ( not ( = ?auto_396420 ?auto_396424 ) ) ( not ( = ?auto_396420 ?auto_396425 ) ) ( not ( = ?auto_396420 ?auto_396426 ) ) ( not ( = ?auto_396420 ?auto_396427 ) ) ( not ( = ?auto_396420 ?auto_396428 ) ) ( not ( = ?auto_396420 ?auto_396429 ) ) ( not ( = ?auto_396421 ?auto_396422 ) ) ( not ( = ?auto_396421 ?auto_396423 ) ) ( not ( = ?auto_396421 ?auto_396424 ) ) ( not ( = ?auto_396421 ?auto_396425 ) ) ( not ( = ?auto_396421 ?auto_396426 ) ) ( not ( = ?auto_396421 ?auto_396427 ) ) ( not ( = ?auto_396421 ?auto_396428 ) ) ( not ( = ?auto_396421 ?auto_396429 ) ) ( not ( = ?auto_396422 ?auto_396423 ) ) ( not ( = ?auto_396422 ?auto_396424 ) ) ( not ( = ?auto_396422 ?auto_396425 ) ) ( not ( = ?auto_396422 ?auto_396426 ) ) ( not ( = ?auto_396422 ?auto_396427 ) ) ( not ( = ?auto_396422 ?auto_396428 ) ) ( not ( = ?auto_396422 ?auto_396429 ) ) ( not ( = ?auto_396423 ?auto_396424 ) ) ( not ( = ?auto_396423 ?auto_396425 ) ) ( not ( = ?auto_396423 ?auto_396426 ) ) ( not ( = ?auto_396423 ?auto_396427 ) ) ( not ( = ?auto_396423 ?auto_396428 ) ) ( not ( = ?auto_396423 ?auto_396429 ) ) ( not ( = ?auto_396424 ?auto_396425 ) ) ( not ( = ?auto_396424 ?auto_396426 ) ) ( not ( = ?auto_396424 ?auto_396427 ) ) ( not ( = ?auto_396424 ?auto_396428 ) ) ( not ( = ?auto_396424 ?auto_396429 ) ) ( not ( = ?auto_396425 ?auto_396426 ) ) ( not ( = ?auto_396425 ?auto_396427 ) ) ( not ( = ?auto_396425 ?auto_396428 ) ) ( not ( = ?auto_396425 ?auto_396429 ) ) ( not ( = ?auto_396426 ?auto_396427 ) ) ( not ( = ?auto_396426 ?auto_396428 ) ) ( not ( = ?auto_396426 ?auto_396429 ) ) ( not ( = ?auto_396427 ?auto_396428 ) ) ( not ( = ?auto_396427 ?auto_396429 ) ) ( not ( = ?auto_396428 ?auto_396429 ) ) ( ON ?auto_396428 ?auto_396429 ) ( ON ?auto_396427 ?auto_396428 ) ( CLEAR ?auto_396425 ) ( ON ?auto_396426 ?auto_396427 ) ( CLEAR ?auto_396426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_396415 ?auto_396416 ?auto_396417 ?auto_396418 ?auto_396419 ?auto_396420 ?auto_396421 ?auto_396422 ?auto_396423 ?auto_396424 ?auto_396425 ?auto_396426 )
      ( MAKE-15PILE ?auto_396415 ?auto_396416 ?auto_396417 ?auto_396418 ?auto_396419 ?auto_396420 ?auto_396421 ?auto_396422 ?auto_396423 ?auto_396424 ?auto_396425 ?auto_396426 ?auto_396427 ?auto_396428 ?auto_396429 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396445 - BLOCK
      ?auto_396446 - BLOCK
      ?auto_396447 - BLOCK
      ?auto_396448 - BLOCK
      ?auto_396449 - BLOCK
      ?auto_396450 - BLOCK
      ?auto_396451 - BLOCK
      ?auto_396452 - BLOCK
      ?auto_396453 - BLOCK
      ?auto_396454 - BLOCK
      ?auto_396455 - BLOCK
      ?auto_396456 - BLOCK
      ?auto_396457 - BLOCK
      ?auto_396458 - BLOCK
      ?auto_396459 - BLOCK
    )
    :vars
    (
      ?auto_396460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396459 ?auto_396460 ) ( ON-TABLE ?auto_396445 ) ( ON ?auto_396446 ?auto_396445 ) ( ON ?auto_396447 ?auto_396446 ) ( ON ?auto_396448 ?auto_396447 ) ( ON ?auto_396449 ?auto_396448 ) ( ON ?auto_396450 ?auto_396449 ) ( ON ?auto_396451 ?auto_396450 ) ( ON ?auto_396452 ?auto_396451 ) ( ON ?auto_396453 ?auto_396452 ) ( ON ?auto_396454 ?auto_396453 ) ( not ( = ?auto_396445 ?auto_396446 ) ) ( not ( = ?auto_396445 ?auto_396447 ) ) ( not ( = ?auto_396445 ?auto_396448 ) ) ( not ( = ?auto_396445 ?auto_396449 ) ) ( not ( = ?auto_396445 ?auto_396450 ) ) ( not ( = ?auto_396445 ?auto_396451 ) ) ( not ( = ?auto_396445 ?auto_396452 ) ) ( not ( = ?auto_396445 ?auto_396453 ) ) ( not ( = ?auto_396445 ?auto_396454 ) ) ( not ( = ?auto_396445 ?auto_396455 ) ) ( not ( = ?auto_396445 ?auto_396456 ) ) ( not ( = ?auto_396445 ?auto_396457 ) ) ( not ( = ?auto_396445 ?auto_396458 ) ) ( not ( = ?auto_396445 ?auto_396459 ) ) ( not ( = ?auto_396445 ?auto_396460 ) ) ( not ( = ?auto_396446 ?auto_396447 ) ) ( not ( = ?auto_396446 ?auto_396448 ) ) ( not ( = ?auto_396446 ?auto_396449 ) ) ( not ( = ?auto_396446 ?auto_396450 ) ) ( not ( = ?auto_396446 ?auto_396451 ) ) ( not ( = ?auto_396446 ?auto_396452 ) ) ( not ( = ?auto_396446 ?auto_396453 ) ) ( not ( = ?auto_396446 ?auto_396454 ) ) ( not ( = ?auto_396446 ?auto_396455 ) ) ( not ( = ?auto_396446 ?auto_396456 ) ) ( not ( = ?auto_396446 ?auto_396457 ) ) ( not ( = ?auto_396446 ?auto_396458 ) ) ( not ( = ?auto_396446 ?auto_396459 ) ) ( not ( = ?auto_396446 ?auto_396460 ) ) ( not ( = ?auto_396447 ?auto_396448 ) ) ( not ( = ?auto_396447 ?auto_396449 ) ) ( not ( = ?auto_396447 ?auto_396450 ) ) ( not ( = ?auto_396447 ?auto_396451 ) ) ( not ( = ?auto_396447 ?auto_396452 ) ) ( not ( = ?auto_396447 ?auto_396453 ) ) ( not ( = ?auto_396447 ?auto_396454 ) ) ( not ( = ?auto_396447 ?auto_396455 ) ) ( not ( = ?auto_396447 ?auto_396456 ) ) ( not ( = ?auto_396447 ?auto_396457 ) ) ( not ( = ?auto_396447 ?auto_396458 ) ) ( not ( = ?auto_396447 ?auto_396459 ) ) ( not ( = ?auto_396447 ?auto_396460 ) ) ( not ( = ?auto_396448 ?auto_396449 ) ) ( not ( = ?auto_396448 ?auto_396450 ) ) ( not ( = ?auto_396448 ?auto_396451 ) ) ( not ( = ?auto_396448 ?auto_396452 ) ) ( not ( = ?auto_396448 ?auto_396453 ) ) ( not ( = ?auto_396448 ?auto_396454 ) ) ( not ( = ?auto_396448 ?auto_396455 ) ) ( not ( = ?auto_396448 ?auto_396456 ) ) ( not ( = ?auto_396448 ?auto_396457 ) ) ( not ( = ?auto_396448 ?auto_396458 ) ) ( not ( = ?auto_396448 ?auto_396459 ) ) ( not ( = ?auto_396448 ?auto_396460 ) ) ( not ( = ?auto_396449 ?auto_396450 ) ) ( not ( = ?auto_396449 ?auto_396451 ) ) ( not ( = ?auto_396449 ?auto_396452 ) ) ( not ( = ?auto_396449 ?auto_396453 ) ) ( not ( = ?auto_396449 ?auto_396454 ) ) ( not ( = ?auto_396449 ?auto_396455 ) ) ( not ( = ?auto_396449 ?auto_396456 ) ) ( not ( = ?auto_396449 ?auto_396457 ) ) ( not ( = ?auto_396449 ?auto_396458 ) ) ( not ( = ?auto_396449 ?auto_396459 ) ) ( not ( = ?auto_396449 ?auto_396460 ) ) ( not ( = ?auto_396450 ?auto_396451 ) ) ( not ( = ?auto_396450 ?auto_396452 ) ) ( not ( = ?auto_396450 ?auto_396453 ) ) ( not ( = ?auto_396450 ?auto_396454 ) ) ( not ( = ?auto_396450 ?auto_396455 ) ) ( not ( = ?auto_396450 ?auto_396456 ) ) ( not ( = ?auto_396450 ?auto_396457 ) ) ( not ( = ?auto_396450 ?auto_396458 ) ) ( not ( = ?auto_396450 ?auto_396459 ) ) ( not ( = ?auto_396450 ?auto_396460 ) ) ( not ( = ?auto_396451 ?auto_396452 ) ) ( not ( = ?auto_396451 ?auto_396453 ) ) ( not ( = ?auto_396451 ?auto_396454 ) ) ( not ( = ?auto_396451 ?auto_396455 ) ) ( not ( = ?auto_396451 ?auto_396456 ) ) ( not ( = ?auto_396451 ?auto_396457 ) ) ( not ( = ?auto_396451 ?auto_396458 ) ) ( not ( = ?auto_396451 ?auto_396459 ) ) ( not ( = ?auto_396451 ?auto_396460 ) ) ( not ( = ?auto_396452 ?auto_396453 ) ) ( not ( = ?auto_396452 ?auto_396454 ) ) ( not ( = ?auto_396452 ?auto_396455 ) ) ( not ( = ?auto_396452 ?auto_396456 ) ) ( not ( = ?auto_396452 ?auto_396457 ) ) ( not ( = ?auto_396452 ?auto_396458 ) ) ( not ( = ?auto_396452 ?auto_396459 ) ) ( not ( = ?auto_396452 ?auto_396460 ) ) ( not ( = ?auto_396453 ?auto_396454 ) ) ( not ( = ?auto_396453 ?auto_396455 ) ) ( not ( = ?auto_396453 ?auto_396456 ) ) ( not ( = ?auto_396453 ?auto_396457 ) ) ( not ( = ?auto_396453 ?auto_396458 ) ) ( not ( = ?auto_396453 ?auto_396459 ) ) ( not ( = ?auto_396453 ?auto_396460 ) ) ( not ( = ?auto_396454 ?auto_396455 ) ) ( not ( = ?auto_396454 ?auto_396456 ) ) ( not ( = ?auto_396454 ?auto_396457 ) ) ( not ( = ?auto_396454 ?auto_396458 ) ) ( not ( = ?auto_396454 ?auto_396459 ) ) ( not ( = ?auto_396454 ?auto_396460 ) ) ( not ( = ?auto_396455 ?auto_396456 ) ) ( not ( = ?auto_396455 ?auto_396457 ) ) ( not ( = ?auto_396455 ?auto_396458 ) ) ( not ( = ?auto_396455 ?auto_396459 ) ) ( not ( = ?auto_396455 ?auto_396460 ) ) ( not ( = ?auto_396456 ?auto_396457 ) ) ( not ( = ?auto_396456 ?auto_396458 ) ) ( not ( = ?auto_396456 ?auto_396459 ) ) ( not ( = ?auto_396456 ?auto_396460 ) ) ( not ( = ?auto_396457 ?auto_396458 ) ) ( not ( = ?auto_396457 ?auto_396459 ) ) ( not ( = ?auto_396457 ?auto_396460 ) ) ( not ( = ?auto_396458 ?auto_396459 ) ) ( not ( = ?auto_396458 ?auto_396460 ) ) ( not ( = ?auto_396459 ?auto_396460 ) ) ( ON ?auto_396458 ?auto_396459 ) ( ON ?auto_396457 ?auto_396458 ) ( ON ?auto_396456 ?auto_396457 ) ( CLEAR ?auto_396454 ) ( ON ?auto_396455 ?auto_396456 ) ( CLEAR ?auto_396455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_396445 ?auto_396446 ?auto_396447 ?auto_396448 ?auto_396449 ?auto_396450 ?auto_396451 ?auto_396452 ?auto_396453 ?auto_396454 ?auto_396455 )
      ( MAKE-15PILE ?auto_396445 ?auto_396446 ?auto_396447 ?auto_396448 ?auto_396449 ?auto_396450 ?auto_396451 ?auto_396452 ?auto_396453 ?auto_396454 ?auto_396455 ?auto_396456 ?auto_396457 ?auto_396458 ?auto_396459 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396476 - BLOCK
      ?auto_396477 - BLOCK
      ?auto_396478 - BLOCK
      ?auto_396479 - BLOCK
      ?auto_396480 - BLOCK
      ?auto_396481 - BLOCK
      ?auto_396482 - BLOCK
      ?auto_396483 - BLOCK
      ?auto_396484 - BLOCK
      ?auto_396485 - BLOCK
      ?auto_396486 - BLOCK
      ?auto_396487 - BLOCK
      ?auto_396488 - BLOCK
      ?auto_396489 - BLOCK
      ?auto_396490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396490 ) ( ON-TABLE ?auto_396476 ) ( ON ?auto_396477 ?auto_396476 ) ( ON ?auto_396478 ?auto_396477 ) ( ON ?auto_396479 ?auto_396478 ) ( ON ?auto_396480 ?auto_396479 ) ( ON ?auto_396481 ?auto_396480 ) ( ON ?auto_396482 ?auto_396481 ) ( ON ?auto_396483 ?auto_396482 ) ( ON ?auto_396484 ?auto_396483 ) ( ON ?auto_396485 ?auto_396484 ) ( not ( = ?auto_396476 ?auto_396477 ) ) ( not ( = ?auto_396476 ?auto_396478 ) ) ( not ( = ?auto_396476 ?auto_396479 ) ) ( not ( = ?auto_396476 ?auto_396480 ) ) ( not ( = ?auto_396476 ?auto_396481 ) ) ( not ( = ?auto_396476 ?auto_396482 ) ) ( not ( = ?auto_396476 ?auto_396483 ) ) ( not ( = ?auto_396476 ?auto_396484 ) ) ( not ( = ?auto_396476 ?auto_396485 ) ) ( not ( = ?auto_396476 ?auto_396486 ) ) ( not ( = ?auto_396476 ?auto_396487 ) ) ( not ( = ?auto_396476 ?auto_396488 ) ) ( not ( = ?auto_396476 ?auto_396489 ) ) ( not ( = ?auto_396476 ?auto_396490 ) ) ( not ( = ?auto_396477 ?auto_396478 ) ) ( not ( = ?auto_396477 ?auto_396479 ) ) ( not ( = ?auto_396477 ?auto_396480 ) ) ( not ( = ?auto_396477 ?auto_396481 ) ) ( not ( = ?auto_396477 ?auto_396482 ) ) ( not ( = ?auto_396477 ?auto_396483 ) ) ( not ( = ?auto_396477 ?auto_396484 ) ) ( not ( = ?auto_396477 ?auto_396485 ) ) ( not ( = ?auto_396477 ?auto_396486 ) ) ( not ( = ?auto_396477 ?auto_396487 ) ) ( not ( = ?auto_396477 ?auto_396488 ) ) ( not ( = ?auto_396477 ?auto_396489 ) ) ( not ( = ?auto_396477 ?auto_396490 ) ) ( not ( = ?auto_396478 ?auto_396479 ) ) ( not ( = ?auto_396478 ?auto_396480 ) ) ( not ( = ?auto_396478 ?auto_396481 ) ) ( not ( = ?auto_396478 ?auto_396482 ) ) ( not ( = ?auto_396478 ?auto_396483 ) ) ( not ( = ?auto_396478 ?auto_396484 ) ) ( not ( = ?auto_396478 ?auto_396485 ) ) ( not ( = ?auto_396478 ?auto_396486 ) ) ( not ( = ?auto_396478 ?auto_396487 ) ) ( not ( = ?auto_396478 ?auto_396488 ) ) ( not ( = ?auto_396478 ?auto_396489 ) ) ( not ( = ?auto_396478 ?auto_396490 ) ) ( not ( = ?auto_396479 ?auto_396480 ) ) ( not ( = ?auto_396479 ?auto_396481 ) ) ( not ( = ?auto_396479 ?auto_396482 ) ) ( not ( = ?auto_396479 ?auto_396483 ) ) ( not ( = ?auto_396479 ?auto_396484 ) ) ( not ( = ?auto_396479 ?auto_396485 ) ) ( not ( = ?auto_396479 ?auto_396486 ) ) ( not ( = ?auto_396479 ?auto_396487 ) ) ( not ( = ?auto_396479 ?auto_396488 ) ) ( not ( = ?auto_396479 ?auto_396489 ) ) ( not ( = ?auto_396479 ?auto_396490 ) ) ( not ( = ?auto_396480 ?auto_396481 ) ) ( not ( = ?auto_396480 ?auto_396482 ) ) ( not ( = ?auto_396480 ?auto_396483 ) ) ( not ( = ?auto_396480 ?auto_396484 ) ) ( not ( = ?auto_396480 ?auto_396485 ) ) ( not ( = ?auto_396480 ?auto_396486 ) ) ( not ( = ?auto_396480 ?auto_396487 ) ) ( not ( = ?auto_396480 ?auto_396488 ) ) ( not ( = ?auto_396480 ?auto_396489 ) ) ( not ( = ?auto_396480 ?auto_396490 ) ) ( not ( = ?auto_396481 ?auto_396482 ) ) ( not ( = ?auto_396481 ?auto_396483 ) ) ( not ( = ?auto_396481 ?auto_396484 ) ) ( not ( = ?auto_396481 ?auto_396485 ) ) ( not ( = ?auto_396481 ?auto_396486 ) ) ( not ( = ?auto_396481 ?auto_396487 ) ) ( not ( = ?auto_396481 ?auto_396488 ) ) ( not ( = ?auto_396481 ?auto_396489 ) ) ( not ( = ?auto_396481 ?auto_396490 ) ) ( not ( = ?auto_396482 ?auto_396483 ) ) ( not ( = ?auto_396482 ?auto_396484 ) ) ( not ( = ?auto_396482 ?auto_396485 ) ) ( not ( = ?auto_396482 ?auto_396486 ) ) ( not ( = ?auto_396482 ?auto_396487 ) ) ( not ( = ?auto_396482 ?auto_396488 ) ) ( not ( = ?auto_396482 ?auto_396489 ) ) ( not ( = ?auto_396482 ?auto_396490 ) ) ( not ( = ?auto_396483 ?auto_396484 ) ) ( not ( = ?auto_396483 ?auto_396485 ) ) ( not ( = ?auto_396483 ?auto_396486 ) ) ( not ( = ?auto_396483 ?auto_396487 ) ) ( not ( = ?auto_396483 ?auto_396488 ) ) ( not ( = ?auto_396483 ?auto_396489 ) ) ( not ( = ?auto_396483 ?auto_396490 ) ) ( not ( = ?auto_396484 ?auto_396485 ) ) ( not ( = ?auto_396484 ?auto_396486 ) ) ( not ( = ?auto_396484 ?auto_396487 ) ) ( not ( = ?auto_396484 ?auto_396488 ) ) ( not ( = ?auto_396484 ?auto_396489 ) ) ( not ( = ?auto_396484 ?auto_396490 ) ) ( not ( = ?auto_396485 ?auto_396486 ) ) ( not ( = ?auto_396485 ?auto_396487 ) ) ( not ( = ?auto_396485 ?auto_396488 ) ) ( not ( = ?auto_396485 ?auto_396489 ) ) ( not ( = ?auto_396485 ?auto_396490 ) ) ( not ( = ?auto_396486 ?auto_396487 ) ) ( not ( = ?auto_396486 ?auto_396488 ) ) ( not ( = ?auto_396486 ?auto_396489 ) ) ( not ( = ?auto_396486 ?auto_396490 ) ) ( not ( = ?auto_396487 ?auto_396488 ) ) ( not ( = ?auto_396487 ?auto_396489 ) ) ( not ( = ?auto_396487 ?auto_396490 ) ) ( not ( = ?auto_396488 ?auto_396489 ) ) ( not ( = ?auto_396488 ?auto_396490 ) ) ( not ( = ?auto_396489 ?auto_396490 ) ) ( ON ?auto_396489 ?auto_396490 ) ( ON ?auto_396488 ?auto_396489 ) ( ON ?auto_396487 ?auto_396488 ) ( CLEAR ?auto_396485 ) ( ON ?auto_396486 ?auto_396487 ) ( CLEAR ?auto_396486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_396476 ?auto_396477 ?auto_396478 ?auto_396479 ?auto_396480 ?auto_396481 ?auto_396482 ?auto_396483 ?auto_396484 ?auto_396485 ?auto_396486 )
      ( MAKE-15PILE ?auto_396476 ?auto_396477 ?auto_396478 ?auto_396479 ?auto_396480 ?auto_396481 ?auto_396482 ?auto_396483 ?auto_396484 ?auto_396485 ?auto_396486 ?auto_396487 ?auto_396488 ?auto_396489 ?auto_396490 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396506 - BLOCK
      ?auto_396507 - BLOCK
      ?auto_396508 - BLOCK
      ?auto_396509 - BLOCK
      ?auto_396510 - BLOCK
      ?auto_396511 - BLOCK
      ?auto_396512 - BLOCK
      ?auto_396513 - BLOCK
      ?auto_396514 - BLOCK
      ?auto_396515 - BLOCK
      ?auto_396516 - BLOCK
      ?auto_396517 - BLOCK
      ?auto_396518 - BLOCK
      ?auto_396519 - BLOCK
      ?auto_396520 - BLOCK
    )
    :vars
    (
      ?auto_396521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396520 ?auto_396521 ) ( ON-TABLE ?auto_396506 ) ( ON ?auto_396507 ?auto_396506 ) ( ON ?auto_396508 ?auto_396507 ) ( ON ?auto_396509 ?auto_396508 ) ( ON ?auto_396510 ?auto_396509 ) ( ON ?auto_396511 ?auto_396510 ) ( ON ?auto_396512 ?auto_396511 ) ( ON ?auto_396513 ?auto_396512 ) ( ON ?auto_396514 ?auto_396513 ) ( not ( = ?auto_396506 ?auto_396507 ) ) ( not ( = ?auto_396506 ?auto_396508 ) ) ( not ( = ?auto_396506 ?auto_396509 ) ) ( not ( = ?auto_396506 ?auto_396510 ) ) ( not ( = ?auto_396506 ?auto_396511 ) ) ( not ( = ?auto_396506 ?auto_396512 ) ) ( not ( = ?auto_396506 ?auto_396513 ) ) ( not ( = ?auto_396506 ?auto_396514 ) ) ( not ( = ?auto_396506 ?auto_396515 ) ) ( not ( = ?auto_396506 ?auto_396516 ) ) ( not ( = ?auto_396506 ?auto_396517 ) ) ( not ( = ?auto_396506 ?auto_396518 ) ) ( not ( = ?auto_396506 ?auto_396519 ) ) ( not ( = ?auto_396506 ?auto_396520 ) ) ( not ( = ?auto_396506 ?auto_396521 ) ) ( not ( = ?auto_396507 ?auto_396508 ) ) ( not ( = ?auto_396507 ?auto_396509 ) ) ( not ( = ?auto_396507 ?auto_396510 ) ) ( not ( = ?auto_396507 ?auto_396511 ) ) ( not ( = ?auto_396507 ?auto_396512 ) ) ( not ( = ?auto_396507 ?auto_396513 ) ) ( not ( = ?auto_396507 ?auto_396514 ) ) ( not ( = ?auto_396507 ?auto_396515 ) ) ( not ( = ?auto_396507 ?auto_396516 ) ) ( not ( = ?auto_396507 ?auto_396517 ) ) ( not ( = ?auto_396507 ?auto_396518 ) ) ( not ( = ?auto_396507 ?auto_396519 ) ) ( not ( = ?auto_396507 ?auto_396520 ) ) ( not ( = ?auto_396507 ?auto_396521 ) ) ( not ( = ?auto_396508 ?auto_396509 ) ) ( not ( = ?auto_396508 ?auto_396510 ) ) ( not ( = ?auto_396508 ?auto_396511 ) ) ( not ( = ?auto_396508 ?auto_396512 ) ) ( not ( = ?auto_396508 ?auto_396513 ) ) ( not ( = ?auto_396508 ?auto_396514 ) ) ( not ( = ?auto_396508 ?auto_396515 ) ) ( not ( = ?auto_396508 ?auto_396516 ) ) ( not ( = ?auto_396508 ?auto_396517 ) ) ( not ( = ?auto_396508 ?auto_396518 ) ) ( not ( = ?auto_396508 ?auto_396519 ) ) ( not ( = ?auto_396508 ?auto_396520 ) ) ( not ( = ?auto_396508 ?auto_396521 ) ) ( not ( = ?auto_396509 ?auto_396510 ) ) ( not ( = ?auto_396509 ?auto_396511 ) ) ( not ( = ?auto_396509 ?auto_396512 ) ) ( not ( = ?auto_396509 ?auto_396513 ) ) ( not ( = ?auto_396509 ?auto_396514 ) ) ( not ( = ?auto_396509 ?auto_396515 ) ) ( not ( = ?auto_396509 ?auto_396516 ) ) ( not ( = ?auto_396509 ?auto_396517 ) ) ( not ( = ?auto_396509 ?auto_396518 ) ) ( not ( = ?auto_396509 ?auto_396519 ) ) ( not ( = ?auto_396509 ?auto_396520 ) ) ( not ( = ?auto_396509 ?auto_396521 ) ) ( not ( = ?auto_396510 ?auto_396511 ) ) ( not ( = ?auto_396510 ?auto_396512 ) ) ( not ( = ?auto_396510 ?auto_396513 ) ) ( not ( = ?auto_396510 ?auto_396514 ) ) ( not ( = ?auto_396510 ?auto_396515 ) ) ( not ( = ?auto_396510 ?auto_396516 ) ) ( not ( = ?auto_396510 ?auto_396517 ) ) ( not ( = ?auto_396510 ?auto_396518 ) ) ( not ( = ?auto_396510 ?auto_396519 ) ) ( not ( = ?auto_396510 ?auto_396520 ) ) ( not ( = ?auto_396510 ?auto_396521 ) ) ( not ( = ?auto_396511 ?auto_396512 ) ) ( not ( = ?auto_396511 ?auto_396513 ) ) ( not ( = ?auto_396511 ?auto_396514 ) ) ( not ( = ?auto_396511 ?auto_396515 ) ) ( not ( = ?auto_396511 ?auto_396516 ) ) ( not ( = ?auto_396511 ?auto_396517 ) ) ( not ( = ?auto_396511 ?auto_396518 ) ) ( not ( = ?auto_396511 ?auto_396519 ) ) ( not ( = ?auto_396511 ?auto_396520 ) ) ( not ( = ?auto_396511 ?auto_396521 ) ) ( not ( = ?auto_396512 ?auto_396513 ) ) ( not ( = ?auto_396512 ?auto_396514 ) ) ( not ( = ?auto_396512 ?auto_396515 ) ) ( not ( = ?auto_396512 ?auto_396516 ) ) ( not ( = ?auto_396512 ?auto_396517 ) ) ( not ( = ?auto_396512 ?auto_396518 ) ) ( not ( = ?auto_396512 ?auto_396519 ) ) ( not ( = ?auto_396512 ?auto_396520 ) ) ( not ( = ?auto_396512 ?auto_396521 ) ) ( not ( = ?auto_396513 ?auto_396514 ) ) ( not ( = ?auto_396513 ?auto_396515 ) ) ( not ( = ?auto_396513 ?auto_396516 ) ) ( not ( = ?auto_396513 ?auto_396517 ) ) ( not ( = ?auto_396513 ?auto_396518 ) ) ( not ( = ?auto_396513 ?auto_396519 ) ) ( not ( = ?auto_396513 ?auto_396520 ) ) ( not ( = ?auto_396513 ?auto_396521 ) ) ( not ( = ?auto_396514 ?auto_396515 ) ) ( not ( = ?auto_396514 ?auto_396516 ) ) ( not ( = ?auto_396514 ?auto_396517 ) ) ( not ( = ?auto_396514 ?auto_396518 ) ) ( not ( = ?auto_396514 ?auto_396519 ) ) ( not ( = ?auto_396514 ?auto_396520 ) ) ( not ( = ?auto_396514 ?auto_396521 ) ) ( not ( = ?auto_396515 ?auto_396516 ) ) ( not ( = ?auto_396515 ?auto_396517 ) ) ( not ( = ?auto_396515 ?auto_396518 ) ) ( not ( = ?auto_396515 ?auto_396519 ) ) ( not ( = ?auto_396515 ?auto_396520 ) ) ( not ( = ?auto_396515 ?auto_396521 ) ) ( not ( = ?auto_396516 ?auto_396517 ) ) ( not ( = ?auto_396516 ?auto_396518 ) ) ( not ( = ?auto_396516 ?auto_396519 ) ) ( not ( = ?auto_396516 ?auto_396520 ) ) ( not ( = ?auto_396516 ?auto_396521 ) ) ( not ( = ?auto_396517 ?auto_396518 ) ) ( not ( = ?auto_396517 ?auto_396519 ) ) ( not ( = ?auto_396517 ?auto_396520 ) ) ( not ( = ?auto_396517 ?auto_396521 ) ) ( not ( = ?auto_396518 ?auto_396519 ) ) ( not ( = ?auto_396518 ?auto_396520 ) ) ( not ( = ?auto_396518 ?auto_396521 ) ) ( not ( = ?auto_396519 ?auto_396520 ) ) ( not ( = ?auto_396519 ?auto_396521 ) ) ( not ( = ?auto_396520 ?auto_396521 ) ) ( ON ?auto_396519 ?auto_396520 ) ( ON ?auto_396518 ?auto_396519 ) ( ON ?auto_396517 ?auto_396518 ) ( ON ?auto_396516 ?auto_396517 ) ( CLEAR ?auto_396514 ) ( ON ?auto_396515 ?auto_396516 ) ( CLEAR ?auto_396515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_396506 ?auto_396507 ?auto_396508 ?auto_396509 ?auto_396510 ?auto_396511 ?auto_396512 ?auto_396513 ?auto_396514 ?auto_396515 )
      ( MAKE-15PILE ?auto_396506 ?auto_396507 ?auto_396508 ?auto_396509 ?auto_396510 ?auto_396511 ?auto_396512 ?auto_396513 ?auto_396514 ?auto_396515 ?auto_396516 ?auto_396517 ?auto_396518 ?auto_396519 ?auto_396520 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396537 - BLOCK
      ?auto_396538 - BLOCK
      ?auto_396539 - BLOCK
      ?auto_396540 - BLOCK
      ?auto_396541 - BLOCK
      ?auto_396542 - BLOCK
      ?auto_396543 - BLOCK
      ?auto_396544 - BLOCK
      ?auto_396545 - BLOCK
      ?auto_396546 - BLOCK
      ?auto_396547 - BLOCK
      ?auto_396548 - BLOCK
      ?auto_396549 - BLOCK
      ?auto_396550 - BLOCK
      ?auto_396551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396551 ) ( ON-TABLE ?auto_396537 ) ( ON ?auto_396538 ?auto_396537 ) ( ON ?auto_396539 ?auto_396538 ) ( ON ?auto_396540 ?auto_396539 ) ( ON ?auto_396541 ?auto_396540 ) ( ON ?auto_396542 ?auto_396541 ) ( ON ?auto_396543 ?auto_396542 ) ( ON ?auto_396544 ?auto_396543 ) ( ON ?auto_396545 ?auto_396544 ) ( not ( = ?auto_396537 ?auto_396538 ) ) ( not ( = ?auto_396537 ?auto_396539 ) ) ( not ( = ?auto_396537 ?auto_396540 ) ) ( not ( = ?auto_396537 ?auto_396541 ) ) ( not ( = ?auto_396537 ?auto_396542 ) ) ( not ( = ?auto_396537 ?auto_396543 ) ) ( not ( = ?auto_396537 ?auto_396544 ) ) ( not ( = ?auto_396537 ?auto_396545 ) ) ( not ( = ?auto_396537 ?auto_396546 ) ) ( not ( = ?auto_396537 ?auto_396547 ) ) ( not ( = ?auto_396537 ?auto_396548 ) ) ( not ( = ?auto_396537 ?auto_396549 ) ) ( not ( = ?auto_396537 ?auto_396550 ) ) ( not ( = ?auto_396537 ?auto_396551 ) ) ( not ( = ?auto_396538 ?auto_396539 ) ) ( not ( = ?auto_396538 ?auto_396540 ) ) ( not ( = ?auto_396538 ?auto_396541 ) ) ( not ( = ?auto_396538 ?auto_396542 ) ) ( not ( = ?auto_396538 ?auto_396543 ) ) ( not ( = ?auto_396538 ?auto_396544 ) ) ( not ( = ?auto_396538 ?auto_396545 ) ) ( not ( = ?auto_396538 ?auto_396546 ) ) ( not ( = ?auto_396538 ?auto_396547 ) ) ( not ( = ?auto_396538 ?auto_396548 ) ) ( not ( = ?auto_396538 ?auto_396549 ) ) ( not ( = ?auto_396538 ?auto_396550 ) ) ( not ( = ?auto_396538 ?auto_396551 ) ) ( not ( = ?auto_396539 ?auto_396540 ) ) ( not ( = ?auto_396539 ?auto_396541 ) ) ( not ( = ?auto_396539 ?auto_396542 ) ) ( not ( = ?auto_396539 ?auto_396543 ) ) ( not ( = ?auto_396539 ?auto_396544 ) ) ( not ( = ?auto_396539 ?auto_396545 ) ) ( not ( = ?auto_396539 ?auto_396546 ) ) ( not ( = ?auto_396539 ?auto_396547 ) ) ( not ( = ?auto_396539 ?auto_396548 ) ) ( not ( = ?auto_396539 ?auto_396549 ) ) ( not ( = ?auto_396539 ?auto_396550 ) ) ( not ( = ?auto_396539 ?auto_396551 ) ) ( not ( = ?auto_396540 ?auto_396541 ) ) ( not ( = ?auto_396540 ?auto_396542 ) ) ( not ( = ?auto_396540 ?auto_396543 ) ) ( not ( = ?auto_396540 ?auto_396544 ) ) ( not ( = ?auto_396540 ?auto_396545 ) ) ( not ( = ?auto_396540 ?auto_396546 ) ) ( not ( = ?auto_396540 ?auto_396547 ) ) ( not ( = ?auto_396540 ?auto_396548 ) ) ( not ( = ?auto_396540 ?auto_396549 ) ) ( not ( = ?auto_396540 ?auto_396550 ) ) ( not ( = ?auto_396540 ?auto_396551 ) ) ( not ( = ?auto_396541 ?auto_396542 ) ) ( not ( = ?auto_396541 ?auto_396543 ) ) ( not ( = ?auto_396541 ?auto_396544 ) ) ( not ( = ?auto_396541 ?auto_396545 ) ) ( not ( = ?auto_396541 ?auto_396546 ) ) ( not ( = ?auto_396541 ?auto_396547 ) ) ( not ( = ?auto_396541 ?auto_396548 ) ) ( not ( = ?auto_396541 ?auto_396549 ) ) ( not ( = ?auto_396541 ?auto_396550 ) ) ( not ( = ?auto_396541 ?auto_396551 ) ) ( not ( = ?auto_396542 ?auto_396543 ) ) ( not ( = ?auto_396542 ?auto_396544 ) ) ( not ( = ?auto_396542 ?auto_396545 ) ) ( not ( = ?auto_396542 ?auto_396546 ) ) ( not ( = ?auto_396542 ?auto_396547 ) ) ( not ( = ?auto_396542 ?auto_396548 ) ) ( not ( = ?auto_396542 ?auto_396549 ) ) ( not ( = ?auto_396542 ?auto_396550 ) ) ( not ( = ?auto_396542 ?auto_396551 ) ) ( not ( = ?auto_396543 ?auto_396544 ) ) ( not ( = ?auto_396543 ?auto_396545 ) ) ( not ( = ?auto_396543 ?auto_396546 ) ) ( not ( = ?auto_396543 ?auto_396547 ) ) ( not ( = ?auto_396543 ?auto_396548 ) ) ( not ( = ?auto_396543 ?auto_396549 ) ) ( not ( = ?auto_396543 ?auto_396550 ) ) ( not ( = ?auto_396543 ?auto_396551 ) ) ( not ( = ?auto_396544 ?auto_396545 ) ) ( not ( = ?auto_396544 ?auto_396546 ) ) ( not ( = ?auto_396544 ?auto_396547 ) ) ( not ( = ?auto_396544 ?auto_396548 ) ) ( not ( = ?auto_396544 ?auto_396549 ) ) ( not ( = ?auto_396544 ?auto_396550 ) ) ( not ( = ?auto_396544 ?auto_396551 ) ) ( not ( = ?auto_396545 ?auto_396546 ) ) ( not ( = ?auto_396545 ?auto_396547 ) ) ( not ( = ?auto_396545 ?auto_396548 ) ) ( not ( = ?auto_396545 ?auto_396549 ) ) ( not ( = ?auto_396545 ?auto_396550 ) ) ( not ( = ?auto_396545 ?auto_396551 ) ) ( not ( = ?auto_396546 ?auto_396547 ) ) ( not ( = ?auto_396546 ?auto_396548 ) ) ( not ( = ?auto_396546 ?auto_396549 ) ) ( not ( = ?auto_396546 ?auto_396550 ) ) ( not ( = ?auto_396546 ?auto_396551 ) ) ( not ( = ?auto_396547 ?auto_396548 ) ) ( not ( = ?auto_396547 ?auto_396549 ) ) ( not ( = ?auto_396547 ?auto_396550 ) ) ( not ( = ?auto_396547 ?auto_396551 ) ) ( not ( = ?auto_396548 ?auto_396549 ) ) ( not ( = ?auto_396548 ?auto_396550 ) ) ( not ( = ?auto_396548 ?auto_396551 ) ) ( not ( = ?auto_396549 ?auto_396550 ) ) ( not ( = ?auto_396549 ?auto_396551 ) ) ( not ( = ?auto_396550 ?auto_396551 ) ) ( ON ?auto_396550 ?auto_396551 ) ( ON ?auto_396549 ?auto_396550 ) ( ON ?auto_396548 ?auto_396549 ) ( ON ?auto_396547 ?auto_396548 ) ( CLEAR ?auto_396545 ) ( ON ?auto_396546 ?auto_396547 ) ( CLEAR ?auto_396546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_396537 ?auto_396538 ?auto_396539 ?auto_396540 ?auto_396541 ?auto_396542 ?auto_396543 ?auto_396544 ?auto_396545 ?auto_396546 )
      ( MAKE-15PILE ?auto_396537 ?auto_396538 ?auto_396539 ?auto_396540 ?auto_396541 ?auto_396542 ?auto_396543 ?auto_396544 ?auto_396545 ?auto_396546 ?auto_396547 ?auto_396548 ?auto_396549 ?auto_396550 ?auto_396551 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396567 - BLOCK
      ?auto_396568 - BLOCK
      ?auto_396569 - BLOCK
      ?auto_396570 - BLOCK
      ?auto_396571 - BLOCK
      ?auto_396572 - BLOCK
      ?auto_396573 - BLOCK
      ?auto_396574 - BLOCK
      ?auto_396575 - BLOCK
      ?auto_396576 - BLOCK
      ?auto_396577 - BLOCK
      ?auto_396578 - BLOCK
      ?auto_396579 - BLOCK
      ?auto_396580 - BLOCK
      ?auto_396581 - BLOCK
    )
    :vars
    (
      ?auto_396582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396581 ?auto_396582 ) ( ON-TABLE ?auto_396567 ) ( ON ?auto_396568 ?auto_396567 ) ( ON ?auto_396569 ?auto_396568 ) ( ON ?auto_396570 ?auto_396569 ) ( ON ?auto_396571 ?auto_396570 ) ( ON ?auto_396572 ?auto_396571 ) ( ON ?auto_396573 ?auto_396572 ) ( ON ?auto_396574 ?auto_396573 ) ( not ( = ?auto_396567 ?auto_396568 ) ) ( not ( = ?auto_396567 ?auto_396569 ) ) ( not ( = ?auto_396567 ?auto_396570 ) ) ( not ( = ?auto_396567 ?auto_396571 ) ) ( not ( = ?auto_396567 ?auto_396572 ) ) ( not ( = ?auto_396567 ?auto_396573 ) ) ( not ( = ?auto_396567 ?auto_396574 ) ) ( not ( = ?auto_396567 ?auto_396575 ) ) ( not ( = ?auto_396567 ?auto_396576 ) ) ( not ( = ?auto_396567 ?auto_396577 ) ) ( not ( = ?auto_396567 ?auto_396578 ) ) ( not ( = ?auto_396567 ?auto_396579 ) ) ( not ( = ?auto_396567 ?auto_396580 ) ) ( not ( = ?auto_396567 ?auto_396581 ) ) ( not ( = ?auto_396567 ?auto_396582 ) ) ( not ( = ?auto_396568 ?auto_396569 ) ) ( not ( = ?auto_396568 ?auto_396570 ) ) ( not ( = ?auto_396568 ?auto_396571 ) ) ( not ( = ?auto_396568 ?auto_396572 ) ) ( not ( = ?auto_396568 ?auto_396573 ) ) ( not ( = ?auto_396568 ?auto_396574 ) ) ( not ( = ?auto_396568 ?auto_396575 ) ) ( not ( = ?auto_396568 ?auto_396576 ) ) ( not ( = ?auto_396568 ?auto_396577 ) ) ( not ( = ?auto_396568 ?auto_396578 ) ) ( not ( = ?auto_396568 ?auto_396579 ) ) ( not ( = ?auto_396568 ?auto_396580 ) ) ( not ( = ?auto_396568 ?auto_396581 ) ) ( not ( = ?auto_396568 ?auto_396582 ) ) ( not ( = ?auto_396569 ?auto_396570 ) ) ( not ( = ?auto_396569 ?auto_396571 ) ) ( not ( = ?auto_396569 ?auto_396572 ) ) ( not ( = ?auto_396569 ?auto_396573 ) ) ( not ( = ?auto_396569 ?auto_396574 ) ) ( not ( = ?auto_396569 ?auto_396575 ) ) ( not ( = ?auto_396569 ?auto_396576 ) ) ( not ( = ?auto_396569 ?auto_396577 ) ) ( not ( = ?auto_396569 ?auto_396578 ) ) ( not ( = ?auto_396569 ?auto_396579 ) ) ( not ( = ?auto_396569 ?auto_396580 ) ) ( not ( = ?auto_396569 ?auto_396581 ) ) ( not ( = ?auto_396569 ?auto_396582 ) ) ( not ( = ?auto_396570 ?auto_396571 ) ) ( not ( = ?auto_396570 ?auto_396572 ) ) ( not ( = ?auto_396570 ?auto_396573 ) ) ( not ( = ?auto_396570 ?auto_396574 ) ) ( not ( = ?auto_396570 ?auto_396575 ) ) ( not ( = ?auto_396570 ?auto_396576 ) ) ( not ( = ?auto_396570 ?auto_396577 ) ) ( not ( = ?auto_396570 ?auto_396578 ) ) ( not ( = ?auto_396570 ?auto_396579 ) ) ( not ( = ?auto_396570 ?auto_396580 ) ) ( not ( = ?auto_396570 ?auto_396581 ) ) ( not ( = ?auto_396570 ?auto_396582 ) ) ( not ( = ?auto_396571 ?auto_396572 ) ) ( not ( = ?auto_396571 ?auto_396573 ) ) ( not ( = ?auto_396571 ?auto_396574 ) ) ( not ( = ?auto_396571 ?auto_396575 ) ) ( not ( = ?auto_396571 ?auto_396576 ) ) ( not ( = ?auto_396571 ?auto_396577 ) ) ( not ( = ?auto_396571 ?auto_396578 ) ) ( not ( = ?auto_396571 ?auto_396579 ) ) ( not ( = ?auto_396571 ?auto_396580 ) ) ( not ( = ?auto_396571 ?auto_396581 ) ) ( not ( = ?auto_396571 ?auto_396582 ) ) ( not ( = ?auto_396572 ?auto_396573 ) ) ( not ( = ?auto_396572 ?auto_396574 ) ) ( not ( = ?auto_396572 ?auto_396575 ) ) ( not ( = ?auto_396572 ?auto_396576 ) ) ( not ( = ?auto_396572 ?auto_396577 ) ) ( not ( = ?auto_396572 ?auto_396578 ) ) ( not ( = ?auto_396572 ?auto_396579 ) ) ( not ( = ?auto_396572 ?auto_396580 ) ) ( not ( = ?auto_396572 ?auto_396581 ) ) ( not ( = ?auto_396572 ?auto_396582 ) ) ( not ( = ?auto_396573 ?auto_396574 ) ) ( not ( = ?auto_396573 ?auto_396575 ) ) ( not ( = ?auto_396573 ?auto_396576 ) ) ( not ( = ?auto_396573 ?auto_396577 ) ) ( not ( = ?auto_396573 ?auto_396578 ) ) ( not ( = ?auto_396573 ?auto_396579 ) ) ( not ( = ?auto_396573 ?auto_396580 ) ) ( not ( = ?auto_396573 ?auto_396581 ) ) ( not ( = ?auto_396573 ?auto_396582 ) ) ( not ( = ?auto_396574 ?auto_396575 ) ) ( not ( = ?auto_396574 ?auto_396576 ) ) ( not ( = ?auto_396574 ?auto_396577 ) ) ( not ( = ?auto_396574 ?auto_396578 ) ) ( not ( = ?auto_396574 ?auto_396579 ) ) ( not ( = ?auto_396574 ?auto_396580 ) ) ( not ( = ?auto_396574 ?auto_396581 ) ) ( not ( = ?auto_396574 ?auto_396582 ) ) ( not ( = ?auto_396575 ?auto_396576 ) ) ( not ( = ?auto_396575 ?auto_396577 ) ) ( not ( = ?auto_396575 ?auto_396578 ) ) ( not ( = ?auto_396575 ?auto_396579 ) ) ( not ( = ?auto_396575 ?auto_396580 ) ) ( not ( = ?auto_396575 ?auto_396581 ) ) ( not ( = ?auto_396575 ?auto_396582 ) ) ( not ( = ?auto_396576 ?auto_396577 ) ) ( not ( = ?auto_396576 ?auto_396578 ) ) ( not ( = ?auto_396576 ?auto_396579 ) ) ( not ( = ?auto_396576 ?auto_396580 ) ) ( not ( = ?auto_396576 ?auto_396581 ) ) ( not ( = ?auto_396576 ?auto_396582 ) ) ( not ( = ?auto_396577 ?auto_396578 ) ) ( not ( = ?auto_396577 ?auto_396579 ) ) ( not ( = ?auto_396577 ?auto_396580 ) ) ( not ( = ?auto_396577 ?auto_396581 ) ) ( not ( = ?auto_396577 ?auto_396582 ) ) ( not ( = ?auto_396578 ?auto_396579 ) ) ( not ( = ?auto_396578 ?auto_396580 ) ) ( not ( = ?auto_396578 ?auto_396581 ) ) ( not ( = ?auto_396578 ?auto_396582 ) ) ( not ( = ?auto_396579 ?auto_396580 ) ) ( not ( = ?auto_396579 ?auto_396581 ) ) ( not ( = ?auto_396579 ?auto_396582 ) ) ( not ( = ?auto_396580 ?auto_396581 ) ) ( not ( = ?auto_396580 ?auto_396582 ) ) ( not ( = ?auto_396581 ?auto_396582 ) ) ( ON ?auto_396580 ?auto_396581 ) ( ON ?auto_396579 ?auto_396580 ) ( ON ?auto_396578 ?auto_396579 ) ( ON ?auto_396577 ?auto_396578 ) ( ON ?auto_396576 ?auto_396577 ) ( CLEAR ?auto_396574 ) ( ON ?auto_396575 ?auto_396576 ) ( CLEAR ?auto_396575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_396567 ?auto_396568 ?auto_396569 ?auto_396570 ?auto_396571 ?auto_396572 ?auto_396573 ?auto_396574 ?auto_396575 )
      ( MAKE-15PILE ?auto_396567 ?auto_396568 ?auto_396569 ?auto_396570 ?auto_396571 ?auto_396572 ?auto_396573 ?auto_396574 ?auto_396575 ?auto_396576 ?auto_396577 ?auto_396578 ?auto_396579 ?auto_396580 ?auto_396581 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396598 - BLOCK
      ?auto_396599 - BLOCK
      ?auto_396600 - BLOCK
      ?auto_396601 - BLOCK
      ?auto_396602 - BLOCK
      ?auto_396603 - BLOCK
      ?auto_396604 - BLOCK
      ?auto_396605 - BLOCK
      ?auto_396606 - BLOCK
      ?auto_396607 - BLOCK
      ?auto_396608 - BLOCK
      ?auto_396609 - BLOCK
      ?auto_396610 - BLOCK
      ?auto_396611 - BLOCK
      ?auto_396612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396612 ) ( ON-TABLE ?auto_396598 ) ( ON ?auto_396599 ?auto_396598 ) ( ON ?auto_396600 ?auto_396599 ) ( ON ?auto_396601 ?auto_396600 ) ( ON ?auto_396602 ?auto_396601 ) ( ON ?auto_396603 ?auto_396602 ) ( ON ?auto_396604 ?auto_396603 ) ( ON ?auto_396605 ?auto_396604 ) ( not ( = ?auto_396598 ?auto_396599 ) ) ( not ( = ?auto_396598 ?auto_396600 ) ) ( not ( = ?auto_396598 ?auto_396601 ) ) ( not ( = ?auto_396598 ?auto_396602 ) ) ( not ( = ?auto_396598 ?auto_396603 ) ) ( not ( = ?auto_396598 ?auto_396604 ) ) ( not ( = ?auto_396598 ?auto_396605 ) ) ( not ( = ?auto_396598 ?auto_396606 ) ) ( not ( = ?auto_396598 ?auto_396607 ) ) ( not ( = ?auto_396598 ?auto_396608 ) ) ( not ( = ?auto_396598 ?auto_396609 ) ) ( not ( = ?auto_396598 ?auto_396610 ) ) ( not ( = ?auto_396598 ?auto_396611 ) ) ( not ( = ?auto_396598 ?auto_396612 ) ) ( not ( = ?auto_396599 ?auto_396600 ) ) ( not ( = ?auto_396599 ?auto_396601 ) ) ( not ( = ?auto_396599 ?auto_396602 ) ) ( not ( = ?auto_396599 ?auto_396603 ) ) ( not ( = ?auto_396599 ?auto_396604 ) ) ( not ( = ?auto_396599 ?auto_396605 ) ) ( not ( = ?auto_396599 ?auto_396606 ) ) ( not ( = ?auto_396599 ?auto_396607 ) ) ( not ( = ?auto_396599 ?auto_396608 ) ) ( not ( = ?auto_396599 ?auto_396609 ) ) ( not ( = ?auto_396599 ?auto_396610 ) ) ( not ( = ?auto_396599 ?auto_396611 ) ) ( not ( = ?auto_396599 ?auto_396612 ) ) ( not ( = ?auto_396600 ?auto_396601 ) ) ( not ( = ?auto_396600 ?auto_396602 ) ) ( not ( = ?auto_396600 ?auto_396603 ) ) ( not ( = ?auto_396600 ?auto_396604 ) ) ( not ( = ?auto_396600 ?auto_396605 ) ) ( not ( = ?auto_396600 ?auto_396606 ) ) ( not ( = ?auto_396600 ?auto_396607 ) ) ( not ( = ?auto_396600 ?auto_396608 ) ) ( not ( = ?auto_396600 ?auto_396609 ) ) ( not ( = ?auto_396600 ?auto_396610 ) ) ( not ( = ?auto_396600 ?auto_396611 ) ) ( not ( = ?auto_396600 ?auto_396612 ) ) ( not ( = ?auto_396601 ?auto_396602 ) ) ( not ( = ?auto_396601 ?auto_396603 ) ) ( not ( = ?auto_396601 ?auto_396604 ) ) ( not ( = ?auto_396601 ?auto_396605 ) ) ( not ( = ?auto_396601 ?auto_396606 ) ) ( not ( = ?auto_396601 ?auto_396607 ) ) ( not ( = ?auto_396601 ?auto_396608 ) ) ( not ( = ?auto_396601 ?auto_396609 ) ) ( not ( = ?auto_396601 ?auto_396610 ) ) ( not ( = ?auto_396601 ?auto_396611 ) ) ( not ( = ?auto_396601 ?auto_396612 ) ) ( not ( = ?auto_396602 ?auto_396603 ) ) ( not ( = ?auto_396602 ?auto_396604 ) ) ( not ( = ?auto_396602 ?auto_396605 ) ) ( not ( = ?auto_396602 ?auto_396606 ) ) ( not ( = ?auto_396602 ?auto_396607 ) ) ( not ( = ?auto_396602 ?auto_396608 ) ) ( not ( = ?auto_396602 ?auto_396609 ) ) ( not ( = ?auto_396602 ?auto_396610 ) ) ( not ( = ?auto_396602 ?auto_396611 ) ) ( not ( = ?auto_396602 ?auto_396612 ) ) ( not ( = ?auto_396603 ?auto_396604 ) ) ( not ( = ?auto_396603 ?auto_396605 ) ) ( not ( = ?auto_396603 ?auto_396606 ) ) ( not ( = ?auto_396603 ?auto_396607 ) ) ( not ( = ?auto_396603 ?auto_396608 ) ) ( not ( = ?auto_396603 ?auto_396609 ) ) ( not ( = ?auto_396603 ?auto_396610 ) ) ( not ( = ?auto_396603 ?auto_396611 ) ) ( not ( = ?auto_396603 ?auto_396612 ) ) ( not ( = ?auto_396604 ?auto_396605 ) ) ( not ( = ?auto_396604 ?auto_396606 ) ) ( not ( = ?auto_396604 ?auto_396607 ) ) ( not ( = ?auto_396604 ?auto_396608 ) ) ( not ( = ?auto_396604 ?auto_396609 ) ) ( not ( = ?auto_396604 ?auto_396610 ) ) ( not ( = ?auto_396604 ?auto_396611 ) ) ( not ( = ?auto_396604 ?auto_396612 ) ) ( not ( = ?auto_396605 ?auto_396606 ) ) ( not ( = ?auto_396605 ?auto_396607 ) ) ( not ( = ?auto_396605 ?auto_396608 ) ) ( not ( = ?auto_396605 ?auto_396609 ) ) ( not ( = ?auto_396605 ?auto_396610 ) ) ( not ( = ?auto_396605 ?auto_396611 ) ) ( not ( = ?auto_396605 ?auto_396612 ) ) ( not ( = ?auto_396606 ?auto_396607 ) ) ( not ( = ?auto_396606 ?auto_396608 ) ) ( not ( = ?auto_396606 ?auto_396609 ) ) ( not ( = ?auto_396606 ?auto_396610 ) ) ( not ( = ?auto_396606 ?auto_396611 ) ) ( not ( = ?auto_396606 ?auto_396612 ) ) ( not ( = ?auto_396607 ?auto_396608 ) ) ( not ( = ?auto_396607 ?auto_396609 ) ) ( not ( = ?auto_396607 ?auto_396610 ) ) ( not ( = ?auto_396607 ?auto_396611 ) ) ( not ( = ?auto_396607 ?auto_396612 ) ) ( not ( = ?auto_396608 ?auto_396609 ) ) ( not ( = ?auto_396608 ?auto_396610 ) ) ( not ( = ?auto_396608 ?auto_396611 ) ) ( not ( = ?auto_396608 ?auto_396612 ) ) ( not ( = ?auto_396609 ?auto_396610 ) ) ( not ( = ?auto_396609 ?auto_396611 ) ) ( not ( = ?auto_396609 ?auto_396612 ) ) ( not ( = ?auto_396610 ?auto_396611 ) ) ( not ( = ?auto_396610 ?auto_396612 ) ) ( not ( = ?auto_396611 ?auto_396612 ) ) ( ON ?auto_396611 ?auto_396612 ) ( ON ?auto_396610 ?auto_396611 ) ( ON ?auto_396609 ?auto_396610 ) ( ON ?auto_396608 ?auto_396609 ) ( ON ?auto_396607 ?auto_396608 ) ( CLEAR ?auto_396605 ) ( ON ?auto_396606 ?auto_396607 ) ( CLEAR ?auto_396606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_396598 ?auto_396599 ?auto_396600 ?auto_396601 ?auto_396602 ?auto_396603 ?auto_396604 ?auto_396605 ?auto_396606 )
      ( MAKE-15PILE ?auto_396598 ?auto_396599 ?auto_396600 ?auto_396601 ?auto_396602 ?auto_396603 ?auto_396604 ?auto_396605 ?auto_396606 ?auto_396607 ?auto_396608 ?auto_396609 ?auto_396610 ?auto_396611 ?auto_396612 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396628 - BLOCK
      ?auto_396629 - BLOCK
      ?auto_396630 - BLOCK
      ?auto_396631 - BLOCK
      ?auto_396632 - BLOCK
      ?auto_396633 - BLOCK
      ?auto_396634 - BLOCK
      ?auto_396635 - BLOCK
      ?auto_396636 - BLOCK
      ?auto_396637 - BLOCK
      ?auto_396638 - BLOCK
      ?auto_396639 - BLOCK
      ?auto_396640 - BLOCK
      ?auto_396641 - BLOCK
      ?auto_396642 - BLOCK
    )
    :vars
    (
      ?auto_396643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396642 ?auto_396643 ) ( ON-TABLE ?auto_396628 ) ( ON ?auto_396629 ?auto_396628 ) ( ON ?auto_396630 ?auto_396629 ) ( ON ?auto_396631 ?auto_396630 ) ( ON ?auto_396632 ?auto_396631 ) ( ON ?auto_396633 ?auto_396632 ) ( ON ?auto_396634 ?auto_396633 ) ( not ( = ?auto_396628 ?auto_396629 ) ) ( not ( = ?auto_396628 ?auto_396630 ) ) ( not ( = ?auto_396628 ?auto_396631 ) ) ( not ( = ?auto_396628 ?auto_396632 ) ) ( not ( = ?auto_396628 ?auto_396633 ) ) ( not ( = ?auto_396628 ?auto_396634 ) ) ( not ( = ?auto_396628 ?auto_396635 ) ) ( not ( = ?auto_396628 ?auto_396636 ) ) ( not ( = ?auto_396628 ?auto_396637 ) ) ( not ( = ?auto_396628 ?auto_396638 ) ) ( not ( = ?auto_396628 ?auto_396639 ) ) ( not ( = ?auto_396628 ?auto_396640 ) ) ( not ( = ?auto_396628 ?auto_396641 ) ) ( not ( = ?auto_396628 ?auto_396642 ) ) ( not ( = ?auto_396628 ?auto_396643 ) ) ( not ( = ?auto_396629 ?auto_396630 ) ) ( not ( = ?auto_396629 ?auto_396631 ) ) ( not ( = ?auto_396629 ?auto_396632 ) ) ( not ( = ?auto_396629 ?auto_396633 ) ) ( not ( = ?auto_396629 ?auto_396634 ) ) ( not ( = ?auto_396629 ?auto_396635 ) ) ( not ( = ?auto_396629 ?auto_396636 ) ) ( not ( = ?auto_396629 ?auto_396637 ) ) ( not ( = ?auto_396629 ?auto_396638 ) ) ( not ( = ?auto_396629 ?auto_396639 ) ) ( not ( = ?auto_396629 ?auto_396640 ) ) ( not ( = ?auto_396629 ?auto_396641 ) ) ( not ( = ?auto_396629 ?auto_396642 ) ) ( not ( = ?auto_396629 ?auto_396643 ) ) ( not ( = ?auto_396630 ?auto_396631 ) ) ( not ( = ?auto_396630 ?auto_396632 ) ) ( not ( = ?auto_396630 ?auto_396633 ) ) ( not ( = ?auto_396630 ?auto_396634 ) ) ( not ( = ?auto_396630 ?auto_396635 ) ) ( not ( = ?auto_396630 ?auto_396636 ) ) ( not ( = ?auto_396630 ?auto_396637 ) ) ( not ( = ?auto_396630 ?auto_396638 ) ) ( not ( = ?auto_396630 ?auto_396639 ) ) ( not ( = ?auto_396630 ?auto_396640 ) ) ( not ( = ?auto_396630 ?auto_396641 ) ) ( not ( = ?auto_396630 ?auto_396642 ) ) ( not ( = ?auto_396630 ?auto_396643 ) ) ( not ( = ?auto_396631 ?auto_396632 ) ) ( not ( = ?auto_396631 ?auto_396633 ) ) ( not ( = ?auto_396631 ?auto_396634 ) ) ( not ( = ?auto_396631 ?auto_396635 ) ) ( not ( = ?auto_396631 ?auto_396636 ) ) ( not ( = ?auto_396631 ?auto_396637 ) ) ( not ( = ?auto_396631 ?auto_396638 ) ) ( not ( = ?auto_396631 ?auto_396639 ) ) ( not ( = ?auto_396631 ?auto_396640 ) ) ( not ( = ?auto_396631 ?auto_396641 ) ) ( not ( = ?auto_396631 ?auto_396642 ) ) ( not ( = ?auto_396631 ?auto_396643 ) ) ( not ( = ?auto_396632 ?auto_396633 ) ) ( not ( = ?auto_396632 ?auto_396634 ) ) ( not ( = ?auto_396632 ?auto_396635 ) ) ( not ( = ?auto_396632 ?auto_396636 ) ) ( not ( = ?auto_396632 ?auto_396637 ) ) ( not ( = ?auto_396632 ?auto_396638 ) ) ( not ( = ?auto_396632 ?auto_396639 ) ) ( not ( = ?auto_396632 ?auto_396640 ) ) ( not ( = ?auto_396632 ?auto_396641 ) ) ( not ( = ?auto_396632 ?auto_396642 ) ) ( not ( = ?auto_396632 ?auto_396643 ) ) ( not ( = ?auto_396633 ?auto_396634 ) ) ( not ( = ?auto_396633 ?auto_396635 ) ) ( not ( = ?auto_396633 ?auto_396636 ) ) ( not ( = ?auto_396633 ?auto_396637 ) ) ( not ( = ?auto_396633 ?auto_396638 ) ) ( not ( = ?auto_396633 ?auto_396639 ) ) ( not ( = ?auto_396633 ?auto_396640 ) ) ( not ( = ?auto_396633 ?auto_396641 ) ) ( not ( = ?auto_396633 ?auto_396642 ) ) ( not ( = ?auto_396633 ?auto_396643 ) ) ( not ( = ?auto_396634 ?auto_396635 ) ) ( not ( = ?auto_396634 ?auto_396636 ) ) ( not ( = ?auto_396634 ?auto_396637 ) ) ( not ( = ?auto_396634 ?auto_396638 ) ) ( not ( = ?auto_396634 ?auto_396639 ) ) ( not ( = ?auto_396634 ?auto_396640 ) ) ( not ( = ?auto_396634 ?auto_396641 ) ) ( not ( = ?auto_396634 ?auto_396642 ) ) ( not ( = ?auto_396634 ?auto_396643 ) ) ( not ( = ?auto_396635 ?auto_396636 ) ) ( not ( = ?auto_396635 ?auto_396637 ) ) ( not ( = ?auto_396635 ?auto_396638 ) ) ( not ( = ?auto_396635 ?auto_396639 ) ) ( not ( = ?auto_396635 ?auto_396640 ) ) ( not ( = ?auto_396635 ?auto_396641 ) ) ( not ( = ?auto_396635 ?auto_396642 ) ) ( not ( = ?auto_396635 ?auto_396643 ) ) ( not ( = ?auto_396636 ?auto_396637 ) ) ( not ( = ?auto_396636 ?auto_396638 ) ) ( not ( = ?auto_396636 ?auto_396639 ) ) ( not ( = ?auto_396636 ?auto_396640 ) ) ( not ( = ?auto_396636 ?auto_396641 ) ) ( not ( = ?auto_396636 ?auto_396642 ) ) ( not ( = ?auto_396636 ?auto_396643 ) ) ( not ( = ?auto_396637 ?auto_396638 ) ) ( not ( = ?auto_396637 ?auto_396639 ) ) ( not ( = ?auto_396637 ?auto_396640 ) ) ( not ( = ?auto_396637 ?auto_396641 ) ) ( not ( = ?auto_396637 ?auto_396642 ) ) ( not ( = ?auto_396637 ?auto_396643 ) ) ( not ( = ?auto_396638 ?auto_396639 ) ) ( not ( = ?auto_396638 ?auto_396640 ) ) ( not ( = ?auto_396638 ?auto_396641 ) ) ( not ( = ?auto_396638 ?auto_396642 ) ) ( not ( = ?auto_396638 ?auto_396643 ) ) ( not ( = ?auto_396639 ?auto_396640 ) ) ( not ( = ?auto_396639 ?auto_396641 ) ) ( not ( = ?auto_396639 ?auto_396642 ) ) ( not ( = ?auto_396639 ?auto_396643 ) ) ( not ( = ?auto_396640 ?auto_396641 ) ) ( not ( = ?auto_396640 ?auto_396642 ) ) ( not ( = ?auto_396640 ?auto_396643 ) ) ( not ( = ?auto_396641 ?auto_396642 ) ) ( not ( = ?auto_396641 ?auto_396643 ) ) ( not ( = ?auto_396642 ?auto_396643 ) ) ( ON ?auto_396641 ?auto_396642 ) ( ON ?auto_396640 ?auto_396641 ) ( ON ?auto_396639 ?auto_396640 ) ( ON ?auto_396638 ?auto_396639 ) ( ON ?auto_396637 ?auto_396638 ) ( ON ?auto_396636 ?auto_396637 ) ( CLEAR ?auto_396634 ) ( ON ?auto_396635 ?auto_396636 ) ( CLEAR ?auto_396635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_396628 ?auto_396629 ?auto_396630 ?auto_396631 ?auto_396632 ?auto_396633 ?auto_396634 ?auto_396635 )
      ( MAKE-15PILE ?auto_396628 ?auto_396629 ?auto_396630 ?auto_396631 ?auto_396632 ?auto_396633 ?auto_396634 ?auto_396635 ?auto_396636 ?auto_396637 ?auto_396638 ?auto_396639 ?auto_396640 ?auto_396641 ?auto_396642 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396659 - BLOCK
      ?auto_396660 - BLOCK
      ?auto_396661 - BLOCK
      ?auto_396662 - BLOCK
      ?auto_396663 - BLOCK
      ?auto_396664 - BLOCK
      ?auto_396665 - BLOCK
      ?auto_396666 - BLOCK
      ?auto_396667 - BLOCK
      ?auto_396668 - BLOCK
      ?auto_396669 - BLOCK
      ?auto_396670 - BLOCK
      ?auto_396671 - BLOCK
      ?auto_396672 - BLOCK
      ?auto_396673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396673 ) ( ON-TABLE ?auto_396659 ) ( ON ?auto_396660 ?auto_396659 ) ( ON ?auto_396661 ?auto_396660 ) ( ON ?auto_396662 ?auto_396661 ) ( ON ?auto_396663 ?auto_396662 ) ( ON ?auto_396664 ?auto_396663 ) ( ON ?auto_396665 ?auto_396664 ) ( not ( = ?auto_396659 ?auto_396660 ) ) ( not ( = ?auto_396659 ?auto_396661 ) ) ( not ( = ?auto_396659 ?auto_396662 ) ) ( not ( = ?auto_396659 ?auto_396663 ) ) ( not ( = ?auto_396659 ?auto_396664 ) ) ( not ( = ?auto_396659 ?auto_396665 ) ) ( not ( = ?auto_396659 ?auto_396666 ) ) ( not ( = ?auto_396659 ?auto_396667 ) ) ( not ( = ?auto_396659 ?auto_396668 ) ) ( not ( = ?auto_396659 ?auto_396669 ) ) ( not ( = ?auto_396659 ?auto_396670 ) ) ( not ( = ?auto_396659 ?auto_396671 ) ) ( not ( = ?auto_396659 ?auto_396672 ) ) ( not ( = ?auto_396659 ?auto_396673 ) ) ( not ( = ?auto_396660 ?auto_396661 ) ) ( not ( = ?auto_396660 ?auto_396662 ) ) ( not ( = ?auto_396660 ?auto_396663 ) ) ( not ( = ?auto_396660 ?auto_396664 ) ) ( not ( = ?auto_396660 ?auto_396665 ) ) ( not ( = ?auto_396660 ?auto_396666 ) ) ( not ( = ?auto_396660 ?auto_396667 ) ) ( not ( = ?auto_396660 ?auto_396668 ) ) ( not ( = ?auto_396660 ?auto_396669 ) ) ( not ( = ?auto_396660 ?auto_396670 ) ) ( not ( = ?auto_396660 ?auto_396671 ) ) ( not ( = ?auto_396660 ?auto_396672 ) ) ( not ( = ?auto_396660 ?auto_396673 ) ) ( not ( = ?auto_396661 ?auto_396662 ) ) ( not ( = ?auto_396661 ?auto_396663 ) ) ( not ( = ?auto_396661 ?auto_396664 ) ) ( not ( = ?auto_396661 ?auto_396665 ) ) ( not ( = ?auto_396661 ?auto_396666 ) ) ( not ( = ?auto_396661 ?auto_396667 ) ) ( not ( = ?auto_396661 ?auto_396668 ) ) ( not ( = ?auto_396661 ?auto_396669 ) ) ( not ( = ?auto_396661 ?auto_396670 ) ) ( not ( = ?auto_396661 ?auto_396671 ) ) ( not ( = ?auto_396661 ?auto_396672 ) ) ( not ( = ?auto_396661 ?auto_396673 ) ) ( not ( = ?auto_396662 ?auto_396663 ) ) ( not ( = ?auto_396662 ?auto_396664 ) ) ( not ( = ?auto_396662 ?auto_396665 ) ) ( not ( = ?auto_396662 ?auto_396666 ) ) ( not ( = ?auto_396662 ?auto_396667 ) ) ( not ( = ?auto_396662 ?auto_396668 ) ) ( not ( = ?auto_396662 ?auto_396669 ) ) ( not ( = ?auto_396662 ?auto_396670 ) ) ( not ( = ?auto_396662 ?auto_396671 ) ) ( not ( = ?auto_396662 ?auto_396672 ) ) ( not ( = ?auto_396662 ?auto_396673 ) ) ( not ( = ?auto_396663 ?auto_396664 ) ) ( not ( = ?auto_396663 ?auto_396665 ) ) ( not ( = ?auto_396663 ?auto_396666 ) ) ( not ( = ?auto_396663 ?auto_396667 ) ) ( not ( = ?auto_396663 ?auto_396668 ) ) ( not ( = ?auto_396663 ?auto_396669 ) ) ( not ( = ?auto_396663 ?auto_396670 ) ) ( not ( = ?auto_396663 ?auto_396671 ) ) ( not ( = ?auto_396663 ?auto_396672 ) ) ( not ( = ?auto_396663 ?auto_396673 ) ) ( not ( = ?auto_396664 ?auto_396665 ) ) ( not ( = ?auto_396664 ?auto_396666 ) ) ( not ( = ?auto_396664 ?auto_396667 ) ) ( not ( = ?auto_396664 ?auto_396668 ) ) ( not ( = ?auto_396664 ?auto_396669 ) ) ( not ( = ?auto_396664 ?auto_396670 ) ) ( not ( = ?auto_396664 ?auto_396671 ) ) ( not ( = ?auto_396664 ?auto_396672 ) ) ( not ( = ?auto_396664 ?auto_396673 ) ) ( not ( = ?auto_396665 ?auto_396666 ) ) ( not ( = ?auto_396665 ?auto_396667 ) ) ( not ( = ?auto_396665 ?auto_396668 ) ) ( not ( = ?auto_396665 ?auto_396669 ) ) ( not ( = ?auto_396665 ?auto_396670 ) ) ( not ( = ?auto_396665 ?auto_396671 ) ) ( not ( = ?auto_396665 ?auto_396672 ) ) ( not ( = ?auto_396665 ?auto_396673 ) ) ( not ( = ?auto_396666 ?auto_396667 ) ) ( not ( = ?auto_396666 ?auto_396668 ) ) ( not ( = ?auto_396666 ?auto_396669 ) ) ( not ( = ?auto_396666 ?auto_396670 ) ) ( not ( = ?auto_396666 ?auto_396671 ) ) ( not ( = ?auto_396666 ?auto_396672 ) ) ( not ( = ?auto_396666 ?auto_396673 ) ) ( not ( = ?auto_396667 ?auto_396668 ) ) ( not ( = ?auto_396667 ?auto_396669 ) ) ( not ( = ?auto_396667 ?auto_396670 ) ) ( not ( = ?auto_396667 ?auto_396671 ) ) ( not ( = ?auto_396667 ?auto_396672 ) ) ( not ( = ?auto_396667 ?auto_396673 ) ) ( not ( = ?auto_396668 ?auto_396669 ) ) ( not ( = ?auto_396668 ?auto_396670 ) ) ( not ( = ?auto_396668 ?auto_396671 ) ) ( not ( = ?auto_396668 ?auto_396672 ) ) ( not ( = ?auto_396668 ?auto_396673 ) ) ( not ( = ?auto_396669 ?auto_396670 ) ) ( not ( = ?auto_396669 ?auto_396671 ) ) ( not ( = ?auto_396669 ?auto_396672 ) ) ( not ( = ?auto_396669 ?auto_396673 ) ) ( not ( = ?auto_396670 ?auto_396671 ) ) ( not ( = ?auto_396670 ?auto_396672 ) ) ( not ( = ?auto_396670 ?auto_396673 ) ) ( not ( = ?auto_396671 ?auto_396672 ) ) ( not ( = ?auto_396671 ?auto_396673 ) ) ( not ( = ?auto_396672 ?auto_396673 ) ) ( ON ?auto_396672 ?auto_396673 ) ( ON ?auto_396671 ?auto_396672 ) ( ON ?auto_396670 ?auto_396671 ) ( ON ?auto_396669 ?auto_396670 ) ( ON ?auto_396668 ?auto_396669 ) ( ON ?auto_396667 ?auto_396668 ) ( CLEAR ?auto_396665 ) ( ON ?auto_396666 ?auto_396667 ) ( CLEAR ?auto_396666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_396659 ?auto_396660 ?auto_396661 ?auto_396662 ?auto_396663 ?auto_396664 ?auto_396665 ?auto_396666 )
      ( MAKE-15PILE ?auto_396659 ?auto_396660 ?auto_396661 ?auto_396662 ?auto_396663 ?auto_396664 ?auto_396665 ?auto_396666 ?auto_396667 ?auto_396668 ?auto_396669 ?auto_396670 ?auto_396671 ?auto_396672 ?auto_396673 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396689 - BLOCK
      ?auto_396690 - BLOCK
      ?auto_396691 - BLOCK
      ?auto_396692 - BLOCK
      ?auto_396693 - BLOCK
      ?auto_396694 - BLOCK
      ?auto_396695 - BLOCK
      ?auto_396696 - BLOCK
      ?auto_396697 - BLOCK
      ?auto_396698 - BLOCK
      ?auto_396699 - BLOCK
      ?auto_396700 - BLOCK
      ?auto_396701 - BLOCK
      ?auto_396702 - BLOCK
      ?auto_396703 - BLOCK
    )
    :vars
    (
      ?auto_396704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396703 ?auto_396704 ) ( ON-TABLE ?auto_396689 ) ( ON ?auto_396690 ?auto_396689 ) ( ON ?auto_396691 ?auto_396690 ) ( ON ?auto_396692 ?auto_396691 ) ( ON ?auto_396693 ?auto_396692 ) ( ON ?auto_396694 ?auto_396693 ) ( not ( = ?auto_396689 ?auto_396690 ) ) ( not ( = ?auto_396689 ?auto_396691 ) ) ( not ( = ?auto_396689 ?auto_396692 ) ) ( not ( = ?auto_396689 ?auto_396693 ) ) ( not ( = ?auto_396689 ?auto_396694 ) ) ( not ( = ?auto_396689 ?auto_396695 ) ) ( not ( = ?auto_396689 ?auto_396696 ) ) ( not ( = ?auto_396689 ?auto_396697 ) ) ( not ( = ?auto_396689 ?auto_396698 ) ) ( not ( = ?auto_396689 ?auto_396699 ) ) ( not ( = ?auto_396689 ?auto_396700 ) ) ( not ( = ?auto_396689 ?auto_396701 ) ) ( not ( = ?auto_396689 ?auto_396702 ) ) ( not ( = ?auto_396689 ?auto_396703 ) ) ( not ( = ?auto_396689 ?auto_396704 ) ) ( not ( = ?auto_396690 ?auto_396691 ) ) ( not ( = ?auto_396690 ?auto_396692 ) ) ( not ( = ?auto_396690 ?auto_396693 ) ) ( not ( = ?auto_396690 ?auto_396694 ) ) ( not ( = ?auto_396690 ?auto_396695 ) ) ( not ( = ?auto_396690 ?auto_396696 ) ) ( not ( = ?auto_396690 ?auto_396697 ) ) ( not ( = ?auto_396690 ?auto_396698 ) ) ( not ( = ?auto_396690 ?auto_396699 ) ) ( not ( = ?auto_396690 ?auto_396700 ) ) ( not ( = ?auto_396690 ?auto_396701 ) ) ( not ( = ?auto_396690 ?auto_396702 ) ) ( not ( = ?auto_396690 ?auto_396703 ) ) ( not ( = ?auto_396690 ?auto_396704 ) ) ( not ( = ?auto_396691 ?auto_396692 ) ) ( not ( = ?auto_396691 ?auto_396693 ) ) ( not ( = ?auto_396691 ?auto_396694 ) ) ( not ( = ?auto_396691 ?auto_396695 ) ) ( not ( = ?auto_396691 ?auto_396696 ) ) ( not ( = ?auto_396691 ?auto_396697 ) ) ( not ( = ?auto_396691 ?auto_396698 ) ) ( not ( = ?auto_396691 ?auto_396699 ) ) ( not ( = ?auto_396691 ?auto_396700 ) ) ( not ( = ?auto_396691 ?auto_396701 ) ) ( not ( = ?auto_396691 ?auto_396702 ) ) ( not ( = ?auto_396691 ?auto_396703 ) ) ( not ( = ?auto_396691 ?auto_396704 ) ) ( not ( = ?auto_396692 ?auto_396693 ) ) ( not ( = ?auto_396692 ?auto_396694 ) ) ( not ( = ?auto_396692 ?auto_396695 ) ) ( not ( = ?auto_396692 ?auto_396696 ) ) ( not ( = ?auto_396692 ?auto_396697 ) ) ( not ( = ?auto_396692 ?auto_396698 ) ) ( not ( = ?auto_396692 ?auto_396699 ) ) ( not ( = ?auto_396692 ?auto_396700 ) ) ( not ( = ?auto_396692 ?auto_396701 ) ) ( not ( = ?auto_396692 ?auto_396702 ) ) ( not ( = ?auto_396692 ?auto_396703 ) ) ( not ( = ?auto_396692 ?auto_396704 ) ) ( not ( = ?auto_396693 ?auto_396694 ) ) ( not ( = ?auto_396693 ?auto_396695 ) ) ( not ( = ?auto_396693 ?auto_396696 ) ) ( not ( = ?auto_396693 ?auto_396697 ) ) ( not ( = ?auto_396693 ?auto_396698 ) ) ( not ( = ?auto_396693 ?auto_396699 ) ) ( not ( = ?auto_396693 ?auto_396700 ) ) ( not ( = ?auto_396693 ?auto_396701 ) ) ( not ( = ?auto_396693 ?auto_396702 ) ) ( not ( = ?auto_396693 ?auto_396703 ) ) ( not ( = ?auto_396693 ?auto_396704 ) ) ( not ( = ?auto_396694 ?auto_396695 ) ) ( not ( = ?auto_396694 ?auto_396696 ) ) ( not ( = ?auto_396694 ?auto_396697 ) ) ( not ( = ?auto_396694 ?auto_396698 ) ) ( not ( = ?auto_396694 ?auto_396699 ) ) ( not ( = ?auto_396694 ?auto_396700 ) ) ( not ( = ?auto_396694 ?auto_396701 ) ) ( not ( = ?auto_396694 ?auto_396702 ) ) ( not ( = ?auto_396694 ?auto_396703 ) ) ( not ( = ?auto_396694 ?auto_396704 ) ) ( not ( = ?auto_396695 ?auto_396696 ) ) ( not ( = ?auto_396695 ?auto_396697 ) ) ( not ( = ?auto_396695 ?auto_396698 ) ) ( not ( = ?auto_396695 ?auto_396699 ) ) ( not ( = ?auto_396695 ?auto_396700 ) ) ( not ( = ?auto_396695 ?auto_396701 ) ) ( not ( = ?auto_396695 ?auto_396702 ) ) ( not ( = ?auto_396695 ?auto_396703 ) ) ( not ( = ?auto_396695 ?auto_396704 ) ) ( not ( = ?auto_396696 ?auto_396697 ) ) ( not ( = ?auto_396696 ?auto_396698 ) ) ( not ( = ?auto_396696 ?auto_396699 ) ) ( not ( = ?auto_396696 ?auto_396700 ) ) ( not ( = ?auto_396696 ?auto_396701 ) ) ( not ( = ?auto_396696 ?auto_396702 ) ) ( not ( = ?auto_396696 ?auto_396703 ) ) ( not ( = ?auto_396696 ?auto_396704 ) ) ( not ( = ?auto_396697 ?auto_396698 ) ) ( not ( = ?auto_396697 ?auto_396699 ) ) ( not ( = ?auto_396697 ?auto_396700 ) ) ( not ( = ?auto_396697 ?auto_396701 ) ) ( not ( = ?auto_396697 ?auto_396702 ) ) ( not ( = ?auto_396697 ?auto_396703 ) ) ( not ( = ?auto_396697 ?auto_396704 ) ) ( not ( = ?auto_396698 ?auto_396699 ) ) ( not ( = ?auto_396698 ?auto_396700 ) ) ( not ( = ?auto_396698 ?auto_396701 ) ) ( not ( = ?auto_396698 ?auto_396702 ) ) ( not ( = ?auto_396698 ?auto_396703 ) ) ( not ( = ?auto_396698 ?auto_396704 ) ) ( not ( = ?auto_396699 ?auto_396700 ) ) ( not ( = ?auto_396699 ?auto_396701 ) ) ( not ( = ?auto_396699 ?auto_396702 ) ) ( not ( = ?auto_396699 ?auto_396703 ) ) ( not ( = ?auto_396699 ?auto_396704 ) ) ( not ( = ?auto_396700 ?auto_396701 ) ) ( not ( = ?auto_396700 ?auto_396702 ) ) ( not ( = ?auto_396700 ?auto_396703 ) ) ( not ( = ?auto_396700 ?auto_396704 ) ) ( not ( = ?auto_396701 ?auto_396702 ) ) ( not ( = ?auto_396701 ?auto_396703 ) ) ( not ( = ?auto_396701 ?auto_396704 ) ) ( not ( = ?auto_396702 ?auto_396703 ) ) ( not ( = ?auto_396702 ?auto_396704 ) ) ( not ( = ?auto_396703 ?auto_396704 ) ) ( ON ?auto_396702 ?auto_396703 ) ( ON ?auto_396701 ?auto_396702 ) ( ON ?auto_396700 ?auto_396701 ) ( ON ?auto_396699 ?auto_396700 ) ( ON ?auto_396698 ?auto_396699 ) ( ON ?auto_396697 ?auto_396698 ) ( ON ?auto_396696 ?auto_396697 ) ( CLEAR ?auto_396694 ) ( ON ?auto_396695 ?auto_396696 ) ( CLEAR ?auto_396695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_396689 ?auto_396690 ?auto_396691 ?auto_396692 ?auto_396693 ?auto_396694 ?auto_396695 )
      ( MAKE-15PILE ?auto_396689 ?auto_396690 ?auto_396691 ?auto_396692 ?auto_396693 ?auto_396694 ?auto_396695 ?auto_396696 ?auto_396697 ?auto_396698 ?auto_396699 ?auto_396700 ?auto_396701 ?auto_396702 ?auto_396703 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396720 - BLOCK
      ?auto_396721 - BLOCK
      ?auto_396722 - BLOCK
      ?auto_396723 - BLOCK
      ?auto_396724 - BLOCK
      ?auto_396725 - BLOCK
      ?auto_396726 - BLOCK
      ?auto_396727 - BLOCK
      ?auto_396728 - BLOCK
      ?auto_396729 - BLOCK
      ?auto_396730 - BLOCK
      ?auto_396731 - BLOCK
      ?auto_396732 - BLOCK
      ?auto_396733 - BLOCK
      ?auto_396734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396734 ) ( ON-TABLE ?auto_396720 ) ( ON ?auto_396721 ?auto_396720 ) ( ON ?auto_396722 ?auto_396721 ) ( ON ?auto_396723 ?auto_396722 ) ( ON ?auto_396724 ?auto_396723 ) ( ON ?auto_396725 ?auto_396724 ) ( not ( = ?auto_396720 ?auto_396721 ) ) ( not ( = ?auto_396720 ?auto_396722 ) ) ( not ( = ?auto_396720 ?auto_396723 ) ) ( not ( = ?auto_396720 ?auto_396724 ) ) ( not ( = ?auto_396720 ?auto_396725 ) ) ( not ( = ?auto_396720 ?auto_396726 ) ) ( not ( = ?auto_396720 ?auto_396727 ) ) ( not ( = ?auto_396720 ?auto_396728 ) ) ( not ( = ?auto_396720 ?auto_396729 ) ) ( not ( = ?auto_396720 ?auto_396730 ) ) ( not ( = ?auto_396720 ?auto_396731 ) ) ( not ( = ?auto_396720 ?auto_396732 ) ) ( not ( = ?auto_396720 ?auto_396733 ) ) ( not ( = ?auto_396720 ?auto_396734 ) ) ( not ( = ?auto_396721 ?auto_396722 ) ) ( not ( = ?auto_396721 ?auto_396723 ) ) ( not ( = ?auto_396721 ?auto_396724 ) ) ( not ( = ?auto_396721 ?auto_396725 ) ) ( not ( = ?auto_396721 ?auto_396726 ) ) ( not ( = ?auto_396721 ?auto_396727 ) ) ( not ( = ?auto_396721 ?auto_396728 ) ) ( not ( = ?auto_396721 ?auto_396729 ) ) ( not ( = ?auto_396721 ?auto_396730 ) ) ( not ( = ?auto_396721 ?auto_396731 ) ) ( not ( = ?auto_396721 ?auto_396732 ) ) ( not ( = ?auto_396721 ?auto_396733 ) ) ( not ( = ?auto_396721 ?auto_396734 ) ) ( not ( = ?auto_396722 ?auto_396723 ) ) ( not ( = ?auto_396722 ?auto_396724 ) ) ( not ( = ?auto_396722 ?auto_396725 ) ) ( not ( = ?auto_396722 ?auto_396726 ) ) ( not ( = ?auto_396722 ?auto_396727 ) ) ( not ( = ?auto_396722 ?auto_396728 ) ) ( not ( = ?auto_396722 ?auto_396729 ) ) ( not ( = ?auto_396722 ?auto_396730 ) ) ( not ( = ?auto_396722 ?auto_396731 ) ) ( not ( = ?auto_396722 ?auto_396732 ) ) ( not ( = ?auto_396722 ?auto_396733 ) ) ( not ( = ?auto_396722 ?auto_396734 ) ) ( not ( = ?auto_396723 ?auto_396724 ) ) ( not ( = ?auto_396723 ?auto_396725 ) ) ( not ( = ?auto_396723 ?auto_396726 ) ) ( not ( = ?auto_396723 ?auto_396727 ) ) ( not ( = ?auto_396723 ?auto_396728 ) ) ( not ( = ?auto_396723 ?auto_396729 ) ) ( not ( = ?auto_396723 ?auto_396730 ) ) ( not ( = ?auto_396723 ?auto_396731 ) ) ( not ( = ?auto_396723 ?auto_396732 ) ) ( not ( = ?auto_396723 ?auto_396733 ) ) ( not ( = ?auto_396723 ?auto_396734 ) ) ( not ( = ?auto_396724 ?auto_396725 ) ) ( not ( = ?auto_396724 ?auto_396726 ) ) ( not ( = ?auto_396724 ?auto_396727 ) ) ( not ( = ?auto_396724 ?auto_396728 ) ) ( not ( = ?auto_396724 ?auto_396729 ) ) ( not ( = ?auto_396724 ?auto_396730 ) ) ( not ( = ?auto_396724 ?auto_396731 ) ) ( not ( = ?auto_396724 ?auto_396732 ) ) ( not ( = ?auto_396724 ?auto_396733 ) ) ( not ( = ?auto_396724 ?auto_396734 ) ) ( not ( = ?auto_396725 ?auto_396726 ) ) ( not ( = ?auto_396725 ?auto_396727 ) ) ( not ( = ?auto_396725 ?auto_396728 ) ) ( not ( = ?auto_396725 ?auto_396729 ) ) ( not ( = ?auto_396725 ?auto_396730 ) ) ( not ( = ?auto_396725 ?auto_396731 ) ) ( not ( = ?auto_396725 ?auto_396732 ) ) ( not ( = ?auto_396725 ?auto_396733 ) ) ( not ( = ?auto_396725 ?auto_396734 ) ) ( not ( = ?auto_396726 ?auto_396727 ) ) ( not ( = ?auto_396726 ?auto_396728 ) ) ( not ( = ?auto_396726 ?auto_396729 ) ) ( not ( = ?auto_396726 ?auto_396730 ) ) ( not ( = ?auto_396726 ?auto_396731 ) ) ( not ( = ?auto_396726 ?auto_396732 ) ) ( not ( = ?auto_396726 ?auto_396733 ) ) ( not ( = ?auto_396726 ?auto_396734 ) ) ( not ( = ?auto_396727 ?auto_396728 ) ) ( not ( = ?auto_396727 ?auto_396729 ) ) ( not ( = ?auto_396727 ?auto_396730 ) ) ( not ( = ?auto_396727 ?auto_396731 ) ) ( not ( = ?auto_396727 ?auto_396732 ) ) ( not ( = ?auto_396727 ?auto_396733 ) ) ( not ( = ?auto_396727 ?auto_396734 ) ) ( not ( = ?auto_396728 ?auto_396729 ) ) ( not ( = ?auto_396728 ?auto_396730 ) ) ( not ( = ?auto_396728 ?auto_396731 ) ) ( not ( = ?auto_396728 ?auto_396732 ) ) ( not ( = ?auto_396728 ?auto_396733 ) ) ( not ( = ?auto_396728 ?auto_396734 ) ) ( not ( = ?auto_396729 ?auto_396730 ) ) ( not ( = ?auto_396729 ?auto_396731 ) ) ( not ( = ?auto_396729 ?auto_396732 ) ) ( not ( = ?auto_396729 ?auto_396733 ) ) ( not ( = ?auto_396729 ?auto_396734 ) ) ( not ( = ?auto_396730 ?auto_396731 ) ) ( not ( = ?auto_396730 ?auto_396732 ) ) ( not ( = ?auto_396730 ?auto_396733 ) ) ( not ( = ?auto_396730 ?auto_396734 ) ) ( not ( = ?auto_396731 ?auto_396732 ) ) ( not ( = ?auto_396731 ?auto_396733 ) ) ( not ( = ?auto_396731 ?auto_396734 ) ) ( not ( = ?auto_396732 ?auto_396733 ) ) ( not ( = ?auto_396732 ?auto_396734 ) ) ( not ( = ?auto_396733 ?auto_396734 ) ) ( ON ?auto_396733 ?auto_396734 ) ( ON ?auto_396732 ?auto_396733 ) ( ON ?auto_396731 ?auto_396732 ) ( ON ?auto_396730 ?auto_396731 ) ( ON ?auto_396729 ?auto_396730 ) ( ON ?auto_396728 ?auto_396729 ) ( ON ?auto_396727 ?auto_396728 ) ( CLEAR ?auto_396725 ) ( ON ?auto_396726 ?auto_396727 ) ( CLEAR ?auto_396726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_396720 ?auto_396721 ?auto_396722 ?auto_396723 ?auto_396724 ?auto_396725 ?auto_396726 )
      ( MAKE-15PILE ?auto_396720 ?auto_396721 ?auto_396722 ?auto_396723 ?auto_396724 ?auto_396725 ?auto_396726 ?auto_396727 ?auto_396728 ?auto_396729 ?auto_396730 ?auto_396731 ?auto_396732 ?auto_396733 ?auto_396734 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396750 - BLOCK
      ?auto_396751 - BLOCK
      ?auto_396752 - BLOCK
      ?auto_396753 - BLOCK
      ?auto_396754 - BLOCK
      ?auto_396755 - BLOCK
      ?auto_396756 - BLOCK
      ?auto_396757 - BLOCK
      ?auto_396758 - BLOCK
      ?auto_396759 - BLOCK
      ?auto_396760 - BLOCK
      ?auto_396761 - BLOCK
      ?auto_396762 - BLOCK
      ?auto_396763 - BLOCK
      ?auto_396764 - BLOCK
    )
    :vars
    (
      ?auto_396765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396764 ?auto_396765 ) ( ON-TABLE ?auto_396750 ) ( ON ?auto_396751 ?auto_396750 ) ( ON ?auto_396752 ?auto_396751 ) ( ON ?auto_396753 ?auto_396752 ) ( ON ?auto_396754 ?auto_396753 ) ( not ( = ?auto_396750 ?auto_396751 ) ) ( not ( = ?auto_396750 ?auto_396752 ) ) ( not ( = ?auto_396750 ?auto_396753 ) ) ( not ( = ?auto_396750 ?auto_396754 ) ) ( not ( = ?auto_396750 ?auto_396755 ) ) ( not ( = ?auto_396750 ?auto_396756 ) ) ( not ( = ?auto_396750 ?auto_396757 ) ) ( not ( = ?auto_396750 ?auto_396758 ) ) ( not ( = ?auto_396750 ?auto_396759 ) ) ( not ( = ?auto_396750 ?auto_396760 ) ) ( not ( = ?auto_396750 ?auto_396761 ) ) ( not ( = ?auto_396750 ?auto_396762 ) ) ( not ( = ?auto_396750 ?auto_396763 ) ) ( not ( = ?auto_396750 ?auto_396764 ) ) ( not ( = ?auto_396750 ?auto_396765 ) ) ( not ( = ?auto_396751 ?auto_396752 ) ) ( not ( = ?auto_396751 ?auto_396753 ) ) ( not ( = ?auto_396751 ?auto_396754 ) ) ( not ( = ?auto_396751 ?auto_396755 ) ) ( not ( = ?auto_396751 ?auto_396756 ) ) ( not ( = ?auto_396751 ?auto_396757 ) ) ( not ( = ?auto_396751 ?auto_396758 ) ) ( not ( = ?auto_396751 ?auto_396759 ) ) ( not ( = ?auto_396751 ?auto_396760 ) ) ( not ( = ?auto_396751 ?auto_396761 ) ) ( not ( = ?auto_396751 ?auto_396762 ) ) ( not ( = ?auto_396751 ?auto_396763 ) ) ( not ( = ?auto_396751 ?auto_396764 ) ) ( not ( = ?auto_396751 ?auto_396765 ) ) ( not ( = ?auto_396752 ?auto_396753 ) ) ( not ( = ?auto_396752 ?auto_396754 ) ) ( not ( = ?auto_396752 ?auto_396755 ) ) ( not ( = ?auto_396752 ?auto_396756 ) ) ( not ( = ?auto_396752 ?auto_396757 ) ) ( not ( = ?auto_396752 ?auto_396758 ) ) ( not ( = ?auto_396752 ?auto_396759 ) ) ( not ( = ?auto_396752 ?auto_396760 ) ) ( not ( = ?auto_396752 ?auto_396761 ) ) ( not ( = ?auto_396752 ?auto_396762 ) ) ( not ( = ?auto_396752 ?auto_396763 ) ) ( not ( = ?auto_396752 ?auto_396764 ) ) ( not ( = ?auto_396752 ?auto_396765 ) ) ( not ( = ?auto_396753 ?auto_396754 ) ) ( not ( = ?auto_396753 ?auto_396755 ) ) ( not ( = ?auto_396753 ?auto_396756 ) ) ( not ( = ?auto_396753 ?auto_396757 ) ) ( not ( = ?auto_396753 ?auto_396758 ) ) ( not ( = ?auto_396753 ?auto_396759 ) ) ( not ( = ?auto_396753 ?auto_396760 ) ) ( not ( = ?auto_396753 ?auto_396761 ) ) ( not ( = ?auto_396753 ?auto_396762 ) ) ( not ( = ?auto_396753 ?auto_396763 ) ) ( not ( = ?auto_396753 ?auto_396764 ) ) ( not ( = ?auto_396753 ?auto_396765 ) ) ( not ( = ?auto_396754 ?auto_396755 ) ) ( not ( = ?auto_396754 ?auto_396756 ) ) ( not ( = ?auto_396754 ?auto_396757 ) ) ( not ( = ?auto_396754 ?auto_396758 ) ) ( not ( = ?auto_396754 ?auto_396759 ) ) ( not ( = ?auto_396754 ?auto_396760 ) ) ( not ( = ?auto_396754 ?auto_396761 ) ) ( not ( = ?auto_396754 ?auto_396762 ) ) ( not ( = ?auto_396754 ?auto_396763 ) ) ( not ( = ?auto_396754 ?auto_396764 ) ) ( not ( = ?auto_396754 ?auto_396765 ) ) ( not ( = ?auto_396755 ?auto_396756 ) ) ( not ( = ?auto_396755 ?auto_396757 ) ) ( not ( = ?auto_396755 ?auto_396758 ) ) ( not ( = ?auto_396755 ?auto_396759 ) ) ( not ( = ?auto_396755 ?auto_396760 ) ) ( not ( = ?auto_396755 ?auto_396761 ) ) ( not ( = ?auto_396755 ?auto_396762 ) ) ( not ( = ?auto_396755 ?auto_396763 ) ) ( not ( = ?auto_396755 ?auto_396764 ) ) ( not ( = ?auto_396755 ?auto_396765 ) ) ( not ( = ?auto_396756 ?auto_396757 ) ) ( not ( = ?auto_396756 ?auto_396758 ) ) ( not ( = ?auto_396756 ?auto_396759 ) ) ( not ( = ?auto_396756 ?auto_396760 ) ) ( not ( = ?auto_396756 ?auto_396761 ) ) ( not ( = ?auto_396756 ?auto_396762 ) ) ( not ( = ?auto_396756 ?auto_396763 ) ) ( not ( = ?auto_396756 ?auto_396764 ) ) ( not ( = ?auto_396756 ?auto_396765 ) ) ( not ( = ?auto_396757 ?auto_396758 ) ) ( not ( = ?auto_396757 ?auto_396759 ) ) ( not ( = ?auto_396757 ?auto_396760 ) ) ( not ( = ?auto_396757 ?auto_396761 ) ) ( not ( = ?auto_396757 ?auto_396762 ) ) ( not ( = ?auto_396757 ?auto_396763 ) ) ( not ( = ?auto_396757 ?auto_396764 ) ) ( not ( = ?auto_396757 ?auto_396765 ) ) ( not ( = ?auto_396758 ?auto_396759 ) ) ( not ( = ?auto_396758 ?auto_396760 ) ) ( not ( = ?auto_396758 ?auto_396761 ) ) ( not ( = ?auto_396758 ?auto_396762 ) ) ( not ( = ?auto_396758 ?auto_396763 ) ) ( not ( = ?auto_396758 ?auto_396764 ) ) ( not ( = ?auto_396758 ?auto_396765 ) ) ( not ( = ?auto_396759 ?auto_396760 ) ) ( not ( = ?auto_396759 ?auto_396761 ) ) ( not ( = ?auto_396759 ?auto_396762 ) ) ( not ( = ?auto_396759 ?auto_396763 ) ) ( not ( = ?auto_396759 ?auto_396764 ) ) ( not ( = ?auto_396759 ?auto_396765 ) ) ( not ( = ?auto_396760 ?auto_396761 ) ) ( not ( = ?auto_396760 ?auto_396762 ) ) ( not ( = ?auto_396760 ?auto_396763 ) ) ( not ( = ?auto_396760 ?auto_396764 ) ) ( not ( = ?auto_396760 ?auto_396765 ) ) ( not ( = ?auto_396761 ?auto_396762 ) ) ( not ( = ?auto_396761 ?auto_396763 ) ) ( not ( = ?auto_396761 ?auto_396764 ) ) ( not ( = ?auto_396761 ?auto_396765 ) ) ( not ( = ?auto_396762 ?auto_396763 ) ) ( not ( = ?auto_396762 ?auto_396764 ) ) ( not ( = ?auto_396762 ?auto_396765 ) ) ( not ( = ?auto_396763 ?auto_396764 ) ) ( not ( = ?auto_396763 ?auto_396765 ) ) ( not ( = ?auto_396764 ?auto_396765 ) ) ( ON ?auto_396763 ?auto_396764 ) ( ON ?auto_396762 ?auto_396763 ) ( ON ?auto_396761 ?auto_396762 ) ( ON ?auto_396760 ?auto_396761 ) ( ON ?auto_396759 ?auto_396760 ) ( ON ?auto_396758 ?auto_396759 ) ( ON ?auto_396757 ?auto_396758 ) ( ON ?auto_396756 ?auto_396757 ) ( CLEAR ?auto_396754 ) ( ON ?auto_396755 ?auto_396756 ) ( CLEAR ?auto_396755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_396750 ?auto_396751 ?auto_396752 ?auto_396753 ?auto_396754 ?auto_396755 )
      ( MAKE-15PILE ?auto_396750 ?auto_396751 ?auto_396752 ?auto_396753 ?auto_396754 ?auto_396755 ?auto_396756 ?auto_396757 ?auto_396758 ?auto_396759 ?auto_396760 ?auto_396761 ?auto_396762 ?auto_396763 ?auto_396764 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396781 - BLOCK
      ?auto_396782 - BLOCK
      ?auto_396783 - BLOCK
      ?auto_396784 - BLOCK
      ?auto_396785 - BLOCK
      ?auto_396786 - BLOCK
      ?auto_396787 - BLOCK
      ?auto_396788 - BLOCK
      ?auto_396789 - BLOCK
      ?auto_396790 - BLOCK
      ?auto_396791 - BLOCK
      ?auto_396792 - BLOCK
      ?auto_396793 - BLOCK
      ?auto_396794 - BLOCK
      ?auto_396795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396795 ) ( ON-TABLE ?auto_396781 ) ( ON ?auto_396782 ?auto_396781 ) ( ON ?auto_396783 ?auto_396782 ) ( ON ?auto_396784 ?auto_396783 ) ( ON ?auto_396785 ?auto_396784 ) ( not ( = ?auto_396781 ?auto_396782 ) ) ( not ( = ?auto_396781 ?auto_396783 ) ) ( not ( = ?auto_396781 ?auto_396784 ) ) ( not ( = ?auto_396781 ?auto_396785 ) ) ( not ( = ?auto_396781 ?auto_396786 ) ) ( not ( = ?auto_396781 ?auto_396787 ) ) ( not ( = ?auto_396781 ?auto_396788 ) ) ( not ( = ?auto_396781 ?auto_396789 ) ) ( not ( = ?auto_396781 ?auto_396790 ) ) ( not ( = ?auto_396781 ?auto_396791 ) ) ( not ( = ?auto_396781 ?auto_396792 ) ) ( not ( = ?auto_396781 ?auto_396793 ) ) ( not ( = ?auto_396781 ?auto_396794 ) ) ( not ( = ?auto_396781 ?auto_396795 ) ) ( not ( = ?auto_396782 ?auto_396783 ) ) ( not ( = ?auto_396782 ?auto_396784 ) ) ( not ( = ?auto_396782 ?auto_396785 ) ) ( not ( = ?auto_396782 ?auto_396786 ) ) ( not ( = ?auto_396782 ?auto_396787 ) ) ( not ( = ?auto_396782 ?auto_396788 ) ) ( not ( = ?auto_396782 ?auto_396789 ) ) ( not ( = ?auto_396782 ?auto_396790 ) ) ( not ( = ?auto_396782 ?auto_396791 ) ) ( not ( = ?auto_396782 ?auto_396792 ) ) ( not ( = ?auto_396782 ?auto_396793 ) ) ( not ( = ?auto_396782 ?auto_396794 ) ) ( not ( = ?auto_396782 ?auto_396795 ) ) ( not ( = ?auto_396783 ?auto_396784 ) ) ( not ( = ?auto_396783 ?auto_396785 ) ) ( not ( = ?auto_396783 ?auto_396786 ) ) ( not ( = ?auto_396783 ?auto_396787 ) ) ( not ( = ?auto_396783 ?auto_396788 ) ) ( not ( = ?auto_396783 ?auto_396789 ) ) ( not ( = ?auto_396783 ?auto_396790 ) ) ( not ( = ?auto_396783 ?auto_396791 ) ) ( not ( = ?auto_396783 ?auto_396792 ) ) ( not ( = ?auto_396783 ?auto_396793 ) ) ( not ( = ?auto_396783 ?auto_396794 ) ) ( not ( = ?auto_396783 ?auto_396795 ) ) ( not ( = ?auto_396784 ?auto_396785 ) ) ( not ( = ?auto_396784 ?auto_396786 ) ) ( not ( = ?auto_396784 ?auto_396787 ) ) ( not ( = ?auto_396784 ?auto_396788 ) ) ( not ( = ?auto_396784 ?auto_396789 ) ) ( not ( = ?auto_396784 ?auto_396790 ) ) ( not ( = ?auto_396784 ?auto_396791 ) ) ( not ( = ?auto_396784 ?auto_396792 ) ) ( not ( = ?auto_396784 ?auto_396793 ) ) ( not ( = ?auto_396784 ?auto_396794 ) ) ( not ( = ?auto_396784 ?auto_396795 ) ) ( not ( = ?auto_396785 ?auto_396786 ) ) ( not ( = ?auto_396785 ?auto_396787 ) ) ( not ( = ?auto_396785 ?auto_396788 ) ) ( not ( = ?auto_396785 ?auto_396789 ) ) ( not ( = ?auto_396785 ?auto_396790 ) ) ( not ( = ?auto_396785 ?auto_396791 ) ) ( not ( = ?auto_396785 ?auto_396792 ) ) ( not ( = ?auto_396785 ?auto_396793 ) ) ( not ( = ?auto_396785 ?auto_396794 ) ) ( not ( = ?auto_396785 ?auto_396795 ) ) ( not ( = ?auto_396786 ?auto_396787 ) ) ( not ( = ?auto_396786 ?auto_396788 ) ) ( not ( = ?auto_396786 ?auto_396789 ) ) ( not ( = ?auto_396786 ?auto_396790 ) ) ( not ( = ?auto_396786 ?auto_396791 ) ) ( not ( = ?auto_396786 ?auto_396792 ) ) ( not ( = ?auto_396786 ?auto_396793 ) ) ( not ( = ?auto_396786 ?auto_396794 ) ) ( not ( = ?auto_396786 ?auto_396795 ) ) ( not ( = ?auto_396787 ?auto_396788 ) ) ( not ( = ?auto_396787 ?auto_396789 ) ) ( not ( = ?auto_396787 ?auto_396790 ) ) ( not ( = ?auto_396787 ?auto_396791 ) ) ( not ( = ?auto_396787 ?auto_396792 ) ) ( not ( = ?auto_396787 ?auto_396793 ) ) ( not ( = ?auto_396787 ?auto_396794 ) ) ( not ( = ?auto_396787 ?auto_396795 ) ) ( not ( = ?auto_396788 ?auto_396789 ) ) ( not ( = ?auto_396788 ?auto_396790 ) ) ( not ( = ?auto_396788 ?auto_396791 ) ) ( not ( = ?auto_396788 ?auto_396792 ) ) ( not ( = ?auto_396788 ?auto_396793 ) ) ( not ( = ?auto_396788 ?auto_396794 ) ) ( not ( = ?auto_396788 ?auto_396795 ) ) ( not ( = ?auto_396789 ?auto_396790 ) ) ( not ( = ?auto_396789 ?auto_396791 ) ) ( not ( = ?auto_396789 ?auto_396792 ) ) ( not ( = ?auto_396789 ?auto_396793 ) ) ( not ( = ?auto_396789 ?auto_396794 ) ) ( not ( = ?auto_396789 ?auto_396795 ) ) ( not ( = ?auto_396790 ?auto_396791 ) ) ( not ( = ?auto_396790 ?auto_396792 ) ) ( not ( = ?auto_396790 ?auto_396793 ) ) ( not ( = ?auto_396790 ?auto_396794 ) ) ( not ( = ?auto_396790 ?auto_396795 ) ) ( not ( = ?auto_396791 ?auto_396792 ) ) ( not ( = ?auto_396791 ?auto_396793 ) ) ( not ( = ?auto_396791 ?auto_396794 ) ) ( not ( = ?auto_396791 ?auto_396795 ) ) ( not ( = ?auto_396792 ?auto_396793 ) ) ( not ( = ?auto_396792 ?auto_396794 ) ) ( not ( = ?auto_396792 ?auto_396795 ) ) ( not ( = ?auto_396793 ?auto_396794 ) ) ( not ( = ?auto_396793 ?auto_396795 ) ) ( not ( = ?auto_396794 ?auto_396795 ) ) ( ON ?auto_396794 ?auto_396795 ) ( ON ?auto_396793 ?auto_396794 ) ( ON ?auto_396792 ?auto_396793 ) ( ON ?auto_396791 ?auto_396792 ) ( ON ?auto_396790 ?auto_396791 ) ( ON ?auto_396789 ?auto_396790 ) ( ON ?auto_396788 ?auto_396789 ) ( ON ?auto_396787 ?auto_396788 ) ( CLEAR ?auto_396785 ) ( ON ?auto_396786 ?auto_396787 ) ( CLEAR ?auto_396786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_396781 ?auto_396782 ?auto_396783 ?auto_396784 ?auto_396785 ?auto_396786 )
      ( MAKE-15PILE ?auto_396781 ?auto_396782 ?auto_396783 ?auto_396784 ?auto_396785 ?auto_396786 ?auto_396787 ?auto_396788 ?auto_396789 ?auto_396790 ?auto_396791 ?auto_396792 ?auto_396793 ?auto_396794 ?auto_396795 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396811 - BLOCK
      ?auto_396812 - BLOCK
      ?auto_396813 - BLOCK
      ?auto_396814 - BLOCK
      ?auto_396815 - BLOCK
      ?auto_396816 - BLOCK
      ?auto_396817 - BLOCK
      ?auto_396818 - BLOCK
      ?auto_396819 - BLOCK
      ?auto_396820 - BLOCK
      ?auto_396821 - BLOCK
      ?auto_396822 - BLOCK
      ?auto_396823 - BLOCK
      ?auto_396824 - BLOCK
      ?auto_396825 - BLOCK
    )
    :vars
    (
      ?auto_396826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396825 ?auto_396826 ) ( ON-TABLE ?auto_396811 ) ( ON ?auto_396812 ?auto_396811 ) ( ON ?auto_396813 ?auto_396812 ) ( ON ?auto_396814 ?auto_396813 ) ( not ( = ?auto_396811 ?auto_396812 ) ) ( not ( = ?auto_396811 ?auto_396813 ) ) ( not ( = ?auto_396811 ?auto_396814 ) ) ( not ( = ?auto_396811 ?auto_396815 ) ) ( not ( = ?auto_396811 ?auto_396816 ) ) ( not ( = ?auto_396811 ?auto_396817 ) ) ( not ( = ?auto_396811 ?auto_396818 ) ) ( not ( = ?auto_396811 ?auto_396819 ) ) ( not ( = ?auto_396811 ?auto_396820 ) ) ( not ( = ?auto_396811 ?auto_396821 ) ) ( not ( = ?auto_396811 ?auto_396822 ) ) ( not ( = ?auto_396811 ?auto_396823 ) ) ( not ( = ?auto_396811 ?auto_396824 ) ) ( not ( = ?auto_396811 ?auto_396825 ) ) ( not ( = ?auto_396811 ?auto_396826 ) ) ( not ( = ?auto_396812 ?auto_396813 ) ) ( not ( = ?auto_396812 ?auto_396814 ) ) ( not ( = ?auto_396812 ?auto_396815 ) ) ( not ( = ?auto_396812 ?auto_396816 ) ) ( not ( = ?auto_396812 ?auto_396817 ) ) ( not ( = ?auto_396812 ?auto_396818 ) ) ( not ( = ?auto_396812 ?auto_396819 ) ) ( not ( = ?auto_396812 ?auto_396820 ) ) ( not ( = ?auto_396812 ?auto_396821 ) ) ( not ( = ?auto_396812 ?auto_396822 ) ) ( not ( = ?auto_396812 ?auto_396823 ) ) ( not ( = ?auto_396812 ?auto_396824 ) ) ( not ( = ?auto_396812 ?auto_396825 ) ) ( not ( = ?auto_396812 ?auto_396826 ) ) ( not ( = ?auto_396813 ?auto_396814 ) ) ( not ( = ?auto_396813 ?auto_396815 ) ) ( not ( = ?auto_396813 ?auto_396816 ) ) ( not ( = ?auto_396813 ?auto_396817 ) ) ( not ( = ?auto_396813 ?auto_396818 ) ) ( not ( = ?auto_396813 ?auto_396819 ) ) ( not ( = ?auto_396813 ?auto_396820 ) ) ( not ( = ?auto_396813 ?auto_396821 ) ) ( not ( = ?auto_396813 ?auto_396822 ) ) ( not ( = ?auto_396813 ?auto_396823 ) ) ( not ( = ?auto_396813 ?auto_396824 ) ) ( not ( = ?auto_396813 ?auto_396825 ) ) ( not ( = ?auto_396813 ?auto_396826 ) ) ( not ( = ?auto_396814 ?auto_396815 ) ) ( not ( = ?auto_396814 ?auto_396816 ) ) ( not ( = ?auto_396814 ?auto_396817 ) ) ( not ( = ?auto_396814 ?auto_396818 ) ) ( not ( = ?auto_396814 ?auto_396819 ) ) ( not ( = ?auto_396814 ?auto_396820 ) ) ( not ( = ?auto_396814 ?auto_396821 ) ) ( not ( = ?auto_396814 ?auto_396822 ) ) ( not ( = ?auto_396814 ?auto_396823 ) ) ( not ( = ?auto_396814 ?auto_396824 ) ) ( not ( = ?auto_396814 ?auto_396825 ) ) ( not ( = ?auto_396814 ?auto_396826 ) ) ( not ( = ?auto_396815 ?auto_396816 ) ) ( not ( = ?auto_396815 ?auto_396817 ) ) ( not ( = ?auto_396815 ?auto_396818 ) ) ( not ( = ?auto_396815 ?auto_396819 ) ) ( not ( = ?auto_396815 ?auto_396820 ) ) ( not ( = ?auto_396815 ?auto_396821 ) ) ( not ( = ?auto_396815 ?auto_396822 ) ) ( not ( = ?auto_396815 ?auto_396823 ) ) ( not ( = ?auto_396815 ?auto_396824 ) ) ( not ( = ?auto_396815 ?auto_396825 ) ) ( not ( = ?auto_396815 ?auto_396826 ) ) ( not ( = ?auto_396816 ?auto_396817 ) ) ( not ( = ?auto_396816 ?auto_396818 ) ) ( not ( = ?auto_396816 ?auto_396819 ) ) ( not ( = ?auto_396816 ?auto_396820 ) ) ( not ( = ?auto_396816 ?auto_396821 ) ) ( not ( = ?auto_396816 ?auto_396822 ) ) ( not ( = ?auto_396816 ?auto_396823 ) ) ( not ( = ?auto_396816 ?auto_396824 ) ) ( not ( = ?auto_396816 ?auto_396825 ) ) ( not ( = ?auto_396816 ?auto_396826 ) ) ( not ( = ?auto_396817 ?auto_396818 ) ) ( not ( = ?auto_396817 ?auto_396819 ) ) ( not ( = ?auto_396817 ?auto_396820 ) ) ( not ( = ?auto_396817 ?auto_396821 ) ) ( not ( = ?auto_396817 ?auto_396822 ) ) ( not ( = ?auto_396817 ?auto_396823 ) ) ( not ( = ?auto_396817 ?auto_396824 ) ) ( not ( = ?auto_396817 ?auto_396825 ) ) ( not ( = ?auto_396817 ?auto_396826 ) ) ( not ( = ?auto_396818 ?auto_396819 ) ) ( not ( = ?auto_396818 ?auto_396820 ) ) ( not ( = ?auto_396818 ?auto_396821 ) ) ( not ( = ?auto_396818 ?auto_396822 ) ) ( not ( = ?auto_396818 ?auto_396823 ) ) ( not ( = ?auto_396818 ?auto_396824 ) ) ( not ( = ?auto_396818 ?auto_396825 ) ) ( not ( = ?auto_396818 ?auto_396826 ) ) ( not ( = ?auto_396819 ?auto_396820 ) ) ( not ( = ?auto_396819 ?auto_396821 ) ) ( not ( = ?auto_396819 ?auto_396822 ) ) ( not ( = ?auto_396819 ?auto_396823 ) ) ( not ( = ?auto_396819 ?auto_396824 ) ) ( not ( = ?auto_396819 ?auto_396825 ) ) ( not ( = ?auto_396819 ?auto_396826 ) ) ( not ( = ?auto_396820 ?auto_396821 ) ) ( not ( = ?auto_396820 ?auto_396822 ) ) ( not ( = ?auto_396820 ?auto_396823 ) ) ( not ( = ?auto_396820 ?auto_396824 ) ) ( not ( = ?auto_396820 ?auto_396825 ) ) ( not ( = ?auto_396820 ?auto_396826 ) ) ( not ( = ?auto_396821 ?auto_396822 ) ) ( not ( = ?auto_396821 ?auto_396823 ) ) ( not ( = ?auto_396821 ?auto_396824 ) ) ( not ( = ?auto_396821 ?auto_396825 ) ) ( not ( = ?auto_396821 ?auto_396826 ) ) ( not ( = ?auto_396822 ?auto_396823 ) ) ( not ( = ?auto_396822 ?auto_396824 ) ) ( not ( = ?auto_396822 ?auto_396825 ) ) ( not ( = ?auto_396822 ?auto_396826 ) ) ( not ( = ?auto_396823 ?auto_396824 ) ) ( not ( = ?auto_396823 ?auto_396825 ) ) ( not ( = ?auto_396823 ?auto_396826 ) ) ( not ( = ?auto_396824 ?auto_396825 ) ) ( not ( = ?auto_396824 ?auto_396826 ) ) ( not ( = ?auto_396825 ?auto_396826 ) ) ( ON ?auto_396824 ?auto_396825 ) ( ON ?auto_396823 ?auto_396824 ) ( ON ?auto_396822 ?auto_396823 ) ( ON ?auto_396821 ?auto_396822 ) ( ON ?auto_396820 ?auto_396821 ) ( ON ?auto_396819 ?auto_396820 ) ( ON ?auto_396818 ?auto_396819 ) ( ON ?auto_396817 ?auto_396818 ) ( ON ?auto_396816 ?auto_396817 ) ( CLEAR ?auto_396814 ) ( ON ?auto_396815 ?auto_396816 ) ( CLEAR ?auto_396815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_396811 ?auto_396812 ?auto_396813 ?auto_396814 ?auto_396815 )
      ( MAKE-15PILE ?auto_396811 ?auto_396812 ?auto_396813 ?auto_396814 ?auto_396815 ?auto_396816 ?auto_396817 ?auto_396818 ?auto_396819 ?auto_396820 ?auto_396821 ?auto_396822 ?auto_396823 ?auto_396824 ?auto_396825 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396842 - BLOCK
      ?auto_396843 - BLOCK
      ?auto_396844 - BLOCK
      ?auto_396845 - BLOCK
      ?auto_396846 - BLOCK
      ?auto_396847 - BLOCK
      ?auto_396848 - BLOCK
      ?auto_396849 - BLOCK
      ?auto_396850 - BLOCK
      ?auto_396851 - BLOCK
      ?auto_396852 - BLOCK
      ?auto_396853 - BLOCK
      ?auto_396854 - BLOCK
      ?auto_396855 - BLOCK
      ?auto_396856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396856 ) ( ON-TABLE ?auto_396842 ) ( ON ?auto_396843 ?auto_396842 ) ( ON ?auto_396844 ?auto_396843 ) ( ON ?auto_396845 ?auto_396844 ) ( not ( = ?auto_396842 ?auto_396843 ) ) ( not ( = ?auto_396842 ?auto_396844 ) ) ( not ( = ?auto_396842 ?auto_396845 ) ) ( not ( = ?auto_396842 ?auto_396846 ) ) ( not ( = ?auto_396842 ?auto_396847 ) ) ( not ( = ?auto_396842 ?auto_396848 ) ) ( not ( = ?auto_396842 ?auto_396849 ) ) ( not ( = ?auto_396842 ?auto_396850 ) ) ( not ( = ?auto_396842 ?auto_396851 ) ) ( not ( = ?auto_396842 ?auto_396852 ) ) ( not ( = ?auto_396842 ?auto_396853 ) ) ( not ( = ?auto_396842 ?auto_396854 ) ) ( not ( = ?auto_396842 ?auto_396855 ) ) ( not ( = ?auto_396842 ?auto_396856 ) ) ( not ( = ?auto_396843 ?auto_396844 ) ) ( not ( = ?auto_396843 ?auto_396845 ) ) ( not ( = ?auto_396843 ?auto_396846 ) ) ( not ( = ?auto_396843 ?auto_396847 ) ) ( not ( = ?auto_396843 ?auto_396848 ) ) ( not ( = ?auto_396843 ?auto_396849 ) ) ( not ( = ?auto_396843 ?auto_396850 ) ) ( not ( = ?auto_396843 ?auto_396851 ) ) ( not ( = ?auto_396843 ?auto_396852 ) ) ( not ( = ?auto_396843 ?auto_396853 ) ) ( not ( = ?auto_396843 ?auto_396854 ) ) ( not ( = ?auto_396843 ?auto_396855 ) ) ( not ( = ?auto_396843 ?auto_396856 ) ) ( not ( = ?auto_396844 ?auto_396845 ) ) ( not ( = ?auto_396844 ?auto_396846 ) ) ( not ( = ?auto_396844 ?auto_396847 ) ) ( not ( = ?auto_396844 ?auto_396848 ) ) ( not ( = ?auto_396844 ?auto_396849 ) ) ( not ( = ?auto_396844 ?auto_396850 ) ) ( not ( = ?auto_396844 ?auto_396851 ) ) ( not ( = ?auto_396844 ?auto_396852 ) ) ( not ( = ?auto_396844 ?auto_396853 ) ) ( not ( = ?auto_396844 ?auto_396854 ) ) ( not ( = ?auto_396844 ?auto_396855 ) ) ( not ( = ?auto_396844 ?auto_396856 ) ) ( not ( = ?auto_396845 ?auto_396846 ) ) ( not ( = ?auto_396845 ?auto_396847 ) ) ( not ( = ?auto_396845 ?auto_396848 ) ) ( not ( = ?auto_396845 ?auto_396849 ) ) ( not ( = ?auto_396845 ?auto_396850 ) ) ( not ( = ?auto_396845 ?auto_396851 ) ) ( not ( = ?auto_396845 ?auto_396852 ) ) ( not ( = ?auto_396845 ?auto_396853 ) ) ( not ( = ?auto_396845 ?auto_396854 ) ) ( not ( = ?auto_396845 ?auto_396855 ) ) ( not ( = ?auto_396845 ?auto_396856 ) ) ( not ( = ?auto_396846 ?auto_396847 ) ) ( not ( = ?auto_396846 ?auto_396848 ) ) ( not ( = ?auto_396846 ?auto_396849 ) ) ( not ( = ?auto_396846 ?auto_396850 ) ) ( not ( = ?auto_396846 ?auto_396851 ) ) ( not ( = ?auto_396846 ?auto_396852 ) ) ( not ( = ?auto_396846 ?auto_396853 ) ) ( not ( = ?auto_396846 ?auto_396854 ) ) ( not ( = ?auto_396846 ?auto_396855 ) ) ( not ( = ?auto_396846 ?auto_396856 ) ) ( not ( = ?auto_396847 ?auto_396848 ) ) ( not ( = ?auto_396847 ?auto_396849 ) ) ( not ( = ?auto_396847 ?auto_396850 ) ) ( not ( = ?auto_396847 ?auto_396851 ) ) ( not ( = ?auto_396847 ?auto_396852 ) ) ( not ( = ?auto_396847 ?auto_396853 ) ) ( not ( = ?auto_396847 ?auto_396854 ) ) ( not ( = ?auto_396847 ?auto_396855 ) ) ( not ( = ?auto_396847 ?auto_396856 ) ) ( not ( = ?auto_396848 ?auto_396849 ) ) ( not ( = ?auto_396848 ?auto_396850 ) ) ( not ( = ?auto_396848 ?auto_396851 ) ) ( not ( = ?auto_396848 ?auto_396852 ) ) ( not ( = ?auto_396848 ?auto_396853 ) ) ( not ( = ?auto_396848 ?auto_396854 ) ) ( not ( = ?auto_396848 ?auto_396855 ) ) ( not ( = ?auto_396848 ?auto_396856 ) ) ( not ( = ?auto_396849 ?auto_396850 ) ) ( not ( = ?auto_396849 ?auto_396851 ) ) ( not ( = ?auto_396849 ?auto_396852 ) ) ( not ( = ?auto_396849 ?auto_396853 ) ) ( not ( = ?auto_396849 ?auto_396854 ) ) ( not ( = ?auto_396849 ?auto_396855 ) ) ( not ( = ?auto_396849 ?auto_396856 ) ) ( not ( = ?auto_396850 ?auto_396851 ) ) ( not ( = ?auto_396850 ?auto_396852 ) ) ( not ( = ?auto_396850 ?auto_396853 ) ) ( not ( = ?auto_396850 ?auto_396854 ) ) ( not ( = ?auto_396850 ?auto_396855 ) ) ( not ( = ?auto_396850 ?auto_396856 ) ) ( not ( = ?auto_396851 ?auto_396852 ) ) ( not ( = ?auto_396851 ?auto_396853 ) ) ( not ( = ?auto_396851 ?auto_396854 ) ) ( not ( = ?auto_396851 ?auto_396855 ) ) ( not ( = ?auto_396851 ?auto_396856 ) ) ( not ( = ?auto_396852 ?auto_396853 ) ) ( not ( = ?auto_396852 ?auto_396854 ) ) ( not ( = ?auto_396852 ?auto_396855 ) ) ( not ( = ?auto_396852 ?auto_396856 ) ) ( not ( = ?auto_396853 ?auto_396854 ) ) ( not ( = ?auto_396853 ?auto_396855 ) ) ( not ( = ?auto_396853 ?auto_396856 ) ) ( not ( = ?auto_396854 ?auto_396855 ) ) ( not ( = ?auto_396854 ?auto_396856 ) ) ( not ( = ?auto_396855 ?auto_396856 ) ) ( ON ?auto_396855 ?auto_396856 ) ( ON ?auto_396854 ?auto_396855 ) ( ON ?auto_396853 ?auto_396854 ) ( ON ?auto_396852 ?auto_396853 ) ( ON ?auto_396851 ?auto_396852 ) ( ON ?auto_396850 ?auto_396851 ) ( ON ?auto_396849 ?auto_396850 ) ( ON ?auto_396848 ?auto_396849 ) ( ON ?auto_396847 ?auto_396848 ) ( CLEAR ?auto_396845 ) ( ON ?auto_396846 ?auto_396847 ) ( CLEAR ?auto_396846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_396842 ?auto_396843 ?auto_396844 ?auto_396845 ?auto_396846 )
      ( MAKE-15PILE ?auto_396842 ?auto_396843 ?auto_396844 ?auto_396845 ?auto_396846 ?auto_396847 ?auto_396848 ?auto_396849 ?auto_396850 ?auto_396851 ?auto_396852 ?auto_396853 ?auto_396854 ?auto_396855 ?auto_396856 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396872 - BLOCK
      ?auto_396873 - BLOCK
      ?auto_396874 - BLOCK
      ?auto_396875 - BLOCK
      ?auto_396876 - BLOCK
      ?auto_396877 - BLOCK
      ?auto_396878 - BLOCK
      ?auto_396879 - BLOCK
      ?auto_396880 - BLOCK
      ?auto_396881 - BLOCK
      ?auto_396882 - BLOCK
      ?auto_396883 - BLOCK
      ?auto_396884 - BLOCK
      ?auto_396885 - BLOCK
      ?auto_396886 - BLOCK
    )
    :vars
    (
      ?auto_396887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396886 ?auto_396887 ) ( ON-TABLE ?auto_396872 ) ( ON ?auto_396873 ?auto_396872 ) ( ON ?auto_396874 ?auto_396873 ) ( not ( = ?auto_396872 ?auto_396873 ) ) ( not ( = ?auto_396872 ?auto_396874 ) ) ( not ( = ?auto_396872 ?auto_396875 ) ) ( not ( = ?auto_396872 ?auto_396876 ) ) ( not ( = ?auto_396872 ?auto_396877 ) ) ( not ( = ?auto_396872 ?auto_396878 ) ) ( not ( = ?auto_396872 ?auto_396879 ) ) ( not ( = ?auto_396872 ?auto_396880 ) ) ( not ( = ?auto_396872 ?auto_396881 ) ) ( not ( = ?auto_396872 ?auto_396882 ) ) ( not ( = ?auto_396872 ?auto_396883 ) ) ( not ( = ?auto_396872 ?auto_396884 ) ) ( not ( = ?auto_396872 ?auto_396885 ) ) ( not ( = ?auto_396872 ?auto_396886 ) ) ( not ( = ?auto_396872 ?auto_396887 ) ) ( not ( = ?auto_396873 ?auto_396874 ) ) ( not ( = ?auto_396873 ?auto_396875 ) ) ( not ( = ?auto_396873 ?auto_396876 ) ) ( not ( = ?auto_396873 ?auto_396877 ) ) ( not ( = ?auto_396873 ?auto_396878 ) ) ( not ( = ?auto_396873 ?auto_396879 ) ) ( not ( = ?auto_396873 ?auto_396880 ) ) ( not ( = ?auto_396873 ?auto_396881 ) ) ( not ( = ?auto_396873 ?auto_396882 ) ) ( not ( = ?auto_396873 ?auto_396883 ) ) ( not ( = ?auto_396873 ?auto_396884 ) ) ( not ( = ?auto_396873 ?auto_396885 ) ) ( not ( = ?auto_396873 ?auto_396886 ) ) ( not ( = ?auto_396873 ?auto_396887 ) ) ( not ( = ?auto_396874 ?auto_396875 ) ) ( not ( = ?auto_396874 ?auto_396876 ) ) ( not ( = ?auto_396874 ?auto_396877 ) ) ( not ( = ?auto_396874 ?auto_396878 ) ) ( not ( = ?auto_396874 ?auto_396879 ) ) ( not ( = ?auto_396874 ?auto_396880 ) ) ( not ( = ?auto_396874 ?auto_396881 ) ) ( not ( = ?auto_396874 ?auto_396882 ) ) ( not ( = ?auto_396874 ?auto_396883 ) ) ( not ( = ?auto_396874 ?auto_396884 ) ) ( not ( = ?auto_396874 ?auto_396885 ) ) ( not ( = ?auto_396874 ?auto_396886 ) ) ( not ( = ?auto_396874 ?auto_396887 ) ) ( not ( = ?auto_396875 ?auto_396876 ) ) ( not ( = ?auto_396875 ?auto_396877 ) ) ( not ( = ?auto_396875 ?auto_396878 ) ) ( not ( = ?auto_396875 ?auto_396879 ) ) ( not ( = ?auto_396875 ?auto_396880 ) ) ( not ( = ?auto_396875 ?auto_396881 ) ) ( not ( = ?auto_396875 ?auto_396882 ) ) ( not ( = ?auto_396875 ?auto_396883 ) ) ( not ( = ?auto_396875 ?auto_396884 ) ) ( not ( = ?auto_396875 ?auto_396885 ) ) ( not ( = ?auto_396875 ?auto_396886 ) ) ( not ( = ?auto_396875 ?auto_396887 ) ) ( not ( = ?auto_396876 ?auto_396877 ) ) ( not ( = ?auto_396876 ?auto_396878 ) ) ( not ( = ?auto_396876 ?auto_396879 ) ) ( not ( = ?auto_396876 ?auto_396880 ) ) ( not ( = ?auto_396876 ?auto_396881 ) ) ( not ( = ?auto_396876 ?auto_396882 ) ) ( not ( = ?auto_396876 ?auto_396883 ) ) ( not ( = ?auto_396876 ?auto_396884 ) ) ( not ( = ?auto_396876 ?auto_396885 ) ) ( not ( = ?auto_396876 ?auto_396886 ) ) ( not ( = ?auto_396876 ?auto_396887 ) ) ( not ( = ?auto_396877 ?auto_396878 ) ) ( not ( = ?auto_396877 ?auto_396879 ) ) ( not ( = ?auto_396877 ?auto_396880 ) ) ( not ( = ?auto_396877 ?auto_396881 ) ) ( not ( = ?auto_396877 ?auto_396882 ) ) ( not ( = ?auto_396877 ?auto_396883 ) ) ( not ( = ?auto_396877 ?auto_396884 ) ) ( not ( = ?auto_396877 ?auto_396885 ) ) ( not ( = ?auto_396877 ?auto_396886 ) ) ( not ( = ?auto_396877 ?auto_396887 ) ) ( not ( = ?auto_396878 ?auto_396879 ) ) ( not ( = ?auto_396878 ?auto_396880 ) ) ( not ( = ?auto_396878 ?auto_396881 ) ) ( not ( = ?auto_396878 ?auto_396882 ) ) ( not ( = ?auto_396878 ?auto_396883 ) ) ( not ( = ?auto_396878 ?auto_396884 ) ) ( not ( = ?auto_396878 ?auto_396885 ) ) ( not ( = ?auto_396878 ?auto_396886 ) ) ( not ( = ?auto_396878 ?auto_396887 ) ) ( not ( = ?auto_396879 ?auto_396880 ) ) ( not ( = ?auto_396879 ?auto_396881 ) ) ( not ( = ?auto_396879 ?auto_396882 ) ) ( not ( = ?auto_396879 ?auto_396883 ) ) ( not ( = ?auto_396879 ?auto_396884 ) ) ( not ( = ?auto_396879 ?auto_396885 ) ) ( not ( = ?auto_396879 ?auto_396886 ) ) ( not ( = ?auto_396879 ?auto_396887 ) ) ( not ( = ?auto_396880 ?auto_396881 ) ) ( not ( = ?auto_396880 ?auto_396882 ) ) ( not ( = ?auto_396880 ?auto_396883 ) ) ( not ( = ?auto_396880 ?auto_396884 ) ) ( not ( = ?auto_396880 ?auto_396885 ) ) ( not ( = ?auto_396880 ?auto_396886 ) ) ( not ( = ?auto_396880 ?auto_396887 ) ) ( not ( = ?auto_396881 ?auto_396882 ) ) ( not ( = ?auto_396881 ?auto_396883 ) ) ( not ( = ?auto_396881 ?auto_396884 ) ) ( not ( = ?auto_396881 ?auto_396885 ) ) ( not ( = ?auto_396881 ?auto_396886 ) ) ( not ( = ?auto_396881 ?auto_396887 ) ) ( not ( = ?auto_396882 ?auto_396883 ) ) ( not ( = ?auto_396882 ?auto_396884 ) ) ( not ( = ?auto_396882 ?auto_396885 ) ) ( not ( = ?auto_396882 ?auto_396886 ) ) ( not ( = ?auto_396882 ?auto_396887 ) ) ( not ( = ?auto_396883 ?auto_396884 ) ) ( not ( = ?auto_396883 ?auto_396885 ) ) ( not ( = ?auto_396883 ?auto_396886 ) ) ( not ( = ?auto_396883 ?auto_396887 ) ) ( not ( = ?auto_396884 ?auto_396885 ) ) ( not ( = ?auto_396884 ?auto_396886 ) ) ( not ( = ?auto_396884 ?auto_396887 ) ) ( not ( = ?auto_396885 ?auto_396886 ) ) ( not ( = ?auto_396885 ?auto_396887 ) ) ( not ( = ?auto_396886 ?auto_396887 ) ) ( ON ?auto_396885 ?auto_396886 ) ( ON ?auto_396884 ?auto_396885 ) ( ON ?auto_396883 ?auto_396884 ) ( ON ?auto_396882 ?auto_396883 ) ( ON ?auto_396881 ?auto_396882 ) ( ON ?auto_396880 ?auto_396881 ) ( ON ?auto_396879 ?auto_396880 ) ( ON ?auto_396878 ?auto_396879 ) ( ON ?auto_396877 ?auto_396878 ) ( ON ?auto_396876 ?auto_396877 ) ( CLEAR ?auto_396874 ) ( ON ?auto_396875 ?auto_396876 ) ( CLEAR ?auto_396875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_396872 ?auto_396873 ?auto_396874 ?auto_396875 )
      ( MAKE-15PILE ?auto_396872 ?auto_396873 ?auto_396874 ?auto_396875 ?auto_396876 ?auto_396877 ?auto_396878 ?auto_396879 ?auto_396880 ?auto_396881 ?auto_396882 ?auto_396883 ?auto_396884 ?auto_396885 ?auto_396886 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396903 - BLOCK
      ?auto_396904 - BLOCK
      ?auto_396905 - BLOCK
      ?auto_396906 - BLOCK
      ?auto_396907 - BLOCK
      ?auto_396908 - BLOCK
      ?auto_396909 - BLOCK
      ?auto_396910 - BLOCK
      ?auto_396911 - BLOCK
      ?auto_396912 - BLOCK
      ?auto_396913 - BLOCK
      ?auto_396914 - BLOCK
      ?auto_396915 - BLOCK
      ?auto_396916 - BLOCK
      ?auto_396917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396917 ) ( ON-TABLE ?auto_396903 ) ( ON ?auto_396904 ?auto_396903 ) ( ON ?auto_396905 ?auto_396904 ) ( not ( = ?auto_396903 ?auto_396904 ) ) ( not ( = ?auto_396903 ?auto_396905 ) ) ( not ( = ?auto_396903 ?auto_396906 ) ) ( not ( = ?auto_396903 ?auto_396907 ) ) ( not ( = ?auto_396903 ?auto_396908 ) ) ( not ( = ?auto_396903 ?auto_396909 ) ) ( not ( = ?auto_396903 ?auto_396910 ) ) ( not ( = ?auto_396903 ?auto_396911 ) ) ( not ( = ?auto_396903 ?auto_396912 ) ) ( not ( = ?auto_396903 ?auto_396913 ) ) ( not ( = ?auto_396903 ?auto_396914 ) ) ( not ( = ?auto_396903 ?auto_396915 ) ) ( not ( = ?auto_396903 ?auto_396916 ) ) ( not ( = ?auto_396903 ?auto_396917 ) ) ( not ( = ?auto_396904 ?auto_396905 ) ) ( not ( = ?auto_396904 ?auto_396906 ) ) ( not ( = ?auto_396904 ?auto_396907 ) ) ( not ( = ?auto_396904 ?auto_396908 ) ) ( not ( = ?auto_396904 ?auto_396909 ) ) ( not ( = ?auto_396904 ?auto_396910 ) ) ( not ( = ?auto_396904 ?auto_396911 ) ) ( not ( = ?auto_396904 ?auto_396912 ) ) ( not ( = ?auto_396904 ?auto_396913 ) ) ( not ( = ?auto_396904 ?auto_396914 ) ) ( not ( = ?auto_396904 ?auto_396915 ) ) ( not ( = ?auto_396904 ?auto_396916 ) ) ( not ( = ?auto_396904 ?auto_396917 ) ) ( not ( = ?auto_396905 ?auto_396906 ) ) ( not ( = ?auto_396905 ?auto_396907 ) ) ( not ( = ?auto_396905 ?auto_396908 ) ) ( not ( = ?auto_396905 ?auto_396909 ) ) ( not ( = ?auto_396905 ?auto_396910 ) ) ( not ( = ?auto_396905 ?auto_396911 ) ) ( not ( = ?auto_396905 ?auto_396912 ) ) ( not ( = ?auto_396905 ?auto_396913 ) ) ( not ( = ?auto_396905 ?auto_396914 ) ) ( not ( = ?auto_396905 ?auto_396915 ) ) ( not ( = ?auto_396905 ?auto_396916 ) ) ( not ( = ?auto_396905 ?auto_396917 ) ) ( not ( = ?auto_396906 ?auto_396907 ) ) ( not ( = ?auto_396906 ?auto_396908 ) ) ( not ( = ?auto_396906 ?auto_396909 ) ) ( not ( = ?auto_396906 ?auto_396910 ) ) ( not ( = ?auto_396906 ?auto_396911 ) ) ( not ( = ?auto_396906 ?auto_396912 ) ) ( not ( = ?auto_396906 ?auto_396913 ) ) ( not ( = ?auto_396906 ?auto_396914 ) ) ( not ( = ?auto_396906 ?auto_396915 ) ) ( not ( = ?auto_396906 ?auto_396916 ) ) ( not ( = ?auto_396906 ?auto_396917 ) ) ( not ( = ?auto_396907 ?auto_396908 ) ) ( not ( = ?auto_396907 ?auto_396909 ) ) ( not ( = ?auto_396907 ?auto_396910 ) ) ( not ( = ?auto_396907 ?auto_396911 ) ) ( not ( = ?auto_396907 ?auto_396912 ) ) ( not ( = ?auto_396907 ?auto_396913 ) ) ( not ( = ?auto_396907 ?auto_396914 ) ) ( not ( = ?auto_396907 ?auto_396915 ) ) ( not ( = ?auto_396907 ?auto_396916 ) ) ( not ( = ?auto_396907 ?auto_396917 ) ) ( not ( = ?auto_396908 ?auto_396909 ) ) ( not ( = ?auto_396908 ?auto_396910 ) ) ( not ( = ?auto_396908 ?auto_396911 ) ) ( not ( = ?auto_396908 ?auto_396912 ) ) ( not ( = ?auto_396908 ?auto_396913 ) ) ( not ( = ?auto_396908 ?auto_396914 ) ) ( not ( = ?auto_396908 ?auto_396915 ) ) ( not ( = ?auto_396908 ?auto_396916 ) ) ( not ( = ?auto_396908 ?auto_396917 ) ) ( not ( = ?auto_396909 ?auto_396910 ) ) ( not ( = ?auto_396909 ?auto_396911 ) ) ( not ( = ?auto_396909 ?auto_396912 ) ) ( not ( = ?auto_396909 ?auto_396913 ) ) ( not ( = ?auto_396909 ?auto_396914 ) ) ( not ( = ?auto_396909 ?auto_396915 ) ) ( not ( = ?auto_396909 ?auto_396916 ) ) ( not ( = ?auto_396909 ?auto_396917 ) ) ( not ( = ?auto_396910 ?auto_396911 ) ) ( not ( = ?auto_396910 ?auto_396912 ) ) ( not ( = ?auto_396910 ?auto_396913 ) ) ( not ( = ?auto_396910 ?auto_396914 ) ) ( not ( = ?auto_396910 ?auto_396915 ) ) ( not ( = ?auto_396910 ?auto_396916 ) ) ( not ( = ?auto_396910 ?auto_396917 ) ) ( not ( = ?auto_396911 ?auto_396912 ) ) ( not ( = ?auto_396911 ?auto_396913 ) ) ( not ( = ?auto_396911 ?auto_396914 ) ) ( not ( = ?auto_396911 ?auto_396915 ) ) ( not ( = ?auto_396911 ?auto_396916 ) ) ( not ( = ?auto_396911 ?auto_396917 ) ) ( not ( = ?auto_396912 ?auto_396913 ) ) ( not ( = ?auto_396912 ?auto_396914 ) ) ( not ( = ?auto_396912 ?auto_396915 ) ) ( not ( = ?auto_396912 ?auto_396916 ) ) ( not ( = ?auto_396912 ?auto_396917 ) ) ( not ( = ?auto_396913 ?auto_396914 ) ) ( not ( = ?auto_396913 ?auto_396915 ) ) ( not ( = ?auto_396913 ?auto_396916 ) ) ( not ( = ?auto_396913 ?auto_396917 ) ) ( not ( = ?auto_396914 ?auto_396915 ) ) ( not ( = ?auto_396914 ?auto_396916 ) ) ( not ( = ?auto_396914 ?auto_396917 ) ) ( not ( = ?auto_396915 ?auto_396916 ) ) ( not ( = ?auto_396915 ?auto_396917 ) ) ( not ( = ?auto_396916 ?auto_396917 ) ) ( ON ?auto_396916 ?auto_396917 ) ( ON ?auto_396915 ?auto_396916 ) ( ON ?auto_396914 ?auto_396915 ) ( ON ?auto_396913 ?auto_396914 ) ( ON ?auto_396912 ?auto_396913 ) ( ON ?auto_396911 ?auto_396912 ) ( ON ?auto_396910 ?auto_396911 ) ( ON ?auto_396909 ?auto_396910 ) ( ON ?auto_396908 ?auto_396909 ) ( ON ?auto_396907 ?auto_396908 ) ( CLEAR ?auto_396905 ) ( ON ?auto_396906 ?auto_396907 ) ( CLEAR ?auto_396906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_396903 ?auto_396904 ?auto_396905 ?auto_396906 )
      ( MAKE-15PILE ?auto_396903 ?auto_396904 ?auto_396905 ?auto_396906 ?auto_396907 ?auto_396908 ?auto_396909 ?auto_396910 ?auto_396911 ?auto_396912 ?auto_396913 ?auto_396914 ?auto_396915 ?auto_396916 ?auto_396917 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396933 - BLOCK
      ?auto_396934 - BLOCK
      ?auto_396935 - BLOCK
      ?auto_396936 - BLOCK
      ?auto_396937 - BLOCK
      ?auto_396938 - BLOCK
      ?auto_396939 - BLOCK
      ?auto_396940 - BLOCK
      ?auto_396941 - BLOCK
      ?auto_396942 - BLOCK
      ?auto_396943 - BLOCK
      ?auto_396944 - BLOCK
      ?auto_396945 - BLOCK
      ?auto_396946 - BLOCK
      ?auto_396947 - BLOCK
    )
    :vars
    (
      ?auto_396948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_396947 ?auto_396948 ) ( ON-TABLE ?auto_396933 ) ( ON ?auto_396934 ?auto_396933 ) ( not ( = ?auto_396933 ?auto_396934 ) ) ( not ( = ?auto_396933 ?auto_396935 ) ) ( not ( = ?auto_396933 ?auto_396936 ) ) ( not ( = ?auto_396933 ?auto_396937 ) ) ( not ( = ?auto_396933 ?auto_396938 ) ) ( not ( = ?auto_396933 ?auto_396939 ) ) ( not ( = ?auto_396933 ?auto_396940 ) ) ( not ( = ?auto_396933 ?auto_396941 ) ) ( not ( = ?auto_396933 ?auto_396942 ) ) ( not ( = ?auto_396933 ?auto_396943 ) ) ( not ( = ?auto_396933 ?auto_396944 ) ) ( not ( = ?auto_396933 ?auto_396945 ) ) ( not ( = ?auto_396933 ?auto_396946 ) ) ( not ( = ?auto_396933 ?auto_396947 ) ) ( not ( = ?auto_396933 ?auto_396948 ) ) ( not ( = ?auto_396934 ?auto_396935 ) ) ( not ( = ?auto_396934 ?auto_396936 ) ) ( not ( = ?auto_396934 ?auto_396937 ) ) ( not ( = ?auto_396934 ?auto_396938 ) ) ( not ( = ?auto_396934 ?auto_396939 ) ) ( not ( = ?auto_396934 ?auto_396940 ) ) ( not ( = ?auto_396934 ?auto_396941 ) ) ( not ( = ?auto_396934 ?auto_396942 ) ) ( not ( = ?auto_396934 ?auto_396943 ) ) ( not ( = ?auto_396934 ?auto_396944 ) ) ( not ( = ?auto_396934 ?auto_396945 ) ) ( not ( = ?auto_396934 ?auto_396946 ) ) ( not ( = ?auto_396934 ?auto_396947 ) ) ( not ( = ?auto_396934 ?auto_396948 ) ) ( not ( = ?auto_396935 ?auto_396936 ) ) ( not ( = ?auto_396935 ?auto_396937 ) ) ( not ( = ?auto_396935 ?auto_396938 ) ) ( not ( = ?auto_396935 ?auto_396939 ) ) ( not ( = ?auto_396935 ?auto_396940 ) ) ( not ( = ?auto_396935 ?auto_396941 ) ) ( not ( = ?auto_396935 ?auto_396942 ) ) ( not ( = ?auto_396935 ?auto_396943 ) ) ( not ( = ?auto_396935 ?auto_396944 ) ) ( not ( = ?auto_396935 ?auto_396945 ) ) ( not ( = ?auto_396935 ?auto_396946 ) ) ( not ( = ?auto_396935 ?auto_396947 ) ) ( not ( = ?auto_396935 ?auto_396948 ) ) ( not ( = ?auto_396936 ?auto_396937 ) ) ( not ( = ?auto_396936 ?auto_396938 ) ) ( not ( = ?auto_396936 ?auto_396939 ) ) ( not ( = ?auto_396936 ?auto_396940 ) ) ( not ( = ?auto_396936 ?auto_396941 ) ) ( not ( = ?auto_396936 ?auto_396942 ) ) ( not ( = ?auto_396936 ?auto_396943 ) ) ( not ( = ?auto_396936 ?auto_396944 ) ) ( not ( = ?auto_396936 ?auto_396945 ) ) ( not ( = ?auto_396936 ?auto_396946 ) ) ( not ( = ?auto_396936 ?auto_396947 ) ) ( not ( = ?auto_396936 ?auto_396948 ) ) ( not ( = ?auto_396937 ?auto_396938 ) ) ( not ( = ?auto_396937 ?auto_396939 ) ) ( not ( = ?auto_396937 ?auto_396940 ) ) ( not ( = ?auto_396937 ?auto_396941 ) ) ( not ( = ?auto_396937 ?auto_396942 ) ) ( not ( = ?auto_396937 ?auto_396943 ) ) ( not ( = ?auto_396937 ?auto_396944 ) ) ( not ( = ?auto_396937 ?auto_396945 ) ) ( not ( = ?auto_396937 ?auto_396946 ) ) ( not ( = ?auto_396937 ?auto_396947 ) ) ( not ( = ?auto_396937 ?auto_396948 ) ) ( not ( = ?auto_396938 ?auto_396939 ) ) ( not ( = ?auto_396938 ?auto_396940 ) ) ( not ( = ?auto_396938 ?auto_396941 ) ) ( not ( = ?auto_396938 ?auto_396942 ) ) ( not ( = ?auto_396938 ?auto_396943 ) ) ( not ( = ?auto_396938 ?auto_396944 ) ) ( not ( = ?auto_396938 ?auto_396945 ) ) ( not ( = ?auto_396938 ?auto_396946 ) ) ( not ( = ?auto_396938 ?auto_396947 ) ) ( not ( = ?auto_396938 ?auto_396948 ) ) ( not ( = ?auto_396939 ?auto_396940 ) ) ( not ( = ?auto_396939 ?auto_396941 ) ) ( not ( = ?auto_396939 ?auto_396942 ) ) ( not ( = ?auto_396939 ?auto_396943 ) ) ( not ( = ?auto_396939 ?auto_396944 ) ) ( not ( = ?auto_396939 ?auto_396945 ) ) ( not ( = ?auto_396939 ?auto_396946 ) ) ( not ( = ?auto_396939 ?auto_396947 ) ) ( not ( = ?auto_396939 ?auto_396948 ) ) ( not ( = ?auto_396940 ?auto_396941 ) ) ( not ( = ?auto_396940 ?auto_396942 ) ) ( not ( = ?auto_396940 ?auto_396943 ) ) ( not ( = ?auto_396940 ?auto_396944 ) ) ( not ( = ?auto_396940 ?auto_396945 ) ) ( not ( = ?auto_396940 ?auto_396946 ) ) ( not ( = ?auto_396940 ?auto_396947 ) ) ( not ( = ?auto_396940 ?auto_396948 ) ) ( not ( = ?auto_396941 ?auto_396942 ) ) ( not ( = ?auto_396941 ?auto_396943 ) ) ( not ( = ?auto_396941 ?auto_396944 ) ) ( not ( = ?auto_396941 ?auto_396945 ) ) ( not ( = ?auto_396941 ?auto_396946 ) ) ( not ( = ?auto_396941 ?auto_396947 ) ) ( not ( = ?auto_396941 ?auto_396948 ) ) ( not ( = ?auto_396942 ?auto_396943 ) ) ( not ( = ?auto_396942 ?auto_396944 ) ) ( not ( = ?auto_396942 ?auto_396945 ) ) ( not ( = ?auto_396942 ?auto_396946 ) ) ( not ( = ?auto_396942 ?auto_396947 ) ) ( not ( = ?auto_396942 ?auto_396948 ) ) ( not ( = ?auto_396943 ?auto_396944 ) ) ( not ( = ?auto_396943 ?auto_396945 ) ) ( not ( = ?auto_396943 ?auto_396946 ) ) ( not ( = ?auto_396943 ?auto_396947 ) ) ( not ( = ?auto_396943 ?auto_396948 ) ) ( not ( = ?auto_396944 ?auto_396945 ) ) ( not ( = ?auto_396944 ?auto_396946 ) ) ( not ( = ?auto_396944 ?auto_396947 ) ) ( not ( = ?auto_396944 ?auto_396948 ) ) ( not ( = ?auto_396945 ?auto_396946 ) ) ( not ( = ?auto_396945 ?auto_396947 ) ) ( not ( = ?auto_396945 ?auto_396948 ) ) ( not ( = ?auto_396946 ?auto_396947 ) ) ( not ( = ?auto_396946 ?auto_396948 ) ) ( not ( = ?auto_396947 ?auto_396948 ) ) ( ON ?auto_396946 ?auto_396947 ) ( ON ?auto_396945 ?auto_396946 ) ( ON ?auto_396944 ?auto_396945 ) ( ON ?auto_396943 ?auto_396944 ) ( ON ?auto_396942 ?auto_396943 ) ( ON ?auto_396941 ?auto_396942 ) ( ON ?auto_396940 ?auto_396941 ) ( ON ?auto_396939 ?auto_396940 ) ( ON ?auto_396938 ?auto_396939 ) ( ON ?auto_396937 ?auto_396938 ) ( ON ?auto_396936 ?auto_396937 ) ( CLEAR ?auto_396934 ) ( ON ?auto_396935 ?auto_396936 ) ( CLEAR ?auto_396935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_396933 ?auto_396934 ?auto_396935 )
      ( MAKE-15PILE ?auto_396933 ?auto_396934 ?auto_396935 ?auto_396936 ?auto_396937 ?auto_396938 ?auto_396939 ?auto_396940 ?auto_396941 ?auto_396942 ?auto_396943 ?auto_396944 ?auto_396945 ?auto_396946 ?auto_396947 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396964 - BLOCK
      ?auto_396965 - BLOCK
      ?auto_396966 - BLOCK
      ?auto_396967 - BLOCK
      ?auto_396968 - BLOCK
      ?auto_396969 - BLOCK
      ?auto_396970 - BLOCK
      ?auto_396971 - BLOCK
      ?auto_396972 - BLOCK
      ?auto_396973 - BLOCK
      ?auto_396974 - BLOCK
      ?auto_396975 - BLOCK
      ?auto_396976 - BLOCK
      ?auto_396977 - BLOCK
      ?auto_396978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_396978 ) ( ON-TABLE ?auto_396964 ) ( ON ?auto_396965 ?auto_396964 ) ( not ( = ?auto_396964 ?auto_396965 ) ) ( not ( = ?auto_396964 ?auto_396966 ) ) ( not ( = ?auto_396964 ?auto_396967 ) ) ( not ( = ?auto_396964 ?auto_396968 ) ) ( not ( = ?auto_396964 ?auto_396969 ) ) ( not ( = ?auto_396964 ?auto_396970 ) ) ( not ( = ?auto_396964 ?auto_396971 ) ) ( not ( = ?auto_396964 ?auto_396972 ) ) ( not ( = ?auto_396964 ?auto_396973 ) ) ( not ( = ?auto_396964 ?auto_396974 ) ) ( not ( = ?auto_396964 ?auto_396975 ) ) ( not ( = ?auto_396964 ?auto_396976 ) ) ( not ( = ?auto_396964 ?auto_396977 ) ) ( not ( = ?auto_396964 ?auto_396978 ) ) ( not ( = ?auto_396965 ?auto_396966 ) ) ( not ( = ?auto_396965 ?auto_396967 ) ) ( not ( = ?auto_396965 ?auto_396968 ) ) ( not ( = ?auto_396965 ?auto_396969 ) ) ( not ( = ?auto_396965 ?auto_396970 ) ) ( not ( = ?auto_396965 ?auto_396971 ) ) ( not ( = ?auto_396965 ?auto_396972 ) ) ( not ( = ?auto_396965 ?auto_396973 ) ) ( not ( = ?auto_396965 ?auto_396974 ) ) ( not ( = ?auto_396965 ?auto_396975 ) ) ( not ( = ?auto_396965 ?auto_396976 ) ) ( not ( = ?auto_396965 ?auto_396977 ) ) ( not ( = ?auto_396965 ?auto_396978 ) ) ( not ( = ?auto_396966 ?auto_396967 ) ) ( not ( = ?auto_396966 ?auto_396968 ) ) ( not ( = ?auto_396966 ?auto_396969 ) ) ( not ( = ?auto_396966 ?auto_396970 ) ) ( not ( = ?auto_396966 ?auto_396971 ) ) ( not ( = ?auto_396966 ?auto_396972 ) ) ( not ( = ?auto_396966 ?auto_396973 ) ) ( not ( = ?auto_396966 ?auto_396974 ) ) ( not ( = ?auto_396966 ?auto_396975 ) ) ( not ( = ?auto_396966 ?auto_396976 ) ) ( not ( = ?auto_396966 ?auto_396977 ) ) ( not ( = ?auto_396966 ?auto_396978 ) ) ( not ( = ?auto_396967 ?auto_396968 ) ) ( not ( = ?auto_396967 ?auto_396969 ) ) ( not ( = ?auto_396967 ?auto_396970 ) ) ( not ( = ?auto_396967 ?auto_396971 ) ) ( not ( = ?auto_396967 ?auto_396972 ) ) ( not ( = ?auto_396967 ?auto_396973 ) ) ( not ( = ?auto_396967 ?auto_396974 ) ) ( not ( = ?auto_396967 ?auto_396975 ) ) ( not ( = ?auto_396967 ?auto_396976 ) ) ( not ( = ?auto_396967 ?auto_396977 ) ) ( not ( = ?auto_396967 ?auto_396978 ) ) ( not ( = ?auto_396968 ?auto_396969 ) ) ( not ( = ?auto_396968 ?auto_396970 ) ) ( not ( = ?auto_396968 ?auto_396971 ) ) ( not ( = ?auto_396968 ?auto_396972 ) ) ( not ( = ?auto_396968 ?auto_396973 ) ) ( not ( = ?auto_396968 ?auto_396974 ) ) ( not ( = ?auto_396968 ?auto_396975 ) ) ( not ( = ?auto_396968 ?auto_396976 ) ) ( not ( = ?auto_396968 ?auto_396977 ) ) ( not ( = ?auto_396968 ?auto_396978 ) ) ( not ( = ?auto_396969 ?auto_396970 ) ) ( not ( = ?auto_396969 ?auto_396971 ) ) ( not ( = ?auto_396969 ?auto_396972 ) ) ( not ( = ?auto_396969 ?auto_396973 ) ) ( not ( = ?auto_396969 ?auto_396974 ) ) ( not ( = ?auto_396969 ?auto_396975 ) ) ( not ( = ?auto_396969 ?auto_396976 ) ) ( not ( = ?auto_396969 ?auto_396977 ) ) ( not ( = ?auto_396969 ?auto_396978 ) ) ( not ( = ?auto_396970 ?auto_396971 ) ) ( not ( = ?auto_396970 ?auto_396972 ) ) ( not ( = ?auto_396970 ?auto_396973 ) ) ( not ( = ?auto_396970 ?auto_396974 ) ) ( not ( = ?auto_396970 ?auto_396975 ) ) ( not ( = ?auto_396970 ?auto_396976 ) ) ( not ( = ?auto_396970 ?auto_396977 ) ) ( not ( = ?auto_396970 ?auto_396978 ) ) ( not ( = ?auto_396971 ?auto_396972 ) ) ( not ( = ?auto_396971 ?auto_396973 ) ) ( not ( = ?auto_396971 ?auto_396974 ) ) ( not ( = ?auto_396971 ?auto_396975 ) ) ( not ( = ?auto_396971 ?auto_396976 ) ) ( not ( = ?auto_396971 ?auto_396977 ) ) ( not ( = ?auto_396971 ?auto_396978 ) ) ( not ( = ?auto_396972 ?auto_396973 ) ) ( not ( = ?auto_396972 ?auto_396974 ) ) ( not ( = ?auto_396972 ?auto_396975 ) ) ( not ( = ?auto_396972 ?auto_396976 ) ) ( not ( = ?auto_396972 ?auto_396977 ) ) ( not ( = ?auto_396972 ?auto_396978 ) ) ( not ( = ?auto_396973 ?auto_396974 ) ) ( not ( = ?auto_396973 ?auto_396975 ) ) ( not ( = ?auto_396973 ?auto_396976 ) ) ( not ( = ?auto_396973 ?auto_396977 ) ) ( not ( = ?auto_396973 ?auto_396978 ) ) ( not ( = ?auto_396974 ?auto_396975 ) ) ( not ( = ?auto_396974 ?auto_396976 ) ) ( not ( = ?auto_396974 ?auto_396977 ) ) ( not ( = ?auto_396974 ?auto_396978 ) ) ( not ( = ?auto_396975 ?auto_396976 ) ) ( not ( = ?auto_396975 ?auto_396977 ) ) ( not ( = ?auto_396975 ?auto_396978 ) ) ( not ( = ?auto_396976 ?auto_396977 ) ) ( not ( = ?auto_396976 ?auto_396978 ) ) ( not ( = ?auto_396977 ?auto_396978 ) ) ( ON ?auto_396977 ?auto_396978 ) ( ON ?auto_396976 ?auto_396977 ) ( ON ?auto_396975 ?auto_396976 ) ( ON ?auto_396974 ?auto_396975 ) ( ON ?auto_396973 ?auto_396974 ) ( ON ?auto_396972 ?auto_396973 ) ( ON ?auto_396971 ?auto_396972 ) ( ON ?auto_396970 ?auto_396971 ) ( ON ?auto_396969 ?auto_396970 ) ( ON ?auto_396968 ?auto_396969 ) ( ON ?auto_396967 ?auto_396968 ) ( CLEAR ?auto_396965 ) ( ON ?auto_396966 ?auto_396967 ) ( CLEAR ?auto_396966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_396964 ?auto_396965 ?auto_396966 )
      ( MAKE-15PILE ?auto_396964 ?auto_396965 ?auto_396966 ?auto_396967 ?auto_396968 ?auto_396969 ?auto_396970 ?auto_396971 ?auto_396972 ?auto_396973 ?auto_396974 ?auto_396975 ?auto_396976 ?auto_396977 ?auto_396978 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_396994 - BLOCK
      ?auto_396995 - BLOCK
      ?auto_396996 - BLOCK
      ?auto_396997 - BLOCK
      ?auto_396998 - BLOCK
      ?auto_396999 - BLOCK
      ?auto_397000 - BLOCK
      ?auto_397001 - BLOCK
      ?auto_397002 - BLOCK
      ?auto_397003 - BLOCK
      ?auto_397004 - BLOCK
      ?auto_397005 - BLOCK
      ?auto_397006 - BLOCK
      ?auto_397007 - BLOCK
      ?auto_397008 - BLOCK
    )
    :vars
    (
      ?auto_397009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397008 ?auto_397009 ) ( ON-TABLE ?auto_396994 ) ( not ( = ?auto_396994 ?auto_396995 ) ) ( not ( = ?auto_396994 ?auto_396996 ) ) ( not ( = ?auto_396994 ?auto_396997 ) ) ( not ( = ?auto_396994 ?auto_396998 ) ) ( not ( = ?auto_396994 ?auto_396999 ) ) ( not ( = ?auto_396994 ?auto_397000 ) ) ( not ( = ?auto_396994 ?auto_397001 ) ) ( not ( = ?auto_396994 ?auto_397002 ) ) ( not ( = ?auto_396994 ?auto_397003 ) ) ( not ( = ?auto_396994 ?auto_397004 ) ) ( not ( = ?auto_396994 ?auto_397005 ) ) ( not ( = ?auto_396994 ?auto_397006 ) ) ( not ( = ?auto_396994 ?auto_397007 ) ) ( not ( = ?auto_396994 ?auto_397008 ) ) ( not ( = ?auto_396994 ?auto_397009 ) ) ( not ( = ?auto_396995 ?auto_396996 ) ) ( not ( = ?auto_396995 ?auto_396997 ) ) ( not ( = ?auto_396995 ?auto_396998 ) ) ( not ( = ?auto_396995 ?auto_396999 ) ) ( not ( = ?auto_396995 ?auto_397000 ) ) ( not ( = ?auto_396995 ?auto_397001 ) ) ( not ( = ?auto_396995 ?auto_397002 ) ) ( not ( = ?auto_396995 ?auto_397003 ) ) ( not ( = ?auto_396995 ?auto_397004 ) ) ( not ( = ?auto_396995 ?auto_397005 ) ) ( not ( = ?auto_396995 ?auto_397006 ) ) ( not ( = ?auto_396995 ?auto_397007 ) ) ( not ( = ?auto_396995 ?auto_397008 ) ) ( not ( = ?auto_396995 ?auto_397009 ) ) ( not ( = ?auto_396996 ?auto_396997 ) ) ( not ( = ?auto_396996 ?auto_396998 ) ) ( not ( = ?auto_396996 ?auto_396999 ) ) ( not ( = ?auto_396996 ?auto_397000 ) ) ( not ( = ?auto_396996 ?auto_397001 ) ) ( not ( = ?auto_396996 ?auto_397002 ) ) ( not ( = ?auto_396996 ?auto_397003 ) ) ( not ( = ?auto_396996 ?auto_397004 ) ) ( not ( = ?auto_396996 ?auto_397005 ) ) ( not ( = ?auto_396996 ?auto_397006 ) ) ( not ( = ?auto_396996 ?auto_397007 ) ) ( not ( = ?auto_396996 ?auto_397008 ) ) ( not ( = ?auto_396996 ?auto_397009 ) ) ( not ( = ?auto_396997 ?auto_396998 ) ) ( not ( = ?auto_396997 ?auto_396999 ) ) ( not ( = ?auto_396997 ?auto_397000 ) ) ( not ( = ?auto_396997 ?auto_397001 ) ) ( not ( = ?auto_396997 ?auto_397002 ) ) ( not ( = ?auto_396997 ?auto_397003 ) ) ( not ( = ?auto_396997 ?auto_397004 ) ) ( not ( = ?auto_396997 ?auto_397005 ) ) ( not ( = ?auto_396997 ?auto_397006 ) ) ( not ( = ?auto_396997 ?auto_397007 ) ) ( not ( = ?auto_396997 ?auto_397008 ) ) ( not ( = ?auto_396997 ?auto_397009 ) ) ( not ( = ?auto_396998 ?auto_396999 ) ) ( not ( = ?auto_396998 ?auto_397000 ) ) ( not ( = ?auto_396998 ?auto_397001 ) ) ( not ( = ?auto_396998 ?auto_397002 ) ) ( not ( = ?auto_396998 ?auto_397003 ) ) ( not ( = ?auto_396998 ?auto_397004 ) ) ( not ( = ?auto_396998 ?auto_397005 ) ) ( not ( = ?auto_396998 ?auto_397006 ) ) ( not ( = ?auto_396998 ?auto_397007 ) ) ( not ( = ?auto_396998 ?auto_397008 ) ) ( not ( = ?auto_396998 ?auto_397009 ) ) ( not ( = ?auto_396999 ?auto_397000 ) ) ( not ( = ?auto_396999 ?auto_397001 ) ) ( not ( = ?auto_396999 ?auto_397002 ) ) ( not ( = ?auto_396999 ?auto_397003 ) ) ( not ( = ?auto_396999 ?auto_397004 ) ) ( not ( = ?auto_396999 ?auto_397005 ) ) ( not ( = ?auto_396999 ?auto_397006 ) ) ( not ( = ?auto_396999 ?auto_397007 ) ) ( not ( = ?auto_396999 ?auto_397008 ) ) ( not ( = ?auto_396999 ?auto_397009 ) ) ( not ( = ?auto_397000 ?auto_397001 ) ) ( not ( = ?auto_397000 ?auto_397002 ) ) ( not ( = ?auto_397000 ?auto_397003 ) ) ( not ( = ?auto_397000 ?auto_397004 ) ) ( not ( = ?auto_397000 ?auto_397005 ) ) ( not ( = ?auto_397000 ?auto_397006 ) ) ( not ( = ?auto_397000 ?auto_397007 ) ) ( not ( = ?auto_397000 ?auto_397008 ) ) ( not ( = ?auto_397000 ?auto_397009 ) ) ( not ( = ?auto_397001 ?auto_397002 ) ) ( not ( = ?auto_397001 ?auto_397003 ) ) ( not ( = ?auto_397001 ?auto_397004 ) ) ( not ( = ?auto_397001 ?auto_397005 ) ) ( not ( = ?auto_397001 ?auto_397006 ) ) ( not ( = ?auto_397001 ?auto_397007 ) ) ( not ( = ?auto_397001 ?auto_397008 ) ) ( not ( = ?auto_397001 ?auto_397009 ) ) ( not ( = ?auto_397002 ?auto_397003 ) ) ( not ( = ?auto_397002 ?auto_397004 ) ) ( not ( = ?auto_397002 ?auto_397005 ) ) ( not ( = ?auto_397002 ?auto_397006 ) ) ( not ( = ?auto_397002 ?auto_397007 ) ) ( not ( = ?auto_397002 ?auto_397008 ) ) ( not ( = ?auto_397002 ?auto_397009 ) ) ( not ( = ?auto_397003 ?auto_397004 ) ) ( not ( = ?auto_397003 ?auto_397005 ) ) ( not ( = ?auto_397003 ?auto_397006 ) ) ( not ( = ?auto_397003 ?auto_397007 ) ) ( not ( = ?auto_397003 ?auto_397008 ) ) ( not ( = ?auto_397003 ?auto_397009 ) ) ( not ( = ?auto_397004 ?auto_397005 ) ) ( not ( = ?auto_397004 ?auto_397006 ) ) ( not ( = ?auto_397004 ?auto_397007 ) ) ( not ( = ?auto_397004 ?auto_397008 ) ) ( not ( = ?auto_397004 ?auto_397009 ) ) ( not ( = ?auto_397005 ?auto_397006 ) ) ( not ( = ?auto_397005 ?auto_397007 ) ) ( not ( = ?auto_397005 ?auto_397008 ) ) ( not ( = ?auto_397005 ?auto_397009 ) ) ( not ( = ?auto_397006 ?auto_397007 ) ) ( not ( = ?auto_397006 ?auto_397008 ) ) ( not ( = ?auto_397006 ?auto_397009 ) ) ( not ( = ?auto_397007 ?auto_397008 ) ) ( not ( = ?auto_397007 ?auto_397009 ) ) ( not ( = ?auto_397008 ?auto_397009 ) ) ( ON ?auto_397007 ?auto_397008 ) ( ON ?auto_397006 ?auto_397007 ) ( ON ?auto_397005 ?auto_397006 ) ( ON ?auto_397004 ?auto_397005 ) ( ON ?auto_397003 ?auto_397004 ) ( ON ?auto_397002 ?auto_397003 ) ( ON ?auto_397001 ?auto_397002 ) ( ON ?auto_397000 ?auto_397001 ) ( ON ?auto_396999 ?auto_397000 ) ( ON ?auto_396998 ?auto_396999 ) ( ON ?auto_396997 ?auto_396998 ) ( ON ?auto_396996 ?auto_396997 ) ( CLEAR ?auto_396994 ) ( ON ?auto_396995 ?auto_396996 ) ( CLEAR ?auto_396995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_396994 ?auto_396995 )
      ( MAKE-15PILE ?auto_396994 ?auto_396995 ?auto_396996 ?auto_396997 ?auto_396998 ?auto_396999 ?auto_397000 ?auto_397001 ?auto_397002 ?auto_397003 ?auto_397004 ?auto_397005 ?auto_397006 ?auto_397007 ?auto_397008 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_397025 - BLOCK
      ?auto_397026 - BLOCK
      ?auto_397027 - BLOCK
      ?auto_397028 - BLOCK
      ?auto_397029 - BLOCK
      ?auto_397030 - BLOCK
      ?auto_397031 - BLOCK
      ?auto_397032 - BLOCK
      ?auto_397033 - BLOCK
      ?auto_397034 - BLOCK
      ?auto_397035 - BLOCK
      ?auto_397036 - BLOCK
      ?auto_397037 - BLOCK
      ?auto_397038 - BLOCK
      ?auto_397039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_397039 ) ( ON-TABLE ?auto_397025 ) ( not ( = ?auto_397025 ?auto_397026 ) ) ( not ( = ?auto_397025 ?auto_397027 ) ) ( not ( = ?auto_397025 ?auto_397028 ) ) ( not ( = ?auto_397025 ?auto_397029 ) ) ( not ( = ?auto_397025 ?auto_397030 ) ) ( not ( = ?auto_397025 ?auto_397031 ) ) ( not ( = ?auto_397025 ?auto_397032 ) ) ( not ( = ?auto_397025 ?auto_397033 ) ) ( not ( = ?auto_397025 ?auto_397034 ) ) ( not ( = ?auto_397025 ?auto_397035 ) ) ( not ( = ?auto_397025 ?auto_397036 ) ) ( not ( = ?auto_397025 ?auto_397037 ) ) ( not ( = ?auto_397025 ?auto_397038 ) ) ( not ( = ?auto_397025 ?auto_397039 ) ) ( not ( = ?auto_397026 ?auto_397027 ) ) ( not ( = ?auto_397026 ?auto_397028 ) ) ( not ( = ?auto_397026 ?auto_397029 ) ) ( not ( = ?auto_397026 ?auto_397030 ) ) ( not ( = ?auto_397026 ?auto_397031 ) ) ( not ( = ?auto_397026 ?auto_397032 ) ) ( not ( = ?auto_397026 ?auto_397033 ) ) ( not ( = ?auto_397026 ?auto_397034 ) ) ( not ( = ?auto_397026 ?auto_397035 ) ) ( not ( = ?auto_397026 ?auto_397036 ) ) ( not ( = ?auto_397026 ?auto_397037 ) ) ( not ( = ?auto_397026 ?auto_397038 ) ) ( not ( = ?auto_397026 ?auto_397039 ) ) ( not ( = ?auto_397027 ?auto_397028 ) ) ( not ( = ?auto_397027 ?auto_397029 ) ) ( not ( = ?auto_397027 ?auto_397030 ) ) ( not ( = ?auto_397027 ?auto_397031 ) ) ( not ( = ?auto_397027 ?auto_397032 ) ) ( not ( = ?auto_397027 ?auto_397033 ) ) ( not ( = ?auto_397027 ?auto_397034 ) ) ( not ( = ?auto_397027 ?auto_397035 ) ) ( not ( = ?auto_397027 ?auto_397036 ) ) ( not ( = ?auto_397027 ?auto_397037 ) ) ( not ( = ?auto_397027 ?auto_397038 ) ) ( not ( = ?auto_397027 ?auto_397039 ) ) ( not ( = ?auto_397028 ?auto_397029 ) ) ( not ( = ?auto_397028 ?auto_397030 ) ) ( not ( = ?auto_397028 ?auto_397031 ) ) ( not ( = ?auto_397028 ?auto_397032 ) ) ( not ( = ?auto_397028 ?auto_397033 ) ) ( not ( = ?auto_397028 ?auto_397034 ) ) ( not ( = ?auto_397028 ?auto_397035 ) ) ( not ( = ?auto_397028 ?auto_397036 ) ) ( not ( = ?auto_397028 ?auto_397037 ) ) ( not ( = ?auto_397028 ?auto_397038 ) ) ( not ( = ?auto_397028 ?auto_397039 ) ) ( not ( = ?auto_397029 ?auto_397030 ) ) ( not ( = ?auto_397029 ?auto_397031 ) ) ( not ( = ?auto_397029 ?auto_397032 ) ) ( not ( = ?auto_397029 ?auto_397033 ) ) ( not ( = ?auto_397029 ?auto_397034 ) ) ( not ( = ?auto_397029 ?auto_397035 ) ) ( not ( = ?auto_397029 ?auto_397036 ) ) ( not ( = ?auto_397029 ?auto_397037 ) ) ( not ( = ?auto_397029 ?auto_397038 ) ) ( not ( = ?auto_397029 ?auto_397039 ) ) ( not ( = ?auto_397030 ?auto_397031 ) ) ( not ( = ?auto_397030 ?auto_397032 ) ) ( not ( = ?auto_397030 ?auto_397033 ) ) ( not ( = ?auto_397030 ?auto_397034 ) ) ( not ( = ?auto_397030 ?auto_397035 ) ) ( not ( = ?auto_397030 ?auto_397036 ) ) ( not ( = ?auto_397030 ?auto_397037 ) ) ( not ( = ?auto_397030 ?auto_397038 ) ) ( not ( = ?auto_397030 ?auto_397039 ) ) ( not ( = ?auto_397031 ?auto_397032 ) ) ( not ( = ?auto_397031 ?auto_397033 ) ) ( not ( = ?auto_397031 ?auto_397034 ) ) ( not ( = ?auto_397031 ?auto_397035 ) ) ( not ( = ?auto_397031 ?auto_397036 ) ) ( not ( = ?auto_397031 ?auto_397037 ) ) ( not ( = ?auto_397031 ?auto_397038 ) ) ( not ( = ?auto_397031 ?auto_397039 ) ) ( not ( = ?auto_397032 ?auto_397033 ) ) ( not ( = ?auto_397032 ?auto_397034 ) ) ( not ( = ?auto_397032 ?auto_397035 ) ) ( not ( = ?auto_397032 ?auto_397036 ) ) ( not ( = ?auto_397032 ?auto_397037 ) ) ( not ( = ?auto_397032 ?auto_397038 ) ) ( not ( = ?auto_397032 ?auto_397039 ) ) ( not ( = ?auto_397033 ?auto_397034 ) ) ( not ( = ?auto_397033 ?auto_397035 ) ) ( not ( = ?auto_397033 ?auto_397036 ) ) ( not ( = ?auto_397033 ?auto_397037 ) ) ( not ( = ?auto_397033 ?auto_397038 ) ) ( not ( = ?auto_397033 ?auto_397039 ) ) ( not ( = ?auto_397034 ?auto_397035 ) ) ( not ( = ?auto_397034 ?auto_397036 ) ) ( not ( = ?auto_397034 ?auto_397037 ) ) ( not ( = ?auto_397034 ?auto_397038 ) ) ( not ( = ?auto_397034 ?auto_397039 ) ) ( not ( = ?auto_397035 ?auto_397036 ) ) ( not ( = ?auto_397035 ?auto_397037 ) ) ( not ( = ?auto_397035 ?auto_397038 ) ) ( not ( = ?auto_397035 ?auto_397039 ) ) ( not ( = ?auto_397036 ?auto_397037 ) ) ( not ( = ?auto_397036 ?auto_397038 ) ) ( not ( = ?auto_397036 ?auto_397039 ) ) ( not ( = ?auto_397037 ?auto_397038 ) ) ( not ( = ?auto_397037 ?auto_397039 ) ) ( not ( = ?auto_397038 ?auto_397039 ) ) ( ON ?auto_397038 ?auto_397039 ) ( ON ?auto_397037 ?auto_397038 ) ( ON ?auto_397036 ?auto_397037 ) ( ON ?auto_397035 ?auto_397036 ) ( ON ?auto_397034 ?auto_397035 ) ( ON ?auto_397033 ?auto_397034 ) ( ON ?auto_397032 ?auto_397033 ) ( ON ?auto_397031 ?auto_397032 ) ( ON ?auto_397030 ?auto_397031 ) ( ON ?auto_397029 ?auto_397030 ) ( ON ?auto_397028 ?auto_397029 ) ( ON ?auto_397027 ?auto_397028 ) ( CLEAR ?auto_397025 ) ( ON ?auto_397026 ?auto_397027 ) ( CLEAR ?auto_397026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397025 ?auto_397026 )
      ( MAKE-15PILE ?auto_397025 ?auto_397026 ?auto_397027 ?auto_397028 ?auto_397029 ?auto_397030 ?auto_397031 ?auto_397032 ?auto_397033 ?auto_397034 ?auto_397035 ?auto_397036 ?auto_397037 ?auto_397038 ?auto_397039 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_397055 - BLOCK
      ?auto_397056 - BLOCK
      ?auto_397057 - BLOCK
      ?auto_397058 - BLOCK
      ?auto_397059 - BLOCK
      ?auto_397060 - BLOCK
      ?auto_397061 - BLOCK
      ?auto_397062 - BLOCK
      ?auto_397063 - BLOCK
      ?auto_397064 - BLOCK
      ?auto_397065 - BLOCK
      ?auto_397066 - BLOCK
      ?auto_397067 - BLOCK
      ?auto_397068 - BLOCK
      ?auto_397069 - BLOCK
    )
    :vars
    (
      ?auto_397070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397069 ?auto_397070 ) ( not ( = ?auto_397055 ?auto_397056 ) ) ( not ( = ?auto_397055 ?auto_397057 ) ) ( not ( = ?auto_397055 ?auto_397058 ) ) ( not ( = ?auto_397055 ?auto_397059 ) ) ( not ( = ?auto_397055 ?auto_397060 ) ) ( not ( = ?auto_397055 ?auto_397061 ) ) ( not ( = ?auto_397055 ?auto_397062 ) ) ( not ( = ?auto_397055 ?auto_397063 ) ) ( not ( = ?auto_397055 ?auto_397064 ) ) ( not ( = ?auto_397055 ?auto_397065 ) ) ( not ( = ?auto_397055 ?auto_397066 ) ) ( not ( = ?auto_397055 ?auto_397067 ) ) ( not ( = ?auto_397055 ?auto_397068 ) ) ( not ( = ?auto_397055 ?auto_397069 ) ) ( not ( = ?auto_397055 ?auto_397070 ) ) ( not ( = ?auto_397056 ?auto_397057 ) ) ( not ( = ?auto_397056 ?auto_397058 ) ) ( not ( = ?auto_397056 ?auto_397059 ) ) ( not ( = ?auto_397056 ?auto_397060 ) ) ( not ( = ?auto_397056 ?auto_397061 ) ) ( not ( = ?auto_397056 ?auto_397062 ) ) ( not ( = ?auto_397056 ?auto_397063 ) ) ( not ( = ?auto_397056 ?auto_397064 ) ) ( not ( = ?auto_397056 ?auto_397065 ) ) ( not ( = ?auto_397056 ?auto_397066 ) ) ( not ( = ?auto_397056 ?auto_397067 ) ) ( not ( = ?auto_397056 ?auto_397068 ) ) ( not ( = ?auto_397056 ?auto_397069 ) ) ( not ( = ?auto_397056 ?auto_397070 ) ) ( not ( = ?auto_397057 ?auto_397058 ) ) ( not ( = ?auto_397057 ?auto_397059 ) ) ( not ( = ?auto_397057 ?auto_397060 ) ) ( not ( = ?auto_397057 ?auto_397061 ) ) ( not ( = ?auto_397057 ?auto_397062 ) ) ( not ( = ?auto_397057 ?auto_397063 ) ) ( not ( = ?auto_397057 ?auto_397064 ) ) ( not ( = ?auto_397057 ?auto_397065 ) ) ( not ( = ?auto_397057 ?auto_397066 ) ) ( not ( = ?auto_397057 ?auto_397067 ) ) ( not ( = ?auto_397057 ?auto_397068 ) ) ( not ( = ?auto_397057 ?auto_397069 ) ) ( not ( = ?auto_397057 ?auto_397070 ) ) ( not ( = ?auto_397058 ?auto_397059 ) ) ( not ( = ?auto_397058 ?auto_397060 ) ) ( not ( = ?auto_397058 ?auto_397061 ) ) ( not ( = ?auto_397058 ?auto_397062 ) ) ( not ( = ?auto_397058 ?auto_397063 ) ) ( not ( = ?auto_397058 ?auto_397064 ) ) ( not ( = ?auto_397058 ?auto_397065 ) ) ( not ( = ?auto_397058 ?auto_397066 ) ) ( not ( = ?auto_397058 ?auto_397067 ) ) ( not ( = ?auto_397058 ?auto_397068 ) ) ( not ( = ?auto_397058 ?auto_397069 ) ) ( not ( = ?auto_397058 ?auto_397070 ) ) ( not ( = ?auto_397059 ?auto_397060 ) ) ( not ( = ?auto_397059 ?auto_397061 ) ) ( not ( = ?auto_397059 ?auto_397062 ) ) ( not ( = ?auto_397059 ?auto_397063 ) ) ( not ( = ?auto_397059 ?auto_397064 ) ) ( not ( = ?auto_397059 ?auto_397065 ) ) ( not ( = ?auto_397059 ?auto_397066 ) ) ( not ( = ?auto_397059 ?auto_397067 ) ) ( not ( = ?auto_397059 ?auto_397068 ) ) ( not ( = ?auto_397059 ?auto_397069 ) ) ( not ( = ?auto_397059 ?auto_397070 ) ) ( not ( = ?auto_397060 ?auto_397061 ) ) ( not ( = ?auto_397060 ?auto_397062 ) ) ( not ( = ?auto_397060 ?auto_397063 ) ) ( not ( = ?auto_397060 ?auto_397064 ) ) ( not ( = ?auto_397060 ?auto_397065 ) ) ( not ( = ?auto_397060 ?auto_397066 ) ) ( not ( = ?auto_397060 ?auto_397067 ) ) ( not ( = ?auto_397060 ?auto_397068 ) ) ( not ( = ?auto_397060 ?auto_397069 ) ) ( not ( = ?auto_397060 ?auto_397070 ) ) ( not ( = ?auto_397061 ?auto_397062 ) ) ( not ( = ?auto_397061 ?auto_397063 ) ) ( not ( = ?auto_397061 ?auto_397064 ) ) ( not ( = ?auto_397061 ?auto_397065 ) ) ( not ( = ?auto_397061 ?auto_397066 ) ) ( not ( = ?auto_397061 ?auto_397067 ) ) ( not ( = ?auto_397061 ?auto_397068 ) ) ( not ( = ?auto_397061 ?auto_397069 ) ) ( not ( = ?auto_397061 ?auto_397070 ) ) ( not ( = ?auto_397062 ?auto_397063 ) ) ( not ( = ?auto_397062 ?auto_397064 ) ) ( not ( = ?auto_397062 ?auto_397065 ) ) ( not ( = ?auto_397062 ?auto_397066 ) ) ( not ( = ?auto_397062 ?auto_397067 ) ) ( not ( = ?auto_397062 ?auto_397068 ) ) ( not ( = ?auto_397062 ?auto_397069 ) ) ( not ( = ?auto_397062 ?auto_397070 ) ) ( not ( = ?auto_397063 ?auto_397064 ) ) ( not ( = ?auto_397063 ?auto_397065 ) ) ( not ( = ?auto_397063 ?auto_397066 ) ) ( not ( = ?auto_397063 ?auto_397067 ) ) ( not ( = ?auto_397063 ?auto_397068 ) ) ( not ( = ?auto_397063 ?auto_397069 ) ) ( not ( = ?auto_397063 ?auto_397070 ) ) ( not ( = ?auto_397064 ?auto_397065 ) ) ( not ( = ?auto_397064 ?auto_397066 ) ) ( not ( = ?auto_397064 ?auto_397067 ) ) ( not ( = ?auto_397064 ?auto_397068 ) ) ( not ( = ?auto_397064 ?auto_397069 ) ) ( not ( = ?auto_397064 ?auto_397070 ) ) ( not ( = ?auto_397065 ?auto_397066 ) ) ( not ( = ?auto_397065 ?auto_397067 ) ) ( not ( = ?auto_397065 ?auto_397068 ) ) ( not ( = ?auto_397065 ?auto_397069 ) ) ( not ( = ?auto_397065 ?auto_397070 ) ) ( not ( = ?auto_397066 ?auto_397067 ) ) ( not ( = ?auto_397066 ?auto_397068 ) ) ( not ( = ?auto_397066 ?auto_397069 ) ) ( not ( = ?auto_397066 ?auto_397070 ) ) ( not ( = ?auto_397067 ?auto_397068 ) ) ( not ( = ?auto_397067 ?auto_397069 ) ) ( not ( = ?auto_397067 ?auto_397070 ) ) ( not ( = ?auto_397068 ?auto_397069 ) ) ( not ( = ?auto_397068 ?auto_397070 ) ) ( not ( = ?auto_397069 ?auto_397070 ) ) ( ON ?auto_397068 ?auto_397069 ) ( ON ?auto_397067 ?auto_397068 ) ( ON ?auto_397066 ?auto_397067 ) ( ON ?auto_397065 ?auto_397066 ) ( ON ?auto_397064 ?auto_397065 ) ( ON ?auto_397063 ?auto_397064 ) ( ON ?auto_397062 ?auto_397063 ) ( ON ?auto_397061 ?auto_397062 ) ( ON ?auto_397060 ?auto_397061 ) ( ON ?auto_397059 ?auto_397060 ) ( ON ?auto_397058 ?auto_397059 ) ( ON ?auto_397057 ?auto_397058 ) ( ON ?auto_397056 ?auto_397057 ) ( ON ?auto_397055 ?auto_397056 ) ( CLEAR ?auto_397055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397055 )
      ( MAKE-15PILE ?auto_397055 ?auto_397056 ?auto_397057 ?auto_397058 ?auto_397059 ?auto_397060 ?auto_397061 ?auto_397062 ?auto_397063 ?auto_397064 ?auto_397065 ?auto_397066 ?auto_397067 ?auto_397068 ?auto_397069 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_397086 - BLOCK
      ?auto_397087 - BLOCK
      ?auto_397088 - BLOCK
      ?auto_397089 - BLOCK
      ?auto_397090 - BLOCK
      ?auto_397091 - BLOCK
      ?auto_397092 - BLOCK
      ?auto_397093 - BLOCK
      ?auto_397094 - BLOCK
      ?auto_397095 - BLOCK
      ?auto_397096 - BLOCK
      ?auto_397097 - BLOCK
      ?auto_397098 - BLOCK
      ?auto_397099 - BLOCK
      ?auto_397100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_397100 ) ( not ( = ?auto_397086 ?auto_397087 ) ) ( not ( = ?auto_397086 ?auto_397088 ) ) ( not ( = ?auto_397086 ?auto_397089 ) ) ( not ( = ?auto_397086 ?auto_397090 ) ) ( not ( = ?auto_397086 ?auto_397091 ) ) ( not ( = ?auto_397086 ?auto_397092 ) ) ( not ( = ?auto_397086 ?auto_397093 ) ) ( not ( = ?auto_397086 ?auto_397094 ) ) ( not ( = ?auto_397086 ?auto_397095 ) ) ( not ( = ?auto_397086 ?auto_397096 ) ) ( not ( = ?auto_397086 ?auto_397097 ) ) ( not ( = ?auto_397086 ?auto_397098 ) ) ( not ( = ?auto_397086 ?auto_397099 ) ) ( not ( = ?auto_397086 ?auto_397100 ) ) ( not ( = ?auto_397087 ?auto_397088 ) ) ( not ( = ?auto_397087 ?auto_397089 ) ) ( not ( = ?auto_397087 ?auto_397090 ) ) ( not ( = ?auto_397087 ?auto_397091 ) ) ( not ( = ?auto_397087 ?auto_397092 ) ) ( not ( = ?auto_397087 ?auto_397093 ) ) ( not ( = ?auto_397087 ?auto_397094 ) ) ( not ( = ?auto_397087 ?auto_397095 ) ) ( not ( = ?auto_397087 ?auto_397096 ) ) ( not ( = ?auto_397087 ?auto_397097 ) ) ( not ( = ?auto_397087 ?auto_397098 ) ) ( not ( = ?auto_397087 ?auto_397099 ) ) ( not ( = ?auto_397087 ?auto_397100 ) ) ( not ( = ?auto_397088 ?auto_397089 ) ) ( not ( = ?auto_397088 ?auto_397090 ) ) ( not ( = ?auto_397088 ?auto_397091 ) ) ( not ( = ?auto_397088 ?auto_397092 ) ) ( not ( = ?auto_397088 ?auto_397093 ) ) ( not ( = ?auto_397088 ?auto_397094 ) ) ( not ( = ?auto_397088 ?auto_397095 ) ) ( not ( = ?auto_397088 ?auto_397096 ) ) ( not ( = ?auto_397088 ?auto_397097 ) ) ( not ( = ?auto_397088 ?auto_397098 ) ) ( not ( = ?auto_397088 ?auto_397099 ) ) ( not ( = ?auto_397088 ?auto_397100 ) ) ( not ( = ?auto_397089 ?auto_397090 ) ) ( not ( = ?auto_397089 ?auto_397091 ) ) ( not ( = ?auto_397089 ?auto_397092 ) ) ( not ( = ?auto_397089 ?auto_397093 ) ) ( not ( = ?auto_397089 ?auto_397094 ) ) ( not ( = ?auto_397089 ?auto_397095 ) ) ( not ( = ?auto_397089 ?auto_397096 ) ) ( not ( = ?auto_397089 ?auto_397097 ) ) ( not ( = ?auto_397089 ?auto_397098 ) ) ( not ( = ?auto_397089 ?auto_397099 ) ) ( not ( = ?auto_397089 ?auto_397100 ) ) ( not ( = ?auto_397090 ?auto_397091 ) ) ( not ( = ?auto_397090 ?auto_397092 ) ) ( not ( = ?auto_397090 ?auto_397093 ) ) ( not ( = ?auto_397090 ?auto_397094 ) ) ( not ( = ?auto_397090 ?auto_397095 ) ) ( not ( = ?auto_397090 ?auto_397096 ) ) ( not ( = ?auto_397090 ?auto_397097 ) ) ( not ( = ?auto_397090 ?auto_397098 ) ) ( not ( = ?auto_397090 ?auto_397099 ) ) ( not ( = ?auto_397090 ?auto_397100 ) ) ( not ( = ?auto_397091 ?auto_397092 ) ) ( not ( = ?auto_397091 ?auto_397093 ) ) ( not ( = ?auto_397091 ?auto_397094 ) ) ( not ( = ?auto_397091 ?auto_397095 ) ) ( not ( = ?auto_397091 ?auto_397096 ) ) ( not ( = ?auto_397091 ?auto_397097 ) ) ( not ( = ?auto_397091 ?auto_397098 ) ) ( not ( = ?auto_397091 ?auto_397099 ) ) ( not ( = ?auto_397091 ?auto_397100 ) ) ( not ( = ?auto_397092 ?auto_397093 ) ) ( not ( = ?auto_397092 ?auto_397094 ) ) ( not ( = ?auto_397092 ?auto_397095 ) ) ( not ( = ?auto_397092 ?auto_397096 ) ) ( not ( = ?auto_397092 ?auto_397097 ) ) ( not ( = ?auto_397092 ?auto_397098 ) ) ( not ( = ?auto_397092 ?auto_397099 ) ) ( not ( = ?auto_397092 ?auto_397100 ) ) ( not ( = ?auto_397093 ?auto_397094 ) ) ( not ( = ?auto_397093 ?auto_397095 ) ) ( not ( = ?auto_397093 ?auto_397096 ) ) ( not ( = ?auto_397093 ?auto_397097 ) ) ( not ( = ?auto_397093 ?auto_397098 ) ) ( not ( = ?auto_397093 ?auto_397099 ) ) ( not ( = ?auto_397093 ?auto_397100 ) ) ( not ( = ?auto_397094 ?auto_397095 ) ) ( not ( = ?auto_397094 ?auto_397096 ) ) ( not ( = ?auto_397094 ?auto_397097 ) ) ( not ( = ?auto_397094 ?auto_397098 ) ) ( not ( = ?auto_397094 ?auto_397099 ) ) ( not ( = ?auto_397094 ?auto_397100 ) ) ( not ( = ?auto_397095 ?auto_397096 ) ) ( not ( = ?auto_397095 ?auto_397097 ) ) ( not ( = ?auto_397095 ?auto_397098 ) ) ( not ( = ?auto_397095 ?auto_397099 ) ) ( not ( = ?auto_397095 ?auto_397100 ) ) ( not ( = ?auto_397096 ?auto_397097 ) ) ( not ( = ?auto_397096 ?auto_397098 ) ) ( not ( = ?auto_397096 ?auto_397099 ) ) ( not ( = ?auto_397096 ?auto_397100 ) ) ( not ( = ?auto_397097 ?auto_397098 ) ) ( not ( = ?auto_397097 ?auto_397099 ) ) ( not ( = ?auto_397097 ?auto_397100 ) ) ( not ( = ?auto_397098 ?auto_397099 ) ) ( not ( = ?auto_397098 ?auto_397100 ) ) ( not ( = ?auto_397099 ?auto_397100 ) ) ( ON ?auto_397099 ?auto_397100 ) ( ON ?auto_397098 ?auto_397099 ) ( ON ?auto_397097 ?auto_397098 ) ( ON ?auto_397096 ?auto_397097 ) ( ON ?auto_397095 ?auto_397096 ) ( ON ?auto_397094 ?auto_397095 ) ( ON ?auto_397093 ?auto_397094 ) ( ON ?auto_397092 ?auto_397093 ) ( ON ?auto_397091 ?auto_397092 ) ( ON ?auto_397090 ?auto_397091 ) ( ON ?auto_397089 ?auto_397090 ) ( ON ?auto_397088 ?auto_397089 ) ( ON ?auto_397087 ?auto_397088 ) ( ON ?auto_397086 ?auto_397087 ) ( CLEAR ?auto_397086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397086 )
      ( MAKE-15PILE ?auto_397086 ?auto_397087 ?auto_397088 ?auto_397089 ?auto_397090 ?auto_397091 ?auto_397092 ?auto_397093 ?auto_397094 ?auto_397095 ?auto_397096 ?auto_397097 ?auto_397098 ?auto_397099 ?auto_397100 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_397116 - BLOCK
      ?auto_397117 - BLOCK
      ?auto_397118 - BLOCK
      ?auto_397119 - BLOCK
      ?auto_397120 - BLOCK
      ?auto_397121 - BLOCK
      ?auto_397122 - BLOCK
      ?auto_397123 - BLOCK
      ?auto_397124 - BLOCK
      ?auto_397125 - BLOCK
      ?auto_397126 - BLOCK
      ?auto_397127 - BLOCK
      ?auto_397128 - BLOCK
      ?auto_397129 - BLOCK
      ?auto_397130 - BLOCK
    )
    :vars
    (
      ?auto_397131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_397116 ?auto_397117 ) ) ( not ( = ?auto_397116 ?auto_397118 ) ) ( not ( = ?auto_397116 ?auto_397119 ) ) ( not ( = ?auto_397116 ?auto_397120 ) ) ( not ( = ?auto_397116 ?auto_397121 ) ) ( not ( = ?auto_397116 ?auto_397122 ) ) ( not ( = ?auto_397116 ?auto_397123 ) ) ( not ( = ?auto_397116 ?auto_397124 ) ) ( not ( = ?auto_397116 ?auto_397125 ) ) ( not ( = ?auto_397116 ?auto_397126 ) ) ( not ( = ?auto_397116 ?auto_397127 ) ) ( not ( = ?auto_397116 ?auto_397128 ) ) ( not ( = ?auto_397116 ?auto_397129 ) ) ( not ( = ?auto_397116 ?auto_397130 ) ) ( not ( = ?auto_397117 ?auto_397118 ) ) ( not ( = ?auto_397117 ?auto_397119 ) ) ( not ( = ?auto_397117 ?auto_397120 ) ) ( not ( = ?auto_397117 ?auto_397121 ) ) ( not ( = ?auto_397117 ?auto_397122 ) ) ( not ( = ?auto_397117 ?auto_397123 ) ) ( not ( = ?auto_397117 ?auto_397124 ) ) ( not ( = ?auto_397117 ?auto_397125 ) ) ( not ( = ?auto_397117 ?auto_397126 ) ) ( not ( = ?auto_397117 ?auto_397127 ) ) ( not ( = ?auto_397117 ?auto_397128 ) ) ( not ( = ?auto_397117 ?auto_397129 ) ) ( not ( = ?auto_397117 ?auto_397130 ) ) ( not ( = ?auto_397118 ?auto_397119 ) ) ( not ( = ?auto_397118 ?auto_397120 ) ) ( not ( = ?auto_397118 ?auto_397121 ) ) ( not ( = ?auto_397118 ?auto_397122 ) ) ( not ( = ?auto_397118 ?auto_397123 ) ) ( not ( = ?auto_397118 ?auto_397124 ) ) ( not ( = ?auto_397118 ?auto_397125 ) ) ( not ( = ?auto_397118 ?auto_397126 ) ) ( not ( = ?auto_397118 ?auto_397127 ) ) ( not ( = ?auto_397118 ?auto_397128 ) ) ( not ( = ?auto_397118 ?auto_397129 ) ) ( not ( = ?auto_397118 ?auto_397130 ) ) ( not ( = ?auto_397119 ?auto_397120 ) ) ( not ( = ?auto_397119 ?auto_397121 ) ) ( not ( = ?auto_397119 ?auto_397122 ) ) ( not ( = ?auto_397119 ?auto_397123 ) ) ( not ( = ?auto_397119 ?auto_397124 ) ) ( not ( = ?auto_397119 ?auto_397125 ) ) ( not ( = ?auto_397119 ?auto_397126 ) ) ( not ( = ?auto_397119 ?auto_397127 ) ) ( not ( = ?auto_397119 ?auto_397128 ) ) ( not ( = ?auto_397119 ?auto_397129 ) ) ( not ( = ?auto_397119 ?auto_397130 ) ) ( not ( = ?auto_397120 ?auto_397121 ) ) ( not ( = ?auto_397120 ?auto_397122 ) ) ( not ( = ?auto_397120 ?auto_397123 ) ) ( not ( = ?auto_397120 ?auto_397124 ) ) ( not ( = ?auto_397120 ?auto_397125 ) ) ( not ( = ?auto_397120 ?auto_397126 ) ) ( not ( = ?auto_397120 ?auto_397127 ) ) ( not ( = ?auto_397120 ?auto_397128 ) ) ( not ( = ?auto_397120 ?auto_397129 ) ) ( not ( = ?auto_397120 ?auto_397130 ) ) ( not ( = ?auto_397121 ?auto_397122 ) ) ( not ( = ?auto_397121 ?auto_397123 ) ) ( not ( = ?auto_397121 ?auto_397124 ) ) ( not ( = ?auto_397121 ?auto_397125 ) ) ( not ( = ?auto_397121 ?auto_397126 ) ) ( not ( = ?auto_397121 ?auto_397127 ) ) ( not ( = ?auto_397121 ?auto_397128 ) ) ( not ( = ?auto_397121 ?auto_397129 ) ) ( not ( = ?auto_397121 ?auto_397130 ) ) ( not ( = ?auto_397122 ?auto_397123 ) ) ( not ( = ?auto_397122 ?auto_397124 ) ) ( not ( = ?auto_397122 ?auto_397125 ) ) ( not ( = ?auto_397122 ?auto_397126 ) ) ( not ( = ?auto_397122 ?auto_397127 ) ) ( not ( = ?auto_397122 ?auto_397128 ) ) ( not ( = ?auto_397122 ?auto_397129 ) ) ( not ( = ?auto_397122 ?auto_397130 ) ) ( not ( = ?auto_397123 ?auto_397124 ) ) ( not ( = ?auto_397123 ?auto_397125 ) ) ( not ( = ?auto_397123 ?auto_397126 ) ) ( not ( = ?auto_397123 ?auto_397127 ) ) ( not ( = ?auto_397123 ?auto_397128 ) ) ( not ( = ?auto_397123 ?auto_397129 ) ) ( not ( = ?auto_397123 ?auto_397130 ) ) ( not ( = ?auto_397124 ?auto_397125 ) ) ( not ( = ?auto_397124 ?auto_397126 ) ) ( not ( = ?auto_397124 ?auto_397127 ) ) ( not ( = ?auto_397124 ?auto_397128 ) ) ( not ( = ?auto_397124 ?auto_397129 ) ) ( not ( = ?auto_397124 ?auto_397130 ) ) ( not ( = ?auto_397125 ?auto_397126 ) ) ( not ( = ?auto_397125 ?auto_397127 ) ) ( not ( = ?auto_397125 ?auto_397128 ) ) ( not ( = ?auto_397125 ?auto_397129 ) ) ( not ( = ?auto_397125 ?auto_397130 ) ) ( not ( = ?auto_397126 ?auto_397127 ) ) ( not ( = ?auto_397126 ?auto_397128 ) ) ( not ( = ?auto_397126 ?auto_397129 ) ) ( not ( = ?auto_397126 ?auto_397130 ) ) ( not ( = ?auto_397127 ?auto_397128 ) ) ( not ( = ?auto_397127 ?auto_397129 ) ) ( not ( = ?auto_397127 ?auto_397130 ) ) ( not ( = ?auto_397128 ?auto_397129 ) ) ( not ( = ?auto_397128 ?auto_397130 ) ) ( not ( = ?auto_397129 ?auto_397130 ) ) ( ON ?auto_397116 ?auto_397131 ) ( not ( = ?auto_397130 ?auto_397131 ) ) ( not ( = ?auto_397129 ?auto_397131 ) ) ( not ( = ?auto_397128 ?auto_397131 ) ) ( not ( = ?auto_397127 ?auto_397131 ) ) ( not ( = ?auto_397126 ?auto_397131 ) ) ( not ( = ?auto_397125 ?auto_397131 ) ) ( not ( = ?auto_397124 ?auto_397131 ) ) ( not ( = ?auto_397123 ?auto_397131 ) ) ( not ( = ?auto_397122 ?auto_397131 ) ) ( not ( = ?auto_397121 ?auto_397131 ) ) ( not ( = ?auto_397120 ?auto_397131 ) ) ( not ( = ?auto_397119 ?auto_397131 ) ) ( not ( = ?auto_397118 ?auto_397131 ) ) ( not ( = ?auto_397117 ?auto_397131 ) ) ( not ( = ?auto_397116 ?auto_397131 ) ) ( ON ?auto_397117 ?auto_397116 ) ( ON ?auto_397118 ?auto_397117 ) ( ON ?auto_397119 ?auto_397118 ) ( ON ?auto_397120 ?auto_397119 ) ( ON ?auto_397121 ?auto_397120 ) ( ON ?auto_397122 ?auto_397121 ) ( ON ?auto_397123 ?auto_397122 ) ( ON ?auto_397124 ?auto_397123 ) ( ON ?auto_397125 ?auto_397124 ) ( ON ?auto_397126 ?auto_397125 ) ( ON ?auto_397127 ?auto_397126 ) ( ON ?auto_397128 ?auto_397127 ) ( ON ?auto_397129 ?auto_397128 ) ( ON ?auto_397130 ?auto_397129 ) ( CLEAR ?auto_397130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_397130 ?auto_397129 ?auto_397128 ?auto_397127 ?auto_397126 ?auto_397125 ?auto_397124 ?auto_397123 ?auto_397122 ?auto_397121 ?auto_397120 ?auto_397119 ?auto_397118 ?auto_397117 ?auto_397116 )
      ( MAKE-15PILE ?auto_397116 ?auto_397117 ?auto_397118 ?auto_397119 ?auto_397120 ?auto_397121 ?auto_397122 ?auto_397123 ?auto_397124 ?auto_397125 ?auto_397126 ?auto_397127 ?auto_397128 ?auto_397129 ?auto_397130 ) )
  )

)

