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
      ?auto_59881 - BLOCK
    )
    :vars
    (
      ?auto_59882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59881 ?auto_59882 ) ( CLEAR ?auto_59881 ) ( HAND-EMPTY ) ( not ( = ?auto_59881 ?auto_59882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59881 ?auto_59882 )
      ( !PUTDOWN ?auto_59881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59888 - BLOCK
      ?auto_59889 - BLOCK
    )
    :vars
    (
      ?auto_59890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59888 ) ( ON ?auto_59889 ?auto_59890 ) ( CLEAR ?auto_59889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59888 ) ( not ( = ?auto_59888 ?auto_59889 ) ) ( not ( = ?auto_59888 ?auto_59890 ) ) ( not ( = ?auto_59889 ?auto_59890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59889 ?auto_59890 )
      ( !STACK ?auto_59889 ?auto_59888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59898 - BLOCK
      ?auto_59899 - BLOCK
    )
    :vars
    (
      ?auto_59900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59899 ?auto_59900 ) ( not ( = ?auto_59898 ?auto_59899 ) ) ( not ( = ?auto_59898 ?auto_59900 ) ) ( not ( = ?auto_59899 ?auto_59900 ) ) ( ON ?auto_59898 ?auto_59899 ) ( CLEAR ?auto_59898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59898 )
      ( MAKE-2PILE ?auto_59898 ?auto_59899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59909 - BLOCK
      ?auto_59910 - BLOCK
      ?auto_59911 - BLOCK
    )
    :vars
    (
      ?auto_59912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59910 ) ( ON ?auto_59911 ?auto_59912 ) ( CLEAR ?auto_59911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59909 ) ( ON ?auto_59910 ?auto_59909 ) ( not ( = ?auto_59909 ?auto_59910 ) ) ( not ( = ?auto_59909 ?auto_59911 ) ) ( not ( = ?auto_59909 ?auto_59912 ) ) ( not ( = ?auto_59910 ?auto_59911 ) ) ( not ( = ?auto_59910 ?auto_59912 ) ) ( not ( = ?auto_59911 ?auto_59912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59911 ?auto_59912 )
      ( !STACK ?auto_59911 ?auto_59910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59923 - BLOCK
      ?auto_59924 - BLOCK
      ?auto_59925 - BLOCK
    )
    :vars
    (
      ?auto_59926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59925 ?auto_59926 ) ( ON-TABLE ?auto_59923 ) ( not ( = ?auto_59923 ?auto_59924 ) ) ( not ( = ?auto_59923 ?auto_59925 ) ) ( not ( = ?auto_59923 ?auto_59926 ) ) ( not ( = ?auto_59924 ?auto_59925 ) ) ( not ( = ?auto_59924 ?auto_59926 ) ) ( not ( = ?auto_59925 ?auto_59926 ) ) ( CLEAR ?auto_59923 ) ( ON ?auto_59924 ?auto_59925 ) ( CLEAR ?auto_59924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59923 ?auto_59924 )
      ( MAKE-3PILE ?auto_59923 ?auto_59924 ?auto_59925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59937 - BLOCK
      ?auto_59938 - BLOCK
      ?auto_59939 - BLOCK
    )
    :vars
    (
      ?auto_59940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59939 ?auto_59940 ) ( not ( = ?auto_59937 ?auto_59938 ) ) ( not ( = ?auto_59937 ?auto_59939 ) ) ( not ( = ?auto_59937 ?auto_59940 ) ) ( not ( = ?auto_59938 ?auto_59939 ) ) ( not ( = ?auto_59938 ?auto_59940 ) ) ( not ( = ?auto_59939 ?auto_59940 ) ) ( ON ?auto_59938 ?auto_59939 ) ( ON ?auto_59937 ?auto_59938 ) ( CLEAR ?auto_59937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59937 )
      ( MAKE-3PILE ?auto_59937 ?auto_59938 ?auto_59939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59952 - BLOCK
      ?auto_59953 - BLOCK
      ?auto_59954 - BLOCK
      ?auto_59955 - BLOCK
    )
    :vars
    (
      ?auto_59956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59954 ) ( ON ?auto_59955 ?auto_59956 ) ( CLEAR ?auto_59955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59952 ) ( ON ?auto_59953 ?auto_59952 ) ( ON ?auto_59954 ?auto_59953 ) ( not ( = ?auto_59952 ?auto_59953 ) ) ( not ( = ?auto_59952 ?auto_59954 ) ) ( not ( = ?auto_59952 ?auto_59955 ) ) ( not ( = ?auto_59952 ?auto_59956 ) ) ( not ( = ?auto_59953 ?auto_59954 ) ) ( not ( = ?auto_59953 ?auto_59955 ) ) ( not ( = ?auto_59953 ?auto_59956 ) ) ( not ( = ?auto_59954 ?auto_59955 ) ) ( not ( = ?auto_59954 ?auto_59956 ) ) ( not ( = ?auto_59955 ?auto_59956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59955 ?auto_59956 )
      ( !STACK ?auto_59955 ?auto_59954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59970 - BLOCK
      ?auto_59971 - BLOCK
      ?auto_59972 - BLOCK
      ?auto_59973 - BLOCK
    )
    :vars
    (
      ?auto_59974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59973 ?auto_59974 ) ( ON-TABLE ?auto_59970 ) ( ON ?auto_59971 ?auto_59970 ) ( not ( = ?auto_59970 ?auto_59971 ) ) ( not ( = ?auto_59970 ?auto_59972 ) ) ( not ( = ?auto_59970 ?auto_59973 ) ) ( not ( = ?auto_59970 ?auto_59974 ) ) ( not ( = ?auto_59971 ?auto_59972 ) ) ( not ( = ?auto_59971 ?auto_59973 ) ) ( not ( = ?auto_59971 ?auto_59974 ) ) ( not ( = ?auto_59972 ?auto_59973 ) ) ( not ( = ?auto_59972 ?auto_59974 ) ) ( not ( = ?auto_59973 ?auto_59974 ) ) ( CLEAR ?auto_59971 ) ( ON ?auto_59972 ?auto_59973 ) ( CLEAR ?auto_59972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59970 ?auto_59971 ?auto_59972 )
      ( MAKE-4PILE ?auto_59970 ?auto_59971 ?auto_59972 ?auto_59973 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59988 - BLOCK
      ?auto_59989 - BLOCK
      ?auto_59990 - BLOCK
      ?auto_59991 - BLOCK
    )
    :vars
    (
      ?auto_59992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59991 ?auto_59992 ) ( ON-TABLE ?auto_59988 ) ( not ( = ?auto_59988 ?auto_59989 ) ) ( not ( = ?auto_59988 ?auto_59990 ) ) ( not ( = ?auto_59988 ?auto_59991 ) ) ( not ( = ?auto_59988 ?auto_59992 ) ) ( not ( = ?auto_59989 ?auto_59990 ) ) ( not ( = ?auto_59989 ?auto_59991 ) ) ( not ( = ?auto_59989 ?auto_59992 ) ) ( not ( = ?auto_59990 ?auto_59991 ) ) ( not ( = ?auto_59990 ?auto_59992 ) ) ( not ( = ?auto_59991 ?auto_59992 ) ) ( ON ?auto_59990 ?auto_59991 ) ( CLEAR ?auto_59988 ) ( ON ?auto_59989 ?auto_59990 ) ( CLEAR ?auto_59989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59988 ?auto_59989 )
      ( MAKE-4PILE ?auto_59988 ?auto_59989 ?auto_59990 ?auto_59991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60006 - BLOCK
      ?auto_60007 - BLOCK
      ?auto_60008 - BLOCK
      ?auto_60009 - BLOCK
    )
    :vars
    (
      ?auto_60010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60009 ?auto_60010 ) ( not ( = ?auto_60006 ?auto_60007 ) ) ( not ( = ?auto_60006 ?auto_60008 ) ) ( not ( = ?auto_60006 ?auto_60009 ) ) ( not ( = ?auto_60006 ?auto_60010 ) ) ( not ( = ?auto_60007 ?auto_60008 ) ) ( not ( = ?auto_60007 ?auto_60009 ) ) ( not ( = ?auto_60007 ?auto_60010 ) ) ( not ( = ?auto_60008 ?auto_60009 ) ) ( not ( = ?auto_60008 ?auto_60010 ) ) ( not ( = ?auto_60009 ?auto_60010 ) ) ( ON ?auto_60008 ?auto_60009 ) ( ON ?auto_60007 ?auto_60008 ) ( ON ?auto_60006 ?auto_60007 ) ( CLEAR ?auto_60006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60006 )
      ( MAKE-4PILE ?auto_60006 ?auto_60007 ?auto_60008 ?auto_60009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60025 - BLOCK
      ?auto_60026 - BLOCK
      ?auto_60027 - BLOCK
      ?auto_60028 - BLOCK
      ?auto_60029 - BLOCK
    )
    :vars
    (
      ?auto_60030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60028 ) ( ON ?auto_60029 ?auto_60030 ) ( CLEAR ?auto_60029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60025 ) ( ON ?auto_60026 ?auto_60025 ) ( ON ?auto_60027 ?auto_60026 ) ( ON ?auto_60028 ?auto_60027 ) ( not ( = ?auto_60025 ?auto_60026 ) ) ( not ( = ?auto_60025 ?auto_60027 ) ) ( not ( = ?auto_60025 ?auto_60028 ) ) ( not ( = ?auto_60025 ?auto_60029 ) ) ( not ( = ?auto_60025 ?auto_60030 ) ) ( not ( = ?auto_60026 ?auto_60027 ) ) ( not ( = ?auto_60026 ?auto_60028 ) ) ( not ( = ?auto_60026 ?auto_60029 ) ) ( not ( = ?auto_60026 ?auto_60030 ) ) ( not ( = ?auto_60027 ?auto_60028 ) ) ( not ( = ?auto_60027 ?auto_60029 ) ) ( not ( = ?auto_60027 ?auto_60030 ) ) ( not ( = ?auto_60028 ?auto_60029 ) ) ( not ( = ?auto_60028 ?auto_60030 ) ) ( not ( = ?auto_60029 ?auto_60030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60029 ?auto_60030 )
      ( !STACK ?auto_60029 ?auto_60028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60047 - BLOCK
      ?auto_60048 - BLOCK
      ?auto_60049 - BLOCK
      ?auto_60050 - BLOCK
      ?auto_60051 - BLOCK
    )
    :vars
    (
      ?auto_60052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60051 ?auto_60052 ) ( ON-TABLE ?auto_60047 ) ( ON ?auto_60048 ?auto_60047 ) ( ON ?auto_60049 ?auto_60048 ) ( not ( = ?auto_60047 ?auto_60048 ) ) ( not ( = ?auto_60047 ?auto_60049 ) ) ( not ( = ?auto_60047 ?auto_60050 ) ) ( not ( = ?auto_60047 ?auto_60051 ) ) ( not ( = ?auto_60047 ?auto_60052 ) ) ( not ( = ?auto_60048 ?auto_60049 ) ) ( not ( = ?auto_60048 ?auto_60050 ) ) ( not ( = ?auto_60048 ?auto_60051 ) ) ( not ( = ?auto_60048 ?auto_60052 ) ) ( not ( = ?auto_60049 ?auto_60050 ) ) ( not ( = ?auto_60049 ?auto_60051 ) ) ( not ( = ?auto_60049 ?auto_60052 ) ) ( not ( = ?auto_60050 ?auto_60051 ) ) ( not ( = ?auto_60050 ?auto_60052 ) ) ( not ( = ?auto_60051 ?auto_60052 ) ) ( CLEAR ?auto_60049 ) ( ON ?auto_60050 ?auto_60051 ) ( CLEAR ?auto_60050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60047 ?auto_60048 ?auto_60049 ?auto_60050 )
      ( MAKE-5PILE ?auto_60047 ?auto_60048 ?auto_60049 ?auto_60050 ?auto_60051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60069 - BLOCK
      ?auto_60070 - BLOCK
      ?auto_60071 - BLOCK
      ?auto_60072 - BLOCK
      ?auto_60073 - BLOCK
    )
    :vars
    (
      ?auto_60074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60073 ?auto_60074 ) ( ON-TABLE ?auto_60069 ) ( ON ?auto_60070 ?auto_60069 ) ( not ( = ?auto_60069 ?auto_60070 ) ) ( not ( = ?auto_60069 ?auto_60071 ) ) ( not ( = ?auto_60069 ?auto_60072 ) ) ( not ( = ?auto_60069 ?auto_60073 ) ) ( not ( = ?auto_60069 ?auto_60074 ) ) ( not ( = ?auto_60070 ?auto_60071 ) ) ( not ( = ?auto_60070 ?auto_60072 ) ) ( not ( = ?auto_60070 ?auto_60073 ) ) ( not ( = ?auto_60070 ?auto_60074 ) ) ( not ( = ?auto_60071 ?auto_60072 ) ) ( not ( = ?auto_60071 ?auto_60073 ) ) ( not ( = ?auto_60071 ?auto_60074 ) ) ( not ( = ?auto_60072 ?auto_60073 ) ) ( not ( = ?auto_60072 ?auto_60074 ) ) ( not ( = ?auto_60073 ?auto_60074 ) ) ( ON ?auto_60072 ?auto_60073 ) ( CLEAR ?auto_60070 ) ( ON ?auto_60071 ?auto_60072 ) ( CLEAR ?auto_60071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60069 ?auto_60070 ?auto_60071 )
      ( MAKE-5PILE ?auto_60069 ?auto_60070 ?auto_60071 ?auto_60072 ?auto_60073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60091 - BLOCK
      ?auto_60092 - BLOCK
      ?auto_60093 - BLOCK
      ?auto_60094 - BLOCK
      ?auto_60095 - BLOCK
    )
    :vars
    (
      ?auto_60096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60095 ?auto_60096 ) ( ON-TABLE ?auto_60091 ) ( not ( = ?auto_60091 ?auto_60092 ) ) ( not ( = ?auto_60091 ?auto_60093 ) ) ( not ( = ?auto_60091 ?auto_60094 ) ) ( not ( = ?auto_60091 ?auto_60095 ) ) ( not ( = ?auto_60091 ?auto_60096 ) ) ( not ( = ?auto_60092 ?auto_60093 ) ) ( not ( = ?auto_60092 ?auto_60094 ) ) ( not ( = ?auto_60092 ?auto_60095 ) ) ( not ( = ?auto_60092 ?auto_60096 ) ) ( not ( = ?auto_60093 ?auto_60094 ) ) ( not ( = ?auto_60093 ?auto_60095 ) ) ( not ( = ?auto_60093 ?auto_60096 ) ) ( not ( = ?auto_60094 ?auto_60095 ) ) ( not ( = ?auto_60094 ?auto_60096 ) ) ( not ( = ?auto_60095 ?auto_60096 ) ) ( ON ?auto_60094 ?auto_60095 ) ( ON ?auto_60093 ?auto_60094 ) ( CLEAR ?auto_60091 ) ( ON ?auto_60092 ?auto_60093 ) ( CLEAR ?auto_60092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60091 ?auto_60092 )
      ( MAKE-5PILE ?auto_60091 ?auto_60092 ?auto_60093 ?auto_60094 ?auto_60095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60113 - BLOCK
      ?auto_60114 - BLOCK
      ?auto_60115 - BLOCK
      ?auto_60116 - BLOCK
      ?auto_60117 - BLOCK
    )
    :vars
    (
      ?auto_60118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60117 ?auto_60118 ) ( not ( = ?auto_60113 ?auto_60114 ) ) ( not ( = ?auto_60113 ?auto_60115 ) ) ( not ( = ?auto_60113 ?auto_60116 ) ) ( not ( = ?auto_60113 ?auto_60117 ) ) ( not ( = ?auto_60113 ?auto_60118 ) ) ( not ( = ?auto_60114 ?auto_60115 ) ) ( not ( = ?auto_60114 ?auto_60116 ) ) ( not ( = ?auto_60114 ?auto_60117 ) ) ( not ( = ?auto_60114 ?auto_60118 ) ) ( not ( = ?auto_60115 ?auto_60116 ) ) ( not ( = ?auto_60115 ?auto_60117 ) ) ( not ( = ?auto_60115 ?auto_60118 ) ) ( not ( = ?auto_60116 ?auto_60117 ) ) ( not ( = ?auto_60116 ?auto_60118 ) ) ( not ( = ?auto_60117 ?auto_60118 ) ) ( ON ?auto_60116 ?auto_60117 ) ( ON ?auto_60115 ?auto_60116 ) ( ON ?auto_60114 ?auto_60115 ) ( ON ?auto_60113 ?auto_60114 ) ( CLEAR ?auto_60113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60113 )
      ( MAKE-5PILE ?auto_60113 ?auto_60114 ?auto_60115 ?auto_60116 ?auto_60117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60136 - BLOCK
      ?auto_60137 - BLOCK
      ?auto_60138 - BLOCK
      ?auto_60139 - BLOCK
      ?auto_60140 - BLOCK
      ?auto_60141 - BLOCK
    )
    :vars
    (
      ?auto_60142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60140 ) ( ON ?auto_60141 ?auto_60142 ) ( CLEAR ?auto_60141 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60136 ) ( ON ?auto_60137 ?auto_60136 ) ( ON ?auto_60138 ?auto_60137 ) ( ON ?auto_60139 ?auto_60138 ) ( ON ?auto_60140 ?auto_60139 ) ( not ( = ?auto_60136 ?auto_60137 ) ) ( not ( = ?auto_60136 ?auto_60138 ) ) ( not ( = ?auto_60136 ?auto_60139 ) ) ( not ( = ?auto_60136 ?auto_60140 ) ) ( not ( = ?auto_60136 ?auto_60141 ) ) ( not ( = ?auto_60136 ?auto_60142 ) ) ( not ( = ?auto_60137 ?auto_60138 ) ) ( not ( = ?auto_60137 ?auto_60139 ) ) ( not ( = ?auto_60137 ?auto_60140 ) ) ( not ( = ?auto_60137 ?auto_60141 ) ) ( not ( = ?auto_60137 ?auto_60142 ) ) ( not ( = ?auto_60138 ?auto_60139 ) ) ( not ( = ?auto_60138 ?auto_60140 ) ) ( not ( = ?auto_60138 ?auto_60141 ) ) ( not ( = ?auto_60138 ?auto_60142 ) ) ( not ( = ?auto_60139 ?auto_60140 ) ) ( not ( = ?auto_60139 ?auto_60141 ) ) ( not ( = ?auto_60139 ?auto_60142 ) ) ( not ( = ?auto_60140 ?auto_60141 ) ) ( not ( = ?auto_60140 ?auto_60142 ) ) ( not ( = ?auto_60141 ?auto_60142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60141 ?auto_60142 )
      ( !STACK ?auto_60141 ?auto_60140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60162 - BLOCK
      ?auto_60163 - BLOCK
      ?auto_60164 - BLOCK
      ?auto_60165 - BLOCK
      ?auto_60166 - BLOCK
      ?auto_60167 - BLOCK
    )
    :vars
    (
      ?auto_60168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60167 ?auto_60168 ) ( ON-TABLE ?auto_60162 ) ( ON ?auto_60163 ?auto_60162 ) ( ON ?auto_60164 ?auto_60163 ) ( ON ?auto_60165 ?auto_60164 ) ( not ( = ?auto_60162 ?auto_60163 ) ) ( not ( = ?auto_60162 ?auto_60164 ) ) ( not ( = ?auto_60162 ?auto_60165 ) ) ( not ( = ?auto_60162 ?auto_60166 ) ) ( not ( = ?auto_60162 ?auto_60167 ) ) ( not ( = ?auto_60162 ?auto_60168 ) ) ( not ( = ?auto_60163 ?auto_60164 ) ) ( not ( = ?auto_60163 ?auto_60165 ) ) ( not ( = ?auto_60163 ?auto_60166 ) ) ( not ( = ?auto_60163 ?auto_60167 ) ) ( not ( = ?auto_60163 ?auto_60168 ) ) ( not ( = ?auto_60164 ?auto_60165 ) ) ( not ( = ?auto_60164 ?auto_60166 ) ) ( not ( = ?auto_60164 ?auto_60167 ) ) ( not ( = ?auto_60164 ?auto_60168 ) ) ( not ( = ?auto_60165 ?auto_60166 ) ) ( not ( = ?auto_60165 ?auto_60167 ) ) ( not ( = ?auto_60165 ?auto_60168 ) ) ( not ( = ?auto_60166 ?auto_60167 ) ) ( not ( = ?auto_60166 ?auto_60168 ) ) ( not ( = ?auto_60167 ?auto_60168 ) ) ( CLEAR ?auto_60165 ) ( ON ?auto_60166 ?auto_60167 ) ( CLEAR ?auto_60166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60162 ?auto_60163 ?auto_60164 ?auto_60165 ?auto_60166 )
      ( MAKE-6PILE ?auto_60162 ?auto_60163 ?auto_60164 ?auto_60165 ?auto_60166 ?auto_60167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60188 - BLOCK
      ?auto_60189 - BLOCK
      ?auto_60190 - BLOCK
      ?auto_60191 - BLOCK
      ?auto_60192 - BLOCK
      ?auto_60193 - BLOCK
    )
    :vars
    (
      ?auto_60194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60193 ?auto_60194 ) ( ON-TABLE ?auto_60188 ) ( ON ?auto_60189 ?auto_60188 ) ( ON ?auto_60190 ?auto_60189 ) ( not ( = ?auto_60188 ?auto_60189 ) ) ( not ( = ?auto_60188 ?auto_60190 ) ) ( not ( = ?auto_60188 ?auto_60191 ) ) ( not ( = ?auto_60188 ?auto_60192 ) ) ( not ( = ?auto_60188 ?auto_60193 ) ) ( not ( = ?auto_60188 ?auto_60194 ) ) ( not ( = ?auto_60189 ?auto_60190 ) ) ( not ( = ?auto_60189 ?auto_60191 ) ) ( not ( = ?auto_60189 ?auto_60192 ) ) ( not ( = ?auto_60189 ?auto_60193 ) ) ( not ( = ?auto_60189 ?auto_60194 ) ) ( not ( = ?auto_60190 ?auto_60191 ) ) ( not ( = ?auto_60190 ?auto_60192 ) ) ( not ( = ?auto_60190 ?auto_60193 ) ) ( not ( = ?auto_60190 ?auto_60194 ) ) ( not ( = ?auto_60191 ?auto_60192 ) ) ( not ( = ?auto_60191 ?auto_60193 ) ) ( not ( = ?auto_60191 ?auto_60194 ) ) ( not ( = ?auto_60192 ?auto_60193 ) ) ( not ( = ?auto_60192 ?auto_60194 ) ) ( not ( = ?auto_60193 ?auto_60194 ) ) ( ON ?auto_60192 ?auto_60193 ) ( CLEAR ?auto_60190 ) ( ON ?auto_60191 ?auto_60192 ) ( CLEAR ?auto_60191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60188 ?auto_60189 ?auto_60190 ?auto_60191 )
      ( MAKE-6PILE ?auto_60188 ?auto_60189 ?auto_60190 ?auto_60191 ?auto_60192 ?auto_60193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60214 - BLOCK
      ?auto_60215 - BLOCK
      ?auto_60216 - BLOCK
      ?auto_60217 - BLOCK
      ?auto_60218 - BLOCK
      ?auto_60219 - BLOCK
    )
    :vars
    (
      ?auto_60220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60219 ?auto_60220 ) ( ON-TABLE ?auto_60214 ) ( ON ?auto_60215 ?auto_60214 ) ( not ( = ?auto_60214 ?auto_60215 ) ) ( not ( = ?auto_60214 ?auto_60216 ) ) ( not ( = ?auto_60214 ?auto_60217 ) ) ( not ( = ?auto_60214 ?auto_60218 ) ) ( not ( = ?auto_60214 ?auto_60219 ) ) ( not ( = ?auto_60214 ?auto_60220 ) ) ( not ( = ?auto_60215 ?auto_60216 ) ) ( not ( = ?auto_60215 ?auto_60217 ) ) ( not ( = ?auto_60215 ?auto_60218 ) ) ( not ( = ?auto_60215 ?auto_60219 ) ) ( not ( = ?auto_60215 ?auto_60220 ) ) ( not ( = ?auto_60216 ?auto_60217 ) ) ( not ( = ?auto_60216 ?auto_60218 ) ) ( not ( = ?auto_60216 ?auto_60219 ) ) ( not ( = ?auto_60216 ?auto_60220 ) ) ( not ( = ?auto_60217 ?auto_60218 ) ) ( not ( = ?auto_60217 ?auto_60219 ) ) ( not ( = ?auto_60217 ?auto_60220 ) ) ( not ( = ?auto_60218 ?auto_60219 ) ) ( not ( = ?auto_60218 ?auto_60220 ) ) ( not ( = ?auto_60219 ?auto_60220 ) ) ( ON ?auto_60218 ?auto_60219 ) ( ON ?auto_60217 ?auto_60218 ) ( CLEAR ?auto_60215 ) ( ON ?auto_60216 ?auto_60217 ) ( CLEAR ?auto_60216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60214 ?auto_60215 ?auto_60216 )
      ( MAKE-6PILE ?auto_60214 ?auto_60215 ?auto_60216 ?auto_60217 ?auto_60218 ?auto_60219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60240 - BLOCK
      ?auto_60241 - BLOCK
      ?auto_60242 - BLOCK
      ?auto_60243 - BLOCK
      ?auto_60244 - BLOCK
      ?auto_60245 - BLOCK
    )
    :vars
    (
      ?auto_60246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60245 ?auto_60246 ) ( ON-TABLE ?auto_60240 ) ( not ( = ?auto_60240 ?auto_60241 ) ) ( not ( = ?auto_60240 ?auto_60242 ) ) ( not ( = ?auto_60240 ?auto_60243 ) ) ( not ( = ?auto_60240 ?auto_60244 ) ) ( not ( = ?auto_60240 ?auto_60245 ) ) ( not ( = ?auto_60240 ?auto_60246 ) ) ( not ( = ?auto_60241 ?auto_60242 ) ) ( not ( = ?auto_60241 ?auto_60243 ) ) ( not ( = ?auto_60241 ?auto_60244 ) ) ( not ( = ?auto_60241 ?auto_60245 ) ) ( not ( = ?auto_60241 ?auto_60246 ) ) ( not ( = ?auto_60242 ?auto_60243 ) ) ( not ( = ?auto_60242 ?auto_60244 ) ) ( not ( = ?auto_60242 ?auto_60245 ) ) ( not ( = ?auto_60242 ?auto_60246 ) ) ( not ( = ?auto_60243 ?auto_60244 ) ) ( not ( = ?auto_60243 ?auto_60245 ) ) ( not ( = ?auto_60243 ?auto_60246 ) ) ( not ( = ?auto_60244 ?auto_60245 ) ) ( not ( = ?auto_60244 ?auto_60246 ) ) ( not ( = ?auto_60245 ?auto_60246 ) ) ( ON ?auto_60244 ?auto_60245 ) ( ON ?auto_60243 ?auto_60244 ) ( ON ?auto_60242 ?auto_60243 ) ( CLEAR ?auto_60240 ) ( ON ?auto_60241 ?auto_60242 ) ( CLEAR ?auto_60241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60240 ?auto_60241 )
      ( MAKE-6PILE ?auto_60240 ?auto_60241 ?auto_60242 ?auto_60243 ?auto_60244 ?auto_60245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60266 - BLOCK
      ?auto_60267 - BLOCK
      ?auto_60268 - BLOCK
      ?auto_60269 - BLOCK
      ?auto_60270 - BLOCK
      ?auto_60271 - BLOCK
    )
    :vars
    (
      ?auto_60272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60271 ?auto_60272 ) ( not ( = ?auto_60266 ?auto_60267 ) ) ( not ( = ?auto_60266 ?auto_60268 ) ) ( not ( = ?auto_60266 ?auto_60269 ) ) ( not ( = ?auto_60266 ?auto_60270 ) ) ( not ( = ?auto_60266 ?auto_60271 ) ) ( not ( = ?auto_60266 ?auto_60272 ) ) ( not ( = ?auto_60267 ?auto_60268 ) ) ( not ( = ?auto_60267 ?auto_60269 ) ) ( not ( = ?auto_60267 ?auto_60270 ) ) ( not ( = ?auto_60267 ?auto_60271 ) ) ( not ( = ?auto_60267 ?auto_60272 ) ) ( not ( = ?auto_60268 ?auto_60269 ) ) ( not ( = ?auto_60268 ?auto_60270 ) ) ( not ( = ?auto_60268 ?auto_60271 ) ) ( not ( = ?auto_60268 ?auto_60272 ) ) ( not ( = ?auto_60269 ?auto_60270 ) ) ( not ( = ?auto_60269 ?auto_60271 ) ) ( not ( = ?auto_60269 ?auto_60272 ) ) ( not ( = ?auto_60270 ?auto_60271 ) ) ( not ( = ?auto_60270 ?auto_60272 ) ) ( not ( = ?auto_60271 ?auto_60272 ) ) ( ON ?auto_60270 ?auto_60271 ) ( ON ?auto_60269 ?auto_60270 ) ( ON ?auto_60268 ?auto_60269 ) ( ON ?auto_60267 ?auto_60268 ) ( ON ?auto_60266 ?auto_60267 ) ( CLEAR ?auto_60266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60266 )
      ( MAKE-6PILE ?auto_60266 ?auto_60267 ?auto_60268 ?auto_60269 ?auto_60270 ?auto_60271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60293 - BLOCK
      ?auto_60294 - BLOCK
      ?auto_60295 - BLOCK
      ?auto_60296 - BLOCK
      ?auto_60297 - BLOCK
      ?auto_60298 - BLOCK
      ?auto_60299 - BLOCK
    )
    :vars
    (
      ?auto_60300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60298 ) ( ON ?auto_60299 ?auto_60300 ) ( CLEAR ?auto_60299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60293 ) ( ON ?auto_60294 ?auto_60293 ) ( ON ?auto_60295 ?auto_60294 ) ( ON ?auto_60296 ?auto_60295 ) ( ON ?auto_60297 ?auto_60296 ) ( ON ?auto_60298 ?auto_60297 ) ( not ( = ?auto_60293 ?auto_60294 ) ) ( not ( = ?auto_60293 ?auto_60295 ) ) ( not ( = ?auto_60293 ?auto_60296 ) ) ( not ( = ?auto_60293 ?auto_60297 ) ) ( not ( = ?auto_60293 ?auto_60298 ) ) ( not ( = ?auto_60293 ?auto_60299 ) ) ( not ( = ?auto_60293 ?auto_60300 ) ) ( not ( = ?auto_60294 ?auto_60295 ) ) ( not ( = ?auto_60294 ?auto_60296 ) ) ( not ( = ?auto_60294 ?auto_60297 ) ) ( not ( = ?auto_60294 ?auto_60298 ) ) ( not ( = ?auto_60294 ?auto_60299 ) ) ( not ( = ?auto_60294 ?auto_60300 ) ) ( not ( = ?auto_60295 ?auto_60296 ) ) ( not ( = ?auto_60295 ?auto_60297 ) ) ( not ( = ?auto_60295 ?auto_60298 ) ) ( not ( = ?auto_60295 ?auto_60299 ) ) ( not ( = ?auto_60295 ?auto_60300 ) ) ( not ( = ?auto_60296 ?auto_60297 ) ) ( not ( = ?auto_60296 ?auto_60298 ) ) ( not ( = ?auto_60296 ?auto_60299 ) ) ( not ( = ?auto_60296 ?auto_60300 ) ) ( not ( = ?auto_60297 ?auto_60298 ) ) ( not ( = ?auto_60297 ?auto_60299 ) ) ( not ( = ?auto_60297 ?auto_60300 ) ) ( not ( = ?auto_60298 ?auto_60299 ) ) ( not ( = ?auto_60298 ?auto_60300 ) ) ( not ( = ?auto_60299 ?auto_60300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60299 ?auto_60300 )
      ( !STACK ?auto_60299 ?auto_60298 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60323 - BLOCK
      ?auto_60324 - BLOCK
      ?auto_60325 - BLOCK
      ?auto_60326 - BLOCK
      ?auto_60327 - BLOCK
      ?auto_60328 - BLOCK
      ?auto_60329 - BLOCK
    )
    :vars
    (
      ?auto_60330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60329 ?auto_60330 ) ( ON-TABLE ?auto_60323 ) ( ON ?auto_60324 ?auto_60323 ) ( ON ?auto_60325 ?auto_60324 ) ( ON ?auto_60326 ?auto_60325 ) ( ON ?auto_60327 ?auto_60326 ) ( not ( = ?auto_60323 ?auto_60324 ) ) ( not ( = ?auto_60323 ?auto_60325 ) ) ( not ( = ?auto_60323 ?auto_60326 ) ) ( not ( = ?auto_60323 ?auto_60327 ) ) ( not ( = ?auto_60323 ?auto_60328 ) ) ( not ( = ?auto_60323 ?auto_60329 ) ) ( not ( = ?auto_60323 ?auto_60330 ) ) ( not ( = ?auto_60324 ?auto_60325 ) ) ( not ( = ?auto_60324 ?auto_60326 ) ) ( not ( = ?auto_60324 ?auto_60327 ) ) ( not ( = ?auto_60324 ?auto_60328 ) ) ( not ( = ?auto_60324 ?auto_60329 ) ) ( not ( = ?auto_60324 ?auto_60330 ) ) ( not ( = ?auto_60325 ?auto_60326 ) ) ( not ( = ?auto_60325 ?auto_60327 ) ) ( not ( = ?auto_60325 ?auto_60328 ) ) ( not ( = ?auto_60325 ?auto_60329 ) ) ( not ( = ?auto_60325 ?auto_60330 ) ) ( not ( = ?auto_60326 ?auto_60327 ) ) ( not ( = ?auto_60326 ?auto_60328 ) ) ( not ( = ?auto_60326 ?auto_60329 ) ) ( not ( = ?auto_60326 ?auto_60330 ) ) ( not ( = ?auto_60327 ?auto_60328 ) ) ( not ( = ?auto_60327 ?auto_60329 ) ) ( not ( = ?auto_60327 ?auto_60330 ) ) ( not ( = ?auto_60328 ?auto_60329 ) ) ( not ( = ?auto_60328 ?auto_60330 ) ) ( not ( = ?auto_60329 ?auto_60330 ) ) ( CLEAR ?auto_60327 ) ( ON ?auto_60328 ?auto_60329 ) ( CLEAR ?auto_60328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60323 ?auto_60324 ?auto_60325 ?auto_60326 ?auto_60327 ?auto_60328 )
      ( MAKE-7PILE ?auto_60323 ?auto_60324 ?auto_60325 ?auto_60326 ?auto_60327 ?auto_60328 ?auto_60329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60353 - BLOCK
      ?auto_60354 - BLOCK
      ?auto_60355 - BLOCK
      ?auto_60356 - BLOCK
      ?auto_60357 - BLOCK
      ?auto_60358 - BLOCK
      ?auto_60359 - BLOCK
    )
    :vars
    (
      ?auto_60360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60359 ?auto_60360 ) ( ON-TABLE ?auto_60353 ) ( ON ?auto_60354 ?auto_60353 ) ( ON ?auto_60355 ?auto_60354 ) ( ON ?auto_60356 ?auto_60355 ) ( not ( = ?auto_60353 ?auto_60354 ) ) ( not ( = ?auto_60353 ?auto_60355 ) ) ( not ( = ?auto_60353 ?auto_60356 ) ) ( not ( = ?auto_60353 ?auto_60357 ) ) ( not ( = ?auto_60353 ?auto_60358 ) ) ( not ( = ?auto_60353 ?auto_60359 ) ) ( not ( = ?auto_60353 ?auto_60360 ) ) ( not ( = ?auto_60354 ?auto_60355 ) ) ( not ( = ?auto_60354 ?auto_60356 ) ) ( not ( = ?auto_60354 ?auto_60357 ) ) ( not ( = ?auto_60354 ?auto_60358 ) ) ( not ( = ?auto_60354 ?auto_60359 ) ) ( not ( = ?auto_60354 ?auto_60360 ) ) ( not ( = ?auto_60355 ?auto_60356 ) ) ( not ( = ?auto_60355 ?auto_60357 ) ) ( not ( = ?auto_60355 ?auto_60358 ) ) ( not ( = ?auto_60355 ?auto_60359 ) ) ( not ( = ?auto_60355 ?auto_60360 ) ) ( not ( = ?auto_60356 ?auto_60357 ) ) ( not ( = ?auto_60356 ?auto_60358 ) ) ( not ( = ?auto_60356 ?auto_60359 ) ) ( not ( = ?auto_60356 ?auto_60360 ) ) ( not ( = ?auto_60357 ?auto_60358 ) ) ( not ( = ?auto_60357 ?auto_60359 ) ) ( not ( = ?auto_60357 ?auto_60360 ) ) ( not ( = ?auto_60358 ?auto_60359 ) ) ( not ( = ?auto_60358 ?auto_60360 ) ) ( not ( = ?auto_60359 ?auto_60360 ) ) ( ON ?auto_60358 ?auto_60359 ) ( CLEAR ?auto_60356 ) ( ON ?auto_60357 ?auto_60358 ) ( CLEAR ?auto_60357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60353 ?auto_60354 ?auto_60355 ?auto_60356 ?auto_60357 )
      ( MAKE-7PILE ?auto_60353 ?auto_60354 ?auto_60355 ?auto_60356 ?auto_60357 ?auto_60358 ?auto_60359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60383 - BLOCK
      ?auto_60384 - BLOCK
      ?auto_60385 - BLOCK
      ?auto_60386 - BLOCK
      ?auto_60387 - BLOCK
      ?auto_60388 - BLOCK
      ?auto_60389 - BLOCK
    )
    :vars
    (
      ?auto_60390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60389 ?auto_60390 ) ( ON-TABLE ?auto_60383 ) ( ON ?auto_60384 ?auto_60383 ) ( ON ?auto_60385 ?auto_60384 ) ( not ( = ?auto_60383 ?auto_60384 ) ) ( not ( = ?auto_60383 ?auto_60385 ) ) ( not ( = ?auto_60383 ?auto_60386 ) ) ( not ( = ?auto_60383 ?auto_60387 ) ) ( not ( = ?auto_60383 ?auto_60388 ) ) ( not ( = ?auto_60383 ?auto_60389 ) ) ( not ( = ?auto_60383 ?auto_60390 ) ) ( not ( = ?auto_60384 ?auto_60385 ) ) ( not ( = ?auto_60384 ?auto_60386 ) ) ( not ( = ?auto_60384 ?auto_60387 ) ) ( not ( = ?auto_60384 ?auto_60388 ) ) ( not ( = ?auto_60384 ?auto_60389 ) ) ( not ( = ?auto_60384 ?auto_60390 ) ) ( not ( = ?auto_60385 ?auto_60386 ) ) ( not ( = ?auto_60385 ?auto_60387 ) ) ( not ( = ?auto_60385 ?auto_60388 ) ) ( not ( = ?auto_60385 ?auto_60389 ) ) ( not ( = ?auto_60385 ?auto_60390 ) ) ( not ( = ?auto_60386 ?auto_60387 ) ) ( not ( = ?auto_60386 ?auto_60388 ) ) ( not ( = ?auto_60386 ?auto_60389 ) ) ( not ( = ?auto_60386 ?auto_60390 ) ) ( not ( = ?auto_60387 ?auto_60388 ) ) ( not ( = ?auto_60387 ?auto_60389 ) ) ( not ( = ?auto_60387 ?auto_60390 ) ) ( not ( = ?auto_60388 ?auto_60389 ) ) ( not ( = ?auto_60388 ?auto_60390 ) ) ( not ( = ?auto_60389 ?auto_60390 ) ) ( ON ?auto_60388 ?auto_60389 ) ( ON ?auto_60387 ?auto_60388 ) ( CLEAR ?auto_60385 ) ( ON ?auto_60386 ?auto_60387 ) ( CLEAR ?auto_60386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60383 ?auto_60384 ?auto_60385 ?auto_60386 )
      ( MAKE-7PILE ?auto_60383 ?auto_60384 ?auto_60385 ?auto_60386 ?auto_60387 ?auto_60388 ?auto_60389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60413 - BLOCK
      ?auto_60414 - BLOCK
      ?auto_60415 - BLOCK
      ?auto_60416 - BLOCK
      ?auto_60417 - BLOCK
      ?auto_60418 - BLOCK
      ?auto_60419 - BLOCK
    )
    :vars
    (
      ?auto_60420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60419 ?auto_60420 ) ( ON-TABLE ?auto_60413 ) ( ON ?auto_60414 ?auto_60413 ) ( not ( = ?auto_60413 ?auto_60414 ) ) ( not ( = ?auto_60413 ?auto_60415 ) ) ( not ( = ?auto_60413 ?auto_60416 ) ) ( not ( = ?auto_60413 ?auto_60417 ) ) ( not ( = ?auto_60413 ?auto_60418 ) ) ( not ( = ?auto_60413 ?auto_60419 ) ) ( not ( = ?auto_60413 ?auto_60420 ) ) ( not ( = ?auto_60414 ?auto_60415 ) ) ( not ( = ?auto_60414 ?auto_60416 ) ) ( not ( = ?auto_60414 ?auto_60417 ) ) ( not ( = ?auto_60414 ?auto_60418 ) ) ( not ( = ?auto_60414 ?auto_60419 ) ) ( not ( = ?auto_60414 ?auto_60420 ) ) ( not ( = ?auto_60415 ?auto_60416 ) ) ( not ( = ?auto_60415 ?auto_60417 ) ) ( not ( = ?auto_60415 ?auto_60418 ) ) ( not ( = ?auto_60415 ?auto_60419 ) ) ( not ( = ?auto_60415 ?auto_60420 ) ) ( not ( = ?auto_60416 ?auto_60417 ) ) ( not ( = ?auto_60416 ?auto_60418 ) ) ( not ( = ?auto_60416 ?auto_60419 ) ) ( not ( = ?auto_60416 ?auto_60420 ) ) ( not ( = ?auto_60417 ?auto_60418 ) ) ( not ( = ?auto_60417 ?auto_60419 ) ) ( not ( = ?auto_60417 ?auto_60420 ) ) ( not ( = ?auto_60418 ?auto_60419 ) ) ( not ( = ?auto_60418 ?auto_60420 ) ) ( not ( = ?auto_60419 ?auto_60420 ) ) ( ON ?auto_60418 ?auto_60419 ) ( ON ?auto_60417 ?auto_60418 ) ( ON ?auto_60416 ?auto_60417 ) ( CLEAR ?auto_60414 ) ( ON ?auto_60415 ?auto_60416 ) ( CLEAR ?auto_60415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60413 ?auto_60414 ?auto_60415 )
      ( MAKE-7PILE ?auto_60413 ?auto_60414 ?auto_60415 ?auto_60416 ?auto_60417 ?auto_60418 ?auto_60419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60443 - BLOCK
      ?auto_60444 - BLOCK
      ?auto_60445 - BLOCK
      ?auto_60446 - BLOCK
      ?auto_60447 - BLOCK
      ?auto_60448 - BLOCK
      ?auto_60449 - BLOCK
    )
    :vars
    (
      ?auto_60450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60449 ?auto_60450 ) ( ON-TABLE ?auto_60443 ) ( not ( = ?auto_60443 ?auto_60444 ) ) ( not ( = ?auto_60443 ?auto_60445 ) ) ( not ( = ?auto_60443 ?auto_60446 ) ) ( not ( = ?auto_60443 ?auto_60447 ) ) ( not ( = ?auto_60443 ?auto_60448 ) ) ( not ( = ?auto_60443 ?auto_60449 ) ) ( not ( = ?auto_60443 ?auto_60450 ) ) ( not ( = ?auto_60444 ?auto_60445 ) ) ( not ( = ?auto_60444 ?auto_60446 ) ) ( not ( = ?auto_60444 ?auto_60447 ) ) ( not ( = ?auto_60444 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60449 ) ) ( not ( = ?auto_60444 ?auto_60450 ) ) ( not ( = ?auto_60445 ?auto_60446 ) ) ( not ( = ?auto_60445 ?auto_60447 ) ) ( not ( = ?auto_60445 ?auto_60448 ) ) ( not ( = ?auto_60445 ?auto_60449 ) ) ( not ( = ?auto_60445 ?auto_60450 ) ) ( not ( = ?auto_60446 ?auto_60447 ) ) ( not ( = ?auto_60446 ?auto_60448 ) ) ( not ( = ?auto_60446 ?auto_60449 ) ) ( not ( = ?auto_60446 ?auto_60450 ) ) ( not ( = ?auto_60447 ?auto_60448 ) ) ( not ( = ?auto_60447 ?auto_60449 ) ) ( not ( = ?auto_60447 ?auto_60450 ) ) ( not ( = ?auto_60448 ?auto_60449 ) ) ( not ( = ?auto_60448 ?auto_60450 ) ) ( not ( = ?auto_60449 ?auto_60450 ) ) ( ON ?auto_60448 ?auto_60449 ) ( ON ?auto_60447 ?auto_60448 ) ( ON ?auto_60446 ?auto_60447 ) ( ON ?auto_60445 ?auto_60446 ) ( CLEAR ?auto_60443 ) ( ON ?auto_60444 ?auto_60445 ) ( CLEAR ?auto_60444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60443 ?auto_60444 )
      ( MAKE-7PILE ?auto_60443 ?auto_60444 ?auto_60445 ?auto_60446 ?auto_60447 ?auto_60448 ?auto_60449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_60473 - BLOCK
      ?auto_60474 - BLOCK
      ?auto_60475 - BLOCK
      ?auto_60476 - BLOCK
      ?auto_60477 - BLOCK
      ?auto_60478 - BLOCK
      ?auto_60479 - BLOCK
    )
    :vars
    (
      ?auto_60480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60479 ?auto_60480 ) ( not ( = ?auto_60473 ?auto_60474 ) ) ( not ( = ?auto_60473 ?auto_60475 ) ) ( not ( = ?auto_60473 ?auto_60476 ) ) ( not ( = ?auto_60473 ?auto_60477 ) ) ( not ( = ?auto_60473 ?auto_60478 ) ) ( not ( = ?auto_60473 ?auto_60479 ) ) ( not ( = ?auto_60473 ?auto_60480 ) ) ( not ( = ?auto_60474 ?auto_60475 ) ) ( not ( = ?auto_60474 ?auto_60476 ) ) ( not ( = ?auto_60474 ?auto_60477 ) ) ( not ( = ?auto_60474 ?auto_60478 ) ) ( not ( = ?auto_60474 ?auto_60479 ) ) ( not ( = ?auto_60474 ?auto_60480 ) ) ( not ( = ?auto_60475 ?auto_60476 ) ) ( not ( = ?auto_60475 ?auto_60477 ) ) ( not ( = ?auto_60475 ?auto_60478 ) ) ( not ( = ?auto_60475 ?auto_60479 ) ) ( not ( = ?auto_60475 ?auto_60480 ) ) ( not ( = ?auto_60476 ?auto_60477 ) ) ( not ( = ?auto_60476 ?auto_60478 ) ) ( not ( = ?auto_60476 ?auto_60479 ) ) ( not ( = ?auto_60476 ?auto_60480 ) ) ( not ( = ?auto_60477 ?auto_60478 ) ) ( not ( = ?auto_60477 ?auto_60479 ) ) ( not ( = ?auto_60477 ?auto_60480 ) ) ( not ( = ?auto_60478 ?auto_60479 ) ) ( not ( = ?auto_60478 ?auto_60480 ) ) ( not ( = ?auto_60479 ?auto_60480 ) ) ( ON ?auto_60478 ?auto_60479 ) ( ON ?auto_60477 ?auto_60478 ) ( ON ?auto_60476 ?auto_60477 ) ( ON ?auto_60475 ?auto_60476 ) ( ON ?auto_60474 ?auto_60475 ) ( ON ?auto_60473 ?auto_60474 ) ( CLEAR ?auto_60473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60473 )
      ( MAKE-7PILE ?auto_60473 ?auto_60474 ?auto_60475 ?auto_60476 ?auto_60477 ?auto_60478 ?auto_60479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60504 - BLOCK
      ?auto_60505 - BLOCK
      ?auto_60506 - BLOCK
      ?auto_60507 - BLOCK
      ?auto_60508 - BLOCK
      ?auto_60509 - BLOCK
      ?auto_60510 - BLOCK
      ?auto_60511 - BLOCK
    )
    :vars
    (
      ?auto_60512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60510 ) ( ON ?auto_60511 ?auto_60512 ) ( CLEAR ?auto_60511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60504 ) ( ON ?auto_60505 ?auto_60504 ) ( ON ?auto_60506 ?auto_60505 ) ( ON ?auto_60507 ?auto_60506 ) ( ON ?auto_60508 ?auto_60507 ) ( ON ?auto_60509 ?auto_60508 ) ( ON ?auto_60510 ?auto_60509 ) ( not ( = ?auto_60504 ?auto_60505 ) ) ( not ( = ?auto_60504 ?auto_60506 ) ) ( not ( = ?auto_60504 ?auto_60507 ) ) ( not ( = ?auto_60504 ?auto_60508 ) ) ( not ( = ?auto_60504 ?auto_60509 ) ) ( not ( = ?auto_60504 ?auto_60510 ) ) ( not ( = ?auto_60504 ?auto_60511 ) ) ( not ( = ?auto_60504 ?auto_60512 ) ) ( not ( = ?auto_60505 ?auto_60506 ) ) ( not ( = ?auto_60505 ?auto_60507 ) ) ( not ( = ?auto_60505 ?auto_60508 ) ) ( not ( = ?auto_60505 ?auto_60509 ) ) ( not ( = ?auto_60505 ?auto_60510 ) ) ( not ( = ?auto_60505 ?auto_60511 ) ) ( not ( = ?auto_60505 ?auto_60512 ) ) ( not ( = ?auto_60506 ?auto_60507 ) ) ( not ( = ?auto_60506 ?auto_60508 ) ) ( not ( = ?auto_60506 ?auto_60509 ) ) ( not ( = ?auto_60506 ?auto_60510 ) ) ( not ( = ?auto_60506 ?auto_60511 ) ) ( not ( = ?auto_60506 ?auto_60512 ) ) ( not ( = ?auto_60507 ?auto_60508 ) ) ( not ( = ?auto_60507 ?auto_60509 ) ) ( not ( = ?auto_60507 ?auto_60510 ) ) ( not ( = ?auto_60507 ?auto_60511 ) ) ( not ( = ?auto_60507 ?auto_60512 ) ) ( not ( = ?auto_60508 ?auto_60509 ) ) ( not ( = ?auto_60508 ?auto_60510 ) ) ( not ( = ?auto_60508 ?auto_60511 ) ) ( not ( = ?auto_60508 ?auto_60512 ) ) ( not ( = ?auto_60509 ?auto_60510 ) ) ( not ( = ?auto_60509 ?auto_60511 ) ) ( not ( = ?auto_60509 ?auto_60512 ) ) ( not ( = ?auto_60510 ?auto_60511 ) ) ( not ( = ?auto_60510 ?auto_60512 ) ) ( not ( = ?auto_60511 ?auto_60512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60511 ?auto_60512 )
      ( !STACK ?auto_60511 ?auto_60510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60538 - BLOCK
      ?auto_60539 - BLOCK
      ?auto_60540 - BLOCK
      ?auto_60541 - BLOCK
      ?auto_60542 - BLOCK
      ?auto_60543 - BLOCK
      ?auto_60544 - BLOCK
      ?auto_60545 - BLOCK
    )
    :vars
    (
      ?auto_60546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60545 ?auto_60546 ) ( ON-TABLE ?auto_60538 ) ( ON ?auto_60539 ?auto_60538 ) ( ON ?auto_60540 ?auto_60539 ) ( ON ?auto_60541 ?auto_60540 ) ( ON ?auto_60542 ?auto_60541 ) ( ON ?auto_60543 ?auto_60542 ) ( not ( = ?auto_60538 ?auto_60539 ) ) ( not ( = ?auto_60538 ?auto_60540 ) ) ( not ( = ?auto_60538 ?auto_60541 ) ) ( not ( = ?auto_60538 ?auto_60542 ) ) ( not ( = ?auto_60538 ?auto_60543 ) ) ( not ( = ?auto_60538 ?auto_60544 ) ) ( not ( = ?auto_60538 ?auto_60545 ) ) ( not ( = ?auto_60538 ?auto_60546 ) ) ( not ( = ?auto_60539 ?auto_60540 ) ) ( not ( = ?auto_60539 ?auto_60541 ) ) ( not ( = ?auto_60539 ?auto_60542 ) ) ( not ( = ?auto_60539 ?auto_60543 ) ) ( not ( = ?auto_60539 ?auto_60544 ) ) ( not ( = ?auto_60539 ?auto_60545 ) ) ( not ( = ?auto_60539 ?auto_60546 ) ) ( not ( = ?auto_60540 ?auto_60541 ) ) ( not ( = ?auto_60540 ?auto_60542 ) ) ( not ( = ?auto_60540 ?auto_60543 ) ) ( not ( = ?auto_60540 ?auto_60544 ) ) ( not ( = ?auto_60540 ?auto_60545 ) ) ( not ( = ?auto_60540 ?auto_60546 ) ) ( not ( = ?auto_60541 ?auto_60542 ) ) ( not ( = ?auto_60541 ?auto_60543 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60541 ?auto_60545 ) ) ( not ( = ?auto_60541 ?auto_60546 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60542 ?auto_60545 ) ) ( not ( = ?auto_60542 ?auto_60546 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60545 ) ) ( not ( = ?auto_60543 ?auto_60546 ) ) ( not ( = ?auto_60544 ?auto_60545 ) ) ( not ( = ?auto_60544 ?auto_60546 ) ) ( not ( = ?auto_60545 ?auto_60546 ) ) ( CLEAR ?auto_60543 ) ( ON ?auto_60544 ?auto_60545 ) ( CLEAR ?auto_60544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_60538 ?auto_60539 ?auto_60540 ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60544 )
      ( MAKE-8PILE ?auto_60538 ?auto_60539 ?auto_60540 ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60544 ?auto_60545 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60572 - BLOCK
      ?auto_60573 - BLOCK
      ?auto_60574 - BLOCK
      ?auto_60575 - BLOCK
      ?auto_60576 - BLOCK
      ?auto_60577 - BLOCK
      ?auto_60578 - BLOCK
      ?auto_60579 - BLOCK
    )
    :vars
    (
      ?auto_60580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60579 ?auto_60580 ) ( ON-TABLE ?auto_60572 ) ( ON ?auto_60573 ?auto_60572 ) ( ON ?auto_60574 ?auto_60573 ) ( ON ?auto_60575 ?auto_60574 ) ( ON ?auto_60576 ?auto_60575 ) ( not ( = ?auto_60572 ?auto_60573 ) ) ( not ( = ?auto_60572 ?auto_60574 ) ) ( not ( = ?auto_60572 ?auto_60575 ) ) ( not ( = ?auto_60572 ?auto_60576 ) ) ( not ( = ?auto_60572 ?auto_60577 ) ) ( not ( = ?auto_60572 ?auto_60578 ) ) ( not ( = ?auto_60572 ?auto_60579 ) ) ( not ( = ?auto_60572 ?auto_60580 ) ) ( not ( = ?auto_60573 ?auto_60574 ) ) ( not ( = ?auto_60573 ?auto_60575 ) ) ( not ( = ?auto_60573 ?auto_60576 ) ) ( not ( = ?auto_60573 ?auto_60577 ) ) ( not ( = ?auto_60573 ?auto_60578 ) ) ( not ( = ?auto_60573 ?auto_60579 ) ) ( not ( = ?auto_60573 ?auto_60580 ) ) ( not ( = ?auto_60574 ?auto_60575 ) ) ( not ( = ?auto_60574 ?auto_60576 ) ) ( not ( = ?auto_60574 ?auto_60577 ) ) ( not ( = ?auto_60574 ?auto_60578 ) ) ( not ( = ?auto_60574 ?auto_60579 ) ) ( not ( = ?auto_60574 ?auto_60580 ) ) ( not ( = ?auto_60575 ?auto_60576 ) ) ( not ( = ?auto_60575 ?auto_60577 ) ) ( not ( = ?auto_60575 ?auto_60578 ) ) ( not ( = ?auto_60575 ?auto_60579 ) ) ( not ( = ?auto_60575 ?auto_60580 ) ) ( not ( = ?auto_60576 ?auto_60577 ) ) ( not ( = ?auto_60576 ?auto_60578 ) ) ( not ( = ?auto_60576 ?auto_60579 ) ) ( not ( = ?auto_60576 ?auto_60580 ) ) ( not ( = ?auto_60577 ?auto_60578 ) ) ( not ( = ?auto_60577 ?auto_60579 ) ) ( not ( = ?auto_60577 ?auto_60580 ) ) ( not ( = ?auto_60578 ?auto_60579 ) ) ( not ( = ?auto_60578 ?auto_60580 ) ) ( not ( = ?auto_60579 ?auto_60580 ) ) ( ON ?auto_60578 ?auto_60579 ) ( CLEAR ?auto_60576 ) ( ON ?auto_60577 ?auto_60578 ) ( CLEAR ?auto_60577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60572 ?auto_60573 ?auto_60574 ?auto_60575 ?auto_60576 ?auto_60577 )
      ( MAKE-8PILE ?auto_60572 ?auto_60573 ?auto_60574 ?auto_60575 ?auto_60576 ?auto_60577 ?auto_60578 ?auto_60579 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60606 - BLOCK
      ?auto_60607 - BLOCK
      ?auto_60608 - BLOCK
      ?auto_60609 - BLOCK
      ?auto_60610 - BLOCK
      ?auto_60611 - BLOCK
      ?auto_60612 - BLOCK
      ?auto_60613 - BLOCK
    )
    :vars
    (
      ?auto_60614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60613 ?auto_60614 ) ( ON-TABLE ?auto_60606 ) ( ON ?auto_60607 ?auto_60606 ) ( ON ?auto_60608 ?auto_60607 ) ( ON ?auto_60609 ?auto_60608 ) ( not ( = ?auto_60606 ?auto_60607 ) ) ( not ( = ?auto_60606 ?auto_60608 ) ) ( not ( = ?auto_60606 ?auto_60609 ) ) ( not ( = ?auto_60606 ?auto_60610 ) ) ( not ( = ?auto_60606 ?auto_60611 ) ) ( not ( = ?auto_60606 ?auto_60612 ) ) ( not ( = ?auto_60606 ?auto_60613 ) ) ( not ( = ?auto_60606 ?auto_60614 ) ) ( not ( = ?auto_60607 ?auto_60608 ) ) ( not ( = ?auto_60607 ?auto_60609 ) ) ( not ( = ?auto_60607 ?auto_60610 ) ) ( not ( = ?auto_60607 ?auto_60611 ) ) ( not ( = ?auto_60607 ?auto_60612 ) ) ( not ( = ?auto_60607 ?auto_60613 ) ) ( not ( = ?auto_60607 ?auto_60614 ) ) ( not ( = ?auto_60608 ?auto_60609 ) ) ( not ( = ?auto_60608 ?auto_60610 ) ) ( not ( = ?auto_60608 ?auto_60611 ) ) ( not ( = ?auto_60608 ?auto_60612 ) ) ( not ( = ?auto_60608 ?auto_60613 ) ) ( not ( = ?auto_60608 ?auto_60614 ) ) ( not ( = ?auto_60609 ?auto_60610 ) ) ( not ( = ?auto_60609 ?auto_60611 ) ) ( not ( = ?auto_60609 ?auto_60612 ) ) ( not ( = ?auto_60609 ?auto_60613 ) ) ( not ( = ?auto_60609 ?auto_60614 ) ) ( not ( = ?auto_60610 ?auto_60611 ) ) ( not ( = ?auto_60610 ?auto_60612 ) ) ( not ( = ?auto_60610 ?auto_60613 ) ) ( not ( = ?auto_60610 ?auto_60614 ) ) ( not ( = ?auto_60611 ?auto_60612 ) ) ( not ( = ?auto_60611 ?auto_60613 ) ) ( not ( = ?auto_60611 ?auto_60614 ) ) ( not ( = ?auto_60612 ?auto_60613 ) ) ( not ( = ?auto_60612 ?auto_60614 ) ) ( not ( = ?auto_60613 ?auto_60614 ) ) ( ON ?auto_60612 ?auto_60613 ) ( ON ?auto_60611 ?auto_60612 ) ( CLEAR ?auto_60609 ) ( ON ?auto_60610 ?auto_60611 ) ( CLEAR ?auto_60610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60606 ?auto_60607 ?auto_60608 ?auto_60609 ?auto_60610 )
      ( MAKE-8PILE ?auto_60606 ?auto_60607 ?auto_60608 ?auto_60609 ?auto_60610 ?auto_60611 ?auto_60612 ?auto_60613 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60640 - BLOCK
      ?auto_60641 - BLOCK
      ?auto_60642 - BLOCK
      ?auto_60643 - BLOCK
      ?auto_60644 - BLOCK
      ?auto_60645 - BLOCK
      ?auto_60646 - BLOCK
      ?auto_60647 - BLOCK
    )
    :vars
    (
      ?auto_60648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60647 ?auto_60648 ) ( ON-TABLE ?auto_60640 ) ( ON ?auto_60641 ?auto_60640 ) ( ON ?auto_60642 ?auto_60641 ) ( not ( = ?auto_60640 ?auto_60641 ) ) ( not ( = ?auto_60640 ?auto_60642 ) ) ( not ( = ?auto_60640 ?auto_60643 ) ) ( not ( = ?auto_60640 ?auto_60644 ) ) ( not ( = ?auto_60640 ?auto_60645 ) ) ( not ( = ?auto_60640 ?auto_60646 ) ) ( not ( = ?auto_60640 ?auto_60647 ) ) ( not ( = ?auto_60640 ?auto_60648 ) ) ( not ( = ?auto_60641 ?auto_60642 ) ) ( not ( = ?auto_60641 ?auto_60643 ) ) ( not ( = ?auto_60641 ?auto_60644 ) ) ( not ( = ?auto_60641 ?auto_60645 ) ) ( not ( = ?auto_60641 ?auto_60646 ) ) ( not ( = ?auto_60641 ?auto_60647 ) ) ( not ( = ?auto_60641 ?auto_60648 ) ) ( not ( = ?auto_60642 ?auto_60643 ) ) ( not ( = ?auto_60642 ?auto_60644 ) ) ( not ( = ?auto_60642 ?auto_60645 ) ) ( not ( = ?auto_60642 ?auto_60646 ) ) ( not ( = ?auto_60642 ?auto_60647 ) ) ( not ( = ?auto_60642 ?auto_60648 ) ) ( not ( = ?auto_60643 ?auto_60644 ) ) ( not ( = ?auto_60643 ?auto_60645 ) ) ( not ( = ?auto_60643 ?auto_60646 ) ) ( not ( = ?auto_60643 ?auto_60647 ) ) ( not ( = ?auto_60643 ?auto_60648 ) ) ( not ( = ?auto_60644 ?auto_60645 ) ) ( not ( = ?auto_60644 ?auto_60646 ) ) ( not ( = ?auto_60644 ?auto_60647 ) ) ( not ( = ?auto_60644 ?auto_60648 ) ) ( not ( = ?auto_60645 ?auto_60646 ) ) ( not ( = ?auto_60645 ?auto_60647 ) ) ( not ( = ?auto_60645 ?auto_60648 ) ) ( not ( = ?auto_60646 ?auto_60647 ) ) ( not ( = ?auto_60646 ?auto_60648 ) ) ( not ( = ?auto_60647 ?auto_60648 ) ) ( ON ?auto_60646 ?auto_60647 ) ( ON ?auto_60645 ?auto_60646 ) ( ON ?auto_60644 ?auto_60645 ) ( CLEAR ?auto_60642 ) ( ON ?auto_60643 ?auto_60644 ) ( CLEAR ?auto_60643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60640 ?auto_60641 ?auto_60642 ?auto_60643 )
      ( MAKE-8PILE ?auto_60640 ?auto_60641 ?auto_60642 ?auto_60643 ?auto_60644 ?auto_60645 ?auto_60646 ?auto_60647 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60674 - BLOCK
      ?auto_60675 - BLOCK
      ?auto_60676 - BLOCK
      ?auto_60677 - BLOCK
      ?auto_60678 - BLOCK
      ?auto_60679 - BLOCK
      ?auto_60680 - BLOCK
      ?auto_60681 - BLOCK
    )
    :vars
    (
      ?auto_60682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60681 ?auto_60682 ) ( ON-TABLE ?auto_60674 ) ( ON ?auto_60675 ?auto_60674 ) ( not ( = ?auto_60674 ?auto_60675 ) ) ( not ( = ?auto_60674 ?auto_60676 ) ) ( not ( = ?auto_60674 ?auto_60677 ) ) ( not ( = ?auto_60674 ?auto_60678 ) ) ( not ( = ?auto_60674 ?auto_60679 ) ) ( not ( = ?auto_60674 ?auto_60680 ) ) ( not ( = ?auto_60674 ?auto_60681 ) ) ( not ( = ?auto_60674 ?auto_60682 ) ) ( not ( = ?auto_60675 ?auto_60676 ) ) ( not ( = ?auto_60675 ?auto_60677 ) ) ( not ( = ?auto_60675 ?auto_60678 ) ) ( not ( = ?auto_60675 ?auto_60679 ) ) ( not ( = ?auto_60675 ?auto_60680 ) ) ( not ( = ?auto_60675 ?auto_60681 ) ) ( not ( = ?auto_60675 ?auto_60682 ) ) ( not ( = ?auto_60676 ?auto_60677 ) ) ( not ( = ?auto_60676 ?auto_60678 ) ) ( not ( = ?auto_60676 ?auto_60679 ) ) ( not ( = ?auto_60676 ?auto_60680 ) ) ( not ( = ?auto_60676 ?auto_60681 ) ) ( not ( = ?auto_60676 ?auto_60682 ) ) ( not ( = ?auto_60677 ?auto_60678 ) ) ( not ( = ?auto_60677 ?auto_60679 ) ) ( not ( = ?auto_60677 ?auto_60680 ) ) ( not ( = ?auto_60677 ?auto_60681 ) ) ( not ( = ?auto_60677 ?auto_60682 ) ) ( not ( = ?auto_60678 ?auto_60679 ) ) ( not ( = ?auto_60678 ?auto_60680 ) ) ( not ( = ?auto_60678 ?auto_60681 ) ) ( not ( = ?auto_60678 ?auto_60682 ) ) ( not ( = ?auto_60679 ?auto_60680 ) ) ( not ( = ?auto_60679 ?auto_60681 ) ) ( not ( = ?auto_60679 ?auto_60682 ) ) ( not ( = ?auto_60680 ?auto_60681 ) ) ( not ( = ?auto_60680 ?auto_60682 ) ) ( not ( = ?auto_60681 ?auto_60682 ) ) ( ON ?auto_60680 ?auto_60681 ) ( ON ?auto_60679 ?auto_60680 ) ( ON ?auto_60678 ?auto_60679 ) ( ON ?auto_60677 ?auto_60678 ) ( CLEAR ?auto_60675 ) ( ON ?auto_60676 ?auto_60677 ) ( CLEAR ?auto_60676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60674 ?auto_60675 ?auto_60676 )
      ( MAKE-8PILE ?auto_60674 ?auto_60675 ?auto_60676 ?auto_60677 ?auto_60678 ?auto_60679 ?auto_60680 ?auto_60681 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60708 - BLOCK
      ?auto_60709 - BLOCK
      ?auto_60710 - BLOCK
      ?auto_60711 - BLOCK
      ?auto_60712 - BLOCK
      ?auto_60713 - BLOCK
      ?auto_60714 - BLOCK
      ?auto_60715 - BLOCK
    )
    :vars
    (
      ?auto_60716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60715 ?auto_60716 ) ( ON-TABLE ?auto_60708 ) ( not ( = ?auto_60708 ?auto_60709 ) ) ( not ( = ?auto_60708 ?auto_60710 ) ) ( not ( = ?auto_60708 ?auto_60711 ) ) ( not ( = ?auto_60708 ?auto_60712 ) ) ( not ( = ?auto_60708 ?auto_60713 ) ) ( not ( = ?auto_60708 ?auto_60714 ) ) ( not ( = ?auto_60708 ?auto_60715 ) ) ( not ( = ?auto_60708 ?auto_60716 ) ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60709 ?auto_60711 ) ) ( not ( = ?auto_60709 ?auto_60712 ) ) ( not ( = ?auto_60709 ?auto_60713 ) ) ( not ( = ?auto_60709 ?auto_60714 ) ) ( not ( = ?auto_60709 ?auto_60715 ) ) ( not ( = ?auto_60709 ?auto_60716 ) ) ( not ( = ?auto_60710 ?auto_60711 ) ) ( not ( = ?auto_60710 ?auto_60712 ) ) ( not ( = ?auto_60710 ?auto_60713 ) ) ( not ( = ?auto_60710 ?auto_60714 ) ) ( not ( = ?auto_60710 ?auto_60715 ) ) ( not ( = ?auto_60710 ?auto_60716 ) ) ( not ( = ?auto_60711 ?auto_60712 ) ) ( not ( = ?auto_60711 ?auto_60713 ) ) ( not ( = ?auto_60711 ?auto_60714 ) ) ( not ( = ?auto_60711 ?auto_60715 ) ) ( not ( = ?auto_60711 ?auto_60716 ) ) ( not ( = ?auto_60712 ?auto_60713 ) ) ( not ( = ?auto_60712 ?auto_60714 ) ) ( not ( = ?auto_60712 ?auto_60715 ) ) ( not ( = ?auto_60712 ?auto_60716 ) ) ( not ( = ?auto_60713 ?auto_60714 ) ) ( not ( = ?auto_60713 ?auto_60715 ) ) ( not ( = ?auto_60713 ?auto_60716 ) ) ( not ( = ?auto_60714 ?auto_60715 ) ) ( not ( = ?auto_60714 ?auto_60716 ) ) ( not ( = ?auto_60715 ?auto_60716 ) ) ( ON ?auto_60714 ?auto_60715 ) ( ON ?auto_60713 ?auto_60714 ) ( ON ?auto_60712 ?auto_60713 ) ( ON ?auto_60711 ?auto_60712 ) ( ON ?auto_60710 ?auto_60711 ) ( CLEAR ?auto_60708 ) ( ON ?auto_60709 ?auto_60710 ) ( CLEAR ?auto_60709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60708 ?auto_60709 )
      ( MAKE-8PILE ?auto_60708 ?auto_60709 ?auto_60710 ?auto_60711 ?auto_60712 ?auto_60713 ?auto_60714 ?auto_60715 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_60742 - BLOCK
      ?auto_60743 - BLOCK
      ?auto_60744 - BLOCK
      ?auto_60745 - BLOCK
      ?auto_60746 - BLOCK
      ?auto_60747 - BLOCK
      ?auto_60748 - BLOCK
      ?auto_60749 - BLOCK
    )
    :vars
    (
      ?auto_60750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60749 ?auto_60750 ) ( not ( = ?auto_60742 ?auto_60743 ) ) ( not ( = ?auto_60742 ?auto_60744 ) ) ( not ( = ?auto_60742 ?auto_60745 ) ) ( not ( = ?auto_60742 ?auto_60746 ) ) ( not ( = ?auto_60742 ?auto_60747 ) ) ( not ( = ?auto_60742 ?auto_60748 ) ) ( not ( = ?auto_60742 ?auto_60749 ) ) ( not ( = ?auto_60742 ?auto_60750 ) ) ( not ( = ?auto_60743 ?auto_60744 ) ) ( not ( = ?auto_60743 ?auto_60745 ) ) ( not ( = ?auto_60743 ?auto_60746 ) ) ( not ( = ?auto_60743 ?auto_60747 ) ) ( not ( = ?auto_60743 ?auto_60748 ) ) ( not ( = ?auto_60743 ?auto_60749 ) ) ( not ( = ?auto_60743 ?auto_60750 ) ) ( not ( = ?auto_60744 ?auto_60745 ) ) ( not ( = ?auto_60744 ?auto_60746 ) ) ( not ( = ?auto_60744 ?auto_60747 ) ) ( not ( = ?auto_60744 ?auto_60748 ) ) ( not ( = ?auto_60744 ?auto_60749 ) ) ( not ( = ?auto_60744 ?auto_60750 ) ) ( not ( = ?auto_60745 ?auto_60746 ) ) ( not ( = ?auto_60745 ?auto_60747 ) ) ( not ( = ?auto_60745 ?auto_60748 ) ) ( not ( = ?auto_60745 ?auto_60749 ) ) ( not ( = ?auto_60745 ?auto_60750 ) ) ( not ( = ?auto_60746 ?auto_60747 ) ) ( not ( = ?auto_60746 ?auto_60748 ) ) ( not ( = ?auto_60746 ?auto_60749 ) ) ( not ( = ?auto_60746 ?auto_60750 ) ) ( not ( = ?auto_60747 ?auto_60748 ) ) ( not ( = ?auto_60747 ?auto_60749 ) ) ( not ( = ?auto_60747 ?auto_60750 ) ) ( not ( = ?auto_60748 ?auto_60749 ) ) ( not ( = ?auto_60748 ?auto_60750 ) ) ( not ( = ?auto_60749 ?auto_60750 ) ) ( ON ?auto_60748 ?auto_60749 ) ( ON ?auto_60747 ?auto_60748 ) ( ON ?auto_60746 ?auto_60747 ) ( ON ?auto_60745 ?auto_60746 ) ( ON ?auto_60744 ?auto_60745 ) ( ON ?auto_60743 ?auto_60744 ) ( ON ?auto_60742 ?auto_60743 ) ( CLEAR ?auto_60742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60742 )
      ( MAKE-8PILE ?auto_60742 ?auto_60743 ?auto_60744 ?auto_60745 ?auto_60746 ?auto_60747 ?auto_60748 ?auto_60749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60777 - BLOCK
      ?auto_60778 - BLOCK
      ?auto_60779 - BLOCK
      ?auto_60780 - BLOCK
      ?auto_60781 - BLOCK
      ?auto_60782 - BLOCK
      ?auto_60783 - BLOCK
      ?auto_60784 - BLOCK
      ?auto_60785 - BLOCK
    )
    :vars
    (
      ?auto_60786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60784 ) ( ON ?auto_60785 ?auto_60786 ) ( CLEAR ?auto_60785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60777 ) ( ON ?auto_60778 ?auto_60777 ) ( ON ?auto_60779 ?auto_60778 ) ( ON ?auto_60780 ?auto_60779 ) ( ON ?auto_60781 ?auto_60780 ) ( ON ?auto_60782 ?auto_60781 ) ( ON ?auto_60783 ?auto_60782 ) ( ON ?auto_60784 ?auto_60783 ) ( not ( = ?auto_60777 ?auto_60778 ) ) ( not ( = ?auto_60777 ?auto_60779 ) ) ( not ( = ?auto_60777 ?auto_60780 ) ) ( not ( = ?auto_60777 ?auto_60781 ) ) ( not ( = ?auto_60777 ?auto_60782 ) ) ( not ( = ?auto_60777 ?auto_60783 ) ) ( not ( = ?auto_60777 ?auto_60784 ) ) ( not ( = ?auto_60777 ?auto_60785 ) ) ( not ( = ?auto_60777 ?auto_60786 ) ) ( not ( = ?auto_60778 ?auto_60779 ) ) ( not ( = ?auto_60778 ?auto_60780 ) ) ( not ( = ?auto_60778 ?auto_60781 ) ) ( not ( = ?auto_60778 ?auto_60782 ) ) ( not ( = ?auto_60778 ?auto_60783 ) ) ( not ( = ?auto_60778 ?auto_60784 ) ) ( not ( = ?auto_60778 ?auto_60785 ) ) ( not ( = ?auto_60778 ?auto_60786 ) ) ( not ( = ?auto_60779 ?auto_60780 ) ) ( not ( = ?auto_60779 ?auto_60781 ) ) ( not ( = ?auto_60779 ?auto_60782 ) ) ( not ( = ?auto_60779 ?auto_60783 ) ) ( not ( = ?auto_60779 ?auto_60784 ) ) ( not ( = ?auto_60779 ?auto_60785 ) ) ( not ( = ?auto_60779 ?auto_60786 ) ) ( not ( = ?auto_60780 ?auto_60781 ) ) ( not ( = ?auto_60780 ?auto_60782 ) ) ( not ( = ?auto_60780 ?auto_60783 ) ) ( not ( = ?auto_60780 ?auto_60784 ) ) ( not ( = ?auto_60780 ?auto_60785 ) ) ( not ( = ?auto_60780 ?auto_60786 ) ) ( not ( = ?auto_60781 ?auto_60782 ) ) ( not ( = ?auto_60781 ?auto_60783 ) ) ( not ( = ?auto_60781 ?auto_60784 ) ) ( not ( = ?auto_60781 ?auto_60785 ) ) ( not ( = ?auto_60781 ?auto_60786 ) ) ( not ( = ?auto_60782 ?auto_60783 ) ) ( not ( = ?auto_60782 ?auto_60784 ) ) ( not ( = ?auto_60782 ?auto_60785 ) ) ( not ( = ?auto_60782 ?auto_60786 ) ) ( not ( = ?auto_60783 ?auto_60784 ) ) ( not ( = ?auto_60783 ?auto_60785 ) ) ( not ( = ?auto_60783 ?auto_60786 ) ) ( not ( = ?auto_60784 ?auto_60785 ) ) ( not ( = ?auto_60784 ?auto_60786 ) ) ( not ( = ?auto_60785 ?auto_60786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60785 ?auto_60786 )
      ( !STACK ?auto_60785 ?auto_60784 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60796 - BLOCK
      ?auto_60797 - BLOCK
      ?auto_60798 - BLOCK
      ?auto_60799 - BLOCK
      ?auto_60800 - BLOCK
      ?auto_60801 - BLOCK
      ?auto_60802 - BLOCK
      ?auto_60803 - BLOCK
      ?auto_60804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60803 ) ( ON-TABLE ?auto_60804 ) ( CLEAR ?auto_60804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60796 ) ( ON ?auto_60797 ?auto_60796 ) ( ON ?auto_60798 ?auto_60797 ) ( ON ?auto_60799 ?auto_60798 ) ( ON ?auto_60800 ?auto_60799 ) ( ON ?auto_60801 ?auto_60800 ) ( ON ?auto_60802 ?auto_60801 ) ( ON ?auto_60803 ?auto_60802 ) ( not ( = ?auto_60796 ?auto_60797 ) ) ( not ( = ?auto_60796 ?auto_60798 ) ) ( not ( = ?auto_60796 ?auto_60799 ) ) ( not ( = ?auto_60796 ?auto_60800 ) ) ( not ( = ?auto_60796 ?auto_60801 ) ) ( not ( = ?auto_60796 ?auto_60802 ) ) ( not ( = ?auto_60796 ?auto_60803 ) ) ( not ( = ?auto_60796 ?auto_60804 ) ) ( not ( = ?auto_60797 ?auto_60798 ) ) ( not ( = ?auto_60797 ?auto_60799 ) ) ( not ( = ?auto_60797 ?auto_60800 ) ) ( not ( = ?auto_60797 ?auto_60801 ) ) ( not ( = ?auto_60797 ?auto_60802 ) ) ( not ( = ?auto_60797 ?auto_60803 ) ) ( not ( = ?auto_60797 ?auto_60804 ) ) ( not ( = ?auto_60798 ?auto_60799 ) ) ( not ( = ?auto_60798 ?auto_60800 ) ) ( not ( = ?auto_60798 ?auto_60801 ) ) ( not ( = ?auto_60798 ?auto_60802 ) ) ( not ( = ?auto_60798 ?auto_60803 ) ) ( not ( = ?auto_60798 ?auto_60804 ) ) ( not ( = ?auto_60799 ?auto_60800 ) ) ( not ( = ?auto_60799 ?auto_60801 ) ) ( not ( = ?auto_60799 ?auto_60802 ) ) ( not ( = ?auto_60799 ?auto_60803 ) ) ( not ( = ?auto_60799 ?auto_60804 ) ) ( not ( = ?auto_60800 ?auto_60801 ) ) ( not ( = ?auto_60800 ?auto_60802 ) ) ( not ( = ?auto_60800 ?auto_60803 ) ) ( not ( = ?auto_60800 ?auto_60804 ) ) ( not ( = ?auto_60801 ?auto_60802 ) ) ( not ( = ?auto_60801 ?auto_60803 ) ) ( not ( = ?auto_60801 ?auto_60804 ) ) ( not ( = ?auto_60802 ?auto_60803 ) ) ( not ( = ?auto_60802 ?auto_60804 ) ) ( not ( = ?auto_60803 ?auto_60804 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_60804 )
      ( !STACK ?auto_60804 ?auto_60803 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60814 - BLOCK
      ?auto_60815 - BLOCK
      ?auto_60816 - BLOCK
      ?auto_60817 - BLOCK
      ?auto_60818 - BLOCK
      ?auto_60819 - BLOCK
      ?auto_60820 - BLOCK
      ?auto_60821 - BLOCK
      ?auto_60822 - BLOCK
    )
    :vars
    (
      ?auto_60823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60822 ?auto_60823 ) ( ON-TABLE ?auto_60814 ) ( ON ?auto_60815 ?auto_60814 ) ( ON ?auto_60816 ?auto_60815 ) ( ON ?auto_60817 ?auto_60816 ) ( ON ?auto_60818 ?auto_60817 ) ( ON ?auto_60819 ?auto_60818 ) ( ON ?auto_60820 ?auto_60819 ) ( not ( = ?auto_60814 ?auto_60815 ) ) ( not ( = ?auto_60814 ?auto_60816 ) ) ( not ( = ?auto_60814 ?auto_60817 ) ) ( not ( = ?auto_60814 ?auto_60818 ) ) ( not ( = ?auto_60814 ?auto_60819 ) ) ( not ( = ?auto_60814 ?auto_60820 ) ) ( not ( = ?auto_60814 ?auto_60821 ) ) ( not ( = ?auto_60814 ?auto_60822 ) ) ( not ( = ?auto_60814 ?auto_60823 ) ) ( not ( = ?auto_60815 ?auto_60816 ) ) ( not ( = ?auto_60815 ?auto_60817 ) ) ( not ( = ?auto_60815 ?auto_60818 ) ) ( not ( = ?auto_60815 ?auto_60819 ) ) ( not ( = ?auto_60815 ?auto_60820 ) ) ( not ( = ?auto_60815 ?auto_60821 ) ) ( not ( = ?auto_60815 ?auto_60822 ) ) ( not ( = ?auto_60815 ?auto_60823 ) ) ( not ( = ?auto_60816 ?auto_60817 ) ) ( not ( = ?auto_60816 ?auto_60818 ) ) ( not ( = ?auto_60816 ?auto_60819 ) ) ( not ( = ?auto_60816 ?auto_60820 ) ) ( not ( = ?auto_60816 ?auto_60821 ) ) ( not ( = ?auto_60816 ?auto_60822 ) ) ( not ( = ?auto_60816 ?auto_60823 ) ) ( not ( = ?auto_60817 ?auto_60818 ) ) ( not ( = ?auto_60817 ?auto_60819 ) ) ( not ( = ?auto_60817 ?auto_60820 ) ) ( not ( = ?auto_60817 ?auto_60821 ) ) ( not ( = ?auto_60817 ?auto_60822 ) ) ( not ( = ?auto_60817 ?auto_60823 ) ) ( not ( = ?auto_60818 ?auto_60819 ) ) ( not ( = ?auto_60818 ?auto_60820 ) ) ( not ( = ?auto_60818 ?auto_60821 ) ) ( not ( = ?auto_60818 ?auto_60822 ) ) ( not ( = ?auto_60818 ?auto_60823 ) ) ( not ( = ?auto_60819 ?auto_60820 ) ) ( not ( = ?auto_60819 ?auto_60821 ) ) ( not ( = ?auto_60819 ?auto_60822 ) ) ( not ( = ?auto_60819 ?auto_60823 ) ) ( not ( = ?auto_60820 ?auto_60821 ) ) ( not ( = ?auto_60820 ?auto_60822 ) ) ( not ( = ?auto_60820 ?auto_60823 ) ) ( not ( = ?auto_60821 ?auto_60822 ) ) ( not ( = ?auto_60821 ?auto_60823 ) ) ( not ( = ?auto_60822 ?auto_60823 ) ) ( CLEAR ?auto_60820 ) ( ON ?auto_60821 ?auto_60822 ) ( CLEAR ?auto_60821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_60814 ?auto_60815 ?auto_60816 ?auto_60817 ?auto_60818 ?auto_60819 ?auto_60820 ?auto_60821 )
      ( MAKE-9PILE ?auto_60814 ?auto_60815 ?auto_60816 ?auto_60817 ?auto_60818 ?auto_60819 ?auto_60820 ?auto_60821 ?auto_60822 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60833 - BLOCK
      ?auto_60834 - BLOCK
      ?auto_60835 - BLOCK
      ?auto_60836 - BLOCK
      ?auto_60837 - BLOCK
      ?auto_60838 - BLOCK
      ?auto_60839 - BLOCK
      ?auto_60840 - BLOCK
      ?auto_60841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60841 ) ( ON-TABLE ?auto_60833 ) ( ON ?auto_60834 ?auto_60833 ) ( ON ?auto_60835 ?auto_60834 ) ( ON ?auto_60836 ?auto_60835 ) ( ON ?auto_60837 ?auto_60836 ) ( ON ?auto_60838 ?auto_60837 ) ( ON ?auto_60839 ?auto_60838 ) ( not ( = ?auto_60833 ?auto_60834 ) ) ( not ( = ?auto_60833 ?auto_60835 ) ) ( not ( = ?auto_60833 ?auto_60836 ) ) ( not ( = ?auto_60833 ?auto_60837 ) ) ( not ( = ?auto_60833 ?auto_60838 ) ) ( not ( = ?auto_60833 ?auto_60839 ) ) ( not ( = ?auto_60833 ?auto_60840 ) ) ( not ( = ?auto_60833 ?auto_60841 ) ) ( not ( = ?auto_60834 ?auto_60835 ) ) ( not ( = ?auto_60834 ?auto_60836 ) ) ( not ( = ?auto_60834 ?auto_60837 ) ) ( not ( = ?auto_60834 ?auto_60838 ) ) ( not ( = ?auto_60834 ?auto_60839 ) ) ( not ( = ?auto_60834 ?auto_60840 ) ) ( not ( = ?auto_60834 ?auto_60841 ) ) ( not ( = ?auto_60835 ?auto_60836 ) ) ( not ( = ?auto_60835 ?auto_60837 ) ) ( not ( = ?auto_60835 ?auto_60838 ) ) ( not ( = ?auto_60835 ?auto_60839 ) ) ( not ( = ?auto_60835 ?auto_60840 ) ) ( not ( = ?auto_60835 ?auto_60841 ) ) ( not ( = ?auto_60836 ?auto_60837 ) ) ( not ( = ?auto_60836 ?auto_60838 ) ) ( not ( = ?auto_60836 ?auto_60839 ) ) ( not ( = ?auto_60836 ?auto_60840 ) ) ( not ( = ?auto_60836 ?auto_60841 ) ) ( not ( = ?auto_60837 ?auto_60838 ) ) ( not ( = ?auto_60837 ?auto_60839 ) ) ( not ( = ?auto_60837 ?auto_60840 ) ) ( not ( = ?auto_60837 ?auto_60841 ) ) ( not ( = ?auto_60838 ?auto_60839 ) ) ( not ( = ?auto_60838 ?auto_60840 ) ) ( not ( = ?auto_60838 ?auto_60841 ) ) ( not ( = ?auto_60839 ?auto_60840 ) ) ( not ( = ?auto_60839 ?auto_60841 ) ) ( not ( = ?auto_60840 ?auto_60841 ) ) ( CLEAR ?auto_60839 ) ( ON ?auto_60840 ?auto_60841 ) ( CLEAR ?auto_60840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_60833 ?auto_60834 ?auto_60835 ?auto_60836 ?auto_60837 ?auto_60838 ?auto_60839 ?auto_60840 )
      ( MAKE-9PILE ?auto_60833 ?auto_60834 ?auto_60835 ?auto_60836 ?auto_60837 ?auto_60838 ?auto_60839 ?auto_60840 ?auto_60841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60851 - BLOCK
      ?auto_60852 - BLOCK
      ?auto_60853 - BLOCK
      ?auto_60854 - BLOCK
      ?auto_60855 - BLOCK
      ?auto_60856 - BLOCK
      ?auto_60857 - BLOCK
      ?auto_60858 - BLOCK
      ?auto_60859 - BLOCK
    )
    :vars
    (
      ?auto_60860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60859 ?auto_60860 ) ( ON-TABLE ?auto_60851 ) ( ON ?auto_60852 ?auto_60851 ) ( ON ?auto_60853 ?auto_60852 ) ( ON ?auto_60854 ?auto_60853 ) ( ON ?auto_60855 ?auto_60854 ) ( ON ?auto_60856 ?auto_60855 ) ( not ( = ?auto_60851 ?auto_60852 ) ) ( not ( = ?auto_60851 ?auto_60853 ) ) ( not ( = ?auto_60851 ?auto_60854 ) ) ( not ( = ?auto_60851 ?auto_60855 ) ) ( not ( = ?auto_60851 ?auto_60856 ) ) ( not ( = ?auto_60851 ?auto_60857 ) ) ( not ( = ?auto_60851 ?auto_60858 ) ) ( not ( = ?auto_60851 ?auto_60859 ) ) ( not ( = ?auto_60851 ?auto_60860 ) ) ( not ( = ?auto_60852 ?auto_60853 ) ) ( not ( = ?auto_60852 ?auto_60854 ) ) ( not ( = ?auto_60852 ?auto_60855 ) ) ( not ( = ?auto_60852 ?auto_60856 ) ) ( not ( = ?auto_60852 ?auto_60857 ) ) ( not ( = ?auto_60852 ?auto_60858 ) ) ( not ( = ?auto_60852 ?auto_60859 ) ) ( not ( = ?auto_60852 ?auto_60860 ) ) ( not ( = ?auto_60853 ?auto_60854 ) ) ( not ( = ?auto_60853 ?auto_60855 ) ) ( not ( = ?auto_60853 ?auto_60856 ) ) ( not ( = ?auto_60853 ?auto_60857 ) ) ( not ( = ?auto_60853 ?auto_60858 ) ) ( not ( = ?auto_60853 ?auto_60859 ) ) ( not ( = ?auto_60853 ?auto_60860 ) ) ( not ( = ?auto_60854 ?auto_60855 ) ) ( not ( = ?auto_60854 ?auto_60856 ) ) ( not ( = ?auto_60854 ?auto_60857 ) ) ( not ( = ?auto_60854 ?auto_60858 ) ) ( not ( = ?auto_60854 ?auto_60859 ) ) ( not ( = ?auto_60854 ?auto_60860 ) ) ( not ( = ?auto_60855 ?auto_60856 ) ) ( not ( = ?auto_60855 ?auto_60857 ) ) ( not ( = ?auto_60855 ?auto_60858 ) ) ( not ( = ?auto_60855 ?auto_60859 ) ) ( not ( = ?auto_60855 ?auto_60860 ) ) ( not ( = ?auto_60856 ?auto_60857 ) ) ( not ( = ?auto_60856 ?auto_60858 ) ) ( not ( = ?auto_60856 ?auto_60859 ) ) ( not ( = ?auto_60856 ?auto_60860 ) ) ( not ( = ?auto_60857 ?auto_60858 ) ) ( not ( = ?auto_60857 ?auto_60859 ) ) ( not ( = ?auto_60857 ?auto_60860 ) ) ( not ( = ?auto_60858 ?auto_60859 ) ) ( not ( = ?auto_60858 ?auto_60860 ) ) ( not ( = ?auto_60859 ?auto_60860 ) ) ( ON ?auto_60858 ?auto_60859 ) ( CLEAR ?auto_60856 ) ( ON ?auto_60857 ?auto_60858 ) ( CLEAR ?auto_60857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_60851 ?auto_60852 ?auto_60853 ?auto_60854 ?auto_60855 ?auto_60856 ?auto_60857 )
      ( MAKE-9PILE ?auto_60851 ?auto_60852 ?auto_60853 ?auto_60854 ?auto_60855 ?auto_60856 ?auto_60857 ?auto_60858 ?auto_60859 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60870 - BLOCK
      ?auto_60871 - BLOCK
      ?auto_60872 - BLOCK
      ?auto_60873 - BLOCK
      ?auto_60874 - BLOCK
      ?auto_60875 - BLOCK
      ?auto_60876 - BLOCK
      ?auto_60877 - BLOCK
      ?auto_60878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60878 ) ( ON-TABLE ?auto_60870 ) ( ON ?auto_60871 ?auto_60870 ) ( ON ?auto_60872 ?auto_60871 ) ( ON ?auto_60873 ?auto_60872 ) ( ON ?auto_60874 ?auto_60873 ) ( ON ?auto_60875 ?auto_60874 ) ( not ( = ?auto_60870 ?auto_60871 ) ) ( not ( = ?auto_60870 ?auto_60872 ) ) ( not ( = ?auto_60870 ?auto_60873 ) ) ( not ( = ?auto_60870 ?auto_60874 ) ) ( not ( = ?auto_60870 ?auto_60875 ) ) ( not ( = ?auto_60870 ?auto_60876 ) ) ( not ( = ?auto_60870 ?auto_60877 ) ) ( not ( = ?auto_60870 ?auto_60878 ) ) ( not ( = ?auto_60871 ?auto_60872 ) ) ( not ( = ?auto_60871 ?auto_60873 ) ) ( not ( = ?auto_60871 ?auto_60874 ) ) ( not ( = ?auto_60871 ?auto_60875 ) ) ( not ( = ?auto_60871 ?auto_60876 ) ) ( not ( = ?auto_60871 ?auto_60877 ) ) ( not ( = ?auto_60871 ?auto_60878 ) ) ( not ( = ?auto_60872 ?auto_60873 ) ) ( not ( = ?auto_60872 ?auto_60874 ) ) ( not ( = ?auto_60872 ?auto_60875 ) ) ( not ( = ?auto_60872 ?auto_60876 ) ) ( not ( = ?auto_60872 ?auto_60877 ) ) ( not ( = ?auto_60872 ?auto_60878 ) ) ( not ( = ?auto_60873 ?auto_60874 ) ) ( not ( = ?auto_60873 ?auto_60875 ) ) ( not ( = ?auto_60873 ?auto_60876 ) ) ( not ( = ?auto_60873 ?auto_60877 ) ) ( not ( = ?auto_60873 ?auto_60878 ) ) ( not ( = ?auto_60874 ?auto_60875 ) ) ( not ( = ?auto_60874 ?auto_60876 ) ) ( not ( = ?auto_60874 ?auto_60877 ) ) ( not ( = ?auto_60874 ?auto_60878 ) ) ( not ( = ?auto_60875 ?auto_60876 ) ) ( not ( = ?auto_60875 ?auto_60877 ) ) ( not ( = ?auto_60875 ?auto_60878 ) ) ( not ( = ?auto_60876 ?auto_60877 ) ) ( not ( = ?auto_60876 ?auto_60878 ) ) ( not ( = ?auto_60877 ?auto_60878 ) ) ( ON ?auto_60877 ?auto_60878 ) ( CLEAR ?auto_60875 ) ( ON ?auto_60876 ?auto_60877 ) ( CLEAR ?auto_60876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_60870 ?auto_60871 ?auto_60872 ?auto_60873 ?auto_60874 ?auto_60875 ?auto_60876 )
      ( MAKE-9PILE ?auto_60870 ?auto_60871 ?auto_60872 ?auto_60873 ?auto_60874 ?auto_60875 ?auto_60876 ?auto_60877 ?auto_60878 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60888 - BLOCK
      ?auto_60889 - BLOCK
      ?auto_60890 - BLOCK
      ?auto_60891 - BLOCK
      ?auto_60892 - BLOCK
      ?auto_60893 - BLOCK
      ?auto_60894 - BLOCK
      ?auto_60895 - BLOCK
      ?auto_60896 - BLOCK
    )
    :vars
    (
      ?auto_60897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60896 ?auto_60897 ) ( ON-TABLE ?auto_60888 ) ( ON ?auto_60889 ?auto_60888 ) ( ON ?auto_60890 ?auto_60889 ) ( ON ?auto_60891 ?auto_60890 ) ( ON ?auto_60892 ?auto_60891 ) ( not ( = ?auto_60888 ?auto_60889 ) ) ( not ( = ?auto_60888 ?auto_60890 ) ) ( not ( = ?auto_60888 ?auto_60891 ) ) ( not ( = ?auto_60888 ?auto_60892 ) ) ( not ( = ?auto_60888 ?auto_60893 ) ) ( not ( = ?auto_60888 ?auto_60894 ) ) ( not ( = ?auto_60888 ?auto_60895 ) ) ( not ( = ?auto_60888 ?auto_60896 ) ) ( not ( = ?auto_60888 ?auto_60897 ) ) ( not ( = ?auto_60889 ?auto_60890 ) ) ( not ( = ?auto_60889 ?auto_60891 ) ) ( not ( = ?auto_60889 ?auto_60892 ) ) ( not ( = ?auto_60889 ?auto_60893 ) ) ( not ( = ?auto_60889 ?auto_60894 ) ) ( not ( = ?auto_60889 ?auto_60895 ) ) ( not ( = ?auto_60889 ?auto_60896 ) ) ( not ( = ?auto_60889 ?auto_60897 ) ) ( not ( = ?auto_60890 ?auto_60891 ) ) ( not ( = ?auto_60890 ?auto_60892 ) ) ( not ( = ?auto_60890 ?auto_60893 ) ) ( not ( = ?auto_60890 ?auto_60894 ) ) ( not ( = ?auto_60890 ?auto_60895 ) ) ( not ( = ?auto_60890 ?auto_60896 ) ) ( not ( = ?auto_60890 ?auto_60897 ) ) ( not ( = ?auto_60891 ?auto_60892 ) ) ( not ( = ?auto_60891 ?auto_60893 ) ) ( not ( = ?auto_60891 ?auto_60894 ) ) ( not ( = ?auto_60891 ?auto_60895 ) ) ( not ( = ?auto_60891 ?auto_60896 ) ) ( not ( = ?auto_60891 ?auto_60897 ) ) ( not ( = ?auto_60892 ?auto_60893 ) ) ( not ( = ?auto_60892 ?auto_60894 ) ) ( not ( = ?auto_60892 ?auto_60895 ) ) ( not ( = ?auto_60892 ?auto_60896 ) ) ( not ( = ?auto_60892 ?auto_60897 ) ) ( not ( = ?auto_60893 ?auto_60894 ) ) ( not ( = ?auto_60893 ?auto_60895 ) ) ( not ( = ?auto_60893 ?auto_60896 ) ) ( not ( = ?auto_60893 ?auto_60897 ) ) ( not ( = ?auto_60894 ?auto_60895 ) ) ( not ( = ?auto_60894 ?auto_60896 ) ) ( not ( = ?auto_60894 ?auto_60897 ) ) ( not ( = ?auto_60895 ?auto_60896 ) ) ( not ( = ?auto_60895 ?auto_60897 ) ) ( not ( = ?auto_60896 ?auto_60897 ) ) ( ON ?auto_60895 ?auto_60896 ) ( ON ?auto_60894 ?auto_60895 ) ( CLEAR ?auto_60892 ) ( ON ?auto_60893 ?auto_60894 ) ( CLEAR ?auto_60893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60888 ?auto_60889 ?auto_60890 ?auto_60891 ?auto_60892 ?auto_60893 )
      ( MAKE-9PILE ?auto_60888 ?auto_60889 ?auto_60890 ?auto_60891 ?auto_60892 ?auto_60893 ?auto_60894 ?auto_60895 ?auto_60896 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60907 - BLOCK
      ?auto_60908 - BLOCK
      ?auto_60909 - BLOCK
      ?auto_60910 - BLOCK
      ?auto_60911 - BLOCK
      ?auto_60912 - BLOCK
      ?auto_60913 - BLOCK
      ?auto_60914 - BLOCK
      ?auto_60915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60915 ) ( ON-TABLE ?auto_60907 ) ( ON ?auto_60908 ?auto_60907 ) ( ON ?auto_60909 ?auto_60908 ) ( ON ?auto_60910 ?auto_60909 ) ( ON ?auto_60911 ?auto_60910 ) ( not ( = ?auto_60907 ?auto_60908 ) ) ( not ( = ?auto_60907 ?auto_60909 ) ) ( not ( = ?auto_60907 ?auto_60910 ) ) ( not ( = ?auto_60907 ?auto_60911 ) ) ( not ( = ?auto_60907 ?auto_60912 ) ) ( not ( = ?auto_60907 ?auto_60913 ) ) ( not ( = ?auto_60907 ?auto_60914 ) ) ( not ( = ?auto_60907 ?auto_60915 ) ) ( not ( = ?auto_60908 ?auto_60909 ) ) ( not ( = ?auto_60908 ?auto_60910 ) ) ( not ( = ?auto_60908 ?auto_60911 ) ) ( not ( = ?auto_60908 ?auto_60912 ) ) ( not ( = ?auto_60908 ?auto_60913 ) ) ( not ( = ?auto_60908 ?auto_60914 ) ) ( not ( = ?auto_60908 ?auto_60915 ) ) ( not ( = ?auto_60909 ?auto_60910 ) ) ( not ( = ?auto_60909 ?auto_60911 ) ) ( not ( = ?auto_60909 ?auto_60912 ) ) ( not ( = ?auto_60909 ?auto_60913 ) ) ( not ( = ?auto_60909 ?auto_60914 ) ) ( not ( = ?auto_60909 ?auto_60915 ) ) ( not ( = ?auto_60910 ?auto_60911 ) ) ( not ( = ?auto_60910 ?auto_60912 ) ) ( not ( = ?auto_60910 ?auto_60913 ) ) ( not ( = ?auto_60910 ?auto_60914 ) ) ( not ( = ?auto_60910 ?auto_60915 ) ) ( not ( = ?auto_60911 ?auto_60912 ) ) ( not ( = ?auto_60911 ?auto_60913 ) ) ( not ( = ?auto_60911 ?auto_60914 ) ) ( not ( = ?auto_60911 ?auto_60915 ) ) ( not ( = ?auto_60912 ?auto_60913 ) ) ( not ( = ?auto_60912 ?auto_60914 ) ) ( not ( = ?auto_60912 ?auto_60915 ) ) ( not ( = ?auto_60913 ?auto_60914 ) ) ( not ( = ?auto_60913 ?auto_60915 ) ) ( not ( = ?auto_60914 ?auto_60915 ) ) ( ON ?auto_60914 ?auto_60915 ) ( ON ?auto_60913 ?auto_60914 ) ( CLEAR ?auto_60911 ) ( ON ?auto_60912 ?auto_60913 ) ( CLEAR ?auto_60912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60907 ?auto_60908 ?auto_60909 ?auto_60910 ?auto_60911 ?auto_60912 )
      ( MAKE-9PILE ?auto_60907 ?auto_60908 ?auto_60909 ?auto_60910 ?auto_60911 ?auto_60912 ?auto_60913 ?auto_60914 ?auto_60915 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60925 - BLOCK
      ?auto_60926 - BLOCK
      ?auto_60927 - BLOCK
      ?auto_60928 - BLOCK
      ?auto_60929 - BLOCK
      ?auto_60930 - BLOCK
      ?auto_60931 - BLOCK
      ?auto_60932 - BLOCK
      ?auto_60933 - BLOCK
    )
    :vars
    (
      ?auto_60934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60933 ?auto_60934 ) ( ON-TABLE ?auto_60925 ) ( ON ?auto_60926 ?auto_60925 ) ( ON ?auto_60927 ?auto_60926 ) ( ON ?auto_60928 ?auto_60927 ) ( not ( = ?auto_60925 ?auto_60926 ) ) ( not ( = ?auto_60925 ?auto_60927 ) ) ( not ( = ?auto_60925 ?auto_60928 ) ) ( not ( = ?auto_60925 ?auto_60929 ) ) ( not ( = ?auto_60925 ?auto_60930 ) ) ( not ( = ?auto_60925 ?auto_60931 ) ) ( not ( = ?auto_60925 ?auto_60932 ) ) ( not ( = ?auto_60925 ?auto_60933 ) ) ( not ( = ?auto_60925 ?auto_60934 ) ) ( not ( = ?auto_60926 ?auto_60927 ) ) ( not ( = ?auto_60926 ?auto_60928 ) ) ( not ( = ?auto_60926 ?auto_60929 ) ) ( not ( = ?auto_60926 ?auto_60930 ) ) ( not ( = ?auto_60926 ?auto_60931 ) ) ( not ( = ?auto_60926 ?auto_60932 ) ) ( not ( = ?auto_60926 ?auto_60933 ) ) ( not ( = ?auto_60926 ?auto_60934 ) ) ( not ( = ?auto_60927 ?auto_60928 ) ) ( not ( = ?auto_60927 ?auto_60929 ) ) ( not ( = ?auto_60927 ?auto_60930 ) ) ( not ( = ?auto_60927 ?auto_60931 ) ) ( not ( = ?auto_60927 ?auto_60932 ) ) ( not ( = ?auto_60927 ?auto_60933 ) ) ( not ( = ?auto_60927 ?auto_60934 ) ) ( not ( = ?auto_60928 ?auto_60929 ) ) ( not ( = ?auto_60928 ?auto_60930 ) ) ( not ( = ?auto_60928 ?auto_60931 ) ) ( not ( = ?auto_60928 ?auto_60932 ) ) ( not ( = ?auto_60928 ?auto_60933 ) ) ( not ( = ?auto_60928 ?auto_60934 ) ) ( not ( = ?auto_60929 ?auto_60930 ) ) ( not ( = ?auto_60929 ?auto_60931 ) ) ( not ( = ?auto_60929 ?auto_60932 ) ) ( not ( = ?auto_60929 ?auto_60933 ) ) ( not ( = ?auto_60929 ?auto_60934 ) ) ( not ( = ?auto_60930 ?auto_60931 ) ) ( not ( = ?auto_60930 ?auto_60932 ) ) ( not ( = ?auto_60930 ?auto_60933 ) ) ( not ( = ?auto_60930 ?auto_60934 ) ) ( not ( = ?auto_60931 ?auto_60932 ) ) ( not ( = ?auto_60931 ?auto_60933 ) ) ( not ( = ?auto_60931 ?auto_60934 ) ) ( not ( = ?auto_60932 ?auto_60933 ) ) ( not ( = ?auto_60932 ?auto_60934 ) ) ( not ( = ?auto_60933 ?auto_60934 ) ) ( ON ?auto_60932 ?auto_60933 ) ( ON ?auto_60931 ?auto_60932 ) ( ON ?auto_60930 ?auto_60931 ) ( CLEAR ?auto_60928 ) ( ON ?auto_60929 ?auto_60930 ) ( CLEAR ?auto_60929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60925 ?auto_60926 ?auto_60927 ?auto_60928 ?auto_60929 )
      ( MAKE-9PILE ?auto_60925 ?auto_60926 ?auto_60927 ?auto_60928 ?auto_60929 ?auto_60930 ?auto_60931 ?auto_60932 ?auto_60933 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60944 - BLOCK
      ?auto_60945 - BLOCK
      ?auto_60946 - BLOCK
      ?auto_60947 - BLOCK
      ?auto_60948 - BLOCK
      ?auto_60949 - BLOCK
      ?auto_60950 - BLOCK
      ?auto_60951 - BLOCK
      ?auto_60952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60952 ) ( ON-TABLE ?auto_60944 ) ( ON ?auto_60945 ?auto_60944 ) ( ON ?auto_60946 ?auto_60945 ) ( ON ?auto_60947 ?auto_60946 ) ( not ( = ?auto_60944 ?auto_60945 ) ) ( not ( = ?auto_60944 ?auto_60946 ) ) ( not ( = ?auto_60944 ?auto_60947 ) ) ( not ( = ?auto_60944 ?auto_60948 ) ) ( not ( = ?auto_60944 ?auto_60949 ) ) ( not ( = ?auto_60944 ?auto_60950 ) ) ( not ( = ?auto_60944 ?auto_60951 ) ) ( not ( = ?auto_60944 ?auto_60952 ) ) ( not ( = ?auto_60945 ?auto_60946 ) ) ( not ( = ?auto_60945 ?auto_60947 ) ) ( not ( = ?auto_60945 ?auto_60948 ) ) ( not ( = ?auto_60945 ?auto_60949 ) ) ( not ( = ?auto_60945 ?auto_60950 ) ) ( not ( = ?auto_60945 ?auto_60951 ) ) ( not ( = ?auto_60945 ?auto_60952 ) ) ( not ( = ?auto_60946 ?auto_60947 ) ) ( not ( = ?auto_60946 ?auto_60948 ) ) ( not ( = ?auto_60946 ?auto_60949 ) ) ( not ( = ?auto_60946 ?auto_60950 ) ) ( not ( = ?auto_60946 ?auto_60951 ) ) ( not ( = ?auto_60946 ?auto_60952 ) ) ( not ( = ?auto_60947 ?auto_60948 ) ) ( not ( = ?auto_60947 ?auto_60949 ) ) ( not ( = ?auto_60947 ?auto_60950 ) ) ( not ( = ?auto_60947 ?auto_60951 ) ) ( not ( = ?auto_60947 ?auto_60952 ) ) ( not ( = ?auto_60948 ?auto_60949 ) ) ( not ( = ?auto_60948 ?auto_60950 ) ) ( not ( = ?auto_60948 ?auto_60951 ) ) ( not ( = ?auto_60948 ?auto_60952 ) ) ( not ( = ?auto_60949 ?auto_60950 ) ) ( not ( = ?auto_60949 ?auto_60951 ) ) ( not ( = ?auto_60949 ?auto_60952 ) ) ( not ( = ?auto_60950 ?auto_60951 ) ) ( not ( = ?auto_60950 ?auto_60952 ) ) ( not ( = ?auto_60951 ?auto_60952 ) ) ( ON ?auto_60951 ?auto_60952 ) ( ON ?auto_60950 ?auto_60951 ) ( ON ?auto_60949 ?auto_60950 ) ( CLEAR ?auto_60947 ) ( ON ?auto_60948 ?auto_60949 ) ( CLEAR ?auto_60948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60944 ?auto_60945 ?auto_60946 ?auto_60947 ?auto_60948 )
      ( MAKE-9PILE ?auto_60944 ?auto_60945 ?auto_60946 ?auto_60947 ?auto_60948 ?auto_60949 ?auto_60950 ?auto_60951 ?auto_60952 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60962 - BLOCK
      ?auto_60963 - BLOCK
      ?auto_60964 - BLOCK
      ?auto_60965 - BLOCK
      ?auto_60966 - BLOCK
      ?auto_60967 - BLOCK
      ?auto_60968 - BLOCK
      ?auto_60969 - BLOCK
      ?auto_60970 - BLOCK
    )
    :vars
    (
      ?auto_60971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60970 ?auto_60971 ) ( ON-TABLE ?auto_60962 ) ( ON ?auto_60963 ?auto_60962 ) ( ON ?auto_60964 ?auto_60963 ) ( not ( = ?auto_60962 ?auto_60963 ) ) ( not ( = ?auto_60962 ?auto_60964 ) ) ( not ( = ?auto_60962 ?auto_60965 ) ) ( not ( = ?auto_60962 ?auto_60966 ) ) ( not ( = ?auto_60962 ?auto_60967 ) ) ( not ( = ?auto_60962 ?auto_60968 ) ) ( not ( = ?auto_60962 ?auto_60969 ) ) ( not ( = ?auto_60962 ?auto_60970 ) ) ( not ( = ?auto_60962 ?auto_60971 ) ) ( not ( = ?auto_60963 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60965 ) ) ( not ( = ?auto_60963 ?auto_60966 ) ) ( not ( = ?auto_60963 ?auto_60967 ) ) ( not ( = ?auto_60963 ?auto_60968 ) ) ( not ( = ?auto_60963 ?auto_60969 ) ) ( not ( = ?auto_60963 ?auto_60970 ) ) ( not ( = ?auto_60963 ?auto_60971 ) ) ( not ( = ?auto_60964 ?auto_60965 ) ) ( not ( = ?auto_60964 ?auto_60966 ) ) ( not ( = ?auto_60964 ?auto_60967 ) ) ( not ( = ?auto_60964 ?auto_60968 ) ) ( not ( = ?auto_60964 ?auto_60969 ) ) ( not ( = ?auto_60964 ?auto_60970 ) ) ( not ( = ?auto_60964 ?auto_60971 ) ) ( not ( = ?auto_60965 ?auto_60966 ) ) ( not ( = ?auto_60965 ?auto_60967 ) ) ( not ( = ?auto_60965 ?auto_60968 ) ) ( not ( = ?auto_60965 ?auto_60969 ) ) ( not ( = ?auto_60965 ?auto_60970 ) ) ( not ( = ?auto_60965 ?auto_60971 ) ) ( not ( = ?auto_60966 ?auto_60967 ) ) ( not ( = ?auto_60966 ?auto_60968 ) ) ( not ( = ?auto_60966 ?auto_60969 ) ) ( not ( = ?auto_60966 ?auto_60970 ) ) ( not ( = ?auto_60966 ?auto_60971 ) ) ( not ( = ?auto_60967 ?auto_60968 ) ) ( not ( = ?auto_60967 ?auto_60969 ) ) ( not ( = ?auto_60967 ?auto_60970 ) ) ( not ( = ?auto_60967 ?auto_60971 ) ) ( not ( = ?auto_60968 ?auto_60969 ) ) ( not ( = ?auto_60968 ?auto_60970 ) ) ( not ( = ?auto_60968 ?auto_60971 ) ) ( not ( = ?auto_60969 ?auto_60970 ) ) ( not ( = ?auto_60969 ?auto_60971 ) ) ( not ( = ?auto_60970 ?auto_60971 ) ) ( ON ?auto_60969 ?auto_60970 ) ( ON ?auto_60968 ?auto_60969 ) ( ON ?auto_60967 ?auto_60968 ) ( ON ?auto_60966 ?auto_60967 ) ( CLEAR ?auto_60964 ) ( ON ?auto_60965 ?auto_60966 ) ( CLEAR ?auto_60965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60962 ?auto_60963 ?auto_60964 ?auto_60965 )
      ( MAKE-9PILE ?auto_60962 ?auto_60963 ?auto_60964 ?auto_60965 ?auto_60966 ?auto_60967 ?auto_60968 ?auto_60969 ?auto_60970 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60981 - BLOCK
      ?auto_60982 - BLOCK
      ?auto_60983 - BLOCK
      ?auto_60984 - BLOCK
      ?auto_60985 - BLOCK
      ?auto_60986 - BLOCK
      ?auto_60987 - BLOCK
      ?auto_60988 - BLOCK
      ?auto_60989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60989 ) ( ON-TABLE ?auto_60981 ) ( ON ?auto_60982 ?auto_60981 ) ( ON ?auto_60983 ?auto_60982 ) ( not ( = ?auto_60981 ?auto_60982 ) ) ( not ( = ?auto_60981 ?auto_60983 ) ) ( not ( = ?auto_60981 ?auto_60984 ) ) ( not ( = ?auto_60981 ?auto_60985 ) ) ( not ( = ?auto_60981 ?auto_60986 ) ) ( not ( = ?auto_60981 ?auto_60987 ) ) ( not ( = ?auto_60981 ?auto_60988 ) ) ( not ( = ?auto_60981 ?auto_60989 ) ) ( not ( = ?auto_60982 ?auto_60983 ) ) ( not ( = ?auto_60982 ?auto_60984 ) ) ( not ( = ?auto_60982 ?auto_60985 ) ) ( not ( = ?auto_60982 ?auto_60986 ) ) ( not ( = ?auto_60982 ?auto_60987 ) ) ( not ( = ?auto_60982 ?auto_60988 ) ) ( not ( = ?auto_60982 ?auto_60989 ) ) ( not ( = ?auto_60983 ?auto_60984 ) ) ( not ( = ?auto_60983 ?auto_60985 ) ) ( not ( = ?auto_60983 ?auto_60986 ) ) ( not ( = ?auto_60983 ?auto_60987 ) ) ( not ( = ?auto_60983 ?auto_60988 ) ) ( not ( = ?auto_60983 ?auto_60989 ) ) ( not ( = ?auto_60984 ?auto_60985 ) ) ( not ( = ?auto_60984 ?auto_60986 ) ) ( not ( = ?auto_60984 ?auto_60987 ) ) ( not ( = ?auto_60984 ?auto_60988 ) ) ( not ( = ?auto_60984 ?auto_60989 ) ) ( not ( = ?auto_60985 ?auto_60986 ) ) ( not ( = ?auto_60985 ?auto_60987 ) ) ( not ( = ?auto_60985 ?auto_60988 ) ) ( not ( = ?auto_60985 ?auto_60989 ) ) ( not ( = ?auto_60986 ?auto_60987 ) ) ( not ( = ?auto_60986 ?auto_60988 ) ) ( not ( = ?auto_60986 ?auto_60989 ) ) ( not ( = ?auto_60987 ?auto_60988 ) ) ( not ( = ?auto_60987 ?auto_60989 ) ) ( not ( = ?auto_60988 ?auto_60989 ) ) ( ON ?auto_60988 ?auto_60989 ) ( ON ?auto_60987 ?auto_60988 ) ( ON ?auto_60986 ?auto_60987 ) ( ON ?auto_60985 ?auto_60986 ) ( CLEAR ?auto_60983 ) ( ON ?auto_60984 ?auto_60985 ) ( CLEAR ?auto_60984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60981 ?auto_60982 ?auto_60983 ?auto_60984 )
      ( MAKE-9PILE ?auto_60981 ?auto_60982 ?auto_60983 ?auto_60984 ?auto_60985 ?auto_60986 ?auto_60987 ?auto_60988 ?auto_60989 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_60999 - BLOCK
      ?auto_61000 - BLOCK
      ?auto_61001 - BLOCK
      ?auto_61002 - BLOCK
      ?auto_61003 - BLOCK
      ?auto_61004 - BLOCK
      ?auto_61005 - BLOCK
      ?auto_61006 - BLOCK
      ?auto_61007 - BLOCK
    )
    :vars
    (
      ?auto_61008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61007 ?auto_61008 ) ( ON-TABLE ?auto_60999 ) ( ON ?auto_61000 ?auto_60999 ) ( not ( = ?auto_60999 ?auto_61000 ) ) ( not ( = ?auto_60999 ?auto_61001 ) ) ( not ( = ?auto_60999 ?auto_61002 ) ) ( not ( = ?auto_60999 ?auto_61003 ) ) ( not ( = ?auto_60999 ?auto_61004 ) ) ( not ( = ?auto_60999 ?auto_61005 ) ) ( not ( = ?auto_60999 ?auto_61006 ) ) ( not ( = ?auto_60999 ?auto_61007 ) ) ( not ( = ?auto_60999 ?auto_61008 ) ) ( not ( = ?auto_61000 ?auto_61001 ) ) ( not ( = ?auto_61000 ?auto_61002 ) ) ( not ( = ?auto_61000 ?auto_61003 ) ) ( not ( = ?auto_61000 ?auto_61004 ) ) ( not ( = ?auto_61000 ?auto_61005 ) ) ( not ( = ?auto_61000 ?auto_61006 ) ) ( not ( = ?auto_61000 ?auto_61007 ) ) ( not ( = ?auto_61000 ?auto_61008 ) ) ( not ( = ?auto_61001 ?auto_61002 ) ) ( not ( = ?auto_61001 ?auto_61003 ) ) ( not ( = ?auto_61001 ?auto_61004 ) ) ( not ( = ?auto_61001 ?auto_61005 ) ) ( not ( = ?auto_61001 ?auto_61006 ) ) ( not ( = ?auto_61001 ?auto_61007 ) ) ( not ( = ?auto_61001 ?auto_61008 ) ) ( not ( = ?auto_61002 ?auto_61003 ) ) ( not ( = ?auto_61002 ?auto_61004 ) ) ( not ( = ?auto_61002 ?auto_61005 ) ) ( not ( = ?auto_61002 ?auto_61006 ) ) ( not ( = ?auto_61002 ?auto_61007 ) ) ( not ( = ?auto_61002 ?auto_61008 ) ) ( not ( = ?auto_61003 ?auto_61004 ) ) ( not ( = ?auto_61003 ?auto_61005 ) ) ( not ( = ?auto_61003 ?auto_61006 ) ) ( not ( = ?auto_61003 ?auto_61007 ) ) ( not ( = ?auto_61003 ?auto_61008 ) ) ( not ( = ?auto_61004 ?auto_61005 ) ) ( not ( = ?auto_61004 ?auto_61006 ) ) ( not ( = ?auto_61004 ?auto_61007 ) ) ( not ( = ?auto_61004 ?auto_61008 ) ) ( not ( = ?auto_61005 ?auto_61006 ) ) ( not ( = ?auto_61005 ?auto_61007 ) ) ( not ( = ?auto_61005 ?auto_61008 ) ) ( not ( = ?auto_61006 ?auto_61007 ) ) ( not ( = ?auto_61006 ?auto_61008 ) ) ( not ( = ?auto_61007 ?auto_61008 ) ) ( ON ?auto_61006 ?auto_61007 ) ( ON ?auto_61005 ?auto_61006 ) ( ON ?auto_61004 ?auto_61005 ) ( ON ?auto_61003 ?auto_61004 ) ( ON ?auto_61002 ?auto_61003 ) ( CLEAR ?auto_61000 ) ( ON ?auto_61001 ?auto_61002 ) ( CLEAR ?auto_61001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60999 ?auto_61000 ?auto_61001 )
      ( MAKE-9PILE ?auto_60999 ?auto_61000 ?auto_61001 ?auto_61002 ?auto_61003 ?auto_61004 ?auto_61005 ?auto_61006 ?auto_61007 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61018 - BLOCK
      ?auto_61019 - BLOCK
      ?auto_61020 - BLOCK
      ?auto_61021 - BLOCK
      ?auto_61022 - BLOCK
      ?auto_61023 - BLOCK
      ?auto_61024 - BLOCK
      ?auto_61025 - BLOCK
      ?auto_61026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61026 ) ( ON-TABLE ?auto_61018 ) ( ON ?auto_61019 ?auto_61018 ) ( not ( = ?auto_61018 ?auto_61019 ) ) ( not ( = ?auto_61018 ?auto_61020 ) ) ( not ( = ?auto_61018 ?auto_61021 ) ) ( not ( = ?auto_61018 ?auto_61022 ) ) ( not ( = ?auto_61018 ?auto_61023 ) ) ( not ( = ?auto_61018 ?auto_61024 ) ) ( not ( = ?auto_61018 ?auto_61025 ) ) ( not ( = ?auto_61018 ?auto_61026 ) ) ( not ( = ?auto_61019 ?auto_61020 ) ) ( not ( = ?auto_61019 ?auto_61021 ) ) ( not ( = ?auto_61019 ?auto_61022 ) ) ( not ( = ?auto_61019 ?auto_61023 ) ) ( not ( = ?auto_61019 ?auto_61024 ) ) ( not ( = ?auto_61019 ?auto_61025 ) ) ( not ( = ?auto_61019 ?auto_61026 ) ) ( not ( = ?auto_61020 ?auto_61021 ) ) ( not ( = ?auto_61020 ?auto_61022 ) ) ( not ( = ?auto_61020 ?auto_61023 ) ) ( not ( = ?auto_61020 ?auto_61024 ) ) ( not ( = ?auto_61020 ?auto_61025 ) ) ( not ( = ?auto_61020 ?auto_61026 ) ) ( not ( = ?auto_61021 ?auto_61022 ) ) ( not ( = ?auto_61021 ?auto_61023 ) ) ( not ( = ?auto_61021 ?auto_61024 ) ) ( not ( = ?auto_61021 ?auto_61025 ) ) ( not ( = ?auto_61021 ?auto_61026 ) ) ( not ( = ?auto_61022 ?auto_61023 ) ) ( not ( = ?auto_61022 ?auto_61024 ) ) ( not ( = ?auto_61022 ?auto_61025 ) ) ( not ( = ?auto_61022 ?auto_61026 ) ) ( not ( = ?auto_61023 ?auto_61024 ) ) ( not ( = ?auto_61023 ?auto_61025 ) ) ( not ( = ?auto_61023 ?auto_61026 ) ) ( not ( = ?auto_61024 ?auto_61025 ) ) ( not ( = ?auto_61024 ?auto_61026 ) ) ( not ( = ?auto_61025 ?auto_61026 ) ) ( ON ?auto_61025 ?auto_61026 ) ( ON ?auto_61024 ?auto_61025 ) ( ON ?auto_61023 ?auto_61024 ) ( ON ?auto_61022 ?auto_61023 ) ( ON ?auto_61021 ?auto_61022 ) ( CLEAR ?auto_61019 ) ( ON ?auto_61020 ?auto_61021 ) ( CLEAR ?auto_61020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61018 ?auto_61019 ?auto_61020 )
      ( MAKE-9PILE ?auto_61018 ?auto_61019 ?auto_61020 ?auto_61021 ?auto_61022 ?auto_61023 ?auto_61024 ?auto_61025 ?auto_61026 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61036 - BLOCK
      ?auto_61037 - BLOCK
      ?auto_61038 - BLOCK
      ?auto_61039 - BLOCK
      ?auto_61040 - BLOCK
      ?auto_61041 - BLOCK
      ?auto_61042 - BLOCK
      ?auto_61043 - BLOCK
      ?auto_61044 - BLOCK
    )
    :vars
    (
      ?auto_61045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61044 ?auto_61045 ) ( ON-TABLE ?auto_61036 ) ( not ( = ?auto_61036 ?auto_61037 ) ) ( not ( = ?auto_61036 ?auto_61038 ) ) ( not ( = ?auto_61036 ?auto_61039 ) ) ( not ( = ?auto_61036 ?auto_61040 ) ) ( not ( = ?auto_61036 ?auto_61041 ) ) ( not ( = ?auto_61036 ?auto_61042 ) ) ( not ( = ?auto_61036 ?auto_61043 ) ) ( not ( = ?auto_61036 ?auto_61044 ) ) ( not ( = ?auto_61036 ?auto_61045 ) ) ( not ( = ?auto_61037 ?auto_61038 ) ) ( not ( = ?auto_61037 ?auto_61039 ) ) ( not ( = ?auto_61037 ?auto_61040 ) ) ( not ( = ?auto_61037 ?auto_61041 ) ) ( not ( = ?auto_61037 ?auto_61042 ) ) ( not ( = ?auto_61037 ?auto_61043 ) ) ( not ( = ?auto_61037 ?auto_61044 ) ) ( not ( = ?auto_61037 ?auto_61045 ) ) ( not ( = ?auto_61038 ?auto_61039 ) ) ( not ( = ?auto_61038 ?auto_61040 ) ) ( not ( = ?auto_61038 ?auto_61041 ) ) ( not ( = ?auto_61038 ?auto_61042 ) ) ( not ( = ?auto_61038 ?auto_61043 ) ) ( not ( = ?auto_61038 ?auto_61044 ) ) ( not ( = ?auto_61038 ?auto_61045 ) ) ( not ( = ?auto_61039 ?auto_61040 ) ) ( not ( = ?auto_61039 ?auto_61041 ) ) ( not ( = ?auto_61039 ?auto_61042 ) ) ( not ( = ?auto_61039 ?auto_61043 ) ) ( not ( = ?auto_61039 ?auto_61044 ) ) ( not ( = ?auto_61039 ?auto_61045 ) ) ( not ( = ?auto_61040 ?auto_61041 ) ) ( not ( = ?auto_61040 ?auto_61042 ) ) ( not ( = ?auto_61040 ?auto_61043 ) ) ( not ( = ?auto_61040 ?auto_61044 ) ) ( not ( = ?auto_61040 ?auto_61045 ) ) ( not ( = ?auto_61041 ?auto_61042 ) ) ( not ( = ?auto_61041 ?auto_61043 ) ) ( not ( = ?auto_61041 ?auto_61044 ) ) ( not ( = ?auto_61041 ?auto_61045 ) ) ( not ( = ?auto_61042 ?auto_61043 ) ) ( not ( = ?auto_61042 ?auto_61044 ) ) ( not ( = ?auto_61042 ?auto_61045 ) ) ( not ( = ?auto_61043 ?auto_61044 ) ) ( not ( = ?auto_61043 ?auto_61045 ) ) ( not ( = ?auto_61044 ?auto_61045 ) ) ( ON ?auto_61043 ?auto_61044 ) ( ON ?auto_61042 ?auto_61043 ) ( ON ?auto_61041 ?auto_61042 ) ( ON ?auto_61040 ?auto_61041 ) ( ON ?auto_61039 ?auto_61040 ) ( ON ?auto_61038 ?auto_61039 ) ( CLEAR ?auto_61036 ) ( ON ?auto_61037 ?auto_61038 ) ( CLEAR ?auto_61037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61036 ?auto_61037 )
      ( MAKE-9PILE ?auto_61036 ?auto_61037 ?auto_61038 ?auto_61039 ?auto_61040 ?auto_61041 ?auto_61042 ?auto_61043 ?auto_61044 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61055 - BLOCK
      ?auto_61056 - BLOCK
      ?auto_61057 - BLOCK
      ?auto_61058 - BLOCK
      ?auto_61059 - BLOCK
      ?auto_61060 - BLOCK
      ?auto_61061 - BLOCK
      ?auto_61062 - BLOCK
      ?auto_61063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61063 ) ( ON-TABLE ?auto_61055 ) ( not ( = ?auto_61055 ?auto_61056 ) ) ( not ( = ?auto_61055 ?auto_61057 ) ) ( not ( = ?auto_61055 ?auto_61058 ) ) ( not ( = ?auto_61055 ?auto_61059 ) ) ( not ( = ?auto_61055 ?auto_61060 ) ) ( not ( = ?auto_61055 ?auto_61061 ) ) ( not ( = ?auto_61055 ?auto_61062 ) ) ( not ( = ?auto_61055 ?auto_61063 ) ) ( not ( = ?auto_61056 ?auto_61057 ) ) ( not ( = ?auto_61056 ?auto_61058 ) ) ( not ( = ?auto_61056 ?auto_61059 ) ) ( not ( = ?auto_61056 ?auto_61060 ) ) ( not ( = ?auto_61056 ?auto_61061 ) ) ( not ( = ?auto_61056 ?auto_61062 ) ) ( not ( = ?auto_61056 ?auto_61063 ) ) ( not ( = ?auto_61057 ?auto_61058 ) ) ( not ( = ?auto_61057 ?auto_61059 ) ) ( not ( = ?auto_61057 ?auto_61060 ) ) ( not ( = ?auto_61057 ?auto_61061 ) ) ( not ( = ?auto_61057 ?auto_61062 ) ) ( not ( = ?auto_61057 ?auto_61063 ) ) ( not ( = ?auto_61058 ?auto_61059 ) ) ( not ( = ?auto_61058 ?auto_61060 ) ) ( not ( = ?auto_61058 ?auto_61061 ) ) ( not ( = ?auto_61058 ?auto_61062 ) ) ( not ( = ?auto_61058 ?auto_61063 ) ) ( not ( = ?auto_61059 ?auto_61060 ) ) ( not ( = ?auto_61059 ?auto_61061 ) ) ( not ( = ?auto_61059 ?auto_61062 ) ) ( not ( = ?auto_61059 ?auto_61063 ) ) ( not ( = ?auto_61060 ?auto_61061 ) ) ( not ( = ?auto_61060 ?auto_61062 ) ) ( not ( = ?auto_61060 ?auto_61063 ) ) ( not ( = ?auto_61061 ?auto_61062 ) ) ( not ( = ?auto_61061 ?auto_61063 ) ) ( not ( = ?auto_61062 ?auto_61063 ) ) ( ON ?auto_61062 ?auto_61063 ) ( ON ?auto_61061 ?auto_61062 ) ( ON ?auto_61060 ?auto_61061 ) ( ON ?auto_61059 ?auto_61060 ) ( ON ?auto_61058 ?auto_61059 ) ( ON ?auto_61057 ?auto_61058 ) ( CLEAR ?auto_61055 ) ( ON ?auto_61056 ?auto_61057 ) ( CLEAR ?auto_61056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61055 ?auto_61056 )
      ( MAKE-9PILE ?auto_61055 ?auto_61056 ?auto_61057 ?auto_61058 ?auto_61059 ?auto_61060 ?auto_61061 ?auto_61062 ?auto_61063 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61073 - BLOCK
      ?auto_61074 - BLOCK
      ?auto_61075 - BLOCK
      ?auto_61076 - BLOCK
      ?auto_61077 - BLOCK
      ?auto_61078 - BLOCK
      ?auto_61079 - BLOCK
      ?auto_61080 - BLOCK
      ?auto_61081 - BLOCK
    )
    :vars
    (
      ?auto_61082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61081 ?auto_61082 ) ( not ( = ?auto_61073 ?auto_61074 ) ) ( not ( = ?auto_61073 ?auto_61075 ) ) ( not ( = ?auto_61073 ?auto_61076 ) ) ( not ( = ?auto_61073 ?auto_61077 ) ) ( not ( = ?auto_61073 ?auto_61078 ) ) ( not ( = ?auto_61073 ?auto_61079 ) ) ( not ( = ?auto_61073 ?auto_61080 ) ) ( not ( = ?auto_61073 ?auto_61081 ) ) ( not ( = ?auto_61073 ?auto_61082 ) ) ( not ( = ?auto_61074 ?auto_61075 ) ) ( not ( = ?auto_61074 ?auto_61076 ) ) ( not ( = ?auto_61074 ?auto_61077 ) ) ( not ( = ?auto_61074 ?auto_61078 ) ) ( not ( = ?auto_61074 ?auto_61079 ) ) ( not ( = ?auto_61074 ?auto_61080 ) ) ( not ( = ?auto_61074 ?auto_61081 ) ) ( not ( = ?auto_61074 ?auto_61082 ) ) ( not ( = ?auto_61075 ?auto_61076 ) ) ( not ( = ?auto_61075 ?auto_61077 ) ) ( not ( = ?auto_61075 ?auto_61078 ) ) ( not ( = ?auto_61075 ?auto_61079 ) ) ( not ( = ?auto_61075 ?auto_61080 ) ) ( not ( = ?auto_61075 ?auto_61081 ) ) ( not ( = ?auto_61075 ?auto_61082 ) ) ( not ( = ?auto_61076 ?auto_61077 ) ) ( not ( = ?auto_61076 ?auto_61078 ) ) ( not ( = ?auto_61076 ?auto_61079 ) ) ( not ( = ?auto_61076 ?auto_61080 ) ) ( not ( = ?auto_61076 ?auto_61081 ) ) ( not ( = ?auto_61076 ?auto_61082 ) ) ( not ( = ?auto_61077 ?auto_61078 ) ) ( not ( = ?auto_61077 ?auto_61079 ) ) ( not ( = ?auto_61077 ?auto_61080 ) ) ( not ( = ?auto_61077 ?auto_61081 ) ) ( not ( = ?auto_61077 ?auto_61082 ) ) ( not ( = ?auto_61078 ?auto_61079 ) ) ( not ( = ?auto_61078 ?auto_61080 ) ) ( not ( = ?auto_61078 ?auto_61081 ) ) ( not ( = ?auto_61078 ?auto_61082 ) ) ( not ( = ?auto_61079 ?auto_61080 ) ) ( not ( = ?auto_61079 ?auto_61081 ) ) ( not ( = ?auto_61079 ?auto_61082 ) ) ( not ( = ?auto_61080 ?auto_61081 ) ) ( not ( = ?auto_61080 ?auto_61082 ) ) ( not ( = ?auto_61081 ?auto_61082 ) ) ( ON ?auto_61080 ?auto_61081 ) ( ON ?auto_61079 ?auto_61080 ) ( ON ?auto_61078 ?auto_61079 ) ( ON ?auto_61077 ?auto_61078 ) ( ON ?auto_61076 ?auto_61077 ) ( ON ?auto_61075 ?auto_61076 ) ( ON ?auto_61074 ?auto_61075 ) ( ON ?auto_61073 ?auto_61074 ) ( CLEAR ?auto_61073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61073 )
      ( MAKE-9PILE ?auto_61073 ?auto_61074 ?auto_61075 ?auto_61076 ?auto_61077 ?auto_61078 ?auto_61079 ?auto_61080 ?auto_61081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61092 - BLOCK
      ?auto_61093 - BLOCK
      ?auto_61094 - BLOCK
      ?auto_61095 - BLOCK
      ?auto_61096 - BLOCK
      ?auto_61097 - BLOCK
      ?auto_61098 - BLOCK
      ?auto_61099 - BLOCK
      ?auto_61100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61100 ) ( not ( = ?auto_61092 ?auto_61093 ) ) ( not ( = ?auto_61092 ?auto_61094 ) ) ( not ( = ?auto_61092 ?auto_61095 ) ) ( not ( = ?auto_61092 ?auto_61096 ) ) ( not ( = ?auto_61092 ?auto_61097 ) ) ( not ( = ?auto_61092 ?auto_61098 ) ) ( not ( = ?auto_61092 ?auto_61099 ) ) ( not ( = ?auto_61092 ?auto_61100 ) ) ( not ( = ?auto_61093 ?auto_61094 ) ) ( not ( = ?auto_61093 ?auto_61095 ) ) ( not ( = ?auto_61093 ?auto_61096 ) ) ( not ( = ?auto_61093 ?auto_61097 ) ) ( not ( = ?auto_61093 ?auto_61098 ) ) ( not ( = ?auto_61093 ?auto_61099 ) ) ( not ( = ?auto_61093 ?auto_61100 ) ) ( not ( = ?auto_61094 ?auto_61095 ) ) ( not ( = ?auto_61094 ?auto_61096 ) ) ( not ( = ?auto_61094 ?auto_61097 ) ) ( not ( = ?auto_61094 ?auto_61098 ) ) ( not ( = ?auto_61094 ?auto_61099 ) ) ( not ( = ?auto_61094 ?auto_61100 ) ) ( not ( = ?auto_61095 ?auto_61096 ) ) ( not ( = ?auto_61095 ?auto_61097 ) ) ( not ( = ?auto_61095 ?auto_61098 ) ) ( not ( = ?auto_61095 ?auto_61099 ) ) ( not ( = ?auto_61095 ?auto_61100 ) ) ( not ( = ?auto_61096 ?auto_61097 ) ) ( not ( = ?auto_61096 ?auto_61098 ) ) ( not ( = ?auto_61096 ?auto_61099 ) ) ( not ( = ?auto_61096 ?auto_61100 ) ) ( not ( = ?auto_61097 ?auto_61098 ) ) ( not ( = ?auto_61097 ?auto_61099 ) ) ( not ( = ?auto_61097 ?auto_61100 ) ) ( not ( = ?auto_61098 ?auto_61099 ) ) ( not ( = ?auto_61098 ?auto_61100 ) ) ( not ( = ?auto_61099 ?auto_61100 ) ) ( ON ?auto_61099 ?auto_61100 ) ( ON ?auto_61098 ?auto_61099 ) ( ON ?auto_61097 ?auto_61098 ) ( ON ?auto_61096 ?auto_61097 ) ( ON ?auto_61095 ?auto_61096 ) ( ON ?auto_61094 ?auto_61095 ) ( ON ?auto_61093 ?auto_61094 ) ( ON ?auto_61092 ?auto_61093 ) ( CLEAR ?auto_61092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61092 )
      ( MAKE-9PILE ?auto_61092 ?auto_61093 ?auto_61094 ?auto_61095 ?auto_61096 ?auto_61097 ?auto_61098 ?auto_61099 ?auto_61100 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_61110 - BLOCK
      ?auto_61111 - BLOCK
      ?auto_61112 - BLOCK
      ?auto_61113 - BLOCK
      ?auto_61114 - BLOCK
      ?auto_61115 - BLOCK
      ?auto_61116 - BLOCK
      ?auto_61117 - BLOCK
      ?auto_61118 - BLOCK
    )
    :vars
    (
      ?auto_61119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61110 ?auto_61111 ) ) ( not ( = ?auto_61110 ?auto_61112 ) ) ( not ( = ?auto_61110 ?auto_61113 ) ) ( not ( = ?auto_61110 ?auto_61114 ) ) ( not ( = ?auto_61110 ?auto_61115 ) ) ( not ( = ?auto_61110 ?auto_61116 ) ) ( not ( = ?auto_61110 ?auto_61117 ) ) ( not ( = ?auto_61110 ?auto_61118 ) ) ( not ( = ?auto_61111 ?auto_61112 ) ) ( not ( = ?auto_61111 ?auto_61113 ) ) ( not ( = ?auto_61111 ?auto_61114 ) ) ( not ( = ?auto_61111 ?auto_61115 ) ) ( not ( = ?auto_61111 ?auto_61116 ) ) ( not ( = ?auto_61111 ?auto_61117 ) ) ( not ( = ?auto_61111 ?auto_61118 ) ) ( not ( = ?auto_61112 ?auto_61113 ) ) ( not ( = ?auto_61112 ?auto_61114 ) ) ( not ( = ?auto_61112 ?auto_61115 ) ) ( not ( = ?auto_61112 ?auto_61116 ) ) ( not ( = ?auto_61112 ?auto_61117 ) ) ( not ( = ?auto_61112 ?auto_61118 ) ) ( not ( = ?auto_61113 ?auto_61114 ) ) ( not ( = ?auto_61113 ?auto_61115 ) ) ( not ( = ?auto_61113 ?auto_61116 ) ) ( not ( = ?auto_61113 ?auto_61117 ) ) ( not ( = ?auto_61113 ?auto_61118 ) ) ( not ( = ?auto_61114 ?auto_61115 ) ) ( not ( = ?auto_61114 ?auto_61116 ) ) ( not ( = ?auto_61114 ?auto_61117 ) ) ( not ( = ?auto_61114 ?auto_61118 ) ) ( not ( = ?auto_61115 ?auto_61116 ) ) ( not ( = ?auto_61115 ?auto_61117 ) ) ( not ( = ?auto_61115 ?auto_61118 ) ) ( not ( = ?auto_61116 ?auto_61117 ) ) ( not ( = ?auto_61116 ?auto_61118 ) ) ( not ( = ?auto_61117 ?auto_61118 ) ) ( ON ?auto_61110 ?auto_61119 ) ( not ( = ?auto_61118 ?auto_61119 ) ) ( not ( = ?auto_61117 ?auto_61119 ) ) ( not ( = ?auto_61116 ?auto_61119 ) ) ( not ( = ?auto_61115 ?auto_61119 ) ) ( not ( = ?auto_61114 ?auto_61119 ) ) ( not ( = ?auto_61113 ?auto_61119 ) ) ( not ( = ?auto_61112 ?auto_61119 ) ) ( not ( = ?auto_61111 ?auto_61119 ) ) ( not ( = ?auto_61110 ?auto_61119 ) ) ( ON ?auto_61111 ?auto_61110 ) ( ON ?auto_61112 ?auto_61111 ) ( ON ?auto_61113 ?auto_61112 ) ( ON ?auto_61114 ?auto_61113 ) ( ON ?auto_61115 ?auto_61114 ) ( ON ?auto_61116 ?auto_61115 ) ( ON ?auto_61117 ?auto_61116 ) ( ON ?auto_61118 ?auto_61117 ) ( CLEAR ?auto_61118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_61118 ?auto_61117 ?auto_61116 ?auto_61115 ?auto_61114 ?auto_61113 ?auto_61112 ?auto_61111 ?auto_61110 )
      ( MAKE-9PILE ?auto_61110 ?auto_61111 ?auto_61112 ?auto_61113 ?auto_61114 ?auto_61115 ?auto_61116 ?auto_61117 ?auto_61118 ) )
  )

)

