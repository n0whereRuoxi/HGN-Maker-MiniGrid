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
      ?auto_533944 - BLOCK
    )
    :vars
    (
      ?auto_533945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533944 ?auto_533945 ) ( CLEAR ?auto_533944 ) ( HAND-EMPTY ) ( not ( = ?auto_533944 ?auto_533945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_533944 ?auto_533945 )
      ( !PUTDOWN ?auto_533944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_533951 - BLOCK
      ?auto_533952 - BLOCK
    )
    :vars
    (
      ?auto_533953 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_533951 ) ( ON ?auto_533952 ?auto_533953 ) ( CLEAR ?auto_533952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_533951 ) ( not ( = ?auto_533951 ?auto_533952 ) ) ( not ( = ?auto_533951 ?auto_533953 ) ) ( not ( = ?auto_533952 ?auto_533953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_533952 ?auto_533953 )
      ( !STACK ?auto_533952 ?auto_533951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_533961 - BLOCK
      ?auto_533962 - BLOCK
    )
    :vars
    (
      ?auto_533963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533962 ?auto_533963 ) ( not ( = ?auto_533961 ?auto_533962 ) ) ( not ( = ?auto_533961 ?auto_533963 ) ) ( not ( = ?auto_533962 ?auto_533963 ) ) ( ON ?auto_533961 ?auto_533962 ) ( CLEAR ?auto_533961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_533961 )
      ( MAKE-2PILE ?auto_533961 ?auto_533962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_533972 - BLOCK
      ?auto_533973 - BLOCK
      ?auto_533974 - BLOCK
    )
    :vars
    (
      ?auto_533975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_533973 ) ( ON ?auto_533974 ?auto_533975 ) ( CLEAR ?auto_533974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_533972 ) ( ON ?auto_533973 ?auto_533972 ) ( not ( = ?auto_533972 ?auto_533973 ) ) ( not ( = ?auto_533972 ?auto_533974 ) ) ( not ( = ?auto_533972 ?auto_533975 ) ) ( not ( = ?auto_533973 ?auto_533974 ) ) ( not ( = ?auto_533973 ?auto_533975 ) ) ( not ( = ?auto_533974 ?auto_533975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_533974 ?auto_533975 )
      ( !STACK ?auto_533974 ?auto_533973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_533986 - BLOCK
      ?auto_533987 - BLOCK
      ?auto_533988 - BLOCK
    )
    :vars
    (
      ?auto_533989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533988 ?auto_533989 ) ( ON-TABLE ?auto_533986 ) ( not ( = ?auto_533986 ?auto_533987 ) ) ( not ( = ?auto_533986 ?auto_533988 ) ) ( not ( = ?auto_533986 ?auto_533989 ) ) ( not ( = ?auto_533987 ?auto_533988 ) ) ( not ( = ?auto_533987 ?auto_533989 ) ) ( not ( = ?auto_533988 ?auto_533989 ) ) ( CLEAR ?auto_533986 ) ( ON ?auto_533987 ?auto_533988 ) ( CLEAR ?auto_533987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_533986 ?auto_533987 )
      ( MAKE-3PILE ?auto_533986 ?auto_533987 ?auto_533988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_534000 - BLOCK
      ?auto_534001 - BLOCK
      ?auto_534002 - BLOCK
    )
    :vars
    (
      ?auto_534003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534002 ?auto_534003 ) ( not ( = ?auto_534000 ?auto_534001 ) ) ( not ( = ?auto_534000 ?auto_534002 ) ) ( not ( = ?auto_534000 ?auto_534003 ) ) ( not ( = ?auto_534001 ?auto_534002 ) ) ( not ( = ?auto_534001 ?auto_534003 ) ) ( not ( = ?auto_534002 ?auto_534003 ) ) ( ON ?auto_534001 ?auto_534002 ) ( ON ?auto_534000 ?auto_534001 ) ( CLEAR ?auto_534000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534000 )
      ( MAKE-3PILE ?auto_534000 ?auto_534001 ?auto_534002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_534015 - BLOCK
      ?auto_534016 - BLOCK
      ?auto_534017 - BLOCK
      ?auto_534018 - BLOCK
    )
    :vars
    (
      ?auto_534019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534017 ) ( ON ?auto_534018 ?auto_534019 ) ( CLEAR ?auto_534018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534015 ) ( ON ?auto_534016 ?auto_534015 ) ( ON ?auto_534017 ?auto_534016 ) ( not ( = ?auto_534015 ?auto_534016 ) ) ( not ( = ?auto_534015 ?auto_534017 ) ) ( not ( = ?auto_534015 ?auto_534018 ) ) ( not ( = ?auto_534015 ?auto_534019 ) ) ( not ( = ?auto_534016 ?auto_534017 ) ) ( not ( = ?auto_534016 ?auto_534018 ) ) ( not ( = ?auto_534016 ?auto_534019 ) ) ( not ( = ?auto_534017 ?auto_534018 ) ) ( not ( = ?auto_534017 ?auto_534019 ) ) ( not ( = ?auto_534018 ?auto_534019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534018 ?auto_534019 )
      ( !STACK ?auto_534018 ?auto_534017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_534033 - BLOCK
      ?auto_534034 - BLOCK
      ?auto_534035 - BLOCK
      ?auto_534036 - BLOCK
    )
    :vars
    (
      ?auto_534037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534036 ?auto_534037 ) ( ON-TABLE ?auto_534033 ) ( ON ?auto_534034 ?auto_534033 ) ( not ( = ?auto_534033 ?auto_534034 ) ) ( not ( = ?auto_534033 ?auto_534035 ) ) ( not ( = ?auto_534033 ?auto_534036 ) ) ( not ( = ?auto_534033 ?auto_534037 ) ) ( not ( = ?auto_534034 ?auto_534035 ) ) ( not ( = ?auto_534034 ?auto_534036 ) ) ( not ( = ?auto_534034 ?auto_534037 ) ) ( not ( = ?auto_534035 ?auto_534036 ) ) ( not ( = ?auto_534035 ?auto_534037 ) ) ( not ( = ?auto_534036 ?auto_534037 ) ) ( CLEAR ?auto_534034 ) ( ON ?auto_534035 ?auto_534036 ) ( CLEAR ?auto_534035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_534033 ?auto_534034 ?auto_534035 )
      ( MAKE-4PILE ?auto_534033 ?auto_534034 ?auto_534035 ?auto_534036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_534051 - BLOCK
      ?auto_534052 - BLOCK
      ?auto_534053 - BLOCK
      ?auto_534054 - BLOCK
    )
    :vars
    (
      ?auto_534055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534054 ?auto_534055 ) ( ON-TABLE ?auto_534051 ) ( not ( = ?auto_534051 ?auto_534052 ) ) ( not ( = ?auto_534051 ?auto_534053 ) ) ( not ( = ?auto_534051 ?auto_534054 ) ) ( not ( = ?auto_534051 ?auto_534055 ) ) ( not ( = ?auto_534052 ?auto_534053 ) ) ( not ( = ?auto_534052 ?auto_534054 ) ) ( not ( = ?auto_534052 ?auto_534055 ) ) ( not ( = ?auto_534053 ?auto_534054 ) ) ( not ( = ?auto_534053 ?auto_534055 ) ) ( not ( = ?auto_534054 ?auto_534055 ) ) ( ON ?auto_534053 ?auto_534054 ) ( CLEAR ?auto_534051 ) ( ON ?auto_534052 ?auto_534053 ) ( CLEAR ?auto_534052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_534051 ?auto_534052 )
      ( MAKE-4PILE ?auto_534051 ?auto_534052 ?auto_534053 ?auto_534054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_534069 - BLOCK
      ?auto_534070 - BLOCK
      ?auto_534071 - BLOCK
      ?auto_534072 - BLOCK
    )
    :vars
    (
      ?auto_534073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534072 ?auto_534073 ) ( not ( = ?auto_534069 ?auto_534070 ) ) ( not ( = ?auto_534069 ?auto_534071 ) ) ( not ( = ?auto_534069 ?auto_534072 ) ) ( not ( = ?auto_534069 ?auto_534073 ) ) ( not ( = ?auto_534070 ?auto_534071 ) ) ( not ( = ?auto_534070 ?auto_534072 ) ) ( not ( = ?auto_534070 ?auto_534073 ) ) ( not ( = ?auto_534071 ?auto_534072 ) ) ( not ( = ?auto_534071 ?auto_534073 ) ) ( not ( = ?auto_534072 ?auto_534073 ) ) ( ON ?auto_534071 ?auto_534072 ) ( ON ?auto_534070 ?auto_534071 ) ( ON ?auto_534069 ?auto_534070 ) ( CLEAR ?auto_534069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534069 )
      ( MAKE-4PILE ?auto_534069 ?auto_534070 ?auto_534071 ?auto_534072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_534088 - BLOCK
      ?auto_534089 - BLOCK
      ?auto_534090 - BLOCK
      ?auto_534091 - BLOCK
      ?auto_534092 - BLOCK
    )
    :vars
    (
      ?auto_534093 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534091 ) ( ON ?auto_534092 ?auto_534093 ) ( CLEAR ?auto_534092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534088 ) ( ON ?auto_534089 ?auto_534088 ) ( ON ?auto_534090 ?auto_534089 ) ( ON ?auto_534091 ?auto_534090 ) ( not ( = ?auto_534088 ?auto_534089 ) ) ( not ( = ?auto_534088 ?auto_534090 ) ) ( not ( = ?auto_534088 ?auto_534091 ) ) ( not ( = ?auto_534088 ?auto_534092 ) ) ( not ( = ?auto_534088 ?auto_534093 ) ) ( not ( = ?auto_534089 ?auto_534090 ) ) ( not ( = ?auto_534089 ?auto_534091 ) ) ( not ( = ?auto_534089 ?auto_534092 ) ) ( not ( = ?auto_534089 ?auto_534093 ) ) ( not ( = ?auto_534090 ?auto_534091 ) ) ( not ( = ?auto_534090 ?auto_534092 ) ) ( not ( = ?auto_534090 ?auto_534093 ) ) ( not ( = ?auto_534091 ?auto_534092 ) ) ( not ( = ?auto_534091 ?auto_534093 ) ) ( not ( = ?auto_534092 ?auto_534093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534092 ?auto_534093 )
      ( !STACK ?auto_534092 ?auto_534091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_534110 - BLOCK
      ?auto_534111 - BLOCK
      ?auto_534112 - BLOCK
      ?auto_534113 - BLOCK
      ?auto_534114 - BLOCK
    )
    :vars
    (
      ?auto_534115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534114 ?auto_534115 ) ( ON-TABLE ?auto_534110 ) ( ON ?auto_534111 ?auto_534110 ) ( ON ?auto_534112 ?auto_534111 ) ( not ( = ?auto_534110 ?auto_534111 ) ) ( not ( = ?auto_534110 ?auto_534112 ) ) ( not ( = ?auto_534110 ?auto_534113 ) ) ( not ( = ?auto_534110 ?auto_534114 ) ) ( not ( = ?auto_534110 ?auto_534115 ) ) ( not ( = ?auto_534111 ?auto_534112 ) ) ( not ( = ?auto_534111 ?auto_534113 ) ) ( not ( = ?auto_534111 ?auto_534114 ) ) ( not ( = ?auto_534111 ?auto_534115 ) ) ( not ( = ?auto_534112 ?auto_534113 ) ) ( not ( = ?auto_534112 ?auto_534114 ) ) ( not ( = ?auto_534112 ?auto_534115 ) ) ( not ( = ?auto_534113 ?auto_534114 ) ) ( not ( = ?auto_534113 ?auto_534115 ) ) ( not ( = ?auto_534114 ?auto_534115 ) ) ( CLEAR ?auto_534112 ) ( ON ?auto_534113 ?auto_534114 ) ( CLEAR ?auto_534113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_534110 ?auto_534111 ?auto_534112 ?auto_534113 )
      ( MAKE-5PILE ?auto_534110 ?auto_534111 ?auto_534112 ?auto_534113 ?auto_534114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_534132 - BLOCK
      ?auto_534133 - BLOCK
      ?auto_534134 - BLOCK
      ?auto_534135 - BLOCK
      ?auto_534136 - BLOCK
    )
    :vars
    (
      ?auto_534137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534136 ?auto_534137 ) ( ON-TABLE ?auto_534132 ) ( ON ?auto_534133 ?auto_534132 ) ( not ( = ?auto_534132 ?auto_534133 ) ) ( not ( = ?auto_534132 ?auto_534134 ) ) ( not ( = ?auto_534132 ?auto_534135 ) ) ( not ( = ?auto_534132 ?auto_534136 ) ) ( not ( = ?auto_534132 ?auto_534137 ) ) ( not ( = ?auto_534133 ?auto_534134 ) ) ( not ( = ?auto_534133 ?auto_534135 ) ) ( not ( = ?auto_534133 ?auto_534136 ) ) ( not ( = ?auto_534133 ?auto_534137 ) ) ( not ( = ?auto_534134 ?auto_534135 ) ) ( not ( = ?auto_534134 ?auto_534136 ) ) ( not ( = ?auto_534134 ?auto_534137 ) ) ( not ( = ?auto_534135 ?auto_534136 ) ) ( not ( = ?auto_534135 ?auto_534137 ) ) ( not ( = ?auto_534136 ?auto_534137 ) ) ( ON ?auto_534135 ?auto_534136 ) ( CLEAR ?auto_534133 ) ( ON ?auto_534134 ?auto_534135 ) ( CLEAR ?auto_534134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_534132 ?auto_534133 ?auto_534134 )
      ( MAKE-5PILE ?auto_534132 ?auto_534133 ?auto_534134 ?auto_534135 ?auto_534136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_534154 - BLOCK
      ?auto_534155 - BLOCK
      ?auto_534156 - BLOCK
      ?auto_534157 - BLOCK
      ?auto_534158 - BLOCK
    )
    :vars
    (
      ?auto_534159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534158 ?auto_534159 ) ( ON-TABLE ?auto_534154 ) ( not ( = ?auto_534154 ?auto_534155 ) ) ( not ( = ?auto_534154 ?auto_534156 ) ) ( not ( = ?auto_534154 ?auto_534157 ) ) ( not ( = ?auto_534154 ?auto_534158 ) ) ( not ( = ?auto_534154 ?auto_534159 ) ) ( not ( = ?auto_534155 ?auto_534156 ) ) ( not ( = ?auto_534155 ?auto_534157 ) ) ( not ( = ?auto_534155 ?auto_534158 ) ) ( not ( = ?auto_534155 ?auto_534159 ) ) ( not ( = ?auto_534156 ?auto_534157 ) ) ( not ( = ?auto_534156 ?auto_534158 ) ) ( not ( = ?auto_534156 ?auto_534159 ) ) ( not ( = ?auto_534157 ?auto_534158 ) ) ( not ( = ?auto_534157 ?auto_534159 ) ) ( not ( = ?auto_534158 ?auto_534159 ) ) ( ON ?auto_534157 ?auto_534158 ) ( ON ?auto_534156 ?auto_534157 ) ( CLEAR ?auto_534154 ) ( ON ?auto_534155 ?auto_534156 ) ( CLEAR ?auto_534155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_534154 ?auto_534155 )
      ( MAKE-5PILE ?auto_534154 ?auto_534155 ?auto_534156 ?auto_534157 ?auto_534158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_534176 - BLOCK
      ?auto_534177 - BLOCK
      ?auto_534178 - BLOCK
      ?auto_534179 - BLOCK
      ?auto_534180 - BLOCK
    )
    :vars
    (
      ?auto_534181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534180 ?auto_534181 ) ( not ( = ?auto_534176 ?auto_534177 ) ) ( not ( = ?auto_534176 ?auto_534178 ) ) ( not ( = ?auto_534176 ?auto_534179 ) ) ( not ( = ?auto_534176 ?auto_534180 ) ) ( not ( = ?auto_534176 ?auto_534181 ) ) ( not ( = ?auto_534177 ?auto_534178 ) ) ( not ( = ?auto_534177 ?auto_534179 ) ) ( not ( = ?auto_534177 ?auto_534180 ) ) ( not ( = ?auto_534177 ?auto_534181 ) ) ( not ( = ?auto_534178 ?auto_534179 ) ) ( not ( = ?auto_534178 ?auto_534180 ) ) ( not ( = ?auto_534178 ?auto_534181 ) ) ( not ( = ?auto_534179 ?auto_534180 ) ) ( not ( = ?auto_534179 ?auto_534181 ) ) ( not ( = ?auto_534180 ?auto_534181 ) ) ( ON ?auto_534179 ?auto_534180 ) ( ON ?auto_534178 ?auto_534179 ) ( ON ?auto_534177 ?auto_534178 ) ( ON ?auto_534176 ?auto_534177 ) ( CLEAR ?auto_534176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534176 )
      ( MAKE-5PILE ?auto_534176 ?auto_534177 ?auto_534178 ?auto_534179 ?auto_534180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534199 - BLOCK
      ?auto_534200 - BLOCK
      ?auto_534201 - BLOCK
      ?auto_534202 - BLOCK
      ?auto_534203 - BLOCK
      ?auto_534204 - BLOCK
    )
    :vars
    (
      ?auto_534205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534203 ) ( ON ?auto_534204 ?auto_534205 ) ( CLEAR ?auto_534204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534199 ) ( ON ?auto_534200 ?auto_534199 ) ( ON ?auto_534201 ?auto_534200 ) ( ON ?auto_534202 ?auto_534201 ) ( ON ?auto_534203 ?auto_534202 ) ( not ( = ?auto_534199 ?auto_534200 ) ) ( not ( = ?auto_534199 ?auto_534201 ) ) ( not ( = ?auto_534199 ?auto_534202 ) ) ( not ( = ?auto_534199 ?auto_534203 ) ) ( not ( = ?auto_534199 ?auto_534204 ) ) ( not ( = ?auto_534199 ?auto_534205 ) ) ( not ( = ?auto_534200 ?auto_534201 ) ) ( not ( = ?auto_534200 ?auto_534202 ) ) ( not ( = ?auto_534200 ?auto_534203 ) ) ( not ( = ?auto_534200 ?auto_534204 ) ) ( not ( = ?auto_534200 ?auto_534205 ) ) ( not ( = ?auto_534201 ?auto_534202 ) ) ( not ( = ?auto_534201 ?auto_534203 ) ) ( not ( = ?auto_534201 ?auto_534204 ) ) ( not ( = ?auto_534201 ?auto_534205 ) ) ( not ( = ?auto_534202 ?auto_534203 ) ) ( not ( = ?auto_534202 ?auto_534204 ) ) ( not ( = ?auto_534202 ?auto_534205 ) ) ( not ( = ?auto_534203 ?auto_534204 ) ) ( not ( = ?auto_534203 ?auto_534205 ) ) ( not ( = ?auto_534204 ?auto_534205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534204 ?auto_534205 )
      ( !STACK ?auto_534204 ?auto_534203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534225 - BLOCK
      ?auto_534226 - BLOCK
      ?auto_534227 - BLOCK
      ?auto_534228 - BLOCK
      ?auto_534229 - BLOCK
      ?auto_534230 - BLOCK
    )
    :vars
    (
      ?auto_534231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534230 ?auto_534231 ) ( ON-TABLE ?auto_534225 ) ( ON ?auto_534226 ?auto_534225 ) ( ON ?auto_534227 ?auto_534226 ) ( ON ?auto_534228 ?auto_534227 ) ( not ( = ?auto_534225 ?auto_534226 ) ) ( not ( = ?auto_534225 ?auto_534227 ) ) ( not ( = ?auto_534225 ?auto_534228 ) ) ( not ( = ?auto_534225 ?auto_534229 ) ) ( not ( = ?auto_534225 ?auto_534230 ) ) ( not ( = ?auto_534225 ?auto_534231 ) ) ( not ( = ?auto_534226 ?auto_534227 ) ) ( not ( = ?auto_534226 ?auto_534228 ) ) ( not ( = ?auto_534226 ?auto_534229 ) ) ( not ( = ?auto_534226 ?auto_534230 ) ) ( not ( = ?auto_534226 ?auto_534231 ) ) ( not ( = ?auto_534227 ?auto_534228 ) ) ( not ( = ?auto_534227 ?auto_534229 ) ) ( not ( = ?auto_534227 ?auto_534230 ) ) ( not ( = ?auto_534227 ?auto_534231 ) ) ( not ( = ?auto_534228 ?auto_534229 ) ) ( not ( = ?auto_534228 ?auto_534230 ) ) ( not ( = ?auto_534228 ?auto_534231 ) ) ( not ( = ?auto_534229 ?auto_534230 ) ) ( not ( = ?auto_534229 ?auto_534231 ) ) ( not ( = ?auto_534230 ?auto_534231 ) ) ( CLEAR ?auto_534228 ) ( ON ?auto_534229 ?auto_534230 ) ( CLEAR ?auto_534229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_534225 ?auto_534226 ?auto_534227 ?auto_534228 ?auto_534229 )
      ( MAKE-6PILE ?auto_534225 ?auto_534226 ?auto_534227 ?auto_534228 ?auto_534229 ?auto_534230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534251 - BLOCK
      ?auto_534252 - BLOCK
      ?auto_534253 - BLOCK
      ?auto_534254 - BLOCK
      ?auto_534255 - BLOCK
      ?auto_534256 - BLOCK
    )
    :vars
    (
      ?auto_534257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534256 ?auto_534257 ) ( ON-TABLE ?auto_534251 ) ( ON ?auto_534252 ?auto_534251 ) ( ON ?auto_534253 ?auto_534252 ) ( not ( = ?auto_534251 ?auto_534252 ) ) ( not ( = ?auto_534251 ?auto_534253 ) ) ( not ( = ?auto_534251 ?auto_534254 ) ) ( not ( = ?auto_534251 ?auto_534255 ) ) ( not ( = ?auto_534251 ?auto_534256 ) ) ( not ( = ?auto_534251 ?auto_534257 ) ) ( not ( = ?auto_534252 ?auto_534253 ) ) ( not ( = ?auto_534252 ?auto_534254 ) ) ( not ( = ?auto_534252 ?auto_534255 ) ) ( not ( = ?auto_534252 ?auto_534256 ) ) ( not ( = ?auto_534252 ?auto_534257 ) ) ( not ( = ?auto_534253 ?auto_534254 ) ) ( not ( = ?auto_534253 ?auto_534255 ) ) ( not ( = ?auto_534253 ?auto_534256 ) ) ( not ( = ?auto_534253 ?auto_534257 ) ) ( not ( = ?auto_534254 ?auto_534255 ) ) ( not ( = ?auto_534254 ?auto_534256 ) ) ( not ( = ?auto_534254 ?auto_534257 ) ) ( not ( = ?auto_534255 ?auto_534256 ) ) ( not ( = ?auto_534255 ?auto_534257 ) ) ( not ( = ?auto_534256 ?auto_534257 ) ) ( ON ?auto_534255 ?auto_534256 ) ( CLEAR ?auto_534253 ) ( ON ?auto_534254 ?auto_534255 ) ( CLEAR ?auto_534254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_534251 ?auto_534252 ?auto_534253 ?auto_534254 )
      ( MAKE-6PILE ?auto_534251 ?auto_534252 ?auto_534253 ?auto_534254 ?auto_534255 ?auto_534256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534277 - BLOCK
      ?auto_534278 - BLOCK
      ?auto_534279 - BLOCK
      ?auto_534280 - BLOCK
      ?auto_534281 - BLOCK
      ?auto_534282 - BLOCK
    )
    :vars
    (
      ?auto_534283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534282 ?auto_534283 ) ( ON-TABLE ?auto_534277 ) ( ON ?auto_534278 ?auto_534277 ) ( not ( = ?auto_534277 ?auto_534278 ) ) ( not ( = ?auto_534277 ?auto_534279 ) ) ( not ( = ?auto_534277 ?auto_534280 ) ) ( not ( = ?auto_534277 ?auto_534281 ) ) ( not ( = ?auto_534277 ?auto_534282 ) ) ( not ( = ?auto_534277 ?auto_534283 ) ) ( not ( = ?auto_534278 ?auto_534279 ) ) ( not ( = ?auto_534278 ?auto_534280 ) ) ( not ( = ?auto_534278 ?auto_534281 ) ) ( not ( = ?auto_534278 ?auto_534282 ) ) ( not ( = ?auto_534278 ?auto_534283 ) ) ( not ( = ?auto_534279 ?auto_534280 ) ) ( not ( = ?auto_534279 ?auto_534281 ) ) ( not ( = ?auto_534279 ?auto_534282 ) ) ( not ( = ?auto_534279 ?auto_534283 ) ) ( not ( = ?auto_534280 ?auto_534281 ) ) ( not ( = ?auto_534280 ?auto_534282 ) ) ( not ( = ?auto_534280 ?auto_534283 ) ) ( not ( = ?auto_534281 ?auto_534282 ) ) ( not ( = ?auto_534281 ?auto_534283 ) ) ( not ( = ?auto_534282 ?auto_534283 ) ) ( ON ?auto_534281 ?auto_534282 ) ( ON ?auto_534280 ?auto_534281 ) ( CLEAR ?auto_534278 ) ( ON ?auto_534279 ?auto_534280 ) ( CLEAR ?auto_534279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_534277 ?auto_534278 ?auto_534279 )
      ( MAKE-6PILE ?auto_534277 ?auto_534278 ?auto_534279 ?auto_534280 ?auto_534281 ?auto_534282 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534303 - BLOCK
      ?auto_534304 - BLOCK
      ?auto_534305 - BLOCK
      ?auto_534306 - BLOCK
      ?auto_534307 - BLOCK
      ?auto_534308 - BLOCK
    )
    :vars
    (
      ?auto_534309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534308 ?auto_534309 ) ( ON-TABLE ?auto_534303 ) ( not ( = ?auto_534303 ?auto_534304 ) ) ( not ( = ?auto_534303 ?auto_534305 ) ) ( not ( = ?auto_534303 ?auto_534306 ) ) ( not ( = ?auto_534303 ?auto_534307 ) ) ( not ( = ?auto_534303 ?auto_534308 ) ) ( not ( = ?auto_534303 ?auto_534309 ) ) ( not ( = ?auto_534304 ?auto_534305 ) ) ( not ( = ?auto_534304 ?auto_534306 ) ) ( not ( = ?auto_534304 ?auto_534307 ) ) ( not ( = ?auto_534304 ?auto_534308 ) ) ( not ( = ?auto_534304 ?auto_534309 ) ) ( not ( = ?auto_534305 ?auto_534306 ) ) ( not ( = ?auto_534305 ?auto_534307 ) ) ( not ( = ?auto_534305 ?auto_534308 ) ) ( not ( = ?auto_534305 ?auto_534309 ) ) ( not ( = ?auto_534306 ?auto_534307 ) ) ( not ( = ?auto_534306 ?auto_534308 ) ) ( not ( = ?auto_534306 ?auto_534309 ) ) ( not ( = ?auto_534307 ?auto_534308 ) ) ( not ( = ?auto_534307 ?auto_534309 ) ) ( not ( = ?auto_534308 ?auto_534309 ) ) ( ON ?auto_534307 ?auto_534308 ) ( ON ?auto_534306 ?auto_534307 ) ( ON ?auto_534305 ?auto_534306 ) ( CLEAR ?auto_534303 ) ( ON ?auto_534304 ?auto_534305 ) ( CLEAR ?auto_534304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_534303 ?auto_534304 )
      ( MAKE-6PILE ?auto_534303 ?auto_534304 ?auto_534305 ?auto_534306 ?auto_534307 ?auto_534308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_534329 - BLOCK
      ?auto_534330 - BLOCK
      ?auto_534331 - BLOCK
      ?auto_534332 - BLOCK
      ?auto_534333 - BLOCK
      ?auto_534334 - BLOCK
    )
    :vars
    (
      ?auto_534335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534334 ?auto_534335 ) ( not ( = ?auto_534329 ?auto_534330 ) ) ( not ( = ?auto_534329 ?auto_534331 ) ) ( not ( = ?auto_534329 ?auto_534332 ) ) ( not ( = ?auto_534329 ?auto_534333 ) ) ( not ( = ?auto_534329 ?auto_534334 ) ) ( not ( = ?auto_534329 ?auto_534335 ) ) ( not ( = ?auto_534330 ?auto_534331 ) ) ( not ( = ?auto_534330 ?auto_534332 ) ) ( not ( = ?auto_534330 ?auto_534333 ) ) ( not ( = ?auto_534330 ?auto_534334 ) ) ( not ( = ?auto_534330 ?auto_534335 ) ) ( not ( = ?auto_534331 ?auto_534332 ) ) ( not ( = ?auto_534331 ?auto_534333 ) ) ( not ( = ?auto_534331 ?auto_534334 ) ) ( not ( = ?auto_534331 ?auto_534335 ) ) ( not ( = ?auto_534332 ?auto_534333 ) ) ( not ( = ?auto_534332 ?auto_534334 ) ) ( not ( = ?auto_534332 ?auto_534335 ) ) ( not ( = ?auto_534333 ?auto_534334 ) ) ( not ( = ?auto_534333 ?auto_534335 ) ) ( not ( = ?auto_534334 ?auto_534335 ) ) ( ON ?auto_534333 ?auto_534334 ) ( ON ?auto_534332 ?auto_534333 ) ( ON ?auto_534331 ?auto_534332 ) ( ON ?auto_534330 ?auto_534331 ) ( ON ?auto_534329 ?auto_534330 ) ( CLEAR ?auto_534329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534329 )
      ( MAKE-6PILE ?auto_534329 ?auto_534330 ?auto_534331 ?auto_534332 ?auto_534333 ?auto_534334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534356 - BLOCK
      ?auto_534357 - BLOCK
      ?auto_534358 - BLOCK
      ?auto_534359 - BLOCK
      ?auto_534360 - BLOCK
      ?auto_534361 - BLOCK
      ?auto_534362 - BLOCK
    )
    :vars
    (
      ?auto_534363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534361 ) ( ON ?auto_534362 ?auto_534363 ) ( CLEAR ?auto_534362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534356 ) ( ON ?auto_534357 ?auto_534356 ) ( ON ?auto_534358 ?auto_534357 ) ( ON ?auto_534359 ?auto_534358 ) ( ON ?auto_534360 ?auto_534359 ) ( ON ?auto_534361 ?auto_534360 ) ( not ( = ?auto_534356 ?auto_534357 ) ) ( not ( = ?auto_534356 ?auto_534358 ) ) ( not ( = ?auto_534356 ?auto_534359 ) ) ( not ( = ?auto_534356 ?auto_534360 ) ) ( not ( = ?auto_534356 ?auto_534361 ) ) ( not ( = ?auto_534356 ?auto_534362 ) ) ( not ( = ?auto_534356 ?auto_534363 ) ) ( not ( = ?auto_534357 ?auto_534358 ) ) ( not ( = ?auto_534357 ?auto_534359 ) ) ( not ( = ?auto_534357 ?auto_534360 ) ) ( not ( = ?auto_534357 ?auto_534361 ) ) ( not ( = ?auto_534357 ?auto_534362 ) ) ( not ( = ?auto_534357 ?auto_534363 ) ) ( not ( = ?auto_534358 ?auto_534359 ) ) ( not ( = ?auto_534358 ?auto_534360 ) ) ( not ( = ?auto_534358 ?auto_534361 ) ) ( not ( = ?auto_534358 ?auto_534362 ) ) ( not ( = ?auto_534358 ?auto_534363 ) ) ( not ( = ?auto_534359 ?auto_534360 ) ) ( not ( = ?auto_534359 ?auto_534361 ) ) ( not ( = ?auto_534359 ?auto_534362 ) ) ( not ( = ?auto_534359 ?auto_534363 ) ) ( not ( = ?auto_534360 ?auto_534361 ) ) ( not ( = ?auto_534360 ?auto_534362 ) ) ( not ( = ?auto_534360 ?auto_534363 ) ) ( not ( = ?auto_534361 ?auto_534362 ) ) ( not ( = ?auto_534361 ?auto_534363 ) ) ( not ( = ?auto_534362 ?auto_534363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534362 ?auto_534363 )
      ( !STACK ?auto_534362 ?auto_534361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534386 - BLOCK
      ?auto_534387 - BLOCK
      ?auto_534388 - BLOCK
      ?auto_534389 - BLOCK
      ?auto_534390 - BLOCK
      ?auto_534391 - BLOCK
      ?auto_534392 - BLOCK
    )
    :vars
    (
      ?auto_534393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534392 ?auto_534393 ) ( ON-TABLE ?auto_534386 ) ( ON ?auto_534387 ?auto_534386 ) ( ON ?auto_534388 ?auto_534387 ) ( ON ?auto_534389 ?auto_534388 ) ( ON ?auto_534390 ?auto_534389 ) ( not ( = ?auto_534386 ?auto_534387 ) ) ( not ( = ?auto_534386 ?auto_534388 ) ) ( not ( = ?auto_534386 ?auto_534389 ) ) ( not ( = ?auto_534386 ?auto_534390 ) ) ( not ( = ?auto_534386 ?auto_534391 ) ) ( not ( = ?auto_534386 ?auto_534392 ) ) ( not ( = ?auto_534386 ?auto_534393 ) ) ( not ( = ?auto_534387 ?auto_534388 ) ) ( not ( = ?auto_534387 ?auto_534389 ) ) ( not ( = ?auto_534387 ?auto_534390 ) ) ( not ( = ?auto_534387 ?auto_534391 ) ) ( not ( = ?auto_534387 ?auto_534392 ) ) ( not ( = ?auto_534387 ?auto_534393 ) ) ( not ( = ?auto_534388 ?auto_534389 ) ) ( not ( = ?auto_534388 ?auto_534390 ) ) ( not ( = ?auto_534388 ?auto_534391 ) ) ( not ( = ?auto_534388 ?auto_534392 ) ) ( not ( = ?auto_534388 ?auto_534393 ) ) ( not ( = ?auto_534389 ?auto_534390 ) ) ( not ( = ?auto_534389 ?auto_534391 ) ) ( not ( = ?auto_534389 ?auto_534392 ) ) ( not ( = ?auto_534389 ?auto_534393 ) ) ( not ( = ?auto_534390 ?auto_534391 ) ) ( not ( = ?auto_534390 ?auto_534392 ) ) ( not ( = ?auto_534390 ?auto_534393 ) ) ( not ( = ?auto_534391 ?auto_534392 ) ) ( not ( = ?auto_534391 ?auto_534393 ) ) ( not ( = ?auto_534392 ?auto_534393 ) ) ( CLEAR ?auto_534390 ) ( ON ?auto_534391 ?auto_534392 ) ( CLEAR ?auto_534391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_534386 ?auto_534387 ?auto_534388 ?auto_534389 ?auto_534390 ?auto_534391 )
      ( MAKE-7PILE ?auto_534386 ?auto_534387 ?auto_534388 ?auto_534389 ?auto_534390 ?auto_534391 ?auto_534392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534416 - BLOCK
      ?auto_534417 - BLOCK
      ?auto_534418 - BLOCK
      ?auto_534419 - BLOCK
      ?auto_534420 - BLOCK
      ?auto_534421 - BLOCK
      ?auto_534422 - BLOCK
    )
    :vars
    (
      ?auto_534423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534422 ?auto_534423 ) ( ON-TABLE ?auto_534416 ) ( ON ?auto_534417 ?auto_534416 ) ( ON ?auto_534418 ?auto_534417 ) ( ON ?auto_534419 ?auto_534418 ) ( not ( = ?auto_534416 ?auto_534417 ) ) ( not ( = ?auto_534416 ?auto_534418 ) ) ( not ( = ?auto_534416 ?auto_534419 ) ) ( not ( = ?auto_534416 ?auto_534420 ) ) ( not ( = ?auto_534416 ?auto_534421 ) ) ( not ( = ?auto_534416 ?auto_534422 ) ) ( not ( = ?auto_534416 ?auto_534423 ) ) ( not ( = ?auto_534417 ?auto_534418 ) ) ( not ( = ?auto_534417 ?auto_534419 ) ) ( not ( = ?auto_534417 ?auto_534420 ) ) ( not ( = ?auto_534417 ?auto_534421 ) ) ( not ( = ?auto_534417 ?auto_534422 ) ) ( not ( = ?auto_534417 ?auto_534423 ) ) ( not ( = ?auto_534418 ?auto_534419 ) ) ( not ( = ?auto_534418 ?auto_534420 ) ) ( not ( = ?auto_534418 ?auto_534421 ) ) ( not ( = ?auto_534418 ?auto_534422 ) ) ( not ( = ?auto_534418 ?auto_534423 ) ) ( not ( = ?auto_534419 ?auto_534420 ) ) ( not ( = ?auto_534419 ?auto_534421 ) ) ( not ( = ?auto_534419 ?auto_534422 ) ) ( not ( = ?auto_534419 ?auto_534423 ) ) ( not ( = ?auto_534420 ?auto_534421 ) ) ( not ( = ?auto_534420 ?auto_534422 ) ) ( not ( = ?auto_534420 ?auto_534423 ) ) ( not ( = ?auto_534421 ?auto_534422 ) ) ( not ( = ?auto_534421 ?auto_534423 ) ) ( not ( = ?auto_534422 ?auto_534423 ) ) ( ON ?auto_534421 ?auto_534422 ) ( CLEAR ?auto_534419 ) ( ON ?auto_534420 ?auto_534421 ) ( CLEAR ?auto_534420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_534416 ?auto_534417 ?auto_534418 ?auto_534419 ?auto_534420 )
      ( MAKE-7PILE ?auto_534416 ?auto_534417 ?auto_534418 ?auto_534419 ?auto_534420 ?auto_534421 ?auto_534422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534446 - BLOCK
      ?auto_534447 - BLOCK
      ?auto_534448 - BLOCK
      ?auto_534449 - BLOCK
      ?auto_534450 - BLOCK
      ?auto_534451 - BLOCK
      ?auto_534452 - BLOCK
    )
    :vars
    (
      ?auto_534453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534452 ?auto_534453 ) ( ON-TABLE ?auto_534446 ) ( ON ?auto_534447 ?auto_534446 ) ( ON ?auto_534448 ?auto_534447 ) ( not ( = ?auto_534446 ?auto_534447 ) ) ( not ( = ?auto_534446 ?auto_534448 ) ) ( not ( = ?auto_534446 ?auto_534449 ) ) ( not ( = ?auto_534446 ?auto_534450 ) ) ( not ( = ?auto_534446 ?auto_534451 ) ) ( not ( = ?auto_534446 ?auto_534452 ) ) ( not ( = ?auto_534446 ?auto_534453 ) ) ( not ( = ?auto_534447 ?auto_534448 ) ) ( not ( = ?auto_534447 ?auto_534449 ) ) ( not ( = ?auto_534447 ?auto_534450 ) ) ( not ( = ?auto_534447 ?auto_534451 ) ) ( not ( = ?auto_534447 ?auto_534452 ) ) ( not ( = ?auto_534447 ?auto_534453 ) ) ( not ( = ?auto_534448 ?auto_534449 ) ) ( not ( = ?auto_534448 ?auto_534450 ) ) ( not ( = ?auto_534448 ?auto_534451 ) ) ( not ( = ?auto_534448 ?auto_534452 ) ) ( not ( = ?auto_534448 ?auto_534453 ) ) ( not ( = ?auto_534449 ?auto_534450 ) ) ( not ( = ?auto_534449 ?auto_534451 ) ) ( not ( = ?auto_534449 ?auto_534452 ) ) ( not ( = ?auto_534449 ?auto_534453 ) ) ( not ( = ?auto_534450 ?auto_534451 ) ) ( not ( = ?auto_534450 ?auto_534452 ) ) ( not ( = ?auto_534450 ?auto_534453 ) ) ( not ( = ?auto_534451 ?auto_534452 ) ) ( not ( = ?auto_534451 ?auto_534453 ) ) ( not ( = ?auto_534452 ?auto_534453 ) ) ( ON ?auto_534451 ?auto_534452 ) ( ON ?auto_534450 ?auto_534451 ) ( CLEAR ?auto_534448 ) ( ON ?auto_534449 ?auto_534450 ) ( CLEAR ?auto_534449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_534446 ?auto_534447 ?auto_534448 ?auto_534449 )
      ( MAKE-7PILE ?auto_534446 ?auto_534447 ?auto_534448 ?auto_534449 ?auto_534450 ?auto_534451 ?auto_534452 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534476 - BLOCK
      ?auto_534477 - BLOCK
      ?auto_534478 - BLOCK
      ?auto_534479 - BLOCK
      ?auto_534480 - BLOCK
      ?auto_534481 - BLOCK
      ?auto_534482 - BLOCK
    )
    :vars
    (
      ?auto_534483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534482 ?auto_534483 ) ( ON-TABLE ?auto_534476 ) ( ON ?auto_534477 ?auto_534476 ) ( not ( = ?auto_534476 ?auto_534477 ) ) ( not ( = ?auto_534476 ?auto_534478 ) ) ( not ( = ?auto_534476 ?auto_534479 ) ) ( not ( = ?auto_534476 ?auto_534480 ) ) ( not ( = ?auto_534476 ?auto_534481 ) ) ( not ( = ?auto_534476 ?auto_534482 ) ) ( not ( = ?auto_534476 ?auto_534483 ) ) ( not ( = ?auto_534477 ?auto_534478 ) ) ( not ( = ?auto_534477 ?auto_534479 ) ) ( not ( = ?auto_534477 ?auto_534480 ) ) ( not ( = ?auto_534477 ?auto_534481 ) ) ( not ( = ?auto_534477 ?auto_534482 ) ) ( not ( = ?auto_534477 ?auto_534483 ) ) ( not ( = ?auto_534478 ?auto_534479 ) ) ( not ( = ?auto_534478 ?auto_534480 ) ) ( not ( = ?auto_534478 ?auto_534481 ) ) ( not ( = ?auto_534478 ?auto_534482 ) ) ( not ( = ?auto_534478 ?auto_534483 ) ) ( not ( = ?auto_534479 ?auto_534480 ) ) ( not ( = ?auto_534479 ?auto_534481 ) ) ( not ( = ?auto_534479 ?auto_534482 ) ) ( not ( = ?auto_534479 ?auto_534483 ) ) ( not ( = ?auto_534480 ?auto_534481 ) ) ( not ( = ?auto_534480 ?auto_534482 ) ) ( not ( = ?auto_534480 ?auto_534483 ) ) ( not ( = ?auto_534481 ?auto_534482 ) ) ( not ( = ?auto_534481 ?auto_534483 ) ) ( not ( = ?auto_534482 ?auto_534483 ) ) ( ON ?auto_534481 ?auto_534482 ) ( ON ?auto_534480 ?auto_534481 ) ( ON ?auto_534479 ?auto_534480 ) ( CLEAR ?auto_534477 ) ( ON ?auto_534478 ?auto_534479 ) ( CLEAR ?auto_534478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_534476 ?auto_534477 ?auto_534478 )
      ( MAKE-7PILE ?auto_534476 ?auto_534477 ?auto_534478 ?auto_534479 ?auto_534480 ?auto_534481 ?auto_534482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534506 - BLOCK
      ?auto_534507 - BLOCK
      ?auto_534508 - BLOCK
      ?auto_534509 - BLOCK
      ?auto_534510 - BLOCK
      ?auto_534511 - BLOCK
      ?auto_534512 - BLOCK
    )
    :vars
    (
      ?auto_534513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534512 ?auto_534513 ) ( ON-TABLE ?auto_534506 ) ( not ( = ?auto_534506 ?auto_534507 ) ) ( not ( = ?auto_534506 ?auto_534508 ) ) ( not ( = ?auto_534506 ?auto_534509 ) ) ( not ( = ?auto_534506 ?auto_534510 ) ) ( not ( = ?auto_534506 ?auto_534511 ) ) ( not ( = ?auto_534506 ?auto_534512 ) ) ( not ( = ?auto_534506 ?auto_534513 ) ) ( not ( = ?auto_534507 ?auto_534508 ) ) ( not ( = ?auto_534507 ?auto_534509 ) ) ( not ( = ?auto_534507 ?auto_534510 ) ) ( not ( = ?auto_534507 ?auto_534511 ) ) ( not ( = ?auto_534507 ?auto_534512 ) ) ( not ( = ?auto_534507 ?auto_534513 ) ) ( not ( = ?auto_534508 ?auto_534509 ) ) ( not ( = ?auto_534508 ?auto_534510 ) ) ( not ( = ?auto_534508 ?auto_534511 ) ) ( not ( = ?auto_534508 ?auto_534512 ) ) ( not ( = ?auto_534508 ?auto_534513 ) ) ( not ( = ?auto_534509 ?auto_534510 ) ) ( not ( = ?auto_534509 ?auto_534511 ) ) ( not ( = ?auto_534509 ?auto_534512 ) ) ( not ( = ?auto_534509 ?auto_534513 ) ) ( not ( = ?auto_534510 ?auto_534511 ) ) ( not ( = ?auto_534510 ?auto_534512 ) ) ( not ( = ?auto_534510 ?auto_534513 ) ) ( not ( = ?auto_534511 ?auto_534512 ) ) ( not ( = ?auto_534511 ?auto_534513 ) ) ( not ( = ?auto_534512 ?auto_534513 ) ) ( ON ?auto_534511 ?auto_534512 ) ( ON ?auto_534510 ?auto_534511 ) ( ON ?auto_534509 ?auto_534510 ) ( ON ?auto_534508 ?auto_534509 ) ( CLEAR ?auto_534506 ) ( ON ?auto_534507 ?auto_534508 ) ( CLEAR ?auto_534507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_534506 ?auto_534507 )
      ( MAKE-7PILE ?auto_534506 ?auto_534507 ?auto_534508 ?auto_534509 ?auto_534510 ?auto_534511 ?auto_534512 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_534536 - BLOCK
      ?auto_534537 - BLOCK
      ?auto_534538 - BLOCK
      ?auto_534539 - BLOCK
      ?auto_534540 - BLOCK
      ?auto_534541 - BLOCK
      ?auto_534542 - BLOCK
    )
    :vars
    (
      ?auto_534543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534542 ?auto_534543 ) ( not ( = ?auto_534536 ?auto_534537 ) ) ( not ( = ?auto_534536 ?auto_534538 ) ) ( not ( = ?auto_534536 ?auto_534539 ) ) ( not ( = ?auto_534536 ?auto_534540 ) ) ( not ( = ?auto_534536 ?auto_534541 ) ) ( not ( = ?auto_534536 ?auto_534542 ) ) ( not ( = ?auto_534536 ?auto_534543 ) ) ( not ( = ?auto_534537 ?auto_534538 ) ) ( not ( = ?auto_534537 ?auto_534539 ) ) ( not ( = ?auto_534537 ?auto_534540 ) ) ( not ( = ?auto_534537 ?auto_534541 ) ) ( not ( = ?auto_534537 ?auto_534542 ) ) ( not ( = ?auto_534537 ?auto_534543 ) ) ( not ( = ?auto_534538 ?auto_534539 ) ) ( not ( = ?auto_534538 ?auto_534540 ) ) ( not ( = ?auto_534538 ?auto_534541 ) ) ( not ( = ?auto_534538 ?auto_534542 ) ) ( not ( = ?auto_534538 ?auto_534543 ) ) ( not ( = ?auto_534539 ?auto_534540 ) ) ( not ( = ?auto_534539 ?auto_534541 ) ) ( not ( = ?auto_534539 ?auto_534542 ) ) ( not ( = ?auto_534539 ?auto_534543 ) ) ( not ( = ?auto_534540 ?auto_534541 ) ) ( not ( = ?auto_534540 ?auto_534542 ) ) ( not ( = ?auto_534540 ?auto_534543 ) ) ( not ( = ?auto_534541 ?auto_534542 ) ) ( not ( = ?auto_534541 ?auto_534543 ) ) ( not ( = ?auto_534542 ?auto_534543 ) ) ( ON ?auto_534541 ?auto_534542 ) ( ON ?auto_534540 ?auto_534541 ) ( ON ?auto_534539 ?auto_534540 ) ( ON ?auto_534538 ?auto_534539 ) ( ON ?auto_534537 ?auto_534538 ) ( ON ?auto_534536 ?auto_534537 ) ( CLEAR ?auto_534536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534536 )
      ( MAKE-7PILE ?auto_534536 ?auto_534537 ?auto_534538 ?auto_534539 ?auto_534540 ?auto_534541 ?auto_534542 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534567 - BLOCK
      ?auto_534568 - BLOCK
      ?auto_534569 - BLOCK
      ?auto_534570 - BLOCK
      ?auto_534571 - BLOCK
      ?auto_534572 - BLOCK
      ?auto_534573 - BLOCK
      ?auto_534574 - BLOCK
    )
    :vars
    (
      ?auto_534575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534573 ) ( ON ?auto_534574 ?auto_534575 ) ( CLEAR ?auto_534574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534567 ) ( ON ?auto_534568 ?auto_534567 ) ( ON ?auto_534569 ?auto_534568 ) ( ON ?auto_534570 ?auto_534569 ) ( ON ?auto_534571 ?auto_534570 ) ( ON ?auto_534572 ?auto_534571 ) ( ON ?auto_534573 ?auto_534572 ) ( not ( = ?auto_534567 ?auto_534568 ) ) ( not ( = ?auto_534567 ?auto_534569 ) ) ( not ( = ?auto_534567 ?auto_534570 ) ) ( not ( = ?auto_534567 ?auto_534571 ) ) ( not ( = ?auto_534567 ?auto_534572 ) ) ( not ( = ?auto_534567 ?auto_534573 ) ) ( not ( = ?auto_534567 ?auto_534574 ) ) ( not ( = ?auto_534567 ?auto_534575 ) ) ( not ( = ?auto_534568 ?auto_534569 ) ) ( not ( = ?auto_534568 ?auto_534570 ) ) ( not ( = ?auto_534568 ?auto_534571 ) ) ( not ( = ?auto_534568 ?auto_534572 ) ) ( not ( = ?auto_534568 ?auto_534573 ) ) ( not ( = ?auto_534568 ?auto_534574 ) ) ( not ( = ?auto_534568 ?auto_534575 ) ) ( not ( = ?auto_534569 ?auto_534570 ) ) ( not ( = ?auto_534569 ?auto_534571 ) ) ( not ( = ?auto_534569 ?auto_534572 ) ) ( not ( = ?auto_534569 ?auto_534573 ) ) ( not ( = ?auto_534569 ?auto_534574 ) ) ( not ( = ?auto_534569 ?auto_534575 ) ) ( not ( = ?auto_534570 ?auto_534571 ) ) ( not ( = ?auto_534570 ?auto_534572 ) ) ( not ( = ?auto_534570 ?auto_534573 ) ) ( not ( = ?auto_534570 ?auto_534574 ) ) ( not ( = ?auto_534570 ?auto_534575 ) ) ( not ( = ?auto_534571 ?auto_534572 ) ) ( not ( = ?auto_534571 ?auto_534573 ) ) ( not ( = ?auto_534571 ?auto_534574 ) ) ( not ( = ?auto_534571 ?auto_534575 ) ) ( not ( = ?auto_534572 ?auto_534573 ) ) ( not ( = ?auto_534572 ?auto_534574 ) ) ( not ( = ?auto_534572 ?auto_534575 ) ) ( not ( = ?auto_534573 ?auto_534574 ) ) ( not ( = ?auto_534573 ?auto_534575 ) ) ( not ( = ?auto_534574 ?auto_534575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534574 ?auto_534575 )
      ( !STACK ?auto_534574 ?auto_534573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534601 - BLOCK
      ?auto_534602 - BLOCK
      ?auto_534603 - BLOCK
      ?auto_534604 - BLOCK
      ?auto_534605 - BLOCK
      ?auto_534606 - BLOCK
      ?auto_534607 - BLOCK
      ?auto_534608 - BLOCK
    )
    :vars
    (
      ?auto_534609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534608 ?auto_534609 ) ( ON-TABLE ?auto_534601 ) ( ON ?auto_534602 ?auto_534601 ) ( ON ?auto_534603 ?auto_534602 ) ( ON ?auto_534604 ?auto_534603 ) ( ON ?auto_534605 ?auto_534604 ) ( ON ?auto_534606 ?auto_534605 ) ( not ( = ?auto_534601 ?auto_534602 ) ) ( not ( = ?auto_534601 ?auto_534603 ) ) ( not ( = ?auto_534601 ?auto_534604 ) ) ( not ( = ?auto_534601 ?auto_534605 ) ) ( not ( = ?auto_534601 ?auto_534606 ) ) ( not ( = ?auto_534601 ?auto_534607 ) ) ( not ( = ?auto_534601 ?auto_534608 ) ) ( not ( = ?auto_534601 ?auto_534609 ) ) ( not ( = ?auto_534602 ?auto_534603 ) ) ( not ( = ?auto_534602 ?auto_534604 ) ) ( not ( = ?auto_534602 ?auto_534605 ) ) ( not ( = ?auto_534602 ?auto_534606 ) ) ( not ( = ?auto_534602 ?auto_534607 ) ) ( not ( = ?auto_534602 ?auto_534608 ) ) ( not ( = ?auto_534602 ?auto_534609 ) ) ( not ( = ?auto_534603 ?auto_534604 ) ) ( not ( = ?auto_534603 ?auto_534605 ) ) ( not ( = ?auto_534603 ?auto_534606 ) ) ( not ( = ?auto_534603 ?auto_534607 ) ) ( not ( = ?auto_534603 ?auto_534608 ) ) ( not ( = ?auto_534603 ?auto_534609 ) ) ( not ( = ?auto_534604 ?auto_534605 ) ) ( not ( = ?auto_534604 ?auto_534606 ) ) ( not ( = ?auto_534604 ?auto_534607 ) ) ( not ( = ?auto_534604 ?auto_534608 ) ) ( not ( = ?auto_534604 ?auto_534609 ) ) ( not ( = ?auto_534605 ?auto_534606 ) ) ( not ( = ?auto_534605 ?auto_534607 ) ) ( not ( = ?auto_534605 ?auto_534608 ) ) ( not ( = ?auto_534605 ?auto_534609 ) ) ( not ( = ?auto_534606 ?auto_534607 ) ) ( not ( = ?auto_534606 ?auto_534608 ) ) ( not ( = ?auto_534606 ?auto_534609 ) ) ( not ( = ?auto_534607 ?auto_534608 ) ) ( not ( = ?auto_534607 ?auto_534609 ) ) ( not ( = ?auto_534608 ?auto_534609 ) ) ( CLEAR ?auto_534606 ) ( ON ?auto_534607 ?auto_534608 ) ( CLEAR ?auto_534607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_534601 ?auto_534602 ?auto_534603 ?auto_534604 ?auto_534605 ?auto_534606 ?auto_534607 )
      ( MAKE-8PILE ?auto_534601 ?auto_534602 ?auto_534603 ?auto_534604 ?auto_534605 ?auto_534606 ?auto_534607 ?auto_534608 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534635 - BLOCK
      ?auto_534636 - BLOCK
      ?auto_534637 - BLOCK
      ?auto_534638 - BLOCK
      ?auto_534639 - BLOCK
      ?auto_534640 - BLOCK
      ?auto_534641 - BLOCK
      ?auto_534642 - BLOCK
    )
    :vars
    (
      ?auto_534643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534642 ?auto_534643 ) ( ON-TABLE ?auto_534635 ) ( ON ?auto_534636 ?auto_534635 ) ( ON ?auto_534637 ?auto_534636 ) ( ON ?auto_534638 ?auto_534637 ) ( ON ?auto_534639 ?auto_534638 ) ( not ( = ?auto_534635 ?auto_534636 ) ) ( not ( = ?auto_534635 ?auto_534637 ) ) ( not ( = ?auto_534635 ?auto_534638 ) ) ( not ( = ?auto_534635 ?auto_534639 ) ) ( not ( = ?auto_534635 ?auto_534640 ) ) ( not ( = ?auto_534635 ?auto_534641 ) ) ( not ( = ?auto_534635 ?auto_534642 ) ) ( not ( = ?auto_534635 ?auto_534643 ) ) ( not ( = ?auto_534636 ?auto_534637 ) ) ( not ( = ?auto_534636 ?auto_534638 ) ) ( not ( = ?auto_534636 ?auto_534639 ) ) ( not ( = ?auto_534636 ?auto_534640 ) ) ( not ( = ?auto_534636 ?auto_534641 ) ) ( not ( = ?auto_534636 ?auto_534642 ) ) ( not ( = ?auto_534636 ?auto_534643 ) ) ( not ( = ?auto_534637 ?auto_534638 ) ) ( not ( = ?auto_534637 ?auto_534639 ) ) ( not ( = ?auto_534637 ?auto_534640 ) ) ( not ( = ?auto_534637 ?auto_534641 ) ) ( not ( = ?auto_534637 ?auto_534642 ) ) ( not ( = ?auto_534637 ?auto_534643 ) ) ( not ( = ?auto_534638 ?auto_534639 ) ) ( not ( = ?auto_534638 ?auto_534640 ) ) ( not ( = ?auto_534638 ?auto_534641 ) ) ( not ( = ?auto_534638 ?auto_534642 ) ) ( not ( = ?auto_534638 ?auto_534643 ) ) ( not ( = ?auto_534639 ?auto_534640 ) ) ( not ( = ?auto_534639 ?auto_534641 ) ) ( not ( = ?auto_534639 ?auto_534642 ) ) ( not ( = ?auto_534639 ?auto_534643 ) ) ( not ( = ?auto_534640 ?auto_534641 ) ) ( not ( = ?auto_534640 ?auto_534642 ) ) ( not ( = ?auto_534640 ?auto_534643 ) ) ( not ( = ?auto_534641 ?auto_534642 ) ) ( not ( = ?auto_534641 ?auto_534643 ) ) ( not ( = ?auto_534642 ?auto_534643 ) ) ( ON ?auto_534641 ?auto_534642 ) ( CLEAR ?auto_534639 ) ( ON ?auto_534640 ?auto_534641 ) ( CLEAR ?auto_534640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_534635 ?auto_534636 ?auto_534637 ?auto_534638 ?auto_534639 ?auto_534640 )
      ( MAKE-8PILE ?auto_534635 ?auto_534636 ?auto_534637 ?auto_534638 ?auto_534639 ?auto_534640 ?auto_534641 ?auto_534642 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534669 - BLOCK
      ?auto_534670 - BLOCK
      ?auto_534671 - BLOCK
      ?auto_534672 - BLOCK
      ?auto_534673 - BLOCK
      ?auto_534674 - BLOCK
      ?auto_534675 - BLOCK
      ?auto_534676 - BLOCK
    )
    :vars
    (
      ?auto_534677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534676 ?auto_534677 ) ( ON-TABLE ?auto_534669 ) ( ON ?auto_534670 ?auto_534669 ) ( ON ?auto_534671 ?auto_534670 ) ( ON ?auto_534672 ?auto_534671 ) ( not ( = ?auto_534669 ?auto_534670 ) ) ( not ( = ?auto_534669 ?auto_534671 ) ) ( not ( = ?auto_534669 ?auto_534672 ) ) ( not ( = ?auto_534669 ?auto_534673 ) ) ( not ( = ?auto_534669 ?auto_534674 ) ) ( not ( = ?auto_534669 ?auto_534675 ) ) ( not ( = ?auto_534669 ?auto_534676 ) ) ( not ( = ?auto_534669 ?auto_534677 ) ) ( not ( = ?auto_534670 ?auto_534671 ) ) ( not ( = ?auto_534670 ?auto_534672 ) ) ( not ( = ?auto_534670 ?auto_534673 ) ) ( not ( = ?auto_534670 ?auto_534674 ) ) ( not ( = ?auto_534670 ?auto_534675 ) ) ( not ( = ?auto_534670 ?auto_534676 ) ) ( not ( = ?auto_534670 ?auto_534677 ) ) ( not ( = ?auto_534671 ?auto_534672 ) ) ( not ( = ?auto_534671 ?auto_534673 ) ) ( not ( = ?auto_534671 ?auto_534674 ) ) ( not ( = ?auto_534671 ?auto_534675 ) ) ( not ( = ?auto_534671 ?auto_534676 ) ) ( not ( = ?auto_534671 ?auto_534677 ) ) ( not ( = ?auto_534672 ?auto_534673 ) ) ( not ( = ?auto_534672 ?auto_534674 ) ) ( not ( = ?auto_534672 ?auto_534675 ) ) ( not ( = ?auto_534672 ?auto_534676 ) ) ( not ( = ?auto_534672 ?auto_534677 ) ) ( not ( = ?auto_534673 ?auto_534674 ) ) ( not ( = ?auto_534673 ?auto_534675 ) ) ( not ( = ?auto_534673 ?auto_534676 ) ) ( not ( = ?auto_534673 ?auto_534677 ) ) ( not ( = ?auto_534674 ?auto_534675 ) ) ( not ( = ?auto_534674 ?auto_534676 ) ) ( not ( = ?auto_534674 ?auto_534677 ) ) ( not ( = ?auto_534675 ?auto_534676 ) ) ( not ( = ?auto_534675 ?auto_534677 ) ) ( not ( = ?auto_534676 ?auto_534677 ) ) ( ON ?auto_534675 ?auto_534676 ) ( ON ?auto_534674 ?auto_534675 ) ( CLEAR ?auto_534672 ) ( ON ?auto_534673 ?auto_534674 ) ( CLEAR ?auto_534673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_534669 ?auto_534670 ?auto_534671 ?auto_534672 ?auto_534673 )
      ( MAKE-8PILE ?auto_534669 ?auto_534670 ?auto_534671 ?auto_534672 ?auto_534673 ?auto_534674 ?auto_534675 ?auto_534676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534703 - BLOCK
      ?auto_534704 - BLOCK
      ?auto_534705 - BLOCK
      ?auto_534706 - BLOCK
      ?auto_534707 - BLOCK
      ?auto_534708 - BLOCK
      ?auto_534709 - BLOCK
      ?auto_534710 - BLOCK
    )
    :vars
    (
      ?auto_534711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534710 ?auto_534711 ) ( ON-TABLE ?auto_534703 ) ( ON ?auto_534704 ?auto_534703 ) ( ON ?auto_534705 ?auto_534704 ) ( not ( = ?auto_534703 ?auto_534704 ) ) ( not ( = ?auto_534703 ?auto_534705 ) ) ( not ( = ?auto_534703 ?auto_534706 ) ) ( not ( = ?auto_534703 ?auto_534707 ) ) ( not ( = ?auto_534703 ?auto_534708 ) ) ( not ( = ?auto_534703 ?auto_534709 ) ) ( not ( = ?auto_534703 ?auto_534710 ) ) ( not ( = ?auto_534703 ?auto_534711 ) ) ( not ( = ?auto_534704 ?auto_534705 ) ) ( not ( = ?auto_534704 ?auto_534706 ) ) ( not ( = ?auto_534704 ?auto_534707 ) ) ( not ( = ?auto_534704 ?auto_534708 ) ) ( not ( = ?auto_534704 ?auto_534709 ) ) ( not ( = ?auto_534704 ?auto_534710 ) ) ( not ( = ?auto_534704 ?auto_534711 ) ) ( not ( = ?auto_534705 ?auto_534706 ) ) ( not ( = ?auto_534705 ?auto_534707 ) ) ( not ( = ?auto_534705 ?auto_534708 ) ) ( not ( = ?auto_534705 ?auto_534709 ) ) ( not ( = ?auto_534705 ?auto_534710 ) ) ( not ( = ?auto_534705 ?auto_534711 ) ) ( not ( = ?auto_534706 ?auto_534707 ) ) ( not ( = ?auto_534706 ?auto_534708 ) ) ( not ( = ?auto_534706 ?auto_534709 ) ) ( not ( = ?auto_534706 ?auto_534710 ) ) ( not ( = ?auto_534706 ?auto_534711 ) ) ( not ( = ?auto_534707 ?auto_534708 ) ) ( not ( = ?auto_534707 ?auto_534709 ) ) ( not ( = ?auto_534707 ?auto_534710 ) ) ( not ( = ?auto_534707 ?auto_534711 ) ) ( not ( = ?auto_534708 ?auto_534709 ) ) ( not ( = ?auto_534708 ?auto_534710 ) ) ( not ( = ?auto_534708 ?auto_534711 ) ) ( not ( = ?auto_534709 ?auto_534710 ) ) ( not ( = ?auto_534709 ?auto_534711 ) ) ( not ( = ?auto_534710 ?auto_534711 ) ) ( ON ?auto_534709 ?auto_534710 ) ( ON ?auto_534708 ?auto_534709 ) ( ON ?auto_534707 ?auto_534708 ) ( CLEAR ?auto_534705 ) ( ON ?auto_534706 ?auto_534707 ) ( CLEAR ?auto_534706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_534703 ?auto_534704 ?auto_534705 ?auto_534706 )
      ( MAKE-8PILE ?auto_534703 ?auto_534704 ?auto_534705 ?auto_534706 ?auto_534707 ?auto_534708 ?auto_534709 ?auto_534710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534737 - BLOCK
      ?auto_534738 - BLOCK
      ?auto_534739 - BLOCK
      ?auto_534740 - BLOCK
      ?auto_534741 - BLOCK
      ?auto_534742 - BLOCK
      ?auto_534743 - BLOCK
      ?auto_534744 - BLOCK
    )
    :vars
    (
      ?auto_534745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534744 ?auto_534745 ) ( ON-TABLE ?auto_534737 ) ( ON ?auto_534738 ?auto_534737 ) ( not ( = ?auto_534737 ?auto_534738 ) ) ( not ( = ?auto_534737 ?auto_534739 ) ) ( not ( = ?auto_534737 ?auto_534740 ) ) ( not ( = ?auto_534737 ?auto_534741 ) ) ( not ( = ?auto_534737 ?auto_534742 ) ) ( not ( = ?auto_534737 ?auto_534743 ) ) ( not ( = ?auto_534737 ?auto_534744 ) ) ( not ( = ?auto_534737 ?auto_534745 ) ) ( not ( = ?auto_534738 ?auto_534739 ) ) ( not ( = ?auto_534738 ?auto_534740 ) ) ( not ( = ?auto_534738 ?auto_534741 ) ) ( not ( = ?auto_534738 ?auto_534742 ) ) ( not ( = ?auto_534738 ?auto_534743 ) ) ( not ( = ?auto_534738 ?auto_534744 ) ) ( not ( = ?auto_534738 ?auto_534745 ) ) ( not ( = ?auto_534739 ?auto_534740 ) ) ( not ( = ?auto_534739 ?auto_534741 ) ) ( not ( = ?auto_534739 ?auto_534742 ) ) ( not ( = ?auto_534739 ?auto_534743 ) ) ( not ( = ?auto_534739 ?auto_534744 ) ) ( not ( = ?auto_534739 ?auto_534745 ) ) ( not ( = ?auto_534740 ?auto_534741 ) ) ( not ( = ?auto_534740 ?auto_534742 ) ) ( not ( = ?auto_534740 ?auto_534743 ) ) ( not ( = ?auto_534740 ?auto_534744 ) ) ( not ( = ?auto_534740 ?auto_534745 ) ) ( not ( = ?auto_534741 ?auto_534742 ) ) ( not ( = ?auto_534741 ?auto_534743 ) ) ( not ( = ?auto_534741 ?auto_534744 ) ) ( not ( = ?auto_534741 ?auto_534745 ) ) ( not ( = ?auto_534742 ?auto_534743 ) ) ( not ( = ?auto_534742 ?auto_534744 ) ) ( not ( = ?auto_534742 ?auto_534745 ) ) ( not ( = ?auto_534743 ?auto_534744 ) ) ( not ( = ?auto_534743 ?auto_534745 ) ) ( not ( = ?auto_534744 ?auto_534745 ) ) ( ON ?auto_534743 ?auto_534744 ) ( ON ?auto_534742 ?auto_534743 ) ( ON ?auto_534741 ?auto_534742 ) ( ON ?auto_534740 ?auto_534741 ) ( CLEAR ?auto_534738 ) ( ON ?auto_534739 ?auto_534740 ) ( CLEAR ?auto_534739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_534737 ?auto_534738 ?auto_534739 )
      ( MAKE-8PILE ?auto_534737 ?auto_534738 ?auto_534739 ?auto_534740 ?auto_534741 ?auto_534742 ?auto_534743 ?auto_534744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534771 - BLOCK
      ?auto_534772 - BLOCK
      ?auto_534773 - BLOCK
      ?auto_534774 - BLOCK
      ?auto_534775 - BLOCK
      ?auto_534776 - BLOCK
      ?auto_534777 - BLOCK
      ?auto_534778 - BLOCK
    )
    :vars
    (
      ?auto_534779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534778 ?auto_534779 ) ( ON-TABLE ?auto_534771 ) ( not ( = ?auto_534771 ?auto_534772 ) ) ( not ( = ?auto_534771 ?auto_534773 ) ) ( not ( = ?auto_534771 ?auto_534774 ) ) ( not ( = ?auto_534771 ?auto_534775 ) ) ( not ( = ?auto_534771 ?auto_534776 ) ) ( not ( = ?auto_534771 ?auto_534777 ) ) ( not ( = ?auto_534771 ?auto_534778 ) ) ( not ( = ?auto_534771 ?auto_534779 ) ) ( not ( = ?auto_534772 ?auto_534773 ) ) ( not ( = ?auto_534772 ?auto_534774 ) ) ( not ( = ?auto_534772 ?auto_534775 ) ) ( not ( = ?auto_534772 ?auto_534776 ) ) ( not ( = ?auto_534772 ?auto_534777 ) ) ( not ( = ?auto_534772 ?auto_534778 ) ) ( not ( = ?auto_534772 ?auto_534779 ) ) ( not ( = ?auto_534773 ?auto_534774 ) ) ( not ( = ?auto_534773 ?auto_534775 ) ) ( not ( = ?auto_534773 ?auto_534776 ) ) ( not ( = ?auto_534773 ?auto_534777 ) ) ( not ( = ?auto_534773 ?auto_534778 ) ) ( not ( = ?auto_534773 ?auto_534779 ) ) ( not ( = ?auto_534774 ?auto_534775 ) ) ( not ( = ?auto_534774 ?auto_534776 ) ) ( not ( = ?auto_534774 ?auto_534777 ) ) ( not ( = ?auto_534774 ?auto_534778 ) ) ( not ( = ?auto_534774 ?auto_534779 ) ) ( not ( = ?auto_534775 ?auto_534776 ) ) ( not ( = ?auto_534775 ?auto_534777 ) ) ( not ( = ?auto_534775 ?auto_534778 ) ) ( not ( = ?auto_534775 ?auto_534779 ) ) ( not ( = ?auto_534776 ?auto_534777 ) ) ( not ( = ?auto_534776 ?auto_534778 ) ) ( not ( = ?auto_534776 ?auto_534779 ) ) ( not ( = ?auto_534777 ?auto_534778 ) ) ( not ( = ?auto_534777 ?auto_534779 ) ) ( not ( = ?auto_534778 ?auto_534779 ) ) ( ON ?auto_534777 ?auto_534778 ) ( ON ?auto_534776 ?auto_534777 ) ( ON ?auto_534775 ?auto_534776 ) ( ON ?auto_534774 ?auto_534775 ) ( ON ?auto_534773 ?auto_534774 ) ( CLEAR ?auto_534771 ) ( ON ?auto_534772 ?auto_534773 ) ( CLEAR ?auto_534772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_534771 ?auto_534772 )
      ( MAKE-8PILE ?auto_534771 ?auto_534772 ?auto_534773 ?auto_534774 ?auto_534775 ?auto_534776 ?auto_534777 ?auto_534778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_534805 - BLOCK
      ?auto_534806 - BLOCK
      ?auto_534807 - BLOCK
      ?auto_534808 - BLOCK
      ?auto_534809 - BLOCK
      ?auto_534810 - BLOCK
      ?auto_534811 - BLOCK
      ?auto_534812 - BLOCK
    )
    :vars
    (
      ?auto_534813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534812 ?auto_534813 ) ( not ( = ?auto_534805 ?auto_534806 ) ) ( not ( = ?auto_534805 ?auto_534807 ) ) ( not ( = ?auto_534805 ?auto_534808 ) ) ( not ( = ?auto_534805 ?auto_534809 ) ) ( not ( = ?auto_534805 ?auto_534810 ) ) ( not ( = ?auto_534805 ?auto_534811 ) ) ( not ( = ?auto_534805 ?auto_534812 ) ) ( not ( = ?auto_534805 ?auto_534813 ) ) ( not ( = ?auto_534806 ?auto_534807 ) ) ( not ( = ?auto_534806 ?auto_534808 ) ) ( not ( = ?auto_534806 ?auto_534809 ) ) ( not ( = ?auto_534806 ?auto_534810 ) ) ( not ( = ?auto_534806 ?auto_534811 ) ) ( not ( = ?auto_534806 ?auto_534812 ) ) ( not ( = ?auto_534806 ?auto_534813 ) ) ( not ( = ?auto_534807 ?auto_534808 ) ) ( not ( = ?auto_534807 ?auto_534809 ) ) ( not ( = ?auto_534807 ?auto_534810 ) ) ( not ( = ?auto_534807 ?auto_534811 ) ) ( not ( = ?auto_534807 ?auto_534812 ) ) ( not ( = ?auto_534807 ?auto_534813 ) ) ( not ( = ?auto_534808 ?auto_534809 ) ) ( not ( = ?auto_534808 ?auto_534810 ) ) ( not ( = ?auto_534808 ?auto_534811 ) ) ( not ( = ?auto_534808 ?auto_534812 ) ) ( not ( = ?auto_534808 ?auto_534813 ) ) ( not ( = ?auto_534809 ?auto_534810 ) ) ( not ( = ?auto_534809 ?auto_534811 ) ) ( not ( = ?auto_534809 ?auto_534812 ) ) ( not ( = ?auto_534809 ?auto_534813 ) ) ( not ( = ?auto_534810 ?auto_534811 ) ) ( not ( = ?auto_534810 ?auto_534812 ) ) ( not ( = ?auto_534810 ?auto_534813 ) ) ( not ( = ?auto_534811 ?auto_534812 ) ) ( not ( = ?auto_534811 ?auto_534813 ) ) ( not ( = ?auto_534812 ?auto_534813 ) ) ( ON ?auto_534811 ?auto_534812 ) ( ON ?auto_534810 ?auto_534811 ) ( ON ?auto_534809 ?auto_534810 ) ( ON ?auto_534808 ?auto_534809 ) ( ON ?auto_534807 ?auto_534808 ) ( ON ?auto_534806 ?auto_534807 ) ( ON ?auto_534805 ?auto_534806 ) ( CLEAR ?auto_534805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_534805 )
      ( MAKE-8PILE ?auto_534805 ?auto_534806 ?auto_534807 ?auto_534808 ?auto_534809 ?auto_534810 ?auto_534811 ?auto_534812 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_534840 - BLOCK
      ?auto_534841 - BLOCK
      ?auto_534842 - BLOCK
      ?auto_534843 - BLOCK
      ?auto_534844 - BLOCK
      ?auto_534845 - BLOCK
      ?auto_534846 - BLOCK
      ?auto_534847 - BLOCK
      ?auto_534848 - BLOCK
    )
    :vars
    (
      ?auto_534849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_534847 ) ( ON ?auto_534848 ?auto_534849 ) ( CLEAR ?auto_534848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_534840 ) ( ON ?auto_534841 ?auto_534840 ) ( ON ?auto_534842 ?auto_534841 ) ( ON ?auto_534843 ?auto_534842 ) ( ON ?auto_534844 ?auto_534843 ) ( ON ?auto_534845 ?auto_534844 ) ( ON ?auto_534846 ?auto_534845 ) ( ON ?auto_534847 ?auto_534846 ) ( not ( = ?auto_534840 ?auto_534841 ) ) ( not ( = ?auto_534840 ?auto_534842 ) ) ( not ( = ?auto_534840 ?auto_534843 ) ) ( not ( = ?auto_534840 ?auto_534844 ) ) ( not ( = ?auto_534840 ?auto_534845 ) ) ( not ( = ?auto_534840 ?auto_534846 ) ) ( not ( = ?auto_534840 ?auto_534847 ) ) ( not ( = ?auto_534840 ?auto_534848 ) ) ( not ( = ?auto_534840 ?auto_534849 ) ) ( not ( = ?auto_534841 ?auto_534842 ) ) ( not ( = ?auto_534841 ?auto_534843 ) ) ( not ( = ?auto_534841 ?auto_534844 ) ) ( not ( = ?auto_534841 ?auto_534845 ) ) ( not ( = ?auto_534841 ?auto_534846 ) ) ( not ( = ?auto_534841 ?auto_534847 ) ) ( not ( = ?auto_534841 ?auto_534848 ) ) ( not ( = ?auto_534841 ?auto_534849 ) ) ( not ( = ?auto_534842 ?auto_534843 ) ) ( not ( = ?auto_534842 ?auto_534844 ) ) ( not ( = ?auto_534842 ?auto_534845 ) ) ( not ( = ?auto_534842 ?auto_534846 ) ) ( not ( = ?auto_534842 ?auto_534847 ) ) ( not ( = ?auto_534842 ?auto_534848 ) ) ( not ( = ?auto_534842 ?auto_534849 ) ) ( not ( = ?auto_534843 ?auto_534844 ) ) ( not ( = ?auto_534843 ?auto_534845 ) ) ( not ( = ?auto_534843 ?auto_534846 ) ) ( not ( = ?auto_534843 ?auto_534847 ) ) ( not ( = ?auto_534843 ?auto_534848 ) ) ( not ( = ?auto_534843 ?auto_534849 ) ) ( not ( = ?auto_534844 ?auto_534845 ) ) ( not ( = ?auto_534844 ?auto_534846 ) ) ( not ( = ?auto_534844 ?auto_534847 ) ) ( not ( = ?auto_534844 ?auto_534848 ) ) ( not ( = ?auto_534844 ?auto_534849 ) ) ( not ( = ?auto_534845 ?auto_534846 ) ) ( not ( = ?auto_534845 ?auto_534847 ) ) ( not ( = ?auto_534845 ?auto_534848 ) ) ( not ( = ?auto_534845 ?auto_534849 ) ) ( not ( = ?auto_534846 ?auto_534847 ) ) ( not ( = ?auto_534846 ?auto_534848 ) ) ( not ( = ?auto_534846 ?auto_534849 ) ) ( not ( = ?auto_534847 ?auto_534848 ) ) ( not ( = ?auto_534847 ?auto_534849 ) ) ( not ( = ?auto_534848 ?auto_534849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_534848 ?auto_534849 )
      ( !STACK ?auto_534848 ?auto_534847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_534878 - BLOCK
      ?auto_534879 - BLOCK
      ?auto_534880 - BLOCK
      ?auto_534881 - BLOCK
      ?auto_534882 - BLOCK
      ?auto_534883 - BLOCK
      ?auto_534884 - BLOCK
      ?auto_534885 - BLOCK
      ?auto_534886 - BLOCK
    )
    :vars
    (
      ?auto_534887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534886 ?auto_534887 ) ( ON-TABLE ?auto_534878 ) ( ON ?auto_534879 ?auto_534878 ) ( ON ?auto_534880 ?auto_534879 ) ( ON ?auto_534881 ?auto_534880 ) ( ON ?auto_534882 ?auto_534881 ) ( ON ?auto_534883 ?auto_534882 ) ( ON ?auto_534884 ?auto_534883 ) ( not ( = ?auto_534878 ?auto_534879 ) ) ( not ( = ?auto_534878 ?auto_534880 ) ) ( not ( = ?auto_534878 ?auto_534881 ) ) ( not ( = ?auto_534878 ?auto_534882 ) ) ( not ( = ?auto_534878 ?auto_534883 ) ) ( not ( = ?auto_534878 ?auto_534884 ) ) ( not ( = ?auto_534878 ?auto_534885 ) ) ( not ( = ?auto_534878 ?auto_534886 ) ) ( not ( = ?auto_534878 ?auto_534887 ) ) ( not ( = ?auto_534879 ?auto_534880 ) ) ( not ( = ?auto_534879 ?auto_534881 ) ) ( not ( = ?auto_534879 ?auto_534882 ) ) ( not ( = ?auto_534879 ?auto_534883 ) ) ( not ( = ?auto_534879 ?auto_534884 ) ) ( not ( = ?auto_534879 ?auto_534885 ) ) ( not ( = ?auto_534879 ?auto_534886 ) ) ( not ( = ?auto_534879 ?auto_534887 ) ) ( not ( = ?auto_534880 ?auto_534881 ) ) ( not ( = ?auto_534880 ?auto_534882 ) ) ( not ( = ?auto_534880 ?auto_534883 ) ) ( not ( = ?auto_534880 ?auto_534884 ) ) ( not ( = ?auto_534880 ?auto_534885 ) ) ( not ( = ?auto_534880 ?auto_534886 ) ) ( not ( = ?auto_534880 ?auto_534887 ) ) ( not ( = ?auto_534881 ?auto_534882 ) ) ( not ( = ?auto_534881 ?auto_534883 ) ) ( not ( = ?auto_534881 ?auto_534884 ) ) ( not ( = ?auto_534881 ?auto_534885 ) ) ( not ( = ?auto_534881 ?auto_534886 ) ) ( not ( = ?auto_534881 ?auto_534887 ) ) ( not ( = ?auto_534882 ?auto_534883 ) ) ( not ( = ?auto_534882 ?auto_534884 ) ) ( not ( = ?auto_534882 ?auto_534885 ) ) ( not ( = ?auto_534882 ?auto_534886 ) ) ( not ( = ?auto_534882 ?auto_534887 ) ) ( not ( = ?auto_534883 ?auto_534884 ) ) ( not ( = ?auto_534883 ?auto_534885 ) ) ( not ( = ?auto_534883 ?auto_534886 ) ) ( not ( = ?auto_534883 ?auto_534887 ) ) ( not ( = ?auto_534884 ?auto_534885 ) ) ( not ( = ?auto_534884 ?auto_534886 ) ) ( not ( = ?auto_534884 ?auto_534887 ) ) ( not ( = ?auto_534885 ?auto_534886 ) ) ( not ( = ?auto_534885 ?auto_534887 ) ) ( not ( = ?auto_534886 ?auto_534887 ) ) ( CLEAR ?auto_534884 ) ( ON ?auto_534885 ?auto_534886 ) ( CLEAR ?auto_534885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_534878 ?auto_534879 ?auto_534880 ?auto_534881 ?auto_534882 ?auto_534883 ?auto_534884 ?auto_534885 )
      ( MAKE-9PILE ?auto_534878 ?auto_534879 ?auto_534880 ?auto_534881 ?auto_534882 ?auto_534883 ?auto_534884 ?auto_534885 ?auto_534886 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_534916 - BLOCK
      ?auto_534917 - BLOCK
      ?auto_534918 - BLOCK
      ?auto_534919 - BLOCK
      ?auto_534920 - BLOCK
      ?auto_534921 - BLOCK
      ?auto_534922 - BLOCK
      ?auto_534923 - BLOCK
      ?auto_534924 - BLOCK
    )
    :vars
    (
      ?auto_534925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534924 ?auto_534925 ) ( ON-TABLE ?auto_534916 ) ( ON ?auto_534917 ?auto_534916 ) ( ON ?auto_534918 ?auto_534917 ) ( ON ?auto_534919 ?auto_534918 ) ( ON ?auto_534920 ?auto_534919 ) ( ON ?auto_534921 ?auto_534920 ) ( not ( = ?auto_534916 ?auto_534917 ) ) ( not ( = ?auto_534916 ?auto_534918 ) ) ( not ( = ?auto_534916 ?auto_534919 ) ) ( not ( = ?auto_534916 ?auto_534920 ) ) ( not ( = ?auto_534916 ?auto_534921 ) ) ( not ( = ?auto_534916 ?auto_534922 ) ) ( not ( = ?auto_534916 ?auto_534923 ) ) ( not ( = ?auto_534916 ?auto_534924 ) ) ( not ( = ?auto_534916 ?auto_534925 ) ) ( not ( = ?auto_534917 ?auto_534918 ) ) ( not ( = ?auto_534917 ?auto_534919 ) ) ( not ( = ?auto_534917 ?auto_534920 ) ) ( not ( = ?auto_534917 ?auto_534921 ) ) ( not ( = ?auto_534917 ?auto_534922 ) ) ( not ( = ?auto_534917 ?auto_534923 ) ) ( not ( = ?auto_534917 ?auto_534924 ) ) ( not ( = ?auto_534917 ?auto_534925 ) ) ( not ( = ?auto_534918 ?auto_534919 ) ) ( not ( = ?auto_534918 ?auto_534920 ) ) ( not ( = ?auto_534918 ?auto_534921 ) ) ( not ( = ?auto_534918 ?auto_534922 ) ) ( not ( = ?auto_534918 ?auto_534923 ) ) ( not ( = ?auto_534918 ?auto_534924 ) ) ( not ( = ?auto_534918 ?auto_534925 ) ) ( not ( = ?auto_534919 ?auto_534920 ) ) ( not ( = ?auto_534919 ?auto_534921 ) ) ( not ( = ?auto_534919 ?auto_534922 ) ) ( not ( = ?auto_534919 ?auto_534923 ) ) ( not ( = ?auto_534919 ?auto_534924 ) ) ( not ( = ?auto_534919 ?auto_534925 ) ) ( not ( = ?auto_534920 ?auto_534921 ) ) ( not ( = ?auto_534920 ?auto_534922 ) ) ( not ( = ?auto_534920 ?auto_534923 ) ) ( not ( = ?auto_534920 ?auto_534924 ) ) ( not ( = ?auto_534920 ?auto_534925 ) ) ( not ( = ?auto_534921 ?auto_534922 ) ) ( not ( = ?auto_534921 ?auto_534923 ) ) ( not ( = ?auto_534921 ?auto_534924 ) ) ( not ( = ?auto_534921 ?auto_534925 ) ) ( not ( = ?auto_534922 ?auto_534923 ) ) ( not ( = ?auto_534922 ?auto_534924 ) ) ( not ( = ?auto_534922 ?auto_534925 ) ) ( not ( = ?auto_534923 ?auto_534924 ) ) ( not ( = ?auto_534923 ?auto_534925 ) ) ( not ( = ?auto_534924 ?auto_534925 ) ) ( ON ?auto_534923 ?auto_534924 ) ( CLEAR ?auto_534921 ) ( ON ?auto_534922 ?auto_534923 ) ( CLEAR ?auto_534922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_534916 ?auto_534917 ?auto_534918 ?auto_534919 ?auto_534920 ?auto_534921 ?auto_534922 )
      ( MAKE-9PILE ?auto_534916 ?auto_534917 ?auto_534918 ?auto_534919 ?auto_534920 ?auto_534921 ?auto_534922 ?auto_534923 ?auto_534924 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_534954 - BLOCK
      ?auto_534955 - BLOCK
      ?auto_534956 - BLOCK
      ?auto_534957 - BLOCK
      ?auto_534958 - BLOCK
      ?auto_534959 - BLOCK
      ?auto_534960 - BLOCK
      ?auto_534961 - BLOCK
      ?auto_534962 - BLOCK
    )
    :vars
    (
      ?auto_534963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_534962 ?auto_534963 ) ( ON-TABLE ?auto_534954 ) ( ON ?auto_534955 ?auto_534954 ) ( ON ?auto_534956 ?auto_534955 ) ( ON ?auto_534957 ?auto_534956 ) ( ON ?auto_534958 ?auto_534957 ) ( not ( = ?auto_534954 ?auto_534955 ) ) ( not ( = ?auto_534954 ?auto_534956 ) ) ( not ( = ?auto_534954 ?auto_534957 ) ) ( not ( = ?auto_534954 ?auto_534958 ) ) ( not ( = ?auto_534954 ?auto_534959 ) ) ( not ( = ?auto_534954 ?auto_534960 ) ) ( not ( = ?auto_534954 ?auto_534961 ) ) ( not ( = ?auto_534954 ?auto_534962 ) ) ( not ( = ?auto_534954 ?auto_534963 ) ) ( not ( = ?auto_534955 ?auto_534956 ) ) ( not ( = ?auto_534955 ?auto_534957 ) ) ( not ( = ?auto_534955 ?auto_534958 ) ) ( not ( = ?auto_534955 ?auto_534959 ) ) ( not ( = ?auto_534955 ?auto_534960 ) ) ( not ( = ?auto_534955 ?auto_534961 ) ) ( not ( = ?auto_534955 ?auto_534962 ) ) ( not ( = ?auto_534955 ?auto_534963 ) ) ( not ( = ?auto_534956 ?auto_534957 ) ) ( not ( = ?auto_534956 ?auto_534958 ) ) ( not ( = ?auto_534956 ?auto_534959 ) ) ( not ( = ?auto_534956 ?auto_534960 ) ) ( not ( = ?auto_534956 ?auto_534961 ) ) ( not ( = ?auto_534956 ?auto_534962 ) ) ( not ( = ?auto_534956 ?auto_534963 ) ) ( not ( = ?auto_534957 ?auto_534958 ) ) ( not ( = ?auto_534957 ?auto_534959 ) ) ( not ( = ?auto_534957 ?auto_534960 ) ) ( not ( = ?auto_534957 ?auto_534961 ) ) ( not ( = ?auto_534957 ?auto_534962 ) ) ( not ( = ?auto_534957 ?auto_534963 ) ) ( not ( = ?auto_534958 ?auto_534959 ) ) ( not ( = ?auto_534958 ?auto_534960 ) ) ( not ( = ?auto_534958 ?auto_534961 ) ) ( not ( = ?auto_534958 ?auto_534962 ) ) ( not ( = ?auto_534958 ?auto_534963 ) ) ( not ( = ?auto_534959 ?auto_534960 ) ) ( not ( = ?auto_534959 ?auto_534961 ) ) ( not ( = ?auto_534959 ?auto_534962 ) ) ( not ( = ?auto_534959 ?auto_534963 ) ) ( not ( = ?auto_534960 ?auto_534961 ) ) ( not ( = ?auto_534960 ?auto_534962 ) ) ( not ( = ?auto_534960 ?auto_534963 ) ) ( not ( = ?auto_534961 ?auto_534962 ) ) ( not ( = ?auto_534961 ?auto_534963 ) ) ( not ( = ?auto_534962 ?auto_534963 ) ) ( ON ?auto_534961 ?auto_534962 ) ( ON ?auto_534960 ?auto_534961 ) ( CLEAR ?auto_534958 ) ( ON ?auto_534959 ?auto_534960 ) ( CLEAR ?auto_534959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_534954 ?auto_534955 ?auto_534956 ?auto_534957 ?auto_534958 ?auto_534959 )
      ( MAKE-9PILE ?auto_534954 ?auto_534955 ?auto_534956 ?auto_534957 ?auto_534958 ?auto_534959 ?auto_534960 ?auto_534961 ?auto_534962 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_534992 - BLOCK
      ?auto_534993 - BLOCK
      ?auto_534994 - BLOCK
      ?auto_534995 - BLOCK
      ?auto_534996 - BLOCK
      ?auto_534997 - BLOCK
      ?auto_534998 - BLOCK
      ?auto_534999 - BLOCK
      ?auto_535000 - BLOCK
    )
    :vars
    (
      ?auto_535001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535000 ?auto_535001 ) ( ON-TABLE ?auto_534992 ) ( ON ?auto_534993 ?auto_534992 ) ( ON ?auto_534994 ?auto_534993 ) ( ON ?auto_534995 ?auto_534994 ) ( not ( = ?auto_534992 ?auto_534993 ) ) ( not ( = ?auto_534992 ?auto_534994 ) ) ( not ( = ?auto_534992 ?auto_534995 ) ) ( not ( = ?auto_534992 ?auto_534996 ) ) ( not ( = ?auto_534992 ?auto_534997 ) ) ( not ( = ?auto_534992 ?auto_534998 ) ) ( not ( = ?auto_534992 ?auto_534999 ) ) ( not ( = ?auto_534992 ?auto_535000 ) ) ( not ( = ?auto_534992 ?auto_535001 ) ) ( not ( = ?auto_534993 ?auto_534994 ) ) ( not ( = ?auto_534993 ?auto_534995 ) ) ( not ( = ?auto_534993 ?auto_534996 ) ) ( not ( = ?auto_534993 ?auto_534997 ) ) ( not ( = ?auto_534993 ?auto_534998 ) ) ( not ( = ?auto_534993 ?auto_534999 ) ) ( not ( = ?auto_534993 ?auto_535000 ) ) ( not ( = ?auto_534993 ?auto_535001 ) ) ( not ( = ?auto_534994 ?auto_534995 ) ) ( not ( = ?auto_534994 ?auto_534996 ) ) ( not ( = ?auto_534994 ?auto_534997 ) ) ( not ( = ?auto_534994 ?auto_534998 ) ) ( not ( = ?auto_534994 ?auto_534999 ) ) ( not ( = ?auto_534994 ?auto_535000 ) ) ( not ( = ?auto_534994 ?auto_535001 ) ) ( not ( = ?auto_534995 ?auto_534996 ) ) ( not ( = ?auto_534995 ?auto_534997 ) ) ( not ( = ?auto_534995 ?auto_534998 ) ) ( not ( = ?auto_534995 ?auto_534999 ) ) ( not ( = ?auto_534995 ?auto_535000 ) ) ( not ( = ?auto_534995 ?auto_535001 ) ) ( not ( = ?auto_534996 ?auto_534997 ) ) ( not ( = ?auto_534996 ?auto_534998 ) ) ( not ( = ?auto_534996 ?auto_534999 ) ) ( not ( = ?auto_534996 ?auto_535000 ) ) ( not ( = ?auto_534996 ?auto_535001 ) ) ( not ( = ?auto_534997 ?auto_534998 ) ) ( not ( = ?auto_534997 ?auto_534999 ) ) ( not ( = ?auto_534997 ?auto_535000 ) ) ( not ( = ?auto_534997 ?auto_535001 ) ) ( not ( = ?auto_534998 ?auto_534999 ) ) ( not ( = ?auto_534998 ?auto_535000 ) ) ( not ( = ?auto_534998 ?auto_535001 ) ) ( not ( = ?auto_534999 ?auto_535000 ) ) ( not ( = ?auto_534999 ?auto_535001 ) ) ( not ( = ?auto_535000 ?auto_535001 ) ) ( ON ?auto_534999 ?auto_535000 ) ( ON ?auto_534998 ?auto_534999 ) ( ON ?auto_534997 ?auto_534998 ) ( CLEAR ?auto_534995 ) ( ON ?auto_534996 ?auto_534997 ) ( CLEAR ?auto_534996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_534992 ?auto_534993 ?auto_534994 ?auto_534995 ?auto_534996 )
      ( MAKE-9PILE ?auto_534992 ?auto_534993 ?auto_534994 ?auto_534995 ?auto_534996 ?auto_534997 ?auto_534998 ?auto_534999 ?auto_535000 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_535030 - BLOCK
      ?auto_535031 - BLOCK
      ?auto_535032 - BLOCK
      ?auto_535033 - BLOCK
      ?auto_535034 - BLOCK
      ?auto_535035 - BLOCK
      ?auto_535036 - BLOCK
      ?auto_535037 - BLOCK
      ?auto_535038 - BLOCK
    )
    :vars
    (
      ?auto_535039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535038 ?auto_535039 ) ( ON-TABLE ?auto_535030 ) ( ON ?auto_535031 ?auto_535030 ) ( ON ?auto_535032 ?auto_535031 ) ( not ( = ?auto_535030 ?auto_535031 ) ) ( not ( = ?auto_535030 ?auto_535032 ) ) ( not ( = ?auto_535030 ?auto_535033 ) ) ( not ( = ?auto_535030 ?auto_535034 ) ) ( not ( = ?auto_535030 ?auto_535035 ) ) ( not ( = ?auto_535030 ?auto_535036 ) ) ( not ( = ?auto_535030 ?auto_535037 ) ) ( not ( = ?auto_535030 ?auto_535038 ) ) ( not ( = ?auto_535030 ?auto_535039 ) ) ( not ( = ?auto_535031 ?auto_535032 ) ) ( not ( = ?auto_535031 ?auto_535033 ) ) ( not ( = ?auto_535031 ?auto_535034 ) ) ( not ( = ?auto_535031 ?auto_535035 ) ) ( not ( = ?auto_535031 ?auto_535036 ) ) ( not ( = ?auto_535031 ?auto_535037 ) ) ( not ( = ?auto_535031 ?auto_535038 ) ) ( not ( = ?auto_535031 ?auto_535039 ) ) ( not ( = ?auto_535032 ?auto_535033 ) ) ( not ( = ?auto_535032 ?auto_535034 ) ) ( not ( = ?auto_535032 ?auto_535035 ) ) ( not ( = ?auto_535032 ?auto_535036 ) ) ( not ( = ?auto_535032 ?auto_535037 ) ) ( not ( = ?auto_535032 ?auto_535038 ) ) ( not ( = ?auto_535032 ?auto_535039 ) ) ( not ( = ?auto_535033 ?auto_535034 ) ) ( not ( = ?auto_535033 ?auto_535035 ) ) ( not ( = ?auto_535033 ?auto_535036 ) ) ( not ( = ?auto_535033 ?auto_535037 ) ) ( not ( = ?auto_535033 ?auto_535038 ) ) ( not ( = ?auto_535033 ?auto_535039 ) ) ( not ( = ?auto_535034 ?auto_535035 ) ) ( not ( = ?auto_535034 ?auto_535036 ) ) ( not ( = ?auto_535034 ?auto_535037 ) ) ( not ( = ?auto_535034 ?auto_535038 ) ) ( not ( = ?auto_535034 ?auto_535039 ) ) ( not ( = ?auto_535035 ?auto_535036 ) ) ( not ( = ?auto_535035 ?auto_535037 ) ) ( not ( = ?auto_535035 ?auto_535038 ) ) ( not ( = ?auto_535035 ?auto_535039 ) ) ( not ( = ?auto_535036 ?auto_535037 ) ) ( not ( = ?auto_535036 ?auto_535038 ) ) ( not ( = ?auto_535036 ?auto_535039 ) ) ( not ( = ?auto_535037 ?auto_535038 ) ) ( not ( = ?auto_535037 ?auto_535039 ) ) ( not ( = ?auto_535038 ?auto_535039 ) ) ( ON ?auto_535037 ?auto_535038 ) ( ON ?auto_535036 ?auto_535037 ) ( ON ?auto_535035 ?auto_535036 ) ( ON ?auto_535034 ?auto_535035 ) ( CLEAR ?auto_535032 ) ( ON ?auto_535033 ?auto_535034 ) ( CLEAR ?auto_535033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_535030 ?auto_535031 ?auto_535032 ?auto_535033 )
      ( MAKE-9PILE ?auto_535030 ?auto_535031 ?auto_535032 ?auto_535033 ?auto_535034 ?auto_535035 ?auto_535036 ?auto_535037 ?auto_535038 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_535068 - BLOCK
      ?auto_535069 - BLOCK
      ?auto_535070 - BLOCK
      ?auto_535071 - BLOCK
      ?auto_535072 - BLOCK
      ?auto_535073 - BLOCK
      ?auto_535074 - BLOCK
      ?auto_535075 - BLOCK
      ?auto_535076 - BLOCK
    )
    :vars
    (
      ?auto_535077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535076 ?auto_535077 ) ( ON-TABLE ?auto_535068 ) ( ON ?auto_535069 ?auto_535068 ) ( not ( = ?auto_535068 ?auto_535069 ) ) ( not ( = ?auto_535068 ?auto_535070 ) ) ( not ( = ?auto_535068 ?auto_535071 ) ) ( not ( = ?auto_535068 ?auto_535072 ) ) ( not ( = ?auto_535068 ?auto_535073 ) ) ( not ( = ?auto_535068 ?auto_535074 ) ) ( not ( = ?auto_535068 ?auto_535075 ) ) ( not ( = ?auto_535068 ?auto_535076 ) ) ( not ( = ?auto_535068 ?auto_535077 ) ) ( not ( = ?auto_535069 ?auto_535070 ) ) ( not ( = ?auto_535069 ?auto_535071 ) ) ( not ( = ?auto_535069 ?auto_535072 ) ) ( not ( = ?auto_535069 ?auto_535073 ) ) ( not ( = ?auto_535069 ?auto_535074 ) ) ( not ( = ?auto_535069 ?auto_535075 ) ) ( not ( = ?auto_535069 ?auto_535076 ) ) ( not ( = ?auto_535069 ?auto_535077 ) ) ( not ( = ?auto_535070 ?auto_535071 ) ) ( not ( = ?auto_535070 ?auto_535072 ) ) ( not ( = ?auto_535070 ?auto_535073 ) ) ( not ( = ?auto_535070 ?auto_535074 ) ) ( not ( = ?auto_535070 ?auto_535075 ) ) ( not ( = ?auto_535070 ?auto_535076 ) ) ( not ( = ?auto_535070 ?auto_535077 ) ) ( not ( = ?auto_535071 ?auto_535072 ) ) ( not ( = ?auto_535071 ?auto_535073 ) ) ( not ( = ?auto_535071 ?auto_535074 ) ) ( not ( = ?auto_535071 ?auto_535075 ) ) ( not ( = ?auto_535071 ?auto_535076 ) ) ( not ( = ?auto_535071 ?auto_535077 ) ) ( not ( = ?auto_535072 ?auto_535073 ) ) ( not ( = ?auto_535072 ?auto_535074 ) ) ( not ( = ?auto_535072 ?auto_535075 ) ) ( not ( = ?auto_535072 ?auto_535076 ) ) ( not ( = ?auto_535072 ?auto_535077 ) ) ( not ( = ?auto_535073 ?auto_535074 ) ) ( not ( = ?auto_535073 ?auto_535075 ) ) ( not ( = ?auto_535073 ?auto_535076 ) ) ( not ( = ?auto_535073 ?auto_535077 ) ) ( not ( = ?auto_535074 ?auto_535075 ) ) ( not ( = ?auto_535074 ?auto_535076 ) ) ( not ( = ?auto_535074 ?auto_535077 ) ) ( not ( = ?auto_535075 ?auto_535076 ) ) ( not ( = ?auto_535075 ?auto_535077 ) ) ( not ( = ?auto_535076 ?auto_535077 ) ) ( ON ?auto_535075 ?auto_535076 ) ( ON ?auto_535074 ?auto_535075 ) ( ON ?auto_535073 ?auto_535074 ) ( ON ?auto_535072 ?auto_535073 ) ( ON ?auto_535071 ?auto_535072 ) ( CLEAR ?auto_535069 ) ( ON ?auto_535070 ?auto_535071 ) ( CLEAR ?auto_535070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_535068 ?auto_535069 ?auto_535070 )
      ( MAKE-9PILE ?auto_535068 ?auto_535069 ?auto_535070 ?auto_535071 ?auto_535072 ?auto_535073 ?auto_535074 ?auto_535075 ?auto_535076 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_535106 - BLOCK
      ?auto_535107 - BLOCK
      ?auto_535108 - BLOCK
      ?auto_535109 - BLOCK
      ?auto_535110 - BLOCK
      ?auto_535111 - BLOCK
      ?auto_535112 - BLOCK
      ?auto_535113 - BLOCK
      ?auto_535114 - BLOCK
    )
    :vars
    (
      ?auto_535115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535114 ?auto_535115 ) ( ON-TABLE ?auto_535106 ) ( not ( = ?auto_535106 ?auto_535107 ) ) ( not ( = ?auto_535106 ?auto_535108 ) ) ( not ( = ?auto_535106 ?auto_535109 ) ) ( not ( = ?auto_535106 ?auto_535110 ) ) ( not ( = ?auto_535106 ?auto_535111 ) ) ( not ( = ?auto_535106 ?auto_535112 ) ) ( not ( = ?auto_535106 ?auto_535113 ) ) ( not ( = ?auto_535106 ?auto_535114 ) ) ( not ( = ?auto_535106 ?auto_535115 ) ) ( not ( = ?auto_535107 ?auto_535108 ) ) ( not ( = ?auto_535107 ?auto_535109 ) ) ( not ( = ?auto_535107 ?auto_535110 ) ) ( not ( = ?auto_535107 ?auto_535111 ) ) ( not ( = ?auto_535107 ?auto_535112 ) ) ( not ( = ?auto_535107 ?auto_535113 ) ) ( not ( = ?auto_535107 ?auto_535114 ) ) ( not ( = ?auto_535107 ?auto_535115 ) ) ( not ( = ?auto_535108 ?auto_535109 ) ) ( not ( = ?auto_535108 ?auto_535110 ) ) ( not ( = ?auto_535108 ?auto_535111 ) ) ( not ( = ?auto_535108 ?auto_535112 ) ) ( not ( = ?auto_535108 ?auto_535113 ) ) ( not ( = ?auto_535108 ?auto_535114 ) ) ( not ( = ?auto_535108 ?auto_535115 ) ) ( not ( = ?auto_535109 ?auto_535110 ) ) ( not ( = ?auto_535109 ?auto_535111 ) ) ( not ( = ?auto_535109 ?auto_535112 ) ) ( not ( = ?auto_535109 ?auto_535113 ) ) ( not ( = ?auto_535109 ?auto_535114 ) ) ( not ( = ?auto_535109 ?auto_535115 ) ) ( not ( = ?auto_535110 ?auto_535111 ) ) ( not ( = ?auto_535110 ?auto_535112 ) ) ( not ( = ?auto_535110 ?auto_535113 ) ) ( not ( = ?auto_535110 ?auto_535114 ) ) ( not ( = ?auto_535110 ?auto_535115 ) ) ( not ( = ?auto_535111 ?auto_535112 ) ) ( not ( = ?auto_535111 ?auto_535113 ) ) ( not ( = ?auto_535111 ?auto_535114 ) ) ( not ( = ?auto_535111 ?auto_535115 ) ) ( not ( = ?auto_535112 ?auto_535113 ) ) ( not ( = ?auto_535112 ?auto_535114 ) ) ( not ( = ?auto_535112 ?auto_535115 ) ) ( not ( = ?auto_535113 ?auto_535114 ) ) ( not ( = ?auto_535113 ?auto_535115 ) ) ( not ( = ?auto_535114 ?auto_535115 ) ) ( ON ?auto_535113 ?auto_535114 ) ( ON ?auto_535112 ?auto_535113 ) ( ON ?auto_535111 ?auto_535112 ) ( ON ?auto_535110 ?auto_535111 ) ( ON ?auto_535109 ?auto_535110 ) ( ON ?auto_535108 ?auto_535109 ) ( CLEAR ?auto_535106 ) ( ON ?auto_535107 ?auto_535108 ) ( CLEAR ?auto_535107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_535106 ?auto_535107 )
      ( MAKE-9PILE ?auto_535106 ?auto_535107 ?auto_535108 ?auto_535109 ?auto_535110 ?auto_535111 ?auto_535112 ?auto_535113 ?auto_535114 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_535144 - BLOCK
      ?auto_535145 - BLOCK
      ?auto_535146 - BLOCK
      ?auto_535147 - BLOCK
      ?auto_535148 - BLOCK
      ?auto_535149 - BLOCK
      ?auto_535150 - BLOCK
      ?auto_535151 - BLOCK
      ?auto_535152 - BLOCK
    )
    :vars
    (
      ?auto_535153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535152 ?auto_535153 ) ( not ( = ?auto_535144 ?auto_535145 ) ) ( not ( = ?auto_535144 ?auto_535146 ) ) ( not ( = ?auto_535144 ?auto_535147 ) ) ( not ( = ?auto_535144 ?auto_535148 ) ) ( not ( = ?auto_535144 ?auto_535149 ) ) ( not ( = ?auto_535144 ?auto_535150 ) ) ( not ( = ?auto_535144 ?auto_535151 ) ) ( not ( = ?auto_535144 ?auto_535152 ) ) ( not ( = ?auto_535144 ?auto_535153 ) ) ( not ( = ?auto_535145 ?auto_535146 ) ) ( not ( = ?auto_535145 ?auto_535147 ) ) ( not ( = ?auto_535145 ?auto_535148 ) ) ( not ( = ?auto_535145 ?auto_535149 ) ) ( not ( = ?auto_535145 ?auto_535150 ) ) ( not ( = ?auto_535145 ?auto_535151 ) ) ( not ( = ?auto_535145 ?auto_535152 ) ) ( not ( = ?auto_535145 ?auto_535153 ) ) ( not ( = ?auto_535146 ?auto_535147 ) ) ( not ( = ?auto_535146 ?auto_535148 ) ) ( not ( = ?auto_535146 ?auto_535149 ) ) ( not ( = ?auto_535146 ?auto_535150 ) ) ( not ( = ?auto_535146 ?auto_535151 ) ) ( not ( = ?auto_535146 ?auto_535152 ) ) ( not ( = ?auto_535146 ?auto_535153 ) ) ( not ( = ?auto_535147 ?auto_535148 ) ) ( not ( = ?auto_535147 ?auto_535149 ) ) ( not ( = ?auto_535147 ?auto_535150 ) ) ( not ( = ?auto_535147 ?auto_535151 ) ) ( not ( = ?auto_535147 ?auto_535152 ) ) ( not ( = ?auto_535147 ?auto_535153 ) ) ( not ( = ?auto_535148 ?auto_535149 ) ) ( not ( = ?auto_535148 ?auto_535150 ) ) ( not ( = ?auto_535148 ?auto_535151 ) ) ( not ( = ?auto_535148 ?auto_535152 ) ) ( not ( = ?auto_535148 ?auto_535153 ) ) ( not ( = ?auto_535149 ?auto_535150 ) ) ( not ( = ?auto_535149 ?auto_535151 ) ) ( not ( = ?auto_535149 ?auto_535152 ) ) ( not ( = ?auto_535149 ?auto_535153 ) ) ( not ( = ?auto_535150 ?auto_535151 ) ) ( not ( = ?auto_535150 ?auto_535152 ) ) ( not ( = ?auto_535150 ?auto_535153 ) ) ( not ( = ?auto_535151 ?auto_535152 ) ) ( not ( = ?auto_535151 ?auto_535153 ) ) ( not ( = ?auto_535152 ?auto_535153 ) ) ( ON ?auto_535151 ?auto_535152 ) ( ON ?auto_535150 ?auto_535151 ) ( ON ?auto_535149 ?auto_535150 ) ( ON ?auto_535148 ?auto_535149 ) ( ON ?auto_535147 ?auto_535148 ) ( ON ?auto_535146 ?auto_535147 ) ( ON ?auto_535145 ?auto_535146 ) ( ON ?auto_535144 ?auto_535145 ) ( CLEAR ?auto_535144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_535144 )
      ( MAKE-9PILE ?auto_535144 ?auto_535145 ?auto_535146 ?auto_535147 ?auto_535148 ?auto_535149 ?auto_535150 ?auto_535151 ?auto_535152 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535183 - BLOCK
      ?auto_535184 - BLOCK
      ?auto_535185 - BLOCK
      ?auto_535186 - BLOCK
      ?auto_535187 - BLOCK
      ?auto_535188 - BLOCK
      ?auto_535189 - BLOCK
      ?auto_535190 - BLOCK
      ?auto_535191 - BLOCK
      ?auto_535192 - BLOCK
    )
    :vars
    (
      ?auto_535193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_535191 ) ( ON ?auto_535192 ?auto_535193 ) ( CLEAR ?auto_535192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_535183 ) ( ON ?auto_535184 ?auto_535183 ) ( ON ?auto_535185 ?auto_535184 ) ( ON ?auto_535186 ?auto_535185 ) ( ON ?auto_535187 ?auto_535186 ) ( ON ?auto_535188 ?auto_535187 ) ( ON ?auto_535189 ?auto_535188 ) ( ON ?auto_535190 ?auto_535189 ) ( ON ?auto_535191 ?auto_535190 ) ( not ( = ?auto_535183 ?auto_535184 ) ) ( not ( = ?auto_535183 ?auto_535185 ) ) ( not ( = ?auto_535183 ?auto_535186 ) ) ( not ( = ?auto_535183 ?auto_535187 ) ) ( not ( = ?auto_535183 ?auto_535188 ) ) ( not ( = ?auto_535183 ?auto_535189 ) ) ( not ( = ?auto_535183 ?auto_535190 ) ) ( not ( = ?auto_535183 ?auto_535191 ) ) ( not ( = ?auto_535183 ?auto_535192 ) ) ( not ( = ?auto_535183 ?auto_535193 ) ) ( not ( = ?auto_535184 ?auto_535185 ) ) ( not ( = ?auto_535184 ?auto_535186 ) ) ( not ( = ?auto_535184 ?auto_535187 ) ) ( not ( = ?auto_535184 ?auto_535188 ) ) ( not ( = ?auto_535184 ?auto_535189 ) ) ( not ( = ?auto_535184 ?auto_535190 ) ) ( not ( = ?auto_535184 ?auto_535191 ) ) ( not ( = ?auto_535184 ?auto_535192 ) ) ( not ( = ?auto_535184 ?auto_535193 ) ) ( not ( = ?auto_535185 ?auto_535186 ) ) ( not ( = ?auto_535185 ?auto_535187 ) ) ( not ( = ?auto_535185 ?auto_535188 ) ) ( not ( = ?auto_535185 ?auto_535189 ) ) ( not ( = ?auto_535185 ?auto_535190 ) ) ( not ( = ?auto_535185 ?auto_535191 ) ) ( not ( = ?auto_535185 ?auto_535192 ) ) ( not ( = ?auto_535185 ?auto_535193 ) ) ( not ( = ?auto_535186 ?auto_535187 ) ) ( not ( = ?auto_535186 ?auto_535188 ) ) ( not ( = ?auto_535186 ?auto_535189 ) ) ( not ( = ?auto_535186 ?auto_535190 ) ) ( not ( = ?auto_535186 ?auto_535191 ) ) ( not ( = ?auto_535186 ?auto_535192 ) ) ( not ( = ?auto_535186 ?auto_535193 ) ) ( not ( = ?auto_535187 ?auto_535188 ) ) ( not ( = ?auto_535187 ?auto_535189 ) ) ( not ( = ?auto_535187 ?auto_535190 ) ) ( not ( = ?auto_535187 ?auto_535191 ) ) ( not ( = ?auto_535187 ?auto_535192 ) ) ( not ( = ?auto_535187 ?auto_535193 ) ) ( not ( = ?auto_535188 ?auto_535189 ) ) ( not ( = ?auto_535188 ?auto_535190 ) ) ( not ( = ?auto_535188 ?auto_535191 ) ) ( not ( = ?auto_535188 ?auto_535192 ) ) ( not ( = ?auto_535188 ?auto_535193 ) ) ( not ( = ?auto_535189 ?auto_535190 ) ) ( not ( = ?auto_535189 ?auto_535191 ) ) ( not ( = ?auto_535189 ?auto_535192 ) ) ( not ( = ?auto_535189 ?auto_535193 ) ) ( not ( = ?auto_535190 ?auto_535191 ) ) ( not ( = ?auto_535190 ?auto_535192 ) ) ( not ( = ?auto_535190 ?auto_535193 ) ) ( not ( = ?auto_535191 ?auto_535192 ) ) ( not ( = ?auto_535191 ?auto_535193 ) ) ( not ( = ?auto_535192 ?auto_535193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_535192 ?auto_535193 )
      ( !STACK ?auto_535192 ?auto_535191 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535225 - BLOCK
      ?auto_535226 - BLOCK
      ?auto_535227 - BLOCK
      ?auto_535228 - BLOCK
      ?auto_535229 - BLOCK
      ?auto_535230 - BLOCK
      ?auto_535231 - BLOCK
      ?auto_535232 - BLOCK
      ?auto_535233 - BLOCK
      ?auto_535234 - BLOCK
    )
    :vars
    (
      ?auto_535235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535234 ?auto_535235 ) ( ON-TABLE ?auto_535225 ) ( ON ?auto_535226 ?auto_535225 ) ( ON ?auto_535227 ?auto_535226 ) ( ON ?auto_535228 ?auto_535227 ) ( ON ?auto_535229 ?auto_535228 ) ( ON ?auto_535230 ?auto_535229 ) ( ON ?auto_535231 ?auto_535230 ) ( ON ?auto_535232 ?auto_535231 ) ( not ( = ?auto_535225 ?auto_535226 ) ) ( not ( = ?auto_535225 ?auto_535227 ) ) ( not ( = ?auto_535225 ?auto_535228 ) ) ( not ( = ?auto_535225 ?auto_535229 ) ) ( not ( = ?auto_535225 ?auto_535230 ) ) ( not ( = ?auto_535225 ?auto_535231 ) ) ( not ( = ?auto_535225 ?auto_535232 ) ) ( not ( = ?auto_535225 ?auto_535233 ) ) ( not ( = ?auto_535225 ?auto_535234 ) ) ( not ( = ?auto_535225 ?auto_535235 ) ) ( not ( = ?auto_535226 ?auto_535227 ) ) ( not ( = ?auto_535226 ?auto_535228 ) ) ( not ( = ?auto_535226 ?auto_535229 ) ) ( not ( = ?auto_535226 ?auto_535230 ) ) ( not ( = ?auto_535226 ?auto_535231 ) ) ( not ( = ?auto_535226 ?auto_535232 ) ) ( not ( = ?auto_535226 ?auto_535233 ) ) ( not ( = ?auto_535226 ?auto_535234 ) ) ( not ( = ?auto_535226 ?auto_535235 ) ) ( not ( = ?auto_535227 ?auto_535228 ) ) ( not ( = ?auto_535227 ?auto_535229 ) ) ( not ( = ?auto_535227 ?auto_535230 ) ) ( not ( = ?auto_535227 ?auto_535231 ) ) ( not ( = ?auto_535227 ?auto_535232 ) ) ( not ( = ?auto_535227 ?auto_535233 ) ) ( not ( = ?auto_535227 ?auto_535234 ) ) ( not ( = ?auto_535227 ?auto_535235 ) ) ( not ( = ?auto_535228 ?auto_535229 ) ) ( not ( = ?auto_535228 ?auto_535230 ) ) ( not ( = ?auto_535228 ?auto_535231 ) ) ( not ( = ?auto_535228 ?auto_535232 ) ) ( not ( = ?auto_535228 ?auto_535233 ) ) ( not ( = ?auto_535228 ?auto_535234 ) ) ( not ( = ?auto_535228 ?auto_535235 ) ) ( not ( = ?auto_535229 ?auto_535230 ) ) ( not ( = ?auto_535229 ?auto_535231 ) ) ( not ( = ?auto_535229 ?auto_535232 ) ) ( not ( = ?auto_535229 ?auto_535233 ) ) ( not ( = ?auto_535229 ?auto_535234 ) ) ( not ( = ?auto_535229 ?auto_535235 ) ) ( not ( = ?auto_535230 ?auto_535231 ) ) ( not ( = ?auto_535230 ?auto_535232 ) ) ( not ( = ?auto_535230 ?auto_535233 ) ) ( not ( = ?auto_535230 ?auto_535234 ) ) ( not ( = ?auto_535230 ?auto_535235 ) ) ( not ( = ?auto_535231 ?auto_535232 ) ) ( not ( = ?auto_535231 ?auto_535233 ) ) ( not ( = ?auto_535231 ?auto_535234 ) ) ( not ( = ?auto_535231 ?auto_535235 ) ) ( not ( = ?auto_535232 ?auto_535233 ) ) ( not ( = ?auto_535232 ?auto_535234 ) ) ( not ( = ?auto_535232 ?auto_535235 ) ) ( not ( = ?auto_535233 ?auto_535234 ) ) ( not ( = ?auto_535233 ?auto_535235 ) ) ( not ( = ?auto_535234 ?auto_535235 ) ) ( CLEAR ?auto_535232 ) ( ON ?auto_535233 ?auto_535234 ) ( CLEAR ?auto_535233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_535225 ?auto_535226 ?auto_535227 ?auto_535228 ?auto_535229 ?auto_535230 ?auto_535231 ?auto_535232 ?auto_535233 )
      ( MAKE-10PILE ?auto_535225 ?auto_535226 ?auto_535227 ?auto_535228 ?auto_535229 ?auto_535230 ?auto_535231 ?auto_535232 ?auto_535233 ?auto_535234 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535267 - BLOCK
      ?auto_535268 - BLOCK
      ?auto_535269 - BLOCK
      ?auto_535270 - BLOCK
      ?auto_535271 - BLOCK
      ?auto_535272 - BLOCK
      ?auto_535273 - BLOCK
      ?auto_535274 - BLOCK
      ?auto_535275 - BLOCK
      ?auto_535276 - BLOCK
    )
    :vars
    (
      ?auto_535277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535276 ?auto_535277 ) ( ON-TABLE ?auto_535267 ) ( ON ?auto_535268 ?auto_535267 ) ( ON ?auto_535269 ?auto_535268 ) ( ON ?auto_535270 ?auto_535269 ) ( ON ?auto_535271 ?auto_535270 ) ( ON ?auto_535272 ?auto_535271 ) ( ON ?auto_535273 ?auto_535272 ) ( not ( = ?auto_535267 ?auto_535268 ) ) ( not ( = ?auto_535267 ?auto_535269 ) ) ( not ( = ?auto_535267 ?auto_535270 ) ) ( not ( = ?auto_535267 ?auto_535271 ) ) ( not ( = ?auto_535267 ?auto_535272 ) ) ( not ( = ?auto_535267 ?auto_535273 ) ) ( not ( = ?auto_535267 ?auto_535274 ) ) ( not ( = ?auto_535267 ?auto_535275 ) ) ( not ( = ?auto_535267 ?auto_535276 ) ) ( not ( = ?auto_535267 ?auto_535277 ) ) ( not ( = ?auto_535268 ?auto_535269 ) ) ( not ( = ?auto_535268 ?auto_535270 ) ) ( not ( = ?auto_535268 ?auto_535271 ) ) ( not ( = ?auto_535268 ?auto_535272 ) ) ( not ( = ?auto_535268 ?auto_535273 ) ) ( not ( = ?auto_535268 ?auto_535274 ) ) ( not ( = ?auto_535268 ?auto_535275 ) ) ( not ( = ?auto_535268 ?auto_535276 ) ) ( not ( = ?auto_535268 ?auto_535277 ) ) ( not ( = ?auto_535269 ?auto_535270 ) ) ( not ( = ?auto_535269 ?auto_535271 ) ) ( not ( = ?auto_535269 ?auto_535272 ) ) ( not ( = ?auto_535269 ?auto_535273 ) ) ( not ( = ?auto_535269 ?auto_535274 ) ) ( not ( = ?auto_535269 ?auto_535275 ) ) ( not ( = ?auto_535269 ?auto_535276 ) ) ( not ( = ?auto_535269 ?auto_535277 ) ) ( not ( = ?auto_535270 ?auto_535271 ) ) ( not ( = ?auto_535270 ?auto_535272 ) ) ( not ( = ?auto_535270 ?auto_535273 ) ) ( not ( = ?auto_535270 ?auto_535274 ) ) ( not ( = ?auto_535270 ?auto_535275 ) ) ( not ( = ?auto_535270 ?auto_535276 ) ) ( not ( = ?auto_535270 ?auto_535277 ) ) ( not ( = ?auto_535271 ?auto_535272 ) ) ( not ( = ?auto_535271 ?auto_535273 ) ) ( not ( = ?auto_535271 ?auto_535274 ) ) ( not ( = ?auto_535271 ?auto_535275 ) ) ( not ( = ?auto_535271 ?auto_535276 ) ) ( not ( = ?auto_535271 ?auto_535277 ) ) ( not ( = ?auto_535272 ?auto_535273 ) ) ( not ( = ?auto_535272 ?auto_535274 ) ) ( not ( = ?auto_535272 ?auto_535275 ) ) ( not ( = ?auto_535272 ?auto_535276 ) ) ( not ( = ?auto_535272 ?auto_535277 ) ) ( not ( = ?auto_535273 ?auto_535274 ) ) ( not ( = ?auto_535273 ?auto_535275 ) ) ( not ( = ?auto_535273 ?auto_535276 ) ) ( not ( = ?auto_535273 ?auto_535277 ) ) ( not ( = ?auto_535274 ?auto_535275 ) ) ( not ( = ?auto_535274 ?auto_535276 ) ) ( not ( = ?auto_535274 ?auto_535277 ) ) ( not ( = ?auto_535275 ?auto_535276 ) ) ( not ( = ?auto_535275 ?auto_535277 ) ) ( not ( = ?auto_535276 ?auto_535277 ) ) ( ON ?auto_535275 ?auto_535276 ) ( CLEAR ?auto_535273 ) ( ON ?auto_535274 ?auto_535275 ) ( CLEAR ?auto_535274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_535267 ?auto_535268 ?auto_535269 ?auto_535270 ?auto_535271 ?auto_535272 ?auto_535273 ?auto_535274 )
      ( MAKE-10PILE ?auto_535267 ?auto_535268 ?auto_535269 ?auto_535270 ?auto_535271 ?auto_535272 ?auto_535273 ?auto_535274 ?auto_535275 ?auto_535276 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535309 - BLOCK
      ?auto_535310 - BLOCK
      ?auto_535311 - BLOCK
      ?auto_535312 - BLOCK
      ?auto_535313 - BLOCK
      ?auto_535314 - BLOCK
      ?auto_535315 - BLOCK
      ?auto_535316 - BLOCK
      ?auto_535317 - BLOCK
      ?auto_535318 - BLOCK
    )
    :vars
    (
      ?auto_535319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535318 ?auto_535319 ) ( ON-TABLE ?auto_535309 ) ( ON ?auto_535310 ?auto_535309 ) ( ON ?auto_535311 ?auto_535310 ) ( ON ?auto_535312 ?auto_535311 ) ( ON ?auto_535313 ?auto_535312 ) ( ON ?auto_535314 ?auto_535313 ) ( not ( = ?auto_535309 ?auto_535310 ) ) ( not ( = ?auto_535309 ?auto_535311 ) ) ( not ( = ?auto_535309 ?auto_535312 ) ) ( not ( = ?auto_535309 ?auto_535313 ) ) ( not ( = ?auto_535309 ?auto_535314 ) ) ( not ( = ?auto_535309 ?auto_535315 ) ) ( not ( = ?auto_535309 ?auto_535316 ) ) ( not ( = ?auto_535309 ?auto_535317 ) ) ( not ( = ?auto_535309 ?auto_535318 ) ) ( not ( = ?auto_535309 ?auto_535319 ) ) ( not ( = ?auto_535310 ?auto_535311 ) ) ( not ( = ?auto_535310 ?auto_535312 ) ) ( not ( = ?auto_535310 ?auto_535313 ) ) ( not ( = ?auto_535310 ?auto_535314 ) ) ( not ( = ?auto_535310 ?auto_535315 ) ) ( not ( = ?auto_535310 ?auto_535316 ) ) ( not ( = ?auto_535310 ?auto_535317 ) ) ( not ( = ?auto_535310 ?auto_535318 ) ) ( not ( = ?auto_535310 ?auto_535319 ) ) ( not ( = ?auto_535311 ?auto_535312 ) ) ( not ( = ?auto_535311 ?auto_535313 ) ) ( not ( = ?auto_535311 ?auto_535314 ) ) ( not ( = ?auto_535311 ?auto_535315 ) ) ( not ( = ?auto_535311 ?auto_535316 ) ) ( not ( = ?auto_535311 ?auto_535317 ) ) ( not ( = ?auto_535311 ?auto_535318 ) ) ( not ( = ?auto_535311 ?auto_535319 ) ) ( not ( = ?auto_535312 ?auto_535313 ) ) ( not ( = ?auto_535312 ?auto_535314 ) ) ( not ( = ?auto_535312 ?auto_535315 ) ) ( not ( = ?auto_535312 ?auto_535316 ) ) ( not ( = ?auto_535312 ?auto_535317 ) ) ( not ( = ?auto_535312 ?auto_535318 ) ) ( not ( = ?auto_535312 ?auto_535319 ) ) ( not ( = ?auto_535313 ?auto_535314 ) ) ( not ( = ?auto_535313 ?auto_535315 ) ) ( not ( = ?auto_535313 ?auto_535316 ) ) ( not ( = ?auto_535313 ?auto_535317 ) ) ( not ( = ?auto_535313 ?auto_535318 ) ) ( not ( = ?auto_535313 ?auto_535319 ) ) ( not ( = ?auto_535314 ?auto_535315 ) ) ( not ( = ?auto_535314 ?auto_535316 ) ) ( not ( = ?auto_535314 ?auto_535317 ) ) ( not ( = ?auto_535314 ?auto_535318 ) ) ( not ( = ?auto_535314 ?auto_535319 ) ) ( not ( = ?auto_535315 ?auto_535316 ) ) ( not ( = ?auto_535315 ?auto_535317 ) ) ( not ( = ?auto_535315 ?auto_535318 ) ) ( not ( = ?auto_535315 ?auto_535319 ) ) ( not ( = ?auto_535316 ?auto_535317 ) ) ( not ( = ?auto_535316 ?auto_535318 ) ) ( not ( = ?auto_535316 ?auto_535319 ) ) ( not ( = ?auto_535317 ?auto_535318 ) ) ( not ( = ?auto_535317 ?auto_535319 ) ) ( not ( = ?auto_535318 ?auto_535319 ) ) ( ON ?auto_535317 ?auto_535318 ) ( ON ?auto_535316 ?auto_535317 ) ( CLEAR ?auto_535314 ) ( ON ?auto_535315 ?auto_535316 ) ( CLEAR ?auto_535315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_535309 ?auto_535310 ?auto_535311 ?auto_535312 ?auto_535313 ?auto_535314 ?auto_535315 )
      ( MAKE-10PILE ?auto_535309 ?auto_535310 ?auto_535311 ?auto_535312 ?auto_535313 ?auto_535314 ?auto_535315 ?auto_535316 ?auto_535317 ?auto_535318 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535351 - BLOCK
      ?auto_535352 - BLOCK
      ?auto_535353 - BLOCK
      ?auto_535354 - BLOCK
      ?auto_535355 - BLOCK
      ?auto_535356 - BLOCK
      ?auto_535357 - BLOCK
      ?auto_535358 - BLOCK
      ?auto_535359 - BLOCK
      ?auto_535360 - BLOCK
    )
    :vars
    (
      ?auto_535361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535360 ?auto_535361 ) ( ON-TABLE ?auto_535351 ) ( ON ?auto_535352 ?auto_535351 ) ( ON ?auto_535353 ?auto_535352 ) ( ON ?auto_535354 ?auto_535353 ) ( ON ?auto_535355 ?auto_535354 ) ( not ( = ?auto_535351 ?auto_535352 ) ) ( not ( = ?auto_535351 ?auto_535353 ) ) ( not ( = ?auto_535351 ?auto_535354 ) ) ( not ( = ?auto_535351 ?auto_535355 ) ) ( not ( = ?auto_535351 ?auto_535356 ) ) ( not ( = ?auto_535351 ?auto_535357 ) ) ( not ( = ?auto_535351 ?auto_535358 ) ) ( not ( = ?auto_535351 ?auto_535359 ) ) ( not ( = ?auto_535351 ?auto_535360 ) ) ( not ( = ?auto_535351 ?auto_535361 ) ) ( not ( = ?auto_535352 ?auto_535353 ) ) ( not ( = ?auto_535352 ?auto_535354 ) ) ( not ( = ?auto_535352 ?auto_535355 ) ) ( not ( = ?auto_535352 ?auto_535356 ) ) ( not ( = ?auto_535352 ?auto_535357 ) ) ( not ( = ?auto_535352 ?auto_535358 ) ) ( not ( = ?auto_535352 ?auto_535359 ) ) ( not ( = ?auto_535352 ?auto_535360 ) ) ( not ( = ?auto_535352 ?auto_535361 ) ) ( not ( = ?auto_535353 ?auto_535354 ) ) ( not ( = ?auto_535353 ?auto_535355 ) ) ( not ( = ?auto_535353 ?auto_535356 ) ) ( not ( = ?auto_535353 ?auto_535357 ) ) ( not ( = ?auto_535353 ?auto_535358 ) ) ( not ( = ?auto_535353 ?auto_535359 ) ) ( not ( = ?auto_535353 ?auto_535360 ) ) ( not ( = ?auto_535353 ?auto_535361 ) ) ( not ( = ?auto_535354 ?auto_535355 ) ) ( not ( = ?auto_535354 ?auto_535356 ) ) ( not ( = ?auto_535354 ?auto_535357 ) ) ( not ( = ?auto_535354 ?auto_535358 ) ) ( not ( = ?auto_535354 ?auto_535359 ) ) ( not ( = ?auto_535354 ?auto_535360 ) ) ( not ( = ?auto_535354 ?auto_535361 ) ) ( not ( = ?auto_535355 ?auto_535356 ) ) ( not ( = ?auto_535355 ?auto_535357 ) ) ( not ( = ?auto_535355 ?auto_535358 ) ) ( not ( = ?auto_535355 ?auto_535359 ) ) ( not ( = ?auto_535355 ?auto_535360 ) ) ( not ( = ?auto_535355 ?auto_535361 ) ) ( not ( = ?auto_535356 ?auto_535357 ) ) ( not ( = ?auto_535356 ?auto_535358 ) ) ( not ( = ?auto_535356 ?auto_535359 ) ) ( not ( = ?auto_535356 ?auto_535360 ) ) ( not ( = ?auto_535356 ?auto_535361 ) ) ( not ( = ?auto_535357 ?auto_535358 ) ) ( not ( = ?auto_535357 ?auto_535359 ) ) ( not ( = ?auto_535357 ?auto_535360 ) ) ( not ( = ?auto_535357 ?auto_535361 ) ) ( not ( = ?auto_535358 ?auto_535359 ) ) ( not ( = ?auto_535358 ?auto_535360 ) ) ( not ( = ?auto_535358 ?auto_535361 ) ) ( not ( = ?auto_535359 ?auto_535360 ) ) ( not ( = ?auto_535359 ?auto_535361 ) ) ( not ( = ?auto_535360 ?auto_535361 ) ) ( ON ?auto_535359 ?auto_535360 ) ( ON ?auto_535358 ?auto_535359 ) ( ON ?auto_535357 ?auto_535358 ) ( CLEAR ?auto_535355 ) ( ON ?auto_535356 ?auto_535357 ) ( CLEAR ?auto_535356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_535351 ?auto_535352 ?auto_535353 ?auto_535354 ?auto_535355 ?auto_535356 )
      ( MAKE-10PILE ?auto_535351 ?auto_535352 ?auto_535353 ?auto_535354 ?auto_535355 ?auto_535356 ?auto_535357 ?auto_535358 ?auto_535359 ?auto_535360 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535393 - BLOCK
      ?auto_535394 - BLOCK
      ?auto_535395 - BLOCK
      ?auto_535396 - BLOCK
      ?auto_535397 - BLOCK
      ?auto_535398 - BLOCK
      ?auto_535399 - BLOCK
      ?auto_535400 - BLOCK
      ?auto_535401 - BLOCK
      ?auto_535402 - BLOCK
    )
    :vars
    (
      ?auto_535403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535402 ?auto_535403 ) ( ON-TABLE ?auto_535393 ) ( ON ?auto_535394 ?auto_535393 ) ( ON ?auto_535395 ?auto_535394 ) ( ON ?auto_535396 ?auto_535395 ) ( not ( = ?auto_535393 ?auto_535394 ) ) ( not ( = ?auto_535393 ?auto_535395 ) ) ( not ( = ?auto_535393 ?auto_535396 ) ) ( not ( = ?auto_535393 ?auto_535397 ) ) ( not ( = ?auto_535393 ?auto_535398 ) ) ( not ( = ?auto_535393 ?auto_535399 ) ) ( not ( = ?auto_535393 ?auto_535400 ) ) ( not ( = ?auto_535393 ?auto_535401 ) ) ( not ( = ?auto_535393 ?auto_535402 ) ) ( not ( = ?auto_535393 ?auto_535403 ) ) ( not ( = ?auto_535394 ?auto_535395 ) ) ( not ( = ?auto_535394 ?auto_535396 ) ) ( not ( = ?auto_535394 ?auto_535397 ) ) ( not ( = ?auto_535394 ?auto_535398 ) ) ( not ( = ?auto_535394 ?auto_535399 ) ) ( not ( = ?auto_535394 ?auto_535400 ) ) ( not ( = ?auto_535394 ?auto_535401 ) ) ( not ( = ?auto_535394 ?auto_535402 ) ) ( not ( = ?auto_535394 ?auto_535403 ) ) ( not ( = ?auto_535395 ?auto_535396 ) ) ( not ( = ?auto_535395 ?auto_535397 ) ) ( not ( = ?auto_535395 ?auto_535398 ) ) ( not ( = ?auto_535395 ?auto_535399 ) ) ( not ( = ?auto_535395 ?auto_535400 ) ) ( not ( = ?auto_535395 ?auto_535401 ) ) ( not ( = ?auto_535395 ?auto_535402 ) ) ( not ( = ?auto_535395 ?auto_535403 ) ) ( not ( = ?auto_535396 ?auto_535397 ) ) ( not ( = ?auto_535396 ?auto_535398 ) ) ( not ( = ?auto_535396 ?auto_535399 ) ) ( not ( = ?auto_535396 ?auto_535400 ) ) ( not ( = ?auto_535396 ?auto_535401 ) ) ( not ( = ?auto_535396 ?auto_535402 ) ) ( not ( = ?auto_535396 ?auto_535403 ) ) ( not ( = ?auto_535397 ?auto_535398 ) ) ( not ( = ?auto_535397 ?auto_535399 ) ) ( not ( = ?auto_535397 ?auto_535400 ) ) ( not ( = ?auto_535397 ?auto_535401 ) ) ( not ( = ?auto_535397 ?auto_535402 ) ) ( not ( = ?auto_535397 ?auto_535403 ) ) ( not ( = ?auto_535398 ?auto_535399 ) ) ( not ( = ?auto_535398 ?auto_535400 ) ) ( not ( = ?auto_535398 ?auto_535401 ) ) ( not ( = ?auto_535398 ?auto_535402 ) ) ( not ( = ?auto_535398 ?auto_535403 ) ) ( not ( = ?auto_535399 ?auto_535400 ) ) ( not ( = ?auto_535399 ?auto_535401 ) ) ( not ( = ?auto_535399 ?auto_535402 ) ) ( not ( = ?auto_535399 ?auto_535403 ) ) ( not ( = ?auto_535400 ?auto_535401 ) ) ( not ( = ?auto_535400 ?auto_535402 ) ) ( not ( = ?auto_535400 ?auto_535403 ) ) ( not ( = ?auto_535401 ?auto_535402 ) ) ( not ( = ?auto_535401 ?auto_535403 ) ) ( not ( = ?auto_535402 ?auto_535403 ) ) ( ON ?auto_535401 ?auto_535402 ) ( ON ?auto_535400 ?auto_535401 ) ( ON ?auto_535399 ?auto_535400 ) ( ON ?auto_535398 ?auto_535399 ) ( CLEAR ?auto_535396 ) ( ON ?auto_535397 ?auto_535398 ) ( CLEAR ?auto_535397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_535393 ?auto_535394 ?auto_535395 ?auto_535396 ?auto_535397 )
      ( MAKE-10PILE ?auto_535393 ?auto_535394 ?auto_535395 ?auto_535396 ?auto_535397 ?auto_535398 ?auto_535399 ?auto_535400 ?auto_535401 ?auto_535402 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535435 - BLOCK
      ?auto_535436 - BLOCK
      ?auto_535437 - BLOCK
      ?auto_535438 - BLOCK
      ?auto_535439 - BLOCK
      ?auto_535440 - BLOCK
      ?auto_535441 - BLOCK
      ?auto_535442 - BLOCK
      ?auto_535443 - BLOCK
      ?auto_535444 - BLOCK
    )
    :vars
    (
      ?auto_535445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535444 ?auto_535445 ) ( ON-TABLE ?auto_535435 ) ( ON ?auto_535436 ?auto_535435 ) ( ON ?auto_535437 ?auto_535436 ) ( not ( = ?auto_535435 ?auto_535436 ) ) ( not ( = ?auto_535435 ?auto_535437 ) ) ( not ( = ?auto_535435 ?auto_535438 ) ) ( not ( = ?auto_535435 ?auto_535439 ) ) ( not ( = ?auto_535435 ?auto_535440 ) ) ( not ( = ?auto_535435 ?auto_535441 ) ) ( not ( = ?auto_535435 ?auto_535442 ) ) ( not ( = ?auto_535435 ?auto_535443 ) ) ( not ( = ?auto_535435 ?auto_535444 ) ) ( not ( = ?auto_535435 ?auto_535445 ) ) ( not ( = ?auto_535436 ?auto_535437 ) ) ( not ( = ?auto_535436 ?auto_535438 ) ) ( not ( = ?auto_535436 ?auto_535439 ) ) ( not ( = ?auto_535436 ?auto_535440 ) ) ( not ( = ?auto_535436 ?auto_535441 ) ) ( not ( = ?auto_535436 ?auto_535442 ) ) ( not ( = ?auto_535436 ?auto_535443 ) ) ( not ( = ?auto_535436 ?auto_535444 ) ) ( not ( = ?auto_535436 ?auto_535445 ) ) ( not ( = ?auto_535437 ?auto_535438 ) ) ( not ( = ?auto_535437 ?auto_535439 ) ) ( not ( = ?auto_535437 ?auto_535440 ) ) ( not ( = ?auto_535437 ?auto_535441 ) ) ( not ( = ?auto_535437 ?auto_535442 ) ) ( not ( = ?auto_535437 ?auto_535443 ) ) ( not ( = ?auto_535437 ?auto_535444 ) ) ( not ( = ?auto_535437 ?auto_535445 ) ) ( not ( = ?auto_535438 ?auto_535439 ) ) ( not ( = ?auto_535438 ?auto_535440 ) ) ( not ( = ?auto_535438 ?auto_535441 ) ) ( not ( = ?auto_535438 ?auto_535442 ) ) ( not ( = ?auto_535438 ?auto_535443 ) ) ( not ( = ?auto_535438 ?auto_535444 ) ) ( not ( = ?auto_535438 ?auto_535445 ) ) ( not ( = ?auto_535439 ?auto_535440 ) ) ( not ( = ?auto_535439 ?auto_535441 ) ) ( not ( = ?auto_535439 ?auto_535442 ) ) ( not ( = ?auto_535439 ?auto_535443 ) ) ( not ( = ?auto_535439 ?auto_535444 ) ) ( not ( = ?auto_535439 ?auto_535445 ) ) ( not ( = ?auto_535440 ?auto_535441 ) ) ( not ( = ?auto_535440 ?auto_535442 ) ) ( not ( = ?auto_535440 ?auto_535443 ) ) ( not ( = ?auto_535440 ?auto_535444 ) ) ( not ( = ?auto_535440 ?auto_535445 ) ) ( not ( = ?auto_535441 ?auto_535442 ) ) ( not ( = ?auto_535441 ?auto_535443 ) ) ( not ( = ?auto_535441 ?auto_535444 ) ) ( not ( = ?auto_535441 ?auto_535445 ) ) ( not ( = ?auto_535442 ?auto_535443 ) ) ( not ( = ?auto_535442 ?auto_535444 ) ) ( not ( = ?auto_535442 ?auto_535445 ) ) ( not ( = ?auto_535443 ?auto_535444 ) ) ( not ( = ?auto_535443 ?auto_535445 ) ) ( not ( = ?auto_535444 ?auto_535445 ) ) ( ON ?auto_535443 ?auto_535444 ) ( ON ?auto_535442 ?auto_535443 ) ( ON ?auto_535441 ?auto_535442 ) ( ON ?auto_535440 ?auto_535441 ) ( ON ?auto_535439 ?auto_535440 ) ( CLEAR ?auto_535437 ) ( ON ?auto_535438 ?auto_535439 ) ( CLEAR ?auto_535438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_535435 ?auto_535436 ?auto_535437 ?auto_535438 )
      ( MAKE-10PILE ?auto_535435 ?auto_535436 ?auto_535437 ?auto_535438 ?auto_535439 ?auto_535440 ?auto_535441 ?auto_535442 ?auto_535443 ?auto_535444 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535477 - BLOCK
      ?auto_535478 - BLOCK
      ?auto_535479 - BLOCK
      ?auto_535480 - BLOCK
      ?auto_535481 - BLOCK
      ?auto_535482 - BLOCK
      ?auto_535483 - BLOCK
      ?auto_535484 - BLOCK
      ?auto_535485 - BLOCK
      ?auto_535486 - BLOCK
    )
    :vars
    (
      ?auto_535487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535486 ?auto_535487 ) ( ON-TABLE ?auto_535477 ) ( ON ?auto_535478 ?auto_535477 ) ( not ( = ?auto_535477 ?auto_535478 ) ) ( not ( = ?auto_535477 ?auto_535479 ) ) ( not ( = ?auto_535477 ?auto_535480 ) ) ( not ( = ?auto_535477 ?auto_535481 ) ) ( not ( = ?auto_535477 ?auto_535482 ) ) ( not ( = ?auto_535477 ?auto_535483 ) ) ( not ( = ?auto_535477 ?auto_535484 ) ) ( not ( = ?auto_535477 ?auto_535485 ) ) ( not ( = ?auto_535477 ?auto_535486 ) ) ( not ( = ?auto_535477 ?auto_535487 ) ) ( not ( = ?auto_535478 ?auto_535479 ) ) ( not ( = ?auto_535478 ?auto_535480 ) ) ( not ( = ?auto_535478 ?auto_535481 ) ) ( not ( = ?auto_535478 ?auto_535482 ) ) ( not ( = ?auto_535478 ?auto_535483 ) ) ( not ( = ?auto_535478 ?auto_535484 ) ) ( not ( = ?auto_535478 ?auto_535485 ) ) ( not ( = ?auto_535478 ?auto_535486 ) ) ( not ( = ?auto_535478 ?auto_535487 ) ) ( not ( = ?auto_535479 ?auto_535480 ) ) ( not ( = ?auto_535479 ?auto_535481 ) ) ( not ( = ?auto_535479 ?auto_535482 ) ) ( not ( = ?auto_535479 ?auto_535483 ) ) ( not ( = ?auto_535479 ?auto_535484 ) ) ( not ( = ?auto_535479 ?auto_535485 ) ) ( not ( = ?auto_535479 ?auto_535486 ) ) ( not ( = ?auto_535479 ?auto_535487 ) ) ( not ( = ?auto_535480 ?auto_535481 ) ) ( not ( = ?auto_535480 ?auto_535482 ) ) ( not ( = ?auto_535480 ?auto_535483 ) ) ( not ( = ?auto_535480 ?auto_535484 ) ) ( not ( = ?auto_535480 ?auto_535485 ) ) ( not ( = ?auto_535480 ?auto_535486 ) ) ( not ( = ?auto_535480 ?auto_535487 ) ) ( not ( = ?auto_535481 ?auto_535482 ) ) ( not ( = ?auto_535481 ?auto_535483 ) ) ( not ( = ?auto_535481 ?auto_535484 ) ) ( not ( = ?auto_535481 ?auto_535485 ) ) ( not ( = ?auto_535481 ?auto_535486 ) ) ( not ( = ?auto_535481 ?auto_535487 ) ) ( not ( = ?auto_535482 ?auto_535483 ) ) ( not ( = ?auto_535482 ?auto_535484 ) ) ( not ( = ?auto_535482 ?auto_535485 ) ) ( not ( = ?auto_535482 ?auto_535486 ) ) ( not ( = ?auto_535482 ?auto_535487 ) ) ( not ( = ?auto_535483 ?auto_535484 ) ) ( not ( = ?auto_535483 ?auto_535485 ) ) ( not ( = ?auto_535483 ?auto_535486 ) ) ( not ( = ?auto_535483 ?auto_535487 ) ) ( not ( = ?auto_535484 ?auto_535485 ) ) ( not ( = ?auto_535484 ?auto_535486 ) ) ( not ( = ?auto_535484 ?auto_535487 ) ) ( not ( = ?auto_535485 ?auto_535486 ) ) ( not ( = ?auto_535485 ?auto_535487 ) ) ( not ( = ?auto_535486 ?auto_535487 ) ) ( ON ?auto_535485 ?auto_535486 ) ( ON ?auto_535484 ?auto_535485 ) ( ON ?auto_535483 ?auto_535484 ) ( ON ?auto_535482 ?auto_535483 ) ( ON ?auto_535481 ?auto_535482 ) ( ON ?auto_535480 ?auto_535481 ) ( CLEAR ?auto_535478 ) ( ON ?auto_535479 ?auto_535480 ) ( CLEAR ?auto_535479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_535477 ?auto_535478 ?auto_535479 )
      ( MAKE-10PILE ?auto_535477 ?auto_535478 ?auto_535479 ?auto_535480 ?auto_535481 ?auto_535482 ?auto_535483 ?auto_535484 ?auto_535485 ?auto_535486 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535519 - BLOCK
      ?auto_535520 - BLOCK
      ?auto_535521 - BLOCK
      ?auto_535522 - BLOCK
      ?auto_535523 - BLOCK
      ?auto_535524 - BLOCK
      ?auto_535525 - BLOCK
      ?auto_535526 - BLOCK
      ?auto_535527 - BLOCK
      ?auto_535528 - BLOCK
    )
    :vars
    (
      ?auto_535529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535528 ?auto_535529 ) ( ON-TABLE ?auto_535519 ) ( not ( = ?auto_535519 ?auto_535520 ) ) ( not ( = ?auto_535519 ?auto_535521 ) ) ( not ( = ?auto_535519 ?auto_535522 ) ) ( not ( = ?auto_535519 ?auto_535523 ) ) ( not ( = ?auto_535519 ?auto_535524 ) ) ( not ( = ?auto_535519 ?auto_535525 ) ) ( not ( = ?auto_535519 ?auto_535526 ) ) ( not ( = ?auto_535519 ?auto_535527 ) ) ( not ( = ?auto_535519 ?auto_535528 ) ) ( not ( = ?auto_535519 ?auto_535529 ) ) ( not ( = ?auto_535520 ?auto_535521 ) ) ( not ( = ?auto_535520 ?auto_535522 ) ) ( not ( = ?auto_535520 ?auto_535523 ) ) ( not ( = ?auto_535520 ?auto_535524 ) ) ( not ( = ?auto_535520 ?auto_535525 ) ) ( not ( = ?auto_535520 ?auto_535526 ) ) ( not ( = ?auto_535520 ?auto_535527 ) ) ( not ( = ?auto_535520 ?auto_535528 ) ) ( not ( = ?auto_535520 ?auto_535529 ) ) ( not ( = ?auto_535521 ?auto_535522 ) ) ( not ( = ?auto_535521 ?auto_535523 ) ) ( not ( = ?auto_535521 ?auto_535524 ) ) ( not ( = ?auto_535521 ?auto_535525 ) ) ( not ( = ?auto_535521 ?auto_535526 ) ) ( not ( = ?auto_535521 ?auto_535527 ) ) ( not ( = ?auto_535521 ?auto_535528 ) ) ( not ( = ?auto_535521 ?auto_535529 ) ) ( not ( = ?auto_535522 ?auto_535523 ) ) ( not ( = ?auto_535522 ?auto_535524 ) ) ( not ( = ?auto_535522 ?auto_535525 ) ) ( not ( = ?auto_535522 ?auto_535526 ) ) ( not ( = ?auto_535522 ?auto_535527 ) ) ( not ( = ?auto_535522 ?auto_535528 ) ) ( not ( = ?auto_535522 ?auto_535529 ) ) ( not ( = ?auto_535523 ?auto_535524 ) ) ( not ( = ?auto_535523 ?auto_535525 ) ) ( not ( = ?auto_535523 ?auto_535526 ) ) ( not ( = ?auto_535523 ?auto_535527 ) ) ( not ( = ?auto_535523 ?auto_535528 ) ) ( not ( = ?auto_535523 ?auto_535529 ) ) ( not ( = ?auto_535524 ?auto_535525 ) ) ( not ( = ?auto_535524 ?auto_535526 ) ) ( not ( = ?auto_535524 ?auto_535527 ) ) ( not ( = ?auto_535524 ?auto_535528 ) ) ( not ( = ?auto_535524 ?auto_535529 ) ) ( not ( = ?auto_535525 ?auto_535526 ) ) ( not ( = ?auto_535525 ?auto_535527 ) ) ( not ( = ?auto_535525 ?auto_535528 ) ) ( not ( = ?auto_535525 ?auto_535529 ) ) ( not ( = ?auto_535526 ?auto_535527 ) ) ( not ( = ?auto_535526 ?auto_535528 ) ) ( not ( = ?auto_535526 ?auto_535529 ) ) ( not ( = ?auto_535527 ?auto_535528 ) ) ( not ( = ?auto_535527 ?auto_535529 ) ) ( not ( = ?auto_535528 ?auto_535529 ) ) ( ON ?auto_535527 ?auto_535528 ) ( ON ?auto_535526 ?auto_535527 ) ( ON ?auto_535525 ?auto_535526 ) ( ON ?auto_535524 ?auto_535525 ) ( ON ?auto_535523 ?auto_535524 ) ( ON ?auto_535522 ?auto_535523 ) ( ON ?auto_535521 ?auto_535522 ) ( CLEAR ?auto_535519 ) ( ON ?auto_535520 ?auto_535521 ) ( CLEAR ?auto_535520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_535519 ?auto_535520 )
      ( MAKE-10PILE ?auto_535519 ?auto_535520 ?auto_535521 ?auto_535522 ?auto_535523 ?auto_535524 ?auto_535525 ?auto_535526 ?auto_535527 ?auto_535528 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_535561 - BLOCK
      ?auto_535562 - BLOCK
      ?auto_535563 - BLOCK
      ?auto_535564 - BLOCK
      ?auto_535565 - BLOCK
      ?auto_535566 - BLOCK
      ?auto_535567 - BLOCK
      ?auto_535568 - BLOCK
      ?auto_535569 - BLOCK
      ?auto_535570 - BLOCK
    )
    :vars
    (
      ?auto_535571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535570 ?auto_535571 ) ( not ( = ?auto_535561 ?auto_535562 ) ) ( not ( = ?auto_535561 ?auto_535563 ) ) ( not ( = ?auto_535561 ?auto_535564 ) ) ( not ( = ?auto_535561 ?auto_535565 ) ) ( not ( = ?auto_535561 ?auto_535566 ) ) ( not ( = ?auto_535561 ?auto_535567 ) ) ( not ( = ?auto_535561 ?auto_535568 ) ) ( not ( = ?auto_535561 ?auto_535569 ) ) ( not ( = ?auto_535561 ?auto_535570 ) ) ( not ( = ?auto_535561 ?auto_535571 ) ) ( not ( = ?auto_535562 ?auto_535563 ) ) ( not ( = ?auto_535562 ?auto_535564 ) ) ( not ( = ?auto_535562 ?auto_535565 ) ) ( not ( = ?auto_535562 ?auto_535566 ) ) ( not ( = ?auto_535562 ?auto_535567 ) ) ( not ( = ?auto_535562 ?auto_535568 ) ) ( not ( = ?auto_535562 ?auto_535569 ) ) ( not ( = ?auto_535562 ?auto_535570 ) ) ( not ( = ?auto_535562 ?auto_535571 ) ) ( not ( = ?auto_535563 ?auto_535564 ) ) ( not ( = ?auto_535563 ?auto_535565 ) ) ( not ( = ?auto_535563 ?auto_535566 ) ) ( not ( = ?auto_535563 ?auto_535567 ) ) ( not ( = ?auto_535563 ?auto_535568 ) ) ( not ( = ?auto_535563 ?auto_535569 ) ) ( not ( = ?auto_535563 ?auto_535570 ) ) ( not ( = ?auto_535563 ?auto_535571 ) ) ( not ( = ?auto_535564 ?auto_535565 ) ) ( not ( = ?auto_535564 ?auto_535566 ) ) ( not ( = ?auto_535564 ?auto_535567 ) ) ( not ( = ?auto_535564 ?auto_535568 ) ) ( not ( = ?auto_535564 ?auto_535569 ) ) ( not ( = ?auto_535564 ?auto_535570 ) ) ( not ( = ?auto_535564 ?auto_535571 ) ) ( not ( = ?auto_535565 ?auto_535566 ) ) ( not ( = ?auto_535565 ?auto_535567 ) ) ( not ( = ?auto_535565 ?auto_535568 ) ) ( not ( = ?auto_535565 ?auto_535569 ) ) ( not ( = ?auto_535565 ?auto_535570 ) ) ( not ( = ?auto_535565 ?auto_535571 ) ) ( not ( = ?auto_535566 ?auto_535567 ) ) ( not ( = ?auto_535566 ?auto_535568 ) ) ( not ( = ?auto_535566 ?auto_535569 ) ) ( not ( = ?auto_535566 ?auto_535570 ) ) ( not ( = ?auto_535566 ?auto_535571 ) ) ( not ( = ?auto_535567 ?auto_535568 ) ) ( not ( = ?auto_535567 ?auto_535569 ) ) ( not ( = ?auto_535567 ?auto_535570 ) ) ( not ( = ?auto_535567 ?auto_535571 ) ) ( not ( = ?auto_535568 ?auto_535569 ) ) ( not ( = ?auto_535568 ?auto_535570 ) ) ( not ( = ?auto_535568 ?auto_535571 ) ) ( not ( = ?auto_535569 ?auto_535570 ) ) ( not ( = ?auto_535569 ?auto_535571 ) ) ( not ( = ?auto_535570 ?auto_535571 ) ) ( ON ?auto_535569 ?auto_535570 ) ( ON ?auto_535568 ?auto_535569 ) ( ON ?auto_535567 ?auto_535568 ) ( ON ?auto_535566 ?auto_535567 ) ( ON ?auto_535565 ?auto_535566 ) ( ON ?auto_535564 ?auto_535565 ) ( ON ?auto_535563 ?auto_535564 ) ( ON ?auto_535562 ?auto_535563 ) ( ON ?auto_535561 ?auto_535562 ) ( CLEAR ?auto_535561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_535561 )
      ( MAKE-10PILE ?auto_535561 ?auto_535562 ?auto_535563 ?auto_535564 ?auto_535565 ?auto_535566 ?auto_535567 ?auto_535568 ?auto_535569 ?auto_535570 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535604 - BLOCK
      ?auto_535605 - BLOCK
      ?auto_535606 - BLOCK
      ?auto_535607 - BLOCK
      ?auto_535608 - BLOCK
      ?auto_535609 - BLOCK
      ?auto_535610 - BLOCK
      ?auto_535611 - BLOCK
      ?auto_535612 - BLOCK
      ?auto_535613 - BLOCK
      ?auto_535614 - BLOCK
    )
    :vars
    (
      ?auto_535615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_535613 ) ( ON ?auto_535614 ?auto_535615 ) ( CLEAR ?auto_535614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_535604 ) ( ON ?auto_535605 ?auto_535604 ) ( ON ?auto_535606 ?auto_535605 ) ( ON ?auto_535607 ?auto_535606 ) ( ON ?auto_535608 ?auto_535607 ) ( ON ?auto_535609 ?auto_535608 ) ( ON ?auto_535610 ?auto_535609 ) ( ON ?auto_535611 ?auto_535610 ) ( ON ?auto_535612 ?auto_535611 ) ( ON ?auto_535613 ?auto_535612 ) ( not ( = ?auto_535604 ?auto_535605 ) ) ( not ( = ?auto_535604 ?auto_535606 ) ) ( not ( = ?auto_535604 ?auto_535607 ) ) ( not ( = ?auto_535604 ?auto_535608 ) ) ( not ( = ?auto_535604 ?auto_535609 ) ) ( not ( = ?auto_535604 ?auto_535610 ) ) ( not ( = ?auto_535604 ?auto_535611 ) ) ( not ( = ?auto_535604 ?auto_535612 ) ) ( not ( = ?auto_535604 ?auto_535613 ) ) ( not ( = ?auto_535604 ?auto_535614 ) ) ( not ( = ?auto_535604 ?auto_535615 ) ) ( not ( = ?auto_535605 ?auto_535606 ) ) ( not ( = ?auto_535605 ?auto_535607 ) ) ( not ( = ?auto_535605 ?auto_535608 ) ) ( not ( = ?auto_535605 ?auto_535609 ) ) ( not ( = ?auto_535605 ?auto_535610 ) ) ( not ( = ?auto_535605 ?auto_535611 ) ) ( not ( = ?auto_535605 ?auto_535612 ) ) ( not ( = ?auto_535605 ?auto_535613 ) ) ( not ( = ?auto_535605 ?auto_535614 ) ) ( not ( = ?auto_535605 ?auto_535615 ) ) ( not ( = ?auto_535606 ?auto_535607 ) ) ( not ( = ?auto_535606 ?auto_535608 ) ) ( not ( = ?auto_535606 ?auto_535609 ) ) ( not ( = ?auto_535606 ?auto_535610 ) ) ( not ( = ?auto_535606 ?auto_535611 ) ) ( not ( = ?auto_535606 ?auto_535612 ) ) ( not ( = ?auto_535606 ?auto_535613 ) ) ( not ( = ?auto_535606 ?auto_535614 ) ) ( not ( = ?auto_535606 ?auto_535615 ) ) ( not ( = ?auto_535607 ?auto_535608 ) ) ( not ( = ?auto_535607 ?auto_535609 ) ) ( not ( = ?auto_535607 ?auto_535610 ) ) ( not ( = ?auto_535607 ?auto_535611 ) ) ( not ( = ?auto_535607 ?auto_535612 ) ) ( not ( = ?auto_535607 ?auto_535613 ) ) ( not ( = ?auto_535607 ?auto_535614 ) ) ( not ( = ?auto_535607 ?auto_535615 ) ) ( not ( = ?auto_535608 ?auto_535609 ) ) ( not ( = ?auto_535608 ?auto_535610 ) ) ( not ( = ?auto_535608 ?auto_535611 ) ) ( not ( = ?auto_535608 ?auto_535612 ) ) ( not ( = ?auto_535608 ?auto_535613 ) ) ( not ( = ?auto_535608 ?auto_535614 ) ) ( not ( = ?auto_535608 ?auto_535615 ) ) ( not ( = ?auto_535609 ?auto_535610 ) ) ( not ( = ?auto_535609 ?auto_535611 ) ) ( not ( = ?auto_535609 ?auto_535612 ) ) ( not ( = ?auto_535609 ?auto_535613 ) ) ( not ( = ?auto_535609 ?auto_535614 ) ) ( not ( = ?auto_535609 ?auto_535615 ) ) ( not ( = ?auto_535610 ?auto_535611 ) ) ( not ( = ?auto_535610 ?auto_535612 ) ) ( not ( = ?auto_535610 ?auto_535613 ) ) ( not ( = ?auto_535610 ?auto_535614 ) ) ( not ( = ?auto_535610 ?auto_535615 ) ) ( not ( = ?auto_535611 ?auto_535612 ) ) ( not ( = ?auto_535611 ?auto_535613 ) ) ( not ( = ?auto_535611 ?auto_535614 ) ) ( not ( = ?auto_535611 ?auto_535615 ) ) ( not ( = ?auto_535612 ?auto_535613 ) ) ( not ( = ?auto_535612 ?auto_535614 ) ) ( not ( = ?auto_535612 ?auto_535615 ) ) ( not ( = ?auto_535613 ?auto_535614 ) ) ( not ( = ?auto_535613 ?auto_535615 ) ) ( not ( = ?auto_535614 ?auto_535615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_535614 ?auto_535615 )
      ( !STACK ?auto_535614 ?auto_535613 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535650 - BLOCK
      ?auto_535651 - BLOCK
      ?auto_535652 - BLOCK
      ?auto_535653 - BLOCK
      ?auto_535654 - BLOCK
      ?auto_535655 - BLOCK
      ?auto_535656 - BLOCK
      ?auto_535657 - BLOCK
      ?auto_535658 - BLOCK
      ?auto_535659 - BLOCK
      ?auto_535660 - BLOCK
    )
    :vars
    (
      ?auto_535661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535660 ?auto_535661 ) ( ON-TABLE ?auto_535650 ) ( ON ?auto_535651 ?auto_535650 ) ( ON ?auto_535652 ?auto_535651 ) ( ON ?auto_535653 ?auto_535652 ) ( ON ?auto_535654 ?auto_535653 ) ( ON ?auto_535655 ?auto_535654 ) ( ON ?auto_535656 ?auto_535655 ) ( ON ?auto_535657 ?auto_535656 ) ( ON ?auto_535658 ?auto_535657 ) ( not ( = ?auto_535650 ?auto_535651 ) ) ( not ( = ?auto_535650 ?auto_535652 ) ) ( not ( = ?auto_535650 ?auto_535653 ) ) ( not ( = ?auto_535650 ?auto_535654 ) ) ( not ( = ?auto_535650 ?auto_535655 ) ) ( not ( = ?auto_535650 ?auto_535656 ) ) ( not ( = ?auto_535650 ?auto_535657 ) ) ( not ( = ?auto_535650 ?auto_535658 ) ) ( not ( = ?auto_535650 ?auto_535659 ) ) ( not ( = ?auto_535650 ?auto_535660 ) ) ( not ( = ?auto_535650 ?auto_535661 ) ) ( not ( = ?auto_535651 ?auto_535652 ) ) ( not ( = ?auto_535651 ?auto_535653 ) ) ( not ( = ?auto_535651 ?auto_535654 ) ) ( not ( = ?auto_535651 ?auto_535655 ) ) ( not ( = ?auto_535651 ?auto_535656 ) ) ( not ( = ?auto_535651 ?auto_535657 ) ) ( not ( = ?auto_535651 ?auto_535658 ) ) ( not ( = ?auto_535651 ?auto_535659 ) ) ( not ( = ?auto_535651 ?auto_535660 ) ) ( not ( = ?auto_535651 ?auto_535661 ) ) ( not ( = ?auto_535652 ?auto_535653 ) ) ( not ( = ?auto_535652 ?auto_535654 ) ) ( not ( = ?auto_535652 ?auto_535655 ) ) ( not ( = ?auto_535652 ?auto_535656 ) ) ( not ( = ?auto_535652 ?auto_535657 ) ) ( not ( = ?auto_535652 ?auto_535658 ) ) ( not ( = ?auto_535652 ?auto_535659 ) ) ( not ( = ?auto_535652 ?auto_535660 ) ) ( not ( = ?auto_535652 ?auto_535661 ) ) ( not ( = ?auto_535653 ?auto_535654 ) ) ( not ( = ?auto_535653 ?auto_535655 ) ) ( not ( = ?auto_535653 ?auto_535656 ) ) ( not ( = ?auto_535653 ?auto_535657 ) ) ( not ( = ?auto_535653 ?auto_535658 ) ) ( not ( = ?auto_535653 ?auto_535659 ) ) ( not ( = ?auto_535653 ?auto_535660 ) ) ( not ( = ?auto_535653 ?auto_535661 ) ) ( not ( = ?auto_535654 ?auto_535655 ) ) ( not ( = ?auto_535654 ?auto_535656 ) ) ( not ( = ?auto_535654 ?auto_535657 ) ) ( not ( = ?auto_535654 ?auto_535658 ) ) ( not ( = ?auto_535654 ?auto_535659 ) ) ( not ( = ?auto_535654 ?auto_535660 ) ) ( not ( = ?auto_535654 ?auto_535661 ) ) ( not ( = ?auto_535655 ?auto_535656 ) ) ( not ( = ?auto_535655 ?auto_535657 ) ) ( not ( = ?auto_535655 ?auto_535658 ) ) ( not ( = ?auto_535655 ?auto_535659 ) ) ( not ( = ?auto_535655 ?auto_535660 ) ) ( not ( = ?auto_535655 ?auto_535661 ) ) ( not ( = ?auto_535656 ?auto_535657 ) ) ( not ( = ?auto_535656 ?auto_535658 ) ) ( not ( = ?auto_535656 ?auto_535659 ) ) ( not ( = ?auto_535656 ?auto_535660 ) ) ( not ( = ?auto_535656 ?auto_535661 ) ) ( not ( = ?auto_535657 ?auto_535658 ) ) ( not ( = ?auto_535657 ?auto_535659 ) ) ( not ( = ?auto_535657 ?auto_535660 ) ) ( not ( = ?auto_535657 ?auto_535661 ) ) ( not ( = ?auto_535658 ?auto_535659 ) ) ( not ( = ?auto_535658 ?auto_535660 ) ) ( not ( = ?auto_535658 ?auto_535661 ) ) ( not ( = ?auto_535659 ?auto_535660 ) ) ( not ( = ?auto_535659 ?auto_535661 ) ) ( not ( = ?auto_535660 ?auto_535661 ) ) ( CLEAR ?auto_535658 ) ( ON ?auto_535659 ?auto_535660 ) ( CLEAR ?auto_535659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_535650 ?auto_535651 ?auto_535652 ?auto_535653 ?auto_535654 ?auto_535655 ?auto_535656 ?auto_535657 ?auto_535658 ?auto_535659 )
      ( MAKE-11PILE ?auto_535650 ?auto_535651 ?auto_535652 ?auto_535653 ?auto_535654 ?auto_535655 ?auto_535656 ?auto_535657 ?auto_535658 ?auto_535659 ?auto_535660 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535696 - BLOCK
      ?auto_535697 - BLOCK
      ?auto_535698 - BLOCK
      ?auto_535699 - BLOCK
      ?auto_535700 - BLOCK
      ?auto_535701 - BLOCK
      ?auto_535702 - BLOCK
      ?auto_535703 - BLOCK
      ?auto_535704 - BLOCK
      ?auto_535705 - BLOCK
      ?auto_535706 - BLOCK
    )
    :vars
    (
      ?auto_535707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535706 ?auto_535707 ) ( ON-TABLE ?auto_535696 ) ( ON ?auto_535697 ?auto_535696 ) ( ON ?auto_535698 ?auto_535697 ) ( ON ?auto_535699 ?auto_535698 ) ( ON ?auto_535700 ?auto_535699 ) ( ON ?auto_535701 ?auto_535700 ) ( ON ?auto_535702 ?auto_535701 ) ( ON ?auto_535703 ?auto_535702 ) ( not ( = ?auto_535696 ?auto_535697 ) ) ( not ( = ?auto_535696 ?auto_535698 ) ) ( not ( = ?auto_535696 ?auto_535699 ) ) ( not ( = ?auto_535696 ?auto_535700 ) ) ( not ( = ?auto_535696 ?auto_535701 ) ) ( not ( = ?auto_535696 ?auto_535702 ) ) ( not ( = ?auto_535696 ?auto_535703 ) ) ( not ( = ?auto_535696 ?auto_535704 ) ) ( not ( = ?auto_535696 ?auto_535705 ) ) ( not ( = ?auto_535696 ?auto_535706 ) ) ( not ( = ?auto_535696 ?auto_535707 ) ) ( not ( = ?auto_535697 ?auto_535698 ) ) ( not ( = ?auto_535697 ?auto_535699 ) ) ( not ( = ?auto_535697 ?auto_535700 ) ) ( not ( = ?auto_535697 ?auto_535701 ) ) ( not ( = ?auto_535697 ?auto_535702 ) ) ( not ( = ?auto_535697 ?auto_535703 ) ) ( not ( = ?auto_535697 ?auto_535704 ) ) ( not ( = ?auto_535697 ?auto_535705 ) ) ( not ( = ?auto_535697 ?auto_535706 ) ) ( not ( = ?auto_535697 ?auto_535707 ) ) ( not ( = ?auto_535698 ?auto_535699 ) ) ( not ( = ?auto_535698 ?auto_535700 ) ) ( not ( = ?auto_535698 ?auto_535701 ) ) ( not ( = ?auto_535698 ?auto_535702 ) ) ( not ( = ?auto_535698 ?auto_535703 ) ) ( not ( = ?auto_535698 ?auto_535704 ) ) ( not ( = ?auto_535698 ?auto_535705 ) ) ( not ( = ?auto_535698 ?auto_535706 ) ) ( not ( = ?auto_535698 ?auto_535707 ) ) ( not ( = ?auto_535699 ?auto_535700 ) ) ( not ( = ?auto_535699 ?auto_535701 ) ) ( not ( = ?auto_535699 ?auto_535702 ) ) ( not ( = ?auto_535699 ?auto_535703 ) ) ( not ( = ?auto_535699 ?auto_535704 ) ) ( not ( = ?auto_535699 ?auto_535705 ) ) ( not ( = ?auto_535699 ?auto_535706 ) ) ( not ( = ?auto_535699 ?auto_535707 ) ) ( not ( = ?auto_535700 ?auto_535701 ) ) ( not ( = ?auto_535700 ?auto_535702 ) ) ( not ( = ?auto_535700 ?auto_535703 ) ) ( not ( = ?auto_535700 ?auto_535704 ) ) ( not ( = ?auto_535700 ?auto_535705 ) ) ( not ( = ?auto_535700 ?auto_535706 ) ) ( not ( = ?auto_535700 ?auto_535707 ) ) ( not ( = ?auto_535701 ?auto_535702 ) ) ( not ( = ?auto_535701 ?auto_535703 ) ) ( not ( = ?auto_535701 ?auto_535704 ) ) ( not ( = ?auto_535701 ?auto_535705 ) ) ( not ( = ?auto_535701 ?auto_535706 ) ) ( not ( = ?auto_535701 ?auto_535707 ) ) ( not ( = ?auto_535702 ?auto_535703 ) ) ( not ( = ?auto_535702 ?auto_535704 ) ) ( not ( = ?auto_535702 ?auto_535705 ) ) ( not ( = ?auto_535702 ?auto_535706 ) ) ( not ( = ?auto_535702 ?auto_535707 ) ) ( not ( = ?auto_535703 ?auto_535704 ) ) ( not ( = ?auto_535703 ?auto_535705 ) ) ( not ( = ?auto_535703 ?auto_535706 ) ) ( not ( = ?auto_535703 ?auto_535707 ) ) ( not ( = ?auto_535704 ?auto_535705 ) ) ( not ( = ?auto_535704 ?auto_535706 ) ) ( not ( = ?auto_535704 ?auto_535707 ) ) ( not ( = ?auto_535705 ?auto_535706 ) ) ( not ( = ?auto_535705 ?auto_535707 ) ) ( not ( = ?auto_535706 ?auto_535707 ) ) ( ON ?auto_535705 ?auto_535706 ) ( CLEAR ?auto_535703 ) ( ON ?auto_535704 ?auto_535705 ) ( CLEAR ?auto_535704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_535696 ?auto_535697 ?auto_535698 ?auto_535699 ?auto_535700 ?auto_535701 ?auto_535702 ?auto_535703 ?auto_535704 )
      ( MAKE-11PILE ?auto_535696 ?auto_535697 ?auto_535698 ?auto_535699 ?auto_535700 ?auto_535701 ?auto_535702 ?auto_535703 ?auto_535704 ?auto_535705 ?auto_535706 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535742 - BLOCK
      ?auto_535743 - BLOCK
      ?auto_535744 - BLOCK
      ?auto_535745 - BLOCK
      ?auto_535746 - BLOCK
      ?auto_535747 - BLOCK
      ?auto_535748 - BLOCK
      ?auto_535749 - BLOCK
      ?auto_535750 - BLOCK
      ?auto_535751 - BLOCK
      ?auto_535752 - BLOCK
    )
    :vars
    (
      ?auto_535753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535752 ?auto_535753 ) ( ON-TABLE ?auto_535742 ) ( ON ?auto_535743 ?auto_535742 ) ( ON ?auto_535744 ?auto_535743 ) ( ON ?auto_535745 ?auto_535744 ) ( ON ?auto_535746 ?auto_535745 ) ( ON ?auto_535747 ?auto_535746 ) ( ON ?auto_535748 ?auto_535747 ) ( not ( = ?auto_535742 ?auto_535743 ) ) ( not ( = ?auto_535742 ?auto_535744 ) ) ( not ( = ?auto_535742 ?auto_535745 ) ) ( not ( = ?auto_535742 ?auto_535746 ) ) ( not ( = ?auto_535742 ?auto_535747 ) ) ( not ( = ?auto_535742 ?auto_535748 ) ) ( not ( = ?auto_535742 ?auto_535749 ) ) ( not ( = ?auto_535742 ?auto_535750 ) ) ( not ( = ?auto_535742 ?auto_535751 ) ) ( not ( = ?auto_535742 ?auto_535752 ) ) ( not ( = ?auto_535742 ?auto_535753 ) ) ( not ( = ?auto_535743 ?auto_535744 ) ) ( not ( = ?auto_535743 ?auto_535745 ) ) ( not ( = ?auto_535743 ?auto_535746 ) ) ( not ( = ?auto_535743 ?auto_535747 ) ) ( not ( = ?auto_535743 ?auto_535748 ) ) ( not ( = ?auto_535743 ?auto_535749 ) ) ( not ( = ?auto_535743 ?auto_535750 ) ) ( not ( = ?auto_535743 ?auto_535751 ) ) ( not ( = ?auto_535743 ?auto_535752 ) ) ( not ( = ?auto_535743 ?auto_535753 ) ) ( not ( = ?auto_535744 ?auto_535745 ) ) ( not ( = ?auto_535744 ?auto_535746 ) ) ( not ( = ?auto_535744 ?auto_535747 ) ) ( not ( = ?auto_535744 ?auto_535748 ) ) ( not ( = ?auto_535744 ?auto_535749 ) ) ( not ( = ?auto_535744 ?auto_535750 ) ) ( not ( = ?auto_535744 ?auto_535751 ) ) ( not ( = ?auto_535744 ?auto_535752 ) ) ( not ( = ?auto_535744 ?auto_535753 ) ) ( not ( = ?auto_535745 ?auto_535746 ) ) ( not ( = ?auto_535745 ?auto_535747 ) ) ( not ( = ?auto_535745 ?auto_535748 ) ) ( not ( = ?auto_535745 ?auto_535749 ) ) ( not ( = ?auto_535745 ?auto_535750 ) ) ( not ( = ?auto_535745 ?auto_535751 ) ) ( not ( = ?auto_535745 ?auto_535752 ) ) ( not ( = ?auto_535745 ?auto_535753 ) ) ( not ( = ?auto_535746 ?auto_535747 ) ) ( not ( = ?auto_535746 ?auto_535748 ) ) ( not ( = ?auto_535746 ?auto_535749 ) ) ( not ( = ?auto_535746 ?auto_535750 ) ) ( not ( = ?auto_535746 ?auto_535751 ) ) ( not ( = ?auto_535746 ?auto_535752 ) ) ( not ( = ?auto_535746 ?auto_535753 ) ) ( not ( = ?auto_535747 ?auto_535748 ) ) ( not ( = ?auto_535747 ?auto_535749 ) ) ( not ( = ?auto_535747 ?auto_535750 ) ) ( not ( = ?auto_535747 ?auto_535751 ) ) ( not ( = ?auto_535747 ?auto_535752 ) ) ( not ( = ?auto_535747 ?auto_535753 ) ) ( not ( = ?auto_535748 ?auto_535749 ) ) ( not ( = ?auto_535748 ?auto_535750 ) ) ( not ( = ?auto_535748 ?auto_535751 ) ) ( not ( = ?auto_535748 ?auto_535752 ) ) ( not ( = ?auto_535748 ?auto_535753 ) ) ( not ( = ?auto_535749 ?auto_535750 ) ) ( not ( = ?auto_535749 ?auto_535751 ) ) ( not ( = ?auto_535749 ?auto_535752 ) ) ( not ( = ?auto_535749 ?auto_535753 ) ) ( not ( = ?auto_535750 ?auto_535751 ) ) ( not ( = ?auto_535750 ?auto_535752 ) ) ( not ( = ?auto_535750 ?auto_535753 ) ) ( not ( = ?auto_535751 ?auto_535752 ) ) ( not ( = ?auto_535751 ?auto_535753 ) ) ( not ( = ?auto_535752 ?auto_535753 ) ) ( ON ?auto_535751 ?auto_535752 ) ( ON ?auto_535750 ?auto_535751 ) ( CLEAR ?auto_535748 ) ( ON ?auto_535749 ?auto_535750 ) ( CLEAR ?auto_535749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_535742 ?auto_535743 ?auto_535744 ?auto_535745 ?auto_535746 ?auto_535747 ?auto_535748 ?auto_535749 )
      ( MAKE-11PILE ?auto_535742 ?auto_535743 ?auto_535744 ?auto_535745 ?auto_535746 ?auto_535747 ?auto_535748 ?auto_535749 ?auto_535750 ?auto_535751 ?auto_535752 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535788 - BLOCK
      ?auto_535789 - BLOCK
      ?auto_535790 - BLOCK
      ?auto_535791 - BLOCK
      ?auto_535792 - BLOCK
      ?auto_535793 - BLOCK
      ?auto_535794 - BLOCK
      ?auto_535795 - BLOCK
      ?auto_535796 - BLOCK
      ?auto_535797 - BLOCK
      ?auto_535798 - BLOCK
    )
    :vars
    (
      ?auto_535799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535798 ?auto_535799 ) ( ON-TABLE ?auto_535788 ) ( ON ?auto_535789 ?auto_535788 ) ( ON ?auto_535790 ?auto_535789 ) ( ON ?auto_535791 ?auto_535790 ) ( ON ?auto_535792 ?auto_535791 ) ( ON ?auto_535793 ?auto_535792 ) ( not ( = ?auto_535788 ?auto_535789 ) ) ( not ( = ?auto_535788 ?auto_535790 ) ) ( not ( = ?auto_535788 ?auto_535791 ) ) ( not ( = ?auto_535788 ?auto_535792 ) ) ( not ( = ?auto_535788 ?auto_535793 ) ) ( not ( = ?auto_535788 ?auto_535794 ) ) ( not ( = ?auto_535788 ?auto_535795 ) ) ( not ( = ?auto_535788 ?auto_535796 ) ) ( not ( = ?auto_535788 ?auto_535797 ) ) ( not ( = ?auto_535788 ?auto_535798 ) ) ( not ( = ?auto_535788 ?auto_535799 ) ) ( not ( = ?auto_535789 ?auto_535790 ) ) ( not ( = ?auto_535789 ?auto_535791 ) ) ( not ( = ?auto_535789 ?auto_535792 ) ) ( not ( = ?auto_535789 ?auto_535793 ) ) ( not ( = ?auto_535789 ?auto_535794 ) ) ( not ( = ?auto_535789 ?auto_535795 ) ) ( not ( = ?auto_535789 ?auto_535796 ) ) ( not ( = ?auto_535789 ?auto_535797 ) ) ( not ( = ?auto_535789 ?auto_535798 ) ) ( not ( = ?auto_535789 ?auto_535799 ) ) ( not ( = ?auto_535790 ?auto_535791 ) ) ( not ( = ?auto_535790 ?auto_535792 ) ) ( not ( = ?auto_535790 ?auto_535793 ) ) ( not ( = ?auto_535790 ?auto_535794 ) ) ( not ( = ?auto_535790 ?auto_535795 ) ) ( not ( = ?auto_535790 ?auto_535796 ) ) ( not ( = ?auto_535790 ?auto_535797 ) ) ( not ( = ?auto_535790 ?auto_535798 ) ) ( not ( = ?auto_535790 ?auto_535799 ) ) ( not ( = ?auto_535791 ?auto_535792 ) ) ( not ( = ?auto_535791 ?auto_535793 ) ) ( not ( = ?auto_535791 ?auto_535794 ) ) ( not ( = ?auto_535791 ?auto_535795 ) ) ( not ( = ?auto_535791 ?auto_535796 ) ) ( not ( = ?auto_535791 ?auto_535797 ) ) ( not ( = ?auto_535791 ?auto_535798 ) ) ( not ( = ?auto_535791 ?auto_535799 ) ) ( not ( = ?auto_535792 ?auto_535793 ) ) ( not ( = ?auto_535792 ?auto_535794 ) ) ( not ( = ?auto_535792 ?auto_535795 ) ) ( not ( = ?auto_535792 ?auto_535796 ) ) ( not ( = ?auto_535792 ?auto_535797 ) ) ( not ( = ?auto_535792 ?auto_535798 ) ) ( not ( = ?auto_535792 ?auto_535799 ) ) ( not ( = ?auto_535793 ?auto_535794 ) ) ( not ( = ?auto_535793 ?auto_535795 ) ) ( not ( = ?auto_535793 ?auto_535796 ) ) ( not ( = ?auto_535793 ?auto_535797 ) ) ( not ( = ?auto_535793 ?auto_535798 ) ) ( not ( = ?auto_535793 ?auto_535799 ) ) ( not ( = ?auto_535794 ?auto_535795 ) ) ( not ( = ?auto_535794 ?auto_535796 ) ) ( not ( = ?auto_535794 ?auto_535797 ) ) ( not ( = ?auto_535794 ?auto_535798 ) ) ( not ( = ?auto_535794 ?auto_535799 ) ) ( not ( = ?auto_535795 ?auto_535796 ) ) ( not ( = ?auto_535795 ?auto_535797 ) ) ( not ( = ?auto_535795 ?auto_535798 ) ) ( not ( = ?auto_535795 ?auto_535799 ) ) ( not ( = ?auto_535796 ?auto_535797 ) ) ( not ( = ?auto_535796 ?auto_535798 ) ) ( not ( = ?auto_535796 ?auto_535799 ) ) ( not ( = ?auto_535797 ?auto_535798 ) ) ( not ( = ?auto_535797 ?auto_535799 ) ) ( not ( = ?auto_535798 ?auto_535799 ) ) ( ON ?auto_535797 ?auto_535798 ) ( ON ?auto_535796 ?auto_535797 ) ( ON ?auto_535795 ?auto_535796 ) ( CLEAR ?auto_535793 ) ( ON ?auto_535794 ?auto_535795 ) ( CLEAR ?auto_535794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_535788 ?auto_535789 ?auto_535790 ?auto_535791 ?auto_535792 ?auto_535793 ?auto_535794 )
      ( MAKE-11PILE ?auto_535788 ?auto_535789 ?auto_535790 ?auto_535791 ?auto_535792 ?auto_535793 ?auto_535794 ?auto_535795 ?auto_535796 ?auto_535797 ?auto_535798 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535834 - BLOCK
      ?auto_535835 - BLOCK
      ?auto_535836 - BLOCK
      ?auto_535837 - BLOCK
      ?auto_535838 - BLOCK
      ?auto_535839 - BLOCK
      ?auto_535840 - BLOCK
      ?auto_535841 - BLOCK
      ?auto_535842 - BLOCK
      ?auto_535843 - BLOCK
      ?auto_535844 - BLOCK
    )
    :vars
    (
      ?auto_535845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535844 ?auto_535845 ) ( ON-TABLE ?auto_535834 ) ( ON ?auto_535835 ?auto_535834 ) ( ON ?auto_535836 ?auto_535835 ) ( ON ?auto_535837 ?auto_535836 ) ( ON ?auto_535838 ?auto_535837 ) ( not ( = ?auto_535834 ?auto_535835 ) ) ( not ( = ?auto_535834 ?auto_535836 ) ) ( not ( = ?auto_535834 ?auto_535837 ) ) ( not ( = ?auto_535834 ?auto_535838 ) ) ( not ( = ?auto_535834 ?auto_535839 ) ) ( not ( = ?auto_535834 ?auto_535840 ) ) ( not ( = ?auto_535834 ?auto_535841 ) ) ( not ( = ?auto_535834 ?auto_535842 ) ) ( not ( = ?auto_535834 ?auto_535843 ) ) ( not ( = ?auto_535834 ?auto_535844 ) ) ( not ( = ?auto_535834 ?auto_535845 ) ) ( not ( = ?auto_535835 ?auto_535836 ) ) ( not ( = ?auto_535835 ?auto_535837 ) ) ( not ( = ?auto_535835 ?auto_535838 ) ) ( not ( = ?auto_535835 ?auto_535839 ) ) ( not ( = ?auto_535835 ?auto_535840 ) ) ( not ( = ?auto_535835 ?auto_535841 ) ) ( not ( = ?auto_535835 ?auto_535842 ) ) ( not ( = ?auto_535835 ?auto_535843 ) ) ( not ( = ?auto_535835 ?auto_535844 ) ) ( not ( = ?auto_535835 ?auto_535845 ) ) ( not ( = ?auto_535836 ?auto_535837 ) ) ( not ( = ?auto_535836 ?auto_535838 ) ) ( not ( = ?auto_535836 ?auto_535839 ) ) ( not ( = ?auto_535836 ?auto_535840 ) ) ( not ( = ?auto_535836 ?auto_535841 ) ) ( not ( = ?auto_535836 ?auto_535842 ) ) ( not ( = ?auto_535836 ?auto_535843 ) ) ( not ( = ?auto_535836 ?auto_535844 ) ) ( not ( = ?auto_535836 ?auto_535845 ) ) ( not ( = ?auto_535837 ?auto_535838 ) ) ( not ( = ?auto_535837 ?auto_535839 ) ) ( not ( = ?auto_535837 ?auto_535840 ) ) ( not ( = ?auto_535837 ?auto_535841 ) ) ( not ( = ?auto_535837 ?auto_535842 ) ) ( not ( = ?auto_535837 ?auto_535843 ) ) ( not ( = ?auto_535837 ?auto_535844 ) ) ( not ( = ?auto_535837 ?auto_535845 ) ) ( not ( = ?auto_535838 ?auto_535839 ) ) ( not ( = ?auto_535838 ?auto_535840 ) ) ( not ( = ?auto_535838 ?auto_535841 ) ) ( not ( = ?auto_535838 ?auto_535842 ) ) ( not ( = ?auto_535838 ?auto_535843 ) ) ( not ( = ?auto_535838 ?auto_535844 ) ) ( not ( = ?auto_535838 ?auto_535845 ) ) ( not ( = ?auto_535839 ?auto_535840 ) ) ( not ( = ?auto_535839 ?auto_535841 ) ) ( not ( = ?auto_535839 ?auto_535842 ) ) ( not ( = ?auto_535839 ?auto_535843 ) ) ( not ( = ?auto_535839 ?auto_535844 ) ) ( not ( = ?auto_535839 ?auto_535845 ) ) ( not ( = ?auto_535840 ?auto_535841 ) ) ( not ( = ?auto_535840 ?auto_535842 ) ) ( not ( = ?auto_535840 ?auto_535843 ) ) ( not ( = ?auto_535840 ?auto_535844 ) ) ( not ( = ?auto_535840 ?auto_535845 ) ) ( not ( = ?auto_535841 ?auto_535842 ) ) ( not ( = ?auto_535841 ?auto_535843 ) ) ( not ( = ?auto_535841 ?auto_535844 ) ) ( not ( = ?auto_535841 ?auto_535845 ) ) ( not ( = ?auto_535842 ?auto_535843 ) ) ( not ( = ?auto_535842 ?auto_535844 ) ) ( not ( = ?auto_535842 ?auto_535845 ) ) ( not ( = ?auto_535843 ?auto_535844 ) ) ( not ( = ?auto_535843 ?auto_535845 ) ) ( not ( = ?auto_535844 ?auto_535845 ) ) ( ON ?auto_535843 ?auto_535844 ) ( ON ?auto_535842 ?auto_535843 ) ( ON ?auto_535841 ?auto_535842 ) ( ON ?auto_535840 ?auto_535841 ) ( CLEAR ?auto_535838 ) ( ON ?auto_535839 ?auto_535840 ) ( CLEAR ?auto_535839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_535834 ?auto_535835 ?auto_535836 ?auto_535837 ?auto_535838 ?auto_535839 )
      ( MAKE-11PILE ?auto_535834 ?auto_535835 ?auto_535836 ?auto_535837 ?auto_535838 ?auto_535839 ?auto_535840 ?auto_535841 ?auto_535842 ?auto_535843 ?auto_535844 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535880 - BLOCK
      ?auto_535881 - BLOCK
      ?auto_535882 - BLOCK
      ?auto_535883 - BLOCK
      ?auto_535884 - BLOCK
      ?auto_535885 - BLOCK
      ?auto_535886 - BLOCK
      ?auto_535887 - BLOCK
      ?auto_535888 - BLOCK
      ?auto_535889 - BLOCK
      ?auto_535890 - BLOCK
    )
    :vars
    (
      ?auto_535891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535890 ?auto_535891 ) ( ON-TABLE ?auto_535880 ) ( ON ?auto_535881 ?auto_535880 ) ( ON ?auto_535882 ?auto_535881 ) ( ON ?auto_535883 ?auto_535882 ) ( not ( = ?auto_535880 ?auto_535881 ) ) ( not ( = ?auto_535880 ?auto_535882 ) ) ( not ( = ?auto_535880 ?auto_535883 ) ) ( not ( = ?auto_535880 ?auto_535884 ) ) ( not ( = ?auto_535880 ?auto_535885 ) ) ( not ( = ?auto_535880 ?auto_535886 ) ) ( not ( = ?auto_535880 ?auto_535887 ) ) ( not ( = ?auto_535880 ?auto_535888 ) ) ( not ( = ?auto_535880 ?auto_535889 ) ) ( not ( = ?auto_535880 ?auto_535890 ) ) ( not ( = ?auto_535880 ?auto_535891 ) ) ( not ( = ?auto_535881 ?auto_535882 ) ) ( not ( = ?auto_535881 ?auto_535883 ) ) ( not ( = ?auto_535881 ?auto_535884 ) ) ( not ( = ?auto_535881 ?auto_535885 ) ) ( not ( = ?auto_535881 ?auto_535886 ) ) ( not ( = ?auto_535881 ?auto_535887 ) ) ( not ( = ?auto_535881 ?auto_535888 ) ) ( not ( = ?auto_535881 ?auto_535889 ) ) ( not ( = ?auto_535881 ?auto_535890 ) ) ( not ( = ?auto_535881 ?auto_535891 ) ) ( not ( = ?auto_535882 ?auto_535883 ) ) ( not ( = ?auto_535882 ?auto_535884 ) ) ( not ( = ?auto_535882 ?auto_535885 ) ) ( not ( = ?auto_535882 ?auto_535886 ) ) ( not ( = ?auto_535882 ?auto_535887 ) ) ( not ( = ?auto_535882 ?auto_535888 ) ) ( not ( = ?auto_535882 ?auto_535889 ) ) ( not ( = ?auto_535882 ?auto_535890 ) ) ( not ( = ?auto_535882 ?auto_535891 ) ) ( not ( = ?auto_535883 ?auto_535884 ) ) ( not ( = ?auto_535883 ?auto_535885 ) ) ( not ( = ?auto_535883 ?auto_535886 ) ) ( not ( = ?auto_535883 ?auto_535887 ) ) ( not ( = ?auto_535883 ?auto_535888 ) ) ( not ( = ?auto_535883 ?auto_535889 ) ) ( not ( = ?auto_535883 ?auto_535890 ) ) ( not ( = ?auto_535883 ?auto_535891 ) ) ( not ( = ?auto_535884 ?auto_535885 ) ) ( not ( = ?auto_535884 ?auto_535886 ) ) ( not ( = ?auto_535884 ?auto_535887 ) ) ( not ( = ?auto_535884 ?auto_535888 ) ) ( not ( = ?auto_535884 ?auto_535889 ) ) ( not ( = ?auto_535884 ?auto_535890 ) ) ( not ( = ?auto_535884 ?auto_535891 ) ) ( not ( = ?auto_535885 ?auto_535886 ) ) ( not ( = ?auto_535885 ?auto_535887 ) ) ( not ( = ?auto_535885 ?auto_535888 ) ) ( not ( = ?auto_535885 ?auto_535889 ) ) ( not ( = ?auto_535885 ?auto_535890 ) ) ( not ( = ?auto_535885 ?auto_535891 ) ) ( not ( = ?auto_535886 ?auto_535887 ) ) ( not ( = ?auto_535886 ?auto_535888 ) ) ( not ( = ?auto_535886 ?auto_535889 ) ) ( not ( = ?auto_535886 ?auto_535890 ) ) ( not ( = ?auto_535886 ?auto_535891 ) ) ( not ( = ?auto_535887 ?auto_535888 ) ) ( not ( = ?auto_535887 ?auto_535889 ) ) ( not ( = ?auto_535887 ?auto_535890 ) ) ( not ( = ?auto_535887 ?auto_535891 ) ) ( not ( = ?auto_535888 ?auto_535889 ) ) ( not ( = ?auto_535888 ?auto_535890 ) ) ( not ( = ?auto_535888 ?auto_535891 ) ) ( not ( = ?auto_535889 ?auto_535890 ) ) ( not ( = ?auto_535889 ?auto_535891 ) ) ( not ( = ?auto_535890 ?auto_535891 ) ) ( ON ?auto_535889 ?auto_535890 ) ( ON ?auto_535888 ?auto_535889 ) ( ON ?auto_535887 ?auto_535888 ) ( ON ?auto_535886 ?auto_535887 ) ( ON ?auto_535885 ?auto_535886 ) ( CLEAR ?auto_535883 ) ( ON ?auto_535884 ?auto_535885 ) ( CLEAR ?auto_535884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_535880 ?auto_535881 ?auto_535882 ?auto_535883 ?auto_535884 )
      ( MAKE-11PILE ?auto_535880 ?auto_535881 ?auto_535882 ?auto_535883 ?auto_535884 ?auto_535885 ?auto_535886 ?auto_535887 ?auto_535888 ?auto_535889 ?auto_535890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535926 - BLOCK
      ?auto_535927 - BLOCK
      ?auto_535928 - BLOCK
      ?auto_535929 - BLOCK
      ?auto_535930 - BLOCK
      ?auto_535931 - BLOCK
      ?auto_535932 - BLOCK
      ?auto_535933 - BLOCK
      ?auto_535934 - BLOCK
      ?auto_535935 - BLOCK
      ?auto_535936 - BLOCK
    )
    :vars
    (
      ?auto_535937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535936 ?auto_535937 ) ( ON-TABLE ?auto_535926 ) ( ON ?auto_535927 ?auto_535926 ) ( ON ?auto_535928 ?auto_535927 ) ( not ( = ?auto_535926 ?auto_535927 ) ) ( not ( = ?auto_535926 ?auto_535928 ) ) ( not ( = ?auto_535926 ?auto_535929 ) ) ( not ( = ?auto_535926 ?auto_535930 ) ) ( not ( = ?auto_535926 ?auto_535931 ) ) ( not ( = ?auto_535926 ?auto_535932 ) ) ( not ( = ?auto_535926 ?auto_535933 ) ) ( not ( = ?auto_535926 ?auto_535934 ) ) ( not ( = ?auto_535926 ?auto_535935 ) ) ( not ( = ?auto_535926 ?auto_535936 ) ) ( not ( = ?auto_535926 ?auto_535937 ) ) ( not ( = ?auto_535927 ?auto_535928 ) ) ( not ( = ?auto_535927 ?auto_535929 ) ) ( not ( = ?auto_535927 ?auto_535930 ) ) ( not ( = ?auto_535927 ?auto_535931 ) ) ( not ( = ?auto_535927 ?auto_535932 ) ) ( not ( = ?auto_535927 ?auto_535933 ) ) ( not ( = ?auto_535927 ?auto_535934 ) ) ( not ( = ?auto_535927 ?auto_535935 ) ) ( not ( = ?auto_535927 ?auto_535936 ) ) ( not ( = ?auto_535927 ?auto_535937 ) ) ( not ( = ?auto_535928 ?auto_535929 ) ) ( not ( = ?auto_535928 ?auto_535930 ) ) ( not ( = ?auto_535928 ?auto_535931 ) ) ( not ( = ?auto_535928 ?auto_535932 ) ) ( not ( = ?auto_535928 ?auto_535933 ) ) ( not ( = ?auto_535928 ?auto_535934 ) ) ( not ( = ?auto_535928 ?auto_535935 ) ) ( not ( = ?auto_535928 ?auto_535936 ) ) ( not ( = ?auto_535928 ?auto_535937 ) ) ( not ( = ?auto_535929 ?auto_535930 ) ) ( not ( = ?auto_535929 ?auto_535931 ) ) ( not ( = ?auto_535929 ?auto_535932 ) ) ( not ( = ?auto_535929 ?auto_535933 ) ) ( not ( = ?auto_535929 ?auto_535934 ) ) ( not ( = ?auto_535929 ?auto_535935 ) ) ( not ( = ?auto_535929 ?auto_535936 ) ) ( not ( = ?auto_535929 ?auto_535937 ) ) ( not ( = ?auto_535930 ?auto_535931 ) ) ( not ( = ?auto_535930 ?auto_535932 ) ) ( not ( = ?auto_535930 ?auto_535933 ) ) ( not ( = ?auto_535930 ?auto_535934 ) ) ( not ( = ?auto_535930 ?auto_535935 ) ) ( not ( = ?auto_535930 ?auto_535936 ) ) ( not ( = ?auto_535930 ?auto_535937 ) ) ( not ( = ?auto_535931 ?auto_535932 ) ) ( not ( = ?auto_535931 ?auto_535933 ) ) ( not ( = ?auto_535931 ?auto_535934 ) ) ( not ( = ?auto_535931 ?auto_535935 ) ) ( not ( = ?auto_535931 ?auto_535936 ) ) ( not ( = ?auto_535931 ?auto_535937 ) ) ( not ( = ?auto_535932 ?auto_535933 ) ) ( not ( = ?auto_535932 ?auto_535934 ) ) ( not ( = ?auto_535932 ?auto_535935 ) ) ( not ( = ?auto_535932 ?auto_535936 ) ) ( not ( = ?auto_535932 ?auto_535937 ) ) ( not ( = ?auto_535933 ?auto_535934 ) ) ( not ( = ?auto_535933 ?auto_535935 ) ) ( not ( = ?auto_535933 ?auto_535936 ) ) ( not ( = ?auto_535933 ?auto_535937 ) ) ( not ( = ?auto_535934 ?auto_535935 ) ) ( not ( = ?auto_535934 ?auto_535936 ) ) ( not ( = ?auto_535934 ?auto_535937 ) ) ( not ( = ?auto_535935 ?auto_535936 ) ) ( not ( = ?auto_535935 ?auto_535937 ) ) ( not ( = ?auto_535936 ?auto_535937 ) ) ( ON ?auto_535935 ?auto_535936 ) ( ON ?auto_535934 ?auto_535935 ) ( ON ?auto_535933 ?auto_535934 ) ( ON ?auto_535932 ?auto_535933 ) ( ON ?auto_535931 ?auto_535932 ) ( ON ?auto_535930 ?auto_535931 ) ( CLEAR ?auto_535928 ) ( ON ?auto_535929 ?auto_535930 ) ( CLEAR ?auto_535929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_535926 ?auto_535927 ?auto_535928 ?auto_535929 )
      ( MAKE-11PILE ?auto_535926 ?auto_535927 ?auto_535928 ?auto_535929 ?auto_535930 ?auto_535931 ?auto_535932 ?auto_535933 ?auto_535934 ?auto_535935 ?auto_535936 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_535972 - BLOCK
      ?auto_535973 - BLOCK
      ?auto_535974 - BLOCK
      ?auto_535975 - BLOCK
      ?auto_535976 - BLOCK
      ?auto_535977 - BLOCK
      ?auto_535978 - BLOCK
      ?auto_535979 - BLOCK
      ?auto_535980 - BLOCK
      ?auto_535981 - BLOCK
      ?auto_535982 - BLOCK
    )
    :vars
    (
      ?auto_535983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535982 ?auto_535983 ) ( ON-TABLE ?auto_535972 ) ( ON ?auto_535973 ?auto_535972 ) ( not ( = ?auto_535972 ?auto_535973 ) ) ( not ( = ?auto_535972 ?auto_535974 ) ) ( not ( = ?auto_535972 ?auto_535975 ) ) ( not ( = ?auto_535972 ?auto_535976 ) ) ( not ( = ?auto_535972 ?auto_535977 ) ) ( not ( = ?auto_535972 ?auto_535978 ) ) ( not ( = ?auto_535972 ?auto_535979 ) ) ( not ( = ?auto_535972 ?auto_535980 ) ) ( not ( = ?auto_535972 ?auto_535981 ) ) ( not ( = ?auto_535972 ?auto_535982 ) ) ( not ( = ?auto_535972 ?auto_535983 ) ) ( not ( = ?auto_535973 ?auto_535974 ) ) ( not ( = ?auto_535973 ?auto_535975 ) ) ( not ( = ?auto_535973 ?auto_535976 ) ) ( not ( = ?auto_535973 ?auto_535977 ) ) ( not ( = ?auto_535973 ?auto_535978 ) ) ( not ( = ?auto_535973 ?auto_535979 ) ) ( not ( = ?auto_535973 ?auto_535980 ) ) ( not ( = ?auto_535973 ?auto_535981 ) ) ( not ( = ?auto_535973 ?auto_535982 ) ) ( not ( = ?auto_535973 ?auto_535983 ) ) ( not ( = ?auto_535974 ?auto_535975 ) ) ( not ( = ?auto_535974 ?auto_535976 ) ) ( not ( = ?auto_535974 ?auto_535977 ) ) ( not ( = ?auto_535974 ?auto_535978 ) ) ( not ( = ?auto_535974 ?auto_535979 ) ) ( not ( = ?auto_535974 ?auto_535980 ) ) ( not ( = ?auto_535974 ?auto_535981 ) ) ( not ( = ?auto_535974 ?auto_535982 ) ) ( not ( = ?auto_535974 ?auto_535983 ) ) ( not ( = ?auto_535975 ?auto_535976 ) ) ( not ( = ?auto_535975 ?auto_535977 ) ) ( not ( = ?auto_535975 ?auto_535978 ) ) ( not ( = ?auto_535975 ?auto_535979 ) ) ( not ( = ?auto_535975 ?auto_535980 ) ) ( not ( = ?auto_535975 ?auto_535981 ) ) ( not ( = ?auto_535975 ?auto_535982 ) ) ( not ( = ?auto_535975 ?auto_535983 ) ) ( not ( = ?auto_535976 ?auto_535977 ) ) ( not ( = ?auto_535976 ?auto_535978 ) ) ( not ( = ?auto_535976 ?auto_535979 ) ) ( not ( = ?auto_535976 ?auto_535980 ) ) ( not ( = ?auto_535976 ?auto_535981 ) ) ( not ( = ?auto_535976 ?auto_535982 ) ) ( not ( = ?auto_535976 ?auto_535983 ) ) ( not ( = ?auto_535977 ?auto_535978 ) ) ( not ( = ?auto_535977 ?auto_535979 ) ) ( not ( = ?auto_535977 ?auto_535980 ) ) ( not ( = ?auto_535977 ?auto_535981 ) ) ( not ( = ?auto_535977 ?auto_535982 ) ) ( not ( = ?auto_535977 ?auto_535983 ) ) ( not ( = ?auto_535978 ?auto_535979 ) ) ( not ( = ?auto_535978 ?auto_535980 ) ) ( not ( = ?auto_535978 ?auto_535981 ) ) ( not ( = ?auto_535978 ?auto_535982 ) ) ( not ( = ?auto_535978 ?auto_535983 ) ) ( not ( = ?auto_535979 ?auto_535980 ) ) ( not ( = ?auto_535979 ?auto_535981 ) ) ( not ( = ?auto_535979 ?auto_535982 ) ) ( not ( = ?auto_535979 ?auto_535983 ) ) ( not ( = ?auto_535980 ?auto_535981 ) ) ( not ( = ?auto_535980 ?auto_535982 ) ) ( not ( = ?auto_535980 ?auto_535983 ) ) ( not ( = ?auto_535981 ?auto_535982 ) ) ( not ( = ?auto_535981 ?auto_535983 ) ) ( not ( = ?auto_535982 ?auto_535983 ) ) ( ON ?auto_535981 ?auto_535982 ) ( ON ?auto_535980 ?auto_535981 ) ( ON ?auto_535979 ?auto_535980 ) ( ON ?auto_535978 ?auto_535979 ) ( ON ?auto_535977 ?auto_535978 ) ( ON ?auto_535976 ?auto_535977 ) ( ON ?auto_535975 ?auto_535976 ) ( CLEAR ?auto_535973 ) ( ON ?auto_535974 ?auto_535975 ) ( CLEAR ?auto_535974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_535972 ?auto_535973 ?auto_535974 )
      ( MAKE-11PILE ?auto_535972 ?auto_535973 ?auto_535974 ?auto_535975 ?auto_535976 ?auto_535977 ?auto_535978 ?auto_535979 ?auto_535980 ?auto_535981 ?auto_535982 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_536018 - BLOCK
      ?auto_536019 - BLOCK
      ?auto_536020 - BLOCK
      ?auto_536021 - BLOCK
      ?auto_536022 - BLOCK
      ?auto_536023 - BLOCK
      ?auto_536024 - BLOCK
      ?auto_536025 - BLOCK
      ?auto_536026 - BLOCK
      ?auto_536027 - BLOCK
      ?auto_536028 - BLOCK
    )
    :vars
    (
      ?auto_536029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536028 ?auto_536029 ) ( ON-TABLE ?auto_536018 ) ( not ( = ?auto_536018 ?auto_536019 ) ) ( not ( = ?auto_536018 ?auto_536020 ) ) ( not ( = ?auto_536018 ?auto_536021 ) ) ( not ( = ?auto_536018 ?auto_536022 ) ) ( not ( = ?auto_536018 ?auto_536023 ) ) ( not ( = ?auto_536018 ?auto_536024 ) ) ( not ( = ?auto_536018 ?auto_536025 ) ) ( not ( = ?auto_536018 ?auto_536026 ) ) ( not ( = ?auto_536018 ?auto_536027 ) ) ( not ( = ?auto_536018 ?auto_536028 ) ) ( not ( = ?auto_536018 ?auto_536029 ) ) ( not ( = ?auto_536019 ?auto_536020 ) ) ( not ( = ?auto_536019 ?auto_536021 ) ) ( not ( = ?auto_536019 ?auto_536022 ) ) ( not ( = ?auto_536019 ?auto_536023 ) ) ( not ( = ?auto_536019 ?auto_536024 ) ) ( not ( = ?auto_536019 ?auto_536025 ) ) ( not ( = ?auto_536019 ?auto_536026 ) ) ( not ( = ?auto_536019 ?auto_536027 ) ) ( not ( = ?auto_536019 ?auto_536028 ) ) ( not ( = ?auto_536019 ?auto_536029 ) ) ( not ( = ?auto_536020 ?auto_536021 ) ) ( not ( = ?auto_536020 ?auto_536022 ) ) ( not ( = ?auto_536020 ?auto_536023 ) ) ( not ( = ?auto_536020 ?auto_536024 ) ) ( not ( = ?auto_536020 ?auto_536025 ) ) ( not ( = ?auto_536020 ?auto_536026 ) ) ( not ( = ?auto_536020 ?auto_536027 ) ) ( not ( = ?auto_536020 ?auto_536028 ) ) ( not ( = ?auto_536020 ?auto_536029 ) ) ( not ( = ?auto_536021 ?auto_536022 ) ) ( not ( = ?auto_536021 ?auto_536023 ) ) ( not ( = ?auto_536021 ?auto_536024 ) ) ( not ( = ?auto_536021 ?auto_536025 ) ) ( not ( = ?auto_536021 ?auto_536026 ) ) ( not ( = ?auto_536021 ?auto_536027 ) ) ( not ( = ?auto_536021 ?auto_536028 ) ) ( not ( = ?auto_536021 ?auto_536029 ) ) ( not ( = ?auto_536022 ?auto_536023 ) ) ( not ( = ?auto_536022 ?auto_536024 ) ) ( not ( = ?auto_536022 ?auto_536025 ) ) ( not ( = ?auto_536022 ?auto_536026 ) ) ( not ( = ?auto_536022 ?auto_536027 ) ) ( not ( = ?auto_536022 ?auto_536028 ) ) ( not ( = ?auto_536022 ?auto_536029 ) ) ( not ( = ?auto_536023 ?auto_536024 ) ) ( not ( = ?auto_536023 ?auto_536025 ) ) ( not ( = ?auto_536023 ?auto_536026 ) ) ( not ( = ?auto_536023 ?auto_536027 ) ) ( not ( = ?auto_536023 ?auto_536028 ) ) ( not ( = ?auto_536023 ?auto_536029 ) ) ( not ( = ?auto_536024 ?auto_536025 ) ) ( not ( = ?auto_536024 ?auto_536026 ) ) ( not ( = ?auto_536024 ?auto_536027 ) ) ( not ( = ?auto_536024 ?auto_536028 ) ) ( not ( = ?auto_536024 ?auto_536029 ) ) ( not ( = ?auto_536025 ?auto_536026 ) ) ( not ( = ?auto_536025 ?auto_536027 ) ) ( not ( = ?auto_536025 ?auto_536028 ) ) ( not ( = ?auto_536025 ?auto_536029 ) ) ( not ( = ?auto_536026 ?auto_536027 ) ) ( not ( = ?auto_536026 ?auto_536028 ) ) ( not ( = ?auto_536026 ?auto_536029 ) ) ( not ( = ?auto_536027 ?auto_536028 ) ) ( not ( = ?auto_536027 ?auto_536029 ) ) ( not ( = ?auto_536028 ?auto_536029 ) ) ( ON ?auto_536027 ?auto_536028 ) ( ON ?auto_536026 ?auto_536027 ) ( ON ?auto_536025 ?auto_536026 ) ( ON ?auto_536024 ?auto_536025 ) ( ON ?auto_536023 ?auto_536024 ) ( ON ?auto_536022 ?auto_536023 ) ( ON ?auto_536021 ?auto_536022 ) ( ON ?auto_536020 ?auto_536021 ) ( CLEAR ?auto_536018 ) ( ON ?auto_536019 ?auto_536020 ) ( CLEAR ?auto_536019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_536018 ?auto_536019 )
      ( MAKE-11PILE ?auto_536018 ?auto_536019 ?auto_536020 ?auto_536021 ?auto_536022 ?auto_536023 ?auto_536024 ?auto_536025 ?auto_536026 ?auto_536027 ?auto_536028 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_536064 - BLOCK
      ?auto_536065 - BLOCK
      ?auto_536066 - BLOCK
      ?auto_536067 - BLOCK
      ?auto_536068 - BLOCK
      ?auto_536069 - BLOCK
      ?auto_536070 - BLOCK
      ?auto_536071 - BLOCK
      ?auto_536072 - BLOCK
      ?auto_536073 - BLOCK
      ?auto_536074 - BLOCK
    )
    :vars
    (
      ?auto_536075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536074 ?auto_536075 ) ( not ( = ?auto_536064 ?auto_536065 ) ) ( not ( = ?auto_536064 ?auto_536066 ) ) ( not ( = ?auto_536064 ?auto_536067 ) ) ( not ( = ?auto_536064 ?auto_536068 ) ) ( not ( = ?auto_536064 ?auto_536069 ) ) ( not ( = ?auto_536064 ?auto_536070 ) ) ( not ( = ?auto_536064 ?auto_536071 ) ) ( not ( = ?auto_536064 ?auto_536072 ) ) ( not ( = ?auto_536064 ?auto_536073 ) ) ( not ( = ?auto_536064 ?auto_536074 ) ) ( not ( = ?auto_536064 ?auto_536075 ) ) ( not ( = ?auto_536065 ?auto_536066 ) ) ( not ( = ?auto_536065 ?auto_536067 ) ) ( not ( = ?auto_536065 ?auto_536068 ) ) ( not ( = ?auto_536065 ?auto_536069 ) ) ( not ( = ?auto_536065 ?auto_536070 ) ) ( not ( = ?auto_536065 ?auto_536071 ) ) ( not ( = ?auto_536065 ?auto_536072 ) ) ( not ( = ?auto_536065 ?auto_536073 ) ) ( not ( = ?auto_536065 ?auto_536074 ) ) ( not ( = ?auto_536065 ?auto_536075 ) ) ( not ( = ?auto_536066 ?auto_536067 ) ) ( not ( = ?auto_536066 ?auto_536068 ) ) ( not ( = ?auto_536066 ?auto_536069 ) ) ( not ( = ?auto_536066 ?auto_536070 ) ) ( not ( = ?auto_536066 ?auto_536071 ) ) ( not ( = ?auto_536066 ?auto_536072 ) ) ( not ( = ?auto_536066 ?auto_536073 ) ) ( not ( = ?auto_536066 ?auto_536074 ) ) ( not ( = ?auto_536066 ?auto_536075 ) ) ( not ( = ?auto_536067 ?auto_536068 ) ) ( not ( = ?auto_536067 ?auto_536069 ) ) ( not ( = ?auto_536067 ?auto_536070 ) ) ( not ( = ?auto_536067 ?auto_536071 ) ) ( not ( = ?auto_536067 ?auto_536072 ) ) ( not ( = ?auto_536067 ?auto_536073 ) ) ( not ( = ?auto_536067 ?auto_536074 ) ) ( not ( = ?auto_536067 ?auto_536075 ) ) ( not ( = ?auto_536068 ?auto_536069 ) ) ( not ( = ?auto_536068 ?auto_536070 ) ) ( not ( = ?auto_536068 ?auto_536071 ) ) ( not ( = ?auto_536068 ?auto_536072 ) ) ( not ( = ?auto_536068 ?auto_536073 ) ) ( not ( = ?auto_536068 ?auto_536074 ) ) ( not ( = ?auto_536068 ?auto_536075 ) ) ( not ( = ?auto_536069 ?auto_536070 ) ) ( not ( = ?auto_536069 ?auto_536071 ) ) ( not ( = ?auto_536069 ?auto_536072 ) ) ( not ( = ?auto_536069 ?auto_536073 ) ) ( not ( = ?auto_536069 ?auto_536074 ) ) ( not ( = ?auto_536069 ?auto_536075 ) ) ( not ( = ?auto_536070 ?auto_536071 ) ) ( not ( = ?auto_536070 ?auto_536072 ) ) ( not ( = ?auto_536070 ?auto_536073 ) ) ( not ( = ?auto_536070 ?auto_536074 ) ) ( not ( = ?auto_536070 ?auto_536075 ) ) ( not ( = ?auto_536071 ?auto_536072 ) ) ( not ( = ?auto_536071 ?auto_536073 ) ) ( not ( = ?auto_536071 ?auto_536074 ) ) ( not ( = ?auto_536071 ?auto_536075 ) ) ( not ( = ?auto_536072 ?auto_536073 ) ) ( not ( = ?auto_536072 ?auto_536074 ) ) ( not ( = ?auto_536072 ?auto_536075 ) ) ( not ( = ?auto_536073 ?auto_536074 ) ) ( not ( = ?auto_536073 ?auto_536075 ) ) ( not ( = ?auto_536074 ?auto_536075 ) ) ( ON ?auto_536073 ?auto_536074 ) ( ON ?auto_536072 ?auto_536073 ) ( ON ?auto_536071 ?auto_536072 ) ( ON ?auto_536070 ?auto_536071 ) ( ON ?auto_536069 ?auto_536070 ) ( ON ?auto_536068 ?auto_536069 ) ( ON ?auto_536067 ?auto_536068 ) ( ON ?auto_536066 ?auto_536067 ) ( ON ?auto_536065 ?auto_536066 ) ( ON ?auto_536064 ?auto_536065 ) ( CLEAR ?auto_536064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_536064 )
      ( MAKE-11PILE ?auto_536064 ?auto_536065 ?auto_536066 ?auto_536067 ?auto_536068 ?auto_536069 ?auto_536070 ?auto_536071 ?auto_536072 ?auto_536073 ?auto_536074 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536111 - BLOCK
      ?auto_536112 - BLOCK
      ?auto_536113 - BLOCK
      ?auto_536114 - BLOCK
      ?auto_536115 - BLOCK
      ?auto_536116 - BLOCK
      ?auto_536117 - BLOCK
      ?auto_536118 - BLOCK
      ?auto_536119 - BLOCK
      ?auto_536120 - BLOCK
      ?auto_536121 - BLOCK
      ?auto_536122 - BLOCK
    )
    :vars
    (
      ?auto_536123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_536121 ) ( ON ?auto_536122 ?auto_536123 ) ( CLEAR ?auto_536122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_536111 ) ( ON ?auto_536112 ?auto_536111 ) ( ON ?auto_536113 ?auto_536112 ) ( ON ?auto_536114 ?auto_536113 ) ( ON ?auto_536115 ?auto_536114 ) ( ON ?auto_536116 ?auto_536115 ) ( ON ?auto_536117 ?auto_536116 ) ( ON ?auto_536118 ?auto_536117 ) ( ON ?auto_536119 ?auto_536118 ) ( ON ?auto_536120 ?auto_536119 ) ( ON ?auto_536121 ?auto_536120 ) ( not ( = ?auto_536111 ?auto_536112 ) ) ( not ( = ?auto_536111 ?auto_536113 ) ) ( not ( = ?auto_536111 ?auto_536114 ) ) ( not ( = ?auto_536111 ?auto_536115 ) ) ( not ( = ?auto_536111 ?auto_536116 ) ) ( not ( = ?auto_536111 ?auto_536117 ) ) ( not ( = ?auto_536111 ?auto_536118 ) ) ( not ( = ?auto_536111 ?auto_536119 ) ) ( not ( = ?auto_536111 ?auto_536120 ) ) ( not ( = ?auto_536111 ?auto_536121 ) ) ( not ( = ?auto_536111 ?auto_536122 ) ) ( not ( = ?auto_536111 ?auto_536123 ) ) ( not ( = ?auto_536112 ?auto_536113 ) ) ( not ( = ?auto_536112 ?auto_536114 ) ) ( not ( = ?auto_536112 ?auto_536115 ) ) ( not ( = ?auto_536112 ?auto_536116 ) ) ( not ( = ?auto_536112 ?auto_536117 ) ) ( not ( = ?auto_536112 ?auto_536118 ) ) ( not ( = ?auto_536112 ?auto_536119 ) ) ( not ( = ?auto_536112 ?auto_536120 ) ) ( not ( = ?auto_536112 ?auto_536121 ) ) ( not ( = ?auto_536112 ?auto_536122 ) ) ( not ( = ?auto_536112 ?auto_536123 ) ) ( not ( = ?auto_536113 ?auto_536114 ) ) ( not ( = ?auto_536113 ?auto_536115 ) ) ( not ( = ?auto_536113 ?auto_536116 ) ) ( not ( = ?auto_536113 ?auto_536117 ) ) ( not ( = ?auto_536113 ?auto_536118 ) ) ( not ( = ?auto_536113 ?auto_536119 ) ) ( not ( = ?auto_536113 ?auto_536120 ) ) ( not ( = ?auto_536113 ?auto_536121 ) ) ( not ( = ?auto_536113 ?auto_536122 ) ) ( not ( = ?auto_536113 ?auto_536123 ) ) ( not ( = ?auto_536114 ?auto_536115 ) ) ( not ( = ?auto_536114 ?auto_536116 ) ) ( not ( = ?auto_536114 ?auto_536117 ) ) ( not ( = ?auto_536114 ?auto_536118 ) ) ( not ( = ?auto_536114 ?auto_536119 ) ) ( not ( = ?auto_536114 ?auto_536120 ) ) ( not ( = ?auto_536114 ?auto_536121 ) ) ( not ( = ?auto_536114 ?auto_536122 ) ) ( not ( = ?auto_536114 ?auto_536123 ) ) ( not ( = ?auto_536115 ?auto_536116 ) ) ( not ( = ?auto_536115 ?auto_536117 ) ) ( not ( = ?auto_536115 ?auto_536118 ) ) ( not ( = ?auto_536115 ?auto_536119 ) ) ( not ( = ?auto_536115 ?auto_536120 ) ) ( not ( = ?auto_536115 ?auto_536121 ) ) ( not ( = ?auto_536115 ?auto_536122 ) ) ( not ( = ?auto_536115 ?auto_536123 ) ) ( not ( = ?auto_536116 ?auto_536117 ) ) ( not ( = ?auto_536116 ?auto_536118 ) ) ( not ( = ?auto_536116 ?auto_536119 ) ) ( not ( = ?auto_536116 ?auto_536120 ) ) ( not ( = ?auto_536116 ?auto_536121 ) ) ( not ( = ?auto_536116 ?auto_536122 ) ) ( not ( = ?auto_536116 ?auto_536123 ) ) ( not ( = ?auto_536117 ?auto_536118 ) ) ( not ( = ?auto_536117 ?auto_536119 ) ) ( not ( = ?auto_536117 ?auto_536120 ) ) ( not ( = ?auto_536117 ?auto_536121 ) ) ( not ( = ?auto_536117 ?auto_536122 ) ) ( not ( = ?auto_536117 ?auto_536123 ) ) ( not ( = ?auto_536118 ?auto_536119 ) ) ( not ( = ?auto_536118 ?auto_536120 ) ) ( not ( = ?auto_536118 ?auto_536121 ) ) ( not ( = ?auto_536118 ?auto_536122 ) ) ( not ( = ?auto_536118 ?auto_536123 ) ) ( not ( = ?auto_536119 ?auto_536120 ) ) ( not ( = ?auto_536119 ?auto_536121 ) ) ( not ( = ?auto_536119 ?auto_536122 ) ) ( not ( = ?auto_536119 ?auto_536123 ) ) ( not ( = ?auto_536120 ?auto_536121 ) ) ( not ( = ?auto_536120 ?auto_536122 ) ) ( not ( = ?auto_536120 ?auto_536123 ) ) ( not ( = ?auto_536121 ?auto_536122 ) ) ( not ( = ?auto_536121 ?auto_536123 ) ) ( not ( = ?auto_536122 ?auto_536123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_536122 ?auto_536123 )
      ( !STACK ?auto_536122 ?auto_536121 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536161 - BLOCK
      ?auto_536162 - BLOCK
      ?auto_536163 - BLOCK
      ?auto_536164 - BLOCK
      ?auto_536165 - BLOCK
      ?auto_536166 - BLOCK
      ?auto_536167 - BLOCK
      ?auto_536168 - BLOCK
      ?auto_536169 - BLOCK
      ?auto_536170 - BLOCK
      ?auto_536171 - BLOCK
      ?auto_536172 - BLOCK
    )
    :vars
    (
      ?auto_536173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536172 ?auto_536173 ) ( ON-TABLE ?auto_536161 ) ( ON ?auto_536162 ?auto_536161 ) ( ON ?auto_536163 ?auto_536162 ) ( ON ?auto_536164 ?auto_536163 ) ( ON ?auto_536165 ?auto_536164 ) ( ON ?auto_536166 ?auto_536165 ) ( ON ?auto_536167 ?auto_536166 ) ( ON ?auto_536168 ?auto_536167 ) ( ON ?auto_536169 ?auto_536168 ) ( ON ?auto_536170 ?auto_536169 ) ( not ( = ?auto_536161 ?auto_536162 ) ) ( not ( = ?auto_536161 ?auto_536163 ) ) ( not ( = ?auto_536161 ?auto_536164 ) ) ( not ( = ?auto_536161 ?auto_536165 ) ) ( not ( = ?auto_536161 ?auto_536166 ) ) ( not ( = ?auto_536161 ?auto_536167 ) ) ( not ( = ?auto_536161 ?auto_536168 ) ) ( not ( = ?auto_536161 ?auto_536169 ) ) ( not ( = ?auto_536161 ?auto_536170 ) ) ( not ( = ?auto_536161 ?auto_536171 ) ) ( not ( = ?auto_536161 ?auto_536172 ) ) ( not ( = ?auto_536161 ?auto_536173 ) ) ( not ( = ?auto_536162 ?auto_536163 ) ) ( not ( = ?auto_536162 ?auto_536164 ) ) ( not ( = ?auto_536162 ?auto_536165 ) ) ( not ( = ?auto_536162 ?auto_536166 ) ) ( not ( = ?auto_536162 ?auto_536167 ) ) ( not ( = ?auto_536162 ?auto_536168 ) ) ( not ( = ?auto_536162 ?auto_536169 ) ) ( not ( = ?auto_536162 ?auto_536170 ) ) ( not ( = ?auto_536162 ?auto_536171 ) ) ( not ( = ?auto_536162 ?auto_536172 ) ) ( not ( = ?auto_536162 ?auto_536173 ) ) ( not ( = ?auto_536163 ?auto_536164 ) ) ( not ( = ?auto_536163 ?auto_536165 ) ) ( not ( = ?auto_536163 ?auto_536166 ) ) ( not ( = ?auto_536163 ?auto_536167 ) ) ( not ( = ?auto_536163 ?auto_536168 ) ) ( not ( = ?auto_536163 ?auto_536169 ) ) ( not ( = ?auto_536163 ?auto_536170 ) ) ( not ( = ?auto_536163 ?auto_536171 ) ) ( not ( = ?auto_536163 ?auto_536172 ) ) ( not ( = ?auto_536163 ?auto_536173 ) ) ( not ( = ?auto_536164 ?auto_536165 ) ) ( not ( = ?auto_536164 ?auto_536166 ) ) ( not ( = ?auto_536164 ?auto_536167 ) ) ( not ( = ?auto_536164 ?auto_536168 ) ) ( not ( = ?auto_536164 ?auto_536169 ) ) ( not ( = ?auto_536164 ?auto_536170 ) ) ( not ( = ?auto_536164 ?auto_536171 ) ) ( not ( = ?auto_536164 ?auto_536172 ) ) ( not ( = ?auto_536164 ?auto_536173 ) ) ( not ( = ?auto_536165 ?auto_536166 ) ) ( not ( = ?auto_536165 ?auto_536167 ) ) ( not ( = ?auto_536165 ?auto_536168 ) ) ( not ( = ?auto_536165 ?auto_536169 ) ) ( not ( = ?auto_536165 ?auto_536170 ) ) ( not ( = ?auto_536165 ?auto_536171 ) ) ( not ( = ?auto_536165 ?auto_536172 ) ) ( not ( = ?auto_536165 ?auto_536173 ) ) ( not ( = ?auto_536166 ?auto_536167 ) ) ( not ( = ?auto_536166 ?auto_536168 ) ) ( not ( = ?auto_536166 ?auto_536169 ) ) ( not ( = ?auto_536166 ?auto_536170 ) ) ( not ( = ?auto_536166 ?auto_536171 ) ) ( not ( = ?auto_536166 ?auto_536172 ) ) ( not ( = ?auto_536166 ?auto_536173 ) ) ( not ( = ?auto_536167 ?auto_536168 ) ) ( not ( = ?auto_536167 ?auto_536169 ) ) ( not ( = ?auto_536167 ?auto_536170 ) ) ( not ( = ?auto_536167 ?auto_536171 ) ) ( not ( = ?auto_536167 ?auto_536172 ) ) ( not ( = ?auto_536167 ?auto_536173 ) ) ( not ( = ?auto_536168 ?auto_536169 ) ) ( not ( = ?auto_536168 ?auto_536170 ) ) ( not ( = ?auto_536168 ?auto_536171 ) ) ( not ( = ?auto_536168 ?auto_536172 ) ) ( not ( = ?auto_536168 ?auto_536173 ) ) ( not ( = ?auto_536169 ?auto_536170 ) ) ( not ( = ?auto_536169 ?auto_536171 ) ) ( not ( = ?auto_536169 ?auto_536172 ) ) ( not ( = ?auto_536169 ?auto_536173 ) ) ( not ( = ?auto_536170 ?auto_536171 ) ) ( not ( = ?auto_536170 ?auto_536172 ) ) ( not ( = ?auto_536170 ?auto_536173 ) ) ( not ( = ?auto_536171 ?auto_536172 ) ) ( not ( = ?auto_536171 ?auto_536173 ) ) ( not ( = ?auto_536172 ?auto_536173 ) ) ( CLEAR ?auto_536170 ) ( ON ?auto_536171 ?auto_536172 ) ( CLEAR ?auto_536171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_536161 ?auto_536162 ?auto_536163 ?auto_536164 ?auto_536165 ?auto_536166 ?auto_536167 ?auto_536168 ?auto_536169 ?auto_536170 ?auto_536171 )
      ( MAKE-12PILE ?auto_536161 ?auto_536162 ?auto_536163 ?auto_536164 ?auto_536165 ?auto_536166 ?auto_536167 ?auto_536168 ?auto_536169 ?auto_536170 ?auto_536171 ?auto_536172 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536211 - BLOCK
      ?auto_536212 - BLOCK
      ?auto_536213 - BLOCK
      ?auto_536214 - BLOCK
      ?auto_536215 - BLOCK
      ?auto_536216 - BLOCK
      ?auto_536217 - BLOCK
      ?auto_536218 - BLOCK
      ?auto_536219 - BLOCK
      ?auto_536220 - BLOCK
      ?auto_536221 - BLOCK
      ?auto_536222 - BLOCK
    )
    :vars
    (
      ?auto_536223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536222 ?auto_536223 ) ( ON-TABLE ?auto_536211 ) ( ON ?auto_536212 ?auto_536211 ) ( ON ?auto_536213 ?auto_536212 ) ( ON ?auto_536214 ?auto_536213 ) ( ON ?auto_536215 ?auto_536214 ) ( ON ?auto_536216 ?auto_536215 ) ( ON ?auto_536217 ?auto_536216 ) ( ON ?auto_536218 ?auto_536217 ) ( ON ?auto_536219 ?auto_536218 ) ( not ( = ?auto_536211 ?auto_536212 ) ) ( not ( = ?auto_536211 ?auto_536213 ) ) ( not ( = ?auto_536211 ?auto_536214 ) ) ( not ( = ?auto_536211 ?auto_536215 ) ) ( not ( = ?auto_536211 ?auto_536216 ) ) ( not ( = ?auto_536211 ?auto_536217 ) ) ( not ( = ?auto_536211 ?auto_536218 ) ) ( not ( = ?auto_536211 ?auto_536219 ) ) ( not ( = ?auto_536211 ?auto_536220 ) ) ( not ( = ?auto_536211 ?auto_536221 ) ) ( not ( = ?auto_536211 ?auto_536222 ) ) ( not ( = ?auto_536211 ?auto_536223 ) ) ( not ( = ?auto_536212 ?auto_536213 ) ) ( not ( = ?auto_536212 ?auto_536214 ) ) ( not ( = ?auto_536212 ?auto_536215 ) ) ( not ( = ?auto_536212 ?auto_536216 ) ) ( not ( = ?auto_536212 ?auto_536217 ) ) ( not ( = ?auto_536212 ?auto_536218 ) ) ( not ( = ?auto_536212 ?auto_536219 ) ) ( not ( = ?auto_536212 ?auto_536220 ) ) ( not ( = ?auto_536212 ?auto_536221 ) ) ( not ( = ?auto_536212 ?auto_536222 ) ) ( not ( = ?auto_536212 ?auto_536223 ) ) ( not ( = ?auto_536213 ?auto_536214 ) ) ( not ( = ?auto_536213 ?auto_536215 ) ) ( not ( = ?auto_536213 ?auto_536216 ) ) ( not ( = ?auto_536213 ?auto_536217 ) ) ( not ( = ?auto_536213 ?auto_536218 ) ) ( not ( = ?auto_536213 ?auto_536219 ) ) ( not ( = ?auto_536213 ?auto_536220 ) ) ( not ( = ?auto_536213 ?auto_536221 ) ) ( not ( = ?auto_536213 ?auto_536222 ) ) ( not ( = ?auto_536213 ?auto_536223 ) ) ( not ( = ?auto_536214 ?auto_536215 ) ) ( not ( = ?auto_536214 ?auto_536216 ) ) ( not ( = ?auto_536214 ?auto_536217 ) ) ( not ( = ?auto_536214 ?auto_536218 ) ) ( not ( = ?auto_536214 ?auto_536219 ) ) ( not ( = ?auto_536214 ?auto_536220 ) ) ( not ( = ?auto_536214 ?auto_536221 ) ) ( not ( = ?auto_536214 ?auto_536222 ) ) ( not ( = ?auto_536214 ?auto_536223 ) ) ( not ( = ?auto_536215 ?auto_536216 ) ) ( not ( = ?auto_536215 ?auto_536217 ) ) ( not ( = ?auto_536215 ?auto_536218 ) ) ( not ( = ?auto_536215 ?auto_536219 ) ) ( not ( = ?auto_536215 ?auto_536220 ) ) ( not ( = ?auto_536215 ?auto_536221 ) ) ( not ( = ?auto_536215 ?auto_536222 ) ) ( not ( = ?auto_536215 ?auto_536223 ) ) ( not ( = ?auto_536216 ?auto_536217 ) ) ( not ( = ?auto_536216 ?auto_536218 ) ) ( not ( = ?auto_536216 ?auto_536219 ) ) ( not ( = ?auto_536216 ?auto_536220 ) ) ( not ( = ?auto_536216 ?auto_536221 ) ) ( not ( = ?auto_536216 ?auto_536222 ) ) ( not ( = ?auto_536216 ?auto_536223 ) ) ( not ( = ?auto_536217 ?auto_536218 ) ) ( not ( = ?auto_536217 ?auto_536219 ) ) ( not ( = ?auto_536217 ?auto_536220 ) ) ( not ( = ?auto_536217 ?auto_536221 ) ) ( not ( = ?auto_536217 ?auto_536222 ) ) ( not ( = ?auto_536217 ?auto_536223 ) ) ( not ( = ?auto_536218 ?auto_536219 ) ) ( not ( = ?auto_536218 ?auto_536220 ) ) ( not ( = ?auto_536218 ?auto_536221 ) ) ( not ( = ?auto_536218 ?auto_536222 ) ) ( not ( = ?auto_536218 ?auto_536223 ) ) ( not ( = ?auto_536219 ?auto_536220 ) ) ( not ( = ?auto_536219 ?auto_536221 ) ) ( not ( = ?auto_536219 ?auto_536222 ) ) ( not ( = ?auto_536219 ?auto_536223 ) ) ( not ( = ?auto_536220 ?auto_536221 ) ) ( not ( = ?auto_536220 ?auto_536222 ) ) ( not ( = ?auto_536220 ?auto_536223 ) ) ( not ( = ?auto_536221 ?auto_536222 ) ) ( not ( = ?auto_536221 ?auto_536223 ) ) ( not ( = ?auto_536222 ?auto_536223 ) ) ( ON ?auto_536221 ?auto_536222 ) ( CLEAR ?auto_536219 ) ( ON ?auto_536220 ?auto_536221 ) ( CLEAR ?auto_536220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_536211 ?auto_536212 ?auto_536213 ?auto_536214 ?auto_536215 ?auto_536216 ?auto_536217 ?auto_536218 ?auto_536219 ?auto_536220 )
      ( MAKE-12PILE ?auto_536211 ?auto_536212 ?auto_536213 ?auto_536214 ?auto_536215 ?auto_536216 ?auto_536217 ?auto_536218 ?auto_536219 ?auto_536220 ?auto_536221 ?auto_536222 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536261 - BLOCK
      ?auto_536262 - BLOCK
      ?auto_536263 - BLOCK
      ?auto_536264 - BLOCK
      ?auto_536265 - BLOCK
      ?auto_536266 - BLOCK
      ?auto_536267 - BLOCK
      ?auto_536268 - BLOCK
      ?auto_536269 - BLOCK
      ?auto_536270 - BLOCK
      ?auto_536271 - BLOCK
      ?auto_536272 - BLOCK
    )
    :vars
    (
      ?auto_536273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536272 ?auto_536273 ) ( ON-TABLE ?auto_536261 ) ( ON ?auto_536262 ?auto_536261 ) ( ON ?auto_536263 ?auto_536262 ) ( ON ?auto_536264 ?auto_536263 ) ( ON ?auto_536265 ?auto_536264 ) ( ON ?auto_536266 ?auto_536265 ) ( ON ?auto_536267 ?auto_536266 ) ( ON ?auto_536268 ?auto_536267 ) ( not ( = ?auto_536261 ?auto_536262 ) ) ( not ( = ?auto_536261 ?auto_536263 ) ) ( not ( = ?auto_536261 ?auto_536264 ) ) ( not ( = ?auto_536261 ?auto_536265 ) ) ( not ( = ?auto_536261 ?auto_536266 ) ) ( not ( = ?auto_536261 ?auto_536267 ) ) ( not ( = ?auto_536261 ?auto_536268 ) ) ( not ( = ?auto_536261 ?auto_536269 ) ) ( not ( = ?auto_536261 ?auto_536270 ) ) ( not ( = ?auto_536261 ?auto_536271 ) ) ( not ( = ?auto_536261 ?auto_536272 ) ) ( not ( = ?auto_536261 ?auto_536273 ) ) ( not ( = ?auto_536262 ?auto_536263 ) ) ( not ( = ?auto_536262 ?auto_536264 ) ) ( not ( = ?auto_536262 ?auto_536265 ) ) ( not ( = ?auto_536262 ?auto_536266 ) ) ( not ( = ?auto_536262 ?auto_536267 ) ) ( not ( = ?auto_536262 ?auto_536268 ) ) ( not ( = ?auto_536262 ?auto_536269 ) ) ( not ( = ?auto_536262 ?auto_536270 ) ) ( not ( = ?auto_536262 ?auto_536271 ) ) ( not ( = ?auto_536262 ?auto_536272 ) ) ( not ( = ?auto_536262 ?auto_536273 ) ) ( not ( = ?auto_536263 ?auto_536264 ) ) ( not ( = ?auto_536263 ?auto_536265 ) ) ( not ( = ?auto_536263 ?auto_536266 ) ) ( not ( = ?auto_536263 ?auto_536267 ) ) ( not ( = ?auto_536263 ?auto_536268 ) ) ( not ( = ?auto_536263 ?auto_536269 ) ) ( not ( = ?auto_536263 ?auto_536270 ) ) ( not ( = ?auto_536263 ?auto_536271 ) ) ( not ( = ?auto_536263 ?auto_536272 ) ) ( not ( = ?auto_536263 ?auto_536273 ) ) ( not ( = ?auto_536264 ?auto_536265 ) ) ( not ( = ?auto_536264 ?auto_536266 ) ) ( not ( = ?auto_536264 ?auto_536267 ) ) ( not ( = ?auto_536264 ?auto_536268 ) ) ( not ( = ?auto_536264 ?auto_536269 ) ) ( not ( = ?auto_536264 ?auto_536270 ) ) ( not ( = ?auto_536264 ?auto_536271 ) ) ( not ( = ?auto_536264 ?auto_536272 ) ) ( not ( = ?auto_536264 ?auto_536273 ) ) ( not ( = ?auto_536265 ?auto_536266 ) ) ( not ( = ?auto_536265 ?auto_536267 ) ) ( not ( = ?auto_536265 ?auto_536268 ) ) ( not ( = ?auto_536265 ?auto_536269 ) ) ( not ( = ?auto_536265 ?auto_536270 ) ) ( not ( = ?auto_536265 ?auto_536271 ) ) ( not ( = ?auto_536265 ?auto_536272 ) ) ( not ( = ?auto_536265 ?auto_536273 ) ) ( not ( = ?auto_536266 ?auto_536267 ) ) ( not ( = ?auto_536266 ?auto_536268 ) ) ( not ( = ?auto_536266 ?auto_536269 ) ) ( not ( = ?auto_536266 ?auto_536270 ) ) ( not ( = ?auto_536266 ?auto_536271 ) ) ( not ( = ?auto_536266 ?auto_536272 ) ) ( not ( = ?auto_536266 ?auto_536273 ) ) ( not ( = ?auto_536267 ?auto_536268 ) ) ( not ( = ?auto_536267 ?auto_536269 ) ) ( not ( = ?auto_536267 ?auto_536270 ) ) ( not ( = ?auto_536267 ?auto_536271 ) ) ( not ( = ?auto_536267 ?auto_536272 ) ) ( not ( = ?auto_536267 ?auto_536273 ) ) ( not ( = ?auto_536268 ?auto_536269 ) ) ( not ( = ?auto_536268 ?auto_536270 ) ) ( not ( = ?auto_536268 ?auto_536271 ) ) ( not ( = ?auto_536268 ?auto_536272 ) ) ( not ( = ?auto_536268 ?auto_536273 ) ) ( not ( = ?auto_536269 ?auto_536270 ) ) ( not ( = ?auto_536269 ?auto_536271 ) ) ( not ( = ?auto_536269 ?auto_536272 ) ) ( not ( = ?auto_536269 ?auto_536273 ) ) ( not ( = ?auto_536270 ?auto_536271 ) ) ( not ( = ?auto_536270 ?auto_536272 ) ) ( not ( = ?auto_536270 ?auto_536273 ) ) ( not ( = ?auto_536271 ?auto_536272 ) ) ( not ( = ?auto_536271 ?auto_536273 ) ) ( not ( = ?auto_536272 ?auto_536273 ) ) ( ON ?auto_536271 ?auto_536272 ) ( ON ?auto_536270 ?auto_536271 ) ( CLEAR ?auto_536268 ) ( ON ?auto_536269 ?auto_536270 ) ( CLEAR ?auto_536269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_536261 ?auto_536262 ?auto_536263 ?auto_536264 ?auto_536265 ?auto_536266 ?auto_536267 ?auto_536268 ?auto_536269 )
      ( MAKE-12PILE ?auto_536261 ?auto_536262 ?auto_536263 ?auto_536264 ?auto_536265 ?auto_536266 ?auto_536267 ?auto_536268 ?auto_536269 ?auto_536270 ?auto_536271 ?auto_536272 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536311 - BLOCK
      ?auto_536312 - BLOCK
      ?auto_536313 - BLOCK
      ?auto_536314 - BLOCK
      ?auto_536315 - BLOCK
      ?auto_536316 - BLOCK
      ?auto_536317 - BLOCK
      ?auto_536318 - BLOCK
      ?auto_536319 - BLOCK
      ?auto_536320 - BLOCK
      ?auto_536321 - BLOCK
      ?auto_536322 - BLOCK
    )
    :vars
    (
      ?auto_536323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536322 ?auto_536323 ) ( ON-TABLE ?auto_536311 ) ( ON ?auto_536312 ?auto_536311 ) ( ON ?auto_536313 ?auto_536312 ) ( ON ?auto_536314 ?auto_536313 ) ( ON ?auto_536315 ?auto_536314 ) ( ON ?auto_536316 ?auto_536315 ) ( ON ?auto_536317 ?auto_536316 ) ( not ( = ?auto_536311 ?auto_536312 ) ) ( not ( = ?auto_536311 ?auto_536313 ) ) ( not ( = ?auto_536311 ?auto_536314 ) ) ( not ( = ?auto_536311 ?auto_536315 ) ) ( not ( = ?auto_536311 ?auto_536316 ) ) ( not ( = ?auto_536311 ?auto_536317 ) ) ( not ( = ?auto_536311 ?auto_536318 ) ) ( not ( = ?auto_536311 ?auto_536319 ) ) ( not ( = ?auto_536311 ?auto_536320 ) ) ( not ( = ?auto_536311 ?auto_536321 ) ) ( not ( = ?auto_536311 ?auto_536322 ) ) ( not ( = ?auto_536311 ?auto_536323 ) ) ( not ( = ?auto_536312 ?auto_536313 ) ) ( not ( = ?auto_536312 ?auto_536314 ) ) ( not ( = ?auto_536312 ?auto_536315 ) ) ( not ( = ?auto_536312 ?auto_536316 ) ) ( not ( = ?auto_536312 ?auto_536317 ) ) ( not ( = ?auto_536312 ?auto_536318 ) ) ( not ( = ?auto_536312 ?auto_536319 ) ) ( not ( = ?auto_536312 ?auto_536320 ) ) ( not ( = ?auto_536312 ?auto_536321 ) ) ( not ( = ?auto_536312 ?auto_536322 ) ) ( not ( = ?auto_536312 ?auto_536323 ) ) ( not ( = ?auto_536313 ?auto_536314 ) ) ( not ( = ?auto_536313 ?auto_536315 ) ) ( not ( = ?auto_536313 ?auto_536316 ) ) ( not ( = ?auto_536313 ?auto_536317 ) ) ( not ( = ?auto_536313 ?auto_536318 ) ) ( not ( = ?auto_536313 ?auto_536319 ) ) ( not ( = ?auto_536313 ?auto_536320 ) ) ( not ( = ?auto_536313 ?auto_536321 ) ) ( not ( = ?auto_536313 ?auto_536322 ) ) ( not ( = ?auto_536313 ?auto_536323 ) ) ( not ( = ?auto_536314 ?auto_536315 ) ) ( not ( = ?auto_536314 ?auto_536316 ) ) ( not ( = ?auto_536314 ?auto_536317 ) ) ( not ( = ?auto_536314 ?auto_536318 ) ) ( not ( = ?auto_536314 ?auto_536319 ) ) ( not ( = ?auto_536314 ?auto_536320 ) ) ( not ( = ?auto_536314 ?auto_536321 ) ) ( not ( = ?auto_536314 ?auto_536322 ) ) ( not ( = ?auto_536314 ?auto_536323 ) ) ( not ( = ?auto_536315 ?auto_536316 ) ) ( not ( = ?auto_536315 ?auto_536317 ) ) ( not ( = ?auto_536315 ?auto_536318 ) ) ( not ( = ?auto_536315 ?auto_536319 ) ) ( not ( = ?auto_536315 ?auto_536320 ) ) ( not ( = ?auto_536315 ?auto_536321 ) ) ( not ( = ?auto_536315 ?auto_536322 ) ) ( not ( = ?auto_536315 ?auto_536323 ) ) ( not ( = ?auto_536316 ?auto_536317 ) ) ( not ( = ?auto_536316 ?auto_536318 ) ) ( not ( = ?auto_536316 ?auto_536319 ) ) ( not ( = ?auto_536316 ?auto_536320 ) ) ( not ( = ?auto_536316 ?auto_536321 ) ) ( not ( = ?auto_536316 ?auto_536322 ) ) ( not ( = ?auto_536316 ?auto_536323 ) ) ( not ( = ?auto_536317 ?auto_536318 ) ) ( not ( = ?auto_536317 ?auto_536319 ) ) ( not ( = ?auto_536317 ?auto_536320 ) ) ( not ( = ?auto_536317 ?auto_536321 ) ) ( not ( = ?auto_536317 ?auto_536322 ) ) ( not ( = ?auto_536317 ?auto_536323 ) ) ( not ( = ?auto_536318 ?auto_536319 ) ) ( not ( = ?auto_536318 ?auto_536320 ) ) ( not ( = ?auto_536318 ?auto_536321 ) ) ( not ( = ?auto_536318 ?auto_536322 ) ) ( not ( = ?auto_536318 ?auto_536323 ) ) ( not ( = ?auto_536319 ?auto_536320 ) ) ( not ( = ?auto_536319 ?auto_536321 ) ) ( not ( = ?auto_536319 ?auto_536322 ) ) ( not ( = ?auto_536319 ?auto_536323 ) ) ( not ( = ?auto_536320 ?auto_536321 ) ) ( not ( = ?auto_536320 ?auto_536322 ) ) ( not ( = ?auto_536320 ?auto_536323 ) ) ( not ( = ?auto_536321 ?auto_536322 ) ) ( not ( = ?auto_536321 ?auto_536323 ) ) ( not ( = ?auto_536322 ?auto_536323 ) ) ( ON ?auto_536321 ?auto_536322 ) ( ON ?auto_536320 ?auto_536321 ) ( ON ?auto_536319 ?auto_536320 ) ( CLEAR ?auto_536317 ) ( ON ?auto_536318 ?auto_536319 ) ( CLEAR ?auto_536318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_536311 ?auto_536312 ?auto_536313 ?auto_536314 ?auto_536315 ?auto_536316 ?auto_536317 ?auto_536318 )
      ( MAKE-12PILE ?auto_536311 ?auto_536312 ?auto_536313 ?auto_536314 ?auto_536315 ?auto_536316 ?auto_536317 ?auto_536318 ?auto_536319 ?auto_536320 ?auto_536321 ?auto_536322 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536361 - BLOCK
      ?auto_536362 - BLOCK
      ?auto_536363 - BLOCK
      ?auto_536364 - BLOCK
      ?auto_536365 - BLOCK
      ?auto_536366 - BLOCK
      ?auto_536367 - BLOCK
      ?auto_536368 - BLOCK
      ?auto_536369 - BLOCK
      ?auto_536370 - BLOCK
      ?auto_536371 - BLOCK
      ?auto_536372 - BLOCK
    )
    :vars
    (
      ?auto_536373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536372 ?auto_536373 ) ( ON-TABLE ?auto_536361 ) ( ON ?auto_536362 ?auto_536361 ) ( ON ?auto_536363 ?auto_536362 ) ( ON ?auto_536364 ?auto_536363 ) ( ON ?auto_536365 ?auto_536364 ) ( ON ?auto_536366 ?auto_536365 ) ( not ( = ?auto_536361 ?auto_536362 ) ) ( not ( = ?auto_536361 ?auto_536363 ) ) ( not ( = ?auto_536361 ?auto_536364 ) ) ( not ( = ?auto_536361 ?auto_536365 ) ) ( not ( = ?auto_536361 ?auto_536366 ) ) ( not ( = ?auto_536361 ?auto_536367 ) ) ( not ( = ?auto_536361 ?auto_536368 ) ) ( not ( = ?auto_536361 ?auto_536369 ) ) ( not ( = ?auto_536361 ?auto_536370 ) ) ( not ( = ?auto_536361 ?auto_536371 ) ) ( not ( = ?auto_536361 ?auto_536372 ) ) ( not ( = ?auto_536361 ?auto_536373 ) ) ( not ( = ?auto_536362 ?auto_536363 ) ) ( not ( = ?auto_536362 ?auto_536364 ) ) ( not ( = ?auto_536362 ?auto_536365 ) ) ( not ( = ?auto_536362 ?auto_536366 ) ) ( not ( = ?auto_536362 ?auto_536367 ) ) ( not ( = ?auto_536362 ?auto_536368 ) ) ( not ( = ?auto_536362 ?auto_536369 ) ) ( not ( = ?auto_536362 ?auto_536370 ) ) ( not ( = ?auto_536362 ?auto_536371 ) ) ( not ( = ?auto_536362 ?auto_536372 ) ) ( not ( = ?auto_536362 ?auto_536373 ) ) ( not ( = ?auto_536363 ?auto_536364 ) ) ( not ( = ?auto_536363 ?auto_536365 ) ) ( not ( = ?auto_536363 ?auto_536366 ) ) ( not ( = ?auto_536363 ?auto_536367 ) ) ( not ( = ?auto_536363 ?auto_536368 ) ) ( not ( = ?auto_536363 ?auto_536369 ) ) ( not ( = ?auto_536363 ?auto_536370 ) ) ( not ( = ?auto_536363 ?auto_536371 ) ) ( not ( = ?auto_536363 ?auto_536372 ) ) ( not ( = ?auto_536363 ?auto_536373 ) ) ( not ( = ?auto_536364 ?auto_536365 ) ) ( not ( = ?auto_536364 ?auto_536366 ) ) ( not ( = ?auto_536364 ?auto_536367 ) ) ( not ( = ?auto_536364 ?auto_536368 ) ) ( not ( = ?auto_536364 ?auto_536369 ) ) ( not ( = ?auto_536364 ?auto_536370 ) ) ( not ( = ?auto_536364 ?auto_536371 ) ) ( not ( = ?auto_536364 ?auto_536372 ) ) ( not ( = ?auto_536364 ?auto_536373 ) ) ( not ( = ?auto_536365 ?auto_536366 ) ) ( not ( = ?auto_536365 ?auto_536367 ) ) ( not ( = ?auto_536365 ?auto_536368 ) ) ( not ( = ?auto_536365 ?auto_536369 ) ) ( not ( = ?auto_536365 ?auto_536370 ) ) ( not ( = ?auto_536365 ?auto_536371 ) ) ( not ( = ?auto_536365 ?auto_536372 ) ) ( not ( = ?auto_536365 ?auto_536373 ) ) ( not ( = ?auto_536366 ?auto_536367 ) ) ( not ( = ?auto_536366 ?auto_536368 ) ) ( not ( = ?auto_536366 ?auto_536369 ) ) ( not ( = ?auto_536366 ?auto_536370 ) ) ( not ( = ?auto_536366 ?auto_536371 ) ) ( not ( = ?auto_536366 ?auto_536372 ) ) ( not ( = ?auto_536366 ?auto_536373 ) ) ( not ( = ?auto_536367 ?auto_536368 ) ) ( not ( = ?auto_536367 ?auto_536369 ) ) ( not ( = ?auto_536367 ?auto_536370 ) ) ( not ( = ?auto_536367 ?auto_536371 ) ) ( not ( = ?auto_536367 ?auto_536372 ) ) ( not ( = ?auto_536367 ?auto_536373 ) ) ( not ( = ?auto_536368 ?auto_536369 ) ) ( not ( = ?auto_536368 ?auto_536370 ) ) ( not ( = ?auto_536368 ?auto_536371 ) ) ( not ( = ?auto_536368 ?auto_536372 ) ) ( not ( = ?auto_536368 ?auto_536373 ) ) ( not ( = ?auto_536369 ?auto_536370 ) ) ( not ( = ?auto_536369 ?auto_536371 ) ) ( not ( = ?auto_536369 ?auto_536372 ) ) ( not ( = ?auto_536369 ?auto_536373 ) ) ( not ( = ?auto_536370 ?auto_536371 ) ) ( not ( = ?auto_536370 ?auto_536372 ) ) ( not ( = ?auto_536370 ?auto_536373 ) ) ( not ( = ?auto_536371 ?auto_536372 ) ) ( not ( = ?auto_536371 ?auto_536373 ) ) ( not ( = ?auto_536372 ?auto_536373 ) ) ( ON ?auto_536371 ?auto_536372 ) ( ON ?auto_536370 ?auto_536371 ) ( ON ?auto_536369 ?auto_536370 ) ( ON ?auto_536368 ?auto_536369 ) ( CLEAR ?auto_536366 ) ( ON ?auto_536367 ?auto_536368 ) ( CLEAR ?auto_536367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_536361 ?auto_536362 ?auto_536363 ?auto_536364 ?auto_536365 ?auto_536366 ?auto_536367 )
      ( MAKE-12PILE ?auto_536361 ?auto_536362 ?auto_536363 ?auto_536364 ?auto_536365 ?auto_536366 ?auto_536367 ?auto_536368 ?auto_536369 ?auto_536370 ?auto_536371 ?auto_536372 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536411 - BLOCK
      ?auto_536412 - BLOCK
      ?auto_536413 - BLOCK
      ?auto_536414 - BLOCK
      ?auto_536415 - BLOCK
      ?auto_536416 - BLOCK
      ?auto_536417 - BLOCK
      ?auto_536418 - BLOCK
      ?auto_536419 - BLOCK
      ?auto_536420 - BLOCK
      ?auto_536421 - BLOCK
      ?auto_536422 - BLOCK
    )
    :vars
    (
      ?auto_536423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536422 ?auto_536423 ) ( ON-TABLE ?auto_536411 ) ( ON ?auto_536412 ?auto_536411 ) ( ON ?auto_536413 ?auto_536412 ) ( ON ?auto_536414 ?auto_536413 ) ( ON ?auto_536415 ?auto_536414 ) ( not ( = ?auto_536411 ?auto_536412 ) ) ( not ( = ?auto_536411 ?auto_536413 ) ) ( not ( = ?auto_536411 ?auto_536414 ) ) ( not ( = ?auto_536411 ?auto_536415 ) ) ( not ( = ?auto_536411 ?auto_536416 ) ) ( not ( = ?auto_536411 ?auto_536417 ) ) ( not ( = ?auto_536411 ?auto_536418 ) ) ( not ( = ?auto_536411 ?auto_536419 ) ) ( not ( = ?auto_536411 ?auto_536420 ) ) ( not ( = ?auto_536411 ?auto_536421 ) ) ( not ( = ?auto_536411 ?auto_536422 ) ) ( not ( = ?auto_536411 ?auto_536423 ) ) ( not ( = ?auto_536412 ?auto_536413 ) ) ( not ( = ?auto_536412 ?auto_536414 ) ) ( not ( = ?auto_536412 ?auto_536415 ) ) ( not ( = ?auto_536412 ?auto_536416 ) ) ( not ( = ?auto_536412 ?auto_536417 ) ) ( not ( = ?auto_536412 ?auto_536418 ) ) ( not ( = ?auto_536412 ?auto_536419 ) ) ( not ( = ?auto_536412 ?auto_536420 ) ) ( not ( = ?auto_536412 ?auto_536421 ) ) ( not ( = ?auto_536412 ?auto_536422 ) ) ( not ( = ?auto_536412 ?auto_536423 ) ) ( not ( = ?auto_536413 ?auto_536414 ) ) ( not ( = ?auto_536413 ?auto_536415 ) ) ( not ( = ?auto_536413 ?auto_536416 ) ) ( not ( = ?auto_536413 ?auto_536417 ) ) ( not ( = ?auto_536413 ?auto_536418 ) ) ( not ( = ?auto_536413 ?auto_536419 ) ) ( not ( = ?auto_536413 ?auto_536420 ) ) ( not ( = ?auto_536413 ?auto_536421 ) ) ( not ( = ?auto_536413 ?auto_536422 ) ) ( not ( = ?auto_536413 ?auto_536423 ) ) ( not ( = ?auto_536414 ?auto_536415 ) ) ( not ( = ?auto_536414 ?auto_536416 ) ) ( not ( = ?auto_536414 ?auto_536417 ) ) ( not ( = ?auto_536414 ?auto_536418 ) ) ( not ( = ?auto_536414 ?auto_536419 ) ) ( not ( = ?auto_536414 ?auto_536420 ) ) ( not ( = ?auto_536414 ?auto_536421 ) ) ( not ( = ?auto_536414 ?auto_536422 ) ) ( not ( = ?auto_536414 ?auto_536423 ) ) ( not ( = ?auto_536415 ?auto_536416 ) ) ( not ( = ?auto_536415 ?auto_536417 ) ) ( not ( = ?auto_536415 ?auto_536418 ) ) ( not ( = ?auto_536415 ?auto_536419 ) ) ( not ( = ?auto_536415 ?auto_536420 ) ) ( not ( = ?auto_536415 ?auto_536421 ) ) ( not ( = ?auto_536415 ?auto_536422 ) ) ( not ( = ?auto_536415 ?auto_536423 ) ) ( not ( = ?auto_536416 ?auto_536417 ) ) ( not ( = ?auto_536416 ?auto_536418 ) ) ( not ( = ?auto_536416 ?auto_536419 ) ) ( not ( = ?auto_536416 ?auto_536420 ) ) ( not ( = ?auto_536416 ?auto_536421 ) ) ( not ( = ?auto_536416 ?auto_536422 ) ) ( not ( = ?auto_536416 ?auto_536423 ) ) ( not ( = ?auto_536417 ?auto_536418 ) ) ( not ( = ?auto_536417 ?auto_536419 ) ) ( not ( = ?auto_536417 ?auto_536420 ) ) ( not ( = ?auto_536417 ?auto_536421 ) ) ( not ( = ?auto_536417 ?auto_536422 ) ) ( not ( = ?auto_536417 ?auto_536423 ) ) ( not ( = ?auto_536418 ?auto_536419 ) ) ( not ( = ?auto_536418 ?auto_536420 ) ) ( not ( = ?auto_536418 ?auto_536421 ) ) ( not ( = ?auto_536418 ?auto_536422 ) ) ( not ( = ?auto_536418 ?auto_536423 ) ) ( not ( = ?auto_536419 ?auto_536420 ) ) ( not ( = ?auto_536419 ?auto_536421 ) ) ( not ( = ?auto_536419 ?auto_536422 ) ) ( not ( = ?auto_536419 ?auto_536423 ) ) ( not ( = ?auto_536420 ?auto_536421 ) ) ( not ( = ?auto_536420 ?auto_536422 ) ) ( not ( = ?auto_536420 ?auto_536423 ) ) ( not ( = ?auto_536421 ?auto_536422 ) ) ( not ( = ?auto_536421 ?auto_536423 ) ) ( not ( = ?auto_536422 ?auto_536423 ) ) ( ON ?auto_536421 ?auto_536422 ) ( ON ?auto_536420 ?auto_536421 ) ( ON ?auto_536419 ?auto_536420 ) ( ON ?auto_536418 ?auto_536419 ) ( ON ?auto_536417 ?auto_536418 ) ( CLEAR ?auto_536415 ) ( ON ?auto_536416 ?auto_536417 ) ( CLEAR ?auto_536416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_536411 ?auto_536412 ?auto_536413 ?auto_536414 ?auto_536415 ?auto_536416 )
      ( MAKE-12PILE ?auto_536411 ?auto_536412 ?auto_536413 ?auto_536414 ?auto_536415 ?auto_536416 ?auto_536417 ?auto_536418 ?auto_536419 ?auto_536420 ?auto_536421 ?auto_536422 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536461 - BLOCK
      ?auto_536462 - BLOCK
      ?auto_536463 - BLOCK
      ?auto_536464 - BLOCK
      ?auto_536465 - BLOCK
      ?auto_536466 - BLOCK
      ?auto_536467 - BLOCK
      ?auto_536468 - BLOCK
      ?auto_536469 - BLOCK
      ?auto_536470 - BLOCK
      ?auto_536471 - BLOCK
      ?auto_536472 - BLOCK
    )
    :vars
    (
      ?auto_536473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536472 ?auto_536473 ) ( ON-TABLE ?auto_536461 ) ( ON ?auto_536462 ?auto_536461 ) ( ON ?auto_536463 ?auto_536462 ) ( ON ?auto_536464 ?auto_536463 ) ( not ( = ?auto_536461 ?auto_536462 ) ) ( not ( = ?auto_536461 ?auto_536463 ) ) ( not ( = ?auto_536461 ?auto_536464 ) ) ( not ( = ?auto_536461 ?auto_536465 ) ) ( not ( = ?auto_536461 ?auto_536466 ) ) ( not ( = ?auto_536461 ?auto_536467 ) ) ( not ( = ?auto_536461 ?auto_536468 ) ) ( not ( = ?auto_536461 ?auto_536469 ) ) ( not ( = ?auto_536461 ?auto_536470 ) ) ( not ( = ?auto_536461 ?auto_536471 ) ) ( not ( = ?auto_536461 ?auto_536472 ) ) ( not ( = ?auto_536461 ?auto_536473 ) ) ( not ( = ?auto_536462 ?auto_536463 ) ) ( not ( = ?auto_536462 ?auto_536464 ) ) ( not ( = ?auto_536462 ?auto_536465 ) ) ( not ( = ?auto_536462 ?auto_536466 ) ) ( not ( = ?auto_536462 ?auto_536467 ) ) ( not ( = ?auto_536462 ?auto_536468 ) ) ( not ( = ?auto_536462 ?auto_536469 ) ) ( not ( = ?auto_536462 ?auto_536470 ) ) ( not ( = ?auto_536462 ?auto_536471 ) ) ( not ( = ?auto_536462 ?auto_536472 ) ) ( not ( = ?auto_536462 ?auto_536473 ) ) ( not ( = ?auto_536463 ?auto_536464 ) ) ( not ( = ?auto_536463 ?auto_536465 ) ) ( not ( = ?auto_536463 ?auto_536466 ) ) ( not ( = ?auto_536463 ?auto_536467 ) ) ( not ( = ?auto_536463 ?auto_536468 ) ) ( not ( = ?auto_536463 ?auto_536469 ) ) ( not ( = ?auto_536463 ?auto_536470 ) ) ( not ( = ?auto_536463 ?auto_536471 ) ) ( not ( = ?auto_536463 ?auto_536472 ) ) ( not ( = ?auto_536463 ?auto_536473 ) ) ( not ( = ?auto_536464 ?auto_536465 ) ) ( not ( = ?auto_536464 ?auto_536466 ) ) ( not ( = ?auto_536464 ?auto_536467 ) ) ( not ( = ?auto_536464 ?auto_536468 ) ) ( not ( = ?auto_536464 ?auto_536469 ) ) ( not ( = ?auto_536464 ?auto_536470 ) ) ( not ( = ?auto_536464 ?auto_536471 ) ) ( not ( = ?auto_536464 ?auto_536472 ) ) ( not ( = ?auto_536464 ?auto_536473 ) ) ( not ( = ?auto_536465 ?auto_536466 ) ) ( not ( = ?auto_536465 ?auto_536467 ) ) ( not ( = ?auto_536465 ?auto_536468 ) ) ( not ( = ?auto_536465 ?auto_536469 ) ) ( not ( = ?auto_536465 ?auto_536470 ) ) ( not ( = ?auto_536465 ?auto_536471 ) ) ( not ( = ?auto_536465 ?auto_536472 ) ) ( not ( = ?auto_536465 ?auto_536473 ) ) ( not ( = ?auto_536466 ?auto_536467 ) ) ( not ( = ?auto_536466 ?auto_536468 ) ) ( not ( = ?auto_536466 ?auto_536469 ) ) ( not ( = ?auto_536466 ?auto_536470 ) ) ( not ( = ?auto_536466 ?auto_536471 ) ) ( not ( = ?auto_536466 ?auto_536472 ) ) ( not ( = ?auto_536466 ?auto_536473 ) ) ( not ( = ?auto_536467 ?auto_536468 ) ) ( not ( = ?auto_536467 ?auto_536469 ) ) ( not ( = ?auto_536467 ?auto_536470 ) ) ( not ( = ?auto_536467 ?auto_536471 ) ) ( not ( = ?auto_536467 ?auto_536472 ) ) ( not ( = ?auto_536467 ?auto_536473 ) ) ( not ( = ?auto_536468 ?auto_536469 ) ) ( not ( = ?auto_536468 ?auto_536470 ) ) ( not ( = ?auto_536468 ?auto_536471 ) ) ( not ( = ?auto_536468 ?auto_536472 ) ) ( not ( = ?auto_536468 ?auto_536473 ) ) ( not ( = ?auto_536469 ?auto_536470 ) ) ( not ( = ?auto_536469 ?auto_536471 ) ) ( not ( = ?auto_536469 ?auto_536472 ) ) ( not ( = ?auto_536469 ?auto_536473 ) ) ( not ( = ?auto_536470 ?auto_536471 ) ) ( not ( = ?auto_536470 ?auto_536472 ) ) ( not ( = ?auto_536470 ?auto_536473 ) ) ( not ( = ?auto_536471 ?auto_536472 ) ) ( not ( = ?auto_536471 ?auto_536473 ) ) ( not ( = ?auto_536472 ?auto_536473 ) ) ( ON ?auto_536471 ?auto_536472 ) ( ON ?auto_536470 ?auto_536471 ) ( ON ?auto_536469 ?auto_536470 ) ( ON ?auto_536468 ?auto_536469 ) ( ON ?auto_536467 ?auto_536468 ) ( ON ?auto_536466 ?auto_536467 ) ( CLEAR ?auto_536464 ) ( ON ?auto_536465 ?auto_536466 ) ( CLEAR ?auto_536465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_536461 ?auto_536462 ?auto_536463 ?auto_536464 ?auto_536465 )
      ( MAKE-12PILE ?auto_536461 ?auto_536462 ?auto_536463 ?auto_536464 ?auto_536465 ?auto_536466 ?auto_536467 ?auto_536468 ?auto_536469 ?auto_536470 ?auto_536471 ?auto_536472 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536511 - BLOCK
      ?auto_536512 - BLOCK
      ?auto_536513 - BLOCK
      ?auto_536514 - BLOCK
      ?auto_536515 - BLOCK
      ?auto_536516 - BLOCK
      ?auto_536517 - BLOCK
      ?auto_536518 - BLOCK
      ?auto_536519 - BLOCK
      ?auto_536520 - BLOCK
      ?auto_536521 - BLOCK
      ?auto_536522 - BLOCK
    )
    :vars
    (
      ?auto_536523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536522 ?auto_536523 ) ( ON-TABLE ?auto_536511 ) ( ON ?auto_536512 ?auto_536511 ) ( ON ?auto_536513 ?auto_536512 ) ( not ( = ?auto_536511 ?auto_536512 ) ) ( not ( = ?auto_536511 ?auto_536513 ) ) ( not ( = ?auto_536511 ?auto_536514 ) ) ( not ( = ?auto_536511 ?auto_536515 ) ) ( not ( = ?auto_536511 ?auto_536516 ) ) ( not ( = ?auto_536511 ?auto_536517 ) ) ( not ( = ?auto_536511 ?auto_536518 ) ) ( not ( = ?auto_536511 ?auto_536519 ) ) ( not ( = ?auto_536511 ?auto_536520 ) ) ( not ( = ?auto_536511 ?auto_536521 ) ) ( not ( = ?auto_536511 ?auto_536522 ) ) ( not ( = ?auto_536511 ?auto_536523 ) ) ( not ( = ?auto_536512 ?auto_536513 ) ) ( not ( = ?auto_536512 ?auto_536514 ) ) ( not ( = ?auto_536512 ?auto_536515 ) ) ( not ( = ?auto_536512 ?auto_536516 ) ) ( not ( = ?auto_536512 ?auto_536517 ) ) ( not ( = ?auto_536512 ?auto_536518 ) ) ( not ( = ?auto_536512 ?auto_536519 ) ) ( not ( = ?auto_536512 ?auto_536520 ) ) ( not ( = ?auto_536512 ?auto_536521 ) ) ( not ( = ?auto_536512 ?auto_536522 ) ) ( not ( = ?auto_536512 ?auto_536523 ) ) ( not ( = ?auto_536513 ?auto_536514 ) ) ( not ( = ?auto_536513 ?auto_536515 ) ) ( not ( = ?auto_536513 ?auto_536516 ) ) ( not ( = ?auto_536513 ?auto_536517 ) ) ( not ( = ?auto_536513 ?auto_536518 ) ) ( not ( = ?auto_536513 ?auto_536519 ) ) ( not ( = ?auto_536513 ?auto_536520 ) ) ( not ( = ?auto_536513 ?auto_536521 ) ) ( not ( = ?auto_536513 ?auto_536522 ) ) ( not ( = ?auto_536513 ?auto_536523 ) ) ( not ( = ?auto_536514 ?auto_536515 ) ) ( not ( = ?auto_536514 ?auto_536516 ) ) ( not ( = ?auto_536514 ?auto_536517 ) ) ( not ( = ?auto_536514 ?auto_536518 ) ) ( not ( = ?auto_536514 ?auto_536519 ) ) ( not ( = ?auto_536514 ?auto_536520 ) ) ( not ( = ?auto_536514 ?auto_536521 ) ) ( not ( = ?auto_536514 ?auto_536522 ) ) ( not ( = ?auto_536514 ?auto_536523 ) ) ( not ( = ?auto_536515 ?auto_536516 ) ) ( not ( = ?auto_536515 ?auto_536517 ) ) ( not ( = ?auto_536515 ?auto_536518 ) ) ( not ( = ?auto_536515 ?auto_536519 ) ) ( not ( = ?auto_536515 ?auto_536520 ) ) ( not ( = ?auto_536515 ?auto_536521 ) ) ( not ( = ?auto_536515 ?auto_536522 ) ) ( not ( = ?auto_536515 ?auto_536523 ) ) ( not ( = ?auto_536516 ?auto_536517 ) ) ( not ( = ?auto_536516 ?auto_536518 ) ) ( not ( = ?auto_536516 ?auto_536519 ) ) ( not ( = ?auto_536516 ?auto_536520 ) ) ( not ( = ?auto_536516 ?auto_536521 ) ) ( not ( = ?auto_536516 ?auto_536522 ) ) ( not ( = ?auto_536516 ?auto_536523 ) ) ( not ( = ?auto_536517 ?auto_536518 ) ) ( not ( = ?auto_536517 ?auto_536519 ) ) ( not ( = ?auto_536517 ?auto_536520 ) ) ( not ( = ?auto_536517 ?auto_536521 ) ) ( not ( = ?auto_536517 ?auto_536522 ) ) ( not ( = ?auto_536517 ?auto_536523 ) ) ( not ( = ?auto_536518 ?auto_536519 ) ) ( not ( = ?auto_536518 ?auto_536520 ) ) ( not ( = ?auto_536518 ?auto_536521 ) ) ( not ( = ?auto_536518 ?auto_536522 ) ) ( not ( = ?auto_536518 ?auto_536523 ) ) ( not ( = ?auto_536519 ?auto_536520 ) ) ( not ( = ?auto_536519 ?auto_536521 ) ) ( not ( = ?auto_536519 ?auto_536522 ) ) ( not ( = ?auto_536519 ?auto_536523 ) ) ( not ( = ?auto_536520 ?auto_536521 ) ) ( not ( = ?auto_536520 ?auto_536522 ) ) ( not ( = ?auto_536520 ?auto_536523 ) ) ( not ( = ?auto_536521 ?auto_536522 ) ) ( not ( = ?auto_536521 ?auto_536523 ) ) ( not ( = ?auto_536522 ?auto_536523 ) ) ( ON ?auto_536521 ?auto_536522 ) ( ON ?auto_536520 ?auto_536521 ) ( ON ?auto_536519 ?auto_536520 ) ( ON ?auto_536518 ?auto_536519 ) ( ON ?auto_536517 ?auto_536518 ) ( ON ?auto_536516 ?auto_536517 ) ( ON ?auto_536515 ?auto_536516 ) ( CLEAR ?auto_536513 ) ( ON ?auto_536514 ?auto_536515 ) ( CLEAR ?auto_536514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_536511 ?auto_536512 ?auto_536513 ?auto_536514 )
      ( MAKE-12PILE ?auto_536511 ?auto_536512 ?auto_536513 ?auto_536514 ?auto_536515 ?auto_536516 ?auto_536517 ?auto_536518 ?auto_536519 ?auto_536520 ?auto_536521 ?auto_536522 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536561 - BLOCK
      ?auto_536562 - BLOCK
      ?auto_536563 - BLOCK
      ?auto_536564 - BLOCK
      ?auto_536565 - BLOCK
      ?auto_536566 - BLOCK
      ?auto_536567 - BLOCK
      ?auto_536568 - BLOCK
      ?auto_536569 - BLOCK
      ?auto_536570 - BLOCK
      ?auto_536571 - BLOCK
      ?auto_536572 - BLOCK
    )
    :vars
    (
      ?auto_536573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536572 ?auto_536573 ) ( ON-TABLE ?auto_536561 ) ( ON ?auto_536562 ?auto_536561 ) ( not ( = ?auto_536561 ?auto_536562 ) ) ( not ( = ?auto_536561 ?auto_536563 ) ) ( not ( = ?auto_536561 ?auto_536564 ) ) ( not ( = ?auto_536561 ?auto_536565 ) ) ( not ( = ?auto_536561 ?auto_536566 ) ) ( not ( = ?auto_536561 ?auto_536567 ) ) ( not ( = ?auto_536561 ?auto_536568 ) ) ( not ( = ?auto_536561 ?auto_536569 ) ) ( not ( = ?auto_536561 ?auto_536570 ) ) ( not ( = ?auto_536561 ?auto_536571 ) ) ( not ( = ?auto_536561 ?auto_536572 ) ) ( not ( = ?auto_536561 ?auto_536573 ) ) ( not ( = ?auto_536562 ?auto_536563 ) ) ( not ( = ?auto_536562 ?auto_536564 ) ) ( not ( = ?auto_536562 ?auto_536565 ) ) ( not ( = ?auto_536562 ?auto_536566 ) ) ( not ( = ?auto_536562 ?auto_536567 ) ) ( not ( = ?auto_536562 ?auto_536568 ) ) ( not ( = ?auto_536562 ?auto_536569 ) ) ( not ( = ?auto_536562 ?auto_536570 ) ) ( not ( = ?auto_536562 ?auto_536571 ) ) ( not ( = ?auto_536562 ?auto_536572 ) ) ( not ( = ?auto_536562 ?auto_536573 ) ) ( not ( = ?auto_536563 ?auto_536564 ) ) ( not ( = ?auto_536563 ?auto_536565 ) ) ( not ( = ?auto_536563 ?auto_536566 ) ) ( not ( = ?auto_536563 ?auto_536567 ) ) ( not ( = ?auto_536563 ?auto_536568 ) ) ( not ( = ?auto_536563 ?auto_536569 ) ) ( not ( = ?auto_536563 ?auto_536570 ) ) ( not ( = ?auto_536563 ?auto_536571 ) ) ( not ( = ?auto_536563 ?auto_536572 ) ) ( not ( = ?auto_536563 ?auto_536573 ) ) ( not ( = ?auto_536564 ?auto_536565 ) ) ( not ( = ?auto_536564 ?auto_536566 ) ) ( not ( = ?auto_536564 ?auto_536567 ) ) ( not ( = ?auto_536564 ?auto_536568 ) ) ( not ( = ?auto_536564 ?auto_536569 ) ) ( not ( = ?auto_536564 ?auto_536570 ) ) ( not ( = ?auto_536564 ?auto_536571 ) ) ( not ( = ?auto_536564 ?auto_536572 ) ) ( not ( = ?auto_536564 ?auto_536573 ) ) ( not ( = ?auto_536565 ?auto_536566 ) ) ( not ( = ?auto_536565 ?auto_536567 ) ) ( not ( = ?auto_536565 ?auto_536568 ) ) ( not ( = ?auto_536565 ?auto_536569 ) ) ( not ( = ?auto_536565 ?auto_536570 ) ) ( not ( = ?auto_536565 ?auto_536571 ) ) ( not ( = ?auto_536565 ?auto_536572 ) ) ( not ( = ?auto_536565 ?auto_536573 ) ) ( not ( = ?auto_536566 ?auto_536567 ) ) ( not ( = ?auto_536566 ?auto_536568 ) ) ( not ( = ?auto_536566 ?auto_536569 ) ) ( not ( = ?auto_536566 ?auto_536570 ) ) ( not ( = ?auto_536566 ?auto_536571 ) ) ( not ( = ?auto_536566 ?auto_536572 ) ) ( not ( = ?auto_536566 ?auto_536573 ) ) ( not ( = ?auto_536567 ?auto_536568 ) ) ( not ( = ?auto_536567 ?auto_536569 ) ) ( not ( = ?auto_536567 ?auto_536570 ) ) ( not ( = ?auto_536567 ?auto_536571 ) ) ( not ( = ?auto_536567 ?auto_536572 ) ) ( not ( = ?auto_536567 ?auto_536573 ) ) ( not ( = ?auto_536568 ?auto_536569 ) ) ( not ( = ?auto_536568 ?auto_536570 ) ) ( not ( = ?auto_536568 ?auto_536571 ) ) ( not ( = ?auto_536568 ?auto_536572 ) ) ( not ( = ?auto_536568 ?auto_536573 ) ) ( not ( = ?auto_536569 ?auto_536570 ) ) ( not ( = ?auto_536569 ?auto_536571 ) ) ( not ( = ?auto_536569 ?auto_536572 ) ) ( not ( = ?auto_536569 ?auto_536573 ) ) ( not ( = ?auto_536570 ?auto_536571 ) ) ( not ( = ?auto_536570 ?auto_536572 ) ) ( not ( = ?auto_536570 ?auto_536573 ) ) ( not ( = ?auto_536571 ?auto_536572 ) ) ( not ( = ?auto_536571 ?auto_536573 ) ) ( not ( = ?auto_536572 ?auto_536573 ) ) ( ON ?auto_536571 ?auto_536572 ) ( ON ?auto_536570 ?auto_536571 ) ( ON ?auto_536569 ?auto_536570 ) ( ON ?auto_536568 ?auto_536569 ) ( ON ?auto_536567 ?auto_536568 ) ( ON ?auto_536566 ?auto_536567 ) ( ON ?auto_536565 ?auto_536566 ) ( ON ?auto_536564 ?auto_536565 ) ( CLEAR ?auto_536562 ) ( ON ?auto_536563 ?auto_536564 ) ( CLEAR ?auto_536563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_536561 ?auto_536562 ?auto_536563 )
      ( MAKE-12PILE ?auto_536561 ?auto_536562 ?auto_536563 ?auto_536564 ?auto_536565 ?auto_536566 ?auto_536567 ?auto_536568 ?auto_536569 ?auto_536570 ?auto_536571 ?auto_536572 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536611 - BLOCK
      ?auto_536612 - BLOCK
      ?auto_536613 - BLOCK
      ?auto_536614 - BLOCK
      ?auto_536615 - BLOCK
      ?auto_536616 - BLOCK
      ?auto_536617 - BLOCK
      ?auto_536618 - BLOCK
      ?auto_536619 - BLOCK
      ?auto_536620 - BLOCK
      ?auto_536621 - BLOCK
      ?auto_536622 - BLOCK
    )
    :vars
    (
      ?auto_536623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536622 ?auto_536623 ) ( ON-TABLE ?auto_536611 ) ( not ( = ?auto_536611 ?auto_536612 ) ) ( not ( = ?auto_536611 ?auto_536613 ) ) ( not ( = ?auto_536611 ?auto_536614 ) ) ( not ( = ?auto_536611 ?auto_536615 ) ) ( not ( = ?auto_536611 ?auto_536616 ) ) ( not ( = ?auto_536611 ?auto_536617 ) ) ( not ( = ?auto_536611 ?auto_536618 ) ) ( not ( = ?auto_536611 ?auto_536619 ) ) ( not ( = ?auto_536611 ?auto_536620 ) ) ( not ( = ?auto_536611 ?auto_536621 ) ) ( not ( = ?auto_536611 ?auto_536622 ) ) ( not ( = ?auto_536611 ?auto_536623 ) ) ( not ( = ?auto_536612 ?auto_536613 ) ) ( not ( = ?auto_536612 ?auto_536614 ) ) ( not ( = ?auto_536612 ?auto_536615 ) ) ( not ( = ?auto_536612 ?auto_536616 ) ) ( not ( = ?auto_536612 ?auto_536617 ) ) ( not ( = ?auto_536612 ?auto_536618 ) ) ( not ( = ?auto_536612 ?auto_536619 ) ) ( not ( = ?auto_536612 ?auto_536620 ) ) ( not ( = ?auto_536612 ?auto_536621 ) ) ( not ( = ?auto_536612 ?auto_536622 ) ) ( not ( = ?auto_536612 ?auto_536623 ) ) ( not ( = ?auto_536613 ?auto_536614 ) ) ( not ( = ?auto_536613 ?auto_536615 ) ) ( not ( = ?auto_536613 ?auto_536616 ) ) ( not ( = ?auto_536613 ?auto_536617 ) ) ( not ( = ?auto_536613 ?auto_536618 ) ) ( not ( = ?auto_536613 ?auto_536619 ) ) ( not ( = ?auto_536613 ?auto_536620 ) ) ( not ( = ?auto_536613 ?auto_536621 ) ) ( not ( = ?auto_536613 ?auto_536622 ) ) ( not ( = ?auto_536613 ?auto_536623 ) ) ( not ( = ?auto_536614 ?auto_536615 ) ) ( not ( = ?auto_536614 ?auto_536616 ) ) ( not ( = ?auto_536614 ?auto_536617 ) ) ( not ( = ?auto_536614 ?auto_536618 ) ) ( not ( = ?auto_536614 ?auto_536619 ) ) ( not ( = ?auto_536614 ?auto_536620 ) ) ( not ( = ?auto_536614 ?auto_536621 ) ) ( not ( = ?auto_536614 ?auto_536622 ) ) ( not ( = ?auto_536614 ?auto_536623 ) ) ( not ( = ?auto_536615 ?auto_536616 ) ) ( not ( = ?auto_536615 ?auto_536617 ) ) ( not ( = ?auto_536615 ?auto_536618 ) ) ( not ( = ?auto_536615 ?auto_536619 ) ) ( not ( = ?auto_536615 ?auto_536620 ) ) ( not ( = ?auto_536615 ?auto_536621 ) ) ( not ( = ?auto_536615 ?auto_536622 ) ) ( not ( = ?auto_536615 ?auto_536623 ) ) ( not ( = ?auto_536616 ?auto_536617 ) ) ( not ( = ?auto_536616 ?auto_536618 ) ) ( not ( = ?auto_536616 ?auto_536619 ) ) ( not ( = ?auto_536616 ?auto_536620 ) ) ( not ( = ?auto_536616 ?auto_536621 ) ) ( not ( = ?auto_536616 ?auto_536622 ) ) ( not ( = ?auto_536616 ?auto_536623 ) ) ( not ( = ?auto_536617 ?auto_536618 ) ) ( not ( = ?auto_536617 ?auto_536619 ) ) ( not ( = ?auto_536617 ?auto_536620 ) ) ( not ( = ?auto_536617 ?auto_536621 ) ) ( not ( = ?auto_536617 ?auto_536622 ) ) ( not ( = ?auto_536617 ?auto_536623 ) ) ( not ( = ?auto_536618 ?auto_536619 ) ) ( not ( = ?auto_536618 ?auto_536620 ) ) ( not ( = ?auto_536618 ?auto_536621 ) ) ( not ( = ?auto_536618 ?auto_536622 ) ) ( not ( = ?auto_536618 ?auto_536623 ) ) ( not ( = ?auto_536619 ?auto_536620 ) ) ( not ( = ?auto_536619 ?auto_536621 ) ) ( not ( = ?auto_536619 ?auto_536622 ) ) ( not ( = ?auto_536619 ?auto_536623 ) ) ( not ( = ?auto_536620 ?auto_536621 ) ) ( not ( = ?auto_536620 ?auto_536622 ) ) ( not ( = ?auto_536620 ?auto_536623 ) ) ( not ( = ?auto_536621 ?auto_536622 ) ) ( not ( = ?auto_536621 ?auto_536623 ) ) ( not ( = ?auto_536622 ?auto_536623 ) ) ( ON ?auto_536621 ?auto_536622 ) ( ON ?auto_536620 ?auto_536621 ) ( ON ?auto_536619 ?auto_536620 ) ( ON ?auto_536618 ?auto_536619 ) ( ON ?auto_536617 ?auto_536618 ) ( ON ?auto_536616 ?auto_536617 ) ( ON ?auto_536615 ?auto_536616 ) ( ON ?auto_536614 ?auto_536615 ) ( ON ?auto_536613 ?auto_536614 ) ( CLEAR ?auto_536611 ) ( ON ?auto_536612 ?auto_536613 ) ( CLEAR ?auto_536612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_536611 ?auto_536612 )
      ( MAKE-12PILE ?auto_536611 ?auto_536612 ?auto_536613 ?auto_536614 ?auto_536615 ?auto_536616 ?auto_536617 ?auto_536618 ?auto_536619 ?auto_536620 ?auto_536621 ?auto_536622 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_536661 - BLOCK
      ?auto_536662 - BLOCK
      ?auto_536663 - BLOCK
      ?auto_536664 - BLOCK
      ?auto_536665 - BLOCK
      ?auto_536666 - BLOCK
      ?auto_536667 - BLOCK
      ?auto_536668 - BLOCK
      ?auto_536669 - BLOCK
      ?auto_536670 - BLOCK
      ?auto_536671 - BLOCK
      ?auto_536672 - BLOCK
    )
    :vars
    (
      ?auto_536673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536672 ?auto_536673 ) ( not ( = ?auto_536661 ?auto_536662 ) ) ( not ( = ?auto_536661 ?auto_536663 ) ) ( not ( = ?auto_536661 ?auto_536664 ) ) ( not ( = ?auto_536661 ?auto_536665 ) ) ( not ( = ?auto_536661 ?auto_536666 ) ) ( not ( = ?auto_536661 ?auto_536667 ) ) ( not ( = ?auto_536661 ?auto_536668 ) ) ( not ( = ?auto_536661 ?auto_536669 ) ) ( not ( = ?auto_536661 ?auto_536670 ) ) ( not ( = ?auto_536661 ?auto_536671 ) ) ( not ( = ?auto_536661 ?auto_536672 ) ) ( not ( = ?auto_536661 ?auto_536673 ) ) ( not ( = ?auto_536662 ?auto_536663 ) ) ( not ( = ?auto_536662 ?auto_536664 ) ) ( not ( = ?auto_536662 ?auto_536665 ) ) ( not ( = ?auto_536662 ?auto_536666 ) ) ( not ( = ?auto_536662 ?auto_536667 ) ) ( not ( = ?auto_536662 ?auto_536668 ) ) ( not ( = ?auto_536662 ?auto_536669 ) ) ( not ( = ?auto_536662 ?auto_536670 ) ) ( not ( = ?auto_536662 ?auto_536671 ) ) ( not ( = ?auto_536662 ?auto_536672 ) ) ( not ( = ?auto_536662 ?auto_536673 ) ) ( not ( = ?auto_536663 ?auto_536664 ) ) ( not ( = ?auto_536663 ?auto_536665 ) ) ( not ( = ?auto_536663 ?auto_536666 ) ) ( not ( = ?auto_536663 ?auto_536667 ) ) ( not ( = ?auto_536663 ?auto_536668 ) ) ( not ( = ?auto_536663 ?auto_536669 ) ) ( not ( = ?auto_536663 ?auto_536670 ) ) ( not ( = ?auto_536663 ?auto_536671 ) ) ( not ( = ?auto_536663 ?auto_536672 ) ) ( not ( = ?auto_536663 ?auto_536673 ) ) ( not ( = ?auto_536664 ?auto_536665 ) ) ( not ( = ?auto_536664 ?auto_536666 ) ) ( not ( = ?auto_536664 ?auto_536667 ) ) ( not ( = ?auto_536664 ?auto_536668 ) ) ( not ( = ?auto_536664 ?auto_536669 ) ) ( not ( = ?auto_536664 ?auto_536670 ) ) ( not ( = ?auto_536664 ?auto_536671 ) ) ( not ( = ?auto_536664 ?auto_536672 ) ) ( not ( = ?auto_536664 ?auto_536673 ) ) ( not ( = ?auto_536665 ?auto_536666 ) ) ( not ( = ?auto_536665 ?auto_536667 ) ) ( not ( = ?auto_536665 ?auto_536668 ) ) ( not ( = ?auto_536665 ?auto_536669 ) ) ( not ( = ?auto_536665 ?auto_536670 ) ) ( not ( = ?auto_536665 ?auto_536671 ) ) ( not ( = ?auto_536665 ?auto_536672 ) ) ( not ( = ?auto_536665 ?auto_536673 ) ) ( not ( = ?auto_536666 ?auto_536667 ) ) ( not ( = ?auto_536666 ?auto_536668 ) ) ( not ( = ?auto_536666 ?auto_536669 ) ) ( not ( = ?auto_536666 ?auto_536670 ) ) ( not ( = ?auto_536666 ?auto_536671 ) ) ( not ( = ?auto_536666 ?auto_536672 ) ) ( not ( = ?auto_536666 ?auto_536673 ) ) ( not ( = ?auto_536667 ?auto_536668 ) ) ( not ( = ?auto_536667 ?auto_536669 ) ) ( not ( = ?auto_536667 ?auto_536670 ) ) ( not ( = ?auto_536667 ?auto_536671 ) ) ( not ( = ?auto_536667 ?auto_536672 ) ) ( not ( = ?auto_536667 ?auto_536673 ) ) ( not ( = ?auto_536668 ?auto_536669 ) ) ( not ( = ?auto_536668 ?auto_536670 ) ) ( not ( = ?auto_536668 ?auto_536671 ) ) ( not ( = ?auto_536668 ?auto_536672 ) ) ( not ( = ?auto_536668 ?auto_536673 ) ) ( not ( = ?auto_536669 ?auto_536670 ) ) ( not ( = ?auto_536669 ?auto_536671 ) ) ( not ( = ?auto_536669 ?auto_536672 ) ) ( not ( = ?auto_536669 ?auto_536673 ) ) ( not ( = ?auto_536670 ?auto_536671 ) ) ( not ( = ?auto_536670 ?auto_536672 ) ) ( not ( = ?auto_536670 ?auto_536673 ) ) ( not ( = ?auto_536671 ?auto_536672 ) ) ( not ( = ?auto_536671 ?auto_536673 ) ) ( not ( = ?auto_536672 ?auto_536673 ) ) ( ON ?auto_536671 ?auto_536672 ) ( ON ?auto_536670 ?auto_536671 ) ( ON ?auto_536669 ?auto_536670 ) ( ON ?auto_536668 ?auto_536669 ) ( ON ?auto_536667 ?auto_536668 ) ( ON ?auto_536666 ?auto_536667 ) ( ON ?auto_536665 ?auto_536666 ) ( ON ?auto_536664 ?auto_536665 ) ( ON ?auto_536663 ?auto_536664 ) ( ON ?auto_536662 ?auto_536663 ) ( ON ?auto_536661 ?auto_536662 ) ( CLEAR ?auto_536661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_536661 )
      ( MAKE-12PILE ?auto_536661 ?auto_536662 ?auto_536663 ?auto_536664 ?auto_536665 ?auto_536666 ?auto_536667 ?auto_536668 ?auto_536669 ?auto_536670 ?auto_536671 ?auto_536672 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536712 - BLOCK
      ?auto_536713 - BLOCK
      ?auto_536714 - BLOCK
      ?auto_536715 - BLOCK
      ?auto_536716 - BLOCK
      ?auto_536717 - BLOCK
      ?auto_536718 - BLOCK
      ?auto_536719 - BLOCK
      ?auto_536720 - BLOCK
      ?auto_536721 - BLOCK
      ?auto_536722 - BLOCK
      ?auto_536723 - BLOCK
      ?auto_536724 - BLOCK
    )
    :vars
    (
      ?auto_536725 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_536723 ) ( ON ?auto_536724 ?auto_536725 ) ( CLEAR ?auto_536724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_536712 ) ( ON ?auto_536713 ?auto_536712 ) ( ON ?auto_536714 ?auto_536713 ) ( ON ?auto_536715 ?auto_536714 ) ( ON ?auto_536716 ?auto_536715 ) ( ON ?auto_536717 ?auto_536716 ) ( ON ?auto_536718 ?auto_536717 ) ( ON ?auto_536719 ?auto_536718 ) ( ON ?auto_536720 ?auto_536719 ) ( ON ?auto_536721 ?auto_536720 ) ( ON ?auto_536722 ?auto_536721 ) ( ON ?auto_536723 ?auto_536722 ) ( not ( = ?auto_536712 ?auto_536713 ) ) ( not ( = ?auto_536712 ?auto_536714 ) ) ( not ( = ?auto_536712 ?auto_536715 ) ) ( not ( = ?auto_536712 ?auto_536716 ) ) ( not ( = ?auto_536712 ?auto_536717 ) ) ( not ( = ?auto_536712 ?auto_536718 ) ) ( not ( = ?auto_536712 ?auto_536719 ) ) ( not ( = ?auto_536712 ?auto_536720 ) ) ( not ( = ?auto_536712 ?auto_536721 ) ) ( not ( = ?auto_536712 ?auto_536722 ) ) ( not ( = ?auto_536712 ?auto_536723 ) ) ( not ( = ?auto_536712 ?auto_536724 ) ) ( not ( = ?auto_536712 ?auto_536725 ) ) ( not ( = ?auto_536713 ?auto_536714 ) ) ( not ( = ?auto_536713 ?auto_536715 ) ) ( not ( = ?auto_536713 ?auto_536716 ) ) ( not ( = ?auto_536713 ?auto_536717 ) ) ( not ( = ?auto_536713 ?auto_536718 ) ) ( not ( = ?auto_536713 ?auto_536719 ) ) ( not ( = ?auto_536713 ?auto_536720 ) ) ( not ( = ?auto_536713 ?auto_536721 ) ) ( not ( = ?auto_536713 ?auto_536722 ) ) ( not ( = ?auto_536713 ?auto_536723 ) ) ( not ( = ?auto_536713 ?auto_536724 ) ) ( not ( = ?auto_536713 ?auto_536725 ) ) ( not ( = ?auto_536714 ?auto_536715 ) ) ( not ( = ?auto_536714 ?auto_536716 ) ) ( not ( = ?auto_536714 ?auto_536717 ) ) ( not ( = ?auto_536714 ?auto_536718 ) ) ( not ( = ?auto_536714 ?auto_536719 ) ) ( not ( = ?auto_536714 ?auto_536720 ) ) ( not ( = ?auto_536714 ?auto_536721 ) ) ( not ( = ?auto_536714 ?auto_536722 ) ) ( not ( = ?auto_536714 ?auto_536723 ) ) ( not ( = ?auto_536714 ?auto_536724 ) ) ( not ( = ?auto_536714 ?auto_536725 ) ) ( not ( = ?auto_536715 ?auto_536716 ) ) ( not ( = ?auto_536715 ?auto_536717 ) ) ( not ( = ?auto_536715 ?auto_536718 ) ) ( not ( = ?auto_536715 ?auto_536719 ) ) ( not ( = ?auto_536715 ?auto_536720 ) ) ( not ( = ?auto_536715 ?auto_536721 ) ) ( not ( = ?auto_536715 ?auto_536722 ) ) ( not ( = ?auto_536715 ?auto_536723 ) ) ( not ( = ?auto_536715 ?auto_536724 ) ) ( not ( = ?auto_536715 ?auto_536725 ) ) ( not ( = ?auto_536716 ?auto_536717 ) ) ( not ( = ?auto_536716 ?auto_536718 ) ) ( not ( = ?auto_536716 ?auto_536719 ) ) ( not ( = ?auto_536716 ?auto_536720 ) ) ( not ( = ?auto_536716 ?auto_536721 ) ) ( not ( = ?auto_536716 ?auto_536722 ) ) ( not ( = ?auto_536716 ?auto_536723 ) ) ( not ( = ?auto_536716 ?auto_536724 ) ) ( not ( = ?auto_536716 ?auto_536725 ) ) ( not ( = ?auto_536717 ?auto_536718 ) ) ( not ( = ?auto_536717 ?auto_536719 ) ) ( not ( = ?auto_536717 ?auto_536720 ) ) ( not ( = ?auto_536717 ?auto_536721 ) ) ( not ( = ?auto_536717 ?auto_536722 ) ) ( not ( = ?auto_536717 ?auto_536723 ) ) ( not ( = ?auto_536717 ?auto_536724 ) ) ( not ( = ?auto_536717 ?auto_536725 ) ) ( not ( = ?auto_536718 ?auto_536719 ) ) ( not ( = ?auto_536718 ?auto_536720 ) ) ( not ( = ?auto_536718 ?auto_536721 ) ) ( not ( = ?auto_536718 ?auto_536722 ) ) ( not ( = ?auto_536718 ?auto_536723 ) ) ( not ( = ?auto_536718 ?auto_536724 ) ) ( not ( = ?auto_536718 ?auto_536725 ) ) ( not ( = ?auto_536719 ?auto_536720 ) ) ( not ( = ?auto_536719 ?auto_536721 ) ) ( not ( = ?auto_536719 ?auto_536722 ) ) ( not ( = ?auto_536719 ?auto_536723 ) ) ( not ( = ?auto_536719 ?auto_536724 ) ) ( not ( = ?auto_536719 ?auto_536725 ) ) ( not ( = ?auto_536720 ?auto_536721 ) ) ( not ( = ?auto_536720 ?auto_536722 ) ) ( not ( = ?auto_536720 ?auto_536723 ) ) ( not ( = ?auto_536720 ?auto_536724 ) ) ( not ( = ?auto_536720 ?auto_536725 ) ) ( not ( = ?auto_536721 ?auto_536722 ) ) ( not ( = ?auto_536721 ?auto_536723 ) ) ( not ( = ?auto_536721 ?auto_536724 ) ) ( not ( = ?auto_536721 ?auto_536725 ) ) ( not ( = ?auto_536722 ?auto_536723 ) ) ( not ( = ?auto_536722 ?auto_536724 ) ) ( not ( = ?auto_536722 ?auto_536725 ) ) ( not ( = ?auto_536723 ?auto_536724 ) ) ( not ( = ?auto_536723 ?auto_536725 ) ) ( not ( = ?auto_536724 ?auto_536725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_536724 ?auto_536725 )
      ( !STACK ?auto_536724 ?auto_536723 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536766 - BLOCK
      ?auto_536767 - BLOCK
      ?auto_536768 - BLOCK
      ?auto_536769 - BLOCK
      ?auto_536770 - BLOCK
      ?auto_536771 - BLOCK
      ?auto_536772 - BLOCK
      ?auto_536773 - BLOCK
      ?auto_536774 - BLOCK
      ?auto_536775 - BLOCK
      ?auto_536776 - BLOCK
      ?auto_536777 - BLOCK
      ?auto_536778 - BLOCK
    )
    :vars
    (
      ?auto_536779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536778 ?auto_536779 ) ( ON-TABLE ?auto_536766 ) ( ON ?auto_536767 ?auto_536766 ) ( ON ?auto_536768 ?auto_536767 ) ( ON ?auto_536769 ?auto_536768 ) ( ON ?auto_536770 ?auto_536769 ) ( ON ?auto_536771 ?auto_536770 ) ( ON ?auto_536772 ?auto_536771 ) ( ON ?auto_536773 ?auto_536772 ) ( ON ?auto_536774 ?auto_536773 ) ( ON ?auto_536775 ?auto_536774 ) ( ON ?auto_536776 ?auto_536775 ) ( not ( = ?auto_536766 ?auto_536767 ) ) ( not ( = ?auto_536766 ?auto_536768 ) ) ( not ( = ?auto_536766 ?auto_536769 ) ) ( not ( = ?auto_536766 ?auto_536770 ) ) ( not ( = ?auto_536766 ?auto_536771 ) ) ( not ( = ?auto_536766 ?auto_536772 ) ) ( not ( = ?auto_536766 ?auto_536773 ) ) ( not ( = ?auto_536766 ?auto_536774 ) ) ( not ( = ?auto_536766 ?auto_536775 ) ) ( not ( = ?auto_536766 ?auto_536776 ) ) ( not ( = ?auto_536766 ?auto_536777 ) ) ( not ( = ?auto_536766 ?auto_536778 ) ) ( not ( = ?auto_536766 ?auto_536779 ) ) ( not ( = ?auto_536767 ?auto_536768 ) ) ( not ( = ?auto_536767 ?auto_536769 ) ) ( not ( = ?auto_536767 ?auto_536770 ) ) ( not ( = ?auto_536767 ?auto_536771 ) ) ( not ( = ?auto_536767 ?auto_536772 ) ) ( not ( = ?auto_536767 ?auto_536773 ) ) ( not ( = ?auto_536767 ?auto_536774 ) ) ( not ( = ?auto_536767 ?auto_536775 ) ) ( not ( = ?auto_536767 ?auto_536776 ) ) ( not ( = ?auto_536767 ?auto_536777 ) ) ( not ( = ?auto_536767 ?auto_536778 ) ) ( not ( = ?auto_536767 ?auto_536779 ) ) ( not ( = ?auto_536768 ?auto_536769 ) ) ( not ( = ?auto_536768 ?auto_536770 ) ) ( not ( = ?auto_536768 ?auto_536771 ) ) ( not ( = ?auto_536768 ?auto_536772 ) ) ( not ( = ?auto_536768 ?auto_536773 ) ) ( not ( = ?auto_536768 ?auto_536774 ) ) ( not ( = ?auto_536768 ?auto_536775 ) ) ( not ( = ?auto_536768 ?auto_536776 ) ) ( not ( = ?auto_536768 ?auto_536777 ) ) ( not ( = ?auto_536768 ?auto_536778 ) ) ( not ( = ?auto_536768 ?auto_536779 ) ) ( not ( = ?auto_536769 ?auto_536770 ) ) ( not ( = ?auto_536769 ?auto_536771 ) ) ( not ( = ?auto_536769 ?auto_536772 ) ) ( not ( = ?auto_536769 ?auto_536773 ) ) ( not ( = ?auto_536769 ?auto_536774 ) ) ( not ( = ?auto_536769 ?auto_536775 ) ) ( not ( = ?auto_536769 ?auto_536776 ) ) ( not ( = ?auto_536769 ?auto_536777 ) ) ( not ( = ?auto_536769 ?auto_536778 ) ) ( not ( = ?auto_536769 ?auto_536779 ) ) ( not ( = ?auto_536770 ?auto_536771 ) ) ( not ( = ?auto_536770 ?auto_536772 ) ) ( not ( = ?auto_536770 ?auto_536773 ) ) ( not ( = ?auto_536770 ?auto_536774 ) ) ( not ( = ?auto_536770 ?auto_536775 ) ) ( not ( = ?auto_536770 ?auto_536776 ) ) ( not ( = ?auto_536770 ?auto_536777 ) ) ( not ( = ?auto_536770 ?auto_536778 ) ) ( not ( = ?auto_536770 ?auto_536779 ) ) ( not ( = ?auto_536771 ?auto_536772 ) ) ( not ( = ?auto_536771 ?auto_536773 ) ) ( not ( = ?auto_536771 ?auto_536774 ) ) ( not ( = ?auto_536771 ?auto_536775 ) ) ( not ( = ?auto_536771 ?auto_536776 ) ) ( not ( = ?auto_536771 ?auto_536777 ) ) ( not ( = ?auto_536771 ?auto_536778 ) ) ( not ( = ?auto_536771 ?auto_536779 ) ) ( not ( = ?auto_536772 ?auto_536773 ) ) ( not ( = ?auto_536772 ?auto_536774 ) ) ( not ( = ?auto_536772 ?auto_536775 ) ) ( not ( = ?auto_536772 ?auto_536776 ) ) ( not ( = ?auto_536772 ?auto_536777 ) ) ( not ( = ?auto_536772 ?auto_536778 ) ) ( not ( = ?auto_536772 ?auto_536779 ) ) ( not ( = ?auto_536773 ?auto_536774 ) ) ( not ( = ?auto_536773 ?auto_536775 ) ) ( not ( = ?auto_536773 ?auto_536776 ) ) ( not ( = ?auto_536773 ?auto_536777 ) ) ( not ( = ?auto_536773 ?auto_536778 ) ) ( not ( = ?auto_536773 ?auto_536779 ) ) ( not ( = ?auto_536774 ?auto_536775 ) ) ( not ( = ?auto_536774 ?auto_536776 ) ) ( not ( = ?auto_536774 ?auto_536777 ) ) ( not ( = ?auto_536774 ?auto_536778 ) ) ( not ( = ?auto_536774 ?auto_536779 ) ) ( not ( = ?auto_536775 ?auto_536776 ) ) ( not ( = ?auto_536775 ?auto_536777 ) ) ( not ( = ?auto_536775 ?auto_536778 ) ) ( not ( = ?auto_536775 ?auto_536779 ) ) ( not ( = ?auto_536776 ?auto_536777 ) ) ( not ( = ?auto_536776 ?auto_536778 ) ) ( not ( = ?auto_536776 ?auto_536779 ) ) ( not ( = ?auto_536777 ?auto_536778 ) ) ( not ( = ?auto_536777 ?auto_536779 ) ) ( not ( = ?auto_536778 ?auto_536779 ) ) ( CLEAR ?auto_536776 ) ( ON ?auto_536777 ?auto_536778 ) ( CLEAR ?auto_536777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_536766 ?auto_536767 ?auto_536768 ?auto_536769 ?auto_536770 ?auto_536771 ?auto_536772 ?auto_536773 ?auto_536774 ?auto_536775 ?auto_536776 ?auto_536777 )
      ( MAKE-13PILE ?auto_536766 ?auto_536767 ?auto_536768 ?auto_536769 ?auto_536770 ?auto_536771 ?auto_536772 ?auto_536773 ?auto_536774 ?auto_536775 ?auto_536776 ?auto_536777 ?auto_536778 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536820 - BLOCK
      ?auto_536821 - BLOCK
      ?auto_536822 - BLOCK
      ?auto_536823 - BLOCK
      ?auto_536824 - BLOCK
      ?auto_536825 - BLOCK
      ?auto_536826 - BLOCK
      ?auto_536827 - BLOCK
      ?auto_536828 - BLOCK
      ?auto_536829 - BLOCK
      ?auto_536830 - BLOCK
      ?auto_536831 - BLOCK
      ?auto_536832 - BLOCK
    )
    :vars
    (
      ?auto_536833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536832 ?auto_536833 ) ( ON-TABLE ?auto_536820 ) ( ON ?auto_536821 ?auto_536820 ) ( ON ?auto_536822 ?auto_536821 ) ( ON ?auto_536823 ?auto_536822 ) ( ON ?auto_536824 ?auto_536823 ) ( ON ?auto_536825 ?auto_536824 ) ( ON ?auto_536826 ?auto_536825 ) ( ON ?auto_536827 ?auto_536826 ) ( ON ?auto_536828 ?auto_536827 ) ( ON ?auto_536829 ?auto_536828 ) ( not ( = ?auto_536820 ?auto_536821 ) ) ( not ( = ?auto_536820 ?auto_536822 ) ) ( not ( = ?auto_536820 ?auto_536823 ) ) ( not ( = ?auto_536820 ?auto_536824 ) ) ( not ( = ?auto_536820 ?auto_536825 ) ) ( not ( = ?auto_536820 ?auto_536826 ) ) ( not ( = ?auto_536820 ?auto_536827 ) ) ( not ( = ?auto_536820 ?auto_536828 ) ) ( not ( = ?auto_536820 ?auto_536829 ) ) ( not ( = ?auto_536820 ?auto_536830 ) ) ( not ( = ?auto_536820 ?auto_536831 ) ) ( not ( = ?auto_536820 ?auto_536832 ) ) ( not ( = ?auto_536820 ?auto_536833 ) ) ( not ( = ?auto_536821 ?auto_536822 ) ) ( not ( = ?auto_536821 ?auto_536823 ) ) ( not ( = ?auto_536821 ?auto_536824 ) ) ( not ( = ?auto_536821 ?auto_536825 ) ) ( not ( = ?auto_536821 ?auto_536826 ) ) ( not ( = ?auto_536821 ?auto_536827 ) ) ( not ( = ?auto_536821 ?auto_536828 ) ) ( not ( = ?auto_536821 ?auto_536829 ) ) ( not ( = ?auto_536821 ?auto_536830 ) ) ( not ( = ?auto_536821 ?auto_536831 ) ) ( not ( = ?auto_536821 ?auto_536832 ) ) ( not ( = ?auto_536821 ?auto_536833 ) ) ( not ( = ?auto_536822 ?auto_536823 ) ) ( not ( = ?auto_536822 ?auto_536824 ) ) ( not ( = ?auto_536822 ?auto_536825 ) ) ( not ( = ?auto_536822 ?auto_536826 ) ) ( not ( = ?auto_536822 ?auto_536827 ) ) ( not ( = ?auto_536822 ?auto_536828 ) ) ( not ( = ?auto_536822 ?auto_536829 ) ) ( not ( = ?auto_536822 ?auto_536830 ) ) ( not ( = ?auto_536822 ?auto_536831 ) ) ( not ( = ?auto_536822 ?auto_536832 ) ) ( not ( = ?auto_536822 ?auto_536833 ) ) ( not ( = ?auto_536823 ?auto_536824 ) ) ( not ( = ?auto_536823 ?auto_536825 ) ) ( not ( = ?auto_536823 ?auto_536826 ) ) ( not ( = ?auto_536823 ?auto_536827 ) ) ( not ( = ?auto_536823 ?auto_536828 ) ) ( not ( = ?auto_536823 ?auto_536829 ) ) ( not ( = ?auto_536823 ?auto_536830 ) ) ( not ( = ?auto_536823 ?auto_536831 ) ) ( not ( = ?auto_536823 ?auto_536832 ) ) ( not ( = ?auto_536823 ?auto_536833 ) ) ( not ( = ?auto_536824 ?auto_536825 ) ) ( not ( = ?auto_536824 ?auto_536826 ) ) ( not ( = ?auto_536824 ?auto_536827 ) ) ( not ( = ?auto_536824 ?auto_536828 ) ) ( not ( = ?auto_536824 ?auto_536829 ) ) ( not ( = ?auto_536824 ?auto_536830 ) ) ( not ( = ?auto_536824 ?auto_536831 ) ) ( not ( = ?auto_536824 ?auto_536832 ) ) ( not ( = ?auto_536824 ?auto_536833 ) ) ( not ( = ?auto_536825 ?auto_536826 ) ) ( not ( = ?auto_536825 ?auto_536827 ) ) ( not ( = ?auto_536825 ?auto_536828 ) ) ( not ( = ?auto_536825 ?auto_536829 ) ) ( not ( = ?auto_536825 ?auto_536830 ) ) ( not ( = ?auto_536825 ?auto_536831 ) ) ( not ( = ?auto_536825 ?auto_536832 ) ) ( not ( = ?auto_536825 ?auto_536833 ) ) ( not ( = ?auto_536826 ?auto_536827 ) ) ( not ( = ?auto_536826 ?auto_536828 ) ) ( not ( = ?auto_536826 ?auto_536829 ) ) ( not ( = ?auto_536826 ?auto_536830 ) ) ( not ( = ?auto_536826 ?auto_536831 ) ) ( not ( = ?auto_536826 ?auto_536832 ) ) ( not ( = ?auto_536826 ?auto_536833 ) ) ( not ( = ?auto_536827 ?auto_536828 ) ) ( not ( = ?auto_536827 ?auto_536829 ) ) ( not ( = ?auto_536827 ?auto_536830 ) ) ( not ( = ?auto_536827 ?auto_536831 ) ) ( not ( = ?auto_536827 ?auto_536832 ) ) ( not ( = ?auto_536827 ?auto_536833 ) ) ( not ( = ?auto_536828 ?auto_536829 ) ) ( not ( = ?auto_536828 ?auto_536830 ) ) ( not ( = ?auto_536828 ?auto_536831 ) ) ( not ( = ?auto_536828 ?auto_536832 ) ) ( not ( = ?auto_536828 ?auto_536833 ) ) ( not ( = ?auto_536829 ?auto_536830 ) ) ( not ( = ?auto_536829 ?auto_536831 ) ) ( not ( = ?auto_536829 ?auto_536832 ) ) ( not ( = ?auto_536829 ?auto_536833 ) ) ( not ( = ?auto_536830 ?auto_536831 ) ) ( not ( = ?auto_536830 ?auto_536832 ) ) ( not ( = ?auto_536830 ?auto_536833 ) ) ( not ( = ?auto_536831 ?auto_536832 ) ) ( not ( = ?auto_536831 ?auto_536833 ) ) ( not ( = ?auto_536832 ?auto_536833 ) ) ( ON ?auto_536831 ?auto_536832 ) ( CLEAR ?auto_536829 ) ( ON ?auto_536830 ?auto_536831 ) ( CLEAR ?auto_536830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_536820 ?auto_536821 ?auto_536822 ?auto_536823 ?auto_536824 ?auto_536825 ?auto_536826 ?auto_536827 ?auto_536828 ?auto_536829 ?auto_536830 )
      ( MAKE-13PILE ?auto_536820 ?auto_536821 ?auto_536822 ?auto_536823 ?auto_536824 ?auto_536825 ?auto_536826 ?auto_536827 ?auto_536828 ?auto_536829 ?auto_536830 ?auto_536831 ?auto_536832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536874 - BLOCK
      ?auto_536875 - BLOCK
      ?auto_536876 - BLOCK
      ?auto_536877 - BLOCK
      ?auto_536878 - BLOCK
      ?auto_536879 - BLOCK
      ?auto_536880 - BLOCK
      ?auto_536881 - BLOCK
      ?auto_536882 - BLOCK
      ?auto_536883 - BLOCK
      ?auto_536884 - BLOCK
      ?auto_536885 - BLOCK
      ?auto_536886 - BLOCK
    )
    :vars
    (
      ?auto_536887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536886 ?auto_536887 ) ( ON-TABLE ?auto_536874 ) ( ON ?auto_536875 ?auto_536874 ) ( ON ?auto_536876 ?auto_536875 ) ( ON ?auto_536877 ?auto_536876 ) ( ON ?auto_536878 ?auto_536877 ) ( ON ?auto_536879 ?auto_536878 ) ( ON ?auto_536880 ?auto_536879 ) ( ON ?auto_536881 ?auto_536880 ) ( ON ?auto_536882 ?auto_536881 ) ( not ( = ?auto_536874 ?auto_536875 ) ) ( not ( = ?auto_536874 ?auto_536876 ) ) ( not ( = ?auto_536874 ?auto_536877 ) ) ( not ( = ?auto_536874 ?auto_536878 ) ) ( not ( = ?auto_536874 ?auto_536879 ) ) ( not ( = ?auto_536874 ?auto_536880 ) ) ( not ( = ?auto_536874 ?auto_536881 ) ) ( not ( = ?auto_536874 ?auto_536882 ) ) ( not ( = ?auto_536874 ?auto_536883 ) ) ( not ( = ?auto_536874 ?auto_536884 ) ) ( not ( = ?auto_536874 ?auto_536885 ) ) ( not ( = ?auto_536874 ?auto_536886 ) ) ( not ( = ?auto_536874 ?auto_536887 ) ) ( not ( = ?auto_536875 ?auto_536876 ) ) ( not ( = ?auto_536875 ?auto_536877 ) ) ( not ( = ?auto_536875 ?auto_536878 ) ) ( not ( = ?auto_536875 ?auto_536879 ) ) ( not ( = ?auto_536875 ?auto_536880 ) ) ( not ( = ?auto_536875 ?auto_536881 ) ) ( not ( = ?auto_536875 ?auto_536882 ) ) ( not ( = ?auto_536875 ?auto_536883 ) ) ( not ( = ?auto_536875 ?auto_536884 ) ) ( not ( = ?auto_536875 ?auto_536885 ) ) ( not ( = ?auto_536875 ?auto_536886 ) ) ( not ( = ?auto_536875 ?auto_536887 ) ) ( not ( = ?auto_536876 ?auto_536877 ) ) ( not ( = ?auto_536876 ?auto_536878 ) ) ( not ( = ?auto_536876 ?auto_536879 ) ) ( not ( = ?auto_536876 ?auto_536880 ) ) ( not ( = ?auto_536876 ?auto_536881 ) ) ( not ( = ?auto_536876 ?auto_536882 ) ) ( not ( = ?auto_536876 ?auto_536883 ) ) ( not ( = ?auto_536876 ?auto_536884 ) ) ( not ( = ?auto_536876 ?auto_536885 ) ) ( not ( = ?auto_536876 ?auto_536886 ) ) ( not ( = ?auto_536876 ?auto_536887 ) ) ( not ( = ?auto_536877 ?auto_536878 ) ) ( not ( = ?auto_536877 ?auto_536879 ) ) ( not ( = ?auto_536877 ?auto_536880 ) ) ( not ( = ?auto_536877 ?auto_536881 ) ) ( not ( = ?auto_536877 ?auto_536882 ) ) ( not ( = ?auto_536877 ?auto_536883 ) ) ( not ( = ?auto_536877 ?auto_536884 ) ) ( not ( = ?auto_536877 ?auto_536885 ) ) ( not ( = ?auto_536877 ?auto_536886 ) ) ( not ( = ?auto_536877 ?auto_536887 ) ) ( not ( = ?auto_536878 ?auto_536879 ) ) ( not ( = ?auto_536878 ?auto_536880 ) ) ( not ( = ?auto_536878 ?auto_536881 ) ) ( not ( = ?auto_536878 ?auto_536882 ) ) ( not ( = ?auto_536878 ?auto_536883 ) ) ( not ( = ?auto_536878 ?auto_536884 ) ) ( not ( = ?auto_536878 ?auto_536885 ) ) ( not ( = ?auto_536878 ?auto_536886 ) ) ( not ( = ?auto_536878 ?auto_536887 ) ) ( not ( = ?auto_536879 ?auto_536880 ) ) ( not ( = ?auto_536879 ?auto_536881 ) ) ( not ( = ?auto_536879 ?auto_536882 ) ) ( not ( = ?auto_536879 ?auto_536883 ) ) ( not ( = ?auto_536879 ?auto_536884 ) ) ( not ( = ?auto_536879 ?auto_536885 ) ) ( not ( = ?auto_536879 ?auto_536886 ) ) ( not ( = ?auto_536879 ?auto_536887 ) ) ( not ( = ?auto_536880 ?auto_536881 ) ) ( not ( = ?auto_536880 ?auto_536882 ) ) ( not ( = ?auto_536880 ?auto_536883 ) ) ( not ( = ?auto_536880 ?auto_536884 ) ) ( not ( = ?auto_536880 ?auto_536885 ) ) ( not ( = ?auto_536880 ?auto_536886 ) ) ( not ( = ?auto_536880 ?auto_536887 ) ) ( not ( = ?auto_536881 ?auto_536882 ) ) ( not ( = ?auto_536881 ?auto_536883 ) ) ( not ( = ?auto_536881 ?auto_536884 ) ) ( not ( = ?auto_536881 ?auto_536885 ) ) ( not ( = ?auto_536881 ?auto_536886 ) ) ( not ( = ?auto_536881 ?auto_536887 ) ) ( not ( = ?auto_536882 ?auto_536883 ) ) ( not ( = ?auto_536882 ?auto_536884 ) ) ( not ( = ?auto_536882 ?auto_536885 ) ) ( not ( = ?auto_536882 ?auto_536886 ) ) ( not ( = ?auto_536882 ?auto_536887 ) ) ( not ( = ?auto_536883 ?auto_536884 ) ) ( not ( = ?auto_536883 ?auto_536885 ) ) ( not ( = ?auto_536883 ?auto_536886 ) ) ( not ( = ?auto_536883 ?auto_536887 ) ) ( not ( = ?auto_536884 ?auto_536885 ) ) ( not ( = ?auto_536884 ?auto_536886 ) ) ( not ( = ?auto_536884 ?auto_536887 ) ) ( not ( = ?auto_536885 ?auto_536886 ) ) ( not ( = ?auto_536885 ?auto_536887 ) ) ( not ( = ?auto_536886 ?auto_536887 ) ) ( ON ?auto_536885 ?auto_536886 ) ( ON ?auto_536884 ?auto_536885 ) ( CLEAR ?auto_536882 ) ( ON ?auto_536883 ?auto_536884 ) ( CLEAR ?auto_536883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_536874 ?auto_536875 ?auto_536876 ?auto_536877 ?auto_536878 ?auto_536879 ?auto_536880 ?auto_536881 ?auto_536882 ?auto_536883 )
      ( MAKE-13PILE ?auto_536874 ?auto_536875 ?auto_536876 ?auto_536877 ?auto_536878 ?auto_536879 ?auto_536880 ?auto_536881 ?auto_536882 ?auto_536883 ?auto_536884 ?auto_536885 ?auto_536886 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536928 - BLOCK
      ?auto_536929 - BLOCK
      ?auto_536930 - BLOCK
      ?auto_536931 - BLOCK
      ?auto_536932 - BLOCK
      ?auto_536933 - BLOCK
      ?auto_536934 - BLOCK
      ?auto_536935 - BLOCK
      ?auto_536936 - BLOCK
      ?auto_536937 - BLOCK
      ?auto_536938 - BLOCK
      ?auto_536939 - BLOCK
      ?auto_536940 - BLOCK
    )
    :vars
    (
      ?auto_536941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536940 ?auto_536941 ) ( ON-TABLE ?auto_536928 ) ( ON ?auto_536929 ?auto_536928 ) ( ON ?auto_536930 ?auto_536929 ) ( ON ?auto_536931 ?auto_536930 ) ( ON ?auto_536932 ?auto_536931 ) ( ON ?auto_536933 ?auto_536932 ) ( ON ?auto_536934 ?auto_536933 ) ( ON ?auto_536935 ?auto_536934 ) ( not ( = ?auto_536928 ?auto_536929 ) ) ( not ( = ?auto_536928 ?auto_536930 ) ) ( not ( = ?auto_536928 ?auto_536931 ) ) ( not ( = ?auto_536928 ?auto_536932 ) ) ( not ( = ?auto_536928 ?auto_536933 ) ) ( not ( = ?auto_536928 ?auto_536934 ) ) ( not ( = ?auto_536928 ?auto_536935 ) ) ( not ( = ?auto_536928 ?auto_536936 ) ) ( not ( = ?auto_536928 ?auto_536937 ) ) ( not ( = ?auto_536928 ?auto_536938 ) ) ( not ( = ?auto_536928 ?auto_536939 ) ) ( not ( = ?auto_536928 ?auto_536940 ) ) ( not ( = ?auto_536928 ?auto_536941 ) ) ( not ( = ?auto_536929 ?auto_536930 ) ) ( not ( = ?auto_536929 ?auto_536931 ) ) ( not ( = ?auto_536929 ?auto_536932 ) ) ( not ( = ?auto_536929 ?auto_536933 ) ) ( not ( = ?auto_536929 ?auto_536934 ) ) ( not ( = ?auto_536929 ?auto_536935 ) ) ( not ( = ?auto_536929 ?auto_536936 ) ) ( not ( = ?auto_536929 ?auto_536937 ) ) ( not ( = ?auto_536929 ?auto_536938 ) ) ( not ( = ?auto_536929 ?auto_536939 ) ) ( not ( = ?auto_536929 ?auto_536940 ) ) ( not ( = ?auto_536929 ?auto_536941 ) ) ( not ( = ?auto_536930 ?auto_536931 ) ) ( not ( = ?auto_536930 ?auto_536932 ) ) ( not ( = ?auto_536930 ?auto_536933 ) ) ( not ( = ?auto_536930 ?auto_536934 ) ) ( not ( = ?auto_536930 ?auto_536935 ) ) ( not ( = ?auto_536930 ?auto_536936 ) ) ( not ( = ?auto_536930 ?auto_536937 ) ) ( not ( = ?auto_536930 ?auto_536938 ) ) ( not ( = ?auto_536930 ?auto_536939 ) ) ( not ( = ?auto_536930 ?auto_536940 ) ) ( not ( = ?auto_536930 ?auto_536941 ) ) ( not ( = ?auto_536931 ?auto_536932 ) ) ( not ( = ?auto_536931 ?auto_536933 ) ) ( not ( = ?auto_536931 ?auto_536934 ) ) ( not ( = ?auto_536931 ?auto_536935 ) ) ( not ( = ?auto_536931 ?auto_536936 ) ) ( not ( = ?auto_536931 ?auto_536937 ) ) ( not ( = ?auto_536931 ?auto_536938 ) ) ( not ( = ?auto_536931 ?auto_536939 ) ) ( not ( = ?auto_536931 ?auto_536940 ) ) ( not ( = ?auto_536931 ?auto_536941 ) ) ( not ( = ?auto_536932 ?auto_536933 ) ) ( not ( = ?auto_536932 ?auto_536934 ) ) ( not ( = ?auto_536932 ?auto_536935 ) ) ( not ( = ?auto_536932 ?auto_536936 ) ) ( not ( = ?auto_536932 ?auto_536937 ) ) ( not ( = ?auto_536932 ?auto_536938 ) ) ( not ( = ?auto_536932 ?auto_536939 ) ) ( not ( = ?auto_536932 ?auto_536940 ) ) ( not ( = ?auto_536932 ?auto_536941 ) ) ( not ( = ?auto_536933 ?auto_536934 ) ) ( not ( = ?auto_536933 ?auto_536935 ) ) ( not ( = ?auto_536933 ?auto_536936 ) ) ( not ( = ?auto_536933 ?auto_536937 ) ) ( not ( = ?auto_536933 ?auto_536938 ) ) ( not ( = ?auto_536933 ?auto_536939 ) ) ( not ( = ?auto_536933 ?auto_536940 ) ) ( not ( = ?auto_536933 ?auto_536941 ) ) ( not ( = ?auto_536934 ?auto_536935 ) ) ( not ( = ?auto_536934 ?auto_536936 ) ) ( not ( = ?auto_536934 ?auto_536937 ) ) ( not ( = ?auto_536934 ?auto_536938 ) ) ( not ( = ?auto_536934 ?auto_536939 ) ) ( not ( = ?auto_536934 ?auto_536940 ) ) ( not ( = ?auto_536934 ?auto_536941 ) ) ( not ( = ?auto_536935 ?auto_536936 ) ) ( not ( = ?auto_536935 ?auto_536937 ) ) ( not ( = ?auto_536935 ?auto_536938 ) ) ( not ( = ?auto_536935 ?auto_536939 ) ) ( not ( = ?auto_536935 ?auto_536940 ) ) ( not ( = ?auto_536935 ?auto_536941 ) ) ( not ( = ?auto_536936 ?auto_536937 ) ) ( not ( = ?auto_536936 ?auto_536938 ) ) ( not ( = ?auto_536936 ?auto_536939 ) ) ( not ( = ?auto_536936 ?auto_536940 ) ) ( not ( = ?auto_536936 ?auto_536941 ) ) ( not ( = ?auto_536937 ?auto_536938 ) ) ( not ( = ?auto_536937 ?auto_536939 ) ) ( not ( = ?auto_536937 ?auto_536940 ) ) ( not ( = ?auto_536937 ?auto_536941 ) ) ( not ( = ?auto_536938 ?auto_536939 ) ) ( not ( = ?auto_536938 ?auto_536940 ) ) ( not ( = ?auto_536938 ?auto_536941 ) ) ( not ( = ?auto_536939 ?auto_536940 ) ) ( not ( = ?auto_536939 ?auto_536941 ) ) ( not ( = ?auto_536940 ?auto_536941 ) ) ( ON ?auto_536939 ?auto_536940 ) ( ON ?auto_536938 ?auto_536939 ) ( ON ?auto_536937 ?auto_536938 ) ( CLEAR ?auto_536935 ) ( ON ?auto_536936 ?auto_536937 ) ( CLEAR ?auto_536936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_536928 ?auto_536929 ?auto_536930 ?auto_536931 ?auto_536932 ?auto_536933 ?auto_536934 ?auto_536935 ?auto_536936 )
      ( MAKE-13PILE ?auto_536928 ?auto_536929 ?auto_536930 ?auto_536931 ?auto_536932 ?auto_536933 ?auto_536934 ?auto_536935 ?auto_536936 ?auto_536937 ?auto_536938 ?auto_536939 ?auto_536940 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_536982 - BLOCK
      ?auto_536983 - BLOCK
      ?auto_536984 - BLOCK
      ?auto_536985 - BLOCK
      ?auto_536986 - BLOCK
      ?auto_536987 - BLOCK
      ?auto_536988 - BLOCK
      ?auto_536989 - BLOCK
      ?auto_536990 - BLOCK
      ?auto_536991 - BLOCK
      ?auto_536992 - BLOCK
      ?auto_536993 - BLOCK
      ?auto_536994 - BLOCK
    )
    :vars
    (
      ?auto_536995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_536994 ?auto_536995 ) ( ON-TABLE ?auto_536982 ) ( ON ?auto_536983 ?auto_536982 ) ( ON ?auto_536984 ?auto_536983 ) ( ON ?auto_536985 ?auto_536984 ) ( ON ?auto_536986 ?auto_536985 ) ( ON ?auto_536987 ?auto_536986 ) ( ON ?auto_536988 ?auto_536987 ) ( not ( = ?auto_536982 ?auto_536983 ) ) ( not ( = ?auto_536982 ?auto_536984 ) ) ( not ( = ?auto_536982 ?auto_536985 ) ) ( not ( = ?auto_536982 ?auto_536986 ) ) ( not ( = ?auto_536982 ?auto_536987 ) ) ( not ( = ?auto_536982 ?auto_536988 ) ) ( not ( = ?auto_536982 ?auto_536989 ) ) ( not ( = ?auto_536982 ?auto_536990 ) ) ( not ( = ?auto_536982 ?auto_536991 ) ) ( not ( = ?auto_536982 ?auto_536992 ) ) ( not ( = ?auto_536982 ?auto_536993 ) ) ( not ( = ?auto_536982 ?auto_536994 ) ) ( not ( = ?auto_536982 ?auto_536995 ) ) ( not ( = ?auto_536983 ?auto_536984 ) ) ( not ( = ?auto_536983 ?auto_536985 ) ) ( not ( = ?auto_536983 ?auto_536986 ) ) ( not ( = ?auto_536983 ?auto_536987 ) ) ( not ( = ?auto_536983 ?auto_536988 ) ) ( not ( = ?auto_536983 ?auto_536989 ) ) ( not ( = ?auto_536983 ?auto_536990 ) ) ( not ( = ?auto_536983 ?auto_536991 ) ) ( not ( = ?auto_536983 ?auto_536992 ) ) ( not ( = ?auto_536983 ?auto_536993 ) ) ( not ( = ?auto_536983 ?auto_536994 ) ) ( not ( = ?auto_536983 ?auto_536995 ) ) ( not ( = ?auto_536984 ?auto_536985 ) ) ( not ( = ?auto_536984 ?auto_536986 ) ) ( not ( = ?auto_536984 ?auto_536987 ) ) ( not ( = ?auto_536984 ?auto_536988 ) ) ( not ( = ?auto_536984 ?auto_536989 ) ) ( not ( = ?auto_536984 ?auto_536990 ) ) ( not ( = ?auto_536984 ?auto_536991 ) ) ( not ( = ?auto_536984 ?auto_536992 ) ) ( not ( = ?auto_536984 ?auto_536993 ) ) ( not ( = ?auto_536984 ?auto_536994 ) ) ( not ( = ?auto_536984 ?auto_536995 ) ) ( not ( = ?auto_536985 ?auto_536986 ) ) ( not ( = ?auto_536985 ?auto_536987 ) ) ( not ( = ?auto_536985 ?auto_536988 ) ) ( not ( = ?auto_536985 ?auto_536989 ) ) ( not ( = ?auto_536985 ?auto_536990 ) ) ( not ( = ?auto_536985 ?auto_536991 ) ) ( not ( = ?auto_536985 ?auto_536992 ) ) ( not ( = ?auto_536985 ?auto_536993 ) ) ( not ( = ?auto_536985 ?auto_536994 ) ) ( not ( = ?auto_536985 ?auto_536995 ) ) ( not ( = ?auto_536986 ?auto_536987 ) ) ( not ( = ?auto_536986 ?auto_536988 ) ) ( not ( = ?auto_536986 ?auto_536989 ) ) ( not ( = ?auto_536986 ?auto_536990 ) ) ( not ( = ?auto_536986 ?auto_536991 ) ) ( not ( = ?auto_536986 ?auto_536992 ) ) ( not ( = ?auto_536986 ?auto_536993 ) ) ( not ( = ?auto_536986 ?auto_536994 ) ) ( not ( = ?auto_536986 ?auto_536995 ) ) ( not ( = ?auto_536987 ?auto_536988 ) ) ( not ( = ?auto_536987 ?auto_536989 ) ) ( not ( = ?auto_536987 ?auto_536990 ) ) ( not ( = ?auto_536987 ?auto_536991 ) ) ( not ( = ?auto_536987 ?auto_536992 ) ) ( not ( = ?auto_536987 ?auto_536993 ) ) ( not ( = ?auto_536987 ?auto_536994 ) ) ( not ( = ?auto_536987 ?auto_536995 ) ) ( not ( = ?auto_536988 ?auto_536989 ) ) ( not ( = ?auto_536988 ?auto_536990 ) ) ( not ( = ?auto_536988 ?auto_536991 ) ) ( not ( = ?auto_536988 ?auto_536992 ) ) ( not ( = ?auto_536988 ?auto_536993 ) ) ( not ( = ?auto_536988 ?auto_536994 ) ) ( not ( = ?auto_536988 ?auto_536995 ) ) ( not ( = ?auto_536989 ?auto_536990 ) ) ( not ( = ?auto_536989 ?auto_536991 ) ) ( not ( = ?auto_536989 ?auto_536992 ) ) ( not ( = ?auto_536989 ?auto_536993 ) ) ( not ( = ?auto_536989 ?auto_536994 ) ) ( not ( = ?auto_536989 ?auto_536995 ) ) ( not ( = ?auto_536990 ?auto_536991 ) ) ( not ( = ?auto_536990 ?auto_536992 ) ) ( not ( = ?auto_536990 ?auto_536993 ) ) ( not ( = ?auto_536990 ?auto_536994 ) ) ( not ( = ?auto_536990 ?auto_536995 ) ) ( not ( = ?auto_536991 ?auto_536992 ) ) ( not ( = ?auto_536991 ?auto_536993 ) ) ( not ( = ?auto_536991 ?auto_536994 ) ) ( not ( = ?auto_536991 ?auto_536995 ) ) ( not ( = ?auto_536992 ?auto_536993 ) ) ( not ( = ?auto_536992 ?auto_536994 ) ) ( not ( = ?auto_536992 ?auto_536995 ) ) ( not ( = ?auto_536993 ?auto_536994 ) ) ( not ( = ?auto_536993 ?auto_536995 ) ) ( not ( = ?auto_536994 ?auto_536995 ) ) ( ON ?auto_536993 ?auto_536994 ) ( ON ?auto_536992 ?auto_536993 ) ( ON ?auto_536991 ?auto_536992 ) ( ON ?auto_536990 ?auto_536991 ) ( CLEAR ?auto_536988 ) ( ON ?auto_536989 ?auto_536990 ) ( CLEAR ?auto_536989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_536982 ?auto_536983 ?auto_536984 ?auto_536985 ?auto_536986 ?auto_536987 ?auto_536988 ?auto_536989 )
      ( MAKE-13PILE ?auto_536982 ?auto_536983 ?auto_536984 ?auto_536985 ?auto_536986 ?auto_536987 ?auto_536988 ?auto_536989 ?auto_536990 ?auto_536991 ?auto_536992 ?auto_536993 ?auto_536994 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537036 - BLOCK
      ?auto_537037 - BLOCK
      ?auto_537038 - BLOCK
      ?auto_537039 - BLOCK
      ?auto_537040 - BLOCK
      ?auto_537041 - BLOCK
      ?auto_537042 - BLOCK
      ?auto_537043 - BLOCK
      ?auto_537044 - BLOCK
      ?auto_537045 - BLOCK
      ?auto_537046 - BLOCK
      ?auto_537047 - BLOCK
      ?auto_537048 - BLOCK
    )
    :vars
    (
      ?auto_537049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537048 ?auto_537049 ) ( ON-TABLE ?auto_537036 ) ( ON ?auto_537037 ?auto_537036 ) ( ON ?auto_537038 ?auto_537037 ) ( ON ?auto_537039 ?auto_537038 ) ( ON ?auto_537040 ?auto_537039 ) ( ON ?auto_537041 ?auto_537040 ) ( not ( = ?auto_537036 ?auto_537037 ) ) ( not ( = ?auto_537036 ?auto_537038 ) ) ( not ( = ?auto_537036 ?auto_537039 ) ) ( not ( = ?auto_537036 ?auto_537040 ) ) ( not ( = ?auto_537036 ?auto_537041 ) ) ( not ( = ?auto_537036 ?auto_537042 ) ) ( not ( = ?auto_537036 ?auto_537043 ) ) ( not ( = ?auto_537036 ?auto_537044 ) ) ( not ( = ?auto_537036 ?auto_537045 ) ) ( not ( = ?auto_537036 ?auto_537046 ) ) ( not ( = ?auto_537036 ?auto_537047 ) ) ( not ( = ?auto_537036 ?auto_537048 ) ) ( not ( = ?auto_537036 ?auto_537049 ) ) ( not ( = ?auto_537037 ?auto_537038 ) ) ( not ( = ?auto_537037 ?auto_537039 ) ) ( not ( = ?auto_537037 ?auto_537040 ) ) ( not ( = ?auto_537037 ?auto_537041 ) ) ( not ( = ?auto_537037 ?auto_537042 ) ) ( not ( = ?auto_537037 ?auto_537043 ) ) ( not ( = ?auto_537037 ?auto_537044 ) ) ( not ( = ?auto_537037 ?auto_537045 ) ) ( not ( = ?auto_537037 ?auto_537046 ) ) ( not ( = ?auto_537037 ?auto_537047 ) ) ( not ( = ?auto_537037 ?auto_537048 ) ) ( not ( = ?auto_537037 ?auto_537049 ) ) ( not ( = ?auto_537038 ?auto_537039 ) ) ( not ( = ?auto_537038 ?auto_537040 ) ) ( not ( = ?auto_537038 ?auto_537041 ) ) ( not ( = ?auto_537038 ?auto_537042 ) ) ( not ( = ?auto_537038 ?auto_537043 ) ) ( not ( = ?auto_537038 ?auto_537044 ) ) ( not ( = ?auto_537038 ?auto_537045 ) ) ( not ( = ?auto_537038 ?auto_537046 ) ) ( not ( = ?auto_537038 ?auto_537047 ) ) ( not ( = ?auto_537038 ?auto_537048 ) ) ( not ( = ?auto_537038 ?auto_537049 ) ) ( not ( = ?auto_537039 ?auto_537040 ) ) ( not ( = ?auto_537039 ?auto_537041 ) ) ( not ( = ?auto_537039 ?auto_537042 ) ) ( not ( = ?auto_537039 ?auto_537043 ) ) ( not ( = ?auto_537039 ?auto_537044 ) ) ( not ( = ?auto_537039 ?auto_537045 ) ) ( not ( = ?auto_537039 ?auto_537046 ) ) ( not ( = ?auto_537039 ?auto_537047 ) ) ( not ( = ?auto_537039 ?auto_537048 ) ) ( not ( = ?auto_537039 ?auto_537049 ) ) ( not ( = ?auto_537040 ?auto_537041 ) ) ( not ( = ?auto_537040 ?auto_537042 ) ) ( not ( = ?auto_537040 ?auto_537043 ) ) ( not ( = ?auto_537040 ?auto_537044 ) ) ( not ( = ?auto_537040 ?auto_537045 ) ) ( not ( = ?auto_537040 ?auto_537046 ) ) ( not ( = ?auto_537040 ?auto_537047 ) ) ( not ( = ?auto_537040 ?auto_537048 ) ) ( not ( = ?auto_537040 ?auto_537049 ) ) ( not ( = ?auto_537041 ?auto_537042 ) ) ( not ( = ?auto_537041 ?auto_537043 ) ) ( not ( = ?auto_537041 ?auto_537044 ) ) ( not ( = ?auto_537041 ?auto_537045 ) ) ( not ( = ?auto_537041 ?auto_537046 ) ) ( not ( = ?auto_537041 ?auto_537047 ) ) ( not ( = ?auto_537041 ?auto_537048 ) ) ( not ( = ?auto_537041 ?auto_537049 ) ) ( not ( = ?auto_537042 ?auto_537043 ) ) ( not ( = ?auto_537042 ?auto_537044 ) ) ( not ( = ?auto_537042 ?auto_537045 ) ) ( not ( = ?auto_537042 ?auto_537046 ) ) ( not ( = ?auto_537042 ?auto_537047 ) ) ( not ( = ?auto_537042 ?auto_537048 ) ) ( not ( = ?auto_537042 ?auto_537049 ) ) ( not ( = ?auto_537043 ?auto_537044 ) ) ( not ( = ?auto_537043 ?auto_537045 ) ) ( not ( = ?auto_537043 ?auto_537046 ) ) ( not ( = ?auto_537043 ?auto_537047 ) ) ( not ( = ?auto_537043 ?auto_537048 ) ) ( not ( = ?auto_537043 ?auto_537049 ) ) ( not ( = ?auto_537044 ?auto_537045 ) ) ( not ( = ?auto_537044 ?auto_537046 ) ) ( not ( = ?auto_537044 ?auto_537047 ) ) ( not ( = ?auto_537044 ?auto_537048 ) ) ( not ( = ?auto_537044 ?auto_537049 ) ) ( not ( = ?auto_537045 ?auto_537046 ) ) ( not ( = ?auto_537045 ?auto_537047 ) ) ( not ( = ?auto_537045 ?auto_537048 ) ) ( not ( = ?auto_537045 ?auto_537049 ) ) ( not ( = ?auto_537046 ?auto_537047 ) ) ( not ( = ?auto_537046 ?auto_537048 ) ) ( not ( = ?auto_537046 ?auto_537049 ) ) ( not ( = ?auto_537047 ?auto_537048 ) ) ( not ( = ?auto_537047 ?auto_537049 ) ) ( not ( = ?auto_537048 ?auto_537049 ) ) ( ON ?auto_537047 ?auto_537048 ) ( ON ?auto_537046 ?auto_537047 ) ( ON ?auto_537045 ?auto_537046 ) ( ON ?auto_537044 ?auto_537045 ) ( ON ?auto_537043 ?auto_537044 ) ( CLEAR ?auto_537041 ) ( ON ?auto_537042 ?auto_537043 ) ( CLEAR ?auto_537042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_537036 ?auto_537037 ?auto_537038 ?auto_537039 ?auto_537040 ?auto_537041 ?auto_537042 )
      ( MAKE-13PILE ?auto_537036 ?auto_537037 ?auto_537038 ?auto_537039 ?auto_537040 ?auto_537041 ?auto_537042 ?auto_537043 ?auto_537044 ?auto_537045 ?auto_537046 ?auto_537047 ?auto_537048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537090 - BLOCK
      ?auto_537091 - BLOCK
      ?auto_537092 - BLOCK
      ?auto_537093 - BLOCK
      ?auto_537094 - BLOCK
      ?auto_537095 - BLOCK
      ?auto_537096 - BLOCK
      ?auto_537097 - BLOCK
      ?auto_537098 - BLOCK
      ?auto_537099 - BLOCK
      ?auto_537100 - BLOCK
      ?auto_537101 - BLOCK
      ?auto_537102 - BLOCK
    )
    :vars
    (
      ?auto_537103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537102 ?auto_537103 ) ( ON-TABLE ?auto_537090 ) ( ON ?auto_537091 ?auto_537090 ) ( ON ?auto_537092 ?auto_537091 ) ( ON ?auto_537093 ?auto_537092 ) ( ON ?auto_537094 ?auto_537093 ) ( not ( = ?auto_537090 ?auto_537091 ) ) ( not ( = ?auto_537090 ?auto_537092 ) ) ( not ( = ?auto_537090 ?auto_537093 ) ) ( not ( = ?auto_537090 ?auto_537094 ) ) ( not ( = ?auto_537090 ?auto_537095 ) ) ( not ( = ?auto_537090 ?auto_537096 ) ) ( not ( = ?auto_537090 ?auto_537097 ) ) ( not ( = ?auto_537090 ?auto_537098 ) ) ( not ( = ?auto_537090 ?auto_537099 ) ) ( not ( = ?auto_537090 ?auto_537100 ) ) ( not ( = ?auto_537090 ?auto_537101 ) ) ( not ( = ?auto_537090 ?auto_537102 ) ) ( not ( = ?auto_537090 ?auto_537103 ) ) ( not ( = ?auto_537091 ?auto_537092 ) ) ( not ( = ?auto_537091 ?auto_537093 ) ) ( not ( = ?auto_537091 ?auto_537094 ) ) ( not ( = ?auto_537091 ?auto_537095 ) ) ( not ( = ?auto_537091 ?auto_537096 ) ) ( not ( = ?auto_537091 ?auto_537097 ) ) ( not ( = ?auto_537091 ?auto_537098 ) ) ( not ( = ?auto_537091 ?auto_537099 ) ) ( not ( = ?auto_537091 ?auto_537100 ) ) ( not ( = ?auto_537091 ?auto_537101 ) ) ( not ( = ?auto_537091 ?auto_537102 ) ) ( not ( = ?auto_537091 ?auto_537103 ) ) ( not ( = ?auto_537092 ?auto_537093 ) ) ( not ( = ?auto_537092 ?auto_537094 ) ) ( not ( = ?auto_537092 ?auto_537095 ) ) ( not ( = ?auto_537092 ?auto_537096 ) ) ( not ( = ?auto_537092 ?auto_537097 ) ) ( not ( = ?auto_537092 ?auto_537098 ) ) ( not ( = ?auto_537092 ?auto_537099 ) ) ( not ( = ?auto_537092 ?auto_537100 ) ) ( not ( = ?auto_537092 ?auto_537101 ) ) ( not ( = ?auto_537092 ?auto_537102 ) ) ( not ( = ?auto_537092 ?auto_537103 ) ) ( not ( = ?auto_537093 ?auto_537094 ) ) ( not ( = ?auto_537093 ?auto_537095 ) ) ( not ( = ?auto_537093 ?auto_537096 ) ) ( not ( = ?auto_537093 ?auto_537097 ) ) ( not ( = ?auto_537093 ?auto_537098 ) ) ( not ( = ?auto_537093 ?auto_537099 ) ) ( not ( = ?auto_537093 ?auto_537100 ) ) ( not ( = ?auto_537093 ?auto_537101 ) ) ( not ( = ?auto_537093 ?auto_537102 ) ) ( not ( = ?auto_537093 ?auto_537103 ) ) ( not ( = ?auto_537094 ?auto_537095 ) ) ( not ( = ?auto_537094 ?auto_537096 ) ) ( not ( = ?auto_537094 ?auto_537097 ) ) ( not ( = ?auto_537094 ?auto_537098 ) ) ( not ( = ?auto_537094 ?auto_537099 ) ) ( not ( = ?auto_537094 ?auto_537100 ) ) ( not ( = ?auto_537094 ?auto_537101 ) ) ( not ( = ?auto_537094 ?auto_537102 ) ) ( not ( = ?auto_537094 ?auto_537103 ) ) ( not ( = ?auto_537095 ?auto_537096 ) ) ( not ( = ?auto_537095 ?auto_537097 ) ) ( not ( = ?auto_537095 ?auto_537098 ) ) ( not ( = ?auto_537095 ?auto_537099 ) ) ( not ( = ?auto_537095 ?auto_537100 ) ) ( not ( = ?auto_537095 ?auto_537101 ) ) ( not ( = ?auto_537095 ?auto_537102 ) ) ( not ( = ?auto_537095 ?auto_537103 ) ) ( not ( = ?auto_537096 ?auto_537097 ) ) ( not ( = ?auto_537096 ?auto_537098 ) ) ( not ( = ?auto_537096 ?auto_537099 ) ) ( not ( = ?auto_537096 ?auto_537100 ) ) ( not ( = ?auto_537096 ?auto_537101 ) ) ( not ( = ?auto_537096 ?auto_537102 ) ) ( not ( = ?auto_537096 ?auto_537103 ) ) ( not ( = ?auto_537097 ?auto_537098 ) ) ( not ( = ?auto_537097 ?auto_537099 ) ) ( not ( = ?auto_537097 ?auto_537100 ) ) ( not ( = ?auto_537097 ?auto_537101 ) ) ( not ( = ?auto_537097 ?auto_537102 ) ) ( not ( = ?auto_537097 ?auto_537103 ) ) ( not ( = ?auto_537098 ?auto_537099 ) ) ( not ( = ?auto_537098 ?auto_537100 ) ) ( not ( = ?auto_537098 ?auto_537101 ) ) ( not ( = ?auto_537098 ?auto_537102 ) ) ( not ( = ?auto_537098 ?auto_537103 ) ) ( not ( = ?auto_537099 ?auto_537100 ) ) ( not ( = ?auto_537099 ?auto_537101 ) ) ( not ( = ?auto_537099 ?auto_537102 ) ) ( not ( = ?auto_537099 ?auto_537103 ) ) ( not ( = ?auto_537100 ?auto_537101 ) ) ( not ( = ?auto_537100 ?auto_537102 ) ) ( not ( = ?auto_537100 ?auto_537103 ) ) ( not ( = ?auto_537101 ?auto_537102 ) ) ( not ( = ?auto_537101 ?auto_537103 ) ) ( not ( = ?auto_537102 ?auto_537103 ) ) ( ON ?auto_537101 ?auto_537102 ) ( ON ?auto_537100 ?auto_537101 ) ( ON ?auto_537099 ?auto_537100 ) ( ON ?auto_537098 ?auto_537099 ) ( ON ?auto_537097 ?auto_537098 ) ( ON ?auto_537096 ?auto_537097 ) ( CLEAR ?auto_537094 ) ( ON ?auto_537095 ?auto_537096 ) ( CLEAR ?auto_537095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_537090 ?auto_537091 ?auto_537092 ?auto_537093 ?auto_537094 ?auto_537095 )
      ( MAKE-13PILE ?auto_537090 ?auto_537091 ?auto_537092 ?auto_537093 ?auto_537094 ?auto_537095 ?auto_537096 ?auto_537097 ?auto_537098 ?auto_537099 ?auto_537100 ?auto_537101 ?auto_537102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537144 - BLOCK
      ?auto_537145 - BLOCK
      ?auto_537146 - BLOCK
      ?auto_537147 - BLOCK
      ?auto_537148 - BLOCK
      ?auto_537149 - BLOCK
      ?auto_537150 - BLOCK
      ?auto_537151 - BLOCK
      ?auto_537152 - BLOCK
      ?auto_537153 - BLOCK
      ?auto_537154 - BLOCK
      ?auto_537155 - BLOCK
      ?auto_537156 - BLOCK
    )
    :vars
    (
      ?auto_537157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537156 ?auto_537157 ) ( ON-TABLE ?auto_537144 ) ( ON ?auto_537145 ?auto_537144 ) ( ON ?auto_537146 ?auto_537145 ) ( ON ?auto_537147 ?auto_537146 ) ( not ( = ?auto_537144 ?auto_537145 ) ) ( not ( = ?auto_537144 ?auto_537146 ) ) ( not ( = ?auto_537144 ?auto_537147 ) ) ( not ( = ?auto_537144 ?auto_537148 ) ) ( not ( = ?auto_537144 ?auto_537149 ) ) ( not ( = ?auto_537144 ?auto_537150 ) ) ( not ( = ?auto_537144 ?auto_537151 ) ) ( not ( = ?auto_537144 ?auto_537152 ) ) ( not ( = ?auto_537144 ?auto_537153 ) ) ( not ( = ?auto_537144 ?auto_537154 ) ) ( not ( = ?auto_537144 ?auto_537155 ) ) ( not ( = ?auto_537144 ?auto_537156 ) ) ( not ( = ?auto_537144 ?auto_537157 ) ) ( not ( = ?auto_537145 ?auto_537146 ) ) ( not ( = ?auto_537145 ?auto_537147 ) ) ( not ( = ?auto_537145 ?auto_537148 ) ) ( not ( = ?auto_537145 ?auto_537149 ) ) ( not ( = ?auto_537145 ?auto_537150 ) ) ( not ( = ?auto_537145 ?auto_537151 ) ) ( not ( = ?auto_537145 ?auto_537152 ) ) ( not ( = ?auto_537145 ?auto_537153 ) ) ( not ( = ?auto_537145 ?auto_537154 ) ) ( not ( = ?auto_537145 ?auto_537155 ) ) ( not ( = ?auto_537145 ?auto_537156 ) ) ( not ( = ?auto_537145 ?auto_537157 ) ) ( not ( = ?auto_537146 ?auto_537147 ) ) ( not ( = ?auto_537146 ?auto_537148 ) ) ( not ( = ?auto_537146 ?auto_537149 ) ) ( not ( = ?auto_537146 ?auto_537150 ) ) ( not ( = ?auto_537146 ?auto_537151 ) ) ( not ( = ?auto_537146 ?auto_537152 ) ) ( not ( = ?auto_537146 ?auto_537153 ) ) ( not ( = ?auto_537146 ?auto_537154 ) ) ( not ( = ?auto_537146 ?auto_537155 ) ) ( not ( = ?auto_537146 ?auto_537156 ) ) ( not ( = ?auto_537146 ?auto_537157 ) ) ( not ( = ?auto_537147 ?auto_537148 ) ) ( not ( = ?auto_537147 ?auto_537149 ) ) ( not ( = ?auto_537147 ?auto_537150 ) ) ( not ( = ?auto_537147 ?auto_537151 ) ) ( not ( = ?auto_537147 ?auto_537152 ) ) ( not ( = ?auto_537147 ?auto_537153 ) ) ( not ( = ?auto_537147 ?auto_537154 ) ) ( not ( = ?auto_537147 ?auto_537155 ) ) ( not ( = ?auto_537147 ?auto_537156 ) ) ( not ( = ?auto_537147 ?auto_537157 ) ) ( not ( = ?auto_537148 ?auto_537149 ) ) ( not ( = ?auto_537148 ?auto_537150 ) ) ( not ( = ?auto_537148 ?auto_537151 ) ) ( not ( = ?auto_537148 ?auto_537152 ) ) ( not ( = ?auto_537148 ?auto_537153 ) ) ( not ( = ?auto_537148 ?auto_537154 ) ) ( not ( = ?auto_537148 ?auto_537155 ) ) ( not ( = ?auto_537148 ?auto_537156 ) ) ( not ( = ?auto_537148 ?auto_537157 ) ) ( not ( = ?auto_537149 ?auto_537150 ) ) ( not ( = ?auto_537149 ?auto_537151 ) ) ( not ( = ?auto_537149 ?auto_537152 ) ) ( not ( = ?auto_537149 ?auto_537153 ) ) ( not ( = ?auto_537149 ?auto_537154 ) ) ( not ( = ?auto_537149 ?auto_537155 ) ) ( not ( = ?auto_537149 ?auto_537156 ) ) ( not ( = ?auto_537149 ?auto_537157 ) ) ( not ( = ?auto_537150 ?auto_537151 ) ) ( not ( = ?auto_537150 ?auto_537152 ) ) ( not ( = ?auto_537150 ?auto_537153 ) ) ( not ( = ?auto_537150 ?auto_537154 ) ) ( not ( = ?auto_537150 ?auto_537155 ) ) ( not ( = ?auto_537150 ?auto_537156 ) ) ( not ( = ?auto_537150 ?auto_537157 ) ) ( not ( = ?auto_537151 ?auto_537152 ) ) ( not ( = ?auto_537151 ?auto_537153 ) ) ( not ( = ?auto_537151 ?auto_537154 ) ) ( not ( = ?auto_537151 ?auto_537155 ) ) ( not ( = ?auto_537151 ?auto_537156 ) ) ( not ( = ?auto_537151 ?auto_537157 ) ) ( not ( = ?auto_537152 ?auto_537153 ) ) ( not ( = ?auto_537152 ?auto_537154 ) ) ( not ( = ?auto_537152 ?auto_537155 ) ) ( not ( = ?auto_537152 ?auto_537156 ) ) ( not ( = ?auto_537152 ?auto_537157 ) ) ( not ( = ?auto_537153 ?auto_537154 ) ) ( not ( = ?auto_537153 ?auto_537155 ) ) ( not ( = ?auto_537153 ?auto_537156 ) ) ( not ( = ?auto_537153 ?auto_537157 ) ) ( not ( = ?auto_537154 ?auto_537155 ) ) ( not ( = ?auto_537154 ?auto_537156 ) ) ( not ( = ?auto_537154 ?auto_537157 ) ) ( not ( = ?auto_537155 ?auto_537156 ) ) ( not ( = ?auto_537155 ?auto_537157 ) ) ( not ( = ?auto_537156 ?auto_537157 ) ) ( ON ?auto_537155 ?auto_537156 ) ( ON ?auto_537154 ?auto_537155 ) ( ON ?auto_537153 ?auto_537154 ) ( ON ?auto_537152 ?auto_537153 ) ( ON ?auto_537151 ?auto_537152 ) ( ON ?auto_537150 ?auto_537151 ) ( ON ?auto_537149 ?auto_537150 ) ( CLEAR ?auto_537147 ) ( ON ?auto_537148 ?auto_537149 ) ( CLEAR ?auto_537148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_537144 ?auto_537145 ?auto_537146 ?auto_537147 ?auto_537148 )
      ( MAKE-13PILE ?auto_537144 ?auto_537145 ?auto_537146 ?auto_537147 ?auto_537148 ?auto_537149 ?auto_537150 ?auto_537151 ?auto_537152 ?auto_537153 ?auto_537154 ?auto_537155 ?auto_537156 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537198 - BLOCK
      ?auto_537199 - BLOCK
      ?auto_537200 - BLOCK
      ?auto_537201 - BLOCK
      ?auto_537202 - BLOCK
      ?auto_537203 - BLOCK
      ?auto_537204 - BLOCK
      ?auto_537205 - BLOCK
      ?auto_537206 - BLOCK
      ?auto_537207 - BLOCK
      ?auto_537208 - BLOCK
      ?auto_537209 - BLOCK
      ?auto_537210 - BLOCK
    )
    :vars
    (
      ?auto_537211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537210 ?auto_537211 ) ( ON-TABLE ?auto_537198 ) ( ON ?auto_537199 ?auto_537198 ) ( ON ?auto_537200 ?auto_537199 ) ( not ( = ?auto_537198 ?auto_537199 ) ) ( not ( = ?auto_537198 ?auto_537200 ) ) ( not ( = ?auto_537198 ?auto_537201 ) ) ( not ( = ?auto_537198 ?auto_537202 ) ) ( not ( = ?auto_537198 ?auto_537203 ) ) ( not ( = ?auto_537198 ?auto_537204 ) ) ( not ( = ?auto_537198 ?auto_537205 ) ) ( not ( = ?auto_537198 ?auto_537206 ) ) ( not ( = ?auto_537198 ?auto_537207 ) ) ( not ( = ?auto_537198 ?auto_537208 ) ) ( not ( = ?auto_537198 ?auto_537209 ) ) ( not ( = ?auto_537198 ?auto_537210 ) ) ( not ( = ?auto_537198 ?auto_537211 ) ) ( not ( = ?auto_537199 ?auto_537200 ) ) ( not ( = ?auto_537199 ?auto_537201 ) ) ( not ( = ?auto_537199 ?auto_537202 ) ) ( not ( = ?auto_537199 ?auto_537203 ) ) ( not ( = ?auto_537199 ?auto_537204 ) ) ( not ( = ?auto_537199 ?auto_537205 ) ) ( not ( = ?auto_537199 ?auto_537206 ) ) ( not ( = ?auto_537199 ?auto_537207 ) ) ( not ( = ?auto_537199 ?auto_537208 ) ) ( not ( = ?auto_537199 ?auto_537209 ) ) ( not ( = ?auto_537199 ?auto_537210 ) ) ( not ( = ?auto_537199 ?auto_537211 ) ) ( not ( = ?auto_537200 ?auto_537201 ) ) ( not ( = ?auto_537200 ?auto_537202 ) ) ( not ( = ?auto_537200 ?auto_537203 ) ) ( not ( = ?auto_537200 ?auto_537204 ) ) ( not ( = ?auto_537200 ?auto_537205 ) ) ( not ( = ?auto_537200 ?auto_537206 ) ) ( not ( = ?auto_537200 ?auto_537207 ) ) ( not ( = ?auto_537200 ?auto_537208 ) ) ( not ( = ?auto_537200 ?auto_537209 ) ) ( not ( = ?auto_537200 ?auto_537210 ) ) ( not ( = ?auto_537200 ?auto_537211 ) ) ( not ( = ?auto_537201 ?auto_537202 ) ) ( not ( = ?auto_537201 ?auto_537203 ) ) ( not ( = ?auto_537201 ?auto_537204 ) ) ( not ( = ?auto_537201 ?auto_537205 ) ) ( not ( = ?auto_537201 ?auto_537206 ) ) ( not ( = ?auto_537201 ?auto_537207 ) ) ( not ( = ?auto_537201 ?auto_537208 ) ) ( not ( = ?auto_537201 ?auto_537209 ) ) ( not ( = ?auto_537201 ?auto_537210 ) ) ( not ( = ?auto_537201 ?auto_537211 ) ) ( not ( = ?auto_537202 ?auto_537203 ) ) ( not ( = ?auto_537202 ?auto_537204 ) ) ( not ( = ?auto_537202 ?auto_537205 ) ) ( not ( = ?auto_537202 ?auto_537206 ) ) ( not ( = ?auto_537202 ?auto_537207 ) ) ( not ( = ?auto_537202 ?auto_537208 ) ) ( not ( = ?auto_537202 ?auto_537209 ) ) ( not ( = ?auto_537202 ?auto_537210 ) ) ( not ( = ?auto_537202 ?auto_537211 ) ) ( not ( = ?auto_537203 ?auto_537204 ) ) ( not ( = ?auto_537203 ?auto_537205 ) ) ( not ( = ?auto_537203 ?auto_537206 ) ) ( not ( = ?auto_537203 ?auto_537207 ) ) ( not ( = ?auto_537203 ?auto_537208 ) ) ( not ( = ?auto_537203 ?auto_537209 ) ) ( not ( = ?auto_537203 ?auto_537210 ) ) ( not ( = ?auto_537203 ?auto_537211 ) ) ( not ( = ?auto_537204 ?auto_537205 ) ) ( not ( = ?auto_537204 ?auto_537206 ) ) ( not ( = ?auto_537204 ?auto_537207 ) ) ( not ( = ?auto_537204 ?auto_537208 ) ) ( not ( = ?auto_537204 ?auto_537209 ) ) ( not ( = ?auto_537204 ?auto_537210 ) ) ( not ( = ?auto_537204 ?auto_537211 ) ) ( not ( = ?auto_537205 ?auto_537206 ) ) ( not ( = ?auto_537205 ?auto_537207 ) ) ( not ( = ?auto_537205 ?auto_537208 ) ) ( not ( = ?auto_537205 ?auto_537209 ) ) ( not ( = ?auto_537205 ?auto_537210 ) ) ( not ( = ?auto_537205 ?auto_537211 ) ) ( not ( = ?auto_537206 ?auto_537207 ) ) ( not ( = ?auto_537206 ?auto_537208 ) ) ( not ( = ?auto_537206 ?auto_537209 ) ) ( not ( = ?auto_537206 ?auto_537210 ) ) ( not ( = ?auto_537206 ?auto_537211 ) ) ( not ( = ?auto_537207 ?auto_537208 ) ) ( not ( = ?auto_537207 ?auto_537209 ) ) ( not ( = ?auto_537207 ?auto_537210 ) ) ( not ( = ?auto_537207 ?auto_537211 ) ) ( not ( = ?auto_537208 ?auto_537209 ) ) ( not ( = ?auto_537208 ?auto_537210 ) ) ( not ( = ?auto_537208 ?auto_537211 ) ) ( not ( = ?auto_537209 ?auto_537210 ) ) ( not ( = ?auto_537209 ?auto_537211 ) ) ( not ( = ?auto_537210 ?auto_537211 ) ) ( ON ?auto_537209 ?auto_537210 ) ( ON ?auto_537208 ?auto_537209 ) ( ON ?auto_537207 ?auto_537208 ) ( ON ?auto_537206 ?auto_537207 ) ( ON ?auto_537205 ?auto_537206 ) ( ON ?auto_537204 ?auto_537205 ) ( ON ?auto_537203 ?auto_537204 ) ( ON ?auto_537202 ?auto_537203 ) ( CLEAR ?auto_537200 ) ( ON ?auto_537201 ?auto_537202 ) ( CLEAR ?auto_537201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_537198 ?auto_537199 ?auto_537200 ?auto_537201 )
      ( MAKE-13PILE ?auto_537198 ?auto_537199 ?auto_537200 ?auto_537201 ?auto_537202 ?auto_537203 ?auto_537204 ?auto_537205 ?auto_537206 ?auto_537207 ?auto_537208 ?auto_537209 ?auto_537210 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537252 - BLOCK
      ?auto_537253 - BLOCK
      ?auto_537254 - BLOCK
      ?auto_537255 - BLOCK
      ?auto_537256 - BLOCK
      ?auto_537257 - BLOCK
      ?auto_537258 - BLOCK
      ?auto_537259 - BLOCK
      ?auto_537260 - BLOCK
      ?auto_537261 - BLOCK
      ?auto_537262 - BLOCK
      ?auto_537263 - BLOCK
      ?auto_537264 - BLOCK
    )
    :vars
    (
      ?auto_537265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537264 ?auto_537265 ) ( ON-TABLE ?auto_537252 ) ( ON ?auto_537253 ?auto_537252 ) ( not ( = ?auto_537252 ?auto_537253 ) ) ( not ( = ?auto_537252 ?auto_537254 ) ) ( not ( = ?auto_537252 ?auto_537255 ) ) ( not ( = ?auto_537252 ?auto_537256 ) ) ( not ( = ?auto_537252 ?auto_537257 ) ) ( not ( = ?auto_537252 ?auto_537258 ) ) ( not ( = ?auto_537252 ?auto_537259 ) ) ( not ( = ?auto_537252 ?auto_537260 ) ) ( not ( = ?auto_537252 ?auto_537261 ) ) ( not ( = ?auto_537252 ?auto_537262 ) ) ( not ( = ?auto_537252 ?auto_537263 ) ) ( not ( = ?auto_537252 ?auto_537264 ) ) ( not ( = ?auto_537252 ?auto_537265 ) ) ( not ( = ?auto_537253 ?auto_537254 ) ) ( not ( = ?auto_537253 ?auto_537255 ) ) ( not ( = ?auto_537253 ?auto_537256 ) ) ( not ( = ?auto_537253 ?auto_537257 ) ) ( not ( = ?auto_537253 ?auto_537258 ) ) ( not ( = ?auto_537253 ?auto_537259 ) ) ( not ( = ?auto_537253 ?auto_537260 ) ) ( not ( = ?auto_537253 ?auto_537261 ) ) ( not ( = ?auto_537253 ?auto_537262 ) ) ( not ( = ?auto_537253 ?auto_537263 ) ) ( not ( = ?auto_537253 ?auto_537264 ) ) ( not ( = ?auto_537253 ?auto_537265 ) ) ( not ( = ?auto_537254 ?auto_537255 ) ) ( not ( = ?auto_537254 ?auto_537256 ) ) ( not ( = ?auto_537254 ?auto_537257 ) ) ( not ( = ?auto_537254 ?auto_537258 ) ) ( not ( = ?auto_537254 ?auto_537259 ) ) ( not ( = ?auto_537254 ?auto_537260 ) ) ( not ( = ?auto_537254 ?auto_537261 ) ) ( not ( = ?auto_537254 ?auto_537262 ) ) ( not ( = ?auto_537254 ?auto_537263 ) ) ( not ( = ?auto_537254 ?auto_537264 ) ) ( not ( = ?auto_537254 ?auto_537265 ) ) ( not ( = ?auto_537255 ?auto_537256 ) ) ( not ( = ?auto_537255 ?auto_537257 ) ) ( not ( = ?auto_537255 ?auto_537258 ) ) ( not ( = ?auto_537255 ?auto_537259 ) ) ( not ( = ?auto_537255 ?auto_537260 ) ) ( not ( = ?auto_537255 ?auto_537261 ) ) ( not ( = ?auto_537255 ?auto_537262 ) ) ( not ( = ?auto_537255 ?auto_537263 ) ) ( not ( = ?auto_537255 ?auto_537264 ) ) ( not ( = ?auto_537255 ?auto_537265 ) ) ( not ( = ?auto_537256 ?auto_537257 ) ) ( not ( = ?auto_537256 ?auto_537258 ) ) ( not ( = ?auto_537256 ?auto_537259 ) ) ( not ( = ?auto_537256 ?auto_537260 ) ) ( not ( = ?auto_537256 ?auto_537261 ) ) ( not ( = ?auto_537256 ?auto_537262 ) ) ( not ( = ?auto_537256 ?auto_537263 ) ) ( not ( = ?auto_537256 ?auto_537264 ) ) ( not ( = ?auto_537256 ?auto_537265 ) ) ( not ( = ?auto_537257 ?auto_537258 ) ) ( not ( = ?auto_537257 ?auto_537259 ) ) ( not ( = ?auto_537257 ?auto_537260 ) ) ( not ( = ?auto_537257 ?auto_537261 ) ) ( not ( = ?auto_537257 ?auto_537262 ) ) ( not ( = ?auto_537257 ?auto_537263 ) ) ( not ( = ?auto_537257 ?auto_537264 ) ) ( not ( = ?auto_537257 ?auto_537265 ) ) ( not ( = ?auto_537258 ?auto_537259 ) ) ( not ( = ?auto_537258 ?auto_537260 ) ) ( not ( = ?auto_537258 ?auto_537261 ) ) ( not ( = ?auto_537258 ?auto_537262 ) ) ( not ( = ?auto_537258 ?auto_537263 ) ) ( not ( = ?auto_537258 ?auto_537264 ) ) ( not ( = ?auto_537258 ?auto_537265 ) ) ( not ( = ?auto_537259 ?auto_537260 ) ) ( not ( = ?auto_537259 ?auto_537261 ) ) ( not ( = ?auto_537259 ?auto_537262 ) ) ( not ( = ?auto_537259 ?auto_537263 ) ) ( not ( = ?auto_537259 ?auto_537264 ) ) ( not ( = ?auto_537259 ?auto_537265 ) ) ( not ( = ?auto_537260 ?auto_537261 ) ) ( not ( = ?auto_537260 ?auto_537262 ) ) ( not ( = ?auto_537260 ?auto_537263 ) ) ( not ( = ?auto_537260 ?auto_537264 ) ) ( not ( = ?auto_537260 ?auto_537265 ) ) ( not ( = ?auto_537261 ?auto_537262 ) ) ( not ( = ?auto_537261 ?auto_537263 ) ) ( not ( = ?auto_537261 ?auto_537264 ) ) ( not ( = ?auto_537261 ?auto_537265 ) ) ( not ( = ?auto_537262 ?auto_537263 ) ) ( not ( = ?auto_537262 ?auto_537264 ) ) ( not ( = ?auto_537262 ?auto_537265 ) ) ( not ( = ?auto_537263 ?auto_537264 ) ) ( not ( = ?auto_537263 ?auto_537265 ) ) ( not ( = ?auto_537264 ?auto_537265 ) ) ( ON ?auto_537263 ?auto_537264 ) ( ON ?auto_537262 ?auto_537263 ) ( ON ?auto_537261 ?auto_537262 ) ( ON ?auto_537260 ?auto_537261 ) ( ON ?auto_537259 ?auto_537260 ) ( ON ?auto_537258 ?auto_537259 ) ( ON ?auto_537257 ?auto_537258 ) ( ON ?auto_537256 ?auto_537257 ) ( ON ?auto_537255 ?auto_537256 ) ( CLEAR ?auto_537253 ) ( ON ?auto_537254 ?auto_537255 ) ( CLEAR ?auto_537254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_537252 ?auto_537253 ?auto_537254 )
      ( MAKE-13PILE ?auto_537252 ?auto_537253 ?auto_537254 ?auto_537255 ?auto_537256 ?auto_537257 ?auto_537258 ?auto_537259 ?auto_537260 ?auto_537261 ?auto_537262 ?auto_537263 ?auto_537264 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537306 - BLOCK
      ?auto_537307 - BLOCK
      ?auto_537308 - BLOCK
      ?auto_537309 - BLOCK
      ?auto_537310 - BLOCK
      ?auto_537311 - BLOCK
      ?auto_537312 - BLOCK
      ?auto_537313 - BLOCK
      ?auto_537314 - BLOCK
      ?auto_537315 - BLOCK
      ?auto_537316 - BLOCK
      ?auto_537317 - BLOCK
      ?auto_537318 - BLOCK
    )
    :vars
    (
      ?auto_537319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537318 ?auto_537319 ) ( ON-TABLE ?auto_537306 ) ( not ( = ?auto_537306 ?auto_537307 ) ) ( not ( = ?auto_537306 ?auto_537308 ) ) ( not ( = ?auto_537306 ?auto_537309 ) ) ( not ( = ?auto_537306 ?auto_537310 ) ) ( not ( = ?auto_537306 ?auto_537311 ) ) ( not ( = ?auto_537306 ?auto_537312 ) ) ( not ( = ?auto_537306 ?auto_537313 ) ) ( not ( = ?auto_537306 ?auto_537314 ) ) ( not ( = ?auto_537306 ?auto_537315 ) ) ( not ( = ?auto_537306 ?auto_537316 ) ) ( not ( = ?auto_537306 ?auto_537317 ) ) ( not ( = ?auto_537306 ?auto_537318 ) ) ( not ( = ?auto_537306 ?auto_537319 ) ) ( not ( = ?auto_537307 ?auto_537308 ) ) ( not ( = ?auto_537307 ?auto_537309 ) ) ( not ( = ?auto_537307 ?auto_537310 ) ) ( not ( = ?auto_537307 ?auto_537311 ) ) ( not ( = ?auto_537307 ?auto_537312 ) ) ( not ( = ?auto_537307 ?auto_537313 ) ) ( not ( = ?auto_537307 ?auto_537314 ) ) ( not ( = ?auto_537307 ?auto_537315 ) ) ( not ( = ?auto_537307 ?auto_537316 ) ) ( not ( = ?auto_537307 ?auto_537317 ) ) ( not ( = ?auto_537307 ?auto_537318 ) ) ( not ( = ?auto_537307 ?auto_537319 ) ) ( not ( = ?auto_537308 ?auto_537309 ) ) ( not ( = ?auto_537308 ?auto_537310 ) ) ( not ( = ?auto_537308 ?auto_537311 ) ) ( not ( = ?auto_537308 ?auto_537312 ) ) ( not ( = ?auto_537308 ?auto_537313 ) ) ( not ( = ?auto_537308 ?auto_537314 ) ) ( not ( = ?auto_537308 ?auto_537315 ) ) ( not ( = ?auto_537308 ?auto_537316 ) ) ( not ( = ?auto_537308 ?auto_537317 ) ) ( not ( = ?auto_537308 ?auto_537318 ) ) ( not ( = ?auto_537308 ?auto_537319 ) ) ( not ( = ?auto_537309 ?auto_537310 ) ) ( not ( = ?auto_537309 ?auto_537311 ) ) ( not ( = ?auto_537309 ?auto_537312 ) ) ( not ( = ?auto_537309 ?auto_537313 ) ) ( not ( = ?auto_537309 ?auto_537314 ) ) ( not ( = ?auto_537309 ?auto_537315 ) ) ( not ( = ?auto_537309 ?auto_537316 ) ) ( not ( = ?auto_537309 ?auto_537317 ) ) ( not ( = ?auto_537309 ?auto_537318 ) ) ( not ( = ?auto_537309 ?auto_537319 ) ) ( not ( = ?auto_537310 ?auto_537311 ) ) ( not ( = ?auto_537310 ?auto_537312 ) ) ( not ( = ?auto_537310 ?auto_537313 ) ) ( not ( = ?auto_537310 ?auto_537314 ) ) ( not ( = ?auto_537310 ?auto_537315 ) ) ( not ( = ?auto_537310 ?auto_537316 ) ) ( not ( = ?auto_537310 ?auto_537317 ) ) ( not ( = ?auto_537310 ?auto_537318 ) ) ( not ( = ?auto_537310 ?auto_537319 ) ) ( not ( = ?auto_537311 ?auto_537312 ) ) ( not ( = ?auto_537311 ?auto_537313 ) ) ( not ( = ?auto_537311 ?auto_537314 ) ) ( not ( = ?auto_537311 ?auto_537315 ) ) ( not ( = ?auto_537311 ?auto_537316 ) ) ( not ( = ?auto_537311 ?auto_537317 ) ) ( not ( = ?auto_537311 ?auto_537318 ) ) ( not ( = ?auto_537311 ?auto_537319 ) ) ( not ( = ?auto_537312 ?auto_537313 ) ) ( not ( = ?auto_537312 ?auto_537314 ) ) ( not ( = ?auto_537312 ?auto_537315 ) ) ( not ( = ?auto_537312 ?auto_537316 ) ) ( not ( = ?auto_537312 ?auto_537317 ) ) ( not ( = ?auto_537312 ?auto_537318 ) ) ( not ( = ?auto_537312 ?auto_537319 ) ) ( not ( = ?auto_537313 ?auto_537314 ) ) ( not ( = ?auto_537313 ?auto_537315 ) ) ( not ( = ?auto_537313 ?auto_537316 ) ) ( not ( = ?auto_537313 ?auto_537317 ) ) ( not ( = ?auto_537313 ?auto_537318 ) ) ( not ( = ?auto_537313 ?auto_537319 ) ) ( not ( = ?auto_537314 ?auto_537315 ) ) ( not ( = ?auto_537314 ?auto_537316 ) ) ( not ( = ?auto_537314 ?auto_537317 ) ) ( not ( = ?auto_537314 ?auto_537318 ) ) ( not ( = ?auto_537314 ?auto_537319 ) ) ( not ( = ?auto_537315 ?auto_537316 ) ) ( not ( = ?auto_537315 ?auto_537317 ) ) ( not ( = ?auto_537315 ?auto_537318 ) ) ( not ( = ?auto_537315 ?auto_537319 ) ) ( not ( = ?auto_537316 ?auto_537317 ) ) ( not ( = ?auto_537316 ?auto_537318 ) ) ( not ( = ?auto_537316 ?auto_537319 ) ) ( not ( = ?auto_537317 ?auto_537318 ) ) ( not ( = ?auto_537317 ?auto_537319 ) ) ( not ( = ?auto_537318 ?auto_537319 ) ) ( ON ?auto_537317 ?auto_537318 ) ( ON ?auto_537316 ?auto_537317 ) ( ON ?auto_537315 ?auto_537316 ) ( ON ?auto_537314 ?auto_537315 ) ( ON ?auto_537313 ?auto_537314 ) ( ON ?auto_537312 ?auto_537313 ) ( ON ?auto_537311 ?auto_537312 ) ( ON ?auto_537310 ?auto_537311 ) ( ON ?auto_537309 ?auto_537310 ) ( ON ?auto_537308 ?auto_537309 ) ( CLEAR ?auto_537306 ) ( ON ?auto_537307 ?auto_537308 ) ( CLEAR ?auto_537307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_537306 ?auto_537307 )
      ( MAKE-13PILE ?auto_537306 ?auto_537307 ?auto_537308 ?auto_537309 ?auto_537310 ?auto_537311 ?auto_537312 ?auto_537313 ?auto_537314 ?auto_537315 ?auto_537316 ?auto_537317 ?auto_537318 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_537360 - BLOCK
      ?auto_537361 - BLOCK
      ?auto_537362 - BLOCK
      ?auto_537363 - BLOCK
      ?auto_537364 - BLOCK
      ?auto_537365 - BLOCK
      ?auto_537366 - BLOCK
      ?auto_537367 - BLOCK
      ?auto_537368 - BLOCK
      ?auto_537369 - BLOCK
      ?auto_537370 - BLOCK
      ?auto_537371 - BLOCK
      ?auto_537372 - BLOCK
    )
    :vars
    (
      ?auto_537373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537372 ?auto_537373 ) ( not ( = ?auto_537360 ?auto_537361 ) ) ( not ( = ?auto_537360 ?auto_537362 ) ) ( not ( = ?auto_537360 ?auto_537363 ) ) ( not ( = ?auto_537360 ?auto_537364 ) ) ( not ( = ?auto_537360 ?auto_537365 ) ) ( not ( = ?auto_537360 ?auto_537366 ) ) ( not ( = ?auto_537360 ?auto_537367 ) ) ( not ( = ?auto_537360 ?auto_537368 ) ) ( not ( = ?auto_537360 ?auto_537369 ) ) ( not ( = ?auto_537360 ?auto_537370 ) ) ( not ( = ?auto_537360 ?auto_537371 ) ) ( not ( = ?auto_537360 ?auto_537372 ) ) ( not ( = ?auto_537360 ?auto_537373 ) ) ( not ( = ?auto_537361 ?auto_537362 ) ) ( not ( = ?auto_537361 ?auto_537363 ) ) ( not ( = ?auto_537361 ?auto_537364 ) ) ( not ( = ?auto_537361 ?auto_537365 ) ) ( not ( = ?auto_537361 ?auto_537366 ) ) ( not ( = ?auto_537361 ?auto_537367 ) ) ( not ( = ?auto_537361 ?auto_537368 ) ) ( not ( = ?auto_537361 ?auto_537369 ) ) ( not ( = ?auto_537361 ?auto_537370 ) ) ( not ( = ?auto_537361 ?auto_537371 ) ) ( not ( = ?auto_537361 ?auto_537372 ) ) ( not ( = ?auto_537361 ?auto_537373 ) ) ( not ( = ?auto_537362 ?auto_537363 ) ) ( not ( = ?auto_537362 ?auto_537364 ) ) ( not ( = ?auto_537362 ?auto_537365 ) ) ( not ( = ?auto_537362 ?auto_537366 ) ) ( not ( = ?auto_537362 ?auto_537367 ) ) ( not ( = ?auto_537362 ?auto_537368 ) ) ( not ( = ?auto_537362 ?auto_537369 ) ) ( not ( = ?auto_537362 ?auto_537370 ) ) ( not ( = ?auto_537362 ?auto_537371 ) ) ( not ( = ?auto_537362 ?auto_537372 ) ) ( not ( = ?auto_537362 ?auto_537373 ) ) ( not ( = ?auto_537363 ?auto_537364 ) ) ( not ( = ?auto_537363 ?auto_537365 ) ) ( not ( = ?auto_537363 ?auto_537366 ) ) ( not ( = ?auto_537363 ?auto_537367 ) ) ( not ( = ?auto_537363 ?auto_537368 ) ) ( not ( = ?auto_537363 ?auto_537369 ) ) ( not ( = ?auto_537363 ?auto_537370 ) ) ( not ( = ?auto_537363 ?auto_537371 ) ) ( not ( = ?auto_537363 ?auto_537372 ) ) ( not ( = ?auto_537363 ?auto_537373 ) ) ( not ( = ?auto_537364 ?auto_537365 ) ) ( not ( = ?auto_537364 ?auto_537366 ) ) ( not ( = ?auto_537364 ?auto_537367 ) ) ( not ( = ?auto_537364 ?auto_537368 ) ) ( not ( = ?auto_537364 ?auto_537369 ) ) ( not ( = ?auto_537364 ?auto_537370 ) ) ( not ( = ?auto_537364 ?auto_537371 ) ) ( not ( = ?auto_537364 ?auto_537372 ) ) ( not ( = ?auto_537364 ?auto_537373 ) ) ( not ( = ?auto_537365 ?auto_537366 ) ) ( not ( = ?auto_537365 ?auto_537367 ) ) ( not ( = ?auto_537365 ?auto_537368 ) ) ( not ( = ?auto_537365 ?auto_537369 ) ) ( not ( = ?auto_537365 ?auto_537370 ) ) ( not ( = ?auto_537365 ?auto_537371 ) ) ( not ( = ?auto_537365 ?auto_537372 ) ) ( not ( = ?auto_537365 ?auto_537373 ) ) ( not ( = ?auto_537366 ?auto_537367 ) ) ( not ( = ?auto_537366 ?auto_537368 ) ) ( not ( = ?auto_537366 ?auto_537369 ) ) ( not ( = ?auto_537366 ?auto_537370 ) ) ( not ( = ?auto_537366 ?auto_537371 ) ) ( not ( = ?auto_537366 ?auto_537372 ) ) ( not ( = ?auto_537366 ?auto_537373 ) ) ( not ( = ?auto_537367 ?auto_537368 ) ) ( not ( = ?auto_537367 ?auto_537369 ) ) ( not ( = ?auto_537367 ?auto_537370 ) ) ( not ( = ?auto_537367 ?auto_537371 ) ) ( not ( = ?auto_537367 ?auto_537372 ) ) ( not ( = ?auto_537367 ?auto_537373 ) ) ( not ( = ?auto_537368 ?auto_537369 ) ) ( not ( = ?auto_537368 ?auto_537370 ) ) ( not ( = ?auto_537368 ?auto_537371 ) ) ( not ( = ?auto_537368 ?auto_537372 ) ) ( not ( = ?auto_537368 ?auto_537373 ) ) ( not ( = ?auto_537369 ?auto_537370 ) ) ( not ( = ?auto_537369 ?auto_537371 ) ) ( not ( = ?auto_537369 ?auto_537372 ) ) ( not ( = ?auto_537369 ?auto_537373 ) ) ( not ( = ?auto_537370 ?auto_537371 ) ) ( not ( = ?auto_537370 ?auto_537372 ) ) ( not ( = ?auto_537370 ?auto_537373 ) ) ( not ( = ?auto_537371 ?auto_537372 ) ) ( not ( = ?auto_537371 ?auto_537373 ) ) ( not ( = ?auto_537372 ?auto_537373 ) ) ( ON ?auto_537371 ?auto_537372 ) ( ON ?auto_537370 ?auto_537371 ) ( ON ?auto_537369 ?auto_537370 ) ( ON ?auto_537368 ?auto_537369 ) ( ON ?auto_537367 ?auto_537368 ) ( ON ?auto_537366 ?auto_537367 ) ( ON ?auto_537365 ?auto_537366 ) ( ON ?auto_537364 ?auto_537365 ) ( ON ?auto_537363 ?auto_537364 ) ( ON ?auto_537362 ?auto_537363 ) ( ON ?auto_537361 ?auto_537362 ) ( ON ?auto_537360 ?auto_537361 ) ( CLEAR ?auto_537360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_537360 )
      ( MAKE-13PILE ?auto_537360 ?auto_537361 ?auto_537362 ?auto_537363 ?auto_537364 ?auto_537365 ?auto_537366 ?auto_537367 ?auto_537368 ?auto_537369 ?auto_537370 ?auto_537371 ?auto_537372 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537415 - BLOCK
      ?auto_537416 - BLOCK
      ?auto_537417 - BLOCK
      ?auto_537418 - BLOCK
      ?auto_537419 - BLOCK
      ?auto_537420 - BLOCK
      ?auto_537421 - BLOCK
      ?auto_537422 - BLOCK
      ?auto_537423 - BLOCK
      ?auto_537424 - BLOCK
      ?auto_537425 - BLOCK
      ?auto_537426 - BLOCK
      ?auto_537427 - BLOCK
      ?auto_537428 - BLOCK
    )
    :vars
    (
      ?auto_537429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_537427 ) ( ON ?auto_537428 ?auto_537429 ) ( CLEAR ?auto_537428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_537415 ) ( ON ?auto_537416 ?auto_537415 ) ( ON ?auto_537417 ?auto_537416 ) ( ON ?auto_537418 ?auto_537417 ) ( ON ?auto_537419 ?auto_537418 ) ( ON ?auto_537420 ?auto_537419 ) ( ON ?auto_537421 ?auto_537420 ) ( ON ?auto_537422 ?auto_537421 ) ( ON ?auto_537423 ?auto_537422 ) ( ON ?auto_537424 ?auto_537423 ) ( ON ?auto_537425 ?auto_537424 ) ( ON ?auto_537426 ?auto_537425 ) ( ON ?auto_537427 ?auto_537426 ) ( not ( = ?auto_537415 ?auto_537416 ) ) ( not ( = ?auto_537415 ?auto_537417 ) ) ( not ( = ?auto_537415 ?auto_537418 ) ) ( not ( = ?auto_537415 ?auto_537419 ) ) ( not ( = ?auto_537415 ?auto_537420 ) ) ( not ( = ?auto_537415 ?auto_537421 ) ) ( not ( = ?auto_537415 ?auto_537422 ) ) ( not ( = ?auto_537415 ?auto_537423 ) ) ( not ( = ?auto_537415 ?auto_537424 ) ) ( not ( = ?auto_537415 ?auto_537425 ) ) ( not ( = ?auto_537415 ?auto_537426 ) ) ( not ( = ?auto_537415 ?auto_537427 ) ) ( not ( = ?auto_537415 ?auto_537428 ) ) ( not ( = ?auto_537415 ?auto_537429 ) ) ( not ( = ?auto_537416 ?auto_537417 ) ) ( not ( = ?auto_537416 ?auto_537418 ) ) ( not ( = ?auto_537416 ?auto_537419 ) ) ( not ( = ?auto_537416 ?auto_537420 ) ) ( not ( = ?auto_537416 ?auto_537421 ) ) ( not ( = ?auto_537416 ?auto_537422 ) ) ( not ( = ?auto_537416 ?auto_537423 ) ) ( not ( = ?auto_537416 ?auto_537424 ) ) ( not ( = ?auto_537416 ?auto_537425 ) ) ( not ( = ?auto_537416 ?auto_537426 ) ) ( not ( = ?auto_537416 ?auto_537427 ) ) ( not ( = ?auto_537416 ?auto_537428 ) ) ( not ( = ?auto_537416 ?auto_537429 ) ) ( not ( = ?auto_537417 ?auto_537418 ) ) ( not ( = ?auto_537417 ?auto_537419 ) ) ( not ( = ?auto_537417 ?auto_537420 ) ) ( not ( = ?auto_537417 ?auto_537421 ) ) ( not ( = ?auto_537417 ?auto_537422 ) ) ( not ( = ?auto_537417 ?auto_537423 ) ) ( not ( = ?auto_537417 ?auto_537424 ) ) ( not ( = ?auto_537417 ?auto_537425 ) ) ( not ( = ?auto_537417 ?auto_537426 ) ) ( not ( = ?auto_537417 ?auto_537427 ) ) ( not ( = ?auto_537417 ?auto_537428 ) ) ( not ( = ?auto_537417 ?auto_537429 ) ) ( not ( = ?auto_537418 ?auto_537419 ) ) ( not ( = ?auto_537418 ?auto_537420 ) ) ( not ( = ?auto_537418 ?auto_537421 ) ) ( not ( = ?auto_537418 ?auto_537422 ) ) ( not ( = ?auto_537418 ?auto_537423 ) ) ( not ( = ?auto_537418 ?auto_537424 ) ) ( not ( = ?auto_537418 ?auto_537425 ) ) ( not ( = ?auto_537418 ?auto_537426 ) ) ( not ( = ?auto_537418 ?auto_537427 ) ) ( not ( = ?auto_537418 ?auto_537428 ) ) ( not ( = ?auto_537418 ?auto_537429 ) ) ( not ( = ?auto_537419 ?auto_537420 ) ) ( not ( = ?auto_537419 ?auto_537421 ) ) ( not ( = ?auto_537419 ?auto_537422 ) ) ( not ( = ?auto_537419 ?auto_537423 ) ) ( not ( = ?auto_537419 ?auto_537424 ) ) ( not ( = ?auto_537419 ?auto_537425 ) ) ( not ( = ?auto_537419 ?auto_537426 ) ) ( not ( = ?auto_537419 ?auto_537427 ) ) ( not ( = ?auto_537419 ?auto_537428 ) ) ( not ( = ?auto_537419 ?auto_537429 ) ) ( not ( = ?auto_537420 ?auto_537421 ) ) ( not ( = ?auto_537420 ?auto_537422 ) ) ( not ( = ?auto_537420 ?auto_537423 ) ) ( not ( = ?auto_537420 ?auto_537424 ) ) ( not ( = ?auto_537420 ?auto_537425 ) ) ( not ( = ?auto_537420 ?auto_537426 ) ) ( not ( = ?auto_537420 ?auto_537427 ) ) ( not ( = ?auto_537420 ?auto_537428 ) ) ( not ( = ?auto_537420 ?auto_537429 ) ) ( not ( = ?auto_537421 ?auto_537422 ) ) ( not ( = ?auto_537421 ?auto_537423 ) ) ( not ( = ?auto_537421 ?auto_537424 ) ) ( not ( = ?auto_537421 ?auto_537425 ) ) ( not ( = ?auto_537421 ?auto_537426 ) ) ( not ( = ?auto_537421 ?auto_537427 ) ) ( not ( = ?auto_537421 ?auto_537428 ) ) ( not ( = ?auto_537421 ?auto_537429 ) ) ( not ( = ?auto_537422 ?auto_537423 ) ) ( not ( = ?auto_537422 ?auto_537424 ) ) ( not ( = ?auto_537422 ?auto_537425 ) ) ( not ( = ?auto_537422 ?auto_537426 ) ) ( not ( = ?auto_537422 ?auto_537427 ) ) ( not ( = ?auto_537422 ?auto_537428 ) ) ( not ( = ?auto_537422 ?auto_537429 ) ) ( not ( = ?auto_537423 ?auto_537424 ) ) ( not ( = ?auto_537423 ?auto_537425 ) ) ( not ( = ?auto_537423 ?auto_537426 ) ) ( not ( = ?auto_537423 ?auto_537427 ) ) ( not ( = ?auto_537423 ?auto_537428 ) ) ( not ( = ?auto_537423 ?auto_537429 ) ) ( not ( = ?auto_537424 ?auto_537425 ) ) ( not ( = ?auto_537424 ?auto_537426 ) ) ( not ( = ?auto_537424 ?auto_537427 ) ) ( not ( = ?auto_537424 ?auto_537428 ) ) ( not ( = ?auto_537424 ?auto_537429 ) ) ( not ( = ?auto_537425 ?auto_537426 ) ) ( not ( = ?auto_537425 ?auto_537427 ) ) ( not ( = ?auto_537425 ?auto_537428 ) ) ( not ( = ?auto_537425 ?auto_537429 ) ) ( not ( = ?auto_537426 ?auto_537427 ) ) ( not ( = ?auto_537426 ?auto_537428 ) ) ( not ( = ?auto_537426 ?auto_537429 ) ) ( not ( = ?auto_537427 ?auto_537428 ) ) ( not ( = ?auto_537427 ?auto_537429 ) ) ( not ( = ?auto_537428 ?auto_537429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_537428 ?auto_537429 )
      ( !STACK ?auto_537428 ?auto_537427 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537473 - BLOCK
      ?auto_537474 - BLOCK
      ?auto_537475 - BLOCK
      ?auto_537476 - BLOCK
      ?auto_537477 - BLOCK
      ?auto_537478 - BLOCK
      ?auto_537479 - BLOCK
      ?auto_537480 - BLOCK
      ?auto_537481 - BLOCK
      ?auto_537482 - BLOCK
      ?auto_537483 - BLOCK
      ?auto_537484 - BLOCK
      ?auto_537485 - BLOCK
      ?auto_537486 - BLOCK
    )
    :vars
    (
      ?auto_537487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537486 ?auto_537487 ) ( ON-TABLE ?auto_537473 ) ( ON ?auto_537474 ?auto_537473 ) ( ON ?auto_537475 ?auto_537474 ) ( ON ?auto_537476 ?auto_537475 ) ( ON ?auto_537477 ?auto_537476 ) ( ON ?auto_537478 ?auto_537477 ) ( ON ?auto_537479 ?auto_537478 ) ( ON ?auto_537480 ?auto_537479 ) ( ON ?auto_537481 ?auto_537480 ) ( ON ?auto_537482 ?auto_537481 ) ( ON ?auto_537483 ?auto_537482 ) ( ON ?auto_537484 ?auto_537483 ) ( not ( = ?auto_537473 ?auto_537474 ) ) ( not ( = ?auto_537473 ?auto_537475 ) ) ( not ( = ?auto_537473 ?auto_537476 ) ) ( not ( = ?auto_537473 ?auto_537477 ) ) ( not ( = ?auto_537473 ?auto_537478 ) ) ( not ( = ?auto_537473 ?auto_537479 ) ) ( not ( = ?auto_537473 ?auto_537480 ) ) ( not ( = ?auto_537473 ?auto_537481 ) ) ( not ( = ?auto_537473 ?auto_537482 ) ) ( not ( = ?auto_537473 ?auto_537483 ) ) ( not ( = ?auto_537473 ?auto_537484 ) ) ( not ( = ?auto_537473 ?auto_537485 ) ) ( not ( = ?auto_537473 ?auto_537486 ) ) ( not ( = ?auto_537473 ?auto_537487 ) ) ( not ( = ?auto_537474 ?auto_537475 ) ) ( not ( = ?auto_537474 ?auto_537476 ) ) ( not ( = ?auto_537474 ?auto_537477 ) ) ( not ( = ?auto_537474 ?auto_537478 ) ) ( not ( = ?auto_537474 ?auto_537479 ) ) ( not ( = ?auto_537474 ?auto_537480 ) ) ( not ( = ?auto_537474 ?auto_537481 ) ) ( not ( = ?auto_537474 ?auto_537482 ) ) ( not ( = ?auto_537474 ?auto_537483 ) ) ( not ( = ?auto_537474 ?auto_537484 ) ) ( not ( = ?auto_537474 ?auto_537485 ) ) ( not ( = ?auto_537474 ?auto_537486 ) ) ( not ( = ?auto_537474 ?auto_537487 ) ) ( not ( = ?auto_537475 ?auto_537476 ) ) ( not ( = ?auto_537475 ?auto_537477 ) ) ( not ( = ?auto_537475 ?auto_537478 ) ) ( not ( = ?auto_537475 ?auto_537479 ) ) ( not ( = ?auto_537475 ?auto_537480 ) ) ( not ( = ?auto_537475 ?auto_537481 ) ) ( not ( = ?auto_537475 ?auto_537482 ) ) ( not ( = ?auto_537475 ?auto_537483 ) ) ( not ( = ?auto_537475 ?auto_537484 ) ) ( not ( = ?auto_537475 ?auto_537485 ) ) ( not ( = ?auto_537475 ?auto_537486 ) ) ( not ( = ?auto_537475 ?auto_537487 ) ) ( not ( = ?auto_537476 ?auto_537477 ) ) ( not ( = ?auto_537476 ?auto_537478 ) ) ( not ( = ?auto_537476 ?auto_537479 ) ) ( not ( = ?auto_537476 ?auto_537480 ) ) ( not ( = ?auto_537476 ?auto_537481 ) ) ( not ( = ?auto_537476 ?auto_537482 ) ) ( not ( = ?auto_537476 ?auto_537483 ) ) ( not ( = ?auto_537476 ?auto_537484 ) ) ( not ( = ?auto_537476 ?auto_537485 ) ) ( not ( = ?auto_537476 ?auto_537486 ) ) ( not ( = ?auto_537476 ?auto_537487 ) ) ( not ( = ?auto_537477 ?auto_537478 ) ) ( not ( = ?auto_537477 ?auto_537479 ) ) ( not ( = ?auto_537477 ?auto_537480 ) ) ( not ( = ?auto_537477 ?auto_537481 ) ) ( not ( = ?auto_537477 ?auto_537482 ) ) ( not ( = ?auto_537477 ?auto_537483 ) ) ( not ( = ?auto_537477 ?auto_537484 ) ) ( not ( = ?auto_537477 ?auto_537485 ) ) ( not ( = ?auto_537477 ?auto_537486 ) ) ( not ( = ?auto_537477 ?auto_537487 ) ) ( not ( = ?auto_537478 ?auto_537479 ) ) ( not ( = ?auto_537478 ?auto_537480 ) ) ( not ( = ?auto_537478 ?auto_537481 ) ) ( not ( = ?auto_537478 ?auto_537482 ) ) ( not ( = ?auto_537478 ?auto_537483 ) ) ( not ( = ?auto_537478 ?auto_537484 ) ) ( not ( = ?auto_537478 ?auto_537485 ) ) ( not ( = ?auto_537478 ?auto_537486 ) ) ( not ( = ?auto_537478 ?auto_537487 ) ) ( not ( = ?auto_537479 ?auto_537480 ) ) ( not ( = ?auto_537479 ?auto_537481 ) ) ( not ( = ?auto_537479 ?auto_537482 ) ) ( not ( = ?auto_537479 ?auto_537483 ) ) ( not ( = ?auto_537479 ?auto_537484 ) ) ( not ( = ?auto_537479 ?auto_537485 ) ) ( not ( = ?auto_537479 ?auto_537486 ) ) ( not ( = ?auto_537479 ?auto_537487 ) ) ( not ( = ?auto_537480 ?auto_537481 ) ) ( not ( = ?auto_537480 ?auto_537482 ) ) ( not ( = ?auto_537480 ?auto_537483 ) ) ( not ( = ?auto_537480 ?auto_537484 ) ) ( not ( = ?auto_537480 ?auto_537485 ) ) ( not ( = ?auto_537480 ?auto_537486 ) ) ( not ( = ?auto_537480 ?auto_537487 ) ) ( not ( = ?auto_537481 ?auto_537482 ) ) ( not ( = ?auto_537481 ?auto_537483 ) ) ( not ( = ?auto_537481 ?auto_537484 ) ) ( not ( = ?auto_537481 ?auto_537485 ) ) ( not ( = ?auto_537481 ?auto_537486 ) ) ( not ( = ?auto_537481 ?auto_537487 ) ) ( not ( = ?auto_537482 ?auto_537483 ) ) ( not ( = ?auto_537482 ?auto_537484 ) ) ( not ( = ?auto_537482 ?auto_537485 ) ) ( not ( = ?auto_537482 ?auto_537486 ) ) ( not ( = ?auto_537482 ?auto_537487 ) ) ( not ( = ?auto_537483 ?auto_537484 ) ) ( not ( = ?auto_537483 ?auto_537485 ) ) ( not ( = ?auto_537483 ?auto_537486 ) ) ( not ( = ?auto_537483 ?auto_537487 ) ) ( not ( = ?auto_537484 ?auto_537485 ) ) ( not ( = ?auto_537484 ?auto_537486 ) ) ( not ( = ?auto_537484 ?auto_537487 ) ) ( not ( = ?auto_537485 ?auto_537486 ) ) ( not ( = ?auto_537485 ?auto_537487 ) ) ( not ( = ?auto_537486 ?auto_537487 ) ) ( CLEAR ?auto_537484 ) ( ON ?auto_537485 ?auto_537486 ) ( CLEAR ?auto_537485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_537473 ?auto_537474 ?auto_537475 ?auto_537476 ?auto_537477 ?auto_537478 ?auto_537479 ?auto_537480 ?auto_537481 ?auto_537482 ?auto_537483 ?auto_537484 ?auto_537485 )
      ( MAKE-14PILE ?auto_537473 ?auto_537474 ?auto_537475 ?auto_537476 ?auto_537477 ?auto_537478 ?auto_537479 ?auto_537480 ?auto_537481 ?auto_537482 ?auto_537483 ?auto_537484 ?auto_537485 ?auto_537486 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537531 - BLOCK
      ?auto_537532 - BLOCK
      ?auto_537533 - BLOCK
      ?auto_537534 - BLOCK
      ?auto_537535 - BLOCK
      ?auto_537536 - BLOCK
      ?auto_537537 - BLOCK
      ?auto_537538 - BLOCK
      ?auto_537539 - BLOCK
      ?auto_537540 - BLOCK
      ?auto_537541 - BLOCK
      ?auto_537542 - BLOCK
      ?auto_537543 - BLOCK
      ?auto_537544 - BLOCK
    )
    :vars
    (
      ?auto_537545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537544 ?auto_537545 ) ( ON-TABLE ?auto_537531 ) ( ON ?auto_537532 ?auto_537531 ) ( ON ?auto_537533 ?auto_537532 ) ( ON ?auto_537534 ?auto_537533 ) ( ON ?auto_537535 ?auto_537534 ) ( ON ?auto_537536 ?auto_537535 ) ( ON ?auto_537537 ?auto_537536 ) ( ON ?auto_537538 ?auto_537537 ) ( ON ?auto_537539 ?auto_537538 ) ( ON ?auto_537540 ?auto_537539 ) ( ON ?auto_537541 ?auto_537540 ) ( not ( = ?auto_537531 ?auto_537532 ) ) ( not ( = ?auto_537531 ?auto_537533 ) ) ( not ( = ?auto_537531 ?auto_537534 ) ) ( not ( = ?auto_537531 ?auto_537535 ) ) ( not ( = ?auto_537531 ?auto_537536 ) ) ( not ( = ?auto_537531 ?auto_537537 ) ) ( not ( = ?auto_537531 ?auto_537538 ) ) ( not ( = ?auto_537531 ?auto_537539 ) ) ( not ( = ?auto_537531 ?auto_537540 ) ) ( not ( = ?auto_537531 ?auto_537541 ) ) ( not ( = ?auto_537531 ?auto_537542 ) ) ( not ( = ?auto_537531 ?auto_537543 ) ) ( not ( = ?auto_537531 ?auto_537544 ) ) ( not ( = ?auto_537531 ?auto_537545 ) ) ( not ( = ?auto_537532 ?auto_537533 ) ) ( not ( = ?auto_537532 ?auto_537534 ) ) ( not ( = ?auto_537532 ?auto_537535 ) ) ( not ( = ?auto_537532 ?auto_537536 ) ) ( not ( = ?auto_537532 ?auto_537537 ) ) ( not ( = ?auto_537532 ?auto_537538 ) ) ( not ( = ?auto_537532 ?auto_537539 ) ) ( not ( = ?auto_537532 ?auto_537540 ) ) ( not ( = ?auto_537532 ?auto_537541 ) ) ( not ( = ?auto_537532 ?auto_537542 ) ) ( not ( = ?auto_537532 ?auto_537543 ) ) ( not ( = ?auto_537532 ?auto_537544 ) ) ( not ( = ?auto_537532 ?auto_537545 ) ) ( not ( = ?auto_537533 ?auto_537534 ) ) ( not ( = ?auto_537533 ?auto_537535 ) ) ( not ( = ?auto_537533 ?auto_537536 ) ) ( not ( = ?auto_537533 ?auto_537537 ) ) ( not ( = ?auto_537533 ?auto_537538 ) ) ( not ( = ?auto_537533 ?auto_537539 ) ) ( not ( = ?auto_537533 ?auto_537540 ) ) ( not ( = ?auto_537533 ?auto_537541 ) ) ( not ( = ?auto_537533 ?auto_537542 ) ) ( not ( = ?auto_537533 ?auto_537543 ) ) ( not ( = ?auto_537533 ?auto_537544 ) ) ( not ( = ?auto_537533 ?auto_537545 ) ) ( not ( = ?auto_537534 ?auto_537535 ) ) ( not ( = ?auto_537534 ?auto_537536 ) ) ( not ( = ?auto_537534 ?auto_537537 ) ) ( not ( = ?auto_537534 ?auto_537538 ) ) ( not ( = ?auto_537534 ?auto_537539 ) ) ( not ( = ?auto_537534 ?auto_537540 ) ) ( not ( = ?auto_537534 ?auto_537541 ) ) ( not ( = ?auto_537534 ?auto_537542 ) ) ( not ( = ?auto_537534 ?auto_537543 ) ) ( not ( = ?auto_537534 ?auto_537544 ) ) ( not ( = ?auto_537534 ?auto_537545 ) ) ( not ( = ?auto_537535 ?auto_537536 ) ) ( not ( = ?auto_537535 ?auto_537537 ) ) ( not ( = ?auto_537535 ?auto_537538 ) ) ( not ( = ?auto_537535 ?auto_537539 ) ) ( not ( = ?auto_537535 ?auto_537540 ) ) ( not ( = ?auto_537535 ?auto_537541 ) ) ( not ( = ?auto_537535 ?auto_537542 ) ) ( not ( = ?auto_537535 ?auto_537543 ) ) ( not ( = ?auto_537535 ?auto_537544 ) ) ( not ( = ?auto_537535 ?auto_537545 ) ) ( not ( = ?auto_537536 ?auto_537537 ) ) ( not ( = ?auto_537536 ?auto_537538 ) ) ( not ( = ?auto_537536 ?auto_537539 ) ) ( not ( = ?auto_537536 ?auto_537540 ) ) ( not ( = ?auto_537536 ?auto_537541 ) ) ( not ( = ?auto_537536 ?auto_537542 ) ) ( not ( = ?auto_537536 ?auto_537543 ) ) ( not ( = ?auto_537536 ?auto_537544 ) ) ( not ( = ?auto_537536 ?auto_537545 ) ) ( not ( = ?auto_537537 ?auto_537538 ) ) ( not ( = ?auto_537537 ?auto_537539 ) ) ( not ( = ?auto_537537 ?auto_537540 ) ) ( not ( = ?auto_537537 ?auto_537541 ) ) ( not ( = ?auto_537537 ?auto_537542 ) ) ( not ( = ?auto_537537 ?auto_537543 ) ) ( not ( = ?auto_537537 ?auto_537544 ) ) ( not ( = ?auto_537537 ?auto_537545 ) ) ( not ( = ?auto_537538 ?auto_537539 ) ) ( not ( = ?auto_537538 ?auto_537540 ) ) ( not ( = ?auto_537538 ?auto_537541 ) ) ( not ( = ?auto_537538 ?auto_537542 ) ) ( not ( = ?auto_537538 ?auto_537543 ) ) ( not ( = ?auto_537538 ?auto_537544 ) ) ( not ( = ?auto_537538 ?auto_537545 ) ) ( not ( = ?auto_537539 ?auto_537540 ) ) ( not ( = ?auto_537539 ?auto_537541 ) ) ( not ( = ?auto_537539 ?auto_537542 ) ) ( not ( = ?auto_537539 ?auto_537543 ) ) ( not ( = ?auto_537539 ?auto_537544 ) ) ( not ( = ?auto_537539 ?auto_537545 ) ) ( not ( = ?auto_537540 ?auto_537541 ) ) ( not ( = ?auto_537540 ?auto_537542 ) ) ( not ( = ?auto_537540 ?auto_537543 ) ) ( not ( = ?auto_537540 ?auto_537544 ) ) ( not ( = ?auto_537540 ?auto_537545 ) ) ( not ( = ?auto_537541 ?auto_537542 ) ) ( not ( = ?auto_537541 ?auto_537543 ) ) ( not ( = ?auto_537541 ?auto_537544 ) ) ( not ( = ?auto_537541 ?auto_537545 ) ) ( not ( = ?auto_537542 ?auto_537543 ) ) ( not ( = ?auto_537542 ?auto_537544 ) ) ( not ( = ?auto_537542 ?auto_537545 ) ) ( not ( = ?auto_537543 ?auto_537544 ) ) ( not ( = ?auto_537543 ?auto_537545 ) ) ( not ( = ?auto_537544 ?auto_537545 ) ) ( ON ?auto_537543 ?auto_537544 ) ( CLEAR ?auto_537541 ) ( ON ?auto_537542 ?auto_537543 ) ( CLEAR ?auto_537542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_537531 ?auto_537532 ?auto_537533 ?auto_537534 ?auto_537535 ?auto_537536 ?auto_537537 ?auto_537538 ?auto_537539 ?auto_537540 ?auto_537541 ?auto_537542 )
      ( MAKE-14PILE ?auto_537531 ?auto_537532 ?auto_537533 ?auto_537534 ?auto_537535 ?auto_537536 ?auto_537537 ?auto_537538 ?auto_537539 ?auto_537540 ?auto_537541 ?auto_537542 ?auto_537543 ?auto_537544 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537589 - BLOCK
      ?auto_537590 - BLOCK
      ?auto_537591 - BLOCK
      ?auto_537592 - BLOCK
      ?auto_537593 - BLOCK
      ?auto_537594 - BLOCK
      ?auto_537595 - BLOCK
      ?auto_537596 - BLOCK
      ?auto_537597 - BLOCK
      ?auto_537598 - BLOCK
      ?auto_537599 - BLOCK
      ?auto_537600 - BLOCK
      ?auto_537601 - BLOCK
      ?auto_537602 - BLOCK
    )
    :vars
    (
      ?auto_537603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537602 ?auto_537603 ) ( ON-TABLE ?auto_537589 ) ( ON ?auto_537590 ?auto_537589 ) ( ON ?auto_537591 ?auto_537590 ) ( ON ?auto_537592 ?auto_537591 ) ( ON ?auto_537593 ?auto_537592 ) ( ON ?auto_537594 ?auto_537593 ) ( ON ?auto_537595 ?auto_537594 ) ( ON ?auto_537596 ?auto_537595 ) ( ON ?auto_537597 ?auto_537596 ) ( ON ?auto_537598 ?auto_537597 ) ( not ( = ?auto_537589 ?auto_537590 ) ) ( not ( = ?auto_537589 ?auto_537591 ) ) ( not ( = ?auto_537589 ?auto_537592 ) ) ( not ( = ?auto_537589 ?auto_537593 ) ) ( not ( = ?auto_537589 ?auto_537594 ) ) ( not ( = ?auto_537589 ?auto_537595 ) ) ( not ( = ?auto_537589 ?auto_537596 ) ) ( not ( = ?auto_537589 ?auto_537597 ) ) ( not ( = ?auto_537589 ?auto_537598 ) ) ( not ( = ?auto_537589 ?auto_537599 ) ) ( not ( = ?auto_537589 ?auto_537600 ) ) ( not ( = ?auto_537589 ?auto_537601 ) ) ( not ( = ?auto_537589 ?auto_537602 ) ) ( not ( = ?auto_537589 ?auto_537603 ) ) ( not ( = ?auto_537590 ?auto_537591 ) ) ( not ( = ?auto_537590 ?auto_537592 ) ) ( not ( = ?auto_537590 ?auto_537593 ) ) ( not ( = ?auto_537590 ?auto_537594 ) ) ( not ( = ?auto_537590 ?auto_537595 ) ) ( not ( = ?auto_537590 ?auto_537596 ) ) ( not ( = ?auto_537590 ?auto_537597 ) ) ( not ( = ?auto_537590 ?auto_537598 ) ) ( not ( = ?auto_537590 ?auto_537599 ) ) ( not ( = ?auto_537590 ?auto_537600 ) ) ( not ( = ?auto_537590 ?auto_537601 ) ) ( not ( = ?auto_537590 ?auto_537602 ) ) ( not ( = ?auto_537590 ?auto_537603 ) ) ( not ( = ?auto_537591 ?auto_537592 ) ) ( not ( = ?auto_537591 ?auto_537593 ) ) ( not ( = ?auto_537591 ?auto_537594 ) ) ( not ( = ?auto_537591 ?auto_537595 ) ) ( not ( = ?auto_537591 ?auto_537596 ) ) ( not ( = ?auto_537591 ?auto_537597 ) ) ( not ( = ?auto_537591 ?auto_537598 ) ) ( not ( = ?auto_537591 ?auto_537599 ) ) ( not ( = ?auto_537591 ?auto_537600 ) ) ( not ( = ?auto_537591 ?auto_537601 ) ) ( not ( = ?auto_537591 ?auto_537602 ) ) ( not ( = ?auto_537591 ?auto_537603 ) ) ( not ( = ?auto_537592 ?auto_537593 ) ) ( not ( = ?auto_537592 ?auto_537594 ) ) ( not ( = ?auto_537592 ?auto_537595 ) ) ( not ( = ?auto_537592 ?auto_537596 ) ) ( not ( = ?auto_537592 ?auto_537597 ) ) ( not ( = ?auto_537592 ?auto_537598 ) ) ( not ( = ?auto_537592 ?auto_537599 ) ) ( not ( = ?auto_537592 ?auto_537600 ) ) ( not ( = ?auto_537592 ?auto_537601 ) ) ( not ( = ?auto_537592 ?auto_537602 ) ) ( not ( = ?auto_537592 ?auto_537603 ) ) ( not ( = ?auto_537593 ?auto_537594 ) ) ( not ( = ?auto_537593 ?auto_537595 ) ) ( not ( = ?auto_537593 ?auto_537596 ) ) ( not ( = ?auto_537593 ?auto_537597 ) ) ( not ( = ?auto_537593 ?auto_537598 ) ) ( not ( = ?auto_537593 ?auto_537599 ) ) ( not ( = ?auto_537593 ?auto_537600 ) ) ( not ( = ?auto_537593 ?auto_537601 ) ) ( not ( = ?auto_537593 ?auto_537602 ) ) ( not ( = ?auto_537593 ?auto_537603 ) ) ( not ( = ?auto_537594 ?auto_537595 ) ) ( not ( = ?auto_537594 ?auto_537596 ) ) ( not ( = ?auto_537594 ?auto_537597 ) ) ( not ( = ?auto_537594 ?auto_537598 ) ) ( not ( = ?auto_537594 ?auto_537599 ) ) ( not ( = ?auto_537594 ?auto_537600 ) ) ( not ( = ?auto_537594 ?auto_537601 ) ) ( not ( = ?auto_537594 ?auto_537602 ) ) ( not ( = ?auto_537594 ?auto_537603 ) ) ( not ( = ?auto_537595 ?auto_537596 ) ) ( not ( = ?auto_537595 ?auto_537597 ) ) ( not ( = ?auto_537595 ?auto_537598 ) ) ( not ( = ?auto_537595 ?auto_537599 ) ) ( not ( = ?auto_537595 ?auto_537600 ) ) ( not ( = ?auto_537595 ?auto_537601 ) ) ( not ( = ?auto_537595 ?auto_537602 ) ) ( not ( = ?auto_537595 ?auto_537603 ) ) ( not ( = ?auto_537596 ?auto_537597 ) ) ( not ( = ?auto_537596 ?auto_537598 ) ) ( not ( = ?auto_537596 ?auto_537599 ) ) ( not ( = ?auto_537596 ?auto_537600 ) ) ( not ( = ?auto_537596 ?auto_537601 ) ) ( not ( = ?auto_537596 ?auto_537602 ) ) ( not ( = ?auto_537596 ?auto_537603 ) ) ( not ( = ?auto_537597 ?auto_537598 ) ) ( not ( = ?auto_537597 ?auto_537599 ) ) ( not ( = ?auto_537597 ?auto_537600 ) ) ( not ( = ?auto_537597 ?auto_537601 ) ) ( not ( = ?auto_537597 ?auto_537602 ) ) ( not ( = ?auto_537597 ?auto_537603 ) ) ( not ( = ?auto_537598 ?auto_537599 ) ) ( not ( = ?auto_537598 ?auto_537600 ) ) ( not ( = ?auto_537598 ?auto_537601 ) ) ( not ( = ?auto_537598 ?auto_537602 ) ) ( not ( = ?auto_537598 ?auto_537603 ) ) ( not ( = ?auto_537599 ?auto_537600 ) ) ( not ( = ?auto_537599 ?auto_537601 ) ) ( not ( = ?auto_537599 ?auto_537602 ) ) ( not ( = ?auto_537599 ?auto_537603 ) ) ( not ( = ?auto_537600 ?auto_537601 ) ) ( not ( = ?auto_537600 ?auto_537602 ) ) ( not ( = ?auto_537600 ?auto_537603 ) ) ( not ( = ?auto_537601 ?auto_537602 ) ) ( not ( = ?auto_537601 ?auto_537603 ) ) ( not ( = ?auto_537602 ?auto_537603 ) ) ( ON ?auto_537601 ?auto_537602 ) ( ON ?auto_537600 ?auto_537601 ) ( CLEAR ?auto_537598 ) ( ON ?auto_537599 ?auto_537600 ) ( CLEAR ?auto_537599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_537589 ?auto_537590 ?auto_537591 ?auto_537592 ?auto_537593 ?auto_537594 ?auto_537595 ?auto_537596 ?auto_537597 ?auto_537598 ?auto_537599 )
      ( MAKE-14PILE ?auto_537589 ?auto_537590 ?auto_537591 ?auto_537592 ?auto_537593 ?auto_537594 ?auto_537595 ?auto_537596 ?auto_537597 ?auto_537598 ?auto_537599 ?auto_537600 ?auto_537601 ?auto_537602 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537647 - BLOCK
      ?auto_537648 - BLOCK
      ?auto_537649 - BLOCK
      ?auto_537650 - BLOCK
      ?auto_537651 - BLOCK
      ?auto_537652 - BLOCK
      ?auto_537653 - BLOCK
      ?auto_537654 - BLOCK
      ?auto_537655 - BLOCK
      ?auto_537656 - BLOCK
      ?auto_537657 - BLOCK
      ?auto_537658 - BLOCK
      ?auto_537659 - BLOCK
      ?auto_537660 - BLOCK
    )
    :vars
    (
      ?auto_537661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537660 ?auto_537661 ) ( ON-TABLE ?auto_537647 ) ( ON ?auto_537648 ?auto_537647 ) ( ON ?auto_537649 ?auto_537648 ) ( ON ?auto_537650 ?auto_537649 ) ( ON ?auto_537651 ?auto_537650 ) ( ON ?auto_537652 ?auto_537651 ) ( ON ?auto_537653 ?auto_537652 ) ( ON ?auto_537654 ?auto_537653 ) ( ON ?auto_537655 ?auto_537654 ) ( not ( = ?auto_537647 ?auto_537648 ) ) ( not ( = ?auto_537647 ?auto_537649 ) ) ( not ( = ?auto_537647 ?auto_537650 ) ) ( not ( = ?auto_537647 ?auto_537651 ) ) ( not ( = ?auto_537647 ?auto_537652 ) ) ( not ( = ?auto_537647 ?auto_537653 ) ) ( not ( = ?auto_537647 ?auto_537654 ) ) ( not ( = ?auto_537647 ?auto_537655 ) ) ( not ( = ?auto_537647 ?auto_537656 ) ) ( not ( = ?auto_537647 ?auto_537657 ) ) ( not ( = ?auto_537647 ?auto_537658 ) ) ( not ( = ?auto_537647 ?auto_537659 ) ) ( not ( = ?auto_537647 ?auto_537660 ) ) ( not ( = ?auto_537647 ?auto_537661 ) ) ( not ( = ?auto_537648 ?auto_537649 ) ) ( not ( = ?auto_537648 ?auto_537650 ) ) ( not ( = ?auto_537648 ?auto_537651 ) ) ( not ( = ?auto_537648 ?auto_537652 ) ) ( not ( = ?auto_537648 ?auto_537653 ) ) ( not ( = ?auto_537648 ?auto_537654 ) ) ( not ( = ?auto_537648 ?auto_537655 ) ) ( not ( = ?auto_537648 ?auto_537656 ) ) ( not ( = ?auto_537648 ?auto_537657 ) ) ( not ( = ?auto_537648 ?auto_537658 ) ) ( not ( = ?auto_537648 ?auto_537659 ) ) ( not ( = ?auto_537648 ?auto_537660 ) ) ( not ( = ?auto_537648 ?auto_537661 ) ) ( not ( = ?auto_537649 ?auto_537650 ) ) ( not ( = ?auto_537649 ?auto_537651 ) ) ( not ( = ?auto_537649 ?auto_537652 ) ) ( not ( = ?auto_537649 ?auto_537653 ) ) ( not ( = ?auto_537649 ?auto_537654 ) ) ( not ( = ?auto_537649 ?auto_537655 ) ) ( not ( = ?auto_537649 ?auto_537656 ) ) ( not ( = ?auto_537649 ?auto_537657 ) ) ( not ( = ?auto_537649 ?auto_537658 ) ) ( not ( = ?auto_537649 ?auto_537659 ) ) ( not ( = ?auto_537649 ?auto_537660 ) ) ( not ( = ?auto_537649 ?auto_537661 ) ) ( not ( = ?auto_537650 ?auto_537651 ) ) ( not ( = ?auto_537650 ?auto_537652 ) ) ( not ( = ?auto_537650 ?auto_537653 ) ) ( not ( = ?auto_537650 ?auto_537654 ) ) ( not ( = ?auto_537650 ?auto_537655 ) ) ( not ( = ?auto_537650 ?auto_537656 ) ) ( not ( = ?auto_537650 ?auto_537657 ) ) ( not ( = ?auto_537650 ?auto_537658 ) ) ( not ( = ?auto_537650 ?auto_537659 ) ) ( not ( = ?auto_537650 ?auto_537660 ) ) ( not ( = ?auto_537650 ?auto_537661 ) ) ( not ( = ?auto_537651 ?auto_537652 ) ) ( not ( = ?auto_537651 ?auto_537653 ) ) ( not ( = ?auto_537651 ?auto_537654 ) ) ( not ( = ?auto_537651 ?auto_537655 ) ) ( not ( = ?auto_537651 ?auto_537656 ) ) ( not ( = ?auto_537651 ?auto_537657 ) ) ( not ( = ?auto_537651 ?auto_537658 ) ) ( not ( = ?auto_537651 ?auto_537659 ) ) ( not ( = ?auto_537651 ?auto_537660 ) ) ( not ( = ?auto_537651 ?auto_537661 ) ) ( not ( = ?auto_537652 ?auto_537653 ) ) ( not ( = ?auto_537652 ?auto_537654 ) ) ( not ( = ?auto_537652 ?auto_537655 ) ) ( not ( = ?auto_537652 ?auto_537656 ) ) ( not ( = ?auto_537652 ?auto_537657 ) ) ( not ( = ?auto_537652 ?auto_537658 ) ) ( not ( = ?auto_537652 ?auto_537659 ) ) ( not ( = ?auto_537652 ?auto_537660 ) ) ( not ( = ?auto_537652 ?auto_537661 ) ) ( not ( = ?auto_537653 ?auto_537654 ) ) ( not ( = ?auto_537653 ?auto_537655 ) ) ( not ( = ?auto_537653 ?auto_537656 ) ) ( not ( = ?auto_537653 ?auto_537657 ) ) ( not ( = ?auto_537653 ?auto_537658 ) ) ( not ( = ?auto_537653 ?auto_537659 ) ) ( not ( = ?auto_537653 ?auto_537660 ) ) ( not ( = ?auto_537653 ?auto_537661 ) ) ( not ( = ?auto_537654 ?auto_537655 ) ) ( not ( = ?auto_537654 ?auto_537656 ) ) ( not ( = ?auto_537654 ?auto_537657 ) ) ( not ( = ?auto_537654 ?auto_537658 ) ) ( not ( = ?auto_537654 ?auto_537659 ) ) ( not ( = ?auto_537654 ?auto_537660 ) ) ( not ( = ?auto_537654 ?auto_537661 ) ) ( not ( = ?auto_537655 ?auto_537656 ) ) ( not ( = ?auto_537655 ?auto_537657 ) ) ( not ( = ?auto_537655 ?auto_537658 ) ) ( not ( = ?auto_537655 ?auto_537659 ) ) ( not ( = ?auto_537655 ?auto_537660 ) ) ( not ( = ?auto_537655 ?auto_537661 ) ) ( not ( = ?auto_537656 ?auto_537657 ) ) ( not ( = ?auto_537656 ?auto_537658 ) ) ( not ( = ?auto_537656 ?auto_537659 ) ) ( not ( = ?auto_537656 ?auto_537660 ) ) ( not ( = ?auto_537656 ?auto_537661 ) ) ( not ( = ?auto_537657 ?auto_537658 ) ) ( not ( = ?auto_537657 ?auto_537659 ) ) ( not ( = ?auto_537657 ?auto_537660 ) ) ( not ( = ?auto_537657 ?auto_537661 ) ) ( not ( = ?auto_537658 ?auto_537659 ) ) ( not ( = ?auto_537658 ?auto_537660 ) ) ( not ( = ?auto_537658 ?auto_537661 ) ) ( not ( = ?auto_537659 ?auto_537660 ) ) ( not ( = ?auto_537659 ?auto_537661 ) ) ( not ( = ?auto_537660 ?auto_537661 ) ) ( ON ?auto_537659 ?auto_537660 ) ( ON ?auto_537658 ?auto_537659 ) ( ON ?auto_537657 ?auto_537658 ) ( CLEAR ?auto_537655 ) ( ON ?auto_537656 ?auto_537657 ) ( CLEAR ?auto_537656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_537647 ?auto_537648 ?auto_537649 ?auto_537650 ?auto_537651 ?auto_537652 ?auto_537653 ?auto_537654 ?auto_537655 ?auto_537656 )
      ( MAKE-14PILE ?auto_537647 ?auto_537648 ?auto_537649 ?auto_537650 ?auto_537651 ?auto_537652 ?auto_537653 ?auto_537654 ?auto_537655 ?auto_537656 ?auto_537657 ?auto_537658 ?auto_537659 ?auto_537660 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537705 - BLOCK
      ?auto_537706 - BLOCK
      ?auto_537707 - BLOCK
      ?auto_537708 - BLOCK
      ?auto_537709 - BLOCK
      ?auto_537710 - BLOCK
      ?auto_537711 - BLOCK
      ?auto_537712 - BLOCK
      ?auto_537713 - BLOCK
      ?auto_537714 - BLOCK
      ?auto_537715 - BLOCK
      ?auto_537716 - BLOCK
      ?auto_537717 - BLOCK
      ?auto_537718 - BLOCK
    )
    :vars
    (
      ?auto_537719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537718 ?auto_537719 ) ( ON-TABLE ?auto_537705 ) ( ON ?auto_537706 ?auto_537705 ) ( ON ?auto_537707 ?auto_537706 ) ( ON ?auto_537708 ?auto_537707 ) ( ON ?auto_537709 ?auto_537708 ) ( ON ?auto_537710 ?auto_537709 ) ( ON ?auto_537711 ?auto_537710 ) ( ON ?auto_537712 ?auto_537711 ) ( not ( = ?auto_537705 ?auto_537706 ) ) ( not ( = ?auto_537705 ?auto_537707 ) ) ( not ( = ?auto_537705 ?auto_537708 ) ) ( not ( = ?auto_537705 ?auto_537709 ) ) ( not ( = ?auto_537705 ?auto_537710 ) ) ( not ( = ?auto_537705 ?auto_537711 ) ) ( not ( = ?auto_537705 ?auto_537712 ) ) ( not ( = ?auto_537705 ?auto_537713 ) ) ( not ( = ?auto_537705 ?auto_537714 ) ) ( not ( = ?auto_537705 ?auto_537715 ) ) ( not ( = ?auto_537705 ?auto_537716 ) ) ( not ( = ?auto_537705 ?auto_537717 ) ) ( not ( = ?auto_537705 ?auto_537718 ) ) ( not ( = ?auto_537705 ?auto_537719 ) ) ( not ( = ?auto_537706 ?auto_537707 ) ) ( not ( = ?auto_537706 ?auto_537708 ) ) ( not ( = ?auto_537706 ?auto_537709 ) ) ( not ( = ?auto_537706 ?auto_537710 ) ) ( not ( = ?auto_537706 ?auto_537711 ) ) ( not ( = ?auto_537706 ?auto_537712 ) ) ( not ( = ?auto_537706 ?auto_537713 ) ) ( not ( = ?auto_537706 ?auto_537714 ) ) ( not ( = ?auto_537706 ?auto_537715 ) ) ( not ( = ?auto_537706 ?auto_537716 ) ) ( not ( = ?auto_537706 ?auto_537717 ) ) ( not ( = ?auto_537706 ?auto_537718 ) ) ( not ( = ?auto_537706 ?auto_537719 ) ) ( not ( = ?auto_537707 ?auto_537708 ) ) ( not ( = ?auto_537707 ?auto_537709 ) ) ( not ( = ?auto_537707 ?auto_537710 ) ) ( not ( = ?auto_537707 ?auto_537711 ) ) ( not ( = ?auto_537707 ?auto_537712 ) ) ( not ( = ?auto_537707 ?auto_537713 ) ) ( not ( = ?auto_537707 ?auto_537714 ) ) ( not ( = ?auto_537707 ?auto_537715 ) ) ( not ( = ?auto_537707 ?auto_537716 ) ) ( not ( = ?auto_537707 ?auto_537717 ) ) ( not ( = ?auto_537707 ?auto_537718 ) ) ( not ( = ?auto_537707 ?auto_537719 ) ) ( not ( = ?auto_537708 ?auto_537709 ) ) ( not ( = ?auto_537708 ?auto_537710 ) ) ( not ( = ?auto_537708 ?auto_537711 ) ) ( not ( = ?auto_537708 ?auto_537712 ) ) ( not ( = ?auto_537708 ?auto_537713 ) ) ( not ( = ?auto_537708 ?auto_537714 ) ) ( not ( = ?auto_537708 ?auto_537715 ) ) ( not ( = ?auto_537708 ?auto_537716 ) ) ( not ( = ?auto_537708 ?auto_537717 ) ) ( not ( = ?auto_537708 ?auto_537718 ) ) ( not ( = ?auto_537708 ?auto_537719 ) ) ( not ( = ?auto_537709 ?auto_537710 ) ) ( not ( = ?auto_537709 ?auto_537711 ) ) ( not ( = ?auto_537709 ?auto_537712 ) ) ( not ( = ?auto_537709 ?auto_537713 ) ) ( not ( = ?auto_537709 ?auto_537714 ) ) ( not ( = ?auto_537709 ?auto_537715 ) ) ( not ( = ?auto_537709 ?auto_537716 ) ) ( not ( = ?auto_537709 ?auto_537717 ) ) ( not ( = ?auto_537709 ?auto_537718 ) ) ( not ( = ?auto_537709 ?auto_537719 ) ) ( not ( = ?auto_537710 ?auto_537711 ) ) ( not ( = ?auto_537710 ?auto_537712 ) ) ( not ( = ?auto_537710 ?auto_537713 ) ) ( not ( = ?auto_537710 ?auto_537714 ) ) ( not ( = ?auto_537710 ?auto_537715 ) ) ( not ( = ?auto_537710 ?auto_537716 ) ) ( not ( = ?auto_537710 ?auto_537717 ) ) ( not ( = ?auto_537710 ?auto_537718 ) ) ( not ( = ?auto_537710 ?auto_537719 ) ) ( not ( = ?auto_537711 ?auto_537712 ) ) ( not ( = ?auto_537711 ?auto_537713 ) ) ( not ( = ?auto_537711 ?auto_537714 ) ) ( not ( = ?auto_537711 ?auto_537715 ) ) ( not ( = ?auto_537711 ?auto_537716 ) ) ( not ( = ?auto_537711 ?auto_537717 ) ) ( not ( = ?auto_537711 ?auto_537718 ) ) ( not ( = ?auto_537711 ?auto_537719 ) ) ( not ( = ?auto_537712 ?auto_537713 ) ) ( not ( = ?auto_537712 ?auto_537714 ) ) ( not ( = ?auto_537712 ?auto_537715 ) ) ( not ( = ?auto_537712 ?auto_537716 ) ) ( not ( = ?auto_537712 ?auto_537717 ) ) ( not ( = ?auto_537712 ?auto_537718 ) ) ( not ( = ?auto_537712 ?auto_537719 ) ) ( not ( = ?auto_537713 ?auto_537714 ) ) ( not ( = ?auto_537713 ?auto_537715 ) ) ( not ( = ?auto_537713 ?auto_537716 ) ) ( not ( = ?auto_537713 ?auto_537717 ) ) ( not ( = ?auto_537713 ?auto_537718 ) ) ( not ( = ?auto_537713 ?auto_537719 ) ) ( not ( = ?auto_537714 ?auto_537715 ) ) ( not ( = ?auto_537714 ?auto_537716 ) ) ( not ( = ?auto_537714 ?auto_537717 ) ) ( not ( = ?auto_537714 ?auto_537718 ) ) ( not ( = ?auto_537714 ?auto_537719 ) ) ( not ( = ?auto_537715 ?auto_537716 ) ) ( not ( = ?auto_537715 ?auto_537717 ) ) ( not ( = ?auto_537715 ?auto_537718 ) ) ( not ( = ?auto_537715 ?auto_537719 ) ) ( not ( = ?auto_537716 ?auto_537717 ) ) ( not ( = ?auto_537716 ?auto_537718 ) ) ( not ( = ?auto_537716 ?auto_537719 ) ) ( not ( = ?auto_537717 ?auto_537718 ) ) ( not ( = ?auto_537717 ?auto_537719 ) ) ( not ( = ?auto_537718 ?auto_537719 ) ) ( ON ?auto_537717 ?auto_537718 ) ( ON ?auto_537716 ?auto_537717 ) ( ON ?auto_537715 ?auto_537716 ) ( ON ?auto_537714 ?auto_537715 ) ( CLEAR ?auto_537712 ) ( ON ?auto_537713 ?auto_537714 ) ( CLEAR ?auto_537713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_537705 ?auto_537706 ?auto_537707 ?auto_537708 ?auto_537709 ?auto_537710 ?auto_537711 ?auto_537712 ?auto_537713 )
      ( MAKE-14PILE ?auto_537705 ?auto_537706 ?auto_537707 ?auto_537708 ?auto_537709 ?auto_537710 ?auto_537711 ?auto_537712 ?auto_537713 ?auto_537714 ?auto_537715 ?auto_537716 ?auto_537717 ?auto_537718 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537763 - BLOCK
      ?auto_537764 - BLOCK
      ?auto_537765 - BLOCK
      ?auto_537766 - BLOCK
      ?auto_537767 - BLOCK
      ?auto_537768 - BLOCK
      ?auto_537769 - BLOCK
      ?auto_537770 - BLOCK
      ?auto_537771 - BLOCK
      ?auto_537772 - BLOCK
      ?auto_537773 - BLOCK
      ?auto_537774 - BLOCK
      ?auto_537775 - BLOCK
      ?auto_537776 - BLOCK
    )
    :vars
    (
      ?auto_537777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537776 ?auto_537777 ) ( ON-TABLE ?auto_537763 ) ( ON ?auto_537764 ?auto_537763 ) ( ON ?auto_537765 ?auto_537764 ) ( ON ?auto_537766 ?auto_537765 ) ( ON ?auto_537767 ?auto_537766 ) ( ON ?auto_537768 ?auto_537767 ) ( ON ?auto_537769 ?auto_537768 ) ( not ( = ?auto_537763 ?auto_537764 ) ) ( not ( = ?auto_537763 ?auto_537765 ) ) ( not ( = ?auto_537763 ?auto_537766 ) ) ( not ( = ?auto_537763 ?auto_537767 ) ) ( not ( = ?auto_537763 ?auto_537768 ) ) ( not ( = ?auto_537763 ?auto_537769 ) ) ( not ( = ?auto_537763 ?auto_537770 ) ) ( not ( = ?auto_537763 ?auto_537771 ) ) ( not ( = ?auto_537763 ?auto_537772 ) ) ( not ( = ?auto_537763 ?auto_537773 ) ) ( not ( = ?auto_537763 ?auto_537774 ) ) ( not ( = ?auto_537763 ?auto_537775 ) ) ( not ( = ?auto_537763 ?auto_537776 ) ) ( not ( = ?auto_537763 ?auto_537777 ) ) ( not ( = ?auto_537764 ?auto_537765 ) ) ( not ( = ?auto_537764 ?auto_537766 ) ) ( not ( = ?auto_537764 ?auto_537767 ) ) ( not ( = ?auto_537764 ?auto_537768 ) ) ( not ( = ?auto_537764 ?auto_537769 ) ) ( not ( = ?auto_537764 ?auto_537770 ) ) ( not ( = ?auto_537764 ?auto_537771 ) ) ( not ( = ?auto_537764 ?auto_537772 ) ) ( not ( = ?auto_537764 ?auto_537773 ) ) ( not ( = ?auto_537764 ?auto_537774 ) ) ( not ( = ?auto_537764 ?auto_537775 ) ) ( not ( = ?auto_537764 ?auto_537776 ) ) ( not ( = ?auto_537764 ?auto_537777 ) ) ( not ( = ?auto_537765 ?auto_537766 ) ) ( not ( = ?auto_537765 ?auto_537767 ) ) ( not ( = ?auto_537765 ?auto_537768 ) ) ( not ( = ?auto_537765 ?auto_537769 ) ) ( not ( = ?auto_537765 ?auto_537770 ) ) ( not ( = ?auto_537765 ?auto_537771 ) ) ( not ( = ?auto_537765 ?auto_537772 ) ) ( not ( = ?auto_537765 ?auto_537773 ) ) ( not ( = ?auto_537765 ?auto_537774 ) ) ( not ( = ?auto_537765 ?auto_537775 ) ) ( not ( = ?auto_537765 ?auto_537776 ) ) ( not ( = ?auto_537765 ?auto_537777 ) ) ( not ( = ?auto_537766 ?auto_537767 ) ) ( not ( = ?auto_537766 ?auto_537768 ) ) ( not ( = ?auto_537766 ?auto_537769 ) ) ( not ( = ?auto_537766 ?auto_537770 ) ) ( not ( = ?auto_537766 ?auto_537771 ) ) ( not ( = ?auto_537766 ?auto_537772 ) ) ( not ( = ?auto_537766 ?auto_537773 ) ) ( not ( = ?auto_537766 ?auto_537774 ) ) ( not ( = ?auto_537766 ?auto_537775 ) ) ( not ( = ?auto_537766 ?auto_537776 ) ) ( not ( = ?auto_537766 ?auto_537777 ) ) ( not ( = ?auto_537767 ?auto_537768 ) ) ( not ( = ?auto_537767 ?auto_537769 ) ) ( not ( = ?auto_537767 ?auto_537770 ) ) ( not ( = ?auto_537767 ?auto_537771 ) ) ( not ( = ?auto_537767 ?auto_537772 ) ) ( not ( = ?auto_537767 ?auto_537773 ) ) ( not ( = ?auto_537767 ?auto_537774 ) ) ( not ( = ?auto_537767 ?auto_537775 ) ) ( not ( = ?auto_537767 ?auto_537776 ) ) ( not ( = ?auto_537767 ?auto_537777 ) ) ( not ( = ?auto_537768 ?auto_537769 ) ) ( not ( = ?auto_537768 ?auto_537770 ) ) ( not ( = ?auto_537768 ?auto_537771 ) ) ( not ( = ?auto_537768 ?auto_537772 ) ) ( not ( = ?auto_537768 ?auto_537773 ) ) ( not ( = ?auto_537768 ?auto_537774 ) ) ( not ( = ?auto_537768 ?auto_537775 ) ) ( not ( = ?auto_537768 ?auto_537776 ) ) ( not ( = ?auto_537768 ?auto_537777 ) ) ( not ( = ?auto_537769 ?auto_537770 ) ) ( not ( = ?auto_537769 ?auto_537771 ) ) ( not ( = ?auto_537769 ?auto_537772 ) ) ( not ( = ?auto_537769 ?auto_537773 ) ) ( not ( = ?auto_537769 ?auto_537774 ) ) ( not ( = ?auto_537769 ?auto_537775 ) ) ( not ( = ?auto_537769 ?auto_537776 ) ) ( not ( = ?auto_537769 ?auto_537777 ) ) ( not ( = ?auto_537770 ?auto_537771 ) ) ( not ( = ?auto_537770 ?auto_537772 ) ) ( not ( = ?auto_537770 ?auto_537773 ) ) ( not ( = ?auto_537770 ?auto_537774 ) ) ( not ( = ?auto_537770 ?auto_537775 ) ) ( not ( = ?auto_537770 ?auto_537776 ) ) ( not ( = ?auto_537770 ?auto_537777 ) ) ( not ( = ?auto_537771 ?auto_537772 ) ) ( not ( = ?auto_537771 ?auto_537773 ) ) ( not ( = ?auto_537771 ?auto_537774 ) ) ( not ( = ?auto_537771 ?auto_537775 ) ) ( not ( = ?auto_537771 ?auto_537776 ) ) ( not ( = ?auto_537771 ?auto_537777 ) ) ( not ( = ?auto_537772 ?auto_537773 ) ) ( not ( = ?auto_537772 ?auto_537774 ) ) ( not ( = ?auto_537772 ?auto_537775 ) ) ( not ( = ?auto_537772 ?auto_537776 ) ) ( not ( = ?auto_537772 ?auto_537777 ) ) ( not ( = ?auto_537773 ?auto_537774 ) ) ( not ( = ?auto_537773 ?auto_537775 ) ) ( not ( = ?auto_537773 ?auto_537776 ) ) ( not ( = ?auto_537773 ?auto_537777 ) ) ( not ( = ?auto_537774 ?auto_537775 ) ) ( not ( = ?auto_537774 ?auto_537776 ) ) ( not ( = ?auto_537774 ?auto_537777 ) ) ( not ( = ?auto_537775 ?auto_537776 ) ) ( not ( = ?auto_537775 ?auto_537777 ) ) ( not ( = ?auto_537776 ?auto_537777 ) ) ( ON ?auto_537775 ?auto_537776 ) ( ON ?auto_537774 ?auto_537775 ) ( ON ?auto_537773 ?auto_537774 ) ( ON ?auto_537772 ?auto_537773 ) ( ON ?auto_537771 ?auto_537772 ) ( CLEAR ?auto_537769 ) ( ON ?auto_537770 ?auto_537771 ) ( CLEAR ?auto_537770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_537763 ?auto_537764 ?auto_537765 ?auto_537766 ?auto_537767 ?auto_537768 ?auto_537769 ?auto_537770 )
      ( MAKE-14PILE ?auto_537763 ?auto_537764 ?auto_537765 ?auto_537766 ?auto_537767 ?auto_537768 ?auto_537769 ?auto_537770 ?auto_537771 ?auto_537772 ?auto_537773 ?auto_537774 ?auto_537775 ?auto_537776 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537821 - BLOCK
      ?auto_537822 - BLOCK
      ?auto_537823 - BLOCK
      ?auto_537824 - BLOCK
      ?auto_537825 - BLOCK
      ?auto_537826 - BLOCK
      ?auto_537827 - BLOCK
      ?auto_537828 - BLOCK
      ?auto_537829 - BLOCK
      ?auto_537830 - BLOCK
      ?auto_537831 - BLOCK
      ?auto_537832 - BLOCK
      ?auto_537833 - BLOCK
      ?auto_537834 - BLOCK
    )
    :vars
    (
      ?auto_537835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537834 ?auto_537835 ) ( ON-TABLE ?auto_537821 ) ( ON ?auto_537822 ?auto_537821 ) ( ON ?auto_537823 ?auto_537822 ) ( ON ?auto_537824 ?auto_537823 ) ( ON ?auto_537825 ?auto_537824 ) ( ON ?auto_537826 ?auto_537825 ) ( not ( = ?auto_537821 ?auto_537822 ) ) ( not ( = ?auto_537821 ?auto_537823 ) ) ( not ( = ?auto_537821 ?auto_537824 ) ) ( not ( = ?auto_537821 ?auto_537825 ) ) ( not ( = ?auto_537821 ?auto_537826 ) ) ( not ( = ?auto_537821 ?auto_537827 ) ) ( not ( = ?auto_537821 ?auto_537828 ) ) ( not ( = ?auto_537821 ?auto_537829 ) ) ( not ( = ?auto_537821 ?auto_537830 ) ) ( not ( = ?auto_537821 ?auto_537831 ) ) ( not ( = ?auto_537821 ?auto_537832 ) ) ( not ( = ?auto_537821 ?auto_537833 ) ) ( not ( = ?auto_537821 ?auto_537834 ) ) ( not ( = ?auto_537821 ?auto_537835 ) ) ( not ( = ?auto_537822 ?auto_537823 ) ) ( not ( = ?auto_537822 ?auto_537824 ) ) ( not ( = ?auto_537822 ?auto_537825 ) ) ( not ( = ?auto_537822 ?auto_537826 ) ) ( not ( = ?auto_537822 ?auto_537827 ) ) ( not ( = ?auto_537822 ?auto_537828 ) ) ( not ( = ?auto_537822 ?auto_537829 ) ) ( not ( = ?auto_537822 ?auto_537830 ) ) ( not ( = ?auto_537822 ?auto_537831 ) ) ( not ( = ?auto_537822 ?auto_537832 ) ) ( not ( = ?auto_537822 ?auto_537833 ) ) ( not ( = ?auto_537822 ?auto_537834 ) ) ( not ( = ?auto_537822 ?auto_537835 ) ) ( not ( = ?auto_537823 ?auto_537824 ) ) ( not ( = ?auto_537823 ?auto_537825 ) ) ( not ( = ?auto_537823 ?auto_537826 ) ) ( not ( = ?auto_537823 ?auto_537827 ) ) ( not ( = ?auto_537823 ?auto_537828 ) ) ( not ( = ?auto_537823 ?auto_537829 ) ) ( not ( = ?auto_537823 ?auto_537830 ) ) ( not ( = ?auto_537823 ?auto_537831 ) ) ( not ( = ?auto_537823 ?auto_537832 ) ) ( not ( = ?auto_537823 ?auto_537833 ) ) ( not ( = ?auto_537823 ?auto_537834 ) ) ( not ( = ?auto_537823 ?auto_537835 ) ) ( not ( = ?auto_537824 ?auto_537825 ) ) ( not ( = ?auto_537824 ?auto_537826 ) ) ( not ( = ?auto_537824 ?auto_537827 ) ) ( not ( = ?auto_537824 ?auto_537828 ) ) ( not ( = ?auto_537824 ?auto_537829 ) ) ( not ( = ?auto_537824 ?auto_537830 ) ) ( not ( = ?auto_537824 ?auto_537831 ) ) ( not ( = ?auto_537824 ?auto_537832 ) ) ( not ( = ?auto_537824 ?auto_537833 ) ) ( not ( = ?auto_537824 ?auto_537834 ) ) ( not ( = ?auto_537824 ?auto_537835 ) ) ( not ( = ?auto_537825 ?auto_537826 ) ) ( not ( = ?auto_537825 ?auto_537827 ) ) ( not ( = ?auto_537825 ?auto_537828 ) ) ( not ( = ?auto_537825 ?auto_537829 ) ) ( not ( = ?auto_537825 ?auto_537830 ) ) ( not ( = ?auto_537825 ?auto_537831 ) ) ( not ( = ?auto_537825 ?auto_537832 ) ) ( not ( = ?auto_537825 ?auto_537833 ) ) ( not ( = ?auto_537825 ?auto_537834 ) ) ( not ( = ?auto_537825 ?auto_537835 ) ) ( not ( = ?auto_537826 ?auto_537827 ) ) ( not ( = ?auto_537826 ?auto_537828 ) ) ( not ( = ?auto_537826 ?auto_537829 ) ) ( not ( = ?auto_537826 ?auto_537830 ) ) ( not ( = ?auto_537826 ?auto_537831 ) ) ( not ( = ?auto_537826 ?auto_537832 ) ) ( not ( = ?auto_537826 ?auto_537833 ) ) ( not ( = ?auto_537826 ?auto_537834 ) ) ( not ( = ?auto_537826 ?auto_537835 ) ) ( not ( = ?auto_537827 ?auto_537828 ) ) ( not ( = ?auto_537827 ?auto_537829 ) ) ( not ( = ?auto_537827 ?auto_537830 ) ) ( not ( = ?auto_537827 ?auto_537831 ) ) ( not ( = ?auto_537827 ?auto_537832 ) ) ( not ( = ?auto_537827 ?auto_537833 ) ) ( not ( = ?auto_537827 ?auto_537834 ) ) ( not ( = ?auto_537827 ?auto_537835 ) ) ( not ( = ?auto_537828 ?auto_537829 ) ) ( not ( = ?auto_537828 ?auto_537830 ) ) ( not ( = ?auto_537828 ?auto_537831 ) ) ( not ( = ?auto_537828 ?auto_537832 ) ) ( not ( = ?auto_537828 ?auto_537833 ) ) ( not ( = ?auto_537828 ?auto_537834 ) ) ( not ( = ?auto_537828 ?auto_537835 ) ) ( not ( = ?auto_537829 ?auto_537830 ) ) ( not ( = ?auto_537829 ?auto_537831 ) ) ( not ( = ?auto_537829 ?auto_537832 ) ) ( not ( = ?auto_537829 ?auto_537833 ) ) ( not ( = ?auto_537829 ?auto_537834 ) ) ( not ( = ?auto_537829 ?auto_537835 ) ) ( not ( = ?auto_537830 ?auto_537831 ) ) ( not ( = ?auto_537830 ?auto_537832 ) ) ( not ( = ?auto_537830 ?auto_537833 ) ) ( not ( = ?auto_537830 ?auto_537834 ) ) ( not ( = ?auto_537830 ?auto_537835 ) ) ( not ( = ?auto_537831 ?auto_537832 ) ) ( not ( = ?auto_537831 ?auto_537833 ) ) ( not ( = ?auto_537831 ?auto_537834 ) ) ( not ( = ?auto_537831 ?auto_537835 ) ) ( not ( = ?auto_537832 ?auto_537833 ) ) ( not ( = ?auto_537832 ?auto_537834 ) ) ( not ( = ?auto_537832 ?auto_537835 ) ) ( not ( = ?auto_537833 ?auto_537834 ) ) ( not ( = ?auto_537833 ?auto_537835 ) ) ( not ( = ?auto_537834 ?auto_537835 ) ) ( ON ?auto_537833 ?auto_537834 ) ( ON ?auto_537832 ?auto_537833 ) ( ON ?auto_537831 ?auto_537832 ) ( ON ?auto_537830 ?auto_537831 ) ( ON ?auto_537829 ?auto_537830 ) ( ON ?auto_537828 ?auto_537829 ) ( CLEAR ?auto_537826 ) ( ON ?auto_537827 ?auto_537828 ) ( CLEAR ?auto_537827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_537821 ?auto_537822 ?auto_537823 ?auto_537824 ?auto_537825 ?auto_537826 ?auto_537827 )
      ( MAKE-14PILE ?auto_537821 ?auto_537822 ?auto_537823 ?auto_537824 ?auto_537825 ?auto_537826 ?auto_537827 ?auto_537828 ?auto_537829 ?auto_537830 ?auto_537831 ?auto_537832 ?auto_537833 ?auto_537834 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537879 - BLOCK
      ?auto_537880 - BLOCK
      ?auto_537881 - BLOCK
      ?auto_537882 - BLOCK
      ?auto_537883 - BLOCK
      ?auto_537884 - BLOCK
      ?auto_537885 - BLOCK
      ?auto_537886 - BLOCK
      ?auto_537887 - BLOCK
      ?auto_537888 - BLOCK
      ?auto_537889 - BLOCK
      ?auto_537890 - BLOCK
      ?auto_537891 - BLOCK
      ?auto_537892 - BLOCK
    )
    :vars
    (
      ?auto_537893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537892 ?auto_537893 ) ( ON-TABLE ?auto_537879 ) ( ON ?auto_537880 ?auto_537879 ) ( ON ?auto_537881 ?auto_537880 ) ( ON ?auto_537882 ?auto_537881 ) ( ON ?auto_537883 ?auto_537882 ) ( not ( = ?auto_537879 ?auto_537880 ) ) ( not ( = ?auto_537879 ?auto_537881 ) ) ( not ( = ?auto_537879 ?auto_537882 ) ) ( not ( = ?auto_537879 ?auto_537883 ) ) ( not ( = ?auto_537879 ?auto_537884 ) ) ( not ( = ?auto_537879 ?auto_537885 ) ) ( not ( = ?auto_537879 ?auto_537886 ) ) ( not ( = ?auto_537879 ?auto_537887 ) ) ( not ( = ?auto_537879 ?auto_537888 ) ) ( not ( = ?auto_537879 ?auto_537889 ) ) ( not ( = ?auto_537879 ?auto_537890 ) ) ( not ( = ?auto_537879 ?auto_537891 ) ) ( not ( = ?auto_537879 ?auto_537892 ) ) ( not ( = ?auto_537879 ?auto_537893 ) ) ( not ( = ?auto_537880 ?auto_537881 ) ) ( not ( = ?auto_537880 ?auto_537882 ) ) ( not ( = ?auto_537880 ?auto_537883 ) ) ( not ( = ?auto_537880 ?auto_537884 ) ) ( not ( = ?auto_537880 ?auto_537885 ) ) ( not ( = ?auto_537880 ?auto_537886 ) ) ( not ( = ?auto_537880 ?auto_537887 ) ) ( not ( = ?auto_537880 ?auto_537888 ) ) ( not ( = ?auto_537880 ?auto_537889 ) ) ( not ( = ?auto_537880 ?auto_537890 ) ) ( not ( = ?auto_537880 ?auto_537891 ) ) ( not ( = ?auto_537880 ?auto_537892 ) ) ( not ( = ?auto_537880 ?auto_537893 ) ) ( not ( = ?auto_537881 ?auto_537882 ) ) ( not ( = ?auto_537881 ?auto_537883 ) ) ( not ( = ?auto_537881 ?auto_537884 ) ) ( not ( = ?auto_537881 ?auto_537885 ) ) ( not ( = ?auto_537881 ?auto_537886 ) ) ( not ( = ?auto_537881 ?auto_537887 ) ) ( not ( = ?auto_537881 ?auto_537888 ) ) ( not ( = ?auto_537881 ?auto_537889 ) ) ( not ( = ?auto_537881 ?auto_537890 ) ) ( not ( = ?auto_537881 ?auto_537891 ) ) ( not ( = ?auto_537881 ?auto_537892 ) ) ( not ( = ?auto_537881 ?auto_537893 ) ) ( not ( = ?auto_537882 ?auto_537883 ) ) ( not ( = ?auto_537882 ?auto_537884 ) ) ( not ( = ?auto_537882 ?auto_537885 ) ) ( not ( = ?auto_537882 ?auto_537886 ) ) ( not ( = ?auto_537882 ?auto_537887 ) ) ( not ( = ?auto_537882 ?auto_537888 ) ) ( not ( = ?auto_537882 ?auto_537889 ) ) ( not ( = ?auto_537882 ?auto_537890 ) ) ( not ( = ?auto_537882 ?auto_537891 ) ) ( not ( = ?auto_537882 ?auto_537892 ) ) ( not ( = ?auto_537882 ?auto_537893 ) ) ( not ( = ?auto_537883 ?auto_537884 ) ) ( not ( = ?auto_537883 ?auto_537885 ) ) ( not ( = ?auto_537883 ?auto_537886 ) ) ( not ( = ?auto_537883 ?auto_537887 ) ) ( not ( = ?auto_537883 ?auto_537888 ) ) ( not ( = ?auto_537883 ?auto_537889 ) ) ( not ( = ?auto_537883 ?auto_537890 ) ) ( not ( = ?auto_537883 ?auto_537891 ) ) ( not ( = ?auto_537883 ?auto_537892 ) ) ( not ( = ?auto_537883 ?auto_537893 ) ) ( not ( = ?auto_537884 ?auto_537885 ) ) ( not ( = ?auto_537884 ?auto_537886 ) ) ( not ( = ?auto_537884 ?auto_537887 ) ) ( not ( = ?auto_537884 ?auto_537888 ) ) ( not ( = ?auto_537884 ?auto_537889 ) ) ( not ( = ?auto_537884 ?auto_537890 ) ) ( not ( = ?auto_537884 ?auto_537891 ) ) ( not ( = ?auto_537884 ?auto_537892 ) ) ( not ( = ?auto_537884 ?auto_537893 ) ) ( not ( = ?auto_537885 ?auto_537886 ) ) ( not ( = ?auto_537885 ?auto_537887 ) ) ( not ( = ?auto_537885 ?auto_537888 ) ) ( not ( = ?auto_537885 ?auto_537889 ) ) ( not ( = ?auto_537885 ?auto_537890 ) ) ( not ( = ?auto_537885 ?auto_537891 ) ) ( not ( = ?auto_537885 ?auto_537892 ) ) ( not ( = ?auto_537885 ?auto_537893 ) ) ( not ( = ?auto_537886 ?auto_537887 ) ) ( not ( = ?auto_537886 ?auto_537888 ) ) ( not ( = ?auto_537886 ?auto_537889 ) ) ( not ( = ?auto_537886 ?auto_537890 ) ) ( not ( = ?auto_537886 ?auto_537891 ) ) ( not ( = ?auto_537886 ?auto_537892 ) ) ( not ( = ?auto_537886 ?auto_537893 ) ) ( not ( = ?auto_537887 ?auto_537888 ) ) ( not ( = ?auto_537887 ?auto_537889 ) ) ( not ( = ?auto_537887 ?auto_537890 ) ) ( not ( = ?auto_537887 ?auto_537891 ) ) ( not ( = ?auto_537887 ?auto_537892 ) ) ( not ( = ?auto_537887 ?auto_537893 ) ) ( not ( = ?auto_537888 ?auto_537889 ) ) ( not ( = ?auto_537888 ?auto_537890 ) ) ( not ( = ?auto_537888 ?auto_537891 ) ) ( not ( = ?auto_537888 ?auto_537892 ) ) ( not ( = ?auto_537888 ?auto_537893 ) ) ( not ( = ?auto_537889 ?auto_537890 ) ) ( not ( = ?auto_537889 ?auto_537891 ) ) ( not ( = ?auto_537889 ?auto_537892 ) ) ( not ( = ?auto_537889 ?auto_537893 ) ) ( not ( = ?auto_537890 ?auto_537891 ) ) ( not ( = ?auto_537890 ?auto_537892 ) ) ( not ( = ?auto_537890 ?auto_537893 ) ) ( not ( = ?auto_537891 ?auto_537892 ) ) ( not ( = ?auto_537891 ?auto_537893 ) ) ( not ( = ?auto_537892 ?auto_537893 ) ) ( ON ?auto_537891 ?auto_537892 ) ( ON ?auto_537890 ?auto_537891 ) ( ON ?auto_537889 ?auto_537890 ) ( ON ?auto_537888 ?auto_537889 ) ( ON ?auto_537887 ?auto_537888 ) ( ON ?auto_537886 ?auto_537887 ) ( ON ?auto_537885 ?auto_537886 ) ( CLEAR ?auto_537883 ) ( ON ?auto_537884 ?auto_537885 ) ( CLEAR ?auto_537884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_537879 ?auto_537880 ?auto_537881 ?auto_537882 ?auto_537883 ?auto_537884 )
      ( MAKE-14PILE ?auto_537879 ?auto_537880 ?auto_537881 ?auto_537882 ?auto_537883 ?auto_537884 ?auto_537885 ?auto_537886 ?auto_537887 ?auto_537888 ?auto_537889 ?auto_537890 ?auto_537891 ?auto_537892 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537937 - BLOCK
      ?auto_537938 - BLOCK
      ?auto_537939 - BLOCK
      ?auto_537940 - BLOCK
      ?auto_537941 - BLOCK
      ?auto_537942 - BLOCK
      ?auto_537943 - BLOCK
      ?auto_537944 - BLOCK
      ?auto_537945 - BLOCK
      ?auto_537946 - BLOCK
      ?auto_537947 - BLOCK
      ?auto_537948 - BLOCK
      ?auto_537949 - BLOCK
      ?auto_537950 - BLOCK
    )
    :vars
    (
      ?auto_537951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_537950 ?auto_537951 ) ( ON-TABLE ?auto_537937 ) ( ON ?auto_537938 ?auto_537937 ) ( ON ?auto_537939 ?auto_537938 ) ( ON ?auto_537940 ?auto_537939 ) ( not ( = ?auto_537937 ?auto_537938 ) ) ( not ( = ?auto_537937 ?auto_537939 ) ) ( not ( = ?auto_537937 ?auto_537940 ) ) ( not ( = ?auto_537937 ?auto_537941 ) ) ( not ( = ?auto_537937 ?auto_537942 ) ) ( not ( = ?auto_537937 ?auto_537943 ) ) ( not ( = ?auto_537937 ?auto_537944 ) ) ( not ( = ?auto_537937 ?auto_537945 ) ) ( not ( = ?auto_537937 ?auto_537946 ) ) ( not ( = ?auto_537937 ?auto_537947 ) ) ( not ( = ?auto_537937 ?auto_537948 ) ) ( not ( = ?auto_537937 ?auto_537949 ) ) ( not ( = ?auto_537937 ?auto_537950 ) ) ( not ( = ?auto_537937 ?auto_537951 ) ) ( not ( = ?auto_537938 ?auto_537939 ) ) ( not ( = ?auto_537938 ?auto_537940 ) ) ( not ( = ?auto_537938 ?auto_537941 ) ) ( not ( = ?auto_537938 ?auto_537942 ) ) ( not ( = ?auto_537938 ?auto_537943 ) ) ( not ( = ?auto_537938 ?auto_537944 ) ) ( not ( = ?auto_537938 ?auto_537945 ) ) ( not ( = ?auto_537938 ?auto_537946 ) ) ( not ( = ?auto_537938 ?auto_537947 ) ) ( not ( = ?auto_537938 ?auto_537948 ) ) ( not ( = ?auto_537938 ?auto_537949 ) ) ( not ( = ?auto_537938 ?auto_537950 ) ) ( not ( = ?auto_537938 ?auto_537951 ) ) ( not ( = ?auto_537939 ?auto_537940 ) ) ( not ( = ?auto_537939 ?auto_537941 ) ) ( not ( = ?auto_537939 ?auto_537942 ) ) ( not ( = ?auto_537939 ?auto_537943 ) ) ( not ( = ?auto_537939 ?auto_537944 ) ) ( not ( = ?auto_537939 ?auto_537945 ) ) ( not ( = ?auto_537939 ?auto_537946 ) ) ( not ( = ?auto_537939 ?auto_537947 ) ) ( not ( = ?auto_537939 ?auto_537948 ) ) ( not ( = ?auto_537939 ?auto_537949 ) ) ( not ( = ?auto_537939 ?auto_537950 ) ) ( not ( = ?auto_537939 ?auto_537951 ) ) ( not ( = ?auto_537940 ?auto_537941 ) ) ( not ( = ?auto_537940 ?auto_537942 ) ) ( not ( = ?auto_537940 ?auto_537943 ) ) ( not ( = ?auto_537940 ?auto_537944 ) ) ( not ( = ?auto_537940 ?auto_537945 ) ) ( not ( = ?auto_537940 ?auto_537946 ) ) ( not ( = ?auto_537940 ?auto_537947 ) ) ( not ( = ?auto_537940 ?auto_537948 ) ) ( not ( = ?auto_537940 ?auto_537949 ) ) ( not ( = ?auto_537940 ?auto_537950 ) ) ( not ( = ?auto_537940 ?auto_537951 ) ) ( not ( = ?auto_537941 ?auto_537942 ) ) ( not ( = ?auto_537941 ?auto_537943 ) ) ( not ( = ?auto_537941 ?auto_537944 ) ) ( not ( = ?auto_537941 ?auto_537945 ) ) ( not ( = ?auto_537941 ?auto_537946 ) ) ( not ( = ?auto_537941 ?auto_537947 ) ) ( not ( = ?auto_537941 ?auto_537948 ) ) ( not ( = ?auto_537941 ?auto_537949 ) ) ( not ( = ?auto_537941 ?auto_537950 ) ) ( not ( = ?auto_537941 ?auto_537951 ) ) ( not ( = ?auto_537942 ?auto_537943 ) ) ( not ( = ?auto_537942 ?auto_537944 ) ) ( not ( = ?auto_537942 ?auto_537945 ) ) ( not ( = ?auto_537942 ?auto_537946 ) ) ( not ( = ?auto_537942 ?auto_537947 ) ) ( not ( = ?auto_537942 ?auto_537948 ) ) ( not ( = ?auto_537942 ?auto_537949 ) ) ( not ( = ?auto_537942 ?auto_537950 ) ) ( not ( = ?auto_537942 ?auto_537951 ) ) ( not ( = ?auto_537943 ?auto_537944 ) ) ( not ( = ?auto_537943 ?auto_537945 ) ) ( not ( = ?auto_537943 ?auto_537946 ) ) ( not ( = ?auto_537943 ?auto_537947 ) ) ( not ( = ?auto_537943 ?auto_537948 ) ) ( not ( = ?auto_537943 ?auto_537949 ) ) ( not ( = ?auto_537943 ?auto_537950 ) ) ( not ( = ?auto_537943 ?auto_537951 ) ) ( not ( = ?auto_537944 ?auto_537945 ) ) ( not ( = ?auto_537944 ?auto_537946 ) ) ( not ( = ?auto_537944 ?auto_537947 ) ) ( not ( = ?auto_537944 ?auto_537948 ) ) ( not ( = ?auto_537944 ?auto_537949 ) ) ( not ( = ?auto_537944 ?auto_537950 ) ) ( not ( = ?auto_537944 ?auto_537951 ) ) ( not ( = ?auto_537945 ?auto_537946 ) ) ( not ( = ?auto_537945 ?auto_537947 ) ) ( not ( = ?auto_537945 ?auto_537948 ) ) ( not ( = ?auto_537945 ?auto_537949 ) ) ( not ( = ?auto_537945 ?auto_537950 ) ) ( not ( = ?auto_537945 ?auto_537951 ) ) ( not ( = ?auto_537946 ?auto_537947 ) ) ( not ( = ?auto_537946 ?auto_537948 ) ) ( not ( = ?auto_537946 ?auto_537949 ) ) ( not ( = ?auto_537946 ?auto_537950 ) ) ( not ( = ?auto_537946 ?auto_537951 ) ) ( not ( = ?auto_537947 ?auto_537948 ) ) ( not ( = ?auto_537947 ?auto_537949 ) ) ( not ( = ?auto_537947 ?auto_537950 ) ) ( not ( = ?auto_537947 ?auto_537951 ) ) ( not ( = ?auto_537948 ?auto_537949 ) ) ( not ( = ?auto_537948 ?auto_537950 ) ) ( not ( = ?auto_537948 ?auto_537951 ) ) ( not ( = ?auto_537949 ?auto_537950 ) ) ( not ( = ?auto_537949 ?auto_537951 ) ) ( not ( = ?auto_537950 ?auto_537951 ) ) ( ON ?auto_537949 ?auto_537950 ) ( ON ?auto_537948 ?auto_537949 ) ( ON ?auto_537947 ?auto_537948 ) ( ON ?auto_537946 ?auto_537947 ) ( ON ?auto_537945 ?auto_537946 ) ( ON ?auto_537944 ?auto_537945 ) ( ON ?auto_537943 ?auto_537944 ) ( ON ?auto_537942 ?auto_537943 ) ( CLEAR ?auto_537940 ) ( ON ?auto_537941 ?auto_537942 ) ( CLEAR ?auto_537941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_537937 ?auto_537938 ?auto_537939 ?auto_537940 ?auto_537941 )
      ( MAKE-14PILE ?auto_537937 ?auto_537938 ?auto_537939 ?auto_537940 ?auto_537941 ?auto_537942 ?auto_537943 ?auto_537944 ?auto_537945 ?auto_537946 ?auto_537947 ?auto_537948 ?auto_537949 ?auto_537950 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_537995 - BLOCK
      ?auto_537996 - BLOCK
      ?auto_537997 - BLOCK
      ?auto_537998 - BLOCK
      ?auto_537999 - BLOCK
      ?auto_538000 - BLOCK
      ?auto_538001 - BLOCK
      ?auto_538002 - BLOCK
      ?auto_538003 - BLOCK
      ?auto_538004 - BLOCK
      ?auto_538005 - BLOCK
      ?auto_538006 - BLOCK
      ?auto_538007 - BLOCK
      ?auto_538008 - BLOCK
    )
    :vars
    (
      ?auto_538009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538008 ?auto_538009 ) ( ON-TABLE ?auto_537995 ) ( ON ?auto_537996 ?auto_537995 ) ( ON ?auto_537997 ?auto_537996 ) ( not ( = ?auto_537995 ?auto_537996 ) ) ( not ( = ?auto_537995 ?auto_537997 ) ) ( not ( = ?auto_537995 ?auto_537998 ) ) ( not ( = ?auto_537995 ?auto_537999 ) ) ( not ( = ?auto_537995 ?auto_538000 ) ) ( not ( = ?auto_537995 ?auto_538001 ) ) ( not ( = ?auto_537995 ?auto_538002 ) ) ( not ( = ?auto_537995 ?auto_538003 ) ) ( not ( = ?auto_537995 ?auto_538004 ) ) ( not ( = ?auto_537995 ?auto_538005 ) ) ( not ( = ?auto_537995 ?auto_538006 ) ) ( not ( = ?auto_537995 ?auto_538007 ) ) ( not ( = ?auto_537995 ?auto_538008 ) ) ( not ( = ?auto_537995 ?auto_538009 ) ) ( not ( = ?auto_537996 ?auto_537997 ) ) ( not ( = ?auto_537996 ?auto_537998 ) ) ( not ( = ?auto_537996 ?auto_537999 ) ) ( not ( = ?auto_537996 ?auto_538000 ) ) ( not ( = ?auto_537996 ?auto_538001 ) ) ( not ( = ?auto_537996 ?auto_538002 ) ) ( not ( = ?auto_537996 ?auto_538003 ) ) ( not ( = ?auto_537996 ?auto_538004 ) ) ( not ( = ?auto_537996 ?auto_538005 ) ) ( not ( = ?auto_537996 ?auto_538006 ) ) ( not ( = ?auto_537996 ?auto_538007 ) ) ( not ( = ?auto_537996 ?auto_538008 ) ) ( not ( = ?auto_537996 ?auto_538009 ) ) ( not ( = ?auto_537997 ?auto_537998 ) ) ( not ( = ?auto_537997 ?auto_537999 ) ) ( not ( = ?auto_537997 ?auto_538000 ) ) ( not ( = ?auto_537997 ?auto_538001 ) ) ( not ( = ?auto_537997 ?auto_538002 ) ) ( not ( = ?auto_537997 ?auto_538003 ) ) ( not ( = ?auto_537997 ?auto_538004 ) ) ( not ( = ?auto_537997 ?auto_538005 ) ) ( not ( = ?auto_537997 ?auto_538006 ) ) ( not ( = ?auto_537997 ?auto_538007 ) ) ( not ( = ?auto_537997 ?auto_538008 ) ) ( not ( = ?auto_537997 ?auto_538009 ) ) ( not ( = ?auto_537998 ?auto_537999 ) ) ( not ( = ?auto_537998 ?auto_538000 ) ) ( not ( = ?auto_537998 ?auto_538001 ) ) ( not ( = ?auto_537998 ?auto_538002 ) ) ( not ( = ?auto_537998 ?auto_538003 ) ) ( not ( = ?auto_537998 ?auto_538004 ) ) ( not ( = ?auto_537998 ?auto_538005 ) ) ( not ( = ?auto_537998 ?auto_538006 ) ) ( not ( = ?auto_537998 ?auto_538007 ) ) ( not ( = ?auto_537998 ?auto_538008 ) ) ( not ( = ?auto_537998 ?auto_538009 ) ) ( not ( = ?auto_537999 ?auto_538000 ) ) ( not ( = ?auto_537999 ?auto_538001 ) ) ( not ( = ?auto_537999 ?auto_538002 ) ) ( not ( = ?auto_537999 ?auto_538003 ) ) ( not ( = ?auto_537999 ?auto_538004 ) ) ( not ( = ?auto_537999 ?auto_538005 ) ) ( not ( = ?auto_537999 ?auto_538006 ) ) ( not ( = ?auto_537999 ?auto_538007 ) ) ( not ( = ?auto_537999 ?auto_538008 ) ) ( not ( = ?auto_537999 ?auto_538009 ) ) ( not ( = ?auto_538000 ?auto_538001 ) ) ( not ( = ?auto_538000 ?auto_538002 ) ) ( not ( = ?auto_538000 ?auto_538003 ) ) ( not ( = ?auto_538000 ?auto_538004 ) ) ( not ( = ?auto_538000 ?auto_538005 ) ) ( not ( = ?auto_538000 ?auto_538006 ) ) ( not ( = ?auto_538000 ?auto_538007 ) ) ( not ( = ?auto_538000 ?auto_538008 ) ) ( not ( = ?auto_538000 ?auto_538009 ) ) ( not ( = ?auto_538001 ?auto_538002 ) ) ( not ( = ?auto_538001 ?auto_538003 ) ) ( not ( = ?auto_538001 ?auto_538004 ) ) ( not ( = ?auto_538001 ?auto_538005 ) ) ( not ( = ?auto_538001 ?auto_538006 ) ) ( not ( = ?auto_538001 ?auto_538007 ) ) ( not ( = ?auto_538001 ?auto_538008 ) ) ( not ( = ?auto_538001 ?auto_538009 ) ) ( not ( = ?auto_538002 ?auto_538003 ) ) ( not ( = ?auto_538002 ?auto_538004 ) ) ( not ( = ?auto_538002 ?auto_538005 ) ) ( not ( = ?auto_538002 ?auto_538006 ) ) ( not ( = ?auto_538002 ?auto_538007 ) ) ( not ( = ?auto_538002 ?auto_538008 ) ) ( not ( = ?auto_538002 ?auto_538009 ) ) ( not ( = ?auto_538003 ?auto_538004 ) ) ( not ( = ?auto_538003 ?auto_538005 ) ) ( not ( = ?auto_538003 ?auto_538006 ) ) ( not ( = ?auto_538003 ?auto_538007 ) ) ( not ( = ?auto_538003 ?auto_538008 ) ) ( not ( = ?auto_538003 ?auto_538009 ) ) ( not ( = ?auto_538004 ?auto_538005 ) ) ( not ( = ?auto_538004 ?auto_538006 ) ) ( not ( = ?auto_538004 ?auto_538007 ) ) ( not ( = ?auto_538004 ?auto_538008 ) ) ( not ( = ?auto_538004 ?auto_538009 ) ) ( not ( = ?auto_538005 ?auto_538006 ) ) ( not ( = ?auto_538005 ?auto_538007 ) ) ( not ( = ?auto_538005 ?auto_538008 ) ) ( not ( = ?auto_538005 ?auto_538009 ) ) ( not ( = ?auto_538006 ?auto_538007 ) ) ( not ( = ?auto_538006 ?auto_538008 ) ) ( not ( = ?auto_538006 ?auto_538009 ) ) ( not ( = ?auto_538007 ?auto_538008 ) ) ( not ( = ?auto_538007 ?auto_538009 ) ) ( not ( = ?auto_538008 ?auto_538009 ) ) ( ON ?auto_538007 ?auto_538008 ) ( ON ?auto_538006 ?auto_538007 ) ( ON ?auto_538005 ?auto_538006 ) ( ON ?auto_538004 ?auto_538005 ) ( ON ?auto_538003 ?auto_538004 ) ( ON ?auto_538002 ?auto_538003 ) ( ON ?auto_538001 ?auto_538002 ) ( ON ?auto_538000 ?auto_538001 ) ( ON ?auto_537999 ?auto_538000 ) ( CLEAR ?auto_537997 ) ( ON ?auto_537998 ?auto_537999 ) ( CLEAR ?auto_537998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_537995 ?auto_537996 ?auto_537997 ?auto_537998 )
      ( MAKE-14PILE ?auto_537995 ?auto_537996 ?auto_537997 ?auto_537998 ?auto_537999 ?auto_538000 ?auto_538001 ?auto_538002 ?auto_538003 ?auto_538004 ?auto_538005 ?auto_538006 ?auto_538007 ?auto_538008 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_538053 - BLOCK
      ?auto_538054 - BLOCK
      ?auto_538055 - BLOCK
      ?auto_538056 - BLOCK
      ?auto_538057 - BLOCK
      ?auto_538058 - BLOCK
      ?auto_538059 - BLOCK
      ?auto_538060 - BLOCK
      ?auto_538061 - BLOCK
      ?auto_538062 - BLOCK
      ?auto_538063 - BLOCK
      ?auto_538064 - BLOCK
      ?auto_538065 - BLOCK
      ?auto_538066 - BLOCK
    )
    :vars
    (
      ?auto_538067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538066 ?auto_538067 ) ( ON-TABLE ?auto_538053 ) ( ON ?auto_538054 ?auto_538053 ) ( not ( = ?auto_538053 ?auto_538054 ) ) ( not ( = ?auto_538053 ?auto_538055 ) ) ( not ( = ?auto_538053 ?auto_538056 ) ) ( not ( = ?auto_538053 ?auto_538057 ) ) ( not ( = ?auto_538053 ?auto_538058 ) ) ( not ( = ?auto_538053 ?auto_538059 ) ) ( not ( = ?auto_538053 ?auto_538060 ) ) ( not ( = ?auto_538053 ?auto_538061 ) ) ( not ( = ?auto_538053 ?auto_538062 ) ) ( not ( = ?auto_538053 ?auto_538063 ) ) ( not ( = ?auto_538053 ?auto_538064 ) ) ( not ( = ?auto_538053 ?auto_538065 ) ) ( not ( = ?auto_538053 ?auto_538066 ) ) ( not ( = ?auto_538053 ?auto_538067 ) ) ( not ( = ?auto_538054 ?auto_538055 ) ) ( not ( = ?auto_538054 ?auto_538056 ) ) ( not ( = ?auto_538054 ?auto_538057 ) ) ( not ( = ?auto_538054 ?auto_538058 ) ) ( not ( = ?auto_538054 ?auto_538059 ) ) ( not ( = ?auto_538054 ?auto_538060 ) ) ( not ( = ?auto_538054 ?auto_538061 ) ) ( not ( = ?auto_538054 ?auto_538062 ) ) ( not ( = ?auto_538054 ?auto_538063 ) ) ( not ( = ?auto_538054 ?auto_538064 ) ) ( not ( = ?auto_538054 ?auto_538065 ) ) ( not ( = ?auto_538054 ?auto_538066 ) ) ( not ( = ?auto_538054 ?auto_538067 ) ) ( not ( = ?auto_538055 ?auto_538056 ) ) ( not ( = ?auto_538055 ?auto_538057 ) ) ( not ( = ?auto_538055 ?auto_538058 ) ) ( not ( = ?auto_538055 ?auto_538059 ) ) ( not ( = ?auto_538055 ?auto_538060 ) ) ( not ( = ?auto_538055 ?auto_538061 ) ) ( not ( = ?auto_538055 ?auto_538062 ) ) ( not ( = ?auto_538055 ?auto_538063 ) ) ( not ( = ?auto_538055 ?auto_538064 ) ) ( not ( = ?auto_538055 ?auto_538065 ) ) ( not ( = ?auto_538055 ?auto_538066 ) ) ( not ( = ?auto_538055 ?auto_538067 ) ) ( not ( = ?auto_538056 ?auto_538057 ) ) ( not ( = ?auto_538056 ?auto_538058 ) ) ( not ( = ?auto_538056 ?auto_538059 ) ) ( not ( = ?auto_538056 ?auto_538060 ) ) ( not ( = ?auto_538056 ?auto_538061 ) ) ( not ( = ?auto_538056 ?auto_538062 ) ) ( not ( = ?auto_538056 ?auto_538063 ) ) ( not ( = ?auto_538056 ?auto_538064 ) ) ( not ( = ?auto_538056 ?auto_538065 ) ) ( not ( = ?auto_538056 ?auto_538066 ) ) ( not ( = ?auto_538056 ?auto_538067 ) ) ( not ( = ?auto_538057 ?auto_538058 ) ) ( not ( = ?auto_538057 ?auto_538059 ) ) ( not ( = ?auto_538057 ?auto_538060 ) ) ( not ( = ?auto_538057 ?auto_538061 ) ) ( not ( = ?auto_538057 ?auto_538062 ) ) ( not ( = ?auto_538057 ?auto_538063 ) ) ( not ( = ?auto_538057 ?auto_538064 ) ) ( not ( = ?auto_538057 ?auto_538065 ) ) ( not ( = ?auto_538057 ?auto_538066 ) ) ( not ( = ?auto_538057 ?auto_538067 ) ) ( not ( = ?auto_538058 ?auto_538059 ) ) ( not ( = ?auto_538058 ?auto_538060 ) ) ( not ( = ?auto_538058 ?auto_538061 ) ) ( not ( = ?auto_538058 ?auto_538062 ) ) ( not ( = ?auto_538058 ?auto_538063 ) ) ( not ( = ?auto_538058 ?auto_538064 ) ) ( not ( = ?auto_538058 ?auto_538065 ) ) ( not ( = ?auto_538058 ?auto_538066 ) ) ( not ( = ?auto_538058 ?auto_538067 ) ) ( not ( = ?auto_538059 ?auto_538060 ) ) ( not ( = ?auto_538059 ?auto_538061 ) ) ( not ( = ?auto_538059 ?auto_538062 ) ) ( not ( = ?auto_538059 ?auto_538063 ) ) ( not ( = ?auto_538059 ?auto_538064 ) ) ( not ( = ?auto_538059 ?auto_538065 ) ) ( not ( = ?auto_538059 ?auto_538066 ) ) ( not ( = ?auto_538059 ?auto_538067 ) ) ( not ( = ?auto_538060 ?auto_538061 ) ) ( not ( = ?auto_538060 ?auto_538062 ) ) ( not ( = ?auto_538060 ?auto_538063 ) ) ( not ( = ?auto_538060 ?auto_538064 ) ) ( not ( = ?auto_538060 ?auto_538065 ) ) ( not ( = ?auto_538060 ?auto_538066 ) ) ( not ( = ?auto_538060 ?auto_538067 ) ) ( not ( = ?auto_538061 ?auto_538062 ) ) ( not ( = ?auto_538061 ?auto_538063 ) ) ( not ( = ?auto_538061 ?auto_538064 ) ) ( not ( = ?auto_538061 ?auto_538065 ) ) ( not ( = ?auto_538061 ?auto_538066 ) ) ( not ( = ?auto_538061 ?auto_538067 ) ) ( not ( = ?auto_538062 ?auto_538063 ) ) ( not ( = ?auto_538062 ?auto_538064 ) ) ( not ( = ?auto_538062 ?auto_538065 ) ) ( not ( = ?auto_538062 ?auto_538066 ) ) ( not ( = ?auto_538062 ?auto_538067 ) ) ( not ( = ?auto_538063 ?auto_538064 ) ) ( not ( = ?auto_538063 ?auto_538065 ) ) ( not ( = ?auto_538063 ?auto_538066 ) ) ( not ( = ?auto_538063 ?auto_538067 ) ) ( not ( = ?auto_538064 ?auto_538065 ) ) ( not ( = ?auto_538064 ?auto_538066 ) ) ( not ( = ?auto_538064 ?auto_538067 ) ) ( not ( = ?auto_538065 ?auto_538066 ) ) ( not ( = ?auto_538065 ?auto_538067 ) ) ( not ( = ?auto_538066 ?auto_538067 ) ) ( ON ?auto_538065 ?auto_538066 ) ( ON ?auto_538064 ?auto_538065 ) ( ON ?auto_538063 ?auto_538064 ) ( ON ?auto_538062 ?auto_538063 ) ( ON ?auto_538061 ?auto_538062 ) ( ON ?auto_538060 ?auto_538061 ) ( ON ?auto_538059 ?auto_538060 ) ( ON ?auto_538058 ?auto_538059 ) ( ON ?auto_538057 ?auto_538058 ) ( ON ?auto_538056 ?auto_538057 ) ( CLEAR ?auto_538054 ) ( ON ?auto_538055 ?auto_538056 ) ( CLEAR ?auto_538055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_538053 ?auto_538054 ?auto_538055 )
      ( MAKE-14PILE ?auto_538053 ?auto_538054 ?auto_538055 ?auto_538056 ?auto_538057 ?auto_538058 ?auto_538059 ?auto_538060 ?auto_538061 ?auto_538062 ?auto_538063 ?auto_538064 ?auto_538065 ?auto_538066 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_538111 - BLOCK
      ?auto_538112 - BLOCK
      ?auto_538113 - BLOCK
      ?auto_538114 - BLOCK
      ?auto_538115 - BLOCK
      ?auto_538116 - BLOCK
      ?auto_538117 - BLOCK
      ?auto_538118 - BLOCK
      ?auto_538119 - BLOCK
      ?auto_538120 - BLOCK
      ?auto_538121 - BLOCK
      ?auto_538122 - BLOCK
      ?auto_538123 - BLOCK
      ?auto_538124 - BLOCK
    )
    :vars
    (
      ?auto_538125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538124 ?auto_538125 ) ( ON-TABLE ?auto_538111 ) ( not ( = ?auto_538111 ?auto_538112 ) ) ( not ( = ?auto_538111 ?auto_538113 ) ) ( not ( = ?auto_538111 ?auto_538114 ) ) ( not ( = ?auto_538111 ?auto_538115 ) ) ( not ( = ?auto_538111 ?auto_538116 ) ) ( not ( = ?auto_538111 ?auto_538117 ) ) ( not ( = ?auto_538111 ?auto_538118 ) ) ( not ( = ?auto_538111 ?auto_538119 ) ) ( not ( = ?auto_538111 ?auto_538120 ) ) ( not ( = ?auto_538111 ?auto_538121 ) ) ( not ( = ?auto_538111 ?auto_538122 ) ) ( not ( = ?auto_538111 ?auto_538123 ) ) ( not ( = ?auto_538111 ?auto_538124 ) ) ( not ( = ?auto_538111 ?auto_538125 ) ) ( not ( = ?auto_538112 ?auto_538113 ) ) ( not ( = ?auto_538112 ?auto_538114 ) ) ( not ( = ?auto_538112 ?auto_538115 ) ) ( not ( = ?auto_538112 ?auto_538116 ) ) ( not ( = ?auto_538112 ?auto_538117 ) ) ( not ( = ?auto_538112 ?auto_538118 ) ) ( not ( = ?auto_538112 ?auto_538119 ) ) ( not ( = ?auto_538112 ?auto_538120 ) ) ( not ( = ?auto_538112 ?auto_538121 ) ) ( not ( = ?auto_538112 ?auto_538122 ) ) ( not ( = ?auto_538112 ?auto_538123 ) ) ( not ( = ?auto_538112 ?auto_538124 ) ) ( not ( = ?auto_538112 ?auto_538125 ) ) ( not ( = ?auto_538113 ?auto_538114 ) ) ( not ( = ?auto_538113 ?auto_538115 ) ) ( not ( = ?auto_538113 ?auto_538116 ) ) ( not ( = ?auto_538113 ?auto_538117 ) ) ( not ( = ?auto_538113 ?auto_538118 ) ) ( not ( = ?auto_538113 ?auto_538119 ) ) ( not ( = ?auto_538113 ?auto_538120 ) ) ( not ( = ?auto_538113 ?auto_538121 ) ) ( not ( = ?auto_538113 ?auto_538122 ) ) ( not ( = ?auto_538113 ?auto_538123 ) ) ( not ( = ?auto_538113 ?auto_538124 ) ) ( not ( = ?auto_538113 ?auto_538125 ) ) ( not ( = ?auto_538114 ?auto_538115 ) ) ( not ( = ?auto_538114 ?auto_538116 ) ) ( not ( = ?auto_538114 ?auto_538117 ) ) ( not ( = ?auto_538114 ?auto_538118 ) ) ( not ( = ?auto_538114 ?auto_538119 ) ) ( not ( = ?auto_538114 ?auto_538120 ) ) ( not ( = ?auto_538114 ?auto_538121 ) ) ( not ( = ?auto_538114 ?auto_538122 ) ) ( not ( = ?auto_538114 ?auto_538123 ) ) ( not ( = ?auto_538114 ?auto_538124 ) ) ( not ( = ?auto_538114 ?auto_538125 ) ) ( not ( = ?auto_538115 ?auto_538116 ) ) ( not ( = ?auto_538115 ?auto_538117 ) ) ( not ( = ?auto_538115 ?auto_538118 ) ) ( not ( = ?auto_538115 ?auto_538119 ) ) ( not ( = ?auto_538115 ?auto_538120 ) ) ( not ( = ?auto_538115 ?auto_538121 ) ) ( not ( = ?auto_538115 ?auto_538122 ) ) ( not ( = ?auto_538115 ?auto_538123 ) ) ( not ( = ?auto_538115 ?auto_538124 ) ) ( not ( = ?auto_538115 ?auto_538125 ) ) ( not ( = ?auto_538116 ?auto_538117 ) ) ( not ( = ?auto_538116 ?auto_538118 ) ) ( not ( = ?auto_538116 ?auto_538119 ) ) ( not ( = ?auto_538116 ?auto_538120 ) ) ( not ( = ?auto_538116 ?auto_538121 ) ) ( not ( = ?auto_538116 ?auto_538122 ) ) ( not ( = ?auto_538116 ?auto_538123 ) ) ( not ( = ?auto_538116 ?auto_538124 ) ) ( not ( = ?auto_538116 ?auto_538125 ) ) ( not ( = ?auto_538117 ?auto_538118 ) ) ( not ( = ?auto_538117 ?auto_538119 ) ) ( not ( = ?auto_538117 ?auto_538120 ) ) ( not ( = ?auto_538117 ?auto_538121 ) ) ( not ( = ?auto_538117 ?auto_538122 ) ) ( not ( = ?auto_538117 ?auto_538123 ) ) ( not ( = ?auto_538117 ?auto_538124 ) ) ( not ( = ?auto_538117 ?auto_538125 ) ) ( not ( = ?auto_538118 ?auto_538119 ) ) ( not ( = ?auto_538118 ?auto_538120 ) ) ( not ( = ?auto_538118 ?auto_538121 ) ) ( not ( = ?auto_538118 ?auto_538122 ) ) ( not ( = ?auto_538118 ?auto_538123 ) ) ( not ( = ?auto_538118 ?auto_538124 ) ) ( not ( = ?auto_538118 ?auto_538125 ) ) ( not ( = ?auto_538119 ?auto_538120 ) ) ( not ( = ?auto_538119 ?auto_538121 ) ) ( not ( = ?auto_538119 ?auto_538122 ) ) ( not ( = ?auto_538119 ?auto_538123 ) ) ( not ( = ?auto_538119 ?auto_538124 ) ) ( not ( = ?auto_538119 ?auto_538125 ) ) ( not ( = ?auto_538120 ?auto_538121 ) ) ( not ( = ?auto_538120 ?auto_538122 ) ) ( not ( = ?auto_538120 ?auto_538123 ) ) ( not ( = ?auto_538120 ?auto_538124 ) ) ( not ( = ?auto_538120 ?auto_538125 ) ) ( not ( = ?auto_538121 ?auto_538122 ) ) ( not ( = ?auto_538121 ?auto_538123 ) ) ( not ( = ?auto_538121 ?auto_538124 ) ) ( not ( = ?auto_538121 ?auto_538125 ) ) ( not ( = ?auto_538122 ?auto_538123 ) ) ( not ( = ?auto_538122 ?auto_538124 ) ) ( not ( = ?auto_538122 ?auto_538125 ) ) ( not ( = ?auto_538123 ?auto_538124 ) ) ( not ( = ?auto_538123 ?auto_538125 ) ) ( not ( = ?auto_538124 ?auto_538125 ) ) ( ON ?auto_538123 ?auto_538124 ) ( ON ?auto_538122 ?auto_538123 ) ( ON ?auto_538121 ?auto_538122 ) ( ON ?auto_538120 ?auto_538121 ) ( ON ?auto_538119 ?auto_538120 ) ( ON ?auto_538118 ?auto_538119 ) ( ON ?auto_538117 ?auto_538118 ) ( ON ?auto_538116 ?auto_538117 ) ( ON ?auto_538115 ?auto_538116 ) ( ON ?auto_538114 ?auto_538115 ) ( ON ?auto_538113 ?auto_538114 ) ( CLEAR ?auto_538111 ) ( ON ?auto_538112 ?auto_538113 ) ( CLEAR ?auto_538112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_538111 ?auto_538112 )
      ( MAKE-14PILE ?auto_538111 ?auto_538112 ?auto_538113 ?auto_538114 ?auto_538115 ?auto_538116 ?auto_538117 ?auto_538118 ?auto_538119 ?auto_538120 ?auto_538121 ?auto_538122 ?auto_538123 ?auto_538124 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_538169 - BLOCK
      ?auto_538170 - BLOCK
      ?auto_538171 - BLOCK
      ?auto_538172 - BLOCK
      ?auto_538173 - BLOCK
      ?auto_538174 - BLOCK
      ?auto_538175 - BLOCK
      ?auto_538176 - BLOCK
      ?auto_538177 - BLOCK
      ?auto_538178 - BLOCK
      ?auto_538179 - BLOCK
      ?auto_538180 - BLOCK
      ?auto_538181 - BLOCK
      ?auto_538182 - BLOCK
    )
    :vars
    (
      ?auto_538183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538182 ?auto_538183 ) ( not ( = ?auto_538169 ?auto_538170 ) ) ( not ( = ?auto_538169 ?auto_538171 ) ) ( not ( = ?auto_538169 ?auto_538172 ) ) ( not ( = ?auto_538169 ?auto_538173 ) ) ( not ( = ?auto_538169 ?auto_538174 ) ) ( not ( = ?auto_538169 ?auto_538175 ) ) ( not ( = ?auto_538169 ?auto_538176 ) ) ( not ( = ?auto_538169 ?auto_538177 ) ) ( not ( = ?auto_538169 ?auto_538178 ) ) ( not ( = ?auto_538169 ?auto_538179 ) ) ( not ( = ?auto_538169 ?auto_538180 ) ) ( not ( = ?auto_538169 ?auto_538181 ) ) ( not ( = ?auto_538169 ?auto_538182 ) ) ( not ( = ?auto_538169 ?auto_538183 ) ) ( not ( = ?auto_538170 ?auto_538171 ) ) ( not ( = ?auto_538170 ?auto_538172 ) ) ( not ( = ?auto_538170 ?auto_538173 ) ) ( not ( = ?auto_538170 ?auto_538174 ) ) ( not ( = ?auto_538170 ?auto_538175 ) ) ( not ( = ?auto_538170 ?auto_538176 ) ) ( not ( = ?auto_538170 ?auto_538177 ) ) ( not ( = ?auto_538170 ?auto_538178 ) ) ( not ( = ?auto_538170 ?auto_538179 ) ) ( not ( = ?auto_538170 ?auto_538180 ) ) ( not ( = ?auto_538170 ?auto_538181 ) ) ( not ( = ?auto_538170 ?auto_538182 ) ) ( not ( = ?auto_538170 ?auto_538183 ) ) ( not ( = ?auto_538171 ?auto_538172 ) ) ( not ( = ?auto_538171 ?auto_538173 ) ) ( not ( = ?auto_538171 ?auto_538174 ) ) ( not ( = ?auto_538171 ?auto_538175 ) ) ( not ( = ?auto_538171 ?auto_538176 ) ) ( not ( = ?auto_538171 ?auto_538177 ) ) ( not ( = ?auto_538171 ?auto_538178 ) ) ( not ( = ?auto_538171 ?auto_538179 ) ) ( not ( = ?auto_538171 ?auto_538180 ) ) ( not ( = ?auto_538171 ?auto_538181 ) ) ( not ( = ?auto_538171 ?auto_538182 ) ) ( not ( = ?auto_538171 ?auto_538183 ) ) ( not ( = ?auto_538172 ?auto_538173 ) ) ( not ( = ?auto_538172 ?auto_538174 ) ) ( not ( = ?auto_538172 ?auto_538175 ) ) ( not ( = ?auto_538172 ?auto_538176 ) ) ( not ( = ?auto_538172 ?auto_538177 ) ) ( not ( = ?auto_538172 ?auto_538178 ) ) ( not ( = ?auto_538172 ?auto_538179 ) ) ( not ( = ?auto_538172 ?auto_538180 ) ) ( not ( = ?auto_538172 ?auto_538181 ) ) ( not ( = ?auto_538172 ?auto_538182 ) ) ( not ( = ?auto_538172 ?auto_538183 ) ) ( not ( = ?auto_538173 ?auto_538174 ) ) ( not ( = ?auto_538173 ?auto_538175 ) ) ( not ( = ?auto_538173 ?auto_538176 ) ) ( not ( = ?auto_538173 ?auto_538177 ) ) ( not ( = ?auto_538173 ?auto_538178 ) ) ( not ( = ?auto_538173 ?auto_538179 ) ) ( not ( = ?auto_538173 ?auto_538180 ) ) ( not ( = ?auto_538173 ?auto_538181 ) ) ( not ( = ?auto_538173 ?auto_538182 ) ) ( not ( = ?auto_538173 ?auto_538183 ) ) ( not ( = ?auto_538174 ?auto_538175 ) ) ( not ( = ?auto_538174 ?auto_538176 ) ) ( not ( = ?auto_538174 ?auto_538177 ) ) ( not ( = ?auto_538174 ?auto_538178 ) ) ( not ( = ?auto_538174 ?auto_538179 ) ) ( not ( = ?auto_538174 ?auto_538180 ) ) ( not ( = ?auto_538174 ?auto_538181 ) ) ( not ( = ?auto_538174 ?auto_538182 ) ) ( not ( = ?auto_538174 ?auto_538183 ) ) ( not ( = ?auto_538175 ?auto_538176 ) ) ( not ( = ?auto_538175 ?auto_538177 ) ) ( not ( = ?auto_538175 ?auto_538178 ) ) ( not ( = ?auto_538175 ?auto_538179 ) ) ( not ( = ?auto_538175 ?auto_538180 ) ) ( not ( = ?auto_538175 ?auto_538181 ) ) ( not ( = ?auto_538175 ?auto_538182 ) ) ( not ( = ?auto_538175 ?auto_538183 ) ) ( not ( = ?auto_538176 ?auto_538177 ) ) ( not ( = ?auto_538176 ?auto_538178 ) ) ( not ( = ?auto_538176 ?auto_538179 ) ) ( not ( = ?auto_538176 ?auto_538180 ) ) ( not ( = ?auto_538176 ?auto_538181 ) ) ( not ( = ?auto_538176 ?auto_538182 ) ) ( not ( = ?auto_538176 ?auto_538183 ) ) ( not ( = ?auto_538177 ?auto_538178 ) ) ( not ( = ?auto_538177 ?auto_538179 ) ) ( not ( = ?auto_538177 ?auto_538180 ) ) ( not ( = ?auto_538177 ?auto_538181 ) ) ( not ( = ?auto_538177 ?auto_538182 ) ) ( not ( = ?auto_538177 ?auto_538183 ) ) ( not ( = ?auto_538178 ?auto_538179 ) ) ( not ( = ?auto_538178 ?auto_538180 ) ) ( not ( = ?auto_538178 ?auto_538181 ) ) ( not ( = ?auto_538178 ?auto_538182 ) ) ( not ( = ?auto_538178 ?auto_538183 ) ) ( not ( = ?auto_538179 ?auto_538180 ) ) ( not ( = ?auto_538179 ?auto_538181 ) ) ( not ( = ?auto_538179 ?auto_538182 ) ) ( not ( = ?auto_538179 ?auto_538183 ) ) ( not ( = ?auto_538180 ?auto_538181 ) ) ( not ( = ?auto_538180 ?auto_538182 ) ) ( not ( = ?auto_538180 ?auto_538183 ) ) ( not ( = ?auto_538181 ?auto_538182 ) ) ( not ( = ?auto_538181 ?auto_538183 ) ) ( not ( = ?auto_538182 ?auto_538183 ) ) ( ON ?auto_538181 ?auto_538182 ) ( ON ?auto_538180 ?auto_538181 ) ( ON ?auto_538179 ?auto_538180 ) ( ON ?auto_538178 ?auto_538179 ) ( ON ?auto_538177 ?auto_538178 ) ( ON ?auto_538176 ?auto_538177 ) ( ON ?auto_538175 ?auto_538176 ) ( ON ?auto_538174 ?auto_538175 ) ( ON ?auto_538173 ?auto_538174 ) ( ON ?auto_538172 ?auto_538173 ) ( ON ?auto_538171 ?auto_538172 ) ( ON ?auto_538170 ?auto_538171 ) ( ON ?auto_538169 ?auto_538170 ) ( CLEAR ?auto_538169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_538169 )
      ( MAKE-14PILE ?auto_538169 ?auto_538170 ?auto_538171 ?auto_538172 ?auto_538173 ?auto_538174 ?auto_538175 ?auto_538176 ?auto_538177 ?auto_538178 ?auto_538179 ?auto_538180 ?auto_538181 ?auto_538182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538228 - BLOCK
      ?auto_538229 - BLOCK
      ?auto_538230 - BLOCK
      ?auto_538231 - BLOCK
      ?auto_538232 - BLOCK
      ?auto_538233 - BLOCK
      ?auto_538234 - BLOCK
      ?auto_538235 - BLOCK
      ?auto_538236 - BLOCK
      ?auto_538237 - BLOCK
      ?auto_538238 - BLOCK
      ?auto_538239 - BLOCK
      ?auto_538240 - BLOCK
      ?auto_538241 - BLOCK
      ?auto_538242 - BLOCK
    )
    :vars
    (
      ?auto_538243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_538241 ) ( ON ?auto_538242 ?auto_538243 ) ( CLEAR ?auto_538242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_538228 ) ( ON ?auto_538229 ?auto_538228 ) ( ON ?auto_538230 ?auto_538229 ) ( ON ?auto_538231 ?auto_538230 ) ( ON ?auto_538232 ?auto_538231 ) ( ON ?auto_538233 ?auto_538232 ) ( ON ?auto_538234 ?auto_538233 ) ( ON ?auto_538235 ?auto_538234 ) ( ON ?auto_538236 ?auto_538235 ) ( ON ?auto_538237 ?auto_538236 ) ( ON ?auto_538238 ?auto_538237 ) ( ON ?auto_538239 ?auto_538238 ) ( ON ?auto_538240 ?auto_538239 ) ( ON ?auto_538241 ?auto_538240 ) ( not ( = ?auto_538228 ?auto_538229 ) ) ( not ( = ?auto_538228 ?auto_538230 ) ) ( not ( = ?auto_538228 ?auto_538231 ) ) ( not ( = ?auto_538228 ?auto_538232 ) ) ( not ( = ?auto_538228 ?auto_538233 ) ) ( not ( = ?auto_538228 ?auto_538234 ) ) ( not ( = ?auto_538228 ?auto_538235 ) ) ( not ( = ?auto_538228 ?auto_538236 ) ) ( not ( = ?auto_538228 ?auto_538237 ) ) ( not ( = ?auto_538228 ?auto_538238 ) ) ( not ( = ?auto_538228 ?auto_538239 ) ) ( not ( = ?auto_538228 ?auto_538240 ) ) ( not ( = ?auto_538228 ?auto_538241 ) ) ( not ( = ?auto_538228 ?auto_538242 ) ) ( not ( = ?auto_538228 ?auto_538243 ) ) ( not ( = ?auto_538229 ?auto_538230 ) ) ( not ( = ?auto_538229 ?auto_538231 ) ) ( not ( = ?auto_538229 ?auto_538232 ) ) ( not ( = ?auto_538229 ?auto_538233 ) ) ( not ( = ?auto_538229 ?auto_538234 ) ) ( not ( = ?auto_538229 ?auto_538235 ) ) ( not ( = ?auto_538229 ?auto_538236 ) ) ( not ( = ?auto_538229 ?auto_538237 ) ) ( not ( = ?auto_538229 ?auto_538238 ) ) ( not ( = ?auto_538229 ?auto_538239 ) ) ( not ( = ?auto_538229 ?auto_538240 ) ) ( not ( = ?auto_538229 ?auto_538241 ) ) ( not ( = ?auto_538229 ?auto_538242 ) ) ( not ( = ?auto_538229 ?auto_538243 ) ) ( not ( = ?auto_538230 ?auto_538231 ) ) ( not ( = ?auto_538230 ?auto_538232 ) ) ( not ( = ?auto_538230 ?auto_538233 ) ) ( not ( = ?auto_538230 ?auto_538234 ) ) ( not ( = ?auto_538230 ?auto_538235 ) ) ( not ( = ?auto_538230 ?auto_538236 ) ) ( not ( = ?auto_538230 ?auto_538237 ) ) ( not ( = ?auto_538230 ?auto_538238 ) ) ( not ( = ?auto_538230 ?auto_538239 ) ) ( not ( = ?auto_538230 ?auto_538240 ) ) ( not ( = ?auto_538230 ?auto_538241 ) ) ( not ( = ?auto_538230 ?auto_538242 ) ) ( not ( = ?auto_538230 ?auto_538243 ) ) ( not ( = ?auto_538231 ?auto_538232 ) ) ( not ( = ?auto_538231 ?auto_538233 ) ) ( not ( = ?auto_538231 ?auto_538234 ) ) ( not ( = ?auto_538231 ?auto_538235 ) ) ( not ( = ?auto_538231 ?auto_538236 ) ) ( not ( = ?auto_538231 ?auto_538237 ) ) ( not ( = ?auto_538231 ?auto_538238 ) ) ( not ( = ?auto_538231 ?auto_538239 ) ) ( not ( = ?auto_538231 ?auto_538240 ) ) ( not ( = ?auto_538231 ?auto_538241 ) ) ( not ( = ?auto_538231 ?auto_538242 ) ) ( not ( = ?auto_538231 ?auto_538243 ) ) ( not ( = ?auto_538232 ?auto_538233 ) ) ( not ( = ?auto_538232 ?auto_538234 ) ) ( not ( = ?auto_538232 ?auto_538235 ) ) ( not ( = ?auto_538232 ?auto_538236 ) ) ( not ( = ?auto_538232 ?auto_538237 ) ) ( not ( = ?auto_538232 ?auto_538238 ) ) ( not ( = ?auto_538232 ?auto_538239 ) ) ( not ( = ?auto_538232 ?auto_538240 ) ) ( not ( = ?auto_538232 ?auto_538241 ) ) ( not ( = ?auto_538232 ?auto_538242 ) ) ( not ( = ?auto_538232 ?auto_538243 ) ) ( not ( = ?auto_538233 ?auto_538234 ) ) ( not ( = ?auto_538233 ?auto_538235 ) ) ( not ( = ?auto_538233 ?auto_538236 ) ) ( not ( = ?auto_538233 ?auto_538237 ) ) ( not ( = ?auto_538233 ?auto_538238 ) ) ( not ( = ?auto_538233 ?auto_538239 ) ) ( not ( = ?auto_538233 ?auto_538240 ) ) ( not ( = ?auto_538233 ?auto_538241 ) ) ( not ( = ?auto_538233 ?auto_538242 ) ) ( not ( = ?auto_538233 ?auto_538243 ) ) ( not ( = ?auto_538234 ?auto_538235 ) ) ( not ( = ?auto_538234 ?auto_538236 ) ) ( not ( = ?auto_538234 ?auto_538237 ) ) ( not ( = ?auto_538234 ?auto_538238 ) ) ( not ( = ?auto_538234 ?auto_538239 ) ) ( not ( = ?auto_538234 ?auto_538240 ) ) ( not ( = ?auto_538234 ?auto_538241 ) ) ( not ( = ?auto_538234 ?auto_538242 ) ) ( not ( = ?auto_538234 ?auto_538243 ) ) ( not ( = ?auto_538235 ?auto_538236 ) ) ( not ( = ?auto_538235 ?auto_538237 ) ) ( not ( = ?auto_538235 ?auto_538238 ) ) ( not ( = ?auto_538235 ?auto_538239 ) ) ( not ( = ?auto_538235 ?auto_538240 ) ) ( not ( = ?auto_538235 ?auto_538241 ) ) ( not ( = ?auto_538235 ?auto_538242 ) ) ( not ( = ?auto_538235 ?auto_538243 ) ) ( not ( = ?auto_538236 ?auto_538237 ) ) ( not ( = ?auto_538236 ?auto_538238 ) ) ( not ( = ?auto_538236 ?auto_538239 ) ) ( not ( = ?auto_538236 ?auto_538240 ) ) ( not ( = ?auto_538236 ?auto_538241 ) ) ( not ( = ?auto_538236 ?auto_538242 ) ) ( not ( = ?auto_538236 ?auto_538243 ) ) ( not ( = ?auto_538237 ?auto_538238 ) ) ( not ( = ?auto_538237 ?auto_538239 ) ) ( not ( = ?auto_538237 ?auto_538240 ) ) ( not ( = ?auto_538237 ?auto_538241 ) ) ( not ( = ?auto_538237 ?auto_538242 ) ) ( not ( = ?auto_538237 ?auto_538243 ) ) ( not ( = ?auto_538238 ?auto_538239 ) ) ( not ( = ?auto_538238 ?auto_538240 ) ) ( not ( = ?auto_538238 ?auto_538241 ) ) ( not ( = ?auto_538238 ?auto_538242 ) ) ( not ( = ?auto_538238 ?auto_538243 ) ) ( not ( = ?auto_538239 ?auto_538240 ) ) ( not ( = ?auto_538239 ?auto_538241 ) ) ( not ( = ?auto_538239 ?auto_538242 ) ) ( not ( = ?auto_538239 ?auto_538243 ) ) ( not ( = ?auto_538240 ?auto_538241 ) ) ( not ( = ?auto_538240 ?auto_538242 ) ) ( not ( = ?auto_538240 ?auto_538243 ) ) ( not ( = ?auto_538241 ?auto_538242 ) ) ( not ( = ?auto_538241 ?auto_538243 ) ) ( not ( = ?auto_538242 ?auto_538243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_538242 ?auto_538243 )
      ( !STACK ?auto_538242 ?auto_538241 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538290 - BLOCK
      ?auto_538291 - BLOCK
      ?auto_538292 - BLOCK
      ?auto_538293 - BLOCK
      ?auto_538294 - BLOCK
      ?auto_538295 - BLOCK
      ?auto_538296 - BLOCK
      ?auto_538297 - BLOCK
      ?auto_538298 - BLOCK
      ?auto_538299 - BLOCK
      ?auto_538300 - BLOCK
      ?auto_538301 - BLOCK
      ?auto_538302 - BLOCK
      ?auto_538303 - BLOCK
      ?auto_538304 - BLOCK
    )
    :vars
    (
      ?auto_538305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538304 ?auto_538305 ) ( ON-TABLE ?auto_538290 ) ( ON ?auto_538291 ?auto_538290 ) ( ON ?auto_538292 ?auto_538291 ) ( ON ?auto_538293 ?auto_538292 ) ( ON ?auto_538294 ?auto_538293 ) ( ON ?auto_538295 ?auto_538294 ) ( ON ?auto_538296 ?auto_538295 ) ( ON ?auto_538297 ?auto_538296 ) ( ON ?auto_538298 ?auto_538297 ) ( ON ?auto_538299 ?auto_538298 ) ( ON ?auto_538300 ?auto_538299 ) ( ON ?auto_538301 ?auto_538300 ) ( ON ?auto_538302 ?auto_538301 ) ( not ( = ?auto_538290 ?auto_538291 ) ) ( not ( = ?auto_538290 ?auto_538292 ) ) ( not ( = ?auto_538290 ?auto_538293 ) ) ( not ( = ?auto_538290 ?auto_538294 ) ) ( not ( = ?auto_538290 ?auto_538295 ) ) ( not ( = ?auto_538290 ?auto_538296 ) ) ( not ( = ?auto_538290 ?auto_538297 ) ) ( not ( = ?auto_538290 ?auto_538298 ) ) ( not ( = ?auto_538290 ?auto_538299 ) ) ( not ( = ?auto_538290 ?auto_538300 ) ) ( not ( = ?auto_538290 ?auto_538301 ) ) ( not ( = ?auto_538290 ?auto_538302 ) ) ( not ( = ?auto_538290 ?auto_538303 ) ) ( not ( = ?auto_538290 ?auto_538304 ) ) ( not ( = ?auto_538290 ?auto_538305 ) ) ( not ( = ?auto_538291 ?auto_538292 ) ) ( not ( = ?auto_538291 ?auto_538293 ) ) ( not ( = ?auto_538291 ?auto_538294 ) ) ( not ( = ?auto_538291 ?auto_538295 ) ) ( not ( = ?auto_538291 ?auto_538296 ) ) ( not ( = ?auto_538291 ?auto_538297 ) ) ( not ( = ?auto_538291 ?auto_538298 ) ) ( not ( = ?auto_538291 ?auto_538299 ) ) ( not ( = ?auto_538291 ?auto_538300 ) ) ( not ( = ?auto_538291 ?auto_538301 ) ) ( not ( = ?auto_538291 ?auto_538302 ) ) ( not ( = ?auto_538291 ?auto_538303 ) ) ( not ( = ?auto_538291 ?auto_538304 ) ) ( not ( = ?auto_538291 ?auto_538305 ) ) ( not ( = ?auto_538292 ?auto_538293 ) ) ( not ( = ?auto_538292 ?auto_538294 ) ) ( not ( = ?auto_538292 ?auto_538295 ) ) ( not ( = ?auto_538292 ?auto_538296 ) ) ( not ( = ?auto_538292 ?auto_538297 ) ) ( not ( = ?auto_538292 ?auto_538298 ) ) ( not ( = ?auto_538292 ?auto_538299 ) ) ( not ( = ?auto_538292 ?auto_538300 ) ) ( not ( = ?auto_538292 ?auto_538301 ) ) ( not ( = ?auto_538292 ?auto_538302 ) ) ( not ( = ?auto_538292 ?auto_538303 ) ) ( not ( = ?auto_538292 ?auto_538304 ) ) ( not ( = ?auto_538292 ?auto_538305 ) ) ( not ( = ?auto_538293 ?auto_538294 ) ) ( not ( = ?auto_538293 ?auto_538295 ) ) ( not ( = ?auto_538293 ?auto_538296 ) ) ( not ( = ?auto_538293 ?auto_538297 ) ) ( not ( = ?auto_538293 ?auto_538298 ) ) ( not ( = ?auto_538293 ?auto_538299 ) ) ( not ( = ?auto_538293 ?auto_538300 ) ) ( not ( = ?auto_538293 ?auto_538301 ) ) ( not ( = ?auto_538293 ?auto_538302 ) ) ( not ( = ?auto_538293 ?auto_538303 ) ) ( not ( = ?auto_538293 ?auto_538304 ) ) ( not ( = ?auto_538293 ?auto_538305 ) ) ( not ( = ?auto_538294 ?auto_538295 ) ) ( not ( = ?auto_538294 ?auto_538296 ) ) ( not ( = ?auto_538294 ?auto_538297 ) ) ( not ( = ?auto_538294 ?auto_538298 ) ) ( not ( = ?auto_538294 ?auto_538299 ) ) ( not ( = ?auto_538294 ?auto_538300 ) ) ( not ( = ?auto_538294 ?auto_538301 ) ) ( not ( = ?auto_538294 ?auto_538302 ) ) ( not ( = ?auto_538294 ?auto_538303 ) ) ( not ( = ?auto_538294 ?auto_538304 ) ) ( not ( = ?auto_538294 ?auto_538305 ) ) ( not ( = ?auto_538295 ?auto_538296 ) ) ( not ( = ?auto_538295 ?auto_538297 ) ) ( not ( = ?auto_538295 ?auto_538298 ) ) ( not ( = ?auto_538295 ?auto_538299 ) ) ( not ( = ?auto_538295 ?auto_538300 ) ) ( not ( = ?auto_538295 ?auto_538301 ) ) ( not ( = ?auto_538295 ?auto_538302 ) ) ( not ( = ?auto_538295 ?auto_538303 ) ) ( not ( = ?auto_538295 ?auto_538304 ) ) ( not ( = ?auto_538295 ?auto_538305 ) ) ( not ( = ?auto_538296 ?auto_538297 ) ) ( not ( = ?auto_538296 ?auto_538298 ) ) ( not ( = ?auto_538296 ?auto_538299 ) ) ( not ( = ?auto_538296 ?auto_538300 ) ) ( not ( = ?auto_538296 ?auto_538301 ) ) ( not ( = ?auto_538296 ?auto_538302 ) ) ( not ( = ?auto_538296 ?auto_538303 ) ) ( not ( = ?auto_538296 ?auto_538304 ) ) ( not ( = ?auto_538296 ?auto_538305 ) ) ( not ( = ?auto_538297 ?auto_538298 ) ) ( not ( = ?auto_538297 ?auto_538299 ) ) ( not ( = ?auto_538297 ?auto_538300 ) ) ( not ( = ?auto_538297 ?auto_538301 ) ) ( not ( = ?auto_538297 ?auto_538302 ) ) ( not ( = ?auto_538297 ?auto_538303 ) ) ( not ( = ?auto_538297 ?auto_538304 ) ) ( not ( = ?auto_538297 ?auto_538305 ) ) ( not ( = ?auto_538298 ?auto_538299 ) ) ( not ( = ?auto_538298 ?auto_538300 ) ) ( not ( = ?auto_538298 ?auto_538301 ) ) ( not ( = ?auto_538298 ?auto_538302 ) ) ( not ( = ?auto_538298 ?auto_538303 ) ) ( not ( = ?auto_538298 ?auto_538304 ) ) ( not ( = ?auto_538298 ?auto_538305 ) ) ( not ( = ?auto_538299 ?auto_538300 ) ) ( not ( = ?auto_538299 ?auto_538301 ) ) ( not ( = ?auto_538299 ?auto_538302 ) ) ( not ( = ?auto_538299 ?auto_538303 ) ) ( not ( = ?auto_538299 ?auto_538304 ) ) ( not ( = ?auto_538299 ?auto_538305 ) ) ( not ( = ?auto_538300 ?auto_538301 ) ) ( not ( = ?auto_538300 ?auto_538302 ) ) ( not ( = ?auto_538300 ?auto_538303 ) ) ( not ( = ?auto_538300 ?auto_538304 ) ) ( not ( = ?auto_538300 ?auto_538305 ) ) ( not ( = ?auto_538301 ?auto_538302 ) ) ( not ( = ?auto_538301 ?auto_538303 ) ) ( not ( = ?auto_538301 ?auto_538304 ) ) ( not ( = ?auto_538301 ?auto_538305 ) ) ( not ( = ?auto_538302 ?auto_538303 ) ) ( not ( = ?auto_538302 ?auto_538304 ) ) ( not ( = ?auto_538302 ?auto_538305 ) ) ( not ( = ?auto_538303 ?auto_538304 ) ) ( not ( = ?auto_538303 ?auto_538305 ) ) ( not ( = ?auto_538304 ?auto_538305 ) ) ( CLEAR ?auto_538302 ) ( ON ?auto_538303 ?auto_538304 ) ( CLEAR ?auto_538303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_538290 ?auto_538291 ?auto_538292 ?auto_538293 ?auto_538294 ?auto_538295 ?auto_538296 ?auto_538297 ?auto_538298 ?auto_538299 ?auto_538300 ?auto_538301 ?auto_538302 ?auto_538303 )
      ( MAKE-15PILE ?auto_538290 ?auto_538291 ?auto_538292 ?auto_538293 ?auto_538294 ?auto_538295 ?auto_538296 ?auto_538297 ?auto_538298 ?auto_538299 ?auto_538300 ?auto_538301 ?auto_538302 ?auto_538303 ?auto_538304 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538352 - BLOCK
      ?auto_538353 - BLOCK
      ?auto_538354 - BLOCK
      ?auto_538355 - BLOCK
      ?auto_538356 - BLOCK
      ?auto_538357 - BLOCK
      ?auto_538358 - BLOCK
      ?auto_538359 - BLOCK
      ?auto_538360 - BLOCK
      ?auto_538361 - BLOCK
      ?auto_538362 - BLOCK
      ?auto_538363 - BLOCK
      ?auto_538364 - BLOCK
      ?auto_538365 - BLOCK
      ?auto_538366 - BLOCK
    )
    :vars
    (
      ?auto_538367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538366 ?auto_538367 ) ( ON-TABLE ?auto_538352 ) ( ON ?auto_538353 ?auto_538352 ) ( ON ?auto_538354 ?auto_538353 ) ( ON ?auto_538355 ?auto_538354 ) ( ON ?auto_538356 ?auto_538355 ) ( ON ?auto_538357 ?auto_538356 ) ( ON ?auto_538358 ?auto_538357 ) ( ON ?auto_538359 ?auto_538358 ) ( ON ?auto_538360 ?auto_538359 ) ( ON ?auto_538361 ?auto_538360 ) ( ON ?auto_538362 ?auto_538361 ) ( ON ?auto_538363 ?auto_538362 ) ( not ( = ?auto_538352 ?auto_538353 ) ) ( not ( = ?auto_538352 ?auto_538354 ) ) ( not ( = ?auto_538352 ?auto_538355 ) ) ( not ( = ?auto_538352 ?auto_538356 ) ) ( not ( = ?auto_538352 ?auto_538357 ) ) ( not ( = ?auto_538352 ?auto_538358 ) ) ( not ( = ?auto_538352 ?auto_538359 ) ) ( not ( = ?auto_538352 ?auto_538360 ) ) ( not ( = ?auto_538352 ?auto_538361 ) ) ( not ( = ?auto_538352 ?auto_538362 ) ) ( not ( = ?auto_538352 ?auto_538363 ) ) ( not ( = ?auto_538352 ?auto_538364 ) ) ( not ( = ?auto_538352 ?auto_538365 ) ) ( not ( = ?auto_538352 ?auto_538366 ) ) ( not ( = ?auto_538352 ?auto_538367 ) ) ( not ( = ?auto_538353 ?auto_538354 ) ) ( not ( = ?auto_538353 ?auto_538355 ) ) ( not ( = ?auto_538353 ?auto_538356 ) ) ( not ( = ?auto_538353 ?auto_538357 ) ) ( not ( = ?auto_538353 ?auto_538358 ) ) ( not ( = ?auto_538353 ?auto_538359 ) ) ( not ( = ?auto_538353 ?auto_538360 ) ) ( not ( = ?auto_538353 ?auto_538361 ) ) ( not ( = ?auto_538353 ?auto_538362 ) ) ( not ( = ?auto_538353 ?auto_538363 ) ) ( not ( = ?auto_538353 ?auto_538364 ) ) ( not ( = ?auto_538353 ?auto_538365 ) ) ( not ( = ?auto_538353 ?auto_538366 ) ) ( not ( = ?auto_538353 ?auto_538367 ) ) ( not ( = ?auto_538354 ?auto_538355 ) ) ( not ( = ?auto_538354 ?auto_538356 ) ) ( not ( = ?auto_538354 ?auto_538357 ) ) ( not ( = ?auto_538354 ?auto_538358 ) ) ( not ( = ?auto_538354 ?auto_538359 ) ) ( not ( = ?auto_538354 ?auto_538360 ) ) ( not ( = ?auto_538354 ?auto_538361 ) ) ( not ( = ?auto_538354 ?auto_538362 ) ) ( not ( = ?auto_538354 ?auto_538363 ) ) ( not ( = ?auto_538354 ?auto_538364 ) ) ( not ( = ?auto_538354 ?auto_538365 ) ) ( not ( = ?auto_538354 ?auto_538366 ) ) ( not ( = ?auto_538354 ?auto_538367 ) ) ( not ( = ?auto_538355 ?auto_538356 ) ) ( not ( = ?auto_538355 ?auto_538357 ) ) ( not ( = ?auto_538355 ?auto_538358 ) ) ( not ( = ?auto_538355 ?auto_538359 ) ) ( not ( = ?auto_538355 ?auto_538360 ) ) ( not ( = ?auto_538355 ?auto_538361 ) ) ( not ( = ?auto_538355 ?auto_538362 ) ) ( not ( = ?auto_538355 ?auto_538363 ) ) ( not ( = ?auto_538355 ?auto_538364 ) ) ( not ( = ?auto_538355 ?auto_538365 ) ) ( not ( = ?auto_538355 ?auto_538366 ) ) ( not ( = ?auto_538355 ?auto_538367 ) ) ( not ( = ?auto_538356 ?auto_538357 ) ) ( not ( = ?auto_538356 ?auto_538358 ) ) ( not ( = ?auto_538356 ?auto_538359 ) ) ( not ( = ?auto_538356 ?auto_538360 ) ) ( not ( = ?auto_538356 ?auto_538361 ) ) ( not ( = ?auto_538356 ?auto_538362 ) ) ( not ( = ?auto_538356 ?auto_538363 ) ) ( not ( = ?auto_538356 ?auto_538364 ) ) ( not ( = ?auto_538356 ?auto_538365 ) ) ( not ( = ?auto_538356 ?auto_538366 ) ) ( not ( = ?auto_538356 ?auto_538367 ) ) ( not ( = ?auto_538357 ?auto_538358 ) ) ( not ( = ?auto_538357 ?auto_538359 ) ) ( not ( = ?auto_538357 ?auto_538360 ) ) ( not ( = ?auto_538357 ?auto_538361 ) ) ( not ( = ?auto_538357 ?auto_538362 ) ) ( not ( = ?auto_538357 ?auto_538363 ) ) ( not ( = ?auto_538357 ?auto_538364 ) ) ( not ( = ?auto_538357 ?auto_538365 ) ) ( not ( = ?auto_538357 ?auto_538366 ) ) ( not ( = ?auto_538357 ?auto_538367 ) ) ( not ( = ?auto_538358 ?auto_538359 ) ) ( not ( = ?auto_538358 ?auto_538360 ) ) ( not ( = ?auto_538358 ?auto_538361 ) ) ( not ( = ?auto_538358 ?auto_538362 ) ) ( not ( = ?auto_538358 ?auto_538363 ) ) ( not ( = ?auto_538358 ?auto_538364 ) ) ( not ( = ?auto_538358 ?auto_538365 ) ) ( not ( = ?auto_538358 ?auto_538366 ) ) ( not ( = ?auto_538358 ?auto_538367 ) ) ( not ( = ?auto_538359 ?auto_538360 ) ) ( not ( = ?auto_538359 ?auto_538361 ) ) ( not ( = ?auto_538359 ?auto_538362 ) ) ( not ( = ?auto_538359 ?auto_538363 ) ) ( not ( = ?auto_538359 ?auto_538364 ) ) ( not ( = ?auto_538359 ?auto_538365 ) ) ( not ( = ?auto_538359 ?auto_538366 ) ) ( not ( = ?auto_538359 ?auto_538367 ) ) ( not ( = ?auto_538360 ?auto_538361 ) ) ( not ( = ?auto_538360 ?auto_538362 ) ) ( not ( = ?auto_538360 ?auto_538363 ) ) ( not ( = ?auto_538360 ?auto_538364 ) ) ( not ( = ?auto_538360 ?auto_538365 ) ) ( not ( = ?auto_538360 ?auto_538366 ) ) ( not ( = ?auto_538360 ?auto_538367 ) ) ( not ( = ?auto_538361 ?auto_538362 ) ) ( not ( = ?auto_538361 ?auto_538363 ) ) ( not ( = ?auto_538361 ?auto_538364 ) ) ( not ( = ?auto_538361 ?auto_538365 ) ) ( not ( = ?auto_538361 ?auto_538366 ) ) ( not ( = ?auto_538361 ?auto_538367 ) ) ( not ( = ?auto_538362 ?auto_538363 ) ) ( not ( = ?auto_538362 ?auto_538364 ) ) ( not ( = ?auto_538362 ?auto_538365 ) ) ( not ( = ?auto_538362 ?auto_538366 ) ) ( not ( = ?auto_538362 ?auto_538367 ) ) ( not ( = ?auto_538363 ?auto_538364 ) ) ( not ( = ?auto_538363 ?auto_538365 ) ) ( not ( = ?auto_538363 ?auto_538366 ) ) ( not ( = ?auto_538363 ?auto_538367 ) ) ( not ( = ?auto_538364 ?auto_538365 ) ) ( not ( = ?auto_538364 ?auto_538366 ) ) ( not ( = ?auto_538364 ?auto_538367 ) ) ( not ( = ?auto_538365 ?auto_538366 ) ) ( not ( = ?auto_538365 ?auto_538367 ) ) ( not ( = ?auto_538366 ?auto_538367 ) ) ( ON ?auto_538365 ?auto_538366 ) ( CLEAR ?auto_538363 ) ( ON ?auto_538364 ?auto_538365 ) ( CLEAR ?auto_538364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_538352 ?auto_538353 ?auto_538354 ?auto_538355 ?auto_538356 ?auto_538357 ?auto_538358 ?auto_538359 ?auto_538360 ?auto_538361 ?auto_538362 ?auto_538363 ?auto_538364 )
      ( MAKE-15PILE ?auto_538352 ?auto_538353 ?auto_538354 ?auto_538355 ?auto_538356 ?auto_538357 ?auto_538358 ?auto_538359 ?auto_538360 ?auto_538361 ?auto_538362 ?auto_538363 ?auto_538364 ?auto_538365 ?auto_538366 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538414 - BLOCK
      ?auto_538415 - BLOCK
      ?auto_538416 - BLOCK
      ?auto_538417 - BLOCK
      ?auto_538418 - BLOCK
      ?auto_538419 - BLOCK
      ?auto_538420 - BLOCK
      ?auto_538421 - BLOCK
      ?auto_538422 - BLOCK
      ?auto_538423 - BLOCK
      ?auto_538424 - BLOCK
      ?auto_538425 - BLOCK
      ?auto_538426 - BLOCK
      ?auto_538427 - BLOCK
      ?auto_538428 - BLOCK
    )
    :vars
    (
      ?auto_538429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538428 ?auto_538429 ) ( ON-TABLE ?auto_538414 ) ( ON ?auto_538415 ?auto_538414 ) ( ON ?auto_538416 ?auto_538415 ) ( ON ?auto_538417 ?auto_538416 ) ( ON ?auto_538418 ?auto_538417 ) ( ON ?auto_538419 ?auto_538418 ) ( ON ?auto_538420 ?auto_538419 ) ( ON ?auto_538421 ?auto_538420 ) ( ON ?auto_538422 ?auto_538421 ) ( ON ?auto_538423 ?auto_538422 ) ( ON ?auto_538424 ?auto_538423 ) ( not ( = ?auto_538414 ?auto_538415 ) ) ( not ( = ?auto_538414 ?auto_538416 ) ) ( not ( = ?auto_538414 ?auto_538417 ) ) ( not ( = ?auto_538414 ?auto_538418 ) ) ( not ( = ?auto_538414 ?auto_538419 ) ) ( not ( = ?auto_538414 ?auto_538420 ) ) ( not ( = ?auto_538414 ?auto_538421 ) ) ( not ( = ?auto_538414 ?auto_538422 ) ) ( not ( = ?auto_538414 ?auto_538423 ) ) ( not ( = ?auto_538414 ?auto_538424 ) ) ( not ( = ?auto_538414 ?auto_538425 ) ) ( not ( = ?auto_538414 ?auto_538426 ) ) ( not ( = ?auto_538414 ?auto_538427 ) ) ( not ( = ?auto_538414 ?auto_538428 ) ) ( not ( = ?auto_538414 ?auto_538429 ) ) ( not ( = ?auto_538415 ?auto_538416 ) ) ( not ( = ?auto_538415 ?auto_538417 ) ) ( not ( = ?auto_538415 ?auto_538418 ) ) ( not ( = ?auto_538415 ?auto_538419 ) ) ( not ( = ?auto_538415 ?auto_538420 ) ) ( not ( = ?auto_538415 ?auto_538421 ) ) ( not ( = ?auto_538415 ?auto_538422 ) ) ( not ( = ?auto_538415 ?auto_538423 ) ) ( not ( = ?auto_538415 ?auto_538424 ) ) ( not ( = ?auto_538415 ?auto_538425 ) ) ( not ( = ?auto_538415 ?auto_538426 ) ) ( not ( = ?auto_538415 ?auto_538427 ) ) ( not ( = ?auto_538415 ?auto_538428 ) ) ( not ( = ?auto_538415 ?auto_538429 ) ) ( not ( = ?auto_538416 ?auto_538417 ) ) ( not ( = ?auto_538416 ?auto_538418 ) ) ( not ( = ?auto_538416 ?auto_538419 ) ) ( not ( = ?auto_538416 ?auto_538420 ) ) ( not ( = ?auto_538416 ?auto_538421 ) ) ( not ( = ?auto_538416 ?auto_538422 ) ) ( not ( = ?auto_538416 ?auto_538423 ) ) ( not ( = ?auto_538416 ?auto_538424 ) ) ( not ( = ?auto_538416 ?auto_538425 ) ) ( not ( = ?auto_538416 ?auto_538426 ) ) ( not ( = ?auto_538416 ?auto_538427 ) ) ( not ( = ?auto_538416 ?auto_538428 ) ) ( not ( = ?auto_538416 ?auto_538429 ) ) ( not ( = ?auto_538417 ?auto_538418 ) ) ( not ( = ?auto_538417 ?auto_538419 ) ) ( not ( = ?auto_538417 ?auto_538420 ) ) ( not ( = ?auto_538417 ?auto_538421 ) ) ( not ( = ?auto_538417 ?auto_538422 ) ) ( not ( = ?auto_538417 ?auto_538423 ) ) ( not ( = ?auto_538417 ?auto_538424 ) ) ( not ( = ?auto_538417 ?auto_538425 ) ) ( not ( = ?auto_538417 ?auto_538426 ) ) ( not ( = ?auto_538417 ?auto_538427 ) ) ( not ( = ?auto_538417 ?auto_538428 ) ) ( not ( = ?auto_538417 ?auto_538429 ) ) ( not ( = ?auto_538418 ?auto_538419 ) ) ( not ( = ?auto_538418 ?auto_538420 ) ) ( not ( = ?auto_538418 ?auto_538421 ) ) ( not ( = ?auto_538418 ?auto_538422 ) ) ( not ( = ?auto_538418 ?auto_538423 ) ) ( not ( = ?auto_538418 ?auto_538424 ) ) ( not ( = ?auto_538418 ?auto_538425 ) ) ( not ( = ?auto_538418 ?auto_538426 ) ) ( not ( = ?auto_538418 ?auto_538427 ) ) ( not ( = ?auto_538418 ?auto_538428 ) ) ( not ( = ?auto_538418 ?auto_538429 ) ) ( not ( = ?auto_538419 ?auto_538420 ) ) ( not ( = ?auto_538419 ?auto_538421 ) ) ( not ( = ?auto_538419 ?auto_538422 ) ) ( not ( = ?auto_538419 ?auto_538423 ) ) ( not ( = ?auto_538419 ?auto_538424 ) ) ( not ( = ?auto_538419 ?auto_538425 ) ) ( not ( = ?auto_538419 ?auto_538426 ) ) ( not ( = ?auto_538419 ?auto_538427 ) ) ( not ( = ?auto_538419 ?auto_538428 ) ) ( not ( = ?auto_538419 ?auto_538429 ) ) ( not ( = ?auto_538420 ?auto_538421 ) ) ( not ( = ?auto_538420 ?auto_538422 ) ) ( not ( = ?auto_538420 ?auto_538423 ) ) ( not ( = ?auto_538420 ?auto_538424 ) ) ( not ( = ?auto_538420 ?auto_538425 ) ) ( not ( = ?auto_538420 ?auto_538426 ) ) ( not ( = ?auto_538420 ?auto_538427 ) ) ( not ( = ?auto_538420 ?auto_538428 ) ) ( not ( = ?auto_538420 ?auto_538429 ) ) ( not ( = ?auto_538421 ?auto_538422 ) ) ( not ( = ?auto_538421 ?auto_538423 ) ) ( not ( = ?auto_538421 ?auto_538424 ) ) ( not ( = ?auto_538421 ?auto_538425 ) ) ( not ( = ?auto_538421 ?auto_538426 ) ) ( not ( = ?auto_538421 ?auto_538427 ) ) ( not ( = ?auto_538421 ?auto_538428 ) ) ( not ( = ?auto_538421 ?auto_538429 ) ) ( not ( = ?auto_538422 ?auto_538423 ) ) ( not ( = ?auto_538422 ?auto_538424 ) ) ( not ( = ?auto_538422 ?auto_538425 ) ) ( not ( = ?auto_538422 ?auto_538426 ) ) ( not ( = ?auto_538422 ?auto_538427 ) ) ( not ( = ?auto_538422 ?auto_538428 ) ) ( not ( = ?auto_538422 ?auto_538429 ) ) ( not ( = ?auto_538423 ?auto_538424 ) ) ( not ( = ?auto_538423 ?auto_538425 ) ) ( not ( = ?auto_538423 ?auto_538426 ) ) ( not ( = ?auto_538423 ?auto_538427 ) ) ( not ( = ?auto_538423 ?auto_538428 ) ) ( not ( = ?auto_538423 ?auto_538429 ) ) ( not ( = ?auto_538424 ?auto_538425 ) ) ( not ( = ?auto_538424 ?auto_538426 ) ) ( not ( = ?auto_538424 ?auto_538427 ) ) ( not ( = ?auto_538424 ?auto_538428 ) ) ( not ( = ?auto_538424 ?auto_538429 ) ) ( not ( = ?auto_538425 ?auto_538426 ) ) ( not ( = ?auto_538425 ?auto_538427 ) ) ( not ( = ?auto_538425 ?auto_538428 ) ) ( not ( = ?auto_538425 ?auto_538429 ) ) ( not ( = ?auto_538426 ?auto_538427 ) ) ( not ( = ?auto_538426 ?auto_538428 ) ) ( not ( = ?auto_538426 ?auto_538429 ) ) ( not ( = ?auto_538427 ?auto_538428 ) ) ( not ( = ?auto_538427 ?auto_538429 ) ) ( not ( = ?auto_538428 ?auto_538429 ) ) ( ON ?auto_538427 ?auto_538428 ) ( ON ?auto_538426 ?auto_538427 ) ( CLEAR ?auto_538424 ) ( ON ?auto_538425 ?auto_538426 ) ( CLEAR ?auto_538425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_538414 ?auto_538415 ?auto_538416 ?auto_538417 ?auto_538418 ?auto_538419 ?auto_538420 ?auto_538421 ?auto_538422 ?auto_538423 ?auto_538424 ?auto_538425 )
      ( MAKE-15PILE ?auto_538414 ?auto_538415 ?auto_538416 ?auto_538417 ?auto_538418 ?auto_538419 ?auto_538420 ?auto_538421 ?auto_538422 ?auto_538423 ?auto_538424 ?auto_538425 ?auto_538426 ?auto_538427 ?auto_538428 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538476 - BLOCK
      ?auto_538477 - BLOCK
      ?auto_538478 - BLOCK
      ?auto_538479 - BLOCK
      ?auto_538480 - BLOCK
      ?auto_538481 - BLOCK
      ?auto_538482 - BLOCK
      ?auto_538483 - BLOCK
      ?auto_538484 - BLOCK
      ?auto_538485 - BLOCK
      ?auto_538486 - BLOCK
      ?auto_538487 - BLOCK
      ?auto_538488 - BLOCK
      ?auto_538489 - BLOCK
      ?auto_538490 - BLOCK
    )
    :vars
    (
      ?auto_538491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538490 ?auto_538491 ) ( ON-TABLE ?auto_538476 ) ( ON ?auto_538477 ?auto_538476 ) ( ON ?auto_538478 ?auto_538477 ) ( ON ?auto_538479 ?auto_538478 ) ( ON ?auto_538480 ?auto_538479 ) ( ON ?auto_538481 ?auto_538480 ) ( ON ?auto_538482 ?auto_538481 ) ( ON ?auto_538483 ?auto_538482 ) ( ON ?auto_538484 ?auto_538483 ) ( ON ?auto_538485 ?auto_538484 ) ( not ( = ?auto_538476 ?auto_538477 ) ) ( not ( = ?auto_538476 ?auto_538478 ) ) ( not ( = ?auto_538476 ?auto_538479 ) ) ( not ( = ?auto_538476 ?auto_538480 ) ) ( not ( = ?auto_538476 ?auto_538481 ) ) ( not ( = ?auto_538476 ?auto_538482 ) ) ( not ( = ?auto_538476 ?auto_538483 ) ) ( not ( = ?auto_538476 ?auto_538484 ) ) ( not ( = ?auto_538476 ?auto_538485 ) ) ( not ( = ?auto_538476 ?auto_538486 ) ) ( not ( = ?auto_538476 ?auto_538487 ) ) ( not ( = ?auto_538476 ?auto_538488 ) ) ( not ( = ?auto_538476 ?auto_538489 ) ) ( not ( = ?auto_538476 ?auto_538490 ) ) ( not ( = ?auto_538476 ?auto_538491 ) ) ( not ( = ?auto_538477 ?auto_538478 ) ) ( not ( = ?auto_538477 ?auto_538479 ) ) ( not ( = ?auto_538477 ?auto_538480 ) ) ( not ( = ?auto_538477 ?auto_538481 ) ) ( not ( = ?auto_538477 ?auto_538482 ) ) ( not ( = ?auto_538477 ?auto_538483 ) ) ( not ( = ?auto_538477 ?auto_538484 ) ) ( not ( = ?auto_538477 ?auto_538485 ) ) ( not ( = ?auto_538477 ?auto_538486 ) ) ( not ( = ?auto_538477 ?auto_538487 ) ) ( not ( = ?auto_538477 ?auto_538488 ) ) ( not ( = ?auto_538477 ?auto_538489 ) ) ( not ( = ?auto_538477 ?auto_538490 ) ) ( not ( = ?auto_538477 ?auto_538491 ) ) ( not ( = ?auto_538478 ?auto_538479 ) ) ( not ( = ?auto_538478 ?auto_538480 ) ) ( not ( = ?auto_538478 ?auto_538481 ) ) ( not ( = ?auto_538478 ?auto_538482 ) ) ( not ( = ?auto_538478 ?auto_538483 ) ) ( not ( = ?auto_538478 ?auto_538484 ) ) ( not ( = ?auto_538478 ?auto_538485 ) ) ( not ( = ?auto_538478 ?auto_538486 ) ) ( not ( = ?auto_538478 ?auto_538487 ) ) ( not ( = ?auto_538478 ?auto_538488 ) ) ( not ( = ?auto_538478 ?auto_538489 ) ) ( not ( = ?auto_538478 ?auto_538490 ) ) ( not ( = ?auto_538478 ?auto_538491 ) ) ( not ( = ?auto_538479 ?auto_538480 ) ) ( not ( = ?auto_538479 ?auto_538481 ) ) ( not ( = ?auto_538479 ?auto_538482 ) ) ( not ( = ?auto_538479 ?auto_538483 ) ) ( not ( = ?auto_538479 ?auto_538484 ) ) ( not ( = ?auto_538479 ?auto_538485 ) ) ( not ( = ?auto_538479 ?auto_538486 ) ) ( not ( = ?auto_538479 ?auto_538487 ) ) ( not ( = ?auto_538479 ?auto_538488 ) ) ( not ( = ?auto_538479 ?auto_538489 ) ) ( not ( = ?auto_538479 ?auto_538490 ) ) ( not ( = ?auto_538479 ?auto_538491 ) ) ( not ( = ?auto_538480 ?auto_538481 ) ) ( not ( = ?auto_538480 ?auto_538482 ) ) ( not ( = ?auto_538480 ?auto_538483 ) ) ( not ( = ?auto_538480 ?auto_538484 ) ) ( not ( = ?auto_538480 ?auto_538485 ) ) ( not ( = ?auto_538480 ?auto_538486 ) ) ( not ( = ?auto_538480 ?auto_538487 ) ) ( not ( = ?auto_538480 ?auto_538488 ) ) ( not ( = ?auto_538480 ?auto_538489 ) ) ( not ( = ?auto_538480 ?auto_538490 ) ) ( not ( = ?auto_538480 ?auto_538491 ) ) ( not ( = ?auto_538481 ?auto_538482 ) ) ( not ( = ?auto_538481 ?auto_538483 ) ) ( not ( = ?auto_538481 ?auto_538484 ) ) ( not ( = ?auto_538481 ?auto_538485 ) ) ( not ( = ?auto_538481 ?auto_538486 ) ) ( not ( = ?auto_538481 ?auto_538487 ) ) ( not ( = ?auto_538481 ?auto_538488 ) ) ( not ( = ?auto_538481 ?auto_538489 ) ) ( not ( = ?auto_538481 ?auto_538490 ) ) ( not ( = ?auto_538481 ?auto_538491 ) ) ( not ( = ?auto_538482 ?auto_538483 ) ) ( not ( = ?auto_538482 ?auto_538484 ) ) ( not ( = ?auto_538482 ?auto_538485 ) ) ( not ( = ?auto_538482 ?auto_538486 ) ) ( not ( = ?auto_538482 ?auto_538487 ) ) ( not ( = ?auto_538482 ?auto_538488 ) ) ( not ( = ?auto_538482 ?auto_538489 ) ) ( not ( = ?auto_538482 ?auto_538490 ) ) ( not ( = ?auto_538482 ?auto_538491 ) ) ( not ( = ?auto_538483 ?auto_538484 ) ) ( not ( = ?auto_538483 ?auto_538485 ) ) ( not ( = ?auto_538483 ?auto_538486 ) ) ( not ( = ?auto_538483 ?auto_538487 ) ) ( not ( = ?auto_538483 ?auto_538488 ) ) ( not ( = ?auto_538483 ?auto_538489 ) ) ( not ( = ?auto_538483 ?auto_538490 ) ) ( not ( = ?auto_538483 ?auto_538491 ) ) ( not ( = ?auto_538484 ?auto_538485 ) ) ( not ( = ?auto_538484 ?auto_538486 ) ) ( not ( = ?auto_538484 ?auto_538487 ) ) ( not ( = ?auto_538484 ?auto_538488 ) ) ( not ( = ?auto_538484 ?auto_538489 ) ) ( not ( = ?auto_538484 ?auto_538490 ) ) ( not ( = ?auto_538484 ?auto_538491 ) ) ( not ( = ?auto_538485 ?auto_538486 ) ) ( not ( = ?auto_538485 ?auto_538487 ) ) ( not ( = ?auto_538485 ?auto_538488 ) ) ( not ( = ?auto_538485 ?auto_538489 ) ) ( not ( = ?auto_538485 ?auto_538490 ) ) ( not ( = ?auto_538485 ?auto_538491 ) ) ( not ( = ?auto_538486 ?auto_538487 ) ) ( not ( = ?auto_538486 ?auto_538488 ) ) ( not ( = ?auto_538486 ?auto_538489 ) ) ( not ( = ?auto_538486 ?auto_538490 ) ) ( not ( = ?auto_538486 ?auto_538491 ) ) ( not ( = ?auto_538487 ?auto_538488 ) ) ( not ( = ?auto_538487 ?auto_538489 ) ) ( not ( = ?auto_538487 ?auto_538490 ) ) ( not ( = ?auto_538487 ?auto_538491 ) ) ( not ( = ?auto_538488 ?auto_538489 ) ) ( not ( = ?auto_538488 ?auto_538490 ) ) ( not ( = ?auto_538488 ?auto_538491 ) ) ( not ( = ?auto_538489 ?auto_538490 ) ) ( not ( = ?auto_538489 ?auto_538491 ) ) ( not ( = ?auto_538490 ?auto_538491 ) ) ( ON ?auto_538489 ?auto_538490 ) ( ON ?auto_538488 ?auto_538489 ) ( ON ?auto_538487 ?auto_538488 ) ( CLEAR ?auto_538485 ) ( ON ?auto_538486 ?auto_538487 ) ( CLEAR ?auto_538486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_538476 ?auto_538477 ?auto_538478 ?auto_538479 ?auto_538480 ?auto_538481 ?auto_538482 ?auto_538483 ?auto_538484 ?auto_538485 ?auto_538486 )
      ( MAKE-15PILE ?auto_538476 ?auto_538477 ?auto_538478 ?auto_538479 ?auto_538480 ?auto_538481 ?auto_538482 ?auto_538483 ?auto_538484 ?auto_538485 ?auto_538486 ?auto_538487 ?auto_538488 ?auto_538489 ?auto_538490 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538538 - BLOCK
      ?auto_538539 - BLOCK
      ?auto_538540 - BLOCK
      ?auto_538541 - BLOCK
      ?auto_538542 - BLOCK
      ?auto_538543 - BLOCK
      ?auto_538544 - BLOCK
      ?auto_538545 - BLOCK
      ?auto_538546 - BLOCK
      ?auto_538547 - BLOCK
      ?auto_538548 - BLOCK
      ?auto_538549 - BLOCK
      ?auto_538550 - BLOCK
      ?auto_538551 - BLOCK
      ?auto_538552 - BLOCK
    )
    :vars
    (
      ?auto_538553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538552 ?auto_538553 ) ( ON-TABLE ?auto_538538 ) ( ON ?auto_538539 ?auto_538538 ) ( ON ?auto_538540 ?auto_538539 ) ( ON ?auto_538541 ?auto_538540 ) ( ON ?auto_538542 ?auto_538541 ) ( ON ?auto_538543 ?auto_538542 ) ( ON ?auto_538544 ?auto_538543 ) ( ON ?auto_538545 ?auto_538544 ) ( ON ?auto_538546 ?auto_538545 ) ( not ( = ?auto_538538 ?auto_538539 ) ) ( not ( = ?auto_538538 ?auto_538540 ) ) ( not ( = ?auto_538538 ?auto_538541 ) ) ( not ( = ?auto_538538 ?auto_538542 ) ) ( not ( = ?auto_538538 ?auto_538543 ) ) ( not ( = ?auto_538538 ?auto_538544 ) ) ( not ( = ?auto_538538 ?auto_538545 ) ) ( not ( = ?auto_538538 ?auto_538546 ) ) ( not ( = ?auto_538538 ?auto_538547 ) ) ( not ( = ?auto_538538 ?auto_538548 ) ) ( not ( = ?auto_538538 ?auto_538549 ) ) ( not ( = ?auto_538538 ?auto_538550 ) ) ( not ( = ?auto_538538 ?auto_538551 ) ) ( not ( = ?auto_538538 ?auto_538552 ) ) ( not ( = ?auto_538538 ?auto_538553 ) ) ( not ( = ?auto_538539 ?auto_538540 ) ) ( not ( = ?auto_538539 ?auto_538541 ) ) ( not ( = ?auto_538539 ?auto_538542 ) ) ( not ( = ?auto_538539 ?auto_538543 ) ) ( not ( = ?auto_538539 ?auto_538544 ) ) ( not ( = ?auto_538539 ?auto_538545 ) ) ( not ( = ?auto_538539 ?auto_538546 ) ) ( not ( = ?auto_538539 ?auto_538547 ) ) ( not ( = ?auto_538539 ?auto_538548 ) ) ( not ( = ?auto_538539 ?auto_538549 ) ) ( not ( = ?auto_538539 ?auto_538550 ) ) ( not ( = ?auto_538539 ?auto_538551 ) ) ( not ( = ?auto_538539 ?auto_538552 ) ) ( not ( = ?auto_538539 ?auto_538553 ) ) ( not ( = ?auto_538540 ?auto_538541 ) ) ( not ( = ?auto_538540 ?auto_538542 ) ) ( not ( = ?auto_538540 ?auto_538543 ) ) ( not ( = ?auto_538540 ?auto_538544 ) ) ( not ( = ?auto_538540 ?auto_538545 ) ) ( not ( = ?auto_538540 ?auto_538546 ) ) ( not ( = ?auto_538540 ?auto_538547 ) ) ( not ( = ?auto_538540 ?auto_538548 ) ) ( not ( = ?auto_538540 ?auto_538549 ) ) ( not ( = ?auto_538540 ?auto_538550 ) ) ( not ( = ?auto_538540 ?auto_538551 ) ) ( not ( = ?auto_538540 ?auto_538552 ) ) ( not ( = ?auto_538540 ?auto_538553 ) ) ( not ( = ?auto_538541 ?auto_538542 ) ) ( not ( = ?auto_538541 ?auto_538543 ) ) ( not ( = ?auto_538541 ?auto_538544 ) ) ( not ( = ?auto_538541 ?auto_538545 ) ) ( not ( = ?auto_538541 ?auto_538546 ) ) ( not ( = ?auto_538541 ?auto_538547 ) ) ( not ( = ?auto_538541 ?auto_538548 ) ) ( not ( = ?auto_538541 ?auto_538549 ) ) ( not ( = ?auto_538541 ?auto_538550 ) ) ( not ( = ?auto_538541 ?auto_538551 ) ) ( not ( = ?auto_538541 ?auto_538552 ) ) ( not ( = ?auto_538541 ?auto_538553 ) ) ( not ( = ?auto_538542 ?auto_538543 ) ) ( not ( = ?auto_538542 ?auto_538544 ) ) ( not ( = ?auto_538542 ?auto_538545 ) ) ( not ( = ?auto_538542 ?auto_538546 ) ) ( not ( = ?auto_538542 ?auto_538547 ) ) ( not ( = ?auto_538542 ?auto_538548 ) ) ( not ( = ?auto_538542 ?auto_538549 ) ) ( not ( = ?auto_538542 ?auto_538550 ) ) ( not ( = ?auto_538542 ?auto_538551 ) ) ( not ( = ?auto_538542 ?auto_538552 ) ) ( not ( = ?auto_538542 ?auto_538553 ) ) ( not ( = ?auto_538543 ?auto_538544 ) ) ( not ( = ?auto_538543 ?auto_538545 ) ) ( not ( = ?auto_538543 ?auto_538546 ) ) ( not ( = ?auto_538543 ?auto_538547 ) ) ( not ( = ?auto_538543 ?auto_538548 ) ) ( not ( = ?auto_538543 ?auto_538549 ) ) ( not ( = ?auto_538543 ?auto_538550 ) ) ( not ( = ?auto_538543 ?auto_538551 ) ) ( not ( = ?auto_538543 ?auto_538552 ) ) ( not ( = ?auto_538543 ?auto_538553 ) ) ( not ( = ?auto_538544 ?auto_538545 ) ) ( not ( = ?auto_538544 ?auto_538546 ) ) ( not ( = ?auto_538544 ?auto_538547 ) ) ( not ( = ?auto_538544 ?auto_538548 ) ) ( not ( = ?auto_538544 ?auto_538549 ) ) ( not ( = ?auto_538544 ?auto_538550 ) ) ( not ( = ?auto_538544 ?auto_538551 ) ) ( not ( = ?auto_538544 ?auto_538552 ) ) ( not ( = ?auto_538544 ?auto_538553 ) ) ( not ( = ?auto_538545 ?auto_538546 ) ) ( not ( = ?auto_538545 ?auto_538547 ) ) ( not ( = ?auto_538545 ?auto_538548 ) ) ( not ( = ?auto_538545 ?auto_538549 ) ) ( not ( = ?auto_538545 ?auto_538550 ) ) ( not ( = ?auto_538545 ?auto_538551 ) ) ( not ( = ?auto_538545 ?auto_538552 ) ) ( not ( = ?auto_538545 ?auto_538553 ) ) ( not ( = ?auto_538546 ?auto_538547 ) ) ( not ( = ?auto_538546 ?auto_538548 ) ) ( not ( = ?auto_538546 ?auto_538549 ) ) ( not ( = ?auto_538546 ?auto_538550 ) ) ( not ( = ?auto_538546 ?auto_538551 ) ) ( not ( = ?auto_538546 ?auto_538552 ) ) ( not ( = ?auto_538546 ?auto_538553 ) ) ( not ( = ?auto_538547 ?auto_538548 ) ) ( not ( = ?auto_538547 ?auto_538549 ) ) ( not ( = ?auto_538547 ?auto_538550 ) ) ( not ( = ?auto_538547 ?auto_538551 ) ) ( not ( = ?auto_538547 ?auto_538552 ) ) ( not ( = ?auto_538547 ?auto_538553 ) ) ( not ( = ?auto_538548 ?auto_538549 ) ) ( not ( = ?auto_538548 ?auto_538550 ) ) ( not ( = ?auto_538548 ?auto_538551 ) ) ( not ( = ?auto_538548 ?auto_538552 ) ) ( not ( = ?auto_538548 ?auto_538553 ) ) ( not ( = ?auto_538549 ?auto_538550 ) ) ( not ( = ?auto_538549 ?auto_538551 ) ) ( not ( = ?auto_538549 ?auto_538552 ) ) ( not ( = ?auto_538549 ?auto_538553 ) ) ( not ( = ?auto_538550 ?auto_538551 ) ) ( not ( = ?auto_538550 ?auto_538552 ) ) ( not ( = ?auto_538550 ?auto_538553 ) ) ( not ( = ?auto_538551 ?auto_538552 ) ) ( not ( = ?auto_538551 ?auto_538553 ) ) ( not ( = ?auto_538552 ?auto_538553 ) ) ( ON ?auto_538551 ?auto_538552 ) ( ON ?auto_538550 ?auto_538551 ) ( ON ?auto_538549 ?auto_538550 ) ( ON ?auto_538548 ?auto_538549 ) ( CLEAR ?auto_538546 ) ( ON ?auto_538547 ?auto_538548 ) ( CLEAR ?auto_538547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_538538 ?auto_538539 ?auto_538540 ?auto_538541 ?auto_538542 ?auto_538543 ?auto_538544 ?auto_538545 ?auto_538546 ?auto_538547 )
      ( MAKE-15PILE ?auto_538538 ?auto_538539 ?auto_538540 ?auto_538541 ?auto_538542 ?auto_538543 ?auto_538544 ?auto_538545 ?auto_538546 ?auto_538547 ?auto_538548 ?auto_538549 ?auto_538550 ?auto_538551 ?auto_538552 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538600 - BLOCK
      ?auto_538601 - BLOCK
      ?auto_538602 - BLOCK
      ?auto_538603 - BLOCK
      ?auto_538604 - BLOCK
      ?auto_538605 - BLOCK
      ?auto_538606 - BLOCK
      ?auto_538607 - BLOCK
      ?auto_538608 - BLOCK
      ?auto_538609 - BLOCK
      ?auto_538610 - BLOCK
      ?auto_538611 - BLOCK
      ?auto_538612 - BLOCK
      ?auto_538613 - BLOCK
      ?auto_538614 - BLOCK
    )
    :vars
    (
      ?auto_538615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538614 ?auto_538615 ) ( ON-TABLE ?auto_538600 ) ( ON ?auto_538601 ?auto_538600 ) ( ON ?auto_538602 ?auto_538601 ) ( ON ?auto_538603 ?auto_538602 ) ( ON ?auto_538604 ?auto_538603 ) ( ON ?auto_538605 ?auto_538604 ) ( ON ?auto_538606 ?auto_538605 ) ( ON ?auto_538607 ?auto_538606 ) ( not ( = ?auto_538600 ?auto_538601 ) ) ( not ( = ?auto_538600 ?auto_538602 ) ) ( not ( = ?auto_538600 ?auto_538603 ) ) ( not ( = ?auto_538600 ?auto_538604 ) ) ( not ( = ?auto_538600 ?auto_538605 ) ) ( not ( = ?auto_538600 ?auto_538606 ) ) ( not ( = ?auto_538600 ?auto_538607 ) ) ( not ( = ?auto_538600 ?auto_538608 ) ) ( not ( = ?auto_538600 ?auto_538609 ) ) ( not ( = ?auto_538600 ?auto_538610 ) ) ( not ( = ?auto_538600 ?auto_538611 ) ) ( not ( = ?auto_538600 ?auto_538612 ) ) ( not ( = ?auto_538600 ?auto_538613 ) ) ( not ( = ?auto_538600 ?auto_538614 ) ) ( not ( = ?auto_538600 ?auto_538615 ) ) ( not ( = ?auto_538601 ?auto_538602 ) ) ( not ( = ?auto_538601 ?auto_538603 ) ) ( not ( = ?auto_538601 ?auto_538604 ) ) ( not ( = ?auto_538601 ?auto_538605 ) ) ( not ( = ?auto_538601 ?auto_538606 ) ) ( not ( = ?auto_538601 ?auto_538607 ) ) ( not ( = ?auto_538601 ?auto_538608 ) ) ( not ( = ?auto_538601 ?auto_538609 ) ) ( not ( = ?auto_538601 ?auto_538610 ) ) ( not ( = ?auto_538601 ?auto_538611 ) ) ( not ( = ?auto_538601 ?auto_538612 ) ) ( not ( = ?auto_538601 ?auto_538613 ) ) ( not ( = ?auto_538601 ?auto_538614 ) ) ( not ( = ?auto_538601 ?auto_538615 ) ) ( not ( = ?auto_538602 ?auto_538603 ) ) ( not ( = ?auto_538602 ?auto_538604 ) ) ( not ( = ?auto_538602 ?auto_538605 ) ) ( not ( = ?auto_538602 ?auto_538606 ) ) ( not ( = ?auto_538602 ?auto_538607 ) ) ( not ( = ?auto_538602 ?auto_538608 ) ) ( not ( = ?auto_538602 ?auto_538609 ) ) ( not ( = ?auto_538602 ?auto_538610 ) ) ( not ( = ?auto_538602 ?auto_538611 ) ) ( not ( = ?auto_538602 ?auto_538612 ) ) ( not ( = ?auto_538602 ?auto_538613 ) ) ( not ( = ?auto_538602 ?auto_538614 ) ) ( not ( = ?auto_538602 ?auto_538615 ) ) ( not ( = ?auto_538603 ?auto_538604 ) ) ( not ( = ?auto_538603 ?auto_538605 ) ) ( not ( = ?auto_538603 ?auto_538606 ) ) ( not ( = ?auto_538603 ?auto_538607 ) ) ( not ( = ?auto_538603 ?auto_538608 ) ) ( not ( = ?auto_538603 ?auto_538609 ) ) ( not ( = ?auto_538603 ?auto_538610 ) ) ( not ( = ?auto_538603 ?auto_538611 ) ) ( not ( = ?auto_538603 ?auto_538612 ) ) ( not ( = ?auto_538603 ?auto_538613 ) ) ( not ( = ?auto_538603 ?auto_538614 ) ) ( not ( = ?auto_538603 ?auto_538615 ) ) ( not ( = ?auto_538604 ?auto_538605 ) ) ( not ( = ?auto_538604 ?auto_538606 ) ) ( not ( = ?auto_538604 ?auto_538607 ) ) ( not ( = ?auto_538604 ?auto_538608 ) ) ( not ( = ?auto_538604 ?auto_538609 ) ) ( not ( = ?auto_538604 ?auto_538610 ) ) ( not ( = ?auto_538604 ?auto_538611 ) ) ( not ( = ?auto_538604 ?auto_538612 ) ) ( not ( = ?auto_538604 ?auto_538613 ) ) ( not ( = ?auto_538604 ?auto_538614 ) ) ( not ( = ?auto_538604 ?auto_538615 ) ) ( not ( = ?auto_538605 ?auto_538606 ) ) ( not ( = ?auto_538605 ?auto_538607 ) ) ( not ( = ?auto_538605 ?auto_538608 ) ) ( not ( = ?auto_538605 ?auto_538609 ) ) ( not ( = ?auto_538605 ?auto_538610 ) ) ( not ( = ?auto_538605 ?auto_538611 ) ) ( not ( = ?auto_538605 ?auto_538612 ) ) ( not ( = ?auto_538605 ?auto_538613 ) ) ( not ( = ?auto_538605 ?auto_538614 ) ) ( not ( = ?auto_538605 ?auto_538615 ) ) ( not ( = ?auto_538606 ?auto_538607 ) ) ( not ( = ?auto_538606 ?auto_538608 ) ) ( not ( = ?auto_538606 ?auto_538609 ) ) ( not ( = ?auto_538606 ?auto_538610 ) ) ( not ( = ?auto_538606 ?auto_538611 ) ) ( not ( = ?auto_538606 ?auto_538612 ) ) ( not ( = ?auto_538606 ?auto_538613 ) ) ( not ( = ?auto_538606 ?auto_538614 ) ) ( not ( = ?auto_538606 ?auto_538615 ) ) ( not ( = ?auto_538607 ?auto_538608 ) ) ( not ( = ?auto_538607 ?auto_538609 ) ) ( not ( = ?auto_538607 ?auto_538610 ) ) ( not ( = ?auto_538607 ?auto_538611 ) ) ( not ( = ?auto_538607 ?auto_538612 ) ) ( not ( = ?auto_538607 ?auto_538613 ) ) ( not ( = ?auto_538607 ?auto_538614 ) ) ( not ( = ?auto_538607 ?auto_538615 ) ) ( not ( = ?auto_538608 ?auto_538609 ) ) ( not ( = ?auto_538608 ?auto_538610 ) ) ( not ( = ?auto_538608 ?auto_538611 ) ) ( not ( = ?auto_538608 ?auto_538612 ) ) ( not ( = ?auto_538608 ?auto_538613 ) ) ( not ( = ?auto_538608 ?auto_538614 ) ) ( not ( = ?auto_538608 ?auto_538615 ) ) ( not ( = ?auto_538609 ?auto_538610 ) ) ( not ( = ?auto_538609 ?auto_538611 ) ) ( not ( = ?auto_538609 ?auto_538612 ) ) ( not ( = ?auto_538609 ?auto_538613 ) ) ( not ( = ?auto_538609 ?auto_538614 ) ) ( not ( = ?auto_538609 ?auto_538615 ) ) ( not ( = ?auto_538610 ?auto_538611 ) ) ( not ( = ?auto_538610 ?auto_538612 ) ) ( not ( = ?auto_538610 ?auto_538613 ) ) ( not ( = ?auto_538610 ?auto_538614 ) ) ( not ( = ?auto_538610 ?auto_538615 ) ) ( not ( = ?auto_538611 ?auto_538612 ) ) ( not ( = ?auto_538611 ?auto_538613 ) ) ( not ( = ?auto_538611 ?auto_538614 ) ) ( not ( = ?auto_538611 ?auto_538615 ) ) ( not ( = ?auto_538612 ?auto_538613 ) ) ( not ( = ?auto_538612 ?auto_538614 ) ) ( not ( = ?auto_538612 ?auto_538615 ) ) ( not ( = ?auto_538613 ?auto_538614 ) ) ( not ( = ?auto_538613 ?auto_538615 ) ) ( not ( = ?auto_538614 ?auto_538615 ) ) ( ON ?auto_538613 ?auto_538614 ) ( ON ?auto_538612 ?auto_538613 ) ( ON ?auto_538611 ?auto_538612 ) ( ON ?auto_538610 ?auto_538611 ) ( ON ?auto_538609 ?auto_538610 ) ( CLEAR ?auto_538607 ) ( ON ?auto_538608 ?auto_538609 ) ( CLEAR ?auto_538608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_538600 ?auto_538601 ?auto_538602 ?auto_538603 ?auto_538604 ?auto_538605 ?auto_538606 ?auto_538607 ?auto_538608 )
      ( MAKE-15PILE ?auto_538600 ?auto_538601 ?auto_538602 ?auto_538603 ?auto_538604 ?auto_538605 ?auto_538606 ?auto_538607 ?auto_538608 ?auto_538609 ?auto_538610 ?auto_538611 ?auto_538612 ?auto_538613 ?auto_538614 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538662 - BLOCK
      ?auto_538663 - BLOCK
      ?auto_538664 - BLOCK
      ?auto_538665 - BLOCK
      ?auto_538666 - BLOCK
      ?auto_538667 - BLOCK
      ?auto_538668 - BLOCK
      ?auto_538669 - BLOCK
      ?auto_538670 - BLOCK
      ?auto_538671 - BLOCK
      ?auto_538672 - BLOCK
      ?auto_538673 - BLOCK
      ?auto_538674 - BLOCK
      ?auto_538675 - BLOCK
      ?auto_538676 - BLOCK
    )
    :vars
    (
      ?auto_538677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538676 ?auto_538677 ) ( ON-TABLE ?auto_538662 ) ( ON ?auto_538663 ?auto_538662 ) ( ON ?auto_538664 ?auto_538663 ) ( ON ?auto_538665 ?auto_538664 ) ( ON ?auto_538666 ?auto_538665 ) ( ON ?auto_538667 ?auto_538666 ) ( ON ?auto_538668 ?auto_538667 ) ( not ( = ?auto_538662 ?auto_538663 ) ) ( not ( = ?auto_538662 ?auto_538664 ) ) ( not ( = ?auto_538662 ?auto_538665 ) ) ( not ( = ?auto_538662 ?auto_538666 ) ) ( not ( = ?auto_538662 ?auto_538667 ) ) ( not ( = ?auto_538662 ?auto_538668 ) ) ( not ( = ?auto_538662 ?auto_538669 ) ) ( not ( = ?auto_538662 ?auto_538670 ) ) ( not ( = ?auto_538662 ?auto_538671 ) ) ( not ( = ?auto_538662 ?auto_538672 ) ) ( not ( = ?auto_538662 ?auto_538673 ) ) ( not ( = ?auto_538662 ?auto_538674 ) ) ( not ( = ?auto_538662 ?auto_538675 ) ) ( not ( = ?auto_538662 ?auto_538676 ) ) ( not ( = ?auto_538662 ?auto_538677 ) ) ( not ( = ?auto_538663 ?auto_538664 ) ) ( not ( = ?auto_538663 ?auto_538665 ) ) ( not ( = ?auto_538663 ?auto_538666 ) ) ( not ( = ?auto_538663 ?auto_538667 ) ) ( not ( = ?auto_538663 ?auto_538668 ) ) ( not ( = ?auto_538663 ?auto_538669 ) ) ( not ( = ?auto_538663 ?auto_538670 ) ) ( not ( = ?auto_538663 ?auto_538671 ) ) ( not ( = ?auto_538663 ?auto_538672 ) ) ( not ( = ?auto_538663 ?auto_538673 ) ) ( not ( = ?auto_538663 ?auto_538674 ) ) ( not ( = ?auto_538663 ?auto_538675 ) ) ( not ( = ?auto_538663 ?auto_538676 ) ) ( not ( = ?auto_538663 ?auto_538677 ) ) ( not ( = ?auto_538664 ?auto_538665 ) ) ( not ( = ?auto_538664 ?auto_538666 ) ) ( not ( = ?auto_538664 ?auto_538667 ) ) ( not ( = ?auto_538664 ?auto_538668 ) ) ( not ( = ?auto_538664 ?auto_538669 ) ) ( not ( = ?auto_538664 ?auto_538670 ) ) ( not ( = ?auto_538664 ?auto_538671 ) ) ( not ( = ?auto_538664 ?auto_538672 ) ) ( not ( = ?auto_538664 ?auto_538673 ) ) ( not ( = ?auto_538664 ?auto_538674 ) ) ( not ( = ?auto_538664 ?auto_538675 ) ) ( not ( = ?auto_538664 ?auto_538676 ) ) ( not ( = ?auto_538664 ?auto_538677 ) ) ( not ( = ?auto_538665 ?auto_538666 ) ) ( not ( = ?auto_538665 ?auto_538667 ) ) ( not ( = ?auto_538665 ?auto_538668 ) ) ( not ( = ?auto_538665 ?auto_538669 ) ) ( not ( = ?auto_538665 ?auto_538670 ) ) ( not ( = ?auto_538665 ?auto_538671 ) ) ( not ( = ?auto_538665 ?auto_538672 ) ) ( not ( = ?auto_538665 ?auto_538673 ) ) ( not ( = ?auto_538665 ?auto_538674 ) ) ( not ( = ?auto_538665 ?auto_538675 ) ) ( not ( = ?auto_538665 ?auto_538676 ) ) ( not ( = ?auto_538665 ?auto_538677 ) ) ( not ( = ?auto_538666 ?auto_538667 ) ) ( not ( = ?auto_538666 ?auto_538668 ) ) ( not ( = ?auto_538666 ?auto_538669 ) ) ( not ( = ?auto_538666 ?auto_538670 ) ) ( not ( = ?auto_538666 ?auto_538671 ) ) ( not ( = ?auto_538666 ?auto_538672 ) ) ( not ( = ?auto_538666 ?auto_538673 ) ) ( not ( = ?auto_538666 ?auto_538674 ) ) ( not ( = ?auto_538666 ?auto_538675 ) ) ( not ( = ?auto_538666 ?auto_538676 ) ) ( not ( = ?auto_538666 ?auto_538677 ) ) ( not ( = ?auto_538667 ?auto_538668 ) ) ( not ( = ?auto_538667 ?auto_538669 ) ) ( not ( = ?auto_538667 ?auto_538670 ) ) ( not ( = ?auto_538667 ?auto_538671 ) ) ( not ( = ?auto_538667 ?auto_538672 ) ) ( not ( = ?auto_538667 ?auto_538673 ) ) ( not ( = ?auto_538667 ?auto_538674 ) ) ( not ( = ?auto_538667 ?auto_538675 ) ) ( not ( = ?auto_538667 ?auto_538676 ) ) ( not ( = ?auto_538667 ?auto_538677 ) ) ( not ( = ?auto_538668 ?auto_538669 ) ) ( not ( = ?auto_538668 ?auto_538670 ) ) ( not ( = ?auto_538668 ?auto_538671 ) ) ( not ( = ?auto_538668 ?auto_538672 ) ) ( not ( = ?auto_538668 ?auto_538673 ) ) ( not ( = ?auto_538668 ?auto_538674 ) ) ( not ( = ?auto_538668 ?auto_538675 ) ) ( not ( = ?auto_538668 ?auto_538676 ) ) ( not ( = ?auto_538668 ?auto_538677 ) ) ( not ( = ?auto_538669 ?auto_538670 ) ) ( not ( = ?auto_538669 ?auto_538671 ) ) ( not ( = ?auto_538669 ?auto_538672 ) ) ( not ( = ?auto_538669 ?auto_538673 ) ) ( not ( = ?auto_538669 ?auto_538674 ) ) ( not ( = ?auto_538669 ?auto_538675 ) ) ( not ( = ?auto_538669 ?auto_538676 ) ) ( not ( = ?auto_538669 ?auto_538677 ) ) ( not ( = ?auto_538670 ?auto_538671 ) ) ( not ( = ?auto_538670 ?auto_538672 ) ) ( not ( = ?auto_538670 ?auto_538673 ) ) ( not ( = ?auto_538670 ?auto_538674 ) ) ( not ( = ?auto_538670 ?auto_538675 ) ) ( not ( = ?auto_538670 ?auto_538676 ) ) ( not ( = ?auto_538670 ?auto_538677 ) ) ( not ( = ?auto_538671 ?auto_538672 ) ) ( not ( = ?auto_538671 ?auto_538673 ) ) ( not ( = ?auto_538671 ?auto_538674 ) ) ( not ( = ?auto_538671 ?auto_538675 ) ) ( not ( = ?auto_538671 ?auto_538676 ) ) ( not ( = ?auto_538671 ?auto_538677 ) ) ( not ( = ?auto_538672 ?auto_538673 ) ) ( not ( = ?auto_538672 ?auto_538674 ) ) ( not ( = ?auto_538672 ?auto_538675 ) ) ( not ( = ?auto_538672 ?auto_538676 ) ) ( not ( = ?auto_538672 ?auto_538677 ) ) ( not ( = ?auto_538673 ?auto_538674 ) ) ( not ( = ?auto_538673 ?auto_538675 ) ) ( not ( = ?auto_538673 ?auto_538676 ) ) ( not ( = ?auto_538673 ?auto_538677 ) ) ( not ( = ?auto_538674 ?auto_538675 ) ) ( not ( = ?auto_538674 ?auto_538676 ) ) ( not ( = ?auto_538674 ?auto_538677 ) ) ( not ( = ?auto_538675 ?auto_538676 ) ) ( not ( = ?auto_538675 ?auto_538677 ) ) ( not ( = ?auto_538676 ?auto_538677 ) ) ( ON ?auto_538675 ?auto_538676 ) ( ON ?auto_538674 ?auto_538675 ) ( ON ?auto_538673 ?auto_538674 ) ( ON ?auto_538672 ?auto_538673 ) ( ON ?auto_538671 ?auto_538672 ) ( ON ?auto_538670 ?auto_538671 ) ( CLEAR ?auto_538668 ) ( ON ?auto_538669 ?auto_538670 ) ( CLEAR ?auto_538669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_538662 ?auto_538663 ?auto_538664 ?auto_538665 ?auto_538666 ?auto_538667 ?auto_538668 ?auto_538669 )
      ( MAKE-15PILE ?auto_538662 ?auto_538663 ?auto_538664 ?auto_538665 ?auto_538666 ?auto_538667 ?auto_538668 ?auto_538669 ?auto_538670 ?auto_538671 ?auto_538672 ?auto_538673 ?auto_538674 ?auto_538675 ?auto_538676 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538724 - BLOCK
      ?auto_538725 - BLOCK
      ?auto_538726 - BLOCK
      ?auto_538727 - BLOCK
      ?auto_538728 - BLOCK
      ?auto_538729 - BLOCK
      ?auto_538730 - BLOCK
      ?auto_538731 - BLOCK
      ?auto_538732 - BLOCK
      ?auto_538733 - BLOCK
      ?auto_538734 - BLOCK
      ?auto_538735 - BLOCK
      ?auto_538736 - BLOCK
      ?auto_538737 - BLOCK
      ?auto_538738 - BLOCK
    )
    :vars
    (
      ?auto_538739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538738 ?auto_538739 ) ( ON-TABLE ?auto_538724 ) ( ON ?auto_538725 ?auto_538724 ) ( ON ?auto_538726 ?auto_538725 ) ( ON ?auto_538727 ?auto_538726 ) ( ON ?auto_538728 ?auto_538727 ) ( ON ?auto_538729 ?auto_538728 ) ( not ( = ?auto_538724 ?auto_538725 ) ) ( not ( = ?auto_538724 ?auto_538726 ) ) ( not ( = ?auto_538724 ?auto_538727 ) ) ( not ( = ?auto_538724 ?auto_538728 ) ) ( not ( = ?auto_538724 ?auto_538729 ) ) ( not ( = ?auto_538724 ?auto_538730 ) ) ( not ( = ?auto_538724 ?auto_538731 ) ) ( not ( = ?auto_538724 ?auto_538732 ) ) ( not ( = ?auto_538724 ?auto_538733 ) ) ( not ( = ?auto_538724 ?auto_538734 ) ) ( not ( = ?auto_538724 ?auto_538735 ) ) ( not ( = ?auto_538724 ?auto_538736 ) ) ( not ( = ?auto_538724 ?auto_538737 ) ) ( not ( = ?auto_538724 ?auto_538738 ) ) ( not ( = ?auto_538724 ?auto_538739 ) ) ( not ( = ?auto_538725 ?auto_538726 ) ) ( not ( = ?auto_538725 ?auto_538727 ) ) ( not ( = ?auto_538725 ?auto_538728 ) ) ( not ( = ?auto_538725 ?auto_538729 ) ) ( not ( = ?auto_538725 ?auto_538730 ) ) ( not ( = ?auto_538725 ?auto_538731 ) ) ( not ( = ?auto_538725 ?auto_538732 ) ) ( not ( = ?auto_538725 ?auto_538733 ) ) ( not ( = ?auto_538725 ?auto_538734 ) ) ( not ( = ?auto_538725 ?auto_538735 ) ) ( not ( = ?auto_538725 ?auto_538736 ) ) ( not ( = ?auto_538725 ?auto_538737 ) ) ( not ( = ?auto_538725 ?auto_538738 ) ) ( not ( = ?auto_538725 ?auto_538739 ) ) ( not ( = ?auto_538726 ?auto_538727 ) ) ( not ( = ?auto_538726 ?auto_538728 ) ) ( not ( = ?auto_538726 ?auto_538729 ) ) ( not ( = ?auto_538726 ?auto_538730 ) ) ( not ( = ?auto_538726 ?auto_538731 ) ) ( not ( = ?auto_538726 ?auto_538732 ) ) ( not ( = ?auto_538726 ?auto_538733 ) ) ( not ( = ?auto_538726 ?auto_538734 ) ) ( not ( = ?auto_538726 ?auto_538735 ) ) ( not ( = ?auto_538726 ?auto_538736 ) ) ( not ( = ?auto_538726 ?auto_538737 ) ) ( not ( = ?auto_538726 ?auto_538738 ) ) ( not ( = ?auto_538726 ?auto_538739 ) ) ( not ( = ?auto_538727 ?auto_538728 ) ) ( not ( = ?auto_538727 ?auto_538729 ) ) ( not ( = ?auto_538727 ?auto_538730 ) ) ( not ( = ?auto_538727 ?auto_538731 ) ) ( not ( = ?auto_538727 ?auto_538732 ) ) ( not ( = ?auto_538727 ?auto_538733 ) ) ( not ( = ?auto_538727 ?auto_538734 ) ) ( not ( = ?auto_538727 ?auto_538735 ) ) ( not ( = ?auto_538727 ?auto_538736 ) ) ( not ( = ?auto_538727 ?auto_538737 ) ) ( not ( = ?auto_538727 ?auto_538738 ) ) ( not ( = ?auto_538727 ?auto_538739 ) ) ( not ( = ?auto_538728 ?auto_538729 ) ) ( not ( = ?auto_538728 ?auto_538730 ) ) ( not ( = ?auto_538728 ?auto_538731 ) ) ( not ( = ?auto_538728 ?auto_538732 ) ) ( not ( = ?auto_538728 ?auto_538733 ) ) ( not ( = ?auto_538728 ?auto_538734 ) ) ( not ( = ?auto_538728 ?auto_538735 ) ) ( not ( = ?auto_538728 ?auto_538736 ) ) ( not ( = ?auto_538728 ?auto_538737 ) ) ( not ( = ?auto_538728 ?auto_538738 ) ) ( not ( = ?auto_538728 ?auto_538739 ) ) ( not ( = ?auto_538729 ?auto_538730 ) ) ( not ( = ?auto_538729 ?auto_538731 ) ) ( not ( = ?auto_538729 ?auto_538732 ) ) ( not ( = ?auto_538729 ?auto_538733 ) ) ( not ( = ?auto_538729 ?auto_538734 ) ) ( not ( = ?auto_538729 ?auto_538735 ) ) ( not ( = ?auto_538729 ?auto_538736 ) ) ( not ( = ?auto_538729 ?auto_538737 ) ) ( not ( = ?auto_538729 ?auto_538738 ) ) ( not ( = ?auto_538729 ?auto_538739 ) ) ( not ( = ?auto_538730 ?auto_538731 ) ) ( not ( = ?auto_538730 ?auto_538732 ) ) ( not ( = ?auto_538730 ?auto_538733 ) ) ( not ( = ?auto_538730 ?auto_538734 ) ) ( not ( = ?auto_538730 ?auto_538735 ) ) ( not ( = ?auto_538730 ?auto_538736 ) ) ( not ( = ?auto_538730 ?auto_538737 ) ) ( not ( = ?auto_538730 ?auto_538738 ) ) ( not ( = ?auto_538730 ?auto_538739 ) ) ( not ( = ?auto_538731 ?auto_538732 ) ) ( not ( = ?auto_538731 ?auto_538733 ) ) ( not ( = ?auto_538731 ?auto_538734 ) ) ( not ( = ?auto_538731 ?auto_538735 ) ) ( not ( = ?auto_538731 ?auto_538736 ) ) ( not ( = ?auto_538731 ?auto_538737 ) ) ( not ( = ?auto_538731 ?auto_538738 ) ) ( not ( = ?auto_538731 ?auto_538739 ) ) ( not ( = ?auto_538732 ?auto_538733 ) ) ( not ( = ?auto_538732 ?auto_538734 ) ) ( not ( = ?auto_538732 ?auto_538735 ) ) ( not ( = ?auto_538732 ?auto_538736 ) ) ( not ( = ?auto_538732 ?auto_538737 ) ) ( not ( = ?auto_538732 ?auto_538738 ) ) ( not ( = ?auto_538732 ?auto_538739 ) ) ( not ( = ?auto_538733 ?auto_538734 ) ) ( not ( = ?auto_538733 ?auto_538735 ) ) ( not ( = ?auto_538733 ?auto_538736 ) ) ( not ( = ?auto_538733 ?auto_538737 ) ) ( not ( = ?auto_538733 ?auto_538738 ) ) ( not ( = ?auto_538733 ?auto_538739 ) ) ( not ( = ?auto_538734 ?auto_538735 ) ) ( not ( = ?auto_538734 ?auto_538736 ) ) ( not ( = ?auto_538734 ?auto_538737 ) ) ( not ( = ?auto_538734 ?auto_538738 ) ) ( not ( = ?auto_538734 ?auto_538739 ) ) ( not ( = ?auto_538735 ?auto_538736 ) ) ( not ( = ?auto_538735 ?auto_538737 ) ) ( not ( = ?auto_538735 ?auto_538738 ) ) ( not ( = ?auto_538735 ?auto_538739 ) ) ( not ( = ?auto_538736 ?auto_538737 ) ) ( not ( = ?auto_538736 ?auto_538738 ) ) ( not ( = ?auto_538736 ?auto_538739 ) ) ( not ( = ?auto_538737 ?auto_538738 ) ) ( not ( = ?auto_538737 ?auto_538739 ) ) ( not ( = ?auto_538738 ?auto_538739 ) ) ( ON ?auto_538737 ?auto_538738 ) ( ON ?auto_538736 ?auto_538737 ) ( ON ?auto_538735 ?auto_538736 ) ( ON ?auto_538734 ?auto_538735 ) ( ON ?auto_538733 ?auto_538734 ) ( ON ?auto_538732 ?auto_538733 ) ( ON ?auto_538731 ?auto_538732 ) ( CLEAR ?auto_538729 ) ( ON ?auto_538730 ?auto_538731 ) ( CLEAR ?auto_538730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_538724 ?auto_538725 ?auto_538726 ?auto_538727 ?auto_538728 ?auto_538729 ?auto_538730 )
      ( MAKE-15PILE ?auto_538724 ?auto_538725 ?auto_538726 ?auto_538727 ?auto_538728 ?auto_538729 ?auto_538730 ?auto_538731 ?auto_538732 ?auto_538733 ?auto_538734 ?auto_538735 ?auto_538736 ?auto_538737 ?auto_538738 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538786 - BLOCK
      ?auto_538787 - BLOCK
      ?auto_538788 - BLOCK
      ?auto_538789 - BLOCK
      ?auto_538790 - BLOCK
      ?auto_538791 - BLOCK
      ?auto_538792 - BLOCK
      ?auto_538793 - BLOCK
      ?auto_538794 - BLOCK
      ?auto_538795 - BLOCK
      ?auto_538796 - BLOCK
      ?auto_538797 - BLOCK
      ?auto_538798 - BLOCK
      ?auto_538799 - BLOCK
      ?auto_538800 - BLOCK
    )
    :vars
    (
      ?auto_538801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538800 ?auto_538801 ) ( ON-TABLE ?auto_538786 ) ( ON ?auto_538787 ?auto_538786 ) ( ON ?auto_538788 ?auto_538787 ) ( ON ?auto_538789 ?auto_538788 ) ( ON ?auto_538790 ?auto_538789 ) ( not ( = ?auto_538786 ?auto_538787 ) ) ( not ( = ?auto_538786 ?auto_538788 ) ) ( not ( = ?auto_538786 ?auto_538789 ) ) ( not ( = ?auto_538786 ?auto_538790 ) ) ( not ( = ?auto_538786 ?auto_538791 ) ) ( not ( = ?auto_538786 ?auto_538792 ) ) ( not ( = ?auto_538786 ?auto_538793 ) ) ( not ( = ?auto_538786 ?auto_538794 ) ) ( not ( = ?auto_538786 ?auto_538795 ) ) ( not ( = ?auto_538786 ?auto_538796 ) ) ( not ( = ?auto_538786 ?auto_538797 ) ) ( not ( = ?auto_538786 ?auto_538798 ) ) ( not ( = ?auto_538786 ?auto_538799 ) ) ( not ( = ?auto_538786 ?auto_538800 ) ) ( not ( = ?auto_538786 ?auto_538801 ) ) ( not ( = ?auto_538787 ?auto_538788 ) ) ( not ( = ?auto_538787 ?auto_538789 ) ) ( not ( = ?auto_538787 ?auto_538790 ) ) ( not ( = ?auto_538787 ?auto_538791 ) ) ( not ( = ?auto_538787 ?auto_538792 ) ) ( not ( = ?auto_538787 ?auto_538793 ) ) ( not ( = ?auto_538787 ?auto_538794 ) ) ( not ( = ?auto_538787 ?auto_538795 ) ) ( not ( = ?auto_538787 ?auto_538796 ) ) ( not ( = ?auto_538787 ?auto_538797 ) ) ( not ( = ?auto_538787 ?auto_538798 ) ) ( not ( = ?auto_538787 ?auto_538799 ) ) ( not ( = ?auto_538787 ?auto_538800 ) ) ( not ( = ?auto_538787 ?auto_538801 ) ) ( not ( = ?auto_538788 ?auto_538789 ) ) ( not ( = ?auto_538788 ?auto_538790 ) ) ( not ( = ?auto_538788 ?auto_538791 ) ) ( not ( = ?auto_538788 ?auto_538792 ) ) ( not ( = ?auto_538788 ?auto_538793 ) ) ( not ( = ?auto_538788 ?auto_538794 ) ) ( not ( = ?auto_538788 ?auto_538795 ) ) ( not ( = ?auto_538788 ?auto_538796 ) ) ( not ( = ?auto_538788 ?auto_538797 ) ) ( not ( = ?auto_538788 ?auto_538798 ) ) ( not ( = ?auto_538788 ?auto_538799 ) ) ( not ( = ?auto_538788 ?auto_538800 ) ) ( not ( = ?auto_538788 ?auto_538801 ) ) ( not ( = ?auto_538789 ?auto_538790 ) ) ( not ( = ?auto_538789 ?auto_538791 ) ) ( not ( = ?auto_538789 ?auto_538792 ) ) ( not ( = ?auto_538789 ?auto_538793 ) ) ( not ( = ?auto_538789 ?auto_538794 ) ) ( not ( = ?auto_538789 ?auto_538795 ) ) ( not ( = ?auto_538789 ?auto_538796 ) ) ( not ( = ?auto_538789 ?auto_538797 ) ) ( not ( = ?auto_538789 ?auto_538798 ) ) ( not ( = ?auto_538789 ?auto_538799 ) ) ( not ( = ?auto_538789 ?auto_538800 ) ) ( not ( = ?auto_538789 ?auto_538801 ) ) ( not ( = ?auto_538790 ?auto_538791 ) ) ( not ( = ?auto_538790 ?auto_538792 ) ) ( not ( = ?auto_538790 ?auto_538793 ) ) ( not ( = ?auto_538790 ?auto_538794 ) ) ( not ( = ?auto_538790 ?auto_538795 ) ) ( not ( = ?auto_538790 ?auto_538796 ) ) ( not ( = ?auto_538790 ?auto_538797 ) ) ( not ( = ?auto_538790 ?auto_538798 ) ) ( not ( = ?auto_538790 ?auto_538799 ) ) ( not ( = ?auto_538790 ?auto_538800 ) ) ( not ( = ?auto_538790 ?auto_538801 ) ) ( not ( = ?auto_538791 ?auto_538792 ) ) ( not ( = ?auto_538791 ?auto_538793 ) ) ( not ( = ?auto_538791 ?auto_538794 ) ) ( not ( = ?auto_538791 ?auto_538795 ) ) ( not ( = ?auto_538791 ?auto_538796 ) ) ( not ( = ?auto_538791 ?auto_538797 ) ) ( not ( = ?auto_538791 ?auto_538798 ) ) ( not ( = ?auto_538791 ?auto_538799 ) ) ( not ( = ?auto_538791 ?auto_538800 ) ) ( not ( = ?auto_538791 ?auto_538801 ) ) ( not ( = ?auto_538792 ?auto_538793 ) ) ( not ( = ?auto_538792 ?auto_538794 ) ) ( not ( = ?auto_538792 ?auto_538795 ) ) ( not ( = ?auto_538792 ?auto_538796 ) ) ( not ( = ?auto_538792 ?auto_538797 ) ) ( not ( = ?auto_538792 ?auto_538798 ) ) ( not ( = ?auto_538792 ?auto_538799 ) ) ( not ( = ?auto_538792 ?auto_538800 ) ) ( not ( = ?auto_538792 ?auto_538801 ) ) ( not ( = ?auto_538793 ?auto_538794 ) ) ( not ( = ?auto_538793 ?auto_538795 ) ) ( not ( = ?auto_538793 ?auto_538796 ) ) ( not ( = ?auto_538793 ?auto_538797 ) ) ( not ( = ?auto_538793 ?auto_538798 ) ) ( not ( = ?auto_538793 ?auto_538799 ) ) ( not ( = ?auto_538793 ?auto_538800 ) ) ( not ( = ?auto_538793 ?auto_538801 ) ) ( not ( = ?auto_538794 ?auto_538795 ) ) ( not ( = ?auto_538794 ?auto_538796 ) ) ( not ( = ?auto_538794 ?auto_538797 ) ) ( not ( = ?auto_538794 ?auto_538798 ) ) ( not ( = ?auto_538794 ?auto_538799 ) ) ( not ( = ?auto_538794 ?auto_538800 ) ) ( not ( = ?auto_538794 ?auto_538801 ) ) ( not ( = ?auto_538795 ?auto_538796 ) ) ( not ( = ?auto_538795 ?auto_538797 ) ) ( not ( = ?auto_538795 ?auto_538798 ) ) ( not ( = ?auto_538795 ?auto_538799 ) ) ( not ( = ?auto_538795 ?auto_538800 ) ) ( not ( = ?auto_538795 ?auto_538801 ) ) ( not ( = ?auto_538796 ?auto_538797 ) ) ( not ( = ?auto_538796 ?auto_538798 ) ) ( not ( = ?auto_538796 ?auto_538799 ) ) ( not ( = ?auto_538796 ?auto_538800 ) ) ( not ( = ?auto_538796 ?auto_538801 ) ) ( not ( = ?auto_538797 ?auto_538798 ) ) ( not ( = ?auto_538797 ?auto_538799 ) ) ( not ( = ?auto_538797 ?auto_538800 ) ) ( not ( = ?auto_538797 ?auto_538801 ) ) ( not ( = ?auto_538798 ?auto_538799 ) ) ( not ( = ?auto_538798 ?auto_538800 ) ) ( not ( = ?auto_538798 ?auto_538801 ) ) ( not ( = ?auto_538799 ?auto_538800 ) ) ( not ( = ?auto_538799 ?auto_538801 ) ) ( not ( = ?auto_538800 ?auto_538801 ) ) ( ON ?auto_538799 ?auto_538800 ) ( ON ?auto_538798 ?auto_538799 ) ( ON ?auto_538797 ?auto_538798 ) ( ON ?auto_538796 ?auto_538797 ) ( ON ?auto_538795 ?auto_538796 ) ( ON ?auto_538794 ?auto_538795 ) ( ON ?auto_538793 ?auto_538794 ) ( ON ?auto_538792 ?auto_538793 ) ( CLEAR ?auto_538790 ) ( ON ?auto_538791 ?auto_538792 ) ( CLEAR ?auto_538791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_538786 ?auto_538787 ?auto_538788 ?auto_538789 ?auto_538790 ?auto_538791 )
      ( MAKE-15PILE ?auto_538786 ?auto_538787 ?auto_538788 ?auto_538789 ?auto_538790 ?auto_538791 ?auto_538792 ?auto_538793 ?auto_538794 ?auto_538795 ?auto_538796 ?auto_538797 ?auto_538798 ?auto_538799 ?auto_538800 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538848 - BLOCK
      ?auto_538849 - BLOCK
      ?auto_538850 - BLOCK
      ?auto_538851 - BLOCK
      ?auto_538852 - BLOCK
      ?auto_538853 - BLOCK
      ?auto_538854 - BLOCK
      ?auto_538855 - BLOCK
      ?auto_538856 - BLOCK
      ?auto_538857 - BLOCK
      ?auto_538858 - BLOCK
      ?auto_538859 - BLOCK
      ?auto_538860 - BLOCK
      ?auto_538861 - BLOCK
      ?auto_538862 - BLOCK
    )
    :vars
    (
      ?auto_538863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538862 ?auto_538863 ) ( ON-TABLE ?auto_538848 ) ( ON ?auto_538849 ?auto_538848 ) ( ON ?auto_538850 ?auto_538849 ) ( ON ?auto_538851 ?auto_538850 ) ( not ( = ?auto_538848 ?auto_538849 ) ) ( not ( = ?auto_538848 ?auto_538850 ) ) ( not ( = ?auto_538848 ?auto_538851 ) ) ( not ( = ?auto_538848 ?auto_538852 ) ) ( not ( = ?auto_538848 ?auto_538853 ) ) ( not ( = ?auto_538848 ?auto_538854 ) ) ( not ( = ?auto_538848 ?auto_538855 ) ) ( not ( = ?auto_538848 ?auto_538856 ) ) ( not ( = ?auto_538848 ?auto_538857 ) ) ( not ( = ?auto_538848 ?auto_538858 ) ) ( not ( = ?auto_538848 ?auto_538859 ) ) ( not ( = ?auto_538848 ?auto_538860 ) ) ( not ( = ?auto_538848 ?auto_538861 ) ) ( not ( = ?auto_538848 ?auto_538862 ) ) ( not ( = ?auto_538848 ?auto_538863 ) ) ( not ( = ?auto_538849 ?auto_538850 ) ) ( not ( = ?auto_538849 ?auto_538851 ) ) ( not ( = ?auto_538849 ?auto_538852 ) ) ( not ( = ?auto_538849 ?auto_538853 ) ) ( not ( = ?auto_538849 ?auto_538854 ) ) ( not ( = ?auto_538849 ?auto_538855 ) ) ( not ( = ?auto_538849 ?auto_538856 ) ) ( not ( = ?auto_538849 ?auto_538857 ) ) ( not ( = ?auto_538849 ?auto_538858 ) ) ( not ( = ?auto_538849 ?auto_538859 ) ) ( not ( = ?auto_538849 ?auto_538860 ) ) ( not ( = ?auto_538849 ?auto_538861 ) ) ( not ( = ?auto_538849 ?auto_538862 ) ) ( not ( = ?auto_538849 ?auto_538863 ) ) ( not ( = ?auto_538850 ?auto_538851 ) ) ( not ( = ?auto_538850 ?auto_538852 ) ) ( not ( = ?auto_538850 ?auto_538853 ) ) ( not ( = ?auto_538850 ?auto_538854 ) ) ( not ( = ?auto_538850 ?auto_538855 ) ) ( not ( = ?auto_538850 ?auto_538856 ) ) ( not ( = ?auto_538850 ?auto_538857 ) ) ( not ( = ?auto_538850 ?auto_538858 ) ) ( not ( = ?auto_538850 ?auto_538859 ) ) ( not ( = ?auto_538850 ?auto_538860 ) ) ( not ( = ?auto_538850 ?auto_538861 ) ) ( not ( = ?auto_538850 ?auto_538862 ) ) ( not ( = ?auto_538850 ?auto_538863 ) ) ( not ( = ?auto_538851 ?auto_538852 ) ) ( not ( = ?auto_538851 ?auto_538853 ) ) ( not ( = ?auto_538851 ?auto_538854 ) ) ( not ( = ?auto_538851 ?auto_538855 ) ) ( not ( = ?auto_538851 ?auto_538856 ) ) ( not ( = ?auto_538851 ?auto_538857 ) ) ( not ( = ?auto_538851 ?auto_538858 ) ) ( not ( = ?auto_538851 ?auto_538859 ) ) ( not ( = ?auto_538851 ?auto_538860 ) ) ( not ( = ?auto_538851 ?auto_538861 ) ) ( not ( = ?auto_538851 ?auto_538862 ) ) ( not ( = ?auto_538851 ?auto_538863 ) ) ( not ( = ?auto_538852 ?auto_538853 ) ) ( not ( = ?auto_538852 ?auto_538854 ) ) ( not ( = ?auto_538852 ?auto_538855 ) ) ( not ( = ?auto_538852 ?auto_538856 ) ) ( not ( = ?auto_538852 ?auto_538857 ) ) ( not ( = ?auto_538852 ?auto_538858 ) ) ( not ( = ?auto_538852 ?auto_538859 ) ) ( not ( = ?auto_538852 ?auto_538860 ) ) ( not ( = ?auto_538852 ?auto_538861 ) ) ( not ( = ?auto_538852 ?auto_538862 ) ) ( not ( = ?auto_538852 ?auto_538863 ) ) ( not ( = ?auto_538853 ?auto_538854 ) ) ( not ( = ?auto_538853 ?auto_538855 ) ) ( not ( = ?auto_538853 ?auto_538856 ) ) ( not ( = ?auto_538853 ?auto_538857 ) ) ( not ( = ?auto_538853 ?auto_538858 ) ) ( not ( = ?auto_538853 ?auto_538859 ) ) ( not ( = ?auto_538853 ?auto_538860 ) ) ( not ( = ?auto_538853 ?auto_538861 ) ) ( not ( = ?auto_538853 ?auto_538862 ) ) ( not ( = ?auto_538853 ?auto_538863 ) ) ( not ( = ?auto_538854 ?auto_538855 ) ) ( not ( = ?auto_538854 ?auto_538856 ) ) ( not ( = ?auto_538854 ?auto_538857 ) ) ( not ( = ?auto_538854 ?auto_538858 ) ) ( not ( = ?auto_538854 ?auto_538859 ) ) ( not ( = ?auto_538854 ?auto_538860 ) ) ( not ( = ?auto_538854 ?auto_538861 ) ) ( not ( = ?auto_538854 ?auto_538862 ) ) ( not ( = ?auto_538854 ?auto_538863 ) ) ( not ( = ?auto_538855 ?auto_538856 ) ) ( not ( = ?auto_538855 ?auto_538857 ) ) ( not ( = ?auto_538855 ?auto_538858 ) ) ( not ( = ?auto_538855 ?auto_538859 ) ) ( not ( = ?auto_538855 ?auto_538860 ) ) ( not ( = ?auto_538855 ?auto_538861 ) ) ( not ( = ?auto_538855 ?auto_538862 ) ) ( not ( = ?auto_538855 ?auto_538863 ) ) ( not ( = ?auto_538856 ?auto_538857 ) ) ( not ( = ?auto_538856 ?auto_538858 ) ) ( not ( = ?auto_538856 ?auto_538859 ) ) ( not ( = ?auto_538856 ?auto_538860 ) ) ( not ( = ?auto_538856 ?auto_538861 ) ) ( not ( = ?auto_538856 ?auto_538862 ) ) ( not ( = ?auto_538856 ?auto_538863 ) ) ( not ( = ?auto_538857 ?auto_538858 ) ) ( not ( = ?auto_538857 ?auto_538859 ) ) ( not ( = ?auto_538857 ?auto_538860 ) ) ( not ( = ?auto_538857 ?auto_538861 ) ) ( not ( = ?auto_538857 ?auto_538862 ) ) ( not ( = ?auto_538857 ?auto_538863 ) ) ( not ( = ?auto_538858 ?auto_538859 ) ) ( not ( = ?auto_538858 ?auto_538860 ) ) ( not ( = ?auto_538858 ?auto_538861 ) ) ( not ( = ?auto_538858 ?auto_538862 ) ) ( not ( = ?auto_538858 ?auto_538863 ) ) ( not ( = ?auto_538859 ?auto_538860 ) ) ( not ( = ?auto_538859 ?auto_538861 ) ) ( not ( = ?auto_538859 ?auto_538862 ) ) ( not ( = ?auto_538859 ?auto_538863 ) ) ( not ( = ?auto_538860 ?auto_538861 ) ) ( not ( = ?auto_538860 ?auto_538862 ) ) ( not ( = ?auto_538860 ?auto_538863 ) ) ( not ( = ?auto_538861 ?auto_538862 ) ) ( not ( = ?auto_538861 ?auto_538863 ) ) ( not ( = ?auto_538862 ?auto_538863 ) ) ( ON ?auto_538861 ?auto_538862 ) ( ON ?auto_538860 ?auto_538861 ) ( ON ?auto_538859 ?auto_538860 ) ( ON ?auto_538858 ?auto_538859 ) ( ON ?auto_538857 ?auto_538858 ) ( ON ?auto_538856 ?auto_538857 ) ( ON ?auto_538855 ?auto_538856 ) ( ON ?auto_538854 ?auto_538855 ) ( ON ?auto_538853 ?auto_538854 ) ( CLEAR ?auto_538851 ) ( ON ?auto_538852 ?auto_538853 ) ( CLEAR ?auto_538852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_538848 ?auto_538849 ?auto_538850 ?auto_538851 ?auto_538852 )
      ( MAKE-15PILE ?auto_538848 ?auto_538849 ?auto_538850 ?auto_538851 ?auto_538852 ?auto_538853 ?auto_538854 ?auto_538855 ?auto_538856 ?auto_538857 ?auto_538858 ?auto_538859 ?auto_538860 ?auto_538861 ?auto_538862 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538910 - BLOCK
      ?auto_538911 - BLOCK
      ?auto_538912 - BLOCK
      ?auto_538913 - BLOCK
      ?auto_538914 - BLOCK
      ?auto_538915 - BLOCK
      ?auto_538916 - BLOCK
      ?auto_538917 - BLOCK
      ?auto_538918 - BLOCK
      ?auto_538919 - BLOCK
      ?auto_538920 - BLOCK
      ?auto_538921 - BLOCK
      ?auto_538922 - BLOCK
      ?auto_538923 - BLOCK
      ?auto_538924 - BLOCK
    )
    :vars
    (
      ?auto_538925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538924 ?auto_538925 ) ( ON-TABLE ?auto_538910 ) ( ON ?auto_538911 ?auto_538910 ) ( ON ?auto_538912 ?auto_538911 ) ( not ( = ?auto_538910 ?auto_538911 ) ) ( not ( = ?auto_538910 ?auto_538912 ) ) ( not ( = ?auto_538910 ?auto_538913 ) ) ( not ( = ?auto_538910 ?auto_538914 ) ) ( not ( = ?auto_538910 ?auto_538915 ) ) ( not ( = ?auto_538910 ?auto_538916 ) ) ( not ( = ?auto_538910 ?auto_538917 ) ) ( not ( = ?auto_538910 ?auto_538918 ) ) ( not ( = ?auto_538910 ?auto_538919 ) ) ( not ( = ?auto_538910 ?auto_538920 ) ) ( not ( = ?auto_538910 ?auto_538921 ) ) ( not ( = ?auto_538910 ?auto_538922 ) ) ( not ( = ?auto_538910 ?auto_538923 ) ) ( not ( = ?auto_538910 ?auto_538924 ) ) ( not ( = ?auto_538910 ?auto_538925 ) ) ( not ( = ?auto_538911 ?auto_538912 ) ) ( not ( = ?auto_538911 ?auto_538913 ) ) ( not ( = ?auto_538911 ?auto_538914 ) ) ( not ( = ?auto_538911 ?auto_538915 ) ) ( not ( = ?auto_538911 ?auto_538916 ) ) ( not ( = ?auto_538911 ?auto_538917 ) ) ( not ( = ?auto_538911 ?auto_538918 ) ) ( not ( = ?auto_538911 ?auto_538919 ) ) ( not ( = ?auto_538911 ?auto_538920 ) ) ( not ( = ?auto_538911 ?auto_538921 ) ) ( not ( = ?auto_538911 ?auto_538922 ) ) ( not ( = ?auto_538911 ?auto_538923 ) ) ( not ( = ?auto_538911 ?auto_538924 ) ) ( not ( = ?auto_538911 ?auto_538925 ) ) ( not ( = ?auto_538912 ?auto_538913 ) ) ( not ( = ?auto_538912 ?auto_538914 ) ) ( not ( = ?auto_538912 ?auto_538915 ) ) ( not ( = ?auto_538912 ?auto_538916 ) ) ( not ( = ?auto_538912 ?auto_538917 ) ) ( not ( = ?auto_538912 ?auto_538918 ) ) ( not ( = ?auto_538912 ?auto_538919 ) ) ( not ( = ?auto_538912 ?auto_538920 ) ) ( not ( = ?auto_538912 ?auto_538921 ) ) ( not ( = ?auto_538912 ?auto_538922 ) ) ( not ( = ?auto_538912 ?auto_538923 ) ) ( not ( = ?auto_538912 ?auto_538924 ) ) ( not ( = ?auto_538912 ?auto_538925 ) ) ( not ( = ?auto_538913 ?auto_538914 ) ) ( not ( = ?auto_538913 ?auto_538915 ) ) ( not ( = ?auto_538913 ?auto_538916 ) ) ( not ( = ?auto_538913 ?auto_538917 ) ) ( not ( = ?auto_538913 ?auto_538918 ) ) ( not ( = ?auto_538913 ?auto_538919 ) ) ( not ( = ?auto_538913 ?auto_538920 ) ) ( not ( = ?auto_538913 ?auto_538921 ) ) ( not ( = ?auto_538913 ?auto_538922 ) ) ( not ( = ?auto_538913 ?auto_538923 ) ) ( not ( = ?auto_538913 ?auto_538924 ) ) ( not ( = ?auto_538913 ?auto_538925 ) ) ( not ( = ?auto_538914 ?auto_538915 ) ) ( not ( = ?auto_538914 ?auto_538916 ) ) ( not ( = ?auto_538914 ?auto_538917 ) ) ( not ( = ?auto_538914 ?auto_538918 ) ) ( not ( = ?auto_538914 ?auto_538919 ) ) ( not ( = ?auto_538914 ?auto_538920 ) ) ( not ( = ?auto_538914 ?auto_538921 ) ) ( not ( = ?auto_538914 ?auto_538922 ) ) ( not ( = ?auto_538914 ?auto_538923 ) ) ( not ( = ?auto_538914 ?auto_538924 ) ) ( not ( = ?auto_538914 ?auto_538925 ) ) ( not ( = ?auto_538915 ?auto_538916 ) ) ( not ( = ?auto_538915 ?auto_538917 ) ) ( not ( = ?auto_538915 ?auto_538918 ) ) ( not ( = ?auto_538915 ?auto_538919 ) ) ( not ( = ?auto_538915 ?auto_538920 ) ) ( not ( = ?auto_538915 ?auto_538921 ) ) ( not ( = ?auto_538915 ?auto_538922 ) ) ( not ( = ?auto_538915 ?auto_538923 ) ) ( not ( = ?auto_538915 ?auto_538924 ) ) ( not ( = ?auto_538915 ?auto_538925 ) ) ( not ( = ?auto_538916 ?auto_538917 ) ) ( not ( = ?auto_538916 ?auto_538918 ) ) ( not ( = ?auto_538916 ?auto_538919 ) ) ( not ( = ?auto_538916 ?auto_538920 ) ) ( not ( = ?auto_538916 ?auto_538921 ) ) ( not ( = ?auto_538916 ?auto_538922 ) ) ( not ( = ?auto_538916 ?auto_538923 ) ) ( not ( = ?auto_538916 ?auto_538924 ) ) ( not ( = ?auto_538916 ?auto_538925 ) ) ( not ( = ?auto_538917 ?auto_538918 ) ) ( not ( = ?auto_538917 ?auto_538919 ) ) ( not ( = ?auto_538917 ?auto_538920 ) ) ( not ( = ?auto_538917 ?auto_538921 ) ) ( not ( = ?auto_538917 ?auto_538922 ) ) ( not ( = ?auto_538917 ?auto_538923 ) ) ( not ( = ?auto_538917 ?auto_538924 ) ) ( not ( = ?auto_538917 ?auto_538925 ) ) ( not ( = ?auto_538918 ?auto_538919 ) ) ( not ( = ?auto_538918 ?auto_538920 ) ) ( not ( = ?auto_538918 ?auto_538921 ) ) ( not ( = ?auto_538918 ?auto_538922 ) ) ( not ( = ?auto_538918 ?auto_538923 ) ) ( not ( = ?auto_538918 ?auto_538924 ) ) ( not ( = ?auto_538918 ?auto_538925 ) ) ( not ( = ?auto_538919 ?auto_538920 ) ) ( not ( = ?auto_538919 ?auto_538921 ) ) ( not ( = ?auto_538919 ?auto_538922 ) ) ( not ( = ?auto_538919 ?auto_538923 ) ) ( not ( = ?auto_538919 ?auto_538924 ) ) ( not ( = ?auto_538919 ?auto_538925 ) ) ( not ( = ?auto_538920 ?auto_538921 ) ) ( not ( = ?auto_538920 ?auto_538922 ) ) ( not ( = ?auto_538920 ?auto_538923 ) ) ( not ( = ?auto_538920 ?auto_538924 ) ) ( not ( = ?auto_538920 ?auto_538925 ) ) ( not ( = ?auto_538921 ?auto_538922 ) ) ( not ( = ?auto_538921 ?auto_538923 ) ) ( not ( = ?auto_538921 ?auto_538924 ) ) ( not ( = ?auto_538921 ?auto_538925 ) ) ( not ( = ?auto_538922 ?auto_538923 ) ) ( not ( = ?auto_538922 ?auto_538924 ) ) ( not ( = ?auto_538922 ?auto_538925 ) ) ( not ( = ?auto_538923 ?auto_538924 ) ) ( not ( = ?auto_538923 ?auto_538925 ) ) ( not ( = ?auto_538924 ?auto_538925 ) ) ( ON ?auto_538923 ?auto_538924 ) ( ON ?auto_538922 ?auto_538923 ) ( ON ?auto_538921 ?auto_538922 ) ( ON ?auto_538920 ?auto_538921 ) ( ON ?auto_538919 ?auto_538920 ) ( ON ?auto_538918 ?auto_538919 ) ( ON ?auto_538917 ?auto_538918 ) ( ON ?auto_538916 ?auto_538917 ) ( ON ?auto_538915 ?auto_538916 ) ( ON ?auto_538914 ?auto_538915 ) ( CLEAR ?auto_538912 ) ( ON ?auto_538913 ?auto_538914 ) ( CLEAR ?auto_538913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_538910 ?auto_538911 ?auto_538912 ?auto_538913 )
      ( MAKE-15PILE ?auto_538910 ?auto_538911 ?auto_538912 ?auto_538913 ?auto_538914 ?auto_538915 ?auto_538916 ?auto_538917 ?auto_538918 ?auto_538919 ?auto_538920 ?auto_538921 ?auto_538922 ?auto_538923 ?auto_538924 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_538972 - BLOCK
      ?auto_538973 - BLOCK
      ?auto_538974 - BLOCK
      ?auto_538975 - BLOCK
      ?auto_538976 - BLOCK
      ?auto_538977 - BLOCK
      ?auto_538978 - BLOCK
      ?auto_538979 - BLOCK
      ?auto_538980 - BLOCK
      ?auto_538981 - BLOCK
      ?auto_538982 - BLOCK
      ?auto_538983 - BLOCK
      ?auto_538984 - BLOCK
      ?auto_538985 - BLOCK
      ?auto_538986 - BLOCK
    )
    :vars
    (
      ?auto_538987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_538986 ?auto_538987 ) ( ON-TABLE ?auto_538972 ) ( ON ?auto_538973 ?auto_538972 ) ( not ( = ?auto_538972 ?auto_538973 ) ) ( not ( = ?auto_538972 ?auto_538974 ) ) ( not ( = ?auto_538972 ?auto_538975 ) ) ( not ( = ?auto_538972 ?auto_538976 ) ) ( not ( = ?auto_538972 ?auto_538977 ) ) ( not ( = ?auto_538972 ?auto_538978 ) ) ( not ( = ?auto_538972 ?auto_538979 ) ) ( not ( = ?auto_538972 ?auto_538980 ) ) ( not ( = ?auto_538972 ?auto_538981 ) ) ( not ( = ?auto_538972 ?auto_538982 ) ) ( not ( = ?auto_538972 ?auto_538983 ) ) ( not ( = ?auto_538972 ?auto_538984 ) ) ( not ( = ?auto_538972 ?auto_538985 ) ) ( not ( = ?auto_538972 ?auto_538986 ) ) ( not ( = ?auto_538972 ?auto_538987 ) ) ( not ( = ?auto_538973 ?auto_538974 ) ) ( not ( = ?auto_538973 ?auto_538975 ) ) ( not ( = ?auto_538973 ?auto_538976 ) ) ( not ( = ?auto_538973 ?auto_538977 ) ) ( not ( = ?auto_538973 ?auto_538978 ) ) ( not ( = ?auto_538973 ?auto_538979 ) ) ( not ( = ?auto_538973 ?auto_538980 ) ) ( not ( = ?auto_538973 ?auto_538981 ) ) ( not ( = ?auto_538973 ?auto_538982 ) ) ( not ( = ?auto_538973 ?auto_538983 ) ) ( not ( = ?auto_538973 ?auto_538984 ) ) ( not ( = ?auto_538973 ?auto_538985 ) ) ( not ( = ?auto_538973 ?auto_538986 ) ) ( not ( = ?auto_538973 ?auto_538987 ) ) ( not ( = ?auto_538974 ?auto_538975 ) ) ( not ( = ?auto_538974 ?auto_538976 ) ) ( not ( = ?auto_538974 ?auto_538977 ) ) ( not ( = ?auto_538974 ?auto_538978 ) ) ( not ( = ?auto_538974 ?auto_538979 ) ) ( not ( = ?auto_538974 ?auto_538980 ) ) ( not ( = ?auto_538974 ?auto_538981 ) ) ( not ( = ?auto_538974 ?auto_538982 ) ) ( not ( = ?auto_538974 ?auto_538983 ) ) ( not ( = ?auto_538974 ?auto_538984 ) ) ( not ( = ?auto_538974 ?auto_538985 ) ) ( not ( = ?auto_538974 ?auto_538986 ) ) ( not ( = ?auto_538974 ?auto_538987 ) ) ( not ( = ?auto_538975 ?auto_538976 ) ) ( not ( = ?auto_538975 ?auto_538977 ) ) ( not ( = ?auto_538975 ?auto_538978 ) ) ( not ( = ?auto_538975 ?auto_538979 ) ) ( not ( = ?auto_538975 ?auto_538980 ) ) ( not ( = ?auto_538975 ?auto_538981 ) ) ( not ( = ?auto_538975 ?auto_538982 ) ) ( not ( = ?auto_538975 ?auto_538983 ) ) ( not ( = ?auto_538975 ?auto_538984 ) ) ( not ( = ?auto_538975 ?auto_538985 ) ) ( not ( = ?auto_538975 ?auto_538986 ) ) ( not ( = ?auto_538975 ?auto_538987 ) ) ( not ( = ?auto_538976 ?auto_538977 ) ) ( not ( = ?auto_538976 ?auto_538978 ) ) ( not ( = ?auto_538976 ?auto_538979 ) ) ( not ( = ?auto_538976 ?auto_538980 ) ) ( not ( = ?auto_538976 ?auto_538981 ) ) ( not ( = ?auto_538976 ?auto_538982 ) ) ( not ( = ?auto_538976 ?auto_538983 ) ) ( not ( = ?auto_538976 ?auto_538984 ) ) ( not ( = ?auto_538976 ?auto_538985 ) ) ( not ( = ?auto_538976 ?auto_538986 ) ) ( not ( = ?auto_538976 ?auto_538987 ) ) ( not ( = ?auto_538977 ?auto_538978 ) ) ( not ( = ?auto_538977 ?auto_538979 ) ) ( not ( = ?auto_538977 ?auto_538980 ) ) ( not ( = ?auto_538977 ?auto_538981 ) ) ( not ( = ?auto_538977 ?auto_538982 ) ) ( not ( = ?auto_538977 ?auto_538983 ) ) ( not ( = ?auto_538977 ?auto_538984 ) ) ( not ( = ?auto_538977 ?auto_538985 ) ) ( not ( = ?auto_538977 ?auto_538986 ) ) ( not ( = ?auto_538977 ?auto_538987 ) ) ( not ( = ?auto_538978 ?auto_538979 ) ) ( not ( = ?auto_538978 ?auto_538980 ) ) ( not ( = ?auto_538978 ?auto_538981 ) ) ( not ( = ?auto_538978 ?auto_538982 ) ) ( not ( = ?auto_538978 ?auto_538983 ) ) ( not ( = ?auto_538978 ?auto_538984 ) ) ( not ( = ?auto_538978 ?auto_538985 ) ) ( not ( = ?auto_538978 ?auto_538986 ) ) ( not ( = ?auto_538978 ?auto_538987 ) ) ( not ( = ?auto_538979 ?auto_538980 ) ) ( not ( = ?auto_538979 ?auto_538981 ) ) ( not ( = ?auto_538979 ?auto_538982 ) ) ( not ( = ?auto_538979 ?auto_538983 ) ) ( not ( = ?auto_538979 ?auto_538984 ) ) ( not ( = ?auto_538979 ?auto_538985 ) ) ( not ( = ?auto_538979 ?auto_538986 ) ) ( not ( = ?auto_538979 ?auto_538987 ) ) ( not ( = ?auto_538980 ?auto_538981 ) ) ( not ( = ?auto_538980 ?auto_538982 ) ) ( not ( = ?auto_538980 ?auto_538983 ) ) ( not ( = ?auto_538980 ?auto_538984 ) ) ( not ( = ?auto_538980 ?auto_538985 ) ) ( not ( = ?auto_538980 ?auto_538986 ) ) ( not ( = ?auto_538980 ?auto_538987 ) ) ( not ( = ?auto_538981 ?auto_538982 ) ) ( not ( = ?auto_538981 ?auto_538983 ) ) ( not ( = ?auto_538981 ?auto_538984 ) ) ( not ( = ?auto_538981 ?auto_538985 ) ) ( not ( = ?auto_538981 ?auto_538986 ) ) ( not ( = ?auto_538981 ?auto_538987 ) ) ( not ( = ?auto_538982 ?auto_538983 ) ) ( not ( = ?auto_538982 ?auto_538984 ) ) ( not ( = ?auto_538982 ?auto_538985 ) ) ( not ( = ?auto_538982 ?auto_538986 ) ) ( not ( = ?auto_538982 ?auto_538987 ) ) ( not ( = ?auto_538983 ?auto_538984 ) ) ( not ( = ?auto_538983 ?auto_538985 ) ) ( not ( = ?auto_538983 ?auto_538986 ) ) ( not ( = ?auto_538983 ?auto_538987 ) ) ( not ( = ?auto_538984 ?auto_538985 ) ) ( not ( = ?auto_538984 ?auto_538986 ) ) ( not ( = ?auto_538984 ?auto_538987 ) ) ( not ( = ?auto_538985 ?auto_538986 ) ) ( not ( = ?auto_538985 ?auto_538987 ) ) ( not ( = ?auto_538986 ?auto_538987 ) ) ( ON ?auto_538985 ?auto_538986 ) ( ON ?auto_538984 ?auto_538985 ) ( ON ?auto_538983 ?auto_538984 ) ( ON ?auto_538982 ?auto_538983 ) ( ON ?auto_538981 ?auto_538982 ) ( ON ?auto_538980 ?auto_538981 ) ( ON ?auto_538979 ?auto_538980 ) ( ON ?auto_538978 ?auto_538979 ) ( ON ?auto_538977 ?auto_538978 ) ( ON ?auto_538976 ?auto_538977 ) ( ON ?auto_538975 ?auto_538976 ) ( CLEAR ?auto_538973 ) ( ON ?auto_538974 ?auto_538975 ) ( CLEAR ?auto_538974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_538972 ?auto_538973 ?auto_538974 )
      ( MAKE-15PILE ?auto_538972 ?auto_538973 ?auto_538974 ?auto_538975 ?auto_538976 ?auto_538977 ?auto_538978 ?auto_538979 ?auto_538980 ?auto_538981 ?auto_538982 ?auto_538983 ?auto_538984 ?auto_538985 ?auto_538986 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_539034 - BLOCK
      ?auto_539035 - BLOCK
      ?auto_539036 - BLOCK
      ?auto_539037 - BLOCK
      ?auto_539038 - BLOCK
      ?auto_539039 - BLOCK
      ?auto_539040 - BLOCK
      ?auto_539041 - BLOCK
      ?auto_539042 - BLOCK
      ?auto_539043 - BLOCK
      ?auto_539044 - BLOCK
      ?auto_539045 - BLOCK
      ?auto_539046 - BLOCK
      ?auto_539047 - BLOCK
      ?auto_539048 - BLOCK
    )
    :vars
    (
      ?auto_539049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539048 ?auto_539049 ) ( ON-TABLE ?auto_539034 ) ( not ( = ?auto_539034 ?auto_539035 ) ) ( not ( = ?auto_539034 ?auto_539036 ) ) ( not ( = ?auto_539034 ?auto_539037 ) ) ( not ( = ?auto_539034 ?auto_539038 ) ) ( not ( = ?auto_539034 ?auto_539039 ) ) ( not ( = ?auto_539034 ?auto_539040 ) ) ( not ( = ?auto_539034 ?auto_539041 ) ) ( not ( = ?auto_539034 ?auto_539042 ) ) ( not ( = ?auto_539034 ?auto_539043 ) ) ( not ( = ?auto_539034 ?auto_539044 ) ) ( not ( = ?auto_539034 ?auto_539045 ) ) ( not ( = ?auto_539034 ?auto_539046 ) ) ( not ( = ?auto_539034 ?auto_539047 ) ) ( not ( = ?auto_539034 ?auto_539048 ) ) ( not ( = ?auto_539034 ?auto_539049 ) ) ( not ( = ?auto_539035 ?auto_539036 ) ) ( not ( = ?auto_539035 ?auto_539037 ) ) ( not ( = ?auto_539035 ?auto_539038 ) ) ( not ( = ?auto_539035 ?auto_539039 ) ) ( not ( = ?auto_539035 ?auto_539040 ) ) ( not ( = ?auto_539035 ?auto_539041 ) ) ( not ( = ?auto_539035 ?auto_539042 ) ) ( not ( = ?auto_539035 ?auto_539043 ) ) ( not ( = ?auto_539035 ?auto_539044 ) ) ( not ( = ?auto_539035 ?auto_539045 ) ) ( not ( = ?auto_539035 ?auto_539046 ) ) ( not ( = ?auto_539035 ?auto_539047 ) ) ( not ( = ?auto_539035 ?auto_539048 ) ) ( not ( = ?auto_539035 ?auto_539049 ) ) ( not ( = ?auto_539036 ?auto_539037 ) ) ( not ( = ?auto_539036 ?auto_539038 ) ) ( not ( = ?auto_539036 ?auto_539039 ) ) ( not ( = ?auto_539036 ?auto_539040 ) ) ( not ( = ?auto_539036 ?auto_539041 ) ) ( not ( = ?auto_539036 ?auto_539042 ) ) ( not ( = ?auto_539036 ?auto_539043 ) ) ( not ( = ?auto_539036 ?auto_539044 ) ) ( not ( = ?auto_539036 ?auto_539045 ) ) ( not ( = ?auto_539036 ?auto_539046 ) ) ( not ( = ?auto_539036 ?auto_539047 ) ) ( not ( = ?auto_539036 ?auto_539048 ) ) ( not ( = ?auto_539036 ?auto_539049 ) ) ( not ( = ?auto_539037 ?auto_539038 ) ) ( not ( = ?auto_539037 ?auto_539039 ) ) ( not ( = ?auto_539037 ?auto_539040 ) ) ( not ( = ?auto_539037 ?auto_539041 ) ) ( not ( = ?auto_539037 ?auto_539042 ) ) ( not ( = ?auto_539037 ?auto_539043 ) ) ( not ( = ?auto_539037 ?auto_539044 ) ) ( not ( = ?auto_539037 ?auto_539045 ) ) ( not ( = ?auto_539037 ?auto_539046 ) ) ( not ( = ?auto_539037 ?auto_539047 ) ) ( not ( = ?auto_539037 ?auto_539048 ) ) ( not ( = ?auto_539037 ?auto_539049 ) ) ( not ( = ?auto_539038 ?auto_539039 ) ) ( not ( = ?auto_539038 ?auto_539040 ) ) ( not ( = ?auto_539038 ?auto_539041 ) ) ( not ( = ?auto_539038 ?auto_539042 ) ) ( not ( = ?auto_539038 ?auto_539043 ) ) ( not ( = ?auto_539038 ?auto_539044 ) ) ( not ( = ?auto_539038 ?auto_539045 ) ) ( not ( = ?auto_539038 ?auto_539046 ) ) ( not ( = ?auto_539038 ?auto_539047 ) ) ( not ( = ?auto_539038 ?auto_539048 ) ) ( not ( = ?auto_539038 ?auto_539049 ) ) ( not ( = ?auto_539039 ?auto_539040 ) ) ( not ( = ?auto_539039 ?auto_539041 ) ) ( not ( = ?auto_539039 ?auto_539042 ) ) ( not ( = ?auto_539039 ?auto_539043 ) ) ( not ( = ?auto_539039 ?auto_539044 ) ) ( not ( = ?auto_539039 ?auto_539045 ) ) ( not ( = ?auto_539039 ?auto_539046 ) ) ( not ( = ?auto_539039 ?auto_539047 ) ) ( not ( = ?auto_539039 ?auto_539048 ) ) ( not ( = ?auto_539039 ?auto_539049 ) ) ( not ( = ?auto_539040 ?auto_539041 ) ) ( not ( = ?auto_539040 ?auto_539042 ) ) ( not ( = ?auto_539040 ?auto_539043 ) ) ( not ( = ?auto_539040 ?auto_539044 ) ) ( not ( = ?auto_539040 ?auto_539045 ) ) ( not ( = ?auto_539040 ?auto_539046 ) ) ( not ( = ?auto_539040 ?auto_539047 ) ) ( not ( = ?auto_539040 ?auto_539048 ) ) ( not ( = ?auto_539040 ?auto_539049 ) ) ( not ( = ?auto_539041 ?auto_539042 ) ) ( not ( = ?auto_539041 ?auto_539043 ) ) ( not ( = ?auto_539041 ?auto_539044 ) ) ( not ( = ?auto_539041 ?auto_539045 ) ) ( not ( = ?auto_539041 ?auto_539046 ) ) ( not ( = ?auto_539041 ?auto_539047 ) ) ( not ( = ?auto_539041 ?auto_539048 ) ) ( not ( = ?auto_539041 ?auto_539049 ) ) ( not ( = ?auto_539042 ?auto_539043 ) ) ( not ( = ?auto_539042 ?auto_539044 ) ) ( not ( = ?auto_539042 ?auto_539045 ) ) ( not ( = ?auto_539042 ?auto_539046 ) ) ( not ( = ?auto_539042 ?auto_539047 ) ) ( not ( = ?auto_539042 ?auto_539048 ) ) ( not ( = ?auto_539042 ?auto_539049 ) ) ( not ( = ?auto_539043 ?auto_539044 ) ) ( not ( = ?auto_539043 ?auto_539045 ) ) ( not ( = ?auto_539043 ?auto_539046 ) ) ( not ( = ?auto_539043 ?auto_539047 ) ) ( not ( = ?auto_539043 ?auto_539048 ) ) ( not ( = ?auto_539043 ?auto_539049 ) ) ( not ( = ?auto_539044 ?auto_539045 ) ) ( not ( = ?auto_539044 ?auto_539046 ) ) ( not ( = ?auto_539044 ?auto_539047 ) ) ( not ( = ?auto_539044 ?auto_539048 ) ) ( not ( = ?auto_539044 ?auto_539049 ) ) ( not ( = ?auto_539045 ?auto_539046 ) ) ( not ( = ?auto_539045 ?auto_539047 ) ) ( not ( = ?auto_539045 ?auto_539048 ) ) ( not ( = ?auto_539045 ?auto_539049 ) ) ( not ( = ?auto_539046 ?auto_539047 ) ) ( not ( = ?auto_539046 ?auto_539048 ) ) ( not ( = ?auto_539046 ?auto_539049 ) ) ( not ( = ?auto_539047 ?auto_539048 ) ) ( not ( = ?auto_539047 ?auto_539049 ) ) ( not ( = ?auto_539048 ?auto_539049 ) ) ( ON ?auto_539047 ?auto_539048 ) ( ON ?auto_539046 ?auto_539047 ) ( ON ?auto_539045 ?auto_539046 ) ( ON ?auto_539044 ?auto_539045 ) ( ON ?auto_539043 ?auto_539044 ) ( ON ?auto_539042 ?auto_539043 ) ( ON ?auto_539041 ?auto_539042 ) ( ON ?auto_539040 ?auto_539041 ) ( ON ?auto_539039 ?auto_539040 ) ( ON ?auto_539038 ?auto_539039 ) ( ON ?auto_539037 ?auto_539038 ) ( ON ?auto_539036 ?auto_539037 ) ( CLEAR ?auto_539034 ) ( ON ?auto_539035 ?auto_539036 ) ( CLEAR ?auto_539035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_539034 ?auto_539035 )
      ( MAKE-15PILE ?auto_539034 ?auto_539035 ?auto_539036 ?auto_539037 ?auto_539038 ?auto_539039 ?auto_539040 ?auto_539041 ?auto_539042 ?auto_539043 ?auto_539044 ?auto_539045 ?auto_539046 ?auto_539047 ?auto_539048 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_539096 - BLOCK
      ?auto_539097 - BLOCK
      ?auto_539098 - BLOCK
      ?auto_539099 - BLOCK
      ?auto_539100 - BLOCK
      ?auto_539101 - BLOCK
      ?auto_539102 - BLOCK
      ?auto_539103 - BLOCK
      ?auto_539104 - BLOCK
      ?auto_539105 - BLOCK
      ?auto_539106 - BLOCK
      ?auto_539107 - BLOCK
      ?auto_539108 - BLOCK
      ?auto_539109 - BLOCK
      ?auto_539110 - BLOCK
    )
    :vars
    (
      ?auto_539111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539110 ?auto_539111 ) ( not ( = ?auto_539096 ?auto_539097 ) ) ( not ( = ?auto_539096 ?auto_539098 ) ) ( not ( = ?auto_539096 ?auto_539099 ) ) ( not ( = ?auto_539096 ?auto_539100 ) ) ( not ( = ?auto_539096 ?auto_539101 ) ) ( not ( = ?auto_539096 ?auto_539102 ) ) ( not ( = ?auto_539096 ?auto_539103 ) ) ( not ( = ?auto_539096 ?auto_539104 ) ) ( not ( = ?auto_539096 ?auto_539105 ) ) ( not ( = ?auto_539096 ?auto_539106 ) ) ( not ( = ?auto_539096 ?auto_539107 ) ) ( not ( = ?auto_539096 ?auto_539108 ) ) ( not ( = ?auto_539096 ?auto_539109 ) ) ( not ( = ?auto_539096 ?auto_539110 ) ) ( not ( = ?auto_539096 ?auto_539111 ) ) ( not ( = ?auto_539097 ?auto_539098 ) ) ( not ( = ?auto_539097 ?auto_539099 ) ) ( not ( = ?auto_539097 ?auto_539100 ) ) ( not ( = ?auto_539097 ?auto_539101 ) ) ( not ( = ?auto_539097 ?auto_539102 ) ) ( not ( = ?auto_539097 ?auto_539103 ) ) ( not ( = ?auto_539097 ?auto_539104 ) ) ( not ( = ?auto_539097 ?auto_539105 ) ) ( not ( = ?auto_539097 ?auto_539106 ) ) ( not ( = ?auto_539097 ?auto_539107 ) ) ( not ( = ?auto_539097 ?auto_539108 ) ) ( not ( = ?auto_539097 ?auto_539109 ) ) ( not ( = ?auto_539097 ?auto_539110 ) ) ( not ( = ?auto_539097 ?auto_539111 ) ) ( not ( = ?auto_539098 ?auto_539099 ) ) ( not ( = ?auto_539098 ?auto_539100 ) ) ( not ( = ?auto_539098 ?auto_539101 ) ) ( not ( = ?auto_539098 ?auto_539102 ) ) ( not ( = ?auto_539098 ?auto_539103 ) ) ( not ( = ?auto_539098 ?auto_539104 ) ) ( not ( = ?auto_539098 ?auto_539105 ) ) ( not ( = ?auto_539098 ?auto_539106 ) ) ( not ( = ?auto_539098 ?auto_539107 ) ) ( not ( = ?auto_539098 ?auto_539108 ) ) ( not ( = ?auto_539098 ?auto_539109 ) ) ( not ( = ?auto_539098 ?auto_539110 ) ) ( not ( = ?auto_539098 ?auto_539111 ) ) ( not ( = ?auto_539099 ?auto_539100 ) ) ( not ( = ?auto_539099 ?auto_539101 ) ) ( not ( = ?auto_539099 ?auto_539102 ) ) ( not ( = ?auto_539099 ?auto_539103 ) ) ( not ( = ?auto_539099 ?auto_539104 ) ) ( not ( = ?auto_539099 ?auto_539105 ) ) ( not ( = ?auto_539099 ?auto_539106 ) ) ( not ( = ?auto_539099 ?auto_539107 ) ) ( not ( = ?auto_539099 ?auto_539108 ) ) ( not ( = ?auto_539099 ?auto_539109 ) ) ( not ( = ?auto_539099 ?auto_539110 ) ) ( not ( = ?auto_539099 ?auto_539111 ) ) ( not ( = ?auto_539100 ?auto_539101 ) ) ( not ( = ?auto_539100 ?auto_539102 ) ) ( not ( = ?auto_539100 ?auto_539103 ) ) ( not ( = ?auto_539100 ?auto_539104 ) ) ( not ( = ?auto_539100 ?auto_539105 ) ) ( not ( = ?auto_539100 ?auto_539106 ) ) ( not ( = ?auto_539100 ?auto_539107 ) ) ( not ( = ?auto_539100 ?auto_539108 ) ) ( not ( = ?auto_539100 ?auto_539109 ) ) ( not ( = ?auto_539100 ?auto_539110 ) ) ( not ( = ?auto_539100 ?auto_539111 ) ) ( not ( = ?auto_539101 ?auto_539102 ) ) ( not ( = ?auto_539101 ?auto_539103 ) ) ( not ( = ?auto_539101 ?auto_539104 ) ) ( not ( = ?auto_539101 ?auto_539105 ) ) ( not ( = ?auto_539101 ?auto_539106 ) ) ( not ( = ?auto_539101 ?auto_539107 ) ) ( not ( = ?auto_539101 ?auto_539108 ) ) ( not ( = ?auto_539101 ?auto_539109 ) ) ( not ( = ?auto_539101 ?auto_539110 ) ) ( not ( = ?auto_539101 ?auto_539111 ) ) ( not ( = ?auto_539102 ?auto_539103 ) ) ( not ( = ?auto_539102 ?auto_539104 ) ) ( not ( = ?auto_539102 ?auto_539105 ) ) ( not ( = ?auto_539102 ?auto_539106 ) ) ( not ( = ?auto_539102 ?auto_539107 ) ) ( not ( = ?auto_539102 ?auto_539108 ) ) ( not ( = ?auto_539102 ?auto_539109 ) ) ( not ( = ?auto_539102 ?auto_539110 ) ) ( not ( = ?auto_539102 ?auto_539111 ) ) ( not ( = ?auto_539103 ?auto_539104 ) ) ( not ( = ?auto_539103 ?auto_539105 ) ) ( not ( = ?auto_539103 ?auto_539106 ) ) ( not ( = ?auto_539103 ?auto_539107 ) ) ( not ( = ?auto_539103 ?auto_539108 ) ) ( not ( = ?auto_539103 ?auto_539109 ) ) ( not ( = ?auto_539103 ?auto_539110 ) ) ( not ( = ?auto_539103 ?auto_539111 ) ) ( not ( = ?auto_539104 ?auto_539105 ) ) ( not ( = ?auto_539104 ?auto_539106 ) ) ( not ( = ?auto_539104 ?auto_539107 ) ) ( not ( = ?auto_539104 ?auto_539108 ) ) ( not ( = ?auto_539104 ?auto_539109 ) ) ( not ( = ?auto_539104 ?auto_539110 ) ) ( not ( = ?auto_539104 ?auto_539111 ) ) ( not ( = ?auto_539105 ?auto_539106 ) ) ( not ( = ?auto_539105 ?auto_539107 ) ) ( not ( = ?auto_539105 ?auto_539108 ) ) ( not ( = ?auto_539105 ?auto_539109 ) ) ( not ( = ?auto_539105 ?auto_539110 ) ) ( not ( = ?auto_539105 ?auto_539111 ) ) ( not ( = ?auto_539106 ?auto_539107 ) ) ( not ( = ?auto_539106 ?auto_539108 ) ) ( not ( = ?auto_539106 ?auto_539109 ) ) ( not ( = ?auto_539106 ?auto_539110 ) ) ( not ( = ?auto_539106 ?auto_539111 ) ) ( not ( = ?auto_539107 ?auto_539108 ) ) ( not ( = ?auto_539107 ?auto_539109 ) ) ( not ( = ?auto_539107 ?auto_539110 ) ) ( not ( = ?auto_539107 ?auto_539111 ) ) ( not ( = ?auto_539108 ?auto_539109 ) ) ( not ( = ?auto_539108 ?auto_539110 ) ) ( not ( = ?auto_539108 ?auto_539111 ) ) ( not ( = ?auto_539109 ?auto_539110 ) ) ( not ( = ?auto_539109 ?auto_539111 ) ) ( not ( = ?auto_539110 ?auto_539111 ) ) ( ON ?auto_539109 ?auto_539110 ) ( ON ?auto_539108 ?auto_539109 ) ( ON ?auto_539107 ?auto_539108 ) ( ON ?auto_539106 ?auto_539107 ) ( ON ?auto_539105 ?auto_539106 ) ( ON ?auto_539104 ?auto_539105 ) ( ON ?auto_539103 ?auto_539104 ) ( ON ?auto_539102 ?auto_539103 ) ( ON ?auto_539101 ?auto_539102 ) ( ON ?auto_539100 ?auto_539101 ) ( ON ?auto_539099 ?auto_539100 ) ( ON ?auto_539098 ?auto_539099 ) ( ON ?auto_539097 ?auto_539098 ) ( ON ?auto_539096 ?auto_539097 ) ( CLEAR ?auto_539096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_539096 )
      ( MAKE-15PILE ?auto_539096 ?auto_539097 ?auto_539098 ?auto_539099 ?auto_539100 ?auto_539101 ?auto_539102 ?auto_539103 ?auto_539104 ?auto_539105 ?auto_539106 ?auto_539107 ?auto_539108 ?auto_539109 ?auto_539110 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539159 - BLOCK
      ?auto_539160 - BLOCK
      ?auto_539161 - BLOCK
      ?auto_539162 - BLOCK
      ?auto_539163 - BLOCK
      ?auto_539164 - BLOCK
      ?auto_539165 - BLOCK
      ?auto_539166 - BLOCK
      ?auto_539167 - BLOCK
      ?auto_539168 - BLOCK
      ?auto_539169 - BLOCK
      ?auto_539170 - BLOCK
      ?auto_539171 - BLOCK
      ?auto_539172 - BLOCK
      ?auto_539173 - BLOCK
      ?auto_539174 - BLOCK
    )
    :vars
    (
      ?auto_539175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_539173 ) ( ON ?auto_539174 ?auto_539175 ) ( CLEAR ?auto_539174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_539159 ) ( ON ?auto_539160 ?auto_539159 ) ( ON ?auto_539161 ?auto_539160 ) ( ON ?auto_539162 ?auto_539161 ) ( ON ?auto_539163 ?auto_539162 ) ( ON ?auto_539164 ?auto_539163 ) ( ON ?auto_539165 ?auto_539164 ) ( ON ?auto_539166 ?auto_539165 ) ( ON ?auto_539167 ?auto_539166 ) ( ON ?auto_539168 ?auto_539167 ) ( ON ?auto_539169 ?auto_539168 ) ( ON ?auto_539170 ?auto_539169 ) ( ON ?auto_539171 ?auto_539170 ) ( ON ?auto_539172 ?auto_539171 ) ( ON ?auto_539173 ?auto_539172 ) ( not ( = ?auto_539159 ?auto_539160 ) ) ( not ( = ?auto_539159 ?auto_539161 ) ) ( not ( = ?auto_539159 ?auto_539162 ) ) ( not ( = ?auto_539159 ?auto_539163 ) ) ( not ( = ?auto_539159 ?auto_539164 ) ) ( not ( = ?auto_539159 ?auto_539165 ) ) ( not ( = ?auto_539159 ?auto_539166 ) ) ( not ( = ?auto_539159 ?auto_539167 ) ) ( not ( = ?auto_539159 ?auto_539168 ) ) ( not ( = ?auto_539159 ?auto_539169 ) ) ( not ( = ?auto_539159 ?auto_539170 ) ) ( not ( = ?auto_539159 ?auto_539171 ) ) ( not ( = ?auto_539159 ?auto_539172 ) ) ( not ( = ?auto_539159 ?auto_539173 ) ) ( not ( = ?auto_539159 ?auto_539174 ) ) ( not ( = ?auto_539159 ?auto_539175 ) ) ( not ( = ?auto_539160 ?auto_539161 ) ) ( not ( = ?auto_539160 ?auto_539162 ) ) ( not ( = ?auto_539160 ?auto_539163 ) ) ( not ( = ?auto_539160 ?auto_539164 ) ) ( not ( = ?auto_539160 ?auto_539165 ) ) ( not ( = ?auto_539160 ?auto_539166 ) ) ( not ( = ?auto_539160 ?auto_539167 ) ) ( not ( = ?auto_539160 ?auto_539168 ) ) ( not ( = ?auto_539160 ?auto_539169 ) ) ( not ( = ?auto_539160 ?auto_539170 ) ) ( not ( = ?auto_539160 ?auto_539171 ) ) ( not ( = ?auto_539160 ?auto_539172 ) ) ( not ( = ?auto_539160 ?auto_539173 ) ) ( not ( = ?auto_539160 ?auto_539174 ) ) ( not ( = ?auto_539160 ?auto_539175 ) ) ( not ( = ?auto_539161 ?auto_539162 ) ) ( not ( = ?auto_539161 ?auto_539163 ) ) ( not ( = ?auto_539161 ?auto_539164 ) ) ( not ( = ?auto_539161 ?auto_539165 ) ) ( not ( = ?auto_539161 ?auto_539166 ) ) ( not ( = ?auto_539161 ?auto_539167 ) ) ( not ( = ?auto_539161 ?auto_539168 ) ) ( not ( = ?auto_539161 ?auto_539169 ) ) ( not ( = ?auto_539161 ?auto_539170 ) ) ( not ( = ?auto_539161 ?auto_539171 ) ) ( not ( = ?auto_539161 ?auto_539172 ) ) ( not ( = ?auto_539161 ?auto_539173 ) ) ( not ( = ?auto_539161 ?auto_539174 ) ) ( not ( = ?auto_539161 ?auto_539175 ) ) ( not ( = ?auto_539162 ?auto_539163 ) ) ( not ( = ?auto_539162 ?auto_539164 ) ) ( not ( = ?auto_539162 ?auto_539165 ) ) ( not ( = ?auto_539162 ?auto_539166 ) ) ( not ( = ?auto_539162 ?auto_539167 ) ) ( not ( = ?auto_539162 ?auto_539168 ) ) ( not ( = ?auto_539162 ?auto_539169 ) ) ( not ( = ?auto_539162 ?auto_539170 ) ) ( not ( = ?auto_539162 ?auto_539171 ) ) ( not ( = ?auto_539162 ?auto_539172 ) ) ( not ( = ?auto_539162 ?auto_539173 ) ) ( not ( = ?auto_539162 ?auto_539174 ) ) ( not ( = ?auto_539162 ?auto_539175 ) ) ( not ( = ?auto_539163 ?auto_539164 ) ) ( not ( = ?auto_539163 ?auto_539165 ) ) ( not ( = ?auto_539163 ?auto_539166 ) ) ( not ( = ?auto_539163 ?auto_539167 ) ) ( not ( = ?auto_539163 ?auto_539168 ) ) ( not ( = ?auto_539163 ?auto_539169 ) ) ( not ( = ?auto_539163 ?auto_539170 ) ) ( not ( = ?auto_539163 ?auto_539171 ) ) ( not ( = ?auto_539163 ?auto_539172 ) ) ( not ( = ?auto_539163 ?auto_539173 ) ) ( not ( = ?auto_539163 ?auto_539174 ) ) ( not ( = ?auto_539163 ?auto_539175 ) ) ( not ( = ?auto_539164 ?auto_539165 ) ) ( not ( = ?auto_539164 ?auto_539166 ) ) ( not ( = ?auto_539164 ?auto_539167 ) ) ( not ( = ?auto_539164 ?auto_539168 ) ) ( not ( = ?auto_539164 ?auto_539169 ) ) ( not ( = ?auto_539164 ?auto_539170 ) ) ( not ( = ?auto_539164 ?auto_539171 ) ) ( not ( = ?auto_539164 ?auto_539172 ) ) ( not ( = ?auto_539164 ?auto_539173 ) ) ( not ( = ?auto_539164 ?auto_539174 ) ) ( not ( = ?auto_539164 ?auto_539175 ) ) ( not ( = ?auto_539165 ?auto_539166 ) ) ( not ( = ?auto_539165 ?auto_539167 ) ) ( not ( = ?auto_539165 ?auto_539168 ) ) ( not ( = ?auto_539165 ?auto_539169 ) ) ( not ( = ?auto_539165 ?auto_539170 ) ) ( not ( = ?auto_539165 ?auto_539171 ) ) ( not ( = ?auto_539165 ?auto_539172 ) ) ( not ( = ?auto_539165 ?auto_539173 ) ) ( not ( = ?auto_539165 ?auto_539174 ) ) ( not ( = ?auto_539165 ?auto_539175 ) ) ( not ( = ?auto_539166 ?auto_539167 ) ) ( not ( = ?auto_539166 ?auto_539168 ) ) ( not ( = ?auto_539166 ?auto_539169 ) ) ( not ( = ?auto_539166 ?auto_539170 ) ) ( not ( = ?auto_539166 ?auto_539171 ) ) ( not ( = ?auto_539166 ?auto_539172 ) ) ( not ( = ?auto_539166 ?auto_539173 ) ) ( not ( = ?auto_539166 ?auto_539174 ) ) ( not ( = ?auto_539166 ?auto_539175 ) ) ( not ( = ?auto_539167 ?auto_539168 ) ) ( not ( = ?auto_539167 ?auto_539169 ) ) ( not ( = ?auto_539167 ?auto_539170 ) ) ( not ( = ?auto_539167 ?auto_539171 ) ) ( not ( = ?auto_539167 ?auto_539172 ) ) ( not ( = ?auto_539167 ?auto_539173 ) ) ( not ( = ?auto_539167 ?auto_539174 ) ) ( not ( = ?auto_539167 ?auto_539175 ) ) ( not ( = ?auto_539168 ?auto_539169 ) ) ( not ( = ?auto_539168 ?auto_539170 ) ) ( not ( = ?auto_539168 ?auto_539171 ) ) ( not ( = ?auto_539168 ?auto_539172 ) ) ( not ( = ?auto_539168 ?auto_539173 ) ) ( not ( = ?auto_539168 ?auto_539174 ) ) ( not ( = ?auto_539168 ?auto_539175 ) ) ( not ( = ?auto_539169 ?auto_539170 ) ) ( not ( = ?auto_539169 ?auto_539171 ) ) ( not ( = ?auto_539169 ?auto_539172 ) ) ( not ( = ?auto_539169 ?auto_539173 ) ) ( not ( = ?auto_539169 ?auto_539174 ) ) ( not ( = ?auto_539169 ?auto_539175 ) ) ( not ( = ?auto_539170 ?auto_539171 ) ) ( not ( = ?auto_539170 ?auto_539172 ) ) ( not ( = ?auto_539170 ?auto_539173 ) ) ( not ( = ?auto_539170 ?auto_539174 ) ) ( not ( = ?auto_539170 ?auto_539175 ) ) ( not ( = ?auto_539171 ?auto_539172 ) ) ( not ( = ?auto_539171 ?auto_539173 ) ) ( not ( = ?auto_539171 ?auto_539174 ) ) ( not ( = ?auto_539171 ?auto_539175 ) ) ( not ( = ?auto_539172 ?auto_539173 ) ) ( not ( = ?auto_539172 ?auto_539174 ) ) ( not ( = ?auto_539172 ?auto_539175 ) ) ( not ( = ?auto_539173 ?auto_539174 ) ) ( not ( = ?auto_539173 ?auto_539175 ) ) ( not ( = ?auto_539174 ?auto_539175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_539174 ?auto_539175 )
      ( !STACK ?auto_539174 ?auto_539173 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539192 - BLOCK
      ?auto_539193 - BLOCK
      ?auto_539194 - BLOCK
      ?auto_539195 - BLOCK
      ?auto_539196 - BLOCK
      ?auto_539197 - BLOCK
      ?auto_539198 - BLOCK
      ?auto_539199 - BLOCK
      ?auto_539200 - BLOCK
      ?auto_539201 - BLOCK
      ?auto_539202 - BLOCK
      ?auto_539203 - BLOCK
      ?auto_539204 - BLOCK
      ?auto_539205 - BLOCK
      ?auto_539206 - BLOCK
      ?auto_539207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_539206 ) ( ON-TABLE ?auto_539207 ) ( CLEAR ?auto_539207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_539192 ) ( ON ?auto_539193 ?auto_539192 ) ( ON ?auto_539194 ?auto_539193 ) ( ON ?auto_539195 ?auto_539194 ) ( ON ?auto_539196 ?auto_539195 ) ( ON ?auto_539197 ?auto_539196 ) ( ON ?auto_539198 ?auto_539197 ) ( ON ?auto_539199 ?auto_539198 ) ( ON ?auto_539200 ?auto_539199 ) ( ON ?auto_539201 ?auto_539200 ) ( ON ?auto_539202 ?auto_539201 ) ( ON ?auto_539203 ?auto_539202 ) ( ON ?auto_539204 ?auto_539203 ) ( ON ?auto_539205 ?auto_539204 ) ( ON ?auto_539206 ?auto_539205 ) ( not ( = ?auto_539192 ?auto_539193 ) ) ( not ( = ?auto_539192 ?auto_539194 ) ) ( not ( = ?auto_539192 ?auto_539195 ) ) ( not ( = ?auto_539192 ?auto_539196 ) ) ( not ( = ?auto_539192 ?auto_539197 ) ) ( not ( = ?auto_539192 ?auto_539198 ) ) ( not ( = ?auto_539192 ?auto_539199 ) ) ( not ( = ?auto_539192 ?auto_539200 ) ) ( not ( = ?auto_539192 ?auto_539201 ) ) ( not ( = ?auto_539192 ?auto_539202 ) ) ( not ( = ?auto_539192 ?auto_539203 ) ) ( not ( = ?auto_539192 ?auto_539204 ) ) ( not ( = ?auto_539192 ?auto_539205 ) ) ( not ( = ?auto_539192 ?auto_539206 ) ) ( not ( = ?auto_539192 ?auto_539207 ) ) ( not ( = ?auto_539193 ?auto_539194 ) ) ( not ( = ?auto_539193 ?auto_539195 ) ) ( not ( = ?auto_539193 ?auto_539196 ) ) ( not ( = ?auto_539193 ?auto_539197 ) ) ( not ( = ?auto_539193 ?auto_539198 ) ) ( not ( = ?auto_539193 ?auto_539199 ) ) ( not ( = ?auto_539193 ?auto_539200 ) ) ( not ( = ?auto_539193 ?auto_539201 ) ) ( not ( = ?auto_539193 ?auto_539202 ) ) ( not ( = ?auto_539193 ?auto_539203 ) ) ( not ( = ?auto_539193 ?auto_539204 ) ) ( not ( = ?auto_539193 ?auto_539205 ) ) ( not ( = ?auto_539193 ?auto_539206 ) ) ( not ( = ?auto_539193 ?auto_539207 ) ) ( not ( = ?auto_539194 ?auto_539195 ) ) ( not ( = ?auto_539194 ?auto_539196 ) ) ( not ( = ?auto_539194 ?auto_539197 ) ) ( not ( = ?auto_539194 ?auto_539198 ) ) ( not ( = ?auto_539194 ?auto_539199 ) ) ( not ( = ?auto_539194 ?auto_539200 ) ) ( not ( = ?auto_539194 ?auto_539201 ) ) ( not ( = ?auto_539194 ?auto_539202 ) ) ( not ( = ?auto_539194 ?auto_539203 ) ) ( not ( = ?auto_539194 ?auto_539204 ) ) ( not ( = ?auto_539194 ?auto_539205 ) ) ( not ( = ?auto_539194 ?auto_539206 ) ) ( not ( = ?auto_539194 ?auto_539207 ) ) ( not ( = ?auto_539195 ?auto_539196 ) ) ( not ( = ?auto_539195 ?auto_539197 ) ) ( not ( = ?auto_539195 ?auto_539198 ) ) ( not ( = ?auto_539195 ?auto_539199 ) ) ( not ( = ?auto_539195 ?auto_539200 ) ) ( not ( = ?auto_539195 ?auto_539201 ) ) ( not ( = ?auto_539195 ?auto_539202 ) ) ( not ( = ?auto_539195 ?auto_539203 ) ) ( not ( = ?auto_539195 ?auto_539204 ) ) ( not ( = ?auto_539195 ?auto_539205 ) ) ( not ( = ?auto_539195 ?auto_539206 ) ) ( not ( = ?auto_539195 ?auto_539207 ) ) ( not ( = ?auto_539196 ?auto_539197 ) ) ( not ( = ?auto_539196 ?auto_539198 ) ) ( not ( = ?auto_539196 ?auto_539199 ) ) ( not ( = ?auto_539196 ?auto_539200 ) ) ( not ( = ?auto_539196 ?auto_539201 ) ) ( not ( = ?auto_539196 ?auto_539202 ) ) ( not ( = ?auto_539196 ?auto_539203 ) ) ( not ( = ?auto_539196 ?auto_539204 ) ) ( not ( = ?auto_539196 ?auto_539205 ) ) ( not ( = ?auto_539196 ?auto_539206 ) ) ( not ( = ?auto_539196 ?auto_539207 ) ) ( not ( = ?auto_539197 ?auto_539198 ) ) ( not ( = ?auto_539197 ?auto_539199 ) ) ( not ( = ?auto_539197 ?auto_539200 ) ) ( not ( = ?auto_539197 ?auto_539201 ) ) ( not ( = ?auto_539197 ?auto_539202 ) ) ( not ( = ?auto_539197 ?auto_539203 ) ) ( not ( = ?auto_539197 ?auto_539204 ) ) ( not ( = ?auto_539197 ?auto_539205 ) ) ( not ( = ?auto_539197 ?auto_539206 ) ) ( not ( = ?auto_539197 ?auto_539207 ) ) ( not ( = ?auto_539198 ?auto_539199 ) ) ( not ( = ?auto_539198 ?auto_539200 ) ) ( not ( = ?auto_539198 ?auto_539201 ) ) ( not ( = ?auto_539198 ?auto_539202 ) ) ( not ( = ?auto_539198 ?auto_539203 ) ) ( not ( = ?auto_539198 ?auto_539204 ) ) ( not ( = ?auto_539198 ?auto_539205 ) ) ( not ( = ?auto_539198 ?auto_539206 ) ) ( not ( = ?auto_539198 ?auto_539207 ) ) ( not ( = ?auto_539199 ?auto_539200 ) ) ( not ( = ?auto_539199 ?auto_539201 ) ) ( not ( = ?auto_539199 ?auto_539202 ) ) ( not ( = ?auto_539199 ?auto_539203 ) ) ( not ( = ?auto_539199 ?auto_539204 ) ) ( not ( = ?auto_539199 ?auto_539205 ) ) ( not ( = ?auto_539199 ?auto_539206 ) ) ( not ( = ?auto_539199 ?auto_539207 ) ) ( not ( = ?auto_539200 ?auto_539201 ) ) ( not ( = ?auto_539200 ?auto_539202 ) ) ( not ( = ?auto_539200 ?auto_539203 ) ) ( not ( = ?auto_539200 ?auto_539204 ) ) ( not ( = ?auto_539200 ?auto_539205 ) ) ( not ( = ?auto_539200 ?auto_539206 ) ) ( not ( = ?auto_539200 ?auto_539207 ) ) ( not ( = ?auto_539201 ?auto_539202 ) ) ( not ( = ?auto_539201 ?auto_539203 ) ) ( not ( = ?auto_539201 ?auto_539204 ) ) ( not ( = ?auto_539201 ?auto_539205 ) ) ( not ( = ?auto_539201 ?auto_539206 ) ) ( not ( = ?auto_539201 ?auto_539207 ) ) ( not ( = ?auto_539202 ?auto_539203 ) ) ( not ( = ?auto_539202 ?auto_539204 ) ) ( not ( = ?auto_539202 ?auto_539205 ) ) ( not ( = ?auto_539202 ?auto_539206 ) ) ( not ( = ?auto_539202 ?auto_539207 ) ) ( not ( = ?auto_539203 ?auto_539204 ) ) ( not ( = ?auto_539203 ?auto_539205 ) ) ( not ( = ?auto_539203 ?auto_539206 ) ) ( not ( = ?auto_539203 ?auto_539207 ) ) ( not ( = ?auto_539204 ?auto_539205 ) ) ( not ( = ?auto_539204 ?auto_539206 ) ) ( not ( = ?auto_539204 ?auto_539207 ) ) ( not ( = ?auto_539205 ?auto_539206 ) ) ( not ( = ?auto_539205 ?auto_539207 ) ) ( not ( = ?auto_539206 ?auto_539207 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_539207 )
      ( !STACK ?auto_539207 ?auto_539206 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539224 - BLOCK
      ?auto_539225 - BLOCK
      ?auto_539226 - BLOCK
      ?auto_539227 - BLOCK
      ?auto_539228 - BLOCK
      ?auto_539229 - BLOCK
      ?auto_539230 - BLOCK
      ?auto_539231 - BLOCK
      ?auto_539232 - BLOCK
      ?auto_539233 - BLOCK
      ?auto_539234 - BLOCK
      ?auto_539235 - BLOCK
      ?auto_539236 - BLOCK
      ?auto_539237 - BLOCK
      ?auto_539238 - BLOCK
      ?auto_539239 - BLOCK
    )
    :vars
    (
      ?auto_539240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539239 ?auto_539240 ) ( ON-TABLE ?auto_539224 ) ( ON ?auto_539225 ?auto_539224 ) ( ON ?auto_539226 ?auto_539225 ) ( ON ?auto_539227 ?auto_539226 ) ( ON ?auto_539228 ?auto_539227 ) ( ON ?auto_539229 ?auto_539228 ) ( ON ?auto_539230 ?auto_539229 ) ( ON ?auto_539231 ?auto_539230 ) ( ON ?auto_539232 ?auto_539231 ) ( ON ?auto_539233 ?auto_539232 ) ( ON ?auto_539234 ?auto_539233 ) ( ON ?auto_539235 ?auto_539234 ) ( ON ?auto_539236 ?auto_539235 ) ( ON ?auto_539237 ?auto_539236 ) ( not ( = ?auto_539224 ?auto_539225 ) ) ( not ( = ?auto_539224 ?auto_539226 ) ) ( not ( = ?auto_539224 ?auto_539227 ) ) ( not ( = ?auto_539224 ?auto_539228 ) ) ( not ( = ?auto_539224 ?auto_539229 ) ) ( not ( = ?auto_539224 ?auto_539230 ) ) ( not ( = ?auto_539224 ?auto_539231 ) ) ( not ( = ?auto_539224 ?auto_539232 ) ) ( not ( = ?auto_539224 ?auto_539233 ) ) ( not ( = ?auto_539224 ?auto_539234 ) ) ( not ( = ?auto_539224 ?auto_539235 ) ) ( not ( = ?auto_539224 ?auto_539236 ) ) ( not ( = ?auto_539224 ?auto_539237 ) ) ( not ( = ?auto_539224 ?auto_539238 ) ) ( not ( = ?auto_539224 ?auto_539239 ) ) ( not ( = ?auto_539224 ?auto_539240 ) ) ( not ( = ?auto_539225 ?auto_539226 ) ) ( not ( = ?auto_539225 ?auto_539227 ) ) ( not ( = ?auto_539225 ?auto_539228 ) ) ( not ( = ?auto_539225 ?auto_539229 ) ) ( not ( = ?auto_539225 ?auto_539230 ) ) ( not ( = ?auto_539225 ?auto_539231 ) ) ( not ( = ?auto_539225 ?auto_539232 ) ) ( not ( = ?auto_539225 ?auto_539233 ) ) ( not ( = ?auto_539225 ?auto_539234 ) ) ( not ( = ?auto_539225 ?auto_539235 ) ) ( not ( = ?auto_539225 ?auto_539236 ) ) ( not ( = ?auto_539225 ?auto_539237 ) ) ( not ( = ?auto_539225 ?auto_539238 ) ) ( not ( = ?auto_539225 ?auto_539239 ) ) ( not ( = ?auto_539225 ?auto_539240 ) ) ( not ( = ?auto_539226 ?auto_539227 ) ) ( not ( = ?auto_539226 ?auto_539228 ) ) ( not ( = ?auto_539226 ?auto_539229 ) ) ( not ( = ?auto_539226 ?auto_539230 ) ) ( not ( = ?auto_539226 ?auto_539231 ) ) ( not ( = ?auto_539226 ?auto_539232 ) ) ( not ( = ?auto_539226 ?auto_539233 ) ) ( not ( = ?auto_539226 ?auto_539234 ) ) ( not ( = ?auto_539226 ?auto_539235 ) ) ( not ( = ?auto_539226 ?auto_539236 ) ) ( not ( = ?auto_539226 ?auto_539237 ) ) ( not ( = ?auto_539226 ?auto_539238 ) ) ( not ( = ?auto_539226 ?auto_539239 ) ) ( not ( = ?auto_539226 ?auto_539240 ) ) ( not ( = ?auto_539227 ?auto_539228 ) ) ( not ( = ?auto_539227 ?auto_539229 ) ) ( not ( = ?auto_539227 ?auto_539230 ) ) ( not ( = ?auto_539227 ?auto_539231 ) ) ( not ( = ?auto_539227 ?auto_539232 ) ) ( not ( = ?auto_539227 ?auto_539233 ) ) ( not ( = ?auto_539227 ?auto_539234 ) ) ( not ( = ?auto_539227 ?auto_539235 ) ) ( not ( = ?auto_539227 ?auto_539236 ) ) ( not ( = ?auto_539227 ?auto_539237 ) ) ( not ( = ?auto_539227 ?auto_539238 ) ) ( not ( = ?auto_539227 ?auto_539239 ) ) ( not ( = ?auto_539227 ?auto_539240 ) ) ( not ( = ?auto_539228 ?auto_539229 ) ) ( not ( = ?auto_539228 ?auto_539230 ) ) ( not ( = ?auto_539228 ?auto_539231 ) ) ( not ( = ?auto_539228 ?auto_539232 ) ) ( not ( = ?auto_539228 ?auto_539233 ) ) ( not ( = ?auto_539228 ?auto_539234 ) ) ( not ( = ?auto_539228 ?auto_539235 ) ) ( not ( = ?auto_539228 ?auto_539236 ) ) ( not ( = ?auto_539228 ?auto_539237 ) ) ( not ( = ?auto_539228 ?auto_539238 ) ) ( not ( = ?auto_539228 ?auto_539239 ) ) ( not ( = ?auto_539228 ?auto_539240 ) ) ( not ( = ?auto_539229 ?auto_539230 ) ) ( not ( = ?auto_539229 ?auto_539231 ) ) ( not ( = ?auto_539229 ?auto_539232 ) ) ( not ( = ?auto_539229 ?auto_539233 ) ) ( not ( = ?auto_539229 ?auto_539234 ) ) ( not ( = ?auto_539229 ?auto_539235 ) ) ( not ( = ?auto_539229 ?auto_539236 ) ) ( not ( = ?auto_539229 ?auto_539237 ) ) ( not ( = ?auto_539229 ?auto_539238 ) ) ( not ( = ?auto_539229 ?auto_539239 ) ) ( not ( = ?auto_539229 ?auto_539240 ) ) ( not ( = ?auto_539230 ?auto_539231 ) ) ( not ( = ?auto_539230 ?auto_539232 ) ) ( not ( = ?auto_539230 ?auto_539233 ) ) ( not ( = ?auto_539230 ?auto_539234 ) ) ( not ( = ?auto_539230 ?auto_539235 ) ) ( not ( = ?auto_539230 ?auto_539236 ) ) ( not ( = ?auto_539230 ?auto_539237 ) ) ( not ( = ?auto_539230 ?auto_539238 ) ) ( not ( = ?auto_539230 ?auto_539239 ) ) ( not ( = ?auto_539230 ?auto_539240 ) ) ( not ( = ?auto_539231 ?auto_539232 ) ) ( not ( = ?auto_539231 ?auto_539233 ) ) ( not ( = ?auto_539231 ?auto_539234 ) ) ( not ( = ?auto_539231 ?auto_539235 ) ) ( not ( = ?auto_539231 ?auto_539236 ) ) ( not ( = ?auto_539231 ?auto_539237 ) ) ( not ( = ?auto_539231 ?auto_539238 ) ) ( not ( = ?auto_539231 ?auto_539239 ) ) ( not ( = ?auto_539231 ?auto_539240 ) ) ( not ( = ?auto_539232 ?auto_539233 ) ) ( not ( = ?auto_539232 ?auto_539234 ) ) ( not ( = ?auto_539232 ?auto_539235 ) ) ( not ( = ?auto_539232 ?auto_539236 ) ) ( not ( = ?auto_539232 ?auto_539237 ) ) ( not ( = ?auto_539232 ?auto_539238 ) ) ( not ( = ?auto_539232 ?auto_539239 ) ) ( not ( = ?auto_539232 ?auto_539240 ) ) ( not ( = ?auto_539233 ?auto_539234 ) ) ( not ( = ?auto_539233 ?auto_539235 ) ) ( not ( = ?auto_539233 ?auto_539236 ) ) ( not ( = ?auto_539233 ?auto_539237 ) ) ( not ( = ?auto_539233 ?auto_539238 ) ) ( not ( = ?auto_539233 ?auto_539239 ) ) ( not ( = ?auto_539233 ?auto_539240 ) ) ( not ( = ?auto_539234 ?auto_539235 ) ) ( not ( = ?auto_539234 ?auto_539236 ) ) ( not ( = ?auto_539234 ?auto_539237 ) ) ( not ( = ?auto_539234 ?auto_539238 ) ) ( not ( = ?auto_539234 ?auto_539239 ) ) ( not ( = ?auto_539234 ?auto_539240 ) ) ( not ( = ?auto_539235 ?auto_539236 ) ) ( not ( = ?auto_539235 ?auto_539237 ) ) ( not ( = ?auto_539235 ?auto_539238 ) ) ( not ( = ?auto_539235 ?auto_539239 ) ) ( not ( = ?auto_539235 ?auto_539240 ) ) ( not ( = ?auto_539236 ?auto_539237 ) ) ( not ( = ?auto_539236 ?auto_539238 ) ) ( not ( = ?auto_539236 ?auto_539239 ) ) ( not ( = ?auto_539236 ?auto_539240 ) ) ( not ( = ?auto_539237 ?auto_539238 ) ) ( not ( = ?auto_539237 ?auto_539239 ) ) ( not ( = ?auto_539237 ?auto_539240 ) ) ( not ( = ?auto_539238 ?auto_539239 ) ) ( not ( = ?auto_539238 ?auto_539240 ) ) ( not ( = ?auto_539239 ?auto_539240 ) ) ( CLEAR ?auto_539237 ) ( ON ?auto_539238 ?auto_539239 ) ( CLEAR ?auto_539238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_539224 ?auto_539225 ?auto_539226 ?auto_539227 ?auto_539228 ?auto_539229 ?auto_539230 ?auto_539231 ?auto_539232 ?auto_539233 ?auto_539234 ?auto_539235 ?auto_539236 ?auto_539237 ?auto_539238 )
      ( MAKE-16PILE ?auto_539224 ?auto_539225 ?auto_539226 ?auto_539227 ?auto_539228 ?auto_539229 ?auto_539230 ?auto_539231 ?auto_539232 ?auto_539233 ?auto_539234 ?auto_539235 ?auto_539236 ?auto_539237 ?auto_539238 ?auto_539239 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539257 - BLOCK
      ?auto_539258 - BLOCK
      ?auto_539259 - BLOCK
      ?auto_539260 - BLOCK
      ?auto_539261 - BLOCK
      ?auto_539262 - BLOCK
      ?auto_539263 - BLOCK
      ?auto_539264 - BLOCK
      ?auto_539265 - BLOCK
      ?auto_539266 - BLOCK
      ?auto_539267 - BLOCK
      ?auto_539268 - BLOCK
      ?auto_539269 - BLOCK
      ?auto_539270 - BLOCK
      ?auto_539271 - BLOCK
      ?auto_539272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539272 ) ( ON-TABLE ?auto_539257 ) ( ON ?auto_539258 ?auto_539257 ) ( ON ?auto_539259 ?auto_539258 ) ( ON ?auto_539260 ?auto_539259 ) ( ON ?auto_539261 ?auto_539260 ) ( ON ?auto_539262 ?auto_539261 ) ( ON ?auto_539263 ?auto_539262 ) ( ON ?auto_539264 ?auto_539263 ) ( ON ?auto_539265 ?auto_539264 ) ( ON ?auto_539266 ?auto_539265 ) ( ON ?auto_539267 ?auto_539266 ) ( ON ?auto_539268 ?auto_539267 ) ( ON ?auto_539269 ?auto_539268 ) ( ON ?auto_539270 ?auto_539269 ) ( not ( = ?auto_539257 ?auto_539258 ) ) ( not ( = ?auto_539257 ?auto_539259 ) ) ( not ( = ?auto_539257 ?auto_539260 ) ) ( not ( = ?auto_539257 ?auto_539261 ) ) ( not ( = ?auto_539257 ?auto_539262 ) ) ( not ( = ?auto_539257 ?auto_539263 ) ) ( not ( = ?auto_539257 ?auto_539264 ) ) ( not ( = ?auto_539257 ?auto_539265 ) ) ( not ( = ?auto_539257 ?auto_539266 ) ) ( not ( = ?auto_539257 ?auto_539267 ) ) ( not ( = ?auto_539257 ?auto_539268 ) ) ( not ( = ?auto_539257 ?auto_539269 ) ) ( not ( = ?auto_539257 ?auto_539270 ) ) ( not ( = ?auto_539257 ?auto_539271 ) ) ( not ( = ?auto_539257 ?auto_539272 ) ) ( not ( = ?auto_539258 ?auto_539259 ) ) ( not ( = ?auto_539258 ?auto_539260 ) ) ( not ( = ?auto_539258 ?auto_539261 ) ) ( not ( = ?auto_539258 ?auto_539262 ) ) ( not ( = ?auto_539258 ?auto_539263 ) ) ( not ( = ?auto_539258 ?auto_539264 ) ) ( not ( = ?auto_539258 ?auto_539265 ) ) ( not ( = ?auto_539258 ?auto_539266 ) ) ( not ( = ?auto_539258 ?auto_539267 ) ) ( not ( = ?auto_539258 ?auto_539268 ) ) ( not ( = ?auto_539258 ?auto_539269 ) ) ( not ( = ?auto_539258 ?auto_539270 ) ) ( not ( = ?auto_539258 ?auto_539271 ) ) ( not ( = ?auto_539258 ?auto_539272 ) ) ( not ( = ?auto_539259 ?auto_539260 ) ) ( not ( = ?auto_539259 ?auto_539261 ) ) ( not ( = ?auto_539259 ?auto_539262 ) ) ( not ( = ?auto_539259 ?auto_539263 ) ) ( not ( = ?auto_539259 ?auto_539264 ) ) ( not ( = ?auto_539259 ?auto_539265 ) ) ( not ( = ?auto_539259 ?auto_539266 ) ) ( not ( = ?auto_539259 ?auto_539267 ) ) ( not ( = ?auto_539259 ?auto_539268 ) ) ( not ( = ?auto_539259 ?auto_539269 ) ) ( not ( = ?auto_539259 ?auto_539270 ) ) ( not ( = ?auto_539259 ?auto_539271 ) ) ( not ( = ?auto_539259 ?auto_539272 ) ) ( not ( = ?auto_539260 ?auto_539261 ) ) ( not ( = ?auto_539260 ?auto_539262 ) ) ( not ( = ?auto_539260 ?auto_539263 ) ) ( not ( = ?auto_539260 ?auto_539264 ) ) ( not ( = ?auto_539260 ?auto_539265 ) ) ( not ( = ?auto_539260 ?auto_539266 ) ) ( not ( = ?auto_539260 ?auto_539267 ) ) ( not ( = ?auto_539260 ?auto_539268 ) ) ( not ( = ?auto_539260 ?auto_539269 ) ) ( not ( = ?auto_539260 ?auto_539270 ) ) ( not ( = ?auto_539260 ?auto_539271 ) ) ( not ( = ?auto_539260 ?auto_539272 ) ) ( not ( = ?auto_539261 ?auto_539262 ) ) ( not ( = ?auto_539261 ?auto_539263 ) ) ( not ( = ?auto_539261 ?auto_539264 ) ) ( not ( = ?auto_539261 ?auto_539265 ) ) ( not ( = ?auto_539261 ?auto_539266 ) ) ( not ( = ?auto_539261 ?auto_539267 ) ) ( not ( = ?auto_539261 ?auto_539268 ) ) ( not ( = ?auto_539261 ?auto_539269 ) ) ( not ( = ?auto_539261 ?auto_539270 ) ) ( not ( = ?auto_539261 ?auto_539271 ) ) ( not ( = ?auto_539261 ?auto_539272 ) ) ( not ( = ?auto_539262 ?auto_539263 ) ) ( not ( = ?auto_539262 ?auto_539264 ) ) ( not ( = ?auto_539262 ?auto_539265 ) ) ( not ( = ?auto_539262 ?auto_539266 ) ) ( not ( = ?auto_539262 ?auto_539267 ) ) ( not ( = ?auto_539262 ?auto_539268 ) ) ( not ( = ?auto_539262 ?auto_539269 ) ) ( not ( = ?auto_539262 ?auto_539270 ) ) ( not ( = ?auto_539262 ?auto_539271 ) ) ( not ( = ?auto_539262 ?auto_539272 ) ) ( not ( = ?auto_539263 ?auto_539264 ) ) ( not ( = ?auto_539263 ?auto_539265 ) ) ( not ( = ?auto_539263 ?auto_539266 ) ) ( not ( = ?auto_539263 ?auto_539267 ) ) ( not ( = ?auto_539263 ?auto_539268 ) ) ( not ( = ?auto_539263 ?auto_539269 ) ) ( not ( = ?auto_539263 ?auto_539270 ) ) ( not ( = ?auto_539263 ?auto_539271 ) ) ( not ( = ?auto_539263 ?auto_539272 ) ) ( not ( = ?auto_539264 ?auto_539265 ) ) ( not ( = ?auto_539264 ?auto_539266 ) ) ( not ( = ?auto_539264 ?auto_539267 ) ) ( not ( = ?auto_539264 ?auto_539268 ) ) ( not ( = ?auto_539264 ?auto_539269 ) ) ( not ( = ?auto_539264 ?auto_539270 ) ) ( not ( = ?auto_539264 ?auto_539271 ) ) ( not ( = ?auto_539264 ?auto_539272 ) ) ( not ( = ?auto_539265 ?auto_539266 ) ) ( not ( = ?auto_539265 ?auto_539267 ) ) ( not ( = ?auto_539265 ?auto_539268 ) ) ( not ( = ?auto_539265 ?auto_539269 ) ) ( not ( = ?auto_539265 ?auto_539270 ) ) ( not ( = ?auto_539265 ?auto_539271 ) ) ( not ( = ?auto_539265 ?auto_539272 ) ) ( not ( = ?auto_539266 ?auto_539267 ) ) ( not ( = ?auto_539266 ?auto_539268 ) ) ( not ( = ?auto_539266 ?auto_539269 ) ) ( not ( = ?auto_539266 ?auto_539270 ) ) ( not ( = ?auto_539266 ?auto_539271 ) ) ( not ( = ?auto_539266 ?auto_539272 ) ) ( not ( = ?auto_539267 ?auto_539268 ) ) ( not ( = ?auto_539267 ?auto_539269 ) ) ( not ( = ?auto_539267 ?auto_539270 ) ) ( not ( = ?auto_539267 ?auto_539271 ) ) ( not ( = ?auto_539267 ?auto_539272 ) ) ( not ( = ?auto_539268 ?auto_539269 ) ) ( not ( = ?auto_539268 ?auto_539270 ) ) ( not ( = ?auto_539268 ?auto_539271 ) ) ( not ( = ?auto_539268 ?auto_539272 ) ) ( not ( = ?auto_539269 ?auto_539270 ) ) ( not ( = ?auto_539269 ?auto_539271 ) ) ( not ( = ?auto_539269 ?auto_539272 ) ) ( not ( = ?auto_539270 ?auto_539271 ) ) ( not ( = ?auto_539270 ?auto_539272 ) ) ( not ( = ?auto_539271 ?auto_539272 ) ) ( CLEAR ?auto_539270 ) ( ON ?auto_539271 ?auto_539272 ) ( CLEAR ?auto_539271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_539257 ?auto_539258 ?auto_539259 ?auto_539260 ?auto_539261 ?auto_539262 ?auto_539263 ?auto_539264 ?auto_539265 ?auto_539266 ?auto_539267 ?auto_539268 ?auto_539269 ?auto_539270 ?auto_539271 )
      ( MAKE-16PILE ?auto_539257 ?auto_539258 ?auto_539259 ?auto_539260 ?auto_539261 ?auto_539262 ?auto_539263 ?auto_539264 ?auto_539265 ?auto_539266 ?auto_539267 ?auto_539268 ?auto_539269 ?auto_539270 ?auto_539271 ?auto_539272 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539289 - BLOCK
      ?auto_539290 - BLOCK
      ?auto_539291 - BLOCK
      ?auto_539292 - BLOCK
      ?auto_539293 - BLOCK
      ?auto_539294 - BLOCK
      ?auto_539295 - BLOCK
      ?auto_539296 - BLOCK
      ?auto_539297 - BLOCK
      ?auto_539298 - BLOCK
      ?auto_539299 - BLOCK
      ?auto_539300 - BLOCK
      ?auto_539301 - BLOCK
      ?auto_539302 - BLOCK
      ?auto_539303 - BLOCK
      ?auto_539304 - BLOCK
    )
    :vars
    (
      ?auto_539305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539304 ?auto_539305 ) ( ON-TABLE ?auto_539289 ) ( ON ?auto_539290 ?auto_539289 ) ( ON ?auto_539291 ?auto_539290 ) ( ON ?auto_539292 ?auto_539291 ) ( ON ?auto_539293 ?auto_539292 ) ( ON ?auto_539294 ?auto_539293 ) ( ON ?auto_539295 ?auto_539294 ) ( ON ?auto_539296 ?auto_539295 ) ( ON ?auto_539297 ?auto_539296 ) ( ON ?auto_539298 ?auto_539297 ) ( ON ?auto_539299 ?auto_539298 ) ( ON ?auto_539300 ?auto_539299 ) ( ON ?auto_539301 ?auto_539300 ) ( not ( = ?auto_539289 ?auto_539290 ) ) ( not ( = ?auto_539289 ?auto_539291 ) ) ( not ( = ?auto_539289 ?auto_539292 ) ) ( not ( = ?auto_539289 ?auto_539293 ) ) ( not ( = ?auto_539289 ?auto_539294 ) ) ( not ( = ?auto_539289 ?auto_539295 ) ) ( not ( = ?auto_539289 ?auto_539296 ) ) ( not ( = ?auto_539289 ?auto_539297 ) ) ( not ( = ?auto_539289 ?auto_539298 ) ) ( not ( = ?auto_539289 ?auto_539299 ) ) ( not ( = ?auto_539289 ?auto_539300 ) ) ( not ( = ?auto_539289 ?auto_539301 ) ) ( not ( = ?auto_539289 ?auto_539302 ) ) ( not ( = ?auto_539289 ?auto_539303 ) ) ( not ( = ?auto_539289 ?auto_539304 ) ) ( not ( = ?auto_539289 ?auto_539305 ) ) ( not ( = ?auto_539290 ?auto_539291 ) ) ( not ( = ?auto_539290 ?auto_539292 ) ) ( not ( = ?auto_539290 ?auto_539293 ) ) ( not ( = ?auto_539290 ?auto_539294 ) ) ( not ( = ?auto_539290 ?auto_539295 ) ) ( not ( = ?auto_539290 ?auto_539296 ) ) ( not ( = ?auto_539290 ?auto_539297 ) ) ( not ( = ?auto_539290 ?auto_539298 ) ) ( not ( = ?auto_539290 ?auto_539299 ) ) ( not ( = ?auto_539290 ?auto_539300 ) ) ( not ( = ?auto_539290 ?auto_539301 ) ) ( not ( = ?auto_539290 ?auto_539302 ) ) ( not ( = ?auto_539290 ?auto_539303 ) ) ( not ( = ?auto_539290 ?auto_539304 ) ) ( not ( = ?auto_539290 ?auto_539305 ) ) ( not ( = ?auto_539291 ?auto_539292 ) ) ( not ( = ?auto_539291 ?auto_539293 ) ) ( not ( = ?auto_539291 ?auto_539294 ) ) ( not ( = ?auto_539291 ?auto_539295 ) ) ( not ( = ?auto_539291 ?auto_539296 ) ) ( not ( = ?auto_539291 ?auto_539297 ) ) ( not ( = ?auto_539291 ?auto_539298 ) ) ( not ( = ?auto_539291 ?auto_539299 ) ) ( not ( = ?auto_539291 ?auto_539300 ) ) ( not ( = ?auto_539291 ?auto_539301 ) ) ( not ( = ?auto_539291 ?auto_539302 ) ) ( not ( = ?auto_539291 ?auto_539303 ) ) ( not ( = ?auto_539291 ?auto_539304 ) ) ( not ( = ?auto_539291 ?auto_539305 ) ) ( not ( = ?auto_539292 ?auto_539293 ) ) ( not ( = ?auto_539292 ?auto_539294 ) ) ( not ( = ?auto_539292 ?auto_539295 ) ) ( not ( = ?auto_539292 ?auto_539296 ) ) ( not ( = ?auto_539292 ?auto_539297 ) ) ( not ( = ?auto_539292 ?auto_539298 ) ) ( not ( = ?auto_539292 ?auto_539299 ) ) ( not ( = ?auto_539292 ?auto_539300 ) ) ( not ( = ?auto_539292 ?auto_539301 ) ) ( not ( = ?auto_539292 ?auto_539302 ) ) ( not ( = ?auto_539292 ?auto_539303 ) ) ( not ( = ?auto_539292 ?auto_539304 ) ) ( not ( = ?auto_539292 ?auto_539305 ) ) ( not ( = ?auto_539293 ?auto_539294 ) ) ( not ( = ?auto_539293 ?auto_539295 ) ) ( not ( = ?auto_539293 ?auto_539296 ) ) ( not ( = ?auto_539293 ?auto_539297 ) ) ( not ( = ?auto_539293 ?auto_539298 ) ) ( not ( = ?auto_539293 ?auto_539299 ) ) ( not ( = ?auto_539293 ?auto_539300 ) ) ( not ( = ?auto_539293 ?auto_539301 ) ) ( not ( = ?auto_539293 ?auto_539302 ) ) ( not ( = ?auto_539293 ?auto_539303 ) ) ( not ( = ?auto_539293 ?auto_539304 ) ) ( not ( = ?auto_539293 ?auto_539305 ) ) ( not ( = ?auto_539294 ?auto_539295 ) ) ( not ( = ?auto_539294 ?auto_539296 ) ) ( not ( = ?auto_539294 ?auto_539297 ) ) ( not ( = ?auto_539294 ?auto_539298 ) ) ( not ( = ?auto_539294 ?auto_539299 ) ) ( not ( = ?auto_539294 ?auto_539300 ) ) ( not ( = ?auto_539294 ?auto_539301 ) ) ( not ( = ?auto_539294 ?auto_539302 ) ) ( not ( = ?auto_539294 ?auto_539303 ) ) ( not ( = ?auto_539294 ?auto_539304 ) ) ( not ( = ?auto_539294 ?auto_539305 ) ) ( not ( = ?auto_539295 ?auto_539296 ) ) ( not ( = ?auto_539295 ?auto_539297 ) ) ( not ( = ?auto_539295 ?auto_539298 ) ) ( not ( = ?auto_539295 ?auto_539299 ) ) ( not ( = ?auto_539295 ?auto_539300 ) ) ( not ( = ?auto_539295 ?auto_539301 ) ) ( not ( = ?auto_539295 ?auto_539302 ) ) ( not ( = ?auto_539295 ?auto_539303 ) ) ( not ( = ?auto_539295 ?auto_539304 ) ) ( not ( = ?auto_539295 ?auto_539305 ) ) ( not ( = ?auto_539296 ?auto_539297 ) ) ( not ( = ?auto_539296 ?auto_539298 ) ) ( not ( = ?auto_539296 ?auto_539299 ) ) ( not ( = ?auto_539296 ?auto_539300 ) ) ( not ( = ?auto_539296 ?auto_539301 ) ) ( not ( = ?auto_539296 ?auto_539302 ) ) ( not ( = ?auto_539296 ?auto_539303 ) ) ( not ( = ?auto_539296 ?auto_539304 ) ) ( not ( = ?auto_539296 ?auto_539305 ) ) ( not ( = ?auto_539297 ?auto_539298 ) ) ( not ( = ?auto_539297 ?auto_539299 ) ) ( not ( = ?auto_539297 ?auto_539300 ) ) ( not ( = ?auto_539297 ?auto_539301 ) ) ( not ( = ?auto_539297 ?auto_539302 ) ) ( not ( = ?auto_539297 ?auto_539303 ) ) ( not ( = ?auto_539297 ?auto_539304 ) ) ( not ( = ?auto_539297 ?auto_539305 ) ) ( not ( = ?auto_539298 ?auto_539299 ) ) ( not ( = ?auto_539298 ?auto_539300 ) ) ( not ( = ?auto_539298 ?auto_539301 ) ) ( not ( = ?auto_539298 ?auto_539302 ) ) ( not ( = ?auto_539298 ?auto_539303 ) ) ( not ( = ?auto_539298 ?auto_539304 ) ) ( not ( = ?auto_539298 ?auto_539305 ) ) ( not ( = ?auto_539299 ?auto_539300 ) ) ( not ( = ?auto_539299 ?auto_539301 ) ) ( not ( = ?auto_539299 ?auto_539302 ) ) ( not ( = ?auto_539299 ?auto_539303 ) ) ( not ( = ?auto_539299 ?auto_539304 ) ) ( not ( = ?auto_539299 ?auto_539305 ) ) ( not ( = ?auto_539300 ?auto_539301 ) ) ( not ( = ?auto_539300 ?auto_539302 ) ) ( not ( = ?auto_539300 ?auto_539303 ) ) ( not ( = ?auto_539300 ?auto_539304 ) ) ( not ( = ?auto_539300 ?auto_539305 ) ) ( not ( = ?auto_539301 ?auto_539302 ) ) ( not ( = ?auto_539301 ?auto_539303 ) ) ( not ( = ?auto_539301 ?auto_539304 ) ) ( not ( = ?auto_539301 ?auto_539305 ) ) ( not ( = ?auto_539302 ?auto_539303 ) ) ( not ( = ?auto_539302 ?auto_539304 ) ) ( not ( = ?auto_539302 ?auto_539305 ) ) ( not ( = ?auto_539303 ?auto_539304 ) ) ( not ( = ?auto_539303 ?auto_539305 ) ) ( not ( = ?auto_539304 ?auto_539305 ) ) ( ON ?auto_539303 ?auto_539304 ) ( CLEAR ?auto_539301 ) ( ON ?auto_539302 ?auto_539303 ) ( CLEAR ?auto_539302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_539289 ?auto_539290 ?auto_539291 ?auto_539292 ?auto_539293 ?auto_539294 ?auto_539295 ?auto_539296 ?auto_539297 ?auto_539298 ?auto_539299 ?auto_539300 ?auto_539301 ?auto_539302 )
      ( MAKE-16PILE ?auto_539289 ?auto_539290 ?auto_539291 ?auto_539292 ?auto_539293 ?auto_539294 ?auto_539295 ?auto_539296 ?auto_539297 ?auto_539298 ?auto_539299 ?auto_539300 ?auto_539301 ?auto_539302 ?auto_539303 ?auto_539304 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539322 - BLOCK
      ?auto_539323 - BLOCK
      ?auto_539324 - BLOCK
      ?auto_539325 - BLOCK
      ?auto_539326 - BLOCK
      ?auto_539327 - BLOCK
      ?auto_539328 - BLOCK
      ?auto_539329 - BLOCK
      ?auto_539330 - BLOCK
      ?auto_539331 - BLOCK
      ?auto_539332 - BLOCK
      ?auto_539333 - BLOCK
      ?auto_539334 - BLOCK
      ?auto_539335 - BLOCK
      ?auto_539336 - BLOCK
      ?auto_539337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539337 ) ( ON-TABLE ?auto_539322 ) ( ON ?auto_539323 ?auto_539322 ) ( ON ?auto_539324 ?auto_539323 ) ( ON ?auto_539325 ?auto_539324 ) ( ON ?auto_539326 ?auto_539325 ) ( ON ?auto_539327 ?auto_539326 ) ( ON ?auto_539328 ?auto_539327 ) ( ON ?auto_539329 ?auto_539328 ) ( ON ?auto_539330 ?auto_539329 ) ( ON ?auto_539331 ?auto_539330 ) ( ON ?auto_539332 ?auto_539331 ) ( ON ?auto_539333 ?auto_539332 ) ( ON ?auto_539334 ?auto_539333 ) ( not ( = ?auto_539322 ?auto_539323 ) ) ( not ( = ?auto_539322 ?auto_539324 ) ) ( not ( = ?auto_539322 ?auto_539325 ) ) ( not ( = ?auto_539322 ?auto_539326 ) ) ( not ( = ?auto_539322 ?auto_539327 ) ) ( not ( = ?auto_539322 ?auto_539328 ) ) ( not ( = ?auto_539322 ?auto_539329 ) ) ( not ( = ?auto_539322 ?auto_539330 ) ) ( not ( = ?auto_539322 ?auto_539331 ) ) ( not ( = ?auto_539322 ?auto_539332 ) ) ( not ( = ?auto_539322 ?auto_539333 ) ) ( not ( = ?auto_539322 ?auto_539334 ) ) ( not ( = ?auto_539322 ?auto_539335 ) ) ( not ( = ?auto_539322 ?auto_539336 ) ) ( not ( = ?auto_539322 ?auto_539337 ) ) ( not ( = ?auto_539323 ?auto_539324 ) ) ( not ( = ?auto_539323 ?auto_539325 ) ) ( not ( = ?auto_539323 ?auto_539326 ) ) ( not ( = ?auto_539323 ?auto_539327 ) ) ( not ( = ?auto_539323 ?auto_539328 ) ) ( not ( = ?auto_539323 ?auto_539329 ) ) ( not ( = ?auto_539323 ?auto_539330 ) ) ( not ( = ?auto_539323 ?auto_539331 ) ) ( not ( = ?auto_539323 ?auto_539332 ) ) ( not ( = ?auto_539323 ?auto_539333 ) ) ( not ( = ?auto_539323 ?auto_539334 ) ) ( not ( = ?auto_539323 ?auto_539335 ) ) ( not ( = ?auto_539323 ?auto_539336 ) ) ( not ( = ?auto_539323 ?auto_539337 ) ) ( not ( = ?auto_539324 ?auto_539325 ) ) ( not ( = ?auto_539324 ?auto_539326 ) ) ( not ( = ?auto_539324 ?auto_539327 ) ) ( not ( = ?auto_539324 ?auto_539328 ) ) ( not ( = ?auto_539324 ?auto_539329 ) ) ( not ( = ?auto_539324 ?auto_539330 ) ) ( not ( = ?auto_539324 ?auto_539331 ) ) ( not ( = ?auto_539324 ?auto_539332 ) ) ( not ( = ?auto_539324 ?auto_539333 ) ) ( not ( = ?auto_539324 ?auto_539334 ) ) ( not ( = ?auto_539324 ?auto_539335 ) ) ( not ( = ?auto_539324 ?auto_539336 ) ) ( not ( = ?auto_539324 ?auto_539337 ) ) ( not ( = ?auto_539325 ?auto_539326 ) ) ( not ( = ?auto_539325 ?auto_539327 ) ) ( not ( = ?auto_539325 ?auto_539328 ) ) ( not ( = ?auto_539325 ?auto_539329 ) ) ( not ( = ?auto_539325 ?auto_539330 ) ) ( not ( = ?auto_539325 ?auto_539331 ) ) ( not ( = ?auto_539325 ?auto_539332 ) ) ( not ( = ?auto_539325 ?auto_539333 ) ) ( not ( = ?auto_539325 ?auto_539334 ) ) ( not ( = ?auto_539325 ?auto_539335 ) ) ( not ( = ?auto_539325 ?auto_539336 ) ) ( not ( = ?auto_539325 ?auto_539337 ) ) ( not ( = ?auto_539326 ?auto_539327 ) ) ( not ( = ?auto_539326 ?auto_539328 ) ) ( not ( = ?auto_539326 ?auto_539329 ) ) ( not ( = ?auto_539326 ?auto_539330 ) ) ( not ( = ?auto_539326 ?auto_539331 ) ) ( not ( = ?auto_539326 ?auto_539332 ) ) ( not ( = ?auto_539326 ?auto_539333 ) ) ( not ( = ?auto_539326 ?auto_539334 ) ) ( not ( = ?auto_539326 ?auto_539335 ) ) ( not ( = ?auto_539326 ?auto_539336 ) ) ( not ( = ?auto_539326 ?auto_539337 ) ) ( not ( = ?auto_539327 ?auto_539328 ) ) ( not ( = ?auto_539327 ?auto_539329 ) ) ( not ( = ?auto_539327 ?auto_539330 ) ) ( not ( = ?auto_539327 ?auto_539331 ) ) ( not ( = ?auto_539327 ?auto_539332 ) ) ( not ( = ?auto_539327 ?auto_539333 ) ) ( not ( = ?auto_539327 ?auto_539334 ) ) ( not ( = ?auto_539327 ?auto_539335 ) ) ( not ( = ?auto_539327 ?auto_539336 ) ) ( not ( = ?auto_539327 ?auto_539337 ) ) ( not ( = ?auto_539328 ?auto_539329 ) ) ( not ( = ?auto_539328 ?auto_539330 ) ) ( not ( = ?auto_539328 ?auto_539331 ) ) ( not ( = ?auto_539328 ?auto_539332 ) ) ( not ( = ?auto_539328 ?auto_539333 ) ) ( not ( = ?auto_539328 ?auto_539334 ) ) ( not ( = ?auto_539328 ?auto_539335 ) ) ( not ( = ?auto_539328 ?auto_539336 ) ) ( not ( = ?auto_539328 ?auto_539337 ) ) ( not ( = ?auto_539329 ?auto_539330 ) ) ( not ( = ?auto_539329 ?auto_539331 ) ) ( not ( = ?auto_539329 ?auto_539332 ) ) ( not ( = ?auto_539329 ?auto_539333 ) ) ( not ( = ?auto_539329 ?auto_539334 ) ) ( not ( = ?auto_539329 ?auto_539335 ) ) ( not ( = ?auto_539329 ?auto_539336 ) ) ( not ( = ?auto_539329 ?auto_539337 ) ) ( not ( = ?auto_539330 ?auto_539331 ) ) ( not ( = ?auto_539330 ?auto_539332 ) ) ( not ( = ?auto_539330 ?auto_539333 ) ) ( not ( = ?auto_539330 ?auto_539334 ) ) ( not ( = ?auto_539330 ?auto_539335 ) ) ( not ( = ?auto_539330 ?auto_539336 ) ) ( not ( = ?auto_539330 ?auto_539337 ) ) ( not ( = ?auto_539331 ?auto_539332 ) ) ( not ( = ?auto_539331 ?auto_539333 ) ) ( not ( = ?auto_539331 ?auto_539334 ) ) ( not ( = ?auto_539331 ?auto_539335 ) ) ( not ( = ?auto_539331 ?auto_539336 ) ) ( not ( = ?auto_539331 ?auto_539337 ) ) ( not ( = ?auto_539332 ?auto_539333 ) ) ( not ( = ?auto_539332 ?auto_539334 ) ) ( not ( = ?auto_539332 ?auto_539335 ) ) ( not ( = ?auto_539332 ?auto_539336 ) ) ( not ( = ?auto_539332 ?auto_539337 ) ) ( not ( = ?auto_539333 ?auto_539334 ) ) ( not ( = ?auto_539333 ?auto_539335 ) ) ( not ( = ?auto_539333 ?auto_539336 ) ) ( not ( = ?auto_539333 ?auto_539337 ) ) ( not ( = ?auto_539334 ?auto_539335 ) ) ( not ( = ?auto_539334 ?auto_539336 ) ) ( not ( = ?auto_539334 ?auto_539337 ) ) ( not ( = ?auto_539335 ?auto_539336 ) ) ( not ( = ?auto_539335 ?auto_539337 ) ) ( not ( = ?auto_539336 ?auto_539337 ) ) ( ON ?auto_539336 ?auto_539337 ) ( CLEAR ?auto_539334 ) ( ON ?auto_539335 ?auto_539336 ) ( CLEAR ?auto_539335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_539322 ?auto_539323 ?auto_539324 ?auto_539325 ?auto_539326 ?auto_539327 ?auto_539328 ?auto_539329 ?auto_539330 ?auto_539331 ?auto_539332 ?auto_539333 ?auto_539334 ?auto_539335 )
      ( MAKE-16PILE ?auto_539322 ?auto_539323 ?auto_539324 ?auto_539325 ?auto_539326 ?auto_539327 ?auto_539328 ?auto_539329 ?auto_539330 ?auto_539331 ?auto_539332 ?auto_539333 ?auto_539334 ?auto_539335 ?auto_539336 ?auto_539337 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539354 - BLOCK
      ?auto_539355 - BLOCK
      ?auto_539356 - BLOCK
      ?auto_539357 - BLOCK
      ?auto_539358 - BLOCK
      ?auto_539359 - BLOCK
      ?auto_539360 - BLOCK
      ?auto_539361 - BLOCK
      ?auto_539362 - BLOCK
      ?auto_539363 - BLOCK
      ?auto_539364 - BLOCK
      ?auto_539365 - BLOCK
      ?auto_539366 - BLOCK
      ?auto_539367 - BLOCK
      ?auto_539368 - BLOCK
      ?auto_539369 - BLOCK
    )
    :vars
    (
      ?auto_539370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539369 ?auto_539370 ) ( ON-TABLE ?auto_539354 ) ( ON ?auto_539355 ?auto_539354 ) ( ON ?auto_539356 ?auto_539355 ) ( ON ?auto_539357 ?auto_539356 ) ( ON ?auto_539358 ?auto_539357 ) ( ON ?auto_539359 ?auto_539358 ) ( ON ?auto_539360 ?auto_539359 ) ( ON ?auto_539361 ?auto_539360 ) ( ON ?auto_539362 ?auto_539361 ) ( ON ?auto_539363 ?auto_539362 ) ( ON ?auto_539364 ?auto_539363 ) ( ON ?auto_539365 ?auto_539364 ) ( not ( = ?auto_539354 ?auto_539355 ) ) ( not ( = ?auto_539354 ?auto_539356 ) ) ( not ( = ?auto_539354 ?auto_539357 ) ) ( not ( = ?auto_539354 ?auto_539358 ) ) ( not ( = ?auto_539354 ?auto_539359 ) ) ( not ( = ?auto_539354 ?auto_539360 ) ) ( not ( = ?auto_539354 ?auto_539361 ) ) ( not ( = ?auto_539354 ?auto_539362 ) ) ( not ( = ?auto_539354 ?auto_539363 ) ) ( not ( = ?auto_539354 ?auto_539364 ) ) ( not ( = ?auto_539354 ?auto_539365 ) ) ( not ( = ?auto_539354 ?auto_539366 ) ) ( not ( = ?auto_539354 ?auto_539367 ) ) ( not ( = ?auto_539354 ?auto_539368 ) ) ( not ( = ?auto_539354 ?auto_539369 ) ) ( not ( = ?auto_539354 ?auto_539370 ) ) ( not ( = ?auto_539355 ?auto_539356 ) ) ( not ( = ?auto_539355 ?auto_539357 ) ) ( not ( = ?auto_539355 ?auto_539358 ) ) ( not ( = ?auto_539355 ?auto_539359 ) ) ( not ( = ?auto_539355 ?auto_539360 ) ) ( not ( = ?auto_539355 ?auto_539361 ) ) ( not ( = ?auto_539355 ?auto_539362 ) ) ( not ( = ?auto_539355 ?auto_539363 ) ) ( not ( = ?auto_539355 ?auto_539364 ) ) ( not ( = ?auto_539355 ?auto_539365 ) ) ( not ( = ?auto_539355 ?auto_539366 ) ) ( not ( = ?auto_539355 ?auto_539367 ) ) ( not ( = ?auto_539355 ?auto_539368 ) ) ( not ( = ?auto_539355 ?auto_539369 ) ) ( not ( = ?auto_539355 ?auto_539370 ) ) ( not ( = ?auto_539356 ?auto_539357 ) ) ( not ( = ?auto_539356 ?auto_539358 ) ) ( not ( = ?auto_539356 ?auto_539359 ) ) ( not ( = ?auto_539356 ?auto_539360 ) ) ( not ( = ?auto_539356 ?auto_539361 ) ) ( not ( = ?auto_539356 ?auto_539362 ) ) ( not ( = ?auto_539356 ?auto_539363 ) ) ( not ( = ?auto_539356 ?auto_539364 ) ) ( not ( = ?auto_539356 ?auto_539365 ) ) ( not ( = ?auto_539356 ?auto_539366 ) ) ( not ( = ?auto_539356 ?auto_539367 ) ) ( not ( = ?auto_539356 ?auto_539368 ) ) ( not ( = ?auto_539356 ?auto_539369 ) ) ( not ( = ?auto_539356 ?auto_539370 ) ) ( not ( = ?auto_539357 ?auto_539358 ) ) ( not ( = ?auto_539357 ?auto_539359 ) ) ( not ( = ?auto_539357 ?auto_539360 ) ) ( not ( = ?auto_539357 ?auto_539361 ) ) ( not ( = ?auto_539357 ?auto_539362 ) ) ( not ( = ?auto_539357 ?auto_539363 ) ) ( not ( = ?auto_539357 ?auto_539364 ) ) ( not ( = ?auto_539357 ?auto_539365 ) ) ( not ( = ?auto_539357 ?auto_539366 ) ) ( not ( = ?auto_539357 ?auto_539367 ) ) ( not ( = ?auto_539357 ?auto_539368 ) ) ( not ( = ?auto_539357 ?auto_539369 ) ) ( not ( = ?auto_539357 ?auto_539370 ) ) ( not ( = ?auto_539358 ?auto_539359 ) ) ( not ( = ?auto_539358 ?auto_539360 ) ) ( not ( = ?auto_539358 ?auto_539361 ) ) ( not ( = ?auto_539358 ?auto_539362 ) ) ( not ( = ?auto_539358 ?auto_539363 ) ) ( not ( = ?auto_539358 ?auto_539364 ) ) ( not ( = ?auto_539358 ?auto_539365 ) ) ( not ( = ?auto_539358 ?auto_539366 ) ) ( not ( = ?auto_539358 ?auto_539367 ) ) ( not ( = ?auto_539358 ?auto_539368 ) ) ( not ( = ?auto_539358 ?auto_539369 ) ) ( not ( = ?auto_539358 ?auto_539370 ) ) ( not ( = ?auto_539359 ?auto_539360 ) ) ( not ( = ?auto_539359 ?auto_539361 ) ) ( not ( = ?auto_539359 ?auto_539362 ) ) ( not ( = ?auto_539359 ?auto_539363 ) ) ( not ( = ?auto_539359 ?auto_539364 ) ) ( not ( = ?auto_539359 ?auto_539365 ) ) ( not ( = ?auto_539359 ?auto_539366 ) ) ( not ( = ?auto_539359 ?auto_539367 ) ) ( not ( = ?auto_539359 ?auto_539368 ) ) ( not ( = ?auto_539359 ?auto_539369 ) ) ( not ( = ?auto_539359 ?auto_539370 ) ) ( not ( = ?auto_539360 ?auto_539361 ) ) ( not ( = ?auto_539360 ?auto_539362 ) ) ( not ( = ?auto_539360 ?auto_539363 ) ) ( not ( = ?auto_539360 ?auto_539364 ) ) ( not ( = ?auto_539360 ?auto_539365 ) ) ( not ( = ?auto_539360 ?auto_539366 ) ) ( not ( = ?auto_539360 ?auto_539367 ) ) ( not ( = ?auto_539360 ?auto_539368 ) ) ( not ( = ?auto_539360 ?auto_539369 ) ) ( not ( = ?auto_539360 ?auto_539370 ) ) ( not ( = ?auto_539361 ?auto_539362 ) ) ( not ( = ?auto_539361 ?auto_539363 ) ) ( not ( = ?auto_539361 ?auto_539364 ) ) ( not ( = ?auto_539361 ?auto_539365 ) ) ( not ( = ?auto_539361 ?auto_539366 ) ) ( not ( = ?auto_539361 ?auto_539367 ) ) ( not ( = ?auto_539361 ?auto_539368 ) ) ( not ( = ?auto_539361 ?auto_539369 ) ) ( not ( = ?auto_539361 ?auto_539370 ) ) ( not ( = ?auto_539362 ?auto_539363 ) ) ( not ( = ?auto_539362 ?auto_539364 ) ) ( not ( = ?auto_539362 ?auto_539365 ) ) ( not ( = ?auto_539362 ?auto_539366 ) ) ( not ( = ?auto_539362 ?auto_539367 ) ) ( not ( = ?auto_539362 ?auto_539368 ) ) ( not ( = ?auto_539362 ?auto_539369 ) ) ( not ( = ?auto_539362 ?auto_539370 ) ) ( not ( = ?auto_539363 ?auto_539364 ) ) ( not ( = ?auto_539363 ?auto_539365 ) ) ( not ( = ?auto_539363 ?auto_539366 ) ) ( not ( = ?auto_539363 ?auto_539367 ) ) ( not ( = ?auto_539363 ?auto_539368 ) ) ( not ( = ?auto_539363 ?auto_539369 ) ) ( not ( = ?auto_539363 ?auto_539370 ) ) ( not ( = ?auto_539364 ?auto_539365 ) ) ( not ( = ?auto_539364 ?auto_539366 ) ) ( not ( = ?auto_539364 ?auto_539367 ) ) ( not ( = ?auto_539364 ?auto_539368 ) ) ( not ( = ?auto_539364 ?auto_539369 ) ) ( not ( = ?auto_539364 ?auto_539370 ) ) ( not ( = ?auto_539365 ?auto_539366 ) ) ( not ( = ?auto_539365 ?auto_539367 ) ) ( not ( = ?auto_539365 ?auto_539368 ) ) ( not ( = ?auto_539365 ?auto_539369 ) ) ( not ( = ?auto_539365 ?auto_539370 ) ) ( not ( = ?auto_539366 ?auto_539367 ) ) ( not ( = ?auto_539366 ?auto_539368 ) ) ( not ( = ?auto_539366 ?auto_539369 ) ) ( not ( = ?auto_539366 ?auto_539370 ) ) ( not ( = ?auto_539367 ?auto_539368 ) ) ( not ( = ?auto_539367 ?auto_539369 ) ) ( not ( = ?auto_539367 ?auto_539370 ) ) ( not ( = ?auto_539368 ?auto_539369 ) ) ( not ( = ?auto_539368 ?auto_539370 ) ) ( not ( = ?auto_539369 ?auto_539370 ) ) ( ON ?auto_539368 ?auto_539369 ) ( ON ?auto_539367 ?auto_539368 ) ( CLEAR ?auto_539365 ) ( ON ?auto_539366 ?auto_539367 ) ( CLEAR ?auto_539366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_539354 ?auto_539355 ?auto_539356 ?auto_539357 ?auto_539358 ?auto_539359 ?auto_539360 ?auto_539361 ?auto_539362 ?auto_539363 ?auto_539364 ?auto_539365 ?auto_539366 )
      ( MAKE-16PILE ?auto_539354 ?auto_539355 ?auto_539356 ?auto_539357 ?auto_539358 ?auto_539359 ?auto_539360 ?auto_539361 ?auto_539362 ?auto_539363 ?auto_539364 ?auto_539365 ?auto_539366 ?auto_539367 ?auto_539368 ?auto_539369 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539387 - BLOCK
      ?auto_539388 - BLOCK
      ?auto_539389 - BLOCK
      ?auto_539390 - BLOCK
      ?auto_539391 - BLOCK
      ?auto_539392 - BLOCK
      ?auto_539393 - BLOCK
      ?auto_539394 - BLOCK
      ?auto_539395 - BLOCK
      ?auto_539396 - BLOCK
      ?auto_539397 - BLOCK
      ?auto_539398 - BLOCK
      ?auto_539399 - BLOCK
      ?auto_539400 - BLOCK
      ?auto_539401 - BLOCK
      ?auto_539402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539402 ) ( ON-TABLE ?auto_539387 ) ( ON ?auto_539388 ?auto_539387 ) ( ON ?auto_539389 ?auto_539388 ) ( ON ?auto_539390 ?auto_539389 ) ( ON ?auto_539391 ?auto_539390 ) ( ON ?auto_539392 ?auto_539391 ) ( ON ?auto_539393 ?auto_539392 ) ( ON ?auto_539394 ?auto_539393 ) ( ON ?auto_539395 ?auto_539394 ) ( ON ?auto_539396 ?auto_539395 ) ( ON ?auto_539397 ?auto_539396 ) ( ON ?auto_539398 ?auto_539397 ) ( not ( = ?auto_539387 ?auto_539388 ) ) ( not ( = ?auto_539387 ?auto_539389 ) ) ( not ( = ?auto_539387 ?auto_539390 ) ) ( not ( = ?auto_539387 ?auto_539391 ) ) ( not ( = ?auto_539387 ?auto_539392 ) ) ( not ( = ?auto_539387 ?auto_539393 ) ) ( not ( = ?auto_539387 ?auto_539394 ) ) ( not ( = ?auto_539387 ?auto_539395 ) ) ( not ( = ?auto_539387 ?auto_539396 ) ) ( not ( = ?auto_539387 ?auto_539397 ) ) ( not ( = ?auto_539387 ?auto_539398 ) ) ( not ( = ?auto_539387 ?auto_539399 ) ) ( not ( = ?auto_539387 ?auto_539400 ) ) ( not ( = ?auto_539387 ?auto_539401 ) ) ( not ( = ?auto_539387 ?auto_539402 ) ) ( not ( = ?auto_539388 ?auto_539389 ) ) ( not ( = ?auto_539388 ?auto_539390 ) ) ( not ( = ?auto_539388 ?auto_539391 ) ) ( not ( = ?auto_539388 ?auto_539392 ) ) ( not ( = ?auto_539388 ?auto_539393 ) ) ( not ( = ?auto_539388 ?auto_539394 ) ) ( not ( = ?auto_539388 ?auto_539395 ) ) ( not ( = ?auto_539388 ?auto_539396 ) ) ( not ( = ?auto_539388 ?auto_539397 ) ) ( not ( = ?auto_539388 ?auto_539398 ) ) ( not ( = ?auto_539388 ?auto_539399 ) ) ( not ( = ?auto_539388 ?auto_539400 ) ) ( not ( = ?auto_539388 ?auto_539401 ) ) ( not ( = ?auto_539388 ?auto_539402 ) ) ( not ( = ?auto_539389 ?auto_539390 ) ) ( not ( = ?auto_539389 ?auto_539391 ) ) ( not ( = ?auto_539389 ?auto_539392 ) ) ( not ( = ?auto_539389 ?auto_539393 ) ) ( not ( = ?auto_539389 ?auto_539394 ) ) ( not ( = ?auto_539389 ?auto_539395 ) ) ( not ( = ?auto_539389 ?auto_539396 ) ) ( not ( = ?auto_539389 ?auto_539397 ) ) ( not ( = ?auto_539389 ?auto_539398 ) ) ( not ( = ?auto_539389 ?auto_539399 ) ) ( not ( = ?auto_539389 ?auto_539400 ) ) ( not ( = ?auto_539389 ?auto_539401 ) ) ( not ( = ?auto_539389 ?auto_539402 ) ) ( not ( = ?auto_539390 ?auto_539391 ) ) ( not ( = ?auto_539390 ?auto_539392 ) ) ( not ( = ?auto_539390 ?auto_539393 ) ) ( not ( = ?auto_539390 ?auto_539394 ) ) ( not ( = ?auto_539390 ?auto_539395 ) ) ( not ( = ?auto_539390 ?auto_539396 ) ) ( not ( = ?auto_539390 ?auto_539397 ) ) ( not ( = ?auto_539390 ?auto_539398 ) ) ( not ( = ?auto_539390 ?auto_539399 ) ) ( not ( = ?auto_539390 ?auto_539400 ) ) ( not ( = ?auto_539390 ?auto_539401 ) ) ( not ( = ?auto_539390 ?auto_539402 ) ) ( not ( = ?auto_539391 ?auto_539392 ) ) ( not ( = ?auto_539391 ?auto_539393 ) ) ( not ( = ?auto_539391 ?auto_539394 ) ) ( not ( = ?auto_539391 ?auto_539395 ) ) ( not ( = ?auto_539391 ?auto_539396 ) ) ( not ( = ?auto_539391 ?auto_539397 ) ) ( not ( = ?auto_539391 ?auto_539398 ) ) ( not ( = ?auto_539391 ?auto_539399 ) ) ( not ( = ?auto_539391 ?auto_539400 ) ) ( not ( = ?auto_539391 ?auto_539401 ) ) ( not ( = ?auto_539391 ?auto_539402 ) ) ( not ( = ?auto_539392 ?auto_539393 ) ) ( not ( = ?auto_539392 ?auto_539394 ) ) ( not ( = ?auto_539392 ?auto_539395 ) ) ( not ( = ?auto_539392 ?auto_539396 ) ) ( not ( = ?auto_539392 ?auto_539397 ) ) ( not ( = ?auto_539392 ?auto_539398 ) ) ( not ( = ?auto_539392 ?auto_539399 ) ) ( not ( = ?auto_539392 ?auto_539400 ) ) ( not ( = ?auto_539392 ?auto_539401 ) ) ( not ( = ?auto_539392 ?auto_539402 ) ) ( not ( = ?auto_539393 ?auto_539394 ) ) ( not ( = ?auto_539393 ?auto_539395 ) ) ( not ( = ?auto_539393 ?auto_539396 ) ) ( not ( = ?auto_539393 ?auto_539397 ) ) ( not ( = ?auto_539393 ?auto_539398 ) ) ( not ( = ?auto_539393 ?auto_539399 ) ) ( not ( = ?auto_539393 ?auto_539400 ) ) ( not ( = ?auto_539393 ?auto_539401 ) ) ( not ( = ?auto_539393 ?auto_539402 ) ) ( not ( = ?auto_539394 ?auto_539395 ) ) ( not ( = ?auto_539394 ?auto_539396 ) ) ( not ( = ?auto_539394 ?auto_539397 ) ) ( not ( = ?auto_539394 ?auto_539398 ) ) ( not ( = ?auto_539394 ?auto_539399 ) ) ( not ( = ?auto_539394 ?auto_539400 ) ) ( not ( = ?auto_539394 ?auto_539401 ) ) ( not ( = ?auto_539394 ?auto_539402 ) ) ( not ( = ?auto_539395 ?auto_539396 ) ) ( not ( = ?auto_539395 ?auto_539397 ) ) ( not ( = ?auto_539395 ?auto_539398 ) ) ( not ( = ?auto_539395 ?auto_539399 ) ) ( not ( = ?auto_539395 ?auto_539400 ) ) ( not ( = ?auto_539395 ?auto_539401 ) ) ( not ( = ?auto_539395 ?auto_539402 ) ) ( not ( = ?auto_539396 ?auto_539397 ) ) ( not ( = ?auto_539396 ?auto_539398 ) ) ( not ( = ?auto_539396 ?auto_539399 ) ) ( not ( = ?auto_539396 ?auto_539400 ) ) ( not ( = ?auto_539396 ?auto_539401 ) ) ( not ( = ?auto_539396 ?auto_539402 ) ) ( not ( = ?auto_539397 ?auto_539398 ) ) ( not ( = ?auto_539397 ?auto_539399 ) ) ( not ( = ?auto_539397 ?auto_539400 ) ) ( not ( = ?auto_539397 ?auto_539401 ) ) ( not ( = ?auto_539397 ?auto_539402 ) ) ( not ( = ?auto_539398 ?auto_539399 ) ) ( not ( = ?auto_539398 ?auto_539400 ) ) ( not ( = ?auto_539398 ?auto_539401 ) ) ( not ( = ?auto_539398 ?auto_539402 ) ) ( not ( = ?auto_539399 ?auto_539400 ) ) ( not ( = ?auto_539399 ?auto_539401 ) ) ( not ( = ?auto_539399 ?auto_539402 ) ) ( not ( = ?auto_539400 ?auto_539401 ) ) ( not ( = ?auto_539400 ?auto_539402 ) ) ( not ( = ?auto_539401 ?auto_539402 ) ) ( ON ?auto_539401 ?auto_539402 ) ( ON ?auto_539400 ?auto_539401 ) ( CLEAR ?auto_539398 ) ( ON ?auto_539399 ?auto_539400 ) ( CLEAR ?auto_539399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_539387 ?auto_539388 ?auto_539389 ?auto_539390 ?auto_539391 ?auto_539392 ?auto_539393 ?auto_539394 ?auto_539395 ?auto_539396 ?auto_539397 ?auto_539398 ?auto_539399 )
      ( MAKE-16PILE ?auto_539387 ?auto_539388 ?auto_539389 ?auto_539390 ?auto_539391 ?auto_539392 ?auto_539393 ?auto_539394 ?auto_539395 ?auto_539396 ?auto_539397 ?auto_539398 ?auto_539399 ?auto_539400 ?auto_539401 ?auto_539402 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539419 - BLOCK
      ?auto_539420 - BLOCK
      ?auto_539421 - BLOCK
      ?auto_539422 - BLOCK
      ?auto_539423 - BLOCK
      ?auto_539424 - BLOCK
      ?auto_539425 - BLOCK
      ?auto_539426 - BLOCK
      ?auto_539427 - BLOCK
      ?auto_539428 - BLOCK
      ?auto_539429 - BLOCK
      ?auto_539430 - BLOCK
      ?auto_539431 - BLOCK
      ?auto_539432 - BLOCK
      ?auto_539433 - BLOCK
      ?auto_539434 - BLOCK
    )
    :vars
    (
      ?auto_539435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539434 ?auto_539435 ) ( ON-TABLE ?auto_539419 ) ( ON ?auto_539420 ?auto_539419 ) ( ON ?auto_539421 ?auto_539420 ) ( ON ?auto_539422 ?auto_539421 ) ( ON ?auto_539423 ?auto_539422 ) ( ON ?auto_539424 ?auto_539423 ) ( ON ?auto_539425 ?auto_539424 ) ( ON ?auto_539426 ?auto_539425 ) ( ON ?auto_539427 ?auto_539426 ) ( ON ?auto_539428 ?auto_539427 ) ( ON ?auto_539429 ?auto_539428 ) ( not ( = ?auto_539419 ?auto_539420 ) ) ( not ( = ?auto_539419 ?auto_539421 ) ) ( not ( = ?auto_539419 ?auto_539422 ) ) ( not ( = ?auto_539419 ?auto_539423 ) ) ( not ( = ?auto_539419 ?auto_539424 ) ) ( not ( = ?auto_539419 ?auto_539425 ) ) ( not ( = ?auto_539419 ?auto_539426 ) ) ( not ( = ?auto_539419 ?auto_539427 ) ) ( not ( = ?auto_539419 ?auto_539428 ) ) ( not ( = ?auto_539419 ?auto_539429 ) ) ( not ( = ?auto_539419 ?auto_539430 ) ) ( not ( = ?auto_539419 ?auto_539431 ) ) ( not ( = ?auto_539419 ?auto_539432 ) ) ( not ( = ?auto_539419 ?auto_539433 ) ) ( not ( = ?auto_539419 ?auto_539434 ) ) ( not ( = ?auto_539419 ?auto_539435 ) ) ( not ( = ?auto_539420 ?auto_539421 ) ) ( not ( = ?auto_539420 ?auto_539422 ) ) ( not ( = ?auto_539420 ?auto_539423 ) ) ( not ( = ?auto_539420 ?auto_539424 ) ) ( not ( = ?auto_539420 ?auto_539425 ) ) ( not ( = ?auto_539420 ?auto_539426 ) ) ( not ( = ?auto_539420 ?auto_539427 ) ) ( not ( = ?auto_539420 ?auto_539428 ) ) ( not ( = ?auto_539420 ?auto_539429 ) ) ( not ( = ?auto_539420 ?auto_539430 ) ) ( not ( = ?auto_539420 ?auto_539431 ) ) ( not ( = ?auto_539420 ?auto_539432 ) ) ( not ( = ?auto_539420 ?auto_539433 ) ) ( not ( = ?auto_539420 ?auto_539434 ) ) ( not ( = ?auto_539420 ?auto_539435 ) ) ( not ( = ?auto_539421 ?auto_539422 ) ) ( not ( = ?auto_539421 ?auto_539423 ) ) ( not ( = ?auto_539421 ?auto_539424 ) ) ( not ( = ?auto_539421 ?auto_539425 ) ) ( not ( = ?auto_539421 ?auto_539426 ) ) ( not ( = ?auto_539421 ?auto_539427 ) ) ( not ( = ?auto_539421 ?auto_539428 ) ) ( not ( = ?auto_539421 ?auto_539429 ) ) ( not ( = ?auto_539421 ?auto_539430 ) ) ( not ( = ?auto_539421 ?auto_539431 ) ) ( not ( = ?auto_539421 ?auto_539432 ) ) ( not ( = ?auto_539421 ?auto_539433 ) ) ( not ( = ?auto_539421 ?auto_539434 ) ) ( not ( = ?auto_539421 ?auto_539435 ) ) ( not ( = ?auto_539422 ?auto_539423 ) ) ( not ( = ?auto_539422 ?auto_539424 ) ) ( not ( = ?auto_539422 ?auto_539425 ) ) ( not ( = ?auto_539422 ?auto_539426 ) ) ( not ( = ?auto_539422 ?auto_539427 ) ) ( not ( = ?auto_539422 ?auto_539428 ) ) ( not ( = ?auto_539422 ?auto_539429 ) ) ( not ( = ?auto_539422 ?auto_539430 ) ) ( not ( = ?auto_539422 ?auto_539431 ) ) ( not ( = ?auto_539422 ?auto_539432 ) ) ( not ( = ?auto_539422 ?auto_539433 ) ) ( not ( = ?auto_539422 ?auto_539434 ) ) ( not ( = ?auto_539422 ?auto_539435 ) ) ( not ( = ?auto_539423 ?auto_539424 ) ) ( not ( = ?auto_539423 ?auto_539425 ) ) ( not ( = ?auto_539423 ?auto_539426 ) ) ( not ( = ?auto_539423 ?auto_539427 ) ) ( not ( = ?auto_539423 ?auto_539428 ) ) ( not ( = ?auto_539423 ?auto_539429 ) ) ( not ( = ?auto_539423 ?auto_539430 ) ) ( not ( = ?auto_539423 ?auto_539431 ) ) ( not ( = ?auto_539423 ?auto_539432 ) ) ( not ( = ?auto_539423 ?auto_539433 ) ) ( not ( = ?auto_539423 ?auto_539434 ) ) ( not ( = ?auto_539423 ?auto_539435 ) ) ( not ( = ?auto_539424 ?auto_539425 ) ) ( not ( = ?auto_539424 ?auto_539426 ) ) ( not ( = ?auto_539424 ?auto_539427 ) ) ( not ( = ?auto_539424 ?auto_539428 ) ) ( not ( = ?auto_539424 ?auto_539429 ) ) ( not ( = ?auto_539424 ?auto_539430 ) ) ( not ( = ?auto_539424 ?auto_539431 ) ) ( not ( = ?auto_539424 ?auto_539432 ) ) ( not ( = ?auto_539424 ?auto_539433 ) ) ( not ( = ?auto_539424 ?auto_539434 ) ) ( not ( = ?auto_539424 ?auto_539435 ) ) ( not ( = ?auto_539425 ?auto_539426 ) ) ( not ( = ?auto_539425 ?auto_539427 ) ) ( not ( = ?auto_539425 ?auto_539428 ) ) ( not ( = ?auto_539425 ?auto_539429 ) ) ( not ( = ?auto_539425 ?auto_539430 ) ) ( not ( = ?auto_539425 ?auto_539431 ) ) ( not ( = ?auto_539425 ?auto_539432 ) ) ( not ( = ?auto_539425 ?auto_539433 ) ) ( not ( = ?auto_539425 ?auto_539434 ) ) ( not ( = ?auto_539425 ?auto_539435 ) ) ( not ( = ?auto_539426 ?auto_539427 ) ) ( not ( = ?auto_539426 ?auto_539428 ) ) ( not ( = ?auto_539426 ?auto_539429 ) ) ( not ( = ?auto_539426 ?auto_539430 ) ) ( not ( = ?auto_539426 ?auto_539431 ) ) ( not ( = ?auto_539426 ?auto_539432 ) ) ( not ( = ?auto_539426 ?auto_539433 ) ) ( not ( = ?auto_539426 ?auto_539434 ) ) ( not ( = ?auto_539426 ?auto_539435 ) ) ( not ( = ?auto_539427 ?auto_539428 ) ) ( not ( = ?auto_539427 ?auto_539429 ) ) ( not ( = ?auto_539427 ?auto_539430 ) ) ( not ( = ?auto_539427 ?auto_539431 ) ) ( not ( = ?auto_539427 ?auto_539432 ) ) ( not ( = ?auto_539427 ?auto_539433 ) ) ( not ( = ?auto_539427 ?auto_539434 ) ) ( not ( = ?auto_539427 ?auto_539435 ) ) ( not ( = ?auto_539428 ?auto_539429 ) ) ( not ( = ?auto_539428 ?auto_539430 ) ) ( not ( = ?auto_539428 ?auto_539431 ) ) ( not ( = ?auto_539428 ?auto_539432 ) ) ( not ( = ?auto_539428 ?auto_539433 ) ) ( not ( = ?auto_539428 ?auto_539434 ) ) ( not ( = ?auto_539428 ?auto_539435 ) ) ( not ( = ?auto_539429 ?auto_539430 ) ) ( not ( = ?auto_539429 ?auto_539431 ) ) ( not ( = ?auto_539429 ?auto_539432 ) ) ( not ( = ?auto_539429 ?auto_539433 ) ) ( not ( = ?auto_539429 ?auto_539434 ) ) ( not ( = ?auto_539429 ?auto_539435 ) ) ( not ( = ?auto_539430 ?auto_539431 ) ) ( not ( = ?auto_539430 ?auto_539432 ) ) ( not ( = ?auto_539430 ?auto_539433 ) ) ( not ( = ?auto_539430 ?auto_539434 ) ) ( not ( = ?auto_539430 ?auto_539435 ) ) ( not ( = ?auto_539431 ?auto_539432 ) ) ( not ( = ?auto_539431 ?auto_539433 ) ) ( not ( = ?auto_539431 ?auto_539434 ) ) ( not ( = ?auto_539431 ?auto_539435 ) ) ( not ( = ?auto_539432 ?auto_539433 ) ) ( not ( = ?auto_539432 ?auto_539434 ) ) ( not ( = ?auto_539432 ?auto_539435 ) ) ( not ( = ?auto_539433 ?auto_539434 ) ) ( not ( = ?auto_539433 ?auto_539435 ) ) ( not ( = ?auto_539434 ?auto_539435 ) ) ( ON ?auto_539433 ?auto_539434 ) ( ON ?auto_539432 ?auto_539433 ) ( ON ?auto_539431 ?auto_539432 ) ( CLEAR ?auto_539429 ) ( ON ?auto_539430 ?auto_539431 ) ( CLEAR ?auto_539430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_539419 ?auto_539420 ?auto_539421 ?auto_539422 ?auto_539423 ?auto_539424 ?auto_539425 ?auto_539426 ?auto_539427 ?auto_539428 ?auto_539429 ?auto_539430 )
      ( MAKE-16PILE ?auto_539419 ?auto_539420 ?auto_539421 ?auto_539422 ?auto_539423 ?auto_539424 ?auto_539425 ?auto_539426 ?auto_539427 ?auto_539428 ?auto_539429 ?auto_539430 ?auto_539431 ?auto_539432 ?auto_539433 ?auto_539434 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539452 - BLOCK
      ?auto_539453 - BLOCK
      ?auto_539454 - BLOCK
      ?auto_539455 - BLOCK
      ?auto_539456 - BLOCK
      ?auto_539457 - BLOCK
      ?auto_539458 - BLOCK
      ?auto_539459 - BLOCK
      ?auto_539460 - BLOCK
      ?auto_539461 - BLOCK
      ?auto_539462 - BLOCK
      ?auto_539463 - BLOCK
      ?auto_539464 - BLOCK
      ?auto_539465 - BLOCK
      ?auto_539466 - BLOCK
      ?auto_539467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539467 ) ( ON-TABLE ?auto_539452 ) ( ON ?auto_539453 ?auto_539452 ) ( ON ?auto_539454 ?auto_539453 ) ( ON ?auto_539455 ?auto_539454 ) ( ON ?auto_539456 ?auto_539455 ) ( ON ?auto_539457 ?auto_539456 ) ( ON ?auto_539458 ?auto_539457 ) ( ON ?auto_539459 ?auto_539458 ) ( ON ?auto_539460 ?auto_539459 ) ( ON ?auto_539461 ?auto_539460 ) ( ON ?auto_539462 ?auto_539461 ) ( not ( = ?auto_539452 ?auto_539453 ) ) ( not ( = ?auto_539452 ?auto_539454 ) ) ( not ( = ?auto_539452 ?auto_539455 ) ) ( not ( = ?auto_539452 ?auto_539456 ) ) ( not ( = ?auto_539452 ?auto_539457 ) ) ( not ( = ?auto_539452 ?auto_539458 ) ) ( not ( = ?auto_539452 ?auto_539459 ) ) ( not ( = ?auto_539452 ?auto_539460 ) ) ( not ( = ?auto_539452 ?auto_539461 ) ) ( not ( = ?auto_539452 ?auto_539462 ) ) ( not ( = ?auto_539452 ?auto_539463 ) ) ( not ( = ?auto_539452 ?auto_539464 ) ) ( not ( = ?auto_539452 ?auto_539465 ) ) ( not ( = ?auto_539452 ?auto_539466 ) ) ( not ( = ?auto_539452 ?auto_539467 ) ) ( not ( = ?auto_539453 ?auto_539454 ) ) ( not ( = ?auto_539453 ?auto_539455 ) ) ( not ( = ?auto_539453 ?auto_539456 ) ) ( not ( = ?auto_539453 ?auto_539457 ) ) ( not ( = ?auto_539453 ?auto_539458 ) ) ( not ( = ?auto_539453 ?auto_539459 ) ) ( not ( = ?auto_539453 ?auto_539460 ) ) ( not ( = ?auto_539453 ?auto_539461 ) ) ( not ( = ?auto_539453 ?auto_539462 ) ) ( not ( = ?auto_539453 ?auto_539463 ) ) ( not ( = ?auto_539453 ?auto_539464 ) ) ( not ( = ?auto_539453 ?auto_539465 ) ) ( not ( = ?auto_539453 ?auto_539466 ) ) ( not ( = ?auto_539453 ?auto_539467 ) ) ( not ( = ?auto_539454 ?auto_539455 ) ) ( not ( = ?auto_539454 ?auto_539456 ) ) ( not ( = ?auto_539454 ?auto_539457 ) ) ( not ( = ?auto_539454 ?auto_539458 ) ) ( not ( = ?auto_539454 ?auto_539459 ) ) ( not ( = ?auto_539454 ?auto_539460 ) ) ( not ( = ?auto_539454 ?auto_539461 ) ) ( not ( = ?auto_539454 ?auto_539462 ) ) ( not ( = ?auto_539454 ?auto_539463 ) ) ( not ( = ?auto_539454 ?auto_539464 ) ) ( not ( = ?auto_539454 ?auto_539465 ) ) ( not ( = ?auto_539454 ?auto_539466 ) ) ( not ( = ?auto_539454 ?auto_539467 ) ) ( not ( = ?auto_539455 ?auto_539456 ) ) ( not ( = ?auto_539455 ?auto_539457 ) ) ( not ( = ?auto_539455 ?auto_539458 ) ) ( not ( = ?auto_539455 ?auto_539459 ) ) ( not ( = ?auto_539455 ?auto_539460 ) ) ( not ( = ?auto_539455 ?auto_539461 ) ) ( not ( = ?auto_539455 ?auto_539462 ) ) ( not ( = ?auto_539455 ?auto_539463 ) ) ( not ( = ?auto_539455 ?auto_539464 ) ) ( not ( = ?auto_539455 ?auto_539465 ) ) ( not ( = ?auto_539455 ?auto_539466 ) ) ( not ( = ?auto_539455 ?auto_539467 ) ) ( not ( = ?auto_539456 ?auto_539457 ) ) ( not ( = ?auto_539456 ?auto_539458 ) ) ( not ( = ?auto_539456 ?auto_539459 ) ) ( not ( = ?auto_539456 ?auto_539460 ) ) ( not ( = ?auto_539456 ?auto_539461 ) ) ( not ( = ?auto_539456 ?auto_539462 ) ) ( not ( = ?auto_539456 ?auto_539463 ) ) ( not ( = ?auto_539456 ?auto_539464 ) ) ( not ( = ?auto_539456 ?auto_539465 ) ) ( not ( = ?auto_539456 ?auto_539466 ) ) ( not ( = ?auto_539456 ?auto_539467 ) ) ( not ( = ?auto_539457 ?auto_539458 ) ) ( not ( = ?auto_539457 ?auto_539459 ) ) ( not ( = ?auto_539457 ?auto_539460 ) ) ( not ( = ?auto_539457 ?auto_539461 ) ) ( not ( = ?auto_539457 ?auto_539462 ) ) ( not ( = ?auto_539457 ?auto_539463 ) ) ( not ( = ?auto_539457 ?auto_539464 ) ) ( not ( = ?auto_539457 ?auto_539465 ) ) ( not ( = ?auto_539457 ?auto_539466 ) ) ( not ( = ?auto_539457 ?auto_539467 ) ) ( not ( = ?auto_539458 ?auto_539459 ) ) ( not ( = ?auto_539458 ?auto_539460 ) ) ( not ( = ?auto_539458 ?auto_539461 ) ) ( not ( = ?auto_539458 ?auto_539462 ) ) ( not ( = ?auto_539458 ?auto_539463 ) ) ( not ( = ?auto_539458 ?auto_539464 ) ) ( not ( = ?auto_539458 ?auto_539465 ) ) ( not ( = ?auto_539458 ?auto_539466 ) ) ( not ( = ?auto_539458 ?auto_539467 ) ) ( not ( = ?auto_539459 ?auto_539460 ) ) ( not ( = ?auto_539459 ?auto_539461 ) ) ( not ( = ?auto_539459 ?auto_539462 ) ) ( not ( = ?auto_539459 ?auto_539463 ) ) ( not ( = ?auto_539459 ?auto_539464 ) ) ( not ( = ?auto_539459 ?auto_539465 ) ) ( not ( = ?auto_539459 ?auto_539466 ) ) ( not ( = ?auto_539459 ?auto_539467 ) ) ( not ( = ?auto_539460 ?auto_539461 ) ) ( not ( = ?auto_539460 ?auto_539462 ) ) ( not ( = ?auto_539460 ?auto_539463 ) ) ( not ( = ?auto_539460 ?auto_539464 ) ) ( not ( = ?auto_539460 ?auto_539465 ) ) ( not ( = ?auto_539460 ?auto_539466 ) ) ( not ( = ?auto_539460 ?auto_539467 ) ) ( not ( = ?auto_539461 ?auto_539462 ) ) ( not ( = ?auto_539461 ?auto_539463 ) ) ( not ( = ?auto_539461 ?auto_539464 ) ) ( not ( = ?auto_539461 ?auto_539465 ) ) ( not ( = ?auto_539461 ?auto_539466 ) ) ( not ( = ?auto_539461 ?auto_539467 ) ) ( not ( = ?auto_539462 ?auto_539463 ) ) ( not ( = ?auto_539462 ?auto_539464 ) ) ( not ( = ?auto_539462 ?auto_539465 ) ) ( not ( = ?auto_539462 ?auto_539466 ) ) ( not ( = ?auto_539462 ?auto_539467 ) ) ( not ( = ?auto_539463 ?auto_539464 ) ) ( not ( = ?auto_539463 ?auto_539465 ) ) ( not ( = ?auto_539463 ?auto_539466 ) ) ( not ( = ?auto_539463 ?auto_539467 ) ) ( not ( = ?auto_539464 ?auto_539465 ) ) ( not ( = ?auto_539464 ?auto_539466 ) ) ( not ( = ?auto_539464 ?auto_539467 ) ) ( not ( = ?auto_539465 ?auto_539466 ) ) ( not ( = ?auto_539465 ?auto_539467 ) ) ( not ( = ?auto_539466 ?auto_539467 ) ) ( ON ?auto_539466 ?auto_539467 ) ( ON ?auto_539465 ?auto_539466 ) ( ON ?auto_539464 ?auto_539465 ) ( CLEAR ?auto_539462 ) ( ON ?auto_539463 ?auto_539464 ) ( CLEAR ?auto_539463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_539452 ?auto_539453 ?auto_539454 ?auto_539455 ?auto_539456 ?auto_539457 ?auto_539458 ?auto_539459 ?auto_539460 ?auto_539461 ?auto_539462 ?auto_539463 )
      ( MAKE-16PILE ?auto_539452 ?auto_539453 ?auto_539454 ?auto_539455 ?auto_539456 ?auto_539457 ?auto_539458 ?auto_539459 ?auto_539460 ?auto_539461 ?auto_539462 ?auto_539463 ?auto_539464 ?auto_539465 ?auto_539466 ?auto_539467 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539484 - BLOCK
      ?auto_539485 - BLOCK
      ?auto_539486 - BLOCK
      ?auto_539487 - BLOCK
      ?auto_539488 - BLOCK
      ?auto_539489 - BLOCK
      ?auto_539490 - BLOCK
      ?auto_539491 - BLOCK
      ?auto_539492 - BLOCK
      ?auto_539493 - BLOCK
      ?auto_539494 - BLOCK
      ?auto_539495 - BLOCK
      ?auto_539496 - BLOCK
      ?auto_539497 - BLOCK
      ?auto_539498 - BLOCK
      ?auto_539499 - BLOCK
    )
    :vars
    (
      ?auto_539500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539499 ?auto_539500 ) ( ON-TABLE ?auto_539484 ) ( ON ?auto_539485 ?auto_539484 ) ( ON ?auto_539486 ?auto_539485 ) ( ON ?auto_539487 ?auto_539486 ) ( ON ?auto_539488 ?auto_539487 ) ( ON ?auto_539489 ?auto_539488 ) ( ON ?auto_539490 ?auto_539489 ) ( ON ?auto_539491 ?auto_539490 ) ( ON ?auto_539492 ?auto_539491 ) ( ON ?auto_539493 ?auto_539492 ) ( not ( = ?auto_539484 ?auto_539485 ) ) ( not ( = ?auto_539484 ?auto_539486 ) ) ( not ( = ?auto_539484 ?auto_539487 ) ) ( not ( = ?auto_539484 ?auto_539488 ) ) ( not ( = ?auto_539484 ?auto_539489 ) ) ( not ( = ?auto_539484 ?auto_539490 ) ) ( not ( = ?auto_539484 ?auto_539491 ) ) ( not ( = ?auto_539484 ?auto_539492 ) ) ( not ( = ?auto_539484 ?auto_539493 ) ) ( not ( = ?auto_539484 ?auto_539494 ) ) ( not ( = ?auto_539484 ?auto_539495 ) ) ( not ( = ?auto_539484 ?auto_539496 ) ) ( not ( = ?auto_539484 ?auto_539497 ) ) ( not ( = ?auto_539484 ?auto_539498 ) ) ( not ( = ?auto_539484 ?auto_539499 ) ) ( not ( = ?auto_539484 ?auto_539500 ) ) ( not ( = ?auto_539485 ?auto_539486 ) ) ( not ( = ?auto_539485 ?auto_539487 ) ) ( not ( = ?auto_539485 ?auto_539488 ) ) ( not ( = ?auto_539485 ?auto_539489 ) ) ( not ( = ?auto_539485 ?auto_539490 ) ) ( not ( = ?auto_539485 ?auto_539491 ) ) ( not ( = ?auto_539485 ?auto_539492 ) ) ( not ( = ?auto_539485 ?auto_539493 ) ) ( not ( = ?auto_539485 ?auto_539494 ) ) ( not ( = ?auto_539485 ?auto_539495 ) ) ( not ( = ?auto_539485 ?auto_539496 ) ) ( not ( = ?auto_539485 ?auto_539497 ) ) ( not ( = ?auto_539485 ?auto_539498 ) ) ( not ( = ?auto_539485 ?auto_539499 ) ) ( not ( = ?auto_539485 ?auto_539500 ) ) ( not ( = ?auto_539486 ?auto_539487 ) ) ( not ( = ?auto_539486 ?auto_539488 ) ) ( not ( = ?auto_539486 ?auto_539489 ) ) ( not ( = ?auto_539486 ?auto_539490 ) ) ( not ( = ?auto_539486 ?auto_539491 ) ) ( not ( = ?auto_539486 ?auto_539492 ) ) ( not ( = ?auto_539486 ?auto_539493 ) ) ( not ( = ?auto_539486 ?auto_539494 ) ) ( not ( = ?auto_539486 ?auto_539495 ) ) ( not ( = ?auto_539486 ?auto_539496 ) ) ( not ( = ?auto_539486 ?auto_539497 ) ) ( not ( = ?auto_539486 ?auto_539498 ) ) ( not ( = ?auto_539486 ?auto_539499 ) ) ( not ( = ?auto_539486 ?auto_539500 ) ) ( not ( = ?auto_539487 ?auto_539488 ) ) ( not ( = ?auto_539487 ?auto_539489 ) ) ( not ( = ?auto_539487 ?auto_539490 ) ) ( not ( = ?auto_539487 ?auto_539491 ) ) ( not ( = ?auto_539487 ?auto_539492 ) ) ( not ( = ?auto_539487 ?auto_539493 ) ) ( not ( = ?auto_539487 ?auto_539494 ) ) ( not ( = ?auto_539487 ?auto_539495 ) ) ( not ( = ?auto_539487 ?auto_539496 ) ) ( not ( = ?auto_539487 ?auto_539497 ) ) ( not ( = ?auto_539487 ?auto_539498 ) ) ( not ( = ?auto_539487 ?auto_539499 ) ) ( not ( = ?auto_539487 ?auto_539500 ) ) ( not ( = ?auto_539488 ?auto_539489 ) ) ( not ( = ?auto_539488 ?auto_539490 ) ) ( not ( = ?auto_539488 ?auto_539491 ) ) ( not ( = ?auto_539488 ?auto_539492 ) ) ( not ( = ?auto_539488 ?auto_539493 ) ) ( not ( = ?auto_539488 ?auto_539494 ) ) ( not ( = ?auto_539488 ?auto_539495 ) ) ( not ( = ?auto_539488 ?auto_539496 ) ) ( not ( = ?auto_539488 ?auto_539497 ) ) ( not ( = ?auto_539488 ?auto_539498 ) ) ( not ( = ?auto_539488 ?auto_539499 ) ) ( not ( = ?auto_539488 ?auto_539500 ) ) ( not ( = ?auto_539489 ?auto_539490 ) ) ( not ( = ?auto_539489 ?auto_539491 ) ) ( not ( = ?auto_539489 ?auto_539492 ) ) ( not ( = ?auto_539489 ?auto_539493 ) ) ( not ( = ?auto_539489 ?auto_539494 ) ) ( not ( = ?auto_539489 ?auto_539495 ) ) ( not ( = ?auto_539489 ?auto_539496 ) ) ( not ( = ?auto_539489 ?auto_539497 ) ) ( not ( = ?auto_539489 ?auto_539498 ) ) ( not ( = ?auto_539489 ?auto_539499 ) ) ( not ( = ?auto_539489 ?auto_539500 ) ) ( not ( = ?auto_539490 ?auto_539491 ) ) ( not ( = ?auto_539490 ?auto_539492 ) ) ( not ( = ?auto_539490 ?auto_539493 ) ) ( not ( = ?auto_539490 ?auto_539494 ) ) ( not ( = ?auto_539490 ?auto_539495 ) ) ( not ( = ?auto_539490 ?auto_539496 ) ) ( not ( = ?auto_539490 ?auto_539497 ) ) ( not ( = ?auto_539490 ?auto_539498 ) ) ( not ( = ?auto_539490 ?auto_539499 ) ) ( not ( = ?auto_539490 ?auto_539500 ) ) ( not ( = ?auto_539491 ?auto_539492 ) ) ( not ( = ?auto_539491 ?auto_539493 ) ) ( not ( = ?auto_539491 ?auto_539494 ) ) ( not ( = ?auto_539491 ?auto_539495 ) ) ( not ( = ?auto_539491 ?auto_539496 ) ) ( not ( = ?auto_539491 ?auto_539497 ) ) ( not ( = ?auto_539491 ?auto_539498 ) ) ( not ( = ?auto_539491 ?auto_539499 ) ) ( not ( = ?auto_539491 ?auto_539500 ) ) ( not ( = ?auto_539492 ?auto_539493 ) ) ( not ( = ?auto_539492 ?auto_539494 ) ) ( not ( = ?auto_539492 ?auto_539495 ) ) ( not ( = ?auto_539492 ?auto_539496 ) ) ( not ( = ?auto_539492 ?auto_539497 ) ) ( not ( = ?auto_539492 ?auto_539498 ) ) ( not ( = ?auto_539492 ?auto_539499 ) ) ( not ( = ?auto_539492 ?auto_539500 ) ) ( not ( = ?auto_539493 ?auto_539494 ) ) ( not ( = ?auto_539493 ?auto_539495 ) ) ( not ( = ?auto_539493 ?auto_539496 ) ) ( not ( = ?auto_539493 ?auto_539497 ) ) ( not ( = ?auto_539493 ?auto_539498 ) ) ( not ( = ?auto_539493 ?auto_539499 ) ) ( not ( = ?auto_539493 ?auto_539500 ) ) ( not ( = ?auto_539494 ?auto_539495 ) ) ( not ( = ?auto_539494 ?auto_539496 ) ) ( not ( = ?auto_539494 ?auto_539497 ) ) ( not ( = ?auto_539494 ?auto_539498 ) ) ( not ( = ?auto_539494 ?auto_539499 ) ) ( not ( = ?auto_539494 ?auto_539500 ) ) ( not ( = ?auto_539495 ?auto_539496 ) ) ( not ( = ?auto_539495 ?auto_539497 ) ) ( not ( = ?auto_539495 ?auto_539498 ) ) ( not ( = ?auto_539495 ?auto_539499 ) ) ( not ( = ?auto_539495 ?auto_539500 ) ) ( not ( = ?auto_539496 ?auto_539497 ) ) ( not ( = ?auto_539496 ?auto_539498 ) ) ( not ( = ?auto_539496 ?auto_539499 ) ) ( not ( = ?auto_539496 ?auto_539500 ) ) ( not ( = ?auto_539497 ?auto_539498 ) ) ( not ( = ?auto_539497 ?auto_539499 ) ) ( not ( = ?auto_539497 ?auto_539500 ) ) ( not ( = ?auto_539498 ?auto_539499 ) ) ( not ( = ?auto_539498 ?auto_539500 ) ) ( not ( = ?auto_539499 ?auto_539500 ) ) ( ON ?auto_539498 ?auto_539499 ) ( ON ?auto_539497 ?auto_539498 ) ( ON ?auto_539496 ?auto_539497 ) ( ON ?auto_539495 ?auto_539496 ) ( CLEAR ?auto_539493 ) ( ON ?auto_539494 ?auto_539495 ) ( CLEAR ?auto_539494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_539484 ?auto_539485 ?auto_539486 ?auto_539487 ?auto_539488 ?auto_539489 ?auto_539490 ?auto_539491 ?auto_539492 ?auto_539493 ?auto_539494 )
      ( MAKE-16PILE ?auto_539484 ?auto_539485 ?auto_539486 ?auto_539487 ?auto_539488 ?auto_539489 ?auto_539490 ?auto_539491 ?auto_539492 ?auto_539493 ?auto_539494 ?auto_539495 ?auto_539496 ?auto_539497 ?auto_539498 ?auto_539499 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539517 - BLOCK
      ?auto_539518 - BLOCK
      ?auto_539519 - BLOCK
      ?auto_539520 - BLOCK
      ?auto_539521 - BLOCK
      ?auto_539522 - BLOCK
      ?auto_539523 - BLOCK
      ?auto_539524 - BLOCK
      ?auto_539525 - BLOCK
      ?auto_539526 - BLOCK
      ?auto_539527 - BLOCK
      ?auto_539528 - BLOCK
      ?auto_539529 - BLOCK
      ?auto_539530 - BLOCK
      ?auto_539531 - BLOCK
      ?auto_539532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539532 ) ( ON-TABLE ?auto_539517 ) ( ON ?auto_539518 ?auto_539517 ) ( ON ?auto_539519 ?auto_539518 ) ( ON ?auto_539520 ?auto_539519 ) ( ON ?auto_539521 ?auto_539520 ) ( ON ?auto_539522 ?auto_539521 ) ( ON ?auto_539523 ?auto_539522 ) ( ON ?auto_539524 ?auto_539523 ) ( ON ?auto_539525 ?auto_539524 ) ( ON ?auto_539526 ?auto_539525 ) ( not ( = ?auto_539517 ?auto_539518 ) ) ( not ( = ?auto_539517 ?auto_539519 ) ) ( not ( = ?auto_539517 ?auto_539520 ) ) ( not ( = ?auto_539517 ?auto_539521 ) ) ( not ( = ?auto_539517 ?auto_539522 ) ) ( not ( = ?auto_539517 ?auto_539523 ) ) ( not ( = ?auto_539517 ?auto_539524 ) ) ( not ( = ?auto_539517 ?auto_539525 ) ) ( not ( = ?auto_539517 ?auto_539526 ) ) ( not ( = ?auto_539517 ?auto_539527 ) ) ( not ( = ?auto_539517 ?auto_539528 ) ) ( not ( = ?auto_539517 ?auto_539529 ) ) ( not ( = ?auto_539517 ?auto_539530 ) ) ( not ( = ?auto_539517 ?auto_539531 ) ) ( not ( = ?auto_539517 ?auto_539532 ) ) ( not ( = ?auto_539518 ?auto_539519 ) ) ( not ( = ?auto_539518 ?auto_539520 ) ) ( not ( = ?auto_539518 ?auto_539521 ) ) ( not ( = ?auto_539518 ?auto_539522 ) ) ( not ( = ?auto_539518 ?auto_539523 ) ) ( not ( = ?auto_539518 ?auto_539524 ) ) ( not ( = ?auto_539518 ?auto_539525 ) ) ( not ( = ?auto_539518 ?auto_539526 ) ) ( not ( = ?auto_539518 ?auto_539527 ) ) ( not ( = ?auto_539518 ?auto_539528 ) ) ( not ( = ?auto_539518 ?auto_539529 ) ) ( not ( = ?auto_539518 ?auto_539530 ) ) ( not ( = ?auto_539518 ?auto_539531 ) ) ( not ( = ?auto_539518 ?auto_539532 ) ) ( not ( = ?auto_539519 ?auto_539520 ) ) ( not ( = ?auto_539519 ?auto_539521 ) ) ( not ( = ?auto_539519 ?auto_539522 ) ) ( not ( = ?auto_539519 ?auto_539523 ) ) ( not ( = ?auto_539519 ?auto_539524 ) ) ( not ( = ?auto_539519 ?auto_539525 ) ) ( not ( = ?auto_539519 ?auto_539526 ) ) ( not ( = ?auto_539519 ?auto_539527 ) ) ( not ( = ?auto_539519 ?auto_539528 ) ) ( not ( = ?auto_539519 ?auto_539529 ) ) ( not ( = ?auto_539519 ?auto_539530 ) ) ( not ( = ?auto_539519 ?auto_539531 ) ) ( not ( = ?auto_539519 ?auto_539532 ) ) ( not ( = ?auto_539520 ?auto_539521 ) ) ( not ( = ?auto_539520 ?auto_539522 ) ) ( not ( = ?auto_539520 ?auto_539523 ) ) ( not ( = ?auto_539520 ?auto_539524 ) ) ( not ( = ?auto_539520 ?auto_539525 ) ) ( not ( = ?auto_539520 ?auto_539526 ) ) ( not ( = ?auto_539520 ?auto_539527 ) ) ( not ( = ?auto_539520 ?auto_539528 ) ) ( not ( = ?auto_539520 ?auto_539529 ) ) ( not ( = ?auto_539520 ?auto_539530 ) ) ( not ( = ?auto_539520 ?auto_539531 ) ) ( not ( = ?auto_539520 ?auto_539532 ) ) ( not ( = ?auto_539521 ?auto_539522 ) ) ( not ( = ?auto_539521 ?auto_539523 ) ) ( not ( = ?auto_539521 ?auto_539524 ) ) ( not ( = ?auto_539521 ?auto_539525 ) ) ( not ( = ?auto_539521 ?auto_539526 ) ) ( not ( = ?auto_539521 ?auto_539527 ) ) ( not ( = ?auto_539521 ?auto_539528 ) ) ( not ( = ?auto_539521 ?auto_539529 ) ) ( not ( = ?auto_539521 ?auto_539530 ) ) ( not ( = ?auto_539521 ?auto_539531 ) ) ( not ( = ?auto_539521 ?auto_539532 ) ) ( not ( = ?auto_539522 ?auto_539523 ) ) ( not ( = ?auto_539522 ?auto_539524 ) ) ( not ( = ?auto_539522 ?auto_539525 ) ) ( not ( = ?auto_539522 ?auto_539526 ) ) ( not ( = ?auto_539522 ?auto_539527 ) ) ( not ( = ?auto_539522 ?auto_539528 ) ) ( not ( = ?auto_539522 ?auto_539529 ) ) ( not ( = ?auto_539522 ?auto_539530 ) ) ( not ( = ?auto_539522 ?auto_539531 ) ) ( not ( = ?auto_539522 ?auto_539532 ) ) ( not ( = ?auto_539523 ?auto_539524 ) ) ( not ( = ?auto_539523 ?auto_539525 ) ) ( not ( = ?auto_539523 ?auto_539526 ) ) ( not ( = ?auto_539523 ?auto_539527 ) ) ( not ( = ?auto_539523 ?auto_539528 ) ) ( not ( = ?auto_539523 ?auto_539529 ) ) ( not ( = ?auto_539523 ?auto_539530 ) ) ( not ( = ?auto_539523 ?auto_539531 ) ) ( not ( = ?auto_539523 ?auto_539532 ) ) ( not ( = ?auto_539524 ?auto_539525 ) ) ( not ( = ?auto_539524 ?auto_539526 ) ) ( not ( = ?auto_539524 ?auto_539527 ) ) ( not ( = ?auto_539524 ?auto_539528 ) ) ( not ( = ?auto_539524 ?auto_539529 ) ) ( not ( = ?auto_539524 ?auto_539530 ) ) ( not ( = ?auto_539524 ?auto_539531 ) ) ( not ( = ?auto_539524 ?auto_539532 ) ) ( not ( = ?auto_539525 ?auto_539526 ) ) ( not ( = ?auto_539525 ?auto_539527 ) ) ( not ( = ?auto_539525 ?auto_539528 ) ) ( not ( = ?auto_539525 ?auto_539529 ) ) ( not ( = ?auto_539525 ?auto_539530 ) ) ( not ( = ?auto_539525 ?auto_539531 ) ) ( not ( = ?auto_539525 ?auto_539532 ) ) ( not ( = ?auto_539526 ?auto_539527 ) ) ( not ( = ?auto_539526 ?auto_539528 ) ) ( not ( = ?auto_539526 ?auto_539529 ) ) ( not ( = ?auto_539526 ?auto_539530 ) ) ( not ( = ?auto_539526 ?auto_539531 ) ) ( not ( = ?auto_539526 ?auto_539532 ) ) ( not ( = ?auto_539527 ?auto_539528 ) ) ( not ( = ?auto_539527 ?auto_539529 ) ) ( not ( = ?auto_539527 ?auto_539530 ) ) ( not ( = ?auto_539527 ?auto_539531 ) ) ( not ( = ?auto_539527 ?auto_539532 ) ) ( not ( = ?auto_539528 ?auto_539529 ) ) ( not ( = ?auto_539528 ?auto_539530 ) ) ( not ( = ?auto_539528 ?auto_539531 ) ) ( not ( = ?auto_539528 ?auto_539532 ) ) ( not ( = ?auto_539529 ?auto_539530 ) ) ( not ( = ?auto_539529 ?auto_539531 ) ) ( not ( = ?auto_539529 ?auto_539532 ) ) ( not ( = ?auto_539530 ?auto_539531 ) ) ( not ( = ?auto_539530 ?auto_539532 ) ) ( not ( = ?auto_539531 ?auto_539532 ) ) ( ON ?auto_539531 ?auto_539532 ) ( ON ?auto_539530 ?auto_539531 ) ( ON ?auto_539529 ?auto_539530 ) ( ON ?auto_539528 ?auto_539529 ) ( CLEAR ?auto_539526 ) ( ON ?auto_539527 ?auto_539528 ) ( CLEAR ?auto_539527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_539517 ?auto_539518 ?auto_539519 ?auto_539520 ?auto_539521 ?auto_539522 ?auto_539523 ?auto_539524 ?auto_539525 ?auto_539526 ?auto_539527 )
      ( MAKE-16PILE ?auto_539517 ?auto_539518 ?auto_539519 ?auto_539520 ?auto_539521 ?auto_539522 ?auto_539523 ?auto_539524 ?auto_539525 ?auto_539526 ?auto_539527 ?auto_539528 ?auto_539529 ?auto_539530 ?auto_539531 ?auto_539532 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539549 - BLOCK
      ?auto_539550 - BLOCK
      ?auto_539551 - BLOCK
      ?auto_539552 - BLOCK
      ?auto_539553 - BLOCK
      ?auto_539554 - BLOCK
      ?auto_539555 - BLOCK
      ?auto_539556 - BLOCK
      ?auto_539557 - BLOCK
      ?auto_539558 - BLOCK
      ?auto_539559 - BLOCK
      ?auto_539560 - BLOCK
      ?auto_539561 - BLOCK
      ?auto_539562 - BLOCK
      ?auto_539563 - BLOCK
      ?auto_539564 - BLOCK
    )
    :vars
    (
      ?auto_539565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539564 ?auto_539565 ) ( ON-TABLE ?auto_539549 ) ( ON ?auto_539550 ?auto_539549 ) ( ON ?auto_539551 ?auto_539550 ) ( ON ?auto_539552 ?auto_539551 ) ( ON ?auto_539553 ?auto_539552 ) ( ON ?auto_539554 ?auto_539553 ) ( ON ?auto_539555 ?auto_539554 ) ( ON ?auto_539556 ?auto_539555 ) ( ON ?auto_539557 ?auto_539556 ) ( not ( = ?auto_539549 ?auto_539550 ) ) ( not ( = ?auto_539549 ?auto_539551 ) ) ( not ( = ?auto_539549 ?auto_539552 ) ) ( not ( = ?auto_539549 ?auto_539553 ) ) ( not ( = ?auto_539549 ?auto_539554 ) ) ( not ( = ?auto_539549 ?auto_539555 ) ) ( not ( = ?auto_539549 ?auto_539556 ) ) ( not ( = ?auto_539549 ?auto_539557 ) ) ( not ( = ?auto_539549 ?auto_539558 ) ) ( not ( = ?auto_539549 ?auto_539559 ) ) ( not ( = ?auto_539549 ?auto_539560 ) ) ( not ( = ?auto_539549 ?auto_539561 ) ) ( not ( = ?auto_539549 ?auto_539562 ) ) ( not ( = ?auto_539549 ?auto_539563 ) ) ( not ( = ?auto_539549 ?auto_539564 ) ) ( not ( = ?auto_539549 ?auto_539565 ) ) ( not ( = ?auto_539550 ?auto_539551 ) ) ( not ( = ?auto_539550 ?auto_539552 ) ) ( not ( = ?auto_539550 ?auto_539553 ) ) ( not ( = ?auto_539550 ?auto_539554 ) ) ( not ( = ?auto_539550 ?auto_539555 ) ) ( not ( = ?auto_539550 ?auto_539556 ) ) ( not ( = ?auto_539550 ?auto_539557 ) ) ( not ( = ?auto_539550 ?auto_539558 ) ) ( not ( = ?auto_539550 ?auto_539559 ) ) ( not ( = ?auto_539550 ?auto_539560 ) ) ( not ( = ?auto_539550 ?auto_539561 ) ) ( not ( = ?auto_539550 ?auto_539562 ) ) ( not ( = ?auto_539550 ?auto_539563 ) ) ( not ( = ?auto_539550 ?auto_539564 ) ) ( not ( = ?auto_539550 ?auto_539565 ) ) ( not ( = ?auto_539551 ?auto_539552 ) ) ( not ( = ?auto_539551 ?auto_539553 ) ) ( not ( = ?auto_539551 ?auto_539554 ) ) ( not ( = ?auto_539551 ?auto_539555 ) ) ( not ( = ?auto_539551 ?auto_539556 ) ) ( not ( = ?auto_539551 ?auto_539557 ) ) ( not ( = ?auto_539551 ?auto_539558 ) ) ( not ( = ?auto_539551 ?auto_539559 ) ) ( not ( = ?auto_539551 ?auto_539560 ) ) ( not ( = ?auto_539551 ?auto_539561 ) ) ( not ( = ?auto_539551 ?auto_539562 ) ) ( not ( = ?auto_539551 ?auto_539563 ) ) ( not ( = ?auto_539551 ?auto_539564 ) ) ( not ( = ?auto_539551 ?auto_539565 ) ) ( not ( = ?auto_539552 ?auto_539553 ) ) ( not ( = ?auto_539552 ?auto_539554 ) ) ( not ( = ?auto_539552 ?auto_539555 ) ) ( not ( = ?auto_539552 ?auto_539556 ) ) ( not ( = ?auto_539552 ?auto_539557 ) ) ( not ( = ?auto_539552 ?auto_539558 ) ) ( not ( = ?auto_539552 ?auto_539559 ) ) ( not ( = ?auto_539552 ?auto_539560 ) ) ( not ( = ?auto_539552 ?auto_539561 ) ) ( not ( = ?auto_539552 ?auto_539562 ) ) ( not ( = ?auto_539552 ?auto_539563 ) ) ( not ( = ?auto_539552 ?auto_539564 ) ) ( not ( = ?auto_539552 ?auto_539565 ) ) ( not ( = ?auto_539553 ?auto_539554 ) ) ( not ( = ?auto_539553 ?auto_539555 ) ) ( not ( = ?auto_539553 ?auto_539556 ) ) ( not ( = ?auto_539553 ?auto_539557 ) ) ( not ( = ?auto_539553 ?auto_539558 ) ) ( not ( = ?auto_539553 ?auto_539559 ) ) ( not ( = ?auto_539553 ?auto_539560 ) ) ( not ( = ?auto_539553 ?auto_539561 ) ) ( not ( = ?auto_539553 ?auto_539562 ) ) ( not ( = ?auto_539553 ?auto_539563 ) ) ( not ( = ?auto_539553 ?auto_539564 ) ) ( not ( = ?auto_539553 ?auto_539565 ) ) ( not ( = ?auto_539554 ?auto_539555 ) ) ( not ( = ?auto_539554 ?auto_539556 ) ) ( not ( = ?auto_539554 ?auto_539557 ) ) ( not ( = ?auto_539554 ?auto_539558 ) ) ( not ( = ?auto_539554 ?auto_539559 ) ) ( not ( = ?auto_539554 ?auto_539560 ) ) ( not ( = ?auto_539554 ?auto_539561 ) ) ( not ( = ?auto_539554 ?auto_539562 ) ) ( not ( = ?auto_539554 ?auto_539563 ) ) ( not ( = ?auto_539554 ?auto_539564 ) ) ( not ( = ?auto_539554 ?auto_539565 ) ) ( not ( = ?auto_539555 ?auto_539556 ) ) ( not ( = ?auto_539555 ?auto_539557 ) ) ( not ( = ?auto_539555 ?auto_539558 ) ) ( not ( = ?auto_539555 ?auto_539559 ) ) ( not ( = ?auto_539555 ?auto_539560 ) ) ( not ( = ?auto_539555 ?auto_539561 ) ) ( not ( = ?auto_539555 ?auto_539562 ) ) ( not ( = ?auto_539555 ?auto_539563 ) ) ( not ( = ?auto_539555 ?auto_539564 ) ) ( not ( = ?auto_539555 ?auto_539565 ) ) ( not ( = ?auto_539556 ?auto_539557 ) ) ( not ( = ?auto_539556 ?auto_539558 ) ) ( not ( = ?auto_539556 ?auto_539559 ) ) ( not ( = ?auto_539556 ?auto_539560 ) ) ( not ( = ?auto_539556 ?auto_539561 ) ) ( not ( = ?auto_539556 ?auto_539562 ) ) ( not ( = ?auto_539556 ?auto_539563 ) ) ( not ( = ?auto_539556 ?auto_539564 ) ) ( not ( = ?auto_539556 ?auto_539565 ) ) ( not ( = ?auto_539557 ?auto_539558 ) ) ( not ( = ?auto_539557 ?auto_539559 ) ) ( not ( = ?auto_539557 ?auto_539560 ) ) ( not ( = ?auto_539557 ?auto_539561 ) ) ( not ( = ?auto_539557 ?auto_539562 ) ) ( not ( = ?auto_539557 ?auto_539563 ) ) ( not ( = ?auto_539557 ?auto_539564 ) ) ( not ( = ?auto_539557 ?auto_539565 ) ) ( not ( = ?auto_539558 ?auto_539559 ) ) ( not ( = ?auto_539558 ?auto_539560 ) ) ( not ( = ?auto_539558 ?auto_539561 ) ) ( not ( = ?auto_539558 ?auto_539562 ) ) ( not ( = ?auto_539558 ?auto_539563 ) ) ( not ( = ?auto_539558 ?auto_539564 ) ) ( not ( = ?auto_539558 ?auto_539565 ) ) ( not ( = ?auto_539559 ?auto_539560 ) ) ( not ( = ?auto_539559 ?auto_539561 ) ) ( not ( = ?auto_539559 ?auto_539562 ) ) ( not ( = ?auto_539559 ?auto_539563 ) ) ( not ( = ?auto_539559 ?auto_539564 ) ) ( not ( = ?auto_539559 ?auto_539565 ) ) ( not ( = ?auto_539560 ?auto_539561 ) ) ( not ( = ?auto_539560 ?auto_539562 ) ) ( not ( = ?auto_539560 ?auto_539563 ) ) ( not ( = ?auto_539560 ?auto_539564 ) ) ( not ( = ?auto_539560 ?auto_539565 ) ) ( not ( = ?auto_539561 ?auto_539562 ) ) ( not ( = ?auto_539561 ?auto_539563 ) ) ( not ( = ?auto_539561 ?auto_539564 ) ) ( not ( = ?auto_539561 ?auto_539565 ) ) ( not ( = ?auto_539562 ?auto_539563 ) ) ( not ( = ?auto_539562 ?auto_539564 ) ) ( not ( = ?auto_539562 ?auto_539565 ) ) ( not ( = ?auto_539563 ?auto_539564 ) ) ( not ( = ?auto_539563 ?auto_539565 ) ) ( not ( = ?auto_539564 ?auto_539565 ) ) ( ON ?auto_539563 ?auto_539564 ) ( ON ?auto_539562 ?auto_539563 ) ( ON ?auto_539561 ?auto_539562 ) ( ON ?auto_539560 ?auto_539561 ) ( ON ?auto_539559 ?auto_539560 ) ( CLEAR ?auto_539557 ) ( ON ?auto_539558 ?auto_539559 ) ( CLEAR ?auto_539558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_539549 ?auto_539550 ?auto_539551 ?auto_539552 ?auto_539553 ?auto_539554 ?auto_539555 ?auto_539556 ?auto_539557 ?auto_539558 )
      ( MAKE-16PILE ?auto_539549 ?auto_539550 ?auto_539551 ?auto_539552 ?auto_539553 ?auto_539554 ?auto_539555 ?auto_539556 ?auto_539557 ?auto_539558 ?auto_539559 ?auto_539560 ?auto_539561 ?auto_539562 ?auto_539563 ?auto_539564 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539582 - BLOCK
      ?auto_539583 - BLOCK
      ?auto_539584 - BLOCK
      ?auto_539585 - BLOCK
      ?auto_539586 - BLOCK
      ?auto_539587 - BLOCK
      ?auto_539588 - BLOCK
      ?auto_539589 - BLOCK
      ?auto_539590 - BLOCK
      ?auto_539591 - BLOCK
      ?auto_539592 - BLOCK
      ?auto_539593 - BLOCK
      ?auto_539594 - BLOCK
      ?auto_539595 - BLOCK
      ?auto_539596 - BLOCK
      ?auto_539597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539597 ) ( ON-TABLE ?auto_539582 ) ( ON ?auto_539583 ?auto_539582 ) ( ON ?auto_539584 ?auto_539583 ) ( ON ?auto_539585 ?auto_539584 ) ( ON ?auto_539586 ?auto_539585 ) ( ON ?auto_539587 ?auto_539586 ) ( ON ?auto_539588 ?auto_539587 ) ( ON ?auto_539589 ?auto_539588 ) ( ON ?auto_539590 ?auto_539589 ) ( not ( = ?auto_539582 ?auto_539583 ) ) ( not ( = ?auto_539582 ?auto_539584 ) ) ( not ( = ?auto_539582 ?auto_539585 ) ) ( not ( = ?auto_539582 ?auto_539586 ) ) ( not ( = ?auto_539582 ?auto_539587 ) ) ( not ( = ?auto_539582 ?auto_539588 ) ) ( not ( = ?auto_539582 ?auto_539589 ) ) ( not ( = ?auto_539582 ?auto_539590 ) ) ( not ( = ?auto_539582 ?auto_539591 ) ) ( not ( = ?auto_539582 ?auto_539592 ) ) ( not ( = ?auto_539582 ?auto_539593 ) ) ( not ( = ?auto_539582 ?auto_539594 ) ) ( not ( = ?auto_539582 ?auto_539595 ) ) ( not ( = ?auto_539582 ?auto_539596 ) ) ( not ( = ?auto_539582 ?auto_539597 ) ) ( not ( = ?auto_539583 ?auto_539584 ) ) ( not ( = ?auto_539583 ?auto_539585 ) ) ( not ( = ?auto_539583 ?auto_539586 ) ) ( not ( = ?auto_539583 ?auto_539587 ) ) ( not ( = ?auto_539583 ?auto_539588 ) ) ( not ( = ?auto_539583 ?auto_539589 ) ) ( not ( = ?auto_539583 ?auto_539590 ) ) ( not ( = ?auto_539583 ?auto_539591 ) ) ( not ( = ?auto_539583 ?auto_539592 ) ) ( not ( = ?auto_539583 ?auto_539593 ) ) ( not ( = ?auto_539583 ?auto_539594 ) ) ( not ( = ?auto_539583 ?auto_539595 ) ) ( not ( = ?auto_539583 ?auto_539596 ) ) ( not ( = ?auto_539583 ?auto_539597 ) ) ( not ( = ?auto_539584 ?auto_539585 ) ) ( not ( = ?auto_539584 ?auto_539586 ) ) ( not ( = ?auto_539584 ?auto_539587 ) ) ( not ( = ?auto_539584 ?auto_539588 ) ) ( not ( = ?auto_539584 ?auto_539589 ) ) ( not ( = ?auto_539584 ?auto_539590 ) ) ( not ( = ?auto_539584 ?auto_539591 ) ) ( not ( = ?auto_539584 ?auto_539592 ) ) ( not ( = ?auto_539584 ?auto_539593 ) ) ( not ( = ?auto_539584 ?auto_539594 ) ) ( not ( = ?auto_539584 ?auto_539595 ) ) ( not ( = ?auto_539584 ?auto_539596 ) ) ( not ( = ?auto_539584 ?auto_539597 ) ) ( not ( = ?auto_539585 ?auto_539586 ) ) ( not ( = ?auto_539585 ?auto_539587 ) ) ( not ( = ?auto_539585 ?auto_539588 ) ) ( not ( = ?auto_539585 ?auto_539589 ) ) ( not ( = ?auto_539585 ?auto_539590 ) ) ( not ( = ?auto_539585 ?auto_539591 ) ) ( not ( = ?auto_539585 ?auto_539592 ) ) ( not ( = ?auto_539585 ?auto_539593 ) ) ( not ( = ?auto_539585 ?auto_539594 ) ) ( not ( = ?auto_539585 ?auto_539595 ) ) ( not ( = ?auto_539585 ?auto_539596 ) ) ( not ( = ?auto_539585 ?auto_539597 ) ) ( not ( = ?auto_539586 ?auto_539587 ) ) ( not ( = ?auto_539586 ?auto_539588 ) ) ( not ( = ?auto_539586 ?auto_539589 ) ) ( not ( = ?auto_539586 ?auto_539590 ) ) ( not ( = ?auto_539586 ?auto_539591 ) ) ( not ( = ?auto_539586 ?auto_539592 ) ) ( not ( = ?auto_539586 ?auto_539593 ) ) ( not ( = ?auto_539586 ?auto_539594 ) ) ( not ( = ?auto_539586 ?auto_539595 ) ) ( not ( = ?auto_539586 ?auto_539596 ) ) ( not ( = ?auto_539586 ?auto_539597 ) ) ( not ( = ?auto_539587 ?auto_539588 ) ) ( not ( = ?auto_539587 ?auto_539589 ) ) ( not ( = ?auto_539587 ?auto_539590 ) ) ( not ( = ?auto_539587 ?auto_539591 ) ) ( not ( = ?auto_539587 ?auto_539592 ) ) ( not ( = ?auto_539587 ?auto_539593 ) ) ( not ( = ?auto_539587 ?auto_539594 ) ) ( not ( = ?auto_539587 ?auto_539595 ) ) ( not ( = ?auto_539587 ?auto_539596 ) ) ( not ( = ?auto_539587 ?auto_539597 ) ) ( not ( = ?auto_539588 ?auto_539589 ) ) ( not ( = ?auto_539588 ?auto_539590 ) ) ( not ( = ?auto_539588 ?auto_539591 ) ) ( not ( = ?auto_539588 ?auto_539592 ) ) ( not ( = ?auto_539588 ?auto_539593 ) ) ( not ( = ?auto_539588 ?auto_539594 ) ) ( not ( = ?auto_539588 ?auto_539595 ) ) ( not ( = ?auto_539588 ?auto_539596 ) ) ( not ( = ?auto_539588 ?auto_539597 ) ) ( not ( = ?auto_539589 ?auto_539590 ) ) ( not ( = ?auto_539589 ?auto_539591 ) ) ( not ( = ?auto_539589 ?auto_539592 ) ) ( not ( = ?auto_539589 ?auto_539593 ) ) ( not ( = ?auto_539589 ?auto_539594 ) ) ( not ( = ?auto_539589 ?auto_539595 ) ) ( not ( = ?auto_539589 ?auto_539596 ) ) ( not ( = ?auto_539589 ?auto_539597 ) ) ( not ( = ?auto_539590 ?auto_539591 ) ) ( not ( = ?auto_539590 ?auto_539592 ) ) ( not ( = ?auto_539590 ?auto_539593 ) ) ( not ( = ?auto_539590 ?auto_539594 ) ) ( not ( = ?auto_539590 ?auto_539595 ) ) ( not ( = ?auto_539590 ?auto_539596 ) ) ( not ( = ?auto_539590 ?auto_539597 ) ) ( not ( = ?auto_539591 ?auto_539592 ) ) ( not ( = ?auto_539591 ?auto_539593 ) ) ( not ( = ?auto_539591 ?auto_539594 ) ) ( not ( = ?auto_539591 ?auto_539595 ) ) ( not ( = ?auto_539591 ?auto_539596 ) ) ( not ( = ?auto_539591 ?auto_539597 ) ) ( not ( = ?auto_539592 ?auto_539593 ) ) ( not ( = ?auto_539592 ?auto_539594 ) ) ( not ( = ?auto_539592 ?auto_539595 ) ) ( not ( = ?auto_539592 ?auto_539596 ) ) ( not ( = ?auto_539592 ?auto_539597 ) ) ( not ( = ?auto_539593 ?auto_539594 ) ) ( not ( = ?auto_539593 ?auto_539595 ) ) ( not ( = ?auto_539593 ?auto_539596 ) ) ( not ( = ?auto_539593 ?auto_539597 ) ) ( not ( = ?auto_539594 ?auto_539595 ) ) ( not ( = ?auto_539594 ?auto_539596 ) ) ( not ( = ?auto_539594 ?auto_539597 ) ) ( not ( = ?auto_539595 ?auto_539596 ) ) ( not ( = ?auto_539595 ?auto_539597 ) ) ( not ( = ?auto_539596 ?auto_539597 ) ) ( ON ?auto_539596 ?auto_539597 ) ( ON ?auto_539595 ?auto_539596 ) ( ON ?auto_539594 ?auto_539595 ) ( ON ?auto_539593 ?auto_539594 ) ( ON ?auto_539592 ?auto_539593 ) ( CLEAR ?auto_539590 ) ( ON ?auto_539591 ?auto_539592 ) ( CLEAR ?auto_539591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_539582 ?auto_539583 ?auto_539584 ?auto_539585 ?auto_539586 ?auto_539587 ?auto_539588 ?auto_539589 ?auto_539590 ?auto_539591 )
      ( MAKE-16PILE ?auto_539582 ?auto_539583 ?auto_539584 ?auto_539585 ?auto_539586 ?auto_539587 ?auto_539588 ?auto_539589 ?auto_539590 ?auto_539591 ?auto_539592 ?auto_539593 ?auto_539594 ?auto_539595 ?auto_539596 ?auto_539597 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539614 - BLOCK
      ?auto_539615 - BLOCK
      ?auto_539616 - BLOCK
      ?auto_539617 - BLOCK
      ?auto_539618 - BLOCK
      ?auto_539619 - BLOCK
      ?auto_539620 - BLOCK
      ?auto_539621 - BLOCK
      ?auto_539622 - BLOCK
      ?auto_539623 - BLOCK
      ?auto_539624 - BLOCK
      ?auto_539625 - BLOCK
      ?auto_539626 - BLOCK
      ?auto_539627 - BLOCK
      ?auto_539628 - BLOCK
      ?auto_539629 - BLOCK
    )
    :vars
    (
      ?auto_539630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539629 ?auto_539630 ) ( ON-TABLE ?auto_539614 ) ( ON ?auto_539615 ?auto_539614 ) ( ON ?auto_539616 ?auto_539615 ) ( ON ?auto_539617 ?auto_539616 ) ( ON ?auto_539618 ?auto_539617 ) ( ON ?auto_539619 ?auto_539618 ) ( ON ?auto_539620 ?auto_539619 ) ( ON ?auto_539621 ?auto_539620 ) ( not ( = ?auto_539614 ?auto_539615 ) ) ( not ( = ?auto_539614 ?auto_539616 ) ) ( not ( = ?auto_539614 ?auto_539617 ) ) ( not ( = ?auto_539614 ?auto_539618 ) ) ( not ( = ?auto_539614 ?auto_539619 ) ) ( not ( = ?auto_539614 ?auto_539620 ) ) ( not ( = ?auto_539614 ?auto_539621 ) ) ( not ( = ?auto_539614 ?auto_539622 ) ) ( not ( = ?auto_539614 ?auto_539623 ) ) ( not ( = ?auto_539614 ?auto_539624 ) ) ( not ( = ?auto_539614 ?auto_539625 ) ) ( not ( = ?auto_539614 ?auto_539626 ) ) ( not ( = ?auto_539614 ?auto_539627 ) ) ( not ( = ?auto_539614 ?auto_539628 ) ) ( not ( = ?auto_539614 ?auto_539629 ) ) ( not ( = ?auto_539614 ?auto_539630 ) ) ( not ( = ?auto_539615 ?auto_539616 ) ) ( not ( = ?auto_539615 ?auto_539617 ) ) ( not ( = ?auto_539615 ?auto_539618 ) ) ( not ( = ?auto_539615 ?auto_539619 ) ) ( not ( = ?auto_539615 ?auto_539620 ) ) ( not ( = ?auto_539615 ?auto_539621 ) ) ( not ( = ?auto_539615 ?auto_539622 ) ) ( not ( = ?auto_539615 ?auto_539623 ) ) ( not ( = ?auto_539615 ?auto_539624 ) ) ( not ( = ?auto_539615 ?auto_539625 ) ) ( not ( = ?auto_539615 ?auto_539626 ) ) ( not ( = ?auto_539615 ?auto_539627 ) ) ( not ( = ?auto_539615 ?auto_539628 ) ) ( not ( = ?auto_539615 ?auto_539629 ) ) ( not ( = ?auto_539615 ?auto_539630 ) ) ( not ( = ?auto_539616 ?auto_539617 ) ) ( not ( = ?auto_539616 ?auto_539618 ) ) ( not ( = ?auto_539616 ?auto_539619 ) ) ( not ( = ?auto_539616 ?auto_539620 ) ) ( not ( = ?auto_539616 ?auto_539621 ) ) ( not ( = ?auto_539616 ?auto_539622 ) ) ( not ( = ?auto_539616 ?auto_539623 ) ) ( not ( = ?auto_539616 ?auto_539624 ) ) ( not ( = ?auto_539616 ?auto_539625 ) ) ( not ( = ?auto_539616 ?auto_539626 ) ) ( not ( = ?auto_539616 ?auto_539627 ) ) ( not ( = ?auto_539616 ?auto_539628 ) ) ( not ( = ?auto_539616 ?auto_539629 ) ) ( not ( = ?auto_539616 ?auto_539630 ) ) ( not ( = ?auto_539617 ?auto_539618 ) ) ( not ( = ?auto_539617 ?auto_539619 ) ) ( not ( = ?auto_539617 ?auto_539620 ) ) ( not ( = ?auto_539617 ?auto_539621 ) ) ( not ( = ?auto_539617 ?auto_539622 ) ) ( not ( = ?auto_539617 ?auto_539623 ) ) ( not ( = ?auto_539617 ?auto_539624 ) ) ( not ( = ?auto_539617 ?auto_539625 ) ) ( not ( = ?auto_539617 ?auto_539626 ) ) ( not ( = ?auto_539617 ?auto_539627 ) ) ( not ( = ?auto_539617 ?auto_539628 ) ) ( not ( = ?auto_539617 ?auto_539629 ) ) ( not ( = ?auto_539617 ?auto_539630 ) ) ( not ( = ?auto_539618 ?auto_539619 ) ) ( not ( = ?auto_539618 ?auto_539620 ) ) ( not ( = ?auto_539618 ?auto_539621 ) ) ( not ( = ?auto_539618 ?auto_539622 ) ) ( not ( = ?auto_539618 ?auto_539623 ) ) ( not ( = ?auto_539618 ?auto_539624 ) ) ( not ( = ?auto_539618 ?auto_539625 ) ) ( not ( = ?auto_539618 ?auto_539626 ) ) ( not ( = ?auto_539618 ?auto_539627 ) ) ( not ( = ?auto_539618 ?auto_539628 ) ) ( not ( = ?auto_539618 ?auto_539629 ) ) ( not ( = ?auto_539618 ?auto_539630 ) ) ( not ( = ?auto_539619 ?auto_539620 ) ) ( not ( = ?auto_539619 ?auto_539621 ) ) ( not ( = ?auto_539619 ?auto_539622 ) ) ( not ( = ?auto_539619 ?auto_539623 ) ) ( not ( = ?auto_539619 ?auto_539624 ) ) ( not ( = ?auto_539619 ?auto_539625 ) ) ( not ( = ?auto_539619 ?auto_539626 ) ) ( not ( = ?auto_539619 ?auto_539627 ) ) ( not ( = ?auto_539619 ?auto_539628 ) ) ( not ( = ?auto_539619 ?auto_539629 ) ) ( not ( = ?auto_539619 ?auto_539630 ) ) ( not ( = ?auto_539620 ?auto_539621 ) ) ( not ( = ?auto_539620 ?auto_539622 ) ) ( not ( = ?auto_539620 ?auto_539623 ) ) ( not ( = ?auto_539620 ?auto_539624 ) ) ( not ( = ?auto_539620 ?auto_539625 ) ) ( not ( = ?auto_539620 ?auto_539626 ) ) ( not ( = ?auto_539620 ?auto_539627 ) ) ( not ( = ?auto_539620 ?auto_539628 ) ) ( not ( = ?auto_539620 ?auto_539629 ) ) ( not ( = ?auto_539620 ?auto_539630 ) ) ( not ( = ?auto_539621 ?auto_539622 ) ) ( not ( = ?auto_539621 ?auto_539623 ) ) ( not ( = ?auto_539621 ?auto_539624 ) ) ( not ( = ?auto_539621 ?auto_539625 ) ) ( not ( = ?auto_539621 ?auto_539626 ) ) ( not ( = ?auto_539621 ?auto_539627 ) ) ( not ( = ?auto_539621 ?auto_539628 ) ) ( not ( = ?auto_539621 ?auto_539629 ) ) ( not ( = ?auto_539621 ?auto_539630 ) ) ( not ( = ?auto_539622 ?auto_539623 ) ) ( not ( = ?auto_539622 ?auto_539624 ) ) ( not ( = ?auto_539622 ?auto_539625 ) ) ( not ( = ?auto_539622 ?auto_539626 ) ) ( not ( = ?auto_539622 ?auto_539627 ) ) ( not ( = ?auto_539622 ?auto_539628 ) ) ( not ( = ?auto_539622 ?auto_539629 ) ) ( not ( = ?auto_539622 ?auto_539630 ) ) ( not ( = ?auto_539623 ?auto_539624 ) ) ( not ( = ?auto_539623 ?auto_539625 ) ) ( not ( = ?auto_539623 ?auto_539626 ) ) ( not ( = ?auto_539623 ?auto_539627 ) ) ( not ( = ?auto_539623 ?auto_539628 ) ) ( not ( = ?auto_539623 ?auto_539629 ) ) ( not ( = ?auto_539623 ?auto_539630 ) ) ( not ( = ?auto_539624 ?auto_539625 ) ) ( not ( = ?auto_539624 ?auto_539626 ) ) ( not ( = ?auto_539624 ?auto_539627 ) ) ( not ( = ?auto_539624 ?auto_539628 ) ) ( not ( = ?auto_539624 ?auto_539629 ) ) ( not ( = ?auto_539624 ?auto_539630 ) ) ( not ( = ?auto_539625 ?auto_539626 ) ) ( not ( = ?auto_539625 ?auto_539627 ) ) ( not ( = ?auto_539625 ?auto_539628 ) ) ( not ( = ?auto_539625 ?auto_539629 ) ) ( not ( = ?auto_539625 ?auto_539630 ) ) ( not ( = ?auto_539626 ?auto_539627 ) ) ( not ( = ?auto_539626 ?auto_539628 ) ) ( not ( = ?auto_539626 ?auto_539629 ) ) ( not ( = ?auto_539626 ?auto_539630 ) ) ( not ( = ?auto_539627 ?auto_539628 ) ) ( not ( = ?auto_539627 ?auto_539629 ) ) ( not ( = ?auto_539627 ?auto_539630 ) ) ( not ( = ?auto_539628 ?auto_539629 ) ) ( not ( = ?auto_539628 ?auto_539630 ) ) ( not ( = ?auto_539629 ?auto_539630 ) ) ( ON ?auto_539628 ?auto_539629 ) ( ON ?auto_539627 ?auto_539628 ) ( ON ?auto_539626 ?auto_539627 ) ( ON ?auto_539625 ?auto_539626 ) ( ON ?auto_539624 ?auto_539625 ) ( ON ?auto_539623 ?auto_539624 ) ( CLEAR ?auto_539621 ) ( ON ?auto_539622 ?auto_539623 ) ( CLEAR ?auto_539622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_539614 ?auto_539615 ?auto_539616 ?auto_539617 ?auto_539618 ?auto_539619 ?auto_539620 ?auto_539621 ?auto_539622 )
      ( MAKE-16PILE ?auto_539614 ?auto_539615 ?auto_539616 ?auto_539617 ?auto_539618 ?auto_539619 ?auto_539620 ?auto_539621 ?auto_539622 ?auto_539623 ?auto_539624 ?auto_539625 ?auto_539626 ?auto_539627 ?auto_539628 ?auto_539629 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539647 - BLOCK
      ?auto_539648 - BLOCK
      ?auto_539649 - BLOCK
      ?auto_539650 - BLOCK
      ?auto_539651 - BLOCK
      ?auto_539652 - BLOCK
      ?auto_539653 - BLOCK
      ?auto_539654 - BLOCK
      ?auto_539655 - BLOCK
      ?auto_539656 - BLOCK
      ?auto_539657 - BLOCK
      ?auto_539658 - BLOCK
      ?auto_539659 - BLOCK
      ?auto_539660 - BLOCK
      ?auto_539661 - BLOCK
      ?auto_539662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539662 ) ( ON-TABLE ?auto_539647 ) ( ON ?auto_539648 ?auto_539647 ) ( ON ?auto_539649 ?auto_539648 ) ( ON ?auto_539650 ?auto_539649 ) ( ON ?auto_539651 ?auto_539650 ) ( ON ?auto_539652 ?auto_539651 ) ( ON ?auto_539653 ?auto_539652 ) ( ON ?auto_539654 ?auto_539653 ) ( not ( = ?auto_539647 ?auto_539648 ) ) ( not ( = ?auto_539647 ?auto_539649 ) ) ( not ( = ?auto_539647 ?auto_539650 ) ) ( not ( = ?auto_539647 ?auto_539651 ) ) ( not ( = ?auto_539647 ?auto_539652 ) ) ( not ( = ?auto_539647 ?auto_539653 ) ) ( not ( = ?auto_539647 ?auto_539654 ) ) ( not ( = ?auto_539647 ?auto_539655 ) ) ( not ( = ?auto_539647 ?auto_539656 ) ) ( not ( = ?auto_539647 ?auto_539657 ) ) ( not ( = ?auto_539647 ?auto_539658 ) ) ( not ( = ?auto_539647 ?auto_539659 ) ) ( not ( = ?auto_539647 ?auto_539660 ) ) ( not ( = ?auto_539647 ?auto_539661 ) ) ( not ( = ?auto_539647 ?auto_539662 ) ) ( not ( = ?auto_539648 ?auto_539649 ) ) ( not ( = ?auto_539648 ?auto_539650 ) ) ( not ( = ?auto_539648 ?auto_539651 ) ) ( not ( = ?auto_539648 ?auto_539652 ) ) ( not ( = ?auto_539648 ?auto_539653 ) ) ( not ( = ?auto_539648 ?auto_539654 ) ) ( not ( = ?auto_539648 ?auto_539655 ) ) ( not ( = ?auto_539648 ?auto_539656 ) ) ( not ( = ?auto_539648 ?auto_539657 ) ) ( not ( = ?auto_539648 ?auto_539658 ) ) ( not ( = ?auto_539648 ?auto_539659 ) ) ( not ( = ?auto_539648 ?auto_539660 ) ) ( not ( = ?auto_539648 ?auto_539661 ) ) ( not ( = ?auto_539648 ?auto_539662 ) ) ( not ( = ?auto_539649 ?auto_539650 ) ) ( not ( = ?auto_539649 ?auto_539651 ) ) ( not ( = ?auto_539649 ?auto_539652 ) ) ( not ( = ?auto_539649 ?auto_539653 ) ) ( not ( = ?auto_539649 ?auto_539654 ) ) ( not ( = ?auto_539649 ?auto_539655 ) ) ( not ( = ?auto_539649 ?auto_539656 ) ) ( not ( = ?auto_539649 ?auto_539657 ) ) ( not ( = ?auto_539649 ?auto_539658 ) ) ( not ( = ?auto_539649 ?auto_539659 ) ) ( not ( = ?auto_539649 ?auto_539660 ) ) ( not ( = ?auto_539649 ?auto_539661 ) ) ( not ( = ?auto_539649 ?auto_539662 ) ) ( not ( = ?auto_539650 ?auto_539651 ) ) ( not ( = ?auto_539650 ?auto_539652 ) ) ( not ( = ?auto_539650 ?auto_539653 ) ) ( not ( = ?auto_539650 ?auto_539654 ) ) ( not ( = ?auto_539650 ?auto_539655 ) ) ( not ( = ?auto_539650 ?auto_539656 ) ) ( not ( = ?auto_539650 ?auto_539657 ) ) ( not ( = ?auto_539650 ?auto_539658 ) ) ( not ( = ?auto_539650 ?auto_539659 ) ) ( not ( = ?auto_539650 ?auto_539660 ) ) ( not ( = ?auto_539650 ?auto_539661 ) ) ( not ( = ?auto_539650 ?auto_539662 ) ) ( not ( = ?auto_539651 ?auto_539652 ) ) ( not ( = ?auto_539651 ?auto_539653 ) ) ( not ( = ?auto_539651 ?auto_539654 ) ) ( not ( = ?auto_539651 ?auto_539655 ) ) ( not ( = ?auto_539651 ?auto_539656 ) ) ( not ( = ?auto_539651 ?auto_539657 ) ) ( not ( = ?auto_539651 ?auto_539658 ) ) ( not ( = ?auto_539651 ?auto_539659 ) ) ( not ( = ?auto_539651 ?auto_539660 ) ) ( not ( = ?auto_539651 ?auto_539661 ) ) ( not ( = ?auto_539651 ?auto_539662 ) ) ( not ( = ?auto_539652 ?auto_539653 ) ) ( not ( = ?auto_539652 ?auto_539654 ) ) ( not ( = ?auto_539652 ?auto_539655 ) ) ( not ( = ?auto_539652 ?auto_539656 ) ) ( not ( = ?auto_539652 ?auto_539657 ) ) ( not ( = ?auto_539652 ?auto_539658 ) ) ( not ( = ?auto_539652 ?auto_539659 ) ) ( not ( = ?auto_539652 ?auto_539660 ) ) ( not ( = ?auto_539652 ?auto_539661 ) ) ( not ( = ?auto_539652 ?auto_539662 ) ) ( not ( = ?auto_539653 ?auto_539654 ) ) ( not ( = ?auto_539653 ?auto_539655 ) ) ( not ( = ?auto_539653 ?auto_539656 ) ) ( not ( = ?auto_539653 ?auto_539657 ) ) ( not ( = ?auto_539653 ?auto_539658 ) ) ( not ( = ?auto_539653 ?auto_539659 ) ) ( not ( = ?auto_539653 ?auto_539660 ) ) ( not ( = ?auto_539653 ?auto_539661 ) ) ( not ( = ?auto_539653 ?auto_539662 ) ) ( not ( = ?auto_539654 ?auto_539655 ) ) ( not ( = ?auto_539654 ?auto_539656 ) ) ( not ( = ?auto_539654 ?auto_539657 ) ) ( not ( = ?auto_539654 ?auto_539658 ) ) ( not ( = ?auto_539654 ?auto_539659 ) ) ( not ( = ?auto_539654 ?auto_539660 ) ) ( not ( = ?auto_539654 ?auto_539661 ) ) ( not ( = ?auto_539654 ?auto_539662 ) ) ( not ( = ?auto_539655 ?auto_539656 ) ) ( not ( = ?auto_539655 ?auto_539657 ) ) ( not ( = ?auto_539655 ?auto_539658 ) ) ( not ( = ?auto_539655 ?auto_539659 ) ) ( not ( = ?auto_539655 ?auto_539660 ) ) ( not ( = ?auto_539655 ?auto_539661 ) ) ( not ( = ?auto_539655 ?auto_539662 ) ) ( not ( = ?auto_539656 ?auto_539657 ) ) ( not ( = ?auto_539656 ?auto_539658 ) ) ( not ( = ?auto_539656 ?auto_539659 ) ) ( not ( = ?auto_539656 ?auto_539660 ) ) ( not ( = ?auto_539656 ?auto_539661 ) ) ( not ( = ?auto_539656 ?auto_539662 ) ) ( not ( = ?auto_539657 ?auto_539658 ) ) ( not ( = ?auto_539657 ?auto_539659 ) ) ( not ( = ?auto_539657 ?auto_539660 ) ) ( not ( = ?auto_539657 ?auto_539661 ) ) ( not ( = ?auto_539657 ?auto_539662 ) ) ( not ( = ?auto_539658 ?auto_539659 ) ) ( not ( = ?auto_539658 ?auto_539660 ) ) ( not ( = ?auto_539658 ?auto_539661 ) ) ( not ( = ?auto_539658 ?auto_539662 ) ) ( not ( = ?auto_539659 ?auto_539660 ) ) ( not ( = ?auto_539659 ?auto_539661 ) ) ( not ( = ?auto_539659 ?auto_539662 ) ) ( not ( = ?auto_539660 ?auto_539661 ) ) ( not ( = ?auto_539660 ?auto_539662 ) ) ( not ( = ?auto_539661 ?auto_539662 ) ) ( ON ?auto_539661 ?auto_539662 ) ( ON ?auto_539660 ?auto_539661 ) ( ON ?auto_539659 ?auto_539660 ) ( ON ?auto_539658 ?auto_539659 ) ( ON ?auto_539657 ?auto_539658 ) ( ON ?auto_539656 ?auto_539657 ) ( CLEAR ?auto_539654 ) ( ON ?auto_539655 ?auto_539656 ) ( CLEAR ?auto_539655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_539647 ?auto_539648 ?auto_539649 ?auto_539650 ?auto_539651 ?auto_539652 ?auto_539653 ?auto_539654 ?auto_539655 )
      ( MAKE-16PILE ?auto_539647 ?auto_539648 ?auto_539649 ?auto_539650 ?auto_539651 ?auto_539652 ?auto_539653 ?auto_539654 ?auto_539655 ?auto_539656 ?auto_539657 ?auto_539658 ?auto_539659 ?auto_539660 ?auto_539661 ?auto_539662 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539679 - BLOCK
      ?auto_539680 - BLOCK
      ?auto_539681 - BLOCK
      ?auto_539682 - BLOCK
      ?auto_539683 - BLOCK
      ?auto_539684 - BLOCK
      ?auto_539685 - BLOCK
      ?auto_539686 - BLOCK
      ?auto_539687 - BLOCK
      ?auto_539688 - BLOCK
      ?auto_539689 - BLOCK
      ?auto_539690 - BLOCK
      ?auto_539691 - BLOCK
      ?auto_539692 - BLOCK
      ?auto_539693 - BLOCK
      ?auto_539694 - BLOCK
    )
    :vars
    (
      ?auto_539695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539694 ?auto_539695 ) ( ON-TABLE ?auto_539679 ) ( ON ?auto_539680 ?auto_539679 ) ( ON ?auto_539681 ?auto_539680 ) ( ON ?auto_539682 ?auto_539681 ) ( ON ?auto_539683 ?auto_539682 ) ( ON ?auto_539684 ?auto_539683 ) ( ON ?auto_539685 ?auto_539684 ) ( not ( = ?auto_539679 ?auto_539680 ) ) ( not ( = ?auto_539679 ?auto_539681 ) ) ( not ( = ?auto_539679 ?auto_539682 ) ) ( not ( = ?auto_539679 ?auto_539683 ) ) ( not ( = ?auto_539679 ?auto_539684 ) ) ( not ( = ?auto_539679 ?auto_539685 ) ) ( not ( = ?auto_539679 ?auto_539686 ) ) ( not ( = ?auto_539679 ?auto_539687 ) ) ( not ( = ?auto_539679 ?auto_539688 ) ) ( not ( = ?auto_539679 ?auto_539689 ) ) ( not ( = ?auto_539679 ?auto_539690 ) ) ( not ( = ?auto_539679 ?auto_539691 ) ) ( not ( = ?auto_539679 ?auto_539692 ) ) ( not ( = ?auto_539679 ?auto_539693 ) ) ( not ( = ?auto_539679 ?auto_539694 ) ) ( not ( = ?auto_539679 ?auto_539695 ) ) ( not ( = ?auto_539680 ?auto_539681 ) ) ( not ( = ?auto_539680 ?auto_539682 ) ) ( not ( = ?auto_539680 ?auto_539683 ) ) ( not ( = ?auto_539680 ?auto_539684 ) ) ( not ( = ?auto_539680 ?auto_539685 ) ) ( not ( = ?auto_539680 ?auto_539686 ) ) ( not ( = ?auto_539680 ?auto_539687 ) ) ( not ( = ?auto_539680 ?auto_539688 ) ) ( not ( = ?auto_539680 ?auto_539689 ) ) ( not ( = ?auto_539680 ?auto_539690 ) ) ( not ( = ?auto_539680 ?auto_539691 ) ) ( not ( = ?auto_539680 ?auto_539692 ) ) ( not ( = ?auto_539680 ?auto_539693 ) ) ( not ( = ?auto_539680 ?auto_539694 ) ) ( not ( = ?auto_539680 ?auto_539695 ) ) ( not ( = ?auto_539681 ?auto_539682 ) ) ( not ( = ?auto_539681 ?auto_539683 ) ) ( not ( = ?auto_539681 ?auto_539684 ) ) ( not ( = ?auto_539681 ?auto_539685 ) ) ( not ( = ?auto_539681 ?auto_539686 ) ) ( not ( = ?auto_539681 ?auto_539687 ) ) ( not ( = ?auto_539681 ?auto_539688 ) ) ( not ( = ?auto_539681 ?auto_539689 ) ) ( not ( = ?auto_539681 ?auto_539690 ) ) ( not ( = ?auto_539681 ?auto_539691 ) ) ( not ( = ?auto_539681 ?auto_539692 ) ) ( not ( = ?auto_539681 ?auto_539693 ) ) ( not ( = ?auto_539681 ?auto_539694 ) ) ( not ( = ?auto_539681 ?auto_539695 ) ) ( not ( = ?auto_539682 ?auto_539683 ) ) ( not ( = ?auto_539682 ?auto_539684 ) ) ( not ( = ?auto_539682 ?auto_539685 ) ) ( not ( = ?auto_539682 ?auto_539686 ) ) ( not ( = ?auto_539682 ?auto_539687 ) ) ( not ( = ?auto_539682 ?auto_539688 ) ) ( not ( = ?auto_539682 ?auto_539689 ) ) ( not ( = ?auto_539682 ?auto_539690 ) ) ( not ( = ?auto_539682 ?auto_539691 ) ) ( not ( = ?auto_539682 ?auto_539692 ) ) ( not ( = ?auto_539682 ?auto_539693 ) ) ( not ( = ?auto_539682 ?auto_539694 ) ) ( not ( = ?auto_539682 ?auto_539695 ) ) ( not ( = ?auto_539683 ?auto_539684 ) ) ( not ( = ?auto_539683 ?auto_539685 ) ) ( not ( = ?auto_539683 ?auto_539686 ) ) ( not ( = ?auto_539683 ?auto_539687 ) ) ( not ( = ?auto_539683 ?auto_539688 ) ) ( not ( = ?auto_539683 ?auto_539689 ) ) ( not ( = ?auto_539683 ?auto_539690 ) ) ( not ( = ?auto_539683 ?auto_539691 ) ) ( not ( = ?auto_539683 ?auto_539692 ) ) ( not ( = ?auto_539683 ?auto_539693 ) ) ( not ( = ?auto_539683 ?auto_539694 ) ) ( not ( = ?auto_539683 ?auto_539695 ) ) ( not ( = ?auto_539684 ?auto_539685 ) ) ( not ( = ?auto_539684 ?auto_539686 ) ) ( not ( = ?auto_539684 ?auto_539687 ) ) ( not ( = ?auto_539684 ?auto_539688 ) ) ( not ( = ?auto_539684 ?auto_539689 ) ) ( not ( = ?auto_539684 ?auto_539690 ) ) ( not ( = ?auto_539684 ?auto_539691 ) ) ( not ( = ?auto_539684 ?auto_539692 ) ) ( not ( = ?auto_539684 ?auto_539693 ) ) ( not ( = ?auto_539684 ?auto_539694 ) ) ( not ( = ?auto_539684 ?auto_539695 ) ) ( not ( = ?auto_539685 ?auto_539686 ) ) ( not ( = ?auto_539685 ?auto_539687 ) ) ( not ( = ?auto_539685 ?auto_539688 ) ) ( not ( = ?auto_539685 ?auto_539689 ) ) ( not ( = ?auto_539685 ?auto_539690 ) ) ( not ( = ?auto_539685 ?auto_539691 ) ) ( not ( = ?auto_539685 ?auto_539692 ) ) ( not ( = ?auto_539685 ?auto_539693 ) ) ( not ( = ?auto_539685 ?auto_539694 ) ) ( not ( = ?auto_539685 ?auto_539695 ) ) ( not ( = ?auto_539686 ?auto_539687 ) ) ( not ( = ?auto_539686 ?auto_539688 ) ) ( not ( = ?auto_539686 ?auto_539689 ) ) ( not ( = ?auto_539686 ?auto_539690 ) ) ( not ( = ?auto_539686 ?auto_539691 ) ) ( not ( = ?auto_539686 ?auto_539692 ) ) ( not ( = ?auto_539686 ?auto_539693 ) ) ( not ( = ?auto_539686 ?auto_539694 ) ) ( not ( = ?auto_539686 ?auto_539695 ) ) ( not ( = ?auto_539687 ?auto_539688 ) ) ( not ( = ?auto_539687 ?auto_539689 ) ) ( not ( = ?auto_539687 ?auto_539690 ) ) ( not ( = ?auto_539687 ?auto_539691 ) ) ( not ( = ?auto_539687 ?auto_539692 ) ) ( not ( = ?auto_539687 ?auto_539693 ) ) ( not ( = ?auto_539687 ?auto_539694 ) ) ( not ( = ?auto_539687 ?auto_539695 ) ) ( not ( = ?auto_539688 ?auto_539689 ) ) ( not ( = ?auto_539688 ?auto_539690 ) ) ( not ( = ?auto_539688 ?auto_539691 ) ) ( not ( = ?auto_539688 ?auto_539692 ) ) ( not ( = ?auto_539688 ?auto_539693 ) ) ( not ( = ?auto_539688 ?auto_539694 ) ) ( not ( = ?auto_539688 ?auto_539695 ) ) ( not ( = ?auto_539689 ?auto_539690 ) ) ( not ( = ?auto_539689 ?auto_539691 ) ) ( not ( = ?auto_539689 ?auto_539692 ) ) ( not ( = ?auto_539689 ?auto_539693 ) ) ( not ( = ?auto_539689 ?auto_539694 ) ) ( not ( = ?auto_539689 ?auto_539695 ) ) ( not ( = ?auto_539690 ?auto_539691 ) ) ( not ( = ?auto_539690 ?auto_539692 ) ) ( not ( = ?auto_539690 ?auto_539693 ) ) ( not ( = ?auto_539690 ?auto_539694 ) ) ( not ( = ?auto_539690 ?auto_539695 ) ) ( not ( = ?auto_539691 ?auto_539692 ) ) ( not ( = ?auto_539691 ?auto_539693 ) ) ( not ( = ?auto_539691 ?auto_539694 ) ) ( not ( = ?auto_539691 ?auto_539695 ) ) ( not ( = ?auto_539692 ?auto_539693 ) ) ( not ( = ?auto_539692 ?auto_539694 ) ) ( not ( = ?auto_539692 ?auto_539695 ) ) ( not ( = ?auto_539693 ?auto_539694 ) ) ( not ( = ?auto_539693 ?auto_539695 ) ) ( not ( = ?auto_539694 ?auto_539695 ) ) ( ON ?auto_539693 ?auto_539694 ) ( ON ?auto_539692 ?auto_539693 ) ( ON ?auto_539691 ?auto_539692 ) ( ON ?auto_539690 ?auto_539691 ) ( ON ?auto_539689 ?auto_539690 ) ( ON ?auto_539688 ?auto_539689 ) ( ON ?auto_539687 ?auto_539688 ) ( CLEAR ?auto_539685 ) ( ON ?auto_539686 ?auto_539687 ) ( CLEAR ?auto_539686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_539679 ?auto_539680 ?auto_539681 ?auto_539682 ?auto_539683 ?auto_539684 ?auto_539685 ?auto_539686 )
      ( MAKE-16PILE ?auto_539679 ?auto_539680 ?auto_539681 ?auto_539682 ?auto_539683 ?auto_539684 ?auto_539685 ?auto_539686 ?auto_539687 ?auto_539688 ?auto_539689 ?auto_539690 ?auto_539691 ?auto_539692 ?auto_539693 ?auto_539694 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539712 - BLOCK
      ?auto_539713 - BLOCK
      ?auto_539714 - BLOCK
      ?auto_539715 - BLOCK
      ?auto_539716 - BLOCK
      ?auto_539717 - BLOCK
      ?auto_539718 - BLOCK
      ?auto_539719 - BLOCK
      ?auto_539720 - BLOCK
      ?auto_539721 - BLOCK
      ?auto_539722 - BLOCK
      ?auto_539723 - BLOCK
      ?auto_539724 - BLOCK
      ?auto_539725 - BLOCK
      ?auto_539726 - BLOCK
      ?auto_539727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539727 ) ( ON-TABLE ?auto_539712 ) ( ON ?auto_539713 ?auto_539712 ) ( ON ?auto_539714 ?auto_539713 ) ( ON ?auto_539715 ?auto_539714 ) ( ON ?auto_539716 ?auto_539715 ) ( ON ?auto_539717 ?auto_539716 ) ( ON ?auto_539718 ?auto_539717 ) ( not ( = ?auto_539712 ?auto_539713 ) ) ( not ( = ?auto_539712 ?auto_539714 ) ) ( not ( = ?auto_539712 ?auto_539715 ) ) ( not ( = ?auto_539712 ?auto_539716 ) ) ( not ( = ?auto_539712 ?auto_539717 ) ) ( not ( = ?auto_539712 ?auto_539718 ) ) ( not ( = ?auto_539712 ?auto_539719 ) ) ( not ( = ?auto_539712 ?auto_539720 ) ) ( not ( = ?auto_539712 ?auto_539721 ) ) ( not ( = ?auto_539712 ?auto_539722 ) ) ( not ( = ?auto_539712 ?auto_539723 ) ) ( not ( = ?auto_539712 ?auto_539724 ) ) ( not ( = ?auto_539712 ?auto_539725 ) ) ( not ( = ?auto_539712 ?auto_539726 ) ) ( not ( = ?auto_539712 ?auto_539727 ) ) ( not ( = ?auto_539713 ?auto_539714 ) ) ( not ( = ?auto_539713 ?auto_539715 ) ) ( not ( = ?auto_539713 ?auto_539716 ) ) ( not ( = ?auto_539713 ?auto_539717 ) ) ( not ( = ?auto_539713 ?auto_539718 ) ) ( not ( = ?auto_539713 ?auto_539719 ) ) ( not ( = ?auto_539713 ?auto_539720 ) ) ( not ( = ?auto_539713 ?auto_539721 ) ) ( not ( = ?auto_539713 ?auto_539722 ) ) ( not ( = ?auto_539713 ?auto_539723 ) ) ( not ( = ?auto_539713 ?auto_539724 ) ) ( not ( = ?auto_539713 ?auto_539725 ) ) ( not ( = ?auto_539713 ?auto_539726 ) ) ( not ( = ?auto_539713 ?auto_539727 ) ) ( not ( = ?auto_539714 ?auto_539715 ) ) ( not ( = ?auto_539714 ?auto_539716 ) ) ( not ( = ?auto_539714 ?auto_539717 ) ) ( not ( = ?auto_539714 ?auto_539718 ) ) ( not ( = ?auto_539714 ?auto_539719 ) ) ( not ( = ?auto_539714 ?auto_539720 ) ) ( not ( = ?auto_539714 ?auto_539721 ) ) ( not ( = ?auto_539714 ?auto_539722 ) ) ( not ( = ?auto_539714 ?auto_539723 ) ) ( not ( = ?auto_539714 ?auto_539724 ) ) ( not ( = ?auto_539714 ?auto_539725 ) ) ( not ( = ?auto_539714 ?auto_539726 ) ) ( not ( = ?auto_539714 ?auto_539727 ) ) ( not ( = ?auto_539715 ?auto_539716 ) ) ( not ( = ?auto_539715 ?auto_539717 ) ) ( not ( = ?auto_539715 ?auto_539718 ) ) ( not ( = ?auto_539715 ?auto_539719 ) ) ( not ( = ?auto_539715 ?auto_539720 ) ) ( not ( = ?auto_539715 ?auto_539721 ) ) ( not ( = ?auto_539715 ?auto_539722 ) ) ( not ( = ?auto_539715 ?auto_539723 ) ) ( not ( = ?auto_539715 ?auto_539724 ) ) ( not ( = ?auto_539715 ?auto_539725 ) ) ( not ( = ?auto_539715 ?auto_539726 ) ) ( not ( = ?auto_539715 ?auto_539727 ) ) ( not ( = ?auto_539716 ?auto_539717 ) ) ( not ( = ?auto_539716 ?auto_539718 ) ) ( not ( = ?auto_539716 ?auto_539719 ) ) ( not ( = ?auto_539716 ?auto_539720 ) ) ( not ( = ?auto_539716 ?auto_539721 ) ) ( not ( = ?auto_539716 ?auto_539722 ) ) ( not ( = ?auto_539716 ?auto_539723 ) ) ( not ( = ?auto_539716 ?auto_539724 ) ) ( not ( = ?auto_539716 ?auto_539725 ) ) ( not ( = ?auto_539716 ?auto_539726 ) ) ( not ( = ?auto_539716 ?auto_539727 ) ) ( not ( = ?auto_539717 ?auto_539718 ) ) ( not ( = ?auto_539717 ?auto_539719 ) ) ( not ( = ?auto_539717 ?auto_539720 ) ) ( not ( = ?auto_539717 ?auto_539721 ) ) ( not ( = ?auto_539717 ?auto_539722 ) ) ( not ( = ?auto_539717 ?auto_539723 ) ) ( not ( = ?auto_539717 ?auto_539724 ) ) ( not ( = ?auto_539717 ?auto_539725 ) ) ( not ( = ?auto_539717 ?auto_539726 ) ) ( not ( = ?auto_539717 ?auto_539727 ) ) ( not ( = ?auto_539718 ?auto_539719 ) ) ( not ( = ?auto_539718 ?auto_539720 ) ) ( not ( = ?auto_539718 ?auto_539721 ) ) ( not ( = ?auto_539718 ?auto_539722 ) ) ( not ( = ?auto_539718 ?auto_539723 ) ) ( not ( = ?auto_539718 ?auto_539724 ) ) ( not ( = ?auto_539718 ?auto_539725 ) ) ( not ( = ?auto_539718 ?auto_539726 ) ) ( not ( = ?auto_539718 ?auto_539727 ) ) ( not ( = ?auto_539719 ?auto_539720 ) ) ( not ( = ?auto_539719 ?auto_539721 ) ) ( not ( = ?auto_539719 ?auto_539722 ) ) ( not ( = ?auto_539719 ?auto_539723 ) ) ( not ( = ?auto_539719 ?auto_539724 ) ) ( not ( = ?auto_539719 ?auto_539725 ) ) ( not ( = ?auto_539719 ?auto_539726 ) ) ( not ( = ?auto_539719 ?auto_539727 ) ) ( not ( = ?auto_539720 ?auto_539721 ) ) ( not ( = ?auto_539720 ?auto_539722 ) ) ( not ( = ?auto_539720 ?auto_539723 ) ) ( not ( = ?auto_539720 ?auto_539724 ) ) ( not ( = ?auto_539720 ?auto_539725 ) ) ( not ( = ?auto_539720 ?auto_539726 ) ) ( not ( = ?auto_539720 ?auto_539727 ) ) ( not ( = ?auto_539721 ?auto_539722 ) ) ( not ( = ?auto_539721 ?auto_539723 ) ) ( not ( = ?auto_539721 ?auto_539724 ) ) ( not ( = ?auto_539721 ?auto_539725 ) ) ( not ( = ?auto_539721 ?auto_539726 ) ) ( not ( = ?auto_539721 ?auto_539727 ) ) ( not ( = ?auto_539722 ?auto_539723 ) ) ( not ( = ?auto_539722 ?auto_539724 ) ) ( not ( = ?auto_539722 ?auto_539725 ) ) ( not ( = ?auto_539722 ?auto_539726 ) ) ( not ( = ?auto_539722 ?auto_539727 ) ) ( not ( = ?auto_539723 ?auto_539724 ) ) ( not ( = ?auto_539723 ?auto_539725 ) ) ( not ( = ?auto_539723 ?auto_539726 ) ) ( not ( = ?auto_539723 ?auto_539727 ) ) ( not ( = ?auto_539724 ?auto_539725 ) ) ( not ( = ?auto_539724 ?auto_539726 ) ) ( not ( = ?auto_539724 ?auto_539727 ) ) ( not ( = ?auto_539725 ?auto_539726 ) ) ( not ( = ?auto_539725 ?auto_539727 ) ) ( not ( = ?auto_539726 ?auto_539727 ) ) ( ON ?auto_539726 ?auto_539727 ) ( ON ?auto_539725 ?auto_539726 ) ( ON ?auto_539724 ?auto_539725 ) ( ON ?auto_539723 ?auto_539724 ) ( ON ?auto_539722 ?auto_539723 ) ( ON ?auto_539721 ?auto_539722 ) ( ON ?auto_539720 ?auto_539721 ) ( CLEAR ?auto_539718 ) ( ON ?auto_539719 ?auto_539720 ) ( CLEAR ?auto_539719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_539712 ?auto_539713 ?auto_539714 ?auto_539715 ?auto_539716 ?auto_539717 ?auto_539718 ?auto_539719 )
      ( MAKE-16PILE ?auto_539712 ?auto_539713 ?auto_539714 ?auto_539715 ?auto_539716 ?auto_539717 ?auto_539718 ?auto_539719 ?auto_539720 ?auto_539721 ?auto_539722 ?auto_539723 ?auto_539724 ?auto_539725 ?auto_539726 ?auto_539727 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539744 - BLOCK
      ?auto_539745 - BLOCK
      ?auto_539746 - BLOCK
      ?auto_539747 - BLOCK
      ?auto_539748 - BLOCK
      ?auto_539749 - BLOCK
      ?auto_539750 - BLOCK
      ?auto_539751 - BLOCK
      ?auto_539752 - BLOCK
      ?auto_539753 - BLOCK
      ?auto_539754 - BLOCK
      ?auto_539755 - BLOCK
      ?auto_539756 - BLOCK
      ?auto_539757 - BLOCK
      ?auto_539758 - BLOCK
      ?auto_539759 - BLOCK
    )
    :vars
    (
      ?auto_539760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539759 ?auto_539760 ) ( ON-TABLE ?auto_539744 ) ( ON ?auto_539745 ?auto_539744 ) ( ON ?auto_539746 ?auto_539745 ) ( ON ?auto_539747 ?auto_539746 ) ( ON ?auto_539748 ?auto_539747 ) ( ON ?auto_539749 ?auto_539748 ) ( not ( = ?auto_539744 ?auto_539745 ) ) ( not ( = ?auto_539744 ?auto_539746 ) ) ( not ( = ?auto_539744 ?auto_539747 ) ) ( not ( = ?auto_539744 ?auto_539748 ) ) ( not ( = ?auto_539744 ?auto_539749 ) ) ( not ( = ?auto_539744 ?auto_539750 ) ) ( not ( = ?auto_539744 ?auto_539751 ) ) ( not ( = ?auto_539744 ?auto_539752 ) ) ( not ( = ?auto_539744 ?auto_539753 ) ) ( not ( = ?auto_539744 ?auto_539754 ) ) ( not ( = ?auto_539744 ?auto_539755 ) ) ( not ( = ?auto_539744 ?auto_539756 ) ) ( not ( = ?auto_539744 ?auto_539757 ) ) ( not ( = ?auto_539744 ?auto_539758 ) ) ( not ( = ?auto_539744 ?auto_539759 ) ) ( not ( = ?auto_539744 ?auto_539760 ) ) ( not ( = ?auto_539745 ?auto_539746 ) ) ( not ( = ?auto_539745 ?auto_539747 ) ) ( not ( = ?auto_539745 ?auto_539748 ) ) ( not ( = ?auto_539745 ?auto_539749 ) ) ( not ( = ?auto_539745 ?auto_539750 ) ) ( not ( = ?auto_539745 ?auto_539751 ) ) ( not ( = ?auto_539745 ?auto_539752 ) ) ( not ( = ?auto_539745 ?auto_539753 ) ) ( not ( = ?auto_539745 ?auto_539754 ) ) ( not ( = ?auto_539745 ?auto_539755 ) ) ( not ( = ?auto_539745 ?auto_539756 ) ) ( not ( = ?auto_539745 ?auto_539757 ) ) ( not ( = ?auto_539745 ?auto_539758 ) ) ( not ( = ?auto_539745 ?auto_539759 ) ) ( not ( = ?auto_539745 ?auto_539760 ) ) ( not ( = ?auto_539746 ?auto_539747 ) ) ( not ( = ?auto_539746 ?auto_539748 ) ) ( not ( = ?auto_539746 ?auto_539749 ) ) ( not ( = ?auto_539746 ?auto_539750 ) ) ( not ( = ?auto_539746 ?auto_539751 ) ) ( not ( = ?auto_539746 ?auto_539752 ) ) ( not ( = ?auto_539746 ?auto_539753 ) ) ( not ( = ?auto_539746 ?auto_539754 ) ) ( not ( = ?auto_539746 ?auto_539755 ) ) ( not ( = ?auto_539746 ?auto_539756 ) ) ( not ( = ?auto_539746 ?auto_539757 ) ) ( not ( = ?auto_539746 ?auto_539758 ) ) ( not ( = ?auto_539746 ?auto_539759 ) ) ( not ( = ?auto_539746 ?auto_539760 ) ) ( not ( = ?auto_539747 ?auto_539748 ) ) ( not ( = ?auto_539747 ?auto_539749 ) ) ( not ( = ?auto_539747 ?auto_539750 ) ) ( not ( = ?auto_539747 ?auto_539751 ) ) ( not ( = ?auto_539747 ?auto_539752 ) ) ( not ( = ?auto_539747 ?auto_539753 ) ) ( not ( = ?auto_539747 ?auto_539754 ) ) ( not ( = ?auto_539747 ?auto_539755 ) ) ( not ( = ?auto_539747 ?auto_539756 ) ) ( not ( = ?auto_539747 ?auto_539757 ) ) ( not ( = ?auto_539747 ?auto_539758 ) ) ( not ( = ?auto_539747 ?auto_539759 ) ) ( not ( = ?auto_539747 ?auto_539760 ) ) ( not ( = ?auto_539748 ?auto_539749 ) ) ( not ( = ?auto_539748 ?auto_539750 ) ) ( not ( = ?auto_539748 ?auto_539751 ) ) ( not ( = ?auto_539748 ?auto_539752 ) ) ( not ( = ?auto_539748 ?auto_539753 ) ) ( not ( = ?auto_539748 ?auto_539754 ) ) ( not ( = ?auto_539748 ?auto_539755 ) ) ( not ( = ?auto_539748 ?auto_539756 ) ) ( not ( = ?auto_539748 ?auto_539757 ) ) ( not ( = ?auto_539748 ?auto_539758 ) ) ( not ( = ?auto_539748 ?auto_539759 ) ) ( not ( = ?auto_539748 ?auto_539760 ) ) ( not ( = ?auto_539749 ?auto_539750 ) ) ( not ( = ?auto_539749 ?auto_539751 ) ) ( not ( = ?auto_539749 ?auto_539752 ) ) ( not ( = ?auto_539749 ?auto_539753 ) ) ( not ( = ?auto_539749 ?auto_539754 ) ) ( not ( = ?auto_539749 ?auto_539755 ) ) ( not ( = ?auto_539749 ?auto_539756 ) ) ( not ( = ?auto_539749 ?auto_539757 ) ) ( not ( = ?auto_539749 ?auto_539758 ) ) ( not ( = ?auto_539749 ?auto_539759 ) ) ( not ( = ?auto_539749 ?auto_539760 ) ) ( not ( = ?auto_539750 ?auto_539751 ) ) ( not ( = ?auto_539750 ?auto_539752 ) ) ( not ( = ?auto_539750 ?auto_539753 ) ) ( not ( = ?auto_539750 ?auto_539754 ) ) ( not ( = ?auto_539750 ?auto_539755 ) ) ( not ( = ?auto_539750 ?auto_539756 ) ) ( not ( = ?auto_539750 ?auto_539757 ) ) ( not ( = ?auto_539750 ?auto_539758 ) ) ( not ( = ?auto_539750 ?auto_539759 ) ) ( not ( = ?auto_539750 ?auto_539760 ) ) ( not ( = ?auto_539751 ?auto_539752 ) ) ( not ( = ?auto_539751 ?auto_539753 ) ) ( not ( = ?auto_539751 ?auto_539754 ) ) ( not ( = ?auto_539751 ?auto_539755 ) ) ( not ( = ?auto_539751 ?auto_539756 ) ) ( not ( = ?auto_539751 ?auto_539757 ) ) ( not ( = ?auto_539751 ?auto_539758 ) ) ( not ( = ?auto_539751 ?auto_539759 ) ) ( not ( = ?auto_539751 ?auto_539760 ) ) ( not ( = ?auto_539752 ?auto_539753 ) ) ( not ( = ?auto_539752 ?auto_539754 ) ) ( not ( = ?auto_539752 ?auto_539755 ) ) ( not ( = ?auto_539752 ?auto_539756 ) ) ( not ( = ?auto_539752 ?auto_539757 ) ) ( not ( = ?auto_539752 ?auto_539758 ) ) ( not ( = ?auto_539752 ?auto_539759 ) ) ( not ( = ?auto_539752 ?auto_539760 ) ) ( not ( = ?auto_539753 ?auto_539754 ) ) ( not ( = ?auto_539753 ?auto_539755 ) ) ( not ( = ?auto_539753 ?auto_539756 ) ) ( not ( = ?auto_539753 ?auto_539757 ) ) ( not ( = ?auto_539753 ?auto_539758 ) ) ( not ( = ?auto_539753 ?auto_539759 ) ) ( not ( = ?auto_539753 ?auto_539760 ) ) ( not ( = ?auto_539754 ?auto_539755 ) ) ( not ( = ?auto_539754 ?auto_539756 ) ) ( not ( = ?auto_539754 ?auto_539757 ) ) ( not ( = ?auto_539754 ?auto_539758 ) ) ( not ( = ?auto_539754 ?auto_539759 ) ) ( not ( = ?auto_539754 ?auto_539760 ) ) ( not ( = ?auto_539755 ?auto_539756 ) ) ( not ( = ?auto_539755 ?auto_539757 ) ) ( not ( = ?auto_539755 ?auto_539758 ) ) ( not ( = ?auto_539755 ?auto_539759 ) ) ( not ( = ?auto_539755 ?auto_539760 ) ) ( not ( = ?auto_539756 ?auto_539757 ) ) ( not ( = ?auto_539756 ?auto_539758 ) ) ( not ( = ?auto_539756 ?auto_539759 ) ) ( not ( = ?auto_539756 ?auto_539760 ) ) ( not ( = ?auto_539757 ?auto_539758 ) ) ( not ( = ?auto_539757 ?auto_539759 ) ) ( not ( = ?auto_539757 ?auto_539760 ) ) ( not ( = ?auto_539758 ?auto_539759 ) ) ( not ( = ?auto_539758 ?auto_539760 ) ) ( not ( = ?auto_539759 ?auto_539760 ) ) ( ON ?auto_539758 ?auto_539759 ) ( ON ?auto_539757 ?auto_539758 ) ( ON ?auto_539756 ?auto_539757 ) ( ON ?auto_539755 ?auto_539756 ) ( ON ?auto_539754 ?auto_539755 ) ( ON ?auto_539753 ?auto_539754 ) ( ON ?auto_539752 ?auto_539753 ) ( ON ?auto_539751 ?auto_539752 ) ( CLEAR ?auto_539749 ) ( ON ?auto_539750 ?auto_539751 ) ( CLEAR ?auto_539750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_539744 ?auto_539745 ?auto_539746 ?auto_539747 ?auto_539748 ?auto_539749 ?auto_539750 )
      ( MAKE-16PILE ?auto_539744 ?auto_539745 ?auto_539746 ?auto_539747 ?auto_539748 ?auto_539749 ?auto_539750 ?auto_539751 ?auto_539752 ?auto_539753 ?auto_539754 ?auto_539755 ?auto_539756 ?auto_539757 ?auto_539758 ?auto_539759 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539777 - BLOCK
      ?auto_539778 - BLOCK
      ?auto_539779 - BLOCK
      ?auto_539780 - BLOCK
      ?auto_539781 - BLOCK
      ?auto_539782 - BLOCK
      ?auto_539783 - BLOCK
      ?auto_539784 - BLOCK
      ?auto_539785 - BLOCK
      ?auto_539786 - BLOCK
      ?auto_539787 - BLOCK
      ?auto_539788 - BLOCK
      ?auto_539789 - BLOCK
      ?auto_539790 - BLOCK
      ?auto_539791 - BLOCK
      ?auto_539792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539792 ) ( ON-TABLE ?auto_539777 ) ( ON ?auto_539778 ?auto_539777 ) ( ON ?auto_539779 ?auto_539778 ) ( ON ?auto_539780 ?auto_539779 ) ( ON ?auto_539781 ?auto_539780 ) ( ON ?auto_539782 ?auto_539781 ) ( not ( = ?auto_539777 ?auto_539778 ) ) ( not ( = ?auto_539777 ?auto_539779 ) ) ( not ( = ?auto_539777 ?auto_539780 ) ) ( not ( = ?auto_539777 ?auto_539781 ) ) ( not ( = ?auto_539777 ?auto_539782 ) ) ( not ( = ?auto_539777 ?auto_539783 ) ) ( not ( = ?auto_539777 ?auto_539784 ) ) ( not ( = ?auto_539777 ?auto_539785 ) ) ( not ( = ?auto_539777 ?auto_539786 ) ) ( not ( = ?auto_539777 ?auto_539787 ) ) ( not ( = ?auto_539777 ?auto_539788 ) ) ( not ( = ?auto_539777 ?auto_539789 ) ) ( not ( = ?auto_539777 ?auto_539790 ) ) ( not ( = ?auto_539777 ?auto_539791 ) ) ( not ( = ?auto_539777 ?auto_539792 ) ) ( not ( = ?auto_539778 ?auto_539779 ) ) ( not ( = ?auto_539778 ?auto_539780 ) ) ( not ( = ?auto_539778 ?auto_539781 ) ) ( not ( = ?auto_539778 ?auto_539782 ) ) ( not ( = ?auto_539778 ?auto_539783 ) ) ( not ( = ?auto_539778 ?auto_539784 ) ) ( not ( = ?auto_539778 ?auto_539785 ) ) ( not ( = ?auto_539778 ?auto_539786 ) ) ( not ( = ?auto_539778 ?auto_539787 ) ) ( not ( = ?auto_539778 ?auto_539788 ) ) ( not ( = ?auto_539778 ?auto_539789 ) ) ( not ( = ?auto_539778 ?auto_539790 ) ) ( not ( = ?auto_539778 ?auto_539791 ) ) ( not ( = ?auto_539778 ?auto_539792 ) ) ( not ( = ?auto_539779 ?auto_539780 ) ) ( not ( = ?auto_539779 ?auto_539781 ) ) ( not ( = ?auto_539779 ?auto_539782 ) ) ( not ( = ?auto_539779 ?auto_539783 ) ) ( not ( = ?auto_539779 ?auto_539784 ) ) ( not ( = ?auto_539779 ?auto_539785 ) ) ( not ( = ?auto_539779 ?auto_539786 ) ) ( not ( = ?auto_539779 ?auto_539787 ) ) ( not ( = ?auto_539779 ?auto_539788 ) ) ( not ( = ?auto_539779 ?auto_539789 ) ) ( not ( = ?auto_539779 ?auto_539790 ) ) ( not ( = ?auto_539779 ?auto_539791 ) ) ( not ( = ?auto_539779 ?auto_539792 ) ) ( not ( = ?auto_539780 ?auto_539781 ) ) ( not ( = ?auto_539780 ?auto_539782 ) ) ( not ( = ?auto_539780 ?auto_539783 ) ) ( not ( = ?auto_539780 ?auto_539784 ) ) ( not ( = ?auto_539780 ?auto_539785 ) ) ( not ( = ?auto_539780 ?auto_539786 ) ) ( not ( = ?auto_539780 ?auto_539787 ) ) ( not ( = ?auto_539780 ?auto_539788 ) ) ( not ( = ?auto_539780 ?auto_539789 ) ) ( not ( = ?auto_539780 ?auto_539790 ) ) ( not ( = ?auto_539780 ?auto_539791 ) ) ( not ( = ?auto_539780 ?auto_539792 ) ) ( not ( = ?auto_539781 ?auto_539782 ) ) ( not ( = ?auto_539781 ?auto_539783 ) ) ( not ( = ?auto_539781 ?auto_539784 ) ) ( not ( = ?auto_539781 ?auto_539785 ) ) ( not ( = ?auto_539781 ?auto_539786 ) ) ( not ( = ?auto_539781 ?auto_539787 ) ) ( not ( = ?auto_539781 ?auto_539788 ) ) ( not ( = ?auto_539781 ?auto_539789 ) ) ( not ( = ?auto_539781 ?auto_539790 ) ) ( not ( = ?auto_539781 ?auto_539791 ) ) ( not ( = ?auto_539781 ?auto_539792 ) ) ( not ( = ?auto_539782 ?auto_539783 ) ) ( not ( = ?auto_539782 ?auto_539784 ) ) ( not ( = ?auto_539782 ?auto_539785 ) ) ( not ( = ?auto_539782 ?auto_539786 ) ) ( not ( = ?auto_539782 ?auto_539787 ) ) ( not ( = ?auto_539782 ?auto_539788 ) ) ( not ( = ?auto_539782 ?auto_539789 ) ) ( not ( = ?auto_539782 ?auto_539790 ) ) ( not ( = ?auto_539782 ?auto_539791 ) ) ( not ( = ?auto_539782 ?auto_539792 ) ) ( not ( = ?auto_539783 ?auto_539784 ) ) ( not ( = ?auto_539783 ?auto_539785 ) ) ( not ( = ?auto_539783 ?auto_539786 ) ) ( not ( = ?auto_539783 ?auto_539787 ) ) ( not ( = ?auto_539783 ?auto_539788 ) ) ( not ( = ?auto_539783 ?auto_539789 ) ) ( not ( = ?auto_539783 ?auto_539790 ) ) ( not ( = ?auto_539783 ?auto_539791 ) ) ( not ( = ?auto_539783 ?auto_539792 ) ) ( not ( = ?auto_539784 ?auto_539785 ) ) ( not ( = ?auto_539784 ?auto_539786 ) ) ( not ( = ?auto_539784 ?auto_539787 ) ) ( not ( = ?auto_539784 ?auto_539788 ) ) ( not ( = ?auto_539784 ?auto_539789 ) ) ( not ( = ?auto_539784 ?auto_539790 ) ) ( not ( = ?auto_539784 ?auto_539791 ) ) ( not ( = ?auto_539784 ?auto_539792 ) ) ( not ( = ?auto_539785 ?auto_539786 ) ) ( not ( = ?auto_539785 ?auto_539787 ) ) ( not ( = ?auto_539785 ?auto_539788 ) ) ( not ( = ?auto_539785 ?auto_539789 ) ) ( not ( = ?auto_539785 ?auto_539790 ) ) ( not ( = ?auto_539785 ?auto_539791 ) ) ( not ( = ?auto_539785 ?auto_539792 ) ) ( not ( = ?auto_539786 ?auto_539787 ) ) ( not ( = ?auto_539786 ?auto_539788 ) ) ( not ( = ?auto_539786 ?auto_539789 ) ) ( not ( = ?auto_539786 ?auto_539790 ) ) ( not ( = ?auto_539786 ?auto_539791 ) ) ( not ( = ?auto_539786 ?auto_539792 ) ) ( not ( = ?auto_539787 ?auto_539788 ) ) ( not ( = ?auto_539787 ?auto_539789 ) ) ( not ( = ?auto_539787 ?auto_539790 ) ) ( not ( = ?auto_539787 ?auto_539791 ) ) ( not ( = ?auto_539787 ?auto_539792 ) ) ( not ( = ?auto_539788 ?auto_539789 ) ) ( not ( = ?auto_539788 ?auto_539790 ) ) ( not ( = ?auto_539788 ?auto_539791 ) ) ( not ( = ?auto_539788 ?auto_539792 ) ) ( not ( = ?auto_539789 ?auto_539790 ) ) ( not ( = ?auto_539789 ?auto_539791 ) ) ( not ( = ?auto_539789 ?auto_539792 ) ) ( not ( = ?auto_539790 ?auto_539791 ) ) ( not ( = ?auto_539790 ?auto_539792 ) ) ( not ( = ?auto_539791 ?auto_539792 ) ) ( ON ?auto_539791 ?auto_539792 ) ( ON ?auto_539790 ?auto_539791 ) ( ON ?auto_539789 ?auto_539790 ) ( ON ?auto_539788 ?auto_539789 ) ( ON ?auto_539787 ?auto_539788 ) ( ON ?auto_539786 ?auto_539787 ) ( ON ?auto_539785 ?auto_539786 ) ( ON ?auto_539784 ?auto_539785 ) ( CLEAR ?auto_539782 ) ( ON ?auto_539783 ?auto_539784 ) ( CLEAR ?auto_539783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_539777 ?auto_539778 ?auto_539779 ?auto_539780 ?auto_539781 ?auto_539782 ?auto_539783 )
      ( MAKE-16PILE ?auto_539777 ?auto_539778 ?auto_539779 ?auto_539780 ?auto_539781 ?auto_539782 ?auto_539783 ?auto_539784 ?auto_539785 ?auto_539786 ?auto_539787 ?auto_539788 ?auto_539789 ?auto_539790 ?auto_539791 ?auto_539792 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539809 - BLOCK
      ?auto_539810 - BLOCK
      ?auto_539811 - BLOCK
      ?auto_539812 - BLOCK
      ?auto_539813 - BLOCK
      ?auto_539814 - BLOCK
      ?auto_539815 - BLOCK
      ?auto_539816 - BLOCK
      ?auto_539817 - BLOCK
      ?auto_539818 - BLOCK
      ?auto_539819 - BLOCK
      ?auto_539820 - BLOCK
      ?auto_539821 - BLOCK
      ?auto_539822 - BLOCK
      ?auto_539823 - BLOCK
      ?auto_539824 - BLOCK
    )
    :vars
    (
      ?auto_539825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539824 ?auto_539825 ) ( ON-TABLE ?auto_539809 ) ( ON ?auto_539810 ?auto_539809 ) ( ON ?auto_539811 ?auto_539810 ) ( ON ?auto_539812 ?auto_539811 ) ( ON ?auto_539813 ?auto_539812 ) ( not ( = ?auto_539809 ?auto_539810 ) ) ( not ( = ?auto_539809 ?auto_539811 ) ) ( not ( = ?auto_539809 ?auto_539812 ) ) ( not ( = ?auto_539809 ?auto_539813 ) ) ( not ( = ?auto_539809 ?auto_539814 ) ) ( not ( = ?auto_539809 ?auto_539815 ) ) ( not ( = ?auto_539809 ?auto_539816 ) ) ( not ( = ?auto_539809 ?auto_539817 ) ) ( not ( = ?auto_539809 ?auto_539818 ) ) ( not ( = ?auto_539809 ?auto_539819 ) ) ( not ( = ?auto_539809 ?auto_539820 ) ) ( not ( = ?auto_539809 ?auto_539821 ) ) ( not ( = ?auto_539809 ?auto_539822 ) ) ( not ( = ?auto_539809 ?auto_539823 ) ) ( not ( = ?auto_539809 ?auto_539824 ) ) ( not ( = ?auto_539809 ?auto_539825 ) ) ( not ( = ?auto_539810 ?auto_539811 ) ) ( not ( = ?auto_539810 ?auto_539812 ) ) ( not ( = ?auto_539810 ?auto_539813 ) ) ( not ( = ?auto_539810 ?auto_539814 ) ) ( not ( = ?auto_539810 ?auto_539815 ) ) ( not ( = ?auto_539810 ?auto_539816 ) ) ( not ( = ?auto_539810 ?auto_539817 ) ) ( not ( = ?auto_539810 ?auto_539818 ) ) ( not ( = ?auto_539810 ?auto_539819 ) ) ( not ( = ?auto_539810 ?auto_539820 ) ) ( not ( = ?auto_539810 ?auto_539821 ) ) ( not ( = ?auto_539810 ?auto_539822 ) ) ( not ( = ?auto_539810 ?auto_539823 ) ) ( not ( = ?auto_539810 ?auto_539824 ) ) ( not ( = ?auto_539810 ?auto_539825 ) ) ( not ( = ?auto_539811 ?auto_539812 ) ) ( not ( = ?auto_539811 ?auto_539813 ) ) ( not ( = ?auto_539811 ?auto_539814 ) ) ( not ( = ?auto_539811 ?auto_539815 ) ) ( not ( = ?auto_539811 ?auto_539816 ) ) ( not ( = ?auto_539811 ?auto_539817 ) ) ( not ( = ?auto_539811 ?auto_539818 ) ) ( not ( = ?auto_539811 ?auto_539819 ) ) ( not ( = ?auto_539811 ?auto_539820 ) ) ( not ( = ?auto_539811 ?auto_539821 ) ) ( not ( = ?auto_539811 ?auto_539822 ) ) ( not ( = ?auto_539811 ?auto_539823 ) ) ( not ( = ?auto_539811 ?auto_539824 ) ) ( not ( = ?auto_539811 ?auto_539825 ) ) ( not ( = ?auto_539812 ?auto_539813 ) ) ( not ( = ?auto_539812 ?auto_539814 ) ) ( not ( = ?auto_539812 ?auto_539815 ) ) ( not ( = ?auto_539812 ?auto_539816 ) ) ( not ( = ?auto_539812 ?auto_539817 ) ) ( not ( = ?auto_539812 ?auto_539818 ) ) ( not ( = ?auto_539812 ?auto_539819 ) ) ( not ( = ?auto_539812 ?auto_539820 ) ) ( not ( = ?auto_539812 ?auto_539821 ) ) ( not ( = ?auto_539812 ?auto_539822 ) ) ( not ( = ?auto_539812 ?auto_539823 ) ) ( not ( = ?auto_539812 ?auto_539824 ) ) ( not ( = ?auto_539812 ?auto_539825 ) ) ( not ( = ?auto_539813 ?auto_539814 ) ) ( not ( = ?auto_539813 ?auto_539815 ) ) ( not ( = ?auto_539813 ?auto_539816 ) ) ( not ( = ?auto_539813 ?auto_539817 ) ) ( not ( = ?auto_539813 ?auto_539818 ) ) ( not ( = ?auto_539813 ?auto_539819 ) ) ( not ( = ?auto_539813 ?auto_539820 ) ) ( not ( = ?auto_539813 ?auto_539821 ) ) ( not ( = ?auto_539813 ?auto_539822 ) ) ( not ( = ?auto_539813 ?auto_539823 ) ) ( not ( = ?auto_539813 ?auto_539824 ) ) ( not ( = ?auto_539813 ?auto_539825 ) ) ( not ( = ?auto_539814 ?auto_539815 ) ) ( not ( = ?auto_539814 ?auto_539816 ) ) ( not ( = ?auto_539814 ?auto_539817 ) ) ( not ( = ?auto_539814 ?auto_539818 ) ) ( not ( = ?auto_539814 ?auto_539819 ) ) ( not ( = ?auto_539814 ?auto_539820 ) ) ( not ( = ?auto_539814 ?auto_539821 ) ) ( not ( = ?auto_539814 ?auto_539822 ) ) ( not ( = ?auto_539814 ?auto_539823 ) ) ( not ( = ?auto_539814 ?auto_539824 ) ) ( not ( = ?auto_539814 ?auto_539825 ) ) ( not ( = ?auto_539815 ?auto_539816 ) ) ( not ( = ?auto_539815 ?auto_539817 ) ) ( not ( = ?auto_539815 ?auto_539818 ) ) ( not ( = ?auto_539815 ?auto_539819 ) ) ( not ( = ?auto_539815 ?auto_539820 ) ) ( not ( = ?auto_539815 ?auto_539821 ) ) ( not ( = ?auto_539815 ?auto_539822 ) ) ( not ( = ?auto_539815 ?auto_539823 ) ) ( not ( = ?auto_539815 ?auto_539824 ) ) ( not ( = ?auto_539815 ?auto_539825 ) ) ( not ( = ?auto_539816 ?auto_539817 ) ) ( not ( = ?auto_539816 ?auto_539818 ) ) ( not ( = ?auto_539816 ?auto_539819 ) ) ( not ( = ?auto_539816 ?auto_539820 ) ) ( not ( = ?auto_539816 ?auto_539821 ) ) ( not ( = ?auto_539816 ?auto_539822 ) ) ( not ( = ?auto_539816 ?auto_539823 ) ) ( not ( = ?auto_539816 ?auto_539824 ) ) ( not ( = ?auto_539816 ?auto_539825 ) ) ( not ( = ?auto_539817 ?auto_539818 ) ) ( not ( = ?auto_539817 ?auto_539819 ) ) ( not ( = ?auto_539817 ?auto_539820 ) ) ( not ( = ?auto_539817 ?auto_539821 ) ) ( not ( = ?auto_539817 ?auto_539822 ) ) ( not ( = ?auto_539817 ?auto_539823 ) ) ( not ( = ?auto_539817 ?auto_539824 ) ) ( not ( = ?auto_539817 ?auto_539825 ) ) ( not ( = ?auto_539818 ?auto_539819 ) ) ( not ( = ?auto_539818 ?auto_539820 ) ) ( not ( = ?auto_539818 ?auto_539821 ) ) ( not ( = ?auto_539818 ?auto_539822 ) ) ( not ( = ?auto_539818 ?auto_539823 ) ) ( not ( = ?auto_539818 ?auto_539824 ) ) ( not ( = ?auto_539818 ?auto_539825 ) ) ( not ( = ?auto_539819 ?auto_539820 ) ) ( not ( = ?auto_539819 ?auto_539821 ) ) ( not ( = ?auto_539819 ?auto_539822 ) ) ( not ( = ?auto_539819 ?auto_539823 ) ) ( not ( = ?auto_539819 ?auto_539824 ) ) ( not ( = ?auto_539819 ?auto_539825 ) ) ( not ( = ?auto_539820 ?auto_539821 ) ) ( not ( = ?auto_539820 ?auto_539822 ) ) ( not ( = ?auto_539820 ?auto_539823 ) ) ( not ( = ?auto_539820 ?auto_539824 ) ) ( not ( = ?auto_539820 ?auto_539825 ) ) ( not ( = ?auto_539821 ?auto_539822 ) ) ( not ( = ?auto_539821 ?auto_539823 ) ) ( not ( = ?auto_539821 ?auto_539824 ) ) ( not ( = ?auto_539821 ?auto_539825 ) ) ( not ( = ?auto_539822 ?auto_539823 ) ) ( not ( = ?auto_539822 ?auto_539824 ) ) ( not ( = ?auto_539822 ?auto_539825 ) ) ( not ( = ?auto_539823 ?auto_539824 ) ) ( not ( = ?auto_539823 ?auto_539825 ) ) ( not ( = ?auto_539824 ?auto_539825 ) ) ( ON ?auto_539823 ?auto_539824 ) ( ON ?auto_539822 ?auto_539823 ) ( ON ?auto_539821 ?auto_539822 ) ( ON ?auto_539820 ?auto_539821 ) ( ON ?auto_539819 ?auto_539820 ) ( ON ?auto_539818 ?auto_539819 ) ( ON ?auto_539817 ?auto_539818 ) ( ON ?auto_539816 ?auto_539817 ) ( ON ?auto_539815 ?auto_539816 ) ( CLEAR ?auto_539813 ) ( ON ?auto_539814 ?auto_539815 ) ( CLEAR ?auto_539814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_539809 ?auto_539810 ?auto_539811 ?auto_539812 ?auto_539813 ?auto_539814 )
      ( MAKE-16PILE ?auto_539809 ?auto_539810 ?auto_539811 ?auto_539812 ?auto_539813 ?auto_539814 ?auto_539815 ?auto_539816 ?auto_539817 ?auto_539818 ?auto_539819 ?auto_539820 ?auto_539821 ?auto_539822 ?auto_539823 ?auto_539824 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539842 - BLOCK
      ?auto_539843 - BLOCK
      ?auto_539844 - BLOCK
      ?auto_539845 - BLOCK
      ?auto_539846 - BLOCK
      ?auto_539847 - BLOCK
      ?auto_539848 - BLOCK
      ?auto_539849 - BLOCK
      ?auto_539850 - BLOCK
      ?auto_539851 - BLOCK
      ?auto_539852 - BLOCK
      ?auto_539853 - BLOCK
      ?auto_539854 - BLOCK
      ?auto_539855 - BLOCK
      ?auto_539856 - BLOCK
      ?auto_539857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539857 ) ( ON-TABLE ?auto_539842 ) ( ON ?auto_539843 ?auto_539842 ) ( ON ?auto_539844 ?auto_539843 ) ( ON ?auto_539845 ?auto_539844 ) ( ON ?auto_539846 ?auto_539845 ) ( not ( = ?auto_539842 ?auto_539843 ) ) ( not ( = ?auto_539842 ?auto_539844 ) ) ( not ( = ?auto_539842 ?auto_539845 ) ) ( not ( = ?auto_539842 ?auto_539846 ) ) ( not ( = ?auto_539842 ?auto_539847 ) ) ( not ( = ?auto_539842 ?auto_539848 ) ) ( not ( = ?auto_539842 ?auto_539849 ) ) ( not ( = ?auto_539842 ?auto_539850 ) ) ( not ( = ?auto_539842 ?auto_539851 ) ) ( not ( = ?auto_539842 ?auto_539852 ) ) ( not ( = ?auto_539842 ?auto_539853 ) ) ( not ( = ?auto_539842 ?auto_539854 ) ) ( not ( = ?auto_539842 ?auto_539855 ) ) ( not ( = ?auto_539842 ?auto_539856 ) ) ( not ( = ?auto_539842 ?auto_539857 ) ) ( not ( = ?auto_539843 ?auto_539844 ) ) ( not ( = ?auto_539843 ?auto_539845 ) ) ( not ( = ?auto_539843 ?auto_539846 ) ) ( not ( = ?auto_539843 ?auto_539847 ) ) ( not ( = ?auto_539843 ?auto_539848 ) ) ( not ( = ?auto_539843 ?auto_539849 ) ) ( not ( = ?auto_539843 ?auto_539850 ) ) ( not ( = ?auto_539843 ?auto_539851 ) ) ( not ( = ?auto_539843 ?auto_539852 ) ) ( not ( = ?auto_539843 ?auto_539853 ) ) ( not ( = ?auto_539843 ?auto_539854 ) ) ( not ( = ?auto_539843 ?auto_539855 ) ) ( not ( = ?auto_539843 ?auto_539856 ) ) ( not ( = ?auto_539843 ?auto_539857 ) ) ( not ( = ?auto_539844 ?auto_539845 ) ) ( not ( = ?auto_539844 ?auto_539846 ) ) ( not ( = ?auto_539844 ?auto_539847 ) ) ( not ( = ?auto_539844 ?auto_539848 ) ) ( not ( = ?auto_539844 ?auto_539849 ) ) ( not ( = ?auto_539844 ?auto_539850 ) ) ( not ( = ?auto_539844 ?auto_539851 ) ) ( not ( = ?auto_539844 ?auto_539852 ) ) ( not ( = ?auto_539844 ?auto_539853 ) ) ( not ( = ?auto_539844 ?auto_539854 ) ) ( not ( = ?auto_539844 ?auto_539855 ) ) ( not ( = ?auto_539844 ?auto_539856 ) ) ( not ( = ?auto_539844 ?auto_539857 ) ) ( not ( = ?auto_539845 ?auto_539846 ) ) ( not ( = ?auto_539845 ?auto_539847 ) ) ( not ( = ?auto_539845 ?auto_539848 ) ) ( not ( = ?auto_539845 ?auto_539849 ) ) ( not ( = ?auto_539845 ?auto_539850 ) ) ( not ( = ?auto_539845 ?auto_539851 ) ) ( not ( = ?auto_539845 ?auto_539852 ) ) ( not ( = ?auto_539845 ?auto_539853 ) ) ( not ( = ?auto_539845 ?auto_539854 ) ) ( not ( = ?auto_539845 ?auto_539855 ) ) ( not ( = ?auto_539845 ?auto_539856 ) ) ( not ( = ?auto_539845 ?auto_539857 ) ) ( not ( = ?auto_539846 ?auto_539847 ) ) ( not ( = ?auto_539846 ?auto_539848 ) ) ( not ( = ?auto_539846 ?auto_539849 ) ) ( not ( = ?auto_539846 ?auto_539850 ) ) ( not ( = ?auto_539846 ?auto_539851 ) ) ( not ( = ?auto_539846 ?auto_539852 ) ) ( not ( = ?auto_539846 ?auto_539853 ) ) ( not ( = ?auto_539846 ?auto_539854 ) ) ( not ( = ?auto_539846 ?auto_539855 ) ) ( not ( = ?auto_539846 ?auto_539856 ) ) ( not ( = ?auto_539846 ?auto_539857 ) ) ( not ( = ?auto_539847 ?auto_539848 ) ) ( not ( = ?auto_539847 ?auto_539849 ) ) ( not ( = ?auto_539847 ?auto_539850 ) ) ( not ( = ?auto_539847 ?auto_539851 ) ) ( not ( = ?auto_539847 ?auto_539852 ) ) ( not ( = ?auto_539847 ?auto_539853 ) ) ( not ( = ?auto_539847 ?auto_539854 ) ) ( not ( = ?auto_539847 ?auto_539855 ) ) ( not ( = ?auto_539847 ?auto_539856 ) ) ( not ( = ?auto_539847 ?auto_539857 ) ) ( not ( = ?auto_539848 ?auto_539849 ) ) ( not ( = ?auto_539848 ?auto_539850 ) ) ( not ( = ?auto_539848 ?auto_539851 ) ) ( not ( = ?auto_539848 ?auto_539852 ) ) ( not ( = ?auto_539848 ?auto_539853 ) ) ( not ( = ?auto_539848 ?auto_539854 ) ) ( not ( = ?auto_539848 ?auto_539855 ) ) ( not ( = ?auto_539848 ?auto_539856 ) ) ( not ( = ?auto_539848 ?auto_539857 ) ) ( not ( = ?auto_539849 ?auto_539850 ) ) ( not ( = ?auto_539849 ?auto_539851 ) ) ( not ( = ?auto_539849 ?auto_539852 ) ) ( not ( = ?auto_539849 ?auto_539853 ) ) ( not ( = ?auto_539849 ?auto_539854 ) ) ( not ( = ?auto_539849 ?auto_539855 ) ) ( not ( = ?auto_539849 ?auto_539856 ) ) ( not ( = ?auto_539849 ?auto_539857 ) ) ( not ( = ?auto_539850 ?auto_539851 ) ) ( not ( = ?auto_539850 ?auto_539852 ) ) ( not ( = ?auto_539850 ?auto_539853 ) ) ( not ( = ?auto_539850 ?auto_539854 ) ) ( not ( = ?auto_539850 ?auto_539855 ) ) ( not ( = ?auto_539850 ?auto_539856 ) ) ( not ( = ?auto_539850 ?auto_539857 ) ) ( not ( = ?auto_539851 ?auto_539852 ) ) ( not ( = ?auto_539851 ?auto_539853 ) ) ( not ( = ?auto_539851 ?auto_539854 ) ) ( not ( = ?auto_539851 ?auto_539855 ) ) ( not ( = ?auto_539851 ?auto_539856 ) ) ( not ( = ?auto_539851 ?auto_539857 ) ) ( not ( = ?auto_539852 ?auto_539853 ) ) ( not ( = ?auto_539852 ?auto_539854 ) ) ( not ( = ?auto_539852 ?auto_539855 ) ) ( not ( = ?auto_539852 ?auto_539856 ) ) ( not ( = ?auto_539852 ?auto_539857 ) ) ( not ( = ?auto_539853 ?auto_539854 ) ) ( not ( = ?auto_539853 ?auto_539855 ) ) ( not ( = ?auto_539853 ?auto_539856 ) ) ( not ( = ?auto_539853 ?auto_539857 ) ) ( not ( = ?auto_539854 ?auto_539855 ) ) ( not ( = ?auto_539854 ?auto_539856 ) ) ( not ( = ?auto_539854 ?auto_539857 ) ) ( not ( = ?auto_539855 ?auto_539856 ) ) ( not ( = ?auto_539855 ?auto_539857 ) ) ( not ( = ?auto_539856 ?auto_539857 ) ) ( ON ?auto_539856 ?auto_539857 ) ( ON ?auto_539855 ?auto_539856 ) ( ON ?auto_539854 ?auto_539855 ) ( ON ?auto_539853 ?auto_539854 ) ( ON ?auto_539852 ?auto_539853 ) ( ON ?auto_539851 ?auto_539852 ) ( ON ?auto_539850 ?auto_539851 ) ( ON ?auto_539849 ?auto_539850 ) ( ON ?auto_539848 ?auto_539849 ) ( CLEAR ?auto_539846 ) ( ON ?auto_539847 ?auto_539848 ) ( CLEAR ?auto_539847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_539842 ?auto_539843 ?auto_539844 ?auto_539845 ?auto_539846 ?auto_539847 )
      ( MAKE-16PILE ?auto_539842 ?auto_539843 ?auto_539844 ?auto_539845 ?auto_539846 ?auto_539847 ?auto_539848 ?auto_539849 ?auto_539850 ?auto_539851 ?auto_539852 ?auto_539853 ?auto_539854 ?auto_539855 ?auto_539856 ?auto_539857 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539874 - BLOCK
      ?auto_539875 - BLOCK
      ?auto_539876 - BLOCK
      ?auto_539877 - BLOCK
      ?auto_539878 - BLOCK
      ?auto_539879 - BLOCK
      ?auto_539880 - BLOCK
      ?auto_539881 - BLOCK
      ?auto_539882 - BLOCK
      ?auto_539883 - BLOCK
      ?auto_539884 - BLOCK
      ?auto_539885 - BLOCK
      ?auto_539886 - BLOCK
      ?auto_539887 - BLOCK
      ?auto_539888 - BLOCK
      ?auto_539889 - BLOCK
    )
    :vars
    (
      ?auto_539890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539889 ?auto_539890 ) ( ON-TABLE ?auto_539874 ) ( ON ?auto_539875 ?auto_539874 ) ( ON ?auto_539876 ?auto_539875 ) ( ON ?auto_539877 ?auto_539876 ) ( not ( = ?auto_539874 ?auto_539875 ) ) ( not ( = ?auto_539874 ?auto_539876 ) ) ( not ( = ?auto_539874 ?auto_539877 ) ) ( not ( = ?auto_539874 ?auto_539878 ) ) ( not ( = ?auto_539874 ?auto_539879 ) ) ( not ( = ?auto_539874 ?auto_539880 ) ) ( not ( = ?auto_539874 ?auto_539881 ) ) ( not ( = ?auto_539874 ?auto_539882 ) ) ( not ( = ?auto_539874 ?auto_539883 ) ) ( not ( = ?auto_539874 ?auto_539884 ) ) ( not ( = ?auto_539874 ?auto_539885 ) ) ( not ( = ?auto_539874 ?auto_539886 ) ) ( not ( = ?auto_539874 ?auto_539887 ) ) ( not ( = ?auto_539874 ?auto_539888 ) ) ( not ( = ?auto_539874 ?auto_539889 ) ) ( not ( = ?auto_539874 ?auto_539890 ) ) ( not ( = ?auto_539875 ?auto_539876 ) ) ( not ( = ?auto_539875 ?auto_539877 ) ) ( not ( = ?auto_539875 ?auto_539878 ) ) ( not ( = ?auto_539875 ?auto_539879 ) ) ( not ( = ?auto_539875 ?auto_539880 ) ) ( not ( = ?auto_539875 ?auto_539881 ) ) ( not ( = ?auto_539875 ?auto_539882 ) ) ( not ( = ?auto_539875 ?auto_539883 ) ) ( not ( = ?auto_539875 ?auto_539884 ) ) ( not ( = ?auto_539875 ?auto_539885 ) ) ( not ( = ?auto_539875 ?auto_539886 ) ) ( not ( = ?auto_539875 ?auto_539887 ) ) ( not ( = ?auto_539875 ?auto_539888 ) ) ( not ( = ?auto_539875 ?auto_539889 ) ) ( not ( = ?auto_539875 ?auto_539890 ) ) ( not ( = ?auto_539876 ?auto_539877 ) ) ( not ( = ?auto_539876 ?auto_539878 ) ) ( not ( = ?auto_539876 ?auto_539879 ) ) ( not ( = ?auto_539876 ?auto_539880 ) ) ( not ( = ?auto_539876 ?auto_539881 ) ) ( not ( = ?auto_539876 ?auto_539882 ) ) ( not ( = ?auto_539876 ?auto_539883 ) ) ( not ( = ?auto_539876 ?auto_539884 ) ) ( not ( = ?auto_539876 ?auto_539885 ) ) ( not ( = ?auto_539876 ?auto_539886 ) ) ( not ( = ?auto_539876 ?auto_539887 ) ) ( not ( = ?auto_539876 ?auto_539888 ) ) ( not ( = ?auto_539876 ?auto_539889 ) ) ( not ( = ?auto_539876 ?auto_539890 ) ) ( not ( = ?auto_539877 ?auto_539878 ) ) ( not ( = ?auto_539877 ?auto_539879 ) ) ( not ( = ?auto_539877 ?auto_539880 ) ) ( not ( = ?auto_539877 ?auto_539881 ) ) ( not ( = ?auto_539877 ?auto_539882 ) ) ( not ( = ?auto_539877 ?auto_539883 ) ) ( not ( = ?auto_539877 ?auto_539884 ) ) ( not ( = ?auto_539877 ?auto_539885 ) ) ( not ( = ?auto_539877 ?auto_539886 ) ) ( not ( = ?auto_539877 ?auto_539887 ) ) ( not ( = ?auto_539877 ?auto_539888 ) ) ( not ( = ?auto_539877 ?auto_539889 ) ) ( not ( = ?auto_539877 ?auto_539890 ) ) ( not ( = ?auto_539878 ?auto_539879 ) ) ( not ( = ?auto_539878 ?auto_539880 ) ) ( not ( = ?auto_539878 ?auto_539881 ) ) ( not ( = ?auto_539878 ?auto_539882 ) ) ( not ( = ?auto_539878 ?auto_539883 ) ) ( not ( = ?auto_539878 ?auto_539884 ) ) ( not ( = ?auto_539878 ?auto_539885 ) ) ( not ( = ?auto_539878 ?auto_539886 ) ) ( not ( = ?auto_539878 ?auto_539887 ) ) ( not ( = ?auto_539878 ?auto_539888 ) ) ( not ( = ?auto_539878 ?auto_539889 ) ) ( not ( = ?auto_539878 ?auto_539890 ) ) ( not ( = ?auto_539879 ?auto_539880 ) ) ( not ( = ?auto_539879 ?auto_539881 ) ) ( not ( = ?auto_539879 ?auto_539882 ) ) ( not ( = ?auto_539879 ?auto_539883 ) ) ( not ( = ?auto_539879 ?auto_539884 ) ) ( not ( = ?auto_539879 ?auto_539885 ) ) ( not ( = ?auto_539879 ?auto_539886 ) ) ( not ( = ?auto_539879 ?auto_539887 ) ) ( not ( = ?auto_539879 ?auto_539888 ) ) ( not ( = ?auto_539879 ?auto_539889 ) ) ( not ( = ?auto_539879 ?auto_539890 ) ) ( not ( = ?auto_539880 ?auto_539881 ) ) ( not ( = ?auto_539880 ?auto_539882 ) ) ( not ( = ?auto_539880 ?auto_539883 ) ) ( not ( = ?auto_539880 ?auto_539884 ) ) ( not ( = ?auto_539880 ?auto_539885 ) ) ( not ( = ?auto_539880 ?auto_539886 ) ) ( not ( = ?auto_539880 ?auto_539887 ) ) ( not ( = ?auto_539880 ?auto_539888 ) ) ( not ( = ?auto_539880 ?auto_539889 ) ) ( not ( = ?auto_539880 ?auto_539890 ) ) ( not ( = ?auto_539881 ?auto_539882 ) ) ( not ( = ?auto_539881 ?auto_539883 ) ) ( not ( = ?auto_539881 ?auto_539884 ) ) ( not ( = ?auto_539881 ?auto_539885 ) ) ( not ( = ?auto_539881 ?auto_539886 ) ) ( not ( = ?auto_539881 ?auto_539887 ) ) ( not ( = ?auto_539881 ?auto_539888 ) ) ( not ( = ?auto_539881 ?auto_539889 ) ) ( not ( = ?auto_539881 ?auto_539890 ) ) ( not ( = ?auto_539882 ?auto_539883 ) ) ( not ( = ?auto_539882 ?auto_539884 ) ) ( not ( = ?auto_539882 ?auto_539885 ) ) ( not ( = ?auto_539882 ?auto_539886 ) ) ( not ( = ?auto_539882 ?auto_539887 ) ) ( not ( = ?auto_539882 ?auto_539888 ) ) ( not ( = ?auto_539882 ?auto_539889 ) ) ( not ( = ?auto_539882 ?auto_539890 ) ) ( not ( = ?auto_539883 ?auto_539884 ) ) ( not ( = ?auto_539883 ?auto_539885 ) ) ( not ( = ?auto_539883 ?auto_539886 ) ) ( not ( = ?auto_539883 ?auto_539887 ) ) ( not ( = ?auto_539883 ?auto_539888 ) ) ( not ( = ?auto_539883 ?auto_539889 ) ) ( not ( = ?auto_539883 ?auto_539890 ) ) ( not ( = ?auto_539884 ?auto_539885 ) ) ( not ( = ?auto_539884 ?auto_539886 ) ) ( not ( = ?auto_539884 ?auto_539887 ) ) ( not ( = ?auto_539884 ?auto_539888 ) ) ( not ( = ?auto_539884 ?auto_539889 ) ) ( not ( = ?auto_539884 ?auto_539890 ) ) ( not ( = ?auto_539885 ?auto_539886 ) ) ( not ( = ?auto_539885 ?auto_539887 ) ) ( not ( = ?auto_539885 ?auto_539888 ) ) ( not ( = ?auto_539885 ?auto_539889 ) ) ( not ( = ?auto_539885 ?auto_539890 ) ) ( not ( = ?auto_539886 ?auto_539887 ) ) ( not ( = ?auto_539886 ?auto_539888 ) ) ( not ( = ?auto_539886 ?auto_539889 ) ) ( not ( = ?auto_539886 ?auto_539890 ) ) ( not ( = ?auto_539887 ?auto_539888 ) ) ( not ( = ?auto_539887 ?auto_539889 ) ) ( not ( = ?auto_539887 ?auto_539890 ) ) ( not ( = ?auto_539888 ?auto_539889 ) ) ( not ( = ?auto_539888 ?auto_539890 ) ) ( not ( = ?auto_539889 ?auto_539890 ) ) ( ON ?auto_539888 ?auto_539889 ) ( ON ?auto_539887 ?auto_539888 ) ( ON ?auto_539886 ?auto_539887 ) ( ON ?auto_539885 ?auto_539886 ) ( ON ?auto_539884 ?auto_539885 ) ( ON ?auto_539883 ?auto_539884 ) ( ON ?auto_539882 ?auto_539883 ) ( ON ?auto_539881 ?auto_539882 ) ( ON ?auto_539880 ?auto_539881 ) ( ON ?auto_539879 ?auto_539880 ) ( CLEAR ?auto_539877 ) ( ON ?auto_539878 ?auto_539879 ) ( CLEAR ?auto_539878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_539874 ?auto_539875 ?auto_539876 ?auto_539877 ?auto_539878 )
      ( MAKE-16PILE ?auto_539874 ?auto_539875 ?auto_539876 ?auto_539877 ?auto_539878 ?auto_539879 ?auto_539880 ?auto_539881 ?auto_539882 ?auto_539883 ?auto_539884 ?auto_539885 ?auto_539886 ?auto_539887 ?auto_539888 ?auto_539889 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539907 - BLOCK
      ?auto_539908 - BLOCK
      ?auto_539909 - BLOCK
      ?auto_539910 - BLOCK
      ?auto_539911 - BLOCK
      ?auto_539912 - BLOCK
      ?auto_539913 - BLOCK
      ?auto_539914 - BLOCK
      ?auto_539915 - BLOCK
      ?auto_539916 - BLOCK
      ?auto_539917 - BLOCK
      ?auto_539918 - BLOCK
      ?auto_539919 - BLOCK
      ?auto_539920 - BLOCK
      ?auto_539921 - BLOCK
      ?auto_539922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539922 ) ( ON-TABLE ?auto_539907 ) ( ON ?auto_539908 ?auto_539907 ) ( ON ?auto_539909 ?auto_539908 ) ( ON ?auto_539910 ?auto_539909 ) ( not ( = ?auto_539907 ?auto_539908 ) ) ( not ( = ?auto_539907 ?auto_539909 ) ) ( not ( = ?auto_539907 ?auto_539910 ) ) ( not ( = ?auto_539907 ?auto_539911 ) ) ( not ( = ?auto_539907 ?auto_539912 ) ) ( not ( = ?auto_539907 ?auto_539913 ) ) ( not ( = ?auto_539907 ?auto_539914 ) ) ( not ( = ?auto_539907 ?auto_539915 ) ) ( not ( = ?auto_539907 ?auto_539916 ) ) ( not ( = ?auto_539907 ?auto_539917 ) ) ( not ( = ?auto_539907 ?auto_539918 ) ) ( not ( = ?auto_539907 ?auto_539919 ) ) ( not ( = ?auto_539907 ?auto_539920 ) ) ( not ( = ?auto_539907 ?auto_539921 ) ) ( not ( = ?auto_539907 ?auto_539922 ) ) ( not ( = ?auto_539908 ?auto_539909 ) ) ( not ( = ?auto_539908 ?auto_539910 ) ) ( not ( = ?auto_539908 ?auto_539911 ) ) ( not ( = ?auto_539908 ?auto_539912 ) ) ( not ( = ?auto_539908 ?auto_539913 ) ) ( not ( = ?auto_539908 ?auto_539914 ) ) ( not ( = ?auto_539908 ?auto_539915 ) ) ( not ( = ?auto_539908 ?auto_539916 ) ) ( not ( = ?auto_539908 ?auto_539917 ) ) ( not ( = ?auto_539908 ?auto_539918 ) ) ( not ( = ?auto_539908 ?auto_539919 ) ) ( not ( = ?auto_539908 ?auto_539920 ) ) ( not ( = ?auto_539908 ?auto_539921 ) ) ( not ( = ?auto_539908 ?auto_539922 ) ) ( not ( = ?auto_539909 ?auto_539910 ) ) ( not ( = ?auto_539909 ?auto_539911 ) ) ( not ( = ?auto_539909 ?auto_539912 ) ) ( not ( = ?auto_539909 ?auto_539913 ) ) ( not ( = ?auto_539909 ?auto_539914 ) ) ( not ( = ?auto_539909 ?auto_539915 ) ) ( not ( = ?auto_539909 ?auto_539916 ) ) ( not ( = ?auto_539909 ?auto_539917 ) ) ( not ( = ?auto_539909 ?auto_539918 ) ) ( not ( = ?auto_539909 ?auto_539919 ) ) ( not ( = ?auto_539909 ?auto_539920 ) ) ( not ( = ?auto_539909 ?auto_539921 ) ) ( not ( = ?auto_539909 ?auto_539922 ) ) ( not ( = ?auto_539910 ?auto_539911 ) ) ( not ( = ?auto_539910 ?auto_539912 ) ) ( not ( = ?auto_539910 ?auto_539913 ) ) ( not ( = ?auto_539910 ?auto_539914 ) ) ( not ( = ?auto_539910 ?auto_539915 ) ) ( not ( = ?auto_539910 ?auto_539916 ) ) ( not ( = ?auto_539910 ?auto_539917 ) ) ( not ( = ?auto_539910 ?auto_539918 ) ) ( not ( = ?auto_539910 ?auto_539919 ) ) ( not ( = ?auto_539910 ?auto_539920 ) ) ( not ( = ?auto_539910 ?auto_539921 ) ) ( not ( = ?auto_539910 ?auto_539922 ) ) ( not ( = ?auto_539911 ?auto_539912 ) ) ( not ( = ?auto_539911 ?auto_539913 ) ) ( not ( = ?auto_539911 ?auto_539914 ) ) ( not ( = ?auto_539911 ?auto_539915 ) ) ( not ( = ?auto_539911 ?auto_539916 ) ) ( not ( = ?auto_539911 ?auto_539917 ) ) ( not ( = ?auto_539911 ?auto_539918 ) ) ( not ( = ?auto_539911 ?auto_539919 ) ) ( not ( = ?auto_539911 ?auto_539920 ) ) ( not ( = ?auto_539911 ?auto_539921 ) ) ( not ( = ?auto_539911 ?auto_539922 ) ) ( not ( = ?auto_539912 ?auto_539913 ) ) ( not ( = ?auto_539912 ?auto_539914 ) ) ( not ( = ?auto_539912 ?auto_539915 ) ) ( not ( = ?auto_539912 ?auto_539916 ) ) ( not ( = ?auto_539912 ?auto_539917 ) ) ( not ( = ?auto_539912 ?auto_539918 ) ) ( not ( = ?auto_539912 ?auto_539919 ) ) ( not ( = ?auto_539912 ?auto_539920 ) ) ( not ( = ?auto_539912 ?auto_539921 ) ) ( not ( = ?auto_539912 ?auto_539922 ) ) ( not ( = ?auto_539913 ?auto_539914 ) ) ( not ( = ?auto_539913 ?auto_539915 ) ) ( not ( = ?auto_539913 ?auto_539916 ) ) ( not ( = ?auto_539913 ?auto_539917 ) ) ( not ( = ?auto_539913 ?auto_539918 ) ) ( not ( = ?auto_539913 ?auto_539919 ) ) ( not ( = ?auto_539913 ?auto_539920 ) ) ( not ( = ?auto_539913 ?auto_539921 ) ) ( not ( = ?auto_539913 ?auto_539922 ) ) ( not ( = ?auto_539914 ?auto_539915 ) ) ( not ( = ?auto_539914 ?auto_539916 ) ) ( not ( = ?auto_539914 ?auto_539917 ) ) ( not ( = ?auto_539914 ?auto_539918 ) ) ( not ( = ?auto_539914 ?auto_539919 ) ) ( not ( = ?auto_539914 ?auto_539920 ) ) ( not ( = ?auto_539914 ?auto_539921 ) ) ( not ( = ?auto_539914 ?auto_539922 ) ) ( not ( = ?auto_539915 ?auto_539916 ) ) ( not ( = ?auto_539915 ?auto_539917 ) ) ( not ( = ?auto_539915 ?auto_539918 ) ) ( not ( = ?auto_539915 ?auto_539919 ) ) ( not ( = ?auto_539915 ?auto_539920 ) ) ( not ( = ?auto_539915 ?auto_539921 ) ) ( not ( = ?auto_539915 ?auto_539922 ) ) ( not ( = ?auto_539916 ?auto_539917 ) ) ( not ( = ?auto_539916 ?auto_539918 ) ) ( not ( = ?auto_539916 ?auto_539919 ) ) ( not ( = ?auto_539916 ?auto_539920 ) ) ( not ( = ?auto_539916 ?auto_539921 ) ) ( not ( = ?auto_539916 ?auto_539922 ) ) ( not ( = ?auto_539917 ?auto_539918 ) ) ( not ( = ?auto_539917 ?auto_539919 ) ) ( not ( = ?auto_539917 ?auto_539920 ) ) ( not ( = ?auto_539917 ?auto_539921 ) ) ( not ( = ?auto_539917 ?auto_539922 ) ) ( not ( = ?auto_539918 ?auto_539919 ) ) ( not ( = ?auto_539918 ?auto_539920 ) ) ( not ( = ?auto_539918 ?auto_539921 ) ) ( not ( = ?auto_539918 ?auto_539922 ) ) ( not ( = ?auto_539919 ?auto_539920 ) ) ( not ( = ?auto_539919 ?auto_539921 ) ) ( not ( = ?auto_539919 ?auto_539922 ) ) ( not ( = ?auto_539920 ?auto_539921 ) ) ( not ( = ?auto_539920 ?auto_539922 ) ) ( not ( = ?auto_539921 ?auto_539922 ) ) ( ON ?auto_539921 ?auto_539922 ) ( ON ?auto_539920 ?auto_539921 ) ( ON ?auto_539919 ?auto_539920 ) ( ON ?auto_539918 ?auto_539919 ) ( ON ?auto_539917 ?auto_539918 ) ( ON ?auto_539916 ?auto_539917 ) ( ON ?auto_539915 ?auto_539916 ) ( ON ?auto_539914 ?auto_539915 ) ( ON ?auto_539913 ?auto_539914 ) ( ON ?auto_539912 ?auto_539913 ) ( CLEAR ?auto_539910 ) ( ON ?auto_539911 ?auto_539912 ) ( CLEAR ?auto_539911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_539907 ?auto_539908 ?auto_539909 ?auto_539910 ?auto_539911 )
      ( MAKE-16PILE ?auto_539907 ?auto_539908 ?auto_539909 ?auto_539910 ?auto_539911 ?auto_539912 ?auto_539913 ?auto_539914 ?auto_539915 ?auto_539916 ?auto_539917 ?auto_539918 ?auto_539919 ?auto_539920 ?auto_539921 ?auto_539922 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539939 - BLOCK
      ?auto_539940 - BLOCK
      ?auto_539941 - BLOCK
      ?auto_539942 - BLOCK
      ?auto_539943 - BLOCK
      ?auto_539944 - BLOCK
      ?auto_539945 - BLOCK
      ?auto_539946 - BLOCK
      ?auto_539947 - BLOCK
      ?auto_539948 - BLOCK
      ?auto_539949 - BLOCK
      ?auto_539950 - BLOCK
      ?auto_539951 - BLOCK
      ?auto_539952 - BLOCK
      ?auto_539953 - BLOCK
      ?auto_539954 - BLOCK
    )
    :vars
    (
      ?auto_539955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_539954 ?auto_539955 ) ( ON-TABLE ?auto_539939 ) ( ON ?auto_539940 ?auto_539939 ) ( ON ?auto_539941 ?auto_539940 ) ( not ( = ?auto_539939 ?auto_539940 ) ) ( not ( = ?auto_539939 ?auto_539941 ) ) ( not ( = ?auto_539939 ?auto_539942 ) ) ( not ( = ?auto_539939 ?auto_539943 ) ) ( not ( = ?auto_539939 ?auto_539944 ) ) ( not ( = ?auto_539939 ?auto_539945 ) ) ( not ( = ?auto_539939 ?auto_539946 ) ) ( not ( = ?auto_539939 ?auto_539947 ) ) ( not ( = ?auto_539939 ?auto_539948 ) ) ( not ( = ?auto_539939 ?auto_539949 ) ) ( not ( = ?auto_539939 ?auto_539950 ) ) ( not ( = ?auto_539939 ?auto_539951 ) ) ( not ( = ?auto_539939 ?auto_539952 ) ) ( not ( = ?auto_539939 ?auto_539953 ) ) ( not ( = ?auto_539939 ?auto_539954 ) ) ( not ( = ?auto_539939 ?auto_539955 ) ) ( not ( = ?auto_539940 ?auto_539941 ) ) ( not ( = ?auto_539940 ?auto_539942 ) ) ( not ( = ?auto_539940 ?auto_539943 ) ) ( not ( = ?auto_539940 ?auto_539944 ) ) ( not ( = ?auto_539940 ?auto_539945 ) ) ( not ( = ?auto_539940 ?auto_539946 ) ) ( not ( = ?auto_539940 ?auto_539947 ) ) ( not ( = ?auto_539940 ?auto_539948 ) ) ( not ( = ?auto_539940 ?auto_539949 ) ) ( not ( = ?auto_539940 ?auto_539950 ) ) ( not ( = ?auto_539940 ?auto_539951 ) ) ( not ( = ?auto_539940 ?auto_539952 ) ) ( not ( = ?auto_539940 ?auto_539953 ) ) ( not ( = ?auto_539940 ?auto_539954 ) ) ( not ( = ?auto_539940 ?auto_539955 ) ) ( not ( = ?auto_539941 ?auto_539942 ) ) ( not ( = ?auto_539941 ?auto_539943 ) ) ( not ( = ?auto_539941 ?auto_539944 ) ) ( not ( = ?auto_539941 ?auto_539945 ) ) ( not ( = ?auto_539941 ?auto_539946 ) ) ( not ( = ?auto_539941 ?auto_539947 ) ) ( not ( = ?auto_539941 ?auto_539948 ) ) ( not ( = ?auto_539941 ?auto_539949 ) ) ( not ( = ?auto_539941 ?auto_539950 ) ) ( not ( = ?auto_539941 ?auto_539951 ) ) ( not ( = ?auto_539941 ?auto_539952 ) ) ( not ( = ?auto_539941 ?auto_539953 ) ) ( not ( = ?auto_539941 ?auto_539954 ) ) ( not ( = ?auto_539941 ?auto_539955 ) ) ( not ( = ?auto_539942 ?auto_539943 ) ) ( not ( = ?auto_539942 ?auto_539944 ) ) ( not ( = ?auto_539942 ?auto_539945 ) ) ( not ( = ?auto_539942 ?auto_539946 ) ) ( not ( = ?auto_539942 ?auto_539947 ) ) ( not ( = ?auto_539942 ?auto_539948 ) ) ( not ( = ?auto_539942 ?auto_539949 ) ) ( not ( = ?auto_539942 ?auto_539950 ) ) ( not ( = ?auto_539942 ?auto_539951 ) ) ( not ( = ?auto_539942 ?auto_539952 ) ) ( not ( = ?auto_539942 ?auto_539953 ) ) ( not ( = ?auto_539942 ?auto_539954 ) ) ( not ( = ?auto_539942 ?auto_539955 ) ) ( not ( = ?auto_539943 ?auto_539944 ) ) ( not ( = ?auto_539943 ?auto_539945 ) ) ( not ( = ?auto_539943 ?auto_539946 ) ) ( not ( = ?auto_539943 ?auto_539947 ) ) ( not ( = ?auto_539943 ?auto_539948 ) ) ( not ( = ?auto_539943 ?auto_539949 ) ) ( not ( = ?auto_539943 ?auto_539950 ) ) ( not ( = ?auto_539943 ?auto_539951 ) ) ( not ( = ?auto_539943 ?auto_539952 ) ) ( not ( = ?auto_539943 ?auto_539953 ) ) ( not ( = ?auto_539943 ?auto_539954 ) ) ( not ( = ?auto_539943 ?auto_539955 ) ) ( not ( = ?auto_539944 ?auto_539945 ) ) ( not ( = ?auto_539944 ?auto_539946 ) ) ( not ( = ?auto_539944 ?auto_539947 ) ) ( not ( = ?auto_539944 ?auto_539948 ) ) ( not ( = ?auto_539944 ?auto_539949 ) ) ( not ( = ?auto_539944 ?auto_539950 ) ) ( not ( = ?auto_539944 ?auto_539951 ) ) ( not ( = ?auto_539944 ?auto_539952 ) ) ( not ( = ?auto_539944 ?auto_539953 ) ) ( not ( = ?auto_539944 ?auto_539954 ) ) ( not ( = ?auto_539944 ?auto_539955 ) ) ( not ( = ?auto_539945 ?auto_539946 ) ) ( not ( = ?auto_539945 ?auto_539947 ) ) ( not ( = ?auto_539945 ?auto_539948 ) ) ( not ( = ?auto_539945 ?auto_539949 ) ) ( not ( = ?auto_539945 ?auto_539950 ) ) ( not ( = ?auto_539945 ?auto_539951 ) ) ( not ( = ?auto_539945 ?auto_539952 ) ) ( not ( = ?auto_539945 ?auto_539953 ) ) ( not ( = ?auto_539945 ?auto_539954 ) ) ( not ( = ?auto_539945 ?auto_539955 ) ) ( not ( = ?auto_539946 ?auto_539947 ) ) ( not ( = ?auto_539946 ?auto_539948 ) ) ( not ( = ?auto_539946 ?auto_539949 ) ) ( not ( = ?auto_539946 ?auto_539950 ) ) ( not ( = ?auto_539946 ?auto_539951 ) ) ( not ( = ?auto_539946 ?auto_539952 ) ) ( not ( = ?auto_539946 ?auto_539953 ) ) ( not ( = ?auto_539946 ?auto_539954 ) ) ( not ( = ?auto_539946 ?auto_539955 ) ) ( not ( = ?auto_539947 ?auto_539948 ) ) ( not ( = ?auto_539947 ?auto_539949 ) ) ( not ( = ?auto_539947 ?auto_539950 ) ) ( not ( = ?auto_539947 ?auto_539951 ) ) ( not ( = ?auto_539947 ?auto_539952 ) ) ( not ( = ?auto_539947 ?auto_539953 ) ) ( not ( = ?auto_539947 ?auto_539954 ) ) ( not ( = ?auto_539947 ?auto_539955 ) ) ( not ( = ?auto_539948 ?auto_539949 ) ) ( not ( = ?auto_539948 ?auto_539950 ) ) ( not ( = ?auto_539948 ?auto_539951 ) ) ( not ( = ?auto_539948 ?auto_539952 ) ) ( not ( = ?auto_539948 ?auto_539953 ) ) ( not ( = ?auto_539948 ?auto_539954 ) ) ( not ( = ?auto_539948 ?auto_539955 ) ) ( not ( = ?auto_539949 ?auto_539950 ) ) ( not ( = ?auto_539949 ?auto_539951 ) ) ( not ( = ?auto_539949 ?auto_539952 ) ) ( not ( = ?auto_539949 ?auto_539953 ) ) ( not ( = ?auto_539949 ?auto_539954 ) ) ( not ( = ?auto_539949 ?auto_539955 ) ) ( not ( = ?auto_539950 ?auto_539951 ) ) ( not ( = ?auto_539950 ?auto_539952 ) ) ( not ( = ?auto_539950 ?auto_539953 ) ) ( not ( = ?auto_539950 ?auto_539954 ) ) ( not ( = ?auto_539950 ?auto_539955 ) ) ( not ( = ?auto_539951 ?auto_539952 ) ) ( not ( = ?auto_539951 ?auto_539953 ) ) ( not ( = ?auto_539951 ?auto_539954 ) ) ( not ( = ?auto_539951 ?auto_539955 ) ) ( not ( = ?auto_539952 ?auto_539953 ) ) ( not ( = ?auto_539952 ?auto_539954 ) ) ( not ( = ?auto_539952 ?auto_539955 ) ) ( not ( = ?auto_539953 ?auto_539954 ) ) ( not ( = ?auto_539953 ?auto_539955 ) ) ( not ( = ?auto_539954 ?auto_539955 ) ) ( ON ?auto_539953 ?auto_539954 ) ( ON ?auto_539952 ?auto_539953 ) ( ON ?auto_539951 ?auto_539952 ) ( ON ?auto_539950 ?auto_539951 ) ( ON ?auto_539949 ?auto_539950 ) ( ON ?auto_539948 ?auto_539949 ) ( ON ?auto_539947 ?auto_539948 ) ( ON ?auto_539946 ?auto_539947 ) ( ON ?auto_539945 ?auto_539946 ) ( ON ?auto_539944 ?auto_539945 ) ( ON ?auto_539943 ?auto_539944 ) ( CLEAR ?auto_539941 ) ( ON ?auto_539942 ?auto_539943 ) ( CLEAR ?auto_539942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_539939 ?auto_539940 ?auto_539941 ?auto_539942 )
      ( MAKE-16PILE ?auto_539939 ?auto_539940 ?auto_539941 ?auto_539942 ?auto_539943 ?auto_539944 ?auto_539945 ?auto_539946 ?auto_539947 ?auto_539948 ?auto_539949 ?auto_539950 ?auto_539951 ?auto_539952 ?auto_539953 ?auto_539954 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_539972 - BLOCK
      ?auto_539973 - BLOCK
      ?auto_539974 - BLOCK
      ?auto_539975 - BLOCK
      ?auto_539976 - BLOCK
      ?auto_539977 - BLOCK
      ?auto_539978 - BLOCK
      ?auto_539979 - BLOCK
      ?auto_539980 - BLOCK
      ?auto_539981 - BLOCK
      ?auto_539982 - BLOCK
      ?auto_539983 - BLOCK
      ?auto_539984 - BLOCK
      ?auto_539985 - BLOCK
      ?auto_539986 - BLOCK
      ?auto_539987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_539987 ) ( ON-TABLE ?auto_539972 ) ( ON ?auto_539973 ?auto_539972 ) ( ON ?auto_539974 ?auto_539973 ) ( not ( = ?auto_539972 ?auto_539973 ) ) ( not ( = ?auto_539972 ?auto_539974 ) ) ( not ( = ?auto_539972 ?auto_539975 ) ) ( not ( = ?auto_539972 ?auto_539976 ) ) ( not ( = ?auto_539972 ?auto_539977 ) ) ( not ( = ?auto_539972 ?auto_539978 ) ) ( not ( = ?auto_539972 ?auto_539979 ) ) ( not ( = ?auto_539972 ?auto_539980 ) ) ( not ( = ?auto_539972 ?auto_539981 ) ) ( not ( = ?auto_539972 ?auto_539982 ) ) ( not ( = ?auto_539972 ?auto_539983 ) ) ( not ( = ?auto_539972 ?auto_539984 ) ) ( not ( = ?auto_539972 ?auto_539985 ) ) ( not ( = ?auto_539972 ?auto_539986 ) ) ( not ( = ?auto_539972 ?auto_539987 ) ) ( not ( = ?auto_539973 ?auto_539974 ) ) ( not ( = ?auto_539973 ?auto_539975 ) ) ( not ( = ?auto_539973 ?auto_539976 ) ) ( not ( = ?auto_539973 ?auto_539977 ) ) ( not ( = ?auto_539973 ?auto_539978 ) ) ( not ( = ?auto_539973 ?auto_539979 ) ) ( not ( = ?auto_539973 ?auto_539980 ) ) ( not ( = ?auto_539973 ?auto_539981 ) ) ( not ( = ?auto_539973 ?auto_539982 ) ) ( not ( = ?auto_539973 ?auto_539983 ) ) ( not ( = ?auto_539973 ?auto_539984 ) ) ( not ( = ?auto_539973 ?auto_539985 ) ) ( not ( = ?auto_539973 ?auto_539986 ) ) ( not ( = ?auto_539973 ?auto_539987 ) ) ( not ( = ?auto_539974 ?auto_539975 ) ) ( not ( = ?auto_539974 ?auto_539976 ) ) ( not ( = ?auto_539974 ?auto_539977 ) ) ( not ( = ?auto_539974 ?auto_539978 ) ) ( not ( = ?auto_539974 ?auto_539979 ) ) ( not ( = ?auto_539974 ?auto_539980 ) ) ( not ( = ?auto_539974 ?auto_539981 ) ) ( not ( = ?auto_539974 ?auto_539982 ) ) ( not ( = ?auto_539974 ?auto_539983 ) ) ( not ( = ?auto_539974 ?auto_539984 ) ) ( not ( = ?auto_539974 ?auto_539985 ) ) ( not ( = ?auto_539974 ?auto_539986 ) ) ( not ( = ?auto_539974 ?auto_539987 ) ) ( not ( = ?auto_539975 ?auto_539976 ) ) ( not ( = ?auto_539975 ?auto_539977 ) ) ( not ( = ?auto_539975 ?auto_539978 ) ) ( not ( = ?auto_539975 ?auto_539979 ) ) ( not ( = ?auto_539975 ?auto_539980 ) ) ( not ( = ?auto_539975 ?auto_539981 ) ) ( not ( = ?auto_539975 ?auto_539982 ) ) ( not ( = ?auto_539975 ?auto_539983 ) ) ( not ( = ?auto_539975 ?auto_539984 ) ) ( not ( = ?auto_539975 ?auto_539985 ) ) ( not ( = ?auto_539975 ?auto_539986 ) ) ( not ( = ?auto_539975 ?auto_539987 ) ) ( not ( = ?auto_539976 ?auto_539977 ) ) ( not ( = ?auto_539976 ?auto_539978 ) ) ( not ( = ?auto_539976 ?auto_539979 ) ) ( not ( = ?auto_539976 ?auto_539980 ) ) ( not ( = ?auto_539976 ?auto_539981 ) ) ( not ( = ?auto_539976 ?auto_539982 ) ) ( not ( = ?auto_539976 ?auto_539983 ) ) ( not ( = ?auto_539976 ?auto_539984 ) ) ( not ( = ?auto_539976 ?auto_539985 ) ) ( not ( = ?auto_539976 ?auto_539986 ) ) ( not ( = ?auto_539976 ?auto_539987 ) ) ( not ( = ?auto_539977 ?auto_539978 ) ) ( not ( = ?auto_539977 ?auto_539979 ) ) ( not ( = ?auto_539977 ?auto_539980 ) ) ( not ( = ?auto_539977 ?auto_539981 ) ) ( not ( = ?auto_539977 ?auto_539982 ) ) ( not ( = ?auto_539977 ?auto_539983 ) ) ( not ( = ?auto_539977 ?auto_539984 ) ) ( not ( = ?auto_539977 ?auto_539985 ) ) ( not ( = ?auto_539977 ?auto_539986 ) ) ( not ( = ?auto_539977 ?auto_539987 ) ) ( not ( = ?auto_539978 ?auto_539979 ) ) ( not ( = ?auto_539978 ?auto_539980 ) ) ( not ( = ?auto_539978 ?auto_539981 ) ) ( not ( = ?auto_539978 ?auto_539982 ) ) ( not ( = ?auto_539978 ?auto_539983 ) ) ( not ( = ?auto_539978 ?auto_539984 ) ) ( not ( = ?auto_539978 ?auto_539985 ) ) ( not ( = ?auto_539978 ?auto_539986 ) ) ( not ( = ?auto_539978 ?auto_539987 ) ) ( not ( = ?auto_539979 ?auto_539980 ) ) ( not ( = ?auto_539979 ?auto_539981 ) ) ( not ( = ?auto_539979 ?auto_539982 ) ) ( not ( = ?auto_539979 ?auto_539983 ) ) ( not ( = ?auto_539979 ?auto_539984 ) ) ( not ( = ?auto_539979 ?auto_539985 ) ) ( not ( = ?auto_539979 ?auto_539986 ) ) ( not ( = ?auto_539979 ?auto_539987 ) ) ( not ( = ?auto_539980 ?auto_539981 ) ) ( not ( = ?auto_539980 ?auto_539982 ) ) ( not ( = ?auto_539980 ?auto_539983 ) ) ( not ( = ?auto_539980 ?auto_539984 ) ) ( not ( = ?auto_539980 ?auto_539985 ) ) ( not ( = ?auto_539980 ?auto_539986 ) ) ( not ( = ?auto_539980 ?auto_539987 ) ) ( not ( = ?auto_539981 ?auto_539982 ) ) ( not ( = ?auto_539981 ?auto_539983 ) ) ( not ( = ?auto_539981 ?auto_539984 ) ) ( not ( = ?auto_539981 ?auto_539985 ) ) ( not ( = ?auto_539981 ?auto_539986 ) ) ( not ( = ?auto_539981 ?auto_539987 ) ) ( not ( = ?auto_539982 ?auto_539983 ) ) ( not ( = ?auto_539982 ?auto_539984 ) ) ( not ( = ?auto_539982 ?auto_539985 ) ) ( not ( = ?auto_539982 ?auto_539986 ) ) ( not ( = ?auto_539982 ?auto_539987 ) ) ( not ( = ?auto_539983 ?auto_539984 ) ) ( not ( = ?auto_539983 ?auto_539985 ) ) ( not ( = ?auto_539983 ?auto_539986 ) ) ( not ( = ?auto_539983 ?auto_539987 ) ) ( not ( = ?auto_539984 ?auto_539985 ) ) ( not ( = ?auto_539984 ?auto_539986 ) ) ( not ( = ?auto_539984 ?auto_539987 ) ) ( not ( = ?auto_539985 ?auto_539986 ) ) ( not ( = ?auto_539985 ?auto_539987 ) ) ( not ( = ?auto_539986 ?auto_539987 ) ) ( ON ?auto_539986 ?auto_539987 ) ( ON ?auto_539985 ?auto_539986 ) ( ON ?auto_539984 ?auto_539985 ) ( ON ?auto_539983 ?auto_539984 ) ( ON ?auto_539982 ?auto_539983 ) ( ON ?auto_539981 ?auto_539982 ) ( ON ?auto_539980 ?auto_539981 ) ( ON ?auto_539979 ?auto_539980 ) ( ON ?auto_539978 ?auto_539979 ) ( ON ?auto_539977 ?auto_539978 ) ( ON ?auto_539976 ?auto_539977 ) ( CLEAR ?auto_539974 ) ( ON ?auto_539975 ?auto_539976 ) ( CLEAR ?auto_539975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_539972 ?auto_539973 ?auto_539974 ?auto_539975 )
      ( MAKE-16PILE ?auto_539972 ?auto_539973 ?auto_539974 ?auto_539975 ?auto_539976 ?auto_539977 ?auto_539978 ?auto_539979 ?auto_539980 ?auto_539981 ?auto_539982 ?auto_539983 ?auto_539984 ?auto_539985 ?auto_539986 ?auto_539987 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540004 - BLOCK
      ?auto_540005 - BLOCK
      ?auto_540006 - BLOCK
      ?auto_540007 - BLOCK
      ?auto_540008 - BLOCK
      ?auto_540009 - BLOCK
      ?auto_540010 - BLOCK
      ?auto_540011 - BLOCK
      ?auto_540012 - BLOCK
      ?auto_540013 - BLOCK
      ?auto_540014 - BLOCK
      ?auto_540015 - BLOCK
      ?auto_540016 - BLOCK
      ?auto_540017 - BLOCK
      ?auto_540018 - BLOCK
      ?auto_540019 - BLOCK
    )
    :vars
    (
      ?auto_540020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540019 ?auto_540020 ) ( ON-TABLE ?auto_540004 ) ( ON ?auto_540005 ?auto_540004 ) ( not ( = ?auto_540004 ?auto_540005 ) ) ( not ( = ?auto_540004 ?auto_540006 ) ) ( not ( = ?auto_540004 ?auto_540007 ) ) ( not ( = ?auto_540004 ?auto_540008 ) ) ( not ( = ?auto_540004 ?auto_540009 ) ) ( not ( = ?auto_540004 ?auto_540010 ) ) ( not ( = ?auto_540004 ?auto_540011 ) ) ( not ( = ?auto_540004 ?auto_540012 ) ) ( not ( = ?auto_540004 ?auto_540013 ) ) ( not ( = ?auto_540004 ?auto_540014 ) ) ( not ( = ?auto_540004 ?auto_540015 ) ) ( not ( = ?auto_540004 ?auto_540016 ) ) ( not ( = ?auto_540004 ?auto_540017 ) ) ( not ( = ?auto_540004 ?auto_540018 ) ) ( not ( = ?auto_540004 ?auto_540019 ) ) ( not ( = ?auto_540004 ?auto_540020 ) ) ( not ( = ?auto_540005 ?auto_540006 ) ) ( not ( = ?auto_540005 ?auto_540007 ) ) ( not ( = ?auto_540005 ?auto_540008 ) ) ( not ( = ?auto_540005 ?auto_540009 ) ) ( not ( = ?auto_540005 ?auto_540010 ) ) ( not ( = ?auto_540005 ?auto_540011 ) ) ( not ( = ?auto_540005 ?auto_540012 ) ) ( not ( = ?auto_540005 ?auto_540013 ) ) ( not ( = ?auto_540005 ?auto_540014 ) ) ( not ( = ?auto_540005 ?auto_540015 ) ) ( not ( = ?auto_540005 ?auto_540016 ) ) ( not ( = ?auto_540005 ?auto_540017 ) ) ( not ( = ?auto_540005 ?auto_540018 ) ) ( not ( = ?auto_540005 ?auto_540019 ) ) ( not ( = ?auto_540005 ?auto_540020 ) ) ( not ( = ?auto_540006 ?auto_540007 ) ) ( not ( = ?auto_540006 ?auto_540008 ) ) ( not ( = ?auto_540006 ?auto_540009 ) ) ( not ( = ?auto_540006 ?auto_540010 ) ) ( not ( = ?auto_540006 ?auto_540011 ) ) ( not ( = ?auto_540006 ?auto_540012 ) ) ( not ( = ?auto_540006 ?auto_540013 ) ) ( not ( = ?auto_540006 ?auto_540014 ) ) ( not ( = ?auto_540006 ?auto_540015 ) ) ( not ( = ?auto_540006 ?auto_540016 ) ) ( not ( = ?auto_540006 ?auto_540017 ) ) ( not ( = ?auto_540006 ?auto_540018 ) ) ( not ( = ?auto_540006 ?auto_540019 ) ) ( not ( = ?auto_540006 ?auto_540020 ) ) ( not ( = ?auto_540007 ?auto_540008 ) ) ( not ( = ?auto_540007 ?auto_540009 ) ) ( not ( = ?auto_540007 ?auto_540010 ) ) ( not ( = ?auto_540007 ?auto_540011 ) ) ( not ( = ?auto_540007 ?auto_540012 ) ) ( not ( = ?auto_540007 ?auto_540013 ) ) ( not ( = ?auto_540007 ?auto_540014 ) ) ( not ( = ?auto_540007 ?auto_540015 ) ) ( not ( = ?auto_540007 ?auto_540016 ) ) ( not ( = ?auto_540007 ?auto_540017 ) ) ( not ( = ?auto_540007 ?auto_540018 ) ) ( not ( = ?auto_540007 ?auto_540019 ) ) ( not ( = ?auto_540007 ?auto_540020 ) ) ( not ( = ?auto_540008 ?auto_540009 ) ) ( not ( = ?auto_540008 ?auto_540010 ) ) ( not ( = ?auto_540008 ?auto_540011 ) ) ( not ( = ?auto_540008 ?auto_540012 ) ) ( not ( = ?auto_540008 ?auto_540013 ) ) ( not ( = ?auto_540008 ?auto_540014 ) ) ( not ( = ?auto_540008 ?auto_540015 ) ) ( not ( = ?auto_540008 ?auto_540016 ) ) ( not ( = ?auto_540008 ?auto_540017 ) ) ( not ( = ?auto_540008 ?auto_540018 ) ) ( not ( = ?auto_540008 ?auto_540019 ) ) ( not ( = ?auto_540008 ?auto_540020 ) ) ( not ( = ?auto_540009 ?auto_540010 ) ) ( not ( = ?auto_540009 ?auto_540011 ) ) ( not ( = ?auto_540009 ?auto_540012 ) ) ( not ( = ?auto_540009 ?auto_540013 ) ) ( not ( = ?auto_540009 ?auto_540014 ) ) ( not ( = ?auto_540009 ?auto_540015 ) ) ( not ( = ?auto_540009 ?auto_540016 ) ) ( not ( = ?auto_540009 ?auto_540017 ) ) ( not ( = ?auto_540009 ?auto_540018 ) ) ( not ( = ?auto_540009 ?auto_540019 ) ) ( not ( = ?auto_540009 ?auto_540020 ) ) ( not ( = ?auto_540010 ?auto_540011 ) ) ( not ( = ?auto_540010 ?auto_540012 ) ) ( not ( = ?auto_540010 ?auto_540013 ) ) ( not ( = ?auto_540010 ?auto_540014 ) ) ( not ( = ?auto_540010 ?auto_540015 ) ) ( not ( = ?auto_540010 ?auto_540016 ) ) ( not ( = ?auto_540010 ?auto_540017 ) ) ( not ( = ?auto_540010 ?auto_540018 ) ) ( not ( = ?auto_540010 ?auto_540019 ) ) ( not ( = ?auto_540010 ?auto_540020 ) ) ( not ( = ?auto_540011 ?auto_540012 ) ) ( not ( = ?auto_540011 ?auto_540013 ) ) ( not ( = ?auto_540011 ?auto_540014 ) ) ( not ( = ?auto_540011 ?auto_540015 ) ) ( not ( = ?auto_540011 ?auto_540016 ) ) ( not ( = ?auto_540011 ?auto_540017 ) ) ( not ( = ?auto_540011 ?auto_540018 ) ) ( not ( = ?auto_540011 ?auto_540019 ) ) ( not ( = ?auto_540011 ?auto_540020 ) ) ( not ( = ?auto_540012 ?auto_540013 ) ) ( not ( = ?auto_540012 ?auto_540014 ) ) ( not ( = ?auto_540012 ?auto_540015 ) ) ( not ( = ?auto_540012 ?auto_540016 ) ) ( not ( = ?auto_540012 ?auto_540017 ) ) ( not ( = ?auto_540012 ?auto_540018 ) ) ( not ( = ?auto_540012 ?auto_540019 ) ) ( not ( = ?auto_540012 ?auto_540020 ) ) ( not ( = ?auto_540013 ?auto_540014 ) ) ( not ( = ?auto_540013 ?auto_540015 ) ) ( not ( = ?auto_540013 ?auto_540016 ) ) ( not ( = ?auto_540013 ?auto_540017 ) ) ( not ( = ?auto_540013 ?auto_540018 ) ) ( not ( = ?auto_540013 ?auto_540019 ) ) ( not ( = ?auto_540013 ?auto_540020 ) ) ( not ( = ?auto_540014 ?auto_540015 ) ) ( not ( = ?auto_540014 ?auto_540016 ) ) ( not ( = ?auto_540014 ?auto_540017 ) ) ( not ( = ?auto_540014 ?auto_540018 ) ) ( not ( = ?auto_540014 ?auto_540019 ) ) ( not ( = ?auto_540014 ?auto_540020 ) ) ( not ( = ?auto_540015 ?auto_540016 ) ) ( not ( = ?auto_540015 ?auto_540017 ) ) ( not ( = ?auto_540015 ?auto_540018 ) ) ( not ( = ?auto_540015 ?auto_540019 ) ) ( not ( = ?auto_540015 ?auto_540020 ) ) ( not ( = ?auto_540016 ?auto_540017 ) ) ( not ( = ?auto_540016 ?auto_540018 ) ) ( not ( = ?auto_540016 ?auto_540019 ) ) ( not ( = ?auto_540016 ?auto_540020 ) ) ( not ( = ?auto_540017 ?auto_540018 ) ) ( not ( = ?auto_540017 ?auto_540019 ) ) ( not ( = ?auto_540017 ?auto_540020 ) ) ( not ( = ?auto_540018 ?auto_540019 ) ) ( not ( = ?auto_540018 ?auto_540020 ) ) ( not ( = ?auto_540019 ?auto_540020 ) ) ( ON ?auto_540018 ?auto_540019 ) ( ON ?auto_540017 ?auto_540018 ) ( ON ?auto_540016 ?auto_540017 ) ( ON ?auto_540015 ?auto_540016 ) ( ON ?auto_540014 ?auto_540015 ) ( ON ?auto_540013 ?auto_540014 ) ( ON ?auto_540012 ?auto_540013 ) ( ON ?auto_540011 ?auto_540012 ) ( ON ?auto_540010 ?auto_540011 ) ( ON ?auto_540009 ?auto_540010 ) ( ON ?auto_540008 ?auto_540009 ) ( ON ?auto_540007 ?auto_540008 ) ( CLEAR ?auto_540005 ) ( ON ?auto_540006 ?auto_540007 ) ( CLEAR ?auto_540006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540004 ?auto_540005 ?auto_540006 )
      ( MAKE-16PILE ?auto_540004 ?auto_540005 ?auto_540006 ?auto_540007 ?auto_540008 ?auto_540009 ?auto_540010 ?auto_540011 ?auto_540012 ?auto_540013 ?auto_540014 ?auto_540015 ?auto_540016 ?auto_540017 ?auto_540018 ?auto_540019 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540037 - BLOCK
      ?auto_540038 - BLOCK
      ?auto_540039 - BLOCK
      ?auto_540040 - BLOCK
      ?auto_540041 - BLOCK
      ?auto_540042 - BLOCK
      ?auto_540043 - BLOCK
      ?auto_540044 - BLOCK
      ?auto_540045 - BLOCK
      ?auto_540046 - BLOCK
      ?auto_540047 - BLOCK
      ?auto_540048 - BLOCK
      ?auto_540049 - BLOCK
      ?auto_540050 - BLOCK
      ?auto_540051 - BLOCK
      ?auto_540052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_540052 ) ( ON-TABLE ?auto_540037 ) ( ON ?auto_540038 ?auto_540037 ) ( not ( = ?auto_540037 ?auto_540038 ) ) ( not ( = ?auto_540037 ?auto_540039 ) ) ( not ( = ?auto_540037 ?auto_540040 ) ) ( not ( = ?auto_540037 ?auto_540041 ) ) ( not ( = ?auto_540037 ?auto_540042 ) ) ( not ( = ?auto_540037 ?auto_540043 ) ) ( not ( = ?auto_540037 ?auto_540044 ) ) ( not ( = ?auto_540037 ?auto_540045 ) ) ( not ( = ?auto_540037 ?auto_540046 ) ) ( not ( = ?auto_540037 ?auto_540047 ) ) ( not ( = ?auto_540037 ?auto_540048 ) ) ( not ( = ?auto_540037 ?auto_540049 ) ) ( not ( = ?auto_540037 ?auto_540050 ) ) ( not ( = ?auto_540037 ?auto_540051 ) ) ( not ( = ?auto_540037 ?auto_540052 ) ) ( not ( = ?auto_540038 ?auto_540039 ) ) ( not ( = ?auto_540038 ?auto_540040 ) ) ( not ( = ?auto_540038 ?auto_540041 ) ) ( not ( = ?auto_540038 ?auto_540042 ) ) ( not ( = ?auto_540038 ?auto_540043 ) ) ( not ( = ?auto_540038 ?auto_540044 ) ) ( not ( = ?auto_540038 ?auto_540045 ) ) ( not ( = ?auto_540038 ?auto_540046 ) ) ( not ( = ?auto_540038 ?auto_540047 ) ) ( not ( = ?auto_540038 ?auto_540048 ) ) ( not ( = ?auto_540038 ?auto_540049 ) ) ( not ( = ?auto_540038 ?auto_540050 ) ) ( not ( = ?auto_540038 ?auto_540051 ) ) ( not ( = ?auto_540038 ?auto_540052 ) ) ( not ( = ?auto_540039 ?auto_540040 ) ) ( not ( = ?auto_540039 ?auto_540041 ) ) ( not ( = ?auto_540039 ?auto_540042 ) ) ( not ( = ?auto_540039 ?auto_540043 ) ) ( not ( = ?auto_540039 ?auto_540044 ) ) ( not ( = ?auto_540039 ?auto_540045 ) ) ( not ( = ?auto_540039 ?auto_540046 ) ) ( not ( = ?auto_540039 ?auto_540047 ) ) ( not ( = ?auto_540039 ?auto_540048 ) ) ( not ( = ?auto_540039 ?auto_540049 ) ) ( not ( = ?auto_540039 ?auto_540050 ) ) ( not ( = ?auto_540039 ?auto_540051 ) ) ( not ( = ?auto_540039 ?auto_540052 ) ) ( not ( = ?auto_540040 ?auto_540041 ) ) ( not ( = ?auto_540040 ?auto_540042 ) ) ( not ( = ?auto_540040 ?auto_540043 ) ) ( not ( = ?auto_540040 ?auto_540044 ) ) ( not ( = ?auto_540040 ?auto_540045 ) ) ( not ( = ?auto_540040 ?auto_540046 ) ) ( not ( = ?auto_540040 ?auto_540047 ) ) ( not ( = ?auto_540040 ?auto_540048 ) ) ( not ( = ?auto_540040 ?auto_540049 ) ) ( not ( = ?auto_540040 ?auto_540050 ) ) ( not ( = ?auto_540040 ?auto_540051 ) ) ( not ( = ?auto_540040 ?auto_540052 ) ) ( not ( = ?auto_540041 ?auto_540042 ) ) ( not ( = ?auto_540041 ?auto_540043 ) ) ( not ( = ?auto_540041 ?auto_540044 ) ) ( not ( = ?auto_540041 ?auto_540045 ) ) ( not ( = ?auto_540041 ?auto_540046 ) ) ( not ( = ?auto_540041 ?auto_540047 ) ) ( not ( = ?auto_540041 ?auto_540048 ) ) ( not ( = ?auto_540041 ?auto_540049 ) ) ( not ( = ?auto_540041 ?auto_540050 ) ) ( not ( = ?auto_540041 ?auto_540051 ) ) ( not ( = ?auto_540041 ?auto_540052 ) ) ( not ( = ?auto_540042 ?auto_540043 ) ) ( not ( = ?auto_540042 ?auto_540044 ) ) ( not ( = ?auto_540042 ?auto_540045 ) ) ( not ( = ?auto_540042 ?auto_540046 ) ) ( not ( = ?auto_540042 ?auto_540047 ) ) ( not ( = ?auto_540042 ?auto_540048 ) ) ( not ( = ?auto_540042 ?auto_540049 ) ) ( not ( = ?auto_540042 ?auto_540050 ) ) ( not ( = ?auto_540042 ?auto_540051 ) ) ( not ( = ?auto_540042 ?auto_540052 ) ) ( not ( = ?auto_540043 ?auto_540044 ) ) ( not ( = ?auto_540043 ?auto_540045 ) ) ( not ( = ?auto_540043 ?auto_540046 ) ) ( not ( = ?auto_540043 ?auto_540047 ) ) ( not ( = ?auto_540043 ?auto_540048 ) ) ( not ( = ?auto_540043 ?auto_540049 ) ) ( not ( = ?auto_540043 ?auto_540050 ) ) ( not ( = ?auto_540043 ?auto_540051 ) ) ( not ( = ?auto_540043 ?auto_540052 ) ) ( not ( = ?auto_540044 ?auto_540045 ) ) ( not ( = ?auto_540044 ?auto_540046 ) ) ( not ( = ?auto_540044 ?auto_540047 ) ) ( not ( = ?auto_540044 ?auto_540048 ) ) ( not ( = ?auto_540044 ?auto_540049 ) ) ( not ( = ?auto_540044 ?auto_540050 ) ) ( not ( = ?auto_540044 ?auto_540051 ) ) ( not ( = ?auto_540044 ?auto_540052 ) ) ( not ( = ?auto_540045 ?auto_540046 ) ) ( not ( = ?auto_540045 ?auto_540047 ) ) ( not ( = ?auto_540045 ?auto_540048 ) ) ( not ( = ?auto_540045 ?auto_540049 ) ) ( not ( = ?auto_540045 ?auto_540050 ) ) ( not ( = ?auto_540045 ?auto_540051 ) ) ( not ( = ?auto_540045 ?auto_540052 ) ) ( not ( = ?auto_540046 ?auto_540047 ) ) ( not ( = ?auto_540046 ?auto_540048 ) ) ( not ( = ?auto_540046 ?auto_540049 ) ) ( not ( = ?auto_540046 ?auto_540050 ) ) ( not ( = ?auto_540046 ?auto_540051 ) ) ( not ( = ?auto_540046 ?auto_540052 ) ) ( not ( = ?auto_540047 ?auto_540048 ) ) ( not ( = ?auto_540047 ?auto_540049 ) ) ( not ( = ?auto_540047 ?auto_540050 ) ) ( not ( = ?auto_540047 ?auto_540051 ) ) ( not ( = ?auto_540047 ?auto_540052 ) ) ( not ( = ?auto_540048 ?auto_540049 ) ) ( not ( = ?auto_540048 ?auto_540050 ) ) ( not ( = ?auto_540048 ?auto_540051 ) ) ( not ( = ?auto_540048 ?auto_540052 ) ) ( not ( = ?auto_540049 ?auto_540050 ) ) ( not ( = ?auto_540049 ?auto_540051 ) ) ( not ( = ?auto_540049 ?auto_540052 ) ) ( not ( = ?auto_540050 ?auto_540051 ) ) ( not ( = ?auto_540050 ?auto_540052 ) ) ( not ( = ?auto_540051 ?auto_540052 ) ) ( ON ?auto_540051 ?auto_540052 ) ( ON ?auto_540050 ?auto_540051 ) ( ON ?auto_540049 ?auto_540050 ) ( ON ?auto_540048 ?auto_540049 ) ( ON ?auto_540047 ?auto_540048 ) ( ON ?auto_540046 ?auto_540047 ) ( ON ?auto_540045 ?auto_540046 ) ( ON ?auto_540044 ?auto_540045 ) ( ON ?auto_540043 ?auto_540044 ) ( ON ?auto_540042 ?auto_540043 ) ( ON ?auto_540041 ?auto_540042 ) ( ON ?auto_540040 ?auto_540041 ) ( CLEAR ?auto_540038 ) ( ON ?auto_540039 ?auto_540040 ) ( CLEAR ?auto_540039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540037 ?auto_540038 ?auto_540039 )
      ( MAKE-16PILE ?auto_540037 ?auto_540038 ?auto_540039 ?auto_540040 ?auto_540041 ?auto_540042 ?auto_540043 ?auto_540044 ?auto_540045 ?auto_540046 ?auto_540047 ?auto_540048 ?auto_540049 ?auto_540050 ?auto_540051 ?auto_540052 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540069 - BLOCK
      ?auto_540070 - BLOCK
      ?auto_540071 - BLOCK
      ?auto_540072 - BLOCK
      ?auto_540073 - BLOCK
      ?auto_540074 - BLOCK
      ?auto_540075 - BLOCK
      ?auto_540076 - BLOCK
      ?auto_540077 - BLOCK
      ?auto_540078 - BLOCK
      ?auto_540079 - BLOCK
      ?auto_540080 - BLOCK
      ?auto_540081 - BLOCK
      ?auto_540082 - BLOCK
      ?auto_540083 - BLOCK
      ?auto_540084 - BLOCK
    )
    :vars
    (
      ?auto_540085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540084 ?auto_540085 ) ( ON-TABLE ?auto_540069 ) ( not ( = ?auto_540069 ?auto_540070 ) ) ( not ( = ?auto_540069 ?auto_540071 ) ) ( not ( = ?auto_540069 ?auto_540072 ) ) ( not ( = ?auto_540069 ?auto_540073 ) ) ( not ( = ?auto_540069 ?auto_540074 ) ) ( not ( = ?auto_540069 ?auto_540075 ) ) ( not ( = ?auto_540069 ?auto_540076 ) ) ( not ( = ?auto_540069 ?auto_540077 ) ) ( not ( = ?auto_540069 ?auto_540078 ) ) ( not ( = ?auto_540069 ?auto_540079 ) ) ( not ( = ?auto_540069 ?auto_540080 ) ) ( not ( = ?auto_540069 ?auto_540081 ) ) ( not ( = ?auto_540069 ?auto_540082 ) ) ( not ( = ?auto_540069 ?auto_540083 ) ) ( not ( = ?auto_540069 ?auto_540084 ) ) ( not ( = ?auto_540069 ?auto_540085 ) ) ( not ( = ?auto_540070 ?auto_540071 ) ) ( not ( = ?auto_540070 ?auto_540072 ) ) ( not ( = ?auto_540070 ?auto_540073 ) ) ( not ( = ?auto_540070 ?auto_540074 ) ) ( not ( = ?auto_540070 ?auto_540075 ) ) ( not ( = ?auto_540070 ?auto_540076 ) ) ( not ( = ?auto_540070 ?auto_540077 ) ) ( not ( = ?auto_540070 ?auto_540078 ) ) ( not ( = ?auto_540070 ?auto_540079 ) ) ( not ( = ?auto_540070 ?auto_540080 ) ) ( not ( = ?auto_540070 ?auto_540081 ) ) ( not ( = ?auto_540070 ?auto_540082 ) ) ( not ( = ?auto_540070 ?auto_540083 ) ) ( not ( = ?auto_540070 ?auto_540084 ) ) ( not ( = ?auto_540070 ?auto_540085 ) ) ( not ( = ?auto_540071 ?auto_540072 ) ) ( not ( = ?auto_540071 ?auto_540073 ) ) ( not ( = ?auto_540071 ?auto_540074 ) ) ( not ( = ?auto_540071 ?auto_540075 ) ) ( not ( = ?auto_540071 ?auto_540076 ) ) ( not ( = ?auto_540071 ?auto_540077 ) ) ( not ( = ?auto_540071 ?auto_540078 ) ) ( not ( = ?auto_540071 ?auto_540079 ) ) ( not ( = ?auto_540071 ?auto_540080 ) ) ( not ( = ?auto_540071 ?auto_540081 ) ) ( not ( = ?auto_540071 ?auto_540082 ) ) ( not ( = ?auto_540071 ?auto_540083 ) ) ( not ( = ?auto_540071 ?auto_540084 ) ) ( not ( = ?auto_540071 ?auto_540085 ) ) ( not ( = ?auto_540072 ?auto_540073 ) ) ( not ( = ?auto_540072 ?auto_540074 ) ) ( not ( = ?auto_540072 ?auto_540075 ) ) ( not ( = ?auto_540072 ?auto_540076 ) ) ( not ( = ?auto_540072 ?auto_540077 ) ) ( not ( = ?auto_540072 ?auto_540078 ) ) ( not ( = ?auto_540072 ?auto_540079 ) ) ( not ( = ?auto_540072 ?auto_540080 ) ) ( not ( = ?auto_540072 ?auto_540081 ) ) ( not ( = ?auto_540072 ?auto_540082 ) ) ( not ( = ?auto_540072 ?auto_540083 ) ) ( not ( = ?auto_540072 ?auto_540084 ) ) ( not ( = ?auto_540072 ?auto_540085 ) ) ( not ( = ?auto_540073 ?auto_540074 ) ) ( not ( = ?auto_540073 ?auto_540075 ) ) ( not ( = ?auto_540073 ?auto_540076 ) ) ( not ( = ?auto_540073 ?auto_540077 ) ) ( not ( = ?auto_540073 ?auto_540078 ) ) ( not ( = ?auto_540073 ?auto_540079 ) ) ( not ( = ?auto_540073 ?auto_540080 ) ) ( not ( = ?auto_540073 ?auto_540081 ) ) ( not ( = ?auto_540073 ?auto_540082 ) ) ( not ( = ?auto_540073 ?auto_540083 ) ) ( not ( = ?auto_540073 ?auto_540084 ) ) ( not ( = ?auto_540073 ?auto_540085 ) ) ( not ( = ?auto_540074 ?auto_540075 ) ) ( not ( = ?auto_540074 ?auto_540076 ) ) ( not ( = ?auto_540074 ?auto_540077 ) ) ( not ( = ?auto_540074 ?auto_540078 ) ) ( not ( = ?auto_540074 ?auto_540079 ) ) ( not ( = ?auto_540074 ?auto_540080 ) ) ( not ( = ?auto_540074 ?auto_540081 ) ) ( not ( = ?auto_540074 ?auto_540082 ) ) ( not ( = ?auto_540074 ?auto_540083 ) ) ( not ( = ?auto_540074 ?auto_540084 ) ) ( not ( = ?auto_540074 ?auto_540085 ) ) ( not ( = ?auto_540075 ?auto_540076 ) ) ( not ( = ?auto_540075 ?auto_540077 ) ) ( not ( = ?auto_540075 ?auto_540078 ) ) ( not ( = ?auto_540075 ?auto_540079 ) ) ( not ( = ?auto_540075 ?auto_540080 ) ) ( not ( = ?auto_540075 ?auto_540081 ) ) ( not ( = ?auto_540075 ?auto_540082 ) ) ( not ( = ?auto_540075 ?auto_540083 ) ) ( not ( = ?auto_540075 ?auto_540084 ) ) ( not ( = ?auto_540075 ?auto_540085 ) ) ( not ( = ?auto_540076 ?auto_540077 ) ) ( not ( = ?auto_540076 ?auto_540078 ) ) ( not ( = ?auto_540076 ?auto_540079 ) ) ( not ( = ?auto_540076 ?auto_540080 ) ) ( not ( = ?auto_540076 ?auto_540081 ) ) ( not ( = ?auto_540076 ?auto_540082 ) ) ( not ( = ?auto_540076 ?auto_540083 ) ) ( not ( = ?auto_540076 ?auto_540084 ) ) ( not ( = ?auto_540076 ?auto_540085 ) ) ( not ( = ?auto_540077 ?auto_540078 ) ) ( not ( = ?auto_540077 ?auto_540079 ) ) ( not ( = ?auto_540077 ?auto_540080 ) ) ( not ( = ?auto_540077 ?auto_540081 ) ) ( not ( = ?auto_540077 ?auto_540082 ) ) ( not ( = ?auto_540077 ?auto_540083 ) ) ( not ( = ?auto_540077 ?auto_540084 ) ) ( not ( = ?auto_540077 ?auto_540085 ) ) ( not ( = ?auto_540078 ?auto_540079 ) ) ( not ( = ?auto_540078 ?auto_540080 ) ) ( not ( = ?auto_540078 ?auto_540081 ) ) ( not ( = ?auto_540078 ?auto_540082 ) ) ( not ( = ?auto_540078 ?auto_540083 ) ) ( not ( = ?auto_540078 ?auto_540084 ) ) ( not ( = ?auto_540078 ?auto_540085 ) ) ( not ( = ?auto_540079 ?auto_540080 ) ) ( not ( = ?auto_540079 ?auto_540081 ) ) ( not ( = ?auto_540079 ?auto_540082 ) ) ( not ( = ?auto_540079 ?auto_540083 ) ) ( not ( = ?auto_540079 ?auto_540084 ) ) ( not ( = ?auto_540079 ?auto_540085 ) ) ( not ( = ?auto_540080 ?auto_540081 ) ) ( not ( = ?auto_540080 ?auto_540082 ) ) ( not ( = ?auto_540080 ?auto_540083 ) ) ( not ( = ?auto_540080 ?auto_540084 ) ) ( not ( = ?auto_540080 ?auto_540085 ) ) ( not ( = ?auto_540081 ?auto_540082 ) ) ( not ( = ?auto_540081 ?auto_540083 ) ) ( not ( = ?auto_540081 ?auto_540084 ) ) ( not ( = ?auto_540081 ?auto_540085 ) ) ( not ( = ?auto_540082 ?auto_540083 ) ) ( not ( = ?auto_540082 ?auto_540084 ) ) ( not ( = ?auto_540082 ?auto_540085 ) ) ( not ( = ?auto_540083 ?auto_540084 ) ) ( not ( = ?auto_540083 ?auto_540085 ) ) ( not ( = ?auto_540084 ?auto_540085 ) ) ( ON ?auto_540083 ?auto_540084 ) ( ON ?auto_540082 ?auto_540083 ) ( ON ?auto_540081 ?auto_540082 ) ( ON ?auto_540080 ?auto_540081 ) ( ON ?auto_540079 ?auto_540080 ) ( ON ?auto_540078 ?auto_540079 ) ( ON ?auto_540077 ?auto_540078 ) ( ON ?auto_540076 ?auto_540077 ) ( ON ?auto_540075 ?auto_540076 ) ( ON ?auto_540074 ?auto_540075 ) ( ON ?auto_540073 ?auto_540074 ) ( ON ?auto_540072 ?auto_540073 ) ( ON ?auto_540071 ?auto_540072 ) ( CLEAR ?auto_540069 ) ( ON ?auto_540070 ?auto_540071 ) ( CLEAR ?auto_540070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540069 ?auto_540070 )
      ( MAKE-16PILE ?auto_540069 ?auto_540070 ?auto_540071 ?auto_540072 ?auto_540073 ?auto_540074 ?auto_540075 ?auto_540076 ?auto_540077 ?auto_540078 ?auto_540079 ?auto_540080 ?auto_540081 ?auto_540082 ?auto_540083 ?auto_540084 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540102 - BLOCK
      ?auto_540103 - BLOCK
      ?auto_540104 - BLOCK
      ?auto_540105 - BLOCK
      ?auto_540106 - BLOCK
      ?auto_540107 - BLOCK
      ?auto_540108 - BLOCK
      ?auto_540109 - BLOCK
      ?auto_540110 - BLOCK
      ?auto_540111 - BLOCK
      ?auto_540112 - BLOCK
      ?auto_540113 - BLOCK
      ?auto_540114 - BLOCK
      ?auto_540115 - BLOCK
      ?auto_540116 - BLOCK
      ?auto_540117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_540117 ) ( ON-TABLE ?auto_540102 ) ( not ( = ?auto_540102 ?auto_540103 ) ) ( not ( = ?auto_540102 ?auto_540104 ) ) ( not ( = ?auto_540102 ?auto_540105 ) ) ( not ( = ?auto_540102 ?auto_540106 ) ) ( not ( = ?auto_540102 ?auto_540107 ) ) ( not ( = ?auto_540102 ?auto_540108 ) ) ( not ( = ?auto_540102 ?auto_540109 ) ) ( not ( = ?auto_540102 ?auto_540110 ) ) ( not ( = ?auto_540102 ?auto_540111 ) ) ( not ( = ?auto_540102 ?auto_540112 ) ) ( not ( = ?auto_540102 ?auto_540113 ) ) ( not ( = ?auto_540102 ?auto_540114 ) ) ( not ( = ?auto_540102 ?auto_540115 ) ) ( not ( = ?auto_540102 ?auto_540116 ) ) ( not ( = ?auto_540102 ?auto_540117 ) ) ( not ( = ?auto_540103 ?auto_540104 ) ) ( not ( = ?auto_540103 ?auto_540105 ) ) ( not ( = ?auto_540103 ?auto_540106 ) ) ( not ( = ?auto_540103 ?auto_540107 ) ) ( not ( = ?auto_540103 ?auto_540108 ) ) ( not ( = ?auto_540103 ?auto_540109 ) ) ( not ( = ?auto_540103 ?auto_540110 ) ) ( not ( = ?auto_540103 ?auto_540111 ) ) ( not ( = ?auto_540103 ?auto_540112 ) ) ( not ( = ?auto_540103 ?auto_540113 ) ) ( not ( = ?auto_540103 ?auto_540114 ) ) ( not ( = ?auto_540103 ?auto_540115 ) ) ( not ( = ?auto_540103 ?auto_540116 ) ) ( not ( = ?auto_540103 ?auto_540117 ) ) ( not ( = ?auto_540104 ?auto_540105 ) ) ( not ( = ?auto_540104 ?auto_540106 ) ) ( not ( = ?auto_540104 ?auto_540107 ) ) ( not ( = ?auto_540104 ?auto_540108 ) ) ( not ( = ?auto_540104 ?auto_540109 ) ) ( not ( = ?auto_540104 ?auto_540110 ) ) ( not ( = ?auto_540104 ?auto_540111 ) ) ( not ( = ?auto_540104 ?auto_540112 ) ) ( not ( = ?auto_540104 ?auto_540113 ) ) ( not ( = ?auto_540104 ?auto_540114 ) ) ( not ( = ?auto_540104 ?auto_540115 ) ) ( not ( = ?auto_540104 ?auto_540116 ) ) ( not ( = ?auto_540104 ?auto_540117 ) ) ( not ( = ?auto_540105 ?auto_540106 ) ) ( not ( = ?auto_540105 ?auto_540107 ) ) ( not ( = ?auto_540105 ?auto_540108 ) ) ( not ( = ?auto_540105 ?auto_540109 ) ) ( not ( = ?auto_540105 ?auto_540110 ) ) ( not ( = ?auto_540105 ?auto_540111 ) ) ( not ( = ?auto_540105 ?auto_540112 ) ) ( not ( = ?auto_540105 ?auto_540113 ) ) ( not ( = ?auto_540105 ?auto_540114 ) ) ( not ( = ?auto_540105 ?auto_540115 ) ) ( not ( = ?auto_540105 ?auto_540116 ) ) ( not ( = ?auto_540105 ?auto_540117 ) ) ( not ( = ?auto_540106 ?auto_540107 ) ) ( not ( = ?auto_540106 ?auto_540108 ) ) ( not ( = ?auto_540106 ?auto_540109 ) ) ( not ( = ?auto_540106 ?auto_540110 ) ) ( not ( = ?auto_540106 ?auto_540111 ) ) ( not ( = ?auto_540106 ?auto_540112 ) ) ( not ( = ?auto_540106 ?auto_540113 ) ) ( not ( = ?auto_540106 ?auto_540114 ) ) ( not ( = ?auto_540106 ?auto_540115 ) ) ( not ( = ?auto_540106 ?auto_540116 ) ) ( not ( = ?auto_540106 ?auto_540117 ) ) ( not ( = ?auto_540107 ?auto_540108 ) ) ( not ( = ?auto_540107 ?auto_540109 ) ) ( not ( = ?auto_540107 ?auto_540110 ) ) ( not ( = ?auto_540107 ?auto_540111 ) ) ( not ( = ?auto_540107 ?auto_540112 ) ) ( not ( = ?auto_540107 ?auto_540113 ) ) ( not ( = ?auto_540107 ?auto_540114 ) ) ( not ( = ?auto_540107 ?auto_540115 ) ) ( not ( = ?auto_540107 ?auto_540116 ) ) ( not ( = ?auto_540107 ?auto_540117 ) ) ( not ( = ?auto_540108 ?auto_540109 ) ) ( not ( = ?auto_540108 ?auto_540110 ) ) ( not ( = ?auto_540108 ?auto_540111 ) ) ( not ( = ?auto_540108 ?auto_540112 ) ) ( not ( = ?auto_540108 ?auto_540113 ) ) ( not ( = ?auto_540108 ?auto_540114 ) ) ( not ( = ?auto_540108 ?auto_540115 ) ) ( not ( = ?auto_540108 ?auto_540116 ) ) ( not ( = ?auto_540108 ?auto_540117 ) ) ( not ( = ?auto_540109 ?auto_540110 ) ) ( not ( = ?auto_540109 ?auto_540111 ) ) ( not ( = ?auto_540109 ?auto_540112 ) ) ( not ( = ?auto_540109 ?auto_540113 ) ) ( not ( = ?auto_540109 ?auto_540114 ) ) ( not ( = ?auto_540109 ?auto_540115 ) ) ( not ( = ?auto_540109 ?auto_540116 ) ) ( not ( = ?auto_540109 ?auto_540117 ) ) ( not ( = ?auto_540110 ?auto_540111 ) ) ( not ( = ?auto_540110 ?auto_540112 ) ) ( not ( = ?auto_540110 ?auto_540113 ) ) ( not ( = ?auto_540110 ?auto_540114 ) ) ( not ( = ?auto_540110 ?auto_540115 ) ) ( not ( = ?auto_540110 ?auto_540116 ) ) ( not ( = ?auto_540110 ?auto_540117 ) ) ( not ( = ?auto_540111 ?auto_540112 ) ) ( not ( = ?auto_540111 ?auto_540113 ) ) ( not ( = ?auto_540111 ?auto_540114 ) ) ( not ( = ?auto_540111 ?auto_540115 ) ) ( not ( = ?auto_540111 ?auto_540116 ) ) ( not ( = ?auto_540111 ?auto_540117 ) ) ( not ( = ?auto_540112 ?auto_540113 ) ) ( not ( = ?auto_540112 ?auto_540114 ) ) ( not ( = ?auto_540112 ?auto_540115 ) ) ( not ( = ?auto_540112 ?auto_540116 ) ) ( not ( = ?auto_540112 ?auto_540117 ) ) ( not ( = ?auto_540113 ?auto_540114 ) ) ( not ( = ?auto_540113 ?auto_540115 ) ) ( not ( = ?auto_540113 ?auto_540116 ) ) ( not ( = ?auto_540113 ?auto_540117 ) ) ( not ( = ?auto_540114 ?auto_540115 ) ) ( not ( = ?auto_540114 ?auto_540116 ) ) ( not ( = ?auto_540114 ?auto_540117 ) ) ( not ( = ?auto_540115 ?auto_540116 ) ) ( not ( = ?auto_540115 ?auto_540117 ) ) ( not ( = ?auto_540116 ?auto_540117 ) ) ( ON ?auto_540116 ?auto_540117 ) ( ON ?auto_540115 ?auto_540116 ) ( ON ?auto_540114 ?auto_540115 ) ( ON ?auto_540113 ?auto_540114 ) ( ON ?auto_540112 ?auto_540113 ) ( ON ?auto_540111 ?auto_540112 ) ( ON ?auto_540110 ?auto_540111 ) ( ON ?auto_540109 ?auto_540110 ) ( ON ?auto_540108 ?auto_540109 ) ( ON ?auto_540107 ?auto_540108 ) ( ON ?auto_540106 ?auto_540107 ) ( ON ?auto_540105 ?auto_540106 ) ( ON ?auto_540104 ?auto_540105 ) ( CLEAR ?auto_540102 ) ( ON ?auto_540103 ?auto_540104 ) ( CLEAR ?auto_540103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540102 ?auto_540103 )
      ( MAKE-16PILE ?auto_540102 ?auto_540103 ?auto_540104 ?auto_540105 ?auto_540106 ?auto_540107 ?auto_540108 ?auto_540109 ?auto_540110 ?auto_540111 ?auto_540112 ?auto_540113 ?auto_540114 ?auto_540115 ?auto_540116 ?auto_540117 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540134 - BLOCK
      ?auto_540135 - BLOCK
      ?auto_540136 - BLOCK
      ?auto_540137 - BLOCK
      ?auto_540138 - BLOCK
      ?auto_540139 - BLOCK
      ?auto_540140 - BLOCK
      ?auto_540141 - BLOCK
      ?auto_540142 - BLOCK
      ?auto_540143 - BLOCK
      ?auto_540144 - BLOCK
      ?auto_540145 - BLOCK
      ?auto_540146 - BLOCK
      ?auto_540147 - BLOCK
      ?auto_540148 - BLOCK
      ?auto_540149 - BLOCK
    )
    :vars
    (
      ?auto_540150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540149 ?auto_540150 ) ( not ( = ?auto_540134 ?auto_540135 ) ) ( not ( = ?auto_540134 ?auto_540136 ) ) ( not ( = ?auto_540134 ?auto_540137 ) ) ( not ( = ?auto_540134 ?auto_540138 ) ) ( not ( = ?auto_540134 ?auto_540139 ) ) ( not ( = ?auto_540134 ?auto_540140 ) ) ( not ( = ?auto_540134 ?auto_540141 ) ) ( not ( = ?auto_540134 ?auto_540142 ) ) ( not ( = ?auto_540134 ?auto_540143 ) ) ( not ( = ?auto_540134 ?auto_540144 ) ) ( not ( = ?auto_540134 ?auto_540145 ) ) ( not ( = ?auto_540134 ?auto_540146 ) ) ( not ( = ?auto_540134 ?auto_540147 ) ) ( not ( = ?auto_540134 ?auto_540148 ) ) ( not ( = ?auto_540134 ?auto_540149 ) ) ( not ( = ?auto_540134 ?auto_540150 ) ) ( not ( = ?auto_540135 ?auto_540136 ) ) ( not ( = ?auto_540135 ?auto_540137 ) ) ( not ( = ?auto_540135 ?auto_540138 ) ) ( not ( = ?auto_540135 ?auto_540139 ) ) ( not ( = ?auto_540135 ?auto_540140 ) ) ( not ( = ?auto_540135 ?auto_540141 ) ) ( not ( = ?auto_540135 ?auto_540142 ) ) ( not ( = ?auto_540135 ?auto_540143 ) ) ( not ( = ?auto_540135 ?auto_540144 ) ) ( not ( = ?auto_540135 ?auto_540145 ) ) ( not ( = ?auto_540135 ?auto_540146 ) ) ( not ( = ?auto_540135 ?auto_540147 ) ) ( not ( = ?auto_540135 ?auto_540148 ) ) ( not ( = ?auto_540135 ?auto_540149 ) ) ( not ( = ?auto_540135 ?auto_540150 ) ) ( not ( = ?auto_540136 ?auto_540137 ) ) ( not ( = ?auto_540136 ?auto_540138 ) ) ( not ( = ?auto_540136 ?auto_540139 ) ) ( not ( = ?auto_540136 ?auto_540140 ) ) ( not ( = ?auto_540136 ?auto_540141 ) ) ( not ( = ?auto_540136 ?auto_540142 ) ) ( not ( = ?auto_540136 ?auto_540143 ) ) ( not ( = ?auto_540136 ?auto_540144 ) ) ( not ( = ?auto_540136 ?auto_540145 ) ) ( not ( = ?auto_540136 ?auto_540146 ) ) ( not ( = ?auto_540136 ?auto_540147 ) ) ( not ( = ?auto_540136 ?auto_540148 ) ) ( not ( = ?auto_540136 ?auto_540149 ) ) ( not ( = ?auto_540136 ?auto_540150 ) ) ( not ( = ?auto_540137 ?auto_540138 ) ) ( not ( = ?auto_540137 ?auto_540139 ) ) ( not ( = ?auto_540137 ?auto_540140 ) ) ( not ( = ?auto_540137 ?auto_540141 ) ) ( not ( = ?auto_540137 ?auto_540142 ) ) ( not ( = ?auto_540137 ?auto_540143 ) ) ( not ( = ?auto_540137 ?auto_540144 ) ) ( not ( = ?auto_540137 ?auto_540145 ) ) ( not ( = ?auto_540137 ?auto_540146 ) ) ( not ( = ?auto_540137 ?auto_540147 ) ) ( not ( = ?auto_540137 ?auto_540148 ) ) ( not ( = ?auto_540137 ?auto_540149 ) ) ( not ( = ?auto_540137 ?auto_540150 ) ) ( not ( = ?auto_540138 ?auto_540139 ) ) ( not ( = ?auto_540138 ?auto_540140 ) ) ( not ( = ?auto_540138 ?auto_540141 ) ) ( not ( = ?auto_540138 ?auto_540142 ) ) ( not ( = ?auto_540138 ?auto_540143 ) ) ( not ( = ?auto_540138 ?auto_540144 ) ) ( not ( = ?auto_540138 ?auto_540145 ) ) ( not ( = ?auto_540138 ?auto_540146 ) ) ( not ( = ?auto_540138 ?auto_540147 ) ) ( not ( = ?auto_540138 ?auto_540148 ) ) ( not ( = ?auto_540138 ?auto_540149 ) ) ( not ( = ?auto_540138 ?auto_540150 ) ) ( not ( = ?auto_540139 ?auto_540140 ) ) ( not ( = ?auto_540139 ?auto_540141 ) ) ( not ( = ?auto_540139 ?auto_540142 ) ) ( not ( = ?auto_540139 ?auto_540143 ) ) ( not ( = ?auto_540139 ?auto_540144 ) ) ( not ( = ?auto_540139 ?auto_540145 ) ) ( not ( = ?auto_540139 ?auto_540146 ) ) ( not ( = ?auto_540139 ?auto_540147 ) ) ( not ( = ?auto_540139 ?auto_540148 ) ) ( not ( = ?auto_540139 ?auto_540149 ) ) ( not ( = ?auto_540139 ?auto_540150 ) ) ( not ( = ?auto_540140 ?auto_540141 ) ) ( not ( = ?auto_540140 ?auto_540142 ) ) ( not ( = ?auto_540140 ?auto_540143 ) ) ( not ( = ?auto_540140 ?auto_540144 ) ) ( not ( = ?auto_540140 ?auto_540145 ) ) ( not ( = ?auto_540140 ?auto_540146 ) ) ( not ( = ?auto_540140 ?auto_540147 ) ) ( not ( = ?auto_540140 ?auto_540148 ) ) ( not ( = ?auto_540140 ?auto_540149 ) ) ( not ( = ?auto_540140 ?auto_540150 ) ) ( not ( = ?auto_540141 ?auto_540142 ) ) ( not ( = ?auto_540141 ?auto_540143 ) ) ( not ( = ?auto_540141 ?auto_540144 ) ) ( not ( = ?auto_540141 ?auto_540145 ) ) ( not ( = ?auto_540141 ?auto_540146 ) ) ( not ( = ?auto_540141 ?auto_540147 ) ) ( not ( = ?auto_540141 ?auto_540148 ) ) ( not ( = ?auto_540141 ?auto_540149 ) ) ( not ( = ?auto_540141 ?auto_540150 ) ) ( not ( = ?auto_540142 ?auto_540143 ) ) ( not ( = ?auto_540142 ?auto_540144 ) ) ( not ( = ?auto_540142 ?auto_540145 ) ) ( not ( = ?auto_540142 ?auto_540146 ) ) ( not ( = ?auto_540142 ?auto_540147 ) ) ( not ( = ?auto_540142 ?auto_540148 ) ) ( not ( = ?auto_540142 ?auto_540149 ) ) ( not ( = ?auto_540142 ?auto_540150 ) ) ( not ( = ?auto_540143 ?auto_540144 ) ) ( not ( = ?auto_540143 ?auto_540145 ) ) ( not ( = ?auto_540143 ?auto_540146 ) ) ( not ( = ?auto_540143 ?auto_540147 ) ) ( not ( = ?auto_540143 ?auto_540148 ) ) ( not ( = ?auto_540143 ?auto_540149 ) ) ( not ( = ?auto_540143 ?auto_540150 ) ) ( not ( = ?auto_540144 ?auto_540145 ) ) ( not ( = ?auto_540144 ?auto_540146 ) ) ( not ( = ?auto_540144 ?auto_540147 ) ) ( not ( = ?auto_540144 ?auto_540148 ) ) ( not ( = ?auto_540144 ?auto_540149 ) ) ( not ( = ?auto_540144 ?auto_540150 ) ) ( not ( = ?auto_540145 ?auto_540146 ) ) ( not ( = ?auto_540145 ?auto_540147 ) ) ( not ( = ?auto_540145 ?auto_540148 ) ) ( not ( = ?auto_540145 ?auto_540149 ) ) ( not ( = ?auto_540145 ?auto_540150 ) ) ( not ( = ?auto_540146 ?auto_540147 ) ) ( not ( = ?auto_540146 ?auto_540148 ) ) ( not ( = ?auto_540146 ?auto_540149 ) ) ( not ( = ?auto_540146 ?auto_540150 ) ) ( not ( = ?auto_540147 ?auto_540148 ) ) ( not ( = ?auto_540147 ?auto_540149 ) ) ( not ( = ?auto_540147 ?auto_540150 ) ) ( not ( = ?auto_540148 ?auto_540149 ) ) ( not ( = ?auto_540148 ?auto_540150 ) ) ( not ( = ?auto_540149 ?auto_540150 ) ) ( ON ?auto_540148 ?auto_540149 ) ( ON ?auto_540147 ?auto_540148 ) ( ON ?auto_540146 ?auto_540147 ) ( ON ?auto_540145 ?auto_540146 ) ( ON ?auto_540144 ?auto_540145 ) ( ON ?auto_540143 ?auto_540144 ) ( ON ?auto_540142 ?auto_540143 ) ( ON ?auto_540141 ?auto_540142 ) ( ON ?auto_540140 ?auto_540141 ) ( ON ?auto_540139 ?auto_540140 ) ( ON ?auto_540138 ?auto_540139 ) ( ON ?auto_540137 ?auto_540138 ) ( ON ?auto_540136 ?auto_540137 ) ( ON ?auto_540135 ?auto_540136 ) ( ON ?auto_540134 ?auto_540135 ) ( CLEAR ?auto_540134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540134 )
      ( MAKE-16PILE ?auto_540134 ?auto_540135 ?auto_540136 ?auto_540137 ?auto_540138 ?auto_540139 ?auto_540140 ?auto_540141 ?auto_540142 ?auto_540143 ?auto_540144 ?auto_540145 ?auto_540146 ?auto_540147 ?auto_540148 ?auto_540149 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540167 - BLOCK
      ?auto_540168 - BLOCK
      ?auto_540169 - BLOCK
      ?auto_540170 - BLOCK
      ?auto_540171 - BLOCK
      ?auto_540172 - BLOCK
      ?auto_540173 - BLOCK
      ?auto_540174 - BLOCK
      ?auto_540175 - BLOCK
      ?auto_540176 - BLOCK
      ?auto_540177 - BLOCK
      ?auto_540178 - BLOCK
      ?auto_540179 - BLOCK
      ?auto_540180 - BLOCK
      ?auto_540181 - BLOCK
      ?auto_540182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_540182 ) ( not ( = ?auto_540167 ?auto_540168 ) ) ( not ( = ?auto_540167 ?auto_540169 ) ) ( not ( = ?auto_540167 ?auto_540170 ) ) ( not ( = ?auto_540167 ?auto_540171 ) ) ( not ( = ?auto_540167 ?auto_540172 ) ) ( not ( = ?auto_540167 ?auto_540173 ) ) ( not ( = ?auto_540167 ?auto_540174 ) ) ( not ( = ?auto_540167 ?auto_540175 ) ) ( not ( = ?auto_540167 ?auto_540176 ) ) ( not ( = ?auto_540167 ?auto_540177 ) ) ( not ( = ?auto_540167 ?auto_540178 ) ) ( not ( = ?auto_540167 ?auto_540179 ) ) ( not ( = ?auto_540167 ?auto_540180 ) ) ( not ( = ?auto_540167 ?auto_540181 ) ) ( not ( = ?auto_540167 ?auto_540182 ) ) ( not ( = ?auto_540168 ?auto_540169 ) ) ( not ( = ?auto_540168 ?auto_540170 ) ) ( not ( = ?auto_540168 ?auto_540171 ) ) ( not ( = ?auto_540168 ?auto_540172 ) ) ( not ( = ?auto_540168 ?auto_540173 ) ) ( not ( = ?auto_540168 ?auto_540174 ) ) ( not ( = ?auto_540168 ?auto_540175 ) ) ( not ( = ?auto_540168 ?auto_540176 ) ) ( not ( = ?auto_540168 ?auto_540177 ) ) ( not ( = ?auto_540168 ?auto_540178 ) ) ( not ( = ?auto_540168 ?auto_540179 ) ) ( not ( = ?auto_540168 ?auto_540180 ) ) ( not ( = ?auto_540168 ?auto_540181 ) ) ( not ( = ?auto_540168 ?auto_540182 ) ) ( not ( = ?auto_540169 ?auto_540170 ) ) ( not ( = ?auto_540169 ?auto_540171 ) ) ( not ( = ?auto_540169 ?auto_540172 ) ) ( not ( = ?auto_540169 ?auto_540173 ) ) ( not ( = ?auto_540169 ?auto_540174 ) ) ( not ( = ?auto_540169 ?auto_540175 ) ) ( not ( = ?auto_540169 ?auto_540176 ) ) ( not ( = ?auto_540169 ?auto_540177 ) ) ( not ( = ?auto_540169 ?auto_540178 ) ) ( not ( = ?auto_540169 ?auto_540179 ) ) ( not ( = ?auto_540169 ?auto_540180 ) ) ( not ( = ?auto_540169 ?auto_540181 ) ) ( not ( = ?auto_540169 ?auto_540182 ) ) ( not ( = ?auto_540170 ?auto_540171 ) ) ( not ( = ?auto_540170 ?auto_540172 ) ) ( not ( = ?auto_540170 ?auto_540173 ) ) ( not ( = ?auto_540170 ?auto_540174 ) ) ( not ( = ?auto_540170 ?auto_540175 ) ) ( not ( = ?auto_540170 ?auto_540176 ) ) ( not ( = ?auto_540170 ?auto_540177 ) ) ( not ( = ?auto_540170 ?auto_540178 ) ) ( not ( = ?auto_540170 ?auto_540179 ) ) ( not ( = ?auto_540170 ?auto_540180 ) ) ( not ( = ?auto_540170 ?auto_540181 ) ) ( not ( = ?auto_540170 ?auto_540182 ) ) ( not ( = ?auto_540171 ?auto_540172 ) ) ( not ( = ?auto_540171 ?auto_540173 ) ) ( not ( = ?auto_540171 ?auto_540174 ) ) ( not ( = ?auto_540171 ?auto_540175 ) ) ( not ( = ?auto_540171 ?auto_540176 ) ) ( not ( = ?auto_540171 ?auto_540177 ) ) ( not ( = ?auto_540171 ?auto_540178 ) ) ( not ( = ?auto_540171 ?auto_540179 ) ) ( not ( = ?auto_540171 ?auto_540180 ) ) ( not ( = ?auto_540171 ?auto_540181 ) ) ( not ( = ?auto_540171 ?auto_540182 ) ) ( not ( = ?auto_540172 ?auto_540173 ) ) ( not ( = ?auto_540172 ?auto_540174 ) ) ( not ( = ?auto_540172 ?auto_540175 ) ) ( not ( = ?auto_540172 ?auto_540176 ) ) ( not ( = ?auto_540172 ?auto_540177 ) ) ( not ( = ?auto_540172 ?auto_540178 ) ) ( not ( = ?auto_540172 ?auto_540179 ) ) ( not ( = ?auto_540172 ?auto_540180 ) ) ( not ( = ?auto_540172 ?auto_540181 ) ) ( not ( = ?auto_540172 ?auto_540182 ) ) ( not ( = ?auto_540173 ?auto_540174 ) ) ( not ( = ?auto_540173 ?auto_540175 ) ) ( not ( = ?auto_540173 ?auto_540176 ) ) ( not ( = ?auto_540173 ?auto_540177 ) ) ( not ( = ?auto_540173 ?auto_540178 ) ) ( not ( = ?auto_540173 ?auto_540179 ) ) ( not ( = ?auto_540173 ?auto_540180 ) ) ( not ( = ?auto_540173 ?auto_540181 ) ) ( not ( = ?auto_540173 ?auto_540182 ) ) ( not ( = ?auto_540174 ?auto_540175 ) ) ( not ( = ?auto_540174 ?auto_540176 ) ) ( not ( = ?auto_540174 ?auto_540177 ) ) ( not ( = ?auto_540174 ?auto_540178 ) ) ( not ( = ?auto_540174 ?auto_540179 ) ) ( not ( = ?auto_540174 ?auto_540180 ) ) ( not ( = ?auto_540174 ?auto_540181 ) ) ( not ( = ?auto_540174 ?auto_540182 ) ) ( not ( = ?auto_540175 ?auto_540176 ) ) ( not ( = ?auto_540175 ?auto_540177 ) ) ( not ( = ?auto_540175 ?auto_540178 ) ) ( not ( = ?auto_540175 ?auto_540179 ) ) ( not ( = ?auto_540175 ?auto_540180 ) ) ( not ( = ?auto_540175 ?auto_540181 ) ) ( not ( = ?auto_540175 ?auto_540182 ) ) ( not ( = ?auto_540176 ?auto_540177 ) ) ( not ( = ?auto_540176 ?auto_540178 ) ) ( not ( = ?auto_540176 ?auto_540179 ) ) ( not ( = ?auto_540176 ?auto_540180 ) ) ( not ( = ?auto_540176 ?auto_540181 ) ) ( not ( = ?auto_540176 ?auto_540182 ) ) ( not ( = ?auto_540177 ?auto_540178 ) ) ( not ( = ?auto_540177 ?auto_540179 ) ) ( not ( = ?auto_540177 ?auto_540180 ) ) ( not ( = ?auto_540177 ?auto_540181 ) ) ( not ( = ?auto_540177 ?auto_540182 ) ) ( not ( = ?auto_540178 ?auto_540179 ) ) ( not ( = ?auto_540178 ?auto_540180 ) ) ( not ( = ?auto_540178 ?auto_540181 ) ) ( not ( = ?auto_540178 ?auto_540182 ) ) ( not ( = ?auto_540179 ?auto_540180 ) ) ( not ( = ?auto_540179 ?auto_540181 ) ) ( not ( = ?auto_540179 ?auto_540182 ) ) ( not ( = ?auto_540180 ?auto_540181 ) ) ( not ( = ?auto_540180 ?auto_540182 ) ) ( not ( = ?auto_540181 ?auto_540182 ) ) ( ON ?auto_540181 ?auto_540182 ) ( ON ?auto_540180 ?auto_540181 ) ( ON ?auto_540179 ?auto_540180 ) ( ON ?auto_540178 ?auto_540179 ) ( ON ?auto_540177 ?auto_540178 ) ( ON ?auto_540176 ?auto_540177 ) ( ON ?auto_540175 ?auto_540176 ) ( ON ?auto_540174 ?auto_540175 ) ( ON ?auto_540173 ?auto_540174 ) ( ON ?auto_540172 ?auto_540173 ) ( ON ?auto_540171 ?auto_540172 ) ( ON ?auto_540170 ?auto_540171 ) ( ON ?auto_540169 ?auto_540170 ) ( ON ?auto_540168 ?auto_540169 ) ( ON ?auto_540167 ?auto_540168 ) ( CLEAR ?auto_540167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540167 )
      ( MAKE-16PILE ?auto_540167 ?auto_540168 ?auto_540169 ?auto_540170 ?auto_540171 ?auto_540172 ?auto_540173 ?auto_540174 ?auto_540175 ?auto_540176 ?auto_540177 ?auto_540178 ?auto_540179 ?auto_540180 ?auto_540181 ?auto_540182 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_540199 - BLOCK
      ?auto_540200 - BLOCK
      ?auto_540201 - BLOCK
      ?auto_540202 - BLOCK
      ?auto_540203 - BLOCK
      ?auto_540204 - BLOCK
      ?auto_540205 - BLOCK
      ?auto_540206 - BLOCK
      ?auto_540207 - BLOCK
      ?auto_540208 - BLOCK
      ?auto_540209 - BLOCK
      ?auto_540210 - BLOCK
      ?auto_540211 - BLOCK
      ?auto_540212 - BLOCK
      ?auto_540213 - BLOCK
      ?auto_540214 - BLOCK
    )
    :vars
    (
      ?auto_540215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_540199 ?auto_540200 ) ) ( not ( = ?auto_540199 ?auto_540201 ) ) ( not ( = ?auto_540199 ?auto_540202 ) ) ( not ( = ?auto_540199 ?auto_540203 ) ) ( not ( = ?auto_540199 ?auto_540204 ) ) ( not ( = ?auto_540199 ?auto_540205 ) ) ( not ( = ?auto_540199 ?auto_540206 ) ) ( not ( = ?auto_540199 ?auto_540207 ) ) ( not ( = ?auto_540199 ?auto_540208 ) ) ( not ( = ?auto_540199 ?auto_540209 ) ) ( not ( = ?auto_540199 ?auto_540210 ) ) ( not ( = ?auto_540199 ?auto_540211 ) ) ( not ( = ?auto_540199 ?auto_540212 ) ) ( not ( = ?auto_540199 ?auto_540213 ) ) ( not ( = ?auto_540199 ?auto_540214 ) ) ( not ( = ?auto_540200 ?auto_540201 ) ) ( not ( = ?auto_540200 ?auto_540202 ) ) ( not ( = ?auto_540200 ?auto_540203 ) ) ( not ( = ?auto_540200 ?auto_540204 ) ) ( not ( = ?auto_540200 ?auto_540205 ) ) ( not ( = ?auto_540200 ?auto_540206 ) ) ( not ( = ?auto_540200 ?auto_540207 ) ) ( not ( = ?auto_540200 ?auto_540208 ) ) ( not ( = ?auto_540200 ?auto_540209 ) ) ( not ( = ?auto_540200 ?auto_540210 ) ) ( not ( = ?auto_540200 ?auto_540211 ) ) ( not ( = ?auto_540200 ?auto_540212 ) ) ( not ( = ?auto_540200 ?auto_540213 ) ) ( not ( = ?auto_540200 ?auto_540214 ) ) ( not ( = ?auto_540201 ?auto_540202 ) ) ( not ( = ?auto_540201 ?auto_540203 ) ) ( not ( = ?auto_540201 ?auto_540204 ) ) ( not ( = ?auto_540201 ?auto_540205 ) ) ( not ( = ?auto_540201 ?auto_540206 ) ) ( not ( = ?auto_540201 ?auto_540207 ) ) ( not ( = ?auto_540201 ?auto_540208 ) ) ( not ( = ?auto_540201 ?auto_540209 ) ) ( not ( = ?auto_540201 ?auto_540210 ) ) ( not ( = ?auto_540201 ?auto_540211 ) ) ( not ( = ?auto_540201 ?auto_540212 ) ) ( not ( = ?auto_540201 ?auto_540213 ) ) ( not ( = ?auto_540201 ?auto_540214 ) ) ( not ( = ?auto_540202 ?auto_540203 ) ) ( not ( = ?auto_540202 ?auto_540204 ) ) ( not ( = ?auto_540202 ?auto_540205 ) ) ( not ( = ?auto_540202 ?auto_540206 ) ) ( not ( = ?auto_540202 ?auto_540207 ) ) ( not ( = ?auto_540202 ?auto_540208 ) ) ( not ( = ?auto_540202 ?auto_540209 ) ) ( not ( = ?auto_540202 ?auto_540210 ) ) ( not ( = ?auto_540202 ?auto_540211 ) ) ( not ( = ?auto_540202 ?auto_540212 ) ) ( not ( = ?auto_540202 ?auto_540213 ) ) ( not ( = ?auto_540202 ?auto_540214 ) ) ( not ( = ?auto_540203 ?auto_540204 ) ) ( not ( = ?auto_540203 ?auto_540205 ) ) ( not ( = ?auto_540203 ?auto_540206 ) ) ( not ( = ?auto_540203 ?auto_540207 ) ) ( not ( = ?auto_540203 ?auto_540208 ) ) ( not ( = ?auto_540203 ?auto_540209 ) ) ( not ( = ?auto_540203 ?auto_540210 ) ) ( not ( = ?auto_540203 ?auto_540211 ) ) ( not ( = ?auto_540203 ?auto_540212 ) ) ( not ( = ?auto_540203 ?auto_540213 ) ) ( not ( = ?auto_540203 ?auto_540214 ) ) ( not ( = ?auto_540204 ?auto_540205 ) ) ( not ( = ?auto_540204 ?auto_540206 ) ) ( not ( = ?auto_540204 ?auto_540207 ) ) ( not ( = ?auto_540204 ?auto_540208 ) ) ( not ( = ?auto_540204 ?auto_540209 ) ) ( not ( = ?auto_540204 ?auto_540210 ) ) ( not ( = ?auto_540204 ?auto_540211 ) ) ( not ( = ?auto_540204 ?auto_540212 ) ) ( not ( = ?auto_540204 ?auto_540213 ) ) ( not ( = ?auto_540204 ?auto_540214 ) ) ( not ( = ?auto_540205 ?auto_540206 ) ) ( not ( = ?auto_540205 ?auto_540207 ) ) ( not ( = ?auto_540205 ?auto_540208 ) ) ( not ( = ?auto_540205 ?auto_540209 ) ) ( not ( = ?auto_540205 ?auto_540210 ) ) ( not ( = ?auto_540205 ?auto_540211 ) ) ( not ( = ?auto_540205 ?auto_540212 ) ) ( not ( = ?auto_540205 ?auto_540213 ) ) ( not ( = ?auto_540205 ?auto_540214 ) ) ( not ( = ?auto_540206 ?auto_540207 ) ) ( not ( = ?auto_540206 ?auto_540208 ) ) ( not ( = ?auto_540206 ?auto_540209 ) ) ( not ( = ?auto_540206 ?auto_540210 ) ) ( not ( = ?auto_540206 ?auto_540211 ) ) ( not ( = ?auto_540206 ?auto_540212 ) ) ( not ( = ?auto_540206 ?auto_540213 ) ) ( not ( = ?auto_540206 ?auto_540214 ) ) ( not ( = ?auto_540207 ?auto_540208 ) ) ( not ( = ?auto_540207 ?auto_540209 ) ) ( not ( = ?auto_540207 ?auto_540210 ) ) ( not ( = ?auto_540207 ?auto_540211 ) ) ( not ( = ?auto_540207 ?auto_540212 ) ) ( not ( = ?auto_540207 ?auto_540213 ) ) ( not ( = ?auto_540207 ?auto_540214 ) ) ( not ( = ?auto_540208 ?auto_540209 ) ) ( not ( = ?auto_540208 ?auto_540210 ) ) ( not ( = ?auto_540208 ?auto_540211 ) ) ( not ( = ?auto_540208 ?auto_540212 ) ) ( not ( = ?auto_540208 ?auto_540213 ) ) ( not ( = ?auto_540208 ?auto_540214 ) ) ( not ( = ?auto_540209 ?auto_540210 ) ) ( not ( = ?auto_540209 ?auto_540211 ) ) ( not ( = ?auto_540209 ?auto_540212 ) ) ( not ( = ?auto_540209 ?auto_540213 ) ) ( not ( = ?auto_540209 ?auto_540214 ) ) ( not ( = ?auto_540210 ?auto_540211 ) ) ( not ( = ?auto_540210 ?auto_540212 ) ) ( not ( = ?auto_540210 ?auto_540213 ) ) ( not ( = ?auto_540210 ?auto_540214 ) ) ( not ( = ?auto_540211 ?auto_540212 ) ) ( not ( = ?auto_540211 ?auto_540213 ) ) ( not ( = ?auto_540211 ?auto_540214 ) ) ( not ( = ?auto_540212 ?auto_540213 ) ) ( not ( = ?auto_540212 ?auto_540214 ) ) ( not ( = ?auto_540213 ?auto_540214 ) ) ( ON ?auto_540199 ?auto_540215 ) ( not ( = ?auto_540214 ?auto_540215 ) ) ( not ( = ?auto_540213 ?auto_540215 ) ) ( not ( = ?auto_540212 ?auto_540215 ) ) ( not ( = ?auto_540211 ?auto_540215 ) ) ( not ( = ?auto_540210 ?auto_540215 ) ) ( not ( = ?auto_540209 ?auto_540215 ) ) ( not ( = ?auto_540208 ?auto_540215 ) ) ( not ( = ?auto_540207 ?auto_540215 ) ) ( not ( = ?auto_540206 ?auto_540215 ) ) ( not ( = ?auto_540205 ?auto_540215 ) ) ( not ( = ?auto_540204 ?auto_540215 ) ) ( not ( = ?auto_540203 ?auto_540215 ) ) ( not ( = ?auto_540202 ?auto_540215 ) ) ( not ( = ?auto_540201 ?auto_540215 ) ) ( not ( = ?auto_540200 ?auto_540215 ) ) ( not ( = ?auto_540199 ?auto_540215 ) ) ( ON ?auto_540200 ?auto_540199 ) ( ON ?auto_540201 ?auto_540200 ) ( ON ?auto_540202 ?auto_540201 ) ( ON ?auto_540203 ?auto_540202 ) ( ON ?auto_540204 ?auto_540203 ) ( ON ?auto_540205 ?auto_540204 ) ( ON ?auto_540206 ?auto_540205 ) ( ON ?auto_540207 ?auto_540206 ) ( ON ?auto_540208 ?auto_540207 ) ( ON ?auto_540209 ?auto_540208 ) ( ON ?auto_540210 ?auto_540209 ) ( ON ?auto_540211 ?auto_540210 ) ( ON ?auto_540212 ?auto_540211 ) ( ON ?auto_540213 ?auto_540212 ) ( ON ?auto_540214 ?auto_540213 ) ( CLEAR ?auto_540214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_540214 ?auto_540213 ?auto_540212 ?auto_540211 ?auto_540210 ?auto_540209 ?auto_540208 ?auto_540207 ?auto_540206 ?auto_540205 ?auto_540204 ?auto_540203 ?auto_540202 ?auto_540201 ?auto_540200 ?auto_540199 )
      ( MAKE-16PILE ?auto_540199 ?auto_540200 ?auto_540201 ?auto_540202 ?auto_540203 ?auto_540204 ?auto_540205 ?auto_540206 ?auto_540207 ?auto_540208 ?auto_540209 ?auto_540210 ?auto_540211 ?auto_540212 ?auto_540213 ?auto_540214 ) )
  )

)

