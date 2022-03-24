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
      ?auto_862839 - BLOCK
    )
    :vars
    (
      ?auto_862840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862839 ?auto_862840 ) ( CLEAR ?auto_862839 ) ( HAND-EMPTY ) ( not ( = ?auto_862839 ?auto_862840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_862839 ?auto_862840 )
      ( !PUTDOWN ?auto_862839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_862846 - BLOCK
      ?auto_862847 - BLOCK
    )
    :vars
    (
      ?auto_862848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_862846 ) ( ON ?auto_862847 ?auto_862848 ) ( CLEAR ?auto_862847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_862846 ) ( not ( = ?auto_862846 ?auto_862847 ) ) ( not ( = ?auto_862846 ?auto_862848 ) ) ( not ( = ?auto_862847 ?auto_862848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_862847 ?auto_862848 )
      ( !STACK ?auto_862847 ?auto_862846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_862856 - BLOCK
      ?auto_862857 - BLOCK
    )
    :vars
    (
      ?auto_862858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862857 ?auto_862858 ) ( not ( = ?auto_862856 ?auto_862857 ) ) ( not ( = ?auto_862856 ?auto_862858 ) ) ( not ( = ?auto_862857 ?auto_862858 ) ) ( ON ?auto_862856 ?auto_862857 ) ( CLEAR ?auto_862856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_862856 )
      ( MAKE-2PILE ?auto_862856 ?auto_862857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_862867 - BLOCK
      ?auto_862868 - BLOCK
      ?auto_862869 - BLOCK
    )
    :vars
    (
      ?auto_862870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_862868 ) ( ON ?auto_862869 ?auto_862870 ) ( CLEAR ?auto_862869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_862867 ) ( ON ?auto_862868 ?auto_862867 ) ( not ( = ?auto_862867 ?auto_862868 ) ) ( not ( = ?auto_862867 ?auto_862869 ) ) ( not ( = ?auto_862867 ?auto_862870 ) ) ( not ( = ?auto_862868 ?auto_862869 ) ) ( not ( = ?auto_862868 ?auto_862870 ) ) ( not ( = ?auto_862869 ?auto_862870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_862869 ?auto_862870 )
      ( !STACK ?auto_862869 ?auto_862868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_862881 - BLOCK
      ?auto_862882 - BLOCK
      ?auto_862883 - BLOCK
    )
    :vars
    (
      ?auto_862884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862883 ?auto_862884 ) ( ON-TABLE ?auto_862881 ) ( not ( = ?auto_862881 ?auto_862882 ) ) ( not ( = ?auto_862881 ?auto_862883 ) ) ( not ( = ?auto_862881 ?auto_862884 ) ) ( not ( = ?auto_862882 ?auto_862883 ) ) ( not ( = ?auto_862882 ?auto_862884 ) ) ( not ( = ?auto_862883 ?auto_862884 ) ) ( CLEAR ?auto_862881 ) ( ON ?auto_862882 ?auto_862883 ) ( CLEAR ?auto_862882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_862881 ?auto_862882 )
      ( MAKE-3PILE ?auto_862881 ?auto_862882 ?auto_862883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_862895 - BLOCK
      ?auto_862896 - BLOCK
      ?auto_862897 - BLOCK
    )
    :vars
    (
      ?auto_862898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862897 ?auto_862898 ) ( not ( = ?auto_862895 ?auto_862896 ) ) ( not ( = ?auto_862895 ?auto_862897 ) ) ( not ( = ?auto_862895 ?auto_862898 ) ) ( not ( = ?auto_862896 ?auto_862897 ) ) ( not ( = ?auto_862896 ?auto_862898 ) ) ( not ( = ?auto_862897 ?auto_862898 ) ) ( ON ?auto_862896 ?auto_862897 ) ( ON ?auto_862895 ?auto_862896 ) ( CLEAR ?auto_862895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_862895 )
      ( MAKE-3PILE ?auto_862895 ?auto_862896 ?auto_862897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_862910 - BLOCK
      ?auto_862911 - BLOCK
      ?auto_862912 - BLOCK
      ?auto_862913 - BLOCK
    )
    :vars
    (
      ?auto_862914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_862912 ) ( ON ?auto_862913 ?auto_862914 ) ( CLEAR ?auto_862913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_862910 ) ( ON ?auto_862911 ?auto_862910 ) ( ON ?auto_862912 ?auto_862911 ) ( not ( = ?auto_862910 ?auto_862911 ) ) ( not ( = ?auto_862910 ?auto_862912 ) ) ( not ( = ?auto_862910 ?auto_862913 ) ) ( not ( = ?auto_862910 ?auto_862914 ) ) ( not ( = ?auto_862911 ?auto_862912 ) ) ( not ( = ?auto_862911 ?auto_862913 ) ) ( not ( = ?auto_862911 ?auto_862914 ) ) ( not ( = ?auto_862912 ?auto_862913 ) ) ( not ( = ?auto_862912 ?auto_862914 ) ) ( not ( = ?auto_862913 ?auto_862914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_862913 ?auto_862914 )
      ( !STACK ?auto_862913 ?auto_862912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_862928 - BLOCK
      ?auto_862929 - BLOCK
      ?auto_862930 - BLOCK
      ?auto_862931 - BLOCK
    )
    :vars
    (
      ?auto_862932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862931 ?auto_862932 ) ( ON-TABLE ?auto_862928 ) ( ON ?auto_862929 ?auto_862928 ) ( not ( = ?auto_862928 ?auto_862929 ) ) ( not ( = ?auto_862928 ?auto_862930 ) ) ( not ( = ?auto_862928 ?auto_862931 ) ) ( not ( = ?auto_862928 ?auto_862932 ) ) ( not ( = ?auto_862929 ?auto_862930 ) ) ( not ( = ?auto_862929 ?auto_862931 ) ) ( not ( = ?auto_862929 ?auto_862932 ) ) ( not ( = ?auto_862930 ?auto_862931 ) ) ( not ( = ?auto_862930 ?auto_862932 ) ) ( not ( = ?auto_862931 ?auto_862932 ) ) ( CLEAR ?auto_862929 ) ( ON ?auto_862930 ?auto_862931 ) ( CLEAR ?auto_862930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_862928 ?auto_862929 ?auto_862930 )
      ( MAKE-4PILE ?auto_862928 ?auto_862929 ?auto_862930 ?auto_862931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_862946 - BLOCK
      ?auto_862947 - BLOCK
      ?auto_862948 - BLOCK
      ?auto_862949 - BLOCK
    )
    :vars
    (
      ?auto_862950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862949 ?auto_862950 ) ( ON-TABLE ?auto_862946 ) ( not ( = ?auto_862946 ?auto_862947 ) ) ( not ( = ?auto_862946 ?auto_862948 ) ) ( not ( = ?auto_862946 ?auto_862949 ) ) ( not ( = ?auto_862946 ?auto_862950 ) ) ( not ( = ?auto_862947 ?auto_862948 ) ) ( not ( = ?auto_862947 ?auto_862949 ) ) ( not ( = ?auto_862947 ?auto_862950 ) ) ( not ( = ?auto_862948 ?auto_862949 ) ) ( not ( = ?auto_862948 ?auto_862950 ) ) ( not ( = ?auto_862949 ?auto_862950 ) ) ( ON ?auto_862948 ?auto_862949 ) ( CLEAR ?auto_862946 ) ( ON ?auto_862947 ?auto_862948 ) ( CLEAR ?auto_862947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_862946 ?auto_862947 )
      ( MAKE-4PILE ?auto_862946 ?auto_862947 ?auto_862948 ?auto_862949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_862964 - BLOCK
      ?auto_862965 - BLOCK
      ?auto_862966 - BLOCK
      ?auto_862967 - BLOCK
    )
    :vars
    (
      ?auto_862968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862967 ?auto_862968 ) ( not ( = ?auto_862964 ?auto_862965 ) ) ( not ( = ?auto_862964 ?auto_862966 ) ) ( not ( = ?auto_862964 ?auto_862967 ) ) ( not ( = ?auto_862964 ?auto_862968 ) ) ( not ( = ?auto_862965 ?auto_862966 ) ) ( not ( = ?auto_862965 ?auto_862967 ) ) ( not ( = ?auto_862965 ?auto_862968 ) ) ( not ( = ?auto_862966 ?auto_862967 ) ) ( not ( = ?auto_862966 ?auto_862968 ) ) ( not ( = ?auto_862967 ?auto_862968 ) ) ( ON ?auto_862966 ?auto_862967 ) ( ON ?auto_862965 ?auto_862966 ) ( ON ?auto_862964 ?auto_862965 ) ( CLEAR ?auto_862964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_862964 )
      ( MAKE-4PILE ?auto_862964 ?auto_862965 ?auto_862966 ?auto_862967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_862983 - BLOCK
      ?auto_862984 - BLOCK
      ?auto_862985 - BLOCK
      ?auto_862986 - BLOCK
      ?auto_862987 - BLOCK
    )
    :vars
    (
      ?auto_862988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_862986 ) ( ON ?auto_862987 ?auto_862988 ) ( CLEAR ?auto_862987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_862983 ) ( ON ?auto_862984 ?auto_862983 ) ( ON ?auto_862985 ?auto_862984 ) ( ON ?auto_862986 ?auto_862985 ) ( not ( = ?auto_862983 ?auto_862984 ) ) ( not ( = ?auto_862983 ?auto_862985 ) ) ( not ( = ?auto_862983 ?auto_862986 ) ) ( not ( = ?auto_862983 ?auto_862987 ) ) ( not ( = ?auto_862983 ?auto_862988 ) ) ( not ( = ?auto_862984 ?auto_862985 ) ) ( not ( = ?auto_862984 ?auto_862986 ) ) ( not ( = ?auto_862984 ?auto_862987 ) ) ( not ( = ?auto_862984 ?auto_862988 ) ) ( not ( = ?auto_862985 ?auto_862986 ) ) ( not ( = ?auto_862985 ?auto_862987 ) ) ( not ( = ?auto_862985 ?auto_862988 ) ) ( not ( = ?auto_862986 ?auto_862987 ) ) ( not ( = ?auto_862986 ?auto_862988 ) ) ( not ( = ?auto_862987 ?auto_862988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_862987 ?auto_862988 )
      ( !STACK ?auto_862987 ?auto_862986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_863005 - BLOCK
      ?auto_863006 - BLOCK
      ?auto_863007 - BLOCK
      ?auto_863008 - BLOCK
      ?auto_863009 - BLOCK
    )
    :vars
    (
      ?auto_863010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863009 ?auto_863010 ) ( ON-TABLE ?auto_863005 ) ( ON ?auto_863006 ?auto_863005 ) ( ON ?auto_863007 ?auto_863006 ) ( not ( = ?auto_863005 ?auto_863006 ) ) ( not ( = ?auto_863005 ?auto_863007 ) ) ( not ( = ?auto_863005 ?auto_863008 ) ) ( not ( = ?auto_863005 ?auto_863009 ) ) ( not ( = ?auto_863005 ?auto_863010 ) ) ( not ( = ?auto_863006 ?auto_863007 ) ) ( not ( = ?auto_863006 ?auto_863008 ) ) ( not ( = ?auto_863006 ?auto_863009 ) ) ( not ( = ?auto_863006 ?auto_863010 ) ) ( not ( = ?auto_863007 ?auto_863008 ) ) ( not ( = ?auto_863007 ?auto_863009 ) ) ( not ( = ?auto_863007 ?auto_863010 ) ) ( not ( = ?auto_863008 ?auto_863009 ) ) ( not ( = ?auto_863008 ?auto_863010 ) ) ( not ( = ?auto_863009 ?auto_863010 ) ) ( CLEAR ?auto_863007 ) ( ON ?auto_863008 ?auto_863009 ) ( CLEAR ?auto_863008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_863005 ?auto_863006 ?auto_863007 ?auto_863008 )
      ( MAKE-5PILE ?auto_863005 ?auto_863006 ?auto_863007 ?auto_863008 ?auto_863009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_863027 - BLOCK
      ?auto_863028 - BLOCK
      ?auto_863029 - BLOCK
      ?auto_863030 - BLOCK
      ?auto_863031 - BLOCK
    )
    :vars
    (
      ?auto_863032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863031 ?auto_863032 ) ( ON-TABLE ?auto_863027 ) ( ON ?auto_863028 ?auto_863027 ) ( not ( = ?auto_863027 ?auto_863028 ) ) ( not ( = ?auto_863027 ?auto_863029 ) ) ( not ( = ?auto_863027 ?auto_863030 ) ) ( not ( = ?auto_863027 ?auto_863031 ) ) ( not ( = ?auto_863027 ?auto_863032 ) ) ( not ( = ?auto_863028 ?auto_863029 ) ) ( not ( = ?auto_863028 ?auto_863030 ) ) ( not ( = ?auto_863028 ?auto_863031 ) ) ( not ( = ?auto_863028 ?auto_863032 ) ) ( not ( = ?auto_863029 ?auto_863030 ) ) ( not ( = ?auto_863029 ?auto_863031 ) ) ( not ( = ?auto_863029 ?auto_863032 ) ) ( not ( = ?auto_863030 ?auto_863031 ) ) ( not ( = ?auto_863030 ?auto_863032 ) ) ( not ( = ?auto_863031 ?auto_863032 ) ) ( ON ?auto_863030 ?auto_863031 ) ( CLEAR ?auto_863028 ) ( ON ?auto_863029 ?auto_863030 ) ( CLEAR ?auto_863029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_863027 ?auto_863028 ?auto_863029 )
      ( MAKE-5PILE ?auto_863027 ?auto_863028 ?auto_863029 ?auto_863030 ?auto_863031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_863049 - BLOCK
      ?auto_863050 - BLOCK
      ?auto_863051 - BLOCK
      ?auto_863052 - BLOCK
      ?auto_863053 - BLOCK
    )
    :vars
    (
      ?auto_863054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863053 ?auto_863054 ) ( ON-TABLE ?auto_863049 ) ( not ( = ?auto_863049 ?auto_863050 ) ) ( not ( = ?auto_863049 ?auto_863051 ) ) ( not ( = ?auto_863049 ?auto_863052 ) ) ( not ( = ?auto_863049 ?auto_863053 ) ) ( not ( = ?auto_863049 ?auto_863054 ) ) ( not ( = ?auto_863050 ?auto_863051 ) ) ( not ( = ?auto_863050 ?auto_863052 ) ) ( not ( = ?auto_863050 ?auto_863053 ) ) ( not ( = ?auto_863050 ?auto_863054 ) ) ( not ( = ?auto_863051 ?auto_863052 ) ) ( not ( = ?auto_863051 ?auto_863053 ) ) ( not ( = ?auto_863051 ?auto_863054 ) ) ( not ( = ?auto_863052 ?auto_863053 ) ) ( not ( = ?auto_863052 ?auto_863054 ) ) ( not ( = ?auto_863053 ?auto_863054 ) ) ( ON ?auto_863052 ?auto_863053 ) ( ON ?auto_863051 ?auto_863052 ) ( CLEAR ?auto_863049 ) ( ON ?auto_863050 ?auto_863051 ) ( CLEAR ?auto_863050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_863049 ?auto_863050 )
      ( MAKE-5PILE ?auto_863049 ?auto_863050 ?auto_863051 ?auto_863052 ?auto_863053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_863071 - BLOCK
      ?auto_863072 - BLOCK
      ?auto_863073 - BLOCK
      ?auto_863074 - BLOCK
      ?auto_863075 - BLOCK
    )
    :vars
    (
      ?auto_863076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863075 ?auto_863076 ) ( not ( = ?auto_863071 ?auto_863072 ) ) ( not ( = ?auto_863071 ?auto_863073 ) ) ( not ( = ?auto_863071 ?auto_863074 ) ) ( not ( = ?auto_863071 ?auto_863075 ) ) ( not ( = ?auto_863071 ?auto_863076 ) ) ( not ( = ?auto_863072 ?auto_863073 ) ) ( not ( = ?auto_863072 ?auto_863074 ) ) ( not ( = ?auto_863072 ?auto_863075 ) ) ( not ( = ?auto_863072 ?auto_863076 ) ) ( not ( = ?auto_863073 ?auto_863074 ) ) ( not ( = ?auto_863073 ?auto_863075 ) ) ( not ( = ?auto_863073 ?auto_863076 ) ) ( not ( = ?auto_863074 ?auto_863075 ) ) ( not ( = ?auto_863074 ?auto_863076 ) ) ( not ( = ?auto_863075 ?auto_863076 ) ) ( ON ?auto_863074 ?auto_863075 ) ( ON ?auto_863073 ?auto_863074 ) ( ON ?auto_863072 ?auto_863073 ) ( ON ?auto_863071 ?auto_863072 ) ( CLEAR ?auto_863071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_863071 )
      ( MAKE-5PILE ?auto_863071 ?auto_863072 ?auto_863073 ?auto_863074 ?auto_863075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863094 - BLOCK
      ?auto_863095 - BLOCK
      ?auto_863096 - BLOCK
      ?auto_863097 - BLOCK
      ?auto_863098 - BLOCK
      ?auto_863099 - BLOCK
    )
    :vars
    (
      ?auto_863100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_863098 ) ( ON ?auto_863099 ?auto_863100 ) ( CLEAR ?auto_863099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_863094 ) ( ON ?auto_863095 ?auto_863094 ) ( ON ?auto_863096 ?auto_863095 ) ( ON ?auto_863097 ?auto_863096 ) ( ON ?auto_863098 ?auto_863097 ) ( not ( = ?auto_863094 ?auto_863095 ) ) ( not ( = ?auto_863094 ?auto_863096 ) ) ( not ( = ?auto_863094 ?auto_863097 ) ) ( not ( = ?auto_863094 ?auto_863098 ) ) ( not ( = ?auto_863094 ?auto_863099 ) ) ( not ( = ?auto_863094 ?auto_863100 ) ) ( not ( = ?auto_863095 ?auto_863096 ) ) ( not ( = ?auto_863095 ?auto_863097 ) ) ( not ( = ?auto_863095 ?auto_863098 ) ) ( not ( = ?auto_863095 ?auto_863099 ) ) ( not ( = ?auto_863095 ?auto_863100 ) ) ( not ( = ?auto_863096 ?auto_863097 ) ) ( not ( = ?auto_863096 ?auto_863098 ) ) ( not ( = ?auto_863096 ?auto_863099 ) ) ( not ( = ?auto_863096 ?auto_863100 ) ) ( not ( = ?auto_863097 ?auto_863098 ) ) ( not ( = ?auto_863097 ?auto_863099 ) ) ( not ( = ?auto_863097 ?auto_863100 ) ) ( not ( = ?auto_863098 ?auto_863099 ) ) ( not ( = ?auto_863098 ?auto_863100 ) ) ( not ( = ?auto_863099 ?auto_863100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_863099 ?auto_863100 )
      ( !STACK ?auto_863099 ?auto_863098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863120 - BLOCK
      ?auto_863121 - BLOCK
      ?auto_863122 - BLOCK
      ?auto_863123 - BLOCK
      ?auto_863124 - BLOCK
      ?auto_863125 - BLOCK
    )
    :vars
    (
      ?auto_863126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863125 ?auto_863126 ) ( ON-TABLE ?auto_863120 ) ( ON ?auto_863121 ?auto_863120 ) ( ON ?auto_863122 ?auto_863121 ) ( ON ?auto_863123 ?auto_863122 ) ( not ( = ?auto_863120 ?auto_863121 ) ) ( not ( = ?auto_863120 ?auto_863122 ) ) ( not ( = ?auto_863120 ?auto_863123 ) ) ( not ( = ?auto_863120 ?auto_863124 ) ) ( not ( = ?auto_863120 ?auto_863125 ) ) ( not ( = ?auto_863120 ?auto_863126 ) ) ( not ( = ?auto_863121 ?auto_863122 ) ) ( not ( = ?auto_863121 ?auto_863123 ) ) ( not ( = ?auto_863121 ?auto_863124 ) ) ( not ( = ?auto_863121 ?auto_863125 ) ) ( not ( = ?auto_863121 ?auto_863126 ) ) ( not ( = ?auto_863122 ?auto_863123 ) ) ( not ( = ?auto_863122 ?auto_863124 ) ) ( not ( = ?auto_863122 ?auto_863125 ) ) ( not ( = ?auto_863122 ?auto_863126 ) ) ( not ( = ?auto_863123 ?auto_863124 ) ) ( not ( = ?auto_863123 ?auto_863125 ) ) ( not ( = ?auto_863123 ?auto_863126 ) ) ( not ( = ?auto_863124 ?auto_863125 ) ) ( not ( = ?auto_863124 ?auto_863126 ) ) ( not ( = ?auto_863125 ?auto_863126 ) ) ( CLEAR ?auto_863123 ) ( ON ?auto_863124 ?auto_863125 ) ( CLEAR ?auto_863124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_863120 ?auto_863121 ?auto_863122 ?auto_863123 ?auto_863124 )
      ( MAKE-6PILE ?auto_863120 ?auto_863121 ?auto_863122 ?auto_863123 ?auto_863124 ?auto_863125 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863146 - BLOCK
      ?auto_863147 - BLOCK
      ?auto_863148 - BLOCK
      ?auto_863149 - BLOCK
      ?auto_863150 - BLOCK
      ?auto_863151 - BLOCK
    )
    :vars
    (
      ?auto_863152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863151 ?auto_863152 ) ( ON-TABLE ?auto_863146 ) ( ON ?auto_863147 ?auto_863146 ) ( ON ?auto_863148 ?auto_863147 ) ( not ( = ?auto_863146 ?auto_863147 ) ) ( not ( = ?auto_863146 ?auto_863148 ) ) ( not ( = ?auto_863146 ?auto_863149 ) ) ( not ( = ?auto_863146 ?auto_863150 ) ) ( not ( = ?auto_863146 ?auto_863151 ) ) ( not ( = ?auto_863146 ?auto_863152 ) ) ( not ( = ?auto_863147 ?auto_863148 ) ) ( not ( = ?auto_863147 ?auto_863149 ) ) ( not ( = ?auto_863147 ?auto_863150 ) ) ( not ( = ?auto_863147 ?auto_863151 ) ) ( not ( = ?auto_863147 ?auto_863152 ) ) ( not ( = ?auto_863148 ?auto_863149 ) ) ( not ( = ?auto_863148 ?auto_863150 ) ) ( not ( = ?auto_863148 ?auto_863151 ) ) ( not ( = ?auto_863148 ?auto_863152 ) ) ( not ( = ?auto_863149 ?auto_863150 ) ) ( not ( = ?auto_863149 ?auto_863151 ) ) ( not ( = ?auto_863149 ?auto_863152 ) ) ( not ( = ?auto_863150 ?auto_863151 ) ) ( not ( = ?auto_863150 ?auto_863152 ) ) ( not ( = ?auto_863151 ?auto_863152 ) ) ( ON ?auto_863150 ?auto_863151 ) ( CLEAR ?auto_863148 ) ( ON ?auto_863149 ?auto_863150 ) ( CLEAR ?auto_863149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_863146 ?auto_863147 ?auto_863148 ?auto_863149 )
      ( MAKE-6PILE ?auto_863146 ?auto_863147 ?auto_863148 ?auto_863149 ?auto_863150 ?auto_863151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863172 - BLOCK
      ?auto_863173 - BLOCK
      ?auto_863174 - BLOCK
      ?auto_863175 - BLOCK
      ?auto_863176 - BLOCK
      ?auto_863177 - BLOCK
    )
    :vars
    (
      ?auto_863178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863177 ?auto_863178 ) ( ON-TABLE ?auto_863172 ) ( ON ?auto_863173 ?auto_863172 ) ( not ( = ?auto_863172 ?auto_863173 ) ) ( not ( = ?auto_863172 ?auto_863174 ) ) ( not ( = ?auto_863172 ?auto_863175 ) ) ( not ( = ?auto_863172 ?auto_863176 ) ) ( not ( = ?auto_863172 ?auto_863177 ) ) ( not ( = ?auto_863172 ?auto_863178 ) ) ( not ( = ?auto_863173 ?auto_863174 ) ) ( not ( = ?auto_863173 ?auto_863175 ) ) ( not ( = ?auto_863173 ?auto_863176 ) ) ( not ( = ?auto_863173 ?auto_863177 ) ) ( not ( = ?auto_863173 ?auto_863178 ) ) ( not ( = ?auto_863174 ?auto_863175 ) ) ( not ( = ?auto_863174 ?auto_863176 ) ) ( not ( = ?auto_863174 ?auto_863177 ) ) ( not ( = ?auto_863174 ?auto_863178 ) ) ( not ( = ?auto_863175 ?auto_863176 ) ) ( not ( = ?auto_863175 ?auto_863177 ) ) ( not ( = ?auto_863175 ?auto_863178 ) ) ( not ( = ?auto_863176 ?auto_863177 ) ) ( not ( = ?auto_863176 ?auto_863178 ) ) ( not ( = ?auto_863177 ?auto_863178 ) ) ( ON ?auto_863176 ?auto_863177 ) ( ON ?auto_863175 ?auto_863176 ) ( CLEAR ?auto_863173 ) ( ON ?auto_863174 ?auto_863175 ) ( CLEAR ?auto_863174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_863172 ?auto_863173 ?auto_863174 )
      ( MAKE-6PILE ?auto_863172 ?auto_863173 ?auto_863174 ?auto_863175 ?auto_863176 ?auto_863177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863198 - BLOCK
      ?auto_863199 - BLOCK
      ?auto_863200 - BLOCK
      ?auto_863201 - BLOCK
      ?auto_863202 - BLOCK
      ?auto_863203 - BLOCK
    )
    :vars
    (
      ?auto_863204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863203 ?auto_863204 ) ( ON-TABLE ?auto_863198 ) ( not ( = ?auto_863198 ?auto_863199 ) ) ( not ( = ?auto_863198 ?auto_863200 ) ) ( not ( = ?auto_863198 ?auto_863201 ) ) ( not ( = ?auto_863198 ?auto_863202 ) ) ( not ( = ?auto_863198 ?auto_863203 ) ) ( not ( = ?auto_863198 ?auto_863204 ) ) ( not ( = ?auto_863199 ?auto_863200 ) ) ( not ( = ?auto_863199 ?auto_863201 ) ) ( not ( = ?auto_863199 ?auto_863202 ) ) ( not ( = ?auto_863199 ?auto_863203 ) ) ( not ( = ?auto_863199 ?auto_863204 ) ) ( not ( = ?auto_863200 ?auto_863201 ) ) ( not ( = ?auto_863200 ?auto_863202 ) ) ( not ( = ?auto_863200 ?auto_863203 ) ) ( not ( = ?auto_863200 ?auto_863204 ) ) ( not ( = ?auto_863201 ?auto_863202 ) ) ( not ( = ?auto_863201 ?auto_863203 ) ) ( not ( = ?auto_863201 ?auto_863204 ) ) ( not ( = ?auto_863202 ?auto_863203 ) ) ( not ( = ?auto_863202 ?auto_863204 ) ) ( not ( = ?auto_863203 ?auto_863204 ) ) ( ON ?auto_863202 ?auto_863203 ) ( ON ?auto_863201 ?auto_863202 ) ( ON ?auto_863200 ?auto_863201 ) ( CLEAR ?auto_863198 ) ( ON ?auto_863199 ?auto_863200 ) ( CLEAR ?auto_863199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_863198 ?auto_863199 )
      ( MAKE-6PILE ?auto_863198 ?auto_863199 ?auto_863200 ?auto_863201 ?auto_863202 ?auto_863203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_863224 - BLOCK
      ?auto_863225 - BLOCK
      ?auto_863226 - BLOCK
      ?auto_863227 - BLOCK
      ?auto_863228 - BLOCK
      ?auto_863229 - BLOCK
    )
    :vars
    (
      ?auto_863230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863229 ?auto_863230 ) ( not ( = ?auto_863224 ?auto_863225 ) ) ( not ( = ?auto_863224 ?auto_863226 ) ) ( not ( = ?auto_863224 ?auto_863227 ) ) ( not ( = ?auto_863224 ?auto_863228 ) ) ( not ( = ?auto_863224 ?auto_863229 ) ) ( not ( = ?auto_863224 ?auto_863230 ) ) ( not ( = ?auto_863225 ?auto_863226 ) ) ( not ( = ?auto_863225 ?auto_863227 ) ) ( not ( = ?auto_863225 ?auto_863228 ) ) ( not ( = ?auto_863225 ?auto_863229 ) ) ( not ( = ?auto_863225 ?auto_863230 ) ) ( not ( = ?auto_863226 ?auto_863227 ) ) ( not ( = ?auto_863226 ?auto_863228 ) ) ( not ( = ?auto_863226 ?auto_863229 ) ) ( not ( = ?auto_863226 ?auto_863230 ) ) ( not ( = ?auto_863227 ?auto_863228 ) ) ( not ( = ?auto_863227 ?auto_863229 ) ) ( not ( = ?auto_863227 ?auto_863230 ) ) ( not ( = ?auto_863228 ?auto_863229 ) ) ( not ( = ?auto_863228 ?auto_863230 ) ) ( not ( = ?auto_863229 ?auto_863230 ) ) ( ON ?auto_863228 ?auto_863229 ) ( ON ?auto_863227 ?auto_863228 ) ( ON ?auto_863226 ?auto_863227 ) ( ON ?auto_863225 ?auto_863226 ) ( ON ?auto_863224 ?auto_863225 ) ( CLEAR ?auto_863224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_863224 )
      ( MAKE-6PILE ?auto_863224 ?auto_863225 ?auto_863226 ?auto_863227 ?auto_863228 ?auto_863229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863251 - BLOCK
      ?auto_863252 - BLOCK
      ?auto_863253 - BLOCK
      ?auto_863254 - BLOCK
      ?auto_863255 - BLOCK
      ?auto_863256 - BLOCK
      ?auto_863257 - BLOCK
    )
    :vars
    (
      ?auto_863258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_863256 ) ( ON ?auto_863257 ?auto_863258 ) ( CLEAR ?auto_863257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_863251 ) ( ON ?auto_863252 ?auto_863251 ) ( ON ?auto_863253 ?auto_863252 ) ( ON ?auto_863254 ?auto_863253 ) ( ON ?auto_863255 ?auto_863254 ) ( ON ?auto_863256 ?auto_863255 ) ( not ( = ?auto_863251 ?auto_863252 ) ) ( not ( = ?auto_863251 ?auto_863253 ) ) ( not ( = ?auto_863251 ?auto_863254 ) ) ( not ( = ?auto_863251 ?auto_863255 ) ) ( not ( = ?auto_863251 ?auto_863256 ) ) ( not ( = ?auto_863251 ?auto_863257 ) ) ( not ( = ?auto_863251 ?auto_863258 ) ) ( not ( = ?auto_863252 ?auto_863253 ) ) ( not ( = ?auto_863252 ?auto_863254 ) ) ( not ( = ?auto_863252 ?auto_863255 ) ) ( not ( = ?auto_863252 ?auto_863256 ) ) ( not ( = ?auto_863252 ?auto_863257 ) ) ( not ( = ?auto_863252 ?auto_863258 ) ) ( not ( = ?auto_863253 ?auto_863254 ) ) ( not ( = ?auto_863253 ?auto_863255 ) ) ( not ( = ?auto_863253 ?auto_863256 ) ) ( not ( = ?auto_863253 ?auto_863257 ) ) ( not ( = ?auto_863253 ?auto_863258 ) ) ( not ( = ?auto_863254 ?auto_863255 ) ) ( not ( = ?auto_863254 ?auto_863256 ) ) ( not ( = ?auto_863254 ?auto_863257 ) ) ( not ( = ?auto_863254 ?auto_863258 ) ) ( not ( = ?auto_863255 ?auto_863256 ) ) ( not ( = ?auto_863255 ?auto_863257 ) ) ( not ( = ?auto_863255 ?auto_863258 ) ) ( not ( = ?auto_863256 ?auto_863257 ) ) ( not ( = ?auto_863256 ?auto_863258 ) ) ( not ( = ?auto_863257 ?auto_863258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_863257 ?auto_863258 )
      ( !STACK ?auto_863257 ?auto_863256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863281 - BLOCK
      ?auto_863282 - BLOCK
      ?auto_863283 - BLOCK
      ?auto_863284 - BLOCK
      ?auto_863285 - BLOCK
      ?auto_863286 - BLOCK
      ?auto_863287 - BLOCK
    )
    :vars
    (
      ?auto_863288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863287 ?auto_863288 ) ( ON-TABLE ?auto_863281 ) ( ON ?auto_863282 ?auto_863281 ) ( ON ?auto_863283 ?auto_863282 ) ( ON ?auto_863284 ?auto_863283 ) ( ON ?auto_863285 ?auto_863284 ) ( not ( = ?auto_863281 ?auto_863282 ) ) ( not ( = ?auto_863281 ?auto_863283 ) ) ( not ( = ?auto_863281 ?auto_863284 ) ) ( not ( = ?auto_863281 ?auto_863285 ) ) ( not ( = ?auto_863281 ?auto_863286 ) ) ( not ( = ?auto_863281 ?auto_863287 ) ) ( not ( = ?auto_863281 ?auto_863288 ) ) ( not ( = ?auto_863282 ?auto_863283 ) ) ( not ( = ?auto_863282 ?auto_863284 ) ) ( not ( = ?auto_863282 ?auto_863285 ) ) ( not ( = ?auto_863282 ?auto_863286 ) ) ( not ( = ?auto_863282 ?auto_863287 ) ) ( not ( = ?auto_863282 ?auto_863288 ) ) ( not ( = ?auto_863283 ?auto_863284 ) ) ( not ( = ?auto_863283 ?auto_863285 ) ) ( not ( = ?auto_863283 ?auto_863286 ) ) ( not ( = ?auto_863283 ?auto_863287 ) ) ( not ( = ?auto_863283 ?auto_863288 ) ) ( not ( = ?auto_863284 ?auto_863285 ) ) ( not ( = ?auto_863284 ?auto_863286 ) ) ( not ( = ?auto_863284 ?auto_863287 ) ) ( not ( = ?auto_863284 ?auto_863288 ) ) ( not ( = ?auto_863285 ?auto_863286 ) ) ( not ( = ?auto_863285 ?auto_863287 ) ) ( not ( = ?auto_863285 ?auto_863288 ) ) ( not ( = ?auto_863286 ?auto_863287 ) ) ( not ( = ?auto_863286 ?auto_863288 ) ) ( not ( = ?auto_863287 ?auto_863288 ) ) ( CLEAR ?auto_863285 ) ( ON ?auto_863286 ?auto_863287 ) ( CLEAR ?auto_863286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_863281 ?auto_863282 ?auto_863283 ?auto_863284 ?auto_863285 ?auto_863286 )
      ( MAKE-7PILE ?auto_863281 ?auto_863282 ?auto_863283 ?auto_863284 ?auto_863285 ?auto_863286 ?auto_863287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863311 - BLOCK
      ?auto_863312 - BLOCK
      ?auto_863313 - BLOCK
      ?auto_863314 - BLOCK
      ?auto_863315 - BLOCK
      ?auto_863316 - BLOCK
      ?auto_863317 - BLOCK
    )
    :vars
    (
      ?auto_863318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863317 ?auto_863318 ) ( ON-TABLE ?auto_863311 ) ( ON ?auto_863312 ?auto_863311 ) ( ON ?auto_863313 ?auto_863312 ) ( ON ?auto_863314 ?auto_863313 ) ( not ( = ?auto_863311 ?auto_863312 ) ) ( not ( = ?auto_863311 ?auto_863313 ) ) ( not ( = ?auto_863311 ?auto_863314 ) ) ( not ( = ?auto_863311 ?auto_863315 ) ) ( not ( = ?auto_863311 ?auto_863316 ) ) ( not ( = ?auto_863311 ?auto_863317 ) ) ( not ( = ?auto_863311 ?auto_863318 ) ) ( not ( = ?auto_863312 ?auto_863313 ) ) ( not ( = ?auto_863312 ?auto_863314 ) ) ( not ( = ?auto_863312 ?auto_863315 ) ) ( not ( = ?auto_863312 ?auto_863316 ) ) ( not ( = ?auto_863312 ?auto_863317 ) ) ( not ( = ?auto_863312 ?auto_863318 ) ) ( not ( = ?auto_863313 ?auto_863314 ) ) ( not ( = ?auto_863313 ?auto_863315 ) ) ( not ( = ?auto_863313 ?auto_863316 ) ) ( not ( = ?auto_863313 ?auto_863317 ) ) ( not ( = ?auto_863313 ?auto_863318 ) ) ( not ( = ?auto_863314 ?auto_863315 ) ) ( not ( = ?auto_863314 ?auto_863316 ) ) ( not ( = ?auto_863314 ?auto_863317 ) ) ( not ( = ?auto_863314 ?auto_863318 ) ) ( not ( = ?auto_863315 ?auto_863316 ) ) ( not ( = ?auto_863315 ?auto_863317 ) ) ( not ( = ?auto_863315 ?auto_863318 ) ) ( not ( = ?auto_863316 ?auto_863317 ) ) ( not ( = ?auto_863316 ?auto_863318 ) ) ( not ( = ?auto_863317 ?auto_863318 ) ) ( ON ?auto_863316 ?auto_863317 ) ( CLEAR ?auto_863314 ) ( ON ?auto_863315 ?auto_863316 ) ( CLEAR ?auto_863315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_863311 ?auto_863312 ?auto_863313 ?auto_863314 ?auto_863315 )
      ( MAKE-7PILE ?auto_863311 ?auto_863312 ?auto_863313 ?auto_863314 ?auto_863315 ?auto_863316 ?auto_863317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863341 - BLOCK
      ?auto_863342 - BLOCK
      ?auto_863343 - BLOCK
      ?auto_863344 - BLOCK
      ?auto_863345 - BLOCK
      ?auto_863346 - BLOCK
      ?auto_863347 - BLOCK
    )
    :vars
    (
      ?auto_863348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863347 ?auto_863348 ) ( ON-TABLE ?auto_863341 ) ( ON ?auto_863342 ?auto_863341 ) ( ON ?auto_863343 ?auto_863342 ) ( not ( = ?auto_863341 ?auto_863342 ) ) ( not ( = ?auto_863341 ?auto_863343 ) ) ( not ( = ?auto_863341 ?auto_863344 ) ) ( not ( = ?auto_863341 ?auto_863345 ) ) ( not ( = ?auto_863341 ?auto_863346 ) ) ( not ( = ?auto_863341 ?auto_863347 ) ) ( not ( = ?auto_863341 ?auto_863348 ) ) ( not ( = ?auto_863342 ?auto_863343 ) ) ( not ( = ?auto_863342 ?auto_863344 ) ) ( not ( = ?auto_863342 ?auto_863345 ) ) ( not ( = ?auto_863342 ?auto_863346 ) ) ( not ( = ?auto_863342 ?auto_863347 ) ) ( not ( = ?auto_863342 ?auto_863348 ) ) ( not ( = ?auto_863343 ?auto_863344 ) ) ( not ( = ?auto_863343 ?auto_863345 ) ) ( not ( = ?auto_863343 ?auto_863346 ) ) ( not ( = ?auto_863343 ?auto_863347 ) ) ( not ( = ?auto_863343 ?auto_863348 ) ) ( not ( = ?auto_863344 ?auto_863345 ) ) ( not ( = ?auto_863344 ?auto_863346 ) ) ( not ( = ?auto_863344 ?auto_863347 ) ) ( not ( = ?auto_863344 ?auto_863348 ) ) ( not ( = ?auto_863345 ?auto_863346 ) ) ( not ( = ?auto_863345 ?auto_863347 ) ) ( not ( = ?auto_863345 ?auto_863348 ) ) ( not ( = ?auto_863346 ?auto_863347 ) ) ( not ( = ?auto_863346 ?auto_863348 ) ) ( not ( = ?auto_863347 ?auto_863348 ) ) ( ON ?auto_863346 ?auto_863347 ) ( ON ?auto_863345 ?auto_863346 ) ( CLEAR ?auto_863343 ) ( ON ?auto_863344 ?auto_863345 ) ( CLEAR ?auto_863344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_863341 ?auto_863342 ?auto_863343 ?auto_863344 )
      ( MAKE-7PILE ?auto_863341 ?auto_863342 ?auto_863343 ?auto_863344 ?auto_863345 ?auto_863346 ?auto_863347 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863371 - BLOCK
      ?auto_863372 - BLOCK
      ?auto_863373 - BLOCK
      ?auto_863374 - BLOCK
      ?auto_863375 - BLOCK
      ?auto_863376 - BLOCK
      ?auto_863377 - BLOCK
    )
    :vars
    (
      ?auto_863378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863377 ?auto_863378 ) ( ON-TABLE ?auto_863371 ) ( ON ?auto_863372 ?auto_863371 ) ( not ( = ?auto_863371 ?auto_863372 ) ) ( not ( = ?auto_863371 ?auto_863373 ) ) ( not ( = ?auto_863371 ?auto_863374 ) ) ( not ( = ?auto_863371 ?auto_863375 ) ) ( not ( = ?auto_863371 ?auto_863376 ) ) ( not ( = ?auto_863371 ?auto_863377 ) ) ( not ( = ?auto_863371 ?auto_863378 ) ) ( not ( = ?auto_863372 ?auto_863373 ) ) ( not ( = ?auto_863372 ?auto_863374 ) ) ( not ( = ?auto_863372 ?auto_863375 ) ) ( not ( = ?auto_863372 ?auto_863376 ) ) ( not ( = ?auto_863372 ?auto_863377 ) ) ( not ( = ?auto_863372 ?auto_863378 ) ) ( not ( = ?auto_863373 ?auto_863374 ) ) ( not ( = ?auto_863373 ?auto_863375 ) ) ( not ( = ?auto_863373 ?auto_863376 ) ) ( not ( = ?auto_863373 ?auto_863377 ) ) ( not ( = ?auto_863373 ?auto_863378 ) ) ( not ( = ?auto_863374 ?auto_863375 ) ) ( not ( = ?auto_863374 ?auto_863376 ) ) ( not ( = ?auto_863374 ?auto_863377 ) ) ( not ( = ?auto_863374 ?auto_863378 ) ) ( not ( = ?auto_863375 ?auto_863376 ) ) ( not ( = ?auto_863375 ?auto_863377 ) ) ( not ( = ?auto_863375 ?auto_863378 ) ) ( not ( = ?auto_863376 ?auto_863377 ) ) ( not ( = ?auto_863376 ?auto_863378 ) ) ( not ( = ?auto_863377 ?auto_863378 ) ) ( ON ?auto_863376 ?auto_863377 ) ( ON ?auto_863375 ?auto_863376 ) ( ON ?auto_863374 ?auto_863375 ) ( CLEAR ?auto_863372 ) ( ON ?auto_863373 ?auto_863374 ) ( CLEAR ?auto_863373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_863371 ?auto_863372 ?auto_863373 )
      ( MAKE-7PILE ?auto_863371 ?auto_863372 ?auto_863373 ?auto_863374 ?auto_863375 ?auto_863376 ?auto_863377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863401 - BLOCK
      ?auto_863402 - BLOCK
      ?auto_863403 - BLOCK
      ?auto_863404 - BLOCK
      ?auto_863405 - BLOCK
      ?auto_863406 - BLOCK
      ?auto_863407 - BLOCK
    )
    :vars
    (
      ?auto_863408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863407 ?auto_863408 ) ( ON-TABLE ?auto_863401 ) ( not ( = ?auto_863401 ?auto_863402 ) ) ( not ( = ?auto_863401 ?auto_863403 ) ) ( not ( = ?auto_863401 ?auto_863404 ) ) ( not ( = ?auto_863401 ?auto_863405 ) ) ( not ( = ?auto_863401 ?auto_863406 ) ) ( not ( = ?auto_863401 ?auto_863407 ) ) ( not ( = ?auto_863401 ?auto_863408 ) ) ( not ( = ?auto_863402 ?auto_863403 ) ) ( not ( = ?auto_863402 ?auto_863404 ) ) ( not ( = ?auto_863402 ?auto_863405 ) ) ( not ( = ?auto_863402 ?auto_863406 ) ) ( not ( = ?auto_863402 ?auto_863407 ) ) ( not ( = ?auto_863402 ?auto_863408 ) ) ( not ( = ?auto_863403 ?auto_863404 ) ) ( not ( = ?auto_863403 ?auto_863405 ) ) ( not ( = ?auto_863403 ?auto_863406 ) ) ( not ( = ?auto_863403 ?auto_863407 ) ) ( not ( = ?auto_863403 ?auto_863408 ) ) ( not ( = ?auto_863404 ?auto_863405 ) ) ( not ( = ?auto_863404 ?auto_863406 ) ) ( not ( = ?auto_863404 ?auto_863407 ) ) ( not ( = ?auto_863404 ?auto_863408 ) ) ( not ( = ?auto_863405 ?auto_863406 ) ) ( not ( = ?auto_863405 ?auto_863407 ) ) ( not ( = ?auto_863405 ?auto_863408 ) ) ( not ( = ?auto_863406 ?auto_863407 ) ) ( not ( = ?auto_863406 ?auto_863408 ) ) ( not ( = ?auto_863407 ?auto_863408 ) ) ( ON ?auto_863406 ?auto_863407 ) ( ON ?auto_863405 ?auto_863406 ) ( ON ?auto_863404 ?auto_863405 ) ( ON ?auto_863403 ?auto_863404 ) ( CLEAR ?auto_863401 ) ( ON ?auto_863402 ?auto_863403 ) ( CLEAR ?auto_863402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_863401 ?auto_863402 )
      ( MAKE-7PILE ?auto_863401 ?auto_863402 ?auto_863403 ?auto_863404 ?auto_863405 ?auto_863406 ?auto_863407 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_863431 - BLOCK
      ?auto_863432 - BLOCK
      ?auto_863433 - BLOCK
      ?auto_863434 - BLOCK
      ?auto_863435 - BLOCK
      ?auto_863436 - BLOCK
      ?auto_863437 - BLOCK
    )
    :vars
    (
      ?auto_863438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863437 ?auto_863438 ) ( not ( = ?auto_863431 ?auto_863432 ) ) ( not ( = ?auto_863431 ?auto_863433 ) ) ( not ( = ?auto_863431 ?auto_863434 ) ) ( not ( = ?auto_863431 ?auto_863435 ) ) ( not ( = ?auto_863431 ?auto_863436 ) ) ( not ( = ?auto_863431 ?auto_863437 ) ) ( not ( = ?auto_863431 ?auto_863438 ) ) ( not ( = ?auto_863432 ?auto_863433 ) ) ( not ( = ?auto_863432 ?auto_863434 ) ) ( not ( = ?auto_863432 ?auto_863435 ) ) ( not ( = ?auto_863432 ?auto_863436 ) ) ( not ( = ?auto_863432 ?auto_863437 ) ) ( not ( = ?auto_863432 ?auto_863438 ) ) ( not ( = ?auto_863433 ?auto_863434 ) ) ( not ( = ?auto_863433 ?auto_863435 ) ) ( not ( = ?auto_863433 ?auto_863436 ) ) ( not ( = ?auto_863433 ?auto_863437 ) ) ( not ( = ?auto_863433 ?auto_863438 ) ) ( not ( = ?auto_863434 ?auto_863435 ) ) ( not ( = ?auto_863434 ?auto_863436 ) ) ( not ( = ?auto_863434 ?auto_863437 ) ) ( not ( = ?auto_863434 ?auto_863438 ) ) ( not ( = ?auto_863435 ?auto_863436 ) ) ( not ( = ?auto_863435 ?auto_863437 ) ) ( not ( = ?auto_863435 ?auto_863438 ) ) ( not ( = ?auto_863436 ?auto_863437 ) ) ( not ( = ?auto_863436 ?auto_863438 ) ) ( not ( = ?auto_863437 ?auto_863438 ) ) ( ON ?auto_863436 ?auto_863437 ) ( ON ?auto_863435 ?auto_863436 ) ( ON ?auto_863434 ?auto_863435 ) ( ON ?auto_863433 ?auto_863434 ) ( ON ?auto_863432 ?auto_863433 ) ( ON ?auto_863431 ?auto_863432 ) ( CLEAR ?auto_863431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_863431 )
      ( MAKE-7PILE ?auto_863431 ?auto_863432 ?auto_863433 ?auto_863434 ?auto_863435 ?auto_863436 ?auto_863437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863462 - BLOCK
      ?auto_863463 - BLOCK
      ?auto_863464 - BLOCK
      ?auto_863465 - BLOCK
      ?auto_863466 - BLOCK
      ?auto_863467 - BLOCK
      ?auto_863468 - BLOCK
      ?auto_863469 - BLOCK
    )
    :vars
    (
      ?auto_863470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_863468 ) ( ON ?auto_863469 ?auto_863470 ) ( CLEAR ?auto_863469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_863462 ) ( ON ?auto_863463 ?auto_863462 ) ( ON ?auto_863464 ?auto_863463 ) ( ON ?auto_863465 ?auto_863464 ) ( ON ?auto_863466 ?auto_863465 ) ( ON ?auto_863467 ?auto_863466 ) ( ON ?auto_863468 ?auto_863467 ) ( not ( = ?auto_863462 ?auto_863463 ) ) ( not ( = ?auto_863462 ?auto_863464 ) ) ( not ( = ?auto_863462 ?auto_863465 ) ) ( not ( = ?auto_863462 ?auto_863466 ) ) ( not ( = ?auto_863462 ?auto_863467 ) ) ( not ( = ?auto_863462 ?auto_863468 ) ) ( not ( = ?auto_863462 ?auto_863469 ) ) ( not ( = ?auto_863462 ?auto_863470 ) ) ( not ( = ?auto_863463 ?auto_863464 ) ) ( not ( = ?auto_863463 ?auto_863465 ) ) ( not ( = ?auto_863463 ?auto_863466 ) ) ( not ( = ?auto_863463 ?auto_863467 ) ) ( not ( = ?auto_863463 ?auto_863468 ) ) ( not ( = ?auto_863463 ?auto_863469 ) ) ( not ( = ?auto_863463 ?auto_863470 ) ) ( not ( = ?auto_863464 ?auto_863465 ) ) ( not ( = ?auto_863464 ?auto_863466 ) ) ( not ( = ?auto_863464 ?auto_863467 ) ) ( not ( = ?auto_863464 ?auto_863468 ) ) ( not ( = ?auto_863464 ?auto_863469 ) ) ( not ( = ?auto_863464 ?auto_863470 ) ) ( not ( = ?auto_863465 ?auto_863466 ) ) ( not ( = ?auto_863465 ?auto_863467 ) ) ( not ( = ?auto_863465 ?auto_863468 ) ) ( not ( = ?auto_863465 ?auto_863469 ) ) ( not ( = ?auto_863465 ?auto_863470 ) ) ( not ( = ?auto_863466 ?auto_863467 ) ) ( not ( = ?auto_863466 ?auto_863468 ) ) ( not ( = ?auto_863466 ?auto_863469 ) ) ( not ( = ?auto_863466 ?auto_863470 ) ) ( not ( = ?auto_863467 ?auto_863468 ) ) ( not ( = ?auto_863467 ?auto_863469 ) ) ( not ( = ?auto_863467 ?auto_863470 ) ) ( not ( = ?auto_863468 ?auto_863469 ) ) ( not ( = ?auto_863468 ?auto_863470 ) ) ( not ( = ?auto_863469 ?auto_863470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_863469 ?auto_863470 )
      ( !STACK ?auto_863469 ?auto_863468 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863496 - BLOCK
      ?auto_863497 - BLOCK
      ?auto_863498 - BLOCK
      ?auto_863499 - BLOCK
      ?auto_863500 - BLOCK
      ?auto_863501 - BLOCK
      ?auto_863502 - BLOCK
      ?auto_863503 - BLOCK
    )
    :vars
    (
      ?auto_863504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863503 ?auto_863504 ) ( ON-TABLE ?auto_863496 ) ( ON ?auto_863497 ?auto_863496 ) ( ON ?auto_863498 ?auto_863497 ) ( ON ?auto_863499 ?auto_863498 ) ( ON ?auto_863500 ?auto_863499 ) ( ON ?auto_863501 ?auto_863500 ) ( not ( = ?auto_863496 ?auto_863497 ) ) ( not ( = ?auto_863496 ?auto_863498 ) ) ( not ( = ?auto_863496 ?auto_863499 ) ) ( not ( = ?auto_863496 ?auto_863500 ) ) ( not ( = ?auto_863496 ?auto_863501 ) ) ( not ( = ?auto_863496 ?auto_863502 ) ) ( not ( = ?auto_863496 ?auto_863503 ) ) ( not ( = ?auto_863496 ?auto_863504 ) ) ( not ( = ?auto_863497 ?auto_863498 ) ) ( not ( = ?auto_863497 ?auto_863499 ) ) ( not ( = ?auto_863497 ?auto_863500 ) ) ( not ( = ?auto_863497 ?auto_863501 ) ) ( not ( = ?auto_863497 ?auto_863502 ) ) ( not ( = ?auto_863497 ?auto_863503 ) ) ( not ( = ?auto_863497 ?auto_863504 ) ) ( not ( = ?auto_863498 ?auto_863499 ) ) ( not ( = ?auto_863498 ?auto_863500 ) ) ( not ( = ?auto_863498 ?auto_863501 ) ) ( not ( = ?auto_863498 ?auto_863502 ) ) ( not ( = ?auto_863498 ?auto_863503 ) ) ( not ( = ?auto_863498 ?auto_863504 ) ) ( not ( = ?auto_863499 ?auto_863500 ) ) ( not ( = ?auto_863499 ?auto_863501 ) ) ( not ( = ?auto_863499 ?auto_863502 ) ) ( not ( = ?auto_863499 ?auto_863503 ) ) ( not ( = ?auto_863499 ?auto_863504 ) ) ( not ( = ?auto_863500 ?auto_863501 ) ) ( not ( = ?auto_863500 ?auto_863502 ) ) ( not ( = ?auto_863500 ?auto_863503 ) ) ( not ( = ?auto_863500 ?auto_863504 ) ) ( not ( = ?auto_863501 ?auto_863502 ) ) ( not ( = ?auto_863501 ?auto_863503 ) ) ( not ( = ?auto_863501 ?auto_863504 ) ) ( not ( = ?auto_863502 ?auto_863503 ) ) ( not ( = ?auto_863502 ?auto_863504 ) ) ( not ( = ?auto_863503 ?auto_863504 ) ) ( CLEAR ?auto_863501 ) ( ON ?auto_863502 ?auto_863503 ) ( CLEAR ?auto_863502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_863496 ?auto_863497 ?auto_863498 ?auto_863499 ?auto_863500 ?auto_863501 ?auto_863502 )
      ( MAKE-8PILE ?auto_863496 ?auto_863497 ?auto_863498 ?auto_863499 ?auto_863500 ?auto_863501 ?auto_863502 ?auto_863503 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863530 - BLOCK
      ?auto_863531 - BLOCK
      ?auto_863532 - BLOCK
      ?auto_863533 - BLOCK
      ?auto_863534 - BLOCK
      ?auto_863535 - BLOCK
      ?auto_863536 - BLOCK
      ?auto_863537 - BLOCK
    )
    :vars
    (
      ?auto_863538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863537 ?auto_863538 ) ( ON-TABLE ?auto_863530 ) ( ON ?auto_863531 ?auto_863530 ) ( ON ?auto_863532 ?auto_863531 ) ( ON ?auto_863533 ?auto_863532 ) ( ON ?auto_863534 ?auto_863533 ) ( not ( = ?auto_863530 ?auto_863531 ) ) ( not ( = ?auto_863530 ?auto_863532 ) ) ( not ( = ?auto_863530 ?auto_863533 ) ) ( not ( = ?auto_863530 ?auto_863534 ) ) ( not ( = ?auto_863530 ?auto_863535 ) ) ( not ( = ?auto_863530 ?auto_863536 ) ) ( not ( = ?auto_863530 ?auto_863537 ) ) ( not ( = ?auto_863530 ?auto_863538 ) ) ( not ( = ?auto_863531 ?auto_863532 ) ) ( not ( = ?auto_863531 ?auto_863533 ) ) ( not ( = ?auto_863531 ?auto_863534 ) ) ( not ( = ?auto_863531 ?auto_863535 ) ) ( not ( = ?auto_863531 ?auto_863536 ) ) ( not ( = ?auto_863531 ?auto_863537 ) ) ( not ( = ?auto_863531 ?auto_863538 ) ) ( not ( = ?auto_863532 ?auto_863533 ) ) ( not ( = ?auto_863532 ?auto_863534 ) ) ( not ( = ?auto_863532 ?auto_863535 ) ) ( not ( = ?auto_863532 ?auto_863536 ) ) ( not ( = ?auto_863532 ?auto_863537 ) ) ( not ( = ?auto_863532 ?auto_863538 ) ) ( not ( = ?auto_863533 ?auto_863534 ) ) ( not ( = ?auto_863533 ?auto_863535 ) ) ( not ( = ?auto_863533 ?auto_863536 ) ) ( not ( = ?auto_863533 ?auto_863537 ) ) ( not ( = ?auto_863533 ?auto_863538 ) ) ( not ( = ?auto_863534 ?auto_863535 ) ) ( not ( = ?auto_863534 ?auto_863536 ) ) ( not ( = ?auto_863534 ?auto_863537 ) ) ( not ( = ?auto_863534 ?auto_863538 ) ) ( not ( = ?auto_863535 ?auto_863536 ) ) ( not ( = ?auto_863535 ?auto_863537 ) ) ( not ( = ?auto_863535 ?auto_863538 ) ) ( not ( = ?auto_863536 ?auto_863537 ) ) ( not ( = ?auto_863536 ?auto_863538 ) ) ( not ( = ?auto_863537 ?auto_863538 ) ) ( ON ?auto_863536 ?auto_863537 ) ( CLEAR ?auto_863534 ) ( ON ?auto_863535 ?auto_863536 ) ( CLEAR ?auto_863535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_863530 ?auto_863531 ?auto_863532 ?auto_863533 ?auto_863534 ?auto_863535 )
      ( MAKE-8PILE ?auto_863530 ?auto_863531 ?auto_863532 ?auto_863533 ?auto_863534 ?auto_863535 ?auto_863536 ?auto_863537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863564 - BLOCK
      ?auto_863565 - BLOCK
      ?auto_863566 - BLOCK
      ?auto_863567 - BLOCK
      ?auto_863568 - BLOCK
      ?auto_863569 - BLOCK
      ?auto_863570 - BLOCK
      ?auto_863571 - BLOCK
    )
    :vars
    (
      ?auto_863572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863571 ?auto_863572 ) ( ON-TABLE ?auto_863564 ) ( ON ?auto_863565 ?auto_863564 ) ( ON ?auto_863566 ?auto_863565 ) ( ON ?auto_863567 ?auto_863566 ) ( not ( = ?auto_863564 ?auto_863565 ) ) ( not ( = ?auto_863564 ?auto_863566 ) ) ( not ( = ?auto_863564 ?auto_863567 ) ) ( not ( = ?auto_863564 ?auto_863568 ) ) ( not ( = ?auto_863564 ?auto_863569 ) ) ( not ( = ?auto_863564 ?auto_863570 ) ) ( not ( = ?auto_863564 ?auto_863571 ) ) ( not ( = ?auto_863564 ?auto_863572 ) ) ( not ( = ?auto_863565 ?auto_863566 ) ) ( not ( = ?auto_863565 ?auto_863567 ) ) ( not ( = ?auto_863565 ?auto_863568 ) ) ( not ( = ?auto_863565 ?auto_863569 ) ) ( not ( = ?auto_863565 ?auto_863570 ) ) ( not ( = ?auto_863565 ?auto_863571 ) ) ( not ( = ?auto_863565 ?auto_863572 ) ) ( not ( = ?auto_863566 ?auto_863567 ) ) ( not ( = ?auto_863566 ?auto_863568 ) ) ( not ( = ?auto_863566 ?auto_863569 ) ) ( not ( = ?auto_863566 ?auto_863570 ) ) ( not ( = ?auto_863566 ?auto_863571 ) ) ( not ( = ?auto_863566 ?auto_863572 ) ) ( not ( = ?auto_863567 ?auto_863568 ) ) ( not ( = ?auto_863567 ?auto_863569 ) ) ( not ( = ?auto_863567 ?auto_863570 ) ) ( not ( = ?auto_863567 ?auto_863571 ) ) ( not ( = ?auto_863567 ?auto_863572 ) ) ( not ( = ?auto_863568 ?auto_863569 ) ) ( not ( = ?auto_863568 ?auto_863570 ) ) ( not ( = ?auto_863568 ?auto_863571 ) ) ( not ( = ?auto_863568 ?auto_863572 ) ) ( not ( = ?auto_863569 ?auto_863570 ) ) ( not ( = ?auto_863569 ?auto_863571 ) ) ( not ( = ?auto_863569 ?auto_863572 ) ) ( not ( = ?auto_863570 ?auto_863571 ) ) ( not ( = ?auto_863570 ?auto_863572 ) ) ( not ( = ?auto_863571 ?auto_863572 ) ) ( ON ?auto_863570 ?auto_863571 ) ( ON ?auto_863569 ?auto_863570 ) ( CLEAR ?auto_863567 ) ( ON ?auto_863568 ?auto_863569 ) ( CLEAR ?auto_863568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_863564 ?auto_863565 ?auto_863566 ?auto_863567 ?auto_863568 )
      ( MAKE-8PILE ?auto_863564 ?auto_863565 ?auto_863566 ?auto_863567 ?auto_863568 ?auto_863569 ?auto_863570 ?auto_863571 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863598 - BLOCK
      ?auto_863599 - BLOCK
      ?auto_863600 - BLOCK
      ?auto_863601 - BLOCK
      ?auto_863602 - BLOCK
      ?auto_863603 - BLOCK
      ?auto_863604 - BLOCK
      ?auto_863605 - BLOCK
    )
    :vars
    (
      ?auto_863606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863605 ?auto_863606 ) ( ON-TABLE ?auto_863598 ) ( ON ?auto_863599 ?auto_863598 ) ( ON ?auto_863600 ?auto_863599 ) ( not ( = ?auto_863598 ?auto_863599 ) ) ( not ( = ?auto_863598 ?auto_863600 ) ) ( not ( = ?auto_863598 ?auto_863601 ) ) ( not ( = ?auto_863598 ?auto_863602 ) ) ( not ( = ?auto_863598 ?auto_863603 ) ) ( not ( = ?auto_863598 ?auto_863604 ) ) ( not ( = ?auto_863598 ?auto_863605 ) ) ( not ( = ?auto_863598 ?auto_863606 ) ) ( not ( = ?auto_863599 ?auto_863600 ) ) ( not ( = ?auto_863599 ?auto_863601 ) ) ( not ( = ?auto_863599 ?auto_863602 ) ) ( not ( = ?auto_863599 ?auto_863603 ) ) ( not ( = ?auto_863599 ?auto_863604 ) ) ( not ( = ?auto_863599 ?auto_863605 ) ) ( not ( = ?auto_863599 ?auto_863606 ) ) ( not ( = ?auto_863600 ?auto_863601 ) ) ( not ( = ?auto_863600 ?auto_863602 ) ) ( not ( = ?auto_863600 ?auto_863603 ) ) ( not ( = ?auto_863600 ?auto_863604 ) ) ( not ( = ?auto_863600 ?auto_863605 ) ) ( not ( = ?auto_863600 ?auto_863606 ) ) ( not ( = ?auto_863601 ?auto_863602 ) ) ( not ( = ?auto_863601 ?auto_863603 ) ) ( not ( = ?auto_863601 ?auto_863604 ) ) ( not ( = ?auto_863601 ?auto_863605 ) ) ( not ( = ?auto_863601 ?auto_863606 ) ) ( not ( = ?auto_863602 ?auto_863603 ) ) ( not ( = ?auto_863602 ?auto_863604 ) ) ( not ( = ?auto_863602 ?auto_863605 ) ) ( not ( = ?auto_863602 ?auto_863606 ) ) ( not ( = ?auto_863603 ?auto_863604 ) ) ( not ( = ?auto_863603 ?auto_863605 ) ) ( not ( = ?auto_863603 ?auto_863606 ) ) ( not ( = ?auto_863604 ?auto_863605 ) ) ( not ( = ?auto_863604 ?auto_863606 ) ) ( not ( = ?auto_863605 ?auto_863606 ) ) ( ON ?auto_863604 ?auto_863605 ) ( ON ?auto_863603 ?auto_863604 ) ( ON ?auto_863602 ?auto_863603 ) ( CLEAR ?auto_863600 ) ( ON ?auto_863601 ?auto_863602 ) ( CLEAR ?auto_863601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_863598 ?auto_863599 ?auto_863600 ?auto_863601 )
      ( MAKE-8PILE ?auto_863598 ?auto_863599 ?auto_863600 ?auto_863601 ?auto_863602 ?auto_863603 ?auto_863604 ?auto_863605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863632 - BLOCK
      ?auto_863633 - BLOCK
      ?auto_863634 - BLOCK
      ?auto_863635 - BLOCK
      ?auto_863636 - BLOCK
      ?auto_863637 - BLOCK
      ?auto_863638 - BLOCK
      ?auto_863639 - BLOCK
    )
    :vars
    (
      ?auto_863640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863639 ?auto_863640 ) ( ON-TABLE ?auto_863632 ) ( ON ?auto_863633 ?auto_863632 ) ( not ( = ?auto_863632 ?auto_863633 ) ) ( not ( = ?auto_863632 ?auto_863634 ) ) ( not ( = ?auto_863632 ?auto_863635 ) ) ( not ( = ?auto_863632 ?auto_863636 ) ) ( not ( = ?auto_863632 ?auto_863637 ) ) ( not ( = ?auto_863632 ?auto_863638 ) ) ( not ( = ?auto_863632 ?auto_863639 ) ) ( not ( = ?auto_863632 ?auto_863640 ) ) ( not ( = ?auto_863633 ?auto_863634 ) ) ( not ( = ?auto_863633 ?auto_863635 ) ) ( not ( = ?auto_863633 ?auto_863636 ) ) ( not ( = ?auto_863633 ?auto_863637 ) ) ( not ( = ?auto_863633 ?auto_863638 ) ) ( not ( = ?auto_863633 ?auto_863639 ) ) ( not ( = ?auto_863633 ?auto_863640 ) ) ( not ( = ?auto_863634 ?auto_863635 ) ) ( not ( = ?auto_863634 ?auto_863636 ) ) ( not ( = ?auto_863634 ?auto_863637 ) ) ( not ( = ?auto_863634 ?auto_863638 ) ) ( not ( = ?auto_863634 ?auto_863639 ) ) ( not ( = ?auto_863634 ?auto_863640 ) ) ( not ( = ?auto_863635 ?auto_863636 ) ) ( not ( = ?auto_863635 ?auto_863637 ) ) ( not ( = ?auto_863635 ?auto_863638 ) ) ( not ( = ?auto_863635 ?auto_863639 ) ) ( not ( = ?auto_863635 ?auto_863640 ) ) ( not ( = ?auto_863636 ?auto_863637 ) ) ( not ( = ?auto_863636 ?auto_863638 ) ) ( not ( = ?auto_863636 ?auto_863639 ) ) ( not ( = ?auto_863636 ?auto_863640 ) ) ( not ( = ?auto_863637 ?auto_863638 ) ) ( not ( = ?auto_863637 ?auto_863639 ) ) ( not ( = ?auto_863637 ?auto_863640 ) ) ( not ( = ?auto_863638 ?auto_863639 ) ) ( not ( = ?auto_863638 ?auto_863640 ) ) ( not ( = ?auto_863639 ?auto_863640 ) ) ( ON ?auto_863638 ?auto_863639 ) ( ON ?auto_863637 ?auto_863638 ) ( ON ?auto_863636 ?auto_863637 ) ( ON ?auto_863635 ?auto_863636 ) ( CLEAR ?auto_863633 ) ( ON ?auto_863634 ?auto_863635 ) ( CLEAR ?auto_863634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_863632 ?auto_863633 ?auto_863634 )
      ( MAKE-8PILE ?auto_863632 ?auto_863633 ?auto_863634 ?auto_863635 ?auto_863636 ?auto_863637 ?auto_863638 ?auto_863639 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863666 - BLOCK
      ?auto_863667 - BLOCK
      ?auto_863668 - BLOCK
      ?auto_863669 - BLOCK
      ?auto_863670 - BLOCK
      ?auto_863671 - BLOCK
      ?auto_863672 - BLOCK
      ?auto_863673 - BLOCK
    )
    :vars
    (
      ?auto_863674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863673 ?auto_863674 ) ( ON-TABLE ?auto_863666 ) ( not ( = ?auto_863666 ?auto_863667 ) ) ( not ( = ?auto_863666 ?auto_863668 ) ) ( not ( = ?auto_863666 ?auto_863669 ) ) ( not ( = ?auto_863666 ?auto_863670 ) ) ( not ( = ?auto_863666 ?auto_863671 ) ) ( not ( = ?auto_863666 ?auto_863672 ) ) ( not ( = ?auto_863666 ?auto_863673 ) ) ( not ( = ?auto_863666 ?auto_863674 ) ) ( not ( = ?auto_863667 ?auto_863668 ) ) ( not ( = ?auto_863667 ?auto_863669 ) ) ( not ( = ?auto_863667 ?auto_863670 ) ) ( not ( = ?auto_863667 ?auto_863671 ) ) ( not ( = ?auto_863667 ?auto_863672 ) ) ( not ( = ?auto_863667 ?auto_863673 ) ) ( not ( = ?auto_863667 ?auto_863674 ) ) ( not ( = ?auto_863668 ?auto_863669 ) ) ( not ( = ?auto_863668 ?auto_863670 ) ) ( not ( = ?auto_863668 ?auto_863671 ) ) ( not ( = ?auto_863668 ?auto_863672 ) ) ( not ( = ?auto_863668 ?auto_863673 ) ) ( not ( = ?auto_863668 ?auto_863674 ) ) ( not ( = ?auto_863669 ?auto_863670 ) ) ( not ( = ?auto_863669 ?auto_863671 ) ) ( not ( = ?auto_863669 ?auto_863672 ) ) ( not ( = ?auto_863669 ?auto_863673 ) ) ( not ( = ?auto_863669 ?auto_863674 ) ) ( not ( = ?auto_863670 ?auto_863671 ) ) ( not ( = ?auto_863670 ?auto_863672 ) ) ( not ( = ?auto_863670 ?auto_863673 ) ) ( not ( = ?auto_863670 ?auto_863674 ) ) ( not ( = ?auto_863671 ?auto_863672 ) ) ( not ( = ?auto_863671 ?auto_863673 ) ) ( not ( = ?auto_863671 ?auto_863674 ) ) ( not ( = ?auto_863672 ?auto_863673 ) ) ( not ( = ?auto_863672 ?auto_863674 ) ) ( not ( = ?auto_863673 ?auto_863674 ) ) ( ON ?auto_863672 ?auto_863673 ) ( ON ?auto_863671 ?auto_863672 ) ( ON ?auto_863670 ?auto_863671 ) ( ON ?auto_863669 ?auto_863670 ) ( ON ?auto_863668 ?auto_863669 ) ( CLEAR ?auto_863666 ) ( ON ?auto_863667 ?auto_863668 ) ( CLEAR ?auto_863667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_863666 ?auto_863667 )
      ( MAKE-8PILE ?auto_863666 ?auto_863667 ?auto_863668 ?auto_863669 ?auto_863670 ?auto_863671 ?auto_863672 ?auto_863673 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_863700 - BLOCK
      ?auto_863701 - BLOCK
      ?auto_863702 - BLOCK
      ?auto_863703 - BLOCK
      ?auto_863704 - BLOCK
      ?auto_863705 - BLOCK
      ?auto_863706 - BLOCK
      ?auto_863707 - BLOCK
    )
    :vars
    (
      ?auto_863708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863707 ?auto_863708 ) ( not ( = ?auto_863700 ?auto_863701 ) ) ( not ( = ?auto_863700 ?auto_863702 ) ) ( not ( = ?auto_863700 ?auto_863703 ) ) ( not ( = ?auto_863700 ?auto_863704 ) ) ( not ( = ?auto_863700 ?auto_863705 ) ) ( not ( = ?auto_863700 ?auto_863706 ) ) ( not ( = ?auto_863700 ?auto_863707 ) ) ( not ( = ?auto_863700 ?auto_863708 ) ) ( not ( = ?auto_863701 ?auto_863702 ) ) ( not ( = ?auto_863701 ?auto_863703 ) ) ( not ( = ?auto_863701 ?auto_863704 ) ) ( not ( = ?auto_863701 ?auto_863705 ) ) ( not ( = ?auto_863701 ?auto_863706 ) ) ( not ( = ?auto_863701 ?auto_863707 ) ) ( not ( = ?auto_863701 ?auto_863708 ) ) ( not ( = ?auto_863702 ?auto_863703 ) ) ( not ( = ?auto_863702 ?auto_863704 ) ) ( not ( = ?auto_863702 ?auto_863705 ) ) ( not ( = ?auto_863702 ?auto_863706 ) ) ( not ( = ?auto_863702 ?auto_863707 ) ) ( not ( = ?auto_863702 ?auto_863708 ) ) ( not ( = ?auto_863703 ?auto_863704 ) ) ( not ( = ?auto_863703 ?auto_863705 ) ) ( not ( = ?auto_863703 ?auto_863706 ) ) ( not ( = ?auto_863703 ?auto_863707 ) ) ( not ( = ?auto_863703 ?auto_863708 ) ) ( not ( = ?auto_863704 ?auto_863705 ) ) ( not ( = ?auto_863704 ?auto_863706 ) ) ( not ( = ?auto_863704 ?auto_863707 ) ) ( not ( = ?auto_863704 ?auto_863708 ) ) ( not ( = ?auto_863705 ?auto_863706 ) ) ( not ( = ?auto_863705 ?auto_863707 ) ) ( not ( = ?auto_863705 ?auto_863708 ) ) ( not ( = ?auto_863706 ?auto_863707 ) ) ( not ( = ?auto_863706 ?auto_863708 ) ) ( not ( = ?auto_863707 ?auto_863708 ) ) ( ON ?auto_863706 ?auto_863707 ) ( ON ?auto_863705 ?auto_863706 ) ( ON ?auto_863704 ?auto_863705 ) ( ON ?auto_863703 ?auto_863704 ) ( ON ?auto_863702 ?auto_863703 ) ( ON ?auto_863701 ?auto_863702 ) ( ON ?auto_863700 ?auto_863701 ) ( CLEAR ?auto_863700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_863700 )
      ( MAKE-8PILE ?auto_863700 ?auto_863701 ?auto_863702 ?auto_863703 ?auto_863704 ?auto_863705 ?auto_863706 ?auto_863707 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863735 - BLOCK
      ?auto_863736 - BLOCK
      ?auto_863737 - BLOCK
      ?auto_863738 - BLOCK
      ?auto_863739 - BLOCK
      ?auto_863740 - BLOCK
      ?auto_863741 - BLOCK
      ?auto_863742 - BLOCK
      ?auto_863743 - BLOCK
    )
    :vars
    (
      ?auto_863744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_863742 ) ( ON ?auto_863743 ?auto_863744 ) ( CLEAR ?auto_863743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_863735 ) ( ON ?auto_863736 ?auto_863735 ) ( ON ?auto_863737 ?auto_863736 ) ( ON ?auto_863738 ?auto_863737 ) ( ON ?auto_863739 ?auto_863738 ) ( ON ?auto_863740 ?auto_863739 ) ( ON ?auto_863741 ?auto_863740 ) ( ON ?auto_863742 ?auto_863741 ) ( not ( = ?auto_863735 ?auto_863736 ) ) ( not ( = ?auto_863735 ?auto_863737 ) ) ( not ( = ?auto_863735 ?auto_863738 ) ) ( not ( = ?auto_863735 ?auto_863739 ) ) ( not ( = ?auto_863735 ?auto_863740 ) ) ( not ( = ?auto_863735 ?auto_863741 ) ) ( not ( = ?auto_863735 ?auto_863742 ) ) ( not ( = ?auto_863735 ?auto_863743 ) ) ( not ( = ?auto_863735 ?auto_863744 ) ) ( not ( = ?auto_863736 ?auto_863737 ) ) ( not ( = ?auto_863736 ?auto_863738 ) ) ( not ( = ?auto_863736 ?auto_863739 ) ) ( not ( = ?auto_863736 ?auto_863740 ) ) ( not ( = ?auto_863736 ?auto_863741 ) ) ( not ( = ?auto_863736 ?auto_863742 ) ) ( not ( = ?auto_863736 ?auto_863743 ) ) ( not ( = ?auto_863736 ?auto_863744 ) ) ( not ( = ?auto_863737 ?auto_863738 ) ) ( not ( = ?auto_863737 ?auto_863739 ) ) ( not ( = ?auto_863737 ?auto_863740 ) ) ( not ( = ?auto_863737 ?auto_863741 ) ) ( not ( = ?auto_863737 ?auto_863742 ) ) ( not ( = ?auto_863737 ?auto_863743 ) ) ( not ( = ?auto_863737 ?auto_863744 ) ) ( not ( = ?auto_863738 ?auto_863739 ) ) ( not ( = ?auto_863738 ?auto_863740 ) ) ( not ( = ?auto_863738 ?auto_863741 ) ) ( not ( = ?auto_863738 ?auto_863742 ) ) ( not ( = ?auto_863738 ?auto_863743 ) ) ( not ( = ?auto_863738 ?auto_863744 ) ) ( not ( = ?auto_863739 ?auto_863740 ) ) ( not ( = ?auto_863739 ?auto_863741 ) ) ( not ( = ?auto_863739 ?auto_863742 ) ) ( not ( = ?auto_863739 ?auto_863743 ) ) ( not ( = ?auto_863739 ?auto_863744 ) ) ( not ( = ?auto_863740 ?auto_863741 ) ) ( not ( = ?auto_863740 ?auto_863742 ) ) ( not ( = ?auto_863740 ?auto_863743 ) ) ( not ( = ?auto_863740 ?auto_863744 ) ) ( not ( = ?auto_863741 ?auto_863742 ) ) ( not ( = ?auto_863741 ?auto_863743 ) ) ( not ( = ?auto_863741 ?auto_863744 ) ) ( not ( = ?auto_863742 ?auto_863743 ) ) ( not ( = ?auto_863742 ?auto_863744 ) ) ( not ( = ?auto_863743 ?auto_863744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_863743 ?auto_863744 )
      ( !STACK ?auto_863743 ?auto_863742 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863773 - BLOCK
      ?auto_863774 - BLOCK
      ?auto_863775 - BLOCK
      ?auto_863776 - BLOCK
      ?auto_863777 - BLOCK
      ?auto_863778 - BLOCK
      ?auto_863779 - BLOCK
      ?auto_863780 - BLOCK
      ?auto_863781 - BLOCK
    )
    :vars
    (
      ?auto_863782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863781 ?auto_863782 ) ( ON-TABLE ?auto_863773 ) ( ON ?auto_863774 ?auto_863773 ) ( ON ?auto_863775 ?auto_863774 ) ( ON ?auto_863776 ?auto_863775 ) ( ON ?auto_863777 ?auto_863776 ) ( ON ?auto_863778 ?auto_863777 ) ( ON ?auto_863779 ?auto_863778 ) ( not ( = ?auto_863773 ?auto_863774 ) ) ( not ( = ?auto_863773 ?auto_863775 ) ) ( not ( = ?auto_863773 ?auto_863776 ) ) ( not ( = ?auto_863773 ?auto_863777 ) ) ( not ( = ?auto_863773 ?auto_863778 ) ) ( not ( = ?auto_863773 ?auto_863779 ) ) ( not ( = ?auto_863773 ?auto_863780 ) ) ( not ( = ?auto_863773 ?auto_863781 ) ) ( not ( = ?auto_863773 ?auto_863782 ) ) ( not ( = ?auto_863774 ?auto_863775 ) ) ( not ( = ?auto_863774 ?auto_863776 ) ) ( not ( = ?auto_863774 ?auto_863777 ) ) ( not ( = ?auto_863774 ?auto_863778 ) ) ( not ( = ?auto_863774 ?auto_863779 ) ) ( not ( = ?auto_863774 ?auto_863780 ) ) ( not ( = ?auto_863774 ?auto_863781 ) ) ( not ( = ?auto_863774 ?auto_863782 ) ) ( not ( = ?auto_863775 ?auto_863776 ) ) ( not ( = ?auto_863775 ?auto_863777 ) ) ( not ( = ?auto_863775 ?auto_863778 ) ) ( not ( = ?auto_863775 ?auto_863779 ) ) ( not ( = ?auto_863775 ?auto_863780 ) ) ( not ( = ?auto_863775 ?auto_863781 ) ) ( not ( = ?auto_863775 ?auto_863782 ) ) ( not ( = ?auto_863776 ?auto_863777 ) ) ( not ( = ?auto_863776 ?auto_863778 ) ) ( not ( = ?auto_863776 ?auto_863779 ) ) ( not ( = ?auto_863776 ?auto_863780 ) ) ( not ( = ?auto_863776 ?auto_863781 ) ) ( not ( = ?auto_863776 ?auto_863782 ) ) ( not ( = ?auto_863777 ?auto_863778 ) ) ( not ( = ?auto_863777 ?auto_863779 ) ) ( not ( = ?auto_863777 ?auto_863780 ) ) ( not ( = ?auto_863777 ?auto_863781 ) ) ( not ( = ?auto_863777 ?auto_863782 ) ) ( not ( = ?auto_863778 ?auto_863779 ) ) ( not ( = ?auto_863778 ?auto_863780 ) ) ( not ( = ?auto_863778 ?auto_863781 ) ) ( not ( = ?auto_863778 ?auto_863782 ) ) ( not ( = ?auto_863779 ?auto_863780 ) ) ( not ( = ?auto_863779 ?auto_863781 ) ) ( not ( = ?auto_863779 ?auto_863782 ) ) ( not ( = ?auto_863780 ?auto_863781 ) ) ( not ( = ?auto_863780 ?auto_863782 ) ) ( not ( = ?auto_863781 ?auto_863782 ) ) ( CLEAR ?auto_863779 ) ( ON ?auto_863780 ?auto_863781 ) ( CLEAR ?auto_863780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_863773 ?auto_863774 ?auto_863775 ?auto_863776 ?auto_863777 ?auto_863778 ?auto_863779 ?auto_863780 )
      ( MAKE-9PILE ?auto_863773 ?auto_863774 ?auto_863775 ?auto_863776 ?auto_863777 ?auto_863778 ?auto_863779 ?auto_863780 ?auto_863781 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863811 - BLOCK
      ?auto_863812 - BLOCK
      ?auto_863813 - BLOCK
      ?auto_863814 - BLOCK
      ?auto_863815 - BLOCK
      ?auto_863816 - BLOCK
      ?auto_863817 - BLOCK
      ?auto_863818 - BLOCK
      ?auto_863819 - BLOCK
    )
    :vars
    (
      ?auto_863820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863819 ?auto_863820 ) ( ON-TABLE ?auto_863811 ) ( ON ?auto_863812 ?auto_863811 ) ( ON ?auto_863813 ?auto_863812 ) ( ON ?auto_863814 ?auto_863813 ) ( ON ?auto_863815 ?auto_863814 ) ( ON ?auto_863816 ?auto_863815 ) ( not ( = ?auto_863811 ?auto_863812 ) ) ( not ( = ?auto_863811 ?auto_863813 ) ) ( not ( = ?auto_863811 ?auto_863814 ) ) ( not ( = ?auto_863811 ?auto_863815 ) ) ( not ( = ?auto_863811 ?auto_863816 ) ) ( not ( = ?auto_863811 ?auto_863817 ) ) ( not ( = ?auto_863811 ?auto_863818 ) ) ( not ( = ?auto_863811 ?auto_863819 ) ) ( not ( = ?auto_863811 ?auto_863820 ) ) ( not ( = ?auto_863812 ?auto_863813 ) ) ( not ( = ?auto_863812 ?auto_863814 ) ) ( not ( = ?auto_863812 ?auto_863815 ) ) ( not ( = ?auto_863812 ?auto_863816 ) ) ( not ( = ?auto_863812 ?auto_863817 ) ) ( not ( = ?auto_863812 ?auto_863818 ) ) ( not ( = ?auto_863812 ?auto_863819 ) ) ( not ( = ?auto_863812 ?auto_863820 ) ) ( not ( = ?auto_863813 ?auto_863814 ) ) ( not ( = ?auto_863813 ?auto_863815 ) ) ( not ( = ?auto_863813 ?auto_863816 ) ) ( not ( = ?auto_863813 ?auto_863817 ) ) ( not ( = ?auto_863813 ?auto_863818 ) ) ( not ( = ?auto_863813 ?auto_863819 ) ) ( not ( = ?auto_863813 ?auto_863820 ) ) ( not ( = ?auto_863814 ?auto_863815 ) ) ( not ( = ?auto_863814 ?auto_863816 ) ) ( not ( = ?auto_863814 ?auto_863817 ) ) ( not ( = ?auto_863814 ?auto_863818 ) ) ( not ( = ?auto_863814 ?auto_863819 ) ) ( not ( = ?auto_863814 ?auto_863820 ) ) ( not ( = ?auto_863815 ?auto_863816 ) ) ( not ( = ?auto_863815 ?auto_863817 ) ) ( not ( = ?auto_863815 ?auto_863818 ) ) ( not ( = ?auto_863815 ?auto_863819 ) ) ( not ( = ?auto_863815 ?auto_863820 ) ) ( not ( = ?auto_863816 ?auto_863817 ) ) ( not ( = ?auto_863816 ?auto_863818 ) ) ( not ( = ?auto_863816 ?auto_863819 ) ) ( not ( = ?auto_863816 ?auto_863820 ) ) ( not ( = ?auto_863817 ?auto_863818 ) ) ( not ( = ?auto_863817 ?auto_863819 ) ) ( not ( = ?auto_863817 ?auto_863820 ) ) ( not ( = ?auto_863818 ?auto_863819 ) ) ( not ( = ?auto_863818 ?auto_863820 ) ) ( not ( = ?auto_863819 ?auto_863820 ) ) ( ON ?auto_863818 ?auto_863819 ) ( CLEAR ?auto_863816 ) ( ON ?auto_863817 ?auto_863818 ) ( CLEAR ?auto_863817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_863811 ?auto_863812 ?auto_863813 ?auto_863814 ?auto_863815 ?auto_863816 ?auto_863817 )
      ( MAKE-9PILE ?auto_863811 ?auto_863812 ?auto_863813 ?auto_863814 ?auto_863815 ?auto_863816 ?auto_863817 ?auto_863818 ?auto_863819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863849 - BLOCK
      ?auto_863850 - BLOCK
      ?auto_863851 - BLOCK
      ?auto_863852 - BLOCK
      ?auto_863853 - BLOCK
      ?auto_863854 - BLOCK
      ?auto_863855 - BLOCK
      ?auto_863856 - BLOCK
      ?auto_863857 - BLOCK
    )
    :vars
    (
      ?auto_863858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863857 ?auto_863858 ) ( ON-TABLE ?auto_863849 ) ( ON ?auto_863850 ?auto_863849 ) ( ON ?auto_863851 ?auto_863850 ) ( ON ?auto_863852 ?auto_863851 ) ( ON ?auto_863853 ?auto_863852 ) ( not ( = ?auto_863849 ?auto_863850 ) ) ( not ( = ?auto_863849 ?auto_863851 ) ) ( not ( = ?auto_863849 ?auto_863852 ) ) ( not ( = ?auto_863849 ?auto_863853 ) ) ( not ( = ?auto_863849 ?auto_863854 ) ) ( not ( = ?auto_863849 ?auto_863855 ) ) ( not ( = ?auto_863849 ?auto_863856 ) ) ( not ( = ?auto_863849 ?auto_863857 ) ) ( not ( = ?auto_863849 ?auto_863858 ) ) ( not ( = ?auto_863850 ?auto_863851 ) ) ( not ( = ?auto_863850 ?auto_863852 ) ) ( not ( = ?auto_863850 ?auto_863853 ) ) ( not ( = ?auto_863850 ?auto_863854 ) ) ( not ( = ?auto_863850 ?auto_863855 ) ) ( not ( = ?auto_863850 ?auto_863856 ) ) ( not ( = ?auto_863850 ?auto_863857 ) ) ( not ( = ?auto_863850 ?auto_863858 ) ) ( not ( = ?auto_863851 ?auto_863852 ) ) ( not ( = ?auto_863851 ?auto_863853 ) ) ( not ( = ?auto_863851 ?auto_863854 ) ) ( not ( = ?auto_863851 ?auto_863855 ) ) ( not ( = ?auto_863851 ?auto_863856 ) ) ( not ( = ?auto_863851 ?auto_863857 ) ) ( not ( = ?auto_863851 ?auto_863858 ) ) ( not ( = ?auto_863852 ?auto_863853 ) ) ( not ( = ?auto_863852 ?auto_863854 ) ) ( not ( = ?auto_863852 ?auto_863855 ) ) ( not ( = ?auto_863852 ?auto_863856 ) ) ( not ( = ?auto_863852 ?auto_863857 ) ) ( not ( = ?auto_863852 ?auto_863858 ) ) ( not ( = ?auto_863853 ?auto_863854 ) ) ( not ( = ?auto_863853 ?auto_863855 ) ) ( not ( = ?auto_863853 ?auto_863856 ) ) ( not ( = ?auto_863853 ?auto_863857 ) ) ( not ( = ?auto_863853 ?auto_863858 ) ) ( not ( = ?auto_863854 ?auto_863855 ) ) ( not ( = ?auto_863854 ?auto_863856 ) ) ( not ( = ?auto_863854 ?auto_863857 ) ) ( not ( = ?auto_863854 ?auto_863858 ) ) ( not ( = ?auto_863855 ?auto_863856 ) ) ( not ( = ?auto_863855 ?auto_863857 ) ) ( not ( = ?auto_863855 ?auto_863858 ) ) ( not ( = ?auto_863856 ?auto_863857 ) ) ( not ( = ?auto_863856 ?auto_863858 ) ) ( not ( = ?auto_863857 ?auto_863858 ) ) ( ON ?auto_863856 ?auto_863857 ) ( ON ?auto_863855 ?auto_863856 ) ( CLEAR ?auto_863853 ) ( ON ?auto_863854 ?auto_863855 ) ( CLEAR ?auto_863854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_863849 ?auto_863850 ?auto_863851 ?auto_863852 ?auto_863853 ?auto_863854 )
      ( MAKE-9PILE ?auto_863849 ?auto_863850 ?auto_863851 ?auto_863852 ?auto_863853 ?auto_863854 ?auto_863855 ?auto_863856 ?auto_863857 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863887 - BLOCK
      ?auto_863888 - BLOCK
      ?auto_863889 - BLOCK
      ?auto_863890 - BLOCK
      ?auto_863891 - BLOCK
      ?auto_863892 - BLOCK
      ?auto_863893 - BLOCK
      ?auto_863894 - BLOCK
      ?auto_863895 - BLOCK
    )
    :vars
    (
      ?auto_863896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863895 ?auto_863896 ) ( ON-TABLE ?auto_863887 ) ( ON ?auto_863888 ?auto_863887 ) ( ON ?auto_863889 ?auto_863888 ) ( ON ?auto_863890 ?auto_863889 ) ( not ( = ?auto_863887 ?auto_863888 ) ) ( not ( = ?auto_863887 ?auto_863889 ) ) ( not ( = ?auto_863887 ?auto_863890 ) ) ( not ( = ?auto_863887 ?auto_863891 ) ) ( not ( = ?auto_863887 ?auto_863892 ) ) ( not ( = ?auto_863887 ?auto_863893 ) ) ( not ( = ?auto_863887 ?auto_863894 ) ) ( not ( = ?auto_863887 ?auto_863895 ) ) ( not ( = ?auto_863887 ?auto_863896 ) ) ( not ( = ?auto_863888 ?auto_863889 ) ) ( not ( = ?auto_863888 ?auto_863890 ) ) ( not ( = ?auto_863888 ?auto_863891 ) ) ( not ( = ?auto_863888 ?auto_863892 ) ) ( not ( = ?auto_863888 ?auto_863893 ) ) ( not ( = ?auto_863888 ?auto_863894 ) ) ( not ( = ?auto_863888 ?auto_863895 ) ) ( not ( = ?auto_863888 ?auto_863896 ) ) ( not ( = ?auto_863889 ?auto_863890 ) ) ( not ( = ?auto_863889 ?auto_863891 ) ) ( not ( = ?auto_863889 ?auto_863892 ) ) ( not ( = ?auto_863889 ?auto_863893 ) ) ( not ( = ?auto_863889 ?auto_863894 ) ) ( not ( = ?auto_863889 ?auto_863895 ) ) ( not ( = ?auto_863889 ?auto_863896 ) ) ( not ( = ?auto_863890 ?auto_863891 ) ) ( not ( = ?auto_863890 ?auto_863892 ) ) ( not ( = ?auto_863890 ?auto_863893 ) ) ( not ( = ?auto_863890 ?auto_863894 ) ) ( not ( = ?auto_863890 ?auto_863895 ) ) ( not ( = ?auto_863890 ?auto_863896 ) ) ( not ( = ?auto_863891 ?auto_863892 ) ) ( not ( = ?auto_863891 ?auto_863893 ) ) ( not ( = ?auto_863891 ?auto_863894 ) ) ( not ( = ?auto_863891 ?auto_863895 ) ) ( not ( = ?auto_863891 ?auto_863896 ) ) ( not ( = ?auto_863892 ?auto_863893 ) ) ( not ( = ?auto_863892 ?auto_863894 ) ) ( not ( = ?auto_863892 ?auto_863895 ) ) ( not ( = ?auto_863892 ?auto_863896 ) ) ( not ( = ?auto_863893 ?auto_863894 ) ) ( not ( = ?auto_863893 ?auto_863895 ) ) ( not ( = ?auto_863893 ?auto_863896 ) ) ( not ( = ?auto_863894 ?auto_863895 ) ) ( not ( = ?auto_863894 ?auto_863896 ) ) ( not ( = ?auto_863895 ?auto_863896 ) ) ( ON ?auto_863894 ?auto_863895 ) ( ON ?auto_863893 ?auto_863894 ) ( ON ?auto_863892 ?auto_863893 ) ( CLEAR ?auto_863890 ) ( ON ?auto_863891 ?auto_863892 ) ( CLEAR ?auto_863891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_863887 ?auto_863888 ?auto_863889 ?auto_863890 ?auto_863891 )
      ( MAKE-9PILE ?auto_863887 ?auto_863888 ?auto_863889 ?auto_863890 ?auto_863891 ?auto_863892 ?auto_863893 ?auto_863894 ?auto_863895 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863925 - BLOCK
      ?auto_863926 - BLOCK
      ?auto_863927 - BLOCK
      ?auto_863928 - BLOCK
      ?auto_863929 - BLOCK
      ?auto_863930 - BLOCK
      ?auto_863931 - BLOCK
      ?auto_863932 - BLOCK
      ?auto_863933 - BLOCK
    )
    :vars
    (
      ?auto_863934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863933 ?auto_863934 ) ( ON-TABLE ?auto_863925 ) ( ON ?auto_863926 ?auto_863925 ) ( ON ?auto_863927 ?auto_863926 ) ( not ( = ?auto_863925 ?auto_863926 ) ) ( not ( = ?auto_863925 ?auto_863927 ) ) ( not ( = ?auto_863925 ?auto_863928 ) ) ( not ( = ?auto_863925 ?auto_863929 ) ) ( not ( = ?auto_863925 ?auto_863930 ) ) ( not ( = ?auto_863925 ?auto_863931 ) ) ( not ( = ?auto_863925 ?auto_863932 ) ) ( not ( = ?auto_863925 ?auto_863933 ) ) ( not ( = ?auto_863925 ?auto_863934 ) ) ( not ( = ?auto_863926 ?auto_863927 ) ) ( not ( = ?auto_863926 ?auto_863928 ) ) ( not ( = ?auto_863926 ?auto_863929 ) ) ( not ( = ?auto_863926 ?auto_863930 ) ) ( not ( = ?auto_863926 ?auto_863931 ) ) ( not ( = ?auto_863926 ?auto_863932 ) ) ( not ( = ?auto_863926 ?auto_863933 ) ) ( not ( = ?auto_863926 ?auto_863934 ) ) ( not ( = ?auto_863927 ?auto_863928 ) ) ( not ( = ?auto_863927 ?auto_863929 ) ) ( not ( = ?auto_863927 ?auto_863930 ) ) ( not ( = ?auto_863927 ?auto_863931 ) ) ( not ( = ?auto_863927 ?auto_863932 ) ) ( not ( = ?auto_863927 ?auto_863933 ) ) ( not ( = ?auto_863927 ?auto_863934 ) ) ( not ( = ?auto_863928 ?auto_863929 ) ) ( not ( = ?auto_863928 ?auto_863930 ) ) ( not ( = ?auto_863928 ?auto_863931 ) ) ( not ( = ?auto_863928 ?auto_863932 ) ) ( not ( = ?auto_863928 ?auto_863933 ) ) ( not ( = ?auto_863928 ?auto_863934 ) ) ( not ( = ?auto_863929 ?auto_863930 ) ) ( not ( = ?auto_863929 ?auto_863931 ) ) ( not ( = ?auto_863929 ?auto_863932 ) ) ( not ( = ?auto_863929 ?auto_863933 ) ) ( not ( = ?auto_863929 ?auto_863934 ) ) ( not ( = ?auto_863930 ?auto_863931 ) ) ( not ( = ?auto_863930 ?auto_863932 ) ) ( not ( = ?auto_863930 ?auto_863933 ) ) ( not ( = ?auto_863930 ?auto_863934 ) ) ( not ( = ?auto_863931 ?auto_863932 ) ) ( not ( = ?auto_863931 ?auto_863933 ) ) ( not ( = ?auto_863931 ?auto_863934 ) ) ( not ( = ?auto_863932 ?auto_863933 ) ) ( not ( = ?auto_863932 ?auto_863934 ) ) ( not ( = ?auto_863933 ?auto_863934 ) ) ( ON ?auto_863932 ?auto_863933 ) ( ON ?auto_863931 ?auto_863932 ) ( ON ?auto_863930 ?auto_863931 ) ( ON ?auto_863929 ?auto_863930 ) ( CLEAR ?auto_863927 ) ( ON ?auto_863928 ?auto_863929 ) ( CLEAR ?auto_863928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_863925 ?auto_863926 ?auto_863927 ?auto_863928 )
      ( MAKE-9PILE ?auto_863925 ?auto_863926 ?auto_863927 ?auto_863928 ?auto_863929 ?auto_863930 ?auto_863931 ?auto_863932 ?auto_863933 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_863963 - BLOCK
      ?auto_863964 - BLOCK
      ?auto_863965 - BLOCK
      ?auto_863966 - BLOCK
      ?auto_863967 - BLOCK
      ?auto_863968 - BLOCK
      ?auto_863969 - BLOCK
      ?auto_863970 - BLOCK
      ?auto_863971 - BLOCK
    )
    :vars
    (
      ?auto_863972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_863971 ?auto_863972 ) ( ON-TABLE ?auto_863963 ) ( ON ?auto_863964 ?auto_863963 ) ( not ( = ?auto_863963 ?auto_863964 ) ) ( not ( = ?auto_863963 ?auto_863965 ) ) ( not ( = ?auto_863963 ?auto_863966 ) ) ( not ( = ?auto_863963 ?auto_863967 ) ) ( not ( = ?auto_863963 ?auto_863968 ) ) ( not ( = ?auto_863963 ?auto_863969 ) ) ( not ( = ?auto_863963 ?auto_863970 ) ) ( not ( = ?auto_863963 ?auto_863971 ) ) ( not ( = ?auto_863963 ?auto_863972 ) ) ( not ( = ?auto_863964 ?auto_863965 ) ) ( not ( = ?auto_863964 ?auto_863966 ) ) ( not ( = ?auto_863964 ?auto_863967 ) ) ( not ( = ?auto_863964 ?auto_863968 ) ) ( not ( = ?auto_863964 ?auto_863969 ) ) ( not ( = ?auto_863964 ?auto_863970 ) ) ( not ( = ?auto_863964 ?auto_863971 ) ) ( not ( = ?auto_863964 ?auto_863972 ) ) ( not ( = ?auto_863965 ?auto_863966 ) ) ( not ( = ?auto_863965 ?auto_863967 ) ) ( not ( = ?auto_863965 ?auto_863968 ) ) ( not ( = ?auto_863965 ?auto_863969 ) ) ( not ( = ?auto_863965 ?auto_863970 ) ) ( not ( = ?auto_863965 ?auto_863971 ) ) ( not ( = ?auto_863965 ?auto_863972 ) ) ( not ( = ?auto_863966 ?auto_863967 ) ) ( not ( = ?auto_863966 ?auto_863968 ) ) ( not ( = ?auto_863966 ?auto_863969 ) ) ( not ( = ?auto_863966 ?auto_863970 ) ) ( not ( = ?auto_863966 ?auto_863971 ) ) ( not ( = ?auto_863966 ?auto_863972 ) ) ( not ( = ?auto_863967 ?auto_863968 ) ) ( not ( = ?auto_863967 ?auto_863969 ) ) ( not ( = ?auto_863967 ?auto_863970 ) ) ( not ( = ?auto_863967 ?auto_863971 ) ) ( not ( = ?auto_863967 ?auto_863972 ) ) ( not ( = ?auto_863968 ?auto_863969 ) ) ( not ( = ?auto_863968 ?auto_863970 ) ) ( not ( = ?auto_863968 ?auto_863971 ) ) ( not ( = ?auto_863968 ?auto_863972 ) ) ( not ( = ?auto_863969 ?auto_863970 ) ) ( not ( = ?auto_863969 ?auto_863971 ) ) ( not ( = ?auto_863969 ?auto_863972 ) ) ( not ( = ?auto_863970 ?auto_863971 ) ) ( not ( = ?auto_863970 ?auto_863972 ) ) ( not ( = ?auto_863971 ?auto_863972 ) ) ( ON ?auto_863970 ?auto_863971 ) ( ON ?auto_863969 ?auto_863970 ) ( ON ?auto_863968 ?auto_863969 ) ( ON ?auto_863967 ?auto_863968 ) ( ON ?auto_863966 ?auto_863967 ) ( CLEAR ?auto_863964 ) ( ON ?auto_863965 ?auto_863966 ) ( CLEAR ?auto_863965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_863963 ?auto_863964 ?auto_863965 )
      ( MAKE-9PILE ?auto_863963 ?auto_863964 ?auto_863965 ?auto_863966 ?auto_863967 ?auto_863968 ?auto_863969 ?auto_863970 ?auto_863971 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_864001 - BLOCK
      ?auto_864002 - BLOCK
      ?auto_864003 - BLOCK
      ?auto_864004 - BLOCK
      ?auto_864005 - BLOCK
      ?auto_864006 - BLOCK
      ?auto_864007 - BLOCK
      ?auto_864008 - BLOCK
      ?auto_864009 - BLOCK
    )
    :vars
    (
      ?auto_864010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864009 ?auto_864010 ) ( ON-TABLE ?auto_864001 ) ( not ( = ?auto_864001 ?auto_864002 ) ) ( not ( = ?auto_864001 ?auto_864003 ) ) ( not ( = ?auto_864001 ?auto_864004 ) ) ( not ( = ?auto_864001 ?auto_864005 ) ) ( not ( = ?auto_864001 ?auto_864006 ) ) ( not ( = ?auto_864001 ?auto_864007 ) ) ( not ( = ?auto_864001 ?auto_864008 ) ) ( not ( = ?auto_864001 ?auto_864009 ) ) ( not ( = ?auto_864001 ?auto_864010 ) ) ( not ( = ?auto_864002 ?auto_864003 ) ) ( not ( = ?auto_864002 ?auto_864004 ) ) ( not ( = ?auto_864002 ?auto_864005 ) ) ( not ( = ?auto_864002 ?auto_864006 ) ) ( not ( = ?auto_864002 ?auto_864007 ) ) ( not ( = ?auto_864002 ?auto_864008 ) ) ( not ( = ?auto_864002 ?auto_864009 ) ) ( not ( = ?auto_864002 ?auto_864010 ) ) ( not ( = ?auto_864003 ?auto_864004 ) ) ( not ( = ?auto_864003 ?auto_864005 ) ) ( not ( = ?auto_864003 ?auto_864006 ) ) ( not ( = ?auto_864003 ?auto_864007 ) ) ( not ( = ?auto_864003 ?auto_864008 ) ) ( not ( = ?auto_864003 ?auto_864009 ) ) ( not ( = ?auto_864003 ?auto_864010 ) ) ( not ( = ?auto_864004 ?auto_864005 ) ) ( not ( = ?auto_864004 ?auto_864006 ) ) ( not ( = ?auto_864004 ?auto_864007 ) ) ( not ( = ?auto_864004 ?auto_864008 ) ) ( not ( = ?auto_864004 ?auto_864009 ) ) ( not ( = ?auto_864004 ?auto_864010 ) ) ( not ( = ?auto_864005 ?auto_864006 ) ) ( not ( = ?auto_864005 ?auto_864007 ) ) ( not ( = ?auto_864005 ?auto_864008 ) ) ( not ( = ?auto_864005 ?auto_864009 ) ) ( not ( = ?auto_864005 ?auto_864010 ) ) ( not ( = ?auto_864006 ?auto_864007 ) ) ( not ( = ?auto_864006 ?auto_864008 ) ) ( not ( = ?auto_864006 ?auto_864009 ) ) ( not ( = ?auto_864006 ?auto_864010 ) ) ( not ( = ?auto_864007 ?auto_864008 ) ) ( not ( = ?auto_864007 ?auto_864009 ) ) ( not ( = ?auto_864007 ?auto_864010 ) ) ( not ( = ?auto_864008 ?auto_864009 ) ) ( not ( = ?auto_864008 ?auto_864010 ) ) ( not ( = ?auto_864009 ?auto_864010 ) ) ( ON ?auto_864008 ?auto_864009 ) ( ON ?auto_864007 ?auto_864008 ) ( ON ?auto_864006 ?auto_864007 ) ( ON ?auto_864005 ?auto_864006 ) ( ON ?auto_864004 ?auto_864005 ) ( ON ?auto_864003 ?auto_864004 ) ( CLEAR ?auto_864001 ) ( ON ?auto_864002 ?auto_864003 ) ( CLEAR ?auto_864002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_864001 ?auto_864002 )
      ( MAKE-9PILE ?auto_864001 ?auto_864002 ?auto_864003 ?auto_864004 ?auto_864005 ?auto_864006 ?auto_864007 ?auto_864008 ?auto_864009 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_864039 - BLOCK
      ?auto_864040 - BLOCK
      ?auto_864041 - BLOCK
      ?auto_864042 - BLOCK
      ?auto_864043 - BLOCK
      ?auto_864044 - BLOCK
      ?auto_864045 - BLOCK
      ?auto_864046 - BLOCK
      ?auto_864047 - BLOCK
    )
    :vars
    (
      ?auto_864048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864047 ?auto_864048 ) ( not ( = ?auto_864039 ?auto_864040 ) ) ( not ( = ?auto_864039 ?auto_864041 ) ) ( not ( = ?auto_864039 ?auto_864042 ) ) ( not ( = ?auto_864039 ?auto_864043 ) ) ( not ( = ?auto_864039 ?auto_864044 ) ) ( not ( = ?auto_864039 ?auto_864045 ) ) ( not ( = ?auto_864039 ?auto_864046 ) ) ( not ( = ?auto_864039 ?auto_864047 ) ) ( not ( = ?auto_864039 ?auto_864048 ) ) ( not ( = ?auto_864040 ?auto_864041 ) ) ( not ( = ?auto_864040 ?auto_864042 ) ) ( not ( = ?auto_864040 ?auto_864043 ) ) ( not ( = ?auto_864040 ?auto_864044 ) ) ( not ( = ?auto_864040 ?auto_864045 ) ) ( not ( = ?auto_864040 ?auto_864046 ) ) ( not ( = ?auto_864040 ?auto_864047 ) ) ( not ( = ?auto_864040 ?auto_864048 ) ) ( not ( = ?auto_864041 ?auto_864042 ) ) ( not ( = ?auto_864041 ?auto_864043 ) ) ( not ( = ?auto_864041 ?auto_864044 ) ) ( not ( = ?auto_864041 ?auto_864045 ) ) ( not ( = ?auto_864041 ?auto_864046 ) ) ( not ( = ?auto_864041 ?auto_864047 ) ) ( not ( = ?auto_864041 ?auto_864048 ) ) ( not ( = ?auto_864042 ?auto_864043 ) ) ( not ( = ?auto_864042 ?auto_864044 ) ) ( not ( = ?auto_864042 ?auto_864045 ) ) ( not ( = ?auto_864042 ?auto_864046 ) ) ( not ( = ?auto_864042 ?auto_864047 ) ) ( not ( = ?auto_864042 ?auto_864048 ) ) ( not ( = ?auto_864043 ?auto_864044 ) ) ( not ( = ?auto_864043 ?auto_864045 ) ) ( not ( = ?auto_864043 ?auto_864046 ) ) ( not ( = ?auto_864043 ?auto_864047 ) ) ( not ( = ?auto_864043 ?auto_864048 ) ) ( not ( = ?auto_864044 ?auto_864045 ) ) ( not ( = ?auto_864044 ?auto_864046 ) ) ( not ( = ?auto_864044 ?auto_864047 ) ) ( not ( = ?auto_864044 ?auto_864048 ) ) ( not ( = ?auto_864045 ?auto_864046 ) ) ( not ( = ?auto_864045 ?auto_864047 ) ) ( not ( = ?auto_864045 ?auto_864048 ) ) ( not ( = ?auto_864046 ?auto_864047 ) ) ( not ( = ?auto_864046 ?auto_864048 ) ) ( not ( = ?auto_864047 ?auto_864048 ) ) ( ON ?auto_864046 ?auto_864047 ) ( ON ?auto_864045 ?auto_864046 ) ( ON ?auto_864044 ?auto_864045 ) ( ON ?auto_864043 ?auto_864044 ) ( ON ?auto_864042 ?auto_864043 ) ( ON ?auto_864041 ?auto_864042 ) ( ON ?auto_864040 ?auto_864041 ) ( ON ?auto_864039 ?auto_864040 ) ( CLEAR ?auto_864039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_864039 )
      ( MAKE-9PILE ?auto_864039 ?auto_864040 ?auto_864041 ?auto_864042 ?auto_864043 ?auto_864044 ?auto_864045 ?auto_864046 ?auto_864047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864078 - BLOCK
      ?auto_864079 - BLOCK
      ?auto_864080 - BLOCK
      ?auto_864081 - BLOCK
      ?auto_864082 - BLOCK
      ?auto_864083 - BLOCK
      ?auto_864084 - BLOCK
      ?auto_864085 - BLOCK
      ?auto_864086 - BLOCK
      ?auto_864087 - BLOCK
    )
    :vars
    (
      ?auto_864088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_864086 ) ( ON ?auto_864087 ?auto_864088 ) ( CLEAR ?auto_864087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_864078 ) ( ON ?auto_864079 ?auto_864078 ) ( ON ?auto_864080 ?auto_864079 ) ( ON ?auto_864081 ?auto_864080 ) ( ON ?auto_864082 ?auto_864081 ) ( ON ?auto_864083 ?auto_864082 ) ( ON ?auto_864084 ?auto_864083 ) ( ON ?auto_864085 ?auto_864084 ) ( ON ?auto_864086 ?auto_864085 ) ( not ( = ?auto_864078 ?auto_864079 ) ) ( not ( = ?auto_864078 ?auto_864080 ) ) ( not ( = ?auto_864078 ?auto_864081 ) ) ( not ( = ?auto_864078 ?auto_864082 ) ) ( not ( = ?auto_864078 ?auto_864083 ) ) ( not ( = ?auto_864078 ?auto_864084 ) ) ( not ( = ?auto_864078 ?auto_864085 ) ) ( not ( = ?auto_864078 ?auto_864086 ) ) ( not ( = ?auto_864078 ?auto_864087 ) ) ( not ( = ?auto_864078 ?auto_864088 ) ) ( not ( = ?auto_864079 ?auto_864080 ) ) ( not ( = ?auto_864079 ?auto_864081 ) ) ( not ( = ?auto_864079 ?auto_864082 ) ) ( not ( = ?auto_864079 ?auto_864083 ) ) ( not ( = ?auto_864079 ?auto_864084 ) ) ( not ( = ?auto_864079 ?auto_864085 ) ) ( not ( = ?auto_864079 ?auto_864086 ) ) ( not ( = ?auto_864079 ?auto_864087 ) ) ( not ( = ?auto_864079 ?auto_864088 ) ) ( not ( = ?auto_864080 ?auto_864081 ) ) ( not ( = ?auto_864080 ?auto_864082 ) ) ( not ( = ?auto_864080 ?auto_864083 ) ) ( not ( = ?auto_864080 ?auto_864084 ) ) ( not ( = ?auto_864080 ?auto_864085 ) ) ( not ( = ?auto_864080 ?auto_864086 ) ) ( not ( = ?auto_864080 ?auto_864087 ) ) ( not ( = ?auto_864080 ?auto_864088 ) ) ( not ( = ?auto_864081 ?auto_864082 ) ) ( not ( = ?auto_864081 ?auto_864083 ) ) ( not ( = ?auto_864081 ?auto_864084 ) ) ( not ( = ?auto_864081 ?auto_864085 ) ) ( not ( = ?auto_864081 ?auto_864086 ) ) ( not ( = ?auto_864081 ?auto_864087 ) ) ( not ( = ?auto_864081 ?auto_864088 ) ) ( not ( = ?auto_864082 ?auto_864083 ) ) ( not ( = ?auto_864082 ?auto_864084 ) ) ( not ( = ?auto_864082 ?auto_864085 ) ) ( not ( = ?auto_864082 ?auto_864086 ) ) ( not ( = ?auto_864082 ?auto_864087 ) ) ( not ( = ?auto_864082 ?auto_864088 ) ) ( not ( = ?auto_864083 ?auto_864084 ) ) ( not ( = ?auto_864083 ?auto_864085 ) ) ( not ( = ?auto_864083 ?auto_864086 ) ) ( not ( = ?auto_864083 ?auto_864087 ) ) ( not ( = ?auto_864083 ?auto_864088 ) ) ( not ( = ?auto_864084 ?auto_864085 ) ) ( not ( = ?auto_864084 ?auto_864086 ) ) ( not ( = ?auto_864084 ?auto_864087 ) ) ( not ( = ?auto_864084 ?auto_864088 ) ) ( not ( = ?auto_864085 ?auto_864086 ) ) ( not ( = ?auto_864085 ?auto_864087 ) ) ( not ( = ?auto_864085 ?auto_864088 ) ) ( not ( = ?auto_864086 ?auto_864087 ) ) ( not ( = ?auto_864086 ?auto_864088 ) ) ( not ( = ?auto_864087 ?auto_864088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_864087 ?auto_864088 )
      ( !STACK ?auto_864087 ?auto_864086 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864120 - BLOCK
      ?auto_864121 - BLOCK
      ?auto_864122 - BLOCK
      ?auto_864123 - BLOCK
      ?auto_864124 - BLOCK
      ?auto_864125 - BLOCK
      ?auto_864126 - BLOCK
      ?auto_864127 - BLOCK
      ?auto_864128 - BLOCK
      ?auto_864129 - BLOCK
    )
    :vars
    (
      ?auto_864130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864129 ?auto_864130 ) ( ON-TABLE ?auto_864120 ) ( ON ?auto_864121 ?auto_864120 ) ( ON ?auto_864122 ?auto_864121 ) ( ON ?auto_864123 ?auto_864122 ) ( ON ?auto_864124 ?auto_864123 ) ( ON ?auto_864125 ?auto_864124 ) ( ON ?auto_864126 ?auto_864125 ) ( ON ?auto_864127 ?auto_864126 ) ( not ( = ?auto_864120 ?auto_864121 ) ) ( not ( = ?auto_864120 ?auto_864122 ) ) ( not ( = ?auto_864120 ?auto_864123 ) ) ( not ( = ?auto_864120 ?auto_864124 ) ) ( not ( = ?auto_864120 ?auto_864125 ) ) ( not ( = ?auto_864120 ?auto_864126 ) ) ( not ( = ?auto_864120 ?auto_864127 ) ) ( not ( = ?auto_864120 ?auto_864128 ) ) ( not ( = ?auto_864120 ?auto_864129 ) ) ( not ( = ?auto_864120 ?auto_864130 ) ) ( not ( = ?auto_864121 ?auto_864122 ) ) ( not ( = ?auto_864121 ?auto_864123 ) ) ( not ( = ?auto_864121 ?auto_864124 ) ) ( not ( = ?auto_864121 ?auto_864125 ) ) ( not ( = ?auto_864121 ?auto_864126 ) ) ( not ( = ?auto_864121 ?auto_864127 ) ) ( not ( = ?auto_864121 ?auto_864128 ) ) ( not ( = ?auto_864121 ?auto_864129 ) ) ( not ( = ?auto_864121 ?auto_864130 ) ) ( not ( = ?auto_864122 ?auto_864123 ) ) ( not ( = ?auto_864122 ?auto_864124 ) ) ( not ( = ?auto_864122 ?auto_864125 ) ) ( not ( = ?auto_864122 ?auto_864126 ) ) ( not ( = ?auto_864122 ?auto_864127 ) ) ( not ( = ?auto_864122 ?auto_864128 ) ) ( not ( = ?auto_864122 ?auto_864129 ) ) ( not ( = ?auto_864122 ?auto_864130 ) ) ( not ( = ?auto_864123 ?auto_864124 ) ) ( not ( = ?auto_864123 ?auto_864125 ) ) ( not ( = ?auto_864123 ?auto_864126 ) ) ( not ( = ?auto_864123 ?auto_864127 ) ) ( not ( = ?auto_864123 ?auto_864128 ) ) ( not ( = ?auto_864123 ?auto_864129 ) ) ( not ( = ?auto_864123 ?auto_864130 ) ) ( not ( = ?auto_864124 ?auto_864125 ) ) ( not ( = ?auto_864124 ?auto_864126 ) ) ( not ( = ?auto_864124 ?auto_864127 ) ) ( not ( = ?auto_864124 ?auto_864128 ) ) ( not ( = ?auto_864124 ?auto_864129 ) ) ( not ( = ?auto_864124 ?auto_864130 ) ) ( not ( = ?auto_864125 ?auto_864126 ) ) ( not ( = ?auto_864125 ?auto_864127 ) ) ( not ( = ?auto_864125 ?auto_864128 ) ) ( not ( = ?auto_864125 ?auto_864129 ) ) ( not ( = ?auto_864125 ?auto_864130 ) ) ( not ( = ?auto_864126 ?auto_864127 ) ) ( not ( = ?auto_864126 ?auto_864128 ) ) ( not ( = ?auto_864126 ?auto_864129 ) ) ( not ( = ?auto_864126 ?auto_864130 ) ) ( not ( = ?auto_864127 ?auto_864128 ) ) ( not ( = ?auto_864127 ?auto_864129 ) ) ( not ( = ?auto_864127 ?auto_864130 ) ) ( not ( = ?auto_864128 ?auto_864129 ) ) ( not ( = ?auto_864128 ?auto_864130 ) ) ( not ( = ?auto_864129 ?auto_864130 ) ) ( CLEAR ?auto_864127 ) ( ON ?auto_864128 ?auto_864129 ) ( CLEAR ?auto_864128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_864120 ?auto_864121 ?auto_864122 ?auto_864123 ?auto_864124 ?auto_864125 ?auto_864126 ?auto_864127 ?auto_864128 )
      ( MAKE-10PILE ?auto_864120 ?auto_864121 ?auto_864122 ?auto_864123 ?auto_864124 ?auto_864125 ?auto_864126 ?auto_864127 ?auto_864128 ?auto_864129 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864162 - BLOCK
      ?auto_864163 - BLOCK
      ?auto_864164 - BLOCK
      ?auto_864165 - BLOCK
      ?auto_864166 - BLOCK
      ?auto_864167 - BLOCK
      ?auto_864168 - BLOCK
      ?auto_864169 - BLOCK
      ?auto_864170 - BLOCK
      ?auto_864171 - BLOCK
    )
    :vars
    (
      ?auto_864172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864171 ?auto_864172 ) ( ON-TABLE ?auto_864162 ) ( ON ?auto_864163 ?auto_864162 ) ( ON ?auto_864164 ?auto_864163 ) ( ON ?auto_864165 ?auto_864164 ) ( ON ?auto_864166 ?auto_864165 ) ( ON ?auto_864167 ?auto_864166 ) ( ON ?auto_864168 ?auto_864167 ) ( not ( = ?auto_864162 ?auto_864163 ) ) ( not ( = ?auto_864162 ?auto_864164 ) ) ( not ( = ?auto_864162 ?auto_864165 ) ) ( not ( = ?auto_864162 ?auto_864166 ) ) ( not ( = ?auto_864162 ?auto_864167 ) ) ( not ( = ?auto_864162 ?auto_864168 ) ) ( not ( = ?auto_864162 ?auto_864169 ) ) ( not ( = ?auto_864162 ?auto_864170 ) ) ( not ( = ?auto_864162 ?auto_864171 ) ) ( not ( = ?auto_864162 ?auto_864172 ) ) ( not ( = ?auto_864163 ?auto_864164 ) ) ( not ( = ?auto_864163 ?auto_864165 ) ) ( not ( = ?auto_864163 ?auto_864166 ) ) ( not ( = ?auto_864163 ?auto_864167 ) ) ( not ( = ?auto_864163 ?auto_864168 ) ) ( not ( = ?auto_864163 ?auto_864169 ) ) ( not ( = ?auto_864163 ?auto_864170 ) ) ( not ( = ?auto_864163 ?auto_864171 ) ) ( not ( = ?auto_864163 ?auto_864172 ) ) ( not ( = ?auto_864164 ?auto_864165 ) ) ( not ( = ?auto_864164 ?auto_864166 ) ) ( not ( = ?auto_864164 ?auto_864167 ) ) ( not ( = ?auto_864164 ?auto_864168 ) ) ( not ( = ?auto_864164 ?auto_864169 ) ) ( not ( = ?auto_864164 ?auto_864170 ) ) ( not ( = ?auto_864164 ?auto_864171 ) ) ( not ( = ?auto_864164 ?auto_864172 ) ) ( not ( = ?auto_864165 ?auto_864166 ) ) ( not ( = ?auto_864165 ?auto_864167 ) ) ( not ( = ?auto_864165 ?auto_864168 ) ) ( not ( = ?auto_864165 ?auto_864169 ) ) ( not ( = ?auto_864165 ?auto_864170 ) ) ( not ( = ?auto_864165 ?auto_864171 ) ) ( not ( = ?auto_864165 ?auto_864172 ) ) ( not ( = ?auto_864166 ?auto_864167 ) ) ( not ( = ?auto_864166 ?auto_864168 ) ) ( not ( = ?auto_864166 ?auto_864169 ) ) ( not ( = ?auto_864166 ?auto_864170 ) ) ( not ( = ?auto_864166 ?auto_864171 ) ) ( not ( = ?auto_864166 ?auto_864172 ) ) ( not ( = ?auto_864167 ?auto_864168 ) ) ( not ( = ?auto_864167 ?auto_864169 ) ) ( not ( = ?auto_864167 ?auto_864170 ) ) ( not ( = ?auto_864167 ?auto_864171 ) ) ( not ( = ?auto_864167 ?auto_864172 ) ) ( not ( = ?auto_864168 ?auto_864169 ) ) ( not ( = ?auto_864168 ?auto_864170 ) ) ( not ( = ?auto_864168 ?auto_864171 ) ) ( not ( = ?auto_864168 ?auto_864172 ) ) ( not ( = ?auto_864169 ?auto_864170 ) ) ( not ( = ?auto_864169 ?auto_864171 ) ) ( not ( = ?auto_864169 ?auto_864172 ) ) ( not ( = ?auto_864170 ?auto_864171 ) ) ( not ( = ?auto_864170 ?auto_864172 ) ) ( not ( = ?auto_864171 ?auto_864172 ) ) ( ON ?auto_864170 ?auto_864171 ) ( CLEAR ?auto_864168 ) ( ON ?auto_864169 ?auto_864170 ) ( CLEAR ?auto_864169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_864162 ?auto_864163 ?auto_864164 ?auto_864165 ?auto_864166 ?auto_864167 ?auto_864168 ?auto_864169 )
      ( MAKE-10PILE ?auto_864162 ?auto_864163 ?auto_864164 ?auto_864165 ?auto_864166 ?auto_864167 ?auto_864168 ?auto_864169 ?auto_864170 ?auto_864171 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864204 - BLOCK
      ?auto_864205 - BLOCK
      ?auto_864206 - BLOCK
      ?auto_864207 - BLOCK
      ?auto_864208 - BLOCK
      ?auto_864209 - BLOCK
      ?auto_864210 - BLOCK
      ?auto_864211 - BLOCK
      ?auto_864212 - BLOCK
      ?auto_864213 - BLOCK
    )
    :vars
    (
      ?auto_864214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864213 ?auto_864214 ) ( ON-TABLE ?auto_864204 ) ( ON ?auto_864205 ?auto_864204 ) ( ON ?auto_864206 ?auto_864205 ) ( ON ?auto_864207 ?auto_864206 ) ( ON ?auto_864208 ?auto_864207 ) ( ON ?auto_864209 ?auto_864208 ) ( not ( = ?auto_864204 ?auto_864205 ) ) ( not ( = ?auto_864204 ?auto_864206 ) ) ( not ( = ?auto_864204 ?auto_864207 ) ) ( not ( = ?auto_864204 ?auto_864208 ) ) ( not ( = ?auto_864204 ?auto_864209 ) ) ( not ( = ?auto_864204 ?auto_864210 ) ) ( not ( = ?auto_864204 ?auto_864211 ) ) ( not ( = ?auto_864204 ?auto_864212 ) ) ( not ( = ?auto_864204 ?auto_864213 ) ) ( not ( = ?auto_864204 ?auto_864214 ) ) ( not ( = ?auto_864205 ?auto_864206 ) ) ( not ( = ?auto_864205 ?auto_864207 ) ) ( not ( = ?auto_864205 ?auto_864208 ) ) ( not ( = ?auto_864205 ?auto_864209 ) ) ( not ( = ?auto_864205 ?auto_864210 ) ) ( not ( = ?auto_864205 ?auto_864211 ) ) ( not ( = ?auto_864205 ?auto_864212 ) ) ( not ( = ?auto_864205 ?auto_864213 ) ) ( not ( = ?auto_864205 ?auto_864214 ) ) ( not ( = ?auto_864206 ?auto_864207 ) ) ( not ( = ?auto_864206 ?auto_864208 ) ) ( not ( = ?auto_864206 ?auto_864209 ) ) ( not ( = ?auto_864206 ?auto_864210 ) ) ( not ( = ?auto_864206 ?auto_864211 ) ) ( not ( = ?auto_864206 ?auto_864212 ) ) ( not ( = ?auto_864206 ?auto_864213 ) ) ( not ( = ?auto_864206 ?auto_864214 ) ) ( not ( = ?auto_864207 ?auto_864208 ) ) ( not ( = ?auto_864207 ?auto_864209 ) ) ( not ( = ?auto_864207 ?auto_864210 ) ) ( not ( = ?auto_864207 ?auto_864211 ) ) ( not ( = ?auto_864207 ?auto_864212 ) ) ( not ( = ?auto_864207 ?auto_864213 ) ) ( not ( = ?auto_864207 ?auto_864214 ) ) ( not ( = ?auto_864208 ?auto_864209 ) ) ( not ( = ?auto_864208 ?auto_864210 ) ) ( not ( = ?auto_864208 ?auto_864211 ) ) ( not ( = ?auto_864208 ?auto_864212 ) ) ( not ( = ?auto_864208 ?auto_864213 ) ) ( not ( = ?auto_864208 ?auto_864214 ) ) ( not ( = ?auto_864209 ?auto_864210 ) ) ( not ( = ?auto_864209 ?auto_864211 ) ) ( not ( = ?auto_864209 ?auto_864212 ) ) ( not ( = ?auto_864209 ?auto_864213 ) ) ( not ( = ?auto_864209 ?auto_864214 ) ) ( not ( = ?auto_864210 ?auto_864211 ) ) ( not ( = ?auto_864210 ?auto_864212 ) ) ( not ( = ?auto_864210 ?auto_864213 ) ) ( not ( = ?auto_864210 ?auto_864214 ) ) ( not ( = ?auto_864211 ?auto_864212 ) ) ( not ( = ?auto_864211 ?auto_864213 ) ) ( not ( = ?auto_864211 ?auto_864214 ) ) ( not ( = ?auto_864212 ?auto_864213 ) ) ( not ( = ?auto_864212 ?auto_864214 ) ) ( not ( = ?auto_864213 ?auto_864214 ) ) ( ON ?auto_864212 ?auto_864213 ) ( ON ?auto_864211 ?auto_864212 ) ( CLEAR ?auto_864209 ) ( ON ?auto_864210 ?auto_864211 ) ( CLEAR ?auto_864210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_864204 ?auto_864205 ?auto_864206 ?auto_864207 ?auto_864208 ?auto_864209 ?auto_864210 )
      ( MAKE-10PILE ?auto_864204 ?auto_864205 ?auto_864206 ?auto_864207 ?auto_864208 ?auto_864209 ?auto_864210 ?auto_864211 ?auto_864212 ?auto_864213 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864246 - BLOCK
      ?auto_864247 - BLOCK
      ?auto_864248 - BLOCK
      ?auto_864249 - BLOCK
      ?auto_864250 - BLOCK
      ?auto_864251 - BLOCK
      ?auto_864252 - BLOCK
      ?auto_864253 - BLOCK
      ?auto_864254 - BLOCK
      ?auto_864255 - BLOCK
    )
    :vars
    (
      ?auto_864256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864255 ?auto_864256 ) ( ON-TABLE ?auto_864246 ) ( ON ?auto_864247 ?auto_864246 ) ( ON ?auto_864248 ?auto_864247 ) ( ON ?auto_864249 ?auto_864248 ) ( ON ?auto_864250 ?auto_864249 ) ( not ( = ?auto_864246 ?auto_864247 ) ) ( not ( = ?auto_864246 ?auto_864248 ) ) ( not ( = ?auto_864246 ?auto_864249 ) ) ( not ( = ?auto_864246 ?auto_864250 ) ) ( not ( = ?auto_864246 ?auto_864251 ) ) ( not ( = ?auto_864246 ?auto_864252 ) ) ( not ( = ?auto_864246 ?auto_864253 ) ) ( not ( = ?auto_864246 ?auto_864254 ) ) ( not ( = ?auto_864246 ?auto_864255 ) ) ( not ( = ?auto_864246 ?auto_864256 ) ) ( not ( = ?auto_864247 ?auto_864248 ) ) ( not ( = ?auto_864247 ?auto_864249 ) ) ( not ( = ?auto_864247 ?auto_864250 ) ) ( not ( = ?auto_864247 ?auto_864251 ) ) ( not ( = ?auto_864247 ?auto_864252 ) ) ( not ( = ?auto_864247 ?auto_864253 ) ) ( not ( = ?auto_864247 ?auto_864254 ) ) ( not ( = ?auto_864247 ?auto_864255 ) ) ( not ( = ?auto_864247 ?auto_864256 ) ) ( not ( = ?auto_864248 ?auto_864249 ) ) ( not ( = ?auto_864248 ?auto_864250 ) ) ( not ( = ?auto_864248 ?auto_864251 ) ) ( not ( = ?auto_864248 ?auto_864252 ) ) ( not ( = ?auto_864248 ?auto_864253 ) ) ( not ( = ?auto_864248 ?auto_864254 ) ) ( not ( = ?auto_864248 ?auto_864255 ) ) ( not ( = ?auto_864248 ?auto_864256 ) ) ( not ( = ?auto_864249 ?auto_864250 ) ) ( not ( = ?auto_864249 ?auto_864251 ) ) ( not ( = ?auto_864249 ?auto_864252 ) ) ( not ( = ?auto_864249 ?auto_864253 ) ) ( not ( = ?auto_864249 ?auto_864254 ) ) ( not ( = ?auto_864249 ?auto_864255 ) ) ( not ( = ?auto_864249 ?auto_864256 ) ) ( not ( = ?auto_864250 ?auto_864251 ) ) ( not ( = ?auto_864250 ?auto_864252 ) ) ( not ( = ?auto_864250 ?auto_864253 ) ) ( not ( = ?auto_864250 ?auto_864254 ) ) ( not ( = ?auto_864250 ?auto_864255 ) ) ( not ( = ?auto_864250 ?auto_864256 ) ) ( not ( = ?auto_864251 ?auto_864252 ) ) ( not ( = ?auto_864251 ?auto_864253 ) ) ( not ( = ?auto_864251 ?auto_864254 ) ) ( not ( = ?auto_864251 ?auto_864255 ) ) ( not ( = ?auto_864251 ?auto_864256 ) ) ( not ( = ?auto_864252 ?auto_864253 ) ) ( not ( = ?auto_864252 ?auto_864254 ) ) ( not ( = ?auto_864252 ?auto_864255 ) ) ( not ( = ?auto_864252 ?auto_864256 ) ) ( not ( = ?auto_864253 ?auto_864254 ) ) ( not ( = ?auto_864253 ?auto_864255 ) ) ( not ( = ?auto_864253 ?auto_864256 ) ) ( not ( = ?auto_864254 ?auto_864255 ) ) ( not ( = ?auto_864254 ?auto_864256 ) ) ( not ( = ?auto_864255 ?auto_864256 ) ) ( ON ?auto_864254 ?auto_864255 ) ( ON ?auto_864253 ?auto_864254 ) ( ON ?auto_864252 ?auto_864253 ) ( CLEAR ?auto_864250 ) ( ON ?auto_864251 ?auto_864252 ) ( CLEAR ?auto_864251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_864246 ?auto_864247 ?auto_864248 ?auto_864249 ?auto_864250 ?auto_864251 )
      ( MAKE-10PILE ?auto_864246 ?auto_864247 ?auto_864248 ?auto_864249 ?auto_864250 ?auto_864251 ?auto_864252 ?auto_864253 ?auto_864254 ?auto_864255 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864288 - BLOCK
      ?auto_864289 - BLOCK
      ?auto_864290 - BLOCK
      ?auto_864291 - BLOCK
      ?auto_864292 - BLOCK
      ?auto_864293 - BLOCK
      ?auto_864294 - BLOCK
      ?auto_864295 - BLOCK
      ?auto_864296 - BLOCK
      ?auto_864297 - BLOCK
    )
    :vars
    (
      ?auto_864298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864297 ?auto_864298 ) ( ON-TABLE ?auto_864288 ) ( ON ?auto_864289 ?auto_864288 ) ( ON ?auto_864290 ?auto_864289 ) ( ON ?auto_864291 ?auto_864290 ) ( not ( = ?auto_864288 ?auto_864289 ) ) ( not ( = ?auto_864288 ?auto_864290 ) ) ( not ( = ?auto_864288 ?auto_864291 ) ) ( not ( = ?auto_864288 ?auto_864292 ) ) ( not ( = ?auto_864288 ?auto_864293 ) ) ( not ( = ?auto_864288 ?auto_864294 ) ) ( not ( = ?auto_864288 ?auto_864295 ) ) ( not ( = ?auto_864288 ?auto_864296 ) ) ( not ( = ?auto_864288 ?auto_864297 ) ) ( not ( = ?auto_864288 ?auto_864298 ) ) ( not ( = ?auto_864289 ?auto_864290 ) ) ( not ( = ?auto_864289 ?auto_864291 ) ) ( not ( = ?auto_864289 ?auto_864292 ) ) ( not ( = ?auto_864289 ?auto_864293 ) ) ( not ( = ?auto_864289 ?auto_864294 ) ) ( not ( = ?auto_864289 ?auto_864295 ) ) ( not ( = ?auto_864289 ?auto_864296 ) ) ( not ( = ?auto_864289 ?auto_864297 ) ) ( not ( = ?auto_864289 ?auto_864298 ) ) ( not ( = ?auto_864290 ?auto_864291 ) ) ( not ( = ?auto_864290 ?auto_864292 ) ) ( not ( = ?auto_864290 ?auto_864293 ) ) ( not ( = ?auto_864290 ?auto_864294 ) ) ( not ( = ?auto_864290 ?auto_864295 ) ) ( not ( = ?auto_864290 ?auto_864296 ) ) ( not ( = ?auto_864290 ?auto_864297 ) ) ( not ( = ?auto_864290 ?auto_864298 ) ) ( not ( = ?auto_864291 ?auto_864292 ) ) ( not ( = ?auto_864291 ?auto_864293 ) ) ( not ( = ?auto_864291 ?auto_864294 ) ) ( not ( = ?auto_864291 ?auto_864295 ) ) ( not ( = ?auto_864291 ?auto_864296 ) ) ( not ( = ?auto_864291 ?auto_864297 ) ) ( not ( = ?auto_864291 ?auto_864298 ) ) ( not ( = ?auto_864292 ?auto_864293 ) ) ( not ( = ?auto_864292 ?auto_864294 ) ) ( not ( = ?auto_864292 ?auto_864295 ) ) ( not ( = ?auto_864292 ?auto_864296 ) ) ( not ( = ?auto_864292 ?auto_864297 ) ) ( not ( = ?auto_864292 ?auto_864298 ) ) ( not ( = ?auto_864293 ?auto_864294 ) ) ( not ( = ?auto_864293 ?auto_864295 ) ) ( not ( = ?auto_864293 ?auto_864296 ) ) ( not ( = ?auto_864293 ?auto_864297 ) ) ( not ( = ?auto_864293 ?auto_864298 ) ) ( not ( = ?auto_864294 ?auto_864295 ) ) ( not ( = ?auto_864294 ?auto_864296 ) ) ( not ( = ?auto_864294 ?auto_864297 ) ) ( not ( = ?auto_864294 ?auto_864298 ) ) ( not ( = ?auto_864295 ?auto_864296 ) ) ( not ( = ?auto_864295 ?auto_864297 ) ) ( not ( = ?auto_864295 ?auto_864298 ) ) ( not ( = ?auto_864296 ?auto_864297 ) ) ( not ( = ?auto_864296 ?auto_864298 ) ) ( not ( = ?auto_864297 ?auto_864298 ) ) ( ON ?auto_864296 ?auto_864297 ) ( ON ?auto_864295 ?auto_864296 ) ( ON ?auto_864294 ?auto_864295 ) ( ON ?auto_864293 ?auto_864294 ) ( CLEAR ?auto_864291 ) ( ON ?auto_864292 ?auto_864293 ) ( CLEAR ?auto_864292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_864288 ?auto_864289 ?auto_864290 ?auto_864291 ?auto_864292 )
      ( MAKE-10PILE ?auto_864288 ?auto_864289 ?auto_864290 ?auto_864291 ?auto_864292 ?auto_864293 ?auto_864294 ?auto_864295 ?auto_864296 ?auto_864297 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864330 - BLOCK
      ?auto_864331 - BLOCK
      ?auto_864332 - BLOCK
      ?auto_864333 - BLOCK
      ?auto_864334 - BLOCK
      ?auto_864335 - BLOCK
      ?auto_864336 - BLOCK
      ?auto_864337 - BLOCK
      ?auto_864338 - BLOCK
      ?auto_864339 - BLOCK
    )
    :vars
    (
      ?auto_864340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864339 ?auto_864340 ) ( ON-TABLE ?auto_864330 ) ( ON ?auto_864331 ?auto_864330 ) ( ON ?auto_864332 ?auto_864331 ) ( not ( = ?auto_864330 ?auto_864331 ) ) ( not ( = ?auto_864330 ?auto_864332 ) ) ( not ( = ?auto_864330 ?auto_864333 ) ) ( not ( = ?auto_864330 ?auto_864334 ) ) ( not ( = ?auto_864330 ?auto_864335 ) ) ( not ( = ?auto_864330 ?auto_864336 ) ) ( not ( = ?auto_864330 ?auto_864337 ) ) ( not ( = ?auto_864330 ?auto_864338 ) ) ( not ( = ?auto_864330 ?auto_864339 ) ) ( not ( = ?auto_864330 ?auto_864340 ) ) ( not ( = ?auto_864331 ?auto_864332 ) ) ( not ( = ?auto_864331 ?auto_864333 ) ) ( not ( = ?auto_864331 ?auto_864334 ) ) ( not ( = ?auto_864331 ?auto_864335 ) ) ( not ( = ?auto_864331 ?auto_864336 ) ) ( not ( = ?auto_864331 ?auto_864337 ) ) ( not ( = ?auto_864331 ?auto_864338 ) ) ( not ( = ?auto_864331 ?auto_864339 ) ) ( not ( = ?auto_864331 ?auto_864340 ) ) ( not ( = ?auto_864332 ?auto_864333 ) ) ( not ( = ?auto_864332 ?auto_864334 ) ) ( not ( = ?auto_864332 ?auto_864335 ) ) ( not ( = ?auto_864332 ?auto_864336 ) ) ( not ( = ?auto_864332 ?auto_864337 ) ) ( not ( = ?auto_864332 ?auto_864338 ) ) ( not ( = ?auto_864332 ?auto_864339 ) ) ( not ( = ?auto_864332 ?auto_864340 ) ) ( not ( = ?auto_864333 ?auto_864334 ) ) ( not ( = ?auto_864333 ?auto_864335 ) ) ( not ( = ?auto_864333 ?auto_864336 ) ) ( not ( = ?auto_864333 ?auto_864337 ) ) ( not ( = ?auto_864333 ?auto_864338 ) ) ( not ( = ?auto_864333 ?auto_864339 ) ) ( not ( = ?auto_864333 ?auto_864340 ) ) ( not ( = ?auto_864334 ?auto_864335 ) ) ( not ( = ?auto_864334 ?auto_864336 ) ) ( not ( = ?auto_864334 ?auto_864337 ) ) ( not ( = ?auto_864334 ?auto_864338 ) ) ( not ( = ?auto_864334 ?auto_864339 ) ) ( not ( = ?auto_864334 ?auto_864340 ) ) ( not ( = ?auto_864335 ?auto_864336 ) ) ( not ( = ?auto_864335 ?auto_864337 ) ) ( not ( = ?auto_864335 ?auto_864338 ) ) ( not ( = ?auto_864335 ?auto_864339 ) ) ( not ( = ?auto_864335 ?auto_864340 ) ) ( not ( = ?auto_864336 ?auto_864337 ) ) ( not ( = ?auto_864336 ?auto_864338 ) ) ( not ( = ?auto_864336 ?auto_864339 ) ) ( not ( = ?auto_864336 ?auto_864340 ) ) ( not ( = ?auto_864337 ?auto_864338 ) ) ( not ( = ?auto_864337 ?auto_864339 ) ) ( not ( = ?auto_864337 ?auto_864340 ) ) ( not ( = ?auto_864338 ?auto_864339 ) ) ( not ( = ?auto_864338 ?auto_864340 ) ) ( not ( = ?auto_864339 ?auto_864340 ) ) ( ON ?auto_864338 ?auto_864339 ) ( ON ?auto_864337 ?auto_864338 ) ( ON ?auto_864336 ?auto_864337 ) ( ON ?auto_864335 ?auto_864336 ) ( ON ?auto_864334 ?auto_864335 ) ( CLEAR ?auto_864332 ) ( ON ?auto_864333 ?auto_864334 ) ( CLEAR ?auto_864333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_864330 ?auto_864331 ?auto_864332 ?auto_864333 )
      ( MAKE-10PILE ?auto_864330 ?auto_864331 ?auto_864332 ?auto_864333 ?auto_864334 ?auto_864335 ?auto_864336 ?auto_864337 ?auto_864338 ?auto_864339 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864372 - BLOCK
      ?auto_864373 - BLOCK
      ?auto_864374 - BLOCK
      ?auto_864375 - BLOCK
      ?auto_864376 - BLOCK
      ?auto_864377 - BLOCK
      ?auto_864378 - BLOCK
      ?auto_864379 - BLOCK
      ?auto_864380 - BLOCK
      ?auto_864381 - BLOCK
    )
    :vars
    (
      ?auto_864382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864381 ?auto_864382 ) ( ON-TABLE ?auto_864372 ) ( ON ?auto_864373 ?auto_864372 ) ( not ( = ?auto_864372 ?auto_864373 ) ) ( not ( = ?auto_864372 ?auto_864374 ) ) ( not ( = ?auto_864372 ?auto_864375 ) ) ( not ( = ?auto_864372 ?auto_864376 ) ) ( not ( = ?auto_864372 ?auto_864377 ) ) ( not ( = ?auto_864372 ?auto_864378 ) ) ( not ( = ?auto_864372 ?auto_864379 ) ) ( not ( = ?auto_864372 ?auto_864380 ) ) ( not ( = ?auto_864372 ?auto_864381 ) ) ( not ( = ?auto_864372 ?auto_864382 ) ) ( not ( = ?auto_864373 ?auto_864374 ) ) ( not ( = ?auto_864373 ?auto_864375 ) ) ( not ( = ?auto_864373 ?auto_864376 ) ) ( not ( = ?auto_864373 ?auto_864377 ) ) ( not ( = ?auto_864373 ?auto_864378 ) ) ( not ( = ?auto_864373 ?auto_864379 ) ) ( not ( = ?auto_864373 ?auto_864380 ) ) ( not ( = ?auto_864373 ?auto_864381 ) ) ( not ( = ?auto_864373 ?auto_864382 ) ) ( not ( = ?auto_864374 ?auto_864375 ) ) ( not ( = ?auto_864374 ?auto_864376 ) ) ( not ( = ?auto_864374 ?auto_864377 ) ) ( not ( = ?auto_864374 ?auto_864378 ) ) ( not ( = ?auto_864374 ?auto_864379 ) ) ( not ( = ?auto_864374 ?auto_864380 ) ) ( not ( = ?auto_864374 ?auto_864381 ) ) ( not ( = ?auto_864374 ?auto_864382 ) ) ( not ( = ?auto_864375 ?auto_864376 ) ) ( not ( = ?auto_864375 ?auto_864377 ) ) ( not ( = ?auto_864375 ?auto_864378 ) ) ( not ( = ?auto_864375 ?auto_864379 ) ) ( not ( = ?auto_864375 ?auto_864380 ) ) ( not ( = ?auto_864375 ?auto_864381 ) ) ( not ( = ?auto_864375 ?auto_864382 ) ) ( not ( = ?auto_864376 ?auto_864377 ) ) ( not ( = ?auto_864376 ?auto_864378 ) ) ( not ( = ?auto_864376 ?auto_864379 ) ) ( not ( = ?auto_864376 ?auto_864380 ) ) ( not ( = ?auto_864376 ?auto_864381 ) ) ( not ( = ?auto_864376 ?auto_864382 ) ) ( not ( = ?auto_864377 ?auto_864378 ) ) ( not ( = ?auto_864377 ?auto_864379 ) ) ( not ( = ?auto_864377 ?auto_864380 ) ) ( not ( = ?auto_864377 ?auto_864381 ) ) ( not ( = ?auto_864377 ?auto_864382 ) ) ( not ( = ?auto_864378 ?auto_864379 ) ) ( not ( = ?auto_864378 ?auto_864380 ) ) ( not ( = ?auto_864378 ?auto_864381 ) ) ( not ( = ?auto_864378 ?auto_864382 ) ) ( not ( = ?auto_864379 ?auto_864380 ) ) ( not ( = ?auto_864379 ?auto_864381 ) ) ( not ( = ?auto_864379 ?auto_864382 ) ) ( not ( = ?auto_864380 ?auto_864381 ) ) ( not ( = ?auto_864380 ?auto_864382 ) ) ( not ( = ?auto_864381 ?auto_864382 ) ) ( ON ?auto_864380 ?auto_864381 ) ( ON ?auto_864379 ?auto_864380 ) ( ON ?auto_864378 ?auto_864379 ) ( ON ?auto_864377 ?auto_864378 ) ( ON ?auto_864376 ?auto_864377 ) ( ON ?auto_864375 ?auto_864376 ) ( CLEAR ?auto_864373 ) ( ON ?auto_864374 ?auto_864375 ) ( CLEAR ?auto_864374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_864372 ?auto_864373 ?auto_864374 )
      ( MAKE-10PILE ?auto_864372 ?auto_864373 ?auto_864374 ?auto_864375 ?auto_864376 ?auto_864377 ?auto_864378 ?auto_864379 ?auto_864380 ?auto_864381 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864414 - BLOCK
      ?auto_864415 - BLOCK
      ?auto_864416 - BLOCK
      ?auto_864417 - BLOCK
      ?auto_864418 - BLOCK
      ?auto_864419 - BLOCK
      ?auto_864420 - BLOCK
      ?auto_864421 - BLOCK
      ?auto_864422 - BLOCK
      ?auto_864423 - BLOCK
    )
    :vars
    (
      ?auto_864424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864423 ?auto_864424 ) ( ON-TABLE ?auto_864414 ) ( not ( = ?auto_864414 ?auto_864415 ) ) ( not ( = ?auto_864414 ?auto_864416 ) ) ( not ( = ?auto_864414 ?auto_864417 ) ) ( not ( = ?auto_864414 ?auto_864418 ) ) ( not ( = ?auto_864414 ?auto_864419 ) ) ( not ( = ?auto_864414 ?auto_864420 ) ) ( not ( = ?auto_864414 ?auto_864421 ) ) ( not ( = ?auto_864414 ?auto_864422 ) ) ( not ( = ?auto_864414 ?auto_864423 ) ) ( not ( = ?auto_864414 ?auto_864424 ) ) ( not ( = ?auto_864415 ?auto_864416 ) ) ( not ( = ?auto_864415 ?auto_864417 ) ) ( not ( = ?auto_864415 ?auto_864418 ) ) ( not ( = ?auto_864415 ?auto_864419 ) ) ( not ( = ?auto_864415 ?auto_864420 ) ) ( not ( = ?auto_864415 ?auto_864421 ) ) ( not ( = ?auto_864415 ?auto_864422 ) ) ( not ( = ?auto_864415 ?auto_864423 ) ) ( not ( = ?auto_864415 ?auto_864424 ) ) ( not ( = ?auto_864416 ?auto_864417 ) ) ( not ( = ?auto_864416 ?auto_864418 ) ) ( not ( = ?auto_864416 ?auto_864419 ) ) ( not ( = ?auto_864416 ?auto_864420 ) ) ( not ( = ?auto_864416 ?auto_864421 ) ) ( not ( = ?auto_864416 ?auto_864422 ) ) ( not ( = ?auto_864416 ?auto_864423 ) ) ( not ( = ?auto_864416 ?auto_864424 ) ) ( not ( = ?auto_864417 ?auto_864418 ) ) ( not ( = ?auto_864417 ?auto_864419 ) ) ( not ( = ?auto_864417 ?auto_864420 ) ) ( not ( = ?auto_864417 ?auto_864421 ) ) ( not ( = ?auto_864417 ?auto_864422 ) ) ( not ( = ?auto_864417 ?auto_864423 ) ) ( not ( = ?auto_864417 ?auto_864424 ) ) ( not ( = ?auto_864418 ?auto_864419 ) ) ( not ( = ?auto_864418 ?auto_864420 ) ) ( not ( = ?auto_864418 ?auto_864421 ) ) ( not ( = ?auto_864418 ?auto_864422 ) ) ( not ( = ?auto_864418 ?auto_864423 ) ) ( not ( = ?auto_864418 ?auto_864424 ) ) ( not ( = ?auto_864419 ?auto_864420 ) ) ( not ( = ?auto_864419 ?auto_864421 ) ) ( not ( = ?auto_864419 ?auto_864422 ) ) ( not ( = ?auto_864419 ?auto_864423 ) ) ( not ( = ?auto_864419 ?auto_864424 ) ) ( not ( = ?auto_864420 ?auto_864421 ) ) ( not ( = ?auto_864420 ?auto_864422 ) ) ( not ( = ?auto_864420 ?auto_864423 ) ) ( not ( = ?auto_864420 ?auto_864424 ) ) ( not ( = ?auto_864421 ?auto_864422 ) ) ( not ( = ?auto_864421 ?auto_864423 ) ) ( not ( = ?auto_864421 ?auto_864424 ) ) ( not ( = ?auto_864422 ?auto_864423 ) ) ( not ( = ?auto_864422 ?auto_864424 ) ) ( not ( = ?auto_864423 ?auto_864424 ) ) ( ON ?auto_864422 ?auto_864423 ) ( ON ?auto_864421 ?auto_864422 ) ( ON ?auto_864420 ?auto_864421 ) ( ON ?auto_864419 ?auto_864420 ) ( ON ?auto_864418 ?auto_864419 ) ( ON ?auto_864417 ?auto_864418 ) ( ON ?auto_864416 ?auto_864417 ) ( CLEAR ?auto_864414 ) ( ON ?auto_864415 ?auto_864416 ) ( CLEAR ?auto_864415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_864414 ?auto_864415 )
      ( MAKE-10PILE ?auto_864414 ?auto_864415 ?auto_864416 ?auto_864417 ?auto_864418 ?auto_864419 ?auto_864420 ?auto_864421 ?auto_864422 ?auto_864423 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_864456 - BLOCK
      ?auto_864457 - BLOCK
      ?auto_864458 - BLOCK
      ?auto_864459 - BLOCK
      ?auto_864460 - BLOCK
      ?auto_864461 - BLOCK
      ?auto_864462 - BLOCK
      ?auto_864463 - BLOCK
      ?auto_864464 - BLOCK
      ?auto_864465 - BLOCK
    )
    :vars
    (
      ?auto_864466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864465 ?auto_864466 ) ( not ( = ?auto_864456 ?auto_864457 ) ) ( not ( = ?auto_864456 ?auto_864458 ) ) ( not ( = ?auto_864456 ?auto_864459 ) ) ( not ( = ?auto_864456 ?auto_864460 ) ) ( not ( = ?auto_864456 ?auto_864461 ) ) ( not ( = ?auto_864456 ?auto_864462 ) ) ( not ( = ?auto_864456 ?auto_864463 ) ) ( not ( = ?auto_864456 ?auto_864464 ) ) ( not ( = ?auto_864456 ?auto_864465 ) ) ( not ( = ?auto_864456 ?auto_864466 ) ) ( not ( = ?auto_864457 ?auto_864458 ) ) ( not ( = ?auto_864457 ?auto_864459 ) ) ( not ( = ?auto_864457 ?auto_864460 ) ) ( not ( = ?auto_864457 ?auto_864461 ) ) ( not ( = ?auto_864457 ?auto_864462 ) ) ( not ( = ?auto_864457 ?auto_864463 ) ) ( not ( = ?auto_864457 ?auto_864464 ) ) ( not ( = ?auto_864457 ?auto_864465 ) ) ( not ( = ?auto_864457 ?auto_864466 ) ) ( not ( = ?auto_864458 ?auto_864459 ) ) ( not ( = ?auto_864458 ?auto_864460 ) ) ( not ( = ?auto_864458 ?auto_864461 ) ) ( not ( = ?auto_864458 ?auto_864462 ) ) ( not ( = ?auto_864458 ?auto_864463 ) ) ( not ( = ?auto_864458 ?auto_864464 ) ) ( not ( = ?auto_864458 ?auto_864465 ) ) ( not ( = ?auto_864458 ?auto_864466 ) ) ( not ( = ?auto_864459 ?auto_864460 ) ) ( not ( = ?auto_864459 ?auto_864461 ) ) ( not ( = ?auto_864459 ?auto_864462 ) ) ( not ( = ?auto_864459 ?auto_864463 ) ) ( not ( = ?auto_864459 ?auto_864464 ) ) ( not ( = ?auto_864459 ?auto_864465 ) ) ( not ( = ?auto_864459 ?auto_864466 ) ) ( not ( = ?auto_864460 ?auto_864461 ) ) ( not ( = ?auto_864460 ?auto_864462 ) ) ( not ( = ?auto_864460 ?auto_864463 ) ) ( not ( = ?auto_864460 ?auto_864464 ) ) ( not ( = ?auto_864460 ?auto_864465 ) ) ( not ( = ?auto_864460 ?auto_864466 ) ) ( not ( = ?auto_864461 ?auto_864462 ) ) ( not ( = ?auto_864461 ?auto_864463 ) ) ( not ( = ?auto_864461 ?auto_864464 ) ) ( not ( = ?auto_864461 ?auto_864465 ) ) ( not ( = ?auto_864461 ?auto_864466 ) ) ( not ( = ?auto_864462 ?auto_864463 ) ) ( not ( = ?auto_864462 ?auto_864464 ) ) ( not ( = ?auto_864462 ?auto_864465 ) ) ( not ( = ?auto_864462 ?auto_864466 ) ) ( not ( = ?auto_864463 ?auto_864464 ) ) ( not ( = ?auto_864463 ?auto_864465 ) ) ( not ( = ?auto_864463 ?auto_864466 ) ) ( not ( = ?auto_864464 ?auto_864465 ) ) ( not ( = ?auto_864464 ?auto_864466 ) ) ( not ( = ?auto_864465 ?auto_864466 ) ) ( ON ?auto_864464 ?auto_864465 ) ( ON ?auto_864463 ?auto_864464 ) ( ON ?auto_864462 ?auto_864463 ) ( ON ?auto_864461 ?auto_864462 ) ( ON ?auto_864460 ?auto_864461 ) ( ON ?auto_864459 ?auto_864460 ) ( ON ?auto_864458 ?auto_864459 ) ( ON ?auto_864457 ?auto_864458 ) ( ON ?auto_864456 ?auto_864457 ) ( CLEAR ?auto_864456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_864456 )
      ( MAKE-10PILE ?auto_864456 ?auto_864457 ?auto_864458 ?auto_864459 ?auto_864460 ?auto_864461 ?auto_864462 ?auto_864463 ?auto_864464 ?auto_864465 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864499 - BLOCK
      ?auto_864500 - BLOCK
      ?auto_864501 - BLOCK
      ?auto_864502 - BLOCK
      ?auto_864503 - BLOCK
      ?auto_864504 - BLOCK
      ?auto_864505 - BLOCK
      ?auto_864506 - BLOCK
      ?auto_864507 - BLOCK
      ?auto_864508 - BLOCK
      ?auto_864509 - BLOCK
    )
    :vars
    (
      ?auto_864510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_864508 ) ( ON ?auto_864509 ?auto_864510 ) ( CLEAR ?auto_864509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_864499 ) ( ON ?auto_864500 ?auto_864499 ) ( ON ?auto_864501 ?auto_864500 ) ( ON ?auto_864502 ?auto_864501 ) ( ON ?auto_864503 ?auto_864502 ) ( ON ?auto_864504 ?auto_864503 ) ( ON ?auto_864505 ?auto_864504 ) ( ON ?auto_864506 ?auto_864505 ) ( ON ?auto_864507 ?auto_864506 ) ( ON ?auto_864508 ?auto_864507 ) ( not ( = ?auto_864499 ?auto_864500 ) ) ( not ( = ?auto_864499 ?auto_864501 ) ) ( not ( = ?auto_864499 ?auto_864502 ) ) ( not ( = ?auto_864499 ?auto_864503 ) ) ( not ( = ?auto_864499 ?auto_864504 ) ) ( not ( = ?auto_864499 ?auto_864505 ) ) ( not ( = ?auto_864499 ?auto_864506 ) ) ( not ( = ?auto_864499 ?auto_864507 ) ) ( not ( = ?auto_864499 ?auto_864508 ) ) ( not ( = ?auto_864499 ?auto_864509 ) ) ( not ( = ?auto_864499 ?auto_864510 ) ) ( not ( = ?auto_864500 ?auto_864501 ) ) ( not ( = ?auto_864500 ?auto_864502 ) ) ( not ( = ?auto_864500 ?auto_864503 ) ) ( not ( = ?auto_864500 ?auto_864504 ) ) ( not ( = ?auto_864500 ?auto_864505 ) ) ( not ( = ?auto_864500 ?auto_864506 ) ) ( not ( = ?auto_864500 ?auto_864507 ) ) ( not ( = ?auto_864500 ?auto_864508 ) ) ( not ( = ?auto_864500 ?auto_864509 ) ) ( not ( = ?auto_864500 ?auto_864510 ) ) ( not ( = ?auto_864501 ?auto_864502 ) ) ( not ( = ?auto_864501 ?auto_864503 ) ) ( not ( = ?auto_864501 ?auto_864504 ) ) ( not ( = ?auto_864501 ?auto_864505 ) ) ( not ( = ?auto_864501 ?auto_864506 ) ) ( not ( = ?auto_864501 ?auto_864507 ) ) ( not ( = ?auto_864501 ?auto_864508 ) ) ( not ( = ?auto_864501 ?auto_864509 ) ) ( not ( = ?auto_864501 ?auto_864510 ) ) ( not ( = ?auto_864502 ?auto_864503 ) ) ( not ( = ?auto_864502 ?auto_864504 ) ) ( not ( = ?auto_864502 ?auto_864505 ) ) ( not ( = ?auto_864502 ?auto_864506 ) ) ( not ( = ?auto_864502 ?auto_864507 ) ) ( not ( = ?auto_864502 ?auto_864508 ) ) ( not ( = ?auto_864502 ?auto_864509 ) ) ( not ( = ?auto_864502 ?auto_864510 ) ) ( not ( = ?auto_864503 ?auto_864504 ) ) ( not ( = ?auto_864503 ?auto_864505 ) ) ( not ( = ?auto_864503 ?auto_864506 ) ) ( not ( = ?auto_864503 ?auto_864507 ) ) ( not ( = ?auto_864503 ?auto_864508 ) ) ( not ( = ?auto_864503 ?auto_864509 ) ) ( not ( = ?auto_864503 ?auto_864510 ) ) ( not ( = ?auto_864504 ?auto_864505 ) ) ( not ( = ?auto_864504 ?auto_864506 ) ) ( not ( = ?auto_864504 ?auto_864507 ) ) ( not ( = ?auto_864504 ?auto_864508 ) ) ( not ( = ?auto_864504 ?auto_864509 ) ) ( not ( = ?auto_864504 ?auto_864510 ) ) ( not ( = ?auto_864505 ?auto_864506 ) ) ( not ( = ?auto_864505 ?auto_864507 ) ) ( not ( = ?auto_864505 ?auto_864508 ) ) ( not ( = ?auto_864505 ?auto_864509 ) ) ( not ( = ?auto_864505 ?auto_864510 ) ) ( not ( = ?auto_864506 ?auto_864507 ) ) ( not ( = ?auto_864506 ?auto_864508 ) ) ( not ( = ?auto_864506 ?auto_864509 ) ) ( not ( = ?auto_864506 ?auto_864510 ) ) ( not ( = ?auto_864507 ?auto_864508 ) ) ( not ( = ?auto_864507 ?auto_864509 ) ) ( not ( = ?auto_864507 ?auto_864510 ) ) ( not ( = ?auto_864508 ?auto_864509 ) ) ( not ( = ?auto_864508 ?auto_864510 ) ) ( not ( = ?auto_864509 ?auto_864510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_864509 ?auto_864510 )
      ( !STACK ?auto_864509 ?auto_864508 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864545 - BLOCK
      ?auto_864546 - BLOCK
      ?auto_864547 - BLOCK
      ?auto_864548 - BLOCK
      ?auto_864549 - BLOCK
      ?auto_864550 - BLOCK
      ?auto_864551 - BLOCK
      ?auto_864552 - BLOCK
      ?auto_864553 - BLOCK
      ?auto_864554 - BLOCK
      ?auto_864555 - BLOCK
    )
    :vars
    (
      ?auto_864556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864555 ?auto_864556 ) ( ON-TABLE ?auto_864545 ) ( ON ?auto_864546 ?auto_864545 ) ( ON ?auto_864547 ?auto_864546 ) ( ON ?auto_864548 ?auto_864547 ) ( ON ?auto_864549 ?auto_864548 ) ( ON ?auto_864550 ?auto_864549 ) ( ON ?auto_864551 ?auto_864550 ) ( ON ?auto_864552 ?auto_864551 ) ( ON ?auto_864553 ?auto_864552 ) ( not ( = ?auto_864545 ?auto_864546 ) ) ( not ( = ?auto_864545 ?auto_864547 ) ) ( not ( = ?auto_864545 ?auto_864548 ) ) ( not ( = ?auto_864545 ?auto_864549 ) ) ( not ( = ?auto_864545 ?auto_864550 ) ) ( not ( = ?auto_864545 ?auto_864551 ) ) ( not ( = ?auto_864545 ?auto_864552 ) ) ( not ( = ?auto_864545 ?auto_864553 ) ) ( not ( = ?auto_864545 ?auto_864554 ) ) ( not ( = ?auto_864545 ?auto_864555 ) ) ( not ( = ?auto_864545 ?auto_864556 ) ) ( not ( = ?auto_864546 ?auto_864547 ) ) ( not ( = ?auto_864546 ?auto_864548 ) ) ( not ( = ?auto_864546 ?auto_864549 ) ) ( not ( = ?auto_864546 ?auto_864550 ) ) ( not ( = ?auto_864546 ?auto_864551 ) ) ( not ( = ?auto_864546 ?auto_864552 ) ) ( not ( = ?auto_864546 ?auto_864553 ) ) ( not ( = ?auto_864546 ?auto_864554 ) ) ( not ( = ?auto_864546 ?auto_864555 ) ) ( not ( = ?auto_864546 ?auto_864556 ) ) ( not ( = ?auto_864547 ?auto_864548 ) ) ( not ( = ?auto_864547 ?auto_864549 ) ) ( not ( = ?auto_864547 ?auto_864550 ) ) ( not ( = ?auto_864547 ?auto_864551 ) ) ( not ( = ?auto_864547 ?auto_864552 ) ) ( not ( = ?auto_864547 ?auto_864553 ) ) ( not ( = ?auto_864547 ?auto_864554 ) ) ( not ( = ?auto_864547 ?auto_864555 ) ) ( not ( = ?auto_864547 ?auto_864556 ) ) ( not ( = ?auto_864548 ?auto_864549 ) ) ( not ( = ?auto_864548 ?auto_864550 ) ) ( not ( = ?auto_864548 ?auto_864551 ) ) ( not ( = ?auto_864548 ?auto_864552 ) ) ( not ( = ?auto_864548 ?auto_864553 ) ) ( not ( = ?auto_864548 ?auto_864554 ) ) ( not ( = ?auto_864548 ?auto_864555 ) ) ( not ( = ?auto_864548 ?auto_864556 ) ) ( not ( = ?auto_864549 ?auto_864550 ) ) ( not ( = ?auto_864549 ?auto_864551 ) ) ( not ( = ?auto_864549 ?auto_864552 ) ) ( not ( = ?auto_864549 ?auto_864553 ) ) ( not ( = ?auto_864549 ?auto_864554 ) ) ( not ( = ?auto_864549 ?auto_864555 ) ) ( not ( = ?auto_864549 ?auto_864556 ) ) ( not ( = ?auto_864550 ?auto_864551 ) ) ( not ( = ?auto_864550 ?auto_864552 ) ) ( not ( = ?auto_864550 ?auto_864553 ) ) ( not ( = ?auto_864550 ?auto_864554 ) ) ( not ( = ?auto_864550 ?auto_864555 ) ) ( not ( = ?auto_864550 ?auto_864556 ) ) ( not ( = ?auto_864551 ?auto_864552 ) ) ( not ( = ?auto_864551 ?auto_864553 ) ) ( not ( = ?auto_864551 ?auto_864554 ) ) ( not ( = ?auto_864551 ?auto_864555 ) ) ( not ( = ?auto_864551 ?auto_864556 ) ) ( not ( = ?auto_864552 ?auto_864553 ) ) ( not ( = ?auto_864552 ?auto_864554 ) ) ( not ( = ?auto_864552 ?auto_864555 ) ) ( not ( = ?auto_864552 ?auto_864556 ) ) ( not ( = ?auto_864553 ?auto_864554 ) ) ( not ( = ?auto_864553 ?auto_864555 ) ) ( not ( = ?auto_864553 ?auto_864556 ) ) ( not ( = ?auto_864554 ?auto_864555 ) ) ( not ( = ?auto_864554 ?auto_864556 ) ) ( not ( = ?auto_864555 ?auto_864556 ) ) ( CLEAR ?auto_864553 ) ( ON ?auto_864554 ?auto_864555 ) ( CLEAR ?auto_864554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_864545 ?auto_864546 ?auto_864547 ?auto_864548 ?auto_864549 ?auto_864550 ?auto_864551 ?auto_864552 ?auto_864553 ?auto_864554 )
      ( MAKE-11PILE ?auto_864545 ?auto_864546 ?auto_864547 ?auto_864548 ?auto_864549 ?auto_864550 ?auto_864551 ?auto_864552 ?auto_864553 ?auto_864554 ?auto_864555 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864591 - BLOCK
      ?auto_864592 - BLOCK
      ?auto_864593 - BLOCK
      ?auto_864594 - BLOCK
      ?auto_864595 - BLOCK
      ?auto_864596 - BLOCK
      ?auto_864597 - BLOCK
      ?auto_864598 - BLOCK
      ?auto_864599 - BLOCK
      ?auto_864600 - BLOCK
      ?auto_864601 - BLOCK
    )
    :vars
    (
      ?auto_864602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864601 ?auto_864602 ) ( ON-TABLE ?auto_864591 ) ( ON ?auto_864592 ?auto_864591 ) ( ON ?auto_864593 ?auto_864592 ) ( ON ?auto_864594 ?auto_864593 ) ( ON ?auto_864595 ?auto_864594 ) ( ON ?auto_864596 ?auto_864595 ) ( ON ?auto_864597 ?auto_864596 ) ( ON ?auto_864598 ?auto_864597 ) ( not ( = ?auto_864591 ?auto_864592 ) ) ( not ( = ?auto_864591 ?auto_864593 ) ) ( not ( = ?auto_864591 ?auto_864594 ) ) ( not ( = ?auto_864591 ?auto_864595 ) ) ( not ( = ?auto_864591 ?auto_864596 ) ) ( not ( = ?auto_864591 ?auto_864597 ) ) ( not ( = ?auto_864591 ?auto_864598 ) ) ( not ( = ?auto_864591 ?auto_864599 ) ) ( not ( = ?auto_864591 ?auto_864600 ) ) ( not ( = ?auto_864591 ?auto_864601 ) ) ( not ( = ?auto_864591 ?auto_864602 ) ) ( not ( = ?auto_864592 ?auto_864593 ) ) ( not ( = ?auto_864592 ?auto_864594 ) ) ( not ( = ?auto_864592 ?auto_864595 ) ) ( not ( = ?auto_864592 ?auto_864596 ) ) ( not ( = ?auto_864592 ?auto_864597 ) ) ( not ( = ?auto_864592 ?auto_864598 ) ) ( not ( = ?auto_864592 ?auto_864599 ) ) ( not ( = ?auto_864592 ?auto_864600 ) ) ( not ( = ?auto_864592 ?auto_864601 ) ) ( not ( = ?auto_864592 ?auto_864602 ) ) ( not ( = ?auto_864593 ?auto_864594 ) ) ( not ( = ?auto_864593 ?auto_864595 ) ) ( not ( = ?auto_864593 ?auto_864596 ) ) ( not ( = ?auto_864593 ?auto_864597 ) ) ( not ( = ?auto_864593 ?auto_864598 ) ) ( not ( = ?auto_864593 ?auto_864599 ) ) ( not ( = ?auto_864593 ?auto_864600 ) ) ( not ( = ?auto_864593 ?auto_864601 ) ) ( not ( = ?auto_864593 ?auto_864602 ) ) ( not ( = ?auto_864594 ?auto_864595 ) ) ( not ( = ?auto_864594 ?auto_864596 ) ) ( not ( = ?auto_864594 ?auto_864597 ) ) ( not ( = ?auto_864594 ?auto_864598 ) ) ( not ( = ?auto_864594 ?auto_864599 ) ) ( not ( = ?auto_864594 ?auto_864600 ) ) ( not ( = ?auto_864594 ?auto_864601 ) ) ( not ( = ?auto_864594 ?auto_864602 ) ) ( not ( = ?auto_864595 ?auto_864596 ) ) ( not ( = ?auto_864595 ?auto_864597 ) ) ( not ( = ?auto_864595 ?auto_864598 ) ) ( not ( = ?auto_864595 ?auto_864599 ) ) ( not ( = ?auto_864595 ?auto_864600 ) ) ( not ( = ?auto_864595 ?auto_864601 ) ) ( not ( = ?auto_864595 ?auto_864602 ) ) ( not ( = ?auto_864596 ?auto_864597 ) ) ( not ( = ?auto_864596 ?auto_864598 ) ) ( not ( = ?auto_864596 ?auto_864599 ) ) ( not ( = ?auto_864596 ?auto_864600 ) ) ( not ( = ?auto_864596 ?auto_864601 ) ) ( not ( = ?auto_864596 ?auto_864602 ) ) ( not ( = ?auto_864597 ?auto_864598 ) ) ( not ( = ?auto_864597 ?auto_864599 ) ) ( not ( = ?auto_864597 ?auto_864600 ) ) ( not ( = ?auto_864597 ?auto_864601 ) ) ( not ( = ?auto_864597 ?auto_864602 ) ) ( not ( = ?auto_864598 ?auto_864599 ) ) ( not ( = ?auto_864598 ?auto_864600 ) ) ( not ( = ?auto_864598 ?auto_864601 ) ) ( not ( = ?auto_864598 ?auto_864602 ) ) ( not ( = ?auto_864599 ?auto_864600 ) ) ( not ( = ?auto_864599 ?auto_864601 ) ) ( not ( = ?auto_864599 ?auto_864602 ) ) ( not ( = ?auto_864600 ?auto_864601 ) ) ( not ( = ?auto_864600 ?auto_864602 ) ) ( not ( = ?auto_864601 ?auto_864602 ) ) ( ON ?auto_864600 ?auto_864601 ) ( CLEAR ?auto_864598 ) ( ON ?auto_864599 ?auto_864600 ) ( CLEAR ?auto_864599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_864591 ?auto_864592 ?auto_864593 ?auto_864594 ?auto_864595 ?auto_864596 ?auto_864597 ?auto_864598 ?auto_864599 )
      ( MAKE-11PILE ?auto_864591 ?auto_864592 ?auto_864593 ?auto_864594 ?auto_864595 ?auto_864596 ?auto_864597 ?auto_864598 ?auto_864599 ?auto_864600 ?auto_864601 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864637 - BLOCK
      ?auto_864638 - BLOCK
      ?auto_864639 - BLOCK
      ?auto_864640 - BLOCK
      ?auto_864641 - BLOCK
      ?auto_864642 - BLOCK
      ?auto_864643 - BLOCK
      ?auto_864644 - BLOCK
      ?auto_864645 - BLOCK
      ?auto_864646 - BLOCK
      ?auto_864647 - BLOCK
    )
    :vars
    (
      ?auto_864648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864647 ?auto_864648 ) ( ON-TABLE ?auto_864637 ) ( ON ?auto_864638 ?auto_864637 ) ( ON ?auto_864639 ?auto_864638 ) ( ON ?auto_864640 ?auto_864639 ) ( ON ?auto_864641 ?auto_864640 ) ( ON ?auto_864642 ?auto_864641 ) ( ON ?auto_864643 ?auto_864642 ) ( not ( = ?auto_864637 ?auto_864638 ) ) ( not ( = ?auto_864637 ?auto_864639 ) ) ( not ( = ?auto_864637 ?auto_864640 ) ) ( not ( = ?auto_864637 ?auto_864641 ) ) ( not ( = ?auto_864637 ?auto_864642 ) ) ( not ( = ?auto_864637 ?auto_864643 ) ) ( not ( = ?auto_864637 ?auto_864644 ) ) ( not ( = ?auto_864637 ?auto_864645 ) ) ( not ( = ?auto_864637 ?auto_864646 ) ) ( not ( = ?auto_864637 ?auto_864647 ) ) ( not ( = ?auto_864637 ?auto_864648 ) ) ( not ( = ?auto_864638 ?auto_864639 ) ) ( not ( = ?auto_864638 ?auto_864640 ) ) ( not ( = ?auto_864638 ?auto_864641 ) ) ( not ( = ?auto_864638 ?auto_864642 ) ) ( not ( = ?auto_864638 ?auto_864643 ) ) ( not ( = ?auto_864638 ?auto_864644 ) ) ( not ( = ?auto_864638 ?auto_864645 ) ) ( not ( = ?auto_864638 ?auto_864646 ) ) ( not ( = ?auto_864638 ?auto_864647 ) ) ( not ( = ?auto_864638 ?auto_864648 ) ) ( not ( = ?auto_864639 ?auto_864640 ) ) ( not ( = ?auto_864639 ?auto_864641 ) ) ( not ( = ?auto_864639 ?auto_864642 ) ) ( not ( = ?auto_864639 ?auto_864643 ) ) ( not ( = ?auto_864639 ?auto_864644 ) ) ( not ( = ?auto_864639 ?auto_864645 ) ) ( not ( = ?auto_864639 ?auto_864646 ) ) ( not ( = ?auto_864639 ?auto_864647 ) ) ( not ( = ?auto_864639 ?auto_864648 ) ) ( not ( = ?auto_864640 ?auto_864641 ) ) ( not ( = ?auto_864640 ?auto_864642 ) ) ( not ( = ?auto_864640 ?auto_864643 ) ) ( not ( = ?auto_864640 ?auto_864644 ) ) ( not ( = ?auto_864640 ?auto_864645 ) ) ( not ( = ?auto_864640 ?auto_864646 ) ) ( not ( = ?auto_864640 ?auto_864647 ) ) ( not ( = ?auto_864640 ?auto_864648 ) ) ( not ( = ?auto_864641 ?auto_864642 ) ) ( not ( = ?auto_864641 ?auto_864643 ) ) ( not ( = ?auto_864641 ?auto_864644 ) ) ( not ( = ?auto_864641 ?auto_864645 ) ) ( not ( = ?auto_864641 ?auto_864646 ) ) ( not ( = ?auto_864641 ?auto_864647 ) ) ( not ( = ?auto_864641 ?auto_864648 ) ) ( not ( = ?auto_864642 ?auto_864643 ) ) ( not ( = ?auto_864642 ?auto_864644 ) ) ( not ( = ?auto_864642 ?auto_864645 ) ) ( not ( = ?auto_864642 ?auto_864646 ) ) ( not ( = ?auto_864642 ?auto_864647 ) ) ( not ( = ?auto_864642 ?auto_864648 ) ) ( not ( = ?auto_864643 ?auto_864644 ) ) ( not ( = ?auto_864643 ?auto_864645 ) ) ( not ( = ?auto_864643 ?auto_864646 ) ) ( not ( = ?auto_864643 ?auto_864647 ) ) ( not ( = ?auto_864643 ?auto_864648 ) ) ( not ( = ?auto_864644 ?auto_864645 ) ) ( not ( = ?auto_864644 ?auto_864646 ) ) ( not ( = ?auto_864644 ?auto_864647 ) ) ( not ( = ?auto_864644 ?auto_864648 ) ) ( not ( = ?auto_864645 ?auto_864646 ) ) ( not ( = ?auto_864645 ?auto_864647 ) ) ( not ( = ?auto_864645 ?auto_864648 ) ) ( not ( = ?auto_864646 ?auto_864647 ) ) ( not ( = ?auto_864646 ?auto_864648 ) ) ( not ( = ?auto_864647 ?auto_864648 ) ) ( ON ?auto_864646 ?auto_864647 ) ( ON ?auto_864645 ?auto_864646 ) ( CLEAR ?auto_864643 ) ( ON ?auto_864644 ?auto_864645 ) ( CLEAR ?auto_864644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_864637 ?auto_864638 ?auto_864639 ?auto_864640 ?auto_864641 ?auto_864642 ?auto_864643 ?auto_864644 )
      ( MAKE-11PILE ?auto_864637 ?auto_864638 ?auto_864639 ?auto_864640 ?auto_864641 ?auto_864642 ?auto_864643 ?auto_864644 ?auto_864645 ?auto_864646 ?auto_864647 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864683 - BLOCK
      ?auto_864684 - BLOCK
      ?auto_864685 - BLOCK
      ?auto_864686 - BLOCK
      ?auto_864687 - BLOCK
      ?auto_864688 - BLOCK
      ?auto_864689 - BLOCK
      ?auto_864690 - BLOCK
      ?auto_864691 - BLOCK
      ?auto_864692 - BLOCK
      ?auto_864693 - BLOCK
    )
    :vars
    (
      ?auto_864694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864693 ?auto_864694 ) ( ON-TABLE ?auto_864683 ) ( ON ?auto_864684 ?auto_864683 ) ( ON ?auto_864685 ?auto_864684 ) ( ON ?auto_864686 ?auto_864685 ) ( ON ?auto_864687 ?auto_864686 ) ( ON ?auto_864688 ?auto_864687 ) ( not ( = ?auto_864683 ?auto_864684 ) ) ( not ( = ?auto_864683 ?auto_864685 ) ) ( not ( = ?auto_864683 ?auto_864686 ) ) ( not ( = ?auto_864683 ?auto_864687 ) ) ( not ( = ?auto_864683 ?auto_864688 ) ) ( not ( = ?auto_864683 ?auto_864689 ) ) ( not ( = ?auto_864683 ?auto_864690 ) ) ( not ( = ?auto_864683 ?auto_864691 ) ) ( not ( = ?auto_864683 ?auto_864692 ) ) ( not ( = ?auto_864683 ?auto_864693 ) ) ( not ( = ?auto_864683 ?auto_864694 ) ) ( not ( = ?auto_864684 ?auto_864685 ) ) ( not ( = ?auto_864684 ?auto_864686 ) ) ( not ( = ?auto_864684 ?auto_864687 ) ) ( not ( = ?auto_864684 ?auto_864688 ) ) ( not ( = ?auto_864684 ?auto_864689 ) ) ( not ( = ?auto_864684 ?auto_864690 ) ) ( not ( = ?auto_864684 ?auto_864691 ) ) ( not ( = ?auto_864684 ?auto_864692 ) ) ( not ( = ?auto_864684 ?auto_864693 ) ) ( not ( = ?auto_864684 ?auto_864694 ) ) ( not ( = ?auto_864685 ?auto_864686 ) ) ( not ( = ?auto_864685 ?auto_864687 ) ) ( not ( = ?auto_864685 ?auto_864688 ) ) ( not ( = ?auto_864685 ?auto_864689 ) ) ( not ( = ?auto_864685 ?auto_864690 ) ) ( not ( = ?auto_864685 ?auto_864691 ) ) ( not ( = ?auto_864685 ?auto_864692 ) ) ( not ( = ?auto_864685 ?auto_864693 ) ) ( not ( = ?auto_864685 ?auto_864694 ) ) ( not ( = ?auto_864686 ?auto_864687 ) ) ( not ( = ?auto_864686 ?auto_864688 ) ) ( not ( = ?auto_864686 ?auto_864689 ) ) ( not ( = ?auto_864686 ?auto_864690 ) ) ( not ( = ?auto_864686 ?auto_864691 ) ) ( not ( = ?auto_864686 ?auto_864692 ) ) ( not ( = ?auto_864686 ?auto_864693 ) ) ( not ( = ?auto_864686 ?auto_864694 ) ) ( not ( = ?auto_864687 ?auto_864688 ) ) ( not ( = ?auto_864687 ?auto_864689 ) ) ( not ( = ?auto_864687 ?auto_864690 ) ) ( not ( = ?auto_864687 ?auto_864691 ) ) ( not ( = ?auto_864687 ?auto_864692 ) ) ( not ( = ?auto_864687 ?auto_864693 ) ) ( not ( = ?auto_864687 ?auto_864694 ) ) ( not ( = ?auto_864688 ?auto_864689 ) ) ( not ( = ?auto_864688 ?auto_864690 ) ) ( not ( = ?auto_864688 ?auto_864691 ) ) ( not ( = ?auto_864688 ?auto_864692 ) ) ( not ( = ?auto_864688 ?auto_864693 ) ) ( not ( = ?auto_864688 ?auto_864694 ) ) ( not ( = ?auto_864689 ?auto_864690 ) ) ( not ( = ?auto_864689 ?auto_864691 ) ) ( not ( = ?auto_864689 ?auto_864692 ) ) ( not ( = ?auto_864689 ?auto_864693 ) ) ( not ( = ?auto_864689 ?auto_864694 ) ) ( not ( = ?auto_864690 ?auto_864691 ) ) ( not ( = ?auto_864690 ?auto_864692 ) ) ( not ( = ?auto_864690 ?auto_864693 ) ) ( not ( = ?auto_864690 ?auto_864694 ) ) ( not ( = ?auto_864691 ?auto_864692 ) ) ( not ( = ?auto_864691 ?auto_864693 ) ) ( not ( = ?auto_864691 ?auto_864694 ) ) ( not ( = ?auto_864692 ?auto_864693 ) ) ( not ( = ?auto_864692 ?auto_864694 ) ) ( not ( = ?auto_864693 ?auto_864694 ) ) ( ON ?auto_864692 ?auto_864693 ) ( ON ?auto_864691 ?auto_864692 ) ( ON ?auto_864690 ?auto_864691 ) ( CLEAR ?auto_864688 ) ( ON ?auto_864689 ?auto_864690 ) ( CLEAR ?auto_864689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_864683 ?auto_864684 ?auto_864685 ?auto_864686 ?auto_864687 ?auto_864688 ?auto_864689 )
      ( MAKE-11PILE ?auto_864683 ?auto_864684 ?auto_864685 ?auto_864686 ?auto_864687 ?auto_864688 ?auto_864689 ?auto_864690 ?auto_864691 ?auto_864692 ?auto_864693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864729 - BLOCK
      ?auto_864730 - BLOCK
      ?auto_864731 - BLOCK
      ?auto_864732 - BLOCK
      ?auto_864733 - BLOCK
      ?auto_864734 - BLOCK
      ?auto_864735 - BLOCK
      ?auto_864736 - BLOCK
      ?auto_864737 - BLOCK
      ?auto_864738 - BLOCK
      ?auto_864739 - BLOCK
    )
    :vars
    (
      ?auto_864740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864739 ?auto_864740 ) ( ON-TABLE ?auto_864729 ) ( ON ?auto_864730 ?auto_864729 ) ( ON ?auto_864731 ?auto_864730 ) ( ON ?auto_864732 ?auto_864731 ) ( ON ?auto_864733 ?auto_864732 ) ( not ( = ?auto_864729 ?auto_864730 ) ) ( not ( = ?auto_864729 ?auto_864731 ) ) ( not ( = ?auto_864729 ?auto_864732 ) ) ( not ( = ?auto_864729 ?auto_864733 ) ) ( not ( = ?auto_864729 ?auto_864734 ) ) ( not ( = ?auto_864729 ?auto_864735 ) ) ( not ( = ?auto_864729 ?auto_864736 ) ) ( not ( = ?auto_864729 ?auto_864737 ) ) ( not ( = ?auto_864729 ?auto_864738 ) ) ( not ( = ?auto_864729 ?auto_864739 ) ) ( not ( = ?auto_864729 ?auto_864740 ) ) ( not ( = ?auto_864730 ?auto_864731 ) ) ( not ( = ?auto_864730 ?auto_864732 ) ) ( not ( = ?auto_864730 ?auto_864733 ) ) ( not ( = ?auto_864730 ?auto_864734 ) ) ( not ( = ?auto_864730 ?auto_864735 ) ) ( not ( = ?auto_864730 ?auto_864736 ) ) ( not ( = ?auto_864730 ?auto_864737 ) ) ( not ( = ?auto_864730 ?auto_864738 ) ) ( not ( = ?auto_864730 ?auto_864739 ) ) ( not ( = ?auto_864730 ?auto_864740 ) ) ( not ( = ?auto_864731 ?auto_864732 ) ) ( not ( = ?auto_864731 ?auto_864733 ) ) ( not ( = ?auto_864731 ?auto_864734 ) ) ( not ( = ?auto_864731 ?auto_864735 ) ) ( not ( = ?auto_864731 ?auto_864736 ) ) ( not ( = ?auto_864731 ?auto_864737 ) ) ( not ( = ?auto_864731 ?auto_864738 ) ) ( not ( = ?auto_864731 ?auto_864739 ) ) ( not ( = ?auto_864731 ?auto_864740 ) ) ( not ( = ?auto_864732 ?auto_864733 ) ) ( not ( = ?auto_864732 ?auto_864734 ) ) ( not ( = ?auto_864732 ?auto_864735 ) ) ( not ( = ?auto_864732 ?auto_864736 ) ) ( not ( = ?auto_864732 ?auto_864737 ) ) ( not ( = ?auto_864732 ?auto_864738 ) ) ( not ( = ?auto_864732 ?auto_864739 ) ) ( not ( = ?auto_864732 ?auto_864740 ) ) ( not ( = ?auto_864733 ?auto_864734 ) ) ( not ( = ?auto_864733 ?auto_864735 ) ) ( not ( = ?auto_864733 ?auto_864736 ) ) ( not ( = ?auto_864733 ?auto_864737 ) ) ( not ( = ?auto_864733 ?auto_864738 ) ) ( not ( = ?auto_864733 ?auto_864739 ) ) ( not ( = ?auto_864733 ?auto_864740 ) ) ( not ( = ?auto_864734 ?auto_864735 ) ) ( not ( = ?auto_864734 ?auto_864736 ) ) ( not ( = ?auto_864734 ?auto_864737 ) ) ( not ( = ?auto_864734 ?auto_864738 ) ) ( not ( = ?auto_864734 ?auto_864739 ) ) ( not ( = ?auto_864734 ?auto_864740 ) ) ( not ( = ?auto_864735 ?auto_864736 ) ) ( not ( = ?auto_864735 ?auto_864737 ) ) ( not ( = ?auto_864735 ?auto_864738 ) ) ( not ( = ?auto_864735 ?auto_864739 ) ) ( not ( = ?auto_864735 ?auto_864740 ) ) ( not ( = ?auto_864736 ?auto_864737 ) ) ( not ( = ?auto_864736 ?auto_864738 ) ) ( not ( = ?auto_864736 ?auto_864739 ) ) ( not ( = ?auto_864736 ?auto_864740 ) ) ( not ( = ?auto_864737 ?auto_864738 ) ) ( not ( = ?auto_864737 ?auto_864739 ) ) ( not ( = ?auto_864737 ?auto_864740 ) ) ( not ( = ?auto_864738 ?auto_864739 ) ) ( not ( = ?auto_864738 ?auto_864740 ) ) ( not ( = ?auto_864739 ?auto_864740 ) ) ( ON ?auto_864738 ?auto_864739 ) ( ON ?auto_864737 ?auto_864738 ) ( ON ?auto_864736 ?auto_864737 ) ( ON ?auto_864735 ?auto_864736 ) ( CLEAR ?auto_864733 ) ( ON ?auto_864734 ?auto_864735 ) ( CLEAR ?auto_864734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_864729 ?auto_864730 ?auto_864731 ?auto_864732 ?auto_864733 ?auto_864734 )
      ( MAKE-11PILE ?auto_864729 ?auto_864730 ?auto_864731 ?auto_864732 ?auto_864733 ?auto_864734 ?auto_864735 ?auto_864736 ?auto_864737 ?auto_864738 ?auto_864739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864775 - BLOCK
      ?auto_864776 - BLOCK
      ?auto_864777 - BLOCK
      ?auto_864778 - BLOCK
      ?auto_864779 - BLOCK
      ?auto_864780 - BLOCK
      ?auto_864781 - BLOCK
      ?auto_864782 - BLOCK
      ?auto_864783 - BLOCK
      ?auto_864784 - BLOCK
      ?auto_864785 - BLOCK
    )
    :vars
    (
      ?auto_864786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864785 ?auto_864786 ) ( ON-TABLE ?auto_864775 ) ( ON ?auto_864776 ?auto_864775 ) ( ON ?auto_864777 ?auto_864776 ) ( ON ?auto_864778 ?auto_864777 ) ( not ( = ?auto_864775 ?auto_864776 ) ) ( not ( = ?auto_864775 ?auto_864777 ) ) ( not ( = ?auto_864775 ?auto_864778 ) ) ( not ( = ?auto_864775 ?auto_864779 ) ) ( not ( = ?auto_864775 ?auto_864780 ) ) ( not ( = ?auto_864775 ?auto_864781 ) ) ( not ( = ?auto_864775 ?auto_864782 ) ) ( not ( = ?auto_864775 ?auto_864783 ) ) ( not ( = ?auto_864775 ?auto_864784 ) ) ( not ( = ?auto_864775 ?auto_864785 ) ) ( not ( = ?auto_864775 ?auto_864786 ) ) ( not ( = ?auto_864776 ?auto_864777 ) ) ( not ( = ?auto_864776 ?auto_864778 ) ) ( not ( = ?auto_864776 ?auto_864779 ) ) ( not ( = ?auto_864776 ?auto_864780 ) ) ( not ( = ?auto_864776 ?auto_864781 ) ) ( not ( = ?auto_864776 ?auto_864782 ) ) ( not ( = ?auto_864776 ?auto_864783 ) ) ( not ( = ?auto_864776 ?auto_864784 ) ) ( not ( = ?auto_864776 ?auto_864785 ) ) ( not ( = ?auto_864776 ?auto_864786 ) ) ( not ( = ?auto_864777 ?auto_864778 ) ) ( not ( = ?auto_864777 ?auto_864779 ) ) ( not ( = ?auto_864777 ?auto_864780 ) ) ( not ( = ?auto_864777 ?auto_864781 ) ) ( not ( = ?auto_864777 ?auto_864782 ) ) ( not ( = ?auto_864777 ?auto_864783 ) ) ( not ( = ?auto_864777 ?auto_864784 ) ) ( not ( = ?auto_864777 ?auto_864785 ) ) ( not ( = ?auto_864777 ?auto_864786 ) ) ( not ( = ?auto_864778 ?auto_864779 ) ) ( not ( = ?auto_864778 ?auto_864780 ) ) ( not ( = ?auto_864778 ?auto_864781 ) ) ( not ( = ?auto_864778 ?auto_864782 ) ) ( not ( = ?auto_864778 ?auto_864783 ) ) ( not ( = ?auto_864778 ?auto_864784 ) ) ( not ( = ?auto_864778 ?auto_864785 ) ) ( not ( = ?auto_864778 ?auto_864786 ) ) ( not ( = ?auto_864779 ?auto_864780 ) ) ( not ( = ?auto_864779 ?auto_864781 ) ) ( not ( = ?auto_864779 ?auto_864782 ) ) ( not ( = ?auto_864779 ?auto_864783 ) ) ( not ( = ?auto_864779 ?auto_864784 ) ) ( not ( = ?auto_864779 ?auto_864785 ) ) ( not ( = ?auto_864779 ?auto_864786 ) ) ( not ( = ?auto_864780 ?auto_864781 ) ) ( not ( = ?auto_864780 ?auto_864782 ) ) ( not ( = ?auto_864780 ?auto_864783 ) ) ( not ( = ?auto_864780 ?auto_864784 ) ) ( not ( = ?auto_864780 ?auto_864785 ) ) ( not ( = ?auto_864780 ?auto_864786 ) ) ( not ( = ?auto_864781 ?auto_864782 ) ) ( not ( = ?auto_864781 ?auto_864783 ) ) ( not ( = ?auto_864781 ?auto_864784 ) ) ( not ( = ?auto_864781 ?auto_864785 ) ) ( not ( = ?auto_864781 ?auto_864786 ) ) ( not ( = ?auto_864782 ?auto_864783 ) ) ( not ( = ?auto_864782 ?auto_864784 ) ) ( not ( = ?auto_864782 ?auto_864785 ) ) ( not ( = ?auto_864782 ?auto_864786 ) ) ( not ( = ?auto_864783 ?auto_864784 ) ) ( not ( = ?auto_864783 ?auto_864785 ) ) ( not ( = ?auto_864783 ?auto_864786 ) ) ( not ( = ?auto_864784 ?auto_864785 ) ) ( not ( = ?auto_864784 ?auto_864786 ) ) ( not ( = ?auto_864785 ?auto_864786 ) ) ( ON ?auto_864784 ?auto_864785 ) ( ON ?auto_864783 ?auto_864784 ) ( ON ?auto_864782 ?auto_864783 ) ( ON ?auto_864781 ?auto_864782 ) ( ON ?auto_864780 ?auto_864781 ) ( CLEAR ?auto_864778 ) ( ON ?auto_864779 ?auto_864780 ) ( CLEAR ?auto_864779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_864775 ?auto_864776 ?auto_864777 ?auto_864778 ?auto_864779 )
      ( MAKE-11PILE ?auto_864775 ?auto_864776 ?auto_864777 ?auto_864778 ?auto_864779 ?auto_864780 ?auto_864781 ?auto_864782 ?auto_864783 ?auto_864784 ?auto_864785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864821 - BLOCK
      ?auto_864822 - BLOCK
      ?auto_864823 - BLOCK
      ?auto_864824 - BLOCK
      ?auto_864825 - BLOCK
      ?auto_864826 - BLOCK
      ?auto_864827 - BLOCK
      ?auto_864828 - BLOCK
      ?auto_864829 - BLOCK
      ?auto_864830 - BLOCK
      ?auto_864831 - BLOCK
    )
    :vars
    (
      ?auto_864832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864831 ?auto_864832 ) ( ON-TABLE ?auto_864821 ) ( ON ?auto_864822 ?auto_864821 ) ( ON ?auto_864823 ?auto_864822 ) ( not ( = ?auto_864821 ?auto_864822 ) ) ( not ( = ?auto_864821 ?auto_864823 ) ) ( not ( = ?auto_864821 ?auto_864824 ) ) ( not ( = ?auto_864821 ?auto_864825 ) ) ( not ( = ?auto_864821 ?auto_864826 ) ) ( not ( = ?auto_864821 ?auto_864827 ) ) ( not ( = ?auto_864821 ?auto_864828 ) ) ( not ( = ?auto_864821 ?auto_864829 ) ) ( not ( = ?auto_864821 ?auto_864830 ) ) ( not ( = ?auto_864821 ?auto_864831 ) ) ( not ( = ?auto_864821 ?auto_864832 ) ) ( not ( = ?auto_864822 ?auto_864823 ) ) ( not ( = ?auto_864822 ?auto_864824 ) ) ( not ( = ?auto_864822 ?auto_864825 ) ) ( not ( = ?auto_864822 ?auto_864826 ) ) ( not ( = ?auto_864822 ?auto_864827 ) ) ( not ( = ?auto_864822 ?auto_864828 ) ) ( not ( = ?auto_864822 ?auto_864829 ) ) ( not ( = ?auto_864822 ?auto_864830 ) ) ( not ( = ?auto_864822 ?auto_864831 ) ) ( not ( = ?auto_864822 ?auto_864832 ) ) ( not ( = ?auto_864823 ?auto_864824 ) ) ( not ( = ?auto_864823 ?auto_864825 ) ) ( not ( = ?auto_864823 ?auto_864826 ) ) ( not ( = ?auto_864823 ?auto_864827 ) ) ( not ( = ?auto_864823 ?auto_864828 ) ) ( not ( = ?auto_864823 ?auto_864829 ) ) ( not ( = ?auto_864823 ?auto_864830 ) ) ( not ( = ?auto_864823 ?auto_864831 ) ) ( not ( = ?auto_864823 ?auto_864832 ) ) ( not ( = ?auto_864824 ?auto_864825 ) ) ( not ( = ?auto_864824 ?auto_864826 ) ) ( not ( = ?auto_864824 ?auto_864827 ) ) ( not ( = ?auto_864824 ?auto_864828 ) ) ( not ( = ?auto_864824 ?auto_864829 ) ) ( not ( = ?auto_864824 ?auto_864830 ) ) ( not ( = ?auto_864824 ?auto_864831 ) ) ( not ( = ?auto_864824 ?auto_864832 ) ) ( not ( = ?auto_864825 ?auto_864826 ) ) ( not ( = ?auto_864825 ?auto_864827 ) ) ( not ( = ?auto_864825 ?auto_864828 ) ) ( not ( = ?auto_864825 ?auto_864829 ) ) ( not ( = ?auto_864825 ?auto_864830 ) ) ( not ( = ?auto_864825 ?auto_864831 ) ) ( not ( = ?auto_864825 ?auto_864832 ) ) ( not ( = ?auto_864826 ?auto_864827 ) ) ( not ( = ?auto_864826 ?auto_864828 ) ) ( not ( = ?auto_864826 ?auto_864829 ) ) ( not ( = ?auto_864826 ?auto_864830 ) ) ( not ( = ?auto_864826 ?auto_864831 ) ) ( not ( = ?auto_864826 ?auto_864832 ) ) ( not ( = ?auto_864827 ?auto_864828 ) ) ( not ( = ?auto_864827 ?auto_864829 ) ) ( not ( = ?auto_864827 ?auto_864830 ) ) ( not ( = ?auto_864827 ?auto_864831 ) ) ( not ( = ?auto_864827 ?auto_864832 ) ) ( not ( = ?auto_864828 ?auto_864829 ) ) ( not ( = ?auto_864828 ?auto_864830 ) ) ( not ( = ?auto_864828 ?auto_864831 ) ) ( not ( = ?auto_864828 ?auto_864832 ) ) ( not ( = ?auto_864829 ?auto_864830 ) ) ( not ( = ?auto_864829 ?auto_864831 ) ) ( not ( = ?auto_864829 ?auto_864832 ) ) ( not ( = ?auto_864830 ?auto_864831 ) ) ( not ( = ?auto_864830 ?auto_864832 ) ) ( not ( = ?auto_864831 ?auto_864832 ) ) ( ON ?auto_864830 ?auto_864831 ) ( ON ?auto_864829 ?auto_864830 ) ( ON ?auto_864828 ?auto_864829 ) ( ON ?auto_864827 ?auto_864828 ) ( ON ?auto_864826 ?auto_864827 ) ( ON ?auto_864825 ?auto_864826 ) ( CLEAR ?auto_864823 ) ( ON ?auto_864824 ?auto_864825 ) ( CLEAR ?auto_864824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_864821 ?auto_864822 ?auto_864823 ?auto_864824 )
      ( MAKE-11PILE ?auto_864821 ?auto_864822 ?auto_864823 ?auto_864824 ?auto_864825 ?auto_864826 ?auto_864827 ?auto_864828 ?auto_864829 ?auto_864830 ?auto_864831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864867 - BLOCK
      ?auto_864868 - BLOCK
      ?auto_864869 - BLOCK
      ?auto_864870 - BLOCK
      ?auto_864871 - BLOCK
      ?auto_864872 - BLOCK
      ?auto_864873 - BLOCK
      ?auto_864874 - BLOCK
      ?auto_864875 - BLOCK
      ?auto_864876 - BLOCK
      ?auto_864877 - BLOCK
    )
    :vars
    (
      ?auto_864878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864877 ?auto_864878 ) ( ON-TABLE ?auto_864867 ) ( ON ?auto_864868 ?auto_864867 ) ( not ( = ?auto_864867 ?auto_864868 ) ) ( not ( = ?auto_864867 ?auto_864869 ) ) ( not ( = ?auto_864867 ?auto_864870 ) ) ( not ( = ?auto_864867 ?auto_864871 ) ) ( not ( = ?auto_864867 ?auto_864872 ) ) ( not ( = ?auto_864867 ?auto_864873 ) ) ( not ( = ?auto_864867 ?auto_864874 ) ) ( not ( = ?auto_864867 ?auto_864875 ) ) ( not ( = ?auto_864867 ?auto_864876 ) ) ( not ( = ?auto_864867 ?auto_864877 ) ) ( not ( = ?auto_864867 ?auto_864878 ) ) ( not ( = ?auto_864868 ?auto_864869 ) ) ( not ( = ?auto_864868 ?auto_864870 ) ) ( not ( = ?auto_864868 ?auto_864871 ) ) ( not ( = ?auto_864868 ?auto_864872 ) ) ( not ( = ?auto_864868 ?auto_864873 ) ) ( not ( = ?auto_864868 ?auto_864874 ) ) ( not ( = ?auto_864868 ?auto_864875 ) ) ( not ( = ?auto_864868 ?auto_864876 ) ) ( not ( = ?auto_864868 ?auto_864877 ) ) ( not ( = ?auto_864868 ?auto_864878 ) ) ( not ( = ?auto_864869 ?auto_864870 ) ) ( not ( = ?auto_864869 ?auto_864871 ) ) ( not ( = ?auto_864869 ?auto_864872 ) ) ( not ( = ?auto_864869 ?auto_864873 ) ) ( not ( = ?auto_864869 ?auto_864874 ) ) ( not ( = ?auto_864869 ?auto_864875 ) ) ( not ( = ?auto_864869 ?auto_864876 ) ) ( not ( = ?auto_864869 ?auto_864877 ) ) ( not ( = ?auto_864869 ?auto_864878 ) ) ( not ( = ?auto_864870 ?auto_864871 ) ) ( not ( = ?auto_864870 ?auto_864872 ) ) ( not ( = ?auto_864870 ?auto_864873 ) ) ( not ( = ?auto_864870 ?auto_864874 ) ) ( not ( = ?auto_864870 ?auto_864875 ) ) ( not ( = ?auto_864870 ?auto_864876 ) ) ( not ( = ?auto_864870 ?auto_864877 ) ) ( not ( = ?auto_864870 ?auto_864878 ) ) ( not ( = ?auto_864871 ?auto_864872 ) ) ( not ( = ?auto_864871 ?auto_864873 ) ) ( not ( = ?auto_864871 ?auto_864874 ) ) ( not ( = ?auto_864871 ?auto_864875 ) ) ( not ( = ?auto_864871 ?auto_864876 ) ) ( not ( = ?auto_864871 ?auto_864877 ) ) ( not ( = ?auto_864871 ?auto_864878 ) ) ( not ( = ?auto_864872 ?auto_864873 ) ) ( not ( = ?auto_864872 ?auto_864874 ) ) ( not ( = ?auto_864872 ?auto_864875 ) ) ( not ( = ?auto_864872 ?auto_864876 ) ) ( not ( = ?auto_864872 ?auto_864877 ) ) ( not ( = ?auto_864872 ?auto_864878 ) ) ( not ( = ?auto_864873 ?auto_864874 ) ) ( not ( = ?auto_864873 ?auto_864875 ) ) ( not ( = ?auto_864873 ?auto_864876 ) ) ( not ( = ?auto_864873 ?auto_864877 ) ) ( not ( = ?auto_864873 ?auto_864878 ) ) ( not ( = ?auto_864874 ?auto_864875 ) ) ( not ( = ?auto_864874 ?auto_864876 ) ) ( not ( = ?auto_864874 ?auto_864877 ) ) ( not ( = ?auto_864874 ?auto_864878 ) ) ( not ( = ?auto_864875 ?auto_864876 ) ) ( not ( = ?auto_864875 ?auto_864877 ) ) ( not ( = ?auto_864875 ?auto_864878 ) ) ( not ( = ?auto_864876 ?auto_864877 ) ) ( not ( = ?auto_864876 ?auto_864878 ) ) ( not ( = ?auto_864877 ?auto_864878 ) ) ( ON ?auto_864876 ?auto_864877 ) ( ON ?auto_864875 ?auto_864876 ) ( ON ?auto_864874 ?auto_864875 ) ( ON ?auto_864873 ?auto_864874 ) ( ON ?auto_864872 ?auto_864873 ) ( ON ?auto_864871 ?auto_864872 ) ( ON ?auto_864870 ?auto_864871 ) ( CLEAR ?auto_864868 ) ( ON ?auto_864869 ?auto_864870 ) ( CLEAR ?auto_864869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_864867 ?auto_864868 ?auto_864869 )
      ( MAKE-11PILE ?auto_864867 ?auto_864868 ?auto_864869 ?auto_864870 ?auto_864871 ?auto_864872 ?auto_864873 ?auto_864874 ?auto_864875 ?auto_864876 ?auto_864877 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864913 - BLOCK
      ?auto_864914 - BLOCK
      ?auto_864915 - BLOCK
      ?auto_864916 - BLOCK
      ?auto_864917 - BLOCK
      ?auto_864918 - BLOCK
      ?auto_864919 - BLOCK
      ?auto_864920 - BLOCK
      ?auto_864921 - BLOCK
      ?auto_864922 - BLOCK
      ?auto_864923 - BLOCK
    )
    :vars
    (
      ?auto_864924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864923 ?auto_864924 ) ( ON-TABLE ?auto_864913 ) ( not ( = ?auto_864913 ?auto_864914 ) ) ( not ( = ?auto_864913 ?auto_864915 ) ) ( not ( = ?auto_864913 ?auto_864916 ) ) ( not ( = ?auto_864913 ?auto_864917 ) ) ( not ( = ?auto_864913 ?auto_864918 ) ) ( not ( = ?auto_864913 ?auto_864919 ) ) ( not ( = ?auto_864913 ?auto_864920 ) ) ( not ( = ?auto_864913 ?auto_864921 ) ) ( not ( = ?auto_864913 ?auto_864922 ) ) ( not ( = ?auto_864913 ?auto_864923 ) ) ( not ( = ?auto_864913 ?auto_864924 ) ) ( not ( = ?auto_864914 ?auto_864915 ) ) ( not ( = ?auto_864914 ?auto_864916 ) ) ( not ( = ?auto_864914 ?auto_864917 ) ) ( not ( = ?auto_864914 ?auto_864918 ) ) ( not ( = ?auto_864914 ?auto_864919 ) ) ( not ( = ?auto_864914 ?auto_864920 ) ) ( not ( = ?auto_864914 ?auto_864921 ) ) ( not ( = ?auto_864914 ?auto_864922 ) ) ( not ( = ?auto_864914 ?auto_864923 ) ) ( not ( = ?auto_864914 ?auto_864924 ) ) ( not ( = ?auto_864915 ?auto_864916 ) ) ( not ( = ?auto_864915 ?auto_864917 ) ) ( not ( = ?auto_864915 ?auto_864918 ) ) ( not ( = ?auto_864915 ?auto_864919 ) ) ( not ( = ?auto_864915 ?auto_864920 ) ) ( not ( = ?auto_864915 ?auto_864921 ) ) ( not ( = ?auto_864915 ?auto_864922 ) ) ( not ( = ?auto_864915 ?auto_864923 ) ) ( not ( = ?auto_864915 ?auto_864924 ) ) ( not ( = ?auto_864916 ?auto_864917 ) ) ( not ( = ?auto_864916 ?auto_864918 ) ) ( not ( = ?auto_864916 ?auto_864919 ) ) ( not ( = ?auto_864916 ?auto_864920 ) ) ( not ( = ?auto_864916 ?auto_864921 ) ) ( not ( = ?auto_864916 ?auto_864922 ) ) ( not ( = ?auto_864916 ?auto_864923 ) ) ( not ( = ?auto_864916 ?auto_864924 ) ) ( not ( = ?auto_864917 ?auto_864918 ) ) ( not ( = ?auto_864917 ?auto_864919 ) ) ( not ( = ?auto_864917 ?auto_864920 ) ) ( not ( = ?auto_864917 ?auto_864921 ) ) ( not ( = ?auto_864917 ?auto_864922 ) ) ( not ( = ?auto_864917 ?auto_864923 ) ) ( not ( = ?auto_864917 ?auto_864924 ) ) ( not ( = ?auto_864918 ?auto_864919 ) ) ( not ( = ?auto_864918 ?auto_864920 ) ) ( not ( = ?auto_864918 ?auto_864921 ) ) ( not ( = ?auto_864918 ?auto_864922 ) ) ( not ( = ?auto_864918 ?auto_864923 ) ) ( not ( = ?auto_864918 ?auto_864924 ) ) ( not ( = ?auto_864919 ?auto_864920 ) ) ( not ( = ?auto_864919 ?auto_864921 ) ) ( not ( = ?auto_864919 ?auto_864922 ) ) ( not ( = ?auto_864919 ?auto_864923 ) ) ( not ( = ?auto_864919 ?auto_864924 ) ) ( not ( = ?auto_864920 ?auto_864921 ) ) ( not ( = ?auto_864920 ?auto_864922 ) ) ( not ( = ?auto_864920 ?auto_864923 ) ) ( not ( = ?auto_864920 ?auto_864924 ) ) ( not ( = ?auto_864921 ?auto_864922 ) ) ( not ( = ?auto_864921 ?auto_864923 ) ) ( not ( = ?auto_864921 ?auto_864924 ) ) ( not ( = ?auto_864922 ?auto_864923 ) ) ( not ( = ?auto_864922 ?auto_864924 ) ) ( not ( = ?auto_864923 ?auto_864924 ) ) ( ON ?auto_864922 ?auto_864923 ) ( ON ?auto_864921 ?auto_864922 ) ( ON ?auto_864920 ?auto_864921 ) ( ON ?auto_864919 ?auto_864920 ) ( ON ?auto_864918 ?auto_864919 ) ( ON ?auto_864917 ?auto_864918 ) ( ON ?auto_864916 ?auto_864917 ) ( ON ?auto_864915 ?auto_864916 ) ( CLEAR ?auto_864913 ) ( ON ?auto_864914 ?auto_864915 ) ( CLEAR ?auto_864914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_864913 ?auto_864914 )
      ( MAKE-11PILE ?auto_864913 ?auto_864914 ?auto_864915 ?auto_864916 ?auto_864917 ?auto_864918 ?auto_864919 ?auto_864920 ?auto_864921 ?auto_864922 ?auto_864923 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_864959 - BLOCK
      ?auto_864960 - BLOCK
      ?auto_864961 - BLOCK
      ?auto_864962 - BLOCK
      ?auto_864963 - BLOCK
      ?auto_864964 - BLOCK
      ?auto_864965 - BLOCK
      ?auto_864966 - BLOCK
      ?auto_864967 - BLOCK
      ?auto_864968 - BLOCK
      ?auto_864969 - BLOCK
    )
    :vars
    (
      ?auto_864970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864969 ?auto_864970 ) ( not ( = ?auto_864959 ?auto_864960 ) ) ( not ( = ?auto_864959 ?auto_864961 ) ) ( not ( = ?auto_864959 ?auto_864962 ) ) ( not ( = ?auto_864959 ?auto_864963 ) ) ( not ( = ?auto_864959 ?auto_864964 ) ) ( not ( = ?auto_864959 ?auto_864965 ) ) ( not ( = ?auto_864959 ?auto_864966 ) ) ( not ( = ?auto_864959 ?auto_864967 ) ) ( not ( = ?auto_864959 ?auto_864968 ) ) ( not ( = ?auto_864959 ?auto_864969 ) ) ( not ( = ?auto_864959 ?auto_864970 ) ) ( not ( = ?auto_864960 ?auto_864961 ) ) ( not ( = ?auto_864960 ?auto_864962 ) ) ( not ( = ?auto_864960 ?auto_864963 ) ) ( not ( = ?auto_864960 ?auto_864964 ) ) ( not ( = ?auto_864960 ?auto_864965 ) ) ( not ( = ?auto_864960 ?auto_864966 ) ) ( not ( = ?auto_864960 ?auto_864967 ) ) ( not ( = ?auto_864960 ?auto_864968 ) ) ( not ( = ?auto_864960 ?auto_864969 ) ) ( not ( = ?auto_864960 ?auto_864970 ) ) ( not ( = ?auto_864961 ?auto_864962 ) ) ( not ( = ?auto_864961 ?auto_864963 ) ) ( not ( = ?auto_864961 ?auto_864964 ) ) ( not ( = ?auto_864961 ?auto_864965 ) ) ( not ( = ?auto_864961 ?auto_864966 ) ) ( not ( = ?auto_864961 ?auto_864967 ) ) ( not ( = ?auto_864961 ?auto_864968 ) ) ( not ( = ?auto_864961 ?auto_864969 ) ) ( not ( = ?auto_864961 ?auto_864970 ) ) ( not ( = ?auto_864962 ?auto_864963 ) ) ( not ( = ?auto_864962 ?auto_864964 ) ) ( not ( = ?auto_864962 ?auto_864965 ) ) ( not ( = ?auto_864962 ?auto_864966 ) ) ( not ( = ?auto_864962 ?auto_864967 ) ) ( not ( = ?auto_864962 ?auto_864968 ) ) ( not ( = ?auto_864962 ?auto_864969 ) ) ( not ( = ?auto_864962 ?auto_864970 ) ) ( not ( = ?auto_864963 ?auto_864964 ) ) ( not ( = ?auto_864963 ?auto_864965 ) ) ( not ( = ?auto_864963 ?auto_864966 ) ) ( not ( = ?auto_864963 ?auto_864967 ) ) ( not ( = ?auto_864963 ?auto_864968 ) ) ( not ( = ?auto_864963 ?auto_864969 ) ) ( not ( = ?auto_864963 ?auto_864970 ) ) ( not ( = ?auto_864964 ?auto_864965 ) ) ( not ( = ?auto_864964 ?auto_864966 ) ) ( not ( = ?auto_864964 ?auto_864967 ) ) ( not ( = ?auto_864964 ?auto_864968 ) ) ( not ( = ?auto_864964 ?auto_864969 ) ) ( not ( = ?auto_864964 ?auto_864970 ) ) ( not ( = ?auto_864965 ?auto_864966 ) ) ( not ( = ?auto_864965 ?auto_864967 ) ) ( not ( = ?auto_864965 ?auto_864968 ) ) ( not ( = ?auto_864965 ?auto_864969 ) ) ( not ( = ?auto_864965 ?auto_864970 ) ) ( not ( = ?auto_864966 ?auto_864967 ) ) ( not ( = ?auto_864966 ?auto_864968 ) ) ( not ( = ?auto_864966 ?auto_864969 ) ) ( not ( = ?auto_864966 ?auto_864970 ) ) ( not ( = ?auto_864967 ?auto_864968 ) ) ( not ( = ?auto_864967 ?auto_864969 ) ) ( not ( = ?auto_864967 ?auto_864970 ) ) ( not ( = ?auto_864968 ?auto_864969 ) ) ( not ( = ?auto_864968 ?auto_864970 ) ) ( not ( = ?auto_864969 ?auto_864970 ) ) ( ON ?auto_864968 ?auto_864969 ) ( ON ?auto_864967 ?auto_864968 ) ( ON ?auto_864966 ?auto_864967 ) ( ON ?auto_864965 ?auto_864966 ) ( ON ?auto_864964 ?auto_864965 ) ( ON ?auto_864963 ?auto_864964 ) ( ON ?auto_864962 ?auto_864963 ) ( ON ?auto_864961 ?auto_864962 ) ( ON ?auto_864960 ?auto_864961 ) ( ON ?auto_864959 ?auto_864960 ) ( CLEAR ?auto_864959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_864959 )
      ( MAKE-11PILE ?auto_864959 ?auto_864960 ?auto_864961 ?auto_864962 ?auto_864963 ?auto_864964 ?auto_864965 ?auto_864966 ?auto_864967 ?auto_864968 ?auto_864969 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865006 - BLOCK
      ?auto_865007 - BLOCK
      ?auto_865008 - BLOCK
      ?auto_865009 - BLOCK
      ?auto_865010 - BLOCK
      ?auto_865011 - BLOCK
      ?auto_865012 - BLOCK
      ?auto_865013 - BLOCK
      ?auto_865014 - BLOCK
      ?auto_865015 - BLOCK
      ?auto_865016 - BLOCK
      ?auto_865017 - BLOCK
    )
    :vars
    (
      ?auto_865018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_865016 ) ( ON ?auto_865017 ?auto_865018 ) ( CLEAR ?auto_865017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_865006 ) ( ON ?auto_865007 ?auto_865006 ) ( ON ?auto_865008 ?auto_865007 ) ( ON ?auto_865009 ?auto_865008 ) ( ON ?auto_865010 ?auto_865009 ) ( ON ?auto_865011 ?auto_865010 ) ( ON ?auto_865012 ?auto_865011 ) ( ON ?auto_865013 ?auto_865012 ) ( ON ?auto_865014 ?auto_865013 ) ( ON ?auto_865015 ?auto_865014 ) ( ON ?auto_865016 ?auto_865015 ) ( not ( = ?auto_865006 ?auto_865007 ) ) ( not ( = ?auto_865006 ?auto_865008 ) ) ( not ( = ?auto_865006 ?auto_865009 ) ) ( not ( = ?auto_865006 ?auto_865010 ) ) ( not ( = ?auto_865006 ?auto_865011 ) ) ( not ( = ?auto_865006 ?auto_865012 ) ) ( not ( = ?auto_865006 ?auto_865013 ) ) ( not ( = ?auto_865006 ?auto_865014 ) ) ( not ( = ?auto_865006 ?auto_865015 ) ) ( not ( = ?auto_865006 ?auto_865016 ) ) ( not ( = ?auto_865006 ?auto_865017 ) ) ( not ( = ?auto_865006 ?auto_865018 ) ) ( not ( = ?auto_865007 ?auto_865008 ) ) ( not ( = ?auto_865007 ?auto_865009 ) ) ( not ( = ?auto_865007 ?auto_865010 ) ) ( not ( = ?auto_865007 ?auto_865011 ) ) ( not ( = ?auto_865007 ?auto_865012 ) ) ( not ( = ?auto_865007 ?auto_865013 ) ) ( not ( = ?auto_865007 ?auto_865014 ) ) ( not ( = ?auto_865007 ?auto_865015 ) ) ( not ( = ?auto_865007 ?auto_865016 ) ) ( not ( = ?auto_865007 ?auto_865017 ) ) ( not ( = ?auto_865007 ?auto_865018 ) ) ( not ( = ?auto_865008 ?auto_865009 ) ) ( not ( = ?auto_865008 ?auto_865010 ) ) ( not ( = ?auto_865008 ?auto_865011 ) ) ( not ( = ?auto_865008 ?auto_865012 ) ) ( not ( = ?auto_865008 ?auto_865013 ) ) ( not ( = ?auto_865008 ?auto_865014 ) ) ( not ( = ?auto_865008 ?auto_865015 ) ) ( not ( = ?auto_865008 ?auto_865016 ) ) ( not ( = ?auto_865008 ?auto_865017 ) ) ( not ( = ?auto_865008 ?auto_865018 ) ) ( not ( = ?auto_865009 ?auto_865010 ) ) ( not ( = ?auto_865009 ?auto_865011 ) ) ( not ( = ?auto_865009 ?auto_865012 ) ) ( not ( = ?auto_865009 ?auto_865013 ) ) ( not ( = ?auto_865009 ?auto_865014 ) ) ( not ( = ?auto_865009 ?auto_865015 ) ) ( not ( = ?auto_865009 ?auto_865016 ) ) ( not ( = ?auto_865009 ?auto_865017 ) ) ( not ( = ?auto_865009 ?auto_865018 ) ) ( not ( = ?auto_865010 ?auto_865011 ) ) ( not ( = ?auto_865010 ?auto_865012 ) ) ( not ( = ?auto_865010 ?auto_865013 ) ) ( not ( = ?auto_865010 ?auto_865014 ) ) ( not ( = ?auto_865010 ?auto_865015 ) ) ( not ( = ?auto_865010 ?auto_865016 ) ) ( not ( = ?auto_865010 ?auto_865017 ) ) ( not ( = ?auto_865010 ?auto_865018 ) ) ( not ( = ?auto_865011 ?auto_865012 ) ) ( not ( = ?auto_865011 ?auto_865013 ) ) ( not ( = ?auto_865011 ?auto_865014 ) ) ( not ( = ?auto_865011 ?auto_865015 ) ) ( not ( = ?auto_865011 ?auto_865016 ) ) ( not ( = ?auto_865011 ?auto_865017 ) ) ( not ( = ?auto_865011 ?auto_865018 ) ) ( not ( = ?auto_865012 ?auto_865013 ) ) ( not ( = ?auto_865012 ?auto_865014 ) ) ( not ( = ?auto_865012 ?auto_865015 ) ) ( not ( = ?auto_865012 ?auto_865016 ) ) ( not ( = ?auto_865012 ?auto_865017 ) ) ( not ( = ?auto_865012 ?auto_865018 ) ) ( not ( = ?auto_865013 ?auto_865014 ) ) ( not ( = ?auto_865013 ?auto_865015 ) ) ( not ( = ?auto_865013 ?auto_865016 ) ) ( not ( = ?auto_865013 ?auto_865017 ) ) ( not ( = ?auto_865013 ?auto_865018 ) ) ( not ( = ?auto_865014 ?auto_865015 ) ) ( not ( = ?auto_865014 ?auto_865016 ) ) ( not ( = ?auto_865014 ?auto_865017 ) ) ( not ( = ?auto_865014 ?auto_865018 ) ) ( not ( = ?auto_865015 ?auto_865016 ) ) ( not ( = ?auto_865015 ?auto_865017 ) ) ( not ( = ?auto_865015 ?auto_865018 ) ) ( not ( = ?auto_865016 ?auto_865017 ) ) ( not ( = ?auto_865016 ?auto_865018 ) ) ( not ( = ?auto_865017 ?auto_865018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_865017 ?auto_865018 )
      ( !STACK ?auto_865017 ?auto_865016 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865056 - BLOCK
      ?auto_865057 - BLOCK
      ?auto_865058 - BLOCK
      ?auto_865059 - BLOCK
      ?auto_865060 - BLOCK
      ?auto_865061 - BLOCK
      ?auto_865062 - BLOCK
      ?auto_865063 - BLOCK
      ?auto_865064 - BLOCK
      ?auto_865065 - BLOCK
      ?auto_865066 - BLOCK
      ?auto_865067 - BLOCK
    )
    :vars
    (
      ?auto_865068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865067 ?auto_865068 ) ( ON-TABLE ?auto_865056 ) ( ON ?auto_865057 ?auto_865056 ) ( ON ?auto_865058 ?auto_865057 ) ( ON ?auto_865059 ?auto_865058 ) ( ON ?auto_865060 ?auto_865059 ) ( ON ?auto_865061 ?auto_865060 ) ( ON ?auto_865062 ?auto_865061 ) ( ON ?auto_865063 ?auto_865062 ) ( ON ?auto_865064 ?auto_865063 ) ( ON ?auto_865065 ?auto_865064 ) ( not ( = ?auto_865056 ?auto_865057 ) ) ( not ( = ?auto_865056 ?auto_865058 ) ) ( not ( = ?auto_865056 ?auto_865059 ) ) ( not ( = ?auto_865056 ?auto_865060 ) ) ( not ( = ?auto_865056 ?auto_865061 ) ) ( not ( = ?auto_865056 ?auto_865062 ) ) ( not ( = ?auto_865056 ?auto_865063 ) ) ( not ( = ?auto_865056 ?auto_865064 ) ) ( not ( = ?auto_865056 ?auto_865065 ) ) ( not ( = ?auto_865056 ?auto_865066 ) ) ( not ( = ?auto_865056 ?auto_865067 ) ) ( not ( = ?auto_865056 ?auto_865068 ) ) ( not ( = ?auto_865057 ?auto_865058 ) ) ( not ( = ?auto_865057 ?auto_865059 ) ) ( not ( = ?auto_865057 ?auto_865060 ) ) ( not ( = ?auto_865057 ?auto_865061 ) ) ( not ( = ?auto_865057 ?auto_865062 ) ) ( not ( = ?auto_865057 ?auto_865063 ) ) ( not ( = ?auto_865057 ?auto_865064 ) ) ( not ( = ?auto_865057 ?auto_865065 ) ) ( not ( = ?auto_865057 ?auto_865066 ) ) ( not ( = ?auto_865057 ?auto_865067 ) ) ( not ( = ?auto_865057 ?auto_865068 ) ) ( not ( = ?auto_865058 ?auto_865059 ) ) ( not ( = ?auto_865058 ?auto_865060 ) ) ( not ( = ?auto_865058 ?auto_865061 ) ) ( not ( = ?auto_865058 ?auto_865062 ) ) ( not ( = ?auto_865058 ?auto_865063 ) ) ( not ( = ?auto_865058 ?auto_865064 ) ) ( not ( = ?auto_865058 ?auto_865065 ) ) ( not ( = ?auto_865058 ?auto_865066 ) ) ( not ( = ?auto_865058 ?auto_865067 ) ) ( not ( = ?auto_865058 ?auto_865068 ) ) ( not ( = ?auto_865059 ?auto_865060 ) ) ( not ( = ?auto_865059 ?auto_865061 ) ) ( not ( = ?auto_865059 ?auto_865062 ) ) ( not ( = ?auto_865059 ?auto_865063 ) ) ( not ( = ?auto_865059 ?auto_865064 ) ) ( not ( = ?auto_865059 ?auto_865065 ) ) ( not ( = ?auto_865059 ?auto_865066 ) ) ( not ( = ?auto_865059 ?auto_865067 ) ) ( not ( = ?auto_865059 ?auto_865068 ) ) ( not ( = ?auto_865060 ?auto_865061 ) ) ( not ( = ?auto_865060 ?auto_865062 ) ) ( not ( = ?auto_865060 ?auto_865063 ) ) ( not ( = ?auto_865060 ?auto_865064 ) ) ( not ( = ?auto_865060 ?auto_865065 ) ) ( not ( = ?auto_865060 ?auto_865066 ) ) ( not ( = ?auto_865060 ?auto_865067 ) ) ( not ( = ?auto_865060 ?auto_865068 ) ) ( not ( = ?auto_865061 ?auto_865062 ) ) ( not ( = ?auto_865061 ?auto_865063 ) ) ( not ( = ?auto_865061 ?auto_865064 ) ) ( not ( = ?auto_865061 ?auto_865065 ) ) ( not ( = ?auto_865061 ?auto_865066 ) ) ( not ( = ?auto_865061 ?auto_865067 ) ) ( not ( = ?auto_865061 ?auto_865068 ) ) ( not ( = ?auto_865062 ?auto_865063 ) ) ( not ( = ?auto_865062 ?auto_865064 ) ) ( not ( = ?auto_865062 ?auto_865065 ) ) ( not ( = ?auto_865062 ?auto_865066 ) ) ( not ( = ?auto_865062 ?auto_865067 ) ) ( not ( = ?auto_865062 ?auto_865068 ) ) ( not ( = ?auto_865063 ?auto_865064 ) ) ( not ( = ?auto_865063 ?auto_865065 ) ) ( not ( = ?auto_865063 ?auto_865066 ) ) ( not ( = ?auto_865063 ?auto_865067 ) ) ( not ( = ?auto_865063 ?auto_865068 ) ) ( not ( = ?auto_865064 ?auto_865065 ) ) ( not ( = ?auto_865064 ?auto_865066 ) ) ( not ( = ?auto_865064 ?auto_865067 ) ) ( not ( = ?auto_865064 ?auto_865068 ) ) ( not ( = ?auto_865065 ?auto_865066 ) ) ( not ( = ?auto_865065 ?auto_865067 ) ) ( not ( = ?auto_865065 ?auto_865068 ) ) ( not ( = ?auto_865066 ?auto_865067 ) ) ( not ( = ?auto_865066 ?auto_865068 ) ) ( not ( = ?auto_865067 ?auto_865068 ) ) ( CLEAR ?auto_865065 ) ( ON ?auto_865066 ?auto_865067 ) ( CLEAR ?auto_865066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_865056 ?auto_865057 ?auto_865058 ?auto_865059 ?auto_865060 ?auto_865061 ?auto_865062 ?auto_865063 ?auto_865064 ?auto_865065 ?auto_865066 )
      ( MAKE-12PILE ?auto_865056 ?auto_865057 ?auto_865058 ?auto_865059 ?auto_865060 ?auto_865061 ?auto_865062 ?auto_865063 ?auto_865064 ?auto_865065 ?auto_865066 ?auto_865067 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865106 - BLOCK
      ?auto_865107 - BLOCK
      ?auto_865108 - BLOCK
      ?auto_865109 - BLOCK
      ?auto_865110 - BLOCK
      ?auto_865111 - BLOCK
      ?auto_865112 - BLOCK
      ?auto_865113 - BLOCK
      ?auto_865114 - BLOCK
      ?auto_865115 - BLOCK
      ?auto_865116 - BLOCK
      ?auto_865117 - BLOCK
    )
    :vars
    (
      ?auto_865118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865117 ?auto_865118 ) ( ON-TABLE ?auto_865106 ) ( ON ?auto_865107 ?auto_865106 ) ( ON ?auto_865108 ?auto_865107 ) ( ON ?auto_865109 ?auto_865108 ) ( ON ?auto_865110 ?auto_865109 ) ( ON ?auto_865111 ?auto_865110 ) ( ON ?auto_865112 ?auto_865111 ) ( ON ?auto_865113 ?auto_865112 ) ( ON ?auto_865114 ?auto_865113 ) ( not ( = ?auto_865106 ?auto_865107 ) ) ( not ( = ?auto_865106 ?auto_865108 ) ) ( not ( = ?auto_865106 ?auto_865109 ) ) ( not ( = ?auto_865106 ?auto_865110 ) ) ( not ( = ?auto_865106 ?auto_865111 ) ) ( not ( = ?auto_865106 ?auto_865112 ) ) ( not ( = ?auto_865106 ?auto_865113 ) ) ( not ( = ?auto_865106 ?auto_865114 ) ) ( not ( = ?auto_865106 ?auto_865115 ) ) ( not ( = ?auto_865106 ?auto_865116 ) ) ( not ( = ?auto_865106 ?auto_865117 ) ) ( not ( = ?auto_865106 ?auto_865118 ) ) ( not ( = ?auto_865107 ?auto_865108 ) ) ( not ( = ?auto_865107 ?auto_865109 ) ) ( not ( = ?auto_865107 ?auto_865110 ) ) ( not ( = ?auto_865107 ?auto_865111 ) ) ( not ( = ?auto_865107 ?auto_865112 ) ) ( not ( = ?auto_865107 ?auto_865113 ) ) ( not ( = ?auto_865107 ?auto_865114 ) ) ( not ( = ?auto_865107 ?auto_865115 ) ) ( not ( = ?auto_865107 ?auto_865116 ) ) ( not ( = ?auto_865107 ?auto_865117 ) ) ( not ( = ?auto_865107 ?auto_865118 ) ) ( not ( = ?auto_865108 ?auto_865109 ) ) ( not ( = ?auto_865108 ?auto_865110 ) ) ( not ( = ?auto_865108 ?auto_865111 ) ) ( not ( = ?auto_865108 ?auto_865112 ) ) ( not ( = ?auto_865108 ?auto_865113 ) ) ( not ( = ?auto_865108 ?auto_865114 ) ) ( not ( = ?auto_865108 ?auto_865115 ) ) ( not ( = ?auto_865108 ?auto_865116 ) ) ( not ( = ?auto_865108 ?auto_865117 ) ) ( not ( = ?auto_865108 ?auto_865118 ) ) ( not ( = ?auto_865109 ?auto_865110 ) ) ( not ( = ?auto_865109 ?auto_865111 ) ) ( not ( = ?auto_865109 ?auto_865112 ) ) ( not ( = ?auto_865109 ?auto_865113 ) ) ( not ( = ?auto_865109 ?auto_865114 ) ) ( not ( = ?auto_865109 ?auto_865115 ) ) ( not ( = ?auto_865109 ?auto_865116 ) ) ( not ( = ?auto_865109 ?auto_865117 ) ) ( not ( = ?auto_865109 ?auto_865118 ) ) ( not ( = ?auto_865110 ?auto_865111 ) ) ( not ( = ?auto_865110 ?auto_865112 ) ) ( not ( = ?auto_865110 ?auto_865113 ) ) ( not ( = ?auto_865110 ?auto_865114 ) ) ( not ( = ?auto_865110 ?auto_865115 ) ) ( not ( = ?auto_865110 ?auto_865116 ) ) ( not ( = ?auto_865110 ?auto_865117 ) ) ( not ( = ?auto_865110 ?auto_865118 ) ) ( not ( = ?auto_865111 ?auto_865112 ) ) ( not ( = ?auto_865111 ?auto_865113 ) ) ( not ( = ?auto_865111 ?auto_865114 ) ) ( not ( = ?auto_865111 ?auto_865115 ) ) ( not ( = ?auto_865111 ?auto_865116 ) ) ( not ( = ?auto_865111 ?auto_865117 ) ) ( not ( = ?auto_865111 ?auto_865118 ) ) ( not ( = ?auto_865112 ?auto_865113 ) ) ( not ( = ?auto_865112 ?auto_865114 ) ) ( not ( = ?auto_865112 ?auto_865115 ) ) ( not ( = ?auto_865112 ?auto_865116 ) ) ( not ( = ?auto_865112 ?auto_865117 ) ) ( not ( = ?auto_865112 ?auto_865118 ) ) ( not ( = ?auto_865113 ?auto_865114 ) ) ( not ( = ?auto_865113 ?auto_865115 ) ) ( not ( = ?auto_865113 ?auto_865116 ) ) ( not ( = ?auto_865113 ?auto_865117 ) ) ( not ( = ?auto_865113 ?auto_865118 ) ) ( not ( = ?auto_865114 ?auto_865115 ) ) ( not ( = ?auto_865114 ?auto_865116 ) ) ( not ( = ?auto_865114 ?auto_865117 ) ) ( not ( = ?auto_865114 ?auto_865118 ) ) ( not ( = ?auto_865115 ?auto_865116 ) ) ( not ( = ?auto_865115 ?auto_865117 ) ) ( not ( = ?auto_865115 ?auto_865118 ) ) ( not ( = ?auto_865116 ?auto_865117 ) ) ( not ( = ?auto_865116 ?auto_865118 ) ) ( not ( = ?auto_865117 ?auto_865118 ) ) ( ON ?auto_865116 ?auto_865117 ) ( CLEAR ?auto_865114 ) ( ON ?auto_865115 ?auto_865116 ) ( CLEAR ?auto_865115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_865106 ?auto_865107 ?auto_865108 ?auto_865109 ?auto_865110 ?auto_865111 ?auto_865112 ?auto_865113 ?auto_865114 ?auto_865115 )
      ( MAKE-12PILE ?auto_865106 ?auto_865107 ?auto_865108 ?auto_865109 ?auto_865110 ?auto_865111 ?auto_865112 ?auto_865113 ?auto_865114 ?auto_865115 ?auto_865116 ?auto_865117 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865156 - BLOCK
      ?auto_865157 - BLOCK
      ?auto_865158 - BLOCK
      ?auto_865159 - BLOCK
      ?auto_865160 - BLOCK
      ?auto_865161 - BLOCK
      ?auto_865162 - BLOCK
      ?auto_865163 - BLOCK
      ?auto_865164 - BLOCK
      ?auto_865165 - BLOCK
      ?auto_865166 - BLOCK
      ?auto_865167 - BLOCK
    )
    :vars
    (
      ?auto_865168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865167 ?auto_865168 ) ( ON-TABLE ?auto_865156 ) ( ON ?auto_865157 ?auto_865156 ) ( ON ?auto_865158 ?auto_865157 ) ( ON ?auto_865159 ?auto_865158 ) ( ON ?auto_865160 ?auto_865159 ) ( ON ?auto_865161 ?auto_865160 ) ( ON ?auto_865162 ?auto_865161 ) ( ON ?auto_865163 ?auto_865162 ) ( not ( = ?auto_865156 ?auto_865157 ) ) ( not ( = ?auto_865156 ?auto_865158 ) ) ( not ( = ?auto_865156 ?auto_865159 ) ) ( not ( = ?auto_865156 ?auto_865160 ) ) ( not ( = ?auto_865156 ?auto_865161 ) ) ( not ( = ?auto_865156 ?auto_865162 ) ) ( not ( = ?auto_865156 ?auto_865163 ) ) ( not ( = ?auto_865156 ?auto_865164 ) ) ( not ( = ?auto_865156 ?auto_865165 ) ) ( not ( = ?auto_865156 ?auto_865166 ) ) ( not ( = ?auto_865156 ?auto_865167 ) ) ( not ( = ?auto_865156 ?auto_865168 ) ) ( not ( = ?auto_865157 ?auto_865158 ) ) ( not ( = ?auto_865157 ?auto_865159 ) ) ( not ( = ?auto_865157 ?auto_865160 ) ) ( not ( = ?auto_865157 ?auto_865161 ) ) ( not ( = ?auto_865157 ?auto_865162 ) ) ( not ( = ?auto_865157 ?auto_865163 ) ) ( not ( = ?auto_865157 ?auto_865164 ) ) ( not ( = ?auto_865157 ?auto_865165 ) ) ( not ( = ?auto_865157 ?auto_865166 ) ) ( not ( = ?auto_865157 ?auto_865167 ) ) ( not ( = ?auto_865157 ?auto_865168 ) ) ( not ( = ?auto_865158 ?auto_865159 ) ) ( not ( = ?auto_865158 ?auto_865160 ) ) ( not ( = ?auto_865158 ?auto_865161 ) ) ( not ( = ?auto_865158 ?auto_865162 ) ) ( not ( = ?auto_865158 ?auto_865163 ) ) ( not ( = ?auto_865158 ?auto_865164 ) ) ( not ( = ?auto_865158 ?auto_865165 ) ) ( not ( = ?auto_865158 ?auto_865166 ) ) ( not ( = ?auto_865158 ?auto_865167 ) ) ( not ( = ?auto_865158 ?auto_865168 ) ) ( not ( = ?auto_865159 ?auto_865160 ) ) ( not ( = ?auto_865159 ?auto_865161 ) ) ( not ( = ?auto_865159 ?auto_865162 ) ) ( not ( = ?auto_865159 ?auto_865163 ) ) ( not ( = ?auto_865159 ?auto_865164 ) ) ( not ( = ?auto_865159 ?auto_865165 ) ) ( not ( = ?auto_865159 ?auto_865166 ) ) ( not ( = ?auto_865159 ?auto_865167 ) ) ( not ( = ?auto_865159 ?auto_865168 ) ) ( not ( = ?auto_865160 ?auto_865161 ) ) ( not ( = ?auto_865160 ?auto_865162 ) ) ( not ( = ?auto_865160 ?auto_865163 ) ) ( not ( = ?auto_865160 ?auto_865164 ) ) ( not ( = ?auto_865160 ?auto_865165 ) ) ( not ( = ?auto_865160 ?auto_865166 ) ) ( not ( = ?auto_865160 ?auto_865167 ) ) ( not ( = ?auto_865160 ?auto_865168 ) ) ( not ( = ?auto_865161 ?auto_865162 ) ) ( not ( = ?auto_865161 ?auto_865163 ) ) ( not ( = ?auto_865161 ?auto_865164 ) ) ( not ( = ?auto_865161 ?auto_865165 ) ) ( not ( = ?auto_865161 ?auto_865166 ) ) ( not ( = ?auto_865161 ?auto_865167 ) ) ( not ( = ?auto_865161 ?auto_865168 ) ) ( not ( = ?auto_865162 ?auto_865163 ) ) ( not ( = ?auto_865162 ?auto_865164 ) ) ( not ( = ?auto_865162 ?auto_865165 ) ) ( not ( = ?auto_865162 ?auto_865166 ) ) ( not ( = ?auto_865162 ?auto_865167 ) ) ( not ( = ?auto_865162 ?auto_865168 ) ) ( not ( = ?auto_865163 ?auto_865164 ) ) ( not ( = ?auto_865163 ?auto_865165 ) ) ( not ( = ?auto_865163 ?auto_865166 ) ) ( not ( = ?auto_865163 ?auto_865167 ) ) ( not ( = ?auto_865163 ?auto_865168 ) ) ( not ( = ?auto_865164 ?auto_865165 ) ) ( not ( = ?auto_865164 ?auto_865166 ) ) ( not ( = ?auto_865164 ?auto_865167 ) ) ( not ( = ?auto_865164 ?auto_865168 ) ) ( not ( = ?auto_865165 ?auto_865166 ) ) ( not ( = ?auto_865165 ?auto_865167 ) ) ( not ( = ?auto_865165 ?auto_865168 ) ) ( not ( = ?auto_865166 ?auto_865167 ) ) ( not ( = ?auto_865166 ?auto_865168 ) ) ( not ( = ?auto_865167 ?auto_865168 ) ) ( ON ?auto_865166 ?auto_865167 ) ( ON ?auto_865165 ?auto_865166 ) ( CLEAR ?auto_865163 ) ( ON ?auto_865164 ?auto_865165 ) ( CLEAR ?auto_865164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_865156 ?auto_865157 ?auto_865158 ?auto_865159 ?auto_865160 ?auto_865161 ?auto_865162 ?auto_865163 ?auto_865164 )
      ( MAKE-12PILE ?auto_865156 ?auto_865157 ?auto_865158 ?auto_865159 ?auto_865160 ?auto_865161 ?auto_865162 ?auto_865163 ?auto_865164 ?auto_865165 ?auto_865166 ?auto_865167 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865206 - BLOCK
      ?auto_865207 - BLOCK
      ?auto_865208 - BLOCK
      ?auto_865209 - BLOCK
      ?auto_865210 - BLOCK
      ?auto_865211 - BLOCK
      ?auto_865212 - BLOCK
      ?auto_865213 - BLOCK
      ?auto_865214 - BLOCK
      ?auto_865215 - BLOCK
      ?auto_865216 - BLOCK
      ?auto_865217 - BLOCK
    )
    :vars
    (
      ?auto_865218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865217 ?auto_865218 ) ( ON-TABLE ?auto_865206 ) ( ON ?auto_865207 ?auto_865206 ) ( ON ?auto_865208 ?auto_865207 ) ( ON ?auto_865209 ?auto_865208 ) ( ON ?auto_865210 ?auto_865209 ) ( ON ?auto_865211 ?auto_865210 ) ( ON ?auto_865212 ?auto_865211 ) ( not ( = ?auto_865206 ?auto_865207 ) ) ( not ( = ?auto_865206 ?auto_865208 ) ) ( not ( = ?auto_865206 ?auto_865209 ) ) ( not ( = ?auto_865206 ?auto_865210 ) ) ( not ( = ?auto_865206 ?auto_865211 ) ) ( not ( = ?auto_865206 ?auto_865212 ) ) ( not ( = ?auto_865206 ?auto_865213 ) ) ( not ( = ?auto_865206 ?auto_865214 ) ) ( not ( = ?auto_865206 ?auto_865215 ) ) ( not ( = ?auto_865206 ?auto_865216 ) ) ( not ( = ?auto_865206 ?auto_865217 ) ) ( not ( = ?auto_865206 ?auto_865218 ) ) ( not ( = ?auto_865207 ?auto_865208 ) ) ( not ( = ?auto_865207 ?auto_865209 ) ) ( not ( = ?auto_865207 ?auto_865210 ) ) ( not ( = ?auto_865207 ?auto_865211 ) ) ( not ( = ?auto_865207 ?auto_865212 ) ) ( not ( = ?auto_865207 ?auto_865213 ) ) ( not ( = ?auto_865207 ?auto_865214 ) ) ( not ( = ?auto_865207 ?auto_865215 ) ) ( not ( = ?auto_865207 ?auto_865216 ) ) ( not ( = ?auto_865207 ?auto_865217 ) ) ( not ( = ?auto_865207 ?auto_865218 ) ) ( not ( = ?auto_865208 ?auto_865209 ) ) ( not ( = ?auto_865208 ?auto_865210 ) ) ( not ( = ?auto_865208 ?auto_865211 ) ) ( not ( = ?auto_865208 ?auto_865212 ) ) ( not ( = ?auto_865208 ?auto_865213 ) ) ( not ( = ?auto_865208 ?auto_865214 ) ) ( not ( = ?auto_865208 ?auto_865215 ) ) ( not ( = ?auto_865208 ?auto_865216 ) ) ( not ( = ?auto_865208 ?auto_865217 ) ) ( not ( = ?auto_865208 ?auto_865218 ) ) ( not ( = ?auto_865209 ?auto_865210 ) ) ( not ( = ?auto_865209 ?auto_865211 ) ) ( not ( = ?auto_865209 ?auto_865212 ) ) ( not ( = ?auto_865209 ?auto_865213 ) ) ( not ( = ?auto_865209 ?auto_865214 ) ) ( not ( = ?auto_865209 ?auto_865215 ) ) ( not ( = ?auto_865209 ?auto_865216 ) ) ( not ( = ?auto_865209 ?auto_865217 ) ) ( not ( = ?auto_865209 ?auto_865218 ) ) ( not ( = ?auto_865210 ?auto_865211 ) ) ( not ( = ?auto_865210 ?auto_865212 ) ) ( not ( = ?auto_865210 ?auto_865213 ) ) ( not ( = ?auto_865210 ?auto_865214 ) ) ( not ( = ?auto_865210 ?auto_865215 ) ) ( not ( = ?auto_865210 ?auto_865216 ) ) ( not ( = ?auto_865210 ?auto_865217 ) ) ( not ( = ?auto_865210 ?auto_865218 ) ) ( not ( = ?auto_865211 ?auto_865212 ) ) ( not ( = ?auto_865211 ?auto_865213 ) ) ( not ( = ?auto_865211 ?auto_865214 ) ) ( not ( = ?auto_865211 ?auto_865215 ) ) ( not ( = ?auto_865211 ?auto_865216 ) ) ( not ( = ?auto_865211 ?auto_865217 ) ) ( not ( = ?auto_865211 ?auto_865218 ) ) ( not ( = ?auto_865212 ?auto_865213 ) ) ( not ( = ?auto_865212 ?auto_865214 ) ) ( not ( = ?auto_865212 ?auto_865215 ) ) ( not ( = ?auto_865212 ?auto_865216 ) ) ( not ( = ?auto_865212 ?auto_865217 ) ) ( not ( = ?auto_865212 ?auto_865218 ) ) ( not ( = ?auto_865213 ?auto_865214 ) ) ( not ( = ?auto_865213 ?auto_865215 ) ) ( not ( = ?auto_865213 ?auto_865216 ) ) ( not ( = ?auto_865213 ?auto_865217 ) ) ( not ( = ?auto_865213 ?auto_865218 ) ) ( not ( = ?auto_865214 ?auto_865215 ) ) ( not ( = ?auto_865214 ?auto_865216 ) ) ( not ( = ?auto_865214 ?auto_865217 ) ) ( not ( = ?auto_865214 ?auto_865218 ) ) ( not ( = ?auto_865215 ?auto_865216 ) ) ( not ( = ?auto_865215 ?auto_865217 ) ) ( not ( = ?auto_865215 ?auto_865218 ) ) ( not ( = ?auto_865216 ?auto_865217 ) ) ( not ( = ?auto_865216 ?auto_865218 ) ) ( not ( = ?auto_865217 ?auto_865218 ) ) ( ON ?auto_865216 ?auto_865217 ) ( ON ?auto_865215 ?auto_865216 ) ( ON ?auto_865214 ?auto_865215 ) ( CLEAR ?auto_865212 ) ( ON ?auto_865213 ?auto_865214 ) ( CLEAR ?auto_865213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_865206 ?auto_865207 ?auto_865208 ?auto_865209 ?auto_865210 ?auto_865211 ?auto_865212 ?auto_865213 )
      ( MAKE-12PILE ?auto_865206 ?auto_865207 ?auto_865208 ?auto_865209 ?auto_865210 ?auto_865211 ?auto_865212 ?auto_865213 ?auto_865214 ?auto_865215 ?auto_865216 ?auto_865217 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865256 - BLOCK
      ?auto_865257 - BLOCK
      ?auto_865258 - BLOCK
      ?auto_865259 - BLOCK
      ?auto_865260 - BLOCK
      ?auto_865261 - BLOCK
      ?auto_865262 - BLOCK
      ?auto_865263 - BLOCK
      ?auto_865264 - BLOCK
      ?auto_865265 - BLOCK
      ?auto_865266 - BLOCK
      ?auto_865267 - BLOCK
    )
    :vars
    (
      ?auto_865268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865267 ?auto_865268 ) ( ON-TABLE ?auto_865256 ) ( ON ?auto_865257 ?auto_865256 ) ( ON ?auto_865258 ?auto_865257 ) ( ON ?auto_865259 ?auto_865258 ) ( ON ?auto_865260 ?auto_865259 ) ( ON ?auto_865261 ?auto_865260 ) ( not ( = ?auto_865256 ?auto_865257 ) ) ( not ( = ?auto_865256 ?auto_865258 ) ) ( not ( = ?auto_865256 ?auto_865259 ) ) ( not ( = ?auto_865256 ?auto_865260 ) ) ( not ( = ?auto_865256 ?auto_865261 ) ) ( not ( = ?auto_865256 ?auto_865262 ) ) ( not ( = ?auto_865256 ?auto_865263 ) ) ( not ( = ?auto_865256 ?auto_865264 ) ) ( not ( = ?auto_865256 ?auto_865265 ) ) ( not ( = ?auto_865256 ?auto_865266 ) ) ( not ( = ?auto_865256 ?auto_865267 ) ) ( not ( = ?auto_865256 ?auto_865268 ) ) ( not ( = ?auto_865257 ?auto_865258 ) ) ( not ( = ?auto_865257 ?auto_865259 ) ) ( not ( = ?auto_865257 ?auto_865260 ) ) ( not ( = ?auto_865257 ?auto_865261 ) ) ( not ( = ?auto_865257 ?auto_865262 ) ) ( not ( = ?auto_865257 ?auto_865263 ) ) ( not ( = ?auto_865257 ?auto_865264 ) ) ( not ( = ?auto_865257 ?auto_865265 ) ) ( not ( = ?auto_865257 ?auto_865266 ) ) ( not ( = ?auto_865257 ?auto_865267 ) ) ( not ( = ?auto_865257 ?auto_865268 ) ) ( not ( = ?auto_865258 ?auto_865259 ) ) ( not ( = ?auto_865258 ?auto_865260 ) ) ( not ( = ?auto_865258 ?auto_865261 ) ) ( not ( = ?auto_865258 ?auto_865262 ) ) ( not ( = ?auto_865258 ?auto_865263 ) ) ( not ( = ?auto_865258 ?auto_865264 ) ) ( not ( = ?auto_865258 ?auto_865265 ) ) ( not ( = ?auto_865258 ?auto_865266 ) ) ( not ( = ?auto_865258 ?auto_865267 ) ) ( not ( = ?auto_865258 ?auto_865268 ) ) ( not ( = ?auto_865259 ?auto_865260 ) ) ( not ( = ?auto_865259 ?auto_865261 ) ) ( not ( = ?auto_865259 ?auto_865262 ) ) ( not ( = ?auto_865259 ?auto_865263 ) ) ( not ( = ?auto_865259 ?auto_865264 ) ) ( not ( = ?auto_865259 ?auto_865265 ) ) ( not ( = ?auto_865259 ?auto_865266 ) ) ( not ( = ?auto_865259 ?auto_865267 ) ) ( not ( = ?auto_865259 ?auto_865268 ) ) ( not ( = ?auto_865260 ?auto_865261 ) ) ( not ( = ?auto_865260 ?auto_865262 ) ) ( not ( = ?auto_865260 ?auto_865263 ) ) ( not ( = ?auto_865260 ?auto_865264 ) ) ( not ( = ?auto_865260 ?auto_865265 ) ) ( not ( = ?auto_865260 ?auto_865266 ) ) ( not ( = ?auto_865260 ?auto_865267 ) ) ( not ( = ?auto_865260 ?auto_865268 ) ) ( not ( = ?auto_865261 ?auto_865262 ) ) ( not ( = ?auto_865261 ?auto_865263 ) ) ( not ( = ?auto_865261 ?auto_865264 ) ) ( not ( = ?auto_865261 ?auto_865265 ) ) ( not ( = ?auto_865261 ?auto_865266 ) ) ( not ( = ?auto_865261 ?auto_865267 ) ) ( not ( = ?auto_865261 ?auto_865268 ) ) ( not ( = ?auto_865262 ?auto_865263 ) ) ( not ( = ?auto_865262 ?auto_865264 ) ) ( not ( = ?auto_865262 ?auto_865265 ) ) ( not ( = ?auto_865262 ?auto_865266 ) ) ( not ( = ?auto_865262 ?auto_865267 ) ) ( not ( = ?auto_865262 ?auto_865268 ) ) ( not ( = ?auto_865263 ?auto_865264 ) ) ( not ( = ?auto_865263 ?auto_865265 ) ) ( not ( = ?auto_865263 ?auto_865266 ) ) ( not ( = ?auto_865263 ?auto_865267 ) ) ( not ( = ?auto_865263 ?auto_865268 ) ) ( not ( = ?auto_865264 ?auto_865265 ) ) ( not ( = ?auto_865264 ?auto_865266 ) ) ( not ( = ?auto_865264 ?auto_865267 ) ) ( not ( = ?auto_865264 ?auto_865268 ) ) ( not ( = ?auto_865265 ?auto_865266 ) ) ( not ( = ?auto_865265 ?auto_865267 ) ) ( not ( = ?auto_865265 ?auto_865268 ) ) ( not ( = ?auto_865266 ?auto_865267 ) ) ( not ( = ?auto_865266 ?auto_865268 ) ) ( not ( = ?auto_865267 ?auto_865268 ) ) ( ON ?auto_865266 ?auto_865267 ) ( ON ?auto_865265 ?auto_865266 ) ( ON ?auto_865264 ?auto_865265 ) ( ON ?auto_865263 ?auto_865264 ) ( CLEAR ?auto_865261 ) ( ON ?auto_865262 ?auto_865263 ) ( CLEAR ?auto_865262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_865256 ?auto_865257 ?auto_865258 ?auto_865259 ?auto_865260 ?auto_865261 ?auto_865262 )
      ( MAKE-12PILE ?auto_865256 ?auto_865257 ?auto_865258 ?auto_865259 ?auto_865260 ?auto_865261 ?auto_865262 ?auto_865263 ?auto_865264 ?auto_865265 ?auto_865266 ?auto_865267 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865306 - BLOCK
      ?auto_865307 - BLOCK
      ?auto_865308 - BLOCK
      ?auto_865309 - BLOCK
      ?auto_865310 - BLOCK
      ?auto_865311 - BLOCK
      ?auto_865312 - BLOCK
      ?auto_865313 - BLOCK
      ?auto_865314 - BLOCK
      ?auto_865315 - BLOCK
      ?auto_865316 - BLOCK
      ?auto_865317 - BLOCK
    )
    :vars
    (
      ?auto_865318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865317 ?auto_865318 ) ( ON-TABLE ?auto_865306 ) ( ON ?auto_865307 ?auto_865306 ) ( ON ?auto_865308 ?auto_865307 ) ( ON ?auto_865309 ?auto_865308 ) ( ON ?auto_865310 ?auto_865309 ) ( not ( = ?auto_865306 ?auto_865307 ) ) ( not ( = ?auto_865306 ?auto_865308 ) ) ( not ( = ?auto_865306 ?auto_865309 ) ) ( not ( = ?auto_865306 ?auto_865310 ) ) ( not ( = ?auto_865306 ?auto_865311 ) ) ( not ( = ?auto_865306 ?auto_865312 ) ) ( not ( = ?auto_865306 ?auto_865313 ) ) ( not ( = ?auto_865306 ?auto_865314 ) ) ( not ( = ?auto_865306 ?auto_865315 ) ) ( not ( = ?auto_865306 ?auto_865316 ) ) ( not ( = ?auto_865306 ?auto_865317 ) ) ( not ( = ?auto_865306 ?auto_865318 ) ) ( not ( = ?auto_865307 ?auto_865308 ) ) ( not ( = ?auto_865307 ?auto_865309 ) ) ( not ( = ?auto_865307 ?auto_865310 ) ) ( not ( = ?auto_865307 ?auto_865311 ) ) ( not ( = ?auto_865307 ?auto_865312 ) ) ( not ( = ?auto_865307 ?auto_865313 ) ) ( not ( = ?auto_865307 ?auto_865314 ) ) ( not ( = ?auto_865307 ?auto_865315 ) ) ( not ( = ?auto_865307 ?auto_865316 ) ) ( not ( = ?auto_865307 ?auto_865317 ) ) ( not ( = ?auto_865307 ?auto_865318 ) ) ( not ( = ?auto_865308 ?auto_865309 ) ) ( not ( = ?auto_865308 ?auto_865310 ) ) ( not ( = ?auto_865308 ?auto_865311 ) ) ( not ( = ?auto_865308 ?auto_865312 ) ) ( not ( = ?auto_865308 ?auto_865313 ) ) ( not ( = ?auto_865308 ?auto_865314 ) ) ( not ( = ?auto_865308 ?auto_865315 ) ) ( not ( = ?auto_865308 ?auto_865316 ) ) ( not ( = ?auto_865308 ?auto_865317 ) ) ( not ( = ?auto_865308 ?auto_865318 ) ) ( not ( = ?auto_865309 ?auto_865310 ) ) ( not ( = ?auto_865309 ?auto_865311 ) ) ( not ( = ?auto_865309 ?auto_865312 ) ) ( not ( = ?auto_865309 ?auto_865313 ) ) ( not ( = ?auto_865309 ?auto_865314 ) ) ( not ( = ?auto_865309 ?auto_865315 ) ) ( not ( = ?auto_865309 ?auto_865316 ) ) ( not ( = ?auto_865309 ?auto_865317 ) ) ( not ( = ?auto_865309 ?auto_865318 ) ) ( not ( = ?auto_865310 ?auto_865311 ) ) ( not ( = ?auto_865310 ?auto_865312 ) ) ( not ( = ?auto_865310 ?auto_865313 ) ) ( not ( = ?auto_865310 ?auto_865314 ) ) ( not ( = ?auto_865310 ?auto_865315 ) ) ( not ( = ?auto_865310 ?auto_865316 ) ) ( not ( = ?auto_865310 ?auto_865317 ) ) ( not ( = ?auto_865310 ?auto_865318 ) ) ( not ( = ?auto_865311 ?auto_865312 ) ) ( not ( = ?auto_865311 ?auto_865313 ) ) ( not ( = ?auto_865311 ?auto_865314 ) ) ( not ( = ?auto_865311 ?auto_865315 ) ) ( not ( = ?auto_865311 ?auto_865316 ) ) ( not ( = ?auto_865311 ?auto_865317 ) ) ( not ( = ?auto_865311 ?auto_865318 ) ) ( not ( = ?auto_865312 ?auto_865313 ) ) ( not ( = ?auto_865312 ?auto_865314 ) ) ( not ( = ?auto_865312 ?auto_865315 ) ) ( not ( = ?auto_865312 ?auto_865316 ) ) ( not ( = ?auto_865312 ?auto_865317 ) ) ( not ( = ?auto_865312 ?auto_865318 ) ) ( not ( = ?auto_865313 ?auto_865314 ) ) ( not ( = ?auto_865313 ?auto_865315 ) ) ( not ( = ?auto_865313 ?auto_865316 ) ) ( not ( = ?auto_865313 ?auto_865317 ) ) ( not ( = ?auto_865313 ?auto_865318 ) ) ( not ( = ?auto_865314 ?auto_865315 ) ) ( not ( = ?auto_865314 ?auto_865316 ) ) ( not ( = ?auto_865314 ?auto_865317 ) ) ( not ( = ?auto_865314 ?auto_865318 ) ) ( not ( = ?auto_865315 ?auto_865316 ) ) ( not ( = ?auto_865315 ?auto_865317 ) ) ( not ( = ?auto_865315 ?auto_865318 ) ) ( not ( = ?auto_865316 ?auto_865317 ) ) ( not ( = ?auto_865316 ?auto_865318 ) ) ( not ( = ?auto_865317 ?auto_865318 ) ) ( ON ?auto_865316 ?auto_865317 ) ( ON ?auto_865315 ?auto_865316 ) ( ON ?auto_865314 ?auto_865315 ) ( ON ?auto_865313 ?auto_865314 ) ( ON ?auto_865312 ?auto_865313 ) ( CLEAR ?auto_865310 ) ( ON ?auto_865311 ?auto_865312 ) ( CLEAR ?auto_865311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_865306 ?auto_865307 ?auto_865308 ?auto_865309 ?auto_865310 ?auto_865311 )
      ( MAKE-12PILE ?auto_865306 ?auto_865307 ?auto_865308 ?auto_865309 ?auto_865310 ?auto_865311 ?auto_865312 ?auto_865313 ?auto_865314 ?auto_865315 ?auto_865316 ?auto_865317 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865356 - BLOCK
      ?auto_865357 - BLOCK
      ?auto_865358 - BLOCK
      ?auto_865359 - BLOCK
      ?auto_865360 - BLOCK
      ?auto_865361 - BLOCK
      ?auto_865362 - BLOCK
      ?auto_865363 - BLOCK
      ?auto_865364 - BLOCK
      ?auto_865365 - BLOCK
      ?auto_865366 - BLOCK
      ?auto_865367 - BLOCK
    )
    :vars
    (
      ?auto_865368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865367 ?auto_865368 ) ( ON-TABLE ?auto_865356 ) ( ON ?auto_865357 ?auto_865356 ) ( ON ?auto_865358 ?auto_865357 ) ( ON ?auto_865359 ?auto_865358 ) ( not ( = ?auto_865356 ?auto_865357 ) ) ( not ( = ?auto_865356 ?auto_865358 ) ) ( not ( = ?auto_865356 ?auto_865359 ) ) ( not ( = ?auto_865356 ?auto_865360 ) ) ( not ( = ?auto_865356 ?auto_865361 ) ) ( not ( = ?auto_865356 ?auto_865362 ) ) ( not ( = ?auto_865356 ?auto_865363 ) ) ( not ( = ?auto_865356 ?auto_865364 ) ) ( not ( = ?auto_865356 ?auto_865365 ) ) ( not ( = ?auto_865356 ?auto_865366 ) ) ( not ( = ?auto_865356 ?auto_865367 ) ) ( not ( = ?auto_865356 ?auto_865368 ) ) ( not ( = ?auto_865357 ?auto_865358 ) ) ( not ( = ?auto_865357 ?auto_865359 ) ) ( not ( = ?auto_865357 ?auto_865360 ) ) ( not ( = ?auto_865357 ?auto_865361 ) ) ( not ( = ?auto_865357 ?auto_865362 ) ) ( not ( = ?auto_865357 ?auto_865363 ) ) ( not ( = ?auto_865357 ?auto_865364 ) ) ( not ( = ?auto_865357 ?auto_865365 ) ) ( not ( = ?auto_865357 ?auto_865366 ) ) ( not ( = ?auto_865357 ?auto_865367 ) ) ( not ( = ?auto_865357 ?auto_865368 ) ) ( not ( = ?auto_865358 ?auto_865359 ) ) ( not ( = ?auto_865358 ?auto_865360 ) ) ( not ( = ?auto_865358 ?auto_865361 ) ) ( not ( = ?auto_865358 ?auto_865362 ) ) ( not ( = ?auto_865358 ?auto_865363 ) ) ( not ( = ?auto_865358 ?auto_865364 ) ) ( not ( = ?auto_865358 ?auto_865365 ) ) ( not ( = ?auto_865358 ?auto_865366 ) ) ( not ( = ?auto_865358 ?auto_865367 ) ) ( not ( = ?auto_865358 ?auto_865368 ) ) ( not ( = ?auto_865359 ?auto_865360 ) ) ( not ( = ?auto_865359 ?auto_865361 ) ) ( not ( = ?auto_865359 ?auto_865362 ) ) ( not ( = ?auto_865359 ?auto_865363 ) ) ( not ( = ?auto_865359 ?auto_865364 ) ) ( not ( = ?auto_865359 ?auto_865365 ) ) ( not ( = ?auto_865359 ?auto_865366 ) ) ( not ( = ?auto_865359 ?auto_865367 ) ) ( not ( = ?auto_865359 ?auto_865368 ) ) ( not ( = ?auto_865360 ?auto_865361 ) ) ( not ( = ?auto_865360 ?auto_865362 ) ) ( not ( = ?auto_865360 ?auto_865363 ) ) ( not ( = ?auto_865360 ?auto_865364 ) ) ( not ( = ?auto_865360 ?auto_865365 ) ) ( not ( = ?auto_865360 ?auto_865366 ) ) ( not ( = ?auto_865360 ?auto_865367 ) ) ( not ( = ?auto_865360 ?auto_865368 ) ) ( not ( = ?auto_865361 ?auto_865362 ) ) ( not ( = ?auto_865361 ?auto_865363 ) ) ( not ( = ?auto_865361 ?auto_865364 ) ) ( not ( = ?auto_865361 ?auto_865365 ) ) ( not ( = ?auto_865361 ?auto_865366 ) ) ( not ( = ?auto_865361 ?auto_865367 ) ) ( not ( = ?auto_865361 ?auto_865368 ) ) ( not ( = ?auto_865362 ?auto_865363 ) ) ( not ( = ?auto_865362 ?auto_865364 ) ) ( not ( = ?auto_865362 ?auto_865365 ) ) ( not ( = ?auto_865362 ?auto_865366 ) ) ( not ( = ?auto_865362 ?auto_865367 ) ) ( not ( = ?auto_865362 ?auto_865368 ) ) ( not ( = ?auto_865363 ?auto_865364 ) ) ( not ( = ?auto_865363 ?auto_865365 ) ) ( not ( = ?auto_865363 ?auto_865366 ) ) ( not ( = ?auto_865363 ?auto_865367 ) ) ( not ( = ?auto_865363 ?auto_865368 ) ) ( not ( = ?auto_865364 ?auto_865365 ) ) ( not ( = ?auto_865364 ?auto_865366 ) ) ( not ( = ?auto_865364 ?auto_865367 ) ) ( not ( = ?auto_865364 ?auto_865368 ) ) ( not ( = ?auto_865365 ?auto_865366 ) ) ( not ( = ?auto_865365 ?auto_865367 ) ) ( not ( = ?auto_865365 ?auto_865368 ) ) ( not ( = ?auto_865366 ?auto_865367 ) ) ( not ( = ?auto_865366 ?auto_865368 ) ) ( not ( = ?auto_865367 ?auto_865368 ) ) ( ON ?auto_865366 ?auto_865367 ) ( ON ?auto_865365 ?auto_865366 ) ( ON ?auto_865364 ?auto_865365 ) ( ON ?auto_865363 ?auto_865364 ) ( ON ?auto_865362 ?auto_865363 ) ( ON ?auto_865361 ?auto_865362 ) ( CLEAR ?auto_865359 ) ( ON ?auto_865360 ?auto_865361 ) ( CLEAR ?auto_865360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_865356 ?auto_865357 ?auto_865358 ?auto_865359 ?auto_865360 )
      ( MAKE-12PILE ?auto_865356 ?auto_865357 ?auto_865358 ?auto_865359 ?auto_865360 ?auto_865361 ?auto_865362 ?auto_865363 ?auto_865364 ?auto_865365 ?auto_865366 ?auto_865367 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865406 - BLOCK
      ?auto_865407 - BLOCK
      ?auto_865408 - BLOCK
      ?auto_865409 - BLOCK
      ?auto_865410 - BLOCK
      ?auto_865411 - BLOCK
      ?auto_865412 - BLOCK
      ?auto_865413 - BLOCK
      ?auto_865414 - BLOCK
      ?auto_865415 - BLOCK
      ?auto_865416 - BLOCK
      ?auto_865417 - BLOCK
    )
    :vars
    (
      ?auto_865418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865417 ?auto_865418 ) ( ON-TABLE ?auto_865406 ) ( ON ?auto_865407 ?auto_865406 ) ( ON ?auto_865408 ?auto_865407 ) ( not ( = ?auto_865406 ?auto_865407 ) ) ( not ( = ?auto_865406 ?auto_865408 ) ) ( not ( = ?auto_865406 ?auto_865409 ) ) ( not ( = ?auto_865406 ?auto_865410 ) ) ( not ( = ?auto_865406 ?auto_865411 ) ) ( not ( = ?auto_865406 ?auto_865412 ) ) ( not ( = ?auto_865406 ?auto_865413 ) ) ( not ( = ?auto_865406 ?auto_865414 ) ) ( not ( = ?auto_865406 ?auto_865415 ) ) ( not ( = ?auto_865406 ?auto_865416 ) ) ( not ( = ?auto_865406 ?auto_865417 ) ) ( not ( = ?auto_865406 ?auto_865418 ) ) ( not ( = ?auto_865407 ?auto_865408 ) ) ( not ( = ?auto_865407 ?auto_865409 ) ) ( not ( = ?auto_865407 ?auto_865410 ) ) ( not ( = ?auto_865407 ?auto_865411 ) ) ( not ( = ?auto_865407 ?auto_865412 ) ) ( not ( = ?auto_865407 ?auto_865413 ) ) ( not ( = ?auto_865407 ?auto_865414 ) ) ( not ( = ?auto_865407 ?auto_865415 ) ) ( not ( = ?auto_865407 ?auto_865416 ) ) ( not ( = ?auto_865407 ?auto_865417 ) ) ( not ( = ?auto_865407 ?auto_865418 ) ) ( not ( = ?auto_865408 ?auto_865409 ) ) ( not ( = ?auto_865408 ?auto_865410 ) ) ( not ( = ?auto_865408 ?auto_865411 ) ) ( not ( = ?auto_865408 ?auto_865412 ) ) ( not ( = ?auto_865408 ?auto_865413 ) ) ( not ( = ?auto_865408 ?auto_865414 ) ) ( not ( = ?auto_865408 ?auto_865415 ) ) ( not ( = ?auto_865408 ?auto_865416 ) ) ( not ( = ?auto_865408 ?auto_865417 ) ) ( not ( = ?auto_865408 ?auto_865418 ) ) ( not ( = ?auto_865409 ?auto_865410 ) ) ( not ( = ?auto_865409 ?auto_865411 ) ) ( not ( = ?auto_865409 ?auto_865412 ) ) ( not ( = ?auto_865409 ?auto_865413 ) ) ( not ( = ?auto_865409 ?auto_865414 ) ) ( not ( = ?auto_865409 ?auto_865415 ) ) ( not ( = ?auto_865409 ?auto_865416 ) ) ( not ( = ?auto_865409 ?auto_865417 ) ) ( not ( = ?auto_865409 ?auto_865418 ) ) ( not ( = ?auto_865410 ?auto_865411 ) ) ( not ( = ?auto_865410 ?auto_865412 ) ) ( not ( = ?auto_865410 ?auto_865413 ) ) ( not ( = ?auto_865410 ?auto_865414 ) ) ( not ( = ?auto_865410 ?auto_865415 ) ) ( not ( = ?auto_865410 ?auto_865416 ) ) ( not ( = ?auto_865410 ?auto_865417 ) ) ( not ( = ?auto_865410 ?auto_865418 ) ) ( not ( = ?auto_865411 ?auto_865412 ) ) ( not ( = ?auto_865411 ?auto_865413 ) ) ( not ( = ?auto_865411 ?auto_865414 ) ) ( not ( = ?auto_865411 ?auto_865415 ) ) ( not ( = ?auto_865411 ?auto_865416 ) ) ( not ( = ?auto_865411 ?auto_865417 ) ) ( not ( = ?auto_865411 ?auto_865418 ) ) ( not ( = ?auto_865412 ?auto_865413 ) ) ( not ( = ?auto_865412 ?auto_865414 ) ) ( not ( = ?auto_865412 ?auto_865415 ) ) ( not ( = ?auto_865412 ?auto_865416 ) ) ( not ( = ?auto_865412 ?auto_865417 ) ) ( not ( = ?auto_865412 ?auto_865418 ) ) ( not ( = ?auto_865413 ?auto_865414 ) ) ( not ( = ?auto_865413 ?auto_865415 ) ) ( not ( = ?auto_865413 ?auto_865416 ) ) ( not ( = ?auto_865413 ?auto_865417 ) ) ( not ( = ?auto_865413 ?auto_865418 ) ) ( not ( = ?auto_865414 ?auto_865415 ) ) ( not ( = ?auto_865414 ?auto_865416 ) ) ( not ( = ?auto_865414 ?auto_865417 ) ) ( not ( = ?auto_865414 ?auto_865418 ) ) ( not ( = ?auto_865415 ?auto_865416 ) ) ( not ( = ?auto_865415 ?auto_865417 ) ) ( not ( = ?auto_865415 ?auto_865418 ) ) ( not ( = ?auto_865416 ?auto_865417 ) ) ( not ( = ?auto_865416 ?auto_865418 ) ) ( not ( = ?auto_865417 ?auto_865418 ) ) ( ON ?auto_865416 ?auto_865417 ) ( ON ?auto_865415 ?auto_865416 ) ( ON ?auto_865414 ?auto_865415 ) ( ON ?auto_865413 ?auto_865414 ) ( ON ?auto_865412 ?auto_865413 ) ( ON ?auto_865411 ?auto_865412 ) ( ON ?auto_865410 ?auto_865411 ) ( CLEAR ?auto_865408 ) ( ON ?auto_865409 ?auto_865410 ) ( CLEAR ?auto_865409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_865406 ?auto_865407 ?auto_865408 ?auto_865409 )
      ( MAKE-12PILE ?auto_865406 ?auto_865407 ?auto_865408 ?auto_865409 ?auto_865410 ?auto_865411 ?auto_865412 ?auto_865413 ?auto_865414 ?auto_865415 ?auto_865416 ?auto_865417 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865456 - BLOCK
      ?auto_865457 - BLOCK
      ?auto_865458 - BLOCK
      ?auto_865459 - BLOCK
      ?auto_865460 - BLOCK
      ?auto_865461 - BLOCK
      ?auto_865462 - BLOCK
      ?auto_865463 - BLOCK
      ?auto_865464 - BLOCK
      ?auto_865465 - BLOCK
      ?auto_865466 - BLOCK
      ?auto_865467 - BLOCK
    )
    :vars
    (
      ?auto_865468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865467 ?auto_865468 ) ( ON-TABLE ?auto_865456 ) ( ON ?auto_865457 ?auto_865456 ) ( not ( = ?auto_865456 ?auto_865457 ) ) ( not ( = ?auto_865456 ?auto_865458 ) ) ( not ( = ?auto_865456 ?auto_865459 ) ) ( not ( = ?auto_865456 ?auto_865460 ) ) ( not ( = ?auto_865456 ?auto_865461 ) ) ( not ( = ?auto_865456 ?auto_865462 ) ) ( not ( = ?auto_865456 ?auto_865463 ) ) ( not ( = ?auto_865456 ?auto_865464 ) ) ( not ( = ?auto_865456 ?auto_865465 ) ) ( not ( = ?auto_865456 ?auto_865466 ) ) ( not ( = ?auto_865456 ?auto_865467 ) ) ( not ( = ?auto_865456 ?auto_865468 ) ) ( not ( = ?auto_865457 ?auto_865458 ) ) ( not ( = ?auto_865457 ?auto_865459 ) ) ( not ( = ?auto_865457 ?auto_865460 ) ) ( not ( = ?auto_865457 ?auto_865461 ) ) ( not ( = ?auto_865457 ?auto_865462 ) ) ( not ( = ?auto_865457 ?auto_865463 ) ) ( not ( = ?auto_865457 ?auto_865464 ) ) ( not ( = ?auto_865457 ?auto_865465 ) ) ( not ( = ?auto_865457 ?auto_865466 ) ) ( not ( = ?auto_865457 ?auto_865467 ) ) ( not ( = ?auto_865457 ?auto_865468 ) ) ( not ( = ?auto_865458 ?auto_865459 ) ) ( not ( = ?auto_865458 ?auto_865460 ) ) ( not ( = ?auto_865458 ?auto_865461 ) ) ( not ( = ?auto_865458 ?auto_865462 ) ) ( not ( = ?auto_865458 ?auto_865463 ) ) ( not ( = ?auto_865458 ?auto_865464 ) ) ( not ( = ?auto_865458 ?auto_865465 ) ) ( not ( = ?auto_865458 ?auto_865466 ) ) ( not ( = ?auto_865458 ?auto_865467 ) ) ( not ( = ?auto_865458 ?auto_865468 ) ) ( not ( = ?auto_865459 ?auto_865460 ) ) ( not ( = ?auto_865459 ?auto_865461 ) ) ( not ( = ?auto_865459 ?auto_865462 ) ) ( not ( = ?auto_865459 ?auto_865463 ) ) ( not ( = ?auto_865459 ?auto_865464 ) ) ( not ( = ?auto_865459 ?auto_865465 ) ) ( not ( = ?auto_865459 ?auto_865466 ) ) ( not ( = ?auto_865459 ?auto_865467 ) ) ( not ( = ?auto_865459 ?auto_865468 ) ) ( not ( = ?auto_865460 ?auto_865461 ) ) ( not ( = ?auto_865460 ?auto_865462 ) ) ( not ( = ?auto_865460 ?auto_865463 ) ) ( not ( = ?auto_865460 ?auto_865464 ) ) ( not ( = ?auto_865460 ?auto_865465 ) ) ( not ( = ?auto_865460 ?auto_865466 ) ) ( not ( = ?auto_865460 ?auto_865467 ) ) ( not ( = ?auto_865460 ?auto_865468 ) ) ( not ( = ?auto_865461 ?auto_865462 ) ) ( not ( = ?auto_865461 ?auto_865463 ) ) ( not ( = ?auto_865461 ?auto_865464 ) ) ( not ( = ?auto_865461 ?auto_865465 ) ) ( not ( = ?auto_865461 ?auto_865466 ) ) ( not ( = ?auto_865461 ?auto_865467 ) ) ( not ( = ?auto_865461 ?auto_865468 ) ) ( not ( = ?auto_865462 ?auto_865463 ) ) ( not ( = ?auto_865462 ?auto_865464 ) ) ( not ( = ?auto_865462 ?auto_865465 ) ) ( not ( = ?auto_865462 ?auto_865466 ) ) ( not ( = ?auto_865462 ?auto_865467 ) ) ( not ( = ?auto_865462 ?auto_865468 ) ) ( not ( = ?auto_865463 ?auto_865464 ) ) ( not ( = ?auto_865463 ?auto_865465 ) ) ( not ( = ?auto_865463 ?auto_865466 ) ) ( not ( = ?auto_865463 ?auto_865467 ) ) ( not ( = ?auto_865463 ?auto_865468 ) ) ( not ( = ?auto_865464 ?auto_865465 ) ) ( not ( = ?auto_865464 ?auto_865466 ) ) ( not ( = ?auto_865464 ?auto_865467 ) ) ( not ( = ?auto_865464 ?auto_865468 ) ) ( not ( = ?auto_865465 ?auto_865466 ) ) ( not ( = ?auto_865465 ?auto_865467 ) ) ( not ( = ?auto_865465 ?auto_865468 ) ) ( not ( = ?auto_865466 ?auto_865467 ) ) ( not ( = ?auto_865466 ?auto_865468 ) ) ( not ( = ?auto_865467 ?auto_865468 ) ) ( ON ?auto_865466 ?auto_865467 ) ( ON ?auto_865465 ?auto_865466 ) ( ON ?auto_865464 ?auto_865465 ) ( ON ?auto_865463 ?auto_865464 ) ( ON ?auto_865462 ?auto_865463 ) ( ON ?auto_865461 ?auto_865462 ) ( ON ?auto_865460 ?auto_865461 ) ( ON ?auto_865459 ?auto_865460 ) ( CLEAR ?auto_865457 ) ( ON ?auto_865458 ?auto_865459 ) ( CLEAR ?auto_865458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_865456 ?auto_865457 ?auto_865458 )
      ( MAKE-12PILE ?auto_865456 ?auto_865457 ?auto_865458 ?auto_865459 ?auto_865460 ?auto_865461 ?auto_865462 ?auto_865463 ?auto_865464 ?auto_865465 ?auto_865466 ?auto_865467 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865506 - BLOCK
      ?auto_865507 - BLOCK
      ?auto_865508 - BLOCK
      ?auto_865509 - BLOCK
      ?auto_865510 - BLOCK
      ?auto_865511 - BLOCK
      ?auto_865512 - BLOCK
      ?auto_865513 - BLOCK
      ?auto_865514 - BLOCK
      ?auto_865515 - BLOCK
      ?auto_865516 - BLOCK
      ?auto_865517 - BLOCK
    )
    :vars
    (
      ?auto_865518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865517 ?auto_865518 ) ( ON-TABLE ?auto_865506 ) ( not ( = ?auto_865506 ?auto_865507 ) ) ( not ( = ?auto_865506 ?auto_865508 ) ) ( not ( = ?auto_865506 ?auto_865509 ) ) ( not ( = ?auto_865506 ?auto_865510 ) ) ( not ( = ?auto_865506 ?auto_865511 ) ) ( not ( = ?auto_865506 ?auto_865512 ) ) ( not ( = ?auto_865506 ?auto_865513 ) ) ( not ( = ?auto_865506 ?auto_865514 ) ) ( not ( = ?auto_865506 ?auto_865515 ) ) ( not ( = ?auto_865506 ?auto_865516 ) ) ( not ( = ?auto_865506 ?auto_865517 ) ) ( not ( = ?auto_865506 ?auto_865518 ) ) ( not ( = ?auto_865507 ?auto_865508 ) ) ( not ( = ?auto_865507 ?auto_865509 ) ) ( not ( = ?auto_865507 ?auto_865510 ) ) ( not ( = ?auto_865507 ?auto_865511 ) ) ( not ( = ?auto_865507 ?auto_865512 ) ) ( not ( = ?auto_865507 ?auto_865513 ) ) ( not ( = ?auto_865507 ?auto_865514 ) ) ( not ( = ?auto_865507 ?auto_865515 ) ) ( not ( = ?auto_865507 ?auto_865516 ) ) ( not ( = ?auto_865507 ?auto_865517 ) ) ( not ( = ?auto_865507 ?auto_865518 ) ) ( not ( = ?auto_865508 ?auto_865509 ) ) ( not ( = ?auto_865508 ?auto_865510 ) ) ( not ( = ?auto_865508 ?auto_865511 ) ) ( not ( = ?auto_865508 ?auto_865512 ) ) ( not ( = ?auto_865508 ?auto_865513 ) ) ( not ( = ?auto_865508 ?auto_865514 ) ) ( not ( = ?auto_865508 ?auto_865515 ) ) ( not ( = ?auto_865508 ?auto_865516 ) ) ( not ( = ?auto_865508 ?auto_865517 ) ) ( not ( = ?auto_865508 ?auto_865518 ) ) ( not ( = ?auto_865509 ?auto_865510 ) ) ( not ( = ?auto_865509 ?auto_865511 ) ) ( not ( = ?auto_865509 ?auto_865512 ) ) ( not ( = ?auto_865509 ?auto_865513 ) ) ( not ( = ?auto_865509 ?auto_865514 ) ) ( not ( = ?auto_865509 ?auto_865515 ) ) ( not ( = ?auto_865509 ?auto_865516 ) ) ( not ( = ?auto_865509 ?auto_865517 ) ) ( not ( = ?auto_865509 ?auto_865518 ) ) ( not ( = ?auto_865510 ?auto_865511 ) ) ( not ( = ?auto_865510 ?auto_865512 ) ) ( not ( = ?auto_865510 ?auto_865513 ) ) ( not ( = ?auto_865510 ?auto_865514 ) ) ( not ( = ?auto_865510 ?auto_865515 ) ) ( not ( = ?auto_865510 ?auto_865516 ) ) ( not ( = ?auto_865510 ?auto_865517 ) ) ( not ( = ?auto_865510 ?auto_865518 ) ) ( not ( = ?auto_865511 ?auto_865512 ) ) ( not ( = ?auto_865511 ?auto_865513 ) ) ( not ( = ?auto_865511 ?auto_865514 ) ) ( not ( = ?auto_865511 ?auto_865515 ) ) ( not ( = ?auto_865511 ?auto_865516 ) ) ( not ( = ?auto_865511 ?auto_865517 ) ) ( not ( = ?auto_865511 ?auto_865518 ) ) ( not ( = ?auto_865512 ?auto_865513 ) ) ( not ( = ?auto_865512 ?auto_865514 ) ) ( not ( = ?auto_865512 ?auto_865515 ) ) ( not ( = ?auto_865512 ?auto_865516 ) ) ( not ( = ?auto_865512 ?auto_865517 ) ) ( not ( = ?auto_865512 ?auto_865518 ) ) ( not ( = ?auto_865513 ?auto_865514 ) ) ( not ( = ?auto_865513 ?auto_865515 ) ) ( not ( = ?auto_865513 ?auto_865516 ) ) ( not ( = ?auto_865513 ?auto_865517 ) ) ( not ( = ?auto_865513 ?auto_865518 ) ) ( not ( = ?auto_865514 ?auto_865515 ) ) ( not ( = ?auto_865514 ?auto_865516 ) ) ( not ( = ?auto_865514 ?auto_865517 ) ) ( not ( = ?auto_865514 ?auto_865518 ) ) ( not ( = ?auto_865515 ?auto_865516 ) ) ( not ( = ?auto_865515 ?auto_865517 ) ) ( not ( = ?auto_865515 ?auto_865518 ) ) ( not ( = ?auto_865516 ?auto_865517 ) ) ( not ( = ?auto_865516 ?auto_865518 ) ) ( not ( = ?auto_865517 ?auto_865518 ) ) ( ON ?auto_865516 ?auto_865517 ) ( ON ?auto_865515 ?auto_865516 ) ( ON ?auto_865514 ?auto_865515 ) ( ON ?auto_865513 ?auto_865514 ) ( ON ?auto_865512 ?auto_865513 ) ( ON ?auto_865511 ?auto_865512 ) ( ON ?auto_865510 ?auto_865511 ) ( ON ?auto_865509 ?auto_865510 ) ( ON ?auto_865508 ?auto_865509 ) ( CLEAR ?auto_865506 ) ( ON ?auto_865507 ?auto_865508 ) ( CLEAR ?auto_865507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_865506 ?auto_865507 )
      ( MAKE-12PILE ?auto_865506 ?auto_865507 ?auto_865508 ?auto_865509 ?auto_865510 ?auto_865511 ?auto_865512 ?auto_865513 ?auto_865514 ?auto_865515 ?auto_865516 ?auto_865517 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_865556 - BLOCK
      ?auto_865557 - BLOCK
      ?auto_865558 - BLOCK
      ?auto_865559 - BLOCK
      ?auto_865560 - BLOCK
      ?auto_865561 - BLOCK
      ?auto_865562 - BLOCK
      ?auto_865563 - BLOCK
      ?auto_865564 - BLOCK
      ?auto_865565 - BLOCK
      ?auto_865566 - BLOCK
      ?auto_865567 - BLOCK
    )
    :vars
    (
      ?auto_865568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865567 ?auto_865568 ) ( not ( = ?auto_865556 ?auto_865557 ) ) ( not ( = ?auto_865556 ?auto_865558 ) ) ( not ( = ?auto_865556 ?auto_865559 ) ) ( not ( = ?auto_865556 ?auto_865560 ) ) ( not ( = ?auto_865556 ?auto_865561 ) ) ( not ( = ?auto_865556 ?auto_865562 ) ) ( not ( = ?auto_865556 ?auto_865563 ) ) ( not ( = ?auto_865556 ?auto_865564 ) ) ( not ( = ?auto_865556 ?auto_865565 ) ) ( not ( = ?auto_865556 ?auto_865566 ) ) ( not ( = ?auto_865556 ?auto_865567 ) ) ( not ( = ?auto_865556 ?auto_865568 ) ) ( not ( = ?auto_865557 ?auto_865558 ) ) ( not ( = ?auto_865557 ?auto_865559 ) ) ( not ( = ?auto_865557 ?auto_865560 ) ) ( not ( = ?auto_865557 ?auto_865561 ) ) ( not ( = ?auto_865557 ?auto_865562 ) ) ( not ( = ?auto_865557 ?auto_865563 ) ) ( not ( = ?auto_865557 ?auto_865564 ) ) ( not ( = ?auto_865557 ?auto_865565 ) ) ( not ( = ?auto_865557 ?auto_865566 ) ) ( not ( = ?auto_865557 ?auto_865567 ) ) ( not ( = ?auto_865557 ?auto_865568 ) ) ( not ( = ?auto_865558 ?auto_865559 ) ) ( not ( = ?auto_865558 ?auto_865560 ) ) ( not ( = ?auto_865558 ?auto_865561 ) ) ( not ( = ?auto_865558 ?auto_865562 ) ) ( not ( = ?auto_865558 ?auto_865563 ) ) ( not ( = ?auto_865558 ?auto_865564 ) ) ( not ( = ?auto_865558 ?auto_865565 ) ) ( not ( = ?auto_865558 ?auto_865566 ) ) ( not ( = ?auto_865558 ?auto_865567 ) ) ( not ( = ?auto_865558 ?auto_865568 ) ) ( not ( = ?auto_865559 ?auto_865560 ) ) ( not ( = ?auto_865559 ?auto_865561 ) ) ( not ( = ?auto_865559 ?auto_865562 ) ) ( not ( = ?auto_865559 ?auto_865563 ) ) ( not ( = ?auto_865559 ?auto_865564 ) ) ( not ( = ?auto_865559 ?auto_865565 ) ) ( not ( = ?auto_865559 ?auto_865566 ) ) ( not ( = ?auto_865559 ?auto_865567 ) ) ( not ( = ?auto_865559 ?auto_865568 ) ) ( not ( = ?auto_865560 ?auto_865561 ) ) ( not ( = ?auto_865560 ?auto_865562 ) ) ( not ( = ?auto_865560 ?auto_865563 ) ) ( not ( = ?auto_865560 ?auto_865564 ) ) ( not ( = ?auto_865560 ?auto_865565 ) ) ( not ( = ?auto_865560 ?auto_865566 ) ) ( not ( = ?auto_865560 ?auto_865567 ) ) ( not ( = ?auto_865560 ?auto_865568 ) ) ( not ( = ?auto_865561 ?auto_865562 ) ) ( not ( = ?auto_865561 ?auto_865563 ) ) ( not ( = ?auto_865561 ?auto_865564 ) ) ( not ( = ?auto_865561 ?auto_865565 ) ) ( not ( = ?auto_865561 ?auto_865566 ) ) ( not ( = ?auto_865561 ?auto_865567 ) ) ( not ( = ?auto_865561 ?auto_865568 ) ) ( not ( = ?auto_865562 ?auto_865563 ) ) ( not ( = ?auto_865562 ?auto_865564 ) ) ( not ( = ?auto_865562 ?auto_865565 ) ) ( not ( = ?auto_865562 ?auto_865566 ) ) ( not ( = ?auto_865562 ?auto_865567 ) ) ( not ( = ?auto_865562 ?auto_865568 ) ) ( not ( = ?auto_865563 ?auto_865564 ) ) ( not ( = ?auto_865563 ?auto_865565 ) ) ( not ( = ?auto_865563 ?auto_865566 ) ) ( not ( = ?auto_865563 ?auto_865567 ) ) ( not ( = ?auto_865563 ?auto_865568 ) ) ( not ( = ?auto_865564 ?auto_865565 ) ) ( not ( = ?auto_865564 ?auto_865566 ) ) ( not ( = ?auto_865564 ?auto_865567 ) ) ( not ( = ?auto_865564 ?auto_865568 ) ) ( not ( = ?auto_865565 ?auto_865566 ) ) ( not ( = ?auto_865565 ?auto_865567 ) ) ( not ( = ?auto_865565 ?auto_865568 ) ) ( not ( = ?auto_865566 ?auto_865567 ) ) ( not ( = ?auto_865566 ?auto_865568 ) ) ( not ( = ?auto_865567 ?auto_865568 ) ) ( ON ?auto_865566 ?auto_865567 ) ( ON ?auto_865565 ?auto_865566 ) ( ON ?auto_865564 ?auto_865565 ) ( ON ?auto_865563 ?auto_865564 ) ( ON ?auto_865562 ?auto_865563 ) ( ON ?auto_865561 ?auto_865562 ) ( ON ?auto_865560 ?auto_865561 ) ( ON ?auto_865559 ?auto_865560 ) ( ON ?auto_865558 ?auto_865559 ) ( ON ?auto_865557 ?auto_865558 ) ( ON ?auto_865556 ?auto_865557 ) ( CLEAR ?auto_865556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_865556 )
      ( MAKE-12PILE ?auto_865556 ?auto_865557 ?auto_865558 ?auto_865559 ?auto_865560 ?auto_865561 ?auto_865562 ?auto_865563 ?auto_865564 ?auto_865565 ?auto_865566 ?auto_865567 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865607 - BLOCK
      ?auto_865608 - BLOCK
      ?auto_865609 - BLOCK
      ?auto_865610 - BLOCK
      ?auto_865611 - BLOCK
      ?auto_865612 - BLOCK
      ?auto_865613 - BLOCK
      ?auto_865614 - BLOCK
      ?auto_865615 - BLOCK
      ?auto_865616 - BLOCK
      ?auto_865617 - BLOCK
      ?auto_865618 - BLOCK
      ?auto_865619 - BLOCK
    )
    :vars
    (
      ?auto_865620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_865618 ) ( ON ?auto_865619 ?auto_865620 ) ( CLEAR ?auto_865619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_865607 ) ( ON ?auto_865608 ?auto_865607 ) ( ON ?auto_865609 ?auto_865608 ) ( ON ?auto_865610 ?auto_865609 ) ( ON ?auto_865611 ?auto_865610 ) ( ON ?auto_865612 ?auto_865611 ) ( ON ?auto_865613 ?auto_865612 ) ( ON ?auto_865614 ?auto_865613 ) ( ON ?auto_865615 ?auto_865614 ) ( ON ?auto_865616 ?auto_865615 ) ( ON ?auto_865617 ?auto_865616 ) ( ON ?auto_865618 ?auto_865617 ) ( not ( = ?auto_865607 ?auto_865608 ) ) ( not ( = ?auto_865607 ?auto_865609 ) ) ( not ( = ?auto_865607 ?auto_865610 ) ) ( not ( = ?auto_865607 ?auto_865611 ) ) ( not ( = ?auto_865607 ?auto_865612 ) ) ( not ( = ?auto_865607 ?auto_865613 ) ) ( not ( = ?auto_865607 ?auto_865614 ) ) ( not ( = ?auto_865607 ?auto_865615 ) ) ( not ( = ?auto_865607 ?auto_865616 ) ) ( not ( = ?auto_865607 ?auto_865617 ) ) ( not ( = ?auto_865607 ?auto_865618 ) ) ( not ( = ?auto_865607 ?auto_865619 ) ) ( not ( = ?auto_865607 ?auto_865620 ) ) ( not ( = ?auto_865608 ?auto_865609 ) ) ( not ( = ?auto_865608 ?auto_865610 ) ) ( not ( = ?auto_865608 ?auto_865611 ) ) ( not ( = ?auto_865608 ?auto_865612 ) ) ( not ( = ?auto_865608 ?auto_865613 ) ) ( not ( = ?auto_865608 ?auto_865614 ) ) ( not ( = ?auto_865608 ?auto_865615 ) ) ( not ( = ?auto_865608 ?auto_865616 ) ) ( not ( = ?auto_865608 ?auto_865617 ) ) ( not ( = ?auto_865608 ?auto_865618 ) ) ( not ( = ?auto_865608 ?auto_865619 ) ) ( not ( = ?auto_865608 ?auto_865620 ) ) ( not ( = ?auto_865609 ?auto_865610 ) ) ( not ( = ?auto_865609 ?auto_865611 ) ) ( not ( = ?auto_865609 ?auto_865612 ) ) ( not ( = ?auto_865609 ?auto_865613 ) ) ( not ( = ?auto_865609 ?auto_865614 ) ) ( not ( = ?auto_865609 ?auto_865615 ) ) ( not ( = ?auto_865609 ?auto_865616 ) ) ( not ( = ?auto_865609 ?auto_865617 ) ) ( not ( = ?auto_865609 ?auto_865618 ) ) ( not ( = ?auto_865609 ?auto_865619 ) ) ( not ( = ?auto_865609 ?auto_865620 ) ) ( not ( = ?auto_865610 ?auto_865611 ) ) ( not ( = ?auto_865610 ?auto_865612 ) ) ( not ( = ?auto_865610 ?auto_865613 ) ) ( not ( = ?auto_865610 ?auto_865614 ) ) ( not ( = ?auto_865610 ?auto_865615 ) ) ( not ( = ?auto_865610 ?auto_865616 ) ) ( not ( = ?auto_865610 ?auto_865617 ) ) ( not ( = ?auto_865610 ?auto_865618 ) ) ( not ( = ?auto_865610 ?auto_865619 ) ) ( not ( = ?auto_865610 ?auto_865620 ) ) ( not ( = ?auto_865611 ?auto_865612 ) ) ( not ( = ?auto_865611 ?auto_865613 ) ) ( not ( = ?auto_865611 ?auto_865614 ) ) ( not ( = ?auto_865611 ?auto_865615 ) ) ( not ( = ?auto_865611 ?auto_865616 ) ) ( not ( = ?auto_865611 ?auto_865617 ) ) ( not ( = ?auto_865611 ?auto_865618 ) ) ( not ( = ?auto_865611 ?auto_865619 ) ) ( not ( = ?auto_865611 ?auto_865620 ) ) ( not ( = ?auto_865612 ?auto_865613 ) ) ( not ( = ?auto_865612 ?auto_865614 ) ) ( not ( = ?auto_865612 ?auto_865615 ) ) ( not ( = ?auto_865612 ?auto_865616 ) ) ( not ( = ?auto_865612 ?auto_865617 ) ) ( not ( = ?auto_865612 ?auto_865618 ) ) ( not ( = ?auto_865612 ?auto_865619 ) ) ( not ( = ?auto_865612 ?auto_865620 ) ) ( not ( = ?auto_865613 ?auto_865614 ) ) ( not ( = ?auto_865613 ?auto_865615 ) ) ( not ( = ?auto_865613 ?auto_865616 ) ) ( not ( = ?auto_865613 ?auto_865617 ) ) ( not ( = ?auto_865613 ?auto_865618 ) ) ( not ( = ?auto_865613 ?auto_865619 ) ) ( not ( = ?auto_865613 ?auto_865620 ) ) ( not ( = ?auto_865614 ?auto_865615 ) ) ( not ( = ?auto_865614 ?auto_865616 ) ) ( not ( = ?auto_865614 ?auto_865617 ) ) ( not ( = ?auto_865614 ?auto_865618 ) ) ( not ( = ?auto_865614 ?auto_865619 ) ) ( not ( = ?auto_865614 ?auto_865620 ) ) ( not ( = ?auto_865615 ?auto_865616 ) ) ( not ( = ?auto_865615 ?auto_865617 ) ) ( not ( = ?auto_865615 ?auto_865618 ) ) ( not ( = ?auto_865615 ?auto_865619 ) ) ( not ( = ?auto_865615 ?auto_865620 ) ) ( not ( = ?auto_865616 ?auto_865617 ) ) ( not ( = ?auto_865616 ?auto_865618 ) ) ( not ( = ?auto_865616 ?auto_865619 ) ) ( not ( = ?auto_865616 ?auto_865620 ) ) ( not ( = ?auto_865617 ?auto_865618 ) ) ( not ( = ?auto_865617 ?auto_865619 ) ) ( not ( = ?auto_865617 ?auto_865620 ) ) ( not ( = ?auto_865618 ?auto_865619 ) ) ( not ( = ?auto_865618 ?auto_865620 ) ) ( not ( = ?auto_865619 ?auto_865620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_865619 ?auto_865620 )
      ( !STACK ?auto_865619 ?auto_865618 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865661 - BLOCK
      ?auto_865662 - BLOCK
      ?auto_865663 - BLOCK
      ?auto_865664 - BLOCK
      ?auto_865665 - BLOCK
      ?auto_865666 - BLOCK
      ?auto_865667 - BLOCK
      ?auto_865668 - BLOCK
      ?auto_865669 - BLOCK
      ?auto_865670 - BLOCK
      ?auto_865671 - BLOCK
      ?auto_865672 - BLOCK
      ?auto_865673 - BLOCK
    )
    :vars
    (
      ?auto_865674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865673 ?auto_865674 ) ( ON-TABLE ?auto_865661 ) ( ON ?auto_865662 ?auto_865661 ) ( ON ?auto_865663 ?auto_865662 ) ( ON ?auto_865664 ?auto_865663 ) ( ON ?auto_865665 ?auto_865664 ) ( ON ?auto_865666 ?auto_865665 ) ( ON ?auto_865667 ?auto_865666 ) ( ON ?auto_865668 ?auto_865667 ) ( ON ?auto_865669 ?auto_865668 ) ( ON ?auto_865670 ?auto_865669 ) ( ON ?auto_865671 ?auto_865670 ) ( not ( = ?auto_865661 ?auto_865662 ) ) ( not ( = ?auto_865661 ?auto_865663 ) ) ( not ( = ?auto_865661 ?auto_865664 ) ) ( not ( = ?auto_865661 ?auto_865665 ) ) ( not ( = ?auto_865661 ?auto_865666 ) ) ( not ( = ?auto_865661 ?auto_865667 ) ) ( not ( = ?auto_865661 ?auto_865668 ) ) ( not ( = ?auto_865661 ?auto_865669 ) ) ( not ( = ?auto_865661 ?auto_865670 ) ) ( not ( = ?auto_865661 ?auto_865671 ) ) ( not ( = ?auto_865661 ?auto_865672 ) ) ( not ( = ?auto_865661 ?auto_865673 ) ) ( not ( = ?auto_865661 ?auto_865674 ) ) ( not ( = ?auto_865662 ?auto_865663 ) ) ( not ( = ?auto_865662 ?auto_865664 ) ) ( not ( = ?auto_865662 ?auto_865665 ) ) ( not ( = ?auto_865662 ?auto_865666 ) ) ( not ( = ?auto_865662 ?auto_865667 ) ) ( not ( = ?auto_865662 ?auto_865668 ) ) ( not ( = ?auto_865662 ?auto_865669 ) ) ( not ( = ?auto_865662 ?auto_865670 ) ) ( not ( = ?auto_865662 ?auto_865671 ) ) ( not ( = ?auto_865662 ?auto_865672 ) ) ( not ( = ?auto_865662 ?auto_865673 ) ) ( not ( = ?auto_865662 ?auto_865674 ) ) ( not ( = ?auto_865663 ?auto_865664 ) ) ( not ( = ?auto_865663 ?auto_865665 ) ) ( not ( = ?auto_865663 ?auto_865666 ) ) ( not ( = ?auto_865663 ?auto_865667 ) ) ( not ( = ?auto_865663 ?auto_865668 ) ) ( not ( = ?auto_865663 ?auto_865669 ) ) ( not ( = ?auto_865663 ?auto_865670 ) ) ( not ( = ?auto_865663 ?auto_865671 ) ) ( not ( = ?auto_865663 ?auto_865672 ) ) ( not ( = ?auto_865663 ?auto_865673 ) ) ( not ( = ?auto_865663 ?auto_865674 ) ) ( not ( = ?auto_865664 ?auto_865665 ) ) ( not ( = ?auto_865664 ?auto_865666 ) ) ( not ( = ?auto_865664 ?auto_865667 ) ) ( not ( = ?auto_865664 ?auto_865668 ) ) ( not ( = ?auto_865664 ?auto_865669 ) ) ( not ( = ?auto_865664 ?auto_865670 ) ) ( not ( = ?auto_865664 ?auto_865671 ) ) ( not ( = ?auto_865664 ?auto_865672 ) ) ( not ( = ?auto_865664 ?auto_865673 ) ) ( not ( = ?auto_865664 ?auto_865674 ) ) ( not ( = ?auto_865665 ?auto_865666 ) ) ( not ( = ?auto_865665 ?auto_865667 ) ) ( not ( = ?auto_865665 ?auto_865668 ) ) ( not ( = ?auto_865665 ?auto_865669 ) ) ( not ( = ?auto_865665 ?auto_865670 ) ) ( not ( = ?auto_865665 ?auto_865671 ) ) ( not ( = ?auto_865665 ?auto_865672 ) ) ( not ( = ?auto_865665 ?auto_865673 ) ) ( not ( = ?auto_865665 ?auto_865674 ) ) ( not ( = ?auto_865666 ?auto_865667 ) ) ( not ( = ?auto_865666 ?auto_865668 ) ) ( not ( = ?auto_865666 ?auto_865669 ) ) ( not ( = ?auto_865666 ?auto_865670 ) ) ( not ( = ?auto_865666 ?auto_865671 ) ) ( not ( = ?auto_865666 ?auto_865672 ) ) ( not ( = ?auto_865666 ?auto_865673 ) ) ( not ( = ?auto_865666 ?auto_865674 ) ) ( not ( = ?auto_865667 ?auto_865668 ) ) ( not ( = ?auto_865667 ?auto_865669 ) ) ( not ( = ?auto_865667 ?auto_865670 ) ) ( not ( = ?auto_865667 ?auto_865671 ) ) ( not ( = ?auto_865667 ?auto_865672 ) ) ( not ( = ?auto_865667 ?auto_865673 ) ) ( not ( = ?auto_865667 ?auto_865674 ) ) ( not ( = ?auto_865668 ?auto_865669 ) ) ( not ( = ?auto_865668 ?auto_865670 ) ) ( not ( = ?auto_865668 ?auto_865671 ) ) ( not ( = ?auto_865668 ?auto_865672 ) ) ( not ( = ?auto_865668 ?auto_865673 ) ) ( not ( = ?auto_865668 ?auto_865674 ) ) ( not ( = ?auto_865669 ?auto_865670 ) ) ( not ( = ?auto_865669 ?auto_865671 ) ) ( not ( = ?auto_865669 ?auto_865672 ) ) ( not ( = ?auto_865669 ?auto_865673 ) ) ( not ( = ?auto_865669 ?auto_865674 ) ) ( not ( = ?auto_865670 ?auto_865671 ) ) ( not ( = ?auto_865670 ?auto_865672 ) ) ( not ( = ?auto_865670 ?auto_865673 ) ) ( not ( = ?auto_865670 ?auto_865674 ) ) ( not ( = ?auto_865671 ?auto_865672 ) ) ( not ( = ?auto_865671 ?auto_865673 ) ) ( not ( = ?auto_865671 ?auto_865674 ) ) ( not ( = ?auto_865672 ?auto_865673 ) ) ( not ( = ?auto_865672 ?auto_865674 ) ) ( not ( = ?auto_865673 ?auto_865674 ) ) ( CLEAR ?auto_865671 ) ( ON ?auto_865672 ?auto_865673 ) ( CLEAR ?auto_865672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_865661 ?auto_865662 ?auto_865663 ?auto_865664 ?auto_865665 ?auto_865666 ?auto_865667 ?auto_865668 ?auto_865669 ?auto_865670 ?auto_865671 ?auto_865672 )
      ( MAKE-13PILE ?auto_865661 ?auto_865662 ?auto_865663 ?auto_865664 ?auto_865665 ?auto_865666 ?auto_865667 ?auto_865668 ?auto_865669 ?auto_865670 ?auto_865671 ?auto_865672 ?auto_865673 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865715 - BLOCK
      ?auto_865716 - BLOCK
      ?auto_865717 - BLOCK
      ?auto_865718 - BLOCK
      ?auto_865719 - BLOCK
      ?auto_865720 - BLOCK
      ?auto_865721 - BLOCK
      ?auto_865722 - BLOCK
      ?auto_865723 - BLOCK
      ?auto_865724 - BLOCK
      ?auto_865725 - BLOCK
      ?auto_865726 - BLOCK
      ?auto_865727 - BLOCK
    )
    :vars
    (
      ?auto_865728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865727 ?auto_865728 ) ( ON-TABLE ?auto_865715 ) ( ON ?auto_865716 ?auto_865715 ) ( ON ?auto_865717 ?auto_865716 ) ( ON ?auto_865718 ?auto_865717 ) ( ON ?auto_865719 ?auto_865718 ) ( ON ?auto_865720 ?auto_865719 ) ( ON ?auto_865721 ?auto_865720 ) ( ON ?auto_865722 ?auto_865721 ) ( ON ?auto_865723 ?auto_865722 ) ( ON ?auto_865724 ?auto_865723 ) ( not ( = ?auto_865715 ?auto_865716 ) ) ( not ( = ?auto_865715 ?auto_865717 ) ) ( not ( = ?auto_865715 ?auto_865718 ) ) ( not ( = ?auto_865715 ?auto_865719 ) ) ( not ( = ?auto_865715 ?auto_865720 ) ) ( not ( = ?auto_865715 ?auto_865721 ) ) ( not ( = ?auto_865715 ?auto_865722 ) ) ( not ( = ?auto_865715 ?auto_865723 ) ) ( not ( = ?auto_865715 ?auto_865724 ) ) ( not ( = ?auto_865715 ?auto_865725 ) ) ( not ( = ?auto_865715 ?auto_865726 ) ) ( not ( = ?auto_865715 ?auto_865727 ) ) ( not ( = ?auto_865715 ?auto_865728 ) ) ( not ( = ?auto_865716 ?auto_865717 ) ) ( not ( = ?auto_865716 ?auto_865718 ) ) ( not ( = ?auto_865716 ?auto_865719 ) ) ( not ( = ?auto_865716 ?auto_865720 ) ) ( not ( = ?auto_865716 ?auto_865721 ) ) ( not ( = ?auto_865716 ?auto_865722 ) ) ( not ( = ?auto_865716 ?auto_865723 ) ) ( not ( = ?auto_865716 ?auto_865724 ) ) ( not ( = ?auto_865716 ?auto_865725 ) ) ( not ( = ?auto_865716 ?auto_865726 ) ) ( not ( = ?auto_865716 ?auto_865727 ) ) ( not ( = ?auto_865716 ?auto_865728 ) ) ( not ( = ?auto_865717 ?auto_865718 ) ) ( not ( = ?auto_865717 ?auto_865719 ) ) ( not ( = ?auto_865717 ?auto_865720 ) ) ( not ( = ?auto_865717 ?auto_865721 ) ) ( not ( = ?auto_865717 ?auto_865722 ) ) ( not ( = ?auto_865717 ?auto_865723 ) ) ( not ( = ?auto_865717 ?auto_865724 ) ) ( not ( = ?auto_865717 ?auto_865725 ) ) ( not ( = ?auto_865717 ?auto_865726 ) ) ( not ( = ?auto_865717 ?auto_865727 ) ) ( not ( = ?auto_865717 ?auto_865728 ) ) ( not ( = ?auto_865718 ?auto_865719 ) ) ( not ( = ?auto_865718 ?auto_865720 ) ) ( not ( = ?auto_865718 ?auto_865721 ) ) ( not ( = ?auto_865718 ?auto_865722 ) ) ( not ( = ?auto_865718 ?auto_865723 ) ) ( not ( = ?auto_865718 ?auto_865724 ) ) ( not ( = ?auto_865718 ?auto_865725 ) ) ( not ( = ?auto_865718 ?auto_865726 ) ) ( not ( = ?auto_865718 ?auto_865727 ) ) ( not ( = ?auto_865718 ?auto_865728 ) ) ( not ( = ?auto_865719 ?auto_865720 ) ) ( not ( = ?auto_865719 ?auto_865721 ) ) ( not ( = ?auto_865719 ?auto_865722 ) ) ( not ( = ?auto_865719 ?auto_865723 ) ) ( not ( = ?auto_865719 ?auto_865724 ) ) ( not ( = ?auto_865719 ?auto_865725 ) ) ( not ( = ?auto_865719 ?auto_865726 ) ) ( not ( = ?auto_865719 ?auto_865727 ) ) ( not ( = ?auto_865719 ?auto_865728 ) ) ( not ( = ?auto_865720 ?auto_865721 ) ) ( not ( = ?auto_865720 ?auto_865722 ) ) ( not ( = ?auto_865720 ?auto_865723 ) ) ( not ( = ?auto_865720 ?auto_865724 ) ) ( not ( = ?auto_865720 ?auto_865725 ) ) ( not ( = ?auto_865720 ?auto_865726 ) ) ( not ( = ?auto_865720 ?auto_865727 ) ) ( not ( = ?auto_865720 ?auto_865728 ) ) ( not ( = ?auto_865721 ?auto_865722 ) ) ( not ( = ?auto_865721 ?auto_865723 ) ) ( not ( = ?auto_865721 ?auto_865724 ) ) ( not ( = ?auto_865721 ?auto_865725 ) ) ( not ( = ?auto_865721 ?auto_865726 ) ) ( not ( = ?auto_865721 ?auto_865727 ) ) ( not ( = ?auto_865721 ?auto_865728 ) ) ( not ( = ?auto_865722 ?auto_865723 ) ) ( not ( = ?auto_865722 ?auto_865724 ) ) ( not ( = ?auto_865722 ?auto_865725 ) ) ( not ( = ?auto_865722 ?auto_865726 ) ) ( not ( = ?auto_865722 ?auto_865727 ) ) ( not ( = ?auto_865722 ?auto_865728 ) ) ( not ( = ?auto_865723 ?auto_865724 ) ) ( not ( = ?auto_865723 ?auto_865725 ) ) ( not ( = ?auto_865723 ?auto_865726 ) ) ( not ( = ?auto_865723 ?auto_865727 ) ) ( not ( = ?auto_865723 ?auto_865728 ) ) ( not ( = ?auto_865724 ?auto_865725 ) ) ( not ( = ?auto_865724 ?auto_865726 ) ) ( not ( = ?auto_865724 ?auto_865727 ) ) ( not ( = ?auto_865724 ?auto_865728 ) ) ( not ( = ?auto_865725 ?auto_865726 ) ) ( not ( = ?auto_865725 ?auto_865727 ) ) ( not ( = ?auto_865725 ?auto_865728 ) ) ( not ( = ?auto_865726 ?auto_865727 ) ) ( not ( = ?auto_865726 ?auto_865728 ) ) ( not ( = ?auto_865727 ?auto_865728 ) ) ( ON ?auto_865726 ?auto_865727 ) ( CLEAR ?auto_865724 ) ( ON ?auto_865725 ?auto_865726 ) ( CLEAR ?auto_865725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_865715 ?auto_865716 ?auto_865717 ?auto_865718 ?auto_865719 ?auto_865720 ?auto_865721 ?auto_865722 ?auto_865723 ?auto_865724 ?auto_865725 )
      ( MAKE-13PILE ?auto_865715 ?auto_865716 ?auto_865717 ?auto_865718 ?auto_865719 ?auto_865720 ?auto_865721 ?auto_865722 ?auto_865723 ?auto_865724 ?auto_865725 ?auto_865726 ?auto_865727 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865769 - BLOCK
      ?auto_865770 - BLOCK
      ?auto_865771 - BLOCK
      ?auto_865772 - BLOCK
      ?auto_865773 - BLOCK
      ?auto_865774 - BLOCK
      ?auto_865775 - BLOCK
      ?auto_865776 - BLOCK
      ?auto_865777 - BLOCK
      ?auto_865778 - BLOCK
      ?auto_865779 - BLOCK
      ?auto_865780 - BLOCK
      ?auto_865781 - BLOCK
    )
    :vars
    (
      ?auto_865782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865781 ?auto_865782 ) ( ON-TABLE ?auto_865769 ) ( ON ?auto_865770 ?auto_865769 ) ( ON ?auto_865771 ?auto_865770 ) ( ON ?auto_865772 ?auto_865771 ) ( ON ?auto_865773 ?auto_865772 ) ( ON ?auto_865774 ?auto_865773 ) ( ON ?auto_865775 ?auto_865774 ) ( ON ?auto_865776 ?auto_865775 ) ( ON ?auto_865777 ?auto_865776 ) ( not ( = ?auto_865769 ?auto_865770 ) ) ( not ( = ?auto_865769 ?auto_865771 ) ) ( not ( = ?auto_865769 ?auto_865772 ) ) ( not ( = ?auto_865769 ?auto_865773 ) ) ( not ( = ?auto_865769 ?auto_865774 ) ) ( not ( = ?auto_865769 ?auto_865775 ) ) ( not ( = ?auto_865769 ?auto_865776 ) ) ( not ( = ?auto_865769 ?auto_865777 ) ) ( not ( = ?auto_865769 ?auto_865778 ) ) ( not ( = ?auto_865769 ?auto_865779 ) ) ( not ( = ?auto_865769 ?auto_865780 ) ) ( not ( = ?auto_865769 ?auto_865781 ) ) ( not ( = ?auto_865769 ?auto_865782 ) ) ( not ( = ?auto_865770 ?auto_865771 ) ) ( not ( = ?auto_865770 ?auto_865772 ) ) ( not ( = ?auto_865770 ?auto_865773 ) ) ( not ( = ?auto_865770 ?auto_865774 ) ) ( not ( = ?auto_865770 ?auto_865775 ) ) ( not ( = ?auto_865770 ?auto_865776 ) ) ( not ( = ?auto_865770 ?auto_865777 ) ) ( not ( = ?auto_865770 ?auto_865778 ) ) ( not ( = ?auto_865770 ?auto_865779 ) ) ( not ( = ?auto_865770 ?auto_865780 ) ) ( not ( = ?auto_865770 ?auto_865781 ) ) ( not ( = ?auto_865770 ?auto_865782 ) ) ( not ( = ?auto_865771 ?auto_865772 ) ) ( not ( = ?auto_865771 ?auto_865773 ) ) ( not ( = ?auto_865771 ?auto_865774 ) ) ( not ( = ?auto_865771 ?auto_865775 ) ) ( not ( = ?auto_865771 ?auto_865776 ) ) ( not ( = ?auto_865771 ?auto_865777 ) ) ( not ( = ?auto_865771 ?auto_865778 ) ) ( not ( = ?auto_865771 ?auto_865779 ) ) ( not ( = ?auto_865771 ?auto_865780 ) ) ( not ( = ?auto_865771 ?auto_865781 ) ) ( not ( = ?auto_865771 ?auto_865782 ) ) ( not ( = ?auto_865772 ?auto_865773 ) ) ( not ( = ?auto_865772 ?auto_865774 ) ) ( not ( = ?auto_865772 ?auto_865775 ) ) ( not ( = ?auto_865772 ?auto_865776 ) ) ( not ( = ?auto_865772 ?auto_865777 ) ) ( not ( = ?auto_865772 ?auto_865778 ) ) ( not ( = ?auto_865772 ?auto_865779 ) ) ( not ( = ?auto_865772 ?auto_865780 ) ) ( not ( = ?auto_865772 ?auto_865781 ) ) ( not ( = ?auto_865772 ?auto_865782 ) ) ( not ( = ?auto_865773 ?auto_865774 ) ) ( not ( = ?auto_865773 ?auto_865775 ) ) ( not ( = ?auto_865773 ?auto_865776 ) ) ( not ( = ?auto_865773 ?auto_865777 ) ) ( not ( = ?auto_865773 ?auto_865778 ) ) ( not ( = ?auto_865773 ?auto_865779 ) ) ( not ( = ?auto_865773 ?auto_865780 ) ) ( not ( = ?auto_865773 ?auto_865781 ) ) ( not ( = ?auto_865773 ?auto_865782 ) ) ( not ( = ?auto_865774 ?auto_865775 ) ) ( not ( = ?auto_865774 ?auto_865776 ) ) ( not ( = ?auto_865774 ?auto_865777 ) ) ( not ( = ?auto_865774 ?auto_865778 ) ) ( not ( = ?auto_865774 ?auto_865779 ) ) ( not ( = ?auto_865774 ?auto_865780 ) ) ( not ( = ?auto_865774 ?auto_865781 ) ) ( not ( = ?auto_865774 ?auto_865782 ) ) ( not ( = ?auto_865775 ?auto_865776 ) ) ( not ( = ?auto_865775 ?auto_865777 ) ) ( not ( = ?auto_865775 ?auto_865778 ) ) ( not ( = ?auto_865775 ?auto_865779 ) ) ( not ( = ?auto_865775 ?auto_865780 ) ) ( not ( = ?auto_865775 ?auto_865781 ) ) ( not ( = ?auto_865775 ?auto_865782 ) ) ( not ( = ?auto_865776 ?auto_865777 ) ) ( not ( = ?auto_865776 ?auto_865778 ) ) ( not ( = ?auto_865776 ?auto_865779 ) ) ( not ( = ?auto_865776 ?auto_865780 ) ) ( not ( = ?auto_865776 ?auto_865781 ) ) ( not ( = ?auto_865776 ?auto_865782 ) ) ( not ( = ?auto_865777 ?auto_865778 ) ) ( not ( = ?auto_865777 ?auto_865779 ) ) ( not ( = ?auto_865777 ?auto_865780 ) ) ( not ( = ?auto_865777 ?auto_865781 ) ) ( not ( = ?auto_865777 ?auto_865782 ) ) ( not ( = ?auto_865778 ?auto_865779 ) ) ( not ( = ?auto_865778 ?auto_865780 ) ) ( not ( = ?auto_865778 ?auto_865781 ) ) ( not ( = ?auto_865778 ?auto_865782 ) ) ( not ( = ?auto_865779 ?auto_865780 ) ) ( not ( = ?auto_865779 ?auto_865781 ) ) ( not ( = ?auto_865779 ?auto_865782 ) ) ( not ( = ?auto_865780 ?auto_865781 ) ) ( not ( = ?auto_865780 ?auto_865782 ) ) ( not ( = ?auto_865781 ?auto_865782 ) ) ( ON ?auto_865780 ?auto_865781 ) ( ON ?auto_865779 ?auto_865780 ) ( CLEAR ?auto_865777 ) ( ON ?auto_865778 ?auto_865779 ) ( CLEAR ?auto_865778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_865769 ?auto_865770 ?auto_865771 ?auto_865772 ?auto_865773 ?auto_865774 ?auto_865775 ?auto_865776 ?auto_865777 ?auto_865778 )
      ( MAKE-13PILE ?auto_865769 ?auto_865770 ?auto_865771 ?auto_865772 ?auto_865773 ?auto_865774 ?auto_865775 ?auto_865776 ?auto_865777 ?auto_865778 ?auto_865779 ?auto_865780 ?auto_865781 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865823 - BLOCK
      ?auto_865824 - BLOCK
      ?auto_865825 - BLOCK
      ?auto_865826 - BLOCK
      ?auto_865827 - BLOCK
      ?auto_865828 - BLOCK
      ?auto_865829 - BLOCK
      ?auto_865830 - BLOCK
      ?auto_865831 - BLOCK
      ?auto_865832 - BLOCK
      ?auto_865833 - BLOCK
      ?auto_865834 - BLOCK
      ?auto_865835 - BLOCK
    )
    :vars
    (
      ?auto_865836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865835 ?auto_865836 ) ( ON-TABLE ?auto_865823 ) ( ON ?auto_865824 ?auto_865823 ) ( ON ?auto_865825 ?auto_865824 ) ( ON ?auto_865826 ?auto_865825 ) ( ON ?auto_865827 ?auto_865826 ) ( ON ?auto_865828 ?auto_865827 ) ( ON ?auto_865829 ?auto_865828 ) ( ON ?auto_865830 ?auto_865829 ) ( not ( = ?auto_865823 ?auto_865824 ) ) ( not ( = ?auto_865823 ?auto_865825 ) ) ( not ( = ?auto_865823 ?auto_865826 ) ) ( not ( = ?auto_865823 ?auto_865827 ) ) ( not ( = ?auto_865823 ?auto_865828 ) ) ( not ( = ?auto_865823 ?auto_865829 ) ) ( not ( = ?auto_865823 ?auto_865830 ) ) ( not ( = ?auto_865823 ?auto_865831 ) ) ( not ( = ?auto_865823 ?auto_865832 ) ) ( not ( = ?auto_865823 ?auto_865833 ) ) ( not ( = ?auto_865823 ?auto_865834 ) ) ( not ( = ?auto_865823 ?auto_865835 ) ) ( not ( = ?auto_865823 ?auto_865836 ) ) ( not ( = ?auto_865824 ?auto_865825 ) ) ( not ( = ?auto_865824 ?auto_865826 ) ) ( not ( = ?auto_865824 ?auto_865827 ) ) ( not ( = ?auto_865824 ?auto_865828 ) ) ( not ( = ?auto_865824 ?auto_865829 ) ) ( not ( = ?auto_865824 ?auto_865830 ) ) ( not ( = ?auto_865824 ?auto_865831 ) ) ( not ( = ?auto_865824 ?auto_865832 ) ) ( not ( = ?auto_865824 ?auto_865833 ) ) ( not ( = ?auto_865824 ?auto_865834 ) ) ( not ( = ?auto_865824 ?auto_865835 ) ) ( not ( = ?auto_865824 ?auto_865836 ) ) ( not ( = ?auto_865825 ?auto_865826 ) ) ( not ( = ?auto_865825 ?auto_865827 ) ) ( not ( = ?auto_865825 ?auto_865828 ) ) ( not ( = ?auto_865825 ?auto_865829 ) ) ( not ( = ?auto_865825 ?auto_865830 ) ) ( not ( = ?auto_865825 ?auto_865831 ) ) ( not ( = ?auto_865825 ?auto_865832 ) ) ( not ( = ?auto_865825 ?auto_865833 ) ) ( not ( = ?auto_865825 ?auto_865834 ) ) ( not ( = ?auto_865825 ?auto_865835 ) ) ( not ( = ?auto_865825 ?auto_865836 ) ) ( not ( = ?auto_865826 ?auto_865827 ) ) ( not ( = ?auto_865826 ?auto_865828 ) ) ( not ( = ?auto_865826 ?auto_865829 ) ) ( not ( = ?auto_865826 ?auto_865830 ) ) ( not ( = ?auto_865826 ?auto_865831 ) ) ( not ( = ?auto_865826 ?auto_865832 ) ) ( not ( = ?auto_865826 ?auto_865833 ) ) ( not ( = ?auto_865826 ?auto_865834 ) ) ( not ( = ?auto_865826 ?auto_865835 ) ) ( not ( = ?auto_865826 ?auto_865836 ) ) ( not ( = ?auto_865827 ?auto_865828 ) ) ( not ( = ?auto_865827 ?auto_865829 ) ) ( not ( = ?auto_865827 ?auto_865830 ) ) ( not ( = ?auto_865827 ?auto_865831 ) ) ( not ( = ?auto_865827 ?auto_865832 ) ) ( not ( = ?auto_865827 ?auto_865833 ) ) ( not ( = ?auto_865827 ?auto_865834 ) ) ( not ( = ?auto_865827 ?auto_865835 ) ) ( not ( = ?auto_865827 ?auto_865836 ) ) ( not ( = ?auto_865828 ?auto_865829 ) ) ( not ( = ?auto_865828 ?auto_865830 ) ) ( not ( = ?auto_865828 ?auto_865831 ) ) ( not ( = ?auto_865828 ?auto_865832 ) ) ( not ( = ?auto_865828 ?auto_865833 ) ) ( not ( = ?auto_865828 ?auto_865834 ) ) ( not ( = ?auto_865828 ?auto_865835 ) ) ( not ( = ?auto_865828 ?auto_865836 ) ) ( not ( = ?auto_865829 ?auto_865830 ) ) ( not ( = ?auto_865829 ?auto_865831 ) ) ( not ( = ?auto_865829 ?auto_865832 ) ) ( not ( = ?auto_865829 ?auto_865833 ) ) ( not ( = ?auto_865829 ?auto_865834 ) ) ( not ( = ?auto_865829 ?auto_865835 ) ) ( not ( = ?auto_865829 ?auto_865836 ) ) ( not ( = ?auto_865830 ?auto_865831 ) ) ( not ( = ?auto_865830 ?auto_865832 ) ) ( not ( = ?auto_865830 ?auto_865833 ) ) ( not ( = ?auto_865830 ?auto_865834 ) ) ( not ( = ?auto_865830 ?auto_865835 ) ) ( not ( = ?auto_865830 ?auto_865836 ) ) ( not ( = ?auto_865831 ?auto_865832 ) ) ( not ( = ?auto_865831 ?auto_865833 ) ) ( not ( = ?auto_865831 ?auto_865834 ) ) ( not ( = ?auto_865831 ?auto_865835 ) ) ( not ( = ?auto_865831 ?auto_865836 ) ) ( not ( = ?auto_865832 ?auto_865833 ) ) ( not ( = ?auto_865832 ?auto_865834 ) ) ( not ( = ?auto_865832 ?auto_865835 ) ) ( not ( = ?auto_865832 ?auto_865836 ) ) ( not ( = ?auto_865833 ?auto_865834 ) ) ( not ( = ?auto_865833 ?auto_865835 ) ) ( not ( = ?auto_865833 ?auto_865836 ) ) ( not ( = ?auto_865834 ?auto_865835 ) ) ( not ( = ?auto_865834 ?auto_865836 ) ) ( not ( = ?auto_865835 ?auto_865836 ) ) ( ON ?auto_865834 ?auto_865835 ) ( ON ?auto_865833 ?auto_865834 ) ( ON ?auto_865832 ?auto_865833 ) ( CLEAR ?auto_865830 ) ( ON ?auto_865831 ?auto_865832 ) ( CLEAR ?auto_865831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_865823 ?auto_865824 ?auto_865825 ?auto_865826 ?auto_865827 ?auto_865828 ?auto_865829 ?auto_865830 ?auto_865831 )
      ( MAKE-13PILE ?auto_865823 ?auto_865824 ?auto_865825 ?auto_865826 ?auto_865827 ?auto_865828 ?auto_865829 ?auto_865830 ?auto_865831 ?auto_865832 ?auto_865833 ?auto_865834 ?auto_865835 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865877 - BLOCK
      ?auto_865878 - BLOCK
      ?auto_865879 - BLOCK
      ?auto_865880 - BLOCK
      ?auto_865881 - BLOCK
      ?auto_865882 - BLOCK
      ?auto_865883 - BLOCK
      ?auto_865884 - BLOCK
      ?auto_865885 - BLOCK
      ?auto_865886 - BLOCK
      ?auto_865887 - BLOCK
      ?auto_865888 - BLOCK
      ?auto_865889 - BLOCK
    )
    :vars
    (
      ?auto_865890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865889 ?auto_865890 ) ( ON-TABLE ?auto_865877 ) ( ON ?auto_865878 ?auto_865877 ) ( ON ?auto_865879 ?auto_865878 ) ( ON ?auto_865880 ?auto_865879 ) ( ON ?auto_865881 ?auto_865880 ) ( ON ?auto_865882 ?auto_865881 ) ( ON ?auto_865883 ?auto_865882 ) ( not ( = ?auto_865877 ?auto_865878 ) ) ( not ( = ?auto_865877 ?auto_865879 ) ) ( not ( = ?auto_865877 ?auto_865880 ) ) ( not ( = ?auto_865877 ?auto_865881 ) ) ( not ( = ?auto_865877 ?auto_865882 ) ) ( not ( = ?auto_865877 ?auto_865883 ) ) ( not ( = ?auto_865877 ?auto_865884 ) ) ( not ( = ?auto_865877 ?auto_865885 ) ) ( not ( = ?auto_865877 ?auto_865886 ) ) ( not ( = ?auto_865877 ?auto_865887 ) ) ( not ( = ?auto_865877 ?auto_865888 ) ) ( not ( = ?auto_865877 ?auto_865889 ) ) ( not ( = ?auto_865877 ?auto_865890 ) ) ( not ( = ?auto_865878 ?auto_865879 ) ) ( not ( = ?auto_865878 ?auto_865880 ) ) ( not ( = ?auto_865878 ?auto_865881 ) ) ( not ( = ?auto_865878 ?auto_865882 ) ) ( not ( = ?auto_865878 ?auto_865883 ) ) ( not ( = ?auto_865878 ?auto_865884 ) ) ( not ( = ?auto_865878 ?auto_865885 ) ) ( not ( = ?auto_865878 ?auto_865886 ) ) ( not ( = ?auto_865878 ?auto_865887 ) ) ( not ( = ?auto_865878 ?auto_865888 ) ) ( not ( = ?auto_865878 ?auto_865889 ) ) ( not ( = ?auto_865878 ?auto_865890 ) ) ( not ( = ?auto_865879 ?auto_865880 ) ) ( not ( = ?auto_865879 ?auto_865881 ) ) ( not ( = ?auto_865879 ?auto_865882 ) ) ( not ( = ?auto_865879 ?auto_865883 ) ) ( not ( = ?auto_865879 ?auto_865884 ) ) ( not ( = ?auto_865879 ?auto_865885 ) ) ( not ( = ?auto_865879 ?auto_865886 ) ) ( not ( = ?auto_865879 ?auto_865887 ) ) ( not ( = ?auto_865879 ?auto_865888 ) ) ( not ( = ?auto_865879 ?auto_865889 ) ) ( not ( = ?auto_865879 ?auto_865890 ) ) ( not ( = ?auto_865880 ?auto_865881 ) ) ( not ( = ?auto_865880 ?auto_865882 ) ) ( not ( = ?auto_865880 ?auto_865883 ) ) ( not ( = ?auto_865880 ?auto_865884 ) ) ( not ( = ?auto_865880 ?auto_865885 ) ) ( not ( = ?auto_865880 ?auto_865886 ) ) ( not ( = ?auto_865880 ?auto_865887 ) ) ( not ( = ?auto_865880 ?auto_865888 ) ) ( not ( = ?auto_865880 ?auto_865889 ) ) ( not ( = ?auto_865880 ?auto_865890 ) ) ( not ( = ?auto_865881 ?auto_865882 ) ) ( not ( = ?auto_865881 ?auto_865883 ) ) ( not ( = ?auto_865881 ?auto_865884 ) ) ( not ( = ?auto_865881 ?auto_865885 ) ) ( not ( = ?auto_865881 ?auto_865886 ) ) ( not ( = ?auto_865881 ?auto_865887 ) ) ( not ( = ?auto_865881 ?auto_865888 ) ) ( not ( = ?auto_865881 ?auto_865889 ) ) ( not ( = ?auto_865881 ?auto_865890 ) ) ( not ( = ?auto_865882 ?auto_865883 ) ) ( not ( = ?auto_865882 ?auto_865884 ) ) ( not ( = ?auto_865882 ?auto_865885 ) ) ( not ( = ?auto_865882 ?auto_865886 ) ) ( not ( = ?auto_865882 ?auto_865887 ) ) ( not ( = ?auto_865882 ?auto_865888 ) ) ( not ( = ?auto_865882 ?auto_865889 ) ) ( not ( = ?auto_865882 ?auto_865890 ) ) ( not ( = ?auto_865883 ?auto_865884 ) ) ( not ( = ?auto_865883 ?auto_865885 ) ) ( not ( = ?auto_865883 ?auto_865886 ) ) ( not ( = ?auto_865883 ?auto_865887 ) ) ( not ( = ?auto_865883 ?auto_865888 ) ) ( not ( = ?auto_865883 ?auto_865889 ) ) ( not ( = ?auto_865883 ?auto_865890 ) ) ( not ( = ?auto_865884 ?auto_865885 ) ) ( not ( = ?auto_865884 ?auto_865886 ) ) ( not ( = ?auto_865884 ?auto_865887 ) ) ( not ( = ?auto_865884 ?auto_865888 ) ) ( not ( = ?auto_865884 ?auto_865889 ) ) ( not ( = ?auto_865884 ?auto_865890 ) ) ( not ( = ?auto_865885 ?auto_865886 ) ) ( not ( = ?auto_865885 ?auto_865887 ) ) ( not ( = ?auto_865885 ?auto_865888 ) ) ( not ( = ?auto_865885 ?auto_865889 ) ) ( not ( = ?auto_865885 ?auto_865890 ) ) ( not ( = ?auto_865886 ?auto_865887 ) ) ( not ( = ?auto_865886 ?auto_865888 ) ) ( not ( = ?auto_865886 ?auto_865889 ) ) ( not ( = ?auto_865886 ?auto_865890 ) ) ( not ( = ?auto_865887 ?auto_865888 ) ) ( not ( = ?auto_865887 ?auto_865889 ) ) ( not ( = ?auto_865887 ?auto_865890 ) ) ( not ( = ?auto_865888 ?auto_865889 ) ) ( not ( = ?auto_865888 ?auto_865890 ) ) ( not ( = ?auto_865889 ?auto_865890 ) ) ( ON ?auto_865888 ?auto_865889 ) ( ON ?auto_865887 ?auto_865888 ) ( ON ?auto_865886 ?auto_865887 ) ( ON ?auto_865885 ?auto_865886 ) ( CLEAR ?auto_865883 ) ( ON ?auto_865884 ?auto_865885 ) ( CLEAR ?auto_865884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_865877 ?auto_865878 ?auto_865879 ?auto_865880 ?auto_865881 ?auto_865882 ?auto_865883 ?auto_865884 )
      ( MAKE-13PILE ?auto_865877 ?auto_865878 ?auto_865879 ?auto_865880 ?auto_865881 ?auto_865882 ?auto_865883 ?auto_865884 ?auto_865885 ?auto_865886 ?auto_865887 ?auto_865888 ?auto_865889 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865931 - BLOCK
      ?auto_865932 - BLOCK
      ?auto_865933 - BLOCK
      ?auto_865934 - BLOCK
      ?auto_865935 - BLOCK
      ?auto_865936 - BLOCK
      ?auto_865937 - BLOCK
      ?auto_865938 - BLOCK
      ?auto_865939 - BLOCK
      ?auto_865940 - BLOCK
      ?auto_865941 - BLOCK
      ?auto_865942 - BLOCK
      ?auto_865943 - BLOCK
    )
    :vars
    (
      ?auto_865944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865943 ?auto_865944 ) ( ON-TABLE ?auto_865931 ) ( ON ?auto_865932 ?auto_865931 ) ( ON ?auto_865933 ?auto_865932 ) ( ON ?auto_865934 ?auto_865933 ) ( ON ?auto_865935 ?auto_865934 ) ( ON ?auto_865936 ?auto_865935 ) ( not ( = ?auto_865931 ?auto_865932 ) ) ( not ( = ?auto_865931 ?auto_865933 ) ) ( not ( = ?auto_865931 ?auto_865934 ) ) ( not ( = ?auto_865931 ?auto_865935 ) ) ( not ( = ?auto_865931 ?auto_865936 ) ) ( not ( = ?auto_865931 ?auto_865937 ) ) ( not ( = ?auto_865931 ?auto_865938 ) ) ( not ( = ?auto_865931 ?auto_865939 ) ) ( not ( = ?auto_865931 ?auto_865940 ) ) ( not ( = ?auto_865931 ?auto_865941 ) ) ( not ( = ?auto_865931 ?auto_865942 ) ) ( not ( = ?auto_865931 ?auto_865943 ) ) ( not ( = ?auto_865931 ?auto_865944 ) ) ( not ( = ?auto_865932 ?auto_865933 ) ) ( not ( = ?auto_865932 ?auto_865934 ) ) ( not ( = ?auto_865932 ?auto_865935 ) ) ( not ( = ?auto_865932 ?auto_865936 ) ) ( not ( = ?auto_865932 ?auto_865937 ) ) ( not ( = ?auto_865932 ?auto_865938 ) ) ( not ( = ?auto_865932 ?auto_865939 ) ) ( not ( = ?auto_865932 ?auto_865940 ) ) ( not ( = ?auto_865932 ?auto_865941 ) ) ( not ( = ?auto_865932 ?auto_865942 ) ) ( not ( = ?auto_865932 ?auto_865943 ) ) ( not ( = ?auto_865932 ?auto_865944 ) ) ( not ( = ?auto_865933 ?auto_865934 ) ) ( not ( = ?auto_865933 ?auto_865935 ) ) ( not ( = ?auto_865933 ?auto_865936 ) ) ( not ( = ?auto_865933 ?auto_865937 ) ) ( not ( = ?auto_865933 ?auto_865938 ) ) ( not ( = ?auto_865933 ?auto_865939 ) ) ( not ( = ?auto_865933 ?auto_865940 ) ) ( not ( = ?auto_865933 ?auto_865941 ) ) ( not ( = ?auto_865933 ?auto_865942 ) ) ( not ( = ?auto_865933 ?auto_865943 ) ) ( not ( = ?auto_865933 ?auto_865944 ) ) ( not ( = ?auto_865934 ?auto_865935 ) ) ( not ( = ?auto_865934 ?auto_865936 ) ) ( not ( = ?auto_865934 ?auto_865937 ) ) ( not ( = ?auto_865934 ?auto_865938 ) ) ( not ( = ?auto_865934 ?auto_865939 ) ) ( not ( = ?auto_865934 ?auto_865940 ) ) ( not ( = ?auto_865934 ?auto_865941 ) ) ( not ( = ?auto_865934 ?auto_865942 ) ) ( not ( = ?auto_865934 ?auto_865943 ) ) ( not ( = ?auto_865934 ?auto_865944 ) ) ( not ( = ?auto_865935 ?auto_865936 ) ) ( not ( = ?auto_865935 ?auto_865937 ) ) ( not ( = ?auto_865935 ?auto_865938 ) ) ( not ( = ?auto_865935 ?auto_865939 ) ) ( not ( = ?auto_865935 ?auto_865940 ) ) ( not ( = ?auto_865935 ?auto_865941 ) ) ( not ( = ?auto_865935 ?auto_865942 ) ) ( not ( = ?auto_865935 ?auto_865943 ) ) ( not ( = ?auto_865935 ?auto_865944 ) ) ( not ( = ?auto_865936 ?auto_865937 ) ) ( not ( = ?auto_865936 ?auto_865938 ) ) ( not ( = ?auto_865936 ?auto_865939 ) ) ( not ( = ?auto_865936 ?auto_865940 ) ) ( not ( = ?auto_865936 ?auto_865941 ) ) ( not ( = ?auto_865936 ?auto_865942 ) ) ( not ( = ?auto_865936 ?auto_865943 ) ) ( not ( = ?auto_865936 ?auto_865944 ) ) ( not ( = ?auto_865937 ?auto_865938 ) ) ( not ( = ?auto_865937 ?auto_865939 ) ) ( not ( = ?auto_865937 ?auto_865940 ) ) ( not ( = ?auto_865937 ?auto_865941 ) ) ( not ( = ?auto_865937 ?auto_865942 ) ) ( not ( = ?auto_865937 ?auto_865943 ) ) ( not ( = ?auto_865937 ?auto_865944 ) ) ( not ( = ?auto_865938 ?auto_865939 ) ) ( not ( = ?auto_865938 ?auto_865940 ) ) ( not ( = ?auto_865938 ?auto_865941 ) ) ( not ( = ?auto_865938 ?auto_865942 ) ) ( not ( = ?auto_865938 ?auto_865943 ) ) ( not ( = ?auto_865938 ?auto_865944 ) ) ( not ( = ?auto_865939 ?auto_865940 ) ) ( not ( = ?auto_865939 ?auto_865941 ) ) ( not ( = ?auto_865939 ?auto_865942 ) ) ( not ( = ?auto_865939 ?auto_865943 ) ) ( not ( = ?auto_865939 ?auto_865944 ) ) ( not ( = ?auto_865940 ?auto_865941 ) ) ( not ( = ?auto_865940 ?auto_865942 ) ) ( not ( = ?auto_865940 ?auto_865943 ) ) ( not ( = ?auto_865940 ?auto_865944 ) ) ( not ( = ?auto_865941 ?auto_865942 ) ) ( not ( = ?auto_865941 ?auto_865943 ) ) ( not ( = ?auto_865941 ?auto_865944 ) ) ( not ( = ?auto_865942 ?auto_865943 ) ) ( not ( = ?auto_865942 ?auto_865944 ) ) ( not ( = ?auto_865943 ?auto_865944 ) ) ( ON ?auto_865942 ?auto_865943 ) ( ON ?auto_865941 ?auto_865942 ) ( ON ?auto_865940 ?auto_865941 ) ( ON ?auto_865939 ?auto_865940 ) ( ON ?auto_865938 ?auto_865939 ) ( CLEAR ?auto_865936 ) ( ON ?auto_865937 ?auto_865938 ) ( CLEAR ?auto_865937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_865931 ?auto_865932 ?auto_865933 ?auto_865934 ?auto_865935 ?auto_865936 ?auto_865937 )
      ( MAKE-13PILE ?auto_865931 ?auto_865932 ?auto_865933 ?auto_865934 ?auto_865935 ?auto_865936 ?auto_865937 ?auto_865938 ?auto_865939 ?auto_865940 ?auto_865941 ?auto_865942 ?auto_865943 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_865985 - BLOCK
      ?auto_865986 - BLOCK
      ?auto_865987 - BLOCK
      ?auto_865988 - BLOCK
      ?auto_865989 - BLOCK
      ?auto_865990 - BLOCK
      ?auto_865991 - BLOCK
      ?auto_865992 - BLOCK
      ?auto_865993 - BLOCK
      ?auto_865994 - BLOCK
      ?auto_865995 - BLOCK
      ?auto_865996 - BLOCK
      ?auto_865997 - BLOCK
    )
    :vars
    (
      ?auto_865998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_865997 ?auto_865998 ) ( ON-TABLE ?auto_865985 ) ( ON ?auto_865986 ?auto_865985 ) ( ON ?auto_865987 ?auto_865986 ) ( ON ?auto_865988 ?auto_865987 ) ( ON ?auto_865989 ?auto_865988 ) ( not ( = ?auto_865985 ?auto_865986 ) ) ( not ( = ?auto_865985 ?auto_865987 ) ) ( not ( = ?auto_865985 ?auto_865988 ) ) ( not ( = ?auto_865985 ?auto_865989 ) ) ( not ( = ?auto_865985 ?auto_865990 ) ) ( not ( = ?auto_865985 ?auto_865991 ) ) ( not ( = ?auto_865985 ?auto_865992 ) ) ( not ( = ?auto_865985 ?auto_865993 ) ) ( not ( = ?auto_865985 ?auto_865994 ) ) ( not ( = ?auto_865985 ?auto_865995 ) ) ( not ( = ?auto_865985 ?auto_865996 ) ) ( not ( = ?auto_865985 ?auto_865997 ) ) ( not ( = ?auto_865985 ?auto_865998 ) ) ( not ( = ?auto_865986 ?auto_865987 ) ) ( not ( = ?auto_865986 ?auto_865988 ) ) ( not ( = ?auto_865986 ?auto_865989 ) ) ( not ( = ?auto_865986 ?auto_865990 ) ) ( not ( = ?auto_865986 ?auto_865991 ) ) ( not ( = ?auto_865986 ?auto_865992 ) ) ( not ( = ?auto_865986 ?auto_865993 ) ) ( not ( = ?auto_865986 ?auto_865994 ) ) ( not ( = ?auto_865986 ?auto_865995 ) ) ( not ( = ?auto_865986 ?auto_865996 ) ) ( not ( = ?auto_865986 ?auto_865997 ) ) ( not ( = ?auto_865986 ?auto_865998 ) ) ( not ( = ?auto_865987 ?auto_865988 ) ) ( not ( = ?auto_865987 ?auto_865989 ) ) ( not ( = ?auto_865987 ?auto_865990 ) ) ( not ( = ?auto_865987 ?auto_865991 ) ) ( not ( = ?auto_865987 ?auto_865992 ) ) ( not ( = ?auto_865987 ?auto_865993 ) ) ( not ( = ?auto_865987 ?auto_865994 ) ) ( not ( = ?auto_865987 ?auto_865995 ) ) ( not ( = ?auto_865987 ?auto_865996 ) ) ( not ( = ?auto_865987 ?auto_865997 ) ) ( not ( = ?auto_865987 ?auto_865998 ) ) ( not ( = ?auto_865988 ?auto_865989 ) ) ( not ( = ?auto_865988 ?auto_865990 ) ) ( not ( = ?auto_865988 ?auto_865991 ) ) ( not ( = ?auto_865988 ?auto_865992 ) ) ( not ( = ?auto_865988 ?auto_865993 ) ) ( not ( = ?auto_865988 ?auto_865994 ) ) ( not ( = ?auto_865988 ?auto_865995 ) ) ( not ( = ?auto_865988 ?auto_865996 ) ) ( not ( = ?auto_865988 ?auto_865997 ) ) ( not ( = ?auto_865988 ?auto_865998 ) ) ( not ( = ?auto_865989 ?auto_865990 ) ) ( not ( = ?auto_865989 ?auto_865991 ) ) ( not ( = ?auto_865989 ?auto_865992 ) ) ( not ( = ?auto_865989 ?auto_865993 ) ) ( not ( = ?auto_865989 ?auto_865994 ) ) ( not ( = ?auto_865989 ?auto_865995 ) ) ( not ( = ?auto_865989 ?auto_865996 ) ) ( not ( = ?auto_865989 ?auto_865997 ) ) ( not ( = ?auto_865989 ?auto_865998 ) ) ( not ( = ?auto_865990 ?auto_865991 ) ) ( not ( = ?auto_865990 ?auto_865992 ) ) ( not ( = ?auto_865990 ?auto_865993 ) ) ( not ( = ?auto_865990 ?auto_865994 ) ) ( not ( = ?auto_865990 ?auto_865995 ) ) ( not ( = ?auto_865990 ?auto_865996 ) ) ( not ( = ?auto_865990 ?auto_865997 ) ) ( not ( = ?auto_865990 ?auto_865998 ) ) ( not ( = ?auto_865991 ?auto_865992 ) ) ( not ( = ?auto_865991 ?auto_865993 ) ) ( not ( = ?auto_865991 ?auto_865994 ) ) ( not ( = ?auto_865991 ?auto_865995 ) ) ( not ( = ?auto_865991 ?auto_865996 ) ) ( not ( = ?auto_865991 ?auto_865997 ) ) ( not ( = ?auto_865991 ?auto_865998 ) ) ( not ( = ?auto_865992 ?auto_865993 ) ) ( not ( = ?auto_865992 ?auto_865994 ) ) ( not ( = ?auto_865992 ?auto_865995 ) ) ( not ( = ?auto_865992 ?auto_865996 ) ) ( not ( = ?auto_865992 ?auto_865997 ) ) ( not ( = ?auto_865992 ?auto_865998 ) ) ( not ( = ?auto_865993 ?auto_865994 ) ) ( not ( = ?auto_865993 ?auto_865995 ) ) ( not ( = ?auto_865993 ?auto_865996 ) ) ( not ( = ?auto_865993 ?auto_865997 ) ) ( not ( = ?auto_865993 ?auto_865998 ) ) ( not ( = ?auto_865994 ?auto_865995 ) ) ( not ( = ?auto_865994 ?auto_865996 ) ) ( not ( = ?auto_865994 ?auto_865997 ) ) ( not ( = ?auto_865994 ?auto_865998 ) ) ( not ( = ?auto_865995 ?auto_865996 ) ) ( not ( = ?auto_865995 ?auto_865997 ) ) ( not ( = ?auto_865995 ?auto_865998 ) ) ( not ( = ?auto_865996 ?auto_865997 ) ) ( not ( = ?auto_865996 ?auto_865998 ) ) ( not ( = ?auto_865997 ?auto_865998 ) ) ( ON ?auto_865996 ?auto_865997 ) ( ON ?auto_865995 ?auto_865996 ) ( ON ?auto_865994 ?auto_865995 ) ( ON ?auto_865993 ?auto_865994 ) ( ON ?auto_865992 ?auto_865993 ) ( ON ?auto_865991 ?auto_865992 ) ( CLEAR ?auto_865989 ) ( ON ?auto_865990 ?auto_865991 ) ( CLEAR ?auto_865990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_865985 ?auto_865986 ?auto_865987 ?auto_865988 ?auto_865989 ?auto_865990 )
      ( MAKE-13PILE ?auto_865985 ?auto_865986 ?auto_865987 ?auto_865988 ?auto_865989 ?auto_865990 ?auto_865991 ?auto_865992 ?auto_865993 ?auto_865994 ?auto_865995 ?auto_865996 ?auto_865997 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_866039 - BLOCK
      ?auto_866040 - BLOCK
      ?auto_866041 - BLOCK
      ?auto_866042 - BLOCK
      ?auto_866043 - BLOCK
      ?auto_866044 - BLOCK
      ?auto_866045 - BLOCK
      ?auto_866046 - BLOCK
      ?auto_866047 - BLOCK
      ?auto_866048 - BLOCK
      ?auto_866049 - BLOCK
      ?auto_866050 - BLOCK
      ?auto_866051 - BLOCK
    )
    :vars
    (
      ?auto_866052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866051 ?auto_866052 ) ( ON-TABLE ?auto_866039 ) ( ON ?auto_866040 ?auto_866039 ) ( ON ?auto_866041 ?auto_866040 ) ( ON ?auto_866042 ?auto_866041 ) ( not ( = ?auto_866039 ?auto_866040 ) ) ( not ( = ?auto_866039 ?auto_866041 ) ) ( not ( = ?auto_866039 ?auto_866042 ) ) ( not ( = ?auto_866039 ?auto_866043 ) ) ( not ( = ?auto_866039 ?auto_866044 ) ) ( not ( = ?auto_866039 ?auto_866045 ) ) ( not ( = ?auto_866039 ?auto_866046 ) ) ( not ( = ?auto_866039 ?auto_866047 ) ) ( not ( = ?auto_866039 ?auto_866048 ) ) ( not ( = ?auto_866039 ?auto_866049 ) ) ( not ( = ?auto_866039 ?auto_866050 ) ) ( not ( = ?auto_866039 ?auto_866051 ) ) ( not ( = ?auto_866039 ?auto_866052 ) ) ( not ( = ?auto_866040 ?auto_866041 ) ) ( not ( = ?auto_866040 ?auto_866042 ) ) ( not ( = ?auto_866040 ?auto_866043 ) ) ( not ( = ?auto_866040 ?auto_866044 ) ) ( not ( = ?auto_866040 ?auto_866045 ) ) ( not ( = ?auto_866040 ?auto_866046 ) ) ( not ( = ?auto_866040 ?auto_866047 ) ) ( not ( = ?auto_866040 ?auto_866048 ) ) ( not ( = ?auto_866040 ?auto_866049 ) ) ( not ( = ?auto_866040 ?auto_866050 ) ) ( not ( = ?auto_866040 ?auto_866051 ) ) ( not ( = ?auto_866040 ?auto_866052 ) ) ( not ( = ?auto_866041 ?auto_866042 ) ) ( not ( = ?auto_866041 ?auto_866043 ) ) ( not ( = ?auto_866041 ?auto_866044 ) ) ( not ( = ?auto_866041 ?auto_866045 ) ) ( not ( = ?auto_866041 ?auto_866046 ) ) ( not ( = ?auto_866041 ?auto_866047 ) ) ( not ( = ?auto_866041 ?auto_866048 ) ) ( not ( = ?auto_866041 ?auto_866049 ) ) ( not ( = ?auto_866041 ?auto_866050 ) ) ( not ( = ?auto_866041 ?auto_866051 ) ) ( not ( = ?auto_866041 ?auto_866052 ) ) ( not ( = ?auto_866042 ?auto_866043 ) ) ( not ( = ?auto_866042 ?auto_866044 ) ) ( not ( = ?auto_866042 ?auto_866045 ) ) ( not ( = ?auto_866042 ?auto_866046 ) ) ( not ( = ?auto_866042 ?auto_866047 ) ) ( not ( = ?auto_866042 ?auto_866048 ) ) ( not ( = ?auto_866042 ?auto_866049 ) ) ( not ( = ?auto_866042 ?auto_866050 ) ) ( not ( = ?auto_866042 ?auto_866051 ) ) ( not ( = ?auto_866042 ?auto_866052 ) ) ( not ( = ?auto_866043 ?auto_866044 ) ) ( not ( = ?auto_866043 ?auto_866045 ) ) ( not ( = ?auto_866043 ?auto_866046 ) ) ( not ( = ?auto_866043 ?auto_866047 ) ) ( not ( = ?auto_866043 ?auto_866048 ) ) ( not ( = ?auto_866043 ?auto_866049 ) ) ( not ( = ?auto_866043 ?auto_866050 ) ) ( not ( = ?auto_866043 ?auto_866051 ) ) ( not ( = ?auto_866043 ?auto_866052 ) ) ( not ( = ?auto_866044 ?auto_866045 ) ) ( not ( = ?auto_866044 ?auto_866046 ) ) ( not ( = ?auto_866044 ?auto_866047 ) ) ( not ( = ?auto_866044 ?auto_866048 ) ) ( not ( = ?auto_866044 ?auto_866049 ) ) ( not ( = ?auto_866044 ?auto_866050 ) ) ( not ( = ?auto_866044 ?auto_866051 ) ) ( not ( = ?auto_866044 ?auto_866052 ) ) ( not ( = ?auto_866045 ?auto_866046 ) ) ( not ( = ?auto_866045 ?auto_866047 ) ) ( not ( = ?auto_866045 ?auto_866048 ) ) ( not ( = ?auto_866045 ?auto_866049 ) ) ( not ( = ?auto_866045 ?auto_866050 ) ) ( not ( = ?auto_866045 ?auto_866051 ) ) ( not ( = ?auto_866045 ?auto_866052 ) ) ( not ( = ?auto_866046 ?auto_866047 ) ) ( not ( = ?auto_866046 ?auto_866048 ) ) ( not ( = ?auto_866046 ?auto_866049 ) ) ( not ( = ?auto_866046 ?auto_866050 ) ) ( not ( = ?auto_866046 ?auto_866051 ) ) ( not ( = ?auto_866046 ?auto_866052 ) ) ( not ( = ?auto_866047 ?auto_866048 ) ) ( not ( = ?auto_866047 ?auto_866049 ) ) ( not ( = ?auto_866047 ?auto_866050 ) ) ( not ( = ?auto_866047 ?auto_866051 ) ) ( not ( = ?auto_866047 ?auto_866052 ) ) ( not ( = ?auto_866048 ?auto_866049 ) ) ( not ( = ?auto_866048 ?auto_866050 ) ) ( not ( = ?auto_866048 ?auto_866051 ) ) ( not ( = ?auto_866048 ?auto_866052 ) ) ( not ( = ?auto_866049 ?auto_866050 ) ) ( not ( = ?auto_866049 ?auto_866051 ) ) ( not ( = ?auto_866049 ?auto_866052 ) ) ( not ( = ?auto_866050 ?auto_866051 ) ) ( not ( = ?auto_866050 ?auto_866052 ) ) ( not ( = ?auto_866051 ?auto_866052 ) ) ( ON ?auto_866050 ?auto_866051 ) ( ON ?auto_866049 ?auto_866050 ) ( ON ?auto_866048 ?auto_866049 ) ( ON ?auto_866047 ?auto_866048 ) ( ON ?auto_866046 ?auto_866047 ) ( ON ?auto_866045 ?auto_866046 ) ( ON ?auto_866044 ?auto_866045 ) ( CLEAR ?auto_866042 ) ( ON ?auto_866043 ?auto_866044 ) ( CLEAR ?auto_866043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_866039 ?auto_866040 ?auto_866041 ?auto_866042 ?auto_866043 )
      ( MAKE-13PILE ?auto_866039 ?auto_866040 ?auto_866041 ?auto_866042 ?auto_866043 ?auto_866044 ?auto_866045 ?auto_866046 ?auto_866047 ?auto_866048 ?auto_866049 ?auto_866050 ?auto_866051 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_866093 - BLOCK
      ?auto_866094 - BLOCK
      ?auto_866095 - BLOCK
      ?auto_866096 - BLOCK
      ?auto_866097 - BLOCK
      ?auto_866098 - BLOCK
      ?auto_866099 - BLOCK
      ?auto_866100 - BLOCK
      ?auto_866101 - BLOCK
      ?auto_866102 - BLOCK
      ?auto_866103 - BLOCK
      ?auto_866104 - BLOCK
      ?auto_866105 - BLOCK
    )
    :vars
    (
      ?auto_866106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866105 ?auto_866106 ) ( ON-TABLE ?auto_866093 ) ( ON ?auto_866094 ?auto_866093 ) ( ON ?auto_866095 ?auto_866094 ) ( not ( = ?auto_866093 ?auto_866094 ) ) ( not ( = ?auto_866093 ?auto_866095 ) ) ( not ( = ?auto_866093 ?auto_866096 ) ) ( not ( = ?auto_866093 ?auto_866097 ) ) ( not ( = ?auto_866093 ?auto_866098 ) ) ( not ( = ?auto_866093 ?auto_866099 ) ) ( not ( = ?auto_866093 ?auto_866100 ) ) ( not ( = ?auto_866093 ?auto_866101 ) ) ( not ( = ?auto_866093 ?auto_866102 ) ) ( not ( = ?auto_866093 ?auto_866103 ) ) ( not ( = ?auto_866093 ?auto_866104 ) ) ( not ( = ?auto_866093 ?auto_866105 ) ) ( not ( = ?auto_866093 ?auto_866106 ) ) ( not ( = ?auto_866094 ?auto_866095 ) ) ( not ( = ?auto_866094 ?auto_866096 ) ) ( not ( = ?auto_866094 ?auto_866097 ) ) ( not ( = ?auto_866094 ?auto_866098 ) ) ( not ( = ?auto_866094 ?auto_866099 ) ) ( not ( = ?auto_866094 ?auto_866100 ) ) ( not ( = ?auto_866094 ?auto_866101 ) ) ( not ( = ?auto_866094 ?auto_866102 ) ) ( not ( = ?auto_866094 ?auto_866103 ) ) ( not ( = ?auto_866094 ?auto_866104 ) ) ( not ( = ?auto_866094 ?auto_866105 ) ) ( not ( = ?auto_866094 ?auto_866106 ) ) ( not ( = ?auto_866095 ?auto_866096 ) ) ( not ( = ?auto_866095 ?auto_866097 ) ) ( not ( = ?auto_866095 ?auto_866098 ) ) ( not ( = ?auto_866095 ?auto_866099 ) ) ( not ( = ?auto_866095 ?auto_866100 ) ) ( not ( = ?auto_866095 ?auto_866101 ) ) ( not ( = ?auto_866095 ?auto_866102 ) ) ( not ( = ?auto_866095 ?auto_866103 ) ) ( not ( = ?auto_866095 ?auto_866104 ) ) ( not ( = ?auto_866095 ?auto_866105 ) ) ( not ( = ?auto_866095 ?auto_866106 ) ) ( not ( = ?auto_866096 ?auto_866097 ) ) ( not ( = ?auto_866096 ?auto_866098 ) ) ( not ( = ?auto_866096 ?auto_866099 ) ) ( not ( = ?auto_866096 ?auto_866100 ) ) ( not ( = ?auto_866096 ?auto_866101 ) ) ( not ( = ?auto_866096 ?auto_866102 ) ) ( not ( = ?auto_866096 ?auto_866103 ) ) ( not ( = ?auto_866096 ?auto_866104 ) ) ( not ( = ?auto_866096 ?auto_866105 ) ) ( not ( = ?auto_866096 ?auto_866106 ) ) ( not ( = ?auto_866097 ?auto_866098 ) ) ( not ( = ?auto_866097 ?auto_866099 ) ) ( not ( = ?auto_866097 ?auto_866100 ) ) ( not ( = ?auto_866097 ?auto_866101 ) ) ( not ( = ?auto_866097 ?auto_866102 ) ) ( not ( = ?auto_866097 ?auto_866103 ) ) ( not ( = ?auto_866097 ?auto_866104 ) ) ( not ( = ?auto_866097 ?auto_866105 ) ) ( not ( = ?auto_866097 ?auto_866106 ) ) ( not ( = ?auto_866098 ?auto_866099 ) ) ( not ( = ?auto_866098 ?auto_866100 ) ) ( not ( = ?auto_866098 ?auto_866101 ) ) ( not ( = ?auto_866098 ?auto_866102 ) ) ( not ( = ?auto_866098 ?auto_866103 ) ) ( not ( = ?auto_866098 ?auto_866104 ) ) ( not ( = ?auto_866098 ?auto_866105 ) ) ( not ( = ?auto_866098 ?auto_866106 ) ) ( not ( = ?auto_866099 ?auto_866100 ) ) ( not ( = ?auto_866099 ?auto_866101 ) ) ( not ( = ?auto_866099 ?auto_866102 ) ) ( not ( = ?auto_866099 ?auto_866103 ) ) ( not ( = ?auto_866099 ?auto_866104 ) ) ( not ( = ?auto_866099 ?auto_866105 ) ) ( not ( = ?auto_866099 ?auto_866106 ) ) ( not ( = ?auto_866100 ?auto_866101 ) ) ( not ( = ?auto_866100 ?auto_866102 ) ) ( not ( = ?auto_866100 ?auto_866103 ) ) ( not ( = ?auto_866100 ?auto_866104 ) ) ( not ( = ?auto_866100 ?auto_866105 ) ) ( not ( = ?auto_866100 ?auto_866106 ) ) ( not ( = ?auto_866101 ?auto_866102 ) ) ( not ( = ?auto_866101 ?auto_866103 ) ) ( not ( = ?auto_866101 ?auto_866104 ) ) ( not ( = ?auto_866101 ?auto_866105 ) ) ( not ( = ?auto_866101 ?auto_866106 ) ) ( not ( = ?auto_866102 ?auto_866103 ) ) ( not ( = ?auto_866102 ?auto_866104 ) ) ( not ( = ?auto_866102 ?auto_866105 ) ) ( not ( = ?auto_866102 ?auto_866106 ) ) ( not ( = ?auto_866103 ?auto_866104 ) ) ( not ( = ?auto_866103 ?auto_866105 ) ) ( not ( = ?auto_866103 ?auto_866106 ) ) ( not ( = ?auto_866104 ?auto_866105 ) ) ( not ( = ?auto_866104 ?auto_866106 ) ) ( not ( = ?auto_866105 ?auto_866106 ) ) ( ON ?auto_866104 ?auto_866105 ) ( ON ?auto_866103 ?auto_866104 ) ( ON ?auto_866102 ?auto_866103 ) ( ON ?auto_866101 ?auto_866102 ) ( ON ?auto_866100 ?auto_866101 ) ( ON ?auto_866099 ?auto_866100 ) ( ON ?auto_866098 ?auto_866099 ) ( ON ?auto_866097 ?auto_866098 ) ( CLEAR ?auto_866095 ) ( ON ?auto_866096 ?auto_866097 ) ( CLEAR ?auto_866096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_866093 ?auto_866094 ?auto_866095 ?auto_866096 )
      ( MAKE-13PILE ?auto_866093 ?auto_866094 ?auto_866095 ?auto_866096 ?auto_866097 ?auto_866098 ?auto_866099 ?auto_866100 ?auto_866101 ?auto_866102 ?auto_866103 ?auto_866104 ?auto_866105 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_866147 - BLOCK
      ?auto_866148 - BLOCK
      ?auto_866149 - BLOCK
      ?auto_866150 - BLOCK
      ?auto_866151 - BLOCK
      ?auto_866152 - BLOCK
      ?auto_866153 - BLOCK
      ?auto_866154 - BLOCK
      ?auto_866155 - BLOCK
      ?auto_866156 - BLOCK
      ?auto_866157 - BLOCK
      ?auto_866158 - BLOCK
      ?auto_866159 - BLOCK
    )
    :vars
    (
      ?auto_866160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866159 ?auto_866160 ) ( ON-TABLE ?auto_866147 ) ( ON ?auto_866148 ?auto_866147 ) ( not ( = ?auto_866147 ?auto_866148 ) ) ( not ( = ?auto_866147 ?auto_866149 ) ) ( not ( = ?auto_866147 ?auto_866150 ) ) ( not ( = ?auto_866147 ?auto_866151 ) ) ( not ( = ?auto_866147 ?auto_866152 ) ) ( not ( = ?auto_866147 ?auto_866153 ) ) ( not ( = ?auto_866147 ?auto_866154 ) ) ( not ( = ?auto_866147 ?auto_866155 ) ) ( not ( = ?auto_866147 ?auto_866156 ) ) ( not ( = ?auto_866147 ?auto_866157 ) ) ( not ( = ?auto_866147 ?auto_866158 ) ) ( not ( = ?auto_866147 ?auto_866159 ) ) ( not ( = ?auto_866147 ?auto_866160 ) ) ( not ( = ?auto_866148 ?auto_866149 ) ) ( not ( = ?auto_866148 ?auto_866150 ) ) ( not ( = ?auto_866148 ?auto_866151 ) ) ( not ( = ?auto_866148 ?auto_866152 ) ) ( not ( = ?auto_866148 ?auto_866153 ) ) ( not ( = ?auto_866148 ?auto_866154 ) ) ( not ( = ?auto_866148 ?auto_866155 ) ) ( not ( = ?auto_866148 ?auto_866156 ) ) ( not ( = ?auto_866148 ?auto_866157 ) ) ( not ( = ?auto_866148 ?auto_866158 ) ) ( not ( = ?auto_866148 ?auto_866159 ) ) ( not ( = ?auto_866148 ?auto_866160 ) ) ( not ( = ?auto_866149 ?auto_866150 ) ) ( not ( = ?auto_866149 ?auto_866151 ) ) ( not ( = ?auto_866149 ?auto_866152 ) ) ( not ( = ?auto_866149 ?auto_866153 ) ) ( not ( = ?auto_866149 ?auto_866154 ) ) ( not ( = ?auto_866149 ?auto_866155 ) ) ( not ( = ?auto_866149 ?auto_866156 ) ) ( not ( = ?auto_866149 ?auto_866157 ) ) ( not ( = ?auto_866149 ?auto_866158 ) ) ( not ( = ?auto_866149 ?auto_866159 ) ) ( not ( = ?auto_866149 ?auto_866160 ) ) ( not ( = ?auto_866150 ?auto_866151 ) ) ( not ( = ?auto_866150 ?auto_866152 ) ) ( not ( = ?auto_866150 ?auto_866153 ) ) ( not ( = ?auto_866150 ?auto_866154 ) ) ( not ( = ?auto_866150 ?auto_866155 ) ) ( not ( = ?auto_866150 ?auto_866156 ) ) ( not ( = ?auto_866150 ?auto_866157 ) ) ( not ( = ?auto_866150 ?auto_866158 ) ) ( not ( = ?auto_866150 ?auto_866159 ) ) ( not ( = ?auto_866150 ?auto_866160 ) ) ( not ( = ?auto_866151 ?auto_866152 ) ) ( not ( = ?auto_866151 ?auto_866153 ) ) ( not ( = ?auto_866151 ?auto_866154 ) ) ( not ( = ?auto_866151 ?auto_866155 ) ) ( not ( = ?auto_866151 ?auto_866156 ) ) ( not ( = ?auto_866151 ?auto_866157 ) ) ( not ( = ?auto_866151 ?auto_866158 ) ) ( not ( = ?auto_866151 ?auto_866159 ) ) ( not ( = ?auto_866151 ?auto_866160 ) ) ( not ( = ?auto_866152 ?auto_866153 ) ) ( not ( = ?auto_866152 ?auto_866154 ) ) ( not ( = ?auto_866152 ?auto_866155 ) ) ( not ( = ?auto_866152 ?auto_866156 ) ) ( not ( = ?auto_866152 ?auto_866157 ) ) ( not ( = ?auto_866152 ?auto_866158 ) ) ( not ( = ?auto_866152 ?auto_866159 ) ) ( not ( = ?auto_866152 ?auto_866160 ) ) ( not ( = ?auto_866153 ?auto_866154 ) ) ( not ( = ?auto_866153 ?auto_866155 ) ) ( not ( = ?auto_866153 ?auto_866156 ) ) ( not ( = ?auto_866153 ?auto_866157 ) ) ( not ( = ?auto_866153 ?auto_866158 ) ) ( not ( = ?auto_866153 ?auto_866159 ) ) ( not ( = ?auto_866153 ?auto_866160 ) ) ( not ( = ?auto_866154 ?auto_866155 ) ) ( not ( = ?auto_866154 ?auto_866156 ) ) ( not ( = ?auto_866154 ?auto_866157 ) ) ( not ( = ?auto_866154 ?auto_866158 ) ) ( not ( = ?auto_866154 ?auto_866159 ) ) ( not ( = ?auto_866154 ?auto_866160 ) ) ( not ( = ?auto_866155 ?auto_866156 ) ) ( not ( = ?auto_866155 ?auto_866157 ) ) ( not ( = ?auto_866155 ?auto_866158 ) ) ( not ( = ?auto_866155 ?auto_866159 ) ) ( not ( = ?auto_866155 ?auto_866160 ) ) ( not ( = ?auto_866156 ?auto_866157 ) ) ( not ( = ?auto_866156 ?auto_866158 ) ) ( not ( = ?auto_866156 ?auto_866159 ) ) ( not ( = ?auto_866156 ?auto_866160 ) ) ( not ( = ?auto_866157 ?auto_866158 ) ) ( not ( = ?auto_866157 ?auto_866159 ) ) ( not ( = ?auto_866157 ?auto_866160 ) ) ( not ( = ?auto_866158 ?auto_866159 ) ) ( not ( = ?auto_866158 ?auto_866160 ) ) ( not ( = ?auto_866159 ?auto_866160 ) ) ( ON ?auto_866158 ?auto_866159 ) ( ON ?auto_866157 ?auto_866158 ) ( ON ?auto_866156 ?auto_866157 ) ( ON ?auto_866155 ?auto_866156 ) ( ON ?auto_866154 ?auto_866155 ) ( ON ?auto_866153 ?auto_866154 ) ( ON ?auto_866152 ?auto_866153 ) ( ON ?auto_866151 ?auto_866152 ) ( ON ?auto_866150 ?auto_866151 ) ( CLEAR ?auto_866148 ) ( ON ?auto_866149 ?auto_866150 ) ( CLEAR ?auto_866149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_866147 ?auto_866148 ?auto_866149 )
      ( MAKE-13PILE ?auto_866147 ?auto_866148 ?auto_866149 ?auto_866150 ?auto_866151 ?auto_866152 ?auto_866153 ?auto_866154 ?auto_866155 ?auto_866156 ?auto_866157 ?auto_866158 ?auto_866159 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_866201 - BLOCK
      ?auto_866202 - BLOCK
      ?auto_866203 - BLOCK
      ?auto_866204 - BLOCK
      ?auto_866205 - BLOCK
      ?auto_866206 - BLOCK
      ?auto_866207 - BLOCK
      ?auto_866208 - BLOCK
      ?auto_866209 - BLOCK
      ?auto_866210 - BLOCK
      ?auto_866211 - BLOCK
      ?auto_866212 - BLOCK
      ?auto_866213 - BLOCK
    )
    :vars
    (
      ?auto_866214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866213 ?auto_866214 ) ( ON-TABLE ?auto_866201 ) ( not ( = ?auto_866201 ?auto_866202 ) ) ( not ( = ?auto_866201 ?auto_866203 ) ) ( not ( = ?auto_866201 ?auto_866204 ) ) ( not ( = ?auto_866201 ?auto_866205 ) ) ( not ( = ?auto_866201 ?auto_866206 ) ) ( not ( = ?auto_866201 ?auto_866207 ) ) ( not ( = ?auto_866201 ?auto_866208 ) ) ( not ( = ?auto_866201 ?auto_866209 ) ) ( not ( = ?auto_866201 ?auto_866210 ) ) ( not ( = ?auto_866201 ?auto_866211 ) ) ( not ( = ?auto_866201 ?auto_866212 ) ) ( not ( = ?auto_866201 ?auto_866213 ) ) ( not ( = ?auto_866201 ?auto_866214 ) ) ( not ( = ?auto_866202 ?auto_866203 ) ) ( not ( = ?auto_866202 ?auto_866204 ) ) ( not ( = ?auto_866202 ?auto_866205 ) ) ( not ( = ?auto_866202 ?auto_866206 ) ) ( not ( = ?auto_866202 ?auto_866207 ) ) ( not ( = ?auto_866202 ?auto_866208 ) ) ( not ( = ?auto_866202 ?auto_866209 ) ) ( not ( = ?auto_866202 ?auto_866210 ) ) ( not ( = ?auto_866202 ?auto_866211 ) ) ( not ( = ?auto_866202 ?auto_866212 ) ) ( not ( = ?auto_866202 ?auto_866213 ) ) ( not ( = ?auto_866202 ?auto_866214 ) ) ( not ( = ?auto_866203 ?auto_866204 ) ) ( not ( = ?auto_866203 ?auto_866205 ) ) ( not ( = ?auto_866203 ?auto_866206 ) ) ( not ( = ?auto_866203 ?auto_866207 ) ) ( not ( = ?auto_866203 ?auto_866208 ) ) ( not ( = ?auto_866203 ?auto_866209 ) ) ( not ( = ?auto_866203 ?auto_866210 ) ) ( not ( = ?auto_866203 ?auto_866211 ) ) ( not ( = ?auto_866203 ?auto_866212 ) ) ( not ( = ?auto_866203 ?auto_866213 ) ) ( not ( = ?auto_866203 ?auto_866214 ) ) ( not ( = ?auto_866204 ?auto_866205 ) ) ( not ( = ?auto_866204 ?auto_866206 ) ) ( not ( = ?auto_866204 ?auto_866207 ) ) ( not ( = ?auto_866204 ?auto_866208 ) ) ( not ( = ?auto_866204 ?auto_866209 ) ) ( not ( = ?auto_866204 ?auto_866210 ) ) ( not ( = ?auto_866204 ?auto_866211 ) ) ( not ( = ?auto_866204 ?auto_866212 ) ) ( not ( = ?auto_866204 ?auto_866213 ) ) ( not ( = ?auto_866204 ?auto_866214 ) ) ( not ( = ?auto_866205 ?auto_866206 ) ) ( not ( = ?auto_866205 ?auto_866207 ) ) ( not ( = ?auto_866205 ?auto_866208 ) ) ( not ( = ?auto_866205 ?auto_866209 ) ) ( not ( = ?auto_866205 ?auto_866210 ) ) ( not ( = ?auto_866205 ?auto_866211 ) ) ( not ( = ?auto_866205 ?auto_866212 ) ) ( not ( = ?auto_866205 ?auto_866213 ) ) ( not ( = ?auto_866205 ?auto_866214 ) ) ( not ( = ?auto_866206 ?auto_866207 ) ) ( not ( = ?auto_866206 ?auto_866208 ) ) ( not ( = ?auto_866206 ?auto_866209 ) ) ( not ( = ?auto_866206 ?auto_866210 ) ) ( not ( = ?auto_866206 ?auto_866211 ) ) ( not ( = ?auto_866206 ?auto_866212 ) ) ( not ( = ?auto_866206 ?auto_866213 ) ) ( not ( = ?auto_866206 ?auto_866214 ) ) ( not ( = ?auto_866207 ?auto_866208 ) ) ( not ( = ?auto_866207 ?auto_866209 ) ) ( not ( = ?auto_866207 ?auto_866210 ) ) ( not ( = ?auto_866207 ?auto_866211 ) ) ( not ( = ?auto_866207 ?auto_866212 ) ) ( not ( = ?auto_866207 ?auto_866213 ) ) ( not ( = ?auto_866207 ?auto_866214 ) ) ( not ( = ?auto_866208 ?auto_866209 ) ) ( not ( = ?auto_866208 ?auto_866210 ) ) ( not ( = ?auto_866208 ?auto_866211 ) ) ( not ( = ?auto_866208 ?auto_866212 ) ) ( not ( = ?auto_866208 ?auto_866213 ) ) ( not ( = ?auto_866208 ?auto_866214 ) ) ( not ( = ?auto_866209 ?auto_866210 ) ) ( not ( = ?auto_866209 ?auto_866211 ) ) ( not ( = ?auto_866209 ?auto_866212 ) ) ( not ( = ?auto_866209 ?auto_866213 ) ) ( not ( = ?auto_866209 ?auto_866214 ) ) ( not ( = ?auto_866210 ?auto_866211 ) ) ( not ( = ?auto_866210 ?auto_866212 ) ) ( not ( = ?auto_866210 ?auto_866213 ) ) ( not ( = ?auto_866210 ?auto_866214 ) ) ( not ( = ?auto_866211 ?auto_866212 ) ) ( not ( = ?auto_866211 ?auto_866213 ) ) ( not ( = ?auto_866211 ?auto_866214 ) ) ( not ( = ?auto_866212 ?auto_866213 ) ) ( not ( = ?auto_866212 ?auto_866214 ) ) ( not ( = ?auto_866213 ?auto_866214 ) ) ( ON ?auto_866212 ?auto_866213 ) ( ON ?auto_866211 ?auto_866212 ) ( ON ?auto_866210 ?auto_866211 ) ( ON ?auto_866209 ?auto_866210 ) ( ON ?auto_866208 ?auto_866209 ) ( ON ?auto_866207 ?auto_866208 ) ( ON ?auto_866206 ?auto_866207 ) ( ON ?auto_866205 ?auto_866206 ) ( ON ?auto_866204 ?auto_866205 ) ( ON ?auto_866203 ?auto_866204 ) ( CLEAR ?auto_866201 ) ( ON ?auto_866202 ?auto_866203 ) ( CLEAR ?auto_866202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_866201 ?auto_866202 )
      ( MAKE-13PILE ?auto_866201 ?auto_866202 ?auto_866203 ?auto_866204 ?auto_866205 ?auto_866206 ?auto_866207 ?auto_866208 ?auto_866209 ?auto_866210 ?auto_866211 ?auto_866212 ?auto_866213 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_866255 - BLOCK
      ?auto_866256 - BLOCK
      ?auto_866257 - BLOCK
      ?auto_866258 - BLOCK
      ?auto_866259 - BLOCK
      ?auto_866260 - BLOCK
      ?auto_866261 - BLOCK
      ?auto_866262 - BLOCK
      ?auto_866263 - BLOCK
      ?auto_866264 - BLOCK
      ?auto_866265 - BLOCK
      ?auto_866266 - BLOCK
      ?auto_866267 - BLOCK
    )
    :vars
    (
      ?auto_866268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866267 ?auto_866268 ) ( not ( = ?auto_866255 ?auto_866256 ) ) ( not ( = ?auto_866255 ?auto_866257 ) ) ( not ( = ?auto_866255 ?auto_866258 ) ) ( not ( = ?auto_866255 ?auto_866259 ) ) ( not ( = ?auto_866255 ?auto_866260 ) ) ( not ( = ?auto_866255 ?auto_866261 ) ) ( not ( = ?auto_866255 ?auto_866262 ) ) ( not ( = ?auto_866255 ?auto_866263 ) ) ( not ( = ?auto_866255 ?auto_866264 ) ) ( not ( = ?auto_866255 ?auto_866265 ) ) ( not ( = ?auto_866255 ?auto_866266 ) ) ( not ( = ?auto_866255 ?auto_866267 ) ) ( not ( = ?auto_866255 ?auto_866268 ) ) ( not ( = ?auto_866256 ?auto_866257 ) ) ( not ( = ?auto_866256 ?auto_866258 ) ) ( not ( = ?auto_866256 ?auto_866259 ) ) ( not ( = ?auto_866256 ?auto_866260 ) ) ( not ( = ?auto_866256 ?auto_866261 ) ) ( not ( = ?auto_866256 ?auto_866262 ) ) ( not ( = ?auto_866256 ?auto_866263 ) ) ( not ( = ?auto_866256 ?auto_866264 ) ) ( not ( = ?auto_866256 ?auto_866265 ) ) ( not ( = ?auto_866256 ?auto_866266 ) ) ( not ( = ?auto_866256 ?auto_866267 ) ) ( not ( = ?auto_866256 ?auto_866268 ) ) ( not ( = ?auto_866257 ?auto_866258 ) ) ( not ( = ?auto_866257 ?auto_866259 ) ) ( not ( = ?auto_866257 ?auto_866260 ) ) ( not ( = ?auto_866257 ?auto_866261 ) ) ( not ( = ?auto_866257 ?auto_866262 ) ) ( not ( = ?auto_866257 ?auto_866263 ) ) ( not ( = ?auto_866257 ?auto_866264 ) ) ( not ( = ?auto_866257 ?auto_866265 ) ) ( not ( = ?auto_866257 ?auto_866266 ) ) ( not ( = ?auto_866257 ?auto_866267 ) ) ( not ( = ?auto_866257 ?auto_866268 ) ) ( not ( = ?auto_866258 ?auto_866259 ) ) ( not ( = ?auto_866258 ?auto_866260 ) ) ( not ( = ?auto_866258 ?auto_866261 ) ) ( not ( = ?auto_866258 ?auto_866262 ) ) ( not ( = ?auto_866258 ?auto_866263 ) ) ( not ( = ?auto_866258 ?auto_866264 ) ) ( not ( = ?auto_866258 ?auto_866265 ) ) ( not ( = ?auto_866258 ?auto_866266 ) ) ( not ( = ?auto_866258 ?auto_866267 ) ) ( not ( = ?auto_866258 ?auto_866268 ) ) ( not ( = ?auto_866259 ?auto_866260 ) ) ( not ( = ?auto_866259 ?auto_866261 ) ) ( not ( = ?auto_866259 ?auto_866262 ) ) ( not ( = ?auto_866259 ?auto_866263 ) ) ( not ( = ?auto_866259 ?auto_866264 ) ) ( not ( = ?auto_866259 ?auto_866265 ) ) ( not ( = ?auto_866259 ?auto_866266 ) ) ( not ( = ?auto_866259 ?auto_866267 ) ) ( not ( = ?auto_866259 ?auto_866268 ) ) ( not ( = ?auto_866260 ?auto_866261 ) ) ( not ( = ?auto_866260 ?auto_866262 ) ) ( not ( = ?auto_866260 ?auto_866263 ) ) ( not ( = ?auto_866260 ?auto_866264 ) ) ( not ( = ?auto_866260 ?auto_866265 ) ) ( not ( = ?auto_866260 ?auto_866266 ) ) ( not ( = ?auto_866260 ?auto_866267 ) ) ( not ( = ?auto_866260 ?auto_866268 ) ) ( not ( = ?auto_866261 ?auto_866262 ) ) ( not ( = ?auto_866261 ?auto_866263 ) ) ( not ( = ?auto_866261 ?auto_866264 ) ) ( not ( = ?auto_866261 ?auto_866265 ) ) ( not ( = ?auto_866261 ?auto_866266 ) ) ( not ( = ?auto_866261 ?auto_866267 ) ) ( not ( = ?auto_866261 ?auto_866268 ) ) ( not ( = ?auto_866262 ?auto_866263 ) ) ( not ( = ?auto_866262 ?auto_866264 ) ) ( not ( = ?auto_866262 ?auto_866265 ) ) ( not ( = ?auto_866262 ?auto_866266 ) ) ( not ( = ?auto_866262 ?auto_866267 ) ) ( not ( = ?auto_866262 ?auto_866268 ) ) ( not ( = ?auto_866263 ?auto_866264 ) ) ( not ( = ?auto_866263 ?auto_866265 ) ) ( not ( = ?auto_866263 ?auto_866266 ) ) ( not ( = ?auto_866263 ?auto_866267 ) ) ( not ( = ?auto_866263 ?auto_866268 ) ) ( not ( = ?auto_866264 ?auto_866265 ) ) ( not ( = ?auto_866264 ?auto_866266 ) ) ( not ( = ?auto_866264 ?auto_866267 ) ) ( not ( = ?auto_866264 ?auto_866268 ) ) ( not ( = ?auto_866265 ?auto_866266 ) ) ( not ( = ?auto_866265 ?auto_866267 ) ) ( not ( = ?auto_866265 ?auto_866268 ) ) ( not ( = ?auto_866266 ?auto_866267 ) ) ( not ( = ?auto_866266 ?auto_866268 ) ) ( not ( = ?auto_866267 ?auto_866268 ) ) ( ON ?auto_866266 ?auto_866267 ) ( ON ?auto_866265 ?auto_866266 ) ( ON ?auto_866264 ?auto_866265 ) ( ON ?auto_866263 ?auto_866264 ) ( ON ?auto_866262 ?auto_866263 ) ( ON ?auto_866261 ?auto_866262 ) ( ON ?auto_866260 ?auto_866261 ) ( ON ?auto_866259 ?auto_866260 ) ( ON ?auto_866258 ?auto_866259 ) ( ON ?auto_866257 ?auto_866258 ) ( ON ?auto_866256 ?auto_866257 ) ( ON ?auto_866255 ?auto_866256 ) ( CLEAR ?auto_866255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_866255 )
      ( MAKE-13PILE ?auto_866255 ?auto_866256 ?auto_866257 ?auto_866258 ?auto_866259 ?auto_866260 ?auto_866261 ?auto_866262 ?auto_866263 ?auto_866264 ?auto_866265 ?auto_866266 ?auto_866267 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866310 - BLOCK
      ?auto_866311 - BLOCK
      ?auto_866312 - BLOCK
      ?auto_866313 - BLOCK
      ?auto_866314 - BLOCK
      ?auto_866315 - BLOCK
      ?auto_866316 - BLOCK
      ?auto_866317 - BLOCK
      ?auto_866318 - BLOCK
      ?auto_866319 - BLOCK
      ?auto_866320 - BLOCK
      ?auto_866321 - BLOCK
      ?auto_866322 - BLOCK
      ?auto_866323 - BLOCK
    )
    :vars
    (
      ?auto_866324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_866322 ) ( ON ?auto_866323 ?auto_866324 ) ( CLEAR ?auto_866323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_866310 ) ( ON ?auto_866311 ?auto_866310 ) ( ON ?auto_866312 ?auto_866311 ) ( ON ?auto_866313 ?auto_866312 ) ( ON ?auto_866314 ?auto_866313 ) ( ON ?auto_866315 ?auto_866314 ) ( ON ?auto_866316 ?auto_866315 ) ( ON ?auto_866317 ?auto_866316 ) ( ON ?auto_866318 ?auto_866317 ) ( ON ?auto_866319 ?auto_866318 ) ( ON ?auto_866320 ?auto_866319 ) ( ON ?auto_866321 ?auto_866320 ) ( ON ?auto_866322 ?auto_866321 ) ( not ( = ?auto_866310 ?auto_866311 ) ) ( not ( = ?auto_866310 ?auto_866312 ) ) ( not ( = ?auto_866310 ?auto_866313 ) ) ( not ( = ?auto_866310 ?auto_866314 ) ) ( not ( = ?auto_866310 ?auto_866315 ) ) ( not ( = ?auto_866310 ?auto_866316 ) ) ( not ( = ?auto_866310 ?auto_866317 ) ) ( not ( = ?auto_866310 ?auto_866318 ) ) ( not ( = ?auto_866310 ?auto_866319 ) ) ( not ( = ?auto_866310 ?auto_866320 ) ) ( not ( = ?auto_866310 ?auto_866321 ) ) ( not ( = ?auto_866310 ?auto_866322 ) ) ( not ( = ?auto_866310 ?auto_866323 ) ) ( not ( = ?auto_866310 ?auto_866324 ) ) ( not ( = ?auto_866311 ?auto_866312 ) ) ( not ( = ?auto_866311 ?auto_866313 ) ) ( not ( = ?auto_866311 ?auto_866314 ) ) ( not ( = ?auto_866311 ?auto_866315 ) ) ( not ( = ?auto_866311 ?auto_866316 ) ) ( not ( = ?auto_866311 ?auto_866317 ) ) ( not ( = ?auto_866311 ?auto_866318 ) ) ( not ( = ?auto_866311 ?auto_866319 ) ) ( not ( = ?auto_866311 ?auto_866320 ) ) ( not ( = ?auto_866311 ?auto_866321 ) ) ( not ( = ?auto_866311 ?auto_866322 ) ) ( not ( = ?auto_866311 ?auto_866323 ) ) ( not ( = ?auto_866311 ?auto_866324 ) ) ( not ( = ?auto_866312 ?auto_866313 ) ) ( not ( = ?auto_866312 ?auto_866314 ) ) ( not ( = ?auto_866312 ?auto_866315 ) ) ( not ( = ?auto_866312 ?auto_866316 ) ) ( not ( = ?auto_866312 ?auto_866317 ) ) ( not ( = ?auto_866312 ?auto_866318 ) ) ( not ( = ?auto_866312 ?auto_866319 ) ) ( not ( = ?auto_866312 ?auto_866320 ) ) ( not ( = ?auto_866312 ?auto_866321 ) ) ( not ( = ?auto_866312 ?auto_866322 ) ) ( not ( = ?auto_866312 ?auto_866323 ) ) ( not ( = ?auto_866312 ?auto_866324 ) ) ( not ( = ?auto_866313 ?auto_866314 ) ) ( not ( = ?auto_866313 ?auto_866315 ) ) ( not ( = ?auto_866313 ?auto_866316 ) ) ( not ( = ?auto_866313 ?auto_866317 ) ) ( not ( = ?auto_866313 ?auto_866318 ) ) ( not ( = ?auto_866313 ?auto_866319 ) ) ( not ( = ?auto_866313 ?auto_866320 ) ) ( not ( = ?auto_866313 ?auto_866321 ) ) ( not ( = ?auto_866313 ?auto_866322 ) ) ( not ( = ?auto_866313 ?auto_866323 ) ) ( not ( = ?auto_866313 ?auto_866324 ) ) ( not ( = ?auto_866314 ?auto_866315 ) ) ( not ( = ?auto_866314 ?auto_866316 ) ) ( not ( = ?auto_866314 ?auto_866317 ) ) ( not ( = ?auto_866314 ?auto_866318 ) ) ( not ( = ?auto_866314 ?auto_866319 ) ) ( not ( = ?auto_866314 ?auto_866320 ) ) ( not ( = ?auto_866314 ?auto_866321 ) ) ( not ( = ?auto_866314 ?auto_866322 ) ) ( not ( = ?auto_866314 ?auto_866323 ) ) ( not ( = ?auto_866314 ?auto_866324 ) ) ( not ( = ?auto_866315 ?auto_866316 ) ) ( not ( = ?auto_866315 ?auto_866317 ) ) ( not ( = ?auto_866315 ?auto_866318 ) ) ( not ( = ?auto_866315 ?auto_866319 ) ) ( not ( = ?auto_866315 ?auto_866320 ) ) ( not ( = ?auto_866315 ?auto_866321 ) ) ( not ( = ?auto_866315 ?auto_866322 ) ) ( not ( = ?auto_866315 ?auto_866323 ) ) ( not ( = ?auto_866315 ?auto_866324 ) ) ( not ( = ?auto_866316 ?auto_866317 ) ) ( not ( = ?auto_866316 ?auto_866318 ) ) ( not ( = ?auto_866316 ?auto_866319 ) ) ( not ( = ?auto_866316 ?auto_866320 ) ) ( not ( = ?auto_866316 ?auto_866321 ) ) ( not ( = ?auto_866316 ?auto_866322 ) ) ( not ( = ?auto_866316 ?auto_866323 ) ) ( not ( = ?auto_866316 ?auto_866324 ) ) ( not ( = ?auto_866317 ?auto_866318 ) ) ( not ( = ?auto_866317 ?auto_866319 ) ) ( not ( = ?auto_866317 ?auto_866320 ) ) ( not ( = ?auto_866317 ?auto_866321 ) ) ( not ( = ?auto_866317 ?auto_866322 ) ) ( not ( = ?auto_866317 ?auto_866323 ) ) ( not ( = ?auto_866317 ?auto_866324 ) ) ( not ( = ?auto_866318 ?auto_866319 ) ) ( not ( = ?auto_866318 ?auto_866320 ) ) ( not ( = ?auto_866318 ?auto_866321 ) ) ( not ( = ?auto_866318 ?auto_866322 ) ) ( not ( = ?auto_866318 ?auto_866323 ) ) ( not ( = ?auto_866318 ?auto_866324 ) ) ( not ( = ?auto_866319 ?auto_866320 ) ) ( not ( = ?auto_866319 ?auto_866321 ) ) ( not ( = ?auto_866319 ?auto_866322 ) ) ( not ( = ?auto_866319 ?auto_866323 ) ) ( not ( = ?auto_866319 ?auto_866324 ) ) ( not ( = ?auto_866320 ?auto_866321 ) ) ( not ( = ?auto_866320 ?auto_866322 ) ) ( not ( = ?auto_866320 ?auto_866323 ) ) ( not ( = ?auto_866320 ?auto_866324 ) ) ( not ( = ?auto_866321 ?auto_866322 ) ) ( not ( = ?auto_866321 ?auto_866323 ) ) ( not ( = ?auto_866321 ?auto_866324 ) ) ( not ( = ?auto_866322 ?auto_866323 ) ) ( not ( = ?auto_866322 ?auto_866324 ) ) ( not ( = ?auto_866323 ?auto_866324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_866323 ?auto_866324 )
      ( !STACK ?auto_866323 ?auto_866322 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866368 - BLOCK
      ?auto_866369 - BLOCK
      ?auto_866370 - BLOCK
      ?auto_866371 - BLOCK
      ?auto_866372 - BLOCK
      ?auto_866373 - BLOCK
      ?auto_866374 - BLOCK
      ?auto_866375 - BLOCK
      ?auto_866376 - BLOCK
      ?auto_866377 - BLOCK
      ?auto_866378 - BLOCK
      ?auto_866379 - BLOCK
      ?auto_866380 - BLOCK
      ?auto_866381 - BLOCK
    )
    :vars
    (
      ?auto_866382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866381 ?auto_866382 ) ( ON-TABLE ?auto_866368 ) ( ON ?auto_866369 ?auto_866368 ) ( ON ?auto_866370 ?auto_866369 ) ( ON ?auto_866371 ?auto_866370 ) ( ON ?auto_866372 ?auto_866371 ) ( ON ?auto_866373 ?auto_866372 ) ( ON ?auto_866374 ?auto_866373 ) ( ON ?auto_866375 ?auto_866374 ) ( ON ?auto_866376 ?auto_866375 ) ( ON ?auto_866377 ?auto_866376 ) ( ON ?auto_866378 ?auto_866377 ) ( ON ?auto_866379 ?auto_866378 ) ( not ( = ?auto_866368 ?auto_866369 ) ) ( not ( = ?auto_866368 ?auto_866370 ) ) ( not ( = ?auto_866368 ?auto_866371 ) ) ( not ( = ?auto_866368 ?auto_866372 ) ) ( not ( = ?auto_866368 ?auto_866373 ) ) ( not ( = ?auto_866368 ?auto_866374 ) ) ( not ( = ?auto_866368 ?auto_866375 ) ) ( not ( = ?auto_866368 ?auto_866376 ) ) ( not ( = ?auto_866368 ?auto_866377 ) ) ( not ( = ?auto_866368 ?auto_866378 ) ) ( not ( = ?auto_866368 ?auto_866379 ) ) ( not ( = ?auto_866368 ?auto_866380 ) ) ( not ( = ?auto_866368 ?auto_866381 ) ) ( not ( = ?auto_866368 ?auto_866382 ) ) ( not ( = ?auto_866369 ?auto_866370 ) ) ( not ( = ?auto_866369 ?auto_866371 ) ) ( not ( = ?auto_866369 ?auto_866372 ) ) ( not ( = ?auto_866369 ?auto_866373 ) ) ( not ( = ?auto_866369 ?auto_866374 ) ) ( not ( = ?auto_866369 ?auto_866375 ) ) ( not ( = ?auto_866369 ?auto_866376 ) ) ( not ( = ?auto_866369 ?auto_866377 ) ) ( not ( = ?auto_866369 ?auto_866378 ) ) ( not ( = ?auto_866369 ?auto_866379 ) ) ( not ( = ?auto_866369 ?auto_866380 ) ) ( not ( = ?auto_866369 ?auto_866381 ) ) ( not ( = ?auto_866369 ?auto_866382 ) ) ( not ( = ?auto_866370 ?auto_866371 ) ) ( not ( = ?auto_866370 ?auto_866372 ) ) ( not ( = ?auto_866370 ?auto_866373 ) ) ( not ( = ?auto_866370 ?auto_866374 ) ) ( not ( = ?auto_866370 ?auto_866375 ) ) ( not ( = ?auto_866370 ?auto_866376 ) ) ( not ( = ?auto_866370 ?auto_866377 ) ) ( not ( = ?auto_866370 ?auto_866378 ) ) ( not ( = ?auto_866370 ?auto_866379 ) ) ( not ( = ?auto_866370 ?auto_866380 ) ) ( not ( = ?auto_866370 ?auto_866381 ) ) ( not ( = ?auto_866370 ?auto_866382 ) ) ( not ( = ?auto_866371 ?auto_866372 ) ) ( not ( = ?auto_866371 ?auto_866373 ) ) ( not ( = ?auto_866371 ?auto_866374 ) ) ( not ( = ?auto_866371 ?auto_866375 ) ) ( not ( = ?auto_866371 ?auto_866376 ) ) ( not ( = ?auto_866371 ?auto_866377 ) ) ( not ( = ?auto_866371 ?auto_866378 ) ) ( not ( = ?auto_866371 ?auto_866379 ) ) ( not ( = ?auto_866371 ?auto_866380 ) ) ( not ( = ?auto_866371 ?auto_866381 ) ) ( not ( = ?auto_866371 ?auto_866382 ) ) ( not ( = ?auto_866372 ?auto_866373 ) ) ( not ( = ?auto_866372 ?auto_866374 ) ) ( not ( = ?auto_866372 ?auto_866375 ) ) ( not ( = ?auto_866372 ?auto_866376 ) ) ( not ( = ?auto_866372 ?auto_866377 ) ) ( not ( = ?auto_866372 ?auto_866378 ) ) ( not ( = ?auto_866372 ?auto_866379 ) ) ( not ( = ?auto_866372 ?auto_866380 ) ) ( not ( = ?auto_866372 ?auto_866381 ) ) ( not ( = ?auto_866372 ?auto_866382 ) ) ( not ( = ?auto_866373 ?auto_866374 ) ) ( not ( = ?auto_866373 ?auto_866375 ) ) ( not ( = ?auto_866373 ?auto_866376 ) ) ( not ( = ?auto_866373 ?auto_866377 ) ) ( not ( = ?auto_866373 ?auto_866378 ) ) ( not ( = ?auto_866373 ?auto_866379 ) ) ( not ( = ?auto_866373 ?auto_866380 ) ) ( not ( = ?auto_866373 ?auto_866381 ) ) ( not ( = ?auto_866373 ?auto_866382 ) ) ( not ( = ?auto_866374 ?auto_866375 ) ) ( not ( = ?auto_866374 ?auto_866376 ) ) ( not ( = ?auto_866374 ?auto_866377 ) ) ( not ( = ?auto_866374 ?auto_866378 ) ) ( not ( = ?auto_866374 ?auto_866379 ) ) ( not ( = ?auto_866374 ?auto_866380 ) ) ( not ( = ?auto_866374 ?auto_866381 ) ) ( not ( = ?auto_866374 ?auto_866382 ) ) ( not ( = ?auto_866375 ?auto_866376 ) ) ( not ( = ?auto_866375 ?auto_866377 ) ) ( not ( = ?auto_866375 ?auto_866378 ) ) ( not ( = ?auto_866375 ?auto_866379 ) ) ( not ( = ?auto_866375 ?auto_866380 ) ) ( not ( = ?auto_866375 ?auto_866381 ) ) ( not ( = ?auto_866375 ?auto_866382 ) ) ( not ( = ?auto_866376 ?auto_866377 ) ) ( not ( = ?auto_866376 ?auto_866378 ) ) ( not ( = ?auto_866376 ?auto_866379 ) ) ( not ( = ?auto_866376 ?auto_866380 ) ) ( not ( = ?auto_866376 ?auto_866381 ) ) ( not ( = ?auto_866376 ?auto_866382 ) ) ( not ( = ?auto_866377 ?auto_866378 ) ) ( not ( = ?auto_866377 ?auto_866379 ) ) ( not ( = ?auto_866377 ?auto_866380 ) ) ( not ( = ?auto_866377 ?auto_866381 ) ) ( not ( = ?auto_866377 ?auto_866382 ) ) ( not ( = ?auto_866378 ?auto_866379 ) ) ( not ( = ?auto_866378 ?auto_866380 ) ) ( not ( = ?auto_866378 ?auto_866381 ) ) ( not ( = ?auto_866378 ?auto_866382 ) ) ( not ( = ?auto_866379 ?auto_866380 ) ) ( not ( = ?auto_866379 ?auto_866381 ) ) ( not ( = ?auto_866379 ?auto_866382 ) ) ( not ( = ?auto_866380 ?auto_866381 ) ) ( not ( = ?auto_866380 ?auto_866382 ) ) ( not ( = ?auto_866381 ?auto_866382 ) ) ( CLEAR ?auto_866379 ) ( ON ?auto_866380 ?auto_866381 ) ( CLEAR ?auto_866380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_866368 ?auto_866369 ?auto_866370 ?auto_866371 ?auto_866372 ?auto_866373 ?auto_866374 ?auto_866375 ?auto_866376 ?auto_866377 ?auto_866378 ?auto_866379 ?auto_866380 )
      ( MAKE-14PILE ?auto_866368 ?auto_866369 ?auto_866370 ?auto_866371 ?auto_866372 ?auto_866373 ?auto_866374 ?auto_866375 ?auto_866376 ?auto_866377 ?auto_866378 ?auto_866379 ?auto_866380 ?auto_866381 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866426 - BLOCK
      ?auto_866427 - BLOCK
      ?auto_866428 - BLOCK
      ?auto_866429 - BLOCK
      ?auto_866430 - BLOCK
      ?auto_866431 - BLOCK
      ?auto_866432 - BLOCK
      ?auto_866433 - BLOCK
      ?auto_866434 - BLOCK
      ?auto_866435 - BLOCK
      ?auto_866436 - BLOCK
      ?auto_866437 - BLOCK
      ?auto_866438 - BLOCK
      ?auto_866439 - BLOCK
    )
    :vars
    (
      ?auto_866440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866439 ?auto_866440 ) ( ON-TABLE ?auto_866426 ) ( ON ?auto_866427 ?auto_866426 ) ( ON ?auto_866428 ?auto_866427 ) ( ON ?auto_866429 ?auto_866428 ) ( ON ?auto_866430 ?auto_866429 ) ( ON ?auto_866431 ?auto_866430 ) ( ON ?auto_866432 ?auto_866431 ) ( ON ?auto_866433 ?auto_866432 ) ( ON ?auto_866434 ?auto_866433 ) ( ON ?auto_866435 ?auto_866434 ) ( ON ?auto_866436 ?auto_866435 ) ( not ( = ?auto_866426 ?auto_866427 ) ) ( not ( = ?auto_866426 ?auto_866428 ) ) ( not ( = ?auto_866426 ?auto_866429 ) ) ( not ( = ?auto_866426 ?auto_866430 ) ) ( not ( = ?auto_866426 ?auto_866431 ) ) ( not ( = ?auto_866426 ?auto_866432 ) ) ( not ( = ?auto_866426 ?auto_866433 ) ) ( not ( = ?auto_866426 ?auto_866434 ) ) ( not ( = ?auto_866426 ?auto_866435 ) ) ( not ( = ?auto_866426 ?auto_866436 ) ) ( not ( = ?auto_866426 ?auto_866437 ) ) ( not ( = ?auto_866426 ?auto_866438 ) ) ( not ( = ?auto_866426 ?auto_866439 ) ) ( not ( = ?auto_866426 ?auto_866440 ) ) ( not ( = ?auto_866427 ?auto_866428 ) ) ( not ( = ?auto_866427 ?auto_866429 ) ) ( not ( = ?auto_866427 ?auto_866430 ) ) ( not ( = ?auto_866427 ?auto_866431 ) ) ( not ( = ?auto_866427 ?auto_866432 ) ) ( not ( = ?auto_866427 ?auto_866433 ) ) ( not ( = ?auto_866427 ?auto_866434 ) ) ( not ( = ?auto_866427 ?auto_866435 ) ) ( not ( = ?auto_866427 ?auto_866436 ) ) ( not ( = ?auto_866427 ?auto_866437 ) ) ( not ( = ?auto_866427 ?auto_866438 ) ) ( not ( = ?auto_866427 ?auto_866439 ) ) ( not ( = ?auto_866427 ?auto_866440 ) ) ( not ( = ?auto_866428 ?auto_866429 ) ) ( not ( = ?auto_866428 ?auto_866430 ) ) ( not ( = ?auto_866428 ?auto_866431 ) ) ( not ( = ?auto_866428 ?auto_866432 ) ) ( not ( = ?auto_866428 ?auto_866433 ) ) ( not ( = ?auto_866428 ?auto_866434 ) ) ( not ( = ?auto_866428 ?auto_866435 ) ) ( not ( = ?auto_866428 ?auto_866436 ) ) ( not ( = ?auto_866428 ?auto_866437 ) ) ( not ( = ?auto_866428 ?auto_866438 ) ) ( not ( = ?auto_866428 ?auto_866439 ) ) ( not ( = ?auto_866428 ?auto_866440 ) ) ( not ( = ?auto_866429 ?auto_866430 ) ) ( not ( = ?auto_866429 ?auto_866431 ) ) ( not ( = ?auto_866429 ?auto_866432 ) ) ( not ( = ?auto_866429 ?auto_866433 ) ) ( not ( = ?auto_866429 ?auto_866434 ) ) ( not ( = ?auto_866429 ?auto_866435 ) ) ( not ( = ?auto_866429 ?auto_866436 ) ) ( not ( = ?auto_866429 ?auto_866437 ) ) ( not ( = ?auto_866429 ?auto_866438 ) ) ( not ( = ?auto_866429 ?auto_866439 ) ) ( not ( = ?auto_866429 ?auto_866440 ) ) ( not ( = ?auto_866430 ?auto_866431 ) ) ( not ( = ?auto_866430 ?auto_866432 ) ) ( not ( = ?auto_866430 ?auto_866433 ) ) ( not ( = ?auto_866430 ?auto_866434 ) ) ( not ( = ?auto_866430 ?auto_866435 ) ) ( not ( = ?auto_866430 ?auto_866436 ) ) ( not ( = ?auto_866430 ?auto_866437 ) ) ( not ( = ?auto_866430 ?auto_866438 ) ) ( not ( = ?auto_866430 ?auto_866439 ) ) ( not ( = ?auto_866430 ?auto_866440 ) ) ( not ( = ?auto_866431 ?auto_866432 ) ) ( not ( = ?auto_866431 ?auto_866433 ) ) ( not ( = ?auto_866431 ?auto_866434 ) ) ( not ( = ?auto_866431 ?auto_866435 ) ) ( not ( = ?auto_866431 ?auto_866436 ) ) ( not ( = ?auto_866431 ?auto_866437 ) ) ( not ( = ?auto_866431 ?auto_866438 ) ) ( not ( = ?auto_866431 ?auto_866439 ) ) ( not ( = ?auto_866431 ?auto_866440 ) ) ( not ( = ?auto_866432 ?auto_866433 ) ) ( not ( = ?auto_866432 ?auto_866434 ) ) ( not ( = ?auto_866432 ?auto_866435 ) ) ( not ( = ?auto_866432 ?auto_866436 ) ) ( not ( = ?auto_866432 ?auto_866437 ) ) ( not ( = ?auto_866432 ?auto_866438 ) ) ( not ( = ?auto_866432 ?auto_866439 ) ) ( not ( = ?auto_866432 ?auto_866440 ) ) ( not ( = ?auto_866433 ?auto_866434 ) ) ( not ( = ?auto_866433 ?auto_866435 ) ) ( not ( = ?auto_866433 ?auto_866436 ) ) ( not ( = ?auto_866433 ?auto_866437 ) ) ( not ( = ?auto_866433 ?auto_866438 ) ) ( not ( = ?auto_866433 ?auto_866439 ) ) ( not ( = ?auto_866433 ?auto_866440 ) ) ( not ( = ?auto_866434 ?auto_866435 ) ) ( not ( = ?auto_866434 ?auto_866436 ) ) ( not ( = ?auto_866434 ?auto_866437 ) ) ( not ( = ?auto_866434 ?auto_866438 ) ) ( not ( = ?auto_866434 ?auto_866439 ) ) ( not ( = ?auto_866434 ?auto_866440 ) ) ( not ( = ?auto_866435 ?auto_866436 ) ) ( not ( = ?auto_866435 ?auto_866437 ) ) ( not ( = ?auto_866435 ?auto_866438 ) ) ( not ( = ?auto_866435 ?auto_866439 ) ) ( not ( = ?auto_866435 ?auto_866440 ) ) ( not ( = ?auto_866436 ?auto_866437 ) ) ( not ( = ?auto_866436 ?auto_866438 ) ) ( not ( = ?auto_866436 ?auto_866439 ) ) ( not ( = ?auto_866436 ?auto_866440 ) ) ( not ( = ?auto_866437 ?auto_866438 ) ) ( not ( = ?auto_866437 ?auto_866439 ) ) ( not ( = ?auto_866437 ?auto_866440 ) ) ( not ( = ?auto_866438 ?auto_866439 ) ) ( not ( = ?auto_866438 ?auto_866440 ) ) ( not ( = ?auto_866439 ?auto_866440 ) ) ( ON ?auto_866438 ?auto_866439 ) ( CLEAR ?auto_866436 ) ( ON ?auto_866437 ?auto_866438 ) ( CLEAR ?auto_866437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_866426 ?auto_866427 ?auto_866428 ?auto_866429 ?auto_866430 ?auto_866431 ?auto_866432 ?auto_866433 ?auto_866434 ?auto_866435 ?auto_866436 ?auto_866437 )
      ( MAKE-14PILE ?auto_866426 ?auto_866427 ?auto_866428 ?auto_866429 ?auto_866430 ?auto_866431 ?auto_866432 ?auto_866433 ?auto_866434 ?auto_866435 ?auto_866436 ?auto_866437 ?auto_866438 ?auto_866439 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866484 - BLOCK
      ?auto_866485 - BLOCK
      ?auto_866486 - BLOCK
      ?auto_866487 - BLOCK
      ?auto_866488 - BLOCK
      ?auto_866489 - BLOCK
      ?auto_866490 - BLOCK
      ?auto_866491 - BLOCK
      ?auto_866492 - BLOCK
      ?auto_866493 - BLOCK
      ?auto_866494 - BLOCK
      ?auto_866495 - BLOCK
      ?auto_866496 - BLOCK
      ?auto_866497 - BLOCK
    )
    :vars
    (
      ?auto_866498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866497 ?auto_866498 ) ( ON-TABLE ?auto_866484 ) ( ON ?auto_866485 ?auto_866484 ) ( ON ?auto_866486 ?auto_866485 ) ( ON ?auto_866487 ?auto_866486 ) ( ON ?auto_866488 ?auto_866487 ) ( ON ?auto_866489 ?auto_866488 ) ( ON ?auto_866490 ?auto_866489 ) ( ON ?auto_866491 ?auto_866490 ) ( ON ?auto_866492 ?auto_866491 ) ( ON ?auto_866493 ?auto_866492 ) ( not ( = ?auto_866484 ?auto_866485 ) ) ( not ( = ?auto_866484 ?auto_866486 ) ) ( not ( = ?auto_866484 ?auto_866487 ) ) ( not ( = ?auto_866484 ?auto_866488 ) ) ( not ( = ?auto_866484 ?auto_866489 ) ) ( not ( = ?auto_866484 ?auto_866490 ) ) ( not ( = ?auto_866484 ?auto_866491 ) ) ( not ( = ?auto_866484 ?auto_866492 ) ) ( not ( = ?auto_866484 ?auto_866493 ) ) ( not ( = ?auto_866484 ?auto_866494 ) ) ( not ( = ?auto_866484 ?auto_866495 ) ) ( not ( = ?auto_866484 ?auto_866496 ) ) ( not ( = ?auto_866484 ?auto_866497 ) ) ( not ( = ?auto_866484 ?auto_866498 ) ) ( not ( = ?auto_866485 ?auto_866486 ) ) ( not ( = ?auto_866485 ?auto_866487 ) ) ( not ( = ?auto_866485 ?auto_866488 ) ) ( not ( = ?auto_866485 ?auto_866489 ) ) ( not ( = ?auto_866485 ?auto_866490 ) ) ( not ( = ?auto_866485 ?auto_866491 ) ) ( not ( = ?auto_866485 ?auto_866492 ) ) ( not ( = ?auto_866485 ?auto_866493 ) ) ( not ( = ?auto_866485 ?auto_866494 ) ) ( not ( = ?auto_866485 ?auto_866495 ) ) ( not ( = ?auto_866485 ?auto_866496 ) ) ( not ( = ?auto_866485 ?auto_866497 ) ) ( not ( = ?auto_866485 ?auto_866498 ) ) ( not ( = ?auto_866486 ?auto_866487 ) ) ( not ( = ?auto_866486 ?auto_866488 ) ) ( not ( = ?auto_866486 ?auto_866489 ) ) ( not ( = ?auto_866486 ?auto_866490 ) ) ( not ( = ?auto_866486 ?auto_866491 ) ) ( not ( = ?auto_866486 ?auto_866492 ) ) ( not ( = ?auto_866486 ?auto_866493 ) ) ( not ( = ?auto_866486 ?auto_866494 ) ) ( not ( = ?auto_866486 ?auto_866495 ) ) ( not ( = ?auto_866486 ?auto_866496 ) ) ( not ( = ?auto_866486 ?auto_866497 ) ) ( not ( = ?auto_866486 ?auto_866498 ) ) ( not ( = ?auto_866487 ?auto_866488 ) ) ( not ( = ?auto_866487 ?auto_866489 ) ) ( not ( = ?auto_866487 ?auto_866490 ) ) ( not ( = ?auto_866487 ?auto_866491 ) ) ( not ( = ?auto_866487 ?auto_866492 ) ) ( not ( = ?auto_866487 ?auto_866493 ) ) ( not ( = ?auto_866487 ?auto_866494 ) ) ( not ( = ?auto_866487 ?auto_866495 ) ) ( not ( = ?auto_866487 ?auto_866496 ) ) ( not ( = ?auto_866487 ?auto_866497 ) ) ( not ( = ?auto_866487 ?auto_866498 ) ) ( not ( = ?auto_866488 ?auto_866489 ) ) ( not ( = ?auto_866488 ?auto_866490 ) ) ( not ( = ?auto_866488 ?auto_866491 ) ) ( not ( = ?auto_866488 ?auto_866492 ) ) ( not ( = ?auto_866488 ?auto_866493 ) ) ( not ( = ?auto_866488 ?auto_866494 ) ) ( not ( = ?auto_866488 ?auto_866495 ) ) ( not ( = ?auto_866488 ?auto_866496 ) ) ( not ( = ?auto_866488 ?auto_866497 ) ) ( not ( = ?auto_866488 ?auto_866498 ) ) ( not ( = ?auto_866489 ?auto_866490 ) ) ( not ( = ?auto_866489 ?auto_866491 ) ) ( not ( = ?auto_866489 ?auto_866492 ) ) ( not ( = ?auto_866489 ?auto_866493 ) ) ( not ( = ?auto_866489 ?auto_866494 ) ) ( not ( = ?auto_866489 ?auto_866495 ) ) ( not ( = ?auto_866489 ?auto_866496 ) ) ( not ( = ?auto_866489 ?auto_866497 ) ) ( not ( = ?auto_866489 ?auto_866498 ) ) ( not ( = ?auto_866490 ?auto_866491 ) ) ( not ( = ?auto_866490 ?auto_866492 ) ) ( not ( = ?auto_866490 ?auto_866493 ) ) ( not ( = ?auto_866490 ?auto_866494 ) ) ( not ( = ?auto_866490 ?auto_866495 ) ) ( not ( = ?auto_866490 ?auto_866496 ) ) ( not ( = ?auto_866490 ?auto_866497 ) ) ( not ( = ?auto_866490 ?auto_866498 ) ) ( not ( = ?auto_866491 ?auto_866492 ) ) ( not ( = ?auto_866491 ?auto_866493 ) ) ( not ( = ?auto_866491 ?auto_866494 ) ) ( not ( = ?auto_866491 ?auto_866495 ) ) ( not ( = ?auto_866491 ?auto_866496 ) ) ( not ( = ?auto_866491 ?auto_866497 ) ) ( not ( = ?auto_866491 ?auto_866498 ) ) ( not ( = ?auto_866492 ?auto_866493 ) ) ( not ( = ?auto_866492 ?auto_866494 ) ) ( not ( = ?auto_866492 ?auto_866495 ) ) ( not ( = ?auto_866492 ?auto_866496 ) ) ( not ( = ?auto_866492 ?auto_866497 ) ) ( not ( = ?auto_866492 ?auto_866498 ) ) ( not ( = ?auto_866493 ?auto_866494 ) ) ( not ( = ?auto_866493 ?auto_866495 ) ) ( not ( = ?auto_866493 ?auto_866496 ) ) ( not ( = ?auto_866493 ?auto_866497 ) ) ( not ( = ?auto_866493 ?auto_866498 ) ) ( not ( = ?auto_866494 ?auto_866495 ) ) ( not ( = ?auto_866494 ?auto_866496 ) ) ( not ( = ?auto_866494 ?auto_866497 ) ) ( not ( = ?auto_866494 ?auto_866498 ) ) ( not ( = ?auto_866495 ?auto_866496 ) ) ( not ( = ?auto_866495 ?auto_866497 ) ) ( not ( = ?auto_866495 ?auto_866498 ) ) ( not ( = ?auto_866496 ?auto_866497 ) ) ( not ( = ?auto_866496 ?auto_866498 ) ) ( not ( = ?auto_866497 ?auto_866498 ) ) ( ON ?auto_866496 ?auto_866497 ) ( ON ?auto_866495 ?auto_866496 ) ( CLEAR ?auto_866493 ) ( ON ?auto_866494 ?auto_866495 ) ( CLEAR ?auto_866494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_866484 ?auto_866485 ?auto_866486 ?auto_866487 ?auto_866488 ?auto_866489 ?auto_866490 ?auto_866491 ?auto_866492 ?auto_866493 ?auto_866494 )
      ( MAKE-14PILE ?auto_866484 ?auto_866485 ?auto_866486 ?auto_866487 ?auto_866488 ?auto_866489 ?auto_866490 ?auto_866491 ?auto_866492 ?auto_866493 ?auto_866494 ?auto_866495 ?auto_866496 ?auto_866497 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866542 - BLOCK
      ?auto_866543 - BLOCK
      ?auto_866544 - BLOCK
      ?auto_866545 - BLOCK
      ?auto_866546 - BLOCK
      ?auto_866547 - BLOCK
      ?auto_866548 - BLOCK
      ?auto_866549 - BLOCK
      ?auto_866550 - BLOCK
      ?auto_866551 - BLOCK
      ?auto_866552 - BLOCK
      ?auto_866553 - BLOCK
      ?auto_866554 - BLOCK
      ?auto_866555 - BLOCK
    )
    :vars
    (
      ?auto_866556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866555 ?auto_866556 ) ( ON-TABLE ?auto_866542 ) ( ON ?auto_866543 ?auto_866542 ) ( ON ?auto_866544 ?auto_866543 ) ( ON ?auto_866545 ?auto_866544 ) ( ON ?auto_866546 ?auto_866545 ) ( ON ?auto_866547 ?auto_866546 ) ( ON ?auto_866548 ?auto_866547 ) ( ON ?auto_866549 ?auto_866548 ) ( ON ?auto_866550 ?auto_866549 ) ( not ( = ?auto_866542 ?auto_866543 ) ) ( not ( = ?auto_866542 ?auto_866544 ) ) ( not ( = ?auto_866542 ?auto_866545 ) ) ( not ( = ?auto_866542 ?auto_866546 ) ) ( not ( = ?auto_866542 ?auto_866547 ) ) ( not ( = ?auto_866542 ?auto_866548 ) ) ( not ( = ?auto_866542 ?auto_866549 ) ) ( not ( = ?auto_866542 ?auto_866550 ) ) ( not ( = ?auto_866542 ?auto_866551 ) ) ( not ( = ?auto_866542 ?auto_866552 ) ) ( not ( = ?auto_866542 ?auto_866553 ) ) ( not ( = ?auto_866542 ?auto_866554 ) ) ( not ( = ?auto_866542 ?auto_866555 ) ) ( not ( = ?auto_866542 ?auto_866556 ) ) ( not ( = ?auto_866543 ?auto_866544 ) ) ( not ( = ?auto_866543 ?auto_866545 ) ) ( not ( = ?auto_866543 ?auto_866546 ) ) ( not ( = ?auto_866543 ?auto_866547 ) ) ( not ( = ?auto_866543 ?auto_866548 ) ) ( not ( = ?auto_866543 ?auto_866549 ) ) ( not ( = ?auto_866543 ?auto_866550 ) ) ( not ( = ?auto_866543 ?auto_866551 ) ) ( not ( = ?auto_866543 ?auto_866552 ) ) ( not ( = ?auto_866543 ?auto_866553 ) ) ( not ( = ?auto_866543 ?auto_866554 ) ) ( not ( = ?auto_866543 ?auto_866555 ) ) ( not ( = ?auto_866543 ?auto_866556 ) ) ( not ( = ?auto_866544 ?auto_866545 ) ) ( not ( = ?auto_866544 ?auto_866546 ) ) ( not ( = ?auto_866544 ?auto_866547 ) ) ( not ( = ?auto_866544 ?auto_866548 ) ) ( not ( = ?auto_866544 ?auto_866549 ) ) ( not ( = ?auto_866544 ?auto_866550 ) ) ( not ( = ?auto_866544 ?auto_866551 ) ) ( not ( = ?auto_866544 ?auto_866552 ) ) ( not ( = ?auto_866544 ?auto_866553 ) ) ( not ( = ?auto_866544 ?auto_866554 ) ) ( not ( = ?auto_866544 ?auto_866555 ) ) ( not ( = ?auto_866544 ?auto_866556 ) ) ( not ( = ?auto_866545 ?auto_866546 ) ) ( not ( = ?auto_866545 ?auto_866547 ) ) ( not ( = ?auto_866545 ?auto_866548 ) ) ( not ( = ?auto_866545 ?auto_866549 ) ) ( not ( = ?auto_866545 ?auto_866550 ) ) ( not ( = ?auto_866545 ?auto_866551 ) ) ( not ( = ?auto_866545 ?auto_866552 ) ) ( not ( = ?auto_866545 ?auto_866553 ) ) ( not ( = ?auto_866545 ?auto_866554 ) ) ( not ( = ?auto_866545 ?auto_866555 ) ) ( not ( = ?auto_866545 ?auto_866556 ) ) ( not ( = ?auto_866546 ?auto_866547 ) ) ( not ( = ?auto_866546 ?auto_866548 ) ) ( not ( = ?auto_866546 ?auto_866549 ) ) ( not ( = ?auto_866546 ?auto_866550 ) ) ( not ( = ?auto_866546 ?auto_866551 ) ) ( not ( = ?auto_866546 ?auto_866552 ) ) ( not ( = ?auto_866546 ?auto_866553 ) ) ( not ( = ?auto_866546 ?auto_866554 ) ) ( not ( = ?auto_866546 ?auto_866555 ) ) ( not ( = ?auto_866546 ?auto_866556 ) ) ( not ( = ?auto_866547 ?auto_866548 ) ) ( not ( = ?auto_866547 ?auto_866549 ) ) ( not ( = ?auto_866547 ?auto_866550 ) ) ( not ( = ?auto_866547 ?auto_866551 ) ) ( not ( = ?auto_866547 ?auto_866552 ) ) ( not ( = ?auto_866547 ?auto_866553 ) ) ( not ( = ?auto_866547 ?auto_866554 ) ) ( not ( = ?auto_866547 ?auto_866555 ) ) ( not ( = ?auto_866547 ?auto_866556 ) ) ( not ( = ?auto_866548 ?auto_866549 ) ) ( not ( = ?auto_866548 ?auto_866550 ) ) ( not ( = ?auto_866548 ?auto_866551 ) ) ( not ( = ?auto_866548 ?auto_866552 ) ) ( not ( = ?auto_866548 ?auto_866553 ) ) ( not ( = ?auto_866548 ?auto_866554 ) ) ( not ( = ?auto_866548 ?auto_866555 ) ) ( not ( = ?auto_866548 ?auto_866556 ) ) ( not ( = ?auto_866549 ?auto_866550 ) ) ( not ( = ?auto_866549 ?auto_866551 ) ) ( not ( = ?auto_866549 ?auto_866552 ) ) ( not ( = ?auto_866549 ?auto_866553 ) ) ( not ( = ?auto_866549 ?auto_866554 ) ) ( not ( = ?auto_866549 ?auto_866555 ) ) ( not ( = ?auto_866549 ?auto_866556 ) ) ( not ( = ?auto_866550 ?auto_866551 ) ) ( not ( = ?auto_866550 ?auto_866552 ) ) ( not ( = ?auto_866550 ?auto_866553 ) ) ( not ( = ?auto_866550 ?auto_866554 ) ) ( not ( = ?auto_866550 ?auto_866555 ) ) ( not ( = ?auto_866550 ?auto_866556 ) ) ( not ( = ?auto_866551 ?auto_866552 ) ) ( not ( = ?auto_866551 ?auto_866553 ) ) ( not ( = ?auto_866551 ?auto_866554 ) ) ( not ( = ?auto_866551 ?auto_866555 ) ) ( not ( = ?auto_866551 ?auto_866556 ) ) ( not ( = ?auto_866552 ?auto_866553 ) ) ( not ( = ?auto_866552 ?auto_866554 ) ) ( not ( = ?auto_866552 ?auto_866555 ) ) ( not ( = ?auto_866552 ?auto_866556 ) ) ( not ( = ?auto_866553 ?auto_866554 ) ) ( not ( = ?auto_866553 ?auto_866555 ) ) ( not ( = ?auto_866553 ?auto_866556 ) ) ( not ( = ?auto_866554 ?auto_866555 ) ) ( not ( = ?auto_866554 ?auto_866556 ) ) ( not ( = ?auto_866555 ?auto_866556 ) ) ( ON ?auto_866554 ?auto_866555 ) ( ON ?auto_866553 ?auto_866554 ) ( ON ?auto_866552 ?auto_866553 ) ( CLEAR ?auto_866550 ) ( ON ?auto_866551 ?auto_866552 ) ( CLEAR ?auto_866551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_866542 ?auto_866543 ?auto_866544 ?auto_866545 ?auto_866546 ?auto_866547 ?auto_866548 ?auto_866549 ?auto_866550 ?auto_866551 )
      ( MAKE-14PILE ?auto_866542 ?auto_866543 ?auto_866544 ?auto_866545 ?auto_866546 ?auto_866547 ?auto_866548 ?auto_866549 ?auto_866550 ?auto_866551 ?auto_866552 ?auto_866553 ?auto_866554 ?auto_866555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866600 - BLOCK
      ?auto_866601 - BLOCK
      ?auto_866602 - BLOCK
      ?auto_866603 - BLOCK
      ?auto_866604 - BLOCK
      ?auto_866605 - BLOCK
      ?auto_866606 - BLOCK
      ?auto_866607 - BLOCK
      ?auto_866608 - BLOCK
      ?auto_866609 - BLOCK
      ?auto_866610 - BLOCK
      ?auto_866611 - BLOCK
      ?auto_866612 - BLOCK
      ?auto_866613 - BLOCK
    )
    :vars
    (
      ?auto_866614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866613 ?auto_866614 ) ( ON-TABLE ?auto_866600 ) ( ON ?auto_866601 ?auto_866600 ) ( ON ?auto_866602 ?auto_866601 ) ( ON ?auto_866603 ?auto_866602 ) ( ON ?auto_866604 ?auto_866603 ) ( ON ?auto_866605 ?auto_866604 ) ( ON ?auto_866606 ?auto_866605 ) ( ON ?auto_866607 ?auto_866606 ) ( not ( = ?auto_866600 ?auto_866601 ) ) ( not ( = ?auto_866600 ?auto_866602 ) ) ( not ( = ?auto_866600 ?auto_866603 ) ) ( not ( = ?auto_866600 ?auto_866604 ) ) ( not ( = ?auto_866600 ?auto_866605 ) ) ( not ( = ?auto_866600 ?auto_866606 ) ) ( not ( = ?auto_866600 ?auto_866607 ) ) ( not ( = ?auto_866600 ?auto_866608 ) ) ( not ( = ?auto_866600 ?auto_866609 ) ) ( not ( = ?auto_866600 ?auto_866610 ) ) ( not ( = ?auto_866600 ?auto_866611 ) ) ( not ( = ?auto_866600 ?auto_866612 ) ) ( not ( = ?auto_866600 ?auto_866613 ) ) ( not ( = ?auto_866600 ?auto_866614 ) ) ( not ( = ?auto_866601 ?auto_866602 ) ) ( not ( = ?auto_866601 ?auto_866603 ) ) ( not ( = ?auto_866601 ?auto_866604 ) ) ( not ( = ?auto_866601 ?auto_866605 ) ) ( not ( = ?auto_866601 ?auto_866606 ) ) ( not ( = ?auto_866601 ?auto_866607 ) ) ( not ( = ?auto_866601 ?auto_866608 ) ) ( not ( = ?auto_866601 ?auto_866609 ) ) ( not ( = ?auto_866601 ?auto_866610 ) ) ( not ( = ?auto_866601 ?auto_866611 ) ) ( not ( = ?auto_866601 ?auto_866612 ) ) ( not ( = ?auto_866601 ?auto_866613 ) ) ( not ( = ?auto_866601 ?auto_866614 ) ) ( not ( = ?auto_866602 ?auto_866603 ) ) ( not ( = ?auto_866602 ?auto_866604 ) ) ( not ( = ?auto_866602 ?auto_866605 ) ) ( not ( = ?auto_866602 ?auto_866606 ) ) ( not ( = ?auto_866602 ?auto_866607 ) ) ( not ( = ?auto_866602 ?auto_866608 ) ) ( not ( = ?auto_866602 ?auto_866609 ) ) ( not ( = ?auto_866602 ?auto_866610 ) ) ( not ( = ?auto_866602 ?auto_866611 ) ) ( not ( = ?auto_866602 ?auto_866612 ) ) ( not ( = ?auto_866602 ?auto_866613 ) ) ( not ( = ?auto_866602 ?auto_866614 ) ) ( not ( = ?auto_866603 ?auto_866604 ) ) ( not ( = ?auto_866603 ?auto_866605 ) ) ( not ( = ?auto_866603 ?auto_866606 ) ) ( not ( = ?auto_866603 ?auto_866607 ) ) ( not ( = ?auto_866603 ?auto_866608 ) ) ( not ( = ?auto_866603 ?auto_866609 ) ) ( not ( = ?auto_866603 ?auto_866610 ) ) ( not ( = ?auto_866603 ?auto_866611 ) ) ( not ( = ?auto_866603 ?auto_866612 ) ) ( not ( = ?auto_866603 ?auto_866613 ) ) ( not ( = ?auto_866603 ?auto_866614 ) ) ( not ( = ?auto_866604 ?auto_866605 ) ) ( not ( = ?auto_866604 ?auto_866606 ) ) ( not ( = ?auto_866604 ?auto_866607 ) ) ( not ( = ?auto_866604 ?auto_866608 ) ) ( not ( = ?auto_866604 ?auto_866609 ) ) ( not ( = ?auto_866604 ?auto_866610 ) ) ( not ( = ?auto_866604 ?auto_866611 ) ) ( not ( = ?auto_866604 ?auto_866612 ) ) ( not ( = ?auto_866604 ?auto_866613 ) ) ( not ( = ?auto_866604 ?auto_866614 ) ) ( not ( = ?auto_866605 ?auto_866606 ) ) ( not ( = ?auto_866605 ?auto_866607 ) ) ( not ( = ?auto_866605 ?auto_866608 ) ) ( not ( = ?auto_866605 ?auto_866609 ) ) ( not ( = ?auto_866605 ?auto_866610 ) ) ( not ( = ?auto_866605 ?auto_866611 ) ) ( not ( = ?auto_866605 ?auto_866612 ) ) ( not ( = ?auto_866605 ?auto_866613 ) ) ( not ( = ?auto_866605 ?auto_866614 ) ) ( not ( = ?auto_866606 ?auto_866607 ) ) ( not ( = ?auto_866606 ?auto_866608 ) ) ( not ( = ?auto_866606 ?auto_866609 ) ) ( not ( = ?auto_866606 ?auto_866610 ) ) ( not ( = ?auto_866606 ?auto_866611 ) ) ( not ( = ?auto_866606 ?auto_866612 ) ) ( not ( = ?auto_866606 ?auto_866613 ) ) ( not ( = ?auto_866606 ?auto_866614 ) ) ( not ( = ?auto_866607 ?auto_866608 ) ) ( not ( = ?auto_866607 ?auto_866609 ) ) ( not ( = ?auto_866607 ?auto_866610 ) ) ( not ( = ?auto_866607 ?auto_866611 ) ) ( not ( = ?auto_866607 ?auto_866612 ) ) ( not ( = ?auto_866607 ?auto_866613 ) ) ( not ( = ?auto_866607 ?auto_866614 ) ) ( not ( = ?auto_866608 ?auto_866609 ) ) ( not ( = ?auto_866608 ?auto_866610 ) ) ( not ( = ?auto_866608 ?auto_866611 ) ) ( not ( = ?auto_866608 ?auto_866612 ) ) ( not ( = ?auto_866608 ?auto_866613 ) ) ( not ( = ?auto_866608 ?auto_866614 ) ) ( not ( = ?auto_866609 ?auto_866610 ) ) ( not ( = ?auto_866609 ?auto_866611 ) ) ( not ( = ?auto_866609 ?auto_866612 ) ) ( not ( = ?auto_866609 ?auto_866613 ) ) ( not ( = ?auto_866609 ?auto_866614 ) ) ( not ( = ?auto_866610 ?auto_866611 ) ) ( not ( = ?auto_866610 ?auto_866612 ) ) ( not ( = ?auto_866610 ?auto_866613 ) ) ( not ( = ?auto_866610 ?auto_866614 ) ) ( not ( = ?auto_866611 ?auto_866612 ) ) ( not ( = ?auto_866611 ?auto_866613 ) ) ( not ( = ?auto_866611 ?auto_866614 ) ) ( not ( = ?auto_866612 ?auto_866613 ) ) ( not ( = ?auto_866612 ?auto_866614 ) ) ( not ( = ?auto_866613 ?auto_866614 ) ) ( ON ?auto_866612 ?auto_866613 ) ( ON ?auto_866611 ?auto_866612 ) ( ON ?auto_866610 ?auto_866611 ) ( ON ?auto_866609 ?auto_866610 ) ( CLEAR ?auto_866607 ) ( ON ?auto_866608 ?auto_866609 ) ( CLEAR ?auto_866608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_866600 ?auto_866601 ?auto_866602 ?auto_866603 ?auto_866604 ?auto_866605 ?auto_866606 ?auto_866607 ?auto_866608 )
      ( MAKE-14PILE ?auto_866600 ?auto_866601 ?auto_866602 ?auto_866603 ?auto_866604 ?auto_866605 ?auto_866606 ?auto_866607 ?auto_866608 ?auto_866609 ?auto_866610 ?auto_866611 ?auto_866612 ?auto_866613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866658 - BLOCK
      ?auto_866659 - BLOCK
      ?auto_866660 - BLOCK
      ?auto_866661 - BLOCK
      ?auto_866662 - BLOCK
      ?auto_866663 - BLOCK
      ?auto_866664 - BLOCK
      ?auto_866665 - BLOCK
      ?auto_866666 - BLOCK
      ?auto_866667 - BLOCK
      ?auto_866668 - BLOCK
      ?auto_866669 - BLOCK
      ?auto_866670 - BLOCK
      ?auto_866671 - BLOCK
    )
    :vars
    (
      ?auto_866672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866671 ?auto_866672 ) ( ON-TABLE ?auto_866658 ) ( ON ?auto_866659 ?auto_866658 ) ( ON ?auto_866660 ?auto_866659 ) ( ON ?auto_866661 ?auto_866660 ) ( ON ?auto_866662 ?auto_866661 ) ( ON ?auto_866663 ?auto_866662 ) ( ON ?auto_866664 ?auto_866663 ) ( not ( = ?auto_866658 ?auto_866659 ) ) ( not ( = ?auto_866658 ?auto_866660 ) ) ( not ( = ?auto_866658 ?auto_866661 ) ) ( not ( = ?auto_866658 ?auto_866662 ) ) ( not ( = ?auto_866658 ?auto_866663 ) ) ( not ( = ?auto_866658 ?auto_866664 ) ) ( not ( = ?auto_866658 ?auto_866665 ) ) ( not ( = ?auto_866658 ?auto_866666 ) ) ( not ( = ?auto_866658 ?auto_866667 ) ) ( not ( = ?auto_866658 ?auto_866668 ) ) ( not ( = ?auto_866658 ?auto_866669 ) ) ( not ( = ?auto_866658 ?auto_866670 ) ) ( not ( = ?auto_866658 ?auto_866671 ) ) ( not ( = ?auto_866658 ?auto_866672 ) ) ( not ( = ?auto_866659 ?auto_866660 ) ) ( not ( = ?auto_866659 ?auto_866661 ) ) ( not ( = ?auto_866659 ?auto_866662 ) ) ( not ( = ?auto_866659 ?auto_866663 ) ) ( not ( = ?auto_866659 ?auto_866664 ) ) ( not ( = ?auto_866659 ?auto_866665 ) ) ( not ( = ?auto_866659 ?auto_866666 ) ) ( not ( = ?auto_866659 ?auto_866667 ) ) ( not ( = ?auto_866659 ?auto_866668 ) ) ( not ( = ?auto_866659 ?auto_866669 ) ) ( not ( = ?auto_866659 ?auto_866670 ) ) ( not ( = ?auto_866659 ?auto_866671 ) ) ( not ( = ?auto_866659 ?auto_866672 ) ) ( not ( = ?auto_866660 ?auto_866661 ) ) ( not ( = ?auto_866660 ?auto_866662 ) ) ( not ( = ?auto_866660 ?auto_866663 ) ) ( not ( = ?auto_866660 ?auto_866664 ) ) ( not ( = ?auto_866660 ?auto_866665 ) ) ( not ( = ?auto_866660 ?auto_866666 ) ) ( not ( = ?auto_866660 ?auto_866667 ) ) ( not ( = ?auto_866660 ?auto_866668 ) ) ( not ( = ?auto_866660 ?auto_866669 ) ) ( not ( = ?auto_866660 ?auto_866670 ) ) ( not ( = ?auto_866660 ?auto_866671 ) ) ( not ( = ?auto_866660 ?auto_866672 ) ) ( not ( = ?auto_866661 ?auto_866662 ) ) ( not ( = ?auto_866661 ?auto_866663 ) ) ( not ( = ?auto_866661 ?auto_866664 ) ) ( not ( = ?auto_866661 ?auto_866665 ) ) ( not ( = ?auto_866661 ?auto_866666 ) ) ( not ( = ?auto_866661 ?auto_866667 ) ) ( not ( = ?auto_866661 ?auto_866668 ) ) ( not ( = ?auto_866661 ?auto_866669 ) ) ( not ( = ?auto_866661 ?auto_866670 ) ) ( not ( = ?auto_866661 ?auto_866671 ) ) ( not ( = ?auto_866661 ?auto_866672 ) ) ( not ( = ?auto_866662 ?auto_866663 ) ) ( not ( = ?auto_866662 ?auto_866664 ) ) ( not ( = ?auto_866662 ?auto_866665 ) ) ( not ( = ?auto_866662 ?auto_866666 ) ) ( not ( = ?auto_866662 ?auto_866667 ) ) ( not ( = ?auto_866662 ?auto_866668 ) ) ( not ( = ?auto_866662 ?auto_866669 ) ) ( not ( = ?auto_866662 ?auto_866670 ) ) ( not ( = ?auto_866662 ?auto_866671 ) ) ( not ( = ?auto_866662 ?auto_866672 ) ) ( not ( = ?auto_866663 ?auto_866664 ) ) ( not ( = ?auto_866663 ?auto_866665 ) ) ( not ( = ?auto_866663 ?auto_866666 ) ) ( not ( = ?auto_866663 ?auto_866667 ) ) ( not ( = ?auto_866663 ?auto_866668 ) ) ( not ( = ?auto_866663 ?auto_866669 ) ) ( not ( = ?auto_866663 ?auto_866670 ) ) ( not ( = ?auto_866663 ?auto_866671 ) ) ( not ( = ?auto_866663 ?auto_866672 ) ) ( not ( = ?auto_866664 ?auto_866665 ) ) ( not ( = ?auto_866664 ?auto_866666 ) ) ( not ( = ?auto_866664 ?auto_866667 ) ) ( not ( = ?auto_866664 ?auto_866668 ) ) ( not ( = ?auto_866664 ?auto_866669 ) ) ( not ( = ?auto_866664 ?auto_866670 ) ) ( not ( = ?auto_866664 ?auto_866671 ) ) ( not ( = ?auto_866664 ?auto_866672 ) ) ( not ( = ?auto_866665 ?auto_866666 ) ) ( not ( = ?auto_866665 ?auto_866667 ) ) ( not ( = ?auto_866665 ?auto_866668 ) ) ( not ( = ?auto_866665 ?auto_866669 ) ) ( not ( = ?auto_866665 ?auto_866670 ) ) ( not ( = ?auto_866665 ?auto_866671 ) ) ( not ( = ?auto_866665 ?auto_866672 ) ) ( not ( = ?auto_866666 ?auto_866667 ) ) ( not ( = ?auto_866666 ?auto_866668 ) ) ( not ( = ?auto_866666 ?auto_866669 ) ) ( not ( = ?auto_866666 ?auto_866670 ) ) ( not ( = ?auto_866666 ?auto_866671 ) ) ( not ( = ?auto_866666 ?auto_866672 ) ) ( not ( = ?auto_866667 ?auto_866668 ) ) ( not ( = ?auto_866667 ?auto_866669 ) ) ( not ( = ?auto_866667 ?auto_866670 ) ) ( not ( = ?auto_866667 ?auto_866671 ) ) ( not ( = ?auto_866667 ?auto_866672 ) ) ( not ( = ?auto_866668 ?auto_866669 ) ) ( not ( = ?auto_866668 ?auto_866670 ) ) ( not ( = ?auto_866668 ?auto_866671 ) ) ( not ( = ?auto_866668 ?auto_866672 ) ) ( not ( = ?auto_866669 ?auto_866670 ) ) ( not ( = ?auto_866669 ?auto_866671 ) ) ( not ( = ?auto_866669 ?auto_866672 ) ) ( not ( = ?auto_866670 ?auto_866671 ) ) ( not ( = ?auto_866670 ?auto_866672 ) ) ( not ( = ?auto_866671 ?auto_866672 ) ) ( ON ?auto_866670 ?auto_866671 ) ( ON ?auto_866669 ?auto_866670 ) ( ON ?auto_866668 ?auto_866669 ) ( ON ?auto_866667 ?auto_866668 ) ( ON ?auto_866666 ?auto_866667 ) ( CLEAR ?auto_866664 ) ( ON ?auto_866665 ?auto_866666 ) ( CLEAR ?auto_866665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_866658 ?auto_866659 ?auto_866660 ?auto_866661 ?auto_866662 ?auto_866663 ?auto_866664 ?auto_866665 )
      ( MAKE-14PILE ?auto_866658 ?auto_866659 ?auto_866660 ?auto_866661 ?auto_866662 ?auto_866663 ?auto_866664 ?auto_866665 ?auto_866666 ?auto_866667 ?auto_866668 ?auto_866669 ?auto_866670 ?auto_866671 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866716 - BLOCK
      ?auto_866717 - BLOCK
      ?auto_866718 - BLOCK
      ?auto_866719 - BLOCK
      ?auto_866720 - BLOCK
      ?auto_866721 - BLOCK
      ?auto_866722 - BLOCK
      ?auto_866723 - BLOCK
      ?auto_866724 - BLOCK
      ?auto_866725 - BLOCK
      ?auto_866726 - BLOCK
      ?auto_866727 - BLOCK
      ?auto_866728 - BLOCK
      ?auto_866729 - BLOCK
    )
    :vars
    (
      ?auto_866730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866729 ?auto_866730 ) ( ON-TABLE ?auto_866716 ) ( ON ?auto_866717 ?auto_866716 ) ( ON ?auto_866718 ?auto_866717 ) ( ON ?auto_866719 ?auto_866718 ) ( ON ?auto_866720 ?auto_866719 ) ( ON ?auto_866721 ?auto_866720 ) ( not ( = ?auto_866716 ?auto_866717 ) ) ( not ( = ?auto_866716 ?auto_866718 ) ) ( not ( = ?auto_866716 ?auto_866719 ) ) ( not ( = ?auto_866716 ?auto_866720 ) ) ( not ( = ?auto_866716 ?auto_866721 ) ) ( not ( = ?auto_866716 ?auto_866722 ) ) ( not ( = ?auto_866716 ?auto_866723 ) ) ( not ( = ?auto_866716 ?auto_866724 ) ) ( not ( = ?auto_866716 ?auto_866725 ) ) ( not ( = ?auto_866716 ?auto_866726 ) ) ( not ( = ?auto_866716 ?auto_866727 ) ) ( not ( = ?auto_866716 ?auto_866728 ) ) ( not ( = ?auto_866716 ?auto_866729 ) ) ( not ( = ?auto_866716 ?auto_866730 ) ) ( not ( = ?auto_866717 ?auto_866718 ) ) ( not ( = ?auto_866717 ?auto_866719 ) ) ( not ( = ?auto_866717 ?auto_866720 ) ) ( not ( = ?auto_866717 ?auto_866721 ) ) ( not ( = ?auto_866717 ?auto_866722 ) ) ( not ( = ?auto_866717 ?auto_866723 ) ) ( not ( = ?auto_866717 ?auto_866724 ) ) ( not ( = ?auto_866717 ?auto_866725 ) ) ( not ( = ?auto_866717 ?auto_866726 ) ) ( not ( = ?auto_866717 ?auto_866727 ) ) ( not ( = ?auto_866717 ?auto_866728 ) ) ( not ( = ?auto_866717 ?auto_866729 ) ) ( not ( = ?auto_866717 ?auto_866730 ) ) ( not ( = ?auto_866718 ?auto_866719 ) ) ( not ( = ?auto_866718 ?auto_866720 ) ) ( not ( = ?auto_866718 ?auto_866721 ) ) ( not ( = ?auto_866718 ?auto_866722 ) ) ( not ( = ?auto_866718 ?auto_866723 ) ) ( not ( = ?auto_866718 ?auto_866724 ) ) ( not ( = ?auto_866718 ?auto_866725 ) ) ( not ( = ?auto_866718 ?auto_866726 ) ) ( not ( = ?auto_866718 ?auto_866727 ) ) ( not ( = ?auto_866718 ?auto_866728 ) ) ( not ( = ?auto_866718 ?auto_866729 ) ) ( not ( = ?auto_866718 ?auto_866730 ) ) ( not ( = ?auto_866719 ?auto_866720 ) ) ( not ( = ?auto_866719 ?auto_866721 ) ) ( not ( = ?auto_866719 ?auto_866722 ) ) ( not ( = ?auto_866719 ?auto_866723 ) ) ( not ( = ?auto_866719 ?auto_866724 ) ) ( not ( = ?auto_866719 ?auto_866725 ) ) ( not ( = ?auto_866719 ?auto_866726 ) ) ( not ( = ?auto_866719 ?auto_866727 ) ) ( not ( = ?auto_866719 ?auto_866728 ) ) ( not ( = ?auto_866719 ?auto_866729 ) ) ( not ( = ?auto_866719 ?auto_866730 ) ) ( not ( = ?auto_866720 ?auto_866721 ) ) ( not ( = ?auto_866720 ?auto_866722 ) ) ( not ( = ?auto_866720 ?auto_866723 ) ) ( not ( = ?auto_866720 ?auto_866724 ) ) ( not ( = ?auto_866720 ?auto_866725 ) ) ( not ( = ?auto_866720 ?auto_866726 ) ) ( not ( = ?auto_866720 ?auto_866727 ) ) ( not ( = ?auto_866720 ?auto_866728 ) ) ( not ( = ?auto_866720 ?auto_866729 ) ) ( not ( = ?auto_866720 ?auto_866730 ) ) ( not ( = ?auto_866721 ?auto_866722 ) ) ( not ( = ?auto_866721 ?auto_866723 ) ) ( not ( = ?auto_866721 ?auto_866724 ) ) ( not ( = ?auto_866721 ?auto_866725 ) ) ( not ( = ?auto_866721 ?auto_866726 ) ) ( not ( = ?auto_866721 ?auto_866727 ) ) ( not ( = ?auto_866721 ?auto_866728 ) ) ( not ( = ?auto_866721 ?auto_866729 ) ) ( not ( = ?auto_866721 ?auto_866730 ) ) ( not ( = ?auto_866722 ?auto_866723 ) ) ( not ( = ?auto_866722 ?auto_866724 ) ) ( not ( = ?auto_866722 ?auto_866725 ) ) ( not ( = ?auto_866722 ?auto_866726 ) ) ( not ( = ?auto_866722 ?auto_866727 ) ) ( not ( = ?auto_866722 ?auto_866728 ) ) ( not ( = ?auto_866722 ?auto_866729 ) ) ( not ( = ?auto_866722 ?auto_866730 ) ) ( not ( = ?auto_866723 ?auto_866724 ) ) ( not ( = ?auto_866723 ?auto_866725 ) ) ( not ( = ?auto_866723 ?auto_866726 ) ) ( not ( = ?auto_866723 ?auto_866727 ) ) ( not ( = ?auto_866723 ?auto_866728 ) ) ( not ( = ?auto_866723 ?auto_866729 ) ) ( not ( = ?auto_866723 ?auto_866730 ) ) ( not ( = ?auto_866724 ?auto_866725 ) ) ( not ( = ?auto_866724 ?auto_866726 ) ) ( not ( = ?auto_866724 ?auto_866727 ) ) ( not ( = ?auto_866724 ?auto_866728 ) ) ( not ( = ?auto_866724 ?auto_866729 ) ) ( not ( = ?auto_866724 ?auto_866730 ) ) ( not ( = ?auto_866725 ?auto_866726 ) ) ( not ( = ?auto_866725 ?auto_866727 ) ) ( not ( = ?auto_866725 ?auto_866728 ) ) ( not ( = ?auto_866725 ?auto_866729 ) ) ( not ( = ?auto_866725 ?auto_866730 ) ) ( not ( = ?auto_866726 ?auto_866727 ) ) ( not ( = ?auto_866726 ?auto_866728 ) ) ( not ( = ?auto_866726 ?auto_866729 ) ) ( not ( = ?auto_866726 ?auto_866730 ) ) ( not ( = ?auto_866727 ?auto_866728 ) ) ( not ( = ?auto_866727 ?auto_866729 ) ) ( not ( = ?auto_866727 ?auto_866730 ) ) ( not ( = ?auto_866728 ?auto_866729 ) ) ( not ( = ?auto_866728 ?auto_866730 ) ) ( not ( = ?auto_866729 ?auto_866730 ) ) ( ON ?auto_866728 ?auto_866729 ) ( ON ?auto_866727 ?auto_866728 ) ( ON ?auto_866726 ?auto_866727 ) ( ON ?auto_866725 ?auto_866726 ) ( ON ?auto_866724 ?auto_866725 ) ( ON ?auto_866723 ?auto_866724 ) ( CLEAR ?auto_866721 ) ( ON ?auto_866722 ?auto_866723 ) ( CLEAR ?auto_866722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_866716 ?auto_866717 ?auto_866718 ?auto_866719 ?auto_866720 ?auto_866721 ?auto_866722 )
      ( MAKE-14PILE ?auto_866716 ?auto_866717 ?auto_866718 ?auto_866719 ?auto_866720 ?auto_866721 ?auto_866722 ?auto_866723 ?auto_866724 ?auto_866725 ?auto_866726 ?auto_866727 ?auto_866728 ?auto_866729 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866774 - BLOCK
      ?auto_866775 - BLOCK
      ?auto_866776 - BLOCK
      ?auto_866777 - BLOCK
      ?auto_866778 - BLOCK
      ?auto_866779 - BLOCK
      ?auto_866780 - BLOCK
      ?auto_866781 - BLOCK
      ?auto_866782 - BLOCK
      ?auto_866783 - BLOCK
      ?auto_866784 - BLOCK
      ?auto_866785 - BLOCK
      ?auto_866786 - BLOCK
      ?auto_866787 - BLOCK
    )
    :vars
    (
      ?auto_866788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866787 ?auto_866788 ) ( ON-TABLE ?auto_866774 ) ( ON ?auto_866775 ?auto_866774 ) ( ON ?auto_866776 ?auto_866775 ) ( ON ?auto_866777 ?auto_866776 ) ( ON ?auto_866778 ?auto_866777 ) ( not ( = ?auto_866774 ?auto_866775 ) ) ( not ( = ?auto_866774 ?auto_866776 ) ) ( not ( = ?auto_866774 ?auto_866777 ) ) ( not ( = ?auto_866774 ?auto_866778 ) ) ( not ( = ?auto_866774 ?auto_866779 ) ) ( not ( = ?auto_866774 ?auto_866780 ) ) ( not ( = ?auto_866774 ?auto_866781 ) ) ( not ( = ?auto_866774 ?auto_866782 ) ) ( not ( = ?auto_866774 ?auto_866783 ) ) ( not ( = ?auto_866774 ?auto_866784 ) ) ( not ( = ?auto_866774 ?auto_866785 ) ) ( not ( = ?auto_866774 ?auto_866786 ) ) ( not ( = ?auto_866774 ?auto_866787 ) ) ( not ( = ?auto_866774 ?auto_866788 ) ) ( not ( = ?auto_866775 ?auto_866776 ) ) ( not ( = ?auto_866775 ?auto_866777 ) ) ( not ( = ?auto_866775 ?auto_866778 ) ) ( not ( = ?auto_866775 ?auto_866779 ) ) ( not ( = ?auto_866775 ?auto_866780 ) ) ( not ( = ?auto_866775 ?auto_866781 ) ) ( not ( = ?auto_866775 ?auto_866782 ) ) ( not ( = ?auto_866775 ?auto_866783 ) ) ( not ( = ?auto_866775 ?auto_866784 ) ) ( not ( = ?auto_866775 ?auto_866785 ) ) ( not ( = ?auto_866775 ?auto_866786 ) ) ( not ( = ?auto_866775 ?auto_866787 ) ) ( not ( = ?auto_866775 ?auto_866788 ) ) ( not ( = ?auto_866776 ?auto_866777 ) ) ( not ( = ?auto_866776 ?auto_866778 ) ) ( not ( = ?auto_866776 ?auto_866779 ) ) ( not ( = ?auto_866776 ?auto_866780 ) ) ( not ( = ?auto_866776 ?auto_866781 ) ) ( not ( = ?auto_866776 ?auto_866782 ) ) ( not ( = ?auto_866776 ?auto_866783 ) ) ( not ( = ?auto_866776 ?auto_866784 ) ) ( not ( = ?auto_866776 ?auto_866785 ) ) ( not ( = ?auto_866776 ?auto_866786 ) ) ( not ( = ?auto_866776 ?auto_866787 ) ) ( not ( = ?auto_866776 ?auto_866788 ) ) ( not ( = ?auto_866777 ?auto_866778 ) ) ( not ( = ?auto_866777 ?auto_866779 ) ) ( not ( = ?auto_866777 ?auto_866780 ) ) ( not ( = ?auto_866777 ?auto_866781 ) ) ( not ( = ?auto_866777 ?auto_866782 ) ) ( not ( = ?auto_866777 ?auto_866783 ) ) ( not ( = ?auto_866777 ?auto_866784 ) ) ( not ( = ?auto_866777 ?auto_866785 ) ) ( not ( = ?auto_866777 ?auto_866786 ) ) ( not ( = ?auto_866777 ?auto_866787 ) ) ( not ( = ?auto_866777 ?auto_866788 ) ) ( not ( = ?auto_866778 ?auto_866779 ) ) ( not ( = ?auto_866778 ?auto_866780 ) ) ( not ( = ?auto_866778 ?auto_866781 ) ) ( not ( = ?auto_866778 ?auto_866782 ) ) ( not ( = ?auto_866778 ?auto_866783 ) ) ( not ( = ?auto_866778 ?auto_866784 ) ) ( not ( = ?auto_866778 ?auto_866785 ) ) ( not ( = ?auto_866778 ?auto_866786 ) ) ( not ( = ?auto_866778 ?auto_866787 ) ) ( not ( = ?auto_866778 ?auto_866788 ) ) ( not ( = ?auto_866779 ?auto_866780 ) ) ( not ( = ?auto_866779 ?auto_866781 ) ) ( not ( = ?auto_866779 ?auto_866782 ) ) ( not ( = ?auto_866779 ?auto_866783 ) ) ( not ( = ?auto_866779 ?auto_866784 ) ) ( not ( = ?auto_866779 ?auto_866785 ) ) ( not ( = ?auto_866779 ?auto_866786 ) ) ( not ( = ?auto_866779 ?auto_866787 ) ) ( not ( = ?auto_866779 ?auto_866788 ) ) ( not ( = ?auto_866780 ?auto_866781 ) ) ( not ( = ?auto_866780 ?auto_866782 ) ) ( not ( = ?auto_866780 ?auto_866783 ) ) ( not ( = ?auto_866780 ?auto_866784 ) ) ( not ( = ?auto_866780 ?auto_866785 ) ) ( not ( = ?auto_866780 ?auto_866786 ) ) ( not ( = ?auto_866780 ?auto_866787 ) ) ( not ( = ?auto_866780 ?auto_866788 ) ) ( not ( = ?auto_866781 ?auto_866782 ) ) ( not ( = ?auto_866781 ?auto_866783 ) ) ( not ( = ?auto_866781 ?auto_866784 ) ) ( not ( = ?auto_866781 ?auto_866785 ) ) ( not ( = ?auto_866781 ?auto_866786 ) ) ( not ( = ?auto_866781 ?auto_866787 ) ) ( not ( = ?auto_866781 ?auto_866788 ) ) ( not ( = ?auto_866782 ?auto_866783 ) ) ( not ( = ?auto_866782 ?auto_866784 ) ) ( not ( = ?auto_866782 ?auto_866785 ) ) ( not ( = ?auto_866782 ?auto_866786 ) ) ( not ( = ?auto_866782 ?auto_866787 ) ) ( not ( = ?auto_866782 ?auto_866788 ) ) ( not ( = ?auto_866783 ?auto_866784 ) ) ( not ( = ?auto_866783 ?auto_866785 ) ) ( not ( = ?auto_866783 ?auto_866786 ) ) ( not ( = ?auto_866783 ?auto_866787 ) ) ( not ( = ?auto_866783 ?auto_866788 ) ) ( not ( = ?auto_866784 ?auto_866785 ) ) ( not ( = ?auto_866784 ?auto_866786 ) ) ( not ( = ?auto_866784 ?auto_866787 ) ) ( not ( = ?auto_866784 ?auto_866788 ) ) ( not ( = ?auto_866785 ?auto_866786 ) ) ( not ( = ?auto_866785 ?auto_866787 ) ) ( not ( = ?auto_866785 ?auto_866788 ) ) ( not ( = ?auto_866786 ?auto_866787 ) ) ( not ( = ?auto_866786 ?auto_866788 ) ) ( not ( = ?auto_866787 ?auto_866788 ) ) ( ON ?auto_866786 ?auto_866787 ) ( ON ?auto_866785 ?auto_866786 ) ( ON ?auto_866784 ?auto_866785 ) ( ON ?auto_866783 ?auto_866784 ) ( ON ?auto_866782 ?auto_866783 ) ( ON ?auto_866781 ?auto_866782 ) ( ON ?auto_866780 ?auto_866781 ) ( CLEAR ?auto_866778 ) ( ON ?auto_866779 ?auto_866780 ) ( CLEAR ?auto_866779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_866774 ?auto_866775 ?auto_866776 ?auto_866777 ?auto_866778 ?auto_866779 )
      ( MAKE-14PILE ?auto_866774 ?auto_866775 ?auto_866776 ?auto_866777 ?auto_866778 ?auto_866779 ?auto_866780 ?auto_866781 ?auto_866782 ?auto_866783 ?auto_866784 ?auto_866785 ?auto_866786 ?auto_866787 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866832 - BLOCK
      ?auto_866833 - BLOCK
      ?auto_866834 - BLOCK
      ?auto_866835 - BLOCK
      ?auto_866836 - BLOCK
      ?auto_866837 - BLOCK
      ?auto_866838 - BLOCK
      ?auto_866839 - BLOCK
      ?auto_866840 - BLOCK
      ?auto_866841 - BLOCK
      ?auto_866842 - BLOCK
      ?auto_866843 - BLOCK
      ?auto_866844 - BLOCK
      ?auto_866845 - BLOCK
    )
    :vars
    (
      ?auto_866846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866845 ?auto_866846 ) ( ON-TABLE ?auto_866832 ) ( ON ?auto_866833 ?auto_866832 ) ( ON ?auto_866834 ?auto_866833 ) ( ON ?auto_866835 ?auto_866834 ) ( not ( = ?auto_866832 ?auto_866833 ) ) ( not ( = ?auto_866832 ?auto_866834 ) ) ( not ( = ?auto_866832 ?auto_866835 ) ) ( not ( = ?auto_866832 ?auto_866836 ) ) ( not ( = ?auto_866832 ?auto_866837 ) ) ( not ( = ?auto_866832 ?auto_866838 ) ) ( not ( = ?auto_866832 ?auto_866839 ) ) ( not ( = ?auto_866832 ?auto_866840 ) ) ( not ( = ?auto_866832 ?auto_866841 ) ) ( not ( = ?auto_866832 ?auto_866842 ) ) ( not ( = ?auto_866832 ?auto_866843 ) ) ( not ( = ?auto_866832 ?auto_866844 ) ) ( not ( = ?auto_866832 ?auto_866845 ) ) ( not ( = ?auto_866832 ?auto_866846 ) ) ( not ( = ?auto_866833 ?auto_866834 ) ) ( not ( = ?auto_866833 ?auto_866835 ) ) ( not ( = ?auto_866833 ?auto_866836 ) ) ( not ( = ?auto_866833 ?auto_866837 ) ) ( not ( = ?auto_866833 ?auto_866838 ) ) ( not ( = ?auto_866833 ?auto_866839 ) ) ( not ( = ?auto_866833 ?auto_866840 ) ) ( not ( = ?auto_866833 ?auto_866841 ) ) ( not ( = ?auto_866833 ?auto_866842 ) ) ( not ( = ?auto_866833 ?auto_866843 ) ) ( not ( = ?auto_866833 ?auto_866844 ) ) ( not ( = ?auto_866833 ?auto_866845 ) ) ( not ( = ?auto_866833 ?auto_866846 ) ) ( not ( = ?auto_866834 ?auto_866835 ) ) ( not ( = ?auto_866834 ?auto_866836 ) ) ( not ( = ?auto_866834 ?auto_866837 ) ) ( not ( = ?auto_866834 ?auto_866838 ) ) ( not ( = ?auto_866834 ?auto_866839 ) ) ( not ( = ?auto_866834 ?auto_866840 ) ) ( not ( = ?auto_866834 ?auto_866841 ) ) ( not ( = ?auto_866834 ?auto_866842 ) ) ( not ( = ?auto_866834 ?auto_866843 ) ) ( not ( = ?auto_866834 ?auto_866844 ) ) ( not ( = ?auto_866834 ?auto_866845 ) ) ( not ( = ?auto_866834 ?auto_866846 ) ) ( not ( = ?auto_866835 ?auto_866836 ) ) ( not ( = ?auto_866835 ?auto_866837 ) ) ( not ( = ?auto_866835 ?auto_866838 ) ) ( not ( = ?auto_866835 ?auto_866839 ) ) ( not ( = ?auto_866835 ?auto_866840 ) ) ( not ( = ?auto_866835 ?auto_866841 ) ) ( not ( = ?auto_866835 ?auto_866842 ) ) ( not ( = ?auto_866835 ?auto_866843 ) ) ( not ( = ?auto_866835 ?auto_866844 ) ) ( not ( = ?auto_866835 ?auto_866845 ) ) ( not ( = ?auto_866835 ?auto_866846 ) ) ( not ( = ?auto_866836 ?auto_866837 ) ) ( not ( = ?auto_866836 ?auto_866838 ) ) ( not ( = ?auto_866836 ?auto_866839 ) ) ( not ( = ?auto_866836 ?auto_866840 ) ) ( not ( = ?auto_866836 ?auto_866841 ) ) ( not ( = ?auto_866836 ?auto_866842 ) ) ( not ( = ?auto_866836 ?auto_866843 ) ) ( not ( = ?auto_866836 ?auto_866844 ) ) ( not ( = ?auto_866836 ?auto_866845 ) ) ( not ( = ?auto_866836 ?auto_866846 ) ) ( not ( = ?auto_866837 ?auto_866838 ) ) ( not ( = ?auto_866837 ?auto_866839 ) ) ( not ( = ?auto_866837 ?auto_866840 ) ) ( not ( = ?auto_866837 ?auto_866841 ) ) ( not ( = ?auto_866837 ?auto_866842 ) ) ( not ( = ?auto_866837 ?auto_866843 ) ) ( not ( = ?auto_866837 ?auto_866844 ) ) ( not ( = ?auto_866837 ?auto_866845 ) ) ( not ( = ?auto_866837 ?auto_866846 ) ) ( not ( = ?auto_866838 ?auto_866839 ) ) ( not ( = ?auto_866838 ?auto_866840 ) ) ( not ( = ?auto_866838 ?auto_866841 ) ) ( not ( = ?auto_866838 ?auto_866842 ) ) ( not ( = ?auto_866838 ?auto_866843 ) ) ( not ( = ?auto_866838 ?auto_866844 ) ) ( not ( = ?auto_866838 ?auto_866845 ) ) ( not ( = ?auto_866838 ?auto_866846 ) ) ( not ( = ?auto_866839 ?auto_866840 ) ) ( not ( = ?auto_866839 ?auto_866841 ) ) ( not ( = ?auto_866839 ?auto_866842 ) ) ( not ( = ?auto_866839 ?auto_866843 ) ) ( not ( = ?auto_866839 ?auto_866844 ) ) ( not ( = ?auto_866839 ?auto_866845 ) ) ( not ( = ?auto_866839 ?auto_866846 ) ) ( not ( = ?auto_866840 ?auto_866841 ) ) ( not ( = ?auto_866840 ?auto_866842 ) ) ( not ( = ?auto_866840 ?auto_866843 ) ) ( not ( = ?auto_866840 ?auto_866844 ) ) ( not ( = ?auto_866840 ?auto_866845 ) ) ( not ( = ?auto_866840 ?auto_866846 ) ) ( not ( = ?auto_866841 ?auto_866842 ) ) ( not ( = ?auto_866841 ?auto_866843 ) ) ( not ( = ?auto_866841 ?auto_866844 ) ) ( not ( = ?auto_866841 ?auto_866845 ) ) ( not ( = ?auto_866841 ?auto_866846 ) ) ( not ( = ?auto_866842 ?auto_866843 ) ) ( not ( = ?auto_866842 ?auto_866844 ) ) ( not ( = ?auto_866842 ?auto_866845 ) ) ( not ( = ?auto_866842 ?auto_866846 ) ) ( not ( = ?auto_866843 ?auto_866844 ) ) ( not ( = ?auto_866843 ?auto_866845 ) ) ( not ( = ?auto_866843 ?auto_866846 ) ) ( not ( = ?auto_866844 ?auto_866845 ) ) ( not ( = ?auto_866844 ?auto_866846 ) ) ( not ( = ?auto_866845 ?auto_866846 ) ) ( ON ?auto_866844 ?auto_866845 ) ( ON ?auto_866843 ?auto_866844 ) ( ON ?auto_866842 ?auto_866843 ) ( ON ?auto_866841 ?auto_866842 ) ( ON ?auto_866840 ?auto_866841 ) ( ON ?auto_866839 ?auto_866840 ) ( ON ?auto_866838 ?auto_866839 ) ( ON ?auto_866837 ?auto_866838 ) ( CLEAR ?auto_866835 ) ( ON ?auto_866836 ?auto_866837 ) ( CLEAR ?auto_866836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_866832 ?auto_866833 ?auto_866834 ?auto_866835 ?auto_866836 )
      ( MAKE-14PILE ?auto_866832 ?auto_866833 ?auto_866834 ?auto_866835 ?auto_866836 ?auto_866837 ?auto_866838 ?auto_866839 ?auto_866840 ?auto_866841 ?auto_866842 ?auto_866843 ?auto_866844 ?auto_866845 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866890 - BLOCK
      ?auto_866891 - BLOCK
      ?auto_866892 - BLOCK
      ?auto_866893 - BLOCK
      ?auto_866894 - BLOCK
      ?auto_866895 - BLOCK
      ?auto_866896 - BLOCK
      ?auto_866897 - BLOCK
      ?auto_866898 - BLOCK
      ?auto_866899 - BLOCK
      ?auto_866900 - BLOCK
      ?auto_866901 - BLOCK
      ?auto_866902 - BLOCK
      ?auto_866903 - BLOCK
    )
    :vars
    (
      ?auto_866904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866903 ?auto_866904 ) ( ON-TABLE ?auto_866890 ) ( ON ?auto_866891 ?auto_866890 ) ( ON ?auto_866892 ?auto_866891 ) ( not ( = ?auto_866890 ?auto_866891 ) ) ( not ( = ?auto_866890 ?auto_866892 ) ) ( not ( = ?auto_866890 ?auto_866893 ) ) ( not ( = ?auto_866890 ?auto_866894 ) ) ( not ( = ?auto_866890 ?auto_866895 ) ) ( not ( = ?auto_866890 ?auto_866896 ) ) ( not ( = ?auto_866890 ?auto_866897 ) ) ( not ( = ?auto_866890 ?auto_866898 ) ) ( not ( = ?auto_866890 ?auto_866899 ) ) ( not ( = ?auto_866890 ?auto_866900 ) ) ( not ( = ?auto_866890 ?auto_866901 ) ) ( not ( = ?auto_866890 ?auto_866902 ) ) ( not ( = ?auto_866890 ?auto_866903 ) ) ( not ( = ?auto_866890 ?auto_866904 ) ) ( not ( = ?auto_866891 ?auto_866892 ) ) ( not ( = ?auto_866891 ?auto_866893 ) ) ( not ( = ?auto_866891 ?auto_866894 ) ) ( not ( = ?auto_866891 ?auto_866895 ) ) ( not ( = ?auto_866891 ?auto_866896 ) ) ( not ( = ?auto_866891 ?auto_866897 ) ) ( not ( = ?auto_866891 ?auto_866898 ) ) ( not ( = ?auto_866891 ?auto_866899 ) ) ( not ( = ?auto_866891 ?auto_866900 ) ) ( not ( = ?auto_866891 ?auto_866901 ) ) ( not ( = ?auto_866891 ?auto_866902 ) ) ( not ( = ?auto_866891 ?auto_866903 ) ) ( not ( = ?auto_866891 ?auto_866904 ) ) ( not ( = ?auto_866892 ?auto_866893 ) ) ( not ( = ?auto_866892 ?auto_866894 ) ) ( not ( = ?auto_866892 ?auto_866895 ) ) ( not ( = ?auto_866892 ?auto_866896 ) ) ( not ( = ?auto_866892 ?auto_866897 ) ) ( not ( = ?auto_866892 ?auto_866898 ) ) ( not ( = ?auto_866892 ?auto_866899 ) ) ( not ( = ?auto_866892 ?auto_866900 ) ) ( not ( = ?auto_866892 ?auto_866901 ) ) ( not ( = ?auto_866892 ?auto_866902 ) ) ( not ( = ?auto_866892 ?auto_866903 ) ) ( not ( = ?auto_866892 ?auto_866904 ) ) ( not ( = ?auto_866893 ?auto_866894 ) ) ( not ( = ?auto_866893 ?auto_866895 ) ) ( not ( = ?auto_866893 ?auto_866896 ) ) ( not ( = ?auto_866893 ?auto_866897 ) ) ( not ( = ?auto_866893 ?auto_866898 ) ) ( not ( = ?auto_866893 ?auto_866899 ) ) ( not ( = ?auto_866893 ?auto_866900 ) ) ( not ( = ?auto_866893 ?auto_866901 ) ) ( not ( = ?auto_866893 ?auto_866902 ) ) ( not ( = ?auto_866893 ?auto_866903 ) ) ( not ( = ?auto_866893 ?auto_866904 ) ) ( not ( = ?auto_866894 ?auto_866895 ) ) ( not ( = ?auto_866894 ?auto_866896 ) ) ( not ( = ?auto_866894 ?auto_866897 ) ) ( not ( = ?auto_866894 ?auto_866898 ) ) ( not ( = ?auto_866894 ?auto_866899 ) ) ( not ( = ?auto_866894 ?auto_866900 ) ) ( not ( = ?auto_866894 ?auto_866901 ) ) ( not ( = ?auto_866894 ?auto_866902 ) ) ( not ( = ?auto_866894 ?auto_866903 ) ) ( not ( = ?auto_866894 ?auto_866904 ) ) ( not ( = ?auto_866895 ?auto_866896 ) ) ( not ( = ?auto_866895 ?auto_866897 ) ) ( not ( = ?auto_866895 ?auto_866898 ) ) ( not ( = ?auto_866895 ?auto_866899 ) ) ( not ( = ?auto_866895 ?auto_866900 ) ) ( not ( = ?auto_866895 ?auto_866901 ) ) ( not ( = ?auto_866895 ?auto_866902 ) ) ( not ( = ?auto_866895 ?auto_866903 ) ) ( not ( = ?auto_866895 ?auto_866904 ) ) ( not ( = ?auto_866896 ?auto_866897 ) ) ( not ( = ?auto_866896 ?auto_866898 ) ) ( not ( = ?auto_866896 ?auto_866899 ) ) ( not ( = ?auto_866896 ?auto_866900 ) ) ( not ( = ?auto_866896 ?auto_866901 ) ) ( not ( = ?auto_866896 ?auto_866902 ) ) ( not ( = ?auto_866896 ?auto_866903 ) ) ( not ( = ?auto_866896 ?auto_866904 ) ) ( not ( = ?auto_866897 ?auto_866898 ) ) ( not ( = ?auto_866897 ?auto_866899 ) ) ( not ( = ?auto_866897 ?auto_866900 ) ) ( not ( = ?auto_866897 ?auto_866901 ) ) ( not ( = ?auto_866897 ?auto_866902 ) ) ( not ( = ?auto_866897 ?auto_866903 ) ) ( not ( = ?auto_866897 ?auto_866904 ) ) ( not ( = ?auto_866898 ?auto_866899 ) ) ( not ( = ?auto_866898 ?auto_866900 ) ) ( not ( = ?auto_866898 ?auto_866901 ) ) ( not ( = ?auto_866898 ?auto_866902 ) ) ( not ( = ?auto_866898 ?auto_866903 ) ) ( not ( = ?auto_866898 ?auto_866904 ) ) ( not ( = ?auto_866899 ?auto_866900 ) ) ( not ( = ?auto_866899 ?auto_866901 ) ) ( not ( = ?auto_866899 ?auto_866902 ) ) ( not ( = ?auto_866899 ?auto_866903 ) ) ( not ( = ?auto_866899 ?auto_866904 ) ) ( not ( = ?auto_866900 ?auto_866901 ) ) ( not ( = ?auto_866900 ?auto_866902 ) ) ( not ( = ?auto_866900 ?auto_866903 ) ) ( not ( = ?auto_866900 ?auto_866904 ) ) ( not ( = ?auto_866901 ?auto_866902 ) ) ( not ( = ?auto_866901 ?auto_866903 ) ) ( not ( = ?auto_866901 ?auto_866904 ) ) ( not ( = ?auto_866902 ?auto_866903 ) ) ( not ( = ?auto_866902 ?auto_866904 ) ) ( not ( = ?auto_866903 ?auto_866904 ) ) ( ON ?auto_866902 ?auto_866903 ) ( ON ?auto_866901 ?auto_866902 ) ( ON ?auto_866900 ?auto_866901 ) ( ON ?auto_866899 ?auto_866900 ) ( ON ?auto_866898 ?auto_866899 ) ( ON ?auto_866897 ?auto_866898 ) ( ON ?auto_866896 ?auto_866897 ) ( ON ?auto_866895 ?auto_866896 ) ( ON ?auto_866894 ?auto_866895 ) ( CLEAR ?auto_866892 ) ( ON ?auto_866893 ?auto_866894 ) ( CLEAR ?auto_866893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_866890 ?auto_866891 ?auto_866892 ?auto_866893 )
      ( MAKE-14PILE ?auto_866890 ?auto_866891 ?auto_866892 ?auto_866893 ?auto_866894 ?auto_866895 ?auto_866896 ?auto_866897 ?auto_866898 ?auto_866899 ?auto_866900 ?auto_866901 ?auto_866902 ?auto_866903 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_866948 - BLOCK
      ?auto_866949 - BLOCK
      ?auto_866950 - BLOCK
      ?auto_866951 - BLOCK
      ?auto_866952 - BLOCK
      ?auto_866953 - BLOCK
      ?auto_866954 - BLOCK
      ?auto_866955 - BLOCK
      ?auto_866956 - BLOCK
      ?auto_866957 - BLOCK
      ?auto_866958 - BLOCK
      ?auto_866959 - BLOCK
      ?auto_866960 - BLOCK
      ?auto_866961 - BLOCK
    )
    :vars
    (
      ?auto_866962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_866961 ?auto_866962 ) ( ON-TABLE ?auto_866948 ) ( ON ?auto_866949 ?auto_866948 ) ( not ( = ?auto_866948 ?auto_866949 ) ) ( not ( = ?auto_866948 ?auto_866950 ) ) ( not ( = ?auto_866948 ?auto_866951 ) ) ( not ( = ?auto_866948 ?auto_866952 ) ) ( not ( = ?auto_866948 ?auto_866953 ) ) ( not ( = ?auto_866948 ?auto_866954 ) ) ( not ( = ?auto_866948 ?auto_866955 ) ) ( not ( = ?auto_866948 ?auto_866956 ) ) ( not ( = ?auto_866948 ?auto_866957 ) ) ( not ( = ?auto_866948 ?auto_866958 ) ) ( not ( = ?auto_866948 ?auto_866959 ) ) ( not ( = ?auto_866948 ?auto_866960 ) ) ( not ( = ?auto_866948 ?auto_866961 ) ) ( not ( = ?auto_866948 ?auto_866962 ) ) ( not ( = ?auto_866949 ?auto_866950 ) ) ( not ( = ?auto_866949 ?auto_866951 ) ) ( not ( = ?auto_866949 ?auto_866952 ) ) ( not ( = ?auto_866949 ?auto_866953 ) ) ( not ( = ?auto_866949 ?auto_866954 ) ) ( not ( = ?auto_866949 ?auto_866955 ) ) ( not ( = ?auto_866949 ?auto_866956 ) ) ( not ( = ?auto_866949 ?auto_866957 ) ) ( not ( = ?auto_866949 ?auto_866958 ) ) ( not ( = ?auto_866949 ?auto_866959 ) ) ( not ( = ?auto_866949 ?auto_866960 ) ) ( not ( = ?auto_866949 ?auto_866961 ) ) ( not ( = ?auto_866949 ?auto_866962 ) ) ( not ( = ?auto_866950 ?auto_866951 ) ) ( not ( = ?auto_866950 ?auto_866952 ) ) ( not ( = ?auto_866950 ?auto_866953 ) ) ( not ( = ?auto_866950 ?auto_866954 ) ) ( not ( = ?auto_866950 ?auto_866955 ) ) ( not ( = ?auto_866950 ?auto_866956 ) ) ( not ( = ?auto_866950 ?auto_866957 ) ) ( not ( = ?auto_866950 ?auto_866958 ) ) ( not ( = ?auto_866950 ?auto_866959 ) ) ( not ( = ?auto_866950 ?auto_866960 ) ) ( not ( = ?auto_866950 ?auto_866961 ) ) ( not ( = ?auto_866950 ?auto_866962 ) ) ( not ( = ?auto_866951 ?auto_866952 ) ) ( not ( = ?auto_866951 ?auto_866953 ) ) ( not ( = ?auto_866951 ?auto_866954 ) ) ( not ( = ?auto_866951 ?auto_866955 ) ) ( not ( = ?auto_866951 ?auto_866956 ) ) ( not ( = ?auto_866951 ?auto_866957 ) ) ( not ( = ?auto_866951 ?auto_866958 ) ) ( not ( = ?auto_866951 ?auto_866959 ) ) ( not ( = ?auto_866951 ?auto_866960 ) ) ( not ( = ?auto_866951 ?auto_866961 ) ) ( not ( = ?auto_866951 ?auto_866962 ) ) ( not ( = ?auto_866952 ?auto_866953 ) ) ( not ( = ?auto_866952 ?auto_866954 ) ) ( not ( = ?auto_866952 ?auto_866955 ) ) ( not ( = ?auto_866952 ?auto_866956 ) ) ( not ( = ?auto_866952 ?auto_866957 ) ) ( not ( = ?auto_866952 ?auto_866958 ) ) ( not ( = ?auto_866952 ?auto_866959 ) ) ( not ( = ?auto_866952 ?auto_866960 ) ) ( not ( = ?auto_866952 ?auto_866961 ) ) ( not ( = ?auto_866952 ?auto_866962 ) ) ( not ( = ?auto_866953 ?auto_866954 ) ) ( not ( = ?auto_866953 ?auto_866955 ) ) ( not ( = ?auto_866953 ?auto_866956 ) ) ( not ( = ?auto_866953 ?auto_866957 ) ) ( not ( = ?auto_866953 ?auto_866958 ) ) ( not ( = ?auto_866953 ?auto_866959 ) ) ( not ( = ?auto_866953 ?auto_866960 ) ) ( not ( = ?auto_866953 ?auto_866961 ) ) ( not ( = ?auto_866953 ?auto_866962 ) ) ( not ( = ?auto_866954 ?auto_866955 ) ) ( not ( = ?auto_866954 ?auto_866956 ) ) ( not ( = ?auto_866954 ?auto_866957 ) ) ( not ( = ?auto_866954 ?auto_866958 ) ) ( not ( = ?auto_866954 ?auto_866959 ) ) ( not ( = ?auto_866954 ?auto_866960 ) ) ( not ( = ?auto_866954 ?auto_866961 ) ) ( not ( = ?auto_866954 ?auto_866962 ) ) ( not ( = ?auto_866955 ?auto_866956 ) ) ( not ( = ?auto_866955 ?auto_866957 ) ) ( not ( = ?auto_866955 ?auto_866958 ) ) ( not ( = ?auto_866955 ?auto_866959 ) ) ( not ( = ?auto_866955 ?auto_866960 ) ) ( not ( = ?auto_866955 ?auto_866961 ) ) ( not ( = ?auto_866955 ?auto_866962 ) ) ( not ( = ?auto_866956 ?auto_866957 ) ) ( not ( = ?auto_866956 ?auto_866958 ) ) ( not ( = ?auto_866956 ?auto_866959 ) ) ( not ( = ?auto_866956 ?auto_866960 ) ) ( not ( = ?auto_866956 ?auto_866961 ) ) ( not ( = ?auto_866956 ?auto_866962 ) ) ( not ( = ?auto_866957 ?auto_866958 ) ) ( not ( = ?auto_866957 ?auto_866959 ) ) ( not ( = ?auto_866957 ?auto_866960 ) ) ( not ( = ?auto_866957 ?auto_866961 ) ) ( not ( = ?auto_866957 ?auto_866962 ) ) ( not ( = ?auto_866958 ?auto_866959 ) ) ( not ( = ?auto_866958 ?auto_866960 ) ) ( not ( = ?auto_866958 ?auto_866961 ) ) ( not ( = ?auto_866958 ?auto_866962 ) ) ( not ( = ?auto_866959 ?auto_866960 ) ) ( not ( = ?auto_866959 ?auto_866961 ) ) ( not ( = ?auto_866959 ?auto_866962 ) ) ( not ( = ?auto_866960 ?auto_866961 ) ) ( not ( = ?auto_866960 ?auto_866962 ) ) ( not ( = ?auto_866961 ?auto_866962 ) ) ( ON ?auto_866960 ?auto_866961 ) ( ON ?auto_866959 ?auto_866960 ) ( ON ?auto_866958 ?auto_866959 ) ( ON ?auto_866957 ?auto_866958 ) ( ON ?auto_866956 ?auto_866957 ) ( ON ?auto_866955 ?auto_866956 ) ( ON ?auto_866954 ?auto_866955 ) ( ON ?auto_866953 ?auto_866954 ) ( ON ?auto_866952 ?auto_866953 ) ( ON ?auto_866951 ?auto_866952 ) ( CLEAR ?auto_866949 ) ( ON ?auto_866950 ?auto_866951 ) ( CLEAR ?auto_866950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_866948 ?auto_866949 ?auto_866950 )
      ( MAKE-14PILE ?auto_866948 ?auto_866949 ?auto_866950 ?auto_866951 ?auto_866952 ?auto_866953 ?auto_866954 ?auto_866955 ?auto_866956 ?auto_866957 ?auto_866958 ?auto_866959 ?auto_866960 ?auto_866961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_867006 - BLOCK
      ?auto_867007 - BLOCK
      ?auto_867008 - BLOCK
      ?auto_867009 - BLOCK
      ?auto_867010 - BLOCK
      ?auto_867011 - BLOCK
      ?auto_867012 - BLOCK
      ?auto_867013 - BLOCK
      ?auto_867014 - BLOCK
      ?auto_867015 - BLOCK
      ?auto_867016 - BLOCK
      ?auto_867017 - BLOCK
      ?auto_867018 - BLOCK
      ?auto_867019 - BLOCK
    )
    :vars
    (
      ?auto_867020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867019 ?auto_867020 ) ( ON-TABLE ?auto_867006 ) ( not ( = ?auto_867006 ?auto_867007 ) ) ( not ( = ?auto_867006 ?auto_867008 ) ) ( not ( = ?auto_867006 ?auto_867009 ) ) ( not ( = ?auto_867006 ?auto_867010 ) ) ( not ( = ?auto_867006 ?auto_867011 ) ) ( not ( = ?auto_867006 ?auto_867012 ) ) ( not ( = ?auto_867006 ?auto_867013 ) ) ( not ( = ?auto_867006 ?auto_867014 ) ) ( not ( = ?auto_867006 ?auto_867015 ) ) ( not ( = ?auto_867006 ?auto_867016 ) ) ( not ( = ?auto_867006 ?auto_867017 ) ) ( not ( = ?auto_867006 ?auto_867018 ) ) ( not ( = ?auto_867006 ?auto_867019 ) ) ( not ( = ?auto_867006 ?auto_867020 ) ) ( not ( = ?auto_867007 ?auto_867008 ) ) ( not ( = ?auto_867007 ?auto_867009 ) ) ( not ( = ?auto_867007 ?auto_867010 ) ) ( not ( = ?auto_867007 ?auto_867011 ) ) ( not ( = ?auto_867007 ?auto_867012 ) ) ( not ( = ?auto_867007 ?auto_867013 ) ) ( not ( = ?auto_867007 ?auto_867014 ) ) ( not ( = ?auto_867007 ?auto_867015 ) ) ( not ( = ?auto_867007 ?auto_867016 ) ) ( not ( = ?auto_867007 ?auto_867017 ) ) ( not ( = ?auto_867007 ?auto_867018 ) ) ( not ( = ?auto_867007 ?auto_867019 ) ) ( not ( = ?auto_867007 ?auto_867020 ) ) ( not ( = ?auto_867008 ?auto_867009 ) ) ( not ( = ?auto_867008 ?auto_867010 ) ) ( not ( = ?auto_867008 ?auto_867011 ) ) ( not ( = ?auto_867008 ?auto_867012 ) ) ( not ( = ?auto_867008 ?auto_867013 ) ) ( not ( = ?auto_867008 ?auto_867014 ) ) ( not ( = ?auto_867008 ?auto_867015 ) ) ( not ( = ?auto_867008 ?auto_867016 ) ) ( not ( = ?auto_867008 ?auto_867017 ) ) ( not ( = ?auto_867008 ?auto_867018 ) ) ( not ( = ?auto_867008 ?auto_867019 ) ) ( not ( = ?auto_867008 ?auto_867020 ) ) ( not ( = ?auto_867009 ?auto_867010 ) ) ( not ( = ?auto_867009 ?auto_867011 ) ) ( not ( = ?auto_867009 ?auto_867012 ) ) ( not ( = ?auto_867009 ?auto_867013 ) ) ( not ( = ?auto_867009 ?auto_867014 ) ) ( not ( = ?auto_867009 ?auto_867015 ) ) ( not ( = ?auto_867009 ?auto_867016 ) ) ( not ( = ?auto_867009 ?auto_867017 ) ) ( not ( = ?auto_867009 ?auto_867018 ) ) ( not ( = ?auto_867009 ?auto_867019 ) ) ( not ( = ?auto_867009 ?auto_867020 ) ) ( not ( = ?auto_867010 ?auto_867011 ) ) ( not ( = ?auto_867010 ?auto_867012 ) ) ( not ( = ?auto_867010 ?auto_867013 ) ) ( not ( = ?auto_867010 ?auto_867014 ) ) ( not ( = ?auto_867010 ?auto_867015 ) ) ( not ( = ?auto_867010 ?auto_867016 ) ) ( not ( = ?auto_867010 ?auto_867017 ) ) ( not ( = ?auto_867010 ?auto_867018 ) ) ( not ( = ?auto_867010 ?auto_867019 ) ) ( not ( = ?auto_867010 ?auto_867020 ) ) ( not ( = ?auto_867011 ?auto_867012 ) ) ( not ( = ?auto_867011 ?auto_867013 ) ) ( not ( = ?auto_867011 ?auto_867014 ) ) ( not ( = ?auto_867011 ?auto_867015 ) ) ( not ( = ?auto_867011 ?auto_867016 ) ) ( not ( = ?auto_867011 ?auto_867017 ) ) ( not ( = ?auto_867011 ?auto_867018 ) ) ( not ( = ?auto_867011 ?auto_867019 ) ) ( not ( = ?auto_867011 ?auto_867020 ) ) ( not ( = ?auto_867012 ?auto_867013 ) ) ( not ( = ?auto_867012 ?auto_867014 ) ) ( not ( = ?auto_867012 ?auto_867015 ) ) ( not ( = ?auto_867012 ?auto_867016 ) ) ( not ( = ?auto_867012 ?auto_867017 ) ) ( not ( = ?auto_867012 ?auto_867018 ) ) ( not ( = ?auto_867012 ?auto_867019 ) ) ( not ( = ?auto_867012 ?auto_867020 ) ) ( not ( = ?auto_867013 ?auto_867014 ) ) ( not ( = ?auto_867013 ?auto_867015 ) ) ( not ( = ?auto_867013 ?auto_867016 ) ) ( not ( = ?auto_867013 ?auto_867017 ) ) ( not ( = ?auto_867013 ?auto_867018 ) ) ( not ( = ?auto_867013 ?auto_867019 ) ) ( not ( = ?auto_867013 ?auto_867020 ) ) ( not ( = ?auto_867014 ?auto_867015 ) ) ( not ( = ?auto_867014 ?auto_867016 ) ) ( not ( = ?auto_867014 ?auto_867017 ) ) ( not ( = ?auto_867014 ?auto_867018 ) ) ( not ( = ?auto_867014 ?auto_867019 ) ) ( not ( = ?auto_867014 ?auto_867020 ) ) ( not ( = ?auto_867015 ?auto_867016 ) ) ( not ( = ?auto_867015 ?auto_867017 ) ) ( not ( = ?auto_867015 ?auto_867018 ) ) ( not ( = ?auto_867015 ?auto_867019 ) ) ( not ( = ?auto_867015 ?auto_867020 ) ) ( not ( = ?auto_867016 ?auto_867017 ) ) ( not ( = ?auto_867016 ?auto_867018 ) ) ( not ( = ?auto_867016 ?auto_867019 ) ) ( not ( = ?auto_867016 ?auto_867020 ) ) ( not ( = ?auto_867017 ?auto_867018 ) ) ( not ( = ?auto_867017 ?auto_867019 ) ) ( not ( = ?auto_867017 ?auto_867020 ) ) ( not ( = ?auto_867018 ?auto_867019 ) ) ( not ( = ?auto_867018 ?auto_867020 ) ) ( not ( = ?auto_867019 ?auto_867020 ) ) ( ON ?auto_867018 ?auto_867019 ) ( ON ?auto_867017 ?auto_867018 ) ( ON ?auto_867016 ?auto_867017 ) ( ON ?auto_867015 ?auto_867016 ) ( ON ?auto_867014 ?auto_867015 ) ( ON ?auto_867013 ?auto_867014 ) ( ON ?auto_867012 ?auto_867013 ) ( ON ?auto_867011 ?auto_867012 ) ( ON ?auto_867010 ?auto_867011 ) ( ON ?auto_867009 ?auto_867010 ) ( ON ?auto_867008 ?auto_867009 ) ( CLEAR ?auto_867006 ) ( ON ?auto_867007 ?auto_867008 ) ( CLEAR ?auto_867007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_867006 ?auto_867007 )
      ( MAKE-14PILE ?auto_867006 ?auto_867007 ?auto_867008 ?auto_867009 ?auto_867010 ?auto_867011 ?auto_867012 ?auto_867013 ?auto_867014 ?auto_867015 ?auto_867016 ?auto_867017 ?auto_867018 ?auto_867019 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_867064 - BLOCK
      ?auto_867065 - BLOCK
      ?auto_867066 - BLOCK
      ?auto_867067 - BLOCK
      ?auto_867068 - BLOCK
      ?auto_867069 - BLOCK
      ?auto_867070 - BLOCK
      ?auto_867071 - BLOCK
      ?auto_867072 - BLOCK
      ?auto_867073 - BLOCK
      ?auto_867074 - BLOCK
      ?auto_867075 - BLOCK
      ?auto_867076 - BLOCK
      ?auto_867077 - BLOCK
    )
    :vars
    (
      ?auto_867078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867077 ?auto_867078 ) ( not ( = ?auto_867064 ?auto_867065 ) ) ( not ( = ?auto_867064 ?auto_867066 ) ) ( not ( = ?auto_867064 ?auto_867067 ) ) ( not ( = ?auto_867064 ?auto_867068 ) ) ( not ( = ?auto_867064 ?auto_867069 ) ) ( not ( = ?auto_867064 ?auto_867070 ) ) ( not ( = ?auto_867064 ?auto_867071 ) ) ( not ( = ?auto_867064 ?auto_867072 ) ) ( not ( = ?auto_867064 ?auto_867073 ) ) ( not ( = ?auto_867064 ?auto_867074 ) ) ( not ( = ?auto_867064 ?auto_867075 ) ) ( not ( = ?auto_867064 ?auto_867076 ) ) ( not ( = ?auto_867064 ?auto_867077 ) ) ( not ( = ?auto_867064 ?auto_867078 ) ) ( not ( = ?auto_867065 ?auto_867066 ) ) ( not ( = ?auto_867065 ?auto_867067 ) ) ( not ( = ?auto_867065 ?auto_867068 ) ) ( not ( = ?auto_867065 ?auto_867069 ) ) ( not ( = ?auto_867065 ?auto_867070 ) ) ( not ( = ?auto_867065 ?auto_867071 ) ) ( not ( = ?auto_867065 ?auto_867072 ) ) ( not ( = ?auto_867065 ?auto_867073 ) ) ( not ( = ?auto_867065 ?auto_867074 ) ) ( not ( = ?auto_867065 ?auto_867075 ) ) ( not ( = ?auto_867065 ?auto_867076 ) ) ( not ( = ?auto_867065 ?auto_867077 ) ) ( not ( = ?auto_867065 ?auto_867078 ) ) ( not ( = ?auto_867066 ?auto_867067 ) ) ( not ( = ?auto_867066 ?auto_867068 ) ) ( not ( = ?auto_867066 ?auto_867069 ) ) ( not ( = ?auto_867066 ?auto_867070 ) ) ( not ( = ?auto_867066 ?auto_867071 ) ) ( not ( = ?auto_867066 ?auto_867072 ) ) ( not ( = ?auto_867066 ?auto_867073 ) ) ( not ( = ?auto_867066 ?auto_867074 ) ) ( not ( = ?auto_867066 ?auto_867075 ) ) ( not ( = ?auto_867066 ?auto_867076 ) ) ( not ( = ?auto_867066 ?auto_867077 ) ) ( not ( = ?auto_867066 ?auto_867078 ) ) ( not ( = ?auto_867067 ?auto_867068 ) ) ( not ( = ?auto_867067 ?auto_867069 ) ) ( not ( = ?auto_867067 ?auto_867070 ) ) ( not ( = ?auto_867067 ?auto_867071 ) ) ( not ( = ?auto_867067 ?auto_867072 ) ) ( not ( = ?auto_867067 ?auto_867073 ) ) ( not ( = ?auto_867067 ?auto_867074 ) ) ( not ( = ?auto_867067 ?auto_867075 ) ) ( not ( = ?auto_867067 ?auto_867076 ) ) ( not ( = ?auto_867067 ?auto_867077 ) ) ( not ( = ?auto_867067 ?auto_867078 ) ) ( not ( = ?auto_867068 ?auto_867069 ) ) ( not ( = ?auto_867068 ?auto_867070 ) ) ( not ( = ?auto_867068 ?auto_867071 ) ) ( not ( = ?auto_867068 ?auto_867072 ) ) ( not ( = ?auto_867068 ?auto_867073 ) ) ( not ( = ?auto_867068 ?auto_867074 ) ) ( not ( = ?auto_867068 ?auto_867075 ) ) ( not ( = ?auto_867068 ?auto_867076 ) ) ( not ( = ?auto_867068 ?auto_867077 ) ) ( not ( = ?auto_867068 ?auto_867078 ) ) ( not ( = ?auto_867069 ?auto_867070 ) ) ( not ( = ?auto_867069 ?auto_867071 ) ) ( not ( = ?auto_867069 ?auto_867072 ) ) ( not ( = ?auto_867069 ?auto_867073 ) ) ( not ( = ?auto_867069 ?auto_867074 ) ) ( not ( = ?auto_867069 ?auto_867075 ) ) ( not ( = ?auto_867069 ?auto_867076 ) ) ( not ( = ?auto_867069 ?auto_867077 ) ) ( not ( = ?auto_867069 ?auto_867078 ) ) ( not ( = ?auto_867070 ?auto_867071 ) ) ( not ( = ?auto_867070 ?auto_867072 ) ) ( not ( = ?auto_867070 ?auto_867073 ) ) ( not ( = ?auto_867070 ?auto_867074 ) ) ( not ( = ?auto_867070 ?auto_867075 ) ) ( not ( = ?auto_867070 ?auto_867076 ) ) ( not ( = ?auto_867070 ?auto_867077 ) ) ( not ( = ?auto_867070 ?auto_867078 ) ) ( not ( = ?auto_867071 ?auto_867072 ) ) ( not ( = ?auto_867071 ?auto_867073 ) ) ( not ( = ?auto_867071 ?auto_867074 ) ) ( not ( = ?auto_867071 ?auto_867075 ) ) ( not ( = ?auto_867071 ?auto_867076 ) ) ( not ( = ?auto_867071 ?auto_867077 ) ) ( not ( = ?auto_867071 ?auto_867078 ) ) ( not ( = ?auto_867072 ?auto_867073 ) ) ( not ( = ?auto_867072 ?auto_867074 ) ) ( not ( = ?auto_867072 ?auto_867075 ) ) ( not ( = ?auto_867072 ?auto_867076 ) ) ( not ( = ?auto_867072 ?auto_867077 ) ) ( not ( = ?auto_867072 ?auto_867078 ) ) ( not ( = ?auto_867073 ?auto_867074 ) ) ( not ( = ?auto_867073 ?auto_867075 ) ) ( not ( = ?auto_867073 ?auto_867076 ) ) ( not ( = ?auto_867073 ?auto_867077 ) ) ( not ( = ?auto_867073 ?auto_867078 ) ) ( not ( = ?auto_867074 ?auto_867075 ) ) ( not ( = ?auto_867074 ?auto_867076 ) ) ( not ( = ?auto_867074 ?auto_867077 ) ) ( not ( = ?auto_867074 ?auto_867078 ) ) ( not ( = ?auto_867075 ?auto_867076 ) ) ( not ( = ?auto_867075 ?auto_867077 ) ) ( not ( = ?auto_867075 ?auto_867078 ) ) ( not ( = ?auto_867076 ?auto_867077 ) ) ( not ( = ?auto_867076 ?auto_867078 ) ) ( not ( = ?auto_867077 ?auto_867078 ) ) ( ON ?auto_867076 ?auto_867077 ) ( ON ?auto_867075 ?auto_867076 ) ( ON ?auto_867074 ?auto_867075 ) ( ON ?auto_867073 ?auto_867074 ) ( ON ?auto_867072 ?auto_867073 ) ( ON ?auto_867071 ?auto_867072 ) ( ON ?auto_867070 ?auto_867071 ) ( ON ?auto_867069 ?auto_867070 ) ( ON ?auto_867068 ?auto_867069 ) ( ON ?auto_867067 ?auto_867068 ) ( ON ?auto_867066 ?auto_867067 ) ( ON ?auto_867065 ?auto_867066 ) ( ON ?auto_867064 ?auto_867065 ) ( CLEAR ?auto_867064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_867064 )
      ( MAKE-14PILE ?auto_867064 ?auto_867065 ?auto_867066 ?auto_867067 ?auto_867068 ?auto_867069 ?auto_867070 ?auto_867071 ?auto_867072 ?auto_867073 ?auto_867074 ?auto_867075 ?auto_867076 ?auto_867077 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867123 - BLOCK
      ?auto_867124 - BLOCK
      ?auto_867125 - BLOCK
      ?auto_867126 - BLOCK
      ?auto_867127 - BLOCK
      ?auto_867128 - BLOCK
      ?auto_867129 - BLOCK
      ?auto_867130 - BLOCK
      ?auto_867131 - BLOCK
      ?auto_867132 - BLOCK
      ?auto_867133 - BLOCK
      ?auto_867134 - BLOCK
      ?auto_867135 - BLOCK
      ?auto_867136 - BLOCK
      ?auto_867137 - BLOCK
    )
    :vars
    (
      ?auto_867138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_867136 ) ( ON ?auto_867137 ?auto_867138 ) ( CLEAR ?auto_867137 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_867123 ) ( ON ?auto_867124 ?auto_867123 ) ( ON ?auto_867125 ?auto_867124 ) ( ON ?auto_867126 ?auto_867125 ) ( ON ?auto_867127 ?auto_867126 ) ( ON ?auto_867128 ?auto_867127 ) ( ON ?auto_867129 ?auto_867128 ) ( ON ?auto_867130 ?auto_867129 ) ( ON ?auto_867131 ?auto_867130 ) ( ON ?auto_867132 ?auto_867131 ) ( ON ?auto_867133 ?auto_867132 ) ( ON ?auto_867134 ?auto_867133 ) ( ON ?auto_867135 ?auto_867134 ) ( ON ?auto_867136 ?auto_867135 ) ( not ( = ?auto_867123 ?auto_867124 ) ) ( not ( = ?auto_867123 ?auto_867125 ) ) ( not ( = ?auto_867123 ?auto_867126 ) ) ( not ( = ?auto_867123 ?auto_867127 ) ) ( not ( = ?auto_867123 ?auto_867128 ) ) ( not ( = ?auto_867123 ?auto_867129 ) ) ( not ( = ?auto_867123 ?auto_867130 ) ) ( not ( = ?auto_867123 ?auto_867131 ) ) ( not ( = ?auto_867123 ?auto_867132 ) ) ( not ( = ?auto_867123 ?auto_867133 ) ) ( not ( = ?auto_867123 ?auto_867134 ) ) ( not ( = ?auto_867123 ?auto_867135 ) ) ( not ( = ?auto_867123 ?auto_867136 ) ) ( not ( = ?auto_867123 ?auto_867137 ) ) ( not ( = ?auto_867123 ?auto_867138 ) ) ( not ( = ?auto_867124 ?auto_867125 ) ) ( not ( = ?auto_867124 ?auto_867126 ) ) ( not ( = ?auto_867124 ?auto_867127 ) ) ( not ( = ?auto_867124 ?auto_867128 ) ) ( not ( = ?auto_867124 ?auto_867129 ) ) ( not ( = ?auto_867124 ?auto_867130 ) ) ( not ( = ?auto_867124 ?auto_867131 ) ) ( not ( = ?auto_867124 ?auto_867132 ) ) ( not ( = ?auto_867124 ?auto_867133 ) ) ( not ( = ?auto_867124 ?auto_867134 ) ) ( not ( = ?auto_867124 ?auto_867135 ) ) ( not ( = ?auto_867124 ?auto_867136 ) ) ( not ( = ?auto_867124 ?auto_867137 ) ) ( not ( = ?auto_867124 ?auto_867138 ) ) ( not ( = ?auto_867125 ?auto_867126 ) ) ( not ( = ?auto_867125 ?auto_867127 ) ) ( not ( = ?auto_867125 ?auto_867128 ) ) ( not ( = ?auto_867125 ?auto_867129 ) ) ( not ( = ?auto_867125 ?auto_867130 ) ) ( not ( = ?auto_867125 ?auto_867131 ) ) ( not ( = ?auto_867125 ?auto_867132 ) ) ( not ( = ?auto_867125 ?auto_867133 ) ) ( not ( = ?auto_867125 ?auto_867134 ) ) ( not ( = ?auto_867125 ?auto_867135 ) ) ( not ( = ?auto_867125 ?auto_867136 ) ) ( not ( = ?auto_867125 ?auto_867137 ) ) ( not ( = ?auto_867125 ?auto_867138 ) ) ( not ( = ?auto_867126 ?auto_867127 ) ) ( not ( = ?auto_867126 ?auto_867128 ) ) ( not ( = ?auto_867126 ?auto_867129 ) ) ( not ( = ?auto_867126 ?auto_867130 ) ) ( not ( = ?auto_867126 ?auto_867131 ) ) ( not ( = ?auto_867126 ?auto_867132 ) ) ( not ( = ?auto_867126 ?auto_867133 ) ) ( not ( = ?auto_867126 ?auto_867134 ) ) ( not ( = ?auto_867126 ?auto_867135 ) ) ( not ( = ?auto_867126 ?auto_867136 ) ) ( not ( = ?auto_867126 ?auto_867137 ) ) ( not ( = ?auto_867126 ?auto_867138 ) ) ( not ( = ?auto_867127 ?auto_867128 ) ) ( not ( = ?auto_867127 ?auto_867129 ) ) ( not ( = ?auto_867127 ?auto_867130 ) ) ( not ( = ?auto_867127 ?auto_867131 ) ) ( not ( = ?auto_867127 ?auto_867132 ) ) ( not ( = ?auto_867127 ?auto_867133 ) ) ( not ( = ?auto_867127 ?auto_867134 ) ) ( not ( = ?auto_867127 ?auto_867135 ) ) ( not ( = ?auto_867127 ?auto_867136 ) ) ( not ( = ?auto_867127 ?auto_867137 ) ) ( not ( = ?auto_867127 ?auto_867138 ) ) ( not ( = ?auto_867128 ?auto_867129 ) ) ( not ( = ?auto_867128 ?auto_867130 ) ) ( not ( = ?auto_867128 ?auto_867131 ) ) ( not ( = ?auto_867128 ?auto_867132 ) ) ( not ( = ?auto_867128 ?auto_867133 ) ) ( not ( = ?auto_867128 ?auto_867134 ) ) ( not ( = ?auto_867128 ?auto_867135 ) ) ( not ( = ?auto_867128 ?auto_867136 ) ) ( not ( = ?auto_867128 ?auto_867137 ) ) ( not ( = ?auto_867128 ?auto_867138 ) ) ( not ( = ?auto_867129 ?auto_867130 ) ) ( not ( = ?auto_867129 ?auto_867131 ) ) ( not ( = ?auto_867129 ?auto_867132 ) ) ( not ( = ?auto_867129 ?auto_867133 ) ) ( not ( = ?auto_867129 ?auto_867134 ) ) ( not ( = ?auto_867129 ?auto_867135 ) ) ( not ( = ?auto_867129 ?auto_867136 ) ) ( not ( = ?auto_867129 ?auto_867137 ) ) ( not ( = ?auto_867129 ?auto_867138 ) ) ( not ( = ?auto_867130 ?auto_867131 ) ) ( not ( = ?auto_867130 ?auto_867132 ) ) ( not ( = ?auto_867130 ?auto_867133 ) ) ( not ( = ?auto_867130 ?auto_867134 ) ) ( not ( = ?auto_867130 ?auto_867135 ) ) ( not ( = ?auto_867130 ?auto_867136 ) ) ( not ( = ?auto_867130 ?auto_867137 ) ) ( not ( = ?auto_867130 ?auto_867138 ) ) ( not ( = ?auto_867131 ?auto_867132 ) ) ( not ( = ?auto_867131 ?auto_867133 ) ) ( not ( = ?auto_867131 ?auto_867134 ) ) ( not ( = ?auto_867131 ?auto_867135 ) ) ( not ( = ?auto_867131 ?auto_867136 ) ) ( not ( = ?auto_867131 ?auto_867137 ) ) ( not ( = ?auto_867131 ?auto_867138 ) ) ( not ( = ?auto_867132 ?auto_867133 ) ) ( not ( = ?auto_867132 ?auto_867134 ) ) ( not ( = ?auto_867132 ?auto_867135 ) ) ( not ( = ?auto_867132 ?auto_867136 ) ) ( not ( = ?auto_867132 ?auto_867137 ) ) ( not ( = ?auto_867132 ?auto_867138 ) ) ( not ( = ?auto_867133 ?auto_867134 ) ) ( not ( = ?auto_867133 ?auto_867135 ) ) ( not ( = ?auto_867133 ?auto_867136 ) ) ( not ( = ?auto_867133 ?auto_867137 ) ) ( not ( = ?auto_867133 ?auto_867138 ) ) ( not ( = ?auto_867134 ?auto_867135 ) ) ( not ( = ?auto_867134 ?auto_867136 ) ) ( not ( = ?auto_867134 ?auto_867137 ) ) ( not ( = ?auto_867134 ?auto_867138 ) ) ( not ( = ?auto_867135 ?auto_867136 ) ) ( not ( = ?auto_867135 ?auto_867137 ) ) ( not ( = ?auto_867135 ?auto_867138 ) ) ( not ( = ?auto_867136 ?auto_867137 ) ) ( not ( = ?auto_867136 ?auto_867138 ) ) ( not ( = ?auto_867137 ?auto_867138 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_867137 ?auto_867138 )
      ( !STACK ?auto_867137 ?auto_867136 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867185 - BLOCK
      ?auto_867186 - BLOCK
      ?auto_867187 - BLOCK
      ?auto_867188 - BLOCK
      ?auto_867189 - BLOCK
      ?auto_867190 - BLOCK
      ?auto_867191 - BLOCK
      ?auto_867192 - BLOCK
      ?auto_867193 - BLOCK
      ?auto_867194 - BLOCK
      ?auto_867195 - BLOCK
      ?auto_867196 - BLOCK
      ?auto_867197 - BLOCK
      ?auto_867198 - BLOCK
      ?auto_867199 - BLOCK
    )
    :vars
    (
      ?auto_867200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867199 ?auto_867200 ) ( ON-TABLE ?auto_867185 ) ( ON ?auto_867186 ?auto_867185 ) ( ON ?auto_867187 ?auto_867186 ) ( ON ?auto_867188 ?auto_867187 ) ( ON ?auto_867189 ?auto_867188 ) ( ON ?auto_867190 ?auto_867189 ) ( ON ?auto_867191 ?auto_867190 ) ( ON ?auto_867192 ?auto_867191 ) ( ON ?auto_867193 ?auto_867192 ) ( ON ?auto_867194 ?auto_867193 ) ( ON ?auto_867195 ?auto_867194 ) ( ON ?auto_867196 ?auto_867195 ) ( ON ?auto_867197 ?auto_867196 ) ( not ( = ?auto_867185 ?auto_867186 ) ) ( not ( = ?auto_867185 ?auto_867187 ) ) ( not ( = ?auto_867185 ?auto_867188 ) ) ( not ( = ?auto_867185 ?auto_867189 ) ) ( not ( = ?auto_867185 ?auto_867190 ) ) ( not ( = ?auto_867185 ?auto_867191 ) ) ( not ( = ?auto_867185 ?auto_867192 ) ) ( not ( = ?auto_867185 ?auto_867193 ) ) ( not ( = ?auto_867185 ?auto_867194 ) ) ( not ( = ?auto_867185 ?auto_867195 ) ) ( not ( = ?auto_867185 ?auto_867196 ) ) ( not ( = ?auto_867185 ?auto_867197 ) ) ( not ( = ?auto_867185 ?auto_867198 ) ) ( not ( = ?auto_867185 ?auto_867199 ) ) ( not ( = ?auto_867185 ?auto_867200 ) ) ( not ( = ?auto_867186 ?auto_867187 ) ) ( not ( = ?auto_867186 ?auto_867188 ) ) ( not ( = ?auto_867186 ?auto_867189 ) ) ( not ( = ?auto_867186 ?auto_867190 ) ) ( not ( = ?auto_867186 ?auto_867191 ) ) ( not ( = ?auto_867186 ?auto_867192 ) ) ( not ( = ?auto_867186 ?auto_867193 ) ) ( not ( = ?auto_867186 ?auto_867194 ) ) ( not ( = ?auto_867186 ?auto_867195 ) ) ( not ( = ?auto_867186 ?auto_867196 ) ) ( not ( = ?auto_867186 ?auto_867197 ) ) ( not ( = ?auto_867186 ?auto_867198 ) ) ( not ( = ?auto_867186 ?auto_867199 ) ) ( not ( = ?auto_867186 ?auto_867200 ) ) ( not ( = ?auto_867187 ?auto_867188 ) ) ( not ( = ?auto_867187 ?auto_867189 ) ) ( not ( = ?auto_867187 ?auto_867190 ) ) ( not ( = ?auto_867187 ?auto_867191 ) ) ( not ( = ?auto_867187 ?auto_867192 ) ) ( not ( = ?auto_867187 ?auto_867193 ) ) ( not ( = ?auto_867187 ?auto_867194 ) ) ( not ( = ?auto_867187 ?auto_867195 ) ) ( not ( = ?auto_867187 ?auto_867196 ) ) ( not ( = ?auto_867187 ?auto_867197 ) ) ( not ( = ?auto_867187 ?auto_867198 ) ) ( not ( = ?auto_867187 ?auto_867199 ) ) ( not ( = ?auto_867187 ?auto_867200 ) ) ( not ( = ?auto_867188 ?auto_867189 ) ) ( not ( = ?auto_867188 ?auto_867190 ) ) ( not ( = ?auto_867188 ?auto_867191 ) ) ( not ( = ?auto_867188 ?auto_867192 ) ) ( not ( = ?auto_867188 ?auto_867193 ) ) ( not ( = ?auto_867188 ?auto_867194 ) ) ( not ( = ?auto_867188 ?auto_867195 ) ) ( not ( = ?auto_867188 ?auto_867196 ) ) ( not ( = ?auto_867188 ?auto_867197 ) ) ( not ( = ?auto_867188 ?auto_867198 ) ) ( not ( = ?auto_867188 ?auto_867199 ) ) ( not ( = ?auto_867188 ?auto_867200 ) ) ( not ( = ?auto_867189 ?auto_867190 ) ) ( not ( = ?auto_867189 ?auto_867191 ) ) ( not ( = ?auto_867189 ?auto_867192 ) ) ( not ( = ?auto_867189 ?auto_867193 ) ) ( not ( = ?auto_867189 ?auto_867194 ) ) ( not ( = ?auto_867189 ?auto_867195 ) ) ( not ( = ?auto_867189 ?auto_867196 ) ) ( not ( = ?auto_867189 ?auto_867197 ) ) ( not ( = ?auto_867189 ?auto_867198 ) ) ( not ( = ?auto_867189 ?auto_867199 ) ) ( not ( = ?auto_867189 ?auto_867200 ) ) ( not ( = ?auto_867190 ?auto_867191 ) ) ( not ( = ?auto_867190 ?auto_867192 ) ) ( not ( = ?auto_867190 ?auto_867193 ) ) ( not ( = ?auto_867190 ?auto_867194 ) ) ( not ( = ?auto_867190 ?auto_867195 ) ) ( not ( = ?auto_867190 ?auto_867196 ) ) ( not ( = ?auto_867190 ?auto_867197 ) ) ( not ( = ?auto_867190 ?auto_867198 ) ) ( not ( = ?auto_867190 ?auto_867199 ) ) ( not ( = ?auto_867190 ?auto_867200 ) ) ( not ( = ?auto_867191 ?auto_867192 ) ) ( not ( = ?auto_867191 ?auto_867193 ) ) ( not ( = ?auto_867191 ?auto_867194 ) ) ( not ( = ?auto_867191 ?auto_867195 ) ) ( not ( = ?auto_867191 ?auto_867196 ) ) ( not ( = ?auto_867191 ?auto_867197 ) ) ( not ( = ?auto_867191 ?auto_867198 ) ) ( not ( = ?auto_867191 ?auto_867199 ) ) ( not ( = ?auto_867191 ?auto_867200 ) ) ( not ( = ?auto_867192 ?auto_867193 ) ) ( not ( = ?auto_867192 ?auto_867194 ) ) ( not ( = ?auto_867192 ?auto_867195 ) ) ( not ( = ?auto_867192 ?auto_867196 ) ) ( not ( = ?auto_867192 ?auto_867197 ) ) ( not ( = ?auto_867192 ?auto_867198 ) ) ( not ( = ?auto_867192 ?auto_867199 ) ) ( not ( = ?auto_867192 ?auto_867200 ) ) ( not ( = ?auto_867193 ?auto_867194 ) ) ( not ( = ?auto_867193 ?auto_867195 ) ) ( not ( = ?auto_867193 ?auto_867196 ) ) ( not ( = ?auto_867193 ?auto_867197 ) ) ( not ( = ?auto_867193 ?auto_867198 ) ) ( not ( = ?auto_867193 ?auto_867199 ) ) ( not ( = ?auto_867193 ?auto_867200 ) ) ( not ( = ?auto_867194 ?auto_867195 ) ) ( not ( = ?auto_867194 ?auto_867196 ) ) ( not ( = ?auto_867194 ?auto_867197 ) ) ( not ( = ?auto_867194 ?auto_867198 ) ) ( not ( = ?auto_867194 ?auto_867199 ) ) ( not ( = ?auto_867194 ?auto_867200 ) ) ( not ( = ?auto_867195 ?auto_867196 ) ) ( not ( = ?auto_867195 ?auto_867197 ) ) ( not ( = ?auto_867195 ?auto_867198 ) ) ( not ( = ?auto_867195 ?auto_867199 ) ) ( not ( = ?auto_867195 ?auto_867200 ) ) ( not ( = ?auto_867196 ?auto_867197 ) ) ( not ( = ?auto_867196 ?auto_867198 ) ) ( not ( = ?auto_867196 ?auto_867199 ) ) ( not ( = ?auto_867196 ?auto_867200 ) ) ( not ( = ?auto_867197 ?auto_867198 ) ) ( not ( = ?auto_867197 ?auto_867199 ) ) ( not ( = ?auto_867197 ?auto_867200 ) ) ( not ( = ?auto_867198 ?auto_867199 ) ) ( not ( = ?auto_867198 ?auto_867200 ) ) ( not ( = ?auto_867199 ?auto_867200 ) ) ( CLEAR ?auto_867197 ) ( ON ?auto_867198 ?auto_867199 ) ( CLEAR ?auto_867198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_867185 ?auto_867186 ?auto_867187 ?auto_867188 ?auto_867189 ?auto_867190 ?auto_867191 ?auto_867192 ?auto_867193 ?auto_867194 ?auto_867195 ?auto_867196 ?auto_867197 ?auto_867198 )
      ( MAKE-15PILE ?auto_867185 ?auto_867186 ?auto_867187 ?auto_867188 ?auto_867189 ?auto_867190 ?auto_867191 ?auto_867192 ?auto_867193 ?auto_867194 ?auto_867195 ?auto_867196 ?auto_867197 ?auto_867198 ?auto_867199 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867247 - BLOCK
      ?auto_867248 - BLOCK
      ?auto_867249 - BLOCK
      ?auto_867250 - BLOCK
      ?auto_867251 - BLOCK
      ?auto_867252 - BLOCK
      ?auto_867253 - BLOCK
      ?auto_867254 - BLOCK
      ?auto_867255 - BLOCK
      ?auto_867256 - BLOCK
      ?auto_867257 - BLOCK
      ?auto_867258 - BLOCK
      ?auto_867259 - BLOCK
      ?auto_867260 - BLOCK
      ?auto_867261 - BLOCK
    )
    :vars
    (
      ?auto_867262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867261 ?auto_867262 ) ( ON-TABLE ?auto_867247 ) ( ON ?auto_867248 ?auto_867247 ) ( ON ?auto_867249 ?auto_867248 ) ( ON ?auto_867250 ?auto_867249 ) ( ON ?auto_867251 ?auto_867250 ) ( ON ?auto_867252 ?auto_867251 ) ( ON ?auto_867253 ?auto_867252 ) ( ON ?auto_867254 ?auto_867253 ) ( ON ?auto_867255 ?auto_867254 ) ( ON ?auto_867256 ?auto_867255 ) ( ON ?auto_867257 ?auto_867256 ) ( ON ?auto_867258 ?auto_867257 ) ( not ( = ?auto_867247 ?auto_867248 ) ) ( not ( = ?auto_867247 ?auto_867249 ) ) ( not ( = ?auto_867247 ?auto_867250 ) ) ( not ( = ?auto_867247 ?auto_867251 ) ) ( not ( = ?auto_867247 ?auto_867252 ) ) ( not ( = ?auto_867247 ?auto_867253 ) ) ( not ( = ?auto_867247 ?auto_867254 ) ) ( not ( = ?auto_867247 ?auto_867255 ) ) ( not ( = ?auto_867247 ?auto_867256 ) ) ( not ( = ?auto_867247 ?auto_867257 ) ) ( not ( = ?auto_867247 ?auto_867258 ) ) ( not ( = ?auto_867247 ?auto_867259 ) ) ( not ( = ?auto_867247 ?auto_867260 ) ) ( not ( = ?auto_867247 ?auto_867261 ) ) ( not ( = ?auto_867247 ?auto_867262 ) ) ( not ( = ?auto_867248 ?auto_867249 ) ) ( not ( = ?auto_867248 ?auto_867250 ) ) ( not ( = ?auto_867248 ?auto_867251 ) ) ( not ( = ?auto_867248 ?auto_867252 ) ) ( not ( = ?auto_867248 ?auto_867253 ) ) ( not ( = ?auto_867248 ?auto_867254 ) ) ( not ( = ?auto_867248 ?auto_867255 ) ) ( not ( = ?auto_867248 ?auto_867256 ) ) ( not ( = ?auto_867248 ?auto_867257 ) ) ( not ( = ?auto_867248 ?auto_867258 ) ) ( not ( = ?auto_867248 ?auto_867259 ) ) ( not ( = ?auto_867248 ?auto_867260 ) ) ( not ( = ?auto_867248 ?auto_867261 ) ) ( not ( = ?auto_867248 ?auto_867262 ) ) ( not ( = ?auto_867249 ?auto_867250 ) ) ( not ( = ?auto_867249 ?auto_867251 ) ) ( not ( = ?auto_867249 ?auto_867252 ) ) ( not ( = ?auto_867249 ?auto_867253 ) ) ( not ( = ?auto_867249 ?auto_867254 ) ) ( not ( = ?auto_867249 ?auto_867255 ) ) ( not ( = ?auto_867249 ?auto_867256 ) ) ( not ( = ?auto_867249 ?auto_867257 ) ) ( not ( = ?auto_867249 ?auto_867258 ) ) ( not ( = ?auto_867249 ?auto_867259 ) ) ( not ( = ?auto_867249 ?auto_867260 ) ) ( not ( = ?auto_867249 ?auto_867261 ) ) ( not ( = ?auto_867249 ?auto_867262 ) ) ( not ( = ?auto_867250 ?auto_867251 ) ) ( not ( = ?auto_867250 ?auto_867252 ) ) ( not ( = ?auto_867250 ?auto_867253 ) ) ( not ( = ?auto_867250 ?auto_867254 ) ) ( not ( = ?auto_867250 ?auto_867255 ) ) ( not ( = ?auto_867250 ?auto_867256 ) ) ( not ( = ?auto_867250 ?auto_867257 ) ) ( not ( = ?auto_867250 ?auto_867258 ) ) ( not ( = ?auto_867250 ?auto_867259 ) ) ( not ( = ?auto_867250 ?auto_867260 ) ) ( not ( = ?auto_867250 ?auto_867261 ) ) ( not ( = ?auto_867250 ?auto_867262 ) ) ( not ( = ?auto_867251 ?auto_867252 ) ) ( not ( = ?auto_867251 ?auto_867253 ) ) ( not ( = ?auto_867251 ?auto_867254 ) ) ( not ( = ?auto_867251 ?auto_867255 ) ) ( not ( = ?auto_867251 ?auto_867256 ) ) ( not ( = ?auto_867251 ?auto_867257 ) ) ( not ( = ?auto_867251 ?auto_867258 ) ) ( not ( = ?auto_867251 ?auto_867259 ) ) ( not ( = ?auto_867251 ?auto_867260 ) ) ( not ( = ?auto_867251 ?auto_867261 ) ) ( not ( = ?auto_867251 ?auto_867262 ) ) ( not ( = ?auto_867252 ?auto_867253 ) ) ( not ( = ?auto_867252 ?auto_867254 ) ) ( not ( = ?auto_867252 ?auto_867255 ) ) ( not ( = ?auto_867252 ?auto_867256 ) ) ( not ( = ?auto_867252 ?auto_867257 ) ) ( not ( = ?auto_867252 ?auto_867258 ) ) ( not ( = ?auto_867252 ?auto_867259 ) ) ( not ( = ?auto_867252 ?auto_867260 ) ) ( not ( = ?auto_867252 ?auto_867261 ) ) ( not ( = ?auto_867252 ?auto_867262 ) ) ( not ( = ?auto_867253 ?auto_867254 ) ) ( not ( = ?auto_867253 ?auto_867255 ) ) ( not ( = ?auto_867253 ?auto_867256 ) ) ( not ( = ?auto_867253 ?auto_867257 ) ) ( not ( = ?auto_867253 ?auto_867258 ) ) ( not ( = ?auto_867253 ?auto_867259 ) ) ( not ( = ?auto_867253 ?auto_867260 ) ) ( not ( = ?auto_867253 ?auto_867261 ) ) ( not ( = ?auto_867253 ?auto_867262 ) ) ( not ( = ?auto_867254 ?auto_867255 ) ) ( not ( = ?auto_867254 ?auto_867256 ) ) ( not ( = ?auto_867254 ?auto_867257 ) ) ( not ( = ?auto_867254 ?auto_867258 ) ) ( not ( = ?auto_867254 ?auto_867259 ) ) ( not ( = ?auto_867254 ?auto_867260 ) ) ( not ( = ?auto_867254 ?auto_867261 ) ) ( not ( = ?auto_867254 ?auto_867262 ) ) ( not ( = ?auto_867255 ?auto_867256 ) ) ( not ( = ?auto_867255 ?auto_867257 ) ) ( not ( = ?auto_867255 ?auto_867258 ) ) ( not ( = ?auto_867255 ?auto_867259 ) ) ( not ( = ?auto_867255 ?auto_867260 ) ) ( not ( = ?auto_867255 ?auto_867261 ) ) ( not ( = ?auto_867255 ?auto_867262 ) ) ( not ( = ?auto_867256 ?auto_867257 ) ) ( not ( = ?auto_867256 ?auto_867258 ) ) ( not ( = ?auto_867256 ?auto_867259 ) ) ( not ( = ?auto_867256 ?auto_867260 ) ) ( not ( = ?auto_867256 ?auto_867261 ) ) ( not ( = ?auto_867256 ?auto_867262 ) ) ( not ( = ?auto_867257 ?auto_867258 ) ) ( not ( = ?auto_867257 ?auto_867259 ) ) ( not ( = ?auto_867257 ?auto_867260 ) ) ( not ( = ?auto_867257 ?auto_867261 ) ) ( not ( = ?auto_867257 ?auto_867262 ) ) ( not ( = ?auto_867258 ?auto_867259 ) ) ( not ( = ?auto_867258 ?auto_867260 ) ) ( not ( = ?auto_867258 ?auto_867261 ) ) ( not ( = ?auto_867258 ?auto_867262 ) ) ( not ( = ?auto_867259 ?auto_867260 ) ) ( not ( = ?auto_867259 ?auto_867261 ) ) ( not ( = ?auto_867259 ?auto_867262 ) ) ( not ( = ?auto_867260 ?auto_867261 ) ) ( not ( = ?auto_867260 ?auto_867262 ) ) ( not ( = ?auto_867261 ?auto_867262 ) ) ( ON ?auto_867260 ?auto_867261 ) ( CLEAR ?auto_867258 ) ( ON ?auto_867259 ?auto_867260 ) ( CLEAR ?auto_867259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_867247 ?auto_867248 ?auto_867249 ?auto_867250 ?auto_867251 ?auto_867252 ?auto_867253 ?auto_867254 ?auto_867255 ?auto_867256 ?auto_867257 ?auto_867258 ?auto_867259 )
      ( MAKE-15PILE ?auto_867247 ?auto_867248 ?auto_867249 ?auto_867250 ?auto_867251 ?auto_867252 ?auto_867253 ?auto_867254 ?auto_867255 ?auto_867256 ?auto_867257 ?auto_867258 ?auto_867259 ?auto_867260 ?auto_867261 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867309 - BLOCK
      ?auto_867310 - BLOCK
      ?auto_867311 - BLOCK
      ?auto_867312 - BLOCK
      ?auto_867313 - BLOCK
      ?auto_867314 - BLOCK
      ?auto_867315 - BLOCK
      ?auto_867316 - BLOCK
      ?auto_867317 - BLOCK
      ?auto_867318 - BLOCK
      ?auto_867319 - BLOCK
      ?auto_867320 - BLOCK
      ?auto_867321 - BLOCK
      ?auto_867322 - BLOCK
      ?auto_867323 - BLOCK
    )
    :vars
    (
      ?auto_867324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867323 ?auto_867324 ) ( ON-TABLE ?auto_867309 ) ( ON ?auto_867310 ?auto_867309 ) ( ON ?auto_867311 ?auto_867310 ) ( ON ?auto_867312 ?auto_867311 ) ( ON ?auto_867313 ?auto_867312 ) ( ON ?auto_867314 ?auto_867313 ) ( ON ?auto_867315 ?auto_867314 ) ( ON ?auto_867316 ?auto_867315 ) ( ON ?auto_867317 ?auto_867316 ) ( ON ?auto_867318 ?auto_867317 ) ( ON ?auto_867319 ?auto_867318 ) ( not ( = ?auto_867309 ?auto_867310 ) ) ( not ( = ?auto_867309 ?auto_867311 ) ) ( not ( = ?auto_867309 ?auto_867312 ) ) ( not ( = ?auto_867309 ?auto_867313 ) ) ( not ( = ?auto_867309 ?auto_867314 ) ) ( not ( = ?auto_867309 ?auto_867315 ) ) ( not ( = ?auto_867309 ?auto_867316 ) ) ( not ( = ?auto_867309 ?auto_867317 ) ) ( not ( = ?auto_867309 ?auto_867318 ) ) ( not ( = ?auto_867309 ?auto_867319 ) ) ( not ( = ?auto_867309 ?auto_867320 ) ) ( not ( = ?auto_867309 ?auto_867321 ) ) ( not ( = ?auto_867309 ?auto_867322 ) ) ( not ( = ?auto_867309 ?auto_867323 ) ) ( not ( = ?auto_867309 ?auto_867324 ) ) ( not ( = ?auto_867310 ?auto_867311 ) ) ( not ( = ?auto_867310 ?auto_867312 ) ) ( not ( = ?auto_867310 ?auto_867313 ) ) ( not ( = ?auto_867310 ?auto_867314 ) ) ( not ( = ?auto_867310 ?auto_867315 ) ) ( not ( = ?auto_867310 ?auto_867316 ) ) ( not ( = ?auto_867310 ?auto_867317 ) ) ( not ( = ?auto_867310 ?auto_867318 ) ) ( not ( = ?auto_867310 ?auto_867319 ) ) ( not ( = ?auto_867310 ?auto_867320 ) ) ( not ( = ?auto_867310 ?auto_867321 ) ) ( not ( = ?auto_867310 ?auto_867322 ) ) ( not ( = ?auto_867310 ?auto_867323 ) ) ( not ( = ?auto_867310 ?auto_867324 ) ) ( not ( = ?auto_867311 ?auto_867312 ) ) ( not ( = ?auto_867311 ?auto_867313 ) ) ( not ( = ?auto_867311 ?auto_867314 ) ) ( not ( = ?auto_867311 ?auto_867315 ) ) ( not ( = ?auto_867311 ?auto_867316 ) ) ( not ( = ?auto_867311 ?auto_867317 ) ) ( not ( = ?auto_867311 ?auto_867318 ) ) ( not ( = ?auto_867311 ?auto_867319 ) ) ( not ( = ?auto_867311 ?auto_867320 ) ) ( not ( = ?auto_867311 ?auto_867321 ) ) ( not ( = ?auto_867311 ?auto_867322 ) ) ( not ( = ?auto_867311 ?auto_867323 ) ) ( not ( = ?auto_867311 ?auto_867324 ) ) ( not ( = ?auto_867312 ?auto_867313 ) ) ( not ( = ?auto_867312 ?auto_867314 ) ) ( not ( = ?auto_867312 ?auto_867315 ) ) ( not ( = ?auto_867312 ?auto_867316 ) ) ( not ( = ?auto_867312 ?auto_867317 ) ) ( not ( = ?auto_867312 ?auto_867318 ) ) ( not ( = ?auto_867312 ?auto_867319 ) ) ( not ( = ?auto_867312 ?auto_867320 ) ) ( not ( = ?auto_867312 ?auto_867321 ) ) ( not ( = ?auto_867312 ?auto_867322 ) ) ( not ( = ?auto_867312 ?auto_867323 ) ) ( not ( = ?auto_867312 ?auto_867324 ) ) ( not ( = ?auto_867313 ?auto_867314 ) ) ( not ( = ?auto_867313 ?auto_867315 ) ) ( not ( = ?auto_867313 ?auto_867316 ) ) ( not ( = ?auto_867313 ?auto_867317 ) ) ( not ( = ?auto_867313 ?auto_867318 ) ) ( not ( = ?auto_867313 ?auto_867319 ) ) ( not ( = ?auto_867313 ?auto_867320 ) ) ( not ( = ?auto_867313 ?auto_867321 ) ) ( not ( = ?auto_867313 ?auto_867322 ) ) ( not ( = ?auto_867313 ?auto_867323 ) ) ( not ( = ?auto_867313 ?auto_867324 ) ) ( not ( = ?auto_867314 ?auto_867315 ) ) ( not ( = ?auto_867314 ?auto_867316 ) ) ( not ( = ?auto_867314 ?auto_867317 ) ) ( not ( = ?auto_867314 ?auto_867318 ) ) ( not ( = ?auto_867314 ?auto_867319 ) ) ( not ( = ?auto_867314 ?auto_867320 ) ) ( not ( = ?auto_867314 ?auto_867321 ) ) ( not ( = ?auto_867314 ?auto_867322 ) ) ( not ( = ?auto_867314 ?auto_867323 ) ) ( not ( = ?auto_867314 ?auto_867324 ) ) ( not ( = ?auto_867315 ?auto_867316 ) ) ( not ( = ?auto_867315 ?auto_867317 ) ) ( not ( = ?auto_867315 ?auto_867318 ) ) ( not ( = ?auto_867315 ?auto_867319 ) ) ( not ( = ?auto_867315 ?auto_867320 ) ) ( not ( = ?auto_867315 ?auto_867321 ) ) ( not ( = ?auto_867315 ?auto_867322 ) ) ( not ( = ?auto_867315 ?auto_867323 ) ) ( not ( = ?auto_867315 ?auto_867324 ) ) ( not ( = ?auto_867316 ?auto_867317 ) ) ( not ( = ?auto_867316 ?auto_867318 ) ) ( not ( = ?auto_867316 ?auto_867319 ) ) ( not ( = ?auto_867316 ?auto_867320 ) ) ( not ( = ?auto_867316 ?auto_867321 ) ) ( not ( = ?auto_867316 ?auto_867322 ) ) ( not ( = ?auto_867316 ?auto_867323 ) ) ( not ( = ?auto_867316 ?auto_867324 ) ) ( not ( = ?auto_867317 ?auto_867318 ) ) ( not ( = ?auto_867317 ?auto_867319 ) ) ( not ( = ?auto_867317 ?auto_867320 ) ) ( not ( = ?auto_867317 ?auto_867321 ) ) ( not ( = ?auto_867317 ?auto_867322 ) ) ( not ( = ?auto_867317 ?auto_867323 ) ) ( not ( = ?auto_867317 ?auto_867324 ) ) ( not ( = ?auto_867318 ?auto_867319 ) ) ( not ( = ?auto_867318 ?auto_867320 ) ) ( not ( = ?auto_867318 ?auto_867321 ) ) ( not ( = ?auto_867318 ?auto_867322 ) ) ( not ( = ?auto_867318 ?auto_867323 ) ) ( not ( = ?auto_867318 ?auto_867324 ) ) ( not ( = ?auto_867319 ?auto_867320 ) ) ( not ( = ?auto_867319 ?auto_867321 ) ) ( not ( = ?auto_867319 ?auto_867322 ) ) ( not ( = ?auto_867319 ?auto_867323 ) ) ( not ( = ?auto_867319 ?auto_867324 ) ) ( not ( = ?auto_867320 ?auto_867321 ) ) ( not ( = ?auto_867320 ?auto_867322 ) ) ( not ( = ?auto_867320 ?auto_867323 ) ) ( not ( = ?auto_867320 ?auto_867324 ) ) ( not ( = ?auto_867321 ?auto_867322 ) ) ( not ( = ?auto_867321 ?auto_867323 ) ) ( not ( = ?auto_867321 ?auto_867324 ) ) ( not ( = ?auto_867322 ?auto_867323 ) ) ( not ( = ?auto_867322 ?auto_867324 ) ) ( not ( = ?auto_867323 ?auto_867324 ) ) ( ON ?auto_867322 ?auto_867323 ) ( ON ?auto_867321 ?auto_867322 ) ( CLEAR ?auto_867319 ) ( ON ?auto_867320 ?auto_867321 ) ( CLEAR ?auto_867320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_867309 ?auto_867310 ?auto_867311 ?auto_867312 ?auto_867313 ?auto_867314 ?auto_867315 ?auto_867316 ?auto_867317 ?auto_867318 ?auto_867319 ?auto_867320 )
      ( MAKE-15PILE ?auto_867309 ?auto_867310 ?auto_867311 ?auto_867312 ?auto_867313 ?auto_867314 ?auto_867315 ?auto_867316 ?auto_867317 ?auto_867318 ?auto_867319 ?auto_867320 ?auto_867321 ?auto_867322 ?auto_867323 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867371 - BLOCK
      ?auto_867372 - BLOCK
      ?auto_867373 - BLOCK
      ?auto_867374 - BLOCK
      ?auto_867375 - BLOCK
      ?auto_867376 - BLOCK
      ?auto_867377 - BLOCK
      ?auto_867378 - BLOCK
      ?auto_867379 - BLOCK
      ?auto_867380 - BLOCK
      ?auto_867381 - BLOCK
      ?auto_867382 - BLOCK
      ?auto_867383 - BLOCK
      ?auto_867384 - BLOCK
      ?auto_867385 - BLOCK
    )
    :vars
    (
      ?auto_867386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867385 ?auto_867386 ) ( ON-TABLE ?auto_867371 ) ( ON ?auto_867372 ?auto_867371 ) ( ON ?auto_867373 ?auto_867372 ) ( ON ?auto_867374 ?auto_867373 ) ( ON ?auto_867375 ?auto_867374 ) ( ON ?auto_867376 ?auto_867375 ) ( ON ?auto_867377 ?auto_867376 ) ( ON ?auto_867378 ?auto_867377 ) ( ON ?auto_867379 ?auto_867378 ) ( ON ?auto_867380 ?auto_867379 ) ( not ( = ?auto_867371 ?auto_867372 ) ) ( not ( = ?auto_867371 ?auto_867373 ) ) ( not ( = ?auto_867371 ?auto_867374 ) ) ( not ( = ?auto_867371 ?auto_867375 ) ) ( not ( = ?auto_867371 ?auto_867376 ) ) ( not ( = ?auto_867371 ?auto_867377 ) ) ( not ( = ?auto_867371 ?auto_867378 ) ) ( not ( = ?auto_867371 ?auto_867379 ) ) ( not ( = ?auto_867371 ?auto_867380 ) ) ( not ( = ?auto_867371 ?auto_867381 ) ) ( not ( = ?auto_867371 ?auto_867382 ) ) ( not ( = ?auto_867371 ?auto_867383 ) ) ( not ( = ?auto_867371 ?auto_867384 ) ) ( not ( = ?auto_867371 ?auto_867385 ) ) ( not ( = ?auto_867371 ?auto_867386 ) ) ( not ( = ?auto_867372 ?auto_867373 ) ) ( not ( = ?auto_867372 ?auto_867374 ) ) ( not ( = ?auto_867372 ?auto_867375 ) ) ( not ( = ?auto_867372 ?auto_867376 ) ) ( not ( = ?auto_867372 ?auto_867377 ) ) ( not ( = ?auto_867372 ?auto_867378 ) ) ( not ( = ?auto_867372 ?auto_867379 ) ) ( not ( = ?auto_867372 ?auto_867380 ) ) ( not ( = ?auto_867372 ?auto_867381 ) ) ( not ( = ?auto_867372 ?auto_867382 ) ) ( not ( = ?auto_867372 ?auto_867383 ) ) ( not ( = ?auto_867372 ?auto_867384 ) ) ( not ( = ?auto_867372 ?auto_867385 ) ) ( not ( = ?auto_867372 ?auto_867386 ) ) ( not ( = ?auto_867373 ?auto_867374 ) ) ( not ( = ?auto_867373 ?auto_867375 ) ) ( not ( = ?auto_867373 ?auto_867376 ) ) ( not ( = ?auto_867373 ?auto_867377 ) ) ( not ( = ?auto_867373 ?auto_867378 ) ) ( not ( = ?auto_867373 ?auto_867379 ) ) ( not ( = ?auto_867373 ?auto_867380 ) ) ( not ( = ?auto_867373 ?auto_867381 ) ) ( not ( = ?auto_867373 ?auto_867382 ) ) ( not ( = ?auto_867373 ?auto_867383 ) ) ( not ( = ?auto_867373 ?auto_867384 ) ) ( not ( = ?auto_867373 ?auto_867385 ) ) ( not ( = ?auto_867373 ?auto_867386 ) ) ( not ( = ?auto_867374 ?auto_867375 ) ) ( not ( = ?auto_867374 ?auto_867376 ) ) ( not ( = ?auto_867374 ?auto_867377 ) ) ( not ( = ?auto_867374 ?auto_867378 ) ) ( not ( = ?auto_867374 ?auto_867379 ) ) ( not ( = ?auto_867374 ?auto_867380 ) ) ( not ( = ?auto_867374 ?auto_867381 ) ) ( not ( = ?auto_867374 ?auto_867382 ) ) ( not ( = ?auto_867374 ?auto_867383 ) ) ( not ( = ?auto_867374 ?auto_867384 ) ) ( not ( = ?auto_867374 ?auto_867385 ) ) ( not ( = ?auto_867374 ?auto_867386 ) ) ( not ( = ?auto_867375 ?auto_867376 ) ) ( not ( = ?auto_867375 ?auto_867377 ) ) ( not ( = ?auto_867375 ?auto_867378 ) ) ( not ( = ?auto_867375 ?auto_867379 ) ) ( not ( = ?auto_867375 ?auto_867380 ) ) ( not ( = ?auto_867375 ?auto_867381 ) ) ( not ( = ?auto_867375 ?auto_867382 ) ) ( not ( = ?auto_867375 ?auto_867383 ) ) ( not ( = ?auto_867375 ?auto_867384 ) ) ( not ( = ?auto_867375 ?auto_867385 ) ) ( not ( = ?auto_867375 ?auto_867386 ) ) ( not ( = ?auto_867376 ?auto_867377 ) ) ( not ( = ?auto_867376 ?auto_867378 ) ) ( not ( = ?auto_867376 ?auto_867379 ) ) ( not ( = ?auto_867376 ?auto_867380 ) ) ( not ( = ?auto_867376 ?auto_867381 ) ) ( not ( = ?auto_867376 ?auto_867382 ) ) ( not ( = ?auto_867376 ?auto_867383 ) ) ( not ( = ?auto_867376 ?auto_867384 ) ) ( not ( = ?auto_867376 ?auto_867385 ) ) ( not ( = ?auto_867376 ?auto_867386 ) ) ( not ( = ?auto_867377 ?auto_867378 ) ) ( not ( = ?auto_867377 ?auto_867379 ) ) ( not ( = ?auto_867377 ?auto_867380 ) ) ( not ( = ?auto_867377 ?auto_867381 ) ) ( not ( = ?auto_867377 ?auto_867382 ) ) ( not ( = ?auto_867377 ?auto_867383 ) ) ( not ( = ?auto_867377 ?auto_867384 ) ) ( not ( = ?auto_867377 ?auto_867385 ) ) ( not ( = ?auto_867377 ?auto_867386 ) ) ( not ( = ?auto_867378 ?auto_867379 ) ) ( not ( = ?auto_867378 ?auto_867380 ) ) ( not ( = ?auto_867378 ?auto_867381 ) ) ( not ( = ?auto_867378 ?auto_867382 ) ) ( not ( = ?auto_867378 ?auto_867383 ) ) ( not ( = ?auto_867378 ?auto_867384 ) ) ( not ( = ?auto_867378 ?auto_867385 ) ) ( not ( = ?auto_867378 ?auto_867386 ) ) ( not ( = ?auto_867379 ?auto_867380 ) ) ( not ( = ?auto_867379 ?auto_867381 ) ) ( not ( = ?auto_867379 ?auto_867382 ) ) ( not ( = ?auto_867379 ?auto_867383 ) ) ( not ( = ?auto_867379 ?auto_867384 ) ) ( not ( = ?auto_867379 ?auto_867385 ) ) ( not ( = ?auto_867379 ?auto_867386 ) ) ( not ( = ?auto_867380 ?auto_867381 ) ) ( not ( = ?auto_867380 ?auto_867382 ) ) ( not ( = ?auto_867380 ?auto_867383 ) ) ( not ( = ?auto_867380 ?auto_867384 ) ) ( not ( = ?auto_867380 ?auto_867385 ) ) ( not ( = ?auto_867380 ?auto_867386 ) ) ( not ( = ?auto_867381 ?auto_867382 ) ) ( not ( = ?auto_867381 ?auto_867383 ) ) ( not ( = ?auto_867381 ?auto_867384 ) ) ( not ( = ?auto_867381 ?auto_867385 ) ) ( not ( = ?auto_867381 ?auto_867386 ) ) ( not ( = ?auto_867382 ?auto_867383 ) ) ( not ( = ?auto_867382 ?auto_867384 ) ) ( not ( = ?auto_867382 ?auto_867385 ) ) ( not ( = ?auto_867382 ?auto_867386 ) ) ( not ( = ?auto_867383 ?auto_867384 ) ) ( not ( = ?auto_867383 ?auto_867385 ) ) ( not ( = ?auto_867383 ?auto_867386 ) ) ( not ( = ?auto_867384 ?auto_867385 ) ) ( not ( = ?auto_867384 ?auto_867386 ) ) ( not ( = ?auto_867385 ?auto_867386 ) ) ( ON ?auto_867384 ?auto_867385 ) ( ON ?auto_867383 ?auto_867384 ) ( ON ?auto_867382 ?auto_867383 ) ( CLEAR ?auto_867380 ) ( ON ?auto_867381 ?auto_867382 ) ( CLEAR ?auto_867381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_867371 ?auto_867372 ?auto_867373 ?auto_867374 ?auto_867375 ?auto_867376 ?auto_867377 ?auto_867378 ?auto_867379 ?auto_867380 ?auto_867381 )
      ( MAKE-15PILE ?auto_867371 ?auto_867372 ?auto_867373 ?auto_867374 ?auto_867375 ?auto_867376 ?auto_867377 ?auto_867378 ?auto_867379 ?auto_867380 ?auto_867381 ?auto_867382 ?auto_867383 ?auto_867384 ?auto_867385 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867433 - BLOCK
      ?auto_867434 - BLOCK
      ?auto_867435 - BLOCK
      ?auto_867436 - BLOCK
      ?auto_867437 - BLOCK
      ?auto_867438 - BLOCK
      ?auto_867439 - BLOCK
      ?auto_867440 - BLOCK
      ?auto_867441 - BLOCK
      ?auto_867442 - BLOCK
      ?auto_867443 - BLOCK
      ?auto_867444 - BLOCK
      ?auto_867445 - BLOCK
      ?auto_867446 - BLOCK
      ?auto_867447 - BLOCK
    )
    :vars
    (
      ?auto_867448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867447 ?auto_867448 ) ( ON-TABLE ?auto_867433 ) ( ON ?auto_867434 ?auto_867433 ) ( ON ?auto_867435 ?auto_867434 ) ( ON ?auto_867436 ?auto_867435 ) ( ON ?auto_867437 ?auto_867436 ) ( ON ?auto_867438 ?auto_867437 ) ( ON ?auto_867439 ?auto_867438 ) ( ON ?auto_867440 ?auto_867439 ) ( ON ?auto_867441 ?auto_867440 ) ( not ( = ?auto_867433 ?auto_867434 ) ) ( not ( = ?auto_867433 ?auto_867435 ) ) ( not ( = ?auto_867433 ?auto_867436 ) ) ( not ( = ?auto_867433 ?auto_867437 ) ) ( not ( = ?auto_867433 ?auto_867438 ) ) ( not ( = ?auto_867433 ?auto_867439 ) ) ( not ( = ?auto_867433 ?auto_867440 ) ) ( not ( = ?auto_867433 ?auto_867441 ) ) ( not ( = ?auto_867433 ?auto_867442 ) ) ( not ( = ?auto_867433 ?auto_867443 ) ) ( not ( = ?auto_867433 ?auto_867444 ) ) ( not ( = ?auto_867433 ?auto_867445 ) ) ( not ( = ?auto_867433 ?auto_867446 ) ) ( not ( = ?auto_867433 ?auto_867447 ) ) ( not ( = ?auto_867433 ?auto_867448 ) ) ( not ( = ?auto_867434 ?auto_867435 ) ) ( not ( = ?auto_867434 ?auto_867436 ) ) ( not ( = ?auto_867434 ?auto_867437 ) ) ( not ( = ?auto_867434 ?auto_867438 ) ) ( not ( = ?auto_867434 ?auto_867439 ) ) ( not ( = ?auto_867434 ?auto_867440 ) ) ( not ( = ?auto_867434 ?auto_867441 ) ) ( not ( = ?auto_867434 ?auto_867442 ) ) ( not ( = ?auto_867434 ?auto_867443 ) ) ( not ( = ?auto_867434 ?auto_867444 ) ) ( not ( = ?auto_867434 ?auto_867445 ) ) ( not ( = ?auto_867434 ?auto_867446 ) ) ( not ( = ?auto_867434 ?auto_867447 ) ) ( not ( = ?auto_867434 ?auto_867448 ) ) ( not ( = ?auto_867435 ?auto_867436 ) ) ( not ( = ?auto_867435 ?auto_867437 ) ) ( not ( = ?auto_867435 ?auto_867438 ) ) ( not ( = ?auto_867435 ?auto_867439 ) ) ( not ( = ?auto_867435 ?auto_867440 ) ) ( not ( = ?auto_867435 ?auto_867441 ) ) ( not ( = ?auto_867435 ?auto_867442 ) ) ( not ( = ?auto_867435 ?auto_867443 ) ) ( not ( = ?auto_867435 ?auto_867444 ) ) ( not ( = ?auto_867435 ?auto_867445 ) ) ( not ( = ?auto_867435 ?auto_867446 ) ) ( not ( = ?auto_867435 ?auto_867447 ) ) ( not ( = ?auto_867435 ?auto_867448 ) ) ( not ( = ?auto_867436 ?auto_867437 ) ) ( not ( = ?auto_867436 ?auto_867438 ) ) ( not ( = ?auto_867436 ?auto_867439 ) ) ( not ( = ?auto_867436 ?auto_867440 ) ) ( not ( = ?auto_867436 ?auto_867441 ) ) ( not ( = ?auto_867436 ?auto_867442 ) ) ( not ( = ?auto_867436 ?auto_867443 ) ) ( not ( = ?auto_867436 ?auto_867444 ) ) ( not ( = ?auto_867436 ?auto_867445 ) ) ( not ( = ?auto_867436 ?auto_867446 ) ) ( not ( = ?auto_867436 ?auto_867447 ) ) ( not ( = ?auto_867436 ?auto_867448 ) ) ( not ( = ?auto_867437 ?auto_867438 ) ) ( not ( = ?auto_867437 ?auto_867439 ) ) ( not ( = ?auto_867437 ?auto_867440 ) ) ( not ( = ?auto_867437 ?auto_867441 ) ) ( not ( = ?auto_867437 ?auto_867442 ) ) ( not ( = ?auto_867437 ?auto_867443 ) ) ( not ( = ?auto_867437 ?auto_867444 ) ) ( not ( = ?auto_867437 ?auto_867445 ) ) ( not ( = ?auto_867437 ?auto_867446 ) ) ( not ( = ?auto_867437 ?auto_867447 ) ) ( not ( = ?auto_867437 ?auto_867448 ) ) ( not ( = ?auto_867438 ?auto_867439 ) ) ( not ( = ?auto_867438 ?auto_867440 ) ) ( not ( = ?auto_867438 ?auto_867441 ) ) ( not ( = ?auto_867438 ?auto_867442 ) ) ( not ( = ?auto_867438 ?auto_867443 ) ) ( not ( = ?auto_867438 ?auto_867444 ) ) ( not ( = ?auto_867438 ?auto_867445 ) ) ( not ( = ?auto_867438 ?auto_867446 ) ) ( not ( = ?auto_867438 ?auto_867447 ) ) ( not ( = ?auto_867438 ?auto_867448 ) ) ( not ( = ?auto_867439 ?auto_867440 ) ) ( not ( = ?auto_867439 ?auto_867441 ) ) ( not ( = ?auto_867439 ?auto_867442 ) ) ( not ( = ?auto_867439 ?auto_867443 ) ) ( not ( = ?auto_867439 ?auto_867444 ) ) ( not ( = ?auto_867439 ?auto_867445 ) ) ( not ( = ?auto_867439 ?auto_867446 ) ) ( not ( = ?auto_867439 ?auto_867447 ) ) ( not ( = ?auto_867439 ?auto_867448 ) ) ( not ( = ?auto_867440 ?auto_867441 ) ) ( not ( = ?auto_867440 ?auto_867442 ) ) ( not ( = ?auto_867440 ?auto_867443 ) ) ( not ( = ?auto_867440 ?auto_867444 ) ) ( not ( = ?auto_867440 ?auto_867445 ) ) ( not ( = ?auto_867440 ?auto_867446 ) ) ( not ( = ?auto_867440 ?auto_867447 ) ) ( not ( = ?auto_867440 ?auto_867448 ) ) ( not ( = ?auto_867441 ?auto_867442 ) ) ( not ( = ?auto_867441 ?auto_867443 ) ) ( not ( = ?auto_867441 ?auto_867444 ) ) ( not ( = ?auto_867441 ?auto_867445 ) ) ( not ( = ?auto_867441 ?auto_867446 ) ) ( not ( = ?auto_867441 ?auto_867447 ) ) ( not ( = ?auto_867441 ?auto_867448 ) ) ( not ( = ?auto_867442 ?auto_867443 ) ) ( not ( = ?auto_867442 ?auto_867444 ) ) ( not ( = ?auto_867442 ?auto_867445 ) ) ( not ( = ?auto_867442 ?auto_867446 ) ) ( not ( = ?auto_867442 ?auto_867447 ) ) ( not ( = ?auto_867442 ?auto_867448 ) ) ( not ( = ?auto_867443 ?auto_867444 ) ) ( not ( = ?auto_867443 ?auto_867445 ) ) ( not ( = ?auto_867443 ?auto_867446 ) ) ( not ( = ?auto_867443 ?auto_867447 ) ) ( not ( = ?auto_867443 ?auto_867448 ) ) ( not ( = ?auto_867444 ?auto_867445 ) ) ( not ( = ?auto_867444 ?auto_867446 ) ) ( not ( = ?auto_867444 ?auto_867447 ) ) ( not ( = ?auto_867444 ?auto_867448 ) ) ( not ( = ?auto_867445 ?auto_867446 ) ) ( not ( = ?auto_867445 ?auto_867447 ) ) ( not ( = ?auto_867445 ?auto_867448 ) ) ( not ( = ?auto_867446 ?auto_867447 ) ) ( not ( = ?auto_867446 ?auto_867448 ) ) ( not ( = ?auto_867447 ?auto_867448 ) ) ( ON ?auto_867446 ?auto_867447 ) ( ON ?auto_867445 ?auto_867446 ) ( ON ?auto_867444 ?auto_867445 ) ( ON ?auto_867443 ?auto_867444 ) ( CLEAR ?auto_867441 ) ( ON ?auto_867442 ?auto_867443 ) ( CLEAR ?auto_867442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_867433 ?auto_867434 ?auto_867435 ?auto_867436 ?auto_867437 ?auto_867438 ?auto_867439 ?auto_867440 ?auto_867441 ?auto_867442 )
      ( MAKE-15PILE ?auto_867433 ?auto_867434 ?auto_867435 ?auto_867436 ?auto_867437 ?auto_867438 ?auto_867439 ?auto_867440 ?auto_867441 ?auto_867442 ?auto_867443 ?auto_867444 ?auto_867445 ?auto_867446 ?auto_867447 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867495 - BLOCK
      ?auto_867496 - BLOCK
      ?auto_867497 - BLOCK
      ?auto_867498 - BLOCK
      ?auto_867499 - BLOCK
      ?auto_867500 - BLOCK
      ?auto_867501 - BLOCK
      ?auto_867502 - BLOCK
      ?auto_867503 - BLOCK
      ?auto_867504 - BLOCK
      ?auto_867505 - BLOCK
      ?auto_867506 - BLOCK
      ?auto_867507 - BLOCK
      ?auto_867508 - BLOCK
      ?auto_867509 - BLOCK
    )
    :vars
    (
      ?auto_867510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867509 ?auto_867510 ) ( ON-TABLE ?auto_867495 ) ( ON ?auto_867496 ?auto_867495 ) ( ON ?auto_867497 ?auto_867496 ) ( ON ?auto_867498 ?auto_867497 ) ( ON ?auto_867499 ?auto_867498 ) ( ON ?auto_867500 ?auto_867499 ) ( ON ?auto_867501 ?auto_867500 ) ( ON ?auto_867502 ?auto_867501 ) ( not ( = ?auto_867495 ?auto_867496 ) ) ( not ( = ?auto_867495 ?auto_867497 ) ) ( not ( = ?auto_867495 ?auto_867498 ) ) ( not ( = ?auto_867495 ?auto_867499 ) ) ( not ( = ?auto_867495 ?auto_867500 ) ) ( not ( = ?auto_867495 ?auto_867501 ) ) ( not ( = ?auto_867495 ?auto_867502 ) ) ( not ( = ?auto_867495 ?auto_867503 ) ) ( not ( = ?auto_867495 ?auto_867504 ) ) ( not ( = ?auto_867495 ?auto_867505 ) ) ( not ( = ?auto_867495 ?auto_867506 ) ) ( not ( = ?auto_867495 ?auto_867507 ) ) ( not ( = ?auto_867495 ?auto_867508 ) ) ( not ( = ?auto_867495 ?auto_867509 ) ) ( not ( = ?auto_867495 ?auto_867510 ) ) ( not ( = ?auto_867496 ?auto_867497 ) ) ( not ( = ?auto_867496 ?auto_867498 ) ) ( not ( = ?auto_867496 ?auto_867499 ) ) ( not ( = ?auto_867496 ?auto_867500 ) ) ( not ( = ?auto_867496 ?auto_867501 ) ) ( not ( = ?auto_867496 ?auto_867502 ) ) ( not ( = ?auto_867496 ?auto_867503 ) ) ( not ( = ?auto_867496 ?auto_867504 ) ) ( not ( = ?auto_867496 ?auto_867505 ) ) ( not ( = ?auto_867496 ?auto_867506 ) ) ( not ( = ?auto_867496 ?auto_867507 ) ) ( not ( = ?auto_867496 ?auto_867508 ) ) ( not ( = ?auto_867496 ?auto_867509 ) ) ( not ( = ?auto_867496 ?auto_867510 ) ) ( not ( = ?auto_867497 ?auto_867498 ) ) ( not ( = ?auto_867497 ?auto_867499 ) ) ( not ( = ?auto_867497 ?auto_867500 ) ) ( not ( = ?auto_867497 ?auto_867501 ) ) ( not ( = ?auto_867497 ?auto_867502 ) ) ( not ( = ?auto_867497 ?auto_867503 ) ) ( not ( = ?auto_867497 ?auto_867504 ) ) ( not ( = ?auto_867497 ?auto_867505 ) ) ( not ( = ?auto_867497 ?auto_867506 ) ) ( not ( = ?auto_867497 ?auto_867507 ) ) ( not ( = ?auto_867497 ?auto_867508 ) ) ( not ( = ?auto_867497 ?auto_867509 ) ) ( not ( = ?auto_867497 ?auto_867510 ) ) ( not ( = ?auto_867498 ?auto_867499 ) ) ( not ( = ?auto_867498 ?auto_867500 ) ) ( not ( = ?auto_867498 ?auto_867501 ) ) ( not ( = ?auto_867498 ?auto_867502 ) ) ( not ( = ?auto_867498 ?auto_867503 ) ) ( not ( = ?auto_867498 ?auto_867504 ) ) ( not ( = ?auto_867498 ?auto_867505 ) ) ( not ( = ?auto_867498 ?auto_867506 ) ) ( not ( = ?auto_867498 ?auto_867507 ) ) ( not ( = ?auto_867498 ?auto_867508 ) ) ( not ( = ?auto_867498 ?auto_867509 ) ) ( not ( = ?auto_867498 ?auto_867510 ) ) ( not ( = ?auto_867499 ?auto_867500 ) ) ( not ( = ?auto_867499 ?auto_867501 ) ) ( not ( = ?auto_867499 ?auto_867502 ) ) ( not ( = ?auto_867499 ?auto_867503 ) ) ( not ( = ?auto_867499 ?auto_867504 ) ) ( not ( = ?auto_867499 ?auto_867505 ) ) ( not ( = ?auto_867499 ?auto_867506 ) ) ( not ( = ?auto_867499 ?auto_867507 ) ) ( not ( = ?auto_867499 ?auto_867508 ) ) ( not ( = ?auto_867499 ?auto_867509 ) ) ( not ( = ?auto_867499 ?auto_867510 ) ) ( not ( = ?auto_867500 ?auto_867501 ) ) ( not ( = ?auto_867500 ?auto_867502 ) ) ( not ( = ?auto_867500 ?auto_867503 ) ) ( not ( = ?auto_867500 ?auto_867504 ) ) ( not ( = ?auto_867500 ?auto_867505 ) ) ( not ( = ?auto_867500 ?auto_867506 ) ) ( not ( = ?auto_867500 ?auto_867507 ) ) ( not ( = ?auto_867500 ?auto_867508 ) ) ( not ( = ?auto_867500 ?auto_867509 ) ) ( not ( = ?auto_867500 ?auto_867510 ) ) ( not ( = ?auto_867501 ?auto_867502 ) ) ( not ( = ?auto_867501 ?auto_867503 ) ) ( not ( = ?auto_867501 ?auto_867504 ) ) ( not ( = ?auto_867501 ?auto_867505 ) ) ( not ( = ?auto_867501 ?auto_867506 ) ) ( not ( = ?auto_867501 ?auto_867507 ) ) ( not ( = ?auto_867501 ?auto_867508 ) ) ( not ( = ?auto_867501 ?auto_867509 ) ) ( not ( = ?auto_867501 ?auto_867510 ) ) ( not ( = ?auto_867502 ?auto_867503 ) ) ( not ( = ?auto_867502 ?auto_867504 ) ) ( not ( = ?auto_867502 ?auto_867505 ) ) ( not ( = ?auto_867502 ?auto_867506 ) ) ( not ( = ?auto_867502 ?auto_867507 ) ) ( not ( = ?auto_867502 ?auto_867508 ) ) ( not ( = ?auto_867502 ?auto_867509 ) ) ( not ( = ?auto_867502 ?auto_867510 ) ) ( not ( = ?auto_867503 ?auto_867504 ) ) ( not ( = ?auto_867503 ?auto_867505 ) ) ( not ( = ?auto_867503 ?auto_867506 ) ) ( not ( = ?auto_867503 ?auto_867507 ) ) ( not ( = ?auto_867503 ?auto_867508 ) ) ( not ( = ?auto_867503 ?auto_867509 ) ) ( not ( = ?auto_867503 ?auto_867510 ) ) ( not ( = ?auto_867504 ?auto_867505 ) ) ( not ( = ?auto_867504 ?auto_867506 ) ) ( not ( = ?auto_867504 ?auto_867507 ) ) ( not ( = ?auto_867504 ?auto_867508 ) ) ( not ( = ?auto_867504 ?auto_867509 ) ) ( not ( = ?auto_867504 ?auto_867510 ) ) ( not ( = ?auto_867505 ?auto_867506 ) ) ( not ( = ?auto_867505 ?auto_867507 ) ) ( not ( = ?auto_867505 ?auto_867508 ) ) ( not ( = ?auto_867505 ?auto_867509 ) ) ( not ( = ?auto_867505 ?auto_867510 ) ) ( not ( = ?auto_867506 ?auto_867507 ) ) ( not ( = ?auto_867506 ?auto_867508 ) ) ( not ( = ?auto_867506 ?auto_867509 ) ) ( not ( = ?auto_867506 ?auto_867510 ) ) ( not ( = ?auto_867507 ?auto_867508 ) ) ( not ( = ?auto_867507 ?auto_867509 ) ) ( not ( = ?auto_867507 ?auto_867510 ) ) ( not ( = ?auto_867508 ?auto_867509 ) ) ( not ( = ?auto_867508 ?auto_867510 ) ) ( not ( = ?auto_867509 ?auto_867510 ) ) ( ON ?auto_867508 ?auto_867509 ) ( ON ?auto_867507 ?auto_867508 ) ( ON ?auto_867506 ?auto_867507 ) ( ON ?auto_867505 ?auto_867506 ) ( ON ?auto_867504 ?auto_867505 ) ( CLEAR ?auto_867502 ) ( ON ?auto_867503 ?auto_867504 ) ( CLEAR ?auto_867503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_867495 ?auto_867496 ?auto_867497 ?auto_867498 ?auto_867499 ?auto_867500 ?auto_867501 ?auto_867502 ?auto_867503 )
      ( MAKE-15PILE ?auto_867495 ?auto_867496 ?auto_867497 ?auto_867498 ?auto_867499 ?auto_867500 ?auto_867501 ?auto_867502 ?auto_867503 ?auto_867504 ?auto_867505 ?auto_867506 ?auto_867507 ?auto_867508 ?auto_867509 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867557 - BLOCK
      ?auto_867558 - BLOCK
      ?auto_867559 - BLOCK
      ?auto_867560 - BLOCK
      ?auto_867561 - BLOCK
      ?auto_867562 - BLOCK
      ?auto_867563 - BLOCK
      ?auto_867564 - BLOCK
      ?auto_867565 - BLOCK
      ?auto_867566 - BLOCK
      ?auto_867567 - BLOCK
      ?auto_867568 - BLOCK
      ?auto_867569 - BLOCK
      ?auto_867570 - BLOCK
      ?auto_867571 - BLOCK
    )
    :vars
    (
      ?auto_867572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867571 ?auto_867572 ) ( ON-TABLE ?auto_867557 ) ( ON ?auto_867558 ?auto_867557 ) ( ON ?auto_867559 ?auto_867558 ) ( ON ?auto_867560 ?auto_867559 ) ( ON ?auto_867561 ?auto_867560 ) ( ON ?auto_867562 ?auto_867561 ) ( ON ?auto_867563 ?auto_867562 ) ( not ( = ?auto_867557 ?auto_867558 ) ) ( not ( = ?auto_867557 ?auto_867559 ) ) ( not ( = ?auto_867557 ?auto_867560 ) ) ( not ( = ?auto_867557 ?auto_867561 ) ) ( not ( = ?auto_867557 ?auto_867562 ) ) ( not ( = ?auto_867557 ?auto_867563 ) ) ( not ( = ?auto_867557 ?auto_867564 ) ) ( not ( = ?auto_867557 ?auto_867565 ) ) ( not ( = ?auto_867557 ?auto_867566 ) ) ( not ( = ?auto_867557 ?auto_867567 ) ) ( not ( = ?auto_867557 ?auto_867568 ) ) ( not ( = ?auto_867557 ?auto_867569 ) ) ( not ( = ?auto_867557 ?auto_867570 ) ) ( not ( = ?auto_867557 ?auto_867571 ) ) ( not ( = ?auto_867557 ?auto_867572 ) ) ( not ( = ?auto_867558 ?auto_867559 ) ) ( not ( = ?auto_867558 ?auto_867560 ) ) ( not ( = ?auto_867558 ?auto_867561 ) ) ( not ( = ?auto_867558 ?auto_867562 ) ) ( not ( = ?auto_867558 ?auto_867563 ) ) ( not ( = ?auto_867558 ?auto_867564 ) ) ( not ( = ?auto_867558 ?auto_867565 ) ) ( not ( = ?auto_867558 ?auto_867566 ) ) ( not ( = ?auto_867558 ?auto_867567 ) ) ( not ( = ?auto_867558 ?auto_867568 ) ) ( not ( = ?auto_867558 ?auto_867569 ) ) ( not ( = ?auto_867558 ?auto_867570 ) ) ( not ( = ?auto_867558 ?auto_867571 ) ) ( not ( = ?auto_867558 ?auto_867572 ) ) ( not ( = ?auto_867559 ?auto_867560 ) ) ( not ( = ?auto_867559 ?auto_867561 ) ) ( not ( = ?auto_867559 ?auto_867562 ) ) ( not ( = ?auto_867559 ?auto_867563 ) ) ( not ( = ?auto_867559 ?auto_867564 ) ) ( not ( = ?auto_867559 ?auto_867565 ) ) ( not ( = ?auto_867559 ?auto_867566 ) ) ( not ( = ?auto_867559 ?auto_867567 ) ) ( not ( = ?auto_867559 ?auto_867568 ) ) ( not ( = ?auto_867559 ?auto_867569 ) ) ( not ( = ?auto_867559 ?auto_867570 ) ) ( not ( = ?auto_867559 ?auto_867571 ) ) ( not ( = ?auto_867559 ?auto_867572 ) ) ( not ( = ?auto_867560 ?auto_867561 ) ) ( not ( = ?auto_867560 ?auto_867562 ) ) ( not ( = ?auto_867560 ?auto_867563 ) ) ( not ( = ?auto_867560 ?auto_867564 ) ) ( not ( = ?auto_867560 ?auto_867565 ) ) ( not ( = ?auto_867560 ?auto_867566 ) ) ( not ( = ?auto_867560 ?auto_867567 ) ) ( not ( = ?auto_867560 ?auto_867568 ) ) ( not ( = ?auto_867560 ?auto_867569 ) ) ( not ( = ?auto_867560 ?auto_867570 ) ) ( not ( = ?auto_867560 ?auto_867571 ) ) ( not ( = ?auto_867560 ?auto_867572 ) ) ( not ( = ?auto_867561 ?auto_867562 ) ) ( not ( = ?auto_867561 ?auto_867563 ) ) ( not ( = ?auto_867561 ?auto_867564 ) ) ( not ( = ?auto_867561 ?auto_867565 ) ) ( not ( = ?auto_867561 ?auto_867566 ) ) ( not ( = ?auto_867561 ?auto_867567 ) ) ( not ( = ?auto_867561 ?auto_867568 ) ) ( not ( = ?auto_867561 ?auto_867569 ) ) ( not ( = ?auto_867561 ?auto_867570 ) ) ( not ( = ?auto_867561 ?auto_867571 ) ) ( not ( = ?auto_867561 ?auto_867572 ) ) ( not ( = ?auto_867562 ?auto_867563 ) ) ( not ( = ?auto_867562 ?auto_867564 ) ) ( not ( = ?auto_867562 ?auto_867565 ) ) ( not ( = ?auto_867562 ?auto_867566 ) ) ( not ( = ?auto_867562 ?auto_867567 ) ) ( not ( = ?auto_867562 ?auto_867568 ) ) ( not ( = ?auto_867562 ?auto_867569 ) ) ( not ( = ?auto_867562 ?auto_867570 ) ) ( not ( = ?auto_867562 ?auto_867571 ) ) ( not ( = ?auto_867562 ?auto_867572 ) ) ( not ( = ?auto_867563 ?auto_867564 ) ) ( not ( = ?auto_867563 ?auto_867565 ) ) ( not ( = ?auto_867563 ?auto_867566 ) ) ( not ( = ?auto_867563 ?auto_867567 ) ) ( not ( = ?auto_867563 ?auto_867568 ) ) ( not ( = ?auto_867563 ?auto_867569 ) ) ( not ( = ?auto_867563 ?auto_867570 ) ) ( not ( = ?auto_867563 ?auto_867571 ) ) ( not ( = ?auto_867563 ?auto_867572 ) ) ( not ( = ?auto_867564 ?auto_867565 ) ) ( not ( = ?auto_867564 ?auto_867566 ) ) ( not ( = ?auto_867564 ?auto_867567 ) ) ( not ( = ?auto_867564 ?auto_867568 ) ) ( not ( = ?auto_867564 ?auto_867569 ) ) ( not ( = ?auto_867564 ?auto_867570 ) ) ( not ( = ?auto_867564 ?auto_867571 ) ) ( not ( = ?auto_867564 ?auto_867572 ) ) ( not ( = ?auto_867565 ?auto_867566 ) ) ( not ( = ?auto_867565 ?auto_867567 ) ) ( not ( = ?auto_867565 ?auto_867568 ) ) ( not ( = ?auto_867565 ?auto_867569 ) ) ( not ( = ?auto_867565 ?auto_867570 ) ) ( not ( = ?auto_867565 ?auto_867571 ) ) ( not ( = ?auto_867565 ?auto_867572 ) ) ( not ( = ?auto_867566 ?auto_867567 ) ) ( not ( = ?auto_867566 ?auto_867568 ) ) ( not ( = ?auto_867566 ?auto_867569 ) ) ( not ( = ?auto_867566 ?auto_867570 ) ) ( not ( = ?auto_867566 ?auto_867571 ) ) ( not ( = ?auto_867566 ?auto_867572 ) ) ( not ( = ?auto_867567 ?auto_867568 ) ) ( not ( = ?auto_867567 ?auto_867569 ) ) ( not ( = ?auto_867567 ?auto_867570 ) ) ( not ( = ?auto_867567 ?auto_867571 ) ) ( not ( = ?auto_867567 ?auto_867572 ) ) ( not ( = ?auto_867568 ?auto_867569 ) ) ( not ( = ?auto_867568 ?auto_867570 ) ) ( not ( = ?auto_867568 ?auto_867571 ) ) ( not ( = ?auto_867568 ?auto_867572 ) ) ( not ( = ?auto_867569 ?auto_867570 ) ) ( not ( = ?auto_867569 ?auto_867571 ) ) ( not ( = ?auto_867569 ?auto_867572 ) ) ( not ( = ?auto_867570 ?auto_867571 ) ) ( not ( = ?auto_867570 ?auto_867572 ) ) ( not ( = ?auto_867571 ?auto_867572 ) ) ( ON ?auto_867570 ?auto_867571 ) ( ON ?auto_867569 ?auto_867570 ) ( ON ?auto_867568 ?auto_867569 ) ( ON ?auto_867567 ?auto_867568 ) ( ON ?auto_867566 ?auto_867567 ) ( ON ?auto_867565 ?auto_867566 ) ( CLEAR ?auto_867563 ) ( ON ?auto_867564 ?auto_867565 ) ( CLEAR ?auto_867564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_867557 ?auto_867558 ?auto_867559 ?auto_867560 ?auto_867561 ?auto_867562 ?auto_867563 ?auto_867564 )
      ( MAKE-15PILE ?auto_867557 ?auto_867558 ?auto_867559 ?auto_867560 ?auto_867561 ?auto_867562 ?auto_867563 ?auto_867564 ?auto_867565 ?auto_867566 ?auto_867567 ?auto_867568 ?auto_867569 ?auto_867570 ?auto_867571 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867619 - BLOCK
      ?auto_867620 - BLOCK
      ?auto_867621 - BLOCK
      ?auto_867622 - BLOCK
      ?auto_867623 - BLOCK
      ?auto_867624 - BLOCK
      ?auto_867625 - BLOCK
      ?auto_867626 - BLOCK
      ?auto_867627 - BLOCK
      ?auto_867628 - BLOCK
      ?auto_867629 - BLOCK
      ?auto_867630 - BLOCK
      ?auto_867631 - BLOCK
      ?auto_867632 - BLOCK
      ?auto_867633 - BLOCK
    )
    :vars
    (
      ?auto_867634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867633 ?auto_867634 ) ( ON-TABLE ?auto_867619 ) ( ON ?auto_867620 ?auto_867619 ) ( ON ?auto_867621 ?auto_867620 ) ( ON ?auto_867622 ?auto_867621 ) ( ON ?auto_867623 ?auto_867622 ) ( ON ?auto_867624 ?auto_867623 ) ( not ( = ?auto_867619 ?auto_867620 ) ) ( not ( = ?auto_867619 ?auto_867621 ) ) ( not ( = ?auto_867619 ?auto_867622 ) ) ( not ( = ?auto_867619 ?auto_867623 ) ) ( not ( = ?auto_867619 ?auto_867624 ) ) ( not ( = ?auto_867619 ?auto_867625 ) ) ( not ( = ?auto_867619 ?auto_867626 ) ) ( not ( = ?auto_867619 ?auto_867627 ) ) ( not ( = ?auto_867619 ?auto_867628 ) ) ( not ( = ?auto_867619 ?auto_867629 ) ) ( not ( = ?auto_867619 ?auto_867630 ) ) ( not ( = ?auto_867619 ?auto_867631 ) ) ( not ( = ?auto_867619 ?auto_867632 ) ) ( not ( = ?auto_867619 ?auto_867633 ) ) ( not ( = ?auto_867619 ?auto_867634 ) ) ( not ( = ?auto_867620 ?auto_867621 ) ) ( not ( = ?auto_867620 ?auto_867622 ) ) ( not ( = ?auto_867620 ?auto_867623 ) ) ( not ( = ?auto_867620 ?auto_867624 ) ) ( not ( = ?auto_867620 ?auto_867625 ) ) ( not ( = ?auto_867620 ?auto_867626 ) ) ( not ( = ?auto_867620 ?auto_867627 ) ) ( not ( = ?auto_867620 ?auto_867628 ) ) ( not ( = ?auto_867620 ?auto_867629 ) ) ( not ( = ?auto_867620 ?auto_867630 ) ) ( not ( = ?auto_867620 ?auto_867631 ) ) ( not ( = ?auto_867620 ?auto_867632 ) ) ( not ( = ?auto_867620 ?auto_867633 ) ) ( not ( = ?auto_867620 ?auto_867634 ) ) ( not ( = ?auto_867621 ?auto_867622 ) ) ( not ( = ?auto_867621 ?auto_867623 ) ) ( not ( = ?auto_867621 ?auto_867624 ) ) ( not ( = ?auto_867621 ?auto_867625 ) ) ( not ( = ?auto_867621 ?auto_867626 ) ) ( not ( = ?auto_867621 ?auto_867627 ) ) ( not ( = ?auto_867621 ?auto_867628 ) ) ( not ( = ?auto_867621 ?auto_867629 ) ) ( not ( = ?auto_867621 ?auto_867630 ) ) ( not ( = ?auto_867621 ?auto_867631 ) ) ( not ( = ?auto_867621 ?auto_867632 ) ) ( not ( = ?auto_867621 ?auto_867633 ) ) ( not ( = ?auto_867621 ?auto_867634 ) ) ( not ( = ?auto_867622 ?auto_867623 ) ) ( not ( = ?auto_867622 ?auto_867624 ) ) ( not ( = ?auto_867622 ?auto_867625 ) ) ( not ( = ?auto_867622 ?auto_867626 ) ) ( not ( = ?auto_867622 ?auto_867627 ) ) ( not ( = ?auto_867622 ?auto_867628 ) ) ( not ( = ?auto_867622 ?auto_867629 ) ) ( not ( = ?auto_867622 ?auto_867630 ) ) ( not ( = ?auto_867622 ?auto_867631 ) ) ( not ( = ?auto_867622 ?auto_867632 ) ) ( not ( = ?auto_867622 ?auto_867633 ) ) ( not ( = ?auto_867622 ?auto_867634 ) ) ( not ( = ?auto_867623 ?auto_867624 ) ) ( not ( = ?auto_867623 ?auto_867625 ) ) ( not ( = ?auto_867623 ?auto_867626 ) ) ( not ( = ?auto_867623 ?auto_867627 ) ) ( not ( = ?auto_867623 ?auto_867628 ) ) ( not ( = ?auto_867623 ?auto_867629 ) ) ( not ( = ?auto_867623 ?auto_867630 ) ) ( not ( = ?auto_867623 ?auto_867631 ) ) ( not ( = ?auto_867623 ?auto_867632 ) ) ( not ( = ?auto_867623 ?auto_867633 ) ) ( not ( = ?auto_867623 ?auto_867634 ) ) ( not ( = ?auto_867624 ?auto_867625 ) ) ( not ( = ?auto_867624 ?auto_867626 ) ) ( not ( = ?auto_867624 ?auto_867627 ) ) ( not ( = ?auto_867624 ?auto_867628 ) ) ( not ( = ?auto_867624 ?auto_867629 ) ) ( not ( = ?auto_867624 ?auto_867630 ) ) ( not ( = ?auto_867624 ?auto_867631 ) ) ( not ( = ?auto_867624 ?auto_867632 ) ) ( not ( = ?auto_867624 ?auto_867633 ) ) ( not ( = ?auto_867624 ?auto_867634 ) ) ( not ( = ?auto_867625 ?auto_867626 ) ) ( not ( = ?auto_867625 ?auto_867627 ) ) ( not ( = ?auto_867625 ?auto_867628 ) ) ( not ( = ?auto_867625 ?auto_867629 ) ) ( not ( = ?auto_867625 ?auto_867630 ) ) ( not ( = ?auto_867625 ?auto_867631 ) ) ( not ( = ?auto_867625 ?auto_867632 ) ) ( not ( = ?auto_867625 ?auto_867633 ) ) ( not ( = ?auto_867625 ?auto_867634 ) ) ( not ( = ?auto_867626 ?auto_867627 ) ) ( not ( = ?auto_867626 ?auto_867628 ) ) ( not ( = ?auto_867626 ?auto_867629 ) ) ( not ( = ?auto_867626 ?auto_867630 ) ) ( not ( = ?auto_867626 ?auto_867631 ) ) ( not ( = ?auto_867626 ?auto_867632 ) ) ( not ( = ?auto_867626 ?auto_867633 ) ) ( not ( = ?auto_867626 ?auto_867634 ) ) ( not ( = ?auto_867627 ?auto_867628 ) ) ( not ( = ?auto_867627 ?auto_867629 ) ) ( not ( = ?auto_867627 ?auto_867630 ) ) ( not ( = ?auto_867627 ?auto_867631 ) ) ( not ( = ?auto_867627 ?auto_867632 ) ) ( not ( = ?auto_867627 ?auto_867633 ) ) ( not ( = ?auto_867627 ?auto_867634 ) ) ( not ( = ?auto_867628 ?auto_867629 ) ) ( not ( = ?auto_867628 ?auto_867630 ) ) ( not ( = ?auto_867628 ?auto_867631 ) ) ( not ( = ?auto_867628 ?auto_867632 ) ) ( not ( = ?auto_867628 ?auto_867633 ) ) ( not ( = ?auto_867628 ?auto_867634 ) ) ( not ( = ?auto_867629 ?auto_867630 ) ) ( not ( = ?auto_867629 ?auto_867631 ) ) ( not ( = ?auto_867629 ?auto_867632 ) ) ( not ( = ?auto_867629 ?auto_867633 ) ) ( not ( = ?auto_867629 ?auto_867634 ) ) ( not ( = ?auto_867630 ?auto_867631 ) ) ( not ( = ?auto_867630 ?auto_867632 ) ) ( not ( = ?auto_867630 ?auto_867633 ) ) ( not ( = ?auto_867630 ?auto_867634 ) ) ( not ( = ?auto_867631 ?auto_867632 ) ) ( not ( = ?auto_867631 ?auto_867633 ) ) ( not ( = ?auto_867631 ?auto_867634 ) ) ( not ( = ?auto_867632 ?auto_867633 ) ) ( not ( = ?auto_867632 ?auto_867634 ) ) ( not ( = ?auto_867633 ?auto_867634 ) ) ( ON ?auto_867632 ?auto_867633 ) ( ON ?auto_867631 ?auto_867632 ) ( ON ?auto_867630 ?auto_867631 ) ( ON ?auto_867629 ?auto_867630 ) ( ON ?auto_867628 ?auto_867629 ) ( ON ?auto_867627 ?auto_867628 ) ( ON ?auto_867626 ?auto_867627 ) ( CLEAR ?auto_867624 ) ( ON ?auto_867625 ?auto_867626 ) ( CLEAR ?auto_867625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_867619 ?auto_867620 ?auto_867621 ?auto_867622 ?auto_867623 ?auto_867624 ?auto_867625 )
      ( MAKE-15PILE ?auto_867619 ?auto_867620 ?auto_867621 ?auto_867622 ?auto_867623 ?auto_867624 ?auto_867625 ?auto_867626 ?auto_867627 ?auto_867628 ?auto_867629 ?auto_867630 ?auto_867631 ?auto_867632 ?auto_867633 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867681 - BLOCK
      ?auto_867682 - BLOCK
      ?auto_867683 - BLOCK
      ?auto_867684 - BLOCK
      ?auto_867685 - BLOCK
      ?auto_867686 - BLOCK
      ?auto_867687 - BLOCK
      ?auto_867688 - BLOCK
      ?auto_867689 - BLOCK
      ?auto_867690 - BLOCK
      ?auto_867691 - BLOCK
      ?auto_867692 - BLOCK
      ?auto_867693 - BLOCK
      ?auto_867694 - BLOCK
      ?auto_867695 - BLOCK
    )
    :vars
    (
      ?auto_867696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867695 ?auto_867696 ) ( ON-TABLE ?auto_867681 ) ( ON ?auto_867682 ?auto_867681 ) ( ON ?auto_867683 ?auto_867682 ) ( ON ?auto_867684 ?auto_867683 ) ( ON ?auto_867685 ?auto_867684 ) ( not ( = ?auto_867681 ?auto_867682 ) ) ( not ( = ?auto_867681 ?auto_867683 ) ) ( not ( = ?auto_867681 ?auto_867684 ) ) ( not ( = ?auto_867681 ?auto_867685 ) ) ( not ( = ?auto_867681 ?auto_867686 ) ) ( not ( = ?auto_867681 ?auto_867687 ) ) ( not ( = ?auto_867681 ?auto_867688 ) ) ( not ( = ?auto_867681 ?auto_867689 ) ) ( not ( = ?auto_867681 ?auto_867690 ) ) ( not ( = ?auto_867681 ?auto_867691 ) ) ( not ( = ?auto_867681 ?auto_867692 ) ) ( not ( = ?auto_867681 ?auto_867693 ) ) ( not ( = ?auto_867681 ?auto_867694 ) ) ( not ( = ?auto_867681 ?auto_867695 ) ) ( not ( = ?auto_867681 ?auto_867696 ) ) ( not ( = ?auto_867682 ?auto_867683 ) ) ( not ( = ?auto_867682 ?auto_867684 ) ) ( not ( = ?auto_867682 ?auto_867685 ) ) ( not ( = ?auto_867682 ?auto_867686 ) ) ( not ( = ?auto_867682 ?auto_867687 ) ) ( not ( = ?auto_867682 ?auto_867688 ) ) ( not ( = ?auto_867682 ?auto_867689 ) ) ( not ( = ?auto_867682 ?auto_867690 ) ) ( not ( = ?auto_867682 ?auto_867691 ) ) ( not ( = ?auto_867682 ?auto_867692 ) ) ( not ( = ?auto_867682 ?auto_867693 ) ) ( not ( = ?auto_867682 ?auto_867694 ) ) ( not ( = ?auto_867682 ?auto_867695 ) ) ( not ( = ?auto_867682 ?auto_867696 ) ) ( not ( = ?auto_867683 ?auto_867684 ) ) ( not ( = ?auto_867683 ?auto_867685 ) ) ( not ( = ?auto_867683 ?auto_867686 ) ) ( not ( = ?auto_867683 ?auto_867687 ) ) ( not ( = ?auto_867683 ?auto_867688 ) ) ( not ( = ?auto_867683 ?auto_867689 ) ) ( not ( = ?auto_867683 ?auto_867690 ) ) ( not ( = ?auto_867683 ?auto_867691 ) ) ( not ( = ?auto_867683 ?auto_867692 ) ) ( not ( = ?auto_867683 ?auto_867693 ) ) ( not ( = ?auto_867683 ?auto_867694 ) ) ( not ( = ?auto_867683 ?auto_867695 ) ) ( not ( = ?auto_867683 ?auto_867696 ) ) ( not ( = ?auto_867684 ?auto_867685 ) ) ( not ( = ?auto_867684 ?auto_867686 ) ) ( not ( = ?auto_867684 ?auto_867687 ) ) ( not ( = ?auto_867684 ?auto_867688 ) ) ( not ( = ?auto_867684 ?auto_867689 ) ) ( not ( = ?auto_867684 ?auto_867690 ) ) ( not ( = ?auto_867684 ?auto_867691 ) ) ( not ( = ?auto_867684 ?auto_867692 ) ) ( not ( = ?auto_867684 ?auto_867693 ) ) ( not ( = ?auto_867684 ?auto_867694 ) ) ( not ( = ?auto_867684 ?auto_867695 ) ) ( not ( = ?auto_867684 ?auto_867696 ) ) ( not ( = ?auto_867685 ?auto_867686 ) ) ( not ( = ?auto_867685 ?auto_867687 ) ) ( not ( = ?auto_867685 ?auto_867688 ) ) ( not ( = ?auto_867685 ?auto_867689 ) ) ( not ( = ?auto_867685 ?auto_867690 ) ) ( not ( = ?auto_867685 ?auto_867691 ) ) ( not ( = ?auto_867685 ?auto_867692 ) ) ( not ( = ?auto_867685 ?auto_867693 ) ) ( not ( = ?auto_867685 ?auto_867694 ) ) ( not ( = ?auto_867685 ?auto_867695 ) ) ( not ( = ?auto_867685 ?auto_867696 ) ) ( not ( = ?auto_867686 ?auto_867687 ) ) ( not ( = ?auto_867686 ?auto_867688 ) ) ( not ( = ?auto_867686 ?auto_867689 ) ) ( not ( = ?auto_867686 ?auto_867690 ) ) ( not ( = ?auto_867686 ?auto_867691 ) ) ( not ( = ?auto_867686 ?auto_867692 ) ) ( not ( = ?auto_867686 ?auto_867693 ) ) ( not ( = ?auto_867686 ?auto_867694 ) ) ( not ( = ?auto_867686 ?auto_867695 ) ) ( not ( = ?auto_867686 ?auto_867696 ) ) ( not ( = ?auto_867687 ?auto_867688 ) ) ( not ( = ?auto_867687 ?auto_867689 ) ) ( not ( = ?auto_867687 ?auto_867690 ) ) ( not ( = ?auto_867687 ?auto_867691 ) ) ( not ( = ?auto_867687 ?auto_867692 ) ) ( not ( = ?auto_867687 ?auto_867693 ) ) ( not ( = ?auto_867687 ?auto_867694 ) ) ( not ( = ?auto_867687 ?auto_867695 ) ) ( not ( = ?auto_867687 ?auto_867696 ) ) ( not ( = ?auto_867688 ?auto_867689 ) ) ( not ( = ?auto_867688 ?auto_867690 ) ) ( not ( = ?auto_867688 ?auto_867691 ) ) ( not ( = ?auto_867688 ?auto_867692 ) ) ( not ( = ?auto_867688 ?auto_867693 ) ) ( not ( = ?auto_867688 ?auto_867694 ) ) ( not ( = ?auto_867688 ?auto_867695 ) ) ( not ( = ?auto_867688 ?auto_867696 ) ) ( not ( = ?auto_867689 ?auto_867690 ) ) ( not ( = ?auto_867689 ?auto_867691 ) ) ( not ( = ?auto_867689 ?auto_867692 ) ) ( not ( = ?auto_867689 ?auto_867693 ) ) ( not ( = ?auto_867689 ?auto_867694 ) ) ( not ( = ?auto_867689 ?auto_867695 ) ) ( not ( = ?auto_867689 ?auto_867696 ) ) ( not ( = ?auto_867690 ?auto_867691 ) ) ( not ( = ?auto_867690 ?auto_867692 ) ) ( not ( = ?auto_867690 ?auto_867693 ) ) ( not ( = ?auto_867690 ?auto_867694 ) ) ( not ( = ?auto_867690 ?auto_867695 ) ) ( not ( = ?auto_867690 ?auto_867696 ) ) ( not ( = ?auto_867691 ?auto_867692 ) ) ( not ( = ?auto_867691 ?auto_867693 ) ) ( not ( = ?auto_867691 ?auto_867694 ) ) ( not ( = ?auto_867691 ?auto_867695 ) ) ( not ( = ?auto_867691 ?auto_867696 ) ) ( not ( = ?auto_867692 ?auto_867693 ) ) ( not ( = ?auto_867692 ?auto_867694 ) ) ( not ( = ?auto_867692 ?auto_867695 ) ) ( not ( = ?auto_867692 ?auto_867696 ) ) ( not ( = ?auto_867693 ?auto_867694 ) ) ( not ( = ?auto_867693 ?auto_867695 ) ) ( not ( = ?auto_867693 ?auto_867696 ) ) ( not ( = ?auto_867694 ?auto_867695 ) ) ( not ( = ?auto_867694 ?auto_867696 ) ) ( not ( = ?auto_867695 ?auto_867696 ) ) ( ON ?auto_867694 ?auto_867695 ) ( ON ?auto_867693 ?auto_867694 ) ( ON ?auto_867692 ?auto_867693 ) ( ON ?auto_867691 ?auto_867692 ) ( ON ?auto_867690 ?auto_867691 ) ( ON ?auto_867689 ?auto_867690 ) ( ON ?auto_867688 ?auto_867689 ) ( ON ?auto_867687 ?auto_867688 ) ( CLEAR ?auto_867685 ) ( ON ?auto_867686 ?auto_867687 ) ( CLEAR ?auto_867686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_867681 ?auto_867682 ?auto_867683 ?auto_867684 ?auto_867685 ?auto_867686 )
      ( MAKE-15PILE ?auto_867681 ?auto_867682 ?auto_867683 ?auto_867684 ?auto_867685 ?auto_867686 ?auto_867687 ?auto_867688 ?auto_867689 ?auto_867690 ?auto_867691 ?auto_867692 ?auto_867693 ?auto_867694 ?auto_867695 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867743 - BLOCK
      ?auto_867744 - BLOCK
      ?auto_867745 - BLOCK
      ?auto_867746 - BLOCK
      ?auto_867747 - BLOCK
      ?auto_867748 - BLOCK
      ?auto_867749 - BLOCK
      ?auto_867750 - BLOCK
      ?auto_867751 - BLOCK
      ?auto_867752 - BLOCK
      ?auto_867753 - BLOCK
      ?auto_867754 - BLOCK
      ?auto_867755 - BLOCK
      ?auto_867756 - BLOCK
      ?auto_867757 - BLOCK
    )
    :vars
    (
      ?auto_867758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867757 ?auto_867758 ) ( ON-TABLE ?auto_867743 ) ( ON ?auto_867744 ?auto_867743 ) ( ON ?auto_867745 ?auto_867744 ) ( ON ?auto_867746 ?auto_867745 ) ( not ( = ?auto_867743 ?auto_867744 ) ) ( not ( = ?auto_867743 ?auto_867745 ) ) ( not ( = ?auto_867743 ?auto_867746 ) ) ( not ( = ?auto_867743 ?auto_867747 ) ) ( not ( = ?auto_867743 ?auto_867748 ) ) ( not ( = ?auto_867743 ?auto_867749 ) ) ( not ( = ?auto_867743 ?auto_867750 ) ) ( not ( = ?auto_867743 ?auto_867751 ) ) ( not ( = ?auto_867743 ?auto_867752 ) ) ( not ( = ?auto_867743 ?auto_867753 ) ) ( not ( = ?auto_867743 ?auto_867754 ) ) ( not ( = ?auto_867743 ?auto_867755 ) ) ( not ( = ?auto_867743 ?auto_867756 ) ) ( not ( = ?auto_867743 ?auto_867757 ) ) ( not ( = ?auto_867743 ?auto_867758 ) ) ( not ( = ?auto_867744 ?auto_867745 ) ) ( not ( = ?auto_867744 ?auto_867746 ) ) ( not ( = ?auto_867744 ?auto_867747 ) ) ( not ( = ?auto_867744 ?auto_867748 ) ) ( not ( = ?auto_867744 ?auto_867749 ) ) ( not ( = ?auto_867744 ?auto_867750 ) ) ( not ( = ?auto_867744 ?auto_867751 ) ) ( not ( = ?auto_867744 ?auto_867752 ) ) ( not ( = ?auto_867744 ?auto_867753 ) ) ( not ( = ?auto_867744 ?auto_867754 ) ) ( not ( = ?auto_867744 ?auto_867755 ) ) ( not ( = ?auto_867744 ?auto_867756 ) ) ( not ( = ?auto_867744 ?auto_867757 ) ) ( not ( = ?auto_867744 ?auto_867758 ) ) ( not ( = ?auto_867745 ?auto_867746 ) ) ( not ( = ?auto_867745 ?auto_867747 ) ) ( not ( = ?auto_867745 ?auto_867748 ) ) ( not ( = ?auto_867745 ?auto_867749 ) ) ( not ( = ?auto_867745 ?auto_867750 ) ) ( not ( = ?auto_867745 ?auto_867751 ) ) ( not ( = ?auto_867745 ?auto_867752 ) ) ( not ( = ?auto_867745 ?auto_867753 ) ) ( not ( = ?auto_867745 ?auto_867754 ) ) ( not ( = ?auto_867745 ?auto_867755 ) ) ( not ( = ?auto_867745 ?auto_867756 ) ) ( not ( = ?auto_867745 ?auto_867757 ) ) ( not ( = ?auto_867745 ?auto_867758 ) ) ( not ( = ?auto_867746 ?auto_867747 ) ) ( not ( = ?auto_867746 ?auto_867748 ) ) ( not ( = ?auto_867746 ?auto_867749 ) ) ( not ( = ?auto_867746 ?auto_867750 ) ) ( not ( = ?auto_867746 ?auto_867751 ) ) ( not ( = ?auto_867746 ?auto_867752 ) ) ( not ( = ?auto_867746 ?auto_867753 ) ) ( not ( = ?auto_867746 ?auto_867754 ) ) ( not ( = ?auto_867746 ?auto_867755 ) ) ( not ( = ?auto_867746 ?auto_867756 ) ) ( not ( = ?auto_867746 ?auto_867757 ) ) ( not ( = ?auto_867746 ?auto_867758 ) ) ( not ( = ?auto_867747 ?auto_867748 ) ) ( not ( = ?auto_867747 ?auto_867749 ) ) ( not ( = ?auto_867747 ?auto_867750 ) ) ( not ( = ?auto_867747 ?auto_867751 ) ) ( not ( = ?auto_867747 ?auto_867752 ) ) ( not ( = ?auto_867747 ?auto_867753 ) ) ( not ( = ?auto_867747 ?auto_867754 ) ) ( not ( = ?auto_867747 ?auto_867755 ) ) ( not ( = ?auto_867747 ?auto_867756 ) ) ( not ( = ?auto_867747 ?auto_867757 ) ) ( not ( = ?auto_867747 ?auto_867758 ) ) ( not ( = ?auto_867748 ?auto_867749 ) ) ( not ( = ?auto_867748 ?auto_867750 ) ) ( not ( = ?auto_867748 ?auto_867751 ) ) ( not ( = ?auto_867748 ?auto_867752 ) ) ( not ( = ?auto_867748 ?auto_867753 ) ) ( not ( = ?auto_867748 ?auto_867754 ) ) ( not ( = ?auto_867748 ?auto_867755 ) ) ( not ( = ?auto_867748 ?auto_867756 ) ) ( not ( = ?auto_867748 ?auto_867757 ) ) ( not ( = ?auto_867748 ?auto_867758 ) ) ( not ( = ?auto_867749 ?auto_867750 ) ) ( not ( = ?auto_867749 ?auto_867751 ) ) ( not ( = ?auto_867749 ?auto_867752 ) ) ( not ( = ?auto_867749 ?auto_867753 ) ) ( not ( = ?auto_867749 ?auto_867754 ) ) ( not ( = ?auto_867749 ?auto_867755 ) ) ( not ( = ?auto_867749 ?auto_867756 ) ) ( not ( = ?auto_867749 ?auto_867757 ) ) ( not ( = ?auto_867749 ?auto_867758 ) ) ( not ( = ?auto_867750 ?auto_867751 ) ) ( not ( = ?auto_867750 ?auto_867752 ) ) ( not ( = ?auto_867750 ?auto_867753 ) ) ( not ( = ?auto_867750 ?auto_867754 ) ) ( not ( = ?auto_867750 ?auto_867755 ) ) ( not ( = ?auto_867750 ?auto_867756 ) ) ( not ( = ?auto_867750 ?auto_867757 ) ) ( not ( = ?auto_867750 ?auto_867758 ) ) ( not ( = ?auto_867751 ?auto_867752 ) ) ( not ( = ?auto_867751 ?auto_867753 ) ) ( not ( = ?auto_867751 ?auto_867754 ) ) ( not ( = ?auto_867751 ?auto_867755 ) ) ( not ( = ?auto_867751 ?auto_867756 ) ) ( not ( = ?auto_867751 ?auto_867757 ) ) ( not ( = ?auto_867751 ?auto_867758 ) ) ( not ( = ?auto_867752 ?auto_867753 ) ) ( not ( = ?auto_867752 ?auto_867754 ) ) ( not ( = ?auto_867752 ?auto_867755 ) ) ( not ( = ?auto_867752 ?auto_867756 ) ) ( not ( = ?auto_867752 ?auto_867757 ) ) ( not ( = ?auto_867752 ?auto_867758 ) ) ( not ( = ?auto_867753 ?auto_867754 ) ) ( not ( = ?auto_867753 ?auto_867755 ) ) ( not ( = ?auto_867753 ?auto_867756 ) ) ( not ( = ?auto_867753 ?auto_867757 ) ) ( not ( = ?auto_867753 ?auto_867758 ) ) ( not ( = ?auto_867754 ?auto_867755 ) ) ( not ( = ?auto_867754 ?auto_867756 ) ) ( not ( = ?auto_867754 ?auto_867757 ) ) ( not ( = ?auto_867754 ?auto_867758 ) ) ( not ( = ?auto_867755 ?auto_867756 ) ) ( not ( = ?auto_867755 ?auto_867757 ) ) ( not ( = ?auto_867755 ?auto_867758 ) ) ( not ( = ?auto_867756 ?auto_867757 ) ) ( not ( = ?auto_867756 ?auto_867758 ) ) ( not ( = ?auto_867757 ?auto_867758 ) ) ( ON ?auto_867756 ?auto_867757 ) ( ON ?auto_867755 ?auto_867756 ) ( ON ?auto_867754 ?auto_867755 ) ( ON ?auto_867753 ?auto_867754 ) ( ON ?auto_867752 ?auto_867753 ) ( ON ?auto_867751 ?auto_867752 ) ( ON ?auto_867750 ?auto_867751 ) ( ON ?auto_867749 ?auto_867750 ) ( ON ?auto_867748 ?auto_867749 ) ( CLEAR ?auto_867746 ) ( ON ?auto_867747 ?auto_867748 ) ( CLEAR ?auto_867747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_867743 ?auto_867744 ?auto_867745 ?auto_867746 ?auto_867747 )
      ( MAKE-15PILE ?auto_867743 ?auto_867744 ?auto_867745 ?auto_867746 ?auto_867747 ?auto_867748 ?auto_867749 ?auto_867750 ?auto_867751 ?auto_867752 ?auto_867753 ?auto_867754 ?auto_867755 ?auto_867756 ?auto_867757 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867805 - BLOCK
      ?auto_867806 - BLOCK
      ?auto_867807 - BLOCK
      ?auto_867808 - BLOCK
      ?auto_867809 - BLOCK
      ?auto_867810 - BLOCK
      ?auto_867811 - BLOCK
      ?auto_867812 - BLOCK
      ?auto_867813 - BLOCK
      ?auto_867814 - BLOCK
      ?auto_867815 - BLOCK
      ?auto_867816 - BLOCK
      ?auto_867817 - BLOCK
      ?auto_867818 - BLOCK
      ?auto_867819 - BLOCK
    )
    :vars
    (
      ?auto_867820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867819 ?auto_867820 ) ( ON-TABLE ?auto_867805 ) ( ON ?auto_867806 ?auto_867805 ) ( ON ?auto_867807 ?auto_867806 ) ( not ( = ?auto_867805 ?auto_867806 ) ) ( not ( = ?auto_867805 ?auto_867807 ) ) ( not ( = ?auto_867805 ?auto_867808 ) ) ( not ( = ?auto_867805 ?auto_867809 ) ) ( not ( = ?auto_867805 ?auto_867810 ) ) ( not ( = ?auto_867805 ?auto_867811 ) ) ( not ( = ?auto_867805 ?auto_867812 ) ) ( not ( = ?auto_867805 ?auto_867813 ) ) ( not ( = ?auto_867805 ?auto_867814 ) ) ( not ( = ?auto_867805 ?auto_867815 ) ) ( not ( = ?auto_867805 ?auto_867816 ) ) ( not ( = ?auto_867805 ?auto_867817 ) ) ( not ( = ?auto_867805 ?auto_867818 ) ) ( not ( = ?auto_867805 ?auto_867819 ) ) ( not ( = ?auto_867805 ?auto_867820 ) ) ( not ( = ?auto_867806 ?auto_867807 ) ) ( not ( = ?auto_867806 ?auto_867808 ) ) ( not ( = ?auto_867806 ?auto_867809 ) ) ( not ( = ?auto_867806 ?auto_867810 ) ) ( not ( = ?auto_867806 ?auto_867811 ) ) ( not ( = ?auto_867806 ?auto_867812 ) ) ( not ( = ?auto_867806 ?auto_867813 ) ) ( not ( = ?auto_867806 ?auto_867814 ) ) ( not ( = ?auto_867806 ?auto_867815 ) ) ( not ( = ?auto_867806 ?auto_867816 ) ) ( not ( = ?auto_867806 ?auto_867817 ) ) ( not ( = ?auto_867806 ?auto_867818 ) ) ( not ( = ?auto_867806 ?auto_867819 ) ) ( not ( = ?auto_867806 ?auto_867820 ) ) ( not ( = ?auto_867807 ?auto_867808 ) ) ( not ( = ?auto_867807 ?auto_867809 ) ) ( not ( = ?auto_867807 ?auto_867810 ) ) ( not ( = ?auto_867807 ?auto_867811 ) ) ( not ( = ?auto_867807 ?auto_867812 ) ) ( not ( = ?auto_867807 ?auto_867813 ) ) ( not ( = ?auto_867807 ?auto_867814 ) ) ( not ( = ?auto_867807 ?auto_867815 ) ) ( not ( = ?auto_867807 ?auto_867816 ) ) ( not ( = ?auto_867807 ?auto_867817 ) ) ( not ( = ?auto_867807 ?auto_867818 ) ) ( not ( = ?auto_867807 ?auto_867819 ) ) ( not ( = ?auto_867807 ?auto_867820 ) ) ( not ( = ?auto_867808 ?auto_867809 ) ) ( not ( = ?auto_867808 ?auto_867810 ) ) ( not ( = ?auto_867808 ?auto_867811 ) ) ( not ( = ?auto_867808 ?auto_867812 ) ) ( not ( = ?auto_867808 ?auto_867813 ) ) ( not ( = ?auto_867808 ?auto_867814 ) ) ( not ( = ?auto_867808 ?auto_867815 ) ) ( not ( = ?auto_867808 ?auto_867816 ) ) ( not ( = ?auto_867808 ?auto_867817 ) ) ( not ( = ?auto_867808 ?auto_867818 ) ) ( not ( = ?auto_867808 ?auto_867819 ) ) ( not ( = ?auto_867808 ?auto_867820 ) ) ( not ( = ?auto_867809 ?auto_867810 ) ) ( not ( = ?auto_867809 ?auto_867811 ) ) ( not ( = ?auto_867809 ?auto_867812 ) ) ( not ( = ?auto_867809 ?auto_867813 ) ) ( not ( = ?auto_867809 ?auto_867814 ) ) ( not ( = ?auto_867809 ?auto_867815 ) ) ( not ( = ?auto_867809 ?auto_867816 ) ) ( not ( = ?auto_867809 ?auto_867817 ) ) ( not ( = ?auto_867809 ?auto_867818 ) ) ( not ( = ?auto_867809 ?auto_867819 ) ) ( not ( = ?auto_867809 ?auto_867820 ) ) ( not ( = ?auto_867810 ?auto_867811 ) ) ( not ( = ?auto_867810 ?auto_867812 ) ) ( not ( = ?auto_867810 ?auto_867813 ) ) ( not ( = ?auto_867810 ?auto_867814 ) ) ( not ( = ?auto_867810 ?auto_867815 ) ) ( not ( = ?auto_867810 ?auto_867816 ) ) ( not ( = ?auto_867810 ?auto_867817 ) ) ( not ( = ?auto_867810 ?auto_867818 ) ) ( not ( = ?auto_867810 ?auto_867819 ) ) ( not ( = ?auto_867810 ?auto_867820 ) ) ( not ( = ?auto_867811 ?auto_867812 ) ) ( not ( = ?auto_867811 ?auto_867813 ) ) ( not ( = ?auto_867811 ?auto_867814 ) ) ( not ( = ?auto_867811 ?auto_867815 ) ) ( not ( = ?auto_867811 ?auto_867816 ) ) ( not ( = ?auto_867811 ?auto_867817 ) ) ( not ( = ?auto_867811 ?auto_867818 ) ) ( not ( = ?auto_867811 ?auto_867819 ) ) ( not ( = ?auto_867811 ?auto_867820 ) ) ( not ( = ?auto_867812 ?auto_867813 ) ) ( not ( = ?auto_867812 ?auto_867814 ) ) ( not ( = ?auto_867812 ?auto_867815 ) ) ( not ( = ?auto_867812 ?auto_867816 ) ) ( not ( = ?auto_867812 ?auto_867817 ) ) ( not ( = ?auto_867812 ?auto_867818 ) ) ( not ( = ?auto_867812 ?auto_867819 ) ) ( not ( = ?auto_867812 ?auto_867820 ) ) ( not ( = ?auto_867813 ?auto_867814 ) ) ( not ( = ?auto_867813 ?auto_867815 ) ) ( not ( = ?auto_867813 ?auto_867816 ) ) ( not ( = ?auto_867813 ?auto_867817 ) ) ( not ( = ?auto_867813 ?auto_867818 ) ) ( not ( = ?auto_867813 ?auto_867819 ) ) ( not ( = ?auto_867813 ?auto_867820 ) ) ( not ( = ?auto_867814 ?auto_867815 ) ) ( not ( = ?auto_867814 ?auto_867816 ) ) ( not ( = ?auto_867814 ?auto_867817 ) ) ( not ( = ?auto_867814 ?auto_867818 ) ) ( not ( = ?auto_867814 ?auto_867819 ) ) ( not ( = ?auto_867814 ?auto_867820 ) ) ( not ( = ?auto_867815 ?auto_867816 ) ) ( not ( = ?auto_867815 ?auto_867817 ) ) ( not ( = ?auto_867815 ?auto_867818 ) ) ( not ( = ?auto_867815 ?auto_867819 ) ) ( not ( = ?auto_867815 ?auto_867820 ) ) ( not ( = ?auto_867816 ?auto_867817 ) ) ( not ( = ?auto_867816 ?auto_867818 ) ) ( not ( = ?auto_867816 ?auto_867819 ) ) ( not ( = ?auto_867816 ?auto_867820 ) ) ( not ( = ?auto_867817 ?auto_867818 ) ) ( not ( = ?auto_867817 ?auto_867819 ) ) ( not ( = ?auto_867817 ?auto_867820 ) ) ( not ( = ?auto_867818 ?auto_867819 ) ) ( not ( = ?auto_867818 ?auto_867820 ) ) ( not ( = ?auto_867819 ?auto_867820 ) ) ( ON ?auto_867818 ?auto_867819 ) ( ON ?auto_867817 ?auto_867818 ) ( ON ?auto_867816 ?auto_867817 ) ( ON ?auto_867815 ?auto_867816 ) ( ON ?auto_867814 ?auto_867815 ) ( ON ?auto_867813 ?auto_867814 ) ( ON ?auto_867812 ?auto_867813 ) ( ON ?auto_867811 ?auto_867812 ) ( ON ?auto_867810 ?auto_867811 ) ( ON ?auto_867809 ?auto_867810 ) ( CLEAR ?auto_867807 ) ( ON ?auto_867808 ?auto_867809 ) ( CLEAR ?auto_867808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_867805 ?auto_867806 ?auto_867807 ?auto_867808 )
      ( MAKE-15PILE ?auto_867805 ?auto_867806 ?auto_867807 ?auto_867808 ?auto_867809 ?auto_867810 ?auto_867811 ?auto_867812 ?auto_867813 ?auto_867814 ?auto_867815 ?auto_867816 ?auto_867817 ?auto_867818 ?auto_867819 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867867 - BLOCK
      ?auto_867868 - BLOCK
      ?auto_867869 - BLOCK
      ?auto_867870 - BLOCK
      ?auto_867871 - BLOCK
      ?auto_867872 - BLOCK
      ?auto_867873 - BLOCK
      ?auto_867874 - BLOCK
      ?auto_867875 - BLOCK
      ?auto_867876 - BLOCK
      ?auto_867877 - BLOCK
      ?auto_867878 - BLOCK
      ?auto_867879 - BLOCK
      ?auto_867880 - BLOCK
      ?auto_867881 - BLOCK
    )
    :vars
    (
      ?auto_867882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867881 ?auto_867882 ) ( ON-TABLE ?auto_867867 ) ( ON ?auto_867868 ?auto_867867 ) ( not ( = ?auto_867867 ?auto_867868 ) ) ( not ( = ?auto_867867 ?auto_867869 ) ) ( not ( = ?auto_867867 ?auto_867870 ) ) ( not ( = ?auto_867867 ?auto_867871 ) ) ( not ( = ?auto_867867 ?auto_867872 ) ) ( not ( = ?auto_867867 ?auto_867873 ) ) ( not ( = ?auto_867867 ?auto_867874 ) ) ( not ( = ?auto_867867 ?auto_867875 ) ) ( not ( = ?auto_867867 ?auto_867876 ) ) ( not ( = ?auto_867867 ?auto_867877 ) ) ( not ( = ?auto_867867 ?auto_867878 ) ) ( not ( = ?auto_867867 ?auto_867879 ) ) ( not ( = ?auto_867867 ?auto_867880 ) ) ( not ( = ?auto_867867 ?auto_867881 ) ) ( not ( = ?auto_867867 ?auto_867882 ) ) ( not ( = ?auto_867868 ?auto_867869 ) ) ( not ( = ?auto_867868 ?auto_867870 ) ) ( not ( = ?auto_867868 ?auto_867871 ) ) ( not ( = ?auto_867868 ?auto_867872 ) ) ( not ( = ?auto_867868 ?auto_867873 ) ) ( not ( = ?auto_867868 ?auto_867874 ) ) ( not ( = ?auto_867868 ?auto_867875 ) ) ( not ( = ?auto_867868 ?auto_867876 ) ) ( not ( = ?auto_867868 ?auto_867877 ) ) ( not ( = ?auto_867868 ?auto_867878 ) ) ( not ( = ?auto_867868 ?auto_867879 ) ) ( not ( = ?auto_867868 ?auto_867880 ) ) ( not ( = ?auto_867868 ?auto_867881 ) ) ( not ( = ?auto_867868 ?auto_867882 ) ) ( not ( = ?auto_867869 ?auto_867870 ) ) ( not ( = ?auto_867869 ?auto_867871 ) ) ( not ( = ?auto_867869 ?auto_867872 ) ) ( not ( = ?auto_867869 ?auto_867873 ) ) ( not ( = ?auto_867869 ?auto_867874 ) ) ( not ( = ?auto_867869 ?auto_867875 ) ) ( not ( = ?auto_867869 ?auto_867876 ) ) ( not ( = ?auto_867869 ?auto_867877 ) ) ( not ( = ?auto_867869 ?auto_867878 ) ) ( not ( = ?auto_867869 ?auto_867879 ) ) ( not ( = ?auto_867869 ?auto_867880 ) ) ( not ( = ?auto_867869 ?auto_867881 ) ) ( not ( = ?auto_867869 ?auto_867882 ) ) ( not ( = ?auto_867870 ?auto_867871 ) ) ( not ( = ?auto_867870 ?auto_867872 ) ) ( not ( = ?auto_867870 ?auto_867873 ) ) ( not ( = ?auto_867870 ?auto_867874 ) ) ( not ( = ?auto_867870 ?auto_867875 ) ) ( not ( = ?auto_867870 ?auto_867876 ) ) ( not ( = ?auto_867870 ?auto_867877 ) ) ( not ( = ?auto_867870 ?auto_867878 ) ) ( not ( = ?auto_867870 ?auto_867879 ) ) ( not ( = ?auto_867870 ?auto_867880 ) ) ( not ( = ?auto_867870 ?auto_867881 ) ) ( not ( = ?auto_867870 ?auto_867882 ) ) ( not ( = ?auto_867871 ?auto_867872 ) ) ( not ( = ?auto_867871 ?auto_867873 ) ) ( not ( = ?auto_867871 ?auto_867874 ) ) ( not ( = ?auto_867871 ?auto_867875 ) ) ( not ( = ?auto_867871 ?auto_867876 ) ) ( not ( = ?auto_867871 ?auto_867877 ) ) ( not ( = ?auto_867871 ?auto_867878 ) ) ( not ( = ?auto_867871 ?auto_867879 ) ) ( not ( = ?auto_867871 ?auto_867880 ) ) ( not ( = ?auto_867871 ?auto_867881 ) ) ( not ( = ?auto_867871 ?auto_867882 ) ) ( not ( = ?auto_867872 ?auto_867873 ) ) ( not ( = ?auto_867872 ?auto_867874 ) ) ( not ( = ?auto_867872 ?auto_867875 ) ) ( not ( = ?auto_867872 ?auto_867876 ) ) ( not ( = ?auto_867872 ?auto_867877 ) ) ( not ( = ?auto_867872 ?auto_867878 ) ) ( not ( = ?auto_867872 ?auto_867879 ) ) ( not ( = ?auto_867872 ?auto_867880 ) ) ( not ( = ?auto_867872 ?auto_867881 ) ) ( not ( = ?auto_867872 ?auto_867882 ) ) ( not ( = ?auto_867873 ?auto_867874 ) ) ( not ( = ?auto_867873 ?auto_867875 ) ) ( not ( = ?auto_867873 ?auto_867876 ) ) ( not ( = ?auto_867873 ?auto_867877 ) ) ( not ( = ?auto_867873 ?auto_867878 ) ) ( not ( = ?auto_867873 ?auto_867879 ) ) ( not ( = ?auto_867873 ?auto_867880 ) ) ( not ( = ?auto_867873 ?auto_867881 ) ) ( not ( = ?auto_867873 ?auto_867882 ) ) ( not ( = ?auto_867874 ?auto_867875 ) ) ( not ( = ?auto_867874 ?auto_867876 ) ) ( not ( = ?auto_867874 ?auto_867877 ) ) ( not ( = ?auto_867874 ?auto_867878 ) ) ( not ( = ?auto_867874 ?auto_867879 ) ) ( not ( = ?auto_867874 ?auto_867880 ) ) ( not ( = ?auto_867874 ?auto_867881 ) ) ( not ( = ?auto_867874 ?auto_867882 ) ) ( not ( = ?auto_867875 ?auto_867876 ) ) ( not ( = ?auto_867875 ?auto_867877 ) ) ( not ( = ?auto_867875 ?auto_867878 ) ) ( not ( = ?auto_867875 ?auto_867879 ) ) ( not ( = ?auto_867875 ?auto_867880 ) ) ( not ( = ?auto_867875 ?auto_867881 ) ) ( not ( = ?auto_867875 ?auto_867882 ) ) ( not ( = ?auto_867876 ?auto_867877 ) ) ( not ( = ?auto_867876 ?auto_867878 ) ) ( not ( = ?auto_867876 ?auto_867879 ) ) ( not ( = ?auto_867876 ?auto_867880 ) ) ( not ( = ?auto_867876 ?auto_867881 ) ) ( not ( = ?auto_867876 ?auto_867882 ) ) ( not ( = ?auto_867877 ?auto_867878 ) ) ( not ( = ?auto_867877 ?auto_867879 ) ) ( not ( = ?auto_867877 ?auto_867880 ) ) ( not ( = ?auto_867877 ?auto_867881 ) ) ( not ( = ?auto_867877 ?auto_867882 ) ) ( not ( = ?auto_867878 ?auto_867879 ) ) ( not ( = ?auto_867878 ?auto_867880 ) ) ( not ( = ?auto_867878 ?auto_867881 ) ) ( not ( = ?auto_867878 ?auto_867882 ) ) ( not ( = ?auto_867879 ?auto_867880 ) ) ( not ( = ?auto_867879 ?auto_867881 ) ) ( not ( = ?auto_867879 ?auto_867882 ) ) ( not ( = ?auto_867880 ?auto_867881 ) ) ( not ( = ?auto_867880 ?auto_867882 ) ) ( not ( = ?auto_867881 ?auto_867882 ) ) ( ON ?auto_867880 ?auto_867881 ) ( ON ?auto_867879 ?auto_867880 ) ( ON ?auto_867878 ?auto_867879 ) ( ON ?auto_867877 ?auto_867878 ) ( ON ?auto_867876 ?auto_867877 ) ( ON ?auto_867875 ?auto_867876 ) ( ON ?auto_867874 ?auto_867875 ) ( ON ?auto_867873 ?auto_867874 ) ( ON ?auto_867872 ?auto_867873 ) ( ON ?auto_867871 ?auto_867872 ) ( ON ?auto_867870 ?auto_867871 ) ( CLEAR ?auto_867868 ) ( ON ?auto_867869 ?auto_867870 ) ( CLEAR ?auto_867869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_867867 ?auto_867868 ?auto_867869 )
      ( MAKE-15PILE ?auto_867867 ?auto_867868 ?auto_867869 ?auto_867870 ?auto_867871 ?auto_867872 ?auto_867873 ?auto_867874 ?auto_867875 ?auto_867876 ?auto_867877 ?auto_867878 ?auto_867879 ?auto_867880 ?auto_867881 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867929 - BLOCK
      ?auto_867930 - BLOCK
      ?auto_867931 - BLOCK
      ?auto_867932 - BLOCK
      ?auto_867933 - BLOCK
      ?auto_867934 - BLOCK
      ?auto_867935 - BLOCK
      ?auto_867936 - BLOCK
      ?auto_867937 - BLOCK
      ?auto_867938 - BLOCK
      ?auto_867939 - BLOCK
      ?auto_867940 - BLOCK
      ?auto_867941 - BLOCK
      ?auto_867942 - BLOCK
      ?auto_867943 - BLOCK
    )
    :vars
    (
      ?auto_867944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_867943 ?auto_867944 ) ( ON-TABLE ?auto_867929 ) ( not ( = ?auto_867929 ?auto_867930 ) ) ( not ( = ?auto_867929 ?auto_867931 ) ) ( not ( = ?auto_867929 ?auto_867932 ) ) ( not ( = ?auto_867929 ?auto_867933 ) ) ( not ( = ?auto_867929 ?auto_867934 ) ) ( not ( = ?auto_867929 ?auto_867935 ) ) ( not ( = ?auto_867929 ?auto_867936 ) ) ( not ( = ?auto_867929 ?auto_867937 ) ) ( not ( = ?auto_867929 ?auto_867938 ) ) ( not ( = ?auto_867929 ?auto_867939 ) ) ( not ( = ?auto_867929 ?auto_867940 ) ) ( not ( = ?auto_867929 ?auto_867941 ) ) ( not ( = ?auto_867929 ?auto_867942 ) ) ( not ( = ?auto_867929 ?auto_867943 ) ) ( not ( = ?auto_867929 ?auto_867944 ) ) ( not ( = ?auto_867930 ?auto_867931 ) ) ( not ( = ?auto_867930 ?auto_867932 ) ) ( not ( = ?auto_867930 ?auto_867933 ) ) ( not ( = ?auto_867930 ?auto_867934 ) ) ( not ( = ?auto_867930 ?auto_867935 ) ) ( not ( = ?auto_867930 ?auto_867936 ) ) ( not ( = ?auto_867930 ?auto_867937 ) ) ( not ( = ?auto_867930 ?auto_867938 ) ) ( not ( = ?auto_867930 ?auto_867939 ) ) ( not ( = ?auto_867930 ?auto_867940 ) ) ( not ( = ?auto_867930 ?auto_867941 ) ) ( not ( = ?auto_867930 ?auto_867942 ) ) ( not ( = ?auto_867930 ?auto_867943 ) ) ( not ( = ?auto_867930 ?auto_867944 ) ) ( not ( = ?auto_867931 ?auto_867932 ) ) ( not ( = ?auto_867931 ?auto_867933 ) ) ( not ( = ?auto_867931 ?auto_867934 ) ) ( not ( = ?auto_867931 ?auto_867935 ) ) ( not ( = ?auto_867931 ?auto_867936 ) ) ( not ( = ?auto_867931 ?auto_867937 ) ) ( not ( = ?auto_867931 ?auto_867938 ) ) ( not ( = ?auto_867931 ?auto_867939 ) ) ( not ( = ?auto_867931 ?auto_867940 ) ) ( not ( = ?auto_867931 ?auto_867941 ) ) ( not ( = ?auto_867931 ?auto_867942 ) ) ( not ( = ?auto_867931 ?auto_867943 ) ) ( not ( = ?auto_867931 ?auto_867944 ) ) ( not ( = ?auto_867932 ?auto_867933 ) ) ( not ( = ?auto_867932 ?auto_867934 ) ) ( not ( = ?auto_867932 ?auto_867935 ) ) ( not ( = ?auto_867932 ?auto_867936 ) ) ( not ( = ?auto_867932 ?auto_867937 ) ) ( not ( = ?auto_867932 ?auto_867938 ) ) ( not ( = ?auto_867932 ?auto_867939 ) ) ( not ( = ?auto_867932 ?auto_867940 ) ) ( not ( = ?auto_867932 ?auto_867941 ) ) ( not ( = ?auto_867932 ?auto_867942 ) ) ( not ( = ?auto_867932 ?auto_867943 ) ) ( not ( = ?auto_867932 ?auto_867944 ) ) ( not ( = ?auto_867933 ?auto_867934 ) ) ( not ( = ?auto_867933 ?auto_867935 ) ) ( not ( = ?auto_867933 ?auto_867936 ) ) ( not ( = ?auto_867933 ?auto_867937 ) ) ( not ( = ?auto_867933 ?auto_867938 ) ) ( not ( = ?auto_867933 ?auto_867939 ) ) ( not ( = ?auto_867933 ?auto_867940 ) ) ( not ( = ?auto_867933 ?auto_867941 ) ) ( not ( = ?auto_867933 ?auto_867942 ) ) ( not ( = ?auto_867933 ?auto_867943 ) ) ( not ( = ?auto_867933 ?auto_867944 ) ) ( not ( = ?auto_867934 ?auto_867935 ) ) ( not ( = ?auto_867934 ?auto_867936 ) ) ( not ( = ?auto_867934 ?auto_867937 ) ) ( not ( = ?auto_867934 ?auto_867938 ) ) ( not ( = ?auto_867934 ?auto_867939 ) ) ( not ( = ?auto_867934 ?auto_867940 ) ) ( not ( = ?auto_867934 ?auto_867941 ) ) ( not ( = ?auto_867934 ?auto_867942 ) ) ( not ( = ?auto_867934 ?auto_867943 ) ) ( not ( = ?auto_867934 ?auto_867944 ) ) ( not ( = ?auto_867935 ?auto_867936 ) ) ( not ( = ?auto_867935 ?auto_867937 ) ) ( not ( = ?auto_867935 ?auto_867938 ) ) ( not ( = ?auto_867935 ?auto_867939 ) ) ( not ( = ?auto_867935 ?auto_867940 ) ) ( not ( = ?auto_867935 ?auto_867941 ) ) ( not ( = ?auto_867935 ?auto_867942 ) ) ( not ( = ?auto_867935 ?auto_867943 ) ) ( not ( = ?auto_867935 ?auto_867944 ) ) ( not ( = ?auto_867936 ?auto_867937 ) ) ( not ( = ?auto_867936 ?auto_867938 ) ) ( not ( = ?auto_867936 ?auto_867939 ) ) ( not ( = ?auto_867936 ?auto_867940 ) ) ( not ( = ?auto_867936 ?auto_867941 ) ) ( not ( = ?auto_867936 ?auto_867942 ) ) ( not ( = ?auto_867936 ?auto_867943 ) ) ( not ( = ?auto_867936 ?auto_867944 ) ) ( not ( = ?auto_867937 ?auto_867938 ) ) ( not ( = ?auto_867937 ?auto_867939 ) ) ( not ( = ?auto_867937 ?auto_867940 ) ) ( not ( = ?auto_867937 ?auto_867941 ) ) ( not ( = ?auto_867937 ?auto_867942 ) ) ( not ( = ?auto_867937 ?auto_867943 ) ) ( not ( = ?auto_867937 ?auto_867944 ) ) ( not ( = ?auto_867938 ?auto_867939 ) ) ( not ( = ?auto_867938 ?auto_867940 ) ) ( not ( = ?auto_867938 ?auto_867941 ) ) ( not ( = ?auto_867938 ?auto_867942 ) ) ( not ( = ?auto_867938 ?auto_867943 ) ) ( not ( = ?auto_867938 ?auto_867944 ) ) ( not ( = ?auto_867939 ?auto_867940 ) ) ( not ( = ?auto_867939 ?auto_867941 ) ) ( not ( = ?auto_867939 ?auto_867942 ) ) ( not ( = ?auto_867939 ?auto_867943 ) ) ( not ( = ?auto_867939 ?auto_867944 ) ) ( not ( = ?auto_867940 ?auto_867941 ) ) ( not ( = ?auto_867940 ?auto_867942 ) ) ( not ( = ?auto_867940 ?auto_867943 ) ) ( not ( = ?auto_867940 ?auto_867944 ) ) ( not ( = ?auto_867941 ?auto_867942 ) ) ( not ( = ?auto_867941 ?auto_867943 ) ) ( not ( = ?auto_867941 ?auto_867944 ) ) ( not ( = ?auto_867942 ?auto_867943 ) ) ( not ( = ?auto_867942 ?auto_867944 ) ) ( not ( = ?auto_867943 ?auto_867944 ) ) ( ON ?auto_867942 ?auto_867943 ) ( ON ?auto_867941 ?auto_867942 ) ( ON ?auto_867940 ?auto_867941 ) ( ON ?auto_867939 ?auto_867940 ) ( ON ?auto_867938 ?auto_867939 ) ( ON ?auto_867937 ?auto_867938 ) ( ON ?auto_867936 ?auto_867937 ) ( ON ?auto_867935 ?auto_867936 ) ( ON ?auto_867934 ?auto_867935 ) ( ON ?auto_867933 ?auto_867934 ) ( ON ?auto_867932 ?auto_867933 ) ( ON ?auto_867931 ?auto_867932 ) ( CLEAR ?auto_867929 ) ( ON ?auto_867930 ?auto_867931 ) ( CLEAR ?auto_867930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_867929 ?auto_867930 )
      ( MAKE-15PILE ?auto_867929 ?auto_867930 ?auto_867931 ?auto_867932 ?auto_867933 ?auto_867934 ?auto_867935 ?auto_867936 ?auto_867937 ?auto_867938 ?auto_867939 ?auto_867940 ?auto_867941 ?auto_867942 ?auto_867943 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_867991 - BLOCK
      ?auto_867992 - BLOCK
      ?auto_867993 - BLOCK
      ?auto_867994 - BLOCK
      ?auto_867995 - BLOCK
      ?auto_867996 - BLOCK
      ?auto_867997 - BLOCK
      ?auto_867998 - BLOCK
      ?auto_867999 - BLOCK
      ?auto_868000 - BLOCK
      ?auto_868001 - BLOCK
      ?auto_868002 - BLOCK
      ?auto_868003 - BLOCK
      ?auto_868004 - BLOCK
      ?auto_868005 - BLOCK
    )
    :vars
    (
      ?auto_868006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868005 ?auto_868006 ) ( not ( = ?auto_867991 ?auto_867992 ) ) ( not ( = ?auto_867991 ?auto_867993 ) ) ( not ( = ?auto_867991 ?auto_867994 ) ) ( not ( = ?auto_867991 ?auto_867995 ) ) ( not ( = ?auto_867991 ?auto_867996 ) ) ( not ( = ?auto_867991 ?auto_867997 ) ) ( not ( = ?auto_867991 ?auto_867998 ) ) ( not ( = ?auto_867991 ?auto_867999 ) ) ( not ( = ?auto_867991 ?auto_868000 ) ) ( not ( = ?auto_867991 ?auto_868001 ) ) ( not ( = ?auto_867991 ?auto_868002 ) ) ( not ( = ?auto_867991 ?auto_868003 ) ) ( not ( = ?auto_867991 ?auto_868004 ) ) ( not ( = ?auto_867991 ?auto_868005 ) ) ( not ( = ?auto_867991 ?auto_868006 ) ) ( not ( = ?auto_867992 ?auto_867993 ) ) ( not ( = ?auto_867992 ?auto_867994 ) ) ( not ( = ?auto_867992 ?auto_867995 ) ) ( not ( = ?auto_867992 ?auto_867996 ) ) ( not ( = ?auto_867992 ?auto_867997 ) ) ( not ( = ?auto_867992 ?auto_867998 ) ) ( not ( = ?auto_867992 ?auto_867999 ) ) ( not ( = ?auto_867992 ?auto_868000 ) ) ( not ( = ?auto_867992 ?auto_868001 ) ) ( not ( = ?auto_867992 ?auto_868002 ) ) ( not ( = ?auto_867992 ?auto_868003 ) ) ( not ( = ?auto_867992 ?auto_868004 ) ) ( not ( = ?auto_867992 ?auto_868005 ) ) ( not ( = ?auto_867992 ?auto_868006 ) ) ( not ( = ?auto_867993 ?auto_867994 ) ) ( not ( = ?auto_867993 ?auto_867995 ) ) ( not ( = ?auto_867993 ?auto_867996 ) ) ( not ( = ?auto_867993 ?auto_867997 ) ) ( not ( = ?auto_867993 ?auto_867998 ) ) ( not ( = ?auto_867993 ?auto_867999 ) ) ( not ( = ?auto_867993 ?auto_868000 ) ) ( not ( = ?auto_867993 ?auto_868001 ) ) ( not ( = ?auto_867993 ?auto_868002 ) ) ( not ( = ?auto_867993 ?auto_868003 ) ) ( not ( = ?auto_867993 ?auto_868004 ) ) ( not ( = ?auto_867993 ?auto_868005 ) ) ( not ( = ?auto_867993 ?auto_868006 ) ) ( not ( = ?auto_867994 ?auto_867995 ) ) ( not ( = ?auto_867994 ?auto_867996 ) ) ( not ( = ?auto_867994 ?auto_867997 ) ) ( not ( = ?auto_867994 ?auto_867998 ) ) ( not ( = ?auto_867994 ?auto_867999 ) ) ( not ( = ?auto_867994 ?auto_868000 ) ) ( not ( = ?auto_867994 ?auto_868001 ) ) ( not ( = ?auto_867994 ?auto_868002 ) ) ( not ( = ?auto_867994 ?auto_868003 ) ) ( not ( = ?auto_867994 ?auto_868004 ) ) ( not ( = ?auto_867994 ?auto_868005 ) ) ( not ( = ?auto_867994 ?auto_868006 ) ) ( not ( = ?auto_867995 ?auto_867996 ) ) ( not ( = ?auto_867995 ?auto_867997 ) ) ( not ( = ?auto_867995 ?auto_867998 ) ) ( not ( = ?auto_867995 ?auto_867999 ) ) ( not ( = ?auto_867995 ?auto_868000 ) ) ( not ( = ?auto_867995 ?auto_868001 ) ) ( not ( = ?auto_867995 ?auto_868002 ) ) ( not ( = ?auto_867995 ?auto_868003 ) ) ( not ( = ?auto_867995 ?auto_868004 ) ) ( not ( = ?auto_867995 ?auto_868005 ) ) ( not ( = ?auto_867995 ?auto_868006 ) ) ( not ( = ?auto_867996 ?auto_867997 ) ) ( not ( = ?auto_867996 ?auto_867998 ) ) ( not ( = ?auto_867996 ?auto_867999 ) ) ( not ( = ?auto_867996 ?auto_868000 ) ) ( not ( = ?auto_867996 ?auto_868001 ) ) ( not ( = ?auto_867996 ?auto_868002 ) ) ( not ( = ?auto_867996 ?auto_868003 ) ) ( not ( = ?auto_867996 ?auto_868004 ) ) ( not ( = ?auto_867996 ?auto_868005 ) ) ( not ( = ?auto_867996 ?auto_868006 ) ) ( not ( = ?auto_867997 ?auto_867998 ) ) ( not ( = ?auto_867997 ?auto_867999 ) ) ( not ( = ?auto_867997 ?auto_868000 ) ) ( not ( = ?auto_867997 ?auto_868001 ) ) ( not ( = ?auto_867997 ?auto_868002 ) ) ( not ( = ?auto_867997 ?auto_868003 ) ) ( not ( = ?auto_867997 ?auto_868004 ) ) ( not ( = ?auto_867997 ?auto_868005 ) ) ( not ( = ?auto_867997 ?auto_868006 ) ) ( not ( = ?auto_867998 ?auto_867999 ) ) ( not ( = ?auto_867998 ?auto_868000 ) ) ( not ( = ?auto_867998 ?auto_868001 ) ) ( not ( = ?auto_867998 ?auto_868002 ) ) ( not ( = ?auto_867998 ?auto_868003 ) ) ( not ( = ?auto_867998 ?auto_868004 ) ) ( not ( = ?auto_867998 ?auto_868005 ) ) ( not ( = ?auto_867998 ?auto_868006 ) ) ( not ( = ?auto_867999 ?auto_868000 ) ) ( not ( = ?auto_867999 ?auto_868001 ) ) ( not ( = ?auto_867999 ?auto_868002 ) ) ( not ( = ?auto_867999 ?auto_868003 ) ) ( not ( = ?auto_867999 ?auto_868004 ) ) ( not ( = ?auto_867999 ?auto_868005 ) ) ( not ( = ?auto_867999 ?auto_868006 ) ) ( not ( = ?auto_868000 ?auto_868001 ) ) ( not ( = ?auto_868000 ?auto_868002 ) ) ( not ( = ?auto_868000 ?auto_868003 ) ) ( not ( = ?auto_868000 ?auto_868004 ) ) ( not ( = ?auto_868000 ?auto_868005 ) ) ( not ( = ?auto_868000 ?auto_868006 ) ) ( not ( = ?auto_868001 ?auto_868002 ) ) ( not ( = ?auto_868001 ?auto_868003 ) ) ( not ( = ?auto_868001 ?auto_868004 ) ) ( not ( = ?auto_868001 ?auto_868005 ) ) ( not ( = ?auto_868001 ?auto_868006 ) ) ( not ( = ?auto_868002 ?auto_868003 ) ) ( not ( = ?auto_868002 ?auto_868004 ) ) ( not ( = ?auto_868002 ?auto_868005 ) ) ( not ( = ?auto_868002 ?auto_868006 ) ) ( not ( = ?auto_868003 ?auto_868004 ) ) ( not ( = ?auto_868003 ?auto_868005 ) ) ( not ( = ?auto_868003 ?auto_868006 ) ) ( not ( = ?auto_868004 ?auto_868005 ) ) ( not ( = ?auto_868004 ?auto_868006 ) ) ( not ( = ?auto_868005 ?auto_868006 ) ) ( ON ?auto_868004 ?auto_868005 ) ( ON ?auto_868003 ?auto_868004 ) ( ON ?auto_868002 ?auto_868003 ) ( ON ?auto_868001 ?auto_868002 ) ( ON ?auto_868000 ?auto_868001 ) ( ON ?auto_867999 ?auto_868000 ) ( ON ?auto_867998 ?auto_867999 ) ( ON ?auto_867997 ?auto_867998 ) ( ON ?auto_867996 ?auto_867997 ) ( ON ?auto_867995 ?auto_867996 ) ( ON ?auto_867994 ?auto_867995 ) ( ON ?auto_867993 ?auto_867994 ) ( ON ?auto_867992 ?auto_867993 ) ( ON ?auto_867991 ?auto_867992 ) ( CLEAR ?auto_867991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_867991 )
      ( MAKE-15PILE ?auto_867991 ?auto_867992 ?auto_867993 ?auto_867994 ?auto_867995 ?auto_867996 ?auto_867997 ?auto_867998 ?auto_867999 ?auto_868000 ?auto_868001 ?auto_868002 ?auto_868003 ?auto_868004 ?auto_868005 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868054 - BLOCK
      ?auto_868055 - BLOCK
      ?auto_868056 - BLOCK
      ?auto_868057 - BLOCK
      ?auto_868058 - BLOCK
      ?auto_868059 - BLOCK
      ?auto_868060 - BLOCK
      ?auto_868061 - BLOCK
      ?auto_868062 - BLOCK
      ?auto_868063 - BLOCK
      ?auto_868064 - BLOCK
      ?auto_868065 - BLOCK
      ?auto_868066 - BLOCK
      ?auto_868067 - BLOCK
      ?auto_868068 - BLOCK
      ?auto_868069 - BLOCK
    )
    :vars
    (
      ?auto_868070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_868068 ) ( ON ?auto_868069 ?auto_868070 ) ( CLEAR ?auto_868069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_868054 ) ( ON ?auto_868055 ?auto_868054 ) ( ON ?auto_868056 ?auto_868055 ) ( ON ?auto_868057 ?auto_868056 ) ( ON ?auto_868058 ?auto_868057 ) ( ON ?auto_868059 ?auto_868058 ) ( ON ?auto_868060 ?auto_868059 ) ( ON ?auto_868061 ?auto_868060 ) ( ON ?auto_868062 ?auto_868061 ) ( ON ?auto_868063 ?auto_868062 ) ( ON ?auto_868064 ?auto_868063 ) ( ON ?auto_868065 ?auto_868064 ) ( ON ?auto_868066 ?auto_868065 ) ( ON ?auto_868067 ?auto_868066 ) ( ON ?auto_868068 ?auto_868067 ) ( not ( = ?auto_868054 ?auto_868055 ) ) ( not ( = ?auto_868054 ?auto_868056 ) ) ( not ( = ?auto_868054 ?auto_868057 ) ) ( not ( = ?auto_868054 ?auto_868058 ) ) ( not ( = ?auto_868054 ?auto_868059 ) ) ( not ( = ?auto_868054 ?auto_868060 ) ) ( not ( = ?auto_868054 ?auto_868061 ) ) ( not ( = ?auto_868054 ?auto_868062 ) ) ( not ( = ?auto_868054 ?auto_868063 ) ) ( not ( = ?auto_868054 ?auto_868064 ) ) ( not ( = ?auto_868054 ?auto_868065 ) ) ( not ( = ?auto_868054 ?auto_868066 ) ) ( not ( = ?auto_868054 ?auto_868067 ) ) ( not ( = ?auto_868054 ?auto_868068 ) ) ( not ( = ?auto_868054 ?auto_868069 ) ) ( not ( = ?auto_868054 ?auto_868070 ) ) ( not ( = ?auto_868055 ?auto_868056 ) ) ( not ( = ?auto_868055 ?auto_868057 ) ) ( not ( = ?auto_868055 ?auto_868058 ) ) ( not ( = ?auto_868055 ?auto_868059 ) ) ( not ( = ?auto_868055 ?auto_868060 ) ) ( not ( = ?auto_868055 ?auto_868061 ) ) ( not ( = ?auto_868055 ?auto_868062 ) ) ( not ( = ?auto_868055 ?auto_868063 ) ) ( not ( = ?auto_868055 ?auto_868064 ) ) ( not ( = ?auto_868055 ?auto_868065 ) ) ( not ( = ?auto_868055 ?auto_868066 ) ) ( not ( = ?auto_868055 ?auto_868067 ) ) ( not ( = ?auto_868055 ?auto_868068 ) ) ( not ( = ?auto_868055 ?auto_868069 ) ) ( not ( = ?auto_868055 ?auto_868070 ) ) ( not ( = ?auto_868056 ?auto_868057 ) ) ( not ( = ?auto_868056 ?auto_868058 ) ) ( not ( = ?auto_868056 ?auto_868059 ) ) ( not ( = ?auto_868056 ?auto_868060 ) ) ( not ( = ?auto_868056 ?auto_868061 ) ) ( not ( = ?auto_868056 ?auto_868062 ) ) ( not ( = ?auto_868056 ?auto_868063 ) ) ( not ( = ?auto_868056 ?auto_868064 ) ) ( not ( = ?auto_868056 ?auto_868065 ) ) ( not ( = ?auto_868056 ?auto_868066 ) ) ( not ( = ?auto_868056 ?auto_868067 ) ) ( not ( = ?auto_868056 ?auto_868068 ) ) ( not ( = ?auto_868056 ?auto_868069 ) ) ( not ( = ?auto_868056 ?auto_868070 ) ) ( not ( = ?auto_868057 ?auto_868058 ) ) ( not ( = ?auto_868057 ?auto_868059 ) ) ( not ( = ?auto_868057 ?auto_868060 ) ) ( not ( = ?auto_868057 ?auto_868061 ) ) ( not ( = ?auto_868057 ?auto_868062 ) ) ( not ( = ?auto_868057 ?auto_868063 ) ) ( not ( = ?auto_868057 ?auto_868064 ) ) ( not ( = ?auto_868057 ?auto_868065 ) ) ( not ( = ?auto_868057 ?auto_868066 ) ) ( not ( = ?auto_868057 ?auto_868067 ) ) ( not ( = ?auto_868057 ?auto_868068 ) ) ( not ( = ?auto_868057 ?auto_868069 ) ) ( not ( = ?auto_868057 ?auto_868070 ) ) ( not ( = ?auto_868058 ?auto_868059 ) ) ( not ( = ?auto_868058 ?auto_868060 ) ) ( not ( = ?auto_868058 ?auto_868061 ) ) ( not ( = ?auto_868058 ?auto_868062 ) ) ( not ( = ?auto_868058 ?auto_868063 ) ) ( not ( = ?auto_868058 ?auto_868064 ) ) ( not ( = ?auto_868058 ?auto_868065 ) ) ( not ( = ?auto_868058 ?auto_868066 ) ) ( not ( = ?auto_868058 ?auto_868067 ) ) ( not ( = ?auto_868058 ?auto_868068 ) ) ( not ( = ?auto_868058 ?auto_868069 ) ) ( not ( = ?auto_868058 ?auto_868070 ) ) ( not ( = ?auto_868059 ?auto_868060 ) ) ( not ( = ?auto_868059 ?auto_868061 ) ) ( not ( = ?auto_868059 ?auto_868062 ) ) ( not ( = ?auto_868059 ?auto_868063 ) ) ( not ( = ?auto_868059 ?auto_868064 ) ) ( not ( = ?auto_868059 ?auto_868065 ) ) ( not ( = ?auto_868059 ?auto_868066 ) ) ( not ( = ?auto_868059 ?auto_868067 ) ) ( not ( = ?auto_868059 ?auto_868068 ) ) ( not ( = ?auto_868059 ?auto_868069 ) ) ( not ( = ?auto_868059 ?auto_868070 ) ) ( not ( = ?auto_868060 ?auto_868061 ) ) ( not ( = ?auto_868060 ?auto_868062 ) ) ( not ( = ?auto_868060 ?auto_868063 ) ) ( not ( = ?auto_868060 ?auto_868064 ) ) ( not ( = ?auto_868060 ?auto_868065 ) ) ( not ( = ?auto_868060 ?auto_868066 ) ) ( not ( = ?auto_868060 ?auto_868067 ) ) ( not ( = ?auto_868060 ?auto_868068 ) ) ( not ( = ?auto_868060 ?auto_868069 ) ) ( not ( = ?auto_868060 ?auto_868070 ) ) ( not ( = ?auto_868061 ?auto_868062 ) ) ( not ( = ?auto_868061 ?auto_868063 ) ) ( not ( = ?auto_868061 ?auto_868064 ) ) ( not ( = ?auto_868061 ?auto_868065 ) ) ( not ( = ?auto_868061 ?auto_868066 ) ) ( not ( = ?auto_868061 ?auto_868067 ) ) ( not ( = ?auto_868061 ?auto_868068 ) ) ( not ( = ?auto_868061 ?auto_868069 ) ) ( not ( = ?auto_868061 ?auto_868070 ) ) ( not ( = ?auto_868062 ?auto_868063 ) ) ( not ( = ?auto_868062 ?auto_868064 ) ) ( not ( = ?auto_868062 ?auto_868065 ) ) ( not ( = ?auto_868062 ?auto_868066 ) ) ( not ( = ?auto_868062 ?auto_868067 ) ) ( not ( = ?auto_868062 ?auto_868068 ) ) ( not ( = ?auto_868062 ?auto_868069 ) ) ( not ( = ?auto_868062 ?auto_868070 ) ) ( not ( = ?auto_868063 ?auto_868064 ) ) ( not ( = ?auto_868063 ?auto_868065 ) ) ( not ( = ?auto_868063 ?auto_868066 ) ) ( not ( = ?auto_868063 ?auto_868067 ) ) ( not ( = ?auto_868063 ?auto_868068 ) ) ( not ( = ?auto_868063 ?auto_868069 ) ) ( not ( = ?auto_868063 ?auto_868070 ) ) ( not ( = ?auto_868064 ?auto_868065 ) ) ( not ( = ?auto_868064 ?auto_868066 ) ) ( not ( = ?auto_868064 ?auto_868067 ) ) ( not ( = ?auto_868064 ?auto_868068 ) ) ( not ( = ?auto_868064 ?auto_868069 ) ) ( not ( = ?auto_868064 ?auto_868070 ) ) ( not ( = ?auto_868065 ?auto_868066 ) ) ( not ( = ?auto_868065 ?auto_868067 ) ) ( not ( = ?auto_868065 ?auto_868068 ) ) ( not ( = ?auto_868065 ?auto_868069 ) ) ( not ( = ?auto_868065 ?auto_868070 ) ) ( not ( = ?auto_868066 ?auto_868067 ) ) ( not ( = ?auto_868066 ?auto_868068 ) ) ( not ( = ?auto_868066 ?auto_868069 ) ) ( not ( = ?auto_868066 ?auto_868070 ) ) ( not ( = ?auto_868067 ?auto_868068 ) ) ( not ( = ?auto_868067 ?auto_868069 ) ) ( not ( = ?auto_868067 ?auto_868070 ) ) ( not ( = ?auto_868068 ?auto_868069 ) ) ( not ( = ?auto_868068 ?auto_868070 ) ) ( not ( = ?auto_868069 ?auto_868070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_868069 ?auto_868070 )
      ( !STACK ?auto_868069 ?auto_868068 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868120 - BLOCK
      ?auto_868121 - BLOCK
      ?auto_868122 - BLOCK
      ?auto_868123 - BLOCK
      ?auto_868124 - BLOCK
      ?auto_868125 - BLOCK
      ?auto_868126 - BLOCK
      ?auto_868127 - BLOCK
      ?auto_868128 - BLOCK
      ?auto_868129 - BLOCK
      ?auto_868130 - BLOCK
      ?auto_868131 - BLOCK
      ?auto_868132 - BLOCK
      ?auto_868133 - BLOCK
      ?auto_868134 - BLOCK
      ?auto_868135 - BLOCK
    )
    :vars
    (
      ?auto_868136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868135 ?auto_868136 ) ( ON-TABLE ?auto_868120 ) ( ON ?auto_868121 ?auto_868120 ) ( ON ?auto_868122 ?auto_868121 ) ( ON ?auto_868123 ?auto_868122 ) ( ON ?auto_868124 ?auto_868123 ) ( ON ?auto_868125 ?auto_868124 ) ( ON ?auto_868126 ?auto_868125 ) ( ON ?auto_868127 ?auto_868126 ) ( ON ?auto_868128 ?auto_868127 ) ( ON ?auto_868129 ?auto_868128 ) ( ON ?auto_868130 ?auto_868129 ) ( ON ?auto_868131 ?auto_868130 ) ( ON ?auto_868132 ?auto_868131 ) ( ON ?auto_868133 ?auto_868132 ) ( not ( = ?auto_868120 ?auto_868121 ) ) ( not ( = ?auto_868120 ?auto_868122 ) ) ( not ( = ?auto_868120 ?auto_868123 ) ) ( not ( = ?auto_868120 ?auto_868124 ) ) ( not ( = ?auto_868120 ?auto_868125 ) ) ( not ( = ?auto_868120 ?auto_868126 ) ) ( not ( = ?auto_868120 ?auto_868127 ) ) ( not ( = ?auto_868120 ?auto_868128 ) ) ( not ( = ?auto_868120 ?auto_868129 ) ) ( not ( = ?auto_868120 ?auto_868130 ) ) ( not ( = ?auto_868120 ?auto_868131 ) ) ( not ( = ?auto_868120 ?auto_868132 ) ) ( not ( = ?auto_868120 ?auto_868133 ) ) ( not ( = ?auto_868120 ?auto_868134 ) ) ( not ( = ?auto_868120 ?auto_868135 ) ) ( not ( = ?auto_868120 ?auto_868136 ) ) ( not ( = ?auto_868121 ?auto_868122 ) ) ( not ( = ?auto_868121 ?auto_868123 ) ) ( not ( = ?auto_868121 ?auto_868124 ) ) ( not ( = ?auto_868121 ?auto_868125 ) ) ( not ( = ?auto_868121 ?auto_868126 ) ) ( not ( = ?auto_868121 ?auto_868127 ) ) ( not ( = ?auto_868121 ?auto_868128 ) ) ( not ( = ?auto_868121 ?auto_868129 ) ) ( not ( = ?auto_868121 ?auto_868130 ) ) ( not ( = ?auto_868121 ?auto_868131 ) ) ( not ( = ?auto_868121 ?auto_868132 ) ) ( not ( = ?auto_868121 ?auto_868133 ) ) ( not ( = ?auto_868121 ?auto_868134 ) ) ( not ( = ?auto_868121 ?auto_868135 ) ) ( not ( = ?auto_868121 ?auto_868136 ) ) ( not ( = ?auto_868122 ?auto_868123 ) ) ( not ( = ?auto_868122 ?auto_868124 ) ) ( not ( = ?auto_868122 ?auto_868125 ) ) ( not ( = ?auto_868122 ?auto_868126 ) ) ( not ( = ?auto_868122 ?auto_868127 ) ) ( not ( = ?auto_868122 ?auto_868128 ) ) ( not ( = ?auto_868122 ?auto_868129 ) ) ( not ( = ?auto_868122 ?auto_868130 ) ) ( not ( = ?auto_868122 ?auto_868131 ) ) ( not ( = ?auto_868122 ?auto_868132 ) ) ( not ( = ?auto_868122 ?auto_868133 ) ) ( not ( = ?auto_868122 ?auto_868134 ) ) ( not ( = ?auto_868122 ?auto_868135 ) ) ( not ( = ?auto_868122 ?auto_868136 ) ) ( not ( = ?auto_868123 ?auto_868124 ) ) ( not ( = ?auto_868123 ?auto_868125 ) ) ( not ( = ?auto_868123 ?auto_868126 ) ) ( not ( = ?auto_868123 ?auto_868127 ) ) ( not ( = ?auto_868123 ?auto_868128 ) ) ( not ( = ?auto_868123 ?auto_868129 ) ) ( not ( = ?auto_868123 ?auto_868130 ) ) ( not ( = ?auto_868123 ?auto_868131 ) ) ( not ( = ?auto_868123 ?auto_868132 ) ) ( not ( = ?auto_868123 ?auto_868133 ) ) ( not ( = ?auto_868123 ?auto_868134 ) ) ( not ( = ?auto_868123 ?auto_868135 ) ) ( not ( = ?auto_868123 ?auto_868136 ) ) ( not ( = ?auto_868124 ?auto_868125 ) ) ( not ( = ?auto_868124 ?auto_868126 ) ) ( not ( = ?auto_868124 ?auto_868127 ) ) ( not ( = ?auto_868124 ?auto_868128 ) ) ( not ( = ?auto_868124 ?auto_868129 ) ) ( not ( = ?auto_868124 ?auto_868130 ) ) ( not ( = ?auto_868124 ?auto_868131 ) ) ( not ( = ?auto_868124 ?auto_868132 ) ) ( not ( = ?auto_868124 ?auto_868133 ) ) ( not ( = ?auto_868124 ?auto_868134 ) ) ( not ( = ?auto_868124 ?auto_868135 ) ) ( not ( = ?auto_868124 ?auto_868136 ) ) ( not ( = ?auto_868125 ?auto_868126 ) ) ( not ( = ?auto_868125 ?auto_868127 ) ) ( not ( = ?auto_868125 ?auto_868128 ) ) ( not ( = ?auto_868125 ?auto_868129 ) ) ( not ( = ?auto_868125 ?auto_868130 ) ) ( not ( = ?auto_868125 ?auto_868131 ) ) ( not ( = ?auto_868125 ?auto_868132 ) ) ( not ( = ?auto_868125 ?auto_868133 ) ) ( not ( = ?auto_868125 ?auto_868134 ) ) ( not ( = ?auto_868125 ?auto_868135 ) ) ( not ( = ?auto_868125 ?auto_868136 ) ) ( not ( = ?auto_868126 ?auto_868127 ) ) ( not ( = ?auto_868126 ?auto_868128 ) ) ( not ( = ?auto_868126 ?auto_868129 ) ) ( not ( = ?auto_868126 ?auto_868130 ) ) ( not ( = ?auto_868126 ?auto_868131 ) ) ( not ( = ?auto_868126 ?auto_868132 ) ) ( not ( = ?auto_868126 ?auto_868133 ) ) ( not ( = ?auto_868126 ?auto_868134 ) ) ( not ( = ?auto_868126 ?auto_868135 ) ) ( not ( = ?auto_868126 ?auto_868136 ) ) ( not ( = ?auto_868127 ?auto_868128 ) ) ( not ( = ?auto_868127 ?auto_868129 ) ) ( not ( = ?auto_868127 ?auto_868130 ) ) ( not ( = ?auto_868127 ?auto_868131 ) ) ( not ( = ?auto_868127 ?auto_868132 ) ) ( not ( = ?auto_868127 ?auto_868133 ) ) ( not ( = ?auto_868127 ?auto_868134 ) ) ( not ( = ?auto_868127 ?auto_868135 ) ) ( not ( = ?auto_868127 ?auto_868136 ) ) ( not ( = ?auto_868128 ?auto_868129 ) ) ( not ( = ?auto_868128 ?auto_868130 ) ) ( not ( = ?auto_868128 ?auto_868131 ) ) ( not ( = ?auto_868128 ?auto_868132 ) ) ( not ( = ?auto_868128 ?auto_868133 ) ) ( not ( = ?auto_868128 ?auto_868134 ) ) ( not ( = ?auto_868128 ?auto_868135 ) ) ( not ( = ?auto_868128 ?auto_868136 ) ) ( not ( = ?auto_868129 ?auto_868130 ) ) ( not ( = ?auto_868129 ?auto_868131 ) ) ( not ( = ?auto_868129 ?auto_868132 ) ) ( not ( = ?auto_868129 ?auto_868133 ) ) ( not ( = ?auto_868129 ?auto_868134 ) ) ( not ( = ?auto_868129 ?auto_868135 ) ) ( not ( = ?auto_868129 ?auto_868136 ) ) ( not ( = ?auto_868130 ?auto_868131 ) ) ( not ( = ?auto_868130 ?auto_868132 ) ) ( not ( = ?auto_868130 ?auto_868133 ) ) ( not ( = ?auto_868130 ?auto_868134 ) ) ( not ( = ?auto_868130 ?auto_868135 ) ) ( not ( = ?auto_868130 ?auto_868136 ) ) ( not ( = ?auto_868131 ?auto_868132 ) ) ( not ( = ?auto_868131 ?auto_868133 ) ) ( not ( = ?auto_868131 ?auto_868134 ) ) ( not ( = ?auto_868131 ?auto_868135 ) ) ( not ( = ?auto_868131 ?auto_868136 ) ) ( not ( = ?auto_868132 ?auto_868133 ) ) ( not ( = ?auto_868132 ?auto_868134 ) ) ( not ( = ?auto_868132 ?auto_868135 ) ) ( not ( = ?auto_868132 ?auto_868136 ) ) ( not ( = ?auto_868133 ?auto_868134 ) ) ( not ( = ?auto_868133 ?auto_868135 ) ) ( not ( = ?auto_868133 ?auto_868136 ) ) ( not ( = ?auto_868134 ?auto_868135 ) ) ( not ( = ?auto_868134 ?auto_868136 ) ) ( not ( = ?auto_868135 ?auto_868136 ) ) ( CLEAR ?auto_868133 ) ( ON ?auto_868134 ?auto_868135 ) ( CLEAR ?auto_868134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_868120 ?auto_868121 ?auto_868122 ?auto_868123 ?auto_868124 ?auto_868125 ?auto_868126 ?auto_868127 ?auto_868128 ?auto_868129 ?auto_868130 ?auto_868131 ?auto_868132 ?auto_868133 ?auto_868134 )
      ( MAKE-16PILE ?auto_868120 ?auto_868121 ?auto_868122 ?auto_868123 ?auto_868124 ?auto_868125 ?auto_868126 ?auto_868127 ?auto_868128 ?auto_868129 ?auto_868130 ?auto_868131 ?auto_868132 ?auto_868133 ?auto_868134 ?auto_868135 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868186 - BLOCK
      ?auto_868187 - BLOCK
      ?auto_868188 - BLOCK
      ?auto_868189 - BLOCK
      ?auto_868190 - BLOCK
      ?auto_868191 - BLOCK
      ?auto_868192 - BLOCK
      ?auto_868193 - BLOCK
      ?auto_868194 - BLOCK
      ?auto_868195 - BLOCK
      ?auto_868196 - BLOCK
      ?auto_868197 - BLOCK
      ?auto_868198 - BLOCK
      ?auto_868199 - BLOCK
      ?auto_868200 - BLOCK
      ?auto_868201 - BLOCK
    )
    :vars
    (
      ?auto_868202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868201 ?auto_868202 ) ( ON-TABLE ?auto_868186 ) ( ON ?auto_868187 ?auto_868186 ) ( ON ?auto_868188 ?auto_868187 ) ( ON ?auto_868189 ?auto_868188 ) ( ON ?auto_868190 ?auto_868189 ) ( ON ?auto_868191 ?auto_868190 ) ( ON ?auto_868192 ?auto_868191 ) ( ON ?auto_868193 ?auto_868192 ) ( ON ?auto_868194 ?auto_868193 ) ( ON ?auto_868195 ?auto_868194 ) ( ON ?auto_868196 ?auto_868195 ) ( ON ?auto_868197 ?auto_868196 ) ( ON ?auto_868198 ?auto_868197 ) ( not ( = ?auto_868186 ?auto_868187 ) ) ( not ( = ?auto_868186 ?auto_868188 ) ) ( not ( = ?auto_868186 ?auto_868189 ) ) ( not ( = ?auto_868186 ?auto_868190 ) ) ( not ( = ?auto_868186 ?auto_868191 ) ) ( not ( = ?auto_868186 ?auto_868192 ) ) ( not ( = ?auto_868186 ?auto_868193 ) ) ( not ( = ?auto_868186 ?auto_868194 ) ) ( not ( = ?auto_868186 ?auto_868195 ) ) ( not ( = ?auto_868186 ?auto_868196 ) ) ( not ( = ?auto_868186 ?auto_868197 ) ) ( not ( = ?auto_868186 ?auto_868198 ) ) ( not ( = ?auto_868186 ?auto_868199 ) ) ( not ( = ?auto_868186 ?auto_868200 ) ) ( not ( = ?auto_868186 ?auto_868201 ) ) ( not ( = ?auto_868186 ?auto_868202 ) ) ( not ( = ?auto_868187 ?auto_868188 ) ) ( not ( = ?auto_868187 ?auto_868189 ) ) ( not ( = ?auto_868187 ?auto_868190 ) ) ( not ( = ?auto_868187 ?auto_868191 ) ) ( not ( = ?auto_868187 ?auto_868192 ) ) ( not ( = ?auto_868187 ?auto_868193 ) ) ( not ( = ?auto_868187 ?auto_868194 ) ) ( not ( = ?auto_868187 ?auto_868195 ) ) ( not ( = ?auto_868187 ?auto_868196 ) ) ( not ( = ?auto_868187 ?auto_868197 ) ) ( not ( = ?auto_868187 ?auto_868198 ) ) ( not ( = ?auto_868187 ?auto_868199 ) ) ( not ( = ?auto_868187 ?auto_868200 ) ) ( not ( = ?auto_868187 ?auto_868201 ) ) ( not ( = ?auto_868187 ?auto_868202 ) ) ( not ( = ?auto_868188 ?auto_868189 ) ) ( not ( = ?auto_868188 ?auto_868190 ) ) ( not ( = ?auto_868188 ?auto_868191 ) ) ( not ( = ?auto_868188 ?auto_868192 ) ) ( not ( = ?auto_868188 ?auto_868193 ) ) ( not ( = ?auto_868188 ?auto_868194 ) ) ( not ( = ?auto_868188 ?auto_868195 ) ) ( not ( = ?auto_868188 ?auto_868196 ) ) ( not ( = ?auto_868188 ?auto_868197 ) ) ( not ( = ?auto_868188 ?auto_868198 ) ) ( not ( = ?auto_868188 ?auto_868199 ) ) ( not ( = ?auto_868188 ?auto_868200 ) ) ( not ( = ?auto_868188 ?auto_868201 ) ) ( not ( = ?auto_868188 ?auto_868202 ) ) ( not ( = ?auto_868189 ?auto_868190 ) ) ( not ( = ?auto_868189 ?auto_868191 ) ) ( not ( = ?auto_868189 ?auto_868192 ) ) ( not ( = ?auto_868189 ?auto_868193 ) ) ( not ( = ?auto_868189 ?auto_868194 ) ) ( not ( = ?auto_868189 ?auto_868195 ) ) ( not ( = ?auto_868189 ?auto_868196 ) ) ( not ( = ?auto_868189 ?auto_868197 ) ) ( not ( = ?auto_868189 ?auto_868198 ) ) ( not ( = ?auto_868189 ?auto_868199 ) ) ( not ( = ?auto_868189 ?auto_868200 ) ) ( not ( = ?auto_868189 ?auto_868201 ) ) ( not ( = ?auto_868189 ?auto_868202 ) ) ( not ( = ?auto_868190 ?auto_868191 ) ) ( not ( = ?auto_868190 ?auto_868192 ) ) ( not ( = ?auto_868190 ?auto_868193 ) ) ( not ( = ?auto_868190 ?auto_868194 ) ) ( not ( = ?auto_868190 ?auto_868195 ) ) ( not ( = ?auto_868190 ?auto_868196 ) ) ( not ( = ?auto_868190 ?auto_868197 ) ) ( not ( = ?auto_868190 ?auto_868198 ) ) ( not ( = ?auto_868190 ?auto_868199 ) ) ( not ( = ?auto_868190 ?auto_868200 ) ) ( not ( = ?auto_868190 ?auto_868201 ) ) ( not ( = ?auto_868190 ?auto_868202 ) ) ( not ( = ?auto_868191 ?auto_868192 ) ) ( not ( = ?auto_868191 ?auto_868193 ) ) ( not ( = ?auto_868191 ?auto_868194 ) ) ( not ( = ?auto_868191 ?auto_868195 ) ) ( not ( = ?auto_868191 ?auto_868196 ) ) ( not ( = ?auto_868191 ?auto_868197 ) ) ( not ( = ?auto_868191 ?auto_868198 ) ) ( not ( = ?auto_868191 ?auto_868199 ) ) ( not ( = ?auto_868191 ?auto_868200 ) ) ( not ( = ?auto_868191 ?auto_868201 ) ) ( not ( = ?auto_868191 ?auto_868202 ) ) ( not ( = ?auto_868192 ?auto_868193 ) ) ( not ( = ?auto_868192 ?auto_868194 ) ) ( not ( = ?auto_868192 ?auto_868195 ) ) ( not ( = ?auto_868192 ?auto_868196 ) ) ( not ( = ?auto_868192 ?auto_868197 ) ) ( not ( = ?auto_868192 ?auto_868198 ) ) ( not ( = ?auto_868192 ?auto_868199 ) ) ( not ( = ?auto_868192 ?auto_868200 ) ) ( not ( = ?auto_868192 ?auto_868201 ) ) ( not ( = ?auto_868192 ?auto_868202 ) ) ( not ( = ?auto_868193 ?auto_868194 ) ) ( not ( = ?auto_868193 ?auto_868195 ) ) ( not ( = ?auto_868193 ?auto_868196 ) ) ( not ( = ?auto_868193 ?auto_868197 ) ) ( not ( = ?auto_868193 ?auto_868198 ) ) ( not ( = ?auto_868193 ?auto_868199 ) ) ( not ( = ?auto_868193 ?auto_868200 ) ) ( not ( = ?auto_868193 ?auto_868201 ) ) ( not ( = ?auto_868193 ?auto_868202 ) ) ( not ( = ?auto_868194 ?auto_868195 ) ) ( not ( = ?auto_868194 ?auto_868196 ) ) ( not ( = ?auto_868194 ?auto_868197 ) ) ( not ( = ?auto_868194 ?auto_868198 ) ) ( not ( = ?auto_868194 ?auto_868199 ) ) ( not ( = ?auto_868194 ?auto_868200 ) ) ( not ( = ?auto_868194 ?auto_868201 ) ) ( not ( = ?auto_868194 ?auto_868202 ) ) ( not ( = ?auto_868195 ?auto_868196 ) ) ( not ( = ?auto_868195 ?auto_868197 ) ) ( not ( = ?auto_868195 ?auto_868198 ) ) ( not ( = ?auto_868195 ?auto_868199 ) ) ( not ( = ?auto_868195 ?auto_868200 ) ) ( not ( = ?auto_868195 ?auto_868201 ) ) ( not ( = ?auto_868195 ?auto_868202 ) ) ( not ( = ?auto_868196 ?auto_868197 ) ) ( not ( = ?auto_868196 ?auto_868198 ) ) ( not ( = ?auto_868196 ?auto_868199 ) ) ( not ( = ?auto_868196 ?auto_868200 ) ) ( not ( = ?auto_868196 ?auto_868201 ) ) ( not ( = ?auto_868196 ?auto_868202 ) ) ( not ( = ?auto_868197 ?auto_868198 ) ) ( not ( = ?auto_868197 ?auto_868199 ) ) ( not ( = ?auto_868197 ?auto_868200 ) ) ( not ( = ?auto_868197 ?auto_868201 ) ) ( not ( = ?auto_868197 ?auto_868202 ) ) ( not ( = ?auto_868198 ?auto_868199 ) ) ( not ( = ?auto_868198 ?auto_868200 ) ) ( not ( = ?auto_868198 ?auto_868201 ) ) ( not ( = ?auto_868198 ?auto_868202 ) ) ( not ( = ?auto_868199 ?auto_868200 ) ) ( not ( = ?auto_868199 ?auto_868201 ) ) ( not ( = ?auto_868199 ?auto_868202 ) ) ( not ( = ?auto_868200 ?auto_868201 ) ) ( not ( = ?auto_868200 ?auto_868202 ) ) ( not ( = ?auto_868201 ?auto_868202 ) ) ( ON ?auto_868200 ?auto_868201 ) ( CLEAR ?auto_868198 ) ( ON ?auto_868199 ?auto_868200 ) ( CLEAR ?auto_868199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_868186 ?auto_868187 ?auto_868188 ?auto_868189 ?auto_868190 ?auto_868191 ?auto_868192 ?auto_868193 ?auto_868194 ?auto_868195 ?auto_868196 ?auto_868197 ?auto_868198 ?auto_868199 )
      ( MAKE-16PILE ?auto_868186 ?auto_868187 ?auto_868188 ?auto_868189 ?auto_868190 ?auto_868191 ?auto_868192 ?auto_868193 ?auto_868194 ?auto_868195 ?auto_868196 ?auto_868197 ?auto_868198 ?auto_868199 ?auto_868200 ?auto_868201 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868252 - BLOCK
      ?auto_868253 - BLOCK
      ?auto_868254 - BLOCK
      ?auto_868255 - BLOCK
      ?auto_868256 - BLOCK
      ?auto_868257 - BLOCK
      ?auto_868258 - BLOCK
      ?auto_868259 - BLOCK
      ?auto_868260 - BLOCK
      ?auto_868261 - BLOCK
      ?auto_868262 - BLOCK
      ?auto_868263 - BLOCK
      ?auto_868264 - BLOCK
      ?auto_868265 - BLOCK
      ?auto_868266 - BLOCK
      ?auto_868267 - BLOCK
    )
    :vars
    (
      ?auto_868268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868267 ?auto_868268 ) ( ON-TABLE ?auto_868252 ) ( ON ?auto_868253 ?auto_868252 ) ( ON ?auto_868254 ?auto_868253 ) ( ON ?auto_868255 ?auto_868254 ) ( ON ?auto_868256 ?auto_868255 ) ( ON ?auto_868257 ?auto_868256 ) ( ON ?auto_868258 ?auto_868257 ) ( ON ?auto_868259 ?auto_868258 ) ( ON ?auto_868260 ?auto_868259 ) ( ON ?auto_868261 ?auto_868260 ) ( ON ?auto_868262 ?auto_868261 ) ( ON ?auto_868263 ?auto_868262 ) ( not ( = ?auto_868252 ?auto_868253 ) ) ( not ( = ?auto_868252 ?auto_868254 ) ) ( not ( = ?auto_868252 ?auto_868255 ) ) ( not ( = ?auto_868252 ?auto_868256 ) ) ( not ( = ?auto_868252 ?auto_868257 ) ) ( not ( = ?auto_868252 ?auto_868258 ) ) ( not ( = ?auto_868252 ?auto_868259 ) ) ( not ( = ?auto_868252 ?auto_868260 ) ) ( not ( = ?auto_868252 ?auto_868261 ) ) ( not ( = ?auto_868252 ?auto_868262 ) ) ( not ( = ?auto_868252 ?auto_868263 ) ) ( not ( = ?auto_868252 ?auto_868264 ) ) ( not ( = ?auto_868252 ?auto_868265 ) ) ( not ( = ?auto_868252 ?auto_868266 ) ) ( not ( = ?auto_868252 ?auto_868267 ) ) ( not ( = ?auto_868252 ?auto_868268 ) ) ( not ( = ?auto_868253 ?auto_868254 ) ) ( not ( = ?auto_868253 ?auto_868255 ) ) ( not ( = ?auto_868253 ?auto_868256 ) ) ( not ( = ?auto_868253 ?auto_868257 ) ) ( not ( = ?auto_868253 ?auto_868258 ) ) ( not ( = ?auto_868253 ?auto_868259 ) ) ( not ( = ?auto_868253 ?auto_868260 ) ) ( not ( = ?auto_868253 ?auto_868261 ) ) ( not ( = ?auto_868253 ?auto_868262 ) ) ( not ( = ?auto_868253 ?auto_868263 ) ) ( not ( = ?auto_868253 ?auto_868264 ) ) ( not ( = ?auto_868253 ?auto_868265 ) ) ( not ( = ?auto_868253 ?auto_868266 ) ) ( not ( = ?auto_868253 ?auto_868267 ) ) ( not ( = ?auto_868253 ?auto_868268 ) ) ( not ( = ?auto_868254 ?auto_868255 ) ) ( not ( = ?auto_868254 ?auto_868256 ) ) ( not ( = ?auto_868254 ?auto_868257 ) ) ( not ( = ?auto_868254 ?auto_868258 ) ) ( not ( = ?auto_868254 ?auto_868259 ) ) ( not ( = ?auto_868254 ?auto_868260 ) ) ( not ( = ?auto_868254 ?auto_868261 ) ) ( not ( = ?auto_868254 ?auto_868262 ) ) ( not ( = ?auto_868254 ?auto_868263 ) ) ( not ( = ?auto_868254 ?auto_868264 ) ) ( not ( = ?auto_868254 ?auto_868265 ) ) ( not ( = ?auto_868254 ?auto_868266 ) ) ( not ( = ?auto_868254 ?auto_868267 ) ) ( not ( = ?auto_868254 ?auto_868268 ) ) ( not ( = ?auto_868255 ?auto_868256 ) ) ( not ( = ?auto_868255 ?auto_868257 ) ) ( not ( = ?auto_868255 ?auto_868258 ) ) ( not ( = ?auto_868255 ?auto_868259 ) ) ( not ( = ?auto_868255 ?auto_868260 ) ) ( not ( = ?auto_868255 ?auto_868261 ) ) ( not ( = ?auto_868255 ?auto_868262 ) ) ( not ( = ?auto_868255 ?auto_868263 ) ) ( not ( = ?auto_868255 ?auto_868264 ) ) ( not ( = ?auto_868255 ?auto_868265 ) ) ( not ( = ?auto_868255 ?auto_868266 ) ) ( not ( = ?auto_868255 ?auto_868267 ) ) ( not ( = ?auto_868255 ?auto_868268 ) ) ( not ( = ?auto_868256 ?auto_868257 ) ) ( not ( = ?auto_868256 ?auto_868258 ) ) ( not ( = ?auto_868256 ?auto_868259 ) ) ( not ( = ?auto_868256 ?auto_868260 ) ) ( not ( = ?auto_868256 ?auto_868261 ) ) ( not ( = ?auto_868256 ?auto_868262 ) ) ( not ( = ?auto_868256 ?auto_868263 ) ) ( not ( = ?auto_868256 ?auto_868264 ) ) ( not ( = ?auto_868256 ?auto_868265 ) ) ( not ( = ?auto_868256 ?auto_868266 ) ) ( not ( = ?auto_868256 ?auto_868267 ) ) ( not ( = ?auto_868256 ?auto_868268 ) ) ( not ( = ?auto_868257 ?auto_868258 ) ) ( not ( = ?auto_868257 ?auto_868259 ) ) ( not ( = ?auto_868257 ?auto_868260 ) ) ( not ( = ?auto_868257 ?auto_868261 ) ) ( not ( = ?auto_868257 ?auto_868262 ) ) ( not ( = ?auto_868257 ?auto_868263 ) ) ( not ( = ?auto_868257 ?auto_868264 ) ) ( not ( = ?auto_868257 ?auto_868265 ) ) ( not ( = ?auto_868257 ?auto_868266 ) ) ( not ( = ?auto_868257 ?auto_868267 ) ) ( not ( = ?auto_868257 ?auto_868268 ) ) ( not ( = ?auto_868258 ?auto_868259 ) ) ( not ( = ?auto_868258 ?auto_868260 ) ) ( not ( = ?auto_868258 ?auto_868261 ) ) ( not ( = ?auto_868258 ?auto_868262 ) ) ( not ( = ?auto_868258 ?auto_868263 ) ) ( not ( = ?auto_868258 ?auto_868264 ) ) ( not ( = ?auto_868258 ?auto_868265 ) ) ( not ( = ?auto_868258 ?auto_868266 ) ) ( not ( = ?auto_868258 ?auto_868267 ) ) ( not ( = ?auto_868258 ?auto_868268 ) ) ( not ( = ?auto_868259 ?auto_868260 ) ) ( not ( = ?auto_868259 ?auto_868261 ) ) ( not ( = ?auto_868259 ?auto_868262 ) ) ( not ( = ?auto_868259 ?auto_868263 ) ) ( not ( = ?auto_868259 ?auto_868264 ) ) ( not ( = ?auto_868259 ?auto_868265 ) ) ( not ( = ?auto_868259 ?auto_868266 ) ) ( not ( = ?auto_868259 ?auto_868267 ) ) ( not ( = ?auto_868259 ?auto_868268 ) ) ( not ( = ?auto_868260 ?auto_868261 ) ) ( not ( = ?auto_868260 ?auto_868262 ) ) ( not ( = ?auto_868260 ?auto_868263 ) ) ( not ( = ?auto_868260 ?auto_868264 ) ) ( not ( = ?auto_868260 ?auto_868265 ) ) ( not ( = ?auto_868260 ?auto_868266 ) ) ( not ( = ?auto_868260 ?auto_868267 ) ) ( not ( = ?auto_868260 ?auto_868268 ) ) ( not ( = ?auto_868261 ?auto_868262 ) ) ( not ( = ?auto_868261 ?auto_868263 ) ) ( not ( = ?auto_868261 ?auto_868264 ) ) ( not ( = ?auto_868261 ?auto_868265 ) ) ( not ( = ?auto_868261 ?auto_868266 ) ) ( not ( = ?auto_868261 ?auto_868267 ) ) ( not ( = ?auto_868261 ?auto_868268 ) ) ( not ( = ?auto_868262 ?auto_868263 ) ) ( not ( = ?auto_868262 ?auto_868264 ) ) ( not ( = ?auto_868262 ?auto_868265 ) ) ( not ( = ?auto_868262 ?auto_868266 ) ) ( not ( = ?auto_868262 ?auto_868267 ) ) ( not ( = ?auto_868262 ?auto_868268 ) ) ( not ( = ?auto_868263 ?auto_868264 ) ) ( not ( = ?auto_868263 ?auto_868265 ) ) ( not ( = ?auto_868263 ?auto_868266 ) ) ( not ( = ?auto_868263 ?auto_868267 ) ) ( not ( = ?auto_868263 ?auto_868268 ) ) ( not ( = ?auto_868264 ?auto_868265 ) ) ( not ( = ?auto_868264 ?auto_868266 ) ) ( not ( = ?auto_868264 ?auto_868267 ) ) ( not ( = ?auto_868264 ?auto_868268 ) ) ( not ( = ?auto_868265 ?auto_868266 ) ) ( not ( = ?auto_868265 ?auto_868267 ) ) ( not ( = ?auto_868265 ?auto_868268 ) ) ( not ( = ?auto_868266 ?auto_868267 ) ) ( not ( = ?auto_868266 ?auto_868268 ) ) ( not ( = ?auto_868267 ?auto_868268 ) ) ( ON ?auto_868266 ?auto_868267 ) ( ON ?auto_868265 ?auto_868266 ) ( CLEAR ?auto_868263 ) ( ON ?auto_868264 ?auto_868265 ) ( CLEAR ?auto_868264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_868252 ?auto_868253 ?auto_868254 ?auto_868255 ?auto_868256 ?auto_868257 ?auto_868258 ?auto_868259 ?auto_868260 ?auto_868261 ?auto_868262 ?auto_868263 ?auto_868264 )
      ( MAKE-16PILE ?auto_868252 ?auto_868253 ?auto_868254 ?auto_868255 ?auto_868256 ?auto_868257 ?auto_868258 ?auto_868259 ?auto_868260 ?auto_868261 ?auto_868262 ?auto_868263 ?auto_868264 ?auto_868265 ?auto_868266 ?auto_868267 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868318 - BLOCK
      ?auto_868319 - BLOCK
      ?auto_868320 - BLOCK
      ?auto_868321 - BLOCK
      ?auto_868322 - BLOCK
      ?auto_868323 - BLOCK
      ?auto_868324 - BLOCK
      ?auto_868325 - BLOCK
      ?auto_868326 - BLOCK
      ?auto_868327 - BLOCK
      ?auto_868328 - BLOCK
      ?auto_868329 - BLOCK
      ?auto_868330 - BLOCK
      ?auto_868331 - BLOCK
      ?auto_868332 - BLOCK
      ?auto_868333 - BLOCK
    )
    :vars
    (
      ?auto_868334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868333 ?auto_868334 ) ( ON-TABLE ?auto_868318 ) ( ON ?auto_868319 ?auto_868318 ) ( ON ?auto_868320 ?auto_868319 ) ( ON ?auto_868321 ?auto_868320 ) ( ON ?auto_868322 ?auto_868321 ) ( ON ?auto_868323 ?auto_868322 ) ( ON ?auto_868324 ?auto_868323 ) ( ON ?auto_868325 ?auto_868324 ) ( ON ?auto_868326 ?auto_868325 ) ( ON ?auto_868327 ?auto_868326 ) ( ON ?auto_868328 ?auto_868327 ) ( not ( = ?auto_868318 ?auto_868319 ) ) ( not ( = ?auto_868318 ?auto_868320 ) ) ( not ( = ?auto_868318 ?auto_868321 ) ) ( not ( = ?auto_868318 ?auto_868322 ) ) ( not ( = ?auto_868318 ?auto_868323 ) ) ( not ( = ?auto_868318 ?auto_868324 ) ) ( not ( = ?auto_868318 ?auto_868325 ) ) ( not ( = ?auto_868318 ?auto_868326 ) ) ( not ( = ?auto_868318 ?auto_868327 ) ) ( not ( = ?auto_868318 ?auto_868328 ) ) ( not ( = ?auto_868318 ?auto_868329 ) ) ( not ( = ?auto_868318 ?auto_868330 ) ) ( not ( = ?auto_868318 ?auto_868331 ) ) ( not ( = ?auto_868318 ?auto_868332 ) ) ( not ( = ?auto_868318 ?auto_868333 ) ) ( not ( = ?auto_868318 ?auto_868334 ) ) ( not ( = ?auto_868319 ?auto_868320 ) ) ( not ( = ?auto_868319 ?auto_868321 ) ) ( not ( = ?auto_868319 ?auto_868322 ) ) ( not ( = ?auto_868319 ?auto_868323 ) ) ( not ( = ?auto_868319 ?auto_868324 ) ) ( not ( = ?auto_868319 ?auto_868325 ) ) ( not ( = ?auto_868319 ?auto_868326 ) ) ( not ( = ?auto_868319 ?auto_868327 ) ) ( not ( = ?auto_868319 ?auto_868328 ) ) ( not ( = ?auto_868319 ?auto_868329 ) ) ( not ( = ?auto_868319 ?auto_868330 ) ) ( not ( = ?auto_868319 ?auto_868331 ) ) ( not ( = ?auto_868319 ?auto_868332 ) ) ( not ( = ?auto_868319 ?auto_868333 ) ) ( not ( = ?auto_868319 ?auto_868334 ) ) ( not ( = ?auto_868320 ?auto_868321 ) ) ( not ( = ?auto_868320 ?auto_868322 ) ) ( not ( = ?auto_868320 ?auto_868323 ) ) ( not ( = ?auto_868320 ?auto_868324 ) ) ( not ( = ?auto_868320 ?auto_868325 ) ) ( not ( = ?auto_868320 ?auto_868326 ) ) ( not ( = ?auto_868320 ?auto_868327 ) ) ( not ( = ?auto_868320 ?auto_868328 ) ) ( not ( = ?auto_868320 ?auto_868329 ) ) ( not ( = ?auto_868320 ?auto_868330 ) ) ( not ( = ?auto_868320 ?auto_868331 ) ) ( not ( = ?auto_868320 ?auto_868332 ) ) ( not ( = ?auto_868320 ?auto_868333 ) ) ( not ( = ?auto_868320 ?auto_868334 ) ) ( not ( = ?auto_868321 ?auto_868322 ) ) ( not ( = ?auto_868321 ?auto_868323 ) ) ( not ( = ?auto_868321 ?auto_868324 ) ) ( not ( = ?auto_868321 ?auto_868325 ) ) ( not ( = ?auto_868321 ?auto_868326 ) ) ( not ( = ?auto_868321 ?auto_868327 ) ) ( not ( = ?auto_868321 ?auto_868328 ) ) ( not ( = ?auto_868321 ?auto_868329 ) ) ( not ( = ?auto_868321 ?auto_868330 ) ) ( not ( = ?auto_868321 ?auto_868331 ) ) ( not ( = ?auto_868321 ?auto_868332 ) ) ( not ( = ?auto_868321 ?auto_868333 ) ) ( not ( = ?auto_868321 ?auto_868334 ) ) ( not ( = ?auto_868322 ?auto_868323 ) ) ( not ( = ?auto_868322 ?auto_868324 ) ) ( not ( = ?auto_868322 ?auto_868325 ) ) ( not ( = ?auto_868322 ?auto_868326 ) ) ( not ( = ?auto_868322 ?auto_868327 ) ) ( not ( = ?auto_868322 ?auto_868328 ) ) ( not ( = ?auto_868322 ?auto_868329 ) ) ( not ( = ?auto_868322 ?auto_868330 ) ) ( not ( = ?auto_868322 ?auto_868331 ) ) ( not ( = ?auto_868322 ?auto_868332 ) ) ( not ( = ?auto_868322 ?auto_868333 ) ) ( not ( = ?auto_868322 ?auto_868334 ) ) ( not ( = ?auto_868323 ?auto_868324 ) ) ( not ( = ?auto_868323 ?auto_868325 ) ) ( not ( = ?auto_868323 ?auto_868326 ) ) ( not ( = ?auto_868323 ?auto_868327 ) ) ( not ( = ?auto_868323 ?auto_868328 ) ) ( not ( = ?auto_868323 ?auto_868329 ) ) ( not ( = ?auto_868323 ?auto_868330 ) ) ( not ( = ?auto_868323 ?auto_868331 ) ) ( not ( = ?auto_868323 ?auto_868332 ) ) ( not ( = ?auto_868323 ?auto_868333 ) ) ( not ( = ?auto_868323 ?auto_868334 ) ) ( not ( = ?auto_868324 ?auto_868325 ) ) ( not ( = ?auto_868324 ?auto_868326 ) ) ( not ( = ?auto_868324 ?auto_868327 ) ) ( not ( = ?auto_868324 ?auto_868328 ) ) ( not ( = ?auto_868324 ?auto_868329 ) ) ( not ( = ?auto_868324 ?auto_868330 ) ) ( not ( = ?auto_868324 ?auto_868331 ) ) ( not ( = ?auto_868324 ?auto_868332 ) ) ( not ( = ?auto_868324 ?auto_868333 ) ) ( not ( = ?auto_868324 ?auto_868334 ) ) ( not ( = ?auto_868325 ?auto_868326 ) ) ( not ( = ?auto_868325 ?auto_868327 ) ) ( not ( = ?auto_868325 ?auto_868328 ) ) ( not ( = ?auto_868325 ?auto_868329 ) ) ( not ( = ?auto_868325 ?auto_868330 ) ) ( not ( = ?auto_868325 ?auto_868331 ) ) ( not ( = ?auto_868325 ?auto_868332 ) ) ( not ( = ?auto_868325 ?auto_868333 ) ) ( not ( = ?auto_868325 ?auto_868334 ) ) ( not ( = ?auto_868326 ?auto_868327 ) ) ( not ( = ?auto_868326 ?auto_868328 ) ) ( not ( = ?auto_868326 ?auto_868329 ) ) ( not ( = ?auto_868326 ?auto_868330 ) ) ( not ( = ?auto_868326 ?auto_868331 ) ) ( not ( = ?auto_868326 ?auto_868332 ) ) ( not ( = ?auto_868326 ?auto_868333 ) ) ( not ( = ?auto_868326 ?auto_868334 ) ) ( not ( = ?auto_868327 ?auto_868328 ) ) ( not ( = ?auto_868327 ?auto_868329 ) ) ( not ( = ?auto_868327 ?auto_868330 ) ) ( not ( = ?auto_868327 ?auto_868331 ) ) ( not ( = ?auto_868327 ?auto_868332 ) ) ( not ( = ?auto_868327 ?auto_868333 ) ) ( not ( = ?auto_868327 ?auto_868334 ) ) ( not ( = ?auto_868328 ?auto_868329 ) ) ( not ( = ?auto_868328 ?auto_868330 ) ) ( not ( = ?auto_868328 ?auto_868331 ) ) ( not ( = ?auto_868328 ?auto_868332 ) ) ( not ( = ?auto_868328 ?auto_868333 ) ) ( not ( = ?auto_868328 ?auto_868334 ) ) ( not ( = ?auto_868329 ?auto_868330 ) ) ( not ( = ?auto_868329 ?auto_868331 ) ) ( not ( = ?auto_868329 ?auto_868332 ) ) ( not ( = ?auto_868329 ?auto_868333 ) ) ( not ( = ?auto_868329 ?auto_868334 ) ) ( not ( = ?auto_868330 ?auto_868331 ) ) ( not ( = ?auto_868330 ?auto_868332 ) ) ( not ( = ?auto_868330 ?auto_868333 ) ) ( not ( = ?auto_868330 ?auto_868334 ) ) ( not ( = ?auto_868331 ?auto_868332 ) ) ( not ( = ?auto_868331 ?auto_868333 ) ) ( not ( = ?auto_868331 ?auto_868334 ) ) ( not ( = ?auto_868332 ?auto_868333 ) ) ( not ( = ?auto_868332 ?auto_868334 ) ) ( not ( = ?auto_868333 ?auto_868334 ) ) ( ON ?auto_868332 ?auto_868333 ) ( ON ?auto_868331 ?auto_868332 ) ( ON ?auto_868330 ?auto_868331 ) ( CLEAR ?auto_868328 ) ( ON ?auto_868329 ?auto_868330 ) ( CLEAR ?auto_868329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_868318 ?auto_868319 ?auto_868320 ?auto_868321 ?auto_868322 ?auto_868323 ?auto_868324 ?auto_868325 ?auto_868326 ?auto_868327 ?auto_868328 ?auto_868329 )
      ( MAKE-16PILE ?auto_868318 ?auto_868319 ?auto_868320 ?auto_868321 ?auto_868322 ?auto_868323 ?auto_868324 ?auto_868325 ?auto_868326 ?auto_868327 ?auto_868328 ?auto_868329 ?auto_868330 ?auto_868331 ?auto_868332 ?auto_868333 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868384 - BLOCK
      ?auto_868385 - BLOCK
      ?auto_868386 - BLOCK
      ?auto_868387 - BLOCK
      ?auto_868388 - BLOCK
      ?auto_868389 - BLOCK
      ?auto_868390 - BLOCK
      ?auto_868391 - BLOCK
      ?auto_868392 - BLOCK
      ?auto_868393 - BLOCK
      ?auto_868394 - BLOCK
      ?auto_868395 - BLOCK
      ?auto_868396 - BLOCK
      ?auto_868397 - BLOCK
      ?auto_868398 - BLOCK
      ?auto_868399 - BLOCK
    )
    :vars
    (
      ?auto_868400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868399 ?auto_868400 ) ( ON-TABLE ?auto_868384 ) ( ON ?auto_868385 ?auto_868384 ) ( ON ?auto_868386 ?auto_868385 ) ( ON ?auto_868387 ?auto_868386 ) ( ON ?auto_868388 ?auto_868387 ) ( ON ?auto_868389 ?auto_868388 ) ( ON ?auto_868390 ?auto_868389 ) ( ON ?auto_868391 ?auto_868390 ) ( ON ?auto_868392 ?auto_868391 ) ( ON ?auto_868393 ?auto_868392 ) ( not ( = ?auto_868384 ?auto_868385 ) ) ( not ( = ?auto_868384 ?auto_868386 ) ) ( not ( = ?auto_868384 ?auto_868387 ) ) ( not ( = ?auto_868384 ?auto_868388 ) ) ( not ( = ?auto_868384 ?auto_868389 ) ) ( not ( = ?auto_868384 ?auto_868390 ) ) ( not ( = ?auto_868384 ?auto_868391 ) ) ( not ( = ?auto_868384 ?auto_868392 ) ) ( not ( = ?auto_868384 ?auto_868393 ) ) ( not ( = ?auto_868384 ?auto_868394 ) ) ( not ( = ?auto_868384 ?auto_868395 ) ) ( not ( = ?auto_868384 ?auto_868396 ) ) ( not ( = ?auto_868384 ?auto_868397 ) ) ( not ( = ?auto_868384 ?auto_868398 ) ) ( not ( = ?auto_868384 ?auto_868399 ) ) ( not ( = ?auto_868384 ?auto_868400 ) ) ( not ( = ?auto_868385 ?auto_868386 ) ) ( not ( = ?auto_868385 ?auto_868387 ) ) ( not ( = ?auto_868385 ?auto_868388 ) ) ( not ( = ?auto_868385 ?auto_868389 ) ) ( not ( = ?auto_868385 ?auto_868390 ) ) ( not ( = ?auto_868385 ?auto_868391 ) ) ( not ( = ?auto_868385 ?auto_868392 ) ) ( not ( = ?auto_868385 ?auto_868393 ) ) ( not ( = ?auto_868385 ?auto_868394 ) ) ( not ( = ?auto_868385 ?auto_868395 ) ) ( not ( = ?auto_868385 ?auto_868396 ) ) ( not ( = ?auto_868385 ?auto_868397 ) ) ( not ( = ?auto_868385 ?auto_868398 ) ) ( not ( = ?auto_868385 ?auto_868399 ) ) ( not ( = ?auto_868385 ?auto_868400 ) ) ( not ( = ?auto_868386 ?auto_868387 ) ) ( not ( = ?auto_868386 ?auto_868388 ) ) ( not ( = ?auto_868386 ?auto_868389 ) ) ( not ( = ?auto_868386 ?auto_868390 ) ) ( not ( = ?auto_868386 ?auto_868391 ) ) ( not ( = ?auto_868386 ?auto_868392 ) ) ( not ( = ?auto_868386 ?auto_868393 ) ) ( not ( = ?auto_868386 ?auto_868394 ) ) ( not ( = ?auto_868386 ?auto_868395 ) ) ( not ( = ?auto_868386 ?auto_868396 ) ) ( not ( = ?auto_868386 ?auto_868397 ) ) ( not ( = ?auto_868386 ?auto_868398 ) ) ( not ( = ?auto_868386 ?auto_868399 ) ) ( not ( = ?auto_868386 ?auto_868400 ) ) ( not ( = ?auto_868387 ?auto_868388 ) ) ( not ( = ?auto_868387 ?auto_868389 ) ) ( not ( = ?auto_868387 ?auto_868390 ) ) ( not ( = ?auto_868387 ?auto_868391 ) ) ( not ( = ?auto_868387 ?auto_868392 ) ) ( not ( = ?auto_868387 ?auto_868393 ) ) ( not ( = ?auto_868387 ?auto_868394 ) ) ( not ( = ?auto_868387 ?auto_868395 ) ) ( not ( = ?auto_868387 ?auto_868396 ) ) ( not ( = ?auto_868387 ?auto_868397 ) ) ( not ( = ?auto_868387 ?auto_868398 ) ) ( not ( = ?auto_868387 ?auto_868399 ) ) ( not ( = ?auto_868387 ?auto_868400 ) ) ( not ( = ?auto_868388 ?auto_868389 ) ) ( not ( = ?auto_868388 ?auto_868390 ) ) ( not ( = ?auto_868388 ?auto_868391 ) ) ( not ( = ?auto_868388 ?auto_868392 ) ) ( not ( = ?auto_868388 ?auto_868393 ) ) ( not ( = ?auto_868388 ?auto_868394 ) ) ( not ( = ?auto_868388 ?auto_868395 ) ) ( not ( = ?auto_868388 ?auto_868396 ) ) ( not ( = ?auto_868388 ?auto_868397 ) ) ( not ( = ?auto_868388 ?auto_868398 ) ) ( not ( = ?auto_868388 ?auto_868399 ) ) ( not ( = ?auto_868388 ?auto_868400 ) ) ( not ( = ?auto_868389 ?auto_868390 ) ) ( not ( = ?auto_868389 ?auto_868391 ) ) ( not ( = ?auto_868389 ?auto_868392 ) ) ( not ( = ?auto_868389 ?auto_868393 ) ) ( not ( = ?auto_868389 ?auto_868394 ) ) ( not ( = ?auto_868389 ?auto_868395 ) ) ( not ( = ?auto_868389 ?auto_868396 ) ) ( not ( = ?auto_868389 ?auto_868397 ) ) ( not ( = ?auto_868389 ?auto_868398 ) ) ( not ( = ?auto_868389 ?auto_868399 ) ) ( not ( = ?auto_868389 ?auto_868400 ) ) ( not ( = ?auto_868390 ?auto_868391 ) ) ( not ( = ?auto_868390 ?auto_868392 ) ) ( not ( = ?auto_868390 ?auto_868393 ) ) ( not ( = ?auto_868390 ?auto_868394 ) ) ( not ( = ?auto_868390 ?auto_868395 ) ) ( not ( = ?auto_868390 ?auto_868396 ) ) ( not ( = ?auto_868390 ?auto_868397 ) ) ( not ( = ?auto_868390 ?auto_868398 ) ) ( not ( = ?auto_868390 ?auto_868399 ) ) ( not ( = ?auto_868390 ?auto_868400 ) ) ( not ( = ?auto_868391 ?auto_868392 ) ) ( not ( = ?auto_868391 ?auto_868393 ) ) ( not ( = ?auto_868391 ?auto_868394 ) ) ( not ( = ?auto_868391 ?auto_868395 ) ) ( not ( = ?auto_868391 ?auto_868396 ) ) ( not ( = ?auto_868391 ?auto_868397 ) ) ( not ( = ?auto_868391 ?auto_868398 ) ) ( not ( = ?auto_868391 ?auto_868399 ) ) ( not ( = ?auto_868391 ?auto_868400 ) ) ( not ( = ?auto_868392 ?auto_868393 ) ) ( not ( = ?auto_868392 ?auto_868394 ) ) ( not ( = ?auto_868392 ?auto_868395 ) ) ( not ( = ?auto_868392 ?auto_868396 ) ) ( not ( = ?auto_868392 ?auto_868397 ) ) ( not ( = ?auto_868392 ?auto_868398 ) ) ( not ( = ?auto_868392 ?auto_868399 ) ) ( not ( = ?auto_868392 ?auto_868400 ) ) ( not ( = ?auto_868393 ?auto_868394 ) ) ( not ( = ?auto_868393 ?auto_868395 ) ) ( not ( = ?auto_868393 ?auto_868396 ) ) ( not ( = ?auto_868393 ?auto_868397 ) ) ( not ( = ?auto_868393 ?auto_868398 ) ) ( not ( = ?auto_868393 ?auto_868399 ) ) ( not ( = ?auto_868393 ?auto_868400 ) ) ( not ( = ?auto_868394 ?auto_868395 ) ) ( not ( = ?auto_868394 ?auto_868396 ) ) ( not ( = ?auto_868394 ?auto_868397 ) ) ( not ( = ?auto_868394 ?auto_868398 ) ) ( not ( = ?auto_868394 ?auto_868399 ) ) ( not ( = ?auto_868394 ?auto_868400 ) ) ( not ( = ?auto_868395 ?auto_868396 ) ) ( not ( = ?auto_868395 ?auto_868397 ) ) ( not ( = ?auto_868395 ?auto_868398 ) ) ( not ( = ?auto_868395 ?auto_868399 ) ) ( not ( = ?auto_868395 ?auto_868400 ) ) ( not ( = ?auto_868396 ?auto_868397 ) ) ( not ( = ?auto_868396 ?auto_868398 ) ) ( not ( = ?auto_868396 ?auto_868399 ) ) ( not ( = ?auto_868396 ?auto_868400 ) ) ( not ( = ?auto_868397 ?auto_868398 ) ) ( not ( = ?auto_868397 ?auto_868399 ) ) ( not ( = ?auto_868397 ?auto_868400 ) ) ( not ( = ?auto_868398 ?auto_868399 ) ) ( not ( = ?auto_868398 ?auto_868400 ) ) ( not ( = ?auto_868399 ?auto_868400 ) ) ( ON ?auto_868398 ?auto_868399 ) ( ON ?auto_868397 ?auto_868398 ) ( ON ?auto_868396 ?auto_868397 ) ( ON ?auto_868395 ?auto_868396 ) ( CLEAR ?auto_868393 ) ( ON ?auto_868394 ?auto_868395 ) ( CLEAR ?auto_868394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_868384 ?auto_868385 ?auto_868386 ?auto_868387 ?auto_868388 ?auto_868389 ?auto_868390 ?auto_868391 ?auto_868392 ?auto_868393 ?auto_868394 )
      ( MAKE-16PILE ?auto_868384 ?auto_868385 ?auto_868386 ?auto_868387 ?auto_868388 ?auto_868389 ?auto_868390 ?auto_868391 ?auto_868392 ?auto_868393 ?auto_868394 ?auto_868395 ?auto_868396 ?auto_868397 ?auto_868398 ?auto_868399 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868450 - BLOCK
      ?auto_868451 - BLOCK
      ?auto_868452 - BLOCK
      ?auto_868453 - BLOCK
      ?auto_868454 - BLOCK
      ?auto_868455 - BLOCK
      ?auto_868456 - BLOCK
      ?auto_868457 - BLOCK
      ?auto_868458 - BLOCK
      ?auto_868459 - BLOCK
      ?auto_868460 - BLOCK
      ?auto_868461 - BLOCK
      ?auto_868462 - BLOCK
      ?auto_868463 - BLOCK
      ?auto_868464 - BLOCK
      ?auto_868465 - BLOCK
    )
    :vars
    (
      ?auto_868466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868465 ?auto_868466 ) ( ON-TABLE ?auto_868450 ) ( ON ?auto_868451 ?auto_868450 ) ( ON ?auto_868452 ?auto_868451 ) ( ON ?auto_868453 ?auto_868452 ) ( ON ?auto_868454 ?auto_868453 ) ( ON ?auto_868455 ?auto_868454 ) ( ON ?auto_868456 ?auto_868455 ) ( ON ?auto_868457 ?auto_868456 ) ( ON ?auto_868458 ?auto_868457 ) ( not ( = ?auto_868450 ?auto_868451 ) ) ( not ( = ?auto_868450 ?auto_868452 ) ) ( not ( = ?auto_868450 ?auto_868453 ) ) ( not ( = ?auto_868450 ?auto_868454 ) ) ( not ( = ?auto_868450 ?auto_868455 ) ) ( not ( = ?auto_868450 ?auto_868456 ) ) ( not ( = ?auto_868450 ?auto_868457 ) ) ( not ( = ?auto_868450 ?auto_868458 ) ) ( not ( = ?auto_868450 ?auto_868459 ) ) ( not ( = ?auto_868450 ?auto_868460 ) ) ( not ( = ?auto_868450 ?auto_868461 ) ) ( not ( = ?auto_868450 ?auto_868462 ) ) ( not ( = ?auto_868450 ?auto_868463 ) ) ( not ( = ?auto_868450 ?auto_868464 ) ) ( not ( = ?auto_868450 ?auto_868465 ) ) ( not ( = ?auto_868450 ?auto_868466 ) ) ( not ( = ?auto_868451 ?auto_868452 ) ) ( not ( = ?auto_868451 ?auto_868453 ) ) ( not ( = ?auto_868451 ?auto_868454 ) ) ( not ( = ?auto_868451 ?auto_868455 ) ) ( not ( = ?auto_868451 ?auto_868456 ) ) ( not ( = ?auto_868451 ?auto_868457 ) ) ( not ( = ?auto_868451 ?auto_868458 ) ) ( not ( = ?auto_868451 ?auto_868459 ) ) ( not ( = ?auto_868451 ?auto_868460 ) ) ( not ( = ?auto_868451 ?auto_868461 ) ) ( not ( = ?auto_868451 ?auto_868462 ) ) ( not ( = ?auto_868451 ?auto_868463 ) ) ( not ( = ?auto_868451 ?auto_868464 ) ) ( not ( = ?auto_868451 ?auto_868465 ) ) ( not ( = ?auto_868451 ?auto_868466 ) ) ( not ( = ?auto_868452 ?auto_868453 ) ) ( not ( = ?auto_868452 ?auto_868454 ) ) ( not ( = ?auto_868452 ?auto_868455 ) ) ( not ( = ?auto_868452 ?auto_868456 ) ) ( not ( = ?auto_868452 ?auto_868457 ) ) ( not ( = ?auto_868452 ?auto_868458 ) ) ( not ( = ?auto_868452 ?auto_868459 ) ) ( not ( = ?auto_868452 ?auto_868460 ) ) ( not ( = ?auto_868452 ?auto_868461 ) ) ( not ( = ?auto_868452 ?auto_868462 ) ) ( not ( = ?auto_868452 ?auto_868463 ) ) ( not ( = ?auto_868452 ?auto_868464 ) ) ( not ( = ?auto_868452 ?auto_868465 ) ) ( not ( = ?auto_868452 ?auto_868466 ) ) ( not ( = ?auto_868453 ?auto_868454 ) ) ( not ( = ?auto_868453 ?auto_868455 ) ) ( not ( = ?auto_868453 ?auto_868456 ) ) ( not ( = ?auto_868453 ?auto_868457 ) ) ( not ( = ?auto_868453 ?auto_868458 ) ) ( not ( = ?auto_868453 ?auto_868459 ) ) ( not ( = ?auto_868453 ?auto_868460 ) ) ( not ( = ?auto_868453 ?auto_868461 ) ) ( not ( = ?auto_868453 ?auto_868462 ) ) ( not ( = ?auto_868453 ?auto_868463 ) ) ( not ( = ?auto_868453 ?auto_868464 ) ) ( not ( = ?auto_868453 ?auto_868465 ) ) ( not ( = ?auto_868453 ?auto_868466 ) ) ( not ( = ?auto_868454 ?auto_868455 ) ) ( not ( = ?auto_868454 ?auto_868456 ) ) ( not ( = ?auto_868454 ?auto_868457 ) ) ( not ( = ?auto_868454 ?auto_868458 ) ) ( not ( = ?auto_868454 ?auto_868459 ) ) ( not ( = ?auto_868454 ?auto_868460 ) ) ( not ( = ?auto_868454 ?auto_868461 ) ) ( not ( = ?auto_868454 ?auto_868462 ) ) ( not ( = ?auto_868454 ?auto_868463 ) ) ( not ( = ?auto_868454 ?auto_868464 ) ) ( not ( = ?auto_868454 ?auto_868465 ) ) ( not ( = ?auto_868454 ?auto_868466 ) ) ( not ( = ?auto_868455 ?auto_868456 ) ) ( not ( = ?auto_868455 ?auto_868457 ) ) ( not ( = ?auto_868455 ?auto_868458 ) ) ( not ( = ?auto_868455 ?auto_868459 ) ) ( not ( = ?auto_868455 ?auto_868460 ) ) ( not ( = ?auto_868455 ?auto_868461 ) ) ( not ( = ?auto_868455 ?auto_868462 ) ) ( not ( = ?auto_868455 ?auto_868463 ) ) ( not ( = ?auto_868455 ?auto_868464 ) ) ( not ( = ?auto_868455 ?auto_868465 ) ) ( not ( = ?auto_868455 ?auto_868466 ) ) ( not ( = ?auto_868456 ?auto_868457 ) ) ( not ( = ?auto_868456 ?auto_868458 ) ) ( not ( = ?auto_868456 ?auto_868459 ) ) ( not ( = ?auto_868456 ?auto_868460 ) ) ( not ( = ?auto_868456 ?auto_868461 ) ) ( not ( = ?auto_868456 ?auto_868462 ) ) ( not ( = ?auto_868456 ?auto_868463 ) ) ( not ( = ?auto_868456 ?auto_868464 ) ) ( not ( = ?auto_868456 ?auto_868465 ) ) ( not ( = ?auto_868456 ?auto_868466 ) ) ( not ( = ?auto_868457 ?auto_868458 ) ) ( not ( = ?auto_868457 ?auto_868459 ) ) ( not ( = ?auto_868457 ?auto_868460 ) ) ( not ( = ?auto_868457 ?auto_868461 ) ) ( not ( = ?auto_868457 ?auto_868462 ) ) ( not ( = ?auto_868457 ?auto_868463 ) ) ( not ( = ?auto_868457 ?auto_868464 ) ) ( not ( = ?auto_868457 ?auto_868465 ) ) ( not ( = ?auto_868457 ?auto_868466 ) ) ( not ( = ?auto_868458 ?auto_868459 ) ) ( not ( = ?auto_868458 ?auto_868460 ) ) ( not ( = ?auto_868458 ?auto_868461 ) ) ( not ( = ?auto_868458 ?auto_868462 ) ) ( not ( = ?auto_868458 ?auto_868463 ) ) ( not ( = ?auto_868458 ?auto_868464 ) ) ( not ( = ?auto_868458 ?auto_868465 ) ) ( not ( = ?auto_868458 ?auto_868466 ) ) ( not ( = ?auto_868459 ?auto_868460 ) ) ( not ( = ?auto_868459 ?auto_868461 ) ) ( not ( = ?auto_868459 ?auto_868462 ) ) ( not ( = ?auto_868459 ?auto_868463 ) ) ( not ( = ?auto_868459 ?auto_868464 ) ) ( not ( = ?auto_868459 ?auto_868465 ) ) ( not ( = ?auto_868459 ?auto_868466 ) ) ( not ( = ?auto_868460 ?auto_868461 ) ) ( not ( = ?auto_868460 ?auto_868462 ) ) ( not ( = ?auto_868460 ?auto_868463 ) ) ( not ( = ?auto_868460 ?auto_868464 ) ) ( not ( = ?auto_868460 ?auto_868465 ) ) ( not ( = ?auto_868460 ?auto_868466 ) ) ( not ( = ?auto_868461 ?auto_868462 ) ) ( not ( = ?auto_868461 ?auto_868463 ) ) ( not ( = ?auto_868461 ?auto_868464 ) ) ( not ( = ?auto_868461 ?auto_868465 ) ) ( not ( = ?auto_868461 ?auto_868466 ) ) ( not ( = ?auto_868462 ?auto_868463 ) ) ( not ( = ?auto_868462 ?auto_868464 ) ) ( not ( = ?auto_868462 ?auto_868465 ) ) ( not ( = ?auto_868462 ?auto_868466 ) ) ( not ( = ?auto_868463 ?auto_868464 ) ) ( not ( = ?auto_868463 ?auto_868465 ) ) ( not ( = ?auto_868463 ?auto_868466 ) ) ( not ( = ?auto_868464 ?auto_868465 ) ) ( not ( = ?auto_868464 ?auto_868466 ) ) ( not ( = ?auto_868465 ?auto_868466 ) ) ( ON ?auto_868464 ?auto_868465 ) ( ON ?auto_868463 ?auto_868464 ) ( ON ?auto_868462 ?auto_868463 ) ( ON ?auto_868461 ?auto_868462 ) ( ON ?auto_868460 ?auto_868461 ) ( CLEAR ?auto_868458 ) ( ON ?auto_868459 ?auto_868460 ) ( CLEAR ?auto_868459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_868450 ?auto_868451 ?auto_868452 ?auto_868453 ?auto_868454 ?auto_868455 ?auto_868456 ?auto_868457 ?auto_868458 ?auto_868459 )
      ( MAKE-16PILE ?auto_868450 ?auto_868451 ?auto_868452 ?auto_868453 ?auto_868454 ?auto_868455 ?auto_868456 ?auto_868457 ?auto_868458 ?auto_868459 ?auto_868460 ?auto_868461 ?auto_868462 ?auto_868463 ?auto_868464 ?auto_868465 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868516 - BLOCK
      ?auto_868517 - BLOCK
      ?auto_868518 - BLOCK
      ?auto_868519 - BLOCK
      ?auto_868520 - BLOCK
      ?auto_868521 - BLOCK
      ?auto_868522 - BLOCK
      ?auto_868523 - BLOCK
      ?auto_868524 - BLOCK
      ?auto_868525 - BLOCK
      ?auto_868526 - BLOCK
      ?auto_868527 - BLOCK
      ?auto_868528 - BLOCK
      ?auto_868529 - BLOCK
      ?auto_868530 - BLOCK
      ?auto_868531 - BLOCK
    )
    :vars
    (
      ?auto_868532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868531 ?auto_868532 ) ( ON-TABLE ?auto_868516 ) ( ON ?auto_868517 ?auto_868516 ) ( ON ?auto_868518 ?auto_868517 ) ( ON ?auto_868519 ?auto_868518 ) ( ON ?auto_868520 ?auto_868519 ) ( ON ?auto_868521 ?auto_868520 ) ( ON ?auto_868522 ?auto_868521 ) ( ON ?auto_868523 ?auto_868522 ) ( not ( = ?auto_868516 ?auto_868517 ) ) ( not ( = ?auto_868516 ?auto_868518 ) ) ( not ( = ?auto_868516 ?auto_868519 ) ) ( not ( = ?auto_868516 ?auto_868520 ) ) ( not ( = ?auto_868516 ?auto_868521 ) ) ( not ( = ?auto_868516 ?auto_868522 ) ) ( not ( = ?auto_868516 ?auto_868523 ) ) ( not ( = ?auto_868516 ?auto_868524 ) ) ( not ( = ?auto_868516 ?auto_868525 ) ) ( not ( = ?auto_868516 ?auto_868526 ) ) ( not ( = ?auto_868516 ?auto_868527 ) ) ( not ( = ?auto_868516 ?auto_868528 ) ) ( not ( = ?auto_868516 ?auto_868529 ) ) ( not ( = ?auto_868516 ?auto_868530 ) ) ( not ( = ?auto_868516 ?auto_868531 ) ) ( not ( = ?auto_868516 ?auto_868532 ) ) ( not ( = ?auto_868517 ?auto_868518 ) ) ( not ( = ?auto_868517 ?auto_868519 ) ) ( not ( = ?auto_868517 ?auto_868520 ) ) ( not ( = ?auto_868517 ?auto_868521 ) ) ( not ( = ?auto_868517 ?auto_868522 ) ) ( not ( = ?auto_868517 ?auto_868523 ) ) ( not ( = ?auto_868517 ?auto_868524 ) ) ( not ( = ?auto_868517 ?auto_868525 ) ) ( not ( = ?auto_868517 ?auto_868526 ) ) ( not ( = ?auto_868517 ?auto_868527 ) ) ( not ( = ?auto_868517 ?auto_868528 ) ) ( not ( = ?auto_868517 ?auto_868529 ) ) ( not ( = ?auto_868517 ?auto_868530 ) ) ( not ( = ?auto_868517 ?auto_868531 ) ) ( not ( = ?auto_868517 ?auto_868532 ) ) ( not ( = ?auto_868518 ?auto_868519 ) ) ( not ( = ?auto_868518 ?auto_868520 ) ) ( not ( = ?auto_868518 ?auto_868521 ) ) ( not ( = ?auto_868518 ?auto_868522 ) ) ( not ( = ?auto_868518 ?auto_868523 ) ) ( not ( = ?auto_868518 ?auto_868524 ) ) ( not ( = ?auto_868518 ?auto_868525 ) ) ( not ( = ?auto_868518 ?auto_868526 ) ) ( not ( = ?auto_868518 ?auto_868527 ) ) ( not ( = ?auto_868518 ?auto_868528 ) ) ( not ( = ?auto_868518 ?auto_868529 ) ) ( not ( = ?auto_868518 ?auto_868530 ) ) ( not ( = ?auto_868518 ?auto_868531 ) ) ( not ( = ?auto_868518 ?auto_868532 ) ) ( not ( = ?auto_868519 ?auto_868520 ) ) ( not ( = ?auto_868519 ?auto_868521 ) ) ( not ( = ?auto_868519 ?auto_868522 ) ) ( not ( = ?auto_868519 ?auto_868523 ) ) ( not ( = ?auto_868519 ?auto_868524 ) ) ( not ( = ?auto_868519 ?auto_868525 ) ) ( not ( = ?auto_868519 ?auto_868526 ) ) ( not ( = ?auto_868519 ?auto_868527 ) ) ( not ( = ?auto_868519 ?auto_868528 ) ) ( not ( = ?auto_868519 ?auto_868529 ) ) ( not ( = ?auto_868519 ?auto_868530 ) ) ( not ( = ?auto_868519 ?auto_868531 ) ) ( not ( = ?auto_868519 ?auto_868532 ) ) ( not ( = ?auto_868520 ?auto_868521 ) ) ( not ( = ?auto_868520 ?auto_868522 ) ) ( not ( = ?auto_868520 ?auto_868523 ) ) ( not ( = ?auto_868520 ?auto_868524 ) ) ( not ( = ?auto_868520 ?auto_868525 ) ) ( not ( = ?auto_868520 ?auto_868526 ) ) ( not ( = ?auto_868520 ?auto_868527 ) ) ( not ( = ?auto_868520 ?auto_868528 ) ) ( not ( = ?auto_868520 ?auto_868529 ) ) ( not ( = ?auto_868520 ?auto_868530 ) ) ( not ( = ?auto_868520 ?auto_868531 ) ) ( not ( = ?auto_868520 ?auto_868532 ) ) ( not ( = ?auto_868521 ?auto_868522 ) ) ( not ( = ?auto_868521 ?auto_868523 ) ) ( not ( = ?auto_868521 ?auto_868524 ) ) ( not ( = ?auto_868521 ?auto_868525 ) ) ( not ( = ?auto_868521 ?auto_868526 ) ) ( not ( = ?auto_868521 ?auto_868527 ) ) ( not ( = ?auto_868521 ?auto_868528 ) ) ( not ( = ?auto_868521 ?auto_868529 ) ) ( not ( = ?auto_868521 ?auto_868530 ) ) ( not ( = ?auto_868521 ?auto_868531 ) ) ( not ( = ?auto_868521 ?auto_868532 ) ) ( not ( = ?auto_868522 ?auto_868523 ) ) ( not ( = ?auto_868522 ?auto_868524 ) ) ( not ( = ?auto_868522 ?auto_868525 ) ) ( not ( = ?auto_868522 ?auto_868526 ) ) ( not ( = ?auto_868522 ?auto_868527 ) ) ( not ( = ?auto_868522 ?auto_868528 ) ) ( not ( = ?auto_868522 ?auto_868529 ) ) ( not ( = ?auto_868522 ?auto_868530 ) ) ( not ( = ?auto_868522 ?auto_868531 ) ) ( not ( = ?auto_868522 ?auto_868532 ) ) ( not ( = ?auto_868523 ?auto_868524 ) ) ( not ( = ?auto_868523 ?auto_868525 ) ) ( not ( = ?auto_868523 ?auto_868526 ) ) ( not ( = ?auto_868523 ?auto_868527 ) ) ( not ( = ?auto_868523 ?auto_868528 ) ) ( not ( = ?auto_868523 ?auto_868529 ) ) ( not ( = ?auto_868523 ?auto_868530 ) ) ( not ( = ?auto_868523 ?auto_868531 ) ) ( not ( = ?auto_868523 ?auto_868532 ) ) ( not ( = ?auto_868524 ?auto_868525 ) ) ( not ( = ?auto_868524 ?auto_868526 ) ) ( not ( = ?auto_868524 ?auto_868527 ) ) ( not ( = ?auto_868524 ?auto_868528 ) ) ( not ( = ?auto_868524 ?auto_868529 ) ) ( not ( = ?auto_868524 ?auto_868530 ) ) ( not ( = ?auto_868524 ?auto_868531 ) ) ( not ( = ?auto_868524 ?auto_868532 ) ) ( not ( = ?auto_868525 ?auto_868526 ) ) ( not ( = ?auto_868525 ?auto_868527 ) ) ( not ( = ?auto_868525 ?auto_868528 ) ) ( not ( = ?auto_868525 ?auto_868529 ) ) ( not ( = ?auto_868525 ?auto_868530 ) ) ( not ( = ?auto_868525 ?auto_868531 ) ) ( not ( = ?auto_868525 ?auto_868532 ) ) ( not ( = ?auto_868526 ?auto_868527 ) ) ( not ( = ?auto_868526 ?auto_868528 ) ) ( not ( = ?auto_868526 ?auto_868529 ) ) ( not ( = ?auto_868526 ?auto_868530 ) ) ( not ( = ?auto_868526 ?auto_868531 ) ) ( not ( = ?auto_868526 ?auto_868532 ) ) ( not ( = ?auto_868527 ?auto_868528 ) ) ( not ( = ?auto_868527 ?auto_868529 ) ) ( not ( = ?auto_868527 ?auto_868530 ) ) ( not ( = ?auto_868527 ?auto_868531 ) ) ( not ( = ?auto_868527 ?auto_868532 ) ) ( not ( = ?auto_868528 ?auto_868529 ) ) ( not ( = ?auto_868528 ?auto_868530 ) ) ( not ( = ?auto_868528 ?auto_868531 ) ) ( not ( = ?auto_868528 ?auto_868532 ) ) ( not ( = ?auto_868529 ?auto_868530 ) ) ( not ( = ?auto_868529 ?auto_868531 ) ) ( not ( = ?auto_868529 ?auto_868532 ) ) ( not ( = ?auto_868530 ?auto_868531 ) ) ( not ( = ?auto_868530 ?auto_868532 ) ) ( not ( = ?auto_868531 ?auto_868532 ) ) ( ON ?auto_868530 ?auto_868531 ) ( ON ?auto_868529 ?auto_868530 ) ( ON ?auto_868528 ?auto_868529 ) ( ON ?auto_868527 ?auto_868528 ) ( ON ?auto_868526 ?auto_868527 ) ( ON ?auto_868525 ?auto_868526 ) ( CLEAR ?auto_868523 ) ( ON ?auto_868524 ?auto_868525 ) ( CLEAR ?auto_868524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_868516 ?auto_868517 ?auto_868518 ?auto_868519 ?auto_868520 ?auto_868521 ?auto_868522 ?auto_868523 ?auto_868524 )
      ( MAKE-16PILE ?auto_868516 ?auto_868517 ?auto_868518 ?auto_868519 ?auto_868520 ?auto_868521 ?auto_868522 ?auto_868523 ?auto_868524 ?auto_868525 ?auto_868526 ?auto_868527 ?auto_868528 ?auto_868529 ?auto_868530 ?auto_868531 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868582 - BLOCK
      ?auto_868583 - BLOCK
      ?auto_868584 - BLOCK
      ?auto_868585 - BLOCK
      ?auto_868586 - BLOCK
      ?auto_868587 - BLOCK
      ?auto_868588 - BLOCK
      ?auto_868589 - BLOCK
      ?auto_868590 - BLOCK
      ?auto_868591 - BLOCK
      ?auto_868592 - BLOCK
      ?auto_868593 - BLOCK
      ?auto_868594 - BLOCK
      ?auto_868595 - BLOCK
      ?auto_868596 - BLOCK
      ?auto_868597 - BLOCK
    )
    :vars
    (
      ?auto_868598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868597 ?auto_868598 ) ( ON-TABLE ?auto_868582 ) ( ON ?auto_868583 ?auto_868582 ) ( ON ?auto_868584 ?auto_868583 ) ( ON ?auto_868585 ?auto_868584 ) ( ON ?auto_868586 ?auto_868585 ) ( ON ?auto_868587 ?auto_868586 ) ( ON ?auto_868588 ?auto_868587 ) ( not ( = ?auto_868582 ?auto_868583 ) ) ( not ( = ?auto_868582 ?auto_868584 ) ) ( not ( = ?auto_868582 ?auto_868585 ) ) ( not ( = ?auto_868582 ?auto_868586 ) ) ( not ( = ?auto_868582 ?auto_868587 ) ) ( not ( = ?auto_868582 ?auto_868588 ) ) ( not ( = ?auto_868582 ?auto_868589 ) ) ( not ( = ?auto_868582 ?auto_868590 ) ) ( not ( = ?auto_868582 ?auto_868591 ) ) ( not ( = ?auto_868582 ?auto_868592 ) ) ( not ( = ?auto_868582 ?auto_868593 ) ) ( not ( = ?auto_868582 ?auto_868594 ) ) ( not ( = ?auto_868582 ?auto_868595 ) ) ( not ( = ?auto_868582 ?auto_868596 ) ) ( not ( = ?auto_868582 ?auto_868597 ) ) ( not ( = ?auto_868582 ?auto_868598 ) ) ( not ( = ?auto_868583 ?auto_868584 ) ) ( not ( = ?auto_868583 ?auto_868585 ) ) ( not ( = ?auto_868583 ?auto_868586 ) ) ( not ( = ?auto_868583 ?auto_868587 ) ) ( not ( = ?auto_868583 ?auto_868588 ) ) ( not ( = ?auto_868583 ?auto_868589 ) ) ( not ( = ?auto_868583 ?auto_868590 ) ) ( not ( = ?auto_868583 ?auto_868591 ) ) ( not ( = ?auto_868583 ?auto_868592 ) ) ( not ( = ?auto_868583 ?auto_868593 ) ) ( not ( = ?auto_868583 ?auto_868594 ) ) ( not ( = ?auto_868583 ?auto_868595 ) ) ( not ( = ?auto_868583 ?auto_868596 ) ) ( not ( = ?auto_868583 ?auto_868597 ) ) ( not ( = ?auto_868583 ?auto_868598 ) ) ( not ( = ?auto_868584 ?auto_868585 ) ) ( not ( = ?auto_868584 ?auto_868586 ) ) ( not ( = ?auto_868584 ?auto_868587 ) ) ( not ( = ?auto_868584 ?auto_868588 ) ) ( not ( = ?auto_868584 ?auto_868589 ) ) ( not ( = ?auto_868584 ?auto_868590 ) ) ( not ( = ?auto_868584 ?auto_868591 ) ) ( not ( = ?auto_868584 ?auto_868592 ) ) ( not ( = ?auto_868584 ?auto_868593 ) ) ( not ( = ?auto_868584 ?auto_868594 ) ) ( not ( = ?auto_868584 ?auto_868595 ) ) ( not ( = ?auto_868584 ?auto_868596 ) ) ( not ( = ?auto_868584 ?auto_868597 ) ) ( not ( = ?auto_868584 ?auto_868598 ) ) ( not ( = ?auto_868585 ?auto_868586 ) ) ( not ( = ?auto_868585 ?auto_868587 ) ) ( not ( = ?auto_868585 ?auto_868588 ) ) ( not ( = ?auto_868585 ?auto_868589 ) ) ( not ( = ?auto_868585 ?auto_868590 ) ) ( not ( = ?auto_868585 ?auto_868591 ) ) ( not ( = ?auto_868585 ?auto_868592 ) ) ( not ( = ?auto_868585 ?auto_868593 ) ) ( not ( = ?auto_868585 ?auto_868594 ) ) ( not ( = ?auto_868585 ?auto_868595 ) ) ( not ( = ?auto_868585 ?auto_868596 ) ) ( not ( = ?auto_868585 ?auto_868597 ) ) ( not ( = ?auto_868585 ?auto_868598 ) ) ( not ( = ?auto_868586 ?auto_868587 ) ) ( not ( = ?auto_868586 ?auto_868588 ) ) ( not ( = ?auto_868586 ?auto_868589 ) ) ( not ( = ?auto_868586 ?auto_868590 ) ) ( not ( = ?auto_868586 ?auto_868591 ) ) ( not ( = ?auto_868586 ?auto_868592 ) ) ( not ( = ?auto_868586 ?auto_868593 ) ) ( not ( = ?auto_868586 ?auto_868594 ) ) ( not ( = ?auto_868586 ?auto_868595 ) ) ( not ( = ?auto_868586 ?auto_868596 ) ) ( not ( = ?auto_868586 ?auto_868597 ) ) ( not ( = ?auto_868586 ?auto_868598 ) ) ( not ( = ?auto_868587 ?auto_868588 ) ) ( not ( = ?auto_868587 ?auto_868589 ) ) ( not ( = ?auto_868587 ?auto_868590 ) ) ( not ( = ?auto_868587 ?auto_868591 ) ) ( not ( = ?auto_868587 ?auto_868592 ) ) ( not ( = ?auto_868587 ?auto_868593 ) ) ( not ( = ?auto_868587 ?auto_868594 ) ) ( not ( = ?auto_868587 ?auto_868595 ) ) ( not ( = ?auto_868587 ?auto_868596 ) ) ( not ( = ?auto_868587 ?auto_868597 ) ) ( not ( = ?auto_868587 ?auto_868598 ) ) ( not ( = ?auto_868588 ?auto_868589 ) ) ( not ( = ?auto_868588 ?auto_868590 ) ) ( not ( = ?auto_868588 ?auto_868591 ) ) ( not ( = ?auto_868588 ?auto_868592 ) ) ( not ( = ?auto_868588 ?auto_868593 ) ) ( not ( = ?auto_868588 ?auto_868594 ) ) ( not ( = ?auto_868588 ?auto_868595 ) ) ( not ( = ?auto_868588 ?auto_868596 ) ) ( not ( = ?auto_868588 ?auto_868597 ) ) ( not ( = ?auto_868588 ?auto_868598 ) ) ( not ( = ?auto_868589 ?auto_868590 ) ) ( not ( = ?auto_868589 ?auto_868591 ) ) ( not ( = ?auto_868589 ?auto_868592 ) ) ( not ( = ?auto_868589 ?auto_868593 ) ) ( not ( = ?auto_868589 ?auto_868594 ) ) ( not ( = ?auto_868589 ?auto_868595 ) ) ( not ( = ?auto_868589 ?auto_868596 ) ) ( not ( = ?auto_868589 ?auto_868597 ) ) ( not ( = ?auto_868589 ?auto_868598 ) ) ( not ( = ?auto_868590 ?auto_868591 ) ) ( not ( = ?auto_868590 ?auto_868592 ) ) ( not ( = ?auto_868590 ?auto_868593 ) ) ( not ( = ?auto_868590 ?auto_868594 ) ) ( not ( = ?auto_868590 ?auto_868595 ) ) ( not ( = ?auto_868590 ?auto_868596 ) ) ( not ( = ?auto_868590 ?auto_868597 ) ) ( not ( = ?auto_868590 ?auto_868598 ) ) ( not ( = ?auto_868591 ?auto_868592 ) ) ( not ( = ?auto_868591 ?auto_868593 ) ) ( not ( = ?auto_868591 ?auto_868594 ) ) ( not ( = ?auto_868591 ?auto_868595 ) ) ( not ( = ?auto_868591 ?auto_868596 ) ) ( not ( = ?auto_868591 ?auto_868597 ) ) ( not ( = ?auto_868591 ?auto_868598 ) ) ( not ( = ?auto_868592 ?auto_868593 ) ) ( not ( = ?auto_868592 ?auto_868594 ) ) ( not ( = ?auto_868592 ?auto_868595 ) ) ( not ( = ?auto_868592 ?auto_868596 ) ) ( not ( = ?auto_868592 ?auto_868597 ) ) ( not ( = ?auto_868592 ?auto_868598 ) ) ( not ( = ?auto_868593 ?auto_868594 ) ) ( not ( = ?auto_868593 ?auto_868595 ) ) ( not ( = ?auto_868593 ?auto_868596 ) ) ( not ( = ?auto_868593 ?auto_868597 ) ) ( not ( = ?auto_868593 ?auto_868598 ) ) ( not ( = ?auto_868594 ?auto_868595 ) ) ( not ( = ?auto_868594 ?auto_868596 ) ) ( not ( = ?auto_868594 ?auto_868597 ) ) ( not ( = ?auto_868594 ?auto_868598 ) ) ( not ( = ?auto_868595 ?auto_868596 ) ) ( not ( = ?auto_868595 ?auto_868597 ) ) ( not ( = ?auto_868595 ?auto_868598 ) ) ( not ( = ?auto_868596 ?auto_868597 ) ) ( not ( = ?auto_868596 ?auto_868598 ) ) ( not ( = ?auto_868597 ?auto_868598 ) ) ( ON ?auto_868596 ?auto_868597 ) ( ON ?auto_868595 ?auto_868596 ) ( ON ?auto_868594 ?auto_868595 ) ( ON ?auto_868593 ?auto_868594 ) ( ON ?auto_868592 ?auto_868593 ) ( ON ?auto_868591 ?auto_868592 ) ( ON ?auto_868590 ?auto_868591 ) ( CLEAR ?auto_868588 ) ( ON ?auto_868589 ?auto_868590 ) ( CLEAR ?auto_868589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_868582 ?auto_868583 ?auto_868584 ?auto_868585 ?auto_868586 ?auto_868587 ?auto_868588 ?auto_868589 )
      ( MAKE-16PILE ?auto_868582 ?auto_868583 ?auto_868584 ?auto_868585 ?auto_868586 ?auto_868587 ?auto_868588 ?auto_868589 ?auto_868590 ?auto_868591 ?auto_868592 ?auto_868593 ?auto_868594 ?auto_868595 ?auto_868596 ?auto_868597 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868648 - BLOCK
      ?auto_868649 - BLOCK
      ?auto_868650 - BLOCK
      ?auto_868651 - BLOCK
      ?auto_868652 - BLOCK
      ?auto_868653 - BLOCK
      ?auto_868654 - BLOCK
      ?auto_868655 - BLOCK
      ?auto_868656 - BLOCK
      ?auto_868657 - BLOCK
      ?auto_868658 - BLOCK
      ?auto_868659 - BLOCK
      ?auto_868660 - BLOCK
      ?auto_868661 - BLOCK
      ?auto_868662 - BLOCK
      ?auto_868663 - BLOCK
    )
    :vars
    (
      ?auto_868664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868663 ?auto_868664 ) ( ON-TABLE ?auto_868648 ) ( ON ?auto_868649 ?auto_868648 ) ( ON ?auto_868650 ?auto_868649 ) ( ON ?auto_868651 ?auto_868650 ) ( ON ?auto_868652 ?auto_868651 ) ( ON ?auto_868653 ?auto_868652 ) ( not ( = ?auto_868648 ?auto_868649 ) ) ( not ( = ?auto_868648 ?auto_868650 ) ) ( not ( = ?auto_868648 ?auto_868651 ) ) ( not ( = ?auto_868648 ?auto_868652 ) ) ( not ( = ?auto_868648 ?auto_868653 ) ) ( not ( = ?auto_868648 ?auto_868654 ) ) ( not ( = ?auto_868648 ?auto_868655 ) ) ( not ( = ?auto_868648 ?auto_868656 ) ) ( not ( = ?auto_868648 ?auto_868657 ) ) ( not ( = ?auto_868648 ?auto_868658 ) ) ( not ( = ?auto_868648 ?auto_868659 ) ) ( not ( = ?auto_868648 ?auto_868660 ) ) ( not ( = ?auto_868648 ?auto_868661 ) ) ( not ( = ?auto_868648 ?auto_868662 ) ) ( not ( = ?auto_868648 ?auto_868663 ) ) ( not ( = ?auto_868648 ?auto_868664 ) ) ( not ( = ?auto_868649 ?auto_868650 ) ) ( not ( = ?auto_868649 ?auto_868651 ) ) ( not ( = ?auto_868649 ?auto_868652 ) ) ( not ( = ?auto_868649 ?auto_868653 ) ) ( not ( = ?auto_868649 ?auto_868654 ) ) ( not ( = ?auto_868649 ?auto_868655 ) ) ( not ( = ?auto_868649 ?auto_868656 ) ) ( not ( = ?auto_868649 ?auto_868657 ) ) ( not ( = ?auto_868649 ?auto_868658 ) ) ( not ( = ?auto_868649 ?auto_868659 ) ) ( not ( = ?auto_868649 ?auto_868660 ) ) ( not ( = ?auto_868649 ?auto_868661 ) ) ( not ( = ?auto_868649 ?auto_868662 ) ) ( not ( = ?auto_868649 ?auto_868663 ) ) ( not ( = ?auto_868649 ?auto_868664 ) ) ( not ( = ?auto_868650 ?auto_868651 ) ) ( not ( = ?auto_868650 ?auto_868652 ) ) ( not ( = ?auto_868650 ?auto_868653 ) ) ( not ( = ?auto_868650 ?auto_868654 ) ) ( not ( = ?auto_868650 ?auto_868655 ) ) ( not ( = ?auto_868650 ?auto_868656 ) ) ( not ( = ?auto_868650 ?auto_868657 ) ) ( not ( = ?auto_868650 ?auto_868658 ) ) ( not ( = ?auto_868650 ?auto_868659 ) ) ( not ( = ?auto_868650 ?auto_868660 ) ) ( not ( = ?auto_868650 ?auto_868661 ) ) ( not ( = ?auto_868650 ?auto_868662 ) ) ( not ( = ?auto_868650 ?auto_868663 ) ) ( not ( = ?auto_868650 ?auto_868664 ) ) ( not ( = ?auto_868651 ?auto_868652 ) ) ( not ( = ?auto_868651 ?auto_868653 ) ) ( not ( = ?auto_868651 ?auto_868654 ) ) ( not ( = ?auto_868651 ?auto_868655 ) ) ( not ( = ?auto_868651 ?auto_868656 ) ) ( not ( = ?auto_868651 ?auto_868657 ) ) ( not ( = ?auto_868651 ?auto_868658 ) ) ( not ( = ?auto_868651 ?auto_868659 ) ) ( not ( = ?auto_868651 ?auto_868660 ) ) ( not ( = ?auto_868651 ?auto_868661 ) ) ( not ( = ?auto_868651 ?auto_868662 ) ) ( not ( = ?auto_868651 ?auto_868663 ) ) ( not ( = ?auto_868651 ?auto_868664 ) ) ( not ( = ?auto_868652 ?auto_868653 ) ) ( not ( = ?auto_868652 ?auto_868654 ) ) ( not ( = ?auto_868652 ?auto_868655 ) ) ( not ( = ?auto_868652 ?auto_868656 ) ) ( not ( = ?auto_868652 ?auto_868657 ) ) ( not ( = ?auto_868652 ?auto_868658 ) ) ( not ( = ?auto_868652 ?auto_868659 ) ) ( not ( = ?auto_868652 ?auto_868660 ) ) ( not ( = ?auto_868652 ?auto_868661 ) ) ( not ( = ?auto_868652 ?auto_868662 ) ) ( not ( = ?auto_868652 ?auto_868663 ) ) ( not ( = ?auto_868652 ?auto_868664 ) ) ( not ( = ?auto_868653 ?auto_868654 ) ) ( not ( = ?auto_868653 ?auto_868655 ) ) ( not ( = ?auto_868653 ?auto_868656 ) ) ( not ( = ?auto_868653 ?auto_868657 ) ) ( not ( = ?auto_868653 ?auto_868658 ) ) ( not ( = ?auto_868653 ?auto_868659 ) ) ( not ( = ?auto_868653 ?auto_868660 ) ) ( not ( = ?auto_868653 ?auto_868661 ) ) ( not ( = ?auto_868653 ?auto_868662 ) ) ( not ( = ?auto_868653 ?auto_868663 ) ) ( not ( = ?auto_868653 ?auto_868664 ) ) ( not ( = ?auto_868654 ?auto_868655 ) ) ( not ( = ?auto_868654 ?auto_868656 ) ) ( not ( = ?auto_868654 ?auto_868657 ) ) ( not ( = ?auto_868654 ?auto_868658 ) ) ( not ( = ?auto_868654 ?auto_868659 ) ) ( not ( = ?auto_868654 ?auto_868660 ) ) ( not ( = ?auto_868654 ?auto_868661 ) ) ( not ( = ?auto_868654 ?auto_868662 ) ) ( not ( = ?auto_868654 ?auto_868663 ) ) ( not ( = ?auto_868654 ?auto_868664 ) ) ( not ( = ?auto_868655 ?auto_868656 ) ) ( not ( = ?auto_868655 ?auto_868657 ) ) ( not ( = ?auto_868655 ?auto_868658 ) ) ( not ( = ?auto_868655 ?auto_868659 ) ) ( not ( = ?auto_868655 ?auto_868660 ) ) ( not ( = ?auto_868655 ?auto_868661 ) ) ( not ( = ?auto_868655 ?auto_868662 ) ) ( not ( = ?auto_868655 ?auto_868663 ) ) ( not ( = ?auto_868655 ?auto_868664 ) ) ( not ( = ?auto_868656 ?auto_868657 ) ) ( not ( = ?auto_868656 ?auto_868658 ) ) ( not ( = ?auto_868656 ?auto_868659 ) ) ( not ( = ?auto_868656 ?auto_868660 ) ) ( not ( = ?auto_868656 ?auto_868661 ) ) ( not ( = ?auto_868656 ?auto_868662 ) ) ( not ( = ?auto_868656 ?auto_868663 ) ) ( not ( = ?auto_868656 ?auto_868664 ) ) ( not ( = ?auto_868657 ?auto_868658 ) ) ( not ( = ?auto_868657 ?auto_868659 ) ) ( not ( = ?auto_868657 ?auto_868660 ) ) ( not ( = ?auto_868657 ?auto_868661 ) ) ( not ( = ?auto_868657 ?auto_868662 ) ) ( not ( = ?auto_868657 ?auto_868663 ) ) ( not ( = ?auto_868657 ?auto_868664 ) ) ( not ( = ?auto_868658 ?auto_868659 ) ) ( not ( = ?auto_868658 ?auto_868660 ) ) ( not ( = ?auto_868658 ?auto_868661 ) ) ( not ( = ?auto_868658 ?auto_868662 ) ) ( not ( = ?auto_868658 ?auto_868663 ) ) ( not ( = ?auto_868658 ?auto_868664 ) ) ( not ( = ?auto_868659 ?auto_868660 ) ) ( not ( = ?auto_868659 ?auto_868661 ) ) ( not ( = ?auto_868659 ?auto_868662 ) ) ( not ( = ?auto_868659 ?auto_868663 ) ) ( not ( = ?auto_868659 ?auto_868664 ) ) ( not ( = ?auto_868660 ?auto_868661 ) ) ( not ( = ?auto_868660 ?auto_868662 ) ) ( not ( = ?auto_868660 ?auto_868663 ) ) ( not ( = ?auto_868660 ?auto_868664 ) ) ( not ( = ?auto_868661 ?auto_868662 ) ) ( not ( = ?auto_868661 ?auto_868663 ) ) ( not ( = ?auto_868661 ?auto_868664 ) ) ( not ( = ?auto_868662 ?auto_868663 ) ) ( not ( = ?auto_868662 ?auto_868664 ) ) ( not ( = ?auto_868663 ?auto_868664 ) ) ( ON ?auto_868662 ?auto_868663 ) ( ON ?auto_868661 ?auto_868662 ) ( ON ?auto_868660 ?auto_868661 ) ( ON ?auto_868659 ?auto_868660 ) ( ON ?auto_868658 ?auto_868659 ) ( ON ?auto_868657 ?auto_868658 ) ( ON ?auto_868656 ?auto_868657 ) ( ON ?auto_868655 ?auto_868656 ) ( CLEAR ?auto_868653 ) ( ON ?auto_868654 ?auto_868655 ) ( CLEAR ?auto_868654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_868648 ?auto_868649 ?auto_868650 ?auto_868651 ?auto_868652 ?auto_868653 ?auto_868654 )
      ( MAKE-16PILE ?auto_868648 ?auto_868649 ?auto_868650 ?auto_868651 ?auto_868652 ?auto_868653 ?auto_868654 ?auto_868655 ?auto_868656 ?auto_868657 ?auto_868658 ?auto_868659 ?auto_868660 ?auto_868661 ?auto_868662 ?auto_868663 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868714 - BLOCK
      ?auto_868715 - BLOCK
      ?auto_868716 - BLOCK
      ?auto_868717 - BLOCK
      ?auto_868718 - BLOCK
      ?auto_868719 - BLOCK
      ?auto_868720 - BLOCK
      ?auto_868721 - BLOCK
      ?auto_868722 - BLOCK
      ?auto_868723 - BLOCK
      ?auto_868724 - BLOCK
      ?auto_868725 - BLOCK
      ?auto_868726 - BLOCK
      ?auto_868727 - BLOCK
      ?auto_868728 - BLOCK
      ?auto_868729 - BLOCK
    )
    :vars
    (
      ?auto_868730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868729 ?auto_868730 ) ( ON-TABLE ?auto_868714 ) ( ON ?auto_868715 ?auto_868714 ) ( ON ?auto_868716 ?auto_868715 ) ( ON ?auto_868717 ?auto_868716 ) ( ON ?auto_868718 ?auto_868717 ) ( not ( = ?auto_868714 ?auto_868715 ) ) ( not ( = ?auto_868714 ?auto_868716 ) ) ( not ( = ?auto_868714 ?auto_868717 ) ) ( not ( = ?auto_868714 ?auto_868718 ) ) ( not ( = ?auto_868714 ?auto_868719 ) ) ( not ( = ?auto_868714 ?auto_868720 ) ) ( not ( = ?auto_868714 ?auto_868721 ) ) ( not ( = ?auto_868714 ?auto_868722 ) ) ( not ( = ?auto_868714 ?auto_868723 ) ) ( not ( = ?auto_868714 ?auto_868724 ) ) ( not ( = ?auto_868714 ?auto_868725 ) ) ( not ( = ?auto_868714 ?auto_868726 ) ) ( not ( = ?auto_868714 ?auto_868727 ) ) ( not ( = ?auto_868714 ?auto_868728 ) ) ( not ( = ?auto_868714 ?auto_868729 ) ) ( not ( = ?auto_868714 ?auto_868730 ) ) ( not ( = ?auto_868715 ?auto_868716 ) ) ( not ( = ?auto_868715 ?auto_868717 ) ) ( not ( = ?auto_868715 ?auto_868718 ) ) ( not ( = ?auto_868715 ?auto_868719 ) ) ( not ( = ?auto_868715 ?auto_868720 ) ) ( not ( = ?auto_868715 ?auto_868721 ) ) ( not ( = ?auto_868715 ?auto_868722 ) ) ( not ( = ?auto_868715 ?auto_868723 ) ) ( not ( = ?auto_868715 ?auto_868724 ) ) ( not ( = ?auto_868715 ?auto_868725 ) ) ( not ( = ?auto_868715 ?auto_868726 ) ) ( not ( = ?auto_868715 ?auto_868727 ) ) ( not ( = ?auto_868715 ?auto_868728 ) ) ( not ( = ?auto_868715 ?auto_868729 ) ) ( not ( = ?auto_868715 ?auto_868730 ) ) ( not ( = ?auto_868716 ?auto_868717 ) ) ( not ( = ?auto_868716 ?auto_868718 ) ) ( not ( = ?auto_868716 ?auto_868719 ) ) ( not ( = ?auto_868716 ?auto_868720 ) ) ( not ( = ?auto_868716 ?auto_868721 ) ) ( not ( = ?auto_868716 ?auto_868722 ) ) ( not ( = ?auto_868716 ?auto_868723 ) ) ( not ( = ?auto_868716 ?auto_868724 ) ) ( not ( = ?auto_868716 ?auto_868725 ) ) ( not ( = ?auto_868716 ?auto_868726 ) ) ( not ( = ?auto_868716 ?auto_868727 ) ) ( not ( = ?auto_868716 ?auto_868728 ) ) ( not ( = ?auto_868716 ?auto_868729 ) ) ( not ( = ?auto_868716 ?auto_868730 ) ) ( not ( = ?auto_868717 ?auto_868718 ) ) ( not ( = ?auto_868717 ?auto_868719 ) ) ( not ( = ?auto_868717 ?auto_868720 ) ) ( not ( = ?auto_868717 ?auto_868721 ) ) ( not ( = ?auto_868717 ?auto_868722 ) ) ( not ( = ?auto_868717 ?auto_868723 ) ) ( not ( = ?auto_868717 ?auto_868724 ) ) ( not ( = ?auto_868717 ?auto_868725 ) ) ( not ( = ?auto_868717 ?auto_868726 ) ) ( not ( = ?auto_868717 ?auto_868727 ) ) ( not ( = ?auto_868717 ?auto_868728 ) ) ( not ( = ?auto_868717 ?auto_868729 ) ) ( not ( = ?auto_868717 ?auto_868730 ) ) ( not ( = ?auto_868718 ?auto_868719 ) ) ( not ( = ?auto_868718 ?auto_868720 ) ) ( not ( = ?auto_868718 ?auto_868721 ) ) ( not ( = ?auto_868718 ?auto_868722 ) ) ( not ( = ?auto_868718 ?auto_868723 ) ) ( not ( = ?auto_868718 ?auto_868724 ) ) ( not ( = ?auto_868718 ?auto_868725 ) ) ( not ( = ?auto_868718 ?auto_868726 ) ) ( not ( = ?auto_868718 ?auto_868727 ) ) ( not ( = ?auto_868718 ?auto_868728 ) ) ( not ( = ?auto_868718 ?auto_868729 ) ) ( not ( = ?auto_868718 ?auto_868730 ) ) ( not ( = ?auto_868719 ?auto_868720 ) ) ( not ( = ?auto_868719 ?auto_868721 ) ) ( not ( = ?auto_868719 ?auto_868722 ) ) ( not ( = ?auto_868719 ?auto_868723 ) ) ( not ( = ?auto_868719 ?auto_868724 ) ) ( not ( = ?auto_868719 ?auto_868725 ) ) ( not ( = ?auto_868719 ?auto_868726 ) ) ( not ( = ?auto_868719 ?auto_868727 ) ) ( not ( = ?auto_868719 ?auto_868728 ) ) ( not ( = ?auto_868719 ?auto_868729 ) ) ( not ( = ?auto_868719 ?auto_868730 ) ) ( not ( = ?auto_868720 ?auto_868721 ) ) ( not ( = ?auto_868720 ?auto_868722 ) ) ( not ( = ?auto_868720 ?auto_868723 ) ) ( not ( = ?auto_868720 ?auto_868724 ) ) ( not ( = ?auto_868720 ?auto_868725 ) ) ( not ( = ?auto_868720 ?auto_868726 ) ) ( not ( = ?auto_868720 ?auto_868727 ) ) ( not ( = ?auto_868720 ?auto_868728 ) ) ( not ( = ?auto_868720 ?auto_868729 ) ) ( not ( = ?auto_868720 ?auto_868730 ) ) ( not ( = ?auto_868721 ?auto_868722 ) ) ( not ( = ?auto_868721 ?auto_868723 ) ) ( not ( = ?auto_868721 ?auto_868724 ) ) ( not ( = ?auto_868721 ?auto_868725 ) ) ( not ( = ?auto_868721 ?auto_868726 ) ) ( not ( = ?auto_868721 ?auto_868727 ) ) ( not ( = ?auto_868721 ?auto_868728 ) ) ( not ( = ?auto_868721 ?auto_868729 ) ) ( not ( = ?auto_868721 ?auto_868730 ) ) ( not ( = ?auto_868722 ?auto_868723 ) ) ( not ( = ?auto_868722 ?auto_868724 ) ) ( not ( = ?auto_868722 ?auto_868725 ) ) ( not ( = ?auto_868722 ?auto_868726 ) ) ( not ( = ?auto_868722 ?auto_868727 ) ) ( not ( = ?auto_868722 ?auto_868728 ) ) ( not ( = ?auto_868722 ?auto_868729 ) ) ( not ( = ?auto_868722 ?auto_868730 ) ) ( not ( = ?auto_868723 ?auto_868724 ) ) ( not ( = ?auto_868723 ?auto_868725 ) ) ( not ( = ?auto_868723 ?auto_868726 ) ) ( not ( = ?auto_868723 ?auto_868727 ) ) ( not ( = ?auto_868723 ?auto_868728 ) ) ( not ( = ?auto_868723 ?auto_868729 ) ) ( not ( = ?auto_868723 ?auto_868730 ) ) ( not ( = ?auto_868724 ?auto_868725 ) ) ( not ( = ?auto_868724 ?auto_868726 ) ) ( not ( = ?auto_868724 ?auto_868727 ) ) ( not ( = ?auto_868724 ?auto_868728 ) ) ( not ( = ?auto_868724 ?auto_868729 ) ) ( not ( = ?auto_868724 ?auto_868730 ) ) ( not ( = ?auto_868725 ?auto_868726 ) ) ( not ( = ?auto_868725 ?auto_868727 ) ) ( not ( = ?auto_868725 ?auto_868728 ) ) ( not ( = ?auto_868725 ?auto_868729 ) ) ( not ( = ?auto_868725 ?auto_868730 ) ) ( not ( = ?auto_868726 ?auto_868727 ) ) ( not ( = ?auto_868726 ?auto_868728 ) ) ( not ( = ?auto_868726 ?auto_868729 ) ) ( not ( = ?auto_868726 ?auto_868730 ) ) ( not ( = ?auto_868727 ?auto_868728 ) ) ( not ( = ?auto_868727 ?auto_868729 ) ) ( not ( = ?auto_868727 ?auto_868730 ) ) ( not ( = ?auto_868728 ?auto_868729 ) ) ( not ( = ?auto_868728 ?auto_868730 ) ) ( not ( = ?auto_868729 ?auto_868730 ) ) ( ON ?auto_868728 ?auto_868729 ) ( ON ?auto_868727 ?auto_868728 ) ( ON ?auto_868726 ?auto_868727 ) ( ON ?auto_868725 ?auto_868726 ) ( ON ?auto_868724 ?auto_868725 ) ( ON ?auto_868723 ?auto_868724 ) ( ON ?auto_868722 ?auto_868723 ) ( ON ?auto_868721 ?auto_868722 ) ( ON ?auto_868720 ?auto_868721 ) ( CLEAR ?auto_868718 ) ( ON ?auto_868719 ?auto_868720 ) ( CLEAR ?auto_868719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_868714 ?auto_868715 ?auto_868716 ?auto_868717 ?auto_868718 ?auto_868719 )
      ( MAKE-16PILE ?auto_868714 ?auto_868715 ?auto_868716 ?auto_868717 ?auto_868718 ?auto_868719 ?auto_868720 ?auto_868721 ?auto_868722 ?auto_868723 ?auto_868724 ?auto_868725 ?auto_868726 ?auto_868727 ?auto_868728 ?auto_868729 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868780 - BLOCK
      ?auto_868781 - BLOCK
      ?auto_868782 - BLOCK
      ?auto_868783 - BLOCK
      ?auto_868784 - BLOCK
      ?auto_868785 - BLOCK
      ?auto_868786 - BLOCK
      ?auto_868787 - BLOCK
      ?auto_868788 - BLOCK
      ?auto_868789 - BLOCK
      ?auto_868790 - BLOCK
      ?auto_868791 - BLOCK
      ?auto_868792 - BLOCK
      ?auto_868793 - BLOCK
      ?auto_868794 - BLOCK
      ?auto_868795 - BLOCK
    )
    :vars
    (
      ?auto_868796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868795 ?auto_868796 ) ( ON-TABLE ?auto_868780 ) ( ON ?auto_868781 ?auto_868780 ) ( ON ?auto_868782 ?auto_868781 ) ( ON ?auto_868783 ?auto_868782 ) ( not ( = ?auto_868780 ?auto_868781 ) ) ( not ( = ?auto_868780 ?auto_868782 ) ) ( not ( = ?auto_868780 ?auto_868783 ) ) ( not ( = ?auto_868780 ?auto_868784 ) ) ( not ( = ?auto_868780 ?auto_868785 ) ) ( not ( = ?auto_868780 ?auto_868786 ) ) ( not ( = ?auto_868780 ?auto_868787 ) ) ( not ( = ?auto_868780 ?auto_868788 ) ) ( not ( = ?auto_868780 ?auto_868789 ) ) ( not ( = ?auto_868780 ?auto_868790 ) ) ( not ( = ?auto_868780 ?auto_868791 ) ) ( not ( = ?auto_868780 ?auto_868792 ) ) ( not ( = ?auto_868780 ?auto_868793 ) ) ( not ( = ?auto_868780 ?auto_868794 ) ) ( not ( = ?auto_868780 ?auto_868795 ) ) ( not ( = ?auto_868780 ?auto_868796 ) ) ( not ( = ?auto_868781 ?auto_868782 ) ) ( not ( = ?auto_868781 ?auto_868783 ) ) ( not ( = ?auto_868781 ?auto_868784 ) ) ( not ( = ?auto_868781 ?auto_868785 ) ) ( not ( = ?auto_868781 ?auto_868786 ) ) ( not ( = ?auto_868781 ?auto_868787 ) ) ( not ( = ?auto_868781 ?auto_868788 ) ) ( not ( = ?auto_868781 ?auto_868789 ) ) ( not ( = ?auto_868781 ?auto_868790 ) ) ( not ( = ?auto_868781 ?auto_868791 ) ) ( not ( = ?auto_868781 ?auto_868792 ) ) ( not ( = ?auto_868781 ?auto_868793 ) ) ( not ( = ?auto_868781 ?auto_868794 ) ) ( not ( = ?auto_868781 ?auto_868795 ) ) ( not ( = ?auto_868781 ?auto_868796 ) ) ( not ( = ?auto_868782 ?auto_868783 ) ) ( not ( = ?auto_868782 ?auto_868784 ) ) ( not ( = ?auto_868782 ?auto_868785 ) ) ( not ( = ?auto_868782 ?auto_868786 ) ) ( not ( = ?auto_868782 ?auto_868787 ) ) ( not ( = ?auto_868782 ?auto_868788 ) ) ( not ( = ?auto_868782 ?auto_868789 ) ) ( not ( = ?auto_868782 ?auto_868790 ) ) ( not ( = ?auto_868782 ?auto_868791 ) ) ( not ( = ?auto_868782 ?auto_868792 ) ) ( not ( = ?auto_868782 ?auto_868793 ) ) ( not ( = ?auto_868782 ?auto_868794 ) ) ( not ( = ?auto_868782 ?auto_868795 ) ) ( not ( = ?auto_868782 ?auto_868796 ) ) ( not ( = ?auto_868783 ?auto_868784 ) ) ( not ( = ?auto_868783 ?auto_868785 ) ) ( not ( = ?auto_868783 ?auto_868786 ) ) ( not ( = ?auto_868783 ?auto_868787 ) ) ( not ( = ?auto_868783 ?auto_868788 ) ) ( not ( = ?auto_868783 ?auto_868789 ) ) ( not ( = ?auto_868783 ?auto_868790 ) ) ( not ( = ?auto_868783 ?auto_868791 ) ) ( not ( = ?auto_868783 ?auto_868792 ) ) ( not ( = ?auto_868783 ?auto_868793 ) ) ( not ( = ?auto_868783 ?auto_868794 ) ) ( not ( = ?auto_868783 ?auto_868795 ) ) ( not ( = ?auto_868783 ?auto_868796 ) ) ( not ( = ?auto_868784 ?auto_868785 ) ) ( not ( = ?auto_868784 ?auto_868786 ) ) ( not ( = ?auto_868784 ?auto_868787 ) ) ( not ( = ?auto_868784 ?auto_868788 ) ) ( not ( = ?auto_868784 ?auto_868789 ) ) ( not ( = ?auto_868784 ?auto_868790 ) ) ( not ( = ?auto_868784 ?auto_868791 ) ) ( not ( = ?auto_868784 ?auto_868792 ) ) ( not ( = ?auto_868784 ?auto_868793 ) ) ( not ( = ?auto_868784 ?auto_868794 ) ) ( not ( = ?auto_868784 ?auto_868795 ) ) ( not ( = ?auto_868784 ?auto_868796 ) ) ( not ( = ?auto_868785 ?auto_868786 ) ) ( not ( = ?auto_868785 ?auto_868787 ) ) ( not ( = ?auto_868785 ?auto_868788 ) ) ( not ( = ?auto_868785 ?auto_868789 ) ) ( not ( = ?auto_868785 ?auto_868790 ) ) ( not ( = ?auto_868785 ?auto_868791 ) ) ( not ( = ?auto_868785 ?auto_868792 ) ) ( not ( = ?auto_868785 ?auto_868793 ) ) ( not ( = ?auto_868785 ?auto_868794 ) ) ( not ( = ?auto_868785 ?auto_868795 ) ) ( not ( = ?auto_868785 ?auto_868796 ) ) ( not ( = ?auto_868786 ?auto_868787 ) ) ( not ( = ?auto_868786 ?auto_868788 ) ) ( not ( = ?auto_868786 ?auto_868789 ) ) ( not ( = ?auto_868786 ?auto_868790 ) ) ( not ( = ?auto_868786 ?auto_868791 ) ) ( not ( = ?auto_868786 ?auto_868792 ) ) ( not ( = ?auto_868786 ?auto_868793 ) ) ( not ( = ?auto_868786 ?auto_868794 ) ) ( not ( = ?auto_868786 ?auto_868795 ) ) ( not ( = ?auto_868786 ?auto_868796 ) ) ( not ( = ?auto_868787 ?auto_868788 ) ) ( not ( = ?auto_868787 ?auto_868789 ) ) ( not ( = ?auto_868787 ?auto_868790 ) ) ( not ( = ?auto_868787 ?auto_868791 ) ) ( not ( = ?auto_868787 ?auto_868792 ) ) ( not ( = ?auto_868787 ?auto_868793 ) ) ( not ( = ?auto_868787 ?auto_868794 ) ) ( not ( = ?auto_868787 ?auto_868795 ) ) ( not ( = ?auto_868787 ?auto_868796 ) ) ( not ( = ?auto_868788 ?auto_868789 ) ) ( not ( = ?auto_868788 ?auto_868790 ) ) ( not ( = ?auto_868788 ?auto_868791 ) ) ( not ( = ?auto_868788 ?auto_868792 ) ) ( not ( = ?auto_868788 ?auto_868793 ) ) ( not ( = ?auto_868788 ?auto_868794 ) ) ( not ( = ?auto_868788 ?auto_868795 ) ) ( not ( = ?auto_868788 ?auto_868796 ) ) ( not ( = ?auto_868789 ?auto_868790 ) ) ( not ( = ?auto_868789 ?auto_868791 ) ) ( not ( = ?auto_868789 ?auto_868792 ) ) ( not ( = ?auto_868789 ?auto_868793 ) ) ( not ( = ?auto_868789 ?auto_868794 ) ) ( not ( = ?auto_868789 ?auto_868795 ) ) ( not ( = ?auto_868789 ?auto_868796 ) ) ( not ( = ?auto_868790 ?auto_868791 ) ) ( not ( = ?auto_868790 ?auto_868792 ) ) ( not ( = ?auto_868790 ?auto_868793 ) ) ( not ( = ?auto_868790 ?auto_868794 ) ) ( not ( = ?auto_868790 ?auto_868795 ) ) ( not ( = ?auto_868790 ?auto_868796 ) ) ( not ( = ?auto_868791 ?auto_868792 ) ) ( not ( = ?auto_868791 ?auto_868793 ) ) ( not ( = ?auto_868791 ?auto_868794 ) ) ( not ( = ?auto_868791 ?auto_868795 ) ) ( not ( = ?auto_868791 ?auto_868796 ) ) ( not ( = ?auto_868792 ?auto_868793 ) ) ( not ( = ?auto_868792 ?auto_868794 ) ) ( not ( = ?auto_868792 ?auto_868795 ) ) ( not ( = ?auto_868792 ?auto_868796 ) ) ( not ( = ?auto_868793 ?auto_868794 ) ) ( not ( = ?auto_868793 ?auto_868795 ) ) ( not ( = ?auto_868793 ?auto_868796 ) ) ( not ( = ?auto_868794 ?auto_868795 ) ) ( not ( = ?auto_868794 ?auto_868796 ) ) ( not ( = ?auto_868795 ?auto_868796 ) ) ( ON ?auto_868794 ?auto_868795 ) ( ON ?auto_868793 ?auto_868794 ) ( ON ?auto_868792 ?auto_868793 ) ( ON ?auto_868791 ?auto_868792 ) ( ON ?auto_868790 ?auto_868791 ) ( ON ?auto_868789 ?auto_868790 ) ( ON ?auto_868788 ?auto_868789 ) ( ON ?auto_868787 ?auto_868788 ) ( ON ?auto_868786 ?auto_868787 ) ( ON ?auto_868785 ?auto_868786 ) ( CLEAR ?auto_868783 ) ( ON ?auto_868784 ?auto_868785 ) ( CLEAR ?auto_868784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_868780 ?auto_868781 ?auto_868782 ?auto_868783 ?auto_868784 )
      ( MAKE-16PILE ?auto_868780 ?auto_868781 ?auto_868782 ?auto_868783 ?auto_868784 ?auto_868785 ?auto_868786 ?auto_868787 ?auto_868788 ?auto_868789 ?auto_868790 ?auto_868791 ?auto_868792 ?auto_868793 ?auto_868794 ?auto_868795 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868846 - BLOCK
      ?auto_868847 - BLOCK
      ?auto_868848 - BLOCK
      ?auto_868849 - BLOCK
      ?auto_868850 - BLOCK
      ?auto_868851 - BLOCK
      ?auto_868852 - BLOCK
      ?auto_868853 - BLOCK
      ?auto_868854 - BLOCK
      ?auto_868855 - BLOCK
      ?auto_868856 - BLOCK
      ?auto_868857 - BLOCK
      ?auto_868858 - BLOCK
      ?auto_868859 - BLOCK
      ?auto_868860 - BLOCK
      ?auto_868861 - BLOCK
    )
    :vars
    (
      ?auto_868862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868861 ?auto_868862 ) ( ON-TABLE ?auto_868846 ) ( ON ?auto_868847 ?auto_868846 ) ( ON ?auto_868848 ?auto_868847 ) ( not ( = ?auto_868846 ?auto_868847 ) ) ( not ( = ?auto_868846 ?auto_868848 ) ) ( not ( = ?auto_868846 ?auto_868849 ) ) ( not ( = ?auto_868846 ?auto_868850 ) ) ( not ( = ?auto_868846 ?auto_868851 ) ) ( not ( = ?auto_868846 ?auto_868852 ) ) ( not ( = ?auto_868846 ?auto_868853 ) ) ( not ( = ?auto_868846 ?auto_868854 ) ) ( not ( = ?auto_868846 ?auto_868855 ) ) ( not ( = ?auto_868846 ?auto_868856 ) ) ( not ( = ?auto_868846 ?auto_868857 ) ) ( not ( = ?auto_868846 ?auto_868858 ) ) ( not ( = ?auto_868846 ?auto_868859 ) ) ( not ( = ?auto_868846 ?auto_868860 ) ) ( not ( = ?auto_868846 ?auto_868861 ) ) ( not ( = ?auto_868846 ?auto_868862 ) ) ( not ( = ?auto_868847 ?auto_868848 ) ) ( not ( = ?auto_868847 ?auto_868849 ) ) ( not ( = ?auto_868847 ?auto_868850 ) ) ( not ( = ?auto_868847 ?auto_868851 ) ) ( not ( = ?auto_868847 ?auto_868852 ) ) ( not ( = ?auto_868847 ?auto_868853 ) ) ( not ( = ?auto_868847 ?auto_868854 ) ) ( not ( = ?auto_868847 ?auto_868855 ) ) ( not ( = ?auto_868847 ?auto_868856 ) ) ( not ( = ?auto_868847 ?auto_868857 ) ) ( not ( = ?auto_868847 ?auto_868858 ) ) ( not ( = ?auto_868847 ?auto_868859 ) ) ( not ( = ?auto_868847 ?auto_868860 ) ) ( not ( = ?auto_868847 ?auto_868861 ) ) ( not ( = ?auto_868847 ?auto_868862 ) ) ( not ( = ?auto_868848 ?auto_868849 ) ) ( not ( = ?auto_868848 ?auto_868850 ) ) ( not ( = ?auto_868848 ?auto_868851 ) ) ( not ( = ?auto_868848 ?auto_868852 ) ) ( not ( = ?auto_868848 ?auto_868853 ) ) ( not ( = ?auto_868848 ?auto_868854 ) ) ( not ( = ?auto_868848 ?auto_868855 ) ) ( not ( = ?auto_868848 ?auto_868856 ) ) ( not ( = ?auto_868848 ?auto_868857 ) ) ( not ( = ?auto_868848 ?auto_868858 ) ) ( not ( = ?auto_868848 ?auto_868859 ) ) ( not ( = ?auto_868848 ?auto_868860 ) ) ( not ( = ?auto_868848 ?auto_868861 ) ) ( not ( = ?auto_868848 ?auto_868862 ) ) ( not ( = ?auto_868849 ?auto_868850 ) ) ( not ( = ?auto_868849 ?auto_868851 ) ) ( not ( = ?auto_868849 ?auto_868852 ) ) ( not ( = ?auto_868849 ?auto_868853 ) ) ( not ( = ?auto_868849 ?auto_868854 ) ) ( not ( = ?auto_868849 ?auto_868855 ) ) ( not ( = ?auto_868849 ?auto_868856 ) ) ( not ( = ?auto_868849 ?auto_868857 ) ) ( not ( = ?auto_868849 ?auto_868858 ) ) ( not ( = ?auto_868849 ?auto_868859 ) ) ( not ( = ?auto_868849 ?auto_868860 ) ) ( not ( = ?auto_868849 ?auto_868861 ) ) ( not ( = ?auto_868849 ?auto_868862 ) ) ( not ( = ?auto_868850 ?auto_868851 ) ) ( not ( = ?auto_868850 ?auto_868852 ) ) ( not ( = ?auto_868850 ?auto_868853 ) ) ( not ( = ?auto_868850 ?auto_868854 ) ) ( not ( = ?auto_868850 ?auto_868855 ) ) ( not ( = ?auto_868850 ?auto_868856 ) ) ( not ( = ?auto_868850 ?auto_868857 ) ) ( not ( = ?auto_868850 ?auto_868858 ) ) ( not ( = ?auto_868850 ?auto_868859 ) ) ( not ( = ?auto_868850 ?auto_868860 ) ) ( not ( = ?auto_868850 ?auto_868861 ) ) ( not ( = ?auto_868850 ?auto_868862 ) ) ( not ( = ?auto_868851 ?auto_868852 ) ) ( not ( = ?auto_868851 ?auto_868853 ) ) ( not ( = ?auto_868851 ?auto_868854 ) ) ( not ( = ?auto_868851 ?auto_868855 ) ) ( not ( = ?auto_868851 ?auto_868856 ) ) ( not ( = ?auto_868851 ?auto_868857 ) ) ( not ( = ?auto_868851 ?auto_868858 ) ) ( not ( = ?auto_868851 ?auto_868859 ) ) ( not ( = ?auto_868851 ?auto_868860 ) ) ( not ( = ?auto_868851 ?auto_868861 ) ) ( not ( = ?auto_868851 ?auto_868862 ) ) ( not ( = ?auto_868852 ?auto_868853 ) ) ( not ( = ?auto_868852 ?auto_868854 ) ) ( not ( = ?auto_868852 ?auto_868855 ) ) ( not ( = ?auto_868852 ?auto_868856 ) ) ( not ( = ?auto_868852 ?auto_868857 ) ) ( not ( = ?auto_868852 ?auto_868858 ) ) ( not ( = ?auto_868852 ?auto_868859 ) ) ( not ( = ?auto_868852 ?auto_868860 ) ) ( not ( = ?auto_868852 ?auto_868861 ) ) ( not ( = ?auto_868852 ?auto_868862 ) ) ( not ( = ?auto_868853 ?auto_868854 ) ) ( not ( = ?auto_868853 ?auto_868855 ) ) ( not ( = ?auto_868853 ?auto_868856 ) ) ( not ( = ?auto_868853 ?auto_868857 ) ) ( not ( = ?auto_868853 ?auto_868858 ) ) ( not ( = ?auto_868853 ?auto_868859 ) ) ( not ( = ?auto_868853 ?auto_868860 ) ) ( not ( = ?auto_868853 ?auto_868861 ) ) ( not ( = ?auto_868853 ?auto_868862 ) ) ( not ( = ?auto_868854 ?auto_868855 ) ) ( not ( = ?auto_868854 ?auto_868856 ) ) ( not ( = ?auto_868854 ?auto_868857 ) ) ( not ( = ?auto_868854 ?auto_868858 ) ) ( not ( = ?auto_868854 ?auto_868859 ) ) ( not ( = ?auto_868854 ?auto_868860 ) ) ( not ( = ?auto_868854 ?auto_868861 ) ) ( not ( = ?auto_868854 ?auto_868862 ) ) ( not ( = ?auto_868855 ?auto_868856 ) ) ( not ( = ?auto_868855 ?auto_868857 ) ) ( not ( = ?auto_868855 ?auto_868858 ) ) ( not ( = ?auto_868855 ?auto_868859 ) ) ( not ( = ?auto_868855 ?auto_868860 ) ) ( not ( = ?auto_868855 ?auto_868861 ) ) ( not ( = ?auto_868855 ?auto_868862 ) ) ( not ( = ?auto_868856 ?auto_868857 ) ) ( not ( = ?auto_868856 ?auto_868858 ) ) ( not ( = ?auto_868856 ?auto_868859 ) ) ( not ( = ?auto_868856 ?auto_868860 ) ) ( not ( = ?auto_868856 ?auto_868861 ) ) ( not ( = ?auto_868856 ?auto_868862 ) ) ( not ( = ?auto_868857 ?auto_868858 ) ) ( not ( = ?auto_868857 ?auto_868859 ) ) ( not ( = ?auto_868857 ?auto_868860 ) ) ( not ( = ?auto_868857 ?auto_868861 ) ) ( not ( = ?auto_868857 ?auto_868862 ) ) ( not ( = ?auto_868858 ?auto_868859 ) ) ( not ( = ?auto_868858 ?auto_868860 ) ) ( not ( = ?auto_868858 ?auto_868861 ) ) ( not ( = ?auto_868858 ?auto_868862 ) ) ( not ( = ?auto_868859 ?auto_868860 ) ) ( not ( = ?auto_868859 ?auto_868861 ) ) ( not ( = ?auto_868859 ?auto_868862 ) ) ( not ( = ?auto_868860 ?auto_868861 ) ) ( not ( = ?auto_868860 ?auto_868862 ) ) ( not ( = ?auto_868861 ?auto_868862 ) ) ( ON ?auto_868860 ?auto_868861 ) ( ON ?auto_868859 ?auto_868860 ) ( ON ?auto_868858 ?auto_868859 ) ( ON ?auto_868857 ?auto_868858 ) ( ON ?auto_868856 ?auto_868857 ) ( ON ?auto_868855 ?auto_868856 ) ( ON ?auto_868854 ?auto_868855 ) ( ON ?auto_868853 ?auto_868854 ) ( ON ?auto_868852 ?auto_868853 ) ( ON ?auto_868851 ?auto_868852 ) ( ON ?auto_868850 ?auto_868851 ) ( CLEAR ?auto_868848 ) ( ON ?auto_868849 ?auto_868850 ) ( CLEAR ?auto_868849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_868846 ?auto_868847 ?auto_868848 ?auto_868849 )
      ( MAKE-16PILE ?auto_868846 ?auto_868847 ?auto_868848 ?auto_868849 ?auto_868850 ?auto_868851 ?auto_868852 ?auto_868853 ?auto_868854 ?auto_868855 ?auto_868856 ?auto_868857 ?auto_868858 ?auto_868859 ?auto_868860 ?auto_868861 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868912 - BLOCK
      ?auto_868913 - BLOCK
      ?auto_868914 - BLOCK
      ?auto_868915 - BLOCK
      ?auto_868916 - BLOCK
      ?auto_868917 - BLOCK
      ?auto_868918 - BLOCK
      ?auto_868919 - BLOCK
      ?auto_868920 - BLOCK
      ?auto_868921 - BLOCK
      ?auto_868922 - BLOCK
      ?auto_868923 - BLOCK
      ?auto_868924 - BLOCK
      ?auto_868925 - BLOCK
      ?auto_868926 - BLOCK
      ?auto_868927 - BLOCK
    )
    :vars
    (
      ?auto_868928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868927 ?auto_868928 ) ( ON-TABLE ?auto_868912 ) ( ON ?auto_868913 ?auto_868912 ) ( not ( = ?auto_868912 ?auto_868913 ) ) ( not ( = ?auto_868912 ?auto_868914 ) ) ( not ( = ?auto_868912 ?auto_868915 ) ) ( not ( = ?auto_868912 ?auto_868916 ) ) ( not ( = ?auto_868912 ?auto_868917 ) ) ( not ( = ?auto_868912 ?auto_868918 ) ) ( not ( = ?auto_868912 ?auto_868919 ) ) ( not ( = ?auto_868912 ?auto_868920 ) ) ( not ( = ?auto_868912 ?auto_868921 ) ) ( not ( = ?auto_868912 ?auto_868922 ) ) ( not ( = ?auto_868912 ?auto_868923 ) ) ( not ( = ?auto_868912 ?auto_868924 ) ) ( not ( = ?auto_868912 ?auto_868925 ) ) ( not ( = ?auto_868912 ?auto_868926 ) ) ( not ( = ?auto_868912 ?auto_868927 ) ) ( not ( = ?auto_868912 ?auto_868928 ) ) ( not ( = ?auto_868913 ?auto_868914 ) ) ( not ( = ?auto_868913 ?auto_868915 ) ) ( not ( = ?auto_868913 ?auto_868916 ) ) ( not ( = ?auto_868913 ?auto_868917 ) ) ( not ( = ?auto_868913 ?auto_868918 ) ) ( not ( = ?auto_868913 ?auto_868919 ) ) ( not ( = ?auto_868913 ?auto_868920 ) ) ( not ( = ?auto_868913 ?auto_868921 ) ) ( not ( = ?auto_868913 ?auto_868922 ) ) ( not ( = ?auto_868913 ?auto_868923 ) ) ( not ( = ?auto_868913 ?auto_868924 ) ) ( not ( = ?auto_868913 ?auto_868925 ) ) ( not ( = ?auto_868913 ?auto_868926 ) ) ( not ( = ?auto_868913 ?auto_868927 ) ) ( not ( = ?auto_868913 ?auto_868928 ) ) ( not ( = ?auto_868914 ?auto_868915 ) ) ( not ( = ?auto_868914 ?auto_868916 ) ) ( not ( = ?auto_868914 ?auto_868917 ) ) ( not ( = ?auto_868914 ?auto_868918 ) ) ( not ( = ?auto_868914 ?auto_868919 ) ) ( not ( = ?auto_868914 ?auto_868920 ) ) ( not ( = ?auto_868914 ?auto_868921 ) ) ( not ( = ?auto_868914 ?auto_868922 ) ) ( not ( = ?auto_868914 ?auto_868923 ) ) ( not ( = ?auto_868914 ?auto_868924 ) ) ( not ( = ?auto_868914 ?auto_868925 ) ) ( not ( = ?auto_868914 ?auto_868926 ) ) ( not ( = ?auto_868914 ?auto_868927 ) ) ( not ( = ?auto_868914 ?auto_868928 ) ) ( not ( = ?auto_868915 ?auto_868916 ) ) ( not ( = ?auto_868915 ?auto_868917 ) ) ( not ( = ?auto_868915 ?auto_868918 ) ) ( not ( = ?auto_868915 ?auto_868919 ) ) ( not ( = ?auto_868915 ?auto_868920 ) ) ( not ( = ?auto_868915 ?auto_868921 ) ) ( not ( = ?auto_868915 ?auto_868922 ) ) ( not ( = ?auto_868915 ?auto_868923 ) ) ( not ( = ?auto_868915 ?auto_868924 ) ) ( not ( = ?auto_868915 ?auto_868925 ) ) ( not ( = ?auto_868915 ?auto_868926 ) ) ( not ( = ?auto_868915 ?auto_868927 ) ) ( not ( = ?auto_868915 ?auto_868928 ) ) ( not ( = ?auto_868916 ?auto_868917 ) ) ( not ( = ?auto_868916 ?auto_868918 ) ) ( not ( = ?auto_868916 ?auto_868919 ) ) ( not ( = ?auto_868916 ?auto_868920 ) ) ( not ( = ?auto_868916 ?auto_868921 ) ) ( not ( = ?auto_868916 ?auto_868922 ) ) ( not ( = ?auto_868916 ?auto_868923 ) ) ( not ( = ?auto_868916 ?auto_868924 ) ) ( not ( = ?auto_868916 ?auto_868925 ) ) ( not ( = ?auto_868916 ?auto_868926 ) ) ( not ( = ?auto_868916 ?auto_868927 ) ) ( not ( = ?auto_868916 ?auto_868928 ) ) ( not ( = ?auto_868917 ?auto_868918 ) ) ( not ( = ?auto_868917 ?auto_868919 ) ) ( not ( = ?auto_868917 ?auto_868920 ) ) ( not ( = ?auto_868917 ?auto_868921 ) ) ( not ( = ?auto_868917 ?auto_868922 ) ) ( not ( = ?auto_868917 ?auto_868923 ) ) ( not ( = ?auto_868917 ?auto_868924 ) ) ( not ( = ?auto_868917 ?auto_868925 ) ) ( not ( = ?auto_868917 ?auto_868926 ) ) ( not ( = ?auto_868917 ?auto_868927 ) ) ( not ( = ?auto_868917 ?auto_868928 ) ) ( not ( = ?auto_868918 ?auto_868919 ) ) ( not ( = ?auto_868918 ?auto_868920 ) ) ( not ( = ?auto_868918 ?auto_868921 ) ) ( not ( = ?auto_868918 ?auto_868922 ) ) ( not ( = ?auto_868918 ?auto_868923 ) ) ( not ( = ?auto_868918 ?auto_868924 ) ) ( not ( = ?auto_868918 ?auto_868925 ) ) ( not ( = ?auto_868918 ?auto_868926 ) ) ( not ( = ?auto_868918 ?auto_868927 ) ) ( not ( = ?auto_868918 ?auto_868928 ) ) ( not ( = ?auto_868919 ?auto_868920 ) ) ( not ( = ?auto_868919 ?auto_868921 ) ) ( not ( = ?auto_868919 ?auto_868922 ) ) ( not ( = ?auto_868919 ?auto_868923 ) ) ( not ( = ?auto_868919 ?auto_868924 ) ) ( not ( = ?auto_868919 ?auto_868925 ) ) ( not ( = ?auto_868919 ?auto_868926 ) ) ( not ( = ?auto_868919 ?auto_868927 ) ) ( not ( = ?auto_868919 ?auto_868928 ) ) ( not ( = ?auto_868920 ?auto_868921 ) ) ( not ( = ?auto_868920 ?auto_868922 ) ) ( not ( = ?auto_868920 ?auto_868923 ) ) ( not ( = ?auto_868920 ?auto_868924 ) ) ( not ( = ?auto_868920 ?auto_868925 ) ) ( not ( = ?auto_868920 ?auto_868926 ) ) ( not ( = ?auto_868920 ?auto_868927 ) ) ( not ( = ?auto_868920 ?auto_868928 ) ) ( not ( = ?auto_868921 ?auto_868922 ) ) ( not ( = ?auto_868921 ?auto_868923 ) ) ( not ( = ?auto_868921 ?auto_868924 ) ) ( not ( = ?auto_868921 ?auto_868925 ) ) ( not ( = ?auto_868921 ?auto_868926 ) ) ( not ( = ?auto_868921 ?auto_868927 ) ) ( not ( = ?auto_868921 ?auto_868928 ) ) ( not ( = ?auto_868922 ?auto_868923 ) ) ( not ( = ?auto_868922 ?auto_868924 ) ) ( not ( = ?auto_868922 ?auto_868925 ) ) ( not ( = ?auto_868922 ?auto_868926 ) ) ( not ( = ?auto_868922 ?auto_868927 ) ) ( not ( = ?auto_868922 ?auto_868928 ) ) ( not ( = ?auto_868923 ?auto_868924 ) ) ( not ( = ?auto_868923 ?auto_868925 ) ) ( not ( = ?auto_868923 ?auto_868926 ) ) ( not ( = ?auto_868923 ?auto_868927 ) ) ( not ( = ?auto_868923 ?auto_868928 ) ) ( not ( = ?auto_868924 ?auto_868925 ) ) ( not ( = ?auto_868924 ?auto_868926 ) ) ( not ( = ?auto_868924 ?auto_868927 ) ) ( not ( = ?auto_868924 ?auto_868928 ) ) ( not ( = ?auto_868925 ?auto_868926 ) ) ( not ( = ?auto_868925 ?auto_868927 ) ) ( not ( = ?auto_868925 ?auto_868928 ) ) ( not ( = ?auto_868926 ?auto_868927 ) ) ( not ( = ?auto_868926 ?auto_868928 ) ) ( not ( = ?auto_868927 ?auto_868928 ) ) ( ON ?auto_868926 ?auto_868927 ) ( ON ?auto_868925 ?auto_868926 ) ( ON ?auto_868924 ?auto_868925 ) ( ON ?auto_868923 ?auto_868924 ) ( ON ?auto_868922 ?auto_868923 ) ( ON ?auto_868921 ?auto_868922 ) ( ON ?auto_868920 ?auto_868921 ) ( ON ?auto_868919 ?auto_868920 ) ( ON ?auto_868918 ?auto_868919 ) ( ON ?auto_868917 ?auto_868918 ) ( ON ?auto_868916 ?auto_868917 ) ( ON ?auto_868915 ?auto_868916 ) ( CLEAR ?auto_868913 ) ( ON ?auto_868914 ?auto_868915 ) ( CLEAR ?auto_868914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_868912 ?auto_868913 ?auto_868914 )
      ( MAKE-16PILE ?auto_868912 ?auto_868913 ?auto_868914 ?auto_868915 ?auto_868916 ?auto_868917 ?auto_868918 ?auto_868919 ?auto_868920 ?auto_868921 ?auto_868922 ?auto_868923 ?auto_868924 ?auto_868925 ?auto_868926 ?auto_868927 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_868978 - BLOCK
      ?auto_868979 - BLOCK
      ?auto_868980 - BLOCK
      ?auto_868981 - BLOCK
      ?auto_868982 - BLOCK
      ?auto_868983 - BLOCK
      ?auto_868984 - BLOCK
      ?auto_868985 - BLOCK
      ?auto_868986 - BLOCK
      ?auto_868987 - BLOCK
      ?auto_868988 - BLOCK
      ?auto_868989 - BLOCK
      ?auto_868990 - BLOCK
      ?auto_868991 - BLOCK
      ?auto_868992 - BLOCK
      ?auto_868993 - BLOCK
    )
    :vars
    (
      ?auto_868994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_868993 ?auto_868994 ) ( ON-TABLE ?auto_868978 ) ( not ( = ?auto_868978 ?auto_868979 ) ) ( not ( = ?auto_868978 ?auto_868980 ) ) ( not ( = ?auto_868978 ?auto_868981 ) ) ( not ( = ?auto_868978 ?auto_868982 ) ) ( not ( = ?auto_868978 ?auto_868983 ) ) ( not ( = ?auto_868978 ?auto_868984 ) ) ( not ( = ?auto_868978 ?auto_868985 ) ) ( not ( = ?auto_868978 ?auto_868986 ) ) ( not ( = ?auto_868978 ?auto_868987 ) ) ( not ( = ?auto_868978 ?auto_868988 ) ) ( not ( = ?auto_868978 ?auto_868989 ) ) ( not ( = ?auto_868978 ?auto_868990 ) ) ( not ( = ?auto_868978 ?auto_868991 ) ) ( not ( = ?auto_868978 ?auto_868992 ) ) ( not ( = ?auto_868978 ?auto_868993 ) ) ( not ( = ?auto_868978 ?auto_868994 ) ) ( not ( = ?auto_868979 ?auto_868980 ) ) ( not ( = ?auto_868979 ?auto_868981 ) ) ( not ( = ?auto_868979 ?auto_868982 ) ) ( not ( = ?auto_868979 ?auto_868983 ) ) ( not ( = ?auto_868979 ?auto_868984 ) ) ( not ( = ?auto_868979 ?auto_868985 ) ) ( not ( = ?auto_868979 ?auto_868986 ) ) ( not ( = ?auto_868979 ?auto_868987 ) ) ( not ( = ?auto_868979 ?auto_868988 ) ) ( not ( = ?auto_868979 ?auto_868989 ) ) ( not ( = ?auto_868979 ?auto_868990 ) ) ( not ( = ?auto_868979 ?auto_868991 ) ) ( not ( = ?auto_868979 ?auto_868992 ) ) ( not ( = ?auto_868979 ?auto_868993 ) ) ( not ( = ?auto_868979 ?auto_868994 ) ) ( not ( = ?auto_868980 ?auto_868981 ) ) ( not ( = ?auto_868980 ?auto_868982 ) ) ( not ( = ?auto_868980 ?auto_868983 ) ) ( not ( = ?auto_868980 ?auto_868984 ) ) ( not ( = ?auto_868980 ?auto_868985 ) ) ( not ( = ?auto_868980 ?auto_868986 ) ) ( not ( = ?auto_868980 ?auto_868987 ) ) ( not ( = ?auto_868980 ?auto_868988 ) ) ( not ( = ?auto_868980 ?auto_868989 ) ) ( not ( = ?auto_868980 ?auto_868990 ) ) ( not ( = ?auto_868980 ?auto_868991 ) ) ( not ( = ?auto_868980 ?auto_868992 ) ) ( not ( = ?auto_868980 ?auto_868993 ) ) ( not ( = ?auto_868980 ?auto_868994 ) ) ( not ( = ?auto_868981 ?auto_868982 ) ) ( not ( = ?auto_868981 ?auto_868983 ) ) ( not ( = ?auto_868981 ?auto_868984 ) ) ( not ( = ?auto_868981 ?auto_868985 ) ) ( not ( = ?auto_868981 ?auto_868986 ) ) ( not ( = ?auto_868981 ?auto_868987 ) ) ( not ( = ?auto_868981 ?auto_868988 ) ) ( not ( = ?auto_868981 ?auto_868989 ) ) ( not ( = ?auto_868981 ?auto_868990 ) ) ( not ( = ?auto_868981 ?auto_868991 ) ) ( not ( = ?auto_868981 ?auto_868992 ) ) ( not ( = ?auto_868981 ?auto_868993 ) ) ( not ( = ?auto_868981 ?auto_868994 ) ) ( not ( = ?auto_868982 ?auto_868983 ) ) ( not ( = ?auto_868982 ?auto_868984 ) ) ( not ( = ?auto_868982 ?auto_868985 ) ) ( not ( = ?auto_868982 ?auto_868986 ) ) ( not ( = ?auto_868982 ?auto_868987 ) ) ( not ( = ?auto_868982 ?auto_868988 ) ) ( not ( = ?auto_868982 ?auto_868989 ) ) ( not ( = ?auto_868982 ?auto_868990 ) ) ( not ( = ?auto_868982 ?auto_868991 ) ) ( not ( = ?auto_868982 ?auto_868992 ) ) ( not ( = ?auto_868982 ?auto_868993 ) ) ( not ( = ?auto_868982 ?auto_868994 ) ) ( not ( = ?auto_868983 ?auto_868984 ) ) ( not ( = ?auto_868983 ?auto_868985 ) ) ( not ( = ?auto_868983 ?auto_868986 ) ) ( not ( = ?auto_868983 ?auto_868987 ) ) ( not ( = ?auto_868983 ?auto_868988 ) ) ( not ( = ?auto_868983 ?auto_868989 ) ) ( not ( = ?auto_868983 ?auto_868990 ) ) ( not ( = ?auto_868983 ?auto_868991 ) ) ( not ( = ?auto_868983 ?auto_868992 ) ) ( not ( = ?auto_868983 ?auto_868993 ) ) ( not ( = ?auto_868983 ?auto_868994 ) ) ( not ( = ?auto_868984 ?auto_868985 ) ) ( not ( = ?auto_868984 ?auto_868986 ) ) ( not ( = ?auto_868984 ?auto_868987 ) ) ( not ( = ?auto_868984 ?auto_868988 ) ) ( not ( = ?auto_868984 ?auto_868989 ) ) ( not ( = ?auto_868984 ?auto_868990 ) ) ( not ( = ?auto_868984 ?auto_868991 ) ) ( not ( = ?auto_868984 ?auto_868992 ) ) ( not ( = ?auto_868984 ?auto_868993 ) ) ( not ( = ?auto_868984 ?auto_868994 ) ) ( not ( = ?auto_868985 ?auto_868986 ) ) ( not ( = ?auto_868985 ?auto_868987 ) ) ( not ( = ?auto_868985 ?auto_868988 ) ) ( not ( = ?auto_868985 ?auto_868989 ) ) ( not ( = ?auto_868985 ?auto_868990 ) ) ( not ( = ?auto_868985 ?auto_868991 ) ) ( not ( = ?auto_868985 ?auto_868992 ) ) ( not ( = ?auto_868985 ?auto_868993 ) ) ( not ( = ?auto_868985 ?auto_868994 ) ) ( not ( = ?auto_868986 ?auto_868987 ) ) ( not ( = ?auto_868986 ?auto_868988 ) ) ( not ( = ?auto_868986 ?auto_868989 ) ) ( not ( = ?auto_868986 ?auto_868990 ) ) ( not ( = ?auto_868986 ?auto_868991 ) ) ( not ( = ?auto_868986 ?auto_868992 ) ) ( not ( = ?auto_868986 ?auto_868993 ) ) ( not ( = ?auto_868986 ?auto_868994 ) ) ( not ( = ?auto_868987 ?auto_868988 ) ) ( not ( = ?auto_868987 ?auto_868989 ) ) ( not ( = ?auto_868987 ?auto_868990 ) ) ( not ( = ?auto_868987 ?auto_868991 ) ) ( not ( = ?auto_868987 ?auto_868992 ) ) ( not ( = ?auto_868987 ?auto_868993 ) ) ( not ( = ?auto_868987 ?auto_868994 ) ) ( not ( = ?auto_868988 ?auto_868989 ) ) ( not ( = ?auto_868988 ?auto_868990 ) ) ( not ( = ?auto_868988 ?auto_868991 ) ) ( not ( = ?auto_868988 ?auto_868992 ) ) ( not ( = ?auto_868988 ?auto_868993 ) ) ( not ( = ?auto_868988 ?auto_868994 ) ) ( not ( = ?auto_868989 ?auto_868990 ) ) ( not ( = ?auto_868989 ?auto_868991 ) ) ( not ( = ?auto_868989 ?auto_868992 ) ) ( not ( = ?auto_868989 ?auto_868993 ) ) ( not ( = ?auto_868989 ?auto_868994 ) ) ( not ( = ?auto_868990 ?auto_868991 ) ) ( not ( = ?auto_868990 ?auto_868992 ) ) ( not ( = ?auto_868990 ?auto_868993 ) ) ( not ( = ?auto_868990 ?auto_868994 ) ) ( not ( = ?auto_868991 ?auto_868992 ) ) ( not ( = ?auto_868991 ?auto_868993 ) ) ( not ( = ?auto_868991 ?auto_868994 ) ) ( not ( = ?auto_868992 ?auto_868993 ) ) ( not ( = ?auto_868992 ?auto_868994 ) ) ( not ( = ?auto_868993 ?auto_868994 ) ) ( ON ?auto_868992 ?auto_868993 ) ( ON ?auto_868991 ?auto_868992 ) ( ON ?auto_868990 ?auto_868991 ) ( ON ?auto_868989 ?auto_868990 ) ( ON ?auto_868988 ?auto_868989 ) ( ON ?auto_868987 ?auto_868988 ) ( ON ?auto_868986 ?auto_868987 ) ( ON ?auto_868985 ?auto_868986 ) ( ON ?auto_868984 ?auto_868985 ) ( ON ?auto_868983 ?auto_868984 ) ( ON ?auto_868982 ?auto_868983 ) ( ON ?auto_868981 ?auto_868982 ) ( ON ?auto_868980 ?auto_868981 ) ( CLEAR ?auto_868978 ) ( ON ?auto_868979 ?auto_868980 ) ( CLEAR ?auto_868979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_868978 ?auto_868979 )
      ( MAKE-16PILE ?auto_868978 ?auto_868979 ?auto_868980 ?auto_868981 ?auto_868982 ?auto_868983 ?auto_868984 ?auto_868985 ?auto_868986 ?auto_868987 ?auto_868988 ?auto_868989 ?auto_868990 ?auto_868991 ?auto_868992 ?auto_868993 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_869044 - BLOCK
      ?auto_869045 - BLOCK
      ?auto_869046 - BLOCK
      ?auto_869047 - BLOCK
      ?auto_869048 - BLOCK
      ?auto_869049 - BLOCK
      ?auto_869050 - BLOCK
      ?auto_869051 - BLOCK
      ?auto_869052 - BLOCK
      ?auto_869053 - BLOCK
      ?auto_869054 - BLOCK
      ?auto_869055 - BLOCK
      ?auto_869056 - BLOCK
      ?auto_869057 - BLOCK
      ?auto_869058 - BLOCK
      ?auto_869059 - BLOCK
    )
    :vars
    (
      ?auto_869060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869059 ?auto_869060 ) ( not ( = ?auto_869044 ?auto_869045 ) ) ( not ( = ?auto_869044 ?auto_869046 ) ) ( not ( = ?auto_869044 ?auto_869047 ) ) ( not ( = ?auto_869044 ?auto_869048 ) ) ( not ( = ?auto_869044 ?auto_869049 ) ) ( not ( = ?auto_869044 ?auto_869050 ) ) ( not ( = ?auto_869044 ?auto_869051 ) ) ( not ( = ?auto_869044 ?auto_869052 ) ) ( not ( = ?auto_869044 ?auto_869053 ) ) ( not ( = ?auto_869044 ?auto_869054 ) ) ( not ( = ?auto_869044 ?auto_869055 ) ) ( not ( = ?auto_869044 ?auto_869056 ) ) ( not ( = ?auto_869044 ?auto_869057 ) ) ( not ( = ?auto_869044 ?auto_869058 ) ) ( not ( = ?auto_869044 ?auto_869059 ) ) ( not ( = ?auto_869044 ?auto_869060 ) ) ( not ( = ?auto_869045 ?auto_869046 ) ) ( not ( = ?auto_869045 ?auto_869047 ) ) ( not ( = ?auto_869045 ?auto_869048 ) ) ( not ( = ?auto_869045 ?auto_869049 ) ) ( not ( = ?auto_869045 ?auto_869050 ) ) ( not ( = ?auto_869045 ?auto_869051 ) ) ( not ( = ?auto_869045 ?auto_869052 ) ) ( not ( = ?auto_869045 ?auto_869053 ) ) ( not ( = ?auto_869045 ?auto_869054 ) ) ( not ( = ?auto_869045 ?auto_869055 ) ) ( not ( = ?auto_869045 ?auto_869056 ) ) ( not ( = ?auto_869045 ?auto_869057 ) ) ( not ( = ?auto_869045 ?auto_869058 ) ) ( not ( = ?auto_869045 ?auto_869059 ) ) ( not ( = ?auto_869045 ?auto_869060 ) ) ( not ( = ?auto_869046 ?auto_869047 ) ) ( not ( = ?auto_869046 ?auto_869048 ) ) ( not ( = ?auto_869046 ?auto_869049 ) ) ( not ( = ?auto_869046 ?auto_869050 ) ) ( not ( = ?auto_869046 ?auto_869051 ) ) ( not ( = ?auto_869046 ?auto_869052 ) ) ( not ( = ?auto_869046 ?auto_869053 ) ) ( not ( = ?auto_869046 ?auto_869054 ) ) ( not ( = ?auto_869046 ?auto_869055 ) ) ( not ( = ?auto_869046 ?auto_869056 ) ) ( not ( = ?auto_869046 ?auto_869057 ) ) ( not ( = ?auto_869046 ?auto_869058 ) ) ( not ( = ?auto_869046 ?auto_869059 ) ) ( not ( = ?auto_869046 ?auto_869060 ) ) ( not ( = ?auto_869047 ?auto_869048 ) ) ( not ( = ?auto_869047 ?auto_869049 ) ) ( not ( = ?auto_869047 ?auto_869050 ) ) ( not ( = ?auto_869047 ?auto_869051 ) ) ( not ( = ?auto_869047 ?auto_869052 ) ) ( not ( = ?auto_869047 ?auto_869053 ) ) ( not ( = ?auto_869047 ?auto_869054 ) ) ( not ( = ?auto_869047 ?auto_869055 ) ) ( not ( = ?auto_869047 ?auto_869056 ) ) ( not ( = ?auto_869047 ?auto_869057 ) ) ( not ( = ?auto_869047 ?auto_869058 ) ) ( not ( = ?auto_869047 ?auto_869059 ) ) ( not ( = ?auto_869047 ?auto_869060 ) ) ( not ( = ?auto_869048 ?auto_869049 ) ) ( not ( = ?auto_869048 ?auto_869050 ) ) ( not ( = ?auto_869048 ?auto_869051 ) ) ( not ( = ?auto_869048 ?auto_869052 ) ) ( not ( = ?auto_869048 ?auto_869053 ) ) ( not ( = ?auto_869048 ?auto_869054 ) ) ( not ( = ?auto_869048 ?auto_869055 ) ) ( not ( = ?auto_869048 ?auto_869056 ) ) ( not ( = ?auto_869048 ?auto_869057 ) ) ( not ( = ?auto_869048 ?auto_869058 ) ) ( not ( = ?auto_869048 ?auto_869059 ) ) ( not ( = ?auto_869048 ?auto_869060 ) ) ( not ( = ?auto_869049 ?auto_869050 ) ) ( not ( = ?auto_869049 ?auto_869051 ) ) ( not ( = ?auto_869049 ?auto_869052 ) ) ( not ( = ?auto_869049 ?auto_869053 ) ) ( not ( = ?auto_869049 ?auto_869054 ) ) ( not ( = ?auto_869049 ?auto_869055 ) ) ( not ( = ?auto_869049 ?auto_869056 ) ) ( not ( = ?auto_869049 ?auto_869057 ) ) ( not ( = ?auto_869049 ?auto_869058 ) ) ( not ( = ?auto_869049 ?auto_869059 ) ) ( not ( = ?auto_869049 ?auto_869060 ) ) ( not ( = ?auto_869050 ?auto_869051 ) ) ( not ( = ?auto_869050 ?auto_869052 ) ) ( not ( = ?auto_869050 ?auto_869053 ) ) ( not ( = ?auto_869050 ?auto_869054 ) ) ( not ( = ?auto_869050 ?auto_869055 ) ) ( not ( = ?auto_869050 ?auto_869056 ) ) ( not ( = ?auto_869050 ?auto_869057 ) ) ( not ( = ?auto_869050 ?auto_869058 ) ) ( not ( = ?auto_869050 ?auto_869059 ) ) ( not ( = ?auto_869050 ?auto_869060 ) ) ( not ( = ?auto_869051 ?auto_869052 ) ) ( not ( = ?auto_869051 ?auto_869053 ) ) ( not ( = ?auto_869051 ?auto_869054 ) ) ( not ( = ?auto_869051 ?auto_869055 ) ) ( not ( = ?auto_869051 ?auto_869056 ) ) ( not ( = ?auto_869051 ?auto_869057 ) ) ( not ( = ?auto_869051 ?auto_869058 ) ) ( not ( = ?auto_869051 ?auto_869059 ) ) ( not ( = ?auto_869051 ?auto_869060 ) ) ( not ( = ?auto_869052 ?auto_869053 ) ) ( not ( = ?auto_869052 ?auto_869054 ) ) ( not ( = ?auto_869052 ?auto_869055 ) ) ( not ( = ?auto_869052 ?auto_869056 ) ) ( not ( = ?auto_869052 ?auto_869057 ) ) ( not ( = ?auto_869052 ?auto_869058 ) ) ( not ( = ?auto_869052 ?auto_869059 ) ) ( not ( = ?auto_869052 ?auto_869060 ) ) ( not ( = ?auto_869053 ?auto_869054 ) ) ( not ( = ?auto_869053 ?auto_869055 ) ) ( not ( = ?auto_869053 ?auto_869056 ) ) ( not ( = ?auto_869053 ?auto_869057 ) ) ( not ( = ?auto_869053 ?auto_869058 ) ) ( not ( = ?auto_869053 ?auto_869059 ) ) ( not ( = ?auto_869053 ?auto_869060 ) ) ( not ( = ?auto_869054 ?auto_869055 ) ) ( not ( = ?auto_869054 ?auto_869056 ) ) ( not ( = ?auto_869054 ?auto_869057 ) ) ( not ( = ?auto_869054 ?auto_869058 ) ) ( not ( = ?auto_869054 ?auto_869059 ) ) ( not ( = ?auto_869054 ?auto_869060 ) ) ( not ( = ?auto_869055 ?auto_869056 ) ) ( not ( = ?auto_869055 ?auto_869057 ) ) ( not ( = ?auto_869055 ?auto_869058 ) ) ( not ( = ?auto_869055 ?auto_869059 ) ) ( not ( = ?auto_869055 ?auto_869060 ) ) ( not ( = ?auto_869056 ?auto_869057 ) ) ( not ( = ?auto_869056 ?auto_869058 ) ) ( not ( = ?auto_869056 ?auto_869059 ) ) ( not ( = ?auto_869056 ?auto_869060 ) ) ( not ( = ?auto_869057 ?auto_869058 ) ) ( not ( = ?auto_869057 ?auto_869059 ) ) ( not ( = ?auto_869057 ?auto_869060 ) ) ( not ( = ?auto_869058 ?auto_869059 ) ) ( not ( = ?auto_869058 ?auto_869060 ) ) ( not ( = ?auto_869059 ?auto_869060 ) ) ( ON ?auto_869058 ?auto_869059 ) ( ON ?auto_869057 ?auto_869058 ) ( ON ?auto_869056 ?auto_869057 ) ( ON ?auto_869055 ?auto_869056 ) ( ON ?auto_869054 ?auto_869055 ) ( ON ?auto_869053 ?auto_869054 ) ( ON ?auto_869052 ?auto_869053 ) ( ON ?auto_869051 ?auto_869052 ) ( ON ?auto_869050 ?auto_869051 ) ( ON ?auto_869049 ?auto_869050 ) ( ON ?auto_869048 ?auto_869049 ) ( ON ?auto_869047 ?auto_869048 ) ( ON ?auto_869046 ?auto_869047 ) ( ON ?auto_869045 ?auto_869046 ) ( ON ?auto_869044 ?auto_869045 ) ( CLEAR ?auto_869044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_869044 )
      ( MAKE-16PILE ?auto_869044 ?auto_869045 ?auto_869046 ?auto_869047 ?auto_869048 ?auto_869049 ?auto_869050 ?auto_869051 ?auto_869052 ?auto_869053 ?auto_869054 ?auto_869055 ?auto_869056 ?auto_869057 ?auto_869058 ?auto_869059 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869111 - BLOCK
      ?auto_869112 - BLOCK
      ?auto_869113 - BLOCK
      ?auto_869114 - BLOCK
      ?auto_869115 - BLOCK
      ?auto_869116 - BLOCK
      ?auto_869117 - BLOCK
      ?auto_869118 - BLOCK
      ?auto_869119 - BLOCK
      ?auto_869120 - BLOCK
      ?auto_869121 - BLOCK
      ?auto_869122 - BLOCK
      ?auto_869123 - BLOCK
      ?auto_869124 - BLOCK
      ?auto_869125 - BLOCK
      ?auto_869126 - BLOCK
      ?auto_869127 - BLOCK
    )
    :vars
    (
      ?auto_869128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_869126 ) ( ON ?auto_869127 ?auto_869128 ) ( CLEAR ?auto_869127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_869111 ) ( ON ?auto_869112 ?auto_869111 ) ( ON ?auto_869113 ?auto_869112 ) ( ON ?auto_869114 ?auto_869113 ) ( ON ?auto_869115 ?auto_869114 ) ( ON ?auto_869116 ?auto_869115 ) ( ON ?auto_869117 ?auto_869116 ) ( ON ?auto_869118 ?auto_869117 ) ( ON ?auto_869119 ?auto_869118 ) ( ON ?auto_869120 ?auto_869119 ) ( ON ?auto_869121 ?auto_869120 ) ( ON ?auto_869122 ?auto_869121 ) ( ON ?auto_869123 ?auto_869122 ) ( ON ?auto_869124 ?auto_869123 ) ( ON ?auto_869125 ?auto_869124 ) ( ON ?auto_869126 ?auto_869125 ) ( not ( = ?auto_869111 ?auto_869112 ) ) ( not ( = ?auto_869111 ?auto_869113 ) ) ( not ( = ?auto_869111 ?auto_869114 ) ) ( not ( = ?auto_869111 ?auto_869115 ) ) ( not ( = ?auto_869111 ?auto_869116 ) ) ( not ( = ?auto_869111 ?auto_869117 ) ) ( not ( = ?auto_869111 ?auto_869118 ) ) ( not ( = ?auto_869111 ?auto_869119 ) ) ( not ( = ?auto_869111 ?auto_869120 ) ) ( not ( = ?auto_869111 ?auto_869121 ) ) ( not ( = ?auto_869111 ?auto_869122 ) ) ( not ( = ?auto_869111 ?auto_869123 ) ) ( not ( = ?auto_869111 ?auto_869124 ) ) ( not ( = ?auto_869111 ?auto_869125 ) ) ( not ( = ?auto_869111 ?auto_869126 ) ) ( not ( = ?auto_869111 ?auto_869127 ) ) ( not ( = ?auto_869111 ?auto_869128 ) ) ( not ( = ?auto_869112 ?auto_869113 ) ) ( not ( = ?auto_869112 ?auto_869114 ) ) ( not ( = ?auto_869112 ?auto_869115 ) ) ( not ( = ?auto_869112 ?auto_869116 ) ) ( not ( = ?auto_869112 ?auto_869117 ) ) ( not ( = ?auto_869112 ?auto_869118 ) ) ( not ( = ?auto_869112 ?auto_869119 ) ) ( not ( = ?auto_869112 ?auto_869120 ) ) ( not ( = ?auto_869112 ?auto_869121 ) ) ( not ( = ?auto_869112 ?auto_869122 ) ) ( not ( = ?auto_869112 ?auto_869123 ) ) ( not ( = ?auto_869112 ?auto_869124 ) ) ( not ( = ?auto_869112 ?auto_869125 ) ) ( not ( = ?auto_869112 ?auto_869126 ) ) ( not ( = ?auto_869112 ?auto_869127 ) ) ( not ( = ?auto_869112 ?auto_869128 ) ) ( not ( = ?auto_869113 ?auto_869114 ) ) ( not ( = ?auto_869113 ?auto_869115 ) ) ( not ( = ?auto_869113 ?auto_869116 ) ) ( not ( = ?auto_869113 ?auto_869117 ) ) ( not ( = ?auto_869113 ?auto_869118 ) ) ( not ( = ?auto_869113 ?auto_869119 ) ) ( not ( = ?auto_869113 ?auto_869120 ) ) ( not ( = ?auto_869113 ?auto_869121 ) ) ( not ( = ?auto_869113 ?auto_869122 ) ) ( not ( = ?auto_869113 ?auto_869123 ) ) ( not ( = ?auto_869113 ?auto_869124 ) ) ( not ( = ?auto_869113 ?auto_869125 ) ) ( not ( = ?auto_869113 ?auto_869126 ) ) ( not ( = ?auto_869113 ?auto_869127 ) ) ( not ( = ?auto_869113 ?auto_869128 ) ) ( not ( = ?auto_869114 ?auto_869115 ) ) ( not ( = ?auto_869114 ?auto_869116 ) ) ( not ( = ?auto_869114 ?auto_869117 ) ) ( not ( = ?auto_869114 ?auto_869118 ) ) ( not ( = ?auto_869114 ?auto_869119 ) ) ( not ( = ?auto_869114 ?auto_869120 ) ) ( not ( = ?auto_869114 ?auto_869121 ) ) ( not ( = ?auto_869114 ?auto_869122 ) ) ( not ( = ?auto_869114 ?auto_869123 ) ) ( not ( = ?auto_869114 ?auto_869124 ) ) ( not ( = ?auto_869114 ?auto_869125 ) ) ( not ( = ?auto_869114 ?auto_869126 ) ) ( not ( = ?auto_869114 ?auto_869127 ) ) ( not ( = ?auto_869114 ?auto_869128 ) ) ( not ( = ?auto_869115 ?auto_869116 ) ) ( not ( = ?auto_869115 ?auto_869117 ) ) ( not ( = ?auto_869115 ?auto_869118 ) ) ( not ( = ?auto_869115 ?auto_869119 ) ) ( not ( = ?auto_869115 ?auto_869120 ) ) ( not ( = ?auto_869115 ?auto_869121 ) ) ( not ( = ?auto_869115 ?auto_869122 ) ) ( not ( = ?auto_869115 ?auto_869123 ) ) ( not ( = ?auto_869115 ?auto_869124 ) ) ( not ( = ?auto_869115 ?auto_869125 ) ) ( not ( = ?auto_869115 ?auto_869126 ) ) ( not ( = ?auto_869115 ?auto_869127 ) ) ( not ( = ?auto_869115 ?auto_869128 ) ) ( not ( = ?auto_869116 ?auto_869117 ) ) ( not ( = ?auto_869116 ?auto_869118 ) ) ( not ( = ?auto_869116 ?auto_869119 ) ) ( not ( = ?auto_869116 ?auto_869120 ) ) ( not ( = ?auto_869116 ?auto_869121 ) ) ( not ( = ?auto_869116 ?auto_869122 ) ) ( not ( = ?auto_869116 ?auto_869123 ) ) ( not ( = ?auto_869116 ?auto_869124 ) ) ( not ( = ?auto_869116 ?auto_869125 ) ) ( not ( = ?auto_869116 ?auto_869126 ) ) ( not ( = ?auto_869116 ?auto_869127 ) ) ( not ( = ?auto_869116 ?auto_869128 ) ) ( not ( = ?auto_869117 ?auto_869118 ) ) ( not ( = ?auto_869117 ?auto_869119 ) ) ( not ( = ?auto_869117 ?auto_869120 ) ) ( not ( = ?auto_869117 ?auto_869121 ) ) ( not ( = ?auto_869117 ?auto_869122 ) ) ( not ( = ?auto_869117 ?auto_869123 ) ) ( not ( = ?auto_869117 ?auto_869124 ) ) ( not ( = ?auto_869117 ?auto_869125 ) ) ( not ( = ?auto_869117 ?auto_869126 ) ) ( not ( = ?auto_869117 ?auto_869127 ) ) ( not ( = ?auto_869117 ?auto_869128 ) ) ( not ( = ?auto_869118 ?auto_869119 ) ) ( not ( = ?auto_869118 ?auto_869120 ) ) ( not ( = ?auto_869118 ?auto_869121 ) ) ( not ( = ?auto_869118 ?auto_869122 ) ) ( not ( = ?auto_869118 ?auto_869123 ) ) ( not ( = ?auto_869118 ?auto_869124 ) ) ( not ( = ?auto_869118 ?auto_869125 ) ) ( not ( = ?auto_869118 ?auto_869126 ) ) ( not ( = ?auto_869118 ?auto_869127 ) ) ( not ( = ?auto_869118 ?auto_869128 ) ) ( not ( = ?auto_869119 ?auto_869120 ) ) ( not ( = ?auto_869119 ?auto_869121 ) ) ( not ( = ?auto_869119 ?auto_869122 ) ) ( not ( = ?auto_869119 ?auto_869123 ) ) ( not ( = ?auto_869119 ?auto_869124 ) ) ( not ( = ?auto_869119 ?auto_869125 ) ) ( not ( = ?auto_869119 ?auto_869126 ) ) ( not ( = ?auto_869119 ?auto_869127 ) ) ( not ( = ?auto_869119 ?auto_869128 ) ) ( not ( = ?auto_869120 ?auto_869121 ) ) ( not ( = ?auto_869120 ?auto_869122 ) ) ( not ( = ?auto_869120 ?auto_869123 ) ) ( not ( = ?auto_869120 ?auto_869124 ) ) ( not ( = ?auto_869120 ?auto_869125 ) ) ( not ( = ?auto_869120 ?auto_869126 ) ) ( not ( = ?auto_869120 ?auto_869127 ) ) ( not ( = ?auto_869120 ?auto_869128 ) ) ( not ( = ?auto_869121 ?auto_869122 ) ) ( not ( = ?auto_869121 ?auto_869123 ) ) ( not ( = ?auto_869121 ?auto_869124 ) ) ( not ( = ?auto_869121 ?auto_869125 ) ) ( not ( = ?auto_869121 ?auto_869126 ) ) ( not ( = ?auto_869121 ?auto_869127 ) ) ( not ( = ?auto_869121 ?auto_869128 ) ) ( not ( = ?auto_869122 ?auto_869123 ) ) ( not ( = ?auto_869122 ?auto_869124 ) ) ( not ( = ?auto_869122 ?auto_869125 ) ) ( not ( = ?auto_869122 ?auto_869126 ) ) ( not ( = ?auto_869122 ?auto_869127 ) ) ( not ( = ?auto_869122 ?auto_869128 ) ) ( not ( = ?auto_869123 ?auto_869124 ) ) ( not ( = ?auto_869123 ?auto_869125 ) ) ( not ( = ?auto_869123 ?auto_869126 ) ) ( not ( = ?auto_869123 ?auto_869127 ) ) ( not ( = ?auto_869123 ?auto_869128 ) ) ( not ( = ?auto_869124 ?auto_869125 ) ) ( not ( = ?auto_869124 ?auto_869126 ) ) ( not ( = ?auto_869124 ?auto_869127 ) ) ( not ( = ?auto_869124 ?auto_869128 ) ) ( not ( = ?auto_869125 ?auto_869126 ) ) ( not ( = ?auto_869125 ?auto_869127 ) ) ( not ( = ?auto_869125 ?auto_869128 ) ) ( not ( = ?auto_869126 ?auto_869127 ) ) ( not ( = ?auto_869126 ?auto_869128 ) ) ( not ( = ?auto_869127 ?auto_869128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_869127 ?auto_869128 )
      ( !STACK ?auto_869127 ?auto_869126 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869181 - BLOCK
      ?auto_869182 - BLOCK
      ?auto_869183 - BLOCK
      ?auto_869184 - BLOCK
      ?auto_869185 - BLOCK
      ?auto_869186 - BLOCK
      ?auto_869187 - BLOCK
      ?auto_869188 - BLOCK
      ?auto_869189 - BLOCK
      ?auto_869190 - BLOCK
      ?auto_869191 - BLOCK
      ?auto_869192 - BLOCK
      ?auto_869193 - BLOCK
      ?auto_869194 - BLOCK
      ?auto_869195 - BLOCK
      ?auto_869196 - BLOCK
      ?auto_869197 - BLOCK
    )
    :vars
    (
      ?auto_869198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869197 ?auto_869198 ) ( ON-TABLE ?auto_869181 ) ( ON ?auto_869182 ?auto_869181 ) ( ON ?auto_869183 ?auto_869182 ) ( ON ?auto_869184 ?auto_869183 ) ( ON ?auto_869185 ?auto_869184 ) ( ON ?auto_869186 ?auto_869185 ) ( ON ?auto_869187 ?auto_869186 ) ( ON ?auto_869188 ?auto_869187 ) ( ON ?auto_869189 ?auto_869188 ) ( ON ?auto_869190 ?auto_869189 ) ( ON ?auto_869191 ?auto_869190 ) ( ON ?auto_869192 ?auto_869191 ) ( ON ?auto_869193 ?auto_869192 ) ( ON ?auto_869194 ?auto_869193 ) ( ON ?auto_869195 ?auto_869194 ) ( not ( = ?auto_869181 ?auto_869182 ) ) ( not ( = ?auto_869181 ?auto_869183 ) ) ( not ( = ?auto_869181 ?auto_869184 ) ) ( not ( = ?auto_869181 ?auto_869185 ) ) ( not ( = ?auto_869181 ?auto_869186 ) ) ( not ( = ?auto_869181 ?auto_869187 ) ) ( not ( = ?auto_869181 ?auto_869188 ) ) ( not ( = ?auto_869181 ?auto_869189 ) ) ( not ( = ?auto_869181 ?auto_869190 ) ) ( not ( = ?auto_869181 ?auto_869191 ) ) ( not ( = ?auto_869181 ?auto_869192 ) ) ( not ( = ?auto_869181 ?auto_869193 ) ) ( not ( = ?auto_869181 ?auto_869194 ) ) ( not ( = ?auto_869181 ?auto_869195 ) ) ( not ( = ?auto_869181 ?auto_869196 ) ) ( not ( = ?auto_869181 ?auto_869197 ) ) ( not ( = ?auto_869181 ?auto_869198 ) ) ( not ( = ?auto_869182 ?auto_869183 ) ) ( not ( = ?auto_869182 ?auto_869184 ) ) ( not ( = ?auto_869182 ?auto_869185 ) ) ( not ( = ?auto_869182 ?auto_869186 ) ) ( not ( = ?auto_869182 ?auto_869187 ) ) ( not ( = ?auto_869182 ?auto_869188 ) ) ( not ( = ?auto_869182 ?auto_869189 ) ) ( not ( = ?auto_869182 ?auto_869190 ) ) ( not ( = ?auto_869182 ?auto_869191 ) ) ( not ( = ?auto_869182 ?auto_869192 ) ) ( not ( = ?auto_869182 ?auto_869193 ) ) ( not ( = ?auto_869182 ?auto_869194 ) ) ( not ( = ?auto_869182 ?auto_869195 ) ) ( not ( = ?auto_869182 ?auto_869196 ) ) ( not ( = ?auto_869182 ?auto_869197 ) ) ( not ( = ?auto_869182 ?auto_869198 ) ) ( not ( = ?auto_869183 ?auto_869184 ) ) ( not ( = ?auto_869183 ?auto_869185 ) ) ( not ( = ?auto_869183 ?auto_869186 ) ) ( not ( = ?auto_869183 ?auto_869187 ) ) ( not ( = ?auto_869183 ?auto_869188 ) ) ( not ( = ?auto_869183 ?auto_869189 ) ) ( not ( = ?auto_869183 ?auto_869190 ) ) ( not ( = ?auto_869183 ?auto_869191 ) ) ( not ( = ?auto_869183 ?auto_869192 ) ) ( not ( = ?auto_869183 ?auto_869193 ) ) ( not ( = ?auto_869183 ?auto_869194 ) ) ( not ( = ?auto_869183 ?auto_869195 ) ) ( not ( = ?auto_869183 ?auto_869196 ) ) ( not ( = ?auto_869183 ?auto_869197 ) ) ( not ( = ?auto_869183 ?auto_869198 ) ) ( not ( = ?auto_869184 ?auto_869185 ) ) ( not ( = ?auto_869184 ?auto_869186 ) ) ( not ( = ?auto_869184 ?auto_869187 ) ) ( not ( = ?auto_869184 ?auto_869188 ) ) ( not ( = ?auto_869184 ?auto_869189 ) ) ( not ( = ?auto_869184 ?auto_869190 ) ) ( not ( = ?auto_869184 ?auto_869191 ) ) ( not ( = ?auto_869184 ?auto_869192 ) ) ( not ( = ?auto_869184 ?auto_869193 ) ) ( not ( = ?auto_869184 ?auto_869194 ) ) ( not ( = ?auto_869184 ?auto_869195 ) ) ( not ( = ?auto_869184 ?auto_869196 ) ) ( not ( = ?auto_869184 ?auto_869197 ) ) ( not ( = ?auto_869184 ?auto_869198 ) ) ( not ( = ?auto_869185 ?auto_869186 ) ) ( not ( = ?auto_869185 ?auto_869187 ) ) ( not ( = ?auto_869185 ?auto_869188 ) ) ( not ( = ?auto_869185 ?auto_869189 ) ) ( not ( = ?auto_869185 ?auto_869190 ) ) ( not ( = ?auto_869185 ?auto_869191 ) ) ( not ( = ?auto_869185 ?auto_869192 ) ) ( not ( = ?auto_869185 ?auto_869193 ) ) ( not ( = ?auto_869185 ?auto_869194 ) ) ( not ( = ?auto_869185 ?auto_869195 ) ) ( not ( = ?auto_869185 ?auto_869196 ) ) ( not ( = ?auto_869185 ?auto_869197 ) ) ( not ( = ?auto_869185 ?auto_869198 ) ) ( not ( = ?auto_869186 ?auto_869187 ) ) ( not ( = ?auto_869186 ?auto_869188 ) ) ( not ( = ?auto_869186 ?auto_869189 ) ) ( not ( = ?auto_869186 ?auto_869190 ) ) ( not ( = ?auto_869186 ?auto_869191 ) ) ( not ( = ?auto_869186 ?auto_869192 ) ) ( not ( = ?auto_869186 ?auto_869193 ) ) ( not ( = ?auto_869186 ?auto_869194 ) ) ( not ( = ?auto_869186 ?auto_869195 ) ) ( not ( = ?auto_869186 ?auto_869196 ) ) ( not ( = ?auto_869186 ?auto_869197 ) ) ( not ( = ?auto_869186 ?auto_869198 ) ) ( not ( = ?auto_869187 ?auto_869188 ) ) ( not ( = ?auto_869187 ?auto_869189 ) ) ( not ( = ?auto_869187 ?auto_869190 ) ) ( not ( = ?auto_869187 ?auto_869191 ) ) ( not ( = ?auto_869187 ?auto_869192 ) ) ( not ( = ?auto_869187 ?auto_869193 ) ) ( not ( = ?auto_869187 ?auto_869194 ) ) ( not ( = ?auto_869187 ?auto_869195 ) ) ( not ( = ?auto_869187 ?auto_869196 ) ) ( not ( = ?auto_869187 ?auto_869197 ) ) ( not ( = ?auto_869187 ?auto_869198 ) ) ( not ( = ?auto_869188 ?auto_869189 ) ) ( not ( = ?auto_869188 ?auto_869190 ) ) ( not ( = ?auto_869188 ?auto_869191 ) ) ( not ( = ?auto_869188 ?auto_869192 ) ) ( not ( = ?auto_869188 ?auto_869193 ) ) ( not ( = ?auto_869188 ?auto_869194 ) ) ( not ( = ?auto_869188 ?auto_869195 ) ) ( not ( = ?auto_869188 ?auto_869196 ) ) ( not ( = ?auto_869188 ?auto_869197 ) ) ( not ( = ?auto_869188 ?auto_869198 ) ) ( not ( = ?auto_869189 ?auto_869190 ) ) ( not ( = ?auto_869189 ?auto_869191 ) ) ( not ( = ?auto_869189 ?auto_869192 ) ) ( not ( = ?auto_869189 ?auto_869193 ) ) ( not ( = ?auto_869189 ?auto_869194 ) ) ( not ( = ?auto_869189 ?auto_869195 ) ) ( not ( = ?auto_869189 ?auto_869196 ) ) ( not ( = ?auto_869189 ?auto_869197 ) ) ( not ( = ?auto_869189 ?auto_869198 ) ) ( not ( = ?auto_869190 ?auto_869191 ) ) ( not ( = ?auto_869190 ?auto_869192 ) ) ( not ( = ?auto_869190 ?auto_869193 ) ) ( not ( = ?auto_869190 ?auto_869194 ) ) ( not ( = ?auto_869190 ?auto_869195 ) ) ( not ( = ?auto_869190 ?auto_869196 ) ) ( not ( = ?auto_869190 ?auto_869197 ) ) ( not ( = ?auto_869190 ?auto_869198 ) ) ( not ( = ?auto_869191 ?auto_869192 ) ) ( not ( = ?auto_869191 ?auto_869193 ) ) ( not ( = ?auto_869191 ?auto_869194 ) ) ( not ( = ?auto_869191 ?auto_869195 ) ) ( not ( = ?auto_869191 ?auto_869196 ) ) ( not ( = ?auto_869191 ?auto_869197 ) ) ( not ( = ?auto_869191 ?auto_869198 ) ) ( not ( = ?auto_869192 ?auto_869193 ) ) ( not ( = ?auto_869192 ?auto_869194 ) ) ( not ( = ?auto_869192 ?auto_869195 ) ) ( not ( = ?auto_869192 ?auto_869196 ) ) ( not ( = ?auto_869192 ?auto_869197 ) ) ( not ( = ?auto_869192 ?auto_869198 ) ) ( not ( = ?auto_869193 ?auto_869194 ) ) ( not ( = ?auto_869193 ?auto_869195 ) ) ( not ( = ?auto_869193 ?auto_869196 ) ) ( not ( = ?auto_869193 ?auto_869197 ) ) ( not ( = ?auto_869193 ?auto_869198 ) ) ( not ( = ?auto_869194 ?auto_869195 ) ) ( not ( = ?auto_869194 ?auto_869196 ) ) ( not ( = ?auto_869194 ?auto_869197 ) ) ( not ( = ?auto_869194 ?auto_869198 ) ) ( not ( = ?auto_869195 ?auto_869196 ) ) ( not ( = ?auto_869195 ?auto_869197 ) ) ( not ( = ?auto_869195 ?auto_869198 ) ) ( not ( = ?auto_869196 ?auto_869197 ) ) ( not ( = ?auto_869196 ?auto_869198 ) ) ( not ( = ?auto_869197 ?auto_869198 ) ) ( CLEAR ?auto_869195 ) ( ON ?auto_869196 ?auto_869197 ) ( CLEAR ?auto_869196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_869181 ?auto_869182 ?auto_869183 ?auto_869184 ?auto_869185 ?auto_869186 ?auto_869187 ?auto_869188 ?auto_869189 ?auto_869190 ?auto_869191 ?auto_869192 ?auto_869193 ?auto_869194 ?auto_869195 ?auto_869196 )
      ( MAKE-17PILE ?auto_869181 ?auto_869182 ?auto_869183 ?auto_869184 ?auto_869185 ?auto_869186 ?auto_869187 ?auto_869188 ?auto_869189 ?auto_869190 ?auto_869191 ?auto_869192 ?auto_869193 ?auto_869194 ?auto_869195 ?auto_869196 ?auto_869197 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869251 - BLOCK
      ?auto_869252 - BLOCK
      ?auto_869253 - BLOCK
      ?auto_869254 - BLOCK
      ?auto_869255 - BLOCK
      ?auto_869256 - BLOCK
      ?auto_869257 - BLOCK
      ?auto_869258 - BLOCK
      ?auto_869259 - BLOCK
      ?auto_869260 - BLOCK
      ?auto_869261 - BLOCK
      ?auto_869262 - BLOCK
      ?auto_869263 - BLOCK
      ?auto_869264 - BLOCK
      ?auto_869265 - BLOCK
      ?auto_869266 - BLOCK
      ?auto_869267 - BLOCK
    )
    :vars
    (
      ?auto_869268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869267 ?auto_869268 ) ( ON-TABLE ?auto_869251 ) ( ON ?auto_869252 ?auto_869251 ) ( ON ?auto_869253 ?auto_869252 ) ( ON ?auto_869254 ?auto_869253 ) ( ON ?auto_869255 ?auto_869254 ) ( ON ?auto_869256 ?auto_869255 ) ( ON ?auto_869257 ?auto_869256 ) ( ON ?auto_869258 ?auto_869257 ) ( ON ?auto_869259 ?auto_869258 ) ( ON ?auto_869260 ?auto_869259 ) ( ON ?auto_869261 ?auto_869260 ) ( ON ?auto_869262 ?auto_869261 ) ( ON ?auto_869263 ?auto_869262 ) ( ON ?auto_869264 ?auto_869263 ) ( not ( = ?auto_869251 ?auto_869252 ) ) ( not ( = ?auto_869251 ?auto_869253 ) ) ( not ( = ?auto_869251 ?auto_869254 ) ) ( not ( = ?auto_869251 ?auto_869255 ) ) ( not ( = ?auto_869251 ?auto_869256 ) ) ( not ( = ?auto_869251 ?auto_869257 ) ) ( not ( = ?auto_869251 ?auto_869258 ) ) ( not ( = ?auto_869251 ?auto_869259 ) ) ( not ( = ?auto_869251 ?auto_869260 ) ) ( not ( = ?auto_869251 ?auto_869261 ) ) ( not ( = ?auto_869251 ?auto_869262 ) ) ( not ( = ?auto_869251 ?auto_869263 ) ) ( not ( = ?auto_869251 ?auto_869264 ) ) ( not ( = ?auto_869251 ?auto_869265 ) ) ( not ( = ?auto_869251 ?auto_869266 ) ) ( not ( = ?auto_869251 ?auto_869267 ) ) ( not ( = ?auto_869251 ?auto_869268 ) ) ( not ( = ?auto_869252 ?auto_869253 ) ) ( not ( = ?auto_869252 ?auto_869254 ) ) ( not ( = ?auto_869252 ?auto_869255 ) ) ( not ( = ?auto_869252 ?auto_869256 ) ) ( not ( = ?auto_869252 ?auto_869257 ) ) ( not ( = ?auto_869252 ?auto_869258 ) ) ( not ( = ?auto_869252 ?auto_869259 ) ) ( not ( = ?auto_869252 ?auto_869260 ) ) ( not ( = ?auto_869252 ?auto_869261 ) ) ( not ( = ?auto_869252 ?auto_869262 ) ) ( not ( = ?auto_869252 ?auto_869263 ) ) ( not ( = ?auto_869252 ?auto_869264 ) ) ( not ( = ?auto_869252 ?auto_869265 ) ) ( not ( = ?auto_869252 ?auto_869266 ) ) ( not ( = ?auto_869252 ?auto_869267 ) ) ( not ( = ?auto_869252 ?auto_869268 ) ) ( not ( = ?auto_869253 ?auto_869254 ) ) ( not ( = ?auto_869253 ?auto_869255 ) ) ( not ( = ?auto_869253 ?auto_869256 ) ) ( not ( = ?auto_869253 ?auto_869257 ) ) ( not ( = ?auto_869253 ?auto_869258 ) ) ( not ( = ?auto_869253 ?auto_869259 ) ) ( not ( = ?auto_869253 ?auto_869260 ) ) ( not ( = ?auto_869253 ?auto_869261 ) ) ( not ( = ?auto_869253 ?auto_869262 ) ) ( not ( = ?auto_869253 ?auto_869263 ) ) ( not ( = ?auto_869253 ?auto_869264 ) ) ( not ( = ?auto_869253 ?auto_869265 ) ) ( not ( = ?auto_869253 ?auto_869266 ) ) ( not ( = ?auto_869253 ?auto_869267 ) ) ( not ( = ?auto_869253 ?auto_869268 ) ) ( not ( = ?auto_869254 ?auto_869255 ) ) ( not ( = ?auto_869254 ?auto_869256 ) ) ( not ( = ?auto_869254 ?auto_869257 ) ) ( not ( = ?auto_869254 ?auto_869258 ) ) ( not ( = ?auto_869254 ?auto_869259 ) ) ( not ( = ?auto_869254 ?auto_869260 ) ) ( not ( = ?auto_869254 ?auto_869261 ) ) ( not ( = ?auto_869254 ?auto_869262 ) ) ( not ( = ?auto_869254 ?auto_869263 ) ) ( not ( = ?auto_869254 ?auto_869264 ) ) ( not ( = ?auto_869254 ?auto_869265 ) ) ( not ( = ?auto_869254 ?auto_869266 ) ) ( not ( = ?auto_869254 ?auto_869267 ) ) ( not ( = ?auto_869254 ?auto_869268 ) ) ( not ( = ?auto_869255 ?auto_869256 ) ) ( not ( = ?auto_869255 ?auto_869257 ) ) ( not ( = ?auto_869255 ?auto_869258 ) ) ( not ( = ?auto_869255 ?auto_869259 ) ) ( not ( = ?auto_869255 ?auto_869260 ) ) ( not ( = ?auto_869255 ?auto_869261 ) ) ( not ( = ?auto_869255 ?auto_869262 ) ) ( not ( = ?auto_869255 ?auto_869263 ) ) ( not ( = ?auto_869255 ?auto_869264 ) ) ( not ( = ?auto_869255 ?auto_869265 ) ) ( not ( = ?auto_869255 ?auto_869266 ) ) ( not ( = ?auto_869255 ?auto_869267 ) ) ( not ( = ?auto_869255 ?auto_869268 ) ) ( not ( = ?auto_869256 ?auto_869257 ) ) ( not ( = ?auto_869256 ?auto_869258 ) ) ( not ( = ?auto_869256 ?auto_869259 ) ) ( not ( = ?auto_869256 ?auto_869260 ) ) ( not ( = ?auto_869256 ?auto_869261 ) ) ( not ( = ?auto_869256 ?auto_869262 ) ) ( not ( = ?auto_869256 ?auto_869263 ) ) ( not ( = ?auto_869256 ?auto_869264 ) ) ( not ( = ?auto_869256 ?auto_869265 ) ) ( not ( = ?auto_869256 ?auto_869266 ) ) ( not ( = ?auto_869256 ?auto_869267 ) ) ( not ( = ?auto_869256 ?auto_869268 ) ) ( not ( = ?auto_869257 ?auto_869258 ) ) ( not ( = ?auto_869257 ?auto_869259 ) ) ( not ( = ?auto_869257 ?auto_869260 ) ) ( not ( = ?auto_869257 ?auto_869261 ) ) ( not ( = ?auto_869257 ?auto_869262 ) ) ( not ( = ?auto_869257 ?auto_869263 ) ) ( not ( = ?auto_869257 ?auto_869264 ) ) ( not ( = ?auto_869257 ?auto_869265 ) ) ( not ( = ?auto_869257 ?auto_869266 ) ) ( not ( = ?auto_869257 ?auto_869267 ) ) ( not ( = ?auto_869257 ?auto_869268 ) ) ( not ( = ?auto_869258 ?auto_869259 ) ) ( not ( = ?auto_869258 ?auto_869260 ) ) ( not ( = ?auto_869258 ?auto_869261 ) ) ( not ( = ?auto_869258 ?auto_869262 ) ) ( not ( = ?auto_869258 ?auto_869263 ) ) ( not ( = ?auto_869258 ?auto_869264 ) ) ( not ( = ?auto_869258 ?auto_869265 ) ) ( not ( = ?auto_869258 ?auto_869266 ) ) ( not ( = ?auto_869258 ?auto_869267 ) ) ( not ( = ?auto_869258 ?auto_869268 ) ) ( not ( = ?auto_869259 ?auto_869260 ) ) ( not ( = ?auto_869259 ?auto_869261 ) ) ( not ( = ?auto_869259 ?auto_869262 ) ) ( not ( = ?auto_869259 ?auto_869263 ) ) ( not ( = ?auto_869259 ?auto_869264 ) ) ( not ( = ?auto_869259 ?auto_869265 ) ) ( not ( = ?auto_869259 ?auto_869266 ) ) ( not ( = ?auto_869259 ?auto_869267 ) ) ( not ( = ?auto_869259 ?auto_869268 ) ) ( not ( = ?auto_869260 ?auto_869261 ) ) ( not ( = ?auto_869260 ?auto_869262 ) ) ( not ( = ?auto_869260 ?auto_869263 ) ) ( not ( = ?auto_869260 ?auto_869264 ) ) ( not ( = ?auto_869260 ?auto_869265 ) ) ( not ( = ?auto_869260 ?auto_869266 ) ) ( not ( = ?auto_869260 ?auto_869267 ) ) ( not ( = ?auto_869260 ?auto_869268 ) ) ( not ( = ?auto_869261 ?auto_869262 ) ) ( not ( = ?auto_869261 ?auto_869263 ) ) ( not ( = ?auto_869261 ?auto_869264 ) ) ( not ( = ?auto_869261 ?auto_869265 ) ) ( not ( = ?auto_869261 ?auto_869266 ) ) ( not ( = ?auto_869261 ?auto_869267 ) ) ( not ( = ?auto_869261 ?auto_869268 ) ) ( not ( = ?auto_869262 ?auto_869263 ) ) ( not ( = ?auto_869262 ?auto_869264 ) ) ( not ( = ?auto_869262 ?auto_869265 ) ) ( not ( = ?auto_869262 ?auto_869266 ) ) ( not ( = ?auto_869262 ?auto_869267 ) ) ( not ( = ?auto_869262 ?auto_869268 ) ) ( not ( = ?auto_869263 ?auto_869264 ) ) ( not ( = ?auto_869263 ?auto_869265 ) ) ( not ( = ?auto_869263 ?auto_869266 ) ) ( not ( = ?auto_869263 ?auto_869267 ) ) ( not ( = ?auto_869263 ?auto_869268 ) ) ( not ( = ?auto_869264 ?auto_869265 ) ) ( not ( = ?auto_869264 ?auto_869266 ) ) ( not ( = ?auto_869264 ?auto_869267 ) ) ( not ( = ?auto_869264 ?auto_869268 ) ) ( not ( = ?auto_869265 ?auto_869266 ) ) ( not ( = ?auto_869265 ?auto_869267 ) ) ( not ( = ?auto_869265 ?auto_869268 ) ) ( not ( = ?auto_869266 ?auto_869267 ) ) ( not ( = ?auto_869266 ?auto_869268 ) ) ( not ( = ?auto_869267 ?auto_869268 ) ) ( ON ?auto_869266 ?auto_869267 ) ( CLEAR ?auto_869264 ) ( ON ?auto_869265 ?auto_869266 ) ( CLEAR ?auto_869265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_869251 ?auto_869252 ?auto_869253 ?auto_869254 ?auto_869255 ?auto_869256 ?auto_869257 ?auto_869258 ?auto_869259 ?auto_869260 ?auto_869261 ?auto_869262 ?auto_869263 ?auto_869264 ?auto_869265 )
      ( MAKE-17PILE ?auto_869251 ?auto_869252 ?auto_869253 ?auto_869254 ?auto_869255 ?auto_869256 ?auto_869257 ?auto_869258 ?auto_869259 ?auto_869260 ?auto_869261 ?auto_869262 ?auto_869263 ?auto_869264 ?auto_869265 ?auto_869266 ?auto_869267 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869321 - BLOCK
      ?auto_869322 - BLOCK
      ?auto_869323 - BLOCK
      ?auto_869324 - BLOCK
      ?auto_869325 - BLOCK
      ?auto_869326 - BLOCK
      ?auto_869327 - BLOCK
      ?auto_869328 - BLOCK
      ?auto_869329 - BLOCK
      ?auto_869330 - BLOCK
      ?auto_869331 - BLOCK
      ?auto_869332 - BLOCK
      ?auto_869333 - BLOCK
      ?auto_869334 - BLOCK
      ?auto_869335 - BLOCK
      ?auto_869336 - BLOCK
      ?auto_869337 - BLOCK
    )
    :vars
    (
      ?auto_869338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869337 ?auto_869338 ) ( ON-TABLE ?auto_869321 ) ( ON ?auto_869322 ?auto_869321 ) ( ON ?auto_869323 ?auto_869322 ) ( ON ?auto_869324 ?auto_869323 ) ( ON ?auto_869325 ?auto_869324 ) ( ON ?auto_869326 ?auto_869325 ) ( ON ?auto_869327 ?auto_869326 ) ( ON ?auto_869328 ?auto_869327 ) ( ON ?auto_869329 ?auto_869328 ) ( ON ?auto_869330 ?auto_869329 ) ( ON ?auto_869331 ?auto_869330 ) ( ON ?auto_869332 ?auto_869331 ) ( ON ?auto_869333 ?auto_869332 ) ( not ( = ?auto_869321 ?auto_869322 ) ) ( not ( = ?auto_869321 ?auto_869323 ) ) ( not ( = ?auto_869321 ?auto_869324 ) ) ( not ( = ?auto_869321 ?auto_869325 ) ) ( not ( = ?auto_869321 ?auto_869326 ) ) ( not ( = ?auto_869321 ?auto_869327 ) ) ( not ( = ?auto_869321 ?auto_869328 ) ) ( not ( = ?auto_869321 ?auto_869329 ) ) ( not ( = ?auto_869321 ?auto_869330 ) ) ( not ( = ?auto_869321 ?auto_869331 ) ) ( not ( = ?auto_869321 ?auto_869332 ) ) ( not ( = ?auto_869321 ?auto_869333 ) ) ( not ( = ?auto_869321 ?auto_869334 ) ) ( not ( = ?auto_869321 ?auto_869335 ) ) ( not ( = ?auto_869321 ?auto_869336 ) ) ( not ( = ?auto_869321 ?auto_869337 ) ) ( not ( = ?auto_869321 ?auto_869338 ) ) ( not ( = ?auto_869322 ?auto_869323 ) ) ( not ( = ?auto_869322 ?auto_869324 ) ) ( not ( = ?auto_869322 ?auto_869325 ) ) ( not ( = ?auto_869322 ?auto_869326 ) ) ( not ( = ?auto_869322 ?auto_869327 ) ) ( not ( = ?auto_869322 ?auto_869328 ) ) ( not ( = ?auto_869322 ?auto_869329 ) ) ( not ( = ?auto_869322 ?auto_869330 ) ) ( not ( = ?auto_869322 ?auto_869331 ) ) ( not ( = ?auto_869322 ?auto_869332 ) ) ( not ( = ?auto_869322 ?auto_869333 ) ) ( not ( = ?auto_869322 ?auto_869334 ) ) ( not ( = ?auto_869322 ?auto_869335 ) ) ( not ( = ?auto_869322 ?auto_869336 ) ) ( not ( = ?auto_869322 ?auto_869337 ) ) ( not ( = ?auto_869322 ?auto_869338 ) ) ( not ( = ?auto_869323 ?auto_869324 ) ) ( not ( = ?auto_869323 ?auto_869325 ) ) ( not ( = ?auto_869323 ?auto_869326 ) ) ( not ( = ?auto_869323 ?auto_869327 ) ) ( not ( = ?auto_869323 ?auto_869328 ) ) ( not ( = ?auto_869323 ?auto_869329 ) ) ( not ( = ?auto_869323 ?auto_869330 ) ) ( not ( = ?auto_869323 ?auto_869331 ) ) ( not ( = ?auto_869323 ?auto_869332 ) ) ( not ( = ?auto_869323 ?auto_869333 ) ) ( not ( = ?auto_869323 ?auto_869334 ) ) ( not ( = ?auto_869323 ?auto_869335 ) ) ( not ( = ?auto_869323 ?auto_869336 ) ) ( not ( = ?auto_869323 ?auto_869337 ) ) ( not ( = ?auto_869323 ?auto_869338 ) ) ( not ( = ?auto_869324 ?auto_869325 ) ) ( not ( = ?auto_869324 ?auto_869326 ) ) ( not ( = ?auto_869324 ?auto_869327 ) ) ( not ( = ?auto_869324 ?auto_869328 ) ) ( not ( = ?auto_869324 ?auto_869329 ) ) ( not ( = ?auto_869324 ?auto_869330 ) ) ( not ( = ?auto_869324 ?auto_869331 ) ) ( not ( = ?auto_869324 ?auto_869332 ) ) ( not ( = ?auto_869324 ?auto_869333 ) ) ( not ( = ?auto_869324 ?auto_869334 ) ) ( not ( = ?auto_869324 ?auto_869335 ) ) ( not ( = ?auto_869324 ?auto_869336 ) ) ( not ( = ?auto_869324 ?auto_869337 ) ) ( not ( = ?auto_869324 ?auto_869338 ) ) ( not ( = ?auto_869325 ?auto_869326 ) ) ( not ( = ?auto_869325 ?auto_869327 ) ) ( not ( = ?auto_869325 ?auto_869328 ) ) ( not ( = ?auto_869325 ?auto_869329 ) ) ( not ( = ?auto_869325 ?auto_869330 ) ) ( not ( = ?auto_869325 ?auto_869331 ) ) ( not ( = ?auto_869325 ?auto_869332 ) ) ( not ( = ?auto_869325 ?auto_869333 ) ) ( not ( = ?auto_869325 ?auto_869334 ) ) ( not ( = ?auto_869325 ?auto_869335 ) ) ( not ( = ?auto_869325 ?auto_869336 ) ) ( not ( = ?auto_869325 ?auto_869337 ) ) ( not ( = ?auto_869325 ?auto_869338 ) ) ( not ( = ?auto_869326 ?auto_869327 ) ) ( not ( = ?auto_869326 ?auto_869328 ) ) ( not ( = ?auto_869326 ?auto_869329 ) ) ( not ( = ?auto_869326 ?auto_869330 ) ) ( not ( = ?auto_869326 ?auto_869331 ) ) ( not ( = ?auto_869326 ?auto_869332 ) ) ( not ( = ?auto_869326 ?auto_869333 ) ) ( not ( = ?auto_869326 ?auto_869334 ) ) ( not ( = ?auto_869326 ?auto_869335 ) ) ( not ( = ?auto_869326 ?auto_869336 ) ) ( not ( = ?auto_869326 ?auto_869337 ) ) ( not ( = ?auto_869326 ?auto_869338 ) ) ( not ( = ?auto_869327 ?auto_869328 ) ) ( not ( = ?auto_869327 ?auto_869329 ) ) ( not ( = ?auto_869327 ?auto_869330 ) ) ( not ( = ?auto_869327 ?auto_869331 ) ) ( not ( = ?auto_869327 ?auto_869332 ) ) ( not ( = ?auto_869327 ?auto_869333 ) ) ( not ( = ?auto_869327 ?auto_869334 ) ) ( not ( = ?auto_869327 ?auto_869335 ) ) ( not ( = ?auto_869327 ?auto_869336 ) ) ( not ( = ?auto_869327 ?auto_869337 ) ) ( not ( = ?auto_869327 ?auto_869338 ) ) ( not ( = ?auto_869328 ?auto_869329 ) ) ( not ( = ?auto_869328 ?auto_869330 ) ) ( not ( = ?auto_869328 ?auto_869331 ) ) ( not ( = ?auto_869328 ?auto_869332 ) ) ( not ( = ?auto_869328 ?auto_869333 ) ) ( not ( = ?auto_869328 ?auto_869334 ) ) ( not ( = ?auto_869328 ?auto_869335 ) ) ( not ( = ?auto_869328 ?auto_869336 ) ) ( not ( = ?auto_869328 ?auto_869337 ) ) ( not ( = ?auto_869328 ?auto_869338 ) ) ( not ( = ?auto_869329 ?auto_869330 ) ) ( not ( = ?auto_869329 ?auto_869331 ) ) ( not ( = ?auto_869329 ?auto_869332 ) ) ( not ( = ?auto_869329 ?auto_869333 ) ) ( not ( = ?auto_869329 ?auto_869334 ) ) ( not ( = ?auto_869329 ?auto_869335 ) ) ( not ( = ?auto_869329 ?auto_869336 ) ) ( not ( = ?auto_869329 ?auto_869337 ) ) ( not ( = ?auto_869329 ?auto_869338 ) ) ( not ( = ?auto_869330 ?auto_869331 ) ) ( not ( = ?auto_869330 ?auto_869332 ) ) ( not ( = ?auto_869330 ?auto_869333 ) ) ( not ( = ?auto_869330 ?auto_869334 ) ) ( not ( = ?auto_869330 ?auto_869335 ) ) ( not ( = ?auto_869330 ?auto_869336 ) ) ( not ( = ?auto_869330 ?auto_869337 ) ) ( not ( = ?auto_869330 ?auto_869338 ) ) ( not ( = ?auto_869331 ?auto_869332 ) ) ( not ( = ?auto_869331 ?auto_869333 ) ) ( not ( = ?auto_869331 ?auto_869334 ) ) ( not ( = ?auto_869331 ?auto_869335 ) ) ( not ( = ?auto_869331 ?auto_869336 ) ) ( not ( = ?auto_869331 ?auto_869337 ) ) ( not ( = ?auto_869331 ?auto_869338 ) ) ( not ( = ?auto_869332 ?auto_869333 ) ) ( not ( = ?auto_869332 ?auto_869334 ) ) ( not ( = ?auto_869332 ?auto_869335 ) ) ( not ( = ?auto_869332 ?auto_869336 ) ) ( not ( = ?auto_869332 ?auto_869337 ) ) ( not ( = ?auto_869332 ?auto_869338 ) ) ( not ( = ?auto_869333 ?auto_869334 ) ) ( not ( = ?auto_869333 ?auto_869335 ) ) ( not ( = ?auto_869333 ?auto_869336 ) ) ( not ( = ?auto_869333 ?auto_869337 ) ) ( not ( = ?auto_869333 ?auto_869338 ) ) ( not ( = ?auto_869334 ?auto_869335 ) ) ( not ( = ?auto_869334 ?auto_869336 ) ) ( not ( = ?auto_869334 ?auto_869337 ) ) ( not ( = ?auto_869334 ?auto_869338 ) ) ( not ( = ?auto_869335 ?auto_869336 ) ) ( not ( = ?auto_869335 ?auto_869337 ) ) ( not ( = ?auto_869335 ?auto_869338 ) ) ( not ( = ?auto_869336 ?auto_869337 ) ) ( not ( = ?auto_869336 ?auto_869338 ) ) ( not ( = ?auto_869337 ?auto_869338 ) ) ( ON ?auto_869336 ?auto_869337 ) ( ON ?auto_869335 ?auto_869336 ) ( CLEAR ?auto_869333 ) ( ON ?auto_869334 ?auto_869335 ) ( CLEAR ?auto_869334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_869321 ?auto_869322 ?auto_869323 ?auto_869324 ?auto_869325 ?auto_869326 ?auto_869327 ?auto_869328 ?auto_869329 ?auto_869330 ?auto_869331 ?auto_869332 ?auto_869333 ?auto_869334 )
      ( MAKE-17PILE ?auto_869321 ?auto_869322 ?auto_869323 ?auto_869324 ?auto_869325 ?auto_869326 ?auto_869327 ?auto_869328 ?auto_869329 ?auto_869330 ?auto_869331 ?auto_869332 ?auto_869333 ?auto_869334 ?auto_869335 ?auto_869336 ?auto_869337 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869391 - BLOCK
      ?auto_869392 - BLOCK
      ?auto_869393 - BLOCK
      ?auto_869394 - BLOCK
      ?auto_869395 - BLOCK
      ?auto_869396 - BLOCK
      ?auto_869397 - BLOCK
      ?auto_869398 - BLOCK
      ?auto_869399 - BLOCK
      ?auto_869400 - BLOCK
      ?auto_869401 - BLOCK
      ?auto_869402 - BLOCK
      ?auto_869403 - BLOCK
      ?auto_869404 - BLOCK
      ?auto_869405 - BLOCK
      ?auto_869406 - BLOCK
      ?auto_869407 - BLOCK
    )
    :vars
    (
      ?auto_869408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869407 ?auto_869408 ) ( ON-TABLE ?auto_869391 ) ( ON ?auto_869392 ?auto_869391 ) ( ON ?auto_869393 ?auto_869392 ) ( ON ?auto_869394 ?auto_869393 ) ( ON ?auto_869395 ?auto_869394 ) ( ON ?auto_869396 ?auto_869395 ) ( ON ?auto_869397 ?auto_869396 ) ( ON ?auto_869398 ?auto_869397 ) ( ON ?auto_869399 ?auto_869398 ) ( ON ?auto_869400 ?auto_869399 ) ( ON ?auto_869401 ?auto_869400 ) ( ON ?auto_869402 ?auto_869401 ) ( not ( = ?auto_869391 ?auto_869392 ) ) ( not ( = ?auto_869391 ?auto_869393 ) ) ( not ( = ?auto_869391 ?auto_869394 ) ) ( not ( = ?auto_869391 ?auto_869395 ) ) ( not ( = ?auto_869391 ?auto_869396 ) ) ( not ( = ?auto_869391 ?auto_869397 ) ) ( not ( = ?auto_869391 ?auto_869398 ) ) ( not ( = ?auto_869391 ?auto_869399 ) ) ( not ( = ?auto_869391 ?auto_869400 ) ) ( not ( = ?auto_869391 ?auto_869401 ) ) ( not ( = ?auto_869391 ?auto_869402 ) ) ( not ( = ?auto_869391 ?auto_869403 ) ) ( not ( = ?auto_869391 ?auto_869404 ) ) ( not ( = ?auto_869391 ?auto_869405 ) ) ( not ( = ?auto_869391 ?auto_869406 ) ) ( not ( = ?auto_869391 ?auto_869407 ) ) ( not ( = ?auto_869391 ?auto_869408 ) ) ( not ( = ?auto_869392 ?auto_869393 ) ) ( not ( = ?auto_869392 ?auto_869394 ) ) ( not ( = ?auto_869392 ?auto_869395 ) ) ( not ( = ?auto_869392 ?auto_869396 ) ) ( not ( = ?auto_869392 ?auto_869397 ) ) ( not ( = ?auto_869392 ?auto_869398 ) ) ( not ( = ?auto_869392 ?auto_869399 ) ) ( not ( = ?auto_869392 ?auto_869400 ) ) ( not ( = ?auto_869392 ?auto_869401 ) ) ( not ( = ?auto_869392 ?auto_869402 ) ) ( not ( = ?auto_869392 ?auto_869403 ) ) ( not ( = ?auto_869392 ?auto_869404 ) ) ( not ( = ?auto_869392 ?auto_869405 ) ) ( not ( = ?auto_869392 ?auto_869406 ) ) ( not ( = ?auto_869392 ?auto_869407 ) ) ( not ( = ?auto_869392 ?auto_869408 ) ) ( not ( = ?auto_869393 ?auto_869394 ) ) ( not ( = ?auto_869393 ?auto_869395 ) ) ( not ( = ?auto_869393 ?auto_869396 ) ) ( not ( = ?auto_869393 ?auto_869397 ) ) ( not ( = ?auto_869393 ?auto_869398 ) ) ( not ( = ?auto_869393 ?auto_869399 ) ) ( not ( = ?auto_869393 ?auto_869400 ) ) ( not ( = ?auto_869393 ?auto_869401 ) ) ( not ( = ?auto_869393 ?auto_869402 ) ) ( not ( = ?auto_869393 ?auto_869403 ) ) ( not ( = ?auto_869393 ?auto_869404 ) ) ( not ( = ?auto_869393 ?auto_869405 ) ) ( not ( = ?auto_869393 ?auto_869406 ) ) ( not ( = ?auto_869393 ?auto_869407 ) ) ( not ( = ?auto_869393 ?auto_869408 ) ) ( not ( = ?auto_869394 ?auto_869395 ) ) ( not ( = ?auto_869394 ?auto_869396 ) ) ( not ( = ?auto_869394 ?auto_869397 ) ) ( not ( = ?auto_869394 ?auto_869398 ) ) ( not ( = ?auto_869394 ?auto_869399 ) ) ( not ( = ?auto_869394 ?auto_869400 ) ) ( not ( = ?auto_869394 ?auto_869401 ) ) ( not ( = ?auto_869394 ?auto_869402 ) ) ( not ( = ?auto_869394 ?auto_869403 ) ) ( not ( = ?auto_869394 ?auto_869404 ) ) ( not ( = ?auto_869394 ?auto_869405 ) ) ( not ( = ?auto_869394 ?auto_869406 ) ) ( not ( = ?auto_869394 ?auto_869407 ) ) ( not ( = ?auto_869394 ?auto_869408 ) ) ( not ( = ?auto_869395 ?auto_869396 ) ) ( not ( = ?auto_869395 ?auto_869397 ) ) ( not ( = ?auto_869395 ?auto_869398 ) ) ( not ( = ?auto_869395 ?auto_869399 ) ) ( not ( = ?auto_869395 ?auto_869400 ) ) ( not ( = ?auto_869395 ?auto_869401 ) ) ( not ( = ?auto_869395 ?auto_869402 ) ) ( not ( = ?auto_869395 ?auto_869403 ) ) ( not ( = ?auto_869395 ?auto_869404 ) ) ( not ( = ?auto_869395 ?auto_869405 ) ) ( not ( = ?auto_869395 ?auto_869406 ) ) ( not ( = ?auto_869395 ?auto_869407 ) ) ( not ( = ?auto_869395 ?auto_869408 ) ) ( not ( = ?auto_869396 ?auto_869397 ) ) ( not ( = ?auto_869396 ?auto_869398 ) ) ( not ( = ?auto_869396 ?auto_869399 ) ) ( not ( = ?auto_869396 ?auto_869400 ) ) ( not ( = ?auto_869396 ?auto_869401 ) ) ( not ( = ?auto_869396 ?auto_869402 ) ) ( not ( = ?auto_869396 ?auto_869403 ) ) ( not ( = ?auto_869396 ?auto_869404 ) ) ( not ( = ?auto_869396 ?auto_869405 ) ) ( not ( = ?auto_869396 ?auto_869406 ) ) ( not ( = ?auto_869396 ?auto_869407 ) ) ( not ( = ?auto_869396 ?auto_869408 ) ) ( not ( = ?auto_869397 ?auto_869398 ) ) ( not ( = ?auto_869397 ?auto_869399 ) ) ( not ( = ?auto_869397 ?auto_869400 ) ) ( not ( = ?auto_869397 ?auto_869401 ) ) ( not ( = ?auto_869397 ?auto_869402 ) ) ( not ( = ?auto_869397 ?auto_869403 ) ) ( not ( = ?auto_869397 ?auto_869404 ) ) ( not ( = ?auto_869397 ?auto_869405 ) ) ( not ( = ?auto_869397 ?auto_869406 ) ) ( not ( = ?auto_869397 ?auto_869407 ) ) ( not ( = ?auto_869397 ?auto_869408 ) ) ( not ( = ?auto_869398 ?auto_869399 ) ) ( not ( = ?auto_869398 ?auto_869400 ) ) ( not ( = ?auto_869398 ?auto_869401 ) ) ( not ( = ?auto_869398 ?auto_869402 ) ) ( not ( = ?auto_869398 ?auto_869403 ) ) ( not ( = ?auto_869398 ?auto_869404 ) ) ( not ( = ?auto_869398 ?auto_869405 ) ) ( not ( = ?auto_869398 ?auto_869406 ) ) ( not ( = ?auto_869398 ?auto_869407 ) ) ( not ( = ?auto_869398 ?auto_869408 ) ) ( not ( = ?auto_869399 ?auto_869400 ) ) ( not ( = ?auto_869399 ?auto_869401 ) ) ( not ( = ?auto_869399 ?auto_869402 ) ) ( not ( = ?auto_869399 ?auto_869403 ) ) ( not ( = ?auto_869399 ?auto_869404 ) ) ( not ( = ?auto_869399 ?auto_869405 ) ) ( not ( = ?auto_869399 ?auto_869406 ) ) ( not ( = ?auto_869399 ?auto_869407 ) ) ( not ( = ?auto_869399 ?auto_869408 ) ) ( not ( = ?auto_869400 ?auto_869401 ) ) ( not ( = ?auto_869400 ?auto_869402 ) ) ( not ( = ?auto_869400 ?auto_869403 ) ) ( not ( = ?auto_869400 ?auto_869404 ) ) ( not ( = ?auto_869400 ?auto_869405 ) ) ( not ( = ?auto_869400 ?auto_869406 ) ) ( not ( = ?auto_869400 ?auto_869407 ) ) ( not ( = ?auto_869400 ?auto_869408 ) ) ( not ( = ?auto_869401 ?auto_869402 ) ) ( not ( = ?auto_869401 ?auto_869403 ) ) ( not ( = ?auto_869401 ?auto_869404 ) ) ( not ( = ?auto_869401 ?auto_869405 ) ) ( not ( = ?auto_869401 ?auto_869406 ) ) ( not ( = ?auto_869401 ?auto_869407 ) ) ( not ( = ?auto_869401 ?auto_869408 ) ) ( not ( = ?auto_869402 ?auto_869403 ) ) ( not ( = ?auto_869402 ?auto_869404 ) ) ( not ( = ?auto_869402 ?auto_869405 ) ) ( not ( = ?auto_869402 ?auto_869406 ) ) ( not ( = ?auto_869402 ?auto_869407 ) ) ( not ( = ?auto_869402 ?auto_869408 ) ) ( not ( = ?auto_869403 ?auto_869404 ) ) ( not ( = ?auto_869403 ?auto_869405 ) ) ( not ( = ?auto_869403 ?auto_869406 ) ) ( not ( = ?auto_869403 ?auto_869407 ) ) ( not ( = ?auto_869403 ?auto_869408 ) ) ( not ( = ?auto_869404 ?auto_869405 ) ) ( not ( = ?auto_869404 ?auto_869406 ) ) ( not ( = ?auto_869404 ?auto_869407 ) ) ( not ( = ?auto_869404 ?auto_869408 ) ) ( not ( = ?auto_869405 ?auto_869406 ) ) ( not ( = ?auto_869405 ?auto_869407 ) ) ( not ( = ?auto_869405 ?auto_869408 ) ) ( not ( = ?auto_869406 ?auto_869407 ) ) ( not ( = ?auto_869406 ?auto_869408 ) ) ( not ( = ?auto_869407 ?auto_869408 ) ) ( ON ?auto_869406 ?auto_869407 ) ( ON ?auto_869405 ?auto_869406 ) ( ON ?auto_869404 ?auto_869405 ) ( CLEAR ?auto_869402 ) ( ON ?auto_869403 ?auto_869404 ) ( CLEAR ?auto_869403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_869391 ?auto_869392 ?auto_869393 ?auto_869394 ?auto_869395 ?auto_869396 ?auto_869397 ?auto_869398 ?auto_869399 ?auto_869400 ?auto_869401 ?auto_869402 ?auto_869403 )
      ( MAKE-17PILE ?auto_869391 ?auto_869392 ?auto_869393 ?auto_869394 ?auto_869395 ?auto_869396 ?auto_869397 ?auto_869398 ?auto_869399 ?auto_869400 ?auto_869401 ?auto_869402 ?auto_869403 ?auto_869404 ?auto_869405 ?auto_869406 ?auto_869407 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869461 - BLOCK
      ?auto_869462 - BLOCK
      ?auto_869463 - BLOCK
      ?auto_869464 - BLOCK
      ?auto_869465 - BLOCK
      ?auto_869466 - BLOCK
      ?auto_869467 - BLOCK
      ?auto_869468 - BLOCK
      ?auto_869469 - BLOCK
      ?auto_869470 - BLOCK
      ?auto_869471 - BLOCK
      ?auto_869472 - BLOCK
      ?auto_869473 - BLOCK
      ?auto_869474 - BLOCK
      ?auto_869475 - BLOCK
      ?auto_869476 - BLOCK
      ?auto_869477 - BLOCK
    )
    :vars
    (
      ?auto_869478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869477 ?auto_869478 ) ( ON-TABLE ?auto_869461 ) ( ON ?auto_869462 ?auto_869461 ) ( ON ?auto_869463 ?auto_869462 ) ( ON ?auto_869464 ?auto_869463 ) ( ON ?auto_869465 ?auto_869464 ) ( ON ?auto_869466 ?auto_869465 ) ( ON ?auto_869467 ?auto_869466 ) ( ON ?auto_869468 ?auto_869467 ) ( ON ?auto_869469 ?auto_869468 ) ( ON ?auto_869470 ?auto_869469 ) ( ON ?auto_869471 ?auto_869470 ) ( not ( = ?auto_869461 ?auto_869462 ) ) ( not ( = ?auto_869461 ?auto_869463 ) ) ( not ( = ?auto_869461 ?auto_869464 ) ) ( not ( = ?auto_869461 ?auto_869465 ) ) ( not ( = ?auto_869461 ?auto_869466 ) ) ( not ( = ?auto_869461 ?auto_869467 ) ) ( not ( = ?auto_869461 ?auto_869468 ) ) ( not ( = ?auto_869461 ?auto_869469 ) ) ( not ( = ?auto_869461 ?auto_869470 ) ) ( not ( = ?auto_869461 ?auto_869471 ) ) ( not ( = ?auto_869461 ?auto_869472 ) ) ( not ( = ?auto_869461 ?auto_869473 ) ) ( not ( = ?auto_869461 ?auto_869474 ) ) ( not ( = ?auto_869461 ?auto_869475 ) ) ( not ( = ?auto_869461 ?auto_869476 ) ) ( not ( = ?auto_869461 ?auto_869477 ) ) ( not ( = ?auto_869461 ?auto_869478 ) ) ( not ( = ?auto_869462 ?auto_869463 ) ) ( not ( = ?auto_869462 ?auto_869464 ) ) ( not ( = ?auto_869462 ?auto_869465 ) ) ( not ( = ?auto_869462 ?auto_869466 ) ) ( not ( = ?auto_869462 ?auto_869467 ) ) ( not ( = ?auto_869462 ?auto_869468 ) ) ( not ( = ?auto_869462 ?auto_869469 ) ) ( not ( = ?auto_869462 ?auto_869470 ) ) ( not ( = ?auto_869462 ?auto_869471 ) ) ( not ( = ?auto_869462 ?auto_869472 ) ) ( not ( = ?auto_869462 ?auto_869473 ) ) ( not ( = ?auto_869462 ?auto_869474 ) ) ( not ( = ?auto_869462 ?auto_869475 ) ) ( not ( = ?auto_869462 ?auto_869476 ) ) ( not ( = ?auto_869462 ?auto_869477 ) ) ( not ( = ?auto_869462 ?auto_869478 ) ) ( not ( = ?auto_869463 ?auto_869464 ) ) ( not ( = ?auto_869463 ?auto_869465 ) ) ( not ( = ?auto_869463 ?auto_869466 ) ) ( not ( = ?auto_869463 ?auto_869467 ) ) ( not ( = ?auto_869463 ?auto_869468 ) ) ( not ( = ?auto_869463 ?auto_869469 ) ) ( not ( = ?auto_869463 ?auto_869470 ) ) ( not ( = ?auto_869463 ?auto_869471 ) ) ( not ( = ?auto_869463 ?auto_869472 ) ) ( not ( = ?auto_869463 ?auto_869473 ) ) ( not ( = ?auto_869463 ?auto_869474 ) ) ( not ( = ?auto_869463 ?auto_869475 ) ) ( not ( = ?auto_869463 ?auto_869476 ) ) ( not ( = ?auto_869463 ?auto_869477 ) ) ( not ( = ?auto_869463 ?auto_869478 ) ) ( not ( = ?auto_869464 ?auto_869465 ) ) ( not ( = ?auto_869464 ?auto_869466 ) ) ( not ( = ?auto_869464 ?auto_869467 ) ) ( not ( = ?auto_869464 ?auto_869468 ) ) ( not ( = ?auto_869464 ?auto_869469 ) ) ( not ( = ?auto_869464 ?auto_869470 ) ) ( not ( = ?auto_869464 ?auto_869471 ) ) ( not ( = ?auto_869464 ?auto_869472 ) ) ( not ( = ?auto_869464 ?auto_869473 ) ) ( not ( = ?auto_869464 ?auto_869474 ) ) ( not ( = ?auto_869464 ?auto_869475 ) ) ( not ( = ?auto_869464 ?auto_869476 ) ) ( not ( = ?auto_869464 ?auto_869477 ) ) ( not ( = ?auto_869464 ?auto_869478 ) ) ( not ( = ?auto_869465 ?auto_869466 ) ) ( not ( = ?auto_869465 ?auto_869467 ) ) ( not ( = ?auto_869465 ?auto_869468 ) ) ( not ( = ?auto_869465 ?auto_869469 ) ) ( not ( = ?auto_869465 ?auto_869470 ) ) ( not ( = ?auto_869465 ?auto_869471 ) ) ( not ( = ?auto_869465 ?auto_869472 ) ) ( not ( = ?auto_869465 ?auto_869473 ) ) ( not ( = ?auto_869465 ?auto_869474 ) ) ( not ( = ?auto_869465 ?auto_869475 ) ) ( not ( = ?auto_869465 ?auto_869476 ) ) ( not ( = ?auto_869465 ?auto_869477 ) ) ( not ( = ?auto_869465 ?auto_869478 ) ) ( not ( = ?auto_869466 ?auto_869467 ) ) ( not ( = ?auto_869466 ?auto_869468 ) ) ( not ( = ?auto_869466 ?auto_869469 ) ) ( not ( = ?auto_869466 ?auto_869470 ) ) ( not ( = ?auto_869466 ?auto_869471 ) ) ( not ( = ?auto_869466 ?auto_869472 ) ) ( not ( = ?auto_869466 ?auto_869473 ) ) ( not ( = ?auto_869466 ?auto_869474 ) ) ( not ( = ?auto_869466 ?auto_869475 ) ) ( not ( = ?auto_869466 ?auto_869476 ) ) ( not ( = ?auto_869466 ?auto_869477 ) ) ( not ( = ?auto_869466 ?auto_869478 ) ) ( not ( = ?auto_869467 ?auto_869468 ) ) ( not ( = ?auto_869467 ?auto_869469 ) ) ( not ( = ?auto_869467 ?auto_869470 ) ) ( not ( = ?auto_869467 ?auto_869471 ) ) ( not ( = ?auto_869467 ?auto_869472 ) ) ( not ( = ?auto_869467 ?auto_869473 ) ) ( not ( = ?auto_869467 ?auto_869474 ) ) ( not ( = ?auto_869467 ?auto_869475 ) ) ( not ( = ?auto_869467 ?auto_869476 ) ) ( not ( = ?auto_869467 ?auto_869477 ) ) ( not ( = ?auto_869467 ?auto_869478 ) ) ( not ( = ?auto_869468 ?auto_869469 ) ) ( not ( = ?auto_869468 ?auto_869470 ) ) ( not ( = ?auto_869468 ?auto_869471 ) ) ( not ( = ?auto_869468 ?auto_869472 ) ) ( not ( = ?auto_869468 ?auto_869473 ) ) ( not ( = ?auto_869468 ?auto_869474 ) ) ( not ( = ?auto_869468 ?auto_869475 ) ) ( not ( = ?auto_869468 ?auto_869476 ) ) ( not ( = ?auto_869468 ?auto_869477 ) ) ( not ( = ?auto_869468 ?auto_869478 ) ) ( not ( = ?auto_869469 ?auto_869470 ) ) ( not ( = ?auto_869469 ?auto_869471 ) ) ( not ( = ?auto_869469 ?auto_869472 ) ) ( not ( = ?auto_869469 ?auto_869473 ) ) ( not ( = ?auto_869469 ?auto_869474 ) ) ( not ( = ?auto_869469 ?auto_869475 ) ) ( not ( = ?auto_869469 ?auto_869476 ) ) ( not ( = ?auto_869469 ?auto_869477 ) ) ( not ( = ?auto_869469 ?auto_869478 ) ) ( not ( = ?auto_869470 ?auto_869471 ) ) ( not ( = ?auto_869470 ?auto_869472 ) ) ( not ( = ?auto_869470 ?auto_869473 ) ) ( not ( = ?auto_869470 ?auto_869474 ) ) ( not ( = ?auto_869470 ?auto_869475 ) ) ( not ( = ?auto_869470 ?auto_869476 ) ) ( not ( = ?auto_869470 ?auto_869477 ) ) ( not ( = ?auto_869470 ?auto_869478 ) ) ( not ( = ?auto_869471 ?auto_869472 ) ) ( not ( = ?auto_869471 ?auto_869473 ) ) ( not ( = ?auto_869471 ?auto_869474 ) ) ( not ( = ?auto_869471 ?auto_869475 ) ) ( not ( = ?auto_869471 ?auto_869476 ) ) ( not ( = ?auto_869471 ?auto_869477 ) ) ( not ( = ?auto_869471 ?auto_869478 ) ) ( not ( = ?auto_869472 ?auto_869473 ) ) ( not ( = ?auto_869472 ?auto_869474 ) ) ( not ( = ?auto_869472 ?auto_869475 ) ) ( not ( = ?auto_869472 ?auto_869476 ) ) ( not ( = ?auto_869472 ?auto_869477 ) ) ( not ( = ?auto_869472 ?auto_869478 ) ) ( not ( = ?auto_869473 ?auto_869474 ) ) ( not ( = ?auto_869473 ?auto_869475 ) ) ( not ( = ?auto_869473 ?auto_869476 ) ) ( not ( = ?auto_869473 ?auto_869477 ) ) ( not ( = ?auto_869473 ?auto_869478 ) ) ( not ( = ?auto_869474 ?auto_869475 ) ) ( not ( = ?auto_869474 ?auto_869476 ) ) ( not ( = ?auto_869474 ?auto_869477 ) ) ( not ( = ?auto_869474 ?auto_869478 ) ) ( not ( = ?auto_869475 ?auto_869476 ) ) ( not ( = ?auto_869475 ?auto_869477 ) ) ( not ( = ?auto_869475 ?auto_869478 ) ) ( not ( = ?auto_869476 ?auto_869477 ) ) ( not ( = ?auto_869476 ?auto_869478 ) ) ( not ( = ?auto_869477 ?auto_869478 ) ) ( ON ?auto_869476 ?auto_869477 ) ( ON ?auto_869475 ?auto_869476 ) ( ON ?auto_869474 ?auto_869475 ) ( ON ?auto_869473 ?auto_869474 ) ( CLEAR ?auto_869471 ) ( ON ?auto_869472 ?auto_869473 ) ( CLEAR ?auto_869472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_869461 ?auto_869462 ?auto_869463 ?auto_869464 ?auto_869465 ?auto_869466 ?auto_869467 ?auto_869468 ?auto_869469 ?auto_869470 ?auto_869471 ?auto_869472 )
      ( MAKE-17PILE ?auto_869461 ?auto_869462 ?auto_869463 ?auto_869464 ?auto_869465 ?auto_869466 ?auto_869467 ?auto_869468 ?auto_869469 ?auto_869470 ?auto_869471 ?auto_869472 ?auto_869473 ?auto_869474 ?auto_869475 ?auto_869476 ?auto_869477 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869531 - BLOCK
      ?auto_869532 - BLOCK
      ?auto_869533 - BLOCK
      ?auto_869534 - BLOCK
      ?auto_869535 - BLOCK
      ?auto_869536 - BLOCK
      ?auto_869537 - BLOCK
      ?auto_869538 - BLOCK
      ?auto_869539 - BLOCK
      ?auto_869540 - BLOCK
      ?auto_869541 - BLOCK
      ?auto_869542 - BLOCK
      ?auto_869543 - BLOCK
      ?auto_869544 - BLOCK
      ?auto_869545 - BLOCK
      ?auto_869546 - BLOCK
      ?auto_869547 - BLOCK
    )
    :vars
    (
      ?auto_869548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869547 ?auto_869548 ) ( ON-TABLE ?auto_869531 ) ( ON ?auto_869532 ?auto_869531 ) ( ON ?auto_869533 ?auto_869532 ) ( ON ?auto_869534 ?auto_869533 ) ( ON ?auto_869535 ?auto_869534 ) ( ON ?auto_869536 ?auto_869535 ) ( ON ?auto_869537 ?auto_869536 ) ( ON ?auto_869538 ?auto_869537 ) ( ON ?auto_869539 ?auto_869538 ) ( ON ?auto_869540 ?auto_869539 ) ( not ( = ?auto_869531 ?auto_869532 ) ) ( not ( = ?auto_869531 ?auto_869533 ) ) ( not ( = ?auto_869531 ?auto_869534 ) ) ( not ( = ?auto_869531 ?auto_869535 ) ) ( not ( = ?auto_869531 ?auto_869536 ) ) ( not ( = ?auto_869531 ?auto_869537 ) ) ( not ( = ?auto_869531 ?auto_869538 ) ) ( not ( = ?auto_869531 ?auto_869539 ) ) ( not ( = ?auto_869531 ?auto_869540 ) ) ( not ( = ?auto_869531 ?auto_869541 ) ) ( not ( = ?auto_869531 ?auto_869542 ) ) ( not ( = ?auto_869531 ?auto_869543 ) ) ( not ( = ?auto_869531 ?auto_869544 ) ) ( not ( = ?auto_869531 ?auto_869545 ) ) ( not ( = ?auto_869531 ?auto_869546 ) ) ( not ( = ?auto_869531 ?auto_869547 ) ) ( not ( = ?auto_869531 ?auto_869548 ) ) ( not ( = ?auto_869532 ?auto_869533 ) ) ( not ( = ?auto_869532 ?auto_869534 ) ) ( not ( = ?auto_869532 ?auto_869535 ) ) ( not ( = ?auto_869532 ?auto_869536 ) ) ( not ( = ?auto_869532 ?auto_869537 ) ) ( not ( = ?auto_869532 ?auto_869538 ) ) ( not ( = ?auto_869532 ?auto_869539 ) ) ( not ( = ?auto_869532 ?auto_869540 ) ) ( not ( = ?auto_869532 ?auto_869541 ) ) ( not ( = ?auto_869532 ?auto_869542 ) ) ( not ( = ?auto_869532 ?auto_869543 ) ) ( not ( = ?auto_869532 ?auto_869544 ) ) ( not ( = ?auto_869532 ?auto_869545 ) ) ( not ( = ?auto_869532 ?auto_869546 ) ) ( not ( = ?auto_869532 ?auto_869547 ) ) ( not ( = ?auto_869532 ?auto_869548 ) ) ( not ( = ?auto_869533 ?auto_869534 ) ) ( not ( = ?auto_869533 ?auto_869535 ) ) ( not ( = ?auto_869533 ?auto_869536 ) ) ( not ( = ?auto_869533 ?auto_869537 ) ) ( not ( = ?auto_869533 ?auto_869538 ) ) ( not ( = ?auto_869533 ?auto_869539 ) ) ( not ( = ?auto_869533 ?auto_869540 ) ) ( not ( = ?auto_869533 ?auto_869541 ) ) ( not ( = ?auto_869533 ?auto_869542 ) ) ( not ( = ?auto_869533 ?auto_869543 ) ) ( not ( = ?auto_869533 ?auto_869544 ) ) ( not ( = ?auto_869533 ?auto_869545 ) ) ( not ( = ?auto_869533 ?auto_869546 ) ) ( not ( = ?auto_869533 ?auto_869547 ) ) ( not ( = ?auto_869533 ?auto_869548 ) ) ( not ( = ?auto_869534 ?auto_869535 ) ) ( not ( = ?auto_869534 ?auto_869536 ) ) ( not ( = ?auto_869534 ?auto_869537 ) ) ( not ( = ?auto_869534 ?auto_869538 ) ) ( not ( = ?auto_869534 ?auto_869539 ) ) ( not ( = ?auto_869534 ?auto_869540 ) ) ( not ( = ?auto_869534 ?auto_869541 ) ) ( not ( = ?auto_869534 ?auto_869542 ) ) ( not ( = ?auto_869534 ?auto_869543 ) ) ( not ( = ?auto_869534 ?auto_869544 ) ) ( not ( = ?auto_869534 ?auto_869545 ) ) ( not ( = ?auto_869534 ?auto_869546 ) ) ( not ( = ?auto_869534 ?auto_869547 ) ) ( not ( = ?auto_869534 ?auto_869548 ) ) ( not ( = ?auto_869535 ?auto_869536 ) ) ( not ( = ?auto_869535 ?auto_869537 ) ) ( not ( = ?auto_869535 ?auto_869538 ) ) ( not ( = ?auto_869535 ?auto_869539 ) ) ( not ( = ?auto_869535 ?auto_869540 ) ) ( not ( = ?auto_869535 ?auto_869541 ) ) ( not ( = ?auto_869535 ?auto_869542 ) ) ( not ( = ?auto_869535 ?auto_869543 ) ) ( not ( = ?auto_869535 ?auto_869544 ) ) ( not ( = ?auto_869535 ?auto_869545 ) ) ( not ( = ?auto_869535 ?auto_869546 ) ) ( not ( = ?auto_869535 ?auto_869547 ) ) ( not ( = ?auto_869535 ?auto_869548 ) ) ( not ( = ?auto_869536 ?auto_869537 ) ) ( not ( = ?auto_869536 ?auto_869538 ) ) ( not ( = ?auto_869536 ?auto_869539 ) ) ( not ( = ?auto_869536 ?auto_869540 ) ) ( not ( = ?auto_869536 ?auto_869541 ) ) ( not ( = ?auto_869536 ?auto_869542 ) ) ( not ( = ?auto_869536 ?auto_869543 ) ) ( not ( = ?auto_869536 ?auto_869544 ) ) ( not ( = ?auto_869536 ?auto_869545 ) ) ( not ( = ?auto_869536 ?auto_869546 ) ) ( not ( = ?auto_869536 ?auto_869547 ) ) ( not ( = ?auto_869536 ?auto_869548 ) ) ( not ( = ?auto_869537 ?auto_869538 ) ) ( not ( = ?auto_869537 ?auto_869539 ) ) ( not ( = ?auto_869537 ?auto_869540 ) ) ( not ( = ?auto_869537 ?auto_869541 ) ) ( not ( = ?auto_869537 ?auto_869542 ) ) ( not ( = ?auto_869537 ?auto_869543 ) ) ( not ( = ?auto_869537 ?auto_869544 ) ) ( not ( = ?auto_869537 ?auto_869545 ) ) ( not ( = ?auto_869537 ?auto_869546 ) ) ( not ( = ?auto_869537 ?auto_869547 ) ) ( not ( = ?auto_869537 ?auto_869548 ) ) ( not ( = ?auto_869538 ?auto_869539 ) ) ( not ( = ?auto_869538 ?auto_869540 ) ) ( not ( = ?auto_869538 ?auto_869541 ) ) ( not ( = ?auto_869538 ?auto_869542 ) ) ( not ( = ?auto_869538 ?auto_869543 ) ) ( not ( = ?auto_869538 ?auto_869544 ) ) ( not ( = ?auto_869538 ?auto_869545 ) ) ( not ( = ?auto_869538 ?auto_869546 ) ) ( not ( = ?auto_869538 ?auto_869547 ) ) ( not ( = ?auto_869538 ?auto_869548 ) ) ( not ( = ?auto_869539 ?auto_869540 ) ) ( not ( = ?auto_869539 ?auto_869541 ) ) ( not ( = ?auto_869539 ?auto_869542 ) ) ( not ( = ?auto_869539 ?auto_869543 ) ) ( not ( = ?auto_869539 ?auto_869544 ) ) ( not ( = ?auto_869539 ?auto_869545 ) ) ( not ( = ?auto_869539 ?auto_869546 ) ) ( not ( = ?auto_869539 ?auto_869547 ) ) ( not ( = ?auto_869539 ?auto_869548 ) ) ( not ( = ?auto_869540 ?auto_869541 ) ) ( not ( = ?auto_869540 ?auto_869542 ) ) ( not ( = ?auto_869540 ?auto_869543 ) ) ( not ( = ?auto_869540 ?auto_869544 ) ) ( not ( = ?auto_869540 ?auto_869545 ) ) ( not ( = ?auto_869540 ?auto_869546 ) ) ( not ( = ?auto_869540 ?auto_869547 ) ) ( not ( = ?auto_869540 ?auto_869548 ) ) ( not ( = ?auto_869541 ?auto_869542 ) ) ( not ( = ?auto_869541 ?auto_869543 ) ) ( not ( = ?auto_869541 ?auto_869544 ) ) ( not ( = ?auto_869541 ?auto_869545 ) ) ( not ( = ?auto_869541 ?auto_869546 ) ) ( not ( = ?auto_869541 ?auto_869547 ) ) ( not ( = ?auto_869541 ?auto_869548 ) ) ( not ( = ?auto_869542 ?auto_869543 ) ) ( not ( = ?auto_869542 ?auto_869544 ) ) ( not ( = ?auto_869542 ?auto_869545 ) ) ( not ( = ?auto_869542 ?auto_869546 ) ) ( not ( = ?auto_869542 ?auto_869547 ) ) ( not ( = ?auto_869542 ?auto_869548 ) ) ( not ( = ?auto_869543 ?auto_869544 ) ) ( not ( = ?auto_869543 ?auto_869545 ) ) ( not ( = ?auto_869543 ?auto_869546 ) ) ( not ( = ?auto_869543 ?auto_869547 ) ) ( not ( = ?auto_869543 ?auto_869548 ) ) ( not ( = ?auto_869544 ?auto_869545 ) ) ( not ( = ?auto_869544 ?auto_869546 ) ) ( not ( = ?auto_869544 ?auto_869547 ) ) ( not ( = ?auto_869544 ?auto_869548 ) ) ( not ( = ?auto_869545 ?auto_869546 ) ) ( not ( = ?auto_869545 ?auto_869547 ) ) ( not ( = ?auto_869545 ?auto_869548 ) ) ( not ( = ?auto_869546 ?auto_869547 ) ) ( not ( = ?auto_869546 ?auto_869548 ) ) ( not ( = ?auto_869547 ?auto_869548 ) ) ( ON ?auto_869546 ?auto_869547 ) ( ON ?auto_869545 ?auto_869546 ) ( ON ?auto_869544 ?auto_869545 ) ( ON ?auto_869543 ?auto_869544 ) ( ON ?auto_869542 ?auto_869543 ) ( CLEAR ?auto_869540 ) ( ON ?auto_869541 ?auto_869542 ) ( CLEAR ?auto_869541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_869531 ?auto_869532 ?auto_869533 ?auto_869534 ?auto_869535 ?auto_869536 ?auto_869537 ?auto_869538 ?auto_869539 ?auto_869540 ?auto_869541 )
      ( MAKE-17PILE ?auto_869531 ?auto_869532 ?auto_869533 ?auto_869534 ?auto_869535 ?auto_869536 ?auto_869537 ?auto_869538 ?auto_869539 ?auto_869540 ?auto_869541 ?auto_869542 ?auto_869543 ?auto_869544 ?auto_869545 ?auto_869546 ?auto_869547 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869601 - BLOCK
      ?auto_869602 - BLOCK
      ?auto_869603 - BLOCK
      ?auto_869604 - BLOCK
      ?auto_869605 - BLOCK
      ?auto_869606 - BLOCK
      ?auto_869607 - BLOCK
      ?auto_869608 - BLOCK
      ?auto_869609 - BLOCK
      ?auto_869610 - BLOCK
      ?auto_869611 - BLOCK
      ?auto_869612 - BLOCK
      ?auto_869613 - BLOCK
      ?auto_869614 - BLOCK
      ?auto_869615 - BLOCK
      ?auto_869616 - BLOCK
      ?auto_869617 - BLOCK
    )
    :vars
    (
      ?auto_869618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869617 ?auto_869618 ) ( ON-TABLE ?auto_869601 ) ( ON ?auto_869602 ?auto_869601 ) ( ON ?auto_869603 ?auto_869602 ) ( ON ?auto_869604 ?auto_869603 ) ( ON ?auto_869605 ?auto_869604 ) ( ON ?auto_869606 ?auto_869605 ) ( ON ?auto_869607 ?auto_869606 ) ( ON ?auto_869608 ?auto_869607 ) ( ON ?auto_869609 ?auto_869608 ) ( not ( = ?auto_869601 ?auto_869602 ) ) ( not ( = ?auto_869601 ?auto_869603 ) ) ( not ( = ?auto_869601 ?auto_869604 ) ) ( not ( = ?auto_869601 ?auto_869605 ) ) ( not ( = ?auto_869601 ?auto_869606 ) ) ( not ( = ?auto_869601 ?auto_869607 ) ) ( not ( = ?auto_869601 ?auto_869608 ) ) ( not ( = ?auto_869601 ?auto_869609 ) ) ( not ( = ?auto_869601 ?auto_869610 ) ) ( not ( = ?auto_869601 ?auto_869611 ) ) ( not ( = ?auto_869601 ?auto_869612 ) ) ( not ( = ?auto_869601 ?auto_869613 ) ) ( not ( = ?auto_869601 ?auto_869614 ) ) ( not ( = ?auto_869601 ?auto_869615 ) ) ( not ( = ?auto_869601 ?auto_869616 ) ) ( not ( = ?auto_869601 ?auto_869617 ) ) ( not ( = ?auto_869601 ?auto_869618 ) ) ( not ( = ?auto_869602 ?auto_869603 ) ) ( not ( = ?auto_869602 ?auto_869604 ) ) ( not ( = ?auto_869602 ?auto_869605 ) ) ( not ( = ?auto_869602 ?auto_869606 ) ) ( not ( = ?auto_869602 ?auto_869607 ) ) ( not ( = ?auto_869602 ?auto_869608 ) ) ( not ( = ?auto_869602 ?auto_869609 ) ) ( not ( = ?auto_869602 ?auto_869610 ) ) ( not ( = ?auto_869602 ?auto_869611 ) ) ( not ( = ?auto_869602 ?auto_869612 ) ) ( not ( = ?auto_869602 ?auto_869613 ) ) ( not ( = ?auto_869602 ?auto_869614 ) ) ( not ( = ?auto_869602 ?auto_869615 ) ) ( not ( = ?auto_869602 ?auto_869616 ) ) ( not ( = ?auto_869602 ?auto_869617 ) ) ( not ( = ?auto_869602 ?auto_869618 ) ) ( not ( = ?auto_869603 ?auto_869604 ) ) ( not ( = ?auto_869603 ?auto_869605 ) ) ( not ( = ?auto_869603 ?auto_869606 ) ) ( not ( = ?auto_869603 ?auto_869607 ) ) ( not ( = ?auto_869603 ?auto_869608 ) ) ( not ( = ?auto_869603 ?auto_869609 ) ) ( not ( = ?auto_869603 ?auto_869610 ) ) ( not ( = ?auto_869603 ?auto_869611 ) ) ( not ( = ?auto_869603 ?auto_869612 ) ) ( not ( = ?auto_869603 ?auto_869613 ) ) ( not ( = ?auto_869603 ?auto_869614 ) ) ( not ( = ?auto_869603 ?auto_869615 ) ) ( not ( = ?auto_869603 ?auto_869616 ) ) ( not ( = ?auto_869603 ?auto_869617 ) ) ( not ( = ?auto_869603 ?auto_869618 ) ) ( not ( = ?auto_869604 ?auto_869605 ) ) ( not ( = ?auto_869604 ?auto_869606 ) ) ( not ( = ?auto_869604 ?auto_869607 ) ) ( not ( = ?auto_869604 ?auto_869608 ) ) ( not ( = ?auto_869604 ?auto_869609 ) ) ( not ( = ?auto_869604 ?auto_869610 ) ) ( not ( = ?auto_869604 ?auto_869611 ) ) ( not ( = ?auto_869604 ?auto_869612 ) ) ( not ( = ?auto_869604 ?auto_869613 ) ) ( not ( = ?auto_869604 ?auto_869614 ) ) ( not ( = ?auto_869604 ?auto_869615 ) ) ( not ( = ?auto_869604 ?auto_869616 ) ) ( not ( = ?auto_869604 ?auto_869617 ) ) ( not ( = ?auto_869604 ?auto_869618 ) ) ( not ( = ?auto_869605 ?auto_869606 ) ) ( not ( = ?auto_869605 ?auto_869607 ) ) ( not ( = ?auto_869605 ?auto_869608 ) ) ( not ( = ?auto_869605 ?auto_869609 ) ) ( not ( = ?auto_869605 ?auto_869610 ) ) ( not ( = ?auto_869605 ?auto_869611 ) ) ( not ( = ?auto_869605 ?auto_869612 ) ) ( not ( = ?auto_869605 ?auto_869613 ) ) ( not ( = ?auto_869605 ?auto_869614 ) ) ( not ( = ?auto_869605 ?auto_869615 ) ) ( not ( = ?auto_869605 ?auto_869616 ) ) ( not ( = ?auto_869605 ?auto_869617 ) ) ( not ( = ?auto_869605 ?auto_869618 ) ) ( not ( = ?auto_869606 ?auto_869607 ) ) ( not ( = ?auto_869606 ?auto_869608 ) ) ( not ( = ?auto_869606 ?auto_869609 ) ) ( not ( = ?auto_869606 ?auto_869610 ) ) ( not ( = ?auto_869606 ?auto_869611 ) ) ( not ( = ?auto_869606 ?auto_869612 ) ) ( not ( = ?auto_869606 ?auto_869613 ) ) ( not ( = ?auto_869606 ?auto_869614 ) ) ( not ( = ?auto_869606 ?auto_869615 ) ) ( not ( = ?auto_869606 ?auto_869616 ) ) ( not ( = ?auto_869606 ?auto_869617 ) ) ( not ( = ?auto_869606 ?auto_869618 ) ) ( not ( = ?auto_869607 ?auto_869608 ) ) ( not ( = ?auto_869607 ?auto_869609 ) ) ( not ( = ?auto_869607 ?auto_869610 ) ) ( not ( = ?auto_869607 ?auto_869611 ) ) ( not ( = ?auto_869607 ?auto_869612 ) ) ( not ( = ?auto_869607 ?auto_869613 ) ) ( not ( = ?auto_869607 ?auto_869614 ) ) ( not ( = ?auto_869607 ?auto_869615 ) ) ( not ( = ?auto_869607 ?auto_869616 ) ) ( not ( = ?auto_869607 ?auto_869617 ) ) ( not ( = ?auto_869607 ?auto_869618 ) ) ( not ( = ?auto_869608 ?auto_869609 ) ) ( not ( = ?auto_869608 ?auto_869610 ) ) ( not ( = ?auto_869608 ?auto_869611 ) ) ( not ( = ?auto_869608 ?auto_869612 ) ) ( not ( = ?auto_869608 ?auto_869613 ) ) ( not ( = ?auto_869608 ?auto_869614 ) ) ( not ( = ?auto_869608 ?auto_869615 ) ) ( not ( = ?auto_869608 ?auto_869616 ) ) ( not ( = ?auto_869608 ?auto_869617 ) ) ( not ( = ?auto_869608 ?auto_869618 ) ) ( not ( = ?auto_869609 ?auto_869610 ) ) ( not ( = ?auto_869609 ?auto_869611 ) ) ( not ( = ?auto_869609 ?auto_869612 ) ) ( not ( = ?auto_869609 ?auto_869613 ) ) ( not ( = ?auto_869609 ?auto_869614 ) ) ( not ( = ?auto_869609 ?auto_869615 ) ) ( not ( = ?auto_869609 ?auto_869616 ) ) ( not ( = ?auto_869609 ?auto_869617 ) ) ( not ( = ?auto_869609 ?auto_869618 ) ) ( not ( = ?auto_869610 ?auto_869611 ) ) ( not ( = ?auto_869610 ?auto_869612 ) ) ( not ( = ?auto_869610 ?auto_869613 ) ) ( not ( = ?auto_869610 ?auto_869614 ) ) ( not ( = ?auto_869610 ?auto_869615 ) ) ( not ( = ?auto_869610 ?auto_869616 ) ) ( not ( = ?auto_869610 ?auto_869617 ) ) ( not ( = ?auto_869610 ?auto_869618 ) ) ( not ( = ?auto_869611 ?auto_869612 ) ) ( not ( = ?auto_869611 ?auto_869613 ) ) ( not ( = ?auto_869611 ?auto_869614 ) ) ( not ( = ?auto_869611 ?auto_869615 ) ) ( not ( = ?auto_869611 ?auto_869616 ) ) ( not ( = ?auto_869611 ?auto_869617 ) ) ( not ( = ?auto_869611 ?auto_869618 ) ) ( not ( = ?auto_869612 ?auto_869613 ) ) ( not ( = ?auto_869612 ?auto_869614 ) ) ( not ( = ?auto_869612 ?auto_869615 ) ) ( not ( = ?auto_869612 ?auto_869616 ) ) ( not ( = ?auto_869612 ?auto_869617 ) ) ( not ( = ?auto_869612 ?auto_869618 ) ) ( not ( = ?auto_869613 ?auto_869614 ) ) ( not ( = ?auto_869613 ?auto_869615 ) ) ( not ( = ?auto_869613 ?auto_869616 ) ) ( not ( = ?auto_869613 ?auto_869617 ) ) ( not ( = ?auto_869613 ?auto_869618 ) ) ( not ( = ?auto_869614 ?auto_869615 ) ) ( not ( = ?auto_869614 ?auto_869616 ) ) ( not ( = ?auto_869614 ?auto_869617 ) ) ( not ( = ?auto_869614 ?auto_869618 ) ) ( not ( = ?auto_869615 ?auto_869616 ) ) ( not ( = ?auto_869615 ?auto_869617 ) ) ( not ( = ?auto_869615 ?auto_869618 ) ) ( not ( = ?auto_869616 ?auto_869617 ) ) ( not ( = ?auto_869616 ?auto_869618 ) ) ( not ( = ?auto_869617 ?auto_869618 ) ) ( ON ?auto_869616 ?auto_869617 ) ( ON ?auto_869615 ?auto_869616 ) ( ON ?auto_869614 ?auto_869615 ) ( ON ?auto_869613 ?auto_869614 ) ( ON ?auto_869612 ?auto_869613 ) ( ON ?auto_869611 ?auto_869612 ) ( CLEAR ?auto_869609 ) ( ON ?auto_869610 ?auto_869611 ) ( CLEAR ?auto_869610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_869601 ?auto_869602 ?auto_869603 ?auto_869604 ?auto_869605 ?auto_869606 ?auto_869607 ?auto_869608 ?auto_869609 ?auto_869610 )
      ( MAKE-17PILE ?auto_869601 ?auto_869602 ?auto_869603 ?auto_869604 ?auto_869605 ?auto_869606 ?auto_869607 ?auto_869608 ?auto_869609 ?auto_869610 ?auto_869611 ?auto_869612 ?auto_869613 ?auto_869614 ?auto_869615 ?auto_869616 ?auto_869617 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869671 - BLOCK
      ?auto_869672 - BLOCK
      ?auto_869673 - BLOCK
      ?auto_869674 - BLOCK
      ?auto_869675 - BLOCK
      ?auto_869676 - BLOCK
      ?auto_869677 - BLOCK
      ?auto_869678 - BLOCK
      ?auto_869679 - BLOCK
      ?auto_869680 - BLOCK
      ?auto_869681 - BLOCK
      ?auto_869682 - BLOCK
      ?auto_869683 - BLOCK
      ?auto_869684 - BLOCK
      ?auto_869685 - BLOCK
      ?auto_869686 - BLOCK
      ?auto_869687 - BLOCK
    )
    :vars
    (
      ?auto_869688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869687 ?auto_869688 ) ( ON-TABLE ?auto_869671 ) ( ON ?auto_869672 ?auto_869671 ) ( ON ?auto_869673 ?auto_869672 ) ( ON ?auto_869674 ?auto_869673 ) ( ON ?auto_869675 ?auto_869674 ) ( ON ?auto_869676 ?auto_869675 ) ( ON ?auto_869677 ?auto_869676 ) ( ON ?auto_869678 ?auto_869677 ) ( not ( = ?auto_869671 ?auto_869672 ) ) ( not ( = ?auto_869671 ?auto_869673 ) ) ( not ( = ?auto_869671 ?auto_869674 ) ) ( not ( = ?auto_869671 ?auto_869675 ) ) ( not ( = ?auto_869671 ?auto_869676 ) ) ( not ( = ?auto_869671 ?auto_869677 ) ) ( not ( = ?auto_869671 ?auto_869678 ) ) ( not ( = ?auto_869671 ?auto_869679 ) ) ( not ( = ?auto_869671 ?auto_869680 ) ) ( not ( = ?auto_869671 ?auto_869681 ) ) ( not ( = ?auto_869671 ?auto_869682 ) ) ( not ( = ?auto_869671 ?auto_869683 ) ) ( not ( = ?auto_869671 ?auto_869684 ) ) ( not ( = ?auto_869671 ?auto_869685 ) ) ( not ( = ?auto_869671 ?auto_869686 ) ) ( not ( = ?auto_869671 ?auto_869687 ) ) ( not ( = ?auto_869671 ?auto_869688 ) ) ( not ( = ?auto_869672 ?auto_869673 ) ) ( not ( = ?auto_869672 ?auto_869674 ) ) ( not ( = ?auto_869672 ?auto_869675 ) ) ( not ( = ?auto_869672 ?auto_869676 ) ) ( not ( = ?auto_869672 ?auto_869677 ) ) ( not ( = ?auto_869672 ?auto_869678 ) ) ( not ( = ?auto_869672 ?auto_869679 ) ) ( not ( = ?auto_869672 ?auto_869680 ) ) ( not ( = ?auto_869672 ?auto_869681 ) ) ( not ( = ?auto_869672 ?auto_869682 ) ) ( not ( = ?auto_869672 ?auto_869683 ) ) ( not ( = ?auto_869672 ?auto_869684 ) ) ( not ( = ?auto_869672 ?auto_869685 ) ) ( not ( = ?auto_869672 ?auto_869686 ) ) ( not ( = ?auto_869672 ?auto_869687 ) ) ( not ( = ?auto_869672 ?auto_869688 ) ) ( not ( = ?auto_869673 ?auto_869674 ) ) ( not ( = ?auto_869673 ?auto_869675 ) ) ( not ( = ?auto_869673 ?auto_869676 ) ) ( not ( = ?auto_869673 ?auto_869677 ) ) ( not ( = ?auto_869673 ?auto_869678 ) ) ( not ( = ?auto_869673 ?auto_869679 ) ) ( not ( = ?auto_869673 ?auto_869680 ) ) ( not ( = ?auto_869673 ?auto_869681 ) ) ( not ( = ?auto_869673 ?auto_869682 ) ) ( not ( = ?auto_869673 ?auto_869683 ) ) ( not ( = ?auto_869673 ?auto_869684 ) ) ( not ( = ?auto_869673 ?auto_869685 ) ) ( not ( = ?auto_869673 ?auto_869686 ) ) ( not ( = ?auto_869673 ?auto_869687 ) ) ( not ( = ?auto_869673 ?auto_869688 ) ) ( not ( = ?auto_869674 ?auto_869675 ) ) ( not ( = ?auto_869674 ?auto_869676 ) ) ( not ( = ?auto_869674 ?auto_869677 ) ) ( not ( = ?auto_869674 ?auto_869678 ) ) ( not ( = ?auto_869674 ?auto_869679 ) ) ( not ( = ?auto_869674 ?auto_869680 ) ) ( not ( = ?auto_869674 ?auto_869681 ) ) ( not ( = ?auto_869674 ?auto_869682 ) ) ( not ( = ?auto_869674 ?auto_869683 ) ) ( not ( = ?auto_869674 ?auto_869684 ) ) ( not ( = ?auto_869674 ?auto_869685 ) ) ( not ( = ?auto_869674 ?auto_869686 ) ) ( not ( = ?auto_869674 ?auto_869687 ) ) ( not ( = ?auto_869674 ?auto_869688 ) ) ( not ( = ?auto_869675 ?auto_869676 ) ) ( not ( = ?auto_869675 ?auto_869677 ) ) ( not ( = ?auto_869675 ?auto_869678 ) ) ( not ( = ?auto_869675 ?auto_869679 ) ) ( not ( = ?auto_869675 ?auto_869680 ) ) ( not ( = ?auto_869675 ?auto_869681 ) ) ( not ( = ?auto_869675 ?auto_869682 ) ) ( not ( = ?auto_869675 ?auto_869683 ) ) ( not ( = ?auto_869675 ?auto_869684 ) ) ( not ( = ?auto_869675 ?auto_869685 ) ) ( not ( = ?auto_869675 ?auto_869686 ) ) ( not ( = ?auto_869675 ?auto_869687 ) ) ( not ( = ?auto_869675 ?auto_869688 ) ) ( not ( = ?auto_869676 ?auto_869677 ) ) ( not ( = ?auto_869676 ?auto_869678 ) ) ( not ( = ?auto_869676 ?auto_869679 ) ) ( not ( = ?auto_869676 ?auto_869680 ) ) ( not ( = ?auto_869676 ?auto_869681 ) ) ( not ( = ?auto_869676 ?auto_869682 ) ) ( not ( = ?auto_869676 ?auto_869683 ) ) ( not ( = ?auto_869676 ?auto_869684 ) ) ( not ( = ?auto_869676 ?auto_869685 ) ) ( not ( = ?auto_869676 ?auto_869686 ) ) ( not ( = ?auto_869676 ?auto_869687 ) ) ( not ( = ?auto_869676 ?auto_869688 ) ) ( not ( = ?auto_869677 ?auto_869678 ) ) ( not ( = ?auto_869677 ?auto_869679 ) ) ( not ( = ?auto_869677 ?auto_869680 ) ) ( not ( = ?auto_869677 ?auto_869681 ) ) ( not ( = ?auto_869677 ?auto_869682 ) ) ( not ( = ?auto_869677 ?auto_869683 ) ) ( not ( = ?auto_869677 ?auto_869684 ) ) ( not ( = ?auto_869677 ?auto_869685 ) ) ( not ( = ?auto_869677 ?auto_869686 ) ) ( not ( = ?auto_869677 ?auto_869687 ) ) ( not ( = ?auto_869677 ?auto_869688 ) ) ( not ( = ?auto_869678 ?auto_869679 ) ) ( not ( = ?auto_869678 ?auto_869680 ) ) ( not ( = ?auto_869678 ?auto_869681 ) ) ( not ( = ?auto_869678 ?auto_869682 ) ) ( not ( = ?auto_869678 ?auto_869683 ) ) ( not ( = ?auto_869678 ?auto_869684 ) ) ( not ( = ?auto_869678 ?auto_869685 ) ) ( not ( = ?auto_869678 ?auto_869686 ) ) ( not ( = ?auto_869678 ?auto_869687 ) ) ( not ( = ?auto_869678 ?auto_869688 ) ) ( not ( = ?auto_869679 ?auto_869680 ) ) ( not ( = ?auto_869679 ?auto_869681 ) ) ( not ( = ?auto_869679 ?auto_869682 ) ) ( not ( = ?auto_869679 ?auto_869683 ) ) ( not ( = ?auto_869679 ?auto_869684 ) ) ( not ( = ?auto_869679 ?auto_869685 ) ) ( not ( = ?auto_869679 ?auto_869686 ) ) ( not ( = ?auto_869679 ?auto_869687 ) ) ( not ( = ?auto_869679 ?auto_869688 ) ) ( not ( = ?auto_869680 ?auto_869681 ) ) ( not ( = ?auto_869680 ?auto_869682 ) ) ( not ( = ?auto_869680 ?auto_869683 ) ) ( not ( = ?auto_869680 ?auto_869684 ) ) ( not ( = ?auto_869680 ?auto_869685 ) ) ( not ( = ?auto_869680 ?auto_869686 ) ) ( not ( = ?auto_869680 ?auto_869687 ) ) ( not ( = ?auto_869680 ?auto_869688 ) ) ( not ( = ?auto_869681 ?auto_869682 ) ) ( not ( = ?auto_869681 ?auto_869683 ) ) ( not ( = ?auto_869681 ?auto_869684 ) ) ( not ( = ?auto_869681 ?auto_869685 ) ) ( not ( = ?auto_869681 ?auto_869686 ) ) ( not ( = ?auto_869681 ?auto_869687 ) ) ( not ( = ?auto_869681 ?auto_869688 ) ) ( not ( = ?auto_869682 ?auto_869683 ) ) ( not ( = ?auto_869682 ?auto_869684 ) ) ( not ( = ?auto_869682 ?auto_869685 ) ) ( not ( = ?auto_869682 ?auto_869686 ) ) ( not ( = ?auto_869682 ?auto_869687 ) ) ( not ( = ?auto_869682 ?auto_869688 ) ) ( not ( = ?auto_869683 ?auto_869684 ) ) ( not ( = ?auto_869683 ?auto_869685 ) ) ( not ( = ?auto_869683 ?auto_869686 ) ) ( not ( = ?auto_869683 ?auto_869687 ) ) ( not ( = ?auto_869683 ?auto_869688 ) ) ( not ( = ?auto_869684 ?auto_869685 ) ) ( not ( = ?auto_869684 ?auto_869686 ) ) ( not ( = ?auto_869684 ?auto_869687 ) ) ( not ( = ?auto_869684 ?auto_869688 ) ) ( not ( = ?auto_869685 ?auto_869686 ) ) ( not ( = ?auto_869685 ?auto_869687 ) ) ( not ( = ?auto_869685 ?auto_869688 ) ) ( not ( = ?auto_869686 ?auto_869687 ) ) ( not ( = ?auto_869686 ?auto_869688 ) ) ( not ( = ?auto_869687 ?auto_869688 ) ) ( ON ?auto_869686 ?auto_869687 ) ( ON ?auto_869685 ?auto_869686 ) ( ON ?auto_869684 ?auto_869685 ) ( ON ?auto_869683 ?auto_869684 ) ( ON ?auto_869682 ?auto_869683 ) ( ON ?auto_869681 ?auto_869682 ) ( ON ?auto_869680 ?auto_869681 ) ( CLEAR ?auto_869678 ) ( ON ?auto_869679 ?auto_869680 ) ( CLEAR ?auto_869679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_869671 ?auto_869672 ?auto_869673 ?auto_869674 ?auto_869675 ?auto_869676 ?auto_869677 ?auto_869678 ?auto_869679 )
      ( MAKE-17PILE ?auto_869671 ?auto_869672 ?auto_869673 ?auto_869674 ?auto_869675 ?auto_869676 ?auto_869677 ?auto_869678 ?auto_869679 ?auto_869680 ?auto_869681 ?auto_869682 ?auto_869683 ?auto_869684 ?auto_869685 ?auto_869686 ?auto_869687 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869741 - BLOCK
      ?auto_869742 - BLOCK
      ?auto_869743 - BLOCK
      ?auto_869744 - BLOCK
      ?auto_869745 - BLOCK
      ?auto_869746 - BLOCK
      ?auto_869747 - BLOCK
      ?auto_869748 - BLOCK
      ?auto_869749 - BLOCK
      ?auto_869750 - BLOCK
      ?auto_869751 - BLOCK
      ?auto_869752 - BLOCK
      ?auto_869753 - BLOCK
      ?auto_869754 - BLOCK
      ?auto_869755 - BLOCK
      ?auto_869756 - BLOCK
      ?auto_869757 - BLOCK
    )
    :vars
    (
      ?auto_869758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869757 ?auto_869758 ) ( ON-TABLE ?auto_869741 ) ( ON ?auto_869742 ?auto_869741 ) ( ON ?auto_869743 ?auto_869742 ) ( ON ?auto_869744 ?auto_869743 ) ( ON ?auto_869745 ?auto_869744 ) ( ON ?auto_869746 ?auto_869745 ) ( ON ?auto_869747 ?auto_869746 ) ( not ( = ?auto_869741 ?auto_869742 ) ) ( not ( = ?auto_869741 ?auto_869743 ) ) ( not ( = ?auto_869741 ?auto_869744 ) ) ( not ( = ?auto_869741 ?auto_869745 ) ) ( not ( = ?auto_869741 ?auto_869746 ) ) ( not ( = ?auto_869741 ?auto_869747 ) ) ( not ( = ?auto_869741 ?auto_869748 ) ) ( not ( = ?auto_869741 ?auto_869749 ) ) ( not ( = ?auto_869741 ?auto_869750 ) ) ( not ( = ?auto_869741 ?auto_869751 ) ) ( not ( = ?auto_869741 ?auto_869752 ) ) ( not ( = ?auto_869741 ?auto_869753 ) ) ( not ( = ?auto_869741 ?auto_869754 ) ) ( not ( = ?auto_869741 ?auto_869755 ) ) ( not ( = ?auto_869741 ?auto_869756 ) ) ( not ( = ?auto_869741 ?auto_869757 ) ) ( not ( = ?auto_869741 ?auto_869758 ) ) ( not ( = ?auto_869742 ?auto_869743 ) ) ( not ( = ?auto_869742 ?auto_869744 ) ) ( not ( = ?auto_869742 ?auto_869745 ) ) ( not ( = ?auto_869742 ?auto_869746 ) ) ( not ( = ?auto_869742 ?auto_869747 ) ) ( not ( = ?auto_869742 ?auto_869748 ) ) ( not ( = ?auto_869742 ?auto_869749 ) ) ( not ( = ?auto_869742 ?auto_869750 ) ) ( not ( = ?auto_869742 ?auto_869751 ) ) ( not ( = ?auto_869742 ?auto_869752 ) ) ( not ( = ?auto_869742 ?auto_869753 ) ) ( not ( = ?auto_869742 ?auto_869754 ) ) ( not ( = ?auto_869742 ?auto_869755 ) ) ( not ( = ?auto_869742 ?auto_869756 ) ) ( not ( = ?auto_869742 ?auto_869757 ) ) ( not ( = ?auto_869742 ?auto_869758 ) ) ( not ( = ?auto_869743 ?auto_869744 ) ) ( not ( = ?auto_869743 ?auto_869745 ) ) ( not ( = ?auto_869743 ?auto_869746 ) ) ( not ( = ?auto_869743 ?auto_869747 ) ) ( not ( = ?auto_869743 ?auto_869748 ) ) ( not ( = ?auto_869743 ?auto_869749 ) ) ( not ( = ?auto_869743 ?auto_869750 ) ) ( not ( = ?auto_869743 ?auto_869751 ) ) ( not ( = ?auto_869743 ?auto_869752 ) ) ( not ( = ?auto_869743 ?auto_869753 ) ) ( not ( = ?auto_869743 ?auto_869754 ) ) ( not ( = ?auto_869743 ?auto_869755 ) ) ( not ( = ?auto_869743 ?auto_869756 ) ) ( not ( = ?auto_869743 ?auto_869757 ) ) ( not ( = ?auto_869743 ?auto_869758 ) ) ( not ( = ?auto_869744 ?auto_869745 ) ) ( not ( = ?auto_869744 ?auto_869746 ) ) ( not ( = ?auto_869744 ?auto_869747 ) ) ( not ( = ?auto_869744 ?auto_869748 ) ) ( not ( = ?auto_869744 ?auto_869749 ) ) ( not ( = ?auto_869744 ?auto_869750 ) ) ( not ( = ?auto_869744 ?auto_869751 ) ) ( not ( = ?auto_869744 ?auto_869752 ) ) ( not ( = ?auto_869744 ?auto_869753 ) ) ( not ( = ?auto_869744 ?auto_869754 ) ) ( not ( = ?auto_869744 ?auto_869755 ) ) ( not ( = ?auto_869744 ?auto_869756 ) ) ( not ( = ?auto_869744 ?auto_869757 ) ) ( not ( = ?auto_869744 ?auto_869758 ) ) ( not ( = ?auto_869745 ?auto_869746 ) ) ( not ( = ?auto_869745 ?auto_869747 ) ) ( not ( = ?auto_869745 ?auto_869748 ) ) ( not ( = ?auto_869745 ?auto_869749 ) ) ( not ( = ?auto_869745 ?auto_869750 ) ) ( not ( = ?auto_869745 ?auto_869751 ) ) ( not ( = ?auto_869745 ?auto_869752 ) ) ( not ( = ?auto_869745 ?auto_869753 ) ) ( not ( = ?auto_869745 ?auto_869754 ) ) ( not ( = ?auto_869745 ?auto_869755 ) ) ( not ( = ?auto_869745 ?auto_869756 ) ) ( not ( = ?auto_869745 ?auto_869757 ) ) ( not ( = ?auto_869745 ?auto_869758 ) ) ( not ( = ?auto_869746 ?auto_869747 ) ) ( not ( = ?auto_869746 ?auto_869748 ) ) ( not ( = ?auto_869746 ?auto_869749 ) ) ( not ( = ?auto_869746 ?auto_869750 ) ) ( not ( = ?auto_869746 ?auto_869751 ) ) ( not ( = ?auto_869746 ?auto_869752 ) ) ( not ( = ?auto_869746 ?auto_869753 ) ) ( not ( = ?auto_869746 ?auto_869754 ) ) ( not ( = ?auto_869746 ?auto_869755 ) ) ( not ( = ?auto_869746 ?auto_869756 ) ) ( not ( = ?auto_869746 ?auto_869757 ) ) ( not ( = ?auto_869746 ?auto_869758 ) ) ( not ( = ?auto_869747 ?auto_869748 ) ) ( not ( = ?auto_869747 ?auto_869749 ) ) ( not ( = ?auto_869747 ?auto_869750 ) ) ( not ( = ?auto_869747 ?auto_869751 ) ) ( not ( = ?auto_869747 ?auto_869752 ) ) ( not ( = ?auto_869747 ?auto_869753 ) ) ( not ( = ?auto_869747 ?auto_869754 ) ) ( not ( = ?auto_869747 ?auto_869755 ) ) ( not ( = ?auto_869747 ?auto_869756 ) ) ( not ( = ?auto_869747 ?auto_869757 ) ) ( not ( = ?auto_869747 ?auto_869758 ) ) ( not ( = ?auto_869748 ?auto_869749 ) ) ( not ( = ?auto_869748 ?auto_869750 ) ) ( not ( = ?auto_869748 ?auto_869751 ) ) ( not ( = ?auto_869748 ?auto_869752 ) ) ( not ( = ?auto_869748 ?auto_869753 ) ) ( not ( = ?auto_869748 ?auto_869754 ) ) ( not ( = ?auto_869748 ?auto_869755 ) ) ( not ( = ?auto_869748 ?auto_869756 ) ) ( not ( = ?auto_869748 ?auto_869757 ) ) ( not ( = ?auto_869748 ?auto_869758 ) ) ( not ( = ?auto_869749 ?auto_869750 ) ) ( not ( = ?auto_869749 ?auto_869751 ) ) ( not ( = ?auto_869749 ?auto_869752 ) ) ( not ( = ?auto_869749 ?auto_869753 ) ) ( not ( = ?auto_869749 ?auto_869754 ) ) ( not ( = ?auto_869749 ?auto_869755 ) ) ( not ( = ?auto_869749 ?auto_869756 ) ) ( not ( = ?auto_869749 ?auto_869757 ) ) ( not ( = ?auto_869749 ?auto_869758 ) ) ( not ( = ?auto_869750 ?auto_869751 ) ) ( not ( = ?auto_869750 ?auto_869752 ) ) ( not ( = ?auto_869750 ?auto_869753 ) ) ( not ( = ?auto_869750 ?auto_869754 ) ) ( not ( = ?auto_869750 ?auto_869755 ) ) ( not ( = ?auto_869750 ?auto_869756 ) ) ( not ( = ?auto_869750 ?auto_869757 ) ) ( not ( = ?auto_869750 ?auto_869758 ) ) ( not ( = ?auto_869751 ?auto_869752 ) ) ( not ( = ?auto_869751 ?auto_869753 ) ) ( not ( = ?auto_869751 ?auto_869754 ) ) ( not ( = ?auto_869751 ?auto_869755 ) ) ( not ( = ?auto_869751 ?auto_869756 ) ) ( not ( = ?auto_869751 ?auto_869757 ) ) ( not ( = ?auto_869751 ?auto_869758 ) ) ( not ( = ?auto_869752 ?auto_869753 ) ) ( not ( = ?auto_869752 ?auto_869754 ) ) ( not ( = ?auto_869752 ?auto_869755 ) ) ( not ( = ?auto_869752 ?auto_869756 ) ) ( not ( = ?auto_869752 ?auto_869757 ) ) ( not ( = ?auto_869752 ?auto_869758 ) ) ( not ( = ?auto_869753 ?auto_869754 ) ) ( not ( = ?auto_869753 ?auto_869755 ) ) ( not ( = ?auto_869753 ?auto_869756 ) ) ( not ( = ?auto_869753 ?auto_869757 ) ) ( not ( = ?auto_869753 ?auto_869758 ) ) ( not ( = ?auto_869754 ?auto_869755 ) ) ( not ( = ?auto_869754 ?auto_869756 ) ) ( not ( = ?auto_869754 ?auto_869757 ) ) ( not ( = ?auto_869754 ?auto_869758 ) ) ( not ( = ?auto_869755 ?auto_869756 ) ) ( not ( = ?auto_869755 ?auto_869757 ) ) ( not ( = ?auto_869755 ?auto_869758 ) ) ( not ( = ?auto_869756 ?auto_869757 ) ) ( not ( = ?auto_869756 ?auto_869758 ) ) ( not ( = ?auto_869757 ?auto_869758 ) ) ( ON ?auto_869756 ?auto_869757 ) ( ON ?auto_869755 ?auto_869756 ) ( ON ?auto_869754 ?auto_869755 ) ( ON ?auto_869753 ?auto_869754 ) ( ON ?auto_869752 ?auto_869753 ) ( ON ?auto_869751 ?auto_869752 ) ( ON ?auto_869750 ?auto_869751 ) ( ON ?auto_869749 ?auto_869750 ) ( CLEAR ?auto_869747 ) ( ON ?auto_869748 ?auto_869749 ) ( CLEAR ?auto_869748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_869741 ?auto_869742 ?auto_869743 ?auto_869744 ?auto_869745 ?auto_869746 ?auto_869747 ?auto_869748 )
      ( MAKE-17PILE ?auto_869741 ?auto_869742 ?auto_869743 ?auto_869744 ?auto_869745 ?auto_869746 ?auto_869747 ?auto_869748 ?auto_869749 ?auto_869750 ?auto_869751 ?auto_869752 ?auto_869753 ?auto_869754 ?auto_869755 ?auto_869756 ?auto_869757 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869811 - BLOCK
      ?auto_869812 - BLOCK
      ?auto_869813 - BLOCK
      ?auto_869814 - BLOCK
      ?auto_869815 - BLOCK
      ?auto_869816 - BLOCK
      ?auto_869817 - BLOCK
      ?auto_869818 - BLOCK
      ?auto_869819 - BLOCK
      ?auto_869820 - BLOCK
      ?auto_869821 - BLOCK
      ?auto_869822 - BLOCK
      ?auto_869823 - BLOCK
      ?auto_869824 - BLOCK
      ?auto_869825 - BLOCK
      ?auto_869826 - BLOCK
      ?auto_869827 - BLOCK
    )
    :vars
    (
      ?auto_869828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869827 ?auto_869828 ) ( ON-TABLE ?auto_869811 ) ( ON ?auto_869812 ?auto_869811 ) ( ON ?auto_869813 ?auto_869812 ) ( ON ?auto_869814 ?auto_869813 ) ( ON ?auto_869815 ?auto_869814 ) ( ON ?auto_869816 ?auto_869815 ) ( not ( = ?auto_869811 ?auto_869812 ) ) ( not ( = ?auto_869811 ?auto_869813 ) ) ( not ( = ?auto_869811 ?auto_869814 ) ) ( not ( = ?auto_869811 ?auto_869815 ) ) ( not ( = ?auto_869811 ?auto_869816 ) ) ( not ( = ?auto_869811 ?auto_869817 ) ) ( not ( = ?auto_869811 ?auto_869818 ) ) ( not ( = ?auto_869811 ?auto_869819 ) ) ( not ( = ?auto_869811 ?auto_869820 ) ) ( not ( = ?auto_869811 ?auto_869821 ) ) ( not ( = ?auto_869811 ?auto_869822 ) ) ( not ( = ?auto_869811 ?auto_869823 ) ) ( not ( = ?auto_869811 ?auto_869824 ) ) ( not ( = ?auto_869811 ?auto_869825 ) ) ( not ( = ?auto_869811 ?auto_869826 ) ) ( not ( = ?auto_869811 ?auto_869827 ) ) ( not ( = ?auto_869811 ?auto_869828 ) ) ( not ( = ?auto_869812 ?auto_869813 ) ) ( not ( = ?auto_869812 ?auto_869814 ) ) ( not ( = ?auto_869812 ?auto_869815 ) ) ( not ( = ?auto_869812 ?auto_869816 ) ) ( not ( = ?auto_869812 ?auto_869817 ) ) ( not ( = ?auto_869812 ?auto_869818 ) ) ( not ( = ?auto_869812 ?auto_869819 ) ) ( not ( = ?auto_869812 ?auto_869820 ) ) ( not ( = ?auto_869812 ?auto_869821 ) ) ( not ( = ?auto_869812 ?auto_869822 ) ) ( not ( = ?auto_869812 ?auto_869823 ) ) ( not ( = ?auto_869812 ?auto_869824 ) ) ( not ( = ?auto_869812 ?auto_869825 ) ) ( not ( = ?auto_869812 ?auto_869826 ) ) ( not ( = ?auto_869812 ?auto_869827 ) ) ( not ( = ?auto_869812 ?auto_869828 ) ) ( not ( = ?auto_869813 ?auto_869814 ) ) ( not ( = ?auto_869813 ?auto_869815 ) ) ( not ( = ?auto_869813 ?auto_869816 ) ) ( not ( = ?auto_869813 ?auto_869817 ) ) ( not ( = ?auto_869813 ?auto_869818 ) ) ( not ( = ?auto_869813 ?auto_869819 ) ) ( not ( = ?auto_869813 ?auto_869820 ) ) ( not ( = ?auto_869813 ?auto_869821 ) ) ( not ( = ?auto_869813 ?auto_869822 ) ) ( not ( = ?auto_869813 ?auto_869823 ) ) ( not ( = ?auto_869813 ?auto_869824 ) ) ( not ( = ?auto_869813 ?auto_869825 ) ) ( not ( = ?auto_869813 ?auto_869826 ) ) ( not ( = ?auto_869813 ?auto_869827 ) ) ( not ( = ?auto_869813 ?auto_869828 ) ) ( not ( = ?auto_869814 ?auto_869815 ) ) ( not ( = ?auto_869814 ?auto_869816 ) ) ( not ( = ?auto_869814 ?auto_869817 ) ) ( not ( = ?auto_869814 ?auto_869818 ) ) ( not ( = ?auto_869814 ?auto_869819 ) ) ( not ( = ?auto_869814 ?auto_869820 ) ) ( not ( = ?auto_869814 ?auto_869821 ) ) ( not ( = ?auto_869814 ?auto_869822 ) ) ( not ( = ?auto_869814 ?auto_869823 ) ) ( not ( = ?auto_869814 ?auto_869824 ) ) ( not ( = ?auto_869814 ?auto_869825 ) ) ( not ( = ?auto_869814 ?auto_869826 ) ) ( not ( = ?auto_869814 ?auto_869827 ) ) ( not ( = ?auto_869814 ?auto_869828 ) ) ( not ( = ?auto_869815 ?auto_869816 ) ) ( not ( = ?auto_869815 ?auto_869817 ) ) ( not ( = ?auto_869815 ?auto_869818 ) ) ( not ( = ?auto_869815 ?auto_869819 ) ) ( not ( = ?auto_869815 ?auto_869820 ) ) ( not ( = ?auto_869815 ?auto_869821 ) ) ( not ( = ?auto_869815 ?auto_869822 ) ) ( not ( = ?auto_869815 ?auto_869823 ) ) ( not ( = ?auto_869815 ?auto_869824 ) ) ( not ( = ?auto_869815 ?auto_869825 ) ) ( not ( = ?auto_869815 ?auto_869826 ) ) ( not ( = ?auto_869815 ?auto_869827 ) ) ( not ( = ?auto_869815 ?auto_869828 ) ) ( not ( = ?auto_869816 ?auto_869817 ) ) ( not ( = ?auto_869816 ?auto_869818 ) ) ( not ( = ?auto_869816 ?auto_869819 ) ) ( not ( = ?auto_869816 ?auto_869820 ) ) ( not ( = ?auto_869816 ?auto_869821 ) ) ( not ( = ?auto_869816 ?auto_869822 ) ) ( not ( = ?auto_869816 ?auto_869823 ) ) ( not ( = ?auto_869816 ?auto_869824 ) ) ( not ( = ?auto_869816 ?auto_869825 ) ) ( not ( = ?auto_869816 ?auto_869826 ) ) ( not ( = ?auto_869816 ?auto_869827 ) ) ( not ( = ?auto_869816 ?auto_869828 ) ) ( not ( = ?auto_869817 ?auto_869818 ) ) ( not ( = ?auto_869817 ?auto_869819 ) ) ( not ( = ?auto_869817 ?auto_869820 ) ) ( not ( = ?auto_869817 ?auto_869821 ) ) ( not ( = ?auto_869817 ?auto_869822 ) ) ( not ( = ?auto_869817 ?auto_869823 ) ) ( not ( = ?auto_869817 ?auto_869824 ) ) ( not ( = ?auto_869817 ?auto_869825 ) ) ( not ( = ?auto_869817 ?auto_869826 ) ) ( not ( = ?auto_869817 ?auto_869827 ) ) ( not ( = ?auto_869817 ?auto_869828 ) ) ( not ( = ?auto_869818 ?auto_869819 ) ) ( not ( = ?auto_869818 ?auto_869820 ) ) ( not ( = ?auto_869818 ?auto_869821 ) ) ( not ( = ?auto_869818 ?auto_869822 ) ) ( not ( = ?auto_869818 ?auto_869823 ) ) ( not ( = ?auto_869818 ?auto_869824 ) ) ( not ( = ?auto_869818 ?auto_869825 ) ) ( not ( = ?auto_869818 ?auto_869826 ) ) ( not ( = ?auto_869818 ?auto_869827 ) ) ( not ( = ?auto_869818 ?auto_869828 ) ) ( not ( = ?auto_869819 ?auto_869820 ) ) ( not ( = ?auto_869819 ?auto_869821 ) ) ( not ( = ?auto_869819 ?auto_869822 ) ) ( not ( = ?auto_869819 ?auto_869823 ) ) ( not ( = ?auto_869819 ?auto_869824 ) ) ( not ( = ?auto_869819 ?auto_869825 ) ) ( not ( = ?auto_869819 ?auto_869826 ) ) ( not ( = ?auto_869819 ?auto_869827 ) ) ( not ( = ?auto_869819 ?auto_869828 ) ) ( not ( = ?auto_869820 ?auto_869821 ) ) ( not ( = ?auto_869820 ?auto_869822 ) ) ( not ( = ?auto_869820 ?auto_869823 ) ) ( not ( = ?auto_869820 ?auto_869824 ) ) ( not ( = ?auto_869820 ?auto_869825 ) ) ( not ( = ?auto_869820 ?auto_869826 ) ) ( not ( = ?auto_869820 ?auto_869827 ) ) ( not ( = ?auto_869820 ?auto_869828 ) ) ( not ( = ?auto_869821 ?auto_869822 ) ) ( not ( = ?auto_869821 ?auto_869823 ) ) ( not ( = ?auto_869821 ?auto_869824 ) ) ( not ( = ?auto_869821 ?auto_869825 ) ) ( not ( = ?auto_869821 ?auto_869826 ) ) ( not ( = ?auto_869821 ?auto_869827 ) ) ( not ( = ?auto_869821 ?auto_869828 ) ) ( not ( = ?auto_869822 ?auto_869823 ) ) ( not ( = ?auto_869822 ?auto_869824 ) ) ( not ( = ?auto_869822 ?auto_869825 ) ) ( not ( = ?auto_869822 ?auto_869826 ) ) ( not ( = ?auto_869822 ?auto_869827 ) ) ( not ( = ?auto_869822 ?auto_869828 ) ) ( not ( = ?auto_869823 ?auto_869824 ) ) ( not ( = ?auto_869823 ?auto_869825 ) ) ( not ( = ?auto_869823 ?auto_869826 ) ) ( not ( = ?auto_869823 ?auto_869827 ) ) ( not ( = ?auto_869823 ?auto_869828 ) ) ( not ( = ?auto_869824 ?auto_869825 ) ) ( not ( = ?auto_869824 ?auto_869826 ) ) ( not ( = ?auto_869824 ?auto_869827 ) ) ( not ( = ?auto_869824 ?auto_869828 ) ) ( not ( = ?auto_869825 ?auto_869826 ) ) ( not ( = ?auto_869825 ?auto_869827 ) ) ( not ( = ?auto_869825 ?auto_869828 ) ) ( not ( = ?auto_869826 ?auto_869827 ) ) ( not ( = ?auto_869826 ?auto_869828 ) ) ( not ( = ?auto_869827 ?auto_869828 ) ) ( ON ?auto_869826 ?auto_869827 ) ( ON ?auto_869825 ?auto_869826 ) ( ON ?auto_869824 ?auto_869825 ) ( ON ?auto_869823 ?auto_869824 ) ( ON ?auto_869822 ?auto_869823 ) ( ON ?auto_869821 ?auto_869822 ) ( ON ?auto_869820 ?auto_869821 ) ( ON ?auto_869819 ?auto_869820 ) ( ON ?auto_869818 ?auto_869819 ) ( CLEAR ?auto_869816 ) ( ON ?auto_869817 ?auto_869818 ) ( CLEAR ?auto_869817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_869811 ?auto_869812 ?auto_869813 ?auto_869814 ?auto_869815 ?auto_869816 ?auto_869817 )
      ( MAKE-17PILE ?auto_869811 ?auto_869812 ?auto_869813 ?auto_869814 ?auto_869815 ?auto_869816 ?auto_869817 ?auto_869818 ?auto_869819 ?auto_869820 ?auto_869821 ?auto_869822 ?auto_869823 ?auto_869824 ?auto_869825 ?auto_869826 ?auto_869827 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869881 - BLOCK
      ?auto_869882 - BLOCK
      ?auto_869883 - BLOCK
      ?auto_869884 - BLOCK
      ?auto_869885 - BLOCK
      ?auto_869886 - BLOCK
      ?auto_869887 - BLOCK
      ?auto_869888 - BLOCK
      ?auto_869889 - BLOCK
      ?auto_869890 - BLOCK
      ?auto_869891 - BLOCK
      ?auto_869892 - BLOCK
      ?auto_869893 - BLOCK
      ?auto_869894 - BLOCK
      ?auto_869895 - BLOCK
      ?auto_869896 - BLOCK
      ?auto_869897 - BLOCK
    )
    :vars
    (
      ?auto_869898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869897 ?auto_869898 ) ( ON-TABLE ?auto_869881 ) ( ON ?auto_869882 ?auto_869881 ) ( ON ?auto_869883 ?auto_869882 ) ( ON ?auto_869884 ?auto_869883 ) ( ON ?auto_869885 ?auto_869884 ) ( not ( = ?auto_869881 ?auto_869882 ) ) ( not ( = ?auto_869881 ?auto_869883 ) ) ( not ( = ?auto_869881 ?auto_869884 ) ) ( not ( = ?auto_869881 ?auto_869885 ) ) ( not ( = ?auto_869881 ?auto_869886 ) ) ( not ( = ?auto_869881 ?auto_869887 ) ) ( not ( = ?auto_869881 ?auto_869888 ) ) ( not ( = ?auto_869881 ?auto_869889 ) ) ( not ( = ?auto_869881 ?auto_869890 ) ) ( not ( = ?auto_869881 ?auto_869891 ) ) ( not ( = ?auto_869881 ?auto_869892 ) ) ( not ( = ?auto_869881 ?auto_869893 ) ) ( not ( = ?auto_869881 ?auto_869894 ) ) ( not ( = ?auto_869881 ?auto_869895 ) ) ( not ( = ?auto_869881 ?auto_869896 ) ) ( not ( = ?auto_869881 ?auto_869897 ) ) ( not ( = ?auto_869881 ?auto_869898 ) ) ( not ( = ?auto_869882 ?auto_869883 ) ) ( not ( = ?auto_869882 ?auto_869884 ) ) ( not ( = ?auto_869882 ?auto_869885 ) ) ( not ( = ?auto_869882 ?auto_869886 ) ) ( not ( = ?auto_869882 ?auto_869887 ) ) ( not ( = ?auto_869882 ?auto_869888 ) ) ( not ( = ?auto_869882 ?auto_869889 ) ) ( not ( = ?auto_869882 ?auto_869890 ) ) ( not ( = ?auto_869882 ?auto_869891 ) ) ( not ( = ?auto_869882 ?auto_869892 ) ) ( not ( = ?auto_869882 ?auto_869893 ) ) ( not ( = ?auto_869882 ?auto_869894 ) ) ( not ( = ?auto_869882 ?auto_869895 ) ) ( not ( = ?auto_869882 ?auto_869896 ) ) ( not ( = ?auto_869882 ?auto_869897 ) ) ( not ( = ?auto_869882 ?auto_869898 ) ) ( not ( = ?auto_869883 ?auto_869884 ) ) ( not ( = ?auto_869883 ?auto_869885 ) ) ( not ( = ?auto_869883 ?auto_869886 ) ) ( not ( = ?auto_869883 ?auto_869887 ) ) ( not ( = ?auto_869883 ?auto_869888 ) ) ( not ( = ?auto_869883 ?auto_869889 ) ) ( not ( = ?auto_869883 ?auto_869890 ) ) ( not ( = ?auto_869883 ?auto_869891 ) ) ( not ( = ?auto_869883 ?auto_869892 ) ) ( not ( = ?auto_869883 ?auto_869893 ) ) ( not ( = ?auto_869883 ?auto_869894 ) ) ( not ( = ?auto_869883 ?auto_869895 ) ) ( not ( = ?auto_869883 ?auto_869896 ) ) ( not ( = ?auto_869883 ?auto_869897 ) ) ( not ( = ?auto_869883 ?auto_869898 ) ) ( not ( = ?auto_869884 ?auto_869885 ) ) ( not ( = ?auto_869884 ?auto_869886 ) ) ( not ( = ?auto_869884 ?auto_869887 ) ) ( not ( = ?auto_869884 ?auto_869888 ) ) ( not ( = ?auto_869884 ?auto_869889 ) ) ( not ( = ?auto_869884 ?auto_869890 ) ) ( not ( = ?auto_869884 ?auto_869891 ) ) ( not ( = ?auto_869884 ?auto_869892 ) ) ( not ( = ?auto_869884 ?auto_869893 ) ) ( not ( = ?auto_869884 ?auto_869894 ) ) ( not ( = ?auto_869884 ?auto_869895 ) ) ( not ( = ?auto_869884 ?auto_869896 ) ) ( not ( = ?auto_869884 ?auto_869897 ) ) ( not ( = ?auto_869884 ?auto_869898 ) ) ( not ( = ?auto_869885 ?auto_869886 ) ) ( not ( = ?auto_869885 ?auto_869887 ) ) ( not ( = ?auto_869885 ?auto_869888 ) ) ( not ( = ?auto_869885 ?auto_869889 ) ) ( not ( = ?auto_869885 ?auto_869890 ) ) ( not ( = ?auto_869885 ?auto_869891 ) ) ( not ( = ?auto_869885 ?auto_869892 ) ) ( not ( = ?auto_869885 ?auto_869893 ) ) ( not ( = ?auto_869885 ?auto_869894 ) ) ( not ( = ?auto_869885 ?auto_869895 ) ) ( not ( = ?auto_869885 ?auto_869896 ) ) ( not ( = ?auto_869885 ?auto_869897 ) ) ( not ( = ?auto_869885 ?auto_869898 ) ) ( not ( = ?auto_869886 ?auto_869887 ) ) ( not ( = ?auto_869886 ?auto_869888 ) ) ( not ( = ?auto_869886 ?auto_869889 ) ) ( not ( = ?auto_869886 ?auto_869890 ) ) ( not ( = ?auto_869886 ?auto_869891 ) ) ( not ( = ?auto_869886 ?auto_869892 ) ) ( not ( = ?auto_869886 ?auto_869893 ) ) ( not ( = ?auto_869886 ?auto_869894 ) ) ( not ( = ?auto_869886 ?auto_869895 ) ) ( not ( = ?auto_869886 ?auto_869896 ) ) ( not ( = ?auto_869886 ?auto_869897 ) ) ( not ( = ?auto_869886 ?auto_869898 ) ) ( not ( = ?auto_869887 ?auto_869888 ) ) ( not ( = ?auto_869887 ?auto_869889 ) ) ( not ( = ?auto_869887 ?auto_869890 ) ) ( not ( = ?auto_869887 ?auto_869891 ) ) ( not ( = ?auto_869887 ?auto_869892 ) ) ( not ( = ?auto_869887 ?auto_869893 ) ) ( not ( = ?auto_869887 ?auto_869894 ) ) ( not ( = ?auto_869887 ?auto_869895 ) ) ( not ( = ?auto_869887 ?auto_869896 ) ) ( not ( = ?auto_869887 ?auto_869897 ) ) ( not ( = ?auto_869887 ?auto_869898 ) ) ( not ( = ?auto_869888 ?auto_869889 ) ) ( not ( = ?auto_869888 ?auto_869890 ) ) ( not ( = ?auto_869888 ?auto_869891 ) ) ( not ( = ?auto_869888 ?auto_869892 ) ) ( not ( = ?auto_869888 ?auto_869893 ) ) ( not ( = ?auto_869888 ?auto_869894 ) ) ( not ( = ?auto_869888 ?auto_869895 ) ) ( not ( = ?auto_869888 ?auto_869896 ) ) ( not ( = ?auto_869888 ?auto_869897 ) ) ( not ( = ?auto_869888 ?auto_869898 ) ) ( not ( = ?auto_869889 ?auto_869890 ) ) ( not ( = ?auto_869889 ?auto_869891 ) ) ( not ( = ?auto_869889 ?auto_869892 ) ) ( not ( = ?auto_869889 ?auto_869893 ) ) ( not ( = ?auto_869889 ?auto_869894 ) ) ( not ( = ?auto_869889 ?auto_869895 ) ) ( not ( = ?auto_869889 ?auto_869896 ) ) ( not ( = ?auto_869889 ?auto_869897 ) ) ( not ( = ?auto_869889 ?auto_869898 ) ) ( not ( = ?auto_869890 ?auto_869891 ) ) ( not ( = ?auto_869890 ?auto_869892 ) ) ( not ( = ?auto_869890 ?auto_869893 ) ) ( not ( = ?auto_869890 ?auto_869894 ) ) ( not ( = ?auto_869890 ?auto_869895 ) ) ( not ( = ?auto_869890 ?auto_869896 ) ) ( not ( = ?auto_869890 ?auto_869897 ) ) ( not ( = ?auto_869890 ?auto_869898 ) ) ( not ( = ?auto_869891 ?auto_869892 ) ) ( not ( = ?auto_869891 ?auto_869893 ) ) ( not ( = ?auto_869891 ?auto_869894 ) ) ( not ( = ?auto_869891 ?auto_869895 ) ) ( not ( = ?auto_869891 ?auto_869896 ) ) ( not ( = ?auto_869891 ?auto_869897 ) ) ( not ( = ?auto_869891 ?auto_869898 ) ) ( not ( = ?auto_869892 ?auto_869893 ) ) ( not ( = ?auto_869892 ?auto_869894 ) ) ( not ( = ?auto_869892 ?auto_869895 ) ) ( not ( = ?auto_869892 ?auto_869896 ) ) ( not ( = ?auto_869892 ?auto_869897 ) ) ( not ( = ?auto_869892 ?auto_869898 ) ) ( not ( = ?auto_869893 ?auto_869894 ) ) ( not ( = ?auto_869893 ?auto_869895 ) ) ( not ( = ?auto_869893 ?auto_869896 ) ) ( not ( = ?auto_869893 ?auto_869897 ) ) ( not ( = ?auto_869893 ?auto_869898 ) ) ( not ( = ?auto_869894 ?auto_869895 ) ) ( not ( = ?auto_869894 ?auto_869896 ) ) ( not ( = ?auto_869894 ?auto_869897 ) ) ( not ( = ?auto_869894 ?auto_869898 ) ) ( not ( = ?auto_869895 ?auto_869896 ) ) ( not ( = ?auto_869895 ?auto_869897 ) ) ( not ( = ?auto_869895 ?auto_869898 ) ) ( not ( = ?auto_869896 ?auto_869897 ) ) ( not ( = ?auto_869896 ?auto_869898 ) ) ( not ( = ?auto_869897 ?auto_869898 ) ) ( ON ?auto_869896 ?auto_869897 ) ( ON ?auto_869895 ?auto_869896 ) ( ON ?auto_869894 ?auto_869895 ) ( ON ?auto_869893 ?auto_869894 ) ( ON ?auto_869892 ?auto_869893 ) ( ON ?auto_869891 ?auto_869892 ) ( ON ?auto_869890 ?auto_869891 ) ( ON ?auto_869889 ?auto_869890 ) ( ON ?auto_869888 ?auto_869889 ) ( ON ?auto_869887 ?auto_869888 ) ( CLEAR ?auto_869885 ) ( ON ?auto_869886 ?auto_869887 ) ( CLEAR ?auto_869886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_869881 ?auto_869882 ?auto_869883 ?auto_869884 ?auto_869885 ?auto_869886 )
      ( MAKE-17PILE ?auto_869881 ?auto_869882 ?auto_869883 ?auto_869884 ?auto_869885 ?auto_869886 ?auto_869887 ?auto_869888 ?auto_869889 ?auto_869890 ?auto_869891 ?auto_869892 ?auto_869893 ?auto_869894 ?auto_869895 ?auto_869896 ?auto_869897 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_869951 - BLOCK
      ?auto_869952 - BLOCK
      ?auto_869953 - BLOCK
      ?auto_869954 - BLOCK
      ?auto_869955 - BLOCK
      ?auto_869956 - BLOCK
      ?auto_869957 - BLOCK
      ?auto_869958 - BLOCK
      ?auto_869959 - BLOCK
      ?auto_869960 - BLOCK
      ?auto_869961 - BLOCK
      ?auto_869962 - BLOCK
      ?auto_869963 - BLOCK
      ?auto_869964 - BLOCK
      ?auto_869965 - BLOCK
      ?auto_869966 - BLOCK
      ?auto_869967 - BLOCK
    )
    :vars
    (
      ?auto_869968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869967 ?auto_869968 ) ( ON-TABLE ?auto_869951 ) ( ON ?auto_869952 ?auto_869951 ) ( ON ?auto_869953 ?auto_869952 ) ( ON ?auto_869954 ?auto_869953 ) ( not ( = ?auto_869951 ?auto_869952 ) ) ( not ( = ?auto_869951 ?auto_869953 ) ) ( not ( = ?auto_869951 ?auto_869954 ) ) ( not ( = ?auto_869951 ?auto_869955 ) ) ( not ( = ?auto_869951 ?auto_869956 ) ) ( not ( = ?auto_869951 ?auto_869957 ) ) ( not ( = ?auto_869951 ?auto_869958 ) ) ( not ( = ?auto_869951 ?auto_869959 ) ) ( not ( = ?auto_869951 ?auto_869960 ) ) ( not ( = ?auto_869951 ?auto_869961 ) ) ( not ( = ?auto_869951 ?auto_869962 ) ) ( not ( = ?auto_869951 ?auto_869963 ) ) ( not ( = ?auto_869951 ?auto_869964 ) ) ( not ( = ?auto_869951 ?auto_869965 ) ) ( not ( = ?auto_869951 ?auto_869966 ) ) ( not ( = ?auto_869951 ?auto_869967 ) ) ( not ( = ?auto_869951 ?auto_869968 ) ) ( not ( = ?auto_869952 ?auto_869953 ) ) ( not ( = ?auto_869952 ?auto_869954 ) ) ( not ( = ?auto_869952 ?auto_869955 ) ) ( not ( = ?auto_869952 ?auto_869956 ) ) ( not ( = ?auto_869952 ?auto_869957 ) ) ( not ( = ?auto_869952 ?auto_869958 ) ) ( not ( = ?auto_869952 ?auto_869959 ) ) ( not ( = ?auto_869952 ?auto_869960 ) ) ( not ( = ?auto_869952 ?auto_869961 ) ) ( not ( = ?auto_869952 ?auto_869962 ) ) ( not ( = ?auto_869952 ?auto_869963 ) ) ( not ( = ?auto_869952 ?auto_869964 ) ) ( not ( = ?auto_869952 ?auto_869965 ) ) ( not ( = ?auto_869952 ?auto_869966 ) ) ( not ( = ?auto_869952 ?auto_869967 ) ) ( not ( = ?auto_869952 ?auto_869968 ) ) ( not ( = ?auto_869953 ?auto_869954 ) ) ( not ( = ?auto_869953 ?auto_869955 ) ) ( not ( = ?auto_869953 ?auto_869956 ) ) ( not ( = ?auto_869953 ?auto_869957 ) ) ( not ( = ?auto_869953 ?auto_869958 ) ) ( not ( = ?auto_869953 ?auto_869959 ) ) ( not ( = ?auto_869953 ?auto_869960 ) ) ( not ( = ?auto_869953 ?auto_869961 ) ) ( not ( = ?auto_869953 ?auto_869962 ) ) ( not ( = ?auto_869953 ?auto_869963 ) ) ( not ( = ?auto_869953 ?auto_869964 ) ) ( not ( = ?auto_869953 ?auto_869965 ) ) ( not ( = ?auto_869953 ?auto_869966 ) ) ( not ( = ?auto_869953 ?auto_869967 ) ) ( not ( = ?auto_869953 ?auto_869968 ) ) ( not ( = ?auto_869954 ?auto_869955 ) ) ( not ( = ?auto_869954 ?auto_869956 ) ) ( not ( = ?auto_869954 ?auto_869957 ) ) ( not ( = ?auto_869954 ?auto_869958 ) ) ( not ( = ?auto_869954 ?auto_869959 ) ) ( not ( = ?auto_869954 ?auto_869960 ) ) ( not ( = ?auto_869954 ?auto_869961 ) ) ( not ( = ?auto_869954 ?auto_869962 ) ) ( not ( = ?auto_869954 ?auto_869963 ) ) ( not ( = ?auto_869954 ?auto_869964 ) ) ( not ( = ?auto_869954 ?auto_869965 ) ) ( not ( = ?auto_869954 ?auto_869966 ) ) ( not ( = ?auto_869954 ?auto_869967 ) ) ( not ( = ?auto_869954 ?auto_869968 ) ) ( not ( = ?auto_869955 ?auto_869956 ) ) ( not ( = ?auto_869955 ?auto_869957 ) ) ( not ( = ?auto_869955 ?auto_869958 ) ) ( not ( = ?auto_869955 ?auto_869959 ) ) ( not ( = ?auto_869955 ?auto_869960 ) ) ( not ( = ?auto_869955 ?auto_869961 ) ) ( not ( = ?auto_869955 ?auto_869962 ) ) ( not ( = ?auto_869955 ?auto_869963 ) ) ( not ( = ?auto_869955 ?auto_869964 ) ) ( not ( = ?auto_869955 ?auto_869965 ) ) ( not ( = ?auto_869955 ?auto_869966 ) ) ( not ( = ?auto_869955 ?auto_869967 ) ) ( not ( = ?auto_869955 ?auto_869968 ) ) ( not ( = ?auto_869956 ?auto_869957 ) ) ( not ( = ?auto_869956 ?auto_869958 ) ) ( not ( = ?auto_869956 ?auto_869959 ) ) ( not ( = ?auto_869956 ?auto_869960 ) ) ( not ( = ?auto_869956 ?auto_869961 ) ) ( not ( = ?auto_869956 ?auto_869962 ) ) ( not ( = ?auto_869956 ?auto_869963 ) ) ( not ( = ?auto_869956 ?auto_869964 ) ) ( not ( = ?auto_869956 ?auto_869965 ) ) ( not ( = ?auto_869956 ?auto_869966 ) ) ( not ( = ?auto_869956 ?auto_869967 ) ) ( not ( = ?auto_869956 ?auto_869968 ) ) ( not ( = ?auto_869957 ?auto_869958 ) ) ( not ( = ?auto_869957 ?auto_869959 ) ) ( not ( = ?auto_869957 ?auto_869960 ) ) ( not ( = ?auto_869957 ?auto_869961 ) ) ( not ( = ?auto_869957 ?auto_869962 ) ) ( not ( = ?auto_869957 ?auto_869963 ) ) ( not ( = ?auto_869957 ?auto_869964 ) ) ( not ( = ?auto_869957 ?auto_869965 ) ) ( not ( = ?auto_869957 ?auto_869966 ) ) ( not ( = ?auto_869957 ?auto_869967 ) ) ( not ( = ?auto_869957 ?auto_869968 ) ) ( not ( = ?auto_869958 ?auto_869959 ) ) ( not ( = ?auto_869958 ?auto_869960 ) ) ( not ( = ?auto_869958 ?auto_869961 ) ) ( not ( = ?auto_869958 ?auto_869962 ) ) ( not ( = ?auto_869958 ?auto_869963 ) ) ( not ( = ?auto_869958 ?auto_869964 ) ) ( not ( = ?auto_869958 ?auto_869965 ) ) ( not ( = ?auto_869958 ?auto_869966 ) ) ( not ( = ?auto_869958 ?auto_869967 ) ) ( not ( = ?auto_869958 ?auto_869968 ) ) ( not ( = ?auto_869959 ?auto_869960 ) ) ( not ( = ?auto_869959 ?auto_869961 ) ) ( not ( = ?auto_869959 ?auto_869962 ) ) ( not ( = ?auto_869959 ?auto_869963 ) ) ( not ( = ?auto_869959 ?auto_869964 ) ) ( not ( = ?auto_869959 ?auto_869965 ) ) ( not ( = ?auto_869959 ?auto_869966 ) ) ( not ( = ?auto_869959 ?auto_869967 ) ) ( not ( = ?auto_869959 ?auto_869968 ) ) ( not ( = ?auto_869960 ?auto_869961 ) ) ( not ( = ?auto_869960 ?auto_869962 ) ) ( not ( = ?auto_869960 ?auto_869963 ) ) ( not ( = ?auto_869960 ?auto_869964 ) ) ( not ( = ?auto_869960 ?auto_869965 ) ) ( not ( = ?auto_869960 ?auto_869966 ) ) ( not ( = ?auto_869960 ?auto_869967 ) ) ( not ( = ?auto_869960 ?auto_869968 ) ) ( not ( = ?auto_869961 ?auto_869962 ) ) ( not ( = ?auto_869961 ?auto_869963 ) ) ( not ( = ?auto_869961 ?auto_869964 ) ) ( not ( = ?auto_869961 ?auto_869965 ) ) ( not ( = ?auto_869961 ?auto_869966 ) ) ( not ( = ?auto_869961 ?auto_869967 ) ) ( not ( = ?auto_869961 ?auto_869968 ) ) ( not ( = ?auto_869962 ?auto_869963 ) ) ( not ( = ?auto_869962 ?auto_869964 ) ) ( not ( = ?auto_869962 ?auto_869965 ) ) ( not ( = ?auto_869962 ?auto_869966 ) ) ( not ( = ?auto_869962 ?auto_869967 ) ) ( not ( = ?auto_869962 ?auto_869968 ) ) ( not ( = ?auto_869963 ?auto_869964 ) ) ( not ( = ?auto_869963 ?auto_869965 ) ) ( not ( = ?auto_869963 ?auto_869966 ) ) ( not ( = ?auto_869963 ?auto_869967 ) ) ( not ( = ?auto_869963 ?auto_869968 ) ) ( not ( = ?auto_869964 ?auto_869965 ) ) ( not ( = ?auto_869964 ?auto_869966 ) ) ( not ( = ?auto_869964 ?auto_869967 ) ) ( not ( = ?auto_869964 ?auto_869968 ) ) ( not ( = ?auto_869965 ?auto_869966 ) ) ( not ( = ?auto_869965 ?auto_869967 ) ) ( not ( = ?auto_869965 ?auto_869968 ) ) ( not ( = ?auto_869966 ?auto_869967 ) ) ( not ( = ?auto_869966 ?auto_869968 ) ) ( not ( = ?auto_869967 ?auto_869968 ) ) ( ON ?auto_869966 ?auto_869967 ) ( ON ?auto_869965 ?auto_869966 ) ( ON ?auto_869964 ?auto_869965 ) ( ON ?auto_869963 ?auto_869964 ) ( ON ?auto_869962 ?auto_869963 ) ( ON ?auto_869961 ?auto_869962 ) ( ON ?auto_869960 ?auto_869961 ) ( ON ?auto_869959 ?auto_869960 ) ( ON ?auto_869958 ?auto_869959 ) ( ON ?auto_869957 ?auto_869958 ) ( ON ?auto_869956 ?auto_869957 ) ( CLEAR ?auto_869954 ) ( ON ?auto_869955 ?auto_869956 ) ( CLEAR ?auto_869955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_869951 ?auto_869952 ?auto_869953 ?auto_869954 ?auto_869955 )
      ( MAKE-17PILE ?auto_869951 ?auto_869952 ?auto_869953 ?auto_869954 ?auto_869955 ?auto_869956 ?auto_869957 ?auto_869958 ?auto_869959 ?auto_869960 ?auto_869961 ?auto_869962 ?auto_869963 ?auto_869964 ?auto_869965 ?auto_869966 ?auto_869967 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_870021 - BLOCK
      ?auto_870022 - BLOCK
      ?auto_870023 - BLOCK
      ?auto_870024 - BLOCK
      ?auto_870025 - BLOCK
      ?auto_870026 - BLOCK
      ?auto_870027 - BLOCK
      ?auto_870028 - BLOCK
      ?auto_870029 - BLOCK
      ?auto_870030 - BLOCK
      ?auto_870031 - BLOCK
      ?auto_870032 - BLOCK
      ?auto_870033 - BLOCK
      ?auto_870034 - BLOCK
      ?auto_870035 - BLOCK
      ?auto_870036 - BLOCK
      ?auto_870037 - BLOCK
    )
    :vars
    (
      ?auto_870038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870037 ?auto_870038 ) ( ON-TABLE ?auto_870021 ) ( ON ?auto_870022 ?auto_870021 ) ( ON ?auto_870023 ?auto_870022 ) ( not ( = ?auto_870021 ?auto_870022 ) ) ( not ( = ?auto_870021 ?auto_870023 ) ) ( not ( = ?auto_870021 ?auto_870024 ) ) ( not ( = ?auto_870021 ?auto_870025 ) ) ( not ( = ?auto_870021 ?auto_870026 ) ) ( not ( = ?auto_870021 ?auto_870027 ) ) ( not ( = ?auto_870021 ?auto_870028 ) ) ( not ( = ?auto_870021 ?auto_870029 ) ) ( not ( = ?auto_870021 ?auto_870030 ) ) ( not ( = ?auto_870021 ?auto_870031 ) ) ( not ( = ?auto_870021 ?auto_870032 ) ) ( not ( = ?auto_870021 ?auto_870033 ) ) ( not ( = ?auto_870021 ?auto_870034 ) ) ( not ( = ?auto_870021 ?auto_870035 ) ) ( not ( = ?auto_870021 ?auto_870036 ) ) ( not ( = ?auto_870021 ?auto_870037 ) ) ( not ( = ?auto_870021 ?auto_870038 ) ) ( not ( = ?auto_870022 ?auto_870023 ) ) ( not ( = ?auto_870022 ?auto_870024 ) ) ( not ( = ?auto_870022 ?auto_870025 ) ) ( not ( = ?auto_870022 ?auto_870026 ) ) ( not ( = ?auto_870022 ?auto_870027 ) ) ( not ( = ?auto_870022 ?auto_870028 ) ) ( not ( = ?auto_870022 ?auto_870029 ) ) ( not ( = ?auto_870022 ?auto_870030 ) ) ( not ( = ?auto_870022 ?auto_870031 ) ) ( not ( = ?auto_870022 ?auto_870032 ) ) ( not ( = ?auto_870022 ?auto_870033 ) ) ( not ( = ?auto_870022 ?auto_870034 ) ) ( not ( = ?auto_870022 ?auto_870035 ) ) ( not ( = ?auto_870022 ?auto_870036 ) ) ( not ( = ?auto_870022 ?auto_870037 ) ) ( not ( = ?auto_870022 ?auto_870038 ) ) ( not ( = ?auto_870023 ?auto_870024 ) ) ( not ( = ?auto_870023 ?auto_870025 ) ) ( not ( = ?auto_870023 ?auto_870026 ) ) ( not ( = ?auto_870023 ?auto_870027 ) ) ( not ( = ?auto_870023 ?auto_870028 ) ) ( not ( = ?auto_870023 ?auto_870029 ) ) ( not ( = ?auto_870023 ?auto_870030 ) ) ( not ( = ?auto_870023 ?auto_870031 ) ) ( not ( = ?auto_870023 ?auto_870032 ) ) ( not ( = ?auto_870023 ?auto_870033 ) ) ( not ( = ?auto_870023 ?auto_870034 ) ) ( not ( = ?auto_870023 ?auto_870035 ) ) ( not ( = ?auto_870023 ?auto_870036 ) ) ( not ( = ?auto_870023 ?auto_870037 ) ) ( not ( = ?auto_870023 ?auto_870038 ) ) ( not ( = ?auto_870024 ?auto_870025 ) ) ( not ( = ?auto_870024 ?auto_870026 ) ) ( not ( = ?auto_870024 ?auto_870027 ) ) ( not ( = ?auto_870024 ?auto_870028 ) ) ( not ( = ?auto_870024 ?auto_870029 ) ) ( not ( = ?auto_870024 ?auto_870030 ) ) ( not ( = ?auto_870024 ?auto_870031 ) ) ( not ( = ?auto_870024 ?auto_870032 ) ) ( not ( = ?auto_870024 ?auto_870033 ) ) ( not ( = ?auto_870024 ?auto_870034 ) ) ( not ( = ?auto_870024 ?auto_870035 ) ) ( not ( = ?auto_870024 ?auto_870036 ) ) ( not ( = ?auto_870024 ?auto_870037 ) ) ( not ( = ?auto_870024 ?auto_870038 ) ) ( not ( = ?auto_870025 ?auto_870026 ) ) ( not ( = ?auto_870025 ?auto_870027 ) ) ( not ( = ?auto_870025 ?auto_870028 ) ) ( not ( = ?auto_870025 ?auto_870029 ) ) ( not ( = ?auto_870025 ?auto_870030 ) ) ( not ( = ?auto_870025 ?auto_870031 ) ) ( not ( = ?auto_870025 ?auto_870032 ) ) ( not ( = ?auto_870025 ?auto_870033 ) ) ( not ( = ?auto_870025 ?auto_870034 ) ) ( not ( = ?auto_870025 ?auto_870035 ) ) ( not ( = ?auto_870025 ?auto_870036 ) ) ( not ( = ?auto_870025 ?auto_870037 ) ) ( not ( = ?auto_870025 ?auto_870038 ) ) ( not ( = ?auto_870026 ?auto_870027 ) ) ( not ( = ?auto_870026 ?auto_870028 ) ) ( not ( = ?auto_870026 ?auto_870029 ) ) ( not ( = ?auto_870026 ?auto_870030 ) ) ( not ( = ?auto_870026 ?auto_870031 ) ) ( not ( = ?auto_870026 ?auto_870032 ) ) ( not ( = ?auto_870026 ?auto_870033 ) ) ( not ( = ?auto_870026 ?auto_870034 ) ) ( not ( = ?auto_870026 ?auto_870035 ) ) ( not ( = ?auto_870026 ?auto_870036 ) ) ( not ( = ?auto_870026 ?auto_870037 ) ) ( not ( = ?auto_870026 ?auto_870038 ) ) ( not ( = ?auto_870027 ?auto_870028 ) ) ( not ( = ?auto_870027 ?auto_870029 ) ) ( not ( = ?auto_870027 ?auto_870030 ) ) ( not ( = ?auto_870027 ?auto_870031 ) ) ( not ( = ?auto_870027 ?auto_870032 ) ) ( not ( = ?auto_870027 ?auto_870033 ) ) ( not ( = ?auto_870027 ?auto_870034 ) ) ( not ( = ?auto_870027 ?auto_870035 ) ) ( not ( = ?auto_870027 ?auto_870036 ) ) ( not ( = ?auto_870027 ?auto_870037 ) ) ( not ( = ?auto_870027 ?auto_870038 ) ) ( not ( = ?auto_870028 ?auto_870029 ) ) ( not ( = ?auto_870028 ?auto_870030 ) ) ( not ( = ?auto_870028 ?auto_870031 ) ) ( not ( = ?auto_870028 ?auto_870032 ) ) ( not ( = ?auto_870028 ?auto_870033 ) ) ( not ( = ?auto_870028 ?auto_870034 ) ) ( not ( = ?auto_870028 ?auto_870035 ) ) ( not ( = ?auto_870028 ?auto_870036 ) ) ( not ( = ?auto_870028 ?auto_870037 ) ) ( not ( = ?auto_870028 ?auto_870038 ) ) ( not ( = ?auto_870029 ?auto_870030 ) ) ( not ( = ?auto_870029 ?auto_870031 ) ) ( not ( = ?auto_870029 ?auto_870032 ) ) ( not ( = ?auto_870029 ?auto_870033 ) ) ( not ( = ?auto_870029 ?auto_870034 ) ) ( not ( = ?auto_870029 ?auto_870035 ) ) ( not ( = ?auto_870029 ?auto_870036 ) ) ( not ( = ?auto_870029 ?auto_870037 ) ) ( not ( = ?auto_870029 ?auto_870038 ) ) ( not ( = ?auto_870030 ?auto_870031 ) ) ( not ( = ?auto_870030 ?auto_870032 ) ) ( not ( = ?auto_870030 ?auto_870033 ) ) ( not ( = ?auto_870030 ?auto_870034 ) ) ( not ( = ?auto_870030 ?auto_870035 ) ) ( not ( = ?auto_870030 ?auto_870036 ) ) ( not ( = ?auto_870030 ?auto_870037 ) ) ( not ( = ?auto_870030 ?auto_870038 ) ) ( not ( = ?auto_870031 ?auto_870032 ) ) ( not ( = ?auto_870031 ?auto_870033 ) ) ( not ( = ?auto_870031 ?auto_870034 ) ) ( not ( = ?auto_870031 ?auto_870035 ) ) ( not ( = ?auto_870031 ?auto_870036 ) ) ( not ( = ?auto_870031 ?auto_870037 ) ) ( not ( = ?auto_870031 ?auto_870038 ) ) ( not ( = ?auto_870032 ?auto_870033 ) ) ( not ( = ?auto_870032 ?auto_870034 ) ) ( not ( = ?auto_870032 ?auto_870035 ) ) ( not ( = ?auto_870032 ?auto_870036 ) ) ( not ( = ?auto_870032 ?auto_870037 ) ) ( not ( = ?auto_870032 ?auto_870038 ) ) ( not ( = ?auto_870033 ?auto_870034 ) ) ( not ( = ?auto_870033 ?auto_870035 ) ) ( not ( = ?auto_870033 ?auto_870036 ) ) ( not ( = ?auto_870033 ?auto_870037 ) ) ( not ( = ?auto_870033 ?auto_870038 ) ) ( not ( = ?auto_870034 ?auto_870035 ) ) ( not ( = ?auto_870034 ?auto_870036 ) ) ( not ( = ?auto_870034 ?auto_870037 ) ) ( not ( = ?auto_870034 ?auto_870038 ) ) ( not ( = ?auto_870035 ?auto_870036 ) ) ( not ( = ?auto_870035 ?auto_870037 ) ) ( not ( = ?auto_870035 ?auto_870038 ) ) ( not ( = ?auto_870036 ?auto_870037 ) ) ( not ( = ?auto_870036 ?auto_870038 ) ) ( not ( = ?auto_870037 ?auto_870038 ) ) ( ON ?auto_870036 ?auto_870037 ) ( ON ?auto_870035 ?auto_870036 ) ( ON ?auto_870034 ?auto_870035 ) ( ON ?auto_870033 ?auto_870034 ) ( ON ?auto_870032 ?auto_870033 ) ( ON ?auto_870031 ?auto_870032 ) ( ON ?auto_870030 ?auto_870031 ) ( ON ?auto_870029 ?auto_870030 ) ( ON ?auto_870028 ?auto_870029 ) ( ON ?auto_870027 ?auto_870028 ) ( ON ?auto_870026 ?auto_870027 ) ( ON ?auto_870025 ?auto_870026 ) ( CLEAR ?auto_870023 ) ( ON ?auto_870024 ?auto_870025 ) ( CLEAR ?auto_870024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_870021 ?auto_870022 ?auto_870023 ?auto_870024 )
      ( MAKE-17PILE ?auto_870021 ?auto_870022 ?auto_870023 ?auto_870024 ?auto_870025 ?auto_870026 ?auto_870027 ?auto_870028 ?auto_870029 ?auto_870030 ?auto_870031 ?auto_870032 ?auto_870033 ?auto_870034 ?auto_870035 ?auto_870036 ?auto_870037 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_870091 - BLOCK
      ?auto_870092 - BLOCK
      ?auto_870093 - BLOCK
      ?auto_870094 - BLOCK
      ?auto_870095 - BLOCK
      ?auto_870096 - BLOCK
      ?auto_870097 - BLOCK
      ?auto_870098 - BLOCK
      ?auto_870099 - BLOCK
      ?auto_870100 - BLOCK
      ?auto_870101 - BLOCK
      ?auto_870102 - BLOCK
      ?auto_870103 - BLOCK
      ?auto_870104 - BLOCK
      ?auto_870105 - BLOCK
      ?auto_870106 - BLOCK
      ?auto_870107 - BLOCK
    )
    :vars
    (
      ?auto_870108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870107 ?auto_870108 ) ( ON-TABLE ?auto_870091 ) ( ON ?auto_870092 ?auto_870091 ) ( not ( = ?auto_870091 ?auto_870092 ) ) ( not ( = ?auto_870091 ?auto_870093 ) ) ( not ( = ?auto_870091 ?auto_870094 ) ) ( not ( = ?auto_870091 ?auto_870095 ) ) ( not ( = ?auto_870091 ?auto_870096 ) ) ( not ( = ?auto_870091 ?auto_870097 ) ) ( not ( = ?auto_870091 ?auto_870098 ) ) ( not ( = ?auto_870091 ?auto_870099 ) ) ( not ( = ?auto_870091 ?auto_870100 ) ) ( not ( = ?auto_870091 ?auto_870101 ) ) ( not ( = ?auto_870091 ?auto_870102 ) ) ( not ( = ?auto_870091 ?auto_870103 ) ) ( not ( = ?auto_870091 ?auto_870104 ) ) ( not ( = ?auto_870091 ?auto_870105 ) ) ( not ( = ?auto_870091 ?auto_870106 ) ) ( not ( = ?auto_870091 ?auto_870107 ) ) ( not ( = ?auto_870091 ?auto_870108 ) ) ( not ( = ?auto_870092 ?auto_870093 ) ) ( not ( = ?auto_870092 ?auto_870094 ) ) ( not ( = ?auto_870092 ?auto_870095 ) ) ( not ( = ?auto_870092 ?auto_870096 ) ) ( not ( = ?auto_870092 ?auto_870097 ) ) ( not ( = ?auto_870092 ?auto_870098 ) ) ( not ( = ?auto_870092 ?auto_870099 ) ) ( not ( = ?auto_870092 ?auto_870100 ) ) ( not ( = ?auto_870092 ?auto_870101 ) ) ( not ( = ?auto_870092 ?auto_870102 ) ) ( not ( = ?auto_870092 ?auto_870103 ) ) ( not ( = ?auto_870092 ?auto_870104 ) ) ( not ( = ?auto_870092 ?auto_870105 ) ) ( not ( = ?auto_870092 ?auto_870106 ) ) ( not ( = ?auto_870092 ?auto_870107 ) ) ( not ( = ?auto_870092 ?auto_870108 ) ) ( not ( = ?auto_870093 ?auto_870094 ) ) ( not ( = ?auto_870093 ?auto_870095 ) ) ( not ( = ?auto_870093 ?auto_870096 ) ) ( not ( = ?auto_870093 ?auto_870097 ) ) ( not ( = ?auto_870093 ?auto_870098 ) ) ( not ( = ?auto_870093 ?auto_870099 ) ) ( not ( = ?auto_870093 ?auto_870100 ) ) ( not ( = ?auto_870093 ?auto_870101 ) ) ( not ( = ?auto_870093 ?auto_870102 ) ) ( not ( = ?auto_870093 ?auto_870103 ) ) ( not ( = ?auto_870093 ?auto_870104 ) ) ( not ( = ?auto_870093 ?auto_870105 ) ) ( not ( = ?auto_870093 ?auto_870106 ) ) ( not ( = ?auto_870093 ?auto_870107 ) ) ( not ( = ?auto_870093 ?auto_870108 ) ) ( not ( = ?auto_870094 ?auto_870095 ) ) ( not ( = ?auto_870094 ?auto_870096 ) ) ( not ( = ?auto_870094 ?auto_870097 ) ) ( not ( = ?auto_870094 ?auto_870098 ) ) ( not ( = ?auto_870094 ?auto_870099 ) ) ( not ( = ?auto_870094 ?auto_870100 ) ) ( not ( = ?auto_870094 ?auto_870101 ) ) ( not ( = ?auto_870094 ?auto_870102 ) ) ( not ( = ?auto_870094 ?auto_870103 ) ) ( not ( = ?auto_870094 ?auto_870104 ) ) ( not ( = ?auto_870094 ?auto_870105 ) ) ( not ( = ?auto_870094 ?auto_870106 ) ) ( not ( = ?auto_870094 ?auto_870107 ) ) ( not ( = ?auto_870094 ?auto_870108 ) ) ( not ( = ?auto_870095 ?auto_870096 ) ) ( not ( = ?auto_870095 ?auto_870097 ) ) ( not ( = ?auto_870095 ?auto_870098 ) ) ( not ( = ?auto_870095 ?auto_870099 ) ) ( not ( = ?auto_870095 ?auto_870100 ) ) ( not ( = ?auto_870095 ?auto_870101 ) ) ( not ( = ?auto_870095 ?auto_870102 ) ) ( not ( = ?auto_870095 ?auto_870103 ) ) ( not ( = ?auto_870095 ?auto_870104 ) ) ( not ( = ?auto_870095 ?auto_870105 ) ) ( not ( = ?auto_870095 ?auto_870106 ) ) ( not ( = ?auto_870095 ?auto_870107 ) ) ( not ( = ?auto_870095 ?auto_870108 ) ) ( not ( = ?auto_870096 ?auto_870097 ) ) ( not ( = ?auto_870096 ?auto_870098 ) ) ( not ( = ?auto_870096 ?auto_870099 ) ) ( not ( = ?auto_870096 ?auto_870100 ) ) ( not ( = ?auto_870096 ?auto_870101 ) ) ( not ( = ?auto_870096 ?auto_870102 ) ) ( not ( = ?auto_870096 ?auto_870103 ) ) ( not ( = ?auto_870096 ?auto_870104 ) ) ( not ( = ?auto_870096 ?auto_870105 ) ) ( not ( = ?auto_870096 ?auto_870106 ) ) ( not ( = ?auto_870096 ?auto_870107 ) ) ( not ( = ?auto_870096 ?auto_870108 ) ) ( not ( = ?auto_870097 ?auto_870098 ) ) ( not ( = ?auto_870097 ?auto_870099 ) ) ( not ( = ?auto_870097 ?auto_870100 ) ) ( not ( = ?auto_870097 ?auto_870101 ) ) ( not ( = ?auto_870097 ?auto_870102 ) ) ( not ( = ?auto_870097 ?auto_870103 ) ) ( not ( = ?auto_870097 ?auto_870104 ) ) ( not ( = ?auto_870097 ?auto_870105 ) ) ( not ( = ?auto_870097 ?auto_870106 ) ) ( not ( = ?auto_870097 ?auto_870107 ) ) ( not ( = ?auto_870097 ?auto_870108 ) ) ( not ( = ?auto_870098 ?auto_870099 ) ) ( not ( = ?auto_870098 ?auto_870100 ) ) ( not ( = ?auto_870098 ?auto_870101 ) ) ( not ( = ?auto_870098 ?auto_870102 ) ) ( not ( = ?auto_870098 ?auto_870103 ) ) ( not ( = ?auto_870098 ?auto_870104 ) ) ( not ( = ?auto_870098 ?auto_870105 ) ) ( not ( = ?auto_870098 ?auto_870106 ) ) ( not ( = ?auto_870098 ?auto_870107 ) ) ( not ( = ?auto_870098 ?auto_870108 ) ) ( not ( = ?auto_870099 ?auto_870100 ) ) ( not ( = ?auto_870099 ?auto_870101 ) ) ( not ( = ?auto_870099 ?auto_870102 ) ) ( not ( = ?auto_870099 ?auto_870103 ) ) ( not ( = ?auto_870099 ?auto_870104 ) ) ( not ( = ?auto_870099 ?auto_870105 ) ) ( not ( = ?auto_870099 ?auto_870106 ) ) ( not ( = ?auto_870099 ?auto_870107 ) ) ( not ( = ?auto_870099 ?auto_870108 ) ) ( not ( = ?auto_870100 ?auto_870101 ) ) ( not ( = ?auto_870100 ?auto_870102 ) ) ( not ( = ?auto_870100 ?auto_870103 ) ) ( not ( = ?auto_870100 ?auto_870104 ) ) ( not ( = ?auto_870100 ?auto_870105 ) ) ( not ( = ?auto_870100 ?auto_870106 ) ) ( not ( = ?auto_870100 ?auto_870107 ) ) ( not ( = ?auto_870100 ?auto_870108 ) ) ( not ( = ?auto_870101 ?auto_870102 ) ) ( not ( = ?auto_870101 ?auto_870103 ) ) ( not ( = ?auto_870101 ?auto_870104 ) ) ( not ( = ?auto_870101 ?auto_870105 ) ) ( not ( = ?auto_870101 ?auto_870106 ) ) ( not ( = ?auto_870101 ?auto_870107 ) ) ( not ( = ?auto_870101 ?auto_870108 ) ) ( not ( = ?auto_870102 ?auto_870103 ) ) ( not ( = ?auto_870102 ?auto_870104 ) ) ( not ( = ?auto_870102 ?auto_870105 ) ) ( not ( = ?auto_870102 ?auto_870106 ) ) ( not ( = ?auto_870102 ?auto_870107 ) ) ( not ( = ?auto_870102 ?auto_870108 ) ) ( not ( = ?auto_870103 ?auto_870104 ) ) ( not ( = ?auto_870103 ?auto_870105 ) ) ( not ( = ?auto_870103 ?auto_870106 ) ) ( not ( = ?auto_870103 ?auto_870107 ) ) ( not ( = ?auto_870103 ?auto_870108 ) ) ( not ( = ?auto_870104 ?auto_870105 ) ) ( not ( = ?auto_870104 ?auto_870106 ) ) ( not ( = ?auto_870104 ?auto_870107 ) ) ( not ( = ?auto_870104 ?auto_870108 ) ) ( not ( = ?auto_870105 ?auto_870106 ) ) ( not ( = ?auto_870105 ?auto_870107 ) ) ( not ( = ?auto_870105 ?auto_870108 ) ) ( not ( = ?auto_870106 ?auto_870107 ) ) ( not ( = ?auto_870106 ?auto_870108 ) ) ( not ( = ?auto_870107 ?auto_870108 ) ) ( ON ?auto_870106 ?auto_870107 ) ( ON ?auto_870105 ?auto_870106 ) ( ON ?auto_870104 ?auto_870105 ) ( ON ?auto_870103 ?auto_870104 ) ( ON ?auto_870102 ?auto_870103 ) ( ON ?auto_870101 ?auto_870102 ) ( ON ?auto_870100 ?auto_870101 ) ( ON ?auto_870099 ?auto_870100 ) ( ON ?auto_870098 ?auto_870099 ) ( ON ?auto_870097 ?auto_870098 ) ( ON ?auto_870096 ?auto_870097 ) ( ON ?auto_870095 ?auto_870096 ) ( ON ?auto_870094 ?auto_870095 ) ( CLEAR ?auto_870092 ) ( ON ?auto_870093 ?auto_870094 ) ( CLEAR ?auto_870093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_870091 ?auto_870092 ?auto_870093 )
      ( MAKE-17PILE ?auto_870091 ?auto_870092 ?auto_870093 ?auto_870094 ?auto_870095 ?auto_870096 ?auto_870097 ?auto_870098 ?auto_870099 ?auto_870100 ?auto_870101 ?auto_870102 ?auto_870103 ?auto_870104 ?auto_870105 ?auto_870106 ?auto_870107 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_870161 - BLOCK
      ?auto_870162 - BLOCK
      ?auto_870163 - BLOCK
      ?auto_870164 - BLOCK
      ?auto_870165 - BLOCK
      ?auto_870166 - BLOCK
      ?auto_870167 - BLOCK
      ?auto_870168 - BLOCK
      ?auto_870169 - BLOCK
      ?auto_870170 - BLOCK
      ?auto_870171 - BLOCK
      ?auto_870172 - BLOCK
      ?auto_870173 - BLOCK
      ?auto_870174 - BLOCK
      ?auto_870175 - BLOCK
      ?auto_870176 - BLOCK
      ?auto_870177 - BLOCK
    )
    :vars
    (
      ?auto_870178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870177 ?auto_870178 ) ( ON-TABLE ?auto_870161 ) ( not ( = ?auto_870161 ?auto_870162 ) ) ( not ( = ?auto_870161 ?auto_870163 ) ) ( not ( = ?auto_870161 ?auto_870164 ) ) ( not ( = ?auto_870161 ?auto_870165 ) ) ( not ( = ?auto_870161 ?auto_870166 ) ) ( not ( = ?auto_870161 ?auto_870167 ) ) ( not ( = ?auto_870161 ?auto_870168 ) ) ( not ( = ?auto_870161 ?auto_870169 ) ) ( not ( = ?auto_870161 ?auto_870170 ) ) ( not ( = ?auto_870161 ?auto_870171 ) ) ( not ( = ?auto_870161 ?auto_870172 ) ) ( not ( = ?auto_870161 ?auto_870173 ) ) ( not ( = ?auto_870161 ?auto_870174 ) ) ( not ( = ?auto_870161 ?auto_870175 ) ) ( not ( = ?auto_870161 ?auto_870176 ) ) ( not ( = ?auto_870161 ?auto_870177 ) ) ( not ( = ?auto_870161 ?auto_870178 ) ) ( not ( = ?auto_870162 ?auto_870163 ) ) ( not ( = ?auto_870162 ?auto_870164 ) ) ( not ( = ?auto_870162 ?auto_870165 ) ) ( not ( = ?auto_870162 ?auto_870166 ) ) ( not ( = ?auto_870162 ?auto_870167 ) ) ( not ( = ?auto_870162 ?auto_870168 ) ) ( not ( = ?auto_870162 ?auto_870169 ) ) ( not ( = ?auto_870162 ?auto_870170 ) ) ( not ( = ?auto_870162 ?auto_870171 ) ) ( not ( = ?auto_870162 ?auto_870172 ) ) ( not ( = ?auto_870162 ?auto_870173 ) ) ( not ( = ?auto_870162 ?auto_870174 ) ) ( not ( = ?auto_870162 ?auto_870175 ) ) ( not ( = ?auto_870162 ?auto_870176 ) ) ( not ( = ?auto_870162 ?auto_870177 ) ) ( not ( = ?auto_870162 ?auto_870178 ) ) ( not ( = ?auto_870163 ?auto_870164 ) ) ( not ( = ?auto_870163 ?auto_870165 ) ) ( not ( = ?auto_870163 ?auto_870166 ) ) ( not ( = ?auto_870163 ?auto_870167 ) ) ( not ( = ?auto_870163 ?auto_870168 ) ) ( not ( = ?auto_870163 ?auto_870169 ) ) ( not ( = ?auto_870163 ?auto_870170 ) ) ( not ( = ?auto_870163 ?auto_870171 ) ) ( not ( = ?auto_870163 ?auto_870172 ) ) ( not ( = ?auto_870163 ?auto_870173 ) ) ( not ( = ?auto_870163 ?auto_870174 ) ) ( not ( = ?auto_870163 ?auto_870175 ) ) ( not ( = ?auto_870163 ?auto_870176 ) ) ( not ( = ?auto_870163 ?auto_870177 ) ) ( not ( = ?auto_870163 ?auto_870178 ) ) ( not ( = ?auto_870164 ?auto_870165 ) ) ( not ( = ?auto_870164 ?auto_870166 ) ) ( not ( = ?auto_870164 ?auto_870167 ) ) ( not ( = ?auto_870164 ?auto_870168 ) ) ( not ( = ?auto_870164 ?auto_870169 ) ) ( not ( = ?auto_870164 ?auto_870170 ) ) ( not ( = ?auto_870164 ?auto_870171 ) ) ( not ( = ?auto_870164 ?auto_870172 ) ) ( not ( = ?auto_870164 ?auto_870173 ) ) ( not ( = ?auto_870164 ?auto_870174 ) ) ( not ( = ?auto_870164 ?auto_870175 ) ) ( not ( = ?auto_870164 ?auto_870176 ) ) ( not ( = ?auto_870164 ?auto_870177 ) ) ( not ( = ?auto_870164 ?auto_870178 ) ) ( not ( = ?auto_870165 ?auto_870166 ) ) ( not ( = ?auto_870165 ?auto_870167 ) ) ( not ( = ?auto_870165 ?auto_870168 ) ) ( not ( = ?auto_870165 ?auto_870169 ) ) ( not ( = ?auto_870165 ?auto_870170 ) ) ( not ( = ?auto_870165 ?auto_870171 ) ) ( not ( = ?auto_870165 ?auto_870172 ) ) ( not ( = ?auto_870165 ?auto_870173 ) ) ( not ( = ?auto_870165 ?auto_870174 ) ) ( not ( = ?auto_870165 ?auto_870175 ) ) ( not ( = ?auto_870165 ?auto_870176 ) ) ( not ( = ?auto_870165 ?auto_870177 ) ) ( not ( = ?auto_870165 ?auto_870178 ) ) ( not ( = ?auto_870166 ?auto_870167 ) ) ( not ( = ?auto_870166 ?auto_870168 ) ) ( not ( = ?auto_870166 ?auto_870169 ) ) ( not ( = ?auto_870166 ?auto_870170 ) ) ( not ( = ?auto_870166 ?auto_870171 ) ) ( not ( = ?auto_870166 ?auto_870172 ) ) ( not ( = ?auto_870166 ?auto_870173 ) ) ( not ( = ?auto_870166 ?auto_870174 ) ) ( not ( = ?auto_870166 ?auto_870175 ) ) ( not ( = ?auto_870166 ?auto_870176 ) ) ( not ( = ?auto_870166 ?auto_870177 ) ) ( not ( = ?auto_870166 ?auto_870178 ) ) ( not ( = ?auto_870167 ?auto_870168 ) ) ( not ( = ?auto_870167 ?auto_870169 ) ) ( not ( = ?auto_870167 ?auto_870170 ) ) ( not ( = ?auto_870167 ?auto_870171 ) ) ( not ( = ?auto_870167 ?auto_870172 ) ) ( not ( = ?auto_870167 ?auto_870173 ) ) ( not ( = ?auto_870167 ?auto_870174 ) ) ( not ( = ?auto_870167 ?auto_870175 ) ) ( not ( = ?auto_870167 ?auto_870176 ) ) ( not ( = ?auto_870167 ?auto_870177 ) ) ( not ( = ?auto_870167 ?auto_870178 ) ) ( not ( = ?auto_870168 ?auto_870169 ) ) ( not ( = ?auto_870168 ?auto_870170 ) ) ( not ( = ?auto_870168 ?auto_870171 ) ) ( not ( = ?auto_870168 ?auto_870172 ) ) ( not ( = ?auto_870168 ?auto_870173 ) ) ( not ( = ?auto_870168 ?auto_870174 ) ) ( not ( = ?auto_870168 ?auto_870175 ) ) ( not ( = ?auto_870168 ?auto_870176 ) ) ( not ( = ?auto_870168 ?auto_870177 ) ) ( not ( = ?auto_870168 ?auto_870178 ) ) ( not ( = ?auto_870169 ?auto_870170 ) ) ( not ( = ?auto_870169 ?auto_870171 ) ) ( not ( = ?auto_870169 ?auto_870172 ) ) ( not ( = ?auto_870169 ?auto_870173 ) ) ( not ( = ?auto_870169 ?auto_870174 ) ) ( not ( = ?auto_870169 ?auto_870175 ) ) ( not ( = ?auto_870169 ?auto_870176 ) ) ( not ( = ?auto_870169 ?auto_870177 ) ) ( not ( = ?auto_870169 ?auto_870178 ) ) ( not ( = ?auto_870170 ?auto_870171 ) ) ( not ( = ?auto_870170 ?auto_870172 ) ) ( not ( = ?auto_870170 ?auto_870173 ) ) ( not ( = ?auto_870170 ?auto_870174 ) ) ( not ( = ?auto_870170 ?auto_870175 ) ) ( not ( = ?auto_870170 ?auto_870176 ) ) ( not ( = ?auto_870170 ?auto_870177 ) ) ( not ( = ?auto_870170 ?auto_870178 ) ) ( not ( = ?auto_870171 ?auto_870172 ) ) ( not ( = ?auto_870171 ?auto_870173 ) ) ( not ( = ?auto_870171 ?auto_870174 ) ) ( not ( = ?auto_870171 ?auto_870175 ) ) ( not ( = ?auto_870171 ?auto_870176 ) ) ( not ( = ?auto_870171 ?auto_870177 ) ) ( not ( = ?auto_870171 ?auto_870178 ) ) ( not ( = ?auto_870172 ?auto_870173 ) ) ( not ( = ?auto_870172 ?auto_870174 ) ) ( not ( = ?auto_870172 ?auto_870175 ) ) ( not ( = ?auto_870172 ?auto_870176 ) ) ( not ( = ?auto_870172 ?auto_870177 ) ) ( not ( = ?auto_870172 ?auto_870178 ) ) ( not ( = ?auto_870173 ?auto_870174 ) ) ( not ( = ?auto_870173 ?auto_870175 ) ) ( not ( = ?auto_870173 ?auto_870176 ) ) ( not ( = ?auto_870173 ?auto_870177 ) ) ( not ( = ?auto_870173 ?auto_870178 ) ) ( not ( = ?auto_870174 ?auto_870175 ) ) ( not ( = ?auto_870174 ?auto_870176 ) ) ( not ( = ?auto_870174 ?auto_870177 ) ) ( not ( = ?auto_870174 ?auto_870178 ) ) ( not ( = ?auto_870175 ?auto_870176 ) ) ( not ( = ?auto_870175 ?auto_870177 ) ) ( not ( = ?auto_870175 ?auto_870178 ) ) ( not ( = ?auto_870176 ?auto_870177 ) ) ( not ( = ?auto_870176 ?auto_870178 ) ) ( not ( = ?auto_870177 ?auto_870178 ) ) ( ON ?auto_870176 ?auto_870177 ) ( ON ?auto_870175 ?auto_870176 ) ( ON ?auto_870174 ?auto_870175 ) ( ON ?auto_870173 ?auto_870174 ) ( ON ?auto_870172 ?auto_870173 ) ( ON ?auto_870171 ?auto_870172 ) ( ON ?auto_870170 ?auto_870171 ) ( ON ?auto_870169 ?auto_870170 ) ( ON ?auto_870168 ?auto_870169 ) ( ON ?auto_870167 ?auto_870168 ) ( ON ?auto_870166 ?auto_870167 ) ( ON ?auto_870165 ?auto_870166 ) ( ON ?auto_870164 ?auto_870165 ) ( ON ?auto_870163 ?auto_870164 ) ( CLEAR ?auto_870161 ) ( ON ?auto_870162 ?auto_870163 ) ( CLEAR ?auto_870162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_870161 ?auto_870162 )
      ( MAKE-17PILE ?auto_870161 ?auto_870162 ?auto_870163 ?auto_870164 ?auto_870165 ?auto_870166 ?auto_870167 ?auto_870168 ?auto_870169 ?auto_870170 ?auto_870171 ?auto_870172 ?auto_870173 ?auto_870174 ?auto_870175 ?auto_870176 ?auto_870177 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_870231 - BLOCK
      ?auto_870232 - BLOCK
      ?auto_870233 - BLOCK
      ?auto_870234 - BLOCK
      ?auto_870235 - BLOCK
      ?auto_870236 - BLOCK
      ?auto_870237 - BLOCK
      ?auto_870238 - BLOCK
      ?auto_870239 - BLOCK
      ?auto_870240 - BLOCK
      ?auto_870241 - BLOCK
      ?auto_870242 - BLOCK
      ?auto_870243 - BLOCK
      ?auto_870244 - BLOCK
      ?auto_870245 - BLOCK
      ?auto_870246 - BLOCK
      ?auto_870247 - BLOCK
    )
    :vars
    (
      ?auto_870248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870247 ?auto_870248 ) ( not ( = ?auto_870231 ?auto_870232 ) ) ( not ( = ?auto_870231 ?auto_870233 ) ) ( not ( = ?auto_870231 ?auto_870234 ) ) ( not ( = ?auto_870231 ?auto_870235 ) ) ( not ( = ?auto_870231 ?auto_870236 ) ) ( not ( = ?auto_870231 ?auto_870237 ) ) ( not ( = ?auto_870231 ?auto_870238 ) ) ( not ( = ?auto_870231 ?auto_870239 ) ) ( not ( = ?auto_870231 ?auto_870240 ) ) ( not ( = ?auto_870231 ?auto_870241 ) ) ( not ( = ?auto_870231 ?auto_870242 ) ) ( not ( = ?auto_870231 ?auto_870243 ) ) ( not ( = ?auto_870231 ?auto_870244 ) ) ( not ( = ?auto_870231 ?auto_870245 ) ) ( not ( = ?auto_870231 ?auto_870246 ) ) ( not ( = ?auto_870231 ?auto_870247 ) ) ( not ( = ?auto_870231 ?auto_870248 ) ) ( not ( = ?auto_870232 ?auto_870233 ) ) ( not ( = ?auto_870232 ?auto_870234 ) ) ( not ( = ?auto_870232 ?auto_870235 ) ) ( not ( = ?auto_870232 ?auto_870236 ) ) ( not ( = ?auto_870232 ?auto_870237 ) ) ( not ( = ?auto_870232 ?auto_870238 ) ) ( not ( = ?auto_870232 ?auto_870239 ) ) ( not ( = ?auto_870232 ?auto_870240 ) ) ( not ( = ?auto_870232 ?auto_870241 ) ) ( not ( = ?auto_870232 ?auto_870242 ) ) ( not ( = ?auto_870232 ?auto_870243 ) ) ( not ( = ?auto_870232 ?auto_870244 ) ) ( not ( = ?auto_870232 ?auto_870245 ) ) ( not ( = ?auto_870232 ?auto_870246 ) ) ( not ( = ?auto_870232 ?auto_870247 ) ) ( not ( = ?auto_870232 ?auto_870248 ) ) ( not ( = ?auto_870233 ?auto_870234 ) ) ( not ( = ?auto_870233 ?auto_870235 ) ) ( not ( = ?auto_870233 ?auto_870236 ) ) ( not ( = ?auto_870233 ?auto_870237 ) ) ( not ( = ?auto_870233 ?auto_870238 ) ) ( not ( = ?auto_870233 ?auto_870239 ) ) ( not ( = ?auto_870233 ?auto_870240 ) ) ( not ( = ?auto_870233 ?auto_870241 ) ) ( not ( = ?auto_870233 ?auto_870242 ) ) ( not ( = ?auto_870233 ?auto_870243 ) ) ( not ( = ?auto_870233 ?auto_870244 ) ) ( not ( = ?auto_870233 ?auto_870245 ) ) ( not ( = ?auto_870233 ?auto_870246 ) ) ( not ( = ?auto_870233 ?auto_870247 ) ) ( not ( = ?auto_870233 ?auto_870248 ) ) ( not ( = ?auto_870234 ?auto_870235 ) ) ( not ( = ?auto_870234 ?auto_870236 ) ) ( not ( = ?auto_870234 ?auto_870237 ) ) ( not ( = ?auto_870234 ?auto_870238 ) ) ( not ( = ?auto_870234 ?auto_870239 ) ) ( not ( = ?auto_870234 ?auto_870240 ) ) ( not ( = ?auto_870234 ?auto_870241 ) ) ( not ( = ?auto_870234 ?auto_870242 ) ) ( not ( = ?auto_870234 ?auto_870243 ) ) ( not ( = ?auto_870234 ?auto_870244 ) ) ( not ( = ?auto_870234 ?auto_870245 ) ) ( not ( = ?auto_870234 ?auto_870246 ) ) ( not ( = ?auto_870234 ?auto_870247 ) ) ( not ( = ?auto_870234 ?auto_870248 ) ) ( not ( = ?auto_870235 ?auto_870236 ) ) ( not ( = ?auto_870235 ?auto_870237 ) ) ( not ( = ?auto_870235 ?auto_870238 ) ) ( not ( = ?auto_870235 ?auto_870239 ) ) ( not ( = ?auto_870235 ?auto_870240 ) ) ( not ( = ?auto_870235 ?auto_870241 ) ) ( not ( = ?auto_870235 ?auto_870242 ) ) ( not ( = ?auto_870235 ?auto_870243 ) ) ( not ( = ?auto_870235 ?auto_870244 ) ) ( not ( = ?auto_870235 ?auto_870245 ) ) ( not ( = ?auto_870235 ?auto_870246 ) ) ( not ( = ?auto_870235 ?auto_870247 ) ) ( not ( = ?auto_870235 ?auto_870248 ) ) ( not ( = ?auto_870236 ?auto_870237 ) ) ( not ( = ?auto_870236 ?auto_870238 ) ) ( not ( = ?auto_870236 ?auto_870239 ) ) ( not ( = ?auto_870236 ?auto_870240 ) ) ( not ( = ?auto_870236 ?auto_870241 ) ) ( not ( = ?auto_870236 ?auto_870242 ) ) ( not ( = ?auto_870236 ?auto_870243 ) ) ( not ( = ?auto_870236 ?auto_870244 ) ) ( not ( = ?auto_870236 ?auto_870245 ) ) ( not ( = ?auto_870236 ?auto_870246 ) ) ( not ( = ?auto_870236 ?auto_870247 ) ) ( not ( = ?auto_870236 ?auto_870248 ) ) ( not ( = ?auto_870237 ?auto_870238 ) ) ( not ( = ?auto_870237 ?auto_870239 ) ) ( not ( = ?auto_870237 ?auto_870240 ) ) ( not ( = ?auto_870237 ?auto_870241 ) ) ( not ( = ?auto_870237 ?auto_870242 ) ) ( not ( = ?auto_870237 ?auto_870243 ) ) ( not ( = ?auto_870237 ?auto_870244 ) ) ( not ( = ?auto_870237 ?auto_870245 ) ) ( not ( = ?auto_870237 ?auto_870246 ) ) ( not ( = ?auto_870237 ?auto_870247 ) ) ( not ( = ?auto_870237 ?auto_870248 ) ) ( not ( = ?auto_870238 ?auto_870239 ) ) ( not ( = ?auto_870238 ?auto_870240 ) ) ( not ( = ?auto_870238 ?auto_870241 ) ) ( not ( = ?auto_870238 ?auto_870242 ) ) ( not ( = ?auto_870238 ?auto_870243 ) ) ( not ( = ?auto_870238 ?auto_870244 ) ) ( not ( = ?auto_870238 ?auto_870245 ) ) ( not ( = ?auto_870238 ?auto_870246 ) ) ( not ( = ?auto_870238 ?auto_870247 ) ) ( not ( = ?auto_870238 ?auto_870248 ) ) ( not ( = ?auto_870239 ?auto_870240 ) ) ( not ( = ?auto_870239 ?auto_870241 ) ) ( not ( = ?auto_870239 ?auto_870242 ) ) ( not ( = ?auto_870239 ?auto_870243 ) ) ( not ( = ?auto_870239 ?auto_870244 ) ) ( not ( = ?auto_870239 ?auto_870245 ) ) ( not ( = ?auto_870239 ?auto_870246 ) ) ( not ( = ?auto_870239 ?auto_870247 ) ) ( not ( = ?auto_870239 ?auto_870248 ) ) ( not ( = ?auto_870240 ?auto_870241 ) ) ( not ( = ?auto_870240 ?auto_870242 ) ) ( not ( = ?auto_870240 ?auto_870243 ) ) ( not ( = ?auto_870240 ?auto_870244 ) ) ( not ( = ?auto_870240 ?auto_870245 ) ) ( not ( = ?auto_870240 ?auto_870246 ) ) ( not ( = ?auto_870240 ?auto_870247 ) ) ( not ( = ?auto_870240 ?auto_870248 ) ) ( not ( = ?auto_870241 ?auto_870242 ) ) ( not ( = ?auto_870241 ?auto_870243 ) ) ( not ( = ?auto_870241 ?auto_870244 ) ) ( not ( = ?auto_870241 ?auto_870245 ) ) ( not ( = ?auto_870241 ?auto_870246 ) ) ( not ( = ?auto_870241 ?auto_870247 ) ) ( not ( = ?auto_870241 ?auto_870248 ) ) ( not ( = ?auto_870242 ?auto_870243 ) ) ( not ( = ?auto_870242 ?auto_870244 ) ) ( not ( = ?auto_870242 ?auto_870245 ) ) ( not ( = ?auto_870242 ?auto_870246 ) ) ( not ( = ?auto_870242 ?auto_870247 ) ) ( not ( = ?auto_870242 ?auto_870248 ) ) ( not ( = ?auto_870243 ?auto_870244 ) ) ( not ( = ?auto_870243 ?auto_870245 ) ) ( not ( = ?auto_870243 ?auto_870246 ) ) ( not ( = ?auto_870243 ?auto_870247 ) ) ( not ( = ?auto_870243 ?auto_870248 ) ) ( not ( = ?auto_870244 ?auto_870245 ) ) ( not ( = ?auto_870244 ?auto_870246 ) ) ( not ( = ?auto_870244 ?auto_870247 ) ) ( not ( = ?auto_870244 ?auto_870248 ) ) ( not ( = ?auto_870245 ?auto_870246 ) ) ( not ( = ?auto_870245 ?auto_870247 ) ) ( not ( = ?auto_870245 ?auto_870248 ) ) ( not ( = ?auto_870246 ?auto_870247 ) ) ( not ( = ?auto_870246 ?auto_870248 ) ) ( not ( = ?auto_870247 ?auto_870248 ) ) ( ON ?auto_870246 ?auto_870247 ) ( ON ?auto_870245 ?auto_870246 ) ( ON ?auto_870244 ?auto_870245 ) ( ON ?auto_870243 ?auto_870244 ) ( ON ?auto_870242 ?auto_870243 ) ( ON ?auto_870241 ?auto_870242 ) ( ON ?auto_870240 ?auto_870241 ) ( ON ?auto_870239 ?auto_870240 ) ( ON ?auto_870238 ?auto_870239 ) ( ON ?auto_870237 ?auto_870238 ) ( ON ?auto_870236 ?auto_870237 ) ( ON ?auto_870235 ?auto_870236 ) ( ON ?auto_870234 ?auto_870235 ) ( ON ?auto_870233 ?auto_870234 ) ( ON ?auto_870232 ?auto_870233 ) ( ON ?auto_870231 ?auto_870232 ) ( CLEAR ?auto_870231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_870231 )
      ( MAKE-17PILE ?auto_870231 ?auto_870232 ?auto_870233 ?auto_870234 ?auto_870235 ?auto_870236 ?auto_870237 ?auto_870238 ?auto_870239 ?auto_870240 ?auto_870241 ?auto_870242 ?auto_870243 ?auto_870244 ?auto_870245 ?auto_870246 ?auto_870247 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870302 - BLOCK
      ?auto_870303 - BLOCK
      ?auto_870304 - BLOCK
      ?auto_870305 - BLOCK
      ?auto_870306 - BLOCK
      ?auto_870307 - BLOCK
      ?auto_870308 - BLOCK
      ?auto_870309 - BLOCK
      ?auto_870310 - BLOCK
      ?auto_870311 - BLOCK
      ?auto_870312 - BLOCK
      ?auto_870313 - BLOCK
      ?auto_870314 - BLOCK
      ?auto_870315 - BLOCK
      ?auto_870316 - BLOCK
      ?auto_870317 - BLOCK
      ?auto_870318 - BLOCK
      ?auto_870319 - BLOCK
    )
    :vars
    (
      ?auto_870320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_870318 ) ( ON ?auto_870319 ?auto_870320 ) ( CLEAR ?auto_870319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_870302 ) ( ON ?auto_870303 ?auto_870302 ) ( ON ?auto_870304 ?auto_870303 ) ( ON ?auto_870305 ?auto_870304 ) ( ON ?auto_870306 ?auto_870305 ) ( ON ?auto_870307 ?auto_870306 ) ( ON ?auto_870308 ?auto_870307 ) ( ON ?auto_870309 ?auto_870308 ) ( ON ?auto_870310 ?auto_870309 ) ( ON ?auto_870311 ?auto_870310 ) ( ON ?auto_870312 ?auto_870311 ) ( ON ?auto_870313 ?auto_870312 ) ( ON ?auto_870314 ?auto_870313 ) ( ON ?auto_870315 ?auto_870314 ) ( ON ?auto_870316 ?auto_870315 ) ( ON ?auto_870317 ?auto_870316 ) ( ON ?auto_870318 ?auto_870317 ) ( not ( = ?auto_870302 ?auto_870303 ) ) ( not ( = ?auto_870302 ?auto_870304 ) ) ( not ( = ?auto_870302 ?auto_870305 ) ) ( not ( = ?auto_870302 ?auto_870306 ) ) ( not ( = ?auto_870302 ?auto_870307 ) ) ( not ( = ?auto_870302 ?auto_870308 ) ) ( not ( = ?auto_870302 ?auto_870309 ) ) ( not ( = ?auto_870302 ?auto_870310 ) ) ( not ( = ?auto_870302 ?auto_870311 ) ) ( not ( = ?auto_870302 ?auto_870312 ) ) ( not ( = ?auto_870302 ?auto_870313 ) ) ( not ( = ?auto_870302 ?auto_870314 ) ) ( not ( = ?auto_870302 ?auto_870315 ) ) ( not ( = ?auto_870302 ?auto_870316 ) ) ( not ( = ?auto_870302 ?auto_870317 ) ) ( not ( = ?auto_870302 ?auto_870318 ) ) ( not ( = ?auto_870302 ?auto_870319 ) ) ( not ( = ?auto_870302 ?auto_870320 ) ) ( not ( = ?auto_870303 ?auto_870304 ) ) ( not ( = ?auto_870303 ?auto_870305 ) ) ( not ( = ?auto_870303 ?auto_870306 ) ) ( not ( = ?auto_870303 ?auto_870307 ) ) ( not ( = ?auto_870303 ?auto_870308 ) ) ( not ( = ?auto_870303 ?auto_870309 ) ) ( not ( = ?auto_870303 ?auto_870310 ) ) ( not ( = ?auto_870303 ?auto_870311 ) ) ( not ( = ?auto_870303 ?auto_870312 ) ) ( not ( = ?auto_870303 ?auto_870313 ) ) ( not ( = ?auto_870303 ?auto_870314 ) ) ( not ( = ?auto_870303 ?auto_870315 ) ) ( not ( = ?auto_870303 ?auto_870316 ) ) ( not ( = ?auto_870303 ?auto_870317 ) ) ( not ( = ?auto_870303 ?auto_870318 ) ) ( not ( = ?auto_870303 ?auto_870319 ) ) ( not ( = ?auto_870303 ?auto_870320 ) ) ( not ( = ?auto_870304 ?auto_870305 ) ) ( not ( = ?auto_870304 ?auto_870306 ) ) ( not ( = ?auto_870304 ?auto_870307 ) ) ( not ( = ?auto_870304 ?auto_870308 ) ) ( not ( = ?auto_870304 ?auto_870309 ) ) ( not ( = ?auto_870304 ?auto_870310 ) ) ( not ( = ?auto_870304 ?auto_870311 ) ) ( not ( = ?auto_870304 ?auto_870312 ) ) ( not ( = ?auto_870304 ?auto_870313 ) ) ( not ( = ?auto_870304 ?auto_870314 ) ) ( not ( = ?auto_870304 ?auto_870315 ) ) ( not ( = ?auto_870304 ?auto_870316 ) ) ( not ( = ?auto_870304 ?auto_870317 ) ) ( not ( = ?auto_870304 ?auto_870318 ) ) ( not ( = ?auto_870304 ?auto_870319 ) ) ( not ( = ?auto_870304 ?auto_870320 ) ) ( not ( = ?auto_870305 ?auto_870306 ) ) ( not ( = ?auto_870305 ?auto_870307 ) ) ( not ( = ?auto_870305 ?auto_870308 ) ) ( not ( = ?auto_870305 ?auto_870309 ) ) ( not ( = ?auto_870305 ?auto_870310 ) ) ( not ( = ?auto_870305 ?auto_870311 ) ) ( not ( = ?auto_870305 ?auto_870312 ) ) ( not ( = ?auto_870305 ?auto_870313 ) ) ( not ( = ?auto_870305 ?auto_870314 ) ) ( not ( = ?auto_870305 ?auto_870315 ) ) ( not ( = ?auto_870305 ?auto_870316 ) ) ( not ( = ?auto_870305 ?auto_870317 ) ) ( not ( = ?auto_870305 ?auto_870318 ) ) ( not ( = ?auto_870305 ?auto_870319 ) ) ( not ( = ?auto_870305 ?auto_870320 ) ) ( not ( = ?auto_870306 ?auto_870307 ) ) ( not ( = ?auto_870306 ?auto_870308 ) ) ( not ( = ?auto_870306 ?auto_870309 ) ) ( not ( = ?auto_870306 ?auto_870310 ) ) ( not ( = ?auto_870306 ?auto_870311 ) ) ( not ( = ?auto_870306 ?auto_870312 ) ) ( not ( = ?auto_870306 ?auto_870313 ) ) ( not ( = ?auto_870306 ?auto_870314 ) ) ( not ( = ?auto_870306 ?auto_870315 ) ) ( not ( = ?auto_870306 ?auto_870316 ) ) ( not ( = ?auto_870306 ?auto_870317 ) ) ( not ( = ?auto_870306 ?auto_870318 ) ) ( not ( = ?auto_870306 ?auto_870319 ) ) ( not ( = ?auto_870306 ?auto_870320 ) ) ( not ( = ?auto_870307 ?auto_870308 ) ) ( not ( = ?auto_870307 ?auto_870309 ) ) ( not ( = ?auto_870307 ?auto_870310 ) ) ( not ( = ?auto_870307 ?auto_870311 ) ) ( not ( = ?auto_870307 ?auto_870312 ) ) ( not ( = ?auto_870307 ?auto_870313 ) ) ( not ( = ?auto_870307 ?auto_870314 ) ) ( not ( = ?auto_870307 ?auto_870315 ) ) ( not ( = ?auto_870307 ?auto_870316 ) ) ( not ( = ?auto_870307 ?auto_870317 ) ) ( not ( = ?auto_870307 ?auto_870318 ) ) ( not ( = ?auto_870307 ?auto_870319 ) ) ( not ( = ?auto_870307 ?auto_870320 ) ) ( not ( = ?auto_870308 ?auto_870309 ) ) ( not ( = ?auto_870308 ?auto_870310 ) ) ( not ( = ?auto_870308 ?auto_870311 ) ) ( not ( = ?auto_870308 ?auto_870312 ) ) ( not ( = ?auto_870308 ?auto_870313 ) ) ( not ( = ?auto_870308 ?auto_870314 ) ) ( not ( = ?auto_870308 ?auto_870315 ) ) ( not ( = ?auto_870308 ?auto_870316 ) ) ( not ( = ?auto_870308 ?auto_870317 ) ) ( not ( = ?auto_870308 ?auto_870318 ) ) ( not ( = ?auto_870308 ?auto_870319 ) ) ( not ( = ?auto_870308 ?auto_870320 ) ) ( not ( = ?auto_870309 ?auto_870310 ) ) ( not ( = ?auto_870309 ?auto_870311 ) ) ( not ( = ?auto_870309 ?auto_870312 ) ) ( not ( = ?auto_870309 ?auto_870313 ) ) ( not ( = ?auto_870309 ?auto_870314 ) ) ( not ( = ?auto_870309 ?auto_870315 ) ) ( not ( = ?auto_870309 ?auto_870316 ) ) ( not ( = ?auto_870309 ?auto_870317 ) ) ( not ( = ?auto_870309 ?auto_870318 ) ) ( not ( = ?auto_870309 ?auto_870319 ) ) ( not ( = ?auto_870309 ?auto_870320 ) ) ( not ( = ?auto_870310 ?auto_870311 ) ) ( not ( = ?auto_870310 ?auto_870312 ) ) ( not ( = ?auto_870310 ?auto_870313 ) ) ( not ( = ?auto_870310 ?auto_870314 ) ) ( not ( = ?auto_870310 ?auto_870315 ) ) ( not ( = ?auto_870310 ?auto_870316 ) ) ( not ( = ?auto_870310 ?auto_870317 ) ) ( not ( = ?auto_870310 ?auto_870318 ) ) ( not ( = ?auto_870310 ?auto_870319 ) ) ( not ( = ?auto_870310 ?auto_870320 ) ) ( not ( = ?auto_870311 ?auto_870312 ) ) ( not ( = ?auto_870311 ?auto_870313 ) ) ( not ( = ?auto_870311 ?auto_870314 ) ) ( not ( = ?auto_870311 ?auto_870315 ) ) ( not ( = ?auto_870311 ?auto_870316 ) ) ( not ( = ?auto_870311 ?auto_870317 ) ) ( not ( = ?auto_870311 ?auto_870318 ) ) ( not ( = ?auto_870311 ?auto_870319 ) ) ( not ( = ?auto_870311 ?auto_870320 ) ) ( not ( = ?auto_870312 ?auto_870313 ) ) ( not ( = ?auto_870312 ?auto_870314 ) ) ( not ( = ?auto_870312 ?auto_870315 ) ) ( not ( = ?auto_870312 ?auto_870316 ) ) ( not ( = ?auto_870312 ?auto_870317 ) ) ( not ( = ?auto_870312 ?auto_870318 ) ) ( not ( = ?auto_870312 ?auto_870319 ) ) ( not ( = ?auto_870312 ?auto_870320 ) ) ( not ( = ?auto_870313 ?auto_870314 ) ) ( not ( = ?auto_870313 ?auto_870315 ) ) ( not ( = ?auto_870313 ?auto_870316 ) ) ( not ( = ?auto_870313 ?auto_870317 ) ) ( not ( = ?auto_870313 ?auto_870318 ) ) ( not ( = ?auto_870313 ?auto_870319 ) ) ( not ( = ?auto_870313 ?auto_870320 ) ) ( not ( = ?auto_870314 ?auto_870315 ) ) ( not ( = ?auto_870314 ?auto_870316 ) ) ( not ( = ?auto_870314 ?auto_870317 ) ) ( not ( = ?auto_870314 ?auto_870318 ) ) ( not ( = ?auto_870314 ?auto_870319 ) ) ( not ( = ?auto_870314 ?auto_870320 ) ) ( not ( = ?auto_870315 ?auto_870316 ) ) ( not ( = ?auto_870315 ?auto_870317 ) ) ( not ( = ?auto_870315 ?auto_870318 ) ) ( not ( = ?auto_870315 ?auto_870319 ) ) ( not ( = ?auto_870315 ?auto_870320 ) ) ( not ( = ?auto_870316 ?auto_870317 ) ) ( not ( = ?auto_870316 ?auto_870318 ) ) ( not ( = ?auto_870316 ?auto_870319 ) ) ( not ( = ?auto_870316 ?auto_870320 ) ) ( not ( = ?auto_870317 ?auto_870318 ) ) ( not ( = ?auto_870317 ?auto_870319 ) ) ( not ( = ?auto_870317 ?auto_870320 ) ) ( not ( = ?auto_870318 ?auto_870319 ) ) ( not ( = ?auto_870318 ?auto_870320 ) ) ( not ( = ?auto_870319 ?auto_870320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_870319 ?auto_870320 )
      ( !STACK ?auto_870319 ?auto_870318 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870339 - BLOCK
      ?auto_870340 - BLOCK
      ?auto_870341 - BLOCK
      ?auto_870342 - BLOCK
      ?auto_870343 - BLOCK
      ?auto_870344 - BLOCK
      ?auto_870345 - BLOCK
      ?auto_870346 - BLOCK
      ?auto_870347 - BLOCK
      ?auto_870348 - BLOCK
      ?auto_870349 - BLOCK
      ?auto_870350 - BLOCK
      ?auto_870351 - BLOCK
      ?auto_870352 - BLOCK
      ?auto_870353 - BLOCK
      ?auto_870354 - BLOCK
      ?auto_870355 - BLOCK
      ?auto_870356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_870355 ) ( ON-TABLE ?auto_870356 ) ( CLEAR ?auto_870356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_870339 ) ( ON ?auto_870340 ?auto_870339 ) ( ON ?auto_870341 ?auto_870340 ) ( ON ?auto_870342 ?auto_870341 ) ( ON ?auto_870343 ?auto_870342 ) ( ON ?auto_870344 ?auto_870343 ) ( ON ?auto_870345 ?auto_870344 ) ( ON ?auto_870346 ?auto_870345 ) ( ON ?auto_870347 ?auto_870346 ) ( ON ?auto_870348 ?auto_870347 ) ( ON ?auto_870349 ?auto_870348 ) ( ON ?auto_870350 ?auto_870349 ) ( ON ?auto_870351 ?auto_870350 ) ( ON ?auto_870352 ?auto_870351 ) ( ON ?auto_870353 ?auto_870352 ) ( ON ?auto_870354 ?auto_870353 ) ( ON ?auto_870355 ?auto_870354 ) ( not ( = ?auto_870339 ?auto_870340 ) ) ( not ( = ?auto_870339 ?auto_870341 ) ) ( not ( = ?auto_870339 ?auto_870342 ) ) ( not ( = ?auto_870339 ?auto_870343 ) ) ( not ( = ?auto_870339 ?auto_870344 ) ) ( not ( = ?auto_870339 ?auto_870345 ) ) ( not ( = ?auto_870339 ?auto_870346 ) ) ( not ( = ?auto_870339 ?auto_870347 ) ) ( not ( = ?auto_870339 ?auto_870348 ) ) ( not ( = ?auto_870339 ?auto_870349 ) ) ( not ( = ?auto_870339 ?auto_870350 ) ) ( not ( = ?auto_870339 ?auto_870351 ) ) ( not ( = ?auto_870339 ?auto_870352 ) ) ( not ( = ?auto_870339 ?auto_870353 ) ) ( not ( = ?auto_870339 ?auto_870354 ) ) ( not ( = ?auto_870339 ?auto_870355 ) ) ( not ( = ?auto_870339 ?auto_870356 ) ) ( not ( = ?auto_870340 ?auto_870341 ) ) ( not ( = ?auto_870340 ?auto_870342 ) ) ( not ( = ?auto_870340 ?auto_870343 ) ) ( not ( = ?auto_870340 ?auto_870344 ) ) ( not ( = ?auto_870340 ?auto_870345 ) ) ( not ( = ?auto_870340 ?auto_870346 ) ) ( not ( = ?auto_870340 ?auto_870347 ) ) ( not ( = ?auto_870340 ?auto_870348 ) ) ( not ( = ?auto_870340 ?auto_870349 ) ) ( not ( = ?auto_870340 ?auto_870350 ) ) ( not ( = ?auto_870340 ?auto_870351 ) ) ( not ( = ?auto_870340 ?auto_870352 ) ) ( not ( = ?auto_870340 ?auto_870353 ) ) ( not ( = ?auto_870340 ?auto_870354 ) ) ( not ( = ?auto_870340 ?auto_870355 ) ) ( not ( = ?auto_870340 ?auto_870356 ) ) ( not ( = ?auto_870341 ?auto_870342 ) ) ( not ( = ?auto_870341 ?auto_870343 ) ) ( not ( = ?auto_870341 ?auto_870344 ) ) ( not ( = ?auto_870341 ?auto_870345 ) ) ( not ( = ?auto_870341 ?auto_870346 ) ) ( not ( = ?auto_870341 ?auto_870347 ) ) ( not ( = ?auto_870341 ?auto_870348 ) ) ( not ( = ?auto_870341 ?auto_870349 ) ) ( not ( = ?auto_870341 ?auto_870350 ) ) ( not ( = ?auto_870341 ?auto_870351 ) ) ( not ( = ?auto_870341 ?auto_870352 ) ) ( not ( = ?auto_870341 ?auto_870353 ) ) ( not ( = ?auto_870341 ?auto_870354 ) ) ( not ( = ?auto_870341 ?auto_870355 ) ) ( not ( = ?auto_870341 ?auto_870356 ) ) ( not ( = ?auto_870342 ?auto_870343 ) ) ( not ( = ?auto_870342 ?auto_870344 ) ) ( not ( = ?auto_870342 ?auto_870345 ) ) ( not ( = ?auto_870342 ?auto_870346 ) ) ( not ( = ?auto_870342 ?auto_870347 ) ) ( not ( = ?auto_870342 ?auto_870348 ) ) ( not ( = ?auto_870342 ?auto_870349 ) ) ( not ( = ?auto_870342 ?auto_870350 ) ) ( not ( = ?auto_870342 ?auto_870351 ) ) ( not ( = ?auto_870342 ?auto_870352 ) ) ( not ( = ?auto_870342 ?auto_870353 ) ) ( not ( = ?auto_870342 ?auto_870354 ) ) ( not ( = ?auto_870342 ?auto_870355 ) ) ( not ( = ?auto_870342 ?auto_870356 ) ) ( not ( = ?auto_870343 ?auto_870344 ) ) ( not ( = ?auto_870343 ?auto_870345 ) ) ( not ( = ?auto_870343 ?auto_870346 ) ) ( not ( = ?auto_870343 ?auto_870347 ) ) ( not ( = ?auto_870343 ?auto_870348 ) ) ( not ( = ?auto_870343 ?auto_870349 ) ) ( not ( = ?auto_870343 ?auto_870350 ) ) ( not ( = ?auto_870343 ?auto_870351 ) ) ( not ( = ?auto_870343 ?auto_870352 ) ) ( not ( = ?auto_870343 ?auto_870353 ) ) ( not ( = ?auto_870343 ?auto_870354 ) ) ( not ( = ?auto_870343 ?auto_870355 ) ) ( not ( = ?auto_870343 ?auto_870356 ) ) ( not ( = ?auto_870344 ?auto_870345 ) ) ( not ( = ?auto_870344 ?auto_870346 ) ) ( not ( = ?auto_870344 ?auto_870347 ) ) ( not ( = ?auto_870344 ?auto_870348 ) ) ( not ( = ?auto_870344 ?auto_870349 ) ) ( not ( = ?auto_870344 ?auto_870350 ) ) ( not ( = ?auto_870344 ?auto_870351 ) ) ( not ( = ?auto_870344 ?auto_870352 ) ) ( not ( = ?auto_870344 ?auto_870353 ) ) ( not ( = ?auto_870344 ?auto_870354 ) ) ( not ( = ?auto_870344 ?auto_870355 ) ) ( not ( = ?auto_870344 ?auto_870356 ) ) ( not ( = ?auto_870345 ?auto_870346 ) ) ( not ( = ?auto_870345 ?auto_870347 ) ) ( not ( = ?auto_870345 ?auto_870348 ) ) ( not ( = ?auto_870345 ?auto_870349 ) ) ( not ( = ?auto_870345 ?auto_870350 ) ) ( not ( = ?auto_870345 ?auto_870351 ) ) ( not ( = ?auto_870345 ?auto_870352 ) ) ( not ( = ?auto_870345 ?auto_870353 ) ) ( not ( = ?auto_870345 ?auto_870354 ) ) ( not ( = ?auto_870345 ?auto_870355 ) ) ( not ( = ?auto_870345 ?auto_870356 ) ) ( not ( = ?auto_870346 ?auto_870347 ) ) ( not ( = ?auto_870346 ?auto_870348 ) ) ( not ( = ?auto_870346 ?auto_870349 ) ) ( not ( = ?auto_870346 ?auto_870350 ) ) ( not ( = ?auto_870346 ?auto_870351 ) ) ( not ( = ?auto_870346 ?auto_870352 ) ) ( not ( = ?auto_870346 ?auto_870353 ) ) ( not ( = ?auto_870346 ?auto_870354 ) ) ( not ( = ?auto_870346 ?auto_870355 ) ) ( not ( = ?auto_870346 ?auto_870356 ) ) ( not ( = ?auto_870347 ?auto_870348 ) ) ( not ( = ?auto_870347 ?auto_870349 ) ) ( not ( = ?auto_870347 ?auto_870350 ) ) ( not ( = ?auto_870347 ?auto_870351 ) ) ( not ( = ?auto_870347 ?auto_870352 ) ) ( not ( = ?auto_870347 ?auto_870353 ) ) ( not ( = ?auto_870347 ?auto_870354 ) ) ( not ( = ?auto_870347 ?auto_870355 ) ) ( not ( = ?auto_870347 ?auto_870356 ) ) ( not ( = ?auto_870348 ?auto_870349 ) ) ( not ( = ?auto_870348 ?auto_870350 ) ) ( not ( = ?auto_870348 ?auto_870351 ) ) ( not ( = ?auto_870348 ?auto_870352 ) ) ( not ( = ?auto_870348 ?auto_870353 ) ) ( not ( = ?auto_870348 ?auto_870354 ) ) ( not ( = ?auto_870348 ?auto_870355 ) ) ( not ( = ?auto_870348 ?auto_870356 ) ) ( not ( = ?auto_870349 ?auto_870350 ) ) ( not ( = ?auto_870349 ?auto_870351 ) ) ( not ( = ?auto_870349 ?auto_870352 ) ) ( not ( = ?auto_870349 ?auto_870353 ) ) ( not ( = ?auto_870349 ?auto_870354 ) ) ( not ( = ?auto_870349 ?auto_870355 ) ) ( not ( = ?auto_870349 ?auto_870356 ) ) ( not ( = ?auto_870350 ?auto_870351 ) ) ( not ( = ?auto_870350 ?auto_870352 ) ) ( not ( = ?auto_870350 ?auto_870353 ) ) ( not ( = ?auto_870350 ?auto_870354 ) ) ( not ( = ?auto_870350 ?auto_870355 ) ) ( not ( = ?auto_870350 ?auto_870356 ) ) ( not ( = ?auto_870351 ?auto_870352 ) ) ( not ( = ?auto_870351 ?auto_870353 ) ) ( not ( = ?auto_870351 ?auto_870354 ) ) ( not ( = ?auto_870351 ?auto_870355 ) ) ( not ( = ?auto_870351 ?auto_870356 ) ) ( not ( = ?auto_870352 ?auto_870353 ) ) ( not ( = ?auto_870352 ?auto_870354 ) ) ( not ( = ?auto_870352 ?auto_870355 ) ) ( not ( = ?auto_870352 ?auto_870356 ) ) ( not ( = ?auto_870353 ?auto_870354 ) ) ( not ( = ?auto_870353 ?auto_870355 ) ) ( not ( = ?auto_870353 ?auto_870356 ) ) ( not ( = ?auto_870354 ?auto_870355 ) ) ( not ( = ?auto_870354 ?auto_870356 ) ) ( not ( = ?auto_870355 ?auto_870356 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_870356 )
      ( !STACK ?auto_870356 ?auto_870355 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870375 - BLOCK
      ?auto_870376 - BLOCK
      ?auto_870377 - BLOCK
      ?auto_870378 - BLOCK
      ?auto_870379 - BLOCK
      ?auto_870380 - BLOCK
      ?auto_870381 - BLOCK
      ?auto_870382 - BLOCK
      ?auto_870383 - BLOCK
      ?auto_870384 - BLOCK
      ?auto_870385 - BLOCK
      ?auto_870386 - BLOCK
      ?auto_870387 - BLOCK
      ?auto_870388 - BLOCK
      ?auto_870389 - BLOCK
      ?auto_870390 - BLOCK
      ?auto_870391 - BLOCK
      ?auto_870392 - BLOCK
    )
    :vars
    (
      ?auto_870393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870392 ?auto_870393 ) ( ON-TABLE ?auto_870375 ) ( ON ?auto_870376 ?auto_870375 ) ( ON ?auto_870377 ?auto_870376 ) ( ON ?auto_870378 ?auto_870377 ) ( ON ?auto_870379 ?auto_870378 ) ( ON ?auto_870380 ?auto_870379 ) ( ON ?auto_870381 ?auto_870380 ) ( ON ?auto_870382 ?auto_870381 ) ( ON ?auto_870383 ?auto_870382 ) ( ON ?auto_870384 ?auto_870383 ) ( ON ?auto_870385 ?auto_870384 ) ( ON ?auto_870386 ?auto_870385 ) ( ON ?auto_870387 ?auto_870386 ) ( ON ?auto_870388 ?auto_870387 ) ( ON ?auto_870389 ?auto_870388 ) ( ON ?auto_870390 ?auto_870389 ) ( not ( = ?auto_870375 ?auto_870376 ) ) ( not ( = ?auto_870375 ?auto_870377 ) ) ( not ( = ?auto_870375 ?auto_870378 ) ) ( not ( = ?auto_870375 ?auto_870379 ) ) ( not ( = ?auto_870375 ?auto_870380 ) ) ( not ( = ?auto_870375 ?auto_870381 ) ) ( not ( = ?auto_870375 ?auto_870382 ) ) ( not ( = ?auto_870375 ?auto_870383 ) ) ( not ( = ?auto_870375 ?auto_870384 ) ) ( not ( = ?auto_870375 ?auto_870385 ) ) ( not ( = ?auto_870375 ?auto_870386 ) ) ( not ( = ?auto_870375 ?auto_870387 ) ) ( not ( = ?auto_870375 ?auto_870388 ) ) ( not ( = ?auto_870375 ?auto_870389 ) ) ( not ( = ?auto_870375 ?auto_870390 ) ) ( not ( = ?auto_870375 ?auto_870391 ) ) ( not ( = ?auto_870375 ?auto_870392 ) ) ( not ( = ?auto_870375 ?auto_870393 ) ) ( not ( = ?auto_870376 ?auto_870377 ) ) ( not ( = ?auto_870376 ?auto_870378 ) ) ( not ( = ?auto_870376 ?auto_870379 ) ) ( not ( = ?auto_870376 ?auto_870380 ) ) ( not ( = ?auto_870376 ?auto_870381 ) ) ( not ( = ?auto_870376 ?auto_870382 ) ) ( not ( = ?auto_870376 ?auto_870383 ) ) ( not ( = ?auto_870376 ?auto_870384 ) ) ( not ( = ?auto_870376 ?auto_870385 ) ) ( not ( = ?auto_870376 ?auto_870386 ) ) ( not ( = ?auto_870376 ?auto_870387 ) ) ( not ( = ?auto_870376 ?auto_870388 ) ) ( not ( = ?auto_870376 ?auto_870389 ) ) ( not ( = ?auto_870376 ?auto_870390 ) ) ( not ( = ?auto_870376 ?auto_870391 ) ) ( not ( = ?auto_870376 ?auto_870392 ) ) ( not ( = ?auto_870376 ?auto_870393 ) ) ( not ( = ?auto_870377 ?auto_870378 ) ) ( not ( = ?auto_870377 ?auto_870379 ) ) ( not ( = ?auto_870377 ?auto_870380 ) ) ( not ( = ?auto_870377 ?auto_870381 ) ) ( not ( = ?auto_870377 ?auto_870382 ) ) ( not ( = ?auto_870377 ?auto_870383 ) ) ( not ( = ?auto_870377 ?auto_870384 ) ) ( not ( = ?auto_870377 ?auto_870385 ) ) ( not ( = ?auto_870377 ?auto_870386 ) ) ( not ( = ?auto_870377 ?auto_870387 ) ) ( not ( = ?auto_870377 ?auto_870388 ) ) ( not ( = ?auto_870377 ?auto_870389 ) ) ( not ( = ?auto_870377 ?auto_870390 ) ) ( not ( = ?auto_870377 ?auto_870391 ) ) ( not ( = ?auto_870377 ?auto_870392 ) ) ( not ( = ?auto_870377 ?auto_870393 ) ) ( not ( = ?auto_870378 ?auto_870379 ) ) ( not ( = ?auto_870378 ?auto_870380 ) ) ( not ( = ?auto_870378 ?auto_870381 ) ) ( not ( = ?auto_870378 ?auto_870382 ) ) ( not ( = ?auto_870378 ?auto_870383 ) ) ( not ( = ?auto_870378 ?auto_870384 ) ) ( not ( = ?auto_870378 ?auto_870385 ) ) ( not ( = ?auto_870378 ?auto_870386 ) ) ( not ( = ?auto_870378 ?auto_870387 ) ) ( not ( = ?auto_870378 ?auto_870388 ) ) ( not ( = ?auto_870378 ?auto_870389 ) ) ( not ( = ?auto_870378 ?auto_870390 ) ) ( not ( = ?auto_870378 ?auto_870391 ) ) ( not ( = ?auto_870378 ?auto_870392 ) ) ( not ( = ?auto_870378 ?auto_870393 ) ) ( not ( = ?auto_870379 ?auto_870380 ) ) ( not ( = ?auto_870379 ?auto_870381 ) ) ( not ( = ?auto_870379 ?auto_870382 ) ) ( not ( = ?auto_870379 ?auto_870383 ) ) ( not ( = ?auto_870379 ?auto_870384 ) ) ( not ( = ?auto_870379 ?auto_870385 ) ) ( not ( = ?auto_870379 ?auto_870386 ) ) ( not ( = ?auto_870379 ?auto_870387 ) ) ( not ( = ?auto_870379 ?auto_870388 ) ) ( not ( = ?auto_870379 ?auto_870389 ) ) ( not ( = ?auto_870379 ?auto_870390 ) ) ( not ( = ?auto_870379 ?auto_870391 ) ) ( not ( = ?auto_870379 ?auto_870392 ) ) ( not ( = ?auto_870379 ?auto_870393 ) ) ( not ( = ?auto_870380 ?auto_870381 ) ) ( not ( = ?auto_870380 ?auto_870382 ) ) ( not ( = ?auto_870380 ?auto_870383 ) ) ( not ( = ?auto_870380 ?auto_870384 ) ) ( not ( = ?auto_870380 ?auto_870385 ) ) ( not ( = ?auto_870380 ?auto_870386 ) ) ( not ( = ?auto_870380 ?auto_870387 ) ) ( not ( = ?auto_870380 ?auto_870388 ) ) ( not ( = ?auto_870380 ?auto_870389 ) ) ( not ( = ?auto_870380 ?auto_870390 ) ) ( not ( = ?auto_870380 ?auto_870391 ) ) ( not ( = ?auto_870380 ?auto_870392 ) ) ( not ( = ?auto_870380 ?auto_870393 ) ) ( not ( = ?auto_870381 ?auto_870382 ) ) ( not ( = ?auto_870381 ?auto_870383 ) ) ( not ( = ?auto_870381 ?auto_870384 ) ) ( not ( = ?auto_870381 ?auto_870385 ) ) ( not ( = ?auto_870381 ?auto_870386 ) ) ( not ( = ?auto_870381 ?auto_870387 ) ) ( not ( = ?auto_870381 ?auto_870388 ) ) ( not ( = ?auto_870381 ?auto_870389 ) ) ( not ( = ?auto_870381 ?auto_870390 ) ) ( not ( = ?auto_870381 ?auto_870391 ) ) ( not ( = ?auto_870381 ?auto_870392 ) ) ( not ( = ?auto_870381 ?auto_870393 ) ) ( not ( = ?auto_870382 ?auto_870383 ) ) ( not ( = ?auto_870382 ?auto_870384 ) ) ( not ( = ?auto_870382 ?auto_870385 ) ) ( not ( = ?auto_870382 ?auto_870386 ) ) ( not ( = ?auto_870382 ?auto_870387 ) ) ( not ( = ?auto_870382 ?auto_870388 ) ) ( not ( = ?auto_870382 ?auto_870389 ) ) ( not ( = ?auto_870382 ?auto_870390 ) ) ( not ( = ?auto_870382 ?auto_870391 ) ) ( not ( = ?auto_870382 ?auto_870392 ) ) ( not ( = ?auto_870382 ?auto_870393 ) ) ( not ( = ?auto_870383 ?auto_870384 ) ) ( not ( = ?auto_870383 ?auto_870385 ) ) ( not ( = ?auto_870383 ?auto_870386 ) ) ( not ( = ?auto_870383 ?auto_870387 ) ) ( not ( = ?auto_870383 ?auto_870388 ) ) ( not ( = ?auto_870383 ?auto_870389 ) ) ( not ( = ?auto_870383 ?auto_870390 ) ) ( not ( = ?auto_870383 ?auto_870391 ) ) ( not ( = ?auto_870383 ?auto_870392 ) ) ( not ( = ?auto_870383 ?auto_870393 ) ) ( not ( = ?auto_870384 ?auto_870385 ) ) ( not ( = ?auto_870384 ?auto_870386 ) ) ( not ( = ?auto_870384 ?auto_870387 ) ) ( not ( = ?auto_870384 ?auto_870388 ) ) ( not ( = ?auto_870384 ?auto_870389 ) ) ( not ( = ?auto_870384 ?auto_870390 ) ) ( not ( = ?auto_870384 ?auto_870391 ) ) ( not ( = ?auto_870384 ?auto_870392 ) ) ( not ( = ?auto_870384 ?auto_870393 ) ) ( not ( = ?auto_870385 ?auto_870386 ) ) ( not ( = ?auto_870385 ?auto_870387 ) ) ( not ( = ?auto_870385 ?auto_870388 ) ) ( not ( = ?auto_870385 ?auto_870389 ) ) ( not ( = ?auto_870385 ?auto_870390 ) ) ( not ( = ?auto_870385 ?auto_870391 ) ) ( not ( = ?auto_870385 ?auto_870392 ) ) ( not ( = ?auto_870385 ?auto_870393 ) ) ( not ( = ?auto_870386 ?auto_870387 ) ) ( not ( = ?auto_870386 ?auto_870388 ) ) ( not ( = ?auto_870386 ?auto_870389 ) ) ( not ( = ?auto_870386 ?auto_870390 ) ) ( not ( = ?auto_870386 ?auto_870391 ) ) ( not ( = ?auto_870386 ?auto_870392 ) ) ( not ( = ?auto_870386 ?auto_870393 ) ) ( not ( = ?auto_870387 ?auto_870388 ) ) ( not ( = ?auto_870387 ?auto_870389 ) ) ( not ( = ?auto_870387 ?auto_870390 ) ) ( not ( = ?auto_870387 ?auto_870391 ) ) ( not ( = ?auto_870387 ?auto_870392 ) ) ( not ( = ?auto_870387 ?auto_870393 ) ) ( not ( = ?auto_870388 ?auto_870389 ) ) ( not ( = ?auto_870388 ?auto_870390 ) ) ( not ( = ?auto_870388 ?auto_870391 ) ) ( not ( = ?auto_870388 ?auto_870392 ) ) ( not ( = ?auto_870388 ?auto_870393 ) ) ( not ( = ?auto_870389 ?auto_870390 ) ) ( not ( = ?auto_870389 ?auto_870391 ) ) ( not ( = ?auto_870389 ?auto_870392 ) ) ( not ( = ?auto_870389 ?auto_870393 ) ) ( not ( = ?auto_870390 ?auto_870391 ) ) ( not ( = ?auto_870390 ?auto_870392 ) ) ( not ( = ?auto_870390 ?auto_870393 ) ) ( not ( = ?auto_870391 ?auto_870392 ) ) ( not ( = ?auto_870391 ?auto_870393 ) ) ( not ( = ?auto_870392 ?auto_870393 ) ) ( CLEAR ?auto_870390 ) ( ON ?auto_870391 ?auto_870392 ) ( CLEAR ?auto_870391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_870375 ?auto_870376 ?auto_870377 ?auto_870378 ?auto_870379 ?auto_870380 ?auto_870381 ?auto_870382 ?auto_870383 ?auto_870384 ?auto_870385 ?auto_870386 ?auto_870387 ?auto_870388 ?auto_870389 ?auto_870390 ?auto_870391 )
      ( MAKE-18PILE ?auto_870375 ?auto_870376 ?auto_870377 ?auto_870378 ?auto_870379 ?auto_870380 ?auto_870381 ?auto_870382 ?auto_870383 ?auto_870384 ?auto_870385 ?auto_870386 ?auto_870387 ?auto_870388 ?auto_870389 ?auto_870390 ?auto_870391 ?auto_870392 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870412 - BLOCK
      ?auto_870413 - BLOCK
      ?auto_870414 - BLOCK
      ?auto_870415 - BLOCK
      ?auto_870416 - BLOCK
      ?auto_870417 - BLOCK
      ?auto_870418 - BLOCK
      ?auto_870419 - BLOCK
      ?auto_870420 - BLOCK
      ?auto_870421 - BLOCK
      ?auto_870422 - BLOCK
      ?auto_870423 - BLOCK
      ?auto_870424 - BLOCK
      ?auto_870425 - BLOCK
      ?auto_870426 - BLOCK
      ?auto_870427 - BLOCK
      ?auto_870428 - BLOCK
      ?auto_870429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870429 ) ( ON-TABLE ?auto_870412 ) ( ON ?auto_870413 ?auto_870412 ) ( ON ?auto_870414 ?auto_870413 ) ( ON ?auto_870415 ?auto_870414 ) ( ON ?auto_870416 ?auto_870415 ) ( ON ?auto_870417 ?auto_870416 ) ( ON ?auto_870418 ?auto_870417 ) ( ON ?auto_870419 ?auto_870418 ) ( ON ?auto_870420 ?auto_870419 ) ( ON ?auto_870421 ?auto_870420 ) ( ON ?auto_870422 ?auto_870421 ) ( ON ?auto_870423 ?auto_870422 ) ( ON ?auto_870424 ?auto_870423 ) ( ON ?auto_870425 ?auto_870424 ) ( ON ?auto_870426 ?auto_870425 ) ( ON ?auto_870427 ?auto_870426 ) ( not ( = ?auto_870412 ?auto_870413 ) ) ( not ( = ?auto_870412 ?auto_870414 ) ) ( not ( = ?auto_870412 ?auto_870415 ) ) ( not ( = ?auto_870412 ?auto_870416 ) ) ( not ( = ?auto_870412 ?auto_870417 ) ) ( not ( = ?auto_870412 ?auto_870418 ) ) ( not ( = ?auto_870412 ?auto_870419 ) ) ( not ( = ?auto_870412 ?auto_870420 ) ) ( not ( = ?auto_870412 ?auto_870421 ) ) ( not ( = ?auto_870412 ?auto_870422 ) ) ( not ( = ?auto_870412 ?auto_870423 ) ) ( not ( = ?auto_870412 ?auto_870424 ) ) ( not ( = ?auto_870412 ?auto_870425 ) ) ( not ( = ?auto_870412 ?auto_870426 ) ) ( not ( = ?auto_870412 ?auto_870427 ) ) ( not ( = ?auto_870412 ?auto_870428 ) ) ( not ( = ?auto_870412 ?auto_870429 ) ) ( not ( = ?auto_870413 ?auto_870414 ) ) ( not ( = ?auto_870413 ?auto_870415 ) ) ( not ( = ?auto_870413 ?auto_870416 ) ) ( not ( = ?auto_870413 ?auto_870417 ) ) ( not ( = ?auto_870413 ?auto_870418 ) ) ( not ( = ?auto_870413 ?auto_870419 ) ) ( not ( = ?auto_870413 ?auto_870420 ) ) ( not ( = ?auto_870413 ?auto_870421 ) ) ( not ( = ?auto_870413 ?auto_870422 ) ) ( not ( = ?auto_870413 ?auto_870423 ) ) ( not ( = ?auto_870413 ?auto_870424 ) ) ( not ( = ?auto_870413 ?auto_870425 ) ) ( not ( = ?auto_870413 ?auto_870426 ) ) ( not ( = ?auto_870413 ?auto_870427 ) ) ( not ( = ?auto_870413 ?auto_870428 ) ) ( not ( = ?auto_870413 ?auto_870429 ) ) ( not ( = ?auto_870414 ?auto_870415 ) ) ( not ( = ?auto_870414 ?auto_870416 ) ) ( not ( = ?auto_870414 ?auto_870417 ) ) ( not ( = ?auto_870414 ?auto_870418 ) ) ( not ( = ?auto_870414 ?auto_870419 ) ) ( not ( = ?auto_870414 ?auto_870420 ) ) ( not ( = ?auto_870414 ?auto_870421 ) ) ( not ( = ?auto_870414 ?auto_870422 ) ) ( not ( = ?auto_870414 ?auto_870423 ) ) ( not ( = ?auto_870414 ?auto_870424 ) ) ( not ( = ?auto_870414 ?auto_870425 ) ) ( not ( = ?auto_870414 ?auto_870426 ) ) ( not ( = ?auto_870414 ?auto_870427 ) ) ( not ( = ?auto_870414 ?auto_870428 ) ) ( not ( = ?auto_870414 ?auto_870429 ) ) ( not ( = ?auto_870415 ?auto_870416 ) ) ( not ( = ?auto_870415 ?auto_870417 ) ) ( not ( = ?auto_870415 ?auto_870418 ) ) ( not ( = ?auto_870415 ?auto_870419 ) ) ( not ( = ?auto_870415 ?auto_870420 ) ) ( not ( = ?auto_870415 ?auto_870421 ) ) ( not ( = ?auto_870415 ?auto_870422 ) ) ( not ( = ?auto_870415 ?auto_870423 ) ) ( not ( = ?auto_870415 ?auto_870424 ) ) ( not ( = ?auto_870415 ?auto_870425 ) ) ( not ( = ?auto_870415 ?auto_870426 ) ) ( not ( = ?auto_870415 ?auto_870427 ) ) ( not ( = ?auto_870415 ?auto_870428 ) ) ( not ( = ?auto_870415 ?auto_870429 ) ) ( not ( = ?auto_870416 ?auto_870417 ) ) ( not ( = ?auto_870416 ?auto_870418 ) ) ( not ( = ?auto_870416 ?auto_870419 ) ) ( not ( = ?auto_870416 ?auto_870420 ) ) ( not ( = ?auto_870416 ?auto_870421 ) ) ( not ( = ?auto_870416 ?auto_870422 ) ) ( not ( = ?auto_870416 ?auto_870423 ) ) ( not ( = ?auto_870416 ?auto_870424 ) ) ( not ( = ?auto_870416 ?auto_870425 ) ) ( not ( = ?auto_870416 ?auto_870426 ) ) ( not ( = ?auto_870416 ?auto_870427 ) ) ( not ( = ?auto_870416 ?auto_870428 ) ) ( not ( = ?auto_870416 ?auto_870429 ) ) ( not ( = ?auto_870417 ?auto_870418 ) ) ( not ( = ?auto_870417 ?auto_870419 ) ) ( not ( = ?auto_870417 ?auto_870420 ) ) ( not ( = ?auto_870417 ?auto_870421 ) ) ( not ( = ?auto_870417 ?auto_870422 ) ) ( not ( = ?auto_870417 ?auto_870423 ) ) ( not ( = ?auto_870417 ?auto_870424 ) ) ( not ( = ?auto_870417 ?auto_870425 ) ) ( not ( = ?auto_870417 ?auto_870426 ) ) ( not ( = ?auto_870417 ?auto_870427 ) ) ( not ( = ?auto_870417 ?auto_870428 ) ) ( not ( = ?auto_870417 ?auto_870429 ) ) ( not ( = ?auto_870418 ?auto_870419 ) ) ( not ( = ?auto_870418 ?auto_870420 ) ) ( not ( = ?auto_870418 ?auto_870421 ) ) ( not ( = ?auto_870418 ?auto_870422 ) ) ( not ( = ?auto_870418 ?auto_870423 ) ) ( not ( = ?auto_870418 ?auto_870424 ) ) ( not ( = ?auto_870418 ?auto_870425 ) ) ( not ( = ?auto_870418 ?auto_870426 ) ) ( not ( = ?auto_870418 ?auto_870427 ) ) ( not ( = ?auto_870418 ?auto_870428 ) ) ( not ( = ?auto_870418 ?auto_870429 ) ) ( not ( = ?auto_870419 ?auto_870420 ) ) ( not ( = ?auto_870419 ?auto_870421 ) ) ( not ( = ?auto_870419 ?auto_870422 ) ) ( not ( = ?auto_870419 ?auto_870423 ) ) ( not ( = ?auto_870419 ?auto_870424 ) ) ( not ( = ?auto_870419 ?auto_870425 ) ) ( not ( = ?auto_870419 ?auto_870426 ) ) ( not ( = ?auto_870419 ?auto_870427 ) ) ( not ( = ?auto_870419 ?auto_870428 ) ) ( not ( = ?auto_870419 ?auto_870429 ) ) ( not ( = ?auto_870420 ?auto_870421 ) ) ( not ( = ?auto_870420 ?auto_870422 ) ) ( not ( = ?auto_870420 ?auto_870423 ) ) ( not ( = ?auto_870420 ?auto_870424 ) ) ( not ( = ?auto_870420 ?auto_870425 ) ) ( not ( = ?auto_870420 ?auto_870426 ) ) ( not ( = ?auto_870420 ?auto_870427 ) ) ( not ( = ?auto_870420 ?auto_870428 ) ) ( not ( = ?auto_870420 ?auto_870429 ) ) ( not ( = ?auto_870421 ?auto_870422 ) ) ( not ( = ?auto_870421 ?auto_870423 ) ) ( not ( = ?auto_870421 ?auto_870424 ) ) ( not ( = ?auto_870421 ?auto_870425 ) ) ( not ( = ?auto_870421 ?auto_870426 ) ) ( not ( = ?auto_870421 ?auto_870427 ) ) ( not ( = ?auto_870421 ?auto_870428 ) ) ( not ( = ?auto_870421 ?auto_870429 ) ) ( not ( = ?auto_870422 ?auto_870423 ) ) ( not ( = ?auto_870422 ?auto_870424 ) ) ( not ( = ?auto_870422 ?auto_870425 ) ) ( not ( = ?auto_870422 ?auto_870426 ) ) ( not ( = ?auto_870422 ?auto_870427 ) ) ( not ( = ?auto_870422 ?auto_870428 ) ) ( not ( = ?auto_870422 ?auto_870429 ) ) ( not ( = ?auto_870423 ?auto_870424 ) ) ( not ( = ?auto_870423 ?auto_870425 ) ) ( not ( = ?auto_870423 ?auto_870426 ) ) ( not ( = ?auto_870423 ?auto_870427 ) ) ( not ( = ?auto_870423 ?auto_870428 ) ) ( not ( = ?auto_870423 ?auto_870429 ) ) ( not ( = ?auto_870424 ?auto_870425 ) ) ( not ( = ?auto_870424 ?auto_870426 ) ) ( not ( = ?auto_870424 ?auto_870427 ) ) ( not ( = ?auto_870424 ?auto_870428 ) ) ( not ( = ?auto_870424 ?auto_870429 ) ) ( not ( = ?auto_870425 ?auto_870426 ) ) ( not ( = ?auto_870425 ?auto_870427 ) ) ( not ( = ?auto_870425 ?auto_870428 ) ) ( not ( = ?auto_870425 ?auto_870429 ) ) ( not ( = ?auto_870426 ?auto_870427 ) ) ( not ( = ?auto_870426 ?auto_870428 ) ) ( not ( = ?auto_870426 ?auto_870429 ) ) ( not ( = ?auto_870427 ?auto_870428 ) ) ( not ( = ?auto_870427 ?auto_870429 ) ) ( not ( = ?auto_870428 ?auto_870429 ) ) ( CLEAR ?auto_870427 ) ( ON ?auto_870428 ?auto_870429 ) ( CLEAR ?auto_870428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_870412 ?auto_870413 ?auto_870414 ?auto_870415 ?auto_870416 ?auto_870417 ?auto_870418 ?auto_870419 ?auto_870420 ?auto_870421 ?auto_870422 ?auto_870423 ?auto_870424 ?auto_870425 ?auto_870426 ?auto_870427 ?auto_870428 )
      ( MAKE-18PILE ?auto_870412 ?auto_870413 ?auto_870414 ?auto_870415 ?auto_870416 ?auto_870417 ?auto_870418 ?auto_870419 ?auto_870420 ?auto_870421 ?auto_870422 ?auto_870423 ?auto_870424 ?auto_870425 ?auto_870426 ?auto_870427 ?auto_870428 ?auto_870429 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870448 - BLOCK
      ?auto_870449 - BLOCK
      ?auto_870450 - BLOCK
      ?auto_870451 - BLOCK
      ?auto_870452 - BLOCK
      ?auto_870453 - BLOCK
      ?auto_870454 - BLOCK
      ?auto_870455 - BLOCK
      ?auto_870456 - BLOCK
      ?auto_870457 - BLOCK
      ?auto_870458 - BLOCK
      ?auto_870459 - BLOCK
      ?auto_870460 - BLOCK
      ?auto_870461 - BLOCK
      ?auto_870462 - BLOCK
      ?auto_870463 - BLOCK
      ?auto_870464 - BLOCK
      ?auto_870465 - BLOCK
    )
    :vars
    (
      ?auto_870466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870465 ?auto_870466 ) ( ON-TABLE ?auto_870448 ) ( ON ?auto_870449 ?auto_870448 ) ( ON ?auto_870450 ?auto_870449 ) ( ON ?auto_870451 ?auto_870450 ) ( ON ?auto_870452 ?auto_870451 ) ( ON ?auto_870453 ?auto_870452 ) ( ON ?auto_870454 ?auto_870453 ) ( ON ?auto_870455 ?auto_870454 ) ( ON ?auto_870456 ?auto_870455 ) ( ON ?auto_870457 ?auto_870456 ) ( ON ?auto_870458 ?auto_870457 ) ( ON ?auto_870459 ?auto_870458 ) ( ON ?auto_870460 ?auto_870459 ) ( ON ?auto_870461 ?auto_870460 ) ( ON ?auto_870462 ?auto_870461 ) ( not ( = ?auto_870448 ?auto_870449 ) ) ( not ( = ?auto_870448 ?auto_870450 ) ) ( not ( = ?auto_870448 ?auto_870451 ) ) ( not ( = ?auto_870448 ?auto_870452 ) ) ( not ( = ?auto_870448 ?auto_870453 ) ) ( not ( = ?auto_870448 ?auto_870454 ) ) ( not ( = ?auto_870448 ?auto_870455 ) ) ( not ( = ?auto_870448 ?auto_870456 ) ) ( not ( = ?auto_870448 ?auto_870457 ) ) ( not ( = ?auto_870448 ?auto_870458 ) ) ( not ( = ?auto_870448 ?auto_870459 ) ) ( not ( = ?auto_870448 ?auto_870460 ) ) ( not ( = ?auto_870448 ?auto_870461 ) ) ( not ( = ?auto_870448 ?auto_870462 ) ) ( not ( = ?auto_870448 ?auto_870463 ) ) ( not ( = ?auto_870448 ?auto_870464 ) ) ( not ( = ?auto_870448 ?auto_870465 ) ) ( not ( = ?auto_870448 ?auto_870466 ) ) ( not ( = ?auto_870449 ?auto_870450 ) ) ( not ( = ?auto_870449 ?auto_870451 ) ) ( not ( = ?auto_870449 ?auto_870452 ) ) ( not ( = ?auto_870449 ?auto_870453 ) ) ( not ( = ?auto_870449 ?auto_870454 ) ) ( not ( = ?auto_870449 ?auto_870455 ) ) ( not ( = ?auto_870449 ?auto_870456 ) ) ( not ( = ?auto_870449 ?auto_870457 ) ) ( not ( = ?auto_870449 ?auto_870458 ) ) ( not ( = ?auto_870449 ?auto_870459 ) ) ( not ( = ?auto_870449 ?auto_870460 ) ) ( not ( = ?auto_870449 ?auto_870461 ) ) ( not ( = ?auto_870449 ?auto_870462 ) ) ( not ( = ?auto_870449 ?auto_870463 ) ) ( not ( = ?auto_870449 ?auto_870464 ) ) ( not ( = ?auto_870449 ?auto_870465 ) ) ( not ( = ?auto_870449 ?auto_870466 ) ) ( not ( = ?auto_870450 ?auto_870451 ) ) ( not ( = ?auto_870450 ?auto_870452 ) ) ( not ( = ?auto_870450 ?auto_870453 ) ) ( not ( = ?auto_870450 ?auto_870454 ) ) ( not ( = ?auto_870450 ?auto_870455 ) ) ( not ( = ?auto_870450 ?auto_870456 ) ) ( not ( = ?auto_870450 ?auto_870457 ) ) ( not ( = ?auto_870450 ?auto_870458 ) ) ( not ( = ?auto_870450 ?auto_870459 ) ) ( not ( = ?auto_870450 ?auto_870460 ) ) ( not ( = ?auto_870450 ?auto_870461 ) ) ( not ( = ?auto_870450 ?auto_870462 ) ) ( not ( = ?auto_870450 ?auto_870463 ) ) ( not ( = ?auto_870450 ?auto_870464 ) ) ( not ( = ?auto_870450 ?auto_870465 ) ) ( not ( = ?auto_870450 ?auto_870466 ) ) ( not ( = ?auto_870451 ?auto_870452 ) ) ( not ( = ?auto_870451 ?auto_870453 ) ) ( not ( = ?auto_870451 ?auto_870454 ) ) ( not ( = ?auto_870451 ?auto_870455 ) ) ( not ( = ?auto_870451 ?auto_870456 ) ) ( not ( = ?auto_870451 ?auto_870457 ) ) ( not ( = ?auto_870451 ?auto_870458 ) ) ( not ( = ?auto_870451 ?auto_870459 ) ) ( not ( = ?auto_870451 ?auto_870460 ) ) ( not ( = ?auto_870451 ?auto_870461 ) ) ( not ( = ?auto_870451 ?auto_870462 ) ) ( not ( = ?auto_870451 ?auto_870463 ) ) ( not ( = ?auto_870451 ?auto_870464 ) ) ( not ( = ?auto_870451 ?auto_870465 ) ) ( not ( = ?auto_870451 ?auto_870466 ) ) ( not ( = ?auto_870452 ?auto_870453 ) ) ( not ( = ?auto_870452 ?auto_870454 ) ) ( not ( = ?auto_870452 ?auto_870455 ) ) ( not ( = ?auto_870452 ?auto_870456 ) ) ( not ( = ?auto_870452 ?auto_870457 ) ) ( not ( = ?auto_870452 ?auto_870458 ) ) ( not ( = ?auto_870452 ?auto_870459 ) ) ( not ( = ?auto_870452 ?auto_870460 ) ) ( not ( = ?auto_870452 ?auto_870461 ) ) ( not ( = ?auto_870452 ?auto_870462 ) ) ( not ( = ?auto_870452 ?auto_870463 ) ) ( not ( = ?auto_870452 ?auto_870464 ) ) ( not ( = ?auto_870452 ?auto_870465 ) ) ( not ( = ?auto_870452 ?auto_870466 ) ) ( not ( = ?auto_870453 ?auto_870454 ) ) ( not ( = ?auto_870453 ?auto_870455 ) ) ( not ( = ?auto_870453 ?auto_870456 ) ) ( not ( = ?auto_870453 ?auto_870457 ) ) ( not ( = ?auto_870453 ?auto_870458 ) ) ( not ( = ?auto_870453 ?auto_870459 ) ) ( not ( = ?auto_870453 ?auto_870460 ) ) ( not ( = ?auto_870453 ?auto_870461 ) ) ( not ( = ?auto_870453 ?auto_870462 ) ) ( not ( = ?auto_870453 ?auto_870463 ) ) ( not ( = ?auto_870453 ?auto_870464 ) ) ( not ( = ?auto_870453 ?auto_870465 ) ) ( not ( = ?auto_870453 ?auto_870466 ) ) ( not ( = ?auto_870454 ?auto_870455 ) ) ( not ( = ?auto_870454 ?auto_870456 ) ) ( not ( = ?auto_870454 ?auto_870457 ) ) ( not ( = ?auto_870454 ?auto_870458 ) ) ( not ( = ?auto_870454 ?auto_870459 ) ) ( not ( = ?auto_870454 ?auto_870460 ) ) ( not ( = ?auto_870454 ?auto_870461 ) ) ( not ( = ?auto_870454 ?auto_870462 ) ) ( not ( = ?auto_870454 ?auto_870463 ) ) ( not ( = ?auto_870454 ?auto_870464 ) ) ( not ( = ?auto_870454 ?auto_870465 ) ) ( not ( = ?auto_870454 ?auto_870466 ) ) ( not ( = ?auto_870455 ?auto_870456 ) ) ( not ( = ?auto_870455 ?auto_870457 ) ) ( not ( = ?auto_870455 ?auto_870458 ) ) ( not ( = ?auto_870455 ?auto_870459 ) ) ( not ( = ?auto_870455 ?auto_870460 ) ) ( not ( = ?auto_870455 ?auto_870461 ) ) ( not ( = ?auto_870455 ?auto_870462 ) ) ( not ( = ?auto_870455 ?auto_870463 ) ) ( not ( = ?auto_870455 ?auto_870464 ) ) ( not ( = ?auto_870455 ?auto_870465 ) ) ( not ( = ?auto_870455 ?auto_870466 ) ) ( not ( = ?auto_870456 ?auto_870457 ) ) ( not ( = ?auto_870456 ?auto_870458 ) ) ( not ( = ?auto_870456 ?auto_870459 ) ) ( not ( = ?auto_870456 ?auto_870460 ) ) ( not ( = ?auto_870456 ?auto_870461 ) ) ( not ( = ?auto_870456 ?auto_870462 ) ) ( not ( = ?auto_870456 ?auto_870463 ) ) ( not ( = ?auto_870456 ?auto_870464 ) ) ( not ( = ?auto_870456 ?auto_870465 ) ) ( not ( = ?auto_870456 ?auto_870466 ) ) ( not ( = ?auto_870457 ?auto_870458 ) ) ( not ( = ?auto_870457 ?auto_870459 ) ) ( not ( = ?auto_870457 ?auto_870460 ) ) ( not ( = ?auto_870457 ?auto_870461 ) ) ( not ( = ?auto_870457 ?auto_870462 ) ) ( not ( = ?auto_870457 ?auto_870463 ) ) ( not ( = ?auto_870457 ?auto_870464 ) ) ( not ( = ?auto_870457 ?auto_870465 ) ) ( not ( = ?auto_870457 ?auto_870466 ) ) ( not ( = ?auto_870458 ?auto_870459 ) ) ( not ( = ?auto_870458 ?auto_870460 ) ) ( not ( = ?auto_870458 ?auto_870461 ) ) ( not ( = ?auto_870458 ?auto_870462 ) ) ( not ( = ?auto_870458 ?auto_870463 ) ) ( not ( = ?auto_870458 ?auto_870464 ) ) ( not ( = ?auto_870458 ?auto_870465 ) ) ( not ( = ?auto_870458 ?auto_870466 ) ) ( not ( = ?auto_870459 ?auto_870460 ) ) ( not ( = ?auto_870459 ?auto_870461 ) ) ( not ( = ?auto_870459 ?auto_870462 ) ) ( not ( = ?auto_870459 ?auto_870463 ) ) ( not ( = ?auto_870459 ?auto_870464 ) ) ( not ( = ?auto_870459 ?auto_870465 ) ) ( not ( = ?auto_870459 ?auto_870466 ) ) ( not ( = ?auto_870460 ?auto_870461 ) ) ( not ( = ?auto_870460 ?auto_870462 ) ) ( not ( = ?auto_870460 ?auto_870463 ) ) ( not ( = ?auto_870460 ?auto_870464 ) ) ( not ( = ?auto_870460 ?auto_870465 ) ) ( not ( = ?auto_870460 ?auto_870466 ) ) ( not ( = ?auto_870461 ?auto_870462 ) ) ( not ( = ?auto_870461 ?auto_870463 ) ) ( not ( = ?auto_870461 ?auto_870464 ) ) ( not ( = ?auto_870461 ?auto_870465 ) ) ( not ( = ?auto_870461 ?auto_870466 ) ) ( not ( = ?auto_870462 ?auto_870463 ) ) ( not ( = ?auto_870462 ?auto_870464 ) ) ( not ( = ?auto_870462 ?auto_870465 ) ) ( not ( = ?auto_870462 ?auto_870466 ) ) ( not ( = ?auto_870463 ?auto_870464 ) ) ( not ( = ?auto_870463 ?auto_870465 ) ) ( not ( = ?auto_870463 ?auto_870466 ) ) ( not ( = ?auto_870464 ?auto_870465 ) ) ( not ( = ?auto_870464 ?auto_870466 ) ) ( not ( = ?auto_870465 ?auto_870466 ) ) ( ON ?auto_870464 ?auto_870465 ) ( CLEAR ?auto_870462 ) ( ON ?auto_870463 ?auto_870464 ) ( CLEAR ?auto_870463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_870448 ?auto_870449 ?auto_870450 ?auto_870451 ?auto_870452 ?auto_870453 ?auto_870454 ?auto_870455 ?auto_870456 ?auto_870457 ?auto_870458 ?auto_870459 ?auto_870460 ?auto_870461 ?auto_870462 ?auto_870463 )
      ( MAKE-18PILE ?auto_870448 ?auto_870449 ?auto_870450 ?auto_870451 ?auto_870452 ?auto_870453 ?auto_870454 ?auto_870455 ?auto_870456 ?auto_870457 ?auto_870458 ?auto_870459 ?auto_870460 ?auto_870461 ?auto_870462 ?auto_870463 ?auto_870464 ?auto_870465 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870485 - BLOCK
      ?auto_870486 - BLOCK
      ?auto_870487 - BLOCK
      ?auto_870488 - BLOCK
      ?auto_870489 - BLOCK
      ?auto_870490 - BLOCK
      ?auto_870491 - BLOCK
      ?auto_870492 - BLOCK
      ?auto_870493 - BLOCK
      ?auto_870494 - BLOCK
      ?auto_870495 - BLOCK
      ?auto_870496 - BLOCK
      ?auto_870497 - BLOCK
      ?auto_870498 - BLOCK
      ?auto_870499 - BLOCK
      ?auto_870500 - BLOCK
      ?auto_870501 - BLOCK
      ?auto_870502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870502 ) ( ON-TABLE ?auto_870485 ) ( ON ?auto_870486 ?auto_870485 ) ( ON ?auto_870487 ?auto_870486 ) ( ON ?auto_870488 ?auto_870487 ) ( ON ?auto_870489 ?auto_870488 ) ( ON ?auto_870490 ?auto_870489 ) ( ON ?auto_870491 ?auto_870490 ) ( ON ?auto_870492 ?auto_870491 ) ( ON ?auto_870493 ?auto_870492 ) ( ON ?auto_870494 ?auto_870493 ) ( ON ?auto_870495 ?auto_870494 ) ( ON ?auto_870496 ?auto_870495 ) ( ON ?auto_870497 ?auto_870496 ) ( ON ?auto_870498 ?auto_870497 ) ( ON ?auto_870499 ?auto_870498 ) ( not ( = ?auto_870485 ?auto_870486 ) ) ( not ( = ?auto_870485 ?auto_870487 ) ) ( not ( = ?auto_870485 ?auto_870488 ) ) ( not ( = ?auto_870485 ?auto_870489 ) ) ( not ( = ?auto_870485 ?auto_870490 ) ) ( not ( = ?auto_870485 ?auto_870491 ) ) ( not ( = ?auto_870485 ?auto_870492 ) ) ( not ( = ?auto_870485 ?auto_870493 ) ) ( not ( = ?auto_870485 ?auto_870494 ) ) ( not ( = ?auto_870485 ?auto_870495 ) ) ( not ( = ?auto_870485 ?auto_870496 ) ) ( not ( = ?auto_870485 ?auto_870497 ) ) ( not ( = ?auto_870485 ?auto_870498 ) ) ( not ( = ?auto_870485 ?auto_870499 ) ) ( not ( = ?auto_870485 ?auto_870500 ) ) ( not ( = ?auto_870485 ?auto_870501 ) ) ( not ( = ?auto_870485 ?auto_870502 ) ) ( not ( = ?auto_870486 ?auto_870487 ) ) ( not ( = ?auto_870486 ?auto_870488 ) ) ( not ( = ?auto_870486 ?auto_870489 ) ) ( not ( = ?auto_870486 ?auto_870490 ) ) ( not ( = ?auto_870486 ?auto_870491 ) ) ( not ( = ?auto_870486 ?auto_870492 ) ) ( not ( = ?auto_870486 ?auto_870493 ) ) ( not ( = ?auto_870486 ?auto_870494 ) ) ( not ( = ?auto_870486 ?auto_870495 ) ) ( not ( = ?auto_870486 ?auto_870496 ) ) ( not ( = ?auto_870486 ?auto_870497 ) ) ( not ( = ?auto_870486 ?auto_870498 ) ) ( not ( = ?auto_870486 ?auto_870499 ) ) ( not ( = ?auto_870486 ?auto_870500 ) ) ( not ( = ?auto_870486 ?auto_870501 ) ) ( not ( = ?auto_870486 ?auto_870502 ) ) ( not ( = ?auto_870487 ?auto_870488 ) ) ( not ( = ?auto_870487 ?auto_870489 ) ) ( not ( = ?auto_870487 ?auto_870490 ) ) ( not ( = ?auto_870487 ?auto_870491 ) ) ( not ( = ?auto_870487 ?auto_870492 ) ) ( not ( = ?auto_870487 ?auto_870493 ) ) ( not ( = ?auto_870487 ?auto_870494 ) ) ( not ( = ?auto_870487 ?auto_870495 ) ) ( not ( = ?auto_870487 ?auto_870496 ) ) ( not ( = ?auto_870487 ?auto_870497 ) ) ( not ( = ?auto_870487 ?auto_870498 ) ) ( not ( = ?auto_870487 ?auto_870499 ) ) ( not ( = ?auto_870487 ?auto_870500 ) ) ( not ( = ?auto_870487 ?auto_870501 ) ) ( not ( = ?auto_870487 ?auto_870502 ) ) ( not ( = ?auto_870488 ?auto_870489 ) ) ( not ( = ?auto_870488 ?auto_870490 ) ) ( not ( = ?auto_870488 ?auto_870491 ) ) ( not ( = ?auto_870488 ?auto_870492 ) ) ( not ( = ?auto_870488 ?auto_870493 ) ) ( not ( = ?auto_870488 ?auto_870494 ) ) ( not ( = ?auto_870488 ?auto_870495 ) ) ( not ( = ?auto_870488 ?auto_870496 ) ) ( not ( = ?auto_870488 ?auto_870497 ) ) ( not ( = ?auto_870488 ?auto_870498 ) ) ( not ( = ?auto_870488 ?auto_870499 ) ) ( not ( = ?auto_870488 ?auto_870500 ) ) ( not ( = ?auto_870488 ?auto_870501 ) ) ( not ( = ?auto_870488 ?auto_870502 ) ) ( not ( = ?auto_870489 ?auto_870490 ) ) ( not ( = ?auto_870489 ?auto_870491 ) ) ( not ( = ?auto_870489 ?auto_870492 ) ) ( not ( = ?auto_870489 ?auto_870493 ) ) ( not ( = ?auto_870489 ?auto_870494 ) ) ( not ( = ?auto_870489 ?auto_870495 ) ) ( not ( = ?auto_870489 ?auto_870496 ) ) ( not ( = ?auto_870489 ?auto_870497 ) ) ( not ( = ?auto_870489 ?auto_870498 ) ) ( not ( = ?auto_870489 ?auto_870499 ) ) ( not ( = ?auto_870489 ?auto_870500 ) ) ( not ( = ?auto_870489 ?auto_870501 ) ) ( not ( = ?auto_870489 ?auto_870502 ) ) ( not ( = ?auto_870490 ?auto_870491 ) ) ( not ( = ?auto_870490 ?auto_870492 ) ) ( not ( = ?auto_870490 ?auto_870493 ) ) ( not ( = ?auto_870490 ?auto_870494 ) ) ( not ( = ?auto_870490 ?auto_870495 ) ) ( not ( = ?auto_870490 ?auto_870496 ) ) ( not ( = ?auto_870490 ?auto_870497 ) ) ( not ( = ?auto_870490 ?auto_870498 ) ) ( not ( = ?auto_870490 ?auto_870499 ) ) ( not ( = ?auto_870490 ?auto_870500 ) ) ( not ( = ?auto_870490 ?auto_870501 ) ) ( not ( = ?auto_870490 ?auto_870502 ) ) ( not ( = ?auto_870491 ?auto_870492 ) ) ( not ( = ?auto_870491 ?auto_870493 ) ) ( not ( = ?auto_870491 ?auto_870494 ) ) ( not ( = ?auto_870491 ?auto_870495 ) ) ( not ( = ?auto_870491 ?auto_870496 ) ) ( not ( = ?auto_870491 ?auto_870497 ) ) ( not ( = ?auto_870491 ?auto_870498 ) ) ( not ( = ?auto_870491 ?auto_870499 ) ) ( not ( = ?auto_870491 ?auto_870500 ) ) ( not ( = ?auto_870491 ?auto_870501 ) ) ( not ( = ?auto_870491 ?auto_870502 ) ) ( not ( = ?auto_870492 ?auto_870493 ) ) ( not ( = ?auto_870492 ?auto_870494 ) ) ( not ( = ?auto_870492 ?auto_870495 ) ) ( not ( = ?auto_870492 ?auto_870496 ) ) ( not ( = ?auto_870492 ?auto_870497 ) ) ( not ( = ?auto_870492 ?auto_870498 ) ) ( not ( = ?auto_870492 ?auto_870499 ) ) ( not ( = ?auto_870492 ?auto_870500 ) ) ( not ( = ?auto_870492 ?auto_870501 ) ) ( not ( = ?auto_870492 ?auto_870502 ) ) ( not ( = ?auto_870493 ?auto_870494 ) ) ( not ( = ?auto_870493 ?auto_870495 ) ) ( not ( = ?auto_870493 ?auto_870496 ) ) ( not ( = ?auto_870493 ?auto_870497 ) ) ( not ( = ?auto_870493 ?auto_870498 ) ) ( not ( = ?auto_870493 ?auto_870499 ) ) ( not ( = ?auto_870493 ?auto_870500 ) ) ( not ( = ?auto_870493 ?auto_870501 ) ) ( not ( = ?auto_870493 ?auto_870502 ) ) ( not ( = ?auto_870494 ?auto_870495 ) ) ( not ( = ?auto_870494 ?auto_870496 ) ) ( not ( = ?auto_870494 ?auto_870497 ) ) ( not ( = ?auto_870494 ?auto_870498 ) ) ( not ( = ?auto_870494 ?auto_870499 ) ) ( not ( = ?auto_870494 ?auto_870500 ) ) ( not ( = ?auto_870494 ?auto_870501 ) ) ( not ( = ?auto_870494 ?auto_870502 ) ) ( not ( = ?auto_870495 ?auto_870496 ) ) ( not ( = ?auto_870495 ?auto_870497 ) ) ( not ( = ?auto_870495 ?auto_870498 ) ) ( not ( = ?auto_870495 ?auto_870499 ) ) ( not ( = ?auto_870495 ?auto_870500 ) ) ( not ( = ?auto_870495 ?auto_870501 ) ) ( not ( = ?auto_870495 ?auto_870502 ) ) ( not ( = ?auto_870496 ?auto_870497 ) ) ( not ( = ?auto_870496 ?auto_870498 ) ) ( not ( = ?auto_870496 ?auto_870499 ) ) ( not ( = ?auto_870496 ?auto_870500 ) ) ( not ( = ?auto_870496 ?auto_870501 ) ) ( not ( = ?auto_870496 ?auto_870502 ) ) ( not ( = ?auto_870497 ?auto_870498 ) ) ( not ( = ?auto_870497 ?auto_870499 ) ) ( not ( = ?auto_870497 ?auto_870500 ) ) ( not ( = ?auto_870497 ?auto_870501 ) ) ( not ( = ?auto_870497 ?auto_870502 ) ) ( not ( = ?auto_870498 ?auto_870499 ) ) ( not ( = ?auto_870498 ?auto_870500 ) ) ( not ( = ?auto_870498 ?auto_870501 ) ) ( not ( = ?auto_870498 ?auto_870502 ) ) ( not ( = ?auto_870499 ?auto_870500 ) ) ( not ( = ?auto_870499 ?auto_870501 ) ) ( not ( = ?auto_870499 ?auto_870502 ) ) ( not ( = ?auto_870500 ?auto_870501 ) ) ( not ( = ?auto_870500 ?auto_870502 ) ) ( not ( = ?auto_870501 ?auto_870502 ) ) ( ON ?auto_870501 ?auto_870502 ) ( CLEAR ?auto_870499 ) ( ON ?auto_870500 ?auto_870501 ) ( CLEAR ?auto_870500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_870485 ?auto_870486 ?auto_870487 ?auto_870488 ?auto_870489 ?auto_870490 ?auto_870491 ?auto_870492 ?auto_870493 ?auto_870494 ?auto_870495 ?auto_870496 ?auto_870497 ?auto_870498 ?auto_870499 ?auto_870500 )
      ( MAKE-18PILE ?auto_870485 ?auto_870486 ?auto_870487 ?auto_870488 ?auto_870489 ?auto_870490 ?auto_870491 ?auto_870492 ?auto_870493 ?auto_870494 ?auto_870495 ?auto_870496 ?auto_870497 ?auto_870498 ?auto_870499 ?auto_870500 ?auto_870501 ?auto_870502 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870521 - BLOCK
      ?auto_870522 - BLOCK
      ?auto_870523 - BLOCK
      ?auto_870524 - BLOCK
      ?auto_870525 - BLOCK
      ?auto_870526 - BLOCK
      ?auto_870527 - BLOCK
      ?auto_870528 - BLOCK
      ?auto_870529 - BLOCK
      ?auto_870530 - BLOCK
      ?auto_870531 - BLOCK
      ?auto_870532 - BLOCK
      ?auto_870533 - BLOCK
      ?auto_870534 - BLOCK
      ?auto_870535 - BLOCK
      ?auto_870536 - BLOCK
      ?auto_870537 - BLOCK
      ?auto_870538 - BLOCK
    )
    :vars
    (
      ?auto_870539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870538 ?auto_870539 ) ( ON-TABLE ?auto_870521 ) ( ON ?auto_870522 ?auto_870521 ) ( ON ?auto_870523 ?auto_870522 ) ( ON ?auto_870524 ?auto_870523 ) ( ON ?auto_870525 ?auto_870524 ) ( ON ?auto_870526 ?auto_870525 ) ( ON ?auto_870527 ?auto_870526 ) ( ON ?auto_870528 ?auto_870527 ) ( ON ?auto_870529 ?auto_870528 ) ( ON ?auto_870530 ?auto_870529 ) ( ON ?auto_870531 ?auto_870530 ) ( ON ?auto_870532 ?auto_870531 ) ( ON ?auto_870533 ?auto_870532 ) ( ON ?auto_870534 ?auto_870533 ) ( not ( = ?auto_870521 ?auto_870522 ) ) ( not ( = ?auto_870521 ?auto_870523 ) ) ( not ( = ?auto_870521 ?auto_870524 ) ) ( not ( = ?auto_870521 ?auto_870525 ) ) ( not ( = ?auto_870521 ?auto_870526 ) ) ( not ( = ?auto_870521 ?auto_870527 ) ) ( not ( = ?auto_870521 ?auto_870528 ) ) ( not ( = ?auto_870521 ?auto_870529 ) ) ( not ( = ?auto_870521 ?auto_870530 ) ) ( not ( = ?auto_870521 ?auto_870531 ) ) ( not ( = ?auto_870521 ?auto_870532 ) ) ( not ( = ?auto_870521 ?auto_870533 ) ) ( not ( = ?auto_870521 ?auto_870534 ) ) ( not ( = ?auto_870521 ?auto_870535 ) ) ( not ( = ?auto_870521 ?auto_870536 ) ) ( not ( = ?auto_870521 ?auto_870537 ) ) ( not ( = ?auto_870521 ?auto_870538 ) ) ( not ( = ?auto_870521 ?auto_870539 ) ) ( not ( = ?auto_870522 ?auto_870523 ) ) ( not ( = ?auto_870522 ?auto_870524 ) ) ( not ( = ?auto_870522 ?auto_870525 ) ) ( not ( = ?auto_870522 ?auto_870526 ) ) ( not ( = ?auto_870522 ?auto_870527 ) ) ( not ( = ?auto_870522 ?auto_870528 ) ) ( not ( = ?auto_870522 ?auto_870529 ) ) ( not ( = ?auto_870522 ?auto_870530 ) ) ( not ( = ?auto_870522 ?auto_870531 ) ) ( not ( = ?auto_870522 ?auto_870532 ) ) ( not ( = ?auto_870522 ?auto_870533 ) ) ( not ( = ?auto_870522 ?auto_870534 ) ) ( not ( = ?auto_870522 ?auto_870535 ) ) ( not ( = ?auto_870522 ?auto_870536 ) ) ( not ( = ?auto_870522 ?auto_870537 ) ) ( not ( = ?auto_870522 ?auto_870538 ) ) ( not ( = ?auto_870522 ?auto_870539 ) ) ( not ( = ?auto_870523 ?auto_870524 ) ) ( not ( = ?auto_870523 ?auto_870525 ) ) ( not ( = ?auto_870523 ?auto_870526 ) ) ( not ( = ?auto_870523 ?auto_870527 ) ) ( not ( = ?auto_870523 ?auto_870528 ) ) ( not ( = ?auto_870523 ?auto_870529 ) ) ( not ( = ?auto_870523 ?auto_870530 ) ) ( not ( = ?auto_870523 ?auto_870531 ) ) ( not ( = ?auto_870523 ?auto_870532 ) ) ( not ( = ?auto_870523 ?auto_870533 ) ) ( not ( = ?auto_870523 ?auto_870534 ) ) ( not ( = ?auto_870523 ?auto_870535 ) ) ( not ( = ?auto_870523 ?auto_870536 ) ) ( not ( = ?auto_870523 ?auto_870537 ) ) ( not ( = ?auto_870523 ?auto_870538 ) ) ( not ( = ?auto_870523 ?auto_870539 ) ) ( not ( = ?auto_870524 ?auto_870525 ) ) ( not ( = ?auto_870524 ?auto_870526 ) ) ( not ( = ?auto_870524 ?auto_870527 ) ) ( not ( = ?auto_870524 ?auto_870528 ) ) ( not ( = ?auto_870524 ?auto_870529 ) ) ( not ( = ?auto_870524 ?auto_870530 ) ) ( not ( = ?auto_870524 ?auto_870531 ) ) ( not ( = ?auto_870524 ?auto_870532 ) ) ( not ( = ?auto_870524 ?auto_870533 ) ) ( not ( = ?auto_870524 ?auto_870534 ) ) ( not ( = ?auto_870524 ?auto_870535 ) ) ( not ( = ?auto_870524 ?auto_870536 ) ) ( not ( = ?auto_870524 ?auto_870537 ) ) ( not ( = ?auto_870524 ?auto_870538 ) ) ( not ( = ?auto_870524 ?auto_870539 ) ) ( not ( = ?auto_870525 ?auto_870526 ) ) ( not ( = ?auto_870525 ?auto_870527 ) ) ( not ( = ?auto_870525 ?auto_870528 ) ) ( not ( = ?auto_870525 ?auto_870529 ) ) ( not ( = ?auto_870525 ?auto_870530 ) ) ( not ( = ?auto_870525 ?auto_870531 ) ) ( not ( = ?auto_870525 ?auto_870532 ) ) ( not ( = ?auto_870525 ?auto_870533 ) ) ( not ( = ?auto_870525 ?auto_870534 ) ) ( not ( = ?auto_870525 ?auto_870535 ) ) ( not ( = ?auto_870525 ?auto_870536 ) ) ( not ( = ?auto_870525 ?auto_870537 ) ) ( not ( = ?auto_870525 ?auto_870538 ) ) ( not ( = ?auto_870525 ?auto_870539 ) ) ( not ( = ?auto_870526 ?auto_870527 ) ) ( not ( = ?auto_870526 ?auto_870528 ) ) ( not ( = ?auto_870526 ?auto_870529 ) ) ( not ( = ?auto_870526 ?auto_870530 ) ) ( not ( = ?auto_870526 ?auto_870531 ) ) ( not ( = ?auto_870526 ?auto_870532 ) ) ( not ( = ?auto_870526 ?auto_870533 ) ) ( not ( = ?auto_870526 ?auto_870534 ) ) ( not ( = ?auto_870526 ?auto_870535 ) ) ( not ( = ?auto_870526 ?auto_870536 ) ) ( not ( = ?auto_870526 ?auto_870537 ) ) ( not ( = ?auto_870526 ?auto_870538 ) ) ( not ( = ?auto_870526 ?auto_870539 ) ) ( not ( = ?auto_870527 ?auto_870528 ) ) ( not ( = ?auto_870527 ?auto_870529 ) ) ( not ( = ?auto_870527 ?auto_870530 ) ) ( not ( = ?auto_870527 ?auto_870531 ) ) ( not ( = ?auto_870527 ?auto_870532 ) ) ( not ( = ?auto_870527 ?auto_870533 ) ) ( not ( = ?auto_870527 ?auto_870534 ) ) ( not ( = ?auto_870527 ?auto_870535 ) ) ( not ( = ?auto_870527 ?auto_870536 ) ) ( not ( = ?auto_870527 ?auto_870537 ) ) ( not ( = ?auto_870527 ?auto_870538 ) ) ( not ( = ?auto_870527 ?auto_870539 ) ) ( not ( = ?auto_870528 ?auto_870529 ) ) ( not ( = ?auto_870528 ?auto_870530 ) ) ( not ( = ?auto_870528 ?auto_870531 ) ) ( not ( = ?auto_870528 ?auto_870532 ) ) ( not ( = ?auto_870528 ?auto_870533 ) ) ( not ( = ?auto_870528 ?auto_870534 ) ) ( not ( = ?auto_870528 ?auto_870535 ) ) ( not ( = ?auto_870528 ?auto_870536 ) ) ( not ( = ?auto_870528 ?auto_870537 ) ) ( not ( = ?auto_870528 ?auto_870538 ) ) ( not ( = ?auto_870528 ?auto_870539 ) ) ( not ( = ?auto_870529 ?auto_870530 ) ) ( not ( = ?auto_870529 ?auto_870531 ) ) ( not ( = ?auto_870529 ?auto_870532 ) ) ( not ( = ?auto_870529 ?auto_870533 ) ) ( not ( = ?auto_870529 ?auto_870534 ) ) ( not ( = ?auto_870529 ?auto_870535 ) ) ( not ( = ?auto_870529 ?auto_870536 ) ) ( not ( = ?auto_870529 ?auto_870537 ) ) ( not ( = ?auto_870529 ?auto_870538 ) ) ( not ( = ?auto_870529 ?auto_870539 ) ) ( not ( = ?auto_870530 ?auto_870531 ) ) ( not ( = ?auto_870530 ?auto_870532 ) ) ( not ( = ?auto_870530 ?auto_870533 ) ) ( not ( = ?auto_870530 ?auto_870534 ) ) ( not ( = ?auto_870530 ?auto_870535 ) ) ( not ( = ?auto_870530 ?auto_870536 ) ) ( not ( = ?auto_870530 ?auto_870537 ) ) ( not ( = ?auto_870530 ?auto_870538 ) ) ( not ( = ?auto_870530 ?auto_870539 ) ) ( not ( = ?auto_870531 ?auto_870532 ) ) ( not ( = ?auto_870531 ?auto_870533 ) ) ( not ( = ?auto_870531 ?auto_870534 ) ) ( not ( = ?auto_870531 ?auto_870535 ) ) ( not ( = ?auto_870531 ?auto_870536 ) ) ( not ( = ?auto_870531 ?auto_870537 ) ) ( not ( = ?auto_870531 ?auto_870538 ) ) ( not ( = ?auto_870531 ?auto_870539 ) ) ( not ( = ?auto_870532 ?auto_870533 ) ) ( not ( = ?auto_870532 ?auto_870534 ) ) ( not ( = ?auto_870532 ?auto_870535 ) ) ( not ( = ?auto_870532 ?auto_870536 ) ) ( not ( = ?auto_870532 ?auto_870537 ) ) ( not ( = ?auto_870532 ?auto_870538 ) ) ( not ( = ?auto_870532 ?auto_870539 ) ) ( not ( = ?auto_870533 ?auto_870534 ) ) ( not ( = ?auto_870533 ?auto_870535 ) ) ( not ( = ?auto_870533 ?auto_870536 ) ) ( not ( = ?auto_870533 ?auto_870537 ) ) ( not ( = ?auto_870533 ?auto_870538 ) ) ( not ( = ?auto_870533 ?auto_870539 ) ) ( not ( = ?auto_870534 ?auto_870535 ) ) ( not ( = ?auto_870534 ?auto_870536 ) ) ( not ( = ?auto_870534 ?auto_870537 ) ) ( not ( = ?auto_870534 ?auto_870538 ) ) ( not ( = ?auto_870534 ?auto_870539 ) ) ( not ( = ?auto_870535 ?auto_870536 ) ) ( not ( = ?auto_870535 ?auto_870537 ) ) ( not ( = ?auto_870535 ?auto_870538 ) ) ( not ( = ?auto_870535 ?auto_870539 ) ) ( not ( = ?auto_870536 ?auto_870537 ) ) ( not ( = ?auto_870536 ?auto_870538 ) ) ( not ( = ?auto_870536 ?auto_870539 ) ) ( not ( = ?auto_870537 ?auto_870538 ) ) ( not ( = ?auto_870537 ?auto_870539 ) ) ( not ( = ?auto_870538 ?auto_870539 ) ) ( ON ?auto_870537 ?auto_870538 ) ( ON ?auto_870536 ?auto_870537 ) ( CLEAR ?auto_870534 ) ( ON ?auto_870535 ?auto_870536 ) ( CLEAR ?auto_870535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_870521 ?auto_870522 ?auto_870523 ?auto_870524 ?auto_870525 ?auto_870526 ?auto_870527 ?auto_870528 ?auto_870529 ?auto_870530 ?auto_870531 ?auto_870532 ?auto_870533 ?auto_870534 ?auto_870535 )
      ( MAKE-18PILE ?auto_870521 ?auto_870522 ?auto_870523 ?auto_870524 ?auto_870525 ?auto_870526 ?auto_870527 ?auto_870528 ?auto_870529 ?auto_870530 ?auto_870531 ?auto_870532 ?auto_870533 ?auto_870534 ?auto_870535 ?auto_870536 ?auto_870537 ?auto_870538 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870558 - BLOCK
      ?auto_870559 - BLOCK
      ?auto_870560 - BLOCK
      ?auto_870561 - BLOCK
      ?auto_870562 - BLOCK
      ?auto_870563 - BLOCK
      ?auto_870564 - BLOCK
      ?auto_870565 - BLOCK
      ?auto_870566 - BLOCK
      ?auto_870567 - BLOCK
      ?auto_870568 - BLOCK
      ?auto_870569 - BLOCK
      ?auto_870570 - BLOCK
      ?auto_870571 - BLOCK
      ?auto_870572 - BLOCK
      ?auto_870573 - BLOCK
      ?auto_870574 - BLOCK
      ?auto_870575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870575 ) ( ON-TABLE ?auto_870558 ) ( ON ?auto_870559 ?auto_870558 ) ( ON ?auto_870560 ?auto_870559 ) ( ON ?auto_870561 ?auto_870560 ) ( ON ?auto_870562 ?auto_870561 ) ( ON ?auto_870563 ?auto_870562 ) ( ON ?auto_870564 ?auto_870563 ) ( ON ?auto_870565 ?auto_870564 ) ( ON ?auto_870566 ?auto_870565 ) ( ON ?auto_870567 ?auto_870566 ) ( ON ?auto_870568 ?auto_870567 ) ( ON ?auto_870569 ?auto_870568 ) ( ON ?auto_870570 ?auto_870569 ) ( ON ?auto_870571 ?auto_870570 ) ( not ( = ?auto_870558 ?auto_870559 ) ) ( not ( = ?auto_870558 ?auto_870560 ) ) ( not ( = ?auto_870558 ?auto_870561 ) ) ( not ( = ?auto_870558 ?auto_870562 ) ) ( not ( = ?auto_870558 ?auto_870563 ) ) ( not ( = ?auto_870558 ?auto_870564 ) ) ( not ( = ?auto_870558 ?auto_870565 ) ) ( not ( = ?auto_870558 ?auto_870566 ) ) ( not ( = ?auto_870558 ?auto_870567 ) ) ( not ( = ?auto_870558 ?auto_870568 ) ) ( not ( = ?auto_870558 ?auto_870569 ) ) ( not ( = ?auto_870558 ?auto_870570 ) ) ( not ( = ?auto_870558 ?auto_870571 ) ) ( not ( = ?auto_870558 ?auto_870572 ) ) ( not ( = ?auto_870558 ?auto_870573 ) ) ( not ( = ?auto_870558 ?auto_870574 ) ) ( not ( = ?auto_870558 ?auto_870575 ) ) ( not ( = ?auto_870559 ?auto_870560 ) ) ( not ( = ?auto_870559 ?auto_870561 ) ) ( not ( = ?auto_870559 ?auto_870562 ) ) ( not ( = ?auto_870559 ?auto_870563 ) ) ( not ( = ?auto_870559 ?auto_870564 ) ) ( not ( = ?auto_870559 ?auto_870565 ) ) ( not ( = ?auto_870559 ?auto_870566 ) ) ( not ( = ?auto_870559 ?auto_870567 ) ) ( not ( = ?auto_870559 ?auto_870568 ) ) ( not ( = ?auto_870559 ?auto_870569 ) ) ( not ( = ?auto_870559 ?auto_870570 ) ) ( not ( = ?auto_870559 ?auto_870571 ) ) ( not ( = ?auto_870559 ?auto_870572 ) ) ( not ( = ?auto_870559 ?auto_870573 ) ) ( not ( = ?auto_870559 ?auto_870574 ) ) ( not ( = ?auto_870559 ?auto_870575 ) ) ( not ( = ?auto_870560 ?auto_870561 ) ) ( not ( = ?auto_870560 ?auto_870562 ) ) ( not ( = ?auto_870560 ?auto_870563 ) ) ( not ( = ?auto_870560 ?auto_870564 ) ) ( not ( = ?auto_870560 ?auto_870565 ) ) ( not ( = ?auto_870560 ?auto_870566 ) ) ( not ( = ?auto_870560 ?auto_870567 ) ) ( not ( = ?auto_870560 ?auto_870568 ) ) ( not ( = ?auto_870560 ?auto_870569 ) ) ( not ( = ?auto_870560 ?auto_870570 ) ) ( not ( = ?auto_870560 ?auto_870571 ) ) ( not ( = ?auto_870560 ?auto_870572 ) ) ( not ( = ?auto_870560 ?auto_870573 ) ) ( not ( = ?auto_870560 ?auto_870574 ) ) ( not ( = ?auto_870560 ?auto_870575 ) ) ( not ( = ?auto_870561 ?auto_870562 ) ) ( not ( = ?auto_870561 ?auto_870563 ) ) ( not ( = ?auto_870561 ?auto_870564 ) ) ( not ( = ?auto_870561 ?auto_870565 ) ) ( not ( = ?auto_870561 ?auto_870566 ) ) ( not ( = ?auto_870561 ?auto_870567 ) ) ( not ( = ?auto_870561 ?auto_870568 ) ) ( not ( = ?auto_870561 ?auto_870569 ) ) ( not ( = ?auto_870561 ?auto_870570 ) ) ( not ( = ?auto_870561 ?auto_870571 ) ) ( not ( = ?auto_870561 ?auto_870572 ) ) ( not ( = ?auto_870561 ?auto_870573 ) ) ( not ( = ?auto_870561 ?auto_870574 ) ) ( not ( = ?auto_870561 ?auto_870575 ) ) ( not ( = ?auto_870562 ?auto_870563 ) ) ( not ( = ?auto_870562 ?auto_870564 ) ) ( not ( = ?auto_870562 ?auto_870565 ) ) ( not ( = ?auto_870562 ?auto_870566 ) ) ( not ( = ?auto_870562 ?auto_870567 ) ) ( not ( = ?auto_870562 ?auto_870568 ) ) ( not ( = ?auto_870562 ?auto_870569 ) ) ( not ( = ?auto_870562 ?auto_870570 ) ) ( not ( = ?auto_870562 ?auto_870571 ) ) ( not ( = ?auto_870562 ?auto_870572 ) ) ( not ( = ?auto_870562 ?auto_870573 ) ) ( not ( = ?auto_870562 ?auto_870574 ) ) ( not ( = ?auto_870562 ?auto_870575 ) ) ( not ( = ?auto_870563 ?auto_870564 ) ) ( not ( = ?auto_870563 ?auto_870565 ) ) ( not ( = ?auto_870563 ?auto_870566 ) ) ( not ( = ?auto_870563 ?auto_870567 ) ) ( not ( = ?auto_870563 ?auto_870568 ) ) ( not ( = ?auto_870563 ?auto_870569 ) ) ( not ( = ?auto_870563 ?auto_870570 ) ) ( not ( = ?auto_870563 ?auto_870571 ) ) ( not ( = ?auto_870563 ?auto_870572 ) ) ( not ( = ?auto_870563 ?auto_870573 ) ) ( not ( = ?auto_870563 ?auto_870574 ) ) ( not ( = ?auto_870563 ?auto_870575 ) ) ( not ( = ?auto_870564 ?auto_870565 ) ) ( not ( = ?auto_870564 ?auto_870566 ) ) ( not ( = ?auto_870564 ?auto_870567 ) ) ( not ( = ?auto_870564 ?auto_870568 ) ) ( not ( = ?auto_870564 ?auto_870569 ) ) ( not ( = ?auto_870564 ?auto_870570 ) ) ( not ( = ?auto_870564 ?auto_870571 ) ) ( not ( = ?auto_870564 ?auto_870572 ) ) ( not ( = ?auto_870564 ?auto_870573 ) ) ( not ( = ?auto_870564 ?auto_870574 ) ) ( not ( = ?auto_870564 ?auto_870575 ) ) ( not ( = ?auto_870565 ?auto_870566 ) ) ( not ( = ?auto_870565 ?auto_870567 ) ) ( not ( = ?auto_870565 ?auto_870568 ) ) ( not ( = ?auto_870565 ?auto_870569 ) ) ( not ( = ?auto_870565 ?auto_870570 ) ) ( not ( = ?auto_870565 ?auto_870571 ) ) ( not ( = ?auto_870565 ?auto_870572 ) ) ( not ( = ?auto_870565 ?auto_870573 ) ) ( not ( = ?auto_870565 ?auto_870574 ) ) ( not ( = ?auto_870565 ?auto_870575 ) ) ( not ( = ?auto_870566 ?auto_870567 ) ) ( not ( = ?auto_870566 ?auto_870568 ) ) ( not ( = ?auto_870566 ?auto_870569 ) ) ( not ( = ?auto_870566 ?auto_870570 ) ) ( not ( = ?auto_870566 ?auto_870571 ) ) ( not ( = ?auto_870566 ?auto_870572 ) ) ( not ( = ?auto_870566 ?auto_870573 ) ) ( not ( = ?auto_870566 ?auto_870574 ) ) ( not ( = ?auto_870566 ?auto_870575 ) ) ( not ( = ?auto_870567 ?auto_870568 ) ) ( not ( = ?auto_870567 ?auto_870569 ) ) ( not ( = ?auto_870567 ?auto_870570 ) ) ( not ( = ?auto_870567 ?auto_870571 ) ) ( not ( = ?auto_870567 ?auto_870572 ) ) ( not ( = ?auto_870567 ?auto_870573 ) ) ( not ( = ?auto_870567 ?auto_870574 ) ) ( not ( = ?auto_870567 ?auto_870575 ) ) ( not ( = ?auto_870568 ?auto_870569 ) ) ( not ( = ?auto_870568 ?auto_870570 ) ) ( not ( = ?auto_870568 ?auto_870571 ) ) ( not ( = ?auto_870568 ?auto_870572 ) ) ( not ( = ?auto_870568 ?auto_870573 ) ) ( not ( = ?auto_870568 ?auto_870574 ) ) ( not ( = ?auto_870568 ?auto_870575 ) ) ( not ( = ?auto_870569 ?auto_870570 ) ) ( not ( = ?auto_870569 ?auto_870571 ) ) ( not ( = ?auto_870569 ?auto_870572 ) ) ( not ( = ?auto_870569 ?auto_870573 ) ) ( not ( = ?auto_870569 ?auto_870574 ) ) ( not ( = ?auto_870569 ?auto_870575 ) ) ( not ( = ?auto_870570 ?auto_870571 ) ) ( not ( = ?auto_870570 ?auto_870572 ) ) ( not ( = ?auto_870570 ?auto_870573 ) ) ( not ( = ?auto_870570 ?auto_870574 ) ) ( not ( = ?auto_870570 ?auto_870575 ) ) ( not ( = ?auto_870571 ?auto_870572 ) ) ( not ( = ?auto_870571 ?auto_870573 ) ) ( not ( = ?auto_870571 ?auto_870574 ) ) ( not ( = ?auto_870571 ?auto_870575 ) ) ( not ( = ?auto_870572 ?auto_870573 ) ) ( not ( = ?auto_870572 ?auto_870574 ) ) ( not ( = ?auto_870572 ?auto_870575 ) ) ( not ( = ?auto_870573 ?auto_870574 ) ) ( not ( = ?auto_870573 ?auto_870575 ) ) ( not ( = ?auto_870574 ?auto_870575 ) ) ( ON ?auto_870574 ?auto_870575 ) ( ON ?auto_870573 ?auto_870574 ) ( CLEAR ?auto_870571 ) ( ON ?auto_870572 ?auto_870573 ) ( CLEAR ?auto_870572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_870558 ?auto_870559 ?auto_870560 ?auto_870561 ?auto_870562 ?auto_870563 ?auto_870564 ?auto_870565 ?auto_870566 ?auto_870567 ?auto_870568 ?auto_870569 ?auto_870570 ?auto_870571 ?auto_870572 )
      ( MAKE-18PILE ?auto_870558 ?auto_870559 ?auto_870560 ?auto_870561 ?auto_870562 ?auto_870563 ?auto_870564 ?auto_870565 ?auto_870566 ?auto_870567 ?auto_870568 ?auto_870569 ?auto_870570 ?auto_870571 ?auto_870572 ?auto_870573 ?auto_870574 ?auto_870575 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870594 - BLOCK
      ?auto_870595 - BLOCK
      ?auto_870596 - BLOCK
      ?auto_870597 - BLOCK
      ?auto_870598 - BLOCK
      ?auto_870599 - BLOCK
      ?auto_870600 - BLOCK
      ?auto_870601 - BLOCK
      ?auto_870602 - BLOCK
      ?auto_870603 - BLOCK
      ?auto_870604 - BLOCK
      ?auto_870605 - BLOCK
      ?auto_870606 - BLOCK
      ?auto_870607 - BLOCK
      ?auto_870608 - BLOCK
      ?auto_870609 - BLOCK
      ?auto_870610 - BLOCK
      ?auto_870611 - BLOCK
    )
    :vars
    (
      ?auto_870612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870611 ?auto_870612 ) ( ON-TABLE ?auto_870594 ) ( ON ?auto_870595 ?auto_870594 ) ( ON ?auto_870596 ?auto_870595 ) ( ON ?auto_870597 ?auto_870596 ) ( ON ?auto_870598 ?auto_870597 ) ( ON ?auto_870599 ?auto_870598 ) ( ON ?auto_870600 ?auto_870599 ) ( ON ?auto_870601 ?auto_870600 ) ( ON ?auto_870602 ?auto_870601 ) ( ON ?auto_870603 ?auto_870602 ) ( ON ?auto_870604 ?auto_870603 ) ( ON ?auto_870605 ?auto_870604 ) ( ON ?auto_870606 ?auto_870605 ) ( not ( = ?auto_870594 ?auto_870595 ) ) ( not ( = ?auto_870594 ?auto_870596 ) ) ( not ( = ?auto_870594 ?auto_870597 ) ) ( not ( = ?auto_870594 ?auto_870598 ) ) ( not ( = ?auto_870594 ?auto_870599 ) ) ( not ( = ?auto_870594 ?auto_870600 ) ) ( not ( = ?auto_870594 ?auto_870601 ) ) ( not ( = ?auto_870594 ?auto_870602 ) ) ( not ( = ?auto_870594 ?auto_870603 ) ) ( not ( = ?auto_870594 ?auto_870604 ) ) ( not ( = ?auto_870594 ?auto_870605 ) ) ( not ( = ?auto_870594 ?auto_870606 ) ) ( not ( = ?auto_870594 ?auto_870607 ) ) ( not ( = ?auto_870594 ?auto_870608 ) ) ( not ( = ?auto_870594 ?auto_870609 ) ) ( not ( = ?auto_870594 ?auto_870610 ) ) ( not ( = ?auto_870594 ?auto_870611 ) ) ( not ( = ?auto_870594 ?auto_870612 ) ) ( not ( = ?auto_870595 ?auto_870596 ) ) ( not ( = ?auto_870595 ?auto_870597 ) ) ( not ( = ?auto_870595 ?auto_870598 ) ) ( not ( = ?auto_870595 ?auto_870599 ) ) ( not ( = ?auto_870595 ?auto_870600 ) ) ( not ( = ?auto_870595 ?auto_870601 ) ) ( not ( = ?auto_870595 ?auto_870602 ) ) ( not ( = ?auto_870595 ?auto_870603 ) ) ( not ( = ?auto_870595 ?auto_870604 ) ) ( not ( = ?auto_870595 ?auto_870605 ) ) ( not ( = ?auto_870595 ?auto_870606 ) ) ( not ( = ?auto_870595 ?auto_870607 ) ) ( not ( = ?auto_870595 ?auto_870608 ) ) ( not ( = ?auto_870595 ?auto_870609 ) ) ( not ( = ?auto_870595 ?auto_870610 ) ) ( not ( = ?auto_870595 ?auto_870611 ) ) ( not ( = ?auto_870595 ?auto_870612 ) ) ( not ( = ?auto_870596 ?auto_870597 ) ) ( not ( = ?auto_870596 ?auto_870598 ) ) ( not ( = ?auto_870596 ?auto_870599 ) ) ( not ( = ?auto_870596 ?auto_870600 ) ) ( not ( = ?auto_870596 ?auto_870601 ) ) ( not ( = ?auto_870596 ?auto_870602 ) ) ( not ( = ?auto_870596 ?auto_870603 ) ) ( not ( = ?auto_870596 ?auto_870604 ) ) ( not ( = ?auto_870596 ?auto_870605 ) ) ( not ( = ?auto_870596 ?auto_870606 ) ) ( not ( = ?auto_870596 ?auto_870607 ) ) ( not ( = ?auto_870596 ?auto_870608 ) ) ( not ( = ?auto_870596 ?auto_870609 ) ) ( not ( = ?auto_870596 ?auto_870610 ) ) ( not ( = ?auto_870596 ?auto_870611 ) ) ( not ( = ?auto_870596 ?auto_870612 ) ) ( not ( = ?auto_870597 ?auto_870598 ) ) ( not ( = ?auto_870597 ?auto_870599 ) ) ( not ( = ?auto_870597 ?auto_870600 ) ) ( not ( = ?auto_870597 ?auto_870601 ) ) ( not ( = ?auto_870597 ?auto_870602 ) ) ( not ( = ?auto_870597 ?auto_870603 ) ) ( not ( = ?auto_870597 ?auto_870604 ) ) ( not ( = ?auto_870597 ?auto_870605 ) ) ( not ( = ?auto_870597 ?auto_870606 ) ) ( not ( = ?auto_870597 ?auto_870607 ) ) ( not ( = ?auto_870597 ?auto_870608 ) ) ( not ( = ?auto_870597 ?auto_870609 ) ) ( not ( = ?auto_870597 ?auto_870610 ) ) ( not ( = ?auto_870597 ?auto_870611 ) ) ( not ( = ?auto_870597 ?auto_870612 ) ) ( not ( = ?auto_870598 ?auto_870599 ) ) ( not ( = ?auto_870598 ?auto_870600 ) ) ( not ( = ?auto_870598 ?auto_870601 ) ) ( not ( = ?auto_870598 ?auto_870602 ) ) ( not ( = ?auto_870598 ?auto_870603 ) ) ( not ( = ?auto_870598 ?auto_870604 ) ) ( not ( = ?auto_870598 ?auto_870605 ) ) ( not ( = ?auto_870598 ?auto_870606 ) ) ( not ( = ?auto_870598 ?auto_870607 ) ) ( not ( = ?auto_870598 ?auto_870608 ) ) ( not ( = ?auto_870598 ?auto_870609 ) ) ( not ( = ?auto_870598 ?auto_870610 ) ) ( not ( = ?auto_870598 ?auto_870611 ) ) ( not ( = ?auto_870598 ?auto_870612 ) ) ( not ( = ?auto_870599 ?auto_870600 ) ) ( not ( = ?auto_870599 ?auto_870601 ) ) ( not ( = ?auto_870599 ?auto_870602 ) ) ( not ( = ?auto_870599 ?auto_870603 ) ) ( not ( = ?auto_870599 ?auto_870604 ) ) ( not ( = ?auto_870599 ?auto_870605 ) ) ( not ( = ?auto_870599 ?auto_870606 ) ) ( not ( = ?auto_870599 ?auto_870607 ) ) ( not ( = ?auto_870599 ?auto_870608 ) ) ( not ( = ?auto_870599 ?auto_870609 ) ) ( not ( = ?auto_870599 ?auto_870610 ) ) ( not ( = ?auto_870599 ?auto_870611 ) ) ( not ( = ?auto_870599 ?auto_870612 ) ) ( not ( = ?auto_870600 ?auto_870601 ) ) ( not ( = ?auto_870600 ?auto_870602 ) ) ( not ( = ?auto_870600 ?auto_870603 ) ) ( not ( = ?auto_870600 ?auto_870604 ) ) ( not ( = ?auto_870600 ?auto_870605 ) ) ( not ( = ?auto_870600 ?auto_870606 ) ) ( not ( = ?auto_870600 ?auto_870607 ) ) ( not ( = ?auto_870600 ?auto_870608 ) ) ( not ( = ?auto_870600 ?auto_870609 ) ) ( not ( = ?auto_870600 ?auto_870610 ) ) ( not ( = ?auto_870600 ?auto_870611 ) ) ( not ( = ?auto_870600 ?auto_870612 ) ) ( not ( = ?auto_870601 ?auto_870602 ) ) ( not ( = ?auto_870601 ?auto_870603 ) ) ( not ( = ?auto_870601 ?auto_870604 ) ) ( not ( = ?auto_870601 ?auto_870605 ) ) ( not ( = ?auto_870601 ?auto_870606 ) ) ( not ( = ?auto_870601 ?auto_870607 ) ) ( not ( = ?auto_870601 ?auto_870608 ) ) ( not ( = ?auto_870601 ?auto_870609 ) ) ( not ( = ?auto_870601 ?auto_870610 ) ) ( not ( = ?auto_870601 ?auto_870611 ) ) ( not ( = ?auto_870601 ?auto_870612 ) ) ( not ( = ?auto_870602 ?auto_870603 ) ) ( not ( = ?auto_870602 ?auto_870604 ) ) ( not ( = ?auto_870602 ?auto_870605 ) ) ( not ( = ?auto_870602 ?auto_870606 ) ) ( not ( = ?auto_870602 ?auto_870607 ) ) ( not ( = ?auto_870602 ?auto_870608 ) ) ( not ( = ?auto_870602 ?auto_870609 ) ) ( not ( = ?auto_870602 ?auto_870610 ) ) ( not ( = ?auto_870602 ?auto_870611 ) ) ( not ( = ?auto_870602 ?auto_870612 ) ) ( not ( = ?auto_870603 ?auto_870604 ) ) ( not ( = ?auto_870603 ?auto_870605 ) ) ( not ( = ?auto_870603 ?auto_870606 ) ) ( not ( = ?auto_870603 ?auto_870607 ) ) ( not ( = ?auto_870603 ?auto_870608 ) ) ( not ( = ?auto_870603 ?auto_870609 ) ) ( not ( = ?auto_870603 ?auto_870610 ) ) ( not ( = ?auto_870603 ?auto_870611 ) ) ( not ( = ?auto_870603 ?auto_870612 ) ) ( not ( = ?auto_870604 ?auto_870605 ) ) ( not ( = ?auto_870604 ?auto_870606 ) ) ( not ( = ?auto_870604 ?auto_870607 ) ) ( not ( = ?auto_870604 ?auto_870608 ) ) ( not ( = ?auto_870604 ?auto_870609 ) ) ( not ( = ?auto_870604 ?auto_870610 ) ) ( not ( = ?auto_870604 ?auto_870611 ) ) ( not ( = ?auto_870604 ?auto_870612 ) ) ( not ( = ?auto_870605 ?auto_870606 ) ) ( not ( = ?auto_870605 ?auto_870607 ) ) ( not ( = ?auto_870605 ?auto_870608 ) ) ( not ( = ?auto_870605 ?auto_870609 ) ) ( not ( = ?auto_870605 ?auto_870610 ) ) ( not ( = ?auto_870605 ?auto_870611 ) ) ( not ( = ?auto_870605 ?auto_870612 ) ) ( not ( = ?auto_870606 ?auto_870607 ) ) ( not ( = ?auto_870606 ?auto_870608 ) ) ( not ( = ?auto_870606 ?auto_870609 ) ) ( not ( = ?auto_870606 ?auto_870610 ) ) ( not ( = ?auto_870606 ?auto_870611 ) ) ( not ( = ?auto_870606 ?auto_870612 ) ) ( not ( = ?auto_870607 ?auto_870608 ) ) ( not ( = ?auto_870607 ?auto_870609 ) ) ( not ( = ?auto_870607 ?auto_870610 ) ) ( not ( = ?auto_870607 ?auto_870611 ) ) ( not ( = ?auto_870607 ?auto_870612 ) ) ( not ( = ?auto_870608 ?auto_870609 ) ) ( not ( = ?auto_870608 ?auto_870610 ) ) ( not ( = ?auto_870608 ?auto_870611 ) ) ( not ( = ?auto_870608 ?auto_870612 ) ) ( not ( = ?auto_870609 ?auto_870610 ) ) ( not ( = ?auto_870609 ?auto_870611 ) ) ( not ( = ?auto_870609 ?auto_870612 ) ) ( not ( = ?auto_870610 ?auto_870611 ) ) ( not ( = ?auto_870610 ?auto_870612 ) ) ( not ( = ?auto_870611 ?auto_870612 ) ) ( ON ?auto_870610 ?auto_870611 ) ( ON ?auto_870609 ?auto_870610 ) ( ON ?auto_870608 ?auto_870609 ) ( CLEAR ?auto_870606 ) ( ON ?auto_870607 ?auto_870608 ) ( CLEAR ?auto_870607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_870594 ?auto_870595 ?auto_870596 ?auto_870597 ?auto_870598 ?auto_870599 ?auto_870600 ?auto_870601 ?auto_870602 ?auto_870603 ?auto_870604 ?auto_870605 ?auto_870606 ?auto_870607 )
      ( MAKE-18PILE ?auto_870594 ?auto_870595 ?auto_870596 ?auto_870597 ?auto_870598 ?auto_870599 ?auto_870600 ?auto_870601 ?auto_870602 ?auto_870603 ?auto_870604 ?auto_870605 ?auto_870606 ?auto_870607 ?auto_870608 ?auto_870609 ?auto_870610 ?auto_870611 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870631 - BLOCK
      ?auto_870632 - BLOCK
      ?auto_870633 - BLOCK
      ?auto_870634 - BLOCK
      ?auto_870635 - BLOCK
      ?auto_870636 - BLOCK
      ?auto_870637 - BLOCK
      ?auto_870638 - BLOCK
      ?auto_870639 - BLOCK
      ?auto_870640 - BLOCK
      ?auto_870641 - BLOCK
      ?auto_870642 - BLOCK
      ?auto_870643 - BLOCK
      ?auto_870644 - BLOCK
      ?auto_870645 - BLOCK
      ?auto_870646 - BLOCK
      ?auto_870647 - BLOCK
      ?auto_870648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870648 ) ( ON-TABLE ?auto_870631 ) ( ON ?auto_870632 ?auto_870631 ) ( ON ?auto_870633 ?auto_870632 ) ( ON ?auto_870634 ?auto_870633 ) ( ON ?auto_870635 ?auto_870634 ) ( ON ?auto_870636 ?auto_870635 ) ( ON ?auto_870637 ?auto_870636 ) ( ON ?auto_870638 ?auto_870637 ) ( ON ?auto_870639 ?auto_870638 ) ( ON ?auto_870640 ?auto_870639 ) ( ON ?auto_870641 ?auto_870640 ) ( ON ?auto_870642 ?auto_870641 ) ( ON ?auto_870643 ?auto_870642 ) ( not ( = ?auto_870631 ?auto_870632 ) ) ( not ( = ?auto_870631 ?auto_870633 ) ) ( not ( = ?auto_870631 ?auto_870634 ) ) ( not ( = ?auto_870631 ?auto_870635 ) ) ( not ( = ?auto_870631 ?auto_870636 ) ) ( not ( = ?auto_870631 ?auto_870637 ) ) ( not ( = ?auto_870631 ?auto_870638 ) ) ( not ( = ?auto_870631 ?auto_870639 ) ) ( not ( = ?auto_870631 ?auto_870640 ) ) ( not ( = ?auto_870631 ?auto_870641 ) ) ( not ( = ?auto_870631 ?auto_870642 ) ) ( not ( = ?auto_870631 ?auto_870643 ) ) ( not ( = ?auto_870631 ?auto_870644 ) ) ( not ( = ?auto_870631 ?auto_870645 ) ) ( not ( = ?auto_870631 ?auto_870646 ) ) ( not ( = ?auto_870631 ?auto_870647 ) ) ( not ( = ?auto_870631 ?auto_870648 ) ) ( not ( = ?auto_870632 ?auto_870633 ) ) ( not ( = ?auto_870632 ?auto_870634 ) ) ( not ( = ?auto_870632 ?auto_870635 ) ) ( not ( = ?auto_870632 ?auto_870636 ) ) ( not ( = ?auto_870632 ?auto_870637 ) ) ( not ( = ?auto_870632 ?auto_870638 ) ) ( not ( = ?auto_870632 ?auto_870639 ) ) ( not ( = ?auto_870632 ?auto_870640 ) ) ( not ( = ?auto_870632 ?auto_870641 ) ) ( not ( = ?auto_870632 ?auto_870642 ) ) ( not ( = ?auto_870632 ?auto_870643 ) ) ( not ( = ?auto_870632 ?auto_870644 ) ) ( not ( = ?auto_870632 ?auto_870645 ) ) ( not ( = ?auto_870632 ?auto_870646 ) ) ( not ( = ?auto_870632 ?auto_870647 ) ) ( not ( = ?auto_870632 ?auto_870648 ) ) ( not ( = ?auto_870633 ?auto_870634 ) ) ( not ( = ?auto_870633 ?auto_870635 ) ) ( not ( = ?auto_870633 ?auto_870636 ) ) ( not ( = ?auto_870633 ?auto_870637 ) ) ( not ( = ?auto_870633 ?auto_870638 ) ) ( not ( = ?auto_870633 ?auto_870639 ) ) ( not ( = ?auto_870633 ?auto_870640 ) ) ( not ( = ?auto_870633 ?auto_870641 ) ) ( not ( = ?auto_870633 ?auto_870642 ) ) ( not ( = ?auto_870633 ?auto_870643 ) ) ( not ( = ?auto_870633 ?auto_870644 ) ) ( not ( = ?auto_870633 ?auto_870645 ) ) ( not ( = ?auto_870633 ?auto_870646 ) ) ( not ( = ?auto_870633 ?auto_870647 ) ) ( not ( = ?auto_870633 ?auto_870648 ) ) ( not ( = ?auto_870634 ?auto_870635 ) ) ( not ( = ?auto_870634 ?auto_870636 ) ) ( not ( = ?auto_870634 ?auto_870637 ) ) ( not ( = ?auto_870634 ?auto_870638 ) ) ( not ( = ?auto_870634 ?auto_870639 ) ) ( not ( = ?auto_870634 ?auto_870640 ) ) ( not ( = ?auto_870634 ?auto_870641 ) ) ( not ( = ?auto_870634 ?auto_870642 ) ) ( not ( = ?auto_870634 ?auto_870643 ) ) ( not ( = ?auto_870634 ?auto_870644 ) ) ( not ( = ?auto_870634 ?auto_870645 ) ) ( not ( = ?auto_870634 ?auto_870646 ) ) ( not ( = ?auto_870634 ?auto_870647 ) ) ( not ( = ?auto_870634 ?auto_870648 ) ) ( not ( = ?auto_870635 ?auto_870636 ) ) ( not ( = ?auto_870635 ?auto_870637 ) ) ( not ( = ?auto_870635 ?auto_870638 ) ) ( not ( = ?auto_870635 ?auto_870639 ) ) ( not ( = ?auto_870635 ?auto_870640 ) ) ( not ( = ?auto_870635 ?auto_870641 ) ) ( not ( = ?auto_870635 ?auto_870642 ) ) ( not ( = ?auto_870635 ?auto_870643 ) ) ( not ( = ?auto_870635 ?auto_870644 ) ) ( not ( = ?auto_870635 ?auto_870645 ) ) ( not ( = ?auto_870635 ?auto_870646 ) ) ( not ( = ?auto_870635 ?auto_870647 ) ) ( not ( = ?auto_870635 ?auto_870648 ) ) ( not ( = ?auto_870636 ?auto_870637 ) ) ( not ( = ?auto_870636 ?auto_870638 ) ) ( not ( = ?auto_870636 ?auto_870639 ) ) ( not ( = ?auto_870636 ?auto_870640 ) ) ( not ( = ?auto_870636 ?auto_870641 ) ) ( not ( = ?auto_870636 ?auto_870642 ) ) ( not ( = ?auto_870636 ?auto_870643 ) ) ( not ( = ?auto_870636 ?auto_870644 ) ) ( not ( = ?auto_870636 ?auto_870645 ) ) ( not ( = ?auto_870636 ?auto_870646 ) ) ( not ( = ?auto_870636 ?auto_870647 ) ) ( not ( = ?auto_870636 ?auto_870648 ) ) ( not ( = ?auto_870637 ?auto_870638 ) ) ( not ( = ?auto_870637 ?auto_870639 ) ) ( not ( = ?auto_870637 ?auto_870640 ) ) ( not ( = ?auto_870637 ?auto_870641 ) ) ( not ( = ?auto_870637 ?auto_870642 ) ) ( not ( = ?auto_870637 ?auto_870643 ) ) ( not ( = ?auto_870637 ?auto_870644 ) ) ( not ( = ?auto_870637 ?auto_870645 ) ) ( not ( = ?auto_870637 ?auto_870646 ) ) ( not ( = ?auto_870637 ?auto_870647 ) ) ( not ( = ?auto_870637 ?auto_870648 ) ) ( not ( = ?auto_870638 ?auto_870639 ) ) ( not ( = ?auto_870638 ?auto_870640 ) ) ( not ( = ?auto_870638 ?auto_870641 ) ) ( not ( = ?auto_870638 ?auto_870642 ) ) ( not ( = ?auto_870638 ?auto_870643 ) ) ( not ( = ?auto_870638 ?auto_870644 ) ) ( not ( = ?auto_870638 ?auto_870645 ) ) ( not ( = ?auto_870638 ?auto_870646 ) ) ( not ( = ?auto_870638 ?auto_870647 ) ) ( not ( = ?auto_870638 ?auto_870648 ) ) ( not ( = ?auto_870639 ?auto_870640 ) ) ( not ( = ?auto_870639 ?auto_870641 ) ) ( not ( = ?auto_870639 ?auto_870642 ) ) ( not ( = ?auto_870639 ?auto_870643 ) ) ( not ( = ?auto_870639 ?auto_870644 ) ) ( not ( = ?auto_870639 ?auto_870645 ) ) ( not ( = ?auto_870639 ?auto_870646 ) ) ( not ( = ?auto_870639 ?auto_870647 ) ) ( not ( = ?auto_870639 ?auto_870648 ) ) ( not ( = ?auto_870640 ?auto_870641 ) ) ( not ( = ?auto_870640 ?auto_870642 ) ) ( not ( = ?auto_870640 ?auto_870643 ) ) ( not ( = ?auto_870640 ?auto_870644 ) ) ( not ( = ?auto_870640 ?auto_870645 ) ) ( not ( = ?auto_870640 ?auto_870646 ) ) ( not ( = ?auto_870640 ?auto_870647 ) ) ( not ( = ?auto_870640 ?auto_870648 ) ) ( not ( = ?auto_870641 ?auto_870642 ) ) ( not ( = ?auto_870641 ?auto_870643 ) ) ( not ( = ?auto_870641 ?auto_870644 ) ) ( not ( = ?auto_870641 ?auto_870645 ) ) ( not ( = ?auto_870641 ?auto_870646 ) ) ( not ( = ?auto_870641 ?auto_870647 ) ) ( not ( = ?auto_870641 ?auto_870648 ) ) ( not ( = ?auto_870642 ?auto_870643 ) ) ( not ( = ?auto_870642 ?auto_870644 ) ) ( not ( = ?auto_870642 ?auto_870645 ) ) ( not ( = ?auto_870642 ?auto_870646 ) ) ( not ( = ?auto_870642 ?auto_870647 ) ) ( not ( = ?auto_870642 ?auto_870648 ) ) ( not ( = ?auto_870643 ?auto_870644 ) ) ( not ( = ?auto_870643 ?auto_870645 ) ) ( not ( = ?auto_870643 ?auto_870646 ) ) ( not ( = ?auto_870643 ?auto_870647 ) ) ( not ( = ?auto_870643 ?auto_870648 ) ) ( not ( = ?auto_870644 ?auto_870645 ) ) ( not ( = ?auto_870644 ?auto_870646 ) ) ( not ( = ?auto_870644 ?auto_870647 ) ) ( not ( = ?auto_870644 ?auto_870648 ) ) ( not ( = ?auto_870645 ?auto_870646 ) ) ( not ( = ?auto_870645 ?auto_870647 ) ) ( not ( = ?auto_870645 ?auto_870648 ) ) ( not ( = ?auto_870646 ?auto_870647 ) ) ( not ( = ?auto_870646 ?auto_870648 ) ) ( not ( = ?auto_870647 ?auto_870648 ) ) ( ON ?auto_870647 ?auto_870648 ) ( ON ?auto_870646 ?auto_870647 ) ( ON ?auto_870645 ?auto_870646 ) ( CLEAR ?auto_870643 ) ( ON ?auto_870644 ?auto_870645 ) ( CLEAR ?auto_870644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_870631 ?auto_870632 ?auto_870633 ?auto_870634 ?auto_870635 ?auto_870636 ?auto_870637 ?auto_870638 ?auto_870639 ?auto_870640 ?auto_870641 ?auto_870642 ?auto_870643 ?auto_870644 )
      ( MAKE-18PILE ?auto_870631 ?auto_870632 ?auto_870633 ?auto_870634 ?auto_870635 ?auto_870636 ?auto_870637 ?auto_870638 ?auto_870639 ?auto_870640 ?auto_870641 ?auto_870642 ?auto_870643 ?auto_870644 ?auto_870645 ?auto_870646 ?auto_870647 ?auto_870648 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870667 - BLOCK
      ?auto_870668 - BLOCK
      ?auto_870669 - BLOCK
      ?auto_870670 - BLOCK
      ?auto_870671 - BLOCK
      ?auto_870672 - BLOCK
      ?auto_870673 - BLOCK
      ?auto_870674 - BLOCK
      ?auto_870675 - BLOCK
      ?auto_870676 - BLOCK
      ?auto_870677 - BLOCK
      ?auto_870678 - BLOCK
      ?auto_870679 - BLOCK
      ?auto_870680 - BLOCK
      ?auto_870681 - BLOCK
      ?auto_870682 - BLOCK
      ?auto_870683 - BLOCK
      ?auto_870684 - BLOCK
    )
    :vars
    (
      ?auto_870685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870684 ?auto_870685 ) ( ON-TABLE ?auto_870667 ) ( ON ?auto_870668 ?auto_870667 ) ( ON ?auto_870669 ?auto_870668 ) ( ON ?auto_870670 ?auto_870669 ) ( ON ?auto_870671 ?auto_870670 ) ( ON ?auto_870672 ?auto_870671 ) ( ON ?auto_870673 ?auto_870672 ) ( ON ?auto_870674 ?auto_870673 ) ( ON ?auto_870675 ?auto_870674 ) ( ON ?auto_870676 ?auto_870675 ) ( ON ?auto_870677 ?auto_870676 ) ( ON ?auto_870678 ?auto_870677 ) ( not ( = ?auto_870667 ?auto_870668 ) ) ( not ( = ?auto_870667 ?auto_870669 ) ) ( not ( = ?auto_870667 ?auto_870670 ) ) ( not ( = ?auto_870667 ?auto_870671 ) ) ( not ( = ?auto_870667 ?auto_870672 ) ) ( not ( = ?auto_870667 ?auto_870673 ) ) ( not ( = ?auto_870667 ?auto_870674 ) ) ( not ( = ?auto_870667 ?auto_870675 ) ) ( not ( = ?auto_870667 ?auto_870676 ) ) ( not ( = ?auto_870667 ?auto_870677 ) ) ( not ( = ?auto_870667 ?auto_870678 ) ) ( not ( = ?auto_870667 ?auto_870679 ) ) ( not ( = ?auto_870667 ?auto_870680 ) ) ( not ( = ?auto_870667 ?auto_870681 ) ) ( not ( = ?auto_870667 ?auto_870682 ) ) ( not ( = ?auto_870667 ?auto_870683 ) ) ( not ( = ?auto_870667 ?auto_870684 ) ) ( not ( = ?auto_870667 ?auto_870685 ) ) ( not ( = ?auto_870668 ?auto_870669 ) ) ( not ( = ?auto_870668 ?auto_870670 ) ) ( not ( = ?auto_870668 ?auto_870671 ) ) ( not ( = ?auto_870668 ?auto_870672 ) ) ( not ( = ?auto_870668 ?auto_870673 ) ) ( not ( = ?auto_870668 ?auto_870674 ) ) ( not ( = ?auto_870668 ?auto_870675 ) ) ( not ( = ?auto_870668 ?auto_870676 ) ) ( not ( = ?auto_870668 ?auto_870677 ) ) ( not ( = ?auto_870668 ?auto_870678 ) ) ( not ( = ?auto_870668 ?auto_870679 ) ) ( not ( = ?auto_870668 ?auto_870680 ) ) ( not ( = ?auto_870668 ?auto_870681 ) ) ( not ( = ?auto_870668 ?auto_870682 ) ) ( not ( = ?auto_870668 ?auto_870683 ) ) ( not ( = ?auto_870668 ?auto_870684 ) ) ( not ( = ?auto_870668 ?auto_870685 ) ) ( not ( = ?auto_870669 ?auto_870670 ) ) ( not ( = ?auto_870669 ?auto_870671 ) ) ( not ( = ?auto_870669 ?auto_870672 ) ) ( not ( = ?auto_870669 ?auto_870673 ) ) ( not ( = ?auto_870669 ?auto_870674 ) ) ( not ( = ?auto_870669 ?auto_870675 ) ) ( not ( = ?auto_870669 ?auto_870676 ) ) ( not ( = ?auto_870669 ?auto_870677 ) ) ( not ( = ?auto_870669 ?auto_870678 ) ) ( not ( = ?auto_870669 ?auto_870679 ) ) ( not ( = ?auto_870669 ?auto_870680 ) ) ( not ( = ?auto_870669 ?auto_870681 ) ) ( not ( = ?auto_870669 ?auto_870682 ) ) ( not ( = ?auto_870669 ?auto_870683 ) ) ( not ( = ?auto_870669 ?auto_870684 ) ) ( not ( = ?auto_870669 ?auto_870685 ) ) ( not ( = ?auto_870670 ?auto_870671 ) ) ( not ( = ?auto_870670 ?auto_870672 ) ) ( not ( = ?auto_870670 ?auto_870673 ) ) ( not ( = ?auto_870670 ?auto_870674 ) ) ( not ( = ?auto_870670 ?auto_870675 ) ) ( not ( = ?auto_870670 ?auto_870676 ) ) ( not ( = ?auto_870670 ?auto_870677 ) ) ( not ( = ?auto_870670 ?auto_870678 ) ) ( not ( = ?auto_870670 ?auto_870679 ) ) ( not ( = ?auto_870670 ?auto_870680 ) ) ( not ( = ?auto_870670 ?auto_870681 ) ) ( not ( = ?auto_870670 ?auto_870682 ) ) ( not ( = ?auto_870670 ?auto_870683 ) ) ( not ( = ?auto_870670 ?auto_870684 ) ) ( not ( = ?auto_870670 ?auto_870685 ) ) ( not ( = ?auto_870671 ?auto_870672 ) ) ( not ( = ?auto_870671 ?auto_870673 ) ) ( not ( = ?auto_870671 ?auto_870674 ) ) ( not ( = ?auto_870671 ?auto_870675 ) ) ( not ( = ?auto_870671 ?auto_870676 ) ) ( not ( = ?auto_870671 ?auto_870677 ) ) ( not ( = ?auto_870671 ?auto_870678 ) ) ( not ( = ?auto_870671 ?auto_870679 ) ) ( not ( = ?auto_870671 ?auto_870680 ) ) ( not ( = ?auto_870671 ?auto_870681 ) ) ( not ( = ?auto_870671 ?auto_870682 ) ) ( not ( = ?auto_870671 ?auto_870683 ) ) ( not ( = ?auto_870671 ?auto_870684 ) ) ( not ( = ?auto_870671 ?auto_870685 ) ) ( not ( = ?auto_870672 ?auto_870673 ) ) ( not ( = ?auto_870672 ?auto_870674 ) ) ( not ( = ?auto_870672 ?auto_870675 ) ) ( not ( = ?auto_870672 ?auto_870676 ) ) ( not ( = ?auto_870672 ?auto_870677 ) ) ( not ( = ?auto_870672 ?auto_870678 ) ) ( not ( = ?auto_870672 ?auto_870679 ) ) ( not ( = ?auto_870672 ?auto_870680 ) ) ( not ( = ?auto_870672 ?auto_870681 ) ) ( not ( = ?auto_870672 ?auto_870682 ) ) ( not ( = ?auto_870672 ?auto_870683 ) ) ( not ( = ?auto_870672 ?auto_870684 ) ) ( not ( = ?auto_870672 ?auto_870685 ) ) ( not ( = ?auto_870673 ?auto_870674 ) ) ( not ( = ?auto_870673 ?auto_870675 ) ) ( not ( = ?auto_870673 ?auto_870676 ) ) ( not ( = ?auto_870673 ?auto_870677 ) ) ( not ( = ?auto_870673 ?auto_870678 ) ) ( not ( = ?auto_870673 ?auto_870679 ) ) ( not ( = ?auto_870673 ?auto_870680 ) ) ( not ( = ?auto_870673 ?auto_870681 ) ) ( not ( = ?auto_870673 ?auto_870682 ) ) ( not ( = ?auto_870673 ?auto_870683 ) ) ( not ( = ?auto_870673 ?auto_870684 ) ) ( not ( = ?auto_870673 ?auto_870685 ) ) ( not ( = ?auto_870674 ?auto_870675 ) ) ( not ( = ?auto_870674 ?auto_870676 ) ) ( not ( = ?auto_870674 ?auto_870677 ) ) ( not ( = ?auto_870674 ?auto_870678 ) ) ( not ( = ?auto_870674 ?auto_870679 ) ) ( not ( = ?auto_870674 ?auto_870680 ) ) ( not ( = ?auto_870674 ?auto_870681 ) ) ( not ( = ?auto_870674 ?auto_870682 ) ) ( not ( = ?auto_870674 ?auto_870683 ) ) ( not ( = ?auto_870674 ?auto_870684 ) ) ( not ( = ?auto_870674 ?auto_870685 ) ) ( not ( = ?auto_870675 ?auto_870676 ) ) ( not ( = ?auto_870675 ?auto_870677 ) ) ( not ( = ?auto_870675 ?auto_870678 ) ) ( not ( = ?auto_870675 ?auto_870679 ) ) ( not ( = ?auto_870675 ?auto_870680 ) ) ( not ( = ?auto_870675 ?auto_870681 ) ) ( not ( = ?auto_870675 ?auto_870682 ) ) ( not ( = ?auto_870675 ?auto_870683 ) ) ( not ( = ?auto_870675 ?auto_870684 ) ) ( not ( = ?auto_870675 ?auto_870685 ) ) ( not ( = ?auto_870676 ?auto_870677 ) ) ( not ( = ?auto_870676 ?auto_870678 ) ) ( not ( = ?auto_870676 ?auto_870679 ) ) ( not ( = ?auto_870676 ?auto_870680 ) ) ( not ( = ?auto_870676 ?auto_870681 ) ) ( not ( = ?auto_870676 ?auto_870682 ) ) ( not ( = ?auto_870676 ?auto_870683 ) ) ( not ( = ?auto_870676 ?auto_870684 ) ) ( not ( = ?auto_870676 ?auto_870685 ) ) ( not ( = ?auto_870677 ?auto_870678 ) ) ( not ( = ?auto_870677 ?auto_870679 ) ) ( not ( = ?auto_870677 ?auto_870680 ) ) ( not ( = ?auto_870677 ?auto_870681 ) ) ( not ( = ?auto_870677 ?auto_870682 ) ) ( not ( = ?auto_870677 ?auto_870683 ) ) ( not ( = ?auto_870677 ?auto_870684 ) ) ( not ( = ?auto_870677 ?auto_870685 ) ) ( not ( = ?auto_870678 ?auto_870679 ) ) ( not ( = ?auto_870678 ?auto_870680 ) ) ( not ( = ?auto_870678 ?auto_870681 ) ) ( not ( = ?auto_870678 ?auto_870682 ) ) ( not ( = ?auto_870678 ?auto_870683 ) ) ( not ( = ?auto_870678 ?auto_870684 ) ) ( not ( = ?auto_870678 ?auto_870685 ) ) ( not ( = ?auto_870679 ?auto_870680 ) ) ( not ( = ?auto_870679 ?auto_870681 ) ) ( not ( = ?auto_870679 ?auto_870682 ) ) ( not ( = ?auto_870679 ?auto_870683 ) ) ( not ( = ?auto_870679 ?auto_870684 ) ) ( not ( = ?auto_870679 ?auto_870685 ) ) ( not ( = ?auto_870680 ?auto_870681 ) ) ( not ( = ?auto_870680 ?auto_870682 ) ) ( not ( = ?auto_870680 ?auto_870683 ) ) ( not ( = ?auto_870680 ?auto_870684 ) ) ( not ( = ?auto_870680 ?auto_870685 ) ) ( not ( = ?auto_870681 ?auto_870682 ) ) ( not ( = ?auto_870681 ?auto_870683 ) ) ( not ( = ?auto_870681 ?auto_870684 ) ) ( not ( = ?auto_870681 ?auto_870685 ) ) ( not ( = ?auto_870682 ?auto_870683 ) ) ( not ( = ?auto_870682 ?auto_870684 ) ) ( not ( = ?auto_870682 ?auto_870685 ) ) ( not ( = ?auto_870683 ?auto_870684 ) ) ( not ( = ?auto_870683 ?auto_870685 ) ) ( not ( = ?auto_870684 ?auto_870685 ) ) ( ON ?auto_870683 ?auto_870684 ) ( ON ?auto_870682 ?auto_870683 ) ( ON ?auto_870681 ?auto_870682 ) ( ON ?auto_870680 ?auto_870681 ) ( CLEAR ?auto_870678 ) ( ON ?auto_870679 ?auto_870680 ) ( CLEAR ?auto_870679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_870667 ?auto_870668 ?auto_870669 ?auto_870670 ?auto_870671 ?auto_870672 ?auto_870673 ?auto_870674 ?auto_870675 ?auto_870676 ?auto_870677 ?auto_870678 ?auto_870679 )
      ( MAKE-18PILE ?auto_870667 ?auto_870668 ?auto_870669 ?auto_870670 ?auto_870671 ?auto_870672 ?auto_870673 ?auto_870674 ?auto_870675 ?auto_870676 ?auto_870677 ?auto_870678 ?auto_870679 ?auto_870680 ?auto_870681 ?auto_870682 ?auto_870683 ?auto_870684 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870704 - BLOCK
      ?auto_870705 - BLOCK
      ?auto_870706 - BLOCK
      ?auto_870707 - BLOCK
      ?auto_870708 - BLOCK
      ?auto_870709 - BLOCK
      ?auto_870710 - BLOCK
      ?auto_870711 - BLOCK
      ?auto_870712 - BLOCK
      ?auto_870713 - BLOCK
      ?auto_870714 - BLOCK
      ?auto_870715 - BLOCK
      ?auto_870716 - BLOCK
      ?auto_870717 - BLOCK
      ?auto_870718 - BLOCK
      ?auto_870719 - BLOCK
      ?auto_870720 - BLOCK
      ?auto_870721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870721 ) ( ON-TABLE ?auto_870704 ) ( ON ?auto_870705 ?auto_870704 ) ( ON ?auto_870706 ?auto_870705 ) ( ON ?auto_870707 ?auto_870706 ) ( ON ?auto_870708 ?auto_870707 ) ( ON ?auto_870709 ?auto_870708 ) ( ON ?auto_870710 ?auto_870709 ) ( ON ?auto_870711 ?auto_870710 ) ( ON ?auto_870712 ?auto_870711 ) ( ON ?auto_870713 ?auto_870712 ) ( ON ?auto_870714 ?auto_870713 ) ( ON ?auto_870715 ?auto_870714 ) ( not ( = ?auto_870704 ?auto_870705 ) ) ( not ( = ?auto_870704 ?auto_870706 ) ) ( not ( = ?auto_870704 ?auto_870707 ) ) ( not ( = ?auto_870704 ?auto_870708 ) ) ( not ( = ?auto_870704 ?auto_870709 ) ) ( not ( = ?auto_870704 ?auto_870710 ) ) ( not ( = ?auto_870704 ?auto_870711 ) ) ( not ( = ?auto_870704 ?auto_870712 ) ) ( not ( = ?auto_870704 ?auto_870713 ) ) ( not ( = ?auto_870704 ?auto_870714 ) ) ( not ( = ?auto_870704 ?auto_870715 ) ) ( not ( = ?auto_870704 ?auto_870716 ) ) ( not ( = ?auto_870704 ?auto_870717 ) ) ( not ( = ?auto_870704 ?auto_870718 ) ) ( not ( = ?auto_870704 ?auto_870719 ) ) ( not ( = ?auto_870704 ?auto_870720 ) ) ( not ( = ?auto_870704 ?auto_870721 ) ) ( not ( = ?auto_870705 ?auto_870706 ) ) ( not ( = ?auto_870705 ?auto_870707 ) ) ( not ( = ?auto_870705 ?auto_870708 ) ) ( not ( = ?auto_870705 ?auto_870709 ) ) ( not ( = ?auto_870705 ?auto_870710 ) ) ( not ( = ?auto_870705 ?auto_870711 ) ) ( not ( = ?auto_870705 ?auto_870712 ) ) ( not ( = ?auto_870705 ?auto_870713 ) ) ( not ( = ?auto_870705 ?auto_870714 ) ) ( not ( = ?auto_870705 ?auto_870715 ) ) ( not ( = ?auto_870705 ?auto_870716 ) ) ( not ( = ?auto_870705 ?auto_870717 ) ) ( not ( = ?auto_870705 ?auto_870718 ) ) ( not ( = ?auto_870705 ?auto_870719 ) ) ( not ( = ?auto_870705 ?auto_870720 ) ) ( not ( = ?auto_870705 ?auto_870721 ) ) ( not ( = ?auto_870706 ?auto_870707 ) ) ( not ( = ?auto_870706 ?auto_870708 ) ) ( not ( = ?auto_870706 ?auto_870709 ) ) ( not ( = ?auto_870706 ?auto_870710 ) ) ( not ( = ?auto_870706 ?auto_870711 ) ) ( not ( = ?auto_870706 ?auto_870712 ) ) ( not ( = ?auto_870706 ?auto_870713 ) ) ( not ( = ?auto_870706 ?auto_870714 ) ) ( not ( = ?auto_870706 ?auto_870715 ) ) ( not ( = ?auto_870706 ?auto_870716 ) ) ( not ( = ?auto_870706 ?auto_870717 ) ) ( not ( = ?auto_870706 ?auto_870718 ) ) ( not ( = ?auto_870706 ?auto_870719 ) ) ( not ( = ?auto_870706 ?auto_870720 ) ) ( not ( = ?auto_870706 ?auto_870721 ) ) ( not ( = ?auto_870707 ?auto_870708 ) ) ( not ( = ?auto_870707 ?auto_870709 ) ) ( not ( = ?auto_870707 ?auto_870710 ) ) ( not ( = ?auto_870707 ?auto_870711 ) ) ( not ( = ?auto_870707 ?auto_870712 ) ) ( not ( = ?auto_870707 ?auto_870713 ) ) ( not ( = ?auto_870707 ?auto_870714 ) ) ( not ( = ?auto_870707 ?auto_870715 ) ) ( not ( = ?auto_870707 ?auto_870716 ) ) ( not ( = ?auto_870707 ?auto_870717 ) ) ( not ( = ?auto_870707 ?auto_870718 ) ) ( not ( = ?auto_870707 ?auto_870719 ) ) ( not ( = ?auto_870707 ?auto_870720 ) ) ( not ( = ?auto_870707 ?auto_870721 ) ) ( not ( = ?auto_870708 ?auto_870709 ) ) ( not ( = ?auto_870708 ?auto_870710 ) ) ( not ( = ?auto_870708 ?auto_870711 ) ) ( not ( = ?auto_870708 ?auto_870712 ) ) ( not ( = ?auto_870708 ?auto_870713 ) ) ( not ( = ?auto_870708 ?auto_870714 ) ) ( not ( = ?auto_870708 ?auto_870715 ) ) ( not ( = ?auto_870708 ?auto_870716 ) ) ( not ( = ?auto_870708 ?auto_870717 ) ) ( not ( = ?auto_870708 ?auto_870718 ) ) ( not ( = ?auto_870708 ?auto_870719 ) ) ( not ( = ?auto_870708 ?auto_870720 ) ) ( not ( = ?auto_870708 ?auto_870721 ) ) ( not ( = ?auto_870709 ?auto_870710 ) ) ( not ( = ?auto_870709 ?auto_870711 ) ) ( not ( = ?auto_870709 ?auto_870712 ) ) ( not ( = ?auto_870709 ?auto_870713 ) ) ( not ( = ?auto_870709 ?auto_870714 ) ) ( not ( = ?auto_870709 ?auto_870715 ) ) ( not ( = ?auto_870709 ?auto_870716 ) ) ( not ( = ?auto_870709 ?auto_870717 ) ) ( not ( = ?auto_870709 ?auto_870718 ) ) ( not ( = ?auto_870709 ?auto_870719 ) ) ( not ( = ?auto_870709 ?auto_870720 ) ) ( not ( = ?auto_870709 ?auto_870721 ) ) ( not ( = ?auto_870710 ?auto_870711 ) ) ( not ( = ?auto_870710 ?auto_870712 ) ) ( not ( = ?auto_870710 ?auto_870713 ) ) ( not ( = ?auto_870710 ?auto_870714 ) ) ( not ( = ?auto_870710 ?auto_870715 ) ) ( not ( = ?auto_870710 ?auto_870716 ) ) ( not ( = ?auto_870710 ?auto_870717 ) ) ( not ( = ?auto_870710 ?auto_870718 ) ) ( not ( = ?auto_870710 ?auto_870719 ) ) ( not ( = ?auto_870710 ?auto_870720 ) ) ( not ( = ?auto_870710 ?auto_870721 ) ) ( not ( = ?auto_870711 ?auto_870712 ) ) ( not ( = ?auto_870711 ?auto_870713 ) ) ( not ( = ?auto_870711 ?auto_870714 ) ) ( not ( = ?auto_870711 ?auto_870715 ) ) ( not ( = ?auto_870711 ?auto_870716 ) ) ( not ( = ?auto_870711 ?auto_870717 ) ) ( not ( = ?auto_870711 ?auto_870718 ) ) ( not ( = ?auto_870711 ?auto_870719 ) ) ( not ( = ?auto_870711 ?auto_870720 ) ) ( not ( = ?auto_870711 ?auto_870721 ) ) ( not ( = ?auto_870712 ?auto_870713 ) ) ( not ( = ?auto_870712 ?auto_870714 ) ) ( not ( = ?auto_870712 ?auto_870715 ) ) ( not ( = ?auto_870712 ?auto_870716 ) ) ( not ( = ?auto_870712 ?auto_870717 ) ) ( not ( = ?auto_870712 ?auto_870718 ) ) ( not ( = ?auto_870712 ?auto_870719 ) ) ( not ( = ?auto_870712 ?auto_870720 ) ) ( not ( = ?auto_870712 ?auto_870721 ) ) ( not ( = ?auto_870713 ?auto_870714 ) ) ( not ( = ?auto_870713 ?auto_870715 ) ) ( not ( = ?auto_870713 ?auto_870716 ) ) ( not ( = ?auto_870713 ?auto_870717 ) ) ( not ( = ?auto_870713 ?auto_870718 ) ) ( not ( = ?auto_870713 ?auto_870719 ) ) ( not ( = ?auto_870713 ?auto_870720 ) ) ( not ( = ?auto_870713 ?auto_870721 ) ) ( not ( = ?auto_870714 ?auto_870715 ) ) ( not ( = ?auto_870714 ?auto_870716 ) ) ( not ( = ?auto_870714 ?auto_870717 ) ) ( not ( = ?auto_870714 ?auto_870718 ) ) ( not ( = ?auto_870714 ?auto_870719 ) ) ( not ( = ?auto_870714 ?auto_870720 ) ) ( not ( = ?auto_870714 ?auto_870721 ) ) ( not ( = ?auto_870715 ?auto_870716 ) ) ( not ( = ?auto_870715 ?auto_870717 ) ) ( not ( = ?auto_870715 ?auto_870718 ) ) ( not ( = ?auto_870715 ?auto_870719 ) ) ( not ( = ?auto_870715 ?auto_870720 ) ) ( not ( = ?auto_870715 ?auto_870721 ) ) ( not ( = ?auto_870716 ?auto_870717 ) ) ( not ( = ?auto_870716 ?auto_870718 ) ) ( not ( = ?auto_870716 ?auto_870719 ) ) ( not ( = ?auto_870716 ?auto_870720 ) ) ( not ( = ?auto_870716 ?auto_870721 ) ) ( not ( = ?auto_870717 ?auto_870718 ) ) ( not ( = ?auto_870717 ?auto_870719 ) ) ( not ( = ?auto_870717 ?auto_870720 ) ) ( not ( = ?auto_870717 ?auto_870721 ) ) ( not ( = ?auto_870718 ?auto_870719 ) ) ( not ( = ?auto_870718 ?auto_870720 ) ) ( not ( = ?auto_870718 ?auto_870721 ) ) ( not ( = ?auto_870719 ?auto_870720 ) ) ( not ( = ?auto_870719 ?auto_870721 ) ) ( not ( = ?auto_870720 ?auto_870721 ) ) ( ON ?auto_870720 ?auto_870721 ) ( ON ?auto_870719 ?auto_870720 ) ( ON ?auto_870718 ?auto_870719 ) ( ON ?auto_870717 ?auto_870718 ) ( CLEAR ?auto_870715 ) ( ON ?auto_870716 ?auto_870717 ) ( CLEAR ?auto_870716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_870704 ?auto_870705 ?auto_870706 ?auto_870707 ?auto_870708 ?auto_870709 ?auto_870710 ?auto_870711 ?auto_870712 ?auto_870713 ?auto_870714 ?auto_870715 ?auto_870716 )
      ( MAKE-18PILE ?auto_870704 ?auto_870705 ?auto_870706 ?auto_870707 ?auto_870708 ?auto_870709 ?auto_870710 ?auto_870711 ?auto_870712 ?auto_870713 ?auto_870714 ?auto_870715 ?auto_870716 ?auto_870717 ?auto_870718 ?auto_870719 ?auto_870720 ?auto_870721 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870740 - BLOCK
      ?auto_870741 - BLOCK
      ?auto_870742 - BLOCK
      ?auto_870743 - BLOCK
      ?auto_870744 - BLOCK
      ?auto_870745 - BLOCK
      ?auto_870746 - BLOCK
      ?auto_870747 - BLOCK
      ?auto_870748 - BLOCK
      ?auto_870749 - BLOCK
      ?auto_870750 - BLOCK
      ?auto_870751 - BLOCK
      ?auto_870752 - BLOCK
      ?auto_870753 - BLOCK
      ?auto_870754 - BLOCK
      ?auto_870755 - BLOCK
      ?auto_870756 - BLOCK
      ?auto_870757 - BLOCK
    )
    :vars
    (
      ?auto_870758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870757 ?auto_870758 ) ( ON-TABLE ?auto_870740 ) ( ON ?auto_870741 ?auto_870740 ) ( ON ?auto_870742 ?auto_870741 ) ( ON ?auto_870743 ?auto_870742 ) ( ON ?auto_870744 ?auto_870743 ) ( ON ?auto_870745 ?auto_870744 ) ( ON ?auto_870746 ?auto_870745 ) ( ON ?auto_870747 ?auto_870746 ) ( ON ?auto_870748 ?auto_870747 ) ( ON ?auto_870749 ?auto_870748 ) ( ON ?auto_870750 ?auto_870749 ) ( not ( = ?auto_870740 ?auto_870741 ) ) ( not ( = ?auto_870740 ?auto_870742 ) ) ( not ( = ?auto_870740 ?auto_870743 ) ) ( not ( = ?auto_870740 ?auto_870744 ) ) ( not ( = ?auto_870740 ?auto_870745 ) ) ( not ( = ?auto_870740 ?auto_870746 ) ) ( not ( = ?auto_870740 ?auto_870747 ) ) ( not ( = ?auto_870740 ?auto_870748 ) ) ( not ( = ?auto_870740 ?auto_870749 ) ) ( not ( = ?auto_870740 ?auto_870750 ) ) ( not ( = ?auto_870740 ?auto_870751 ) ) ( not ( = ?auto_870740 ?auto_870752 ) ) ( not ( = ?auto_870740 ?auto_870753 ) ) ( not ( = ?auto_870740 ?auto_870754 ) ) ( not ( = ?auto_870740 ?auto_870755 ) ) ( not ( = ?auto_870740 ?auto_870756 ) ) ( not ( = ?auto_870740 ?auto_870757 ) ) ( not ( = ?auto_870740 ?auto_870758 ) ) ( not ( = ?auto_870741 ?auto_870742 ) ) ( not ( = ?auto_870741 ?auto_870743 ) ) ( not ( = ?auto_870741 ?auto_870744 ) ) ( not ( = ?auto_870741 ?auto_870745 ) ) ( not ( = ?auto_870741 ?auto_870746 ) ) ( not ( = ?auto_870741 ?auto_870747 ) ) ( not ( = ?auto_870741 ?auto_870748 ) ) ( not ( = ?auto_870741 ?auto_870749 ) ) ( not ( = ?auto_870741 ?auto_870750 ) ) ( not ( = ?auto_870741 ?auto_870751 ) ) ( not ( = ?auto_870741 ?auto_870752 ) ) ( not ( = ?auto_870741 ?auto_870753 ) ) ( not ( = ?auto_870741 ?auto_870754 ) ) ( not ( = ?auto_870741 ?auto_870755 ) ) ( not ( = ?auto_870741 ?auto_870756 ) ) ( not ( = ?auto_870741 ?auto_870757 ) ) ( not ( = ?auto_870741 ?auto_870758 ) ) ( not ( = ?auto_870742 ?auto_870743 ) ) ( not ( = ?auto_870742 ?auto_870744 ) ) ( not ( = ?auto_870742 ?auto_870745 ) ) ( not ( = ?auto_870742 ?auto_870746 ) ) ( not ( = ?auto_870742 ?auto_870747 ) ) ( not ( = ?auto_870742 ?auto_870748 ) ) ( not ( = ?auto_870742 ?auto_870749 ) ) ( not ( = ?auto_870742 ?auto_870750 ) ) ( not ( = ?auto_870742 ?auto_870751 ) ) ( not ( = ?auto_870742 ?auto_870752 ) ) ( not ( = ?auto_870742 ?auto_870753 ) ) ( not ( = ?auto_870742 ?auto_870754 ) ) ( not ( = ?auto_870742 ?auto_870755 ) ) ( not ( = ?auto_870742 ?auto_870756 ) ) ( not ( = ?auto_870742 ?auto_870757 ) ) ( not ( = ?auto_870742 ?auto_870758 ) ) ( not ( = ?auto_870743 ?auto_870744 ) ) ( not ( = ?auto_870743 ?auto_870745 ) ) ( not ( = ?auto_870743 ?auto_870746 ) ) ( not ( = ?auto_870743 ?auto_870747 ) ) ( not ( = ?auto_870743 ?auto_870748 ) ) ( not ( = ?auto_870743 ?auto_870749 ) ) ( not ( = ?auto_870743 ?auto_870750 ) ) ( not ( = ?auto_870743 ?auto_870751 ) ) ( not ( = ?auto_870743 ?auto_870752 ) ) ( not ( = ?auto_870743 ?auto_870753 ) ) ( not ( = ?auto_870743 ?auto_870754 ) ) ( not ( = ?auto_870743 ?auto_870755 ) ) ( not ( = ?auto_870743 ?auto_870756 ) ) ( not ( = ?auto_870743 ?auto_870757 ) ) ( not ( = ?auto_870743 ?auto_870758 ) ) ( not ( = ?auto_870744 ?auto_870745 ) ) ( not ( = ?auto_870744 ?auto_870746 ) ) ( not ( = ?auto_870744 ?auto_870747 ) ) ( not ( = ?auto_870744 ?auto_870748 ) ) ( not ( = ?auto_870744 ?auto_870749 ) ) ( not ( = ?auto_870744 ?auto_870750 ) ) ( not ( = ?auto_870744 ?auto_870751 ) ) ( not ( = ?auto_870744 ?auto_870752 ) ) ( not ( = ?auto_870744 ?auto_870753 ) ) ( not ( = ?auto_870744 ?auto_870754 ) ) ( not ( = ?auto_870744 ?auto_870755 ) ) ( not ( = ?auto_870744 ?auto_870756 ) ) ( not ( = ?auto_870744 ?auto_870757 ) ) ( not ( = ?auto_870744 ?auto_870758 ) ) ( not ( = ?auto_870745 ?auto_870746 ) ) ( not ( = ?auto_870745 ?auto_870747 ) ) ( not ( = ?auto_870745 ?auto_870748 ) ) ( not ( = ?auto_870745 ?auto_870749 ) ) ( not ( = ?auto_870745 ?auto_870750 ) ) ( not ( = ?auto_870745 ?auto_870751 ) ) ( not ( = ?auto_870745 ?auto_870752 ) ) ( not ( = ?auto_870745 ?auto_870753 ) ) ( not ( = ?auto_870745 ?auto_870754 ) ) ( not ( = ?auto_870745 ?auto_870755 ) ) ( not ( = ?auto_870745 ?auto_870756 ) ) ( not ( = ?auto_870745 ?auto_870757 ) ) ( not ( = ?auto_870745 ?auto_870758 ) ) ( not ( = ?auto_870746 ?auto_870747 ) ) ( not ( = ?auto_870746 ?auto_870748 ) ) ( not ( = ?auto_870746 ?auto_870749 ) ) ( not ( = ?auto_870746 ?auto_870750 ) ) ( not ( = ?auto_870746 ?auto_870751 ) ) ( not ( = ?auto_870746 ?auto_870752 ) ) ( not ( = ?auto_870746 ?auto_870753 ) ) ( not ( = ?auto_870746 ?auto_870754 ) ) ( not ( = ?auto_870746 ?auto_870755 ) ) ( not ( = ?auto_870746 ?auto_870756 ) ) ( not ( = ?auto_870746 ?auto_870757 ) ) ( not ( = ?auto_870746 ?auto_870758 ) ) ( not ( = ?auto_870747 ?auto_870748 ) ) ( not ( = ?auto_870747 ?auto_870749 ) ) ( not ( = ?auto_870747 ?auto_870750 ) ) ( not ( = ?auto_870747 ?auto_870751 ) ) ( not ( = ?auto_870747 ?auto_870752 ) ) ( not ( = ?auto_870747 ?auto_870753 ) ) ( not ( = ?auto_870747 ?auto_870754 ) ) ( not ( = ?auto_870747 ?auto_870755 ) ) ( not ( = ?auto_870747 ?auto_870756 ) ) ( not ( = ?auto_870747 ?auto_870757 ) ) ( not ( = ?auto_870747 ?auto_870758 ) ) ( not ( = ?auto_870748 ?auto_870749 ) ) ( not ( = ?auto_870748 ?auto_870750 ) ) ( not ( = ?auto_870748 ?auto_870751 ) ) ( not ( = ?auto_870748 ?auto_870752 ) ) ( not ( = ?auto_870748 ?auto_870753 ) ) ( not ( = ?auto_870748 ?auto_870754 ) ) ( not ( = ?auto_870748 ?auto_870755 ) ) ( not ( = ?auto_870748 ?auto_870756 ) ) ( not ( = ?auto_870748 ?auto_870757 ) ) ( not ( = ?auto_870748 ?auto_870758 ) ) ( not ( = ?auto_870749 ?auto_870750 ) ) ( not ( = ?auto_870749 ?auto_870751 ) ) ( not ( = ?auto_870749 ?auto_870752 ) ) ( not ( = ?auto_870749 ?auto_870753 ) ) ( not ( = ?auto_870749 ?auto_870754 ) ) ( not ( = ?auto_870749 ?auto_870755 ) ) ( not ( = ?auto_870749 ?auto_870756 ) ) ( not ( = ?auto_870749 ?auto_870757 ) ) ( not ( = ?auto_870749 ?auto_870758 ) ) ( not ( = ?auto_870750 ?auto_870751 ) ) ( not ( = ?auto_870750 ?auto_870752 ) ) ( not ( = ?auto_870750 ?auto_870753 ) ) ( not ( = ?auto_870750 ?auto_870754 ) ) ( not ( = ?auto_870750 ?auto_870755 ) ) ( not ( = ?auto_870750 ?auto_870756 ) ) ( not ( = ?auto_870750 ?auto_870757 ) ) ( not ( = ?auto_870750 ?auto_870758 ) ) ( not ( = ?auto_870751 ?auto_870752 ) ) ( not ( = ?auto_870751 ?auto_870753 ) ) ( not ( = ?auto_870751 ?auto_870754 ) ) ( not ( = ?auto_870751 ?auto_870755 ) ) ( not ( = ?auto_870751 ?auto_870756 ) ) ( not ( = ?auto_870751 ?auto_870757 ) ) ( not ( = ?auto_870751 ?auto_870758 ) ) ( not ( = ?auto_870752 ?auto_870753 ) ) ( not ( = ?auto_870752 ?auto_870754 ) ) ( not ( = ?auto_870752 ?auto_870755 ) ) ( not ( = ?auto_870752 ?auto_870756 ) ) ( not ( = ?auto_870752 ?auto_870757 ) ) ( not ( = ?auto_870752 ?auto_870758 ) ) ( not ( = ?auto_870753 ?auto_870754 ) ) ( not ( = ?auto_870753 ?auto_870755 ) ) ( not ( = ?auto_870753 ?auto_870756 ) ) ( not ( = ?auto_870753 ?auto_870757 ) ) ( not ( = ?auto_870753 ?auto_870758 ) ) ( not ( = ?auto_870754 ?auto_870755 ) ) ( not ( = ?auto_870754 ?auto_870756 ) ) ( not ( = ?auto_870754 ?auto_870757 ) ) ( not ( = ?auto_870754 ?auto_870758 ) ) ( not ( = ?auto_870755 ?auto_870756 ) ) ( not ( = ?auto_870755 ?auto_870757 ) ) ( not ( = ?auto_870755 ?auto_870758 ) ) ( not ( = ?auto_870756 ?auto_870757 ) ) ( not ( = ?auto_870756 ?auto_870758 ) ) ( not ( = ?auto_870757 ?auto_870758 ) ) ( ON ?auto_870756 ?auto_870757 ) ( ON ?auto_870755 ?auto_870756 ) ( ON ?auto_870754 ?auto_870755 ) ( ON ?auto_870753 ?auto_870754 ) ( ON ?auto_870752 ?auto_870753 ) ( CLEAR ?auto_870750 ) ( ON ?auto_870751 ?auto_870752 ) ( CLEAR ?auto_870751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_870740 ?auto_870741 ?auto_870742 ?auto_870743 ?auto_870744 ?auto_870745 ?auto_870746 ?auto_870747 ?auto_870748 ?auto_870749 ?auto_870750 ?auto_870751 )
      ( MAKE-18PILE ?auto_870740 ?auto_870741 ?auto_870742 ?auto_870743 ?auto_870744 ?auto_870745 ?auto_870746 ?auto_870747 ?auto_870748 ?auto_870749 ?auto_870750 ?auto_870751 ?auto_870752 ?auto_870753 ?auto_870754 ?auto_870755 ?auto_870756 ?auto_870757 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870777 - BLOCK
      ?auto_870778 - BLOCK
      ?auto_870779 - BLOCK
      ?auto_870780 - BLOCK
      ?auto_870781 - BLOCK
      ?auto_870782 - BLOCK
      ?auto_870783 - BLOCK
      ?auto_870784 - BLOCK
      ?auto_870785 - BLOCK
      ?auto_870786 - BLOCK
      ?auto_870787 - BLOCK
      ?auto_870788 - BLOCK
      ?auto_870789 - BLOCK
      ?auto_870790 - BLOCK
      ?auto_870791 - BLOCK
      ?auto_870792 - BLOCK
      ?auto_870793 - BLOCK
      ?auto_870794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870794 ) ( ON-TABLE ?auto_870777 ) ( ON ?auto_870778 ?auto_870777 ) ( ON ?auto_870779 ?auto_870778 ) ( ON ?auto_870780 ?auto_870779 ) ( ON ?auto_870781 ?auto_870780 ) ( ON ?auto_870782 ?auto_870781 ) ( ON ?auto_870783 ?auto_870782 ) ( ON ?auto_870784 ?auto_870783 ) ( ON ?auto_870785 ?auto_870784 ) ( ON ?auto_870786 ?auto_870785 ) ( ON ?auto_870787 ?auto_870786 ) ( not ( = ?auto_870777 ?auto_870778 ) ) ( not ( = ?auto_870777 ?auto_870779 ) ) ( not ( = ?auto_870777 ?auto_870780 ) ) ( not ( = ?auto_870777 ?auto_870781 ) ) ( not ( = ?auto_870777 ?auto_870782 ) ) ( not ( = ?auto_870777 ?auto_870783 ) ) ( not ( = ?auto_870777 ?auto_870784 ) ) ( not ( = ?auto_870777 ?auto_870785 ) ) ( not ( = ?auto_870777 ?auto_870786 ) ) ( not ( = ?auto_870777 ?auto_870787 ) ) ( not ( = ?auto_870777 ?auto_870788 ) ) ( not ( = ?auto_870777 ?auto_870789 ) ) ( not ( = ?auto_870777 ?auto_870790 ) ) ( not ( = ?auto_870777 ?auto_870791 ) ) ( not ( = ?auto_870777 ?auto_870792 ) ) ( not ( = ?auto_870777 ?auto_870793 ) ) ( not ( = ?auto_870777 ?auto_870794 ) ) ( not ( = ?auto_870778 ?auto_870779 ) ) ( not ( = ?auto_870778 ?auto_870780 ) ) ( not ( = ?auto_870778 ?auto_870781 ) ) ( not ( = ?auto_870778 ?auto_870782 ) ) ( not ( = ?auto_870778 ?auto_870783 ) ) ( not ( = ?auto_870778 ?auto_870784 ) ) ( not ( = ?auto_870778 ?auto_870785 ) ) ( not ( = ?auto_870778 ?auto_870786 ) ) ( not ( = ?auto_870778 ?auto_870787 ) ) ( not ( = ?auto_870778 ?auto_870788 ) ) ( not ( = ?auto_870778 ?auto_870789 ) ) ( not ( = ?auto_870778 ?auto_870790 ) ) ( not ( = ?auto_870778 ?auto_870791 ) ) ( not ( = ?auto_870778 ?auto_870792 ) ) ( not ( = ?auto_870778 ?auto_870793 ) ) ( not ( = ?auto_870778 ?auto_870794 ) ) ( not ( = ?auto_870779 ?auto_870780 ) ) ( not ( = ?auto_870779 ?auto_870781 ) ) ( not ( = ?auto_870779 ?auto_870782 ) ) ( not ( = ?auto_870779 ?auto_870783 ) ) ( not ( = ?auto_870779 ?auto_870784 ) ) ( not ( = ?auto_870779 ?auto_870785 ) ) ( not ( = ?auto_870779 ?auto_870786 ) ) ( not ( = ?auto_870779 ?auto_870787 ) ) ( not ( = ?auto_870779 ?auto_870788 ) ) ( not ( = ?auto_870779 ?auto_870789 ) ) ( not ( = ?auto_870779 ?auto_870790 ) ) ( not ( = ?auto_870779 ?auto_870791 ) ) ( not ( = ?auto_870779 ?auto_870792 ) ) ( not ( = ?auto_870779 ?auto_870793 ) ) ( not ( = ?auto_870779 ?auto_870794 ) ) ( not ( = ?auto_870780 ?auto_870781 ) ) ( not ( = ?auto_870780 ?auto_870782 ) ) ( not ( = ?auto_870780 ?auto_870783 ) ) ( not ( = ?auto_870780 ?auto_870784 ) ) ( not ( = ?auto_870780 ?auto_870785 ) ) ( not ( = ?auto_870780 ?auto_870786 ) ) ( not ( = ?auto_870780 ?auto_870787 ) ) ( not ( = ?auto_870780 ?auto_870788 ) ) ( not ( = ?auto_870780 ?auto_870789 ) ) ( not ( = ?auto_870780 ?auto_870790 ) ) ( not ( = ?auto_870780 ?auto_870791 ) ) ( not ( = ?auto_870780 ?auto_870792 ) ) ( not ( = ?auto_870780 ?auto_870793 ) ) ( not ( = ?auto_870780 ?auto_870794 ) ) ( not ( = ?auto_870781 ?auto_870782 ) ) ( not ( = ?auto_870781 ?auto_870783 ) ) ( not ( = ?auto_870781 ?auto_870784 ) ) ( not ( = ?auto_870781 ?auto_870785 ) ) ( not ( = ?auto_870781 ?auto_870786 ) ) ( not ( = ?auto_870781 ?auto_870787 ) ) ( not ( = ?auto_870781 ?auto_870788 ) ) ( not ( = ?auto_870781 ?auto_870789 ) ) ( not ( = ?auto_870781 ?auto_870790 ) ) ( not ( = ?auto_870781 ?auto_870791 ) ) ( not ( = ?auto_870781 ?auto_870792 ) ) ( not ( = ?auto_870781 ?auto_870793 ) ) ( not ( = ?auto_870781 ?auto_870794 ) ) ( not ( = ?auto_870782 ?auto_870783 ) ) ( not ( = ?auto_870782 ?auto_870784 ) ) ( not ( = ?auto_870782 ?auto_870785 ) ) ( not ( = ?auto_870782 ?auto_870786 ) ) ( not ( = ?auto_870782 ?auto_870787 ) ) ( not ( = ?auto_870782 ?auto_870788 ) ) ( not ( = ?auto_870782 ?auto_870789 ) ) ( not ( = ?auto_870782 ?auto_870790 ) ) ( not ( = ?auto_870782 ?auto_870791 ) ) ( not ( = ?auto_870782 ?auto_870792 ) ) ( not ( = ?auto_870782 ?auto_870793 ) ) ( not ( = ?auto_870782 ?auto_870794 ) ) ( not ( = ?auto_870783 ?auto_870784 ) ) ( not ( = ?auto_870783 ?auto_870785 ) ) ( not ( = ?auto_870783 ?auto_870786 ) ) ( not ( = ?auto_870783 ?auto_870787 ) ) ( not ( = ?auto_870783 ?auto_870788 ) ) ( not ( = ?auto_870783 ?auto_870789 ) ) ( not ( = ?auto_870783 ?auto_870790 ) ) ( not ( = ?auto_870783 ?auto_870791 ) ) ( not ( = ?auto_870783 ?auto_870792 ) ) ( not ( = ?auto_870783 ?auto_870793 ) ) ( not ( = ?auto_870783 ?auto_870794 ) ) ( not ( = ?auto_870784 ?auto_870785 ) ) ( not ( = ?auto_870784 ?auto_870786 ) ) ( not ( = ?auto_870784 ?auto_870787 ) ) ( not ( = ?auto_870784 ?auto_870788 ) ) ( not ( = ?auto_870784 ?auto_870789 ) ) ( not ( = ?auto_870784 ?auto_870790 ) ) ( not ( = ?auto_870784 ?auto_870791 ) ) ( not ( = ?auto_870784 ?auto_870792 ) ) ( not ( = ?auto_870784 ?auto_870793 ) ) ( not ( = ?auto_870784 ?auto_870794 ) ) ( not ( = ?auto_870785 ?auto_870786 ) ) ( not ( = ?auto_870785 ?auto_870787 ) ) ( not ( = ?auto_870785 ?auto_870788 ) ) ( not ( = ?auto_870785 ?auto_870789 ) ) ( not ( = ?auto_870785 ?auto_870790 ) ) ( not ( = ?auto_870785 ?auto_870791 ) ) ( not ( = ?auto_870785 ?auto_870792 ) ) ( not ( = ?auto_870785 ?auto_870793 ) ) ( not ( = ?auto_870785 ?auto_870794 ) ) ( not ( = ?auto_870786 ?auto_870787 ) ) ( not ( = ?auto_870786 ?auto_870788 ) ) ( not ( = ?auto_870786 ?auto_870789 ) ) ( not ( = ?auto_870786 ?auto_870790 ) ) ( not ( = ?auto_870786 ?auto_870791 ) ) ( not ( = ?auto_870786 ?auto_870792 ) ) ( not ( = ?auto_870786 ?auto_870793 ) ) ( not ( = ?auto_870786 ?auto_870794 ) ) ( not ( = ?auto_870787 ?auto_870788 ) ) ( not ( = ?auto_870787 ?auto_870789 ) ) ( not ( = ?auto_870787 ?auto_870790 ) ) ( not ( = ?auto_870787 ?auto_870791 ) ) ( not ( = ?auto_870787 ?auto_870792 ) ) ( not ( = ?auto_870787 ?auto_870793 ) ) ( not ( = ?auto_870787 ?auto_870794 ) ) ( not ( = ?auto_870788 ?auto_870789 ) ) ( not ( = ?auto_870788 ?auto_870790 ) ) ( not ( = ?auto_870788 ?auto_870791 ) ) ( not ( = ?auto_870788 ?auto_870792 ) ) ( not ( = ?auto_870788 ?auto_870793 ) ) ( not ( = ?auto_870788 ?auto_870794 ) ) ( not ( = ?auto_870789 ?auto_870790 ) ) ( not ( = ?auto_870789 ?auto_870791 ) ) ( not ( = ?auto_870789 ?auto_870792 ) ) ( not ( = ?auto_870789 ?auto_870793 ) ) ( not ( = ?auto_870789 ?auto_870794 ) ) ( not ( = ?auto_870790 ?auto_870791 ) ) ( not ( = ?auto_870790 ?auto_870792 ) ) ( not ( = ?auto_870790 ?auto_870793 ) ) ( not ( = ?auto_870790 ?auto_870794 ) ) ( not ( = ?auto_870791 ?auto_870792 ) ) ( not ( = ?auto_870791 ?auto_870793 ) ) ( not ( = ?auto_870791 ?auto_870794 ) ) ( not ( = ?auto_870792 ?auto_870793 ) ) ( not ( = ?auto_870792 ?auto_870794 ) ) ( not ( = ?auto_870793 ?auto_870794 ) ) ( ON ?auto_870793 ?auto_870794 ) ( ON ?auto_870792 ?auto_870793 ) ( ON ?auto_870791 ?auto_870792 ) ( ON ?auto_870790 ?auto_870791 ) ( ON ?auto_870789 ?auto_870790 ) ( CLEAR ?auto_870787 ) ( ON ?auto_870788 ?auto_870789 ) ( CLEAR ?auto_870788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_870777 ?auto_870778 ?auto_870779 ?auto_870780 ?auto_870781 ?auto_870782 ?auto_870783 ?auto_870784 ?auto_870785 ?auto_870786 ?auto_870787 ?auto_870788 )
      ( MAKE-18PILE ?auto_870777 ?auto_870778 ?auto_870779 ?auto_870780 ?auto_870781 ?auto_870782 ?auto_870783 ?auto_870784 ?auto_870785 ?auto_870786 ?auto_870787 ?auto_870788 ?auto_870789 ?auto_870790 ?auto_870791 ?auto_870792 ?auto_870793 ?auto_870794 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870813 - BLOCK
      ?auto_870814 - BLOCK
      ?auto_870815 - BLOCK
      ?auto_870816 - BLOCK
      ?auto_870817 - BLOCK
      ?auto_870818 - BLOCK
      ?auto_870819 - BLOCK
      ?auto_870820 - BLOCK
      ?auto_870821 - BLOCK
      ?auto_870822 - BLOCK
      ?auto_870823 - BLOCK
      ?auto_870824 - BLOCK
      ?auto_870825 - BLOCK
      ?auto_870826 - BLOCK
      ?auto_870827 - BLOCK
      ?auto_870828 - BLOCK
      ?auto_870829 - BLOCK
      ?auto_870830 - BLOCK
    )
    :vars
    (
      ?auto_870831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870830 ?auto_870831 ) ( ON-TABLE ?auto_870813 ) ( ON ?auto_870814 ?auto_870813 ) ( ON ?auto_870815 ?auto_870814 ) ( ON ?auto_870816 ?auto_870815 ) ( ON ?auto_870817 ?auto_870816 ) ( ON ?auto_870818 ?auto_870817 ) ( ON ?auto_870819 ?auto_870818 ) ( ON ?auto_870820 ?auto_870819 ) ( ON ?auto_870821 ?auto_870820 ) ( ON ?auto_870822 ?auto_870821 ) ( not ( = ?auto_870813 ?auto_870814 ) ) ( not ( = ?auto_870813 ?auto_870815 ) ) ( not ( = ?auto_870813 ?auto_870816 ) ) ( not ( = ?auto_870813 ?auto_870817 ) ) ( not ( = ?auto_870813 ?auto_870818 ) ) ( not ( = ?auto_870813 ?auto_870819 ) ) ( not ( = ?auto_870813 ?auto_870820 ) ) ( not ( = ?auto_870813 ?auto_870821 ) ) ( not ( = ?auto_870813 ?auto_870822 ) ) ( not ( = ?auto_870813 ?auto_870823 ) ) ( not ( = ?auto_870813 ?auto_870824 ) ) ( not ( = ?auto_870813 ?auto_870825 ) ) ( not ( = ?auto_870813 ?auto_870826 ) ) ( not ( = ?auto_870813 ?auto_870827 ) ) ( not ( = ?auto_870813 ?auto_870828 ) ) ( not ( = ?auto_870813 ?auto_870829 ) ) ( not ( = ?auto_870813 ?auto_870830 ) ) ( not ( = ?auto_870813 ?auto_870831 ) ) ( not ( = ?auto_870814 ?auto_870815 ) ) ( not ( = ?auto_870814 ?auto_870816 ) ) ( not ( = ?auto_870814 ?auto_870817 ) ) ( not ( = ?auto_870814 ?auto_870818 ) ) ( not ( = ?auto_870814 ?auto_870819 ) ) ( not ( = ?auto_870814 ?auto_870820 ) ) ( not ( = ?auto_870814 ?auto_870821 ) ) ( not ( = ?auto_870814 ?auto_870822 ) ) ( not ( = ?auto_870814 ?auto_870823 ) ) ( not ( = ?auto_870814 ?auto_870824 ) ) ( not ( = ?auto_870814 ?auto_870825 ) ) ( not ( = ?auto_870814 ?auto_870826 ) ) ( not ( = ?auto_870814 ?auto_870827 ) ) ( not ( = ?auto_870814 ?auto_870828 ) ) ( not ( = ?auto_870814 ?auto_870829 ) ) ( not ( = ?auto_870814 ?auto_870830 ) ) ( not ( = ?auto_870814 ?auto_870831 ) ) ( not ( = ?auto_870815 ?auto_870816 ) ) ( not ( = ?auto_870815 ?auto_870817 ) ) ( not ( = ?auto_870815 ?auto_870818 ) ) ( not ( = ?auto_870815 ?auto_870819 ) ) ( not ( = ?auto_870815 ?auto_870820 ) ) ( not ( = ?auto_870815 ?auto_870821 ) ) ( not ( = ?auto_870815 ?auto_870822 ) ) ( not ( = ?auto_870815 ?auto_870823 ) ) ( not ( = ?auto_870815 ?auto_870824 ) ) ( not ( = ?auto_870815 ?auto_870825 ) ) ( not ( = ?auto_870815 ?auto_870826 ) ) ( not ( = ?auto_870815 ?auto_870827 ) ) ( not ( = ?auto_870815 ?auto_870828 ) ) ( not ( = ?auto_870815 ?auto_870829 ) ) ( not ( = ?auto_870815 ?auto_870830 ) ) ( not ( = ?auto_870815 ?auto_870831 ) ) ( not ( = ?auto_870816 ?auto_870817 ) ) ( not ( = ?auto_870816 ?auto_870818 ) ) ( not ( = ?auto_870816 ?auto_870819 ) ) ( not ( = ?auto_870816 ?auto_870820 ) ) ( not ( = ?auto_870816 ?auto_870821 ) ) ( not ( = ?auto_870816 ?auto_870822 ) ) ( not ( = ?auto_870816 ?auto_870823 ) ) ( not ( = ?auto_870816 ?auto_870824 ) ) ( not ( = ?auto_870816 ?auto_870825 ) ) ( not ( = ?auto_870816 ?auto_870826 ) ) ( not ( = ?auto_870816 ?auto_870827 ) ) ( not ( = ?auto_870816 ?auto_870828 ) ) ( not ( = ?auto_870816 ?auto_870829 ) ) ( not ( = ?auto_870816 ?auto_870830 ) ) ( not ( = ?auto_870816 ?auto_870831 ) ) ( not ( = ?auto_870817 ?auto_870818 ) ) ( not ( = ?auto_870817 ?auto_870819 ) ) ( not ( = ?auto_870817 ?auto_870820 ) ) ( not ( = ?auto_870817 ?auto_870821 ) ) ( not ( = ?auto_870817 ?auto_870822 ) ) ( not ( = ?auto_870817 ?auto_870823 ) ) ( not ( = ?auto_870817 ?auto_870824 ) ) ( not ( = ?auto_870817 ?auto_870825 ) ) ( not ( = ?auto_870817 ?auto_870826 ) ) ( not ( = ?auto_870817 ?auto_870827 ) ) ( not ( = ?auto_870817 ?auto_870828 ) ) ( not ( = ?auto_870817 ?auto_870829 ) ) ( not ( = ?auto_870817 ?auto_870830 ) ) ( not ( = ?auto_870817 ?auto_870831 ) ) ( not ( = ?auto_870818 ?auto_870819 ) ) ( not ( = ?auto_870818 ?auto_870820 ) ) ( not ( = ?auto_870818 ?auto_870821 ) ) ( not ( = ?auto_870818 ?auto_870822 ) ) ( not ( = ?auto_870818 ?auto_870823 ) ) ( not ( = ?auto_870818 ?auto_870824 ) ) ( not ( = ?auto_870818 ?auto_870825 ) ) ( not ( = ?auto_870818 ?auto_870826 ) ) ( not ( = ?auto_870818 ?auto_870827 ) ) ( not ( = ?auto_870818 ?auto_870828 ) ) ( not ( = ?auto_870818 ?auto_870829 ) ) ( not ( = ?auto_870818 ?auto_870830 ) ) ( not ( = ?auto_870818 ?auto_870831 ) ) ( not ( = ?auto_870819 ?auto_870820 ) ) ( not ( = ?auto_870819 ?auto_870821 ) ) ( not ( = ?auto_870819 ?auto_870822 ) ) ( not ( = ?auto_870819 ?auto_870823 ) ) ( not ( = ?auto_870819 ?auto_870824 ) ) ( not ( = ?auto_870819 ?auto_870825 ) ) ( not ( = ?auto_870819 ?auto_870826 ) ) ( not ( = ?auto_870819 ?auto_870827 ) ) ( not ( = ?auto_870819 ?auto_870828 ) ) ( not ( = ?auto_870819 ?auto_870829 ) ) ( not ( = ?auto_870819 ?auto_870830 ) ) ( not ( = ?auto_870819 ?auto_870831 ) ) ( not ( = ?auto_870820 ?auto_870821 ) ) ( not ( = ?auto_870820 ?auto_870822 ) ) ( not ( = ?auto_870820 ?auto_870823 ) ) ( not ( = ?auto_870820 ?auto_870824 ) ) ( not ( = ?auto_870820 ?auto_870825 ) ) ( not ( = ?auto_870820 ?auto_870826 ) ) ( not ( = ?auto_870820 ?auto_870827 ) ) ( not ( = ?auto_870820 ?auto_870828 ) ) ( not ( = ?auto_870820 ?auto_870829 ) ) ( not ( = ?auto_870820 ?auto_870830 ) ) ( not ( = ?auto_870820 ?auto_870831 ) ) ( not ( = ?auto_870821 ?auto_870822 ) ) ( not ( = ?auto_870821 ?auto_870823 ) ) ( not ( = ?auto_870821 ?auto_870824 ) ) ( not ( = ?auto_870821 ?auto_870825 ) ) ( not ( = ?auto_870821 ?auto_870826 ) ) ( not ( = ?auto_870821 ?auto_870827 ) ) ( not ( = ?auto_870821 ?auto_870828 ) ) ( not ( = ?auto_870821 ?auto_870829 ) ) ( not ( = ?auto_870821 ?auto_870830 ) ) ( not ( = ?auto_870821 ?auto_870831 ) ) ( not ( = ?auto_870822 ?auto_870823 ) ) ( not ( = ?auto_870822 ?auto_870824 ) ) ( not ( = ?auto_870822 ?auto_870825 ) ) ( not ( = ?auto_870822 ?auto_870826 ) ) ( not ( = ?auto_870822 ?auto_870827 ) ) ( not ( = ?auto_870822 ?auto_870828 ) ) ( not ( = ?auto_870822 ?auto_870829 ) ) ( not ( = ?auto_870822 ?auto_870830 ) ) ( not ( = ?auto_870822 ?auto_870831 ) ) ( not ( = ?auto_870823 ?auto_870824 ) ) ( not ( = ?auto_870823 ?auto_870825 ) ) ( not ( = ?auto_870823 ?auto_870826 ) ) ( not ( = ?auto_870823 ?auto_870827 ) ) ( not ( = ?auto_870823 ?auto_870828 ) ) ( not ( = ?auto_870823 ?auto_870829 ) ) ( not ( = ?auto_870823 ?auto_870830 ) ) ( not ( = ?auto_870823 ?auto_870831 ) ) ( not ( = ?auto_870824 ?auto_870825 ) ) ( not ( = ?auto_870824 ?auto_870826 ) ) ( not ( = ?auto_870824 ?auto_870827 ) ) ( not ( = ?auto_870824 ?auto_870828 ) ) ( not ( = ?auto_870824 ?auto_870829 ) ) ( not ( = ?auto_870824 ?auto_870830 ) ) ( not ( = ?auto_870824 ?auto_870831 ) ) ( not ( = ?auto_870825 ?auto_870826 ) ) ( not ( = ?auto_870825 ?auto_870827 ) ) ( not ( = ?auto_870825 ?auto_870828 ) ) ( not ( = ?auto_870825 ?auto_870829 ) ) ( not ( = ?auto_870825 ?auto_870830 ) ) ( not ( = ?auto_870825 ?auto_870831 ) ) ( not ( = ?auto_870826 ?auto_870827 ) ) ( not ( = ?auto_870826 ?auto_870828 ) ) ( not ( = ?auto_870826 ?auto_870829 ) ) ( not ( = ?auto_870826 ?auto_870830 ) ) ( not ( = ?auto_870826 ?auto_870831 ) ) ( not ( = ?auto_870827 ?auto_870828 ) ) ( not ( = ?auto_870827 ?auto_870829 ) ) ( not ( = ?auto_870827 ?auto_870830 ) ) ( not ( = ?auto_870827 ?auto_870831 ) ) ( not ( = ?auto_870828 ?auto_870829 ) ) ( not ( = ?auto_870828 ?auto_870830 ) ) ( not ( = ?auto_870828 ?auto_870831 ) ) ( not ( = ?auto_870829 ?auto_870830 ) ) ( not ( = ?auto_870829 ?auto_870831 ) ) ( not ( = ?auto_870830 ?auto_870831 ) ) ( ON ?auto_870829 ?auto_870830 ) ( ON ?auto_870828 ?auto_870829 ) ( ON ?auto_870827 ?auto_870828 ) ( ON ?auto_870826 ?auto_870827 ) ( ON ?auto_870825 ?auto_870826 ) ( ON ?auto_870824 ?auto_870825 ) ( CLEAR ?auto_870822 ) ( ON ?auto_870823 ?auto_870824 ) ( CLEAR ?auto_870823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_870813 ?auto_870814 ?auto_870815 ?auto_870816 ?auto_870817 ?auto_870818 ?auto_870819 ?auto_870820 ?auto_870821 ?auto_870822 ?auto_870823 )
      ( MAKE-18PILE ?auto_870813 ?auto_870814 ?auto_870815 ?auto_870816 ?auto_870817 ?auto_870818 ?auto_870819 ?auto_870820 ?auto_870821 ?auto_870822 ?auto_870823 ?auto_870824 ?auto_870825 ?auto_870826 ?auto_870827 ?auto_870828 ?auto_870829 ?auto_870830 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870850 - BLOCK
      ?auto_870851 - BLOCK
      ?auto_870852 - BLOCK
      ?auto_870853 - BLOCK
      ?auto_870854 - BLOCK
      ?auto_870855 - BLOCK
      ?auto_870856 - BLOCK
      ?auto_870857 - BLOCK
      ?auto_870858 - BLOCK
      ?auto_870859 - BLOCK
      ?auto_870860 - BLOCK
      ?auto_870861 - BLOCK
      ?auto_870862 - BLOCK
      ?auto_870863 - BLOCK
      ?auto_870864 - BLOCK
      ?auto_870865 - BLOCK
      ?auto_870866 - BLOCK
      ?auto_870867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870867 ) ( ON-TABLE ?auto_870850 ) ( ON ?auto_870851 ?auto_870850 ) ( ON ?auto_870852 ?auto_870851 ) ( ON ?auto_870853 ?auto_870852 ) ( ON ?auto_870854 ?auto_870853 ) ( ON ?auto_870855 ?auto_870854 ) ( ON ?auto_870856 ?auto_870855 ) ( ON ?auto_870857 ?auto_870856 ) ( ON ?auto_870858 ?auto_870857 ) ( ON ?auto_870859 ?auto_870858 ) ( not ( = ?auto_870850 ?auto_870851 ) ) ( not ( = ?auto_870850 ?auto_870852 ) ) ( not ( = ?auto_870850 ?auto_870853 ) ) ( not ( = ?auto_870850 ?auto_870854 ) ) ( not ( = ?auto_870850 ?auto_870855 ) ) ( not ( = ?auto_870850 ?auto_870856 ) ) ( not ( = ?auto_870850 ?auto_870857 ) ) ( not ( = ?auto_870850 ?auto_870858 ) ) ( not ( = ?auto_870850 ?auto_870859 ) ) ( not ( = ?auto_870850 ?auto_870860 ) ) ( not ( = ?auto_870850 ?auto_870861 ) ) ( not ( = ?auto_870850 ?auto_870862 ) ) ( not ( = ?auto_870850 ?auto_870863 ) ) ( not ( = ?auto_870850 ?auto_870864 ) ) ( not ( = ?auto_870850 ?auto_870865 ) ) ( not ( = ?auto_870850 ?auto_870866 ) ) ( not ( = ?auto_870850 ?auto_870867 ) ) ( not ( = ?auto_870851 ?auto_870852 ) ) ( not ( = ?auto_870851 ?auto_870853 ) ) ( not ( = ?auto_870851 ?auto_870854 ) ) ( not ( = ?auto_870851 ?auto_870855 ) ) ( not ( = ?auto_870851 ?auto_870856 ) ) ( not ( = ?auto_870851 ?auto_870857 ) ) ( not ( = ?auto_870851 ?auto_870858 ) ) ( not ( = ?auto_870851 ?auto_870859 ) ) ( not ( = ?auto_870851 ?auto_870860 ) ) ( not ( = ?auto_870851 ?auto_870861 ) ) ( not ( = ?auto_870851 ?auto_870862 ) ) ( not ( = ?auto_870851 ?auto_870863 ) ) ( not ( = ?auto_870851 ?auto_870864 ) ) ( not ( = ?auto_870851 ?auto_870865 ) ) ( not ( = ?auto_870851 ?auto_870866 ) ) ( not ( = ?auto_870851 ?auto_870867 ) ) ( not ( = ?auto_870852 ?auto_870853 ) ) ( not ( = ?auto_870852 ?auto_870854 ) ) ( not ( = ?auto_870852 ?auto_870855 ) ) ( not ( = ?auto_870852 ?auto_870856 ) ) ( not ( = ?auto_870852 ?auto_870857 ) ) ( not ( = ?auto_870852 ?auto_870858 ) ) ( not ( = ?auto_870852 ?auto_870859 ) ) ( not ( = ?auto_870852 ?auto_870860 ) ) ( not ( = ?auto_870852 ?auto_870861 ) ) ( not ( = ?auto_870852 ?auto_870862 ) ) ( not ( = ?auto_870852 ?auto_870863 ) ) ( not ( = ?auto_870852 ?auto_870864 ) ) ( not ( = ?auto_870852 ?auto_870865 ) ) ( not ( = ?auto_870852 ?auto_870866 ) ) ( not ( = ?auto_870852 ?auto_870867 ) ) ( not ( = ?auto_870853 ?auto_870854 ) ) ( not ( = ?auto_870853 ?auto_870855 ) ) ( not ( = ?auto_870853 ?auto_870856 ) ) ( not ( = ?auto_870853 ?auto_870857 ) ) ( not ( = ?auto_870853 ?auto_870858 ) ) ( not ( = ?auto_870853 ?auto_870859 ) ) ( not ( = ?auto_870853 ?auto_870860 ) ) ( not ( = ?auto_870853 ?auto_870861 ) ) ( not ( = ?auto_870853 ?auto_870862 ) ) ( not ( = ?auto_870853 ?auto_870863 ) ) ( not ( = ?auto_870853 ?auto_870864 ) ) ( not ( = ?auto_870853 ?auto_870865 ) ) ( not ( = ?auto_870853 ?auto_870866 ) ) ( not ( = ?auto_870853 ?auto_870867 ) ) ( not ( = ?auto_870854 ?auto_870855 ) ) ( not ( = ?auto_870854 ?auto_870856 ) ) ( not ( = ?auto_870854 ?auto_870857 ) ) ( not ( = ?auto_870854 ?auto_870858 ) ) ( not ( = ?auto_870854 ?auto_870859 ) ) ( not ( = ?auto_870854 ?auto_870860 ) ) ( not ( = ?auto_870854 ?auto_870861 ) ) ( not ( = ?auto_870854 ?auto_870862 ) ) ( not ( = ?auto_870854 ?auto_870863 ) ) ( not ( = ?auto_870854 ?auto_870864 ) ) ( not ( = ?auto_870854 ?auto_870865 ) ) ( not ( = ?auto_870854 ?auto_870866 ) ) ( not ( = ?auto_870854 ?auto_870867 ) ) ( not ( = ?auto_870855 ?auto_870856 ) ) ( not ( = ?auto_870855 ?auto_870857 ) ) ( not ( = ?auto_870855 ?auto_870858 ) ) ( not ( = ?auto_870855 ?auto_870859 ) ) ( not ( = ?auto_870855 ?auto_870860 ) ) ( not ( = ?auto_870855 ?auto_870861 ) ) ( not ( = ?auto_870855 ?auto_870862 ) ) ( not ( = ?auto_870855 ?auto_870863 ) ) ( not ( = ?auto_870855 ?auto_870864 ) ) ( not ( = ?auto_870855 ?auto_870865 ) ) ( not ( = ?auto_870855 ?auto_870866 ) ) ( not ( = ?auto_870855 ?auto_870867 ) ) ( not ( = ?auto_870856 ?auto_870857 ) ) ( not ( = ?auto_870856 ?auto_870858 ) ) ( not ( = ?auto_870856 ?auto_870859 ) ) ( not ( = ?auto_870856 ?auto_870860 ) ) ( not ( = ?auto_870856 ?auto_870861 ) ) ( not ( = ?auto_870856 ?auto_870862 ) ) ( not ( = ?auto_870856 ?auto_870863 ) ) ( not ( = ?auto_870856 ?auto_870864 ) ) ( not ( = ?auto_870856 ?auto_870865 ) ) ( not ( = ?auto_870856 ?auto_870866 ) ) ( not ( = ?auto_870856 ?auto_870867 ) ) ( not ( = ?auto_870857 ?auto_870858 ) ) ( not ( = ?auto_870857 ?auto_870859 ) ) ( not ( = ?auto_870857 ?auto_870860 ) ) ( not ( = ?auto_870857 ?auto_870861 ) ) ( not ( = ?auto_870857 ?auto_870862 ) ) ( not ( = ?auto_870857 ?auto_870863 ) ) ( not ( = ?auto_870857 ?auto_870864 ) ) ( not ( = ?auto_870857 ?auto_870865 ) ) ( not ( = ?auto_870857 ?auto_870866 ) ) ( not ( = ?auto_870857 ?auto_870867 ) ) ( not ( = ?auto_870858 ?auto_870859 ) ) ( not ( = ?auto_870858 ?auto_870860 ) ) ( not ( = ?auto_870858 ?auto_870861 ) ) ( not ( = ?auto_870858 ?auto_870862 ) ) ( not ( = ?auto_870858 ?auto_870863 ) ) ( not ( = ?auto_870858 ?auto_870864 ) ) ( not ( = ?auto_870858 ?auto_870865 ) ) ( not ( = ?auto_870858 ?auto_870866 ) ) ( not ( = ?auto_870858 ?auto_870867 ) ) ( not ( = ?auto_870859 ?auto_870860 ) ) ( not ( = ?auto_870859 ?auto_870861 ) ) ( not ( = ?auto_870859 ?auto_870862 ) ) ( not ( = ?auto_870859 ?auto_870863 ) ) ( not ( = ?auto_870859 ?auto_870864 ) ) ( not ( = ?auto_870859 ?auto_870865 ) ) ( not ( = ?auto_870859 ?auto_870866 ) ) ( not ( = ?auto_870859 ?auto_870867 ) ) ( not ( = ?auto_870860 ?auto_870861 ) ) ( not ( = ?auto_870860 ?auto_870862 ) ) ( not ( = ?auto_870860 ?auto_870863 ) ) ( not ( = ?auto_870860 ?auto_870864 ) ) ( not ( = ?auto_870860 ?auto_870865 ) ) ( not ( = ?auto_870860 ?auto_870866 ) ) ( not ( = ?auto_870860 ?auto_870867 ) ) ( not ( = ?auto_870861 ?auto_870862 ) ) ( not ( = ?auto_870861 ?auto_870863 ) ) ( not ( = ?auto_870861 ?auto_870864 ) ) ( not ( = ?auto_870861 ?auto_870865 ) ) ( not ( = ?auto_870861 ?auto_870866 ) ) ( not ( = ?auto_870861 ?auto_870867 ) ) ( not ( = ?auto_870862 ?auto_870863 ) ) ( not ( = ?auto_870862 ?auto_870864 ) ) ( not ( = ?auto_870862 ?auto_870865 ) ) ( not ( = ?auto_870862 ?auto_870866 ) ) ( not ( = ?auto_870862 ?auto_870867 ) ) ( not ( = ?auto_870863 ?auto_870864 ) ) ( not ( = ?auto_870863 ?auto_870865 ) ) ( not ( = ?auto_870863 ?auto_870866 ) ) ( not ( = ?auto_870863 ?auto_870867 ) ) ( not ( = ?auto_870864 ?auto_870865 ) ) ( not ( = ?auto_870864 ?auto_870866 ) ) ( not ( = ?auto_870864 ?auto_870867 ) ) ( not ( = ?auto_870865 ?auto_870866 ) ) ( not ( = ?auto_870865 ?auto_870867 ) ) ( not ( = ?auto_870866 ?auto_870867 ) ) ( ON ?auto_870866 ?auto_870867 ) ( ON ?auto_870865 ?auto_870866 ) ( ON ?auto_870864 ?auto_870865 ) ( ON ?auto_870863 ?auto_870864 ) ( ON ?auto_870862 ?auto_870863 ) ( ON ?auto_870861 ?auto_870862 ) ( CLEAR ?auto_870859 ) ( ON ?auto_870860 ?auto_870861 ) ( CLEAR ?auto_870860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_870850 ?auto_870851 ?auto_870852 ?auto_870853 ?auto_870854 ?auto_870855 ?auto_870856 ?auto_870857 ?auto_870858 ?auto_870859 ?auto_870860 )
      ( MAKE-18PILE ?auto_870850 ?auto_870851 ?auto_870852 ?auto_870853 ?auto_870854 ?auto_870855 ?auto_870856 ?auto_870857 ?auto_870858 ?auto_870859 ?auto_870860 ?auto_870861 ?auto_870862 ?auto_870863 ?auto_870864 ?auto_870865 ?auto_870866 ?auto_870867 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870886 - BLOCK
      ?auto_870887 - BLOCK
      ?auto_870888 - BLOCK
      ?auto_870889 - BLOCK
      ?auto_870890 - BLOCK
      ?auto_870891 - BLOCK
      ?auto_870892 - BLOCK
      ?auto_870893 - BLOCK
      ?auto_870894 - BLOCK
      ?auto_870895 - BLOCK
      ?auto_870896 - BLOCK
      ?auto_870897 - BLOCK
      ?auto_870898 - BLOCK
      ?auto_870899 - BLOCK
      ?auto_870900 - BLOCK
      ?auto_870901 - BLOCK
      ?auto_870902 - BLOCK
      ?auto_870903 - BLOCK
    )
    :vars
    (
      ?auto_870904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870903 ?auto_870904 ) ( ON-TABLE ?auto_870886 ) ( ON ?auto_870887 ?auto_870886 ) ( ON ?auto_870888 ?auto_870887 ) ( ON ?auto_870889 ?auto_870888 ) ( ON ?auto_870890 ?auto_870889 ) ( ON ?auto_870891 ?auto_870890 ) ( ON ?auto_870892 ?auto_870891 ) ( ON ?auto_870893 ?auto_870892 ) ( ON ?auto_870894 ?auto_870893 ) ( not ( = ?auto_870886 ?auto_870887 ) ) ( not ( = ?auto_870886 ?auto_870888 ) ) ( not ( = ?auto_870886 ?auto_870889 ) ) ( not ( = ?auto_870886 ?auto_870890 ) ) ( not ( = ?auto_870886 ?auto_870891 ) ) ( not ( = ?auto_870886 ?auto_870892 ) ) ( not ( = ?auto_870886 ?auto_870893 ) ) ( not ( = ?auto_870886 ?auto_870894 ) ) ( not ( = ?auto_870886 ?auto_870895 ) ) ( not ( = ?auto_870886 ?auto_870896 ) ) ( not ( = ?auto_870886 ?auto_870897 ) ) ( not ( = ?auto_870886 ?auto_870898 ) ) ( not ( = ?auto_870886 ?auto_870899 ) ) ( not ( = ?auto_870886 ?auto_870900 ) ) ( not ( = ?auto_870886 ?auto_870901 ) ) ( not ( = ?auto_870886 ?auto_870902 ) ) ( not ( = ?auto_870886 ?auto_870903 ) ) ( not ( = ?auto_870886 ?auto_870904 ) ) ( not ( = ?auto_870887 ?auto_870888 ) ) ( not ( = ?auto_870887 ?auto_870889 ) ) ( not ( = ?auto_870887 ?auto_870890 ) ) ( not ( = ?auto_870887 ?auto_870891 ) ) ( not ( = ?auto_870887 ?auto_870892 ) ) ( not ( = ?auto_870887 ?auto_870893 ) ) ( not ( = ?auto_870887 ?auto_870894 ) ) ( not ( = ?auto_870887 ?auto_870895 ) ) ( not ( = ?auto_870887 ?auto_870896 ) ) ( not ( = ?auto_870887 ?auto_870897 ) ) ( not ( = ?auto_870887 ?auto_870898 ) ) ( not ( = ?auto_870887 ?auto_870899 ) ) ( not ( = ?auto_870887 ?auto_870900 ) ) ( not ( = ?auto_870887 ?auto_870901 ) ) ( not ( = ?auto_870887 ?auto_870902 ) ) ( not ( = ?auto_870887 ?auto_870903 ) ) ( not ( = ?auto_870887 ?auto_870904 ) ) ( not ( = ?auto_870888 ?auto_870889 ) ) ( not ( = ?auto_870888 ?auto_870890 ) ) ( not ( = ?auto_870888 ?auto_870891 ) ) ( not ( = ?auto_870888 ?auto_870892 ) ) ( not ( = ?auto_870888 ?auto_870893 ) ) ( not ( = ?auto_870888 ?auto_870894 ) ) ( not ( = ?auto_870888 ?auto_870895 ) ) ( not ( = ?auto_870888 ?auto_870896 ) ) ( not ( = ?auto_870888 ?auto_870897 ) ) ( not ( = ?auto_870888 ?auto_870898 ) ) ( not ( = ?auto_870888 ?auto_870899 ) ) ( not ( = ?auto_870888 ?auto_870900 ) ) ( not ( = ?auto_870888 ?auto_870901 ) ) ( not ( = ?auto_870888 ?auto_870902 ) ) ( not ( = ?auto_870888 ?auto_870903 ) ) ( not ( = ?auto_870888 ?auto_870904 ) ) ( not ( = ?auto_870889 ?auto_870890 ) ) ( not ( = ?auto_870889 ?auto_870891 ) ) ( not ( = ?auto_870889 ?auto_870892 ) ) ( not ( = ?auto_870889 ?auto_870893 ) ) ( not ( = ?auto_870889 ?auto_870894 ) ) ( not ( = ?auto_870889 ?auto_870895 ) ) ( not ( = ?auto_870889 ?auto_870896 ) ) ( not ( = ?auto_870889 ?auto_870897 ) ) ( not ( = ?auto_870889 ?auto_870898 ) ) ( not ( = ?auto_870889 ?auto_870899 ) ) ( not ( = ?auto_870889 ?auto_870900 ) ) ( not ( = ?auto_870889 ?auto_870901 ) ) ( not ( = ?auto_870889 ?auto_870902 ) ) ( not ( = ?auto_870889 ?auto_870903 ) ) ( not ( = ?auto_870889 ?auto_870904 ) ) ( not ( = ?auto_870890 ?auto_870891 ) ) ( not ( = ?auto_870890 ?auto_870892 ) ) ( not ( = ?auto_870890 ?auto_870893 ) ) ( not ( = ?auto_870890 ?auto_870894 ) ) ( not ( = ?auto_870890 ?auto_870895 ) ) ( not ( = ?auto_870890 ?auto_870896 ) ) ( not ( = ?auto_870890 ?auto_870897 ) ) ( not ( = ?auto_870890 ?auto_870898 ) ) ( not ( = ?auto_870890 ?auto_870899 ) ) ( not ( = ?auto_870890 ?auto_870900 ) ) ( not ( = ?auto_870890 ?auto_870901 ) ) ( not ( = ?auto_870890 ?auto_870902 ) ) ( not ( = ?auto_870890 ?auto_870903 ) ) ( not ( = ?auto_870890 ?auto_870904 ) ) ( not ( = ?auto_870891 ?auto_870892 ) ) ( not ( = ?auto_870891 ?auto_870893 ) ) ( not ( = ?auto_870891 ?auto_870894 ) ) ( not ( = ?auto_870891 ?auto_870895 ) ) ( not ( = ?auto_870891 ?auto_870896 ) ) ( not ( = ?auto_870891 ?auto_870897 ) ) ( not ( = ?auto_870891 ?auto_870898 ) ) ( not ( = ?auto_870891 ?auto_870899 ) ) ( not ( = ?auto_870891 ?auto_870900 ) ) ( not ( = ?auto_870891 ?auto_870901 ) ) ( not ( = ?auto_870891 ?auto_870902 ) ) ( not ( = ?auto_870891 ?auto_870903 ) ) ( not ( = ?auto_870891 ?auto_870904 ) ) ( not ( = ?auto_870892 ?auto_870893 ) ) ( not ( = ?auto_870892 ?auto_870894 ) ) ( not ( = ?auto_870892 ?auto_870895 ) ) ( not ( = ?auto_870892 ?auto_870896 ) ) ( not ( = ?auto_870892 ?auto_870897 ) ) ( not ( = ?auto_870892 ?auto_870898 ) ) ( not ( = ?auto_870892 ?auto_870899 ) ) ( not ( = ?auto_870892 ?auto_870900 ) ) ( not ( = ?auto_870892 ?auto_870901 ) ) ( not ( = ?auto_870892 ?auto_870902 ) ) ( not ( = ?auto_870892 ?auto_870903 ) ) ( not ( = ?auto_870892 ?auto_870904 ) ) ( not ( = ?auto_870893 ?auto_870894 ) ) ( not ( = ?auto_870893 ?auto_870895 ) ) ( not ( = ?auto_870893 ?auto_870896 ) ) ( not ( = ?auto_870893 ?auto_870897 ) ) ( not ( = ?auto_870893 ?auto_870898 ) ) ( not ( = ?auto_870893 ?auto_870899 ) ) ( not ( = ?auto_870893 ?auto_870900 ) ) ( not ( = ?auto_870893 ?auto_870901 ) ) ( not ( = ?auto_870893 ?auto_870902 ) ) ( not ( = ?auto_870893 ?auto_870903 ) ) ( not ( = ?auto_870893 ?auto_870904 ) ) ( not ( = ?auto_870894 ?auto_870895 ) ) ( not ( = ?auto_870894 ?auto_870896 ) ) ( not ( = ?auto_870894 ?auto_870897 ) ) ( not ( = ?auto_870894 ?auto_870898 ) ) ( not ( = ?auto_870894 ?auto_870899 ) ) ( not ( = ?auto_870894 ?auto_870900 ) ) ( not ( = ?auto_870894 ?auto_870901 ) ) ( not ( = ?auto_870894 ?auto_870902 ) ) ( not ( = ?auto_870894 ?auto_870903 ) ) ( not ( = ?auto_870894 ?auto_870904 ) ) ( not ( = ?auto_870895 ?auto_870896 ) ) ( not ( = ?auto_870895 ?auto_870897 ) ) ( not ( = ?auto_870895 ?auto_870898 ) ) ( not ( = ?auto_870895 ?auto_870899 ) ) ( not ( = ?auto_870895 ?auto_870900 ) ) ( not ( = ?auto_870895 ?auto_870901 ) ) ( not ( = ?auto_870895 ?auto_870902 ) ) ( not ( = ?auto_870895 ?auto_870903 ) ) ( not ( = ?auto_870895 ?auto_870904 ) ) ( not ( = ?auto_870896 ?auto_870897 ) ) ( not ( = ?auto_870896 ?auto_870898 ) ) ( not ( = ?auto_870896 ?auto_870899 ) ) ( not ( = ?auto_870896 ?auto_870900 ) ) ( not ( = ?auto_870896 ?auto_870901 ) ) ( not ( = ?auto_870896 ?auto_870902 ) ) ( not ( = ?auto_870896 ?auto_870903 ) ) ( not ( = ?auto_870896 ?auto_870904 ) ) ( not ( = ?auto_870897 ?auto_870898 ) ) ( not ( = ?auto_870897 ?auto_870899 ) ) ( not ( = ?auto_870897 ?auto_870900 ) ) ( not ( = ?auto_870897 ?auto_870901 ) ) ( not ( = ?auto_870897 ?auto_870902 ) ) ( not ( = ?auto_870897 ?auto_870903 ) ) ( not ( = ?auto_870897 ?auto_870904 ) ) ( not ( = ?auto_870898 ?auto_870899 ) ) ( not ( = ?auto_870898 ?auto_870900 ) ) ( not ( = ?auto_870898 ?auto_870901 ) ) ( not ( = ?auto_870898 ?auto_870902 ) ) ( not ( = ?auto_870898 ?auto_870903 ) ) ( not ( = ?auto_870898 ?auto_870904 ) ) ( not ( = ?auto_870899 ?auto_870900 ) ) ( not ( = ?auto_870899 ?auto_870901 ) ) ( not ( = ?auto_870899 ?auto_870902 ) ) ( not ( = ?auto_870899 ?auto_870903 ) ) ( not ( = ?auto_870899 ?auto_870904 ) ) ( not ( = ?auto_870900 ?auto_870901 ) ) ( not ( = ?auto_870900 ?auto_870902 ) ) ( not ( = ?auto_870900 ?auto_870903 ) ) ( not ( = ?auto_870900 ?auto_870904 ) ) ( not ( = ?auto_870901 ?auto_870902 ) ) ( not ( = ?auto_870901 ?auto_870903 ) ) ( not ( = ?auto_870901 ?auto_870904 ) ) ( not ( = ?auto_870902 ?auto_870903 ) ) ( not ( = ?auto_870902 ?auto_870904 ) ) ( not ( = ?auto_870903 ?auto_870904 ) ) ( ON ?auto_870902 ?auto_870903 ) ( ON ?auto_870901 ?auto_870902 ) ( ON ?auto_870900 ?auto_870901 ) ( ON ?auto_870899 ?auto_870900 ) ( ON ?auto_870898 ?auto_870899 ) ( ON ?auto_870897 ?auto_870898 ) ( ON ?auto_870896 ?auto_870897 ) ( CLEAR ?auto_870894 ) ( ON ?auto_870895 ?auto_870896 ) ( CLEAR ?auto_870895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_870886 ?auto_870887 ?auto_870888 ?auto_870889 ?auto_870890 ?auto_870891 ?auto_870892 ?auto_870893 ?auto_870894 ?auto_870895 )
      ( MAKE-18PILE ?auto_870886 ?auto_870887 ?auto_870888 ?auto_870889 ?auto_870890 ?auto_870891 ?auto_870892 ?auto_870893 ?auto_870894 ?auto_870895 ?auto_870896 ?auto_870897 ?auto_870898 ?auto_870899 ?auto_870900 ?auto_870901 ?auto_870902 ?auto_870903 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870923 - BLOCK
      ?auto_870924 - BLOCK
      ?auto_870925 - BLOCK
      ?auto_870926 - BLOCK
      ?auto_870927 - BLOCK
      ?auto_870928 - BLOCK
      ?auto_870929 - BLOCK
      ?auto_870930 - BLOCK
      ?auto_870931 - BLOCK
      ?auto_870932 - BLOCK
      ?auto_870933 - BLOCK
      ?auto_870934 - BLOCK
      ?auto_870935 - BLOCK
      ?auto_870936 - BLOCK
      ?auto_870937 - BLOCK
      ?auto_870938 - BLOCK
      ?auto_870939 - BLOCK
      ?auto_870940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_870940 ) ( ON-TABLE ?auto_870923 ) ( ON ?auto_870924 ?auto_870923 ) ( ON ?auto_870925 ?auto_870924 ) ( ON ?auto_870926 ?auto_870925 ) ( ON ?auto_870927 ?auto_870926 ) ( ON ?auto_870928 ?auto_870927 ) ( ON ?auto_870929 ?auto_870928 ) ( ON ?auto_870930 ?auto_870929 ) ( ON ?auto_870931 ?auto_870930 ) ( not ( = ?auto_870923 ?auto_870924 ) ) ( not ( = ?auto_870923 ?auto_870925 ) ) ( not ( = ?auto_870923 ?auto_870926 ) ) ( not ( = ?auto_870923 ?auto_870927 ) ) ( not ( = ?auto_870923 ?auto_870928 ) ) ( not ( = ?auto_870923 ?auto_870929 ) ) ( not ( = ?auto_870923 ?auto_870930 ) ) ( not ( = ?auto_870923 ?auto_870931 ) ) ( not ( = ?auto_870923 ?auto_870932 ) ) ( not ( = ?auto_870923 ?auto_870933 ) ) ( not ( = ?auto_870923 ?auto_870934 ) ) ( not ( = ?auto_870923 ?auto_870935 ) ) ( not ( = ?auto_870923 ?auto_870936 ) ) ( not ( = ?auto_870923 ?auto_870937 ) ) ( not ( = ?auto_870923 ?auto_870938 ) ) ( not ( = ?auto_870923 ?auto_870939 ) ) ( not ( = ?auto_870923 ?auto_870940 ) ) ( not ( = ?auto_870924 ?auto_870925 ) ) ( not ( = ?auto_870924 ?auto_870926 ) ) ( not ( = ?auto_870924 ?auto_870927 ) ) ( not ( = ?auto_870924 ?auto_870928 ) ) ( not ( = ?auto_870924 ?auto_870929 ) ) ( not ( = ?auto_870924 ?auto_870930 ) ) ( not ( = ?auto_870924 ?auto_870931 ) ) ( not ( = ?auto_870924 ?auto_870932 ) ) ( not ( = ?auto_870924 ?auto_870933 ) ) ( not ( = ?auto_870924 ?auto_870934 ) ) ( not ( = ?auto_870924 ?auto_870935 ) ) ( not ( = ?auto_870924 ?auto_870936 ) ) ( not ( = ?auto_870924 ?auto_870937 ) ) ( not ( = ?auto_870924 ?auto_870938 ) ) ( not ( = ?auto_870924 ?auto_870939 ) ) ( not ( = ?auto_870924 ?auto_870940 ) ) ( not ( = ?auto_870925 ?auto_870926 ) ) ( not ( = ?auto_870925 ?auto_870927 ) ) ( not ( = ?auto_870925 ?auto_870928 ) ) ( not ( = ?auto_870925 ?auto_870929 ) ) ( not ( = ?auto_870925 ?auto_870930 ) ) ( not ( = ?auto_870925 ?auto_870931 ) ) ( not ( = ?auto_870925 ?auto_870932 ) ) ( not ( = ?auto_870925 ?auto_870933 ) ) ( not ( = ?auto_870925 ?auto_870934 ) ) ( not ( = ?auto_870925 ?auto_870935 ) ) ( not ( = ?auto_870925 ?auto_870936 ) ) ( not ( = ?auto_870925 ?auto_870937 ) ) ( not ( = ?auto_870925 ?auto_870938 ) ) ( not ( = ?auto_870925 ?auto_870939 ) ) ( not ( = ?auto_870925 ?auto_870940 ) ) ( not ( = ?auto_870926 ?auto_870927 ) ) ( not ( = ?auto_870926 ?auto_870928 ) ) ( not ( = ?auto_870926 ?auto_870929 ) ) ( not ( = ?auto_870926 ?auto_870930 ) ) ( not ( = ?auto_870926 ?auto_870931 ) ) ( not ( = ?auto_870926 ?auto_870932 ) ) ( not ( = ?auto_870926 ?auto_870933 ) ) ( not ( = ?auto_870926 ?auto_870934 ) ) ( not ( = ?auto_870926 ?auto_870935 ) ) ( not ( = ?auto_870926 ?auto_870936 ) ) ( not ( = ?auto_870926 ?auto_870937 ) ) ( not ( = ?auto_870926 ?auto_870938 ) ) ( not ( = ?auto_870926 ?auto_870939 ) ) ( not ( = ?auto_870926 ?auto_870940 ) ) ( not ( = ?auto_870927 ?auto_870928 ) ) ( not ( = ?auto_870927 ?auto_870929 ) ) ( not ( = ?auto_870927 ?auto_870930 ) ) ( not ( = ?auto_870927 ?auto_870931 ) ) ( not ( = ?auto_870927 ?auto_870932 ) ) ( not ( = ?auto_870927 ?auto_870933 ) ) ( not ( = ?auto_870927 ?auto_870934 ) ) ( not ( = ?auto_870927 ?auto_870935 ) ) ( not ( = ?auto_870927 ?auto_870936 ) ) ( not ( = ?auto_870927 ?auto_870937 ) ) ( not ( = ?auto_870927 ?auto_870938 ) ) ( not ( = ?auto_870927 ?auto_870939 ) ) ( not ( = ?auto_870927 ?auto_870940 ) ) ( not ( = ?auto_870928 ?auto_870929 ) ) ( not ( = ?auto_870928 ?auto_870930 ) ) ( not ( = ?auto_870928 ?auto_870931 ) ) ( not ( = ?auto_870928 ?auto_870932 ) ) ( not ( = ?auto_870928 ?auto_870933 ) ) ( not ( = ?auto_870928 ?auto_870934 ) ) ( not ( = ?auto_870928 ?auto_870935 ) ) ( not ( = ?auto_870928 ?auto_870936 ) ) ( not ( = ?auto_870928 ?auto_870937 ) ) ( not ( = ?auto_870928 ?auto_870938 ) ) ( not ( = ?auto_870928 ?auto_870939 ) ) ( not ( = ?auto_870928 ?auto_870940 ) ) ( not ( = ?auto_870929 ?auto_870930 ) ) ( not ( = ?auto_870929 ?auto_870931 ) ) ( not ( = ?auto_870929 ?auto_870932 ) ) ( not ( = ?auto_870929 ?auto_870933 ) ) ( not ( = ?auto_870929 ?auto_870934 ) ) ( not ( = ?auto_870929 ?auto_870935 ) ) ( not ( = ?auto_870929 ?auto_870936 ) ) ( not ( = ?auto_870929 ?auto_870937 ) ) ( not ( = ?auto_870929 ?auto_870938 ) ) ( not ( = ?auto_870929 ?auto_870939 ) ) ( not ( = ?auto_870929 ?auto_870940 ) ) ( not ( = ?auto_870930 ?auto_870931 ) ) ( not ( = ?auto_870930 ?auto_870932 ) ) ( not ( = ?auto_870930 ?auto_870933 ) ) ( not ( = ?auto_870930 ?auto_870934 ) ) ( not ( = ?auto_870930 ?auto_870935 ) ) ( not ( = ?auto_870930 ?auto_870936 ) ) ( not ( = ?auto_870930 ?auto_870937 ) ) ( not ( = ?auto_870930 ?auto_870938 ) ) ( not ( = ?auto_870930 ?auto_870939 ) ) ( not ( = ?auto_870930 ?auto_870940 ) ) ( not ( = ?auto_870931 ?auto_870932 ) ) ( not ( = ?auto_870931 ?auto_870933 ) ) ( not ( = ?auto_870931 ?auto_870934 ) ) ( not ( = ?auto_870931 ?auto_870935 ) ) ( not ( = ?auto_870931 ?auto_870936 ) ) ( not ( = ?auto_870931 ?auto_870937 ) ) ( not ( = ?auto_870931 ?auto_870938 ) ) ( not ( = ?auto_870931 ?auto_870939 ) ) ( not ( = ?auto_870931 ?auto_870940 ) ) ( not ( = ?auto_870932 ?auto_870933 ) ) ( not ( = ?auto_870932 ?auto_870934 ) ) ( not ( = ?auto_870932 ?auto_870935 ) ) ( not ( = ?auto_870932 ?auto_870936 ) ) ( not ( = ?auto_870932 ?auto_870937 ) ) ( not ( = ?auto_870932 ?auto_870938 ) ) ( not ( = ?auto_870932 ?auto_870939 ) ) ( not ( = ?auto_870932 ?auto_870940 ) ) ( not ( = ?auto_870933 ?auto_870934 ) ) ( not ( = ?auto_870933 ?auto_870935 ) ) ( not ( = ?auto_870933 ?auto_870936 ) ) ( not ( = ?auto_870933 ?auto_870937 ) ) ( not ( = ?auto_870933 ?auto_870938 ) ) ( not ( = ?auto_870933 ?auto_870939 ) ) ( not ( = ?auto_870933 ?auto_870940 ) ) ( not ( = ?auto_870934 ?auto_870935 ) ) ( not ( = ?auto_870934 ?auto_870936 ) ) ( not ( = ?auto_870934 ?auto_870937 ) ) ( not ( = ?auto_870934 ?auto_870938 ) ) ( not ( = ?auto_870934 ?auto_870939 ) ) ( not ( = ?auto_870934 ?auto_870940 ) ) ( not ( = ?auto_870935 ?auto_870936 ) ) ( not ( = ?auto_870935 ?auto_870937 ) ) ( not ( = ?auto_870935 ?auto_870938 ) ) ( not ( = ?auto_870935 ?auto_870939 ) ) ( not ( = ?auto_870935 ?auto_870940 ) ) ( not ( = ?auto_870936 ?auto_870937 ) ) ( not ( = ?auto_870936 ?auto_870938 ) ) ( not ( = ?auto_870936 ?auto_870939 ) ) ( not ( = ?auto_870936 ?auto_870940 ) ) ( not ( = ?auto_870937 ?auto_870938 ) ) ( not ( = ?auto_870937 ?auto_870939 ) ) ( not ( = ?auto_870937 ?auto_870940 ) ) ( not ( = ?auto_870938 ?auto_870939 ) ) ( not ( = ?auto_870938 ?auto_870940 ) ) ( not ( = ?auto_870939 ?auto_870940 ) ) ( ON ?auto_870939 ?auto_870940 ) ( ON ?auto_870938 ?auto_870939 ) ( ON ?auto_870937 ?auto_870938 ) ( ON ?auto_870936 ?auto_870937 ) ( ON ?auto_870935 ?auto_870936 ) ( ON ?auto_870934 ?auto_870935 ) ( ON ?auto_870933 ?auto_870934 ) ( CLEAR ?auto_870931 ) ( ON ?auto_870932 ?auto_870933 ) ( CLEAR ?auto_870932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_870923 ?auto_870924 ?auto_870925 ?auto_870926 ?auto_870927 ?auto_870928 ?auto_870929 ?auto_870930 ?auto_870931 ?auto_870932 )
      ( MAKE-18PILE ?auto_870923 ?auto_870924 ?auto_870925 ?auto_870926 ?auto_870927 ?auto_870928 ?auto_870929 ?auto_870930 ?auto_870931 ?auto_870932 ?auto_870933 ?auto_870934 ?auto_870935 ?auto_870936 ?auto_870937 ?auto_870938 ?auto_870939 ?auto_870940 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870959 - BLOCK
      ?auto_870960 - BLOCK
      ?auto_870961 - BLOCK
      ?auto_870962 - BLOCK
      ?auto_870963 - BLOCK
      ?auto_870964 - BLOCK
      ?auto_870965 - BLOCK
      ?auto_870966 - BLOCK
      ?auto_870967 - BLOCK
      ?auto_870968 - BLOCK
      ?auto_870969 - BLOCK
      ?auto_870970 - BLOCK
      ?auto_870971 - BLOCK
      ?auto_870972 - BLOCK
      ?auto_870973 - BLOCK
      ?auto_870974 - BLOCK
      ?auto_870975 - BLOCK
      ?auto_870976 - BLOCK
    )
    :vars
    (
      ?auto_870977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_870976 ?auto_870977 ) ( ON-TABLE ?auto_870959 ) ( ON ?auto_870960 ?auto_870959 ) ( ON ?auto_870961 ?auto_870960 ) ( ON ?auto_870962 ?auto_870961 ) ( ON ?auto_870963 ?auto_870962 ) ( ON ?auto_870964 ?auto_870963 ) ( ON ?auto_870965 ?auto_870964 ) ( ON ?auto_870966 ?auto_870965 ) ( not ( = ?auto_870959 ?auto_870960 ) ) ( not ( = ?auto_870959 ?auto_870961 ) ) ( not ( = ?auto_870959 ?auto_870962 ) ) ( not ( = ?auto_870959 ?auto_870963 ) ) ( not ( = ?auto_870959 ?auto_870964 ) ) ( not ( = ?auto_870959 ?auto_870965 ) ) ( not ( = ?auto_870959 ?auto_870966 ) ) ( not ( = ?auto_870959 ?auto_870967 ) ) ( not ( = ?auto_870959 ?auto_870968 ) ) ( not ( = ?auto_870959 ?auto_870969 ) ) ( not ( = ?auto_870959 ?auto_870970 ) ) ( not ( = ?auto_870959 ?auto_870971 ) ) ( not ( = ?auto_870959 ?auto_870972 ) ) ( not ( = ?auto_870959 ?auto_870973 ) ) ( not ( = ?auto_870959 ?auto_870974 ) ) ( not ( = ?auto_870959 ?auto_870975 ) ) ( not ( = ?auto_870959 ?auto_870976 ) ) ( not ( = ?auto_870959 ?auto_870977 ) ) ( not ( = ?auto_870960 ?auto_870961 ) ) ( not ( = ?auto_870960 ?auto_870962 ) ) ( not ( = ?auto_870960 ?auto_870963 ) ) ( not ( = ?auto_870960 ?auto_870964 ) ) ( not ( = ?auto_870960 ?auto_870965 ) ) ( not ( = ?auto_870960 ?auto_870966 ) ) ( not ( = ?auto_870960 ?auto_870967 ) ) ( not ( = ?auto_870960 ?auto_870968 ) ) ( not ( = ?auto_870960 ?auto_870969 ) ) ( not ( = ?auto_870960 ?auto_870970 ) ) ( not ( = ?auto_870960 ?auto_870971 ) ) ( not ( = ?auto_870960 ?auto_870972 ) ) ( not ( = ?auto_870960 ?auto_870973 ) ) ( not ( = ?auto_870960 ?auto_870974 ) ) ( not ( = ?auto_870960 ?auto_870975 ) ) ( not ( = ?auto_870960 ?auto_870976 ) ) ( not ( = ?auto_870960 ?auto_870977 ) ) ( not ( = ?auto_870961 ?auto_870962 ) ) ( not ( = ?auto_870961 ?auto_870963 ) ) ( not ( = ?auto_870961 ?auto_870964 ) ) ( not ( = ?auto_870961 ?auto_870965 ) ) ( not ( = ?auto_870961 ?auto_870966 ) ) ( not ( = ?auto_870961 ?auto_870967 ) ) ( not ( = ?auto_870961 ?auto_870968 ) ) ( not ( = ?auto_870961 ?auto_870969 ) ) ( not ( = ?auto_870961 ?auto_870970 ) ) ( not ( = ?auto_870961 ?auto_870971 ) ) ( not ( = ?auto_870961 ?auto_870972 ) ) ( not ( = ?auto_870961 ?auto_870973 ) ) ( not ( = ?auto_870961 ?auto_870974 ) ) ( not ( = ?auto_870961 ?auto_870975 ) ) ( not ( = ?auto_870961 ?auto_870976 ) ) ( not ( = ?auto_870961 ?auto_870977 ) ) ( not ( = ?auto_870962 ?auto_870963 ) ) ( not ( = ?auto_870962 ?auto_870964 ) ) ( not ( = ?auto_870962 ?auto_870965 ) ) ( not ( = ?auto_870962 ?auto_870966 ) ) ( not ( = ?auto_870962 ?auto_870967 ) ) ( not ( = ?auto_870962 ?auto_870968 ) ) ( not ( = ?auto_870962 ?auto_870969 ) ) ( not ( = ?auto_870962 ?auto_870970 ) ) ( not ( = ?auto_870962 ?auto_870971 ) ) ( not ( = ?auto_870962 ?auto_870972 ) ) ( not ( = ?auto_870962 ?auto_870973 ) ) ( not ( = ?auto_870962 ?auto_870974 ) ) ( not ( = ?auto_870962 ?auto_870975 ) ) ( not ( = ?auto_870962 ?auto_870976 ) ) ( not ( = ?auto_870962 ?auto_870977 ) ) ( not ( = ?auto_870963 ?auto_870964 ) ) ( not ( = ?auto_870963 ?auto_870965 ) ) ( not ( = ?auto_870963 ?auto_870966 ) ) ( not ( = ?auto_870963 ?auto_870967 ) ) ( not ( = ?auto_870963 ?auto_870968 ) ) ( not ( = ?auto_870963 ?auto_870969 ) ) ( not ( = ?auto_870963 ?auto_870970 ) ) ( not ( = ?auto_870963 ?auto_870971 ) ) ( not ( = ?auto_870963 ?auto_870972 ) ) ( not ( = ?auto_870963 ?auto_870973 ) ) ( not ( = ?auto_870963 ?auto_870974 ) ) ( not ( = ?auto_870963 ?auto_870975 ) ) ( not ( = ?auto_870963 ?auto_870976 ) ) ( not ( = ?auto_870963 ?auto_870977 ) ) ( not ( = ?auto_870964 ?auto_870965 ) ) ( not ( = ?auto_870964 ?auto_870966 ) ) ( not ( = ?auto_870964 ?auto_870967 ) ) ( not ( = ?auto_870964 ?auto_870968 ) ) ( not ( = ?auto_870964 ?auto_870969 ) ) ( not ( = ?auto_870964 ?auto_870970 ) ) ( not ( = ?auto_870964 ?auto_870971 ) ) ( not ( = ?auto_870964 ?auto_870972 ) ) ( not ( = ?auto_870964 ?auto_870973 ) ) ( not ( = ?auto_870964 ?auto_870974 ) ) ( not ( = ?auto_870964 ?auto_870975 ) ) ( not ( = ?auto_870964 ?auto_870976 ) ) ( not ( = ?auto_870964 ?auto_870977 ) ) ( not ( = ?auto_870965 ?auto_870966 ) ) ( not ( = ?auto_870965 ?auto_870967 ) ) ( not ( = ?auto_870965 ?auto_870968 ) ) ( not ( = ?auto_870965 ?auto_870969 ) ) ( not ( = ?auto_870965 ?auto_870970 ) ) ( not ( = ?auto_870965 ?auto_870971 ) ) ( not ( = ?auto_870965 ?auto_870972 ) ) ( not ( = ?auto_870965 ?auto_870973 ) ) ( not ( = ?auto_870965 ?auto_870974 ) ) ( not ( = ?auto_870965 ?auto_870975 ) ) ( not ( = ?auto_870965 ?auto_870976 ) ) ( not ( = ?auto_870965 ?auto_870977 ) ) ( not ( = ?auto_870966 ?auto_870967 ) ) ( not ( = ?auto_870966 ?auto_870968 ) ) ( not ( = ?auto_870966 ?auto_870969 ) ) ( not ( = ?auto_870966 ?auto_870970 ) ) ( not ( = ?auto_870966 ?auto_870971 ) ) ( not ( = ?auto_870966 ?auto_870972 ) ) ( not ( = ?auto_870966 ?auto_870973 ) ) ( not ( = ?auto_870966 ?auto_870974 ) ) ( not ( = ?auto_870966 ?auto_870975 ) ) ( not ( = ?auto_870966 ?auto_870976 ) ) ( not ( = ?auto_870966 ?auto_870977 ) ) ( not ( = ?auto_870967 ?auto_870968 ) ) ( not ( = ?auto_870967 ?auto_870969 ) ) ( not ( = ?auto_870967 ?auto_870970 ) ) ( not ( = ?auto_870967 ?auto_870971 ) ) ( not ( = ?auto_870967 ?auto_870972 ) ) ( not ( = ?auto_870967 ?auto_870973 ) ) ( not ( = ?auto_870967 ?auto_870974 ) ) ( not ( = ?auto_870967 ?auto_870975 ) ) ( not ( = ?auto_870967 ?auto_870976 ) ) ( not ( = ?auto_870967 ?auto_870977 ) ) ( not ( = ?auto_870968 ?auto_870969 ) ) ( not ( = ?auto_870968 ?auto_870970 ) ) ( not ( = ?auto_870968 ?auto_870971 ) ) ( not ( = ?auto_870968 ?auto_870972 ) ) ( not ( = ?auto_870968 ?auto_870973 ) ) ( not ( = ?auto_870968 ?auto_870974 ) ) ( not ( = ?auto_870968 ?auto_870975 ) ) ( not ( = ?auto_870968 ?auto_870976 ) ) ( not ( = ?auto_870968 ?auto_870977 ) ) ( not ( = ?auto_870969 ?auto_870970 ) ) ( not ( = ?auto_870969 ?auto_870971 ) ) ( not ( = ?auto_870969 ?auto_870972 ) ) ( not ( = ?auto_870969 ?auto_870973 ) ) ( not ( = ?auto_870969 ?auto_870974 ) ) ( not ( = ?auto_870969 ?auto_870975 ) ) ( not ( = ?auto_870969 ?auto_870976 ) ) ( not ( = ?auto_870969 ?auto_870977 ) ) ( not ( = ?auto_870970 ?auto_870971 ) ) ( not ( = ?auto_870970 ?auto_870972 ) ) ( not ( = ?auto_870970 ?auto_870973 ) ) ( not ( = ?auto_870970 ?auto_870974 ) ) ( not ( = ?auto_870970 ?auto_870975 ) ) ( not ( = ?auto_870970 ?auto_870976 ) ) ( not ( = ?auto_870970 ?auto_870977 ) ) ( not ( = ?auto_870971 ?auto_870972 ) ) ( not ( = ?auto_870971 ?auto_870973 ) ) ( not ( = ?auto_870971 ?auto_870974 ) ) ( not ( = ?auto_870971 ?auto_870975 ) ) ( not ( = ?auto_870971 ?auto_870976 ) ) ( not ( = ?auto_870971 ?auto_870977 ) ) ( not ( = ?auto_870972 ?auto_870973 ) ) ( not ( = ?auto_870972 ?auto_870974 ) ) ( not ( = ?auto_870972 ?auto_870975 ) ) ( not ( = ?auto_870972 ?auto_870976 ) ) ( not ( = ?auto_870972 ?auto_870977 ) ) ( not ( = ?auto_870973 ?auto_870974 ) ) ( not ( = ?auto_870973 ?auto_870975 ) ) ( not ( = ?auto_870973 ?auto_870976 ) ) ( not ( = ?auto_870973 ?auto_870977 ) ) ( not ( = ?auto_870974 ?auto_870975 ) ) ( not ( = ?auto_870974 ?auto_870976 ) ) ( not ( = ?auto_870974 ?auto_870977 ) ) ( not ( = ?auto_870975 ?auto_870976 ) ) ( not ( = ?auto_870975 ?auto_870977 ) ) ( not ( = ?auto_870976 ?auto_870977 ) ) ( ON ?auto_870975 ?auto_870976 ) ( ON ?auto_870974 ?auto_870975 ) ( ON ?auto_870973 ?auto_870974 ) ( ON ?auto_870972 ?auto_870973 ) ( ON ?auto_870971 ?auto_870972 ) ( ON ?auto_870970 ?auto_870971 ) ( ON ?auto_870969 ?auto_870970 ) ( ON ?auto_870968 ?auto_870969 ) ( CLEAR ?auto_870966 ) ( ON ?auto_870967 ?auto_870968 ) ( CLEAR ?auto_870967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_870959 ?auto_870960 ?auto_870961 ?auto_870962 ?auto_870963 ?auto_870964 ?auto_870965 ?auto_870966 ?auto_870967 )
      ( MAKE-18PILE ?auto_870959 ?auto_870960 ?auto_870961 ?auto_870962 ?auto_870963 ?auto_870964 ?auto_870965 ?auto_870966 ?auto_870967 ?auto_870968 ?auto_870969 ?auto_870970 ?auto_870971 ?auto_870972 ?auto_870973 ?auto_870974 ?auto_870975 ?auto_870976 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_870996 - BLOCK
      ?auto_870997 - BLOCK
      ?auto_870998 - BLOCK
      ?auto_870999 - BLOCK
      ?auto_871000 - BLOCK
      ?auto_871001 - BLOCK
      ?auto_871002 - BLOCK
      ?auto_871003 - BLOCK
      ?auto_871004 - BLOCK
      ?auto_871005 - BLOCK
      ?auto_871006 - BLOCK
      ?auto_871007 - BLOCK
      ?auto_871008 - BLOCK
      ?auto_871009 - BLOCK
      ?auto_871010 - BLOCK
      ?auto_871011 - BLOCK
      ?auto_871012 - BLOCK
      ?auto_871013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871013 ) ( ON-TABLE ?auto_870996 ) ( ON ?auto_870997 ?auto_870996 ) ( ON ?auto_870998 ?auto_870997 ) ( ON ?auto_870999 ?auto_870998 ) ( ON ?auto_871000 ?auto_870999 ) ( ON ?auto_871001 ?auto_871000 ) ( ON ?auto_871002 ?auto_871001 ) ( ON ?auto_871003 ?auto_871002 ) ( not ( = ?auto_870996 ?auto_870997 ) ) ( not ( = ?auto_870996 ?auto_870998 ) ) ( not ( = ?auto_870996 ?auto_870999 ) ) ( not ( = ?auto_870996 ?auto_871000 ) ) ( not ( = ?auto_870996 ?auto_871001 ) ) ( not ( = ?auto_870996 ?auto_871002 ) ) ( not ( = ?auto_870996 ?auto_871003 ) ) ( not ( = ?auto_870996 ?auto_871004 ) ) ( not ( = ?auto_870996 ?auto_871005 ) ) ( not ( = ?auto_870996 ?auto_871006 ) ) ( not ( = ?auto_870996 ?auto_871007 ) ) ( not ( = ?auto_870996 ?auto_871008 ) ) ( not ( = ?auto_870996 ?auto_871009 ) ) ( not ( = ?auto_870996 ?auto_871010 ) ) ( not ( = ?auto_870996 ?auto_871011 ) ) ( not ( = ?auto_870996 ?auto_871012 ) ) ( not ( = ?auto_870996 ?auto_871013 ) ) ( not ( = ?auto_870997 ?auto_870998 ) ) ( not ( = ?auto_870997 ?auto_870999 ) ) ( not ( = ?auto_870997 ?auto_871000 ) ) ( not ( = ?auto_870997 ?auto_871001 ) ) ( not ( = ?auto_870997 ?auto_871002 ) ) ( not ( = ?auto_870997 ?auto_871003 ) ) ( not ( = ?auto_870997 ?auto_871004 ) ) ( not ( = ?auto_870997 ?auto_871005 ) ) ( not ( = ?auto_870997 ?auto_871006 ) ) ( not ( = ?auto_870997 ?auto_871007 ) ) ( not ( = ?auto_870997 ?auto_871008 ) ) ( not ( = ?auto_870997 ?auto_871009 ) ) ( not ( = ?auto_870997 ?auto_871010 ) ) ( not ( = ?auto_870997 ?auto_871011 ) ) ( not ( = ?auto_870997 ?auto_871012 ) ) ( not ( = ?auto_870997 ?auto_871013 ) ) ( not ( = ?auto_870998 ?auto_870999 ) ) ( not ( = ?auto_870998 ?auto_871000 ) ) ( not ( = ?auto_870998 ?auto_871001 ) ) ( not ( = ?auto_870998 ?auto_871002 ) ) ( not ( = ?auto_870998 ?auto_871003 ) ) ( not ( = ?auto_870998 ?auto_871004 ) ) ( not ( = ?auto_870998 ?auto_871005 ) ) ( not ( = ?auto_870998 ?auto_871006 ) ) ( not ( = ?auto_870998 ?auto_871007 ) ) ( not ( = ?auto_870998 ?auto_871008 ) ) ( not ( = ?auto_870998 ?auto_871009 ) ) ( not ( = ?auto_870998 ?auto_871010 ) ) ( not ( = ?auto_870998 ?auto_871011 ) ) ( not ( = ?auto_870998 ?auto_871012 ) ) ( not ( = ?auto_870998 ?auto_871013 ) ) ( not ( = ?auto_870999 ?auto_871000 ) ) ( not ( = ?auto_870999 ?auto_871001 ) ) ( not ( = ?auto_870999 ?auto_871002 ) ) ( not ( = ?auto_870999 ?auto_871003 ) ) ( not ( = ?auto_870999 ?auto_871004 ) ) ( not ( = ?auto_870999 ?auto_871005 ) ) ( not ( = ?auto_870999 ?auto_871006 ) ) ( not ( = ?auto_870999 ?auto_871007 ) ) ( not ( = ?auto_870999 ?auto_871008 ) ) ( not ( = ?auto_870999 ?auto_871009 ) ) ( not ( = ?auto_870999 ?auto_871010 ) ) ( not ( = ?auto_870999 ?auto_871011 ) ) ( not ( = ?auto_870999 ?auto_871012 ) ) ( not ( = ?auto_870999 ?auto_871013 ) ) ( not ( = ?auto_871000 ?auto_871001 ) ) ( not ( = ?auto_871000 ?auto_871002 ) ) ( not ( = ?auto_871000 ?auto_871003 ) ) ( not ( = ?auto_871000 ?auto_871004 ) ) ( not ( = ?auto_871000 ?auto_871005 ) ) ( not ( = ?auto_871000 ?auto_871006 ) ) ( not ( = ?auto_871000 ?auto_871007 ) ) ( not ( = ?auto_871000 ?auto_871008 ) ) ( not ( = ?auto_871000 ?auto_871009 ) ) ( not ( = ?auto_871000 ?auto_871010 ) ) ( not ( = ?auto_871000 ?auto_871011 ) ) ( not ( = ?auto_871000 ?auto_871012 ) ) ( not ( = ?auto_871000 ?auto_871013 ) ) ( not ( = ?auto_871001 ?auto_871002 ) ) ( not ( = ?auto_871001 ?auto_871003 ) ) ( not ( = ?auto_871001 ?auto_871004 ) ) ( not ( = ?auto_871001 ?auto_871005 ) ) ( not ( = ?auto_871001 ?auto_871006 ) ) ( not ( = ?auto_871001 ?auto_871007 ) ) ( not ( = ?auto_871001 ?auto_871008 ) ) ( not ( = ?auto_871001 ?auto_871009 ) ) ( not ( = ?auto_871001 ?auto_871010 ) ) ( not ( = ?auto_871001 ?auto_871011 ) ) ( not ( = ?auto_871001 ?auto_871012 ) ) ( not ( = ?auto_871001 ?auto_871013 ) ) ( not ( = ?auto_871002 ?auto_871003 ) ) ( not ( = ?auto_871002 ?auto_871004 ) ) ( not ( = ?auto_871002 ?auto_871005 ) ) ( not ( = ?auto_871002 ?auto_871006 ) ) ( not ( = ?auto_871002 ?auto_871007 ) ) ( not ( = ?auto_871002 ?auto_871008 ) ) ( not ( = ?auto_871002 ?auto_871009 ) ) ( not ( = ?auto_871002 ?auto_871010 ) ) ( not ( = ?auto_871002 ?auto_871011 ) ) ( not ( = ?auto_871002 ?auto_871012 ) ) ( not ( = ?auto_871002 ?auto_871013 ) ) ( not ( = ?auto_871003 ?auto_871004 ) ) ( not ( = ?auto_871003 ?auto_871005 ) ) ( not ( = ?auto_871003 ?auto_871006 ) ) ( not ( = ?auto_871003 ?auto_871007 ) ) ( not ( = ?auto_871003 ?auto_871008 ) ) ( not ( = ?auto_871003 ?auto_871009 ) ) ( not ( = ?auto_871003 ?auto_871010 ) ) ( not ( = ?auto_871003 ?auto_871011 ) ) ( not ( = ?auto_871003 ?auto_871012 ) ) ( not ( = ?auto_871003 ?auto_871013 ) ) ( not ( = ?auto_871004 ?auto_871005 ) ) ( not ( = ?auto_871004 ?auto_871006 ) ) ( not ( = ?auto_871004 ?auto_871007 ) ) ( not ( = ?auto_871004 ?auto_871008 ) ) ( not ( = ?auto_871004 ?auto_871009 ) ) ( not ( = ?auto_871004 ?auto_871010 ) ) ( not ( = ?auto_871004 ?auto_871011 ) ) ( not ( = ?auto_871004 ?auto_871012 ) ) ( not ( = ?auto_871004 ?auto_871013 ) ) ( not ( = ?auto_871005 ?auto_871006 ) ) ( not ( = ?auto_871005 ?auto_871007 ) ) ( not ( = ?auto_871005 ?auto_871008 ) ) ( not ( = ?auto_871005 ?auto_871009 ) ) ( not ( = ?auto_871005 ?auto_871010 ) ) ( not ( = ?auto_871005 ?auto_871011 ) ) ( not ( = ?auto_871005 ?auto_871012 ) ) ( not ( = ?auto_871005 ?auto_871013 ) ) ( not ( = ?auto_871006 ?auto_871007 ) ) ( not ( = ?auto_871006 ?auto_871008 ) ) ( not ( = ?auto_871006 ?auto_871009 ) ) ( not ( = ?auto_871006 ?auto_871010 ) ) ( not ( = ?auto_871006 ?auto_871011 ) ) ( not ( = ?auto_871006 ?auto_871012 ) ) ( not ( = ?auto_871006 ?auto_871013 ) ) ( not ( = ?auto_871007 ?auto_871008 ) ) ( not ( = ?auto_871007 ?auto_871009 ) ) ( not ( = ?auto_871007 ?auto_871010 ) ) ( not ( = ?auto_871007 ?auto_871011 ) ) ( not ( = ?auto_871007 ?auto_871012 ) ) ( not ( = ?auto_871007 ?auto_871013 ) ) ( not ( = ?auto_871008 ?auto_871009 ) ) ( not ( = ?auto_871008 ?auto_871010 ) ) ( not ( = ?auto_871008 ?auto_871011 ) ) ( not ( = ?auto_871008 ?auto_871012 ) ) ( not ( = ?auto_871008 ?auto_871013 ) ) ( not ( = ?auto_871009 ?auto_871010 ) ) ( not ( = ?auto_871009 ?auto_871011 ) ) ( not ( = ?auto_871009 ?auto_871012 ) ) ( not ( = ?auto_871009 ?auto_871013 ) ) ( not ( = ?auto_871010 ?auto_871011 ) ) ( not ( = ?auto_871010 ?auto_871012 ) ) ( not ( = ?auto_871010 ?auto_871013 ) ) ( not ( = ?auto_871011 ?auto_871012 ) ) ( not ( = ?auto_871011 ?auto_871013 ) ) ( not ( = ?auto_871012 ?auto_871013 ) ) ( ON ?auto_871012 ?auto_871013 ) ( ON ?auto_871011 ?auto_871012 ) ( ON ?auto_871010 ?auto_871011 ) ( ON ?auto_871009 ?auto_871010 ) ( ON ?auto_871008 ?auto_871009 ) ( ON ?auto_871007 ?auto_871008 ) ( ON ?auto_871006 ?auto_871007 ) ( ON ?auto_871005 ?auto_871006 ) ( CLEAR ?auto_871003 ) ( ON ?auto_871004 ?auto_871005 ) ( CLEAR ?auto_871004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_870996 ?auto_870997 ?auto_870998 ?auto_870999 ?auto_871000 ?auto_871001 ?auto_871002 ?auto_871003 ?auto_871004 )
      ( MAKE-18PILE ?auto_870996 ?auto_870997 ?auto_870998 ?auto_870999 ?auto_871000 ?auto_871001 ?auto_871002 ?auto_871003 ?auto_871004 ?auto_871005 ?auto_871006 ?auto_871007 ?auto_871008 ?auto_871009 ?auto_871010 ?auto_871011 ?auto_871012 ?auto_871013 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871032 - BLOCK
      ?auto_871033 - BLOCK
      ?auto_871034 - BLOCK
      ?auto_871035 - BLOCK
      ?auto_871036 - BLOCK
      ?auto_871037 - BLOCK
      ?auto_871038 - BLOCK
      ?auto_871039 - BLOCK
      ?auto_871040 - BLOCK
      ?auto_871041 - BLOCK
      ?auto_871042 - BLOCK
      ?auto_871043 - BLOCK
      ?auto_871044 - BLOCK
      ?auto_871045 - BLOCK
      ?auto_871046 - BLOCK
      ?auto_871047 - BLOCK
      ?auto_871048 - BLOCK
      ?auto_871049 - BLOCK
    )
    :vars
    (
      ?auto_871050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871049 ?auto_871050 ) ( ON-TABLE ?auto_871032 ) ( ON ?auto_871033 ?auto_871032 ) ( ON ?auto_871034 ?auto_871033 ) ( ON ?auto_871035 ?auto_871034 ) ( ON ?auto_871036 ?auto_871035 ) ( ON ?auto_871037 ?auto_871036 ) ( ON ?auto_871038 ?auto_871037 ) ( not ( = ?auto_871032 ?auto_871033 ) ) ( not ( = ?auto_871032 ?auto_871034 ) ) ( not ( = ?auto_871032 ?auto_871035 ) ) ( not ( = ?auto_871032 ?auto_871036 ) ) ( not ( = ?auto_871032 ?auto_871037 ) ) ( not ( = ?auto_871032 ?auto_871038 ) ) ( not ( = ?auto_871032 ?auto_871039 ) ) ( not ( = ?auto_871032 ?auto_871040 ) ) ( not ( = ?auto_871032 ?auto_871041 ) ) ( not ( = ?auto_871032 ?auto_871042 ) ) ( not ( = ?auto_871032 ?auto_871043 ) ) ( not ( = ?auto_871032 ?auto_871044 ) ) ( not ( = ?auto_871032 ?auto_871045 ) ) ( not ( = ?auto_871032 ?auto_871046 ) ) ( not ( = ?auto_871032 ?auto_871047 ) ) ( not ( = ?auto_871032 ?auto_871048 ) ) ( not ( = ?auto_871032 ?auto_871049 ) ) ( not ( = ?auto_871032 ?auto_871050 ) ) ( not ( = ?auto_871033 ?auto_871034 ) ) ( not ( = ?auto_871033 ?auto_871035 ) ) ( not ( = ?auto_871033 ?auto_871036 ) ) ( not ( = ?auto_871033 ?auto_871037 ) ) ( not ( = ?auto_871033 ?auto_871038 ) ) ( not ( = ?auto_871033 ?auto_871039 ) ) ( not ( = ?auto_871033 ?auto_871040 ) ) ( not ( = ?auto_871033 ?auto_871041 ) ) ( not ( = ?auto_871033 ?auto_871042 ) ) ( not ( = ?auto_871033 ?auto_871043 ) ) ( not ( = ?auto_871033 ?auto_871044 ) ) ( not ( = ?auto_871033 ?auto_871045 ) ) ( not ( = ?auto_871033 ?auto_871046 ) ) ( not ( = ?auto_871033 ?auto_871047 ) ) ( not ( = ?auto_871033 ?auto_871048 ) ) ( not ( = ?auto_871033 ?auto_871049 ) ) ( not ( = ?auto_871033 ?auto_871050 ) ) ( not ( = ?auto_871034 ?auto_871035 ) ) ( not ( = ?auto_871034 ?auto_871036 ) ) ( not ( = ?auto_871034 ?auto_871037 ) ) ( not ( = ?auto_871034 ?auto_871038 ) ) ( not ( = ?auto_871034 ?auto_871039 ) ) ( not ( = ?auto_871034 ?auto_871040 ) ) ( not ( = ?auto_871034 ?auto_871041 ) ) ( not ( = ?auto_871034 ?auto_871042 ) ) ( not ( = ?auto_871034 ?auto_871043 ) ) ( not ( = ?auto_871034 ?auto_871044 ) ) ( not ( = ?auto_871034 ?auto_871045 ) ) ( not ( = ?auto_871034 ?auto_871046 ) ) ( not ( = ?auto_871034 ?auto_871047 ) ) ( not ( = ?auto_871034 ?auto_871048 ) ) ( not ( = ?auto_871034 ?auto_871049 ) ) ( not ( = ?auto_871034 ?auto_871050 ) ) ( not ( = ?auto_871035 ?auto_871036 ) ) ( not ( = ?auto_871035 ?auto_871037 ) ) ( not ( = ?auto_871035 ?auto_871038 ) ) ( not ( = ?auto_871035 ?auto_871039 ) ) ( not ( = ?auto_871035 ?auto_871040 ) ) ( not ( = ?auto_871035 ?auto_871041 ) ) ( not ( = ?auto_871035 ?auto_871042 ) ) ( not ( = ?auto_871035 ?auto_871043 ) ) ( not ( = ?auto_871035 ?auto_871044 ) ) ( not ( = ?auto_871035 ?auto_871045 ) ) ( not ( = ?auto_871035 ?auto_871046 ) ) ( not ( = ?auto_871035 ?auto_871047 ) ) ( not ( = ?auto_871035 ?auto_871048 ) ) ( not ( = ?auto_871035 ?auto_871049 ) ) ( not ( = ?auto_871035 ?auto_871050 ) ) ( not ( = ?auto_871036 ?auto_871037 ) ) ( not ( = ?auto_871036 ?auto_871038 ) ) ( not ( = ?auto_871036 ?auto_871039 ) ) ( not ( = ?auto_871036 ?auto_871040 ) ) ( not ( = ?auto_871036 ?auto_871041 ) ) ( not ( = ?auto_871036 ?auto_871042 ) ) ( not ( = ?auto_871036 ?auto_871043 ) ) ( not ( = ?auto_871036 ?auto_871044 ) ) ( not ( = ?auto_871036 ?auto_871045 ) ) ( not ( = ?auto_871036 ?auto_871046 ) ) ( not ( = ?auto_871036 ?auto_871047 ) ) ( not ( = ?auto_871036 ?auto_871048 ) ) ( not ( = ?auto_871036 ?auto_871049 ) ) ( not ( = ?auto_871036 ?auto_871050 ) ) ( not ( = ?auto_871037 ?auto_871038 ) ) ( not ( = ?auto_871037 ?auto_871039 ) ) ( not ( = ?auto_871037 ?auto_871040 ) ) ( not ( = ?auto_871037 ?auto_871041 ) ) ( not ( = ?auto_871037 ?auto_871042 ) ) ( not ( = ?auto_871037 ?auto_871043 ) ) ( not ( = ?auto_871037 ?auto_871044 ) ) ( not ( = ?auto_871037 ?auto_871045 ) ) ( not ( = ?auto_871037 ?auto_871046 ) ) ( not ( = ?auto_871037 ?auto_871047 ) ) ( not ( = ?auto_871037 ?auto_871048 ) ) ( not ( = ?auto_871037 ?auto_871049 ) ) ( not ( = ?auto_871037 ?auto_871050 ) ) ( not ( = ?auto_871038 ?auto_871039 ) ) ( not ( = ?auto_871038 ?auto_871040 ) ) ( not ( = ?auto_871038 ?auto_871041 ) ) ( not ( = ?auto_871038 ?auto_871042 ) ) ( not ( = ?auto_871038 ?auto_871043 ) ) ( not ( = ?auto_871038 ?auto_871044 ) ) ( not ( = ?auto_871038 ?auto_871045 ) ) ( not ( = ?auto_871038 ?auto_871046 ) ) ( not ( = ?auto_871038 ?auto_871047 ) ) ( not ( = ?auto_871038 ?auto_871048 ) ) ( not ( = ?auto_871038 ?auto_871049 ) ) ( not ( = ?auto_871038 ?auto_871050 ) ) ( not ( = ?auto_871039 ?auto_871040 ) ) ( not ( = ?auto_871039 ?auto_871041 ) ) ( not ( = ?auto_871039 ?auto_871042 ) ) ( not ( = ?auto_871039 ?auto_871043 ) ) ( not ( = ?auto_871039 ?auto_871044 ) ) ( not ( = ?auto_871039 ?auto_871045 ) ) ( not ( = ?auto_871039 ?auto_871046 ) ) ( not ( = ?auto_871039 ?auto_871047 ) ) ( not ( = ?auto_871039 ?auto_871048 ) ) ( not ( = ?auto_871039 ?auto_871049 ) ) ( not ( = ?auto_871039 ?auto_871050 ) ) ( not ( = ?auto_871040 ?auto_871041 ) ) ( not ( = ?auto_871040 ?auto_871042 ) ) ( not ( = ?auto_871040 ?auto_871043 ) ) ( not ( = ?auto_871040 ?auto_871044 ) ) ( not ( = ?auto_871040 ?auto_871045 ) ) ( not ( = ?auto_871040 ?auto_871046 ) ) ( not ( = ?auto_871040 ?auto_871047 ) ) ( not ( = ?auto_871040 ?auto_871048 ) ) ( not ( = ?auto_871040 ?auto_871049 ) ) ( not ( = ?auto_871040 ?auto_871050 ) ) ( not ( = ?auto_871041 ?auto_871042 ) ) ( not ( = ?auto_871041 ?auto_871043 ) ) ( not ( = ?auto_871041 ?auto_871044 ) ) ( not ( = ?auto_871041 ?auto_871045 ) ) ( not ( = ?auto_871041 ?auto_871046 ) ) ( not ( = ?auto_871041 ?auto_871047 ) ) ( not ( = ?auto_871041 ?auto_871048 ) ) ( not ( = ?auto_871041 ?auto_871049 ) ) ( not ( = ?auto_871041 ?auto_871050 ) ) ( not ( = ?auto_871042 ?auto_871043 ) ) ( not ( = ?auto_871042 ?auto_871044 ) ) ( not ( = ?auto_871042 ?auto_871045 ) ) ( not ( = ?auto_871042 ?auto_871046 ) ) ( not ( = ?auto_871042 ?auto_871047 ) ) ( not ( = ?auto_871042 ?auto_871048 ) ) ( not ( = ?auto_871042 ?auto_871049 ) ) ( not ( = ?auto_871042 ?auto_871050 ) ) ( not ( = ?auto_871043 ?auto_871044 ) ) ( not ( = ?auto_871043 ?auto_871045 ) ) ( not ( = ?auto_871043 ?auto_871046 ) ) ( not ( = ?auto_871043 ?auto_871047 ) ) ( not ( = ?auto_871043 ?auto_871048 ) ) ( not ( = ?auto_871043 ?auto_871049 ) ) ( not ( = ?auto_871043 ?auto_871050 ) ) ( not ( = ?auto_871044 ?auto_871045 ) ) ( not ( = ?auto_871044 ?auto_871046 ) ) ( not ( = ?auto_871044 ?auto_871047 ) ) ( not ( = ?auto_871044 ?auto_871048 ) ) ( not ( = ?auto_871044 ?auto_871049 ) ) ( not ( = ?auto_871044 ?auto_871050 ) ) ( not ( = ?auto_871045 ?auto_871046 ) ) ( not ( = ?auto_871045 ?auto_871047 ) ) ( not ( = ?auto_871045 ?auto_871048 ) ) ( not ( = ?auto_871045 ?auto_871049 ) ) ( not ( = ?auto_871045 ?auto_871050 ) ) ( not ( = ?auto_871046 ?auto_871047 ) ) ( not ( = ?auto_871046 ?auto_871048 ) ) ( not ( = ?auto_871046 ?auto_871049 ) ) ( not ( = ?auto_871046 ?auto_871050 ) ) ( not ( = ?auto_871047 ?auto_871048 ) ) ( not ( = ?auto_871047 ?auto_871049 ) ) ( not ( = ?auto_871047 ?auto_871050 ) ) ( not ( = ?auto_871048 ?auto_871049 ) ) ( not ( = ?auto_871048 ?auto_871050 ) ) ( not ( = ?auto_871049 ?auto_871050 ) ) ( ON ?auto_871048 ?auto_871049 ) ( ON ?auto_871047 ?auto_871048 ) ( ON ?auto_871046 ?auto_871047 ) ( ON ?auto_871045 ?auto_871046 ) ( ON ?auto_871044 ?auto_871045 ) ( ON ?auto_871043 ?auto_871044 ) ( ON ?auto_871042 ?auto_871043 ) ( ON ?auto_871041 ?auto_871042 ) ( ON ?auto_871040 ?auto_871041 ) ( CLEAR ?auto_871038 ) ( ON ?auto_871039 ?auto_871040 ) ( CLEAR ?auto_871039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_871032 ?auto_871033 ?auto_871034 ?auto_871035 ?auto_871036 ?auto_871037 ?auto_871038 ?auto_871039 )
      ( MAKE-18PILE ?auto_871032 ?auto_871033 ?auto_871034 ?auto_871035 ?auto_871036 ?auto_871037 ?auto_871038 ?auto_871039 ?auto_871040 ?auto_871041 ?auto_871042 ?auto_871043 ?auto_871044 ?auto_871045 ?auto_871046 ?auto_871047 ?auto_871048 ?auto_871049 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871069 - BLOCK
      ?auto_871070 - BLOCK
      ?auto_871071 - BLOCK
      ?auto_871072 - BLOCK
      ?auto_871073 - BLOCK
      ?auto_871074 - BLOCK
      ?auto_871075 - BLOCK
      ?auto_871076 - BLOCK
      ?auto_871077 - BLOCK
      ?auto_871078 - BLOCK
      ?auto_871079 - BLOCK
      ?auto_871080 - BLOCK
      ?auto_871081 - BLOCK
      ?auto_871082 - BLOCK
      ?auto_871083 - BLOCK
      ?auto_871084 - BLOCK
      ?auto_871085 - BLOCK
      ?auto_871086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871086 ) ( ON-TABLE ?auto_871069 ) ( ON ?auto_871070 ?auto_871069 ) ( ON ?auto_871071 ?auto_871070 ) ( ON ?auto_871072 ?auto_871071 ) ( ON ?auto_871073 ?auto_871072 ) ( ON ?auto_871074 ?auto_871073 ) ( ON ?auto_871075 ?auto_871074 ) ( not ( = ?auto_871069 ?auto_871070 ) ) ( not ( = ?auto_871069 ?auto_871071 ) ) ( not ( = ?auto_871069 ?auto_871072 ) ) ( not ( = ?auto_871069 ?auto_871073 ) ) ( not ( = ?auto_871069 ?auto_871074 ) ) ( not ( = ?auto_871069 ?auto_871075 ) ) ( not ( = ?auto_871069 ?auto_871076 ) ) ( not ( = ?auto_871069 ?auto_871077 ) ) ( not ( = ?auto_871069 ?auto_871078 ) ) ( not ( = ?auto_871069 ?auto_871079 ) ) ( not ( = ?auto_871069 ?auto_871080 ) ) ( not ( = ?auto_871069 ?auto_871081 ) ) ( not ( = ?auto_871069 ?auto_871082 ) ) ( not ( = ?auto_871069 ?auto_871083 ) ) ( not ( = ?auto_871069 ?auto_871084 ) ) ( not ( = ?auto_871069 ?auto_871085 ) ) ( not ( = ?auto_871069 ?auto_871086 ) ) ( not ( = ?auto_871070 ?auto_871071 ) ) ( not ( = ?auto_871070 ?auto_871072 ) ) ( not ( = ?auto_871070 ?auto_871073 ) ) ( not ( = ?auto_871070 ?auto_871074 ) ) ( not ( = ?auto_871070 ?auto_871075 ) ) ( not ( = ?auto_871070 ?auto_871076 ) ) ( not ( = ?auto_871070 ?auto_871077 ) ) ( not ( = ?auto_871070 ?auto_871078 ) ) ( not ( = ?auto_871070 ?auto_871079 ) ) ( not ( = ?auto_871070 ?auto_871080 ) ) ( not ( = ?auto_871070 ?auto_871081 ) ) ( not ( = ?auto_871070 ?auto_871082 ) ) ( not ( = ?auto_871070 ?auto_871083 ) ) ( not ( = ?auto_871070 ?auto_871084 ) ) ( not ( = ?auto_871070 ?auto_871085 ) ) ( not ( = ?auto_871070 ?auto_871086 ) ) ( not ( = ?auto_871071 ?auto_871072 ) ) ( not ( = ?auto_871071 ?auto_871073 ) ) ( not ( = ?auto_871071 ?auto_871074 ) ) ( not ( = ?auto_871071 ?auto_871075 ) ) ( not ( = ?auto_871071 ?auto_871076 ) ) ( not ( = ?auto_871071 ?auto_871077 ) ) ( not ( = ?auto_871071 ?auto_871078 ) ) ( not ( = ?auto_871071 ?auto_871079 ) ) ( not ( = ?auto_871071 ?auto_871080 ) ) ( not ( = ?auto_871071 ?auto_871081 ) ) ( not ( = ?auto_871071 ?auto_871082 ) ) ( not ( = ?auto_871071 ?auto_871083 ) ) ( not ( = ?auto_871071 ?auto_871084 ) ) ( not ( = ?auto_871071 ?auto_871085 ) ) ( not ( = ?auto_871071 ?auto_871086 ) ) ( not ( = ?auto_871072 ?auto_871073 ) ) ( not ( = ?auto_871072 ?auto_871074 ) ) ( not ( = ?auto_871072 ?auto_871075 ) ) ( not ( = ?auto_871072 ?auto_871076 ) ) ( not ( = ?auto_871072 ?auto_871077 ) ) ( not ( = ?auto_871072 ?auto_871078 ) ) ( not ( = ?auto_871072 ?auto_871079 ) ) ( not ( = ?auto_871072 ?auto_871080 ) ) ( not ( = ?auto_871072 ?auto_871081 ) ) ( not ( = ?auto_871072 ?auto_871082 ) ) ( not ( = ?auto_871072 ?auto_871083 ) ) ( not ( = ?auto_871072 ?auto_871084 ) ) ( not ( = ?auto_871072 ?auto_871085 ) ) ( not ( = ?auto_871072 ?auto_871086 ) ) ( not ( = ?auto_871073 ?auto_871074 ) ) ( not ( = ?auto_871073 ?auto_871075 ) ) ( not ( = ?auto_871073 ?auto_871076 ) ) ( not ( = ?auto_871073 ?auto_871077 ) ) ( not ( = ?auto_871073 ?auto_871078 ) ) ( not ( = ?auto_871073 ?auto_871079 ) ) ( not ( = ?auto_871073 ?auto_871080 ) ) ( not ( = ?auto_871073 ?auto_871081 ) ) ( not ( = ?auto_871073 ?auto_871082 ) ) ( not ( = ?auto_871073 ?auto_871083 ) ) ( not ( = ?auto_871073 ?auto_871084 ) ) ( not ( = ?auto_871073 ?auto_871085 ) ) ( not ( = ?auto_871073 ?auto_871086 ) ) ( not ( = ?auto_871074 ?auto_871075 ) ) ( not ( = ?auto_871074 ?auto_871076 ) ) ( not ( = ?auto_871074 ?auto_871077 ) ) ( not ( = ?auto_871074 ?auto_871078 ) ) ( not ( = ?auto_871074 ?auto_871079 ) ) ( not ( = ?auto_871074 ?auto_871080 ) ) ( not ( = ?auto_871074 ?auto_871081 ) ) ( not ( = ?auto_871074 ?auto_871082 ) ) ( not ( = ?auto_871074 ?auto_871083 ) ) ( not ( = ?auto_871074 ?auto_871084 ) ) ( not ( = ?auto_871074 ?auto_871085 ) ) ( not ( = ?auto_871074 ?auto_871086 ) ) ( not ( = ?auto_871075 ?auto_871076 ) ) ( not ( = ?auto_871075 ?auto_871077 ) ) ( not ( = ?auto_871075 ?auto_871078 ) ) ( not ( = ?auto_871075 ?auto_871079 ) ) ( not ( = ?auto_871075 ?auto_871080 ) ) ( not ( = ?auto_871075 ?auto_871081 ) ) ( not ( = ?auto_871075 ?auto_871082 ) ) ( not ( = ?auto_871075 ?auto_871083 ) ) ( not ( = ?auto_871075 ?auto_871084 ) ) ( not ( = ?auto_871075 ?auto_871085 ) ) ( not ( = ?auto_871075 ?auto_871086 ) ) ( not ( = ?auto_871076 ?auto_871077 ) ) ( not ( = ?auto_871076 ?auto_871078 ) ) ( not ( = ?auto_871076 ?auto_871079 ) ) ( not ( = ?auto_871076 ?auto_871080 ) ) ( not ( = ?auto_871076 ?auto_871081 ) ) ( not ( = ?auto_871076 ?auto_871082 ) ) ( not ( = ?auto_871076 ?auto_871083 ) ) ( not ( = ?auto_871076 ?auto_871084 ) ) ( not ( = ?auto_871076 ?auto_871085 ) ) ( not ( = ?auto_871076 ?auto_871086 ) ) ( not ( = ?auto_871077 ?auto_871078 ) ) ( not ( = ?auto_871077 ?auto_871079 ) ) ( not ( = ?auto_871077 ?auto_871080 ) ) ( not ( = ?auto_871077 ?auto_871081 ) ) ( not ( = ?auto_871077 ?auto_871082 ) ) ( not ( = ?auto_871077 ?auto_871083 ) ) ( not ( = ?auto_871077 ?auto_871084 ) ) ( not ( = ?auto_871077 ?auto_871085 ) ) ( not ( = ?auto_871077 ?auto_871086 ) ) ( not ( = ?auto_871078 ?auto_871079 ) ) ( not ( = ?auto_871078 ?auto_871080 ) ) ( not ( = ?auto_871078 ?auto_871081 ) ) ( not ( = ?auto_871078 ?auto_871082 ) ) ( not ( = ?auto_871078 ?auto_871083 ) ) ( not ( = ?auto_871078 ?auto_871084 ) ) ( not ( = ?auto_871078 ?auto_871085 ) ) ( not ( = ?auto_871078 ?auto_871086 ) ) ( not ( = ?auto_871079 ?auto_871080 ) ) ( not ( = ?auto_871079 ?auto_871081 ) ) ( not ( = ?auto_871079 ?auto_871082 ) ) ( not ( = ?auto_871079 ?auto_871083 ) ) ( not ( = ?auto_871079 ?auto_871084 ) ) ( not ( = ?auto_871079 ?auto_871085 ) ) ( not ( = ?auto_871079 ?auto_871086 ) ) ( not ( = ?auto_871080 ?auto_871081 ) ) ( not ( = ?auto_871080 ?auto_871082 ) ) ( not ( = ?auto_871080 ?auto_871083 ) ) ( not ( = ?auto_871080 ?auto_871084 ) ) ( not ( = ?auto_871080 ?auto_871085 ) ) ( not ( = ?auto_871080 ?auto_871086 ) ) ( not ( = ?auto_871081 ?auto_871082 ) ) ( not ( = ?auto_871081 ?auto_871083 ) ) ( not ( = ?auto_871081 ?auto_871084 ) ) ( not ( = ?auto_871081 ?auto_871085 ) ) ( not ( = ?auto_871081 ?auto_871086 ) ) ( not ( = ?auto_871082 ?auto_871083 ) ) ( not ( = ?auto_871082 ?auto_871084 ) ) ( not ( = ?auto_871082 ?auto_871085 ) ) ( not ( = ?auto_871082 ?auto_871086 ) ) ( not ( = ?auto_871083 ?auto_871084 ) ) ( not ( = ?auto_871083 ?auto_871085 ) ) ( not ( = ?auto_871083 ?auto_871086 ) ) ( not ( = ?auto_871084 ?auto_871085 ) ) ( not ( = ?auto_871084 ?auto_871086 ) ) ( not ( = ?auto_871085 ?auto_871086 ) ) ( ON ?auto_871085 ?auto_871086 ) ( ON ?auto_871084 ?auto_871085 ) ( ON ?auto_871083 ?auto_871084 ) ( ON ?auto_871082 ?auto_871083 ) ( ON ?auto_871081 ?auto_871082 ) ( ON ?auto_871080 ?auto_871081 ) ( ON ?auto_871079 ?auto_871080 ) ( ON ?auto_871078 ?auto_871079 ) ( ON ?auto_871077 ?auto_871078 ) ( CLEAR ?auto_871075 ) ( ON ?auto_871076 ?auto_871077 ) ( CLEAR ?auto_871076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_871069 ?auto_871070 ?auto_871071 ?auto_871072 ?auto_871073 ?auto_871074 ?auto_871075 ?auto_871076 )
      ( MAKE-18PILE ?auto_871069 ?auto_871070 ?auto_871071 ?auto_871072 ?auto_871073 ?auto_871074 ?auto_871075 ?auto_871076 ?auto_871077 ?auto_871078 ?auto_871079 ?auto_871080 ?auto_871081 ?auto_871082 ?auto_871083 ?auto_871084 ?auto_871085 ?auto_871086 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871105 - BLOCK
      ?auto_871106 - BLOCK
      ?auto_871107 - BLOCK
      ?auto_871108 - BLOCK
      ?auto_871109 - BLOCK
      ?auto_871110 - BLOCK
      ?auto_871111 - BLOCK
      ?auto_871112 - BLOCK
      ?auto_871113 - BLOCK
      ?auto_871114 - BLOCK
      ?auto_871115 - BLOCK
      ?auto_871116 - BLOCK
      ?auto_871117 - BLOCK
      ?auto_871118 - BLOCK
      ?auto_871119 - BLOCK
      ?auto_871120 - BLOCK
      ?auto_871121 - BLOCK
      ?auto_871122 - BLOCK
    )
    :vars
    (
      ?auto_871123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871122 ?auto_871123 ) ( ON-TABLE ?auto_871105 ) ( ON ?auto_871106 ?auto_871105 ) ( ON ?auto_871107 ?auto_871106 ) ( ON ?auto_871108 ?auto_871107 ) ( ON ?auto_871109 ?auto_871108 ) ( ON ?auto_871110 ?auto_871109 ) ( not ( = ?auto_871105 ?auto_871106 ) ) ( not ( = ?auto_871105 ?auto_871107 ) ) ( not ( = ?auto_871105 ?auto_871108 ) ) ( not ( = ?auto_871105 ?auto_871109 ) ) ( not ( = ?auto_871105 ?auto_871110 ) ) ( not ( = ?auto_871105 ?auto_871111 ) ) ( not ( = ?auto_871105 ?auto_871112 ) ) ( not ( = ?auto_871105 ?auto_871113 ) ) ( not ( = ?auto_871105 ?auto_871114 ) ) ( not ( = ?auto_871105 ?auto_871115 ) ) ( not ( = ?auto_871105 ?auto_871116 ) ) ( not ( = ?auto_871105 ?auto_871117 ) ) ( not ( = ?auto_871105 ?auto_871118 ) ) ( not ( = ?auto_871105 ?auto_871119 ) ) ( not ( = ?auto_871105 ?auto_871120 ) ) ( not ( = ?auto_871105 ?auto_871121 ) ) ( not ( = ?auto_871105 ?auto_871122 ) ) ( not ( = ?auto_871105 ?auto_871123 ) ) ( not ( = ?auto_871106 ?auto_871107 ) ) ( not ( = ?auto_871106 ?auto_871108 ) ) ( not ( = ?auto_871106 ?auto_871109 ) ) ( not ( = ?auto_871106 ?auto_871110 ) ) ( not ( = ?auto_871106 ?auto_871111 ) ) ( not ( = ?auto_871106 ?auto_871112 ) ) ( not ( = ?auto_871106 ?auto_871113 ) ) ( not ( = ?auto_871106 ?auto_871114 ) ) ( not ( = ?auto_871106 ?auto_871115 ) ) ( not ( = ?auto_871106 ?auto_871116 ) ) ( not ( = ?auto_871106 ?auto_871117 ) ) ( not ( = ?auto_871106 ?auto_871118 ) ) ( not ( = ?auto_871106 ?auto_871119 ) ) ( not ( = ?auto_871106 ?auto_871120 ) ) ( not ( = ?auto_871106 ?auto_871121 ) ) ( not ( = ?auto_871106 ?auto_871122 ) ) ( not ( = ?auto_871106 ?auto_871123 ) ) ( not ( = ?auto_871107 ?auto_871108 ) ) ( not ( = ?auto_871107 ?auto_871109 ) ) ( not ( = ?auto_871107 ?auto_871110 ) ) ( not ( = ?auto_871107 ?auto_871111 ) ) ( not ( = ?auto_871107 ?auto_871112 ) ) ( not ( = ?auto_871107 ?auto_871113 ) ) ( not ( = ?auto_871107 ?auto_871114 ) ) ( not ( = ?auto_871107 ?auto_871115 ) ) ( not ( = ?auto_871107 ?auto_871116 ) ) ( not ( = ?auto_871107 ?auto_871117 ) ) ( not ( = ?auto_871107 ?auto_871118 ) ) ( not ( = ?auto_871107 ?auto_871119 ) ) ( not ( = ?auto_871107 ?auto_871120 ) ) ( not ( = ?auto_871107 ?auto_871121 ) ) ( not ( = ?auto_871107 ?auto_871122 ) ) ( not ( = ?auto_871107 ?auto_871123 ) ) ( not ( = ?auto_871108 ?auto_871109 ) ) ( not ( = ?auto_871108 ?auto_871110 ) ) ( not ( = ?auto_871108 ?auto_871111 ) ) ( not ( = ?auto_871108 ?auto_871112 ) ) ( not ( = ?auto_871108 ?auto_871113 ) ) ( not ( = ?auto_871108 ?auto_871114 ) ) ( not ( = ?auto_871108 ?auto_871115 ) ) ( not ( = ?auto_871108 ?auto_871116 ) ) ( not ( = ?auto_871108 ?auto_871117 ) ) ( not ( = ?auto_871108 ?auto_871118 ) ) ( not ( = ?auto_871108 ?auto_871119 ) ) ( not ( = ?auto_871108 ?auto_871120 ) ) ( not ( = ?auto_871108 ?auto_871121 ) ) ( not ( = ?auto_871108 ?auto_871122 ) ) ( not ( = ?auto_871108 ?auto_871123 ) ) ( not ( = ?auto_871109 ?auto_871110 ) ) ( not ( = ?auto_871109 ?auto_871111 ) ) ( not ( = ?auto_871109 ?auto_871112 ) ) ( not ( = ?auto_871109 ?auto_871113 ) ) ( not ( = ?auto_871109 ?auto_871114 ) ) ( not ( = ?auto_871109 ?auto_871115 ) ) ( not ( = ?auto_871109 ?auto_871116 ) ) ( not ( = ?auto_871109 ?auto_871117 ) ) ( not ( = ?auto_871109 ?auto_871118 ) ) ( not ( = ?auto_871109 ?auto_871119 ) ) ( not ( = ?auto_871109 ?auto_871120 ) ) ( not ( = ?auto_871109 ?auto_871121 ) ) ( not ( = ?auto_871109 ?auto_871122 ) ) ( not ( = ?auto_871109 ?auto_871123 ) ) ( not ( = ?auto_871110 ?auto_871111 ) ) ( not ( = ?auto_871110 ?auto_871112 ) ) ( not ( = ?auto_871110 ?auto_871113 ) ) ( not ( = ?auto_871110 ?auto_871114 ) ) ( not ( = ?auto_871110 ?auto_871115 ) ) ( not ( = ?auto_871110 ?auto_871116 ) ) ( not ( = ?auto_871110 ?auto_871117 ) ) ( not ( = ?auto_871110 ?auto_871118 ) ) ( not ( = ?auto_871110 ?auto_871119 ) ) ( not ( = ?auto_871110 ?auto_871120 ) ) ( not ( = ?auto_871110 ?auto_871121 ) ) ( not ( = ?auto_871110 ?auto_871122 ) ) ( not ( = ?auto_871110 ?auto_871123 ) ) ( not ( = ?auto_871111 ?auto_871112 ) ) ( not ( = ?auto_871111 ?auto_871113 ) ) ( not ( = ?auto_871111 ?auto_871114 ) ) ( not ( = ?auto_871111 ?auto_871115 ) ) ( not ( = ?auto_871111 ?auto_871116 ) ) ( not ( = ?auto_871111 ?auto_871117 ) ) ( not ( = ?auto_871111 ?auto_871118 ) ) ( not ( = ?auto_871111 ?auto_871119 ) ) ( not ( = ?auto_871111 ?auto_871120 ) ) ( not ( = ?auto_871111 ?auto_871121 ) ) ( not ( = ?auto_871111 ?auto_871122 ) ) ( not ( = ?auto_871111 ?auto_871123 ) ) ( not ( = ?auto_871112 ?auto_871113 ) ) ( not ( = ?auto_871112 ?auto_871114 ) ) ( not ( = ?auto_871112 ?auto_871115 ) ) ( not ( = ?auto_871112 ?auto_871116 ) ) ( not ( = ?auto_871112 ?auto_871117 ) ) ( not ( = ?auto_871112 ?auto_871118 ) ) ( not ( = ?auto_871112 ?auto_871119 ) ) ( not ( = ?auto_871112 ?auto_871120 ) ) ( not ( = ?auto_871112 ?auto_871121 ) ) ( not ( = ?auto_871112 ?auto_871122 ) ) ( not ( = ?auto_871112 ?auto_871123 ) ) ( not ( = ?auto_871113 ?auto_871114 ) ) ( not ( = ?auto_871113 ?auto_871115 ) ) ( not ( = ?auto_871113 ?auto_871116 ) ) ( not ( = ?auto_871113 ?auto_871117 ) ) ( not ( = ?auto_871113 ?auto_871118 ) ) ( not ( = ?auto_871113 ?auto_871119 ) ) ( not ( = ?auto_871113 ?auto_871120 ) ) ( not ( = ?auto_871113 ?auto_871121 ) ) ( not ( = ?auto_871113 ?auto_871122 ) ) ( not ( = ?auto_871113 ?auto_871123 ) ) ( not ( = ?auto_871114 ?auto_871115 ) ) ( not ( = ?auto_871114 ?auto_871116 ) ) ( not ( = ?auto_871114 ?auto_871117 ) ) ( not ( = ?auto_871114 ?auto_871118 ) ) ( not ( = ?auto_871114 ?auto_871119 ) ) ( not ( = ?auto_871114 ?auto_871120 ) ) ( not ( = ?auto_871114 ?auto_871121 ) ) ( not ( = ?auto_871114 ?auto_871122 ) ) ( not ( = ?auto_871114 ?auto_871123 ) ) ( not ( = ?auto_871115 ?auto_871116 ) ) ( not ( = ?auto_871115 ?auto_871117 ) ) ( not ( = ?auto_871115 ?auto_871118 ) ) ( not ( = ?auto_871115 ?auto_871119 ) ) ( not ( = ?auto_871115 ?auto_871120 ) ) ( not ( = ?auto_871115 ?auto_871121 ) ) ( not ( = ?auto_871115 ?auto_871122 ) ) ( not ( = ?auto_871115 ?auto_871123 ) ) ( not ( = ?auto_871116 ?auto_871117 ) ) ( not ( = ?auto_871116 ?auto_871118 ) ) ( not ( = ?auto_871116 ?auto_871119 ) ) ( not ( = ?auto_871116 ?auto_871120 ) ) ( not ( = ?auto_871116 ?auto_871121 ) ) ( not ( = ?auto_871116 ?auto_871122 ) ) ( not ( = ?auto_871116 ?auto_871123 ) ) ( not ( = ?auto_871117 ?auto_871118 ) ) ( not ( = ?auto_871117 ?auto_871119 ) ) ( not ( = ?auto_871117 ?auto_871120 ) ) ( not ( = ?auto_871117 ?auto_871121 ) ) ( not ( = ?auto_871117 ?auto_871122 ) ) ( not ( = ?auto_871117 ?auto_871123 ) ) ( not ( = ?auto_871118 ?auto_871119 ) ) ( not ( = ?auto_871118 ?auto_871120 ) ) ( not ( = ?auto_871118 ?auto_871121 ) ) ( not ( = ?auto_871118 ?auto_871122 ) ) ( not ( = ?auto_871118 ?auto_871123 ) ) ( not ( = ?auto_871119 ?auto_871120 ) ) ( not ( = ?auto_871119 ?auto_871121 ) ) ( not ( = ?auto_871119 ?auto_871122 ) ) ( not ( = ?auto_871119 ?auto_871123 ) ) ( not ( = ?auto_871120 ?auto_871121 ) ) ( not ( = ?auto_871120 ?auto_871122 ) ) ( not ( = ?auto_871120 ?auto_871123 ) ) ( not ( = ?auto_871121 ?auto_871122 ) ) ( not ( = ?auto_871121 ?auto_871123 ) ) ( not ( = ?auto_871122 ?auto_871123 ) ) ( ON ?auto_871121 ?auto_871122 ) ( ON ?auto_871120 ?auto_871121 ) ( ON ?auto_871119 ?auto_871120 ) ( ON ?auto_871118 ?auto_871119 ) ( ON ?auto_871117 ?auto_871118 ) ( ON ?auto_871116 ?auto_871117 ) ( ON ?auto_871115 ?auto_871116 ) ( ON ?auto_871114 ?auto_871115 ) ( ON ?auto_871113 ?auto_871114 ) ( ON ?auto_871112 ?auto_871113 ) ( CLEAR ?auto_871110 ) ( ON ?auto_871111 ?auto_871112 ) ( CLEAR ?auto_871111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_871105 ?auto_871106 ?auto_871107 ?auto_871108 ?auto_871109 ?auto_871110 ?auto_871111 )
      ( MAKE-18PILE ?auto_871105 ?auto_871106 ?auto_871107 ?auto_871108 ?auto_871109 ?auto_871110 ?auto_871111 ?auto_871112 ?auto_871113 ?auto_871114 ?auto_871115 ?auto_871116 ?auto_871117 ?auto_871118 ?auto_871119 ?auto_871120 ?auto_871121 ?auto_871122 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871142 - BLOCK
      ?auto_871143 - BLOCK
      ?auto_871144 - BLOCK
      ?auto_871145 - BLOCK
      ?auto_871146 - BLOCK
      ?auto_871147 - BLOCK
      ?auto_871148 - BLOCK
      ?auto_871149 - BLOCK
      ?auto_871150 - BLOCK
      ?auto_871151 - BLOCK
      ?auto_871152 - BLOCK
      ?auto_871153 - BLOCK
      ?auto_871154 - BLOCK
      ?auto_871155 - BLOCK
      ?auto_871156 - BLOCK
      ?auto_871157 - BLOCK
      ?auto_871158 - BLOCK
      ?auto_871159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871159 ) ( ON-TABLE ?auto_871142 ) ( ON ?auto_871143 ?auto_871142 ) ( ON ?auto_871144 ?auto_871143 ) ( ON ?auto_871145 ?auto_871144 ) ( ON ?auto_871146 ?auto_871145 ) ( ON ?auto_871147 ?auto_871146 ) ( not ( = ?auto_871142 ?auto_871143 ) ) ( not ( = ?auto_871142 ?auto_871144 ) ) ( not ( = ?auto_871142 ?auto_871145 ) ) ( not ( = ?auto_871142 ?auto_871146 ) ) ( not ( = ?auto_871142 ?auto_871147 ) ) ( not ( = ?auto_871142 ?auto_871148 ) ) ( not ( = ?auto_871142 ?auto_871149 ) ) ( not ( = ?auto_871142 ?auto_871150 ) ) ( not ( = ?auto_871142 ?auto_871151 ) ) ( not ( = ?auto_871142 ?auto_871152 ) ) ( not ( = ?auto_871142 ?auto_871153 ) ) ( not ( = ?auto_871142 ?auto_871154 ) ) ( not ( = ?auto_871142 ?auto_871155 ) ) ( not ( = ?auto_871142 ?auto_871156 ) ) ( not ( = ?auto_871142 ?auto_871157 ) ) ( not ( = ?auto_871142 ?auto_871158 ) ) ( not ( = ?auto_871142 ?auto_871159 ) ) ( not ( = ?auto_871143 ?auto_871144 ) ) ( not ( = ?auto_871143 ?auto_871145 ) ) ( not ( = ?auto_871143 ?auto_871146 ) ) ( not ( = ?auto_871143 ?auto_871147 ) ) ( not ( = ?auto_871143 ?auto_871148 ) ) ( not ( = ?auto_871143 ?auto_871149 ) ) ( not ( = ?auto_871143 ?auto_871150 ) ) ( not ( = ?auto_871143 ?auto_871151 ) ) ( not ( = ?auto_871143 ?auto_871152 ) ) ( not ( = ?auto_871143 ?auto_871153 ) ) ( not ( = ?auto_871143 ?auto_871154 ) ) ( not ( = ?auto_871143 ?auto_871155 ) ) ( not ( = ?auto_871143 ?auto_871156 ) ) ( not ( = ?auto_871143 ?auto_871157 ) ) ( not ( = ?auto_871143 ?auto_871158 ) ) ( not ( = ?auto_871143 ?auto_871159 ) ) ( not ( = ?auto_871144 ?auto_871145 ) ) ( not ( = ?auto_871144 ?auto_871146 ) ) ( not ( = ?auto_871144 ?auto_871147 ) ) ( not ( = ?auto_871144 ?auto_871148 ) ) ( not ( = ?auto_871144 ?auto_871149 ) ) ( not ( = ?auto_871144 ?auto_871150 ) ) ( not ( = ?auto_871144 ?auto_871151 ) ) ( not ( = ?auto_871144 ?auto_871152 ) ) ( not ( = ?auto_871144 ?auto_871153 ) ) ( not ( = ?auto_871144 ?auto_871154 ) ) ( not ( = ?auto_871144 ?auto_871155 ) ) ( not ( = ?auto_871144 ?auto_871156 ) ) ( not ( = ?auto_871144 ?auto_871157 ) ) ( not ( = ?auto_871144 ?auto_871158 ) ) ( not ( = ?auto_871144 ?auto_871159 ) ) ( not ( = ?auto_871145 ?auto_871146 ) ) ( not ( = ?auto_871145 ?auto_871147 ) ) ( not ( = ?auto_871145 ?auto_871148 ) ) ( not ( = ?auto_871145 ?auto_871149 ) ) ( not ( = ?auto_871145 ?auto_871150 ) ) ( not ( = ?auto_871145 ?auto_871151 ) ) ( not ( = ?auto_871145 ?auto_871152 ) ) ( not ( = ?auto_871145 ?auto_871153 ) ) ( not ( = ?auto_871145 ?auto_871154 ) ) ( not ( = ?auto_871145 ?auto_871155 ) ) ( not ( = ?auto_871145 ?auto_871156 ) ) ( not ( = ?auto_871145 ?auto_871157 ) ) ( not ( = ?auto_871145 ?auto_871158 ) ) ( not ( = ?auto_871145 ?auto_871159 ) ) ( not ( = ?auto_871146 ?auto_871147 ) ) ( not ( = ?auto_871146 ?auto_871148 ) ) ( not ( = ?auto_871146 ?auto_871149 ) ) ( not ( = ?auto_871146 ?auto_871150 ) ) ( not ( = ?auto_871146 ?auto_871151 ) ) ( not ( = ?auto_871146 ?auto_871152 ) ) ( not ( = ?auto_871146 ?auto_871153 ) ) ( not ( = ?auto_871146 ?auto_871154 ) ) ( not ( = ?auto_871146 ?auto_871155 ) ) ( not ( = ?auto_871146 ?auto_871156 ) ) ( not ( = ?auto_871146 ?auto_871157 ) ) ( not ( = ?auto_871146 ?auto_871158 ) ) ( not ( = ?auto_871146 ?auto_871159 ) ) ( not ( = ?auto_871147 ?auto_871148 ) ) ( not ( = ?auto_871147 ?auto_871149 ) ) ( not ( = ?auto_871147 ?auto_871150 ) ) ( not ( = ?auto_871147 ?auto_871151 ) ) ( not ( = ?auto_871147 ?auto_871152 ) ) ( not ( = ?auto_871147 ?auto_871153 ) ) ( not ( = ?auto_871147 ?auto_871154 ) ) ( not ( = ?auto_871147 ?auto_871155 ) ) ( not ( = ?auto_871147 ?auto_871156 ) ) ( not ( = ?auto_871147 ?auto_871157 ) ) ( not ( = ?auto_871147 ?auto_871158 ) ) ( not ( = ?auto_871147 ?auto_871159 ) ) ( not ( = ?auto_871148 ?auto_871149 ) ) ( not ( = ?auto_871148 ?auto_871150 ) ) ( not ( = ?auto_871148 ?auto_871151 ) ) ( not ( = ?auto_871148 ?auto_871152 ) ) ( not ( = ?auto_871148 ?auto_871153 ) ) ( not ( = ?auto_871148 ?auto_871154 ) ) ( not ( = ?auto_871148 ?auto_871155 ) ) ( not ( = ?auto_871148 ?auto_871156 ) ) ( not ( = ?auto_871148 ?auto_871157 ) ) ( not ( = ?auto_871148 ?auto_871158 ) ) ( not ( = ?auto_871148 ?auto_871159 ) ) ( not ( = ?auto_871149 ?auto_871150 ) ) ( not ( = ?auto_871149 ?auto_871151 ) ) ( not ( = ?auto_871149 ?auto_871152 ) ) ( not ( = ?auto_871149 ?auto_871153 ) ) ( not ( = ?auto_871149 ?auto_871154 ) ) ( not ( = ?auto_871149 ?auto_871155 ) ) ( not ( = ?auto_871149 ?auto_871156 ) ) ( not ( = ?auto_871149 ?auto_871157 ) ) ( not ( = ?auto_871149 ?auto_871158 ) ) ( not ( = ?auto_871149 ?auto_871159 ) ) ( not ( = ?auto_871150 ?auto_871151 ) ) ( not ( = ?auto_871150 ?auto_871152 ) ) ( not ( = ?auto_871150 ?auto_871153 ) ) ( not ( = ?auto_871150 ?auto_871154 ) ) ( not ( = ?auto_871150 ?auto_871155 ) ) ( not ( = ?auto_871150 ?auto_871156 ) ) ( not ( = ?auto_871150 ?auto_871157 ) ) ( not ( = ?auto_871150 ?auto_871158 ) ) ( not ( = ?auto_871150 ?auto_871159 ) ) ( not ( = ?auto_871151 ?auto_871152 ) ) ( not ( = ?auto_871151 ?auto_871153 ) ) ( not ( = ?auto_871151 ?auto_871154 ) ) ( not ( = ?auto_871151 ?auto_871155 ) ) ( not ( = ?auto_871151 ?auto_871156 ) ) ( not ( = ?auto_871151 ?auto_871157 ) ) ( not ( = ?auto_871151 ?auto_871158 ) ) ( not ( = ?auto_871151 ?auto_871159 ) ) ( not ( = ?auto_871152 ?auto_871153 ) ) ( not ( = ?auto_871152 ?auto_871154 ) ) ( not ( = ?auto_871152 ?auto_871155 ) ) ( not ( = ?auto_871152 ?auto_871156 ) ) ( not ( = ?auto_871152 ?auto_871157 ) ) ( not ( = ?auto_871152 ?auto_871158 ) ) ( not ( = ?auto_871152 ?auto_871159 ) ) ( not ( = ?auto_871153 ?auto_871154 ) ) ( not ( = ?auto_871153 ?auto_871155 ) ) ( not ( = ?auto_871153 ?auto_871156 ) ) ( not ( = ?auto_871153 ?auto_871157 ) ) ( not ( = ?auto_871153 ?auto_871158 ) ) ( not ( = ?auto_871153 ?auto_871159 ) ) ( not ( = ?auto_871154 ?auto_871155 ) ) ( not ( = ?auto_871154 ?auto_871156 ) ) ( not ( = ?auto_871154 ?auto_871157 ) ) ( not ( = ?auto_871154 ?auto_871158 ) ) ( not ( = ?auto_871154 ?auto_871159 ) ) ( not ( = ?auto_871155 ?auto_871156 ) ) ( not ( = ?auto_871155 ?auto_871157 ) ) ( not ( = ?auto_871155 ?auto_871158 ) ) ( not ( = ?auto_871155 ?auto_871159 ) ) ( not ( = ?auto_871156 ?auto_871157 ) ) ( not ( = ?auto_871156 ?auto_871158 ) ) ( not ( = ?auto_871156 ?auto_871159 ) ) ( not ( = ?auto_871157 ?auto_871158 ) ) ( not ( = ?auto_871157 ?auto_871159 ) ) ( not ( = ?auto_871158 ?auto_871159 ) ) ( ON ?auto_871158 ?auto_871159 ) ( ON ?auto_871157 ?auto_871158 ) ( ON ?auto_871156 ?auto_871157 ) ( ON ?auto_871155 ?auto_871156 ) ( ON ?auto_871154 ?auto_871155 ) ( ON ?auto_871153 ?auto_871154 ) ( ON ?auto_871152 ?auto_871153 ) ( ON ?auto_871151 ?auto_871152 ) ( ON ?auto_871150 ?auto_871151 ) ( ON ?auto_871149 ?auto_871150 ) ( CLEAR ?auto_871147 ) ( ON ?auto_871148 ?auto_871149 ) ( CLEAR ?auto_871148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_871142 ?auto_871143 ?auto_871144 ?auto_871145 ?auto_871146 ?auto_871147 ?auto_871148 )
      ( MAKE-18PILE ?auto_871142 ?auto_871143 ?auto_871144 ?auto_871145 ?auto_871146 ?auto_871147 ?auto_871148 ?auto_871149 ?auto_871150 ?auto_871151 ?auto_871152 ?auto_871153 ?auto_871154 ?auto_871155 ?auto_871156 ?auto_871157 ?auto_871158 ?auto_871159 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871178 - BLOCK
      ?auto_871179 - BLOCK
      ?auto_871180 - BLOCK
      ?auto_871181 - BLOCK
      ?auto_871182 - BLOCK
      ?auto_871183 - BLOCK
      ?auto_871184 - BLOCK
      ?auto_871185 - BLOCK
      ?auto_871186 - BLOCK
      ?auto_871187 - BLOCK
      ?auto_871188 - BLOCK
      ?auto_871189 - BLOCK
      ?auto_871190 - BLOCK
      ?auto_871191 - BLOCK
      ?auto_871192 - BLOCK
      ?auto_871193 - BLOCK
      ?auto_871194 - BLOCK
      ?auto_871195 - BLOCK
    )
    :vars
    (
      ?auto_871196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871195 ?auto_871196 ) ( ON-TABLE ?auto_871178 ) ( ON ?auto_871179 ?auto_871178 ) ( ON ?auto_871180 ?auto_871179 ) ( ON ?auto_871181 ?auto_871180 ) ( ON ?auto_871182 ?auto_871181 ) ( not ( = ?auto_871178 ?auto_871179 ) ) ( not ( = ?auto_871178 ?auto_871180 ) ) ( not ( = ?auto_871178 ?auto_871181 ) ) ( not ( = ?auto_871178 ?auto_871182 ) ) ( not ( = ?auto_871178 ?auto_871183 ) ) ( not ( = ?auto_871178 ?auto_871184 ) ) ( not ( = ?auto_871178 ?auto_871185 ) ) ( not ( = ?auto_871178 ?auto_871186 ) ) ( not ( = ?auto_871178 ?auto_871187 ) ) ( not ( = ?auto_871178 ?auto_871188 ) ) ( not ( = ?auto_871178 ?auto_871189 ) ) ( not ( = ?auto_871178 ?auto_871190 ) ) ( not ( = ?auto_871178 ?auto_871191 ) ) ( not ( = ?auto_871178 ?auto_871192 ) ) ( not ( = ?auto_871178 ?auto_871193 ) ) ( not ( = ?auto_871178 ?auto_871194 ) ) ( not ( = ?auto_871178 ?auto_871195 ) ) ( not ( = ?auto_871178 ?auto_871196 ) ) ( not ( = ?auto_871179 ?auto_871180 ) ) ( not ( = ?auto_871179 ?auto_871181 ) ) ( not ( = ?auto_871179 ?auto_871182 ) ) ( not ( = ?auto_871179 ?auto_871183 ) ) ( not ( = ?auto_871179 ?auto_871184 ) ) ( not ( = ?auto_871179 ?auto_871185 ) ) ( not ( = ?auto_871179 ?auto_871186 ) ) ( not ( = ?auto_871179 ?auto_871187 ) ) ( not ( = ?auto_871179 ?auto_871188 ) ) ( not ( = ?auto_871179 ?auto_871189 ) ) ( not ( = ?auto_871179 ?auto_871190 ) ) ( not ( = ?auto_871179 ?auto_871191 ) ) ( not ( = ?auto_871179 ?auto_871192 ) ) ( not ( = ?auto_871179 ?auto_871193 ) ) ( not ( = ?auto_871179 ?auto_871194 ) ) ( not ( = ?auto_871179 ?auto_871195 ) ) ( not ( = ?auto_871179 ?auto_871196 ) ) ( not ( = ?auto_871180 ?auto_871181 ) ) ( not ( = ?auto_871180 ?auto_871182 ) ) ( not ( = ?auto_871180 ?auto_871183 ) ) ( not ( = ?auto_871180 ?auto_871184 ) ) ( not ( = ?auto_871180 ?auto_871185 ) ) ( not ( = ?auto_871180 ?auto_871186 ) ) ( not ( = ?auto_871180 ?auto_871187 ) ) ( not ( = ?auto_871180 ?auto_871188 ) ) ( not ( = ?auto_871180 ?auto_871189 ) ) ( not ( = ?auto_871180 ?auto_871190 ) ) ( not ( = ?auto_871180 ?auto_871191 ) ) ( not ( = ?auto_871180 ?auto_871192 ) ) ( not ( = ?auto_871180 ?auto_871193 ) ) ( not ( = ?auto_871180 ?auto_871194 ) ) ( not ( = ?auto_871180 ?auto_871195 ) ) ( not ( = ?auto_871180 ?auto_871196 ) ) ( not ( = ?auto_871181 ?auto_871182 ) ) ( not ( = ?auto_871181 ?auto_871183 ) ) ( not ( = ?auto_871181 ?auto_871184 ) ) ( not ( = ?auto_871181 ?auto_871185 ) ) ( not ( = ?auto_871181 ?auto_871186 ) ) ( not ( = ?auto_871181 ?auto_871187 ) ) ( not ( = ?auto_871181 ?auto_871188 ) ) ( not ( = ?auto_871181 ?auto_871189 ) ) ( not ( = ?auto_871181 ?auto_871190 ) ) ( not ( = ?auto_871181 ?auto_871191 ) ) ( not ( = ?auto_871181 ?auto_871192 ) ) ( not ( = ?auto_871181 ?auto_871193 ) ) ( not ( = ?auto_871181 ?auto_871194 ) ) ( not ( = ?auto_871181 ?auto_871195 ) ) ( not ( = ?auto_871181 ?auto_871196 ) ) ( not ( = ?auto_871182 ?auto_871183 ) ) ( not ( = ?auto_871182 ?auto_871184 ) ) ( not ( = ?auto_871182 ?auto_871185 ) ) ( not ( = ?auto_871182 ?auto_871186 ) ) ( not ( = ?auto_871182 ?auto_871187 ) ) ( not ( = ?auto_871182 ?auto_871188 ) ) ( not ( = ?auto_871182 ?auto_871189 ) ) ( not ( = ?auto_871182 ?auto_871190 ) ) ( not ( = ?auto_871182 ?auto_871191 ) ) ( not ( = ?auto_871182 ?auto_871192 ) ) ( not ( = ?auto_871182 ?auto_871193 ) ) ( not ( = ?auto_871182 ?auto_871194 ) ) ( not ( = ?auto_871182 ?auto_871195 ) ) ( not ( = ?auto_871182 ?auto_871196 ) ) ( not ( = ?auto_871183 ?auto_871184 ) ) ( not ( = ?auto_871183 ?auto_871185 ) ) ( not ( = ?auto_871183 ?auto_871186 ) ) ( not ( = ?auto_871183 ?auto_871187 ) ) ( not ( = ?auto_871183 ?auto_871188 ) ) ( not ( = ?auto_871183 ?auto_871189 ) ) ( not ( = ?auto_871183 ?auto_871190 ) ) ( not ( = ?auto_871183 ?auto_871191 ) ) ( not ( = ?auto_871183 ?auto_871192 ) ) ( not ( = ?auto_871183 ?auto_871193 ) ) ( not ( = ?auto_871183 ?auto_871194 ) ) ( not ( = ?auto_871183 ?auto_871195 ) ) ( not ( = ?auto_871183 ?auto_871196 ) ) ( not ( = ?auto_871184 ?auto_871185 ) ) ( not ( = ?auto_871184 ?auto_871186 ) ) ( not ( = ?auto_871184 ?auto_871187 ) ) ( not ( = ?auto_871184 ?auto_871188 ) ) ( not ( = ?auto_871184 ?auto_871189 ) ) ( not ( = ?auto_871184 ?auto_871190 ) ) ( not ( = ?auto_871184 ?auto_871191 ) ) ( not ( = ?auto_871184 ?auto_871192 ) ) ( not ( = ?auto_871184 ?auto_871193 ) ) ( not ( = ?auto_871184 ?auto_871194 ) ) ( not ( = ?auto_871184 ?auto_871195 ) ) ( not ( = ?auto_871184 ?auto_871196 ) ) ( not ( = ?auto_871185 ?auto_871186 ) ) ( not ( = ?auto_871185 ?auto_871187 ) ) ( not ( = ?auto_871185 ?auto_871188 ) ) ( not ( = ?auto_871185 ?auto_871189 ) ) ( not ( = ?auto_871185 ?auto_871190 ) ) ( not ( = ?auto_871185 ?auto_871191 ) ) ( not ( = ?auto_871185 ?auto_871192 ) ) ( not ( = ?auto_871185 ?auto_871193 ) ) ( not ( = ?auto_871185 ?auto_871194 ) ) ( not ( = ?auto_871185 ?auto_871195 ) ) ( not ( = ?auto_871185 ?auto_871196 ) ) ( not ( = ?auto_871186 ?auto_871187 ) ) ( not ( = ?auto_871186 ?auto_871188 ) ) ( not ( = ?auto_871186 ?auto_871189 ) ) ( not ( = ?auto_871186 ?auto_871190 ) ) ( not ( = ?auto_871186 ?auto_871191 ) ) ( not ( = ?auto_871186 ?auto_871192 ) ) ( not ( = ?auto_871186 ?auto_871193 ) ) ( not ( = ?auto_871186 ?auto_871194 ) ) ( not ( = ?auto_871186 ?auto_871195 ) ) ( not ( = ?auto_871186 ?auto_871196 ) ) ( not ( = ?auto_871187 ?auto_871188 ) ) ( not ( = ?auto_871187 ?auto_871189 ) ) ( not ( = ?auto_871187 ?auto_871190 ) ) ( not ( = ?auto_871187 ?auto_871191 ) ) ( not ( = ?auto_871187 ?auto_871192 ) ) ( not ( = ?auto_871187 ?auto_871193 ) ) ( not ( = ?auto_871187 ?auto_871194 ) ) ( not ( = ?auto_871187 ?auto_871195 ) ) ( not ( = ?auto_871187 ?auto_871196 ) ) ( not ( = ?auto_871188 ?auto_871189 ) ) ( not ( = ?auto_871188 ?auto_871190 ) ) ( not ( = ?auto_871188 ?auto_871191 ) ) ( not ( = ?auto_871188 ?auto_871192 ) ) ( not ( = ?auto_871188 ?auto_871193 ) ) ( not ( = ?auto_871188 ?auto_871194 ) ) ( not ( = ?auto_871188 ?auto_871195 ) ) ( not ( = ?auto_871188 ?auto_871196 ) ) ( not ( = ?auto_871189 ?auto_871190 ) ) ( not ( = ?auto_871189 ?auto_871191 ) ) ( not ( = ?auto_871189 ?auto_871192 ) ) ( not ( = ?auto_871189 ?auto_871193 ) ) ( not ( = ?auto_871189 ?auto_871194 ) ) ( not ( = ?auto_871189 ?auto_871195 ) ) ( not ( = ?auto_871189 ?auto_871196 ) ) ( not ( = ?auto_871190 ?auto_871191 ) ) ( not ( = ?auto_871190 ?auto_871192 ) ) ( not ( = ?auto_871190 ?auto_871193 ) ) ( not ( = ?auto_871190 ?auto_871194 ) ) ( not ( = ?auto_871190 ?auto_871195 ) ) ( not ( = ?auto_871190 ?auto_871196 ) ) ( not ( = ?auto_871191 ?auto_871192 ) ) ( not ( = ?auto_871191 ?auto_871193 ) ) ( not ( = ?auto_871191 ?auto_871194 ) ) ( not ( = ?auto_871191 ?auto_871195 ) ) ( not ( = ?auto_871191 ?auto_871196 ) ) ( not ( = ?auto_871192 ?auto_871193 ) ) ( not ( = ?auto_871192 ?auto_871194 ) ) ( not ( = ?auto_871192 ?auto_871195 ) ) ( not ( = ?auto_871192 ?auto_871196 ) ) ( not ( = ?auto_871193 ?auto_871194 ) ) ( not ( = ?auto_871193 ?auto_871195 ) ) ( not ( = ?auto_871193 ?auto_871196 ) ) ( not ( = ?auto_871194 ?auto_871195 ) ) ( not ( = ?auto_871194 ?auto_871196 ) ) ( not ( = ?auto_871195 ?auto_871196 ) ) ( ON ?auto_871194 ?auto_871195 ) ( ON ?auto_871193 ?auto_871194 ) ( ON ?auto_871192 ?auto_871193 ) ( ON ?auto_871191 ?auto_871192 ) ( ON ?auto_871190 ?auto_871191 ) ( ON ?auto_871189 ?auto_871190 ) ( ON ?auto_871188 ?auto_871189 ) ( ON ?auto_871187 ?auto_871188 ) ( ON ?auto_871186 ?auto_871187 ) ( ON ?auto_871185 ?auto_871186 ) ( ON ?auto_871184 ?auto_871185 ) ( CLEAR ?auto_871182 ) ( ON ?auto_871183 ?auto_871184 ) ( CLEAR ?auto_871183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_871178 ?auto_871179 ?auto_871180 ?auto_871181 ?auto_871182 ?auto_871183 )
      ( MAKE-18PILE ?auto_871178 ?auto_871179 ?auto_871180 ?auto_871181 ?auto_871182 ?auto_871183 ?auto_871184 ?auto_871185 ?auto_871186 ?auto_871187 ?auto_871188 ?auto_871189 ?auto_871190 ?auto_871191 ?auto_871192 ?auto_871193 ?auto_871194 ?auto_871195 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871215 - BLOCK
      ?auto_871216 - BLOCK
      ?auto_871217 - BLOCK
      ?auto_871218 - BLOCK
      ?auto_871219 - BLOCK
      ?auto_871220 - BLOCK
      ?auto_871221 - BLOCK
      ?auto_871222 - BLOCK
      ?auto_871223 - BLOCK
      ?auto_871224 - BLOCK
      ?auto_871225 - BLOCK
      ?auto_871226 - BLOCK
      ?auto_871227 - BLOCK
      ?auto_871228 - BLOCK
      ?auto_871229 - BLOCK
      ?auto_871230 - BLOCK
      ?auto_871231 - BLOCK
      ?auto_871232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871232 ) ( ON-TABLE ?auto_871215 ) ( ON ?auto_871216 ?auto_871215 ) ( ON ?auto_871217 ?auto_871216 ) ( ON ?auto_871218 ?auto_871217 ) ( ON ?auto_871219 ?auto_871218 ) ( not ( = ?auto_871215 ?auto_871216 ) ) ( not ( = ?auto_871215 ?auto_871217 ) ) ( not ( = ?auto_871215 ?auto_871218 ) ) ( not ( = ?auto_871215 ?auto_871219 ) ) ( not ( = ?auto_871215 ?auto_871220 ) ) ( not ( = ?auto_871215 ?auto_871221 ) ) ( not ( = ?auto_871215 ?auto_871222 ) ) ( not ( = ?auto_871215 ?auto_871223 ) ) ( not ( = ?auto_871215 ?auto_871224 ) ) ( not ( = ?auto_871215 ?auto_871225 ) ) ( not ( = ?auto_871215 ?auto_871226 ) ) ( not ( = ?auto_871215 ?auto_871227 ) ) ( not ( = ?auto_871215 ?auto_871228 ) ) ( not ( = ?auto_871215 ?auto_871229 ) ) ( not ( = ?auto_871215 ?auto_871230 ) ) ( not ( = ?auto_871215 ?auto_871231 ) ) ( not ( = ?auto_871215 ?auto_871232 ) ) ( not ( = ?auto_871216 ?auto_871217 ) ) ( not ( = ?auto_871216 ?auto_871218 ) ) ( not ( = ?auto_871216 ?auto_871219 ) ) ( not ( = ?auto_871216 ?auto_871220 ) ) ( not ( = ?auto_871216 ?auto_871221 ) ) ( not ( = ?auto_871216 ?auto_871222 ) ) ( not ( = ?auto_871216 ?auto_871223 ) ) ( not ( = ?auto_871216 ?auto_871224 ) ) ( not ( = ?auto_871216 ?auto_871225 ) ) ( not ( = ?auto_871216 ?auto_871226 ) ) ( not ( = ?auto_871216 ?auto_871227 ) ) ( not ( = ?auto_871216 ?auto_871228 ) ) ( not ( = ?auto_871216 ?auto_871229 ) ) ( not ( = ?auto_871216 ?auto_871230 ) ) ( not ( = ?auto_871216 ?auto_871231 ) ) ( not ( = ?auto_871216 ?auto_871232 ) ) ( not ( = ?auto_871217 ?auto_871218 ) ) ( not ( = ?auto_871217 ?auto_871219 ) ) ( not ( = ?auto_871217 ?auto_871220 ) ) ( not ( = ?auto_871217 ?auto_871221 ) ) ( not ( = ?auto_871217 ?auto_871222 ) ) ( not ( = ?auto_871217 ?auto_871223 ) ) ( not ( = ?auto_871217 ?auto_871224 ) ) ( not ( = ?auto_871217 ?auto_871225 ) ) ( not ( = ?auto_871217 ?auto_871226 ) ) ( not ( = ?auto_871217 ?auto_871227 ) ) ( not ( = ?auto_871217 ?auto_871228 ) ) ( not ( = ?auto_871217 ?auto_871229 ) ) ( not ( = ?auto_871217 ?auto_871230 ) ) ( not ( = ?auto_871217 ?auto_871231 ) ) ( not ( = ?auto_871217 ?auto_871232 ) ) ( not ( = ?auto_871218 ?auto_871219 ) ) ( not ( = ?auto_871218 ?auto_871220 ) ) ( not ( = ?auto_871218 ?auto_871221 ) ) ( not ( = ?auto_871218 ?auto_871222 ) ) ( not ( = ?auto_871218 ?auto_871223 ) ) ( not ( = ?auto_871218 ?auto_871224 ) ) ( not ( = ?auto_871218 ?auto_871225 ) ) ( not ( = ?auto_871218 ?auto_871226 ) ) ( not ( = ?auto_871218 ?auto_871227 ) ) ( not ( = ?auto_871218 ?auto_871228 ) ) ( not ( = ?auto_871218 ?auto_871229 ) ) ( not ( = ?auto_871218 ?auto_871230 ) ) ( not ( = ?auto_871218 ?auto_871231 ) ) ( not ( = ?auto_871218 ?auto_871232 ) ) ( not ( = ?auto_871219 ?auto_871220 ) ) ( not ( = ?auto_871219 ?auto_871221 ) ) ( not ( = ?auto_871219 ?auto_871222 ) ) ( not ( = ?auto_871219 ?auto_871223 ) ) ( not ( = ?auto_871219 ?auto_871224 ) ) ( not ( = ?auto_871219 ?auto_871225 ) ) ( not ( = ?auto_871219 ?auto_871226 ) ) ( not ( = ?auto_871219 ?auto_871227 ) ) ( not ( = ?auto_871219 ?auto_871228 ) ) ( not ( = ?auto_871219 ?auto_871229 ) ) ( not ( = ?auto_871219 ?auto_871230 ) ) ( not ( = ?auto_871219 ?auto_871231 ) ) ( not ( = ?auto_871219 ?auto_871232 ) ) ( not ( = ?auto_871220 ?auto_871221 ) ) ( not ( = ?auto_871220 ?auto_871222 ) ) ( not ( = ?auto_871220 ?auto_871223 ) ) ( not ( = ?auto_871220 ?auto_871224 ) ) ( not ( = ?auto_871220 ?auto_871225 ) ) ( not ( = ?auto_871220 ?auto_871226 ) ) ( not ( = ?auto_871220 ?auto_871227 ) ) ( not ( = ?auto_871220 ?auto_871228 ) ) ( not ( = ?auto_871220 ?auto_871229 ) ) ( not ( = ?auto_871220 ?auto_871230 ) ) ( not ( = ?auto_871220 ?auto_871231 ) ) ( not ( = ?auto_871220 ?auto_871232 ) ) ( not ( = ?auto_871221 ?auto_871222 ) ) ( not ( = ?auto_871221 ?auto_871223 ) ) ( not ( = ?auto_871221 ?auto_871224 ) ) ( not ( = ?auto_871221 ?auto_871225 ) ) ( not ( = ?auto_871221 ?auto_871226 ) ) ( not ( = ?auto_871221 ?auto_871227 ) ) ( not ( = ?auto_871221 ?auto_871228 ) ) ( not ( = ?auto_871221 ?auto_871229 ) ) ( not ( = ?auto_871221 ?auto_871230 ) ) ( not ( = ?auto_871221 ?auto_871231 ) ) ( not ( = ?auto_871221 ?auto_871232 ) ) ( not ( = ?auto_871222 ?auto_871223 ) ) ( not ( = ?auto_871222 ?auto_871224 ) ) ( not ( = ?auto_871222 ?auto_871225 ) ) ( not ( = ?auto_871222 ?auto_871226 ) ) ( not ( = ?auto_871222 ?auto_871227 ) ) ( not ( = ?auto_871222 ?auto_871228 ) ) ( not ( = ?auto_871222 ?auto_871229 ) ) ( not ( = ?auto_871222 ?auto_871230 ) ) ( not ( = ?auto_871222 ?auto_871231 ) ) ( not ( = ?auto_871222 ?auto_871232 ) ) ( not ( = ?auto_871223 ?auto_871224 ) ) ( not ( = ?auto_871223 ?auto_871225 ) ) ( not ( = ?auto_871223 ?auto_871226 ) ) ( not ( = ?auto_871223 ?auto_871227 ) ) ( not ( = ?auto_871223 ?auto_871228 ) ) ( not ( = ?auto_871223 ?auto_871229 ) ) ( not ( = ?auto_871223 ?auto_871230 ) ) ( not ( = ?auto_871223 ?auto_871231 ) ) ( not ( = ?auto_871223 ?auto_871232 ) ) ( not ( = ?auto_871224 ?auto_871225 ) ) ( not ( = ?auto_871224 ?auto_871226 ) ) ( not ( = ?auto_871224 ?auto_871227 ) ) ( not ( = ?auto_871224 ?auto_871228 ) ) ( not ( = ?auto_871224 ?auto_871229 ) ) ( not ( = ?auto_871224 ?auto_871230 ) ) ( not ( = ?auto_871224 ?auto_871231 ) ) ( not ( = ?auto_871224 ?auto_871232 ) ) ( not ( = ?auto_871225 ?auto_871226 ) ) ( not ( = ?auto_871225 ?auto_871227 ) ) ( not ( = ?auto_871225 ?auto_871228 ) ) ( not ( = ?auto_871225 ?auto_871229 ) ) ( not ( = ?auto_871225 ?auto_871230 ) ) ( not ( = ?auto_871225 ?auto_871231 ) ) ( not ( = ?auto_871225 ?auto_871232 ) ) ( not ( = ?auto_871226 ?auto_871227 ) ) ( not ( = ?auto_871226 ?auto_871228 ) ) ( not ( = ?auto_871226 ?auto_871229 ) ) ( not ( = ?auto_871226 ?auto_871230 ) ) ( not ( = ?auto_871226 ?auto_871231 ) ) ( not ( = ?auto_871226 ?auto_871232 ) ) ( not ( = ?auto_871227 ?auto_871228 ) ) ( not ( = ?auto_871227 ?auto_871229 ) ) ( not ( = ?auto_871227 ?auto_871230 ) ) ( not ( = ?auto_871227 ?auto_871231 ) ) ( not ( = ?auto_871227 ?auto_871232 ) ) ( not ( = ?auto_871228 ?auto_871229 ) ) ( not ( = ?auto_871228 ?auto_871230 ) ) ( not ( = ?auto_871228 ?auto_871231 ) ) ( not ( = ?auto_871228 ?auto_871232 ) ) ( not ( = ?auto_871229 ?auto_871230 ) ) ( not ( = ?auto_871229 ?auto_871231 ) ) ( not ( = ?auto_871229 ?auto_871232 ) ) ( not ( = ?auto_871230 ?auto_871231 ) ) ( not ( = ?auto_871230 ?auto_871232 ) ) ( not ( = ?auto_871231 ?auto_871232 ) ) ( ON ?auto_871231 ?auto_871232 ) ( ON ?auto_871230 ?auto_871231 ) ( ON ?auto_871229 ?auto_871230 ) ( ON ?auto_871228 ?auto_871229 ) ( ON ?auto_871227 ?auto_871228 ) ( ON ?auto_871226 ?auto_871227 ) ( ON ?auto_871225 ?auto_871226 ) ( ON ?auto_871224 ?auto_871225 ) ( ON ?auto_871223 ?auto_871224 ) ( ON ?auto_871222 ?auto_871223 ) ( ON ?auto_871221 ?auto_871222 ) ( CLEAR ?auto_871219 ) ( ON ?auto_871220 ?auto_871221 ) ( CLEAR ?auto_871220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_871215 ?auto_871216 ?auto_871217 ?auto_871218 ?auto_871219 ?auto_871220 )
      ( MAKE-18PILE ?auto_871215 ?auto_871216 ?auto_871217 ?auto_871218 ?auto_871219 ?auto_871220 ?auto_871221 ?auto_871222 ?auto_871223 ?auto_871224 ?auto_871225 ?auto_871226 ?auto_871227 ?auto_871228 ?auto_871229 ?auto_871230 ?auto_871231 ?auto_871232 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871251 - BLOCK
      ?auto_871252 - BLOCK
      ?auto_871253 - BLOCK
      ?auto_871254 - BLOCK
      ?auto_871255 - BLOCK
      ?auto_871256 - BLOCK
      ?auto_871257 - BLOCK
      ?auto_871258 - BLOCK
      ?auto_871259 - BLOCK
      ?auto_871260 - BLOCK
      ?auto_871261 - BLOCK
      ?auto_871262 - BLOCK
      ?auto_871263 - BLOCK
      ?auto_871264 - BLOCK
      ?auto_871265 - BLOCK
      ?auto_871266 - BLOCK
      ?auto_871267 - BLOCK
      ?auto_871268 - BLOCK
    )
    :vars
    (
      ?auto_871269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871268 ?auto_871269 ) ( ON-TABLE ?auto_871251 ) ( ON ?auto_871252 ?auto_871251 ) ( ON ?auto_871253 ?auto_871252 ) ( ON ?auto_871254 ?auto_871253 ) ( not ( = ?auto_871251 ?auto_871252 ) ) ( not ( = ?auto_871251 ?auto_871253 ) ) ( not ( = ?auto_871251 ?auto_871254 ) ) ( not ( = ?auto_871251 ?auto_871255 ) ) ( not ( = ?auto_871251 ?auto_871256 ) ) ( not ( = ?auto_871251 ?auto_871257 ) ) ( not ( = ?auto_871251 ?auto_871258 ) ) ( not ( = ?auto_871251 ?auto_871259 ) ) ( not ( = ?auto_871251 ?auto_871260 ) ) ( not ( = ?auto_871251 ?auto_871261 ) ) ( not ( = ?auto_871251 ?auto_871262 ) ) ( not ( = ?auto_871251 ?auto_871263 ) ) ( not ( = ?auto_871251 ?auto_871264 ) ) ( not ( = ?auto_871251 ?auto_871265 ) ) ( not ( = ?auto_871251 ?auto_871266 ) ) ( not ( = ?auto_871251 ?auto_871267 ) ) ( not ( = ?auto_871251 ?auto_871268 ) ) ( not ( = ?auto_871251 ?auto_871269 ) ) ( not ( = ?auto_871252 ?auto_871253 ) ) ( not ( = ?auto_871252 ?auto_871254 ) ) ( not ( = ?auto_871252 ?auto_871255 ) ) ( not ( = ?auto_871252 ?auto_871256 ) ) ( not ( = ?auto_871252 ?auto_871257 ) ) ( not ( = ?auto_871252 ?auto_871258 ) ) ( not ( = ?auto_871252 ?auto_871259 ) ) ( not ( = ?auto_871252 ?auto_871260 ) ) ( not ( = ?auto_871252 ?auto_871261 ) ) ( not ( = ?auto_871252 ?auto_871262 ) ) ( not ( = ?auto_871252 ?auto_871263 ) ) ( not ( = ?auto_871252 ?auto_871264 ) ) ( not ( = ?auto_871252 ?auto_871265 ) ) ( not ( = ?auto_871252 ?auto_871266 ) ) ( not ( = ?auto_871252 ?auto_871267 ) ) ( not ( = ?auto_871252 ?auto_871268 ) ) ( not ( = ?auto_871252 ?auto_871269 ) ) ( not ( = ?auto_871253 ?auto_871254 ) ) ( not ( = ?auto_871253 ?auto_871255 ) ) ( not ( = ?auto_871253 ?auto_871256 ) ) ( not ( = ?auto_871253 ?auto_871257 ) ) ( not ( = ?auto_871253 ?auto_871258 ) ) ( not ( = ?auto_871253 ?auto_871259 ) ) ( not ( = ?auto_871253 ?auto_871260 ) ) ( not ( = ?auto_871253 ?auto_871261 ) ) ( not ( = ?auto_871253 ?auto_871262 ) ) ( not ( = ?auto_871253 ?auto_871263 ) ) ( not ( = ?auto_871253 ?auto_871264 ) ) ( not ( = ?auto_871253 ?auto_871265 ) ) ( not ( = ?auto_871253 ?auto_871266 ) ) ( not ( = ?auto_871253 ?auto_871267 ) ) ( not ( = ?auto_871253 ?auto_871268 ) ) ( not ( = ?auto_871253 ?auto_871269 ) ) ( not ( = ?auto_871254 ?auto_871255 ) ) ( not ( = ?auto_871254 ?auto_871256 ) ) ( not ( = ?auto_871254 ?auto_871257 ) ) ( not ( = ?auto_871254 ?auto_871258 ) ) ( not ( = ?auto_871254 ?auto_871259 ) ) ( not ( = ?auto_871254 ?auto_871260 ) ) ( not ( = ?auto_871254 ?auto_871261 ) ) ( not ( = ?auto_871254 ?auto_871262 ) ) ( not ( = ?auto_871254 ?auto_871263 ) ) ( not ( = ?auto_871254 ?auto_871264 ) ) ( not ( = ?auto_871254 ?auto_871265 ) ) ( not ( = ?auto_871254 ?auto_871266 ) ) ( not ( = ?auto_871254 ?auto_871267 ) ) ( not ( = ?auto_871254 ?auto_871268 ) ) ( not ( = ?auto_871254 ?auto_871269 ) ) ( not ( = ?auto_871255 ?auto_871256 ) ) ( not ( = ?auto_871255 ?auto_871257 ) ) ( not ( = ?auto_871255 ?auto_871258 ) ) ( not ( = ?auto_871255 ?auto_871259 ) ) ( not ( = ?auto_871255 ?auto_871260 ) ) ( not ( = ?auto_871255 ?auto_871261 ) ) ( not ( = ?auto_871255 ?auto_871262 ) ) ( not ( = ?auto_871255 ?auto_871263 ) ) ( not ( = ?auto_871255 ?auto_871264 ) ) ( not ( = ?auto_871255 ?auto_871265 ) ) ( not ( = ?auto_871255 ?auto_871266 ) ) ( not ( = ?auto_871255 ?auto_871267 ) ) ( not ( = ?auto_871255 ?auto_871268 ) ) ( not ( = ?auto_871255 ?auto_871269 ) ) ( not ( = ?auto_871256 ?auto_871257 ) ) ( not ( = ?auto_871256 ?auto_871258 ) ) ( not ( = ?auto_871256 ?auto_871259 ) ) ( not ( = ?auto_871256 ?auto_871260 ) ) ( not ( = ?auto_871256 ?auto_871261 ) ) ( not ( = ?auto_871256 ?auto_871262 ) ) ( not ( = ?auto_871256 ?auto_871263 ) ) ( not ( = ?auto_871256 ?auto_871264 ) ) ( not ( = ?auto_871256 ?auto_871265 ) ) ( not ( = ?auto_871256 ?auto_871266 ) ) ( not ( = ?auto_871256 ?auto_871267 ) ) ( not ( = ?auto_871256 ?auto_871268 ) ) ( not ( = ?auto_871256 ?auto_871269 ) ) ( not ( = ?auto_871257 ?auto_871258 ) ) ( not ( = ?auto_871257 ?auto_871259 ) ) ( not ( = ?auto_871257 ?auto_871260 ) ) ( not ( = ?auto_871257 ?auto_871261 ) ) ( not ( = ?auto_871257 ?auto_871262 ) ) ( not ( = ?auto_871257 ?auto_871263 ) ) ( not ( = ?auto_871257 ?auto_871264 ) ) ( not ( = ?auto_871257 ?auto_871265 ) ) ( not ( = ?auto_871257 ?auto_871266 ) ) ( not ( = ?auto_871257 ?auto_871267 ) ) ( not ( = ?auto_871257 ?auto_871268 ) ) ( not ( = ?auto_871257 ?auto_871269 ) ) ( not ( = ?auto_871258 ?auto_871259 ) ) ( not ( = ?auto_871258 ?auto_871260 ) ) ( not ( = ?auto_871258 ?auto_871261 ) ) ( not ( = ?auto_871258 ?auto_871262 ) ) ( not ( = ?auto_871258 ?auto_871263 ) ) ( not ( = ?auto_871258 ?auto_871264 ) ) ( not ( = ?auto_871258 ?auto_871265 ) ) ( not ( = ?auto_871258 ?auto_871266 ) ) ( not ( = ?auto_871258 ?auto_871267 ) ) ( not ( = ?auto_871258 ?auto_871268 ) ) ( not ( = ?auto_871258 ?auto_871269 ) ) ( not ( = ?auto_871259 ?auto_871260 ) ) ( not ( = ?auto_871259 ?auto_871261 ) ) ( not ( = ?auto_871259 ?auto_871262 ) ) ( not ( = ?auto_871259 ?auto_871263 ) ) ( not ( = ?auto_871259 ?auto_871264 ) ) ( not ( = ?auto_871259 ?auto_871265 ) ) ( not ( = ?auto_871259 ?auto_871266 ) ) ( not ( = ?auto_871259 ?auto_871267 ) ) ( not ( = ?auto_871259 ?auto_871268 ) ) ( not ( = ?auto_871259 ?auto_871269 ) ) ( not ( = ?auto_871260 ?auto_871261 ) ) ( not ( = ?auto_871260 ?auto_871262 ) ) ( not ( = ?auto_871260 ?auto_871263 ) ) ( not ( = ?auto_871260 ?auto_871264 ) ) ( not ( = ?auto_871260 ?auto_871265 ) ) ( not ( = ?auto_871260 ?auto_871266 ) ) ( not ( = ?auto_871260 ?auto_871267 ) ) ( not ( = ?auto_871260 ?auto_871268 ) ) ( not ( = ?auto_871260 ?auto_871269 ) ) ( not ( = ?auto_871261 ?auto_871262 ) ) ( not ( = ?auto_871261 ?auto_871263 ) ) ( not ( = ?auto_871261 ?auto_871264 ) ) ( not ( = ?auto_871261 ?auto_871265 ) ) ( not ( = ?auto_871261 ?auto_871266 ) ) ( not ( = ?auto_871261 ?auto_871267 ) ) ( not ( = ?auto_871261 ?auto_871268 ) ) ( not ( = ?auto_871261 ?auto_871269 ) ) ( not ( = ?auto_871262 ?auto_871263 ) ) ( not ( = ?auto_871262 ?auto_871264 ) ) ( not ( = ?auto_871262 ?auto_871265 ) ) ( not ( = ?auto_871262 ?auto_871266 ) ) ( not ( = ?auto_871262 ?auto_871267 ) ) ( not ( = ?auto_871262 ?auto_871268 ) ) ( not ( = ?auto_871262 ?auto_871269 ) ) ( not ( = ?auto_871263 ?auto_871264 ) ) ( not ( = ?auto_871263 ?auto_871265 ) ) ( not ( = ?auto_871263 ?auto_871266 ) ) ( not ( = ?auto_871263 ?auto_871267 ) ) ( not ( = ?auto_871263 ?auto_871268 ) ) ( not ( = ?auto_871263 ?auto_871269 ) ) ( not ( = ?auto_871264 ?auto_871265 ) ) ( not ( = ?auto_871264 ?auto_871266 ) ) ( not ( = ?auto_871264 ?auto_871267 ) ) ( not ( = ?auto_871264 ?auto_871268 ) ) ( not ( = ?auto_871264 ?auto_871269 ) ) ( not ( = ?auto_871265 ?auto_871266 ) ) ( not ( = ?auto_871265 ?auto_871267 ) ) ( not ( = ?auto_871265 ?auto_871268 ) ) ( not ( = ?auto_871265 ?auto_871269 ) ) ( not ( = ?auto_871266 ?auto_871267 ) ) ( not ( = ?auto_871266 ?auto_871268 ) ) ( not ( = ?auto_871266 ?auto_871269 ) ) ( not ( = ?auto_871267 ?auto_871268 ) ) ( not ( = ?auto_871267 ?auto_871269 ) ) ( not ( = ?auto_871268 ?auto_871269 ) ) ( ON ?auto_871267 ?auto_871268 ) ( ON ?auto_871266 ?auto_871267 ) ( ON ?auto_871265 ?auto_871266 ) ( ON ?auto_871264 ?auto_871265 ) ( ON ?auto_871263 ?auto_871264 ) ( ON ?auto_871262 ?auto_871263 ) ( ON ?auto_871261 ?auto_871262 ) ( ON ?auto_871260 ?auto_871261 ) ( ON ?auto_871259 ?auto_871260 ) ( ON ?auto_871258 ?auto_871259 ) ( ON ?auto_871257 ?auto_871258 ) ( ON ?auto_871256 ?auto_871257 ) ( CLEAR ?auto_871254 ) ( ON ?auto_871255 ?auto_871256 ) ( CLEAR ?auto_871255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_871251 ?auto_871252 ?auto_871253 ?auto_871254 ?auto_871255 )
      ( MAKE-18PILE ?auto_871251 ?auto_871252 ?auto_871253 ?auto_871254 ?auto_871255 ?auto_871256 ?auto_871257 ?auto_871258 ?auto_871259 ?auto_871260 ?auto_871261 ?auto_871262 ?auto_871263 ?auto_871264 ?auto_871265 ?auto_871266 ?auto_871267 ?auto_871268 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871288 - BLOCK
      ?auto_871289 - BLOCK
      ?auto_871290 - BLOCK
      ?auto_871291 - BLOCK
      ?auto_871292 - BLOCK
      ?auto_871293 - BLOCK
      ?auto_871294 - BLOCK
      ?auto_871295 - BLOCK
      ?auto_871296 - BLOCK
      ?auto_871297 - BLOCK
      ?auto_871298 - BLOCK
      ?auto_871299 - BLOCK
      ?auto_871300 - BLOCK
      ?auto_871301 - BLOCK
      ?auto_871302 - BLOCK
      ?auto_871303 - BLOCK
      ?auto_871304 - BLOCK
      ?auto_871305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871305 ) ( ON-TABLE ?auto_871288 ) ( ON ?auto_871289 ?auto_871288 ) ( ON ?auto_871290 ?auto_871289 ) ( ON ?auto_871291 ?auto_871290 ) ( not ( = ?auto_871288 ?auto_871289 ) ) ( not ( = ?auto_871288 ?auto_871290 ) ) ( not ( = ?auto_871288 ?auto_871291 ) ) ( not ( = ?auto_871288 ?auto_871292 ) ) ( not ( = ?auto_871288 ?auto_871293 ) ) ( not ( = ?auto_871288 ?auto_871294 ) ) ( not ( = ?auto_871288 ?auto_871295 ) ) ( not ( = ?auto_871288 ?auto_871296 ) ) ( not ( = ?auto_871288 ?auto_871297 ) ) ( not ( = ?auto_871288 ?auto_871298 ) ) ( not ( = ?auto_871288 ?auto_871299 ) ) ( not ( = ?auto_871288 ?auto_871300 ) ) ( not ( = ?auto_871288 ?auto_871301 ) ) ( not ( = ?auto_871288 ?auto_871302 ) ) ( not ( = ?auto_871288 ?auto_871303 ) ) ( not ( = ?auto_871288 ?auto_871304 ) ) ( not ( = ?auto_871288 ?auto_871305 ) ) ( not ( = ?auto_871289 ?auto_871290 ) ) ( not ( = ?auto_871289 ?auto_871291 ) ) ( not ( = ?auto_871289 ?auto_871292 ) ) ( not ( = ?auto_871289 ?auto_871293 ) ) ( not ( = ?auto_871289 ?auto_871294 ) ) ( not ( = ?auto_871289 ?auto_871295 ) ) ( not ( = ?auto_871289 ?auto_871296 ) ) ( not ( = ?auto_871289 ?auto_871297 ) ) ( not ( = ?auto_871289 ?auto_871298 ) ) ( not ( = ?auto_871289 ?auto_871299 ) ) ( not ( = ?auto_871289 ?auto_871300 ) ) ( not ( = ?auto_871289 ?auto_871301 ) ) ( not ( = ?auto_871289 ?auto_871302 ) ) ( not ( = ?auto_871289 ?auto_871303 ) ) ( not ( = ?auto_871289 ?auto_871304 ) ) ( not ( = ?auto_871289 ?auto_871305 ) ) ( not ( = ?auto_871290 ?auto_871291 ) ) ( not ( = ?auto_871290 ?auto_871292 ) ) ( not ( = ?auto_871290 ?auto_871293 ) ) ( not ( = ?auto_871290 ?auto_871294 ) ) ( not ( = ?auto_871290 ?auto_871295 ) ) ( not ( = ?auto_871290 ?auto_871296 ) ) ( not ( = ?auto_871290 ?auto_871297 ) ) ( not ( = ?auto_871290 ?auto_871298 ) ) ( not ( = ?auto_871290 ?auto_871299 ) ) ( not ( = ?auto_871290 ?auto_871300 ) ) ( not ( = ?auto_871290 ?auto_871301 ) ) ( not ( = ?auto_871290 ?auto_871302 ) ) ( not ( = ?auto_871290 ?auto_871303 ) ) ( not ( = ?auto_871290 ?auto_871304 ) ) ( not ( = ?auto_871290 ?auto_871305 ) ) ( not ( = ?auto_871291 ?auto_871292 ) ) ( not ( = ?auto_871291 ?auto_871293 ) ) ( not ( = ?auto_871291 ?auto_871294 ) ) ( not ( = ?auto_871291 ?auto_871295 ) ) ( not ( = ?auto_871291 ?auto_871296 ) ) ( not ( = ?auto_871291 ?auto_871297 ) ) ( not ( = ?auto_871291 ?auto_871298 ) ) ( not ( = ?auto_871291 ?auto_871299 ) ) ( not ( = ?auto_871291 ?auto_871300 ) ) ( not ( = ?auto_871291 ?auto_871301 ) ) ( not ( = ?auto_871291 ?auto_871302 ) ) ( not ( = ?auto_871291 ?auto_871303 ) ) ( not ( = ?auto_871291 ?auto_871304 ) ) ( not ( = ?auto_871291 ?auto_871305 ) ) ( not ( = ?auto_871292 ?auto_871293 ) ) ( not ( = ?auto_871292 ?auto_871294 ) ) ( not ( = ?auto_871292 ?auto_871295 ) ) ( not ( = ?auto_871292 ?auto_871296 ) ) ( not ( = ?auto_871292 ?auto_871297 ) ) ( not ( = ?auto_871292 ?auto_871298 ) ) ( not ( = ?auto_871292 ?auto_871299 ) ) ( not ( = ?auto_871292 ?auto_871300 ) ) ( not ( = ?auto_871292 ?auto_871301 ) ) ( not ( = ?auto_871292 ?auto_871302 ) ) ( not ( = ?auto_871292 ?auto_871303 ) ) ( not ( = ?auto_871292 ?auto_871304 ) ) ( not ( = ?auto_871292 ?auto_871305 ) ) ( not ( = ?auto_871293 ?auto_871294 ) ) ( not ( = ?auto_871293 ?auto_871295 ) ) ( not ( = ?auto_871293 ?auto_871296 ) ) ( not ( = ?auto_871293 ?auto_871297 ) ) ( not ( = ?auto_871293 ?auto_871298 ) ) ( not ( = ?auto_871293 ?auto_871299 ) ) ( not ( = ?auto_871293 ?auto_871300 ) ) ( not ( = ?auto_871293 ?auto_871301 ) ) ( not ( = ?auto_871293 ?auto_871302 ) ) ( not ( = ?auto_871293 ?auto_871303 ) ) ( not ( = ?auto_871293 ?auto_871304 ) ) ( not ( = ?auto_871293 ?auto_871305 ) ) ( not ( = ?auto_871294 ?auto_871295 ) ) ( not ( = ?auto_871294 ?auto_871296 ) ) ( not ( = ?auto_871294 ?auto_871297 ) ) ( not ( = ?auto_871294 ?auto_871298 ) ) ( not ( = ?auto_871294 ?auto_871299 ) ) ( not ( = ?auto_871294 ?auto_871300 ) ) ( not ( = ?auto_871294 ?auto_871301 ) ) ( not ( = ?auto_871294 ?auto_871302 ) ) ( not ( = ?auto_871294 ?auto_871303 ) ) ( not ( = ?auto_871294 ?auto_871304 ) ) ( not ( = ?auto_871294 ?auto_871305 ) ) ( not ( = ?auto_871295 ?auto_871296 ) ) ( not ( = ?auto_871295 ?auto_871297 ) ) ( not ( = ?auto_871295 ?auto_871298 ) ) ( not ( = ?auto_871295 ?auto_871299 ) ) ( not ( = ?auto_871295 ?auto_871300 ) ) ( not ( = ?auto_871295 ?auto_871301 ) ) ( not ( = ?auto_871295 ?auto_871302 ) ) ( not ( = ?auto_871295 ?auto_871303 ) ) ( not ( = ?auto_871295 ?auto_871304 ) ) ( not ( = ?auto_871295 ?auto_871305 ) ) ( not ( = ?auto_871296 ?auto_871297 ) ) ( not ( = ?auto_871296 ?auto_871298 ) ) ( not ( = ?auto_871296 ?auto_871299 ) ) ( not ( = ?auto_871296 ?auto_871300 ) ) ( not ( = ?auto_871296 ?auto_871301 ) ) ( not ( = ?auto_871296 ?auto_871302 ) ) ( not ( = ?auto_871296 ?auto_871303 ) ) ( not ( = ?auto_871296 ?auto_871304 ) ) ( not ( = ?auto_871296 ?auto_871305 ) ) ( not ( = ?auto_871297 ?auto_871298 ) ) ( not ( = ?auto_871297 ?auto_871299 ) ) ( not ( = ?auto_871297 ?auto_871300 ) ) ( not ( = ?auto_871297 ?auto_871301 ) ) ( not ( = ?auto_871297 ?auto_871302 ) ) ( not ( = ?auto_871297 ?auto_871303 ) ) ( not ( = ?auto_871297 ?auto_871304 ) ) ( not ( = ?auto_871297 ?auto_871305 ) ) ( not ( = ?auto_871298 ?auto_871299 ) ) ( not ( = ?auto_871298 ?auto_871300 ) ) ( not ( = ?auto_871298 ?auto_871301 ) ) ( not ( = ?auto_871298 ?auto_871302 ) ) ( not ( = ?auto_871298 ?auto_871303 ) ) ( not ( = ?auto_871298 ?auto_871304 ) ) ( not ( = ?auto_871298 ?auto_871305 ) ) ( not ( = ?auto_871299 ?auto_871300 ) ) ( not ( = ?auto_871299 ?auto_871301 ) ) ( not ( = ?auto_871299 ?auto_871302 ) ) ( not ( = ?auto_871299 ?auto_871303 ) ) ( not ( = ?auto_871299 ?auto_871304 ) ) ( not ( = ?auto_871299 ?auto_871305 ) ) ( not ( = ?auto_871300 ?auto_871301 ) ) ( not ( = ?auto_871300 ?auto_871302 ) ) ( not ( = ?auto_871300 ?auto_871303 ) ) ( not ( = ?auto_871300 ?auto_871304 ) ) ( not ( = ?auto_871300 ?auto_871305 ) ) ( not ( = ?auto_871301 ?auto_871302 ) ) ( not ( = ?auto_871301 ?auto_871303 ) ) ( not ( = ?auto_871301 ?auto_871304 ) ) ( not ( = ?auto_871301 ?auto_871305 ) ) ( not ( = ?auto_871302 ?auto_871303 ) ) ( not ( = ?auto_871302 ?auto_871304 ) ) ( not ( = ?auto_871302 ?auto_871305 ) ) ( not ( = ?auto_871303 ?auto_871304 ) ) ( not ( = ?auto_871303 ?auto_871305 ) ) ( not ( = ?auto_871304 ?auto_871305 ) ) ( ON ?auto_871304 ?auto_871305 ) ( ON ?auto_871303 ?auto_871304 ) ( ON ?auto_871302 ?auto_871303 ) ( ON ?auto_871301 ?auto_871302 ) ( ON ?auto_871300 ?auto_871301 ) ( ON ?auto_871299 ?auto_871300 ) ( ON ?auto_871298 ?auto_871299 ) ( ON ?auto_871297 ?auto_871298 ) ( ON ?auto_871296 ?auto_871297 ) ( ON ?auto_871295 ?auto_871296 ) ( ON ?auto_871294 ?auto_871295 ) ( ON ?auto_871293 ?auto_871294 ) ( CLEAR ?auto_871291 ) ( ON ?auto_871292 ?auto_871293 ) ( CLEAR ?auto_871292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_871288 ?auto_871289 ?auto_871290 ?auto_871291 ?auto_871292 )
      ( MAKE-18PILE ?auto_871288 ?auto_871289 ?auto_871290 ?auto_871291 ?auto_871292 ?auto_871293 ?auto_871294 ?auto_871295 ?auto_871296 ?auto_871297 ?auto_871298 ?auto_871299 ?auto_871300 ?auto_871301 ?auto_871302 ?auto_871303 ?auto_871304 ?auto_871305 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871324 - BLOCK
      ?auto_871325 - BLOCK
      ?auto_871326 - BLOCK
      ?auto_871327 - BLOCK
      ?auto_871328 - BLOCK
      ?auto_871329 - BLOCK
      ?auto_871330 - BLOCK
      ?auto_871331 - BLOCK
      ?auto_871332 - BLOCK
      ?auto_871333 - BLOCK
      ?auto_871334 - BLOCK
      ?auto_871335 - BLOCK
      ?auto_871336 - BLOCK
      ?auto_871337 - BLOCK
      ?auto_871338 - BLOCK
      ?auto_871339 - BLOCK
      ?auto_871340 - BLOCK
      ?auto_871341 - BLOCK
    )
    :vars
    (
      ?auto_871342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871341 ?auto_871342 ) ( ON-TABLE ?auto_871324 ) ( ON ?auto_871325 ?auto_871324 ) ( ON ?auto_871326 ?auto_871325 ) ( not ( = ?auto_871324 ?auto_871325 ) ) ( not ( = ?auto_871324 ?auto_871326 ) ) ( not ( = ?auto_871324 ?auto_871327 ) ) ( not ( = ?auto_871324 ?auto_871328 ) ) ( not ( = ?auto_871324 ?auto_871329 ) ) ( not ( = ?auto_871324 ?auto_871330 ) ) ( not ( = ?auto_871324 ?auto_871331 ) ) ( not ( = ?auto_871324 ?auto_871332 ) ) ( not ( = ?auto_871324 ?auto_871333 ) ) ( not ( = ?auto_871324 ?auto_871334 ) ) ( not ( = ?auto_871324 ?auto_871335 ) ) ( not ( = ?auto_871324 ?auto_871336 ) ) ( not ( = ?auto_871324 ?auto_871337 ) ) ( not ( = ?auto_871324 ?auto_871338 ) ) ( not ( = ?auto_871324 ?auto_871339 ) ) ( not ( = ?auto_871324 ?auto_871340 ) ) ( not ( = ?auto_871324 ?auto_871341 ) ) ( not ( = ?auto_871324 ?auto_871342 ) ) ( not ( = ?auto_871325 ?auto_871326 ) ) ( not ( = ?auto_871325 ?auto_871327 ) ) ( not ( = ?auto_871325 ?auto_871328 ) ) ( not ( = ?auto_871325 ?auto_871329 ) ) ( not ( = ?auto_871325 ?auto_871330 ) ) ( not ( = ?auto_871325 ?auto_871331 ) ) ( not ( = ?auto_871325 ?auto_871332 ) ) ( not ( = ?auto_871325 ?auto_871333 ) ) ( not ( = ?auto_871325 ?auto_871334 ) ) ( not ( = ?auto_871325 ?auto_871335 ) ) ( not ( = ?auto_871325 ?auto_871336 ) ) ( not ( = ?auto_871325 ?auto_871337 ) ) ( not ( = ?auto_871325 ?auto_871338 ) ) ( not ( = ?auto_871325 ?auto_871339 ) ) ( not ( = ?auto_871325 ?auto_871340 ) ) ( not ( = ?auto_871325 ?auto_871341 ) ) ( not ( = ?auto_871325 ?auto_871342 ) ) ( not ( = ?auto_871326 ?auto_871327 ) ) ( not ( = ?auto_871326 ?auto_871328 ) ) ( not ( = ?auto_871326 ?auto_871329 ) ) ( not ( = ?auto_871326 ?auto_871330 ) ) ( not ( = ?auto_871326 ?auto_871331 ) ) ( not ( = ?auto_871326 ?auto_871332 ) ) ( not ( = ?auto_871326 ?auto_871333 ) ) ( not ( = ?auto_871326 ?auto_871334 ) ) ( not ( = ?auto_871326 ?auto_871335 ) ) ( not ( = ?auto_871326 ?auto_871336 ) ) ( not ( = ?auto_871326 ?auto_871337 ) ) ( not ( = ?auto_871326 ?auto_871338 ) ) ( not ( = ?auto_871326 ?auto_871339 ) ) ( not ( = ?auto_871326 ?auto_871340 ) ) ( not ( = ?auto_871326 ?auto_871341 ) ) ( not ( = ?auto_871326 ?auto_871342 ) ) ( not ( = ?auto_871327 ?auto_871328 ) ) ( not ( = ?auto_871327 ?auto_871329 ) ) ( not ( = ?auto_871327 ?auto_871330 ) ) ( not ( = ?auto_871327 ?auto_871331 ) ) ( not ( = ?auto_871327 ?auto_871332 ) ) ( not ( = ?auto_871327 ?auto_871333 ) ) ( not ( = ?auto_871327 ?auto_871334 ) ) ( not ( = ?auto_871327 ?auto_871335 ) ) ( not ( = ?auto_871327 ?auto_871336 ) ) ( not ( = ?auto_871327 ?auto_871337 ) ) ( not ( = ?auto_871327 ?auto_871338 ) ) ( not ( = ?auto_871327 ?auto_871339 ) ) ( not ( = ?auto_871327 ?auto_871340 ) ) ( not ( = ?auto_871327 ?auto_871341 ) ) ( not ( = ?auto_871327 ?auto_871342 ) ) ( not ( = ?auto_871328 ?auto_871329 ) ) ( not ( = ?auto_871328 ?auto_871330 ) ) ( not ( = ?auto_871328 ?auto_871331 ) ) ( not ( = ?auto_871328 ?auto_871332 ) ) ( not ( = ?auto_871328 ?auto_871333 ) ) ( not ( = ?auto_871328 ?auto_871334 ) ) ( not ( = ?auto_871328 ?auto_871335 ) ) ( not ( = ?auto_871328 ?auto_871336 ) ) ( not ( = ?auto_871328 ?auto_871337 ) ) ( not ( = ?auto_871328 ?auto_871338 ) ) ( not ( = ?auto_871328 ?auto_871339 ) ) ( not ( = ?auto_871328 ?auto_871340 ) ) ( not ( = ?auto_871328 ?auto_871341 ) ) ( not ( = ?auto_871328 ?auto_871342 ) ) ( not ( = ?auto_871329 ?auto_871330 ) ) ( not ( = ?auto_871329 ?auto_871331 ) ) ( not ( = ?auto_871329 ?auto_871332 ) ) ( not ( = ?auto_871329 ?auto_871333 ) ) ( not ( = ?auto_871329 ?auto_871334 ) ) ( not ( = ?auto_871329 ?auto_871335 ) ) ( not ( = ?auto_871329 ?auto_871336 ) ) ( not ( = ?auto_871329 ?auto_871337 ) ) ( not ( = ?auto_871329 ?auto_871338 ) ) ( not ( = ?auto_871329 ?auto_871339 ) ) ( not ( = ?auto_871329 ?auto_871340 ) ) ( not ( = ?auto_871329 ?auto_871341 ) ) ( not ( = ?auto_871329 ?auto_871342 ) ) ( not ( = ?auto_871330 ?auto_871331 ) ) ( not ( = ?auto_871330 ?auto_871332 ) ) ( not ( = ?auto_871330 ?auto_871333 ) ) ( not ( = ?auto_871330 ?auto_871334 ) ) ( not ( = ?auto_871330 ?auto_871335 ) ) ( not ( = ?auto_871330 ?auto_871336 ) ) ( not ( = ?auto_871330 ?auto_871337 ) ) ( not ( = ?auto_871330 ?auto_871338 ) ) ( not ( = ?auto_871330 ?auto_871339 ) ) ( not ( = ?auto_871330 ?auto_871340 ) ) ( not ( = ?auto_871330 ?auto_871341 ) ) ( not ( = ?auto_871330 ?auto_871342 ) ) ( not ( = ?auto_871331 ?auto_871332 ) ) ( not ( = ?auto_871331 ?auto_871333 ) ) ( not ( = ?auto_871331 ?auto_871334 ) ) ( not ( = ?auto_871331 ?auto_871335 ) ) ( not ( = ?auto_871331 ?auto_871336 ) ) ( not ( = ?auto_871331 ?auto_871337 ) ) ( not ( = ?auto_871331 ?auto_871338 ) ) ( not ( = ?auto_871331 ?auto_871339 ) ) ( not ( = ?auto_871331 ?auto_871340 ) ) ( not ( = ?auto_871331 ?auto_871341 ) ) ( not ( = ?auto_871331 ?auto_871342 ) ) ( not ( = ?auto_871332 ?auto_871333 ) ) ( not ( = ?auto_871332 ?auto_871334 ) ) ( not ( = ?auto_871332 ?auto_871335 ) ) ( not ( = ?auto_871332 ?auto_871336 ) ) ( not ( = ?auto_871332 ?auto_871337 ) ) ( not ( = ?auto_871332 ?auto_871338 ) ) ( not ( = ?auto_871332 ?auto_871339 ) ) ( not ( = ?auto_871332 ?auto_871340 ) ) ( not ( = ?auto_871332 ?auto_871341 ) ) ( not ( = ?auto_871332 ?auto_871342 ) ) ( not ( = ?auto_871333 ?auto_871334 ) ) ( not ( = ?auto_871333 ?auto_871335 ) ) ( not ( = ?auto_871333 ?auto_871336 ) ) ( not ( = ?auto_871333 ?auto_871337 ) ) ( not ( = ?auto_871333 ?auto_871338 ) ) ( not ( = ?auto_871333 ?auto_871339 ) ) ( not ( = ?auto_871333 ?auto_871340 ) ) ( not ( = ?auto_871333 ?auto_871341 ) ) ( not ( = ?auto_871333 ?auto_871342 ) ) ( not ( = ?auto_871334 ?auto_871335 ) ) ( not ( = ?auto_871334 ?auto_871336 ) ) ( not ( = ?auto_871334 ?auto_871337 ) ) ( not ( = ?auto_871334 ?auto_871338 ) ) ( not ( = ?auto_871334 ?auto_871339 ) ) ( not ( = ?auto_871334 ?auto_871340 ) ) ( not ( = ?auto_871334 ?auto_871341 ) ) ( not ( = ?auto_871334 ?auto_871342 ) ) ( not ( = ?auto_871335 ?auto_871336 ) ) ( not ( = ?auto_871335 ?auto_871337 ) ) ( not ( = ?auto_871335 ?auto_871338 ) ) ( not ( = ?auto_871335 ?auto_871339 ) ) ( not ( = ?auto_871335 ?auto_871340 ) ) ( not ( = ?auto_871335 ?auto_871341 ) ) ( not ( = ?auto_871335 ?auto_871342 ) ) ( not ( = ?auto_871336 ?auto_871337 ) ) ( not ( = ?auto_871336 ?auto_871338 ) ) ( not ( = ?auto_871336 ?auto_871339 ) ) ( not ( = ?auto_871336 ?auto_871340 ) ) ( not ( = ?auto_871336 ?auto_871341 ) ) ( not ( = ?auto_871336 ?auto_871342 ) ) ( not ( = ?auto_871337 ?auto_871338 ) ) ( not ( = ?auto_871337 ?auto_871339 ) ) ( not ( = ?auto_871337 ?auto_871340 ) ) ( not ( = ?auto_871337 ?auto_871341 ) ) ( not ( = ?auto_871337 ?auto_871342 ) ) ( not ( = ?auto_871338 ?auto_871339 ) ) ( not ( = ?auto_871338 ?auto_871340 ) ) ( not ( = ?auto_871338 ?auto_871341 ) ) ( not ( = ?auto_871338 ?auto_871342 ) ) ( not ( = ?auto_871339 ?auto_871340 ) ) ( not ( = ?auto_871339 ?auto_871341 ) ) ( not ( = ?auto_871339 ?auto_871342 ) ) ( not ( = ?auto_871340 ?auto_871341 ) ) ( not ( = ?auto_871340 ?auto_871342 ) ) ( not ( = ?auto_871341 ?auto_871342 ) ) ( ON ?auto_871340 ?auto_871341 ) ( ON ?auto_871339 ?auto_871340 ) ( ON ?auto_871338 ?auto_871339 ) ( ON ?auto_871337 ?auto_871338 ) ( ON ?auto_871336 ?auto_871337 ) ( ON ?auto_871335 ?auto_871336 ) ( ON ?auto_871334 ?auto_871335 ) ( ON ?auto_871333 ?auto_871334 ) ( ON ?auto_871332 ?auto_871333 ) ( ON ?auto_871331 ?auto_871332 ) ( ON ?auto_871330 ?auto_871331 ) ( ON ?auto_871329 ?auto_871330 ) ( ON ?auto_871328 ?auto_871329 ) ( CLEAR ?auto_871326 ) ( ON ?auto_871327 ?auto_871328 ) ( CLEAR ?auto_871327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_871324 ?auto_871325 ?auto_871326 ?auto_871327 )
      ( MAKE-18PILE ?auto_871324 ?auto_871325 ?auto_871326 ?auto_871327 ?auto_871328 ?auto_871329 ?auto_871330 ?auto_871331 ?auto_871332 ?auto_871333 ?auto_871334 ?auto_871335 ?auto_871336 ?auto_871337 ?auto_871338 ?auto_871339 ?auto_871340 ?auto_871341 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871361 - BLOCK
      ?auto_871362 - BLOCK
      ?auto_871363 - BLOCK
      ?auto_871364 - BLOCK
      ?auto_871365 - BLOCK
      ?auto_871366 - BLOCK
      ?auto_871367 - BLOCK
      ?auto_871368 - BLOCK
      ?auto_871369 - BLOCK
      ?auto_871370 - BLOCK
      ?auto_871371 - BLOCK
      ?auto_871372 - BLOCK
      ?auto_871373 - BLOCK
      ?auto_871374 - BLOCK
      ?auto_871375 - BLOCK
      ?auto_871376 - BLOCK
      ?auto_871377 - BLOCK
      ?auto_871378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871378 ) ( ON-TABLE ?auto_871361 ) ( ON ?auto_871362 ?auto_871361 ) ( ON ?auto_871363 ?auto_871362 ) ( not ( = ?auto_871361 ?auto_871362 ) ) ( not ( = ?auto_871361 ?auto_871363 ) ) ( not ( = ?auto_871361 ?auto_871364 ) ) ( not ( = ?auto_871361 ?auto_871365 ) ) ( not ( = ?auto_871361 ?auto_871366 ) ) ( not ( = ?auto_871361 ?auto_871367 ) ) ( not ( = ?auto_871361 ?auto_871368 ) ) ( not ( = ?auto_871361 ?auto_871369 ) ) ( not ( = ?auto_871361 ?auto_871370 ) ) ( not ( = ?auto_871361 ?auto_871371 ) ) ( not ( = ?auto_871361 ?auto_871372 ) ) ( not ( = ?auto_871361 ?auto_871373 ) ) ( not ( = ?auto_871361 ?auto_871374 ) ) ( not ( = ?auto_871361 ?auto_871375 ) ) ( not ( = ?auto_871361 ?auto_871376 ) ) ( not ( = ?auto_871361 ?auto_871377 ) ) ( not ( = ?auto_871361 ?auto_871378 ) ) ( not ( = ?auto_871362 ?auto_871363 ) ) ( not ( = ?auto_871362 ?auto_871364 ) ) ( not ( = ?auto_871362 ?auto_871365 ) ) ( not ( = ?auto_871362 ?auto_871366 ) ) ( not ( = ?auto_871362 ?auto_871367 ) ) ( not ( = ?auto_871362 ?auto_871368 ) ) ( not ( = ?auto_871362 ?auto_871369 ) ) ( not ( = ?auto_871362 ?auto_871370 ) ) ( not ( = ?auto_871362 ?auto_871371 ) ) ( not ( = ?auto_871362 ?auto_871372 ) ) ( not ( = ?auto_871362 ?auto_871373 ) ) ( not ( = ?auto_871362 ?auto_871374 ) ) ( not ( = ?auto_871362 ?auto_871375 ) ) ( not ( = ?auto_871362 ?auto_871376 ) ) ( not ( = ?auto_871362 ?auto_871377 ) ) ( not ( = ?auto_871362 ?auto_871378 ) ) ( not ( = ?auto_871363 ?auto_871364 ) ) ( not ( = ?auto_871363 ?auto_871365 ) ) ( not ( = ?auto_871363 ?auto_871366 ) ) ( not ( = ?auto_871363 ?auto_871367 ) ) ( not ( = ?auto_871363 ?auto_871368 ) ) ( not ( = ?auto_871363 ?auto_871369 ) ) ( not ( = ?auto_871363 ?auto_871370 ) ) ( not ( = ?auto_871363 ?auto_871371 ) ) ( not ( = ?auto_871363 ?auto_871372 ) ) ( not ( = ?auto_871363 ?auto_871373 ) ) ( not ( = ?auto_871363 ?auto_871374 ) ) ( not ( = ?auto_871363 ?auto_871375 ) ) ( not ( = ?auto_871363 ?auto_871376 ) ) ( not ( = ?auto_871363 ?auto_871377 ) ) ( not ( = ?auto_871363 ?auto_871378 ) ) ( not ( = ?auto_871364 ?auto_871365 ) ) ( not ( = ?auto_871364 ?auto_871366 ) ) ( not ( = ?auto_871364 ?auto_871367 ) ) ( not ( = ?auto_871364 ?auto_871368 ) ) ( not ( = ?auto_871364 ?auto_871369 ) ) ( not ( = ?auto_871364 ?auto_871370 ) ) ( not ( = ?auto_871364 ?auto_871371 ) ) ( not ( = ?auto_871364 ?auto_871372 ) ) ( not ( = ?auto_871364 ?auto_871373 ) ) ( not ( = ?auto_871364 ?auto_871374 ) ) ( not ( = ?auto_871364 ?auto_871375 ) ) ( not ( = ?auto_871364 ?auto_871376 ) ) ( not ( = ?auto_871364 ?auto_871377 ) ) ( not ( = ?auto_871364 ?auto_871378 ) ) ( not ( = ?auto_871365 ?auto_871366 ) ) ( not ( = ?auto_871365 ?auto_871367 ) ) ( not ( = ?auto_871365 ?auto_871368 ) ) ( not ( = ?auto_871365 ?auto_871369 ) ) ( not ( = ?auto_871365 ?auto_871370 ) ) ( not ( = ?auto_871365 ?auto_871371 ) ) ( not ( = ?auto_871365 ?auto_871372 ) ) ( not ( = ?auto_871365 ?auto_871373 ) ) ( not ( = ?auto_871365 ?auto_871374 ) ) ( not ( = ?auto_871365 ?auto_871375 ) ) ( not ( = ?auto_871365 ?auto_871376 ) ) ( not ( = ?auto_871365 ?auto_871377 ) ) ( not ( = ?auto_871365 ?auto_871378 ) ) ( not ( = ?auto_871366 ?auto_871367 ) ) ( not ( = ?auto_871366 ?auto_871368 ) ) ( not ( = ?auto_871366 ?auto_871369 ) ) ( not ( = ?auto_871366 ?auto_871370 ) ) ( not ( = ?auto_871366 ?auto_871371 ) ) ( not ( = ?auto_871366 ?auto_871372 ) ) ( not ( = ?auto_871366 ?auto_871373 ) ) ( not ( = ?auto_871366 ?auto_871374 ) ) ( not ( = ?auto_871366 ?auto_871375 ) ) ( not ( = ?auto_871366 ?auto_871376 ) ) ( not ( = ?auto_871366 ?auto_871377 ) ) ( not ( = ?auto_871366 ?auto_871378 ) ) ( not ( = ?auto_871367 ?auto_871368 ) ) ( not ( = ?auto_871367 ?auto_871369 ) ) ( not ( = ?auto_871367 ?auto_871370 ) ) ( not ( = ?auto_871367 ?auto_871371 ) ) ( not ( = ?auto_871367 ?auto_871372 ) ) ( not ( = ?auto_871367 ?auto_871373 ) ) ( not ( = ?auto_871367 ?auto_871374 ) ) ( not ( = ?auto_871367 ?auto_871375 ) ) ( not ( = ?auto_871367 ?auto_871376 ) ) ( not ( = ?auto_871367 ?auto_871377 ) ) ( not ( = ?auto_871367 ?auto_871378 ) ) ( not ( = ?auto_871368 ?auto_871369 ) ) ( not ( = ?auto_871368 ?auto_871370 ) ) ( not ( = ?auto_871368 ?auto_871371 ) ) ( not ( = ?auto_871368 ?auto_871372 ) ) ( not ( = ?auto_871368 ?auto_871373 ) ) ( not ( = ?auto_871368 ?auto_871374 ) ) ( not ( = ?auto_871368 ?auto_871375 ) ) ( not ( = ?auto_871368 ?auto_871376 ) ) ( not ( = ?auto_871368 ?auto_871377 ) ) ( not ( = ?auto_871368 ?auto_871378 ) ) ( not ( = ?auto_871369 ?auto_871370 ) ) ( not ( = ?auto_871369 ?auto_871371 ) ) ( not ( = ?auto_871369 ?auto_871372 ) ) ( not ( = ?auto_871369 ?auto_871373 ) ) ( not ( = ?auto_871369 ?auto_871374 ) ) ( not ( = ?auto_871369 ?auto_871375 ) ) ( not ( = ?auto_871369 ?auto_871376 ) ) ( not ( = ?auto_871369 ?auto_871377 ) ) ( not ( = ?auto_871369 ?auto_871378 ) ) ( not ( = ?auto_871370 ?auto_871371 ) ) ( not ( = ?auto_871370 ?auto_871372 ) ) ( not ( = ?auto_871370 ?auto_871373 ) ) ( not ( = ?auto_871370 ?auto_871374 ) ) ( not ( = ?auto_871370 ?auto_871375 ) ) ( not ( = ?auto_871370 ?auto_871376 ) ) ( not ( = ?auto_871370 ?auto_871377 ) ) ( not ( = ?auto_871370 ?auto_871378 ) ) ( not ( = ?auto_871371 ?auto_871372 ) ) ( not ( = ?auto_871371 ?auto_871373 ) ) ( not ( = ?auto_871371 ?auto_871374 ) ) ( not ( = ?auto_871371 ?auto_871375 ) ) ( not ( = ?auto_871371 ?auto_871376 ) ) ( not ( = ?auto_871371 ?auto_871377 ) ) ( not ( = ?auto_871371 ?auto_871378 ) ) ( not ( = ?auto_871372 ?auto_871373 ) ) ( not ( = ?auto_871372 ?auto_871374 ) ) ( not ( = ?auto_871372 ?auto_871375 ) ) ( not ( = ?auto_871372 ?auto_871376 ) ) ( not ( = ?auto_871372 ?auto_871377 ) ) ( not ( = ?auto_871372 ?auto_871378 ) ) ( not ( = ?auto_871373 ?auto_871374 ) ) ( not ( = ?auto_871373 ?auto_871375 ) ) ( not ( = ?auto_871373 ?auto_871376 ) ) ( not ( = ?auto_871373 ?auto_871377 ) ) ( not ( = ?auto_871373 ?auto_871378 ) ) ( not ( = ?auto_871374 ?auto_871375 ) ) ( not ( = ?auto_871374 ?auto_871376 ) ) ( not ( = ?auto_871374 ?auto_871377 ) ) ( not ( = ?auto_871374 ?auto_871378 ) ) ( not ( = ?auto_871375 ?auto_871376 ) ) ( not ( = ?auto_871375 ?auto_871377 ) ) ( not ( = ?auto_871375 ?auto_871378 ) ) ( not ( = ?auto_871376 ?auto_871377 ) ) ( not ( = ?auto_871376 ?auto_871378 ) ) ( not ( = ?auto_871377 ?auto_871378 ) ) ( ON ?auto_871377 ?auto_871378 ) ( ON ?auto_871376 ?auto_871377 ) ( ON ?auto_871375 ?auto_871376 ) ( ON ?auto_871374 ?auto_871375 ) ( ON ?auto_871373 ?auto_871374 ) ( ON ?auto_871372 ?auto_871373 ) ( ON ?auto_871371 ?auto_871372 ) ( ON ?auto_871370 ?auto_871371 ) ( ON ?auto_871369 ?auto_871370 ) ( ON ?auto_871368 ?auto_871369 ) ( ON ?auto_871367 ?auto_871368 ) ( ON ?auto_871366 ?auto_871367 ) ( ON ?auto_871365 ?auto_871366 ) ( CLEAR ?auto_871363 ) ( ON ?auto_871364 ?auto_871365 ) ( CLEAR ?auto_871364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_871361 ?auto_871362 ?auto_871363 ?auto_871364 )
      ( MAKE-18PILE ?auto_871361 ?auto_871362 ?auto_871363 ?auto_871364 ?auto_871365 ?auto_871366 ?auto_871367 ?auto_871368 ?auto_871369 ?auto_871370 ?auto_871371 ?auto_871372 ?auto_871373 ?auto_871374 ?auto_871375 ?auto_871376 ?auto_871377 ?auto_871378 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871397 - BLOCK
      ?auto_871398 - BLOCK
      ?auto_871399 - BLOCK
      ?auto_871400 - BLOCK
      ?auto_871401 - BLOCK
      ?auto_871402 - BLOCK
      ?auto_871403 - BLOCK
      ?auto_871404 - BLOCK
      ?auto_871405 - BLOCK
      ?auto_871406 - BLOCK
      ?auto_871407 - BLOCK
      ?auto_871408 - BLOCK
      ?auto_871409 - BLOCK
      ?auto_871410 - BLOCK
      ?auto_871411 - BLOCK
      ?auto_871412 - BLOCK
      ?auto_871413 - BLOCK
      ?auto_871414 - BLOCK
    )
    :vars
    (
      ?auto_871415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871414 ?auto_871415 ) ( ON-TABLE ?auto_871397 ) ( ON ?auto_871398 ?auto_871397 ) ( not ( = ?auto_871397 ?auto_871398 ) ) ( not ( = ?auto_871397 ?auto_871399 ) ) ( not ( = ?auto_871397 ?auto_871400 ) ) ( not ( = ?auto_871397 ?auto_871401 ) ) ( not ( = ?auto_871397 ?auto_871402 ) ) ( not ( = ?auto_871397 ?auto_871403 ) ) ( not ( = ?auto_871397 ?auto_871404 ) ) ( not ( = ?auto_871397 ?auto_871405 ) ) ( not ( = ?auto_871397 ?auto_871406 ) ) ( not ( = ?auto_871397 ?auto_871407 ) ) ( not ( = ?auto_871397 ?auto_871408 ) ) ( not ( = ?auto_871397 ?auto_871409 ) ) ( not ( = ?auto_871397 ?auto_871410 ) ) ( not ( = ?auto_871397 ?auto_871411 ) ) ( not ( = ?auto_871397 ?auto_871412 ) ) ( not ( = ?auto_871397 ?auto_871413 ) ) ( not ( = ?auto_871397 ?auto_871414 ) ) ( not ( = ?auto_871397 ?auto_871415 ) ) ( not ( = ?auto_871398 ?auto_871399 ) ) ( not ( = ?auto_871398 ?auto_871400 ) ) ( not ( = ?auto_871398 ?auto_871401 ) ) ( not ( = ?auto_871398 ?auto_871402 ) ) ( not ( = ?auto_871398 ?auto_871403 ) ) ( not ( = ?auto_871398 ?auto_871404 ) ) ( not ( = ?auto_871398 ?auto_871405 ) ) ( not ( = ?auto_871398 ?auto_871406 ) ) ( not ( = ?auto_871398 ?auto_871407 ) ) ( not ( = ?auto_871398 ?auto_871408 ) ) ( not ( = ?auto_871398 ?auto_871409 ) ) ( not ( = ?auto_871398 ?auto_871410 ) ) ( not ( = ?auto_871398 ?auto_871411 ) ) ( not ( = ?auto_871398 ?auto_871412 ) ) ( not ( = ?auto_871398 ?auto_871413 ) ) ( not ( = ?auto_871398 ?auto_871414 ) ) ( not ( = ?auto_871398 ?auto_871415 ) ) ( not ( = ?auto_871399 ?auto_871400 ) ) ( not ( = ?auto_871399 ?auto_871401 ) ) ( not ( = ?auto_871399 ?auto_871402 ) ) ( not ( = ?auto_871399 ?auto_871403 ) ) ( not ( = ?auto_871399 ?auto_871404 ) ) ( not ( = ?auto_871399 ?auto_871405 ) ) ( not ( = ?auto_871399 ?auto_871406 ) ) ( not ( = ?auto_871399 ?auto_871407 ) ) ( not ( = ?auto_871399 ?auto_871408 ) ) ( not ( = ?auto_871399 ?auto_871409 ) ) ( not ( = ?auto_871399 ?auto_871410 ) ) ( not ( = ?auto_871399 ?auto_871411 ) ) ( not ( = ?auto_871399 ?auto_871412 ) ) ( not ( = ?auto_871399 ?auto_871413 ) ) ( not ( = ?auto_871399 ?auto_871414 ) ) ( not ( = ?auto_871399 ?auto_871415 ) ) ( not ( = ?auto_871400 ?auto_871401 ) ) ( not ( = ?auto_871400 ?auto_871402 ) ) ( not ( = ?auto_871400 ?auto_871403 ) ) ( not ( = ?auto_871400 ?auto_871404 ) ) ( not ( = ?auto_871400 ?auto_871405 ) ) ( not ( = ?auto_871400 ?auto_871406 ) ) ( not ( = ?auto_871400 ?auto_871407 ) ) ( not ( = ?auto_871400 ?auto_871408 ) ) ( not ( = ?auto_871400 ?auto_871409 ) ) ( not ( = ?auto_871400 ?auto_871410 ) ) ( not ( = ?auto_871400 ?auto_871411 ) ) ( not ( = ?auto_871400 ?auto_871412 ) ) ( not ( = ?auto_871400 ?auto_871413 ) ) ( not ( = ?auto_871400 ?auto_871414 ) ) ( not ( = ?auto_871400 ?auto_871415 ) ) ( not ( = ?auto_871401 ?auto_871402 ) ) ( not ( = ?auto_871401 ?auto_871403 ) ) ( not ( = ?auto_871401 ?auto_871404 ) ) ( not ( = ?auto_871401 ?auto_871405 ) ) ( not ( = ?auto_871401 ?auto_871406 ) ) ( not ( = ?auto_871401 ?auto_871407 ) ) ( not ( = ?auto_871401 ?auto_871408 ) ) ( not ( = ?auto_871401 ?auto_871409 ) ) ( not ( = ?auto_871401 ?auto_871410 ) ) ( not ( = ?auto_871401 ?auto_871411 ) ) ( not ( = ?auto_871401 ?auto_871412 ) ) ( not ( = ?auto_871401 ?auto_871413 ) ) ( not ( = ?auto_871401 ?auto_871414 ) ) ( not ( = ?auto_871401 ?auto_871415 ) ) ( not ( = ?auto_871402 ?auto_871403 ) ) ( not ( = ?auto_871402 ?auto_871404 ) ) ( not ( = ?auto_871402 ?auto_871405 ) ) ( not ( = ?auto_871402 ?auto_871406 ) ) ( not ( = ?auto_871402 ?auto_871407 ) ) ( not ( = ?auto_871402 ?auto_871408 ) ) ( not ( = ?auto_871402 ?auto_871409 ) ) ( not ( = ?auto_871402 ?auto_871410 ) ) ( not ( = ?auto_871402 ?auto_871411 ) ) ( not ( = ?auto_871402 ?auto_871412 ) ) ( not ( = ?auto_871402 ?auto_871413 ) ) ( not ( = ?auto_871402 ?auto_871414 ) ) ( not ( = ?auto_871402 ?auto_871415 ) ) ( not ( = ?auto_871403 ?auto_871404 ) ) ( not ( = ?auto_871403 ?auto_871405 ) ) ( not ( = ?auto_871403 ?auto_871406 ) ) ( not ( = ?auto_871403 ?auto_871407 ) ) ( not ( = ?auto_871403 ?auto_871408 ) ) ( not ( = ?auto_871403 ?auto_871409 ) ) ( not ( = ?auto_871403 ?auto_871410 ) ) ( not ( = ?auto_871403 ?auto_871411 ) ) ( not ( = ?auto_871403 ?auto_871412 ) ) ( not ( = ?auto_871403 ?auto_871413 ) ) ( not ( = ?auto_871403 ?auto_871414 ) ) ( not ( = ?auto_871403 ?auto_871415 ) ) ( not ( = ?auto_871404 ?auto_871405 ) ) ( not ( = ?auto_871404 ?auto_871406 ) ) ( not ( = ?auto_871404 ?auto_871407 ) ) ( not ( = ?auto_871404 ?auto_871408 ) ) ( not ( = ?auto_871404 ?auto_871409 ) ) ( not ( = ?auto_871404 ?auto_871410 ) ) ( not ( = ?auto_871404 ?auto_871411 ) ) ( not ( = ?auto_871404 ?auto_871412 ) ) ( not ( = ?auto_871404 ?auto_871413 ) ) ( not ( = ?auto_871404 ?auto_871414 ) ) ( not ( = ?auto_871404 ?auto_871415 ) ) ( not ( = ?auto_871405 ?auto_871406 ) ) ( not ( = ?auto_871405 ?auto_871407 ) ) ( not ( = ?auto_871405 ?auto_871408 ) ) ( not ( = ?auto_871405 ?auto_871409 ) ) ( not ( = ?auto_871405 ?auto_871410 ) ) ( not ( = ?auto_871405 ?auto_871411 ) ) ( not ( = ?auto_871405 ?auto_871412 ) ) ( not ( = ?auto_871405 ?auto_871413 ) ) ( not ( = ?auto_871405 ?auto_871414 ) ) ( not ( = ?auto_871405 ?auto_871415 ) ) ( not ( = ?auto_871406 ?auto_871407 ) ) ( not ( = ?auto_871406 ?auto_871408 ) ) ( not ( = ?auto_871406 ?auto_871409 ) ) ( not ( = ?auto_871406 ?auto_871410 ) ) ( not ( = ?auto_871406 ?auto_871411 ) ) ( not ( = ?auto_871406 ?auto_871412 ) ) ( not ( = ?auto_871406 ?auto_871413 ) ) ( not ( = ?auto_871406 ?auto_871414 ) ) ( not ( = ?auto_871406 ?auto_871415 ) ) ( not ( = ?auto_871407 ?auto_871408 ) ) ( not ( = ?auto_871407 ?auto_871409 ) ) ( not ( = ?auto_871407 ?auto_871410 ) ) ( not ( = ?auto_871407 ?auto_871411 ) ) ( not ( = ?auto_871407 ?auto_871412 ) ) ( not ( = ?auto_871407 ?auto_871413 ) ) ( not ( = ?auto_871407 ?auto_871414 ) ) ( not ( = ?auto_871407 ?auto_871415 ) ) ( not ( = ?auto_871408 ?auto_871409 ) ) ( not ( = ?auto_871408 ?auto_871410 ) ) ( not ( = ?auto_871408 ?auto_871411 ) ) ( not ( = ?auto_871408 ?auto_871412 ) ) ( not ( = ?auto_871408 ?auto_871413 ) ) ( not ( = ?auto_871408 ?auto_871414 ) ) ( not ( = ?auto_871408 ?auto_871415 ) ) ( not ( = ?auto_871409 ?auto_871410 ) ) ( not ( = ?auto_871409 ?auto_871411 ) ) ( not ( = ?auto_871409 ?auto_871412 ) ) ( not ( = ?auto_871409 ?auto_871413 ) ) ( not ( = ?auto_871409 ?auto_871414 ) ) ( not ( = ?auto_871409 ?auto_871415 ) ) ( not ( = ?auto_871410 ?auto_871411 ) ) ( not ( = ?auto_871410 ?auto_871412 ) ) ( not ( = ?auto_871410 ?auto_871413 ) ) ( not ( = ?auto_871410 ?auto_871414 ) ) ( not ( = ?auto_871410 ?auto_871415 ) ) ( not ( = ?auto_871411 ?auto_871412 ) ) ( not ( = ?auto_871411 ?auto_871413 ) ) ( not ( = ?auto_871411 ?auto_871414 ) ) ( not ( = ?auto_871411 ?auto_871415 ) ) ( not ( = ?auto_871412 ?auto_871413 ) ) ( not ( = ?auto_871412 ?auto_871414 ) ) ( not ( = ?auto_871412 ?auto_871415 ) ) ( not ( = ?auto_871413 ?auto_871414 ) ) ( not ( = ?auto_871413 ?auto_871415 ) ) ( not ( = ?auto_871414 ?auto_871415 ) ) ( ON ?auto_871413 ?auto_871414 ) ( ON ?auto_871412 ?auto_871413 ) ( ON ?auto_871411 ?auto_871412 ) ( ON ?auto_871410 ?auto_871411 ) ( ON ?auto_871409 ?auto_871410 ) ( ON ?auto_871408 ?auto_871409 ) ( ON ?auto_871407 ?auto_871408 ) ( ON ?auto_871406 ?auto_871407 ) ( ON ?auto_871405 ?auto_871406 ) ( ON ?auto_871404 ?auto_871405 ) ( ON ?auto_871403 ?auto_871404 ) ( ON ?auto_871402 ?auto_871403 ) ( ON ?auto_871401 ?auto_871402 ) ( ON ?auto_871400 ?auto_871401 ) ( CLEAR ?auto_871398 ) ( ON ?auto_871399 ?auto_871400 ) ( CLEAR ?auto_871399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_871397 ?auto_871398 ?auto_871399 )
      ( MAKE-18PILE ?auto_871397 ?auto_871398 ?auto_871399 ?auto_871400 ?auto_871401 ?auto_871402 ?auto_871403 ?auto_871404 ?auto_871405 ?auto_871406 ?auto_871407 ?auto_871408 ?auto_871409 ?auto_871410 ?auto_871411 ?auto_871412 ?auto_871413 ?auto_871414 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871434 - BLOCK
      ?auto_871435 - BLOCK
      ?auto_871436 - BLOCK
      ?auto_871437 - BLOCK
      ?auto_871438 - BLOCK
      ?auto_871439 - BLOCK
      ?auto_871440 - BLOCK
      ?auto_871441 - BLOCK
      ?auto_871442 - BLOCK
      ?auto_871443 - BLOCK
      ?auto_871444 - BLOCK
      ?auto_871445 - BLOCK
      ?auto_871446 - BLOCK
      ?auto_871447 - BLOCK
      ?auto_871448 - BLOCK
      ?auto_871449 - BLOCK
      ?auto_871450 - BLOCK
      ?auto_871451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871451 ) ( ON-TABLE ?auto_871434 ) ( ON ?auto_871435 ?auto_871434 ) ( not ( = ?auto_871434 ?auto_871435 ) ) ( not ( = ?auto_871434 ?auto_871436 ) ) ( not ( = ?auto_871434 ?auto_871437 ) ) ( not ( = ?auto_871434 ?auto_871438 ) ) ( not ( = ?auto_871434 ?auto_871439 ) ) ( not ( = ?auto_871434 ?auto_871440 ) ) ( not ( = ?auto_871434 ?auto_871441 ) ) ( not ( = ?auto_871434 ?auto_871442 ) ) ( not ( = ?auto_871434 ?auto_871443 ) ) ( not ( = ?auto_871434 ?auto_871444 ) ) ( not ( = ?auto_871434 ?auto_871445 ) ) ( not ( = ?auto_871434 ?auto_871446 ) ) ( not ( = ?auto_871434 ?auto_871447 ) ) ( not ( = ?auto_871434 ?auto_871448 ) ) ( not ( = ?auto_871434 ?auto_871449 ) ) ( not ( = ?auto_871434 ?auto_871450 ) ) ( not ( = ?auto_871434 ?auto_871451 ) ) ( not ( = ?auto_871435 ?auto_871436 ) ) ( not ( = ?auto_871435 ?auto_871437 ) ) ( not ( = ?auto_871435 ?auto_871438 ) ) ( not ( = ?auto_871435 ?auto_871439 ) ) ( not ( = ?auto_871435 ?auto_871440 ) ) ( not ( = ?auto_871435 ?auto_871441 ) ) ( not ( = ?auto_871435 ?auto_871442 ) ) ( not ( = ?auto_871435 ?auto_871443 ) ) ( not ( = ?auto_871435 ?auto_871444 ) ) ( not ( = ?auto_871435 ?auto_871445 ) ) ( not ( = ?auto_871435 ?auto_871446 ) ) ( not ( = ?auto_871435 ?auto_871447 ) ) ( not ( = ?auto_871435 ?auto_871448 ) ) ( not ( = ?auto_871435 ?auto_871449 ) ) ( not ( = ?auto_871435 ?auto_871450 ) ) ( not ( = ?auto_871435 ?auto_871451 ) ) ( not ( = ?auto_871436 ?auto_871437 ) ) ( not ( = ?auto_871436 ?auto_871438 ) ) ( not ( = ?auto_871436 ?auto_871439 ) ) ( not ( = ?auto_871436 ?auto_871440 ) ) ( not ( = ?auto_871436 ?auto_871441 ) ) ( not ( = ?auto_871436 ?auto_871442 ) ) ( not ( = ?auto_871436 ?auto_871443 ) ) ( not ( = ?auto_871436 ?auto_871444 ) ) ( not ( = ?auto_871436 ?auto_871445 ) ) ( not ( = ?auto_871436 ?auto_871446 ) ) ( not ( = ?auto_871436 ?auto_871447 ) ) ( not ( = ?auto_871436 ?auto_871448 ) ) ( not ( = ?auto_871436 ?auto_871449 ) ) ( not ( = ?auto_871436 ?auto_871450 ) ) ( not ( = ?auto_871436 ?auto_871451 ) ) ( not ( = ?auto_871437 ?auto_871438 ) ) ( not ( = ?auto_871437 ?auto_871439 ) ) ( not ( = ?auto_871437 ?auto_871440 ) ) ( not ( = ?auto_871437 ?auto_871441 ) ) ( not ( = ?auto_871437 ?auto_871442 ) ) ( not ( = ?auto_871437 ?auto_871443 ) ) ( not ( = ?auto_871437 ?auto_871444 ) ) ( not ( = ?auto_871437 ?auto_871445 ) ) ( not ( = ?auto_871437 ?auto_871446 ) ) ( not ( = ?auto_871437 ?auto_871447 ) ) ( not ( = ?auto_871437 ?auto_871448 ) ) ( not ( = ?auto_871437 ?auto_871449 ) ) ( not ( = ?auto_871437 ?auto_871450 ) ) ( not ( = ?auto_871437 ?auto_871451 ) ) ( not ( = ?auto_871438 ?auto_871439 ) ) ( not ( = ?auto_871438 ?auto_871440 ) ) ( not ( = ?auto_871438 ?auto_871441 ) ) ( not ( = ?auto_871438 ?auto_871442 ) ) ( not ( = ?auto_871438 ?auto_871443 ) ) ( not ( = ?auto_871438 ?auto_871444 ) ) ( not ( = ?auto_871438 ?auto_871445 ) ) ( not ( = ?auto_871438 ?auto_871446 ) ) ( not ( = ?auto_871438 ?auto_871447 ) ) ( not ( = ?auto_871438 ?auto_871448 ) ) ( not ( = ?auto_871438 ?auto_871449 ) ) ( not ( = ?auto_871438 ?auto_871450 ) ) ( not ( = ?auto_871438 ?auto_871451 ) ) ( not ( = ?auto_871439 ?auto_871440 ) ) ( not ( = ?auto_871439 ?auto_871441 ) ) ( not ( = ?auto_871439 ?auto_871442 ) ) ( not ( = ?auto_871439 ?auto_871443 ) ) ( not ( = ?auto_871439 ?auto_871444 ) ) ( not ( = ?auto_871439 ?auto_871445 ) ) ( not ( = ?auto_871439 ?auto_871446 ) ) ( not ( = ?auto_871439 ?auto_871447 ) ) ( not ( = ?auto_871439 ?auto_871448 ) ) ( not ( = ?auto_871439 ?auto_871449 ) ) ( not ( = ?auto_871439 ?auto_871450 ) ) ( not ( = ?auto_871439 ?auto_871451 ) ) ( not ( = ?auto_871440 ?auto_871441 ) ) ( not ( = ?auto_871440 ?auto_871442 ) ) ( not ( = ?auto_871440 ?auto_871443 ) ) ( not ( = ?auto_871440 ?auto_871444 ) ) ( not ( = ?auto_871440 ?auto_871445 ) ) ( not ( = ?auto_871440 ?auto_871446 ) ) ( not ( = ?auto_871440 ?auto_871447 ) ) ( not ( = ?auto_871440 ?auto_871448 ) ) ( not ( = ?auto_871440 ?auto_871449 ) ) ( not ( = ?auto_871440 ?auto_871450 ) ) ( not ( = ?auto_871440 ?auto_871451 ) ) ( not ( = ?auto_871441 ?auto_871442 ) ) ( not ( = ?auto_871441 ?auto_871443 ) ) ( not ( = ?auto_871441 ?auto_871444 ) ) ( not ( = ?auto_871441 ?auto_871445 ) ) ( not ( = ?auto_871441 ?auto_871446 ) ) ( not ( = ?auto_871441 ?auto_871447 ) ) ( not ( = ?auto_871441 ?auto_871448 ) ) ( not ( = ?auto_871441 ?auto_871449 ) ) ( not ( = ?auto_871441 ?auto_871450 ) ) ( not ( = ?auto_871441 ?auto_871451 ) ) ( not ( = ?auto_871442 ?auto_871443 ) ) ( not ( = ?auto_871442 ?auto_871444 ) ) ( not ( = ?auto_871442 ?auto_871445 ) ) ( not ( = ?auto_871442 ?auto_871446 ) ) ( not ( = ?auto_871442 ?auto_871447 ) ) ( not ( = ?auto_871442 ?auto_871448 ) ) ( not ( = ?auto_871442 ?auto_871449 ) ) ( not ( = ?auto_871442 ?auto_871450 ) ) ( not ( = ?auto_871442 ?auto_871451 ) ) ( not ( = ?auto_871443 ?auto_871444 ) ) ( not ( = ?auto_871443 ?auto_871445 ) ) ( not ( = ?auto_871443 ?auto_871446 ) ) ( not ( = ?auto_871443 ?auto_871447 ) ) ( not ( = ?auto_871443 ?auto_871448 ) ) ( not ( = ?auto_871443 ?auto_871449 ) ) ( not ( = ?auto_871443 ?auto_871450 ) ) ( not ( = ?auto_871443 ?auto_871451 ) ) ( not ( = ?auto_871444 ?auto_871445 ) ) ( not ( = ?auto_871444 ?auto_871446 ) ) ( not ( = ?auto_871444 ?auto_871447 ) ) ( not ( = ?auto_871444 ?auto_871448 ) ) ( not ( = ?auto_871444 ?auto_871449 ) ) ( not ( = ?auto_871444 ?auto_871450 ) ) ( not ( = ?auto_871444 ?auto_871451 ) ) ( not ( = ?auto_871445 ?auto_871446 ) ) ( not ( = ?auto_871445 ?auto_871447 ) ) ( not ( = ?auto_871445 ?auto_871448 ) ) ( not ( = ?auto_871445 ?auto_871449 ) ) ( not ( = ?auto_871445 ?auto_871450 ) ) ( not ( = ?auto_871445 ?auto_871451 ) ) ( not ( = ?auto_871446 ?auto_871447 ) ) ( not ( = ?auto_871446 ?auto_871448 ) ) ( not ( = ?auto_871446 ?auto_871449 ) ) ( not ( = ?auto_871446 ?auto_871450 ) ) ( not ( = ?auto_871446 ?auto_871451 ) ) ( not ( = ?auto_871447 ?auto_871448 ) ) ( not ( = ?auto_871447 ?auto_871449 ) ) ( not ( = ?auto_871447 ?auto_871450 ) ) ( not ( = ?auto_871447 ?auto_871451 ) ) ( not ( = ?auto_871448 ?auto_871449 ) ) ( not ( = ?auto_871448 ?auto_871450 ) ) ( not ( = ?auto_871448 ?auto_871451 ) ) ( not ( = ?auto_871449 ?auto_871450 ) ) ( not ( = ?auto_871449 ?auto_871451 ) ) ( not ( = ?auto_871450 ?auto_871451 ) ) ( ON ?auto_871450 ?auto_871451 ) ( ON ?auto_871449 ?auto_871450 ) ( ON ?auto_871448 ?auto_871449 ) ( ON ?auto_871447 ?auto_871448 ) ( ON ?auto_871446 ?auto_871447 ) ( ON ?auto_871445 ?auto_871446 ) ( ON ?auto_871444 ?auto_871445 ) ( ON ?auto_871443 ?auto_871444 ) ( ON ?auto_871442 ?auto_871443 ) ( ON ?auto_871441 ?auto_871442 ) ( ON ?auto_871440 ?auto_871441 ) ( ON ?auto_871439 ?auto_871440 ) ( ON ?auto_871438 ?auto_871439 ) ( ON ?auto_871437 ?auto_871438 ) ( CLEAR ?auto_871435 ) ( ON ?auto_871436 ?auto_871437 ) ( CLEAR ?auto_871436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_871434 ?auto_871435 ?auto_871436 )
      ( MAKE-18PILE ?auto_871434 ?auto_871435 ?auto_871436 ?auto_871437 ?auto_871438 ?auto_871439 ?auto_871440 ?auto_871441 ?auto_871442 ?auto_871443 ?auto_871444 ?auto_871445 ?auto_871446 ?auto_871447 ?auto_871448 ?auto_871449 ?auto_871450 ?auto_871451 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871470 - BLOCK
      ?auto_871471 - BLOCK
      ?auto_871472 - BLOCK
      ?auto_871473 - BLOCK
      ?auto_871474 - BLOCK
      ?auto_871475 - BLOCK
      ?auto_871476 - BLOCK
      ?auto_871477 - BLOCK
      ?auto_871478 - BLOCK
      ?auto_871479 - BLOCK
      ?auto_871480 - BLOCK
      ?auto_871481 - BLOCK
      ?auto_871482 - BLOCK
      ?auto_871483 - BLOCK
      ?auto_871484 - BLOCK
      ?auto_871485 - BLOCK
      ?auto_871486 - BLOCK
      ?auto_871487 - BLOCK
    )
    :vars
    (
      ?auto_871488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871487 ?auto_871488 ) ( ON-TABLE ?auto_871470 ) ( not ( = ?auto_871470 ?auto_871471 ) ) ( not ( = ?auto_871470 ?auto_871472 ) ) ( not ( = ?auto_871470 ?auto_871473 ) ) ( not ( = ?auto_871470 ?auto_871474 ) ) ( not ( = ?auto_871470 ?auto_871475 ) ) ( not ( = ?auto_871470 ?auto_871476 ) ) ( not ( = ?auto_871470 ?auto_871477 ) ) ( not ( = ?auto_871470 ?auto_871478 ) ) ( not ( = ?auto_871470 ?auto_871479 ) ) ( not ( = ?auto_871470 ?auto_871480 ) ) ( not ( = ?auto_871470 ?auto_871481 ) ) ( not ( = ?auto_871470 ?auto_871482 ) ) ( not ( = ?auto_871470 ?auto_871483 ) ) ( not ( = ?auto_871470 ?auto_871484 ) ) ( not ( = ?auto_871470 ?auto_871485 ) ) ( not ( = ?auto_871470 ?auto_871486 ) ) ( not ( = ?auto_871470 ?auto_871487 ) ) ( not ( = ?auto_871470 ?auto_871488 ) ) ( not ( = ?auto_871471 ?auto_871472 ) ) ( not ( = ?auto_871471 ?auto_871473 ) ) ( not ( = ?auto_871471 ?auto_871474 ) ) ( not ( = ?auto_871471 ?auto_871475 ) ) ( not ( = ?auto_871471 ?auto_871476 ) ) ( not ( = ?auto_871471 ?auto_871477 ) ) ( not ( = ?auto_871471 ?auto_871478 ) ) ( not ( = ?auto_871471 ?auto_871479 ) ) ( not ( = ?auto_871471 ?auto_871480 ) ) ( not ( = ?auto_871471 ?auto_871481 ) ) ( not ( = ?auto_871471 ?auto_871482 ) ) ( not ( = ?auto_871471 ?auto_871483 ) ) ( not ( = ?auto_871471 ?auto_871484 ) ) ( not ( = ?auto_871471 ?auto_871485 ) ) ( not ( = ?auto_871471 ?auto_871486 ) ) ( not ( = ?auto_871471 ?auto_871487 ) ) ( not ( = ?auto_871471 ?auto_871488 ) ) ( not ( = ?auto_871472 ?auto_871473 ) ) ( not ( = ?auto_871472 ?auto_871474 ) ) ( not ( = ?auto_871472 ?auto_871475 ) ) ( not ( = ?auto_871472 ?auto_871476 ) ) ( not ( = ?auto_871472 ?auto_871477 ) ) ( not ( = ?auto_871472 ?auto_871478 ) ) ( not ( = ?auto_871472 ?auto_871479 ) ) ( not ( = ?auto_871472 ?auto_871480 ) ) ( not ( = ?auto_871472 ?auto_871481 ) ) ( not ( = ?auto_871472 ?auto_871482 ) ) ( not ( = ?auto_871472 ?auto_871483 ) ) ( not ( = ?auto_871472 ?auto_871484 ) ) ( not ( = ?auto_871472 ?auto_871485 ) ) ( not ( = ?auto_871472 ?auto_871486 ) ) ( not ( = ?auto_871472 ?auto_871487 ) ) ( not ( = ?auto_871472 ?auto_871488 ) ) ( not ( = ?auto_871473 ?auto_871474 ) ) ( not ( = ?auto_871473 ?auto_871475 ) ) ( not ( = ?auto_871473 ?auto_871476 ) ) ( not ( = ?auto_871473 ?auto_871477 ) ) ( not ( = ?auto_871473 ?auto_871478 ) ) ( not ( = ?auto_871473 ?auto_871479 ) ) ( not ( = ?auto_871473 ?auto_871480 ) ) ( not ( = ?auto_871473 ?auto_871481 ) ) ( not ( = ?auto_871473 ?auto_871482 ) ) ( not ( = ?auto_871473 ?auto_871483 ) ) ( not ( = ?auto_871473 ?auto_871484 ) ) ( not ( = ?auto_871473 ?auto_871485 ) ) ( not ( = ?auto_871473 ?auto_871486 ) ) ( not ( = ?auto_871473 ?auto_871487 ) ) ( not ( = ?auto_871473 ?auto_871488 ) ) ( not ( = ?auto_871474 ?auto_871475 ) ) ( not ( = ?auto_871474 ?auto_871476 ) ) ( not ( = ?auto_871474 ?auto_871477 ) ) ( not ( = ?auto_871474 ?auto_871478 ) ) ( not ( = ?auto_871474 ?auto_871479 ) ) ( not ( = ?auto_871474 ?auto_871480 ) ) ( not ( = ?auto_871474 ?auto_871481 ) ) ( not ( = ?auto_871474 ?auto_871482 ) ) ( not ( = ?auto_871474 ?auto_871483 ) ) ( not ( = ?auto_871474 ?auto_871484 ) ) ( not ( = ?auto_871474 ?auto_871485 ) ) ( not ( = ?auto_871474 ?auto_871486 ) ) ( not ( = ?auto_871474 ?auto_871487 ) ) ( not ( = ?auto_871474 ?auto_871488 ) ) ( not ( = ?auto_871475 ?auto_871476 ) ) ( not ( = ?auto_871475 ?auto_871477 ) ) ( not ( = ?auto_871475 ?auto_871478 ) ) ( not ( = ?auto_871475 ?auto_871479 ) ) ( not ( = ?auto_871475 ?auto_871480 ) ) ( not ( = ?auto_871475 ?auto_871481 ) ) ( not ( = ?auto_871475 ?auto_871482 ) ) ( not ( = ?auto_871475 ?auto_871483 ) ) ( not ( = ?auto_871475 ?auto_871484 ) ) ( not ( = ?auto_871475 ?auto_871485 ) ) ( not ( = ?auto_871475 ?auto_871486 ) ) ( not ( = ?auto_871475 ?auto_871487 ) ) ( not ( = ?auto_871475 ?auto_871488 ) ) ( not ( = ?auto_871476 ?auto_871477 ) ) ( not ( = ?auto_871476 ?auto_871478 ) ) ( not ( = ?auto_871476 ?auto_871479 ) ) ( not ( = ?auto_871476 ?auto_871480 ) ) ( not ( = ?auto_871476 ?auto_871481 ) ) ( not ( = ?auto_871476 ?auto_871482 ) ) ( not ( = ?auto_871476 ?auto_871483 ) ) ( not ( = ?auto_871476 ?auto_871484 ) ) ( not ( = ?auto_871476 ?auto_871485 ) ) ( not ( = ?auto_871476 ?auto_871486 ) ) ( not ( = ?auto_871476 ?auto_871487 ) ) ( not ( = ?auto_871476 ?auto_871488 ) ) ( not ( = ?auto_871477 ?auto_871478 ) ) ( not ( = ?auto_871477 ?auto_871479 ) ) ( not ( = ?auto_871477 ?auto_871480 ) ) ( not ( = ?auto_871477 ?auto_871481 ) ) ( not ( = ?auto_871477 ?auto_871482 ) ) ( not ( = ?auto_871477 ?auto_871483 ) ) ( not ( = ?auto_871477 ?auto_871484 ) ) ( not ( = ?auto_871477 ?auto_871485 ) ) ( not ( = ?auto_871477 ?auto_871486 ) ) ( not ( = ?auto_871477 ?auto_871487 ) ) ( not ( = ?auto_871477 ?auto_871488 ) ) ( not ( = ?auto_871478 ?auto_871479 ) ) ( not ( = ?auto_871478 ?auto_871480 ) ) ( not ( = ?auto_871478 ?auto_871481 ) ) ( not ( = ?auto_871478 ?auto_871482 ) ) ( not ( = ?auto_871478 ?auto_871483 ) ) ( not ( = ?auto_871478 ?auto_871484 ) ) ( not ( = ?auto_871478 ?auto_871485 ) ) ( not ( = ?auto_871478 ?auto_871486 ) ) ( not ( = ?auto_871478 ?auto_871487 ) ) ( not ( = ?auto_871478 ?auto_871488 ) ) ( not ( = ?auto_871479 ?auto_871480 ) ) ( not ( = ?auto_871479 ?auto_871481 ) ) ( not ( = ?auto_871479 ?auto_871482 ) ) ( not ( = ?auto_871479 ?auto_871483 ) ) ( not ( = ?auto_871479 ?auto_871484 ) ) ( not ( = ?auto_871479 ?auto_871485 ) ) ( not ( = ?auto_871479 ?auto_871486 ) ) ( not ( = ?auto_871479 ?auto_871487 ) ) ( not ( = ?auto_871479 ?auto_871488 ) ) ( not ( = ?auto_871480 ?auto_871481 ) ) ( not ( = ?auto_871480 ?auto_871482 ) ) ( not ( = ?auto_871480 ?auto_871483 ) ) ( not ( = ?auto_871480 ?auto_871484 ) ) ( not ( = ?auto_871480 ?auto_871485 ) ) ( not ( = ?auto_871480 ?auto_871486 ) ) ( not ( = ?auto_871480 ?auto_871487 ) ) ( not ( = ?auto_871480 ?auto_871488 ) ) ( not ( = ?auto_871481 ?auto_871482 ) ) ( not ( = ?auto_871481 ?auto_871483 ) ) ( not ( = ?auto_871481 ?auto_871484 ) ) ( not ( = ?auto_871481 ?auto_871485 ) ) ( not ( = ?auto_871481 ?auto_871486 ) ) ( not ( = ?auto_871481 ?auto_871487 ) ) ( not ( = ?auto_871481 ?auto_871488 ) ) ( not ( = ?auto_871482 ?auto_871483 ) ) ( not ( = ?auto_871482 ?auto_871484 ) ) ( not ( = ?auto_871482 ?auto_871485 ) ) ( not ( = ?auto_871482 ?auto_871486 ) ) ( not ( = ?auto_871482 ?auto_871487 ) ) ( not ( = ?auto_871482 ?auto_871488 ) ) ( not ( = ?auto_871483 ?auto_871484 ) ) ( not ( = ?auto_871483 ?auto_871485 ) ) ( not ( = ?auto_871483 ?auto_871486 ) ) ( not ( = ?auto_871483 ?auto_871487 ) ) ( not ( = ?auto_871483 ?auto_871488 ) ) ( not ( = ?auto_871484 ?auto_871485 ) ) ( not ( = ?auto_871484 ?auto_871486 ) ) ( not ( = ?auto_871484 ?auto_871487 ) ) ( not ( = ?auto_871484 ?auto_871488 ) ) ( not ( = ?auto_871485 ?auto_871486 ) ) ( not ( = ?auto_871485 ?auto_871487 ) ) ( not ( = ?auto_871485 ?auto_871488 ) ) ( not ( = ?auto_871486 ?auto_871487 ) ) ( not ( = ?auto_871486 ?auto_871488 ) ) ( not ( = ?auto_871487 ?auto_871488 ) ) ( ON ?auto_871486 ?auto_871487 ) ( ON ?auto_871485 ?auto_871486 ) ( ON ?auto_871484 ?auto_871485 ) ( ON ?auto_871483 ?auto_871484 ) ( ON ?auto_871482 ?auto_871483 ) ( ON ?auto_871481 ?auto_871482 ) ( ON ?auto_871480 ?auto_871481 ) ( ON ?auto_871479 ?auto_871480 ) ( ON ?auto_871478 ?auto_871479 ) ( ON ?auto_871477 ?auto_871478 ) ( ON ?auto_871476 ?auto_871477 ) ( ON ?auto_871475 ?auto_871476 ) ( ON ?auto_871474 ?auto_871475 ) ( ON ?auto_871473 ?auto_871474 ) ( ON ?auto_871472 ?auto_871473 ) ( CLEAR ?auto_871470 ) ( ON ?auto_871471 ?auto_871472 ) ( CLEAR ?auto_871471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871470 ?auto_871471 )
      ( MAKE-18PILE ?auto_871470 ?auto_871471 ?auto_871472 ?auto_871473 ?auto_871474 ?auto_871475 ?auto_871476 ?auto_871477 ?auto_871478 ?auto_871479 ?auto_871480 ?auto_871481 ?auto_871482 ?auto_871483 ?auto_871484 ?auto_871485 ?auto_871486 ?auto_871487 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871507 - BLOCK
      ?auto_871508 - BLOCK
      ?auto_871509 - BLOCK
      ?auto_871510 - BLOCK
      ?auto_871511 - BLOCK
      ?auto_871512 - BLOCK
      ?auto_871513 - BLOCK
      ?auto_871514 - BLOCK
      ?auto_871515 - BLOCK
      ?auto_871516 - BLOCK
      ?auto_871517 - BLOCK
      ?auto_871518 - BLOCK
      ?auto_871519 - BLOCK
      ?auto_871520 - BLOCK
      ?auto_871521 - BLOCK
      ?auto_871522 - BLOCK
      ?auto_871523 - BLOCK
      ?auto_871524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871524 ) ( ON-TABLE ?auto_871507 ) ( not ( = ?auto_871507 ?auto_871508 ) ) ( not ( = ?auto_871507 ?auto_871509 ) ) ( not ( = ?auto_871507 ?auto_871510 ) ) ( not ( = ?auto_871507 ?auto_871511 ) ) ( not ( = ?auto_871507 ?auto_871512 ) ) ( not ( = ?auto_871507 ?auto_871513 ) ) ( not ( = ?auto_871507 ?auto_871514 ) ) ( not ( = ?auto_871507 ?auto_871515 ) ) ( not ( = ?auto_871507 ?auto_871516 ) ) ( not ( = ?auto_871507 ?auto_871517 ) ) ( not ( = ?auto_871507 ?auto_871518 ) ) ( not ( = ?auto_871507 ?auto_871519 ) ) ( not ( = ?auto_871507 ?auto_871520 ) ) ( not ( = ?auto_871507 ?auto_871521 ) ) ( not ( = ?auto_871507 ?auto_871522 ) ) ( not ( = ?auto_871507 ?auto_871523 ) ) ( not ( = ?auto_871507 ?auto_871524 ) ) ( not ( = ?auto_871508 ?auto_871509 ) ) ( not ( = ?auto_871508 ?auto_871510 ) ) ( not ( = ?auto_871508 ?auto_871511 ) ) ( not ( = ?auto_871508 ?auto_871512 ) ) ( not ( = ?auto_871508 ?auto_871513 ) ) ( not ( = ?auto_871508 ?auto_871514 ) ) ( not ( = ?auto_871508 ?auto_871515 ) ) ( not ( = ?auto_871508 ?auto_871516 ) ) ( not ( = ?auto_871508 ?auto_871517 ) ) ( not ( = ?auto_871508 ?auto_871518 ) ) ( not ( = ?auto_871508 ?auto_871519 ) ) ( not ( = ?auto_871508 ?auto_871520 ) ) ( not ( = ?auto_871508 ?auto_871521 ) ) ( not ( = ?auto_871508 ?auto_871522 ) ) ( not ( = ?auto_871508 ?auto_871523 ) ) ( not ( = ?auto_871508 ?auto_871524 ) ) ( not ( = ?auto_871509 ?auto_871510 ) ) ( not ( = ?auto_871509 ?auto_871511 ) ) ( not ( = ?auto_871509 ?auto_871512 ) ) ( not ( = ?auto_871509 ?auto_871513 ) ) ( not ( = ?auto_871509 ?auto_871514 ) ) ( not ( = ?auto_871509 ?auto_871515 ) ) ( not ( = ?auto_871509 ?auto_871516 ) ) ( not ( = ?auto_871509 ?auto_871517 ) ) ( not ( = ?auto_871509 ?auto_871518 ) ) ( not ( = ?auto_871509 ?auto_871519 ) ) ( not ( = ?auto_871509 ?auto_871520 ) ) ( not ( = ?auto_871509 ?auto_871521 ) ) ( not ( = ?auto_871509 ?auto_871522 ) ) ( not ( = ?auto_871509 ?auto_871523 ) ) ( not ( = ?auto_871509 ?auto_871524 ) ) ( not ( = ?auto_871510 ?auto_871511 ) ) ( not ( = ?auto_871510 ?auto_871512 ) ) ( not ( = ?auto_871510 ?auto_871513 ) ) ( not ( = ?auto_871510 ?auto_871514 ) ) ( not ( = ?auto_871510 ?auto_871515 ) ) ( not ( = ?auto_871510 ?auto_871516 ) ) ( not ( = ?auto_871510 ?auto_871517 ) ) ( not ( = ?auto_871510 ?auto_871518 ) ) ( not ( = ?auto_871510 ?auto_871519 ) ) ( not ( = ?auto_871510 ?auto_871520 ) ) ( not ( = ?auto_871510 ?auto_871521 ) ) ( not ( = ?auto_871510 ?auto_871522 ) ) ( not ( = ?auto_871510 ?auto_871523 ) ) ( not ( = ?auto_871510 ?auto_871524 ) ) ( not ( = ?auto_871511 ?auto_871512 ) ) ( not ( = ?auto_871511 ?auto_871513 ) ) ( not ( = ?auto_871511 ?auto_871514 ) ) ( not ( = ?auto_871511 ?auto_871515 ) ) ( not ( = ?auto_871511 ?auto_871516 ) ) ( not ( = ?auto_871511 ?auto_871517 ) ) ( not ( = ?auto_871511 ?auto_871518 ) ) ( not ( = ?auto_871511 ?auto_871519 ) ) ( not ( = ?auto_871511 ?auto_871520 ) ) ( not ( = ?auto_871511 ?auto_871521 ) ) ( not ( = ?auto_871511 ?auto_871522 ) ) ( not ( = ?auto_871511 ?auto_871523 ) ) ( not ( = ?auto_871511 ?auto_871524 ) ) ( not ( = ?auto_871512 ?auto_871513 ) ) ( not ( = ?auto_871512 ?auto_871514 ) ) ( not ( = ?auto_871512 ?auto_871515 ) ) ( not ( = ?auto_871512 ?auto_871516 ) ) ( not ( = ?auto_871512 ?auto_871517 ) ) ( not ( = ?auto_871512 ?auto_871518 ) ) ( not ( = ?auto_871512 ?auto_871519 ) ) ( not ( = ?auto_871512 ?auto_871520 ) ) ( not ( = ?auto_871512 ?auto_871521 ) ) ( not ( = ?auto_871512 ?auto_871522 ) ) ( not ( = ?auto_871512 ?auto_871523 ) ) ( not ( = ?auto_871512 ?auto_871524 ) ) ( not ( = ?auto_871513 ?auto_871514 ) ) ( not ( = ?auto_871513 ?auto_871515 ) ) ( not ( = ?auto_871513 ?auto_871516 ) ) ( not ( = ?auto_871513 ?auto_871517 ) ) ( not ( = ?auto_871513 ?auto_871518 ) ) ( not ( = ?auto_871513 ?auto_871519 ) ) ( not ( = ?auto_871513 ?auto_871520 ) ) ( not ( = ?auto_871513 ?auto_871521 ) ) ( not ( = ?auto_871513 ?auto_871522 ) ) ( not ( = ?auto_871513 ?auto_871523 ) ) ( not ( = ?auto_871513 ?auto_871524 ) ) ( not ( = ?auto_871514 ?auto_871515 ) ) ( not ( = ?auto_871514 ?auto_871516 ) ) ( not ( = ?auto_871514 ?auto_871517 ) ) ( not ( = ?auto_871514 ?auto_871518 ) ) ( not ( = ?auto_871514 ?auto_871519 ) ) ( not ( = ?auto_871514 ?auto_871520 ) ) ( not ( = ?auto_871514 ?auto_871521 ) ) ( not ( = ?auto_871514 ?auto_871522 ) ) ( not ( = ?auto_871514 ?auto_871523 ) ) ( not ( = ?auto_871514 ?auto_871524 ) ) ( not ( = ?auto_871515 ?auto_871516 ) ) ( not ( = ?auto_871515 ?auto_871517 ) ) ( not ( = ?auto_871515 ?auto_871518 ) ) ( not ( = ?auto_871515 ?auto_871519 ) ) ( not ( = ?auto_871515 ?auto_871520 ) ) ( not ( = ?auto_871515 ?auto_871521 ) ) ( not ( = ?auto_871515 ?auto_871522 ) ) ( not ( = ?auto_871515 ?auto_871523 ) ) ( not ( = ?auto_871515 ?auto_871524 ) ) ( not ( = ?auto_871516 ?auto_871517 ) ) ( not ( = ?auto_871516 ?auto_871518 ) ) ( not ( = ?auto_871516 ?auto_871519 ) ) ( not ( = ?auto_871516 ?auto_871520 ) ) ( not ( = ?auto_871516 ?auto_871521 ) ) ( not ( = ?auto_871516 ?auto_871522 ) ) ( not ( = ?auto_871516 ?auto_871523 ) ) ( not ( = ?auto_871516 ?auto_871524 ) ) ( not ( = ?auto_871517 ?auto_871518 ) ) ( not ( = ?auto_871517 ?auto_871519 ) ) ( not ( = ?auto_871517 ?auto_871520 ) ) ( not ( = ?auto_871517 ?auto_871521 ) ) ( not ( = ?auto_871517 ?auto_871522 ) ) ( not ( = ?auto_871517 ?auto_871523 ) ) ( not ( = ?auto_871517 ?auto_871524 ) ) ( not ( = ?auto_871518 ?auto_871519 ) ) ( not ( = ?auto_871518 ?auto_871520 ) ) ( not ( = ?auto_871518 ?auto_871521 ) ) ( not ( = ?auto_871518 ?auto_871522 ) ) ( not ( = ?auto_871518 ?auto_871523 ) ) ( not ( = ?auto_871518 ?auto_871524 ) ) ( not ( = ?auto_871519 ?auto_871520 ) ) ( not ( = ?auto_871519 ?auto_871521 ) ) ( not ( = ?auto_871519 ?auto_871522 ) ) ( not ( = ?auto_871519 ?auto_871523 ) ) ( not ( = ?auto_871519 ?auto_871524 ) ) ( not ( = ?auto_871520 ?auto_871521 ) ) ( not ( = ?auto_871520 ?auto_871522 ) ) ( not ( = ?auto_871520 ?auto_871523 ) ) ( not ( = ?auto_871520 ?auto_871524 ) ) ( not ( = ?auto_871521 ?auto_871522 ) ) ( not ( = ?auto_871521 ?auto_871523 ) ) ( not ( = ?auto_871521 ?auto_871524 ) ) ( not ( = ?auto_871522 ?auto_871523 ) ) ( not ( = ?auto_871522 ?auto_871524 ) ) ( not ( = ?auto_871523 ?auto_871524 ) ) ( ON ?auto_871523 ?auto_871524 ) ( ON ?auto_871522 ?auto_871523 ) ( ON ?auto_871521 ?auto_871522 ) ( ON ?auto_871520 ?auto_871521 ) ( ON ?auto_871519 ?auto_871520 ) ( ON ?auto_871518 ?auto_871519 ) ( ON ?auto_871517 ?auto_871518 ) ( ON ?auto_871516 ?auto_871517 ) ( ON ?auto_871515 ?auto_871516 ) ( ON ?auto_871514 ?auto_871515 ) ( ON ?auto_871513 ?auto_871514 ) ( ON ?auto_871512 ?auto_871513 ) ( ON ?auto_871511 ?auto_871512 ) ( ON ?auto_871510 ?auto_871511 ) ( ON ?auto_871509 ?auto_871510 ) ( CLEAR ?auto_871507 ) ( ON ?auto_871508 ?auto_871509 ) ( CLEAR ?auto_871508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871507 ?auto_871508 )
      ( MAKE-18PILE ?auto_871507 ?auto_871508 ?auto_871509 ?auto_871510 ?auto_871511 ?auto_871512 ?auto_871513 ?auto_871514 ?auto_871515 ?auto_871516 ?auto_871517 ?auto_871518 ?auto_871519 ?auto_871520 ?auto_871521 ?auto_871522 ?auto_871523 ?auto_871524 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871543 - BLOCK
      ?auto_871544 - BLOCK
      ?auto_871545 - BLOCK
      ?auto_871546 - BLOCK
      ?auto_871547 - BLOCK
      ?auto_871548 - BLOCK
      ?auto_871549 - BLOCK
      ?auto_871550 - BLOCK
      ?auto_871551 - BLOCK
      ?auto_871552 - BLOCK
      ?auto_871553 - BLOCK
      ?auto_871554 - BLOCK
      ?auto_871555 - BLOCK
      ?auto_871556 - BLOCK
      ?auto_871557 - BLOCK
      ?auto_871558 - BLOCK
      ?auto_871559 - BLOCK
      ?auto_871560 - BLOCK
    )
    :vars
    (
      ?auto_871561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871560 ?auto_871561 ) ( not ( = ?auto_871543 ?auto_871544 ) ) ( not ( = ?auto_871543 ?auto_871545 ) ) ( not ( = ?auto_871543 ?auto_871546 ) ) ( not ( = ?auto_871543 ?auto_871547 ) ) ( not ( = ?auto_871543 ?auto_871548 ) ) ( not ( = ?auto_871543 ?auto_871549 ) ) ( not ( = ?auto_871543 ?auto_871550 ) ) ( not ( = ?auto_871543 ?auto_871551 ) ) ( not ( = ?auto_871543 ?auto_871552 ) ) ( not ( = ?auto_871543 ?auto_871553 ) ) ( not ( = ?auto_871543 ?auto_871554 ) ) ( not ( = ?auto_871543 ?auto_871555 ) ) ( not ( = ?auto_871543 ?auto_871556 ) ) ( not ( = ?auto_871543 ?auto_871557 ) ) ( not ( = ?auto_871543 ?auto_871558 ) ) ( not ( = ?auto_871543 ?auto_871559 ) ) ( not ( = ?auto_871543 ?auto_871560 ) ) ( not ( = ?auto_871543 ?auto_871561 ) ) ( not ( = ?auto_871544 ?auto_871545 ) ) ( not ( = ?auto_871544 ?auto_871546 ) ) ( not ( = ?auto_871544 ?auto_871547 ) ) ( not ( = ?auto_871544 ?auto_871548 ) ) ( not ( = ?auto_871544 ?auto_871549 ) ) ( not ( = ?auto_871544 ?auto_871550 ) ) ( not ( = ?auto_871544 ?auto_871551 ) ) ( not ( = ?auto_871544 ?auto_871552 ) ) ( not ( = ?auto_871544 ?auto_871553 ) ) ( not ( = ?auto_871544 ?auto_871554 ) ) ( not ( = ?auto_871544 ?auto_871555 ) ) ( not ( = ?auto_871544 ?auto_871556 ) ) ( not ( = ?auto_871544 ?auto_871557 ) ) ( not ( = ?auto_871544 ?auto_871558 ) ) ( not ( = ?auto_871544 ?auto_871559 ) ) ( not ( = ?auto_871544 ?auto_871560 ) ) ( not ( = ?auto_871544 ?auto_871561 ) ) ( not ( = ?auto_871545 ?auto_871546 ) ) ( not ( = ?auto_871545 ?auto_871547 ) ) ( not ( = ?auto_871545 ?auto_871548 ) ) ( not ( = ?auto_871545 ?auto_871549 ) ) ( not ( = ?auto_871545 ?auto_871550 ) ) ( not ( = ?auto_871545 ?auto_871551 ) ) ( not ( = ?auto_871545 ?auto_871552 ) ) ( not ( = ?auto_871545 ?auto_871553 ) ) ( not ( = ?auto_871545 ?auto_871554 ) ) ( not ( = ?auto_871545 ?auto_871555 ) ) ( not ( = ?auto_871545 ?auto_871556 ) ) ( not ( = ?auto_871545 ?auto_871557 ) ) ( not ( = ?auto_871545 ?auto_871558 ) ) ( not ( = ?auto_871545 ?auto_871559 ) ) ( not ( = ?auto_871545 ?auto_871560 ) ) ( not ( = ?auto_871545 ?auto_871561 ) ) ( not ( = ?auto_871546 ?auto_871547 ) ) ( not ( = ?auto_871546 ?auto_871548 ) ) ( not ( = ?auto_871546 ?auto_871549 ) ) ( not ( = ?auto_871546 ?auto_871550 ) ) ( not ( = ?auto_871546 ?auto_871551 ) ) ( not ( = ?auto_871546 ?auto_871552 ) ) ( not ( = ?auto_871546 ?auto_871553 ) ) ( not ( = ?auto_871546 ?auto_871554 ) ) ( not ( = ?auto_871546 ?auto_871555 ) ) ( not ( = ?auto_871546 ?auto_871556 ) ) ( not ( = ?auto_871546 ?auto_871557 ) ) ( not ( = ?auto_871546 ?auto_871558 ) ) ( not ( = ?auto_871546 ?auto_871559 ) ) ( not ( = ?auto_871546 ?auto_871560 ) ) ( not ( = ?auto_871546 ?auto_871561 ) ) ( not ( = ?auto_871547 ?auto_871548 ) ) ( not ( = ?auto_871547 ?auto_871549 ) ) ( not ( = ?auto_871547 ?auto_871550 ) ) ( not ( = ?auto_871547 ?auto_871551 ) ) ( not ( = ?auto_871547 ?auto_871552 ) ) ( not ( = ?auto_871547 ?auto_871553 ) ) ( not ( = ?auto_871547 ?auto_871554 ) ) ( not ( = ?auto_871547 ?auto_871555 ) ) ( not ( = ?auto_871547 ?auto_871556 ) ) ( not ( = ?auto_871547 ?auto_871557 ) ) ( not ( = ?auto_871547 ?auto_871558 ) ) ( not ( = ?auto_871547 ?auto_871559 ) ) ( not ( = ?auto_871547 ?auto_871560 ) ) ( not ( = ?auto_871547 ?auto_871561 ) ) ( not ( = ?auto_871548 ?auto_871549 ) ) ( not ( = ?auto_871548 ?auto_871550 ) ) ( not ( = ?auto_871548 ?auto_871551 ) ) ( not ( = ?auto_871548 ?auto_871552 ) ) ( not ( = ?auto_871548 ?auto_871553 ) ) ( not ( = ?auto_871548 ?auto_871554 ) ) ( not ( = ?auto_871548 ?auto_871555 ) ) ( not ( = ?auto_871548 ?auto_871556 ) ) ( not ( = ?auto_871548 ?auto_871557 ) ) ( not ( = ?auto_871548 ?auto_871558 ) ) ( not ( = ?auto_871548 ?auto_871559 ) ) ( not ( = ?auto_871548 ?auto_871560 ) ) ( not ( = ?auto_871548 ?auto_871561 ) ) ( not ( = ?auto_871549 ?auto_871550 ) ) ( not ( = ?auto_871549 ?auto_871551 ) ) ( not ( = ?auto_871549 ?auto_871552 ) ) ( not ( = ?auto_871549 ?auto_871553 ) ) ( not ( = ?auto_871549 ?auto_871554 ) ) ( not ( = ?auto_871549 ?auto_871555 ) ) ( not ( = ?auto_871549 ?auto_871556 ) ) ( not ( = ?auto_871549 ?auto_871557 ) ) ( not ( = ?auto_871549 ?auto_871558 ) ) ( not ( = ?auto_871549 ?auto_871559 ) ) ( not ( = ?auto_871549 ?auto_871560 ) ) ( not ( = ?auto_871549 ?auto_871561 ) ) ( not ( = ?auto_871550 ?auto_871551 ) ) ( not ( = ?auto_871550 ?auto_871552 ) ) ( not ( = ?auto_871550 ?auto_871553 ) ) ( not ( = ?auto_871550 ?auto_871554 ) ) ( not ( = ?auto_871550 ?auto_871555 ) ) ( not ( = ?auto_871550 ?auto_871556 ) ) ( not ( = ?auto_871550 ?auto_871557 ) ) ( not ( = ?auto_871550 ?auto_871558 ) ) ( not ( = ?auto_871550 ?auto_871559 ) ) ( not ( = ?auto_871550 ?auto_871560 ) ) ( not ( = ?auto_871550 ?auto_871561 ) ) ( not ( = ?auto_871551 ?auto_871552 ) ) ( not ( = ?auto_871551 ?auto_871553 ) ) ( not ( = ?auto_871551 ?auto_871554 ) ) ( not ( = ?auto_871551 ?auto_871555 ) ) ( not ( = ?auto_871551 ?auto_871556 ) ) ( not ( = ?auto_871551 ?auto_871557 ) ) ( not ( = ?auto_871551 ?auto_871558 ) ) ( not ( = ?auto_871551 ?auto_871559 ) ) ( not ( = ?auto_871551 ?auto_871560 ) ) ( not ( = ?auto_871551 ?auto_871561 ) ) ( not ( = ?auto_871552 ?auto_871553 ) ) ( not ( = ?auto_871552 ?auto_871554 ) ) ( not ( = ?auto_871552 ?auto_871555 ) ) ( not ( = ?auto_871552 ?auto_871556 ) ) ( not ( = ?auto_871552 ?auto_871557 ) ) ( not ( = ?auto_871552 ?auto_871558 ) ) ( not ( = ?auto_871552 ?auto_871559 ) ) ( not ( = ?auto_871552 ?auto_871560 ) ) ( not ( = ?auto_871552 ?auto_871561 ) ) ( not ( = ?auto_871553 ?auto_871554 ) ) ( not ( = ?auto_871553 ?auto_871555 ) ) ( not ( = ?auto_871553 ?auto_871556 ) ) ( not ( = ?auto_871553 ?auto_871557 ) ) ( not ( = ?auto_871553 ?auto_871558 ) ) ( not ( = ?auto_871553 ?auto_871559 ) ) ( not ( = ?auto_871553 ?auto_871560 ) ) ( not ( = ?auto_871553 ?auto_871561 ) ) ( not ( = ?auto_871554 ?auto_871555 ) ) ( not ( = ?auto_871554 ?auto_871556 ) ) ( not ( = ?auto_871554 ?auto_871557 ) ) ( not ( = ?auto_871554 ?auto_871558 ) ) ( not ( = ?auto_871554 ?auto_871559 ) ) ( not ( = ?auto_871554 ?auto_871560 ) ) ( not ( = ?auto_871554 ?auto_871561 ) ) ( not ( = ?auto_871555 ?auto_871556 ) ) ( not ( = ?auto_871555 ?auto_871557 ) ) ( not ( = ?auto_871555 ?auto_871558 ) ) ( not ( = ?auto_871555 ?auto_871559 ) ) ( not ( = ?auto_871555 ?auto_871560 ) ) ( not ( = ?auto_871555 ?auto_871561 ) ) ( not ( = ?auto_871556 ?auto_871557 ) ) ( not ( = ?auto_871556 ?auto_871558 ) ) ( not ( = ?auto_871556 ?auto_871559 ) ) ( not ( = ?auto_871556 ?auto_871560 ) ) ( not ( = ?auto_871556 ?auto_871561 ) ) ( not ( = ?auto_871557 ?auto_871558 ) ) ( not ( = ?auto_871557 ?auto_871559 ) ) ( not ( = ?auto_871557 ?auto_871560 ) ) ( not ( = ?auto_871557 ?auto_871561 ) ) ( not ( = ?auto_871558 ?auto_871559 ) ) ( not ( = ?auto_871558 ?auto_871560 ) ) ( not ( = ?auto_871558 ?auto_871561 ) ) ( not ( = ?auto_871559 ?auto_871560 ) ) ( not ( = ?auto_871559 ?auto_871561 ) ) ( not ( = ?auto_871560 ?auto_871561 ) ) ( ON ?auto_871559 ?auto_871560 ) ( ON ?auto_871558 ?auto_871559 ) ( ON ?auto_871557 ?auto_871558 ) ( ON ?auto_871556 ?auto_871557 ) ( ON ?auto_871555 ?auto_871556 ) ( ON ?auto_871554 ?auto_871555 ) ( ON ?auto_871553 ?auto_871554 ) ( ON ?auto_871552 ?auto_871553 ) ( ON ?auto_871551 ?auto_871552 ) ( ON ?auto_871550 ?auto_871551 ) ( ON ?auto_871549 ?auto_871550 ) ( ON ?auto_871548 ?auto_871549 ) ( ON ?auto_871547 ?auto_871548 ) ( ON ?auto_871546 ?auto_871547 ) ( ON ?auto_871545 ?auto_871546 ) ( ON ?auto_871544 ?auto_871545 ) ( ON ?auto_871543 ?auto_871544 ) ( CLEAR ?auto_871543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871543 )
      ( MAKE-18PILE ?auto_871543 ?auto_871544 ?auto_871545 ?auto_871546 ?auto_871547 ?auto_871548 ?auto_871549 ?auto_871550 ?auto_871551 ?auto_871552 ?auto_871553 ?auto_871554 ?auto_871555 ?auto_871556 ?auto_871557 ?auto_871558 ?auto_871559 ?auto_871560 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871580 - BLOCK
      ?auto_871581 - BLOCK
      ?auto_871582 - BLOCK
      ?auto_871583 - BLOCK
      ?auto_871584 - BLOCK
      ?auto_871585 - BLOCK
      ?auto_871586 - BLOCK
      ?auto_871587 - BLOCK
      ?auto_871588 - BLOCK
      ?auto_871589 - BLOCK
      ?auto_871590 - BLOCK
      ?auto_871591 - BLOCK
      ?auto_871592 - BLOCK
      ?auto_871593 - BLOCK
      ?auto_871594 - BLOCK
      ?auto_871595 - BLOCK
      ?auto_871596 - BLOCK
      ?auto_871597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_871597 ) ( not ( = ?auto_871580 ?auto_871581 ) ) ( not ( = ?auto_871580 ?auto_871582 ) ) ( not ( = ?auto_871580 ?auto_871583 ) ) ( not ( = ?auto_871580 ?auto_871584 ) ) ( not ( = ?auto_871580 ?auto_871585 ) ) ( not ( = ?auto_871580 ?auto_871586 ) ) ( not ( = ?auto_871580 ?auto_871587 ) ) ( not ( = ?auto_871580 ?auto_871588 ) ) ( not ( = ?auto_871580 ?auto_871589 ) ) ( not ( = ?auto_871580 ?auto_871590 ) ) ( not ( = ?auto_871580 ?auto_871591 ) ) ( not ( = ?auto_871580 ?auto_871592 ) ) ( not ( = ?auto_871580 ?auto_871593 ) ) ( not ( = ?auto_871580 ?auto_871594 ) ) ( not ( = ?auto_871580 ?auto_871595 ) ) ( not ( = ?auto_871580 ?auto_871596 ) ) ( not ( = ?auto_871580 ?auto_871597 ) ) ( not ( = ?auto_871581 ?auto_871582 ) ) ( not ( = ?auto_871581 ?auto_871583 ) ) ( not ( = ?auto_871581 ?auto_871584 ) ) ( not ( = ?auto_871581 ?auto_871585 ) ) ( not ( = ?auto_871581 ?auto_871586 ) ) ( not ( = ?auto_871581 ?auto_871587 ) ) ( not ( = ?auto_871581 ?auto_871588 ) ) ( not ( = ?auto_871581 ?auto_871589 ) ) ( not ( = ?auto_871581 ?auto_871590 ) ) ( not ( = ?auto_871581 ?auto_871591 ) ) ( not ( = ?auto_871581 ?auto_871592 ) ) ( not ( = ?auto_871581 ?auto_871593 ) ) ( not ( = ?auto_871581 ?auto_871594 ) ) ( not ( = ?auto_871581 ?auto_871595 ) ) ( not ( = ?auto_871581 ?auto_871596 ) ) ( not ( = ?auto_871581 ?auto_871597 ) ) ( not ( = ?auto_871582 ?auto_871583 ) ) ( not ( = ?auto_871582 ?auto_871584 ) ) ( not ( = ?auto_871582 ?auto_871585 ) ) ( not ( = ?auto_871582 ?auto_871586 ) ) ( not ( = ?auto_871582 ?auto_871587 ) ) ( not ( = ?auto_871582 ?auto_871588 ) ) ( not ( = ?auto_871582 ?auto_871589 ) ) ( not ( = ?auto_871582 ?auto_871590 ) ) ( not ( = ?auto_871582 ?auto_871591 ) ) ( not ( = ?auto_871582 ?auto_871592 ) ) ( not ( = ?auto_871582 ?auto_871593 ) ) ( not ( = ?auto_871582 ?auto_871594 ) ) ( not ( = ?auto_871582 ?auto_871595 ) ) ( not ( = ?auto_871582 ?auto_871596 ) ) ( not ( = ?auto_871582 ?auto_871597 ) ) ( not ( = ?auto_871583 ?auto_871584 ) ) ( not ( = ?auto_871583 ?auto_871585 ) ) ( not ( = ?auto_871583 ?auto_871586 ) ) ( not ( = ?auto_871583 ?auto_871587 ) ) ( not ( = ?auto_871583 ?auto_871588 ) ) ( not ( = ?auto_871583 ?auto_871589 ) ) ( not ( = ?auto_871583 ?auto_871590 ) ) ( not ( = ?auto_871583 ?auto_871591 ) ) ( not ( = ?auto_871583 ?auto_871592 ) ) ( not ( = ?auto_871583 ?auto_871593 ) ) ( not ( = ?auto_871583 ?auto_871594 ) ) ( not ( = ?auto_871583 ?auto_871595 ) ) ( not ( = ?auto_871583 ?auto_871596 ) ) ( not ( = ?auto_871583 ?auto_871597 ) ) ( not ( = ?auto_871584 ?auto_871585 ) ) ( not ( = ?auto_871584 ?auto_871586 ) ) ( not ( = ?auto_871584 ?auto_871587 ) ) ( not ( = ?auto_871584 ?auto_871588 ) ) ( not ( = ?auto_871584 ?auto_871589 ) ) ( not ( = ?auto_871584 ?auto_871590 ) ) ( not ( = ?auto_871584 ?auto_871591 ) ) ( not ( = ?auto_871584 ?auto_871592 ) ) ( not ( = ?auto_871584 ?auto_871593 ) ) ( not ( = ?auto_871584 ?auto_871594 ) ) ( not ( = ?auto_871584 ?auto_871595 ) ) ( not ( = ?auto_871584 ?auto_871596 ) ) ( not ( = ?auto_871584 ?auto_871597 ) ) ( not ( = ?auto_871585 ?auto_871586 ) ) ( not ( = ?auto_871585 ?auto_871587 ) ) ( not ( = ?auto_871585 ?auto_871588 ) ) ( not ( = ?auto_871585 ?auto_871589 ) ) ( not ( = ?auto_871585 ?auto_871590 ) ) ( not ( = ?auto_871585 ?auto_871591 ) ) ( not ( = ?auto_871585 ?auto_871592 ) ) ( not ( = ?auto_871585 ?auto_871593 ) ) ( not ( = ?auto_871585 ?auto_871594 ) ) ( not ( = ?auto_871585 ?auto_871595 ) ) ( not ( = ?auto_871585 ?auto_871596 ) ) ( not ( = ?auto_871585 ?auto_871597 ) ) ( not ( = ?auto_871586 ?auto_871587 ) ) ( not ( = ?auto_871586 ?auto_871588 ) ) ( not ( = ?auto_871586 ?auto_871589 ) ) ( not ( = ?auto_871586 ?auto_871590 ) ) ( not ( = ?auto_871586 ?auto_871591 ) ) ( not ( = ?auto_871586 ?auto_871592 ) ) ( not ( = ?auto_871586 ?auto_871593 ) ) ( not ( = ?auto_871586 ?auto_871594 ) ) ( not ( = ?auto_871586 ?auto_871595 ) ) ( not ( = ?auto_871586 ?auto_871596 ) ) ( not ( = ?auto_871586 ?auto_871597 ) ) ( not ( = ?auto_871587 ?auto_871588 ) ) ( not ( = ?auto_871587 ?auto_871589 ) ) ( not ( = ?auto_871587 ?auto_871590 ) ) ( not ( = ?auto_871587 ?auto_871591 ) ) ( not ( = ?auto_871587 ?auto_871592 ) ) ( not ( = ?auto_871587 ?auto_871593 ) ) ( not ( = ?auto_871587 ?auto_871594 ) ) ( not ( = ?auto_871587 ?auto_871595 ) ) ( not ( = ?auto_871587 ?auto_871596 ) ) ( not ( = ?auto_871587 ?auto_871597 ) ) ( not ( = ?auto_871588 ?auto_871589 ) ) ( not ( = ?auto_871588 ?auto_871590 ) ) ( not ( = ?auto_871588 ?auto_871591 ) ) ( not ( = ?auto_871588 ?auto_871592 ) ) ( not ( = ?auto_871588 ?auto_871593 ) ) ( not ( = ?auto_871588 ?auto_871594 ) ) ( not ( = ?auto_871588 ?auto_871595 ) ) ( not ( = ?auto_871588 ?auto_871596 ) ) ( not ( = ?auto_871588 ?auto_871597 ) ) ( not ( = ?auto_871589 ?auto_871590 ) ) ( not ( = ?auto_871589 ?auto_871591 ) ) ( not ( = ?auto_871589 ?auto_871592 ) ) ( not ( = ?auto_871589 ?auto_871593 ) ) ( not ( = ?auto_871589 ?auto_871594 ) ) ( not ( = ?auto_871589 ?auto_871595 ) ) ( not ( = ?auto_871589 ?auto_871596 ) ) ( not ( = ?auto_871589 ?auto_871597 ) ) ( not ( = ?auto_871590 ?auto_871591 ) ) ( not ( = ?auto_871590 ?auto_871592 ) ) ( not ( = ?auto_871590 ?auto_871593 ) ) ( not ( = ?auto_871590 ?auto_871594 ) ) ( not ( = ?auto_871590 ?auto_871595 ) ) ( not ( = ?auto_871590 ?auto_871596 ) ) ( not ( = ?auto_871590 ?auto_871597 ) ) ( not ( = ?auto_871591 ?auto_871592 ) ) ( not ( = ?auto_871591 ?auto_871593 ) ) ( not ( = ?auto_871591 ?auto_871594 ) ) ( not ( = ?auto_871591 ?auto_871595 ) ) ( not ( = ?auto_871591 ?auto_871596 ) ) ( not ( = ?auto_871591 ?auto_871597 ) ) ( not ( = ?auto_871592 ?auto_871593 ) ) ( not ( = ?auto_871592 ?auto_871594 ) ) ( not ( = ?auto_871592 ?auto_871595 ) ) ( not ( = ?auto_871592 ?auto_871596 ) ) ( not ( = ?auto_871592 ?auto_871597 ) ) ( not ( = ?auto_871593 ?auto_871594 ) ) ( not ( = ?auto_871593 ?auto_871595 ) ) ( not ( = ?auto_871593 ?auto_871596 ) ) ( not ( = ?auto_871593 ?auto_871597 ) ) ( not ( = ?auto_871594 ?auto_871595 ) ) ( not ( = ?auto_871594 ?auto_871596 ) ) ( not ( = ?auto_871594 ?auto_871597 ) ) ( not ( = ?auto_871595 ?auto_871596 ) ) ( not ( = ?auto_871595 ?auto_871597 ) ) ( not ( = ?auto_871596 ?auto_871597 ) ) ( ON ?auto_871596 ?auto_871597 ) ( ON ?auto_871595 ?auto_871596 ) ( ON ?auto_871594 ?auto_871595 ) ( ON ?auto_871593 ?auto_871594 ) ( ON ?auto_871592 ?auto_871593 ) ( ON ?auto_871591 ?auto_871592 ) ( ON ?auto_871590 ?auto_871591 ) ( ON ?auto_871589 ?auto_871590 ) ( ON ?auto_871588 ?auto_871589 ) ( ON ?auto_871587 ?auto_871588 ) ( ON ?auto_871586 ?auto_871587 ) ( ON ?auto_871585 ?auto_871586 ) ( ON ?auto_871584 ?auto_871585 ) ( ON ?auto_871583 ?auto_871584 ) ( ON ?auto_871582 ?auto_871583 ) ( ON ?auto_871581 ?auto_871582 ) ( ON ?auto_871580 ?auto_871581 ) ( CLEAR ?auto_871580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871580 )
      ( MAKE-18PILE ?auto_871580 ?auto_871581 ?auto_871582 ?auto_871583 ?auto_871584 ?auto_871585 ?auto_871586 ?auto_871587 ?auto_871588 ?auto_871589 ?auto_871590 ?auto_871591 ?auto_871592 ?auto_871593 ?auto_871594 ?auto_871595 ?auto_871596 ?auto_871597 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_871616 - BLOCK
      ?auto_871617 - BLOCK
      ?auto_871618 - BLOCK
      ?auto_871619 - BLOCK
      ?auto_871620 - BLOCK
      ?auto_871621 - BLOCK
      ?auto_871622 - BLOCK
      ?auto_871623 - BLOCK
      ?auto_871624 - BLOCK
      ?auto_871625 - BLOCK
      ?auto_871626 - BLOCK
      ?auto_871627 - BLOCK
      ?auto_871628 - BLOCK
      ?auto_871629 - BLOCK
      ?auto_871630 - BLOCK
      ?auto_871631 - BLOCK
      ?auto_871632 - BLOCK
      ?auto_871633 - BLOCK
    )
    :vars
    (
      ?auto_871634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_871616 ?auto_871617 ) ) ( not ( = ?auto_871616 ?auto_871618 ) ) ( not ( = ?auto_871616 ?auto_871619 ) ) ( not ( = ?auto_871616 ?auto_871620 ) ) ( not ( = ?auto_871616 ?auto_871621 ) ) ( not ( = ?auto_871616 ?auto_871622 ) ) ( not ( = ?auto_871616 ?auto_871623 ) ) ( not ( = ?auto_871616 ?auto_871624 ) ) ( not ( = ?auto_871616 ?auto_871625 ) ) ( not ( = ?auto_871616 ?auto_871626 ) ) ( not ( = ?auto_871616 ?auto_871627 ) ) ( not ( = ?auto_871616 ?auto_871628 ) ) ( not ( = ?auto_871616 ?auto_871629 ) ) ( not ( = ?auto_871616 ?auto_871630 ) ) ( not ( = ?auto_871616 ?auto_871631 ) ) ( not ( = ?auto_871616 ?auto_871632 ) ) ( not ( = ?auto_871616 ?auto_871633 ) ) ( not ( = ?auto_871617 ?auto_871618 ) ) ( not ( = ?auto_871617 ?auto_871619 ) ) ( not ( = ?auto_871617 ?auto_871620 ) ) ( not ( = ?auto_871617 ?auto_871621 ) ) ( not ( = ?auto_871617 ?auto_871622 ) ) ( not ( = ?auto_871617 ?auto_871623 ) ) ( not ( = ?auto_871617 ?auto_871624 ) ) ( not ( = ?auto_871617 ?auto_871625 ) ) ( not ( = ?auto_871617 ?auto_871626 ) ) ( not ( = ?auto_871617 ?auto_871627 ) ) ( not ( = ?auto_871617 ?auto_871628 ) ) ( not ( = ?auto_871617 ?auto_871629 ) ) ( not ( = ?auto_871617 ?auto_871630 ) ) ( not ( = ?auto_871617 ?auto_871631 ) ) ( not ( = ?auto_871617 ?auto_871632 ) ) ( not ( = ?auto_871617 ?auto_871633 ) ) ( not ( = ?auto_871618 ?auto_871619 ) ) ( not ( = ?auto_871618 ?auto_871620 ) ) ( not ( = ?auto_871618 ?auto_871621 ) ) ( not ( = ?auto_871618 ?auto_871622 ) ) ( not ( = ?auto_871618 ?auto_871623 ) ) ( not ( = ?auto_871618 ?auto_871624 ) ) ( not ( = ?auto_871618 ?auto_871625 ) ) ( not ( = ?auto_871618 ?auto_871626 ) ) ( not ( = ?auto_871618 ?auto_871627 ) ) ( not ( = ?auto_871618 ?auto_871628 ) ) ( not ( = ?auto_871618 ?auto_871629 ) ) ( not ( = ?auto_871618 ?auto_871630 ) ) ( not ( = ?auto_871618 ?auto_871631 ) ) ( not ( = ?auto_871618 ?auto_871632 ) ) ( not ( = ?auto_871618 ?auto_871633 ) ) ( not ( = ?auto_871619 ?auto_871620 ) ) ( not ( = ?auto_871619 ?auto_871621 ) ) ( not ( = ?auto_871619 ?auto_871622 ) ) ( not ( = ?auto_871619 ?auto_871623 ) ) ( not ( = ?auto_871619 ?auto_871624 ) ) ( not ( = ?auto_871619 ?auto_871625 ) ) ( not ( = ?auto_871619 ?auto_871626 ) ) ( not ( = ?auto_871619 ?auto_871627 ) ) ( not ( = ?auto_871619 ?auto_871628 ) ) ( not ( = ?auto_871619 ?auto_871629 ) ) ( not ( = ?auto_871619 ?auto_871630 ) ) ( not ( = ?auto_871619 ?auto_871631 ) ) ( not ( = ?auto_871619 ?auto_871632 ) ) ( not ( = ?auto_871619 ?auto_871633 ) ) ( not ( = ?auto_871620 ?auto_871621 ) ) ( not ( = ?auto_871620 ?auto_871622 ) ) ( not ( = ?auto_871620 ?auto_871623 ) ) ( not ( = ?auto_871620 ?auto_871624 ) ) ( not ( = ?auto_871620 ?auto_871625 ) ) ( not ( = ?auto_871620 ?auto_871626 ) ) ( not ( = ?auto_871620 ?auto_871627 ) ) ( not ( = ?auto_871620 ?auto_871628 ) ) ( not ( = ?auto_871620 ?auto_871629 ) ) ( not ( = ?auto_871620 ?auto_871630 ) ) ( not ( = ?auto_871620 ?auto_871631 ) ) ( not ( = ?auto_871620 ?auto_871632 ) ) ( not ( = ?auto_871620 ?auto_871633 ) ) ( not ( = ?auto_871621 ?auto_871622 ) ) ( not ( = ?auto_871621 ?auto_871623 ) ) ( not ( = ?auto_871621 ?auto_871624 ) ) ( not ( = ?auto_871621 ?auto_871625 ) ) ( not ( = ?auto_871621 ?auto_871626 ) ) ( not ( = ?auto_871621 ?auto_871627 ) ) ( not ( = ?auto_871621 ?auto_871628 ) ) ( not ( = ?auto_871621 ?auto_871629 ) ) ( not ( = ?auto_871621 ?auto_871630 ) ) ( not ( = ?auto_871621 ?auto_871631 ) ) ( not ( = ?auto_871621 ?auto_871632 ) ) ( not ( = ?auto_871621 ?auto_871633 ) ) ( not ( = ?auto_871622 ?auto_871623 ) ) ( not ( = ?auto_871622 ?auto_871624 ) ) ( not ( = ?auto_871622 ?auto_871625 ) ) ( not ( = ?auto_871622 ?auto_871626 ) ) ( not ( = ?auto_871622 ?auto_871627 ) ) ( not ( = ?auto_871622 ?auto_871628 ) ) ( not ( = ?auto_871622 ?auto_871629 ) ) ( not ( = ?auto_871622 ?auto_871630 ) ) ( not ( = ?auto_871622 ?auto_871631 ) ) ( not ( = ?auto_871622 ?auto_871632 ) ) ( not ( = ?auto_871622 ?auto_871633 ) ) ( not ( = ?auto_871623 ?auto_871624 ) ) ( not ( = ?auto_871623 ?auto_871625 ) ) ( not ( = ?auto_871623 ?auto_871626 ) ) ( not ( = ?auto_871623 ?auto_871627 ) ) ( not ( = ?auto_871623 ?auto_871628 ) ) ( not ( = ?auto_871623 ?auto_871629 ) ) ( not ( = ?auto_871623 ?auto_871630 ) ) ( not ( = ?auto_871623 ?auto_871631 ) ) ( not ( = ?auto_871623 ?auto_871632 ) ) ( not ( = ?auto_871623 ?auto_871633 ) ) ( not ( = ?auto_871624 ?auto_871625 ) ) ( not ( = ?auto_871624 ?auto_871626 ) ) ( not ( = ?auto_871624 ?auto_871627 ) ) ( not ( = ?auto_871624 ?auto_871628 ) ) ( not ( = ?auto_871624 ?auto_871629 ) ) ( not ( = ?auto_871624 ?auto_871630 ) ) ( not ( = ?auto_871624 ?auto_871631 ) ) ( not ( = ?auto_871624 ?auto_871632 ) ) ( not ( = ?auto_871624 ?auto_871633 ) ) ( not ( = ?auto_871625 ?auto_871626 ) ) ( not ( = ?auto_871625 ?auto_871627 ) ) ( not ( = ?auto_871625 ?auto_871628 ) ) ( not ( = ?auto_871625 ?auto_871629 ) ) ( not ( = ?auto_871625 ?auto_871630 ) ) ( not ( = ?auto_871625 ?auto_871631 ) ) ( not ( = ?auto_871625 ?auto_871632 ) ) ( not ( = ?auto_871625 ?auto_871633 ) ) ( not ( = ?auto_871626 ?auto_871627 ) ) ( not ( = ?auto_871626 ?auto_871628 ) ) ( not ( = ?auto_871626 ?auto_871629 ) ) ( not ( = ?auto_871626 ?auto_871630 ) ) ( not ( = ?auto_871626 ?auto_871631 ) ) ( not ( = ?auto_871626 ?auto_871632 ) ) ( not ( = ?auto_871626 ?auto_871633 ) ) ( not ( = ?auto_871627 ?auto_871628 ) ) ( not ( = ?auto_871627 ?auto_871629 ) ) ( not ( = ?auto_871627 ?auto_871630 ) ) ( not ( = ?auto_871627 ?auto_871631 ) ) ( not ( = ?auto_871627 ?auto_871632 ) ) ( not ( = ?auto_871627 ?auto_871633 ) ) ( not ( = ?auto_871628 ?auto_871629 ) ) ( not ( = ?auto_871628 ?auto_871630 ) ) ( not ( = ?auto_871628 ?auto_871631 ) ) ( not ( = ?auto_871628 ?auto_871632 ) ) ( not ( = ?auto_871628 ?auto_871633 ) ) ( not ( = ?auto_871629 ?auto_871630 ) ) ( not ( = ?auto_871629 ?auto_871631 ) ) ( not ( = ?auto_871629 ?auto_871632 ) ) ( not ( = ?auto_871629 ?auto_871633 ) ) ( not ( = ?auto_871630 ?auto_871631 ) ) ( not ( = ?auto_871630 ?auto_871632 ) ) ( not ( = ?auto_871630 ?auto_871633 ) ) ( not ( = ?auto_871631 ?auto_871632 ) ) ( not ( = ?auto_871631 ?auto_871633 ) ) ( not ( = ?auto_871632 ?auto_871633 ) ) ( ON ?auto_871616 ?auto_871634 ) ( not ( = ?auto_871633 ?auto_871634 ) ) ( not ( = ?auto_871632 ?auto_871634 ) ) ( not ( = ?auto_871631 ?auto_871634 ) ) ( not ( = ?auto_871630 ?auto_871634 ) ) ( not ( = ?auto_871629 ?auto_871634 ) ) ( not ( = ?auto_871628 ?auto_871634 ) ) ( not ( = ?auto_871627 ?auto_871634 ) ) ( not ( = ?auto_871626 ?auto_871634 ) ) ( not ( = ?auto_871625 ?auto_871634 ) ) ( not ( = ?auto_871624 ?auto_871634 ) ) ( not ( = ?auto_871623 ?auto_871634 ) ) ( not ( = ?auto_871622 ?auto_871634 ) ) ( not ( = ?auto_871621 ?auto_871634 ) ) ( not ( = ?auto_871620 ?auto_871634 ) ) ( not ( = ?auto_871619 ?auto_871634 ) ) ( not ( = ?auto_871618 ?auto_871634 ) ) ( not ( = ?auto_871617 ?auto_871634 ) ) ( not ( = ?auto_871616 ?auto_871634 ) ) ( ON ?auto_871617 ?auto_871616 ) ( ON ?auto_871618 ?auto_871617 ) ( ON ?auto_871619 ?auto_871618 ) ( ON ?auto_871620 ?auto_871619 ) ( ON ?auto_871621 ?auto_871620 ) ( ON ?auto_871622 ?auto_871621 ) ( ON ?auto_871623 ?auto_871622 ) ( ON ?auto_871624 ?auto_871623 ) ( ON ?auto_871625 ?auto_871624 ) ( ON ?auto_871626 ?auto_871625 ) ( ON ?auto_871627 ?auto_871626 ) ( ON ?auto_871628 ?auto_871627 ) ( ON ?auto_871629 ?auto_871628 ) ( ON ?auto_871630 ?auto_871629 ) ( ON ?auto_871631 ?auto_871630 ) ( ON ?auto_871632 ?auto_871631 ) ( ON ?auto_871633 ?auto_871632 ) ( CLEAR ?auto_871633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_871633 ?auto_871632 ?auto_871631 ?auto_871630 ?auto_871629 ?auto_871628 ?auto_871627 ?auto_871626 ?auto_871625 ?auto_871624 ?auto_871623 ?auto_871622 ?auto_871621 ?auto_871620 ?auto_871619 ?auto_871618 ?auto_871617 ?auto_871616 )
      ( MAKE-18PILE ?auto_871616 ?auto_871617 ?auto_871618 ?auto_871619 ?auto_871620 ?auto_871621 ?auto_871622 ?auto_871623 ?auto_871624 ?auto_871625 ?auto_871626 ?auto_871627 ?auto_871628 ?auto_871629 ?auto_871630 ?auto_871631 ?auto_871632 ?auto_871633 ) )
  )

)

