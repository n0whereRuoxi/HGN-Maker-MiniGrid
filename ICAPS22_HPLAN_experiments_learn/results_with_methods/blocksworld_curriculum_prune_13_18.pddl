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
      ?auto_267977 - BLOCK
    )
    :vars
    (
      ?auto_267978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267977 ?auto_267978 ) ( CLEAR ?auto_267977 ) ( HAND-EMPTY ) ( not ( = ?auto_267977 ?auto_267978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267977 ?auto_267978 )
      ( !PUTDOWN ?auto_267977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267984 - BLOCK
      ?auto_267985 - BLOCK
    )
    :vars
    (
      ?auto_267986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267984 ) ( ON ?auto_267985 ?auto_267986 ) ( CLEAR ?auto_267985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267984 ) ( not ( = ?auto_267984 ?auto_267985 ) ) ( not ( = ?auto_267984 ?auto_267986 ) ) ( not ( = ?auto_267985 ?auto_267986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267985 ?auto_267986 )
      ( !STACK ?auto_267985 ?auto_267984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267994 - BLOCK
      ?auto_267995 - BLOCK
    )
    :vars
    (
      ?auto_267996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267995 ?auto_267996 ) ( not ( = ?auto_267994 ?auto_267995 ) ) ( not ( = ?auto_267994 ?auto_267996 ) ) ( not ( = ?auto_267995 ?auto_267996 ) ) ( ON ?auto_267994 ?auto_267995 ) ( CLEAR ?auto_267994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267994 )
      ( MAKE-2PILE ?auto_267994 ?auto_267995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268005 - BLOCK
      ?auto_268006 - BLOCK
      ?auto_268007 - BLOCK
    )
    :vars
    (
      ?auto_268008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268006 ) ( ON ?auto_268007 ?auto_268008 ) ( CLEAR ?auto_268007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268005 ) ( ON ?auto_268006 ?auto_268005 ) ( not ( = ?auto_268005 ?auto_268006 ) ) ( not ( = ?auto_268005 ?auto_268007 ) ) ( not ( = ?auto_268005 ?auto_268008 ) ) ( not ( = ?auto_268006 ?auto_268007 ) ) ( not ( = ?auto_268006 ?auto_268008 ) ) ( not ( = ?auto_268007 ?auto_268008 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268007 ?auto_268008 )
      ( !STACK ?auto_268007 ?auto_268006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268019 - BLOCK
      ?auto_268020 - BLOCK
      ?auto_268021 - BLOCK
    )
    :vars
    (
      ?auto_268022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268021 ?auto_268022 ) ( ON-TABLE ?auto_268019 ) ( not ( = ?auto_268019 ?auto_268020 ) ) ( not ( = ?auto_268019 ?auto_268021 ) ) ( not ( = ?auto_268019 ?auto_268022 ) ) ( not ( = ?auto_268020 ?auto_268021 ) ) ( not ( = ?auto_268020 ?auto_268022 ) ) ( not ( = ?auto_268021 ?auto_268022 ) ) ( CLEAR ?auto_268019 ) ( ON ?auto_268020 ?auto_268021 ) ( CLEAR ?auto_268020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268019 ?auto_268020 )
      ( MAKE-3PILE ?auto_268019 ?auto_268020 ?auto_268021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268033 - BLOCK
      ?auto_268034 - BLOCK
      ?auto_268035 - BLOCK
    )
    :vars
    (
      ?auto_268036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268035 ?auto_268036 ) ( not ( = ?auto_268033 ?auto_268034 ) ) ( not ( = ?auto_268033 ?auto_268035 ) ) ( not ( = ?auto_268033 ?auto_268036 ) ) ( not ( = ?auto_268034 ?auto_268035 ) ) ( not ( = ?auto_268034 ?auto_268036 ) ) ( not ( = ?auto_268035 ?auto_268036 ) ) ( ON ?auto_268034 ?auto_268035 ) ( ON ?auto_268033 ?auto_268034 ) ( CLEAR ?auto_268033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268033 )
      ( MAKE-3PILE ?auto_268033 ?auto_268034 ?auto_268035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268048 - BLOCK
      ?auto_268049 - BLOCK
      ?auto_268050 - BLOCK
      ?auto_268051 - BLOCK
    )
    :vars
    (
      ?auto_268052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268050 ) ( ON ?auto_268051 ?auto_268052 ) ( CLEAR ?auto_268051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268048 ) ( ON ?auto_268049 ?auto_268048 ) ( ON ?auto_268050 ?auto_268049 ) ( not ( = ?auto_268048 ?auto_268049 ) ) ( not ( = ?auto_268048 ?auto_268050 ) ) ( not ( = ?auto_268048 ?auto_268051 ) ) ( not ( = ?auto_268048 ?auto_268052 ) ) ( not ( = ?auto_268049 ?auto_268050 ) ) ( not ( = ?auto_268049 ?auto_268051 ) ) ( not ( = ?auto_268049 ?auto_268052 ) ) ( not ( = ?auto_268050 ?auto_268051 ) ) ( not ( = ?auto_268050 ?auto_268052 ) ) ( not ( = ?auto_268051 ?auto_268052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268051 ?auto_268052 )
      ( !STACK ?auto_268051 ?auto_268050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268066 - BLOCK
      ?auto_268067 - BLOCK
      ?auto_268068 - BLOCK
      ?auto_268069 - BLOCK
    )
    :vars
    (
      ?auto_268070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268069 ?auto_268070 ) ( ON-TABLE ?auto_268066 ) ( ON ?auto_268067 ?auto_268066 ) ( not ( = ?auto_268066 ?auto_268067 ) ) ( not ( = ?auto_268066 ?auto_268068 ) ) ( not ( = ?auto_268066 ?auto_268069 ) ) ( not ( = ?auto_268066 ?auto_268070 ) ) ( not ( = ?auto_268067 ?auto_268068 ) ) ( not ( = ?auto_268067 ?auto_268069 ) ) ( not ( = ?auto_268067 ?auto_268070 ) ) ( not ( = ?auto_268068 ?auto_268069 ) ) ( not ( = ?auto_268068 ?auto_268070 ) ) ( not ( = ?auto_268069 ?auto_268070 ) ) ( CLEAR ?auto_268067 ) ( ON ?auto_268068 ?auto_268069 ) ( CLEAR ?auto_268068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268066 ?auto_268067 ?auto_268068 )
      ( MAKE-4PILE ?auto_268066 ?auto_268067 ?auto_268068 ?auto_268069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268084 - BLOCK
      ?auto_268085 - BLOCK
      ?auto_268086 - BLOCK
      ?auto_268087 - BLOCK
    )
    :vars
    (
      ?auto_268088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268087 ?auto_268088 ) ( ON-TABLE ?auto_268084 ) ( not ( = ?auto_268084 ?auto_268085 ) ) ( not ( = ?auto_268084 ?auto_268086 ) ) ( not ( = ?auto_268084 ?auto_268087 ) ) ( not ( = ?auto_268084 ?auto_268088 ) ) ( not ( = ?auto_268085 ?auto_268086 ) ) ( not ( = ?auto_268085 ?auto_268087 ) ) ( not ( = ?auto_268085 ?auto_268088 ) ) ( not ( = ?auto_268086 ?auto_268087 ) ) ( not ( = ?auto_268086 ?auto_268088 ) ) ( not ( = ?auto_268087 ?auto_268088 ) ) ( ON ?auto_268086 ?auto_268087 ) ( CLEAR ?auto_268084 ) ( ON ?auto_268085 ?auto_268086 ) ( CLEAR ?auto_268085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268084 ?auto_268085 )
      ( MAKE-4PILE ?auto_268084 ?auto_268085 ?auto_268086 ?auto_268087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268102 - BLOCK
      ?auto_268103 - BLOCK
      ?auto_268104 - BLOCK
      ?auto_268105 - BLOCK
    )
    :vars
    (
      ?auto_268106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268105 ?auto_268106 ) ( not ( = ?auto_268102 ?auto_268103 ) ) ( not ( = ?auto_268102 ?auto_268104 ) ) ( not ( = ?auto_268102 ?auto_268105 ) ) ( not ( = ?auto_268102 ?auto_268106 ) ) ( not ( = ?auto_268103 ?auto_268104 ) ) ( not ( = ?auto_268103 ?auto_268105 ) ) ( not ( = ?auto_268103 ?auto_268106 ) ) ( not ( = ?auto_268104 ?auto_268105 ) ) ( not ( = ?auto_268104 ?auto_268106 ) ) ( not ( = ?auto_268105 ?auto_268106 ) ) ( ON ?auto_268104 ?auto_268105 ) ( ON ?auto_268103 ?auto_268104 ) ( ON ?auto_268102 ?auto_268103 ) ( CLEAR ?auto_268102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268102 )
      ( MAKE-4PILE ?auto_268102 ?auto_268103 ?auto_268104 ?auto_268105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268121 - BLOCK
      ?auto_268122 - BLOCK
      ?auto_268123 - BLOCK
      ?auto_268124 - BLOCK
      ?auto_268125 - BLOCK
    )
    :vars
    (
      ?auto_268126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268124 ) ( ON ?auto_268125 ?auto_268126 ) ( CLEAR ?auto_268125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268121 ) ( ON ?auto_268122 ?auto_268121 ) ( ON ?auto_268123 ?auto_268122 ) ( ON ?auto_268124 ?auto_268123 ) ( not ( = ?auto_268121 ?auto_268122 ) ) ( not ( = ?auto_268121 ?auto_268123 ) ) ( not ( = ?auto_268121 ?auto_268124 ) ) ( not ( = ?auto_268121 ?auto_268125 ) ) ( not ( = ?auto_268121 ?auto_268126 ) ) ( not ( = ?auto_268122 ?auto_268123 ) ) ( not ( = ?auto_268122 ?auto_268124 ) ) ( not ( = ?auto_268122 ?auto_268125 ) ) ( not ( = ?auto_268122 ?auto_268126 ) ) ( not ( = ?auto_268123 ?auto_268124 ) ) ( not ( = ?auto_268123 ?auto_268125 ) ) ( not ( = ?auto_268123 ?auto_268126 ) ) ( not ( = ?auto_268124 ?auto_268125 ) ) ( not ( = ?auto_268124 ?auto_268126 ) ) ( not ( = ?auto_268125 ?auto_268126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268125 ?auto_268126 )
      ( !STACK ?auto_268125 ?auto_268124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268143 - BLOCK
      ?auto_268144 - BLOCK
      ?auto_268145 - BLOCK
      ?auto_268146 - BLOCK
      ?auto_268147 - BLOCK
    )
    :vars
    (
      ?auto_268148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268147 ?auto_268148 ) ( ON-TABLE ?auto_268143 ) ( ON ?auto_268144 ?auto_268143 ) ( ON ?auto_268145 ?auto_268144 ) ( not ( = ?auto_268143 ?auto_268144 ) ) ( not ( = ?auto_268143 ?auto_268145 ) ) ( not ( = ?auto_268143 ?auto_268146 ) ) ( not ( = ?auto_268143 ?auto_268147 ) ) ( not ( = ?auto_268143 ?auto_268148 ) ) ( not ( = ?auto_268144 ?auto_268145 ) ) ( not ( = ?auto_268144 ?auto_268146 ) ) ( not ( = ?auto_268144 ?auto_268147 ) ) ( not ( = ?auto_268144 ?auto_268148 ) ) ( not ( = ?auto_268145 ?auto_268146 ) ) ( not ( = ?auto_268145 ?auto_268147 ) ) ( not ( = ?auto_268145 ?auto_268148 ) ) ( not ( = ?auto_268146 ?auto_268147 ) ) ( not ( = ?auto_268146 ?auto_268148 ) ) ( not ( = ?auto_268147 ?auto_268148 ) ) ( CLEAR ?auto_268145 ) ( ON ?auto_268146 ?auto_268147 ) ( CLEAR ?auto_268146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268143 ?auto_268144 ?auto_268145 ?auto_268146 )
      ( MAKE-5PILE ?auto_268143 ?auto_268144 ?auto_268145 ?auto_268146 ?auto_268147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268165 - BLOCK
      ?auto_268166 - BLOCK
      ?auto_268167 - BLOCK
      ?auto_268168 - BLOCK
      ?auto_268169 - BLOCK
    )
    :vars
    (
      ?auto_268170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268169 ?auto_268170 ) ( ON-TABLE ?auto_268165 ) ( ON ?auto_268166 ?auto_268165 ) ( not ( = ?auto_268165 ?auto_268166 ) ) ( not ( = ?auto_268165 ?auto_268167 ) ) ( not ( = ?auto_268165 ?auto_268168 ) ) ( not ( = ?auto_268165 ?auto_268169 ) ) ( not ( = ?auto_268165 ?auto_268170 ) ) ( not ( = ?auto_268166 ?auto_268167 ) ) ( not ( = ?auto_268166 ?auto_268168 ) ) ( not ( = ?auto_268166 ?auto_268169 ) ) ( not ( = ?auto_268166 ?auto_268170 ) ) ( not ( = ?auto_268167 ?auto_268168 ) ) ( not ( = ?auto_268167 ?auto_268169 ) ) ( not ( = ?auto_268167 ?auto_268170 ) ) ( not ( = ?auto_268168 ?auto_268169 ) ) ( not ( = ?auto_268168 ?auto_268170 ) ) ( not ( = ?auto_268169 ?auto_268170 ) ) ( ON ?auto_268168 ?auto_268169 ) ( CLEAR ?auto_268166 ) ( ON ?auto_268167 ?auto_268168 ) ( CLEAR ?auto_268167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268165 ?auto_268166 ?auto_268167 )
      ( MAKE-5PILE ?auto_268165 ?auto_268166 ?auto_268167 ?auto_268168 ?auto_268169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268187 - BLOCK
      ?auto_268188 - BLOCK
      ?auto_268189 - BLOCK
      ?auto_268190 - BLOCK
      ?auto_268191 - BLOCK
    )
    :vars
    (
      ?auto_268192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268191 ?auto_268192 ) ( ON-TABLE ?auto_268187 ) ( not ( = ?auto_268187 ?auto_268188 ) ) ( not ( = ?auto_268187 ?auto_268189 ) ) ( not ( = ?auto_268187 ?auto_268190 ) ) ( not ( = ?auto_268187 ?auto_268191 ) ) ( not ( = ?auto_268187 ?auto_268192 ) ) ( not ( = ?auto_268188 ?auto_268189 ) ) ( not ( = ?auto_268188 ?auto_268190 ) ) ( not ( = ?auto_268188 ?auto_268191 ) ) ( not ( = ?auto_268188 ?auto_268192 ) ) ( not ( = ?auto_268189 ?auto_268190 ) ) ( not ( = ?auto_268189 ?auto_268191 ) ) ( not ( = ?auto_268189 ?auto_268192 ) ) ( not ( = ?auto_268190 ?auto_268191 ) ) ( not ( = ?auto_268190 ?auto_268192 ) ) ( not ( = ?auto_268191 ?auto_268192 ) ) ( ON ?auto_268190 ?auto_268191 ) ( ON ?auto_268189 ?auto_268190 ) ( CLEAR ?auto_268187 ) ( ON ?auto_268188 ?auto_268189 ) ( CLEAR ?auto_268188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268187 ?auto_268188 )
      ( MAKE-5PILE ?auto_268187 ?auto_268188 ?auto_268189 ?auto_268190 ?auto_268191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268209 - BLOCK
      ?auto_268210 - BLOCK
      ?auto_268211 - BLOCK
      ?auto_268212 - BLOCK
      ?auto_268213 - BLOCK
    )
    :vars
    (
      ?auto_268214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268213 ?auto_268214 ) ( not ( = ?auto_268209 ?auto_268210 ) ) ( not ( = ?auto_268209 ?auto_268211 ) ) ( not ( = ?auto_268209 ?auto_268212 ) ) ( not ( = ?auto_268209 ?auto_268213 ) ) ( not ( = ?auto_268209 ?auto_268214 ) ) ( not ( = ?auto_268210 ?auto_268211 ) ) ( not ( = ?auto_268210 ?auto_268212 ) ) ( not ( = ?auto_268210 ?auto_268213 ) ) ( not ( = ?auto_268210 ?auto_268214 ) ) ( not ( = ?auto_268211 ?auto_268212 ) ) ( not ( = ?auto_268211 ?auto_268213 ) ) ( not ( = ?auto_268211 ?auto_268214 ) ) ( not ( = ?auto_268212 ?auto_268213 ) ) ( not ( = ?auto_268212 ?auto_268214 ) ) ( not ( = ?auto_268213 ?auto_268214 ) ) ( ON ?auto_268212 ?auto_268213 ) ( ON ?auto_268211 ?auto_268212 ) ( ON ?auto_268210 ?auto_268211 ) ( ON ?auto_268209 ?auto_268210 ) ( CLEAR ?auto_268209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268209 )
      ( MAKE-5PILE ?auto_268209 ?auto_268210 ?auto_268211 ?auto_268212 ?auto_268213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268232 - BLOCK
      ?auto_268233 - BLOCK
      ?auto_268234 - BLOCK
      ?auto_268235 - BLOCK
      ?auto_268236 - BLOCK
      ?auto_268237 - BLOCK
    )
    :vars
    (
      ?auto_268238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268236 ) ( ON ?auto_268237 ?auto_268238 ) ( CLEAR ?auto_268237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268232 ) ( ON ?auto_268233 ?auto_268232 ) ( ON ?auto_268234 ?auto_268233 ) ( ON ?auto_268235 ?auto_268234 ) ( ON ?auto_268236 ?auto_268235 ) ( not ( = ?auto_268232 ?auto_268233 ) ) ( not ( = ?auto_268232 ?auto_268234 ) ) ( not ( = ?auto_268232 ?auto_268235 ) ) ( not ( = ?auto_268232 ?auto_268236 ) ) ( not ( = ?auto_268232 ?auto_268237 ) ) ( not ( = ?auto_268232 ?auto_268238 ) ) ( not ( = ?auto_268233 ?auto_268234 ) ) ( not ( = ?auto_268233 ?auto_268235 ) ) ( not ( = ?auto_268233 ?auto_268236 ) ) ( not ( = ?auto_268233 ?auto_268237 ) ) ( not ( = ?auto_268233 ?auto_268238 ) ) ( not ( = ?auto_268234 ?auto_268235 ) ) ( not ( = ?auto_268234 ?auto_268236 ) ) ( not ( = ?auto_268234 ?auto_268237 ) ) ( not ( = ?auto_268234 ?auto_268238 ) ) ( not ( = ?auto_268235 ?auto_268236 ) ) ( not ( = ?auto_268235 ?auto_268237 ) ) ( not ( = ?auto_268235 ?auto_268238 ) ) ( not ( = ?auto_268236 ?auto_268237 ) ) ( not ( = ?auto_268236 ?auto_268238 ) ) ( not ( = ?auto_268237 ?auto_268238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268237 ?auto_268238 )
      ( !STACK ?auto_268237 ?auto_268236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268258 - BLOCK
      ?auto_268259 - BLOCK
      ?auto_268260 - BLOCK
      ?auto_268261 - BLOCK
      ?auto_268262 - BLOCK
      ?auto_268263 - BLOCK
    )
    :vars
    (
      ?auto_268264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268263 ?auto_268264 ) ( ON-TABLE ?auto_268258 ) ( ON ?auto_268259 ?auto_268258 ) ( ON ?auto_268260 ?auto_268259 ) ( ON ?auto_268261 ?auto_268260 ) ( not ( = ?auto_268258 ?auto_268259 ) ) ( not ( = ?auto_268258 ?auto_268260 ) ) ( not ( = ?auto_268258 ?auto_268261 ) ) ( not ( = ?auto_268258 ?auto_268262 ) ) ( not ( = ?auto_268258 ?auto_268263 ) ) ( not ( = ?auto_268258 ?auto_268264 ) ) ( not ( = ?auto_268259 ?auto_268260 ) ) ( not ( = ?auto_268259 ?auto_268261 ) ) ( not ( = ?auto_268259 ?auto_268262 ) ) ( not ( = ?auto_268259 ?auto_268263 ) ) ( not ( = ?auto_268259 ?auto_268264 ) ) ( not ( = ?auto_268260 ?auto_268261 ) ) ( not ( = ?auto_268260 ?auto_268262 ) ) ( not ( = ?auto_268260 ?auto_268263 ) ) ( not ( = ?auto_268260 ?auto_268264 ) ) ( not ( = ?auto_268261 ?auto_268262 ) ) ( not ( = ?auto_268261 ?auto_268263 ) ) ( not ( = ?auto_268261 ?auto_268264 ) ) ( not ( = ?auto_268262 ?auto_268263 ) ) ( not ( = ?auto_268262 ?auto_268264 ) ) ( not ( = ?auto_268263 ?auto_268264 ) ) ( CLEAR ?auto_268261 ) ( ON ?auto_268262 ?auto_268263 ) ( CLEAR ?auto_268262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268258 ?auto_268259 ?auto_268260 ?auto_268261 ?auto_268262 )
      ( MAKE-6PILE ?auto_268258 ?auto_268259 ?auto_268260 ?auto_268261 ?auto_268262 ?auto_268263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268284 - BLOCK
      ?auto_268285 - BLOCK
      ?auto_268286 - BLOCK
      ?auto_268287 - BLOCK
      ?auto_268288 - BLOCK
      ?auto_268289 - BLOCK
    )
    :vars
    (
      ?auto_268290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268289 ?auto_268290 ) ( ON-TABLE ?auto_268284 ) ( ON ?auto_268285 ?auto_268284 ) ( ON ?auto_268286 ?auto_268285 ) ( not ( = ?auto_268284 ?auto_268285 ) ) ( not ( = ?auto_268284 ?auto_268286 ) ) ( not ( = ?auto_268284 ?auto_268287 ) ) ( not ( = ?auto_268284 ?auto_268288 ) ) ( not ( = ?auto_268284 ?auto_268289 ) ) ( not ( = ?auto_268284 ?auto_268290 ) ) ( not ( = ?auto_268285 ?auto_268286 ) ) ( not ( = ?auto_268285 ?auto_268287 ) ) ( not ( = ?auto_268285 ?auto_268288 ) ) ( not ( = ?auto_268285 ?auto_268289 ) ) ( not ( = ?auto_268285 ?auto_268290 ) ) ( not ( = ?auto_268286 ?auto_268287 ) ) ( not ( = ?auto_268286 ?auto_268288 ) ) ( not ( = ?auto_268286 ?auto_268289 ) ) ( not ( = ?auto_268286 ?auto_268290 ) ) ( not ( = ?auto_268287 ?auto_268288 ) ) ( not ( = ?auto_268287 ?auto_268289 ) ) ( not ( = ?auto_268287 ?auto_268290 ) ) ( not ( = ?auto_268288 ?auto_268289 ) ) ( not ( = ?auto_268288 ?auto_268290 ) ) ( not ( = ?auto_268289 ?auto_268290 ) ) ( ON ?auto_268288 ?auto_268289 ) ( CLEAR ?auto_268286 ) ( ON ?auto_268287 ?auto_268288 ) ( CLEAR ?auto_268287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268284 ?auto_268285 ?auto_268286 ?auto_268287 )
      ( MAKE-6PILE ?auto_268284 ?auto_268285 ?auto_268286 ?auto_268287 ?auto_268288 ?auto_268289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268310 - BLOCK
      ?auto_268311 - BLOCK
      ?auto_268312 - BLOCK
      ?auto_268313 - BLOCK
      ?auto_268314 - BLOCK
      ?auto_268315 - BLOCK
    )
    :vars
    (
      ?auto_268316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268315 ?auto_268316 ) ( ON-TABLE ?auto_268310 ) ( ON ?auto_268311 ?auto_268310 ) ( not ( = ?auto_268310 ?auto_268311 ) ) ( not ( = ?auto_268310 ?auto_268312 ) ) ( not ( = ?auto_268310 ?auto_268313 ) ) ( not ( = ?auto_268310 ?auto_268314 ) ) ( not ( = ?auto_268310 ?auto_268315 ) ) ( not ( = ?auto_268310 ?auto_268316 ) ) ( not ( = ?auto_268311 ?auto_268312 ) ) ( not ( = ?auto_268311 ?auto_268313 ) ) ( not ( = ?auto_268311 ?auto_268314 ) ) ( not ( = ?auto_268311 ?auto_268315 ) ) ( not ( = ?auto_268311 ?auto_268316 ) ) ( not ( = ?auto_268312 ?auto_268313 ) ) ( not ( = ?auto_268312 ?auto_268314 ) ) ( not ( = ?auto_268312 ?auto_268315 ) ) ( not ( = ?auto_268312 ?auto_268316 ) ) ( not ( = ?auto_268313 ?auto_268314 ) ) ( not ( = ?auto_268313 ?auto_268315 ) ) ( not ( = ?auto_268313 ?auto_268316 ) ) ( not ( = ?auto_268314 ?auto_268315 ) ) ( not ( = ?auto_268314 ?auto_268316 ) ) ( not ( = ?auto_268315 ?auto_268316 ) ) ( ON ?auto_268314 ?auto_268315 ) ( ON ?auto_268313 ?auto_268314 ) ( CLEAR ?auto_268311 ) ( ON ?auto_268312 ?auto_268313 ) ( CLEAR ?auto_268312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268310 ?auto_268311 ?auto_268312 )
      ( MAKE-6PILE ?auto_268310 ?auto_268311 ?auto_268312 ?auto_268313 ?auto_268314 ?auto_268315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268336 - BLOCK
      ?auto_268337 - BLOCK
      ?auto_268338 - BLOCK
      ?auto_268339 - BLOCK
      ?auto_268340 - BLOCK
      ?auto_268341 - BLOCK
    )
    :vars
    (
      ?auto_268342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268341 ?auto_268342 ) ( ON-TABLE ?auto_268336 ) ( not ( = ?auto_268336 ?auto_268337 ) ) ( not ( = ?auto_268336 ?auto_268338 ) ) ( not ( = ?auto_268336 ?auto_268339 ) ) ( not ( = ?auto_268336 ?auto_268340 ) ) ( not ( = ?auto_268336 ?auto_268341 ) ) ( not ( = ?auto_268336 ?auto_268342 ) ) ( not ( = ?auto_268337 ?auto_268338 ) ) ( not ( = ?auto_268337 ?auto_268339 ) ) ( not ( = ?auto_268337 ?auto_268340 ) ) ( not ( = ?auto_268337 ?auto_268341 ) ) ( not ( = ?auto_268337 ?auto_268342 ) ) ( not ( = ?auto_268338 ?auto_268339 ) ) ( not ( = ?auto_268338 ?auto_268340 ) ) ( not ( = ?auto_268338 ?auto_268341 ) ) ( not ( = ?auto_268338 ?auto_268342 ) ) ( not ( = ?auto_268339 ?auto_268340 ) ) ( not ( = ?auto_268339 ?auto_268341 ) ) ( not ( = ?auto_268339 ?auto_268342 ) ) ( not ( = ?auto_268340 ?auto_268341 ) ) ( not ( = ?auto_268340 ?auto_268342 ) ) ( not ( = ?auto_268341 ?auto_268342 ) ) ( ON ?auto_268340 ?auto_268341 ) ( ON ?auto_268339 ?auto_268340 ) ( ON ?auto_268338 ?auto_268339 ) ( CLEAR ?auto_268336 ) ( ON ?auto_268337 ?auto_268338 ) ( CLEAR ?auto_268337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268336 ?auto_268337 )
      ( MAKE-6PILE ?auto_268336 ?auto_268337 ?auto_268338 ?auto_268339 ?auto_268340 ?auto_268341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268362 - BLOCK
      ?auto_268363 - BLOCK
      ?auto_268364 - BLOCK
      ?auto_268365 - BLOCK
      ?auto_268366 - BLOCK
      ?auto_268367 - BLOCK
    )
    :vars
    (
      ?auto_268368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268367 ?auto_268368 ) ( not ( = ?auto_268362 ?auto_268363 ) ) ( not ( = ?auto_268362 ?auto_268364 ) ) ( not ( = ?auto_268362 ?auto_268365 ) ) ( not ( = ?auto_268362 ?auto_268366 ) ) ( not ( = ?auto_268362 ?auto_268367 ) ) ( not ( = ?auto_268362 ?auto_268368 ) ) ( not ( = ?auto_268363 ?auto_268364 ) ) ( not ( = ?auto_268363 ?auto_268365 ) ) ( not ( = ?auto_268363 ?auto_268366 ) ) ( not ( = ?auto_268363 ?auto_268367 ) ) ( not ( = ?auto_268363 ?auto_268368 ) ) ( not ( = ?auto_268364 ?auto_268365 ) ) ( not ( = ?auto_268364 ?auto_268366 ) ) ( not ( = ?auto_268364 ?auto_268367 ) ) ( not ( = ?auto_268364 ?auto_268368 ) ) ( not ( = ?auto_268365 ?auto_268366 ) ) ( not ( = ?auto_268365 ?auto_268367 ) ) ( not ( = ?auto_268365 ?auto_268368 ) ) ( not ( = ?auto_268366 ?auto_268367 ) ) ( not ( = ?auto_268366 ?auto_268368 ) ) ( not ( = ?auto_268367 ?auto_268368 ) ) ( ON ?auto_268366 ?auto_268367 ) ( ON ?auto_268365 ?auto_268366 ) ( ON ?auto_268364 ?auto_268365 ) ( ON ?auto_268363 ?auto_268364 ) ( ON ?auto_268362 ?auto_268363 ) ( CLEAR ?auto_268362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268362 )
      ( MAKE-6PILE ?auto_268362 ?auto_268363 ?auto_268364 ?auto_268365 ?auto_268366 ?auto_268367 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268389 - BLOCK
      ?auto_268390 - BLOCK
      ?auto_268391 - BLOCK
      ?auto_268392 - BLOCK
      ?auto_268393 - BLOCK
      ?auto_268394 - BLOCK
      ?auto_268395 - BLOCK
    )
    :vars
    (
      ?auto_268396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268394 ) ( ON ?auto_268395 ?auto_268396 ) ( CLEAR ?auto_268395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268389 ) ( ON ?auto_268390 ?auto_268389 ) ( ON ?auto_268391 ?auto_268390 ) ( ON ?auto_268392 ?auto_268391 ) ( ON ?auto_268393 ?auto_268392 ) ( ON ?auto_268394 ?auto_268393 ) ( not ( = ?auto_268389 ?auto_268390 ) ) ( not ( = ?auto_268389 ?auto_268391 ) ) ( not ( = ?auto_268389 ?auto_268392 ) ) ( not ( = ?auto_268389 ?auto_268393 ) ) ( not ( = ?auto_268389 ?auto_268394 ) ) ( not ( = ?auto_268389 ?auto_268395 ) ) ( not ( = ?auto_268389 ?auto_268396 ) ) ( not ( = ?auto_268390 ?auto_268391 ) ) ( not ( = ?auto_268390 ?auto_268392 ) ) ( not ( = ?auto_268390 ?auto_268393 ) ) ( not ( = ?auto_268390 ?auto_268394 ) ) ( not ( = ?auto_268390 ?auto_268395 ) ) ( not ( = ?auto_268390 ?auto_268396 ) ) ( not ( = ?auto_268391 ?auto_268392 ) ) ( not ( = ?auto_268391 ?auto_268393 ) ) ( not ( = ?auto_268391 ?auto_268394 ) ) ( not ( = ?auto_268391 ?auto_268395 ) ) ( not ( = ?auto_268391 ?auto_268396 ) ) ( not ( = ?auto_268392 ?auto_268393 ) ) ( not ( = ?auto_268392 ?auto_268394 ) ) ( not ( = ?auto_268392 ?auto_268395 ) ) ( not ( = ?auto_268392 ?auto_268396 ) ) ( not ( = ?auto_268393 ?auto_268394 ) ) ( not ( = ?auto_268393 ?auto_268395 ) ) ( not ( = ?auto_268393 ?auto_268396 ) ) ( not ( = ?auto_268394 ?auto_268395 ) ) ( not ( = ?auto_268394 ?auto_268396 ) ) ( not ( = ?auto_268395 ?auto_268396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268395 ?auto_268396 )
      ( !STACK ?auto_268395 ?auto_268394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268419 - BLOCK
      ?auto_268420 - BLOCK
      ?auto_268421 - BLOCK
      ?auto_268422 - BLOCK
      ?auto_268423 - BLOCK
      ?auto_268424 - BLOCK
      ?auto_268425 - BLOCK
    )
    :vars
    (
      ?auto_268426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268425 ?auto_268426 ) ( ON-TABLE ?auto_268419 ) ( ON ?auto_268420 ?auto_268419 ) ( ON ?auto_268421 ?auto_268420 ) ( ON ?auto_268422 ?auto_268421 ) ( ON ?auto_268423 ?auto_268422 ) ( not ( = ?auto_268419 ?auto_268420 ) ) ( not ( = ?auto_268419 ?auto_268421 ) ) ( not ( = ?auto_268419 ?auto_268422 ) ) ( not ( = ?auto_268419 ?auto_268423 ) ) ( not ( = ?auto_268419 ?auto_268424 ) ) ( not ( = ?auto_268419 ?auto_268425 ) ) ( not ( = ?auto_268419 ?auto_268426 ) ) ( not ( = ?auto_268420 ?auto_268421 ) ) ( not ( = ?auto_268420 ?auto_268422 ) ) ( not ( = ?auto_268420 ?auto_268423 ) ) ( not ( = ?auto_268420 ?auto_268424 ) ) ( not ( = ?auto_268420 ?auto_268425 ) ) ( not ( = ?auto_268420 ?auto_268426 ) ) ( not ( = ?auto_268421 ?auto_268422 ) ) ( not ( = ?auto_268421 ?auto_268423 ) ) ( not ( = ?auto_268421 ?auto_268424 ) ) ( not ( = ?auto_268421 ?auto_268425 ) ) ( not ( = ?auto_268421 ?auto_268426 ) ) ( not ( = ?auto_268422 ?auto_268423 ) ) ( not ( = ?auto_268422 ?auto_268424 ) ) ( not ( = ?auto_268422 ?auto_268425 ) ) ( not ( = ?auto_268422 ?auto_268426 ) ) ( not ( = ?auto_268423 ?auto_268424 ) ) ( not ( = ?auto_268423 ?auto_268425 ) ) ( not ( = ?auto_268423 ?auto_268426 ) ) ( not ( = ?auto_268424 ?auto_268425 ) ) ( not ( = ?auto_268424 ?auto_268426 ) ) ( not ( = ?auto_268425 ?auto_268426 ) ) ( CLEAR ?auto_268423 ) ( ON ?auto_268424 ?auto_268425 ) ( CLEAR ?auto_268424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268422 ?auto_268423 ?auto_268424 )
      ( MAKE-7PILE ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268422 ?auto_268423 ?auto_268424 ?auto_268425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268449 - BLOCK
      ?auto_268450 - BLOCK
      ?auto_268451 - BLOCK
      ?auto_268452 - BLOCK
      ?auto_268453 - BLOCK
      ?auto_268454 - BLOCK
      ?auto_268455 - BLOCK
    )
    :vars
    (
      ?auto_268456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268455 ?auto_268456 ) ( ON-TABLE ?auto_268449 ) ( ON ?auto_268450 ?auto_268449 ) ( ON ?auto_268451 ?auto_268450 ) ( ON ?auto_268452 ?auto_268451 ) ( not ( = ?auto_268449 ?auto_268450 ) ) ( not ( = ?auto_268449 ?auto_268451 ) ) ( not ( = ?auto_268449 ?auto_268452 ) ) ( not ( = ?auto_268449 ?auto_268453 ) ) ( not ( = ?auto_268449 ?auto_268454 ) ) ( not ( = ?auto_268449 ?auto_268455 ) ) ( not ( = ?auto_268449 ?auto_268456 ) ) ( not ( = ?auto_268450 ?auto_268451 ) ) ( not ( = ?auto_268450 ?auto_268452 ) ) ( not ( = ?auto_268450 ?auto_268453 ) ) ( not ( = ?auto_268450 ?auto_268454 ) ) ( not ( = ?auto_268450 ?auto_268455 ) ) ( not ( = ?auto_268450 ?auto_268456 ) ) ( not ( = ?auto_268451 ?auto_268452 ) ) ( not ( = ?auto_268451 ?auto_268453 ) ) ( not ( = ?auto_268451 ?auto_268454 ) ) ( not ( = ?auto_268451 ?auto_268455 ) ) ( not ( = ?auto_268451 ?auto_268456 ) ) ( not ( = ?auto_268452 ?auto_268453 ) ) ( not ( = ?auto_268452 ?auto_268454 ) ) ( not ( = ?auto_268452 ?auto_268455 ) ) ( not ( = ?auto_268452 ?auto_268456 ) ) ( not ( = ?auto_268453 ?auto_268454 ) ) ( not ( = ?auto_268453 ?auto_268455 ) ) ( not ( = ?auto_268453 ?auto_268456 ) ) ( not ( = ?auto_268454 ?auto_268455 ) ) ( not ( = ?auto_268454 ?auto_268456 ) ) ( not ( = ?auto_268455 ?auto_268456 ) ) ( ON ?auto_268454 ?auto_268455 ) ( CLEAR ?auto_268452 ) ( ON ?auto_268453 ?auto_268454 ) ( CLEAR ?auto_268453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268449 ?auto_268450 ?auto_268451 ?auto_268452 ?auto_268453 )
      ( MAKE-7PILE ?auto_268449 ?auto_268450 ?auto_268451 ?auto_268452 ?auto_268453 ?auto_268454 ?auto_268455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268479 - BLOCK
      ?auto_268480 - BLOCK
      ?auto_268481 - BLOCK
      ?auto_268482 - BLOCK
      ?auto_268483 - BLOCK
      ?auto_268484 - BLOCK
      ?auto_268485 - BLOCK
    )
    :vars
    (
      ?auto_268486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268485 ?auto_268486 ) ( ON-TABLE ?auto_268479 ) ( ON ?auto_268480 ?auto_268479 ) ( ON ?auto_268481 ?auto_268480 ) ( not ( = ?auto_268479 ?auto_268480 ) ) ( not ( = ?auto_268479 ?auto_268481 ) ) ( not ( = ?auto_268479 ?auto_268482 ) ) ( not ( = ?auto_268479 ?auto_268483 ) ) ( not ( = ?auto_268479 ?auto_268484 ) ) ( not ( = ?auto_268479 ?auto_268485 ) ) ( not ( = ?auto_268479 ?auto_268486 ) ) ( not ( = ?auto_268480 ?auto_268481 ) ) ( not ( = ?auto_268480 ?auto_268482 ) ) ( not ( = ?auto_268480 ?auto_268483 ) ) ( not ( = ?auto_268480 ?auto_268484 ) ) ( not ( = ?auto_268480 ?auto_268485 ) ) ( not ( = ?auto_268480 ?auto_268486 ) ) ( not ( = ?auto_268481 ?auto_268482 ) ) ( not ( = ?auto_268481 ?auto_268483 ) ) ( not ( = ?auto_268481 ?auto_268484 ) ) ( not ( = ?auto_268481 ?auto_268485 ) ) ( not ( = ?auto_268481 ?auto_268486 ) ) ( not ( = ?auto_268482 ?auto_268483 ) ) ( not ( = ?auto_268482 ?auto_268484 ) ) ( not ( = ?auto_268482 ?auto_268485 ) ) ( not ( = ?auto_268482 ?auto_268486 ) ) ( not ( = ?auto_268483 ?auto_268484 ) ) ( not ( = ?auto_268483 ?auto_268485 ) ) ( not ( = ?auto_268483 ?auto_268486 ) ) ( not ( = ?auto_268484 ?auto_268485 ) ) ( not ( = ?auto_268484 ?auto_268486 ) ) ( not ( = ?auto_268485 ?auto_268486 ) ) ( ON ?auto_268484 ?auto_268485 ) ( ON ?auto_268483 ?auto_268484 ) ( CLEAR ?auto_268481 ) ( ON ?auto_268482 ?auto_268483 ) ( CLEAR ?auto_268482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268479 ?auto_268480 ?auto_268481 ?auto_268482 )
      ( MAKE-7PILE ?auto_268479 ?auto_268480 ?auto_268481 ?auto_268482 ?auto_268483 ?auto_268484 ?auto_268485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268509 - BLOCK
      ?auto_268510 - BLOCK
      ?auto_268511 - BLOCK
      ?auto_268512 - BLOCK
      ?auto_268513 - BLOCK
      ?auto_268514 - BLOCK
      ?auto_268515 - BLOCK
    )
    :vars
    (
      ?auto_268516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268515 ?auto_268516 ) ( ON-TABLE ?auto_268509 ) ( ON ?auto_268510 ?auto_268509 ) ( not ( = ?auto_268509 ?auto_268510 ) ) ( not ( = ?auto_268509 ?auto_268511 ) ) ( not ( = ?auto_268509 ?auto_268512 ) ) ( not ( = ?auto_268509 ?auto_268513 ) ) ( not ( = ?auto_268509 ?auto_268514 ) ) ( not ( = ?auto_268509 ?auto_268515 ) ) ( not ( = ?auto_268509 ?auto_268516 ) ) ( not ( = ?auto_268510 ?auto_268511 ) ) ( not ( = ?auto_268510 ?auto_268512 ) ) ( not ( = ?auto_268510 ?auto_268513 ) ) ( not ( = ?auto_268510 ?auto_268514 ) ) ( not ( = ?auto_268510 ?auto_268515 ) ) ( not ( = ?auto_268510 ?auto_268516 ) ) ( not ( = ?auto_268511 ?auto_268512 ) ) ( not ( = ?auto_268511 ?auto_268513 ) ) ( not ( = ?auto_268511 ?auto_268514 ) ) ( not ( = ?auto_268511 ?auto_268515 ) ) ( not ( = ?auto_268511 ?auto_268516 ) ) ( not ( = ?auto_268512 ?auto_268513 ) ) ( not ( = ?auto_268512 ?auto_268514 ) ) ( not ( = ?auto_268512 ?auto_268515 ) ) ( not ( = ?auto_268512 ?auto_268516 ) ) ( not ( = ?auto_268513 ?auto_268514 ) ) ( not ( = ?auto_268513 ?auto_268515 ) ) ( not ( = ?auto_268513 ?auto_268516 ) ) ( not ( = ?auto_268514 ?auto_268515 ) ) ( not ( = ?auto_268514 ?auto_268516 ) ) ( not ( = ?auto_268515 ?auto_268516 ) ) ( ON ?auto_268514 ?auto_268515 ) ( ON ?auto_268513 ?auto_268514 ) ( ON ?auto_268512 ?auto_268513 ) ( CLEAR ?auto_268510 ) ( ON ?auto_268511 ?auto_268512 ) ( CLEAR ?auto_268511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268509 ?auto_268510 ?auto_268511 )
      ( MAKE-7PILE ?auto_268509 ?auto_268510 ?auto_268511 ?auto_268512 ?auto_268513 ?auto_268514 ?auto_268515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268539 - BLOCK
      ?auto_268540 - BLOCK
      ?auto_268541 - BLOCK
      ?auto_268542 - BLOCK
      ?auto_268543 - BLOCK
      ?auto_268544 - BLOCK
      ?auto_268545 - BLOCK
    )
    :vars
    (
      ?auto_268546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268545 ?auto_268546 ) ( ON-TABLE ?auto_268539 ) ( not ( = ?auto_268539 ?auto_268540 ) ) ( not ( = ?auto_268539 ?auto_268541 ) ) ( not ( = ?auto_268539 ?auto_268542 ) ) ( not ( = ?auto_268539 ?auto_268543 ) ) ( not ( = ?auto_268539 ?auto_268544 ) ) ( not ( = ?auto_268539 ?auto_268545 ) ) ( not ( = ?auto_268539 ?auto_268546 ) ) ( not ( = ?auto_268540 ?auto_268541 ) ) ( not ( = ?auto_268540 ?auto_268542 ) ) ( not ( = ?auto_268540 ?auto_268543 ) ) ( not ( = ?auto_268540 ?auto_268544 ) ) ( not ( = ?auto_268540 ?auto_268545 ) ) ( not ( = ?auto_268540 ?auto_268546 ) ) ( not ( = ?auto_268541 ?auto_268542 ) ) ( not ( = ?auto_268541 ?auto_268543 ) ) ( not ( = ?auto_268541 ?auto_268544 ) ) ( not ( = ?auto_268541 ?auto_268545 ) ) ( not ( = ?auto_268541 ?auto_268546 ) ) ( not ( = ?auto_268542 ?auto_268543 ) ) ( not ( = ?auto_268542 ?auto_268544 ) ) ( not ( = ?auto_268542 ?auto_268545 ) ) ( not ( = ?auto_268542 ?auto_268546 ) ) ( not ( = ?auto_268543 ?auto_268544 ) ) ( not ( = ?auto_268543 ?auto_268545 ) ) ( not ( = ?auto_268543 ?auto_268546 ) ) ( not ( = ?auto_268544 ?auto_268545 ) ) ( not ( = ?auto_268544 ?auto_268546 ) ) ( not ( = ?auto_268545 ?auto_268546 ) ) ( ON ?auto_268544 ?auto_268545 ) ( ON ?auto_268543 ?auto_268544 ) ( ON ?auto_268542 ?auto_268543 ) ( ON ?auto_268541 ?auto_268542 ) ( CLEAR ?auto_268539 ) ( ON ?auto_268540 ?auto_268541 ) ( CLEAR ?auto_268540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268539 ?auto_268540 )
      ( MAKE-7PILE ?auto_268539 ?auto_268540 ?auto_268541 ?auto_268542 ?auto_268543 ?auto_268544 ?auto_268545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268569 - BLOCK
      ?auto_268570 - BLOCK
      ?auto_268571 - BLOCK
      ?auto_268572 - BLOCK
      ?auto_268573 - BLOCK
      ?auto_268574 - BLOCK
      ?auto_268575 - BLOCK
    )
    :vars
    (
      ?auto_268576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268575 ?auto_268576 ) ( not ( = ?auto_268569 ?auto_268570 ) ) ( not ( = ?auto_268569 ?auto_268571 ) ) ( not ( = ?auto_268569 ?auto_268572 ) ) ( not ( = ?auto_268569 ?auto_268573 ) ) ( not ( = ?auto_268569 ?auto_268574 ) ) ( not ( = ?auto_268569 ?auto_268575 ) ) ( not ( = ?auto_268569 ?auto_268576 ) ) ( not ( = ?auto_268570 ?auto_268571 ) ) ( not ( = ?auto_268570 ?auto_268572 ) ) ( not ( = ?auto_268570 ?auto_268573 ) ) ( not ( = ?auto_268570 ?auto_268574 ) ) ( not ( = ?auto_268570 ?auto_268575 ) ) ( not ( = ?auto_268570 ?auto_268576 ) ) ( not ( = ?auto_268571 ?auto_268572 ) ) ( not ( = ?auto_268571 ?auto_268573 ) ) ( not ( = ?auto_268571 ?auto_268574 ) ) ( not ( = ?auto_268571 ?auto_268575 ) ) ( not ( = ?auto_268571 ?auto_268576 ) ) ( not ( = ?auto_268572 ?auto_268573 ) ) ( not ( = ?auto_268572 ?auto_268574 ) ) ( not ( = ?auto_268572 ?auto_268575 ) ) ( not ( = ?auto_268572 ?auto_268576 ) ) ( not ( = ?auto_268573 ?auto_268574 ) ) ( not ( = ?auto_268573 ?auto_268575 ) ) ( not ( = ?auto_268573 ?auto_268576 ) ) ( not ( = ?auto_268574 ?auto_268575 ) ) ( not ( = ?auto_268574 ?auto_268576 ) ) ( not ( = ?auto_268575 ?auto_268576 ) ) ( ON ?auto_268574 ?auto_268575 ) ( ON ?auto_268573 ?auto_268574 ) ( ON ?auto_268572 ?auto_268573 ) ( ON ?auto_268571 ?auto_268572 ) ( ON ?auto_268570 ?auto_268571 ) ( ON ?auto_268569 ?auto_268570 ) ( CLEAR ?auto_268569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268569 )
      ( MAKE-7PILE ?auto_268569 ?auto_268570 ?auto_268571 ?auto_268572 ?auto_268573 ?auto_268574 ?auto_268575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268600 - BLOCK
      ?auto_268601 - BLOCK
      ?auto_268602 - BLOCK
      ?auto_268603 - BLOCK
      ?auto_268604 - BLOCK
      ?auto_268605 - BLOCK
      ?auto_268606 - BLOCK
      ?auto_268607 - BLOCK
    )
    :vars
    (
      ?auto_268608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268606 ) ( ON ?auto_268607 ?auto_268608 ) ( CLEAR ?auto_268607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268600 ) ( ON ?auto_268601 ?auto_268600 ) ( ON ?auto_268602 ?auto_268601 ) ( ON ?auto_268603 ?auto_268602 ) ( ON ?auto_268604 ?auto_268603 ) ( ON ?auto_268605 ?auto_268604 ) ( ON ?auto_268606 ?auto_268605 ) ( not ( = ?auto_268600 ?auto_268601 ) ) ( not ( = ?auto_268600 ?auto_268602 ) ) ( not ( = ?auto_268600 ?auto_268603 ) ) ( not ( = ?auto_268600 ?auto_268604 ) ) ( not ( = ?auto_268600 ?auto_268605 ) ) ( not ( = ?auto_268600 ?auto_268606 ) ) ( not ( = ?auto_268600 ?auto_268607 ) ) ( not ( = ?auto_268600 ?auto_268608 ) ) ( not ( = ?auto_268601 ?auto_268602 ) ) ( not ( = ?auto_268601 ?auto_268603 ) ) ( not ( = ?auto_268601 ?auto_268604 ) ) ( not ( = ?auto_268601 ?auto_268605 ) ) ( not ( = ?auto_268601 ?auto_268606 ) ) ( not ( = ?auto_268601 ?auto_268607 ) ) ( not ( = ?auto_268601 ?auto_268608 ) ) ( not ( = ?auto_268602 ?auto_268603 ) ) ( not ( = ?auto_268602 ?auto_268604 ) ) ( not ( = ?auto_268602 ?auto_268605 ) ) ( not ( = ?auto_268602 ?auto_268606 ) ) ( not ( = ?auto_268602 ?auto_268607 ) ) ( not ( = ?auto_268602 ?auto_268608 ) ) ( not ( = ?auto_268603 ?auto_268604 ) ) ( not ( = ?auto_268603 ?auto_268605 ) ) ( not ( = ?auto_268603 ?auto_268606 ) ) ( not ( = ?auto_268603 ?auto_268607 ) ) ( not ( = ?auto_268603 ?auto_268608 ) ) ( not ( = ?auto_268604 ?auto_268605 ) ) ( not ( = ?auto_268604 ?auto_268606 ) ) ( not ( = ?auto_268604 ?auto_268607 ) ) ( not ( = ?auto_268604 ?auto_268608 ) ) ( not ( = ?auto_268605 ?auto_268606 ) ) ( not ( = ?auto_268605 ?auto_268607 ) ) ( not ( = ?auto_268605 ?auto_268608 ) ) ( not ( = ?auto_268606 ?auto_268607 ) ) ( not ( = ?auto_268606 ?auto_268608 ) ) ( not ( = ?auto_268607 ?auto_268608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268607 ?auto_268608 )
      ( !STACK ?auto_268607 ?auto_268606 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268634 - BLOCK
      ?auto_268635 - BLOCK
      ?auto_268636 - BLOCK
      ?auto_268637 - BLOCK
      ?auto_268638 - BLOCK
      ?auto_268639 - BLOCK
      ?auto_268640 - BLOCK
      ?auto_268641 - BLOCK
    )
    :vars
    (
      ?auto_268642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268641 ?auto_268642 ) ( ON-TABLE ?auto_268634 ) ( ON ?auto_268635 ?auto_268634 ) ( ON ?auto_268636 ?auto_268635 ) ( ON ?auto_268637 ?auto_268636 ) ( ON ?auto_268638 ?auto_268637 ) ( ON ?auto_268639 ?auto_268638 ) ( not ( = ?auto_268634 ?auto_268635 ) ) ( not ( = ?auto_268634 ?auto_268636 ) ) ( not ( = ?auto_268634 ?auto_268637 ) ) ( not ( = ?auto_268634 ?auto_268638 ) ) ( not ( = ?auto_268634 ?auto_268639 ) ) ( not ( = ?auto_268634 ?auto_268640 ) ) ( not ( = ?auto_268634 ?auto_268641 ) ) ( not ( = ?auto_268634 ?auto_268642 ) ) ( not ( = ?auto_268635 ?auto_268636 ) ) ( not ( = ?auto_268635 ?auto_268637 ) ) ( not ( = ?auto_268635 ?auto_268638 ) ) ( not ( = ?auto_268635 ?auto_268639 ) ) ( not ( = ?auto_268635 ?auto_268640 ) ) ( not ( = ?auto_268635 ?auto_268641 ) ) ( not ( = ?auto_268635 ?auto_268642 ) ) ( not ( = ?auto_268636 ?auto_268637 ) ) ( not ( = ?auto_268636 ?auto_268638 ) ) ( not ( = ?auto_268636 ?auto_268639 ) ) ( not ( = ?auto_268636 ?auto_268640 ) ) ( not ( = ?auto_268636 ?auto_268641 ) ) ( not ( = ?auto_268636 ?auto_268642 ) ) ( not ( = ?auto_268637 ?auto_268638 ) ) ( not ( = ?auto_268637 ?auto_268639 ) ) ( not ( = ?auto_268637 ?auto_268640 ) ) ( not ( = ?auto_268637 ?auto_268641 ) ) ( not ( = ?auto_268637 ?auto_268642 ) ) ( not ( = ?auto_268638 ?auto_268639 ) ) ( not ( = ?auto_268638 ?auto_268640 ) ) ( not ( = ?auto_268638 ?auto_268641 ) ) ( not ( = ?auto_268638 ?auto_268642 ) ) ( not ( = ?auto_268639 ?auto_268640 ) ) ( not ( = ?auto_268639 ?auto_268641 ) ) ( not ( = ?auto_268639 ?auto_268642 ) ) ( not ( = ?auto_268640 ?auto_268641 ) ) ( not ( = ?auto_268640 ?auto_268642 ) ) ( not ( = ?auto_268641 ?auto_268642 ) ) ( CLEAR ?auto_268639 ) ( ON ?auto_268640 ?auto_268641 ) ( CLEAR ?auto_268640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268634 ?auto_268635 ?auto_268636 ?auto_268637 ?auto_268638 ?auto_268639 ?auto_268640 )
      ( MAKE-8PILE ?auto_268634 ?auto_268635 ?auto_268636 ?auto_268637 ?auto_268638 ?auto_268639 ?auto_268640 ?auto_268641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268668 - BLOCK
      ?auto_268669 - BLOCK
      ?auto_268670 - BLOCK
      ?auto_268671 - BLOCK
      ?auto_268672 - BLOCK
      ?auto_268673 - BLOCK
      ?auto_268674 - BLOCK
      ?auto_268675 - BLOCK
    )
    :vars
    (
      ?auto_268676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268675 ?auto_268676 ) ( ON-TABLE ?auto_268668 ) ( ON ?auto_268669 ?auto_268668 ) ( ON ?auto_268670 ?auto_268669 ) ( ON ?auto_268671 ?auto_268670 ) ( ON ?auto_268672 ?auto_268671 ) ( not ( = ?auto_268668 ?auto_268669 ) ) ( not ( = ?auto_268668 ?auto_268670 ) ) ( not ( = ?auto_268668 ?auto_268671 ) ) ( not ( = ?auto_268668 ?auto_268672 ) ) ( not ( = ?auto_268668 ?auto_268673 ) ) ( not ( = ?auto_268668 ?auto_268674 ) ) ( not ( = ?auto_268668 ?auto_268675 ) ) ( not ( = ?auto_268668 ?auto_268676 ) ) ( not ( = ?auto_268669 ?auto_268670 ) ) ( not ( = ?auto_268669 ?auto_268671 ) ) ( not ( = ?auto_268669 ?auto_268672 ) ) ( not ( = ?auto_268669 ?auto_268673 ) ) ( not ( = ?auto_268669 ?auto_268674 ) ) ( not ( = ?auto_268669 ?auto_268675 ) ) ( not ( = ?auto_268669 ?auto_268676 ) ) ( not ( = ?auto_268670 ?auto_268671 ) ) ( not ( = ?auto_268670 ?auto_268672 ) ) ( not ( = ?auto_268670 ?auto_268673 ) ) ( not ( = ?auto_268670 ?auto_268674 ) ) ( not ( = ?auto_268670 ?auto_268675 ) ) ( not ( = ?auto_268670 ?auto_268676 ) ) ( not ( = ?auto_268671 ?auto_268672 ) ) ( not ( = ?auto_268671 ?auto_268673 ) ) ( not ( = ?auto_268671 ?auto_268674 ) ) ( not ( = ?auto_268671 ?auto_268675 ) ) ( not ( = ?auto_268671 ?auto_268676 ) ) ( not ( = ?auto_268672 ?auto_268673 ) ) ( not ( = ?auto_268672 ?auto_268674 ) ) ( not ( = ?auto_268672 ?auto_268675 ) ) ( not ( = ?auto_268672 ?auto_268676 ) ) ( not ( = ?auto_268673 ?auto_268674 ) ) ( not ( = ?auto_268673 ?auto_268675 ) ) ( not ( = ?auto_268673 ?auto_268676 ) ) ( not ( = ?auto_268674 ?auto_268675 ) ) ( not ( = ?auto_268674 ?auto_268676 ) ) ( not ( = ?auto_268675 ?auto_268676 ) ) ( ON ?auto_268674 ?auto_268675 ) ( CLEAR ?auto_268672 ) ( ON ?auto_268673 ?auto_268674 ) ( CLEAR ?auto_268673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268668 ?auto_268669 ?auto_268670 ?auto_268671 ?auto_268672 ?auto_268673 )
      ( MAKE-8PILE ?auto_268668 ?auto_268669 ?auto_268670 ?auto_268671 ?auto_268672 ?auto_268673 ?auto_268674 ?auto_268675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268702 - BLOCK
      ?auto_268703 - BLOCK
      ?auto_268704 - BLOCK
      ?auto_268705 - BLOCK
      ?auto_268706 - BLOCK
      ?auto_268707 - BLOCK
      ?auto_268708 - BLOCK
      ?auto_268709 - BLOCK
    )
    :vars
    (
      ?auto_268710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268709 ?auto_268710 ) ( ON-TABLE ?auto_268702 ) ( ON ?auto_268703 ?auto_268702 ) ( ON ?auto_268704 ?auto_268703 ) ( ON ?auto_268705 ?auto_268704 ) ( not ( = ?auto_268702 ?auto_268703 ) ) ( not ( = ?auto_268702 ?auto_268704 ) ) ( not ( = ?auto_268702 ?auto_268705 ) ) ( not ( = ?auto_268702 ?auto_268706 ) ) ( not ( = ?auto_268702 ?auto_268707 ) ) ( not ( = ?auto_268702 ?auto_268708 ) ) ( not ( = ?auto_268702 ?auto_268709 ) ) ( not ( = ?auto_268702 ?auto_268710 ) ) ( not ( = ?auto_268703 ?auto_268704 ) ) ( not ( = ?auto_268703 ?auto_268705 ) ) ( not ( = ?auto_268703 ?auto_268706 ) ) ( not ( = ?auto_268703 ?auto_268707 ) ) ( not ( = ?auto_268703 ?auto_268708 ) ) ( not ( = ?auto_268703 ?auto_268709 ) ) ( not ( = ?auto_268703 ?auto_268710 ) ) ( not ( = ?auto_268704 ?auto_268705 ) ) ( not ( = ?auto_268704 ?auto_268706 ) ) ( not ( = ?auto_268704 ?auto_268707 ) ) ( not ( = ?auto_268704 ?auto_268708 ) ) ( not ( = ?auto_268704 ?auto_268709 ) ) ( not ( = ?auto_268704 ?auto_268710 ) ) ( not ( = ?auto_268705 ?auto_268706 ) ) ( not ( = ?auto_268705 ?auto_268707 ) ) ( not ( = ?auto_268705 ?auto_268708 ) ) ( not ( = ?auto_268705 ?auto_268709 ) ) ( not ( = ?auto_268705 ?auto_268710 ) ) ( not ( = ?auto_268706 ?auto_268707 ) ) ( not ( = ?auto_268706 ?auto_268708 ) ) ( not ( = ?auto_268706 ?auto_268709 ) ) ( not ( = ?auto_268706 ?auto_268710 ) ) ( not ( = ?auto_268707 ?auto_268708 ) ) ( not ( = ?auto_268707 ?auto_268709 ) ) ( not ( = ?auto_268707 ?auto_268710 ) ) ( not ( = ?auto_268708 ?auto_268709 ) ) ( not ( = ?auto_268708 ?auto_268710 ) ) ( not ( = ?auto_268709 ?auto_268710 ) ) ( ON ?auto_268708 ?auto_268709 ) ( ON ?auto_268707 ?auto_268708 ) ( CLEAR ?auto_268705 ) ( ON ?auto_268706 ?auto_268707 ) ( CLEAR ?auto_268706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268702 ?auto_268703 ?auto_268704 ?auto_268705 ?auto_268706 )
      ( MAKE-8PILE ?auto_268702 ?auto_268703 ?auto_268704 ?auto_268705 ?auto_268706 ?auto_268707 ?auto_268708 ?auto_268709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268736 - BLOCK
      ?auto_268737 - BLOCK
      ?auto_268738 - BLOCK
      ?auto_268739 - BLOCK
      ?auto_268740 - BLOCK
      ?auto_268741 - BLOCK
      ?auto_268742 - BLOCK
      ?auto_268743 - BLOCK
    )
    :vars
    (
      ?auto_268744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268743 ?auto_268744 ) ( ON-TABLE ?auto_268736 ) ( ON ?auto_268737 ?auto_268736 ) ( ON ?auto_268738 ?auto_268737 ) ( not ( = ?auto_268736 ?auto_268737 ) ) ( not ( = ?auto_268736 ?auto_268738 ) ) ( not ( = ?auto_268736 ?auto_268739 ) ) ( not ( = ?auto_268736 ?auto_268740 ) ) ( not ( = ?auto_268736 ?auto_268741 ) ) ( not ( = ?auto_268736 ?auto_268742 ) ) ( not ( = ?auto_268736 ?auto_268743 ) ) ( not ( = ?auto_268736 ?auto_268744 ) ) ( not ( = ?auto_268737 ?auto_268738 ) ) ( not ( = ?auto_268737 ?auto_268739 ) ) ( not ( = ?auto_268737 ?auto_268740 ) ) ( not ( = ?auto_268737 ?auto_268741 ) ) ( not ( = ?auto_268737 ?auto_268742 ) ) ( not ( = ?auto_268737 ?auto_268743 ) ) ( not ( = ?auto_268737 ?auto_268744 ) ) ( not ( = ?auto_268738 ?auto_268739 ) ) ( not ( = ?auto_268738 ?auto_268740 ) ) ( not ( = ?auto_268738 ?auto_268741 ) ) ( not ( = ?auto_268738 ?auto_268742 ) ) ( not ( = ?auto_268738 ?auto_268743 ) ) ( not ( = ?auto_268738 ?auto_268744 ) ) ( not ( = ?auto_268739 ?auto_268740 ) ) ( not ( = ?auto_268739 ?auto_268741 ) ) ( not ( = ?auto_268739 ?auto_268742 ) ) ( not ( = ?auto_268739 ?auto_268743 ) ) ( not ( = ?auto_268739 ?auto_268744 ) ) ( not ( = ?auto_268740 ?auto_268741 ) ) ( not ( = ?auto_268740 ?auto_268742 ) ) ( not ( = ?auto_268740 ?auto_268743 ) ) ( not ( = ?auto_268740 ?auto_268744 ) ) ( not ( = ?auto_268741 ?auto_268742 ) ) ( not ( = ?auto_268741 ?auto_268743 ) ) ( not ( = ?auto_268741 ?auto_268744 ) ) ( not ( = ?auto_268742 ?auto_268743 ) ) ( not ( = ?auto_268742 ?auto_268744 ) ) ( not ( = ?auto_268743 ?auto_268744 ) ) ( ON ?auto_268742 ?auto_268743 ) ( ON ?auto_268741 ?auto_268742 ) ( ON ?auto_268740 ?auto_268741 ) ( CLEAR ?auto_268738 ) ( ON ?auto_268739 ?auto_268740 ) ( CLEAR ?auto_268739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268736 ?auto_268737 ?auto_268738 ?auto_268739 )
      ( MAKE-8PILE ?auto_268736 ?auto_268737 ?auto_268738 ?auto_268739 ?auto_268740 ?auto_268741 ?auto_268742 ?auto_268743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268770 - BLOCK
      ?auto_268771 - BLOCK
      ?auto_268772 - BLOCK
      ?auto_268773 - BLOCK
      ?auto_268774 - BLOCK
      ?auto_268775 - BLOCK
      ?auto_268776 - BLOCK
      ?auto_268777 - BLOCK
    )
    :vars
    (
      ?auto_268778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268777 ?auto_268778 ) ( ON-TABLE ?auto_268770 ) ( ON ?auto_268771 ?auto_268770 ) ( not ( = ?auto_268770 ?auto_268771 ) ) ( not ( = ?auto_268770 ?auto_268772 ) ) ( not ( = ?auto_268770 ?auto_268773 ) ) ( not ( = ?auto_268770 ?auto_268774 ) ) ( not ( = ?auto_268770 ?auto_268775 ) ) ( not ( = ?auto_268770 ?auto_268776 ) ) ( not ( = ?auto_268770 ?auto_268777 ) ) ( not ( = ?auto_268770 ?auto_268778 ) ) ( not ( = ?auto_268771 ?auto_268772 ) ) ( not ( = ?auto_268771 ?auto_268773 ) ) ( not ( = ?auto_268771 ?auto_268774 ) ) ( not ( = ?auto_268771 ?auto_268775 ) ) ( not ( = ?auto_268771 ?auto_268776 ) ) ( not ( = ?auto_268771 ?auto_268777 ) ) ( not ( = ?auto_268771 ?auto_268778 ) ) ( not ( = ?auto_268772 ?auto_268773 ) ) ( not ( = ?auto_268772 ?auto_268774 ) ) ( not ( = ?auto_268772 ?auto_268775 ) ) ( not ( = ?auto_268772 ?auto_268776 ) ) ( not ( = ?auto_268772 ?auto_268777 ) ) ( not ( = ?auto_268772 ?auto_268778 ) ) ( not ( = ?auto_268773 ?auto_268774 ) ) ( not ( = ?auto_268773 ?auto_268775 ) ) ( not ( = ?auto_268773 ?auto_268776 ) ) ( not ( = ?auto_268773 ?auto_268777 ) ) ( not ( = ?auto_268773 ?auto_268778 ) ) ( not ( = ?auto_268774 ?auto_268775 ) ) ( not ( = ?auto_268774 ?auto_268776 ) ) ( not ( = ?auto_268774 ?auto_268777 ) ) ( not ( = ?auto_268774 ?auto_268778 ) ) ( not ( = ?auto_268775 ?auto_268776 ) ) ( not ( = ?auto_268775 ?auto_268777 ) ) ( not ( = ?auto_268775 ?auto_268778 ) ) ( not ( = ?auto_268776 ?auto_268777 ) ) ( not ( = ?auto_268776 ?auto_268778 ) ) ( not ( = ?auto_268777 ?auto_268778 ) ) ( ON ?auto_268776 ?auto_268777 ) ( ON ?auto_268775 ?auto_268776 ) ( ON ?auto_268774 ?auto_268775 ) ( ON ?auto_268773 ?auto_268774 ) ( CLEAR ?auto_268771 ) ( ON ?auto_268772 ?auto_268773 ) ( CLEAR ?auto_268772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268770 ?auto_268771 ?auto_268772 )
      ( MAKE-8PILE ?auto_268770 ?auto_268771 ?auto_268772 ?auto_268773 ?auto_268774 ?auto_268775 ?auto_268776 ?auto_268777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268804 - BLOCK
      ?auto_268805 - BLOCK
      ?auto_268806 - BLOCK
      ?auto_268807 - BLOCK
      ?auto_268808 - BLOCK
      ?auto_268809 - BLOCK
      ?auto_268810 - BLOCK
      ?auto_268811 - BLOCK
    )
    :vars
    (
      ?auto_268812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268811 ?auto_268812 ) ( ON-TABLE ?auto_268804 ) ( not ( = ?auto_268804 ?auto_268805 ) ) ( not ( = ?auto_268804 ?auto_268806 ) ) ( not ( = ?auto_268804 ?auto_268807 ) ) ( not ( = ?auto_268804 ?auto_268808 ) ) ( not ( = ?auto_268804 ?auto_268809 ) ) ( not ( = ?auto_268804 ?auto_268810 ) ) ( not ( = ?auto_268804 ?auto_268811 ) ) ( not ( = ?auto_268804 ?auto_268812 ) ) ( not ( = ?auto_268805 ?auto_268806 ) ) ( not ( = ?auto_268805 ?auto_268807 ) ) ( not ( = ?auto_268805 ?auto_268808 ) ) ( not ( = ?auto_268805 ?auto_268809 ) ) ( not ( = ?auto_268805 ?auto_268810 ) ) ( not ( = ?auto_268805 ?auto_268811 ) ) ( not ( = ?auto_268805 ?auto_268812 ) ) ( not ( = ?auto_268806 ?auto_268807 ) ) ( not ( = ?auto_268806 ?auto_268808 ) ) ( not ( = ?auto_268806 ?auto_268809 ) ) ( not ( = ?auto_268806 ?auto_268810 ) ) ( not ( = ?auto_268806 ?auto_268811 ) ) ( not ( = ?auto_268806 ?auto_268812 ) ) ( not ( = ?auto_268807 ?auto_268808 ) ) ( not ( = ?auto_268807 ?auto_268809 ) ) ( not ( = ?auto_268807 ?auto_268810 ) ) ( not ( = ?auto_268807 ?auto_268811 ) ) ( not ( = ?auto_268807 ?auto_268812 ) ) ( not ( = ?auto_268808 ?auto_268809 ) ) ( not ( = ?auto_268808 ?auto_268810 ) ) ( not ( = ?auto_268808 ?auto_268811 ) ) ( not ( = ?auto_268808 ?auto_268812 ) ) ( not ( = ?auto_268809 ?auto_268810 ) ) ( not ( = ?auto_268809 ?auto_268811 ) ) ( not ( = ?auto_268809 ?auto_268812 ) ) ( not ( = ?auto_268810 ?auto_268811 ) ) ( not ( = ?auto_268810 ?auto_268812 ) ) ( not ( = ?auto_268811 ?auto_268812 ) ) ( ON ?auto_268810 ?auto_268811 ) ( ON ?auto_268809 ?auto_268810 ) ( ON ?auto_268808 ?auto_268809 ) ( ON ?auto_268807 ?auto_268808 ) ( ON ?auto_268806 ?auto_268807 ) ( CLEAR ?auto_268804 ) ( ON ?auto_268805 ?auto_268806 ) ( CLEAR ?auto_268805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268804 ?auto_268805 )
      ( MAKE-8PILE ?auto_268804 ?auto_268805 ?auto_268806 ?auto_268807 ?auto_268808 ?auto_268809 ?auto_268810 ?auto_268811 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268838 - BLOCK
      ?auto_268839 - BLOCK
      ?auto_268840 - BLOCK
      ?auto_268841 - BLOCK
      ?auto_268842 - BLOCK
      ?auto_268843 - BLOCK
      ?auto_268844 - BLOCK
      ?auto_268845 - BLOCK
    )
    :vars
    (
      ?auto_268846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268845 ?auto_268846 ) ( not ( = ?auto_268838 ?auto_268839 ) ) ( not ( = ?auto_268838 ?auto_268840 ) ) ( not ( = ?auto_268838 ?auto_268841 ) ) ( not ( = ?auto_268838 ?auto_268842 ) ) ( not ( = ?auto_268838 ?auto_268843 ) ) ( not ( = ?auto_268838 ?auto_268844 ) ) ( not ( = ?auto_268838 ?auto_268845 ) ) ( not ( = ?auto_268838 ?auto_268846 ) ) ( not ( = ?auto_268839 ?auto_268840 ) ) ( not ( = ?auto_268839 ?auto_268841 ) ) ( not ( = ?auto_268839 ?auto_268842 ) ) ( not ( = ?auto_268839 ?auto_268843 ) ) ( not ( = ?auto_268839 ?auto_268844 ) ) ( not ( = ?auto_268839 ?auto_268845 ) ) ( not ( = ?auto_268839 ?auto_268846 ) ) ( not ( = ?auto_268840 ?auto_268841 ) ) ( not ( = ?auto_268840 ?auto_268842 ) ) ( not ( = ?auto_268840 ?auto_268843 ) ) ( not ( = ?auto_268840 ?auto_268844 ) ) ( not ( = ?auto_268840 ?auto_268845 ) ) ( not ( = ?auto_268840 ?auto_268846 ) ) ( not ( = ?auto_268841 ?auto_268842 ) ) ( not ( = ?auto_268841 ?auto_268843 ) ) ( not ( = ?auto_268841 ?auto_268844 ) ) ( not ( = ?auto_268841 ?auto_268845 ) ) ( not ( = ?auto_268841 ?auto_268846 ) ) ( not ( = ?auto_268842 ?auto_268843 ) ) ( not ( = ?auto_268842 ?auto_268844 ) ) ( not ( = ?auto_268842 ?auto_268845 ) ) ( not ( = ?auto_268842 ?auto_268846 ) ) ( not ( = ?auto_268843 ?auto_268844 ) ) ( not ( = ?auto_268843 ?auto_268845 ) ) ( not ( = ?auto_268843 ?auto_268846 ) ) ( not ( = ?auto_268844 ?auto_268845 ) ) ( not ( = ?auto_268844 ?auto_268846 ) ) ( not ( = ?auto_268845 ?auto_268846 ) ) ( ON ?auto_268844 ?auto_268845 ) ( ON ?auto_268843 ?auto_268844 ) ( ON ?auto_268842 ?auto_268843 ) ( ON ?auto_268841 ?auto_268842 ) ( ON ?auto_268840 ?auto_268841 ) ( ON ?auto_268839 ?auto_268840 ) ( ON ?auto_268838 ?auto_268839 ) ( CLEAR ?auto_268838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268838 )
      ( MAKE-8PILE ?auto_268838 ?auto_268839 ?auto_268840 ?auto_268841 ?auto_268842 ?auto_268843 ?auto_268844 ?auto_268845 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268873 - BLOCK
      ?auto_268874 - BLOCK
      ?auto_268875 - BLOCK
      ?auto_268876 - BLOCK
      ?auto_268877 - BLOCK
      ?auto_268878 - BLOCK
      ?auto_268879 - BLOCK
      ?auto_268880 - BLOCK
      ?auto_268881 - BLOCK
    )
    :vars
    (
      ?auto_268882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268880 ) ( ON ?auto_268881 ?auto_268882 ) ( CLEAR ?auto_268881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268873 ) ( ON ?auto_268874 ?auto_268873 ) ( ON ?auto_268875 ?auto_268874 ) ( ON ?auto_268876 ?auto_268875 ) ( ON ?auto_268877 ?auto_268876 ) ( ON ?auto_268878 ?auto_268877 ) ( ON ?auto_268879 ?auto_268878 ) ( ON ?auto_268880 ?auto_268879 ) ( not ( = ?auto_268873 ?auto_268874 ) ) ( not ( = ?auto_268873 ?auto_268875 ) ) ( not ( = ?auto_268873 ?auto_268876 ) ) ( not ( = ?auto_268873 ?auto_268877 ) ) ( not ( = ?auto_268873 ?auto_268878 ) ) ( not ( = ?auto_268873 ?auto_268879 ) ) ( not ( = ?auto_268873 ?auto_268880 ) ) ( not ( = ?auto_268873 ?auto_268881 ) ) ( not ( = ?auto_268873 ?auto_268882 ) ) ( not ( = ?auto_268874 ?auto_268875 ) ) ( not ( = ?auto_268874 ?auto_268876 ) ) ( not ( = ?auto_268874 ?auto_268877 ) ) ( not ( = ?auto_268874 ?auto_268878 ) ) ( not ( = ?auto_268874 ?auto_268879 ) ) ( not ( = ?auto_268874 ?auto_268880 ) ) ( not ( = ?auto_268874 ?auto_268881 ) ) ( not ( = ?auto_268874 ?auto_268882 ) ) ( not ( = ?auto_268875 ?auto_268876 ) ) ( not ( = ?auto_268875 ?auto_268877 ) ) ( not ( = ?auto_268875 ?auto_268878 ) ) ( not ( = ?auto_268875 ?auto_268879 ) ) ( not ( = ?auto_268875 ?auto_268880 ) ) ( not ( = ?auto_268875 ?auto_268881 ) ) ( not ( = ?auto_268875 ?auto_268882 ) ) ( not ( = ?auto_268876 ?auto_268877 ) ) ( not ( = ?auto_268876 ?auto_268878 ) ) ( not ( = ?auto_268876 ?auto_268879 ) ) ( not ( = ?auto_268876 ?auto_268880 ) ) ( not ( = ?auto_268876 ?auto_268881 ) ) ( not ( = ?auto_268876 ?auto_268882 ) ) ( not ( = ?auto_268877 ?auto_268878 ) ) ( not ( = ?auto_268877 ?auto_268879 ) ) ( not ( = ?auto_268877 ?auto_268880 ) ) ( not ( = ?auto_268877 ?auto_268881 ) ) ( not ( = ?auto_268877 ?auto_268882 ) ) ( not ( = ?auto_268878 ?auto_268879 ) ) ( not ( = ?auto_268878 ?auto_268880 ) ) ( not ( = ?auto_268878 ?auto_268881 ) ) ( not ( = ?auto_268878 ?auto_268882 ) ) ( not ( = ?auto_268879 ?auto_268880 ) ) ( not ( = ?auto_268879 ?auto_268881 ) ) ( not ( = ?auto_268879 ?auto_268882 ) ) ( not ( = ?auto_268880 ?auto_268881 ) ) ( not ( = ?auto_268880 ?auto_268882 ) ) ( not ( = ?auto_268881 ?auto_268882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268881 ?auto_268882 )
      ( !STACK ?auto_268881 ?auto_268880 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268911 - BLOCK
      ?auto_268912 - BLOCK
      ?auto_268913 - BLOCK
      ?auto_268914 - BLOCK
      ?auto_268915 - BLOCK
      ?auto_268916 - BLOCK
      ?auto_268917 - BLOCK
      ?auto_268918 - BLOCK
      ?auto_268919 - BLOCK
    )
    :vars
    (
      ?auto_268920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268919 ?auto_268920 ) ( ON-TABLE ?auto_268911 ) ( ON ?auto_268912 ?auto_268911 ) ( ON ?auto_268913 ?auto_268912 ) ( ON ?auto_268914 ?auto_268913 ) ( ON ?auto_268915 ?auto_268914 ) ( ON ?auto_268916 ?auto_268915 ) ( ON ?auto_268917 ?auto_268916 ) ( not ( = ?auto_268911 ?auto_268912 ) ) ( not ( = ?auto_268911 ?auto_268913 ) ) ( not ( = ?auto_268911 ?auto_268914 ) ) ( not ( = ?auto_268911 ?auto_268915 ) ) ( not ( = ?auto_268911 ?auto_268916 ) ) ( not ( = ?auto_268911 ?auto_268917 ) ) ( not ( = ?auto_268911 ?auto_268918 ) ) ( not ( = ?auto_268911 ?auto_268919 ) ) ( not ( = ?auto_268911 ?auto_268920 ) ) ( not ( = ?auto_268912 ?auto_268913 ) ) ( not ( = ?auto_268912 ?auto_268914 ) ) ( not ( = ?auto_268912 ?auto_268915 ) ) ( not ( = ?auto_268912 ?auto_268916 ) ) ( not ( = ?auto_268912 ?auto_268917 ) ) ( not ( = ?auto_268912 ?auto_268918 ) ) ( not ( = ?auto_268912 ?auto_268919 ) ) ( not ( = ?auto_268912 ?auto_268920 ) ) ( not ( = ?auto_268913 ?auto_268914 ) ) ( not ( = ?auto_268913 ?auto_268915 ) ) ( not ( = ?auto_268913 ?auto_268916 ) ) ( not ( = ?auto_268913 ?auto_268917 ) ) ( not ( = ?auto_268913 ?auto_268918 ) ) ( not ( = ?auto_268913 ?auto_268919 ) ) ( not ( = ?auto_268913 ?auto_268920 ) ) ( not ( = ?auto_268914 ?auto_268915 ) ) ( not ( = ?auto_268914 ?auto_268916 ) ) ( not ( = ?auto_268914 ?auto_268917 ) ) ( not ( = ?auto_268914 ?auto_268918 ) ) ( not ( = ?auto_268914 ?auto_268919 ) ) ( not ( = ?auto_268914 ?auto_268920 ) ) ( not ( = ?auto_268915 ?auto_268916 ) ) ( not ( = ?auto_268915 ?auto_268917 ) ) ( not ( = ?auto_268915 ?auto_268918 ) ) ( not ( = ?auto_268915 ?auto_268919 ) ) ( not ( = ?auto_268915 ?auto_268920 ) ) ( not ( = ?auto_268916 ?auto_268917 ) ) ( not ( = ?auto_268916 ?auto_268918 ) ) ( not ( = ?auto_268916 ?auto_268919 ) ) ( not ( = ?auto_268916 ?auto_268920 ) ) ( not ( = ?auto_268917 ?auto_268918 ) ) ( not ( = ?auto_268917 ?auto_268919 ) ) ( not ( = ?auto_268917 ?auto_268920 ) ) ( not ( = ?auto_268918 ?auto_268919 ) ) ( not ( = ?auto_268918 ?auto_268920 ) ) ( not ( = ?auto_268919 ?auto_268920 ) ) ( CLEAR ?auto_268917 ) ( ON ?auto_268918 ?auto_268919 ) ( CLEAR ?auto_268918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_268911 ?auto_268912 ?auto_268913 ?auto_268914 ?auto_268915 ?auto_268916 ?auto_268917 ?auto_268918 )
      ( MAKE-9PILE ?auto_268911 ?auto_268912 ?auto_268913 ?auto_268914 ?auto_268915 ?auto_268916 ?auto_268917 ?auto_268918 ?auto_268919 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268949 - BLOCK
      ?auto_268950 - BLOCK
      ?auto_268951 - BLOCK
      ?auto_268952 - BLOCK
      ?auto_268953 - BLOCK
      ?auto_268954 - BLOCK
      ?auto_268955 - BLOCK
      ?auto_268956 - BLOCK
      ?auto_268957 - BLOCK
    )
    :vars
    (
      ?auto_268958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268957 ?auto_268958 ) ( ON-TABLE ?auto_268949 ) ( ON ?auto_268950 ?auto_268949 ) ( ON ?auto_268951 ?auto_268950 ) ( ON ?auto_268952 ?auto_268951 ) ( ON ?auto_268953 ?auto_268952 ) ( ON ?auto_268954 ?auto_268953 ) ( not ( = ?auto_268949 ?auto_268950 ) ) ( not ( = ?auto_268949 ?auto_268951 ) ) ( not ( = ?auto_268949 ?auto_268952 ) ) ( not ( = ?auto_268949 ?auto_268953 ) ) ( not ( = ?auto_268949 ?auto_268954 ) ) ( not ( = ?auto_268949 ?auto_268955 ) ) ( not ( = ?auto_268949 ?auto_268956 ) ) ( not ( = ?auto_268949 ?auto_268957 ) ) ( not ( = ?auto_268949 ?auto_268958 ) ) ( not ( = ?auto_268950 ?auto_268951 ) ) ( not ( = ?auto_268950 ?auto_268952 ) ) ( not ( = ?auto_268950 ?auto_268953 ) ) ( not ( = ?auto_268950 ?auto_268954 ) ) ( not ( = ?auto_268950 ?auto_268955 ) ) ( not ( = ?auto_268950 ?auto_268956 ) ) ( not ( = ?auto_268950 ?auto_268957 ) ) ( not ( = ?auto_268950 ?auto_268958 ) ) ( not ( = ?auto_268951 ?auto_268952 ) ) ( not ( = ?auto_268951 ?auto_268953 ) ) ( not ( = ?auto_268951 ?auto_268954 ) ) ( not ( = ?auto_268951 ?auto_268955 ) ) ( not ( = ?auto_268951 ?auto_268956 ) ) ( not ( = ?auto_268951 ?auto_268957 ) ) ( not ( = ?auto_268951 ?auto_268958 ) ) ( not ( = ?auto_268952 ?auto_268953 ) ) ( not ( = ?auto_268952 ?auto_268954 ) ) ( not ( = ?auto_268952 ?auto_268955 ) ) ( not ( = ?auto_268952 ?auto_268956 ) ) ( not ( = ?auto_268952 ?auto_268957 ) ) ( not ( = ?auto_268952 ?auto_268958 ) ) ( not ( = ?auto_268953 ?auto_268954 ) ) ( not ( = ?auto_268953 ?auto_268955 ) ) ( not ( = ?auto_268953 ?auto_268956 ) ) ( not ( = ?auto_268953 ?auto_268957 ) ) ( not ( = ?auto_268953 ?auto_268958 ) ) ( not ( = ?auto_268954 ?auto_268955 ) ) ( not ( = ?auto_268954 ?auto_268956 ) ) ( not ( = ?auto_268954 ?auto_268957 ) ) ( not ( = ?auto_268954 ?auto_268958 ) ) ( not ( = ?auto_268955 ?auto_268956 ) ) ( not ( = ?auto_268955 ?auto_268957 ) ) ( not ( = ?auto_268955 ?auto_268958 ) ) ( not ( = ?auto_268956 ?auto_268957 ) ) ( not ( = ?auto_268956 ?auto_268958 ) ) ( not ( = ?auto_268957 ?auto_268958 ) ) ( ON ?auto_268956 ?auto_268957 ) ( CLEAR ?auto_268954 ) ( ON ?auto_268955 ?auto_268956 ) ( CLEAR ?auto_268955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268949 ?auto_268950 ?auto_268951 ?auto_268952 ?auto_268953 ?auto_268954 ?auto_268955 )
      ( MAKE-9PILE ?auto_268949 ?auto_268950 ?auto_268951 ?auto_268952 ?auto_268953 ?auto_268954 ?auto_268955 ?auto_268956 ?auto_268957 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268987 - BLOCK
      ?auto_268988 - BLOCK
      ?auto_268989 - BLOCK
      ?auto_268990 - BLOCK
      ?auto_268991 - BLOCK
      ?auto_268992 - BLOCK
      ?auto_268993 - BLOCK
      ?auto_268994 - BLOCK
      ?auto_268995 - BLOCK
    )
    :vars
    (
      ?auto_268996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268995 ?auto_268996 ) ( ON-TABLE ?auto_268987 ) ( ON ?auto_268988 ?auto_268987 ) ( ON ?auto_268989 ?auto_268988 ) ( ON ?auto_268990 ?auto_268989 ) ( ON ?auto_268991 ?auto_268990 ) ( not ( = ?auto_268987 ?auto_268988 ) ) ( not ( = ?auto_268987 ?auto_268989 ) ) ( not ( = ?auto_268987 ?auto_268990 ) ) ( not ( = ?auto_268987 ?auto_268991 ) ) ( not ( = ?auto_268987 ?auto_268992 ) ) ( not ( = ?auto_268987 ?auto_268993 ) ) ( not ( = ?auto_268987 ?auto_268994 ) ) ( not ( = ?auto_268987 ?auto_268995 ) ) ( not ( = ?auto_268987 ?auto_268996 ) ) ( not ( = ?auto_268988 ?auto_268989 ) ) ( not ( = ?auto_268988 ?auto_268990 ) ) ( not ( = ?auto_268988 ?auto_268991 ) ) ( not ( = ?auto_268988 ?auto_268992 ) ) ( not ( = ?auto_268988 ?auto_268993 ) ) ( not ( = ?auto_268988 ?auto_268994 ) ) ( not ( = ?auto_268988 ?auto_268995 ) ) ( not ( = ?auto_268988 ?auto_268996 ) ) ( not ( = ?auto_268989 ?auto_268990 ) ) ( not ( = ?auto_268989 ?auto_268991 ) ) ( not ( = ?auto_268989 ?auto_268992 ) ) ( not ( = ?auto_268989 ?auto_268993 ) ) ( not ( = ?auto_268989 ?auto_268994 ) ) ( not ( = ?auto_268989 ?auto_268995 ) ) ( not ( = ?auto_268989 ?auto_268996 ) ) ( not ( = ?auto_268990 ?auto_268991 ) ) ( not ( = ?auto_268990 ?auto_268992 ) ) ( not ( = ?auto_268990 ?auto_268993 ) ) ( not ( = ?auto_268990 ?auto_268994 ) ) ( not ( = ?auto_268990 ?auto_268995 ) ) ( not ( = ?auto_268990 ?auto_268996 ) ) ( not ( = ?auto_268991 ?auto_268992 ) ) ( not ( = ?auto_268991 ?auto_268993 ) ) ( not ( = ?auto_268991 ?auto_268994 ) ) ( not ( = ?auto_268991 ?auto_268995 ) ) ( not ( = ?auto_268991 ?auto_268996 ) ) ( not ( = ?auto_268992 ?auto_268993 ) ) ( not ( = ?auto_268992 ?auto_268994 ) ) ( not ( = ?auto_268992 ?auto_268995 ) ) ( not ( = ?auto_268992 ?auto_268996 ) ) ( not ( = ?auto_268993 ?auto_268994 ) ) ( not ( = ?auto_268993 ?auto_268995 ) ) ( not ( = ?auto_268993 ?auto_268996 ) ) ( not ( = ?auto_268994 ?auto_268995 ) ) ( not ( = ?auto_268994 ?auto_268996 ) ) ( not ( = ?auto_268995 ?auto_268996 ) ) ( ON ?auto_268994 ?auto_268995 ) ( ON ?auto_268993 ?auto_268994 ) ( CLEAR ?auto_268991 ) ( ON ?auto_268992 ?auto_268993 ) ( CLEAR ?auto_268992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268987 ?auto_268988 ?auto_268989 ?auto_268990 ?auto_268991 ?auto_268992 )
      ( MAKE-9PILE ?auto_268987 ?auto_268988 ?auto_268989 ?auto_268990 ?auto_268991 ?auto_268992 ?auto_268993 ?auto_268994 ?auto_268995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269025 - BLOCK
      ?auto_269026 - BLOCK
      ?auto_269027 - BLOCK
      ?auto_269028 - BLOCK
      ?auto_269029 - BLOCK
      ?auto_269030 - BLOCK
      ?auto_269031 - BLOCK
      ?auto_269032 - BLOCK
      ?auto_269033 - BLOCK
    )
    :vars
    (
      ?auto_269034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269033 ?auto_269034 ) ( ON-TABLE ?auto_269025 ) ( ON ?auto_269026 ?auto_269025 ) ( ON ?auto_269027 ?auto_269026 ) ( ON ?auto_269028 ?auto_269027 ) ( not ( = ?auto_269025 ?auto_269026 ) ) ( not ( = ?auto_269025 ?auto_269027 ) ) ( not ( = ?auto_269025 ?auto_269028 ) ) ( not ( = ?auto_269025 ?auto_269029 ) ) ( not ( = ?auto_269025 ?auto_269030 ) ) ( not ( = ?auto_269025 ?auto_269031 ) ) ( not ( = ?auto_269025 ?auto_269032 ) ) ( not ( = ?auto_269025 ?auto_269033 ) ) ( not ( = ?auto_269025 ?auto_269034 ) ) ( not ( = ?auto_269026 ?auto_269027 ) ) ( not ( = ?auto_269026 ?auto_269028 ) ) ( not ( = ?auto_269026 ?auto_269029 ) ) ( not ( = ?auto_269026 ?auto_269030 ) ) ( not ( = ?auto_269026 ?auto_269031 ) ) ( not ( = ?auto_269026 ?auto_269032 ) ) ( not ( = ?auto_269026 ?auto_269033 ) ) ( not ( = ?auto_269026 ?auto_269034 ) ) ( not ( = ?auto_269027 ?auto_269028 ) ) ( not ( = ?auto_269027 ?auto_269029 ) ) ( not ( = ?auto_269027 ?auto_269030 ) ) ( not ( = ?auto_269027 ?auto_269031 ) ) ( not ( = ?auto_269027 ?auto_269032 ) ) ( not ( = ?auto_269027 ?auto_269033 ) ) ( not ( = ?auto_269027 ?auto_269034 ) ) ( not ( = ?auto_269028 ?auto_269029 ) ) ( not ( = ?auto_269028 ?auto_269030 ) ) ( not ( = ?auto_269028 ?auto_269031 ) ) ( not ( = ?auto_269028 ?auto_269032 ) ) ( not ( = ?auto_269028 ?auto_269033 ) ) ( not ( = ?auto_269028 ?auto_269034 ) ) ( not ( = ?auto_269029 ?auto_269030 ) ) ( not ( = ?auto_269029 ?auto_269031 ) ) ( not ( = ?auto_269029 ?auto_269032 ) ) ( not ( = ?auto_269029 ?auto_269033 ) ) ( not ( = ?auto_269029 ?auto_269034 ) ) ( not ( = ?auto_269030 ?auto_269031 ) ) ( not ( = ?auto_269030 ?auto_269032 ) ) ( not ( = ?auto_269030 ?auto_269033 ) ) ( not ( = ?auto_269030 ?auto_269034 ) ) ( not ( = ?auto_269031 ?auto_269032 ) ) ( not ( = ?auto_269031 ?auto_269033 ) ) ( not ( = ?auto_269031 ?auto_269034 ) ) ( not ( = ?auto_269032 ?auto_269033 ) ) ( not ( = ?auto_269032 ?auto_269034 ) ) ( not ( = ?auto_269033 ?auto_269034 ) ) ( ON ?auto_269032 ?auto_269033 ) ( ON ?auto_269031 ?auto_269032 ) ( ON ?auto_269030 ?auto_269031 ) ( CLEAR ?auto_269028 ) ( ON ?auto_269029 ?auto_269030 ) ( CLEAR ?auto_269029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269025 ?auto_269026 ?auto_269027 ?auto_269028 ?auto_269029 )
      ( MAKE-9PILE ?auto_269025 ?auto_269026 ?auto_269027 ?auto_269028 ?auto_269029 ?auto_269030 ?auto_269031 ?auto_269032 ?auto_269033 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269063 - BLOCK
      ?auto_269064 - BLOCK
      ?auto_269065 - BLOCK
      ?auto_269066 - BLOCK
      ?auto_269067 - BLOCK
      ?auto_269068 - BLOCK
      ?auto_269069 - BLOCK
      ?auto_269070 - BLOCK
      ?auto_269071 - BLOCK
    )
    :vars
    (
      ?auto_269072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269071 ?auto_269072 ) ( ON-TABLE ?auto_269063 ) ( ON ?auto_269064 ?auto_269063 ) ( ON ?auto_269065 ?auto_269064 ) ( not ( = ?auto_269063 ?auto_269064 ) ) ( not ( = ?auto_269063 ?auto_269065 ) ) ( not ( = ?auto_269063 ?auto_269066 ) ) ( not ( = ?auto_269063 ?auto_269067 ) ) ( not ( = ?auto_269063 ?auto_269068 ) ) ( not ( = ?auto_269063 ?auto_269069 ) ) ( not ( = ?auto_269063 ?auto_269070 ) ) ( not ( = ?auto_269063 ?auto_269071 ) ) ( not ( = ?auto_269063 ?auto_269072 ) ) ( not ( = ?auto_269064 ?auto_269065 ) ) ( not ( = ?auto_269064 ?auto_269066 ) ) ( not ( = ?auto_269064 ?auto_269067 ) ) ( not ( = ?auto_269064 ?auto_269068 ) ) ( not ( = ?auto_269064 ?auto_269069 ) ) ( not ( = ?auto_269064 ?auto_269070 ) ) ( not ( = ?auto_269064 ?auto_269071 ) ) ( not ( = ?auto_269064 ?auto_269072 ) ) ( not ( = ?auto_269065 ?auto_269066 ) ) ( not ( = ?auto_269065 ?auto_269067 ) ) ( not ( = ?auto_269065 ?auto_269068 ) ) ( not ( = ?auto_269065 ?auto_269069 ) ) ( not ( = ?auto_269065 ?auto_269070 ) ) ( not ( = ?auto_269065 ?auto_269071 ) ) ( not ( = ?auto_269065 ?auto_269072 ) ) ( not ( = ?auto_269066 ?auto_269067 ) ) ( not ( = ?auto_269066 ?auto_269068 ) ) ( not ( = ?auto_269066 ?auto_269069 ) ) ( not ( = ?auto_269066 ?auto_269070 ) ) ( not ( = ?auto_269066 ?auto_269071 ) ) ( not ( = ?auto_269066 ?auto_269072 ) ) ( not ( = ?auto_269067 ?auto_269068 ) ) ( not ( = ?auto_269067 ?auto_269069 ) ) ( not ( = ?auto_269067 ?auto_269070 ) ) ( not ( = ?auto_269067 ?auto_269071 ) ) ( not ( = ?auto_269067 ?auto_269072 ) ) ( not ( = ?auto_269068 ?auto_269069 ) ) ( not ( = ?auto_269068 ?auto_269070 ) ) ( not ( = ?auto_269068 ?auto_269071 ) ) ( not ( = ?auto_269068 ?auto_269072 ) ) ( not ( = ?auto_269069 ?auto_269070 ) ) ( not ( = ?auto_269069 ?auto_269071 ) ) ( not ( = ?auto_269069 ?auto_269072 ) ) ( not ( = ?auto_269070 ?auto_269071 ) ) ( not ( = ?auto_269070 ?auto_269072 ) ) ( not ( = ?auto_269071 ?auto_269072 ) ) ( ON ?auto_269070 ?auto_269071 ) ( ON ?auto_269069 ?auto_269070 ) ( ON ?auto_269068 ?auto_269069 ) ( ON ?auto_269067 ?auto_269068 ) ( CLEAR ?auto_269065 ) ( ON ?auto_269066 ?auto_269067 ) ( CLEAR ?auto_269066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269063 ?auto_269064 ?auto_269065 ?auto_269066 )
      ( MAKE-9PILE ?auto_269063 ?auto_269064 ?auto_269065 ?auto_269066 ?auto_269067 ?auto_269068 ?auto_269069 ?auto_269070 ?auto_269071 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269101 - BLOCK
      ?auto_269102 - BLOCK
      ?auto_269103 - BLOCK
      ?auto_269104 - BLOCK
      ?auto_269105 - BLOCK
      ?auto_269106 - BLOCK
      ?auto_269107 - BLOCK
      ?auto_269108 - BLOCK
      ?auto_269109 - BLOCK
    )
    :vars
    (
      ?auto_269110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269109 ?auto_269110 ) ( ON-TABLE ?auto_269101 ) ( ON ?auto_269102 ?auto_269101 ) ( not ( = ?auto_269101 ?auto_269102 ) ) ( not ( = ?auto_269101 ?auto_269103 ) ) ( not ( = ?auto_269101 ?auto_269104 ) ) ( not ( = ?auto_269101 ?auto_269105 ) ) ( not ( = ?auto_269101 ?auto_269106 ) ) ( not ( = ?auto_269101 ?auto_269107 ) ) ( not ( = ?auto_269101 ?auto_269108 ) ) ( not ( = ?auto_269101 ?auto_269109 ) ) ( not ( = ?auto_269101 ?auto_269110 ) ) ( not ( = ?auto_269102 ?auto_269103 ) ) ( not ( = ?auto_269102 ?auto_269104 ) ) ( not ( = ?auto_269102 ?auto_269105 ) ) ( not ( = ?auto_269102 ?auto_269106 ) ) ( not ( = ?auto_269102 ?auto_269107 ) ) ( not ( = ?auto_269102 ?auto_269108 ) ) ( not ( = ?auto_269102 ?auto_269109 ) ) ( not ( = ?auto_269102 ?auto_269110 ) ) ( not ( = ?auto_269103 ?auto_269104 ) ) ( not ( = ?auto_269103 ?auto_269105 ) ) ( not ( = ?auto_269103 ?auto_269106 ) ) ( not ( = ?auto_269103 ?auto_269107 ) ) ( not ( = ?auto_269103 ?auto_269108 ) ) ( not ( = ?auto_269103 ?auto_269109 ) ) ( not ( = ?auto_269103 ?auto_269110 ) ) ( not ( = ?auto_269104 ?auto_269105 ) ) ( not ( = ?auto_269104 ?auto_269106 ) ) ( not ( = ?auto_269104 ?auto_269107 ) ) ( not ( = ?auto_269104 ?auto_269108 ) ) ( not ( = ?auto_269104 ?auto_269109 ) ) ( not ( = ?auto_269104 ?auto_269110 ) ) ( not ( = ?auto_269105 ?auto_269106 ) ) ( not ( = ?auto_269105 ?auto_269107 ) ) ( not ( = ?auto_269105 ?auto_269108 ) ) ( not ( = ?auto_269105 ?auto_269109 ) ) ( not ( = ?auto_269105 ?auto_269110 ) ) ( not ( = ?auto_269106 ?auto_269107 ) ) ( not ( = ?auto_269106 ?auto_269108 ) ) ( not ( = ?auto_269106 ?auto_269109 ) ) ( not ( = ?auto_269106 ?auto_269110 ) ) ( not ( = ?auto_269107 ?auto_269108 ) ) ( not ( = ?auto_269107 ?auto_269109 ) ) ( not ( = ?auto_269107 ?auto_269110 ) ) ( not ( = ?auto_269108 ?auto_269109 ) ) ( not ( = ?auto_269108 ?auto_269110 ) ) ( not ( = ?auto_269109 ?auto_269110 ) ) ( ON ?auto_269108 ?auto_269109 ) ( ON ?auto_269107 ?auto_269108 ) ( ON ?auto_269106 ?auto_269107 ) ( ON ?auto_269105 ?auto_269106 ) ( ON ?auto_269104 ?auto_269105 ) ( CLEAR ?auto_269102 ) ( ON ?auto_269103 ?auto_269104 ) ( CLEAR ?auto_269103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269101 ?auto_269102 ?auto_269103 )
      ( MAKE-9PILE ?auto_269101 ?auto_269102 ?auto_269103 ?auto_269104 ?auto_269105 ?auto_269106 ?auto_269107 ?auto_269108 ?auto_269109 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269139 - BLOCK
      ?auto_269140 - BLOCK
      ?auto_269141 - BLOCK
      ?auto_269142 - BLOCK
      ?auto_269143 - BLOCK
      ?auto_269144 - BLOCK
      ?auto_269145 - BLOCK
      ?auto_269146 - BLOCK
      ?auto_269147 - BLOCK
    )
    :vars
    (
      ?auto_269148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269147 ?auto_269148 ) ( ON-TABLE ?auto_269139 ) ( not ( = ?auto_269139 ?auto_269140 ) ) ( not ( = ?auto_269139 ?auto_269141 ) ) ( not ( = ?auto_269139 ?auto_269142 ) ) ( not ( = ?auto_269139 ?auto_269143 ) ) ( not ( = ?auto_269139 ?auto_269144 ) ) ( not ( = ?auto_269139 ?auto_269145 ) ) ( not ( = ?auto_269139 ?auto_269146 ) ) ( not ( = ?auto_269139 ?auto_269147 ) ) ( not ( = ?auto_269139 ?auto_269148 ) ) ( not ( = ?auto_269140 ?auto_269141 ) ) ( not ( = ?auto_269140 ?auto_269142 ) ) ( not ( = ?auto_269140 ?auto_269143 ) ) ( not ( = ?auto_269140 ?auto_269144 ) ) ( not ( = ?auto_269140 ?auto_269145 ) ) ( not ( = ?auto_269140 ?auto_269146 ) ) ( not ( = ?auto_269140 ?auto_269147 ) ) ( not ( = ?auto_269140 ?auto_269148 ) ) ( not ( = ?auto_269141 ?auto_269142 ) ) ( not ( = ?auto_269141 ?auto_269143 ) ) ( not ( = ?auto_269141 ?auto_269144 ) ) ( not ( = ?auto_269141 ?auto_269145 ) ) ( not ( = ?auto_269141 ?auto_269146 ) ) ( not ( = ?auto_269141 ?auto_269147 ) ) ( not ( = ?auto_269141 ?auto_269148 ) ) ( not ( = ?auto_269142 ?auto_269143 ) ) ( not ( = ?auto_269142 ?auto_269144 ) ) ( not ( = ?auto_269142 ?auto_269145 ) ) ( not ( = ?auto_269142 ?auto_269146 ) ) ( not ( = ?auto_269142 ?auto_269147 ) ) ( not ( = ?auto_269142 ?auto_269148 ) ) ( not ( = ?auto_269143 ?auto_269144 ) ) ( not ( = ?auto_269143 ?auto_269145 ) ) ( not ( = ?auto_269143 ?auto_269146 ) ) ( not ( = ?auto_269143 ?auto_269147 ) ) ( not ( = ?auto_269143 ?auto_269148 ) ) ( not ( = ?auto_269144 ?auto_269145 ) ) ( not ( = ?auto_269144 ?auto_269146 ) ) ( not ( = ?auto_269144 ?auto_269147 ) ) ( not ( = ?auto_269144 ?auto_269148 ) ) ( not ( = ?auto_269145 ?auto_269146 ) ) ( not ( = ?auto_269145 ?auto_269147 ) ) ( not ( = ?auto_269145 ?auto_269148 ) ) ( not ( = ?auto_269146 ?auto_269147 ) ) ( not ( = ?auto_269146 ?auto_269148 ) ) ( not ( = ?auto_269147 ?auto_269148 ) ) ( ON ?auto_269146 ?auto_269147 ) ( ON ?auto_269145 ?auto_269146 ) ( ON ?auto_269144 ?auto_269145 ) ( ON ?auto_269143 ?auto_269144 ) ( ON ?auto_269142 ?auto_269143 ) ( ON ?auto_269141 ?auto_269142 ) ( CLEAR ?auto_269139 ) ( ON ?auto_269140 ?auto_269141 ) ( CLEAR ?auto_269140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269139 ?auto_269140 )
      ( MAKE-9PILE ?auto_269139 ?auto_269140 ?auto_269141 ?auto_269142 ?auto_269143 ?auto_269144 ?auto_269145 ?auto_269146 ?auto_269147 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269177 - BLOCK
      ?auto_269178 - BLOCK
      ?auto_269179 - BLOCK
      ?auto_269180 - BLOCK
      ?auto_269181 - BLOCK
      ?auto_269182 - BLOCK
      ?auto_269183 - BLOCK
      ?auto_269184 - BLOCK
      ?auto_269185 - BLOCK
    )
    :vars
    (
      ?auto_269186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269185 ?auto_269186 ) ( not ( = ?auto_269177 ?auto_269178 ) ) ( not ( = ?auto_269177 ?auto_269179 ) ) ( not ( = ?auto_269177 ?auto_269180 ) ) ( not ( = ?auto_269177 ?auto_269181 ) ) ( not ( = ?auto_269177 ?auto_269182 ) ) ( not ( = ?auto_269177 ?auto_269183 ) ) ( not ( = ?auto_269177 ?auto_269184 ) ) ( not ( = ?auto_269177 ?auto_269185 ) ) ( not ( = ?auto_269177 ?auto_269186 ) ) ( not ( = ?auto_269178 ?auto_269179 ) ) ( not ( = ?auto_269178 ?auto_269180 ) ) ( not ( = ?auto_269178 ?auto_269181 ) ) ( not ( = ?auto_269178 ?auto_269182 ) ) ( not ( = ?auto_269178 ?auto_269183 ) ) ( not ( = ?auto_269178 ?auto_269184 ) ) ( not ( = ?auto_269178 ?auto_269185 ) ) ( not ( = ?auto_269178 ?auto_269186 ) ) ( not ( = ?auto_269179 ?auto_269180 ) ) ( not ( = ?auto_269179 ?auto_269181 ) ) ( not ( = ?auto_269179 ?auto_269182 ) ) ( not ( = ?auto_269179 ?auto_269183 ) ) ( not ( = ?auto_269179 ?auto_269184 ) ) ( not ( = ?auto_269179 ?auto_269185 ) ) ( not ( = ?auto_269179 ?auto_269186 ) ) ( not ( = ?auto_269180 ?auto_269181 ) ) ( not ( = ?auto_269180 ?auto_269182 ) ) ( not ( = ?auto_269180 ?auto_269183 ) ) ( not ( = ?auto_269180 ?auto_269184 ) ) ( not ( = ?auto_269180 ?auto_269185 ) ) ( not ( = ?auto_269180 ?auto_269186 ) ) ( not ( = ?auto_269181 ?auto_269182 ) ) ( not ( = ?auto_269181 ?auto_269183 ) ) ( not ( = ?auto_269181 ?auto_269184 ) ) ( not ( = ?auto_269181 ?auto_269185 ) ) ( not ( = ?auto_269181 ?auto_269186 ) ) ( not ( = ?auto_269182 ?auto_269183 ) ) ( not ( = ?auto_269182 ?auto_269184 ) ) ( not ( = ?auto_269182 ?auto_269185 ) ) ( not ( = ?auto_269182 ?auto_269186 ) ) ( not ( = ?auto_269183 ?auto_269184 ) ) ( not ( = ?auto_269183 ?auto_269185 ) ) ( not ( = ?auto_269183 ?auto_269186 ) ) ( not ( = ?auto_269184 ?auto_269185 ) ) ( not ( = ?auto_269184 ?auto_269186 ) ) ( not ( = ?auto_269185 ?auto_269186 ) ) ( ON ?auto_269184 ?auto_269185 ) ( ON ?auto_269183 ?auto_269184 ) ( ON ?auto_269182 ?auto_269183 ) ( ON ?auto_269181 ?auto_269182 ) ( ON ?auto_269180 ?auto_269181 ) ( ON ?auto_269179 ?auto_269180 ) ( ON ?auto_269178 ?auto_269179 ) ( ON ?auto_269177 ?auto_269178 ) ( CLEAR ?auto_269177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269177 )
      ( MAKE-9PILE ?auto_269177 ?auto_269178 ?auto_269179 ?auto_269180 ?auto_269181 ?auto_269182 ?auto_269183 ?auto_269184 ?auto_269185 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269216 - BLOCK
      ?auto_269217 - BLOCK
      ?auto_269218 - BLOCK
      ?auto_269219 - BLOCK
      ?auto_269220 - BLOCK
      ?auto_269221 - BLOCK
      ?auto_269222 - BLOCK
      ?auto_269223 - BLOCK
      ?auto_269224 - BLOCK
      ?auto_269225 - BLOCK
    )
    :vars
    (
      ?auto_269226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269224 ) ( ON ?auto_269225 ?auto_269226 ) ( CLEAR ?auto_269225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269216 ) ( ON ?auto_269217 ?auto_269216 ) ( ON ?auto_269218 ?auto_269217 ) ( ON ?auto_269219 ?auto_269218 ) ( ON ?auto_269220 ?auto_269219 ) ( ON ?auto_269221 ?auto_269220 ) ( ON ?auto_269222 ?auto_269221 ) ( ON ?auto_269223 ?auto_269222 ) ( ON ?auto_269224 ?auto_269223 ) ( not ( = ?auto_269216 ?auto_269217 ) ) ( not ( = ?auto_269216 ?auto_269218 ) ) ( not ( = ?auto_269216 ?auto_269219 ) ) ( not ( = ?auto_269216 ?auto_269220 ) ) ( not ( = ?auto_269216 ?auto_269221 ) ) ( not ( = ?auto_269216 ?auto_269222 ) ) ( not ( = ?auto_269216 ?auto_269223 ) ) ( not ( = ?auto_269216 ?auto_269224 ) ) ( not ( = ?auto_269216 ?auto_269225 ) ) ( not ( = ?auto_269216 ?auto_269226 ) ) ( not ( = ?auto_269217 ?auto_269218 ) ) ( not ( = ?auto_269217 ?auto_269219 ) ) ( not ( = ?auto_269217 ?auto_269220 ) ) ( not ( = ?auto_269217 ?auto_269221 ) ) ( not ( = ?auto_269217 ?auto_269222 ) ) ( not ( = ?auto_269217 ?auto_269223 ) ) ( not ( = ?auto_269217 ?auto_269224 ) ) ( not ( = ?auto_269217 ?auto_269225 ) ) ( not ( = ?auto_269217 ?auto_269226 ) ) ( not ( = ?auto_269218 ?auto_269219 ) ) ( not ( = ?auto_269218 ?auto_269220 ) ) ( not ( = ?auto_269218 ?auto_269221 ) ) ( not ( = ?auto_269218 ?auto_269222 ) ) ( not ( = ?auto_269218 ?auto_269223 ) ) ( not ( = ?auto_269218 ?auto_269224 ) ) ( not ( = ?auto_269218 ?auto_269225 ) ) ( not ( = ?auto_269218 ?auto_269226 ) ) ( not ( = ?auto_269219 ?auto_269220 ) ) ( not ( = ?auto_269219 ?auto_269221 ) ) ( not ( = ?auto_269219 ?auto_269222 ) ) ( not ( = ?auto_269219 ?auto_269223 ) ) ( not ( = ?auto_269219 ?auto_269224 ) ) ( not ( = ?auto_269219 ?auto_269225 ) ) ( not ( = ?auto_269219 ?auto_269226 ) ) ( not ( = ?auto_269220 ?auto_269221 ) ) ( not ( = ?auto_269220 ?auto_269222 ) ) ( not ( = ?auto_269220 ?auto_269223 ) ) ( not ( = ?auto_269220 ?auto_269224 ) ) ( not ( = ?auto_269220 ?auto_269225 ) ) ( not ( = ?auto_269220 ?auto_269226 ) ) ( not ( = ?auto_269221 ?auto_269222 ) ) ( not ( = ?auto_269221 ?auto_269223 ) ) ( not ( = ?auto_269221 ?auto_269224 ) ) ( not ( = ?auto_269221 ?auto_269225 ) ) ( not ( = ?auto_269221 ?auto_269226 ) ) ( not ( = ?auto_269222 ?auto_269223 ) ) ( not ( = ?auto_269222 ?auto_269224 ) ) ( not ( = ?auto_269222 ?auto_269225 ) ) ( not ( = ?auto_269222 ?auto_269226 ) ) ( not ( = ?auto_269223 ?auto_269224 ) ) ( not ( = ?auto_269223 ?auto_269225 ) ) ( not ( = ?auto_269223 ?auto_269226 ) ) ( not ( = ?auto_269224 ?auto_269225 ) ) ( not ( = ?auto_269224 ?auto_269226 ) ) ( not ( = ?auto_269225 ?auto_269226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269225 ?auto_269226 )
      ( !STACK ?auto_269225 ?auto_269224 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269258 - BLOCK
      ?auto_269259 - BLOCK
      ?auto_269260 - BLOCK
      ?auto_269261 - BLOCK
      ?auto_269262 - BLOCK
      ?auto_269263 - BLOCK
      ?auto_269264 - BLOCK
      ?auto_269265 - BLOCK
      ?auto_269266 - BLOCK
      ?auto_269267 - BLOCK
    )
    :vars
    (
      ?auto_269268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269267 ?auto_269268 ) ( ON-TABLE ?auto_269258 ) ( ON ?auto_269259 ?auto_269258 ) ( ON ?auto_269260 ?auto_269259 ) ( ON ?auto_269261 ?auto_269260 ) ( ON ?auto_269262 ?auto_269261 ) ( ON ?auto_269263 ?auto_269262 ) ( ON ?auto_269264 ?auto_269263 ) ( ON ?auto_269265 ?auto_269264 ) ( not ( = ?auto_269258 ?auto_269259 ) ) ( not ( = ?auto_269258 ?auto_269260 ) ) ( not ( = ?auto_269258 ?auto_269261 ) ) ( not ( = ?auto_269258 ?auto_269262 ) ) ( not ( = ?auto_269258 ?auto_269263 ) ) ( not ( = ?auto_269258 ?auto_269264 ) ) ( not ( = ?auto_269258 ?auto_269265 ) ) ( not ( = ?auto_269258 ?auto_269266 ) ) ( not ( = ?auto_269258 ?auto_269267 ) ) ( not ( = ?auto_269258 ?auto_269268 ) ) ( not ( = ?auto_269259 ?auto_269260 ) ) ( not ( = ?auto_269259 ?auto_269261 ) ) ( not ( = ?auto_269259 ?auto_269262 ) ) ( not ( = ?auto_269259 ?auto_269263 ) ) ( not ( = ?auto_269259 ?auto_269264 ) ) ( not ( = ?auto_269259 ?auto_269265 ) ) ( not ( = ?auto_269259 ?auto_269266 ) ) ( not ( = ?auto_269259 ?auto_269267 ) ) ( not ( = ?auto_269259 ?auto_269268 ) ) ( not ( = ?auto_269260 ?auto_269261 ) ) ( not ( = ?auto_269260 ?auto_269262 ) ) ( not ( = ?auto_269260 ?auto_269263 ) ) ( not ( = ?auto_269260 ?auto_269264 ) ) ( not ( = ?auto_269260 ?auto_269265 ) ) ( not ( = ?auto_269260 ?auto_269266 ) ) ( not ( = ?auto_269260 ?auto_269267 ) ) ( not ( = ?auto_269260 ?auto_269268 ) ) ( not ( = ?auto_269261 ?auto_269262 ) ) ( not ( = ?auto_269261 ?auto_269263 ) ) ( not ( = ?auto_269261 ?auto_269264 ) ) ( not ( = ?auto_269261 ?auto_269265 ) ) ( not ( = ?auto_269261 ?auto_269266 ) ) ( not ( = ?auto_269261 ?auto_269267 ) ) ( not ( = ?auto_269261 ?auto_269268 ) ) ( not ( = ?auto_269262 ?auto_269263 ) ) ( not ( = ?auto_269262 ?auto_269264 ) ) ( not ( = ?auto_269262 ?auto_269265 ) ) ( not ( = ?auto_269262 ?auto_269266 ) ) ( not ( = ?auto_269262 ?auto_269267 ) ) ( not ( = ?auto_269262 ?auto_269268 ) ) ( not ( = ?auto_269263 ?auto_269264 ) ) ( not ( = ?auto_269263 ?auto_269265 ) ) ( not ( = ?auto_269263 ?auto_269266 ) ) ( not ( = ?auto_269263 ?auto_269267 ) ) ( not ( = ?auto_269263 ?auto_269268 ) ) ( not ( = ?auto_269264 ?auto_269265 ) ) ( not ( = ?auto_269264 ?auto_269266 ) ) ( not ( = ?auto_269264 ?auto_269267 ) ) ( not ( = ?auto_269264 ?auto_269268 ) ) ( not ( = ?auto_269265 ?auto_269266 ) ) ( not ( = ?auto_269265 ?auto_269267 ) ) ( not ( = ?auto_269265 ?auto_269268 ) ) ( not ( = ?auto_269266 ?auto_269267 ) ) ( not ( = ?auto_269266 ?auto_269268 ) ) ( not ( = ?auto_269267 ?auto_269268 ) ) ( CLEAR ?auto_269265 ) ( ON ?auto_269266 ?auto_269267 ) ( CLEAR ?auto_269266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269258 ?auto_269259 ?auto_269260 ?auto_269261 ?auto_269262 ?auto_269263 ?auto_269264 ?auto_269265 ?auto_269266 )
      ( MAKE-10PILE ?auto_269258 ?auto_269259 ?auto_269260 ?auto_269261 ?auto_269262 ?auto_269263 ?auto_269264 ?auto_269265 ?auto_269266 ?auto_269267 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269300 - BLOCK
      ?auto_269301 - BLOCK
      ?auto_269302 - BLOCK
      ?auto_269303 - BLOCK
      ?auto_269304 - BLOCK
      ?auto_269305 - BLOCK
      ?auto_269306 - BLOCK
      ?auto_269307 - BLOCK
      ?auto_269308 - BLOCK
      ?auto_269309 - BLOCK
    )
    :vars
    (
      ?auto_269310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269309 ?auto_269310 ) ( ON-TABLE ?auto_269300 ) ( ON ?auto_269301 ?auto_269300 ) ( ON ?auto_269302 ?auto_269301 ) ( ON ?auto_269303 ?auto_269302 ) ( ON ?auto_269304 ?auto_269303 ) ( ON ?auto_269305 ?auto_269304 ) ( ON ?auto_269306 ?auto_269305 ) ( not ( = ?auto_269300 ?auto_269301 ) ) ( not ( = ?auto_269300 ?auto_269302 ) ) ( not ( = ?auto_269300 ?auto_269303 ) ) ( not ( = ?auto_269300 ?auto_269304 ) ) ( not ( = ?auto_269300 ?auto_269305 ) ) ( not ( = ?auto_269300 ?auto_269306 ) ) ( not ( = ?auto_269300 ?auto_269307 ) ) ( not ( = ?auto_269300 ?auto_269308 ) ) ( not ( = ?auto_269300 ?auto_269309 ) ) ( not ( = ?auto_269300 ?auto_269310 ) ) ( not ( = ?auto_269301 ?auto_269302 ) ) ( not ( = ?auto_269301 ?auto_269303 ) ) ( not ( = ?auto_269301 ?auto_269304 ) ) ( not ( = ?auto_269301 ?auto_269305 ) ) ( not ( = ?auto_269301 ?auto_269306 ) ) ( not ( = ?auto_269301 ?auto_269307 ) ) ( not ( = ?auto_269301 ?auto_269308 ) ) ( not ( = ?auto_269301 ?auto_269309 ) ) ( not ( = ?auto_269301 ?auto_269310 ) ) ( not ( = ?auto_269302 ?auto_269303 ) ) ( not ( = ?auto_269302 ?auto_269304 ) ) ( not ( = ?auto_269302 ?auto_269305 ) ) ( not ( = ?auto_269302 ?auto_269306 ) ) ( not ( = ?auto_269302 ?auto_269307 ) ) ( not ( = ?auto_269302 ?auto_269308 ) ) ( not ( = ?auto_269302 ?auto_269309 ) ) ( not ( = ?auto_269302 ?auto_269310 ) ) ( not ( = ?auto_269303 ?auto_269304 ) ) ( not ( = ?auto_269303 ?auto_269305 ) ) ( not ( = ?auto_269303 ?auto_269306 ) ) ( not ( = ?auto_269303 ?auto_269307 ) ) ( not ( = ?auto_269303 ?auto_269308 ) ) ( not ( = ?auto_269303 ?auto_269309 ) ) ( not ( = ?auto_269303 ?auto_269310 ) ) ( not ( = ?auto_269304 ?auto_269305 ) ) ( not ( = ?auto_269304 ?auto_269306 ) ) ( not ( = ?auto_269304 ?auto_269307 ) ) ( not ( = ?auto_269304 ?auto_269308 ) ) ( not ( = ?auto_269304 ?auto_269309 ) ) ( not ( = ?auto_269304 ?auto_269310 ) ) ( not ( = ?auto_269305 ?auto_269306 ) ) ( not ( = ?auto_269305 ?auto_269307 ) ) ( not ( = ?auto_269305 ?auto_269308 ) ) ( not ( = ?auto_269305 ?auto_269309 ) ) ( not ( = ?auto_269305 ?auto_269310 ) ) ( not ( = ?auto_269306 ?auto_269307 ) ) ( not ( = ?auto_269306 ?auto_269308 ) ) ( not ( = ?auto_269306 ?auto_269309 ) ) ( not ( = ?auto_269306 ?auto_269310 ) ) ( not ( = ?auto_269307 ?auto_269308 ) ) ( not ( = ?auto_269307 ?auto_269309 ) ) ( not ( = ?auto_269307 ?auto_269310 ) ) ( not ( = ?auto_269308 ?auto_269309 ) ) ( not ( = ?auto_269308 ?auto_269310 ) ) ( not ( = ?auto_269309 ?auto_269310 ) ) ( ON ?auto_269308 ?auto_269309 ) ( CLEAR ?auto_269306 ) ( ON ?auto_269307 ?auto_269308 ) ( CLEAR ?auto_269307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269300 ?auto_269301 ?auto_269302 ?auto_269303 ?auto_269304 ?auto_269305 ?auto_269306 ?auto_269307 )
      ( MAKE-10PILE ?auto_269300 ?auto_269301 ?auto_269302 ?auto_269303 ?auto_269304 ?auto_269305 ?auto_269306 ?auto_269307 ?auto_269308 ?auto_269309 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269342 - BLOCK
      ?auto_269343 - BLOCK
      ?auto_269344 - BLOCK
      ?auto_269345 - BLOCK
      ?auto_269346 - BLOCK
      ?auto_269347 - BLOCK
      ?auto_269348 - BLOCK
      ?auto_269349 - BLOCK
      ?auto_269350 - BLOCK
      ?auto_269351 - BLOCK
    )
    :vars
    (
      ?auto_269352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269351 ?auto_269352 ) ( ON-TABLE ?auto_269342 ) ( ON ?auto_269343 ?auto_269342 ) ( ON ?auto_269344 ?auto_269343 ) ( ON ?auto_269345 ?auto_269344 ) ( ON ?auto_269346 ?auto_269345 ) ( ON ?auto_269347 ?auto_269346 ) ( not ( = ?auto_269342 ?auto_269343 ) ) ( not ( = ?auto_269342 ?auto_269344 ) ) ( not ( = ?auto_269342 ?auto_269345 ) ) ( not ( = ?auto_269342 ?auto_269346 ) ) ( not ( = ?auto_269342 ?auto_269347 ) ) ( not ( = ?auto_269342 ?auto_269348 ) ) ( not ( = ?auto_269342 ?auto_269349 ) ) ( not ( = ?auto_269342 ?auto_269350 ) ) ( not ( = ?auto_269342 ?auto_269351 ) ) ( not ( = ?auto_269342 ?auto_269352 ) ) ( not ( = ?auto_269343 ?auto_269344 ) ) ( not ( = ?auto_269343 ?auto_269345 ) ) ( not ( = ?auto_269343 ?auto_269346 ) ) ( not ( = ?auto_269343 ?auto_269347 ) ) ( not ( = ?auto_269343 ?auto_269348 ) ) ( not ( = ?auto_269343 ?auto_269349 ) ) ( not ( = ?auto_269343 ?auto_269350 ) ) ( not ( = ?auto_269343 ?auto_269351 ) ) ( not ( = ?auto_269343 ?auto_269352 ) ) ( not ( = ?auto_269344 ?auto_269345 ) ) ( not ( = ?auto_269344 ?auto_269346 ) ) ( not ( = ?auto_269344 ?auto_269347 ) ) ( not ( = ?auto_269344 ?auto_269348 ) ) ( not ( = ?auto_269344 ?auto_269349 ) ) ( not ( = ?auto_269344 ?auto_269350 ) ) ( not ( = ?auto_269344 ?auto_269351 ) ) ( not ( = ?auto_269344 ?auto_269352 ) ) ( not ( = ?auto_269345 ?auto_269346 ) ) ( not ( = ?auto_269345 ?auto_269347 ) ) ( not ( = ?auto_269345 ?auto_269348 ) ) ( not ( = ?auto_269345 ?auto_269349 ) ) ( not ( = ?auto_269345 ?auto_269350 ) ) ( not ( = ?auto_269345 ?auto_269351 ) ) ( not ( = ?auto_269345 ?auto_269352 ) ) ( not ( = ?auto_269346 ?auto_269347 ) ) ( not ( = ?auto_269346 ?auto_269348 ) ) ( not ( = ?auto_269346 ?auto_269349 ) ) ( not ( = ?auto_269346 ?auto_269350 ) ) ( not ( = ?auto_269346 ?auto_269351 ) ) ( not ( = ?auto_269346 ?auto_269352 ) ) ( not ( = ?auto_269347 ?auto_269348 ) ) ( not ( = ?auto_269347 ?auto_269349 ) ) ( not ( = ?auto_269347 ?auto_269350 ) ) ( not ( = ?auto_269347 ?auto_269351 ) ) ( not ( = ?auto_269347 ?auto_269352 ) ) ( not ( = ?auto_269348 ?auto_269349 ) ) ( not ( = ?auto_269348 ?auto_269350 ) ) ( not ( = ?auto_269348 ?auto_269351 ) ) ( not ( = ?auto_269348 ?auto_269352 ) ) ( not ( = ?auto_269349 ?auto_269350 ) ) ( not ( = ?auto_269349 ?auto_269351 ) ) ( not ( = ?auto_269349 ?auto_269352 ) ) ( not ( = ?auto_269350 ?auto_269351 ) ) ( not ( = ?auto_269350 ?auto_269352 ) ) ( not ( = ?auto_269351 ?auto_269352 ) ) ( ON ?auto_269350 ?auto_269351 ) ( ON ?auto_269349 ?auto_269350 ) ( CLEAR ?auto_269347 ) ( ON ?auto_269348 ?auto_269349 ) ( CLEAR ?auto_269348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269342 ?auto_269343 ?auto_269344 ?auto_269345 ?auto_269346 ?auto_269347 ?auto_269348 )
      ( MAKE-10PILE ?auto_269342 ?auto_269343 ?auto_269344 ?auto_269345 ?auto_269346 ?auto_269347 ?auto_269348 ?auto_269349 ?auto_269350 ?auto_269351 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269384 - BLOCK
      ?auto_269385 - BLOCK
      ?auto_269386 - BLOCK
      ?auto_269387 - BLOCK
      ?auto_269388 - BLOCK
      ?auto_269389 - BLOCK
      ?auto_269390 - BLOCK
      ?auto_269391 - BLOCK
      ?auto_269392 - BLOCK
      ?auto_269393 - BLOCK
    )
    :vars
    (
      ?auto_269394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269393 ?auto_269394 ) ( ON-TABLE ?auto_269384 ) ( ON ?auto_269385 ?auto_269384 ) ( ON ?auto_269386 ?auto_269385 ) ( ON ?auto_269387 ?auto_269386 ) ( ON ?auto_269388 ?auto_269387 ) ( not ( = ?auto_269384 ?auto_269385 ) ) ( not ( = ?auto_269384 ?auto_269386 ) ) ( not ( = ?auto_269384 ?auto_269387 ) ) ( not ( = ?auto_269384 ?auto_269388 ) ) ( not ( = ?auto_269384 ?auto_269389 ) ) ( not ( = ?auto_269384 ?auto_269390 ) ) ( not ( = ?auto_269384 ?auto_269391 ) ) ( not ( = ?auto_269384 ?auto_269392 ) ) ( not ( = ?auto_269384 ?auto_269393 ) ) ( not ( = ?auto_269384 ?auto_269394 ) ) ( not ( = ?auto_269385 ?auto_269386 ) ) ( not ( = ?auto_269385 ?auto_269387 ) ) ( not ( = ?auto_269385 ?auto_269388 ) ) ( not ( = ?auto_269385 ?auto_269389 ) ) ( not ( = ?auto_269385 ?auto_269390 ) ) ( not ( = ?auto_269385 ?auto_269391 ) ) ( not ( = ?auto_269385 ?auto_269392 ) ) ( not ( = ?auto_269385 ?auto_269393 ) ) ( not ( = ?auto_269385 ?auto_269394 ) ) ( not ( = ?auto_269386 ?auto_269387 ) ) ( not ( = ?auto_269386 ?auto_269388 ) ) ( not ( = ?auto_269386 ?auto_269389 ) ) ( not ( = ?auto_269386 ?auto_269390 ) ) ( not ( = ?auto_269386 ?auto_269391 ) ) ( not ( = ?auto_269386 ?auto_269392 ) ) ( not ( = ?auto_269386 ?auto_269393 ) ) ( not ( = ?auto_269386 ?auto_269394 ) ) ( not ( = ?auto_269387 ?auto_269388 ) ) ( not ( = ?auto_269387 ?auto_269389 ) ) ( not ( = ?auto_269387 ?auto_269390 ) ) ( not ( = ?auto_269387 ?auto_269391 ) ) ( not ( = ?auto_269387 ?auto_269392 ) ) ( not ( = ?auto_269387 ?auto_269393 ) ) ( not ( = ?auto_269387 ?auto_269394 ) ) ( not ( = ?auto_269388 ?auto_269389 ) ) ( not ( = ?auto_269388 ?auto_269390 ) ) ( not ( = ?auto_269388 ?auto_269391 ) ) ( not ( = ?auto_269388 ?auto_269392 ) ) ( not ( = ?auto_269388 ?auto_269393 ) ) ( not ( = ?auto_269388 ?auto_269394 ) ) ( not ( = ?auto_269389 ?auto_269390 ) ) ( not ( = ?auto_269389 ?auto_269391 ) ) ( not ( = ?auto_269389 ?auto_269392 ) ) ( not ( = ?auto_269389 ?auto_269393 ) ) ( not ( = ?auto_269389 ?auto_269394 ) ) ( not ( = ?auto_269390 ?auto_269391 ) ) ( not ( = ?auto_269390 ?auto_269392 ) ) ( not ( = ?auto_269390 ?auto_269393 ) ) ( not ( = ?auto_269390 ?auto_269394 ) ) ( not ( = ?auto_269391 ?auto_269392 ) ) ( not ( = ?auto_269391 ?auto_269393 ) ) ( not ( = ?auto_269391 ?auto_269394 ) ) ( not ( = ?auto_269392 ?auto_269393 ) ) ( not ( = ?auto_269392 ?auto_269394 ) ) ( not ( = ?auto_269393 ?auto_269394 ) ) ( ON ?auto_269392 ?auto_269393 ) ( ON ?auto_269391 ?auto_269392 ) ( ON ?auto_269390 ?auto_269391 ) ( CLEAR ?auto_269388 ) ( ON ?auto_269389 ?auto_269390 ) ( CLEAR ?auto_269389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269384 ?auto_269385 ?auto_269386 ?auto_269387 ?auto_269388 ?auto_269389 )
      ( MAKE-10PILE ?auto_269384 ?auto_269385 ?auto_269386 ?auto_269387 ?auto_269388 ?auto_269389 ?auto_269390 ?auto_269391 ?auto_269392 ?auto_269393 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269426 - BLOCK
      ?auto_269427 - BLOCK
      ?auto_269428 - BLOCK
      ?auto_269429 - BLOCK
      ?auto_269430 - BLOCK
      ?auto_269431 - BLOCK
      ?auto_269432 - BLOCK
      ?auto_269433 - BLOCK
      ?auto_269434 - BLOCK
      ?auto_269435 - BLOCK
    )
    :vars
    (
      ?auto_269436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269435 ?auto_269436 ) ( ON-TABLE ?auto_269426 ) ( ON ?auto_269427 ?auto_269426 ) ( ON ?auto_269428 ?auto_269427 ) ( ON ?auto_269429 ?auto_269428 ) ( not ( = ?auto_269426 ?auto_269427 ) ) ( not ( = ?auto_269426 ?auto_269428 ) ) ( not ( = ?auto_269426 ?auto_269429 ) ) ( not ( = ?auto_269426 ?auto_269430 ) ) ( not ( = ?auto_269426 ?auto_269431 ) ) ( not ( = ?auto_269426 ?auto_269432 ) ) ( not ( = ?auto_269426 ?auto_269433 ) ) ( not ( = ?auto_269426 ?auto_269434 ) ) ( not ( = ?auto_269426 ?auto_269435 ) ) ( not ( = ?auto_269426 ?auto_269436 ) ) ( not ( = ?auto_269427 ?auto_269428 ) ) ( not ( = ?auto_269427 ?auto_269429 ) ) ( not ( = ?auto_269427 ?auto_269430 ) ) ( not ( = ?auto_269427 ?auto_269431 ) ) ( not ( = ?auto_269427 ?auto_269432 ) ) ( not ( = ?auto_269427 ?auto_269433 ) ) ( not ( = ?auto_269427 ?auto_269434 ) ) ( not ( = ?auto_269427 ?auto_269435 ) ) ( not ( = ?auto_269427 ?auto_269436 ) ) ( not ( = ?auto_269428 ?auto_269429 ) ) ( not ( = ?auto_269428 ?auto_269430 ) ) ( not ( = ?auto_269428 ?auto_269431 ) ) ( not ( = ?auto_269428 ?auto_269432 ) ) ( not ( = ?auto_269428 ?auto_269433 ) ) ( not ( = ?auto_269428 ?auto_269434 ) ) ( not ( = ?auto_269428 ?auto_269435 ) ) ( not ( = ?auto_269428 ?auto_269436 ) ) ( not ( = ?auto_269429 ?auto_269430 ) ) ( not ( = ?auto_269429 ?auto_269431 ) ) ( not ( = ?auto_269429 ?auto_269432 ) ) ( not ( = ?auto_269429 ?auto_269433 ) ) ( not ( = ?auto_269429 ?auto_269434 ) ) ( not ( = ?auto_269429 ?auto_269435 ) ) ( not ( = ?auto_269429 ?auto_269436 ) ) ( not ( = ?auto_269430 ?auto_269431 ) ) ( not ( = ?auto_269430 ?auto_269432 ) ) ( not ( = ?auto_269430 ?auto_269433 ) ) ( not ( = ?auto_269430 ?auto_269434 ) ) ( not ( = ?auto_269430 ?auto_269435 ) ) ( not ( = ?auto_269430 ?auto_269436 ) ) ( not ( = ?auto_269431 ?auto_269432 ) ) ( not ( = ?auto_269431 ?auto_269433 ) ) ( not ( = ?auto_269431 ?auto_269434 ) ) ( not ( = ?auto_269431 ?auto_269435 ) ) ( not ( = ?auto_269431 ?auto_269436 ) ) ( not ( = ?auto_269432 ?auto_269433 ) ) ( not ( = ?auto_269432 ?auto_269434 ) ) ( not ( = ?auto_269432 ?auto_269435 ) ) ( not ( = ?auto_269432 ?auto_269436 ) ) ( not ( = ?auto_269433 ?auto_269434 ) ) ( not ( = ?auto_269433 ?auto_269435 ) ) ( not ( = ?auto_269433 ?auto_269436 ) ) ( not ( = ?auto_269434 ?auto_269435 ) ) ( not ( = ?auto_269434 ?auto_269436 ) ) ( not ( = ?auto_269435 ?auto_269436 ) ) ( ON ?auto_269434 ?auto_269435 ) ( ON ?auto_269433 ?auto_269434 ) ( ON ?auto_269432 ?auto_269433 ) ( ON ?auto_269431 ?auto_269432 ) ( CLEAR ?auto_269429 ) ( ON ?auto_269430 ?auto_269431 ) ( CLEAR ?auto_269430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269426 ?auto_269427 ?auto_269428 ?auto_269429 ?auto_269430 )
      ( MAKE-10PILE ?auto_269426 ?auto_269427 ?auto_269428 ?auto_269429 ?auto_269430 ?auto_269431 ?auto_269432 ?auto_269433 ?auto_269434 ?auto_269435 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269468 - BLOCK
      ?auto_269469 - BLOCK
      ?auto_269470 - BLOCK
      ?auto_269471 - BLOCK
      ?auto_269472 - BLOCK
      ?auto_269473 - BLOCK
      ?auto_269474 - BLOCK
      ?auto_269475 - BLOCK
      ?auto_269476 - BLOCK
      ?auto_269477 - BLOCK
    )
    :vars
    (
      ?auto_269478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269477 ?auto_269478 ) ( ON-TABLE ?auto_269468 ) ( ON ?auto_269469 ?auto_269468 ) ( ON ?auto_269470 ?auto_269469 ) ( not ( = ?auto_269468 ?auto_269469 ) ) ( not ( = ?auto_269468 ?auto_269470 ) ) ( not ( = ?auto_269468 ?auto_269471 ) ) ( not ( = ?auto_269468 ?auto_269472 ) ) ( not ( = ?auto_269468 ?auto_269473 ) ) ( not ( = ?auto_269468 ?auto_269474 ) ) ( not ( = ?auto_269468 ?auto_269475 ) ) ( not ( = ?auto_269468 ?auto_269476 ) ) ( not ( = ?auto_269468 ?auto_269477 ) ) ( not ( = ?auto_269468 ?auto_269478 ) ) ( not ( = ?auto_269469 ?auto_269470 ) ) ( not ( = ?auto_269469 ?auto_269471 ) ) ( not ( = ?auto_269469 ?auto_269472 ) ) ( not ( = ?auto_269469 ?auto_269473 ) ) ( not ( = ?auto_269469 ?auto_269474 ) ) ( not ( = ?auto_269469 ?auto_269475 ) ) ( not ( = ?auto_269469 ?auto_269476 ) ) ( not ( = ?auto_269469 ?auto_269477 ) ) ( not ( = ?auto_269469 ?auto_269478 ) ) ( not ( = ?auto_269470 ?auto_269471 ) ) ( not ( = ?auto_269470 ?auto_269472 ) ) ( not ( = ?auto_269470 ?auto_269473 ) ) ( not ( = ?auto_269470 ?auto_269474 ) ) ( not ( = ?auto_269470 ?auto_269475 ) ) ( not ( = ?auto_269470 ?auto_269476 ) ) ( not ( = ?auto_269470 ?auto_269477 ) ) ( not ( = ?auto_269470 ?auto_269478 ) ) ( not ( = ?auto_269471 ?auto_269472 ) ) ( not ( = ?auto_269471 ?auto_269473 ) ) ( not ( = ?auto_269471 ?auto_269474 ) ) ( not ( = ?auto_269471 ?auto_269475 ) ) ( not ( = ?auto_269471 ?auto_269476 ) ) ( not ( = ?auto_269471 ?auto_269477 ) ) ( not ( = ?auto_269471 ?auto_269478 ) ) ( not ( = ?auto_269472 ?auto_269473 ) ) ( not ( = ?auto_269472 ?auto_269474 ) ) ( not ( = ?auto_269472 ?auto_269475 ) ) ( not ( = ?auto_269472 ?auto_269476 ) ) ( not ( = ?auto_269472 ?auto_269477 ) ) ( not ( = ?auto_269472 ?auto_269478 ) ) ( not ( = ?auto_269473 ?auto_269474 ) ) ( not ( = ?auto_269473 ?auto_269475 ) ) ( not ( = ?auto_269473 ?auto_269476 ) ) ( not ( = ?auto_269473 ?auto_269477 ) ) ( not ( = ?auto_269473 ?auto_269478 ) ) ( not ( = ?auto_269474 ?auto_269475 ) ) ( not ( = ?auto_269474 ?auto_269476 ) ) ( not ( = ?auto_269474 ?auto_269477 ) ) ( not ( = ?auto_269474 ?auto_269478 ) ) ( not ( = ?auto_269475 ?auto_269476 ) ) ( not ( = ?auto_269475 ?auto_269477 ) ) ( not ( = ?auto_269475 ?auto_269478 ) ) ( not ( = ?auto_269476 ?auto_269477 ) ) ( not ( = ?auto_269476 ?auto_269478 ) ) ( not ( = ?auto_269477 ?auto_269478 ) ) ( ON ?auto_269476 ?auto_269477 ) ( ON ?auto_269475 ?auto_269476 ) ( ON ?auto_269474 ?auto_269475 ) ( ON ?auto_269473 ?auto_269474 ) ( ON ?auto_269472 ?auto_269473 ) ( CLEAR ?auto_269470 ) ( ON ?auto_269471 ?auto_269472 ) ( CLEAR ?auto_269471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269468 ?auto_269469 ?auto_269470 ?auto_269471 )
      ( MAKE-10PILE ?auto_269468 ?auto_269469 ?auto_269470 ?auto_269471 ?auto_269472 ?auto_269473 ?auto_269474 ?auto_269475 ?auto_269476 ?auto_269477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269510 - BLOCK
      ?auto_269511 - BLOCK
      ?auto_269512 - BLOCK
      ?auto_269513 - BLOCK
      ?auto_269514 - BLOCK
      ?auto_269515 - BLOCK
      ?auto_269516 - BLOCK
      ?auto_269517 - BLOCK
      ?auto_269518 - BLOCK
      ?auto_269519 - BLOCK
    )
    :vars
    (
      ?auto_269520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269519 ?auto_269520 ) ( ON-TABLE ?auto_269510 ) ( ON ?auto_269511 ?auto_269510 ) ( not ( = ?auto_269510 ?auto_269511 ) ) ( not ( = ?auto_269510 ?auto_269512 ) ) ( not ( = ?auto_269510 ?auto_269513 ) ) ( not ( = ?auto_269510 ?auto_269514 ) ) ( not ( = ?auto_269510 ?auto_269515 ) ) ( not ( = ?auto_269510 ?auto_269516 ) ) ( not ( = ?auto_269510 ?auto_269517 ) ) ( not ( = ?auto_269510 ?auto_269518 ) ) ( not ( = ?auto_269510 ?auto_269519 ) ) ( not ( = ?auto_269510 ?auto_269520 ) ) ( not ( = ?auto_269511 ?auto_269512 ) ) ( not ( = ?auto_269511 ?auto_269513 ) ) ( not ( = ?auto_269511 ?auto_269514 ) ) ( not ( = ?auto_269511 ?auto_269515 ) ) ( not ( = ?auto_269511 ?auto_269516 ) ) ( not ( = ?auto_269511 ?auto_269517 ) ) ( not ( = ?auto_269511 ?auto_269518 ) ) ( not ( = ?auto_269511 ?auto_269519 ) ) ( not ( = ?auto_269511 ?auto_269520 ) ) ( not ( = ?auto_269512 ?auto_269513 ) ) ( not ( = ?auto_269512 ?auto_269514 ) ) ( not ( = ?auto_269512 ?auto_269515 ) ) ( not ( = ?auto_269512 ?auto_269516 ) ) ( not ( = ?auto_269512 ?auto_269517 ) ) ( not ( = ?auto_269512 ?auto_269518 ) ) ( not ( = ?auto_269512 ?auto_269519 ) ) ( not ( = ?auto_269512 ?auto_269520 ) ) ( not ( = ?auto_269513 ?auto_269514 ) ) ( not ( = ?auto_269513 ?auto_269515 ) ) ( not ( = ?auto_269513 ?auto_269516 ) ) ( not ( = ?auto_269513 ?auto_269517 ) ) ( not ( = ?auto_269513 ?auto_269518 ) ) ( not ( = ?auto_269513 ?auto_269519 ) ) ( not ( = ?auto_269513 ?auto_269520 ) ) ( not ( = ?auto_269514 ?auto_269515 ) ) ( not ( = ?auto_269514 ?auto_269516 ) ) ( not ( = ?auto_269514 ?auto_269517 ) ) ( not ( = ?auto_269514 ?auto_269518 ) ) ( not ( = ?auto_269514 ?auto_269519 ) ) ( not ( = ?auto_269514 ?auto_269520 ) ) ( not ( = ?auto_269515 ?auto_269516 ) ) ( not ( = ?auto_269515 ?auto_269517 ) ) ( not ( = ?auto_269515 ?auto_269518 ) ) ( not ( = ?auto_269515 ?auto_269519 ) ) ( not ( = ?auto_269515 ?auto_269520 ) ) ( not ( = ?auto_269516 ?auto_269517 ) ) ( not ( = ?auto_269516 ?auto_269518 ) ) ( not ( = ?auto_269516 ?auto_269519 ) ) ( not ( = ?auto_269516 ?auto_269520 ) ) ( not ( = ?auto_269517 ?auto_269518 ) ) ( not ( = ?auto_269517 ?auto_269519 ) ) ( not ( = ?auto_269517 ?auto_269520 ) ) ( not ( = ?auto_269518 ?auto_269519 ) ) ( not ( = ?auto_269518 ?auto_269520 ) ) ( not ( = ?auto_269519 ?auto_269520 ) ) ( ON ?auto_269518 ?auto_269519 ) ( ON ?auto_269517 ?auto_269518 ) ( ON ?auto_269516 ?auto_269517 ) ( ON ?auto_269515 ?auto_269516 ) ( ON ?auto_269514 ?auto_269515 ) ( ON ?auto_269513 ?auto_269514 ) ( CLEAR ?auto_269511 ) ( ON ?auto_269512 ?auto_269513 ) ( CLEAR ?auto_269512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269510 ?auto_269511 ?auto_269512 )
      ( MAKE-10PILE ?auto_269510 ?auto_269511 ?auto_269512 ?auto_269513 ?auto_269514 ?auto_269515 ?auto_269516 ?auto_269517 ?auto_269518 ?auto_269519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269552 - BLOCK
      ?auto_269553 - BLOCK
      ?auto_269554 - BLOCK
      ?auto_269555 - BLOCK
      ?auto_269556 - BLOCK
      ?auto_269557 - BLOCK
      ?auto_269558 - BLOCK
      ?auto_269559 - BLOCK
      ?auto_269560 - BLOCK
      ?auto_269561 - BLOCK
    )
    :vars
    (
      ?auto_269562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269561 ?auto_269562 ) ( ON-TABLE ?auto_269552 ) ( not ( = ?auto_269552 ?auto_269553 ) ) ( not ( = ?auto_269552 ?auto_269554 ) ) ( not ( = ?auto_269552 ?auto_269555 ) ) ( not ( = ?auto_269552 ?auto_269556 ) ) ( not ( = ?auto_269552 ?auto_269557 ) ) ( not ( = ?auto_269552 ?auto_269558 ) ) ( not ( = ?auto_269552 ?auto_269559 ) ) ( not ( = ?auto_269552 ?auto_269560 ) ) ( not ( = ?auto_269552 ?auto_269561 ) ) ( not ( = ?auto_269552 ?auto_269562 ) ) ( not ( = ?auto_269553 ?auto_269554 ) ) ( not ( = ?auto_269553 ?auto_269555 ) ) ( not ( = ?auto_269553 ?auto_269556 ) ) ( not ( = ?auto_269553 ?auto_269557 ) ) ( not ( = ?auto_269553 ?auto_269558 ) ) ( not ( = ?auto_269553 ?auto_269559 ) ) ( not ( = ?auto_269553 ?auto_269560 ) ) ( not ( = ?auto_269553 ?auto_269561 ) ) ( not ( = ?auto_269553 ?auto_269562 ) ) ( not ( = ?auto_269554 ?auto_269555 ) ) ( not ( = ?auto_269554 ?auto_269556 ) ) ( not ( = ?auto_269554 ?auto_269557 ) ) ( not ( = ?auto_269554 ?auto_269558 ) ) ( not ( = ?auto_269554 ?auto_269559 ) ) ( not ( = ?auto_269554 ?auto_269560 ) ) ( not ( = ?auto_269554 ?auto_269561 ) ) ( not ( = ?auto_269554 ?auto_269562 ) ) ( not ( = ?auto_269555 ?auto_269556 ) ) ( not ( = ?auto_269555 ?auto_269557 ) ) ( not ( = ?auto_269555 ?auto_269558 ) ) ( not ( = ?auto_269555 ?auto_269559 ) ) ( not ( = ?auto_269555 ?auto_269560 ) ) ( not ( = ?auto_269555 ?auto_269561 ) ) ( not ( = ?auto_269555 ?auto_269562 ) ) ( not ( = ?auto_269556 ?auto_269557 ) ) ( not ( = ?auto_269556 ?auto_269558 ) ) ( not ( = ?auto_269556 ?auto_269559 ) ) ( not ( = ?auto_269556 ?auto_269560 ) ) ( not ( = ?auto_269556 ?auto_269561 ) ) ( not ( = ?auto_269556 ?auto_269562 ) ) ( not ( = ?auto_269557 ?auto_269558 ) ) ( not ( = ?auto_269557 ?auto_269559 ) ) ( not ( = ?auto_269557 ?auto_269560 ) ) ( not ( = ?auto_269557 ?auto_269561 ) ) ( not ( = ?auto_269557 ?auto_269562 ) ) ( not ( = ?auto_269558 ?auto_269559 ) ) ( not ( = ?auto_269558 ?auto_269560 ) ) ( not ( = ?auto_269558 ?auto_269561 ) ) ( not ( = ?auto_269558 ?auto_269562 ) ) ( not ( = ?auto_269559 ?auto_269560 ) ) ( not ( = ?auto_269559 ?auto_269561 ) ) ( not ( = ?auto_269559 ?auto_269562 ) ) ( not ( = ?auto_269560 ?auto_269561 ) ) ( not ( = ?auto_269560 ?auto_269562 ) ) ( not ( = ?auto_269561 ?auto_269562 ) ) ( ON ?auto_269560 ?auto_269561 ) ( ON ?auto_269559 ?auto_269560 ) ( ON ?auto_269558 ?auto_269559 ) ( ON ?auto_269557 ?auto_269558 ) ( ON ?auto_269556 ?auto_269557 ) ( ON ?auto_269555 ?auto_269556 ) ( ON ?auto_269554 ?auto_269555 ) ( CLEAR ?auto_269552 ) ( ON ?auto_269553 ?auto_269554 ) ( CLEAR ?auto_269553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269552 ?auto_269553 )
      ( MAKE-10PILE ?auto_269552 ?auto_269553 ?auto_269554 ?auto_269555 ?auto_269556 ?auto_269557 ?auto_269558 ?auto_269559 ?auto_269560 ?auto_269561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269594 - BLOCK
      ?auto_269595 - BLOCK
      ?auto_269596 - BLOCK
      ?auto_269597 - BLOCK
      ?auto_269598 - BLOCK
      ?auto_269599 - BLOCK
      ?auto_269600 - BLOCK
      ?auto_269601 - BLOCK
      ?auto_269602 - BLOCK
      ?auto_269603 - BLOCK
    )
    :vars
    (
      ?auto_269604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269603 ?auto_269604 ) ( not ( = ?auto_269594 ?auto_269595 ) ) ( not ( = ?auto_269594 ?auto_269596 ) ) ( not ( = ?auto_269594 ?auto_269597 ) ) ( not ( = ?auto_269594 ?auto_269598 ) ) ( not ( = ?auto_269594 ?auto_269599 ) ) ( not ( = ?auto_269594 ?auto_269600 ) ) ( not ( = ?auto_269594 ?auto_269601 ) ) ( not ( = ?auto_269594 ?auto_269602 ) ) ( not ( = ?auto_269594 ?auto_269603 ) ) ( not ( = ?auto_269594 ?auto_269604 ) ) ( not ( = ?auto_269595 ?auto_269596 ) ) ( not ( = ?auto_269595 ?auto_269597 ) ) ( not ( = ?auto_269595 ?auto_269598 ) ) ( not ( = ?auto_269595 ?auto_269599 ) ) ( not ( = ?auto_269595 ?auto_269600 ) ) ( not ( = ?auto_269595 ?auto_269601 ) ) ( not ( = ?auto_269595 ?auto_269602 ) ) ( not ( = ?auto_269595 ?auto_269603 ) ) ( not ( = ?auto_269595 ?auto_269604 ) ) ( not ( = ?auto_269596 ?auto_269597 ) ) ( not ( = ?auto_269596 ?auto_269598 ) ) ( not ( = ?auto_269596 ?auto_269599 ) ) ( not ( = ?auto_269596 ?auto_269600 ) ) ( not ( = ?auto_269596 ?auto_269601 ) ) ( not ( = ?auto_269596 ?auto_269602 ) ) ( not ( = ?auto_269596 ?auto_269603 ) ) ( not ( = ?auto_269596 ?auto_269604 ) ) ( not ( = ?auto_269597 ?auto_269598 ) ) ( not ( = ?auto_269597 ?auto_269599 ) ) ( not ( = ?auto_269597 ?auto_269600 ) ) ( not ( = ?auto_269597 ?auto_269601 ) ) ( not ( = ?auto_269597 ?auto_269602 ) ) ( not ( = ?auto_269597 ?auto_269603 ) ) ( not ( = ?auto_269597 ?auto_269604 ) ) ( not ( = ?auto_269598 ?auto_269599 ) ) ( not ( = ?auto_269598 ?auto_269600 ) ) ( not ( = ?auto_269598 ?auto_269601 ) ) ( not ( = ?auto_269598 ?auto_269602 ) ) ( not ( = ?auto_269598 ?auto_269603 ) ) ( not ( = ?auto_269598 ?auto_269604 ) ) ( not ( = ?auto_269599 ?auto_269600 ) ) ( not ( = ?auto_269599 ?auto_269601 ) ) ( not ( = ?auto_269599 ?auto_269602 ) ) ( not ( = ?auto_269599 ?auto_269603 ) ) ( not ( = ?auto_269599 ?auto_269604 ) ) ( not ( = ?auto_269600 ?auto_269601 ) ) ( not ( = ?auto_269600 ?auto_269602 ) ) ( not ( = ?auto_269600 ?auto_269603 ) ) ( not ( = ?auto_269600 ?auto_269604 ) ) ( not ( = ?auto_269601 ?auto_269602 ) ) ( not ( = ?auto_269601 ?auto_269603 ) ) ( not ( = ?auto_269601 ?auto_269604 ) ) ( not ( = ?auto_269602 ?auto_269603 ) ) ( not ( = ?auto_269602 ?auto_269604 ) ) ( not ( = ?auto_269603 ?auto_269604 ) ) ( ON ?auto_269602 ?auto_269603 ) ( ON ?auto_269601 ?auto_269602 ) ( ON ?auto_269600 ?auto_269601 ) ( ON ?auto_269599 ?auto_269600 ) ( ON ?auto_269598 ?auto_269599 ) ( ON ?auto_269597 ?auto_269598 ) ( ON ?auto_269596 ?auto_269597 ) ( ON ?auto_269595 ?auto_269596 ) ( ON ?auto_269594 ?auto_269595 ) ( CLEAR ?auto_269594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269594 )
      ( MAKE-10PILE ?auto_269594 ?auto_269595 ?auto_269596 ?auto_269597 ?auto_269598 ?auto_269599 ?auto_269600 ?auto_269601 ?auto_269602 ?auto_269603 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269637 - BLOCK
      ?auto_269638 - BLOCK
      ?auto_269639 - BLOCK
      ?auto_269640 - BLOCK
      ?auto_269641 - BLOCK
      ?auto_269642 - BLOCK
      ?auto_269643 - BLOCK
      ?auto_269644 - BLOCK
      ?auto_269645 - BLOCK
      ?auto_269646 - BLOCK
      ?auto_269647 - BLOCK
    )
    :vars
    (
      ?auto_269648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269646 ) ( ON ?auto_269647 ?auto_269648 ) ( CLEAR ?auto_269647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269637 ) ( ON ?auto_269638 ?auto_269637 ) ( ON ?auto_269639 ?auto_269638 ) ( ON ?auto_269640 ?auto_269639 ) ( ON ?auto_269641 ?auto_269640 ) ( ON ?auto_269642 ?auto_269641 ) ( ON ?auto_269643 ?auto_269642 ) ( ON ?auto_269644 ?auto_269643 ) ( ON ?auto_269645 ?auto_269644 ) ( ON ?auto_269646 ?auto_269645 ) ( not ( = ?auto_269637 ?auto_269638 ) ) ( not ( = ?auto_269637 ?auto_269639 ) ) ( not ( = ?auto_269637 ?auto_269640 ) ) ( not ( = ?auto_269637 ?auto_269641 ) ) ( not ( = ?auto_269637 ?auto_269642 ) ) ( not ( = ?auto_269637 ?auto_269643 ) ) ( not ( = ?auto_269637 ?auto_269644 ) ) ( not ( = ?auto_269637 ?auto_269645 ) ) ( not ( = ?auto_269637 ?auto_269646 ) ) ( not ( = ?auto_269637 ?auto_269647 ) ) ( not ( = ?auto_269637 ?auto_269648 ) ) ( not ( = ?auto_269638 ?auto_269639 ) ) ( not ( = ?auto_269638 ?auto_269640 ) ) ( not ( = ?auto_269638 ?auto_269641 ) ) ( not ( = ?auto_269638 ?auto_269642 ) ) ( not ( = ?auto_269638 ?auto_269643 ) ) ( not ( = ?auto_269638 ?auto_269644 ) ) ( not ( = ?auto_269638 ?auto_269645 ) ) ( not ( = ?auto_269638 ?auto_269646 ) ) ( not ( = ?auto_269638 ?auto_269647 ) ) ( not ( = ?auto_269638 ?auto_269648 ) ) ( not ( = ?auto_269639 ?auto_269640 ) ) ( not ( = ?auto_269639 ?auto_269641 ) ) ( not ( = ?auto_269639 ?auto_269642 ) ) ( not ( = ?auto_269639 ?auto_269643 ) ) ( not ( = ?auto_269639 ?auto_269644 ) ) ( not ( = ?auto_269639 ?auto_269645 ) ) ( not ( = ?auto_269639 ?auto_269646 ) ) ( not ( = ?auto_269639 ?auto_269647 ) ) ( not ( = ?auto_269639 ?auto_269648 ) ) ( not ( = ?auto_269640 ?auto_269641 ) ) ( not ( = ?auto_269640 ?auto_269642 ) ) ( not ( = ?auto_269640 ?auto_269643 ) ) ( not ( = ?auto_269640 ?auto_269644 ) ) ( not ( = ?auto_269640 ?auto_269645 ) ) ( not ( = ?auto_269640 ?auto_269646 ) ) ( not ( = ?auto_269640 ?auto_269647 ) ) ( not ( = ?auto_269640 ?auto_269648 ) ) ( not ( = ?auto_269641 ?auto_269642 ) ) ( not ( = ?auto_269641 ?auto_269643 ) ) ( not ( = ?auto_269641 ?auto_269644 ) ) ( not ( = ?auto_269641 ?auto_269645 ) ) ( not ( = ?auto_269641 ?auto_269646 ) ) ( not ( = ?auto_269641 ?auto_269647 ) ) ( not ( = ?auto_269641 ?auto_269648 ) ) ( not ( = ?auto_269642 ?auto_269643 ) ) ( not ( = ?auto_269642 ?auto_269644 ) ) ( not ( = ?auto_269642 ?auto_269645 ) ) ( not ( = ?auto_269642 ?auto_269646 ) ) ( not ( = ?auto_269642 ?auto_269647 ) ) ( not ( = ?auto_269642 ?auto_269648 ) ) ( not ( = ?auto_269643 ?auto_269644 ) ) ( not ( = ?auto_269643 ?auto_269645 ) ) ( not ( = ?auto_269643 ?auto_269646 ) ) ( not ( = ?auto_269643 ?auto_269647 ) ) ( not ( = ?auto_269643 ?auto_269648 ) ) ( not ( = ?auto_269644 ?auto_269645 ) ) ( not ( = ?auto_269644 ?auto_269646 ) ) ( not ( = ?auto_269644 ?auto_269647 ) ) ( not ( = ?auto_269644 ?auto_269648 ) ) ( not ( = ?auto_269645 ?auto_269646 ) ) ( not ( = ?auto_269645 ?auto_269647 ) ) ( not ( = ?auto_269645 ?auto_269648 ) ) ( not ( = ?auto_269646 ?auto_269647 ) ) ( not ( = ?auto_269646 ?auto_269648 ) ) ( not ( = ?auto_269647 ?auto_269648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269647 ?auto_269648 )
      ( !STACK ?auto_269647 ?auto_269646 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269683 - BLOCK
      ?auto_269684 - BLOCK
      ?auto_269685 - BLOCK
      ?auto_269686 - BLOCK
      ?auto_269687 - BLOCK
      ?auto_269688 - BLOCK
      ?auto_269689 - BLOCK
      ?auto_269690 - BLOCK
      ?auto_269691 - BLOCK
      ?auto_269692 - BLOCK
      ?auto_269693 - BLOCK
    )
    :vars
    (
      ?auto_269694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269693 ?auto_269694 ) ( ON-TABLE ?auto_269683 ) ( ON ?auto_269684 ?auto_269683 ) ( ON ?auto_269685 ?auto_269684 ) ( ON ?auto_269686 ?auto_269685 ) ( ON ?auto_269687 ?auto_269686 ) ( ON ?auto_269688 ?auto_269687 ) ( ON ?auto_269689 ?auto_269688 ) ( ON ?auto_269690 ?auto_269689 ) ( ON ?auto_269691 ?auto_269690 ) ( not ( = ?auto_269683 ?auto_269684 ) ) ( not ( = ?auto_269683 ?auto_269685 ) ) ( not ( = ?auto_269683 ?auto_269686 ) ) ( not ( = ?auto_269683 ?auto_269687 ) ) ( not ( = ?auto_269683 ?auto_269688 ) ) ( not ( = ?auto_269683 ?auto_269689 ) ) ( not ( = ?auto_269683 ?auto_269690 ) ) ( not ( = ?auto_269683 ?auto_269691 ) ) ( not ( = ?auto_269683 ?auto_269692 ) ) ( not ( = ?auto_269683 ?auto_269693 ) ) ( not ( = ?auto_269683 ?auto_269694 ) ) ( not ( = ?auto_269684 ?auto_269685 ) ) ( not ( = ?auto_269684 ?auto_269686 ) ) ( not ( = ?auto_269684 ?auto_269687 ) ) ( not ( = ?auto_269684 ?auto_269688 ) ) ( not ( = ?auto_269684 ?auto_269689 ) ) ( not ( = ?auto_269684 ?auto_269690 ) ) ( not ( = ?auto_269684 ?auto_269691 ) ) ( not ( = ?auto_269684 ?auto_269692 ) ) ( not ( = ?auto_269684 ?auto_269693 ) ) ( not ( = ?auto_269684 ?auto_269694 ) ) ( not ( = ?auto_269685 ?auto_269686 ) ) ( not ( = ?auto_269685 ?auto_269687 ) ) ( not ( = ?auto_269685 ?auto_269688 ) ) ( not ( = ?auto_269685 ?auto_269689 ) ) ( not ( = ?auto_269685 ?auto_269690 ) ) ( not ( = ?auto_269685 ?auto_269691 ) ) ( not ( = ?auto_269685 ?auto_269692 ) ) ( not ( = ?auto_269685 ?auto_269693 ) ) ( not ( = ?auto_269685 ?auto_269694 ) ) ( not ( = ?auto_269686 ?auto_269687 ) ) ( not ( = ?auto_269686 ?auto_269688 ) ) ( not ( = ?auto_269686 ?auto_269689 ) ) ( not ( = ?auto_269686 ?auto_269690 ) ) ( not ( = ?auto_269686 ?auto_269691 ) ) ( not ( = ?auto_269686 ?auto_269692 ) ) ( not ( = ?auto_269686 ?auto_269693 ) ) ( not ( = ?auto_269686 ?auto_269694 ) ) ( not ( = ?auto_269687 ?auto_269688 ) ) ( not ( = ?auto_269687 ?auto_269689 ) ) ( not ( = ?auto_269687 ?auto_269690 ) ) ( not ( = ?auto_269687 ?auto_269691 ) ) ( not ( = ?auto_269687 ?auto_269692 ) ) ( not ( = ?auto_269687 ?auto_269693 ) ) ( not ( = ?auto_269687 ?auto_269694 ) ) ( not ( = ?auto_269688 ?auto_269689 ) ) ( not ( = ?auto_269688 ?auto_269690 ) ) ( not ( = ?auto_269688 ?auto_269691 ) ) ( not ( = ?auto_269688 ?auto_269692 ) ) ( not ( = ?auto_269688 ?auto_269693 ) ) ( not ( = ?auto_269688 ?auto_269694 ) ) ( not ( = ?auto_269689 ?auto_269690 ) ) ( not ( = ?auto_269689 ?auto_269691 ) ) ( not ( = ?auto_269689 ?auto_269692 ) ) ( not ( = ?auto_269689 ?auto_269693 ) ) ( not ( = ?auto_269689 ?auto_269694 ) ) ( not ( = ?auto_269690 ?auto_269691 ) ) ( not ( = ?auto_269690 ?auto_269692 ) ) ( not ( = ?auto_269690 ?auto_269693 ) ) ( not ( = ?auto_269690 ?auto_269694 ) ) ( not ( = ?auto_269691 ?auto_269692 ) ) ( not ( = ?auto_269691 ?auto_269693 ) ) ( not ( = ?auto_269691 ?auto_269694 ) ) ( not ( = ?auto_269692 ?auto_269693 ) ) ( not ( = ?auto_269692 ?auto_269694 ) ) ( not ( = ?auto_269693 ?auto_269694 ) ) ( CLEAR ?auto_269691 ) ( ON ?auto_269692 ?auto_269693 ) ( CLEAR ?auto_269692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_269683 ?auto_269684 ?auto_269685 ?auto_269686 ?auto_269687 ?auto_269688 ?auto_269689 ?auto_269690 ?auto_269691 ?auto_269692 )
      ( MAKE-11PILE ?auto_269683 ?auto_269684 ?auto_269685 ?auto_269686 ?auto_269687 ?auto_269688 ?auto_269689 ?auto_269690 ?auto_269691 ?auto_269692 ?auto_269693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269729 - BLOCK
      ?auto_269730 - BLOCK
      ?auto_269731 - BLOCK
      ?auto_269732 - BLOCK
      ?auto_269733 - BLOCK
      ?auto_269734 - BLOCK
      ?auto_269735 - BLOCK
      ?auto_269736 - BLOCK
      ?auto_269737 - BLOCK
      ?auto_269738 - BLOCK
      ?auto_269739 - BLOCK
    )
    :vars
    (
      ?auto_269740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269739 ?auto_269740 ) ( ON-TABLE ?auto_269729 ) ( ON ?auto_269730 ?auto_269729 ) ( ON ?auto_269731 ?auto_269730 ) ( ON ?auto_269732 ?auto_269731 ) ( ON ?auto_269733 ?auto_269732 ) ( ON ?auto_269734 ?auto_269733 ) ( ON ?auto_269735 ?auto_269734 ) ( ON ?auto_269736 ?auto_269735 ) ( not ( = ?auto_269729 ?auto_269730 ) ) ( not ( = ?auto_269729 ?auto_269731 ) ) ( not ( = ?auto_269729 ?auto_269732 ) ) ( not ( = ?auto_269729 ?auto_269733 ) ) ( not ( = ?auto_269729 ?auto_269734 ) ) ( not ( = ?auto_269729 ?auto_269735 ) ) ( not ( = ?auto_269729 ?auto_269736 ) ) ( not ( = ?auto_269729 ?auto_269737 ) ) ( not ( = ?auto_269729 ?auto_269738 ) ) ( not ( = ?auto_269729 ?auto_269739 ) ) ( not ( = ?auto_269729 ?auto_269740 ) ) ( not ( = ?auto_269730 ?auto_269731 ) ) ( not ( = ?auto_269730 ?auto_269732 ) ) ( not ( = ?auto_269730 ?auto_269733 ) ) ( not ( = ?auto_269730 ?auto_269734 ) ) ( not ( = ?auto_269730 ?auto_269735 ) ) ( not ( = ?auto_269730 ?auto_269736 ) ) ( not ( = ?auto_269730 ?auto_269737 ) ) ( not ( = ?auto_269730 ?auto_269738 ) ) ( not ( = ?auto_269730 ?auto_269739 ) ) ( not ( = ?auto_269730 ?auto_269740 ) ) ( not ( = ?auto_269731 ?auto_269732 ) ) ( not ( = ?auto_269731 ?auto_269733 ) ) ( not ( = ?auto_269731 ?auto_269734 ) ) ( not ( = ?auto_269731 ?auto_269735 ) ) ( not ( = ?auto_269731 ?auto_269736 ) ) ( not ( = ?auto_269731 ?auto_269737 ) ) ( not ( = ?auto_269731 ?auto_269738 ) ) ( not ( = ?auto_269731 ?auto_269739 ) ) ( not ( = ?auto_269731 ?auto_269740 ) ) ( not ( = ?auto_269732 ?auto_269733 ) ) ( not ( = ?auto_269732 ?auto_269734 ) ) ( not ( = ?auto_269732 ?auto_269735 ) ) ( not ( = ?auto_269732 ?auto_269736 ) ) ( not ( = ?auto_269732 ?auto_269737 ) ) ( not ( = ?auto_269732 ?auto_269738 ) ) ( not ( = ?auto_269732 ?auto_269739 ) ) ( not ( = ?auto_269732 ?auto_269740 ) ) ( not ( = ?auto_269733 ?auto_269734 ) ) ( not ( = ?auto_269733 ?auto_269735 ) ) ( not ( = ?auto_269733 ?auto_269736 ) ) ( not ( = ?auto_269733 ?auto_269737 ) ) ( not ( = ?auto_269733 ?auto_269738 ) ) ( not ( = ?auto_269733 ?auto_269739 ) ) ( not ( = ?auto_269733 ?auto_269740 ) ) ( not ( = ?auto_269734 ?auto_269735 ) ) ( not ( = ?auto_269734 ?auto_269736 ) ) ( not ( = ?auto_269734 ?auto_269737 ) ) ( not ( = ?auto_269734 ?auto_269738 ) ) ( not ( = ?auto_269734 ?auto_269739 ) ) ( not ( = ?auto_269734 ?auto_269740 ) ) ( not ( = ?auto_269735 ?auto_269736 ) ) ( not ( = ?auto_269735 ?auto_269737 ) ) ( not ( = ?auto_269735 ?auto_269738 ) ) ( not ( = ?auto_269735 ?auto_269739 ) ) ( not ( = ?auto_269735 ?auto_269740 ) ) ( not ( = ?auto_269736 ?auto_269737 ) ) ( not ( = ?auto_269736 ?auto_269738 ) ) ( not ( = ?auto_269736 ?auto_269739 ) ) ( not ( = ?auto_269736 ?auto_269740 ) ) ( not ( = ?auto_269737 ?auto_269738 ) ) ( not ( = ?auto_269737 ?auto_269739 ) ) ( not ( = ?auto_269737 ?auto_269740 ) ) ( not ( = ?auto_269738 ?auto_269739 ) ) ( not ( = ?auto_269738 ?auto_269740 ) ) ( not ( = ?auto_269739 ?auto_269740 ) ) ( ON ?auto_269738 ?auto_269739 ) ( CLEAR ?auto_269736 ) ( ON ?auto_269737 ?auto_269738 ) ( CLEAR ?auto_269737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269729 ?auto_269730 ?auto_269731 ?auto_269732 ?auto_269733 ?auto_269734 ?auto_269735 ?auto_269736 ?auto_269737 )
      ( MAKE-11PILE ?auto_269729 ?auto_269730 ?auto_269731 ?auto_269732 ?auto_269733 ?auto_269734 ?auto_269735 ?auto_269736 ?auto_269737 ?auto_269738 ?auto_269739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269775 - BLOCK
      ?auto_269776 - BLOCK
      ?auto_269777 - BLOCK
      ?auto_269778 - BLOCK
      ?auto_269779 - BLOCK
      ?auto_269780 - BLOCK
      ?auto_269781 - BLOCK
      ?auto_269782 - BLOCK
      ?auto_269783 - BLOCK
      ?auto_269784 - BLOCK
      ?auto_269785 - BLOCK
    )
    :vars
    (
      ?auto_269786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269785 ?auto_269786 ) ( ON-TABLE ?auto_269775 ) ( ON ?auto_269776 ?auto_269775 ) ( ON ?auto_269777 ?auto_269776 ) ( ON ?auto_269778 ?auto_269777 ) ( ON ?auto_269779 ?auto_269778 ) ( ON ?auto_269780 ?auto_269779 ) ( ON ?auto_269781 ?auto_269780 ) ( not ( = ?auto_269775 ?auto_269776 ) ) ( not ( = ?auto_269775 ?auto_269777 ) ) ( not ( = ?auto_269775 ?auto_269778 ) ) ( not ( = ?auto_269775 ?auto_269779 ) ) ( not ( = ?auto_269775 ?auto_269780 ) ) ( not ( = ?auto_269775 ?auto_269781 ) ) ( not ( = ?auto_269775 ?auto_269782 ) ) ( not ( = ?auto_269775 ?auto_269783 ) ) ( not ( = ?auto_269775 ?auto_269784 ) ) ( not ( = ?auto_269775 ?auto_269785 ) ) ( not ( = ?auto_269775 ?auto_269786 ) ) ( not ( = ?auto_269776 ?auto_269777 ) ) ( not ( = ?auto_269776 ?auto_269778 ) ) ( not ( = ?auto_269776 ?auto_269779 ) ) ( not ( = ?auto_269776 ?auto_269780 ) ) ( not ( = ?auto_269776 ?auto_269781 ) ) ( not ( = ?auto_269776 ?auto_269782 ) ) ( not ( = ?auto_269776 ?auto_269783 ) ) ( not ( = ?auto_269776 ?auto_269784 ) ) ( not ( = ?auto_269776 ?auto_269785 ) ) ( not ( = ?auto_269776 ?auto_269786 ) ) ( not ( = ?auto_269777 ?auto_269778 ) ) ( not ( = ?auto_269777 ?auto_269779 ) ) ( not ( = ?auto_269777 ?auto_269780 ) ) ( not ( = ?auto_269777 ?auto_269781 ) ) ( not ( = ?auto_269777 ?auto_269782 ) ) ( not ( = ?auto_269777 ?auto_269783 ) ) ( not ( = ?auto_269777 ?auto_269784 ) ) ( not ( = ?auto_269777 ?auto_269785 ) ) ( not ( = ?auto_269777 ?auto_269786 ) ) ( not ( = ?auto_269778 ?auto_269779 ) ) ( not ( = ?auto_269778 ?auto_269780 ) ) ( not ( = ?auto_269778 ?auto_269781 ) ) ( not ( = ?auto_269778 ?auto_269782 ) ) ( not ( = ?auto_269778 ?auto_269783 ) ) ( not ( = ?auto_269778 ?auto_269784 ) ) ( not ( = ?auto_269778 ?auto_269785 ) ) ( not ( = ?auto_269778 ?auto_269786 ) ) ( not ( = ?auto_269779 ?auto_269780 ) ) ( not ( = ?auto_269779 ?auto_269781 ) ) ( not ( = ?auto_269779 ?auto_269782 ) ) ( not ( = ?auto_269779 ?auto_269783 ) ) ( not ( = ?auto_269779 ?auto_269784 ) ) ( not ( = ?auto_269779 ?auto_269785 ) ) ( not ( = ?auto_269779 ?auto_269786 ) ) ( not ( = ?auto_269780 ?auto_269781 ) ) ( not ( = ?auto_269780 ?auto_269782 ) ) ( not ( = ?auto_269780 ?auto_269783 ) ) ( not ( = ?auto_269780 ?auto_269784 ) ) ( not ( = ?auto_269780 ?auto_269785 ) ) ( not ( = ?auto_269780 ?auto_269786 ) ) ( not ( = ?auto_269781 ?auto_269782 ) ) ( not ( = ?auto_269781 ?auto_269783 ) ) ( not ( = ?auto_269781 ?auto_269784 ) ) ( not ( = ?auto_269781 ?auto_269785 ) ) ( not ( = ?auto_269781 ?auto_269786 ) ) ( not ( = ?auto_269782 ?auto_269783 ) ) ( not ( = ?auto_269782 ?auto_269784 ) ) ( not ( = ?auto_269782 ?auto_269785 ) ) ( not ( = ?auto_269782 ?auto_269786 ) ) ( not ( = ?auto_269783 ?auto_269784 ) ) ( not ( = ?auto_269783 ?auto_269785 ) ) ( not ( = ?auto_269783 ?auto_269786 ) ) ( not ( = ?auto_269784 ?auto_269785 ) ) ( not ( = ?auto_269784 ?auto_269786 ) ) ( not ( = ?auto_269785 ?auto_269786 ) ) ( ON ?auto_269784 ?auto_269785 ) ( ON ?auto_269783 ?auto_269784 ) ( CLEAR ?auto_269781 ) ( ON ?auto_269782 ?auto_269783 ) ( CLEAR ?auto_269782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269775 ?auto_269776 ?auto_269777 ?auto_269778 ?auto_269779 ?auto_269780 ?auto_269781 ?auto_269782 )
      ( MAKE-11PILE ?auto_269775 ?auto_269776 ?auto_269777 ?auto_269778 ?auto_269779 ?auto_269780 ?auto_269781 ?auto_269782 ?auto_269783 ?auto_269784 ?auto_269785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269821 - BLOCK
      ?auto_269822 - BLOCK
      ?auto_269823 - BLOCK
      ?auto_269824 - BLOCK
      ?auto_269825 - BLOCK
      ?auto_269826 - BLOCK
      ?auto_269827 - BLOCK
      ?auto_269828 - BLOCK
      ?auto_269829 - BLOCK
      ?auto_269830 - BLOCK
      ?auto_269831 - BLOCK
    )
    :vars
    (
      ?auto_269832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269831 ?auto_269832 ) ( ON-TABLE ?auto_269821 ) ( ON ?auto_269822 ?auto_269821 ) ( ON ?auto_269823 ?auto_269822 ) ( ON ?auto_269824 ?auto_269823 ) ( ON ?auto_269825 ?auto_269824 ) ( ON ?auto_269826 ?auto_269825 ) ( not ( = ?auto_269821 ?auto_269822 ) ) ( not ( = ?auto_269821 ?auto_269823 ) ) ( not ( = ?auto_269821 ?auto_269824 ) ) ( not ( = ?auto_269821 ?auto_269825 ) ) ( not ( = ?auto_269821 ?auto_269826 ) ) ( not ( = ?auto_269821 ?auto_269827 ) ) ( not ( = ?auto_269821 ?auto_269828 ) ) ( not ( = ?auto_269821 ?auto_269829 ) ) ( not ( = ?auto_269821 ?auto_269830 ) ) ( not ( = ?auto_269821 ?auto_269831 ) ) ( not ( = ?auto_269821 ?auto_269832 ) ) ( not ( = ?auto_269822 ?auto_269823 ) ) ( not ( = ?auto_269822 ?auto_269824 ) ) ( not ( = ?auto_269822 ?auto_269825 ) ) ( not ( = ?auto_269822 ?auto_269826 ) ) ( not ( = ?auto_269822 ?auto_269827 ) ) ( not ( = ?auto_269822 ?auto_269828 ) ) ( not ( = ?auto_269822 ?auto_269829 ) ) ( not ( = ?auto_269822 ?auto_269830 ) ) ( not ( = ?auto_269822 ?auto_269831 ) ) ( not ( = ?auto_269822 ?auto_269832 ) ) ( not ( = ?auto_269823 ?auto_269824 ) ) ( not ( = ?auto_269823 ?auto_269825 ) ) ( not ( = ?auto_269823 ?auto_269826 ) ) ( not ( = ?auto_269823 ?auto_269827 ) ) ( not ( = ?auto_269823 ?auto_269828 ) ) ( not ( = ?auto_269823 ?auto_269829 ) ) ( not ( = ?auto_269823 ?auto_269830 ) ) ( not ( = ?auto_269823 ?auto_269831 ) ) ( not ( = ?auto_269823 ?auto_269832 ) ) ( not ( = ?auto_269824 ?auto_269825 ) ) ( not ( = ?auto_269824 ?auto_269826 ) ) ( not ( = ?auto_269824 ?auto_269827 ) ) ( not ( = ?auto_269824 ?auto_269828 ) ) ( not ( = ?auto_269824 ?auto_269829 ) ) ( not ( = ?auto_269824 ?auto_269830 ) ) ( not ( = ?auto_269824 ?auto_269831 ) ) ( not ( = ?auto_269824 ?auto_269832 ) ) ( not ( = ?auto_269825 ?auto_269826 ) ) ( not ( = ?auto_269825 ?auto_269827 ) ) ( not ( = ?auto_269825 ?auto_269828 ) ) ( not ( = ?auto_269825 ?auto_269829 ) ) ( not ( = ?auto_269825 ?auto_269830 ) ) ( not ( = ?auto_269825 ?auto_269831 ) ) ( not ( = ?auto_269825 ?auto_269832 ) ) ( not ( = ?auto_269826 ?auto_269827 ) ) ( not ( = ?auto_269826 ?auto_269828 ) ) ( not ( = ?auto_269826 ?auto_269829 ) ) ( not ( = ?auto_269826 ?auto_269830 ) ) ( not ( = ?auto_269826 ?auto_269831 ) ) ( not ( = ?auto_269826 ?auto_269832 ) ) ( not ( = ?auto_269827 ?auto_269828 ) ) ( not ( = ?auto_269827 ?auto_269829 ) ) ( not ( = ?auto_269827 ?auto_269830 ) ) ( not ( = ?auto_269827 ?auto_269831 ) ) ( not ( = ?auto_269827 ?auto_269832 ) ) ( not ( = ?auto_269828 ?auto_269829 ) ) ( not ( = ?auto_269828 ?auto_269830 ) ) ( not ( = ?auto_269828 ?auto_269831 ) ) ( not ( = ?auto_269828 ?auto_269832 ) ) ( not ( = ?auto_269829 ?auto_269830 ) ) ( not ( = ?auto_269829 ?auto_269831 ) ) ( not ( = ?auto_269829 ?auto_269832 ) ) ( not ( = ?auto_269830 ?auto_269831 ) ) ( not ( = ?auto_269830 ?auto_269832 ) ) ( not ( = ?auto_269831 ?auto_269832 ) ) ( ON ?auto_269830 ?auto_269831 ) ( ON ?auto_269829 ?auto_269830 ) ( ON ?auto_269828 ?auto_269829 ) ( CLEAR ?auto_269826 ) ( ON ?auto_269827 ?auto_269828 ) ( CLEAR ?auto_269827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269821 ?auto_269822 ?auto_269823 ?auto_269824 ?auto_269825 ?auto_269826 ?auto_269827 )
      ( MAKE-11PILE ?auto_269821 ?auto_269822 ?auto_269823 ?auto_269824 ?auto_269825 ?auto_269826 ?auto_269827 ?auto_269828 ?auto_269829 ?auto_269830 ?auto_269831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269867 - BLOCK
      ?auto_269868 - BLOCK
      ?auto_269869 - BLOCK
      ?auto_269870 - BLOCK
      ?auto_269871 - BLOCK
      ?auto_269872 - BLOCK
      ?auto_269873 - BLOCK
      ?auto_269874 - BLOCK
      ?auto_269875 - BLOCK
      ?auto_269876 - BLOCK
      ?auto_269877 - BLOCK
    )
    :vars
    (
      ?auto_269878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269877 ?auto_269878 ) ( ON-TABLE ?auto_269867 ) ( ON ?auto_269868 ?auto_269867 ) ( ON ?auto_269869 ?auto_269868 ) ( ON ?auto_269870 ?auto_269869 ) ( ON ?auto_269871 ?auto_269870 ) ( not ( = ?auto_269867 ?auto_269868 ) ) ( not ( = ?auto_269867 ?auto_269869 ) ) ( not ( = ?auto_269867 ?auto_269870 ) ) ( not ( = ?auto_269867 ?auto_269871 ) ) ( not ( = ?auto_269867 ?auto_269872 ) ) ( not ( = ?auto_269867 ?auto_269873 ) ) ( not ( = ?auto_269867 ?auto_269874 ) ) ( not ( = ?auto_269867 ?auto_269875 ) ) ( not ( = ?auto_269867 ?auto_269876 ) ) ( not ( = ?auto_269867 ?auto_269877 ) ) ( not ( = ?auto_269867 ?auto_269878 ) ) ( not ( = ?auto_269868 ?auto_269869 ) ) ( not ( = ?auto_269868 ?auto_269870 ) ) ( not ( = ?auto_269868 ?auto_269871 ) ) ( not ( = ?auto_269868 ?auto_269872 ) ) ( not ( = ?auto_269868 ?auto_269873 ) ) ( not ( = ?auto_269868 ?auto_269874 ) ) ( not ( = ?auto_269868 ?auto_269875 ) ) ( not ( = ?auto_269868 ?auto_269876 ) ) ( not ( = ?auto_269868 ?auto_269877 ) ) ( not ( = ?auto_269868 ?auto_269878 ) ) ( not ( = ?auto_269869 ?auto_269870 ) ) ( not ( = ?auto_269869 ?auto_269871 ) ) ( not ( = ?auto_269869 ?auto_269872 ) ) ( not ( = ?auto_269869 ?auto_269873 ) ) ( not ( = ?auto_269869 ?auto_269874 ) ) ( not ( = ?auto_269869 ?auto_269875 ) ) ( not ( = ?auto_269869 ?auto_269876 ) ) ( not ( = ?auto_269869 ?auto_269877 ) ) ( not ( = ?auto_269869 ?auto_269878 ) ) ( not ( = ?auto_269870 ?auto_269871 ) ) ( not ( = ?auto_269870 ?auto_269872 ) ) ( not ( = ?auto_269870 ?auto_269873 ) ) ( not ( = ?auto_269870 ?auto_269874 ) ) ( not ( = ?auto_269870 ?auto_269875 ) ) ( not ( = ?auto_269870 ?auto_269876 ) ) ( not ( = ?auto_269870 ?auto_269877 ) ) ( not ( = ?auto_269870 ?auto_269878 ) ) ( not ( = ?auto_269871 ?auto_269872 ) ) ( not ( = ?auto_269871 ?auto_269873 ) ) ( not ( = ?auto_269871 ?auto_269874 ) ) ( not ( = ?auto_269871 ?auto_269875 ) ) ( not ( = ?auto_269871 ?auto_269876 ) ) ( not ( = ?auto_269871 ?auto_269877 ) ) ( not ( = ?auto_269871 ?auto_269878 ) ) ( not ( = ?auto_269872 ?auto_269873 ) ) ( not ( = ?auto_269872 ?auto_269874 ) ) ( not ( = ?auto_269872 ?auto_269875 ) ) ( not ( = ?auto_269872 ?auto_269876 ) ) ( not ( = ?auto_269872 ?auto_269877 ) ) ( not ( = ?auto_269872 ?auto_269878 ) ) ( not ( = ?auto_269873 ?auto_269874 ) ) ( not ( = ?auto_269873 ?auto_269875 ) ) ( not ( = ?auto_269873 ?auto_269876 ) ) ( not ( = ?auto_269873 ?auto_269877 ) ) ( not ( = ?auto_269873 ?auto_269878 ) ) ( not ( = ?auto_269874 ?auto_269875 ) ) ( not ( = ?auto_269874 ?auto_269876 ) ) ( not ( = ?auto_269874 ?auto_269877 ) ) ( not ( = ?auto_269874 ?auto_269878 ) ) ( not ( = ?auto_269875 ?auto_269876 ) ) ( not ( = ?auto_269875 ?auto_269877 ) ) ( not ( = ?auto_269875 ?auto_269878 ) ) ( not ( = ?auto_269876 ?auto_269877 ) ) ( not ( = ?auto_269876 ?auto_269878 ) ) ( not ( = ?auto_269877 ?auto_269878 ) ) ( ON ?auto_269876 ?auto_269877 ) ( ON ?auto_269875 ?auto_269876 ) ( ON ?auto_269874 ?auto_269875 ) ( ON ?auto_269873 ?auto_269874 ) ( CLEAR ?auto_269871 ) ( ON ?auto_269872 ?auto_269873 ) ( CLEAR ?auto_269872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269867 ?auto_269868 ?auto_269869 ?auto_269870 ?auto_269871 ?auto_269872 )
      ( MAKE-11PILE ?auto_269867 ?auto_269868 ?auto_269869 ?auto_269870 ?auto_269871 ?auto_269872 ?auto_269873 ?auto_269874 ?auto_269875 ?auto_269876 ?auto_269877 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269913 - BLOCK
      ?auto_269914 - BLOCK
      ?auto_269915 - BLOCK
      ?auto_269916 - BLOCK
      ?auto_269917 - BLOCK
      ?auto_269918 - BLOCK
      ?auto_269919 - BLOCK
      ?auto_269920 - BLOCK
      ?auto_269921 - BLOCK
      ?auto_269922 - BLOCK
      ?auto_269923 - BLOCK
    )
    :vars
    (
      ?auto_269924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269923 ?auto_269924 ) ( ON-TABLE ?auto_269913 ) ( ON ?auto_269914 ?auto_269913 ) ( ON ?auto_269915 ?auto_269914 ) ( ON ?auto_269916 ?auto_269915 ) ( not ( = ?auto_269913 ?auto_269914 ) ) ( not ( = ?auto_269913 ?auto_269915 ) ) ( not ( = ?auto_269913 ?auto_269916 ) ) ( not ( = ?auto_269913 ?auto_269917 ) ) ( not ( = ?auto_269913 ?auto_269918 ) ) ( not ( = ?auto_269913 ?auto_269919 ) ) ( not ( = ?auto_269913 ?auto_269920 ) ) ( not ( = ?auto_269913 ?auto_269921 ) ) ( not ( = ?auto_269913 ?auto_269922 ) ) ( not ( = ?auto_269913 ?auto_269923 ) ) ( not ( = ?auto_269913 ?auto_269924 ) ) ( not ( = ?auto_269914 ?auto_269915 ) ) ( not ( = ?auto_269914 ?auto_269916 ) ) ( not ( = ?auto_269914 ?auto_269917 ) ) ( not ( = ?auto_269914 ?auto_269918 ) ) ( not ( = ?auto_269914 ?auto_269919 ) ) ( not ( = ?auto_269914 ?auto_269920 ) ) ( not ( = ?auto_269914 ?auto_269921 ) ) ( not ( = ?auto_269914 ?auto_269922 ) ) ( not ( = ?auto_269914 ?auto_269923 ) ) ( not ( = ?auto_269914 ?auto_269924 ) ) ( not ( = ?auto_269915 ?auto_269916 ) ) ( not ( = ?auto_269915 ?auto_269917 ) ) ( not ( = ?auto_269915 ?auto_269918 ) ) ( not ( = ?auto_269915 ?auto_269919 ) ) ( not ( = ?auto_269915 ?auto_269920 ) ) ( not ( = ?auto_269915 ?auto_269921 ) ) ( not ( = ?auto_269915 ?auto_269922 ) ) ( not ( = ?auto_269915 ?auto_269923 ) ) ( not ( = ?auto_269915 ?auto_269924 ) ) ( not ( = ?auto_269916 ?auto_269917 ) ) ( not ( = ?auto_269916 ?auto_269918 ) ) ( not ( = ?auto_269916 ?auto_269919 ) ) ( not ( = ?auto_269916 ?auto_269920 ) ) ( not ( = ?auto_269916 ?auto_269921 ) ) ( not ( = ?auto_269916 ?auto_269922 ) ) ( not ( = ?auto_269916 ?auto_269923 ) ) ( not ( = ?auto_269916 ?auto_269924 ) ) ( not ( = ?auto_269917 ?auto_269918 ) ) ( not ( = ?auto_269917 ?auto_269919 ) ) ( not ( = ?auto_269917 ?auto_269920 ) ) ( not ( = ?auto_269917 ?auto_269921 ) ) ( not ( = ?auto_269917 ?auto_269922 ) ) ( not ( = ?auto_269917 ?auto_269923 ) ) ( not ( = ?auto_269917 ?auto_269924 ) ) ( not ( = ?auto_269918 ?auto_269919 ) ) ( not ( = ?auto_269918 ?auto_269920 ) ) ( not ( = ?auto_269918 ?auto_269921 ) ) ( not ( = ?auto_269918 ?auto_269922 ) ) ( not ( = ?auto_269918 ?auto_269923 ) ) ( not ( = ?auto_269918 ?auto_269924 ) ) ( not ( = ?auto_269919 ?auto_269920 ) ) ( not ( = ?auto_269919 ?auto_269921 ) ) ( not ( = ?auto_269919 ?auto_269922 ) ) ( not ( = ?auto_269919 ?auto_269923 ) ) ( not ( = ?auto_269919 ?auto_269924 ) ) ( not ( = ?auto_269920 ?auto_269921 ) ) ( not ( = ?auto_269920 ?auto_269922 ) ) ( not ( = ?auto_269920 ?auto_269923 ) ) ( not ( = ?auto_269920 ?auto_269924 ) ) ( not ( = ?auto_269921 ?auto_269922 ) ) ( not ( = ?auto_269921 ?auto_269923 ) ) ( not ( = ?auto_269921 ?auto_269924 ) ) ( not ( = ?auto_269922 ?auto_269923 ) ) ( not ( = ?auto_269922 ?auto_269924 ) ) ( not ( = ?auto_269923 ?auto_269924 ) ) ( ON ?auto_269922 ?auto_269923 ) ( ON ?auto_269921 ?auto_269922 ) ( ON ?auto_269920 ?auto_269921 ) ( ON ?auto_269919 ?auto_269920 ) ( ON ?auto_269918 ?auto_269919 ) ( CLEAR ?auto_269916 ) ( ON ?auto_269917 ?auto_269918 ) ( CLEAR ?auto_269917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269913 ?auto_269914 ?auto_269915 ?auto_269916 ?auto_269917 )
      ( MAKE-11PILE ?auto_269913 ?auto_269914 ?auto_269915 ?auto_269916 ?auto_269917 ?auto_269918 ?auto_269919 ?auto_269920 ?auto_269921 ?auto_269922 ?auto_269923 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269959 - BLOCK
      ?auto_269960 - BLOCK
      ?auto_269961 - BLOCK
      ?auto_269962 - BLOCK
      ?auto_269963 - BLOCK
      ?auto_269964 - BLOCK
      ?auto_269965 - BLOCK
      ?auto_269966 - BLOCK
      ?auto_269967 - BLOCK
      ?auto_269968 - BLOCK
      ?auto_269969 - BLOCK
    )
    :vars
    (
      ?auto_269970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269969 ?auto_269970 ) ( ON-TABLE ?auto_269959 ) ( ON ?auto_269960 ?auto_269959 ) ( ON ?auto_269961 ?auto_269960 ) ( not ( = ?auto_269959 ?auto_269960 ) ) ( not ( = ?auto_269959 ?auto_269961 ) ) ( not ( = ?auto_269959 ?auto_269962 ) ) ( not ( = ?auto_269959 ?auto_269963 ) ) ( not ( = ?auto_269959 ?auto_269964 ) ) ( not ( = ?auto_269959 ?auto_269965 ) ) ( not ( = ?auto_269959 ?auto_269966 ) ) ( not ( = ?auto_269959 ?auto_269967 ) ) ( not ( = ?auto_269959 ?auto_269968 ) ) ( not ( = ?auto_269959 ?auto_269969 ) ) ( not ( = ?auto_269959 ?auto_269970 ) ) ( not ( = ?auto_269960 ?auto_269961 ) ) ( not ( = ?auto_269960 ?auto_269962 ) ) ( not ( = ?auto_269960 ?auto_269963 ) ) ( not ( = ?auto_269960 ?auto_269964 ) ) ( not ( = ?auto_269960 ?auto_269965 ) ) ( not ( = ?auto_269960 ?auto_269966 ) ) ( not ( = ?auto_269960 ?auto_269967 ) ) ( not ( = ?auto_269960 ?auto_269968 ) ) ( not ( = ?auto_269960 ?auto_269969 ) ) ( not ( = ?auto_269960 ?auto_269970 ) ) ( not ( = ?auto_269961 ?auto_269962 ) ) ( not ( = ?auto_269961 ?auto_269963 ) ) ( not ( = ?auto_269961 ?auto_269964 ) ) ( not ( = ?auto_269961 ?auto_269965 ) ) ( not ( = ?auto_269961 ?auto_269966 ) ) ( not ( = ?auto_269961 ?auto_269967 ) ) ( not ( = ?auto_269961 ?auto_269968 ) ) ( not ( = ?auto_269961 ?auto_269969 ) ) ( not ( = ?auto_269961 ?auto_269970 ) ) ( not ( = ?auto_269962 ?auto_269963 ) ) ( not ( = ?auto_269962 ?auto_269964 ) ) ( not ( = ?auto_269962 ?auto_269965 ) ) ( not ( = ?auto_269962 ?auto_269966 ) ) ( not ( = ?auto_269962 ?auto_269967 ) ) ( not ( = ?auto_269962 ?auto_269968 ) ) ( not ( = ?auto_269962 ?auto_269969 ) ) ( not ( = ?auto_269962 ?auto_269970 ) ) ( not ( = ?auto_269963 ?auto_269964 ) ) ( not ( = ?auto_269963 ?auto_269965 ) ) ( not ( = ?auto_269963 ?auto_269966 ) ) ( not ( = ?auto_269963 ?auto_269967 ) ) ( not ( = ?auto_269963 ?auto_269968 ) ) ( not ( = ?auto_269963 ?auto_269969 ) ) ( not ( = ?auto_269963 ?auto_269970 ) ) ( not ( = ?auto_269964 ?auto_269965 ) ) ( not ( = ?auto_269964 ?auto_269966 ) ) ( not ( = ?auto_269964 ?auto_269967 ) ) ( not ( = ?auto_269964 ?auto_269968 ) ) ( not ( = ?auto_269964 ?auto_269969 ) ) ( not ( = ?auto_269964 ?auto_269970 ) ) ( not ( = ?auto_269965 ?auto_269966 ) ) ( not ( = ?auto_269965 ?auto_269967 ) ) ( not ( = ?auto_269965 ?auto_269968 ) ) ( not ( = ?auto_269965 ?auto_269969 ) ) ( not ( = ?auto_269965 ?auto_269970 ) ) ( not ( = ?auto_269966 ?auto_269967 ) ) ( not ( = ?auto_269966 ?auto_269968 ) ) ( not ( = ?auto_269966 ?auto_269969 ) ) ( not ( = ?auto_269966 ?auto_269970 ) ) ( not ( = ?auto_269967 ?auto_269968 ) ) ( not ( = ?auto_269967 ?auto_269969 ) ) ( not ( = ?auto_269967 ?auto_269970 ) ) ( not ( = ?auto_269968 ?auto_269969 ) ) ( not ( = ?auto_269968 ?auto_269970 ) ) ( not ( = ?auto_269969 ?auto_269970 ) ) ( ON ?auto_269968 ?auto_269969 ) ( ON ?auto_269967 ?auto_269968 ) ( ON ?auto_269966 ?auto_269967 ) ( ON ?auto_269965 ?auto_269966 ) ( ON ?auto_269964 ?auto_269965 ) ( ON ?auto_269963 ?auto_269964 ) ( CLEAR ?auto_269961 ) ( ON ?auto_269962 ?auto_269963 ) ( CLEAR ?auto_269962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269959 ?auto_269960 ?auto_269961 ?auto_269962 )
      ( MAKE-11PILE ?auto_269959 ?auto_269960 ?auto_269961 ?auto_269962 ?auto_269963 ?auto_269964 ?auto_269965 ?auto_269966 ?auto_269967 ?auto_269968 ?auto_269969 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270005 - BLOCK
      ?auto_270006 - BLOCK
      ?auto_270007 - BLOCK
      ?auto_270008 - BLOCK
      ?auto_270009 - BLOCK
      ?auto_270010 - BLOCK
      ?auto_270011 - BLOCK
      ?auto_270012 - BLOCK
      ?auto_270013 - BLOCK
      ?auto_270014 - BLOCK
      ?auto_270015 - BLOCK
    )
    :vars
    (
      ?auto_270016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270015 ?auto_270016 ) ( ON-TABLE ?auto_270005 ) ( ON ?auto_270006 ?auto_270005 ) ( not ( = ?auto_270005 ?auto_270006 ) ) ( not ( = ?auto_270005 ?auto_270007 ) ) ( not ( = ?auto_270005 ?auto_270008 ) ) ( not ( = ?auto_270005 ?auto_270009 ) ) ( not ( = ?auto_270005 ?auto_270010 ) ) ( not ( = ?auto_270005 ?auto_270011 ) ) ( not ( = ?auto_270005 ?auto_270012 ) ) ( not ( = ?auto_270005 ?auto_270013 ) ) ( not ( = ?auto_270005 ?auto_270014 ) ) ( not ( = ?auto_270005 ?auto_270015 ) ) ( not ( = ?auto_270005 ?auto_270016 ) ) ( not ( = ?auto_270006 ?auto_270007 ) ) ( not ( = ?auto_270006 ?auto_270008 ) ) ( not ( = ?auto_270006 ?auto_270009 ) ) ( not ( = ?auto_270006 ?auto_270010 ) ) ( not ( = ?auto_270006 ?auto_270011 ) ) ( not ( = ?auto_270006 ?auto_270012 ) ) ( not ( = ?auto_270006 ?auto_270013 ) ) ( not ( = ?auto_270006 ?auto_270014 ) ) ( not ( = ?auto_270006 ?auto_270015 ) ) ( not ( = ?auto_270006 ?auto_270016 ) ) ( not ( = ?auto_270007 ?auto_270008 ) ) ( not ( = ?auto_270007 ?auto_270009 ) ) ( not ( = ?auto_270007 ?auto_270010 ) ) ( not ( = ?auto_270007 ?auto_270011 ) ) ( not ( = ?auto_270007 ?auto_270012 ) ) ( not ( = ?auto_270007 ?auto_270013 ) ) ( not ( = ?auto_270007 ?auto_270014 ) ) ( not ( = ?auto_270007 ?auto_270015 ) ) ( not ( = ?auto_270007 ?auto_270016 ) ) ( not ( = ?auto_270008 ?auto_270009 ) ) ( not ( = ?auto_270008 ?auto_270010 ) ) ( not ( = ?auto_270008 ?auto_270011 ) ) ( not ( = ?auto_270008 ?auto_270012 ) ) ( not ( = ?auto_270008 ?auto_270013 ) ) ( not ( = ?auto_270008 ?auto_270014 ) ) ( not ( = ?auto_270008 ?auto_270015 ) ) ( not ( = ?auto_270008 ?auto_270016 ) ) ( not ( = ?auto_270009 ?auto_270010 ) ) ( not ( = ?auto_270009 ?auto_270011 ) ) ( not ( = ?auto_270009 ?auto_270012 ) ) ( not ( = ?auto_270009 ?auto_270013 ) ) ( not ( = ?auto_270009 ?auto_270014 ) ) ( not ( = ?auto_270009 ?auto_270015 ) ) ( not ( = ?auto_270009 ?auto_270016 ) ) ( not ( = ?auto_270010 ?auto_270011 ) ) ( not ( = ?auto_270010 ?auto_270012 ) ) ( not ( = ?auto_270010 ?auto_270013 ) ) ( not ( = ?auto_270010 ?auto_270014 ) ) ( not ( = ?auto_270010 ?auto_270015 ) ) ( not ( = ?auto_270010 ?auto_270016 ) ) ( not ( = ?auto_270011 ?auto_270012 ) ) ( not ( = ?auto_270011 ?auto_270013 ) ) ( not ( = ?auto_270011 ?auto_270014 ) ) ( not ( = ?auto_270011 ?auto_270015 ) ) ( not ( = ?auto_270011 ?auto_270016 ) ) ( not ( = ?auto_270012 ?auto_270013 ) ) ( not ( = ?auto_270012 ?auto_270014 ) ) ( not ( = ?auto_270012 ?auto_270015 ) ) ( not ( = ?auto_270012 ?auto_270016 ) ) ( not ( = ?auto_270013 ?auto_270014 ) ) ( not ( = ?auto_270013 ?auto_270015 ) ) ( not ( = ?auto_270013 ?auto_270016 ) ) ( not ( = ?auto_270014 ?auto_270015 ) ) ( not ( = ?auto_270014 ?auto_270016 ) ) ( not ( = ?auto_270015 ?auto_270016 ) ) ( ON ?auto_270014 ?auto_270015 ) ( ON ?auto_270013 ?auto_270014 ) ( ON ?auto_270012 ?auto_270013 ) ( ON ?auto_270011 ?auto_270012 ) ( ON ?auto_270010 ?auto_270011 ) ( ON ?auto_270009 ?auto_270010 ) ( ON ?auto_270008 ?auto_270009 ) ( CLEAR ?auto_270006 ) ( ON ?auto_270007 ?auto_270008 ) ( CLEAR ?auto_270007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270005 ?auto_270006 ?auto_270007 )
      ( MAKE-11PILE ?auto_270005 ?auto_270006 ?auto_270007 ?auto_270008 ?auto_270009 ?auto_270010 ?auto_270011 ?auto_270012 ?auto_270013 ?auto_270014 ?auto_270015 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270051 - BLOCK
      ?auto_270052 - BLOCK
      ?auto_270053 - BLOCK
      ?auto_270054 - BLOCK
      ?auto_270055 - BLOCK
      ?auto_270056 - BLOCK
      ?auto_270057 - BLOCK
      ?auto_270058 - BLOCK
      ?auto_270059 - BLOCK
      ?auto_270060 - BLOCK
      ?auto_270061 - BLOCK
    )
    :vars
    (
      ?auto_270062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270061 ?auto_270062 ) ( ON-TABLE ?auto_270051 ) ( not ( = ?auto_270051 ?auto_270052 ) ) ( not ( = ?auto_270051 ?auto_270053 ) ) ( not ( = ?auto_270051 ?auto_270054 ) ) ( not ( = ?auto_270051 ?auto_270055 ) ) ( not ( = ?auto_270051 ?auto_270056 ) ) ( not ( = ?auto_270051 ?auto_270057 ) ) ( not ( = ?auto_270051 ?auto_270058 ) ) ( not ( = ?auto_270051 ?auto_270059 ) ) ( not ( = ?auto_270051 ?auto_270060 ) ) ( not ( = ?auto_270051 ?auto_270061 ) ) ( not ( = ?auto_270051 ?auto_270062 ) ) ( not ( = ?auto_270052 ?auto_270053 ) ) ( not ( = ?auto_270052 ?auto_270054 ) ) ( not ( = ?auto_270052 ?auto_270055 ) ) ( not ( = ?auto_270052 ?auto_270056 ) ) ( not ( = ?auto_270052 ?auto_270057 ) ) ( not ( = ?auto_270052 ?auto_270058 ) ) ( not ( = ?auto_270052 ?auto_270059 ) ) ( not ( = ?auto_270052 ?auto_270060 ) ) ( not ( = ?auto_270052 ?auto_270061 ) ) ( not ( = ?auto_270052 ?auto_270062 ) ) ( not ( = ?auto_270053 ?auto_270054 ) ) ( not ( = ?auto_270053 ?auto_270055 ) ) ( not ( = ?auto_270053 ?auto_270056 ) ) ( not ( = ?auto_270053 ?auto_270057 ) ) ( not ( = ?auto_270053 ?auto_270058 ) ) ( not ( = ?auto_270053 ?auto_270059 ) ) ( not ( = ?auto_270053 ?auto_270060 ) ) ( not ( = ?auto_270053 ?auto_270061 ) ) ( not ( = ?auto_270053 ?auto_270062 ) ) ( not ( = ?auto_270054 ?auto_270055 ) ) ( not ( = ?auto_270054 ?auto_270056 ) ) ( not ( = ?auto_270054 ?auto_270057 ) ) ( not ( = ?auto_270054 ?auto_270058 ) ) ( not ( = ?auto_270054 ?auto_270059 ) ) ( not ( = ?auto_270054 ?auto_270060 ) ) ( not ( = ?auto_270054 ?auto_270061 ) ) ( not ( = ?auto_270054 ?auto_270062 ) ) ( not ( = ?auto_270055 ?auto_270056 ) ) ( not ( = ?auto_270055 ?auto_270057 ) ) ( not ( = ?auto_270055 ?auto_270058 ) ) ( not ( = ?auto_270055 ?auto_270059 ) ) ( not ( = ?auto_270055 ?auto_270060 ) ) ( not ( = ?auto_270055 ?auto_270061 ) ) ( not ( = ?auto_270055 ?auto_270062 ) ) ( not ( = ?auto_270056 ?auto_270057 ) ) ( not ( = ?auto_270056 ?auto_270058 ) ) ( not ( = ?auto_270056 ?auto_270059 ) ) ( not ( = ?auto_270056 ?auto_270060 ) ) ( not ( = ?auto_270056 ?auto_270061 ) ) ( not ( = ?auto_270056 ?auto_270062 ) ) ( not ( = ?auto_270057 ?auto_270058 ) ) ( not ( = ?auto_270057 ?auto_270059 ) ) ( not ( = ?auto_270057 ?auto_270060 ) ) ( not ( = ?auto_270057 ?auto_270061 ) ) ( not ( = ?auto_270057 ?auto_270062 ) ) ( not ( = ?auto_270058 ?auto_270059 ) ) ( not ( = ?auto_270058 ?auto_270060 ) ) ( not ( = ?auto_270058 ?auto_270061 ) ) ( not ( = ?auto_270058 ?auto_270062 ) ) ( not ( = ?auto_270059 ?auto_270060 ) ) ( not ( = ?auto_270059 ?auto_270061 ) ) ( not ( = ?auto_270059 ?auto_270062 ) ) ( not ( = ?auto_270060 ?auto_270061 ) ) ( not ( = ?auto_270060 ?auto_270062 ) ) ( not ( = ?auto_270061 ?auto_270062 ) ) ( ON ?auto_270060 ?auto_270061 ) ( ON ?auto_270059 ?auto_270060 ) ( ON ?auto_270058 ?auto_270059 ) ( ON ?auto_270057 ?auto_270058 ) ( ON ?auto_270056 ?auto_270057 ) ( ON ?auto_270055 ?auto_270056 ) ( ON ?auto_270054 ?auto_270055 ) ( ON ?auto_270053 ?auto_270054 ) ( CLEAR ?auto_270051 ) ( ON ?auto_270052 ?auto_270053 ) ( CLEAR ?auto_270052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270051 ?auto_270052 )
      ( MAKE-11PILE ?auto_270051 ?auto_270052 ?auto_270053 ?auto_270054 ?auto_270055 ?auto_270056 ?auto_270057 ?auto_270058 ?auto_270059 ?auto_270060 ?auto_270061 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270097 - BLOCK
      ?auto_270098 - BLOCK
      ?auto_270099 - BLOCK
      ?auto_270100 - BLOCK
      ?auto_270101 - BLOCK
      ?auto_270102 - BLOCK
      ?auto_270103 - BLOCK
      ?auto_270104 - BLOCK
      ?auto_270105 - BLOCK
      ?auto_270106 - BLOCK
      ?auto_270107 - BLOCK
    )
    :vars
    (
      ?auto_270108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270107 ?auto_270108 ) ( not ( = ?auto_270097 ?auto_270098 ) ) ( not ( = ?auto_270097 ?auto_270099 ) ) ( not ( = ?auto_270097 ?auto_270100 ) ) ( not ( = ?auto_270097 ?auto_270101 ) ) ( not ( = ?auto_270097 ?auto_270102 ) ) ( not ( = ?auto_270097 ?auto_270103 ) ) ( not ( = ?auto_270097 ?auto_270104 ) ) ( not ( = ?auto_270097 ?auto_270105 ) ) ( not ( = ?auto_270097 ?auto_270106 ) ) ( not ( = ?auto_270097 ?auto_270107 ) ) ( not ( = ?auto_270097 ?auto_270108 ) ) ( not ( = ?auto_270098 ?auto_270099 ) ) ( not ( = ?auto_270098 ?auto_270100 ) ) ( not ( = ?auto_270098 ?auto_270101 ) ) ( not ( = ?auto_270098 ?auto_270102 ) ) ( not ( = ?auto_270098 ?auto_270103 ) ) ( not ( = ?auto_270098 ?auto_270104 ) ) ( not ( = ?auto_270098 ?auto_270105 ) ) ( not ( = ?auto_270098 ?auto_270106 ) ) ( not ( = ?auto_270098 ?auto_270107 ) ) ( not ( = ?auto_270098 ?auto_270108 ) ) ( not ( = ?auto_270099 ?auto_270100 ) ) ( not ( = ?auto_270099 ?auto_270101 ) ) ( not ( = ?auto_270099 ?auto_270102 ) ) ( not ( = ?auto_270099 ?auto_270103 ) ) ( not ( = ?auto_270099 ?auto_270104 ) ) ( not ( = ?auto_270099 ?auto_270105 ) ) ( not ( = ?auto_270099 ?auto_270106 ) ) ( not ( = ?auto_270099 ?auto_270107 ) ) ( not ( = ?auto_270099 ?auto_270108 ) ) ( not ( = ?auto_270100 ?auto_270101 ) ) ( not ( = ?auto_270100 ?auto_270102 ) ) ( not ( = ?auto_270100 ?auto_270103 ) ) ( not ( = ?auto_270100 ?auto_270104 ) ) ( not ( = ?auto_270100 ?auto_270105 ) ) ( not ( = ?auto_270100 ?auto_270106 ) ) ( not ( = ?auto_270100 ?auto_270107 ) ) ( not ( = ?auto_270100 ?auto_270108 ) ) ( not ( = ?auto_270101 ?auto_270102 ) ) ( not ( = ?auto_270101 ?auto_270103 ) ) ( not ( = ?auto_270101 ?auto_270104 ) ) ( not ( = ?auto_270101 ?auto_270105 ) ) ( not ( = ?auto_270101 ?auto_270106 ) ) ( not ( = ?auto_270101 ?auto_270107 ) ) ( not ( = ?auto_270101 ?auto_270108 ) ) ( not ( = ?auto_270102 ?auto_270103 ) ) ( not ( = ?auto_270102 ?auto_270104 ) ) ( not ( = ?auto_270102 ?auto_270105 ) ) ( not ( = ?auto_270102 ?auto_270106 ) ) ( not ( = ?auto_270102 ?auto_270107 ) ) ( not ( = ?auto_270102 ?auto_270108 ) ) ( not ( = ?auto_270103 ?auto_270104 ) ) ( not ( = ?auto_270103 ?auto_270105 ) ) ( not ( = ?auto_270103 ?auto_270106 ) ) ( not ( = ?auto_270103 ?auto_270107 ) ) ( not ( = ?auto_270103 ?auto_270108 ) ) ( not ( = ?auto_270104 ?auto_270105 ) ) ( not ( = ?auto_270104 ?auto_270106 ) ) ( not ( = ?auto_270104 ?auto_270107 ) ) ( not ( = ?auto_270104 ?auto_270108 ) ) ( not ( = ?auto_270105 ?auto_270106 ) ) ( not ( = ?auto_270105 ?auto_270107 ) ) ( not ( = ?auto_270105 ?auto_270108 ) ) ( not ( = ?auto_270106 ?auto_270107 ) ) ( not ( = ?auto_270106 ?auto_270108 ) ) ( not ( = ?auto_270107 ?auto_270108 ) ) ( ON ?auto_270106 ?auto_270107 ) ( ON ?auto_270105 ?auto_270106 ) ( ON ?auto_270104 ?auto_270105 ) ( ON ?auto_270103 ?auto_270104 ) ( ON ?auto_270102 ?auto_270103 ) ( ON ?auto_270101 ?auto_270102 ) ( ON ?auto_270100 ?auto_270101 ) ( ON ?auto_270099 ?auto_270100 ) ( ON ?auto_270098 ?auto_270099 ) ( ON ?auto_270097 ?auto_270098 ) ( CLEAR ?auto_270097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270097 )
      ( MAKE-11PILE ?auto_270097 ?auto_270098 ?auto_270099 ?auto_270100 ?auto_270101 ?auto_270102 ?auto_270103 ?auto_270104 ?auto_270105 ?auto_270106 ?auto_270107 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270144 - BLOCK
      ?auto_270145 - BLOCK
      ?auto_270146 - BLOCK
      ?auto_270147 - BLOCK
      ?auto_270148 - BLOCK
      ?auto_270149 - BLOCK
      ?auto_270150 - BLOCK
      ?auto_270151 - BLOCK
      ?auto_270152 - BLOCK
      ?auto_270153 - BLOCK
      ?auto_270154 - BLOCK
      ?auto_270155 - BLOCK
    )
    :vars
    (
      ?auto_270156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270154 ) ( ON ?auto_270155 ?auto_270156 ) ( CLEAR ?auto_270155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270144 ) ( ON ?auto_270145 ?auto_270144 ) ( ON ?auto_270146 ?auto_270145 ) ( ON ?auto_270147 ?auto_270146 ) ( ON ?auto_270148 ?auto_270147 ) ( ON ?auto_270149 ?auto_270148 ) ( ON ?auto_270150 ?auto_270149 ) ( ON ?auto_270151 ?auto_270150 ) ( ON ?auto_270152 ?auto_270151 ) ( ON ?auto_270153 ?auto_270152 ) ( ON ?auto_270154 ?auto_270153 ) ( not ( = ?auto_270144 ?auto_270145 ) ) ( not ( = ?auto_270144 ?auto_270146 ) ) ( not ( = ?auto_270144 ?auto_270147 ) ) ( not ( = ?auto_270144 ?auto_270148 ) ) ( not ( = ?auto_270144 ?auto_270149 ) ) ( not ( = ?auto_270144 ?auto_270150 ) ) ( not ( = ?auto_270144 ?auto_270151 ) ) ( not ( = ?auto_270144 ?auto_270152 ) ) ( not ( = ?auto_270144 ?auto_270153 ) ) ( not ( = ?auto_270144 ?auto_270154 ) ) ( not ( = ?auto_270144 ?auto_270155 ) ) ( not ( = ?auto_270144 ?auto_270156 ) ) ( not ( = ?auto_270145 ?auto_270146 ) ) ( not ( = ?auto_270145 ?auto_270147 ) ) ( not ( = ?auto_270145 ?auto_270148 ) ) ( not ( = ?auto_270145 ?auto_270149 ) ) ( not ( = ?auto_270145 ?auto_270150 ) ) ( not ( = ?auto_270145 ?auto_270151 ) ) ( not ( = ?auto_270145 ?auto_270152 ) ) ( not ( = ?auto_270145 ?auto_270153 ) ) ( not ( = ?auto_270145 ?auto_270154 ) ) ( not ( = ?auto_270145 ?auto_270155 ) ) ( not ( = ?auto_270145 ?auto_270156 ) ) ( not ( = ?auto_270146 ?auto_270147 ) ) ( not ( = ?auto_270146 ?auto_270148 ) ) ( not ( = ?auto_270146 ?auto_270149 ) ) ( not ( = ?auto_270146 ?auto_270150 ) ) ( not ( = ?auto_270146 ?auto_270151 ) ) ( not ( = ?auto_270146 ?auto_270152 ) ) ( not ( = ?auto_270146 ?auto_270153 ) ) ( not ( = ?auto_270146 ?auto_270154 ) ) ( not ( = ?auto_270146 ?auto_270155 ) ) ( not ( = ?auto_270146 ?auto_270156 ) ) ( not ( = ?auto_270147 ?auto_270148 ) ) ( not ( = ?auto_270147 ?auto_270149 ) ) ( not ( = ?auto_270147 ?auto_270150 ) ) ( not ( = ?auto_270147 ?auto_270151 ) ) ( not ( = ?auto_270147 ?auto_270152 ) ) ( not ( = ?auto_270147 ?auto_270153 ) ) ( not ( = ?auto_270147 ?auto_270154 ) ) ( not ( = ?auto_270147 ?auto_270155 ) ) ( not ( = ?auto_270147 ?auto_270156 ) ) ( not ( = ?auto_270148 ?auto_270149 ) ) ( not ( = ?auto_270148 ?auto_270150 ) ) ( not ( = ?auto_270148 ?auto_270151 ) ) ( not ( = ?auto_270148 ?auto_270152 ) ) ( not ( = ?auto_270148 ?auto_270153 ) ) ( not ( = ?auto_270148 ?auto_270154 ) ) ( not ( = ?auto_270148 ?auto_270155 ) ) ( not ( = ?auto_270148 ?auto_270156 ) ) ( not ( = ?auto_270149 ?auto_270150 ) ) ( not ( = ?auto_270149 ?auto_270151 ) ) ( not ( = ?auto_270149 ?auto_270152 ) ) ( not ( = ?auto_270149 ?auto_270153 ) ) ( not ( = ?auto_270149 ?auto_270154 ) ) ( not ( = ?auto_270149 ?auto_270155 ) ) ( not ( = ?auto_270149 ?auto_270156 ) ) ( not ( = ?auto_270150 ?auto_270151 ) ) ( not ( = ?auto_270150 ?auto_270152 ) ) ( not ( = ?auto_270150 ?auto_270153 ) ) ( not ( = ?auto_270150 ?auto_270154 ) ) ( not ( = ?auto_270150 ?auto_270155 ) ) ( not ( = ?auto_270150 ?auto_270156 ) ) ( not ( = ?auto_270151 ?auto_270152 ) ) ( not ( = ?auto_270151 ?auto_270153 ) ) ( not ( = ?auto_270151 ?auto_270154 ) ) ( not ( = ?auto_270151 ?auto_270155 ) ) ( not ( = ?auto_270151 ?auto_270156 ) ) ( not ( = ?auto_270152 ?auto_270153 ) ) ( not ( = ?auto_270152 ?auto_270154 ) ) ( not ( = ?auto_270152 ?auto_270155 ) ) ( not ( = ?auto_270152 ?auto_270156 ) ) ( not ( = ?auto_270153 ?auto_270154 ) ) ( not ( = ?auto_270153 ?auto_270155 ) ) ( not ( = ?auto_270153 ?auto_270156 ) ) ( not ( = ?auto_270154 ?auto_270155 ) ) ( not ( = ?auto_270154 ?auto_270156 ) ) ( not ( = ?auto_270155 ?auto_270156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270155 ?auto_270156 )
      ( !STACK ?auto_270155 ?auto_270154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270194 - BLOCK
      ?auto_270195 - BLOCK
      ?auto_270196 - BLOCK
      ?auto_270197 - BLOCK
      ?auto_270198 - BLOCK
      ?auto_270199 - BLOCK
      ?auto_270200 - BLOCK
      ?auto_270201 - BLOCK
      ?auto_270202 - BLOCK
      ?auto_270203 - BLOCK
      ?auto_270204 - BLOCK
      ?auto_270205 - BLOCK
    )
    :vars
    (
      ?auto_270206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270205 ?auto_270206 ) ( ON-TABLE ?auto_270194 ) ( ON ?auto_270195 ?auto_270194 ) ( ON ?auto_270196 ?auto_270195 ) ( ON ?auto_270197 ?auto_270196 ) ( ON ?auto_270198 ?auto_270197 ) ( ON ?auto_270199 ?auto_270198 ) ( ON ?auto_270200 ?auto_270199 ) ( ON ?auto_270201 ?auto_270200 ) ( ON ?auto_270202 ?auto_270201 ) ( ON ?auto_270203 ?auto_270202 ) ( not ( = ?auto_270194 ?auto_270195 ) ) ( not ( = ?auto_270194 ?auto_270196 ) ) ( not ( = ?auto_270194 ?auto_270197 ) ) ( not ( = ?auto_270194 ?auto_270198 ) ) ( not ( = ?auto_270194 ?auto_270199 ) ) ( not ( = ?auto_270194 ?auto_270200 ) ) ( not ( = ?auto_270194 ?auto_270201 ) ) ( not ( = ?auto_270194 ?auto_270202 ) ) ( not ( = ?auto_270194 ?auto_270203 ) ) ( not ( = ?auto_270194 ?auto_270204 ) ) ( not ( = ?auto_270194 ?auto_270205 ) ) ( not ( = ?auto_270194 ?auto_270206 ) ) ( not ( = ?auto_270195 ?auto_270196 ) ) ( not ( = ?auto_270195 ?auto_270197 ) ) ( not ( = ?auto_270195 ?auto_270198 ) ) ( not ( = ?auto_270195 ?auto_270199 ) ) ( not ( = ?auto_270195 ?auto_270200 ) ) ( not ( = ?auto_270195 ?auto_270201 ) ) ( not ( = ?auto_270195 ?auto_270202 ) ) ( not ( = ?auto_270195 ?auto_270203 ) ) ( not ( = ?auto_270195 ?auto_270204 ) ) ( not ( = ?auto_270195 ?auto_270205 ) ) ( not ( = ?auto_270195 ?auto_270206 ) ) ( not ( = ?auto_270196 ?auto_270197 ) ) ( not ( = ?auto_270196 ?auto_270198 ) ) ( not ( = ?auto_270196 ?auto_270199 ) ) ( not ( = ?auto_270196 ?auto_270200 ) ) ( not ( = ?auto_270196 ?auto_270201 ) ) ( not ( = ?auto_270196 ?auto_270202 ) ) ( not ( = ?auto_270196 ?auto_270203 ) ) ( not ( = ?auto_270196 ?auto_270204 ) ) ( not ( = ?auto_270196 ?auto_270205 ) ) ( not ( = ?auto_270196 ?auto_270206 ) ) ( not ( = ?auto_270197 ?auto_270198 ) ) ( not ( = ?auto_270197 ?auto_270199 ) ) ( not ( = ?auto_270197 ?auto_270200 ) ) ( not ( = ?auto_270197 ?auto_270201 ) ) ( not ( = ?auto_270197 ?auto_270202 ) ) ( not ( = ?auto_270197 ?auto_270203 ) ) ( not ( = ?auto_270197 ?auto_270204 ) ) ( not ( = ?auto_270197 ?auto_270205 ) ) ( not ( = ?auto_270197 ?auto_270206 ) ) ( not ( = ?auto_270198 ?auto_270199 ) ) ( not ( = ?auto_270198 ?auto_270200 ) ) ( not ( = ?auto_270198 ?auto_270201 ) ) ( not ( = ?auto_270198 ?auto_270202 ) ) ( not ( = ?auto_270198 ?auto_270203 ) ) ( not ( = ?auto_270198 ?auto_270204 ) ) ( not ( = ?auto_270198 ?auto_270205 ) ) ( not ( = ?auto_270198 ?auto_270206 ) ) ( not ( = ?auto_270199 ?auto_270200 ) ) ( not ( = ?auto_270199 ?auto_270201 ) ) ( not ( = ?auto_270199 ?auto_270202 ) ) ( not ( = ?auto_270199 ?auto_270203 ) ) ( not ( = ?auto_270199 ?auto_270204 ) ) ( not ( = ?auto_270199 ?auto_270205 ) ) ( not ( = ?auto_270199 ?auto_270206 ) ) ( not ( = ?auto_270200 ?auto_270201 ) ) ( not ( = ?auto_270200 ?auto_270202 ) ) ( not ( = ?auto_270200 ?auto_270203 ) ) ( not ( = ?auto_270200 ?auto_270204 ) ) ( not ( = ?auto_270200 ?auto_270205 ) ) ( not ( = ?auto_270200 ?auto_270206 ) ) ( not ( = ?auto_270201 ?auto_270202 ) ) ( not ( = ?auto_270201 ?auto_270203 ) ) ( not ( = ?auto_270201 ?auto_270204 ) ) ( not ( = ?auto_270201 ?auto_270205 ) ) ( not ( = ?auto_270201 ?auto_270206 ) ) ( not ( = ?auto_270202 ?auto_270203 ) ) ( not ( = ?auto_270202 ?auto_270204 ) ) ( not ( = ?auto_270202 ?auto_270205 ) ) ( not ( = ?auto_270202 ?auto_270206 ) ) ( not ( = ?auto_270203 ?auto_270204 ) ) ( not ( = ?auto_270203 ?auto_270205 ) ) ( not ( = ?auto_270203 ?auto_270206 ) ) ( not ( = ?auto_270204 ?auto_270205 ) ) ( not ( = ?auto_270204 ?auto_270206 ) ) ( not ( = ?auto_270205 ?auto_270206 ) ) ( CLEAR ?auto_270203 ) ( ON ?auto_270204 ?auto_270205 ) ( CLEAR ?auto_270204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270194 ?auto_270195 ?auto_270196 ?auto_270197 ?auto_270198 ?auto_270199 ?auto_270200 ?auto_270201 ?auto_270202 ?auto_270203 ?auto_270204 )
      ( MAKE-12PILE ?auto_270194 ?auto_270195 ?auto_270196 ?auto_270197 ?auto_270198 ?auto_270199 ?auto_270200 ?auto_270201 ?auto_270202 ?auto_270203 ?auto_270204 ?auto_270205 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270244 - BLOCK
      ?auto_270245 - BLOCK
      ?auto_270246 - BLOCK
      ?auto_270247 - BLOCK
      ?auto_270248 - BLOCK
      ?auto_270249 - BLOCK
      ?auto_270250 - BLOCK
      ?auto_270251 - BLOCK
      ?auto_270252 - BLOCK
      ?auto_270253 - BLOCK
      ?auto_270254 - BLOCK
      ?auto_270255 - BLOCK
    )
    :vars
    (
      ?auto_270256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270255 ?auto_270256 ) ( ON-TABLE ?auto_270244 ) ( ON ?auto_270245 ?auto_270244 ) ( ON ?auto_270246 ?auto_270245 ) ( ON ?auto_270247 ?auto_270246 ) ( ON ?auto_270248 ?auto_270247 ) ( ON ?auto_270249 ?auto_270248 ) ( ON ?auto_270250 ?auto_270249 ) ( ON ?auto_270251 ?auto_270250 ) ( ON ?auto_270252 ?auto_270251 ) ( not ( = ?auto_270244 ?auto_270245 ) ) ( not ( = ?auto_270244 ?auto_270246 ) ) ( not ( = ?auto_270244 ?auto_270247 ) ) ( not ( = ?auto_270244 ?auto_270248 ) ) ( not ( = ?auto_270244 ?auto_270249 ) ) ( not ( = ?auto_270244 ?auto_270250 ) ) ( not ( = ?auto_270244 ?auto_270251 ) ) ( not ( = ?auto_270244 ?auto_270252 ) ) ( not ( = ?auto_270244 ?auto_270253 ) ) ( not ( = ?auto_270244 ?auto_270254 ) ) ( not ( = ?auto_270244 ?auto_270255 ) ) ( not ( = ?auto_270244 ?auto_270256 ) ) ( not ( = ?auto_270245 ?auto_270246 ) ) ( not ( = ?auto_270245 ?auto_270247 ) ) ( not ( = ?auto_270245 ?auto_270248 ) ) ( not ( = ?auto_270245 ?auto_270249 ) ) ( not ( = ?auto_270245 ?auto_270250 ) ) ( not ( = ?auto_270245 ?auto_270251 ) ) ( not ( = ?auto_270245 ?auto_270252 ) ) ( not ( = ?auto_270245 ?auto_270253 ) ) ( not ( = ?auto_270245 ?auto_270254 ) ) ( not ( = ?auto_270245 ?auto_270255 ) ) ( not ( = ?auto_270245 ?auto_270256 ) ) ( not ( = ?auto_270246 ?auto_270247 ) ) ( not ( = ?auto_270246 ?auto_270248 ) ) ( not ( = ?auto_270246 ?auto_270249 ) ) ( not ( = ?auto_270246 ?auto_270250 ) ) ( not ( = ?auto_270246 ?auto_270251 ) ) ( not ( = ?auto_270246 ?auto_270252 ) ) ( not ( = ?auto_270246 ?auto_270253 ) ) ( not ( = ?auto_270246 ?auto_270254 ) ) ( not ( = ?auto_270246 ?auto_270255 ) ) ( not ( = ?auto_270246 ?auto_270256 ) ) ( not ( = ?auto_270247 ?auto_270248 ) ) ( not ( = ?auto_270247 ?auto_270249 ) ) ( not ( = ?auto_270247 ?auto_270250 ) ) ( not ( = ?auto_270247 ?auto_270251 ) ) ( not ( = ?auto_270247 ?auto_270252 ) ) ( not ( = ?auto_270247 ?auto_270253 ) ) ( not ( = ?auto_270247 ?auto_270254 ) ) ( not ( = ?auto_270247 ?auto_270255 ) ) ( not ( = ?auto_270247 ?auto_270256 ) ) ( not ( = ?auto_270248 ?auto_270249 ) ) ( not ( = ?auto_270248 ?auto_270250 ) ) ( not ( = ?auto_270248 ?auto_270251 ) ) ( not ( = ?auto_270248 ?auto_270252 ) ) ( not ( = ?auto_270248 ?auto_270253 ) ) ( not ( = ?auto_270248 ?auto_270254 ) ) ( not ( = ?auto_270248 ?auto_270255 ) ) ( not ( = ?auto_270248 ?auto_270256 ) ) ( not ( = ?auto_270249 ?auto_270250 ) ) ( not ( = ?auto_270249 ?auto_270251 ) ) ( not ( = ?auto_270249 ?auto_270252 ) ) ( not ( = ?auto_270249 ?auto_270253 ) ) ( not ( = ?auto_270249 ?auto_270254 ) ) ( not ( = ?auto_270249 ?auto_270255 ) ) ( not ( = ?auto_270249 ?auto_270256 ) ) ( not ( = ?auto_270250 ?auto_270251 ) ) ( not ( = ?auto_270250 ?auto_270252 ) ) ( not ( = ?auto_270250 ?auto_270253 ) ) ( not ( = ?auto_270250 ?auto_270254 ) ) ( not ( = ?auto_270250 ?auto_270255 ) ) ( not ( = ?auto_270250 ?auto_270256 ) ) ( not ( = ?auto_270251 ?auto_270252 ) ) ( not ( = ?auto_270251 ?auto_270253 ) ) ( not ( = ?auto_270251 ?auto_270254 ) ) ( not ( = ?auto_270251 ?auto_270255 ) ) ( not ( = ?auto_270251 ?auto_270256 ) ) ( not ( = ?auto_270252 ?auto_270253 ) ) ( not ( = ?auto_270252 ?auto_270254 ) ) ( not ( = ?auto_270252 ?auto_270255 ) ) ( not ( = ?auto_270252 ?auto_270256 ) ) ( not ( = ?auto_270253 ?auto_270254 ) ) ( not ( = ?auto_270253 ?auto_270255 ) ) ( not ( = ?auto_270253 ?auto_270256 ) ) ( not ( = ?auto_270254 ?auto_270255 ) ) ( not ( = ?auto_270254 ?auto_270256 ) ) ( not ( = ?auto_270255 ?auto_270256 ) ) ( ON ?auto_270254 ?auto_270255 ) ( CLEAR ?auto_270252 ) ( ON ?auto_270253 ?auto_270254 ) ( CLEAR ?auto_270253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270244 ?auto_270245 ?auto_270246 ?auto_270247 ?auto_270248 ?auto_270249 ?auto_270250 ?auto_270251 ?auto_270252 ?auto_270253 )
      ( MAKE-12PILE ?auto_270244 ?auto_270245 ?auto_270246 ?auto_270247 ?auto_270248 ?auto_270249 ?auto_270250 ?auto_270251 ?auto_270252 ?auto_270253 ?auto_270254 ?auto_270255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270294 - BLOCK
      ?auto_270295 - BLOCK
      ?auto_270296 - BLOCK
      ?auto_270297 - BLOCK
      ?auto_270298 - BLOCK
      ?auto_270299 - BLOCK
      ?auto_270300 - BLOCK
      ?auto_270301 - BLOCK
      ?auto_270302 - BLOCK
      ?auto_270303 - BLOCK
      ?auto_270304 - BLOCK
      ?auto_270305 - BLOCK
    )
    :vars
    (
      ?auto_270306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270305 ?auto_270306 ) ( ON-TABLE ?auto_270294 ) ( ON ?auto_270295 ?auto_270294 ) ( ON ?auto_270296 ?auto_270295 ) ( ON ?auto_270297 ?auto_270296 ) ( ON ?auto_270298 ?auto_270297 ) ( ON ?auto_270299 ?auto_270298 ) ( ON ?auto_270300 ?auto_270299 ) ( ON ?auto_270301 ?auto_270300 ) ( not ( = ?auto_270294 ?auto_270295 ) ) ( not ( = ?auto_270294 ?auto_270296 ) ) ( not ( = ?auto_270294 ?auto_270297 ) ) ( not ( = ?auto_270294 ?auto_270298 ) ) ( not ( = ?auto_270294 ?auto_270299 ) ) ( not ( = ?auto_270294 ?auto_270300 ) ) ( not ( = ?auto_270294 ?auto_270301 ) ) ( not ( = ?auto_270294 ?auto_270302 ) ) ( not ( = ?auto_270294 ?auto_270303 ) ) ( not ( = ?auto_270294 ?auto_270304 ) ) ( not ( = ?auto_270294 ?auto_270305 ) ) ( not ( = ?auto_270294 ?auto_270306 ) ) ( not ( = ?auto_270295 ?auto_270296 ) ) ( not ( = ?auto_270295 ?auto_270297 ) ) ( not ( = ?auto_270295 ?auto_270298 ) ) ( not ( = ?auto_270295 ?auto_270299 ) ) ( not ( = ?auto_270295 ?auto_270300 ) ) ( not ( = ?auto_270295 ?auto_270301 ) ) ( not ( = ?auto_270295 ?auto_270302 ) ) ( not ( = ?auto_270295 ?auto_270303 ) ) ( not ( = ?auto_270295 ?auto_270304 ) ) ( not ( = ?auto_270295 ?auto_270305 ) ) ( not ( = ?auto_270295 ?auto_270306 ) ) ( not ( = ?auto_270296 ?auto_270297 ) ) ( not ( = ?auto_270296 ?auto_270298 ) ) ( not ( = ?auto_270296 ?auto_270299 ) ) ( not ( = ?auto_270296 ?auto_270300 ) ) ( not ( = ?auto_270296 ?auto_270301 ) ) ( not ( = ?auto_270296 ?auto_270302 ) ) ( not ( = ?auto_270296 ?auto_270303 ) ) ( not ( = ?auto_270296 ?auto_270304 ) ) ( not ( = ?auto_270296 ?auto_270305 ) ) ( not ( = ?auto_270296 ?auto_270306 ) ) ( not ( = ?auto_270297 ?auto_270298 ) ) ( not ( = ?auto_270297 ?auto_270299 ) ) ( not ( = ?auto_270297 ?auto_270300 ) ) ( not ( = ?auto_270297 ?auto_270301 ) ) ( not ( = ?auto_270297 ?auto_270302 ) ) ( not ( = ?auto_270297 ?auto_270303 ) ) ( not ( = ?auto_270297 ?auto_270304 ) ) ( not ( = ?auto_270297 ?auto_270305 ) ) ( not ( = ?auto_270297 ?auto_270306 ) ) ( not ( = ?auto_270298 ?auto_270299 ) ) ( not ( = ?auto_270298 ?auto_270300 ) ) ( not ( = ?auto_270298 ?auto_270301 ) ) ( not ( = ?auto_270298 ?auto_270302 ) ) ( not ( = ?auto_270298 ?auto_270303 ) ) ( not ( = ?auto_270298 ?auto_270304 ) ) ( not ( = ?auto_270298 ?auto_270305 ) ) ( not ( = ?auto_270298 ?auto_270306 ) ) ( not ( = ?auto_270299 ?auto_270300 ) ) ( not ( = ?auto_270299 ?auto_270301 ) ) ( not ( = ?auto_270299 ?auto_270302 ) ) ( not ( = ?auto_270299 ?auto_270303 ) ) ( not ( = ?auto_270299 ?auto_270304 ) ) ( not ( = ?auto_270299 ?auto_270305 ) ) ( not ( = ?auto_270299 ?auto_270306 ) ) ( not ( = ?auto_270300 ?auto_270301 ) ) ( not ( = ?auto_270300 ?auto_270302 ) ) ( not ( = ?auto_270300 ?auto_270303 ) ) ( not ( = ?auto_270300 ?auto_270304 ) ) ( not ( = ?auto_270300 ?auto_270305 ) ) ( not ( = ?auto_270300 ?auto_270306 ) ) ( not ( = ?auto_270301 ?auto_270302 ) ) ( not ( = ?auto_270301 ?auto_270303 ) ) ( not ( = ?auto_270301 ?auto_270304 ) ) ( not ( = ?auto_270301 ?auto_270305 ) ) ( not ( = ?auto_270301 ?auto_270306 ) ) ( not ( = ?auto_270302 ?auto_270303 ) ) ( not ( = ?auto_270302 ?auto_270304 ) ) ( not ( = ?auto_270302 ?auto_270305 ) ) ( not ( = ?auto_270302 ?auto_270306 ) ) ( not ( = ?auto_270303 ?auto_270304 ) ) ( not ( = ?auto_270303 ?auto_270305 ) ) ( not ( = ?auto_270303 ?auto_270306 ) ) ( not ( = ?auto_270304 ?auto_270305 ) ) ( not ( = ?auto_270304 ?auto_270306 ) ) ( not ( = ?auto_270305 ?auto_270306 ) ) ( ON ?auto_270304 ?auto_270305 ) ( ON ?auto_270303 ?auto_270304 ) ( CLEAR ?auto_270301 ) ( ON ?auto_270302 ?auto_270303 ) ( CLEAR ?auto_270302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270294 ?auto_270295 ?auto_270296 ?auto_270297 ?auto_270298 ?auto_270299 ?auto_270300 ?auto_270301 ?auto_270302 )
      ( MAKE-12PILE ?auto_270294 ?auto_270295 ?auto_270296 ?auto_270297 ?auto_270298 ?auto_270299 ?auto_270300 ?auto_270301 ?auto_270302 ?auto_270303 ?auto_270304 ?auto_270305 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270344 - BLOCK
      ?auto_270345 - BLOCK
      ?auto_270346 - BLOCK
      ?auto_270347 - BLOCK
      ?auto_270348 - BLOCK
      ?auto_270349 - BLOCK
      ?auto_270350 - BLOCK
      ?auto_270351 - BLOCK
      ?auto_270352 - BLOCK
      ?auto_270353 - BLOCK
      ?auto_270354 - BLOCK
      ?auto_270355 - BLOCK
    )
    :vars
    (
      ?auto_270356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270355 ?auto_270356 ) ( ON-TABLE ?auto_270344 ) ( ON ?auto_270345 ?auto_270344 ) ( ON ?auto_270346 ?auto_270345 ) ( ON ?auto_270347 ?auto_270346 ) ( ON ?auto_270348 ?auto_270347 ) ( ON ?auto_270349 ?auto_270348 ) ( ON ?auto_270350 ?auto_270349 ) ( not ( = ?auto_270344 ?auto_270345 ) ) ( not ( = ?auto_270344 ?auto_270346 ) ) ( not ( = ?auto_270344 ?auto_270347 ) ) ( not ( = ?auto_270344 ?auto_270348 ) ) ( not ( = ?auto_270344 ?auto_270349 ) ) ( not ( = ?auto_270344 ?auto_270350 ) ) ( not ( = ?auto_270344 ?auto_270351 ) ) ( not ( = ?auto_270344 ?auto_270352 ) ) ( not ( = ?auto_270344 ?auto_270353 ) ) ( not ( = ?auto_270344 ?auto_270354 ) ) ( not ( = ?auto_270344 ?auto_270355 ) ) ( not ( = ?auto_270344 ?auto_270356 ) ) ( not ( = ?auto_270345 ?auto_270346 ) ) ( not ( = ?auto_270345 ?auto_270347 ) ) ( not ( = ?auto_270345 ?auto_270348 ) ) ( not ( = ?auto_270345 ?auto_270349 ) ) ( not ( = ?auto_270345 ?auto_270350 ) ) ( not ( = ?auto_270345 ?auto_270351 ) ) ( not ( = ?auto_270345 ?auto_270352 ) ) ( not ( = ?auto_270345 ?auto_270353 ) ) ( not ( = ?auto_270345 ?auto_270354 ) ) ( not ( = ?auto_270345 ?auto_270355 ) ) ( not ( = ?auto_270345 ?auto_270356 ) ) ( not ( = ?auto_270346 ?auto_270347 ) ) ( not ( = ?auto_270346 ?auto_270348 ) ) ( not ( = ?auto_270346 ?auto_270349 ) ) ( not ( = ?auto_270346 ?auto_270350 ) ) ( not ( = ?auto_270346 ?auto_270351 ) ) ( not ( = ?auto_270346 ?auto_270352 ) ) ( not ( = ?auto_270346 ?auto_270353 ) ) ( not ( = ?auto_270346 ?auto_270354 ) ) ( not ( = ?auto_270346 ?auto_270355 ) ) ( not ( = ?auto_270346 ?auto_270356 ) ) ( not ( = ?auto_270347 ?auto_270348 ) ) ( not ( = ?auto_270347 ?auto_270349 ) ) ( not ( = ?auto_270347 ?auto_270350 ) ) ( not ( = ?auto_270347 ?auto_270351 ) ) ( not ( = ?auto_270347 ?auto_270352 ) ) ( not ( = ?auto_270347 ?auto_270353 ) ) ( not ( = ?auto_270347 ?auto_270354 ) ) ( not ( = ?auto_270347 ?auto_270355 ) ) ( not ( = ?auto_270347 ?auto_270356 ) ) ( not ( = ?auto_270348 ?auto_270349 ) ) ( not ( = ?auto_270348 ?auto_270350 ) ) ( not ( = ?auto_270348 ?auto_270351 ) ) ( not ( = ?auto_270348 ?auto_270352 ) ) ( not ( = ?auto_270348 ?auto_270353 ) ) ( not ( = ?auto_270348 ?auto_270354 ) ) ( not ( = ?auto_270348 ?auto_270355 ) ) ( not ( = ?auto_270348 ?auto_270356 ) ) ( not ( = ?auto_270349 ?auto_270350 ) ) ( not ( = ?auto_270349 ?auto_270351 ) ) ( not ( = ?auto_270349 ?auto_270352 ) ) ( not ( = ?auto_270349 ?auto_270353 ) ) ( not ( = ?auto_270349 ?auto_270354 ) ) ( not ( = ?auto_270349 ?auto_270355 ) ) ( not ( = ?auto_270349 ?auto_270356 ) ) ( not ( = ?auto_270350 ?auto_270351 ) ) ( not ( = ?auto_270350 ?auto_270352 ) ) ( not ( = ?auto_270350 ?auto_270353 ) ) ( not ( = ?auto_270350 ?auto_270354 ) ) ( not ( = ?auto_270350 ?auto_270355 ) ) ( not ( = ?auto_270350 ?auto_270356 ) ) ( not ( = ?auto_270351 ?auto_270352 ) ) ( not ( = ?auto_270351 ?auto_270353 ) ) ( not ( = ?auto_270351 ?auto_270354 ) ) ( not ( = ?auto_270351 ?auto_270355 ) ) ( not ( = ?auto_270351 ?auto_270356 ) ) ( not ( = ?auto_270352 ?auto_270353 ) ) ( not ( = ?auto_270352 ?auto_270354 ) ) ( not ( = ?auto_270352 ?auto_270355 ) ) ( not ( = ?auto_270352 ?auto_270356 ) ) ( not ( = ?auto_270353 ?auto_270354 ) ) ( not ( = ?auto_270353 ?auto_270355 ) ) ( not ( = ?auto_270353 ?auto_270356 ) ) ( not ( = ?auto_270354 ?auto_270355 ) ) ( not ( = ?auto_270354 ?auto_270356 ) ) ( not ( = ?auto_270355 ?auto_270356 ) ) ( ON ?auto_270354 ?auto_270355 ) ( ON ?auto_270353 ?auto_270354 ) ( ON ?auto_270352 ?auto_270353 ) ( CLEAR ?auto_270350 ) ( ON ?auto_270351 ?auto_270352 ) ( CLEAR ?auto_270351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_270344 ?auto_270345 ?auto_270346 ?auto_270347 ?auto_270348 ?auto_270349 ?auto_270350 ?auto_270351 )
      ( MAKE-12PILE ?auto_270344 ?auto_270345 ?auto_270346 ?auto_270347 ?auto_270348 ?auto_270349 ?auto_270350 ?auto_270351 ?auto_270352 ?auto_270353 ?auto_270354 ?auto_270355 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270394 - BLOCK
      ?auto_270395 - BLOCK
      ?auto_270396 - BLOCK
      ?auto_270397 - BLOCK
      ?auto_270398 - BLOCK
      ?auto_270399 - BLOCK
      ?auto_270400 - BLOCK
      ?auto_270401 - BLOCK
      ?auto_270402 - BLOCK
      ?auto_270403 - BLOCK
      ?auto_270404 - BLOCK
      ?auto_270405 - BLOCK
    )
    :vars
    (
      ?auto_270406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270405 ?auto_270406 ) ( ON-TABLE ?auto_270394 ) ( ON ?auto_270395 ?auto_270394 ) ( ON ?auto_270396 ?auto_270395 ) ( ON ?auto_270397 ?auto_270396 ) ( ON ?auto_270398 ?auto_270397 ) ( ON ?auto_270399 ?auto_270398 ) ( not ( = ?auto_270394 ?auto_270395 ) ) ( not ( = ?auto_270394 ?auto_270396 ) ) ( not ( = ?auto_270394 ?auto_270397 ) ) ( not ( = ?auto_270394 ?auto_270398 ) ) ( not ( = ?auto_270394 ?auto_270399 ) ) ( not ( = ?auto_270394 ?auto_270400 ) ) ( not ( = ?auto_270394 ?auto_270401 ) ) ( not ( = ?auto_270394 ?auto_270402 ) ) ( not ( = ?auto_270394 ?auto_270403 ) ) ( not ( = ?auto_270394 ?auto_270404 ) ) ( not ( = ?auto_270394 ?auto_270405 ) ) ( not ( = ?auto_270394 ?auto_270406 ) ) ( not ( = ?auto_270395 ?auto_270396 ) ) ( not ( = ?auto_270395 ?auto_270397 ) ) ( not ( = ?auto_270395 ?auto_270398 ) ) ( not ( = ?auto_270395 ?auto_270399 ) ) ( not ( = ?auto_270395 ?auto_270400 ) ) ( not ( = ?auto_270395 ?auto_270401 ) ) ( not ( = ?auto_270395 ?auto_270402 ) ) ( not ( = ?auto_270395 ?auto_270403 ) ) ( not ( = ?auto_270395 ?auto_270404 ) ) ( not ( = ?auto_270395 ?auto_270405 ) ) ( not ( = ?auto_270395 ?auto_270406 ) ) ( not ( = ?auto_270396 ?auto_270397 ) ) ( not ( = ?auto_270396 ?auto_270398 ) ) ( not ( = ?auto_270396 ?auto_270399 ) ) ( not ( = ?auto_270396 ?auto_270400 ) ) ( not ( = ?auto_270396 ?auto_270401 ) ) ( not ( = ?auto_270396 ?auto_270402 ) ) ( not ( = ?auto_270396 ?auto_270403 ) ) ( not ( = ?auto_270396 ?auto_270404 ) ) ( not ( = ?auto_270396 ?auto_270405 ) ) ( not ( = ?auto_270396 ?auto_270406 ) ) ( not ( = ?auto_270397 ?auto_270398 ) ) ( not ( = ?auto_270397 ?auto_270399 ) ) ( not ( = ?auto_270397 ?auto_270400 ) ) ( not ( = ?auto_270397 ?auto_270401 ) ) ( not ( = ?auto_270397 ?auto_270402 ) ) ( not ( = ?auto_270397 ?auto_270403 ) ) ( not ( = ?auto_270397 ?auto_270404 ) ) ( not ( = ?auto_270397 ?auto_270405 ) ) ( not ( = ?auto_270397 ?auto_270406 ) ) ( not ( = ?auto_270398 ?auto_270399 ) ) ( not ( = ?auto_270398 ?auto_270400 ) ) ( not ( = ?auto_270398 ?auto_270401 ) ) ( not ( = ?auto_270398 ?auto_270402 ) ) ( not ( = ?auto_270398 ?auto_270403 ) ) ( not ( = ?auto_270398 ?auto_270404 ) ) ( not ( = ?auto_270398 ?auto_270405 ) ) ( not ( = ?auto_270398 ?auto_270406 ) ) ( not ( = ?auto_270399 ?auto_270400 ) ) ( not ( = ?auto_270399 ?auto_270401 ) ) ( not ( = ?auto_270399 ?auto_270402 ) ) ( not ( = ?auto_270399 ?auto_270403 ) ) ( not ( = ?auto_270399 ?auto_270404 ) ) ( not ( = ?auto_270399 ?auto_270405 ) ) ( not ( = ?auto_270399 ?auto_270406 ) ) ( not ( = ?auto_270400 ?auto_270401 ) ) ( not ( = ?auto_270400 ?auto_270402 ) ) ( not ( = ?auto_270400 ?auto_270403 ) ) ( not ( = ?auto_270400 ?auto_270404 ) ) ( not ( = ?auto_270400 ?auto_270405 ) ) ( not ( = ?auto_270400 ?auto_270406 ) ) ( not ( = ?auto_270401 ?auto_270402 ) ) ( not ( = ?auto_270401 ?auto_270403 ) ) ( not ( = ?auto_270401 ?auto_270404 ) ) ( not ( = ?auto_270401 ?auto_270405 ) ) ( not ( = ?auto_270401 ?auto_270406 ) ) ( not ( = ?auto_270402 ?auto_270403 ) ) ( not ( = ?auto_270402 ?auto_270404 ) ) ( not ( = ?auto_270402 ?auto_270405 ) ) ( not ( = ?auto_270402 ?auto_270406 ) ) ( not ( = ?auto_270403 ?auto_270404 ) ) ( not ( = ?auto_270403 ?auto_270405 ) ) ( not ( = ?auto_270403 ?auto_270406 ) ) ( not ( = ?auto_270404 ?auto_270405 ) ) ( not ( = ?auto_270404 ?auto_270406 ) ) ( not ( = ?auto_270405 ?auto_270406 ) ) ( ON ?auto_270404 ?auto_270405 ) ( ON ?auto_270403 ?auto_270404 ) ( ON ?auto_270402 ?auto_270403 ) ( ON ?auto_270401 ?auto_270402 ) ( CLEAR ?auto_270399 ) ( ON ?auto_270400 ?auto_270401 ) ( CLEAR ?auto_270400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_270394 ?auto_270395 ?auto_270396 ?auto_270397 ?auto_270398 ?auto_270399 ?auto_270400 )
      ( MAKE-12PILE ?auto_270394 ?auto_270395 ?auto_270396 ?auto_270397 ?auto_270398 ?auto_270399 ?auto_270400 ?auto_270401 ?auto_270402 ?auto_270403 ?auto_270404 ?auto_270405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270444 - BLOCK
      ?auto_270445 - BLOCK
      ?auto_270446 - BLOCK
      ?auto_270447 - BLOCK
      ?auto_270448 - BLOCK
      ?auto_270449 - BLOCK
      ?auto_270450 - BLOCK
      ?auto_270451 - BLOCK
      ?auto_270452 - BLOCK
      ?auto_270453 - BLOCK
      ?auto_270454 - BLOCK
      ?auto_270455 - BLOCK
    )
    :vars
    (
      ?auto_270456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270455 ?auto_270456 ) ( ON-TABLE ?auto_270444 ) ( ON ?auto_270445 ?auto_270444 ) ( ON ?auto_270446 ?auto_270445 ) ( ON ?auto_270447 ?auto_270446 ) ( ON ?auto_270448 ?auto_270447 ) ( not ( = ?auto_270444 ?auto_270445 ) ) ( not ( = ?auto_270444 ?auto_270446 ) ) ( not ( = ?auto_270444 ?auto_270447 ) ) ( not ( = ?auto_270444 ?auto_270448 ) ) ( not ( = ?auto_270444 ?auto_270449 ) ) ( not ( = ?auto_270444 ?auto_270450 ) ) ( not ( = ?auto_270444 ?auto_270451 ) ) ( not ( = ?auto_270444 ?auto_270452 ) ) ( not ( = ?auto_270444 ?auto_270453 ) ) ( not ( = ?auto_270444 ?auto_270454 ) ) ( not ( = ?auto_270444 ?auto_270455 ) ) ( not ( = ?auto_270444 ?auto_270456 ) ) ( not ( = ?auto_270445 ?auto_270446 ) ) ( not ( = ?auto_270445 ?auto_270447 ) ) ( not ( = ?auto_270445 ?auto_270448 ) ) ( not ( = ?auto_270445 ?auto_270449 ) ) ( not ( = ?auto_270445 ?auto_270450 ) ) ( not ( = ?auto_270445 ?auto_270451 ) ) ( not ( = ?auto_270445 ?auto_270452 ) ) ( not ( = ?auto_270445 ?auto_270453 ) ) ( not ( = ?auto_270445 ?auto_270454 ) ) ( not ( = ?auto_270445 ?auto_270455 ) ) ( not ( = ?auto_270445 ?auto_270456 ) ) ( not ( = ?auto_270446 ?auto_270447 ) ) ( not ( = ?auto_270446 ?auto_270448 ) ) ( not ( = ?auto_270446 ?auto_270449 ) ) ( not ( = ?auto_270446 ?auto_270450 ) ) ( not ( = ?auto_270446 ?auto_270451 ) ) ( not ( = ?auto_270446 ?auto_270452 ) ) ( not ( = ?auto_270446 ?auto_270453 ) ) ( not ( = ?auto_270446 ?auto_270454 ) ) ( not ( = ?auto_270446 ?auto_270455 ) ) ( not ( = ?auto_270446 ?auto_270456 ) ) ( not ( = ?auto_270447 ?auto_270448 ) ) ( not ( = ?auto_270447 ?auto_270449 ) ) ( not ( = ?auto_270447 ?auto_270450 ) ) ( not ( = ?auto_270447 ?auto_270451 ) ) ( not ( = ?auto_270447 ?auto_270452 ) ) ( not ( = ?auto_270447 ?auto_270453 ) ) ( not ( = ?auto_270447 ?auto_270454 ) ) ( not ( = ?auto_270447 ?auto_270455 ) ) ( not ( = ?auto_270447 ?auto_270456 ) ) ( not ( = ?auto_270448 ?auto_270449 ) ) ( not ( = ?auto_270448 ?auto_270450 ) ) ( not ( = ?auto_270448 ?auto_270451 ) ) ( not ( = ?auto_270448 ?auto_270452 ) ) ( not ( = ?auto_270448 ?auto_270453 ) ) ( not ( = ?auto_270448 ?auto_270454 ) ) ( not ( = ?auto_270448 ?auto_270455 ) ) ( not ( = ?auto_270448 ?auto_270456 ) ) ( not ( = ?auto_270449 ?auto_270450 ) ) ( not ( = ?auto_270449 ?auto_270451 ) ) ( not ( = ?auto_270449 ?auto_270452 ) ) ( not ( = ?auto_270449 ?auto_270453 ) ) ( not ( = ?auto_270449 ?auto_270454 ) ) ( not ( = ?auto_270449 ?auto_270455 ) ) ( not ( = ?auto_270449 ?auto_270456 ) ) ( not ( = ?auto_270450 ?auto_270451 ) ) ( not ( = ?auto_270450 ?auto_270452 ) ) ( not ( = ?auto_270450 ?auto_270453 ) ) ( not ( = ?auto_270450 ?auto_270454 ) ) ( not ( = ?auto_270450 ?auto_270455 ) ) ( not ( = ?auto_270450 ?auto_270456 ) ) ( not ( = ?auto_270451 ?auto_270452 ) ) ( not ( = ?auto_270451 ?auto_270453 ) ) ( not ( = ?auto_270451 ?auto_270454 ) ) ( not ( = ?auto_270451 ?auto_270455 ) ) ( not ( = ?auto_270451 ?auto_270456 ) ) ( not ( = ?auto_270452 ?auto_270453 ) ) ( not ( = ?auto_270452 ?auto_270454 ) ) ( not ( = ?auto_270452 ?auto_270455 ) ) ( not ( = ?auto_270452 ?auto_270456 ) ) ( not ( = ?auto_270453 ?auto_270454 ) ) ( not ( = ?auto_270453 ?auto_270455 ) ) ( not ( = ?auto_270453 ?auto_270456 ) ) ( not ( = ?auto_270454 ?auto_270455 ) ) ( not ( = ?auto_270454 ?auto_270456 ) ) ( not ( = ?auto_270455 ?auto_270456 ) ) ( ON ?auto_270454 ?auto_270455 ) ( ON ?auto_270453 ?auto_270454 ) ( ON ?auto_270452 ?auto_270453 ) ( ON ?auto_270451 ?auto_270452 ) ( ON ?auto_270450 ?auto_270451 ) ( CLEAR ?auto_270448 ) ( ON ?auto_270449 ?auto_270450 ) ( CLEAR ?auto_270449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_270444 ?auto_270445 ?auto_270446 ?auto_270447 ?auto_270448 ?auto_270449 )
      ( MAKE-12PILE ?auto_270444 ?auto_270445 ?auto_270446 ?auto_270447 ?auto_270448 ?auto_270449 ?auto_270450 ?auto_270451 ?auto_270452 ?auto_270453 ?auto_270454 ?auto_270455 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270494 - BLOCK
      ?auto_270495 - BLOCK
      ?auto_270496 - BLOCK
      ?auto_270497 - BLOCK
      ?auto_270498 - BLOCK
      ?auto_270499 - BLOCK
      ?auto_270500 - BLOCK
      ?auto_270501 - BLOCK
      ?auto_270502 - BLOCK
      ?auto_270503 - BLOCK
      ?auto_270504 - BLOCK
      ?auto_270505 - BLOCK
    )
    :vars
    (
      ?auto_270506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270505 ?auto_270506 ) ( ON-TABLE ?auto_270494 ) ( ON ?auto_270495 ?auto_270494 ) ( ON ?auto_270496 ?auto_270495 ) ( ON ?auto_270497 ?auto_270496 ) ( not ( = ?auto_270494 ?auto_270495 ) ) ( not ( = ?auto_270494 ?auto_270496 ) ) ( not ( = ?auto_270494 ?auto_270497 ) ) ( not ( = ?auto_270494 ?auto_270498 ) ) ( not ( = ?auto_270494 ?auto_270499 ) ) ( not ( = ?auto_270494 ?auto_270500 ) ) ( not ( = ?auto_270494 ?auto_270501 ) ) ( not ( = ?auto_270494 ?auto_270502 ) ) ( not ( = ?auto_270494 ?auto_270503 ) ) ( not ( = ?auto_270494 ?auto_270504 ) ) ( not ( = ?auto_270494 ?auto_270505 ) ) ( not ( = ?auto_270494 ?auto_270506 ) ) ( not ( = ?auto_270495 ?auto_270496 ) ) ( not ( = ?auto_270495 ?auto_270497 ) ) ( not ( = ?auto_270495 ?auto_270498 ) ) ( not ( = ?auto_270495 ?auto_270499 ) ) ( not ( = ?auto_270495 ?auto_270500 ) ) ( not ( = ?auto_270495 ?auto_270501 ) ) ( not ( = ?auto_270495 ?auto_270502 ) ) ( not ( = ?auto_270495 ?auto_270503 ) ) ( not ( = ?auto_270495 ?auto_270504 ) ) ( not ( = ?auto_270495 ?auto_270505 ) ) ( not ( = ?auto_270495 ?auto_270506 ) ) ( not ( = ?auto_270496 ?auto_270497 ) ) ( not ( = ?auto_270496 ?auto_270498 ) ) ( not ( = ?auto_270496 ?auto_270499 ) ) ( not ( = ?auto_270496 ?auto_270500 ) ) ( not ( = ?auto_270496 ?auto_270501 ) ) ( not ( = ?auto_270496 ?auto_270502 ) ) ( not ( = ?auto_270496 ?auto_270503 ) ) ( not ( = ?auto_270496 ?auto_270504 ) ) ( not ( = ?auto_270496 ?auto_270505 ) ) ( not ( = ?auto_270496 ?auto_270506 ) ) ( not ( = ?auto_270497 ?auto_270498 ) ) ( not ( = ?auto_270497 ?auto_270499 ) ) ( not ( = ?auto_270497 ?auto_270500 ) ) ( not ( = ?auto_270497 ?auto_270501 ) ) ( not ( = ?auto_270497 ?auto_270502 ) ) ( not ( = ?auto_270497 ?auto_270503 ) ) ( not ( = ?auto_270497 ?auto_270504 ) ) ( not ( = ?auto_270497 ?auto_270505 ) ) ( not ( = ?auto_270497 ?auto_270506 ) ) ( not ( = ?auto_270498 ?auto_270499 ) ) ( not ( = ?auto_270498 ?auto_270500 ) ) ( not ( = ?auto_270498 ?auto_270501 ) ) ( not ( = ?auto_270498 ?auto_270502 ) ) ( not ( = ?auto_270498 ?auto_270503 ) ) ( not ( = ?auto_270498 ?auto_270504 ) ) ( not ( = ?auto_270498 ?auto_270505 ) ) ( not ( = ?auto_270498 ?auto_270506 ) ) ( not ( = ?auto_270499 ?auto_270500 ) ) ( not ( = ?auto_270499 ?auto_270501 ) ) ( not ( = ?auto_270499 ?auto_270502 ) ) ( not ( = ?auto_270499 ?auto_270503 ) ) ( not ( = ?auto_270499 ?auto_270504 ) ) ( not ( = ?auto_270499 ?auto_270505 ) ) ( not ( = ?auto_270499 ?auto_270506 ) ) ( not ( = ?auto_270500 ?auto_270501 ) ) ( not ( = ?auto_270500 ?auto_270502 ) ) ( not ( = ?auto_270500 ?auto_270503 ) ) ( not ( = ?auto_270500 ?auto_270504 ) ) ( not ( = ?auto_270500 ?auto_270505 ) ) ( not ( = ?auto_270500 ?auto_270506 ) ) ( not ( = ?auto_270501 ?auto_270502 ) ) ( not ( = ?auto_270501 ?auto_270503 ) ) ( not ( = ?auto_270501 ?auto_270504 ) ) ( not ( = ?auto_270501 ?auto_270505 ) ) ( not ( = ?auto_270501 ?auto_270506 ) ) ( not ( = ?auto_270502 ?auto_270503 ) ) ( not ( = ?auto_270502 ?auto_270504 ) ) ( not ( = ?auto_270502 ?auto_270505 ) ) ( not ( = ?auto_270502 ?auto_270506 ) ) ( not ( = ?auto_270503 ?auto_270504 ) ) ( not ( = ?auto_270503 ?auto_270505 ) ) ( not ( = ?auto_270503 ?auto_270506 ) ) ( not ( = ?auto_270504 ?auto_270505 ) ) ( not ( = ?auto_270504 ?auto_270506 ) ) ( not ( = ?auto_270505 ?auto_270506 ) ) ( ON ?auto_270504 ?auto_270505 ) ( ON ?auto_270503 ?auto_270504 ) ( ON ?auto_270502 ?auto_270503 ) ( ON ?auto_270501 ?auto_270502 ) ( ON ?auto_270500 ?auto_270501 ) ( ON ?auto_270499 ?auto_270500 ) ( CLEAR ?auto_270497 ) ( ON ?auto_270498 ?auto_270499 ) ( CLEAR ?auto_270498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_270494 ?auto_270495 ?auto_270496 ?auto_270497 ?auto_270498 )
      ( MAKE-12PILE ?auto_270494 ?auto_270495 ?auto_270496 ?auto_270497 ?auto_270498 ?auto_270499 ?auto_270500 ?auto_270501 ?auto_270502 ?auto_270503 ?auto_270504 ?auto_270505 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270544 - BLOCK
      ?auto_270545 - BLOCK
      ?auto_270546 - BLOCK
      ?auto_270547 - BLOCK
      ?auto_270548 - BLOCK
      ?auto_270549 - BLOCK
      ?auto_270550 - BLOCK
      ?auto_270551 - BLOCK
      ?auto_270552 - BLOCK
      ?auto_270553 - BLOCK
      ?auto_270554 - BLOCK
      ?auto_270555 - BLOCK
    )
    :vars
    (
      ?auto_270556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270555 ?auto_270556 ) ( ON-TABLE ?auto_270544 ) ( ON ?auto_270545 ?auto_270544 ) ( ON ?auto_270546 ?auto_270545 ) ( not ( = ?auto_270544 ?auto_270545 ) ) ( not ( = ?auto_270544 ?auto_270546 ) ) ( not ( = ?auto_270544 ?auto_270547 ) ) ( not ( = ?auto_270544 ?auto_270548 ) ) ( not ( = ?auto_270544 ?auto_270549 ) ) ( not ( = ?auto_270544 ?auto_270550 ) ) ( not ( = ?auto_270544 ?auto_270551 ) ) ( not ( = ?auto_270544 ?auto_270552 ) ) ( not ( = ?auto_270544 ?auto_270553 ) ) ( not ( = ?auto_270544 ?auto_270554 ) ) ( not ( = ?auto_270544 ?auto_270555 ) ) ( not ( = ?auto_270544 ?auto_270556 ) ) ( not ( = ?auto_270545 ?auto_270546 ) ) ( not ( = ?auto_270545 ?auto_270547 ) ) ( not ( = ?auto_270545 ?auto_270548 ) ) ( not ( = ?auto_270545 ?auto_270549 ) ) ( not ( = ?auto_270545 ?auto_270550 ) ) ( not ( = ?auto_270545 ?auto_270551 ) ) ( not ( = ?auto_270545 ?auto_270552 ) ) ( not ( = ?auto_270545 ?auto_270553 ) ) ( not ( = ?auto_270545 ?auto_270554 ) ) ( not ( = ?auto_270545 ?auto_270555 ) ) ( not ( = ?auto_270545 ?auto_270556 ) ) ( not ( = ?auto_270546 ?auto_270547 ) ) ( not ( = ?auto_270546 ?auto_270548 ) ) ( not ( = ?auto_270546 ?auto_270549 ) ) ( not ( = ?auto_270546 ?auto_270550 ) ) ( not ( = ?auto_270546 ?auto_270551 ) ) ( not ( = ?auto_270546 ?auto_270552 ) ) ( not ( = ?auto_270546 ?auto_270553 ) ) ( not ( = ?auto_270546 ?auto_270554 ) ) ( not ( = ?auto_270546 ?auto_270555 ) ) ( not ( = ?auto_270546 ?auto_270556 ) ) ( not ( = ?auto_270547 ?auto_270548 ) ) ( not ( = ?auto_270547 ?auto_270549 ) ) ( not ( = ?auto_270547 ?auto_270550 ) ) ( not ( = ?auto_270547 ?auto_270551 ) ) ( not ( = ?auto_270547 ?auto_270552 ) ) ( not ( = ?auto_270547 ?auto_270553 ) ) ( not ( = ?auto_270547 ?auto_270554 ) ) ( not ( = ?auto_270547 ?auto_270555 ) ) ( not ( = ?auto_270547 ?auto_270556 ) ) ( not ( = ?auto_270548 ?auto_270549 ) ) ( not ( = ?auto_270548 ?auto_270550 ) ) ( not ( = ?auto_270548 ?auto_270551 ) ) ( not ( = ?auto_270548 ?auto_270552 ) ) ( not ( = ?auto_270548 ?auto_270553 ) ) ( not ( = ?auto_270548 ?auto_270554 ) ) ( not ( = ?auto_270548 ?auto_270555 ) ) ( not ( = ?auto_270548 ?auto_270556 ) ) ( not ( = ?auto_270549 ?auto_270550 ) ) ( not ( = ?auto_270549 ?auto_270551 ) ) ( not ( = ?auto_270549 ?auto_270552 ) ) ( not ( = ?auto_270549 ?auto_270553 ) ) ( not ( = ?auto_270549 ?auto_270554 ) ) ( not ( = ?auto_270549 ?auto_270555 ) ) ( not ( = ?auto_270549 ?auto_270556 ) ) ( not ( = ?auto_270550 ?auto_270551 ) ) ( not ( = ?auto_270550 ?auto_270552 ) ) ( not ( = ?auto_270550 ?auto_270553 ) ) ( not ( = ?auto_270550 ?auto_270554 ) ) ( not ( = ?auto_270550 ?auto_270555 ) ) ( not ( = ?auto_270550 ?auto_270556 ) ) ( not ( = ?auto_270551 ?auto_270552 ) ) ( not ( = ?auto_270551 ?auto_270553 ) ) ( not ( = ?auto_270551 ?auto_270554 ) ) ( not ( = ?auto_270551 ?auto_270555 ) ) ( not ( = ?auto_270551 ?auto_270556 ) ) ( not ( = ?auto_270552 ?auto_270553 ) ) ( not ( = ?auto_270552 ?auto_270554 ) ) ( not ( = ?auto_270552 ?auto_270555 ) ) ( not ( = ?auto_270552 ?auto_270556 ) ) ( not ( = ?auto_270553 ?auto_270554 ) ) ( not ( = ?auto_270553 ?auto_270555 ) ) ( not ( = ?auto_270553 ?auto_270556 ) ) ( not ( = ?auto_270554 ?auto_270555 ) ) ( not ( = ?auto_270554 ?auto_270556 ) ) ( not ( = ?auto_270555 ?auto_270556 ) ) ( ON ?auto_270554 ?auto_270555 ) ( ON ?auto_270553 ?auto_270554 ) ( ON ?auto_270552 ?auto_270553 ) ( ON ?auto_270551 ?auto_270552 ) ( ON ?auto_270550 ?auto_270551 ) ( ON ?auto_270549 ?auto_270550 ) ( ON ?auto_270548 ?auto_270549 ) ( CLEAR ?auto_270546 ) ( ON ?auto_270547 ?auto_270548 ) ( CLEAR ?auto_270547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_270544 ?auto_270545 ?auto_270546 ?auto_270547 )
      ( MAKE-12PILE ?auto_270544 ?auto_270545 ?auto_270546 ?auto_270547 ?auto_270548 ?auto_270549 ?auto_270550 ?auto_270551 ?auto_270552 ?auto_270553 ?auto_270554 ?auto_270555 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270594 - BLOCK
      ?auto_270595 - BLOCK
      ?auto_270596 - BLOCK
      ?auto_270597 - BLOCK
      ?auto_270598 - BLOCK
      ?auto_270599 - BLOCK
      ?auto_270600 - BLOCK
      ?auto_270601 - BLOCK
      ?auto_270602 - BLOCK
      ?auto_270603 - BLOCK
      ?auto_270604 - BLOCK
      ?auto_270605 - BLOCK
    )
    :vars
    (
      ?auto_270606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270605 ?auto_270606 ) ( ON-TABLE ?auto_270594 ) ( ON ?auto_270595 ?auto_270594 ) ( not ( = ?auto_270594 ?auto_270595 ) ) ( not ( = ?auto_270594 ?auto_270596 ) ) ( not ( = ?auto_270594 ?auto_270597 ) ) ( not ( = ?auto_270594 ?auto_270598 ) ) ( not ( = ?auto_270594 ?auto_270599 ) ) ( not ( = ?auto_270594 ?auto_270600 ) ) ( not ( = ?auto_270594 ?auto_270601 ) ) ( not ( = ?auto_270594 ?auto_270602 ) ) ( not ( = ?auto_270594 ?auto_270603 ) ) ( not ( = ?auto_270594 ?auto_270604 ) ) ( not ( = ?auto_270594 ?auto_270605 ) ) ( not ( = ?auto_270594 ?auto_270606 ) ) ( not ( = ?auto_270595 ?auto_270596 ) ) ( not ( = ?auto_270595 ?auto_270597 ) ) ( not ( = ?auto_270595 ?auto_270598 ) ) ( not ( = ?auto_270595 ?auto_270599 ) ) ( not ( = ?auto_270595 ?auto_270600 ) ) ( not ( = ?auto_270595 ?auto_270601 ) ) ( not ( = ?auto_270595 ?auto_270602 ) ) ( not ( = ?auto_270595 ?auto_270603 ) ) ( not ( = ?auto_270595 ?auto_270604 ) ) ( not ( = ?auto_270595 ?auto_270605 ) ) ( not ( = ?auto_270595 ?auto_270606 ) ) ( not ( = ?auto_270596 ?auto_270597 ) ) ( not ( = ?auto_270596 ?auto_270598 ) ) ( not ( = ?auto_270596 ?auto_270599 ) ) ( not ( = ?auto_270596 ?auto_270600 ) ) ( not ( = ?auto_270596 ?auto_270601 ) ) ( not ( = ?auto_270596 ?auto_270602 ) ) ( not ( = ?auto_270596 ?auto_270603 ) ) ( not ( = ?auto_270596 ?auto_270604 ) ) ( not ( = ?auto_270596 ?auto_270605 ) ) ( not ( = ?auto_270596 ?auto_270606 ) ) ( not ( = ?auto_270597 ?auto_270598 ) ) ( not ( = ?auto_270597 ?auto_270599 ) ) ( not ( = ?auto_270597 ?auto_270600 ) ) ( not ( = ?auto_270597 ?auto_270601 ) ) ( not ( = ?auto_270597 ?auto_270602 ) ) ( not ( = ?auto_270597 ?auto_270603 ) ) ( not ( = ?auto_270597 ?auto_270604 ) ) ( not ( = ?auto_270597 ?auto_270605 ) ) ( not ( = ?auto_270597 ?auto_270606 ) ) ( not ( = ?auto_270598 ?auto_270599 ) ) ( not ( = ?auto_270598 ?auto_270600 ) ) ( not ( = ?auto_270598 ?auto_270601 ) ) ( not ( = ?auto_270598 ?auto_270602 ) ) ( not ( = ?auto_270598 ?auto_270603 ) ) ( not ( = ?auto_270598 ?auto_270604 ) ) ( not ( = ?auto_270598 ?auto_270605 ) ) ( not ( = ?auto_270598 ?auto_270606 ) ) ( not ( = ?auto_270599 ?auto_270600 ) ) ( not ( = ?auto_270599 ?auto_270601 ) ) ( not ( = ?auto_270599 ?auto_270602 ) ) ( not ( = ?auto_270599 ?auto_270603 ) ) ( not ( = ?auto_270599 ?auto_270604 ) ) ( not ( = ?auto_270599 ?auto_270605 ) ) ( not ( = ?auto_270599 ?auto_270606 ) ) ( not ( = ?auto_270600 ?auto_270601 ) ) ( not ( = ?auto_270600 ?auto_270602 ) ) ( not ( = ?auto_270600 ?auto_270603 ) ) ( not ( = ?auto_270600 ?auto_270604 ) ) ( not ( = ?auto_270600 ?auto_270605 ) ) ( not ( = ?auto_270600 ?auto_270606 ) ) ( not ( = ?auto_270601 ?auto_270602 ) ) ( not ( = ?auto_270601 ?auto_270603 ) ) ( not ( = ?auto_270601 ?auto_270604 ) ) ( not ( = ?auto_270601 ?auto_270605 ) ) ( not ( = ?auto_270601 ?auto_270606 ) ) ( not ( = ?auto_270602 ?auto_270603 ) ) ( not ( = ?auto_270602 ?auto_270604 ) ) ( not ( = ?auto_270602 ?auto_270605 ) ) ( not ( = ?auto_270602 ?auto_270606 ) ) ( not ( = ?auto_270603 ?auto_270604 ) ) ( not ( = ?auto_270603 ?auto_270605 ) ) ( not ( = ?auto_270603 ?auto_270606 ) ) ( not ( = ?auto_270604 ?auto_270605 ) ) ( not ( = ?auto_270604 ?auto_270606 ) ) ( not ( = ?auto_270605 ?auto_270606 ) ) ( ON ?auto_270604 ?auto_270605 ) ( ON ?auto_270603 ?auto_270604 ) ( ON ?auto_270602 ?auto_270603 ) ( ON ?auto_270601 ?auto_270602 ) ( ON ?auto_270600 ?auto_270601 ) ( ON ?auto_270599 ?auto_270600 ) ( ON ?auto_270598 ?auto_270599 ) ( ON ?auto_270597 ?auto_270598 ) ( CLEAR ?auto_270595 ) ( ON ?auto_270596 ?auto_270597 ) ( CLEAR ?auto_270596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270594 ?auto_270595 ?auto_270596 )
      ( MAKE-12PILE ?auto_270594 ?auto_270595 ?auto_270596 ?auto_270597 ?auto_270598 ?auto_270599 ?auto_270600 ?auto_270601 ?auto_270602 ?auto_270603 ?auto_270604 ?auto_270605 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270644 - BLOCK
      ?auto_270645 - BLOCK
      ?auto_270646 - BLOCK
      ?auto_270647 - BLOCK
      ?auto_270648 - BLOCK
      ?auto_270649 - BLOCK
      ?auto_270650 - BLOCK
      ?auto_270651 - BLOCK
      ?auto_270652 - BLOCK
      ?auto_270653 - BLOCK
      ?auto_270654 - BLOCK
      ?auto_270655 - BLOCK
    )
    :vars
    (
      ?auto_270656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270655 ?auto_270656 ) ( ON-TABLE ?auto_270644 ) ( not ( = ?auto_270644 ?auto_270645 ) ) ( not ( = ?auto_270644 ?auto_270646 ) ) ( not ( = ?auto_270644 ?auto_270647 ) ) ( not ( = ?auto_270644 ?auto_270648 ) ) ( not ( = ?auto_270644 ?auto_270649 ) ) ( not ( = ?auto_270644 ?auto_270650 ) ) ( not ( = ?auto_270644 ?auto_270651 ) ) ( not ( = ?auto_270644 ?auto_270652 ) ) ( not ( = ?auto_270644 ?auto_270653 ) ) ( not ( = ?auto_270644 ?auto_270654 ) ) ( not ( = ?auto_270644 ?auto_270655 ) ) ( not ( = ?auto_270644 ?auto_270656 ) ) ( not ( = ?auto_270645 ?auto_270646 ) ) ( not ( = ?auto_270645 ?auto_270647 ) ) ( not ( = ?auto_270645 ?auto_270648 ) ) ( not ( = ?auto_270645 ?auto_270649 ) ) ( not ( = ?auto_270645 ?auto_270650 ) ) ( not ( = ?auto_270645 ?auto_270651 ) ) ( not ( = ?auto_270645 ?auto_270652 ) ) ( not ( = ?auto_270645 ?auto_270653 ) ) ( not ( = ?auto_270645 ?auto_270654 ) ) ( not ( = ?auto_270645 ?auto_270655 ) ) ( not ( = ?auto_270645 ?auto_270656 ) ) ( not ( = ?auto_270646 ?auto_270647 ) ) ( not ( = ?auto_270646 ?auto_270648 ) ) ( not ( = ?auto_270646 ?auto_270649 ) ) ( not ( = ?auto_270646 ?auto_270650 ) ) ( not ( = ?auto_270646 ?auto_270651 ) ) ( not ( = ?auto_270646 ?auto_270652 ) ) ( not ( = ?auto_270646 ?auto_270653 ) ) ( not ( = ?auto_270646 ?auto_270654 ) ) ( not ( = ?auto_270646 ?auto_270655 ) ) ( not ( = ?auto_270646 ?auto_270656 ) ) ( not ( = ?auto_270647 ?auto_270648 ) ) ( not ( = ?auto_270647 ?auto_270649 ) ) ( not ( = ?auto_270647 ?auto_270650 ) ) ( not ( = ?auto_270647 ?auto_270651 ) ) ( not ( = ?auto_270647 ?auto_270652 ) ) ( not ( = ?auto_270647 ?auto_270653 ) ) ( not ( = ?auto_270647 ?auto_270654 ) ) ( not ( = ?auto_270647 ?auto_270655 ) ) ( not ( = ?auto_270647 ?auto_270656 ) ) ( not ( = ?auto_270648 ?auto_270649 ) ) ( not ( = ?auto_270648 ?auto_270650 ) ) ( not ( = ?auto_270648 ?auto_270651 ) ) ( not ( = ?auto_270648 ?auto_270652 ) ) ( not ( = ?auto_270648 ?auto_270653 ) ) ( not ( = ?auto_270648 ?auto_270654 ) ) ( not ( = ?auto_270648 ?auto_270655 ) ) ( not ( = ?auto_270648 ?auto_270656 ) ) ( not ( = ?auto_270649 ?auto_270650 ) ) ( not ( = ?auto_270649 ?auto_270651 ) ) ( not ( = ?auto_270649 ?auto_270652 ) ) ( not ( = ?auto_270649 ?auto_270653 ) ) ( not ( = ?auto_270649 ?auto_270654 ) ) ( not ( = ?auto_270649 ?auto_270655 ) ) ( not ( = ?auto_270649 ?auto_270656 ) ) ( not ( = ?auto_270650 ?auto_270651 ) ) ( not ( = ?auto_270650 ?auto_270652 ) ) ( not ( = ?auto_270650 ?auto_270653 ) ) ( not ( = ?auto_270650 ?auto_270654 ) ) ( not ( = ?auto_270650 ?auto_270655 ) ) ( not ( = ?auto_270650 ?auto_270656 ) ) ( not ( = ?auto_270651 ?auto_270652 ) ) ( not ( = ?auto_270651 ?auto_270653 ) ) ( not ( = ?auto_270651 ?auto_270654 ) ) ( not ( = ?auto_270651 ?auto_270655 ) ) ( not ( = ?auto_270651 ?auto_270656 ) ) ( not ( = ?auto_270652 ?auto_270653 ) ) ( not ( = ?auto_270652 ?auto_270654 ) ) ( not ( = ?auto_270652 ?auto_270655 ) ) ( not ( = ?auto_270652 ?auto_270656 ) ) ( not ( = ?auto_270653 ?auto_270654 ) ) ( not ( = ?auto_270653 ?auto_270655 ) ) ( not ( = ?auto_270653 ?auto_270656 ) ) ( not ( = ?auto_270654 ?auto_270655 ) ) ( not ( = ?auto_270654 ?auto_270656 ) ) ( not ( = ?auto_270655 ?auto_270656 ) ) ( ON ?auto_270654 ?auto_270655 ) ( ON ?auto_270653 ?auto_270654 ) ( ON ?auto_270652 ?auto_270653 ) ( ON ?auto_270651 ?auto_270652 ) ( ON ?auto_270650 ?auto_270651 ) ( ON ?auto_270649 ?auto_270650 ) ( ON ?auto_270648 ?auto_270649 ) ( ON ?auto_270647 ?auto_270648 ) ( ON ?auto_270646 ?auto_270647 ) ( CLEAR ?auto_270644 ) ( ON ?auto_270645 ?auto_270646 ) ( CLEAR ?auto_270645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270644 ?auto_270645 )
      ( MAKE-12PILE ?auto_270644 ?auto_270645 ?auto_270646 ?auto_270647 ?auto_270648 ?auto_270649 ?auto_270650 ?auto_270651 ?auto_270652 ?auto_270653 ?auto_270654 ?auto_270655 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270694 - BLOCK
      ?auto_270695 - BLOCK
      ?auto_270696 - BLOCK
      ?auto_270697 - BLOCK
      ?auto_270698 - BLOCK
      ?auto_270699 - BLOCK
      ?auto_270700 - BLOCK
      ?auto_270701 - BLOCK
      ?auto_270702 - BLOCK
      ?auto_270703 - BLOCK
      ?auto_270704 - BLOCK
      ?auto_270705 - BLOCK
    )
    :vars
    (
      ?auto_270706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270705 ?auto_270706 ) ( not ( = ?auto_270694 ?auto_270695 ) ) ( not ( = ?auto_270694 ?auto_270696 ) ) ( not ( = ?auto_270694 ?auto_270697 ) ) ( not ( = ?auto_270694 ?auto_270698 ) ) ( not ( = ?auto_270694 ?auto_270699 ) ) ( not ( = ?auto_270694 ?auto_270700 ) ) ( not ( = ?auto_270694 ?auto_270701 ) ) ( not ( = ?auto_270694 ?auto_270702 ) ) ( not ( = ?auto_270694 ?auto_270703 ) ) ( not ( = ?auto_270694 ?auto_270704 ) ) ( not ( = ?auto_270694 ?auto_270705 ) ) ( not ( = ?auto_270694 ?auto_270706 ) ) ( not ( = ?auto_270695 ?auto_270696 ) ) ( not ( = ?auto_270695 ?auto_270697 ) ) ( not ( = ?auto_270695 ?auto_270698 ) ) ( not ( = ?auto_270695 ?auto_270699 ) ) ( not ( = ?auto_270695 ?auto_270700 ) ) ( not ( = ?auto_270695 ?auto_270701 ) ) ( not ( = ?auto_270695 ?auto_270702 ) ) ( not ( = ?auto_270695 ?auto_270703 ) ) ( not ( = ?auto_270695 ?auto_270704 ) ) ( not ( = ?auto_270695 ?auto_270705 ) ) ( not ( = ?auto_270695 ?auto_270706 ) ) ( not ( = ?auto_270696 ?auto_270697 ) ) ( not ( = ?auto_270696 ?auto_270698 ) ) ( not ( = ?auto_270696 ?auto_270699 ) ) ( not ( = ?auto_270696 ?auto_270700 ) ) ( not ( = ?auto_270696 ?auto_270701 ) ) ( not ( = ?auto_270696 ?auto_270702 ) ) ( not ( = ?auto_270696 ?auto_270703 ) ) ( not ( = ?auto_270696 ?auto_270704 ) ) ( not ( = ?auto_270696 ?auto_270705 ) ) ( not ( = ?auto_270696 ?auto_270706 ) ) ( not ( = ?auto_270697 ?auto_270698 ) ) ( not ( = ?auto_270697 ?auto_270699 ) ) ( not ( = ?auto_270697 ?auto_270700 ) ) ( not ( = ?auto_270697 ?auto_270701 ) ) ( not ( = ?auto_270697 ?auto_270702 ) ) ( not ( = ?auto_270697 ?auto_270703 ) ) ( not ( = ?auto_270697 ?auto_270704 ) ) ( not ( = ?auto_270697 ?auto_270705 ) ) ( not ( = ?auto_270697 ?auto_270706 ) ) ( not ( = ?auto_270698 ?auto_270699 ) ) ( not ( = ?auto_270698 ?auto_270700 ) ) ( not ( = ?auto_270698 ?auto_270701 ) ) ( not ( = ?auto_270698 ?auto_270702 ) ) ( not ( = ?auto_270698 ?auto_270703 ) ) ( not ( = ?auto_270698 ?auto_270704 ) ) ( not ( = ?auto_270698 ?auto_270705 ) ) ( not ( = ?auto_270698 ?auto_270706 ) ) ( not ( = ?auto_270699 ?auto_270700 ) ) ( not ( = ?auto_270699 ?auto_270701 ) ) ( not ( = ?auto_270699 ?auto_270702 ) ) ( not ( = ?auto_270699 ?auto_270703 ) ) ( not ( = ?auto_270699 ?auto_270704 ) ) ( not ( = ?auto_270699 ?auto_270705 ) ) ( not ( = ?auto_270699 ?auto_270706 ) ) ( not ( = ?auto_270700 ?auto_270701 ) ) ( not ( = ?auto_270700 ?auto_270702 ) ) ( not ( = ?auto_270700 ?auto_270703 ) ) ( not ( = ?auto_270700 ?auto_270704 ) ) ( not ( = ?auto_270700 ?auto_270705 ) ) ( not ( = ?auto_270700 ?auto_270706 ) ) ( not ( = ?auto_270701 ?auto_270702 ) ) ( not ( = ?auto_270701 ?auto_270703 ) ) ( not ( = ?auto_270701 ?auto_270704 ) ) ( not ( = ?auto_270701 ?auto_270705 ) ) ( not ( = ?auto_270701 ?auto_270706 ) ) ( not ( = ?auto_270702 ?auto_270703 ) ) ( not ( = ?auto_270702 ?auto_270704 ) ) ( not ( = ?auto_270702 ?auto_270705 ) ) ( not ( = ?auto_270702 ?auto_270706 ) ) ( not ( = ?auto_270703 ?auto_270704 ) ) ( not ( = ?auto_270703 ?auto_270705 ) ) ( not ( = ?auto_270703 ?auto_270706 ) ) ( not ( = ?auto_270704 ?auto_270705 ) ) ( not ( = ?auto_270704 ?auto_270706 ) ) ( not ( = ?auto_270705 ?auto_270706 ) ) ( ON ?auto_270704 ?auto_270705 ) ( ON ?auto_270703 ?auto_270704 ) ( ON ?auto_270702 ?auto_270703 ) ( ON ?auto_270701 ?auto_270702 ) ( ON ?auto_270700 ?auto_270701 ) ( ON ?auto_270699 ?auto_270700 ) ( ON ?auto_270698 ?auto_270699 ) ( ON ?auto_270697 ?auto_270698 ) ( ON ?auto_270696 ?auto_270697 ) ( ON ?auto_270695 ?auto_270696 ) ( ON ?auto_270694 ?auto_270695 ) ( CLEAR ?auto_270694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270694 )
      ( MAKE-12PILE ?auto_270694 ?auto_270695 ?auto_270696 ?auto_270697 ?auto_270698 ?auto_270699 ?auto_270700 ?auto_270701 ?auto_270702 ?auto_270703 ?auto_270704 ?auto_270705 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270745 - BLOCK
      ?auto_270746 - BLOCK
      ?auto_270747 - BLOCK
      ?auto_270748 - BLOCK
      ?auto_270749 - BLOCK
      ?auto_270750 - BLOCK
      ?auto_270751 - BLOCK
      ?auto_270752 - BLOCK
      ?auto_270753 - BLOCK
      ?auto_270754 - BLOCK
      ?auto_270755 - BLOCK
      ?auto_270756 - BLOCK
      ?auto_270757 - BLOCK
    )
    :vars
    (
      ?auto_270758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270756 ) ( ON ?auto_270757 ?auto_270758 ) ( CLEAR ?auto_270757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270745 ) ( ON ?auto_270746 ?auto_270745 ) ( ON ?auto_270747 ?auto_270746 ) ( ON ?auto_270748 ?auto_270747 ) ( ON ?auto_270749 ?auto_270748 ) ( ON ?auto_270750 ?auto_270749 ) ( ON ?auto_270751 ?auto_270750 ) ( ON ?auto_270752 ?auto_270751 ) ( ON ?auto_270753 ?auto_270752 ) ( ON ?auto_270754 ?auto_270753 ) ( ON ?auto_270755 ?auto_270754 ) ( ON ?auto_270756 ?auto_270755 ) ( not ( = ?auto_270745 ?auto_270746 ) ) ( not ( = ?auto_270745 ?auto_270747 ) ) ( not ( = ?auto_270745 ?auto_270748 ) ) ( not ( = ?auto_270745 ?auto_270749 ) ) ( not ( = ?auto_270745 ?auto_270750 ) ) ( not ( = ?auto_270745 ?auto_270751 ) ) ( not ( = ?auto_270745 ?auto_270752 ) ) ( not ( = ?auto_270745 ?auto_270753 ) ) ( not ( = ?auto_270745 ?auto_270754 ) ) ( not ( = ?auto_270745 ?auto_270755 ) ) ( not ( = ?auto_270745 ?auto_270756 ) ) ( not ( = ?auto_270745 ?auto_270757 ) ) ( not ( = ?auto_270745 ?auto_270758 ) ) ( not ( = ?auto_270746 ?auto_270747 ) ) ( not ( = ?auto_270746 ?auto_270748 ) ) ( not ( = ?auto_270746 ?auto_270749 ) ) ( not ( = ?auto_270746 ?auto_270750 ) ) ( not ( = ?auto_270746 ?auto_270751 ) ) ( not ( = ?auto_270746 ?auto_270752 ) ) ( not ( = ?auto_270746 ?auto_270753 ) ) ( not ( = ?auto_270746 ?auto_270754 ) ) ( not ( = ?auto_270746 ?auto_270755 ) ) ( not ( = ?auto_270746 ?auto_270756 ) ) ( not ( = ?auto_270746 ?auto_270757 ) ) ( not ( = ?auto_270746 ?auto_270758 ) ) ( not ( = ?auto_270747 ?auto_270748 ) ) ( not ( = ?auto_270747 ?auto_270749 ) ) ( not ( = ?auto_270747 ?auto_270750 ) ) ( not ( = ?auto_270747 ?auto_270751 ) ) ( not ( = ?auto_270747 ?auto_270752 ) ) ( not ( = ?auto_270747 ?auto_270753 ) ) ( not ( = ?auto_270747 ?auto_270754 ) ) ( not ( = ?auto_270747 ?auto_270755 ) ) ( not ( = ?auto_270747 ?auto_270756 ) ) ( not ( = ?auto_270747 ?auto_270757 ) ) ( not ( = ?auto_270747 ?auto_270758 ) ) ( not ( = ?auto_270748 ?auto_270749 ) ) ( not ( = ?auto_270748 ?auto_270750 ) ) ( not ( = ?auto_270748 ?auto_270751 ) ) ( not ( = ?auto_270748 ?auto_270752 ) ) ( not ( = ?auto_270748 ?auto_270753 ) ) ( not ( = ?auto_270748 ?auto_270754 ) ) ( not ( = ?auto_270748 ?auto_270755 ) ) ( not ( = ?auto_270748 ?auto_270756 ) ) ( not ( = ?auto_270748 ?auto_270757 ) ) ( not ( = ?auto_270748 ?auto_270758 ) ) ( not ( = ?auto_270749 ?auto_270750 ) ) ( not ( = ?auto_270749 ?auto_270751 ) ) ( not ( = ?auto_270749 ?auto_270752 ) ) ( not ( = ?auto_270749 ?auto_270753 ) ) ( not ( = ?auto_270749 ?auto_270754 ) ) ( not ( = ?auto_270749 ?auto_270755 ) ) ( not ( = ?auto_270749 ?auto_270756 ) ) ( not ( = ?auto_270749 ?auto_270757 ) ) ( not ( = ?auto_270749 ?auto_270758 ) ) ( not ( = ?auto_270750 ?auto_270751 ) ) ( not ( = ?auto_270750 ?auto_270752 ) ) ( not ( = ?auto_270750 ?auto_270753 ) ) ( not ( = ?auto_270750 ?auto_270754 ) ) ( not ( = ?auto_270750 ?auto_270755 ) ) ( not ( = ?auto_270750 ?auto_270756 ) ) ( not ( = ?auto_270750 ?auto_270757 ) ) ( not ( = ?auto_270750 ?auto_270758 ) ) ( not ( = ?auto_270751 ?auto_270752 ) ) ( not ( = ?auto_270751 ?auto_270753 ) ) ( not ( = ?auto_270751 ?auto_270754 ) ) ( not ( = ?auto_270751 ?auto_270755 ) ) ( not ( = ?auto_270751 ?auto_270756 ) ) ( not ( = ?auto_270751 ?auto_270757 ) ) ( not ( = ?auto_270751 ?auto_270758 ) ) ( not ( = ?auto_270752 ?auto_270753 ) ) ( not ( = ?auto_270752 ?auto_270754 ) ) ( not ( = ?auto_270752 ?auto_270755 ) ) ( not ( = ?auto_270752 ?auto_270756 ) ) ( not ( = ?auto_270752 ?auto_270757 ) ) ( not ( = ?auto_270752 ?auto_270758 ) ) ( not ( = ?auto_270753 ?auto_270754 ) ) ( not ( = ?auto_270753 ?auto_270755 ) ) ( not ( = ?auto_270753 ?auto_270756 ) ) ( not ( = ?auto_270753 ?auto_270757 ) ) ( not ( = ?auto_270753 ?auto_270758 ) ) ( not ( = ?auto_270754 ?auto_270755 ) ) ( not ( = ?auto_270754 ?auto_270756 ) ) ( not ( = ?auto_270754 ?auto_270757 ) ) ( not ( = ?auto_270754 ?auto_270758 ) ) ( not ( = ?auto_270755 ?auto_270756 ) ) ( not ( = ?auto_270755 ?auto_270757 ) ) ( not ( = ?auto_270755 ?auto_270758 ) ) ( not ( = ?auto_270756 ?auto_270757 ) ) ( not ( = ?auto_270756 ?auto_270758 ) ) ( not ( = ?auto_270757 ?auto_270758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270757 ?auto_270758 )
      ( !STACK ?auto_270757 ?auto_270756 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270772 - BLOCK
      ?auto_270773 - BLOCK
      ?auto_270774 - BLOCK
      ?auto_270775 - BLOCK
      ?auto_270776 - BLOCK
      ?auto_270777 - BLOCK
      ?auto_270778 - BLOCK
      ?auto_270779 - BLOCK
      ?auto_270780 - BLOCK
      ?auto_270781 - BLOCK
      ?auto_270782 - BLOCK
      ?auto_270783 - BLOCK
      ?auto_270784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270783 ) ( ON-TABLE ?auto_270784 ) ( CLEAR ?auto_270784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270772 ) ( ON ?auto_270773 ?auto_270772 ) ( ON ?auto_270774 ?auto_270773 ) ( ON ?auto_270775 ?auto_270774 ) ( ON ?auto_270776 ?auto_270775 ) ( ON ?auto_270777 ?auto_270776 ) ( ON ?auto_270778 ?auto_270777 ) ( ON ?auto_270779 ?auto_270778 ) ( ON ?auto_270780 ?auto_270779 ) ( ON ?auto_270781 ?auto_270780 ) ( ON ?auto_270782 ?auto_270781 ) ( ON ?auto_270783 ?auto_270782 ) ( not ( = ?auto_270772 ?auto_270773 ) ) ( not ( = ?auto_270772 ?auto_270774 ) ) ( not ( = ?auto_270772 ?auto_270775 ) ) ( not ( = ?auto_270772 ?auto_270776 ) ) ( not ( = ?auto_270772 ?auto_270777 ) ) ( not ( = ?auto_270772 ?auto_270778 ) ) ( not ( = ?auto_270772 ?auto_270779 ) ) ( not ( = ?auto_270772 ?auto_270780 ) ) ( not ( = ?auto_270772 ?auto_270781 ) ) ( not ( = ?auto_270772 ?auto_270782 ) ) ( not ( = ?auto_270772 ?auto_270783 ) ) ( not ( = ?auto_270772 ?auto_270784 ) ) ( not ( = ?auto_270773 ?auto_270774 ) ) ( not ( = ?auto_270773 ?auto_270775 ) ) ( not ( = ?auto_270773 ?auto_270776 ) ) ( not ( = ?auto_270773 ?auto_270777 ) ) ( not ( = ?auto_270773 ?auto_270778 ) ) ( not ( = ?auto_270773 ?auto_270779 ) ) ( not ( = ?auto_270773 ?auto_270780 ) ) ( not ( = ?auto_270773 ?auto_270781 ) ) ( not ( = ?auto_270773 ?auto_270782 ) ) ( not ( = ?auto_270773 ?auto_270783 ) ) ( not ( = ?auto_270773 ?auto_270784 ) ) ( not ( = ?auto_270774 ?auto_270775 ) ) ( not ( = ?auto_270774 ?auto_270776 ) ) ( not ( = ?auto_270774 ?auto_270777 ) ) ( not ( = ?auto_270774 ?auto_270778 ) ) ( not ( = ?auto_270774 ?auto_270779 ) ) ( not ( = ?auto_270774 ?auto_270780 ) ) ( not ( = ?auto_270774 ?auto_270781 ) ) ( not ( = ?auto_270774 ?auto_270782 ) ) ( not ( = ?auto_270774 ?auto_270783 ) ) ( not ( = ?auto_270774 ?auto_270784 ) ) ( not ( = ?auto_270775 ?auto_270776 ) ) ( not ( = ?auto_270775 ?auto_270777 ) ) ( not ( = ?auto_270775 ?auto_270778 ) ) ( not ( = ?auto_270775 ?auto_270779 ) ) ( not ( = ?auto_270775 ?auto_270780 ) ) ( not ( = ?auto_270775 ?auto_270781 ) ) ( not ( = ?auto_270775 ?auto_270782 ) ) ( not ( = ?auto_270775 ?auto_270783 ) ) ( not ( = ?auto_270775 ?auto_270784 ) ) ( not ( = ?auto_270776 ?auto_270777 ) ) ( not ( = ?auto_270776 ?auto_270778 ) ) ( not ( = ?auto_270776 ?auto_270779 ) ) ( not ( = ?auto_270776 ?auto_270780 ) ) ( not ( = ?auto_270776 ?auto_270781 ) ) ( not ( = ?auto_270776 ?auto_270782 ) ) ( not ( = ?auto_270776 ?auto_270783 ) ) ( not ( = ?auto_270776 ?auto_270784 ) ) ( not ( = ?auto_270777 ?auto_270778 ) ) ( not ( = ?auto_270777 ?auto_270779 ) ) ( not ( = ?auto_270777 ?auto_270780 ) ) ( not ( = ?auto_270777 ?auto_270781 ) ) ( not ( = ?auto_270777 ?auto_270782 ) ) ( not ( = ?auto_270777 ?auto_270783 ) ) ( not ( = ?auto_270777 ?auto_270784 ) ) ( not ( = ?auto_270778 ?auto_270779 ) ) ( not ( = ?auto_270778 ?auto_270780 ) ) ( not ( = ?auto_270778 ?auto_270781 ) ) ( not ( = ?auto_270778 ?auto_270782 ) ) ( not ( = ?auto_270778 ?auto_270783 ) ) ( not ( = ?auto_270778 ?auto_270784 ) ) ( not ( = ?auto_270779 ?auto_270780 ) ) ( not ( = ?auto_270779 ?auto_270781 ) ) ( not ( = ?auto_270779 ?auto_270782 ) ) ( not ( = ?auto_270779 ?auto_270783 ) ) ( not ( = ?auto_270779 ?auto_270784 ) ) ( not ( = ?auto_270780 ?auto_270781 ) ) ( not ( = ?auto_270780 ?auto_270782 ) ) ( not ( = ?auto_270780 ?auto_270783 ) ) ( not ( = ?auto_270780 ?auto_270784 ) ) ( not ( = ?auto_270781 ?auto_270782 ) ) ( not ( = ?auto_270781 ?auto_270783 ) ) ( not ( = ?auto_270781 ?auto_270784 ) ) ( not ( = ?auto_270782 ?auto_270783 ) ) ( not ( = ?auto_270782 ?auto_270784 ) ) ( not ( = ?auto_270783 ?auto_270784 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_270784 )
      ( !STACK ?auto_270784 ?auto_270783 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270798 - BLOCK
      ?auto_270799 - BLOCK
      ?auto_270800 - BLOCK
      ?auto_270801 - BLOCK
      ?auto_270802 - BLOCK
      ?auto_270803 - BLOCK
      ?auto_270804 - BLOCK
      ?auto_270805 - BLOCK
      ?auto_270806 - BLOCK
      ?auto_270807 - BLOCK
      ?auto_270808 - BLOCK
      ?auto_270809 - BLOCK
      ?auto_270810 - BLOCK
    )
    :vars
    (
      ?auto_270811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270810 ?auto_270811 ) ( ON-TABLE ?auto_270798 ) ( ON ?auto_270799 ?auto_270798 ) ( ON ?auto_270800 ?auto_270799 ) ( ON ?auto_270801 ?auto_270800 ) ( ON ?auto_270802 ?auto_270801 ) ( ON ?auto_270803 ?auto_270802 ) ( ON ?auto_270804 ?auto_270803 ) ( ON ?auto_270805 ?auto_270804 ) ( ON ?auto_270806 ?auto_270805 ) ( ON ?auto_270807 ?auto_270806 ) ( ON ?auto_270808 ?auto_270807 ) ( not ( = ?auto_270798 ?auto_270799 ) ) ( not ( = ?auto_270798 ?auto_270800 ) ) ( not ( = ?auto_270798 ?auto_270801 ) ) ( not ( = ?auto_270798 ?auto_270802 ) ) ( not ( = ?auto_270798 ?auto_270803 ) ) ( not ( = ?auto_270798 ?auto_270804 ) ) ( not ( = ?auto_270798 ?auto_270805 ) ) ( not ( = ?auto_270798 ?auto_270806 ) ) ( not ( = ?auto_270798 ?auto_270807 ) ) ( not ( = ?auto_270798 ?auto_270808 ) ) ( not ( = ?auto_270798 ?auto_270809 ) ) ( not ( = ?auto_270798 ?auto_270810 ) ) ( not ( = ?auto_270798 ?auto_270811 ) ) ( not ( = ?auto_270799 ?auto_270800 ) ) ( not ( = ?auto_270799 ?auto_270801 ) ) ( not ( = ?auto_270799 ?auto_270802 ) ) ( not ( = ?auto_270799 ?auto_270803 ) ) ( not ( = ?auto_270799 ?auto_270804 ) ) ( not ( = ?auto_270799 ?auto_270805 ) ) ( not ( = ?auto_270799 ?auto_270806 ) ) ( not ( = ?auto_270799 ?auto_270807 ) ) ( not ( = ?auto_270799 ?auto_270808 ) ) ( not ( = ?auto_270799 ?auto_270809 ) ) ( not ( = ?auto_270799 ?auto_270810 ) ) ( not ( = ?auto_270799 ?auto_270811 ) ) ( not ( = ?auto_270800 ?auto_270801 ) ) ( not ( = ?auto_270800 ?auto_270802 ) ) ( not ( = ?auto_270800 ?auto_270803 ) ) ( not ( = ?auto_270800 ?auto_270804 ) ) ( not ( = ?auto_270800 ?auto_270805 ) ) ( not ( = ?auto_270800 ?auto_270806 ) ) ( not ( = ?auto_270800 ?auto_270807 ) ) ( not ( = ?auto_270800 ?auto_270808 ) ) ( not ( = ?auto_270800 ?auto_270809 ) ) ( not ( = ?auto_270800 ?auto_270810 ) ) ( not ( = ?auto_270800 ?auto_270811 ) ) ( not ( = ?auto_270801 ?auto_270802 ) ) ( not ( = ?auto_270801 ?auto_270803 ) ) ( not ( = ?auto_270801 ?auto_270804 ) ) ( not ( = ?auto_270801 ?auto_270805 ) ) ( not ( = ?auto_270801 ?auto_270806 ) ) ( not ( = ?auto_270801 ?auto_270807 ) ) ( not ( = ?auto_270801 ?auto_270808 ) ) ( not ( = ?auto_270801 ?auto_270809 ) ) ( not ( = ?auto_270801 ?auto_270810 ) ) ( not ( = ?auto_270801 ?auto_270811 ) ) ( not ( = ?auto_270802 ?auto_270803 ) ) ( not ( = ?auto_270802 ?auto_270804 ) ) ( not ( = ?auto_270802 ?auto_270805 ) ) ( not ( = ?auto_270802 ?auto_270806 ) ) ( not ( = ?auto_270802 ?auto_270807 ) ) ( not ( = ?auto_270802 ?auto_270808 ) ) ( not ( = ?auto_270802 ?auto_270809 ) ) ( not ( = ?auto_270802 ?auto_270810 ) ) ( not ( = ?auto_270802 ?auto_270811 ) ) ( not ( = ?auto_270803 ?auto_270804 ) ) ( not ( = ?auto_270803 ?auto_270805 ) ) ( not ( = ?auto_270803 ?auto_270806 ) ) ( not ( = ?auto_270803 ?auto_270807 ) ) ( not ( = ?auto_270803 ?auto_270808 ) ) ( not ( = ?auto_270803 ?auto_270809 ) ) ( not ( = ?auto_270803 ?auto_270810 ) ) ( not ( = ?auto_270803 ?auto_270811 ) ) ( not ( = ?auto_270804 ?auto_270805 ) ) ( not ( = ?auto_270804 ?auto_270806 ) ) ( not ( = ?auto_270804 ?auto_270807 ) ) ( not ( = ?auto_270804 ?auto_270808 ) ) ( not ( = ?auto_270804 ?auto_270809 ) ) ( not ( = ?auto_270804 ?auto_270810 ) ) ( not ( = ?auto_270804 ?auto_270811 ) ) ( not ( = ?auto_270805 ?auto_270806 ) ) ( not ( = ?auto_270805 ?auto_270807 ) ) ( not ( = ?auto_270805 ?auto_270808 ) ) ( not ( = ?auto_270805 ?auto_270809 ) ) ( not ( = ?auto_270805 ?auto_270810 ) ) ( not ( = ?auto_270805 ?auto_270811 ) ) ( not ( = ?auto_270806 ?auto_270807 ) ) ( not ( = ?auto_270806 ?auto_270808 ) ) ( not ( = ?auto_270806 ?auto_270809 ) ) ( not ( = ?auto_270806 ?auto_270810 ) ) ( not ( = ?auto_270806 ?auto_270811 ) ) ( not ( = ?auto_270807 ?auto_270808 ) ) ( not ( = ?auto_270807 ?auto_270809 ) ) ( not ( = ?auto_270807 ?auto_270810 ) ) ( not ( = ?auto_270807 ?auto_270811 ) ) ( not ( = ?auto_270808 ?auto_270809 ) ) ( not ( = ?auto_270808 ?auto_270810 ) ) ( not ( = ?auto_270808 ?auto_270811 ) ) ( not ( = ?auto_270809 ?auto_270810 ) ) ( not ( = ?auto_270809 ?auto_270811 ) ) ( not ( = ?auto_270810 ?auto_270811 ) ) ( CLEAR ?auto_270808 ) ( ON ?auto_270809 ?auto_270810 ) ( CLEAR ?auto_270809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_270798 ?auto_270799 ?auto_270800 ?auto_270801 ?auto_270802 ?auto_270803 ?auto_270804 ?auto_270805 ?auto_270806 ?auto_270807 ?auto_270808 ?auto_270809 )
      ( MAKE-13PILE ?auto_270798 ?auto_270799 ?auto_270800 ?auto_270801 ?auto_270802 ?auto_270803 ?auto_270804 ?auto_270805 ?auto_270806 ?auto_270807 ?auto_270808 ?auto_270809 ?auto_270810 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270825 - BLOCK
      ?auto_270826 - BLOCK
      ?auto_270827 - BLOCK
      ?auto_270828 - BLOCK
      ?auto_270829 - BLOCK
      ?auto_270830 - BLOCK
      ?auto_270831 - BLOCK
      ?auto_270832 - BLOCK
      ?auto_270833 - BLOCK
      ?auto_270834 - BLOCK
      ?auto_270835 - BLOCK
      ?auto_270836 - BLOCK
      ?auto_270837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270837 ) ( ON-TABLE ?auto_270825 ) ( ON ?auto_270826 ?auto_270825 ) ( ON ?auto_270827 ?auto_270826 ) ( ON ?auto_270828 ?auto_270827 ) ( ON ?auto_270829 ?auto_270828 ) ( ON ?auto_270830 ?auto_270829 ) ( ON ?auto_270831 ?auto_270830 ) ( ON ?auto_270832 ?auto_270831 ) ( ON ?auto_270833 ?auto_270832 ) ( ON ?auto_270834 ?auto_270833 ) ( ON ?auto_270835 ?auto_270834 ) ( not ( = ?auto_270825 ?auto_270826 ) ) ( not ( = ?auto_270825 ?auto_270827 ) ) ( not ( = ?auto_270825 ?auto_270828 ) ) ( not ( = ?auto_270825 ?auto_270829 ) ) ( not ( = ?auto_270825 ?auto_270830 ) ) ( not ( = ?auto_270825 ?auto_270831 ) ) ( not ( = ?auto_270825 ?auto_270832 ) ) ( not ( = ?auto_270825 ?auto_270833 ) ) ( not ( = ?auto_270825 ?auto_270834 ) ) ( not ( = ?auto_270825 ?auto_270835 ) ) ( not ( = ?auto_270825 ?auto_270836 ) ) ( not ( = ?auto_270825 ?auto_270837 ) ) ( not ( = ?auto_270826 ?auto_270827 ) ) ( not ( = ?auto_270826 ?auto_270828 ) ) ( not ( = ?auto_270826 ?auto_270829 ) ) ( not ( = ?auto_270826 ?auto_270830 ) ) ( not ( = ?auto_270826 ?auto_270831 ) ) ( not ( = ?auto_270826 ?auto_270832 ) ) ( not ( = ?auto_270826 ?auto_270833 ) ) ( not ( = ?auto_270826 ?auto_270834 ) ) ( not ( = ?auto_270826 ?auto_270835 ) ) ( not ( = ?auto_270826 ?auto_270836 ) ) ( not ( = ?auto_270826 ?auto_270837 ) ) ( not ( = ?auto_270827 ?auto_270828 ) ) ( not ( = ?auto_270827 ?auto_270829 ) ) ( not ( = ?auto_270827 ?auto_270830 ) ) ( not ( = ?auto_270827 ?auto_270831 ) ) ( not ( = ?auto_270827 ?auto_270832 ) ) ( not ( = ?auto_270827 ?auto_270833 ) ) ( not ( = ?auto_270827 ?auto_270834 ) ) ( not ( = ?auto_270827 ?auto_270835 ) ) ( not ( = ?auto_270827 ?auto_270836 ) ) ( not ( = ?auto_270827 ?auto_270837 ) ) ( not ( = ?auto_270828 ?auto_270829 ) ) ( not ( = ?auto_270828 ?auto_270830 ) ) ( not ( = ?auto_270828 ?auto_270831 ) ) ( not ( = ?auto_270828 ?auto_270832 ) ) ( not ( = ?auto_270828 ?auto_270833 ) ) ( not ( = ?auto_270828 ?auto_270834 ) ) ( not ( = ?auto_270828 ?auto_270835 ) ) ( not ( = ?auto_270828 ?auto_270836 ) ) ( not ( = ?auto_270828 ?auto_270837 ) ) ( not ( = ?auto_270829 ?auto_270830 ) ) ( not ( = ?auto_270829 ?auto_270831 ) ) ( not ( = ?auto_270829 ?auto_270832 ) ) ( not ( = ?auto_270829 ?auto_270833 ) ) ( not ( = ?auto_270829 ?auto_270834 ) ) ( not ( = ?auto_270829 ?auto_270835 ) ) ( not ( = ?auto_270829 ?auto_270836 ) ) ( not ( = ?auto_270829 ?auto_270837 ) ) ( not ( = ?auto_270830 ?auto_270831 ) ) ( not ( = ?auto_270830 ?auto_270832 ) ) ( not ( = ?auto_270830 ?auto_270833 ) ) ( not ( = ?auto_270830 ?auto_270834 ) ) ( not ( = ?auto_270830 ?auto_270835 ) ) ( not ( = ?auto_270830 ?auto_270836 ) ) ( not ( = ?auto_270830 ?auto_270837 ) ) ( not ( = ?auto_270831 ?auto_270832 ) ) ( not ( = ?auto_270831 ?auto_270833 ) ) ( not ( = ?auto_270831 ?auto_270834 ) ) ( not ( = ?auto_270831 ?auto_270835 ) ) ( not ( = ?auto_270831 ?auto_270836 ) ) ( not ( = ?auto_270831 ?auto_270837 ) ) ( not ( = ?auto_270832 ?auto_270833 ) ) ( not ( = ?auto_270832 ?auto_270834 ) ) ( not ( = ?auto_270832 ?auto_270835 ) ) ( not ( = ?auto_270832 ?auto_270836 ) ) ( not ( = ?auto_270832 ?auto_270837 ) ) ( not ( = ?auto_270833 ?auto_270834 ) ) ( not ( = ?auto_270833 ?auto_270835 ) ) ( not ( = ?auto_270833 ?auto_270836 ) ) ( not ( = ?auto_270833 ?auto_270837 ) ) ( not ( = ?auto_270834 ?auto_270835 ) ) ( not ( = ?auto_270834 ?auto_270836 ) ) ( not ( = ?auto_270834 ?auto_270837 ) ) ( not ( = ?auto_270835 ?auto_270836 ) ) ( not ( = ?auto_270835 ?auto_270837 ) ) ( not ( = ?auto_270836 ?auto_270837 ) ) ( CLEAR ?auto_270835 ) ( ON ?auto_270836 ?auto_270837 ) ( CLEAR ?auto_270836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_270825 ?auto_270826 ?auto_270827 ?auto_270828 ?auto_270829 ?auto_270830 ?auto_270831 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ?auto_270836 )
      ( MAKE-13PILE ?auto_270825 ?auto_270826 ?auto_270827 ?auto_270828 ?auto_270829 ?auto_270830 ?auto_270831 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ?auto_270836 ?auto_270837 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270851 - BLOCK
      ?auto_270852 - BLOCK
      ?auto_270853 - BLOCK
      ?auto_270854 - BLOCK
      ?auto_270855 - BLOCK
      ?auto_270856 - BLOCK
      ?auto_270857 - BLOCK
      ?auto_270858 - BLOCK
      ?auto_270859 - BLOCK
      ?auto_270860 - BLOCK
      ?auto_270861 - BLOCK
      ?auto_270862 - BLOCK
      ?auto_270863 - BLOCK
    )
    :vars
    (
      ?auto_270864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270863 ?auto_270864 ) ( ON-TABLE ?auto_270851 ) ( ON ?auto_270852 ?auto_270851 ) ( ON ?auto_270853 ?auto_270852 ) ( ON ?auto_270854 ?auto_270853 ) ( ON ?auto_270855 ?auto_270854 ) ( ON ?auto_270856 ?auto_270855 ) ( ON ?auto_270857 ?auto_270856 ) ( ON ?auto_270858 ?auto_270857 ) ( ON ?auto_270859 ?auto_270858 ) ( ON ?auto_270860 ?auto_270859 ) ( not ( = ?auto_270851 ?auto_270852 ) ) ( not ( = ?auto_270851 ?auto_270853 ) ) ( not ( = ?auto_270851 ?auto_270854 ) ) ( not ( = ?auto_270851 ?auto_270855 ) ) ( not ( = ?auto_270851 ?auto_270856 ) ) ( not ( = ?auto_270851 ?auto_270857 ) ) ( not ( = ?auto_270851 ?auto_270858 ) ) ( not ( = ?auto_270851 ?auto_270859 ) ) ( not ( = ?auto_270851 ?auto_270860 ) ) ( not ( = ?auto_270851 ?auto_270861 ) ) ( not ( = ?auto_270851 ?auto_270862 ) ) ( not ( = ?auto_270851 ?auto_270863 ) ) ( not ( = ?auto_270851 ?auto_270864 ) ) ( not ( = ?auto_270852 ?auto_270853 ) ) ( not ( = ?auto_270852 ?auto_270854 ) ) ( not ( = ?auto_270852 ?auto_270855 ) ) ( not ( = ?auto_270852 ?auto_270856 ) ) ( not ( = ?auto_270852 ?auto_270857 ) ) ( not ( = ?auto_270852 ?auto_270858 ) ) ( not ( = ?auto_270852 ?auto_270859 ) ) ( not ( = ?auto_270852 ?auto_270860 ) ) ( not ( = ?auto_270852 ?auto_270861 ) ) ( not ( = ?auto_270852 ?auto_270862 ) ) ( not ( = ?auto_270852 ?auto_270863 ) ) ( not ( = ?auto_270852 ?auto_270864 ) ) ( not ( = ?auto_270853 ?auto_270854 ) ) ( not ( = ?auto_270853 ?auto_270855 ) ) ( not ( = ?auto_270853 ?auto_270856 ) ) ( not ( = ?auto_270853 ?auto_270857 ) ) ( not ( = ?auto_270853 ?auto_270858 ) ) ( not ( = ?auto_270853 ?auto_270859 ) ) ( not ( = ?auto_270853 ?auto_270860 ) ) ( not ( = ?auto_270853 ?auto_270861 ) ) ( not ( = ?auto_270853 ?auto_270862 ) ) ( not ( = ?auto_270853 ?auto_270863 ) ) ( not ( = ?auto_270853 ?auto_270864 ) ) ( not ( = ?auto_270854 ?auto_270855 ) ) ( not ( = ?auto_270854 ?auto_270856 ) ) ( not ( = ?auto_270854 ?auto_270857 ) ) ( not ( = ?auto_270854 ?auto_270858 ) ) ( not ( = ?auto_270854 ?auto_270859 ) ) ( not ( = ?auto_270854 ?auto_270860 ) ) ( not ( = ?auto_270854 ?auto_270861 ) ) ( not ( = ?auto_270854 ?auto_270862 ) ) ( not ( = ?auto_270854 ?auto_270863 ) ) ( not ( = ?auto_270854 ?auto_270864 ) ) ( not ( = ?auto_270855 ?auto_270856 ) ) ( not ( = ?auto_270855 ?auto_270857 ) ) ( not ( = ?auto_270855 ?auto_270858 ) ) ( not ( = ?auto_270855 ?auto_270859 ) ) ( not ( = ?auto_270855 ?auto_270860 ) ) ( not ( = ?auto_270855 ?auto_270861 ) ) ( not ( = ?auto_270855 ?auto_270862 ) ) ( not ( = ?auto_270855 ?auto_270863 ) ) ( not ( = ?auto_270855 ?auto_270864 ) ) ( not ( = ?auto_270856 ?auto_270857 ) ) ( not ( = ?auto_270856 ?auto_270858 ) ) ( not ( = ?auto_270856 ?auto_270859 ) ) ( not ( = ?auto_270856 ?auto_270860 ) ) ( not ( = ?auto_270856 ?auto_270861 ) ) ( not ( = ?auto_270856 ?auto_270862 ) ) ( not ( = ?auto_270856 ?auto_270863 ) ) ( not ( = ?auto_270856 ?auto_270864 ) ) ( not ( = ?auto_270857 ?auto_270858 ) ) ( not ( = ?auto_270857 ?auto_270859 ) ) ( not ( = ?auto_270857 ?auto_270860 ) ) ( not ( = ?auto_270857 ?auto_270861 ) ) ( not ( = ?auto_270857 ?auto_270862 ) ) ( not ( = ?auto_270857 ?auto_270863 ) ) ( not ( = ?auto_270857 ?auto_270864 ) ) ( not ( = ?auto_270858 ?auto_270859 ) ) ( not ( = ?auto_270858 ?auto_270860 ) ) ( not ( = ?auto_270858 ?auto_270861 ) ) ( not ( = ?auto_270858 ?auto_270862 ) ) ( not ( = ?auto_270858 ?auto_270863 ) ) ( not ( = ?auto_270858 ?auto_270864 ) ) ( not ( = ?auto_270859 ?auto_270860 ) ) ( not ( = ?auto_270859 ?auto_270861 ) ) ( not ( = ?auto_270859 ?auto_270862 ) ) ( not ( = ?auto_270859 ?auto_270863 ) ) ( not ( = ?auto_270859 ?auto_270864 ) ) ( not ( = ?auto_270860 ?auto_270861 ) ) ( not ( = ?auto_270860 ?auto_270862 ) ) ( not ( = ?auto_270860 ?auto_270863 ) ) ( not ( = ?auto_270860 ?auto_270864 ) ) ( not ( = ?auto_270861 ?auto_270862 ) ) ( not ( = ?auto_270861 ?auto_270863 ) ) ( not ( = ?auto_270861 ?auto_270864 ) ) ( not ( = ?auto_270862 ?auto_270863 ) ) ( not ( = ?auto_270862 ?auto_270864 ) ) ( not ( = ?auto_270863 ?auto_270864 ) ) ( ON ?auto_270862 ?auto_270863 ) ( CLEAR ?auto_270860 ) ( ON ?auto_270861 ?auto_270862 ) ( CLEAR ?auto_270861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270851 ?auto_270852 ?auto_270853 ?auto_270854 ?auto_270855 ?auto_270856 ?auto_270857 ?auto_270858 ?auto_270859 ?auto_270860 ?auto_270861 )
      ( MAKE-13PILE ?auto_270851 ?auto_270852 ?auto_270853 ?auto_270854 ?auto_270855 ?auto_270856 ?auto_270857 ?auto_270858 ?auto_270859 ?auto_270860 ?auto_270861 ?auto_270862 ?auto_270863 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270878 - BLOCK
      ?auto_270879 - BLOCK
      ?auto_270880 - BLOCK
      ?auto_270881 - BLOCK
      ?auto_270882 - BLOCK
      ?auto_270883 - BLOCK
      ?auto_270884 - BLOCK
      ?auto_270885 - BLOCK
      ?auto_270886 - BLOCK
      ?auto_270887 - BLOCK
      ?auto_270888 - BLOCK
      ?auto_270889 - BLOCK
      ?auto_270890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270890 ) ( ON-TABLE ?auto_270878 ) ( ON ?auto_270879 ?auto_270878 ) ( ON ?auto_270880 ?auto_270879 ) ( ON ?auto_270881 ?auto_270880 ) ( ON ?auto_270882 ?auto_270881 ) ( ON ?auto_270883 ?auto_270882 ) ( ON ?auto_270884 ?auto_270883 ) ( ON ?auto_270885 ?auto_270884 ) ( ON ?auto_270886 ?auto_270885 ) ( ON ?auto_270887 ?auto_270886 ) ( not ( = ?auto_270878 ?auto_270879 ) ) ( not ( = ?auto_270878 ?auto_270880 ) ) ( not ( = ?auto_270878 ?auto_270881 ) ) ( not ( = ?auto_270878 ?auto_270882 ) ) ( not ( = ?auto_270878 ?auto_270883 ) ) ( not ( = ?auto_270878 ?auto_270884 ) ) ( not ( = ?auto_270878 ?auto_270885 ) ) ( not ( = ?auto_270878 ?auto_270886 ) ) ( not ( = ?auto_270878 ?auto_270887 ) ) ( not ( = ?auto_270878 ?auto_270888 ) ) ( not ( = ?auto_270878 ?auto_270889 ) ) ( not ( = ?auto_270878 ?auto_270890 ) ) ( not ( = ?auto_270879 ?auto_270880 ) ) ( not ( = ?auto_270879 ?auto_270881 ) ) ( not ( = ?auto_270879 ?auto_270882 ) ) ( not ( = ?auto_270879 ?auto_270883 ) ) ( not ( = ?auto_270879 ?auto_270884 ) ) ( not ( = ?auto_270879 ?auto_270885 ) ) ( not ( = ?auto_270879 ?auto_270886 ) ) ( not ( = ?auto_270879 ?auto_270887 ) ) ( not ( = ?auto_270879 ?auto_270888 ) ) ( not ( = ?auto_270879 ?auto_270889 ) ) ( not ( = ?auto_270879 ?auto_270890 ) ) ( not ( = ?auto_270880 ?auto_270881 ) ) ( not ( = ?auto_270880 ?auto_270882 ) ) ( not ( = ?auto_270880 ?auto_270883 ) ) ( not ( = ?auto_270880 ?auto_270884 ) ) ( not ( = ?auto_270880 ?auto_270885 ) ) ( not ( = ?auto_270880 ?auto_270886 ) ) ( not ( = ?auto_270880 ?auto_270887 ) ) ( not ( = ?auto_270880 ?auto_270888 ) ) ( not ( = ?auto_270880 ?auto_270889 ) ) ( not ( = ?auto_270880 ?auto_270890 ) ) ( not ( = ?auto_270881 ?auto_270882 ) ) ( not ( = ?auto_270881 ?auto_270883 ) ) ( not ( = ?auto_270881 ?auto_270884 ) ) ( not ( = ?auto_270881 ?auto_270885 ) ) ( not ( = ?auto_270881 ?auto_270886 ) ) ( not ( = ?auto_270881 ?auto_270887 ) ) ( not ( = ?auto_270881 ?auto_270888 ) ) ( not ( = ?auto_270881 ?auto_270889 ) ) ( not ( = ?auto_270881 ?auto_270890 ) ) ( not ( = ?auto_270882 ?auto_270883 ) ) ( not ( = ?auto_270882 ?auto_270884 ) ) ( not ( = ?auto_270882 ?auto_270885 ) ) ( not ( = ?auto_270882 ?auto_270886 ) ) ( not ( = ?auto_270882 ?auto_270887 ) ) ( not ( = ?auto_270882 ?auto_270888 ) ) ( not ( = ?auto_270882 ?auto_270889 ) ) ( not ( = ?auto_270882 ?auto_270890 ) ) ( not ( = ?auto_270883 ?auto_270884 ) ) ( not ( = ?auto_270883 ?auto_270885 ) ) ( not ( = ?auto_270883 ?auto_270886 ) ) ( not ( = ?auto_270883 ?auto_270887 ) ) ( not ( = ?auto_270883 ?auto_270888 ) ) ( not ( = ?auto_270883 ?auto_270889 ) ) ( not ( = ?auto_270883 ?auto_270890 ) ) ( not ( = ?auto_270884 ?auto_270885 ) ) ( not ( = ?auto_270884 ?auto_270886 ) ) ( not ( = ?auto_270884 ?auto_270887 ) ) ( not ( = ?auto_270884 ?auto_270888 ) ) ( not ( = ?auto_270884 ?auto_270889 ) ) ( not ( = ?auto_270884 ?auto_270890 ) ) ( not ( = ?auto_270885 ?auto_270886 ) ) ( not ( = ?auto_270885 ?auto_270887 ) ) ( not ( = ?auto_270885 ?auto_270888 ) ) ( not ( = ?auto_270885 ?auto_270889 ) ) ( not ( = ?auto_270885 ?auto_270890 ) ) ( not ( = ?auto_270886 ?auto_270887 ) ) ( not ( = ?auto_270886 ?auto_270888 ) ) ( not ( = ?auto_270886 ?auto_270889 ) ) ( not ( = ?auto_270886 ?auto_270890 ) ) ( not ( = ?auto_270887 ?auto_270888 ) ) ( not ( = ?auto_270887 ?auto_270889 ) ) ( not ( = ?auto_270887 ?auto_270890 ) ) ( not ( = ?auto_270888 ?auto_270889 ) ) ( not ( = ?auto_270888 ?auto_270890 ) ) ( not ( = ?auto_270889 ?auto_270890 ) ) ( ON ?auto_270889 ?auto_270890 ) ( CLEAR ?auto_270887 ) ( ON ?auto_270888 ?auto_270889 ) ( CLEAR ?auto_270888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270878 ?auto_270879 ?auto_270880 ?auto_270881 ?auto_270882 ?auto_270883 ?auto_270884 ?auto_270885 ?auto_270886 ?auto_270887 ?auto_270888 )
      ( MAKE-13PILE ?auto_270878 ?auto_270879 ?auto_270880 ?auto_270881 ?auto_270882 ?auto_270883 ?auto_270884 ?auto_270885 ?auto_270886 ?auto_270887 ?auto_270888 ?auto_270889 ?auto_270890 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270904 - BLOCK
      ?auto_270905 - BLOCK
      ?auto_270906 - BLOCK
      ?auto_270907 - BLOCK
      ?auto_270908 - BLOCK
      ?auto_270909 - BLOCK
      ?auto_270910 - BLOCK
      ?auto_270911 - BLOCK
      ?auto_270912 - BLOCK
      ?auto_270913 - BLOCK
      ?auto_270914 - BLOCK
      ?auto_270915 - BLOCK
      ?auto_270916 - BLOCK
    )
    :vars
    (
      ?auto_270917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270916 ?auto_270917 ) ( ON-TABLE ?auto_270904 ) ( ON ?auto_270905 ?auto_270904 ) ( ON ?auto_270906 ?auto_270905 ) ( ON ?auto_270907 ?auto_270906 ) ( ON ?auto_270908 ?auto_270907 ) ( ON ?auto_270909 ?auto_270908 ) ( ON ?auto_270910 ?auto_270909 ) ( ON ?auto_270911 ?auto_270910 ) ( ON ?auto_270912 ?auto_270911 ) ( not ( = ?auto_270904 ?auto_270905 ) ) ( not ( = ?auto_270904 ?auto_270906 ) ) ( not ( = ?auto_270904 ?auto_270907 ) ) ( not ( = ?auto_270904 ?auto_270908 ) ) ( not ( = ?auto_270904 ?auto_270909 ) ) ( not ( = ?auto_270904 ?auto_270910 ) ) ( not ( = ?auto_270904 ?auto_270911 ) ) ( not ( = ?auto_270904 ?auto_270912 ) ) ( not ( = ?auto_270904 ?auto_270913 ) ) ( not ( = ?auto_270904 ?auto_270914 ) ) ( not ( = ?auto_270904 ?auto_270915 ) ) ( not ( = ?auto_270904 ?auto_270916 ) ) ( not ( = ?auto_270904 ?auto_270917 ) ) ( not ( = ?auto_270905 ?auto_270906 ) ) ( not ( = ?auto_270905 ?auto_270907 ) ) ( not ( = ?auto_270905 ?auto_270908 ) ) ( not ( = ?auto_270905 ?auto_270909 ) ) ( not ( = ?auto_270905 ?auto_270910 ) ) ( not ( = ?auto_270905 ?auto_270911 ) ) ( not ( = ?auto_270905 ?auto_270912 ) ) ( not ( = ?auto_270905 ?auto_270913 ) ) ( not ( = ?auto_270905 ?auto_270914 ) ) ( not ( = ?auto_270905 ?auto_270915 ) ) ( not ( = ?auto_270905 ?auto_270916 ) ) ( not ( = ?auto_270905 ?auto_270917 ) ) ( not ( = ?auto_270906 ?auto_270907 ) ) ( not ( = ?auto_270906 ?auto_270908 ) ) ( not ( = ?auto_270906 ?auto_270909 ) ) ( not ( = ?auto_270906 ?auto_270910 ) ) ( not ( = ?auto_270906 ?auto_270911 ) ) ( not ( = ?auto_270906 ?auto_270912 ) ) ( not ( = ?auto_270906 ?auto_270913 ) ) ( not ( = ?auto_270906 ?auto_270914 ) ) ( not ( = ?auto_270906 ?auto_270915 ) ) ( not ( = ?auto_270906 ?auto_270916 ) ) ( not ( = ?auto_270906 ?auto_270917 ) ) ( not ( = ?auto_270907 ?auto_270908 ) ) ( not ( = ?auto_270907 ?auto_270909 ) ) ( not ( = ?auto_270907 ?auto_270910 ) ) ( not ( = ?auto_270907 ?auto_270911 ) ) ( not ( = ?auto_270907 ?auto_270912 ) ) ( not ( = ?auto_270907 ?auto_270913 ) ) ( not ( = ?auto_270907 ?auto_270914 ) ) ( not ( = ?auto_270907 ?auto_270915 ) ) ( not ( = ?auto_270907 ?auto_270916 ) ) ( not ( = ?auto_270907 ?auto_270917 ) ) ( not ( = ?auto_270908 ?auto_270909 ) ) ( not ( = ?auto_270908 ?auto_270910 ) ) ( not ( = ?auto_270908 ?auto_270911 ) ) ( not ( = ?auto_270908 ?auto_270912 ) ) ( not ( = ?auto_270908 ?auto_270913 ) ) ( not ( = ?auto_270908 ?auto_270914 ) ) ( not ( = ?auto_270908 ?auto_270915 ) ) ( not ( = ?auto_270908 ?auto_270916 ) ) ( not ( = ?auto_270908 ?auto_270917 ) ) ( not ( = ?auto_270909 ?auto_270910 ) ) ( not ( = ?auto_270909 ?auto_270911 ) ) ( not ( = ?auto_270909 ?auto_270912 ) ) ( not ( = ?auto_270909 ?auto_270913 ) ) ( not ( = ?auto_270909 ?auto_270914 ) ) ( not ( = ?auto_270909 ?auto_270915 ) ) ( not ( = ?auto_270909 ?auto_270916 ) ) ( not ( = ?auto_270909 ?auto_270917 ) ) ( not ( = ?auto_270910 ?auto_270911 ) ) ( not ( = ?auto_270910 ?auto_270912 ) ) ( not ( = ?auto_270910 ?auto_270913 ) ) ( not ( = ?auto_270910 ?auto_270914 ) ) ( not ( = ?auto_270910 ?auto_270915 ) ) ( not ( = ?auto_270910 ?auto_270916 ) ) ( not ( = ?auto_270910 ?auto_270917 ) ) ( not ( = ?auto_270911 ?auto_270912 ) ) ( not ( = ?auto_270911 ?auto_270913 ) ) ( not ( = ?auto_270911 ?auto_270914 ) ) ( not ( = ?auto_270911 ?auto_270915 ) ) ( not ( = ?auto_270911 ?auto_270916 ) ) ( not ( = ?auto_270911 ?auto_270917 ) ) ( not ( = ?auto_270912 ?auto_270913 ) ) ( not ( = ?auto_270912 ?auto_270914 ) ) ( not ( = ?auto_270912 ?auto_270915 ) ) ( not ( = ?auto_270912 ?auto_270916 ) ) ( not ( = ?auto_270912 ?auto_270917 ) ) ( not ( = ?auto_270913 ?auto_270914 ) ) ( not ( = ?auto_270913 ?auto_270915 ) ) ( not ( = ?auto_270913 ?auto_270916 ) ) ( not ( = ?auto_270913 ?auto_270917 ) ) ( not ( = ?auto_270914 ?auto_270915 ) ) ( not ( = ?auto_270914 ?auto_270916 ) ) ( not ( = ?auto_270914 ?auto_270917 ) ) ( not ( = ?auto_270915 ?auto_270916 ) ) ( not ( = ?auto_270915 ?auto_270917 ) ) ( not ( = ?auto_270916 ?auto_270917 ) ) ( ON ?auto_270915 ?auto_270916 ) ( ON ?auto_270914 ?auto_270915 ) ( CLEAR ?auto_270912 ) ( ON ?auto_270913 ?auto_270914 ) ( CLEAR ?auto_270913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270904 ?auto_270905 ?auto_270906 ?auto_270907 ?auto_270908 ?auto_270909 ?auto_270910 ?auto_270911 ?auto_270912 ?auto_270913 )
      ( MAKE-13PILE ?auto_270904 ?auto_270905 ?auto_270906 ?auto_270907 ?auto_270908 ?auto_270909 ?auto_270910 ?auto_270911 ?auto_270912 ?auto_270913 ?auto_270914 ?auto_270915 ?auto_270916 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270931 - BLOCK
      ?auto_270932 - BLOCK
      ?auto_270933 - BLOCK
      ?auto_270934 - BLOCK
      ?auto_270935 - BLOCK
      ?auto_270936 - BLOCK
      ?auto_270937 - BLOCK
      ?auto_270938 - BLOCK
      ?auto_270939 - BLOCK
      ?auto_270940 - BLOCK
      ?auto_270941 - BLOCK
      ?auto_270942 - BLOCK
      ?auto_270943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270943 ) ( ON-TABLE ?auto_270931 ) ( ON ?auto_270932 ?auto_270931 ) ( ON ?auto_270933 ?auto_270932 ) ( ON ?auto_270934 ?auto_270933 ) ( ON ?auto_270935 ?auto_270934 ) ( ON ?auto_270936 ?auto_270935 ) ( ON ?auto_270937 ?auto_270936 ) ( ON ?auto_270938 ?auto_270937 ) ( ON ?auto_270939 ?auto_270938 ) ( not ( = ?auto_270931 ?auto_270932 ) ) ( not ( = ?auto_270931 ?auto_270933 ) ) ( not ( = ?auto_270931 ?auto_270934 ) ) ( not ( = ?auto_270931 ?auto_270935 ) ) ( not ( = ?auto_270931 ?auto_270936 ) ) ( not ( = ?auto_270931 ?auto_270937 ) ) ( not ( = ?auto_270931 ?auto_270938 ) ) ( not ( = ?auto_270931 ?auto_270939 ) ) ( not ( = ?auto_270931 ?auto_270940 ) ) ( not ( = ?auto_270931 ?auto_270941 ) ) ( not ( = ?auto_270931 ?auto_270942 ) ) ( not ( = ?auto_270931 ?auto_270943 ) ) ( not ( = ?auto_270932 ?auto_270933 ) ) ( not ( = ?auto_270932 ?auto_270934 ) ) ( not ( = ?auto_270932 ?auto_270935 ) ) ( not ( = ?auto_270932 ?auto_270936 ) ) ( not ( = ?auto_270932 ?auto_270937 ) ) ( not ( = ?auto_270932 ?auto_270938 ) ) ( not ( = ?auto_270932 ?auto_270939 ) ) ( not ( = ?auto_270932 ?auto_270940 ) ) ( not ( = ?auto_270932 ?auto_270941 ) ) ( not ( = ?auto_270932 ?auto_270942 ) ) ( not ( = ?auto_270932 ?auto_270943 ) ) ( not ( = ?auto_270933 ?auto_270934 ) ) ( not ( = ?auto_270933 ?auto_270935 ) ) ( not ( = ?auto_270933 ?auto_270936 ) ) ( not ( = ?auto_270933 ?auto_270937 ) ) ( not ( = ?auto_270933 ?auto_270938 ) ) ( not ( = ?auto_270933 ?auto_270939 ) ) ( not ( = ?auto_270933 ?auto_270940 ) ) ( not ( = ?auto_270933 ?auto_270941 ) ) ( not ( = ?auto_270933 ?auto_270942 ) ) ( not ( = ?auto_270933 ?auto_270943 ) ) ( not ( = ?auto_270934 ?auto_270935 ) ) ( not ( = ?auto_270934 ?auto_270936 ) ) ( not ( = ?auto_270934 ?auto_270937 ) ) ( not ( = ?auto_270934 ?auto_270938 ) ) ( not ( = ?auto_270934 ?auto_270939 ) ) ( not ( = ?auto_270934 ?auto_270940 ) ) ( not ( = ?auto_270934 ?auto_270941 ) ) ( not ( = ?auto_270934 ?auto_270942 ) ) ( not ( = ?auto_270934 ?auto_270943 ) ) ( not ( = ?auto_270935 ?auto_270936 ) ) ( not ( = ?auto_270935 ?auto_270937 ) ) ( not ( = ?auto_270935 ?auto_270938 ) ) ( not ( = ?auto_270935 ?auto_270939 ) ) ( not ( = ?auto_270935 ?auto_270940 ) ) ( not ( = ?auto_270935 ?auto_270941 ) ) ( not ( = ?auto_270935 ?auto_270942 ) ) ( not ( = ?auto_270935 ?auto_270943 ) ) ( not ( = ?auto_270936 ?auto_270937 ) ) ( not ( = ?auto_270936 ?auto_270938 ) ) ( not ( = ?auto_270936 ?auto_270939 ) ) ( not ( = ?auto_270936 ?auto_270940 ) ) ( not ( = ?auto_270936 ?auto_270941 ) ) ( not ( = ?auto_270936 ?auto_270942 ) ) ( not ( = ?auto_270936 ?auto_270943 ) ) ( not ( = ?auto_270937 ?auto_270938 ) ) ( not ( = ?auto_270937 ?auto_270939 ) ) ( not ( = ?auto_270937 ?auto_270940 ) ) ( not ( = ?auto_270937 ?auto_270941 ) ) ( not ( = ?auto_270937 ?auto_270942 ) ) ( not ( = ?auto_270937 ?auto_270943 ) ) ( not ( = ?auto_270938 ?auto_270939 ) ) ( not ( = ?auto_270938 ?auto_270940 ) ) ( not ( = ?auto_270938 ?auto_270941 ) ) ( not ( = ?auto_270938 ?auto_270942 ) ) ( not ( = ?auto_270938 ?auto_270943 ) ) ( not ( = ?auto_270939 ?auto_270940 ) ) ( not ( = ?auto_270939 ?auto_270941 ) ) ( not ( = ?auto_270939 ?auto_270942 ) ) ( not ( = ?auto_270939 ?auto_270943 ) ) ( not ( = ?auto_270940 ?auto_270941 ) ) ( not ( = ?auto_270940 ?auto_270942 ) ) ( not ( = ?auto_270940 ?auto_270943 ) ) ( not ( = ?auto_270941 ?auto_270942 ) ) ( not ( = ?auto_270941 ?auto_270943 ) ) ( not ( = ?auto_270942 ?auto_270943 ) ) ( ON ?auto_270942 ?auto_270943 ) ( ON ?auto_270941 ?auto_270942 ) ( CLEAR ?auto_270939 ) ( ON ?auto_270940 ?auto_270941 ) ( CLEAR ?auto_270940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270931 ?auto_270932 ?auto_270933 ?auto_270934 ?auto_270935 ?auto_270936 ?auto_270937 ?auto_270938 ?auto_270939 ?auto_270940 )
      ( MAKE-13PILE ?auto_270931 ?auto_270932 ?auto_270933 ?auto_270934 ?auto_270935 ?auto_270936 ?auto_270937 ?auto_270938 ?auto_270939 ?auto_270940 ?auto_270941 ?auto_270942 ?auto_270943 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270957 - BLOCK
      ?auto_270958 - BLOCK
      ?auto_270959 - BLOCK
      ?auto_270960 - BLOCK
      ?auto_270961 - BLOCK
      ?auto_270962 - BLOCK
      ?auto_270963 - BLOCK
      ?auto_270964 - BLOCK
      ?auto_270965 - BLOCK
      ?auto_270966 - BLOCK
      ?auto_270967 - BLOCK
      ?auto_270968 - BLOCK
      ?auto_270969 - BLOCK
    )
    :vars
    (
      ?auto_270970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270969 ?auto_270970 ) ( ON-TABLE ?auto_270957 ) ( ON ?auto_270958 ?auto_270957 ) ( ON ?auto_270959 ?auto_270958 ) ( ON ?auto_270960 ?auto_270959 ) ( ON ?auto_270961 ?auto_270960 ) ( ON ?auto_270962 ?auto_270961 ) ( ON ?auto_270963 ?auto_270962 ) ( ON ?auto_270964 ?auto_270963 ) ( not ( = ?auto_270957 ?auto_270958 ) ) ( not ( = ?auto_270957 ?auto_270959 ) ) ( not ( = ?auto_270957 ?auto_270960 ) ) ( not ( = ?auto_270957 ?auto_270961 ) ) ( not ( = ?auto_270957 ?auto_270962 ) ) ( not ( = ?auto_270957 ?auto_270963 ) ) ( not ( = ?auto_270957 ?auto_270964 ) ) ( not ( = ?auto_270957 ?auto_270965 ) ) ( not ( = ?auto_270957 ?auto_270966 ) ) ( not ( = ?auto_270957 ?auto_270967 ) ) ( not ( = ?auto_270957 ?auto_270968 ) ) ( not ( = ?auto_270957 ?auto_270969 ) ) ( not ( = ?auto_270957 ?auto_270970 ) ) ( not ( = ?auto_270958 ?auto_270959 ) ) ( not ( = ?auto_270958 ?auto_270960 ) ) ( not ( = ?auto_270958 ?auto_270961 ) ) ( not ( = ?auto_270958 ?auto_270962 ) ) ( not ( = ?auto_270958 ?auto_270963 ) ) ( not ( = ?auto_270958 ?auto_270964 ) ) ( not ( = ?auto_270958 ?auto_270965 ) ) ( not ( = ?auto_270958 ?auto_270966 ) ) ( not ( = ?auto_270958 ?auto_270967 ) ) ( not ( = ?auto_270958 ?auto_270968 ) ) ( not ( = ?auto_270958 ?auto_270969 ) ) ( not ( = ?auto_270958 ?auto_270970 ) ) ( not ( = ?auto_270959 ?auto_270960 ) ) ( not ( = ?auto_270959 ?auto_270961 ) ) ( not ( = ?auto_270959 ?auto_270962 ) ) ( not ( = ?auto_270959 ?auto_270963 ) ) ( not ( = ?auto_270959 ?auto_270964 ) ) ( not ( = ?auto_270959 ?auto_270965 ) ) ( not ( = ?auto_270959 ?auto_270966 ) ) ( not ( = ?auto_270959 ?auto_270967 ) ) ( not ( = ?auto_270959 ?auto_270968 ) ) ( not ( = ?auto_270959 ?auto_270969 ) ) ( not ( = ?auto_270959 ?auto_270970 ) ) ( not ( = ?auto_270960 ?auto_270961 ) ) ( not ( = ?auto_270960 ?auto_270962 ) ) ( not ( = ?auto_270960 ?auto_270963 ) ) ( not ( = ?auto_270960 ?auto_270964 ) ) ( not ( = ?auto_270960 ?auto_270965 ) ) ( not ( = ?auto_270960 ?auto_270966 ) ) ( not ( = ?auto_270960 ?auto_270967 ) ) ( not ( = ?auto_270960 ?auto_270968 ) ) ( not ( = ?auto_270960 ?auto_270969 ) ) ( not ( = ?auto_270960 ?auto_270970 ) ) ( not ( = ?auto_270961 ?auto_270962 ) ) ( not ( = ?auto_270961 ?auto_270963 ) ) ( not ( = ?auto_270961 ?auto_270964 ) ) ( not ( = ?auto_270961 ?auto_270965 ) ) ( not ( = ?auto_270961 ?auto_270966 ) ) ( not ( = ?auto_270961 ?auto_270967 ) ) ( not ( = ?auto_270961 ?auto_270968 ) ) ( not ( = ?auto_270961 ?auto_270969 ) ) ( not ( = ?auto_270961 ?auto_270970 ) ) ( not ( = ?auto_270962 ?auto_270963 ) ) ( not ( = ?auto_270962 ?auto_270964 ) ) ( not ( = ?auto_270962 ?auto_270965 ) ) ( not ( = ?auto_270962 ?auto_270966 ) ) ( not ( = ?auto_270962 ?auto_270967 ) ) ( not ( = ?auto_270962 ?auto_270968 ) ) ( not ( = ?auto_270962 ?auto_270969 ) ) ( not ( = ?auto_270962 ?auto_270970 ) ) ( not ( = ?auto_270963 ?auto_270964 ) ) ( not ( = ?auto_270963 ?auto_270965 ) ) ( not ( = ?auto_270963 ?auto_270966 ) ) ( not ( = ?auto_270963 ?auto_270967 ) ) ( not ( = ?auto_270963 ?auto_270968 ) ) ( not ( = ?auto_270963 ?auto_270969 ) ) ( not ( = ?auto_270963 ?auto_270970 ) ) ( not ( = ?auto_270964 ?auto_270965 ) ) ( not ( = ?auto_270964 ?auto_270966 ) ) ( not ( = ?auto_270964 ?auto_270967 ) ) ( not ( = ?auto_270964 ?auto_270968 ) ) ( not ( = ?auto_270964 ?auto_270969 ) ) ( not ( = ?auto_270964 ?auto_270970 ) ) ( not ( = ?auto_270965 ?auto_270966 ) ) ( not ( = ?auto_270965 ?auto_270967 ) ) ( not ( = ?auto_270965 ?auto_270968 ) ) ( not ( = ?auto_270965 ?auto_270969 ) ) ( not ( = ?auto_270965 ?auto_270970 ) ) ( not ( = ?auto_270966 ?auto_270967 ) ) ( not ( = ?auto_270966 ?auto_270968 ) ) ( not ( = ?auto_270966 ?auto_270969 ) ) ( not ( = ?auto_270966 ?auto_270970 ) ) ( not ( = ?auto_270967 ?auto_270968 ) ) ( not ( = ?auto_270967 ?auto_270969 ) ) ( not ( = ?auto_270967 ?auto_270970 ) ) ( not ( = ?auto_270968 ?auto_270969 ) ) ( not ( = ?auto_270968 ?auto_270970 ) ) ( not ( = ?auto_270969 ?auto_270970 ) ) ( ON ?auto_270968 ?auto_270969 ) ( ON ?auto_270967 ?auto_270968 ) ( ON ?auto_270966 ?auto_270967 ) ( CLEAR ?auto_270964 ) ( ON ?auto_270965 ?auto_270966 ) ( CLEAR ?auto_270965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270957 ?auto_270958 ?auto_270959 ?auto_270960 ?auto_270961 ?auto_270962 ?auto_270963 ?auto_270964 ?auto_270965 )
      ( MAKE-13PILE ?auto_270957 ?auto_270958 ?auto_270959 ?auto_270960 ?auto_270961 ?auto_270962 ?auto_270963 ?auto_270964 ?auto_270965 ?auto_270966 ?auto_270967 ?auto_270968 ?auto_270969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270984 - BLOCK
      ?auto_270985 - BLOCK
      ?auto_270986 - BLOCK
      ?auto_270987 - BLOCK
      ?auto_270988 - BLOCK
      ?auto_270989 - BLOCK
      ?auto_270990 - BLOCK
      ?auto_270991 - BLOCK
      ?auto_270992 - BLOCK
      ?auto_270993 - BLOCK
      ?auto_270994 - BLOCK
      ?auto_270995 - BLOCK
      ?auto_270996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270996 ) ( ON-TABLE ?auto_270984 ) ( ON ?auto_270985 ?auto_270984 ) ( ON ?auto_270986 ?auto_270985 ) ( ON ?auto_270987 ?auto_270986 ) ( ON ?auto_270988 ?auto_270987 ) ( ON ?auto_270989 ?auto_270988 ) ( ON ?auto_270990 ?auto_270989 ) ( ON ?auto_270991 ?auto_270990 ) ( not ( = ?auto_270984 ?auto_270985 ) ) ( not ( = ?auto_270984 ?auto_270986 ) ) ( not ( = ?auto_270984 ?auto_270987 ) ) ( not ( = ?auto_270984 ?auto_270988 ) ) ( not ( = ?auto_270984 ?auto_270989 ) ) ( not ( = ?auto_270984 ?auto_270990 ) ) ( not ( = ?auto_270984 ?auto_270991 ) ) ( not ( = ?auto_270984 ?auto_270992 ) ) ( not ( = ?auto_270984 ?auto_270993 ) ) ( not ( = ?auto_270984 ?auto_270994 ) ) ( not ( = ?auto_270984 ?auto_270995 ) ) ( not ( = ?auto_270984 ?auto_270996 ) ) ( not ( = ?auto_270985 ?auto_270986 ) ) ( not ( = ?auto_270985 ?auto_270987 ) ) ( not ( = ?auto_270985 ?auto_270988 ) ) ( not ( = ?auto_270985 ?auto_270989 ) ) ( not ( = ?auto_270985 ?auto_270990 ) ) ( not ( = ?auto_270985 ?auto_270991 ) ) ( not ( = ?auto_270985 ?auto_270992 ) ) ( not ( = ?auto_270985 ?auto_270993 ) ) ( not ( = ?auto_270985 ?auto_270994 ) ) ( not ( = ?auto_270985 ?auto_270995 ) ) ( not ( = ?auto_270985 ?auto_270996 ) ) ( not ( = ?auto_270986 ?auto_270987 ) ) ( not ( = ?auto_270986 ?auto_270988 ) ) ( not ( = ?auto_270986 ?auto_270989 ) ) ( not ( = ?auto_270986 ?auto_270990 ) ) ( not ( = ?auto_270986 ?auto_270991 ) ) ( not ( = ?auto_270986 ?auto_270992 ) ) ( not ( = ?auto_270986 ?auto_270993 ) ) ( not ( = ?auto_270986 ?auto_270994 ) ) ( not ( = ?auto_270986 ?auto_270995 ) ) ( not ( = ?auto_270986 ?auto_270996 ) ) ( not ( = ?auto_270987 ?auto_270988 ) ) ( not ( = ?auto_270987 ?auto_270989 ) ) ( not ( = ?auto_270987 ?auto_270990 ) ) ( not ( = ?auto_270987 ?auto_270991 ) ) ( not ( = ?auto_270987 ?auto_270992 ) ) ( not ( = ?auto_270987 ?auto_270993 ) ) ( not ( = ?auto_270987 ?auto_270994 ) ) ( not ( = ?auto_270987 ?auto_270995 ) ) ( not ( = ?auto_270987 ?auto_270996 ) ) ( not ( = ?auto_270988 ?auto_270989 ) ) ( not ( = ?auto_270988 ?auto_270990 ) ) ( not ( = ?auto_270988 ?auto_270991 ) ) ( not ( = ?auto_270988 ?auto_270992 ) ) ( not ( = ?auto_270988 ?auto_270993 ) ) ( not ( = ?auto_270988 ?auto_270994 ) ) ( not ( = ?auto_270988 ?auto_270995 ) ) ( not ( = ?auto_270988 ?auto_270996 ) ) ( not ( = ?auto_270989 ?auto_270990 ) ) ( not ( = ?auto_270989 ?auto_270991 ) ) ( not ( = ?auto_270989 ?auto_270992 ) ) ( not ( = ?auto_270989 ?auto_270993 ) ) ( not ( = ?auto_270989 ?auto_270994 ) ) ( not ( = ?auto_270989 ?auto_270995 ) ) ( not ( = ?auto_270989 ?auto_270996 ) ) ( not ( = ?auto_270990 ?auto_270991 ) ) ( not ( = ?auto_270990 ?auto_270992 ) ) ( not ( = ?auto_270990 ?auto_270993 ) ) ( not ( = ?auto_270990 ?auto_270994 ) ) ( not ( = ?auto_270990 ?auto_270995 ) ) ( not ( = ?auto_270990 ?auto_270996 ) ) ( not ( = ?auto_270991 ?auto_270992 ) ) ( not ( = ?auto_270991 ?auto_270993 ) ) ( not ( = ?auto_270991 ?auto_270994 ) ) ( not ( = ?auto_270991 ?auto_270995 ) ) ( not ( = ?auto_270991 ?auto_270996 ) ) ( not ( = ?auto_270992 ?auto_270993 ) ) ( not ( = ?auto_270992 ?auto_270994 ) ) ( not ( = ?auto_270992 ?auto_270995 ) ) ( not ( = ?auto_270992 ?auto_270996 ) ) ( not ( = ?auto_270993 ?auto_270994 ) ) ( not ( = ?auto_270993 ?auto_270995 ) ) ( not ( = ?auto_270993 ?auto_270996 ) ) ( not ( = ?auto_270994 ?auto_270995 ) ) ( not ( = ?auto_270994 ?auto_270996 ) ) ( not ( = ?auto_270995 ?auto_270996 ) ) ( ON ?auto_270995 ?auto_270996 ) ( ON ?auto_270994 ?auto_270995 ) ( ON ?auto_270993 ?auto_270994 ) ( CLEAR ?auto_270991 ) ( ON ?auto_270992 ?auto_270993 ) ( CLEAR ?auto_270992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270984 ?auto_270985 ?auto_270986 ?auto_270987 ?auto_270988 ?auto_270989 ?auto_270990 ?auto_270991 ?auto_270992 )
      ( MAKE-13PILE ?auto_270984 ?auto_270985 ?auto_270986 ?auto_270987 ?auto_270988 ?auto_270989 ?auto_270990 ?auto_270991 ?auto_270992 ?auto_270993 ?auto_270994 ?auto_270995 ?auto_270996 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271010 - BLOCK
      ?auto_271011 - BLOCK
      ?auto_271012 - BLOCK
      ?auto_271013 - BLOCK
      ?auto_271014 - BLOCK
      ?auto_271015 - BLOCK
      ?auto_271016 - BLOCK
      ?auto_271017 - BLOCK
      ?auto_271018 - BLOCK
      ?auto_271019 - BLOCK
      ?auto_271020 - BLOCK
      ?auto_271021 - BLOCK
      ?auto_271022 - BLOCK
    )
    :vars
    (
      ?auto_271023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271022 ?auto_271023 ) ( ON-TABLE ?auto_271010 ) ( ON ?auto_271011 ?auto_271010 ) ( ON ?auto_271012 ?auto_271011 ) ( ON ?auto_271013 ?auto_271012 ) ( ON ?auto_271014 ?auto_271013 ) ( ON ?auto_271015 ?auto_271014 ) ( ON ?auto_271016 ?auto_271015 ) ( not ( = ?auto_271010 ?auto_271011 ) ) ( not ( = ?auto_271010 ?auto_271012 ) ) ( not ( = ?auto_271010 ?auto_271013 ) ) ( not ( = ?auto_271010 ?auto_271014 ) ) ( not ( = ?auto_271010 ?auto_271015 ) ) ( not ( = ?auto_271010 ?auto_271016 ) ) ( not ( = ?auto_271010 ?auto_271017 ) ) ( not ( = ?auto_271010 ?auto_271018 ) ) ( not ( = ?auto_271010 ?auto_271019 ) ) ( not ( = ?auto_271010 ?auto_271020 ) ) ( not ( = ?auto_271010 ?auto_271021 ) ) ( not ( = ?auto_271010 ?auto_271022 ) ) ( not ( = ?auto_271010 ?auto_271023 ) ) ( not ( = ?auto_271011 ?auto_271012 ) ) ( not ( = ?auto_271011 ?auto_271013 ) ) ( not ( = ?auto_271011 ?auto_271014 ) ) ( not ( = ?auto_271011 ?auto_271015 ) ) ( not ( = ?auto_271011 ?auto_271016 ) ) ( not ( = ?auto_271011 ?auto_271017 ) ) ( not ( = ?auto_271011 ?auto_271018 ) ) ( not ( = ?auto_271011 ?auto_271019 ) ) ( not ( = ?auto_271011 ?auto_271020 ) ) ( not ( = ?auto_271011 ?auto_271021 ) ) ( not ( = ?auto_271011 ?auto_271022 ) ) ( not ( = ?auto_271011 ?auto_271023 ) ) ( not ( = ?auto_271012 ?auto_271013 ) ) ( not ( = ?auto_271012 ?auto_271014 ) ) ( not ( = ?auto_271012 ?auto_271015 ) ) ( not ( = ?auto_271012 ?auto_271016 ) ) ( not ( = ?auto_271012 ?auto_271017 ) ) ( not ( = ?auto_271012 ?auto_271018 ) ) ( not ( = ?auto_271012 ?auto_271019 ) ) ( not ( = ?auto_271012 ?auto_271020 ) ) ( not ( = ?auto_271012 ?auto_271021 ) ) ( not ( = ?auto_271012 ?auto_271022 ) ) ( not ( = ?auto_271012 ?auto_271023 ) ) ( not ( = ?auto_271013 ?auto_271014 ) ) ( not ( = ?auto_271013 ?auto_271015 ) ) ( not ( = ?auto_271013 ?auto_271016 ) ) ( not ( = ?auto_271013 ?auto_271017 ) ) ( not ( = ?auto_271013 ?auto_271018 ) ) ( not ( = ?auto_271013 ?auto_271019 ) ) ( not ( = ?auto_271013 ?auto_271020 ) ) ( not ( = ?auto_271013 ?auto_271021 ) ) ( not ( = ?auto_271013 ?auto_271022 ) ) ( not ( = ?auto_271013 ?auto_271023 ) ) ( not ( = ?auto_271014 ?auto_271015 ) ) ( not ( = ?auto_271014 ?auto_271016 ) ) ( not ( = ?auto_271014 ?auto_271017 ) ) ( not ( = ?auto_271014 ?auto_271018 ) ) ( not ( = ?auto_271014 ?auto_271019 ) ) ( not ( = ?auto_271014 ?auto_271020 ) ) ( not ( = ?auto_271014 ?auto_271021 ) ) ( not ( = ?auto_271014 ?auto_271022 ) ) ( not ( = ?auto_271014 ?auto_271023 ) ) ( not ( = ?auto_271015 ?auto_271016 ) ) ( not ( = ?auto_271015 ?auto_271017 ) ) ( not ( = ?auto_271015 ?auto_271018 ) ) ( not ( = ?auto_271015 ?auto_271019 ) ) ( not ( = ?auto_271015 ?auto_271020 ) ) ( not ( = ?auto_271015 ?auto_271021 ) ) ( not ( = ?auto_271015 ?auto_271022 ) ) ( not ( = ?auto_271015 ?auto_271023 ) ) ( not ( = ?auto_271016 ?auto_271017 ) ) ( not ( = ?auto_271016 ?auto_271018 ) ) ( not ( = ?auto_271016 ?auto_271019 ) ) ( not ( = ?auto_271016 ?auto_271020 ) ) ( not ( = ?auto_271016 ?auto_271021 ) ) ( not ( = ?auto_271016 ?auto_271022 ) ) ( not ( = ?auto_271016 ?auto_271023 ) ) ( not ( = ?auto_271017 ?auto_271018 ) ) ( not ( = ?auto_271017 ?auto_271019 ) ) ( not ( = ?auto_271017 ?auto_271020 ) ) ( not ( = ?auto_271017 ?auto_271021 ) ) ( not ( = ?auto_271017 ?auto_271022 ) ) ( not ( = ?auto_271017 ?auto_271023 ) ) ( not ( = ?auto_271018 ?auto_271019 ) ) ( not ( = ?auto_271018 ?auto_271020 ) ) ( not ( = ?auto_271018 ?auto_271021 ) ) ( not ( = ?auto_271018 ?auto_271022 ) ) ( not ( = ?auto_271018 ?auto_271023 ) ) ( not ( = ?auto_271019 ?auto_271020 ) ) ( not ( = ?auto_271019 ?auto_271021 ) ) ( not ( = ?auto_271019 ?auto_271022 ) ) ( not ( = ?auto_271019 ?auto_271023 ) ) ( not ( = ?auto_271020 ?auto_271021 ) ) ( not ( = ?auto_271020 ?auto_271022 ) ) ( not ( = ?auto_271020 ?auto_271023 ) ) ( not ( = ?auto_271021 ?auto_271022 ) ) ( not ( = ?auto_271021 ?auto_271023 ) ) ( not ( = ?auto_271022 ?auto_271023 ) ) ( ON ?auto_271021 ?auto_271022 ) ( ON ?auto_271020 ?auto_271021 ) ( ON ?auto_271019 ?auto_271020 ) ( ON ?auto_271018 ?auto_271019 ) ( CLEAR ?auto_271016 ) ( ON ?auto_271017 ?auto_271018 ) ( CLEAR ?auto_271017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_271010 ?auto_271011 ?auto_271012 ?auto_271013 ?auto_271014 ?auto_271015 ?auto_271016 ?auto_271017 )
      ( MAKE-13PILE ?auto_271010 ?auto_271011 ?auto_271012 ?auto_271013 ?auto_271014 ?auto_271015 ?auto_271016 ?auto_271017 ?auto_271018 ?auto_271019 ?auto_271020 ?auto_271021 ?auto_271022 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271037 - BLOCK
      ?auto_271038 - BLOCK
      ?auto_271039 - BLOCK
      ?auto_271040 - BLOCK
      ?auto_271041 - BLOCK
      ?auto_271042 - BLOCK
      ?auto_271043 - BLOCK
      ?auto_271044 - BLOCK
      ?auto_271045 - BLOCK
      ?auto_271046 - BLOCK
      ?auto_271047 - BLOCK
      ?auto_271048 - BLOCK
      ?auto_271049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271049 ) ( ON-TABLE ?auto_271037 ) ( ON ?auto_271038 ?auto_271037 ) ( ON ?auto_271039 ?auto_271038 ) ( ON ?auto_271040 ?auto_271039 ) ( ON ?auto_271041 ?auto_271040 ) ( ON ?auto_271042 ?auto_271041 ) ( ON ?auto_271043 ?auto_271042 ) ( not ( = ?auto_271037 ?auto_271038 ) ) ( not ( = ?auto_271037 ?auto_271039 ) ) ( not ( = ?auto_271037 ?auto_271040 ) ) ( not ( = ?auto_271037 ?auto_271041 ) ) ( not ( = ?auto_271037 ?auto_271042 ) ) ( not ( = ?auto_271037 ?auto_271043 ) ) ( not ( = ?auto_271037 ?auto_271044 ) ) ( not ( = ?auto_271037 ?auto_271045 ) ) ( not ( = ?auto_271037 ?auto_271046 ) ) ( not ( = ?auto_271037 ?auto_271047 ) ) ( not ( = ?auto_271037 ?auto_271048 ) ) ( not ( = ?auto_271037 ?auto_271049 ) ) ( not ( = ?auto_271038 ?auto_271039 ) ) ( not ( = ?auto_271038 ?auto_271040 ) ) ( not ( = ?auto_271038 ?auto_271041 ) ) ( not ( = ?auto_271038 ?auto_271042 ) ) ( not ( = ?auto_271038 ?auto_271043 ) ) ( not ( = ?auto_271038 ?auto_271044 ) ) ( not ( = ?auto_271038 ?auto_271045 ) ) ( not ( = ?auto_271038 ?auto_271046 ) ) ( not ( = ?auto_271038 ?auto_271047 ) ) ( not ( = ?auto_271038 ?auto_271048 ) ) ( not ( = ?auto_271038 ?auto_271049 ) ) ( not ( = ?auto_271039 ?auto_271040 ) ) ( not ( = ?auto_271039 ?auto_271041 ) ) ( not ( = ?auto_271039 ?auto_271042 ) ) ( not ( = ?auto_271039 ?auto_271043 ) ) ( not ( = ?auto_271039 ?auto_271044 ) ) ( not ( = ?auto_271039 ?auto_271045 ) ) ( not ( = ?auto_271039 ?auto_271046 ) ) ( not ( = ?auto_271039 ?auto_271047 ) ) ( not ( = ?auto_271039 ?auto_271048 ) ) ( not ( = ?auto_271039 ?auto_271049 ) ) ( not ( = ?auto_271040 ?auto_271041 ) ) ( not ( = ?auto_271040 ?auto_271042 ) ) ( not ( = ?auto_271040 ?auto_271043 ) ) ( not ( = ?auto_271040 ?auto_271044 ) ) ( not ( = ?auto_271040 ?auto_271045 ) ) ( not ( = ?auto_271040 ?auto_271046 ) ) ( not ( = ?auto_271040 ?auto_271047 ) ) ( not ( = ?auto_271040 ?auto_271048 ) ) ( not ( = ?auto_271040 ?auto_271049 ) ) ( not ( = ?auto_271041 ?auto_271042 ) ) ( not ( = ?auto_271041 ?auto_271043 ) ) ( not ( = ?auto_271041 ?auto_271044 ) ) ( not ( = ?auto_271041 ?auto_271045 ) ) ( not ( = ?auto_271041 ?auto_271046 ) ) ( not ( = ?auto_271041 ?auto_271047 ) ) ( not ( = ?auto_271041 ?auto_271048 ) ) ( not ( = ?auto_271041 ?auto_271049 ) ) ( not ( = ?auto_271042 ?auto_271043 ) ) ( not ( = ?auto_271042 ?auto_271044 ) ) ( not ( = ?auto_271042 ?auto_271045 ) ) ( not ( = ?auto_271042 ?auto_271046 ) ) ( not ( = ?auto_271042 ?auto_271047 ) ) ( not ( = ?auto_271042 ?auto_271048 ) ) ( not ( = ?auto_271042 ?auto_271049 ) ) ( not ( = ?auto_271043 ?auto_271044 ) ) ( not ( = ?auto_271043 ?auto_271045 ) ) ( not ( = ?auto_271043 ?auto_271046 ) ) ( not ( = ?auto_271043 ?auto_271047 ) ) ( not ( = ?auto_271043 ?auto_271048 ) ) ( not ( = ?auto_271043 ?auto_271049 ) ) ( not ( = ?auto_271044 ?auto_271045 ) ) ( not ( = ?auto_271044 ?auto_271046 ) ) ( not ( = ?auto_271044 ?auto_271047 ) ) ( not ( = ?auto_271044 ?auto_271048 ) ) ( not ( = ?auto_271044 ?auto_271049 ) ) ( not ( = ?auto_271045 ?auto_271046 ) ) ( not ( = ?auto_271045 ?auto_271047 ) ) ( not ( = ?auto_271045 ?auto_271048 ) ) ( not ( = ?auto_271045 ?auto_271049 ) ) ( not ( = ?auto_271046 ?auto_271047 ) ) ( not ( = ?auto_271046 ?auto_271048 ) ) ( not ( = ?auto_271046 ?auto_271049 ) ) ( not ( = ?auto_271047 ?auto_271048 ) ) ( not ( = ?auto_271047 ?auto_271049 ) ) ( not ( = ?auto_271048 ?auto_271049 ) ) ( ON ?auto_271048 ?auto_271049 ) ( ON ?auto_271047 ?auto_271048 ) ( ON ?auto_271046 ?auto_271047 ) ( ON ?auto_271045 ?auto_271046 ) ( CLEAR ?auto_271043 ) ( ON ?auto_271044 ?auto_271045 ) ( CLEAR ?auto_271044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_271037 ?auto_271038 ?auto_271039 ?auto_271040 ?auto_271041 ?auto_271042 ?auto_271043 ?auto_271044 )
      ( MAKE-13PILE ?auto_271037 ?auto_271038 ?auto_271039 ?auto_271040 ?auto_271041 ?auto_271042 ?auto_271043 ?auto_271044 ?auto_271045 ?auto_271046 ?auto_271047 ?auto_271048 ?auto_271049 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271063 - BLOCK
      ?auto_271064 - BLOCK
      ?auto_271065 - BLOCK
      ?auto_271066 - BLOCK
      ?auto_271067 - BLOCK
      ?auto_271068 - BLOCK
      ?auto_271069 - BLOCK
      ?auto_271070 - BLOCK
      ?auto_271071 - BLOCK
      ?auto_271072 - BLOCK
      ?auto_271073 - BLOCK
      ?auto_271074 - BLOCK
      ?auto_271075 - BLOCK
    )
    :vars
    (
      ?auto_271076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271075 ?auto_271076 ) ( ON-TABLE ?auto_271063 ) ( ON ?auto_271064 ?auto_271063 ) ( ON ?auto_271065 ?auto_271064 ) ( ON ?auto_271066 ?auto_271065 ) ( ON ?auto_271067 ?auto_271066 ) ( ON ?auto_271068 ?auto_271067 ) ( not ( = ?auto_271063 ?auto_271064 ) ) ( not ( = ?auto_271063 ?auto_271065 ) ) ( not ( = ?auto_271063 ?auto_271066 ) ) ( not ( = ?auto_271063 ?auto_271067 ) ) ( not ( = ?auto_271063 ?auto_271068 ) ) ( not ( = ?auto_271063 ?auto_271069 ) ) ( not ( = ?auto_271063 ?auto_271070 ) ) ( not ( = ?auto_271063 ?auto_271071 ) ) ( not ( = ?auto_271063 ?auto_271072 ) ) ( not ( = ?auto_271063 ?auto_271073 ) ) ( not ( = ?auto_271063 ?auto_271074 ) ) ( not ( = ?auto_271063 ?auto_271075 ) ) ( not ( = ?auto_271063 ?auto_271076 ) ) ( not ( = ?auto_271064 ?auto_271065 ) ) ( not ( = ?auto_271064 ?auto_271066 ) ) ( not ( = ?auto_271064 ?auto_271067 ) ) ( not ( = ?auto_271064 ?auto_271068 ) ) ( not ( = ?auto_271064 ?auto_271069 ) ) ( not ( = ?auto_271064 ?auto_271070 ) ) ( not ( = ?auto_271064 ?auto_271071 ) ) ( not ( = ?auto_271064 ?auto_271072 ) ) ( not ( = ?auto_271064 ?auto_271073 ) ) ( not ( = ?auto_271064 ?auto_271074 ) ) ( not ( = ?auto_271064 ?auto_271075 ) ) ( not ( = ?auto_271064 ?auto_271076 ) ) ( not ( = ?auto_271065 ?auto_271066 ) ) ( not ( = ?auto_271065 ?auto_271067 ) ) ( not ( = ?auto_271065 ?auto_271068 ) ) ( not ( = ?auto_271065 ?auto_271069 ) ) ( not ( = ?auto_271065 ?auto_271070 ) ) ( not ( = ?auto_271065 ?auto_271071 ) ) ( not ( = ?auto_271065 ?auto_271072 ) ) ( not ( = ?auto_271065 ?auto_271073 ) ) ( not ( = ?auto_271065 ?auto_271074 ) ) ( not ( = ?auto_271065 ?auto_271075 ) ) ( not ( = ?auto_271065 ?auto_271076 ) ) ( not ( = ?auto_271066 ?auto_271067 ) ) ( not ( = ?auto_271066 ?auto_271068 ) ) ( not ( = ?auto_271066 ?auto_271069 ) ) ( not ( = ?auto_271066 ?auto_271070 ) ) ( not ( = ?auto_271066 ?auto_271071 ) ) ( not ( = ?auto_271066 ?auto_271072 ) ) ( not ( = ?auto_271066 ?auto_271073 ) ) ( not ( = ?auto_271066 ?auto_271074 ) ) ( not ( = ?auto_271066 ?auto_271075 ) ) ( not ( = ?auto_271066 ?auto_271076 ) ) ( not ( = ?auto_271067 ?auto_271068 ) ) ( not ( = ?auto_271067 ?auto_271069 ) ) ( not ( = ?auto_271067 ?auto_271070 ) ) ( not ( = ?auto_271067 ?auto_271071 ) ) ( not ( = ?auto_271067 ?auto_271072 ) ) ( not ( = ?auto_271067 ?auto_271073 ) ) ( not ( = ?auto_271067 ?auto_271074 ) ) ( not ( = ?auto_271067 ?auto_271075 ) ) ( not ( = ?auto_271067 ?auto_271076 ) ) ( not ( = ?auto_271068 ?auto_271069 ) ) ( not ( = ?auto_271068 ?auto_271070 ) ) ( not ( = ?auto_271068 ?auto_271071 ) ) ( not ( = ?auto_271068 ?auto_271072 ) ) ( not ( = ?auto_271068 ?auto_271073 ) ) ( not ( = ?auto_271068 ?auto_271074 ) ) ( not ( = ?auto_271068 ?auto_271075 ) ) ( not ( = ?auto_271068 ?auto_271076 ) ) ( not ( = ?auto_271069 ?auto_271070 ) ) ( not ( = ?auto_271069 ?auto_271071 ) ) ( not ( = ?auto_271069 ?auto_271072 ) ) ( not ( = ?auto_271069 ?auto_271073 ) ) ( not ( = ?auto_271069 ?auto_271074 ) ) ( not ( = ?auto_271069 ?auto_271075 ) ) ( not ( = ?auto_271069 ?auto_271076 ) ) ( not ( = ?auto_271070 ?auto_271071 ) ) ( not ( = ?auto_271070 ?auto_271072 ) ) ( not ( = ?auto_271070 ?auto_271073 ) ) ( not ( = ?auto_271070 ?auto_271074 ) ) ( not ( = ?auto_271070 ?auto_271075 ) ) ( not ( = ?auto_271070 ?auto_271076 ) ) ( not ( = ?auto_271071 ?auto_271072 ) ) ( not ( = ?auto_271071 ?auto_271073 ) ) ( not ( = ?auto_271071 ?auto_271074 ) ) ( not ( = ?auto_271071 ?auto_271075 ) ) ( not ( = ?auto_271071 ?auto_271076 ) ) ( not ( = ?auto_271072 ?auto_271073 ) ) ( not ( = ?auto_271072 ?auto_271074 ) ) ( not ( = ?auto_271072 ?auto_271075 ) ) ( not ( = ?auto_271072 ?auto_271076 ) ) ( not ( = ?auto_271073 ?auto_271074 ) ) ( not ( = ?auto_271073 ?auto_271075 ) ) ( not ( = ?auto_271073 ?auto_271076 ) ) ( not ( = ?auto_271074 ?auto_271075 ) ) ( not ( = ?auto_271074 ?auto_271076 ) ) ( not ( = ?auto_271075 ?auto_271076 ) ) ( ON ?auto_271074 ?auto_271075 ) ( ON ?auto_271073 ?auto_271074 ) ( ON ?auto_271072 ?auto_271073 ) ( ON ?auto_271071 ?auto_271072 ) ( ON ?auto_271070 ?auto_271071 ) ( CLEAR ?auto_271068 ) ( ON ?auto_271069 ?auto_271070 ) ( CLEAR ?auto_271069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_271063 ?auto_271064 ?auto_271065 ?auto_271066 ?auto_271067 ?auto_271068 ?auto_271069 )
      ( MAKE-13PILE ?auto_271063 ?auto_271064 ?auto_271065 ?auto_271066 ?auto_271067 ?auto_271068 ?auto_271069 ?auto_271070 ?auto_271071 ?auto_271072 ?auto_271073 ?auto_271074 ?auto_271075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271090 - BLOCK
      ?auto_271091 - BLOCK
      ?auto_271092 - BLOCK
      ?auto_271093 - BLOCK
      ?auto_271094 - BLOCK
      ?auto_271095 - BLOCK
      ?auto_271096 - BLOCK
      ?auto_271097 - BLOCK
      ?auto_271098 - BLOCK
      ?auto_271099 - BLOCK
      ?auto_271100 - BLOCK
      ?auto_271101 - BLOCK
      ?auto_271102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271102 ) ( ON-TABLE ?auto_271090 ) ( ON ?auto_271091 ?auto_271090 ) ( ON ?auto_271092 ?auto_271091 ) ( ON ?auto_271093 ?auto_271092 ) ( ON ?auto_271094 ?auto_271093 ) ( ON ?auto_271095 ?auto_271094 ) ( not ( = ?auto_271090 ?auto_271091 ) ) ( not ( = ?auto_271090 ?auto_271092 ) ) ( not ( = ?auto_271090 ?auto_271093 ) ) ( not ( = ?auto_271090 ?auto_271094 ) ) ( not ( = ?auto_271090 ?auto_271095 ) ) ( not ( = ?auto_271090 ?auto_271096 ) ) ( not ( = ?auto_271090 ?auto_271097 ) ) ( not ( = ?auto_271090 ?auto_271098 ) ) ( not ( = ?auto_271090 ?auto_271099 ) ) ( not ( = ?auto_271090 ?auto_271100 ) ) ( not ( = ?auto_271090 ?auto_271101 ) ) ( not ( = ?auto_271090 ?auto_271102 ) ) ( not ( = ?auto_271091 ?auto_271092 ) ) ( not ( = ?auto_271091 ?auto_271093 ) ) ( not ( = ?auto_271091 ?auto_271094 ) ) ( not ( = ?auto_271091 ?auto_271095 ) ) ( not ( = ?auto_271091 ?auto_271096 ) ) ( not ( = ?auto_271091 ?auto_271097 ) ) ( not ( = ?auto_271091 ?auto_271098 ) ) ( not ( = ?auto_271091 ?auto_271099 ) ) ( not ( = ?auto_271091 ?auto_271100 ) ) ( not ( = ?auto_271091 ?auto_271101 ) ) ( not ( = ?auto_271091 ?auto_271102 ) ) ( not ( = ?auto_271092 ?auto_271093 ) ) ( not ( = ?auto_271092 ?auto_271094 ) ) ( not ( = ?auto_271092 ?auto_271095 ) ) ( not ( = ?auto_271092 ?auto_271096 ) ) ( not ( = ?auto_271092 ?auto_271097 ) ) ( not ( = ?auto_271092 ?auto_271098 ) ) ( not ( = ?auto_271092 ?auto_271099 ) ) ( not ( = ?auto_271092 ?auto_271100 ) ) ( not ( = ?auto_271092 ?auto_271101 ) ) ( not ( = ?auto_271092 ?auto_271102 ) ) ( not ( = ?auto_271093 ?auto_271094 ) ) ( not ( = ?auto_271093 ?auto_271095 ) ) ( not ( = ?auto_271093 ?auto_271096 ) ) ( not ( = ?auto_271093 ?auto_271097 ) ) ( not ( = ?auto_271093 ?auto_271098 ) ) ( not ( = ?auto_271093 ?auto_271099 ) ) ( not ( = ?auto_271093 ?auto_271100 ) ) ( not ( = ?auto_271093 ?auto_271101 ) ) ( not ( = ?auto_271093 ?auto_271102 ) ) ( not ( = ?auto_271094 ?auto_271095 ) ) ( not ( = ?auto_271094 ?auto_271096 ) ) ( not ( = ?auto_271094 ?auto_271097 ) ) ( not ( = ?auto_271094 ?auto_271098 ) ) ( not ( = ?auto_271094 ?auto_271099 ) ) ( not ( = ?auto_271094 ?auto_271100 ) ) ( not ( = ?auto_271094 ?auto_271101 ) ) ( not ( = ?auto_271094 ?auto_271102 ) ) ( not ( = ?auto_271095 ?auto_271096 ) ) ( not ( = ?auto_271095 ?auto_271097 ) ) ( not ( = ?auto_271095 ?auto_271098 ) ) ( not ( = ?auto_271095 ?auto_271099 ) ) ( not ( = ?auto_271095 ?auto_271100 ) ) ( not ( = ?auto_271095 ?auto_271101 ) ) ( not ( = ?auto_271095 ?auto_271102 ) ) ( not ( = ?auto_271096 ?auto_271097 ) ) ( not ( = ?auto_271096 ?auto_271098 ) ) ( not ( = ?auto_271096 ?auto_271099 ) ) ( not ( = ?auto_271096 ?auto_271100 ) ) ( not ( = ?auto_271096 ?auto_271101 ) ) ( not ( = ?auto_271096 ?auto_271102 ) ) ( not ( = ?auto_271097 ?auto_271098 ) ) ( not ( = ?auto_271097 ?auto_271099 ) ) ( not ( = ?auto_271097 ?auto_271100 ) ) ( not ( = ?auto_271097 ?auto_271101 ) ) ( not ( = ?auto_271097 ?auto_271102 ) ) ( not ( = ?auto_271098 ?auto_271099 ) ) ( not ( = ?auto_271098 ?auto_271100 ) ) ( not ( = ?auto_271098 ?auto_271101 ) ) ( not ( = ?auto_271098 ?auto_271102 ) ) ( not ( = ?auto_271099 ?auto_271100 ) ) ( not ( = ?auto_271099 ?auto_271101 ) ) ( not ( = ?auto_271099 ?auto_271102 ) ) ( not ( = ?auto_271100 ?auto_271101 ) ) ( not ( = ?auto_271100 ?auto_271102 ) ) ( not ( = ?auto_271101 ?auto_271102 ) ) ( ON ?auto_271101 ?auto_271102 ) ( ON ?auto_271100 ?auto_271101 ) ( ON ?auto_271099 ?auto_271100 ) ( ON ?auto_271098 ?auto_271099 ) ( ON ?auto_271097 ?auto_271098 ) ( CLEAR ?auto_271095 ) ( ON ?auto_271096 ?auto_271097 ) ( CLEAR ?auto_271096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_271090 ?auto_271091 ?auto_271092 ?auto_271093 ?auto_271094 ?auto_271095 ?auto_271096 )
      ( MAKE-13PILE ?auto_271090 ?auto_271091 ?auto_271092 ?auto_271093 ?auto_271094 ?auto_271095 ?auto_271096 ?auto_271097 ?auto_271098 ?auto_271099 ?auto_271100 ?auto_271101 ?auto_271102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271116 - BLOCK
      ?auto_271117 - BLOCK
      ?auto_271118 - BLOCK
      ?auto_271119 - BLOCK
      ?auto_271120 - BLOCK
      ?auto_271121 - BLOCK
      ?auto_271122 - BLOCK
      ?auto_271123 - BLOCK
      ?auto_271124 - BLOCK
      ?auto_271125 - BLOCK
      ?auto_271126 - BLOCK
      ?auto_271127 - BLOCK
      ?auto_271128 - BLOCK
    )
    :vars
    (
      ?auto_271129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271128 ?auto_271129 ) ( ON-TABLE ?auto_271116 ) ( ON ?auto_271117 ?auto_271116 ) ( ON ?auto_271118 ?auto_271117 ) ( ON ?auto_271119 ?auto_271118 ) ( ON ?auto_271120 ?auto_271119 ) ( not ( = ?auto_271116 ?auto_271117 ) ) ( not ( = ?auto_271116 ?auto_271118 ) ) ( not ( = ?auto_271116 ?auto_271119 ) ) ( not ( = ?auto_271116 ?auto_271120 ) ) ( not ( = ?auto_271116 ?auto_271121 ) ) ( not ( = ?auto_271116 ?auto_271122 ) ) ( not ( = ?auto_271116 ?auto_271123 ) ) ( not ( = ?auto_271116 ?auto_271124 ) ) ( not ( = ?auto_271116 ?auto_271125 ) ) ( not ( = ?auto_271116 ?auto_271126 ) ) ( not ( = ?auto_271116 ?auto_271127 ) ) ( not ( = ?auto_271116 ?auto_271128 ) ) ( not ( = ?auto_271116 ?auto_271129 ) ) ( not ( = ?auto_271117 ?auto_271118 ) ) ( not ( = ?auto_271117 ?auto_271119 ) ) ( not ( = ?auto_271117 ?auto_271120 ) ) ( not ( = ?auto_271117 ?auto_271121 ) ) ( not ( = ?auto_271117 ?auto_271122 ) ) ( not ( = ?auto_271117 ?auto_271123 ) ) ( not ( = ?auto_271117 ?auto_271124 ) ) ( not ( = ?auto_271117 ?auto_271125 ) ) ( not ( = ?auto_271117 ?auto_271126 ) ) ( not ( = ?auto_271117 ?auto_271127 ) ) ( not ( = ?auto_271117 ?auto_271128 ) ) ( not ( = ?auto_271117 ?auto_271129 ) ) ( not ( = ?auto_271118 ?auto_271119 ) ) ( not ( = ?auto_271118 ?auto_271120 ) ) ( not ( = ?auto_271118 ?auto_271121 ) ) ( not ( = ?auto_271118 ?auto_271122 ) ) ( not ( = ?auto_271118 ?auto_271123 ) ) ( not ( = ?auto_271118 ?auto_271124 ) ) ( not ( = ?auto_271118 ?auto_271125 ) ) ( not ( = ?auto_271118 ?auto_271126 ) ) ( not ( = ?auto_271118 ?auto_271127 ) ) ( not ( = ?auto_271118 ?auto_271128 ) ) ( not ( = ?auto_271118 ?auto_271129 ) ) ( not ( = ?auto_271119 ?auto_271120 ) ) ( not ( = ?auto_271119 ?auto_271121 ) ) ( not ( = ?auto_271119 ?auto_271122 ) ) ( not ( = ?auto_271119 ?auto_271123 ) ) ( not ( = ?auto_271119 ?auto_271124 ) ) ( not ( = ?auto_271119 ?auto_271125 ) ) ( not ( = ?auto_271119 ?auto_271126 ) ) ( not ( = ?auto_271119 ?auto_271127 ) ) ( not ( = ?auto_271119 ?auto_271128 ) ) ( not ( = ?auto_271119 ?auto_271129 ) ) ( not ( = ?auto_271120 ?auto_271121 ) ) ( not ( = ?auto_271120 ?auto_271122 ) ) ( not ( = ?auto_271120 ?auto_271123 ) ) ( not ( = ?auto_271120 ?auto_271124 ) ) ( not ( = ?auto_271120 ?auto_271125 ) ) ( not ( = ?auto_271120 ?auto_271126 ) ) ( not ( = ?auto_271120 ?auto_271127 ) ) ( not ( = ?auto_271120 ?auto_271128 ) ) ( not ( = ?auto_271120 ?auto_271129 ) ) ( not ( = ?auto_271121 ?auto_271122 ) ) ( not ( = ?auto_271121 ?auto_271123 ) ) ( not ( = ?auto_271121 ?auto_271124 ) ) ( not ( = ?auto_271121 ?auto_271125 ) ) ( not ( = ?auto_271121 ?auto_271126 ) ) ( not ( = ?auto_271121 ?auto_271127 ) ) ( not ( = ?auto_271121 ?auto_271128 ) ) ( not ( = ?auto_271121 ?auto_271129 ) ) ( not ( = ?auto_271122 ?auto_271123 ) ) ( not ( = ?auto_271122 ?auto_271124 ) ) ( not ( = ?auto_271122 ?auto_271125 ) ) ( not ( = ?auto_271122 ?auto_271126 ) ) ( not ( = ?auto_271122 ?auto_271127 ) ) ( not ( = ?auto_271122 ?auto_271128 ) ) ( not ( = ?auto_271122 ?auto_271129 ) ) ( not ( = ?auto_271123 ?auto_271124 ) ) ( not ( = ?auto_271123 ?auto_271125 ) ) ( not ( = ?auto_271123 ?auto_271126 ) ) ( not ( = ?auto_271123 ?auto_271127 ) ) ( not ( = ?auto_271123 ?auto_271128 ) ) ( not ( = ?auto_271123 ?auto_271129 ) ) ( not ( = ?auto_271124 ?auto_271125 ) ) ( not ( = ?auto_271124 ?auto_271126 ) ) ( not ( = ?auto_271124 ?auto_271127 ) ) ( not ( = ?auto_271124 ?auto_271128 ) ) ( not ( = ?auto_271124 ?auto_271129 ) ) ( not ( = ?auto_271125 ?auto_271126 ) ) ( not ( = ?auto_271125 ?auto_271127 ) ) ( not ( = ?auto_271125 ?auto_271128 ) ) ( not ( = ?auto_271125 ?auto_271129 ) ) ( not ( = ?auto_271126 ?auto_271127 ) ) ( not ( = ?auto_271126 ?auto_271128 ) ) ( not ( = ?auto_271126 ?auto_271129 ) ) ( not ( = ?auto_271127 ?auto_271128 ) ) ( not ( = ?auto_271127 ?auto_271129 ) ) ( not ( = ?auto_271128 ?auto_271129 ) ) ( ON ?auto_271127 ?auto_271128 ) ( ON ?auto_271126 ?auto_271127 ) ( ON ?auto_271125 ?auto_271126 ) ( ON ?auto_271124 ?auto_271125 ) ( ON ?auto_271123 ?auto_271124 ) ( ON ?auto_271122 ?auto_271123 ) ( CLEAR ?auto_271120 ) ( ON ?auto_271121 ?auto_271122 ) ( CLEAR ?auto_271121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271116 ?auto_271117 ?auto_271118 ?auto_271119 ?auto_271120 ?auto_271121 )
      ( MAKE-13PILE ?auto_271116 ?auto_271117 ?auto_271118 ?auto_271119 ?auto_271120 ?auto_271121 ?auto_271122 ?auto_271123 ?auto_271124 ?auto_271125 ?auto_271126 ?auto_271127 ?auto_271128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271143 - BLOCK
      ?auto_271144 - BLOCK
      ?auto_271145 - BLOCK
      ?auto_271146 - BLOCK
      ?auto_271147 - BLOCK
      ?auto_271148 - BLOCK
      ?auto_271149 - BLOCK
      ?auto_271150 - BLOCK
      ?auto_271151 - BLOCK
      ?auto_271152 - BLOCK
      ?auto_271153 - BLOCK
      ?auto_271154 - BLOCK
      ?auto_271155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271155 ) ( ON-TABLE ?auto_271143 ) ( ON ?auto_271144 ?auto_271143 ) ( ON ?auto_271145 ?auto_271144 ) ( ON ?auto_271146 ?auto_271145 ) ( ON ?auto_271147 ?auto_271146 ) ( not ( = ?auto_271143 ?auto_271144 ) ) ( not ( = ?auto_271143 ?auto_271145 ) ) ( not ( = ?auto_271143 ?auto_271146 ) ) ( not ( = ?auto_271143 ?auto_271147 ) ) ( not ( = ?auto_271143 ?auto_271148 ) ) ( not ( = ?auto_271143 ?auto_271149 ) ) ( not ( = ?auto_271143 ?auto_271150 ) ) ( not ( = ?auto_271143 ?auto_271151 ) ) ( not ( = ?auto_271143 ?auto_271152 ) ) ( not ( = ?auto_271143 ?auto_271153 ) ) ( not ( = ?auto_271143 ?auto_271154 ) ) ( not ( = ?auto_271143 ?auto_271155 ) ) ( not ( = ?auto_271144 ?auto_271145 ) ) ( not ( = ?auto_271144 ?auto_271146 ) ) ( not ( = ?auto_271144 ?auto_271147 ) ) ( not ( = ?auto_271144 ?auto_271148 ) ) ( not ( = ?auto_271144 ?auto_271149 ) ) ( not ( = ?auto_271144 ?auto_271150 ) ) ( not ( = ?auto_271144 ?auto_271151 ) ) ( not ( = ?auto_271144 ?auto_271152 ) ) ( not ( = ?auto_271144 ?auto_271153 ) ) ( not ( = ?auto_271144 ?auto_271154 ) ) ( not ( = ?auto_271144 ?auto_271155 ) ) ( not ( = ?auto_271145 ?auto_271146 ) ) ( not ( = ?auto_271145 ?auto_271147 ) ) ( not ( = ?auto_271145 ?auto_271148 ) ) ( not ( = ?auto_271145 ?auto_271149 ) ) ( not ( = ?auto_271145 ?auto_271150 ) ) ( not ( = ?auto_271145 ?auto_271151 ) ) ( not ( = ?auto_271145 ?auto_271152 ) ) ( not ( = ?auto_271145 ?auto_271153 ) ) ( not ( = ?auto_271145 ?auto_271154 ) ) ( not ( = ?auto_271145 ?auto_271155 ) ) ( not ( = ?auto_271146 ?auto_271147 ) ) ( not ( = ?auto_271146 ?auto_271148 ) ) ( not ( = ?auto_271146 ?auto_271149 ) ) ( not ( = ?auto_271146 ?auto_271150 ) ) ( not ( = ?auto_271146 ?auto_271151 ) ) ( not ( = ?auto_271146 ?auto_271152 ) ) ( not ( = ?auto_271146 ?auto_271153 ) ) ( not ( = ?auto_271146 ?auto_271154 ) ) ( not ( = ?auto_271146 ?auto_271155 ) ) ( not ( = ?auto_271147 ?auto_271148 ) ) ( not ( = ?auto_271147 ?auto_271149 ) ) ( not ( = ?auto_271147 ?auto_271150 ) ) ( not ( = ?auto_271147 ?auto_271151 ) ) ( not ( = ?auto_271147 ?auto_271152 ) ) ( not ( = ?auto_271147 ?auto_271153 ) ) ( not ( = ?auto_271147 ?auto_271154 ) ) ( not ( = ?auto_271147 ?auto_271155 ) ) ( not ( = ?auto_271148 ?auto_271149 ) ) ( not ( = ?auto_271148 ?auto_271150 ) ) ( not ( = ?auto_271148 ?auto_271151 ) ) ( not ( = ?auto_271148 ?auto_271152 ) ) ( not ( = ?auto_271148 ?auto_271153 ) ) ( not ( = ?auto_271148 ?auto_271154 ) ) ( not ( = ?auto_271148 ?auto_271155 ) ) ( not ( = ?auto_271149 ?auto_271150 ) ) ( not ( = ?auto_271149 ?auto_271151 ) ) ( not ( = ?auto_271149 ?auto_271152 ) ) ( not ( = ?auto_271149 ?auto_271153 ) ) ( not ( = ?auto_271149 ?auto_271154 ) ) ( not ( = ?auto_271149 ?auto_271155 ) ) ( not ( = ?auto_271150 ?auto_271151 ) ) ( not ( = ?auto_271150 ?auto_271152 ) ) ( not ( = ?auto_271150 ?auto_271153 ) ) ( not ( = ?auto_271150 ?auto_271154 ) ) ( not ( = ?auto_271150 ?auto_271155 ) ) ( not ( = ?auto_271151 ?auto_271152 ) ) ( not ( = ?auto_271151 ?auto_271153 ) ) ( not ( = ?auto_271151 ?auto_271154 ) ) ( not ( = ?auto_271151 ?auto_271155 ) ) ( not ( = ?auto_271152 ?auto_271153 ) ) ( not ( = ?auto_271152 ?auto_271154 ) ) ( not ( = ?auto_271152 ?auto_271155 ) ) ( not ( = ?auto_271153 ?auto_271154 ) ) ( not ( = ?auto_271153 ?auto_271155 ) ) ( not ( = ?auto_271154 ?auto_271155 ) ) ( ON ?auto_271154 ?auto_271155 ) ( ON ?auto_271153 ?auto_271154 ) ( ON ?auto_271152 ?auto_271153 ) ( ON ?auto_271151 ?auto_271152 ) ( ON ?auto_271150 ?auto_271151 ) ( ON ?auto_271149 ?auto_271150 ) ( CLEAR ?auto_271147 ) ( ON ?auto_271148 ?auto_271149 ) ( CLEAR ?auto_271148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271143 ?auto_271144 ?auto_271145 ?auto_271146 ?auto_271147 ?auto_271148 )
      ( MAKE-13PILE ?auto_271143 ?auto_271144 ?auto_271145 ?auto_271146 ?auto_271147 ?auto_271148 ?auto_271149 ?auto_271150 ?auto_271151 ?auto_271152 ?auto_271153 ?auto_271154 ?auto_271155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271169 - BLOCK
      ?auto_271170 - BLOCK
      ?auto_271171 - BLOCK
      ?auto_271172 - BLOCK
      ?auto_271173 - BLOCK
      ?auto_271174 - BLOCK
      ?auto_271175 - BLOCK
      ?auto_271176 - BLOCK
      ?auto_271177 - BLOCK
      ?auto_271178 - BLOCK
      ?auto_271179 - BLOCK
      ?auto_271180 - BLOCK
      ?auto_271181 - BLOCK
    )
    :vars
    (
      ?auto_271182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271181 ?auto_271182 ) ( ON-TABLE ?auto_271169 ) ( ON ?auto_271170 ?auto_271169 ) ( ON ?auto_271171 ?auto_271170 ) ( ON ?auto_271172 ?auto_271171 ) ( not ( = ?auto_271169 ?auto_271170 ) ) ( not ( = ?auto_271169 ?auto_271171 ) ) ( not ( = ?auto_271169 ?auto_271172 ) ) ( not ( = ?auto_271169 ?auto_271173 ) ) ( not ( = ?auto_271169 ?auto_271174 ) ) ( not ( = ?auto_271169 ?auto_271175 ) ) ( not ( = ?auto_271169 ?auto_271176 ) ) ( not ( = ?auto_271169 ?auto_271177 ) ) ( not ( = ?auto_271169 ?auto_271178 ) ) ( not ( = ?auto_271169 ?auto_271179 ) ) ( not ( = ?auto_271169 ?auto_271180 ) ) ( not ( = ?auto_271169 ?auto_271181 ) ) ( not ( = ?auto_271169 ?auto_271182 ) ) ( not ( = ?auto_271170 ?auto_271171 ) ) ( not ( = ?auto_271170 ?auto_271172 ) ) ( not ( = ?auto_271170 ?auto_271173 ) ) ( not ( = ?auto_271170 ?auto_271174 ) ) ( not ( = ?auto_271170 ?auto_271175 ) ) ( not ( = ?auto_271170 ?auto_271176 ) ) ( not ( = ?auto_271170 ?auto_271177 ) ) ( not ( = ?auto_271170 ?auto_271178 ) ) ( not ( = ?auto_271170 ?auto_271179 ) ) ( not ( = ?auto_271170 ?auto_271180 ) ) ( not ( = ?auto_271170 ?auto_271181 ) ) ( not ( = ?auto_271170 ?auto_271182 ) ) ( not ( = ?auto_271171 ?auto_271172 ) ) ( not ( = ?auto_271171 ?auto_271173 ) ) ( not ( = ?auto_271171 ?auto_271174 ) ) ( not ( = ?auto_271171 ?auto_271175 ) ) ( not ( = ?auto_271171 ?auto_271176 ) ) ( not ( = ?auto_271171 ?auto_271177 ) ) ( not ( = ?auto_271171 ?auto_271178 ) ) ( not ( = ?auto_271171 ?auto_271179 ) ) ( not ( = ?auto_271171 ?auto_271180 ) ) ( not ( = ?auto_271171 ?auto_271181 ) ) ( not ( = ?auto_271171 ?auto_271182 ) ) ( not ( = ?auto_271172 ?auto_271173 ) ) ( not ( = ?auto_271172 ?auto_271174 ) ) ( not ( = ?auto_271172 ?auto_271175 ) ) ( not ( = ?auto_271172 ?auto_271176 ) ) ( not ( = ?auto_271172 ?auto_271177 ) ) ( not ( = ?auto_271172 ?auto_271178 ) ) ( not ( = ?auto_271172 ?auto_271179 ) ) ( not ( = ?auto_271172 ?auto_271180 ) ) ( not ( = ?auto_271172 ?auto_271181 ) ) ( not ( = ?auto_271172 ?auto_271182 ) ) ( not ( = ?auto_271173 ?auto_271174 ) ) ( not ( = ?auto_271173 ?auto_271175 ) ) ( not ( = ?auto_271173 ?auto_271176 ) ) ( not ( = ?auto_271173 ?auto_271177 ) ) ( not ( = ?auto_271173 ?auto_271178 ) ) ( not ( = ?auto_271173 ?auto_271179 ) ) ( not ( = ?auto_271173 ?auto_271180 ) ) ( not ( = ?auto_271173 ?auto_271181 ) ) ( not ( = ?auto_271173 ?auto_271182 ) ) ( not ( = ?auto_271174 ?auto_271175 ) ) ( not ( = ?auto_271174 ?auto_271176 ) ) ( not ( = ?auto_271174 ?auto_271177 ) ) ( not ( = ?auto_271174 ?auto_271178 ) ) ( not ( = ?auto_271174 ?auto_271179 ) ) ( not ( = ?auto_271174 ?auto_271180 ) ) ( not ( = ?auto_271174 ?auto_271181 ) ) ( not ( = ?auto_271174 ?auto_271182 ) ) ( not ( = ?auto_271175 ?auto_271176 ) ) ( not ( = ?auto_271175 ?auto_271177 ) ) ( not ( = ?auto_271175 ?auto_271178 ) ) ( not ( = ?auto_271175 ?auto_271179 ) ) ( not ( = ?auto_271175 ?auto_271180 ) ) ( not ( = ?auto_271175 ?auto_271181 ) ) ( not ( = ?auto_271175 ?auto_271182 ) ) ( not ( = ?auto_271176 ?auto_271177 ) ) ( not ( = ?auto_271176 ?auto_271178 ) ) ( not ( = ?auto_271176 ?auto_271179 ) ) ( not ( = ?auto_271176 ?auto_271180 ) ) ( not ( = ?auto_271176 ?auto_271181 ) ) ( not ( = ?auto_271176 ?auto_271182 ) ) ( not ( = ?auto_271177 ?auto_271178 ) ) ( not ( = ?auto_271177 ?auto_271179 ) ) ( not ( = ?auto_271177 ?auto_271180 ) ) ( not ( = ?auto_271177 ?auto_271181 ) ) ( not ( = ?auto_271177 ?auto_271182 ) ) ( not ( = ?auto_271178 ?auto_271179 ) ) ( not ( = ?auto_271178 ?auto_271180 ) ) ( not ( = ?auto_271178 ?auto_271181 ) ) ( not ( = ?auto_271178 ?auto_271182 ) ) ( not ( = ?auto_271179 ?auto_271180 ) ) ( not ( = ?auto_271179 ?auto_271181 ) ) ( not ( = ?auto_271179 ?auto_271182 ) ) ( not ( = ?auto_271180 ?auto_271181 ) ) ( not ( = ?auto_271180 ?auto_271182 ) ) ( not ( = ?auto_271181 ?auto_271182 ) ) ( ON ?auto_271180 ?auto_271181 ) ( ON ?auto_271179 ?auto_271180 ) ( ON ?auto_271178 ?auto_271179 ) ( ON ?auto_271177 ?auto_271178 ) ( ON ?auto_271176 ?auto_271177 ) ( ON ?auto_271175 ?auto_271176 ) ( ON ?auto_271174 ?auto_271175 ) ( CLEAR ?auto_271172 ) ( ON ?auto_271173 ?auto_271174 ) ( CLEAR ?auto_271173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271169 ?auto_271170 ?auto_271171 ?auto_271172 ?auto_271173 )
      ( MAKE-13PILE ?auto_271169 ?auto_271170 ?auto_271171 ?auto_271172 ?auto_271173 ?auto_271174 ?auto_271175 ?auto_271176 ?auto_271177 ?auto_271178 ?auto_271179 ?auto_271180 ?auto_271181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271196 - BLOCK
      ?auto_271197 - BLOCK
      ?auto_271198 - BLOCK
      ?auto_271199 - BLOCK
      ?auto_271200 - BLOCK
      ?auto_271201 - BLOCK
      ?auto_271202 - BLOCK
      ?auto_271203 - BLOCK
      ?auto_271204 - BLOCK
      ?auto_271205 - BLOCK
      ?auto_271206 - BLOCK
      ?auto_271207 - BLOCK
      ?auto_271208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271208 ) ( ON-TABLE ?auto_271196 ) ( ON ?auto_271197 ?auto_271196 ) ( ON ?auto_271198 ?auto_271197 ) ( ON ?auto_271199 ?auto_271198 ) ( not ( = ?auto_271196 ?auto_271197 ) ) ( not ( = ?auto_271196 ?auto_271198 ) ) ( not ( = ?auto_271196 ?auto_271199 ) ) ( not ( = ?auto_271196 ?auto_271200 ) ) ( not ( = ?auto_271196 ?auto_271201 ) ) ( not ( = ?auto_271196 ?auto_271202 ) ) ( not ( = ?auto_271196 ?auto_271203 ) ) ( not ( = ?auto_271196 ?auto_271204 ) ) ( not ( = ?auto_271196 ?auto_271205 ) ) ( not ( = ?auto_271196 ?auto_271206 ) ) ( not ( = ?auto_271196 ?auto_271207 ) ) ( not ( = ?auto_271196 ?auto_271208 ) ) ( not ( = ?auto_271197 ?auto_271198 ) ) ( not ( = ?auto_271197 ?auto_271199 ) ) ( not ( = ?auto_271197 ?auto_271200 ) ) ( not ( = ?auto_271197 ?auto_271201 ) ) ( not ( = ?auto_271197 ?auto_271202 ) ) ( not ( = ?auto_271197 ?auto_271203 ) ) ( not ( = ?auto_271197 ?auto_271204 ) ) ( not ( = ?auto_271197 ?auto_271205 ) ) ( not ( = ?auto_271197 ?auto_271206 ) ) ( not ( = ?auto_271197 ?auto_271207 ) ) ( not ( = ?auto_271197 ?auto_271208 ) ) ( not ( = ?auto_271198 ?auto_271199 ) ) ( not ( = ?auto_271198 ?auto_271200 ) ) ( not ( = ?auto_271198 ?auto_271201 ) ) ( not ( = ?auto_271198 ?auto_271202 ) ) ( not ( = ?auto_271198 ?auto_271203 ) ) ( not ( = ?auto_271198 ?auto_271204 ) ) ( not ( = ?auto_271198 ?auto_271205 ) ) ( not ( = ?auto_271198 ?auto_271206 ) ) ( not ( = ?auto_271198 ?auto_271207 ) ) ( not ( = ?auto_271198 ?auto_271208 ) ) ( not ( = ?auto_271199 ?auto_271200 ) ) ( not ( = ?auto_271199 ?auto_271201 ) ) ( not ( = ?auto_271199 ?auto_271202 ) ) ( not ( = ?auto_271199 ?auto_271203 ) ) ( not ( = ?auto_271199 ?auto_271204 ) ) ( not ( = ?auto_271199 ?auto_271205 ) ) ( not ( = ?auto_271199 ?auto_271206 ) ) ( not ( = ?auto_271199 ?auto_271207 ) ) ( not ( = ?auto_271199 ?auto_271208 ) ) ( not ( = ?auto_271200 ?auto_271201 ) ) ( not ( = ?auto_271200 ?auto_271202 ) ) ( not ( = ?auto_271200 ?auto_271203 ) ) ( not ( = ?auto_271200 ?auto_271204 ) ) ( not ( = ?auto_271200 ?auto_271205 ) ) ( not ( = ?auto_271200 ?auto_271206 ) ) ( not ( = ?auto_271200 ?auto_271207 ) ) ( not ( = ?auto_271200 ?auto_271208 ) ) ( not ( = ?auto_271201 ?auto_271202 ) ) ( not ( = ?auto_271201 ?auto_271203 ) ) ( not ( = ?auto_271201 ?auto_271204 ) ) ( not ( = ?auto_271201 ?auto_271205 ) ) ( not ( = ?auto_271201 ?auto_271206 ) ) ( not ( = ?auto_271201 ?auto_271207 ) ) ( not ( = ?auto_271201 ?auto_271208 ) ) ( not ( = ?auto_271202 ?auto_271203 ) ) ( not ( = ?auto_271202 ?auto_271204 ) ) ( not ( = ?auto_271202 ?auto_271205 ) ) ( not ( = ?auto_271202 ?auto_271206 ) ) ( not ( = ?auto_271202 ?auto_271207 ) ) ( not ( = ?auto_271202 ?auto_271208 ) ) ( not ( = ?auto_271203 ?auto_271204 ) ) ( not ( = ?auto_271203 ?auto_271205 ) ) ( not ( = ?auto_271203 ?auto_271206 ) ) ( not ( = ?auto_271203 ?auto_271207 ) ) ( not ( = ?auto_271203 ?auto_271208 ) ) ( not ( = ?auto_271204 ?auto_271205 ) ) ( not ( = ?auto_271204 ?auto_271206 ) ) ( not ( = ?auto_271204 ?auto_271207 ) ) ( not ( = ?auto_271204 ?auto_271208 ) ) ( not ( = ?auto_271205 ?auto_271206 ) ) ( not ( = ?auto_271205 ?auto_271207 ) ) ( not ( = ?auto_271205 ?auto_271208 ) ) ( not ( = ?auto_271206 ?auto_271207 ) ) ( not ( = ?auto_271206 ?auto_271208 ) ) ( not ( = ?auto_271207 ?auto_271208 ) ) ( ON ?auto_271207 ?auto_271208 ) ( ON ?auto_271206 ?auto_271207 ) ( ON ?auto_271205 ?auto_271206 ) ( ON ?auto_271204 ?auto_271205 ) ( ON ?auto_271203 ?auto_271204 ) ( ON ?auto_271202 ?auto_271203 ) ( ON ?auto_271201 ?auto_271202 ) ( CLEAR ?auto_271199 ) ( ON ?auto_271200 ?auto_271201 ) ( CLEAR ?auto_271200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271196 ?auto_271197 ?auto_271198 ?auto_271199 ?auto_271200 )
      ( MAKE-13PILE ?auto_271196 ?auto_271197 ?auto_271198 ?auto_271199 ?auto_271200 ?auto_271201 ?auto_271202 ?auto_271203 ?auto_271204 ?auto_271205 ?auto_271206 ?auto_271207 ?auto_271208 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271222 - BLOCK
      ?auto_271223 - BLOCK
      ?auto_271224 - BLOCK
      ?auto_271225 - BLOCK
      ?auto_271226 - BLOCK
      ?auto_271227 - BLOCK
      ?auto_271228 - BLOCK
      ?auto_271229 - BLOCK
      ?auto_271230 - BLOCK
      ?auto_271231 - BLOCK
      ?auto_271232 - BLOCK
      ?auto_271233 - BLOCK
      ?auto_271234 - BLOCK
    )
    :vars
    (
      ?auto_271235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271234 ?auto_271235 ) ( ON-TABLE ?auto_271222 ) ( ON ?auto_271223 ?auto_271222 ) ( ON ?auto_271224 ?auto_271223 ) ( not ( = ?auto_271222 ?auto_271223 ) ) ( not ( = ?auto_271222 ?auto_271224 ) ) ( not ( = ?auto_271222 ?auto_271225 ) ) ( not ( = ?auto_271222 ?auto_271226 ) ) ( not ( = ?auto_271222 ?auto_271227 ) ) ( not ( = ?auto_271222 ?auto_271228 ) ) ( not ( = ?auto_271222 ?auto_271229 ) ) ( not ( = ?auto_271222 ?auto_271230 ) ) ( not ( = ?auto_271222 ?auto_271231 ) ) ( not ( = ?auto_271222 ?auto_271232 ) ) ( not ( = ?auto_271222 ?auto_271233 ) ) ( not ( = ?auto_271222 ?auto_271234 ) ) ( not ( = ?auto_271222 ?auto_271235 ) ) ( not ( = ?auto_271223 ?auto_271224 ) ) ( not ( = ?auto_271223 ?auto_271225 ) ) ( not ( = ?auto_271223 ?auto_271226 ) ) ( not ( = ?auto_271223 ?auto_271227 ) ) ( not ( = ?auto_271223 ?auto_271228 ) ) ( not ( = ?auto_271223 ?auto_271229 ) ) ( not ( = ?auto_271223 ?auto_271230 ) ) ( not ( = ?auto_271223 ?auto_271231 ) ) ( not ( = ?auto_271223 ?auto_271232 ) ) ( not ( = ?auto_271223 ?auto_271233 ) ) ( not ( = ?auto_271223 ?auto_271234 ) ) ( not ( = ?auto_271223 ?auto_271235 ) ) ( not ( = ?auto_271224 ?auto_271225 ) ) ( not ( = ?auto_271224 ?auto_271226 ) ) ( not ( = ?auto_271224 ?auto_271227 ) ) ( not ( = ?auto_271224 ?auto_271228 ) ) ( not ( = ?auto_271224 ?auto_271229 ) ) ( not ( = ?auto_271224 ?auto_271230 ) ) ( not ( = ?auto_271224 ?auto_271231 ) ) ( not ( = ?auto_271224 ?auto_271232 ) ) ( not ( = ?auto_271224 ?auto_271233 ) ) ( not ( = ?auto_271224 ?auto_271234 ) ) ( not ( = ?auto_271224 ?auto_271235 ) ) ( not ( = ?auto_271225 ?auto_271226 ) ) ( not ( = ?auto_271225 ?auto_271227 ) ) ( not ( = ?auto_271225 ?auto_271228 ) ) ( not ( = ?auto_271225 ?auto_271229 ) ) ( not ( = ?auto_271225 ?auto_271230 ) ) ( not ( = ?auto_271225 ?auto_271231 ) ) ( not ( = ?auto_271225 ?auto_271232 ) ) ( not ( = ?auto_271225 ?auto_271233 ) ) ( not ( = ?auto_271225 ?auto_271234 ) ) ( not ( = ?auto_271225 ?auto_271235 ) ) ( not ( = ?auto_271226 ?auto_271227 ) ) ( not ( = ?auto_271226 ?auto_271228 ) ) ( not ( = ?auto_271226 ?auto_271229 ) ) ( not ( = ?auto_271226 ?auto_271230 ) ) ( not ( = ?auto_271226 ?auto_271231 ) ) ( not ( = ?auto_271226 ?auto_271232 ) ) ( not ( = ?auto_271226 ?auto_271233 ) ) ( not ( = ?auto_271226 ?auto_271234 ) ) ( not ( = ?auto_271226 ?auto_271235 ) ) ( not ( = ?auto_271227 ?auto_271228 ) ) ( not ( = ?auto_271227 ?auto_271229 ) ) ( not ( = ?auto_271227 ?auto_271230 ) ) ( not ( = ?auto_271227 ?auto_271231 ) ) ( not ( = ?auto_271227 ?auto_271232 ) ) ( not ( = ?auto_271227 ?auto_271233 ) ) ( not ( = ?auto_271227 ?auto_271234 ) ) ( not ( = ?auto_271227 ?auto_271235 ) ) ( not ( = ?auto_271228 ?auto_271229 ) ) ( not ( = ?auto_271228 ?auto_271230 ) ) ( not ( = ?auto_271228 ?auto_271231 ) ) ( not ( = ?auto_271228 ?auto_271232 ) ) ( not ( = ?auto_271228 ?auto_271233 ) ) ( not ( = ?auto_271228 ?auto_271234 ) ) ( not ( = ?auto_271228 ?auto_271235 ) ) ( not ( = ?auto_271229 ?auto_271230 ) ) ( not ( = ?auto_271229 ?auto_271231 ) ) ( not ( = ?auto_271229 ?auto_271232 ) ) ( not ( = ?auto_271229 ?auto_271233 ) ) ( not ( = ?auto_271229 ?auto_271234 ) ) ( not ( = ?auto_271229 ?auto_271235 ) ) ( not ( = ?auto_271230 ?auto_271231 ) ) ( not ( = ?auto_271230 ?auto_271232 ) ) ( not ( = ?auto_271230 ?auto_271233 ) ) ( not ( = ?auto_271230 ?auto_271234 ) ) ( not ( = ?auto_271230 ?auto_271235 ) ) ( not ( = ?auto_271231 ?auto_271232 ) ) ( not ( = ?auto_271231 ?auto_271233 ) ) ( not ( = ?auto_271231 ?auto_271234 ) ) ( not ( = ?auto_271231 ?auto_271235 ) ) ( not ( = ?auto_271232 ?auto_271233 ) ) ( not ( = ?auto_271232 ?auto_271234 ) ) ( not ( = ?auto_271232 ?auto_271235 ) ) ( not ( = ?auto_271233 ?auto_271234 ) ) ( not ( = ?auto_271233 ?auto_271235 ) ) ( not ( = ?auto_271234 ?auto_271235 ) ) ( ON ?auto_271233 ?auto_271234 ) ( ON ?auto_271232 ?auto_271233 ) ( ON ?auto_271231 ?auto_271232 ) ( ON ?auto_271230 ?auto_271231 ) ( ON ?auto_271229 ?auto_271230 ) ( ON ?auto_271228 ?auto_271229 ) ( ON ?auto_271227 ?auto_271228 ) ( ON ?auto_271226 ?auto_271227 ) ( CLEAR ?auto_271224 ) ( ON ?auto_271225 ?auto_271226 ) ( CLEAR ?auto_271225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271222 ?auto_271223 ?auto_271224 ?auto_271225 )
      ( MAKE-13PILE ?auto_271222 ?auto_271223 ?auto_271224 ?auto_271225 ?auto_271226 ?auto_271227 ?auto_271228 ?auto_271229 ?auto_271230 ?auto_271231 ?auto_271232 ?auto_271233 ?auto_271234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271249 - BLOCK
      ?auto_271250 - BLOCK
      ?auto_271251 - BLOCK
      ?auto_271252 - BLOCK
      ?auto_271253 - BLOCK
      ?auto_271254 - BLOCK
      ?auto_271255 - BLOCK
      ?auto_271256 - BLOCK
      ?auto_271257 - BLOCK
      ?auto_271258 - BLOCK
      ?auto_271259 - BLOCK
      ?auto_271260 - BLOCK
      ?auto_271261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271261 ) ( ON-TABLE ?auto_271249 ) ( ON ?auto_271250 ?auto_271249 ) ( ON ?auto_271251 ?auto_271250 ) ( not ( = ?auto_271249 ?auto_271250 ) ) ( not ( = ?auto_271249 ?auto_271251 ) ) ( not ( = ?auto_271249 ?auto_271252 ) ) ( not ( = ?auto_271249 ?auto_271253 ) ) ( not ( = ?auto_271249 ?auto_271254 ) ) ( not ( = ?auto_271249 ?auto_271255 ) ) ( not ( = ?auto_271249 ?auto_271256 ) ) ( not ( = ?auto_271249 ?auto_271257 ) ) ( not ( = ?auto_271249 ?auto_271258 ) ) ( not ( = ?auto_271249 ?auto_271259 ) ) ( not ( = ?auto_271249 ?auto_271260 ) ) ( not ( = ?auto_271249 ?auto_271261 ) ) ( not ( = ?auto_271250 ?auto_271251 ) ) ( not ( = ?auto_271250 ?auto_271252 ) ) ( not ( = ?auto_271250 ?auto_271253 ) ) ( not ( = ?auto_271250 ?auto_271254 ) ) ( not ( = ?auto_271250 ?auto_271255 ) ) ( not ( = ?auto_271250 ?auto_271256 ) ) ( not ( = ?auto_271250 ?auto_271257 ) ) ( not ( = ?auto_271250 ?auto_271258 ) ) ( not ( = ?auto_271250 ?auto_271259 ) ) ( not ( = ?auto_271250 ?auto_271260 ) ) ( not ( = ?auto_271250 ?auto_271261 ) ) ( not ( = ?auto_271251 ?auto_271252 ) ) ( not ( = ?auto_271251 ?auto_271253 ) ) ( not ( = ?auto_271251 ?auto_271254 ) ) ( not ( = ?auto_271251 ?auto_271255 ) ) ( not ( = ?auto_271251 ?auto_271256 ) ) ( not ( = ?auto_271251 ?auto_271257 ) ) ( not ( = ?auto_271251 ?auto_271258 ) ) ( not ( = ?auto_271251 ?auto_271259 ) ) ( not ( = ?auto_271251 ?auto_271260 ) ) ( not ( = ?auto_271251 ?auto_271261 ) ) ( not ( = ?auto_271252 ?auto_271253 ) ) ( not ( = ?auto_271252 ?auto_271254 ) ) ( not ( = ?auto_271252 ?auto_271255 ) ) ( not ( = ?auto_271252 ?auto_271256 ) ) ( not ( = ?auto_271252 ?auto_271257 ) ) ( not ( = ?auto_271252 ?auto_271258 ) ) ( not ( = ?auto_271252 ?auto_271259 ) ) ( not ( = ?auto_271252 ?auto_271260 ) ) ( not ( = ?auto_271252 ?auto_271261 ) ) ( not ( = ?auto_271253 ?auto_271254 ) ) ( not ( = ?auto_271253 ?auto_271255 ) ) ( not ( = ?auto_271253 ?auto_271256 ) ) ( not ( = ?auto_271253 ?auto_271257 ) ) ( not ( = ?auto_271253 ?auto_271258 ) ) ( not ( = ?auto_271253 ?auto_271259 ) ) ( not ( = ?auto_271253 ?auto_271260 ) ) ( not ( = ?auto_271253 ?auto_271261 ) ) ( not ( = ?auto_271254 ?auto_271255 ) ) ( not ( = ?auto_271254 ?auto_271256 ) ) ( not ( = ?auto_271254 ?auto_271257 ) ) ( not ( = ?auto_271254 ?auto_271258 ) ) ( not ( = ?auto_271254 ?auto_271259 ) ) ( not ( = ?auto_271254 ?auto_271260 ) ) ( not ( = ?auto_271254 ?auto_271261 ) ) ( not ( = ?auto_271255 ?auto_271256 ) ) ( not ( = ?auto_271255 ?auto_271257 ) ) ( not ( = ?auto_271255 ?auto_271258 ) ) ( not ( = ?auto_271255 ?auto_271259 ) ) ( not ( = ?auto_271255 ?auto_271260 ) ) ( not ( = ?auto_271255 ?auto_271261 ) ) ( not ( = ?auto_271256 ?auto_271257 ) ) ( not ( = ?auto_271256 ?auto_271258 ) ) ( not ( = ?auto_271256 ?auto_271259 ) ) ( not ( = ?auto_271256 ?auto_271260 ) ) ( not ( = ?auto_271256 ?auto_271261 ) ) ( not ( = ?auto_271257 ?auto_271258 ) ) ( not ( = ?auto_271257 ?auto_271259 ) ) ( not ( = ?auto_271257 ?auto_271260 ) ) ( not ( = ?auto_271257 ?auto_271261 ) ) ( not ( = ?auto_271258 ?auto_271259 ) ) ( not ( = ?auto_271258 ?auto_271260 ) ) ( not ( = ?auto_271258 ?auto_271261 ) ) ( not ( = ?auto_271259 ?auto_271260 ) ) ( not ( = ?auto_271259 ?auto_271261 ) ) ( not ( = ?auto_271260 ?auto_271261 ) ) ( ON ?auto_271260 ?auto_271261 ) ( ON ?auto_271259 ?auto_271260 ) ( ON ?auto_271258 ?auto_271259 ) ( ON ?auto_271257 ?auto_271258 ) ( ON ?auto_271256 ?auto_271257 ) ( ON ?auto_271255 ?auto_271256 ) ( ON ?auto_271254 ?auto_271255 ) ( ON ?auto_271253 ?auto_271254 ) ( CLEAR ?auto_271251 ) ( ON ?auto_271252 ?auto_271253 ) ( CLEAR ?auto_271252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271249 ?auto_271250 ?auto_271251 ?auto_271252 )
      ( MAKE-13PILE ?auto_271249 ?auto_271250 ?auto_271251 ?auto_271252 ?auto_271253 ?auto_271254 ?auto_271255 ?auto_271256 ?auto_271257 ?auto_271258 ?auto_271259 ?auto_271260 ?auto_271261 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271275 - BLOCK
      ?auto_271276 - BLOCK
      ?auto_271277 - BLOCK
      ?auto_271278 - BLOCK
      ?auto_271279 - BLOCK
      ?auto_271280 - BLOCK
      ?auto_271281 - BLOCK
      ?auto_271282 - BLOCK
      ?auto_271283 - BLOCK
      ?auto_271284 - BLOCK
      ?auto_271285 - BLOCK
      ?auto_271286 - BLOCK
      ?auto_271287 - BLOCK
    )
    :vars
    (
      ?auto_271288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271287 ?auto_271288 ) ( ON-TABLE ?auto_271275 ) ( ON ?auto_271276 ?auto_271275 ) ( not ( = ?auto_271275 ?auto_271276 ) ) ( not ( = ?auto_271275 ?auto_271277 ) ) ( not ( = ?auto_271275 ?auto_271278 ) ) ( not ( = ?auto_271275 ?auto_271279 ) ) ( not ( = ?auto_271275 ?auto_271280 ) ) ( not ( = ?auto_271275 ?auto_271281 ) ) ( not ( = ?auto_271275 ?auto_271282 ) ) ( not ( = ?auto_271275 ?auto_271283 ) ) ( not ( = ?auto_271275 ?auto_271284 ) ) ( not ( = ?auto_271275 ?auto_271285 ) ) ( not ( = ?auto_271275 ?auto_271286 ) ) ( not ( = ?auto_271275 ?auto_271287 ) ) ( not ( = ?auto_271275 ?auto_271288 ) ) ( not ( = ?auto_271276 ?auto_271277 ) ) ( not ( = ?auto_271276 ?auto_271278 ) ) ( not ( = ?auto_271276 ?auto_271279 ) ) ( not ( = ?auto_271276 ?auto_271280 ) ) ( not ( = ?auto_271276 ?auto_271281 ) ) ( not ( = ?auto_271276 ?auto_271282 ) ) ( not ( = ?auto_271276 ?auto_271283 ) ) ( not ( = ?auto_271276 ?auto_271284 ) ) ( not ( = ?auto_271276 ?auto_271285 ) ) ( not ( = ?auto_271276 ?auto_271286 ) ) ( not ( = ?auto_271276 ?auto_271287 ) ) ( not ( = ?auto_271276 ?auto_271288 ) ) ( not ( = ?auto_271277 ?auto_271278 ) ) ( not ( = ?auto_271277 ?auto_271279 ) ) ( not ( = ?auto_271277 ?auto_271280 ) ) ( not ( = ?auto_271277 ?auto_271281 ) ) ( not ( = ?auto_271277 ?auto_271282 ) ) ( not ( = ?auto_271277 ?auto_271283 ) ) ( not ( = ?auto_271277 ?auto_271284 ) ) ( not ( = ?auto_271277 ?auto_271285 ) ) ( not ( = ?auto_271277 ?auto_271286 ) ) ( not ( = ?auto_271277 ?auto_271287 ) ) ( not ( = ?auto_271277 ?auto_271288 ) ) ( not ( = ?auto_271278 ?auto_271279 ) ) ( not ( = ?auto_271278 ?auto_271280 ) ) ( not ( = ?auto_271278 ?auto_271281 ) ) ( not ( = ?auto_271278 ?auto_271282 ) ) ( not ( = ?auto_271278 ?auto_271283 ) ) ( not ( = ?auto_271278 ?auto_271284 ) ) ( not ( = ?auto_271278 ?auto_271285 ) ) ( not ( = ?auto_271278 ?auto_271286 ) ) ( not ( = ?auto_271278 ?auto_271287 ) ) ( not ( = ?auto_271278 ?auto_271288 ) ) ( not ( = ?auto_271279 ?auto_271280 ) ) ( not ( = ?auto_271279 ?auto_271281 ) ) ( not ( = ?auto_271279 ?auto_271282 ) ) ( not ( = ?auto_271279 ?auto_271283 ) ) ( not ( = ?auto_271279 ?auto_271284 ) ) ( not ( = ?auto_271279 ?auto_271285 ) ) ( not ( = ?auto_271279 ?auto_271286 ) ) ( not ( = ?auto_271279 ?auto_271287 ) ) ( not ( = ?auto_271279 ?auto_271288 ) ) ( not ( = ?auto_271280 ?auto_271281 ) ) ( not ( = ?auto_271280 ?auto_271282 ) ) ( not ( = ?auto_271280 ?auto_271283 ) ) ( not ( = ?auto_271280 ?auto_271284 ) ) ( not ( = ?auto_271280 ?auto_271285 ) ) ( not ( = ?auto_271280 ?auto_271286 ) ) ( not ( = ?auto_271280 ?auto_271287 ) ) ( not ( = ?auto_271280 ?auto_271288 ) ) ( not ( = ?auto_271281 ?auto_271282 ) ) ( not ( = ?auto_271281 ?auto_271283 ) ) ( not ( = ?auto_271281 ?auto_271284 ) ) ( not ( = ?auto_271281 ?auto_271285 ) ) ( not ( = ?auto_271281 ?auto_271286 ) ) ( not ( = ?auto_271281 ?auto_271287 ) ) ( not ( = ?auto_271281 ?auto_271288 ) ) ( not ( = ?auto_271282 ?auto_271283 ) ) ( not ( = ?auto_271282 ?auto_271284 ) ) ( not ( = ?auto_271282 ?auto_271285 ) ) ( not ( = ?auto_271282 ?auto_271286 ) ) ( not ( = ?auto_271282 ?auto_271287 ) ) ( not ( = ?auto_271282 ?auto_271288 ) ) ( not ( = ?auto_271283 ?auto_271284 ) ) ( not ( = ?auto_271283 ?auto_271285 ) ) ( not ( = ?auto_271283 ?auto_271286 ) ) ( not ( = ?auto_271283 ?auto_271287 ) ) ( not ( = ?auto_271283 ?auto_271288 ) ) ( not ( = ?auto_271284 ?auto_271285 ) ) ( not ( = ?auto_271284 ?auto_271286 ) ) ( not ( = ?auto_271284 ?auto_271287 ) ) ( not ( = ?auto_271284 ?auto_271288 ) ) ( not ( = ?auto_271285 ?auto_271286 ) ) ( not ( = ?auto_271285 ?auto_271287 ) ) ( not ( = ?auto_271285 ?auto_271288 ) ) ( not ( = ?auto_271286 ?auto_271287 ) ) ( not ( = ?auto_271286 ?auto_271288 ) ) ( not ( = ?auto_271287 ?auto_271288 ) ) ( ON ?auto_271286 ?auto_271287 ) ( ON ?auto_271285 ?auto_271286 ) ( ON ?auto_271284 ?auto_271285 ) ( ON ?auto_271283 ?auto_271284 ) ( ON ?auto_271282 ?auto_271283 ) ( ON ?auto_271281 ?auto_271282 ) ( ON ?auto_271280 ?auto_271281 ) ( ON ?auto_271279 ?auto_271280 ) ( ON ?auto_271278 ?auto_271279 ) ( CLEAR ?auto_271276 ) ( ON ?auto_271277 ?auto_271278 ) ( CLEAR ?auto_271277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271275 ?auto_271276 ?auto_271277 )
      ( MAKE-13PILE ?auto_271275 ?auto_271276 ?auto_271277 ?auto_271278 ?auto_271279 ?auto_271280 ?auto_271281 ?auto_271282 ?auto_271283 ?auto_271284 ?auto_271285 ?auto_271286 ?auto_271287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271302 - BLOCK
      ?auto_271303 - BLOCK
      ?auto_271304 - BLOCK
      ?auto_271305 - BLOCK
      ?auto_271306 - BLOCK
      ?auto_271307 - BLOCK
      ?auto_271308 - BLOCK
      ?auto_271309 - BLOCK
      ?auto_271310 - BLOCK
      ?auto_271311 - BLOCK
      ?auto_271312 - BLOCK
      ?auto_271313 - BLOCK
      ?auto_271314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271314 ) ( ON-TABLE ?auto_271302 ) ( ON ?auto_271303 ?auto_271302 ) ( not ( = ?auto_271302 ?auto_271303 ) ) ( not ( = ?auto_271302 ?auto_271304 ) ) ( not ( = ?auto_271302 ?auto_271305 ) ) ( not ( = ?auto_271302 ?auto_271306 ) ) ( not ( = ?auto_271302 ?auto_271307 ) ) ( not ( = ?auto_271302 ?auto_271308 ) ) ( not ( = ?auto_271302 ?auto_271309 ) ) ( not ( = ?auto_271302 ?auto_271310 ) ) ( not ( = ?auto_271302 ?auto_271311 ) ) ( not ( = ?auto_271302 ?auto_271312 ) ) ( not ( = ?auto_271302 ?auto_271313 ) ) ( not ( = ?auto_271302 ?auto_271314 ) ) ( not ( = ?auto_271303 ?auto_271304 ) ) ( not ( = ?auto_271303 ?auto_271305 ) ) ( not ( = ?auto_271303 ?auto_271306 ) ) ( not ( = ?auto_271303 ?auto_271307 ) ) ( not ( = ?auto_271303 ?auto_271308 ) ) ( not ( = ?auto_271303 ?auto_271309 ) ) ( not ( = ?auto_271303 ?auto_271310 ) ) ( not ( = ?auto_271303 ?auto_271311 ) ) ( not ( = ?auto_271303 ?auto_271312 ) ) ( not ( = ?auto_271303 ?auto_271313 ) ) ( not ( = ?auto_271303 ?auto_271314 ) ) ( not ( = ?auto_271304 ?auto_271305 ) ) ( not ( = ?auto_271304 ?auto_271306 ) ) ( not ( = ?auto_271304 ?auto_271307 ) ) ( not ( = ?auto_271304 ?auto_271308 ) ) ( not ( = ?auto_271304 ?auto_271309 ) ) ( not ( = ?auto_271304 ?auto_271310 ) ) ( not ( = ?auto_271304 ?auto_271311 ) ) ( not ( = ?auto_271304 ?auto_271312 ) ) ( not ( = ?auto_271304 ?auto_271313 ) ) ( not ( = ?auto_271304 ?auto_271314 ) ) ( not ( = ?auto_271305 ?auto_271306 ) ) ( not ( = ?auto_271305 ?auto_271307 ) ) ( not ( = ?auto_271305 ?auto_271308 ) ) ( not ( = ?auto_271305 ?auto_271309 ) ) ( not ( = ?auto_271305 ?auto_271310 ) ) ( not ( = ?auto_271305 ?auto_271311 ) ) ( not ( = ?auto_271305 ?auto_271312 ) ) ( not ( = ?auto_271305 ?auto_271313 ) ) ( not ( = ?auto_271305 ?auto_271314 ) ) ( not ( = ?auto_271306 ?auto_271307 ) ) ( not ( = ?auto_271306 ?auto_271308 ) ) ( not ( = ?auto_271306 ?auto_271309 ) ) ( not ( = ?auto_271306 ?auto_271310 ) ) ( not ( = ?auto_271306 ?auto_271311 ) ) ( not ( = ?auto_271306 ?auto_271312 ) ) ( not ( = ?auto_271306 ?auto_271313 ) ) ( not ( = ?auto_271306 ?auto_271314 ) ) ( not ( = ?auto_271307 ?auto_271308 ) ) ( not ( = ?auto_271307 ?auto_271309 ) ) ( not ( = ?auto_271307 ?auto_271310 ) ) ( not ( = ?auto_271307 ?auto_271311 ) ) ( not ( = ?auto_271307 ?auto_271312 ) ) ( not ( = ?auto_271307 ?auto_271313 ) ) ( not ( = ?auto_271307 ?auto_271314 ) ) ( not ( = ?auto_271308 ?auto_271309 ) ) ( not ( = ?auto_271308 ?auto_271310 ) ) ( not ( = ?auto_271308 ?auto_271311 ) ) ( not ( = ?auto_271308 ?auto_271312 ) ) ( not ( = ?auto_271308 ?auto_271313 ) ) ( not ( = ?auto_271308 ?auto_271314 ) ) ( not ( = ?auto_271309 ?auto_271310 ) ) ( not ( = ?auto_271309 ?auto_271311 ) ) ( not ( = ?auto_271309 ?auto_271312 ) ) ( not ( = ?auto_271309 ?auto_271313 ) ) ( not ( = ?auto_271309 ?auto_271314 ) ) ( not ( = ?auto_271310 ?auto_271311 ) ) ( not ( = ?auto_271310 ?auto_271312 ) ) ( not ( = ?auto_271310 ?auto_271313 ) ) ( not ( = ?auto_271310 ?auto_271314 ) ) ( not ( = ?auto_271311 ?auto_271312 ) ) ( not ( = ?auto_271311 ?auto_271313 ) ) ( not ( = ?auto_271311 ?auto_271314 ) ) ( not ( = ?auto_271312 ?auto_271313 ) ) ( not ( = ?auto_271312 ?auto_271314 ) ) ( not ( = ?auto_271313 ?auto_271314 ) ) ( ON ?auto_271313 ?auto_271314 ) ( ON ?auto_271312 ?auto_271313 ) ( ON ?auto_271311 ?auto_271312 ) ( ON ?auto_271310 ?auto_271311 ) ( ON ?auto_271309 ?auto_271310 ) ( ON ?auto_271308 ?auto_271309 ) ( ON ?auto_271307 ?auto_271308 ) ( ON ?auto_271306 ?auto_271307 ) ( ON ?auto_271305 ?auto_271306 ) ( CLEAR ?auto_271303 ) ( ON ?auto_271304 ?auto_271305 ) ( CLEAR ?auto_271304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271302 ?auto_271303 ?auto_271304 )
      ( MAKE-13PILE ?auto_271302 ?auto_271303 ?auto_271304 ?auto_271305 ?auto_271306 ?auto_271307 ?auto_271308 ?auto_271309 ?auto_271310 ?auto_271311 ?auto_271312 ?auto_271313 ?auto_271314 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271328 - BLOCK
      ?auto_271329 - BLOCK
      ?auto_271330 - BLOCK
      ?auto_271331 - BLOCK
      ?auto_271332 - BLOCK
      ?auto_271333 - BLOCK
      ?auto_271334 - BLOCK
      ?auto_271335 - BLOCK
      ?auto_271336 - BLOCK
      ?auto_271337 - BLOCK
      ?auto_271338 - BLOCK
      ?auto_271339 - BLOCK
      ?auto_271340 - BLOCK
    )
    :vars
    (
      ?auto_271341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271340 ?auto_271341 ) ( ON-TABLE ?auto_271328 ) ( not ( = ?auto_271328 ?auto_271329 ) ) ( not ( = ?auto_271328 ?auto_271330 ) ) ( not ( = ?auto_271328 ?auto_271331 ) ) ( not ( = ?auto_271328 ?auto_271332 ) ) ( not ( = ?auto_271328 ?auto_271333 ) ) ( not ( = ?auto_271328 ?auto_271334 ) ) ( not ( = ?auto_271328 ?auto_271335 ) ) ( not ( = ?auto_271328 ?auto_271336 ) ) ( not ( = ?auto_271328 ?auto_271337 ) ) ( not ( = ?auto_271328 ?auto_271338 ) ) ( not ( = ?auto_271328 ?auto_271339 ) ) ( not ( = ?auto_271328 ?auto_271340 ) ) ( not ( = ?auto_271328 ?auto_271341 ) ) ( not ( = ?auto_271329 ?auto_271330 ) ) ( not ( = ?auto_271329 ?auto_271331 ) ) ( not ( = ?auto_271329 ?auto_271332 ) ) ( not ( = ?auto_271329 ?auto_271333 ) ) ( not ( = ?auto_271329 ?auto_271334 ) ) ( not ( = ?auto_271329 ?auto_271335 ) ) ( not ( = ?auto_271329 ?auto_271336 ) ) ( not ( = ?auto_271329 ?auto_271337 ) ) ( not ( = ?auto_271329 ?auto_271338 ) ) ( not ( = ?auto_271329 ?auto_271339 ) ) ( not ( = ?auto_271329 ?auto_271340 ) ) ( not ( = ?auto_271329 ?auto_271341 ) ) ( not ( = ?auto_271330 ?auto_271331 ) ) ( not ( = ?auto_271330 ?auto_271332 ) ) ( not ( = ?auto_271330 ?auto_271333 ) ) ( not ( = ?auto_271330 ?auto_271334 ) ) ( not ( = ?auto_271330 ?auto_271335 ) ) ( not ( = ?auto_271330 ?auto_271336 ) ) ( not ( = ?auto_271330 ?auto_271337 ) ) ( not ( = ?auto_271330 ?auto_271338 ) ) ( not ( = ?auto_271330 ?auto_271339 ) ) ( not ( = ?auto_271330 ?auto_271340 ) ) ( not ( = ?auto_271330 ?auto_271341 ) ) ( not ( = ?auto_271331 ?auto_271332 ) ) ( not ( = ?auto_271331 ?auto_271333 ) ) ( not ( = ?auto_271331 ?auto_271334 ) ) ( not ( = ?auto_271331 ?auto_271335 ) ) ( not ( = ?auto_271331 ?auto_271336 ) ) ( not ( = ?auto_271331 ?auto_271337 ) ) ( not ( = ?auto_271331 ?auto_271338 ) ) ( not ( = ?auto_271331 ?auto_271339 ) ) ( not ( = ?auto_271331 ?auto_271340 ) ) ( not ( = ?auto_271331 ?auto_271341 ) ) ( not ( = ?auto_271332 ?auto_271333 ) ) ( not ( = ?auto_271332 ?auto_271334 ) ) ( not ( = ?auto_271332 ?auto_271335 ) ) ( not ( = ?auto_271332 ?auto_271336 ) ) ( not ( = ?auto_271332 ?auto_271337 ) ) ( not ( = ?auto_271332 ?auto_271338 ) ) ( not ( = ?auto_271332 ?auto_271339 ) ) ( not ( = ?auto_271332 ?auto_271340 ) ) ( not ( = ?auto_271332 ?auto_271341 ) ) ( not ( = ?auto_271333 ?auto_271334 ) ) ( not ( = ?auto_271333 ?auto_271335 ) ) ( not ( = ?auto_271333 ?auto_271336 ) ) ( not ( = ?auto_271333 ?auto_271337 ) ) ( not ( = ?auto_271333 ?auto_271338 ) ) ( not ( = ?auto_271333 ?auto_271339 ) ) ( not ( = ?auto_271333 ?auto_271340 ) ) ( not ( = ?auto_271333 ?auto_271341 ) ) ( not ( = ?auto_271334 ?auto_271335 ) ) ( not ( = ?auto_271334 ?auto_271336 ) ) ( not ( = ?auto_271334 ?auto_271337 ) ) ( not ( = ?auto_271334 ?auto_271338 ) ) ( not ( = ?auto_271334 ?auto_271339 ) ) ( not ( = ?auto_271334 ?auto_271340 ) ) ( not ( = ?auto_271334 ?auto_271341 ) ) ( not ( = ?auto_271335 ?auto_271336 ) ) ( not ( = ?auto_271335 ?auto_271337 ) ) ( not ( = ?auto_271335 ?auto_271338 ) ) ( not ( = ?auto_271335 ?auto_271339 ) ) ( not ( = ?auto_271335 ?auto_271340 ) ) ( not ( = ?auto_271335 ?auto_271341 ) ) ( not ( = ?auto_271336 ?auto_271337 ) ) ( not ( = ?auto_271336 ?auto_271338 ) ) ( not ( = ?auto_271336 ?auto_271339 ) ) ( not ( = ?auto_271336 ?auto_271340 ) ) ( not ( = ?auto_271336 ?auto_271341 ) ) ( not ( = ?auto_271337 ?auto_271338 ) ) ( not ( = ?auto_271337 ?auto_271339 ) ) ( not ( = ?auto_271337 ?auto_271340 ) ) ( not ( = ?auto_271337 ?auto_271341 ) ) ( not ( = ?auto_271338 ?auto_271339 ) ) ( not ( = ?auto_271338 ?auto_271340 ) ) ( not ( = ?auto_271338 ?auto_271341 ) ) ( not ( = ?auto_271339 ?auto_271340 ) ) ( not ( = ?auto_271339 ?auto_271341 ) ) ( not ( = ?auto_271340 ?auto_271341 ) ) ( ON ?auto_271339 ?auto_271340 ) ( ON ?auto_271338 ?auto_271339 ) ( ON ?auto_271337 ?auto_271338 ) ( ON ?auto_271336 ?auto_271337 ) ( ON ?auto_271335 ?auto_271336 ) ( ON ?auto_271334 ?auto_271335 ) ( ON ?auto_271333 ?auto_271334 ) ( ON ?auto_271332 ?auto_271333 ) ( ON ?auto_271331 ?auto_271332 ) ( ON ?auto_271330 ?auto_271331 ) ( CLEAR ?auto_271328 ) ( ON ?auto_271329 ?auto_271330 ) ( CLEAR ?auto_271329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271328 ?auto_271329 )
      ( MAKE-13PILE ?auto_271328 ?auto_271329 ?auto_271330 ?auto_271331 ?auto_271332 ?auto_271333 ?auto_271334 ?auto_271335 ?auto_271336 ?auto_271337 ?auto_271338 ?auto_271339 ?auto_271340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271355 - BLOCK
      ?auto_271356 - BLOCK
      ?auto_271357 - BLOCK
      ?auto_271358 - BLOCK
      ?auto_271359 - BLOCK
      ?auto_271360 - BLOCK
      ?auto_271361 - BLOCK
      ?auto_271362 - BLOCK
      ?auto_271363 - BLOCK
      ?auto_271364 - BLOCK
      ?auto_271365 - BLOCK
      ?auto_271366 - BLOCK
      ?auto_271367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271367 ) ( ON-TABLE ?auto_271355 ) ( not ( = ?auto_271355 ?auto_271356 ) ) ( not ( = ?auto_271355 ?auto_271357 ) ) ( not ( = ?auto_271355 ?auto_271358 ) ) ( not ( = ?auto_271355 ?auto_271359 ) ) ( not ( = ?auto_271355 ?auto_271360 ) ) ( not ( = ?auto_271355 ?auto_271361 ) ) ( not ( = ?auto_271355 ?auto_271362 ) ) ( not ( = ?auto_271355 ?auto_271363 ) ) ( not ( = ?auto_271355 ?auto_271364 ) ) ( not ( = ?auto_271355 ?auto_271365 ) ) ( not ( = ?auto_271355 ?auto_271366 ) ) ( not ( = ?auto_271355 ?auto_271367 ) ) ( not ( = ?auto_271356 ?auto_271357 ) ) ( not ( = ?auto_271356 ?auto_271358 ) ) ( not ( = ?auto_271356 ?auto_271359 ) ) ( not ( = ?auto_271356 ?auto_271360 ) ) ( not ( = ?auto_271356 ?auto_271361 ) ) ( not ( = ?auto_271356 ?auto_271362 ) ) ( not ( = ?auto_271356 ?auto_271363 ) ) ( not ( = ?auto_271356 ?auto_271364 ) ) ( not ( = ?auto_271356 ?auto_271365 ) ) ( not ( = ?auto_271356 ?auto_271366 ) ) ( not ( = ?auto_271356 ?auto_271367 ) ) ( not ( = ?auto_271357 ?auto_271358 ) ) ( not ( = ?auto_271357 ?auto_271359 ) ) ( not ( = ?auto_271357 ?auto_271360 ) ) ( not ( = ?auto_271357 ?auto_271361 ) ) ( not ( = ?auto_271357 ?auto_271362 ) ) ( not ( = ?auto_271357 ?auto_271363 ) ) ( not ( = ?auto_271357 ?auto_271364 ) ) ( not ( = ?auto_271357 ?auto_271365 ) ) ( not ( = ?auto_271357 ?auto_271366 ) ) ( not ( = ?auto_271357 ?auto_271367 ) ) ( not ( = ?auto_271358 ?auto_271359 ) ) ( not ( = ?auto_271358 ?auto_271360 ) ) ( not ( = ?auto_271358 ?auto_271361 ) ) ( not ( = ?auto_271358 ?auto_271362 ) ) ( not ( = ?auto_271358 ?auto_271363 ) ) ( not ( = ?auto_271358 ?auto_271364 ) ) ( not ( = ?auto_271358 ?auto_271365 ) ) ( not ( = ?auto_271358 ?auto_271366 ) ) ( not ( = ?auto_271358 ?auto_271367 ) ) ( not ( = ?auto_271359 ?auto_271360 ) ) ( not ( = ?auto_271359 ?auto_271361 ) ) ( not ( = ?auto_271359 ?auto_271362 ) ) ( not ( = ?auto_271359 ?auto_271363 ) ) ( not ( = ?auto_271359 ?auto_271364 ) ) ( not ( = ?auto_271359 ?auto_271365 ) ) ( not ( = ?auto_271359 ?auto_271366 ) ) ( not ( = ?auto_271359 ?auto_271367 ) ) ( not ( = ?auto_271360 ?auto_271361 ) ) ( not ( = ?auto_271360 ?auto_271362 ) ) ( not ( = ?auto_271360 ?auto_271363 ) ) ( not ( = ?auto_271360 ?auto_271364 ) ) ( not ( = ?auto_271360 ?auto_271365 ) ) ( not ( = ?auto_271360 ?auto_271366 ) ) ( not ( = ?auto_271360 ?auto_271367 ) ) ( not ( = ?auto_271361 ?auto_271362 ) ) ( not ( = ?auto_271361 ?auto_271363 ) ) ( not ( = ?auto_271361 ?auto_271364 ) ) ( not ( = ?auto_271361 ?auto_271365 ) ) ( not ( = ?auto_271361 ?auto_271366 ) ) ( not ( = ?auto_271361 ?auto_271367 ) ) ( not ( = ?auto_271362 ?auto_271363 ) ) ( not ( = ?auto_271362 ?auto_271364 ) ) ( not ( = ?auto_271362 ?auto_271365 ) ) ( not ( = ?auto_271362 ?auto_271366 ) ) ( not ( = ?auto_271362 ?auto_271367 ) ) ( not ( = ?auto_271363 ?auto_271364 ) ) ( not ( = ?auto_271363 ?auto_271365 ) ) ( not ( = ?auto_271363 ?auto_271366 ) ) ( not ( = ?auto_271363 ?auto_271367 ) ) ( not ( = ?auto_271364 ?auto_271365 ) ) ( not ( = ?auto_271364 ?auto_271366 ) ) ( not ( = ?auto_271364 ?auto_271367 ) ) ( not ( = ?auto_271365 ?auto_271366 ) ) ( not ( = ?auto_271365 ?auto_271367 ) ) ( not ( = ?auto_271366 ?auto_271367 ) ) ( ON ?auto_271366 ?auto_271367 ) ( ON ?auto_271365 ?auto_271366 ) ( ON ?auto_271364 ?auto_271365 ) ( ON ?auto_271363 ?auto_271364 ) ( ON ?auto_271362 ?auto_271363 ) ( ON ?auto_271361 ?auto_271362 ) ( ON ?auto_271360 ?auto_271361 ) ( ON ?auto_271359 ?auto_271360 ) ( ON ?auto_271358 ?auto_271359 ) ( ON ?auto_271357 ?auto_271358 ) ( CLEAR ?auto_271355 ) ( ON ?auto_271356 ?auto_271357 ) ( CLEAR ?auto_271356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271355 ?auto_271356 )
      ( MAKE-13PILE ?auto_271355 ?auto_271356 ?auto_271357 ?auto_271358 ?auto_271359 ?auto_271360 ?auto_271361 ?auto_271362 ?auto_271363 ?auto_271364 ?auto_271365 ?auto_271366 ?auto_271367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271381 - BLOCK
      ?auto_271382 - BLOCK
      ?auto_271383 - BLOCK
      ?auto_271384 - BLOCK
      ?auto_271385 - BLOCK
      ?auto_271386 - BLOCK
      ?auto_271387 - BLOCK
      ?auto_271388 - BLOCK
      ?auto_271389 - BLOCK
      ?auto_271390 - BLOCK
      ?auto_271391 - BLOCK
      ?auto_271392 - BLOCK
      ?auto_271393 - BLOCK
    )
    :vars
    (
      ?auto_271394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271393 ?auto_271394 ) ( not ( = ?auto_271381 ?auto_271382 ) ) ( not ( = ?auto_271381 ?auto_271383 ) ) ( not ( = ?auto_271381 ?auto_271384 ) ) ( not ( = ?auto_271381 ?auto_271385 ) ) ( not ( = ?auto_271381 ?auto_271386 ) ) ( not ( = ?auto_271381 ?auto_271387 ) ) ( not ( = ?auto_271381 ?auto_271388 ) ) ( not ( = ?auto_271381 ?auto_271389 ) ) ( not ( = ?auto_271381 ?auto_271390 ) ) ( not ( = ?auto_271381 ?auto_271391 ) ) ( not ( = ?auto_271381 ?auto_271392 ) ) ( not ( = ?auto_271381 ?auto_271393 ) ) ( not ( = ?auto_271381 ?auto_271394 ) ) ( not ( = ?auto_271382 ?auto_271383 ) ) ( not ( = ?auto_271382 ?auto_271384 ) ) ( not ( = ?auto_271382 ?auto_271385 ) ) ( not ( = ?auto_271382 ?auto_271386 ) ) ( not ( = ?auto_271382 ?auto_271387 ) ) ( not ( = ?auto_271382 ?auto_271388 ) ) ( not ( = ?auto_271382 ?auto_271389 ) ) ( not ( = ?auto_271382 ?auto_271390 ) ) ( not ( = ?auto_271382 ?auto_271391 ) ) ( not ( = ?auto_271382 ?auto_271392 ) ) ( not ( = ?auto_271382 ?auto_271393 ) ) ( not ( = ?auto_271382 ?auto_271394 ) ) ( not ( = ?auto_271383 ?auto_271384 ) ) ( not ( = ?auto_271383 ?auto_271385 ) ) ( not ( = ?auto_271383 ?auto_271386 ) ) ( not ( = ?auto_271383 ?auto_271387 ) ) ( not ( = ?auto_271383 ?auto_271388 ) ) ( not ( = ?auto_271383 ?auto_271389 ) ) ( not ( = ?auto_271383 ?auto_271390 ) ) ( not ( = ?auto_271383 ?auto_271391 ) ) ( not ( = ?auto_271383 ?auto_271392 ) ) ( not ( = ?auto_271383 ?auto_271393 ) ) ( not ( = ?auto_271383 ?auto_271394 ) ) ( not ( = ?auto_271384 ?auto_271385 ) ) ( not ( = ?auto_271384 ?auto_271386 ) ) ( not ( = ?auto_271384 ?auto_271387 ) ) ( not ( = ?auto_271384 ?auto_271388 ) ) ( not ( = ?auto_271384 ?auto_271389 ) ) ( not ( = ?auto_271384 ?auto_271390 ) ) ( not ( = ?auto_271384 ?auto_271391 ) ) ( not ( = ?auto_271384 ?auto_271392 ) ) ( not ( = ?auto_271384 ?auto_271393 ) ) ( not ( = ?auto_271384 ?auto_271394 ) ) ( not ( = ?auto_271385 ?auto_271386 ) ) ( not ( = ?auto_271385 ?auto_271387 ) ) ( not ( = ?auto_271385 ?auto_271388 ) ) ( not ( = ?auto_271385 ?auto_271389 ) ) ( not ( = ?auto_271385 ?auto_271390 ) ) ( not ( = ?auto_271385 ?auto_271391 ) ) ( not ( = ?auto_271385 ?auto_271392 ) ) ( not ( = ?auto_271385 ?auto_271393 ) ) ( not ( = ?auto_271385 ?auto_271394 ) ) ( not ( = ?auto_271386 ?auto_271387 ) ) ( not ( = ?auto_271386 ?auto_271388 ) ) ( not ( = ?auto_271386 ?auto_271389 ) ) ( not ( = ?auto_271386 ?auto_271390 ) ) ( not ( = ?auto_271386 ?auto_271391 ) ) ( not ( = ?auto_271386 ?auto_271392 ) ) ( not ( = ?auto_271386 ?auto_271393 ) ) ( not ( = ?auto_271386 ?auto_271394 ) ) ( not ( = ?auto_271387 ?auto_271388 ) ) ( not ( = ?auto_271387 ?auto_271389 ) ) ( not ( = ?auto_271387 ?auto_271390 ) ) ( not ( = ?auto_271387 ?auto_271391 ) ) ( not ( = ?auto_271387 ?auto_271392 ) ) ( not ( = ?auto_271387 ?auto_271393 ) ) ( not ( = ?auto_271387 ?auto_271394 ) ) ( not ( = ?auto_271388 ?auto_271389 ) ) ( not ( = ?auto_271388 ?auto_271390 ) ) ( not ( = ?auto_271388 ?auto_271391 ) ) ( not ( = ?auto_271388 ?auto_271392 ) ) ( not ( = ?auto_271388 ?auto_271393 ) ) ( not ( = ?auto_271388 ?auto_271394 ) ) ( not ( = ?auto_271389 ?auto_271390 ) ) ( not ( = ?auto_271389 ?auto_271391 ) ) ( not ( = ?auto_271389 ?auto_271392 ) ) ( not ( = ?auto_271389 ?auto_271393 ) ) ( not ( = ?auto_271389 ?auto_271394 ) ) ( not ( = ?auto_271390 ?auto_271391 ) ) ( not ( = ?auto_271390 ?auto_271392 ) ) ( not ( = ?auto_271390 ?auto_271393 ) ) ( not ( = ?auto_271390 ?auto_271394 ) ) ( not ( = ?auto_271391 ?auto_271392 ) ) ( not ( = ?auto_271391 ?auto_271393 ) ) ( not ( = ?auto_271391 ?auto_271394 ) ) ( not ( = ?auto_271392 ?auto_271393 ) ) ( not ( = ?auto_271392 ?auto_271394 ) ) ( not ( = ?auto_271393 ?auto_271394 ) ) ( ON ?auto_271392 ?auto_271393 ) ( ON ?auto_271391 ?auto_271392 ) ( ON ?auto_271390 ?auto_271391 ) ( ON ?auto_271389 ?auto_271390 ) ( ON ?auto_271388 ?auto_271389 ) ( ON ?auto_271387 ?auto_271388 ) ( ON ?auto_271386 ?auto_271387 ) ( ON ?auto_271385 ?auto_271386 ) ( ON ?auto_271384 ?auto_271385 ) ( ON ?auto_271383 ?auto_271384 ) ( ON ?auto_271382 ?auto_271383 ) ( ON ?auto_271381 ?auto_271382 ) ( CLEAR ?auto_271381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271381 )
      ( MAKE-13PILE ?auto_271381 ?auto_271382 ?auto_271383 ?auto_271384 ?auto_271385 ?auto_271386 ?auto_271387 ?auto_271388 ?auto_271389 ?auto_271390 ?auto_271391 ?auto_271392 ?auto_271393 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271408 - BLOCK
      ?auto_271409 - BLOCK
      ?auto_271410 - BLOCK
      ?auto_271411 - BLOCK
      ?auto_271412 - BLOCK
      ?auto_271413 - BLOCK
      ?auto_271414 - BLOCK
      ?auto_271415 - BLOCK
      ?auto_271416 - BLOCK
      ?auto_271417 - BLOCK
      ?auto_271418 - BLOCK
      ?auto_271419 - BLOCK
      ?auto_271420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271420 ) ( not ( = ?auto_271408 ?auto_271409 ) ) ( not ( = ?auto_271408 ?auto_271410 ) ) ( not ( = ?auto_271408 ?auto_271411 ) ) ( not ( = ?auto_271408 ?auto_271412 ) ) ( not ( = ?auto_271408 ?auto_271413 ) ) ( not ( = ?auto_271408 ?auto_271414 ) ) ( not ( = ?auto_271408 ?auto_271415 ) ) ( not ( = ?auto_271408 ?auto_271416 ) ) ( not ( = ?auto_271408 ?auto_271417 ) ) ( not ( = ?auto_271408 ?auto_271418 ) ) ( not ( = ?auto_271408 ?auto_271419 ) ) ( not ( = ?auto_271408 ?auto_271420 ) ) ( not ( = ?auto_271409 ?auto_271410 ) ) ( not ( = ?auto_271409 ?auto_271411 ) ) ( not ( = ?auto_271409 ?auto_271412 ) ) ( not ( = ?auto_271409 ?auto_271413 ) ) ( not ( = ?auto_271409 ?auto_271414 ) ) ( not ( = ?auto_271409 ?auto_271415 ) ) ( not ( = ?auto_271409 ?auto_271416 ) ) ( not ( = ?auto_271409 ?auto_271417 ) ) ( not ( = ?auto_271409 ?auto_271418 ) ) ( not ( = ?auto_271409 ?auto_271419 ) ) ( not ( = ?auto_271409 ?auto_271420 ) ) ( not ( = ?auto_271410 ?auto_271411 ) ) ( not ( = ?auto_271410 ?auto_271412 ) ) ( not ( = ?auto_271410 ?auto_271413 ) ) ( not ( = ?auto_271410 ?auto_271414 ) ) ( not ( = ?auto_271410 ?auto_271415 ) ) ( not ( = ?auto_271410 ?auto_271416 ) ) ( not ( = ?auto_271410 ?auto_271417 ) ) ( not ( = ?auto_271410 ?auto_271418 ) ) ( not ( = ?auto_271410 ?auto_271419 ) ) ( not ( = ?auto_271410 ?auto_271420 ) ) ( not ( = ?auto_271411 ?auto_271412 ) ) ( not ( = ?auto_271411 ?auto_271413 ) ) ( not ( = ?auto_271411 ?auto_271414 ) ) ( not ( = ?auto_271411 ?auto_271415 ) ) ( not ( = ?auto_271411 ?auto_271416 ) ) ( not ( = ?auto_271411 ?auto_271417 ) ) ( not ( = ?auto_271411 ?auto_271418 ) ) ( not ( = ?auto_271411 ?auto_271419 ) ) ( not ( = ?auto_271411 ?auto_271420 ) ) ( not ( = ?auto_271412 ?auto_271413 ) ) ( not ( = ?auto_271412 ?auto_271414 ) ) ( not ( = ?auto_271412 ?auto_271415 ) ) ( not ( = ?auto_271412 ?auto_271416 ) ) ( not ( = ?auto_271412 ?auto_271417 ) ) ( not ( = ?auto_271412 ?auto_271418 ) ) ( not ( = ?auto_271412 ?auto_271419 ) ) ( not ( = ?auto_271412 ?auto_271420 ) ) ( not ( = ?auto_271413 ?auto_271414 ) ) ( not ( = ?auto_271413 ?auto_271415 ) ) ( not ( = ?auto_271413 ?auto_271416 ) ) ( not ( = ?auto_271413 ?auto_271417 ) ) ( not ( = ?auto_271413 ?auto_271418 ) ) ( not ( = ?auto_271413 ?auto_271419 ) ) ( not ( = ?auto_271413 ?auto_271420 ) ) ( not ( = ?auto_271414 ?auto_271415 ) ) ( not ( = ?auto_271414 ?auto_271416 ) ) ( not ( = ?auto_271414 ?auto_271417 ) ) ( not ( = ?auto_271414 ?auto_271418 ) ) ( not ( = ?auto_271414 ?auto_271419 ) ) ( not ( = ?auto_271414 ?auto_271420 ) ) ( not ( = ?auto_271415 ?auto_271416 ) ) ( not ( = ?auto_271415 ?auto_271417 ) ) ( not ( = ?auto_271415 ?auto_271418 ) ) ( not ( = ?auto_271415 ?auto_271419 ) ) ( not ( = ?auto_271415 ?auto_271420 ) ) ( not ( = ?auto_271416 ?auto_271417 ) ) ( not ( = ?auto_271416 ?auto_271418 ) ) ( not ( = ?auto_271416 ?auto_271419 ) ) ( not ( = ?auto_271416 ?auto_271420 ) ) ( not ( = ?auto_271417 ?auto_271418 ) ) ( not ( = ?auto_271417 ?auto_271419 ) ) ( not ( = ?auto_271417 ?auto_271420 ) ) ( not ( = ?auto_271418 ?auto_271419 ) ) ( not ( = ?auto_271418 ?auto_271420 ) ) ( not ( = ?auto_271419 ?auto_271420 ) ) ( ON ?auto_271419 ?auto_271420 ) ( ON ?auto_271418 ?auto_271419 ) ( ON ?auto_271417 ?auto_271418 ) ( ON ?auto_271416 ?auto_271417 ) ( ON ?auto_271415 ?auto_271416 ) ( ON ?auto_271414 ?auto_271415 ) ( ON ?auto_271413 ?auto_271414 ) ( ON ?auto_271412 ?auto_271413 ) ( ON ?auto_271411 ?auto_271412 ) ( ON ?auto_271410 ?auto_271411 ) ( ON ?auto_271409 ?auto_271410 ) ( ON ?auto_271408 ?auto_271409 ) ( CLEAR ?auto_271408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271408 )
      ( MAKE-13PILE ?auto_271408 ?auto_271409 ?auto_271410 ?auto_271411 ?auto_271412 ?auto_271413 ?auto_271414 ?auto_271415 ?auto_271416 ?auto_271417 ?auto_271418 ?auto_271419 ?auto_271420 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271434 - BLOCK
      ?auto_271435 - BLOCK
      ?auto_271436 - BLOCK
      ?auto_271437 - BLOCK
      ?auto_271438 - BLOCK
      ?auto_271439 - BLOCK
      ?auto_271440 - BLOCK
      ?auto_271441 - BLOCK
      ?auto_271442 - BLOCK
      ?auto_271443 - BLOCK
      ?auto_271444 - BLOCK
      ?auto_271445 - BLOCK
      ?auto_271446 - BLOCK
    )
    :vars
    (
      ?auto_271447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_271434 ?auto_271435 ) ) ( not ( = ?auto_271434 ?auto_271436 ) ) ( not ( = ?auto_271434 ?auto_271437 ) ) ( not ( = ?auto_271434 ?auto_271438 ) ) ( not ( = ?auto_271434 ?auto_271439 ) ) ( not ( = ?auto_271434 ?auto_271440 ) ) ( not ( = ?auto_271434 ?auto_271441 ) ) ( not ( = ?auto_271434 ?auto_271442 ) ) ( not ( = ?auto_271434 ?auto_271443 ) ) ( not ( = ?auto_271434 ?auto_271444 ) ) ( not ( = ?auto_271434 ?auto_271445 ) ) ( not ( = ?auto_271434 ?auto_271446 ) ) ( not ( = ?auto_271435 ?auto_271436 ) ) ( not ( = ?auto_271435 ?auto_271437 ) ) ( not ( = ?auto_271435 ?auto_271438 ) ) ( not ( = ?auto_271435 ?auto_271439 ) ) ( not ( = ?auto_271435 ?auto_271440 ) ) ( not ( = ?auto_271435 ?auto_271441 ) ) ( not ( = ?auto_271435 ?auto_271442 ) ) ( not ( = ?auto_271435 ?auto_271443 ) ) ( not ( = ?auto_271435 ?auto_271444 ) ) ( not ( = ?auto_271435 ?auto_271445 ) ) ( not ( = ?auto_271435 ?auto_271446 ) ) ( not ( = ?auto_271436 ?auto_271437 ) ) ( not ( = ?auto_271436 ?auto_271438 ) ) ( not ( = ?auto_271436 ?auto_271439 ) ) ( not ( = ?auto_271436 ?auto_271440 ) ) ( not ( = ?auto_271436 ?auto_271441 ) ) ( not ( = ?auto_271436 ?auto_271442 ) ) ( not ( = ?auto_271436 ?auto_271443 ) ) ( not ( = ?auto_271436 ?auto_271444 ) ) ( not ( = ?auto_271436 ?auto_271445 ) ) ( not ( = ?auto_271436 ?auto_271446 ) ) ( not ( = ?auto_271437 ?auto_271438 ) ) ( not ( = ?auto_271437 ?auto_271439 ) ) ( not ( = ?auto_271437 ?auto_271440 ) ) ( not ( = ?auto_271437 ?auto_271441 ) ) ( not ( = ?auto_271437 ?auto_271442 ) ) ( not ( = ?auto_271437 ?auto_271443 ) ) ( not ( = ?auto_271437 ?auto_271444 ) ) ( not ( = ?auto_271437 ?auto_271445 ) ) ( not ( = ?auto_271437 ?auto_271446 ) ) ( not ( = ?auto_271438 ?auto_271439 ) ) ( not ( = ?auto_271438 ?auto_271440 ) ) ( not ( = ?auto_271438 ?auto_271441 ) ) ( not ( = ?auto_271438 ?auto_271442 ) ) ( not ( = ?auto_271438 ?auto_271443 ) ) ( not ( = ?auto_271438 ?auto_271444 ) ) ( not ( = ?auto_271438 ?auto_271445 ) ) ( not ( = ?auto_271438 ?auto_271446 ) ) ( not ( = ?auto_271439 ?auto_271440 ) ) ( not ( = ?auto_271439 ?auto_271441 ) ) ( not ( = ?auto_271439 ?auto_271442 ) ) ( not ( = ?auto_271439 ?auto_271443 ) ) ( not ( = ?auto_271439 ?auto_271444 ) ) ( not ( = ?auto_271439 ?auto_271445 ) ) ( not ( = ?auto_271439 ?auto_271446 ) ) ( not ( = ?auto_271440 ?auto_271441 ) ) ( not ( = ?auto_271440 ?auto_271442 ) ) ( not ( = ?auto_271440 ?auto_271443 ) ) ( not ( = ?auto_271440 ?auto_271444 ) ) ( not ( = ?auto_271440 ?auto_271445 ) ) ( not ( = ?auto_271440 ?auto_271446 ) ) ( not ( = ?auto_271441 ?auto_271442 ) ) ( not ( = ?auto_271441 ?auto_271443 ) ) ( not ( = ?auto_271441 ?auto_271444 ) ) ( not ( = ?auto_271441 ?auto_271445 ) ) ( not ( = ?auto_271441 ?auto_271446 ) ) ( not ( = ?auto_271442 ?auto_271443 ) ) ( not ( = ?auto_271442 ?auto_271444 ) ) ( not ( = ?auto_271442 ?auto_271445 ) ) ( not ( = ?auto_271442 ?auto_271446 ) ) ( not ( = ?auto_271443 ?auto_271444 ) ) ( not ( = ?auto_271443 ?auto_271445 ) ) ( not ( = ?auto_271443 ?auto_271446 ) ) ( not ( = ?auto_271444 ?auto_271445 ) ) ( not ( = ?auto_271444 ?auto_271446 ) ) ( not ( = ?auto_271445 ?auto_271446 ) ) ( ON ?auto_271434 ?auto_271447 ) ( not ( = ?auto_271446 ?auto_271447 ) ) ( not ( = ?auto_271445 ?auto_271447 ) ) ( not ( = ?auto_271444 ?auto_271447 ) ) ( not ( = ?auto_271443 ?auto_271447 ) ) ( not ( = ?auto_271442 ?auto_271447 ) ) ( not ( = ?auto_271441 ?auto_271447 ) ) ( not ( = ?auto_271440 ?auto_271447 ) ) ( not ( = ?auto_271439 ?auto_271447 ) ) ( not ( = ?auto_271438 ?auto_271447 ) ) ( not ( = ?auto_271437 ?auto_271447 ) ) ( not ( = ?auto_271436 ?auto_271447 ) ) ( not ( = ?auto_271435 ?auto_271447 ) ) ( not ( = ?auto_271434 ?auto_271447 ) ) ( ON ?auto_271435 ?auto_271434 ) ( ON ?auto_271436 ?auto_271435 ) ( ON ?auto_271437 ?auto_271436 ) ( ON ?auto_271438 ?auto_271437 ) ( ON ?auto_271439 ?auto_271438 ) ( ON ?auto_271440 ?auto_271439 ) ( ON ?auto_271441 ?auto_271440 ) ( ON ?auto_271442 ?auto_271441 ) ( ON ?auto_271443 ?auto_271442 ) ( ON ?auto_271444 ?auto_271443 ) ( ON ?auto_271445 ?auto_271444 ) ( ON ?auto_271446 ?auto_271445 ) ( CLEAR ?auto_271446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_271446 ?auto_271445 ?auto_271444 ?auto_271443 ?auto_271442 ?auto_271441 ?auto_271440 ?auto_271439 ?auto_271438 ?auto_271437 ?auto_271436 ?auto_271435 ?auto_271434 )
      ( MAKE-13PILE ?auto_271434 ?auto_271435 ?auto_271436 ?auto_271437 ?auto_271438 ?auto_271439 ?auto_271440 ?auto_271441 ?auto_271442 ?auto_271443 ?auto_271444 ?auto_271445 ?auto_271446 ) )
  )

)

