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
      ?auto_121917 - BLOCK
    )
    :vars
    (
      ?auto_121918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121917 ?auto_121918 ) ( CLEAR ?auto_121917 ) ( HAND-EMPTY ) ( not ( = ?auto_121917 ?auto_121918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121917 ?auto_121918 )
      ( !PUTDOWN ?auto_121917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121924 - BLOCK
      ?auto_121925 - BLOCK
    )
    :vars
    (
      ?auto_121926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121924 ) ( ON ?auto_121925 ?auto_121926 ) ( CLEAR ?auto_121925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121924 ) ( not ( = ?auto_121924 ?auto_121925 ) ) ( not ( = ?auto_121924 ?auto_121926 ) ) ( not ( = ?auto_121925 ?auto_121926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121925 ?auto_121926 )
      ( !STACK ?auto_121925 ?auto_121924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121934 - BLOCK
      ?auto_121935 - BLOCK
    )
    :vars
    (
      ?auto_121936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121935 ?auto_121936 ) ( not ( = ?auto_121934 ?auto_121935 ) ) ( not ( = ?auto_121934 ?auto_121936 ) ) ( not ( = ?auto_121935 ?auto_121936 ) ) ( ON ?auto_121934 ?auto_121935 ) ( CLEAR ?auto_121934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121934 )
      ( MAKE-2PILE ?auto_121934 ?auto_121935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121945 - BLOCK
      ?auto_121946 - BLOCK
      ?auto_121947 - BLOCK
    )
    :vars
    (
      ?auto_121948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121946 ) ( ON ?auto_121947 ?auto_121948 ) ( CLEAR ?auto_121947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121945 ) ( ON ?auto_121946 ?auto_121945 ) ( not ( = ?auto_121945 ?auto_121946 ) ) ( not ( = ?auto_121945 ?auto_121947 ) ) ( not ( = ?auto_121945 ?auto_121948 ) ) ( not ( = ?auto_121946 ?auto_121947 ) ) ( not ( = ?auto_121946 ?auto_121948 ) ) ( not ( = ?auto_121947 ?auto_121948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121947 ?auto_121948 )
      ( !STACK ?auto_121947 ?auto_121946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121959 - BLOCK
      ?auto_121960 - BLOCK
      ?auto_121961 - BLOCK
    )
    :vars
    (
      ?auto_121962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121961 ?auto_121962 ) ( ON-TABLE ?auto_121959 ) ( not ( = ?auto_121959 ?auto_121960 ) ) ( not ( = ?auto_121959 ?auto_121961 ) ) ( not ( = ?auto_121959 ?auto_121962 ) ) ( not ( = ?auto_121960 ?auto_121961 ) ) ( not ( = ?auto_121960 ?auto_121962 ) ) ( not ( = ?auto_121961 ?auto_121962 ) ) ( CLEAR ?auto_121959 ) ( ON ?auto_121960 ?auto_121961 ) ( CLEAR ?auto_121960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121959 ?auto_121960 )
      ( MAKE-3PILE ?auto_121959 ?auto_121960 ?auto_121961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121973 - BLOCK
      ?auto_121974 - BLOCK
      ?auto_121975 - BLOCK
    )
    :vars
    (
      ?auto_121976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121975 ?auto_121976 ) ( not ( = ?auto_121973 ?auto_121974 ) ) ( not ( = ?auto_121973 ?auto_121975 ) ) ( not ( = ?auto_121973 ?auto_121976 ) ) ( not ( = ?auto_121974 ?auto_121975 ) ) ( not ( = ?auto_121974 ?auto_121976 ) ) ( not ( = ?auto_121975 ?auto_121976 ) ) ( ON ?auto_121974 ?auto_121975 ) ( ON ?auto_121973 ?auto_121974 ) ( CLEAR ?auto_121973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121973 )
      ( MAKE-3PILE ?auto_121973 ?auto_121974 ?auto_121975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121988 - BLOCK
      ?auto_121989 - BLOCK
      ?auto_121990 - BLOCK
      ?auto_121991 - BLOCK
    )
    :vars
    (
      ?auto_121992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121990 ) ( ON ?auto_121991 ?auto_121992 ) ( CLEAR ?auto_121991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121988 ) ( ON ?auto_121989 ?auto_121988 ) ( ON ?auto_121990 ?auto_121989 ) ( not ( = ?auto_121988 ?auto_121989 ) ) ( not ( = ?auto_121988 ?auto_121990 ) ) ( not ( = ?auto_121988 ?auto_121991 ) ) ( not ( = ?auto_121988 ?auto_121992 ) ) ( not ( = ?auto_121989 ?auto_121990 ) ) ( not ( = ?auto_121989 ?auto_121991 ) ) ( not ( = ?auto_121989 ?auto_121992 ) ) ( not ( = ?auto_121990 ?auto_121991 ) ) ( not ( = ?auto_121990 ?auto_121992 ) ) ( not ( = ?auto_121991 ?auto_121992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121991 ?auto_121992 )
      ( !STACK ?auto_121991 ?auto_121990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122006 - BLOCK
      ?auto_122007 - BLOCK
      ?auto_122008 - BLOCK
      ?auto_122009 - BLOCK
    )
    :vars
    (
      ?auto_122010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122009 ?auto_122010 ) ( ON-TABLE ?auto_122006 ) ( ON ?auto_122007 ?auto_122006 ) ( not ( = ?auto_122006 ?auto_122007 ) ) ( not ( = ?auto_122006 ?auto_122008 ) ) ( not ( = ?auto_122006 ?auto_122009 ) ) ( not ( = ?auto_122006 ?auto_122010 ) ) ( not ( = ?auto_122007 ?auto_122008 ) ) ( not ( = ?auto_122007 ?auto_122009 ) ) ( not ( = ?auto_122007 ?auto_122010 ) ) ( not ( = ?auto_122008 ?auto_122009 ) ) ( not ( = ?auto_122008 ?auto_122010 ) ) ( not ( = ?auto_122009 ?auto_122010 ) ) ( CLEAR ?auto_122007 ) ( ON ?auto_122008 ?auto_122009 ) ( CLEAR ?auto_122008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122006 ?auto_122007 ?auto_122008 )
      ( MAKE-4PILE ?auto_122006 ?auto_122007 ?auto_122008 ?auto_122009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122024 - BLOCK
      ?auto_122025 - BLOCK
      ?auto_122026 - BLOCK
      ?auto_122027 - BLOCK
    )
    :vars
    (
      ?auto_122028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122027 ?auto_122028 ) ( ON-TABLE ?auto_122024 ) ( not ( = ?auto_122024 ?auto_122025 ) ) ( not ( = ?auto_122024 ?auto_122026 ) ) ( not ( = ?auto_122024 ?auto_122027 ) ) ( not ( = ?auto_122024 ?auto_122028 ) ) ( not ( = ?auto_122025 ?auto_122026 ) ) ( not ( = ?auto_122025 ?auto_122027 ) ) ( not ( = ?auto_122025 ?auto_122028 ) ) ( not ( = ?auto_122026 ?auto_122027 ) ) ( not ( = ?auto_122026 ?auto_122028 ) ) ( not ( = ?auto_122027 ?auto_122028 ) ) ( ON ?auto_122026 ?auto_122027 ) ( CLEAR ?auto_122024 ) ( ON ?auto_122025 ?auto_122026 ) ( CLEAR ?auto_122025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122024 ?auto_122025 )
      ( MAKE-4PILE ?auto_122024 ?auto_122025 ?auto_122026 ?auto_122027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122042 - BLOCK
      ?auto_122043 - BLOCK
      ?auto_122044 - BLOCK
      ?auto_122045 - BLOCK
    )
    :vars
    (
      ?auto_122046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122045 ?auto_122046 ) ( not ( = ?auto_122042 ?auto_122043 ) ) ( not ( = ?auto_122042 ?auto_122044 ) ) ( not ( = ?auto_122042 ?auto_122045 ) ) ( not ( = ?auto_122042 ?auto_122046 ) ) ( not ( = ?auto_122043 ?auto_122044 ) ) ( not ( = ?auto_122043 ?auto_122045 ) ) ( not ( = ?auto_122043 ?auto_122046 ) ) ( not ( = ?auto_122044 ?auto_122045 ) ) ( not ( = ?auto_122044 ?auto_122046 ) ) ( not ( = ?auto_122045 ?auto_122046 ) ) ( ON ?auto_122044 ?auto_122045 ) ( ON ?auto_122043 ?auto_122044 ) ( ON ?auto_122042 ?auto_122043 ) ( CLEAR ?auto_122042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122042 )
      ( MAKE-4PILE ?auto_122042 ?auto_122043 ?auto_122044 ?auto_122045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122061 - BLOCK
      ?auto_122062 - BLOCK
      ?auto_122063 - BLOCK
      ?auto_122064 - BLOCK
      ?auto_122065 - BLOCK
    )
    :vars
    (
      ?auto_122066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122064 ) ( ON ?auto_122065 ?auto_122066 ) ( CLEAR ?auto_122065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122061 ) ( ON ?auto_122062 ?auto_122061 ) ( ON ?auto_122063 ?auto_122062 ) ( ON ?auto_122064 ?auto_122063 ) ( not ( = ?auto_122061 ?auto_122062 ) ) ( not ( = ?auto_122061 ?auto_122063 ) ) ( not ( = ?auto_122061 ?auto_122064 ) ) ( not ( = ?auto_122061 ?auto_122065 ) ) ( not ( = ?auto_122061 ?auto_122066 ) ) ( not ( = ?auto_122062 ?auto_122063 ) ) ( not ( = ?auto_122062 ?auto_122064 ) ) ( not ( = ?auto_122062 ?auto_122065 ) ) ( not ( = ?auto_122062 ?auto_122066 ) ) ( not ( = ?auto_122063 ?auto_122064 ) ) ( not ( = ?auto_122063 ?auto_122065 ) ) ( not ( = ?auto_122063 ?auto_122066 ) ) ( not ( = ?auto_122064 ?auto_122065 ) ) ( not ( = ?auto_122064 ?auto_122066 ) ) ( not ( = ?auto_122065 ?auto_122066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122065 ?auto_122066 )
      ( !STACK ?auto_122065 ?auto_122064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122083 - BLOCK
      ?auto_122084 - BLOCK
      ?auto_122085 - BLOCK
      ?auto_122086 - BLOCK
      ?auto_122087 - BLOCK
    )
    :vars
    (
      ?auto_122088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122087 ?auto_122088 ) ( ON-TABLE ?auto_122083 ) ( ON ?auto_122084 ?auto_122083 ) ( ON ?auto_122085 ?auto_122084 ) ( not ( = ?auto_122083 ?auto_122084 ) ) ( not ( = ?auto_122083 ?auto_122085 ) ) ( not ( = ?auto_122083 ?auto_122086 ) ) ( not ( = ?auto_122083 ?auto_122087 ) ) ( not ( = ?auto_122083 ?auto_122088 ) ) ( not ( = ?auto_122084 ?auto_122085 ) ) ( not ( = ?auto_122084 ?auto_122086 ) ) ( not ( = ?auto_122084 ?auto_122087 ) ) ( not ( = ?auto_122084 ?auto_122088 ) ) ( not ( = ?auto_122085 ?auto_122086 ) ) ( not ( = ?auto_122085 ?auto_122087 ) ) ( not ( = ?auto_122085 ?auto_122088 ) ) ( not ( = ?auto_122086 ?auto_122087 ) ) ( not ( = ?auto_122086 ?auto_122088 ) ) ( not ( = ?auto_122087 ?auto_122088 ) ) ( CLEAR ?auto_122085 ) ( ON ?auto_122086 ?auto_122087 ) ( CLEAR ?auto_122086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122083 ?auto_122084 ?auto_122085 ?auto_122086 )
      ( MAKE-5PILE ?auto_122083 ?auto_122084 ?auto_122085 ?auto_122086 ?auto_122087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122105 - BLOCK
      ?auto_122106 - BLOCK
      ?auto_122107 - BLOCK
      ?auto_122108 - BLOCK
      ?auto_122109 - BLOCK
    )
    :vars
    (
      ?auto_122110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122109 ?auto_122110 ) ( ON-TABLE ?auto_122105 ) ( ON ?auto_122106 ?auto_122105 ) ( not ( = ?auto_122105 ?auto_122106 ) ) ( not ( = ?auto_122105 ?auto_122107 ) ) ( not ( = ?auto_122105 ?auto_122108 ) ) ( not ( = ?auto_122105 ?auto_122109 ) ) ( not ( = ?auto_122105 ?auto_122110 ) ) ( not ( = ?auto_122106 ?auto_122107 ) ) ( not ( = ?auto_122106 ?auto_122108 ) ) ( not ( = ?auto_122106 ?auto_122109 ) ) ( not ( = ?auto_122106 ?auto_122110 ) ) ( not ( = ?auto_122107 ?auto_122108 ) ) ( not ( = ?auto_122107 ?auto_122109 ) ) ( not ( = ?auto_122107 ?auto_122110 ) ) ( not ( = ?auto_122108 ?auto_122109 ) ) ( not ( = ?auto_122108 ?auto_122110 ) ) ( not ( = ?auto_122109 ?auto_122110 ) ) ( ON ?auto_122108 ?auto_122109 ) ( CLEAR ?auto_122106 ) ( ON ?auto_122107 ?auto_122108 ) ( CLEAR ?auto_122107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122105 ?auto_122106 ?auto_122107 )
      ( MAKE-5PILE ?auto_122105 ?auto_122106 ?auto_122107 ?auto_122108 ?auto_122109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122127 - BLOCK
      ?auto_122128 - BLOCK
      ?auto_122129 - BLOCK
      ?auto_122130 - BLOCK
      ?auto_122131 - BLOCK
    )
    :vars
    (
      ?auto_122132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122131 ?auto_122132 ) ( ON-TABLE ?auto_122127 ) ( not ( = ?auto_122127 ?auto_122128 ) ) ( not ( = ?auto_122127 ?auto_122129 ) ) ( not ( = ?auto_122127 ?auto_122130 ) ) ( not ( = ?auto_122127 ?auto_122131 ) ) ( not ( = ?auto_122127 ?auto_122132 ) ) ( not ( = ?auto_122128 ?auto_122129 ) ) ( not ( = ?auto_122128 ?auto_122130 ) ) ( not ( = ?auto_122128 ?auto_122131 ) ) ( not ( = ?auto_122128 ?auto_122132 ) ) ( not ( = ?auto_122129 ?auto_122130 ) ) ( not ( = ?auto_122129 ?auto_122131 ) ) ( not ( = ?auto_122129 ?auto_122132 ) ) ( not ( = ?auto_122130 ?auto_122131 ) ) ( not ( = ?auto_122130 ?auto_122132 ) ) ( not ( = ?auto_122131 ?auto_122132 ) ) ( ON ?auto_122130 ?auto_122131 ) ( ON ?auto_122129 ?auto_122130 ) ( CLEAR ?auto_122127 ) ( ON ?auto_122128 ?auto_122129 ) ( CLEAR ?auto_122128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122127 ?auto_122128 )
      ( MAKE-5PILE ?auto_122127 ?auto_122128 ?auto_122129 ?auto_122130 ?auto_122131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122149 - BLOCK
      ?auto_122150 - BLOCK
      ?auto_122151 - BLOCK
      ?auto_122152 - BLOCK
      ?auto_122153 - BLOCK
    )
    :vars
    (
      ?auto_122154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122153 ?auto_122154 ) ( not ( = ?auto_122149 ?auto_122150 ) ) ( not ( = ?auto_122149 ?auto_122151 ) ) ( not ( = ?auto_122149 ?auto_122152 ) ) ( not ( = ?auto_122149 ?auto_122153 ) ) ( not ( = ?auto_122149 ?auto_122154 ) ) ( not ( = ?auto_122150 ?auto_122151 ) ) ( not ( = ?auto_122150 ?auto_122152 ) ) ( not ( = ?auto_122150 ?auto_122153 ) ) ( not ( = ?auto_122150 ?auto_122154 ) ) ( not ( = ?auto_122151 ?auto_122152 ) ) ( not ( = ?auto_122151 ?auto_122153 ) ) ( not ( = ?auto_122151 ?auto_122154 ) ) ( not ( = ?auto_122152 ?auto_122153 ) ) ( not ( = ?auto_122152 ?auto_122154 ) ) ( not ( = ?auto_122153 ?auto_122154 ) ) ( ON ?auto_122152 ?auto_122153 ) ( ON ?auto_122151 ?auto_122152 ) ( ON ?auto_122150 ?auto_122151 ) ( ON ?auto_122149 ?auto_122150 ) ( CLEAR ?auto_122149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122149 )
      ( MAKE-5PILE ?auto_122149 ?auto_122150 ?auto_122151 ?auto_122152 ?auto_122153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122172 - BLOCK
      ?auto_122173 - BLOCK
      ?auto_122174 - BLOCK
      ?auto_122175 - BLOCK
      ?auto_122176 - BLOCK
      ?auto_122177 - BLOCK
    )
    :vars
    (
      ?auto_122178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122176 ) ( ON ?auto_122177 ?auto_122178 ) ( CLEAR ?auto_122177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122172 ) ( ON ?auto_122173 ?auto_122172 ) ( ON ?auto_122174 ?auto_122173 ) ( ON ?auto_122175 ?auto_122174 ) ( ON ?auto_122176 ?auto_122175 ) ( not ( = ?auto_122172 ?auto_122173 ) ) ( not ( = ?auto_122172 ?auto_122174 ) ) ( not ( = ?auto_122172 ?auto_122175 ) ) ( not ( = ?auto_122172 ?auto_122176 ) ) ( not ( = ?auto_122172 ?auto_122177 ) ) ( not ( = ?auto_122172 ?auto_122178 ) ) ( not ( = ?auto_122173 ?auto_122174 ) ) ( not ( = ?auto_122173 ?auto_122175 ) ) ( not ( = ?auto_122173 ?auto_122176 ) ) ( not ( = ?auto_122173 ?auto_122177 ) ) ( not ( = ?auto_122173 ?auto_122178 ) ) ( not ( = ?auto_122174 ?auto_122175 ) ) ( not ( = ?auto_122174 ?auto_122176 ) ) ( not ( = ?auto_122174 ?auto_122177 ) ) ( not ( = ?auto_122174 ?auto_122178 ) ) ( not ( = ?auto_122175 ?auto_122176 ) ) ( not ( = ?auto_122175 ?auto_122177 ) ) ( not ( = ?auto_122175 ?auto_122178 ) ) ( not ( = ?auto_122176 ?auto_122177 ) ) ( not ( = ?auto_122176 ?auto_122178 ) ) ( not ( = ?auto_122177 ?auto_122178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122177 ?auto_122178 )
      ( !STACK ?auto_122177 ?auto_122176 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122198 - BLOCK
      ?auto_122199 - BLOCK
      ?auto_122200 - BLOCK
      ?auto_122201 - BLOCK
      ?auto_122202 - BLOCK
      ?auto_122203 - BLOCK
    )
    :vars
    (
      ?auto_122204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122203 ?auto_122204 ) ( ON-TABLE ?auto_122198 ) ( ON ?auto_122199 ?auto_122198 ) ( ON ?auto_122200 ?auto_122199 ) ( ON ?auto_122201 ?auto_122200 ) ( not ( = ?auto_122198 ?auto_122199 ) ) ( not ( = ?auto_122198 ?auto_122200 ) ) ( not ( = ?auto_122198 ?auto_122201 ) ) ( not ( = ?auto_122198 ?auto_122202 ) ) ( not ( = ?auto_122198 ?auto_122203 ) ) ( not ( = ?auto_122198 ?auto_122204 ) ) ( not ( = ?auto_122199 ?auto_122200 ) ) ( not ( = ?auto_122199 ?auto_122201 ) ) ( not ( = ?auto_122199 ?auto_122202 ) ) ( not ( = ?auto_122199 ?auto_122203 ) ) ( not ( = ?auto_122199 ?auto_122204 ) ) ( not ( = ?auto_122200 ?auto_122201 ) ) ( not ( = ?auto_122200 ?auto_122202 ) ) ( not ( = ?auto_122200 ?auto_122203 ) ) ( not ( = ?auto_122200 ?auto_122204 ) ) ( not ( = ?auto_122201 ?auto_122202 ) ) ( not ( = ?auto_122201 ?auto_122203 ) ) ( not ( = ?auto_122201 ?auto_122204 ) ) ( not ( = ?auto_122202 ?auto_122203 ) ) ( not ( = ?auto_122202 ?auto_122204 ) ) ( not ( = ?auto_122203 ?auto_122204 ) ) ( CLEAR ?auto_122201 ) ( ON ?auto_122202 ?auto_122203 ) ( CLEAR ?auto_122202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122198 ?auto_122199 ?auto_122200 ?auto_122201 ?auto_122202 )
      ( MAKE-6PILE ?auto_122198 ?auto_122199 ?auto_122200 ?auto_122201 ?auto_122202 ?auto_122203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122224 - BLOCK
      ?auto_122225 - BLOCK
      ?auto_122226 - BLOCK
      ?auto_122227 - BLOCK
      ?auto_122228 - BLOCK
      ?auto_122229 - BLOCK
    )
    :vars
    (
      ?auto_122230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122229 ?auto_122230 ) ( ON-TABLE ?auto_122224 ) ( ON ?auto_122225 ?auto_122224 ) ( ON ?auto_122226 ?auto_122225 ) ( not ( = ?auto_122224 ?auto_122225 ) ) ( not ( = ?auto_122224 ?auto_122226 ) ) ( not ( = ?auto_122224 ?auto_122227 ) ) ( not ( = ?auto_122224 ?auto_122228 ) ) ( not ( = ?auto_122224 ?auto_122229 ) ) ( not ( = ?auto_122224 ?auto_122230 ) ) ( not ( = ?auto_122225 ?auto_122226 ) ) ( not ( = ?auto_122225 ?auto_122227 ) ) ( not ( = ?auto_122225 ?auto_122228 ) ) ( not ( = ?auto_122225 ?auto_122229 ) ) ( not ( = ?auto_122225 ?auto_122230 ) ) ( not ( = ?auto_122226 ?auto_122227 ) ) ( not ( = ?auto_122226 ?auto_122228 ) ) ( not ( = ?auto_122226 ?auto_122229 ) ) ( not ( = ?auto_122226 ?auto_122230 ) ) ( not ( = ?auto_122227 ?auto_122228 ) ) ( not ( = ?auto_122227 ?auto_122229 ) ) ( not ( = ?auto_122227 ?auto_122230 ) ) ( not ( = ?auto_122228 ?auto_122229 ) ) ( not ( = ?auto_122228 ?auto_122230 ) ) ( not ( = ?auto_122229 ?auto_122230 ) ) ( ON ?auto_122228 ?auto_122229 ) ( CLEAR ?auto_122226 ) ( ON ?auto_122227 ?auto_122228 ) ( CLEAR ?auto_122227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122224 ?auto_122225 ?auto_122226 ?auto_122227 )
      ( MAKE-6PILE ?auto_122224 ?auto_122225 ?auto_122226 ?auto_122227 ?auto_122228 ?auto_122229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122250 - BLOCK
      ?auto_122251 - BLOCK
      ?auto_122252 - BLOCK
      ?auto_122253 - BLOCK
      ?auto_122254 - BLOCK
      ?auto_122255 - BLOCK
    )
    :vars
    (
      ?auto_122256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122255 ?auto_122256 ) ( ON-TABLE ?auto_122250 ) ( ON ?auto_122251 ?auto_122250 ) ( not ( = ?auto_122250 ?auto_122251 ) ) ( not ( = ?auto_122250 ?auto_122252 ) ) ( not ( = ?auto_122250 ?auto_122253 ) ) ( not ( = ?auto_122250 ?auto_122254 ) ) ( not ( = ?auto_122250 ?auto_122255 ) ) ( not ( = ?auto_122250 ?auto_122256 ) ) ( not ( = ?auto_122251 ?auto_122252 ) ) ( not ( = ?auto_122251 ?auto_122253 ) ) ( not ( = ?auto_122251 ?auto_122254 ) ) ( not ( = ?auto_122251 ?auto_122255 ) ) ( not ( = ?auto_122251 ?auto_122256 ) ) ( not ( = ?auto_122252 ?auto_122253 ) ) ( not ( = ?auto_122252 ?auto_122254 ) ) ( not ( = ?auto_122252 ?auto_122255 ) ) ( not ( = ?auto_122252 ?auto_122256 ) ) ( not ( = ?auto_122253 ?auto_122254 ) ) ( not ( = ?auto_122253 ?auto_122255 ) ) ( not ( = ?auto_122253 ?auto_122256 ) ) ( not ( = ?auto_122254 ?auto_122255 ) ) ( not ( = ?auto_122254 ?auto_122256 ) ) ( not ( = ?auto_122255 ?auto_122256 ) ) ( ON ?auto_122254 ?auto_122255 ) ( ON ?auto_122253 ?auto_122254 ) ( CLEAR ?auto_122251 ) ( ON ?auto_122252 ?auto_122253 ) ( CLEAR ?auto_122252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122250 ?auto_122251 ?auto_122252 )
      ( MAKE-6PILE ?auto_122250 ?auto_122251 ?auto_122252 ?auto_122253 ?auto_122254 ?auto_122255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122276 - BLOCK
      ?auto_122277 - BLOCK
      ?auto_122278 - BLOCK
      ?auto_122279 - BLOCK
      ?auto_122280 - BLOCK
      ?auto_122281 - BLOCK
    )
    :vars
    (
      ?auto_122282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122281 ?auto_122282 ) ( ON-TABLE ?auto_122276 ) ( not ( = ?auto_122276 ?auto_122277 ) ) ( not ( = ?auto_122276 ?auto_122278 ) ) ( not ( = ?auto_122276 ?auto_122279 ) ) ( not ( = ?auto_122276 ?auto_122280 ) ) ( not ( = ?auto_122276 ?auto_122281 ) ) ( not ( = ?auto_122276 ?auto_122282 ) ) ( not ( = ?auto_122277 ?auto_122278 ) ) ( not ( = ?auto_122277 ?auto_122279 ) ) ( not ( = ?auto_122277 ?auto_122280 ) ) ( not ( = ?auto_122277 ?auto_122281 ) ) ( not ( = ?auto_122277 ?auto_122282 ) ) ( not ( = ?auto_122278 ?auto_122279 ) ) ( not ( = ?auto_122278 ?auto_122280 ) ) ( not ( = ?auto_122278 ?auto_122281 ) ) ( not ( = ?auto_122278 ?auto_122282 ) ) ( not ( = ?auto_122279 ?auto_122280 ) ) ( not ( = ?auto_122279 ?auto_122281 ) ) ( not ( = ?auto_122279 ?auto_122282 ) ) ( not ( = ?auto_122280 ?auto_122281 ) ) ( not ( = ?auto_122280 ?auto_122282 ) ) ( not ( = ?auto_122281 ?auto_122282 ) ) ( ON ?auto_122280 ?auto_122281 ) ( ON ?auto_122279 ?auto_122280 ) ( ON ?auto_122278 ?auto_122279 ) ( CLEAR ?auto_122276 ) ( ON ?auto_122277 ?auto_122278 ) ( CLEAR ?auto_122277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122276 ?auto_122277 )
      ( MAKE-6PILE ?auto_122276 ?auto_122277 ?auto_122278 ?auto_122279 ?auto_122280 ?auto_122281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122302 - BLOCK
      ?auto_122303 - BLOCK
      ?auto_122304 - BLOCK
      ?auto_122305 - BLOCK
      ?auto_122306 - BLOCK
      ?auto_122307 - BLOCK
    )
    :vars
    (
      ?auto_122308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122307 ?auto_122308 ) ( not ( = ?auto_122302 ?auto_122303 ) ) ( not ( = ?auto_122302 ?auto_122304 ) ) ( not ( = ?auto_122302 ?auto_122305 ) ) ( not ( = ?auto_122302 ?auto_122306 ) ) ( not ( = ?auto_122302 ?auto_122307 ) ) ( not ( = ?auto_122302 ?auto_122308 ) ) ( not ( = ?auto_122303 ?auto_122304 ) ) ( not ( = ?auto_122303 ?auto_122305 ) ) ( not ( = ?auto_122303 ?auto_122306 ) ) ( not ( = ?auto_122303 ?auto_122307 ) ) ( not ( = ?auto_122303 ?auto_122308 ) ) ( not ( = ?auto_122304 ?auto_122305 ) ) ( not ( = ?auto_122304 ?auto_122306 ) ) ( not ( = ?auto_122304 ?auto_122307 ) ) ( not ( = ?auto_122304 ?auto_122308 ) ) ( not ( = ?auto_122305 ?auto_122306 ) ) ( not ( = ?auto_122305 ?auto_122307 ) ) ( not ( = ?auto_122305 ?auto_122308 ) ) ( not ( = ?auto_122306 ?auto_122307 ) ) ( not ( = ?auto_122306 ?auto_122308 ) ) ( not ( = ?auto_122307 ?auto_122308 ) ) ( ON ?auto_122306 ?auto_122307 ) ( ON ?auto_122305 ?auto_122306 ) ( ON ?auto_122304 ?auto_122305 ) ( ON ?auto_122303 ?auto_122304 ) ( ON ?auto_122302 ?auto_122303 ) ( CLEAR ?auto_122302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122302 )
      ( MAKE-6PILE ?auto_122302 ?auto_122303 ?auto_122304 ?auto_122305 ?auto_122306 ?auto_122307 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122329 - BLOCK
      ?auto_122330 - BLOCK
      ?auto_122331 - BLOCK
      ?auto_122332 - BLOCK
      ?auto_122333 - BLOCK
      ?auto_122334 - BLOCK
      ?auto_122335 - BLOCK
    )
    :vars
    (
      ?auto_122336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122334 ) ( ON ?auto_122335 ?auto_122336 ) ( CLEAR ?auto_122335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122329 ) ( ON ?auto_122330 ?auto_122329 ) ( ON ?auto_122331 ?auto_122330 ) ( ON ?auto_122332 ?auto_122331 ) ( ON ?auto_122333 ?auto_122332 ) ( ON ?auto_122334 ?auto_122333 ) ( not ( = ?auto_122329 ?auto_122330 ) ) ( not ( = ?auto_122329 ?auto_122331 ) ) ( not ( = ?auto_122329 ?auto_122332 ) ) ( not ( = ?auto_122329 ?auto_122333 ) ) ( not ( = ?auto_122329 ?auto_122334 ) ) ( not ( = ?auto_122329 ?auto_122335 ) ) ( not ( = ?auto_122329 ?auto_122336 ) ) ( not ( = ?auto_122330 ?auto_122331 ) ) ( not ( = ?auto_122330 ?auto_122332 ) ) ( not ( = ?auto_122330 ?auto_122333 ) ) ( not ( = ?auto_122330 ?auto_122334 ) ) ( not ( = ?auto_122330 ?auto_122335 ) ) ( not ( = ?auto_122330 ?auto_122336 ) ) ( not ( = ?auto_122331 ?auto_122332 ) ) ( not ( = ?auto_122331 ?auto_122333 ) ) ( not ( = ?auto_122331 ?auto_122334 ) ) ( not ( = ?auto_122331 ?auto_122335 ) ) ( not ( = ?auto_122331 ?auto_122336 ) ) ( not ( = ?auto_122332 ?auto_122333 ) ) ( not ( = ?auto_122332 ?auto_122334 ) ) ( not ( = ?auto_122332 ?auto_122335 ) ) ( not ( = ?auto_122332 ?auto_122336 ) ) ( not ( = ?auto_122333 ?auto_122334 ) ) ( not ( = ?auto_122333 ?auto_122335 ) ) ( not ( = ?auto_122333 ?auto_122336 ) ) ( not ( = ?auto_122334 ?auto_122335 ) ) ( not ( = ?auto_122334 ?auto_122336 ) ) ( not ( = ?auto_122335 ?auto_122336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122335 ?auto_122336 )
      ( !STACK ?auto_122335 ?auto_122334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122359 - BLOCK
      ?auto_122360 - BLOCK
      ?auto_122361 - BLOCK
      ?auto_122362 - BLOCK
      ?auto_122363 - BLOCK
      ?auto_122364 - BLOCK
      ?auto_122365 - BLOCK
    )
    :vars
    (
      ?auto_122366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122365 ?auto_122366 ) ( ON-TABLE ?auto_122359 ) ( ON ?auto_122360 ?auto_122359 ) ( ON ?auto_122361 ?auto_122360 ) ( ON ?auto_122362 ?auto_122361 ) ( ON ?auto_122363 ?auto_122362 ) ( not ( = ?auto_122359 ?auto_122360 ) ) ( not ( = ?auto_122359 ?auto_122361 ) ) ( not ( = ?auto_122359 ?auto_122362 ) ) ( not ( = ?auto_122359 ?auto_122363 ) ) ( not ( = ?auto_122359 ?auto_122364 ) ) ( not ( = ?auto_122359 ?auto_122365 ) ) ( not ( = ?auto_122359 ?auto_122366 ) ) ( not ( = ?auto_122360 ?auto_122361 ) ) ( not ( = ?auto_122360 ?auto_122362 ) ) ( not ( = ?auto_122360 ?auto_122363 ) ) ( not ( = ?auto_122360 ?auto_122364 ) ) ( not ( = ?auto_122360 ?auto_122365 ) ) ( not ( = ?auto_122360 ?auto_122366 ) ) ( not ( = ?auto_122361 ?auto_122362 ) ) ( not ( = ?auto_122361 ?auto_122363 ) ) ( not ( = ?auto_122361 ?auto_122364 ) ) ( not ( = ?auto_122361 ?auto_122365 ) ) ( not ( = ?auto_122361 ?auto_122366 ) ) ( not ( = ?auto_122362 ?auto_122363 ) ) ( not ( = ?auto_122362 ?auto_122364 ) ) ( not ( = ?auto_122362 ?auto_122365 ) ) ( not ( = ?auto_122362 ?auto_122366 ) ) ( not ( = ?auto_122363 ?auto_122364 ) ) ( not ( = ?auto_122363 ?auto_122365 ) ) ( not ( = ?auto_122363 ?auto_122366 ) ) ( not ( = ?auto_122364 ?auto_122365 ) ) ( not ( = ?auto_122364 ?auto_122366 ) ) ( not ( = ?auto_122365 ?auto_122366 ) ) ( CLEAR ?auto_122363 ) ( ON ?auto_122364 ?auto_122365 ) ( CLEAR ?auto_122364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122359 ?auto_122360 ?auto_122361 ?auto_122362 ?auto_122363 ?auto_122364 )
      ( MAKE-7PILE ?auto_122359 ?auto_122360 ?auto_122361 ?auto_122362 ?auto_122363 ?auto_122364 ?auto_122365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122389 - BLOCK
      ?auto_122390 - BLOCK
      ?auto_122391 - BLOCK
      ?auto_122392 - BLOCK
      ?auto_122393 - BLOCK
      ?auto_122394 - BLOCK
      ?auto_122395 - BLOCK
    )
    :vars
    (
      ?auto_122396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122395 ?auto_122396 ) ( ON-TABLE ?auto_122389 ) ( ON ?auto_122390 ?auto_122389 ) ( ON ?auto_122391 ?auto_122390 ) ( ON ?auto_122392 ?auto_122391 ) ( not ( = ?auto_122389 ?auto_122390 ) ) ( not ( = ?auto_122389 ?auto_122391 ) ) ( not ( = ?auto_122389 ?auto_122392 ) ) ( not ( = ?auto_122389 ?auto_122393 ) ) ( not ( = ?auto_122389 ?auto_122394 ) ) ( not ( = ?auto_122389 ?auto_122395 ) ) ( not ( = ?auto_122389 ?auto_122396 ) ) ( not ( = ?auto_122390 ?auto_122391 ) ) ( not ( = ?auto_122390 ?auto_122392 ) ) ( not ( = ?auto_122390 ?auto_122393 ) ) ( not ( = ?auto_122390 ?auto_122394 ) ) ( not ( = ?auto_122390 ?auto_122395 ) ) ( not ( = ?auto_122390 ?auto_122396 ) ) ( not ( = ?auto_122391 ?auto_122392 ) ) ( not ( = ?auto_122391 ?auto_122393 ) ) ( not ( = ?auto_122391 ?auto_122394 ) ) ( not ( = ?auto_122391 ?auto_122395 ) ) ( not ( = ?auto_122391 ?auto_122396 ) ) ( not ( = ?auto_122392 ?auto_122393 ) ) ( not ( = ?auto_122392 ?auto_122394 ) ) ( not ( = ?auto_122392 ?auto_122395 ) ) ( not ( = ?auto_122392 ?auto_122396 ) ) ( not ( = ?auto_122393 ?auto_122394 ) ) ( not ( = ?auto_122393 ?auto_122395 ) ) ( not ( = ?auto_122393 ?auto_122396 ) ) ( not ( = ?auto_122394 ?auto_122395 ) ) ( not ( = ?auto_122394 ?auto_122396 ) ) ( not ( = ?auto_122395 ?auto_122396 ) ) ( ON ?auto_122394 ?auto_122395 ) ( CLEAR ?auto_122392 ) ( ON ?auto_122393 ?auto_122394 ) ( CLEAR ?auto_122393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122389 ?auto_122390 ?auto_122391 ?auto_122392 ?auto_122393 )
      ( MAKE-7PILE ?auto_122389 ?auto_122390 ?auto_122391 ?auto_122392 ?auto_122393 ?auto_122394 ?auto_122395 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122419 - BLOCK
      ?auto_122420 - BLOCK
      ?auto_122421 - BLOCK
      ?auto_122422 - BLOCK
      ?auto_122423 - BLOCK
      ?auto_122424 - BLOCK
      ?auto_122425 - BLOCK
    )
    :vars
    (
      ?auto_122426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122425 ?auto_122426 ) ( ON-TABLE ?auto_122419 ) ( ON ?auto_122420 ?auto_122419 ) ( ON ?auto_122421 ?auto_122420 ) ( not ( = ?auto_122419 ?auto_122420 ) ) ( not ( = ?auto_122419 ?auto_122421 ) ) ( not ( = ?auto_122419 ?auto_122422 ) ) ( not ( = ?auto_122419 ?auto_122423 ) ) ( not ( = ?auto_122419 ?auto_122424 ) ) ( not ( = ?auto_122419 ?auto_122425 ) ) ( not ( = ?auto_122419 ?auto_122426 ) ) ( not ( = ?auto_122420 ?auto_122421 ) ) ( not ( = ?auto_122420 ?auto_122422 ) ) ( not ( = ?auto_122420 ?auto_122423 ) ) ( not ( = ?auto_122420 ?auto_122424 ) ) ( not ( = ?auto_122420 ?auto_122425 ) ) ( not ( = ?auto_122420 ?auto_122426 ) ) ( not ( = ?auto_122421 ?auto_122422 ) ) ( not ( = ?auto_122421 ?auto_122423 ) ) ( not ( = ?auto_122421 ?auto_122424 ) ) ( not ( = ?auto_122421 ?auto_122425 ) ) ( not ( = ?auto_122421 ?auto_122426 ) ) ( not ( = ?auto_122422 ?auto_122423 ) ) ( not ( = ?auto_122422 ?auto_122424 ) ) ( not ( = ?auto_122422 ?auto_122425 ) ) ( not ( = ?auto_122422 ?auto_122426 ) ) ( not ( = ?auto_122423 ?auto_122424 ) ) ( not ( = ?auto_122423 ?auto_122425 ) ) ( not ( = ?auto_122423 ?auto_122426 ) ) ( not ( = ?auto_122424 ?auto_122425 ) ) ( not ( = ?auto_122424 ?auto_122426 ) ) ( not ( = ?auto_122425 ?auto_122426 ) ) ( ON ?auto_122424 ?auto_122425 ) ( ON ?auto_122423 ?auto_122424 ) ( CLEAR ?auto_122421 ) ( ON ?auto_122422 ?auto_122423 ) ( CLEAR ?auto_122422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122419 ?auto_122420 ?auto_122421 ?auto_122422 )
      ( MAKE-7PILE ?auto_122419 ?auto_122420 ?auto_122421 ?auto_122422 ?auto_122423 ?auto_122424 ?auto_122425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122449 - BLOCK
      ?auto_122450 - BLOCK
      ?auto_122451 - BLOCK
      ?auto_122452 - BLOCK
      ?auto_122453 - BLOCK
      ?auto_122454 - BLOCK
      ?auto_122455 - BLOCK
    )
    :vars
    (
      ?auto_122456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122455 ?auto_122456 ) ( ON-TABLE ?auto_122449 ) ( ON ?auto_122450 ?auto_122449 ) ( not ( = ?auto_122449 ?auto_122450 ) ) ( not ( = ?auto_122449 ?auto_122451 ) ) ( not ( = ?auto_122449 ?auto_122452 ) ) ( not ( = ?auto_122449 ?auto_122453 ) ) ( not ( = ?auto_122449 ?auto_122454 ) ) ( not ( = ?auto_122449 ?auto_122455 ) ) ( not ( = ?auto_122449 ?auto_122456 ) ) ( not ( = ?auto_122450 ?auto_122451 ) ) ( not ( = ?auto_122450 ?auto_122452 ) ) ( not ( = ?auto_122450 ?auto_122453 ) ) ( not ( = ?auto_122450 ?auto_122454 ) ) ( not ( = ?auto_122450 ?auto_122455 ) ) ( not ( = ?auto_122450 ?auto_122456 ) ) ( not ( = ?auto_122451 ?auto_122452 ) ) ( not ( = ?auto_122451 ?auto_122453 ) ) ( not ( = ?auto_122451 ?auto_122454 ) ) ( not ( = ?auto_122451 ?auto_122455 ) ) ( not ( = ?auto_122451 ?auto_122456 ) ) ( not ( = ?auto_122452 ?auto_122453 ) ) ( not ( = ?auto_122452 ?auto_122454 ) ) ( not ( = ?auto_122452 ?auto_122455 ) ) ( not ( = ?auto_122452 ?auto_122456 ) ) ( not ( = ?auto_122453 ?auto_122454 ) ) ( not ( = ?auto_122453 ?auto_122455 ) ) ( not ( = ?auto_122453 ?auto_122456 ) ) ( not ( = ?auto_122454 ?auto_122455 ) ) ( not ( = ?auto_122454 ?auto_122456 ) ) ( not ( = ?auto_122455 ?auto_122456 ) ) ( ON ?auto_122454 ?auto_122455 ) ( ON ?auto_122453 ?auto_122454 ) ( ON ?auto_122452 ?auto_122453 ) ( CLEAR ?auto_122450 ) ( ON ?auto_122451 ?auto_122452 ) ( CLEAR ?auto_122451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122449 ?auto_122450 ?auto_122451 )
      ( MAKE-7PILE ?auto_122449 ?auto_122450 ?auto_122451 ?auto_122452 ?auto_122453 ?auto_122454 ?auto_122455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122479 - BLOCK
      ?auto_122480 - BLOCK
      ?auto_122481 - BLOCK
      ?auto_122482 - BLOCK
      ?auto_122483 - BLOCK
      ?auto_122484 - BLOCK
      ?auto_122485 - BLOCK
    )
    :vars
    (
      ?auto_122486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122485 ?auto_122486 ) ( ON-TABLE ?auto_122479 ) ( not ( = ?auto_122479 ?auto_122480 ) ) ( not ( = ?auto_122479 ?auto_122481 ) ) ( not ( = ?auto_122479 ?auto_122482 ) ) ( not ( = ?auto_122479 ?auto_122483 ) ) ( not ( = ?auto_122479 ?auto_122484 ) ) ( not ( = ?auto_122479 ?auto_122485 ) ) ( not ( = ?auto_122479 ?auto_122486 ) ) ( not ( = ?auto_122480 ?auto_122481 ) ) ( not ( = ?auto_122480 ?auto_122482 ) ) ( not ( = ?auto_122480 ?auto_122483 ) ) ( not ( = ?auto_122480 ?auto_122484 ) ) ( not ( = ?auto_122480 ?auto_122485 ) ) ( not ( = ?auto_122480 ?auto_122486 ) ) ( not ( = ?auto_122481 ?auto_122482 ) ) ( not ( = ?auto_122481 ?auto_122483 ) ) ( not ( = ?auto_122481 ?auto_122484 ) ) ( not ( = ?auto_122481 ?auto_122485 ) ) ( not ( = ?auto_122481 ?auto_122486 ) ) ( not ( = ?auto_122482 ?auto_122483 ) ) ( not ( = ?auto_122482 ?auto_122484 ) ) ( not ( = ?auto_122482 ?auto_122485 ) ) ( not ( = ?auto_122482 ?auto_122486 ) ) ( not ( = ?auto_122483 ?auto_122484 ) ) ( not ( = ?auto_122483 ?auto_122485 ) ) ( not ( = ?auto_122483 ?auto_122486 ) ) ( not ( = ?auto_122484 ?auto_122485 ) ) ( not ( = ?auto_122484 ?auto_122486 ) ) ( not ( = ?auto_122485 ?auto_122486 ) ) ( ON ?auto_122484 ?auto_122485 ) ( ON ?auto_122483 ?auto_122484 ) ( ON ?auto_122482 ?auto_122483 ) ( ON ?auto_122481 ?auto_122482 ) ( CLEAR ?auto_122479 ) ( ON ?auto_122480 ?auto_122481 ) ( CLEAR ?auto_122480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122479 ?auto_122480 )
      ( MAKE-7PILE ?auto_122479 ?auto_122480 ?auto_122481 ?auto_122482 ?auto_122483 ?auto_122484 ?auto_122485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122509 - BLOCK
      ?auto_122510 - BLOCK
      ?auto_122511 - BLOCK
      ?auto_122512 - BLOCK
      ?auto_122513 - BLOCK
      ?auto_122514 - BLOCK
      ?auto_122515 - BLOCK
    )
    :vars
    (
      ?auto_122516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122515 ?auto_122516 ) ( not ( = ?auto_122509 ?auto_122510 ) ) ( not ( = ?auto_122509 ?auto_122511 ) ) ( not ( = ?auto_122509 ?auto_122512 ) ) ( not ( = ?auto_122509 ?auto_122513 ) ) ( not ( = ?auto_122509 ?auto_122514 ) ) ( not ( = ?auto_122509 ?auto_122515 ) ) ( not ( = ?auto_122509 ?auto_122516 ) ) ( not ( = ?auto_122510 ?auto_122511 ) ) ( not ( = ?auto_122510 ?auto_122512 ) ) ( not ( = ?auto_122510 ?auto_122513 ) ) ( not ( = ?auto_122510 ?auto_122514 ) ) ( not ( = ?auto_122510 ?auto_122515 ) ) ( not ( = ?auto_122510 ?auto_122516 ) ) ( not ( = ?auto_122511 ?auto_122512 ) ) ( not ( = ?auto_122511 ?auto_122513 ) ) ( not ( = ?auto_122511 ?auto_122514 ) ) ( not ( = ?auto_122511 ?auto_122515 ) ) ( not ( = ?auto_122511 ?auto_122516 ) ) ( not ( = ?auto_122512 ?auto_122513 ) ) ( not ( = ?auto_122512 ?auto_122514 ) ) ( not ( = ?auto_122512 ?auto_122515 ) ) ( not ( = ?auto_122512 ?auto_122516 ) ) ( not ( = ?auto_122513 ?auto_122514 ) ) ( not ( = ?auto_122513 ?auto_122515 ) ) ( not ( = ?auto_122513 ?auto_122516 ) ) ( not ( = ?auto_122514 ?auto_122515 ) ) ( not ( = ?auto_122514 ?auto_122516 ) ) ( not ( = ?auto_122515 ?auto_122516 ) ) ( ON ?auto_122514 ?auto_122515 ) ( ON ?auto_122513 ?auto_122514 ) ( ON ?auto_122512 ?auto_122513 ) ( ON ?auto_122511 ?auto_122512 ) ( ON ?auto_122510 ?auto_122511 ) ( ON ?auto_122509 ?auto_122510 ) ( CLEAR ?auto_122509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122509 )
      ( MAKE-7PILE ?auto_122509 ?auto_122510 ?auto_122511 ?auto_122512 ?auto_122513 ?auto_122514 ?auto_122515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122540 - BLOCK
      ?auto_122541 - BLOCK
      ?auto_122542 - BLOCK
      ?auto_122543 - BLOCK
      ?auto_122544 - BLOCK
      ?auto_122545 - BLOCK
      ?auto_122546 - BLOCK
      ?auto_122547 - BLOCK
    )
    :vars
    (
      ?auto_122548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122546 ) ( ON ?auto_122547 ?auto_122548 ) ( CLEAR ?auto_122547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122540 ) ( ON ?auto_122541 ?auto_122540 ) ( ON ?auto_122542 ?auto_122541 ) ( ON ?auto_122543 ?auto_122542 ) ( ON ?auto_122544 ?auto_122543 ) ( ON ?auto_122545 ?auto_122544 ) ( ON ?auto_122546 ?auto_122545 ) ( not ( = ?auto_122540 ?auto_122541 ) ) ( not ( = ?auto_122540 ?auto_122542 ) ) ( not ( = ?auto_122540 ?auto_122543 ) ) ( not ( = ?auto_122540 ?auto_122544 ) ) ( not ( = ?auto_122540 ?auto_122545 ) ) ( not ( = ?auto_122540 ?auto_122546 ) ) ( not ( = ?auto_122540 ?auto_122547 ) ) ( not ( = ?auto_122540 ?auto_122548 ) ) ( not ( = ?auto_122541 ?auto_122542 ) ) ( not ( = ?auto_122541 ?auto_122543 ) ) ( not ( = ?auto_122541 ?auto_122544 ) ) ( not ( = ?auto_122541 ?auto_122545 ) ) ( not ( = ?auto_122541 ?auto_122546 ) ) ( not ( = ?auto_122541 ?auto_122547 ) ) ( not ( = ?auto_122541 ?auto_122548 ) ) ( not ( = ?auto_122542 ?auto_122543 ) ) ( not ( = ?auto_122542 ?auto_122544 ) ) ( not ( = ?auto_122542 ?auto_122545 ) ) ( not ( = ?auto_122542 ?auto_122546 ) ) ( not ( = ?auto_122542 ?auto_122547 ) ) ( not ( = ?auto_122542 ?auto_122548 ) ) ( not ( = ?auto_122543 ?auto_122544 ) ) ( not ( = ?auto_122543 ?auto_122545 ) ) ( not ( = ?auto_122543 ?auto_122546 ) ) ( not ( = ?auto_122543 ?auto_122547 ) ) ( not ( = ?auto_122543 ?auto_122548 ) ) ( not ( = ?auto_122544 ?auto_122545 ) ) ( not ( = ?auto_122544 ?auto_122546 ) ) ( not ( = ?auto_122544 ?auto_122547 ) ) ( not ( = ?auto_122544 ?auto_122548 ) ) ( not ( = ?auto_122545 ?auto_122546 ) ) ( not ( = ?auto_122545 ?auto_122547 ) ) ( not ( = ?auto_122545 ?auto_122548 ) ) ( not ( = ?auto_122546 ?auto_122547 ) ) ( not ( = ?auto_122546 ?auto_122548 ) ) ( not ( = ?auto_122547 ?auto_122548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122547 ?auto_122548 )
      ( !STACK ?auto_122547 ?auto_122546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122574 - BLOCK
      ?auto_122575 - BLOCK
      ?auto_122576 - BLOCK
      ?auto_122577 - BLOCK
      ?auto_122578 - BLOCK
      ?auto_122579 - BLOCK
      ?auto_122580 - BLOCK
      ?auto_122581 - BLOCK
    )
    :vars
    (
      ?auto_122582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122581 ?auto_122582 ) ( ON-TABLE ?auto_122574 ) ( ON ?auto_122575 ?auto_122574 ) ( ON ?auto_122576 ?auto_122575 ) ( ON ?auto_122577 ?auto_122576 ) ( ON ?auto_122578 ?auto_122577 ) ( ON ?auto_122579 ?auto_122578 ) ( not ( = ?auto_122574 ?auto_122575 ) ) ( not ( = ?auto_122574 ?auto_122576 ) ) ( not ( = ?auto_122574 ?auto_122577 ) ) ( not ( = ?auto_122574 ?auto_122578 ) ) ( not ( = ?auto_122574 ?auto_122579 ) ) ( not ( = ?auto_122574 ?auto_122580 ) ) ( not ( = ?auto_122574 ?auto_122581 ) ) ( not ( = ?auto_122574 ?auto_122582 ) ) ( not ( = ?auto_122575 ?auto_122576 ) ) ( not ( = ?auto_122575 ?auto_122577 ) ) ( not ( = ?auto_122575 ?auto_122578 ) ) ( not ( = ?auto_122575 ?auto_122579 ) ) ( not ( = ?auto_122575 ?auto_122580 ) ) ( not ( = ?auto_122575 ?auto_122581 ) ) ( not ( = ?auto_122575 ?auto_122582 ) ) ( not ( = ?auto_122576 ?auto_122577 ) ) ( not ( = ?auto_122576 ?auto_122578 ) ) ( not ( = ?auto_122576 ?auto_122579 ) ) ( not ( = ?auto_122576 ?auto_122580 ) ) ( not ( = ?auto_122576 ?auto_122581 ) ) ( not ( = ?auto_122576 ?auto_122582 ) ) ( not ( = ?auto_122577 ?auto_122578 ) ) ( not ( = ?auto_122577 ?auto_122579 ) ) ( not ( = ?auto_122577 ?auto_122580 ) ) ( not ( = ?auto_122577 ?auto_122581 ) ) ( not ( = ?auto_122577 ?auto_122582 ) ) ( not ( = ?auto_122578 ?auto_122579 ) ) ( not ( = ?auto_122578 ?auto_122580 ) ) ( not ( = ?auto_122578 ?auto_122581 ) ) ( not ( = ?auto_122578 ?auto_122582 ) ) ( not ( = ?auto_122579 ?auto_122580 ) ) ( not ( = ?auto_122579 ?auto_122581 ) ) ( not ( = ?auto_122579 ?auto_122582 ) ) ( not ( = ?auto_122580 ?auto_122581 ) ) ( not ( = ?auto_122580 ?auto_122582 ) ) ( not ( = ?auto_122581 ?auto_122582 ) ) ( CLEAR ?auto_122579 ) ( ON ?auto_122580 ?auto_122581 ) ( CLEAR ?auto_122580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122574 ?auto_122575 ?auto_122576 ?auto_122577 ?auto_122578 ?auto_122579 ?auto_122580 )
      ( MAKE-8PILE ?auto_122574 ?auto_122575 ?auto_122576 ?auto_122577 ?auto_122578 ?auto_122579 ?auto_122580 ?auto_122581 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122608 - BLOCK
      ?auto_122609 - BLOCK
      ?auto_122610 - BLOCK
      ?auto_122611 - BLOCK
      ?auto_122612 - BLOCK
      ?auto_122613 - BLOCK
      ?auto_122614 - BLOCK
      ?auto_122615 - BLOCK
    )
    :vars
    (
      ?auto_122616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122615 ?auto_122616 ) ( ON-TABLE ?auto_122608 ) ( ON ?auto_122609 ?auto_122608 ) ( ON ?auto_122610 ?auto_122609 ) ( ON ?auto_122611 ?auto_122610 ) ( ON ?auto_122612 ?auto_122611 ) ( not ( = ?auto_122608 ?auto_122609 ) ) ( not ( = ?auto_122608 ?auto_122610 ) ) ( not ( = ?auto_122608 ?auto_122611 ) ) ( not ( = ?auto_122608 ?auto_122612 ) ) ( not ( = ?auto_122608 ?auto_122613 ) ) ( not ( = ?auto_122608 ?auto_122614 ) ) ( not ( = ?auto_122608 ?auto_122615 ) ) ( not ( = ?auto_122608 ?auto_122616 ) ) ( not ( = ?auto_122609 ?auto_122610 ) ) ( not ( = ?auto_122609 ?auto_122611 ) ) ( not ( = ?auto_122609 ?auto_122612 ) ) ( not ( = ?auto_122609 ?auto_122613 ) ) ( not ( = ?auto_122609 ?auto_122614 ) ) ( not ( = ?auto_122609 ?auto_122615 ) ) ( not ( = ?auto_122609 ?auto_122616 ) ) ( not ( = ?auto_122610 ?auto_122611 ) ) ( not ( = ?auto_122610 ?auto_122612 ) ) ( not ( = ?auto_122610 ?auto_122613 ) ) ( not ( = ?auto_122610 ?auto_122614 ) ) ( not ( = ?auto_122610 ?auto_122615 ) ) ( not ( = ?auto_122610 ?auto_122616 ) ) ( not ( = ?auto_122611 ?auto_122612 ) ) ( not ( = ?auto_122611 ?auto_122613 ) ) ( not ( = ?auto_122611 ?auto_122614 ) ) ( not ( = ?auto_122611 ?auto_122615 ) ) ( not ( = ?auto_122611 ?auto_122616 ) ) ( not ( = ?auto_122612 ?auto_122613 ) ) ( not ( = ?auto_122612 ?auto_122614 ) ) ( not ( = ?auto_122612 ?auto_122615 ) ) ( not ( = ?auto_122612 ?auto_122616 ) ) ( not ( = ?auto_122613 ?auto_122614 ) ) ( not ( = ?auto_122613 ?auto_122615 ) ) ( not ( = ?auto_122613 ?auto_122616 ) ) ( not ( = ?auto_122614 ?auto_122615 ) ) ( not ( = ?auto_122614 ?auto_122616 ) ) ( not ( = ?auto_122615 ?auto_122616 ) ) ( ON ?auto_122614 ?auto_122615 ) ( CLEAR ?auto_122612 ) ( ON ?auto_122613 ?auto_122614 ) ( CLEAR ?auto_122613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122608 ?auto_122609 ?auto_122610 ?auto_122611 ?auto_122612 ?auto_122613 )
      ( MAKE-8PILE ?auto_122608 ?auto_122609 ?auto_122610 ?auto_122611 ?auto_122612 ?auto_122613 ?auto_122614 ?auto_122615 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122642 - BLOCK
      ?auto_122643 - BLOCK
      ?auto_122644 - BLOCK
      ?auto_122645 - BLOCK
      ?auto_122646 - BLOCK
      ?auto_122647 - BLOCK
      ?auto_122648 - BLOCK
      ?auto_122649 - BLOCK
    )
    :vars
    (
      ?auto_122650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122649 ?auto_122650 ) ( ON-TABLE ?auto_122642 ) ( ON ?auto_122643 ?auto_122642 ) ( ON ?auto_122644 ?auto_122643 ) ( ON ?auto_122645 ?auto_122644 ) ( not ( = ?auto_122642 ?auto_122643 ) ) ( not ( = ?auto_122642 ?auto_122644 ) ) ( not ( = ?auto_122642 ?auto_122645 ) ) ( not ( = ?auto_122642 ?auto_122646 ) ) ( not ( = ?auto_122642 ?auto_122647 ) ) ( not ( = ?auto_122642 ?auto_122648 ) ) ( not ( = ?auto_122642 ?auto_122649 ) ) ( not ( = ?auto_122642 ?auto_122650 ) ) ( not ( = ?auto_122643 ?auto_122644 ) ) ( not ( = ?auto_122643 ?auto_122645 ) ) ( not ( = ?auto_122643 ?auto_122646 ) ) ( not ( = ?auto_122643 ?auto_122647 ) ) ( not ( = ?auto_122643 ?auto_122648 ) ) ( not ( = ?auto_122643 ?auto_122649 ) ) ( not ( = ?auto_122643 ?auto_122650 ) ) ( not ( = ?auto_122644 ?auto_122645 ) ) ( not ( = ?auto_122644 ?auto_122646 ) ) ( not ( = ?auto_122644 ?auto_122647 ) ) ( not ( = ?auto_122644 ?auto_122648 ) ) ( not ( = ?auto_122644 ?auto_122649 ) ) ( not ( = ?auto_122644 ?auto_122650 ) ) ( not ( = ?auto_122645 ?auto_122646 ) ) ( not ( = ?auto_122645 ?auto_122647 ) ) ( not ( = ?auto_122645 ?auto_122648 ) ) ( not ( = ?auto_122645 ?auto_122649 ) ) ( not ( = ?auto_122645 ?auto_122650 ) ) ( not ( = ?auto_122646 ?auto_122647 ) ) ( not ( = ?auto_122646 ?auto_122648 ) ) ( not ( = ?auto_122646 ?auto_122649 ) ) ( not ( = ?auto_122646 ?auto_122650 ) ) ( not ( = ?auto_122647 ?auto_122648 ) ) ( not ( = ?auto_122647 ?auto_122649 ) ) ( not ( = ?auto_122647 ?auto_122650 ) ) ( not ( = ?auto_122648 ?auto_122649 ) ) ( not ( = ?auto_122648 ?auto_122650 ) ) ( not ( = ?auto_122649 ?auto_122650 ) ) ( ON ?auto_122648 ?auto_122649 ) ( ON ?auto_122647 ?auto_122648 ) ( CLEAR ?auto_122645 ) ( ON ?auto_122646 ?auto_122647 ) ( CLEAR ?auto_122646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122642 ?auto_122643 ?auto_122644 ?auto_122645 ?auto_122646 )
      ( MAKE-8PILE ?auto_122642 ?auto_122643 ?auto_122644 ?auto_122645 ?auto_122646 ?auto_122647 ?auto_122648 ?auto_122649 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122676 - BLOCK
      ?auto_122677 - BLOCK
      ?auto_122678 - BLOCK
      ?auto_122679 - BLOCK
      ?auto_122680 - BLOCK
      ?auto_122681 - BLOCK
      ?auto_122682 - BLOCK
      ?auto_122683 - BLOCK
    )
    :vars
    (
      ?auto_122684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122683 ?auto_122684 ) ( ON-TABLE ?auto_122676 ) ( ON ?auto_122677 ?auto_122676 ) ( ON ?auto_122678 ?auto_122677 ) ( not ( = ?auto_122676 ?auto_122677 ) ) ( not ( = ?auto_122676 ?auto_122678 ) ) ( not ( = ?auto_122676 ?auto_122679 ) ) ( not ( = ?auto_122676 ?auto_122680 ) ) ( not ( = ?auto_122676 ?auto_122681 ) ) ( not ( = ?auto_122676 ?auto_122682 ) ) ( not ( = ?auto_122676 ?auto_122683 ) ) ( not ( = ?auto_122676 ?auto_122684 ) ) ( not ( = ?auto_122677 ?auto_122678 ) ) ( not ( = ?auto_122677 ?auto_122679 ) ) ( not ( = ?auto_122677 ?auto_122680 ) ) ( not ( = ?auto_122677 ?auto_122681 ) ) ( not ( = ?auto_122677 ?auto_122682 ) ) ( not ( = ?auto_122677 ?auto_122683 ) ) ( not ( = ?auto_122677 ?auto_122684 ) ) ( not ( = ?auto_122678 ?auto_122679 ) ) ( not ( = ?auto_122678 ?auto_122680 ) ) ( not ( = ?auto_122678 ?auto_122681 ) ) ( not ( = ?auto_122678 ?auto_122682 ) ) ( not ( = ?auto_122678 ?auto_122683 ) ) ( not ( = ?auto_122678 ?auto_122684 ) ) ( not ( = ?auto_122679 ?auto_122680 ) ) ( not ( = ?auto_122679 ?auto_122681 ) ) ( not ( = ?auto_122679 ?auto_122682 ) ) ( not ( = ?auto_122679 ?auto_122683 ) ) ( not ( = ?auto_122679 ?auto_122684 ) ) ( not ( = ?auto_122680 ?auto_122681 ) ) ( not ( = ?auto_122680 ?auto_122682 ) ) ( not ( = ?auto_122680 ?auto_122683 ) ) ( not ( = ?auto_122680 ?auto_122684 ) ) ( not ( = ?auto_122681 ?auto_122682 ) ) ( not ( = ?auto_122681 ?auto_122683 ) ) ( not ( = ?auto_122681 ?auto_122684 ) ) ( not ( = ?auto_122682 ?auto_122683 ) ) ( not ( = ?auto_122682 ?auto_122684 ) ) ( not ( = ?auto_122683 ?auto_122684 ) ) ( ON ?auto_122682 ?auto_122683 ) ( ON ?auto_122681 ?auto_122682 ) ( ON ?auto_122680 ?auto_122681 ) ( CLEAR ?auto_122678 ) ( ON ?auto_122679 ?auto_122680 ) ( CLEAR ?auto_122679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122676 ?auto_122677 ?auto_122678 ?auto_122679 )
      ( MAKE-8PILE ?auto_122676 ?auto_122677 ?auto_122678 ?auto_122679 ?auto_122680 ?auto_122681 ?auto_122682 ?auto_122683 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122710 - BLOCK
      ?auto_122711 - BLOCK
      ?auto_122712 - BLOCK
      ?auto_122713 - BLOCK
      ?auto_122714 - BLOCK
      ?auto_122715 - BLOCK
      ?auto_122716 - BLOCK
      ?auto_122717 - BLOCK
    )
    :vars
    (
      ?auto_122718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122717 ?auto_122718 ) ( ON-TABLE ?auto_122710 ) ( ON ?auto_122711 ?auto_122710 ) ( not ( = ?auto_122710 ?auto_122711 ) ) ( not ( = ?auto_122710 ?auto_122712 ) ) ( not ( = ?auto_122710 ?auto_122713 ) ) ( not ( = ?auto_122710 ?auto_122714 ) ) ( not ( = ?auto_122710 ?auto_122715 ) ) ( not ( = ?auto_122710 ?auto_122716 ) ) ( not ( = ?auto_122710 ?auto_122717 ) ) ( not ( = ?auto_122710 ?auto_122718 ) ) ( not ( = ?auto_122711 ?auto_122712 ) ) ( not ( = ?auto_122711 ?auto_122713 ) ) ( not ( = ?auto_122711 ?auto_122714 ) ) ( not ( = ?auto_122711 ?auto_122715 ) ) ( not ( = ?auto_122711 ?auto_122716 ) ) ( not ( = ?auto_122711 ?auto_122717 ) ) ( not ( = ?auto_122711 ?auto_122718 ) ) ( not ( = ?auto_122712 ?auto_122713 ) ) ( not ( = ?auto_122712 ?auto_122714 ) ) ( not ( = ?auto_122712 ?auto_122715 ) ) ( not ( = ?auto_122712 ?auto_122716 ) ) ( not ( = ?auto_122712 ?auto_122717 ) ) ( not ( = ?auto_122712 ?auto_122718 ) ) ( not ( = ?auto_122713 ?auto_122714 ) ) ( not ( = ?auto_122713 ?auto_122715 ) ) ( not ( = ?auto_122713 ?auto_122716 ) ) ( not ( = ?auto_122713 ?auto_122717 ) ) ( not ( = ?auto_122713 ?auto_122718 ) ) ( not ( = ?auto_122714 ?auto_122715 ) ) ( not ( = ?auto_122714 ?auto_122716 ) ) ( not ( = ?auto_122714 ?auto_122717 ) ) ( not ( = ?auto_122714 ?auto_122718 ) ) ( not ( = ?auto_122715 ?auto_122716 ) ) ( not ( = ?auto_122715 ?auto_122717 ) ) ( not ( = ?auto_122715 ?auto_122718 ) ) ( not ( = ?auto_122716 ?auto_122717 ) ) ( not ( = ?auto_122716 ?auto_122718 ) ) ( not ( = ?auto_122717 ?auto_122718 ) ) ( ON ?auto_122716 ?auto_122717 ) ( ON ?auto_122715 ?auto_122716 ) ( ON ?auto_122714 ?auto_122715 ) ( ON ?auto_122713 ?auto_122714 ) ( CLEAR ?auto_122711 ) ( ON ?auto_122712 ?auto_122713 ) ( CLEAR ?auto_122712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122710 ?auto_122711 ?auto_122712 )
      ( MAKE-8PILE ?auto_122710 ?auto_122711 ?auto_122712 ?auto_122713 ?auto_122714 ?auto_122715 ?auto_122716 ?auto_122717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122744 - BLOCK
      ?auto_122745 - BLOCK
      ?auto_122746 - BLOCK
      ?auto_122747 - BLOCK
      ?auto_122748 - BLOCK
      ?auto_122749 - BLOCK
      ?auto_122750 - BLOCK
      ?auto_122751 - BLOCK
    )
    :vars
    (
      ?auto_122752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122751 ?auto_122752 ) ( ON-TABLE ?auto_122744 ) ( not ( = ?auto_122744 ?auto_122745 ) ) ( not ( = ?auto_122744 ?auto_122746 ) ) ( not ( = ?auto_122744 ?auto_122747 ) ) ( not ( = ?auto_122744 ?auto_122748 ) ) ( not ( = ?auto_122744 ?auto_122749 ) ) ( not ( = ?auto_122744 ?auto_122750 ) ) ( not ( = ?auto_122744 ?auto_122751 ) ) ( not ( = ?auto_122744 ?auto_122752 ) ) ( not ( = ?auto_122745 ?auto_122746 ) ) ( not ( = ?auto_122745 ?auto_122747 ) ) ( not ( = ?auto_122745 ?auto_122748 ) ) ( not ( = ?auto_122745 ?auto_122749 ) ) ( not ( = ?auto_122745 ?auto_122750 ) ) ( not ( = ?auto_122745 ?auto_122751 ) ) ( not ( = ?auto_122745 ?auto_122752 ) ) ( not ( = ?auto_122746 ?auto_122747 ) ) ( not ( = ?auto_122746 ?auto_122748 ) ) ( not ( = ?auto_122746 ?auto_122749 ) ) ( not ( = ?auto_122746 ?auto_122750 ) ) ( not ( = ?auto_122746 ?auto_122751 ) ) ( not ( = ?auto_122746 ?auto_122752 ) ) ( not ( = ?auto_122747 ?auto_122748 ) ) ( not ( = ?auto_122747 ?auto_122749 ) ) ( not ( = ?auto_122747 ?auto_122750 ) ) ( not ( = ?auto_122747 ?auto_122751 ) ) ( not ( = ?auto_122747 ?auto_122752 ) ) ( not ( = ?auto_122748 ?auto_122749 ) ) ( not ( = ?auto_122748 ?auto_122750 ) ) ( not ( = ?auto_122748 ?auto_122751 ) ) ( not ( = ?auto_122748 ?auto_122752 ) ) ( not ( = ?auto_122749 ?auto_122750 ) ) ( not ( = ?auto_122749 ?auto_122751 ) ) ( not ( = ?auto_122749 ?auto_122752 ) ) ( not ( = ?auto_122750 ?auto_122751 ) ) ( not ( = ?auto_122750 ?auto_122752 ) ) ( not ( = ?auto_122751 ?auto_122752 ) ) ( ON ?auto_122750 ?auto_122751 ) ( ON ?auto_122749 ?auto_122750 ) ( ON ?auto_122748 ?auto_122749 ) ( ON ?auto_122747 ?auto_122748 ) ( ON ?auto_122746 ?auto_122747 ) ( CLEAR ?auto_122744 ) ( ON ?auto_122745 ?auto_122746 ) ( CLEAR ?auto_122745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122744 ?auto_122745 )
      ( MAKE-8PILE ?auto_122744 ?auto_122745 ?auto_122746 ?auto_122747 ?auto_122748 ?auto_122749 ?auto_122750 ?auto_122751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_122778 - BLOCK
      ?auto_122779 - BLOCK
      ?auto_122780 - BLOCK
      ?auto_122781 - BLOCK
      ?auto_122782 - BLOCK
      ?auto_122783 - BLOCK
      ?auto_122784 - BLOCK
      ?auto_122785 - BLOCK
    )
    :vars
    (
      ?auto_122786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122785 ?auto_122786 ) ( not ( = ?auto_122778 ?auto_122779 ) ) ( not ( = ?auto_122778 ?auto_122780 ) ) ( not ( = ?auto_122778 ?auto_122781 ) ) ( not ( = ?auto_122778 ?auto_122782 ) ) ( not ( = ?auto_122778 ?auto_122783 ) ) ( not ( = ?auto_122778 ?auto_122784 ) ) ( not ( = ?auto_122778 ?auto_122785 ) ) ( not ( = ?auto_122778 ?auto_122786 ) ) ( not ( = ?auto_122779 ?auto_122780 ) ) ( not ( = ?auto_122779 ?auto_122781 ) ) ( not ( = ?auto_122779 ?auto_122782 ) ) ( not ( = ?auto_122779 ?auto_122783 ) ) ( not ( = ?auto_122779 ?auto_122784 ) ) ( not ( = ?auto_122779 ?auto_122785 ) ) ( not ( = ?auto_122779 ?auto_122786 ) ) ( not ( = ?auto_122780 ?auto_122781 ) ) ( not ( = ?auto_122780 ?auto_122782 ) ) ( not ( = ?auto_122780 ?auto_122783 ) ) ( not ( = ?auto_122780 ?auto_122784 ) ) ( not ( = ?auto_122780 ?auto_122785 ) ) ( not ( = ?auto_122780 ?auto_122786 ) ) ( not ( = ?auto_122781 ?auto_122782 ) ) ( not ( = ?auto_122781 ?auto_122783 ) ) ( not ( = ?auto_122781 ?auto_122784 ) ) ( not ( = ?auto_122781 ?auto_122785 ) ) ( not ( = ?auto_122781 ?auto_122786 ) ) ( not ( = ?auto_122782 ?auto_122783 ) ) ( not ( = ?auto_122782 ?auto_122784 ) ) ( not ( = ?auto_122782 ?auto_122785 ) ) ( not ( = ?auto_122782 ?auto_122786 ) ) ( not ( = ?auto_122783 ?auto_122784 ) ) ( not ( = ?auto_122783 ?auto_122785 ) ) ( not ( = ?auto_122783 ?auto_122786 ) ) ( not ( = ?auto_122784 ?auto_122785 ) ) ( not ( = ?auto_122784 ?auto_122786 ) ) ( not ( = ?auto_122785 ?auto_122786 ) ) ( ON ?auto_122784 ?auto_122785 ) ( ON ?auto_122783 ?auto_122784 ) ( ON ?auto_122782 ?auto_122783 ) ( ON ?auto_122781 ?auto_122782 ) ( ON ?auto_122780 ?auto_122781 ) ( ON ?auto_122779 ?auto_122780 ) ( ON ?auto_122778 ?auto_122779 ) ( CLEAR ?auto_122778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122778 )
      ( MAKE-8PILE ?auto_122778 ?auto_122779 ?auto_122780 ?auto_122781 ?auto_122782 ?auto_122783 ?auto_122784 ?auto_122785 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_122813 - BLOCK
      ?auto_122814 - BLOCK
      ?auto_122815 - BLOCK
      ?auto_122816 - BLOCK
      ?auto_122817 - BLOCK
      ?auto_122818 - BLOCK
      ?auto_122819 - BLOCK
      ?auto_122820 - BLOCK
      ?auto_122821 - BLOCK
    )
    :vars
    (
      ?auto_122822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122820 ) ( ON ?auto_122821 ?auto_122822 ) ( CLEAR ?auto_122821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122813 ) ( ON ?auto_122814 ?auto_122813 ) ( ON ?auto_122815 ?auto_122814 ) ( ON ?auto_122816 ?auto_122815 ) ( ON ?auto_122817 ?auto_122816 ) ( ON ?auto_122818 ?auto_122817 ) ( ON ?auto_122819 ?auto_122818 ) ( ON ?auto_122820 ?auto_122819 ) ( not ( = ?auto_122813 ?auto_122814 ) ) ( not ( = ?auto_122813 ?auto_122815 ) ) ( not ( = ?auto_122813 ?auto_122816 ) ) ( not ( = ?auto_122813 ?auto_122817 ) ) ( not ( = ?auto_122813 ?auto_122818 ) ) ( not ( = ?auto_122813 ?auto_122819 ) ) ( not ( = ?auto_122813 ?auto_122820 ) ) ( not ( = ?auto_122813 ?auto_122821 ) ) ( not ( = ?auto_122813 ?auto_122822 ) ) ( not ( = ?auto_122814 ?auto_122815 ) ) ( not ( = ?auto_122814 ?auto_122816 ) ) ( not ( = ?auto_122814 ?auto_122817 ) ) ( not ( = ?auto_122814 ?auto_122818 ) ) ( not ( = ?auto_122814 ?auto_122819 ) ) ( not ( = ?auto_122814 ?auto_122820 ) ) ( not ( = ?auto_122814 ?auto_122821 ) ) ( not ( = ?auto_122814 ?auto_122822 ) ) ( not ( = ?auto_122815 ?auto_122816 ) ) ( not ( = ?auto_122815 ?auto_122817 ) ) ( not ( = ?auto_122815 ?auto_122818 ) ) ( not ( = ?auto_122815 ?auto_122819 ) ) ( not ( = ?auto_122815 ?auto_122820 ) ) ( not ( = ?auto_122815 ?auto_122821 ) ) ( not ( = ?auto_122815 ?auto_122822 ) ) ( not ( = ?auto_122816 ?auto_122817 ) ) ( not ( = ?auto_122816 ?auto_122818 ) ) ( not ( = ?auto_122816 ?auto_122819 ) ) ( not ( = ?auto_122816 ?auto_122820 ) ) ( not ( = ?auto_122816 ?auto_122821 ) ) ( not ( = ?auto_122816 ?auto_122822 ) ) ( not ( = ?auto_122817 ?auto_122818 ) ) ( not ( = ?auto_122817 ?auto_122819 ) ) ( not ( = ?auto_122817 ?auto_122820 ) ) ( not ( = ?auto_122817 ?auto_122821 ) ) ( not ( = ?auto_122817 ?auto_122822 ) ) ( not ( = ?auto_122818 ?auto_122819 ) ) ( not ( = ?auto_122818 ?auto_122820 ) ) ( not ( = ?auto_122818 ?auto_122821 ) ) ( not ( = ?auto_122818 ?auto_122822 ) ) ( not ( = ?auto_122819 ?auto_122820 ) ) ( not ( = ?auto_122819 ?auto_122821 ) ) ( not ( = ?auto_122819 ?auto_122822 ) ) ( not ( = ?auto_122820 ?auto_122821 ) ) ( not ( = ?auto_122820 ?auto_122822 ) ) ( not ( = ?auto_122821 ?auto_122822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122821 ?auto_122822 )
      ( !STACK ?auto_122821 ?auto_122820 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_122851 - BLOCK
      ?auto_122852 - BLOCK
      ?auto_122853 - BLOCK
      ?auto_122854 - BLOCK
      ?auto_122855 - BLOCK
      ?auto_122856 - BLOCK
      ?auto_122857 - BLOCK
      ?auto_122858 - BLOCK
      ?auto_122859 - BLOCK
    )
    :vars
    (
      ?auto_122860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122859 ?auto_122860 ) ( ON-TABLE ?auto_122851 ) ( ON ?auto_122852 ?auto_122851 ) ( ON ?auto_122853 ?auto_122852 ) ( ON ?auto_122854 ?auto_122853 ) ( ON ?auto_122855 ?auto_122854 ) ( ON ?auto_122856 ?auto_122855 ) ( ON ?auto_122857 ?auto_122856 ) ( not ( = ?auto_122851 ?auto_122852 ) ) ( not ( = ?auto_122851 ?auto_122853 ) ) ( not ( = ?auto_122851 ?auto_122854 ) ) ( not ( = ?auto_122851 ?auto_122855 ) ) ( not ( = ?auto_122851 ?auto_122856 ) ) ( not ( = ?auto_122851 ?auto_122857 ) ) ( not ( = ?auto_122851 ?auto_122858 ) ) ( not ( = ?auto_122851 ?auto_122859 ) ) ( not ( = ?auto_122851 ?auto_122860 ) ) ( not ( = ?auto_122852 ?auto_122853 ) ) ( not ( = ?auto_122852 ?auto_122854 ) ) ( not ( = ?auto_122852 ?auto_122855 ) ) ( not ( = ?auto_122852 ?auto_122856 ) ) ( not ( = ?auto_122852 ?auto_122857 ) ) ( not ( = ?auto_122852 ?auto_122858 ) ) ( not ( = ?auto_122852 ?auto_122859 ) ) ( not ( = ?auto_122852 ?auto_122860 ) ) ( not ( = ?auto_122853 ?auto_122854 ) ) ( not ( = ?auto_122853 ?auto_122855 ) ) ( not ( = ?auto_122853 ?auto_122856 ) ) ( not ( = ?auto_122853 ?auto_122857 ) ) ( not ( = ?auto_122853 ?auto_122858 ) ) ( not ( = ?auto_122853 ?auto_122859 ) ) ( not ( = ?auto_122853 ?auto_122860 ) ) ( not ( = ?auto_122854 ?auto_122855 ) ) ( not ( = ?auto_122854 ?auto_122856 ) ) ( not ( = ?auto_122854 ?auto_122857 ) ) ( not ( = ?auto_122854 ?auto_122858 ) ) ( not ( = ?auto_122854 ?auto_122859 ) ) ( not ( = ?auto_122854 ?auto_122860 ) ) ( not ( = ?auto_122855 ?auto_122856 ) ) ( not ( = ?auto_122855 ?auto_122857 ) ) ( not ( = ?auto_122855 ?auto_122858 ) ) ( not ( = ?auto_122855 ?auto_122859 ) ) ( not ( = ?auto_122855 ?auto_122860 ) ) ( not ( = ?auto_122856 ?auto_122857 ) ) ( not ( = ?auto_122856 ?auto_122858 ) ) ( not ( = ?auto_122856 ?auto_122859 ) ) ( not ( = ?auto_122856 ?auto_122860 ) ) ( not ( = ?auto_122857 ?auto_122858 ) ) ( not ( = ?auto_122857 ?auto_122859 ) ) ( not ( = ?auto_122857 ?auto_122860 ) ) ( not ( = ?auto_122858 ?auto_122859 ) ) ( not ( = ?auto_122858 ?auto_122860 ) ) ( not ( = ?auto_122859 ?auto_122860 ) ) ( CLEAR ?auto_122857 ) ( ON ?auto_122858 ?auto_122859 ) ( CLEAR ?auto_122858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_122851 ?auto_122852 ?auto_122853 ?auto_122854 ?auto_122855 ?auto_122856 ?auto_122857 ?auto_122858 )
      ( MAKE-9PILE ?auto_122851 ?auto_122852 ?auto_122853 ?auto_122854 ?auto_122855 ?auto_122856 ?auto_122857 ?auto_122858 ?auto_122859 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_122889 - BLOCK
      ?auto_122890 - BLOCK
      ?auto_122891 - BLOCK
      ?auto_122892 - BLOCK
      ?auto_122893 - BLOCK
      ?auto_122894 - BLOCK
      ?auto_122895 - BLOCK
      ?auto_122896 - BLOCK
      ?auto_122897 - BLOCK
    )
    :vars
    (
      ?auto_122898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122897 ?auto_122898 ) ( ON-TABLE ?auto_122889 ) ( ON ?auto_122890 ?auto_122889 ) ( ON ?auto_122891 ?auto_122890 ) ( ON ?auto_122892 ?auto_122891 ) ( ON ?auto_122893 ?auto_122892 ) ( ON ?auto_122894 ?auto_122893 ) ( not ( = ?auto_122889 ?auto_122890 ) ) ( not ( = ?auto_122889 ?auto_122891 ) ) ( not ( = ?auto_122889 ?auto_122892 ) ) ( not ( = ?auto_122889 ?auto_122893 ) ) ( not ( = ?auto_122889 ?auto_122894 ) ) ( not ( = ?auto_122889 ?auto_122895 ) ) ( not ( = ?auto_122889 ?auto_122896 ) ) ( not ( = ?auto_122889 ?auto_122897 ) ) ( not ( = ?auto_122889 ?auto_122898 ) ) ( not ( = ?auto_122890 ?auto_122891 ) ) ( not ( = ?auto_122890 ?auto_122892 ) ) ( not ( = ?auto_122890 ?auto_122893 ) ) ( not ( = ?auto_122890 ?auto_122894 ) ) ( not ( = ?auto_122890 ?auto_122895 ) ) ( not ( = ?auto_122890 ?auto_122896 ) ) ( not ( = ?auto_122890 ?auto_122897 ) ) ( not ( = ?auto_122890 ?auto_122898 ) ) ( not ( = ?auto_122891 ?auto_122892 ) ) ( not ( = ?auto_122891 ?auto_122893 ) ) ( not ( = ?auto_122891 ?auto_122894 ) ) ( not ( = ?auto_122891 ?auto_122895 ) ) ( not ( = ?auto_122891 ?auto_122896 ) ) ( not ( = ?auto_122891 ?auto_122897 ) ) ( not ( = ?auto_122891 ?auto_122898 ) ) ( not ( = ?auto_122892 ?auto_122893 ) ) ( not ( = ?auto_122892 ?auto_122894 ) ) ( not ( = ?auto_122892 ?auto_122895 ) ) ( not ( = ?auto_122892 ?auto_122896 ) ) ( not ( = ?auto_122892 ?auto_122897 ) ) ( not ( = ?auto_122892 ?auto_122898 ) ) ( not ( = ?auto_122893 ?auto_122894 ) ) ( not ( = ?auto_122893 ?auto_122895 ) ) ( not ( = ?auto_122893 ?auto_122896 ) ) ( not ( = ?auto_122893 ?auto_122897 ) ) ( not ( = ?auto_122893 ?auto_122898 ) ) ( not ( = ?auto_122894 ?auto_122895 ) ) ( not ( = ?auto_122894 ?auto_122896 ) ) ( not ( = ?auto_122894 ?auto_122897 ) ) ( not ( = ?auto_122894 ?auto_122898 ) ) ( not ( = ?auto_122895 ?auto_122896 ) ) ( not ( = ?auto_122895 ?auto_122897 ) ) ( not ( = ?auto_122895 ?auto_122898 ) ) ( not ( = ?auto_122896 ?auto_122897 ) ) ( not ( = ?auto_122896 ?auto_122898 ) ) ( not ( = ?auto_122897 ?auto_122898 ) ) ( ON ?auto_122896 ?auto_122897 ) ( CLEAR ?auto_122894 ) ( ON ?auto_122895 ?auto_122896 ) ( CLEAR ?auto_122895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122889 ?auto_122890 ?auto_122891 ?auto_122892 ?auto_122893 ?auto_122894 ?auto_122895 )
      ( MAKE-9PILE ?auto_122889 ?auto_122890 ?auto_122891 ?auto_122892 ?auto_122893 ?auto_122894 ?auto_122895 ?auto_122896 ?auto_122897 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_122927 - BLOCK
      ?auto_122928 - BLOCK
      ?auto_122929 - BLOCK
      ?auto_122930 - BLOCK
      ?auto_122931 - BLOCK
      ?auto_122932 - BLOCK
      ?auto_122933 - BLOCK
      ?auto_122934 - BLOCK
      ?auto_122935 - BLOCK
    )
    :vars
    (
      ?auto_122936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122935 ?auto_122936 ) ( ON-TABLE ?auto_122927 ) ( ON ?auto_122928 ?auto_122927 ) ( ON ?auto_122929 ?auto_122928 ) ( ON ?auto_122930 ?auto_122929 ) ( ON ?auto_122931 ?auto_122930 ) ( not ( = ?auto_122927 ?auto_122928 ) ) ( not ( = ?auto_122927 ?auto_122929 ) ) ( not ( = ?auto_122927 ?auto_122930 ) ) ( not ( = ?auto_122927 ?auto_122931 ) ) ( not ( = ?auto_122927 ?auto_122932 ) ) ( not ( = ?auto_122927 ?auto_122933 ) ) ( not ( = ?auto_122927 ?auto_122934 ) ) ( not ( = ?auto_122927 ?auto_122935 ) ) ( not ( = ?auto_122927 ?auto_122936 ) ) ( not ( = ?auto_122928 ?auto_122929 ) ) ( not ( = ?auto_122928 ?auto_122930 ) ) ( not ( = ?auto_122928 ?auto_122931 ) ) ( not ( = ?auto_122928 ?auto_122932 ) ) ( not ( = ?auto_122928 ?auto_122933 ) ) ( not ( = ?auto_122928 ?auto_122934 ) ) ( not ( = ?auto_122928 ?auto_122935 ) ) ( not ( = ?auto_122928 ?auto_122936 ) ) ( not ( = ?auto_122929 ?auto_122930 ) ) ( not ( = ?auto_122929 ?auto_122931 ) ) ( not ( = ?auto_122929 ?auto_122932 ) ) ( not ( = ?auto_122929 ?auto_122933 ) ) ( not ( = ?auto_122929 ?auto_122934 ) ) ( not ( = ?auto_122929 ?auto_122935 ) ) ( not ( = ?auto_122929 ?auto_122936 ) ) ( not ( = ?auto_122930 ?auto_122931 ) ) ( not ( = ?auto_122930 ?auto_122932 ) ) ( not ( = ?auto_122930 ?auto_122933 ) ) ( not ( = ?auto_122930 ?auto_122934 ) ) ( not ( = ?auto_122930 ?auto_122935 ) ) ( not ( = ?auto_122930 ?auto_122936 ) ) ( not ( = ?auto_122931 ?auto_122932 ) ) ( not ( = ?auto_122931 ?auto_122933 ) ) ( not ( = ?auto_122931 ?auto_122934 ) ) ( not ( = ?auto_122931 ?auto_122935 ) ) ( not ( = ?auto_122931 ?auto_122936 ) ) ( not ( = ?auto_122932 ?auto_122933 ) ) ( not ( = ?auto_122932 ?auto_122934 ) ) ( not ( = ?auto_122932 ?auto_122935 ) ) ( not ( = ?auto_122932 ?auto_122936 ) ) ( not ( = ?auto_122933 ?auto_122934 ) ) ( not ( = ?auto_122933 ?auto_122935 ) ) ( not ( = ?auto_122933 ?auto_122936 ) ) ( not ( = ?auto_122934 ?auto_122935 ) ) ( not ( = ?auto_122934 ?auto_122936 ) ) ( not ( = ?auto_122935 ?auto_122936 ) ) ( ON ?auto_122934 ?auto_122935 ) ( ON ?auto_122933 ?auto_122934 ) ( CLEAR ?auto_122931 ) ( ON ?auto_122932 ?auto_122933 ) ( CLEAR ?auto_122932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122927 ?auto_122928 ?auto_122929 ?auto_122930 ?auto_122931 ?auto_122932 )
      ( MAKE-9PILE ?auto_122927 ?auto_122928 ?auto_122929 ?auto_122930 ?auto_122931 ?auto_122932 ?auto_122933 ?auto_122934 ?auto_122935 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_122965 - BLOCK
      ?auto_122966 - BLOCK
      ?auto_122967 - BLOCK
      ?auto_122968 - BLOCK
      ?auto_122969 - BLOCK
      ?auto_122970 - BLOCK
      ?auto_122971 - BLOCK
      ?auto_122972 - BLOCK
      ?auto_122973 - BLOCK
    )
    :vars
    (
      ?auto_122974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122973 ?auto_122974 ) ( ON-TABLE ?auto_122965 ) ( ON ?auto_122966 ?auto_122965 ) ( ON ?auto_122967 ?auto_122966 ) ( ON ?auto_122968 ?auto_122967 ) ( not ( = ?auto_122965 ?auto_122966 ) ) ( not ( = ?auto_122965 ?auto_122967 ) ) ( not ( = ?auto_122965 ?auto_122968 ) ) ( not ( = ?auto_122965 ?auto_122969 ) ) ( not ( = ?auto_122965 ?auto_122970 ) ) ( not ( = ?auto_122965 ?auto_122971 ) ) ( not ( = ?auto_122965 ?auto_122972 ) ) ( not ( = ?auto_122965 ?auto_122973 ) ) ( not ( = ?auto_122965 ?auto_122974 ) ) ( not ( = ?auto_122966 ?auto_122967 ) ) ( not ( = ?auto_122966 ?auto_122968 ) ) ( not ( = ?auto_122966 ?auto_122969 ) ) ( not ( = ?auto_122966 ?auto_122970 ) ) ( not ( = ?auto_122966 ?auto_122971 ) ) ( not ( = ?auto_122966 ?auto_122972 ) ) ( not ( = ?auto_122966 ?auto_122973 ) ) ( not ( = ?auto_122966 ?auto_122974 ) ) ( not ( = ?auto_122967 ?auto_122968 ) ) ( not ( = ?auto_122967 ?auto_122969 ) ) ( not ( = ?auto_122967 ?auto_122970 ) ) ( not ( = ?auto_122967 ?auto_122971 ) ) ( not ( = ?auto_122967 ?auto_122972 ) ) ( not ( = ?auto_122967 ?auto_122973 ) ) ( not ( = ?auto_122967 ?auto_122974 ) ) ( not ( = ?auto_122968 ?auto_122969 ) ) ( not ( = ?auto_122968 ?auto_122970 ) ) ( not ( = ?auto_122968 ?auto_122971 ) ) ( not ( = ?auto_122968 ?auto_122972 ) ) ( not ( = ?auto_122968 ?auto_122973 ) ) ( not ( = ?auto_122968 ?auto_122974 ) ) ( not ( = ?auto_122969 ?auto_122970 ) ) ( not ( = ?auto_122969 ?auto_122971 ) ) ( not ( = ?auto_122969 ?auto_122972 ) ) ( not ( = ?auto_122969 ?auto_122973 ) ) ( not ( = ?auto_122969 ?auto_122974 ) ) ( not ( = ?auto_122970 ?auto_122971 ) ) ( not ( = ?auto_122970 ?auto_122972 ) ) ( not ( = ?auto_122970 ?auto_122973 ) ) ( not ( = ?auto_122970 ?auto_122974 ) ) ( not ( = ?auto_122971 ?auto_122972 ) ) ( not ( = ?auto_122971 ?auto_122973 ) ) ( not ( = ?auto_122971 ?auto_122974 ) ) ( not ( = ?auto_122972 ?auto_122973 ) ) ( not ( = ?auto_122972 ?auto_122974 ) ) ( not ( = ?auto_122973 ?auto_122974 ) ) ( ON ?auto_122972 ?auto_122973 ) ( ON ?auto_122971 ?auto_122972 ) ( ON ?auto_122970 ?auto_122971 ) ( CLEAR ?auto_122968 ) ( ON ?auto_122969 ?auto_122970 ) ( CLEAR ?auto_122969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122965 ?auto_122966 ?auto_122967 ?auto_122968 ?auto_122969 )
      ( MAKE-9PILE ?auto_122965 ?auto_122966 ?auto_122967 ?auto_122968 ?auto_122969 ?auto_122970 ?auto_122971 ?auto_122972 ?auto_122973 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_123003 - BLOCK
      ?auto_123004 - BLOCK
      ?auto_123005 - BLOCK
      ?auto_123006 - BLOCK
      ?auto_123007 - BLOCK
      ?auto_123008 - BLOCK
      ?auto_123009 - BLOCK
      ?auto_123010 - BLOCK
      ?auto_123011 - BLOCK
    )
    :vars
    (
      ?auto_123012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123011 ?auto_123012 ) ( ON-TABLE ?auto_123003 ) ( ON ?auto_123004 ?auto_123003 ) ( ON ?auto_123005 ?auto_123004 ) ( not ( = ?auto_123003 ?auto_123004 ) ) ( not ( = ?auto_123003 ?auto_123005 ) ) ( not ( = ?auto_123003 ?auto_123006 ) ) ( not ( = ?auto_123003 ?auto_123007 ) ) ( not ( = ?auto_123003 ?auto_123008 ) ) ( not ( = ?auto_123003 ?auto_123009 ) ) ( not ( = ?auto_123003 ?auto_123010 ) ) ( not ( = ?auto_123003 ?auto_123011 ) ) ( not ( = ?auto_123003 ?auto_123012 ) ) ( not ( = ?auto_123004 ?auto_123005 ) ) ( not ( = ?auto_123004 ?auto_123006 ) ) ( not ( = ?auto_123004 ?auto_123007 ) ) ( not ( = ?auto_123004 ?auto_123008 ) ) ( not ( = ?auto_123004 ?auto_123009 ) ) ( not ( = ?auto_123004 ?auto_123010 ) ) ( not ( = ?auto_123004 ?auto_123011 ) ) ( not ( = ?auto_123004 ?auto_123012 ) ) ( not ( = ?auto_123005 ?auto_123006 ) ) ( not ( = ?auto_123005 ?auto_123007 ) ) ( not ( = ?auto_123005 ?auto_123008 ) ) ( not ( = ?auto_123005 ?auto_123009 ) ) ( not ( = ?auto_123005 ?auto_123010 ) ) ( not ( = ?auto_123005 ?auto_123011 ) ) ( not ( = ?auto_123005 ?auto_123012 ) ) ( not ( = ?auto_123006 ?auto_123007 ) ) ( not ( = ?auto_123006 ?auto_123008 ) ) ( not ( = ?auto_123006 ?auto_123009 ) ) ( not ( = ?auto_123006 ?auto_123010 ) ) ( not ( = ?auto_123006 ?auto_123011 ) ) ( not ( = ?auto_123006 ?auto_123012 ) ) ( not ( = ?auto_123007 ?auto_123008 ) ) ( not ( = ?auto_123007 ?auto_123009 ) ) ( not ( = ?auto_123007 ?auto_123010 ) ) ( not ( = ?auto_123007 ?auto_123011 ) ) ( not ( = ?auto_123007 ?auto_123012 ) ) ( not ( = ?auto_123008 ?auto_123009 ) ) ( not ( = ?auto_123008 ?auto_123010 ) ) ( not ( = ?auto_123008 ?auto_123011 ) ) ( not ( = ?auto_123008 ?auto_123012 ) ) ( not ( = ?auto_123009 ?auto_123010 ) ) ( not ( = ?auto_123009 ?auto_123011 ) ) ( not ( = ?auto_123009 ?auto_123012 ) ) ( not ( = ?auto_123010 ?auto_123011 ) ) ( not ( = ?auto_123010 ?auto_123012 ) ) ( not ( = ?auto_123011 ?auto_123012 ) ) ( ON ?auto_123010 ?auto_123011 ) ( ON ?auto_123009 ?auto_123010 ) ( ON ?auto_123008 ?auto_123009 ) ( ON ?auto_123007 ?auto_123008 ) ( CLEAR ?auto_123005 ) ( ON ?auto_123006 ?auto_123007 ) ( CLEAR ?auto_123006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123003 ?auto_123004 ?auto_123005 ?auto_123006 )
      ( MAKE-9PILE ?auto_123003 ?auto_123004 ?auto_123005 ?auto_123006 ?auto_123007 ?auto_123008 ?auto_123009 ?auto_123010 ?auto_123011 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_123041 - BLOCK
      ?auto_123042 - BLOCK
      ?auto_123043 - BLOCK
      ?auto_123044 - BLOCK
      ?auto_123045 - BLOCK
      ?auto_123046 - BLOCK
      ?auto_123047 - BLOCK
      ?auto_123048 - BLOCK
      ?auto_123049 - BLOCK
    )
    :vars
    (
      ?auto_123050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123049 ?auto_123050 ) ( ON-TABLE ?auto_123041 ) ( ON ?auto_123042 ?auto_123041 ) ( not ( = ?auto_123041 ?auto_123042 ) ) ( not ( = ?auto_123041 ?auto_123043 ) ) ( not ( = ?auto_123041 ?auto_123044 ) ) ( not ( = ?auto_123041 ?auto_123045 ) ) ( not ( = ?auto_123041 ?auto_123046 ) ) ( not ( = ?auto_123041 ?auto_123047 ) ) ( not ( = ?auto_123041 ?auto_123048 ) ) ( not ( = ?auto_123041 ?auto_123049 ) ) ( not ( = ?auto_123041 ?auto_123050 ) ) ( not ( = ?auto_123042 ?auto_123043 ) ) ( not ( = ?auto_123042 ?auto_123044 ) ) ( not ( = ?auto_123042 ?auto_123045 ) ) ( not ( = ?auto_123042 ?auto_123046 ) ) ( not ( = ?auto_123042 ?auto_123047 ) ) ( not ( = ?auto_123042 ?auto_123048 ) ) ( not ( = ?auto_123042 ?auto_123049 ) ) ( not ( = ?auto_123042 ?auto_123050 ) ) ( not ( = ?auto_123043 ?auto_123044 ) ) ( not ( = ?auto_123043 ?auto_123045 ) ) ( not ( = ?auto_123043 ?auto_123046 ) ) ( not ( = ?auto_123043 ?auto_123047 ) ) ( not ( = ?auto_123043 ?auto_123048 ) ) ( not ( = ?auto_123043 ?auto_123049 ) ) ( not ( = ?auto_123043 ?auto_123050 ) ) ( not ( = ?auto_123044 ?auto_123045 ) ) ( not ( = ?auto_123044 ?auto_123046 ) ) ( not ( = ?auto_123044 ?auto_123047 ) ) ( not ( = ?auto_123044 ?auto_123048 ) ) ( not ( = ?auto_123044 ?auto_123049 ) ) ( not ( = ?auto_123044 ?auto_123050 ) ) ( not ( = ?auto_123045 ?auto_123046 ) ) ( not ( = ?auto_123045 ?auto_123047 ) ) ( not ( = ?auto_123045 ?auto_123048 ) ) ( not ( = ?auto_123045 ?auto_123049 ) ) ( not ( = ?auto_123045 ?auto_123050 ) ) ( not ( = ?auto_123046 ?auto_123047 ) ) ( not ( = ?auto_123046 ?auto_123048 ) ) ( not ( = ?auto_123046 ?auto_123049 ) ) ( not ( = ?auto_123046 ?auto_123050 ) ) ( not ( = ?auto_123047 ?auto_123048 ) ) ( not ( = ?auto_123047 ?auto_123049 ) ) ( not ( = ?auto_123047 ?auto_123050 ) ) ( not ( = ?auto_123048 ?auto_123049 ) ) ( not ( = ?auto_123048 ?auto_123050 ) ) ( not ( = ?auto_123049 ?auto_123050 ) ) ( ON ?auto_123048 ?auto_123049 ) ( ON ?auto_123047 ?auto_123048 ) ( ON ?auto_123046 ?auto_123047 ) ( ON ?auto_123045 ?auto_123046 ) ( ON ?auto_123044 ?auto_123045 ) ( CLEAR ?auto_123042 ) ( ON ?auto_123043 ?auto_123044 ) ( CLEAR ?auto_123043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123041 ?auto_123042 ?auto_123043 )
      ( MAKE-9PILE ?auto_123041 ?auto_123042 ?auto_123043 ?auto_123044 ?auto_123045 ?auto_123046 ?auto_123047 ?auto_123048 ?auto_123049 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_123079 - BLOCK
      ?auto_123080 - BLOCK
      ?auto_123081 - BLOCK
      ?auto_123082 - BLOCK
      ?auto_123083 - BLOCK
      ?auto_123084 - BLOCK
      ?auto_123085 - BLOCK
      ?auto_123086 - BLOCK
      ?auto_123087 - BLOCK
    )
    :vars
    (
      ?auto_123088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123087 ?auto_123088 ) ( ON-TABLE ?auto_123079 ) ( not ( = ?auto_123079 ?auto_123080 ) ) ( not ( = ?auto_123079 ?auto_123081 ) ) ( not ( = ?auto_123079 ?auto_123082 ) ) ( not ( = ?auto_123079 ?auto_123083 ) ) ( not ( = ?auto_123079 ?auto_123084 ) ) ( not ( = ?auto_123079 ?auto_123085 ) ) ( not ( = ?auto_123079 ?auto_123086 ) ) ( not ( = ?auto_123079 ?auto_123087 ) ) ( not ( = ?auto_123079 ?auto_123088 ) ) ( not ( = ?auto_123080 ?auto_123081 ) ) ( not ( = ?auto_123080 ?auto_123082 ) ) ( not ( = ?auto_123080 ?auto_123083 ) ) ( not ( = ?auto_123080 ?auto_123084 ) ) ( not ( = ?auto_123080 ?auto_123085 ) ) ( not ( = ?auto_123080 ?auto_123086 ) ) ( not ( = ?auto_123080 ?auto_123087 ) ) ( not ( = ?auto_123080 ?auto_123088 ) ) ( not ( = ?auto_123081 ?auto_123082 ) ) ( not ( = ?auto_123081 ?auto_123083 ) ) ( not ( = ?auto_123081 ?auto_123084 ) ) ( not ( = ?auto_123081 ?auto_123085 ) ) ( not ( = ?auto_123081 ?auto_123086 ) ) ( not ( = ?auto_123081 ?auto_123087 ) ) ( not ( = ?auto_123081 ?auto_123088 ) ) ( not ( = ?auto_123082 ?auto_123083 ) ) ( not ( = ?auto_123082 ?auto_123084 ) ) ( not ( = ?auto_123082 ?auto_123085 ) ) ( not ( = ?auto_123082 ?auto_123086 ) ) ( not ( = ?auto_123082 ?auto_123087 ) ) ( not ( = ?auto_123082 ?auto_123088 ) ) ( not ( = ?auto_123083 ?auto_123084 ) ) ( not ( = ?auto_123083 ?auto_123085 ) ) ( not ( = ?auto_123083 ?auto_123086 ) ) ( not ( = ?auto_123083 ?auto_123087 ) ) ( not ( = ?auto_123083 ?auto_123088 ) ) ( not ( = ?auto_123084 ?auto_123085 ) ) ( not ( = ?auto_123084 ?auto_123086 ) ) ( not ( = ?auto_123084 ?auto_123087 ) ) ( not ( = ?auto_123084 ?auto_123088 ) ) ( not ( = ?auto_123085 ?auto_123086 ) ) ( not ( = ?auto_123085 ?auto_123087 ) ) ( not ( = ?auto_123085 ?auto_123088 ) ) ( not ( = ?auto_123086 ?auto_123087 ) ) ( not ( = ?auto_123086 ?auto_123088 ) ) ( not ( = ?auto_123087 ?auto_123088 ) ) ( ON ?auto_123086 ?auto_123087 ) ( ON ?auto_123085 ?auto_123086 ) ( ON ?auto_123084 ?auto_123085 ) ( ON ?auto_123083 ?auto_123084 ) ( ON ?auto_123082 ?auto_123083 ) ( ON ?auto_123081 ?auto_123082 ) ( CLEAR ?auto_123079 ) ( ON ?auto_123080 ?auto_123081 ) ( CLEAR ?auto_123080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123079 ?auto_123080 )
      ( MAKE-9PILE ?auto_123079 ?auto_123080 ?auto_123081 ?auto_123082 ?auto_123083 ?auto_123084 ?auto_123085 ?auto_123086 ?auto_123087 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_123117 - BLOCK
      ?auto_123118 - BLOCK
      ?auto_123119 - BLOCK
      ?auto_123120 - BLOCK
      ?auto_123121 - BLOCK
      ?auto_123122 - BLOCK
      ?auto_123123 - BLOCK
      ?auto_123124 - BLOCK
      ?auto_123125 - BLOCK
    )
    :vars
    (
      ?auto_123126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123125 ?auto_123126 ) ( not ( = ?auto_123117 ?auto_123118 ) ) ( not ( = ?auto_123117 ?auto_123119 ) ) ( not ( = ?auto_123117 ?auto_123120 ) ) ( not ( = ?auto_123117 ?auto_123121 ) ) ( not ( = ?auto_123117 ?auto_123122 ) ) ( not ( = ?auto_123117 ?auto_123123 ) ) ( not ( = ?auto_123117 ?auto_123124 ) ) ( not ( = ?auto_123117 ?auto_123125 ) ) ( not ( = ?auto_123117 ?auto_123126 ) ) ( not ( = ?auto_123118 ?auto_123119 ) ) ( not ( = ?auto_123118 ?auto_123120 ) ) ( not ( = ?auto_123118 ?auto_123121 ) ) ( not ( = ?auto_123118 ?auto_123122 ) ) ( not ( = ?auto_123118 ?auto_123123 ) ) ( not ( = ?auto_123118 ?auto_123124 ) ) ( not ( = ?auto_123118 ?auto_123125 ) ) ( not ( = ?auto_123118 ?auto_123126 ) ) ( not ( = ?auto_123119 ?auto_123120 ) ) ( not ( = ?auto_123119 ?auto_123121 ) ) ( not ( = ?auto_123119 ?auto_123122 ) ) ( not ( = ?auto_123119 ?auto_123123 ) ) ( not ( = ?auto_123119 ?auto_123124 ) ) ( not ( = ?auto_123119 ?auto_123125 ) ) ( not ( = ?auto_123119 ?auto_123126 ) ) ( not ( = ?auto_123120 ?auto_123121 ) ) ( not ( = ?auto_123120 ?auto_123122 ) ) ( not ( = ?auto_123120 ?auto_123123 ) ) ( not ( = ?auto_123120 ?auto_123124 ) ) ( not ( = ?auto_123120 ?auto_123125 ) ) ( not ( = ?auto_123120 ?auto_123126 ) ) ( not ( = ?auto_123121 ?auto_123122 ) ) ( not ( = ?auto_123121 ?auto_123123 ) ) ( not ( = ?auto_123121 ?auto_123124 ) ) ( not ( = ?auto_123121 ?auto_123125 ) ) ( not ( = ?auto_123121 ?auto_123126 ) ) ( not ( = ?auto_123122 ?auto_123123 ) ) ( not ( = ?auto_123122 ?auto_123124 ) ) ( not ( = ?auto_123122 ?auto_123125 ) ) ( not ( = ?auto_123122 ?auto_123126 ) ) ( not ( = ?auto_123123 ?auto_123124 ) ) ( not ( = ?auto_123123 ?auto_123125 ) ) ( not ( = ?auto_123123 ?auto_123126 ) ) ( not ( = ?auto_123124 ?auto_123125 ) ) ( not ( = ?auto_123124 ?auto_123126 ) ) ( not ( = ?auto_123125 ?auto_123126 ) ) ( ON ?auto_123124 ?auto_123125 ) ( ON ?auto_123123 ?auto_123124 ) ( ON ?auto_123122 ?auto_123123 ) ( ON ?auto_123121 ?auto_123122 ) ( ON ?auto_123120 ?auto_123121 ) ( ON ?auto_123119 ?auto_123120 ) ( ON ?auto_123118 ?auto_123119 ) ( ON ?auto_123117 ?auto_123118 ) ( CLEAR ?auto_123117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123117 )
      ( MAKE-9PILE ?auto_123117 ?auto_123118 ?auto_123119 ?auto_123120 ?auto_123121 ?auto_123122 ?auto_123123 ?auto_123124 ?auto_123125 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123156 - BLOCK
      ?auto_123157 - BLOCK
      ?auto_123158 - BLOCK
      ?auto_123159 - BLOCK
      ?auto_123160 - BLOCK
      ?auto_123161 - BLOCK
      ?auto_123162 - BLOCK
      ?auto_123163 - BLOCK
      ?auto_123164 - BLOCK
      ?auto_123165 - BLOCK
    )
    :vars
    (
      ?auto_123166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123164 ) ( ON ?auto_123165 ?auto_123166 ) ( CLEAR ?auto_123165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123156 ) ( ON ?auto_123157 ?auto_123156 ) ( ON ?auto_123158 ?auto_123157 ) ( ON ?auto_123159 ?auto_123158 ) ( ON ?auto_123160 ?auto_123159 ) ( ON ?auto_123161 ?auto_123160 ) ( ON ?auto_123162 ?auto_123161 ) ( ON ?auto_123163 ?auto_123162 ) ( ON ?auto_123164 ?auto_123163 ) ( not ( = ?auto_123156 ?auto_123157 ) ) ( not ( = ?auto_123156 ?auto_123158 ) ) ( not ( = ?auto_123156 ?auto_123159 ) ) ( not ( = ?auto_123156 ?auto_123160 ) ) ( not ( = ?auto_123156 ?auto_123161 ) ) ( not ( = ?auto_123156 ?auto_123162 ) ) ( not ( = ?auto_123156 ?auto_123163 ) ) ( not ( = ?auto_123156 ?auto_123164 ) ) ( not ( = ?auto_123156 ?auto_123165 ) ) ( not ( = ?auto_123156 ?auto_123166 ) ) ( not ( = ?auto_123157 ?auto_123158 ) ) ( not ( = ?auto_123157 ?auto_123159 ) ) ( not ( = ?auto_123157 ?auto_123160 ) ) ( not ( = ?auto_123157 ?auto_123161 ) ) ( not ( = ?auto_123157 ?auto_123162 ) ) ( not ( = ?auto_123157 ?auto_123163 ) ) ( not ( = ?auto_123157 ?auto_123164 ) ) ( not ( = ?auto_123157 ?auto_123165 ) ) ( not ( = ?auto_123157 ?auto_123166 ) ) ( not ( = ?auto_123158 ?auto_123159 ) ) ( not ( = ?auto_123158 ?auto_123160 ) ) ( not ( = ?auto_123158 ?auto_123161 ) ) ( not ( = ?auto_123158 ?auto_123162 ) ) ( not ( = ?auto_123158 ?auto_123163 ) ) ( not ( = ?auto_123158 ?auto_123164 ) ) ( not ( = ?auto_123158 ?auto_123165 ) ) ( not ( = ?auto_123158 ?auto_123166 ) ) ( not ( = ?auto_123159 ?auto_123160 ) ) ( not ( = ?auto_123159 ?auto_123161 ) ) ( not ( = ?auto_123159 ?auto_123162 ) ) ( not ( = ?auto_123159 ?auto_123163 ) ) ( not ( = ?auto_123159 ?auto_123164 ) ) ( not ( = ?auto_123159 ?auto_123165 ) ) ( not ( = ?auto_123159 ?auto_123166 ) ) ( not ( = ?auto_123160 ?auto_123161 ) ) ( not ( = ?auto_123160 ?auto_123162 ) ) ( not ( = ?auto_123160 ?auto_123163 ) ) ( not ( = ?auto_123160 ?auto_123164 ) ) ( not ( = ?auto_123160 ?auto_123165 ) ) ( not ( = ?auto_123160 ?auto_123166 ) ) ( not ( = ?auto_123161 ?auto_123162 ) ) ( not ( = ?auto_123161 ?auto_123163 ) ) ( not ( = ?auto_123161 ?auto_123164 ) ) ( not ( = ?auto_123161 ?auto_123165 ) ) ( not ( = ?auto_123161 ?auto_123166 ) ) ( not ( = ?auto_123162 ?auto_123163 ) ) ( not ( = ?auto_123162 ?auto_123164 ) ) ( not ( = ?auto_123162 ?auto_123165 ) ) ( not ( = ?auto_123162 ?auto_123166 ) ) ( not ( = ?auto_123163 ?auto_123164 ) ) ( not ( = ?auto_123163 ?auto_123165 ) ) ( not ( = ?auto_123163 ?auto_123166 ) ) ( not ( = ?auto_123164 ?auto_123165 ) ) ( not ( = ?auto_123164 ?auto_123166 ) ) ( not ( = ?auto_123165 ?auto_123166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123165 ?auto_123166 )
      ( !STACK ?auto_123165 ?auto_123164 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123198 - BLOCK
      ?auto_123199 - BLOCK
      ?auto_123200 - BLOCK
      ?auto_123201 - BLOCK
      ?auto_123202 - BLOCK
      ?auto_123203 - BLOCK
      ?auto_123204 - BLOCK
      ?auto_123205 - BLOCK
      ?auto_123206 - BLOCK
      ?auto_123207 - BLOCK
    )
    :vars
    (
      ?auto_123208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123207 ?auto_123208 ) ( ON-TABLE ?auto_123198 ) ( ON ?auto_123199 ?auto_123198 ) ( ON ?auto_123200 ?auto_123199 ) ( ON ?auto_123201 ?auto_123200 ) ( ON ?auto_123202 ?auto_123201 ) ( ON ?auto_123203 ?auto_123202 ) ( ON ?auto_123204 ?auto_123203 ) ( ON ?auto_123205 ?auto_123204 ) ( not ( = ?auto_123198 ?auto_123199 ) ) ( not ( = ?auto_123198 ?auto_123200 ) ) ( not ( = ?auto_123198 ?auto_123201 ) ) ( not ( = ?auto_123198 ?auto_123202 ) ) ( not ( = ?auto_123198 ?auto_123203 ) ) ( not ( = ?auto_123198 ?auto_123204 ) ) ( not ( = ?auto_123198 ?auto_123205 ) ) ( not ( = ?auto_123198 ?auto_123206 ) ) ( not ( = ?auto_123198 ?auto_123207 ) ) ( not ( = ?auto_123198 ?auto_123208 ) ) ( not ( = ?auto_123199 ?auto_123200 ) ) ( not ( = ?auto_123199 ?auto_123201 ) ) ( not ( = ?auto_123199 ?auto_123202 ) ) ( not ( = ?auto_123199 ?auto_123203 ) ) ( not ( = ?auto_123199 ?auto_123204 ) ) ( not ( = ?auto_123199 ?auto_123205 ) ) ( not ( = ?auto_123199 ?auto_123206 ) ) ( not ( = ?auto_123199 ?auto_123207 ) ) ( not ( = ?auto_123199 ?auto_123208 ) ) ( not ( = ?auto_123200 ?auto_123201 ) ) ( not ( = ?auto_123200 ?auto_123202 ) ) ( not ( = ?auto_123200 ?auto_123203 ) ) ( not ( = ?auto_123200 ?auto_123204 ) ) ( not ( = ?auto_123200 ?auto_123205 ) ) ( not ( = ?auto_123200 ?auto_123206 ) ) ( not ( = ?auto_123200 ?auto_123207 ) ) ( not ( = ?auto_123200 ?auto_123208 ) ) ( not ( = ?auto_123201 ?auto_123202 ) ) ( not ( = ?auto_123201 ?auto_123203 ) ) ( not ( = ?auto_123201 ?auto_123204 ) ) ( not ( = ?auto_123201 ?auto_123205 ) ) ( not ( = ?auto_123201 ?auto_123206 ) ) ( not ( = ?auto_123201 ?auto_123207 ) ) ( not ( = ?auto_123201 ?auto_123208 ) ) ( not ( = ?auto_123202 ?auto_123203 ) ) ( not ( = ?auto_123202 ?auto_123204 ) ) ( not ( = ?auto_123202 ?auto_123205 ) ) ( not ( = ?auto_123202 ?auto_123206 ) ) ( not ( = ?auto_123202 ?auto_123207 ) ) ( not ( = ?auto_123202 ?auto_123208 ) ) ( not ( = ?auto_123203 ?auto_123204 ) ) ( not ( = ?auto_123203 ?auto_123205 ) ) ( not ( = ?auto_123203 ?auto_123206 ) ) ( not ( = ?auto_123203 ?auto_123207 ) ) ( not ( = ?auto_123203 ?auto_123208 ) ) ( not ( = ?auto_123204 ?auto_123205 ) ) ( not ( = ?auto_123204 ?auto_123206 ) ) ( not ( = ?auto_123204 ?auto_123207 ) ) ( not ( = ?auto_123204 ?auto_123208 ) ) ( not ( = ?auto_123205 ?auto_123206 ) ) ( not ( = ?auto_123205 ?auto_123207 ) ) ( not ( = ?auto_123205 ?auto_123208 ) ) ( not ( = ?auto_123206 ?auto_123207 ) ) ( not ( = ?auto_123206 ?auto_123208 ) ) ( not ( = ?auto_123207 ?auto_123208 ) ) ( CLEAR ?auto_123205 ) ( ON ?auto_123206 ?auto_123207 ) ( CLEAR ?auto_123206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_123198 ?auto_123199 ?auto_123200 ?auto_123201 ?auto_123202 ?auto_123203 ?auto_123204 ?auto_123205 ?auto_123206 )
      ( MAKE-10PILE ?auto_123198 ?auto_123199 ?auto_123200 ?auto_123201 ?auto_123202 ?auto_123203 ?auto_123204 ?auto_123205 ?auto_123206 ?auto_123207 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123240 - BLOCK
      ?auto_123241 - BLOCK
      ?auto_123242 - BLOCK
      ?auto_123243 - BLOCK
      ?auto_123244 - BLOCK
      ?auto_123245 - BLOCK
      ?auto_123246 - BLOCK
      ?auto_123247 - BLOCK
      ?auto_123248 - BLOCK
      ?auto_123249 - BLOCK
    )
    :vars
    (
      ?auto_123250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123249 ?auto_123250 ) ( ON-TABLE ?auto_123240 ) ( ON ?auto_123241 ?auto_123240 ) ( ON ?auto_123242 ?auto_123241 ) ( ON ?auto_123243 ?auto_123242 ) ( ON ?auto_123244 ?auto_123243 ) ( ON ?auto_123245 ?auto_123244 ) ( ON ?auto_123246 ?auto_123245 ) ( not ( = ?auto_123240 ?auto_123241 ) ) ( not ( = ?auto_123240 ?auto_123242 ) ) ( not ( = ?auto_123240 ?auto_123243 ) ) ( not ( = ?auto_123240 ?auto_123244 ) ) ( not ( = ?auto_123240 ?auto_123245 ) ) ( not ( = ?auto_123240 ?auto_123246 ) ) ( not ( = ?auto_123240 ?auto_123247 ) ) ( not ( = ?auto_123240 ?auto_123248 ) ) ( not ( = ?auto_123240 ?auto_123249 ) ) ( not ( = ?auto_123240 ?auto_123250 ) ) ( not ( = ?auto_123241 ?auto_123242 ) ) ( not ( = ?auto_123241 ?auto_123243 ) ) ( not ( = ?auto_123241 ?auto_123244 ) ) ( not ( = ?auto_123241 ?auto_123245 ) ) ( not ( = ?auto_123241 ?auto_123246 ) ) ( not ( = ?auto_123241 ?auto_123247 ) ) ( not ( = ?auto_123241 ?auto_123248 ) ) ( not ( = ?auto_123241 ?auto_123249 ) ) ( not ( = ?auto_123241 ?auto_123250 ) ) ( not ( = ?auto_123242 ?auto_123243 ) ) ( not ( = ?auto_123242 ?auto_123244 ) ) ( not ( = ?auto_123242 ?auto_123245 ) ) ( not ( = ?auto_123242 ?auto_123246 ) ) ( not ( = ?auto_123242 ?auto_123247 ) ) ( not ( = ?auto_123242 ?auto_123248 ) ) ( not ( = ?auto_123242 ?auto_123249 ) ) ( not ( = ?auto_123242 ?auto_123250 ) ) ( not ( = ?auto_123243 ?auto_123244 ) ) ( not ( = ?auto_123243 ?auto_123245 ) ) ( not ( = ?auto_123243 ?auto_123246 ) ) ( not ( = ?auto_123243 ?auto_123247 ) ) ( not ( = ?auto_123243 ?auto_123248 ) ) ( not ( = ?auto_123243 ?auto_123249 ) ) ( not ( = ?auto_123243 ?auto_123250 ) ) ( not ( = ?auto_123244 ?auto_123245 ) ) ( not ( = ?auto_123244 ?auto_123246 ) ) ( not ( = ?auto_123244 ?auto_123247 ) ) ( not ( = ?auto_123244 ?auto_123248 ) ) ( not ( = ?auto_123244 ?auto_123249 ) ) ( not ( = ?auto_123244 ?auto_123250 ) ) ( not ( = ?auto_123245 ?auto_123246 ) ) ( not ( = ?auto_123245 ?auto_123247 ) ) ( not ( = ?auto_123245 ?auto_123248 ) ) ( not ( = ?auto_123245 ?auto_123249 ) ) ( not ( = ?auto_123245 ?auto_123250 ) ) ( not ( = ?auto_123246 ?auto_123247 ) ) ( not ( = ?auto_123246 ?auto_123248 ) ) ( not ( = ?auto_123246 ?auto_123249 ) ) ( not ( = ?auto_123246 ?auto_123250 ) ) ( not ( = ?auto_123247 ?auto_123248 ) ) ( not ( = ?auto_123247 ?auto_123249 ) ) ( not ( = ?auto_123247 ?auto_123250 ) ) ( not ( = ?auto_123248 ?auto_123249 ) ) ( not ( = ?auto_123248 ?auto_123250 ) ) ( not ( = ?auto_123249 ?auto_123250 ) ) ( ON ?auto_123248 ?auto_123249 ) ( CLEAR ?auto_123246 ) ( ON ?auto_123247 ?auto_123248 ) ( CLEAR ?auto_123247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_123240 ?auto_123241 ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123245 ?auto_123246 ?auto_123247 )
      ( MAKE-10PILE ?auto_123240 ?auto_123241 ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123245 ?auto_123246 ?auto_123247 ?auto_123248 ?auto_123249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123282 - BLOCK
      ?auto_123283 - BLOCK
      ?auto_123284 - BLOCK
      ?auto_123285 - BLOCK
      ?auto_123286 - BLOCK
      ?auto_123287 - BLOCK
      ?auto_123288 - BLOCK
      ?auto_123289 - BLOCK
      ?auto_123290 - BLOCK
      ?auto_123291 - BLOCK
    )
    :vars
    (
      ?auto_123292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123291 ?auto_123292 ) ( ON-TABLE ?auto_123282 ) ( ON ?auto_123283 ?auto_123282 ) ( ON ?auto_123284 ?auto_123283 ) ( ON ?auto_123285 ?auto_123284 ) ( ON ?auto_123286 ?auto_123285 ) ( ON ?auto_123287 ?auto_123286 ) ( not ( = ?auto_123282 ?auto_123283 ) ) ( not ( = ?auto_123282 ?auto_123284 ) ) ( not ( = ?auto_123282 ?auto_123285 ) ) ( not ( = ?auto_123282 ?auto_123286 ) ) ( not ( = ?auto_123282 ?auto_123287 ) ) ( not ( = ?auto_123282 ?auto_123288 ) ) ( not ( = ?auto_123282 ?auto_123289 ) ) ( not ( = ?auto_123282 ?auto_123290 ) ) ( not ( = ?auto_123282 ?auto_123291 ) ) ( not ( = ?auto_123282 ?auto_123292 ) ) ( not ( = ?auto_123283 ?auto_123284 ) ) ( not ( = ?auto_123283 ?auto_123285 ) ) ( not ( = ?auto_123283 ?auto_123286 ) ) ( not ( = ?auto_123283 ?auto_123287 ) ) ( not ( = ?auto_123283 ?auto_123288 ) ) ( not ( = ?auto_123283 ?auto_123289 ) ) ( not ( = ?auto_123283 ?auto_123290 ) ) ( not ( = ?auto_123283 ?auto_123291 ) ) ( not ( = ?auto_123283 ?auto_123292 ) ) ( not ( = ?auto_123284 ?auto_123285 ) ) ( not ( = ?auto_123284 ?auto_123286 ) ) ( not ( = ?auto_123284 ?auto_123287 ) ) ( not ( = ?auto_123284 ?auto_123288 ) ) ( not ( = ?auto_123284 ?auto_123289 ) ) ( not ( = ?auto_123284 ?auto_123290 ) ) ( not ( = ?auto_123284 ?auto_123291 ) ) ( not ( = ?auto_123284 ?auto_123292 ) ) ( not ( = ?auto_123285 ?auto_123286 ) ) ( not ( = ?auto_123285 ?auto_123287 ) ) ( not ( = ?auto_123285 ?auto_123288 ) ) ( not ( = ?auto_123285 ?auto_123289 ) ) ( not ( = ?auto_123285 ?auto_123290 ) ) ( not ( = ?auto_123285 ?auto_123291 ) ) ( not ( = ?auto_123285 ?auto_123292 ) ) ( not ( = ?auto_123286 ?auto_123287 ) ) ( not ( = ?auto_123286 ?auto_123288 ) ) ( not ( = ?auto_123286 ?auto_123289 ) ) ( not ( = ?auto_123286 ?auto_123290 ) ) ( not ( = ?auto_123286 ?auto_123291 ) ) ( not ( = ?auto_123286 ?auto_123292 ) ) ( not ( = ?auto_123287 ?auto_123288 ) ) ( not ( = ?auto_123287 ?auto_123289 ) ) ( not ( = ?auto_123287 ?auto_123290 ) ) ( not ( = ?auto_123287 ?auto_123291 ) ) ( not ( = ?auto_123287 ?auto_123292 ) ) ( not ( = ?auto_123288 ?auto_123289 ) ) ( not ( = ?auto_123288 ?auto_123290 ) ) ( not ( = ?auto_123288 ?auto_123291 ) ) ( not ( = ?auto_123288 ?auto_123292 ) ) ( not ( = ?auto_123289 ?auto_123290 ) ) ( not ( = ?auto_123289 ?auto_123291 ) ) ( not ( = ?auto_123289 ?auto_123292 ) ) ( not ( = ?auto_123290 ?auto_123291 ) ) ( not ( = ?auto_123290 ?auto_123292 ) ) ( not ( = ?auto_123291 ?auto_123292 ) ) ( ON ?auto_123290 ?auto_123291 ) ( ON ?auto_123289 ?auto_123290 ) ( CLEAR ?auto_123287 ) ( ON ?auto_123288 ?auto_123289 ) ( CLEAR ?auto_123288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123282 ?auto_123283 ?auto_123284 ?auto_123285 ?auto_123286 ?auto_123287 ?auto_123288 )
      ( MAKE-10PILE ?auto_123282 ?auto_123283 ?auto_123284 ?auto_123285 ?auto_123286 ?auto_123287 ?auto_123288 ?auto_123289 ?auto_123290 ?auto_123291 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123324 - BLOCK
      ?auto_123325 - BLOCK
      ?auto_123326 - BLOCK
      ?auto_123327 - BLOCK
      ?auto_123328 - BLOCK
      ?auto_123329 - BLOCK
      ?auto_123330 - BLOCK
      ?auto_123331 - BLOCK
      ?auto_123332 - BLOCK
      ?auto_123333 - BLOCK
    )
    :vars
    (
      ?auto_123334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123333 ?auto_123334 ) ( ON-TABLE ?auto_123324 ) ( ON ?auto_123325 ?auto_123324 ) ( ON ?auto_123326 ?auto_123325 ) ( ON ?auto_123327 ?auto_123326 ) ( ON ?auto_123328 ?auto_123327 ) ( not ( = ?auto_123324 ?auto_123325 ) ) ( not ( = ?auto_123324 ?auto_123326 ) ) ( not ( = ?auto_123324 ?auto_123327 ) ) ( not ( = ?auto_123324 ?auto_123328 ) ) ( not ( = ?auto_123324 ?auto_123329 ) ) ( not ( = ?auto_123324 ?auto_123330 ) ) ( not ( = ?auto_123324 ?auto_123331 ) ) ( not ( = ?auto_123324 ?auto_123332 ) ) ( not ( = ?auto_123324 ?auto_123333 ) ) ( not ( = ?auto_123324 ?auto_123334 ) ) ( not ( = ?auto_123325 ?auto_123326 ) ) ( not ( = ?auto_123325 ?auto_123327 ) ) ( not ( = ?auto_123325 ?auto_123328 ) ) ( not ( = ?auto_123325 ?auto_123329 ) ) ( not ( = ?auto_123325 ?auto_123330 ) ) ( not ( = ?auto_123325 ?auto_123331 ) ) ( not ( = ?auto_123325 ?auto_123332 ) ) ( not ( = ?auto_123325 ?auto_123333 ) ) ( not ( = ?auto_123325 ?auto_123334 ) ) ( not ( = ?auto_123326 ?auto_123327 ) ) ( not ( = ?auto_123326 ?auto_123328 ) ) ( not ( = ?auto_123326 ?auto_123329 ) ) ( not ( = ?auto_123326 ?auto_123330 ) ) ( not ( = ?auto_123326 ?auto_123331 ) ) ( not ( = ?auto_123326 ?auto_123332 ) ) ( not ( = ?auto_123326 ?auto_123333 ) ) ( not ( = ?auto_123326 ?auto_123334 ) ) ( not ( = ?auto_123327 ?auto_123328 ) ) ( not ( = ?auto_123327 ?auto_123329 ) ) ( not ( = ?auto_123327 ?auto_123330 ) ) ( not ( = ?auto_123327 ?auto_123331 ) ) ( not ( = ?auto_123327 ?auto_123332 ) ) ( not ( = ?auto_123327 ?auto_123333 ) ) ( not ( = ?auto_123327 ?auto_123334 ) ) ( not ( = ?auto_123328 ?auto_123329 ) ) ( not ( = ?auto_123328 ?auto_123330 ) ) ( not ( = ?auto_123328 ?auto_123331 ) ) ( not ( = ?auto_123328 ?auto_123332 ) ) ( not ( = ?auto_123328 ?auto_123333 ) ) ( not ( = ?auto_123328 ?auto_123334 ) ) ( not ( = ?auto_123329 ?auto_123330 ) ) ( not ( = ?auto_123329 ?auto_123331 ) ) ( not ( = ?auto_123329 ?auto_123332 ) ) ( not ( = ?auto_123329 ?auto_123333 ) ) ( not ( = ?auto_123329 ?auto_123334 ) ) ( not ( = ?auto_123330 ?auto_123331 ) ) ( not ( = ?auto_123330 ?auto_123332 ) ) ( not ( = ?auto_123330 ?auto_123333 ) ) ( not ( = ?auto_123330 ?auto_123334 ) ) ( not ( = ?auto_123331 ?auto_123332 ) ) ( not ( = ?auto_123331 ?auto_123333 ) ) ( not ( = ?auto_123331 ?auto_123334 ) ) ( not ( = ?auto_123332 ?auto_123333 ) ) ( not ( = ?auto_123332 ?auto_123334 ) ) ( not ( = ?auto_123333 ?auto_123334 ) ) ( ON ?auto_123332 ?auto_123333 ) ( ON ?auto_123331 ?auto_123332 ) ( ON ?auto_123330 ?auto_123331 ) ( CLEAR ?auto_123328 ) ( ON ?auto_123329 ?auto_123330 ) ( CLEAR ?auto_123329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123324 ?auto_123325 ?auto_123326 ?auto_123327 ?auto_123328 ?auto_123329 )
      ( MAKE-10PILE ?auto_123324 ?auto_123325 ?auto_123326 ?auto_123327 ?auto_123328 ?auto_123329 ?auto_123330 ?auto_123331 ?auto_123332 ?auto_123333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123366 - BLOCK
      ?auto_123367 - BLOCK
      ?auto_123368 - BLOCK
      ?auto_123369 - BLOCK
      ?auto_123370 - BLOCK
      ?auto_123371 - BLOCK
      ?auto_123372 - BLOCK
      ?auto_123373 - BLOCK
      ?auto_123374 - BLOCK
      ?auto_123375 - BLOCK
    )
    :vars
    (
      ?auto_123376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123375 ?auto_123376 ) ( ON-TABLE ?auto_123366 ) ( ON ?auto_123367 ?auto_123366 ) ( ON ?auto_123368 ?auto_123367 ) ( ON ?auto_123369 ?auto_123368 ) ( not ( = ?auto_123366 ?auto_123367 ) ) ( not ( = ?auto_123366 ?auto_123368 ) ) ( not ( = ?auto_123366 ?auto_123369 ) ) ( not ( = ?auto_123366 ?auto_123370 ) ) ( not ( = ?auto_123366 ?auto_123371 ) ) ( not ( = ?auto_123366 ?auto_123372 ) ) ( not ( = ?auto_123366 ?auto_123373 ) ) ( not ( = ?auto_123366 ?auto_123374 ) ) ( not ( = ?auto_123366 ?auto_123375 ) ) ( not ( = ?auto_123366 ?auto_123376 ) ) ( not ( = ?auto_123367 ?auto_123368 ) ) ( not ( = ?auto_123367 ?auto_123369 ) ) ( not ( = ?auto_123367 ?auto_123370 ) ) ( not ( = ?auto_123367 ?auto_123371 ) ) ( not ( = ?auto_123367 ?auto_123372 ) ) ( not ( = ?auto_123367 ?auto_123373 ) ) ( not ( = ?auto_123367 ?auto_123374 ) ) ( not ( = ?auto_123367 ?auto_123375 ) ) ( not ( = ?auto_123367 ?auto_123376 ) ) ( not ( = ?auto_123368 ?auto_123369 ) ) ( not ( = ?auto_123368 ?auto_123370 ) ) ( not ( = ?auto_123368 ?auto_123371 ) ) ( not ( = ?auto_123368 ?auto_123372 ) ) ( not ( = ?auto_123368 ?auto_123373 ) ) ( not ( = ?auto_123368 ?auto_123374 ) ) ( not ( = ?auto_123368 ?auto_123375 ) ) ( not ( = ?auto_123368 ?auto_123376 ) ) ( not ( = ?auto_123369 ?auto_123370 ) ) ( not ( = ?auto_123369 ?auto_123371 ) ) ( not ( = ?auto_123369 ?auto_123372 ) ) ( not ( = ?auto_123369 ?auto_123373 ) ) ( not ( = ?auto_123369 ?auto_123374 ) ) ( not ( = ?auto_123369 ?auto_123375 ) ) ( not ( = ?auto_123369 ?auto_123376 ) ) ( not ( = ?auto_123370 ?auto_123371 ) ) ( not ( = ?auto_123370 ?auto_123372 ) ) ( not ( = ?auto_123370 ?auto_123373 ) ) ( not ( = ?auto_123370 ?auto_123374 ) ) ( not ( = ?auto_123370 ?auto_123375 ) ) ( not ( = ?auto_123370 ?auto_123376 ) ) ( not ( = ?auto_123371 ?auto_123372 ) ) ( not ( = ?auto_123371 ?auto_123373 ) ) ( not ( = ?auto_123371 ?auto_123374 ) ) ( not ( = ?auto_123371 ?auto_123375 ) ) ( not ( = ?auto_123371 ?auto_123376 ) ) ( not ( = ?auto_123372 ?auto_123373 ) ) ( not ( = ?auto_123372 ?auto_123374 ) ) ( not ( = ?auto_123372 ?auto_123375 ) ) ( not ( = ?auto_123372 ?auto_123376 ) ) ( not ( = ?auto_123373 ?auto_123374 ) ) ( not ( = ?auto_123373 ?auto_123375 ) ) ( not ( = ?auto_123373 ?auto_123376 ) ) ( not ( = ?auto_123374 ?auto_123375 ) ) ( not ( = ?auto_123374 ?auto_123376 ) ) ( not ( = ?auto_123375 ?auto_123376 ) ) ( ON ?auto_123374 ?auto_123375 ) ( ON ?auto_123373 ?auto_123374 ) ( ON ?auto_123372 ?auto_123373 ) ( ON ?auto_123371 ?auto_123372 ) ( CLEAR ?auto_123369 ) ( ON ?auto_123370 ?auto_123371 ) ( CLEAR ?auto_123370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123366 ?auto_123367 ?auto_123368 ?auto_123369 ?auto_123370 )
      ( MAKE-10PILE ?auto_123366 ?auto_123367 ?auto_123368 ?auto_123369 ?auto_123370 ?auto_123371 ?auto_123372 ?auto_123373 ?auto_123374 ?auto_123375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123408 - BLOCK
      ?auto_123409 - BLOCK
      ?auto_123410 - BLOCK
      ?auto_123411 - BLOCK
      ?auto_123412 - BLOCK
      ?auto_123413 - BLOCK
      ?auto_123414 - BLOCK
      ?auto_123415 - BLOCK
      ?auto_123416 - BLOCK
      ?auto_123417 - BLOCK
    )
    :vars
    (
      ?auto_123418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123417 ?auto_123418 ) ( ON-TABLE ?auto_123408 ) ( ON ?auto_123409 ?auto_123408 ) ( ON ?auto_123410 ?auto_123409 ) ( not ( = ?auto_123408 ?auto_123409 ) ) ( not ( = ?auto_123408 ?auto_123410 ) ) ( not ( = ?auto_123408 ?auto_123411 ) ) ( not ( = ?auto_123408 ?auto_123412 ) ) ( not ( = ?auto_123408 ?auto_123413 ) ) ( not ( = ?auto_123408 ?auto_123414 ) ) ( not ( = ?auto_123408 ?auto_123415 ) ) ( not ( = ?auto_123408 ?auto_123416 ) ) ( not ( = ?auto_123408 ?auto_123417 ) ) ( not ( = ?auto_123408 ?auto_123418 ) ) ( not ( = ?auto_123409 ?auto_123410 ) ) ( not ( = ?auto_123409 ?auto_123411 ) ) ( not ( = ?auto_123409 ?auto_123412 ) ) ( not ( = ?auto_123409 ?auto_123413 ) ) ( not ( = ?auto_123409 ?auto_123414 ) ) ( not ( = ?auto_123409 ?auto_123415 ) ) ( not ( = ?auto_123409 ?auto_123416 ) ) ( not ( = ?auto_123409 ?auto_123417 ) ) ( not ( = ?auto_123409 ?auto_123418 ) ) ( not ( = ?auto_123410 ?auto_123411 ) ) ( not ( = ?auto_123410 ?auto_123412 ) ) ( not ( = ?auto_123410 ?auto_123413 ) ) ( not ( = ?auto_123410 ?auto_123414 ) ) ( not ( = ?auto_123410 ?auto_123415 ) ) ( not ( = ?auto_123410 ?auto_123416 ) ) ( not ( = ?auto_123410 ?auto_123417 ) ) ( not ( = ?auto_123410 ?auto_123418 ) ) ( not ( = ?auto_123411 ?auto_123412 ) ) ( not ( = ?auto_123411 ?auto_123413 ) ) ( not ( = ?auto_123411 ?auto_123414 ) ) ( not ( = ?auto_123411 ?auto_123415 ) ) ( not ( = ?auto_123411 ?auto_123416 ) ) ( not ( = ?auto_123411 ?auto_123417 ) ) ( not ( = ?auto_123411 ?auto_123418 ) ) ( not ( = ?auto_123412 ?auto_123413 ) ) ( not ( = ?auto_123412 ?auto_123414 ) ) ( not ( = ?auto_123412 ?auto_123415 ) ) ( not ( = ?auto_123412 ?auto_123416 ) ) ( not ( = ?auto_123412 ?auto_123417 ) ) ( not ( = ?auto_123412 ?auto_123418 ) ) ( not ( = ?auto_123413 ?auto_123414 ) ) ( not ( = ?auto_123413 ?auto_123415 ) ) ( not ( = ?auto_123413 ?auto_123416 ) ) ( not ( = ?auto_123413 ?auto_123417 ) ) ( not ( = ?auto_123413 ?auto_123418 ) ) ( not ( = ?auto_123414 ?auto_123415 ) ) ( not ( = ?auto_123414 ?auto_123416 ) ) ( not ( = ?auto_123414 ?auto_123417 ) ) ( not ( = ?auto_123414 ?auto_123418 ) ) ( not ( = ?auto_123415 ?auto_123416 ) ) ( not ( = ?auto_123415 ?auto_123417 ) ) ( not ( = ?auto_123415 ?auto_123418 ) ) ( not ( = ?auto_123416 ?auto_123417 ) ) ( not ( = ?auto_123416 ?auto_123418 ) ) ( not ( = ?auto_123417 ?auto_123418 ) ) ( ON ?auto_123416 ?auto_123417 ) ( ON ?auto_123415 ?auto_123416 ) ( ON ?auto_123414 ?auto_123415 ) ( ON ?auto_123413 ?auto_123414 ) ( ON ?auto_123412 ?auto_123413 ) ( CLEAR ?auto_123410 ) ( ON ?auto_123411 ?auto_123412 ) ( CLEAR ?auto_123411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123408 ?auto_123409 ?auto_123410 ?auto_123411 )
      ( MAKE-10PILE ?auto_123408 ?auto_123409 ?auto_123410 ?auto_123411 ?auto_123412 ?auto_123413 ?auto_123414 ?auto_123415 ?auto_123416 ?auto_123417 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123450 - BLOCK
      ?auto_123451 - BLOCK
      ?auto_123452 - BLOCK
      ?auto_123453 - BLOCK
      ?auto_123454 - BLOCK
      ?auto_123455 - BLOCK
      ?auto_123456 - BLOCK
      ?auto_123457 - BLOCK
      ?auto_123458 - BLOCK
      ?auto_123459 - BLOCK
    )
    :vars
    (
      ?auto_123460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123459 ?auto_123460 ) ( ON-TABLE ?auto_123450 ) ( ON ?auto_123451 ?auto_123450 ) ( not ( = ?auto_123450 ?auto_123451 ) ) ( not ( = ?auto_123450 ?auto_123452 ) ) ( not ( = ?auto_123450 ?auto_123453 ) ) ( not ( = ?auto_123450 ?auto_123454 ) ) ( not ( = ?auto_123450 ?auto_123455 ) ) ( not ( = ?auto_123450 ?auto_123456 ) ) ( not ( = ?auto_123450 ?auto_123457 ) ) ( not ( = ?auto_123450 ?auto_123458 ) ) ( not ( = ?auto_123450 ?auto_123459 ) ) ( not ( = ?auto_123450 ?auto_123460 ) ) ( not ( = ?auto_123451 ?auto_123452 ) ) ( not ( = ?auto_123451 ?auto_123453 ) ) ( not ( = ?auto_123451 ?auto_123454 ) ) ( not ( = ?auto_123451 ?auto_123455 ) ) ( not ( = ?auto_123451 ?auto_123456 ) ) ( not ( = ?auto_123451 ?auto_123457 ) ) ( not ( = ?auto_123451 ?auto_123458 ) ) ( not ( = ?auto_123451 ?auto_123459 ) ) ( not ( = ?auto_123451 ?auto_123460 ) ) ( not ( = ?auto_123452 ?auto_123453 ) ) ( not ( = ?auto_123452 ?auto_123454 ) ) ( not ( = ?auto_123452 ?auto_123455 ) ) ( not ( = ?auto_123452 ?auto_123456 ) ) ( not ( = ?auto_123452 ?auto_123457 ) ) ( not ( = ?auto_123452 ?auto_123458 ) ) ( not ( = ?auto_123452 ?auto_123459 ) ) ( not ( = ?auto_123452 ?auto_123460 ) ) ( not ( = ?auto_123453 ?auto_123454 ) ) ( not ( = ?auto_123453 ?auto_123455 ) ) ( not ( = ?auto_123453 ?auto_123456 ) ) ( not ( = ?auto_123453 ?auto_123457 ) ) ( not ( = ?auto_123453 ?auto_123458 ) ) ( not ( = ?auto_123453 ?auto_123459 ) ) ( not ( = ?auto_123453 ?auto_123460 ) ) ( not ( = ?auto_123454 ?auto_123455 ) ) ( not ( = ?auto_123454 ?auto_123456 ) ) ( not ( = ?auto_123454 ?auto_123457 ) ) ( not ( = ?auto_123454 ?auto_123458 ) ) ( not ( = ?auto_123454 ?auto_123459 ) ) ( not ( = ?auto_123454 ?auto_123460 ) ) ( not ( = ?auto_123455 ?auto_123456 ) ) ( not ( = ?auto_123455 ?auto_123457 ) ) ( not ( = ?auto_123455 ?auto_123458 ) ) ( not ( = ?auto_123455 ?auto_123459 ) ) ( not ( = ?auto_123455 ?auto_123460 ) ) ( not ( = ?auto_123456 ?auto_123457 ) ) ( not ( = ?auto_123456 ?auto_123458 ) ) ( not ( = ?auto_123456 ?auto_123459 ) ) ( not ( = ?auto_123456 ?auto_123460 ) ) ( not ( = ?auto_123457 ?auto_123458 ) ) ( not ( = ?auto_123457 ?auto_123459 ) ) ( not ( = ?auto_123457 ?auto_123460 ) ) ( not ( = ?auto_123458 ?auto_123459 ) ) ( not ( = ?auto_123458 ?auto_123460 ) ) ( not ( = ?auto_123459 ?auto_123460 ) ) ( ON ?auto_123458 ?auto_123459 ) ( ON ?auto_123457 ?auto_123458 ) ( ON ?auto_123456 ?auto_123457 ) ( ON ?auto_123455 ?auto_123456 ) ( ON ?auto_123454 ?auto_123455 ) ( ON ?auto_123453 ?auto_123454 ) ( CLEAR ?auto_123451 ) ( ON ?auto_123452 ?auto_123453 ) ( CLEAR ?auto_123452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123450 ?auto_123451 ?auto_123452 )
      ( MAKE-10PILE ?auto_123450 ?auto_123451 ?auto_123452 ?auto_123453 ?auto_123454 ?auto_123455 ?auto_123456 ?auto_123457 ?auto_123458 ?auto_123459 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123492 - BLOCK
      ?auto_123493 - BLOCK
      ?auto_123494 - BLOCK
      ?auto_123495 - BLOCK
      ?auto_123496 - BLOCK
      ?auto_123497 - BLOCK
      ?auto_123498 - BLOCK
      ?auto_123499 - BLOCK
      ?auto_123500 - BLOCK
      ?auto_123501 - BLOCK
    )
    :vars
    (
      ?auto_123502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123501 ?auto_123502 ) ( ON-TABLE ?auto_123492 ) ( not ( = ?auto_123492 ?auto_123493 ) ) ( not ( = ?auto_123492 ?auto_123494 ) ) ( not ( = ?auto_123492 ?auto_123495 ) ) ( not ( = ?auto_123492 ?auto_123496 ) ) ( not ( = ?auto_123492 ?auto_123497 ) ) ( not ( = ?auto_123492 ?auto_123498 ) ) ( not ( = ?auto_123492 ?auto_123499 ) ) ( not ( = ?auto_123492 ?auto_123500 ) ) ( not ( = ?auto_123492 ?auto_123501 ) ) ( not ( = ?auto_123492 ?auto_123502 ) ) ( not ( = ?auto_123493 ?auto_123494 ) ) ( not ( = ?auto_123493 ?auto_123495 ) ) ( not ( = ?auto_123493 ?auto_123496 ) ) ( not ( = ?auto_123493 ?auto_123497 ) ) ( not ( = ?auto_123493 ?auto_123498 ) ) ( not ( = ?auto_123493 ?auto_123499 ) ) ( not ( = ?auto_123493 ?auto_123500 ) ) ( not ( = ?auto_123493 ?auto_123501 ) ) ( not ( = ?auto_123493 ?auto_123502 ) ) ( not ( = ?auto_123494 ?auto_123495 ) ) ( not ( = ?auto_123494 ?auto_123496 ) ) ( not ( = ?auto_123494 ?auto_123497 ) ) ( not ( = ?auto_123494 ?auto_123498 ) ) ( not ( = ?auto_123494 ?auto_123499 ) ) ( not ( = ?auto_123494 ?auto_123500 ) ) ( not ( = ?auto_123494 ?auto_123501 ) ) ( not ( = ?auto_123494 ?auto_123502 ) ) ( not ( = ?auto_123495 ?auto_123496 ) ) ( not ( = ?auto_123495 ?auto_123497 ) ) ( not ( = ?auto_123495 ?auto_123498 ) ) ( not ( = ?auto_123495 ?auto_123499 ) ) ( not ( = ?auto_123495 ?auto_123500 ) ) ( not ( = ?auto_123495 ?auto_123501 ) ) ( not ( = ?auto_123495 ?auto_123502 ) ) ( not ( = ?auto_123496 ?auto_123497 ) ) ( not ( = ?auto_123496 ?auto_123498 ) ) ( not ( = ?auto_123496 ?auto_123499 ) ) ( not ( = ?auto_123496 ?auto_123500 ) ) ( not ( = ?auto_123496 ?auto_123501 ) ) ( not ( = ?auto_123496 ?auto_123502 ) ) ( not ( = ?auto_123497 ?auto_123498 ) ) ( not ( = ?auto_123497 ?auto_123499 ) ) ( not ( = ?auto_123497 ?auto_123500 ) ) ( not ( = ?auto_123497 ?auto_123501 ) ) ( not ( = ?auto_123497 ?auto_123502 ) ) ( not ( = ?auto_123498 ?auto_123499 ) ) ( not ( = ?auto_123498 ?auto_123500 ) ) ( not ( = ?auto_123498 ?auto_123501 ) ) ( not ( = ?auto_123498 ?auto_123502 ) ) ( not ( = ?auto_123499 ?auto_123500 ) ) ( not ( = ?auto_123499 ?auto_123501 ) ) ( not ( = ?auto_123499 ?auto_123502 ) ) ( not ( = ?auto_123500 ?auto_123501 ) ) ( not ( = ?auto_123500 ?auto_123502 ) ) ( not ( = ?auto_123501 ?auto_123502 ) ) ( ON ?auto_123500 ?auto_123501 ) ( ON ?auto_123499 ?auto_123500 ) ( ON ?auto_123498 ?auto_123499 ) ( ON ?auto_123497 ?auto_123498 ) ( ON ?auto_123496 ?auto_123497 ) ( ON ?auto_123495 ?auto_123496 ) ( ON ?auto_123494 ?auto_123495 ) ( CLEAR ?auto_123492 ) ( ON ?auto_123493 ?auto_123494 ) ( CLEAR ?auto_123493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123492 ?auto_123493 )
      ( MAKE-10PILE ?auto_123492 ?auto_123493 ?auto_123494 ?auto_123495 ?auto_123496 ?auto_123497 ?auto_123498 ?auto_123499 ?auto_123500 ?auto_123501 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_123534 - BLOCK
      ?auto_123535 - BLOCK
      ?auto_123536 - BLOCK
      ?auto_123537 - BLOCK
      ?auto_123538 - BLOCK
      ?auto_123539 - BLOCK
      ?auto_123540 - BLOCK
      ?auto_123541 - BLOCK
      ?auto_123542 - BLOCK
      ?auto_123543 - BLOCK
    )
    :vars
    (
      ?auto_123544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123543 ?auto_123544 ) ( not ( = ?auto_123534 ?auto_123535 ) ) ( not ( = ?auto_123534 ?auto_123536 ) ) ( not ( = ?auto_123534 ?auto_123537 ) ) ( not ( = ?auto_123534 ?auto_123538 ) ) ( not ( = ?auto_123534 ?auto_123539 ) ) ( not ( = ?auto_123534 ?auto_123540 ) ) ( not ( = ?auto_123534 ?auto_123541 ) ) ( not ( = ?auto_123534 ?auto_123542 ) ) ( not ( = ?auto_123534 ?auto_123543 ) ) ( not ( = ?auto_123534 ?auto_123544 ) ) ( not ( = ?auto_123535 ?auto_123536 ) ) ( not ( = ?auto_123535 ?auto_123537 ) ) ( not ( = ?auto_123535 ?auto_123538 ) ) ( not ( = ?auto_123535 ?auto_123539 ) ) ( not ( = ?auto_123535 ?auto_123540 ) ) ( not ( = ?auto_123535 ?auto_123541 ) ) ( not ( = ?auto_123535 ?auto_123542 ) ) ( not ( = ?auto_123535 ?auto_123543 ) ) ( not ( = ?auto_123535 ?auto_123544 ) ) ( not ( = ?auto_123536 ?auto_123537 ) ) ( not ( = ?auto_123536 ?auto_123538 ) ) ( not ( = ?auto_123536 ?auto_123539 ) ) ( not ( = ?auto_123536 ?auto_123540 ) ) ( not ( = ?auto_123536 ?auto_123541 ) ) ( not ( = ?auto_123536 ?auto_123542 ) ) ( not ( = ?auto_123536 ?auto_123543 ) ) ( not ( = ?auto_123536 ?auto_123544 ) ) ( not ( = ?auto_123537 ?auto_123538 ) ) ( not ( = ?auto_123537 ?auto_123539 ) ) ( not ( = ?auto_123537 ?auto_123540 ) ) ( not ( = ?auto_123537 ?auto_123541 ) ) ( not ( = ?auto_123537 ?auto_123542 ) ) ( not ( = ?auto_123537 ?auto_123543 ) ) ( not ( = ?auto_123537 ?auto_123544 ) ) ( not ( = ?auto_123538 ?auto_123539 ) ) ( not ( = ?auto_123538 ?auto_123540 ) ) ( not ( = ?auto_123538 ?auto_123541 ) ) ( not ( = ?auto_123538 ?auto_123542 ) ) ( not ( = ?auto_123538 ?auto_123543 ) ) ( not ( = ?auto_123538 ?auto_123544 ) ) ( not ( = ?auto_123539 ?auto_123540 ) ) ( not ( = ?auto_123539 ?auto_123541 ) ) ( not ( = ?auto_123539 ?auto_123542 ) ) ( not ( = ?auto_123539 ?auto_123543 ) ) ( not ( = ?auto_123539 ?auto_123544 ) ) ( not ( = ?auto_123540 ?auto_123541 ) ) ( not ( = ?auto_123540 ?auto_123542 ) ) ( not ( = ?auto_123540 ?auto_123543 ) ) ( not ( = ?auto_123540 ?auto_123544 ) ) ( not ( = ?auto_123541 ?auto_123542 ) ) ( not ( = ?auto_123541 ?auto_123543 ) ) ( not ( = ?auto_123541 ?auto_123544 ) ) ( not ( = ?auto_123542 ?auto_123543 ) ) ( not ( = ?auto_123542 ?auto_123544 ) ) ( not ( = ?auto_123543 ?auto_123544 ) ) ( ON ?auto_123542 ?auto_123543 ) ( ON ?auto_123541 ?auto_123542 ) ( ON ?auto_123540 ?auto_123541 ) ( ON ?auto_123539 ?auto_123540 ) ( ON ?auto_123538 ?auto_123539 ) ( ON ?auto_123537 ?auto_123538 ) ( ON ?auto_123536 ?auto_123537 ) ( ON ?auto_123535 ?auto_123536 ) ( ON ?auto_123534 ?auto_123535 ) ( CLEAR ?auto_123534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123534 )
      ( MAKE-10PILE ?auto_123534 ?auto_123535 ?auto_123536 ?auto_123537 ?auto_123538 ?auto_123539 ?auto_123540 ?auto_123541 ?auto_123542 ?auto_123543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123577 - BLOCK
      ?auto_123578 - BLOCK
      ?auto_123579 - BLOCK
      ?auto_123580 - BLOCK
      ?auto_123581 - BLOCK
      ?auto_123582 - BLOCK
      ?auto_123583 - BLOCK
      ?auto_123584 - BLOCK
      ?auto_123585 - BLOCK
      ?auto_123586 - BLOCK
      ?auto_123587 - BLOCK
    )
    :vars
    (
      ?auto_123588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123586 ) ( ON ?auto_123587 ?auto_123588 ) ( CLEAR ?auto_123587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123577 ) ( ON ?auto_123578 ?auto_123577 ) ( ON ?auto_123579 ?auto_123578 ) ( ON ?auto_123580 ?auto_123579 ) ( ON ?auto_123581 ?auto_123580 ) ( ON ?auto_123582 ?auto_123581 ) ( ON ?auto_123583 ?auto_123582 ) ( ON ?auto_123584 ?auto_123583 ) ( ON ?auto_123585 ?auto_123584 ) ( ON ?auto_123586 ?auto_123585 ) ( not ( = ?auto_123577 ?auto_123578 ) ) ( not ( = ?auto_123577 ?auto_123579 ) ) ( not ( = ?auto_123577 ?auto_123580 ) ) ( not ( = ?auto_123577 ?auto_123581 ) ) ( not ( = ?auto_123577 ?auto_123582 ) ) ( not ( = ?auto_123577 ?auto_123583 ) ) ( not ( = ?auto_123577 ?auto_123584 ) ) ( not ( = ?auto_123577 ?auto_123585 ) ) ( not ( = ?auto_123577 ?auto_123586 ) ) ( not ( = ?auto_123577 ?auto_123587 ) ) ( not ( = ?auto_123577 ?auto_123588 ) ) ( not ( = ?auto_123578 ?auto_123579 ) ) ( not ( = ?auto_123578 ?auto_123580 ) ) ( not ( = ?auto_123578 ?auto_123581 ) ) ( not ( = ?auto_123578 ?auto_123582 ) ) ( not ( = ?auto_123578 ?auto_123583 ) ) ( not ( = ?auto_123578 ?auto_123584 ) ) ( not ( = ?auto_123578 ?auto_123585 ) ) ( not ( = ?auto_123578 ?auto_123586 ) ) ( not ( = ?auto_123578 ?auto_123587 ) ) ( not ( = ?auto_123578 ?auto_123588 ) ) ( not ( = ?auto_123579 ?auto_123580 ) ) ( not ( = ?auto_123579 ?auto_123581 ) ) ( not ( = ?auto_123579 ?auto_123582 ) ) ( not ( = ?auto_123579 ?auto_123583 ) ) ( not ( = ?auto_123579 ?auto_123584 ) ) ( not ( = ?auto_123579 ?auto_123585 ) ) ( not ( = ?auto_123579 ?auto_123586 ) ) ( not ( = ?auto_123579 ?auto_123587 ) ) ( not ( = ?auto_123579 ?auto_123588 ) ) ( not ( = ?auto_123580 ?auto_123581 ) ) ( not ( = ?auto_123580 ?auto_123582 ) ) ( not ( = ?auto_123580 ?auto_123583 ) ) ( not ( = ?auto_123580 ?auto_123584 ) ) ( not ( = ?auto_123580 ?auto_123585 ) ) ( not ( = ?auto_123580 ?auto_123586 ) ) ( not ( = ?auto_123580 ?auto_123587 ) ) ( not ( = ?auto_123580 ?auto_123588 ) ) ( not ( = ?auto_123581 ?auto_123582 ) ) ( not ( = ?auto_123581 ?auto_123583 ) ) ( not ( = ?auto_123581 ?auto_123584 ) ) ( not ( = ?auto_123581 ?auto_123585 ) ) ( not ( = ?auto_123581 ?auto_123586 ) ) ( not ( = ?auto_123581 ?auto_123587 ) ) ( not ( = ?auto_123581 ?auto_123588 ) ) ( not ( = ?auto_123582 ?auto_123583 ) ) ( not ( = ?auto_123582 ?auto_123584 ) ) ( not ( = ?auto_123582 ?auto_123585 ) ) ( not ( = ?auto_123582 ?auto_123586 ) ) ( not ( = ?auto_123582 ?auto_123587 ) ) ( not ( = ?auto_123582 ?auto_123588 ) ) ( not ( = ?auto_123583 ?auto_123584 ) ) ( not ( = ?auto_123583 ?auto_123585 ) ) ( not ( = ?auto_123583 ?auto_123586 ) ) ( not ( = ?auto_123583 ?auto_123587 ) ) ( not ( = ?auto_123583 ?auto_123588 ) ) ( not ( = ?auto_123584 ?auto_123585 ) ) ( not ( = ?auto_123584 ?auto_123586 ) ) ( not ( = ?auto_123584 ?auto_123587 ) ) ( not ( = ?auto_123584 ?auto_123588 ) ) ( not ( = ?auto_123585 ?auto_123586 ) ) ( not ( = ?auto_123585 ?auto_123587 ) ) ( not ( = ?auto_123585 ?auto_123588 ) ) ( not ( = ?auto_123586 ?auto_123587 ) ) ( not ( = ?auto_123586 ?auto_123588 ) ) ( not ( = ?auto_123587 ?auto_123588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123587 ?auto_123588 )
      ( !STACK ?auto_123587 ?auto_123586 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123600 - BLOCK
      ?auto_123601 - BLOCK
      ?auto_123602 - BLOCK
      ?auto_123603 - BLOCK
      ?auto_123604 - BLOCK
      ?auto_123605 - BLOCK
      ?auto_123606 - BLOCK
      ?auto_123607 - BLOCK
      ?auto_123608 - BLOCK
      ?auto_123609 - BLOCK
      ?auto_123610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123609 ) ( ON-TABLE ?auto_123610 ) ( CLEAR ?auto_123610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123600 ) ( ON ?auto_123601 ?auto_123600 ) ( ON ?auto_123602 ?auto_123601 ) ( ON ?auto_123603 ?auto_123602 ) ( ON ?auto_123604 ?auto_123603 ) ( ON ?auto_123605 ?auto_123604 ) ( ON ?auto_123606 ?auto_123605 ) ( ON ?auto_123607 ?auto_123606 ) ( ON ?auto_123608 ?auto_123607 ) ( ON ?auto_123609 ?auto_123608 ) ( not ( = ?auto_123600 ?auto_123601 ) ) ( not ( = ?auto_123600 ?auto_123602 ) ) ( not ( = ?auto_123600 ?auto_123603 ) ) ( not ( = ?auto_123600 ?auto_123604 ) ) ( not ( = ?auto_123600 ?auto_123605 ) ) ( not ( = ?auto_123600 ?auto_123606 ) ) ( not ( = ?auto_123600 ?auto_123607 ) ) ( not ( = ?auto_123600 ?auto_123608 ) ) ( not ( = ?auto_123600 ?auto_123609 ) ) ( not ( = ?auto_123600 ?auto_123610 ) ) ( not ( = ?auto_123601 ?auto_123602 ) ) ( not ( = ?auto_123601 ?auto_123603 ) ) ( not ( = ?auto_123601 ?auto_123604 ) ) ( not ( = ?auto_123601 ?auto_123605 ) ) ( not ( = ?auto_123601 ?auto_123606 ) ) ( not ( = ?auto_123601 ?auto_123607 ) ) ( not ( = ?auto_123601 ?auto_123608 ) ) ( not ( = ?auto_123601 ?auto_123609 ) ) ( not ( = ?auto_123601 ?auto_123610 ) ) ( not ( = ?auto_123602 ?auto_123603 ) ) ( not ( = ?auto_123602 ?auto_123604 ) ) ( not ( = ?auto_123602 ?auto_123605 ) ) ( not ( = ?auto_123602 ?auto_123606 ) ) ( not ( = ?auto_123602 ?auto_123607 ) ) ( not ( = ?auto_123602 ?auto_123608 ) ) ( not ( = ?auto_123602 ?auto_123609 ) ) ( not ( = ?auto_123602 ?auto_123610 ) ) ( not ( = ?auto_123603 ?auto_123604 ) ) ( not ( = ?auto_123603 ?auto_123605 ) ) ( not ( = ?auto_123603 ?auto_123606 ) ) ( not ( = ?auto_123603 ?auto_123607 ) ) ( not ( = ?auto_123603 ?auto_123608 ) ) ( not ( = ?auto_123603 ?auto_123609 ) ) ( not ( = ?auto_123603 ?auto_123610 ) ) ( not ( = ?auto_123604 ?auto_123605 ) ) ( not ( = ?auto_123604 ?auto_123606 ) ) ( not ( = ?auto_123604 ?auto_123607 ) ) ( not ( = ?auto_123604 ?auto_123608 ) ) ( not ( = ?auto_123604 ?auto_123609 ) ) ( not ( = ?auto_123604 ?auto_123610 ) ) ( not ( = ?auto_123605 ?auto_123606 ) ) ( not ( = ?auto_123605 ?auto_123607 ) ) ( not ( = ?auto_123605 ?auto_123608 ) ) ( not ( = ?auto_123605 ?auto_123609 ) ) ( not ( = ?auto_123605 ?auto_123610 ) ) ( not ( = ?auto_123606 ?auto_123607 ) ) ( not ( = ?auto_123606 ?auto_123608 ) ) ( not ( = ?auto_123606 ?auto_123609 ) ) ( not ( = ?auto_123606 ?auto_123610 ) ) ( not ( = ?auto_123607 ?auto_123608 ) ) ( not ( = ?auto_123607 ?auto_123609 ) ) ( not ( = ?auto_123607 ?auto_123610 ) ) ( not ( = ?auto_123608 ?auto_123609 ) ) ( not ( = ?auto_123608 ?auto_123610 ) ) ( not ( = ?auto_123609 ?auto_123610 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_123610 )
      ( !STACK ?auto_123610 ?auto_123609 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123622 - BLOCK
      ?auto_123623 - BLOCK
      ?auto_123624 - BLOCK
      ?auto_123625 - BLOCK
      ?auto_123626 - BLOCK
      ?auto_123627 - BLOCK
      ?auto_123628 - BLOCK
      ?auto_123629 - BLOCK
      ?auto_123630 - BLOCK
      ?auto_123631 - BLOCK
      ?auto_123632 - BLOCK
    )
    :vars
    (
      ?auto_123633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123632 ?auto_123633 ) ( ON-TABLE ?auto_123622 ) ( ON ?auto_123623 ?auto_123622 ) ( ON ?auto_123624 ?auto_123623 ) ( ON ?auto_123625 ?auto_123624 ) ( ON ?auto_123626 ?auto_123625 ) ( ON ?auto_123627 ?auto_123626 ) ( ON ?auto_123628 ?auto_123627 ) ( ON ?auto_123629 ?auto_123628 ) ( ON ?auto_123630 ?auto_123629 ) ( not ( = ?auto_123622 ?auto_123623 ) ) ( not ( = ?auto_123622 ?auto_123624 ) ) ( not ( = ?auto_123622 ?auto_123625 ) ) ( not ( = ?auto_123622 ?auto_123626 ) ) ( not ( = ?auto_123622 ?auto_123627 ) ) ( not ( = ?auto_123622 ?auto_123628 ) ) ( not ( = ?auto_123622 ?auto_123629 ) ) ( not ( = ?auto_123622 ?auto_123630 ) ) ( not ( = ?auto_123622 ?auto_123631 ) ) ( not ( = ?auto_123622 ?auto_123632 ) ) ( not ( = ?auto_123622 ?auto_123633 ) ) ( not ( = ?auto_123623 ?auto_123624 ) ) ( not ( = ?auto_123623 ?auto_123625 ) ) ( not ( = ?auto_123623 ?auto_123626 ) ) ( not ( = ?auto_123623 ?auto_123627 ) ) ( not ( = ?auto_123623 ?auto_123628 ) ) ( not ( = ?auto_123623 ?auto_123629 ) ) ( not ( = ?auto_123623 ?auto_123630 ) ) ( not ( = ?auto_123623 ?auto_123631 ) ) ( not ( = ?auto_123623 ?auto_123632 ) ) ( not ( = ?auto_123623 ?auto_123633 ) ) ( not ( = ?auto_123624 ?auto_123625 ) ) ( not ( = ?auto_123624 ?auto_123626 ) ) ( not ( = ?auto_123624 ?auto_123627 ) ) ( not ( = ?auto_123624 ?auto_123628 ) ) ( not ( = ?auto_123624 ?auto_123629 ) ) ( not ( = ?auto_123624 ?auto_123630 ) ) ( not ( = ?auto_123624 ?auto_123631 ) ) ( not ( = ?auto_123624 ?auto_123632 ) ) ( not ( = ?auto_123624 ?auto_123633 ) ) ( not ( = ?auto_123625 ?auto_123626 ) ) ( not ( = ?auto_123625 ?auto_123627 ) ) ( not ( = ?auto_123625 ?auto_123628 ) ) ( not ( = ?auto_123625 ?auto_123629 ) ) ( not ( = ?auto_123625 ?auto_123630 ) ) ( not ( = ?auto_123625 ?auto_123631 ) ) ( not ( = ?auto_123625 ?auto_123632 ) ) ( not ( = ?auto_123625 ?auto_123633 ) ) ( not ( = ?auto_123626 ?auto_123627 ) ) ( not ( = ?auto_123626 ?auto_123628 ) ) ( not ( = ?auto_123626 ?auto_123629 ) ) ( not ( = ?auto_123626 ?auto_123630 ) ) ( not ( = ?auto_123626 ?auto_123631 ) ) ( not ( = ?auto_123626 ?auto_123632 ) ) ( not ( = ?auto_123626 ?auto_123633 ) ) ( not ( = ?auto_123627 ?auto_123628 ) ) ( not ( = ?auto_123627 ?auto_123629 ) ) ( not ( = ?auto_123627 ?auto_123630 ) ) ( not ( = ?auto_123627 ?auto_123631 ) ) ( not ( = ?auto_123627 ?auto_123632 ) ) ( not ( = ?auto_123627 ?auto_123633 ) ) ( not ( = ?auto_123628 ?auto_123629 ) ) ( not ( = ?auto_123628 ?auto_123630 ) ) ( not ( = ?auto_123628 ?auto_123631 ) ) ( not ( = ?auto_123628 ?auto_123632 ) ) ( not ( = ?auto_123628 ?auto_123633 ) ) ( not ( = ?auto_123629 ?auto_123630 ) ) ( not ( = ?auto_123629 ?auto_123631 ) ) ( not ( = ?auto_123629 ?auto_123632 ) ) ( not ( = ?auto_123629 ?auto_123633 ) ) ( not ( = ?auto_123630 ?auto_123631 ) ) ( not ( = ?auto_123630 ?auto_123632 ) ) ( not ( = ?auto_123630 ?auto_123633 ) ) ( not ( = ?auto_123631 ?auto_123632 ) ) ( not ( = ?auto_123631 ?auto_123633 ) ) ( not ( = ?auto_123632 ?auto_123633 ) ) ( CLEAR ?auto_123630 ) ( ON ?auto_123631 ?auto_123632 ) ( CLEAR ?auto_123631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_123622 ?auto_123623 ?auto_123624 ?auto_123625 ?auto_123626 ?auto_123627 ?auto_123628 ?auto_123629 ?auto_123630 ?auto_123631 )
      ( MAKE-11PILE ?auto_123622 ?auto_123623 ?auto_123624 ?auto_123625 ?auto_123626 ?auto_123627 ?auto_123628 ?auto_123629 ?auto_123630 ?auto_123631 ?auto_123632 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123645 - BLOCK
      ?auto_123646 - BLOCK
      ?auto_123647 - BLOCK
      ?auto_123648 - BLOCK
      ?auto_123649 - BLOCK
      ?auto_123650 - BLOCK
      ?auto_123651 - BLOCK
      ?auto_123652 - BLOCK
      ?auto_123653 - BLOCK
      ?auto_123654 - BLOCK
      ?auto_123655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123655 ) ( ON-TABLE ?auto_123645 ) ( ON ?auto_123646 ?auto_123645 ) ( ON ?auto_123647 ?auto_123646 ) ( ON ?auto_123648 ?auto_123647 ) ( ON ?auto_123649 ?auto_123648 ) ( ON ?auto_123650 ?auto_123649 ) ( ON ?auto_123651 ?auto_123650 ) ( ON ?auto_123652 ?auto_123651 ) ( ON ?auto_123653 ?auto_123652 ) ( not ( = ?auto_123645 ?auto_123646 ) ) ( not ( = ?auto_123645 ?auto_123647 ) ) ( not ( = ?auto_123645 ?auto_123648 ) ) ( not ( = ?auto_123645 ?auto_123649 ) ) ( not ( = ?auto_123645 ?auto_123650 ) ) ( not ( = ?auto_123645 ?auto_123651 ) ) ( not ( = ?auto_123645 ?auto_123652 ) ) ( not ( = ?auto_123645 ?auto_123653 ) ) ( not ( = ?auto_123645 ?auto_123654 ) ) ( not ( = ?auto_123645 ?auto_123655 ) ) ( not ( = ?auto_123646 ?auto_123647 ) ) ( not ( = ?auto_123646 ?auto_123648 ) ) ( not ( = ?auto_123646 ?auto_123649 ) ) ( not ( = ?auto_123646 ?auto_123650 ) ) ( not ( = ?auto_123646 ?auto_123651 ) ) ( not ( = ?auto_123646 ?auto_123652 ) ) ( not ( = ?auto_123646 ?auto_123653 ) ) ( not ( = ?auto_123646 ?auto_123654 ) ) ( not ( = ?auto_123646 ?auto_123655 ) ) ( not ( = ?auto_123647 ?auto_123648 ) ) ( not ( = ?auto_123647 ?auto_123649 ) ) ( not ( = ?auto_123647 ?auto_123650 ) ) ( not ( = ?auto_123647 ?auto_123651 ) ) ( not ( = ?auto_123647 ?auto_123652 ) ) ( not ( = ?auto_123647 ?auto_123653 ) ) ( not ( = ?auto_123647 ?auto_123654 ) ) ( not ( = ?auto_123647 ?auto_123655 ) ) ( not ( = ?auto_123648 ?auto_123649 ) ) ( not ( = ?auto_123648 ?auto_123650 ) ) ( not ( = ?auto_123648 ?auto_123651 ) ) ( not ( = ?auto_123648 ?auto_123652 ) ) ( not ( = ?auto_123648 ?auto_123653 ) ) ( not ( = ?auto_123648 ?auto_123654 ) ) ( not ( = ?auto_123648 ?auto_123655 ) ) ( not ( = ?auto_123649 ?auto_123650 ) ) ( not ( = ?auto_123649 ?auto_123651 ) ) ( not ( = ?auto_123649 ?auto_123652 ) ) ( not ( = ?auto_123649 ?auto_123653 ) ) ( not ( = ?auto_123649 ?auto_123654 ) ) ( not ( = ?auto_123649 ?auto_123655 ) ) ( not ( = ?auto_123650 ?auto_123651 ) ) ( not ( = ?auto_123650 ?auto_123652 ) ) ( not ( = ?auto_123650 ?auto_123653 ) ) ( not ( = ?auto_123650 ?auto_123654 ) ) ( not ( = ?auto_123650 ?auto_123655 ) ) ( not ( = ?auto_123651 ?auto_123652 ) ) ( not ( = ?auto_123651 ?auto_123653 ) ) ( not ( = ?auto_123651 ?auto_123654 ) ) ( not ( = ?auto_123651 ?auto_123655 ) ) ( not ( = ?auto_123652 ?auto_123653 ) ) ( not ( = ?auto_123652 ?auto_123654 ) ) ( not ( = ?auto_123652 ?auto_123655 ) ) ( not ( = ?auto_123653 ?auto_123654 ) ) ( not ( = ?auto_123653 ?auto_123655 ) ) ( not ( = ?auto_123654 ?auto_123655 ) ) ( CLEAR ?auto_123653 ) ( ON ?auto_123654 ?auto_123655 ) ( CLEAR ?auto_123654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_123645 ?auto_123646 ?auto_123647 ?auto_123648 ?auto_123649 ?auto_123650 ?auto_123651 ?auto_123652 ?auto_123653 ?auto_123654 )
      ( MAKE-11PILE ?auto_123645 ?auto_123646 ?auto_123647 ?auto_123648 ?auto_123649 ?auto_123650 ?auto_123651 ?auto_123652 ?auto_123653 ?auto_123654 ?auto_123655 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123667 - BLOCK
      ?auto_123668 - BLOCK
      ?auto_123669 - BLOCK
      ?auto_123670 - BLOCK
      ?auto_123671 - BLOCK
      ?auto_123672 - BLOCK
      ?auto_123673 - BLOCK
      ?auto_123674 - BLOCK
      ?auto_123675 - BLOCK
      ?auto_123676 - BLOCK
      ?auto_123677 - BLOCK
    )
    :vars
    (
      ?auto_123678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123677 ?auto_123678 ) ( ON-TABLE ?auto_123667 ) ( ON ?auto_123668 ?auto_123667 ) ( ON ?auto_123669 ?auto_123668 ) ( ON ?auto_123670 ?auto_123669 ) ( ON ?auto_123671 ?auto_123670 ) ( ON ?auto_123672 ?auto_123671 ) ( ON ?auto_123673 ?auto_123672 ) ( ON ?auto_123674 ?auto_123673 ) ( not ( = ?auto_123667 ?auto_123668 ) ) ( not ( = ?auto_123667 ?auto_123669 ) ) ( not ( = ?auto_123667 ?auto_123670 ) ) ( not ( = ?auto_123667 ?auto_123671 ) ) ( not ( = ?auto_123667 ?auto_123672 ) ) ( not ( = ?auto_123667 ?auto_123673 ) ) ( not ( = ?auto_123667 ?auto_123674 ) ) ( not ( = ?auto_123667 ?auto_123675 ) ) ( not ( = ?auto_123667 ?auto_123676 ) ) ( not ( = ?auto_123667 ?auto_123677 ) ) ( not ( = ?auto_123667 ?auto_123678 ) ) ( not ( = ?auto_123668 ?auto_123669 ) ) ( not ( = ?auto_123668 ?auto_123670 ) ) ( not ( = ?auto_123668 ?auto_123671 ) ) ( not ( = ?auto_123668 ?auto_123672 ) ) ( not ( = ?auto_123668 ?auto_123673 ) ) ( not ( = ?auto_123668 ?auto_123674 ) ) ( not ( = ?auto_123668 ?auto_123675 ) ) ( not ( = ?auto_123668 ?auto_123676 ) ) ( not ( = ?auto_123668 ?auto_123677 ) ) ( not ( = ?auto_123668 ?auto_123678 ) ) ( not ( = ?auto_123669 ?auto_123670 ) ) ( not ( = ?auto_123669 ?auto_123671 ) ) ( not ( = ?auto_123669 ?auto_123672 ) ) ( not ( = ?auto_123669 ?auto_123673 ) ) ( not ( = ?auto_123669 ?auto_123674 ) ) ( not ( = ?auto_123669 ?auto_123675 ) ) ( not ( = ?auto_123669 ?auto_123676 ) ) ( not ( = ?auto_123669 ?auto_123677 ) ) ( not ( = ?auto_123669 ?auto_123678 ) ) ( not ( = ?auto_123670 ?auto_123671 ) ) ( not ( = ?auto_123670 ?auto_123672 ) ) ( not ( = ?auto_123670 ?auto_123673 ) ) ( not ( = ?auto_123670 ?auto_123674 ) ) ( not ( = ?auto_123670 ?auto_123675 ) ) ( not ( = ?auto_123670 ?auto_123676 ) ) ( not ( = ?auto_123670 ?auto_123677 ) ) ( not ( = ?auto_123670 ?auto_123678 ) ) ( not ( = ?auto_123671 ?auto_123672 ) ) ( not ( = ?auto_123671 ?auto_123673 ) ) ( not ( = ?auto_123671 ?auto_123674 ) ) ( not ( = ?auto_123671 ?auto_123675 ) ) ( not ( = ?auto_123671 ?auto_123676 ) ) ( not ( = ?auto_123671 ?auto_123677 ) ) ( not ( = ?auto_123671 ?auto_123678 ) ) ( not ( = ?auto_123672 ?auto_123673 ) ) ( not ( = ?auto_123672 ?auto_123674 ) ) ( not ( = ?auto_123672 ?auto_123675 ) ) ( not ( = ?auto_123672 ?auto_123676 ) ) ( not ( = ?auto_123672 ?auto_123677 ) ) ( not ( = ?auto_123672 ?auto_123678 ) ) ( not ( = ?auto_123673 ?auto_123674 ) ) ( not ( = ?auto_123673 ?auto_123675 ) ) ( not ( = ?auto_123673 ?auto_123676 ) ) ( not ( = ?auto_123673 ?auto_123677 ) ) ( not ( = ?auto_123673 ?auto_123678 ) ) ( not ( = ?auto_123674 ?auto_123675 ) ) ( not ( = ?auto_123674 ?auto_123676 ) ) ( not ( = ?auto_123674 ?auto_123677 ) ) ( not ( = ?auto_123674 ?auto_123678 ) ) ( not ( = ?auto_123675 ?auto_123676 ) ) ( not ( = ?auto_123675 ?auto_123677 ) ) ( not ( = ?auto_123675 ?auto_123678 ) ) ( not ( = ?auto_123676 ?auto_123677 ) ) ( not ( = ?auto_123676 ?auto_123678 ) ) ( not ( = ?auto_123677 ?auto_123678 ) ) ( ON ?auto_123676 ?auto_123677 ) ( CLEAR ?auto_123674 ) ( ON ?auto_123675 ?auto_123676 ) ( CLEAR ?auto_123675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_123667 ?auto_123668 ?auto_123669 ?auto_123670 ?auto_123671 ?auto_123672 ?auto_123673 ?auto_123674 ?auto_123675 )
      ( MAKE-11PILE ?auto_123667 ?auto_123668 ?auto_123669 ?auto_123670 ?auto_123671 ?auto_123672 ?auto_123673 ?auto_123674 ?auto_123675 ?auto_123676 ?auto_123677 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123690 - BLOCK
      ?auto_123691 - BLOCK
      ?auto_123692 - BLOCK
      ?auto_123693 - BLOCK
      ?auto_123694 - BLOCK
      ?auto_123695 - BLOCK
      ?auto_123696 - BLOCK
      ?auto_123697 - BLOCK
      ?auto_123698 - BLOCK
      ?auto_123699 - BLOCK
      ?auto_123700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123700 ) ( ON-TABLE ?auto_123690 ) ( ON ?auto_123691 ?auto_123690 ) ( ON ?auto_123692 ?auto_123691 ) ( ON ?auto_123693 ?auto_123692 ) ( ON ?auto_123694 ?auto_123693 ) ( ON ?auto_123695 ?auto_123694 ) ( ON ?auto_123696 ?auto_123695 ) ( ON ?auto_123697 ?auto_123696 ) ( not ( = ?auto_123690 ?auto_123691 ) ) ( not ( = ?auto_123690 ?auto_123692 ) ) ( not ( = ?auto_123690 ?auto_123693 ) ) ( not ( = ?auto_123690 ?auto_123694 ) ) ( not ( = ?auto_123690 ?auto_123695 ) ) ( not ( = ?auto_123690 ?auto_123696 ) ) ( not ( = ?auto_123690 ?auto_123697 ) ) ( not ( = ?auto_123690 ?auto_123698 ) ) ( not ( = ?auto_123690 ?auto_123699 ) ) ( not ( = ?auto_123690 ?auto_123700 ) ) ( not ( = ?auto_123691 ?auto_123692 ) ) ( not ( = ?auto_123691 ?auto_123693 ) ) ( not ( = ?auto_123691 ?auto_123694 ) ) ( not ( = ?auto_123691 ?auto_123695 ) ) ( not ( = ?auto_123691 ?auto_123696 ) ) ( not ( = ?auto_123691 ?auto_123697 ) ) ( not ( = ?auto_123691 ?auto_123698 ) ) ( not ( = ?auto_123691 ?auto_123699 ) ) ( not ( = ?auto_123691 ?auto_123700 ) ) ( not ( = ?auto_123692 ?auto_123693 ) ) ( not ( = ?auto_123692 ?auto_123694 ) ) ( not ( = ?auto_123692 ?auto_123695 ) ) ( not ( = ?auto_123692 ?auto_123696 ) ) ( not ( = ?auto_123692 ?auto_123697 ) ) ( not ( = ?auto_123692 ?auto_123698 ) ) ( not ( = ?auto_123692 ?auto_123699 ) ) ( not ( = ?auto_123692 ?auto_123700 ) ) ( not ( = ?auto_123693 ?auto_123694 ) ) ( not ( = ?auto_123693 ?auto_123695 ) ) ( not ( = ?auto_123693 ?auto_123696 ) ) ( not ( = ?auto_123693 ?auto_123697 ) ) ( not ( = ?auto_123693 ?auto_123698 ) ) ( not ( = ?auto_123693 ?auto_123699 ) ) ( not ( = ?auto_123693 ?auto_123700 ) ) ( not ( = ?auto_123694 ?auto_123695 ) ) ( not ( = ?auto_123694 ?auto_123696 ) ) ( not ( = ?auto_123694 ?auto_123697 ) ) ( not ( = ?auto_123694 ?auto_123698 ) ) ( not ( = ?auto_123694 ?auto_123699 ) ) ( not ( = ?auto_123694 ?auto_123700 ) ) ( not ( = ?auto_123695 ?auto_123696 ) ) ( not ( = ?auto_123695 ?auto_123697 ) ) ( not ( = ?auto_123695 ?auto_123698 ) ) ( not ( = ?auto_123695 ?auto_123699 ) ) ( not ( = ?auto_123695 ?auto_123700 ) ) ( not ( = ?auto_123696 ?auto_123697 ) ) ( not ( = ?auto_123696 ?auto_123698 ) ) ( not ( = ?auto_123696 ?auto_123699 ) ) ( not ( = ?auto_123696 ?auto_123700 ) ) ( not ( = ?auto_123697 ?auto_123698 ) ) ( not ( = ?auto_123697 ?auto_123699 ) ) ( not ( = ?auto_123697 ?auto_123700 ) ) ( not ( = ?auto_123698 ?auto_123699 ) ) ( not ( = ?auto_123698 ?auto_123700 ) ) ( not ( = ?auto_123699 ?auto_123700 ) ) ( ON ?auto_123699 ?auto_123700 ) ( CLEAR ?auto_123697 ) ( ON ?auto_123698 ?auto_123699 ) ( CLEAR ?auto_123698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_123690 ?auto_123691 ?auto_123692 ?auto_123693 ?auto_123694 ?auto_123695 ?auto_123696 ?auto_123697 ?auto_123698 )
      ( MAKE-11PILE ?auto_123690 ?auto_123691 ?auto_123692 ?auto_123693 ?auto_123694 ?auto_123695 ?auto_123696 ?auto_123697 ?auto_123698 ?auto_123699 ?auto_123700 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123712 - BLOCK
      ?auto_123713 - BLOCK
      ?auto_123714 - BLOCK
      ?auto_123715 - BLOCK
      ?auto_123716 - BLOCK
      ?auto_123717 - BLOCK
      ?auto_123718 - BLOCK
      ?auto_123719 - BLOCK
      ?auto_123720 - BLOCK
      ?auto_123721 - BLOCK
      ?auto_123722 - BLOCK
    )
    :vars
    (
      ?auto_123723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123722 ?auto_123723 ) ( ON-TABLE ?auto_123712 ) ( ON ?auto_123713 ?auto_123712 ) ( ON ?auto_123714 ?auto_123713 ) ( ON ?auto_123715 ?auto_123714 ) ( ON ?auto_123716 ?auto_123715 ) ( ON ?auto_123717 ?auto_123716 ) ( ON ?auto_123718 ?auto_123717 ) ( not ( = ?auto_123712 ?auto_123713 ) ) ( not ( = ?auto_123712 ?auto_123714 ) ) ( not ( = ?auto_123712 ?auto_123715 ) ) ( not ( = ?auto_123712 ?auto_123716 ) ) ( not ( = ?auto_123712 ?auto_123717 ) ) ( not ( = ?auto_123712 ?auto_123718 ) ) ( not ( = ?auto_123712 ?auto_123719 ) ) ( not ( = ?auto_123712 ?auto_123720 ) ) ( not ( = ?auto_123712 ?auto_123721 ) ) ( not ( = ?auto_123712 ?auto_123722 ) ) ( not ( = ?auto_123712 ?auto_123723 ) ) ( not ( = ?auto_123713 ?auto_123714 ) ) ( not ( = ?auto_123713 ?auto_123715 ) ) ( not ( = ?auto_123713 ?auto_123716 ) ) ( not ( = ?auto_123713 ?auto_123717 ) ) ( not ( = ?auto_123713 ?auto_123718 ) ) ( not ( = ?auto_123713 ?auto_123719 ) ) ( not ( = ?auto_123713 ?auto_123720 ) ) ( not ( = ?auto_123713 ?auto_123721 ) ) ( not ( = ?auto_123713 ?auto_123722 ) ) ( not ( = ?auto_123713 ?auto_123723 ) ) ( not ( = ?auto_123714 ?auto_123715 ) ) ( not ( = ?auto_123714 ?auto_123716 ) ) ( not ( = ?auto_123714 ?auto_123717 ) ) ( not ( = ?auto_123714 ?auto_123718 ) ) ( not ( = ?auto_123714 ?auto_123719 ) ) ( not ( = ?auto_123714 ?auto_123720 ) ) ( not ( = ?auto_123714 ?auto_123721 ) ) ( not ( = ?auto_123714 ?auto_123722 ) ) ( not ( = ?auto_123714 ?auto_123723 ) ) ( not ( = ?auto_123715 ?auto_123716 ) ) ( not ( = ?auto_123715 ?auto_123717 ) ) ( not ( = ?auto_123715 ?auto_123718 ) ) ( not ( = ?auto_123715 ?auto_123719 ) ) ( not ( = ?auto_123715 ?auto_123720 ) ) ( not ( = ?auto_123715 ?auto_123721 ) ) ( not ( = ?auto_123715 ?auto_123722 ) ) ( not ( = ?auto_123715 ?auto_123723 ) ) ( not ( = ?auto_123716 ?auto_123717 ) ) ( not ( = ?auto_123716 ?auto_123718 ) ) ( not ( = ?auto_123716 ?auto_123719 ) ) ( not ( = ?auto_123716 ?auto_123720 ) ) ( not ( = ?auto_123716 ?auto_123721 ) ) ( not ( = ?auto_123716 ?auto_123722 ) ) ( not ( = ?auto_123716 ?auto_123723 ) ) ( not ( = ?auto_123717 ?auto_123718 ) ) ( not ( = ?auto_123717 ?auto_123719 ) ) ( not ( = ?auto_123717 ?auto_123720 ) ) ( not ( = ?auto_123717 ?auto_123721 ) ) ( not ( = ?auto_123717 ?auto_123722 ) ) ( not ( = ?auto_123717 ?auto_123723 ) ) ( not ( = ?auto_123718 ?auto_123719 ) ) ( not ( = ?auto_123718 ?auto_123720 ) ) ( not ( = ?auto_123718 ?auto_123721 ) ) ( not ( = ?auto_123718 ?auto_123722 ) ) ( not ( = ?auto_123718 ?auto_123723 ) ) ( not ( = ?auto_123719 ?auto_123720 ) ) ( not ( = ?auto_123719 ?auto_123721 ) ) ( not ( = ?auto_123719 ?auto_123722 ) ) ( not ( = ?auto_123719 ?auto_123723 ) ) ( not ( = ?auto_123720 ?auto_123721 ) ) ( not ( = ?auto_123720 ?auto_123722 ) ) ( not ( = ?auto_123720 ?auto_123723 ) ) ( not ( = ?auto_123721 ?auto_123722 ) ) ( not ( = ?auto_123721 ?auto_123723 ) ) ( not ( = ?auto_123722 ?auto_123723 ) ) ( ON ?auto_123721 ?auto_123722 ) ( ON ?auto_123720 ?auto_123721 ) ( CLEAR ?auto_123718 ) ( ON ?auto_123719 ?auto_123720 ) ( CLEAR ?auto_123719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_123712 ?auto_123713 ?auto_123714 ?auto_123715 ?auto_123716 ?auto_123717 ?auto_123718 ?auto_123719 )
      ( MAKE-11PILE ?auto_123712 ?auto_123713 ?auto_123714 ?auto_123715 ?auto_123716 ?auto_123717 ?auto_123718 ?auto_123719 ?auto_123720 ?auto_123721 ?auto_123722 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123735 - BLOCK
      ?auto_123736 - BLOCK
      ?auto_123737 - BLOCK
      ?auto_123738 - BLOCK
      ?auto_123739 - BLOCK
      ?auto_123740 - BLOCK
      ?auto_123741 - BLOCK
      ?auto_123742 - BLOCK
      ?auto_123743 - BLOCK
      ?auto_123744 - BLOCK
      ?auto_123745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123745 ) ( ON-TABLE ?auto_123735 ) ( ON ?auto_123736 ?auto_123735 ) ( ON ?auto_123737 ?auto_123736 ) ( ON ?auto_123738 ?auto_123737 ) ( ON ?auto_123739 ?auto_123738 ) ( ON ?auto_123740 ?auto_123739 ) ( ON ?auto_123741 ?auto_123740 ) ( not ( = ?auto_123735 ?auto_123736 ) ) ( not ( = ?auto_123735 ?auto_123737 ) ) ( not ( = ?auto_123735 ?auto_123738 ) ) ( not ( = ?auto_123735 ?auto_123739 ) ) ( not ( = ?auto_123735 ?auto_123740 ) ) ( not ( = ?auto_123735 ?auto_123741 ) ) ( not ( = ?auto_123735 ?auto_123742 ) ) ( not ( = ?auto_123735 ?auto_123743 ) ) ( not ( = ?auto_123735 ?auto_123744 ) ) ( not ( = ?auto_123735 ?auto_123745 ) ) ( not ( = ?auto_123736 ?auto_123737 ) ) ( not ( = ?auto_123736 ?auto_123738 ) ) ( not ( = ?auto_123736 ?auto_123739 ) ) ( not ( = ?auto_123736 ?auto_123740 ) ) ( not ( = ?auto_123736 ?auto_123741 ) ) ( not ( = ?auto_123736 ?auto_123742 ) ) ( not ( = ?auto_123736 ?auto_123743 ) ) ( not ( = ?auto_123736 ?auto_123744 ) ) ( not ( = ?auto_123736 ?auto_123745 ) ) ( not ( = ?auto_123737 ?auto_123738 ) ) ( not ( = ?auto_123737 ?auto_123739 ) ) ( not ( = ?auto_123737 ?auto_123740 ) ) ( not ( = ?auto_123737 ?auto_123741 ) ) ( not ( = ?auto_123737 ?auto_123742 ) ) ( not ( = ?auto_123737 ?auto_123743 ) ) ( not ( = ?auto_123737 ?auto_123744 ) ) ( not ( = ?auto_123737 ?auto_123745 ) ) ( not ( = ?auto_123738 ?auto_123739 ) ) ( not ( = ?auto_123738 ?auto_123740 ) ) ( not ( = ?auto_123738 ?auto_123741 ) ) ( not ( = ?auto_123738 ?auto_123742 ) ) ( not ( = ?auto_123738 ?auto_123743 ) ) ( not ( = ?auto_123738 ?auto_123744 ) ) ( not ( = ?auto_123738 ?auto_123745 ) ) ( not ( = ?auto_123739 ?auto_123740 ) ) ( not ( = ?auto_123739 ?auto_123741 ) ) ( not ( = ?auto_123739 ?auto_123742 ) ) ( not ( = ?auto_123739 ?auto_123743 ) ) ( not ( = ?auto_123739 ?auto_123744 ) ) ( not ( = ?auto_123739 ?auto_123745 ) ) ( not ( = ?auto_123740 ?auto_123741 ) ) ( not ( = ?auto_123740 ?auto_123742 ) ) ( not ( = ?auto_123740 ?auto_123743 ) ) ( not ( = ?auto_123740 ?auto_123744 ) ) ( not ( = ?auto_123740 ?auto_123745 ) ) ( not ( = ?auto_123741 ?auto_123742 ) ) ( not ( = ?auto_123741 ?auto_123743 ) ) ( not ( = ?auto_123741 ?auto_123744 ) ) ( not ( = ?auto_123741 ?auto_123745 ) ) ( not ( = ?auto_123742 ?auto_123743 ) ) ( not ( = ?auto_123742 ?auto_123744 ) ) ( not ( = ?auto_123742 ?auto_123745 ) ) ( not ( = ?auto_123743 ?auto_123744 ) ) ( not ( = ?auto_123743 ?auto_123745 ) ) ( not ( = ?auto_123744 ?auto_123745 ) ) ( ON ?auto_123744 ?auto_123745 ) ( ON ?auto_123743 ?auto_123744 ) ( CLEAR ?auto_123741 ) ( ON ?auto_123742 ?auto_123743 ) ( CLEAR ?auto_123742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_123735 ?auto_123736 ?auto_123737 ?auto_123738 ?auto_123739 ?auto_123740 ?auto_123741 ?auto_123742 )
      ( MAKE-11PILE ?auto_123735 ?auto_123736 ?auto_123737 ?auto_123738 ?auto_123739 ?auto_123740 ?auto_123741 ?auto_123742 ?auto_123743 ?auto_123744 ?auto_123745 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123757 - BLOCK
      ?auto_123758 - BLOCK
      ?auto_123759 - BLOCK
      ?auto_123760 - BLOCK
      ?auto_123761 - BLOCK
      ?auto_123762 - BLOCK
      ?auto_123763 - BLOCK
      ?auto_123764 - BLOCK
      ?auto_123765 - BLOCK
      ?auto_123766 - BLOCK
      ?auto_123767 - BLOCK
    )
    :vars
    (
      ?auto_123768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123767 ?auto_123768 ) ( ON-TABLE ?auto_123757 ) ( ON ?auto_123758 ?auto_123757 ) ( ON ?auto_123759 ?auto_123758 ) ( ON ?auto_123760 ?auto_123759 ) ( ON ?auto_123761 ?auto_123760 ) ( ON ?auto_123762 ?auto_123761 ) ( not ( = ?auto_123757 ?auto_123758 ) ) ( not ( = ?auto_123757 ?auto_123759 ) ) ( not ( = ?auto_123757 ?auto_123760 ) ) ( not ( = ?auto_123757 ?auto_123761 ) ) ( not ( = ?auto_123757 ?auto_123762 ) ) ( not ( = ?auto_123757 ?auto_123763 ) ) ( not ( = ?auto_123757 ?auto_123764 ) ) ( not ( = ?auto_123757 ?auto_123765 ) ) ( not ( = ?auto_123757 ?auto_123766 ) ) ( not ( = ?auto_123757 ?auto_123767 ) ) ( not ( = ?auto_123757 ?auto_123768 ) ) ( not ( = ?auto_123758 ?auto_123759 ) ) ( not ( = ?auto_123758 ?auto_123760 ) ) ( not ( = ?auto_123758 ?auto_123761 ) ) ( not ( = ?auto_123758 ?auto_123762 ) ) ( not ( = ?auto_123758 ?auto_123763 ) ) ( not ( = ?auto_123758 ?auto_123764 ) ) ( not ( = ?auto_123758 ?auto_123765 ) ) ( not ( = ?auto_123758 ?auto_123766 ) ) ( not ( = ?auto_123758 ?auto_123767 ) ) ( not ( = ?auto_123758 ?auto_123768 ) ) ( not ( = ?auto_123759 ?auto_123760 ) ) ( not ( = ?auto_123759 ?auto_123761 ) ) ( not ( = ?auto_123759 ?auto_123762 ) ) ( not ( = ?auto_123759 ?auto_123763 ) ) ( not ( = ?auto_123759 ?auto_123764 ) ) ( not ( = ?auto_123759 ?auto_123765 ) ) ( not ( = ?auto_123759 ?auto_123766 ) ) ( not ( = ?auto_123759 ?auto_123767 ) ) ( not ( = ?auto_123759 ?auto_123768 ) ) ( not ( = ?auto_123760 ?auto_123761 ) ) ( not ( = ?auto_123760 ?auto_123762 ) ) ( not ( = ?auto_123760 ?auto_123763 ) ) ( not ( = ?auto_123760 ?auto_123764 ) ) ( not ( = ?auto_123760 ?auto_123765 ) ) ( not ( = ?auto_123760 ?auto_123766 ) ) ( not ( = ?auto_123760 ?auto_123767 ) ) ( not ( = ?auto_123760 ?auto_123768 ) ) ( not ( = ?auto_123761 ?auto_123762 ) ) ( not ( = ?auto_123761 ?auto_123763 ) ) ( not ( = ?auto_123761 ?auto_123764 ) ) ( not ( = ?auto_123761 ?auto_123765 ) ) ( not ( = ?auto_123761 ?auto_123766 ) ) ( not ( = ?auto_123761 ?auto_123767 ) ) ( not ( = ?auto_123761 ?auto_123768 ) ) ( not ( = ?auto_123762 ?auto_123763 ) ) ( not ( = ?auto_123762 ?auto_123764 ) ) ( not ( = ?auto_123762 ?auto_123765 ) ) ( not ( = ?auto_123762 ?auto_123766 ) ) ( not ( = ?auto_123762 ?auto_123767 ) ) ( not ( = ?auto_123762 ?auto_123768 ) ) ( not ( = ?auto_123763 ?auto_123764 ) ) ( not ( = ?auto_123763 ?auto_123765 ) ) ( not ( = ?auto_123763 ?auto_123766 ) ) ( not ( = ?auto_123763 ?auto_123767 ) ) ( not ( = ?auto_123763 ?auto_123768 ) ) ( not ( = ?auto_123764 ?auto_123765 ) ) ( not ( = ?auto_123764 ?auto_123766 ) ) ( not ( = ?auto_123764 ?auto_123767 ) ) ( not ( = ?auto_123764 ?auto_123768 ) ) ( not ( = ?auto_123765 ?auto_123766 ) ) ( not ( = ?auto_123765 ?auto_123767 ) ) ( not ( = ?auto_123765 ?auto_123768 ) ) ( not ( = ?auto_123766 ?auto_123767 ) ) ( not ( = ?auto_123766 ?auto_123768 ) ) ( not ( = ?auto_123767 ?auto_123768 ) ) ( ON ?auto_123766 ?auto_123767 ) ( ON ?auto_123765 ?auto_123766 ) ( ON ?auto_123764 ?auto_123765 ) ( CLEAR ?auto_123762 ) ( ON ?auto_123763 ?auto_123764 ) ( CLEAR ?auto_123763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123757 ?auto_123758 ?auto_123759 ?auto_123760 ?auto_123761 ?auto_123762 ?auto_123763 )
      ( MAKE-11PILE ?auto_123757 ?auto_123758 ?auto_123759 ?auto_123760 ?auto_123761 ?auto_123762 ?auto_123763 ?auto_123764 ?auto_123765 ?auto_123766 ?auto_123767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123780 - BLOCK
      ?auto_123781 - BLOCK
      ?auto_123782 - BLOCK
      ?auto_123783 - BLOCK
      ?auto_123784 - BLOCK
      ?auto_123785 - BLOCK
      ?auto_123786 - BLOCK
      ?auto_123787 - BLOCK
      ?auto_123788 - BLOCK
      ?auto_123789 - BLOCK
      ?auto_123790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123790 ) ( ON-TABLE ?auto_123780 ) ( ON ?auto_123781 ?auto_123780 ) ( ON ?auto_123782 ?auto_123781 ) ( ON ?auto_123783 ?auto_123782 ) ( ON ?auto_123784 ?auto_123783 ) ( ON ?auto_123785 ?auto_123784 ) ( not ( = ?auto_123780 ?auto_123781 ) ) ( not ( = ?auto_123780 ?auto_123782 ) ) ( not ( = ?auto_123780 ?auto_123783 ) ) ( not ( = ?auto_123780 ?auto_123784 ) ) ( not ( = ?auto_123780 ?auto_123785 ) ) ( not ( = ?auto_123780 ?auto_123786 ) ) ( not ( = ?auto_123780 ?auto_123787 ) ) ( not ( = ?auto_123780 ?auto_123788 ) ) ( not ( = ?auto_123780 ?auto_123789 ) ) ( not ( = ?auto_123780 ?auto_123790 ) ) ( not ( = ?auto_123781 ?auto_123782 ) ) ( not ( = ?auto_123781 ?auto_123783 ) ) ( not ( = ?auto_123781 ?auto_123784 ) ) ( not ( = ?auto_123781 ?auto_123785 ) ) ( not ( = ?auto_123781 ?auto_123786 ) ) ( not ( = ?auto_123781 ?auto_123787 ) ) ( not ( = ?auto_123781 ?auto_123788 ) ) ( not ( = ?auto_123781 ?auto_123789 ) ) ( not ( = ?auto_123781 ?auto_123790 ) ) ( not ( = ?auto_123782 ?auto_123783 ) ) ( not ( = ?auto_123782 ?auto_123784 ) ) ( not ( = ?auto_123782 ?auto_123785 ) ) ( not ( = ?auto_123782 ?auto_123786 ) ) ( not ( = ?auto_123782 ?auto_123787 ) ) ( not ( = ?auto_123782 ?auto_123788 ) ) ( not ( = ?auto_123782 ?auto_123789 ) ) ( not ( = ?auto_123782 ?auto_123790 ) ) ( not ( = ?auto_123783 ?auto_123784 ) ) ( not ( = ?auto_123783 ?auto_123785 ) ) ( not ( = ?auto_123783 ?auto_123786 ) ) ( not ( = ?auto_123783 ?auto_123787 ) ) ( not ( = ?auto_123783 ?auto_123788 ) ) ( not ( = ?auto_123783 ?auto_123789 ) ) ( not ( = ?auto_123783 ?auto_123790 ) ) ( not ( = ?auto_123784 ?auto_123785 ) ) ( not ( = ?auto_123784 ?auto_123786 ) ) ( not ( = ?auto_123784 ?auto_123787 ) ) ( not ( = ?auto_123784 ?auto_123788 ) ) ( not ( = ?auto_123784 ?auto_123789 ) ) ( not ( = ?auto_123784 ?auto_123790 ) ) ( not ( = ?auto_123785 ?auto_123786 ) ) ( not ( = ?auto_123785 ?auto_123787 ) ) ( not ( = ?auto_123785 ?auto_123788 ) ) ( not ( = ?auto_123785 ?auto_123789 ) ) ( not ( = ?auto_123785 ?auto_123790 ) ) ( not ( = ?auto_123786 ?auto_123787 ) ) ( not ( = ?auto_123786 ?auto_123788 ) ) ( not ( = ?auto_123786 ?auto_123789 ) ) ( not ( = ?auto_123786 ?auto_123790 ) ) ( not ( = ?auto_123787 ?auto_123788 ) ) ( not ( = ?auto_123787 ?auto_123789 ) ) ( not ( = ?auto_123787 ?auto_123790 ) ) ( not ( = ?auto_123788 ?auto_123789 ) ) ( not ( = ?auto_123788 ?auto_123790 ) ) ( not ( = ?auto_123789 ?auto_123790 ) ) ( ON ?auto_123789 ?auto_123790 ) ( ON ?auto_123788 ?auto_123789 ) ( ON ?auto_123787 ?auto_123788 ) ( CLEAR ?auto_123785 ) ( ON ?auto_123786 ?auto_123787 ) ( CLEAR ?auto_123786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123780 ?auto_123781 ?auto_123782 ?auto_123783 ?auto_123784 ?auto_123785 ?auto_123786 )
      ( MAKE-11PILE ?auto_123780 ?auto_123781 ?auto_123782 ?auto_123783 ?auto_123784 ?auto_123785 ?auto_123786 ?auto_123787 ?auto_123788 ?auto_123789 ?auto_123790 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123802 - BLOCK
      ?auto_123803 - BLOCK
      ?auto_123804 - BLOCK
      ?auto_123805 - BLOCK
      ?auto_123806 - BLOCK
      ?auto_123807 - BLOCK
      ?auto_123808 - BLOCK
      ?auto_123809 - BLOCK
      ?auto_123810 - BLOCK
      ?auto_123811 - BLOCK
      ?auto_123812 - BLOCK
    )
    :vars
    (
      ?auto_123813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123812 ?auto_123813 ) ( ON-TABLE ?auto_123802 ) ( ON ?auto_123803 ?auto_123802 ) ( ON ?auto_123804 ?auto_123803 ) ( ON ?auto_123805 ?auto_123804 ) ( ON ?auto_123806 ?auto_123805 ) ( not ( = ?auto_123802 ?auto_123803 ) ) ( not ( = ?auto_123802 ?auto_123804 ) ) ( not ( = ?auto_123802 ?auto_123805 ) ) ( not ( = ?auto_123802 ?auto_123806 ) ) ( not ( = ?auto_123802 ?auto_123807 ) ) ( not ( = ?auto_123802 ?auto_123808 ) ) ( not ( = ?auto_123802 ?auto_123809 ) ) ( not ( = ?auto_123802 ?auto_123810 ) ) ( not ( = ?auto_123802 ?auto_123811 ) ) ( not ( = ?auto_123802 ?auto_123812 ) ) ( not ( = ?auto_123802 ?auto_123813 ) ) ( not ( = ?auto_123803 ?auto_123804 ) ) ( not ( = ?auto_123803 ?auto_123805 ) ) ( not ( = ?auto_123803 ?auto_123806 ) ) ( not ( = ?auto_123803 ?auto_123807 ) ) ( not ( = ?auto_123803 ?auto_123808 ) ) ( not ( = ?auto_123803 ?auto_123809 ) ) ( not ( = ?auto_123803 ?auto_123810 ) ) ( not ( = ?auto_123803 ?auto_123811 ) ) ( not ( = ?auto_123803 ?auto_123812 ) ) ( not ( = ?auto_123803 ?auto_123813 ) ) ( not ( = ?auto_123804 ?auto_123805 ) ) ( not ( = ?auto_123804 ?auto_123806 ) ) ( not ( = ?auto_123804 ?auto_123807 ) ) ( not ( = ?auto_123804 ?auto_123808 ) ) ( not ( = ?auto_123804 ?auto_123809 ) ) ( not ( = ?auto_123804 ?auto_123810 ) ) ( not ( = ?auto_123804 ?auto_123811 ) ) ( not ( = ?auto_123804 ?auto_123812 ) ) ( not ( = ?auto_123804 ?auto_123813 ) ) ( not ( = ?auto_123805 ?auto_123806 ) ) ( not ( = ?auto_123805 ?auto_123807 ) ) ( not ( = ?auto_123805 ?auto_123808 ) ) ( not ( = ?auto_123805 ?auto_123809 ) ) ( not ( = ?auto_123805 ?auto_123810 ) ) ( not ( = ?auto_123805 ?auto_123811 ) ) ( not ( = ?auto_123805 ?auto_123812 ) ) ( not ( = ?auto_123805 ?auto_123813 ) ) ( not ( = ?auto_123806 ?auto_123807 ) ) ( not ( = ?auto_123806 ?auto_123808 ) ) ( not ( = ?auto_123806 ?auto_123809 ) ) ( not ( = ?auto_123806 ?auto_123810 ) ) ( not ( = ?auto_123806 ?auto_123811 ) ) ( not ( = ?auto_123806 ?auto_123812 ) ) ( not ( = ?auto_123806 ?auto_123813 ) ) ( not ( = ?auto_123807 ?auto_123808 ) ) ( not ( = ?auto_123807 ?auto_123809 ) ) ( not ( = ?auto_123807 ?auto_123810 ) ) ( not ( = ?auto_123807 ?auto_123811 ) ) ( not ( = ?auto_123807 ?auto_123812 ) ) ( not ( = ?auto_123807 ?auto_123813 ) ) ( not ( = ?auto_123808 ?auto_123809 ) ) ( not ( = ?auto_123808 ?auto_123810 ) ) ( not ( = ?auto_123808 ?auto_123811 ) ) ( not ( = ?auto_123808 ?auto_123812 ) ) ( not ( = ?auto_123808 ?auto_123813 ) ) ( not ( = ?auto_123809 ?auto_123810 ) ) ( not ( = ?auto_123809 ?auto_123811 ) ) ( not ( = ?auto_123809 ?auto_123812 ) ) ( not ( = ?auto_123809 ?auto_123813 ) ) ( not ( = ?auto_123810 ?auto_123811 ) ) ( not ( = ?auto_123810 ?auto_123812 ) ) ( not ( = ?auto_123810 ?auto_123813 ) ) ( not ( = ?auto_123811 ?auto_123812 ) ) ( not ( = ?auto_123811 ?auto_123813 ) ) ( not ( = ?auto_123812 ?auto_123813 ) ) ( ON ?auto_123811 ?auto_123812 ) ( ON ?auto_123810 ?auto_123811 ) ( ON ?auto_123809 ?auto_123810 ) ( ON ?auto_123808 ?auto_123809 ) ( CLEAR ?auto_123806 ) ( ON ?auto_123807 ?auto_123808 ) ( CLEAR ?auto_123807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123802 ?auto_123803 ?auto_123804 ?auto_123805 ?auto_123806 ?auto_123807 )
      ( MAKE-11PILE ?auto_123802 ?auto_123803 ?auto_123804 ?auto_123805 ?auto_123806 ?auto_123807 ?auto_123808 ?auto_123809 ?auto_123810 ?auto_123811 ?auto_123812 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123825 - BLOCK
      ?auto_123826 - BLOCK
      ?auto_123827 - BLOCK
      ?auto_123828 - BLOCK
      ?auto_123829 - BLOCK
      ?auto_123830 - BLOCK
      ?auto_123831 - BLOCK
      ?auto_123832 - BLOCK
      ?auto_123833 - BLOCK
      ?auto_123834 - BLOCK
      ?auto_123835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123835 ) ( ON-TABLE ?auto_123825 ) ( ON ?auto_123826 ?auto_123825 ) ( ON ?auto_123827 ?auto_123826 ) ( ON ?auto_123828 ?auto_123827 ) ( ON ?auto_123829 ?auto_123828 ) ( not ( = ?auto_123825 ?auto_123826 ) ) ( not ( = ?auto_123825 ?auto_123827 ) ) ( not ( = ?auto_123825 ?auto_123828 ) ) ( not ( = ?auto_123825 ?auto_123829 ) ) ( not ( = ?auto_123825 ?auto_123830 ) ) ( not ( = ?auto_123825 ?auto_123831 ) ) ( not ( = ?auto_123825 ?auto_123832 ) ) ( not ( = ?auto_123825 ?auto_123833 ) ) ( not ( = ?auto_123825 ?auto_123834 ) ) ( not ( = ?auto_123825 ?auto_123835 ) ) ( not ( = ?auto_123826 ?auto_123827 ) ) ( not ( = ?auto_123826 ?auto_123828 ) ) ( not ( = ?auto_123826 ?auto_123829 ) ) ( not ( = ?auto_123826 ?auto_123830 ) ) ( not ( = ?auto_123826 ?auto_123831 ) ) ( not ( = ?auto_123826 ?auto_123832 ) ) ( not ( = ?auto_123826 ?auto_123833 ) ) ( not ( = ?auto_123826 ?auto_123834 ) ) ( not ( = ?auto_123826 ?auto_123835 ) ) ( not ( = ?auto_123827 ?auto_123828 ) ) ( not ( = ?auto_123827 ?auto_123829 ) ) ( not ( = ?auto_123827 ?auto_123830 ) ) ( not ( = ?auto_123827 ?auto_123831 ) ) ( not ( = ?auto_123827 ?auto_123832 ) ) ( not ( = ?auto_123827 ?auto_123833 ) ) ( not ( = ?auto_123827 ?auto_123834 ) ) ( not ( = ?auto_123827 ?auto_123835 ) ) ( not ( = ?auto_123828 ?auto_123829 ) ) ( not ( = ?auto_123828 ?auto_123830 ) ) ( not ( = ?auto_123828 ?auto_123831 ) ) ( not ( = ?auto_123828 ?auto_123832 ) ) ( not ( = ?auto_123828 ?auto_123833 ) ) ( not ( = ?auto_123828 ?auto_123834 ) ) ( not ( = ?auto_123828 ?auto_123835 ) ) ( not ( = ?auto_123829 ?auto_123830 ) ) ( not ( = ?auto_123829 ?auto_123831 ) ) ( not ( = ?auto_123829 ?auto_123832 ) ) ( not ( = ?auto_123829 ?auto_123833 ) ) ( not ( = ?auto_123829 ?auto_123834 ) ) ( not ( = ?auto_123829 ?auto_123835 ) ) ( not ( = ?auto_123830 ?auto_123831 ) ) ( not ( = ?auto_123830 ?auto_123832 ) ) ( not ( = ?auto_123830 ?auto_123833 ) ) ( not ( = ?auto_123830 ?auto_123834 ) ) ( not ( = ?auto_123830 ?auto_123835 ) ) ( not ( = ?auto_123831 ?auto_123832 ) ) ( not ( = ?auto_123831 ?auto_123833 ) ) ( not ( = ?auto_123831 ?auto_123834 ) ) ( not ( = ?auto_123831 ?auto_123835 ) ) ( not ( = ?auto_123832 ?auto_123833 ) ) ( not ( = ?auto_123832 ?auto_123834 ) ) ( not ( = ?auto_123832 ?auto_123835 ) ) ( not ( = ?auto_123833 ?auto_123834 ) ) ( not ( = ?auto_123833 ?auto_123835 ) ) ( not ( = ?auto_123834 ?auto_123835 ) ) ( ON ?auto_123834 ?auto_123835 ) ( ON ?auto_123833 ?auto_123834 ) ( ON ?auto_123832 ?auto_123833 ) ( ON ?auto_123831 ?auto_123832 ) ( CLEAR ?auto_123829 ) ( ON ?auto_123830 ?auto_123831 ) ( CLEAR ?auto_123830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123825 ?auto_123826 ?auto_123827 ?auto_123828 ?auto_123829 ?auto_123830 )
      ( MAKE-11PILE ?auto_123825 ?auto_123826 ?auto_123827 ?auto_123828 ?auto_123829 ?auto_123830 ?auto_123831 ?auto_123832 ?auto_123833 ?auto_123834 ?auto_123835 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123847 - BLOCK
      ?auto_123848 - BLOCK
      ?auto_123849 - BLOCK
      ?auto_123850 - BLOCK
      ?auto_123851 - BLOCK
      ?auto_123852 - BLOCK
      ?auto_123853 - BLOCK
      ?auto_123854 - BLOCK
      ?auto_123855 - BLOCK
      ?auto_123856 - BLOCK
      ?auto_123857 - BLOCK
    )
    :vars
    (
      ?auto_123858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123857 ?auto_123858 ) ( ON-TABLE ?auto_123847 ) ( ON ?auto_123848 ?auto_123847 ) ( ON ?auto_123849 ?auto_123848 ) ( ON ?auto_123850 ?auto_123849 ) ( not ( = ?auto_123847 ?auto_123848 ) ) ( not ( = ?auto_123847 ?auto_123849 ) ) ( not ( = ?auto_123847 ?auto_123850 ) ) ( not ( = ?auto_123847 ?auto_123851 ) ) ( not ( = ?auto_123847 ?auto_123852 ) ) ( not ( = ?auto_123847 ?auto_123853 ) ) ( not ( = ?auto_123847 ?auto_123854 ) ) ( not ( = ?auto_123847 ?auto_123855 ) ) ( not ( = ?auto_123847 ?auto_123856 ) ) ( not ( = ?auto_123847 ?auto_123857 ) ) ( not ( = ?auto_123847 ?auto_123858 ) ) ( not ( = ?auto_123848 ?auto_123849 ) ) ( not ( = ?auto_123848 ?auto_123850 ) ) ( not ( = ?auto_123848 ?auto_123851 ) ) ( not ( = ?auto_123848 ?auto_123852 ) ) ( not ( = ?auto_123848 ?auto_123853 ) ) ( not ( = ?auto_123848 ?auto_123854 ) ) ( not ( = ?auto_123848 ?auto_123855 ) ) ( not ( = ?auto_123848 ?auto_123856 ) ) ( not ( = ?auto_123848 ?auto_123857 ) ) ( not ( = ?auto_123848 ?auto_123858 ) ) ( not ( = ?auto_123849 ?auto_123850 ) ) ( not ( = ?auto_123849 ?auto_123851 ) ) ( not ( = ?auto_123849 ?auto_123852 ) ) ( not ( = ?auto_123849 ?auto_123853 ) ) ( not ( = ?auto_123849 ?auto_123854 ) ) ( not ( = ?auto_123849 ?auto_123855 ) ) ( not ( = ?auto_123849 ?auto_123856 ) ) ( not ( = ?auto_123849 ?auto_123857 ) ) ( not ( = ?auto_123849 ?auto_123858 ) ) ( not ( = ?auto_123850 ?auto_123851 ) ) ( not ( = ?auto_123850 ?auto_123852 ) ) ( not ( = ?auto_123850 ?auto_123853 ) ) ( not ( = ?auto_123850 ?auto_123854 ) ) ( not ( = ?auto_123850 ?auto_123855 ) ) ( not ( = ?auto_123850 ?auto_123856 ) ) ( not ( = ?auto_123850 ?auto_123857 ) ) ( not ( = ?auto_123850 ?auto_123858 ) ) ( not ( = ?auto_123851 ?auto_123852 ) ) ( not ( = ?auto_123851 ?auto_123853 ) ) ( not ( = ?auto_123851 ?auto_123854 ) ) ( not ( = ?auto_123851 ?auto_123855 ) ) ( not ( = ?auto_123851 ?auto_123856 ) ) ( not ( = ?auto_123851 ?auto_123857 ) ) ( not ( = ?auto_123851 ?auto_123858 ) ) ( not ( = ?auto_123852 ?auto_123853 ) ) ( not ( = ?auto_123852 ?auto_123854 ) ) ( not ( = ?auto_123852 ?auto_123855 ) ) ( not ( = ?auto_123852 ?auto_123856 ) ) ( not ( = ?auto_123852 ?auto_123857 ) ) ( not ( = ?auto_123852 ?auto_123858 ) ) ( not ( = ?auto_123853 ?auto_123854 ) ) ( not ( = ?auto_123853 ?auto_123855 ) ) ( not ( = ?auto_123853 ?auto_123856 ) ) ( not ( = ?auto_123853 ?auto_123857 ) ) ( not ( = ?auto_123853 ?auto_123858 ) ) ( not ( = ?auto_123854 ?auto_123855 ) ) ( not ( = ?auto_123854 ?auto_123856 ) ) ( not ( = ?auto_123854 ?auto_123857 ) ) ( not ( = ?auto_123854 ?auto_123858 ) ) ( not ( = ?auto_123855 ?auto_123856 ) ) ( not ( = ?auto_123855 ?auto_123857 ) ) ( not ( = ?auto_123855 ?auto_123858 ) ) ( not ( = ?auto_123856 ?auto_123857 ) ) ( not ( = ?auto_123856 ?auto_123858 ) ) ( not ( = ?auto_123857 ?auto_123858 ) ) ( ON ?auto_123856 ?auto_123857 ) ( ON ?auto_123855 ?auto_123856 ) ( ON ?auto_123854 ?auto_123855 ) ( ON ?auto_123853 ?auto_123854 ) ( ON ?auto_123852 ?auto_123853 ) ( CLEAR ?auto_123850 ) ( ON ?auto_123851 ?auto_123852 ) ( CLEAR ?auto_123851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123847 ?auto_123848 ?auto_123849 ?auto_123850 ?auto_123851 )
      ( MAKE-11PILE ?auto_123847 ?auto_123848 ?auto_123849 ?auto_123850 ?auto_123851 ?auto_123852 ?auto_123853 ?auto_123854 ?auto_123855 ?auto_123856 ?auto_123857 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123870 - BLOCK
      ?auto_123871 - BLOCK
      ?auto_123872 - BLOCK
      ?auto_123873 - BLOCK
      ?auto_123874 - BLOCK
      ?auto_123875 - BLOCK
      ?auto_123876 - BLOCK
      ?auto_123877 - BLOCK
      ?auto_123878 - BLOCK
      ?auto_123879 - BLOCK
      ?auto_123880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123880 ) ( ON-TABLE ?auto_123870 ) ( ON ?auto_123871 ?auto_123870 ) ( ON ?auto_123872 ?auto_123871 ) ( ON ?auto_123873 ?auto_123872 ) ( not ( = ?auto_123870 ?auto_123871 ) ) ( not ( = ?auto_123870 ?auto_123872 ) ) ( not ( = ?auto_123870 ?auto_123873 ) ) ( not ( = ?auto_123870 ?auto_123874 ) ) ( not ( = ?auto_123870 ?auto_123875 ) ) ( not ( = ?auto_123870 ?auto_123876 ) ) ( not ( = ?auto_123870 ?auto_123877 ) ) ( not ( = ?auto_123870 ?auto_123878 ) ) ( not ( = ?auto_123870 ?auto_123879 ) ) ( not ( = ?auto_123870 ?auto_123880 ) ) ( not ( = ?auto_123871 ?auto_123872 ) ) ( not ( = ?auto_123871 ?auto_123873 ) ) ( not ( = ?auto_123871 ?auto_123874 ) ) ( not ( = ?auto_123871 ?auto_123875 ) ) ( not ( = ?auto_123871 ?auto_123876 ) ) ( not ( = ?auto_123871 ?auto_123877 ) ) ( not ( = ?auto_123871 ?auto_123878 ) ) ( not ( = ?auto_123871 ?auto_123879 ) ) ( not ( = ?auto_123871 ?auto_123880 ) ) ( not ( = ?auto_123872 ?auto_123873 ) ) ( not ( = ?auto_123872 ?auto_123874 ) ) ( not ( = ?auto_123872 ?auto_123875 ) ) ( not ( = ?auto_123872 ?auto_123876 ) ) ( not ( = ?auto_123872 ?auto_123877 ) ) ( not ( = ?auto_123872 ?auto_123878 ) ) ( not ( = ?auto_123872 ?auto_123879 ) ) ( not ( = ?auto_123872 ?auto_123880 ) ) ( not ( = ?auto_123873 ?auto_123874 ) ) ( not ( = ?auto_123873 ?auto_123875 ) ) ( not ( = ?auto_123873 ?auto_123876 ) ) ( not ( = ?auto_123873 ?auto_123877 ) ) ( not ( = ?auto_123873 ?auto_123878 ) ) ( not ( = ?auto_123873 ?auto_123879 ) ) ( not ( = ?auto_123873 ?auto_123880 ) ) ( not ( = ?auto_123874 ?auto_123875 ) ) ( not ( = ?auto_123874 ?auto_123876 ) ) ( not ( = ?auto_123874 ?auto_123877 ) ) ( not ( = ?auto_123874 ?auto_123878 ) ) ( not ( = ?auto_123874 ?auto_123879 ) ) ( not ( = ?auto_123874 ?auto_123880 ) ) ( not ( = ?auto_123875 ?auto_123876 ) ) ( not ( = ?auto_123875 ?auto_123877 ) ) ( not ( = ?auto_123875 ?auto_123878 ) ) ( not ( = ?auto_123875 ?auto_123879 ) ) ( not ( = ?auto_123875 ?auto_123880 ) ) ( not ( = ?auto_123876 ?auto_123877 ) ) ( not ( = ?auto_123876 ?auto_123878 ) ) ( not ( = ?auto_123876 ?auto_123879 ) ) ( not ( = ?auto_123876 ?auto_123880 ) ) ( not ( = ?auto_123877 ?auto_123878 ) ) ( not ( = ?auto_123877 ?auto_123879 ) ) ( not ( = ?auto_123877 ?auto_123880 ) ) ( not ( = ?auto_123878 ?auto_123879 ) ) ( not ( = ?auto_123878 ?auto_123880 ) ) ( not ( = ?auto_123879 ?auto_123880 ) ) ( ON ?auto_123879 ?auto_123880 ) ( ON ?auto_123878 ?auto_123879 ) ( ON ?auto_123877 ?auto_123878 ) ( ON ?auto_123876 ?auto_123877 ) ( ON ?auto_123875 ?auto_123876 ) ( CLEAR ?auto_123873 ) ( ON ?auto_123874 ?auto_123875 ) ( CLEAR ?auto_123874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123870 ?auto_123871 ?auto_123872 ?auto_123873 ?auto_123874 )
      ( MAKE-11PILE ?auto_123870 ?auto_123871 ?auto_123872 ?auto_123873 ?auto_123874 ?auto_123875 ?auto_123876 ?auto_123877 ?auto_123878 ?auto_123879 ?auto_123880 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123892 - BLOCK
      ?auto_123893 - BLOCK
      ?auto_123894 - BLOCK
      ?auto_123895 - BLOCK
      ?auto_123896 - BLOCK
      ?auto_123897 - BLOCK
      ?auto_123898 - BLOCK
      ?auto_123899 - BLOCK
      ?auto_123900 - BLOCK
      ?auto_123901 - BLOCK
      ?auto_123902 - BLOCK
    )
    :vars
    (
      ?auto_123903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123902 ?auto_123903 ) ( ON-TABLE ?auto_123892 ) ( ON ?auto_123893 ?auto_123892 ) ( ON ?auto_123894 ?auto_123893 ) ( not ( = ?auto_123892 ?auto_123893 ) ) ( not ( = ?auto_123892 ?auto_123894 ) ) ( not ( = ?auto_123892 ?auto_123895 ) ) ( not ( = ?auto_123892 ?auto_123896 ) ) ( not ( = ?auto_123892 ?auto_123897 ) ) ( not ( = ?auto_123892 ?auto_123898 ) ) ( not ( = ?auto_123892 ?auto_123899 ) ) ( not ( = ?auto_123892 ?auto_123900 ) ) ( not ( = ?auto_123892 ?auto_123901 ) ) ( not ( = ?auto_123892 ?auto_123902 ) ) ( not ( = ?auto_123892 ?auto_123903 ) ) ( not ( = ?auto_123893 ?auto_123894 ) ) ( not ( = ?auto_123893 ?auto_123895 ) ) ( not ( = ?auto_123893 ?auto_123896 ) ) ( not ( = ?auto_123893 ?auto_123897 ) ) ( not ( = ?auto_123893 ?auto_123898 ) ) ( not ( = ?auto_123893 ?auto_123899 ) ) ( not ( = ?auto_123893 ?auto_123900 ) ) ( not ( = ?auto_123893 ?auto_123901 ) ) ( not ( = ?auto_123893 ?auto_123902 ) ) ( not ( = ?auto_123893 ?auto_123903 ) ) ( not ( = ?auto_123894 ?auto_123895 ) ) ( not ( = ?auto_123894 ?auto_123896 ) ) ( not ( = ?auto_123894 ?auto_123897 ) ) ( not ( = ?auto_123894 ?auto_123898 ) ) ( not ( = ?auto_123894 ?auto_123899 ) ) ( not ( = ?auto_123894 ?auto_123900 ) ) ( not ( = ?auto_123894 ?auto_123901 ) ) ( not ( = ?auto_123894 ?auto_123902 ) ) ( not ( = ?auto_123894 ?auto_123903 ) ) ( not ( = ?auto_123895 ?auto_123896 ) ) ( not ( = ?auto_123895 ?auto_123897 ) ) ( not ( = ?auto_123895 ?auto_123898 ) ) ( not ( = ?auto_123895 ?auto_123899 ) ) ( not ( = ?auto_123895 ?auto_123900 ) ) ( not ( = ?auto_123895 ?auto_123901 ) ) ( not ( = ?auto_123895 ?auto_123902 ) ) ( not ( = ?auto_123895 ?auto_123903 ) ) ( not ( = ?auto_123896 ?auto_123897 ) ) ( not ( = ?auto_123896 ?auto_123898 ) ) ( not ( = ?auto_123896 ?auto_123899 ) ) ( not ( = ?auto_123896 ?auto_123900 ) ) ( not ( = ?auto_123896 ?auto_123901 ) ) ( not ( = ?auto_123896 ?auto_123902 ) ) ( not ( = ?auto_123896 ?auto_123903 ) ) ( not ( = ?auto_123897 ?auto_123898 ) ) ( not ( = ?auto_123897 ?auto_123899 ) ) ( not ( = ?auto_123897 ?auto_123900 ) ) ( not ( = ?auto_123897 ?auto_123901 ) ) ( not ( = ?auto_123897 ?auto_123902 ) ) ( not ( = ?auto_123897 ?auto_123903 ) ) ( not ( = ?auto_123898 ?auto_123899 ) ) ( not ( = ?auto_123898 ?auto_123900 ) ) ( not ( = ?auto_123898 ?auto_123901 ) ) ( not ( = ?auto_123898 ?auto_123902 ) ) ( not ( = ?auto_123898 ?auto_123903 ) ) ( not ( = ?auto_123899 ?auto_123900 ) ) ( not ( = ?auto_123899 ?auto_123901 ) ) ( not ( = ?auto_123899 ?auto_123902 ) ) ( not ( = ?auto_123899 ?auto_123903 ) ) ( not ( = ?auto_123900 ?auto_123901 ) ) ( not ( = ?auto_123900 ?auto_123902 ) ) ( not ( = ?auto_123900 ?auto_123903 ) ) ( not ( = ?auto_123901 ?auto_123902 ) ) ( not ( = ?auto_123901 ?auto_123903 ) ) ( not ( = ?auto_123902 ?auto_123903 ) ) ( ON ?auto_123901 ?auto_123902 ) ( ON ?auto_123900 ?auto_123901 ) ( ON ?auto_123899 ?auto_123900 ) ( ON ?auto_123898 ?auto_123899 ) ( ON ?auto_123897 ?auto_123898 ) ( ON ?auto_123896 ?auto_123897 ) ( CLEAR ?auto_123894 ) ( ON ?auto_123895 ?auto_123896 ) ( CLEAR ?auto_123895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123892 ?auto_123893 ?auto_123894 ?auto_123895 )
      ( MAKE-11PILE ?auto_123892 ?auto_123893 ?auto_123894 ?auto_123895 ?auto_123896 ?auto_123897 ?auto_123898 ?auto_123899 ?auto_123900 ?auto_123901 ?auto_123902 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123915 - BLOCK
      ?auto_123916 - BLOCK
      ?auto_123917 - BLOCK
      ?auto_123918 - BLOCK
      ?auto_123919 - BLOCK
      ?auto_123920 - BLOCK
      ?auto_123921 - BLOCK
      ?auto_123922 - BLOCK
      ?auto_123923 - BLOCK
      ?auto_123924 - BLOCK
      ?auto_123925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123925 ) ( ON-TABLE ?auto_123915 ) ( ON ?auto_123916 ?auto_123915 ) ( ON ?auto_123917 ?auto_123916 ) ( not ( = ?auto_123915 ?auto_123916 ) ) ( not ( = ?auto_123915 ?auto_123917 ) ) ( not ( = ?auto_123915 ?auto_123918 ) ) ( not ( = ?auto_123915 ?auto_123919 ) ) ( not ( = ?auto_123915 ?auto_123920 ) ) ( not ( = ?auto_123915 ?auto_123921 ) ) ( not ( = ?auto_123915 ?auto_123922 ) ) ( not ( = ?auto_123915 ?auto_123923 ) ) ( not ( = ?auto_123915 ?auto_123924 ) ) ( not ( = ?auto_123915 ?auto_123925 ) ) ( not ( = ?auto_123916 ?auto_123917 ) ) ( not ( = ?auto_123916 ?auto_123918 ) ) ( not ( = ?auto_123916 ?auto_123919 ) ) ( not ( = ?auto_123916 ?auto_123920 ) ) ( not ( = ?auto_123916 ?auto_123921 ) ) ( not ( = ?auto_123916 ?auto_123922 ) ) ( not ( = ?auto_123916 ?auto_123923 ) ) ( not ( = ?auto_123916 ?auto_123924 ) ) ( not ( = ?auto_123916 ?auto_123925 ) ) ( not ( = ?auto_123917 ?auto_123918 ) ) ( not ( = ?auto_123917 ?auto_123919 ) ) ( not ( = ?auto_123917 ?auto_123920 ) ) ( not ( = ?auto_123917 ?auto_123921 ) ) ( not ( = ?auto_123917 ?auto_123922 ) ) ( not ( = ?auto_123917 ?auto_123923 ) ) ( not ( = ?auto_123917 ?auto_123924 ) ) ( not ( = ?auto_123917 ?auto_123925 ) ) ( not ( = ?auto_123918 ?auto_123919 ) ) ( not ( = ?auto_123918 ?auto_123920 ) ) ( not ( = ?auto_123918 ?auto_123921 ) ) ( not ( = ?auto_123918 ?auto_123922 ) ) ( not ( = ?auto_123918 ?auto_123923 ) ) ( not ( = ?auto_123918 ?auto_123924 ) ) ( not ( = ?auto_123918 ?auto_123925 ) ) ( not ( = ?auto_123919 ?auto_123920 ) ) ( not ( = ?auto_123919 ?auto_123921 ) ) ( not ( = ?auto_123919 ?auto_123922 ) ) ( not ( = ?auto_123919 ?auto_123923 ) ) ( not ( = ?auto_123919 ?auto_123924 ) ) ( not ( = ?auto_123919 ?auto_123925 ) ) ( not ( = ?auto_123920 ?auto_123921 ) ) ( not ( = ?auto_123920 ?auto_123922 ) ) ( not ( = ?auto_123920 ?auto_123923 ) ) ( not ( = ?auto_123920 ?auto_123924 ) ) ( not ( = ?auto_123920 ?auto_123925 ) ) ( not ( = ?auto_123921 ?auto_123922 ) ) ( not ( = ?auto_123921 ?auto_123923 ) ) ( not ( = ?auto_123921 ?auto_123924 ) ) ( not ( = ?auto_123921 ?auto_123925 ) ) ( not ( = ?auto_123922 ?auto_123923 ) ) ( not ( = ?auto_123922 ?auto_123924 ) ) ( not ( = ?auto_123922 ?auto_123925 ) ) ( not ( = ?auto_123923 ?auto_123924 ) ) ( not ( = ?auto_123923 ?auto_123925 ) ) ( not ( = ?auto_123924 ?auto_123925 ) ) ( ON ?auto_123924 ?auto_123925 ) ( ON ?auto_123923 ?auto_123924 ) ( ON ?auto_123922 ?auto_123923 ) ( ON ?auto_123921 ?auto_123922 ) ( ON ?auto_123920 ?auto_123921 ) ( ON ?auto_123919 ?auto_123920 ) ( CLEAR ?auto_123917 ) ( ON ?auto_123918 ?auto_123919 ) ( CLEAR ?auto_123918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123915 ?auto_123916 ?auto_123917 ?auto_123918 )
      ( MAKE-11PILE ?auto_123915 ?auto_123916 ?auto_123917 ?auto_123918 ?auto_123919 ?auto_123920 ?auto_123921 ?auto_123922 ?auto_123923 ?auto_123924 ?auto_123925 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123937 - BLOCK
      ?auto_123938 - BLOCK
      ?auto_123939 - BLOCK
      ?auto_123940 - BLOCK
      ?auto_123941 - BLOCK
      ?auto_123942 - BLOCK
      ?auto_123943 - BLOCK
      ?auto_123944 - BLOCK
      ?auto_123945 - BLOCK
      ?auto_123946 - BLOCK
      ?auto_123947 - BLOCK
    )
    :vars
    (
      ?auto_123948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123947 ?auto_123948 ) ( ON-TABLE ?auto_123937 ) ( ON ?auto_123938 ?auto_123937 ) ( not ( = ?auto_123937 ?auto_123938 ) ) ( not ( = ?auto_123937 ?auto_123939 ) ) ( not ( = ?auto_123937 ?auto_123940 ) ) ( not ( = ?auto_123937 ?auto_123941 ) ) ( not ( = ?auto_123937 ?auto_123942 ) ) ( not ( = ?auto_123937 ?auto_123943 ) ) ( not ( = ?auto_123937 ?auto_123944 ) ) ( not ( = ?auto_123937 ?auto_123945 ) ) ( not ( = ?auto_123937 ?auto_123946 ) ) ( not ( = ?auto_123937 ?auto_123947 ) ) ( not ( = ?auto_123937 ?auto_123948 ) ) ( not ( = ?auto_123938 ?auto_123939 ) ) ( not ( = ?auto_123938 ?auto_123940 ) ) ( not ( = ?auto_123938 ?auto_123941 ) ) ( not ( = ?auto_123938 ?auto_123942 ) ) ( not ( = ?auto_123938 ?auto_123943 ) ) ( not ( = ?auto_123938 ?auto_123944 ) ) ( not ( = ?auto_123938 ?auto_123945 ) ) ( not ( = ?auto_123938 ?auto_123946 ) ) ( not ( = ?auto_123938 ?auto_123947 ) ) ( not ( = ?auto_123938 ?auto_123948 ) ) ( not ( = ?auto_123939 ?auto_123940 ) ) ( not ( = ?auto_123939 ?auto_123941 ) ) ( not ( = ?auto_123939 ?auto_123942 ) ) ( not ( = ?auto_123939 ?auto_123943 ) ) ( not ( = ?auto_123939 ?auto_123944 ) ) ( not ( = ?auto_123939 ?auto_123945 ) ) ( not ( = ?auto_123939 ?auto_123946 ) ) ( not ( = ?auto_123939 ?auto_123947 ) ) ( not ( = ?auto_123939 ?auto_123948 ) ) ( not ( = ?auto_123940 ?auto_123941 ) ) ( not ( = ?auto_123940 ?auto_123942 ) ) ( not ( = ?auto_123940 ?auto_123943 ) ) ( not ( = ?auto_123940 ?auto_123944 ) ) ( not ( = ?auto_123940 ?auto_123945 ) ) ( not ( = ?auto_123940 ?auto_123946 ) ) ( not ( = ?auto_123940 ?auto_123947 ) ) ( not ( = ?auto_123940 ?auto_123948 ) ) ( not ( = ?auto_123941 ?auto_123942 ) ) ( not ( = ?auto_123941 ?auto_123943 ) ) ( not ( = ?auto_123941 ?auto_123944 ) ) ( not ( = ?auto_123941 ?auto_123945 ) ) ( not ( = ?auto_123941 ?auto_123946 ) ) ( not ( = ?auto_123941 ?auto_123947 ) ) ( not ( = ?auto_123941 ?auto_123948 ) ) ( not ( = ?auto_123942 ?auto_123943 ) ) ( not ( = ?auto_123942 ?auto_123944 ) ) ( not ( = ?auto_123942 ?auto_123945 ) ) ( not ( = ?auto_123942 ?auto_123946 ) ) ( not ( = ?auto_123942 ?auto_123947 ) ) ( not ( = ?auto_123942 ?auto_123948 ) ) ( not ( = ?auto_123943 ?auto_123944 ) ) ( not ( = ?auto_123943 ?auto_123945 ) ) ( not ( = ?auto_123943 ?auto_123946 ) ) ( not ( = ?auto_123943 ?auto_123947 ) ) ( not ( = ?auto_123943 ?auto_123948 ) ) ( not ( = ?auto_123944 ?auto_123945 ) ) ( not ( = ?auto_123944 ?auto_123946 ) ) ( not ( = ?auto_123944 ?auto_123947 ) ) ( not ( = ?auto_123944 ?auto_123948 ) ) ( not ( = ?auto_123945 ?auto_123946 ) ) ( not ( = ?auto_123945 ?auto_123947 ) ) ( not ( = ?auto_123945 ?auto_123948 ) ) ( not ( = ?auto_123946 ?auto_123947 ) ) ( not ( = ?auto_123946 ?auto_123948 ) ) ( not ( = ?auto_123947 ?auto_123948 ) ) ( ON ?auto_123946 ?auto_123947 ) ( ON ?auto_123945 ?auto_123946 ) ( ON ?auto_123944 ?auto_123945 ) ( ON ?auto_123943 ?auto_123944 ) ( ON ?auto_123942 ?auto_123943 ) ( ON ?auto_123941 ?auto_123942 ) ( ON ?auto_123940 ?auto_123941 ) ( CLEAR ?auto_123938 ) ( ON ?auto_123939 ?auto_123940 ) ( CLEAR ?auto_123939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123937 ?auto_123938 ?auto_123939 )
      ( MAKE-11PILE ?auto_123937 ?auto_123938 ?auto_123939 ?auto_123940 ?auto_123941 ?auto_123942 ?auto_123943 ?auto_123944 ?auto_123945 ?auto_123946 ?auto_123947 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123960 - BLOCK
      ?auto_123961 - BLOCK
      ?auto_123962 - BLOCK
      ?auto_123963 - BLOCK
      ?auto_123964 - BLOCK
      ?auto_123965 - BLOCK
      ?auto_123966 - BLOCK
      ?auto_123967 - BLOCK
      ?auto_123968 - BLOCK
      ?auto_123969 - BLOCK
      ?auto_123970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123970 ) ( ON-TABLE ?auto_123960 ) ( ON ?auto_123961 ?auto_123960 ) ( not ( = ?auto_123960 ?auto_123961 ) ) ( not ( = ?auto_123960 ?auto_123962 ) ) ( not ( = ?auto_123960 ?auto_123963 ) ) ( not ( = ?auto_123960 ?auto_123964 ) ) ( not ( = ?auto_123960 ?auto_123965 ) ) ( not ( = ?auto_123960 ?auto_123966 ) ) ( not ( = ?auto_123960 ?auto_123967 ) ) ( not ( = ?auto_123960 ?auto_123968 ) ) ( not ( = ?auto_123960 ?auto_123969 ) ) ( not ( = ?auto_123960 ?auto_123970 ) ) ( not ( = ?auto_123961 ?auto_123962 ) ) ( not ( = ?auto_123961 ?auto_123963 ) ) ( not ( = ?auto_123961 ?auto_123964 ) ) ( not ( = ?auto_123961 ?auto_123965 ) ) ( not ( = ?auto_123961 ?auto_123966 ) ) ( not ( = ?auto_123961 ?auto_123967 ) ) ( not ( = ?auto_123961 ?auto_123968 ) ) ( not ( = ?auto_123961 ?auto_123969 ) ) ( not ( = ?auto_123961 ?auto_123970 ) ) ( not ( = ?auto_123962 ?auto_123963 ) ) ( not ( = ?auto_123962 ?auto_123964 ) ) ( not ( = ?auto_123962 ?auto_123965 ) ) ( not ( = ?auto_123962 ?auto_123966 ) ) ( not ( = ?auto_123962 ?auto_123967 ) ) ( not ( = ?auto_123962 ?auto_123968 ) ) ( not ( = ?auto_123962 ?auto_123969 ) ) ( not ( = ?auto_123962 ?auto_123970 ) ) ( not ( = ?auto_123963 ?auto_123964 ) ) ( not ( = ?auto_123963 ?auto_123965 ) ) ( not ( = ?auto_123963 ?auto_123966 ) ) ( not ( = ?auto_123963 ?auto_123967 ) ) ( not ( = ?auto_123963 ?auto_123968 ) ) ( not ( = ?auto_123963 ?auto_123969 ) ) ( not ( = ?auto_123963 ?auto_123970 ) ) ( not ( = ?auto_123964 ?auto_123965 ) ) ( not ( = ?auto_123964 ?auto_123966 ) ) ( not ( = ?auto_123964 ?auto_123967 ) ) ( not ( = ?auto_123964 ?auto_123968 ) ) ( not ( = ?auto_123964 ?auto_123969 ) ) ( not ( = ?auto_123964 ?auto_123970 ) ) ( not ( = ?auto_123965 ?auto_123966 ) ) ( not ( = ?auto_123965 ?auto_123967 ) ) ( not ( = ?auto_123965 ?auto_123968 ) ) ( not ( = ?auto_123965 ?auto_123969 ) ) ( not ( = ?auto_123965 ?auto_123970 ) ) ( not ( = ?auto_123966 ?auto_123967 ) ) ( not ( = ?auto_123966 ?auto_123968 ) ) ( not ( = ?auto_123966 ?auto_123969 ) ) ( not ( = ?auto_123966 ?auto_123970 ) ) ( not ( = ?auto_123967 ?auto_123968 ) ) ( not ( = ?auto_123967 ?auto_123969 ) ) ( not ( = ?auto_123967 ?auto_123970 ) ) ( not ( = ?auto_123968 ?auto_123969 ) ) ( not ( = ?auto_123968 ?auto_123970 ) ) ( not ( = ?auto_123969 ?auto_123970 ) ) ( ON ?auto_123969 ?auto_123970 ) ( ON ?auto_123968 ?auto_123969 ) ( ON ?auto_123967 ?auto_123968 ) ( ON ?auto_123966 ?auto_123967 ) ( ON ?auto_123965 ?auto_123966 ) ( ON ?auto_123964 ?auto_123965 ) ( ON ?auto_123963 ?auto_123964 ) ( CLEAR ?auto_123961 ) ( ON ?auto_123962 ?auto_123963 ) ( CLEAR ?auto_123962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123960 ?auto_123961 ?auto_123962 )
      ( MAKE-11PILE ?auto_123960 ?auto_123961 ?auto_123962 ?auto_123963 ?auto_123964 ?auto_123965 ?auto_123966 ?auto_123967 ?auto_123968 ?auto_123969 ?auto_123970 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_123982 - BLOCK
      ?auto_123983 - BLOCK
      ?auto_123984 - BLOCK
      ?auto_123985 - BLOCK
      ?auto_123986 - BLOCK
      ?auto_123987 - BLOCK
      ?auto_123988 - BLOCK
      ?auto_123989 - BLOCK
      ?auto_123990 - BLOCK
      ?auto_123991 - BLOCK
      ?auto_123992 - BLOCK
    )
    :vars
    (
      ?auto_123993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123992 ?auto_123993 ) ( ON-TABLE ?auto_123982 ) ( not ( = ?auto_123982 ?auto_123983 ) ) ( not ( = ?auto_123982 ?auto_123984 ) ) ( not ( = ?auto_123982 ?auto_123985 ) ) ( not ( = ?auto_123982 ?auto_123986 ) ) ( not ( = ?auto_123982 ?auto_123987 ) ) ( not ( = ?auto_123982 ?auto_123988 ) ) ( not ( = ?auto_123982 ?auto_123989 ) ) ( not ( = ?auto_123982 ?auto_123990 ) ) ( not ( = ?auto_123982 ?auto_123991 ) ) ( not ( = ?auto_123982 ?auto_123992 ) ) ( not ( = ?auto_123982 ?auto_123993 ) ) ( not ( = ?auto_123983 ?auto_123984 ) ) ( not ( = ?auto_123983 ?auto_123985 ) ) ( not ( = ?auto_123983 ?auto_123986 ) ) ( not ( = ?auto_123983 ?auto_123987 ) ) ( not ( = ?auto_123983 ?auto_123988 ) ) ( not ( = ?auto_123983 ?auto_123989 ) ) ( not ( = ?auto_123983 ?auto_123990 ) ) ( not ( = ?auto_123983 ?auto_123991 ) ) ( not ( = ?auto_123983 ?auto_123992 ) ) ( not ( = ?auto_123983 ?auto_123993 ) ) ( not ( = ?auto_123984 ?auto_123985 ) ) ( not ( = ?auto_123984 ?auto_123986 ) ) ( not ( = ?auto_123984 ?auto_123987 ) ) ( not ( = ?auto_123984 ?auto_123988 ) ) ( not ( = ?auto_123984 ?auto_123989 ) ) ( not ( = ?auto_123984 ?auto_123990 ) ) ( not ( = ?auto_123984 ?auto_123991 ) ) ( not ( = ?auto_123984 ?auto_123992 ) ) ( not ( = ?auto_123984 ?auto_123993 ) ) ( not ( = ?auto_123985 ?auto_123986 ) ) ( not ( = ?auto_123985 ?auto_123987 ) ) ( not ( = ?auto_123985 ?auto_123988 ) ) ( not ( = ?auto_123985 ?auto_123989 ) ) ( not ( = ?auto_123985 ?auto_123990 ) ) ( not ( = ?auto_123985 ?auto_123991 ) ) ( not ( = ?auto_123985 ?auto_123992 ) ) ( not ( = ?auto_123985 ?auto_123993 ) ) ( not ( = ?auto_123986 ?auto_123987 ) ) ( not ( = ?auto_123986 ?auto_123988 ) ) ( not ( = ?auto_123986 ?auto_123989 ) ) ( not ( = ?auto_123986 ?auto_123990 ) ) ( not ( = ?auto_123986 ?auto_123991 ) ) ( not ( = ?auto_123986 ?auto_123992 ) ) ( not ( = ?auto_123986 ?auto_123993 ) ) ( not ( = ?auto_123987 ?auto_123988 ) ) ( not ( = ?auto_123987 ?auto_123989 ) ) ( not ( = ?auto_123987 ?auto_123990 ) ) ( not ( = ?auto_123987 ?auto_123991 ) ) ( not ( = ?auto_123987 ?auto_123992 ) ) ( not ( = ?auto_123987 ?auto_123993 ) ) ( not ( = ?auto_123988 ?auto_123989 ) ) ( not ( = ?auto_123988 ?auto_123990 ) ) ( not ( = ?auto_123988 ?auto_123991 ) ) ( not ( = ?auto_123988 ?auto_123992 ) ) ( not ( = ?auto_123988 ?auto_123993 ) ) ( not ( = ?auto_123989 ?auto_123990 ) ) ( not ( = ?auto_123989 ?auto_123991 ) ) ( not ( = ?auto_123989 ?auto_123992 ) ) ( not ( = ?auto_123989 ?auto_123993 ) ) ( not ( = ?auto_123990 ?auto_123991 ) ) ( not ( = ?auto_123990 ?auto_123992 ) ) ( not ( = ?auto_123990 ?auto_123993 ) ) ( not ( = ?auto_123991 ?auto_123992 ) ) ( not ( = ?auto_123991 ?auto_123993 ) ) ( not ( = ?auto_123992 ?auto_123993 ) ) ( ON ?auto_123991 ?auto_123992 ) ( ON ?auto_123990 ?auto_123991 ) ( ON ?auto_123989 ?auto_123990 ) ( ON ?auto_123988 ?auto_123989 ) ( ON ?auto_123987 ?auto_123988 ) ( ON ?auto_123986 ?auto_123987 ) ( ON ?auto_123985 ?auto_123986 ) ( ON ?auto_123984 ?auto_123985 ) ( CLEAR ?auto_123982 ) ( ON ?auto_123983 ?auto_123984 ) ( CLEAR ?auto_123983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123982 ?auto_123983 )
      ( MAKE-11PILE ?auto_123982 ?auto_123983 ?auto_123984 ?auto_123985 ?auto_123986 ?auto_123987 ?auto_123988 ?auto_123989 ?auto_123990 ?auto_123991 ?auto_123992 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_124005 - BLOCK
      ?auto_124006 - BLOCK
      ?auto_124007 - BLOCK
      ?auto_124008 - BLOCK
      ?auto_124009 - BLOCK
      ?auto_124010 - BLOCK
      ?auto_124011 - BLOCK
      ?auto_124012 - BLOCK
      ?auto_124013 - BLOCK
      ?auto_124014 - BLOCK
      ?auto_124015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124015 ) ( ON-TABLE ?auto_124005 ) ( not ( = ?auto_124005 ?auto_124006 ) ) ( not ( = ?auto_124005 ?auto_124007 ) ) ( not ( = ?auto_124005 ?auto_124008 ) ) ( not ( = ?auto_124005 ?auto_124009 ) ) ( not ( = ?auto_124005 ?auto_124010 ) ) ( not ( = ?auto_124005 ?auto_124011 ) ) ( not ( = ?auto_124005 ?auto_124012 ) ) ( not ( = ?auto_124005 ?auto_124013 ) ) ( not ( = ?auto_124005 ?auto_124014 ) ) ( not ( = ?auto_124005 ?auto_124015 ) ) ( not ( = ?auto_124006 ?auto_124007 ) ) ( not ( = ?auto_124006 ?auto_124008 ) ) ( not ( = ?auto_124006 ?auto_124009 ) ) ( not ( = ?auto_124006 ?auto_124010 ) ) ( not ( = ?auto_124006 ?auto_124011 ) ) ( not ( = ?auto_124006 ?auto_124012 ) ) ( not ( = ?auto_124006 ?auto_124013 ) ) ( not ( = ?auto_124006 ?auto_124014 ) ) ( not ( = ?auto_124006 ?auto_124015 ) ) ( not ( = ?auto_124007 ?auto_124008 ) ) ( not ( = ?auto_124007 ?auto_124009 ) ) ( not ( = ?auto_124007 ?auto_124010 ) ) ( not ( = ?auto_124007 ?auto_124011 ) ) ( not ( = ?auto_124007 ?auto_124012 ) ) ( not ( = ?auto_124007 ?auto_124013 ) ) ( not ( = ?auto_124007 ?auto_124014 ) ) ( not ( = ?auto_124007 ?auto_124015 ) ) ( not ( = ?auto_124008 ?auto_124009 ) ) ( not ( = ?auto_124008 ?auto_124010 ) ) ( not ( = ?auto_124008 ?auto_124011 ) ) ( not ( = ?auto_124008 ?auto_124012 ) ) ( not ( = ?auto_124008 ?auto_124013 ) ) ( not ( = ?auto_124008 ?auto_124014 ) ) ( not ( = ?auto_124008 ?auto_124015 ) ) ( not ( = ?auto_124009 ?auto_124010 ) ) ( not ( = ?auto_124009 ?auto_124011 ) ) ( not ( = ?auto_124009 ?auto_124012 ) ) ( not ( = ?auto_124009 ?auto_124013 ) ) ( not ( = ?auto_124009 ?auto_124014 ) ) ( not ( = ?auto_124009 ?auto_124015 ) ) ( not ( = ?auto_124010 ?auto_124011 ) ) ( not ( = ?auto_124010 ?auto_124012 ) ) ( not ( = ?auto_124010 ?auto_124013 ) ) ( not ( = ?auto_124010 ?auto_124014 ) ) ( not ( = ?auto_124010 ?auto_124015 ) ) ( not ( = ?auto_124011 ?auto_124012 ) ) ( not ( = ?auto_124011 ?auto_124013 ) ) ( not ( = ?auto_124011 ?auto_124014 ) ) ( not ( = ?auto_124011 ?auto_124015 ) ) ( not ( = ?auto_124012 ?auto_124013 ) ) ( not ( = ?auto_124012 ?auto_124014 ) ) ( not ( = ?auto_124012 ?auto_124015 ) ) ( not ( = ?auto_124013 ?auto_124014 ) ) ( not ( = ?auto_124013 ?auto_124015 ) ) ( not ( = ?auto_124014 ?auto_124015 ) ) ( ON ?auto_124014 ?auto_124015 ) ( ON ?auto_124013 ?auto_124014 ) ( ON ?auto_124012 ?auto_124013 ) ( ON ?auto_124011 ?auto_124012 ) ( ON ?auto_124010 ?auto_124011 ) ( ON ?auto_124009 ?auto_124010 ) ( ON ?auto_124008 ?auto_124009 ) ( ON ?auto_124007 ?auto_124008 ) ( CLEAR ?auto_124005 ) ( ON ?auto_124006 ?auto_124007 ) ( CLEAR ?auto_124006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124005 ?auto_124006 )
      ( MAKE-11PILE ?auto_124005 ?auto_124006 ?auto_124007 ?auto_124008 ?auto_124009 ?auto_124010 ?auto_124011 ?auto_124012 ?auto_124013 ?auto_124014 ?auto_124015 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_124027 - BLOCK
      ?auto_124028 - BLOCK
      ?auto_124029 - BLOCK
      ?auto_124030 - BLOCK
      ?auto_124031 - BLOCK
      ?auto_124032 - BLOCK
      ?auto_124033 - BLOCK
      ?auto_124034 - BLOCK
      ?auto_124035 - BLOCK
      ?auto_124036 - BLOCK
      ?auto_124037 - BLOCK
    )
    :vars
    (
      ?auto_124038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124037 ?auto_124038 ) ( not ( = ?auto_124027 ?auto_124028 ) ) ( not ( = ?auto_124027 ?auto_124029 ) ) ( not ( = ?auto_124027 ?auto_124030 ) ) ( not ( = ?auto_124027 ?auto_124031 ) ) ( not ( = ?auto_124027 ?auto_124032 ) ) ( not ( = ?auto_124027 ?auto_124033 ) ) ( not ( = ?auto_124027 ?auto_124034 ) ) ( not ( = ?auto_124027 ?auto_124035 ) ) ( not ( = ?auto_124027 ?auto_124036 ) ) ( not ( = ?auto_124027 ?auto_124037 ) ) ( not ( = ?auto_124027 ?auto_124038 ) ) ( not ( = ?auto_124028 ?auto_124029 ) ) ( not ( = ?auto_124028 ?auto_124030 ) ) ( not ( = ?auto_124028 ?auto_124031 ) ) ( not ( = ?auto_124028 ?auto_124032 ) ) ( not ( = ?auto_124028 ?auto_124033 ) ) ( not ( = ?auto_124028 ?auto_124034 ) ) ( not ( = ?auto_124028 ?auto_124035 ) ) ( not ( = ?auto_124028 ?auto_124036 ) ) ( not ( = ?auto_124028 ?auto_124037 ) ) ( not ( = ?auto_124028 ?auto_124038 ) ) ( not ( = ?auto_124029 ?auto_124030 ) ) ( not ( = ?auto_124029 ?auto_124031 ) ) ( not ( = ?auto_124029 ?auto_124032 ) ) ( not ( = ?auto_124029 ?auto_124033 ) ) ( not ( = ?auto_124029 ?auto_124034 ) ) ( not ( = ?auto_124029 ?auto_124035 ) ) ( not ( = ?auto_124029 ?auto_124036 ) ) ( not ( = ?auto_124029 ?auto_124037 ) ) ( not ( = ?auto_124029 ?auto_124038 ) ) ( not ( = ?auto_124030 ?auto_124031 ) ) ( not ( = ?auto_124030 ?auto_124032 ) ) ( not ( = ?auto_124030 ?auto_124033 ) ) ( not ( = ?auto_124030 ?auto_124034 ) ) ( not ( = ?auto_124030 ?auto_124035 ) ) ( not ( = ?auto_124030 ?auto_124036 ) ) ( not ( = ?auto_124030 ?auto_124037 ) ) ( not ( = ?auto_124030 ?auto_124038 ) ) ( not ( = ?auto_124031 ?auto_124032 ) ) ( not ( = ?auto_124031 ?auto_124033 ) ) ( not ( = ?auto_124031 ?auto_124034 ) ) ( not ( = ?auto_124031 ?auto_124035 ) ) ( not ( = ?auto_124031 ?auto_124036 ) ) ( not ( = ?auto_124031 ?auto_124037 ) ) ( not ( = ?auto_124031 ?auto_124038 ) ) ( not ( = ?auto_124032 ?auto_124033 ) ) ( not ( = ?auto_124032 ?auto_124034 ) ) ( not ( = ?auto_124032 ?auto_124035 ) ) ( not ( = ?auto_124032 ?auto_124036 ) ) ( not ( = ?auto_124032 ?auto_124037 ) ) ( not ( = ?auto_124032 ?auto_124038 ) ) ( not ( = ?auto_124033 ?auto_124034 ) ) ( not ( = ?auto_124033 ?auto_124035 ) ) ( not ( = ?auto_124033 ?auto_124036 ) ) ( not ( = ?auto_124033 ?auto_124037 ) ) ( not ( = ?auto_124033 ?auto_124038 ) ) ( not ( = ?auto_124034 ?auto_124035 ) ) ( not ( = ?auto_124034 ?auto_124036 ) ) ( not ( = ?auto_124034 ?auto_124037 ) ) ( not ( = ?auto_124034 ?auto_124038 ) ) ( not ( = ?auto_124035 ?auto_124036 ) ) ( not ( = ?auto_124035 ?auto_124037 ) ) ( not ( = ?auto_124035 ?auto_124038 ) ) ( not ( = ?auto_124036 ?auto_124037 ) ) ( not ( = ?auto_124036 ?auto_124038 ) ) ( not ( = ?auto_124037 ?auto_124038 ) ) ( ON ?auto_124036 ?auto_124037 ) ( ON ?auto_124035 ?auto_124036 ) ( ON ?auto_124034 ?auto_124035 ) ( ON ?auto_124033 ?auto_124034 ) ( ON ?auto_124032 ?auto_124033 ) ( ON ?auto_124031 ?auto_124032 ) ( ON ?auto_124030 ?auto_124031 ) ( ON ?auto_124029 ?auto_124030 ) ( ON ?auto_124028 ?auto_124029 ) ( ON ?auto_124027 ?auto_124028 ) ( CLEAR ?auto_124027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124027 )
      ( MAKE-11PILE ?auto_124027 ?auto_124028 ?auto_124029 ?auto_124030 ?auto_124031 ?auto_124032 ?auto_124033 ?auto_124034 ?auto_124035 ?auto_124036 ?auto_124037 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_124050 - BLOCK
      ?auto_124051 - BLOCK
      ?auto_124052 - BLOCK
      ?auto_124053 - BLOCK
      ?auto_124054 - BLOCK
      ?auto_124055 - BLOCK
      ?auto_124056 - BLOCK
      ?auto_124057 - BLOCK
      ?auto_124058 - BLOCK
      ?auto_124059 - BLOCK
      ?auto_124060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124060 ) ( not ( = ?auto_124050 ?auto_124051 ) ) ( not ( = ?auto_124050 ?auto_124052 ) ) ( not ( = ?auto_124050 ?auto_124053 ) ) ( not ( = ?auto_124050 ?auto_124054 ) ) ( not ( = ?auto_124050 ?auto_124055 ) ) ( not ( = ?auto_124050 ?auto_124056 ) ) ( not ( = ?auto_124050 ?auto_124057 ) ) ( not ( = ?auto_124050 ?auto_124058 ) ) ( not ( = ?auto_124050 ?auto_124059 ) ) ( not ( = ?auto_124050 ?auto_124060 ) ) ( not ( = ?auto_124051 ?auto_124052 ) ) ( not ( = ?auto_124051 ?auto_124053 ) ) ( not ( = ?auto_124051 ?auto_124054 ) ) ( not ( = ?auto_124051 ?auto_124055 ) ) ( not ( = ?auto_124051 ?auto_124056 ) ) ( not ( = ?auto_124051 ?auto_124057 ) ) ( not ( = ?auto_124051 ?auto_124058 ) ) ( not ( = ?auto_124051 ?auto_124059 ) ) ( not ( = ?auto_124051 ?auto_124060 ) ) ( not ( = ?auto_124052 ?auto_124053 ) ) ( not ( = ?auto_124052 ?auto_124054 ) ) ( not ( = ?auto_124052 ?auto_124055 ) ) ( not ( = ?auto_124052 ?auto_124056 ) ) ( not ( = ?auto_124052 ?auto_124057 ) ) ( not ( = ?auto_124052 ?auto_124058 ) ) ( not ( = ?auto_124052 ?auto_124059 ) ) ( not ( = ?auto_124052 ?auto_124060 ) ) ( not ( = ?auto_124053 ?auto_124054 ) ) ( not ( = ?auto_124053 ?auto_124055 ) ) ( not ( = ?auto_124053 ?auto_124056 ) ) ( not ( = ?auto_124053 ?auto_124057 ) ) ( not ( = ?auto_124053 ?auto_124058 ) ) ( not ( = ?auto_124053 ?auto_124059 ) ) ( not ( = ?auto_124053 ?auto_124060 ) ) ( not ( = ?auto_124054 ?auto_124055 ) ) ( not ( = ?auto_124054 ?auto_124056 ) ) ( not ( = ?auto_124054 ?auto_124057 ) ) ( not ( = ?auto_124054 ?auto_124058 ) ) ( not ( = ?auto_124054 ?auto_124059 ) ) ( not ( = ?auto_124054 ?auto_124060 ) ) ( not ( = ?auto_124055 ?auto_124056 ) ) ( not ( = ?auto_124055 ?auto_124057 ) ) ( not ( = ?auto_124055 ?auto_124058 ) ) ( not ( = ?auto_124055 ?auto_124059 ) ) ( not ( = ?auto_124055 ?auto_124060 ) ) ( not ( = ?auto_124056 ?auto_124057 ) ) ( not ( = ?auto_124056 ?auto_124058 ) ) ( not ( = ?auto_124056 ?auto_124059 ) ) ( not ( = ?auto_124056 ?auto_124060 ) ) ( not ( = ?auto_124057 ?auto_124058 ) ) ( not ( = ?auto_124057 ?auto_124059 ) ) ( not ( = ?auto_124057 ?auto_124060 ) ) ( not ( = ?auto_124058 ?auto_124059 ) ) ( not ( = ?auto_124058 ?auto_124060 ) ) ( not ( = ?auto_124059 ?auto_124060 ) ) ( ON ?auto_124059 ?auto_124060 ) ( ON ?auto_124058 ?auto_124059 ) ( ON ?auto_124057 ?auto_124058 ) ( ON ?auto_124056 ?auto_124057 ) ( ON ?auto_124055 ?auto_124056 ) ( ON ?auto_124054 ?auto_124055 ) ( ON ?auto_124053 ?auto_124054 ) ( ON ?auto_124052 ?auto_124053 ) ( ON ?auto_124051 ?auto_124052 ) ( ON ?auto_124050 ?auto_124051 ) ( CLEAR ?auto_124050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124050 )
      ( MAKE-11PILE ?auto_124050 ?auto_124051 ?auto_124052 ?auto_124053 ?auto_124054 ?auto_124055 ?auto_124056 ?auto_124057 ?auto_124058 ?auto_124059 ?auto_124060 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_124072 - BLOCK
      ?auto_124073 - BLOCK
      ?auto_124074 - BLOCK
      ?auto_124075 - BLOCK
      ?auto_124076 - BLOCK
      ?auto_124077 - BLOCK
      ?auto_124078 - BLOCK
      ?auto_124079 - BLOCK
      ?auto_124080 - BLOCK
      ?auto_124081 - BLOCK
      ?auto_124082 - BLOCK
    )
    :vars
    (
      ?auto_124083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124072 ?auto_124073 ) ) ( not ( = ?auto_124072 ?auto_124074 ) ) ( not ( = ?auto_124072 ?auto_124075 ) ) ( not ( = ?auto_124072 ?auto_124076 ) ) ( not ( = ?auto_124072 ?auto_124077 ) ) ( not ( = ?auto_124072 ?auto_124078 ) ) ( not ( = ?auto_124072 ?auto_124079 ) ) ( not ( = ?auto_124072 ?auto_124080 ) ) ( not ( = ?auto_124072 ?auto_124081 ) ) ( not ( = ?auto_124072 ?auto_124082 ) ) ( not ( = ?auto_124073 ?auto_124074 ) ) ( not ( = ?auto_124073 ?auto_124075 ) ) ( not ( = ?auto_124073 ?auto_124076 ) ) ( not ( = ?auto_124073 ?auto_124077 ) ) ( not ( = ?auto_124073 ?auto_124078 ) ) ( not ( = ?auto_124073 ?auto_124079 ) ) ( not ( = ?auto_124073 ?auto_124080 ) ) ( not ( = ?auto_124073 ?auto_124081 ) ) ( not ( = ?auto_124073 ?auto_124082 ) ) ( not ( = ?auto_124074 ?auto_124075 ) ) ( not ( = ?auto_124074 ?auto_124076 ) ) ( not ( = ?auto_124074 ?auto_124077 ) ) ( not ( = ?auto_124074 ?auto_124078 ) ) ( not ( = ?auto_124074 ?auto_124079 ) ) ( not ( = ?auto_124074 ?auto_124080 ) ) ( not ( = ?auto_124074 ?auto_124081 ) ) ( not ( = ?auto_124074 ?auto_124082 ) ) ( not ( = ?auto_124075 ?auto_124076 ) ) ( not ( = ?auto_124075 ?auto_124077 ) ) ( not ( = ?auto_124075 ?auto_124078 ) ) ( not ( = ?auto_124075 ?auto_124079 ) ) ( not ( = ?auto_124075 ?auto_124080 ) ) ( not ( = ?auto_124075 ?auto_124081 ) ) ( not ( = ?auto_124075 ?auto_124082 ) ) ( not ( = ?auto_124076 ?auto_124077 ) ) ( not ( = ?auto_124076 ?auto_124078 ) ) ( not ( = ?auto_124076 ?auto_124079 ) ) ( not ( = ?auto_124076 ?auto_124080 ) ) ( not ( = ?auto_124076 ?auto_124081 ) ) ( not ( = ?auto_124076 ?auto_124082 ) ) ( not ( = ?auto_124077 ?auto_124078 ) ) ( not ( = ?auto_124077 ?auto_124079 ) ) ( not ( = ?auto_124077 ?auto_124080 ) ) ( not ( = ?auto_124077 ?auto_124081 ) ) ( not ( = ?auto_124077 ?auto_124082 ) ) ( not ( = ?auto_124078 ?auto_124079 ) ) ( not ( = ?auto_124078 ?auto_124080 ) ) ( not ( = ?auto_124078 ?auto_124081 ) ) ( not ( = ?auto_124078 ?auto_124082 ) ) ( not ( = ?auto_124079 ?auto_124080 ) ) ( not ( = ?auto_124079 ?auto_124081 ) ) ( not ( = ?auto_124079 ?auto_124082 ) ) ( not ( = ?auto_124080 ?auto_124081 ) ) ( not ( = ?auto_124080 ?auto_124082 ) ) ( not ( = ?auto_124081 ?auto_124082 ) ) ( ON ?auto_124072 ?auto_124083 ) ( not ( = ?auto_124082 ?auto_124083 ) ) ( not ( = ?auto_124081 ?auto_124083 ) ) ( not ( = ?auto_124080 ?auto_124083 ) ) ( not ( = ?auto_124079 ?auto_124083 ) ) ( not ( = ?auto_124078 ?auto_124083 ) ) ( not ( = ?auto_124077 ?auto_124083 ) ) ( not ( = ?auto_124076 ?auto_124083 ) ) ( not ( = ?auto_124075 ?auto_124083 ) ) ( not ( = ?auto_124074 ?auto_124083 ) ) ( not ( = ?auto_124073 ?auto_124083 ) ) ( not ( = ?auto_124072 ?auto_124083 ) ) ( ON ?auto_124073 ?auto_124072 ) ( ON ?auto_124074 ?auto_124073 ) ( ON ?auto_124075 ?auto_124074 ) ( ON ?auto_124076 ?auto_124075 ) ( ON ?auto_124077 ?auto_124076 ) ( ON ?auto_124078 ?auto_124077 ) ( ON ?auto_124079 ?auto_124078 ) ( ON ?auto_124080 ?auto_124079 ) ( ON ?auto_124081 ?auto_124080 ) ( ON ?auto_124082 ?auto_124081 ) ( CLEAR ?auto_124082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_124082 ?auto_124081 ?auto_124080 ?auto_124079 ?auto_124078 ?auto_124077 ?auto_124076 ?auto_124075 ?auto_124074 ?auto_124073 ?auto_124072 )
      ( MAKE-11PILE ?auto_124072 ?auto_124073 ?auto_124074 ?auto_124075 ?auto_124076 ?auto_124077 ?auto_124078 ?auto_124079 ?auto_124080 ?auto_124081 ?auto_124082 ) )
  )

)

