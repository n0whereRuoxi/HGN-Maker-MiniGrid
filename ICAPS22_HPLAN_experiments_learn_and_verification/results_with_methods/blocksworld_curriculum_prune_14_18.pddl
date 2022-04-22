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
      ?auto_352051 - BLOCK
    )
    :vars
    (
      ?auto_352052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352051 ?auto_352052 ) ( CLEAR ?auto_352051 ) ( HAND-EMPTY ) ( not ( = ?auto_352051 ?auto_352052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352051 ?auto_352052 )
      ( !PUTDOWN ?auto_352051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_352058 - BLOCK
      ?auto_352059 - BLOCK
    )
    :vars
    (
      ?auto_352060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352058 ) ( ON ?auto_352059 ?auto_352060 ) ( CLEAR ?auto_352059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352058 ) ( not ( = ?auto_352058 ?auto_352059 ) ) ( not ( = ?auto_352058 ?auto_352060 ) ) ( not ( = ?auto_352059 ?auto_352060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352059 ?auto_352060 )
      ( !STACK ?auto_352059 ?auto_352058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_352068 - BLOCK
      ?auto_352069 - BLOCK
    )
    :vars
    (
      ?auto_352070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352069 ?auto_352070 ) ( not ( = ?auto_352068 ?auto_352069 ) ) ( not ( = ?auto_352068 ?auto_352070 ) ) ( not ( = ?auto_352069 ?auto_352070 ) ) ( ON ?auto_352068 ?auto_352069 ) ( CLEAR ?auto_352068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352068 )
      ( MAKE-2PILE ?auto_352068 ?auto_352069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_352079 - BLOCK
      ?auto_352080 - BLOCK
      ?auto_352081 - BLOCK
    )
    :vars
    (
      ?auto_352082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352080 ) ( ON ?auto_352081 ?auto_352082 ) ( CLEAR ?auto_352081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352079 ) ( ON ?auto_352080 ?auto_352079 ) ( not ( = ?auto_352079 ?auto_352080 ) ) ( not ( = ?auto_352079 ?auto_352081 ) ) ( not ( = ?auto_352079 ?auto_352082 ) ) ( not ( = ?auto_352080 ?auto_352081 ) ) ( not ( = ?auto_352080 ?auto_352082 ) ) ( not ( = ?auto_352081 ?auto_352082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352081 ?auto_352082 )
      ( !STACK ?auto_352081 ?auto_352080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_352093 - BLOCK
      ?auto_352094 - BLOCK
      ?auto_352095 - BLOCK
    )
    :vars
    (
      ?auto_352096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352095 ?auto_352096 ) ( ON-TABLE ?auto_352093 ) ( not ( = ?auto_352093 ?auto_352094 ) ) ( not ( = ?auto_352093 ?auto_352095 ) ) ( not ( = ?auto_352093 ?auto_352096 ) ) ( not ( = ?auto_352094 ?auto_352095 ) ) ( not ( = ?auto_352094 ?auto_352096 ) ) ( not ( = ?auto_352095 ?auto_352096 ) ) ( CLEAR ?auto_352093 ) ( ON ?auto_352094 ?auto_352095 ) ( CLEAR ?auto_352094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352093 ?auto_352094 )
      ( MAKE-3PILE ?auto_352093 ?auto_352094 ?auto_352095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_352107 - BLOCK
      ?auto_352108 - BLOCK
      ?auto_352109 - BLOCK
    )
    :vars
    (
      ?auto_352110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352109 ?auto_352110 ) ( not ( = ?auto_352107 ?auto_352108 ) ) ( not ( = ?auto_352107 ?auto_352109 ) ) ( not ( = ?auto_352107 ?auto_352110 ) ) ( not ( = ?auto_352108 ?auto_352109 ) ) ( not ( = ?auto_352108 ?auto_352110 ) ) ( not ( = ?auto_352109 ?auto_352110 ) ) ( ON ?auto_352108 ?auto_352109 ) ( ON ?auto_352107 ?auto_352108 ) ( CLEAR ?auto_352107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352107 )
      ( MAKE-3PILE ?auto_352107 ?auto_352108 ?auto_352109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_352122 - BLOCK
      ?auto_352123 - BLOCK
      ?auto_352124 - BLOCK
      ?auto_352125 - BLOCK
    )
    :vars
    (
      ?auto_352126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352124 ) ( ON ?auto_352125 ?auto_352126 ) ( CLEAR ?auto_352125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352122 ) ( ON ?auto_352123 ?auto_352122 ) ( ON ?auto_352124 ?auto_352123 ) ( not ( = ?auto_352122 ?auto_352123 ) ) ( not ( = ?auto_352122 ?auto_352124 ) ) ( not ( = ?auto_352122 ?auto_352125 ) ) ( not ( = ?auto_352122 ?auto_352126 ) ) ( not ( = ?auto_352123 ?auto_352124 ) ) ( not ( = ?auto_352123 ?auto_352125 ) ) ( not ( = ?auto_352123 ?auto_352126 ) ) ( not ( = ?auto_352124 ?auto_352125 ) ) ( not ( = ?auto_352124 ?auto_352126 ) ) ( not ( = ?auto_352125 ?auto_352126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352125 ?auto_352126 )
      ( !STACK ?auto_352125 ?auto_352124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_352140 - BLOCK
      ?auto_352141 - BLOCK
      ?auto_352142 - BLOCK
      ?auto_352143 - BLOCK
    )
    :vars
    (
      ?auto_352144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352143 ?auto_352144 ) ( ON-TABLE ?auto_352140 ) ( ON ?auto_352141 ?auto_352140 ) ( not ( = ?auto_352140 ?auto_352141 ) ) ( not ( = ?auto_352140 ?auto_352142 ) ) ( not ( = ?auto_352140 ?auto_352143 ) ) ( not ( = ?auto_352140 ?auto_352144 ) ) ( not ( = ?auto_352141 ?auto_352142 ) ) ( not ( = ?auto_352141 ?auto_352143 ) ) ( not ( = ?auto_352141 ?auto_352144 ) ) ( not ( = ?auto_352142 ?auto_352143 ) ) ( not ( = ?auto_352142 ?auto_352144 ) ) ( not ( = ?auto_352143 ?auto_352144 ) ) ( CLEAR ?auto_352141 ) ( ON ?auto_352142 ?auto_352143 ) ( CLEAR ?auto_352142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_352140 ?auto_352141 ?auto_352142 )
      ( MAKE-4PILE ?auto_352140 ?auto_352141 ?auto_352142 ?auto_352143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_352158 - BLOCK
      ?auto_352159 - BLOCK
      ?auto_352160 - BLOCK
      ?auto_352161 - BLOCK
    )
    :vars
    (
      ?auto_352162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352161 ?auto_352162 ) ( ON-TABLE ?auto_352158 ) ( not ( = ?auto_352158 ?auto_352159 ) ) ( not ( = ?auto_352158 ?auto_352160 ) ) ( not ( = ?auto_352158 ?auto_352161 ) ) ( not ( = ?auto_352158 ?auto_352162 ) ) ( not ( = ?auto_352159 ?auto_352160 ) ) ( not ( = ?auto_352159 ?auto_352161 ) ) ( not ( = ?auto_352159 ?auto_352162 ) ) ( not ( = ?auto_352160 ?auto_352161 ) ) ( not ( = ?auto_352160 ?auto_352162 ) ) ( not ( = ?auto_352161 ?auto_352162 ) ) ( ON ?auto_352160 ?auto_352161 ) ( CLEAR ?auto_352158 ) ( ON ?auto_352159 ?auto_352160 ) ( CLEAR ?auto_352159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352158 ?auto_352159 )
      ( MAKE-4PILE ?auto_352158 ?auto_352159 ?auto_352160 ?auto_352161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_352176 - BLOCK
      ?auto_352177 - BLOCK
      ?auto_352178 - BLOCK
      ?auto_352179 - BLOCK
    )
    :vars
    (
      ?auto_352180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352179 ?auto_352180 ) ( not ( = ?auto_352176 ?auto_352177 ) ) ( not ( = ?auto_352176 ?auto_352178 ) ) ( not ( = ?auto_352176 ?auto_352179 ) ) ( not ( = ?auto_352176 ?auto_352180 ) ) ( not ( = ?auto_352177 ?auto_352178 ) ) ( not ( = ?auto_352177 ?auto_352179 ) ) ( not ( = ?auto_352177 ?auto_352180 ) ) ( not ( = ?auto_352178 ?auto_352179 ) ) ( not ( = ?auto_352178 ?auto_352180 ) ) ( not ( = ?auto_352179 ?auto_352180 ) ) ( ON ?auto_352178 ?auto_352179 ) ( ON ?auto_352177 ?auto_352178 ) ( ON ?auto_352176 ?auto_352177 ) ( CLEAR ?auto_352176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352176 )
      ( MAKE-4PILE ?auto_352176 ?auto_352177 ?auto_352178 ?auto_352179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_352195 - BLOCK
      ?auto_352196 - BLOCK
      ?auto_352197 - BLOCK
      ?auto_352198 - BLOCK
      ?auto_352199 - BLOCK
    )
    :vars
    (
      ?auto_352200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352198 ) ( ON ?auto_352199 ?auto_352200 ) ( CLEAR ?auto_352199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352195 ) ( ON ?auto_352196 ?auto_352195 ) ( ON ?auto_352197 ?auto_352196 ) ( ON ?auto_352198 ?auto_352197 ) ( not ( = ?auto_352195 ?auto_352196 ) ) ( not ( = ?auto_352195 ?auto_352197 ) ) ( not ( = ?auto_352195 ?auto_352198 ) ) ( not ( = ?auto_352195 ?auto_352199 ) ) ( not ( = ?auto_352195 ?auto_352200 ) ) ( not ( = ?auto_352196 ?auto_352197 ) ) ( not ( = ?auto_352196 ?auto_352198 ) ) ( not ( = ?auto_352196 ?auto_352199 ) ) ( not ( = ?auto_352196 ?auto_352200 ) ) ( not ( = ?auto_352197 ?auto_352198 ) ) ( not ( = ?auto_352197 ?auto_352199 ) ) ( not ( = ?auto_352197 ?auto_352200 ) ) ( not ( = ?auto_352198 ?auto_352199 ) ) ( not ( = ?auto_352198 ?auto_352200 ) ) ( not ( = ?auto_352199 ?auto_352200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352199 ?auto_352200 )
      ( !STACK ?auto_352199 ?auto_352198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_352217 - BLOCK
      ?auto_352218 - BLOCK
      ?auto_352219 - BLOCK
      ?auto_352220 - BLOCK
      ?auto_352221 - BLOCK
    )
    :vars
    (
      ?auto_352222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352221 ?auto_352222 ) ( ON-TABLE ?auto_352217 ) ( ON ?auto_352218 ?auto_352217 ) ( ON ?auto_352219 ?auto_352218 ) ( not ( = ?auto_352217 ?auto_352218 ) ) ( not ( = ?auto_352217 ?auto_352219 ) ) ( not ( = ?auto_352217 ?auto_352220 ) ) ( not ( = ?auto_352217 ?auto_352221 ) ) ( not ( = ?auto_352217 ?auto_352222 ) ) ( not ( = ?auto_352218 ?auto_352219 ) ) ( not ( = ?auto_352218 ?auto_352220 ) ) ( not ( = ?auto_352218 ?auto_352221 ) ) ( not ( = ?auto_352218 ?auto_352222 ) ) ( not ( = ?auto_352219 ?auto_352220 ) ) ( not ( = ?auto_352219 ?auto_352221 ) ) ( not ( = ?auto_352219 ?auto_352222 ) ) ( not ( = ?auto_352220 ?auto_352221 ) ) ( not ( = ?auto_352220 ?auto_352222 ) ) ( not ( = ?auto_352221 ?auto_352222 ) ) ( CLEAR ?auto_352219 ) ( ON ?auto_352220 ?auto_352221 ) ( CLEAR ?auto_352220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_352217 ?auto_352218 ?auto_352219 ?auto_352220 )
      ( MAKE-5PILE ?auto_352217 ?auto_352218 ?auto_352219 ?auto_352220 ?auto_352221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_352239 - BLOCK
      ?auto_352240 - BLOCK
      ?auto_352241 - BLOCK
      ?auto_352242 - BLOCK
      ?auto_352243 - BLOCK
    )
    :vars
    (
      ?auto_352244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352243 ?auto_352244 ) ( ON-TABLE ?auto_352239 ) ( ON ?auto_352240 ?auto_352239 ) ( not ( = ?auto_352239 ?auto_352240 ) ) ( not ( = ?auto_352239 ?auto_352241 ) ) ( not ( = ?auto_352239 ?auto_352242 ) ) ( not ( = ?auto_352239 ?auto_352243 ) ) ( not ( = ?auto_352239 ?auto_352244 ) ) ( not ( = ?auto_352240 ?auto_352241 ) ) ( not ( = ?auto_352240 ?auto_352242 ) ) ( not ( = ?auto_352240 ?auto_352243 ) ) ( not ( = ?auto_352240 ?auto_352244 ) ) ( not ( = ?auto_352241 ?auto_352242 ) ) ( not ( = ?auto_352241 ?auto_352243 ) ) ( not ( = ?auto_352241 ?auto_352244 ) ) ( not ( = ?auto_352242 ?auto_352243 ) ) ( not ( = ?auto_352242 ?auto_352244 ) ) ( not ( = ?auto_352243 ?auto_352244 ) ) ( ON ?auto_352242 ?auto_352243 ) ( CLEAR ?auto_352240 ) ( ON ?auto_352241 ?auto_352242 ) ( CLEAR ?auto_352241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_352239 ?auto_352240 ?auto_352241 )
      ( MAKE-5PILE ?auto_352239 ?auto_352240 ?auto_352241 ?auto_352242 ?auto_352243 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_352261 - BLOCK
      ?auto_352262 - BLOCK
      ?auto_352263 - BLOCK
      ?auto_352264 - BLOCK
      ?auto_352265 - BLOCK
    )
    :vars
    (
      ?auto_352266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352265 ?auto_352266 ) ( ON-TABLE ?auto_352261 ) ( not ( = ?auto_352261 ?auto_352262 ) ) ( not ( = ?auto_352261 ?auto_352263 ) ) ( not ( = ?auto_352261 ?auto_352264 ) ) ( not ( = ?auto_352261 ?auto_352265 ) ) ( not ( = ?auto_352261 ?auto_352266 ) ) ( not ( = ?auto_352262 ?auto_352263 ) ) ( not ( = ?auto_352262 ?auto_352264 ) ) ( not ( = ?auto_352262 ?auto_352265 ) ) ( not ( = ?auto_352262 ?auto_352266 ) ) ( not ( = ?auto_352263 ?auto_352264 ) ) ( not ( = ?auto_352263 ?auto_352265 ) ) ( not ( = ?auto_352263 ?auto_352266 ) ) ( not ( = ?auto_352264 ?auto_352265 ) ) ( not ( = ?auto_352264 ?auto_352266 ) ) ( not ( = ?auto_352265 ?auto_352266 ) ) ( ON ?auto_352264 ?auto_352265 ) ( ON ?auto_352263 ?auto_352264 ) ( CLEAR ?auto_352261 ) ( ON ?auto_352262 ?auto_352263 ) ( CLEAR ?auto_352262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352261 ?auto_352262 )
      ( MAKE-5PILE ?auto_352261 ?auto_352262 ?auto_352263 ?auto_352264 ?auto_352265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_352283 - BLOCK
      ?auto_352284 - BLOCK
      ?auto_352285 - BLOCK
      ?auto_352286 - BLOCK
      ?auto_352287 - BLOCK
    )
    :vars
    (
      ?auto_352288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352287 ?auto_352288 ) ( not ( = ?auto_352283 ?auto_352284 ) ) ( not ( = ?auto_352283 ?auto_352285 ) ) ( not ( = ?auto_352283 ?auto_352286 ) ) ( not ( = ?auto_352283 ?auto_352287 ) ) ( not ( = ?auto_352283 ?auto_352288 ) ) ( not ( = ?auto_352284 ?auto_352285 ) ) ( not ( = ?auto_352284 ?auto_352286 ) ) ( not ( = ?auto_352284 ?auto_352287 ) ) ( not ( = ?auto_352284 ?auto_352288 ) ) ( not ( = ?auto_352285 ?auto_352286 ) ) ( not ( = ?auto_352285 ?auto_352287 ) ) ( not ( = ?auto_352285 ?auto_352288 ) ) ( not ( = ?auto_352286 ?auto_352287 ) ) ( not ( = ?auto_352286 ?auto_352288 ) ) ( not ( = ?auto_352287 ?auto_352288 ) ) ( ON ?auto_352286 ?auto_352287 ) ( ON ?auto_352285 ?auto_352286 ) ( ON ?auto_352284 ?auto_352285 ) ( ON ?auto_352283 ?auto_352284 ) ( CLEAR ?auto_352283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352283 )
      ( MAKE-5PILE ?auto_352283 ?auto_352284 ?auto_352285 ?auto_352286 ?auto_352287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352306 - BLOCK
      ?auto_352307 - BLOCK
      ?auto_352308 - BLOCK
      ?auto_352309 - BLOCK
      ?auto_352310 - BLOCK
      ?auto_352311 - BLOCK
    )
    :vars
    (
      ?auto_352312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352310 ) ( ON ?auto_352311 ?auto_352312 ) ( CLEAR ?auto_352311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352306 ) ( ON ?auto_352307 ?auto_352306 ) ( ON ?auto_352308 ?auto_352307 ) ( ON ?auto_352309 ?auto_352308 ) ( ON ?auto_352310 ?auto_352309 ) ( not ( = ?auto_352306 ?auto_352307 ) ) ( not ( = ?auto_352306 ?auto_352308 ) ) ( not ( = ?auto_352306 ?auto_352309 ) ) ( not ( = ?auto_352306 ?auto_352310 ) ) ( not ( = ?auto_352306 ?auto_352311 ) ) ( not ( = ?auto_352306 ?auto_352312 ) ) ( not ( = ?auto_352307 ?auto_352308 ) ) ( not ( = ?auto_352307 ?auto_352309 ) ) ( not ( = ?auto_352307 ?auto_352310 ) ) ( not ( = ?auto_352307 ?auto_352311 ) ) ( not ( = ?auto_352307 ?auto_352312 ) ) ( not ( = ?auto_352308 ?auto_352309 ) ) ( not ( = ?auto_352308 ?auto_352310 ) ) ( not ( = ?auto_352308 ?auto_352311 ) ) ( not ( = ?auto_352308 ?auto_352312 ) ) ( not ( = ?auto_352309 ?auto_352310 ) ) ( not ( = ?auto_352309 ?auto_352311 ) ) ( not ( = ?auto_352309 ?auto_352312 ) ) ( not ( = ?auto_352310 ?auto_352311 ) ) ( not ( = ?auto_352310 ?auto_352312 ) ) ( not ( = ?auto_352311 ?auto_352312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352311 ?auto_352312 )
      ( !STACK ?auto_352311 ?auto_352310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352332 - BLOCK
      ?auto_352333 - BLOCK
      ?auto_352334 - BLOCK
      ?auto_352335 - BLOCK
      ?auto_352336 - BLOCK
      ?auto_352337 - BLOCK
    )
    :vars
    (
      ?auto_352338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352337 ?auto_352338 ) ( ON-TABLE ?auto_352332 ) ( ON ?auto_352333 ?auto_352332 ) ( ON ?auto_352334 ?auto_352333 ) ( ON ?auto_352335 ?auto_352334 ) ( not ( = ?auto_352332 ?auto_352333 ) ) ( not ( = ?auto_352332 ?auto_352334 ) ) ( not ( = ?auto_352332 ?auto_352335 ) ) ( not ( = ?auto_352332 ?auto_352336 ) ) ( not ( = ?auto_352332 ?auto_352337 ) ) ( not ( = ?auto_352332 ?auto_352338 ) ) ( not ( = ?auto_352333 ?auto_352334 ) ) ( not ( = ?auto_352333 ?auto_352335 ) ) ( not ( = ?auto_352333 ?auto_352336 ) ) ( not ( = ?auto_352333 ?auto_352337 ) ) ( not ( = ?auto_352333 ?auto_352338 ) ) ( not ( = ?auto_352334 ?auto_352335 ) ) ( not ( = ?auto_352334 ?auto_352336 ) ) ( not ( = ?auto_352334 ?auto_352337 ) ) ( not ( = ?auto_352334 ?auto_352338 ) ) ( not ( = ?auto_352335 ?auto_352336 ) ) ( not ( = ?auto_352335 ?auto_352337 ) ) ( not ( = ?auto_352335 ?auto_352338 ) ) ( not ( = ?auto_352336 ?auto_352337 ) ) ( not ( = ?auto_352336 ?auto_352338 ) ) ( not ( = ?auto_352337 ?auto_352338 ) ) ( CLEAR ?auto_352335 ) ( ON ?auto_352336 ?auto_352337 ) ( CLEAR ?auto_352336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_352332 ?auto_352333 ?auto_352334 ?auto_352335 ?auto_352336 )
      ( MAKE-6PILE ?auto_352332 ?auto_352333 ?auto_352334 ?auto_352335 ?auto_352336 ?auto_352337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352358 - BLOCK
      ?auto_352359 - BLOCK
      ?auto_352360 - BLOCK
      ?auto_352361 - BLOCK
      ?auto_352362 - BLOCK
      ?auto_352363 - BLOCK
    )
    :vars
    (
      ?auto_352364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352363 ?auto_352364 ) ( ON-TABLE ?auto_352358 ) ( ON ?auto_352359 ?auto_352358 ) ( ON ?auto_352360 ?auto_352359 ) ( not ( = ?auto_352358 ?auto_352359 ) ) ( not ( = ?auto_352358 ?auto_352360 ) ) ( not ( = ?auto_352358 ?auto_352361 ) ) ( not ( = ?auto_352358 ?auto_352362 ) ) ( not ( = ?auto_352358 ?auto_352363 ) ) ( not ( = ?auto_352358 ?auto_352364 ) ) ( not ( = ?auto_352359 ?auto_352360 ) ) ( not ( = ?auto_352359 ?auto_352361 ) ) ( not ( = ?auto_352359 ?auto_352362 ) ) ( not ( = ?auto_352359 ?auto_352363 ) ) ( not ( = ?auto_352359 ?auto_352364 ) ) ( not ( = ?auto_352360 ?auto_352361 ) ) ( not ( = ?auto_352360 ?auto_352362 ) ) ( not ( = ?auto_352360 ?auto_352363 ) ) ( not ( = ?auto_352360 ?auto_352364 ) ) ( not ( = ?auto_352361 ?auto_352362 ) ) ( not ( = ?auto_352361 ?auto_352363 ) ) ( not ( = ?auto_352361 ?auto_352364 ) ) ( not ( = ?auto_352362 ?auto_352363 ) ) ( not ( = ?auto_352362 ?auto_352364 ) ) ( not ( = ?auto_352363 ?auto_352364 ) ) ( ON ?auto_352362 ?auto_352363 ) ( CLEAR ?auto_352360 ) ( ON ?auto_352361 ?auto_352362 ) ( CLEAR ?auto_352361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_352358 ?auto_352359 ?auto_352360 ?auto_352361 )
      ( MAKE-6PILE ?auto_352358 ?auto_352359 ?auto_352360 ?auto_352361 ?auto_352362 ?auto_352363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352384 - BLOCK
      ?auto_352385 - BLOCK
      ?auto_352386 - BLOCK
      ?auto_352387 - BLOCK
      ?auto_352388 - BLOCK
      ?auto_352389 - BLOCK
    )
    :vars
    (
      ?auto_352390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352389 ?auto_352390 ) ( ON-TABLE ?auto_352384 ) ( ON ?auto_352385 ?auto_352384 ) ( not ( = ?auto_352384 ?auto_352385 ) ) ( not ( = ?auto_352384 ?auto_352386 ) ) ( not ( = ?auto_352384 ?auto_352387 ) ) ( not ( = ?auto_352384 ?auto_352388 ) ) ( not ( = ?auto_352384 ?auto_352389 ) ) ( not ( = ?auto_352384 ?auto_352390 ) ) ( not ( = ?auto_352385 ?auto_352386 ) ) ( not ( = ?auto_352385 ?auto_352387 ) ) ( not ( = ?auto_352385 ?auto_352388 ) ) ( not ( = ?auto_352385 ?auto_352389 ) ) ( not ( = ?auto_352385 ?auto_352390 ) ) ( not ( = ?auto_352386 ?auto_352387 ) ) ( not ( = ?auto_352386 ?auto_352388 ) ) ( not ( = ?auto_352386 ?auto_352389 ) ) ( not ( = ?auto_352386 ?auto_352390 ) ) ( not ( = ?auto_352387 ?auto_352388 ) ) ( not ( = ?auto_352387 ?auto_352389 ) ) ( not ( = ?auto_352387 ?auto_352390 ) ) ( not ( = ?auto_352388 ?auto_352389 ) ) ( not ( = ?auto_352388 ?auto_352390 ) ) ( not ( = ?auto_352389 ?auto_352390 ) ) ( ON ?auto_352388 ?auto_352389 ) ( ON ?auto_352387 ?auto_352388 ) ( CLEAR ?auto_352385 ) ( ON ?auto_352386 ?auto_352387 ) ( CLEAR ?auto_352386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_352384 ?auto_352385 ?auto_352386 )
      ( MAKE-6PILE ?auto_352384 ?auto_352385 ?auto_352386 ?auto_352387 ?auto_352388 ?auto_352389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352410 - BLOCK
      ?auto_352411 - BLOCK
      ?auto_352412 - BLOCK
      ?auto_352413 - BLOCK
      ?auto_352414 - BLOCK
      ?auto_352415 - BLOCK
    )
    :vars
    (
      ?auto_352416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352415 ?auto_352416 ) ( ON-TABLE ?auto_352410 ) ( not ( = ?auto_352410 ?auto_352411 ) ) ( not ( = ?auto_352410 ?auto_352412 ) ) ( not ( = ?auto_352410 ?auto_352413 ) ) ( not ( = ?auto_352410 ?auto_352414 ) ) ( not ( = ?auto_352410 ?auto_352415 ) ) ( not ( = ?auto_352410 ?auto_352416 ) ) ( not ( = ?auto_352411 ?auto_352412 ) ) ( not ( = ?auto_352411 ?auto_352413 ) ) ( not ( = ?auto_352411 ?auto_352414 ) ) ( not ( = ?auto_352411 ?auto_352415 ) ) ( not ( = ?auto_352411 ?auto_352416 ) ) ( not ( = ?auto_352412 ?auto_352413 ) ) ( not ( = ?auto_352412 ?auto_352414 ) ) ( not ( = ?auto_352412 ?auto_352415 ) ) ( not ( = ?auto_352412 ?auto_352416 ) ) ( not ( = ?auto_352413 ?auto_352414 ) ) ( not ( = ?auto_352413 ?auto_352415 ) ) ( not ( = ?auto_352413 ?auto_352416 ) ) ( not ( = ?auto_352414 ?auto_352415 ) ) ( not ( = ?auto_352414 ?auto_352416 ) ) ( not ( = ?auto_352415 ?auto_352416 ) ) ( ON ?auto_352414 ?auto_352415 ) ( ON ?auto_352413 ?auto_352414 ) ( ON ?auto_352412 ?auto_352413 ) ( CLEAR ?auto_352410 ) ( ON ?auto_352411 ?auto_352412 ) ( CLEAR ?auto_352411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352410 ?auto_352411 )
      ( MAKE-6PILE ?auto_352410 ?auto_352411 ?auto_352412 ?auto_352413 ?auto_352414 ?auto_352415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_352436 - BLOCK
      ?auto_352437 - BLOCK
      ?auto_352438 - BLOCK
      ?auto_352439 - BLOCK
      ?auto_352440 - BLOCK
      ?auto_352441 - BLOCK
    )
    :vars
    (
      ?auto_352442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352441 ?auto_352442 ) ( not ( = ?auto_352436 ?auto_352437 ) ) ( not ( = ?auto_352436 ?auto_352438 ) ) ( not ( = ?auto_352436 ?auto_352439 ) ) ( not ( = ?auto_352436 ?auto_352440 ) ) ( not ( = ?auto_352436 ?auto_352441 ) ) ( not ( = ?auto_352436 ?auto_352442 ) ) ( not ( = ?auto_352437 ?auto_352438 ) ) ( not ( = ?auto_352437 ?auto_352439 ) ) ( not ( = ?auto_352437 ?auto_352440 ) ) ( not ( = ?auto_352437 ?auto_352441 ) ) ( not ( = ?auto_352437 ?auto_352442 ) ) ( not ( = ?auto_352438 ?auto_352439 ) ) ( not ( = ?auto_352438 ?auto_352440 ) ) ( not ( = ?auto_352438 ?auto_352441 ) ) ( not ( = ?auto_352438 ?auto_352442 ) ) ( not ( = ?auto_352439 ?auto_352440 ) ) ( not ( = ?auto_352439 ?auto_352441 ) ) ( not ( = ?auto_352439 ?auto_352442 ) ) ( not ( = ?auto_352440 ?auto_352441 ) ) ( not ( = ?auto_352440 ?auto_352442 ) ) ( not ( = ?auto_352441 ?auto_352442 ) ) ( ON ?auto_352440 ?auto_352441 ) ( ON ?auto_352439 ?auto_352440 ) ( ON ?auto_352438 ?auto_352439 ) ( ON ?auto_352437 ?auto_352438 ) ( ON ?auto_352436 ?auto_352437 ) ( CLEAR ?auto_352436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352436 )
      ( MAKE-6PILE ?auto_352436 ?auto_352437 ?auto_352438 ?auto_352439 ?auto_352440 ?auto_352441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352463 - BLOCK
      ?auto_352464 - BLOCK
      ?auto_352465 - BLOCK
      ?auto_352466 - BLOCK
      ?auto_352467 - BLOCK
      ?auto_352468 - BLOCK
      ?auto_352469 - BLOCK
    )
    :vars
    (
      ?auto_352470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352468 ) ( ON ?auto_352469 ?auto_352470 ) ( CLEAR ?auto_352469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352463 ) ( ON ?auto_352464 ?auto_352463 ) ( ON ?auto_352465 ?auto_352464 ) ( ON ?auto_352466 ?auto_352465 ) ( ON ?auto_352467 ?auto_352466 ) ( ON ?auto_352468 ?auto_352467 ) ( not ( = ?auto_352463 ?auto_352464 ) ) ( not ( = ?auto_352463 ?auto_352465 ) ) ( not ( = ?auto_352463 ?auto_352466 ) ) ( not ( = ?auto_352463 ?auto_352467 ) ) ( not ( = ?auto_352463 ?auto_352468 ) ) ( not ( = ?auto_352463 ?auto_352469 ) ) ( not ( = ?auto_352463 ?auto_352470 ) ) ( not ( = ?auto_352464 ?auto_352465 ) ) ( not ( = ?auto_352464 ?auto_352466 ) ) ( not ( = ?auto_352464 ?auto_352467 ) ) ( not ( = ?auto_352464 ?auto_352468 ) ) ( not ( = ?auto_352464 ?auto_352469 ) ) ( not ( = ?auto_352464 ?auto_352470 ) ) ( not ( = ?auto_352465 ?auto_352466 ) ) ( not ( = ?auto_352465 ?auto_352467 ) ) ( not ( = ?auto_352465 ?auto_352468 ) ) ( not ( = ?auto_352465 ?auto_352469 ) ) ( not ( = ?auto_352465 ?auto_352470 ) ) ( not ( = ?auto_352466 ?auto_352467 ) ) ( not ( = ?auto_352466 ?auto_352468 ) ) ( not ( = ?auto_352466 ?auto_352469 ) ) ( not ( = ?auto_352466 ?auto_352470 ) ) ( not ( = ?auto_352467 ?auto_352468 ) ) ( not ( = ?auto_352467 ?auto_352469 ) ) ( not ( = ?auto_352467 ?auto_352470 ) ) ( not ( = ?auto_352468 ?auto_352469 ) ) ( not ( = ?auto_352468 ?auto_352470 ) ) ( not ( = ?auto_352469 ?auto_352470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352469 ?auto_352470 )
      ( !STACK ?auto_352469 ?auto_352468 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352493 - BLOCK
      ?auto_352494 - BLOCK
      ?auto_352495 - BLOCK
      ?auto_352496 - BLOCK
      ?auto_352497 - BLOCK
      ?auto_352498 - BLOCK
      ?auto_352499 - BLOCK
    )
    :vars
    (
      ?auto_352500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352499 ?auto_352500 ) ( ON-TABLE ?auto_352493 ) ( ON ?auto_352494 ?auto_352493 ) ( ON ?auto_352495 ?auto_352494 ) ( ON ?auto_352496 ?auto_352495 ) ( ON ?auto_352497 ?auto_352496 ) ( not ( = ?auto_352493 ?auto_352494 ) ) ( not ( = ?auto_352493 ?auto_352495 ) ) ( not ( = ?auto_352493 ?auto_352496 ) ) ( not ( = ?auto_352493 ?auto_352497 ) ) ( not ( = ?auto_352493 ?auto_352498 ) ) ( not ( = ?auto_352493 ?auto_352499 ) ) ( not ( = ?auto_352493 ?auto_352500 ) ) ( not ( = ?auto_352494 ?auto_352495 ) ) ( not ( = ?auto_352494 ?auto_352496 ) ) ( not ( = ?auto_352494 ?auto_352497 ) ) ( not ( = ?auto_352494 ?auto_352498 ) ) ( not ( = ?auto_352494 ?auto_352499 ) ) ( not ( = ?auto_352494 ?auto_352500 ) ) ( not ( = ?auto_352495 ?auto_352496 ) ) ( not ( = ?auto_352495 ?auto_352497 ) ) ( not ( = ?auto_352495 ?auto_352498 ) ) ( not ( = ?auto_352495 ?auto_352499 ) ) ( not ( = ?auto_352495 ?auto_352500 ) ) ( not ( = ?auto_352496 ?auto_352497 ) ) ( not ( = ?auto_352496 ?auto_352498 ) ) ( not ( = ?auto_352496 ?auto_352499 ) ) ( not ( = ?auto_352496 ?auto_352500 ) ) ( not ( = ?auto_352497 ?auto_352498 ) ) ( not ( = ?auto_352497 ?auto_352499 ) ) ( not ( = ?auto_352497 ?auto_352500 ) ) ( not ( = ?auto_352498 ?auto_352499 ) ) ( not ( = ?auto_352498 ?auto_352500 ) ) ( not ( = ?auto_352499 ?auto_352500 ) ) ( CLEAR ?auto_352497 ) ( ON ?auto_352498 ?auto_352499 ) ( CLEAR ?auto_352498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_352493 ?auto_352494 ?auto_352495 ?auto_352496 ?auto_352497 ?auto_352498 )
      ( MAKE-7PILE ?auto_352493 ?auto_352494 ?auto_352495 ?auto_352496 ?auto_352497 ?auto_352498 ?auto_352499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352523 - BLOCK
      ?auto_352524 - BLOCK
      ?auto_352525 - BLOCK
      ?auto_352526 - BLOCK
      ?auto_352527 - BLOCK
      ?auto_352528 - BLOCK
      ?auto_352529 - BLOCK
    )
    :vars
    (
      ?auto_352530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352529 ?auto_352530 ) ( ON-TABLE ?auto_352523 ) ( ON ?auto_352524 ?auto_352523 ) ( ON ?auto_352525 ?auto_352524 ) ( ON ?auto_352526 ?auto_352525 ) ( not ( = ?auto_352523 ?auto_352524 ) ) ( not ( = ?auto_352523 ?auto_352525 ) ) ( not ( = ?auto_352523 ?auto_352526 ) ) ( not ( = ?auto_352523 ?auto_352527 ) ) ( not ( = ?auto_352523 ?auto_352528 ) ) ( not ( = ?auto_352523 ?auto_352529 ) ) ( not ( = ?auto_352523 ?auto_352530 ) ) ( not ( = ?auto_352524 ?auto_352525 ) ) ( not ( = ?auto_352524 ?auto_352526 ) ) ( not ( = ?auto_352524 ?auto_352527 ) ) ( not ( = ?auto_352524 ?auto_352528 ) ) ( not ( = ?auto_352524 ?auto_352529 ) ) ( not ( = ?auto_352524 ?auto_352530 ) ) ( not ( = ?auto_352525 ?auto_352526 ) ) ( not ( = ?auto_352525 ?auto_352527 ) ) ( not ( = ?auto_352525 ?auto_352528 ) ) ( not ( = ?auto_352525 ?auto_352529 ) ) ( not ( = ?auto_352525 ?auto_352530 ) ) ( not ( = ?auto_352526 ?auto_352527 ) ) ( not ( = ?auto_352526 ?auto_352528 ) ) ( not ( = ?auto_352526 ?auto_352529 ) ) ( not ( = ?auto_352526 ?auto_352530 ) ) ( not ( = ?auto_352527 ?auto_352528 ) ) ( not ( = ?auto_352527 ?auto_352529 ) ) ( not ( = ?auto_352527 ?auto_352530 ) ) ( not ( = ?auto_352528 ?auto_352529 ) ) ( not ( = ?auto_352528 ?auto_352530 ) ) ( not ( = ?auto_352529 ?auto_352530 ) ) ( ON ?auto_352528 ?auto_352529 ) ( CLEAR ?auto_352526 ) ( ON ?auto_352527 ?auto_352528 ) ( CLEAR ?auto_352527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_352523 ?auto_352524 ?auto_352525 ?auto_352526 ?auto_352527 )
      ( MAKE-7PILE ?auto_352523 ?auto_352524 ?auto_352525 ?auto_352526 ?auto_352527 ?auto_352528 ?auto_352529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352553 - BLOCK
      ?auto_352554 - BLOCK
      ?auto_352555 - BLOCK
      ?auto_352556 - BLOCK
      ?auto_352557 - BLOCK
      ?auto_352558 - BLOCK
      ?auto_352559 - BLOCK
    )
    :vars
    (
      ?auto_352560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352559 ?auto_352560 ) ( ON-TABLE ?auto_352553 ) ( ON ?auto_352554 ?auto_352553 ) ( ON ?auto_352555 ?auto_352554 ) ( not ( = ?auto_352553 ?auto_352554 ) ) ( not ( = ?auto_352553 ?auto_352555 ) ) ( not ( = ?auto_352553 ?auto_352556 ) ) ( not ( = ?auto_352553 ?auto_352557 ) ) ( not ( = ?auto_352553 ?auto_352558 ) ) ( not ( = ?auto_352553 ?auto_352559 ) ) ( not ( = ?auto_352553 ?auto_352560 ) ) ( not ( = ?auto_352554 ?auto_352555 ) ) ( not ( = ?auto_352554 ?auto_352556 ) ) ( not ( = ?auto_352554 ?auto_352557 ) ) ( not ( = ?auto_352554 ?auto_352558 ) ) ( not ( = ?auto_352554 ?auto_352559 ) ) ( not ( = ?auto_352554 ?auto_352560 ) ) ( not ( = ?auto_352555 ?auto_352556 ) ) ( not ( = ?auto_352555 ?auto_352557 ) ) ( not ( = ?auto_352555 ?auto_352558 ) ) ( not ( = ?auto_352555 ?auto_352559 ) ) ( not ( = ?auto_352555 ?auto_352560 ) ) ( not ( = ?auto_352556 ?auto_352557 ) ) ( not ( = ?auto_352556 ?auto_352558 ) ) ( not ( = ?auto_352556 ?auto_352559 ) ) ( not ( = ?auto_352556 ?auto_352560 ) ) ( not ( = ?auto_352557 ?auto_352558 ) ) ( not ( = ?auto_352557 ?auto_352559 ) ) ( not ( = ?auto_352557 ?auto_352560 ) ) ( not ( = ?auto_352558 ?auto_352559 ) ) ( not ( = ?auto_352558 ?auto_352560 ) ) ( not ( = ?auto_352559 ?auto_352560 ) ) ( ON ?auto_352558 ?auto_352559 ) ( ON ?auto_352557 ?auto_352558 ) ( CLEAR ?auto_352555 ) ( ON ?auto_352556 ?auto_352557 ) ( CLEAR ?auto_352556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_352553 ?auto_352554 ?auto_352555 ?auto_352556 )
      ( MAKE-7PILE ?auto_352553 ?auto_352554 ?auto_352555 ?auto_352556 ?auto_352557 ?auto_352558 ?auto_352559 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352583 - BLOCK
      ?auto_352584 - BLOCK
      ?auto_352585 - BLOCK
      ?auto_352586 - BLOCK
      ?auto_352587 - BLOCK
      ?auto_352588 - BLOCK
      ?auto_352589 - BLOCK
    )
    :vars
    (
      ?auto_352590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352589 ?auto_352590 ) ( ON-TABLE ?auto_352583 ) ( ON ?auto_352584 ?auto_352583 ) ( not ( = ?auto_352583 ?auto_352584 ) ) ( not ( = ?auto_352583 ?auto_352585 ) ) ( not ( = ?auto_352583 ?auto_352586 ) ) ( not ( = ?auto_352583 ?auto_352587 ) ) ( not ( = ?auto_352583 ?auto_352588 ) ) ( not ( = ?auto_352583 ?auto_352589 ) ) ( not ( = ?auto_352583 ?auto_352590 ) ) ( not ( = ?auto_352584 ?auto_352585 ) ) ( not ( = ?auto_352584 ?auto_352586 ) ) ( not ( = ?auto_352584 ?auto_352587 ) ) ( not ( = ?auto_352584 ?auto_352588 ) ) ( not ( = ?auto_352584 ?auto_352589 ) ) ( not ( = ?auto_352584 ?auto_352590 ) ) ( not ( = ?auto_352585 ?auto_352586 ) ) ( not ( = ?auto_352585 ?auto_352587 ) ) ( not ( = ?auto_352585 ?auto_352588 ) ) ( not ( = ?auto_352585 ?auto_352589 ) ) ( not ( = ?auto_352585 ?auto_352590 ) ) ( not ( = ?auto_352586 ?auto_352587 ) ) ( not ( = ?auto_352586 ?auto_352588 ) ) ( not ( = ?auto_352586 ?auto_352589 ) ) ( not ( = ?auto_352586 ?auto_352590 ) ) ( not ( = ?auto_352587 ?auto_352588 ) ) ( not ( = ?auto_352587 ?auto_352589 ) ) ( not ( = ?auto_352587 ?auto_352590 ) ) ( not ( = ?auto_352588 ?auto_352589 ) ) ( not ( = ?auto_352588 ?auto_352590 ) ) ( not ( = ?auto_352589 ?auto_352590 ) ) ( ON ?auto_352588 ?auto_352589 ) ( ON ?auto_352587 ?auto_352588 ) ( ON ?auto_352586 ?auto_352587 ) ( CLEAR ?auto_352584 ) ( ON ?auto_352585 ?auto_352586 ) ( CLEAR ?auto_352585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_352583 ?auto_352584 ?auto_352585 )
      ( MAKE-7PILE ?auto_352583 ?auto_352584 ?auto_352585 ?auto_352586 ?auto_352587 ?auto_352588 ?auto_352589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352613 - BLOCK
      ?auto_352614 - BLOCK
      ?auto_352615 - BLOCK
      ?auto_352616 - BLOCK
      ?auto_352617 - BLOCK
      ?auto_352618 - BLOCK
      ?auto_352619 - BLOCK
    )
    :vars
    (
      ?auto_352620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352619 ?auto_352620 ) ( ON-TABLE ?auto_352613 ) ( not ( = ?auto_352613 ?auto_352614 ) ) ( not ( = ?auto_352613 ?auto_352615 ) ) ( not ( = ?auto_352613 ?auto_352616 ) ) ( not ( = ?auto_352613 ?auto_352617 ) ) ( not ( = ?auto_352613 ?auto_352618 ) ) ( not ( = ?auto_352613 ?auto_352619 ) ) ( not ( = ?auto_352613 ?auto_352620 ) ) ( not ( = ?auto_352614 ?auto_352615 ) ) ( not ( = ?auto_352614 ?auto_352616 ) ) ( not ( = ?auto_352614 ?auto_352617 ) ) ( not ( = ?auto_352614 ?auto_352618 ) ) ( not ( = ?auto_352614 ?auto_352619 ) ) ( not ( = ?auto_352614 ?auto_352620 ) ) ( not ( = ?auto_352615 ?auto_352616 ) ) ( not ( = ?auto_352615 ?auto_352617 ) ) ( not ( = ?auto_352615 ?auto_352618 ) ) ( not ( = ?auto_352615 ?auto_352619 ) ) ( not ( = ?auto_352615 ?auto_352620 ) ) ( not ( = ?auto_352616 ?auto_352617 ) ) ( not ( = ?auto_352616 ?auto_352618 ) ) ( not ( = ?auto_352616 ?auto_352619 ) ) ( not ( = ?auto_352616 ?auto_352620 ) ) ( not ( = ?auto_352617 ?auto_352618 ) ) ( not ( = ?auto_352617 ?auto_352619 ) ) ( not ( = ?auto_352617 ?auto_352620 ) ) ( not ( = ?auto_352618 ?auto_352619 ) ) ( not ( = ?auto_352618 ?auto_352620 ) ) ( not ( = ?auto_352619 ?auto_352620 ) ) ( ON ?auto_352618 ?auto_352619 ) ( ON ?auto_352617 ?auto_352618 ) ( ON ?auto_352616 ?auto_352617 ) ( ON ?auto_352615 ?auto_352616 ) ( CLEAR ?auto_352613 ) ( ON ?auto_352614 ?auto_352615 ) ( CLEAR ?auto_352614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352613 ?auto_352614 )
      ( MAKE-7PILE ?auto_352613 ?auto_352614 ?auto_352615 ?auto_352616 ?auto_352617 ?auto_352618 ?auto_352619 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_352643 - BLOCK
      ?auto_352644 - BLOCK
      ?auto_352645 - BLOCK
      ?auto_352646 - BLOCK
      ?auto_352647 - BLOCK
      ?auto_352648 - BLOCK
      ?auto_352649 - BLOCK
    )
    :vars
    (
      ?auto_352650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352649 ?auto_352650 ) ( not ( = ?auto_352643 ?auto_352644 ) ) ( not ( = ?auto_352643 ?auto_352645 ) ) ( not ( = ?auto_352643 ?auto_352646 ) ) ( not ( = ?auto_352643 ?auto_352647 ) ) ( not ( = ?auto_352643 ?auto_352648 ) ) ( not ( = ?auto_352643 ?auto_352649 ) ) ( not ( = ?auto_352643 ?auto_352650 ) ) ( not ( = ?auto_352644 ?auto_352645 ) ) ( not ( = ?auto_352644 ?auto_352646 ) ) ( not ( = ?auto_352644 ?auto_352647 ) ) ( not ( = ?auto_352644 ?auto_352648 ) ) ( not ( = ?auto_352644 ?auto_352649 ) ) ( not ( = ?auto_352644 ?auto_352650 ) ) ( not ( = ?auto_352645 ?auto_352646 ) ) ( not ( = ?auto_352645 ?auto_352647 ) ) ( not ( = ?auto_352645 ?auto_352648 ) ) ( not ( = ?auto_352645 ?auto_352649 ) ) ( not ( = ?auto_352645 ?auto_352650 ) ) ( not ( = ?auto_352646 ?auto_352647 ) ) ( not ( = ?auto_352646 ?auto_352648 ) ) ( not ( = ?auto_352646 ?auto_352649 ) ) ( not ( = ?auto_352646 ?auto_352650 ) ) ( not ( = ?auto_352647 ?auto_352648 ) ) ( not ( = ?auto_352647 ?auto_352649 ) ) ( not ( = ?auto_352647 ?auto_352650 ) ) ( not ( = ?auto_352648 ?auto_352649 ) ) ( not ( = ?auto_352648 ?auto_352650 ) ) ( not ( = ?auto_352649 ?auto_352650 ) ) ( ON ?auto_352648 ?auto_352649 ) ( ON ?auto_352647 ?auto_352648 ) ( ON ?auto_352646 ?auto_352647 ) ( ON ?auto_352645 ?auto_352646 ) ( ON ?auto_352644 ?auto_352645 ) ( ON ?auto_352643 ?auto_352644 ) ( CLEAR ?auto_352643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352643 )
      ( MAKE-7PILE ?auto_352643 ?auto_352644 ?auto_352645 ?auto_352646 ?auto_352647 ?auto_352648 ?auto_352649 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352674 - BLOCK
      ?auto_352675 - BLOCK
      ?auto_352676 - BLOCK
      ?auto_352677 - BLOCK
      ?auto_352678 - BLOCK
      ?auto_352679 - BLOCK
      ?auto_352680 - BLOCK
      ?auto_352681 - BLOCK
    )
    :vars
    (
      ?auto_352682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352680 ) ( ON ?auto_352681 ?auto_352682 ) ( CLEAR ?auto_352681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352674 ) ( ON ?auto_352675 ?auto_352674 ) ( ON ?auto_352676 ?auto_352675 ) ( ON ?auto_352677 ?auto_352676 ) ( ON ?auto_352678 ?auto_352677 ) ( ON ?auto_352679 ?auto_352678 ) ( ON ?auto_352680 ?auto_352679 ) ( not ( = ?auto_352674 ?auto_352675 ) ) ( not ( = ?auto_352674 ?auto_352676 ) ) ( not ( = ?auto_352674 ?auto_352677 ) ) ( not ( = ?auto_352674 ?auto_352678 ) ) ( not ( = ?auto_352674 ?auto_352679 ) ) ( not ( = ?auto_352674 ?auto_352680 ) ) ( not ( = ?auto_352674 ?auto_352681 ) ) ( not ( = ?auto_352674 ?auto_352682 ) ) ( not ( = ?auto_352675 ?auto_352676 ) ) ( not ( = ?auto_352675 ?auto_352677 ) ) ( not ( = ?auto_352675 ?auto_352678 ) ) ( not ( = ?auto_352675 ?auto_352679 ) ) ( not ( = ?auto_352675 ?auto_352680 ) ) ( not ( = ?auto_352675 ?auto_352681 ) ) ( not ( = ?auto_352675 ?auto_352682 ) ) ( not ( = ?auto_352676 ?auto_352677 ) ) ( not ( = ?auto_352676 ?auto_352678 ) ) ( not ( = ?auto_352676 ?auto_352679 ) ) ( not ( = ?auto_352676 ?auto_352680 ) ) ( not ( = ?auto_352676 ?auto_352681 ) ) ( not ( = ?auto_352676 ?auto_352682 ) ) ( not ( = ?auto_352677 ?auto_352678 ) ) ( not ( = ?auto_352677 ?auto_352679 ) ) ( not ( = ?auto_352677 ?auto_352680 ) ) ( not ( = ?auto_352677 ?auto_352681 ) ) ( not ( = ?auto_352677 ?auto_352682 ) ) ( not ( = ?auto_352678 ?auto_352679 ) ) ( not ( = ?auto_352678 ?auto_352680 ) ) ( not ( = ?auto_352678 ?auto_352681 ) ) ( not ( = ?auto_352678 ?auto_352682 ) ) ( not ( = ?auto_352679 ?auto_352680 ) ) ( not ( = ?auto_352679 ?auto_352681 ) ) ( not ( = ?auto_352679 ?auto_352682 ) ) ( not ( = ?auto_352680 ?auto_352681 ) ) ( not ( = ?auto_352680 ?auto_352682 ) ) ( not ( = ?auto_352681 ?auto_352682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352681 ?auto_352682 )
      ( !STACK ?auto_352681 ?auto_352680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352708 - BLOCK
      ?auto_352709 - BLOCK
      ?auto_352710 - BLOCK
      ?auto_352711 - BLOCK
      ?auto_352712 - BLOCK
      ?auto_352713 - BLOCK
      ?auto_352714 - BLOCK
      ?auto_352715 - BLOCK
    )
    :vars
    (
      ?auto_352716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352715 ?auto_352716 ) ( ON-TABLE ?auto_352708 ) ( ON ?auto_352709 ?auto_352708 ) ( ON ?auto_352710 ?auto_352709 ) ( ON ?auto_352711 ?auto_352710 ) ( ON ?auto_352712 ?auto_352711 ) ( ON ?auto_352713 ?auto_352712 ) ( not ( = ?auto_352708 ?auto_352709 ) ) ( not ( = ?auto_352708 ?auto_352710 ) ) ( not ( = ?auto_352708 ?auto_352711 ) ) ( not ( = ?auto_352708 ?auto_352712 ) ) ( not ( = ?auto_352708 ?auto_352713 ) ) ( not ( = ?auto_352708 ?auto_352714 ) ) ( not ( = ?auto_352708 ?auto_352715 ) ) ( not ( = ?auto_352708 ?auto_352716 ) ) ( not ( = ?auto_352709 ?auto_352710 ) ) ( not ( = ?auto_352709 ?auto_352711 ) ) ( not ( = ?auto_352709 ?auto_352712 ) ) ( not ( = ?auto_352709 ?auto_352713 ) ) ( not ( = ?auto_352709 ?auto_352714 ) ) ( not ( = ?auto_352709 ?auto_352715 ) ) ( not ( = ?auto_352709 ?auto_352716 ) ) ( not ( = ?auto_352710 ?auto_352711 ) ) ( not ( = ?auto_352710 ?auto_352712 ) ) ( not ( = ?auto_352710 ?auto_352713 ) ) ( not ( = ?auto_352710 ?auto_352714 ) ) ( not ( = ?auto_352710 ?auto_352715 ) ) ( not ( = ?auto_352710 ?auto_352716 ) ) ( not ( = ?auto_352711 ?auto_352712 ) ) ( not ( = ?auto_352711 ?auto_352713 ) ) ( not ( = ?auto_352711 ?auto_352714 ) ) ( not ( = ?auto_352711 ?auto_352715 ) ) ( not ( = ?auto_352711 ?auto_352716 ) ) ( not ( = ?auto_352712 ?auto_352713 ) ) ( not ( = ?auto_352712 ?auto_352714 ) ) ( not ( = ?auto_352712 ?auto_352715 ) ) ( not ( = ?auto_352712 ?auto_352716 ) ) ( not ( = ?auto_352713 ?auto_352714 ) ) ( not ( = ?auto_352713 ?auto_352715 ) ) ( not ( = ?auto_352713 ?auto_352716 ) ) ( not ( = ?auto_352714 ?auto_352715 ) ) ( not ( = ?auto_352714 ?auto_352716 ) ) ( not ( = ?auto_352715 ?auto_352716 ) ) ( CLEAR ?auto_352713 ) ( ON ?auto_352714 ?auto_352715 ) ( CLEAR ?auto_352714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_352708 ?auto_352709 ?auto_352710 ?auto_352711 ?auto_352712 ?auto_352713 ?auto_352714 )
      ( MAKE-8PILE ?auto_352708 ?auto_352709 ?auto_352710 ?auto_352711 ?auto_352712 ?auto_352713 ?auto_352714 ?auto_352715 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352742 - BLOCK
      ?auto_352743 - BLOCK
      ?auto_352744 - BLOCK
      ?auto_352745 - BLOCK
      ?auto_352746 - BLOCK
      ?auto_352747 - BLOCK
      ?auto_352748 - BLOCK
      ?auto_352749 - BLOCK
    )
    :vars
    (
      ?auto_352750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352749 ?auto_352750 ) ( ON-TABLE ?auto_352742 ) ( ON ?auto_352743 ?auto_352742 ) ( ON ?auto_352744 ?auto_352743 ) ( ON ?auto_352745 ?auto_352744 ) ( ON ?auto_352746 ?auto_352745 ) ( not ( = ?auto_352742 ?auto_352743 ) ) ( not ( = ?auto_352742 ?auto_352744 ) ) ( not ( = ?auto_352742 ?auto_352745 ) ) ( not ( = ?auto_352742 ?auto_352746 ) ) ( not ( = ?auto_352742 ?auto_352747 ) ) ( not ( = ?auto_352742 ?auto_352748 ) ) ( not ( = ?auto_352742 ?auto_352749 ) ) ( not ( = ?auto_352742 ?auto_352750 ) ) ( not ( = ?auto_352743 ?auto_352744 ) ) ( not ( = ?auto_352743 ?auto_352745 ) ) ( not ( = ?auto_352743 ?auto_352746 ) ) ( not ( = ?auto_352743 ?auto_352747 ) ) ( not ( = ?auto_352743 ?auto_352748 ) ) ( not ( = ?auto_352743 ?auto_352749 ) ) ( not ( = ?auto_352743 ?auto_352750 ) ) ( not ( = ?auto_352744 ?auto_352745 ) ) ( not ( = ?auto_352744 ?auto_352746 ) ) ( not ( = ?auto_352744 ?auto_352747 ) ) ( not ( = ?auto_352744 ?auto_352748 ) ) ( not ( = ?auto_352744 ?auto_352749 ) ) ( not ( = ?auto_352744 ?auto_352750 ) ) ( not ( = ?auto_352745 ?auto_352746 ) ) ( not ( = ?auto_352745 ?auto_352747 ) ) ( not ( = ?auto_352745 ?auto_352748 ) ) ( not ( = ?auto_352745 ?auto_352749 ) ) ( not ( = ?auto_352745 ?auto_352750 ) ) ( not ( = ?auto_352746 ?auto_352747 ) ) ( not ( = ?auto_352746 ?auto_352748 ) ) ( not ( = ?auto_352746 ?auto_352749 ) ) ( not ( = ?auto_352746 ?auto_352750 ) ) ( not ( = ?auto_352747 ?auto_352748 ) ) ( not ( = ?auto_352747 ?auto_352749 ) ) ( not ( = ?auto_352747 ?auto_352750 ) ) ( not ( = ?auto_352748 ?auto_352749 ) ) ( not ( = ?auto_352748 ?auto_352750 ) ) ( not ( = ?auto_352749 ?auto_352750 ) ) ( ON ?auto_352748 ?auto_352749 ) ( CLEAR ?auto_352746 ) ( ON ?auto_352747 ?auto_352748 ) ( CLEAR ?auto_352747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_352742 ?auto_352743 ?auto_352744 ?auto_352745 ?auto_352746 ?auto_352747 )
      ( MAKE-8PILE ?auto_352742 ?auto_352743 ?auto_352744 ?auto_352745 ?auto_352746 ?auto_352747 ?auto_352748 ?auto_352749 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352776 - BLOCK
      ?auto_352777 - BLOCK
      ?auto_352778 - BLOCK
      ?auto_352779 - BLOCK
      ?auto_352780 - BLOCK
      ?auto_352781 - BLOCK
      ?auto_352782 - BLOCK
      ?auto_352783 - BLOCK
    )
    :vars
    (
      ?auto_352784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352783 ?auto_352784 ) ( ON-TABLE ?auto_352776 ) ( ON ?auto_352777 ?auto_352776 ) ( ON ?auto_352778 ?auto_352777 ) ( ON ?auto_352779 ?auto_352778 ) ( not ( = ?auto_352776 ?auto_352777 ) ) ( not ( = ?auto_352776 ?auto_352778 ) ) ( not ( = ?auto_352776 ?auto_352779 ) ) ( not ( = ?auto_352776 ?auto_352780 ) ) ( not ( = ?auto_352776 ?auto_352781 ) ) ( not ( = ?auto_352776 ?auto_352782 ) ) ( not ( = ?auto_352776 ?auto_352783 ) ) ( not ( = ?auto_352776 ?auto_352784 ) ) ( not ( = ?auto_352777 ?auto_352778 ) ) ( not ( = ?auto_352777 ?auto_352779 ) ) ( not ( = ?auto_352777 ?auto_352780 ) ) ( not ( = ?auto_352777 ?auto_352781 ) ) ( not ( = ?auto_352777 ?auto_352782 ) ) ( not ( = ?auto_352777 ?auto_352783 ) ) ( not ( = ?auto_352777 ?auto_352784 ) ) ( not ( = ?auto_352778 ?auto_352779 ) ) ( not ( = ?auto_352778 ?auto_352780 ) ) ( not ( = ?auto_352778 ?auto_352781 ) ) ( not ( = ?auto_352778 ?auto_352782 ) ) ( not ( = ?auto_352778 ?auto_352783 ) ) ( not ( = ?auto_352778 ?auto_352784 ) ) ( not ( = ?auto_352779 ?auto_352780 ) ) ( not ( = ?auto_352779 ?auto_352781 ) ) ( not ( = ?auto_352779 ?auto_352782 ) ) ( not ( = ?auto_352779 ?auto_352783 ) ) ( not ( = ?auto_352779 ?auto_352784 ) ) ( not ( = ?auto_352780 ?auto_352781 ) ) ( not ( = ?auto_352780 ?auto_352782 ) ) ( not ( = ?auto_352780 ?auto_352783 ) ) ( not ( = ?auto_352780 ?auto_352784 ) ) ( not ( = ?auto_352781 ?auto_352782 ) ) ( not ( = ?auto_352781 ?auto_352783 ) ) ( not ( = ?auto_352781 ?auto_352784 ) ) ( not ( = ?auto_352782 ?auto_352783 ) ) ( not ( = ?auto_352782 ?auto_352784 ) ) ( not ( = ?auto_352783 ?auto_352784 ) ) ( ON ?auto_352782 ?auto_352783 ) ( ON ?auto_352781 ?auto_352782 ) ( CLEAR ?auto_352779 ) ( ON ?auto_352780 ?auto_352781 ) ( CLEAR ?auto_352780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_352776 ?auto_352777 ?auto_352778 ?auto_352779 ?auto_352780 )
      ( MAKE-8PILE ?auto_352776 ?auto_352777 ?auto_352778 ?auto_352779 ?auto_352780 ?auto_352781 ?auto_352782 ?auto_352783 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352810 - BLOCK
      ?auto_352811 - BLOCK
      ?auto_352812 - BLOCK
      ?auto_352813 - BLOCK
      ?auto_352814 - BLOCK
      ?auto_352815 - BLOCK
      ?auto_352816 - BLOCK
      ?auto_352817 - BLOCK
    )
    :vars
    (
      ?auto_352818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352817 ?auto_352818 ) ( ON-TABLE ?auto_352810 ) ( ON ?auto_352811 ?auto_352810 ) ( ON ?auto_352812 ?auto_352811 ) ( not ( = ?auto_352810 ?auto_352811 ) ) ( not ( = ?auto_352810 ?auto_352812 ) ) ( not ( = ?auto_352810 ?auto_352813 ) ) ( not ( = ?auto_352810 ?auto_352814 ) ) ( not ( = ?auto_352810 ?auto_352815 ) ) ( not ( = ?auto_352810 ?auto_352816 ) ) ( not ( = ?auto_352810 ?auto_352817 ) ) ( not ( = ?auto_352810 ?auto_352818 ) ) ( not ( = ?auto_352811 ?auto_352812 ) ) ( not ( = ?auto_352811 ?auto_352813 ) ) ( not ( = ?auto_352811 ?auto_352814 ) ) ( not ( = ?auto_352811 ?auto_352815 ) ) ( not ( = ?auto_352811 ?auto_352816 ) ) ( not ( = ?auto_352811 ?auto_352817 ) ) ( not ( = ?auto_352811 ?auto_352818 ) ) ( not ( = ?auto_352812 ?auto_352813 ) ) ( not ( = ?auto_352812 ?auto_352814 ) ) ( not ( = ?auto_352812 ?auto_352815 ) ) ( not ( = ?auto_352812 ?auto_352816 ) ) ( not ( = ?auto_352812 ?auto_352817 ) ) ( not ( = ?auto_352812 ?auto_352818 ) ) ( not ( = ?auto_352813 ?auto_352814 ) ) ( not ( = ?auto_352813 ?auto_352815 ) ) ( not ( = ?auto_352813 ?auto_352816 ) ) ( not ( = ?auto_352813 ?auto_352817 ) ) ( not ( = ?auto_352813 ?auto_352818 ) ) ( not ( = ?auto_352814 ?auto_352815 ) ) ( not ( = ?auto_352814 ?auto_352816 ) ) ( not ( = ?auto_352814 ?auto_352817 ) ) ( not ( = ?auto_352814 ?auto_352818 ) ) ( not ( = ?auto_352815 ?auto_352816 ) ) ( not ( = ?auto_352815 ?auto_352817 ) ) ( not ( = ?auto_352815 ?auto_352818 ) ) ( not ( = ?auto_352816 ?auto_352817 ) ) ( not ( = ?auto_352816 ?auto_352818 ) ) ( not ( = ?auto_352817 ?auto_352818 ) ) ( ON ?auto_352816 ?auto_352817 ) ( ON ?auto_352815 ?auto_352816 ) ( ON ?auto_352814 ?auto_352815 ) ( CLEAR ?auto_352812 ) ( ON ?auto_352813 ?auto_352814 ) ( CLEAR ?auto_352813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_352810 ?auto_352811 ?auto_352812 ?auto_352813 )
      ( MAKE-8PILE ?auto_352810 ?auto_352811 ?auto_352812 ?auto_352813 ?auto_352814 ?auto_352815 ?auto_352816 ?auto_352817 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352844 - BLOCK
      ?auto_352845 - BLOCK
      ?auto_352846 - BLOCK
      ?auto_352847 - BLOCK
      ?auto_352848 - BLOCK
      ?auto_352849 - BLOCK
      ?auto_352850 - BLOCK
      ?auto_352851 - BLOCK
    )
    :vars
    (
      ?auto_352852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352851 ?auto_352852 ) ( ON-TABLE ?auto_352844 ) ( ON ?auto_352845 ?auto_352844 ) ( not ( = ?auto_352844 ?auto_352845 ) ) ( not ( = ?auto_352844 ?auto_352846 ) ) ( not ( = ?auto_352844 ?auto_352847 ) ) ( not ( = ?auto_352844 ?auto_352848 ) ) ( not ( = ?auto_352844 ?auto_352849 ) ) ( not ( = ?auto_352844 ?auto_352850 ) ) ( not ( = ?auto_352844 ?auto_352851 ) ) ( not ( = ?auto_352844 ?auto_352852 ) ) ( not ( = ?auto_352845 ?auto_352846 ) ) ( not ( = ?auto_352845 ?auto_352847 ) ) ( not ( = ?auto_352845 ?auto_352848 ) ) ( not ( = ?auto_352845 ?auto_352849 ) ) ( not ( = ?auto_352845 ?auto_352850 ) ) ( not ( = ?auto_352845 ?auto_352851 ) ) ( not ( = ?auto_352845 ?auto_352852 ) ) ( not ( = ?auto_352846 ?auto_352847 ) ) ( not ( = ?auto_352846 ?auto_352848 ) ) ( not ( = ?auto_352846 ?auto_352849 ) ) ( not ( = ?auto_352846 ?auto_352850 ) ) ( not ( = ?auto_352846 ?auto_352851 ) ) ( not ( = ?auto_352846 ?auto_352852 ) ) ( not ( = ?auto_352847 ?auto_352848 ) ) ( not ( = ?auto_352847 ?auto_352849 ) ) ( not ( = ?auto_352847 ?auto_352850 ) ) ( not ( = ?auto_352847 ?auto_352851 ) ) ( not ( = ?auto_352847 ?auto_352852 ) ) ( not ( = ?auto_352848 ?auto_352849 ) ) ( not ( = ?auto_352848 ?auto_352850 ) ) ( not ( = ?auto_352848 ?auto_352851 ) ) ( not ( = ?auto_352848 ?auto_352852 ) ) ( not ( = ?auto_352849 ?auto_352850 ) ) ( not ( = ?auto_352849 ?auto_352851 ) ) ( not ( = ?auto_352849 ?auto_352852 ) ) ( not ( = ?auto_352850 ?auto_352851 ) ) ( not ( = ?auto_352850 ?auto_352852 ) ) ( not ( = ?auto_352851 ?auto_352852 ) ) ( ON ?auto_352850 ?auto_352851 ) ( ON ?auto_352849 ?auto_352850 ) ( ON ?auto_352848 ?auto_352849 ) ( ON ?auto_352847 ?auto_352848 ) ( CLEAR ?auto_352845 ) ( ON ?auto_352846 ?auto_352847 ) ( CLEAR ?auto_352846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_352844 ?auto_352845 ?auto_352846 )
      ( MAKE-8PILE ?auto_352844 ?auto_352845 ?auto_352846 ?auto_352847 ?auto_352848 ?auto_352849 ?auto_352850 ?auto_352851 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352878 - BLOCK
      ?auto_352879 - BLOCK
      ?auto_352880 - BLOCK
      ?auto_352881 - BLOCK
      ?auto_352882 - BLOCK
      ?auto_352883 - BLOCK
      ?auto_352884 - BLOCK
      ?auto_352885 - BLOCK
    )
    :vars
    (
      ?auto_352886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352885 ?auto_352886 ) ( ON-TABLE ?auto_352878 ) ( not ( = ?auto_352878 ?auto_352879 ) ) ( not ( = ?auto_352878 ?auto_352880 ) ) ( not ( = ?auto_352878 ?auto_352881 ) ) ( not ( = ?auto_352878 ?auto_352882 ) ) ( not ( = ?auto_352878 ?auto_352883 ) ) ( not ( = ?auto_352878 ?auto_352884 ) ) ( not ( = ?auto_352878 ?auto_352885 ) ) ( not ( = ?auto_352878 ?auto_352886 ) ) ( not ( = ?auto_352879 ?auto_352880 ) ) ( not ( = ?auto_352879 ?auto_352881 ) ) ( not ( = ?auto_352879 ?auto_352882 ) ) ( not ( = ?auto_352879 ?auto_352883 ) ) ( not ( = ?auto_352879 ?auto_352884 ) ) ( not ( = ?auto_352879 ?auto_352885 ) ) ( not ( = ?auto_352879 ?auto_352886 ) ) ( not ( = ?auto_352880 ?auto_352881 ) ) ( not ( = ?auto_352880 ?auto_352882 ) ) ( not ( = ?auto_352880 ?auto_352883 ) ) ( not ( = ?auto_352880 ?auto_352884 ) ) ( not ( = ?auto_352880 ?auto_352885 ) ) ( not ( = ?auto_352880 ?auto_352886 ) ) ( not ( = ?auto_352881 ?auto_352882 ) ) ( not ( = ?auto_352881 ?auto_352883 ) ) ( not ( = ?auto_352881 ?auto_352884 ) ) ( not ( = ?auto_352881 ?auto_352885 ) ) ( not ( = ?auto_352881 ?auto_352886 ) ) ( not ( = ?auto_352882 ?auto_352883 ) ) ( not ( = ?auto_352882 ?auto_352884 ) ) ( not ( = ?auto_352882 ?auto_352885 ) ) ( not ( = ?auto_352882 ?auto_352886 ) ) ( not ( = ?auto_352883 ?auto_352884 ) ) ( not ( = ?auto_352883 ?auto_352885 ) ) ( not ( = ?auto_352883 ?auto_352886 ) ) ( not ( = ?auto_352884 ?auto_352885 ) ) ( not ( = ?auto_352884 ?auto_352886 ) ) ( not ( = ?auto_352885 ?auto_352886 ) ) ( ON ?auto_352884 ?auto_352885 ) ( ON ?auto_352883 ?auto_352884 ) ( ON ?auto_352882 ?auto_352883 ) ( ON ?auto_352881 ?auto_352882 ) ( ON ?auto_352880 ?auto_352881 ) ( CLEAR ?auto_352878 ) ( ON ?auto_352879 ?auto_352880 ) ( CLEAR ?auto_352879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_352878 ?auto_352879 )
      ( MAKE-8PILE ?auto_352878 ?auto_352879 ?auto_352880 ?auto_352881 ?auto_352882 ?auto_352883 ?auto_352884 ?auto_352885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_352912 - BLOCK
      ?auto_352913 - BLOCK
      ?auto_352914 - BLOCK
      ?auto_352915 - BLOCK
      ?auto_352916 - BLOCK
      ?auto_352917 - BLOCK
      ?auto_352918 - BLOCK
      ?auto_352919 - BLOCK
    )
    :vars
    (
      ?auto_352920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352919 ?auto_352920 ) ( not ( = ?auto_352912 ?auto_352913 ) ) ( not ( = ?auto_352912 ?auto_352914 ) ) ( not ( = ?auto_352912 ?auto_352915 ) ) ( not ( = ?auto_352912 ?auto_352916 ) ) ( not ( = ?auto_352912 ?auto_352917 ) ) ( not ( = ?auto_352912 ?auto_352918 ) ) ( not ( = ?auto_352912 ?auto_352919 ) ) ( not ( = ?auto_352912 ?auto_352920 ) ) ( not ( = ?auto_352913 ?auto_352914 ) ) ( not ( = ?auto_352913 ?auto_352915 ) ) ( not ( = ?auto_352913 ?auto_352916 ) ) ( not ( = ?auto_352913 ?auto_352917 ) ) ( not ( = ?auto_352913 ?auto_352918 ) ) ( not ( = ?auto_352913 ?auto_352919 ) ) ( not ( = ?auto_352913 ?auto_352920 ) ) ( not ( = ?auto_352914 ?auto_352915 ) ) ( not ( = ?auto_352914 ?auto_352916 ) ) ( not ( = ?auto_352914 ?auto_352917 ) ) ( not ( = ?auto_352914 ?auto_352918 ) ) ( not ( = ?auto_352914 ?auto_352919 ) ) ( not ( = ?auto_352914 ?auto_352920 ) ) ( not ( = ?auto_352915 ?auto_352916 ) ) ( not ( = ?auto_352915 ?auto_352917 ) ) ( not ( = ?auto_352915 ?auto_352918 ) ) ( not ( = ?auto_352915 ?auto_352919 ) ) ( not ( = ?auto_352915 ?auto_352920 ) ) ( not ( = ?auto_352916 ?auto_352917 ) ) ( not ( = ?auto_352916 ?auto_352918 ) ) ( not ( = ?auto_352916 ?auto_352919 ) ) ( not ( = ?auto_352916 ?auto_352920 ) ) ( not ( = ?auto_352917 ?auto_352918 ) ) ( not ( = ?auto_352917 ?auto_352919 ) ) ( not ( = ?auto_352917 ?auto_352920 ) ) ( not ( = ?auto_352918 ?auto_352919 ) ) ( not ( = ?auto_352918 ?auto_352920 ) ) ( not ( = ?auto_352919 ?auto_352920 ) ) ( ON ?auto_352918 ?auto_352919 ) ( ON ?auto_352917 ?auto_352918 ) ( ON ?auto_352916 ?auto_352917 ) ( ON ?auto_352915 ?auto_352916 ) ( ON ?auto_352914 ?auto_352915 ) ( ON ?auto_352913 ?auto_352914 ) ( ON ?auto_352912 ?auto_352913 ) ( CLEAR ?auto_352912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352912 )
      ( MAKE-8PILE ?auto_352912 ?auto_352913 ?auto_352914 ?auto_352915 ?auto_352916 ?auto_352917 ?auto_352918 ?auto_352919 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_352947 - BLOCK
      ?auto_352948 - BLOCK
      ?auto_352949 - BLOCK
      ?auto_352950 - BLOCK
      ?auto_352951 - BLOCK
      ?auto_352952 - BLOCK
      ?auto_352953 - BLOCK
      ?auto_352954 - BLOCK
      ?auto_352955 - BLOCK
    )
    :vars
    (
      ?auto_352956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_352954 ) ( ON ?auto_352955 ?auto_352956 ) ( CLEAR ?auto_352955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_352947 ) ( ON ?auto_352948 ?auto_352947 ) ( ON ?auto_352949 ?auto_352948 ) ( ON ?auto_352950 ?auto_352949 ) ( ON ?auto_352951 ?auto_352950 ) ( ON ?auto_352952 ?auto_352951 ) ( ON ?auto_352953 ?auto_352952 ) ( ON ?auto_352954 ?auto_352953 ) ( not ( = ?auto_352947 ?auto_352948 ) ) ( not ( = ?auto_352947 ?auto_352949 ) ) ( not ( = ?auto_352947 ?auto_352950 ) ) ( not ( = ?auto_352947 ?auto_352951 ) ) ( not ( = ?auto_352947 ?auto_352952 ) ) ( not ( = ?auto_352947 ?auto_352953 ) ) ( not ( = ?auto_352947 ?auto_352954 ) ) ( not ( = ?auto_352947 ?auto_352955 ) ) ( not ( = ?auto_352947 ?auto_352956 ) ) ( not ( = ?auto_352948 ?auto_352949 ) ) ( not ( = ?auto_352948 ?auto_352950 ) ) ( not ( = ?auto_352948 ?auto_352951 ) ) ( not ( = ?auto_352948 ?auto_352952 ) ) ( not ( = ?auto_352948 ?auto_352953 ) ) ( not ( = ?auto_352948 ?auto_352954 ) ) ( not ( = ?auto_352948 ?auto_352955 ) ) ( not ( = ?auto_352948 ?auto_352956 ) ) ( not ( = ?auto_352949 ?auto_352950 ) ) ( not ( = ?auto_352949 ?auto_352951 ) ) ( not ( = ?auto_352949 ?auto_352952 ) ) ( not ( = ?auto_352949 ?auto_352953 ) ) ( not ( = ?auto_352949 ?auto_352954 ) ) ( not ( = ?auto_352949 ?auto_352955 ) ) ( not ( = ?auto_352949 ?auto_352956 ) ) ( not ( = ?auto_352950 ?auto_352951 ) ) ( not ( = ?auto_352950 ?auto_352952 ) ) ( not ( = ?auto_352950 ?auto_352953 ) ) ( not ( = ?auto_352950 ?auto_352954 ) ) ( not ( = ?auto_352950 ?auto_352955 ) ) ( not ( = ?auto_352950 ?auto_352956 ) ) ( not ( = ?auto_352951 ?auto_352952 ) ) ( not ( = ?auto_352951 ?auto_352953 ) ) ( not ( = ?auto_352951 ?auto_352954 ) ) ( not ( = ?auto_352951 ?auto_352955 ) ) ( not ( = ?auto_352951 ?auto_352956 ) ) ( not ( = ?auto_352952 ?auto_352953 ) ) ( not ( = ?auto_352952 ?auto_352954 ) ) ( not ( = ?auto_352952 ?auto_352955 ) ) ( not ( = ?auto_352952 ?auto_352956 ) ) ( not ( = ?auto_352953 ?auto_352954 ) ) ( not ( = ?auto_352953 ?auto_352955 ) ) ( not ( = ?auto_352953 ?auto_352956 ) ) ( not ( = ?auto_352954 ?auto_352955 ) ) ( not ( = ?auto_352954 ?auto_352956 ) ) ( not ( = ?auto_352955 ?auto_352956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352955 ?auto_352956 )
      ( !STACK ?auto_352955 ?auto_352954 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_352985 - BLOCK
      ?auto_352986 - BLOCK
      ?auto_352987 - BLOCK
      ?auto_352988 - BLOCK
      ?auto_352989 - BLOCK
      ?auto_352990 - BLOCK
      ?auto_352991 - BLOCK
      ?auto_352992 - BLOCK
      ?auto_352993 - BLOCK
    )
    :vars
    (
      ?auto_352994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352993 ?auto_352994 ) ( ON-TABLE ?auto_352985 ) ( ON ?auto_352986 ?auto_352985 ) ( ON ?auto_352987 ?auto_352986 ) ( ON ?auto_352988 ?auto_352987 ) ( ON ?auto_352989 ?auto_352988 ) ( ON ?auto_352990 ?auto_352989 ) ( ON ?auto_352991 ?auto_352990 ) ( not ( = ?auto_352985 ?auto_352986 ) ) ( not ( = ?auto_352985 ?auto_352987 ) ) ( not ( = ?auto_352985 ?auto_352988 ) ) ( not ( = ?auto_352985 ?auto_352989 ) ) ( not ( = ?auto_352985 ?auto_352990 ) ) ( not ( = ?auto_352985 ?auto_352991 ) ) ( not ( = ?auto_352985 ?auto_352992 ) ) ( not ( = ?auto_352985 ?auto_352993 ) ) ( not ( = ?auto_352985 ?auto_352994 ) ) ( not ( = ?auto_352986 ?auto_352987 ) ) ( not ( = ?auto_352986 ?auto_352988 ) ) ( not ( = ?auto_352986 ?auto_352989 ) ) ( not ( = ?auto_352986 ?auto_352990 ) ) ( not ( = ?auto_352986 ?auto_352991 ) ) ( not ( = ?auto_352986 ?auto_352992 ) ) ( not ( = ?auto_352986 ?auto_352993 ) ) ( not ( = ?auto_352986 ?auto_352994 ) ) ( not ( = ?auto_352987 ?auto_352988 ) ) ( not ( = ?auto_352987 ?auto_352989 ) ) ( not ( = ?auto_352987 ?auto_352990 ) ) ( not ( = ?auto_352987 ?auto_352991 ) ) ( not ( = ?auto_352987 ?auto_352992 ) ) ( not ( = ?auto_352987 ?auto_352993 ) ) ( not ( = ?auto_352987 ?auto_352994 ) ) ( not ( = ?auto_352988 ?auto_352989 ) ) ( not ( = ?auto_352988 ?auto_352990 ) ) ( not ( = ?auto_352988 ?auto_352991 ) ) ( not ( = ?auto_352988 ?auto_352992 ) ) ( not ( = ?auto_352988 ?auto_352993 ) ) ( not ( = ?auto_352988 ?auto_352994 ) ) ( not ( = ?auto_352989 ?auto_352990 ) ) ( not ( = ?auto_352989 ?auto_352991 ) ) ( not ( = ?auto_352989 ?auto_352992 ) ) ( not ( = ?auto_352989 ?auto_352993 ) ) ( not ( = ?auto_352989 ?auto_352994 ) ) ( not ( = ?auto_352990 ?auto_352991 ) ) ( not ( = ?auto_352990 ?auto_352992 ) ) ( not ( = ?auto_352990 ?auto_352993 ) ) ( not ( = ?auto_352990 ?auto_352994 ) ) ( not ( = ?auto_352991 ?auto_352992 ) ) ( not ( = ?auto_352991 ?auto_352993 ) ) ( not ( = ?auto_352991 ?auto_352994 ) ) ( not ( = ?auto_352992 ?auto_352993 ) ) ( not ( = ?auto_352992 ?auto_352994 ) ) ( not ( = ?auto_352993 ?auto_352994 ) ) ( CLEAR ?auto_352991 ) ( ON ?auto_352992 ?auto_352993 ) ( CLEAR ?auto_352992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_352985 ?auto_352986 ?auto_352987 ?auto_352988 ?auto_352989 ?auto_352990 ?auto_352991 ?auto_352992 )
      ( MAKE-9PILE ?auto_352985 ?auto_352986 ?auto_352987 ?auto_352988 ?auto_352989 ?auto_352990 ?auto_352991 ?auto_352992 ?auto_352993 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353023 - BLOCK
      ?auto_353024 - BLOCK
      ?auto_353025 - BLOCK
      ?auto_353026 - BLOCK
      ?auto_353027 - BLOCK
      ?auto_353028 - BLOCK
      ?auto_353029 - BLOCK
      ?auto_353030 - BLOCK
      ?auto_353031 - BLOCK
    )
    :vars
    (
      ?auto_353032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353031 ?auto_353032 ) ( ON-TABLE ?auto_353023 ) ( ON ?auto_353024 ?auto_353023 ) ( ON ?auto_353025 ?auto_353024 ) ( ON ?auto_353026 ?auto_353025 ) ( ON ?auto_353027 ?auto_353026 ) ( ON ?auto_353028 ?auto_353027 ) ( not ( = ?auto_353023 ?auto_353024 ) ) ( not ( = ?auto_353023 ?auto_353025 ) ) ( not ( = ?auto_353023 ?auto_353026 ) ) ( not ( = ?auto_353023 ?auto_353027 ) ) ( not ( = ?auto_353023 ?auto_353028 ) ) ( not ( = ?auto_353023 ?auto_353029 ) ) ( not ( = ?auto_353023 ?auto_353030 ) ) ( not ( = ?auto_353023 ?auto_353031 ) ) ( not ( = ?auto_353023 ?auto_353032 ) ) ( not ( = ?auto_353024 ?auto_353025 ) ) ( not ( = ?auto_353024 ?auto_353026 ) ) ( not ( = ?auto_353024 ?auto_353027 ) ) ( not ( = ?auto_353024 ?auto_353028 ) ) ( not ( = ?auto_353024 ?auto_353029 ) ) ( not ( = ?auto_353024 ?auto_353030 ) ) ( not ( = ?auto_353024 ?auto_353031 ) ) ( not ( = ?auto_353024 ?auto_353032 ) ) ( not ( = ?auto_353025 ?auto_353026 ) ) ( not ( = ?auto_353025 ?auto_353027 ) ) ( not ( = ?auto_353025 ?auto_353028 ) ) ( not ( = ?auto_353025 ?auto_353029 ) ) ( not ( = ?auto_353025 ?auto_353030 ) ) ( not ( = ?auto_353025 ?auto_353031 ) ) ( not ( = ?auto_353025 ?auto_353032 ) ) ( not ( = ?auto_353026 ?auto_353027 ) ) ( not ( = ?auto_353026 ?auto_353028 ) ) ( not ( = ?auto_353026 ?auto_353029 ) ) ( not ( = ?auto_353026 ?auto_353030 ) ) ( not ( = ?auto_353026 ?auto_353031 ) ) ( not ( = ?auto_353026 ?auto_353032 ) ) ( not ( = ?auto_353027 ?auto_353028 ) ) ( not ( = ?auto_353027 ?auto_353029 ) ) ( not ( = ?auto_353027 ?auto_353030 ) ) ( not ( = ?auto_353027 ?auto_353031 ) ) ( not ( = ?auto_353027 ?auto_353032 ) ) ( not ( = ?auto_353028 ?auto_353029 ) ) ( not ( = ?auto_353028 ?auto_353030 ) ) ( not ( = ?auto_353028 ?auto_353031 ) ) ( not ( = ?auto_353028 ?auto_353032 ) ) ( not ( = ?auto_353029 ?auto_353030 ) ) ( not ( = ?auto_353029 ?auto_353031 ) ) ( not ( = ?auto_353029 ?auto_353032 ) ) ( not ( = ?auto_353030 ?auto_353031 ) ) ( not ( = ?auto_353030 ?auto_353032 ) ) ( not ( = ?auto_353031 ?auto_353032 ) ) ( ON ?auto_353030 ?auto_353031 ) ( CLEAR ?auto_353028 ) ( ON ?auto_353029 ?auto_353030 ) ( CLEAR ?auto_353029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_353023 ?auto_353024 ?auto_353025 ?auto_353026 ?auto_353027 ?auto_353028 ?auto_353029 )
      ( MAKE-9PILE ?auto_353023 ?auto_353024 ?auto_353025 ?auto_353026 ?auto_353027 ?auto_353028 ?auto_353029 ?auto_353030 ?auto_353031 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353061 - BLOCK
      ?auto_353062 - BLOCK
      ?auto_353063 - BLOCK
      ?auto_353064 - BLOCK
      ?auto_353065 - BLOCK
      ?auto_353066 - BLOCK
      ?auto_353067 - BLOCK
      ?auto_353068 - BLOCK
      ?auto_353069 - BLOCK
    )
    :vars
    (
      ?auto_353070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353069 ?auto_353070 ) ( ON-TABLE ?auto_353061 ) ( ON ?auto_353062 ?auto_353061 ) ( ON ?auto_353063 ?auto_353062 ) ( ON ?auto_353064 ?auto_353063 ) ( ON ?auto_353065 ?auto_353064 ) ( not ( = ?auto_353061 ?auto_353062 ) ) ( not ( = ?auto_353061 ?auto_353063 ) ) ( not ( = ?auto_353061 ?auto_353064 ) ) ( not ( = ?auto_353061 ?auto_353065 ) ) ( not ( = ?auto_353061 ?auto_353066 ) ) ( not ( = ?auto_353061 ?auto_353067 ) ) ( not ( = ?auto_353061 ?auto_353068 ) ) ( not ( = ?auto_353061 ?auto_353069 ) ) ( not ( = ?auto_353061 ?auto_353070 ) ) ( not ( = ?auto_353062 ?auto_353063 ) ) ( not ( = ?auto_353062 ?auto_353064 ) ) ( not ( = ?auto_353062 ?auto_353065 ) ) ( not ( = ?auto_353062 ?auto_353066 ) ) ( not ( = ?auto_353062 ?auto_353067 ) ) ( not ( = ?auto_353062 ?auto_353068 ) ) ( not ( = ?auto_353062 ?auto_353069 ) ) ( not ( = ?auto_353062 ?auto_353070 ) ) ( not ( = ?auto_353063 ?auto_353064 ) ) ( not ( = ?auto_353063 ?auto_353065 ) ) ( not ( = ?auto_353063 ?auto_353066 ) ) ( not ( = ?auto_353063 ?auto_353067 ) ) ( not ( = ?auto_353063 ?auto_353068 ) ) ( not ( = ?auto_353063 ?auto_353069 ) ) ( not ( = ?auto_353063 ?auto_353070 ) ) ( not ( = ?auto_353064 ?auto_353065 ) ) ( not ( = ?auto_353064 ?auto_353066 ) ) ( not ( = ?auto_353064 ?auto_353067 ) ) ( not ( = ?auto_353064 ?auto_353068 ) ) ( not ( = ?auto_353064 ?auto_353069 ) ) ( not ( = ?auto_353064 ?auto_353070 ) ) ( not ( = ?auto_353065 ?auto_353066 ) ) ( not ( = ?auto_353065 ?auto_353067 ) ) ( not ( = ?auto_353065 ?auto_353068 ) ) ( not ( = ?auto_353065 ?auto_353069 ) ) ( not ( = ?auto_353065 ?auto_353070 ) ) ( not ( = ?auto_353066 ?auto_353067 ) ) ( not ( = ?auto_353066 ?auto_353068 ) ) ( not ( = ?auto_353066 ?auto_353069 ) ) ( not ( = ?auto_353066 ?auto_353070 ) ) ( not ( = ?auto_353067 ?auto_353068 ) ) ( not ( = ?auto_353067 ?auto_353069 ) ) ( not ( = ?auto_353067 ?auto_353070 ) ) ( not ( = ?auto_353068 ?auto_353069 ) ) ( not ( = ?auto_353068 ?auto_353070 ) ) ( not ( = ?auto_353069 ?auto_353070 ) ) ( ON ?auto_353068 ?auto_353069 ) ( ON ?auto_353067 ?auto_353068 ) ( CLEAR ?auto_353065 ) ( ON ?auto_353066 ?auto_353067 ) ( CLEAR ?auto_353066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_353061 ?auto_353062 ?auto_353063 ?auto_353064 ?auto_353065 ?auto_353066 )
      ( MAKE-9PILE ?auto_353061 ?auto_353062 ?auto_353063 ?auto_353064 ?auto_353065 ?auto_353066 ?auto_353067 ?auto_353068 ?auto_353069 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353099 - BLOCK
      ?auto_353100 - BLOCK
      ?auto_353101 - BLOCK
      ?auto_353102 - BLOCK
      ?auto_353103 - BLOCK
      ?auto_353104 - BLOCK
      ?auto_353105 - BLOCK
      ?auto_353106 - BLOCK
      ?auto_353107 - BLOCK
    )
    :vars
    (
      ?auto_353108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353107 ?auto_353108 ) ( ON-TABLE ?auto_353099 ) ( ON ?auto_353100 ?auto_353099 ) ( ON ?auto_353101 ?auto_353100 ) ( ON ?auto_353102 ?auto_353101 ) ( not ( = ?auto_353099 ?auto_353100 ) ) ( not ( = ?auto_353099 ?auto_353101 ) ) ( not ( = ?auto_353099 ?auto_353102 ) ) ( not ( = ?auto_353099 ?auto_353103 ) ) ( not ( = ?auto_353099 ?auto_353104 ) ) ( not ( = ?auto_353099 ?auto_353105 ) ) ( not ( = ?auto_353099 ?auto_353106 ) ) ( not ( = ?auto_353099 ?auto_353107 ) ) ( not ( = ?auto_353099 ?auto_353108 ) ) ( not ( = ?auto_353100 ?auto_353101 ) ) ( not ( = ?auto_353100 ?auto_353102 ) ) ( not ( = ?auto_353100 ?auto_353103 ) ) ( not ( = ?auto_353100 ?auto_353104 ) ) ( not ( = ?auto_353100 ?auto_353105 ) ) ( not ( = ?auto_353100 ?auto_353106 ) ) ( not ( = ?auto_353100 ?auto_353107 ) ) ( not ( = ?auto_353100 ?auto_353108 ) ) ( not ( = ?auto_353101 ?auto_353102 ) ) ( not ( = ?auto_353101 ?auto_353103 ) ) ( not ( = ?auto_353101 ?auto_353104 ) ) ( not ( = ?auto_353101 ?auto_353105 ) ) ( not ( = ?auto_353101 ?auto_353106 ) ) ( not ( = ?auto_353101 ?auto_353107 ) ) ( not ( = ?auto_353101 ?auto_353108 ) ) ( not ( = ?auto_353102 ?auto_353103 ) ) ( not ( = ?auto_353102 ?auto_353104 ) ) ( not ( = ?auto_353102 ?auto_353105 ) ) ( not ( = ?auto_353102 ?auto_353106 ) ) ( not ( = ?auto_353102 ?auto_353107 ) ) ( not ( = ?auto_353102 ?auto_353108 ) ) ( not ( = ?auto_353103 ?auto_353104 ) ) ( not ( = ?auto_353103 ?auto_353105 ) ) ( not ( = ?auto_353103 ?auto_353106 ) ) ( not ( = ?auto_353103 ?auto_353107 ) ) ( not ( = ?auto_353103 ?auto_353108 ) ) ( not ( = ?auto_353104 ?auto_353105 ) ) ( not ( = ?auto_353104 ?auto_353106 ) ) ( not ( = ?auto_353104 ?auto_353107 ) ) ( not ( = ?auto_353104 ?auto_353108 ) ) ( not ( = ?auto_353105 ?auto_353106 ) ) ( not ( = ?auto_353105 ?auto_353107 ) ) ( not ( = ?auto_353105 ?auto_353108 ) ) ( not ( = ?auto_353106 ?auto_353107 ) ) ( not ( = ?auto_353106 ?auto_353108 ) ) ( not ( = ?auto_353107 ?auto_353108 ) ) ( ON ?auto_353106 ?auto_353107 ) ( ON ?auto_353105 ?auto_353106 ) ( ON ?auto_353104 ?auto_353105 ) ( CLEAR ?auto_353102 ) ( ON ?auto_353103 ?auto_353104 ) ( CLEAR ?auto_353103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_353099 ?auto_353100 ?auto_353101 ?auto_353102 ?auto_353103 )
      ( MAKE-9PILE ?auto_353099 ?auto_353100 ?auto_353101 ?auto_353102 ?auto_353103 ?auto_353104 ?auto_353105 ?auto_353106 ?auto_353107 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353137 - BLOCK
      ?auto_353138 - BLOCK
      ?auto_353139 - BLOCK
      ?auto_353140 - BLOCK
      ?auto_353141 - BLOCK
      ?auto_353142 - BLOCK
      ?auto_353143 - BLOCK
      ?auto_353144 - BLOCK
      ?auto_353145 - BLOCK
    )
    :vars
    (
      ?auto_353146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353145 ?auto_353146 ) ( ON-TABLE ?auto_353137 ) ( ON ?auto_353138 ?auto_353137 ) ( ON ?auto_353139 ?auto_353138 ) ( not ( = ?auto_353137 ?auto_353138 ) ) ( not ( = ?auto_353137 ?auto_353139 ) ) ( not ( = ?auto_353137 ?auto_353140 ) ) ( not ( = ?auto_353137 ?auto_353141 ) ) ( not ( = ?auto_353137 ?auto_353142 ) ) ( not ( = ?auto_353137 ?auto_353143 ) ) ( not ( = ?auto_353137 ?auto_353144 ) ) ( not ( = ?auto_353137 ?auto_353145 ) ) ( not ( = ?auto_353137 ?auto_353146 ) ) ( not ( = ?auto_353138 ?auto_353139 ) ) ( not ( = ?auto_353138 ?auto_353140 ) ) ( not ( = ?auto_353138 ?auto_353141 ) ) ( not ( = ?auto_353138 ?auto_353142 ) ) ( not ( = ?auto_353138 ?auto_353143 ) ) ( not ( = ?auto_353138 ?auto_353144 ) ) ( not ( = ?auto_353138 ?auto_353145 ) ) ( not ( = ?auto_353138 ?auto_353146 ) ) ( not ( = ?auto_353139 ?auto_353140 ) ) ( not ( = ?auto_353139 ?auto_353141 ) ) ( not ( = ?auto_353139 ?auto_353142 ) ) ( not ( = ?auto_353139 ?auto_353143 ) ) ( not ( = ?auto_353139 ?auto_353144 ) ) ( not ( = ?auto_353139 ?auto_353145 ) ) ( not ( = ?auto_353139 ?auto_353146 ) ) ( not ( = ?auto_353140 ?auto_353141 ) ) ( not ( = ?auto_353140 ?auto_353142 ) ) ( not ( = ?auto_353140 ?auto_353143 ) ) ( not ( = ?auto_353140 ?auto_353144 ) ) ( not ( = ?auto_353140 ?auto_353145 ) ) ( not ( = ?auto_353140 ?auto_353146 ) ) ( not ( = ?auto_353141 ?auto_353142 ) ) ( not ( = ?auto_353141 ?auto_353143 ) ) ( not ( = ?auto_353141 ?auto_353144 ) ) ( not ( = ?auto_353141 ?auto_353145 ) ) ( not ( = ?auto_353141 ?auto_353146 ) ) ( not ( = ?auto_353142 ?auto_353143 ) ) ( not ( = ?auto_353142 ?auto_353144 ) ) ( not ( = ?auto_353142 ?auto_353145 ) ) ( not ( = ?auto_353142 ?auto_353146 ) ) ( not ( = ?auto_353143 ?auto_353144 ) ) ( not ( = ?auto_353143 ?auto_353145 ) ) ( not ( = ?auto_353143 ?auto_353146 ) ) ( not ( = ?auto_353144 ?auto_353145 ) ) ( not ( = ?auto_353144 ?auto_353146 ) ) ( not ( = ?auto_353145 ?auto_353146 ) ) ( ON ?auto_353144 ?auto_353145 ) ( ON ?auto_353143 ?auto_353144 ) ( ON ?auto_353142 ?auto_353143 ) ( ON ?auto_353141 ?auto_353142 ) ( CLEAR ?auto_353139 ) ( ON ?auto_353140 ?auto_353141 ) ( CLEAR ?auto_353140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_353137 ?auto_353138 ?auto_353139 ?auto_353140 )
      ( MAKE-9PILE ?auto_353137 ?auto_353138 ?auto_353139 ?auto_353140 ?auto_353141 ?auto_353142 ?auto_353143 ?auto_353144 ?auto_353145 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353175 - BLOCK
      ?auto_353176 - BLOCK
      ?auto_353177 - BLOCK
      ?auto_353178 - BLOCK
      ?auto_353179 - BLOCK
      ?auto_353180 - BLOCK
      ?auto_353181 - BLOCK
      ?auto_353182 - BLOCK
      ?auto_353183 - BLOCK
    )
    :vars
    (
      ?auto_353184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353183 ?auto_353184 ) ( ON-TABLE ?auto_353175 ) ( ON ?auto_353176 ?auto_353175 ) ( not ( = ?auto_353175 ?auto_353176 ) ) ( not ( = ?auto_353175 ?auto_353177 ) ) ( not ( = ?auto_353175 ?auto_353178 ) ) ( not ( = ?auto_353175 ?auto_353179 ) ) ( not ( = ?auto_353175 ?auto_353180 ) ) ( not ( = ?auto_353175 ?auto_353181 ) ) ( not ( = ?auto_353175 ?auto_353182 ) ) ( not ( = ?auto_353175 ?auto_353183 ) ) ( not ( = ?auto_353175 ?auto_353184 ) ) ( not ( = ?auto_353176 ?auto_353177 ) ) ( not ( = ?auto_353176 ?auto_353178 ) ) ( not ( = ?auto_353176 ?auto_353179 ) ) ( not ( = ?auto_353176 ?auto_353180 ) ) ( not ( = ?auto_353176 ?auto_353181 ) ) ( not ( = ?auto_353176 ?auto_353182 ) ) ( not ( = ?auto_353176 ?auto_353183 ) ) ( not ( = ?auto_353176 ?auto_353184 ) ) ( not ( = ?auto_353177 ?auto_353178 ) ) ( not ( = ?auto_353177 ?auto_353179 ) ) ( not ( = ?auto_353177 ?auto_353180 ) ) ( not ( = ?auto_353177 ?auto_353181 ) ) ( not ( = ?auto_353177 ?auto_353182 ) ) ( not ( = ?auto_353177 ?auto_353183 ) ) ( not ( = ?auto_353177 ?auto_353184 ) ) ( not ( = ?auto_353178 ?auto_353179 ) ) ( not ( = ?auto_353178 ?auto_353180 ) ) ( not ( = ?auto_353178 ?auto_353181 ) ) ( not ( = ?auto_353178 ?auto_353182 ) ) ( not ( = ?auto_353178 ?auto_353183 ) ) ( not ( = ?auto_353178 ?auto_353184 ) ) ( not ( = ?auto_353179 ?auto_353180 ) ) ( not ( = ?auto_353179 ?auto_353181 ) ) ( not ( = ?auto_353179 ?auto_353182 ) ) ( not ( = ?auto_353179 ?auto_353183 ) ) ( not ( = ?auto_353179 ?auto_353184 ) ) ( not ( = ?auto_353180 ?auto_353181 ) ) ( not ( = ?auto_353180 ?auto_353182 ) ) ( not ( = ?auto_353180 ?auto_353183 ) ) ( not ( = ?auto_353180 ?auto_353184 ) ) ( not ( = ?auto_353181 ?auto_353182 ) ) ( not ( = ?auto_353181 ?auto_353183 ) ) ( not ( = ?auto_353181 ?auto_353184 ) ) ( not ( = ?auto_353182 ?auto_353183 ) ) ( not ( = ?auto_353182 ?auto_353184 ) ) ( not ( = ?auto_353183 ?auto_353184 ) ) ( ON ?auto_353182 ?auto_353183 ) ( ON ?auto_353181 ?auto_353182 ) ( ON ?auto_353180 ?auto_353181 ) ( ON ?auto_353179 ?auto_353180 ) ( ON ?auto_353178 ?auto_353179 ) ( CLEAR ?auto_353176 ) ( ON ?auto_353177 ?auto_353178 ) ( CLEAR ?auto_353177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_353175 ?auto_353176 ?auto_353177 )
      ( MAKE-9PILE ?auto_353175 ?auto_353176 ?auto_353177 ?auto_353178 ?auto_353179 ?auto_353180 ?auto_353181 ?auto_353182 ?auto_353183 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353213 - BLOCK
      ?auto_353214 - BLOCK
      ?auto_353215 - BLOCK
      ?auto_353216 - BLOCK
      ?auto_353217 - BLOCK
      ?auto_353218 - BLOCK
      ?auto_353219 - BLOCK
      ?auto_353220 - BLOCK
      ?auto_353221 - BLOCK
    )
    :vars
    (
      ?auto_353222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353221 ?auto_353222 ) ( ON-TABLE ?auto_353213 ) ( not ( = ?auto_353213 ?auto_353214 ) ) ( not ( = ?auto_353213 ?auto_353215 ) ) ( not ( = ?auto_353213 ?auto_353216 ) ) ( not ( = ?auto_353213 ?auto_353217 ) ) ( not ( = ?auto_353213 ?auto_353218 ) ) ( not ( = ?auto_353213 ?auto_353219 ) ) ( not ( = ?auto_353213 ?auto_353220 ) ) ( not ( = ?auto_353213 ?auto_353221 ) ) ( not ( = ?auto_353213 ?auto_353222 ) ) ( not ( = ?auto_353214 ?auto_353215 ) ) ( not ( = ?auto_353214 ?auto_353216 ) ) ( not ( = ?auto_353214 ?auto_353217 ) ) ( not ( = ?auto_353214 ?auto_353218 ) ) ( not ( = ?auto_353214 ?auto_353219 ) ) ( not ( = ?auto_353214 ?auto_353220 ) ) ( not ( = ?auto_353214 ?auto_353221 ) ) ( not ( = ?auto_353214 ?auto_353222 ) ) ( not ( = ?auto_353215 ?auto_353216 ) ) ( not ( = ?auto_353215 ?auto_353217 ) ) ( not ( = ?auto_353215 ?auto_353218 ) ) ( not ( = ?auto_353215 ?auto_353219 ) ) ( not ( = ?auto_353215 ?auto_353220 ) ) ( not ( = ?auto_353215 ?auto_353221 ) ) ( not ( = ?auto_353215 ?auto_353222 ) ) ( not ( = ?auto_353216 ?auto_353217 ) ) ( not ( = ?auto_353216 ?auto_353218 ) ) ( not ( = ?auto_353216 ?auto_353219 ) ) ( not ( = ?auto_353216 ?auto_353220 ) ) ( not ( = ?auto_353216 ?auto_353221 ) ) ( not ( = ?auto_353216 ?auto_353222 ) ) ( not ( = ?auto_353217 ?auto_353218 ) ) ( not ( = ?auto_353217 ?auto_353219 ) ) ( not ( = ?auto_353217 ?auto_353220 ) ) ( not ( = ?auto_353217 ?auto_353221 ) ) ( not ( = ?auto_353217 ?auto_353222 ) ) ( not ( = ?auto_353218 ?auto_353219 ) ) ( not ( = ?auto_353218 ?auto_353220 ) ) ( not ( = ?auto_353218 ?auto_353221 ) ) ( not ( = ?auto_353218 ?auto_353222 ) ) ( not ( = ?auto_353219 ?auto_353220 ) ) ( not ( = ?auto_353219 ?auto_353221 ) ) ( not ( = ?auto_353219 ?auto_353222 ) ) ( not ( = ?auto_353220 ?auto_353221 ) ) ( not ( = ?auto_353220 ?auto_353222 ) ) ( not ( = ?auto_353221 ?auto_353222 ) ) ( ON ?auto_353220 ?auto_353221 ) ( ON ?auto_353219 ?auto_353220 ) ( ON ?auto_353218 ?auto_353219 ) ( ON ?auto_353217 ?auto_353218 ) ( ON ?auto_353216 ?auto_353217 ) ( ON ?auto_353215 ?auto_353216 ) ( CLEAR ?auto_353213 ) ( ON ?auto_353214 ?auto_353215 ) ( CLEAR ?auto_353214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_353213 ?auto_353214 )
      ( MAKE-9PILE ?auto_353213 ?auto_353214 ?auto_353215 ?auto_353216 ?auto_353217 ?auto_353218 ?auto_353219 ?auto_353220 ?auto_353221 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_353251 - BLOCK
      ?auto_353252 - BLOCK
      ?auto_353253 - BLOCK
      ?auto_353254 - BLOCK
      ?auto_353255 - BLOCK
      ?auto_353256 - BLOCK
      ?auto_353257 - BLOCK
      ?auto_353258 - BLOCK
      ?auto_353259 - BLOCK
    )
    :vars
    (
      ?auto_353260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353259 ?auto_353260 ) ( not ( = ?auto_353251 ?auto_353252 ) ) ( not ( = ?auto_353251 ?auto_353253 ) ) ( not ( = ?auto_353251 ?auto_353254 ) ) ( not ( = ?auto_353251 ?auto_353255 ) ) ( not ( = ?auto_353251 ?auto_353256 ) ) ( not ( = ?auto_353251 ?auto_353257 ) ) ( not ( = ?auto_353251 ?auto_353258 ) ) ( not ( = ?auto_353251 ?auto_353259 ) ) ( not ( = ?auto_353251 ?auto_353260 ) ) ( not ( = ?auto_353252 ?auto_353253 ) ) ( not ( = ?auto_353252 ?auto_353254 ) ) ( not ( = ?auto_353252 ?auto_353255 ) ) ( not ( = ?auto_353252 ?auto_353256 ) ) ( not ( = ?auto_353252 ?auto_353257 ) ) ( not ( = ?auto_353252 ?auto_353258 ) ) ( not ( = ?auto_353252 ?auto_353259 ) ) ( not ( = ?auto_353252 ?auto_353260 ) ) ( not ( = ?auto_353253 ?auto_353254 ) ) ( not ( = ?auto_353253 ?auto_353255 ) ) ( not ( = ?auto_353253 ?auto_353256 ) ) ( not ( = ?auto_353253 ?auto_353257 ) ) ( not ( = ?auto_353253 ?auto_353258 ) ) ( not ( = ?auto_353253 ?auto_353259 ) ) ( not ( = ?auto_353253 ?auto_353260 ) ) ( not ( = ?auto_353254 ?auto_353255 ) ) ( not ( = ?auto_353254 ?auto_353256 ) ) ( not ( = ?auto_353254 ?auto_353257 ) ) ( not ( = ?auto_353254 ?auto_353258 ) ) ( not ( = ?auto_353254 ?auto_353259 ) ) ( not ( = ?auto_353254 ?auto_353260 ) ) ( not ( = ?auto_353255 ?auto_353256 ) ) ( not ( = ?auto_353255 ?auto_353257 ) ) ( not ( = ?auto_353255 ?auto_353258 ) ) ( not ( = ?auto_353255 ?auto_353259 ) ) ( not ( = ?auto_353255 ?auto_353260 ) ) ( not ( = ?auto_353256 ?auto_353257 ) ) ( not ( = ?auto_353256 ?auto_353258 ) ) ( not ( = ?auto_353256 ?auto_353259 ) ) ( not ( = ?auto_353256 ?auto_353260 ) ) ( not ( = ?auto_353257 ?auto_353258 ) ) ( not ( = ?auto_353257 ?auto_353259 ) ) ( not ( = ?auto_353257 ?auto_353260 ) ) ( not ( = ?auto_353258 ?auto_353259 ) ) ( not ( = ?auto_353258 ?auto_353260 ) ) ( not ( = ?auto_353259 ?auto_353260 ) ) ( ON ?auto_353258 ?auto_353259 ) ( ON ?auto_353257 ?auto_353258 ) ( ON ?auto_353256 ?auto_353257 ) ( ON ?auto_353255 ?auto_353256 ) ( ON ?auto_353254 ?auto_353255 ) ( ON ?auto_353253 ?auto_353254 ) ( ON ?auto_353252 ?auto_353253 ) ( ON ?auto_353251 ?auto_353252 ) ( CLEAR ?auto_353251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_353251 )
      ( MAKE-9PILE ?auto_353251 ?auto_353252 ?auto_353253 ?auto_353254 ?auto_353255 ?auto_353256 ?auto_353257 ?auto_353258 ?auto_353259 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353290 - BLOCK
      ?auto_353291 - BLOCK
      ?auto_353292 - BLOCK
      ?auto_353293 - BLOCK
      ?auto_353294 - BLOCK
      ?auto_353295 - BLOCK
      ?auto_353296 - BLOCK
      ?auto_353297 - BLOCK
      ?auto_353298 - BLOCK
      ?auto_353299 - BLOCK
    )
    :vars
    (
      ?auto_353300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_353298 ) ( ON ?auto_353299 ?auto_353300 ) ( CLEAR ?auto_353299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_353290 ) ( ON ?auto_353291 ?auto_353290 ) ( ON ?auto_353292 ?auto_353291 ) ( ON ?auto_353293 ?auto_353292 ) ( ON ?auto_353294 ?auto_353293 ) ( ON ?auto_353295 ?auto_353294 ) ( ON ?auto_353296 ?auto_353295 ) ( ON ?auto_353297 ?auto_353296 ) ( ON ?auto_353298 ?auto_353297 ) ( not ( = ?auto_353290 ?auto_353291 ) ) ( not ( = ?auto_353290 ?auto_353292 ) ) ( not ( = ?auto_353290 ?auto_353293 ) ) ( not ( = ?auto_353290 ?auto_353294 ) ) ( not ( = ?auto_353290 ?auto_353295 ) ) ( not ( = ?auto_353290 ?auto_353296 ) ) ( not ( = ?auto_353290 ?auto_353297 ) ) ( not ( = ?auto_353290 ?auto_353298 ) ) ( not ( = ?auto_353290 ?auto_353299 ) ) ( not ( = ?auto_353290 ?auto_353300 ) ) ( not ( = ?auto_353291 ?auto_353292 ) ) ( not ( = ?auto_353291 ?auto_353293 ) ) ( not ( = ?auto_353291 ?auto_353294 ) ) ( not ( = ?auto_353291 ?auto_353295 ) ) ( not ( = ?auto_353291 ?auto_353296 ) ) ( not ( = ?auto_353291 ?auto_353297 ) ) ( not ( = ?auto_353291 ?auto_353298 ) ) ( not ( = ?auto_353291 ?auto_353299 ) ) ( not ( = ?auto_353291 ?auto_353300 ) ) ( not ( = ?auto_353292 ?auto_353293 ) ) ( not ( = ?auto_353292 ?auto_353294 ) ) ( not ( = ?auto_353292 ?auto_353295 ) ) ( not ( = ?auto_353292 ?auto_353296 ) ) ( not ( = ?auto_353292 ?auto_353297 ) ) ( not ( = ?auto_353292 ?auto_353298 ) ) ( not ( = ?auto_353292 ?auto_353299 ) ) ( not ( = ?auto_353292 ?auto_353300 ) ) ( not ( = ?auto_353293 ?auto_353294 ) ) ( not ( = ?auto_353293 ?auto_353295 ) ) ( not ( = ?auto_353293 ?auto_353296 ) ) ( not ( = ?auto_353293 ?auto_353297 ) ) ( not ( = ?auto_353293 ?auto_353298 ) ) ( not ( = ?auto_353293 ?auto_353299 ) ) ( not ( = ?auto_353293 ?auto_353300 ) ) ( not ( = ?auto_353294 ?auto_353295 ) ) ( not ( = ?auto_353294 ?auto_353296 ) ) ( not ( = ?auto_353294 ?auto_353297 ) ) ( not ( = ?auto_353294 ?auto_353298 ) ) ( not ( = ?auto_353294 ?auto_353299 ) ) ( not ( = ?auto_353294 ?auto_353300 ) ) ( not ( = ?auto_353295 ?auto_353296 ) ) ( not ( = ?auto_353295 ?auto_353297 ) ) ( not ( = ?auto_353295 ?auto_353298 ) ) ( not ( = ?auto_353295 ?auto_353299 ) ) ( not ( = ?auto_353295 ?auto_353300 ) ) ( not ( = ?auto_353296 ?auto_353297 ) ) ( not ( = ?auto_353296 ?auto_353298 ) ) ( not ( = ?auto_353296 ?auto_353299 ) ) ( not ( = ?auto_353296 ?auto_353300 ) ) ( not ( = ?auto_353297 ?auto_353298 ) ) ( not ( = ?auto_353297 ?auto_353299 ) ) ( not ( = ?auto_353297 ?auto_353300 ) ) ( not ( = ?auto_353298 ?auto_353299 ) ) ( not ( = ?auto_353298 ?auto_353300 ) ) ( not ( = ?auto_353299 ?auto_353300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_353299 ?auto_353300 )
      ( !STACK ?auto_353299 ?auto_353298 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353332 - BLOCK
      ?auto_353333 - BLOCK
      ?auto_353334 - BLOCK
      ?auto_353335 - BLOCK
      ?auto_353336 - BLOCK
      ?auto_353337 - BLOCK
      ?auto_353338 - BLOCK
      ?auto_353339 - BLOCK
      ?auto_353340 - BLOCK
      ?auto_353341 - BLOCK
    )
    :vars
    (
      ?auto_353342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353341 ?auto_353342 ) ( ON-TABLE ?auto_353332 ) ( ON ?auto_353333 ?auto_353332 ) ( ON ?auto_353334 ?auto_353333 ) ( ON ?auto_353335 ?auto_353334 ) ( ON ?auto_353336 ?auto_353335 ) ( ON ?auto_353337 ?auto_353336 ) ( ON ?auto_353338 ?auto_353337 ) ( ON ?auto_353339 ?auto_353338 ) ( not ( = ?auto_353332 ?auto_353333 ) ) ( not ( = ?auto_353332 ?auto_353334 ) ) ( not ( = ?auto_353332 ?auto_353335 ) ) ( not ( = ?auto_353332 ?auto_353336 ) ) ( not ( = ?auto_353332 ?auto_353337 ) ) ( not ( = ?auto_353332 ?auto_353338 ) ) ( not ( = ?auto_353332 ?auto_353339 ) ) ( not ( = ?auto_353332 ?auto_353340 ) ) ( not ( = ?auto_353332 ?auto_353341 ) ) ( not ( = ?auto_353332 ?auto_353342 ) ) ( not ( = ?auto_353333 ?auto_353334 ) ) ( not ( = ?auto_353333 ?auto_353335 ) ) ( not ( = ?auto_353333 ?auto_353336 ) ) ( not ( = ?auto_353333 ?auto_353337 ) ) ( not ( = ?auto_353333 ?auto_353338 ) ) ( not ( = ?auto_353333 ?auto_353339 ) ) ( not ( = ?auto_353333 ?auto_353340 ) ) ( not ( = ?auto_353333 ?auto_353341 ) ) ( not ( = ?auto_353333 ?auto_353342 ) ) ( not ( = ?auto_353334 ?auto_353335 ) ) ( not ( = ?auto_353334 ?auto_353336 ) ) ( not ( = ?auto_353334 ?auto_353337 ) ) ( not ( = ?auto_353334 ?auto_353338 ) ) ( not ( = ?auto_353334 ?auto_353339 ) ) ( not ( = ?auto_353334 ?auto_353340 ) ) ( not ( = ?auto_353334 ?auto_353341 ) ) ( not ( = ?auto_353334 ?auto_353342 ) ) ( not ( = ?auto_353335 ?auto_353336 ) ) ( not ( = ?auto_353335 ?auto_353337 ) ) ( not ( = ?auto_353335 ?auto_353338 ) ) ( not ( = ?auto_353335 ?auto_353339 ) ) ( not ( = ?auto_353335 ?auto_353340 ) ) ( not ( = ?auto_353335 ?auto_353341 ) ) ( not ( = ?auto_353335 ?auto_353342 ) ) ( not ( = ?auto_353336 ?auto_353337 ) ) ( not ( = ?auto_353336 ?auto_353338 ) ) ( not ( = ?auto_353336 ?auto_353339 ) ) ( not ( = ?auto_353336 ?auto_353340 ) ) ( not ( = ?auto_353336 ?auto_353341 ) ) ( not ( = ?auto_353336 ?auto_353342 ) ) ( not ( = ?auto_353337 ?auto_353338 ) ) ( not ( = ?auto_353337 ?auto_353339 ) ) ( not ( = ?auto_353337 ?auto_353340 ) ) ( not ( = ?auto_353337 ?auto_353341 ) ) ( not ( = ?auto_353337 ?auto_353342 ) ) ( not ( = ?auto_353338 ?auto_353339 ) ) ( not ( = ?auto_353338 ?auto_353340 ) ) ( not ( = ?auto_353338 ?auto_353341 ) ) ( not ( = ?auto_353338 ?auto_353342 ) ) ( not ( = ?auto_353339 ?auto_353340 ) ) ( not ( = ?auto_353339 ?auto_353341 ) ) ( not ( = ?auto_353339 ?auto_353342 ) ) ( not ( = ?auto_353340 ?auto_353341 ) ) ( not ( = ?auto_353340 ?auto_353342 ) ) ( not ( = ?auto_353341 ?auto_353342 ) ) ( CLEAR ?auto_353339 ) ( ON ?auto_353340 ?auto_353341 ) ( CLEAR ?auto_353340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_353332 ?auto_353333 ?auto_353334 ?auto_353335 ?auto_353336 ?auto_353337 ?auto_353338 ?auto_353339 ?auto_353340 )
      ( MAKE-10PILE ?auto_353332 ?auto_353333 ?auto_353334 ?auto_353335 ?auto_353336 ?auto_353337 ?auto_353338 ?auto_353339 ?auto_353340 ?auto_353341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353374 - BLOCK
      ?auto_353375 - BLOCK
      ?auto_353376 - BLOCK
      ?auto_353377 - BLOCK
      ?auto_353378 - BLOCK
      ?auto_353379 - BLOCK
      ?auto_353380 - BLOCK
      ?auto_353381 - BLOCK
      ?auto_353382 - BLOCK
      ?auto_353383 - BLOCK
    )
    :vars
    (
      ?auto_353384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353383 ?auto_353384 ) ( ON-TABLE ?auto_353374 ) ( ON ?auto_353375 ?auto_353374 ) ( ON ?auto_353376 ?auto_353375 ) ( ON ?auto_353377 ?auto_353376 ) ( ON ?auto_353378 ?auto_353377 ) ( ON ?auto_353379 ?auto_353378 ) ( ON ?auto_353380 ?auto_353379 ) ( not ( = ?auto_353374 ?auto_353375 ) ) ( not ( = ?auto_353374 ?auto_353376 ) ) ( not ( = ?auto_353374 ?auto_353377 ) ) ( not ( = ?auto_353374 ?auto_353378 ) ) ( not ( = ?auto_353374 ?auto_353379 ) ) ( not ( = ?auto_353374 ?auto_353380 ) ) ( not ( = ?auto_353374 ?auto_353381 ) ) ( not ( = ?auto_353374 ?auto_353382 ) ) ( not ( = ?auto_353374 ?auto_353383 ) ) ( not ( = ?auto_353374 ?auto_353384 ) ) ( not ( = ?auto_353375 ?auto_353376 ) ) ( not ( = ?auto_353375 ?auto_353377 ) ) ( not ( = ?auto_353375 ?auto_353378 ) ) ( not ( = ?auto_353375 ?auto_353379 ) ) ( not ( = ?auto_353375 ?auto_353380 ) ) ( not ( = ?auto_353375 ?auto_353381 ) ) ( not ( = ?auto_353375 ?auto_353382 ) ) ( not ( = ?auto_353375 ?auto_353383 ) ) ( not ( = ?auto_353375 ?auto_353384 ) ) ( not ( = ?auto_353376 ?auto_353377 ) ) ( not ( = ?auto_353376 ?auto_353378 ) ) ( not ( = ?auto_353376 ?auto_353379 ) ) ( not ( = ?auto_353376 ?auto_353380 ) ) ( not ( = ?auto_353376 ?auto_353381 ) ) ( not ( = ?auto_353376 ?auto_353382 ) ) ( not ( = ?auto_353376 ?auto_353383 ) ) ( not ( = ?auto_353376 ?auto_353384 ) ) ( not ( = ?auto_353377 ?auto_353378 ) ) ( not ( = ?auto_353377 ?auto_353379 ) ) ( not ( = ?auto_353377 ?auto_353380 ) ) ( not ( = ?auto_353377 ?auto_353381 ) ) ( not ( = ?auto_353377 ?auto_353382 ) ) ( not ( = ?auto_353377 ?auto_353383 ) ) ( not ( = ?auto_353377 ?auto_353384 ) ) ( not ( = ?auto_353378 ?auto_353379 ) ) ( not ( = ?auto_353378 ?auto_353380 ) ) ( not ( = ?auto_353378 ?auto_353381 ) ) ( not ( = ?auto_353378 ?auto_353382 ) ) ( not ( = ?auto_353378 ?auto_353383 ) ) ( not ( = ?auto_353378 ?auto_353384 ) ) ( not ( = ?auto_353379 ?auto_353380 ) ) ( not ( = ?auto_353379 ?auto_353381 ) ) ( not ( = ?auto_353379 ?auto_353382 ) ) ( not ( = ?auto_353379 ?auto_353383 ) ) ( not ( = ?auto_353379 ?auto_353384 ) ) ( not ( = ?auto_353380 ?auto_353381 ) ) ( not ( = ?auto_353380 ?auto_353382 ) ) ( not ( = ?auto_353380 ?auto_353383 ) ) ( not ( = ?auto_353380 ?auto_353384 ) ) ( not ( = ?auto_353381 ?auto_353382 ) ) ( not ( = ?auto_353381 ?auto_353383 ) ) ( not ( = ?auto_353381 ?auto_353384 ) ) ( not ( = ?auto_353382 ?auto_353383 ) ) ( not ( = ?auto_353382 ?auto_353384 ) ) ( not ( = ?auto_353383 ?auto_353384 ) ) ( ON ?auto_353382 ?auto_353383 ) ( CLEAR ?auto_353380 ) ( ON ?auto_353381 ?auto_353382 ) ( CLEAR ?auto_353381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_353374 ?auto_353375 ?auto_353376 ?auto_353377 ?auto_353378 ?auto_353379 ?auto_353380 ?auto_353381 )
      ( MAKE-10PILE ?auto_353374 ?auto_353375 ?auto_353376 ?auto_353377 ?auto_353378 ?auto_353379 ?auto_353380 ?auto_353381 ?auto_353382 ?auto_353383 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353416 - BLOCK
      ?auto_353417 - BLOCK
      ?auto_353418 - BLOCK
      ?auto_353419 - BLOCK
      ?auto_353420 - BLOCK
      ?auto_353421 - BLOCK
      ?auto_353422 - BLOCK
      ?auto_353423 - BLOCK
      ?auto_353424 - BLOCK
      ?auto_353425 - BLOCK
    )
    :vars
    (
      ?auto_353426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353425 ?auto_353426 ) ( ON-TABLE ?auto_353416 ) ( ON ?auto_353417 ?auto_353416 ) ( ON ?auto_353418 ?auto_353417 ) ( ON ?auto_353419 ?auto_353418 ) ( ON ?auto_353420 ?auto_353419 ) ( ON ?auto_353421 ?auto_353420 ) ( not ( = ?auto_353416 ?auto_353417 ) ) ( not ( = ?auto_353416 ?auto_353418 ) ) ( not ( = ?auto_353416 ?auto_353419 ) ) ( not ( = ?auto_353416 ?auto_353420 ) ) ( not ( = ?auto_353416 ?auto_353421 ) ) ( not ( = ?auto_353416 ?auto_353422 ) ) ( not ( = ?auto_353416 ?auto_353423 ) ) ( not ( = ?auto_353416 ?auto_353424 ) ) ( not ( = ?auto_353416 ?auto_353425 ) ) ( not ( = ?auto_353416 ?auto_353426 ) ) ( not ( = ?auto_353417 ?auto_353418 ) ) ( not ( = ?auto_353417 ?auto_353419 ) ) ( not ( = ?auto_353417 ?auto_353420 ) ) ( not ( = ?auto_353417 ?auto_353421 ) ) ( not ( = ?auto_353417 ?auto_353422 ) ) ( not ( = ?auto_353417 ?auto_353423 ) ) ( not ( = ?auto_353417 ?auto_353424 ) ) ( not ( = ?auto_353417 ?auto_353425 ) ) ( not ( = ?auto_353417 ?auto_353426 ) ) ( not ( = ?auto_353418 ?auto_353419 ) ) ( not ( = ?auto_353418 ?auto_353420 ) ) ( not ( = ?auto_353418 ?auto_353421 ) ) ( not ( = ?auto_353418 ?auto_353422 ) ) ( not ( = ?auto_353418 ?auto_353423 ) ) ( not ( = ?auto_353418 ?auto_353424 ) ) ( not ( = ?auto_353418 ?auto_353425 ) ) ( not ( = ?auto_353418 ?auto_353426 ) ) ( not ( = ?auto_353419 ?auto_353420 ) ) ( not ( = ?auto_353419 ?auto_353421 ) ) ( not ( = ?auto_353419 ?auto_353422 ) ) ( not ( = ?auto_353419 ?auto_353423 ) ) ( not ( = ?auto_353419 ?auto_353424 ) ) ( not ( = ?auto_353419 ?auto_353425 ) ) ( not ( = ?auto_353419 ?auto_353426 ) ) ( not ( = ?auto_353420 ?auto_353421 ) ) ( not ( = ?auto_353420 ?auto_353422 ) ) ( not ( = ?auto_353420 ?auto_353423 ) ) ( not ( = ?auto_353420 ?auto_353424 ) ) ( not ( = ?auto_353420 ?auto_353425 ) ) ( not ( = ?auto_353420 ?auto_353426 ) ) ( not ( = ?auto_353421 ?auto_353422 ) ) ( not ( = ?auto_353421 ?auto_353423 ) ) ( not ( = ?auto_353421 ?auto_353424 ) ) ( not ( = ?auto_353421 ?auto_353425 ) ) ( not ( = ?auto_353421 ?auto_353426 ) ) ( not ( = ?auto_353422 ?auto_353423 ) ) ( not ( = ?auto_353422 ?auto_353424 ) ) ( not ( = ?auto_353422 ?auto_353425 ) ) ( not ( = ?auto_353422 ?auto_353426 ) ) ( not ( = ?auto_353423 ?auto_353424 ) ) ( not ( = ?auto_353423 ?auto_353425 ) ) ( not ( = ?auto_353423 ?auto_353426 ) ) ( not ( = ?auto_353424 ?auto_353425 ) ) ( not ( = ?auto_353424 ?auto_353426 ) ) ( not ( = ?auto_353425 ?auto_353426 ) ) ( ON ?auto_353424 ?auto_353425 ) ( ON ?auto_353423 ?auto_353424 ) ( CLEAR ?auto_353421 ) ( ON ?auto_353422 ?auto_353423 ) ( CLEAR ?auto_353422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_353416 ?auto_353417 ?auto_353418 ?auto_353419 ?auto_353420 ?auto_353421 ?auto_353422 )
      ( MAKE-10PILE ?auto_353416 ?auto_353417 ?auto_353418 ?auto_353419 ?auto_353420 ?auto_353421 ?auto_353422 ?auto_353423 ?auto_353424 ?auto_353425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353458 - BLOCK
      ?auto_353459 - BLOCK
      ?auto_353460 - BLOCK
      ?auto_353461 - BLOCK
      ?auto_353462 - BLOCK
      ?auto_353463 - BLOCK
      ?auto_353464 - BLOCK
      ?auto_353465 - BLOCK
      ?auto_353466 - BLOCK
      ?auto_353467 - BLOCK
    )
    :vars
    (
      ?auto_353468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353467 ?auto_353468 ) ( ON-TABLE ?auto_353458 ) ( ON ?auto_353459 ?auto_353458 ) ( ON ?auto_353460 ?auto_353459 ) ( ON ?auto_353461 ?auto_353460 ) ( ON ?auto_353462 ?auto_353461 ) ( not ( = ?auto_353458 ?auto_353459 ) ) ( not ( = ?auto_353458 ?auto_353460 ) ) ( not ( = ?auto_353458 ?auto_353461 ) ) ( not ( = ?auto_353458 ?auto_353462 ) ) ( not ( = ?auto_353458 ?auto_353463 ) ) ( not ( = ?auto_353458 ?auto_353464 ) ) ( not ( = ?auto_353458 ?auto_353465 ) ) ( not ( = ?auto_353458 ?auto_353466 ) ) ( not ( = ?auto_353458 ?auto_353467 ) ) ( not ( = ?auto_353458 ?auto_353468 ) ) ( not ( = ?auto_353459 ?auto_353460 ) ) ( not ( = ?auto_353459 ?auto_353461 ) ) ( not ( = ?auto_353459 ?auto_353462 ) ) ( not ( = ?auto_353459 ?auto_353463 ) ) ( not ( = ?auto_353459 ?auto_353464 ) ) ( not ( = ?auto_353459 ?auto_353465 ) ) ( not ( = ?auto_353459 ?auto_353466 ) ) ( not ( = ?auto_353459 ?auto_353467 ) ) ( not ( = ?auto_353459 ?auto_353468 ) ) ( not ( = ?auto_353460 ?auto_353461 ) ) ( not ( = ?auto_353460 ?auto_353462 ) ) ( not ( = ?auto_353460 ?auto_353463 ) ) ( not ( = ?auto_353460 ?auto_353464 ) ) ( not ( = ?auto_353460 ?auto_353465 ) ) ( not ( = ?auto_353460 ?auto_353466 ) ) ( not ( = ?auto_353460 ?auto_353467 ) ) ( not ( = ?auto_353460 ?auto_353468 ) ) ( not ( = ?auto_353461 ?auto_353462 ) ) ( not ( = ?auto_353461 ?auto_353463 ) ) ( not ( = ?auto_353461 ?auto_353464 ) ) ( not ( = ?auto_353461 ?auto_353465 ) ) ( not ( = ?auto_353461 ?auto_353466 ) ) ( not ( = ?auto_353461 ?auto_353467 ) ) ( not ( = ?auto_353461 ?auto_353468 ) ) ( not ( = ?auto_353462 ?auto_353463 ) ) ( not ( = ?auto_353462 ?auto_353464 ) ) ( not ( = ?auto_353462 ?auto_353465 ) ) ( not ( = ?auto_353462 ?auto_353466 ) ) ( not ( = ?auto_353462 ?auto_353467 ) ) ( not ( = ?auto_353462 ?auto_353468 ) ) ( not ( = ?auto_353463 ?auto_353464 ) ) ( not ( = ?auto_353463 ?auto_353465 ) ) ( not ( = ?auto_353463 ?auto_353466 ) ) ( not ( = ?auto_353463 ?auto_353467 ) ) ( not ( = ?auto_353463 ?auto_353468 ) ) ( not ( = ?auto_353464 ?auto_353465 ) ) ( not ( = ?auto_353464 ?auto_353466 ) ) ( not ( = ?auto_353464 ?auto_353467 ) ) ( not ( = ?auto_353464 ?auto_353468 ) ) ( not ( = ?auto_353465 ?auto_353466 ) ) ( not ( = ?auto_353465 ?auto_353467 ) ) ( not ( = ?auto_353465 ?auto_353468 ) ) ( not ( = ?auto_353466 ?auto_353467 ) ) ( not ( = ?auto_353466 ?auto_353468 ) ) ( not ( = ?auto_353467 ?auto_353468 ) ) ( ON ?auto_353466 ?auto_353467 ) ( ON ?auto_353465 ?auto_353466 ) ( ON ?auto_353464 ?auto_353465 ) ( CLEAR ?auto_353462 ) ( ON ?auto_353463 ?auto_353464 ) ( CLEAR ?auto_353463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_353458 ?auto_353459 ?auto_353460 ?auto_353461 ?auto_353462 ?auto_353463 )
      ( MAKE-10PILE ?auto_353458 ?auto_353459 ?auto_353460 ?auto_353461 ?auto_353462 ?auto_353463 ?auto_353464 ?auto_353465 ?auto_353466 ?auto_353467 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353500 - BLOCK
      ?auto_353501 - BLOCK
      ?auto_353502 - BLOCK
      ?auto_353503 - BLOCK
      ?auto_353504 - BLOCK
      ?auto_353505 - BLOCK
      ?auto_353506 - BLOCK
      ?auto_353507 - BLOCK
      ?auto_353508 - BLOCK
      ?auto_353509 - BLOCK
    )
    :vars
    (
      ?auto_353510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353509 ?auto_353510 ) ( ON-TABLE ?auto_353500 ) ( ON ?auto_353501 ?auto_353500 ) ( ON ?auto_353502 ?auto_353501 ) ( ON ?auto_353503 ?auto_353502 ) ( not ( = ?auto_353500 ?auto_353501 ) ) ( not ( = ?auto_353500 ?auto_353502 ) ) ( not ( = ?auto_353500 ?auto_353503 ) ) ( not ( = ?auto_353500 ?auto_353504 ) ) ( not ( = ?auto_353500 ?auto_353505 ) ) ( not ( = ?auto_353500 ?auto_353506 ) ) ( not ( = ?auto_353500 ?auto_353507 ) ) ( not ( = ?auto_353500 ?auto_353508 ) ) ( not ( = ?auto_353500 ?auto_353509 ) ) ( not ( = ?auto_353500 ?auto_353510 ) ) ( not ( = ?auto_353501 ?auto_353502 ) ) ( not ( = ?auto_353501 ?auto_353503 ) ) ( not ( = ?auto_353501 ?auto_353504 ) ) ( not ( = ?auto_353501 ?auto_353505 ) ) ( not ( = ?auto_353501 ?auto_353506 ) ) ( not ( = ?auto_353501 ?auto_353507 ) ) ( not ( = ?auto_353501 ?auto_353508 ) ) ( not ( = ?auto_353501 ?auto_353509 ) ) ( not ( = ?auto_353501 ?auto_353510 ) ) ( not ( = ?auto_353502 ?auto_353503 ) ) ( not ( = ?auto_353502 ?auto_353504 ) ) ( not ( = ?auto_353502 ?auto_353505 ) ) ( not ( = ?auto_353502 ?auto_353506 ) ) ( not ( = ?auto_353502 ?auto_353507 ) ) ( not ( = ?auto_353502 ?auto_353508 ) ) ( not ( = ?auto_353502 ?auto_353509 ) ) ( not ( = ?auto_353502 ?auto_353510 ) ) ( not ( = ?auto_353503 ?auto_353504 ) ) ( not ( = ?auto_353503 ?auto_353505 ) ) ( not ( = ?auto_353503 ?auto_353506 ) ) ( not ( = ?auto_353503 ?auto_353507 ) ) ( not ( = ?auto_353503 ?auto_353508 ) ) ( not ( = ?auto_353503 ?auto_353509 ) ) ( not ( = ?auto_353503 ?auto_353510 ) ) ( not ( = ?auto_353504 ?auto_353505 ) ) ( not ( = ?auto_353504 ?auto_353506 ) ) ( not ( = ?auto_353504 ?auto_353507 ) ) ( not ( = ?auto_353504 ?auto_353508 ) ) ( not ( = ?auto_353504 ?auto_353509 ) ) ( not ( = ?auto_353504 ?auto_353510 ) ) ( not ( = ?auto_353505 ?auto_353506 ) ) ( not ( = ?auto_353505 ?auto_353507 ) ) ( not ( = ?auto_353505 ?auto_353508 ) ) ( not ( = ?auto_353505 ?auto_353509 ) ) ( not ( = ?auto_353505 ?auto_353510 ) ) ( not ( = ?auto_353506 ?auto_353507 ) ) ( not ( = ?auto_353506 ?auto_353508 ) ) ( not ( = ?auto_353506 ?auto_353509 ) ) ( not ( = ?auto_353506 ?auto_353510 ) ) ( not ( = ?auto_353507 ?auto_353508 ) ) ( not ( = ?auto_353507 ?auto_353509 ) ) ( not ( = ?auto_353507 ?auto_353510 ) ) ( not ( = ?auto_353508 ?auto_353509 ) ) ( not ( = ?auto_353508 ?auto_353510 ) ) ( not ( = ?auto_353509 ?auto_353510 ) ) ( ON ?auto_353508 ?auto_353509 ) ( ON ?auto_353507 ?auto_353508 ) ( ON ?auto_353506 ?auto_353507 ) ( ON ?auto_353505 ?auto_353506 ) ( CLEAR ?auto_353503 ) ( ON ?auto_353504 ?auto_353505 ) ( CLEAR ?auto_353504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_353500 ?auto_353501 ?auto_353502 ?auto_353503 ?auto_353504 )
      ( MAKE-10PILE ?auto_353500 ?auto_353501 ?auto_353502 ?auto_353503 ?auto_353504 ?auto_353505 ?auto_353506 ?auto_353507 ?auto_353508 ?auto_353509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353542 - BLOCK
      ?auto_353543 - BLOCK
      ?auto_353544 - BLOCK
      ?auto_353545 - BLOCK
      ?auto_353546 - BLOCK
      ?auto_353547 - BLOCK
      ?auto_353548 - BLOCK
      ?auto_353549 - BLOCK
      ?auto_353550 - BLOCK
      ?auto_353551 - BLOCK
    )
    :vars
    (
      ?auto_353552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353551 ?auto_353552 ) ( ON-TABLE ?auto_353542 ) ( ON ?auto_353543 ?auto_353542 ) ( ON ?auto_353544 ?auto_353543 ) ( not ( = ?auto_353542 ?auto_353543 ) ) ( not ( = ?auto_353542 ?auto_353544 ) ) ( not ( = ?auto_353542 ?auto_353545 ) ) ( not ( = ?auto_353542 ?auto_353546 ) ) ( not ( = ?auto_353542 ?auto_353547 ) ) ( not ( = ?auto_353542 ?auto_353548 ) ) ( not ( = ?auto_353542 ?auto_353549 ) ) ( not ( = ?auto_353542 ?auto_353550 ) ) ( not ( = ?auto_353542 ?auto_353551 ) ) ( not ( = ?auto_353542 ?auto_353552 ) ) ( not ( = ?auto_353543 ?auto_353544 ) ) ( not ( = ?auto_353543 ?auto_353545 ) ) ( not ( = ?auto_353543 ?auto_353546 ) ) ( not ( = ?auto_353543 ?auto_353547 ) ) ( not ( = ?auto_353543 ?auto_353548 ) ) ( not ( = ?auto_353543 ?auto_353549 ) ) ( not ( = ?auto_353543 ?auto_353550 ) ) ( not ( = ?auto_353543 ?auto_353551 ) ) ( not ( = ?auto_353543 ?auto_353552 ) ) ( not ( = ?auto_353544 ?auto_353545 ) ) ( not ( = ?auto_353544 ?auto_353546 ) ) ( not ( = ?auto_353544 ?auto_353547 ) ) ( not ( = ?auto_353544 ?auto_353548 ) ) ( not ( = ?auto_353544 ?auto_353549 ) ) ( not ( = ?auto_353544 ?auto_353550 ) ) ( not ( = ?auto_353544 ?auto_353551 ) ) ( not ( = ?auto_353544 ?auto_353552 ) ) ( not ( = ?auto_353545 ?auto_353546 ) ) ( not ( = ?auto_353545 ?auto_353547 ) ) ( not ( = ?auto_353545 ?auto_353548 ) ) ( not ( = ?auto_353545 ?auto_353549 ) ) ( not ( = ?auto_353545 ?auto_353550 ) ) ( not ( = ?auto_353545 ?auto_353551 ) ) ( not ( = ?auto_353545 ?auto_353552 ) ) ( not ( = ?auto_353546 ?auto_353547 ) ) ( not ( = ?auto_353546 ?auto_353548 ) ) ( not ( = ?auto_353546 ?auto_353549 ) ) ( not ( = ?auto_353546 ?auto_353550 ) ) ( not ( = ?auto_353546 ?auto_353551 ) ) ( not ( = ?auto_353546 ?auto_353552 ) ) ( not ( = ?auto_353547 ?auto_353548 ) ) ( not ( = ?auto_353547 ?auto_353549 ) ) ( not ( = ?auto_353547 ?auto_353550 ) ) ( not ( = ?auto_353547 ?auto_353551 ) ) ( not ( = ?auto_353547 ?auto_353552 ) ) ( not ( = ?auto_353548 ?auto_353549 ) ) ( not ( = ?auto_353548 ?auto_353550 ) ) ( not ( = ?auto_353548 ?auto_353551 ) ) ( not ( = ?auto_353548 ?auto_353552 ) ) ( not ( = ?auto_353549 ?auto_353550 ) ) ( not ( = ?auto_353549 ?auto_353551 ) ) ( not ( = ?auto_353549 ?auto_353552 ) ) ( not ( = ?auto_353550 ?auto_353551 ) ) ( not ( = ?auto_353550 ?auto_353552 ) ) ( not ( = ?auto_353551 ?auto_353552 ) ) ( ON ?auto_353550 ?auto_353551 ) ( ON ?auto_353549 ?auto_353550 ) ( ON ?auto_353548 ?auto_353549 ) ( ON ?auto_353547 ?auto_353548 ) ( ON ?auto_353546 ?auto_353547 ) ( CLEAR ?auto_353544 ) ( ON ?auto_353545 ?auto_353546 ) ( CLEAR ?auto_353545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_353542 ?auto_353543 ?auto_353544 ?auto_353545 )
      ( MAKE-10PILE ?auto_353542 ?auto_353543 ?auto_353544 ?auto_353545 ?auto_353546 ?auto_353547 ?auto_353548 ?auto_353549 ?auto_353550 ?auto_353551 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353584 - BLOCK
      ?auto_353585 - BLOCK
      ?auto_353586 - BLOCK
      ?auto_353587 - BLOCK
      ?auto_353588 - BLOCK
      ?auto_353589 - BLOCK
      ?auto_353590 - BLOCK
      ?auto_353591 - BLOCK
      ?auto_353592 - BLOCK
      ?auto_353593 - BLOCK
    )
    :vars
    (
      ?auto_353594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353593 ?auto_353594 ) ( ON-TABLE ?auto_353584 ) ( ON ?auto_353585 ?auto_353584 ) ( not ( = ?auto_353584 ?auto_353585 ) ) ( not ( = ?auto_353584 ?auto_353586 ) ) ( not ( = ?auto_353584 ?auto_353587 ) ) ( not ( = ?auto_353584 ?auto_353588 ) ) ( not ( = ?auto_353584 ?auto_353589 ) ) ( not ( = ?auto_353584 ?auto_353590 ) ) ( not ( = ?auto_353584 ?auto_353591 ) ) ( not ( = ?auto_353584 ?auto_353592 ) ) ( not ( = ?auto_353584 ?auto_353593 ) ) ( not ( = ?auto_353584 ?auto_353594 ) ) ( not ( = ?auto_353585 ?auto_353586 ) ) ( not ( = ?auto_353585 ?auto_353587 ) ) ( not ( = ?auto_353585 ?auto_353588 ) ) ( not ( = ?auto_353585 ?auto_353589 ) ) ( not ( = ?auto_353585 ?auto_353590 ) ) ( not ( = ?auto_353585 ?auto_353591 ) ) ( not ( = ?auto_353585 ?auto_353592 ) ) ( not ( = ?auto_353585 ?auto_353593 ) ) ( not ( = ?auto_353585 ?auto_353594 ) ) ( not ( = ?auto_353586 ?auto_353587 ) ) ( not ( = ?auto_353586 ?auto_353588 ) ) ( not ( = ?auto_353586 ?auto_353589 ) ) ( not ( = ?auto_353586 ?auto_353590 ) ) ( not ( = ?auto_353586 ?auto_353591 ) ) ( not ( = ?auto_353586 ?auto_353592 ) ) ( not ( = ?auto_353586 ?auto_353593 ) ) ( not ( = ?auto_353586 ?auto_353594 ) ) ( not ( = ?auto_353587 ?auto_353588 ) ) ( not ( = ?auto_353587 ?auto_353589 ) ) ( not ( = ?auto_353587 ?auto_353590 ) ) ( not ( = ?auto_353587 ?auto_353591 ) ) ( not ( = ?auto_353587 ?auto_353592 ) ) ( not ( = ?auto_353587 ?auto_353593 ) ) ( not ( = ?auto_353587 ?auto_353594 ) ) ( not ( = ?auto_353588 ?auto_353589 ) ) ( not ( = ?auto_353588 ?auto_353590 ) ) ( not ( = ?auto_353588 ?auto_353591 ) ) ( not ( = ?auto_353588 ?auto_353592 ) ) ( not ( = ?auto_353588 ?auto_353593 ) ) ( not ( = ?auto_353588 ?auto_353594 ) ) ( not ( = ?auto_353589 ?auto_353590 ) ) ( not ( = ?auto_353589 ?auto_353591 ) ) ( not ( = ?auto_353589 ?auto_353592 ) ) ( not ( = ?auto_353589 ?auto_353593 ) ) ( not ( = ?auto_353589 ?auto_353594 ) ) ( not ( = ?auto_353590 ?auto_353591 ) ) ( not ( = ?auto_353590 ?auto_353592 ) ) ( not ( = ?auto_353590 ?auto_353593 ) ) ( not ( = ?auto_353590 ?auto_353594 ) ) ( not ( = ?auto_353591 ?auto_353592 ) ) ( not ( = ?auto_353591 ?auto_353593 ) ) ( not ( = ?auto_353591 ?auto_353594 ) ) ( not ( = ?auto_353592 ?auto_353593 ) ) ( not ( = ?auto_353592 ?auto_353594 ) ) ( not ( = ?auto_353593 ?auto_353594 ) ) ( ON ?auto_353592 ?auto_353593 ) ( ON ?auto_353591 ?auto_353592 ) ( ON ?auto_353590 ?auto_353591 ) ( ON ?auto_353589 ?auto_353590 ) ( ON ?auto_353588 ?auto_353589 ) ( ON ?auto_353587 ?auto_353588 ) ( CLEAR ?auto_353585 ) ( ON ?auto_353586 ?auto_353587 ) ( CLEAR ?auto_353586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_353584 ?auto_353585 ?auto_353586 )
      ( MAKE-10PILE ?auto_353584 ?auto_353585 ?auto_353586 ?auto_353587 ?auto_353588 ?auto_353589 ?auto_353590 ?auto_353591 ?auto_353592 ?auto_353593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353626 - BLOCK
      ?auto_353627 - BLOCK
      ?auto_353628 - BLOCK
      ?auto_353629 - BLOCK
      ?auto_353630 - BLOCK
      ?auto_353631 - BLOCK
      ?auto_353632 - BLOCK
      ?auto_353633 - BLOCK
      ?auto_353634 - BLOCK
      ?auto_353635 - BLOCK
    )
    :vars
    (
      ?auto_353636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353635 ?auto_353636 ) ( ON-TABLE ?auto_353626 ) ( not ( = ?auto_353626 ?auto_353627 ) ) ( not ( = ?auto_353626 ?auto_353628 ) ) ( not ( = ?auto_353626 ?auto_353629 ) ) ( not ( = ?auto_353626 ?auto_353630 ) ) ( not ( = ?auto_353626 ?auto_353631 ) ) ( not ( = ?auto_353626 ?auto_353632 ) ) ( not ( = ?auto_353626 ?auto_353633 ) ) ( not ( = ?auto_353626 ?auto_353634 ) ) ( not ( = ?auto_353626 ?auto_353635 ) ) ( not ( = ?auto_353626 ?auto_353636 ) ) ( not ( = ?auto_353627 ?auto_353628 ) ) ( not ( = ?auto_353627 ?auto_353629 ) ) ( not ( = ?auto_353627 ?auto_353630 ) ) ( not ( = ?auto_353627 ?auto_353631 ) ) ( not ( = ?auto_353627 ?auto_353632 ) ) ( not ( = ?auto_353627 ?auto_353633 ) ) ( not ( = ?auto_353627 ?auto_353634 ) ) ( not ( = ?auto_353627 ?auto_353635 ) ) ( not ( = ?auto_353627 ?auto_353636 ) ) ( not ( = ?auto_353628 ?auto_353629 ) ) ( not ( = ?auto_353628 ?auto_353630 ) ) ( not ( = ?auto_353628 ?auto_353631 ) ) ( not ( = ?auto_353628 ?auto_353632 ) ) ( not ( = ?auto_353628 ?auto_353633 ) ) ( not ( = ?auto_353628 ?auto_353634 ) ) ( not ( = ?auto_353628 ?auto_353635 ) ) ( not ( = ?auto_353628 ?auto_353636 ) ) ( not ( = ?auto_353629 ?auto_353630 ) ) ( not ( = ?auto_353629 ?auto_353631 ) ) ( not ( = ?auto_353629 ?auto_353632 ) ) ( not ( = ?auto_353629 ?auto_353633 ) ) ( not ( = ?auto_353629 ?auto_353634 ) ) ( not ( = ?auto_353629 ?auto_353635 ) ) ( not ( = ?auto_353629 ?auto_353636 ) ) ( not ( = ?auto_353630 ?auto_353631 ) ) ( not ( = ?auto_353630 ?auto_353632 ) ) ( not ( = ?auto_353630 ?auto_353633 ) ) ( not ( = ?auto_353630 ?auto_353634 ) ) ( not ( = ?auto_353630 ?auto_353635 ) ) ( not ( = ?auto_353630 ?auto_353636 ) ) ( not ( = ?auto_353631 ?auto_353632 ) ) ( not ( = ?auto_353631 ?auto_353633 ) ) ( not ( = ?auto_353631 ?auto_353634 ) ) ( not ( = ?auto_353631 ?auto_353635 ) ) ( not ( = ?auto_353631 ?auto_353636 ) ) ( not ( = ?auto_353632 ?auto_353633 ) ) ( not ( = ?auto_353632 ?auto_353634 ) ) ( not ( = ?auto_353632 ?auto_353635 ) ) ( not ( = ?auto_353632 ?auto_353636 ) ) ( not ( = ?auto_353633 ?auto_353634 ) ) ( not ( = ?auto_353633 ?auto_353635 ) ) ( not ( = ?auto_353633 ?auto_353636 ) ) ( not ( = ?auto_353634 ?auto_353635 ) ) ( not ( = ?auto_353634 ?auto_353636 ) ) ( not ( = ?auto_353635 ?auto_353636 ) ) ( ON ?auto_353634 ?auto_353635 ) ( ON ?auto_353633 ?auto_353634 ) ( ON ?auto_353632 ?auto_353633 ) ( ON ?auto_353631 ?auto_353632 ) ( ON ?auto_353630 ?auto_353631 ) ( ON ?auto_353629 ?auto_353630 ) ( ON ?auto_353628 ?auto_353629 ) ( CLEAR ?auto_353626 ) ( ON ?auto_353627 ?auto_353628 ) ( CLEAR ?auto_353627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_353626 ?auto_353627 )
      ( MAKE-10PILE ?auto_353626 ?auto_353627 ?auto_353628 ?auto_353629 ?auto_353630 ?auto_353631 ?auto_353632 ?auto_353633 ?auto_353634 ?auto_353635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_353668 - BLOCK
      ?auto_353669 - BLOCK
      ?auto_353670 - BLOCK
      ?auto_353671 - BLOCK
      ?auto_353672 - BLOCK
      ?auto_353673 - BLOCK
      ?auto_353674 - BLOCK
      ?auto_353675 - BLOCK
      ?auto_353676 - BLOCK
      ?auto_353677 - BLOCK
    )
    :vars
    (
      ?auto_353678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353677 ?auto_353678 ) ( not ( = ?auto_353668 ?auto_353669 ) ) ( not ( = ?auto_353668 ?auto_353670 ) ) ( not ( = ?auto_353668 ?auto_353671 ) ) ( not ( = ?auto_353668 ?auto_353672 ) ) ( not ( = ?auto_353668 ?auto_353673 ) ) ( not ( = ?auto_353668 ?auto_353674 ) ) ( not ( = ?auto_353668 ?auto_353675 ) ) ( not ( = ?auto_353668 ?auto_353676 ) ) ( not ( = ?auto_353668 ?auto_353677 ) ) ( not ( = ?auto_353668 ?auto_353678 ) ) ( not ( = ?auto_353669 ?auto_353670 ) ) ( not ( = ?auto_353669 ?auto_353671 ) ) ( not ( = ?auto_353669 ?auto_353672 ) ) ( not ( = ?auto_353669 ?auto_353673 ) ) ( not ( = ?auto_353669 ?auto_353674 ) ) ( not ( = ?auto_353669 ?auto_353675 ) ) ( not ( = ?auto_353669 ?auto_353676 ) ) ( not ( = ?auto_353669 ?auto_353677 ) ) ( not ( = ?auto_353669 ?auto_353678 ) ) ( not ( = ?auto_353670 ?auto_353671 ) ) ( not ( = ?auto_353670 ?auto_353672 ) ) ( not ( = ?auto_353670 ?auto_353673 ) ) ( not ( = ?auto_353670 ?auto_353674 ) ) ( not ( = ?auto_353670 ?auto_353675 ) ) ( not ( = ?auto_353670 ?auto_353676 ) ) ( not ( = ?auto_353670 ?auto_353677 ) ) ( not ( = ?auto_353670 ?auto_353678 ) ) ( not ( = ?auto_353671 ?auto_353672 ) ) ( not ( = ?auto_353671 ?auto_353673 ) ) ( not ( = ?auto_353671 ?auto_353674 ) ) ( not ( = ?auto_353671 ?auto_353675 ) ) ( not ( = ?auto_353671 ?auto_353676 ) ) ( not ( = ?auto_353671 ?auto_353677 ) ) ( not ( = ?auto_353671 ?auto_353678 ) ) ( not ( = ?auto_353672 ?auto_353673 ) ) ( not ( = ?auto_353672 ?auto_353674 ) ) ( not ( = ?auto_353672 ?auto_353675 ) ) ( not ( = ?auto_353672 ?auto_353676 ) ) ( not ( = ?auto_353672 ?auto_353677 ) ) ( not ( = ?auto_353672 ?auto_353678 ) ) ( not ( = ?auto_353673 ?auto_353674 ) ) ( not ( = ?auto_353673 ?auto_353675 ) ) ( not ( = ?auto_353673 ?auto_353676 ) ) ( not ( = ?auto_353673 ?auto_353677 ) ) ( not ( = ?auto_353673 ?auto_353678 ) ) ( not ( = ?auto_353674 ?auto_353675 ) ) ( not ( = ?auto_353674 ?auto_353676 ) ) ( not ( = ?auto_353674 ?auto_353677 ) ) ( not ( = ?auto_353674 ?auto_353678 ) ) ( not ( = ?auto_353675 ?auto_353676 ) ) ( not ( = ?auto_353675 ?auto_353677 ) ) ( not ( = ?auto_353675 ?auto_353678 ) ) ( not ( = ?auto_353676 ?auto_353677 ) ) ( not ( = ?auto_353676 ?auto_353678 ) ) ( not ( = ?auto_353677 ?auto_353678 ) ) ( ON ?auto_353676 ?auto_353677 ) ( ON ?auto_353675 ?auto_353676 ) ( ON ?auto_353674 ?auto_353675 ) ( ON ?auto_353673 ?auto_353674 ) ( ON ?auto_353672 ?auto_353673 ) ( ON ?auto_353671 ?auto_353672 ) ( ON ?auto_353670 ?auto_353671 ) ( ON ?auto_353669 ?auto_353670 ) ( ON ?auto_353668 ?auto_353669 ) ( CLEAR ?auto_353668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_353668 )
      ( MAKE-10PILE ?auto_353668 ?auto_353669 ?auto_353670 ?auto_353671 ?auto_353672 ?auto_353673 ?auto_353674 ?auto_353675 ?auto_353676 ?auto_353677 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353711 - BLOCK
      ?auto_353712 - BLOCK
      ?auto_353713 - BLOCK
      ?auto_353714 - BLOCK
      ?auto_353715 - BLOCK
      ?auto_353716 - BLOCK
      ?auto_353717 - BLOCK
      ?auto_353718 - BLOCK
      ?auto_353719 - BLOCK
      ?auto_353720 - BLOCK
      ?auto_353721 - BLOCK
    )
    :vars
    (
      ?auto_353722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_353720 ) ( ON ?auto_353721 ?auto_353722 ) ( CLEAR ?auto_353721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_353711 ) ( ON ?auto_353712 ?auto_353711 ) ( ON ?auto_353713 ?auto_353712 ) ( ON ?auto_353714 ?auto_353713 ) ( ON ?auto_353715 ?auto_353714 ) ( ON ?auto_353716 ?auto_353715 ) ( ON ?auto_353717 ?auto_353716 ) ( ON ?auto_353718 ?auto_353717 ) ( ON ?auto_353719 ?auto_353718 ) ( ON ?auto_353720 ?auto_353719 ) ( not ( = ?auto_353711 ?auto_353712 ) ) ( not ( = ?auto_353711 ?auto_353713 ) ) ( not ( = ?auto_353711 ?auto_353714 ) ) ( not ( = ?auto_353711 ?auto_353715 ) ) ( not ( = ?auto_353711 ?auto_353716 ) ) ( not ( = ?auto_353711 ?auto_353717 ) ) ( not ( = ?auto_353711 ?auto_353718 ) ) ( not ( = ?auto_353711 ?auto_353719 ) ) ( not ( = ?auto_353711 ?auto_353720 ) ) ( not ( = ?auto_353711 ?auto_353721 ) ) ( not ( = ?auto_353711 ?auto_353722 ) ) ( not ( = ?auto_353712 ?auto_353713 ) ) ( not ( = ?auto_353712 ?auto_353714 ) ) ( not ( = ?auto_353712 ?auto_353715 ) ) ( not ( = ?auto_353712 ?auto_353716 ) ) ( not ( = ?auto_353712 ?auto_353717 ) ) ( not ( = ?auto_353712 ?auto_353718 ) ) ( not ( = ?auto_353712 ?auto_353719 ) ) ( not ( = ?auto_353712 ?auto_353720 ) ) ( not ( = ?auto_353712 ?auto_353721 ) ) ( not ( = ?auto_353712 ?auto_353722 ) ) ( not ( = ?auto_353713 ?auto_353714 ) ) ( not ( = ?auto_353713 ?auto_353715 ) ) ( not ( = ?auto_353713 ?auto_353716 ) ) ( not ( = ?auto_353713 ?auto_353717 ) ) ( not ( = ?auto_353713 ?auto_353718 ) ) ( not ( = ?auto_353713 ?auto_353719 ) ) ( not ( = ?auto_353713 ?auto_353720 ) ) ( not ( = ?auto_353713 ?auto_353721 ) ) ( not ( = ?auto_353713 ?auto_353722 ) ) ( not ( = ?auto_353714 ?auto_353715 ) ) ( not ( = ?auto_353714 ?auto_353716 ) ) ( not ( = ?auto_353714 ?auto_353717 ) ) ( not ( = ?auto_353714 ?auto_353718 ) ) ( not ( = ?auto_353714 ?auto_353719 ) ) ( not ( = ?auto_353714 ?auto_353720 ) ) ( not ( = ?auto_353714 ?auto_353721 ) ) ( not ( = ?auto_353714 ?auto_353722 ) ) ( not ( = ?auto_353715 ?auto_353716 ) ) ( not ( = ?auto_353715 ?auto_353717 ) ) ( not ( = ?auto_353715 ?auto_353718 ) ) ( not ( = ?auto_353715 ?auto_353719 ) ) ( not ( = ?auto_353715 ?auto_353720 ) ) ( not ( = ?auto_353715 ?auto_353721 ) ) ( not ( = ?auto_353715 ?auto_353722 ) ) ( not ( = ?auto_353716 ?auto_353717 ) ) ( not ( = ?auto_353716 ?auto_353718 ) ) ( not ( = ?auto_353716 ?auto_353719 ) ) ( not ( = ?auto_353716 ?auto_353720 ) ) ( not ( = ?auto_353716 ?auto_353721 ) ) ( not ( = ?auto_353716 ?auto_353722 ) ) ( not ( = ?auto_353717 ?auto_353718 ) ) ( not ( = ?auto_353717 ?auto_353719 ) ) ( not ( = ?auto_353717 ?auto_353720 ) ) ( not ( = ?auto_353717 ?auto_353721 ) ) ( not ( = ?auto_353717 ?auto_353722 ) ) ( not ( = ?auto_353718 ?auto_353719 ) ) ( not ( = ?auto_353718 ?auto_353720 ) ) ( not ( = ?auto_353718 ?auto_353721 ) ) ( not ( = ?auto_353718 ?auto_353722 ) ) ( not ( = ?auto_353719 ?auto_353720 ) ) ( not ( = ?auto_353719 ?auto_353721 ) ) ( not ( = ?auto_353719 ?auto_353722 ) ) ( not ( = ?auto_353720 ?auto_353721 ) ) ( not ( = ?auto_353720 ?auto_353722 ) ) ( not ( = ?auto_353721 ?auto_353722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_353721 ?auto_353722 )
      ( !STACK ?auto_353721 ?auto_353720 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353757 - BLOCK
      ?auto_353758 - BLOCK
      ?auto_353759 - BLOCK
      ?auto_353760 - BLOCK
      ?auto_353761 - BLOCK
      ?auto_353762 - BLOCK
      ?auto_353763 - BLOCK
      ?auto_353764 - BLOCK
      ?auto_353765 - BLOCK
      ?auto_353766 - BLOCK
      ?auto_353767 - BLOCK
    )
    :vars
    (
      ?auto_353768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353767 ?auto_353768 ) ( ON-TABLE ?auto_353757 ) ( ON ?auto_353758 ?auto_353757 ) ( ON ?auto_353759 ?auto_353758 ) ( ON ?auto_353760 ?auto_353759 ) ( ON ?auto_353761 ?auto_353760 ) ( ON ?auto_353762 ?auto_353761 ) ( ON ?auto_353763 ?auto_353762 ) ( ON ?auto_353764 ?auto_353763 ) ( ON ?auto_353765 ?auto_353764 ) ( not ( = ?auto_353757 ?auto_353758 ) ) ( not ( = ?auto_353757 ?auto_353759 ) ) ( not ( = ?auto_353757 ?auto_353760 ) ) ( not ( = ?auto_353757 ?auto_353761 ) ) ( not ( = ?auto_353757 ?auto_353762 ) ) ( not ( = ?auto_353757 ?auto_353763 ) ) ( not ( = ?auto_353757 ?auto_353764 ) ) ( not ( = ?auto_353757 ?auto_353765 ) ) ( not ( = ?auto_353757 ?auto_353766 ) ) ( not ( = ?auto_353757 ?auto_353767 ) ) ( not ( = ?auto_353757 ?auto_353768 ) ) ( not ( = ?auto_353758 ?auto_353759 ) ) ( not ( = ?auto_353758 ?auto_353760 ) ) ( not ( = ?auto_353758 ?auto_353761 ) ) ( not ( = ?auto_353758 ?auto_353762 ) ) ( not ( = ?auto_353758 ?auto_353763 ) ) ( not ( = ?auto_353758 ?auto_353764 ) ) ( not ( = ?auto_353758 ?auto_353765 ) ) ( not ( = ?auto_353758 ?auto_353766 ) ) ( not ( = ?auto_353758 ?auto_353767 ) ) ( not ( = ?auto_353758 ?auto_353768 ) ) ( not ( = ?auto_353759 ?auto_353760 ) ) ( not ( = ?auto_353759 ?auto_353761 ) ) ( not ( = ?auto_353759 ?auto_353762 ) ) ( not ( = ?auto_353759 ?auto_353763 ) ) ( not ( = ?auto_353759 ?auto_353764 ) ) ( not ( = ?auto_353759 ?auto_353765 ) ) ( not ( = ?auto_353759 ?auto_353766 ) ) ( not ( = ?auto_353759 ?auto_353767 ) ) ( not ( = ?auto_353759 ?auto_353768 ) ) ( not ( = ?auto_353760 ?auto_353761 ) ) ( not ( = ?auto_353760 ?auto_353762 ) ) ( not ( = ?auto_353760 ?auto_353763 ) ) ( not ( = ?auto_353760 ?auto_353764 ) ) ( not ( = ?auto_353760 ?auto_353765 ) ) ( not ( = ?auto_353760 ?auto_353766 ) ) ( not ( = ?auto_353760 ?auto_353767 ) ) ( not ( = ?auto_353760 ?auto_353768 ) ) ( not ( = ?auto_353761 ?auto_353762 ) ) ( not ( = ?auto_353761 ?auto_353763 ) ) ( not ( = ?auto_353761 ?auto_353764 ) ) ( not ( = ?auto_353761 ?auto_353765 ) ) ( not ( = ?auto_353761 ?auto_353766 ) ) ( not ( = ?auto_353761 ?auto_353767 ) ) ( not ( = ?auto_353761 ?auto_353768 ) ) ( not ( = ?auto_353762 ?auto_353763 ) ) ( not ( = ?auto_353762 ?auto_353764 ) ) ( not ( = ?auto_353762 ?auto_353765 ) ) ( not ( = ?auto_353762 ?auto_353766 ) ) ( not ( = ?auto_353762 ?auto_353767 ) ) ( not ( = ?auto_353762 ?auto_353768 ) ) ( not ( = ?auto_353763 ?auto_353764 ) ) ( not ( = ?auto_353763 ?auto_353765 ) ) ( not ( = ?auto_353763 ?auto_353766 ) ) ( not ( = ?auto_353763 ?auto_353767 ) ) ( not ( = ?auto_353763 ?auto_353768 ) ) ( not ( = ?auto_353764 ?auto_353765 ) ) ( not ( = ?auto_353764 ?auto_353766 ) ) ( not ( = ?auto_353764 ?auto_353767 ) ) ( not ( = ?auto_353764 ?auto_353768 ) ) ( not ( = ?auto_353765 ?auto_353766 ) ) ( not ( = ?auto_353765 ?auto_353767 ) ) ( not ( = ?auto_353765 ?auto_353768 ) ) ( not ( = ?auto_353766 ?auto_353767 ) ) ( not ( = ?auto_353766 ?auto_353768 ) ) ( not ( = ?auto_353767 ?auto_353768 ) ) ( CLEAR ?auto_353765 ) ( ON ?auto_353766 ?auto_353767 ) ( CLEAR ?auto_353766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_353757 ?auto_353758 ?auto_353759 ?auto_353760 ?auto_353761 ?auto_353762 ?auto_353763 ?auto_353764 ?auto_353765 ?auto_353766 )
      ( MAKE-11PILE ?auto_353757 ?auto_353758 ?auto_353759 ?auto_353760 ?auto_353761 ?auto_353762 ?auto_353763 ?auto_353764 ?auto_353765 ?auto_353766 ?auto_353767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353803 - BLOCK
      ?auto_353804 - BLOCK
      ?auto_353805 - BLOCK
      ?auto_353806 - BLOCK
      ?auto_353807 - BLOCK
      ?auto_353808 - BLOCK
      ?auto_353809 - BLOCK
      ?auto_353810 - BLOCK
      ?auto_353811 - BLOCK
      ?auto_353812 - BLOCK
      ?auto_353813 - BLOCK
    )
    :vars
    (
      ?auto_353814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353813 ?auto_353814 ) ( ON-TABLE ?auto_353803 ) ( ON ?auto_353804 ?auto_353803 ) ( ON ?auto_353805 ?auto_353804 ) ( ON ?auto_353806 ?auto_353805 ) ( ON ?auto_353807 ?auto_353806 ) ( ON ?auto_353808 ?auto_353807 ) ( ON ?auto_353809 ?auto_353808 ) ( ON ?auto_353810 ?auto_353809 ) ( not ( = ?auto_353803 ?auto_353804 ) ) ( not ( = ?auto_353803 ?auto_353805 ) ) ( not ( = ?auto_353803 ?auto_353806 ) ) ( not ( = ?auto_353803 ?auto_353807 ) ) ( not ( = ?auto_353803 ?auto_353808 ) ) ( not ( = ?auto_353803 ?auto_353809 ) ) ( not ( = ?auto_353803 ?auto_353810 ) ) ( not ( = ?auto_353803 ?auto_353811 ) ) ( not ( = ?auto_353803 ?auto_353812 ) ) ( not ( = ?auto_353803 ?auto_353813 ) ) ( not ( = ?auto_353803 ?auto_353814 ) ) ( not ( = ?auto_353804 ?auto_353805 ) ) ( not ( = ?auto_353804 ?auto_353806 ) ) ( not ( = ?auto_353804 ?auto_353807 ) ) ( not ( = ?auto_353804 ?auto_353808 ) ) ( not ( = ?auto_353804 ?auto_353809 ) ) ( not ( = ?auto_353804 ?auto_353810 ) ) ( not ( = ?auto_353804 ?auto_353811 ) ) ( not ( = ?auto_353804 ?auto_353812 ) ) ( not ( = ?auto_353804 ?auto_353813 ) ) ( not ( = ?auto_353804 ?auto_353814 ) ) ( not ( = ?auto_353805 ?auto_353806 ) ) ( not ( = ?auto_353805 ?auto_353807 ) ) ( not ( = ?auto_353805 ?auto_353808 ) ) ( not ( = ?auto_353805 ?auto_353809 ) ) ( not ( = ?auto_353805 ?auto_353810 ) ) ( not ( = ?auto_353805 ?auto_353811 ) ) ( not ( = ?auto_353805 ?auto_353812 ) ) ( not ( = ?auto_353805 ?auto_353813 ) ) ( not ( = ?auto_353805 ?auto_353814 ) ) ( not ( = ?auto_353806 ?auto_353807 ) ) ( not ( = ?auto_353806 ?auto_353808 ) ) ( not ( = ?auto_353806 ?auto_353809 ) ) ( not ( = ?auto_353806 ?auto_353810 ) ) ( not ( = ?auto_353806 ?auto_353811 ) ) ( not ( = ?auto_353806 ?auto_353812 ) ) ( not ( = ?auto_353806 ?auto_353813 ) ) ( not ( = ?auto_353806 ?auto_353814 ) ) ( not ( = ?auto_353807 ?auto_353808 ) ) ( not ( = ?auto_353807 ?auto_353809 ) ) ( not ( = ?auto_353807 ?auto_353810 ) ) ( not ( = ?auto_353807 ?auto_353811 ) ) ( not ( = ?auto_353807 ?auto_353812 ) ) ( not ( = ?auto_353807 ?auto_353813 ) ) ( not ( = ?auto_353807 ?auto_353814 ) ) ( not ( = ?auto_353808 ?auto_353809 ) ) ( not ( = ?auto_353808 ?auto_353810 ) ) ( not ( = ?auto_353808 ?auto_353811 ) ) ( not ( = ?auto_353808 ?auto_353812 ) ) ( not ( = ?auto_353808 ?auto_353813 ) ) ( not ( = ?auto_353808 ?auto_353814 ) ) ( not ( = ?auto_353809 ?auto_353810 ) ) ( not ( = ?auto_353809 ?auto_353811 ) ) ( not ( = ?auto_353809 ?auto_353812 ) ) ( not ( = ?auto_353809 ?auto_353813 ) ) ( not ( = ?auto_353809 ?auto_353814 ) ) ( not ( = ?auto_353810 ?auto_353811 ) ) ( not ( = ?auto_353810 ?auto_353812 ) ) ( not ( = ?auto_353810 ?auto_353813 ) ) ( not ( = ?auto_353810 ?auto_353814 ) ) ( not ( = ?auto_353811 ?auto_353812 ) ) ( not ( = ?auto_353811 ?auto_353813 ) ) ( not ( = ?auto_353811 ?auto_353814 ) ) ( not ( = ?auto_353812 ?auto_353813 ) ) ( not ( = ?auto_353812 ?auto_353814 ) ) ( not ( = ?auto_353813 ?auto_353814 ) ) ( ON ?auto_353812 ?auto_353813 ) ( CLEAR ?auto_353810 ) ( ON ?auto_353811 ?auto_353812 ) ( CLEAR ?auto_353811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_353803 ?auto_353804 ?auto_353805 ?auto_353806 ?auto_353807 ?auto_353808 ?auto_353809 ?auto_353810 ?auto_353811 )
      ( MAKE-11PILE ?auto_353803 ?auto_353804 ?auto_353805 ?auto_353806 ?auto_353807 ?auto_353808 ?auto_353809 ?auto_353810 ?auto_353811 ?auto_353812 ?auto_353813 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353849 - BLOCK
      ?auto_353850 - BLOCK
      ?auto_353851 - BLOCK
      ?auto_353852 - BLOCK
      ?auto_353853 - BLOCK
      ?auto_353854 - BLOCK
      ?auto_353855 - BLOCK
      ?auto_353856 - BLOCK
      ?auto_353857 - BLOCK
      ?auto_353858 - BLOCK
      ?auto_353859 - BLOCK
    )
    :vars
    (
      ?auto_353860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353859 ?auto_353860 ) ( ON-TABLE ?auto_353849 ) ( ON ?auto_353850 ?auto_353849 ) ( ON ?auto_353851 ?auto_353850 ) ( ON ?auto_353852 ?auto_353851 ) ( ON ?auto_353853 ?auto_353852 ) ( ON ?auto_353854 ?auto_353853 ) ( ON ?auto_353855 ?auto_353854 ) ( not ( = ?auto_353849 ?auto_353850 ) ) ( not ( = ?auto_353849 ?auto_353851 ) ) ( not ( = ?auto_353849 ?auto_353852 ) ) ( not ( = ?auto_353849 ?auto_353853 ) ) ( not ( = ?auto_353849 ?auto_353854 ) ) ( not ( = ?auto_353849 ?auto_353855 ) ) ( not ( = ?auto_353849 ?auto_353856 ) ) ( not ( = ?auto_353849 ?auto_353857 ) ) ( not ( = ?auto_353849 ?auto_353858 ) ) ( not ( = ?auto_353849 ?auto_353859 ) ) ( not ( = ?auto_353849 ?auto_353860 ) ) ( not ( = ?auto_353850 ?auto_353851 ) ) ( not ( = ?auto_353850 ?auto_353852 ) ) ( not ( = ?auto_353850 ?auto_353853 ) ) ( not ( = ?auto_353850 ?auto_353854 ) ) ( not ( = ?auto_353850 ?auto_353855 ) ) ( not ( = ?auto_353850 ?auto_353856 ) ) ( not ( = ?auto_353850 ?auto_353857 ) ) ( not ( = ?auto_353850 ?auto_353858 ) ) ( not ( = ?auto_353850 ?auto_353859 ) ) ( not ( = ?auto_353850 ?auto_353860 ) ) ( not ( = ?auto_353851 ?auto_353852 ) ) ( not ( = ?auto_353851 ?auto_353853 ) ) ( not ( = ?auto_353851 ?auto_353854 ) ) ( not ( = ?auto_353851 ?auto_353855 ) ) ( not ( = ?auto_353851 ?auto_353856 ) ) ( not ( = ?auto_353851 ?auto_353857 ) ) ( not ( = ?auto_353851 ?auto_353858 ) ) ( not ( = ?auto_353851 ?auto_353859 ) ) ( not ( = ?auto_353851 ?auto_353860 ) ) ( not ( = ?auto_353852 ?auto_353853 ) ) ( not ( = ?auto_353852 ?auto_353854 ) ) ( not ( = ?auto_353852 ?auto_353855 ) ) ( not ( = ?auto_353852 ?auto_353856 ) ) ( not ( = ?auto_353852 ?auto_353857 ) ) ( not ( = ?auto_353852 ?auto_353858 ) ) ( not ( = ?auto_353852 ?auto_353859 ) ) ( not ( = ?auto_353852 ?auto_353860 ) ) ( not ( = ?auto_353853 ?auto_353854 ) ) ( not ( = ?auto_353853 ?auto_353855 ) ) ( not ( = ?auto_353853 ?auto_353856 ) ) ( not ( = ?auto_353853 ?auto_353857 ) ) ( not ( = ?auto_353853 ?auto_353858 ) ) ( not ( = ?auto_353853 ?auto_353859 ) ) ( not ( = ?auto_353853 ?auto_353860 ) ) ( not ( = ?auto_353854 ?auto_353855 ) ) ( not ( = ?auto_353854 ?auto_353856 ) ) ( not ( = ?auto_353854 ?auto_353857 ) ) ( not ( = ?auto_353854 ?auto_353858 ) ) ( not ( = ?auto_353854 ?auto_353859 ) ) ( not ( = ?auto_353854 ?auto_353860 ) ) ( not ( = ?auto_353855 ?auto_353856 ) ) ( not ( = ?auto_353855 ?auto_353857 ) ) ( not ( = ?auto_353855 ?auto_353858 ) ) ( not ( = ?auto_353855 ?auto_353859 ) ) ( not ( = ?auto_353855 ?auto_353860 ) ) ( not ( = ?auto_353856 ?auto_353857 ) ) ( not ( = ?auto_353856 ?auto_353858 ) ) ( not ( = ?auto_353856 ?auto_353859 ) ) ( not ( = ?auto_353856 ?auto_353860 ) ) ( not ( = ?auto_353857 ?auto_353858 ) ) ( not ( = ?auto_353857 ?auto_353859 ) ) ( not ( = ?auto_353857 ?auto_353860 ) ) ( not ( = ?auto_353858 ?auto_353859 ) ) ( not ( = ?auto_353858 ?auto_353860 ) ) ( not ( = ?auto_353859 ?auto_353860 ) ) ( ON ?auto_353858 ?auto_353859 ) ( ON ?auto_353857 ?auto_353858 ) ( CLEAR ?auto_353855 ) ( ON ?auto_353856 ?auto_353857 ) ( CLEAR ?auto_353856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_353849 ?auto_353850 ?auto_353851 ?auto_353852 ?auto_353853 ?auto_353854 ?auto_353855 ?auto_353856 )
      ( MAKE-11PILE ?auto_353849 ?auto_353850 ?auto_353851 ?auto_353852 ?auto_353853 ?auto_353854 ?auto_353855 ?auto_353856 ?auto_353857 ?auto_353858 ?auto_353859 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353895 - BLOCK
      ?auto_353896 - BLOCK
      ?auto_353897 - BLOCK
      ?auto_353898 - BLOCK
      ?auto_353899 - BLOCK
      ?auto_353900 - BLOCK
      ?auto_353901 - BLOCK
      ?auto_353902 - BLOCK
      ?auto_353903 - BLOCK
      ?auto_353904 - BLOCK
      ?auto_353905 - BLOCK
    )
    :vars
    (
      ?auto_353906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353905 ?auto_353906 ) ( ON-TABLE ?auto_353895 ) ( ON ?auto_353896 ?auto_353895 ) ( ON ?auto_353897 ?auto_353896 ) ( ON ?auto_353898 ?auto_353897 ) ( ON ?auto_353899 ?auto_353898 ) ( ON ?auto_353900 ?auto_353899 ) ( not ( = ?auto_353895 ?auto_353896 ) ) ( not ( = ?auto_353895 ?auto_353897 ) ) ( not ( = ?auto_353895 ?auto_353898 ) ) ( not ( = ?auto_353895 ?auto_353899 ) ) ( not ( = ?auto_353895 ?auto_353900 ) ) ( not ( = ?auto_353895 ?auto_353901 ) ) ( not ( = ?auto_353895 ?auto_353902 ) ) ( not ( = ?auto_353895 ?auto_353903 ) ) ( not ( = ?auto_353895 ?auto_353904 ) ) ( not ( = ?auto_353895 ?auto_353905 ) ) ( not ( = ?auto_353895 ?auto_353906 ) ) ( not ( = ?auto_353896 ?auto_353897 ) ) ( not ( = ?auto_353896 ?auto_353898 ) ) ( not ( = ?auto_353896 ?auto_353899 ) ) ( not ( = ?auto_353896 ?auto_353900 ) ) ( not ( = ?auto_353896 ?auto_353901 ) ) ( not ( = ?auto_353896 ?auto_353902 ) ) ( not ( = ?auto_353896 ?auto_353903 ) ) ( not ( = ?auto_353896 ?auto_353904 ) ) ( not ( = ?auto_353896 ?auto_353905 ) ) ( not ( = ?auto_353896 ?auto_353906 ) ) ( not ( = ?auto_353897 ?auto_353898 ) ) ( not ( = ?auto_353897 ?auto_353899 ) ) ( not ( = ?auto_353897 ?auto_353900 ) ) ( not ( = ?auto_353897 ?auto_353901 ) ) ( not ( = ?auto_353897 ?auto_353902 ) ) ( not ( = ?auto_353897 ?auto_353903 ) ) ( not ( = ?auto_353897 ?auto_353904 ) ) ( not ( = ?auto_353897 ?auto_353905 ) ) ( not ( = ?auto_353897 ?auto_353906 ) ) ( not ( = ?auto_353898 ?auto_353899 ) ) ( not ( = ?auto_353898 ?auto_353900 ) ) ( not ( = ?auto_353898 ?auto_353901 ) ) ( not ( = ?auto_353898 ?auto_353902 ) ) ( not ( = ?auto_353898 ?auto_353903 ) ) ( not ( = ?auto_353898 ?auto_353904 ) ) ( not ( = ?auto_353898 ?auto_353905 ) ) ( not ( = ?auto_353898 ?auto_353906 ) ) ( not ( = ?auto_353899 ?auto_353900 ) ) ( not ( = ?auto_353899 ?auto_353901 ) ) ( not ( = ?auto_353899 ?auto_353902 ) ) ( not ( = ?auto_353899 ?auto_353903 ) ) ( not ( = ?auto_353899 ?auto_353904 ) ) ( not ( = ?auto_353899 ?auto_353905 ) ) ( not ( = ?auto_353899 ?auto_353906 ) ) ( not ( = ?auto_353900 ?auto_353901 ) ) ( not ( = ?auto_353900 ?auto_353902 ) ) ( not ( = ?auto_353900 ?auto_353903 ) ) ( not ( = ?auto_353900 ?auto_353904 ) ) ( not ( = ?auto_353900 ?auto_353905 ) ) ( not ( = ?auto_353900 ?auto_353906 ) ) ( not ( = ?auto_353901 ?auto_353902 ) ) ( not ( = ?auto_353901 ?auto_353903 ) ) ( not ( = ?auto_353901 ?auto_353904 ) ) ( not ( = ?auto_353901 ?auto_353905 ) ) ( not ( = ?auto_353901 ?auto_353906 ) ) ( not ( = ?auto_353902 ?auto_353903 ) ) ( not ( = ?auto_353902 ?auto_353904 ) ) ( not ( = ?auto_353902 ?auto_353905 ) ) ( not ( = ?auto_353902 ?auto_353906 ) ) ( not ( = ?auto_353903 ?auto_353904 ) ) ( not ( = ?auto_353903 ?auto_353905 ) ) ( not ( = ?auto_353903 ?auto_353906 ) ) ( not ( = ?auto_353904 ?auto_353905 ) ) ( not ( = ?auto_353904 ?auto_353906 ) ) ( not ( = ?auto_353905 ?auto_353906 ) ) ( ON ?auto_353904 ?auto_353905 ) ( ON ?auto_353903 ?auto_353904 ) ( ON ?auto_353902 ?auto_353903 ) ( CLEAR ?auto_353900 ) ( ON ?auto_353901 ?auto_353902 ) ( CLEAR ?auto_353901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_353895 ?auto_353896 ?auto_353897 ?auto_353898 ?auto_353899 ?auto_353900 ?auto_353901 )
      ( MAKE-11PILE ?auto_353895 ?auto_353896 ?auto_353897 ?auto_353898 ?auto_353899 ?auto_353900 ?auto_353901 ?auto_353902 ?auto_353903 ?auto_353904 ?auto_353905 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353941 - BLOCK
      ?auto_353942 - BLOCK
      ?auto_353943 - BLOCK
      ?auto_353944 - BLOCK
      ?auto_353945 - BLOCK
      ?auto_353946 - BLOCK
      ?auto_353947 - BLOCK
      ?auto_353948 - BLOCK
      ?auto_353949 - BLOCK
      ?auto_353950 - BLOCK
      ?auto_353951 - BLOCK
    )
    :vars
    (
      ?auto_353952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353951 ?auto_353952 ) ( ON-TABLE ?auto_353941 ) ( ON ?auto_353942 ?auto_353941 ) ( ON ?auto_353943 ?auto_353942 ) ( ON ?auto_353944 ?auto_353943 ) ( ON ?auto_353945 ?auto_353944 ) ( not ( = ?auto_353941 ?auto_353942 ) ) ( not ( = ?auto_353941 ?auto_353943 ) ) ( not ( = ?auto_353941 ?auto_353944 ) ) ( not ( = ?auto_353941 ?auto_353945 ) ) ( not ( = ?auto_353941 ?auto_353946 ) ) ( not ( = ?auto_353941 ?auto_353947 ) ) ( not ( = ?auto_353941 ?auto_353948 ) ) ( not ( = ?auto_353941 ?auto_353949 ) ) ( not ( = ?auto_353941 ?auto_353950 ) ) ( not ( = ?auto_353941 ?auto_353951 ) ) ( not ( = ?auto_353941 ?auto_353952 ) ) ( not ( = ?auto_353942 ?auto_353943 ) ) ( not ( = ?auto_353942 ?auto_353944 ) ) ( not ( = ?auto_353942 ?auto_353945 ) ) ( not ( = ?auto_353942 ?auto_353946 ) ) ( not ( = ?auto_353942 ?auto_353947 ) ) ( not ( = ?auto_353942 ?auto_353948 ) ) ( not ( = ?auto_353942 ?auto_353949 ) ) ( not ( = ?auto_353942 ?auto_353950 ) ) ( not ( = ?auto_353942 ?auto_353951 ) ) ( not ( = ?auto_353942 ?auto_353952 ) ) ( not ( = ?auto_353943 ?auto_353944 ) ) ( not ( = ?auto_353943 ?auto_353945 ) ) ( not ( = ?auto_353943 ?auto_353946 ) ) ( not ( = ?auto_353943 ?auto_353947 ) ) ( not ( = ?auto_353943 ?auto_353948 ) ) ( not ( = ?auto_353943 ?auto_353949 ) ) ( not ( = ?auto_353943 ?auto_353950 ) ) ( not ( = ?auto_353943 ?auto_353951 ) ) ( not ( = ?auto_353943 ?auto_353952 ) ) ( not ( = ?auto_353944 ?auto_353945 ) ) ( not ( = ?auto_353944 ?auto_353946 ) ) ( not ( = ?auto_353944 ?auto_353947 ) ) ( not ( = ?auto_353944 ?auto_353948 ) ) ( not ( = ?auto_353944 ?auto_353949 ) ) ( not ( = ?auto_353944 ?auto_353950 ) ) ( not ( = ?auto_353944 ?auto_353951 ) ) ( not ( = ?auto_353944 ?auto_353952 ) ) ( not ( = ?auto_353945 ?auto_353946 ) ) ( not ( = ?auto_353945 ?auto_353947 ) ) ( not ( = ?auto_353945 ?auto_353948 ) ) ( not ( = ?auto_353945 ?auto_353949 ) ) ( not ( = ?auto_353945 ?auto_353950 ) ) ( not ( = ?auto_353945 ?auto_353951 ) ) ( not ( = ?auto_353945 ?auto_353952 ) ) ( not ( = ?auto_353946 ?auto_353947 ) ) ( not ( = ?auto_353946 ?auto_353948 ) ) ( not ( = ?auto_353946 ?auto_353949 ) ) ( not ( = ?auto_353946 ?auto_353950 ) ) ( not ( = ?auto_353946 ?auto_353951 ) ) ( not ( = ?auto_353946 ?auto_353952 ) ) ( not ( = ?auto_353947 ?auto_353948 ) ) ( not ( = ?auto_353947 ?auto_353949 ) ) ( not ( = ?auto_353947 ?auto_353950 ) ) ( not ( = ?auto_353947 ?auto_353951 ) ) ( not ( = ?auto_353947 ?auto_353952 ) ) ( not ( = ?auto_353948 ?auto_353949 ) ) ( not ( = ?auto_353948 ?auto_353950 ) ) ( not ( = ?auto_353948 ?auto_353951 ) ) ( not ( = ?auto_353948 ?auto_353952 ) ) ( not ( = ?auto_353949 ?auto_353950 ) ) ( not ( = ?auto_353949 ?auto_353951 ) ) ( not ( = ?auto_353949 ?auto_353952 ) ) ( not ( = ?auto_353950 ?auto_353951 ) ) ( not ( = ?auto_353950 ?auto_353952 ) ) ( not ( = ?auto_353951 ?auto_353952 ) ) ( ON ?auto_353950 ?auto_353951 ) ( ON ?auto_353949 ?auto_353950 ) ( ON ?auto_353948 ?auto_353949 ) ( ON ?auto_353947 ?auto_353948 ) ( CLEAR ?auto_353945 ) ( ON ?auto_353946 ?auto_353947 ) ( CLEAR ?auto_353946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_353941 ?auto_353942 ?auto_353943 ?auto_353944 ?auto_353945 ?auto_353946 )
      ( MAKE-11PILE ?auto_353941 ?auto_353942 ?auto_353943 ?auto_353944 ?auto_353945 ?auto_353946 ?auto_353947 ?auto_353948 ?auto_353949 ?auto_353950 ?auto_353951 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_353987 - BLOCK
      ?auto_353988 - BLOCK
      ?auto_353989 - BLOCK
      ?auto_353990 - BLOCK
      ?auto_353991 - BLOCK
      ?auto_353992 - BLOCK
      ?auto_353993 - BLOCK
      ?auto_353994 - BLOCK
      ?auto_353995 - BLOCK
      ?auto_353996 - BLOCK
      ?auto_353997 - BLOCK
    )
    :vars
    (
      ?auto_353998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_353997 ?auto_353998 ) ( ON-TABLE ?auto_353987 ) ( ON ?auto_353988 ?auto_353987 ) ( ON ?auto_353989 ?auto_353988 ) ( ON ?auto_353990 ?auto_353989 ) ( not ( = ?auto_353987 ?auto_353988 ) ) ( not ( = ?auto_353987 ?auto_353989 ) ) ( not ( = ?auto_353987 ?auto_353990 ) ) ( not ( = ?auto_353987 ?auto_353991 ) ) ( not ( = ?auto_353987 ?auto_353992 ) ) ( not ( = ?auto_353987 ?auto_353993 ) ) ( not ( = ?auto_353987 ?auto_353994 ) ) ( not ( = ?auto_353987 ?auto_353995 ) ) ( not ( = ?auto_353987 ?auto_353996 ) ) ( not ( = ?auto_353987 ?auto_353997 ) ) ( not ( = ?auto_353987 ?auto_353998 ) ) ( not ( = ?auto_353988 ?auto_353989 ) ) ( not ( = ?auto_353988 ?auto_353990 ) ) ( not ( = ?auto_353988 ?auto_353991 ) ) ( not ( = ?auto_353988 ?auto_353992 ) ) ( not ( = ?auto_353988 ?auto_353993 ) ) ( not ( = ?auto_353988 ?auto_353994 ) ) ( not ( = ?auto_353988 ?auto_353995 ) ) ( not ( = ?auto_353988 ?auto_353996 ) ) ( not ( = ?auto_353988 ?auto_353997 ) ) ( not ( = ?auto_353988 ?auto_353998 ) ) ( not ( = ?auto_353989 ?auto_353990 ) ) ( not ( = ?auto_353989 ?auto_353991 ) ) ( not ( = ?auto_353989 ?auto_353992 ) ) ( not ( = ?auto_353989 ?auto_353993 ) ) ( not ( = ?auto_353989 ?auto_353994 ) ) ( not ( = ?auto_353989 ?auto_353995 ) ) ( not ( = ?auto_353989 ?auto_353996 ) ) ( not ( = ?auto_353989 ?auto_353997 ) ) ( not ( = ?auto_353989 ?auto_353998 ) ) ( not ( = ?auto_353990 ?auto_353991 ) ) ( not ( = ?auto_353990 ?auto_353992 ) ) ( not ( = ?auto_353990 ?auto_353993 ) ) ( not ( = ?auto_353990 ?auto_353994 ) ) ( not ( = ?auto_353990 ?auto_353995 ) ) ( not ( = ?auto_353990 ?auto_353996 ) ) ( not ( = ?auto_353990 ?auto_353997 ) ) ( not ( = ?auto_353990 ?auto_353998 ) ) ( not ( = ?auto_353991 ?auto_353992 ) ) ( not ( = ?auto_353991 ?auto_353993 ) ) ( not ( = ?auto_353991 ?auto_353994 ) ) ( not ( = ?auto_353991 ?auto_353995 ) ) ( not ( = ?auto_353991 ?auto_353996 ) ) ( not ( = ?auto_353991 ?auto_353997 ) ) ( not ( = ?auto_353991 ?auto_353998 ) ) ( not ( = ?auto_353992 ?auto_353993 ) ) ( not ( = ?auto_353992 ?auto_353994 ) ) ( not ( = ?auto_353992 ?auto_353995 ) ) ( not ( = ?auto_353992 ?auto_353996 ) ) ( not ( = ?auto_353992 ?auto_353997 ) ) ( not ( = ?auto_353992 ?auto_353998 ) ) ( not ( = ?auto_353993 ?auto_353994 ) ) ( not ( = ?auto_353993 ?auto_353995 ) ) ( not ( = ?auto_353993 ?auto_353996 ) ) ( not ( = ?auto_353993 ?auto_353997 ) ) ( not ( = ?auto_353993 ?auto_353998 ) ) ( not ( = ?auto_353994 ?auto_353995 ) ) ( not ( = ?auto_353994 ?auto_353996 ) ) ( not ( = ?auto_353994 ?auto_353997 ) ) ( not ( = ?auto_353994 ?auto_353998 ) ) ( not ( = ?auto_353995 ?auto_353996 ) ) ( not ( = ?auto_353995 ?auto_353997 ) ) ( not ( = ?auto_353995 ?auto_353998 ) ) ( not ( = ?auto_353996 ?auto_353997 ) ) ( not ( = ?auto_353996 ?auto_353998 ) ) ( not ( = ?auto_353997 ?auto_353998 ) ) ( ON ?auto_353996 ?auto_353997 ) ( ON ?auto_353995 ?auto_353996 ) ( ON ?auto_353994 ?auto_353995 ) ( ON ?auto_353993 ?auto_353994 ) ( ON ?auto_353992 ?auto_353993 ) ( CLEAR ?auto_353990 ) ( ON ?auto_353991 ?auto_353992 ) ( CLEAR ?auto_353991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_353987 ?auto_353988 ?auto_353989 ?auto_353990 ?auto_353991 )
      ( MAKE-11PILE ?auto_353987 ?auto_353988 ?auto_353989 ?auto_353990 ?auto_353991 ?auto_353992 ?auto_353993 ?auto_353994 ?auto_353995 ?auto_353996 ?auto_353997 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_354033 - BLOCK
      ?auto_354034 - BLOCK
      ?auto_354035 - BLOCK
      ?auto_354036 - BLOCK
      ?auto_354037 - BLOCK
      ?auto_354038 - BLOCK
      ?auto_354039 - BLOCK
      ?auto_354040 - BLOCK
      ?auto_354041 - BLOCK
      ?auto_354042 - BLOCK
      ?auto_354043 - BLOCK
    )
    :vars
    (
      ?auto_354044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354043 ?auto_354044 ) ( ON-TABLE ?auto_354033 ) ( ON ?auto_354034 ?auto_354033 ) ( ON ?auto_354035 ?auto_354034 ) ( not ( = ?auto_354033 ?auto_354034 ) ) ( not ( = ?auto_354033 ?auto_354035 ) ) ( not ( = ?auto_354033 ?auto_354036 ) ) ( not ( = ?auto_354033 ?auto_354037 ) ) ( not ( = ?auto_354033 ?auto_354038 ) ) ( not ( = ?auto_354033 ?auto_354039 ) ) ( not ( = ?auto_354033 ?auto_354040 ) ) ( not ( = ?auto_354033 ?auto_354041 ) ) ( not ( = ?auto_354033 ?auto_354042 ) ) ( not ( = ?auto_354033 ?auto_354043 ) ) ( not ( = ?auto_354033 ?auto_354044 ) ) ( not ( = ?auto_354034 ?auto_354035 ) ) ( not ( = ?auto_354034 ?auto_354036 ) ) ( not ( = ?auto_354034 ?auto_354037 ) ) ( not ( = ?auto_354034 ?auto_354038 ) ) ( not ( = ?auto_354034 ?auto_354039 ) ) ( not ( = ?auto_354034 ?auto_354040 ) ) ( not ( = ?auto_354034 ?auto_354041 ) ) ( not ( = ?auto_354034 ?auto_354042 ) ) ( not ( = ?auto_354034 ?auto_354043 ) ) ( not ( = ?auto_354034 ?auto_354044 ) ) ( not ( = ?auto_354035 ?auto_354036 ) ) ( not ( = ?auto_354035 ?auto_354037 ) ) ( not ( = ?auto_354035 ?auto_354038 ) ) ( not ( = ?auto_354035 ?auto_354039 ) ) ( not ( = ?auto_354035 ?auto_354040 ) ) ( not ( = ?auto_354035 ?auto_354041 ) ) ( not ( = ?auto_354035 ?auto_354042 ) ) ( not ( = ?auto_354035 ?auto_354043 ) ) ( not ( = ?auto_354035 ?auto_354044 ) ) ( not ( = ?auto_354036 ?auto_354037 ) ) ( not ( = ?auto_354036 ?auto_354038 ) ) ( not ( = ?auto_354036 ?auto_354039 ) ) ( not ( = ?auto_354036 ?auto_354040 ) ) ( not ( = ?auto_354036 ?auto_354041 ) ) ( not ( = ?auto_354036 ?auto_354042 ) ) ( not ( = ?auto_354036 ?auto_354043 ) ) ( not ( = ?auto_354036 ?auto_354044 ) ) ( not ( = ?auto_354037 ?auto_354038 ) ) ( not ( = ?auto_354037 ?auto_354039 ) ) ( not ( = ?auto_354037 ?auto_354040 ) ) ( not ( = ?auto_354037 ?auto_354041 ) ) ( not ( = ?auto_354037 ?auto_354042 ) ) ( not ( = ?auto_354037 ?auto_354043 ) ) ( not ( = ?auto_354037 ?auto_354044 ) ) ( not ( = ?auto_354038 ?auto_354039 ) ) ( not ( = ?auto_354038 ?auto_354040 ) ) ( not ( = ?auto_354038 ?auto_354041 ) ) ( not ( = ?auto_354038 ?auto_354042 ) ) ( not ( = ?auto_354038 ?auto_354043 ) ) ( not ( = ?auto_354038 ?auto_354044 ) ) ( not ( = ?auto_354039 ?auto_354040 ) ) ( not ( = ?auto_354039 ?auto_354041 ) ) ( not ( = ?auto_354039 ?auto_354042 ) ) ( not ( = ?auto_354039 ?auto_354043 ) ) ( not ( = ?auto_354039 ?auto_354044 ) ) ( not ( = ?auto_354040 ?auto_354041 ) ) ( not ( = ?auto_354040 ?auto_354042 ) ) ( not ( = ?auto_354040 ?auto_354043 ) ) ( not ( = ?auto_354040 ?auto_354044 ) ) ( not ( = ?auto_354041 ?auto_354042 ) ) ( not ( = ?auto_354041 ?auto_354043 ) ) ( not ( = ?auto_354041 ?auto_354044 ) ) ( not ( = ?auto_354042 ?auto_354043 ) ) ( not ( = ?auto_354042 ?auto_354044 ) ) ( not ( = ?auto_354043 ?auto_354044 ) ) ( ON ?auto_354042 ?auto_354043 ) ( ON ?auto_354041 ?auto_354042 ) ( ON ?auto_354040 ?auto_354041 ) ( ON ?auto_354039 ?auto_354040 ) ( ON ?auto_354038 ?auto_354039 ) ( ON ?auto_354037 ?auto_354038 ) ( CLEAR ?auto_354035 ) ( ON ?auto_354036 ?auto_354037 ) ( CLEAR ?auto_354036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_354033 ?auto_354034 ?auto_354035 ?auto_354036 )
      ( MAKE-11PILE ?auto_354033 ?auto_354034 ?auto_354035 ?auto_354036 ?auto_354037 ?auto_354038 ?auto_354039 ?auto_354040 ?auto_354041 ?auto_354042 ?auto_354043 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_354079 - BLOCK
      ?auto_354080 - BLOCK
      ?auto_354081 - BLOCK
      ?auto_354082 - BLOCK
      ?auto_354083 - BLOCK
      ?auto_354084 - BLOCK
      ?auto_354085 - BLOCK
      ?auto_354086 - BLOCK
      ?auto_354087 - BLOCK
      ?auto_354088 - BLOCK
      ?auto_354089 - BLOCK
    )
    :vars
    (
      ?auto_354090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354089 ?auto_354090 ) ( ON-TABLE ?auto_354079 ) ( ON ?auto_354080 ?auto_354079 ) ( not ( = ?auto_354079 ?auto_354080 ) ) ( not ( = ?auto_354079 ?auto_354081 ) ) ( not ( = ?auto_354079 ?auto_354082 ) ) ( not ( = ?auto_354079 ?auto_354083 ) ) ( not ( = ?auto_354079 ?auto_354084 ) ) ( not ( = ?auto_354079 ?auto_354085 ) ) ( not ( = ?auto_354079 ?auto_354086 ) ) ( not ( = ?auto_354079 ?auto_354087 ) ) ( not ( = ?auto_354079 ?auto_354088 ) ) ( not ( = ?auto_354079 ?auto_354089 ) ) ( not ( = ?auto_354079 ?auto_354090 ) ) ( not ( = ?auto_354080 ?auto_354081 ) ) ( not ( = ?auto_354080 ?auto_354082 ) ) ( not ( = ?auto_354080 ?auto_354083 ) ) ( not ( = ?auto_354080 ?auto_354084 ) ) ( not ( = ?auto_354080 ?auto_354085 ) ) ( not ( = ?auto_354080 ?auto_354086 ) ) ( not ( = ?auto_354080 ?auto_354087 ) ) ( not ( = ?auto_354080 ?auto_354088 ) ) ( not ( = ?auto_354080 ?auto_354089 ) ) ( not ( = ?auto_354080 ?auto_354090 ) ) ( not ( = ?auto_354081 ?auto_354082 ) ) ( not ( = ?auto_354081 ?auto_354083 ) ) ( not ( = ?auto_354081 ?auto_354084 ) ) ( not ( = ?auto_354081 ?auto_354085 ) ) ( not ( = ?auto_354081 ?auto_354086 ) ) ( not ( = ?auto_354081 ?auto_354087 ) ) ( not ( = ?auto_354081 ?auto_354088 ) ) ( not ( = ?auto_354081 ?auto_354089 ) ) ( not ( = ?auto_354081 ?auto_354090 ) ) ( not ( = ?auto_354082 ?auto_354083 ) ) ( not ( = ?auto_354082 ?auto_354084 ) ) ( not ( = ?auto_354082 ?auto_354085 ) ) ( not ( = ?auto_354082 ?auto_354086 ) ) ( not ( = ?auto_354082 ?auto_354087 ) ) ( not ( = ?auto_354082 ?auto_354088 ) ) ( not ( = ?auto_354082 ?auto_354089 ) ) ( not ( = ?auto_354082 ?auto_354090 ) ) ( not ( = ?auto_354083 ?auto_354084 ) ) ( not ( = ?auto_354083 ?auto_354085 ) ) ( not ( = ?auto_354083 ?auto_354086 ) ) ( not ( = ?auto_354083 ?auto_354087 ) ) ( not ( = ?auto_354083 ?auto_354088 ) ) ( not ( = ?auto_354083 ?auto_354089 ) ) ( not ( = ?auto_354083 ?auto_354090 ) ) ( not ( = ?auto_354084 ?auto_354085 ) ) ( not ( = ?auto_354084 ?auto_354086 ) ) ( not ( = ?auto_354084 ?auto_354087 ) ) ( not ( = ?auto_354084 ?auto_354088 ) ) ( not ( = ?auto_354084 ?auto_354089 ) ) ( not ( = ?auto_354084 ?auto_354090 ) ) ( not ( = ?auto_354085 ?auto_354086 ) ) ( not ( = ?auto_354085 ?auto_354087 ) ) ( not ( = ?auto_354085 ?auto_354088 ) ) ( not ( = ?auto_354085 ?auto_354089 ) ) ( not ( = ?auto_354085 ?auto_354090 ) ) ( not ( = ?auto_354086 ?auto_354087 ) ) ( not ( = ?auto_354086 ?auto_354088 ) ) ( not ( = ?auto_354086 ?auto_354089 ) ) ( not ( = ?auto_354086 ?auto_354090 ) ) ( not ( = ?auto_354087 ?auto_354088 ) ) ( not ( = ?auto_354087 ?auto_354089 ) ) ( not ( = ?auto_354087 ?auto_354090 ) ) ( not ( = ?auto_354088 ?auto_354089 ) ) ( not ( = ?auto_354088 ?auto_354090 ) ) ( not ( = ?auto_354089 ?auto_354090 ) ) ( ON ?auto_354088 ?auto_354089 ) ( ON ?auto_354087 ?auto_354088 ) ( ON ?auto_354086 ?auto_354087 ) ( ON ?auto_354085 ?auto_354086 ) ( ON ?auto_354084 ?auto_354085 ) ( ON ?auto_354083 ?auto_354084 ) ( ON ?auto_354082 ?auto_354083 ) ( CLEAR ?auto_354080 ) ( ON ?auto_354081 ?auto_354082 ) ( CLEAR ?auto_354081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_354079 ?auto_354080 ?auto_354081 )
      ( MAKE-11PILE ?auto_354079 ?auto_354080 ?auto_354081 ?auto_354082 ?auto_354083 ?auto_354084 ?auto_354085 ?auto_354086 ?auto_354087 ?auto_354088 ?auto_354089 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_354125 - BLOCK
      ?auto_354126 - BLOCK
      ?auto_354127 - BLOCK
      ?auto_354128 - BLOCK
      ?auto_354129 - BLOCK
      ?auto_354130 - BLOCK
      ?auto_354131 - BLOCK
      ?auto_354132 - BLOCK
      ?auto_354133 - BLOCK
      ?auto_354134 - BLOCK
      ?auto_354135 - BLOCK
    )
    :vars
    (
      ?auto_354136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354135 ?auto_354136 ) ( ON-TABLE ?auto_354125 ) ( not ( = ?auto_354125 ?auto_354126 ) ) ( not ( = ?auto_354125 ?auto_354127 ) ) ( not ( = ?auto_354125 ?auto_354128 ) ) ( not ( = ?auto_354125 ?auto_354129 ) ) ( not ( = ?auto_354125 ?auto_354130 ) ) ( not ( = ?auto_354125 ?auto_354131 ) ) ( not ( = ?auto_354125 ?auto_354132 ) ) ( not ( = ?auto_354125 ?auto_354133 ) ) ( not ( = ?auto_354125 ?auto_354134 ) ) ( not ( = ?auto_354125 ?auto_354135 ) ) ( not ( = ?auto_354125 ?auto_354136 ) ) ( not ( = ?auto_354126 ?auto_354127 ) ) ( not ( = ?auto_354126 ?auto_354128 ) ) ( not ( = ?auto_354126 ?auto_354129 ) ) ( not ( = ?auto_354126 ?auto_354130 ) ) ( not ( = ?auto_354126 ?auto_354131 ) ) ( not ( = ?auto_354126 ?auto_354132 ) ) ( not ( = ?auto_354126 ?auto_354133 ) ) ( not ( = ?auto_354126 ?auto_354134 ) ) ( not ( = ?auto_354126 ?auto_354135 ) ) ( not ( = ?auto_354126 ?auto_354136 ) ) ( not ( = ?auto_354127 ?auto_354128 ) ) ( not ( = ?auto_354127 ?auto_354129 ) ) ( not ( = ?auto_354127 ?auto_354130 ) ) ( not ( = ?auto_354127 ?auto_354131 ) ) ( not ( = ?auto_354127 ?auto_354132 ) ) ( not ( = ?auto_354127 ?auto_354133 ) ) ( not ( = ?auto_354127 ?auto_354134 ) ) ( not ( = ?auto_354127 ?auto_354135 ) ) ( not ( = ?auto_354127 ?auto_354136 ) ) ( not ( = ?auto_354128 ?auto_354129 ) ) ( not ( = ?auto_354128 ?auto_354130 ) ) ( not ( = ?auto_354128 ?auto_354131 ) ) ( not ( = ?auto_354128 ?auto_354132 ) ) ( not ( = ?auto_354128 ?auto_354133 ) ) ( not ( = ?auto_354128 ?auto_354134 ) ) ( not ( = ?auto_354128 ?auto_354135 ) ) ( not ( = ?auto_354128 ?auto_354136 ) ) ( not ( = ?auto_354129 ?auto_354130 ) ) ( not ( = ?auto_354129 ?auto_354131 ) ) ( not ( = ?auto_354129 ?auto_354132 ) ) ( not ( = ?auto_354129 ?auto_354133 ) ) ( not ( = ?auto_354129 ?auto_354134 ) ) ( not ( = ?auto_354129 ?auto_354135 ) ) ( not ( = ?auto_354129 ?auto_354136 ) ) ( not ( = ?auto_354130 ?auto_354131 ) ) ( not ( = ?auto_354130 ?auto_354132 ) ) ( not ( = ?auto_354130 ?auto_354133 ) ) ( not ( = ?auto_354130 ?auto_354134 ) ) ( not ( = ?auto_354130 ?auto_354135 ) ) ( not ( = ?auto_354130 ?auto_354136 ) ) ( not ( = ?auto_354131 ?auto_354132 ) ) ( not ( = ?auto_354131 ?auto_354133 ) ) ( not ( = ?auto_354131 ?auto_354134 ) ) ( not ( = ?auto_354131 ?auto_354135 ) ) ( not ( = ?auto_354131 ?auto_354136 ) ) ( not ( = ?auto_354132 ?auto_354133 ) ) ( not ( = ?auto_354132 ?auto_354134 ) ) ( not ( = ?auto_354132 ?auto_354135 ) ) ( not ( = ?auto_354132 ?auto_354136 ) ) ( not ( = ?auto_354133 ?auto_354134 ) ) ( not ( = ?auto_354133 ?auto_354135 ) ) ( not ( = ?auto_354133 ?auto_354136 ) ) ( not ( = ?auto_354134 ?auto_354135 ) ) ( not ( = ?auto_354134 ?auto_354136 ) ) ( not ( = ?auto_354135 ?auto_354136 ) ) ( ON ?auto_354134 ?auto_354135 ) ( ON ?auto_354133 ?auto_354134 ) ( ON ?auto_354132 ?auto_354133 ) ( ON ?auto_354131 ?auto_354132 ) ( ON ?auto_354130 ?auto_354131 ) ( ON ?auto_354129 ?auto_354130 ) ( ON ?auto_354128 ?auto_354129 ) ( ON ?auto_354127 ?auto_354128 ) ( CLEAR ?auto_354125 ) ( ON ?auto_354126 ?auto_354127 ) ( CLEAR ?auto_354126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_354125 ?auto_354126 )
      ( MAKE-11PILE ?auto_354125 ?auto_354126 ?auto_354127 ?auto_354128 ?auto_354129 ?auto_354130 ?auto_354131 ?auto_354132 ?auto_354133 ?auto_354134 ?auto_354135 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_354171 - BLOCK
      ?auto_354172 - BLOCK
      ?auto_354173 - BLOCK
      ?auto_354174 - BLOCK
      ?auto_354175 - BLOCK
      ?auto_354176 - BLOCK
      ?auto_354177 - BLOCK
      ?auto_354178 - BLOCK
      ?auto_354179 - BLOCK
      ?auto_354180 - BLOCK
      ?auto_354181 - BLOCK
    )
    :vars
    (
      ?auto_354182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354181 ?auto_354182 ) ( not ( = ?auto_354171 ?auto_354172 ) ) ( not ( = ?auto_354171 ?auto_354173 ) ) ( not ( = ?auto_354171 ?auto_354174 ) ) ( not ( = ?auto_354171 ?auto_354175 ) ) ( not ( = ?auto_354171 ?auto_354176 ) ) ( not ( = ?auto_354171 ?auto_354177 ) ) ( not ( = ?auto_354171 ?auto_354178 ) ) ( not ( = ?auto_354171 ?auto_354179 ) ) ( not ( = ?auto_354171 ?auto_354180 ) ) ( not ( = ?auto_354171 ?auto_354181 ) ) ( not ( = ?auto_354171 ?auto_354182 ) ) ( not ( = ?auto_354172 ?auto_354173 ) ) ( not ( = ?auto_354172 ?auto_354174 ) ) ( not ( = ?auto_354172 ?auto_354175 ) ) ( not ( = ?auto_354172 ?auto_354176 ) ) ( not ( = ?auto_354172 ?auto_354177 ) ) ( not ( = ?auto_354172 ?auto_354178 ) ) ( not ( = ?auto_354172 ?auto_354179 ) ) ( not ( = ?auto_354172 ?auto_354180 ) ) ( not ( = ?auto_354172 ?auto_354181 ) ) ( not ( = ?auto_354172 ?auto_354182 ) ) ( not ( = ?auto_354173 ?auto_354174 ) ) ( not ( = ?auto_354173 ?auto_354175 ) ) ( not ( = ?auto_354173 ?auto_354176 ) ) ( not ( = ?auto_354173 ?auto_354177 ) ) ( not ( = ?auto_354173 ?auto_354178 ) ) ( not ( = ?auto_354173 ?auto_354179 ) ) ( not ( = ?auto_354173 ?auto_354180 ) ) ( not ( = ?auto_354173 ?auto_354181 ) ) ( not ( = ?auto_354173 ?auto_354182 ) ) ( not ( = ?auto_354174 ?auto_354175 ) ) ( not ( = ?auto_354174 ?auto_354176 ) ) ( not ( = ?auto_354174 ?auto_354177 ) ) ( not ( = ?auto_354174 ?auto_354178 ) ) ( not ( = ?auto_354174 ?auto_354179 ) ) ( not ( = ?auto_354174 ?auto_354180 ) ) ( not ( = ?auto_354174 ?auto_354181 ) ) ( not ( = ?auto_354174 ?auto_354182 ) ) ( not ( = ?auto_354175 ?auto_354176 ) ) ( not ( = ?auto_354175 ?auto_354177 ) ) ( not ( = ?auto_354175 ?auto_354178 ) ) ( not ( = ?auto_354175 ?auto_354179 ) ) ( not ( = ?auto_354175 ?auto_354180 ) ) ( not ( = ?auto_354175 ?auto_354181 ) ) ( not ( = ?auto_354175 ?auto_354182 ) ) ( not ( = ?auto_354176 ?auto_354177 ) ) ( not ( = ?auto_354176 ?auto_354178 ) ) ( not ( = ?auto_354176 ?auto_354179 ) ) ( not ( = ?auto_354176 ?auto_354180 ) ) ( not ( = ?auto_354176 ?auto_354181 ) ) ( not ( = ?auto_354176 ?auto_354182 ) ) ( not ( = ?auto_354177 ?auto_354178 ) ) ( not ( = ?auto_354177 ?auto_354179 ) ) ( not ( = ?auto_354177 ?auto_354180 ) ) ( not ( = ?auto_354177 ?auto_354181 ) ) ( not ( = ?auto_354177 ?auto_354182 ) ) ( not ( = ?auto_354178 ?auto_354179 ) ) ( not ( = ?auto_354178 ?auto_354180 ) ) ( not ( = ?auto_354178 ?auto_354181 ) ) ( not ( = ?auto_354178 ?auto_354182 ) ) ( not ( = ?auto_354179 ?auto_354180 ) ) ( not ( = ?auto_354179 ?auto_354181 ) ) ( not ( = ?auto_354179 ?auto_354182 ) ) ( not ( = ?auto_354180 ?auto_354181 ) ) ( not ( = ?auto_354180 ?auto_354182 ) ) ( not ( = ?auto_354181 ?auto_354182 ) ) ( ON ?auto_354180 ?auto_354181 ) ( ON ?auto_354179 ?auto_354180 ) ( ON ?auto_354178 ?auto_354179 ) ( ON ?auto_354177 ?auto_354178 ) ( ON ?auto_354176 ?auto_354177 ) ( ON ?auto_354175 ?auto_354176 ) ( ON ?auto_354174 ?auto_354175 ) ( ON ?auto_354173 ?auto_354174 ) ( ON ?auto_354172 ?auto_354173 ) ( ON ?auto_354171 ?auto_354172 ) ( CLEAR ?auto_354171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_354171 )
      ( MAKE-11PILE ?auto_354171 ?auto_354172 ?auto_354173 ?auto_354174 ?auto_354175 ?auto_354176 ?auto_354177 ?auto_354178 ?auto_354179 ?auto_354180 ?auto_354181 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354218 - BLOCK
      ?auto_354219 - BLOCK
      ?auto_354220 - BLOCK
      ?auto_354221 - BLOCK
      ?auto_354222 - BLOCK
      ?auto_354223 - BLOCK
      ?auto_354224 - BLOCK
      ?auto_354225 - BLOCK
      ?auto_354226 - BLOCK
      ?auto_354227 - BLOCK
      ?auto_354228 - BLOCK
      ?auto_354229 - BLOCK
    )
    :vars
    (
      ?auto_354230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_354228 ) ( ON ?auto_354229 ?auto_354230 ) ( CLEAR ?auto_354229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_354218 ) ( ON ?auto_354219 ?auto_354218 ) ( ON ?auto_354220 ?auto_354219 ) ( ON ?auto_354221 ?auto_354220 ) ( ON ?auto_354222 ?auto_354221 ) ( ON ?auto_354223 ?auto_354222 ) ( ON ?auto_354224 ?auto_354223 ) ( ON ?auto_354225 ?auto_354224 ) ( ON ?auto_354226 ?auto_354225 ) ( ON ?auto_354227 ?auto_354226 ) ( ON ?auto_354228 ?auto_354227 ) ( not ( = ?auto_354218 ?auto_354219 ) ) ( not ( = ?auto_354218 ?auto_354220 ) ) ( not ( = ?auto_354218 ?auto_354221 ) ) ( not ( = ?auto_354218 ?auto_354222 ) ) ( not ( = ?auto_354218 ?auto_354223 ) ) ( not ( = ?auto_354218 ?auto_354224 ) ) ( not ( = ?auto_354218 ?auto_354225 ) ) ( not ( = ?auto_354218 ?auto_354226 ) ) ( not ( = ?auto_354218 ?auto_354227 ) ) ( not ( = ?auto_354218 ?auto_354228 ) ) ( not ( = ?auto_354218 ?auto_354229 ) ) ( not ( = ?auto_354218 ?auto_354230 ) ) ( not ( = ?auto_354219 ?auto_354220 ) ) ( not ( = ?auto_354219 ?auto_354221 ) ) ( not ( = ?auto_354219 ?auto_354222 ) ) ( not ( = ?auto_354219 ?auto_354223 ) ) ( not ( = ?auto_354219 ?auto_354224 ) ) ( not ( = ?auto_354219 ?auto_354225 ) ) ( not ( = ?auto_354219 ?auto_354226 ) ) ( not ( = ?auto_354219 ?auto_354227 ) ) ( not ( = ?auto_354219 ?auto_354228 ) ) ( not ( = ?auto_354219 ?auto_354229 ) ) ( not ( = ?auto_354219 ?auto_354230 ) ) ( not ( = ?auto_354220 ?auto_354221 ) ) ( not ( = ?auto_354220 ?auto_354222 ) ) ( not ( = ?auto_354220 ?auto_354223 ) ) ( not ( = ?auto_354220 ?auto_354224 ) ) ( not ( = ?auto_354220 ?auto_354225 ) ) ( not ( = ?auto_354220 ?auto_354226 ) ) ( not ( = ?auto_354220 ?auto_354227 ) ) ( not ( = ?auto_354220 ?auto_354228 ) ) ( not ( = ?auto_354220 ?auto_354229 ) ) ( not ( = ?auto_354220 ?auto_354230 ) ) ( not ( = ?auto_354221 ?auto_354222 ) ) ( not ( = ?auto_354221 ?auto_354223 ) ) ( not ( = ?auto_354221 ?auto_354224 ) ) ( not ( = ?auto_354221 ?auto_354225 ) ) ( not ( = ?auto_354221 ?auto_354226 ) ) ( not ( = ?auto_354221 ?auto_354227 ) ) ( not ( = ?auto_354221 ?auto_354228 ) ) ( not ( = ?auto_354221 ?auto_354229 ) ) ( not ( = ?auto_354221 ?auto_354230 ) ) ( not ( = ?auto_354222 ?auto_354223 ) ) ( not ( = ?auto_354222 ?auto_354224 ) ) ( not ( = ?auto_354222 ?auto_354225 ) ) ( not ( = ?auto_354222 ?auto_354226 ) ) ( not ( = ?auto_354222 ?auto_354227 ) ) ( not ( = ?auto_354222 ?auto_354228 ) ) ( not ( = ?auto_354222 ?auto_354229 ) ) ( not ( = ?auto_354222 ?auto_354230 ) ) ( not ( = ?auto_354223 ?auto_354224 ) ) ( not ( = ?auto_354223 ?auto_354225 ) ) ( not ( = ?auto_354223 ?auto_354226 ) ) ( not ( = ?auto_354223 ?auto_354227 ) ) ( not ( = ?auto_354223 ?auto_354228 ) ) ( not ( = ?auto_354223 ?auto_354229 ) ) ( not ( = ?auto_354223 ?auto_354230 ) ) ( not ( = ?auto_354224 ?auto_354225 ) ) ( not ( = ?auto_354224 ?auto_354226 ) ) ( not ( = ?auto_354224 ?auto_354227 ) ) ( not ( = ?auto_354224 ?auto_354228 ) ) ( not ( = ?auto_354224 ?auto_354229 ) ) ( not ( = ?auto_354224 ?auto_354230 ) ) ( not ( = ?auto_354225 ?auto_354226 ) ) ( not ( = ?auto_354225 ?auto_354227 ) ) ( not ( = ?auto_354225 ?auto_354228 ) ) ( not ( = ?auto_354225 ?auto_354229 ) ) ( not ( = ?auto_354225 ?auto_354230 ) ) ( not ( = ?auto_354226 ?auto_354227 ) ) ( not ( = ?auto_354226 ?auto_354228 ) ) ( not ( = ?auto_354226 ?auto_354229 ) ) ( not ( = ?auto_354226 ?auto_354230 ) ) ( not ( = ?auto_354227 ?auto_354228 ) ) ( not ( = ?auto_354227 ?auto_354229 ) ) ( not ( = ?auto_354227 ?auto_354230 ) ) ( not ( = ?auto_354228 ?auto_354229 ) ) ( not ( = ?auto_354228 ?auto_354230 ) ) ( not ( = ?auto_354229 ?auto_354230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_354229 ?auto_354230 )
      ( !STACK ?auto_354229 ?auto_354228 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354268 - BLOCK
      ?auto_354269 - BLOCK
      ?auto_354270 - BLOCK
      ?auto_354271 - BLOCK
      ?auto_354272 - BLOCK
      ?auto_354273 - BLOCK
      ?auto_354274 - BLOCK
      ?auto_354275 - BLOCK
      ?auto_354276 - BLOCK
      ?auto_354277 - BLOCK
      ?auto_354278 - BLOCK
      ?auto_354279 - BLOCK
    )
    :vars
    (
      ?auto_354280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354279 ?auto_354280 ) ( ON-TABLE ?auto_354268 ) ( ON ?auto_354269 ?auto_354268 ) ( ON ?auto_354270 ?auto_354269 ) ( ON ?auto_354271 ?auto_354270 ) ( ON ?auto_354272 ?auto_354271 ) ( ON ?auto_354273 ?auto_354272 ) ( ON ?auto_354274 ?auto_354273 ) ( ON ?auto_354275 ?auto_354274 ) ( ON ?auto_354276 ?auto_354275 ) ( ON ?auto_354277 ?auto_354276 ) ( not ( = ?auto_354268 ?auto_354269 ) ) ( not ( = ?auto_354268 ?auto_354270 ) ) ( not ( = ?auto_354268 ?auto_354271 ) ) ( not ( = ?auto_354268 ?auto_354272 ) ) ( not ( = ?auto_354268 ?auto_354273 ) ) ( not ( = ?auto_354268 ?auto_354274 ) ) ( not ( = ?auto_354268 ?auto_354275 ) ) ( not ( = ?auto_354268 ?auto_354276 ) ) ( not ( = ?auto_354268 ?auto_354277 ) ) ( not ( = ?auto_354268 ?auto_354278 ) ) ( not ( = ?auto_354268 ?auto_354279 ) ) ( not ( = ?auto_354268 ?auto_354280 ) ) ( not ( = ?auto_354269 ?auto_354270 ) ) ( not ( = ?auto_354269 ?auto_354271 ) ) ( not ( = ?auto_354269 ?auto_354272 ) ) ( not ( = ?auto_354269 ?auto_354273 ) ) ( not ( = ?auto_354269 ?auto_354274 ) ) ( not ( = ?auto_354269 ?auto_354275 ) ) ( not ( = ?auto_354269 ?auto_354276 ) ) ( not ( = ?auto_354269 ?auto_354277 ) ) ( not ( = ?auto_354269 ?auto_354278 ) ) ( not ( = ?auto_354269 ?auto_354279 ) ) ( not ( = ?auto_354269 ?auto_354280 ) ) ( not ( = ?auto_354270 ?auto_354271 ) ) ( not ( = ?auto_354270 ?auto_354272 ) ) ( not ( = ?auto_354270 ?auto_354273 ) ) ( not ( = ?auto_354270 ?auto_354274 ) ) ( not ( = ?auto_354270 ?auto_354275 ) ) ( not ( = ?auto_354270 ?auto_354276 ) ) ( not ( = ?auto_354270 ?auto_354277 ) ) ( not ( = ?auto_354270 ?auto_354278 ) ) ( not ( = ?auto_354270 ?auto_354279 ) ) ( not ( = ?auto_354270 ?auto_354280 ) ) ( not ( = ?auto_354271 ?auto_354272 ) ) ( not ( = ?auto_354271 ?auto_354273 ) ) ( not ( = ?auto_354271 ?auto_354274 ) ) ( not ( = ?auto_354271 ?auto_354275 ) ) ( not ( = ?auto_354271 ?auto_354276 ) ) ( not ( = ?auto_354271 ?auto_354277 ) ) ( not ( = ?auto_354271 ?auto_354278 ) ) ( not ( = ?auto_354271 ?auto_354279 ) ) ( not ( = ?auto_354271 ?auto_354280 ) ) ( not ( = ?auto_354272 ?auto_354273 ) ) ( not ( = ?auto_354272 ?auto_354274 ) ) ( not ( = ?auto_354272 ?auto_354275 ) ) ( not ( = ?auto_354272 ?auto_354276 ) ) ( not ( = ?auto_354272 ?auto_354277 ) ) ( not ( = ?auto_354272 ?auto_354278 ) ) ( not ( = ?auto_354272 ?auto_354279 ) ) ( not ( = ?auto_354272 ?auto_354280 ) ) ( not ( = ?auto_354273 ?auto_354274 ) ) ( not ( = ?auto_354273 ?auto_354275 ) ) ( not ( = ?auto_354273 ?auto_354276 ) ) ( not ( = ?auto_354273 ?auto_354277 ) ) ( not ( = ?auto_354273 ?auto_354278 ) ) ( not ( = ?auto_354273 ?auto_354279 ) ) ( not ( = ?auto_354273 ?auto_354280 ) ) ( not ( = ?auto_354274 ?auto_354275 ) ) ( not ( = ?auto_354274 ?auto_354276 ) ) ( not ( = ?auto_354274 ?auto_354277 ) ) ( not ( = ?auto_354274 ?auto_354278 ) ) ( not ( = ?auto_354274 ?auto_354279 ) ) ( not ( = ?auto_354274 ?auto_354280 ) ) ( not ( = ?auto_354275 ?auto_354276 ) ) ( not ( = ?auto_354275 ?auto_354277 ) ) ( not ( = ?auto_354275 ?auto_354278 ) ) ( not ( = ?auto_354275 ?auto_354279 ) ) ( not ( = ?auto_354275 ?auto_354280 ) ) ( not ( = ?auto_354276 ?auto_354277 ) ) ( not ( = ?auto_354276 ?auto_354278 ) ) ( not ( = ?auto_354276 ?auto_354279 ) ) ( not ( = ?auto_354276 ?auto_354280 ) ) ( not ( = ?auto_354277 ?auto_354278 ) ) ( not ( = ?auto_354277 ?auto_354279 ) ) ( not ( = ?auto_354277 ?auto_354280 ) ) ( not ( = ?auto_354278 ?auto_354279 ) ) ( not ( = ?auto_354278 ?auto_354280 ) ) ( not ( = ?auto_354279 ?auto_354280 ) ) ( CLEAR ?auto_354277 ) ( ON ?auto_354278 ?auto_354279 ) ( CLEAR ?auto_354278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_354268 ?auto_354269 ?auto_354270 ?auto_354271 ?auto_354272 ?auto_354273 ?auto_354274 ?auto_354275 ?auto_354276 ?auto_354277 ?auto_354278 )
      ( MAKE-12PILE ?auto_354268 ?auto_354269 ?auto_354270 ?auto_354271 ?auto_354272 ?auto_354273 ?auto_354274 ?auto_354275 ?auto_354276 ?auto_354277 ?auto_354278 ?auto_354279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354318 - BLOCK
      ?auto_354319 - BLOCK
      ?auto_354320 - BLOCK
      ?auto_354321 - BLOCK
      ?auto_354322 - BLOCK
      ?auto_354323 - BLOCK
      ?auto_354324 - BLOCK
      ?auto_354325 - BLOCK
      ?auto_354326 - BLOCK
      ?auto_354327 - BLOCK
      ?auto_354328 - BLOCK
      ?auto_354329 - BLOCK
    )
    :vars
    (
      ?auto_354330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354329 ?auto_354330 ) ( ON-TABLE ?auto_354318 ) ( ON ?auto_354319 ?auto_354318 ) ( ON ?auto_354320 ?auto_354319 ) ( ON ?auto_354321 ?auto_354320 ) ( ON ?auto_354322 ?auto_354321 ) ( ON ?auto_354323 ?auto_354322 ) ( ON ?auto_354324 ?auto_354323 ) ( ON ?auto_354325 ?auto_354324 ) ( ON ?auto_354326 ?auto_354325 ) ( not ( = ?auto_354318 ?auto_354319 ) ) ( not ( = ?auto_354318 ?auto_354320 ) ) ( not ( = ?auto_354318 ?auto_354321 ) ) ( not ( = ?auto_354318 ?auto_354322 ) ) ( not ( = ?auto_354318 ?auto_354323 ) ) ( not ( = ?auto_354318 ?auto_354324 ) ) ( not ( = ?auto_354318 ?auto_354325 ) ) ( not ( = ?auto_354318 ?auto_354326 ) ) ( not ( = ?auto_354318 ?auto_354327 ) ) ( not ( = ?auto_354318 ?auto_354328 ) ) ( not ( = ?auto_354318 ?auto_354329 ) ) ( not ( = ?auto_354318 ?auto_354330 ) ) ( not ( = ?auto_354319 ?auto_354320 ) ) ( not ( = ?auto_354319 ?auto_354321 ) ) ( not ( = ?auto_354319 ?auto_354322 ) ) ( not ( = ?auto_354319 ?auto_354323 ) ) ( not ( = ?auto_354319 ?auto_354324 ) ) ( not ( = ?auto_354319 ?auto_354325 ) ) ( not ( = ?auto_354319 ?auto_354326 ) ) ( not ( = ?auto_354319 ?auto_354327 ) ) ( not ( = ?auto_354319 ?auto_354328 ) ) ( not ( = ?auto_354319 ?auto_354329 ) ) ( not ( = ?auto_354319 ?auto_354330 ) ) ( not ( = ?auto_354320 ?auto_354321 ) ) ( not ( = ?auto_354320 ?auto_354322 ) ) ( not ( = ?auto_354320 ?auto_354323 ) ) ( not ( = ?auto_354320 ?auto_354324 ) ) ( not ( = ?auto_354320 ?auto_354325 ) ) ( not ( = ?auto_354320 ?auto_354326 ) ) ( not ( = ?auto_354320 ?auto_354327 ) ) ( not ( = ?auto_354320 ?auto_354328 ) ) ( not ( = ?auto_354320 ?auto_354329 ) ) ( not ( = ?auto_354320 ?auto_354330 ) ) ( not ( = ?auto_354321 ?auto_354322 ) ) ( not ( = ?auto_354321 ?auto_354323 ) ) ( not ( = ?auto_354321 ?auto_354324 ) ) ( not ( = ?auto_354321 ?auto_354325 ) ) ( not ( = ?auto_354321 ?auto_354326 ) ) ( not ( = ?auto_354321 ?auto_354327 ) ) ( not ( = ?auto_354321 ?auto_354328 ) ) ( not ( = ?auto_354321 ?auto_354329 ) ) ( not ( = ?auto_354321 ?auto_354330 ) ) ( not ( = ?auto_354322 ?auto_354323 ) ) ( not ( = ?auto_354322 ?auto_354324 ) ) ( not ( = ?auto_354322 ?auto_354325 ) ) ( not ( = ?auto_354322 ?auto_354326 ) ) ( not ( = ?auto_354322 ?auto_354327 ) ) ( not ( = ?auto_354322 ?auto_354328 ) ) ( not ( = ?auto_354322 ?auto_354329 ) ) ( not ( = ?auto_354322 ?auto_354330 ) ) ( not ( = ?auto_354323 ?auto_354324 ) ) ( not ( = ?auto_354323 ?auto_354325 ) ) ( not ( = ?auto_354323 ?auto_354326 ) ) ( not ( = ?auto_354323 ?auto_354327 ) ) ( not ( = ?auto_354323 ?auto_354328 ) ) ( not ( = ?auto_354323 ?auto_354329 ) ) ( not ( = ?auto_354323 ?auto_354330 ) ) ( not ( = ?auto_354324 ?auto_354325 ) ) ( not ( = ?auto_354324 ?auto_354326 ) ) ( not ( = ?auto_354324 ?auto_354327 ) ) ( not ( = ?auto_354324 ?auto_354328 ) ) ( not ( = ?auto_354324 ?auto_354329 ) ) ( not ( = ?auto_354324 ?auto_354330 ) ) ( not ( = ?auto_354325 ?auto_354326 ) ) ( not ( = ?auto_354325 ?auto_354327 ) ) ( not ( = ?auto_354325 ?auto_354328 ) ) ( not ( = ?auto_354325 ?auto_354329 ) ) ( not ( = ?auto_354325 ?auto_354330 ) ) ( not ( = ?auto_354326 ?auto_354327 ) ) ( not ( = ?auto_354326 ?auto_354328 ) ) ( not ( = ?auto_354326 ?auto_354329 ) ) ( not ( = ?auto_354326 ?auto_354330 ) ) ( not ( = ?auto_354327 ?auto_354328 ) ) ( not ( = ?auto_354327 ?auto_354329 ) ) ( not ( = ?auto_354327 ?auto_354330 ) ) ( not ( = ?auto_354328 ?auto_354329 ) ) ( not ( = ?auto_354328 ?auto_354330 ) ) ( not ( = ?auto_354329 ?auto_354330 ) ) ( ON ?auto_354328 ?auto_354329 ) ( CLEAR ?auto_354326 ) ( ON ?auto_354327 ?auto_354328 ) ( CLEAR ?auto_354327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_354318 ?auto_354319 ?auto_354320 ?auto_354321 ?auto_354322 ?auto_354323 ?auto_354324 ?auto_354325 ?auto_354326 ?auto_354327 )
      ( MAKE-12PILE ?auto_354318 ?auto_354319 ?auto_354320 ?auto_354321 ?auto_354322 ?auto_354323 ?auto_354324 ?auto_354325 ?auto_354326 ?auto_354327 ?auto_354328 ?auto_354329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354368 - BLOCK
      ?auto_354369 - BLOCK
      ?auto_354370 - BLOCK
      ?auto_354371 - BLOCK
      ?auto_354372 - BLOCK
      ?auto_354373 - BLOCK
      ?auto_354374 - BLOCK
      ?auto_354375 - BLOCK
      ?auto_354376 - BLOCK
      ?auto_354377 - BLOCK
      ?auto_354378 - BLOCK
      ?auto_354379 - BLOCK
    )
    :vars
    (
      ?auto_354380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354379 ?auto_354380 ) ( ON-TABLE ?auto_354368 ) ( ON ?auto_354369 ?auto_354368 ) ( ON ?auto_354370 ?auto_354369 ) ( ON ?auto_354371 ?auto_354370 ) ( ON ?auto_354372 ?auto_354371 ) ( ON ?auto_354373 ?auto_354372 ) ( ON ?auto_354374 ?auto_354373 ) ( ON ?auto_354375 ?auto_354374 ) ( not ( = ?auto_354368 ?auto_354369 ) ) ( not ( = ?auto_354368 ?auto_354370 ) ) ( not ( = ?auto_354368 ?auto_354371 ) ) ( not ( = ?auto_354368 ?auto_354372 ) ) ( not ( = ?auto_354368 ?auto_354373 ) ) ( not ( = ?auto_354368 ?auto_354374 ) ) ( not ( = ?auto_354368 ?auto_354375 ) ) ( not ( = ?auto_354368 ?auto_354376 ) ) ( not ( = ?auto_354368 ?auto_354377 ) ) ( not ( = ?auto_354368 ?auto_354378 ) ) ( not ( = ?auto_354368 ?auto_354379 ) ) ( not ( = ?auto_354368 ?auto_354380 ) ) ( not ( = ?auto_354369 ?auto_354370 ) ) ( not ( = ?auto_354369 ?auto_354371 ) ) ( not ( = ?auto_354369 ?auto_354372 ) ) ( not ( = ?auto_354369 ?auto_354373 ) ) ( not ( = ?auto_354369 ?auto_354374 ) ) ( not ( = ?auto_354369 ?auto_354375 ) ) ( not ( = ?auto_354369 ?auto_354376 ) ) ( not ( = ?auto_354369 ?auto_354377 ) ) ( not ( = ?auto_354369 ?auto_354378 ) ) ( not ( = ?auto_354369 ?auto_354379 ) ) ( not ( = ?auto_354369 ?auto_354380 ) ) ( not ( = ?auto_354370 ?auto_354371 ) ) ( not ( = ?auto_354370 ?auto_354372 ) ) ( not ( = ?auto_354370 ?auto_354373 ) ) ( not ( = ?auto_354370 ?auto_354374 ) ) ( not ( = ?auto_354370 ?auto_354375 ) ) ( not ( = ?auto_354370 ?auto_354376 ) ) ( not ( = ?auto_354370 ?auto_354377 ) ) ( not ( = ?auto_354370 ?auto_354378 ) ) ( not ( = ?auto_354370 ?auto_354379 ) ) ( not ( = ?auto_354370 ?auto_354380 ) ) ( not ( = ?auto_354371 ?auto_354372 ) ) ( not ( = ?auto_354371 ?auto_354373 ) ) ( not ( = ?auto_354371 ?auto_354374 ) ) ( not ( = ?auto_354371 ?auto_354375 ) ) ( not ( = ?auto_354371 ?auto_354376 ) ) ( not ( = ?auto_354371 ?auto_354377 ) ) ( not ( = ?auto_354371 ?auto_354378 ) ) ( not ( = ?auto_354371 ?auto_354379 ) ) ( not ( = ?auto_354371 ?auto_354380 ) ) ( not ( = ?auto_354372 ?auto_354373 ) ) ( not ( = ?auto_354372 ?auto_354374 ) ) ( not ( = ?auto_354372 ?auto_354375 ) ) ( not ( = ?auto_354372 ?auto_354376 ) ) ( not ( = ?auto_354372 ?auto_354377 ) ) ( not ( = ?auto_354372 ?auto_354378 ) ) ( not ( = ?auto_354372 ?auto_354379 ) ) ( not ( = ?auto_354372 ?auto_354380 ) ) ( not ( = ?auto_354373 ?auto_354374 ) ) ( not ( = ?auto_354373 ?auto_354375 ) ) ( not ( = ?auto_354373 ?auto_354376 ) ) ( not ( = ?auto_354373 ?auto_354377 ) ) ( not ( = ?auto_354373 ?auto_354378 ) ) ( not ( = ?auto_354373 ?auto_354379 ) ) ( not ( = ?auto_354373 ?auto_354380 ) ) ( not ( = ?auto_354374 ?auto_354375 ) ) ( not ( = ?auto_354374 ?auto_354376 ) ) ( not ( = ?auto_354374 ?auto_354377 ) ) ( not ( = ?auto_354374 ?auto_354378 ) ) ( not ( = ?auto_354374 ?auto_354379 ) ) ( not ( = ?auto_354374 ?auto_354380 ) ) ( not ( = ?auto_354375 ?auto_354376 ) ) ( not ( = ?auto_354375 ?auto_354377 ) ) ( not ( = ?auto_354375 ?auto_354378 ) ) ( not ( = ?auto_354375 ?auto_354379 ) ) ( not ( = ?auto_354375 ?auto_354380 ) ) ( not ( = ?auto_354376 ?auto_354377 ) ) ( not ( = ?auto_354376 ?auto_354378 ) ) ( not ( = ?auto_354376 ?auto_354379 ) ) ( not ( = ?auto_354376 ?auto_354380 ) ) ( not ( = ?auto_354377 ?auto_354378 ) ) ( not ( = ?auto_354377 ?auto_354379 ) ) ( not ( = ?auto_354377 ?auto_354380 ) ) ( not ( = ?auto_354378 ?auto_354379 ) ) ( not ( = ?auto_354378 ?auto_354380 ) ) ( not ( = ?auto_354379 ?auto_354380 ) ) ( ON ?auto_354378 ?auto_354379 ) ( ON ?auto_354377 ?auto_354378 ) ( CLEAR ?auto_354375 ) ( ON ?auto_354376 ?auto_354377 ) ( CLEAR ?auto_354376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_354368 ?auto_354369 ?auto_354370 ?auto_354371 ?auto_354372 ?auto_354373 ?auto_354374 ?auto_354375 ?auto_354376 )
      ( MAKE-12PILE ?auto_354368 ?auto_354369 ?auto_354370 ?auto_354371 ?auto_354372 ?auto_354373 ?auto_354374 ?auto_354375 ?auto_354376 ?auto_354377 ?auto_354378 ?auto_354379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354418 - BLOCK
      ?auto_354419 - BLOCK
      ?auto_354420 - BLOCK
      ?auto_354421 - BLOCK
      ?auto_354422 - BLOCK
      ?auto_354423 - BLOCK
      ?auto_354424 - BLOCK
      ?auto_354425 - BLOCK
      ?auto_354426 - BLOCK
      ?auto_354427 - BLOCK
      ?auto_354428 - BLOCK
      ?auto_354429 - BLOCK
    )
    :vars
    (
      ?auto_354430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354429 ?auto_354430 ) ( ON-TABLE ?auto_354418 ) ( ON ?auto_354419 ?auto_354418 ) ( ON ?auto_354420 ?auto_354419 ) ( ON ?auto_354421 ?auto_354420 ) ( ON ?auto_354422 ?auto_354421 ) ( ON ?auto_354423 ?auto_354422 ) ( ON ?auto_354424 ?auto_354423 ) ( not ( = ?auto_354418 ?auto_354419 ) ) ( not ( = ?auto_354418 ?auto_354420 ) ) ( not ( = ?auto_354418 ?auto_354421 ) ) ( not ( = ?auto_354418 ?auto_354422 ) ) ( not ( = ?auto_354418 ?auto_354423 ) ) ( not ( = ?auto_354418 ?auto_354424 ) ) ( not ( = ?auto_354418 ?auto_354425 ) ) ( not ( = ?auto_354418 ?auto_354426 ) ) ( not ( = ?auto_354418 ?auto_354427 ) ) ( not ( = ?auto_354418 ?auto_354428 ) ) ( not ( = ?auto_354418 ?auto_354429 ) ) ( not ( = ?auto_354418 ?auto_354430 ) ) ( not ( = ?auto_354419 ?auto_354420 ) ) ( not ( = ?auto_354419 ?auto_354421 ) ) ( not ( = ?auto_354419 ?auto_354422 ) ) ( not ( = ?auto_354419 ?auto_354423 ) ) ( not ( = ?auto_354419 ?auto_354424 ) ) ( not ( = ?auto_354419 ?auto_354425 ) ) ( not ( = ?auto_354419 ?auto_354426 ) ) ( not ( = ?auto_354419 ?auto_354427 ) ) ( not ( = ?auto_354419 ?auto_354428 ) ) ( not ( = ?auto_354419 ?auto_354429 ) ) ( not ( = ?auto_354419 ?auto_354430 ) ) ( not ( = ?auto_354420 ?auto_354421 ) ) ( not ( = ?auto_354420 ?auto_354422 ) ) ( not ( = ?auto_354420 ?auto_354423 ) ) ( not ( = ?auto_354420 ?auto_354424 ) ) ( not ( = ?auto_354420 ?auto_354425 ) ) ( not ( = ?auto_354420 ?auto_354426 ) ) ( not ( = ?auto_354420 ?auto_354427 ) ) ( not ( = ?auto_354420 ?auto_354428 ) ) ( not ( = ?auto_354420 ?auto_354429 ) ) ( not ( = ?auto_354420 ?auto_354430 ) ) ( not ( = ?auto_354421 ?auto_354422 ) ) ( not ( = ?auto_354421 ?auto_354423 ) ) ( not ( = ?auto_354421 ?auto_354424 ) ) ( not ( = ?auto_354421 ?auto_354425 ) ) ( not ( = ?auto_354421 ?auto_354426 ) ) ( not ( = ?auto_354421 ?auto_354427 ) ) ( not ( = ?auto_354421 ?auto_354428 ) ) ( not ( = ?auto_354421 ?auto_354429 ) ) ( not ( = ?auto_354421 ?auto_354430 ) ) ( not ( = ?auto_354422 ?auto_354423 ) ) ( not ( = ?auto_354422 ?auto_354424 ) ) ( not ( = ?auto_354422 ?auto_354425 ) ) ( not ( = ?auto_354422 ?auto_354426 ) ) ( not ( = ?auto_354422 ?auto_354427 ) ) ( not ( = ?auto_354422 ?auto_354428 ) ) ( not ( = ?auto_354422 ?auto_354429 ) ) ( not ( = ?auto_354422 ?auto_354430 ) ) ( not ( = ?auto_354423 ?auto_354424 ) ) ( not ( = ?auto_354423 ?auto_354425 ) ) ( not ( = ?auto_354423 ?auto_354426 ) ) ( not ( = ?auto_354423 ?auto_354427 ) ) ( not ( = ?auto_354423 ?auto_354428 ) ) ( not ( = ?auto_354423 ?auto_354429 ) ) ( not ( = ?auto_354423 ?auto_354430 ) ) ( not ( = ?auto_354424 ?auto_354425 ) ) ( not ( = ?auto_354424 ?auto_354426 ) ) ( not ( = ?auto_354424 ?auto_354427 ) ) ( not ( = ?auto_354424 ?auto_354428 ) ) ( not ( = ?auto_354424 ?auto_354429 ) ) ( not ( = ?auto_354424 ?auto_354430 ) ) ( not ( = ?auto_354425 ?auto_354426 ) ) ( not ( = ?auto_354425 ?auto_354427 ) ) ( not ( = ?auto_354425 ?auto_354428 ) ) ( not ( = ?auto_354425 ?auto_354429 ) ) ( not ( = ?auto_354425 ?auto_354430 ) ) ( not ( = ?auto_354426 ?auto_354427 ) ) ( not ( = ?auto_354426 ?auto_354428 ) ) ( not ( = ?auto_354426 ?auto_354429 ) ) ( not ( = ?auto_354426 ?auto_354430 ) ) ( not ( = ?auto_354427 ?auto_354428 ) ) ( not ( = ?auto_354427 ?auto_354429 ) ) ( not ( = ?auto_354427 ?auto_354430 ) ) ( not ( = ?auto_354428 ?auto_354429 ) ) ( not ( = ?auto_354428 ?auto_354430 ) ) ( not ( = ?auto_354429 ?auto_354430 ) ) ( ON ?auto_354428 ?auto_354429 ) ( ON ?auto_354427 ?auto_354428 ) ( ON ?auto_354426 ?auto_354427 ) ( CLEAR ?auto_354424 ) ( ON ?auto_354425 ?auto_354426 ) ( CLEAR ?auto_354425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_354418 ?auto_354419 ?auto_354420 ?auto_354421 ?auto_354422 ?auto_354423 ?auto_354424 ?auto_354425 )
      ( MAKE-12PILE ?auto_354418 ?auto_354419 ?auto_354420 ?auto_354421 ?auto_354422 ?auto_354423 ?auto_354424 ?auto_354425 ?auto_354426 ?auto_354427 ?auto_354428 ?auto_354429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354468 - BLOCK
      ?auto_354469 - BLOCK
      ?auto_354470 - BLOCK
      ?auto_354471 - BLOCK
      ?auto_354472 - BLOCK
      ?auto_354473 - BLOCK
      ?auto_354474 - BLOCK
      ?auto_354475 - BLOCK
      ?auto_354476 - BLOCK
      ?auto_354477 - BLOCK
      ?auto_354478 - BLOCK
      ?auto_354479 - BLOCK
    )
    :vars
    (
      ?auto_354480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354479 ?auto_354480 ) ( ON-TABLE ?auto_354468 ) ( ON ?auto_354469 ?auto_354468 ) ( ON ?auto_354470 ?auto_354469 ) ( ON ?auto_354471 ?auto_354470 ) ( ON ?auto_354472 ?auto_354471 ) ( ON ?auto_354473 ?auto_354472 ) ( not ( = ?auto_354468 ?auto_354469 ) ) ( not ( = ?auto_354468 ?auto_354470 ) ) ( not ( = ?auto_354468 ?auto_354471 ) ) ( not ( = ?auto_354468 ?auto_354472 ) ) ( not ( = ?auto_354468 ?auto_354473 ) ) ( not ( = ?auto_354468 ?auto_354474 ) ) ( not ( = ?auto_354468 ?auto_354475 ) ) ( not ( = ?auto_354468 ?auto_354476 ) ) ( not ( = ?auto_354468 ?auto_354477 ) ) ( not ( = ?auto_354468 ?auto_354478 ) ) ( not ( = ?auto_354468 ?auto_354479 ) ) ( not ( = ?auto_354468 ?auto_354480 ) ) ( not ( = ?auto_354469 ?auto_354470 ) ) ( not ( = ?auto_354469 ?auto_354471 ) ) ( not ( = ?auto_354469 ?auto_354472 ) ) ( not ( = ?auto_354469 ?auto_354473 ) ) ( not ( = ?auto_354469 ?auto_354474 ) ) ( not ( = ?auto_354469 ?auto_354475 ) ) ( not ( = ?auto_354469 ?auto_354476 ) ) ( not ( = ?auto_354469 ?auto_354477 ) ) ( not ( = ?auto_354469 ?auto_354478 ) ) ( not ( = ?auto_354469 ?auto_354479 ) ) ( not ( = ?auto_354469 ?auto_354480 ) ) ( not ( = ?auto_354470 ?auto_354471 ) ) ( not ( = ?auto_354470 ?auto_354472 ) ) ( not ( = ?auto_354470 ?auto_354473 ) ) ( not ( = ?auto_354470 ?auto_354474 ) ) ( not ( = ?auto_354470 ?auto_354475 ) ) ( not ( = ?auto_354470 ?auto_354476 ) ) ( not ( = ?auto_354470 ?auto_354477 ) ) ( not ( = ?auto_354470 ?auto_354478 ) ) ( not ( = ?auto_354470 ?auto_354479 ) ) ( not ( = ?auto_354470 ?auto_354480 ) ) ( not ( = ?auto_354471 ?auto_354472 ) ) ( not ( = ?auto_354471 ?auto_354473 ) ) ( not ( = ?auto_354471 ?auto_354474 ) ) ( not ( = ?auto_354471 ?auto_354475 ) ) ( not ( = ?auto_354471 ?auto_354476 ) ) ( not ( = ?auto_354471 ?auto_354477 ) ) ( not ( = ?auto_354471 ?auto_354478 ) ) ( not ( = ?auto_354471 ?auto_354479 ) ) ( not ( = ?auto_354471 ?auto_354480 ) ) ( not ( = ?auto_354472 ?auto_354473 ) ) ( not ( = ?auto_354472 ?auto_354474 ) ) ( not ( = ?auto_354472 ?auto_354475 ) ) ( not ( = ?auto_354472 ?auto_354476 ) ) ( not ( = ?auto_354472 ?auto_354477 ) ) ( not ( = ?auto_354472 ?auto_354478 ) ) ( not ( = ?auto_354472 ?auto_354479 ) ) ( not ( = ?auto_354472 ?auto_354480 ) ) ( not ( = ?auto_354473 ?auto_354474 ) ) ( not ( = ?auto_354473 ?auto_354475 ) ) ( not ( = ?auto_354473 ?auto_354476 ) ) ( not ( = ?auto_354473 ?auto_354477 ) ) ( not ( = ?auto_354473 ?auto_354478 ) ) ( not ( = ?auto_354473 ?auto_354479 ) ) ( not ( = ?auto_354473 ?auto_354480 ) ) ( not ( = ?auto_354474 ?auto_354475 ) ) ( not ( = ?auto_354474 ?auto_354476 ) ) ( not ( = ?auto_354474 ?auto_354477 ) ) ( not ( = ?auto_354474 ?auto_354478 ) ) ( not ( = ?auto_354474 ?auto_354479 ) ) ( not ( = ?auto_354474 ?auto_354480 ) ) ( not ( = ?auto_354475 ?auto_354476 ) ) ( not ( = ?auto_354475 ?auto_354477 ) ) ( not ( = ?auto_354475 ?auto_354478 ) ) ( not ( = ?auto_354475 ?auto_354479 ) ) ( not ( = ?auto_354475 ?auto_354480 ) ) ( not ( = ?auto_354476 ?auto_354477 ) ) ( not ( = ?auto_354476 ?auto_354478 ) ) ( not ( = ?auto_354476 ?auto_354479 ) ) ( not ( = ?auto_354476 ?auto_354480 ) ) ( not ( = ?auto_354477 ?auto_354478 ) ) ( not ( = ?auto_354477 ?auto_354479 ) ) ( not ( = ?auto_354477 ?auto_354480 ) ) ( not ( = ?auto_354478 ?auto_354479 ) ) ( not ( = ?auto_354478 ?auto_354480 ) ) ( not ( = ?auto_354479 ?auto_354480 ) ) ( ON ?auto_354478 ?auto_354479 ) ( ON ?auto_354477 ?auto_354478 ) ( ON ?auto_354476 ?auto_354477 ) ( ON ?auto_354475 ?auto_354476 ) ( CLEAR ?auto_354473 ) ( ON ?auto_354474 ?auto_354475 ) ( CLEAR ?auto_354474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_354468 ?auto_354469 ?auto_354470 ?auto_354471 ?auto_354472 ?auto_354473 ?auto_354474 )
      ( MAKE-12PILE ?auto_354468 ?auto_354469 ?auto_354470 ?auto_354471 ?auto_354472 ?auto_354473 ?auto_354474 ?auto_354475 ?auto_354476 ?auto_354477 ?auto_354478 ?auto_354479 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354518 - BLOCK
      ?auto_354519 - BLOCK
      ?auto_354520 - BLOCK
      ?auto_354521 - BLOCK
      ?auto_354522 - BLOCK
      ?auto_354523 - BLOCK
      ?auto_354524 - BLOCK
      ?auto_354525 - BLOCK
      ?auto_354526 - BLOCK
      ?auto_354527 - BLOCK
      ?auto_354528 - BLOCK
      ?auto_354529 - BLOCK
    )
    :vars
    (
      ?auto_354530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354529 ?auto_354530 ) ( ON-TABLE ?auto_354518 ) ( ON ?auto_354519 ?auto_354518 ) ( ON ?auto_354520 ?auto_354519 ) ( ON ?auto_354521 ?auto_354520 ) ( ON ?auto_354522 ?auto_354521 ) ( not ( = ?auto_354518 ?auto_354519 ) ) ( not ( = ?auto_354518 ?auto_354520 ) ) ( not ( = ?auto_354518 ?auto_354521 ) ) ( not ( = ?auto_354518 ?auto_354522 ) ) ( not ( = ?auto_354518 ?auto_354523 ) ) ( not ( = ?auto_354518 ?auto_354524 ) ) ( not ( = ?auto_354518 ?auto_354525 ) ) ( not ( = ?auto_354518 ?auto_354526 ) ) ( not ( = ?auto_354518 ?auto_354527 ) ) ( not ( = ?auto_354518 ?auto_354528 ) ) ( not ( = ?auto_354518 ?auto_354529 ) ) ( not ( = ?auto_354518 ?auto_354530 ) ) ( not ( = ?auto_354519 ?auto_354520 ) ) ( not ( = ?auto_354519 ?auto_354521 ) ) ( not ( = ?auto_354519 ?auto_354522 ) ) ( not ( = ?auto_354519 ?auto_354523 ) ) ( not ( = ?auto_354519 ?auto_354524 ) ) ( not ( = ?auto_354519 ?auto_354525 ) ) ( not ( = ?auto_354519 ?auto_354526 ) ) ( not ( = ?auto_354519 ?auto_354527 ) ) ( not ( = ?auto_354519 ?auto_354528 ) ) ( not ( = ?auto_354519 ?auto_354529 ) ) ( not ( = ?auto_354519 ?auto_354530 ) ) ( not ( = ?auto_354520 ?auto_354521 ) ) ( not ( = ?auto_354520 ?auto_354522 ) ) ( not ( = ?auto_354520 ?auto_354523 ) ) ( not ( = ?auto_354520 ?auto_354524 ) ) ( not ( = ?auto_354520 ?auto_354525 ) ) ( not ( = ?auto_354520 ?auto_354526 ) ) ( not ( = ?auto_354520 ?auto_354527 ) ) ( not ( = ?auto_354520 ?auto_354528 ) ) ( not ( = ?auto_354520 ?auto_354529 ) ) ( not ( = ?auto_354520 ?auto_354530 ) ) ( not ( = ?auto_354521 ?auto_354522 ) ) ( not ( = ?auto_354521 ?auto_354523 ) ) ( not ( = ?auto_354521 ?auto_354524 ) ) ( not ( = ?auto_354521 ?auto_354525 ) ) ( not ( = ?auto_354521 ?auto_354526 ) ) ( not ( = ?auto_354521 ?auto_354527 ) ) ( not ( = ?auto_354521 ?auto_354528 ) ) ( not ( = ?auto_354521 ?auto_354529 ) ) ( not ( = ?auto_354521 ?auto_354530 ) ) ( not ( = ?auto_354522 ?auto_354523 ) ) ( not ( = ?auto_354522 ?auto_354524 ) ) ( not ( = ?auto_354522 ?auto_354525 ) ) ( not ( = ?auto_354522 ?auto_354526 ) ) ( not ( = ?auto_354522 ?auto_354527 ) ) ( not ( = ?auto_354522 ?auto_354528 ) ) ( not ( = ?auto_354522 ?auto_354529 ) ) ( not ( = ?auto_354522 ?auto_354530 ) ) ( not ( = ?auto_354523 ?auto_354524 ) ) ( not ( = ?auto_354523 ?auto_354525 ) ) ( not ( = ?auto_354523 ?auto_354526 ) ) ( not ( = ?auto_354523 ?auto_354527 ) ) ( not ( = ?auto_354523 ?auto_354528 ) ) ( not ( = ?auto_354523 ?auto_354529 ) ) ( not ( = ?auto_354523 ?auto_354530 ) ) ( not ( = ?auto_354524 ?auto_354525 ) ) ( not ( = ?auto_354524 ?auto_354526 ) ) ( not ( = ?auto_354524 ?auto_354527 ) ) ( not ( = ?auto_354524 ?auto_354528 ) ) ( not ( = ?auto_354524 ?auto_354529 ) ) ( not ( = ?auto_354524 ?auto_354530 ) ) ( not ( = ?auto_354525 ?auto_354526 ) ) ( not ( = ?auto_354525 ?auto_354527 ) ) ( not ( = ?auto_354525 ?auto_354528 ) ) ( not ( = ?auto_354525 ?auto_354529 ) ) ( not ( = ?auto_354525 ?auto_354530 ) ) ( not ( = ?auto_354526 ?auto_354527 ) ) ( not ( = ?auto_354526 ?auto_354528 ) ) ( not ( = ?auto_354526 ?auto_354529 ) ) ( not ( = ?auto_354526 ?auto_354530 ) ) ( not ( = ?auto_354527 ?auto_354528 ) ) ( not ( = ?auto_354527 ?auto_354529 ) ) ( not ( = ?auto_354527 ?auto_354530 ) ) ( not ( = ?auto_354528 ?auto_354529 ) ) ( not ( = ?auto_354528 ?auto_354530 ) ) ( not ( = ?auto_354529 ?auto_354530 ) ) ( ON ?auto_354528 ?auto_354529 ) ( ON ?auto_354527 ?auto_354528 ) ( ON ?auto_354526 ?auto_354527 ) ( ON ?auto_354525 ?auto_354526 ) ( ON ?auto_354524 ?auto_354525 ) ( CLEAR ?auto_354522 ) ( ON ?auto_354523 ?auto_354524 ) ( CLEAR ?auto_354523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_354518 ?auto_354519 ?auto_354520 ?auto_354521 ?auto_354522 ?auto_354523 )
      ( MAKE-12PILE ?auto_354518 ?auto_354519 ?auto_354520 ?auto_354521 ?auto_354522 ?auto_354523 ?auto_354524 ?auto_354525 ?auto_354526 ?auto_354527 ?auto_354528 ?auto_354529 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354568 - BLOCK
      ?auto_354569 - BLOCK
      ?auto_354570 - BLOCK
      ?auto_354571 - BLOCK
      ?auto_354572 - BLOCK
      ?auto_354573 - BLOCK
      ?auto_354574 - BLOCK
      ?auto_354575 - BLOCK
      ?auto_354576 - BLOCK
      ?auto_354577 - BLOCK
      ?auto_354578 - BLOCK
      ?auto_354579 - BLOCK
    )
    :vars
    (
      ?auto_354580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354579 ?auto_354580 ) ( ON-TABLE ?auto_354568 ) ( ON ?auto_354569 ?auto_354568 ) ( ON ?auto_354570 ?auto_354569 ) ( ON ?auto_354571 ?auto_354570 ) ( not ( = ?auto_354568 ?auto_354569 ) ) ( not ( = ?auto_354568 ?auto_354570 ) ) ( not ( = ?auto_354568 ?auto_354571 ) ) ( not ( = ?auto_354568 ?auto_354572 ) ) ( not ( = ?auto_354568 ?auto_354573 ) ) ( not ( = ?auto_354568 ?auto_354574 ) ) ( not ( = ?auto_354568 ?auto_354575 ) ) ( not ( = ?auto_354568 ?auto_354576 ) ) ( not ( = ?auto_354568 ?auto_354577 ) ) ( not ( = ?auto_354568 ?auto_354578 ) ) ( not ( = ?auto_354568 ?auto_354579 ) ) ( not ( = ?auto_354568 ?auto_354580 ) ) ( not ( = ?auto_354569 ?auto_354570 ) ) ( not ( = ?auto_354569 ?auto_354571 ) ) ( not ( = ?auto_354569 ?auto_354572 ) ) ( not ( = ?auto_354569 ?auto_354573 ) ) ( not ( = ?auto_354569 ?auto_354574 ) ) ( not ( = ?auto_354569 ?auto_354575 ) ) ( not ( = ?auto_354569 ?auto_354576 ) ) ( not ( = ?auto_354569 ?auto_354577 ) ) ( not ( = ?auto_354569 ?auto_354578 ) ) ( not ( = ?auto_354569 ?auto_354579 ) ) ( not ( = ?auto_354569 ?auto_354580 ) ) ( not ( = ?auto_354570 ?auto_354571 ) ) ( not ( = ?auto_354570 ?auto_354572 ) ) ( not ( = ?auto_354570 ?auto_354573 ) ) ( not ( = ?auto_354570 ?auto_354574 ) ) ( not ( = ?auto_354570 ?auto_354575 ) ) ( not ( = ?auto_354570 ?auto_354576 ) ) ( not ( = ?auto_354570 ?auto_354577 ) ) ( not ( = ?auto_354570 ?auto_354578 ) ) ( not ( = ?auto_354570 ?auto_354579 ) ) ( not ( = ?auto_354570 ?auto_354580 ) ) ( not ( = ?auto_354571 ?auto_354572 ) ) ( not ( = ?auto_354571 ?auto_354573 ) ) ( not ( = ?auto_354571 ?auto_354574 ) ) ( not ( = ?auto_354571 ?auto_354575 ) ) ( not ( = ?auto_354571 ?auto_354576 ) ) ( not ( = ?auto_354571 ?auto_354577 ) ) ( not ( = ?auto_354571 ?auto_354578 ) ) ( not ( = ?auto_354571 ?auto_354579 ) ) ( not ( = ?auto_354571 ?auto_354580 ) ) ( not ( = ?auto_354572 ?auto_354573 ) ) ( not ( = ?auto_354572 ?auto_354574 ) ) ( not ( = ?auto_354572 ?auto_354575 ) ) ( not ( = ?auto_354572 ?auto_354576 ) ) ( not ( = ?auto_354572 ?auto_354577 ) ) ( not ( = ?auto_354572 ?auto_354578 ) ) ( not ( = ?auto_354572 ?auto_354579 ) ) ( not ( = ?auto_354572 ?auto_354580 ) ) ( not ( = ?auto_354573 ?auto_354574 ) ) ( not ( = ?auto_354573 ?auto_354575 ) ) ( not ( = ?auto_354573 ?auto_354576 ) ) ( not ( = ?auto_354573 ?auto_354577 ) ) ( not ( = ?auto_354573 ?auto_354578 ) ) ( not ( = ?auto_354573 ?auto_354579 ) ) ( not ( = ?auto_354573 ?auto_354580 ) ) ( not ( = ?auto_354574 ?auto_354575 ) ) ( not ( = ?auto_354574 ?auto_354576 ) ) ( not ( = ?auto_354574 ?auto_354577 ) ) ( not ( = ?auto_354574 ?auto_354578 ) ) ( not ( = ?auto_354574 ?auto_354579 ) ) ( not ( = ?auto_354574 ?auto_354580 ) ) ( not ( = ?auto_354575 ?auto_354576 ) ) ( not ( = ?auto_354575 ?auto_354577 ) ) ( not ( = ?auto_354575 ?auto_354578 ) ) ( not ( = ?auto_354575 ?auto_354579 ) ) ( not ( = ?auto_354575 ?auto_354580 ) ) ( not ( = ?auto_354576 ?auto_354577 ) ) ( not ( = ?auto_354576 ?auto_354578 ) ) ( not ( = ?auto_354576 ?auto_354579 ) ) ( not ( = ?auto_354576 ?auto_354580 ) ) ( not ( = ?auto_354577 ?auto_354578 ) ) ( not ( = ?auto_354577 ?auto_354579 ) ) ( not ( = ?auto_354577 ?auto_354580 ) ) ( not ( = ?auto_354578 ?auto_354579 ) ) ( not ( = ?auto_354578 ?auto_354580 ) ) ( not ( = ?auto_354579 ?auto_354580 ) ) ( ON ?auto_354578 ?auto_354579 ) ( ON ?auto_354577 ?auto_354578 ) ( ON ?auto_354576 ?auto_354577 ) ( ON ?auto_354575 ?auto_354576 ) ( ON ?auto_354574 ?auto_354575 ) ( ON ?auto_354573 ?auto_354574 ) ( CLEAR ?auto_354571 ) ( ON ?auto_354572 ?auto_354573 ) ( CLEAR ?auto_354572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_354568 ?auto_354569 ?auto_354570 ?auto_354571 ?auto_354572 )
      ( MAKE-12PILE ?auto_354568 ?auto_354569 ?auto_354570 ?auto_354571 ?auto_354572 ?auto_354573 ?auto_354574 ?auto_354575 ?auto_354576 ?auto_354577 ?auto_354578 ?auto_354579 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354618 - BLOCK
      ?auto_354619 - BLOCK
      ?auto_354620 - BLOCK
      ?auto_354621 - BLOCK
      ?auto_354622 - BLOCK
      ?auto_354623 - BLOCK
      ?auto_354624 - BLOCK
      ?auto_354625 - BLOCK
      ?auto_354626 - BLOCK
      ?auto_354627 - BLOCK
      ?auto_354628 - BLOCK
      ?auto_354629 - BLOCK
    )
    :vars
    (
      ?auto_354630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354629 ?auto_354630 ) ( ON-TABLE ?auto_354618 ) ( ON ?auto_354619 ?auto_354618 ) ( ON ?auto_354620 ?auto_354619 ) ( not ( = ?auto_354618 ?auto_354619 ) ) ( not ( = ?auto_354618 ?auto_354620 ) ) ( not ( = ?auto_354618 ?auto_354621 ) ) ( not ( = ?auto_354618 ?auto_354622 ) ) ( not ( = ?auto_354618 ?auto_354623 ) ) ( not ( = ?auto_354618 ?auto_354624 ) ) ( not ( = ?auto_354618 ?auto_354625 ) ) ( not ( = ?auto_354618 ?auto_354626 ) ) ( not ( = ?auto_354618 ?auto_354627 ) ) ( not ( = ?auto_354618 ?auto_354628 ) ) ( not ( = ?auto_354618 ?auto_354629 ) ) ( not ( = ?auto_354618 ?auto_354630 ) ) ( not ( = ?auto_354619 ?auto_354620 ) ) ( not ( = ?auto_354619 ?auto_354621 ) ) ( not ( = ?auto_354619 ?auto_354622 ) ) ( not ( = ?auto_354619 ?auto_354623 ) ) ( not ( = ?auto_354619 ?auto_354624 ) ) ( not ( = ?auto_354619 ?auto_354625 ) ) ( not ( = ?auto_354619 ?auto_354626 ) ) ( not ( = ?auto_354619 ?auto_354627 ) ) ( not ( = ?auto_354619 ?auto_354628 ) ) ( not ( = ?auto_354619 ?auto_354629 ) ) ( not ( = ?auto_354619 ?auto_354630 ) ) ( not ( = ?auto_354620 ?auto_354621 ) ) ( not ( = ?auto_354620 ?auto_354622 ) ) ( not ( = ?auto_354620 ?auto_354623 ) ) ( not ( = ?auto_354620 ?auto_354624 ) ) ( not ( = ?auto_354620 ?auto_354625 ) ) ( not ( = ?auto_354620 ?auto_354626 ) ) ( not ( = ?auto_354620 ?auto_354627 ) ) ( not ( = ?auto_354620 ?auto_354628 ) ) ( not ( = ?auto_354620 ?auto_354629 ) ) ( not ( = ?auto_354620 ?auto_354630 ) ) ( not ( = ?auto_354621 ?auto_354622 ) ) ( not ( = ?auto_354621 ?auto_354623 ) ) ( not ( = ?auto_354621 ?auto_354624 ) ) ( not ( = ?auto_354621 ?auto_354625 ) ) ( not ( = ?auto_354621 ?auto_354626 ) ) ( not ( = ?auto_354621 ?auto_354627 ) ) ( not ( = ?auto_354621 ?auto_354628 ) ) ( not ( = ?auto_354621 ?auto_354629 ) ) ( not ( = ?auto_354621 ?auto_354630 ) ) ( not ( = ?auto_354622 ?auto_354623 ) ) ( not ( = ?auto_354622 ?auto_354624 ) ) ( not ( = ?auto_354622 ?auto_354625 ) ) ( not ( = ?auto_354622 ?auto_354626 ) ) ( not ( = ?auto_354622 ?auto_354627 ) ) ( not ( = ?auto_354622 ?auto_354628 ) ) ( not ( = ?auto_354622 ?auto_354629 ) ) ( not ( = ?auto_354622 ?auto_354630 ) ) ( not ( = ?auto_354623 ?auto_354624 ) ) ( not ( = ?auto_354623 ?auto_354625 ) ) ( not ( = ?auto_354623 ?auto_354626 ) ) ( not ( = ?auto_354623 ?auto_354627 ) ) ( not ( = ?auto_354623 ?auto_354628 ) ) ( not ( = ?auto_354623 ?auto_354629 ) ) ( not ( = ?auto_354623 ?auto_354630 ) ) ( not ( = ?auto_354624 ?auto_354625 ) ) ( not ( = ?auto_354624 ?auto_354626 ) ) ( not ( = ?auto_354624 ?auto_354627 ) ) ( not ( = ?auto_354624 ?auto_354628 ) ) ( not ( = ?auto_354624 ?auto_354629 ) ) ( not ( = ?auto_354624 ?auto_354630 ) ) ( not ( = ?auto_354625 ?auto_354626 ) ) ( not ( = ?auto_354625 ?auto_354627 ) ) ( not ( = ?auto_354625 ?auto_354628 ) ) ( not ( = ?auto_354625 ?auto_354629 ) ) ( not ( = ?auto_354625 ?auto_354630 ) ) ( not ( = ?auto_354626 ?auto_354627 ) ) ( not ( = ?auto_354626 ?auto_354628 ) ) ( not ( = ?auto_354626 ?auto_354629 ) ) ( not ( = ?auto_354626 ?auto_354630 ) ) ( not ( = ?auto_354627 ?auto_354628 ) ) ( not ( = ?auto_354627 ?auto_354629 ) ) ( not ( = ?auto_354627 ?auto_354630 ) ) ( not ( = ?auto_354628 ?auto_354629 ) ) ( not ( = ?auto_354628 ?auto_354630 ) ) ( not ( = ?auto_354629 ?auto_354630 ) ) ( ON ?auto_354628 ?auto_354629 ) ( ON ?auto_354627 ?auto_354628 ) ( ON ?auto_354626 ?auto_354627 ) ( ON ?auto_354625 ?auto_354626 ) ( ON ?auto_354624 ?auto_354625 ) ( ON ?auto_354623 ?auto_354624 ) ( ON ?auto_354622 ?auto_354623 ) ( CLEAR ?auto_354620 ) ( ON ?auto_354621 ?auto_354622 ) ( CLEAR ?auto_354621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_354618 ?auto_354619 ?auto_354620 ?auto_354621 )
      ( MAKE-12PILE ?auto_354618 ?auto_354619 ?auto_354620 ?auto_354621 ?auto_354622 ?auto_354623 ?auto_354624 ?auto_354625 ?auto_354626 ?auto_354627 ?auto_354628 ?auto_354629 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354668 - BLOCK
      ?auto_354669 - BLOCK
      ?auto_354670 - BLOCK
      ?auto_354671 - BLOCK
      ?auto_354672 - BLOCK
      ?auto_354673 - BLOCK
      ?auto_354674 - BLOCK
      ?auto_354675 - BLOCK
      ?auto_354676 - BLOCK
      ?auto_354677 - BLOCK
      ?auto_354678 - BLOCK
      ?auto_354679 - BLOCK
    )
    :vars
    (
      ?auto_354680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354679 ?auto_354680 ) ( ON-TABLE ?auto_354668 ) ( ON ?auto_354669 ?auto_354668 ) ( not ( = ?auto_354668 ?auto_354669 ) ) ( not ( = ?auto_354668 ?auto_354670 ) ) ( not ( = ?auto_354668 ?auto_354671 ) ) ( not ( = ?auto_354668 ?auto_354672 ) ) ( not ( = ?auto_354668 ?auto_354673 ) ) ( not ( = ?auto_354668 ?auto_354674 ) ) ( not ( = ?auto_354668 ?auto_354675 ) ) ( not ( = ?auto_354668 ?auto_354676 ) ) ( not ( = ?auto_354668 ?auto_354677 ) ) ( not ( = ?auto_354668 ?auto_354678 ) ) ( not ( = ?auto_354668 ?auto_354679 ) ) ( not ( = ?auto_354668 ?auto_354680 ) ) ( not ( = ?auto_354669 ?auto_354670 ) ) ( not ( = ?auto_354669 ?auto_354671 ) ) ( not ( = ?auto_354669 ?auto_354672 ) ) ( not ( = ?auto_354669 ?auto_354673 ) ) ( not ( = ?auto_354669 ?auto_354674 ) ) ( not ( = ?auto_354669 ?auto_354675 ) ) ( not ( = ?auto_354669 ?auto_354676 ) ) ( not ( = ?auto_354669 ?auto_354677 ) ) ( not ( = ?auto_354669 ?auto_354678 ) ) ( not ( = ?auto_354669 ?auto_354679 ) ) ( not ( = ?auto_354669 ?auto_354680 ) ) ( not ( = ?auto_354670 ?auto_354671 ) ) ( not ( = ?auto_354670 ?auto_354672 ) ) ( not ( = ?auto_354670 ?auto_354673 ) ) ( not ( = ?auto_354670 ?auto_354674 ) ) ( not ( = ?auto_354670 ?auto_354675 ) ) ( not ( = ?auto_354670 ?auto_354676 ) ) ( not ( = ?auto_354670 ?auto_354677 ) ) ( not ( = ?auto_354670 ?auto_354678 ) ) ( not ( = ?auto_354670 ?auto_354679 ) ) ( not ( = ?auto_354670 ?auto_354680 ) ) ( not ( = ?auto_354671 ?auto_354672 ) ) ( not ( = ?auto_354671 ?auto_354673 ) ) ( not ( = ?auto_354671 ?auto_354674 ) ) ( not ( = ?auto_354671 ?auto_354675 ) ) ( not ( = ?auto_354671 ?auto_354676 ) ) ( not ( = ?auto_354671 ?auto_354677 ) ) ( not ( = ?auto_354671 ?auto_354678 ) ) ( not ( = ?auto_354671 ?auto_354679 ) ) ( not ( = ?auto_354671 ?auto_354680 ) ) ( not ( = ?auto_354672 ?auto_354673 ) ) ( not ( = ?auto_354672 ?auto_354674 ) ) ( not ( = ?auto_354672 ?auto_354675 ) ) ( not ( = ?auto_354672 ?auto_354676 ) ) ( not ( = ?auto_354672 ?auto_354677 ) ) ( not ( = ?auto_354672 ?auto_354678 ) ) ( not ( = ?auto_354672 ?auto_354679 ) ) ( not ( = ?auto_354672 ?auto_354680 ) ) ( not ( = ?auto_354673 ?auto_354674 ) ) ( not ( = ?auto_354673 ?auto_354675 ) ) ( not ( = ?auto_354673 ?auto_354676 ) ) ( not ( = ?auto_354673 ?auto_354677 ) ) ( not ( = ?auto_354673 ?auto_354678 ) ) ( not ( = ?auto_354673 ?auto_354679 ) ) ( not ( = ?auto_354673 ?auto_354680 ) ) ( not ( = ?auto_354674 ?auto_354675 ) ) ( not ( = ?auto_354674 ?auto_354676 ) ) ( not ( = ?auto_354674 ?auto_354677 ) ) ( not ( = ?auto_354674 ?auto_354678 ) ) ( not ( = ?auto_354674 ?auto_354679 ) ) ( not ( = ?auto_354674 ?auto_354680 ) ) ( not ( = ?auto_354675 ?auto_354676 ) ) ( not ( = ?auto_354675 ?auto_354677 ) ) ( not ( = ?auto_354675 ?auto_354678 ) ) ( not ( = ?auto_354675 ?auto_354679 ) ) ( not ( = ?auto_354675 ?auto_354680 ) ) ( not ( = ?auto_354676 ?auto_354677 ) ) ( not ( = ?auto_354676 ?auto_354678 ) ) ( not ( = ?auto_354676 ?auto_354679 ) ) ( not ( = ?auto_354676 ?auto_354680 ) ) ( not ( = ?auto_354677 ?auto_354678 ) ) ( not ( = ?auto_354677 ?auto_354679 ) ) ( not ( = ?auto_354677 ?auto_354680 ) ) ( not ( = ?auto_354678 ?auto_354679 ) ) ( not ( = ?auto_354678 ?auto_354680 ) ) ( not ( = ?auto_354679 ?auto_354680 ) ) ( ON ?auto_354678 ?auto_354679 ) ( ON ?auto_354677 ?auto_354678 ) ( ON ?auto_354676 ?auto_354677 ) ( ON ?auto_354675 ?auto_354676 ) ( ON ?auto_354674 ?auto_354675 ) ( ON ?auto_354673 ?auto_354674 ) ( ON ?auto_354672 ?auto_354673 ) ( ON ?auto_354671 ?auto_354672 ) ( CLEAR ?auto_354669 ) ( ON ?auto_354670 ?auto_354671 ) ( CLEAR ?auto_354670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_354668 ?auto_354669 ?auto_354670 )
      ( MAKE-12PILE ?auto_354668 ?auto_354669 ?auto_354670 ?auto_354671 ?auto_354672 ?auto_354673 ?auto_354674 ?auto_354675 ?auto_354676 ?auto_354677 ?auto_354678 ?auto_354679 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354718 - BLOCK
      ?auto_354719 - BLOCK
      ?auto_354720 - BLOCK
      ?auto_354721 - BLOCK
      ?auto_354722 - BLOCK
      ?auto_354723 - BLOCK
      ?auto_354724 - BLOCK
      ?auto_354725 - BLOCK
      ?auto_354726 - BLOCK
      ?auto_354727 - BLOCK
      ?auto_354728 - BLOCK
      ?auto_354729 - BLOCK
    )
    :vars
    (
      ?auto_354730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354729 ?auto_354730 ) ( ON-TABLE ?auto_354718 ) ( not ( = ?auto_354718 ?auto_354719 ) ) ( not ( = ?auto_354718 ?auto_354720 ) ) ( not ( = ?auto_354718 ?auto_354721 ) ) ( not ( = ?auto_354718 ?auto_354722 ) ) ( not ( = ?auto_354718 ?auto_354723 ) ) ( not ( = ?auto_354718 ?auto_354724 ) ) ( not ( = ?auto_354718 ?auto_354725 ) ) ( not ( = ?auto_354718 ?auto_354726 ) ) ( not ( = ?auto_354718 ?auto_354727 ) ) ( not ( = ?auto_354718 ?auto_354728 ) ) ( not ( = ?auto_354718 ?auto_354729 ) ) ( not ( = ?auto_354718 ?auto_354730 ) ) ( not ( = ?auto_354719 ?auto_354720 ) ) ( not ( = ?auto_354719 ?auto_354721 ) ) ( not ( = ?auto_354719 ?auto_354722 ) ) ( not ( = ?auto_354719 ?auto_354723 ) ) ( not ( = ?auto_354719 ?auto_354724 ) ) ( not ( = ?auto_354719 ?auto_354725 ) ) ( not ( = ?auto_354719 ?auto_354726 ) ) ( not ( = ?auto_354719 ?auto_354727 ) ) ( not ( = ?auto_354719 ?auto_354728 ) ) ( not ( = ?auto_354719 ?auto_354729 ) ) ( not ( = ?auto_354719 ?auto_354730 ) ) ( not ( = ?auto_354720 ?auto_354721 ) ) ( not ( = ?auto_354720 ?auto_354722 ) ) ( not ( = ?auto_354720 ?auto_354723 ) ) ( not ( = ?auto_354720 ?auto_354724 ) ) ( not ( = ?auto_354720 ?auto_354725 ) ) ( not ( = ?auto_354720 ?auto_354726 ) ) ( not ( = ?auto_354720 ?auto_354727 ) ) ( not ( = ?auto_354720 ?auto_354728 ) ) ( not ( = ?auto_354720 ?auto_354729 ) ) ( not ( = ?auto_354720 ?auto_354730 ) ) ( not ( = ?auto_354721 ?auto_354722 ) ) ( not ( = ?auto_354721 ?auto_354723 ) ) ( not ( = ?auto_354721 ?auto_354724 ) ) ( not ( = ?auto_354721 ?auto_354725 ) ) ( not ( = ?auto_354721 ?auto_354726 ) ) ( not ( = ?auto_354721 ?auto_354727 ) ) ( not ( = ?auto_354721 ?auto_354728 ) ) ( not ( = ?auto_354721 ?auto_354729 ) ) ( not ( = ?auto_354721 ?auto_354730 ) ) ( not ( = ?auto_354722 ?auto_354723 ) ) ( not ( = ?auto_354722 ?auto_354724 ) ) ( not ( = ?auto_354722 ?auto_354725 ) ) ( not ( = ?auto_354722 ?auto_354726 ) ) ( not ( = ?auto_354722 ?auto_354727 ) ) ( not ( = ?auto_354722 ?auto_354728 ) ) ( not ( = ?auto_354722 ?auto_354729 ) ) ( not ( = ?auto_354722 ?auto_354730 ) ) ( not ( = ?auto_354723 ?auto_354724 ) ) ( not ( = ?auto_354723 ?auto_354725 ) ) ( not ( = ?auto_354723 ?auto_354726 ) ) ( not ( = ?auto_354723 ?auto_354727 ) ) ( not ( = ?auto_354723 ?auto_354728 ) ) ( not ( = ?auto_354723 ?auto_354729 ) ) ( not ( = ?auto_354723 ?auto_354730 ) ) ( not ( = ?auto_354724 ?auto_354725 ) ) ( not ( = ?auto_354724 ?auto_354726 ) ) ( not ( = ?auto_354724 ?auto_354727 ) ) ( not ( = ?auto_354724 ?auto_354728 ) ) ( not ( = ?auto_354724 ?auto_354729 ) ) ( not ( = ?auto_354724 ?auto_354730 ) ) ( not ( = ?auto_354725 ?auto_354726 ) ) ( not ( = ?auto_354725 ?auto_354727 ) ) ( not ( = ?auto_354725 ?auto_354728 ) ) ( not ( = ?auto_354725 ?auto_354729 ) ) ( not ( = ?auto_354725 ?auto_354730 ) ) ( not ( = ?auto_354726 ?auto_354727 ) ) ( not ( = ?auto_354726 ?auto_354728 ) ) ( not ( = ?auto_354726 ?auto_354729 ) ) ( not ( = ?auto_354726 ?auto_354730 ) ) ( not ( = ?auto_354727 ?auto_354728 ) ) ( not ( = ?auto_354727 ?auto_354729 ) ) ( not ( = ?auto_354727 ?auto_354730 ) ) ( not ( = ?auto_354728 ?auto_354729 ) ) ( not ( = ?auto_354728 ?auto_354730 ) ) ( not ( = ?auto_354729 ?auto_354730 ) ) ( ON ?auto_354728 ?auto_354729 ) ( ON ?auto_354727 ?auto_354728 ) ( ON ?auto_354726 ?auto_354727 ) ( ON ?auto_354725 ?auto_354726 ) ( ON ?auto_354724 ?auto_354725 ) ( ON ?auto_354723 ?auto_354724 ) ( ON ?auto_354722 ?auto_354723 ) ( ON ?auto_354721 ?auto_354722 ) ( ON ?auto_354720 ?auto_354721 ) ( CLEAR ?auto_354718 ) ( ON ?auto_354719 ?auto_354720 ) ( CLEAR ?auto_354719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_354718 ?auto_354719 )
      ( MAKE-12PILE ?auto_354718 ?auto_354719 ?auto_354720 ?auto_354721 ?auto_354722 ?auto_354723 ?auto_354724 ?auto_354725 ?auto_354726 ?auto_354727 ?auto_354728 ?auto_354729 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_354768 - BLOCK
      ?auto_354769 - BLOCK
      ?auto_354770 - BLOCK
      ?auto_354771 - BLOCK
      ?auto_354772 - BLOCK
      ?auto_354773 - BLOCK
      ?auto_354774 - BLOCK
      ?auto_354775 - BLOCK
      ?auto_354776 - BLOCK
      ?auto_354777 - BLOCK
      ?auto_354778 - BLOCK
      ?auto_354779 - BLOCK
    )
    :vars
    (
      ?auto_354780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354779 ?auto_354780 ) ( not ( = ?auto_354768 ?auto_354769 ) ) ( not ( = ?auto_354768 ?auto_354770 ) ) ( not ( = ?auto_354768 ?auto_354771 ) ) ( not ( = ?auto_354768 ?auto_354772 ) ) ( not ( = ?auto_354768 ?auto_354773 ) ) ( not ( = ?auto_354768 ?auto_354774 ) ) ( not ( = ?auto_354768 ?auto_354775 ) ) ( not ( = ?auto_354768 ?auto_354776 ) ) ( not ( = ?auto_354768 ?auto_354777 ) ) ( not ( = ?auto_354768 ?auto_354778 ) ) ( not ( = ?auto_354768 ?auto_354779 ) ) ( not ( = ?auto_354768 ?auto_354780 ) ) ( not ( = ?auto_354769 ?auto_354770 ) ) ( not ( = ?auto_354769 ?auto_354771 ) ) ( not ( = ?auto_354769 ?auto_354772 ) ) ( not ( = ?auto_354769 ?auto_354773 ) ) ( not ( = ?auto_354769 ?auto_354774 ) ) ( not ( = ?auto_354769 ?auto_354775 ) ) ( not ( = ?auto_354769 ?auto_354776 ) ) ( not ( = ?auto_354769 ?auto_354777 ) ) ( not ( = ?auto_354769 ?auto_354778 ) ) ( not ( = ?auto_354769 ?auto_354779 ) ) ( not ( = ?auto_354769 ?auto_354780 ) ) ( not ( = ?auto_354770 ?auto_354771 ) ) ( not ( = ?auto_354770 ?auto_354772 ) ) ( not ( = ?auto_354770 ?auto_354773 ) ) ( not ( = ?auto_354770 ?auto_354774 ) ) ( not ( = ?auto_354770 ?auto_354775 ) ) ( not ( = ?auto_354770 ?auto_354776 ) ) ( not ( = ?auto_354770 ?auto_354777 ) ) ( not ( = ?auto_354770 ?auto_354778 ) ) ( not ( = ?auto_354770 ?auto_354779 ) ) ( not ( = ?auto_354770 ?auto_354780 ) ) ( not ( = ?auto_354771 ?auto_354772 ) ) ( not ( = ?auto_354771 ?auto_354773 ) ) ( not ( = ?auto_354771 ?auto_354774 ) ) ( not ( = ?auto_354771 ?auto_354775 ) ) ( not ( = ?auto_354771 ?auto_354776 ) ) ( not ( = ?auto_354771 ?auto_354777 ) ) ( not ( = ?auto_354771 ?auto_354778 ) ) ( not ( = ?auto_354771 ?auto_354779 ) ) ( not ( = ?auto_354771 ?auto_354780 ) ) ( not ( = ?auto_354772 ?auto_354773 ) ) ( not ( = ?auto_354772 ?auto_354774 ) ) ( not ( = ?auto_354772 ?auto_354775 ) ) ( not ( = ?auto_354772 ?auto_354776 ) ) ( not ( = ?auto_354772 ?auto_354777 ) ) ( not ( = ?auto_354772 ?auto_354778 ) ) ( not ( = ?auto_354772 ?auto_354779 ) ) ( not ( = ?auto_354772 ?auto_354780 ) ) ( not ( = ?auto_354773 ?auto_354774 ) ) ( not ( = ?auto_354773 ?auto_354775 ) ) ( not ( = ?auto_354773 ?auto_354776 ) ) ( not ( = ?auto_354773 ?auto_354777 ) ) ( not ( = ?auto_354773 ?auto_354778 ) ) ( not ( = ?auto_354773 ?auto_354779 ) ) ( not ( = ?auto_354773 ?auto_354780 ) ) ( not ( = ?auto_354774 ?auto_354775 ) ) ( not ( = ?auto_354774 ?auto_354776 ) ) ( not ( = ?auto_354774 ?auto_354777 ) ) ( not ( = ?auto_354774 ?auto_354778 ) ) ( not ( = ?auto_354774 ?auto_354779 ) ) ( not ( = ?auto_354774 ?auto_354780 ) ) ( not ( = ?auto_354775 ?auto_354776 ) ) ( not ( = ?auto_354775 ?auto_354777 ) ) ( not ( = ?auto_354775 ?auto_354778 ) ) ( not ( = ?auto_354775 ?auto_354779 ) ) ( not ( = ?auto_354775 ?auto_354780 ) ) ( not ( = ?auto_354776 ?auto_354777 ) ) ( not ( = ?auto_354776 ?auto_354778 ) ) ( not ( = ?auto_354776 ?auto_354779 ) ) ( not ( = ?auto_354776 ?auto_354780 ) ) ( not ( = ?auto_354777 ?auto_354778 ) ) ( not ( = ?auto_354777 ?auto_354779 ) ) ( not ( = ?auto_354777 ?auto_354780 ) ) ( not ( = ?auto_354778 ?auto_354779 ) ) ( not ( = ?auto_354778 ?auto_354780 ) ) ( not ( = ?auto_354779 ?auto_354780 ) ) ( ON ?auto_354778 ?auto_354779 ) ( ON ?auto_354777 ?auto_354778 ) ( ON ?auto_354776 ?auto_354777 ) ( ON ?auto_354775 ?auto_354776 ) ( ON ?auto_354774 ?auto_354775 ) ( ON ?auto_354773 ?auto_354774 ) ( ON ?auto_354772 ?auto_354773 ) ( ON ?auto_354771 ?auto_354772 ) ( ON ?auto_354770 ?auto_354771 ) ( ON ?auto_354769 ?auto_354770 ) ( ON ?auto_354768 ?auto_354769 ) ( CLEAR ?auto_354768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_354768 )
      ( MAKE-12PILE ?auto_354768 ?auto_354769 ?auto_354770 ?auto_354771 ?auto_354772 ?auto_354773 ?auto_354774 ?auto_354775 ?auto_354776 ?auto_354777 ?auto_354778 ?auto_354779 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_354819 - BLOCK
      ?auto_354820 - BLOCK
      ?auto_354821 - BLOCK
      ?auto_354822 - BLOCK
      ?auto_354823 - BLOCK
      ?auto_354824 - BLOCK
      ?auto_354825 - BLOCK
      ?auto_354826 - BLOCK
      ?auto_354827 - BLOCK
      ?auto_354828 - BLOCK
      ?auto_354829 - BLOCK
      ?auto_354830 - BLOCK
      ?auto_354831 - BLOCK
    )
    :vars
    (
      ?auto_354832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_354830 ) ( ON ?auto_354831 ?auto_354832 ) ( CLEAR ?auto_354831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_354819 ) ( ON ?auto_354820 ?auto_354819 ) ( ON ?auto_354821 ?auto_354820 ) ( ON ?auto_354822 ?auto_354821 ) ( ON ?auto_354823 ?auto_354822 ) ( ON ?auto_354824 ?auto_354823 ) ( ON ?auto_354825 ?auto_354824 ) ( ON ?auto_354826 ?auto_354825 ) ( ON ?auto_354827 ?auto_354826 ) ( ON ?auto_354828 ?auto_354827 ) ( ON ?auto_354829 ?auto_354828 ) ( ON ?auto_354830 ?auto_354829 ) ( not ( = ?auto_354819 ?auto_354820 ) ) ( not ( = ?auto_354819 ?auto_354821 ) ) ( not ( = ?auto_354819 ?auto_354822 ) ) ( not ( = ?auto_354819 ?auto_354823 ) ) ( not ( = ?auto_354819 ?auto_354824 ) ) ( not ( = ?auto_354819 ?auto_354825 ) ) ( not ( = ?auto_354819 ?auto_354826 ) ) ( not ( = ?auto_354819 ?auto_354827 ) ) ( not ( = ?auto_354819 ?auto_354828 ) ) ( not ( = ?auto_354819 ?auto_354829 ) ) ( not ( = ?auto_354819 ?auto_354830 ) ) ( not ( = ?auto_354819 ?auto_354831 ) ) ( not ( = ?auto_354819 ?auto_354832 ) ) ( not ( = ?auto_354820 ?auto_354821 ) ) ( not ( = ?auto_354820 ?auto_354822 ) ) ( not ( = ?auto_354820 ?auto_354823 ) ) ( not ( = ?auto_354820 ?auto_354824 ) ) ( not ( = ?auto_354820 ?auto_354825 ) ) ( not ( = ?auto_354820 ?auto_354826 ) ) ( not ( = ?auto_354820 ?auto_354827 ) ) ( not ( = ?auto_354820 ?auto_354828 ) ) ( not ( = ?auto_354820 ?auto_354829 ) ) ( not ( = ?auto_354820 ?auto_354830 ) ) ( not ( = ?auto_354820 ?auto_354831 ) ) ( not ( = ?auto_354820 ?auto_354832 ) ) ( not ( = ?auto_354821 ?auto_354822 ) ) ( not ( = ?auto_354821 ?auto_354823 ) ) ( not ( = ?auto_354821 ?auto_354824 ) ) ( not ( = ?auto_354821 ?auto_354825 ) ) ( not ( = ?auto_354821 ?auto_354826 ) ) ( not ( = ?auto_354821 ?auto_354827 ) ) ( not ( = ?auto_354821 ?auto_354828 ) ) ( not ( = ?auto_354821 ?auto_354829 ) ) ( not ( = ?auto_354821 ?auto_354830 ) ) ( not ( = ?auto_354821 ?auto_354831 ) ) ( not ( = ?auto_354821 ?auto_354832 ) ) ( not ( = ?auto_354822 ?auto_354823 ) ) ( not ( = ?auto_354822 ?auto_354824 ) ) ( not ( = ?auto_354822 ?auto_354825 ) ) ( not ( = ?auto_354822 ?auto_354826 ) ) ( not ( = ?auto_354822 ?auto_354827 ) ) ( not ( = ?auto_354822 ?auto_354828 ) ) ( not ( = ?auto_354822 ?auto_354829 ) ) ( not ( = ?auto_354822 ?auto_354830 ) ) ( not ( = ?auto_354822 ?auto_354831 ) ) ( not ( = ?auto_354822 ?auto_354832 ) ) ( not ( = ?auto_354823 ?auto_354824 ) ) ( not ( = ?auto_354823 ?auto_354825 ) ) ( not ( = ?auto_354823 ?auto_354826 ) ) ( not ( = ?auto_354823 ?auto_354827 ) ) ( not ( = ?auto_354823 ?auto_354828 ) ) ( not ( = ?auto_354823 ?auto_354829 ) ) ( not ( = ?auto_354823 ?auto_354830 ) ) ( not ( = ?auto_354823 ?auto_354831 ) ) ( not ( = ?auto_354823 ?auto_354832 ) ) ( not ( = ?auto_354824 ?auto_354825 ) ) ( not ( = ?auto_354824 ?auto_354826 ) ) ( not ( = ?auto_354824 ?auto_354827 ) ) ( not ( = ?auto_354824 ?auto_354828 ) ) ( not ( = ?auto_354824 ?auto_354829 ) ) ( not ( = ?auto_354824 ?auto_354830 ) ) ( not ( = ?auto_354824 ?auto_354831 ) ) ( not ( = ?auto_354824 ?auto_354832 ) ) ( not ( = ?auto_354825 ?auto_354826 ) ) ( not ( = ?auto_354825 ?auto_354827 ) ) ( not ( = ?auto_354825 ?auto_354828 ) ) ( not ( = ?auto_354825 ?auto_354829 ) ) ( not ( = ?auto_354825 ?auto_354830 ) ) ( not ( = ?auto_354825 ?auto_354831 ) ) ( not ( = ?auto_354825 ?auto_354832 ) ) ( not ( = ?auto_354826 ?auto_354827 ) ) ( not ( = ?auto_354826 ?auto_354828 ) ) ( not ( = ?auto_354826 ?auto_354829 ) ) ( not ( = ?auto_354826 ?auto_354830 ) ) ( not ( = ?auto_354826 ?auto_354831 ) ) ( not ( = ?auto_354826 ?auto_354832 ) ) ( not ( = ?auto_354827 ?auto_354828 ) ) ( not ( = ?auto_354827 ?auto_354829 ) ) ( not ( = ?auto_354827 ?auto_354830 ) ) ( not ( = ?auto_354827 ?auto_354831 ) ) ( not ( = ?auto_354827 ?auto_354832 ) ) ( not ( = ?auto_354828 ?auto_354829 ) ) ( not ( = ?auto_354828 ?auto_354830 ) ) ( not ( = ?auto_354828 ?auto_354831 ) ) ( not ( = ?auto_354828 ?auto_354832 ) ) ( not ( = ?auto_354829 ?auto_354830 ) ) ( not ( = ?auto_354829 ?auto_354831 ) ) ( not ( = ?auto_354829 ?auto_354832 ) ) ( not ( = ?auto_354830 ?auto_354831 ) ) ( not ( = ?auto_354830 ?auto_354832 ) ) ( not ( = ?auto_354831 ?auto_354832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_354831 ?auto_354832 )
      ( !STACK ?auto_354831 ?auto_354830 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_354873 - BLOCK
      ?auto_354874 - BLOCK
      ?auto_354875 - BLOCK
      ?auto_354876 - BLOCK
      ?auto_354877 - BLOCK
      ?auto_354878 - BLOCK
      ?auto_354879 - BLOCK
      ?auto_354880 - BLOCK
      ?auto_354881 - BLOCK
      ?auto_354882 - BLOCK
      ?auto_354883 - BLOCK
      ?auto_354884 - BLOCK
      ?auto_354885 - BLOCK
    )
    :vars
    (
      ?auto_354886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354885 ?auto_354886 ) ( ON-TABLE ?auto_354873 ) ( ON ?auto_354874 ?auto_354873 ) ( ON ?auto_354875 ?auto_354874 ) ( ON ?auto_354876 ?auto_354875 ) ( ON ?auto_354877 ?auto_354876 ) ( ON ?auto_354878 ?auto_354877 ) ( ON ?auto_354879 ?auto_354878 ) ( ON ?auto_354880 ?auto_354879 ) ( ON ?auto_354881 ?auto_354880 ) ( ON ?auto_354882 ?auto_354881 ) ( ON ?auto_354883 ?auto_354882 ) ( not ( = ?auto_354873 ?auto_354874 ) ) ( not ( = ?auto_354873 ?auto_354875 ) ) ( not ( = ?auto_354873 ?auto_354876 ) ) ( not ( = ?auto_354873 ?auto_354877 ) ) ( not ( = ?auto_354873 ?auto_354878 ) ) ( not ( = ?auto_354873 ?auto_354879 ) ) ( not ( = ?auto_354873 ?auto_354880 ) ) ( not ( = ?auto_354873 ?auto_354881 ) ) ( not ( = ?auto_354873 ?auto_354882 ) ) ( not ( = ?auto_354873 ?auto_354883 ) ) ( not ( = ?auto_354873 ?auto_354884 ) ) ( not ( = ?auto_354873 ?auto_354885 ) ) ( not ( = ?auto_354873 ?auto_354886 ) ) ( not ( = ?auto_354874 ?auto_354875 ) ) ( not ( = ?auto_354874 ?auto_354876 ) ) ( not ( = ?auto_354874 ?auto_354877 ) ) ( not ( = ?auto_354874 ?auto_354878 ) ) ( not ( = ?auto_354874 ?auto_354879 ) ) ( not ( = ?auto_354874 ?auto_354880 ) ) ( not ( = ?auto_354874 ?auto_354881 ) ) ( not ( = ?auto_354874 ?auto_354882 ) ) ( not ( = ?auto_354874 ?auto_354883 ) ) ( not ( = ?auto_354874 ?auto_354884 ) ) ( not ( = ?auto_354874 ?auto_354885 ) ) ( not ( = ?auto_354874 ?auto_354886 ) ) ( not ( = ?auto_354875 ?auto_354876 ) ) ( not ( = ?auto_354875 ?auto_354877 ) ) ( not ( = ?auto_354875 ?auto_354878 ) ) ( not ( = ?auto_354875 ?auto_354879 ) ) ( not ( = ?auto_354875 ?auto_354880 ) ) ( not ( = ?auto_354875 ?auto_354881 ) ) ( not ( = ?auto_354875 ?auto_354882 ) ) ( not ( = ?auto_354875 ?auto_354883 ) ) ( not ( = ?auto_354875 ?auto_354884 ) ) ( not ( = ?auto_354875 ?auto_354885 ) ) ( not ( = ?auto_354875 ?auto_354886 ) ) ( not ( = ?auto_354876 ?auto_354877 ) ) ( not ( = ?auto_354876 ?auto_354878 ) ) ( not ( = ?auto_354876 ?auto_354879 ) ) ( not ( = ?auto_354876 ?auto_354880 ) ) ( not ( = ?auto_354876 ?auto_354881 ) ) ( not ( = ?auto_354876 ?auto_354882 ) ) ( not ( = ?auto_354876 ?auto_354883 ) ) ( not ( = ?auto_354876 ?auto_354884 ) ) ( not ( = ?auto_354876 ?auto_354885 ) ) ( not ( = ?auto_354876 ?auto_354886 ) ) ( not ( = ?auto_354877 ?auto_354878 ) ) ( not ( = ?auto_354877 ?auto_354879 ) ) ( not ( = ?auto_354877 ?auto_354880 ) ) ( not ( = ?auto_354877 ?auto_354881 ) ) ( not ( = ?auto_354877 ?auto_354882 ) ) ( not ( = ?auto_354877 ?auto_354883 ) ) ( not ( = ?auto_354877 ?auto_354884 ) ) ( not ( = ?auto_354877 ?auto_354885 ) ) ( not ( = ?auto_354877 ?auto_354886 ) ) ( not ( = ?auto_354878 ?auto_354879 ) ) ( not ( = ?auto_354878 ?auto_354880 ) ) ( not ( = ?auto_354878 ?auto_354881 ) ) ( not ( = ?auto_354878 ?auto_354882 ) ) ( not ( = ?auto_354878 ?auto_354883 ) ) ( not ( = ?auto_354878 ?auto_354884 ) ) ( not ( = ?auto_354878 ?auto_354885 ) ) ( not ( = ?auto_354878 ?auto_354886 ) ) ( not ( = ?auto_354879 ?auto_354880 ) ) ( not ( = ?auto_354879 ?auto_354881 ) ) ( not ( = ?auto_354879 ?auto_354882 ) ) ( not ( = ?auto_354879 ?auto_354883 ) ) ( not ( = ?auto_354879 ?auto_354884 ) ) ( not ( = ?auto_354879 ?auto_354885 ) ) ( not ( = ?auto_354879 ?auto_354886 ) ) ( not ( = ?auto_354880 ?auto_354881 ) ) ( not ( = ?auto_354880 ?auto_354882 ) ) ( not ( = ?auto_354880 ?auto_354883 ) ) ( not ( = ?auto_354880 ?auto_354884 ) ) ( not ( = ?auto_354880 ?auto_354885 ) ) ( not ( = ?auto_354880 ?auto_354886 ) ) ( not ( = ?auto_354881 ?auto_354882 ) ) ( not ( = ?auto_354881 ?auto_354883 ) ) ( not ( = ?auto_354881 ?auto_354884 ) ) ( not ( = ?auto_354881 ?auto_354885 ) ) ( not ( = ?auto_354881 ?auto_354886 ) ) ( not ( = ?auto_354882 ?auto_354883 ) ) ( not ( = ?auto_354882 ?auto_354884 ) ) ( not ( = ?auto_354882 ?auto_354885 ) ) ( not ( = ?auto_354882 ?auto_354886 ) ) ( not ( = ?auto_354883 ?auto_354884 ) ) ( not ( = ?auto_354883 ?auto_354885 ) ) ( not ( = ?auto_354883 ?auto_354886 ) ) ( not ( = ?auto_354884 ?auto_354885 ) ) ( not ( = ?auto_354884 ?auto_354886 ) ) ( not ( = ?auto_354885 ?auto_354886 ) ) ( CLEAR ?auto_354883 ) ( ON ?auto_354884 ?auto_354885 ) ( CLEAR ?auto_354884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_354873 ?auto_354874 ?auto_354875 ?auto_354876 ?auto_354877 ?auto_354878 ?auto_354879 ?auto_354880 ?auto_354881 ?auto_354882 ?auto_354883 ?auto_354884 )
      ( MAKE-13PILE ?auto_354873 ?auto_354874 ?auto_354875 ?auto_354876 ?auto_354877 ?auto_354878 ?auto_354879 ?auto_354880 ?auto_354881 ?auto_354882 ?auto_354883 ?auto_354884 ?auto_354885 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_354927 - BLOCK
      ?auto_354928 - BLOCK
      ?auto_354929 - BLOCK
      ?auto_354930 - BLOCK
      ?auto_354931 - BLOCK
      ?auto_354932 - BLOCK
      ?auto_354933 - BLOCK
      ?auto_354934 - BLOCK
      ?auto_354935 - BLOCK
      ?auto_354936 - BLOCK
      ?auto_354937 - BLOCK
      ?auto_354938 - BLOCK
      ?auto_354939 - BLOCK
    )
    :vars
    (
      ?auto_354940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354939 ?auto_354940 ) ( ON-TABLE ?auto_354927 ) ( ON ?auto_354928 ?auto_354927 ) ( ON ?auto_354929 ?auto_354928 ) ( ON ?auto_354930 ?auto_354929 ) ( ON ?auto_354931 ?auto_354930 ) ( ON ?auto_354932 ?auto_354931 ) ( ON ?auto_354933 ?auto_354932 ) ( ON ?auto_354934 ?auto_354933 ) ( ON ?auto_354935 ?auto_354934 ) ( ON ?auto_354936 ?auto_354935 ) ( not ( = ?auto_354927 ?auto_354928 ) ) ( not ( = ?auto_354927 ?auto_354929 ) ) ( not ( = ?auto_354927 ?auto_354930 ) ) ( not ( = ?auto_354927 ?auto_354931 ) ) ( not ( = ?auto_354927 ?auto_354932 ) ) ( not ( = ?auto_354927 ?auto_354933 ) ) ( not ( = ?auto_354927 ?auto_354934 ) ) ( not ( = ?auto_354927 ?auto_354935 ) ) ( not ( = ?auto_354927 ?auto_354936 ) ) ( not ( = ?auto_354927 ?auto_354937 ) ) ( not ( = ?auto_354927 ?auto_354938 ) ) ( not ( = ?auto_354927 ?auto_354939 ) ) ( not ( = ?auto_354927 ?auto_354940 ) ) ( not ( = ?auto_354928 ?auto_354929 ) ) ( not ( = ?auto_354928 ?auto_354930 ) ) ( not ( = ?auto_354928 ?auto_354931 ) ) ( not ( = ?auto_354928 ?auto_354932 ) ) ( not ( = ?auto_354928 ?auto_354933 ) ) ( not ( = ?auto_354928 ?auto_354934 ) ) ( not ( = ?auto_354928 ?auto_354935 ) ) ( not ( = ?auto_354928 ?auto_354936 ) ) ( not ( = ?auto_354928 ?auto_354937 ) ) ( not ( = ?auto_354928 ?auto_354938 ) ) ( not ( = ?auto_354928 ?auto_354939 ) ) ( not ( = ?auto_354928 ?auto_354940 ) ) ( not ( = ?auto_354929 ?auto_354930 ) ) ( not ( = ?auto_354929 ?auto_354931 ) ) ( not ( = ?auto_354929 ?auto_354932 ) ) ( not ( = ?auto_354929 ?auto_354933 ) ) ( not ( = ?auto_354929 ?auto_354934 ) ) ( not ( = ?auto_354929 ?auto_354935 ) ) ( not ( = ?auto_354929 ?auto_354936 ) ) ( not ( = ?auto_354929 ?auto_354937 ) ) ( not ( = ?auto_354929 ?auto_354938 ) ) ( not ( = ?auto_354929 ?auto_354939 ) ) ( not ( = ?auto_354929 ?auto_354940 ) ) ( not ( = ?auto_354930 ?auto_354931 ) ) ( not ( = ?auto_354930 ?auto_354932 ) ) ( not ( = ?auto_354930 ?auto_354933 ) ) ( not ( = ?auto_354930 ?auto_354934 ) ) ( not ( = ?auto_354930 ?auto_354935 ) ) ( not ( = ?auto_354930 ?auto_354936 ) ) ( not ( = ?auto_354930 ?auto_354937 ) ) ( not ( = ?auto_354930 ?auto_354938 ) ) ( not ( = ?auto_354930 ?auto_354939 ) ) ( not ( = ?auto_354930 ?auto_354940 ) ) ( not ( = ?auto_354931 ?auto_354932 ) ) ( not ( = ?auto_354931 ?auto_354933 ) ) ( not ( = ?auto_354931 ?auto_354934 ) ) ( not ( = ?auto_354931 ?auto_354935 ) ) ( not ( = ?auto_354931 ?auto_354936 ) ) ( not ( = ?auto_354931 ?auto_354937 ) ) ( not ( = ?auto_354931 ?auto_354938 ) ) ( not ( = ?auto_354931 ?auto_354939 ) ) ( not ( = ?auto_354931 ?auto_354940 ) ) ( not ( = ?auto_354932 ?auto_354933 ) ) ( not ( = ?auto_354932 ?auto_354934 ) ) ( not ( = ?auto_354932 ?auto_354935 ) ) ( not ( = ?auto_354932 ?auto_354936 ) ) ( not ( = ?auto_354932 ?auto_354937 ) ) ( not ( = ?auto_354932 ?auto_354938 ) ) ( not ( = ?auto_354932 ?auto_354939 ) ) ( not ( = ?auto_354932 ?auto_354940 ) ) ( not ( = ?auto_354933 ?auto_354934 ) ) ( not ( = ?auto_354933 ?auto_354935 ) ) ( not ( = ?auto_354933 ?auto_354936 ) ) ( not ( = ?auto_354933 ?auto_354937 ) ) ( not ( = ?auto_354933 ?auto_354938 ) ) ( not ( = ?auto_354933 ?auto_354939 ) ) ( not ( = ?auto_354933 ?auto_354940 ) ) ( not ( = ?auto_354934 ?auto_354935 ) ) ( not ( = ?auto_354934 ?auto_354936 ) ) ( not ( = ?auto_354934 ?auto_354937 ) ) ( not ( = ?auto_354934 ?auto_354938 ) ) ( not ( = ?auto_354934 ?auto_354939 ) ) ( not ( = ?auto_354934 ?auto_354940 ) ) ( not ( = ?auto_354935 ?auto_354936 ) ) ( not ( = ?auto_354935 ?auto_354937 ) ) ( not ( = ?auto_354935 ?auto_354938 ) ) ( not ( = ?auto_354935 ?auto_354939 ) ) ( not ( = ?auto_354935 ?auto_354940 ) ) ( not ( = ?auto_354936 ?auto_354937 ) ) ( not ( = ?auto_354936 ?auto_354938 ) ) ( not ( = ?auto_354936 ?auto_354939 ) ) ( not ( = ?auto_354936 ?auto_354940 ) ) ( not ( = ?auto_354937 ?auto_354938 ) ) ( not ( = ?auto_354937 ?auto_354939 ) ) ( not ( = ?auto_354937 ?auto_354940 ) ) ( not ( = ?auto_354938 ?auto_354939 ) ) ( not ( = ?auto_354938 ?auto_354940 ) ) ( not ( = ?auto_354939 ?auto_354940 ) ) ( ON ?auto_354938 ?auto_354939 ) ( CLEAR ?auto_354936 ) ( ON ?auto_354937 ?auto_354938 ) ( CLEAR ?auto_354937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_354927 ?auto_354928 ?auto_354929 ?auto_354930 ?auto_354931 ?auto_354932 ?auto_354933 ?auto_354934 ?auto_354935 ?auto_354936 ?auto_354937 )
      ( MAKE-13PILE ?auto_354927 ?auto_354928 ?auto_354929 ?auto_354930 ?auto_354931 ?auto_354932 ?auto_354933 ?auto_354934 ?auto_354935 ?auto_354936 ?auto_354937 ?auto_354938 ?auto_354939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_354981 - BLOCK
      ?auto_354982 - BLOCK
      ?auto_354983 - BLOCK
      ?auto_354984 - BLOCK
      ?auto_354985 - BLOCK
      ?auto_354986 - BLOCK
      ?auto_354987 - BLOCK
      ?auto_354988 - BLOCK
      ?auto_354989 - BLOCK
      ?auto_354990 - BLOCK
      ?auto_354991 - BLOCK
      ?auto_354992 - BLOCK
      ?auto_354993 - BLOCK
    )
    :vars
    (
      ?auto_354994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_354993 ?auto_354994 ) ( ON-TABLE ?auto_354981 ) ( ON ?auto_354982 ?auto_354981 ) ( ON ?auto_354983 ?auto_354982 ) ( ON ?auto_354984 ?auto_354983 ) ( ON ?auto_354985 ?auto_354984 ) ( ON ?auto_354986 ?auto_354985 ) ( ON ?auto_354987 ?auto_354986 ) ( ON ?auto_354988 ?auto_354987 ) ( ON ?auto_354989 ?auto_354988 ) ( not ( = ?auto_354981 ?auto_354982 ) ) ( not ( = ?auto_354981 ?auto_354983 ) ) ( not ( = ?auto_354981 ?auto_354984 ) ) ( not ( = ?auto_354981 ?auto_354985 ) ) ( not ( = ?auto_354981 ?auto_354986 ) ) ( not ( = ?auto_354981 ?auto_354987 ) ) ( not ( = ?auto_354981 ?auto_354988 ) ) ( not ( = ?auto_354981 ?auto_354989 ) ) ( not ( = ?auto_354981 ?auto_354990 ) ) ( not ( = ?auto_354981 ?auto_354991 ) ) ( not ( = ?auto_354981 ?auto_354992 ) ) ( not ( = ?auto_354981 ?auto_354993 ) ) ( not ( = ?auto_354981 ?auto_354994 ) ) ( not ( = ?auto_354982 ?auto_354983 ) ) ( not ( = ?auto_354982 ?auto_354984 ) ) ( not ( = ?auto_354982 ?auto_354985 ) ) ( not ( = ?auto_354982 ?auto_354986 ) ) ( not ( = ?auto_354982 ?auto_354987 ) ) ( not ( = ?auto_354982 ?auto_354988 ) ) ( not ( = ?auto_354982 ?auto_354989 ) ) ( not ( = ?auto_354982 ?auto_354990 ) ) ( not ( = ?auto_354982 ?auto_354991 ) ) ( not ( = ?auto_354982 ?auto_354992 ) ) ( not ( = ?auto_354982 ?auto_354993 ) ) ( not ( = ?auto_354982 ?auto_354994 ) ) ( not ( = ?auto_354983 ?auto_354984 ) ) ( not ( = ?auto_354983 ?auto_354985 ) ) ( not ( = ?auto_354983 ?auto_354986 ) ) ( not ( = ?auto_354983 ?auto_354987 ) ) ( not ( = ?auto_354983 ?auto_354988 ) ) ( not ( = ?auto_354983 ?auto_354989 ) ) ( not ( = ?auto_354983 ?auto_354990 ) ) ( not ( = ?auto_354983 ?auto_354991 ) ) ( not ( = ?auto_354983 ?auto_354992 ) ) ( not ( = ?auto_354983 ?auto_354993 ) ) ( not ( = ?auto_354983 ?auto_354994 ) ) ( not ( = ?auto_354984 ?auto_354985 ) ) ( not ( = ?auto_354984 ?auto_354986 ) ) ( not ( = ?auto_354984 ?auto_354987 ) ) ( not ( = ?auto_354984 ?auto_354988 ) ) ( not ( = ?auto_354984 ?auto_354989 ) ) ( not ( = ?auto_354984 ?auto_354990 ) ) ( not ( = ?auto_354984 ?auto_354991 ) ) ( not ( = ?auto_354984 ?auto_354992 ) ) ( not ( = ?auto_354984 ?auto_354993 ) ) ( not ( = ?auto_354984 ?auto_354994 ) ) ( not ( = ?auto_354985 ?auto_354986 ) ) ( not ( = ?auto_354985 ?auto_354987 ) ) ( not ( = ?auto_354985 ?auto_354988 ) ) ( not ( = ?auto_354985 ?auto_354989 ) ) ( not ( = ?auto_354985 ?auto_354990 ) ) ( not ( = ?auto_354985 ?auto_354991 ) ) ( not ( = ?auto_354985 ?auto_354992 ) ) ( not ( = ?auto_354985 ?auto_354993 ) ) ( not ( = ?auto_354985 ?auto_354994 ) ) ( not ( = ?auto_354986 ?auto_354987 ) ) ( not ( = ?auto_354986 ?auto_354988 ) ) ( not ( = ?auto_354986 ?auto_354989 ) ) ( not ( = ?auto_354986 ?auto_354990 ) ) ( not ( = ?auto_354986 ?auto_354991 ) ) ( not ( = ?auto_354986 ?auto_354992 ) ) ( not ( = ?auto_354986 ?auto_354993 ) ) ( not ( = ?auto_354986 ?auto_354994 ) ) ( not ( = ?auto_354987 ?auto_354988 ) ) ( not ( = ?auto_354987 ?auto_354989 ) ) ( not ( = ?auto_354987 ?auto_354990 ) ) ( not ( = ?auto_354987 ?auto_354991 ) ) ( not ( = ?auto_354987 ?auto_354992 ) ) ( not ( = ?auto_354987 ?auto_354993 ) ) ( not ( = ?auto_354987 ?auto_354994 ) ) ( not ( = ?auto_354988 ?auto_354989 ) ) ( not ( = ?auto_354988 ?auto_354990 ) ) ( not ( = ?auto_354988 ?auto_354991 ) ) ( not ( = ?auto_354988 ?auto_354992 ) ) ( not ( = ?auto_354988 ?auto_354993 ) ) ( not ( = ?auto_354988 ?auto_354994 ) ) ( not ( = ?auto_354989 ?auto_354990 ) ) ( not ( = ?auto_354989 ?auto_354991 ) ) ( not ( = ?auto_354989 ?auto_354992 ) ) ( not ( = ?auto_354989 ?auto_354993 ) ) ( not ( = ?auto_354989 ?auto_354994 ) ) ( not ( = ?auto_354990 ?auto_354991 ) ) ( not ( = ?auto_354990 ?auto_354992 ) ) ( not ( = ?auto_354990 ?auto_354993 ) ) ( not ( = ?auto_354990 ?auto_354994 ) ) ( not ( = ?auto_354991 ?auto_354992 ) ) ( not ( = ?auto_354991 ?auto_354993 ) ) ( not ( = ?auto_354991 ?auto_354994 ) ) ( not ( = ?auto_354992 ?auto_354993 ) ) ( not ( = ?auto_354992 ?auto_354994 ) ) ( not ( = ?auto_354993 ?auto_354994 ) ) ( ON ?auto_354992 ?auto_354993 ) ( ON ?auto_354991 ?auto_354992 ) ( CLEAR ?auto_354989 ) ( ON ?auto_354990 ?auto_354991 ) ( CLEAR ?auto_354990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_354981 ?auto_354982 ?auto_354983 ?auto_354984 ?auto_354985 ?auto_354986 ?auto_354987 ?auto_354988 ?auto_354989 ?auto_354990 )
      ( MAKE-13PILE ?auto_354981 ?auto_354982 ?auto_354983 ?auto_354984 ?auto_354985 ?auto_354986 ?auto_354987 ?auto_354988 ?auto_354989 ?auto_354990 ?auto_354991 ?auto_354992 ?auto_354993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355035 - BLOCK
      ?auto_355036 - BLOCK
      ?auto_355037 - BLOCK
      ?auto_355038 - BLOCK
      ?auto_355039 - BLOCK
      ?auto_355040 - BLOCK
      ?auto_355041 - BLOCK
      ?auto_355042 - BLOCK
      ?auto_355043 - BLOCK
      ?auto_355044 - BLOCK
      ?auto_355045 - BLOCK
      ?auto_355046 - BLOCK
      ?auto_355047 - BLOCK
    )
    :vars
    (
      ?auto_355048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355047 ?auto_355048 ) ( ON-TABLE ?auto_355035 ) ( ON ?auto_355036 ?auto_355035 ) ( ON ?auto_355037 ?auto_355036 ) ( ON ?auto_355038 ?auto_355037 ) ( ON ?auto_355039 ?auto_355038 ) ( ON ?auto_355040 ?auto_355039 ) ( ON ?auto_355041 ?auto_355040 ) ( ON ?auto_355042 ?auto_355041 ) ( not ( = ?auto_355035 ?auto_355036 ) ) ( not ( = ?auto_355035 ?auto_355037 ) ) ( not ( = ?auto_355035 ?auto_355038 ) ) ( not ( = ?auto_355035 ?auto_355039 ) ) ( not ( = ?auto_355035 ?auto_355040 ) ) ( not ( = ?auto_355035 ?auto_355041 ) ) ( not ( = ?auto_355035 ?auto_355042 ) ) ( not ( = ?auto_355035 ?auto_355043 ) ) ( not ( = ?auto_355035 ?auto_355044 ) ) ( not ( = ?auto_355035 ?auto_355045 ) ) ( not ( = ?auto_355035 ?auto_355046 ) ) ( not ( = ?auto_355035 ?auto_355047 ) ) ( not ( = ?auto_355035 ?auto_355048 ) ) ( not ( = ?auto_355036 ?auto_355037 ) ) ( not ( = ?auto_355036 ?auto_355038 ) ) ( not ( = ?auto_355036 ?auto_355039 ) ) ( not ( = ?auto_355036 ?auto_355040 ) ) ( not ( = ?auto_355036 ?auto_355041 ) ) ( not ( = ?auto_355036 ?auto_355042 ) ) ( not ( = ?auto_355036 ?auto_355043 ) ) ( not ( = ?auto_355036 ?auto_355044 ) ) ( not ( = ?auto_355036 ?auto_355045 ) ) ( not ( = ?auto_355036 ?auto_355046 ) ) ( not ( = ?auto_355036 ?auto_355047 ) ) ( not ( = ?auto_355036 ?auto_355048 ) ) ( not ( = ?auto_355037 ?auto_355038 ) ) ( not ( = ?auto_355037 ?auto_355039 ) ) ( not ( = ?auto_355037 ?auto_355040 ) ) ( not ( = ?auto_355037 ?auto_355041 ) ) ( not ( = ?auto_355037 ?auto_355042 ) ) ( not ( = ?auto_355037 ?auto_355043 ) ) ( not ( = ?auto_355037 ?auto_355044 ) ) ( not ( = ?auto_355037 ?auto_355045 ) ) ( not ( = ?auto_355037 ?auto_355046 ) ) ( not ( = ?auto_355037 ?auto_355047 ) ) ( not ( = ?auto_355037 ?auto_355048 ) ) ( not ( = ?auto_355038 ?auto_355039 ) ) ( not ( = ?auto_355038 ?auto_355040 ) ) ( not ( = ?auto_355038 ?auto_355041 ) ) ( not ( = ?auto_355038 ?auto_355042 ) ) ( not ( = ?auto_355038 ?auto_355043 ) ) ( not ( = ?auto_355038 ?auto_355044 ) ) ( not ( = ?auto_355038 ?auto_355045 ) ) ( not ( = ?auto_355038 ?auto_355046 ) ) ( not ( = ?auto_355038 ?auto_355047 ) ) ( not ( = ?auto_355038 ?auto_355048 ) ) ( not ( = ?auto_355039 ?auto_355040 ) ) ( not ( = ?auto_355039 ?auto_355041 ) ) ( not ( = ?auto_355039 ?auto_355042 ) ) ( not ( = ?auto_355039 ?auto_355043 ) ) ( not ( = ?auto_355039 ?auto_355044 ) ) ( not ( = ?auto_355039 ?auto_355045 ) ) ( not ( = ?auto_355039 ?auto_355046 ) ) ( not ( = ?auto_355039 ?auto_355047 ) ) ( not ( = ?auto_355039 ?auto_355048 ) ) ( not ( = ?auto_355040 ?auto_355041 ) ) ( not ( = ?auto_355040 ?auto_355042 ) ) ( not ( = ?auto_355040 ?auto_355043 ) ) ( not ( = ?auto_355040 ?auto_355044 ) ) ( not ( = ?auto_355040 ?auto_355045 ) ) ( not ( = ?auto_355040 ?auto_355046 ) ) ( not ( = ?auto_355040 ?auto_355047 ) ) ( not ( = ?auto_355040 ?auto_355048 ) ) ( not ( = ?auto_355041 ?auto_355042 ) ) ( not ( = ?auto_355041 ?auto_355043 ) ) ( not ( = ?auto_355041 ?auto_355044 ) ) ( not ( = ?auto_355041 ?auto_355045 ) ) ( not ( = ?auto_355041 ?auto_355046 ) ) ( not ( = ?auto_355041 ?auto_355047 ) ) ( not ( = ?auto_355041 ?auto_355048 ) ) ( not ( = ?auto_355042 ?auto_355043 ) ) ( not ( = ?auto_355042 ?auto_355044 ) ) ( not ( = ?auto_355042 ?auto_355045 ) ) ( not ( = ?auto_355042 ?auto_355046 ) ) ( not ( = ?auto_355042 ?auto_355047 ) ) ( not ( = ?auto_355042 ?auto_355048 ) ) ( not ( = ?auto_355043 ?auto_355044 ) ) ( not ( = ?auto_355043 ?auto_355045 ) ) ( not ( = ?auto_355043 ?auto_355046 ) ) ( not ( = ?auto_355043 ?auto_355047 ) ) ( not ( = ?auto_355043 ?auto_355048 ) ) ( not ( = ?auto_355044 ?auto_355045 ) ) ( not ( = ?auto_355044 ?auto_355046 ) ) ( not ( = ?auto_355044 ?auto_355047 ) ) ( not ( = ?auto_355044 ?auto_355048 ) ) ( not ( = ?auto_355045 ?auto_355046 ) ) ( not ( = ?auto_355045 ?auto_355047 ) ) ( not ( = ?auto_355045 ?auto_355048 ) ) ( not ( = ?auto_355046 ?auto_355047 ) ) ( not ( = ?auto_355046 ?auto_355048 ) ) ( not ( = ?auto_355047 ?auto_355048 ) ) ( ON ?auto_355046 ?auto_355047 ) ( ON ?auto_355045 ?auto_355046 ) ( ON ?auto_355044 ?auto_355045 ) ( CLEAR ?auto_355042 ) ( ON ?auto_355043 ?auto_355044 ) ( CLEAR ?auto_355043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_355035 ?auto_355036 ?auto_355037 ?auto_355038 ?auto_355039 ?auto_355040 ?auto_355041 ?auto_355042 ?auto_355043 )
      ( MAKE-13PILE ?auto_355035 ?auto_355036 ?auto_355037 ?auto_355038 ?auto_355039 ?auto_355040 ?auto_355041 ?auto_355042 ?auto_355043 ?auto_355044 ?auto_355045 ?auto_355046 ?auto_355047 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355089 - BLOCK
      ?auto_355090 - BLOCK
      ?auto_355091 - BLOCK
      ?auto_355092 - BLOCK
      ?auto_355093 - BLOCK
      ?auto_355094 - BLOCK
      ?auto_355095 - BLOCK
      ?auto_355096 - BLOCK
      ?auto_355097 - BLOCK
      ?auto_355098 - BLOCK
      ?auto_355099 - BLOCK
      ?auto_355100 - BLOCK
      ?auto_355101 - BLOCK
    )
    :vars
    (
      ?auto_355102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355101 ?auto_355102 ) ( ON-TABLE ?auto_355089 ) ( ON ?auto_355090 ?auto_355089 ) ( ON ?auto_355091 ?auto_355090 ) ( ON ?auto_355092 ?auto_355091 ) ( ON ?auto_355093 ?auto_355092 ) ( ON ?auto_355094 ?auto_355093 ) ( ON ?auto_355095 ?auto_355094 ) ( not ( = ?auto_355089 ?auto_355090 ) ) ( not ( = ?auto_355089 ?auto_355091 ) ) ( not ( = ?auto_355089 ?auto_355092 ) ) ( not ( = ?auto_355089 ?auto_355093 ) ) ( not ( = ?auto_355089 ?auto_355094 ) ) ( not ( = ?auto_355089 ?auto_355095 ) ) ( not ( = ?auto_355089 ?auto_355096 ) ) ( not ( = ?auto_355089 ?auto_355097 ) ) ( not ( = ?auto_355089 ?auto_355098 ) ) ( not ( = ?auto_355089 ?auto_355099 ) ) ( not ( = ?auto_355089 ?auto_355100 ) ) ( not ( = ?auto_355089 ?auto_355101 ) ) ( not ( = ?auto_355089 ?auto_355102 ) ) ( not ( = ?auto_355090 ?auto_355091 ) ) ( not ( = ?auto_355090 ?auto_355092 ) ) ( not ( = ?auto_355090 ?auto_355093 ) ) ( not ( = ?auto_355090 ?auto_355094 ) ) ( not ( = ?auto_355090 ?auto_355095 ) ) ( not ( = ?auto_355090 ?auto_355096 ) ) ( not ( = ?auto_355090 ?auto_355097 ) ) ( not ( = ?auto_355090 ?auto_355098 ) ) ( not ( = ?auto_355090 ?auto_355099 ) ) ( not ( = ?auto_355090 ?auto_355100 ) ) ( not ( = ?auto_355090 ?auto_355101 ) ) ( not ( = ?auto_355090 ?auto_355102 ) ) ( not ( = ?auto_355091 ?auto_355092 ) ) ( not ( = ?auto_355091 ?auto_355093 ) ) ( not ( = ?auto_355091 ?auto_355094 ) ) ( not ( = ?auto_355091 ?auto_355095 ) ) ( not ( = ?auto_355091 ?auto_355096 ) ) ( not ( = ?auto_355091 ?auto_355097 ) ) ( not ( = ?auto_355091 ?auto_355098 ) ) ( not ( = ?auto_355091 ?auto_355099 ) ) ( not ( = ?auto_355091 ?auto_355100 ) ) ( not ( = ?auto_355091 ?auto_355101 ) ) ( not ( = ?auto_355091 ?auto_355102 ) ) ( not ( = ?auto_355092 ?auto_355093 ) ) ( not ( = ?auto_355092 ?auto_355094 ) ) ( not ( = ?auto_355092 ?auto_355095 ) ) ( not ( = ?auto_355092 ?auto_355096 ) ) ( not ( = ?auto_355092 ?auto_355097 ) ) ( not ( = ?auto_355092 ?auto_355098 ) ) ( not ( = ?auto_355092 ?auto_355099 ) ) ( not ( = ?auto_355092 ?auto_355100 ) ) ( not ( = ?auto_355092 ?auto_355101 ) ) ( not ( = ?auto_355092 ?auto_355102 ) ) ( not ( = ?auto_355093 ?auto_355094 ) ) ( not ( = ?auto_355093 ?auto_355095 ) ) ( not ( = ?auto_355093 ?auto_355096 ) ) ( not ( = ?auto_355093 ?auto_355097 ) ) ( not ( = ?auto_355093 ?auto_355098 ) ) ( not ( = ?auto_355093 ?auto_355099 ) ) ( not ( = ?auto_355093 ?auto_355100 ) ) ( not ( = ?auto_355093 ?auto_355101 ) ) ( not ( = ?auto_355093 ?auto_355102 ) ) ( not ( = ?auto_355094 ?auto_355095 ) ) ( not ( = ?auto_355094 ?auto_355096 ) ) ( not ( = ?auto_355094 ?auto_355097 ) ) ( not ( = ?auto_355094 ?auto_355098 ) ) ( not ( = ?auto_355094 ?auto_355099 ) ) ( not ( = ?auto_355094 ?auto_355100 ) ) ( not ( = ?auto_355094 ?auto_355101 ) ) ( not ( = ?auto_355094 ?auto_355102 ) ) ( not ( = ?auto_355095 ?auto_355096 ) ) ( not ( = ?auto_355095 ?auto_355097 ) ) ( not ( = ?auto_355095 ?auto_355098 ) ) ( not ( = ?auto_355095 ?auto_355099 ) ) ( not ( = ?auto_355095 ?auto_355100 ) ) ( not ( = ?auto_355095 ?auto_355101 ) ) ( not ( = ?auto_355095 ?auto_355102 ) ) ( not ( = ?auto_355096 ?auto_355097 ) ) ( not ( = ?auto_355096 ?auto_355098 ) ) ( not ( = ?auto_355096 ?auto_355099 ) ) ( not ( = ?auto_355096 ?auto_355100 ) ) ( not ( = ?auto_355096 ?auto_355101 ) ) ( not ( = ?auto_355096 ?auto_355102 ) ) ( not ( = ?auto_355097 ?auto_355098 ) ) ( not ( = ?auto_355097 ?auto_355099 ) ) ( not ( = ?auto_355097 ?auto_355100 ) ) ( not ( = ?auto_355097 ?auto_355101 ) ) ( not ( = ?auto_355097 ?auto_355102 ) ) ( not ( = ?auto_355098 ?auto_355099 ) ) ( not ( = ?auto_355098 ?auto_355100 ) ) ( not ( = ?auto_355098 ?auto_355101 ) ) ( not ( = ?auto_355098 ?auto_355102 ) ) ( not ( = ?auto_355099 ?auto_355100 ) ) ( not ( = ?auto_355099 ?auto_355101 ) ) ( not ( = ?auto_355099 ?auto_355102 ) ) ( not ( = ?auto_355100 ?auto_355101 ) ) ( not ( = ?auto_355100 ?auto_355102 ) ) ( not ( = ?auto_355101 ?auto_355102 ) ) ( ON ?auto_355100 ?auto_355101 ) ( ON ?auto_355099 ?auto_355100 ) ( ON ?auto_355098 ?auto_355099 ) ( ON ?auto_355097 ?auto_355098 ) ( CLEAR ?auto_355095 ) ( ON ?auto_355096 ?auto_355097 ) ( CLEAR ?auto_355096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_355089 ?auto_355090 ?auto_355091 ?auto_355092 ?auto_355093 ?auto_355094 ?auto_355095 ?auto_355096 )
      ( MAKE-13PILE ?auto_355089 ?auto_355090 ?auto_355091 ?auto_355092 ?auto_355093 ?auto_355094 ?auto_355095 ?auto_355096 ?auto_355097 ?auto_355098 ?auto_355099 ?auto_355100 ?auto_355101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355143 - BLOCK
      ?auto_355144 - BLOCK
      ?auto_355145 - BLOCK
      ?auto_355146 - BLOCK
      ?auto_355147 - BLOCK
      ?auto_355148 - BLOCK
      ?auto_355149 - BLOCK
      ?auto_355150 - BLOCK
      ?auto_355151 - BLOCK
      ?auto_355152 - BLOCK
      ?auto_355153 - BLOCK
      ?auto_355154 - BLOCK
      ?auto_355155 - BLOCK
    )
    :vars
    (
      ?auto_355156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355155 ?auto_355156 ) ( ON-TABLE ?auto_355143 ) ( ON ?auto_355144 ?auto_355143 ) ( ON ?auto_355145 ?auto_355144 ) ( ON ?auto_355146 ?auto_355145 ) ( ON ?auto_355147 ?auto_355146 ) ( ON ?auto_355148 ?auto_355147 ) ( not ( = ?auto_355143 ?auto_355144 ) ) ( not ( = ?auto_355143 ?auto_355145 ) ) ( not ( = ?auto_355143 ?auto_355146 ) ) ( not ( = ?auto_355143 ?auto_355147 ) ) ( not ( = ?auto_355143 ?auto_355148 ) ) ( not ( = ?auto_355143 ?auto_355149 ) ) ( not ( = ?auto_355143 ?auto_355150 ) ) ( not ( = ?auto_355143 ?auto_355151 ) ) ( not ( = ?auto_355143 ?auto_355152 ) ) ( not ( = ?auto_355143 ?auto_355153 ) ) ( not ( = ?auto_355143 ?auto_355154 ) ) ( not ( = ?auto_355143 ?auto_355155 ) ) ( not ( = ?auto_355143 ?auto_355156 ) ) ( not ( = ?auto_355144 ?auto_355145 ) ) ( not ( = ?auto_355144 ?auto_355146 ) ) ( not ( = ?auto_355144 ?auto_355147 ) ) ( not ( = ?auto_355144 ?auto_355148 ) ) ( not ( = ?auto_355144 ?auto_355149 ) ) ( not ( = ?auto_355144 ?auto_355150 ) ) ( not ( = ?auto_355144 ?auto_355151 ) ) ( not ( = ?auto_355144 ?auto_355152 ) ) ( not ( = ?auto_355144 ?auto_355153 ) ) ( not ( = ?auto_355144 ?auto_355154 ) ) ( not ( = ?auto_355144 ?auto_355155 ) ) ( not ( = ?auto_355144 ?auto_355156 ) ) ( not ( = ?auto_355145 ?auto_355146 ) ) ( not ( = ?auto_355145 ?auto_355147 ) ) ( not ( = ?auto_355145 ?auto_355148 ) ) ( not ( = ?auto_355145 ?auto_355149 ) ) ( not ( = ?auto_355145 ?auto_355150 ) ) ( not ( = ?auto_355145 ?auto_355151 ) ) ( not ( = ?auto_355145 ?auto_355152 ) ) ( not ( = ?auto_355145 ?auto_355153 ) ) ( not ( = ?auto_355145 ?auto_355154 ) ) ( not ( = ?auto_355145 ?auto_355155 ) ) ( not ( = ?auto_355145 ?auto_355156 ) ) ( not ( = ?auto_355146 ?auto_355147 ) ) ( not ( = ?auto_355146 ?auto_355148 ) ) ( not ( = ?auto_355146 ?auto_355149 ) ) ( not ( = ?auto_355146 ?auto_355150 ) ) ( not ( = ?auto_355146 ?auto_355151 ) ) ( not ( = ?auto_355146 ?auto_355152 ) ) ( not ( = ?auto_355146 ?auto_355153 ) ) ( not ( = ?auto_355146 ?auto_355154 ) ) ( not ( = ?auto_355146 ?auto_355155 ) ) ( not ( = ?auto_355146 ?auto_355156 ) ) ( not ( = ?auto_355147 ?auto_355148 ) ) ( not ( = ?auto_355147 ?auto_355149 ) ) ( not ( = ?auto_355147 ?auto_355150 ) ) ( not ( = ?auto_355147 ?auto_355151 ) ) ( not ( = ?auto_355147 ?auto_355152 ) ) ( not ( = ?auto_355147 ?auto_355153 ) ) ( not ( = ?auto_355147 ?auto_355154 ) ) ( not ( = ?auto_355147 ?auto_355155 ) ) ( not ( = ?auto_355147 ?auto_355156 ) ) ( not ( = ?auto_355148 ?auto_355149 ) ) ( not ( = ?auto_355148 ?auto_355150 ) ) ( not ( = ?auto_355148 ?auto_355151 ) ) ( not ( = ?auto_355148 ?auto_355152 ) ) ( not ( = ?auto_355148 ?auto_355153 ) ) ( not ( = ?auto_355148 ?auto_355154 ) ) ( not ( = ?auto_355148 ?auto_355155 ) ) ( not ( = ?auto_355148 ?auto_355156 ) ) ( not ( = ?auto_355149 ?auto_355150 ) ) ( not ( = ?auto_355149 ?auto_355151 ) ) ( not ( = ?auto_355149 ?auto_355152 ) ) ( not ( = ?auto_355149 ?auto_355153 ) ) ( not ( = ?auto_355149 ?auto_355154 ) ) ( not ( = ?auto_355149 ?auto_355155 ) ) ( not ( = ?auto_355149 ?auto_355156 ) ) ( not ( = ?auto_355150 ?auto_355151 ) ) ( not ( = ?auto_355150 ?auto_355152 ) ) ( not ( = ?auto_355150 ?auto_355153 ) ) ( not ( = ?auto_355150 ?auto_355154 ) ) ( not ( = ?auto_355150 ?auto_355155 ) ) ( not ( = ?auto_355150 ?auto_355156 ) ) ( not ( = ?auto_355151 ?auto_355152 ) ) ( not ( = ?auto_355151 ?auto_355153 ) ) ( not ( = ?auto_355151 ?auto_355154 ) ) ( not ( = ?auto_355151 ?auto_355155 ) ) ( not ( = ?auto_355151 ?auto_355156 ) ) ( not ( = ?auto_355152 ?auto_355153 ) ) ( not ( = ?auto_355152 ?auto_355154 ) ) ( not ( = ?auto_355152 ?auto_355155 ) ) ( not ( = ?auto_355152 ?auto_355156 ) ) ( not ( = ?auto_355153 ?auto_355154 ) ) ( not ( = ?auto_355153 ?auto_355155 ) ) ( not ( = ?auto_355153 ?auto_355156 ) ) ( not ( = ?auto_355154 ?auto_355155 ) ) ( not ( = ?auto_355154 ?auto_355156 ) ) ( not ( = ?auto_355155 ?auto_355156 ) ) ( ON ?auto_355154 ?auto_355155 ) ( ON ?auto_355153 ?auto_355154 ) ( ON ?auto_355152 ?auto_355153 ) ( ON ?auto_355151 ?auto_355152 ) ( ON ?auto_355150 ?auto_355151 ) ( CLEAR ?auto_355148 ) ( ON ?auto_355149 ?auto_355150 ) ( CLEAR ?auto_355149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_355143 ?auto_355144 ?auto_355145 ?auto_355146 ?auto_355147 ?auto_355148 ?auto_355149 )
      ( MAKE-13PILE ?auto_355143 ?auto_355144 ?auto_355145 ?auto_355146 ?auto_355147 ?auto_355148 ?auto_355149 ?auto_355150 ?auto_355151 ?auto_355152 ?auto_355153 ?auto_355154 ?auto_355155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355197 - BLOCK
      ?auto_355198 - BLOCK
      ?auto_355199 - BLOCK
      ?auto_355200 - BLOCK
      ?auto_355201 - BLOCK
      ?auto_355202 - BLOCK
      ?auto_355203 - BLOCK
      ?auto_355204 - BLOCK
      ?auto_355205 - BLOCK
      ?auto_355206 - BLOCK
      ?auto_355207 - BLOCK
      ?auto_355208 - BLOCK
      ?auto_355209 - BLOCK
    )
    :vars
    (
      ?auto_355210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355209 ?auto_355210 ) ( ON-TABLE ?auto_355197 ) ( ON ?auto_355198 ?auto_355197 ) ( ON ?auto_355199 ?auto_355198 ) ( ON ?auto_355200 ?auto_355199 ) ( ON ?auto_355201 ?auto_355200 ) ( not ( = ?auto_355197 ?auto_355198 ) ) ( not ( = ?auto_355197 ?auto_355199 ) ) ( not ( = ?auto_355197 ?auto_355200 ) ) ( not ( = ?auto_355197 ?auto_355201 ) ) ( not ( = ?auto_355197 ?auto_355202 ) ) ( not ( = ?auto_355197 ?auto_355203 ) ) ( not ( = ?auto_355197 ?auto_355204 ) ) ( not ( = ?auto_355197 ?auto_355205 ) ) ( not ( = ?auto_355197 ?auto_355206 ) ) ( not ( = ?auto_355197 ?auto_355207 ) ) ( not ( = ?auto_355197 ?auto_355208 ) ) ( not ( = ?auto_355197 ?auto_355209 ) ) ( not ( = ?auto_355197 ?auto_355210 ) ) ( not ( = ?auto_355198 ?auto_355199 ) ) ( not ( = ?auto_355198 ?auto_355200 ) ) ( not ( = ?auto_355198 ?auto_355201 ) ) ( not ( = ?auto_355198 ?auto_355202 ) ) ( not ( = ?auto_355198 ?auto_355203 ) ) ( not ( = ?auto_355198 ?auto_355204 ) ) ( not ( = ?auto_355198 ?auto_355205 ) ) ( not ( = ?auto_355198 ?auto_355206 ) ) ( not ( = ?auto_355198 ?auto_355207 ) ) ( not ( = ?auto_355198 ?auto_355208 ) ) ( not ( = ?auto_355198 ?auto_355209 ) ) ( not ( = ?auto_355198 ?auto_355210 ) ) ( not ( = ?auto_355199 ?auto_355200 ) ) ( not ( = ?auto_355199 ?auto_355201 ) ) ( not ( = ?auto_355199 ?auto_355202 ) ) ( not ( = ?auto_355199 ?auto_355203 ) ) ( not ( = ?auto_355199 ?auto_355204 ) ) ( not ( = ?auto_355199 ?auto_355205 ) ) ( not ( = ?auto_355199 ?auto_355206 ) ) ( not ( = ?auto_355199 ?auto_355207 ) ) ( not ( = ?auto_355199 ?auto_355208 ) ) ( not ( = ?auto_355199 ?auto_355209 ) ) ( not ( = ?auto_355199 ?auto_355210 ) ) ( not ( = ?auto_355200 ?auto_355201 ) ) ( not ( = ?auto_355200 ?auto_355202 ) ) ( not ( = ?auto_355200 ?auto_355203 ) ) ( not ( = ?auto_355200 ?auto_355204 ) ) ( not ( = ?auto_355200 ?auto_355205 ) ) ( not ( = ?auto_355200 ?auto_355206 ) ) ( not ( = ?auto_355200 ?auto_355207 ) ) ( not ( = ?auto_355200 ?auto_355208 ) ) ( not ( = ?auto_355200 ?auto_355209 ) ) ( not ( = ?auto_355200 ?auto_355210 ) ) ( not ( = ?auto_355201 ?auto_355202 ) ) ( not ( = ?auto_355201 ?auto_355203 ) ) ( not ( = ?auto_355201 ?auto_355204 ) ) ( not ( = ?auto_355201 ?auto_355205 ) ) ( not ( = ?auto_355201 ?auto_355206 ) ) ( not ( = ?auto_355201 ?auto_355207 ) ) ( not ( = ?auto_355201 ?auto_355208 ) ) ( not ( = ?auto_355201 ?auto_355209 ) ) ( not ( = ?auto_355201 ?auto_355210 ) ) ( not ( = ?auto_355202 ?auto_355203 ) ) ( not ( = ?auto_355202 ?auto_355204 ) ) ( not ( = ?auto_355202 ?auto_355205 ) ) ( not ( = ?auto_355202 ?auto_355206 ) ) ( not ( = ?auto_355202 ?auto_355207 ) ) ( not ( = ?auto_355202 ?auto_355208 ) ) ( not ( = ?auto_355202 ?auto_355209 ) ) ( not ( = ?auto_355202 ?auto_355210 ) ) ( not ( = ?auto_355203 ?auto_355204 ) ) ( not ( = ?auto_355203 ?auto_355205 ) ) ( not ( = ?auto_355203 ?auto_355206 ) ) ( not ( = ?auto_355203 ?auto_355207 ) ) ( not ( = ?auto_355203 ?auto_355208 ) ) ( not ( = ?auto_355203 ?auto_355209 ) ) ( not ( = ?auto_355203 ?auto_355210 ) ) ( not ( = ?auto_355204 ?auto_355205 ) ) ( not ( = ?auto_355204 ?auto_355206 ) ) ( not ( = ?auto_355204 ?auto_355207 ) ) ( not ( = ?auto_355204 ?auto_355208 ) ) ( not ( = ?auto_355204 ?auto_355209 ) ) ( not ( = ?auto_355204 ?auto_355210 ) ) ( not ( = ?auto_355205 ?auto_355206 ) ) ( not ( = ?auto_355205 ?auto_355207 ) ) ( not ( = ?auto_355205 ?auto_355208 ) ) ( not ( = ?auto_355205 ?auto_355209 ) ) ( not ( = ?auto_355205 ?auto_355210 ) ) ( not ( = ?auto_355206 ?auto_355207 ) ) ( not ( = ?auto_355206 ?auto_355208 ) ) ( not ( = ?auto_355206 ?auto_355209 ) ) ( not ( = ?auto_355206 ?auto_355210 ) ) ( not ( = ?auto_355207 ?auto_355208 ) ) ( not ( = ?auto_355207 ?auto_355209 ) ) ( not ( = ?auto_355207 ?auto_355210 ) ) ( not ( = ?auto_355208 ?auto_355209 ) ) ( not ( = ?auto_355208 ?auto_355210 ) ) ( not ( = ?auto_355209 ?auto_355210 ) ) ( ON ?auto_355208 ?auto_355209 ) ( ON ?auto_355207 ?auto_355208 ) ( ON ?auto_355206 ?auto_355207 ) ( ON ?auto_355205 ?auto_355206 ) ( ON ?auto_355204 ?auto_355205 ) ( ON ?auto_355203 ?auto_355204 ) ( CLEAR ?auto_355201 ) ( ON ?auto_355202 ?auto_355203 ) ( CLEAR ?auto_355202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_355197 ?auto_355198 ?auto_355199 ?auto_355200 ?auto_355201 ?auto_355202 )
      ( MAKE-13PILE ?auto_355197 ?auto_355198 ?auto_355199 ?auto_355200 ?auto_355201 ?auto_355202 ?auto_355203 ?auto_355204 ?auto_355205 ?auto_355206 ?auto_355207 ?auto_355208 ?auto_355209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355251 - BLOCK
      ?auto_355252 - BLOCK
      ?auto_355253 - BLOCK
      ?auto_355254 - BLOCK
      ?auto_355255 - BLOCK
      ?auto_355256 - BLOCK
      ?auto_355257 - BLOCK
      ?auto_355258 - BLOCK
      ?auto_355259 - BLOCK
      ?auto_355260 - BLOCK
      ?auto_355261 - BLOCK
      ?auto_355262 - BLOCK
      ?auto_355263 - BLOCK
    )
    :vars
    (
      ?auto_355264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355263 ?auto_355264 ) ( ON-TABLE ?auto_355251 ) ( ON ?auto_355252 ?auto_355251 ) ( ON ?auto_355253 ?auto_355252 ) ( ON ?auto_355254 ?auto_355253 ) ( not ( = ?auto_355251 ?auto_355252 ) ) ( not ( = ?auto_355251 ?auto_355253 ) ) ( not ( = ?auto_355251 ?auto_355254 ) ) ( not ( = ?auto_355251 ?auto_355255 ) ) ( not ( = ?auto_355251 ?auto_355256 ) ) ( not ( = ?auto_355251 ?auto_355257 ) ) ( not ( = ?auto_355251 ?auto_355258 ) ) ( not ( = ?auto_355251 ?auto_355259 ) ) ( not ( = ?auto_355251 ?auto_355260 ) ) ( not ( = ?auto_355251 ?auto_355261 ) ) ( not ( = ?auto_355251 ?auto_355262 ) ) ( not ( = ?auto_355251 ?auto_355263 ) ) ( not ( = ?auto_355251 ?auto_355264 ) ) ( not ( = ?auto_355252 ?auto_355253 ) ) ( not ( = ?auto_355252 ?auto_355254 ) ) ( not ( = ?auto_355252 ?auto_355255 ) ) ( not ( = ?auto_355252 ?auto_355256 ) ) ( not ( = ?auto_355252 ?auto_355257 ) ) ( not ( = ?auto_355252 ?auto_355258 ) ) ( not ( = ?auto_355252 ?auto_355259 ) ) ( not ( = ?auto_355252 ?auto_355260 ) ) ( not ( = ?auto_355252 ?auto_355261 ) ) ( not ( = ?auto_355252 ?auto_355262 ) ) ( not ( = ?auto_355252 ?auto_355263 ) ) ( not ( = ?auto_355252 ?auto_355264 ) ) ( not ( = ?auto_355253 ?auto_355254 ) ) ( not ( = ?auto_355253 ?auto_355255 ) ) ( not ( = ?auto_355253 ?auto_355256 ) ) ( not ( = ?auto_355253 ?auto_355257 ) ) ( not ( = ?auto_355253 ?auto_355258 ) ) ( not ( = ?auto_355253 ?auto_355259 ) ) ( not ( = ?auto_355253 ?auto_355260 ) ) ( not ( = ?auto_355253 ?auto_355261 ) ) ( not ( = ?auto_355253 ?auto_355262 ) ) ( not ( = ?auto_355253 ?auto_355263 ) ) ( not ( = ?auto_355253 ?auto_355264 ) ) ( not ( = ?auto_355254 ?auto_355255 ) ) ( not ( = ?auto_355254 ?auto_355256 ) ) ( not ( = ?auto_355254 ?auto_355257 ) ) ( not ( = ?auto_355254 ?auto_355258 ) ) ( not ( = ?auto_355254 ?auto_355259 ) ) ( not ( = ?auto_355254 ?auto_355260 ) ) ( not ( = ?auto_355254 ?auto_355261 ) ) ( not ( = ?auto_355254 ?auto_355262 ) ) ( not ( = ?auto_355254 ?auto_355263 ) ) ( not ( = ?auto_355254 ?auto_355264 ) ) ( not ( = ?auto_355255 ?auto_355256 ) ) ( not ( = ?auto_355255 ?auto_355257 ) ) ( not ( = ?auto_355255 ?auto_355258 ) ) ( not ( = ?auto_355255 ?auto_355259 ) ) ( not ( = ?auto_355255 ?auto_355260 ) ) ( not ( = ?auto_355255 ?auto_355261 ) ) ( not ( = ?auto_355255 ?auto_355262 ) ) ( not ( = ?auto_355255 ?auto_355263 ) ) ( not ( = ?auto_355255 ?auto_355264 ) ) ( not ( = ?auto_355256 ?auto_355257 ) ) ( not ( = ?auto_355256 ?auto_355258 ) ) ( not ( = ?auto_355256 ?auto_355259 ) ) ( not ( = ?auto_355256 ?auto_355260 ) ) ( not ( = ?auto_355256 ?auto_355261 ) ) ( not ( = ?auto_355256 ?auto_355262 ) ) ( not ( = ?auto_355256 ?auto_355263 ) ) ( not ( = ?auto_355256 ?auto_355264 ) ) ( not ( = ?auto_355257 ?auto_355258 ) ) ( not ( = ?auto_355257 ?auto_355259 ) ) ( not ( = ?auto_355257 ?auto_355260 ) ) ( not ( = ?auto_355257 ?auto_355261 ) ) ( not ( = ?auto_355257 ?auto_355262 ) ) ( not ( = ?auto_355257 ?auto_355263 ) ) ( not ( = ?auto_355257 ?auto_355264 ) ) ( not ( = ?auto_355258 ?auto_355259 ) ) ( not ( = ?auto_355258 ?auto_355260 ) ) ( not ( = ?auto_355258 ?auto_355261 ) ) ( not ( = ?auto_355258 ?auto_355262 ) ) ( not ( = ?auto_355258 ?auto_355263 ) ) ( not ( = ?auto_355258 ?auto_355264 ) ) ( not ( = ?auto_355259 ?auto_355260 ) ) ( not ( = ?auto_355259 ?auto_355261 ) ) ( not ( = ?auto_355259 ?auto_355262 ) ) ( not ( = ?auto_355259 ?auto_355263 ) ) ( not ( = ?auto_355259 ?auto_355264 ) ) ( not ( = ?auto_355260 ?auto_355261 ) ) ( not ( = ?auto_355260 ?auto_355262 ) ) ( not ( = ?auto_355260 ?auto_355263 ) ) ( not ( = ?auto_355260 ?auto_355264 ) ) ( not ( = ?auto_355261 ?auto_355262 ) ) ( not ( = ?auto_355261 ?auto_355263 ) ) ( not ( = ?auto_355261 ?auto_355264 ) ) ( not ( = ?auto_355262 ?auto_355263 ) ) ( not ( = ?auto_355262 ?auto_355264 ) ) ( not ( = ?auto_355263 ?auto_355264 ) ) ( ON ?auto_355262 ?auto_355263 ) ( ON ?auto_355261 ?auto_355262 ) ( ON ?auto_355260 ?auto_355261 ) ( ON ?auto_355259 ?auto_355260 ) ( ON ?auto_355258 ?auto_355259 ) ( ON ?auto_355257 ?auto_355258 ) ( ON ?auto_355256 ?auto_355257 ) ( CLEAR ?auto_355254 ) ( ON ?auto_355255 ?auto_355256 ) ( CLEAR ?auto_355255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_355251 ?auto_355252 ?auto_355253 ?auto_355254 ?auto_355255 )
      ( MAKE-13PILE ?auto_355251 ?auto_355252 ?auto_355253 ?auto_355254 ?auto_355255 ?auto_355256 ?auto_355257 ?auto_355258 ?auto_355259 ?auto_355260 ?auto_355261 ?auto_355262 ?auto_355263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355305 - BLOCK
      ?auto_355306 - BLOCK
      ?auto_355307 - BLOCK
      ?auto_355308 - BLOCK
      ?auto_355309 - BLOCK
      ?auto_355310 - BLOCK
      ?auto_355311 - BLOCK
      ?auto_355312 - BLOCK
      ?auto_355313 - BLOCK
      ?auto_355314 - BLOCK
      ?auto_355315 - BLOCK
      ?auto_355316 - BLOCK
      ?auto_355317 - BLOCK
    )
    :vars
    (
      ?auto_355318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355317 ?auto_355318 ) ( ON-TABLE ?auto_355305 ) ( ON ?auto_355306 ?auto_355305 ) ( ON ?auto_355307 ?auto_355306 ) ( not ( = ?auto_355305 ?auto_355306 ) ) ( not ( = ?auto_355305 ?auto_355307 ) ) ( not ( = ?auto_355305 ?auto_355308 ) ) ( not ( = ?auto_355305 ?auto_355309 ) ) ( not ( = ?auto_355305 ?auto_355310 ) ) ( not ( = ?auto_355305 ?auto_355311 ) ) ( not ( = ?auto_355305 ?auto_355312 ) ) ( not ( = ?auto_355305 ?auto_355313 ) ) ( not ( = ?auto_355305 ?auto_355314 ) ) ( not ( = ?auto_355305 ?auto_355315 ) ) ( not ( = ?auto_355305 ?auto_355316 ) ) ( not ( = ?auto_355305 ?auto_355317 ) ) ( not ( = ?auto_355305 ?auto_355318 ) ) ( not ( = ?auto_355306 ?auto_355307 ) ) ( not ( = ?auto_355306 ?auto_355308 ) ) ( not ( = ?auto_355306 ?auto_355309 ) ) ( not ( = ?auto_355306 ?auto_355310 ) ) ( not ( = ?auto_355306 ?auto_355311 ) ) ( not ( = ?auto_355306 ?auto_355312 ) ) ( not ( = ?auto_355306 ?auto_355313 ) ) ( not ( = ?auto_355306 ?auto_355314 ) ) ( not ( = ?auto_355306 ?auto_355315 ) ) ( not ( = ?auto_355306 ?auto_355316 ) ) ( not ( = ?auto_355306 ?auto_355317 ) ) ( not ( = ?auto_355306 ?auto_355318 ) ) ( not ( = ?auto_355307 ?auto_355308 ) ) ( not ( = ?auto_355307 ?auto_355309 ) ) ( not ( = ?auto_355307 ?auto_355310 ) ) ( not ( = ?auto_355307 ?auto_355311 ) ) ( not ( = ?auto_355307 ?auto_355312 ) ) ( not ( = ?auto_355307 ?auto_355313 ) ) ( not ( = ?auto_355307 ?auto_355314 ) ) ( not ( = ?auto_355307 ?auto_355315 ) ) ( not ( = ?auto_355307 ?auto_355316 ) ) ( not ( = ?auto_355307 ?auto_355317 ) ) ( not ( = ?auto_355307 ?auto_355318 ) ) ( not ( = ?auto_355308 ?auto_355309 ) ) ( not ( = ?auto_355308 ?auto_355310 ) ) ( not ( = ?auto_355308 ?auto_355311 ) ) ( not ( = ?auto_355308 ?auto_355312 ) ) ( not ( = ?auto_355308 ?auto_355313 ) ) ( not ( = ?auto_355308 ?auto_355314 ) ) ( not ( = ?auto_355308 ?auto_355315 ) ) ( not ( = ?auto_355308 ?auto_355316 ) ) ( not ( = ?auto_355308 ?auto_355317 ) ) ( not ( = ?auto_355308 ?auto_355318 ) ) ( not ( = ?auto_355309 ?auto_355310 ) ) ( not ( = ?auto_355309 ?auto_355311 ) ) ( not ( = ?auto_355309 ?auto_355312 ) ) ( not ( = ?auto_355309 ?auto_355313 ) ) ( not ( = ?auto_355309 ?auto_355314 ) ) ( not ( = ?auto_355309 ?auto_355315 ) ) ( not ( = ?auto_355309 ?auto_355316 ) ) ( not ( = ?auto_355309 ?auto_355317 ) ) ( not ( = ?auto_355309 ?auto_355318 ) ) ( not ( = ?auto_355310 ?auto_355311 ) ) ( not ( = ?auto_355310 ?auto_355312 ) ) ( not ( = ?auto_355310 ?auto_355313 ) ) ( not ( = ?auto_355310 ?auto_355314 ) ) ( not ( = ?auto_355310 ?auto_355315 ) ) ( not ( = ?auto_355310 ?auto_355316 ) ) ( not ( = ?auto_355310 ?auto_355317 ) ) ( not ( = ?auto_355310 ?auto_355318 ) ) ( not ( = ?auto_355311 ?auto_355312 ) ) ( not ( = ?auto_355311 ?auto_355313 ) ) ( not ( = ?auto_355311 ?auto_355314 ) ) ( not ( = ?auto_355311 ?auto_355315 ) ) ( not ( = ?auto_355311 ?auto_355316 ) ) ( not ( = ?auto_355311 ?auto_355317 ) ) ( not ( = ?auto_355311 ?auto_355318 ) ) ( not ( = ?auto_355312 ?auto_355313 ) ) ( not ( = ?auto_355312 ?auto_355314 ) ) ( not ( = ?auto_355312 ?auto_355315 ) ) ( not ( = ?auto_355312 ?auto_355316 ) ) ( not ( = ?auto_355312 ?auto_355317 ) ) ( not ( = ?auto_355312 ?auto_355318 ) ) ( not ( = ?auto_355313 ?auto_355314 ) ) ( not ( = ?auto_355313 ?auto_355315 ) ) ( not ( = ?auto_355313 ?auto_355316 ) ) ( not ( = ?auto_355313 ?auto_355317 ) ) ( not ( = ?auto_355313 ?auto_355318 ) ) ( not ( = ?auto_355314 ?auto_355315 ) ) ( not ( = ?auto_355314 ?auto_355316 ) ) ( not ( = ?auto_355314 ?auto_355317 ) ) ( not ( = ?auto_355314 ?auto_355318 ) ) ( not ( = ?auto_355315 ?auto_355316 ) ) ( not ( = ?auto_355315 ?auto_355317 ) ) ( not ( = ?auto_355315 ?auto_355318 ) ) ( not ( = ?auto_355316 ?auto_355317 ) ) ( not ( = ?auto_355316 ?auto_355318 ) ) ( not ( = ?auto_355317 ?auto_355318 ) ) ( ON ?auto_355316 ?auto_355317 ) ( ON ?auto_355315 ?auto_355316 ) ( ON ?auto_355314 ?auto_355315 ) ( ON ?auto_355313 ?auto_355314 ) ( ON ?auto_355312 ?auto_355313 ) ( ON ?auto_355311 ?auto_355312 ) ( ON ?auto_355310 ?auto_355311 ) ( ON ?auto_355309 ?auto_355310 ) ( CLEAR ?auto_355307 ) ( ON ?auto_355308 ?auto_355309 ) ( CLEAR ?auto_355308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_355305 ?auto_355306 ?auto_355307 ?auto_355308 )
      ( MAKE-13PILE ?auto_355305 ?auto_355306 ?auto_355307 ?auto_355308 ?auto_355309 ?auto_355310 ?auto_355311 ?auto_355312 ?auto_355313 ?auto_355314 ?auto_355315 ?auto_355316 ?auto_355317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355359 - BLOCK
      ?auto_355360 - BLOCK
      ?auto_355361 - BLOCK
      ?auto_355362 - BLOCK
      ?auto_355363 - BLOCK
      ?auto_355364 - BLOCK
      ?auto_355365 - BLOCK
      ?auto_355366 - BLOCK
      ?auto_355367 - BLOCK
      ?auto_355368 - BLOCK
      ?auto_355369 - BLOCK
      ?auto_355370 - BLOCK
      ?auto_355371 - BLOCK
    )
    :vars
    (
      ?auto_355372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355371 ?auto_355372 ) ( ON-TABLE ?auto_355359 ) ( ON ?auto_355360 ?auto_355359 ) ( not ( = ?auto_355359 ?auto_355360 ) ) ( not ( = ?auto_355359 ?auto_355361 ) ) ( not ( = ?auto_355359 ?auto_355362 ) ) ( not ( = ?auto_355359 ?auto_355363 ) ) ( not ( = ?auto_355359 ?auto_355364 ) ) ( not ( = ?auto_355359 ?auto_355365 ) ) ( not ( = ?auto_355359 ?auto_355366 ) ) ( not ( = ?auto_355359 ?auto_355367 ) ) ( not ( = ?auto_355359 ?auto_355368 ) ) ( not ( = ?auto_355359 ?auto_355369 ) ) ( not ( = ?auto_355359 ?auto_355370 ) ) ( not ( = ?auto_355359 ?auto_355371 ) ) ( not ( = ?auto_355359 ?auto_355372 ) ) ( not ( = ?auto_355360 ?auto_355361 ) ) ( not ( = ?auto_355360 ?auto_355362 ) ) ( not ( = ?auto_355360 ?auto_355363 ) ) ( not ( = ?auto_355360 ?auto_355364 ) ) ( not ( = ?auto_355360 ?auto_355365 ) ) ( not ( = ?auto_355360 ?auto_355366 ) ) ( not ( = ?auto_355360 ?auto_355367 ) ) ( not ( = ?auto_355360 ?auto_355368 ) ) ( not ( = ?auto_355360 ?auto_355369 ) ) ( not ( = ?auto_355360 ?auto_355370 ) ) ( not ( = ?auto_355360 ?auto_355371 ) ) ( not ( = ?auto_355360 ?auto_355372 ) ) ( not ( = ?auto_355361 ?auto_355362 ) ) ( not ( = ?auto_355361 ?auto_355363 ) ) ( not ( = ?auto_355361 ?auto_355364 ) ) ( not ( = ?auto_355361 ?auto_355365 ) ) ( not ( = ?auto_355361 ?auto_355366 ) ) ( not ( = ?auto_355361 ?auto_355367 ) ) ( not ( = ?auto_355361 ?auto_355368 ) ) ( not ( = ?auto_355361 ?auto_355369 ) ) ( not ( = ?auto_355361 ?auto_355370 ) ) ( not ( = ?auto_355361 ?auto_355371 ) ) ( not ( = ?auto_355361 ?auto_355372 ) ) ( not ( = ?auto_355362 ?auto_355363 ) ) ( not ( = ?auto_355362 ?auto_355364 ) ) ( not ( = ?auto_355362 ?auto_355365 ) ) ( not ( = ?auto_355362 ?auto_355366 ) ) ( not ( = ?auto_355362 ?auto_355367 ) ) ( not ( = ?auto_355362 ?auto_355368 ) ) ( not ( = ?auto_355362 ?auto_355369 ) ) ( not ( = ?auto_355362 ?auto_355370 ) ) ( not ( = ?auto_355362 ?auto_355371 ) ) ( not ( = ?auto_355362 ?auto_355372 ) ) ( not ( = ?auto_355363 ?auto_355364 ) ) ( not ( = ?auto_355363 ?auto_355365 ) ) ( not ( = ?auto_355363 ?auto_355366 ) ) ( not ( = ?auto_355363 ?auto_355367 ) ) ( not ( = ?auto_355363 ?auto_355368 ) ) ( not ( = ?auto_355363 ?auto_355369 ) ) ( not ( = ?auto_355363 ?auto_355370 ) ) ( not ( = ?auto_355363 ?auto_355371 ) ) ( not ( = ?auto_355363 ?auto_355372 ) ) ( not ( = ?auto_355364 ?auto_355365 ) ) ( not ( = ?auto_355364 ?auto_355366 ) ) ( not ( = ?auto_355364 ?auto_355367 ) ) ( not ( = ?auto_355364 ?auto_355368 ) ) ( not ( = ?auto_355364 ?auto_355369 ) ) ( not ( = ?auto_355364 ?auto_355370 ) ) ( not ( = ?auto_355364 ?auto_355371 ) ) ( not ( = ?auto_355364 ?auto_355372 ) ) ( not ( = ?auto_355365 ?auto_355366 ) ) ( not ( = ?auto_355365 ?auto_355367 ) ) ( not ( = ?auto_355365 ?auto_355368 ) ) ( not ( = ?auto_355365 ?auto_355369 ) ) ( not ( = ?auto_355365 ?auto_355370 ) ) ( not ( = ?auto_355365 ?auto_355371 ) ) ( not ( = ?auto_355365 ?auto_355372 ) ) ( not ( = ?auto_355366 ?auto_355367 ) ) ( not ( = ?auto_355366 ?auto_355368 ) ) ( not ( = ?auto_355366 ?auto_355369 ) ) ( not ( = ?auto_355366 ?auto_355370 ) ) ( not ( = ?auto_355366 ?auto_355371 ) ) ( not ( = ?auto_355366 ?auto_355372 ) ) ( not ( = ?auto_355367 ?auto_355368 ) ) ( not ( = ?auto_355367 ?auto_355369 ) ) ( not ( = ?auto_355367 ?auto_355370 ) ) ( not ( = ?auto_355367 ?auto_355371 ) ) ( not ( = ?auto_355367 ?auto_355372 ) ) ( not ( = ?auto_355368 ?auto_355369 ) ) ( not ( = ?auto_355368 ?auto_355370 ) ) ( not ( = ?auto_355368 ?auto_355371 ) ) ( not ( = ?auto_355368 ?auto_355372 ) ) ( not ( = ?auto_355369 ?auto_355370 ) ) ( not ( = ?auto_355369 ?auto_355371 ) ) ( not ( = ?auto_355369 ?auto_355372 ) ) ( not ( = ?auto_355370 ?auto_355371 ) ) ( not ( = ?auto_355370 ?auto_355372 ) ) ( not ( = ?auto_355371 ?auto_355372 ) ) ( ON ?auto_355370 ?auto_355371 ) ( ON ?auto_355369 ?auto_355370 ) ( ON ?auto_355368 ?auto_355369 ) ( ON ?auto_355367 ?auto_355368 ) ( ON ?auto_355366 ?auto_355367 ) ( ON ?auto_355365 ?auto_355366 ) ( ON ?auto_355364 ?auto_355365 ) ( ON ?auto_355363 ?auto_355364 ) ( ON ?auto_355362 ?auto_355363 ) ( CLEAR ?auto_355360 ) ( ON ?auto_355361 ?auto_355362 ) ( CLEAR ?auto_355361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_355359 ?auto_355360 ?auto_355361 )
      ( MAKE-13PILE ?auto_355359 ?auto_355360 ?auto_355361 ?auto_355362 ?auto_355363 ?auto_355364 ?auto_355365 ?auto_355366 ?auto_355367 ?auto_355368 ?auto_355369 ?auto_355370 ?auto_355371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355413 - BLOCK
      ?auto_355414 - BLOCK
      ?auto_355415 - BLOCK
      ?auto_355416 - BLOCK
      ?auto_355417 - BLOCK
      ?auto_355418 - BLOCK
      ?auto_355419 - BLOCK
      ?auto_355420 - BLOCK
      ?auto_355421 - BLOCK
      ?auto_355422 - BLOCK
      ?auto_355423 - BLOCK
      ?auto_355424 - BLOCK
      ?auto_355425 - BLOCK
    )
    :vars
    (
      ?auto_355426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355425 ?auto_355426 ) ( ON-TABLE ?auto_355413 ) ( not ( = ?auto_355413 ?auto_355414 ) ) ( not ( = ?auto_355413 ?auto_355415 ) ) ( not ( = ?auto_355413 ?auto_355416 ) ) ( not ( = ?auto_355413 ?auto_355417 ) ) ( not ( = ?auto_355413 ?auto_355418 ) ) ( not ( = ?auto_355413 ?auto_355419 ) ) ( not ( = ?auto_355413 ?auto_355420 ) ) ( not ( = ?auto_355413 ?auto_355421 ) ) ( not ( = ?auto_355413 ?auto_355422 ) ) ( not ( = ?auto_355413 ?auto_355423 ) ) ( not ( = ?auto_355413 ?auto_355424 ) ) ( not ( = ?auto_355413 ?auto_355425 ) ) ( not ( = ?auto_355413 ?auto_355426 ) ) ( not ( = ?auto_355414 ?auto_355415 ) ) ( not ( = ?auto_355414 ?auto_355416 ) ) ( not ( = ?auto_355414 ?auto_355417 ) ) ( not ( = ?auto_355414 ?auto_355418 ) ) ( not ( = ?auto_355414 ?auto_355419 ) ) ( not ( = ?auto_355414 ?auto_355420 ) ) ( not ( = ?auto_355414 ?auto_355421 ) ) ( not ( = ?auto_355414 ?auto_355422 ) ) ( not ( = ?auto_355414 ?auto_355423 ) ) ( not ( = ?auto_355414 ?auto_355424 ) ) ( not ( = ?auto_355414 ?auto_355425 ) ) ( not ( = ?auto_355414 ?auto_355426 ) ) ( not ( = ?auto_355415 ?auto_355416 ) ) ( not ( = ?auto_355415 ?auto_355417 ) ) ( not ( = ?auto_355415 ?auto_355418 ) ) ( not ( = ?auto_355415 ?auto_355419 ) ) ( not ( = ?auto_355415 ?auto_355420 ) ) ( not ( = ?auto_355415 ?auto_355421 ) ) ( not ( = ?auto_355415 ?auto_355422 ) ) ( not ( = ?auto_355415 ?auto_355423 ) ) ( not ( = ?auto_355415 ?auto_355424 ) ) ( not ( = ?auto_355415 ?auto_355425 ) ) ( not ( = ?auto_355415 ?auto_355426 ) ) ( not ( = ?auto_355416 ?auto_355417 ) ) ( not ( = ?auto_355416 ?auto_355418 ) ) ( not ( = ?auto_355416 ?auto_355419 ) ) ( not ( = ?auto_355416 ?auto_355420 ) ) ( not ( = ?auto_355416 ?auto_355421 ) ) ( not ( = ?auto_355416 ?auto_355422 ) ) ( not ( = ?auto_355416 ?auto_355423 ) ) ( not ( = ?auto_355416 ?auto_355424 ) ) ( not ( = ?auto_355416 ?auto_355425 ) ) ( not ( = ?auto_355416 ?auto_355426 ) ) ( not ( = ?auto_355417 ?auto_355418 ) ) ( not ( = ?auto_355417 ?auto_355419 ) ) ( not ( = ?auto_355417 ?auto_355420 ) ) ( not ( = ?auto_355417 ?auto_355421 ) ) ( not ( = ?auto_355417 ?auto_355422 ) ) ( not ( = ?auto_355417 ?auto_355423 ) ) ( not ( = ?auto_355417 ?auto_355424 ) ) ( not ( = ?auto_355417 ?auto_355425 ) ) ( not ( = ?auto_355417 ?auto_355426 ) ) ( not ( = ?auto_355418 ?auto_355419 ) ) ( not ( = ?auto_355418 ?auto_355420 ) ) ( not ( = ?auto_355418 ?auto_355421 ) ) ( not ( = ?auto_355418 ?auto_355422 ) ) ( not ( = ?auto_355418 ?auto_355423 ) ) ( not ( = ?auto_355418 ?auto_355424 ) ) ( not ( = ?auto_355418 ?auto_355425 ) ) ( not ( = ?auto_355418 ?auto_355426 ) ) ( not ( = ?auto_355419 ?auto_355420 ) ) ( not ( = ?auto_355419 ?auto_355421 ) ) ( not ( = ?auto_355419 ?auto_355422 ) ) ( not ( = ?auto_355419 ?auto_355423 ) ) ( not ( = ?auto_355419 ?auto_355424 ) ) ( not ( = ?auto_355419 ?auto_355425 ) ) ( not ( = ?auto_355419 ?auto_355426 ) ) ( not ( = ?auto_355420 ?auto_355421 ) ) ( not ( = ?auto_355420 ?auto_355422 ) ) ( not ( = ?auto_355420 ?auto_355423 ) ) ( not ( = ?auto_355420 ?auto_355424 ) ) ( not ( = ?auto_355420 ?auto_355425 ) ) ( not ( = ?auto_355420 ?auto_355426 ) ) ( not ( = ?auto_355421 ?auto_355422 ) ) ( not ( = ?auto_355421 ?auto_355423 ) ) ( not ( = ?auto_355421 ?auto_355424 ) ) ( not ( = ?auto_355421 ?auto_355425 ) ) ( not ( = ?auto_355421 ?auto_355426 ) ) ( not ( = ?auto_355422 ?auto_355423 ) ) ( not ( = ?auto_355422 ?auto_355424 ) ) ( not ( = ?auto_355422 ?auto_355425 ) ) ( not ( = ?auto_355422 ?auto_355426 ) ) ( not ( = ?auto_355423 ?auto_355424 ) ) ( not ( = ?auto_355423 ?auto_355425 ) ) ( not ( = ?auto_355423 ?auto_355426 ) ) ( not ( = ?auto_355424 ?auto_355425 ) ) ( not ( = ?auto_355424 ?auto_355426 ) ) ( not ( = ?auto_355425 ?auto_355426 ) ) ( ON ?auto_355424 ?auto_355425 ) ( ON ?auto_355423 ?auto_355424 ) ( ON ?auto_355422 ?auto_355423 ) ( ON ?auto_355421 ?auto_355422 ) ( ON ?auto_355420 ?auto_355421 ) ( ON ?auto_355419 ?auto_355420 ) ( ON ?auto_355418 ?auto_355419 ) ( ON ?auto_355417 ?auto_355418 ) ( ON ?auto_355416 ?auto_355417 ) ( ON ?auto_355415 ?auto_355416 ) ( CLEAR ?auto_355413 ) ( ON ?auto_355414 ?auto_355415 ) ( CLEAR ?auto_355414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_355413 ?auto_355414 )
      ( MAKE-13PILE ?auto_355413 ?auto_355414 ?auto_355415 ?auto_355416 ?auto_355417 ?auto_355418 ?auto_355419 ?auto_355420 ?auto_355421 ?auto_355422 ?auto_355423 ?auto_355424 ?auto_355425 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_355467 - BLOCK
      ?auto_355468 - BLOCK
      ?auto_355469 - BLOCK
      ?auto_355470 - BLOCK
      ?auto_355471 - BLOCK
      ?auto_355472 - BLOCK
      ?auto_355473 - BLOCK
      ?auto_355474 - BLOCK
      ?auto_355475 - BLOCK
      ?auto_355476 - BLOCK
      ?auto_355477 - BLOCK
      ?auto_355478 - BLOCK
      ?auto_355479 - BLOCK
    )
    :vars
    (
      ?auto_355480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355479 ?auto_355480 ) ( not ( = ?auto_355467 ?auto_355468 ) ) ( not ( = ?auto_355467 ?auto_355469 ) ) ( not ( = ?auto_355467 ?auto_355470 ) ) ( not ( = ?auto_355467 ?auto_355471 ) ) ( not ( = ?auto_355467 ?auto_355472 ) ) ( not ( = ?auto_355467 ?auto_355473 ) ) ( not ( = ?auto_355467 ?auto_355474 ) ) ( not ( = ?auto_355467 ?auto_355475 ) ) ( not ( = ?auto_355467 ?auto_355476 ) ) ( not ( = ?auto_355467 ?auto_355477 ) ) ( not ( = ?auto_355467 ?auto_355478 ) ) ( not ( = ?auto_355467 ?auto_355479 ) ) ( not ( = ?auto_355467 ?auto_355480 ) ) ( not ( = ?auto_355468 ?auto_355469 ) ) ( not ( = ?auto_355468 ?auto_355470 ) ) ( not ( = ?auto_355468 ?auto_355471 ) ) ( not ( = ?auto_355468 ?auto_355472 ) ) ( not ( = ?auto_355468 ?auto_355473 ) ) ( not ( = ?auto_355468 ?auto_355474 ) ) ( not ( = ?auto_355468 ?auto_355475 ) ) ( not ( = ?auto_355468 ?auto_355476 ) ) ( not ( = ?auto_355468 ?auto_355477 ) ) ( not ( = ?auto_355468 ?auto_355478 ) ) ( not ( = ?auto_355468 ?auto_355479 ) ) ( not ( = ?auto_355468 ?auto_355480 ) ) ( not ( = ?auto_355469 ?auto_355470 ) ) ( not ( = ?auto_355469 ?auto_355471 ) ) ( not ( = ?auto_355469 ?auto_355472 ) ) ( not ( = ?auto_355469 ?auto_355473 ) ) ( not ( = ?auto_355469 ?auto_355474 ) ) ( not ( = ?auto_355469 ?auto_355475 ) ) ( not ( = ?auto_355469 ?auto_355476 ) ) ( not ( = ?auto_355469 ?auto_355477 ) ) ( not ( = ?auto_355469 ?auto_355478 ) ) ( not ( = ?auto_355469 ?auto_355479 ) ) ( not ( = ?auto_355469 ?auto_355480 ) ) ( not ( = ?auto_355470 ?auto_355471 ) ) ( not ( = ?auto_355470 ?auto_355472 ) ) ( not ( = ?auto_355470 ?auto_355473 ) ) ( not ( = ?auto_355470 ?auto_355474 ) ) ( not ( = ?auto_355470 ?auto_355475 ) ) ( not ( = ?auto_355470 ?auto_355476 ) ) ( not ( = ?auto_355470 ?auto_355477 ) ) ( not ( = ?auto_355470 ?auto_355478 ) ) ( not ( = ?auto_355470 ?auto_355479 ) ) ( not ( = ?auto_355470 ?auto_355480 ) ) ( not ( = ?auto_355471 ?auto_355472 ) ) ( not ( = ?auto_355471 ?auto_355473 ) ) ( not ( = ?auto_355471 ?auto_355474 ) ) ( not ( = ?auto_355471 ?auto_355475 ) ) ( not ( = ?auto_355471 ?auto_355476 ) ) ( not ( = ?auto_355471 ?auto_355477 ) ) ( not ( = ?auto_355471 ?auto_355478 ) ) ( not ( = ?auto_355471 ?auto_355479 ) ) ( not ( = ?auto_355471 ?auto_355480 ) ) ( not ( = ?auto_355472 ?auto_355473 ) ) ( not ( = ?auto_355472 ?auto_355474 ) ) ( not ( = ?auto_355472 ?auto_355475 ) ) ( not ( = ?auto_355472 ?auto_355476 ) ) ( not ( = ?auto_355472 ?auto_355477 ) ) ( not ( = ?auto_355472 ?auto_355478 ) ) ( not ( = ?auto_355472 ?auto_355479 ) ) ( not ( = ?auto_355472 ?auto_355480 ) ) ( not ( = ?auto_355473 ?auto_355474 ) ) ( not ( = ?auto_355473 ?auto_355475 ) ) ( not ( = ?auto_355473 ?auto_355476 ) ) ( not ( = ?auto_355473 ?auto_355477 ) ) ( not ( = ?auto_355473 ?auto_355478 ) ) ( not ( = ?auto_355473 ?auto_355479 ) ) ( not ( = ?auto_355473 ?auto_355480 ) ) ( not ( = ?auto_355474 ?auto_355475 ) ) ( not ( = ?auto_355474 ?auto_355476 ) ) ( not ( = ?auto_355474 ?auto_355477 ) ) ( not ( = ?auto_355474 ?auto_355478 ) ) ( not ( = ?auto_355474 ?auto_355479 ) ) ( not ( = ?auto_355474 ?auto_355480 ) ) ( not ( = ?auto_355475 ?auto_355476 ) ) ( not ( = ?auto_355475 ?auto_355477 ) ) ( not ( = ?auto_355475 ?auto_355478 ) ) ( not ( = ?auto_355475 ?auto_355479 ) ) ( not ( = ?auto_355475 ?auto_355480 ) ) ( not ( = ?auto_355476 ?auto_355477 ) ) ( not ( = ?auto_355476 ?auto_355478 ) ) ( not ( = ?auto_355476 ?auto_355479 ) ) ( not ( = ?auto_355476 ?auto_355480 ) ) ( not ( = ?auto_355477 ?auto_355478 ) ) ( not ( = ?auto_355477 ?auto_355479 ) ) ( not ( = ?auto_355477 ?auto_355480 ) ) ( not ( = ?auto_355478 ?auto_355479 ) ) ( not ( = ?auto_355478 ?auto_355480 ) ) ( not ( = ?auto_355479 ?auto_355480 ) ) ( ON ?auto_355478 ?auto_355479 ) ( ON ?auto_355477 ?auto_355478 ) ( ON ?auto_355476 ?auto_355477 ) ( ON ?auto_355475 ?auto_355476 ) ( ON ?auto_355474 ?auto_355475 ) ( ON ?auto_355473 ?auto_355474 ) ( ON ?auto_355472 ?auto_355473 ) ( ON ?auto_355471 ?auto_355472 ) ( ON ?auto_355470 ?auto_355471 ) ( ON ?auto_355469 ?auto_355470 ) ( ON ?auto_355468 ?auto_355469 ) ( ON ?auto_355467 ?auto_355468 ) ( CLEAR ?auto_355467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_355467 )
      ( MAKE-13PILE ?auto_355467 ?auto_355468 ?auto_355469 ?auto_355470 ?auto_355471 ?auto_355472 ?auto_355473 ?auto_355474 ?auto_355475 ?auto_355476 ?auto_355477 ?auto_355478 ?auto_355479 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355522 - BLOCK
      ?auto_355523 - BLOCK
      ?auto_355524 - BLOCK
      ?auto_355525 - BLOCK
      ?auto_355526 - BLOCK
      ?auto_355527 - BLOCK
      ?auto_355528 - BLOCK
      ?auto_355529 - BLOCK
      ?auto_355530 - BLOCK
      ?auto_355531 - BLOCK
      ?auto_355532 - BLOCK
      ?auto_355533 - BLOCK
      ?auto_355534 - BLOCK
      ?auto_355535 - BLOCK
    )
    :vars
    (
      ?auto_355536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_355534 ) ( ON ?auto_355535 ?auto_355536 ) ( CLEAR ?auto_355535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_355522 ) ( ON ?auto_355523 ?auto_355522 ) ( ON ?auto_355524 ?auto_355523 ) ( ON ?auto_355525 ?auto_355524 ) ( ON ?auto_355526 ?auto_355525 ) ( ON ?auto_355527 ?auto_355526 ) ( ON ?auto_355528 ?auto_355527 ) ( ON ?auto_355529 ?auto_355528 ) ( ON ?auto_355530 ?auto_355529 ) ( ON ?auto_355531 ?auto_355530 ) ( ON ?auto_355532 ?auto_355531 ) ( ON ?auto_355533 ?auto_355532 ) ( ON ?auto_355534 ?auto_355533 ) ( not ( = ?auto_355522 ?auto_355523 ) ) ( not ( = ?auto_355522 ?auto_355524 ) ) ( not ( = ?auto_355522 ?auto_355525 ) ) ( not ( = ?auto_355522 ?auto_355526 ) ) ( not ( = ?auto_355522 ?auto_355527 ) ) ( not ( = ?auto_355522 ?auto_355528 ) ) ( not ( = ?auto_355522 ?auto_355529 ) ) ( not ( = ?auto_355522 ?auto_355530 ) ) ( not ( = ?auto_355522 ?auto_355531 ) ) ( not ( = ?auto_355522 ?auto_355532 ) ) ( not ( = ?auto_355522 ?auto_355533 ) ) ( not ( = ?auto_355522 ?auto_355534 ) ) ( not ( = ?auto_355522 ?auto_355535 ) ) ( not ( = ?auto_355522 ?auto_355536 ) ) ( not ( = ?auto_355523 ?auto_355524 ) ) ( not ( = ?auto_355523 ?auto_355525 ) ) ( not ( = ?auto_355523 ?auto_355526 ) ) ( not ( = ?auto_355523 ?auto_355527 ) ) ( not ( = ?auto_355523 ?auto_355528 ) ) ( not ( = ?auto_355523 ?auto_355529 ) ) ( not ( = ?auto_355523 ?auto_355530 ) ) ( not ( = ?auto_355523 ?auto_355531 ) ) ( not ( = ?auto_355523 ?auto_355532 ) ) ( not ( = ?auto_355523 ?auto_355533 ) ) ( not ( = ?auto_355523 ?auto_355534 ) ) ( not ( = ?auto_355523 ?auto_355535 ) ) ( not ( = ?auto_355523 ?auto_355536 ) ) ( not ( = ?auto_355524 ?auto_355525 ) ) ( not ( = ?auto_355524 ?auto_355526 ) ) ( not ( = ?auto_355524 ?auto_355527 ) ) ( not ( = ?auto_355524 ?auto_355528 ) ) ( not ( = ?auto_355524 ?auto_355529 ) ) ( not ( = ?auto_355524 ?auto_355530 ) ) ( not ( = ?auto_355524 ?auto_355531 ) ) ( not ( = ?auto_355524 ?auto_355532 ) ) ( not ( = ?auto_355524 ?auto_355533 ) ) ( not ( = ?auto_355524 ?auto_355534 ) ) ( not ( = ?auto_355524 ?auto_355535 ) ) ( not ( = ?auto_355524 ?auto_355536 ) ) ( not ( = ?auto_355525 ?auto_355526 ) ) ( not ( = ?auto_355525 ?auto_355527 ) ) ( not ( = ?auto_355525 ?auto_355528 ) ) ( not ( = ?auto_355525 ?auto_355529 ) ) ( not ( = ?auto_355525 ?auto_355530 ) ) ( not ( = ?auto_355525 ?auto_355531 ) ) ( not ( = ?auto_355525 ?auto_355532 ) ) ( not ( = ?auto_355525 ?auto_355533 ) ) ( not ( = ?auto_355525 ?auto_355534 ) ) ( not ( = ?auto_355525 ?auto_355535 ) ) ( not ( = ?auto_355525 ?auto_355536 ) ) ( not ( = ?auto_355526 ?auto_355527 ) ) ( not ( = ?auto_355526 ?auto_355528 ) ) ( not ( = ?auto_355526 ?auto_355529 ) ) ( not ( = ?auto_355526 ?auto_355530 ) ) ( not ( = ?auto_355526 ?auto_355531 ) ) ( not ( = ?auto_355526 ?auto_355532 ) ) ( not ( = ?auto_355526 ?auto_355533 ) ) ( not ( = ?auto_355526 ?auto_355534 ) ) ( not ( = ?auto_355526 ?auto_355535 ) ) ( not ( = ?auto_355526 ?auto_355536 ) ) ( not ( = ?auto_355527 ?auto_355528 ) ) ( not ( = ?auto_355527 ?auto_355529 ) ) ( not ( = ?auto_355527 ?auto_355530 ) ) ( not ( = ?auto_355527 ?auto_355531 ) ) ( not ( = ?auto_355527 ?auto_355532 ) ) ( not ( = ?auto_355527 ?auto_355533 ) ) ( not ( = ?auto_355527 ?auto_355534 ) ) ( not ( = ?auto_355527 ?auto_355535 ) ) ( not ( = ?auto_355527 ?auto_355536 ) ) ( not ( = ?auto_355528 ?auto_355529 ) ) ( not ( = ?auto_355528 ?auto_355530 ) ) ( not ( = ?auto_355528 ?auto_355531 ) ) ( not ( = ?auto_355528 ?auto_355532 ) ) ( not ( = ?auto_355528 ?auto_355533 ) ) ( not ( = ?auto_355528 ?auto_355534 ) ) ( not ( = ?auto_355528 ?auto_355535 ) ) ( not ( = ?auto_355528 ?auto_355536 ) ) ( not ( = ?auto_355529 ?auto_355530 ) ) ( not ( = ?auto_355529 ?auto_355531 ) ) ( not ( = ?auto_355529 ?auto_355532 ) ) ( not ( = ?auto_355529 ?auto_355533 ) ) ( not ( = ?auto_355529 ?auto_355534 ) ) ( not ( = ?auto_355529 ?auto_355535 ) ) ( not ( = ?auto_355529 ?auto_355536 ) ) ( not ( = ?auto_355530 ?auto_355531 ) ) ( not ( = ?auto_355530 ?auto_355532 ) ) ( not ( = ?auto_355530 ?auto_355533 ) ) ( not ( = ?auto_355530 ?auto_355534 ) ) ( not ( = ?auto_355530 ?auto_355535 ) ) ( not ( = ?auto_355530 ?auto_355536 ) ) ( not ( = ?auto_355531 ?auto_355532 ) ) ( not ( = ?auto_355531 ?auto_355533 ) ) ( not ( = ?auto_355531 ?auto_355534 ) ) ( not ( = ?auto_355531 ?auto_355535 ) ) ( not ( = ?auto_355531 ?auto_355536 ) ) ( not ( = ?auto_355532 ?auto_355533 ) ) ( not ( = ?auto_355532 ?auto_355534 ) ) ( not ( = ?auto_355532 ?auto_355535 ) ) ( not ( = ?auto_355532 ?auto_355536 ) ) ( not ( = ?auto_355533 ?auto_355534 ) ) ( not ( = ?auto_355533 ?auto_355535 ) ) ( not ( = ?auto_355533 ?auto_355536 ) ) ( not ( = ?auto_355534 ?auto_355535 ) ) ( not ( = ?auto_355534 ?auto_355536 ) ) ( not ( = ?auto_355535 ?auto_355536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_355535 ?auto_355536 )
      ( !STACK ?auto_355535 ?auto_355534 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355551 - BLOCK
      ?auto_355552 - BLOCK
      ?auto_355553 - BLOCK
      ?auto_355554 - BLOCK
      ?auto_355555 - BLOCK
      ?auto_355556 - BLOCK
      ?auto_355557 - BLOCK
      ?auto_355558 - BLOCK
      ?auto_355559 - BLOCK
      ?auto_355560 - BLOCK
      ?auto_355561 - BLOCK
      ?auto_355562 - BLOCK
      ?auto_355563 - BLOCK
      ?auto_355564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_355563 ) ( ON-TABLE ?auto_355564 ) ( CLEAR ?auto_355564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_355551 ) ( ON ?auto_355552 ?auto_355551 ) ( ON ?auto_355553 ?auto_355552 ) ( ON ?auto_355554 ?auto_355553 ) ( ON ?auto_355555 ?auto_355554 ) ( ON ?auto_355556 ?auto_355555 ) ( ON ?auto_355557 ?auto_355556 ) ( ON ?auto_355558 ?auto_355557 ) ( ON ?auto_355559 ?auto_355558 ) ( ON ?auto_355560 ?auto_355559 ) ( ON ?auto_355561 ?auto_355560 ) ( ON ?auto_355562 ?auto_355561 ) ( ON ?auto_355563 ?auto_355562 ) ( not ( = ?auto_355551 ?auto_355552 ) ) ( not ( = ?auto_355551 ?auto_355553 ) ) ( not ( = ?auto_355551 ?auto_355554 ) ) ( not ( = ?auto_355551 ?auto_355555 ) ) ( not ( = ?auto_355551 ?auto_355556 ) ) ( not ( = ?auto_355551 ?auto_355557 ) ) ( not ( = ?auto_355551 ?auto_355558 ) ) ( not ( = ?auto_355551 ?auto_355559 ) ) ( not ( = ?auto_355551 ?auto_355560 ) ) ( not ( = ?auto_355551 ?auto_355561 ) ) ( not ( = ?auto_355551 ?auto_355562 ) ) ( not ( = ?auto_355551 ?auto_355563 ) ) ( not ( = ?auto_355551 ?auto_355564 ) ) ( not ( = ?auto_355552 ?auto_355553 ) ) ( not ( = ?auto_355552 ?auto_355554 ) ) ( not ( = ?auto_355552 ?auto_355555 ) ) ( not ( = ?auto_355552 ?auto_355556 ) ) ( not ( = ?auto_355552 ?auto_355557 ) ) ( not ( = ?auto_355552 ?auto_355558 ) ) ( not ( = ?auto_355552 ?auto_355559 ) ) ( not ( = ?auto_355552 ?auto_355560 ) ) ( not ( = ?auto_355552 ?auto_355561 ) ) ( not ( = ?auto_355552 ?auto_355562 ) ) ( not ( = ?auto_355552 ?auto_355563 ) ) ( not ( = ?auto_355552 ?auto_355564 ) ) ( not ( = ?auto_355553 ?auto_355554 ) ) ( not ( = ?auto_355553 ?auto_355555 ) ) ( not ( = ?auto_355553 ?auto_355556 ) ) ( not ( = ?auto_355553 ?auto_355557 ) ) ( not ( = ?auto_355553 ?auto_355558 ) ) ( not ( = ?auto_355553 ?auto_355559 ) ) ( not ( = ?auto_355553 ?auto_355560 ) ) ( not ( = ?auto_355553 ?auto_355561 ) ) ( not ( = ?auto_355553 ?auto_355562 ) ) ( not ( = ?auto_355553 ?auto_355563 ) ) ( not ( = ?auto_355553 ?auto_355564 ) ) ( not ( = ?auto_355554 ?auto_355555 ) ) ( not ( = ?auto_355554 ?auto_355556 ) ) ( not ( = ?auto_355554 ?auto_355557 ) ) ( not ( = ?auto_355554 ?auto_355558 ) ) ( not ( = ?auto_355554 ?auto_355559 ) ) ( not ( = ?auto_355554 ?auto_355560 ) ) ( not ( = ?auto_355554 ?auto_355561 ) ) ( not ( = ?auto_355554 ?auto_355562 ) ) ( not ( = ?auto_355554 ?auto_355563 ) ) ( not ( = ?auto_355554 ?auto_355564 ) ) ( not ( = ?auto_355555 ?auto_355556 ) ) ( not ( = ?auto_355555 ?auto_355557 ) ) ( not ( = ?auto_355555 ?auto_355558 ) ) ( not ( = ?auto_355555 ?auto_355559 ) ) ( not ( = ?auto_355555 ?auto_355560 ) ) ( not ( = ?auto_355555 ?auto_355561 ) ) ( not ( = ?auto_355555 ?auto_355562 ) ) ( not ( = ?auto_355555 ?auto_355563 ) ) ( not ( = ?auto_355555 ?auto_355564 ) ) ( not ( = ?auto_355556 ?auto_355557 ) ) ( not ( = ?auto_355556 ?auto_355558 ) ) ( not ( = ?auto_355556 ?auto_355559 ) ) ( not ( = ?auto_355556 ?auto_355560 ) ) ( not ( = ?auto_355556 ?auto_355561 ) ) ( not ( = ?auto_355556 ?auto_355562 ) ) ( not ( = ?auto_355556 ?auto_355563 ) ) ( not ( = ?auto_355556 ?auto_355564 ) ) ( not ( = ?auto_355557 ?auto_355558 ) ) ( not ( = ?auto_355557 ?auto_355559 ) ) ( not ( = ?auto_355557 ?auto_355560 ) ) ( not ( = ?auto_355557 ?auto_355561 ) ) ( not ( = ?auto_355557 ?auto_355562 ) ) ( not ( = ?auto_355557 ?auto_355563 ) ) ( not ( = ?auto_355557 ?auto_355564 ) ) ( not ( = ?auto_355558 ?auto_355559 ) ) ( not ( = ?auto_355558 ?auto_355560 ) ) ( not ( = ?auto_355558 ?auto_355561 ) ) ( not ( = ?auto_355558 ?auto_355562 ) ) ( not ( = ?auto_355558 ?auto_355563 ) ) ( not ( = ?auto_355558 ?auto_355564 ) ) ( not ( = ?auto_355559 ?auto_355560 ) ) ( not ( = ?auto_355559 ?auto_355561 ) ) ( not ( = ?auto_355559 ?auto_355562 ) ) ( not ( = ?auto_355559 ?auto_355563 ) ) ( not ( = ?auto_355559 ?auto_355564 ) ) ( not ( = ?auto_355560 ?auto_355561 ) ) ( not ( = ?auto_355560 ?auto_355562 ) ) ( not ( = ?auto_355560 ?auto_355563 ) ) ( not ( = ?auto_355560 ?auto_355564 ) ) ( not ( = ?auto_355561 ?auto_355562 ) ) ( not ( = ?auto_355561 ?auto_355563 ) ) ( not ( = ?auto_355561 ?auto_355564 ) ) ( not ( = ?auto_355562 ?auto_355563 ) ) ( not ( = ?auto_355562 ?auto_355564 ) ) ( not ( = ?auto_355563 ?auto_355564 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_355564 )
      ( !STACK ?auto_355564 ?auto_355563 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355579 - BLOCK
      ?auto_355580 - BLOCK
      ?auto_355581 - BLOCK
      ?auto_355582 - BLOCK
      ?auto_355583 - BLOCK
      ?auto_355584 - BLOCK
      ?auto_355585 - BLOCK
      ?auto_355586 - BLOCK
      ?auto_355587 - BLOCK
      ?auto_355588 - BLOCK
      ?auto_355589 - BLOCK
      ?auto_355590 - BLOCK
      ?auto_355591 - BLOCK
      ?auto_355592 - BLOCK
    )
    :vars
    (
      ?auto_355593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355592 ?auto_355593 ) ( ON-TABLE ?auto_355579 ) ( ON ?auto_355580 ?auto_355579 ) ( ON ?auto_355581 ?auto_355580 ) ( ON ?auto_355582 ?auto_355581 ) ( ON ?auto_355583 ?auto_355582 ) ( ON ?auto_355584 ?auto_355583 ) ( ON ?auto_355585 ?auto_355584 ) ( ON ?auto_355586 ?auto_355585 ) ( ON ?auto_355587 ?auto_355586 ) ( ON ?auto_355588 ?auto_355587 ) ( ON ?auto_355589 ?auto_355588 ) ( ON ?auto_355590 ?auto_355589 ) ( not ( = ?auto_355579 ?auto_355580 ) ) ( not ( = ?auto_355579 ?auto_355581 ) ) ( not ( = ?auto_355579 ?auto_355582 ) ) ( not ( = ?auto_355579 ?auto_355583 ) ) ( not ( = ?auto_355579 ?auto_355584 ) ) ( not ( = ?auto_355579 ?auto_355585 ) ) ( not ( = ?auto_355579 ?auto_355586 ) ) ( not ( = ?auto_355579 ?auto_355587 ) ) ( not ( = ?auto_355579 ?auto_355588 ) ) ( not ( = ?auto_355579 ?auto_355589 ) ) ( not ( = ?auto_355579 ?auto_355590 ) ) ( not ( = ?auto_355579 ?auto_355591 ) ) ( not ( = ?auto_355579 ?auto_355592 ) ) ( not ( = ?auto_355579 ?auto_355593 ) ) ( not ( = ?auto_355580 ?auto_355581 ) ) ( not ( = ?auto_355580 ?auto_355582 ) ) ( not ( = ?auto_355580 ?auto_355583 ) ) ( not ( = ?auto_355580 ?auto_355584 ) ) ( not ( = ?auto_355580 ?auto_355585 ) ) ( not ( = ?auto_355580 ?auto_355586 ) ) ( not ( = ?auto_355580 ?auto_355587 ) ) ( not ( = ?auto_355580 ?auto_355588 ) ) ( not ( = ?auto_355580 ?auto_355589 ) ) ( not ( = ?auto_355580 ?auto_355590 ) ) ( not ( = ?auto_355580 ?auto_355591 ) ) ( not ( = ?auto_355580 ?auto_355592 ) ) ( not ( = ?auto_355580 ?auto_355593 ) ) ( not ( = ?auto_355581 ?auto_355582 ) ) ( not ( = ?auto_355581 ?auto_355583 ) ) ( not ( = ?auto_355581 ?auto_355584 ) ) ( not ( = ?auto_355581 ?auto_355585 ) ) ( not ( = ?auto_355581 ?auto_355586 ) ) ( not ( = ?auto_355581 ?auto_355587 ) ) ( not ( = ?auto_355581 ?auto_355588 ) ) ( not ( = ?auto_355581 ?auto_355589 ) ) ( not ( = ?auto_355581 ?auto_355590 ) ) ( not ( = ?auto_355581 ?auto_355591 ) ) ( not ( = ?auto_355581 ?auto_355592 ) ) ( not ( = ?auto_355581 ?auto_355593 ) ) ( not ( = ?auto_355582 ?auto_355583 ) ) ( not ( = ?auto_355582 ?auto_355584 ) ) ( not ( = ?auto_355582 ?auto_355585 ) ) ( not ( = ?auto_355582 ?auto_355586 ) ) ( not ( = ?auto_355582 ?auto_355587 ) ) ( not ( = ?auto_355582 ?auto_355588 ) ) ( not ( = ?auto_355582 ?auto_355589 ) ) ( not ( = ?auto_355582 ?auto_355590 ) ) ( not ( = ?auto_355582 ?auto_355591 ) ) ( not ( = ?auto_355582 ?auto_355592 ) ) ( not ( = ?auto_355582 ?auto_355593 ) ) ( not ( = ?auto_355583 ?auto_355584 ) ) ( not ( = ?auto_355583 ?auto_355585 ) ) ( not ( = ?auto_355583 ?auto_355586 ) ) ( not ( = ?auto_355583 ?auto_355587 ) ) ( not ( = ?auto_355583 ?auto_355588 ) ) ( not ( = ?auto_355583 ?auto_355589 ) ) ( not ( = ?auto_355583 ?auto_355590 ) ) ( not ( = ?auto_355583 ?auto_355591 ) ) ( not ( = ?auto_355583 ?auto_355592 ) ) ( not ( = ?auto_355583 ?auto_355593 ) ) ( not ( = ?auto_355584 ?auto_355585 ) ) ( not ( = ?auto_355584 ?auto_355586 ) ) ( not ( = ?auto_355584 ?auto_355587 ) ) ( not ( = ?auto_355584 ?auto_355588 ) ) ( not ( = ?auto_355584 ?auto_355589 ) ) ( not ( = ?auto_355584 ?auto_355590 ) ) ( not ( = ?auto_355584 ?auto_355591 ) ) ( not ( = ?auto_355584 ?auto_355592 ) ) ( not ( = ?auto_355584 ?auto_355593 ) ) ( not ( = ?auto_355585 ?auto_355586 ) ) ( not ( = ?auto_355585 ?auto_355587 ) ) ( not ( = ?auto_355585 ?auto_355588 ) ) ( not ( = ?auto_355585 ?auto_355589 ) ) ( not ( = ?auto_355585 ?auto_355590 ) ) ( not ( = ?auto_355585 ?auto_355591 ) ) ( not ( = ?auto_355585 ?auto_355592 ) ) ( not ( = ?auto_355585 ?auto_355593 ) ) ( not ( = ?auto_355586 ?auto_355587 ) ) ( not ( = ?auto_355586 ?auto_355588 ) ) ( not ( = ?auto_355586 ?auto_355589 ) ) ( not ( = ?auto_355586 ?auto_355590 ) ) ( not ( = ?auto_355586 ?auto_355591 ) ) ( not ( = ?auto_355586 ?auto_355592 ) ) ( not ( = ?auto_355586 ?auto_355593 ) ) ( not ( = ?auto_355587 ?auto_355588 ) ) ( not ( = ?auto_355587 ?auto_355589 ) ) ( not ( = ?auto_355587 ?auto_355590 ) ) ( not ( = ?auto_355587 ?auto_355591 ) ) ( not ( = ?auto_355587 ?auto_355592 ) ) ( not ( = ?auto_355587 ?auto_355593 ) ) ( not ( = ?auto_355588 ?auto_355589 ) ) ( not ( = ?auto_355588 ?auto_355590 ) ) ( not ( = ?auto_355588 ?auto_355591 ) ) ( not ( = ?auto_355588 ?auto_355592 ) ) ( not ( = ?auto_355588 ?auto_355593 ) ) ( not ( = ?auto_355589 ?auto_355590 ) ) ( not ( = ?auto_355589 ?auto_355591 ) ) ( not ( = ?auto_355589 ?auto_355592 ) ) ( not ( = ?auto_355589 ?auto_355593 ) ) ( not ( = ?auto_355590 ?auto_355591 ) ) ( not ( = ?auto_355590 ?auto_355592 ) ) ( not ( = ?auto_355590 ?auto_355593 ) ) ( not ( = ?auto_355591 ?auto_355592 ) ) ( not ( = ?auto_355591 ?auto_355593 ) ) ( not ( = ?auto_355592 ?auto_355593 ) ) ( CLEAR ?auto_355590 ) ( ON ?auto_355591 ?auto_355592 ) ( CLEAR ?auto_355591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_355579 ?auto_355580 ?auto_355581 ?auto_355582 ?auto_355583 ?auto_355584 ?auto_355585 ?auto_355586 ?auto_355587 ?auto_355588 ?auto_355589 ?auto_355590 ?auto_355591 )
      ( MAKE-14PILE ?auto_355579 ?auto_355580 ?auto_355581 ?auto_355582 ?auto_355583 ?auto_355584 ?auto_355585 ?auto_355586 ?auto_355587 ?auto_355588 ?auto_355589 ?auto_355590 ?auto_355591 ?auto_355592 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355608 - BLOCK
      ?auto_355609 - BLOCK
      ?auto_355610 - BLOCK
      ?auto_355611 - BLOCK
      ?auto_355612 - BLOCK
      ?auto_355613 - BLOCK
      ?auto_355614 - BLOCK
      ?auto_355615 - BLOCK
      ?auto_355616 - BLOCK
      ?auto_355617 - BLOCK
      ?auto_355618 - BLOCK
      ?auto_355619 - BLOCK
      ?auto_355620 - BLOCK
      ?auto_355621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355621 ) ( ON-TABLE ?auto_355608 ) ( ON ?auto_355609 ?auto_355608 ) ( ON ?auto_355610 ?auto_355609 ) ( ON ?auto_355611 ?auto_355610 ) ( ON ?auto_355612 ?auto_355611 ) ( ON ?auto_355613 ?auto_355612 ) ( ON ?auto_355614 ?auto_355613 ) ( ON ?auto_355615 ?auto_355614 ) ( ON ?auto_355616 ?auto_355615 ) ( ON ?auto_355617 ?auto_355616 ) ( ON ?auto_355618 ?auto_355617 ) ( ON ?auto_355619 ?auto_355618 ) ( not ( = ?auto_355608 ?auto_355609 ) ) ( not ( = ?auto_355608 ?auto_355610 ) ) ( not ( = ?auto_355608 ?auto_355611 ) ) ( not ( = ?auto_355608 ?auto_355612 ) ) ( not ( = ?auto_355608 ?auto_355613 ) ) ( not ( = ?auto_355608 ?auto_355614 ) ) ( not ( = ?auto_355608 ?auto_355615 ) ) ( not ( = ?auto_355608 ?auto_355616 ) ) ( not ( = ?auto_355608 ?auto_355617 ) ) ( not ( = ?auto_355608 ?auto_355618 ) ) ( not ( = ?auto_355608 ?auto_355619 ) ) ( not ( = ?auto_355608 ?auto_355620 ) ) ( not ( = ?auto_355608 ?auto_355621 ) ) ( not ( = ?auto_355609 ?auto_355610 ) ) ( not ( = ?auto_355609 ?auto_355611 ) ) ( not ( = ?auto_355609 ?auto_355612 ) ) ( not ( = ?auto_355609 ?auto_355613 ) ) ( not ( = ?auto_355609 ?auto_355614 ) ) ( not ( = ?auto_355609 ?auto_355615 ) ) ( not ( = ?auto_355609 ?auto_355616 ) ) ( not ( = ?auto_355609 ?auto_355617 ) ) ( not ( = ?auto_355609 ?auto_355618 ) ) ( not ( = ?auto_355609 ?auto_355619 ) ) ( not ( = ?auto_355609 ?auto_355620 ) ) ( not ( = ?auto_355609 ?auto_355621 ) ) ( not ( = ?auto_355610 ?auto_355611 ) ) ( not ( = ?auto_355610 ?auto_355612 ) ) ( not ( = ?auto_355610 ?auto_355613 ) ) ( not ( = ?auto_355610 ?auto_355614 ) ) ( not ( = ?auto_355610 ?auto_355615 ) ) ( not ( = ?auto_355610 ?auto_355616 ) ) ( not ( = ?auto_355610 ?auto_355617 ) ) ( not ( = ?auto_355610 ?auto_355618 ) ) ( not ( = ?auto_355610 ?auto_355619 ) ) ( not ( = ?auto_355610 ?auto_355620 ) ) ( not ( = ?auto_355610 ?auto_355621 ) ) ( not ( = ?auto_355611 ?auto_355612 ) ) ( not ( = ?auto_355611 ?auto_355613 ) ) ( not ( = ?auto_355611 ?auto_355614 ) ) ( not ( = ?auto_355611 ?auto_355615 ) ) ( not ( = ?auto_355611 ?auto_355616 ) ) ( not ( = ?auto_355611 ?auto_355617 ) ) ( not ( = ?auto_355611 ?auto_355618 ) ) ( not ( = ?auto_355611 ?auto_355619 ) ) ( not ( = ?auto_355611 ?auto_355620 ) ) ( not ( = ?auto_355611 ?auto_355621 ) ) ( not ( = ?auto_355612 ?auto_355613 ) ) ( not ( = ?auto_355612 ?auto_355614 ) ) ( not ( = ?auto_355612 ?auto_355615 ) ) ( not ( = ?auto_355612 ?auto_355616 ) ) ( not ( = ?auto_355612 ?auto_355617 ) ) ( not ( = ?auto_355612 ?auto_355618 ) ) ( not ( = ?auto_355612 ?auto_355619 ) ) ( not ( = ?auto_355612 ?auto_355620 ) ) ( not ( = ?auto_355612 ?auto_355621 ) ) ( not ( = ?auto_355613 ?auto_355614 ) ) ( not ( = ?auto_355613 ?auto_355615 ) ) ( not ( = ?auto_355613 ?auto_355616 ) ) ( not ( = ?auto_355613 ?auto_355617 ) ) ( not ( = ?auto_355613 ?auto_355618 ) ) ( not ( = ?auto_355613 ?auto_355619 ) ) ( not ( = ?auto_355613 ?auto_355620 ) ) ( not ( = ?auto_355613 ?auto_355621 ) ) ( not ( = ?auto_355614 ?auto_355615 ) ) ( not ( = ?auto_355614 ?auto_355616 ) ) ( not ( = ?auto_355614 ?auto_355617 ) ) ( not ( = ?auto_355614 ?auto_355618 ) ) ( not ( = ?auto_355614 ?auto_355619 ) ) ( not ( = ?auto_355614 ?auto_355620 ) ) ( not ( = ?auto_355614 ?auto_355621 ) ) ( not ( = ?auto_355615 ?auto_355616 ) ) ( not ( = ?auto_355615 ?auto_355617 ) ) ( not ( = ?auto_355615 ?auto_355618 ) ) ( not ( = ?auto_355615 ?auto_355619 ) ) ( not ( = ?auto_355615 ?auto_355620 ) ) ( not ( = ?auto_355615 ?auto_355621 ) ) ( not ( = ?auto_355616 ?auto_355617 ) ) ( not ( = ?auto_355616 ?auto_355618 ) ) ( not ( = ?auto_355616 ?auto_355619 ) ) ( not ( = ?auto_355616 ?auto_355620 ) ) ( not ( = ?auto_355616 ?auto_355621 ) ) ( not ( = ?auto_355617 ?auto_355618 ) ) ( not ( = ?auto_355617 ?auto_355619 ) ) ( not ( = ?auto_355617 ?auto_355620 ) ) ( not ( = ?auto_355617 ?auto_355621 ) ) ( not ( = ?auto_355618 ?auto_355619 ) ) ( not ( = ?auto_355618 ?auto_355620 ) ) ( not ( = ?auto_355618 ?auto_355621 ) ) ( not ( = ?auto_355619 ?auto_355620 ) ) ( not ( = ?auto_355619 ?auto_355621 ) ) ( not ( = ?auto_355620 ?auto_355621 ) ) ( CLEAR ?auto_355619 ) ( ON ?auto_355620 ?auto_355621 ) ( CLEAR ?auto_355620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_355608 ?auto_355609 ?auto_355610 ?auto_355611 ?auto_355612 ?auto_355613 ?auto_355614 ?auto_355615 ?auto_355616 ?auto_355617 ?auto_355618 ?auto_355619 ?auto_355620 )
      ( MAKE-14PILE ?auto_355608 ?auto_355609 ?auto_355610 ?auto_355611 ?auto_355612 ?auto_355613 ?auto_355614 ?auto_355615 ?auto_355616 ?auto_355617 ?auto_355618 ?auto_355619 ?auto_355620 ?auto_355621 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355636 - BLOCK
      ?auto_355637 - BLOCK
      ?auto_355638 - BLOCK
      ?auto_355639 - BLOCK
      ?auto_355640 - BLOCK
      ?auto_355641 - BLOCK
      ?auto_355642 - BLOCK
      ?auto_355643 - BLOCK
      ?auto_355644 - BLOCK
      ?auto_355645 - BLOCK
      ?auto_355646 - BLOCK
      ?auto_355647 - BLOCK
      ?auto_355648 - BLOCK
      ?auto_355649 - BLOCK
    )
    :vars
    (
      ?auto_355650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355649 ?auto_355650 ) ( ON-TABLE ?auto_355636 ) ( ON ?auto_355637 ?auto_355636 ) ( ON ?auto_355638 ?auto_355637 ) ( ON ?auto_355639 ?auto_355638 ) ( ON ?auto_355640 ?auto_355639 ) ( ON ?auto_355641 ?auto_355640 ) ( ON ?auto_355642 ?auto_355641 ) ( ON ?auto_355643 ?auto_355642 ) ( ON ?auto_355644 ?auto_355643 ) ( ON ?auto_355645 ?auto_355644 ) ( ON ?auto_355646 ?auto_355645 ) ( not ( = ?auto_355636 ?auto_355637 ) ) ( not ( = ?auto_355636 ?auto_355638 ) ) ( not ( = ?auto_355636 ?auto_355639 ) ) ( not ( = ?auto_355636 ?auto_355640 ) ) ( not ( = ?auto_355636 ?auto_355641 ) ) ( not ( = ?auto_355636 ?auto_355642 ) ) ( not ( = ?auto_355636 ?auto_355643 ) ) ( not ( = ?auto_355636 ?auto_355644 ) ) ( not ( = ?auto_355636 ?auto_355645 ) ) ( not ( = ?auto_355636 ?auto_355646 ) ) ( not ( = ?auto_355636 ?auto_355647 ) ) ( not ( = ?auto_355636 ?auto_355648 ) ) ( not ( = ?auto_355636 ?auto_355649 ) ) ( not ( = ?auto_355636 ?auto_355650 ) ) ( not ( = ?auto_355637 ?auto_355638 ) ) ( not ( = ?auto_355637 ?auto_355639 ) ) ( not ( = ?auto_355637 ?auto_355640 ) ) ( not ( = ?auto_355637 ?auto_355641 ) ) ( not ( = ?auto_355637 ?auto_355642 ) ) ( not ( = ?auto_355637 ?auto_355643 ) ) ( not ( = ?auto_355637 ?auto_355644 ) ) ( not ( = ?auto_355637 ?auto_355645 ) ) ( not ( = ?auto_355637 ?auto_355646 ) ) ( not ( = ?auto_355637 ?auto_355647 ) ) ( not ( = ?auto_355637 ?auto_355648 ) ) ( not ( = ?auto_355637 ?auto_355649 ) ) ( not ( = ?auto_355637 ?auto_355650 ) ) ( not ( = ?auto_355638 ?auto_355639 ) ) ( not ( = ?auto_355638 ?auto_355640 ) ) ( not ( = ?auto_355638 ?auto_355641 ) ) ( not ( = ?auto_355638 ?auto_355642 ) ) ( not ( = ?auto_355638 ?auto_355643 ) ) ( not ( = ?auto_355638 ?auto_355644 ) ) ( not ( = ?auto_355638 ?auto_355645 ) ) ( not ( = ?auto_355638 ?auto_355646 ) ) ( not ( = ?auto_355638 ?auto_355647 ) ) ( not ( = ?auto_355638 ?auto_355648 ) ) ( not ( = ?auto_355638 ?auto_355649 ) ) ( not ( = ?auto_355638 ?auto_355650 ) ) ( not ( = ?auto_355639 ?auto_355640 ) ) ( not ( = ?auto_355639 ?auto_355641 ) ) ( not ( = ?auto_355639 ?auto_355642 ) ) ( not ( = ?auto_355639 ?auto_355643 ) ) ( not ( = ?auto_355639 ?auto_355644 ) ) ( not ( = ?auto_355639 ?auto_355645 ) ) ( not ( = ?auto_355639 ?auto_355646 ) ) ( not ( = ?auto_355639 ?auto_355647 ) ) ( not ( = ?auto_355639 ?auto_355648 ) ) ( not ( = ?auto_355639 ?auto_355649 ) ) ( not ( = ?auto_355639 ?auto_355650 ) ) ( not ( = ?auto_355640 ?auto_355641 ) ) ( not ( = ?auto_355640 ?auto_355642 ) ) ( not ( = ?auto_355640 ?auto_355643 ) ) ( not ( = ?auto_355640 ?auto_355644 ) ) ( not ( = ?auto_355640 ?auto_355645 ) ) ( not ( = ?auto_355640 ?auto_355646 ) ) ( not ( = ?auto_355640 ?auto_355647 ) ) ( not ( = ?auto_355640 ?auto_355648 ) ) ( not ( = ?auto_355640 ?auto_355649 ) ) ( not ( = ?auto_355640 ?auto_355650 ) ) ( not ( = ?auto_355641 ?auto_355642 ) ) ( not ( = ?auto_355641 ?auto_355643 ) ) ( not ( = ?auto_355641 ?auto_355644 ) ) ( not ( = ?auto_355641 ?auto_355645 ) ) ( not ( = ?auto_355641 ?auto_355646 ) ) ( not ( = ?auto_355641 ?auto_355647 ) ) ( not ( = ?auto_355641 ?auto_355648 ) ) ( not ( = ?auto_355641 ?auto_355649 ) ) ( not ( = ?auto_355641 ?auto_355650 ) ) ( not ( = ?auto_355642 ?auto_355643 ) ) ( not ( = ?auto_355642 ?auto_355644 ) ) ( not ( = ?auto_355642 ?auto_355645 ) ) ( not ( = ?auto_355642 ?auto_355646 ) ) ( not ( = ?auto_355642 ?auto_355647 ) ) ( not ( = ?auto_355642 ?auto_355648 ) ) ( not ( = ?auto_355642 ?auto_355649 ) ) ( not ( = ?auto_355642 ?auto_355650 ) ) ( not ( = ?auto_355643 ?auto_355644 ) ) ( not ( = ?auto_355643 ?auto_355645 ) ) ( not ( = ?auto_355643 ?auto_355646 ) ) ( not ( = ?auto_355643 ?auto_355647 ) ) ( not ( = ?auto_355643 ?auto_355648 ) ) ( not ( = ?auto_355643 ?auto_355649 ) ) ( not ( = ?auto_355643 ?auto_355650 ) ) ( not ( = ?auto_355644 ?auto_355645 ) ) ( not ( = ?auto_355644 ?auto_355646 ) ) ( not ( = ?auto_355644 ?auto_355647 ) ) ( not ( = ?auto_355644 ?auto_355648 ) ) ( not ( = ?auto_355644 ?auto_355649 ) ) ( not ( = ?auto_355644 ?auto_355650 ) ) ( not ( = ?auto_355645 ?auto_355646 ) ) ( not ( = ?auto_355645 ?auto_355647 ) ) ( not ( = ?auto_355645 ?auto_355648 ) ) ( not ( = ?auto_355645 ?auto_355649 ) ) ( not ( = ?auto_355645 ?auto_355650 ) ) ( not ( = ?auto_355646 ?auto_355647 ) ) ( not ( = ?auto_355646 ?auto_355648 ) ) ( not ( = ?auto_355646 ?auto_355649 ) ) ( not ( = ?auto_355646 ?auto_355650 ) ) ( not ( = ?auto_355647 ?auto_355648 ) ) ( not ( = ?auto_355647 ?auto_355649 ) ) ( not ( = ?auto_355647 ?auto_355650 ) ) ( not ( = ?auto_355648 ?auto_355649 ) ) ( not ( = ?auto_355648 ?auto_355650 ) ) ( not ( = ?auto_355649 ?auto_355650 ) ) ( ON ?auto_355648 ?auto_355649 ) ( CLEAR ?auto_355646 ) ( ON ?auto_355647 ?auto_355648 ) ( CLEAR ?auto_355647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_355636 ?auto_355637 ?auto_355638 ?auto_355639 ?auto_355640 ?auto_355641 ?auto_355642 ?auto_355643 ?auto_355644 ?auto_355645 ?auto_355646 ?auto_355647 )
      ( MAKE-14PILE ?auto_355636 ?auto_355637 ?auto_355638 ?auto_355639 ?auto_355640 ?auto_355641 ?auto_355642 ?auto_355643 ?auto_355644 ?auto_355645 ?auto_355646 ?auto_355647 ?auto_355648 ?auto_355649 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355665 - BLOCK
      ?auto_355666 - BLOCK
      ?auto_355667 - BLOCK
      ?auto_355668 - BLOCK
      ?auto_355669 - BLOCK
      ?auto_355670 - BLOCK
      ?auto_355671 - BLOCK
      ?auto_355672 - BLOCK
      ?auto_355673 - BLOCK
      ?auto_355674 - BLOCK
      ?auto_355675 - BLOCK
      ?auto_355676 - BLOCK
      ?auto_355677 - BLOCK
      ?auto_355678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355678 ) ( ON-TABLE ?auto_355665 ) ( ON ?auto_355666 ?auto_355665 ) ( ON ?auto_355667 ?auto_355666 ) ( ON ?auto_355668 ?auto_355667 ) ( ON ?auto_355669 ?auto_355668 ) ( ON ?auto_355670 ?auto_355669 ) ( ON ?auto_355671 ?auto_355670 ) ( ON ?auto_355672 ?auto_355671 ) ( ON ?auto_355673 ?auto_355672 ) ( ON ?auto_355674 ?auto_355673 ) ( ON ?auto_355675 ?auto_355674 ) ( not ( = ?auto_355665 ?auto_355666 ) ) ( not ( = ?auto_355665 ?auto_355667 ) ) ( not ( = ?auto_355665 ?auto_355668 ) ) ( not ( = ?auto_355665 ?auto_355669 ) ) ( not ( = ?auto_355665 ?auto_355670 ) ) ( not ( = ?auto_355665 ?auto_355671 ) ) ( not ( = ?auto_355665 ?auto_355672 ) ) ( not ( = ?auto_355665 ?auto_355673 ) ) ( not ( = ?auto_355665 ?auto_355674 ) ) ( not ( = ?auto_355665 ?auto_355675 ) ) ( not ( = ?auto_355665 ?auto_355676 ) ) ( not ( = ?auto_355665 ?auto_355677 ) ) ( not ( = ?auto_355665 ?auto_355678 ) ) ( not ( = ?auto_355666 ?auto_355667 ) ) ( not ( = ?auto_355666 ?auto_355668 ) ) ( not ( = ?auto_355666 ?auto_355669 ) ) ( not ( = ?auto_355666 ?auto_355670 ) ) ( not ( = ?auto_355666 ?auto_355671 ) ) ( not ( = ?auto_355666 ?auto_355672 ) ) ( not ( = ?auto_355666 ?auto_355673 ) ) ( not ( = ?auto_355666 ?auto_355674 ) ) ( not ( = ?auto_355666 ?auto_355675 ) ) ( not ( = ?auto_355666 ?auto_355676 ) ) ( not ( = ?auto_355666 ?auto_355677 ) ) ( not ( = ?auto_355666 ?auto_355678 ) ) ( not ( = ?auto_355667 ?auto_355668 ) ) ( not ( = ?auto_355667 ?auto_355669 ) ) ( not ( = ?auto_355667 ?auto_355670 ) ) ( not ( = ?auto_355667 ?auto_355671 ) ) ( not ( = ?auto_355667 ?auto_355672 ) ) ( not ( = ?auto_355667 ?auto_355673 ) ) ( not ( = ?auto_355667 ?auto_355674 ) ) ( not ( = ?auto_355667 ?auto_355675 ) ) ( not ( = ?auto_355667 ?auto_355676 ) ) ( not ( = ?auto_355667 ?auto_355677 ) ) ( not ( = ?auto_355667 ?auto_355678 ) ) ( not ( = ?auto_355668 ?auto_355669 ) ) ( not ( = ?auto_355668 ?auto_355670 ) ) ( not ( = ?auto_355668 ?auto_355671 ) ) ( not ( = ?auto_355668 ?auto_355672 ) ) ( not ( = ?auto_355668 ?auto_355673 ) ) ( not ( = ?auto_355668 ?auto_355674 ) ) ( not ( = ?auto_355668 ?auto_355675 ) ) ( not ( = ?auto_355668 ?auto_355676 ) ) ( not ( = ?auto_355668 ?auto_355677 ) ) ( not ( = ?auto_355668 ?auto_355678 ) ) ( not ( = ?auto_355669 ?auto_355670 ) ) ( not ( = ?auto_355669 ?auto_355671 ) ) ( not ( = ?auto_355669 ?auto_355672 ) ) ( not ( = ?auto_355669 ?auto_355673 ) ) ( not ( = ?auto_355669 ?auto_355674 ) ) ( not ( = ?auto_355669 ?auto_355675 ) ) ( not ( = ?auto_355669 ?auto_355676 ) ) ( not ( = ?auto_355669 ?auto_355677 ) ) ( not ( = ?auto_355669 ?auto_355678 ) ) ( not ( = ?auto_355670 ?auto_355671 ) ) ( not ( = ?auto_355670 ?auto_355672 ) ) ( not ( = ?auto_355670 ?auto_355673 ) ) ( not ( = ?auto_355670 ?auto_355674 ) ) ( not ( = ?auto_355670 ?auto_355675 ) ) ( not ( = ?auto_355670 ?auto_355676 ) ) ( not ( = ?auto_355670 ?auto_355677 ) ) ( not ( = ?auto_355670 ?auto_355678 ) ) ( not ( = ?auto_355671 ?auto_355672 ) ) ( not ( = ?auto_355671 ?auto_355673 ) ) ( not ( = ?auto_355671 ?auto_355674 ) ) ( not ( = ?auto_355671 ?auto_355675 ) ) ( not ( = ?auto_355671 ?auto_355676 ) ) ( not ( = ?auto_355671 ?auto_355677 ) ) ( not ( = ?auto_355671 ?auto_355678 ) ) ( not ( = ?auto_355672 ?auto_355673 ) ) ( not ( = ?auto_355672 ?auto_355674 ) ) ( not ( = ?auto_355672 ?auto_355675 ) ) ( not ( = ?auto_355672 ?auto_355676 ) ) ( not ( = ?auto_355672 ?auto_355677 ) ) ( not ( = ?auto_355672 ?auto_355678 ) ) ( not ( = ?auto_355673 ?auto_355674 ) ) ( not ( = ?auto_355673 ?auto_355675 ) ) ( not ( = ?auto_355673 ?auto_355676 ) ) ( not ( = ?auto_355673 ?auto_355677 ) ) ( not ( = ?auto_355673 ?auto_355678 ) ) ( not ( = ?auto_355674 ?auto_355675 ) ) ( not ( = ?auto_355674 ?auto_355676 ) ) ( not ( = ?auto_355674 ?auto_355677 ) ) ( not ( = ?auto_355674 ?auto_355678 ) ) ( not ( = ?auto_355675 ?auto_355676 ) ) ( not ( = ?auto_355675 ?auto_355677 ) ) ( not ( = ?auto_355675 ?auto_355678 ) ) ( not ( = ?auto_355676 ?auto_355677 ) ) ( not ( = ?auto_355676 ?auto_355678 ) ) ( not ( = ?auto_355677 ?auto_355678 ) ) ( ON ?auto_355677 ?auto_355678 ) ( CLEAR ?auto_355675 ) ( ON ?auto_355676 ?auto_355677 ) ( CLEAR ?auto_355676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_355665 ?auto_355666 ?auto_355667 ?auto_355668 ?auto_355669 ?auto_355670 ?auto_355671 ?auto_355672 ?auto_355673 ?auto_355674 ?auto_355675 ?auto_355676 )
      ( MAKE-14PILE ?auto_355665 ?auto_355666 ?auto_355667 ?auto_355668 ?auto_355669 ?auto_355670 ?auto_355671 ?auto_355672 ?auto_355673 ?auto_355674 ?auto_355675 ?auto_355676 ?auto_355677 ?auto_355678 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355693 - BLOCK
      ?auto_355694 - BLOCK
      ?auto_355695 - BLOCK
      ?auto_355696 - BLOCK
      ?auto_355697 - BLOCK
      ?auto_355698 - BLOCK
      ?auto_355699 - BLOCK
      ?auto_355700 - BLOCK
      ?auto_355701 - BLOCK
      ?auto_355702 - BLOCK
      ?auto_355703 - BLOCK
      ?auto_355704 - BLOCK
      ?auto_355705 - BLOCK
      ?auto_355706 - BLOCK
    )
    :vars
    (
      ?auto_355707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355706 ?auto_355707 ) ( ON-TABLE ?auto_355693 ) ( ON ?auto_355694 ?auto_355693 ) ( ON ?auto_355695 ?auto_355694 ) ( ON ?auto_355696 ?auto_355695 ) ( ON ?auto_355697 ?auto_355696 ) ( ON ?auto_355698 ?auto_355697 ) ( ON ?auto_355699 ?auto_355698 ) ( ON ?auto_355700 ?auto_355699 ) ( ON ?auto_355701 ?auto_355700 ) ( ON ?auto_355702 ?auto_355701 ) ( not ( = ?auto_355693 ?auto_355694 ) ) ( not ( = ?auto_355693 ?auto_355695 ) ) ( not ( = ?auto_355693 ?auto_355696 ) ) ( not ( = ?auto_355693 ?auto_355697 ) ) ( not ( = ?auto_355693 ?auto_355698 ) ) ( not ( = ?auto_355693 ?auto_355699 ) ) ( not ( = ?auto_355693 ?auto_355700 ) ) ( not ( = ?auto_355693 ?auto_355701 ) ) ( not ( = ?auto_355693 ?auto_355702 ) ) ( not ( = ?auto_355693 ?auto_355703 ) ) ( not ( = ?auto_355693 ?auto_355704 ) ) ( not ( = ?auto_355693 ?auto_355705 ) ) ( not ( = ?auto_355693 ?auto_355706 ) ) ( not ( = ?auto_355693 ?auto_355707 ) ) ( not ( = ?auto_355694 ?auto_355695 ) ) ( not ( = ?auto_355694 ?auto_355696 ) ) ( not ( = ?auto_355694 ?auto_355697 ) ) ( not ( = ?auto_355694 ?auto_355698 ) ) ( not ( = ?auto_355694 ?auto_355699 ) ) ( not ( = ?auto_355694 ?auto_355700 ) ) ( not ( = ?auto_355694 ?auto_355701 ) ) ( not ( = ?auto_355694 ?auto_355702 ) ) ( not ( = ?auto_355694 ?auto_355703 ) ) ( not ( = ?auto_355694 ?auto_355704 ) ) ( not ( = ?auto_355694 ?auto_355705 ) ) ( not ( = ?auto_355694 ?auto_355706 ) ) ( not ( = ?auto_355694 ?auto_355707 ) ) ( not ( = ?auto_355695 ?auto_355696 ) ) ( not ( = ?auto_355695 ?auto_355697 ) ) ( not ( = ?auto_355695 ?auto_355698 ) ) ( not ( = ?auto_355695 ?auto_355699 ) ) ( not ( = ?auto_355695 ?auto_355700 ) ) ( not ( = ?auto_355695 ?auto_355701 ) ) ( not ( = ?auto_355695 ?auto_355702 ) ) ( not ( = ?auto_355695 ?auto_355703 ) ) ( not ( = ?auto_355695 ?auto_355704 ) ) ( not ( = ?auto_355695 ?auto_355705 ) ) ( not ( = ?auto_355695 ?auto_355706 ) ) ( not ( = ?auto_355695 ?auto_355707 ) ) ( not ( = ?auto_355696 ?auto_355697 ) ) ( not ( = ?auto_355696 ?auto_355698 ) ) ( not ( = ?auto_355696 ?auto_355699 ) ) ( not ( = ?auto_355696 ?auto_355700 ) ) ( not ( = ?auto_355696 ?auto_355701 ) ) ( not ( = ?auto_355696 ?auto_355702 ) ) ( not ( = ?auto_355696 ?auto_355703 ) ) ( not ( = ?auto_355696 ?auto_355704 ) ) ( not ( = ?auto_355696 ?auto_355705 ) ) ( not ( = ?auto_355696 ?auto_355706 ) ) ( not ( = ?auto_355696 ?auto_355707 ) ) ( not ( = ?auto_355697 ?auto_355698 ) ) ( not ( = ?auto_355697 ?auto_355699 ) ) ( not ( = ?auto_355697 ?auto_355700 ) ) ( not ( = ?auto_355697 ?auto_355701 ) ) ( not ( = ?auto_355697 ?auto_355702 ) ) ( not ( = ?auto_355697 ?auto_355703 ) ) ( not ( = ?auto_355697 ?auto_355704 ) ) ( not ( = ?auto_355697 ?auto_355705 ) ) ( not ( = ?auto_355697 ?auto_355706 ) ) ( not ( = ?auto_355697 ?auto_355707 ) ) ( not ( = ?auto_355698 ?auto_355699 ) ) ( not ( = ?auto_355698 ?auto_355700 ) ) ( not ( = ?auto_355698 ?auto_355701 ) ) ( not ( = ?auto_355698 ?auto_355702 ) ) ( not ( = ?auto_355698 ?auto_355703 ) ) ( not ( = ?auto_355698 ?auto_355704 ) ) ( not ( = ?auto_355698 ?auto_355705 ) ) ( not ( = ?auto_355698 ?auto_355706 ) ) ( not ( = ?auto_355698 ?auto_355707 ) ) ( not ( = ?auto_355699 ?auto_355700 ) ) ( not ( = ?auto_355699 ?auto_355701 ) ) ( not ( = ?auto_355699 ?auto_355702 ) ) ( not ( = ?auto_355699 ?auto_355703 ) ) ( not ( = ?auto_355699 ?auto_355704 ) ) ( not ( = ?auto_355699 ?auto_355705 ) ) ( not ( = ?auto_355699 ?auto_355706 ) ) ( not ( = ?auto_355699 ?auto_355707 ) ) ( not ( = ?auto_355700 ?auto_355701 ) ) ( not ( = ?auto_355700 ?auto_355702 ) ) ( not ( = ?auto_355700 ?auto_355703 ) ) ( not ( = ?auto_355700 ?auto_355704 ) ) ( not ( = ?auto_355700 ?auto_355705 ) ) ( not ( = ?auto_355700 ?auto_355706 ) ) ( not ( = ?auto_355700 ?auto_355707 ) ) ( not ( = ?auto_355701 ?auto_355702 ) ) ( not ( = ?auto_355701 ?auto_355703 ) ) ( not ( = ?auto_355701 ?auto_355704 ) ) ( not ( = ?auto_355701 ?auto_355705 ) ) ( not ( = ?auto_355701 ?auto_355706 ) ) ( not ( = ?auto_355701 ?auto_355707 ) ) ( not ( = ?auto_355702 ?auto_355703 ) ) ( not ( = ?auto_355702 ?auto_355704 ) ) ( not ( = ?auto_355702 ?auto_355705 ) ) ( not ( = ?auto_355702 ?auto_355706 ) ) ( not ( = ?auto_355702 ?auto_355707 ) ) ( not ( = ?auto_355703 ?auto_355704 ) ) ( not ( = ?auto_355703 ?auto_355705 ) ) ( not ( = ?auto_355703 ?auto_355706 ) ) ( not ( = ?auto_355703 ?auto_355707 ) ) ( not ( = ?auto_355704 ?auto_355705 ) ) ( not ( = ?auto_355704 ?auto_355706 ) ) ( not ( = ?auto_355704 ?auto_355707 ) ) ( not ( = ?auto_355705 ?auto_355706 ) ) ( not ( = ?auto_355705 ?auto_355707 ) ) ( not ( = ?auto_355706 ?auto_355707 ) ) ( ON ?auto_355705 ?auto_355706 ) ( ON ?auto_355704 ?auto_355705 ) ( CLEAR ?auto_355702 ) ( ON ?auto_355703 ?auto_355704 ) ( CLEAR ?auto_355703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_355693 ?auto_355694 ?auto_355695 ?auto_355696 ?auto_355697 ?auto_355698 ?auto_355699 ?auto_355700 ?auto_355701 ?auto_355702 ?auto_355703 )
      ( MAKE-14PILE ?auto_355693 ?auto_355694 ?auto_355695 ?auto_355696 ?auto_355697 ?auto_355698 ?auto_355699 ?auto_355700 ?auto_355701 ?auto_355702 ?auto_355703 ?auto_355704 ?auto_355705 ?auto_355706 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355722 - BLOCK
      ?auto_355723 - BLOCK
      ?auto_355724 - BLOCK
      ?auto_355725 - BLOCK
      ?auto_355726 - BLOCK
      ?auto_355727 - BLOCK
      ?auto_355728 - BLOCK
      ?auto_355729 - BLOCK
      ?auto_355730 - BLOCK
      ?auto_355731 - BLOCK
      ?auto_355732 - BLOCK
      ?auto_355733 - BLOCK
      ?auto_355734 - BLOCK
      ?auto_355735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355735 ) ( ON-TABLE ?auto_355722 ) ( ON ?auto_355723 ?auto_355722 ) ( ON ?auto_355724 ?auto_355723 ) ( ON ?auto_355725 ?auto_355724 ) ( ON ?auto_355726 ?auto_355725 ) ( ON ?auto_355727 ?auto_355726 ) ( ON ?auto_355728 ?auto_355727 ) ( ON ?auto_355729 ?auto_355728 ) ( ON ?auto_355730 ?auto_355729 ) ( ON ?auto_355731 ?auto_355730 ) ( not ( = ?auto_355722 ?auto_355723 ) ) ( not ( = ?auto_355722 ?auto_355724 ) ) ( not ( = ?auto_355722 ?auto_355725 ) ) ( not ( = ?auto_355722 ?auto_355726 ) ) ( not ( = ?auto_355722 ?auto_355727 ) ) ( not ( = ?auto_355722 ?auto_355728 ) ) ( not ( = ?auto_355722 ?auto_355729 ) ) ( not ( = ?auto_355722 ?auto_355730 ) ) ( not ( = ?auto_355722 ?auto_355731 ) ) ( not ( = ?auto_355722 ?auto_355732 ) ) ( not ( = ?auto_355722 ?auto_355733 ) ) ( not ( = ?auto_355722 ?auto_355734 ) ) ( not ( = ?auto_355722 ?auto_355735 ) ) ( not ( = ?auto_355723 ?auto_355724 ) ) ( not ( = ?auto_355723 ?auto_355725 ) ) ( not ( = ?auto_355723 ?auto_355726 ) ) ( not ( = ?auto_355723 ?auto_355727 ) ) ( not ( = ?auto_355723 ?auto_355728 ) ) ( not ( = ?auto_355723 ?auto_355729 ) ) ( not ( = ?auto_355723 ?auto_355730 ) ) ( not ( = ?auto_355723 ?auto_355731 ) ) ( not ( = ?auto_355723 ?auto_355732 ) ) ( not ( = ?auto_355723 ?auto_355733 ) ) ( not ( = ?auto_355723 ?auto_355734 ) ) ( not ( = ?auto_355723 ?auto_355735 ) ) ( not ( = ?auto_355724 ?auto_355725 ) ) ( not ( = ?auto_355724 ?auto_355726 ) ) ( not ( = ?auto_355724 ?auto_355727 ) ) ( not ( = ?auto_355724 ?auto_355728 ) ) ( not ( = ?auto_355724 ?auto_355729 ) ) ( not ( = ?auto_355724 ?auto_355730 ) ) ( not ( = ?auto_355724 ?auto_355731 ) ) ( not ( = ?auto_355724 ?auto_355732 ) ) ( not ( = ?auto_355724 ?auto_355733 ) ) ( not ( = ?auto_355724 ?auto_355734 ) ) ( not ( = ?auto_355724 ?auto_355735 ) ) ( not ( = ?auto_355725 ?auto_355726 ) ) ( not ( = ?auto_355725 ?auto_355727 ) ) ( not ( = ?auto_355725 ?auto_355728 ) ) ( not ( = ?auto_355725 ?auto_355729 ) ) ( not ( = ?auto_355725 ?auto_355730 ) ) ( not ( = ?auto_355725 ?auto_355731 ) ) ( not ( = ?auto_355725 ?auto_355732 ) ) ( not ( = ?auto_355725 ?auto_355733 ) ) ( not ( = ?auto_355725 ?auto_355734 ) ) ( not ( = ?auto_355725 ?auto_355735 ) ) ( not ( = ?auto_355726 ?auto_355727 ) ) ( not ( = ?auto_355726 ?auto_355728 ) ) ( not ( = ?auto_355726 ?auto_355729 ) ) ( not ( = ?auto_355726 ?auto_355730 ) ) ( not ( = ?auto_355726 ?auto_355731 ) ) ( not ( = ?auto_355726 ?auto_355732 ) ) ( not ( = ?auto_355726 ?auto_355733 ) ) ( not ( = ?auto_355726 ?auto_355734 ) ) ( not ( = ?auto_355726 ?auto_355735 ) ) ( not ( = ?auto_355727 ?auto_355728 ) ) ( not ( = ?auto_355727 ?auto_355729 ) ) ( not ( = ?auto_355727 ?auto_355730 ) ) ( not ( = ?auto_355727 ?auto_355731 ) ) ( not ( = ?auto_355727 ?auto_355732 ) ) ( not ( = ?auto_355727 ?auto_355733 ) ) ( not ( = ?auto_355727 ?auto_355734 ) ) ( not ( = ?auto_355727 ?auto_355735 ) ) ( not ( = ?auto_355728 ?auto_355729 ) ) ( not ( = ?auto_355728 ?auto_355730 ) ) ( not ( = ?auto_355728 ?auto_355731 ) ) ( not ( = ?auto_355728 ?auto_355732 ) ) ( not ( = ?auto_355728 ?auto_355733 ) ) ( not ( = ?auto_355728 ?auto_355734 ) ) ( not ( = ?auto_355728 ?auto_355735 ) ) ( not ( = ?auto_355729 ?auto_355730 ) ) ( not ( = ?auto_355729 ?auto_355731 ) ) ( not ( = ?auto_355729 ?auto_355732 ) ) ( not ( = ?auto_355729 ?auto_355733 ) ) ( not ( = ?auto_355729 ?auto_355734 ) ) ( not ( = ?auto_355729 ?auto_355735 ) ) ( not ( = ?auto_355730 ?auto_355731 ) ) ( not ( = ?auto_355730 ?auto_355732 ) ) ( not ( = ?auto_355730 ?auto_355733 ) ) ( not ( = ?auto_355730 ?auto_355734 ) ) ( not ( = ?auto_355730 ?auto_355735 ) ) ( not ( = ?auto_355731 ?auto_355732 ) ) ( not ( = ?auto_355731 ?auto_355733 ) ) ( not ( = ?auto_355731 ?auto_355734 ) ) ( not ( = ?auto_355731 ?auto_355735 ) ) ( not ( = ?auto_355732 ?auto_355733 ) ) ( not ( = ?auto_355732 ?auto_355734 ) ) ( not ( = ?auto_355732 ?auto_355735 ) ) ( not ( = ?auto_355733 ?auto_355734 ) ) ( not ( = ?auto_355733 ?auto_355735 ) ) ( not ( = ?auto_355734 ?auto_355735 ) ) ( ON ?auto_355734 ?auto_355735 ) ( ON ?auto_355733 ?auto_355734 ) ( CLEAR ?auto_355731 ) ( ON ?auto_355732 ?auto_355733 ) ( CLEAR ?auto_355732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_355722 ?auto_355723 ?auto_355724 ?auto_355725 ?auto_355726 ?auto_355727 ?auto_355728 ?auto_355729 ?auto_355730 ?auto_355731 ?auto_355732 )
      ( MAKE-14PILE ?auto_355722 ?auto_355723 ?auto_355724 ?auto_355725 ?auto_355726 ?auto_355727 ?auto_355728 ?auto_355729 ?auto_355730 ?auto_355731 ?auto_355732 ?auto_355733 ?auto_355734 ?auto_355735 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355750 - BLOCK
      ?auto_355751 - BLOCK
      ?auto_355752 - BLOCK
      ?auto_355753 - BLOCK
      ?auto_355754 - BLOCK
      ?auto_355755 - BLOCK
      ?auto_355756 - BLOCK
      ?auto_355757 - BLOCK
      ?auto_355758 - BLOCK
      ?auto_355759 - BLOCK
      ?auto_355760 - BLOCK
      ?auto_355761 - BLOCK
      ?auto_355762 - BLOCK
      ?auto_355763 - BLOCK
    )
    :vars
    (
      ?auto_355764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355763 ?auto_355764 ) ( ON-TABLE ?auto_355750 ) ( ON ?auto_355751 ?auto_355750 ) ( ON ?auto_355752 ?auto_355751 ) ( ON ?auto_355753 ?auto_355752 ) ( ON ?auto_355754 ?auto_355753 ) ( ON ?auto_355755 ?auto_355754 ) ( ON ?auto_355756 ?auto_355755 ) ( ON ?auto_355757 ?auto_355756 ) ( ON ?auto_355758 ?auto_355757 ) ( not ( = ?auto_355750 ?auto_355751 ) ) ( not ( = ?auto_355750 ?auto_355752 ) ) ( not ( = ?auto_355750 ?auto_355753 ) ) ( not ( = ?auto_355750 ?auto_355754 ) ) ( not ( = ?auto_355750 ?auto_355755 ) ) ( not ( = ?auto_355750 ?auto_355756 ) ) ( not ( = ?auto_355750 ?auto_355757 ) ) ( not ( = ?auto_355750 ?auto_355758 ) ) ( not ( = ?auto_355750 ?auto_355759 ) ) ( not ( = ?auto_355750 ?auto_355760 ) ) ( not ( = ?auto_355750 ?auto_355761 ) ) ( not ( = ?auto_355750 ?auto_355762 ) ) ( not ( = ?auto_355750 ?auto_355763 ) ) ( not ( = ?auto_355750 ?auto_355764 ) ) ( not ( = ?auto_355751 ?auto_355752 ) ) ( not ( = ?auto_355751 ?auto_355753 ) ) ( not ( = ?auto_355751 ?auto_355754 ) ) ( not ( = ?auto_355751 ?auto_355755 ) ) ( not ( = ?auto_355751 ?auto_355756 ) ) ( not ( = ?auto_355751 ?auto_355757 ) ) ( not ( = ?auto_355751 ?auto_355758 ) ) ( not ( = ?auto_355751 ?auto_355759 ) ) ( not ( = ?auto_355751 ?auto_355760 ) ) ( not ( = ?auto_355751 ?auto_355761 ) ) ( not ( = ?auto_355751 ?auto_355762 ) ) ( not ( = ?auto_355751 ?auto_355763 ) ) ( not ( = ?auto_355751 ?auto_355764 ) ) ( not ( = ?auto_355752 ?auto_355753 ) ) ( not ( = ?auto_355752 ?auto_355754 ) ) ( not ( = ?auto_355752 ?auto_355755 ) ) ( not ( = ?auto_355752 ?auto_355756 ) ) ( not ( = ?auto_355752 ?auto_355757 ) ) ( not ( = ?auto_355752 ?auto_355758 ) ) ( not ( = ?auto_355752 ?auto_355759 ) ) ( not ( = ?auto_355752 ?auto_355760 ) ) ( not ( = ?auto_355752 ?auto_355761 ) ) ( not ( = ?auto_355752 ?auto_355762 ) ) ( not ( = ?auto_355752 ?auto_355763 ) ) ( not ( = ?auto_355752 ?auto_355764 ) ) ( not ( = ?auto_355753 ?auto_355754 ) ) ( not ( = ?auto_355753 ?auto_355755 ) ) ( not ( = ?auto_355753 ?auto_355756 ) ) ( not ( = ?auto_355753 ?auto_355757 ) ) ( not ( = ?auto_355753 ?auto_355758 ) ) ( not ( = ?auto_355753 ?auto_355759 ) ) ( not ( = ?auto_355753 ?auto_355760 ) ) ( not ( = ?auto_355753 ?auto_355761 ) ) ( not ( = ?auto_355753 ?auto_355762 ) ) ( not ( = ?auto_355753 ?auto_355763 ) ) ( not ( = ?auto_355753 ?auto_355764 ) ) ( not ( = ?auto_355754 ?auto_355755 ) ) ( not ( = ?auto_355754 ?auto_355756 ) ) ( not ( = ?auto_355754 ?auto_355757 ) ) ( not ( = ?auto_355754 ?auto_355758 ) ) ( not ( = ?auto_355754 ?auto_355759 ) ) ( not ( = ?auto_355754 ?auto_355760 ) ) ( not ( = ?auto_355754 ?auto_355761 ) ) ( not ( = ?auto_355754 ?auto_355762 ) ) ( not ( = ?auto_355754 ?auto_355763 ) ) ( not ( = ?auto_355754 ?auto_355764 ) ) ( not ( = ?auto_355755 ?auto_355756 ) ) ( not ( = ?auto_355755 ?auto_355757 ) ) ( not ( = ?auto_355755 ?auto_355758 ) ) ( not ( = ?auto_355755 ?auto_355759 ) ) ( not ( = ?auto_355755 ?auto_355760 ) ) ( not ( = ?auto_355755 ?auto_355761 ) ) ( not ( = ?auto_355755 ?auto_355762 ) ) ( not ( = ?auto_355755 ?auto_355763 ) ) ( not ( = ?auto_355755 ?auto_355764 ) ) ( not ( = ?auto_355756 ?auto_355757 ) ) ( not ( = ?auto_355756 ?auto_355758 ) ) ( not ( = ?auto_355756 ?auto_355759 ) ) ( not ( = ?auto_355756 ?auto_355760 ) ) ( not ( = ?auto_355756 ?auto_355761 ) ) ( not ( = ?auto_355756 ?auto_355762 ) ) ( not ( = ?auto_355756 ?auto_355763 ) ) ( not ( = ?auto_355756 ?auto_355764 ) ) ( not ( = ?auto_355757 ?auto_355758 ) ) ( not ( = ?auto_355757 ?auto_355759 ) ) ( not ( = ?auto_355757 ?auto_355760 ) ) ( not ( = ?auto_355757 ?auto_355761 ) ) ( not ( = ?auto_355757 ?auto_355762 ) ) ( not ( = ?auto_355757 ?auto_355763 ) ) ( not ( = ?auto_355757 ?auto_355764 ) ) ( not ( = ?auto_355758 ?auto_355759 ) ) ( not ( = ?auto_355758 ?auto_355760 ) ) ( not ( = ?auto_355758 ?auto_355761 ) ) ( not ( = ?auto_355758 ?auto_355762 ) ) ( not ( = ?auto_355758 ?auto_355763 ) ) ( not ( = ?auto_355758 ?auto_355764 ) ) ( not ( = ?auto_355759 ?auto_355760 ) ) ( not ( = ?auto_355759 ?auto_355761 ) ) ( not ( = ?auto_355759 ?auto_355762 ) ) ( not ( = ?auto_355759 ?auto_355763 ) ) ( not ( = ?auto_355759 ?auto_355764 ) ) ( not ( = ?auto_355760 ?auto_355761 ) ) ( not ( = ?auto_355760 ?auto_355762 ) ) ( not ( = ?auto_355760 ?auto_355763 ) ) ( not ( = ?auto_355760 ?auto_355764 ) ) ( not ( = ?auto_355761 ?auto_355762 ) ) ( not ( = ?auto_355761 ?auto_355763 ) ) ( not ( = ?auto_355761 ?auto_355764 ) ) ( not ( = ?auto_355762 ?auto_355763 ) ) ( not ( = ?auto_355762 ?auto_355764 ) ) ( not ( = ?auto_355763 ?auto_355764 ) ) ( ON ?auto_355762 ?auto_355763 ) ( ON ?auto_355761 ?auto_355762 ) ( ON ?auto_355760 ?auto_355761 ) ( CLEAR ?auto_355758 ) ( ON ?auto_355759 ?auto_355760 ) ( CLEAR ?auto_355759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_355750 ?auto_355751 ?auto_355752 ?auto_355753 ?auto_355754 ?auto_355755 ?auto_355756 ?auto_355757 ?auto_355758 ?auto_355759 )
      ( MAKE-14PILE ?auto_355750 ?auto_355751 ?auto_355752 ?auto_355753 ?auto_355754 ?auto_355755 ?auto_355756 ?auto_355757 ?auto_355758 ?auto_355759 ?auto_355760 ?auto_355761 ?auto_355762 ?auto_355763 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355779 - BLOCK
      ?auto_355780 - BLOCK
      ?auto_355781 - BLOCK
      ?auto_355782 - BLOCK
      ?auto_355783 - BLOCK
      ?auto_355784 - BLOCK
      ?auto_355785 - BLOCK
      ?auto_355786 - BLOCK
      ?auto_355787 - BLOCK
      ?auto_355788 - BLOCK
      ?auto_355789 - BLOCK
      ?auto_355790 - BLOCK
      ?auto_355791 - BLOCK
      ?auto_355792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355792 ) ( ON-TABLE ?auto_355779 ) ( ON ?auto_355780 ?auto_355779 ) ( ON ?auto_355781 ?auto_355780 ) ( ON ?auto_355782 ?auto_355781 ) ( ON ?auto_355783 ?auto_355782 ) ( ON ?auto_355784 ?auto_355783 ) ( ON ?auto_355785 ?auto_355784 ) ( ON ?auto_355786 ?auto_355785 ) ( ON ?auto_355787 ?auto_355786 ) ( not ( = ?auto_355779 ?auto_355780 ) ) ( not ( = ?auto_355779 ?auto_355781 ) ) ( not ( = ?auto_355779 ?auto_355782 ) ) ( not ( = ?auto_355779 ?auto_355783 ) ) ( not ( = ?auto_355779 ?auto_355784 ) ) ( not ( = ?auto_355779 ?auto_355785 ) ) ( not ( = ?auto_355779 ?auto_355786 ) ) ( not ( = ?auto_355779 ?auto_355787 ) ) ( not ( = ?auto_355779 ?auto_355788 ) ) ( not ( = ?auto_355779 ?auto_355789 ) ) ( not ( = ?auto_355779 ?auto_355790 ) ) ( not ( = ?auto_355779 ?auto_355791 ) ) ( not ( = ?auto_355779 ?auto_355792 ) ) ( not ( = ?auto_355780 ?auto_355781 ) ) ( not ( = ?auto_355780 ?auto_355782 ) ) ( not ( = ?auto_355780 ?auto_355783 ) ) ( not ( = ?auto_355780 ?auto_355784 ) ) ( not ( = ?auto_355780 ?auto_355785 ) ) ( not ( = ?auto_355780 ?auto_355786 ) ) ( not ( = ?auto_355780 ?auto_355787 ) ) ( not ( = ?auto_355780 ?auto_355788 ) ) ( not ( = ?auto_355780 ?auto_355789 ) ) ( not ( = ?auto_355780 ?auto_355790 ) ) ( not ( = ?auto_355780 ?auto_355791 ) ) ( not ( = ?auto_355780 ?auto_355792 ) ) ( not ( = ?auto_355781 ?auto_355782 ) ) ( not ( = ?auto_355781 ?auto_355783 ) ) ( not ( = ?auto_355781 ?auto_355784 ) ) ( not ( = ?auto_355781 ?auto_355785 ) ) ( not ( = ?auto_355781 ?auto_355786 ) ) ( not ( = ?auto_355781 ?auto_355787 ) ) ( not ( = ?auto_355781 ?auto_355788 ) ) ( not ( = ?auto_355781 ?auto_355789 ) ) ( not ( = ?auto_355781 ?auto_355790 ) ) ( not ( = ?auto_355781 ?auto_355791 ) ) ( not ( = ?auto_355781 ?auto_355792 ) ) ( not ( = ?auto_355782 ?auto_355783 ) ) ( not ( = ?auto_355782 ?auto_355784 ) ) ( not ( = ?auto_355782 ?auto_355785 ) ) ( not ( = ?auto_355782 ?auto_355786 ) ) ( not ( = ?auto_355782 ?auto_355787 ) ) ( not ( = ?auto_355782 ?auto_355788 ) ) ( not ( = ?auto_355782 ?auto_355789 ) ) ( not ( = ?auto_355782 ?auto_355790 ) ) ( not ( = ?auto_355782 ?auto_355791 ) ) ( not ( = ?auto_355782 ?auto_355792 ) ) ( not ( = ?auto_355783 ?auto_355784 ) ) ( not ( = ?auto_355783 ?auto_355785 ) ) ( not ( = ?auto_355783 ?auto_355786 ) ) ( not ( = ?auto_355783 ?auto_355787 ) ) ( not ( = ?auto_355783 ?auto_355788 ) ) ( not ( = ?auto_355783 ?auto_355789 ) ) ( not ( = ?auto_355783 ?auto_355790 ) ) ( not ( = ?auto_355783 ?auto_355791 ) ) ( not ( = ?auto_355783 ?auto_355792 ) ) ( not ( = ?auto_355784 ?auto_355785 ) ) ( not ( = ?auto_355784 ?auto_355786 ) ) ( not ( = ?auto_355784 ?auto_355787 ) ) ( not ( = ?auto_355784 ?auto_355788 ) ) ( not ( = ?auto_355784 ?auto_355789 ) ) ( not ( = ?auto_355784 ?auto_355790 ) ) ( not ( = ?auto_355784 ?auto_355791 ) ) ( not ( = ?auto_355784 ?auto_355792 ) ) ( not ( = ?auto_355785 ?auto_355786 ) ) ( not ( = ?auto_355785 ?auto_355787 ) ) ( not ( = ?auto_355785 ?auto_355788 ) ) ( not ( = ?auto_355785 ?auto_355789 ) ) ( not ( = ?auto_355785 ?auto_355790 ) ) ( not ( = ?auto_355785 ?auto_355791 ) ) ( not ( = ?auto_355785 ?auto_355792 ) ) ( not ( = ?auto_355786 ?auto_355787 ) ) ( not ( = ?auto_355786 ?auto_355788 ) ) ( not ( = ?auto_355786 ?auto_355789 ) ) ( not ( = ?auto_355786 ?auto_355790 ) ) ( not ( = ?auto_355786 ?auto_355791 ) ) ( not ( = ?auto_355786 ?auto_355792 ) ) ( not ( = ?auto_355787 ?auto_355788 ) ) ( not ( = ?auto_355787 ?auto_355789 ) ) ( not ( = ?auto_355787 ?auto_355790 ) ) ( not ( = ?auto_355787 ?auto_355791 ) ) ( not ( = ?auto_355787 ?auto_355792 ) ) ( not ( = ?auto_355788 ?auto_355789 ) ) ( not ( = ?auto_355788 ?auto_355790 ) ) ( not ( = ?auto_355788 ?auto_355791 ) ) ( not ( = ?auto_355788 ?auto_355792 ) ) ( not ( = ?auto_355789 ?auto_355790 ) ) ( not ( = ?auto_355789 ?auto_355791 ) ) ( not ( = ?auto_355789 ?auto_355792 ) ) ( not ( = ?auto_355790 ?auto_355791 ) ) ( not ( = ?auto_355790 ?auto_355792 ) ) ( not ( = ?auto_355791 ?auto_355792 ) ) ( ON ?auto_355791 ?auto_355792 ) ( ON ?auto_355790 ?auto_355791 ) ( ON ?auto_355789 ?auto_355790 ) ( CLEAR ?auto_355787 ) ( ON ?auto_355788 ?auto_355789 ) ( CLEAR ?auto_355788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_355779 ?auto_355780 ?auto_355781 ?auto_355782 ?auto_355783 ?auto_355784 ?auto_355785 ?auto_355786 ?auto_355787 ?auto_355788 )
      ( MAKE-14PILE ?auto_355779 ?auto_355780 ?auto_355781 ?auto_355782 ?auto_355783 ?auto_355784 ?auto_355785 ?auto_355786 ?auto_355787 ?auto_355788 ?auto_355789 ?auto_355790 ?auto_355791 ?auto_355792 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355807 - BLOCK
      ?auto_355808 - BLOCK
      ?auto_355809 - BLOCK
      ?auto_355810 - BLOCK
      ?auto_355811 - BLOCK
      ?auto_355812 - BLOCK
      ?auto_355813 - BLOCK
      ?auto_355814 - BLOCK
      ?auto_355815 - BLOCK
      ?auto_355816 - BLOCK
      ?auto_355817 - BLOCK
      ?auto_355818 - BLOCK
      ?auto_355819 - BLOCK
      ?auto_355820 - BLOCK
    )
    :vars
    (
      ?auto_355821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355820 ?auto_355821 ) ( ON-TABLE ?auto_355807 ) ( ON ?auto_355808 ?auto_355807 ) ( ON ?auto_355809 ?auto_355808 ) ( ON ?auto_355810 ?auto_355809 ) ( ON ?auto_355811 ?auto_355810 ) ( ON ?auto_355812 ?auto_355811 ) ( ON ?auto_355813 ?auto_355812 ) ( ON ?auto_355814 ?auto_355813 ) ( not ( = ?auto_355807 ?auto_355808 ) ) ( not ( = ?auto_355807 ?auto_355809 ) ) ( not ( = ?auto_355807 ?auto_355810 ) ) ( not ( = ?auto_355807 ?auto_355811 ) ) ( not ( = ?auto_355807 ?auto_355812 ) ) ( not ( = ?auto_355807 ?auto_355813 ) ) ( not ( = ?auto_355807 ?auto_355814 ) ) ( not ( = ?auto_355807 ?auto_355815 ) ) ( not ( = ?auto_355807 ?auto_355816 ) ) ( not ( = ?auto_355807 ?auto_355817 ) ) ( not ( = ?auto_355807 ?auto_355818 ) ) ( not ( = ?auto_355807 ?auto_355819 ) ) ( not ( = ?auto_355807 ?auto_355820 ) ) ( not ( = ?auto_355807 ?auto_355821 ) ) ( not ( = ?auto_355808 ?auto_355809 ) ) ( not ( = ?auto_355808 ?auto_355810 ) ) ( not ( = ?auto_355808 ?auto_355811 ) ) ( not ( = ?auto_355808 ?auto_355812 ) ) ( not ( = ?auto_355808 ?auto_355813 ) ) ( not ( = ?auto_355808 ?auto_355814 ) ) ( not ( = ?auto_355808 ?auto_355815 ) ) ( not ( = ?auto_355808 ?auto_355816 ) ) ( not ( = ?auto_355808 ?auto_355817 ) ) ( not ( = ?auto_355808 ?auto_355818 ) ) ( not ( = ?auto_355808 ?auto_355819 ) ) ( not ( = ?auto_355808 ?auto_355820 ) ) ( not ( = ?auto_355808 ?auto_355821 ) ) ( not ( = ?auto_355809 ?auto_355810 ) ) ( not ( = ?auto_355809 ?auto_355811 ) ) ( not ( = ?auto_355809 ?auto_355812 ) ) ( not ( = ?auto_355809 ?auto_355813 ) ) ( not ( = ?auto_355809 ?auto_355814 ) ) ( not ( = ?auto_355809 ?auto_355815 ) ) ( not ( = ?auto_355809 ?auto_355816 ) ) ( not ( = ?auto_355809 ?auto_355817 ) ) ( not ( = ?auto_355809 ?auto_355818 ) ) ( not ( = ?auto_355809 ?auto_355819 ) ) ( not ( = ?auto_355809 ?auto_355820 ) ) ( not ( = ?auto_355809 ?auto_355821 ) ) ( not ( = ?auto_355810 ?auto_355811 ) ) ( not ( = ?auto_355810 ?auto_355812 ) ) ( not ( = ?auto_355810 ?auto_355813 ) ) ( not ( = ?auto_355810 ?auto_355814 ) ) ( not ( = ?auto_355810 ?auto_355815 ) ) ( not ( = ?auto_355810 ?auto_355816 ) ) ( not ( = ?auto_355810 ?auto_355817 ) ) ( not ( = ?auto_355810 ?auto_355818 ) ) ( not ( = ?auto_355810 ?auto_355819 ) ) ( not ( = ?auto_355810 ?auto_355820 ) ) ( not ( = ?auto_355810 ?auto_355821 ) ) ( not ( = ?auto_355811 ?auto_355812 ) ) ( not ( = ?auto_355811 ?auto_355813 ) ) ( not ( = ?auto_355811 ?auto_355814 ) ) ( not ( = ?auto_355811 ?auto_355815 ) ) ( not ( = ?auto_355811 ?auto_355816 ) ) ( not ( = ?auto_355811 ?auto_355817 ) ) ( not ( = ?auto_355811 ?auto_355818 ) ) ( not ( = ?auto_355811 ?auto_355819 ) ) ( not ( = ?auto_355811 ?auto_355820 ) ) ( not ( = ?auto_355811 ?auto_355821 ) ) ( not ( = ?auto_355812 ?auto_355813 ) ) ( not ( = ?auto_355812 ?auto_355814 ) ) ( not ( = ?auto_355812 ?auto_355815 ) ) ( not ( = ?auto_355812 ?auto_355816 ) ) ( not ( = ?auto_355812 ?auto_355817 ) ) ( not ( = ?auto_355812 ?auto_355818 ) ) ( not ( = ?auto_355812 ?auto_355819 ) ) ( not ( = ?auto_355812 ?auto_355820 ) ) ( not ( = ?auto_355812 ?auto_355821 ) ) ( not ( = ?auto_355813 ?auto_355814 ) ) ( not ( = ?auto_355813 ?auto_355815 ) ) ( not ( = ?auto_355813 ?auto_355816 ) ) ( not ( = ?auto_355813 ?auto_355817 ) ) ( not ( = ?auto_355813 ?auto_355818 ) ) ( not ( = ?auto_355813 ?auto_355819 ) ) ( not ( = ?auto_355813 ?auto_355820 ) ) ( not ( = ?auto_355813 ?auto_355821 ) ) ( not ( = ?auto_355814 ?auto_355815 ) ) ( not ( = ?auto_355814 ?auto_355816 ) ) ( not ( = ?auto_355814 ?auto_355817 ) ) ( not ( = ?auto_355814 ?auto_355818 ) ) ( not ( = ?auto_355814 ?auto_355819 ) ) ( not ( = ?auto_355814 ?auto_355820 ) ) ( not ( = ?auto_355814 ?auto_355821 ) ) ( not ( = ?auto_355815 ?auto_355816 ) ) ( not ( = ?auto_355815 ?auto_355817 ) ) ( not ( = ?auto_355815 ?auto_355818 ) ) ( not ( = ?auto_355815 ?auto_355819 ) ) ( not ( = ?auto_355815 ?auto_355820 ) ) ( not ( = ?auto_355815 ?auto_355821 ) ) ( not ( = ?auto_355816 ?auto_355817 ) ) ( not ( = ?auto_355816 ?auto_355818 ) ) ( not ( = ?auto_355816 ?auto_355819 ) ) ( not ( = ?auto_355816 ?auto_355820 ) ) ( not ( = ?auto_355816 ?auto_355821 ) ) ( not ( = ?auto_355817 ?auto_355818 ) ) ( not ( = ?auto_355817 ?auto_355819 ) ) ( not ( = ?auto_355817 ?auto_355820 ) ) ( not ( = ?auto_355817 ?auto_355821 ) ) ( not ( = ?auto_355818 ?auto_355819 ) ) ( not ( = ?auto_355818 ?auto_355820 ) ) ( not ( = ?auto_355818 ?auto_355821 ) ) ( not ( = ?auto_355819 ?auto_355820 ) ) ( not ( = ?auto_355819 ?auto_355821 ) ) ( not ( = ?auto_355820 ?auto_355821 ) ) ( ON ?auto_355819 ?auto_355820 ) ( ON ?auto_355818 ?auto_355819 ) ( ON ?auto_355817 ?auto_355818 ) ( ON ?auto_355816 ?auto_355817 ) ( CLEAR ?auto_355814 ) ( ON ?auto_355815 ?auto_355816 ) ( CLEAR ?auto_355815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_355807 ?auto_355808 ?auto_355809 ?auto_355810 ?auto_355811 ?auto_355812 ?auto_355813 ?auto_355814 ?auto_355815 )
      ( MAKE-14PILE ?auto_355807 ?auto_355808 ?auto_355809 ?auto_355810 ?auto_355811 ?auto_355812 ?auto_355813 ?auto_355814 ?auto_355815 ?auto_355816 ?auto_355817 ?auto_355818 ?auto_355819 ?auto_355820 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355836 - BLOCK
      ?auto_355837 - BLOCK
      ?auto_355838 - BLOCK
      ?auto_355839 - BLOCK
      ?auto_355840 - BLOCK
      ?auto_355841 - BLOCK
      ?auto_355842 - BLOCK
      ?auto_355843 - BLOCK
      ?auto_355844 - BLOCK
      ?auto_355845 - BLOCK
      ?auto_355846 - BLOCK
      ?auto_355847 - BLOCK
      ?auto_355848 - BLOCK
      ?auto_355849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355849 ) ( ON-TABLE ?auto_355836 ) ( ON ?auto_355837 ?auto_355836 ) ( ON ?auto_355838 ?auto_355837 ) ( ON ?auto_355839 ?auto_355838 ) ( ON ?auto_355840 ?auto_355839 ) ( ON ?auto_355841 ?auto_355840 ) ( ON ?auto_355842 ?auto_355841 ) ( ON ?auto_355843 ?auto_355842 ) ( not ( = ?auto_355836 ?auto_355837 ) ) ( not ( = ?auto_355836 ?auto_355838 ) ) ( not ( = ?auto_355836 ?auto_355839 ) ) ( not ( = ?auto_355836 ?auto_355840 ) ) ( not ( = ?auto_355836 ?auto_355841 ) ) ( not ( = ?auto_355836 ?auto_355842 ) ) ( not ( = ?auto_355836 ?auto_355843 ) ) ( not ( = ?auto_355836 ?auto_355844 ) ) ( not ( = ?auto_355836 ?auto_355845 ) ) ( not ( = ?auto_355836 ?auto_355846 ) ) ( not ( = ?auto_355836 ?auto_355847 ) ) ( not ( = ?auto_355836 ?auto_355848 ) ) ( not ( = ?auto_355836 ?auto_355849 ) ) ( not ( = ?auto_355837 ?auto_355838 ) ) ( not ( = ?auto_355837 ?auto_355839 ) ) ( not ( = ?auto_355837 ?auto_355840 ) ) ( not ( = ?auto_355837 ?auto_355841 ) ) ( not ( = ?auto_355837 ?auto_355842 ) ) ( not ( = ?auto_355837 ?auto_355843 ) ) ( not ( = ?auto_355837 ?auto_355844 ) ) ( not ( = ?auto_355837 ?auto_355845 ) ) ( not ( = ?auto_355837 ?auto_355846 ) ) ( not ( = ?auto_355837 ?auto_355847 ) ) ( not ( = ?auto_355837 ?auto_355848 ) ) ( not ( = ?auto_355837 ?auto_355849 ) ) ( not ( = ?auto_355838 ?auto_355839 ) ) ( not ( = ?auto_355838 ?auto_355840 ) ) ( not ( = ?auto_355838 ?auto_355841 ) ) ( not ( = ?auto_355838 ?auto_355842 ) ) ( not ( = ?auto_355838 ?auto_355843 ) ) ( not ( = ?auto_355838 ?auto_355844 ) ) ( not ( = ?auto_355838 ?auto_355845 ) ) ( not ( = ?auto_355838 ?auto_355846 ) ) ( not ( = ?auto_355838 ?auto_355847 ) ) ( not ( = ?auto_355838 ?auto_355848 ) ) ( not ( = ?auto_355838 ?auto_355849 ) ) ( not ( = ?auto_355839 ?auto_355840 ) ) ( not ( = ?auto_355839 ?auto_355841 ) ) ( not ( = ?auto_355839 ?auto_355842 ) ) ( not ( = ?auto_355839 ?auto_355843 ) ) ( not ( = ?auto_355839 ?auto_355844 ) ) ( not ( = ?auto_355839 ?auto_355845 ) ) ( not ( = ?auto_355839 ?auto_355846 ) ) ( not ( = ?auto_355839 ?auto_355847 ) ) ( not ( = ?auto_355839 ?auto_355848 ) ) ( not ( = ?auto_355839 ?auto_355849 ) ) ( not ( = ?auto_355840 ?auto_355841 ) ) ( not ( = ?auto_355840 ?auto_355842 ) ) ( not ( = ?auto_355840 ?auto_355843 ) ) ( not ( = ?auto_355840 ?auto_355844 ) ) ( not ( = ?auto_355840 ?auto_355845 ) ) ( not ( = ?auto_355840 ?auto_355846 ) ) ( not ( = ?auto_355840 ?auto_355847 ) ) ( not ( = ?auto_355840 ?auto_355848 ) ) ( not ( = ?auto_355840 ?auto_355849 ) ) ( not ( = ?auto_355841 ?auto_355842 ) ) ( not ( = ?auto_355841 ?auto_355843 ) ) ( not ( = ?auto_355841 ?auto_355844 ) ) ( not ( = ?auto_355841 ?auto_355845 ) ) ( not ( = ?auto_355841 ?auto_355846 ) ) ( not ( = ?auto_355841 ?auto_355847 ) ) ( not ( = ?auto_355841 ?auto_355848 ) ) ( not ( = ?auto_355841 ?auto_355849 ) ) ( not ( = ?auto_355842 ?auto_355843 ) ) ( not ( = ?auto_355842 ?auto_355844 ) ) ( not ( = ?auto_355842 ?auto_355845 ) ) ( not ( = ?auto_355842 ?auto_355846 ) ) ( not ( = ?auto_355842 ?auto_355847 ) ) ( not ( = ?auto_355842 ?auto_355848 ) ) ( not ( = ?auto_355842 ?auto_355849 ) ) ( not ( = ?auto_355843 ?auto_355844 ) ) ( not ( = ?auto_355843 ?auto_355845 ) ) ( not ( = ?auto_355843 ?auto_355846 ) ) ( not ( = ?auto_355843 ?auto_355847 ) ) ( not ( = ?auto_355843 ?auto_355848 ) ) ( not ( = ?auto_355843 ?auto_355849 ) ) ( not ( = ?auto_355844 ?auto_355845 ) ) ( not ( = ?auto_355844 ?auto_355846 ) ) ( not ( = ?auto_355844 ?auto_355847 ) ) ( not ( = ?auto_355844 ?auto_355848 ) ) ( not ( = ?auto_355844 ?auto_355849 ) ) ( not ( = ?auto_355845 ?auto_355846 ) ) ( not ( = ?auto_355845 ?auto_355847 ) ) ( not ( = ?auto_355845 ?auto_355848 ) ) ( not ( = ?auto_355845 ?auto_355849 ) ) ( not ( = ?auto_355846 ?auto_355847 ) ) ( not ( = ?auto_355846 ?auto_355848 ) ) ( not ( = ?auto_355846 ?auto_355849 ) ) ( not ( = ?auto_355847 ?auto_355848 ) ) ( not ( = ?auto_355847 ?auto_355849 ) ) ( not ( = ?auto_355848 ?auto_355849 ) ) ( ON ?auto_355848 ?auto_355849 ) ( ON ?auto_355847 ?auto_355848 ) ( ON ?auto_355846 ?auto_355847 ) ( ON ?auto_355845 ?auto_355846 ) ( CLEAR ?auto_355843 ) ( ON ?auto_355844 ?auto_355845 ) ( CLEAR ?auto_355844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_355836 ?auto_355837 ?auto_355838 ?auto_355839 ?auto_355840 ?auto_355841 ?auto_355842 ?auto_355843 ?auto_355844 )
      ( MAKE-14PILE ?auto_355836 ?auto_355837 ?auto_355838 ?auto_355839 ?auto_355840 ?auto_355841 ?auto_355842 ?auto_355843 ?auto_355844 ?auto_355845 ?auto_355846 ?auto_355847 ?auto_355848 ?auto_355849 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355864 - BLOCK
      ?auto_355865 - BLOCK
      ?auto_355866 - BLOCK
      ?auto_355867 - BLOCK
      ?auto_355868 - BLOCK
      ?auto_355869 - BLOCK
      ?auto_355870 - BLOCK
      ?auto_355871 - BLOCK
      ?auto_355872 - BLOCK
      ?auto_355873 - BLOCK
      ?auto_355874 - BLOCK
      ?auto_355875 - BLOCK
      ?auto_355876 - BLOCK
      ?auto_355877 - BLOCK
    )
    :vars
    (
      ?auto_355878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355877 ?auto_355878 ) ( ON-TABLE ?auto_355864 ) ( ON ?auto_355865 ?auto_355864 ) ( ON ?auto_355866 ?auto_355865 ) ( ON ?auto_355867 ?auto_355866 ) ( ON ?auto_355868 ?auto_355867 ) ( ON ?auto_355869 ?auto_355868 ) ( ON ?auto_355870 ?auto_355869 ) ( not ( = ?auto_355864 ?auto_355865 ) ) ( not ( = ?auto_355864 ?auto_355866 ) ) ( not ( = ?auto_355864 ?auto_355867 ) ) ( not ( = ?auto_355864 ?auto_355868 ) ) ( not ( = ?auto_355864 ?auto_355869 ) ) ( not ( = ?auto_355864 ?auto_355870 ) ) ( not ( = ?auto_355864 ?auto_355871 ) ) ( not ( = ?auto_355864 ?auto_355872 ) ) ( not ( = ?auto_355864 ?auto_355873 ) ) ( not ( = ?auto_355864 ?auto_355874 ) ) ( not ( = ?auto_355864 ?auto_355875 ) ) ( not ( = ?auto_355864 ?auto_355876 ) ) ( not ( = ?auto_355864 ?auto_355877 ) ) ( not ( = ?auto_355864 ?auto_355878 ) ) ( not ( = ?auto_355865 ?auto_355866 ) ) ( not ( = ?auto_355865 ?auto_355867 ) ) ( not ( = ?auto_355865 ?auto_355868 ) ) ( not ( = ?auto_355865 ?auto_355869 ) ) ( not ( = ?auto_355865 ?auto_355870 ) ) ( not ( = ?auto_355865 ?auto_355871 ) ) ( not ( = ?auto_355865 ?auto_355872 ) ) ( not ( = ?auto_355865 ?auto_355873 ) ) ( not ( = ?auto_355865 ?auto_355874 ) ) ( not ( = ?auto_355865 ?auto_355875 ) ) ( not ( = ?auto_355865 ?auto_355876 ) ) ( not ( = ?auto_355865 ?auto_355877 ) ) ( not ( = ?auto_355865 ?auto_355878 ) ) ( not ( = ?auto_355866 ?auto_355867 ) ) ( not ( = ?auto_355866 ?auto_355868 ) ) ( not ( = ?auto_355866 ?auto_355869 ) ) ( not ( = ?auto_355866 ?auto_355870 ) ) ( not ( = ?auto_355866 ?auto_355871 ) ) ( not ( = ?auto_355866 ?auto_355872 ) ) ( not ( = ?auto_355866 ?auto_355873 ) ) ( not ( = ?auto_355866 ?auto_355874 ) ) ( not ( = ?auto_355866 ?auto_355875 ) ) ( not ( = ?auto_355866 ?auto_355876 ) ) ( not ( = ?auto_355866 ?auto_355877 ) ) ( not ( = ?auto_355866 ?auto_355878 ) ) ( not ( = ?auto_355867 ?auto_355868 ) ) ( not ( = ?auto_355867 ?auto_355869 ) ) ( not ( = ?auto_355867 ?auto_355870 ) ) ( not ( = ?auto_355867 ?auto_355871 ) ) ( not ( = ?auto_355867 ?auto_355872 ) ) ( not ( = ?auto_355867 ?auto_355873 ) ) ( not ( = ?auto_355867 ?auto_355874 ) ) ( not ( = ?auto_355867 ?auto_355875 ) ) ( not ( = ?auto_355867 ?auto_355876 ) ) ( not ( = ?auto_355867 ?auto_355877 ) ) ( not ( = ?auto_355867 ?auto_355878 ) ) ( not ( = ?auto_355868 ?auto_355869 ) ) ( not ( = ?auto_355868 ?auto_355870 ) ) ( not ( = ?auto_355868 ?auto_355871 ) ) ( not ( = ?auto_355868 ?auto_355872 ) ) ( not ( = ?auto_355868 ?auto_355873 ) ) ( not ( = ?auto_355868 ?auto_355874 ) ) ( not ( = ?auto_355868 ?auto_355875 ) ) ( not ( = ?auto_355868 ?auto_355876 ) ) ( not ( = ?auto_355868 ?auto_355877 ) ) ( not ( = ?auto_355868 ?auto_355878 ) ) ( not ( = ?auto_355869 ?auto_355870 ) ) ( not ( = ?auto_355869 ?auto_355871 ) ) ( not ( = ?auto_355869 ?auto_355872 ) ) ( not ( = ?auto_355869 ?auto_355873 ) ) ( not ( = ?auto_355869 ?auto_355874 ) ) ( not ( = ?auto_355869 ?auto_355875 ) ) ( not ( = ?auto_355869 ?auto_355876 ) ) ( not ( = ?auto_355869 ?auto_355877 ) ) ( not ( = ?auto_355869 ?auto_355878 ) ) ( not ( = ?auto_355870 ?auto_355871 ) ) ( not ( = ?auto_355870 ?auto_355872 ) ) ( not ( = ?auto_355870 ?auto_355873 ) ) ( not ( = ?auto_355870 ?auto_355874 ) ) ( not ( = ?auto_355870 ?auto_355875 ) ) ( not ( = ?auto_355870 ?auto_355876 ) ) ( not ( = ?auto_355870 ?auto_355877 ) ) ( not ( = ?auto_355870 ?auto_355878 ) ) ( not ( = ?auto_355871 ?auto_355872 ) ) ( not ( = ?auto_355871 ?auto_355873 ) ) ( not ( = ?auto_355871 ?auto_355874 ) ) ( not ( = ?auto_355871 ?auto_355875 ) ) ( not ( = ?auto_355871 ?auto_355876 ) ) ( not ( = ?auto_355871 ?auto_355877 ) ) ( not ( = ?auto_355871 ?auto_355878 ) ) ( not ( = ?auto_355872 ?auto_355873 ) ) ( not ( = ?auto_355872 ?auto_355874 ) ) ( not ( = ?auto_355872 ?auto_355875 ) ) ( not ( = ?auto_355872 ?auto_355876 ) ) ( not ( = ?auto_355872 ?auto_355877 ) ) ( not ( = ?auto_355872 ?auto_355878 ) ) ( not ( = ?auto_355873 ?auto_355874 ) ) ( not ( = ?auto_355873 ?auto_355875 ) ) ( not ( = ?auto_355873 ?auto_355876 ) ) ( not ( = ?auto_355873 ?auto_355877 ) ) ( not ( = ?auto_355873 ?auto_355878 ) ) ( not ( = ?auto_355874 ?auto_355875 ) ) ( not ( = ?auto_355874 ?auto_355876 ) ) ( not ( = ?auto_355874 ?auto_355877 ) ) ( not ( = ?auto_355874 ?auto_355878 ) ) ( not ( = ?auto_355875 ?auto_355876 ) ) ( not ( = ?auto_355875 ?auto_355877 ) ) ( not ( = ?auto_355875 ?auto_355878 ) ) ( not ( = ?auto_355876 ?auto_355877 ) ) ( not ( = ?auto_355876 ?auto_355878 ) ) ( not ( = ?auto_355877 ?auto_355878 ) ) ( ON ?auto_355876 ?auto_355877 ) ( ON ?auto_355875 ?auto_355876 ) ( ON ?auto_355874 ?auto_355875 ) ( ON ?auto_355873 ?auto_355874 ) ( ON ?auto_355872 ?auto_355873 ) ( CLEAR ?auto_355870 ) ( ON ?auto_355871 ?auto_355872 ) ( CLEAR ?auto_355871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_355864 ?auto_355865 ?auto_355866 ?auto_355867 ?auto_355868 ?auto_355869 ?auto_355870 ?auto_355871 )
      ( MAKE-14PILE ?auto_355864 ?auto_355865 ?auto_355866 ?auto_355867 ?auto_355868 ?auto_355869 ?auto_355870 ?auto_355871 ?auto_355872 ?auto_355873 ?auto_355874 ?auto_355875 ?auto_355876 ?auto_355877 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355893 - BLOCK
      ?auto_355894 - BLOCK
      ?auto_355895 - BLOCK
      ?auto_355896 - BLOCK
      ?auto_355897 - BLOCK
      ?auto_355898 - BLOCK
      ?auto_355899 - BLOCK
      ?auto_355900 - BLOCK
      ?auto_355901 - BLOCK
      ?auto_355902 - BLOCK
      ?auto_355903 - BLOCK
      ?auto_355904 - BLOCK
      ?auto_355905 - BLOCK
      ?auto_355906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355906 ) ( ON-TABLE ?auto_355893 ) ( ON ?auto_355894 ?auto_355893 ) ( ON ?auto_355895 ?auto_355894 ) ( ON ?auto_355896 ?auto_355895 ) ( ON ?auto_355897 ?auto_355896 ) ( ON ?auto_355898 ?auto_355897 ) ( ON ?auto_355899 ?auto_355898 ) ( not ( = ?auto_355893 ?auto_355894 ) ) ( not ( = ?auto_355893 ?auto_355895 ) ) ( not ( = ?auto_355893 ?auto_355896 ) ) ( not ( = ?auto_355893 ?auto_355897 ) ) ( not ( = ?auto_355893 ?auto_355898 ) ) ( not ( = ?auto_355893 ?auto_355899 ) ) ( not ( = ?auto_355893 ?auto_355900 ) ) ( not ( = ?auto_355893 ?auto_355901 ) ) ( not ( = ?auto_355893 ?auto_355902 ) ) ( not ( = ?auto_355893 ?auto_355903 ) ) ( not ( = ?auto_355893 ?auto_355904 ) ) ( not ( = ?auto_355893 ?auto_355905 ) ) ( not ( = ?auto_355893 ?auto_355906 ) ) ( not ( = ?auto_355894 ?auto_355895 ) ) ( not ( = ?auto_355894 ?auto_355896 ) ) ( not ( = ?auto_355894 ?auto_355897 ) ) ( not ( = ?auto_355894 ?auto_355898 ) ) ( not ( = ?auto_355894 ?auto_355899 ) ) ( not ( = ?auto_355894 ?auto_355900 ) ) ( not ( = ?auto_355894 ?auto_355901 ) ) ( not ( = ?auto_355894 ?auto_355902 ) ) ( not ( = ?auto_355894 ?auto_355903 ) ) ( not ( = ?auto_355894 ?auto_355904 ) ) ( not ( = ?auto_355894 ?auto_355905 ) ) ( not ( = ?auto_355894 ?auto_355906 ) ) ( not ( = ?auto_355895 ?auto_355896 ) ) ( not ( = ?auto_355895 ?auto_355897 ) ) ( not ( = ?auto_355895 ?auto_355898 ) ) ( not ( = ?auto_355895 ?auto_355899 ) ) ( not ( = ?auto_355895 ?auto_355900 ) ) ( not ( = ?auto_355895 ?auto_355901 ) ) ( not ( = ?auto_355895 ?auto_355902 ) ) ( not ( = ?auto_355895 ?auto_355903 ) ) ( not ( = ?auto_355895 ?auto_355904 ) ) ( not ( = ?auto_355895 ?auto_355905 ) ) ( not ( = ?auto_355895 ?auto_355906 ) ) ( not ( = ?auto_355896 ?auto_355897 ) ) ( not ( = ?auto_355896 ?auto_355898 ) ) ( not ( = ?auto_355896 ?auto_355899 ) ) ( not ( = ?auto_355896 ?auto_355900 ) ) ( not ( = ?auto_355896 ?auto_355901 ) ) ( not ( = ?auto_355896 ?auto_355902 ) ) ( not ( = ?auto_355896 ?auto_355903 ) ) ( not ( = ?auto_355896 ?auto_355904 ) ) ( not ( = ?auto_355896 ?auto_355905 ) ) ( not ( = ?auto_355896 ?auto_355906 ) ) ( not ( = ?auto_355897 ?auto_355898 ) ) ( not ( = ?auto_355897 ?auto_355899 ) ) ( not ( = ?auto_355897 ?auto_355900 ) ) ( not ( = ?auto_355897 ?auto_355901 ) ) ( not ( = ?auto_355897 ?auto_355902 ) ) ( not ( = ?auto_355897 ?auto_355903 ) ) ( not ( = ?auto_355897 ?auto_355904 ) ) ( not ( = ?auto_355897 ?auto_355905 ) ) ( not ( = ?auto_355897 ?auto_355906 ) ) ( not ( = ?auto_355898 ?auto_355899 ) ) ( not ( = ?auto_355898 ?auto_355900 ) ) ( not ( = ?auto_355898 ?auto_355901 ) ) ( not ( = ?auto_355898 ?auto_355902 ) ) ( not ( = ?auto_355898 ?auto_355903 ) ) ( not ( = ?auto_355898 ?auto_355904 ) ) ( not ( = ?auto_355898 ?auto_355905 ) ) ( not ( = ?auto_355898 ?auto_355906 ) ) ( not ( = ?auto_355899 ?auto_355900 ) ) ( not ( = ?auto_355899 ?auto_355901 ) ) ( not ( = ?auto_355899 ?auto_355902 ) ) ( not ( = ?auto_355899 ?auto_355903 ) ) ( not ( = ?auto_355899 ?auto_355904 ) ) ( not ( = ?auto_355899 ?auto_355905 ) ) ( not ( = ?auto_355899 ?auto_355906 ) ) ( not ( = ?auto_355900 ?auto_355901 ) ) ( not ( = ?auto_355900 ?auto_355902 ) ) ( not ( = ?auto_355900 ?auto_355903 ) ) ( not ( = ?auto_355900 ?auto_355904 ) ) ( not ( = ?auto_355900 ?auto_355905 ) ) ( not ( = ?auto_355900 ?auto_355906 ) ) ( not ( = ?auto_355901 ?auto_355902 ) ) ( not ( = ?auto_355901 ?auto_355903 ) ) ( not ( = ?auto_355901 ?auto_355904 ) ) ( not ( = ?auto_355901 ?auto_355905 ) ) ( not ( = ?auto_355901 ?auto_355906 ) ) ( not ( = ?auto_355902 ?auto_355903 ) ) ( not ( = ?auto_355902 ?auto_355904 ) ) ( not ( = ?auto_355902 ?auto_355905 ) ) ( not ( = ?auto_355902 ?auto_355906 ) ) ( not ( = ?auto_355903 ?auto_355904 ) ) ( not ( = ?auto_355903 ?auto_355905 ) ) ( not ( = ?auto_355903 ?auto_355906 ) ) ( not ( = ?auto_355904 ?auto_355905 ) ) ( not ( = ?auto_355904 ?auto_355906 ) ) ( not ( = ?auto_355905 ?auto_355906 ) ) ( ON ?auto_355905 ?auto_355906 ) ( ON ?auto_355904 ?auto_355905 ) ( ON ?auto_355903 ?auto_355904 ) ( ON ?auto_355902 ?auto_355903 ) ( ON ?auto_355901 ?auto_355902 ) ( CLEAR ?auto_355899 ) ( ON ?auto_355900 ?auto_355901 ) ( CLEAR ?auto_355900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_355893 ?auto_355894 ?auto_355895 ?auto_355896 ?auto_355897 ?auto_355898 ?auto_355899 ?auto_355900 )
      ( MAKE-14PILE ?auto_355893 ?auto_355894 ?auto_355895 ?auto_355896 ?auto_355897 ?auto_355898 ?auto_355899 ?auto_355900 ?auto_355901 ?auto_355902 ?auto_355903 ?auto_355904 ?auto_355905 ?auto_355906 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355921 - BLOCK
      ?auto_355922 - BLOCK
      ?auto_355923 - BLOCK
      ?auto_355924 - BLOCK
      ?auto_355925 - BLOCK
      ?auto_355926 - BLOCK
      ?auto_355927 - BLOCK
      ?auto_355928 - BLOCK
      ?auto_355929 - BLOCK
      ?auto_355930 - BLOCK
      ?auto_355931 - BLOCK
      ?auto_355932 - BLOCK
      ?auto_355933 - BLOCK
      ?auto_355934 - BLOCK
    )
    :vars
    (
      ?auto_355935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355934 ?auto_355935 ) ( ON-TABLE ?auto_355921 ) ( ON ?auto_355922 ?auto_355921 ) ( ON ?auto_355923 ?auto_355922 ) ( ON ?auto_355924 ?auto_355923 ) ( ON ?auto_355925 ?auto_355924 ) ( ON ?auto_355926 ?auto_355925 ) ( not ( = ?auto_355921 ?auto_355922 ) ) ( not ( = ?auto_355921 ?auto_355923 ) ) ( not ( = ?auto_355921 ?auto_355924 ) ) ( not ( = ?auto_355921 ?auto_355925 ) ) ( not ( = ?auto_355921 ?auto_355926 ) ) ( not ( = ?auto_355921 ?auto_355927 ) ) ( not ( = ?auto_355921 ?auto_355928 ) ) ( not ( = ?auto_355921 ?auto_355929 ) ) ( not ( = ?auto_355921 ?auto_355930 ) ) ( not ( = ?auto_355921 ?auto_355931 ) ) ( not ( = ?auto_355921 ?auto_355932 ) ) ( not ( = ?auto_355921 ?auto_355933 ) ) ( not ( = ?auto_355921 ?auto_355934 ) ) ( not ( = ?auto_355921 ?auto_355935 ) ) ( not ( = ?auto_355922 ?auto_355923 ) ) ( not ( = ?auto_355922 ?auto_355924 ) ) ( not ( = ?auto_355922 ?auto_355925 ) ) ( not ( = ?auto_355922 ?auto_355926 ) ) ( not ( = ?auto_355922 ?auto_355927 ) ) ( not ( = ?auto_355922 ?auto_355928 ) ) ( not ( = ?auto_355922 ?auto_355929 ) ) ( not ( = ?auto_355922 ?auto_355930 ) ) ( not ( = ?auto_355922 ?auto_355931 ) ) ( not ( = ?auto_355922 ?auto_355932 ) ) ( not ( = ?auto_355922 ?auto_355933 ) ) ( not ( = ?auto_355922 ?auto_355934 ) ) ( not ( = ?auto_355922 ?auto_355935 ) ) ( not ( = ?auto_355923 ?auto_355924 ) ) ( not ( = ?auto_355923 ?auto_355925 ) ) ( not ( = ?auto_355923 ?auto_355926 ) ) ( not ( = ?auto_355923 ?auto_355927 ) ) ( not ( = ?auto_355923 ?auto_355928 ) ) ( not ( = ?auto_355923 ?auto_355929 ) ) ( not ( = ?auto_355923 ?auto_355930 ) ) ( not ( = ?auto_355923 ?auto_355931 ) ) ( not ( = ?auto_355923 ?auto_355932 ) ) ( not ( = ?auto_355923 ?auto_355933 ) ) ( not ( = ?auto_355923 ?auto_355934 ) ) ( not ( = ?auto_355923 ?auto_355935 ) ) ( not ( = ?auto_355924 ?auto_355925 ) ) ( not ( = ?auto_355924 ?auto_355926 ) ) ( not ( = ?auto_355924 ?auto_355927 ) ) ( not ( = ?auto_355924 ?auto_355928 ) ) ( not ( = ?auto_355924 ?auto_355929 ) ) ( not ( = ?auto_355924 ?auto_355930 ) ) ( not ( = ?auto_355924 ?auto_355931 ) ) ( not ( = ?auto_355924 ?auto_355932 ) ) ( not ( = ?auto_355924 ?auto_355933 ) ) ( not ( = ?auto_355924 ?auto_355934 ) ) ( not ( = ?auto_355924 ?auto_355935 ) ) ( not ( = ?auto_355925 ?auto_355926 ) ) ( not ( = ?auto_355925 ?auto_355927 ) ) ( not ( = ?auto_355925 ?auto_355928 ) ) ( not ( = ?auto_355925 ?auto_355929 ) ) ( not ( = ?auto_355925 ?auto_355930 ) ) ( not ( = ?auto_355925 ?auto_355931 ) ) ( not ( = ?auto_355925 ?auto_355932 ) ) ( not ( = ?auto_355925 ?auto_355933 ) ) ( not ( = ?auto_355925 ?auto_355934 ) ) ( not ( = ?auto_355925 ?auto_355935 ) ) ( not ( = ?auto_355926 ?auto_355927 ) ) ( not ( = ?auto_355926 ?auto_355928 ) ) ( not ( = ?auto_355926 ?auto_355929 ) ) ( not ( = ?auto_355926 ?auto_355930 ) ) ( not ( = ?auto_355926 ?auto_355931 ) ) ( not ( = ?auto_355926 ?auto_355932 ) ) ( not ( = ?auto_355926 ?auto_355933 ) ) ( not ( = ?auto_355926 ?auto_355934 ) ) ( not ( = ?auto_355926 ?auto_355935 ) ) ( not ( = ?auto_355927 ?auto_355928 ) ) ( not ( = ?auto_355927 ?auto_355929 ) ) ( not ( = ?auto_355927 ?auto_355930 ) ) ( not ( = ?auto_355927 ?auto_355931 ) ) ( not ( = ?auto_355927 ?auto_355932 ) ) ( not ( = ?auto_355927 ?auto_355933 ) ) ( not ( = ?auto_355927 ?auto_355934 ) ) ( not ( = ?auto_355927 ?auto_355935 ) ) ( not ( = ?auto_355928 ?auto_355929 ) ) ( not ( = ?auto_355928 ?auto_355930 ) ) ( not ( = ?auto_355928 ?auto_355931 ) ) ( not ( = ?auto_355928 ?auto_355932 ) ) ( not ( = ?auto_355928 ?auto_355933 ) ) ( not ( = ?auto_355928 ?auto_355934 ) ) ( not ( = ?auto_355928 ?auto_355935 ) ) ( not ( = ?auto_355929 ?auto_355930 ) ) ( not ( = ?auto_355929 ?auto_355931 ) ) ( not ( = ?auto_355929 ?auto_355932 ) ) ( not ( = ?auto_355929 ?auto_355933 ) ) ( not ( = ?auto_355929 ?auto_355934 ) ) ( not ( = ?auto_355929 ?auto_355935 ) ) ( not ( = ?auto_355930 ?auto_355931 ) ) ( not ( = ?auto_355930 ?auto_355932 ) ) ( not ( = ?auto_355930 ?auto_355933 ) ) ( not ( = ?auto_355930 ?auto_355934 ) ) ( not ( = ?auto_355930 ?auto_355935 ) ) ( not ( = ?auto_355931 ?auto_355932 ) ) ( not ( = ?auto_355931 ?auto_355933 ) ) ( not ( = ?auto_355931 ?auto_355934 ) ) ( not ( = ?auto_355931 ?auto_355935 ) ) ( not ( = ?auto_355932 ?auto_355933 ) ) ( not ( = ?auto_355932 ?auto_355934 ) ) ( not ( = ?auto_355932 ?auto_355935 ) ) ( not ( = ?auto_355933 ?auto_355934 ) ) ( not ( = ?auto_355933 ?auto_355935 ) ) ( not ( = ?auto_355934 ?auto_355935 ) ) ( ON ?auto_355933 ?auto_355934 ) ( ON ?auto_355932 ?auto_355933 ) ( ON ?auto_355931 ?auto_355932 ) ( ON ?auto_355930 ?auto_355931 ) ( ON ?auto_355929 ?auto_355930 ) ( ON ?auto_355928 ?auto_355929 ) ( CLEAR ?auto_355926 ) ( ON ?auto_355927 ?auto_355928 ) ( CLEAR ?auto_355927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_355921 ?auto_355922 ?auto_355923 ?auto_355924 ?auto_355925 ?auto_355926 ?auto_355927 )
      ( MAKE-14PILE ?auto_355921 ?auto_355922 ?auto_355923 ?auto_355924 ?auto_355925 ?auto_355926 ?auto_355927 ?auto_355928 ?auto_355929 ?auto_355930 ?auto_355931 ?auto_355932 ?auto_355933 ?auto_355934 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355950 - BLOCK
      ?auto_355951 - BLOCK
      ?auto_355952 - BLOCK
      ?auto_355953 - BLOCK
      ?auto_355954 - BLOCK
      ?auto_355955 - BLOCK
      ?auto_355956 - BLOCK
      ?auto_355957 - BLOCK
      ?auto_355958 - BLOCK
      ?auto_355959 - BLOCK
      ?auto_355960 - BLOCK
      ?auto_355961 - BLOCK
      ?auto_355962 - BLOCK
      ?auto_355963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_355963 ) ( ON-TABLE ?auto_355950 ) ( ON ?auto_355951 ?auto_355950 ) ( ON ?auto_355952 ?auto_355951 ) ( ON ?auto_355953 ?auto_355952 ) ( ON ?auto_355954 ?auto_355953 ) ( ON ?auto_355955 ?auto_355954 ) ( not ( = ?auto_355950 ?auto_355951 ) ) ( not ( = ?auto_355950 ?auto_355952 ) ) ( not ( = ?auto_355950 ?auto_355953 ) ) ( not ( = ?auto_355950 ?auto_355954 ) ) ( not ( = ?auto_355950 ?auto_355955 ) ) ( not ( = ?auto_355950 ?auto_355956 ) ) ( not ( = ?auto_355950 ?auto_355957 ) ) ( not ( = ?auto_355950 ?auto_355958 ) ) ( not ( = ?auto_355950 ?auto_355959 ) ) ( not ( = ?auto_355950 ?auto_355960 ) ) ( not ( = ?auto_355950 ?auto_355961 ) ) ( not ( = ?auto_355950 ?auto_355962 ) ) ( not ( = ?auto_355950 ?auto_355963 ) ) ( not ( = ?auto_355951 ?auto_355952 ) ) ( not ( = ?auto_355951 ?auto_355953 ) ) ( not ( = ?auto_355951 ?auto_355954 ) ) ( not ( = ?auto_355951 ?auto_355955 ) ) ( not ( = ?auto_355951 ?auto_355956 ) ) ( not ( = ?auto_355951 ?auto_355957 ) ) ( not ( = ?auto_355951 ?auto_355958 ) ) ( not ( = ?auto_355951 ?auto_355959 ) ) ( not ( = ?auto_355951 ?auto_355960 ) ) ( not ( = ?auto_355951 ?auto_355961 ) ) ( not ( = ?auto_355951 ?auto_355962 ) ) ( not ( = ?auto_355951 ?auto_355963 ) ) ( not ( = ?auto_355952 ?auto_355953 ) ) ( not ( = ?auto_355952 ?auto_355954 ) ) ( not ( = ?auto_355952 ?auto_355955 ) ) ( not ( = ?auto_355952 ?auto_355956 ) ) ( not ( = ?auto_355952 ?auto_355957 ) ) ( not ( = ?auto_355952 ?auto_355958 ) ) ( not ( = ?auto_355952 ?auto_355959 ) ) ( not ( = ?auto_355952 ?auto_355960 ) ) ( not ( = ?auto_355952 ?auto_355961 ) ) ( not ( = ?auto_355952 ?auto_355962 ) ) ( not ( = ?auto_355952 ?auto_355963 ) ) ( not ( = ?auto_355953 ?auto_355954 ) ) ( not ( = ?auto_355953 ?auto_355955 ) ) ( not ( = ?auto_355953 ?auto_355956 ) ) ( not ( = ?auto_355953 ?auto_355957 ) ) ( not ( = ?auto_355953 ?auto_355958 ) ) ( not ( = ?auto_355953 ?auto_355959 ) ) ( not ( = ?auto_355953 ?auto_355960 ) ) ( not ( = ?auto_355953 ?auto_355961 ) ) ( not ( = ?auto_355953 ?auto_355962 ) ) ( not ( = ?auto_355953 ?auto_355963 ) ) ( not ( = ?auto_355954 ?auto_355955 ) ) ( not ( = ?auto_355954 ?auto_355956 ) ) ( not ( = ?auto_355954 ?auto_355957 ) ) ( not ( = ?auto_355954 ?auto_355958 ) ) ( not ( = ?auto_355954 ?auto_355959 ) ) ( not ( = ?auto_355954 ?auto_355960 ) ) ( not ( = ?auto_355954 ?auto_355961 ) ) ( not ( = ?auto_355954 ?auto_355962 ) ) ( not ( = ?auto_355954 ?auto_355963 ) ) ( not ( = ?auto_355955 ?auto_355956 ) ) ( not ( = ?auto_355955 ?auto_355957 ) ) ( not ( = ?auto_355955 ?auto_355958 ) ) ( not ( = ?auto_355955 ?auto_355959 ) ) ( not ( = ?auto_355955 ?auto_355960 ) ) ( not ( = ?auto_355955 ?auto_355961 ) ) ( not ( = ?auto_355955 ?auto_355962 ) ) ( not ( = ?auto_355955 ?auto_355963 ) ) ( not ( = ?auto_355956 ?auto_355957 ) ) ( not ( = ?auto_355956 ?auto_355958 ) ) ( not ( = ?auto_355956 ?auto_355959 ) ) ( not ( = ?auto_355956 ?auto_355960 ) ) ( not ( = ?auto_355956 ?auto_355961 ) ) ( not ( = ?auto_355956 ?auto_355962 ) ) ( not ( = ?auto_355956 ?auto_355963 ) ) ( not ( = ?auto_355957 ?auto_355958 ) ) ( not ( = ?auto_355957 ?auto_355959 ) ) ( not ( = ?auto_355957 ?auto_355960 ) ) ( not ( = ?auto_355957 ?auto_355961 ) ) ( not ( = ?auto_355957 ?auto_355962 ) ) ( not ( = ?auto_355957 ?auto_355963 ) ) ( not ( = ?auto_355958 ?auto_355959 ) ) ( not ( = ?auto_355958 ?auto_355960 ) ) ( not ( = ?auto_355958 ?auto_355961 ) ) ( not ( = ?auto_355958 ?auto_355962 ) ) ( not ( = ?auto_355958 ?auto_355963 ) ) ( not ( = ?auto_355959 ?auto_355960 ) ) ( not ( = ?auto_355959 ?auto_355961 ) ) ( not ( = ?auto_355959 ?auto_355962 ) ) ( not ( = ?auto_355959 ?auto_355963 ) ) ( not ( = ?auto_355960 ?auto_355961 ) ) ( not ( = ?auto_355960 ?auto_355962 ) ) ( not ( = ?auto_355960 ?auto_355963 ) ) ( not ( = ?auto_355961 ?auto_355962 ) ) ( not ( = ?auto_355961 ?auto_355963 ) ) ( not ( = ?auto_355962 ?auto_355963 ) ) ( ON ?auto_355962 ?auto_355963 ) ( ON ?auto_355961 ?auto_355962 ) ( ON ?auto_355960 ?auto_355961 ) ( ON ?auto_355959 ?auto_355960 ) ( ON ?auto_355958 ?auto_355959 ) ( ON ?auto_355957 ?auto_355958 ) ( CLEAR ?auto_355955 ) ( ON ?auto_355956 ?auto_355957 ) ( CLEAR ?auto_355956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_355950 ?auto_355951 ?auto_355952 ?auto_355953 ?auto_355954 ?auto_355955 ?auto_355956 )
      ( MAKE-14PILE ?auto_355950 ?auto_355951 ?auto_355952 ?auto_355953 ?auto_355954 ?auto_355955 ?auto_355956 ?auto_355957 ?auto_355958 ?auto_355959 ?auto_355960 ?auto_355961 ?auto_355962 ?auto_355963 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_355978 - BLOCK
      ?auto_355979 - BLOCK
      ?auto_355980 - BLOCK
      ?auto_355981 - BLOCK
      ?auto_355982 - BLOCK
      ?auto_355983 - BLOCK
      ?auto_355984 - BLOCK
      ?auto_355985 - BLOCK
      ?auto_355986 - BLOCK
      ?auto_355987 - BLOCK
      ?auto_355988 - BLOCK
      ?auto_355989 - BLOCK
      ?auto_355990 - BLOCK
      ?auto_355991 - BLOCK
    )
    :vars
    (
      ?auto_355992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_355991 ?auto_355992 ) ( ON-TABLE ?auto_355978 ) ( ON ?auto_355979 ?auto_355978 ) ( ON ?auto_355980 ?auto_355979 ) ( ON ?auto_355981 ?auto_355980 ) ( ON ?auto_355982 ?auto_355981 ) ( not ( = ?auto_355978 ?auto_355979 ) ) ( not ( = ?auto_355978 ?auto_355980 ) ) ( not ( = ?auto_355978 ?auto_355981 ) ) ( not ( = ?auto_355978 ?auto_355982 ) ) ( not ( = ?auto_355978 ?auto_355983 ) ) ( not ( = ?auto_355978 ?auto_355984 ) ) ( not ( = ?auto_355978 ?auto_355985 ) ) ( not ( = ?auto_355978 ?auto_355986 ) ) ( not ( = ?auto_355978 ?auto_355987 ) ) ( not ( = ?auto_355978 ?auto_355988 ) ) ( not ( = ?auto_355978 ?auto_355989 ) ) ( not ( = ?auto_355978 ?auto_355990 ) ) ( not ( = ?auto_355978 ?auto_355991 ) ) ( not ( = ?auto_355978 ?auto_355992 ) ) ( not ( = ?auto_355979 ?auto_355980 ) ) ( not ( = ?auto_355979 ?auto_355981 ) ) ( not ( = ?auto_355979 ?auto_355982 ) ) ( not ( = ?auto_355979 ?auto_355983 ) ) ( not ( = ?auto_355979 ?auto_355984 ) ) ( not ( = ?auto_355979 ?auto_355985 ) ) ( not ( = ?auto_355979 ?auto_355986 ) ) ( not ( = ?auto_355979 ?auto_355987 ) ) ( not ( = ?auto_355979 ?auto_355988 ) ) ( not ( = ?auto_355979 ?auto_355989 ) ) ( not ( = ?auto_355979 ?auto_355990 ) ) ( not ( = ?auto_355979 ?auto_355991 ) ) ( not ( = ?auto_355979 ?auto_355992 ) ) ( not ( = ?auto_355980 ?auto_355981 ) ) ( not ( = ?auto_355980 ?auto_355982 ) ) ( not ( = ?auto_355980 ?auto_355983 ) ) ( not ( = ?auto_355980 ?auto_355984 ) ) ( not ( = ?auto_355980 ?auto_355985 ) ) ( not ( = ?auto_355980 ?auto_355986 ) ) ( not ( = ?auto_355980 ?auto_355987 ) ) ( not ( = ?auto_355980 ?auto_355988 ) ) ( not ( = ?auto_355980 ?auto_355989 ) ) ( not ( = ?auto_355980 ?auto_355990 ) ) ( not ( = ?auto_355980 ?auto_355991 ) ) ( not ( = ?auto_355980 ?auto_355992 ) ) ( not ( = ?auto_355981 ?auto_355982 ) ) ( not ( = ?auto_355981 ?auto_355983 ) ) ( not ( = ?auto_355981 ?auto_355984 ) ) ( not ( = ?auto_355981 ?auto_355985 ) ) ( not ( = ?auto_355981 ?auto_355986 ) ) ( not ( = ?auto_355981 ?auto_355987 ) ) ( not ( = ?auto_355981 ?auto_355988 ) ) ( not ( = ?auto_355981 ?auto_355989 ) ) ( not ( = ?auto_355981 ?auto_355990 ) ) ( not ( = ?auto_355981 ?auto_355991 ) ) ( not ( = ?auto_355981 ?auto_355992 ) ) ( not ( = ?auto_355982 ?auto_355983 ) ) ( not ( = ?auto_355982 ?auto_355984 ) ) ( not ( = ?auto_355982 ?auto_355985 ) ) ( not ( = ?auto_355982 ?auto_355986 ) ) ( not ( = ?auto_355982 ?auto_355987 ) ) ( not ( = ?auto_355982 ?auto_355988 ) ) ( not ( = ?auto_355982 ?auto_355989 ) ) ( not ( = ?auto_355982 ?auto_355990 ) ) ( not ( = ?auto_355982 ?auto_355991 ) ) ( not ( = ?auto_355982 ?auto_355992 ) ) ( not ( = ?auto_355983 ?auto_355984 ) ) ( not ( = ?auto_355983 ?auto_355985 ) ) ( not ( = ?auto_355983 ?auto_355986 ) ) ( not ( = ?auto_355983 ?auto_355987 ) ) ( not ( = ?auto_355983 ?auto_355988 ) ) ( not ( = ?auto_355983 ?auto_355989 ) ) ( not ( = ?auto_355983 ?auto_355990 ) ) ( not ( = ?auto_355983 ?auto_355991 ) ) ( not ( = ?auto_355983 ?auto_355992 ) ) ( not ( = ?auto_355984 ?auto_355985 ) ) ( not ( = ?auto_355984 ?auto_355986 ) ) ( not ( = ?auto_355984 ?auto_355987 ) ) ( not ( = ?auto_355984 ?auto_355988 ) ) ( not ( = ?auto_355984 ?auto_355989 ) ) ( not ( = ?auto_355984 ?auto_355990 ) ) ( not ( = ?auto_355984 ?auto_355991 ) ) ( not ( = ?auto_355984 ?auto_355992 ) ) ( not ( = ?auto_355985 ?auto_355986 ) ) ( not ( = ?auto_355985 ?auto_355987 ) ) ( not ( = ?auto_355985 ?auto_355988 ) ) ( not ( = ?auto_355985 ?auto_355989 ) ) ( not ( = ?auto_355985 ?auto_355990 ) ) ( not ( = ?auto_355985 ?auto_355991 ) ) ( not ( = ?auto_355985 ?auto_355992 ) ) ( not ( = ?auto_355986 ?auto_355987 ) ) ( not ( = ?auto_355986 ?auto_355988 ) ) ( not ( = ?auto_355986 ?auto_355989 ) ) ( not ( = ?auto_355986 ?auto_355990 ) ) ( not ( = ?auto_355986 ?auto_355991 ) ) ( not ( = ?auto_355986 ?auto_355992 ) ) ( not ( = ?auto_355987 ?auto_355988 ) ) ( not ( = ?auto_355987 ?auto_355989 ) ) ( not ( = ?auto_355987 ?auto_355990 ) ) ( not ( = ?auto_355987 ?auto_355991 ) ) ( not ( = ?auto_355987 ?auto_355992 ) ) ( not ( = ?auto_355988 ?auto_355989 ) ) ( not ( = ?auto_355988 ?auto_355990 ) ) ( not ( = ?auto_355988 ?auto_355991 ) ) ( not ( = ?auto_355988 ?auto_355992 ) ) ( not ( = ?auto_355989 ?auto_355990 ) ) ( not ( = ?auto_355989 ?auto_355991 ) ) ( not ( = ?auto_355989 ?auto_355992 ) ) ( not ( = ?auto_355990 ?auto_355991 ) ) ( not ( = ?auto_355990 ?auto_355992 ) ) ( not ( = ?auto_355991 ?auto_355992 ) ) ( ON ?auto_355990 ?auto_355991 ) ( ON ?auto_355989 ?auto_355990 ) ( ON ?auto_355988 ?auto_355989 ) ( ON ?auto_355987 ?auto_355988 ) ( ON ?auto_355986 ?auto_355987 ) ( ON ?auto_355985 ?auto_355986 ) ( ON ?auto_355984 ?auto_355985 ) ( CLEAR ?auto_355982 ) ( ON ?auto_355983 ?auto_355984 ) ( CLEAR ?auto_355983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_355978 ?auto_355979 ?auto_355980 ?auto_355981 ?auto_355982 ?auto_355983 )
      ( MAKE-14PILE ?auto_355978 ?auto_355979 ?auto_355980 ?auto_355981 ?auto_355982 ?auto_355983 ?auto_355984 ?auto_355985 ?auto_355986 ?auto_355987 ?auto_355988 ?auto_355989 ?auto_355990 ?auto_355991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356007 - BLOCK
      ?auto_356008 - BLOCK
      ?auto_356009 - BLOCK
      ?auto_356010 - BLOCK
      ?auto_356011 - BLOCK
      ?auto_356012 - BLOCK
      ?auto_356013 - BLOCK
      ?auto_356014 - BLOCK
      ?auto_356015 - BLOCK
      ?auto_356016 - BLOCK
      ?auto_356017 - BLOCK
      ?auto_356018 - BLOCK
      ?auto_356019 - BLOCK
      ?auto_356020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356020 ) ( ON-TABLE ?auto_356007 ) ( ON ?auto_356008 ?auto_356007 ) ( ON ?auto_356009 ?auto_356008 ) ( ON ?auto_356010 ?auto_356009 ) ( ON ?auto_356011 ?auto_356010 ) ( not ( = ?auto_356007 ?auto_356008 ) ) ( not ( = ?auto_356007 ?auto_356009 ) ) ( not ( = ?auto_356007 ?auto_356010 ) ) ( not ( = ?auto_356007 ?auto_356011 ) ) ( not ( = ?auto_356007 ?auto_356012 ) ) ( not ( = ?auto_356007 ?auto_356013 ) ) ( not ( = ?auto_356007 ?auto_356014 ) ) ( not ( = ?auto_356007 ?auto_356015 ) ) ( not ( = ?auto_356007 ?auto_356016 ) ) ( not ( = ?auto_356007 ?auto_356017 ) ) ( not ( = ?auto_356007 ?auto_356018 ) ) ( not ( = ?auto_356007 ?auto_356019 ) ) ( not ( = ?auto_356007 ?auto_356020 ) ) ( not ( = ?auto_356008 ?auto_356009 ) ) ( not ( = ?auto_356008 ?auto_356010 ) ) ( not ( = ?auto_356008 ?auto_356011 ) ) ( not ( = ?auto_356008 ?auto_356012 ) ) ( not ( = ?auto_356008 ?auto_356013 ) ) ( not ( = ?auto_356008 ?auto_356014 ) ) ( not ( = ?auto_356008 ?auto_356015 ) ) ( not ( = ?auto_356008 ?auto_356016 ) ) ( not ( = ?auto_356008 ?auto_356017 ) ) ( not ( = ?auto_356008 ?auto_356018 ) ) ( not ( = ?auto_356008 ?auto_356019 ) ) ( not ( = ?auto_356008 ?auto_356020 ) ) ( not ( = ?auto_356009 ?auto_356010 ) ) ( not ( = ?auto_356009 ?auto_356011 ) ) ( not ( = ?auto_356009 ?auto_356012 ) ) ( not ( = ?auto_356009 ?auto_356013 ) ) ( not ( = ?auto_356009 ?auto_356014 ) ) ( not ( = ?auto_356009 ?auto_356015 ) ) ( not ( = ?auto_356009 ?auto_356016 ) ) ( not ( = ?auto_356009 ?auto_356017 ) ) ( not ( = ?auto_356009 ?auto_356018 ) ) ( not ( = ?auto_356009 ?auto_356019 ) ) ( not ( = ?auto_356009 ?auto_356020 ) ) ( not ( = ?auto_356010 ?auto_356011 ) ) ( not ( = ?auto_356010 ?auto_356012 ) ) ( not ( = ?auto_356010 ?auto_356013 ) ) ( not ( = ?auto_356010 ?auto_356014 ) ) ( not ( = ?auto_356010 ?auto_356015 ) ) ( not ( = ?auto_356010 ?auto_356016 ) ) ( not ( = ?auto_356010 ?auto_356017 ) ) ( not ( = ?auto_356010 ?auto_356018 ) ) ( not ( = ?auto_356010 ?auto_356019 ) ) ( not ( = ?auto_356010 ?auto_356020 ) ) ( not ( = ?auto_356011 ?auto_356012 ) ) ( not ( = ?auto_356011 ?auto_356013 ) ) ( not ( = ?auto_356011 ?auto_356014 ) ) ( not ( = ?auto_356011 ?auto_356015 ) ) ( not ( = ?auto_356011 ?auto_356016 ) ) ( not ( = ?auto_356011 ?auto_356017 ) ) ( not ( = ?auto_356011 ?auto_356018 ) ) ( not ( = ?auto_356011 ?auto_356019 ) ) ( not ( = ?auto_356011 ?auto_356020 ) ) ( not ( = ?auto_356012 ?auto_356013 ) ) ( not ( = ?auto_356012 ?auto_356014 ) ) ( not ( = ?auto_356012 ?auto_356015 ) ) ( not ( = ?auto_356012 ?auto_356016 ) ) ( not ( = ?auto_356012 ?auto_356017 ) ) ( not ( = ?auto_356012 ?auto_356018 ) ) ( not ( = ?auto_356012 ?auto_356019 ) ) ( not ( = ?auto_356012 ?auto_356020 ) ) ( not ( = ?auto_356013 ?auto_356014 ) ) ( not ( = ?auto_356013 ?auto_356015 ) ) ( not ( = ?auto_356013 ?auto_356016 ) ) ( not ( = ?auto_356013 ?auto_356017 ) ) ( not ( = ?auto_356013 ?auto_356018 ) ) ( not ( = ?auto_356013 ?auto_356019 ) ) ( not ( = ?auto_356013 ?auto_356020 ) ) ( not ( = ?auto_356014 ?auto_356015 ) ) ( not ( = ?auto_356014 ?auto_356016 ) ) ( not ( = ?auto_356014 ?auto_356017 ) ) ( not ( = ?auto_356014 ?auto_356018 ) ) ( not ( = ?auto_356014 ?auto_356019 ) ) ( not ( = ?auto_356014 ?auto_356020 ) ) ( not ( = ?auto_356015 ?auto_356016 ) ) ( not ( = ?auto_356015 ?auto_356017 ) ) ( not ( = ?auto_356015 ?auto_356018 ) ) ( not ( = ?auto_356015 ?auto_356019 ) ) ( not ( = ?auto_356015 ?auto_356020 ) ) ( not ( = ?auto_356016 ?auto_356017 ) ) ( not ( = ?auto_356016 ?auto_356018 ) ) ( not ( = ?auto_356016 ?auto_356019 ) ) ( not ( = ?auto_356016 ?auto_356020 ) ) ( not ( = ?auto_356017 ?auto_356018 ) ) ( not ( = ?auto_356017 ?auto_356019 ) ) ( not ( = ?auto_356017 ?auto_356020 ) ) ( not ( = ?auto_356018 ?auto_356019 ) ) ( not ( = ?auto_356018 ?auto_356020 ) ) ( not ( = ?auto_356019 ?auto_356020 ) ) ( ON ?auto_356019 ?auto_356020 ) ( ON ?auto_356018 ?auto_356019 ) ( ON ?auto_356017 ?auto_356018 ) ( ON ?auto_356016 ?auto_356017 ) ( ON ?auto_356015 ?auto_356016 ) ( ON ?auto_356014 ?auto_356015 ) ( ON ?auto_356013 ?auto_356014 ) ( CLEAR ?auto_356011 ) ( ON ?auto_356012 ?auto_356013 ) ( CLEAR ?auto_356012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_356007 ?auto_356008 ?auto_356009 ?auto_356010 ?auto_356011 ?auto_356012 )
      ( MAKE-14PILE ?auto_356007 ?auto_356008 ?auto_356009 ?auto_356010 ?auto_356011 ?auto_356012 ?auto_356013 ?auto_356014 ?auto_356015 ?auto_356016 ?auto_356017 ?auto_356018 ?auto_356019 ?auto_356020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356035 - BLOCK
      ?auto_356036 - BLOCK
      ?auto_356037 - BLOCK
      ?auto_356038 - BLOCK
      ?auto_356039 - BLOCK
      ?auto_356040 - BLOCK
      ?auto_356041 - BLOCK
      ?auto_356042 - BLOCK
      ?auto_356043 - BLOCK
      ?auto_356044 - BLOCK
      ?auto_356045 - BLOCK
      ?auto_356046 - BLOCK
      ?auto_356047 - BLOCK
      ?auto_356048 - BLOCK
    )
    :vars
    (
      ?auto_356049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356048 ?auto_356049 ) ( ON-TABLE ?auto_356035 ) ( ON ?auto_356036 ?auto_356035 ) ( ON ?auto_356037 ?auto_356036 ) ( ON ?auto_356038 ?auto_356037 ) ( not ( = ?auto_356035 ?auto_356036 ) ) ( not ( = ?auto_356035 ?auto_356037 ) ) ( not ( = ?auto_356035 ?auto_356038 ) ) ( not ( = ?auto_356035 ?auto_356039 ) ) ( not ( = ?auto_356035 ?auto_356040 ) ) ( not ( = ?auto_356035 ?auto_356041 ) ) ( not ( = ?auto_356035 ?auto_356042 ) ) ( not ( = ?auto_356035 ?auto_356043 ) ) ( not ( = ?auto_356035 ?auto_356044 ) ) ( not ( = ?auto_356035 ?auto_356045 ) ) ( not ( = ?auto_356035 ?auto_356046 ) ) ( not ( = ?auto_356035 ?auto_356047 ) ) ( not ( = ?auto_356035 ?auto_356048 ) ) ( not ( = ?auto_356035 ?auto_356049 ) ) ( not ( = ?auto_356036 ?auto_356037 ) ) ( not ( = ?auto_356036 ?auto_356038 ) ) ( not ( = ?auto_356036 ?auto_356039 ) ) ( not ( = ?auto_356036 ?auto_356040 ) ) ( not ( = ?auto_356036 ?auto_356041 ) ) ( not ( = ?auto_356036 ?auto_356042 ) ) ( not ( = ?auto_356036 ?auto_356043 ) ) ( not ( = ?auto_356036 ?auto_356044 ) ) ( not ( = ?auto_356036 ?auto_356045 ) ) ( not ( = ?auto_356036 ?auto_356046 ) ) ( not ( = ?auto_356036 ?auto_356047 ) ) ( not ( = ?auto_356036 ?auto_356048 ) ) ( not ( = ?auto_356036 ?auto_356049 ) ) ( not ( = ?auto_356037 ?auto_356038 ) ) ( not ( = ?auto_356037 ?auto_356039 ) ) ( not ( = ?auto_356037 ?auto_356040 ) ) ( not ( = ?auto_356037 ?auto_356041 ) ) ( not ( = ?auto_356037 ?auto_356042 ) ) ( not ( = ?auto_356037 ?auto_356043 ) ) ( not ( = ?auto_356037 ?auto_356044 ) ) ( not ( = ?auto_356037 ?auto_356045 ) ) ( not ( = ?auto_356037 ?auto_356046 ) ) ( not ( = ?auto_356037 ?auto_356047 ) ) ( not ( = ?auto_356037 ?auto_356048 ) ) ( not ( = ?auto_356037 ?auto_356049 ) ) ( not ( = ?auto_356038 ?auto_356039 ) ) ( not ( = ?auto_356038 ?auto_356040 ) ) ( not ( = ?auto_356038 ?auto_356041 ) ) ( not ( = ?auto_356038 ?auto_356042 ) ) ( not ( = ?auto_356038 ?auto_356043 ) ) ( not ( = ?auto_356038 ?auto_356044 ) ) ( not ( = ?auto_356038 ?auto_356045 ) ) ( not ( = ?auto_356038 ?auto_356046 ) ) ( not ( = ?auto_356038 ?auto_356047 ) ) ( not ( = ?auto_356038 ?auto_356048 ) ) ( not ( = ?auto_356038 ?auto_356049 ) ) ( not ( = ?auto_356039 ?auto_356040 ) ) ( not ( = ?auto_356039 ?auto_356041 ) ) ( not ( = ?auto_356039 ?auto_356042 ) ) ( not ( = ?auto_356039 ?auto_356043 ) ) ( not ( = ?auto_356039 ?auto_356044 ) ) ( not ( = ?auto_356039 ?auto_356045 ) ) ( not ( = ?auto_356039 ?auto_356046 ) ) ( not ( = ?auto_356039 ?auto_356047 ) ) ( not ( = ?auto_356039 ?auto_356048 ) ) ( not ( = ?auto_356039 ?auto_356049 ) ) ( not ( = ?auto_356040 ?auto_356041 ) ) ( not ( = ?auto_356040 ?auto_356042 ) ) ( not ( = ?auto_356040 ?auto_356043 ) ) ( not ( = ?auto_356040 ?auto_356044 ) ) ( not ( = ?auto_356040 ?auto_356045 ) ) ( not ( = ?auto_356040 ?auto_356046 ) ) ( not ( = ?auto_356040 ?auto_356047 ) ) ( not ( = ?auto_356040 ?auto_356048 ) ) ( not ( = ?auto_356040 ?auto_356049 ) ) ( not ( = ?auto_356041 ?auto_356042 ) ) ( not ( = ?auto_356041 ?auto_356043 ) ) ( not ( = ?auto_356041 ?auto_356044 ) ) ( not ( = ?auto_356041 ?auto_356045 ) ) ( not ( = ?auto_356041 ?auto_356046 ) ) ( not ( = ?auto_356041 ?auto_356047 ) ) ( not ( = ?auto_356041 ?auto_356048 ) ) ( not ( = ?auto_356041 ?auto_356049 ) ) ( not ( = ?auto_356042 ?auto_356043 ) ) ( not ( = ?auto_356042 ?auto_356044 ) ) ( not ( = ?auto_356042 ?auto_356045 ) ) ( not ( = ?auto_356042 ?auto_356046 ) ) ( not ( = ?auto_356042 ?auto_356047 ) ) ( not ( = ?auto_356042 ?auto_356048 ) ) ( not ( = ?auto_356042 ?auto_356049 ) ) ( not ( = ?auto_356043 ?auto_356044 ) ) ( not ( = ?auto_356043 ?auto_356045 ) ) ( not ( = ?auto_356043 ?auto_356046 ) ) ( not ( = ?auto_356043 ?auto_356047 ) ) ( not ( = ?auto_356043 ?auto_356048 ) ) ( not ( = ?auto_356043 ?auto_356049 ) ) ( not ( = ?auto_356044 ?auto_356045 ) ) ( not ( = ?auto_356044 ?auto_356046 ) ) ( not ( = ?auto_356044 ?auto_356047 ) ) ( not ( = ?auto_356044 ?auto_356048 ) ) ( not ( = ?auto_356044 ?auto_356049 ) ) ( not ( = ?auto_356045 ?auto_356046 ) ) ( not ( = ?auto_356045 ?auto_356047 ) ) ( not ( = ?auto_356045 ?auto_356048 ) ) ( not ( = ?auto_356045 ?auto_356049 ) ) ( not ( = ?auto_356046 ?auto_356047 ) ) ( not ( = ?auto_356046 ?auto_356048 ) ) ( not ( = ?auto_356046 ?auto_356049 ) ) ( not ( = ?auto_356047 ?auto_356048 ) ) ( not ( = ?auto_356047 ?auto_356049 ) ) ( not ( = ?auto_356048 ?auto_356049 ) ) ( ON ?auto_356047 ?auto_356048 ) ( ON ?auto_356046 ?auto_356047 ) ( ON ?auto_356045 ?auto_356046 ) ( ON ?auto_356044 ?auto_356045 ) ( ON ?auto_356043 ?auto_356044 ) ( ON ?auto_356042 ?auto_356043 ) ( ON ?auto_356041 ?auto_356042 ) ( ON ?auto_356040 ?auto_356041 ) ( CLEAR ?auto_356038 ) ( ON ?auto_356039 ?auto_356040 ) ( CLEAR ?auto_356039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_356035 ?auto_356036 ?auto_356037 ?auto_356038 ?auto_356039 )
      ( MAKE-14PILE ?auto_356035 ?auto_356036 ?auto_356037 ?auto_356038 ?auto_356039 ?auto_356040 ?auto_356041 ?auto_356042 ?auto_356043 ?auto_356044 ?auto_356045 ?auto_356046 ?auto_356047 ?auto_356048 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356064 - BLOCK
      ?auto_356065 - BLOCK
      ?auto_356066 - BLOCK
      ?auto_356067 - BLOCK
      ?auto_356068 - BLOCK
      ?auto_356069 - BLOCK
      ?auto_356070 - BLOCK
      ?auto_356071 - BLOCK
      ?auto_356072 - BLOCK
      ?auto_356073 - BLOCK
      ?auto_356074 - BLOCK
      ?auto_356075 - BLOCK
      ?auto_356076 - BLOCK
      ?auto_356077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356077 ) ( ON-TABLE ?auto_356064 ) ( ON ?auto_356065 ?auto_356064 ) ( ON ?auto_356066 ?auto_356065 ) ( ON ?auto_356067 ?auto_356066 ) ( not ( = ?auto_356064 ?auto_356065 ) ) ( not ( = ?auto_356064 ?auto_356066 ) ) ( not ( = ?auto_356064 ?auto_356067 ) ) ( not ( = ?auto_356064 ?auto_356068 ) ) ( not ( = ?auto_356064 ?auto_356069 ) ) ( not ( = ?auto_356064 ?auto_356070 ) ) ( not ( = ?auto_356064 ?auto_356071 ) ) ( not ( = ?auto_356064 ?auto_356072 ) ) ( not ( = ?auto_356064 ?auto_356073 ) ) ( not ( = ?auto_356064 ?auto_356074 ) ) ( not ( = ?auto_356064 ?auto_356075 ) ) ( not ( = ?auto_356064 ?auto_356076 ) ) ( not ( = ?auto_356064 ?auto_356077 ) ) ( not ( = ?auto_356065 ?auto_356066 ) ) ( not ( = ?auto_356065 ?auto_356067 ) ) ( not ( = ?auto_356065 ?auto_356068 ) ) ( not ( = ?auto_356065 ?auto_356069 ) ) ( not ( = ?auto_356065 ?auto_356070 ) ) ( not ( = ?auto_356065 ?auto_356071 ) ) ( not ( = ?auto_356065 ?auto_356072 ) ) ( not ( = ?auto_356065 ?auto_356073 ) ) ( not ( = ?auto_356065 ?auto_356074 ) ) ( not ( = ?auto_356065 ?auto_356075 ) ) ( not ( = ?auto_356065 ?auto_356076 ) ) ( not ( = ?auto_356065 ?auto_356077 ) ) ( not ( = ?auto_356066 ?auto_356067 ) ) ( not ( = ?auto_356066 ?auto_356068 ) ) ( not ( = ?auto_356066 ?auto_356069 ) ) ( not ( = ?auto_356066 ?auto_356070 ) ) ( not ( = ?auto_356066 ?auto_356071 ) ) ( not ( = ?auto_356066 ?auto_356072 ) ) ( not ( = ?auto_356066 ?auto_356073 ) ) ( not ( = ?auto_356066 ?auto_356074 ) ) ( not ( = ?auto_356066 ?auto_356075 ) ) ( not ( = ?auto_356066 ?auto_356076 ) ) ( not ( = ?auto_356066 ?auto_356077 ) ) ( not ( = ?auto_356067 ?auto_356068 ) ) ( not ( = ?auto_356067 ?auto_356069 ) ) ( not ( = ?auto_356067 ?auto_356070 ) ) ( not ( = ?auto_356067 ?auto_356071 ) ) ( not ( = ?auto_356067 ?auto_356072 ) ) ( not ( = ?auto_356067 ?auto_356073 ) ) ( not ( = ?auto_356067 ?auto_356074 ) ) ( not ( = ?auto_356067 ?auto_356075 ) ) ( not ( = ?auto_356067 ?auto_356076 ) ) ( not ( = ?auto_356067 ?auto_356077 ) ) ( not ( = ?auto_356068 ?auto_356069 ) ) ( not ( = ?auto_356068 ?auto_356070 ) ) ( not ( = ?auto_356068 ?auto_356071 ) ) ( not ( = ?auto_356068 ?auto_356072 ) ) ( not ( = ?auto_356068 ?auto_356073 ) ) ( not ( = ?auto_356068 ?auto_356074 ) ) ( not ( = ?auto_356068 ?auto_356075 ) ) ( not ( = ?auto_356068 ?auto_356076 ) ) ( not ( = ?auto_356068 ?auto_356077 ) ) ( not ( = ?auto_356069 ?auto_356070 ) ) ( not ( = ?auto_356069 ?auto_356071 ) ) ( not ( = ?auto_356069 ?auto_356072 ) ) ( not ( = ?auto_356069 ?auto_356073 ) ) ( not ( = ?auto_356069 ?auto_356074 ) ) ( not ( = ?auto_356069 ?auto_356075 ) ) ( not ( = ?auto_356069 ?auto_356076 ) ) ( not ( = ?auto_356069 ?auto_356077 ) ) ( not ( = ?auto_356070 ?auto_356071 ) ) ( not ( = ?auto_356070 ?auto_356072 ) ) ( not ( = ?auto_356070 ?auto_356073 ) ) ( not ( = ?auto_356070 ?auto_356074 ) ) ( not ( = ?auto_356070 ?auto_356075 ) ) ( not ( = ?auto_356070 ?auto_356076 ) ) ( not ( = ?auto_356070 ?auto_356077 ) ) ( not ( = ?auto_356071 ?auto_356072 ) ) ( not ( = ?auto_356071 ?auto_356073 ) ) ( not ( = ?auto_356071 ?auto_356074 ) ) ( not ( = ?auto_356071 ?auto_356075 ) ) ( not ( = ?auto_356071 ?auto_356076 ) ) ( not ( = ?auto_356071 ?auto_356077 ) ) ( not ( = ?auto_356072 ?auto_356073 ) ) ( not ( = ?auto_356072 ?auto_356074 ) ) ( not ( = ?auto_356072 ?auto_356075 ) ) ( not ( = ?auto_356072 ?auto_356076 ) ) ( not ( = ?auto_356072 ?auto_356077 ) ) ( not ( = ?auto_356073 ?auto_356074 ) ) ( not ( = ?auto_356073 ?auto_356075 ) ) ( not ( = ?auto_356073 ?auto_356076 ) ) ( not ( = ?auto_356073 ?auto_356077 ) ) ( not ( = ?auto_356074 ?auto_356075 ) ) ( not ( = ?auto_356074 ?auto_356076 ) ) ( not ( = ?auto_356074 ?auto_356077 ) ) ( not ( = ?auto_356075 ?auto_356076 ) ) ( not ( = ?auto_356075 ?auto_356077 ) ) ( not ( = ?auto_356076 ?auto_356077 ) ) ( ON ?auto_356076 ?auto_356077 ) ( ON ?auto_356075 ?auto_356076 ) ( ON ?auto_356074 ?auto_356075 ) ( ON ?auto_356073 ?auto_356074 ) ( ON ?auto_356072 ?auto_356073 ) ( ON ?auto_356071 ?auto_356072 ) ( ON ?auto_356070 ?auto_356071 ) ( ON ?auto_356069 ?auto_356070 ) ( CLEAR ?auto_356067 ) ( ON ?auto_356068 ?auto_356069 ) ( CLEAR ?auto_356068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_356064 ?auto_356065 ?auto_356066 ?auto_356067 ?auto_356068 )
      ( MAKE-14PILE ?auto_356064 ?auto_356065 ?auto_356066 ?auto_356067 ?auto_356068 ?auto_356069 ?auto_356070 ?auto_356071 ?auto_356072 ?auto_356073 ?auto_356074 ?auto_356075 ?auto_356076 ?auto_356077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356092 - BLOCK
      ?auto_356093 - BLOCK
      ?auto_356094 - BLOCK
      ?auto_356095 - BLOCK
      ?auto_356096 - BLOCK
      ?auto_356097 - BLOCK
      ?auto_356098 - BLOCK
      ?auto_356099 - BLOCK
      ?auto_356100 - BLOCK
      ?auto_356101 - BLOCK
      ?auto_356102 - BLOCK
      ?auto_356103 - BLOCK
      ?auto_356104 - BLOCK
      ?auto_356105 - BLOCK
    )
    :vars
    (
      ?auto_356106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356105 ?auto_356106 ) ( ON-TABLE ?auto_356092 ) ( ON ?auto_356093 ?auto_356092 ) ( ON ?auto_356094 ?auto_356093 ) ( not ( = ?auto_356092 ?auto_356093 ) ) ( not ( = ?auto_356092 ?auto_356094 ) ) ( not ( = ?auto_356092 ?auto_356095 ) ) ( not ( = ?auto_356092 ?auto_356096 ) ) ( not ( = ?auto_356092 ?auto_356097 ) ) ( not ( = ?auto_356092 ?auto_356098 ) ) ( not ( = ?auto_356092 ?auto_356099 ) ) ( not ( = ?auto_356092 ?auto_356100 ) ) ( not ( = ?auto_356092 ?auto_356101 ) ) ( not ( = ?auto_356092 ?auto_356102 ) ) ( not ( = ?auto_356092 ?auto_356103 ) ) ( not ( = ?auto_356092 ?auto_356104 ) ) ( not ( = ?auto_356092 ?auto_356105 ) ) ( not ( = ?auto_356092 ?auto_356106 ) ) ( not ( = ?auto_356093 ?auto_356094 ) ) ( not ( = ?auto_356093 ?auto_356095 ) ) ( not ( = ?auto_356093 ?auto_356096 ) ) ( not ( = ?auto_356093 ?auto_356097 ) ) ( not ( = ?auto_356093 ?auto_356098 ) ) ( not ( = ?auto_356093 ?auto_356099 ) ) ( not ( = ?auto_356093 ?auto_356100 ) ) ( not ( = ?auto_356093 ?auto_356101 ) ) ( not ( = ?auto_356093 ?auto_356102 ) ) ( not ( = ?auto_356093 ?auto_356103 ) ) ( not ( = ?auto_356093 ?auto_356104 ) ) ( not ( = ?auto_356093 ?auto_356105 ) ) ( not ( = ?auto_356093 ?auto_356106 ) ) ( not ( = ?auto_356094 ?auto_356095 ) ) ( not ( = ?auto_356094 ?auto_356096 ) ) ( not ( = ?auto_356094 ?auto_356097 ) ) ( not ( = ?auto_356094 ?auto_356098 ) ) ( not ( = ?auto_356094 ?auto_356099 ) ) ( not ( = ?auto_356094 ?auto_356100 ) ) ( not ( = ?auto_356094 ?auto_356101 ) ) ( not ( = ?auto_356094 ?auto_356102 ) ) ( not ( = ?auto_356094 ?auto_356103 ) ) ( not ( = ?auto_356094 ?auto_356104 ) ) ( not ( = ?auto_356094 ?auto_356105 ) ) ( not ( = ?auto_356094 ?auto_356106 ) ) ( not ( = ?auto_356095 ?auto_356096 ) ) ( not ( = ?auto_356095 ?auto_356097 ) ) ( not ( = ?auto_356095 ?auto_356098 ) ) ( not ( = ?auto_356095 ?auto_356099 ) ) ( not ( = ?auto_356095 ?auto_356100 ) ) ( not ( = ?auto_356095 ?auto_356101 ) ) ( not ( = ?auto_356095 ?auto_356102 ) ) ( not ( = ?auto_356095 ?auto_356103 ) ) ( not ( = ?auto_356095 ?auto_356104 ) ) ( not ( = ?auto_356095 ?auto_356105 ) ) ( not ( = ?auto_356095 ?auto_356106 ) ) ( not ( = ?auto_356096 ?auto_356097 ) ) ( not ( = ?auto_356096 ?auto_356098 ) ) ( not ( = ?auto_356096 ?auto_356099 ) ) ( not ( = ?auto_356096 ?auto_356100 ) ) ( not ( = ?auto_356096 ?auto_356101 ) ) ( not ( = ?auto_356096 ?auto_356102 ) ) ( not ( = ?auto_356096 ?auto_356103 ) ) ( not ( = ?auto_356096 ?auto_356104 ) ) ( not ( = ?auto_356096 ?auto_356105 ) ) ( not ( = ?auto_356096 ?auto_356106 ) ) ( not ( = ?auto_356097 ?auto_356098 ) ) ( not ( = ?auto_356097 ?auto_356099 ) ) ( not ( = ?auto_356097 ?auto_356100 ) ) ( not ( = ?auto_356097 ?auto_356101 ) ) ( not ( = ?auto_356097 ?auto_356102 ) ) ( not ( = ?auto_356097 ?auto_356103 ) ) ( not ( = ?auto_356097 ?auto_356104 ) ) ( not ( = ?auto_356097 ?auto_356105 ) ) ( not ( = ?auto_356097 ?auto_356106 ) ) ( not ( = ?auto_356098 ?auto_356099 ) ) ( not ( = ?auto_356098 ?auto_356100 ) ) ( not ( = ?auto_356098 ?auto_356101 ) ) ( not ( = ?auto_356098 ?auto_356102 ) ) ( not ( = ?auto_356098 ?auto_356103 ) ) ( not ( = ?auto_356098 ?auto_356104 ) ) ( not ( = ?auto_356098 ?auto_356105 ) ) ( not ( = ?auto_356098 ?auto_356106 ) ) ( not ( = ?auto_356099 ?auto_356100 ) ) ( not ( = ?auto_356099 ?auto_356101 ) ) ( not ( = ?auto_356099 ?auto_356102 ) ) ( not ( = ?auto_356099 ?auto_356103 ) ) ( not ( = ?auto_356099 ?auto_356104 ) ) ( not ( = ?auto_356099 ?auto_356105 ) ) ( not ( = ?auto_356099 ?auto_356106 ) ) ( not ( = ?auto_356100 ?auto_356101 ) ) ( not ( = ?auto_356100 ?auto_356102 ) ) ( not ( = ?auto_356100 ?auto_356103 ) ) ( not ( = ?auto_356100 ?auto_356104 ) ) ( not ( = ?auto_356100 ?auto_356105 ) ) ( not ( = ?auto_356100 ?auto_356106 ) ) ( not ( = ?auto_356101 ?auto_356102 ) ) ( not ( = ?auto_356101 ?auto_356103 ) ) ( not ( = ?auto_356101 ?auto_356104 ) ) ( not ( = ?auto_356101 ?auto_356105 ) ) ( not ( = ?auto_356101 ?auto_356106 ) ) ( not ( = ?auto_356102 ?auto_356103 ) ) ( not ( = ?auto_356102 ?auto_356104 ) ) ( not ( = ?auto_356102 ?auto_356105 ) ) ( not ( = ?auto_356102 ?auto_356106 ) ) ( not ( = ?auto_356103 ?auto_356104 ) ) ( not ( = ?auto_356103 ?auto_356105 ) ) ( not ( = ?auto_356103 ?auto_356106 ) ) ( not ( = ?auto_356104 ?auto_356105 ) ) ( not ( = ?auto_356104 ?auto_356106 ) ) ( not ( = ?auto_356105 ?auto_356106 ) ) ( ON ?auto_356104 ?auto_356105 ) ( ON ?auto_356103 ?auto_356104 ) ( ON ?auto_356102 ?auto_356103 ) ( ON ?auto_356101 ?auto_356102 ) ( ON ?auto_356100 ?auto_356101 ) ( ON ?auto_356099 ?auto_356100 ) ( ON ?auto_356098 ?auto_356099 ) ( ON ?auto_356097 ?auto_356098 ) ( ON ?auto_356096 ?auto_356097 ) ( CLEAR ?auto_356094 ) ( ON ?auto_356095 ?auto_356096 ) ( CLEAR ?auto_356095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_356092 ?auto_356093 ?auto_356094 ?auto_356095 )
      ( MAKE-14PILE ?auto_356092 ?auto_356093 ?auto_356094 ?auto_356095 ?auto_356096 ?auto_356097 ?auto_356098 ?auto_356099 ?auto_356100 ?auto_356101 ?auto_356102 ?auto_356103 ?auto_356104 ?auto_356105 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356121 - BLOCK
      ?auto_356122 - BLOCK
      ?auto_356123 - BLOCK
      ?auto_356124 - BLOCK
      ?auto_356125 - BLOCK
      ?auto_356126 - BLOCK
      ?auto_356127 - BLOCK
      ?auto_356128 - BLOCK
      ?auto_356129 - BLOCK
      ?auto_356130 - BLOCK
      ?auto_356131 - BLOCK
      ?auto_356132 - BLOCK
      ?auto_356133 - BLOCK
      ?auto_356134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356134 ) ( ON-TABLE ?auto_356121 ) ( ON ?auto_356122 ?auto_356121 ) ( ON ?auto_356123 ?auto_356122 ) ( not ( = ?auto_356121 ?auto_356122 ) ) ( not ( = ?auto_356121 ?auto_356123 ) ) ( not ( = ?auto_356121 ?auto_356124 ) ) ( not ( = ?auto_356121 ?auto_356125 ) ) ( not ( = ?auto_356121 ?auto_356126 ) ) ( not ( = ?auto_356121 ?auto_356127 ) ) ( not ( = ?auto_356121 ?auto_356128 ) ) ( not ( = ?auto_356121 ?auto_356129 ) ) ( not ( = ?auto_356121 ?auto_356130 ) ) ( not ( = ?auto_356121 ?auto_356131 ) ) ( not ( = ?auto_356121 ?auto_356132 ) ) ( not ( = ?auto_356121 ?auto_356133 ) ) ( not ( = ?auto_356121 ?auto_356134 ) ) ( not ( = ?auto_356122 ?auto_356123 ) ) ( not ( = ?auto_356122 ?auto_356124 ) ) ( not ( = ?auto_356122 ?auto_356125 ) ) ( not ( = ?auto_356122 ?auto_356126 ) ) ( not ( = ?auto_356122 ?auto_356127 ) ) ( not ( = ?auto_356122 ?auto_356128 ) ) ( not ( = ?auto_356122 ?auto_356129 ) ) ( not ( = ?auto_356122 ?auto_356130 ) ) ( not ( = ?auto_356122 ?auto_356131 ) ) ( not ( = ?auto_356122 ?auto_356132 ) ) ( not ( = ?auto_356122 ?auto_356133 ) ) ( not ( = ?auto_356122 ?auto_356134 ) ) ( not ( = ?auto_356123 ?auto_356124 ) ) ( not ( = ?auto_356123 ?auto_356125 ) ) ( not ( = ?auto_356123 ?auto_356126 ) ) ( not ( = ?auto_356123 ?auto_356127 ) ) ( not ( = ?auto_356123 ?auto_356128 ) ) ( not ( = ?auto_356123 ?auto_356129 ) ) ( not ( = ?auto_356123 ?auto_356130 ) ) ( not ( = ?auto_356123 ?auto_356131 ) ) ( not ( = ?auto_356123 ?auto_356132 ) ) ( not ( = ?auto_356123 ?auto_356133 ) ) ( not ( = ?auto_356123 ?auto_356134 ) ) ( not ( = ?auto_356124 ?auto_356125 ) ) ( not ( = ?auto_356124 ?auto_356126 ) ) ( not ( = ?auto_356124 ?auto_356127 ) ) ( not ( = ?auto_356124 ?auto_356128 ) ) ( not ( = ?auto_356124 ?auto_356129 ) ) ( not ( = ?auto_356124 ?auto_356130 ) ) ( not ( = ?auto_356124 ?auto_356131 ) ) ( not ( = ?auto_356124 ?auto_356132 ) ) ( not ( = ?auto_356124 ?auto_356133 ) ) ( not ( = ?auto_356124 ?auto_356134 ) ) ( not ( = ?auto_356125 ?auto_356126 ) ) ( not ( = ?auto_356125 ?auto_356127 ) ) ( not ( = ?auto_356125 ?auto_356128 ) ) ( not ( = ?auto_356125 ?auto_356129 ) ) ( not ( = ?auto_356125 ?auto_356130 ) ) ( not ( = ?auto_356125 ?auto_356131 ) ) ( not ( = ?auto_356125 ?auto_356132 ) ) ( not ( = ?auto_356125 ?auto_356133 ) ) ( not ( = ?auto_356125 ?auto_356134 ) ) ( not ( = ?auto_356126 ?auto_356127 ) ) ( not ( = ?auto_356126 ?auto_356128 ) ) ( not ( = ?auto_356126 ?auto_356129 ) ) ( not ( = ?auto_356126 ?auto_356130 ) ) ( not ( = ?auto_356126 ?auto_356131 ) ) ( not ( = ?auto_356126 ?auto_356132 ) ) ( not ( = ?auto_356126 ?auto_356133 ) ) ( not ( = ?auto_356126 ?auto_356134 ) ) ( not ( = ?auto_356127 ?auto_356128 ) ) ( not ( = ?auto_356127 ?auto_356129 ) ) ( not ( = ?auto_356127 ?auto_356130 ) ) ( not ( = ?auto_356127 ?auto_356131 ) ) ( not ( = ?auto_356127 ?auto_356132 ) ) ( not ( = ?auto_356127 ?auto_356133 ) ) ( not ( = ?auto_356127 ?auto_356134 ) ) ( not ( = ?auto_356128 ?auto_356129 ) ) ( not ( = ?auto_356128 ?auto_356130 ) ) ( not ( = ?auto_356128 ?auto_356131 ) ) ( not ( = ?auto_356128 ?auto_356132 ) ) ( not ( = ?auto_356128 ?auto_356133 ) ) ( not ( = ?auto_356128 ?auto_356134 ) ) ( not ( = ?auto_356129 ?auto_356130 ) ) ( not ( = ?auto_356129 ?auto_356131 ) ) ( not ( = ?auto_356129 ?auto_356132 ) ) ( not ( = ?auto_356129 ?auto_356133 ) ) ( not ( = ?auto_356129 ?auto_356134 ) ) ( not ( = ?auto_356130 ?auto_356131 ) ) ( not ( = ?auto_356130 ?auto_356132 ) ) ( not ( = ?auto_356130 ?auto_356133 ) ) ( not ( = ?auto_356130 ?auto_356134 ) ) ( not ( = ?auto_356131 ?auto_356132 ) ) ( not ( = ?auto_356131 ?auto_356133 ) ) ( not ( = ?auto_356131 ?auto_356134 ) ) ( not ( = ?auto_356132 ?auto_356133 ) ) ( not ( = ?auto_356132 ?auto_356134 ) ) ( not ( = ?auto_356133 ?auto_356134 ) ) ( ON ?auto_356133 ?auto_356134 ) ( ON ?auto_356132 ?auto_356133 ) ( ON ?auto_356131 ?auto_356132 ) ( ON ?auto_356130 ?auto_356131 ) ( ON ?auto_356129 ?auto_356130 ) ( ON ?auto_356128 ?auto_356129 ) ( ON ?auto_356127 ?auto_356128 ) ( ON ?auto_356126 ?auto_356127 ) ( ON ?auto_356125 ?auto_356126 ) ( CLEAR ?auto_356123 ) ( ON ?auto_356124 ?auto_356125 ) ( CLEAR ?auto_356124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_356121 ?auto_356122 ?auto_356123 ?auto_356124 )
      ( MAKE-14PILE ?auto_356121 ?auto_356122 ?auto_356123 ?auto_356124 ?auto_356125 ?auto_356126 ?auto_356127 ?auto_356128 ?auto_356129 ?auto_356130 ?auto_356131 ?auto_356132 ?auto_356133 ?auto_356134 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356149 - BLOCK
      ?auto_356150 - BLOCK
      ?auto_356151 - BLOCK
      ?auto_356152 - BLOCK
      ?auto_356153 - BLOCK
      ?auto_356154 - BLOCK
      ?auto_356155 - BLOCK
      ?auto_356156 - BLOCK
      ?auto_356157 - BLOCK
      ?auto_356158 - BLOCK
      ?auto_356159 - BLOCK
      ?auto_356160 - BLOCK
      ?auto_356161 - BLOCK
      ?auto_356162 - BLOCK
    )
    :vars
    (
      ?auto_356163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356162 ?auto_356163 ) ( ON-TABLE ?auto_356149 ) ( ON ?auto_356150 ?auto_356149 ) ( not ( = ?auto_356149 ?auto_356150 ) ) ( not ( = ?auto_356149 ?auto_356151 ) ) ( not ( = ?auto_356149 ?auto_356152 ) ) ( not ( = ?auto_356149 ?auto_356153 ) ) ( not ( = ?auto_356149 ?auto_356154 ) ) ( not ( = ?auto_356149 ?auto_356155 ) ) ( not ( = ?auto_356149 ?auto_356156 ) ) ( not ( = ?auto_356149 ?auto_356157 ) ) ( not ( = ?auto_356149 ?auto_356158 ) ) ( not ( = ?auto_356149 ?auto_356159 ) ) ( not ( = ?auto_356149 ?auto_356160 ) ) ( not ( = ?auto_356149 ?auto_356161 ) ) ( not ( = ?auto_356149 ?auto_356162 ) ) ( not ( = ?auto_356149 ?auto_356163 ) ) ( not ( = ?auto_356150 ?auto_356151 ) ) ( not ( = ?auto_356150 ?auto_356152 ) ) ( not ( = ?auto_356150 ?auto_356153 ) ) ( not ( = ?auto_356150 ?auto_356154 ) ) ( not ( = ?auto_356150 ?auto_356155 ) ) ( not ( = ?auto_356150 ?auto_356156 ) ) ( not ( = ?auto_356150 ?auto_356157 ) ) ( not ( = ?auto_356150 ?auto_356158 ) ) ( not ( = ?auto_356150 ?auto_356159 ) ) ( not ( = ?auto_356150 ?auto_356160 ) ) ( not ( = ?auto_356150 ?auto_356161 ) ) ( not ( = ?auto_356150 ?auto_356162 ) ) ( not ( = ?auto_356150 ?auto_356163 ) ) ( not ( = ?auto_356151 ?auto_356152 ) ) ( not ( = ?auto_356151 ?auto_356153 ) ) ( not ( = ?auto_356151 ?auto_356154 ) ) ( not ( = ?auto_356151 ?auto_356155 ) ) ( not ( = ?auto_356151 ?auto_356156 ) ) ( not ( = ?auto_356151 ?auto_356157 ) ) ( not ( = ?auto_356151 ?auto_356158 ) ) ( not ( = ?auto_356151 ?auto_356159 ) ) ( not ( = ?auto_356151 ?auto_356160 ) ) ( not ( = ?auto_356151 ?auto_356161 ) ) ( not ( = ?auto_356151 ?auto_356162 ) ) ( not ( = ?auto_356151 ?auto_356163 ) ) ( not ( = ?auto_356152 ?auto_356153 ) ) ( not ( = ?auto_356152 ?auto_356154 ) ) ( not ( = ?auto_356152 ?auto_356155 ) ) ( not ( = ?auto_356152 ?auto_356156 ) ) ( not ( = ?auto_356152 ?auto_356157 ) ) ( not ( = ?auto_356152 ?auto_356158 ) ) ( not ( = ?auto_356152 ?auto_356159 ) ) ( not ( = ?auto_356152 ?auto_356160 ) ) ( not ( = ?auto_356152 ?auto_356161 ) ) ( not ( = ?auto_356152 ?auto_356162 ) ) ( not ( = ?auto_356152 ?auto_356163 ) ) ( not ( = ?auto_356153 ?auto_356154 ) ) ( not ( = ?auto_356153 ?auto_356155 ) ) ( not ( = ?auto_356153 ?auto_356156 ) ) ( not ( = ?auto_356153 ?auto_356157 ) ) ( not ( = ?auto_356153 ?auto_356158 ) ) ( not ( = ?auto_356153 ?auto_356159 ) ) ( not ( = ?auto_356153 ?auto_356160 ) ) ( not ( = ?auto_356153 ?auto_356161 ) ) ( not ( = ?auto_356153 ?auto_356162 ) ) ( not ( = ?auto_356153 ?auto_356163 ) ) ( not ( = ?auto_356154 ?auto_356155 ) ) ( not ( = ?auto_356154 ?auto_356156 ) ) ( not ( = ?auto_356154 ?auto_356157 ) ) ( not ( = ?auto_356154 ?auto_356158 ) ) ( not ( = ?auto_356154 ?auto_356159 ) ) ( not ( = ?auto_356154 ?auto_356160 ) ) ( not ( = ?auto_356154 ?auto_356161 ) ) ( not ( = ?auto_356154 ?auto_356162 ) ) ( not ( = ?auto_356154 ?auto_356163 ) ) ( not ( = ?auto_356155 ?auto_356156 ) ) ( not ( = ?auto_356155 ?auto_356157 ) ) ( not ( = ?auto_356155 ?auto_356158 ) ) ( not ( = ?auto_356155 ?auto_356159 ) ) ( not ( = ?auto_356155 ?auto_356160 ) ) ( not ( = ?auto_356155 ?auto_356161 ) ) ( not ( = ?auto_356155 ?auto_356162 ) ) ( not ( = ?auto_356155 ?auto_356163 ) ) ( not ( = ?auto_356156 ?auto_356157 ) ) ( not ( = ?auto_356156 ?auto_356158 ) ) ( not ( = ?auto_356156 ?auto_356159 ) ) ( not ( = ?auto_356156 ?auto_356160 ) ) ( not ( = ?auto_356156 ?auto_356161 ) ) ( not ( = ?auto_356156 ?auto_356162 ) ) ( not ( = ?auto_356156 ?auto_356163 ) ) ( not ( = ?auto_356157 ?auto_356158 ) ) ( not ( = ?auto_356157 ?auto_356159 ) ) ( not ( = ?auto_356157 ?auto_356160 ) ) ( not ( = ?auto_356157 ?auto_356161 ) ) ( not ( = ?auto_356157 ?auto_356162 ) ) ( not ( = ?auto_356157 ?auto_356163 ) ) ( not ( = ?auto_356158 ?auto_356159 ) ) ( not ( = ?auto_356158 ?auto_356160 ) ) ( not ( = ?auto_356158 ?auto_356161 ) ) ( not ( = ?auto_356158 ?auto_356162 ) ) ( not ( = ?auto_356158 ?auto_356163 ) ) ( not ( = ?auto_356159 ?auto_356160 ) ) ( not ( = ?auto_356159 ?auto_356161 ) ) ( not ( = ?auto_356159 ?auto_356162 ) ) ( not ( = ?auto_356159 ?auto_356163 ) ) ( not ( = ?auto_356160 ?auto_356161 ) ) ( not ( = ?auto_356160 ?auto_356162 ) ) ( not ( = ?auto_356160 ?auto_356163 ) ) ( not ( = ?auto_356161 ?auto_356162 ) ) ( not ( = ?auto_356161 ?auto_356163 ) ) ( not ( = ?auto_356162 ?auto_356163 ) ) ( ON ?auto_356161 ?auto_356162 ) ( ON ?auto_356160 ?auto_356161 ) ( ON ?auto_356159 ?auto_356160 ) ( ON ?auto_356158 ?auto_356159 ) ( ON ?auto_356157 ?auto_356158 ) ( ON ?auto_356156 ?auto_356157 ) ( ON ?auto_356155 ?auto_356156 ) ( ON ?auto_356154 ?auto_356155 ) ( ON ?auto_356153 ?auto_356154 ) ( ON ?auto_356152 ?auto_356153 ) ( CLEAR ?auto_356150 ) ( ON ?auto_356151 ?auto_356152 ) ( CLEAR ?auto_356151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356149 ?auto_356150 ?auto_356151 )
      ( MAKE-14PILE ?auto_356149 ?auto_356150 ?auto_356151 ?auto_356152 ?auto_356153 ?auto_356154 ?auto_356155 ?auto_356156 ?auto_356157 ?auto_356158 ?auto_356159 ?auto_356160 ?auto_356161 ?auto_356162 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356178 - BLOCK
      ?auto_356179 - BLOCK
      ?auto_356180 - BLOCK
      ?auto_356181 - BLOCK
      ?auto_356182 - BLOCK
      ?auto_356183 - BLOCK
      ?auto_356184 - BLOCK
      ?auto_356185 - BLOCK
      ?auto_356186 - BLOCK
      ?auto_356187 - BLOCK
      ?auto_356188 - BLOCK
      ?auto_356189 - BLOCK
      ?auto_356190 - BLOCK
      ?auto_356191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356191 ) ( ON-TABLE ?auto_356178 ) ( ON ?auto_356179 ?auto_356178 ) ( not ( = ?auto_356178 ?auto_356179 ) ) ( not ( = ?auto_356178 ?auto_356180 ) ) ( not ( = ?auto_356178 ?auto_356181 ) ) ( not ( = ?auto_356178 ?auto_356182 ) ) ( not ( = ?auto_356178 ?auto_356183 ) ) ( not ( = ?auto_356178 ?auto_356184 ) ) ( not ( = ?auto_356178 ?auto_356185 ) ) ( not ( = ?auto_356178 ?auto_356186 ) ) ( not ( = ?auto_356178 ?auto_356187 ) ) ( not ( = ?auto_356178 ?auto_356188 ) ) ( not ( = ?auto_356178 ?auto_356189 ) ) ( not ( = ?auto_356178 ?auto_356190 ) ) ( not ( = ?auto_356178 ?auto_356191 ) ) ( not ( = ?auto_356179 ?auto_356180 ) ) ( not ( = ?auto_356179 ?auto_356181 ) ) ( not ( = ?auto_356179 ?auto_356182 ) ) ( not ( = ?auto_356179 ?auto_356183 ) ) ( not ( = ?auto_356179 ?auto_356184 ) ) ( not ( = ?auto_356179 ?auto_356185 ) ) ( not ( = ?auto_356179 ?auto_356186 ) ) ( not ( = ?auto_356179 ?auto_356187 ) ) ( not ( = ?auto_356179 ?auto_356188 ) ) ( not ( = ?auto_356179 ?auto_356189 ) ) ( not ( = ?auto_356179 ?auto_356190 ) ) ( not ( = ?auto_356179 ?auto_356191 ) ) ( not ( = ?auto_356180 ?auto_356181 ) ) ( not ( = ?auto_356180 ?auto_356182 ) ) ( not ( = ?auto_356180 ?auto_356183 ) ) ( not ( = ?auto_356180 ?auto_356184 ) ) ( not ( = ?auto_356180 ?auto_356185 ) ) ( not ( = ?auto_356180 ?auto_356186 ) ) ( not ( = ?auto_356180 ?auto_356187 ) ) ( not ( = ?auto_356180 ?auto_356188 ) ) ( not ( = ?auto_356180 ?auto_356189 ) ) ( not ( = ?auto_356180 ?auto_356190 ) ) ( not ( = ?auto_356180 ?auto_356191 ) ) ( not ( = ?auto_356181 ?auto_356182 ) ) ( not ( = ?auto_356181 ?auto_356183 ) ) ( not ( = ?auto_356181 ?auto_356184 ) ) ( not ( = ?auto_356181 ?auto_356185 ) ) ( not ( = ?auto_356181 ?auto_356186 ) ) ( not ( = ?auto_356181 ?auto_356187 ) ) ( not ( = ?auto_356181 ?auto_356188 ) ) ( not ( = ?auto_356181 ?auto_356189 ) ) ( not ( = ?auto_356181 ?auto_356190 ) ) ( not ( = ?auto_356181 ?auto_356191 ) ) ( not ( = ?auto_356182 ?auto_356183 ) ) ( not ( = ?auto_356182 ?auto_356184 ) ) ( not ( = ?auto_356182 ?auto_356185 ) ) ( not ( = ?auto_356182 ?auto_356186 ) ) ( not ( = ?auto_356182 ?auto_356187 ) ) ( not ( = ?auto_356182 ?auto_356188 ) ) ( not ( = ?auto_356182 ?auto_356189 ) ) ( not ( = ?auto_356182 ?auto_356190 ) ) ( not ( = ?auto_356182 ?auto_356191 ) ) ( not ( = ?auto_356183 ?auto_356184 ) ) ( not ( = ?auto_356183 ?auto_356185 ) ) ( not ( = ?auto_356183 ?auto_356186 ) ) ( not ( = ?auto_356183 ?auto_356187 ) ) ( not ( = ?auto_356183 ?auto_356188 ) ) ( not ( = ?auto_356183 ?auto_356189 ) ) ( not ( = ?auto_356183 ?auto_356190 ) ) ( not ( = ?auto_356183 ?auto_356191 ) ) ( not ( = ?auto_356184 ?auto_356185 ) ) ( not ( = ?auto_356184 ?auto_356186 ) ) ( not ( = ?auto_356184 ?auto_356187 ) ) ( not ( = ?auto_356184 ?auto_356188 ) ) ( not ( = ?auto_356184 ?auto_356189 ) ) ( not ( = ?auto_356184 ?auto_356190 ) ) ( not ( = ?auto_356184 ?auto_356191 ) ) ( not ( = ?auto_356185 ?auto_356186 ) ) ( not ( = ?auto_356185 ?auto_356187 ) ) ( not ( = ?auto_356185 ?auto_356188 ) ) ( not ( = ?auto_356185 ?auto_356189 ) ) ( not ( = ?auto_356185 ?auto_356190 ) ) ( not ( = ?auto_356185 ?auto_356191 ) ) ( not ( = ?auto_356186 ?auto_356187 ) ) ( not ( = ?auto_356186 ?auto_356188 ) ) ( not ( = ?auto_356186 ?auto_356189 ) ) ( not ( = ?auto_356186 ?auto_356190 ) ) ( not ( = ?auto_356186 ?auto_356191 ) ) ( not ( = ?auto_356187 ?auto_356188 ) ) ( not ( = ?auto_356187 ?auto_356189 ) ) ( not ( = ?auto_356187 ?auto_356190 ) ) ( not ( = ?auto_356187 ?auto_356191 ) ) ( not ( = ?auto_356188 ?auto_356189 ) ) ( not ( = ?auto_356188 ?auto_356190 ) ) ( not ( = ?auto_356188 ?auto_356191 ) ) ( not ( = ?auto_356189 ?auto_356190 ) ) ( not ( = ?auto_356189 ?auto_356191 ) ) ( not ( = ?auto_356190 ?auto_356191 ) ) ( ON ?auto_356190 ?auto_356191 ) ( ON ?auto_356189 ?auto_356190 ) ( ON ?auto_356188 ?auto_356189 ) ( ON ?auto_356187 ?auto_356188 ) ( ON ?auto_356186 ?auto_356187 ) ( ON ?auto_356185 ?auto_356186 ) ( ON ?auto_356184 ?auto_356185 ) ( ON ?auto_356183 ?auto_356184 ) ( ON ?auto_356182 ?auto_356183 ) ( ON ?auto_356181 ?auto_356182 ) ( CLEAR ?auto_356179 ) ( ON ?auto_356180 ?auto_356181 ) ( CLEAR ?auto_356180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356178 ?auto_356179 ?auto_356180 )
      ( MAKE-14PILE ?auto_356178 ?auto_356179 ?auto_356180 ?auto_356181 ?auto_356182 ?auto_356183 ?auto_356184 ?auto_356185 ?auto_356186 ?auto_356187 ?auto_356188 ?auto_356189 ?auto_356190 ?auto_356191 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356206 - BLOCK
      ?auto_356207 - BLOCK
      ?auto_356208 - BLOCK
      ?auto_356209 - BLOCK
      ?auto_356210 - BLOCK
      ?auto_356211 - BLOCK
      ?auto_356212 - BLOCK
      ?auto_356213 - BLOCK
      ?auto_356214 - BLOCK
      ?auto_356215 - BLOCK
      ?auto_356216 - BLOCK
      ?auto_356217 - BLOCK
      ?auto_356218 - BLOCK
      ?auto_356219 - BLOCK
    )
    :vars
    (
      ?auto_356220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356219 ?auto_356220 ) ( ON-TABLE ?auto_356206 ) ( not ( = ?auto_356206 ?auto_356207 ) ) ( not ( = ?auto_356206 ?auto_356208 ) ) ( not ( = ?auto_356206 ?auto_356209 ) ) ( not ( = ?auto_356206 ?auto_356210 ) ) ( not ( = ?auto_356206 ?auto_356211 ) ) ( not ( = ?auto_356206 ?auto_356212 ) ) ( not ( = ?auto_356206 ?auto_356213 ) ) ( not ( = ?auto_356206 ?auto_356214 ) ) ( not ( = ?auto_356206 ?auto_356215 ) ) ( not ( = ?auto_356206 ?auto_356216 ) ) ( not ( = ?auto_356206 ?auto_356217 ) ) ( not ( = ?auto_356206 ?auto_356218 ) ) ( not ( = ?auto_356206 ?auto_356219 ) ) ( not ( = ?auto_356206 ?auto_356220 ) ) ( not ( = ?auto_356207 ?auto_356208 ) ) ( not ( = ?auto_356207 ?auto_356209 ) ) ( not ( = ?auto_356207 ?auto_356210 ) ) ( not ( = ?auto_356207 ?auto_356211 ) ) ( not ( = ?auto_356207 ?auto_356212 ) ) ( not ( = ?auto_356207 ?auto_356213 ) ) ( not ( = ?auto_356207 ?auto_356214 ) ) ( not ( = ?auto_356207 ?auto_356215 ) ) ( not ( = ?auto_356207 ?auto_356216 ) ) ( not ( = ?auto_356207 ?auto_356217 ) ) ( not ( = ?auto_356207 ?auto_356218 ) ) ( not ( = ?auto_356207 ?auto_356219 ) ) ( not ( = ?auto_356207 ?auto_356220 ) ) ( not ( = ?auto_356208 ?auto_356209 ) ) ( not ( = ?auto_356208 ?auto_356210 ) ) ( not ( = ?auto_356208 ?auto_356211 ) ) ( not ( = ?auto_356208 ?auto_356212 ) ) ( not ( = ?auto_356208 ?auto_356213 ) ) ( not ( = ?auto_356208 ?auto_356214 ) ) ( not ( = ?auto_356208 ?auto_356215 ) ) ( not ( = ?auto_356208 ?auto_356216 ) ) ( not ( = ?auto_356208 ?auto_356217 ) ) ( not ( = ?auto_356208 ?auto_356218 ) ) ( not ( = ?auto_356208 ?auto_356219 ) ) ( not ( = ?auto_356208 ?auto_356220 ) ) ( not ( = ?auto_356209 ?auto_356210 ) ) ( not ( = ?auto_356209 ?auto_356211 ) ) ( not ( = ?auto_356209 ?auto_356212 ) ) ( not ( = ?auto_356209 ?auto_356213 ) ) ( not ( = ?auto_356209 ?auto_356214 ) ) ( not ( = ?auto_356209 ?auto_356215 ) ) ( not ( = ?auto_356209 ?auto_356216 ) ) ( not ( = ?auto_356209 ?auto_356217 ) ) ( not ( = ?auto_356209 ?auto_356218 ) ) ( not ( = ?auto_356209 ?auto_356219 ) ) ( not ( = ?auto_356209 ?auto_356220 ) ) ( not ( = ?auto_356210 ?auto_356211 ) ) ( not ( = ?auto_356210 ?auto_356212 ) ) ( not ( = ?auto_356210 ?auto_356213 ) ) ( not ( = ?auto_356210 ?auto_356214 ) ) ( not ( = ?auto_356210 ?auto_356215 ) ) ( not ( = ?auto_356210 ?auto_356216 ) ) ( not ( = ?auto_356210 ?auto_356217 ) ) ( not ( = ?auto_356210 ?auto_356218 ) ) ( not ( = ?auto_356210 ?auto_356219 ) ) ( not ( = ?auto_356210 ?auto_356220 ) ) ( not ( = ?auto_356211 ?auto_356212 ) ) ( not ( = ?auto_356211 ?auto_356213 ) ) ( not ( = ?auto_356211 ?auto_356214 ) ) ( not ( = ?auto_356211 ?auto_356215 ) ) ( not ( = ?auto_356211 ?auto_356216 ) ) ( not ( = ?auto_356211 ?auto_356217 ) ) ( not ( = ?auto_356211 ?auto_356218 ) ) ( not ( = ?auto_356211 ?auto_356219 ) ) ( not ( = ?auto_356211 ?auto_356220 ) ) ( not ( = ?auto_356212 ?auto_356213 ) ) ( not ( = ?auto_356212 ?auto_356214 ) ) ( not ( = ?auto_356212 ?auto_356215 ) ) ( not ( = ?auto_356212 ?auto_356216 ) ) ( not ( = ?auto_356212 ?auto_356217 ) ) ( not ( = ?auto_356212 ?auto_356218 ) ) ( not ( = ?auto_356212 ?auto_356219 ) ) ( not ( = ?auto_356212 ?auto_356220 ) ) ( not ( = ?auto_356213 ?auto_356214 ) ) ( not ( = ?auto_356213 ?auto_356215 ) ) ( not ( = ?auto_356213 ?auto_356216 ) ) ( not ( = ?auto_356213 ?auto_356217 ) ) ( not ( = ?auto_356213 ?auto_356218 ) ) ( not ( = ?auto_356213 ?auto_356219 ) ) ( not ( = ?auto_356213 ?auto_356220 ) ) ( not ( = ?auto_356214 ?auto_356215 ) ) ( not ( = ?auto_356214 ?auto_356216 ) ) ( not ( = ?auto_356214 ?auto_356217 ) ) ( not ( = ?auto_356214 ?auto_356218 ) ) ( not ( = ?auto_356214 ?auto_356219 ) ) ( not ( = ?auto_356214 ?auto_356220 ) ) ( not ( = ?auto_356215 ?auto_356216 ) ) ( not ( = ?auto_356215 ?auto_356217 ) ) ( not ( = ?auto_356215 ?auto_356218 ) ) ( not ( = ?auto_356215 ?auto_356219 ) ) ( not ( = ?auto_356215 ?auto_356220 ) ) ( not ( = ?auto_356216 ?auto_356217 ) ) ( not ( = ?auto_356216 ?auto_356218 ) ) ( not ( = ?auto_356216 ?auto_356219 ) ) ( not ( = ?auto_356216 ?auto_356220 ) ) ( not ( = ?auto_356217 ?auto_356218 ) ) ( not ( = ?auto_356217 ?auto_356219 ) ) ( not ( = ?auto_356217 ?auto_356220 ) ) ( not ( = ?auto_356218 ?auto_356219 ) ) ( not ( = ?auto_356218 ?auto_356220 ) ) ( not ( = ?auto_356219 ?auto_356220 ) ) ( ON ?auto_356218 ?auto_356219 ) ( ON ?auto_356217 ?auto_356218 ) ( ON ?auto_356216 ?auto_356217 ) ( ON ?auto_356215 ?auto_356216 ) ( ON ?auto_356214 ?auto_356215 ) ( ON ?auto_356213 ?auto_356214 ) ( ON ?auto_356212 ?auto_356213 ) ( ON ?auto_356211 ?auto_356212 ) ( ON ?auto_356210 ?auto_356211 ) ( ON ?auto_356209 ?auto_356210 ) ( ON ?auto_356208 ?auto_356209 ) ( CLEAR ?auto_356206 ) ( ON ?auto_356207 ?auto_356208 ) ( CLEAR ?auto_356207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356206 ?auto_356207 )
      ( MAKE-14PILE ?auto_356206 ?auto_356207 ?auto_356208 ?auto_356209 ?auto_356210 ?auto_356211 ?auto_356212 ?auto_356213 ?auto_356214 ?auto_356215 ?auto_356216 ?auto_356217 ?auto_356218 ?auto_356219 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356235 - BLOCK
      ?auto_356236 - BLOCK
      ?auto_356237 - BLOCK
      ?auto_356238 - BLOCK
      ?auto_356239 - BLOCK
      ?auto_356240 - BLOCK
      ?auto_356241 - BLOCK
      ?auto_356242 - BLOCK
      ?auto_356243 - BLOCK
      ?auto_356244 - BLOCK
      ?auto_356245 - BLOCK
      ?auto_356246 - BLOCK
      ?auto_356247 - BLOCK
      ?auto_356248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356248 ) ( ON-TABLE ?auto_356235 ) ( not ( = ?auto_356235 ?auto_356236 ) ) ( not ( = ?auto_356235 ?auto_356237 ) ) ( not ( = ?auto_356235 ?auto_356238 ) ) ( not ( = ?auto_356235 ?auto_356239 ) ) ( not ( = ?auto_356235 ?auto_356240 ) ) ( not ( = ?auto_356235 ?auto_356241 ) ) ( not ( = ?auto_356235 ?auto_356242 ) ) ( not ( = ?auto_356235 ?auto_356243 ) ) ( not ( = ?auto_356235 ?auto_356244 ) ) ( not ( = ?auto_356235 ?auto_356245 ) ) ( not ( = ?auto_356235 ?auto_356246 ) ) ( not ( = ?auto_356235 ?auto_356247 ) ) ( not ( = ?auto_356235 ?auto_356248 ) ) ( not ( = ?auto_356236 ?auto_356237 ) ) ( not ( = ?auto_356236 ?auto_356238 ) ) ( not ( = ?auto_356236 ?auto_356239 ) ) ( not ( = ?auto_356236 ?auto_356240 ) ) ( not ( = ?auto_356236 ?auto_356241 ) ) ( not ( = ?auto_356236 ?auto_356242 ) ) ( not ( = ?auto_356236 ?auto_356243 ) ) ( not ( = ?auto_356236 ?auto_356244 ) ) ( not ( = ?auto_356236 ?auto_356245 ) ) ( not ( = ?auto_356236 ?auto_356246 ) ) ( not ( = ?auto_356236 ?auto_356247 ) ) ( not ( = ?auto_356236 ?auto_356248 ) ) ( not ( = ?auto_356237 ?auto_356238 ) ) ( not ( = ?auto_356237 ?auto_356239 ) ) ( not ( = ?auto_356237 ?auto_356240 ) ) ( not ( = ?auto_356237 ?auto_356241 ) ) ( not ( = ?auto_356237 ?auto_356242 ) ) ( not ( = ?auto_356237 ?auto_356243 ) ) ( not ( = ?auto_356237 ?auto_356244 ) ) ( not ( = ?auto_356237 ?auto_356245 ) ) ( not ( = ?auto_356237 ?auto_356246 ) ) ( not ( = ?auto_356237 ?auto_356247 ) ) ( not ( = ?auto_356237 ?auto_356248 ) ) ( not ( = ?auto_356238 ?auto_356239 ) ) ( not ( = ?auto_356238 ?auto_356240 ) ) ( not ( = ?auto_356238 ?auto_356241 ) ) ( not ( = ?auto_356238 ?auto_356242 ) ) ( not ( = ?auto_356238 ?auto_356243 ) ) ( not ( = ?auto_356238 ?auto_356244 ) ) ( not ( = ?auto_356238 ?auto_356245 ) ) ( not ( = ?auto_356238 ?auto_356246 ) ) ( not ( = ?auto_356238 ?auto_356247 ) ) ( not ( = ?auto_356238 ?auto_356248 ) ) ( not ( = ?auto_356239 ?auto_356240 ) ) ( not ( = ?auto_356239 ?auto_356241 ) ) ( not ( = ?auto_356239 ?auto_356242 ) ) ( not ( = ?auto_356239 ?auto_356243 ) ) ( not ( = ?auto_356239 ?auto_356244 ) ) ( not ( = ?auto_356239 ?auto_356245 ) ) ( not ( = ?auto_356239 ?auto_356246 ) ) ( not ( = ?auto_356239 ?auto_356247 ) ) ( not ( = ?auto_356239 ?auto_356248 ) ) ( not ( = ?auto_356240 ?auto_356241 ) ) ( not ( = ?auto_356240 ?auto_356242 ) ) ( not ( = ?auto_356240 ?auto_356243 ) ) ( not ( = ?auto_356240 ?auto_356244 ) ) ( not ( = ?auto_356240 ?auto_356245 ) ) ( not ( = ?auto_356240 ?auto_356246 ) ) ( not ( = ?auto_356240 ?auto_356247 ) ) ( not ( = ?auto_356240 ?auto_356248 ) ) ( not ( = ?auto_356241 ?auto_356242 ) ) ( not ( = ?auto_356241 ?auto_356243 ) ) ( not ( = ?auto_356241 ?auto_356244 ) ) ( not ( = ?auto_356241 ?auto_356245 ) ) ( not ( = ?auto_356241 ?auto_356246 ) ) ( not ( = ?auto_356241 ?auto_356247 ) ) ( not ( = ?auto_356241 ?auto_356248 ) ) ( not ( = ?auto_356242 ?auto_356243 ) ) ( not ( = ?auto_356242 ?auto_356244 ) ) ( not ( = ?auto_356242 ?auto_356245 ) ) ( not ( = ?auto_356242 ?auto_356246 ) ) ( not ( = ?auto_356242 ?auto_356247 ) ) ( not ( = ?auto_356242 ?auto_356248 ) ) ( not ( = ?auto_356243 ?auto_356244 ) ) ( not ( = ?auto_356243 ?auto_356245 ) ) ( not ( = ?auto_356243 ?auto_356246 ) ) ( not ( = ?auto_356243 ?auto_356247 ) ) ( not ( = ?auto_356243 ?auto_356248 ) ) ( not ( = ?auto_356244 ?auto_356245 ) ) ( not ( = ?auto_356244 ?auto_356246 ) ) ( not ( = ?auto_356244 ?auto_356247 ) ) ( not ( = ?auto_356244 ?auto_356248 ) ) ( not ( = ?auto_356245 ?auto_356246 ) ) ( not ( = ?auto_356245 ?auto_356247 ) ) ( not ( = ?auto_356245 ?auto_356248 ) ) ( not ( = ?auto_356246 ?auto_356247 ) ) ( not ( = ?auto_356246 ?auto_356248 ) ) ( not ( = ?auto_356247 ?auto_356248 ) ) ( ON ?auto_356247 ?auto_356248 ) ( ON ?auto_356246 ?auto_356247 ) ( ON ?auto_356245 ?auto_356246 ) ( ON ?auto_356244 ?auto_356245 ) ( ON ?auto_356243 ?auto_356244 ) ( ON ?auto_356242 ?auto_356243 ) ( ON ?auto_356241 ?auto_356242 ) ( ON ?auto_356240 ?auto_356241 ) ( ON ?auto_356239 ?auto_356240 ) ( ON ?auto_356238 ?auto_356239 ) ( ON ?auto_356237 ?auto_356238 ) ( CLEAR ?auto_356235 ) ( ON ?auto_356236 ?auto_356237 ) ( CLEAR ?auto_356236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356235 ?auto_356236 )
      ( MAKE-14PILE ?auto_356235 ?auto_356236 ?auto_356237 ?auto_356238 ?auto_356239 ?auto_356240 ?auto_356241 ?auto_356242 ?auto_356243 ?auto_356244 ?auto_356245 ?auto_356246 ?auto_356247 ?auto_356248 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356263 - BLOCK
      ?auto_356264 - BLOCK
      ?auto_356265 - BLOCK
      ?auto_356266 - BLOCK
      ?auto_356267 - BLOCK
      ?auto_356268 - BLOCK
      ?auto_356269 - BLOCK
      ?auto_356270 - BLOCK
      ?auto_356271 - BLOCK
      ?auto_356272 - BLOCK
      ?auto_356273 - BLOCK
      ?auto_356274 - BLOCK
      ?auto_356275 - BLOCK
      ?auto_356276 - BLOCK
    )
    :vars
    (
      ?auto_356277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356276 ?auto_356277 ) ( not ( = ?auto_356263 ?auto_356264 ) ) ( not ( = ?auto_356263 ?auto_356265 ) ) ( not ( = ?auto_356263 ?auto_356266 ) ) ( not ( = ?auto_356263 ?auto_356267 ) ) ( not ( = ?auto_356263 ?auto_356268 ) ) ( not ( = ?auto_356263 ?auto_356269 ) ) ( not ( = ?auto_356263 ?auto_356270 ) ) ( not ( = ?auto_356263 ?auto_356271 ) ) ( not ( = ?auto_356263 ?auto_356272 ) ) ( not ( = ?auto_356263 ?auto_356273 ) ) ( not ( = ?auto_356263 ?auto_356274 ) ) ( not ( = ?auto_356263 ?auto_356275 ) ) ( not ( = ?auto_356263 ?auto_356276 ) ) ( not ( = ?auto_356263 ?auto_356277 ) ) ( not ( = ?auto_356264 ?auto_356265 ) ) ( not ( = ?auto_356264 ?auto_356266 ) ) ( not ( = ?auto_356264 ?auto_356267 ) ) ( not ( = ?auto_356264 ?auto_356268 ) ) ( not ( = ?auto_356264 ?auto_356269 ) ) ( not ( = ?auto_356264 ?auto_356270 ) ) ( not ( = ?auto_356264 ?auto_356271 ) ) ( not ( = ?auto_356264 ?auto_356272 ) ) ( not ( = ?auto_356264 ?auto_356273 ) ) ( not ( = ?auto_356264 ?auto_356274 ) ) ( not ( = ?auto_356264 ?auto_356275 ) ) ( not ( = ?auto_356264 ?auto_356276 ) ) ( not ( = ?auto_356264 ?auto_356277 ) ) ( not ( = ?auto_356265 ?auto_356266 ) ) ( not ( = ?auto_356265 ?auto_356267 ) ) ( not ( = ?auto_356265 ?auto_356268 ) ) ( not ( = ?auto_356265 ?auto_356269 ) ) ( not ( = ?auto_356265 ?auto_356270 ) ) ( not ( = ?auto_356265 ?auto_356271 ) ) ( not ( = ?auto_356265 ?auto_356272 ) ) ( not ( = ?auto_356265 ?auto_356273 ) ) ( not ( = ?auto_356265 ?auto_356274 ) ) ( not ( = ?auto_356265 ?auto_356275 ) ) ( not ( = ?auto_356265 ?auto_356276 ) ) ( not ( = ?auto_356265 ?auto_356277 ) ) ( not ( = ?auto_356266 ?auto_356267 ) ) ( not ( = ?auto_356266 ?auto_356268 ) ) ( not ( = ?auto_356266 ?auto_356269 ) ) ( not ( = ?auto_356266 ?auto_356270 ) ) ( not ( = ?auto_356266 ?auto_356271 ) ) ( not ( = ?auto_356266 ?auto_356272 ) ) ( not ( = ?auto_356266 ?auto_356273 ) ) ( not ( = ?auto_356266 ?auto_356274 ) ) ( not ( = ?auto_356266 ?auto_356275 ) ) ( not ( = ?auto_356266 ?auto_356276 ) ) ( not ( = ?auto_356266 ?auto_356277 ) ) ( not ( = ?auto_356267 ?auto_356268 ) ) ( not ( = ?auto_356267 ?auto_356269 ) ) ( not ( = ?auto_356267 ?auto_356270 ) ) ( not ( = ?auto_356267 ?auto_356271 ) ) ( not ( = ?auto_356267 ?auto_356272 ) ) ( not ( = ?auto_356267 ?auto_356273 ) ) ( not ( = ?auto_356267 ?auto_356274 ) ) ( not ( = ?auto_356267 ?auto_356275 ) ) ( not ( = ?auto_356267 ?auto_356276 ) ) ( not ( = ?auto_356267 ?auto_356277 ) ) ( not ( = ?auto_356268 ?auto_356269 ) ) ( not ( = ?auto_356268 ?auto_356270 ) ) ( not ( = ?auto_356268 ?auto_356271 ) ) ( not ( = ?auto_356268 ?auto_356272 ) ) ( not ( = ?auto_356268 ?auto_356273 ) ) ( not ( = ?auto_356268 ?auto_356274 ) ) ( not ( = ?auto_356268 ?auto_356275 ) ) ( not ( = ?auto_356268 ?auto_356276 ) ) ( not ( = ?auto_356268 ?auto_356277 ) ) ( not ( = ?auto_356269 ?auto_356270 ) ) ( not ( = ?auto_356269 ?auto_356271 ) ) ( not ( = ?auto_356269 ?auto_356272 ) ) ( not ( = ?auto_356269 ?auto_356273 ) ) ( not ( = ?auto_356269 ?auto_356274 ) ) ( not ( = ?auto_356269 ?auto_356275 ) ) ( not ( = ?auto_356269 ?auto_356276 ) ) ( not ( = ?auto_356269 ?auto_356277 ) ) ( not ( = ?auto_356270 ?auto_356271 ) ) ( not ( = ?auto_356270 ?auto_356272 ) ) ( not ( = ?auto_356270 ?auto_356273 ) ) ( not ( = ?auto_356270 ?auto_356274 ) ) ( not ( = ?auto_356270 ?auto_356275 ) ) ( not ( = ?auto_356270 ?auto_356276 ) ) ( not ( = ?auto_356270 ?auto_356277 ) ) ( not ( = ?auto_356271 ?auto_356272 ) ) ( not ( = ?auto_356271 ?auto_356273 ) ) ( not ( = ?auto_356271 ?auto_356274 ) ) ( not ( = ?auto_356271 ?auto_356275 ) ) ( not ( = ?auto_356271 ?auto_356276 ) ) ( not ( = ?auto_356271 ?auto_356277 ) ) ( not ( = ?auto_356272 ?auto_356273 ) ) ( not ( = ?auto_356272 ?auto_356274 ) ) ( not ( = ?auto_356272 ?auto_356275 ) ) ( not ( = ?auto_356272 ?auto_356276 ) ) ( not ( = ?auto_356272 ?auto_356277 ) ) ( not ( = ?auto_356273 ?auto_356274 ) ) ( not ( = ?auto_356273 ?auto_356275 ) ) ( not ( = ?auto_356273 ?auto_356276 ) ) ( not ( = ?auto_356273 ?auto_356277 ) ) ( not ( = ?auto_356274 ?auto_356275 ) ) ( not ( = ?auto_356274 ?auto_356276 ) ) ( not ( = ?auto_356274 ?auto_356277 ) ) ( not ( = ?auto_356275 ?auto_356276 ) ) ( not ( = ?auto_356275 ?auto_356277 ) ) ( not ( = ?auto_356276 ?auto_356277 ) ) ( ON ?auto_356275 ?auto_356276 ) ( ON ?auto_356274 ?auto_356275 ) ( ON ?auto_356273 ?auto_356274 ) ( ON ?auto_356272 ?auto_356273 ) ( ON ?auto_356271 ?auto_356272 ) ( ON ?auto_356270 ?auto_356271 ) ( ON ?auto_356269 ?auto_356270 ) ( ON ?auto_356268 ?auto_356269 ) ( ON ?auto_356267 ?auto_356268 ) ( ON ?auto_356266 ?auto_356267 ) ( ON ?auto_356265 ?auto_356266 ) ( ON ?auto_356264 ?auto_356265 ) ( ON ?auto_356263 ?auto_356264 ) ( CLEAR ?auto_356263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356263 )
      ( MAKE-14PILE ?auto_356263 ?auto_356264 ?auto_356265 ?auto_356266 ?auto_356267 ?auto_356268 ?auto_356269 ?auto_356270 ?auto_356271 ?auto_356272 ?auto_356273 ?auto_356274 ?auto_356275 ?auto_356276 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356292 - BLOCK
      ?auto_356293 - BLOCK
      ?auto_356294 - BLOCK
      ?auto_356295 - BLOCK
      ?auto_356296 - BLOCK
      ?auto_356297 - BLOCK
      ?auto_356298 - BLOCK
      ?auto_356299 - BLOCK
      ?auto_356300 - BLOCK
      ?auto_356301 - BLOCK
      ?auto_356302 - BLOCK
      ?auto_356303 - BLOCK
      ?auto_356304 - BLOCK
      ?auto_356305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_356305 ) ( not ( = ?auto_356292 ?auto_356293 ) ) ( not ( = ?auto_356292 ?auto_356294 ) ) ( not ( = ?auto_356292 ?auto_356295 ) ) ( not ( = ?auto_356292 ?auto_356296 ) ) ( not ( = ?auto_356292 ?auto_356297 ) ) ( not ( = ?auto_356292 ?auto_356298 ) ) ( not ( = ?auto_356292 ?auto_356299 ) ) ( not ( = ?auto_356292 ?auto_356300 ) ) ( not ( = ?auto_356292 ?auto_356301 ) ) ( not ( = ?auto_356292 ?auto_356302 ) ) ( not ( = ?auto_356292 ?auto_356303 ) ) ( not ( = ?auto_356292 ?auto_356304 ) ) ( not ( = ?auto_356292 ?auto_356305 ) ) ( not ( = ?auto_356293 ?auto_356294 ) ) ( not ( = ?auto_356293 ?auto_356295 ) ) ( not ( = ?auto_356293 ?auto_356296 ) ) ( not ( = ?auto_356293 ?auto_356297 ) ) ( not ( = ?auto_356293 ?auto_356298 ) ) ( not ( = ?auto_356293 ?auto_356299 ) ) ( not ( = ?auto_356293 ?auto_356300 ) ) ( not ( = ?auto_356293 ?auto_356301 ) ) ( not ( = ?auto_356293 ?auto_356302 ) ) ( not ( = ?auto_356293 ?auto_356303 ) ) ( not ( = ?auto_356293 ?auto_356304 ) ) ( not ( = ?auto_356293 ?auto_356305 ) ) ( not ( = ?auto_356294 ?auto_356295 ) ) ( not ( = ?auto_356294 ?auto_356296 ) ) ( not ( = ?auto_356294 ?auto_356297 ) ) ( not ( = ?auto_356294 ?auto_356298 ) ) ( not ( = ?auto_356294 ?auto_356299 ) ) ( not ( = ?auto_356294 ?auto_356300 ) ) ( not ( = ?auto_356294 ?auto_356301 ) ) ( not ( = ?auto_356294 ?auto_356302 ) ) ( not ( = ?auto_356294 ?auto_356303 ) ) ( not ( = ?auto_356294 ?auto_356304 ) ) ( not ( = ?auto_356294 ?auto_356305 ) ) ( not ( = ?auto_356295 ?auto_356296 ) ) ( not ( = ?auto_356295 ?auto_356297 ) ) ( not ( = ?auto_356295 ?auto_356298 ) ) ( not ( = ?auto_356295 ?auto_356299 ) ) ( not ( = ?auto_356295 ?auto_356300 ) ) ( not ( = ?auto_356295 ?auto_356301 ) ) ( not ( = ?auto_356295 ?auto_356302 ) ) ( not ( = ?auto_356295 ?auto_356303 ) ) ( not ( = ?auto_356295 ?auto_356304 ) ) ( not ( = ?auto_356295 ?auto_356305 ) ) ( not ( = ?auto_356296 ?auto_356297 ) ) ( not ( = ?auto_356296 ?auto_356298 ) ) ( not ( = ?auto_356296 ?auto_356299 ) ) ( not ( = ?auto_356296 ?auto_356300 ) ) ( not ( = ?auto_356296 ?auto_356301 ) ) ( not ( = ?auto_356296 ?auto_356302 ) ) ( not ( = ?auto_356296 ?auto_356303 ) ) ( not ( = ?auto_356296 ?auto_356304 ) ) ( not ( = ?auto_356296 ?auto_356305 ) ) ( not ( = ?auto_356297 ?auto_356298 ) ) ( not ( = ?auto_356297 ?auto_356299 ) ) ( not ( = ?auto_356297 ?auto_356300 ) ) ( not ( = ?auto_356297 ?auto_356301 ) ) ( not ( = ?auto_356297 ?auto_356302 ) ) ( not ( = ?auto_356297 ?auto_356303 ) ) ( not ( = ?auto_356297 ?auto_356304 ) ) ( not ( = ?auto_356297 ?auto_356305 ) ) ( not ( = ?auto_356298 ?auto_356299 ) ) ( not ( = ?auto_356298 ?auto_356300 ) ) ( not ( = ?auto_356298 ?auto_356301 ) ) ( not ( = ?auto_356298 ?auto_356302 ) ) ( not ( = ?auto_356298 ?auto_356303 ) ) ( not ( = ?auto_356298 ?auto_356304 ) ) ( not ( = ?auto_356298 ?auto_356305 ) ) ( not ( = ?auto_356299 ?auto_356300 ) ) ( not ( = ?auto_356299 ?auto_356301 ) ) ( not ( = ?auto_356299 ?auto_356302 ) ) ( not ( = ?auto_356299 ?auto_356303 ) ) ( not ( = ?auto_356299 ?auto_356304 ) ) ( not ( = ?auto_356299 ?auto_356305 ) ) ( not ( = ?auto_356300 ?auto_356301 ) ) ( not ( = ?auto_356300 ?auto_356302 ) ) ( not ( = ?auto_356300 ?auto_356303 ) ) ( not ( = ?auto_356300 ?auto_356304 ) ) ( not ( = ?auto_356300 ?auto_356305 ) ) ( not ( = ?auto_356301 ?auto_356302 ) ) ( not ( = ?auto_356301 ?auto_356303 ) ) ( not ( = ?auto_356301 ?auto_356304 ) ) ( not ( = ?auto_356301 ?auto_356305 ) ) ( not ( = ?auto_356302 ?auto_356303 ) ) ( not ( = ?auto_356302 ?auto_356304 ) ) ( not ( = ?auto_356302 ?auto_356305 ) ) ( not ( = ?auto_356303 ?auto_356304 ) ) ( not ( = ?auto_356303 ?auto_356305 ) ) ( not ( = ?auto_356304 ?auto_356305 ) ) ( ON ?auto_356304 ?auto_356305 ) ( ON ?auto_356303 ?auto_356304 ) ( ON ?auto_356302 ?auto_356303 ) ( ON ?auto_356301 ?auto_356302 ) ( ON ?auto_356300 ?auto_356301 ) ( ON ?auto_356299 ?auto_356300 ) ( ON ?auto_356298 ?auto_356299 ) ( ON ?auto_356297 ?auto_356298 ) ( ON ?auto_356296 ?auto_356297 ) ( ON ?auto_356295 ?auto_356296 ) ( ON ?auto_356294 ?auto_356295 ) ( ON ?auto_356293 ?auto_356294 ) ( ON ?auto_356292 ?auto_356293 ) ( CLEAR ?auto_356292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356292 )
      ( MAKE-14PILE ?auto_356292 ?auto_356293 ?auto_356294 ?auto_356295 ?auto_356296 ?auto_356297 ?auto_356298 ?auto_356299 ?auto_356300 ?auto_356301 ?auto_356302 ?auto_356303 ?auto_356304 ?auto_356305 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_356320 - BLOCK
      ?auto_356321 - BLOCK
      ?auto_356322 - BLOCK
      ?auto_356323 - BLOCK
      ?auto_356324 - BLOCK
      ?auto_356325 - BLOCK
      ?auto_356326 - BLOCK
      ?auto_356327 - BLOCK
      ?auto_356328 - BLOCK
      ?auto_356329 - BLOCK
      ?auto_356330 - BLOCK
      ?auto_356331 - BLOCK
      ?auto_356332 - BLOCK
      ?auto_356333 - BLOCK
    )
    :vars
    (
      ?auto_356334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_356320 ?auto_356321 ) ) ( not ( = ?auto_356320 ?auto_356322 ) ) ( not ( = ?auto_356320 ?auto_356323 ) ) ( not ( = ?auto_356320 ?auto_356324 ) ) ( not ( = ?auto_356320 ?auto_356325 ) ) ( not ( = ?auto_356320 ?auto_356326 ) ) ( not ( = ?auto_356320 ?auto_356327 ) ) ( not ( = ?auto_356320 ?auto_356328 ) ) ( not ( = ?auto_356320 ?auto_356329 ) ) ( not ( = ?auto_356320 ?auto_356330 ) ) ( not ( = ?auto_356320 ?auto_356331 ) ) ( not ( = ?auto_356320 ?auto_356332 ) ) ( not ( = ?auto_356320 ?auto_356333 ) ) ( not ( = ?auto_356321 ?auto_356322 ) ) ( not ( = ?auto_356321 ?auto_356323 ) ) ( not ( = ?auto_356321 ?auto_356324 ) ) ( not ( = ?auto_356321 ?auto_356325 ) ) ( not ( = ?auto_356321 ?auto_356326 ) ) ( not ( = ?auto_356321 ?auto_356327 ) ) ( not ( = ?auto_356321 ?auto_356328 ) ) ( not ( = ?auto_356321 ?auto_356329 ) ) ( not ( = ?auto_356321 ?auto_356330 ) ) ( not ( = ?auto_356321 ?auto_356331 ) ) ( not ( = ?auto_356321 ?auto_356332 ) ) ( not ( = ?auto_356321 ?auto_356333 ) ) ( not ( = ?auto_356322 ?auto_356323 ) ) ( not ( = ?auto_356322 ?auto_356324 ) ) ( not ( = ?auto_356322 ?auto_356325 ) ) ( not ( = ?auto_356322 ?auto_356326 ) ) ( not ( = ?auto_356322 ?auto_356327 ) ) ( not ( = ?auto_356322 ?auto_356328 ) ) ( not ( = ?auto_356322 ?auto_356329 ) ) ( not ( = ?auto_356322 ?auto_356330 ) ) ( not ( = ?auto_356322 ?auto_356331 ) ) ( not ( = ?auto_356322 ?auto_356332 ) ) ( not ( = ?auto_356322 ?auto_356333 ) ) ( not ( = ?auto_356323 ?auto_356324 ) ) ( not ( = ?auto_356323 ?auto_356325 ) ) ( not ( = ?auto_356323 ?auto_356326 ) ) ( not ( = ?auto_356323 ?auto_356327 ) ) ( not ( = ?auto_356323 ?auto_356328 ) ) ( not ( = ?auto_356323 ?auto_356329 ) ) ( not ( = ?auto_356323 ?auto_356330 ) ) ( not ( = ?auto_356323 ?auto_356331 ) ) ( not ( = ?auto_356323 ?auto_356332 ) ) ( not ( = ?auto_356323 ?auto_356333 ) ) ( not ( = ?auto_356324 ?auto_356325 ) ) ( not ( = ?auto_356324 ?auto_356326 ) ) ( not ( = ?auto_356324 ?auto_356327 ) ) ( not ( = ?auto_356324 ?auto_356328 ) ) ( not ( = ?auto_356324 ?auto_356329 ) ) ( not ( = ?auto_356324 ?auto_356330 ) ) ( not ( = ?auto_356324 ?auto_356331 ) ) ( not ( = ?auto_356324 ?auto_356332 ) ) ( not ( = ?auto_356324 ?auto_356333 ) ) ( not ( = ?auto_356325 ?auto_356326 ) ) ( not ( = ?auto_356325 ?auto_356327 ) ) ( not ( = ?auto_356325 ?auto_356328 ) ) ( not ( = ?auto_356325 ?auto_356329 ) ) ( not ( = ?auto_356325 ?auto_356330 ) ) ( not ( = ?auto_356325 ?auto_356331 ) ) ( not ( = ?auto_356325 ?auto_356332 ) ) ( not ( = ?auto_356325 ?auto_356333 ) ) ( not ( = ?auto_356326 ?auto_356327 ) ) ( not ( = ?auto_356326 ?auto_356328 ) ) ( not ( = ?auto_356326 ?auto_356329 ) ) ( not ( = ?auto_356326 ?auto_356330 ) ) ( not ( = ?auto_356326 ?auto_356331 ) ) ( not ( = ?auto_356326 ?auto_356332 ) ) ( not ( = ?auto_356326 ?auto_356333 ) ) ( not ( = ?auto_356327 ?auto_356328 ) ) ( not ( = ?auto_356327 ?auto_356329 ) ) ( not ( = ?auto_356327 ?auto_356330 ) ) ( not ( = ?auto_356327 ?auto_356331 ) ) ( not ( = ?auto_356327 ?auto_356332 ) ) ( not ( = ?auto_356327 ?auto_356333 ) ) ( not ( = ?auto_356328 ?auto_356329 ) ) ( not ( = ?auto_356328 ?auto_356330 ) ) ( not ( = ?auto_356328 ?auto_356331 ) ) ( not ( = ?auto_356328 ?auto_356332 ) ) ( not ( = ?auto_356328 ?auto_356333 ) ) ( not ( = ?auto_356329 ?auto_356330 ) ) ( not ( = ?auto_356329 ?auto_356331 ) ) ( not ( = ?auto_356329 ?auto_356332 ) ) ( not ( = ?auto_356329 ?auto_356333 ) ) ( not ( = ?auto_356330 ?auto_356331 ) ) ( not ( = ?auto_356330 ?auto_356332 ) ) ( not ( = ?auto_356330 ?auto_356333 ) ) ( not ( = ?auto_356331 ?auto_356332 ) ) ( not ( = ?auto_356331 ?auto_356333 ) ) ( not ( = ?auto_356332 ?auto_356333 ) ) ( ON ?auto_356320 ?auto_356334 ) ( not ( = ?auto_356333 ?auto_356334 ) ) ( not ( = ?auto_356332 ?auto_356334 ) ) ( not ( = ?auto_356331 ?auto_356334 ) ) ( not ( = ?auto_356330 ?auto_356334 ) ) ( not ( = ?auto_356329 ?auto_356334 ) ) ( not ( = ?auto_356328 ?auto_356334 ) ) ( not ( = ?auto_356327 ?auto_356334 ) ) ( not ( = ?auto_356326 ?auto_356334 ) ) ( not ( = ?auto_356325 ?auto_356334 ) ) ( not ( = ?auto_356324 ?auto_356334 ) ) ( not ( = ?auto_356323 ?auto_356334 ) ) ( not ( = ?auto_356322 ?auto_356334 ) ) ( not ( = ?auto_356321 ?auto_356334 ) ) ( not ( = ?auto_356320 ?auto_356334 ) ) ( ON ?auto_356321 ?auto_356320 ) ( ON ?auto_356322 ?auto_356321 ) ( ON ?auto_356323 ?auto_356322 ) ( ON ?auto_356324 ?auto_356323 ) ( ON ?auto_356325 ?auto_356324 ) ( ON ?auto_356326 ?auto_356325 ) ( ON ?auto_356327 ?auto_356326 ) ( ON ?auto_356328 ?auto_356327 ) ( ON ?auto_356329 ?auto_356328 ) ( ON ?auto_356330 ?auto_356329 ) ( ON ?auto_356331 ?auto_356330 ) ( ON ?auto_356332 ?auto_356331 ) ( ON ?auto_356333 ?auto_356332 ) ( CLEAR ?auto_356333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_356333 ?auto_356332 ?auto_356331 ?auto_356330 ?auto_356329 ?auto_356328 ?auto_356327 ?auto_356326 ?auto_356325 ?auto_356324 ?auto_356323 ?auto_356322 ?auto_356321 ?auto_356320 )
      ( MAKE-14PILE ?auto_356320 ?auto_356321 ?auto_356322 ?auto_356323 ?auto_356324 ?auto_356325 ?auto_356326 ?auto_356327 ?auto_356328 ?auto_356329 ?auto_356330 ?auto_356331 ?auto_356332 ?auto_356333 ) )
  )

)

