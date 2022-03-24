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
      ?auto_810057 - BLOCK
    )
    :vars
    (
      ?auto_810058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810057 ?auto_810058 ) ( CLEAR ?auto_810057 ) ( HAND-EMPTY ) ( not ( = ?auto_810057 ?auto_810058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810057 ?auto_810058 )
      ( !PUTDOWN ?auto_810057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_810064 - BLOCK
      ?auto_810065 - BLOCK
    )
    :vars
    (
      ?auto_810066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810064 ) ( ON ?auto_810065 ?auto_810066 ) ( CLEAR ?auto_810065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810064 ) ( not ( = ?auto_810064 ?auto_810065 ) ) ( not ( = ?auto_810064 ?auto_810066 ) ) ( not ( = ?auto_810065 ?auto_810066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810065 ?auto_810066 )
      ( !STACK ?auto_810065 ?auto_810064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_810074 - BLOCK
      ?auto_810075 - BLOCK
    )
    :vars
    (
      ?auto_810076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810075 ?auto_810076 ) ( not ( = ?auto_810074 ?auto_810075 ) ) ( not ( = ?auto_810074 ?auto_810076 ) ) ( not ( = ?auto_810075 ?auto_810076 ) ) ( ON ?auto_810074 ?auto_810075 ) ( CLEAR ?auto_810074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810074 )
      ( MAKE-2PILE ?auto_810074 ?auto_810075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_810085 - BLOCK
      ?auto_810086 - BLOCK
      ?auto_810087 - BLOCK
    )
    :vars
    (
      ?auto_810088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810086 ) ( ON ?auto_810087 ?auto_810088 ) ( CLEAR ?auto_810087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810085 ) ( ON ?auto_810086 ?auto_810085 ) ( not ( = ?auto_810085 ?auto_810086 ) ) ( not ( = ?auto_810085 ?auto_810087 ) ) ( not ( = ?auto_810085 ?auto_810088 ) ) ( not ( = ?auto_810086 ?auto_810087 ) ) ( not ( = ?auto_810086 ?auto_810088 ) ) ( not ( = ?auto_810087 ?auto_810088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810087 ?auto_810088 )
      ( !STACK ?auto_810087 ?auto_810086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_810099 - BLOCK
      ?auto_810100 - BLOCK
      ?auto_810101 - BLOCK
    )
    :vars
    (
      ?auto_810102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810101 ?auto_810102 ) ( ON-TABLE ?auto_810099 ) ( not ( = ?auto_810099 ?auto_810100 ) ) ( not ( = ?auto_810099 ?auto_810101 ) ) ( not ( = ?auto_810099 ?auto_810102 ) ) ( not ( = ?auto_810100 ?auto_810101 ) ) ( not ( = ?auto_810100 ?auto_810102 ) ) ( not ( = ?auto_810101 ?auto_810102 ) ) ( CLEAR ?auto_810099 ) ( ON ?auto_810100 ?auto_810101 ) ( CLEAR ?auto_810100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810099 ?auto_810100 )
      ( MAKE-3PILE ?auto_810099 ?auto_810100 ?auto_810101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_810113 - BLOCK
      ?auto_810114 - BLOCK
      ?auto_810115 - BLOCK
    )
    :vars
    (
      ?auto_810116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810115 ?auto_810116 ) ( not ( = ?auto_810113 ?auto_810114 ) ) ( not ( = ?auto_810113 ?auto_810115 ) ) ( not ( = ?auto_810113 ?auto_810116 ) ) ( not ( = ?auto_810114 ?auto_810115 ) ) ( not ( = ?auto_810114 ?auto_810116 ) ) ( not ( = ?auto_810115 ?auto_810116 ) ) ( ON ?auto_810114 ?auto_810115 ) ( ON ?auto_810113 ?auto_810114 ) ( CLEAR ?auto_810113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810113 )
      ( MAKE-3PILE ?auto_810113 ?auto_810114 ?auto_810115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_810128 - BLOCK
      ?auto_810129 - BLOCK
      ?auto_810130 - BLOCK
      ?auto_810131 - BLOCK
    )
    :vars
    (
      ?auto_810132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810130 ) ( ON ?auto_810131 ?auto_810132 ) ( CLEAR ?auto_810131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810128 ) ( ON ?auto_810129 ?auto_810128 ) ( ON ?auto_810130 ?auto_810129 ) ( not ( = ?auto_810128 ?auto_810129 ) ) ( not ( = ?auto_810128 ?auto_810130 ) ) ( not ( = ?auto_810128 ?auto_810131 ) ) ( not ( = ?auto_810128 ?auto_810132 ) ) ( not ( = ?auto_810129 ?auto_810130 ) ) ( not ( = ?auto_810129 ?auto_810131 ) ) ( not ( = ?auto_810129 ?auto_810132 ) ) ( not ( = ?auto_810130 ?auto_810131 ) ) ( not ( = ?auto_810130 ?auto_810132 ) ) ( not ( = ?auto_810131 ?auto_810132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810131 ?auto_810132 )
      ( !STACK ?auto_810131 ?auto_810130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_810146 - BLOCK
      ?auto_810147 - BLOCK
      ?auto_810148 - BLOCK
      ?auto_810149 - BLOCK
    )
    :vars
    (
      ?auto_810150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810149 ?auto_810150 ) ( ON-TABLE ?auto_810146 ) ( ON ?auto_810147 ?auto_810146 ) ( not ( = ?auto_810146 ?auto_810147 ) ) ( not ( = ?auto_810146 ?auto_810148 ) ) ( not ( = ?auto_810146 ?auto_810149 ) ) ( not ( = ?auto_810146 ?auto_810150 ) ) ( not ( = ?auto_810147 ?auto_810148 ) ) ( not ( = ?auto_810147 ?auto_810149 ) ) ( not ( = ?auto_810147 ?auto_810150 ) ) ( not ( = ?auto_810148 ?auto_810149 ) ) ( not ( = ?auto_810148 ?auto_810150 ) ) ( not ( = ?auto_810149 ?auto_810150 ) ) ( CLEAR ?auto_810147 ) ( ON ?auto_810148 ?auto_810149 ) ( CLEAR ?auto_810148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_810146 ?auto_810147 ?auto_810148 )
      ( MAKE-4PILE ?auto_810146 ?auto_810147 ?auto_810148 ?auto_810149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_810164 - BLOCK
      ?auto_810165 - BLOCK
      ?auto_810166 - BLOCK
      ?auto_810167 - BLOCK
    )
    :vars
    (
      ?auto_810168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810167 ?auto_810168 ) ( ON-TABLE ?auto_810164 ) ( not ( = ?auto_810164 ?auto_810165 ) ) ( not ( = ?auto_810164 ?auto_810166 ) ) ( not ( = ?auto_810164 ?auto_810167 ) ) ( not ( = ?auto_810164 ?auto_810168 ) ) ( not ( = ?auto_810165 ?auto_810166 ) ) ( not ( = ?auto_810165 ?auto_810167 ) ) ( not ( = ?auto_810165 ?auto_810168 ) ) ( not ( = ?auto_810166 ?auto_810167 ) ) ( not ( = ?auto_810166 ?auto_810168 ) ) ( not ( = ?auto_810167 ?auto_810168 ) ) ( ON ?auto_810166 ?auto_810167 ) ( CLEAR ?auto_810164 ) ( ON ?auto_810165 ?auto_810166 ) ( CLEAR ?auto_810165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810164 ?auto_810165 )
      ( MAKE-4PILE ?auto_810164 ?auto_810165 ?auto_810166 ?auto_810167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_810182 - BLOCK
      ?auto_810183 - BLOCK
      ?auto_810184 - BLOCK
      ?auto_810185 - BLOCK
    )
    :vars
    (
      ?auto_810186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810185 ?auto_810186 ) ( not ( = ?auto_810182 ?auto_810183 ) ) ( not ( = ?auto_810182 ?auto_810184 ) ) ( not ( = ?auto_810182 ?auto_810185 ) ) ( not ( = ?auto_810182 ?auto_810186 ) ) ( not ( = ?auto_810183 ?auto_810184 ) ) ( not ( = ?auto_810183 ?auto_810185 ) ) ( not ( = ?auto_810183 ?auto_810186 ) ) ( not ( = ?auto_810184 ?auto_810185 ) ) ( not ( = ?auto_810184 ?auto_810186 ) ) ( not ( = ?auto_810185 ?auto_810186 ) ) ( ON ?auto_810184 ?auto_810185 ) ( ON ?auto_810183 ?auto_810184 ) ( ON ?auto_810182 ?auto_810183 ) ( CLEAR ?auto_810182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810182 )
      ( MAKE-4PILE ?auto_810182 ?auto_810183 ?auto_810184 ?auto_810185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_810201 - BLOCK
      ?auto_810202 - BLOCK
      ?auto_810203 - BLOCK
      ?auto_810204 - BLOCK
      ?auto_810205 - BLOCK
    )
    :vars
    (
      ?auto_810206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810204 ) ( ON ?auto_810205 ?auto_810206 ) ( CLEAR ?auto_810205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810201 ) ( ON ?auto_810202 ?auto_810201 ) ( ON ?auto_810203 ?auto_810202 ) ( ON ?auto_810204 ?auto_810203 ) ( not ( = ?auto_810201 ?auto_810202 ) ) ( not ( = ?auto_810201 ?auto_810203 ) ) ( not ( = ?auto_810201 ?auto_810204 ) ) ( not ( = ?auto_810201 ?auto_810205 ) ) ( not ( = ?auto_810201 ?auto_810206 ) ) ( not ( = ?auto_810202 ?auto_810203 ) ) ( not ( = ?auto_810202 ?auto_810204 ) ) ( not ( = ?auto_810202 ?auto_810205 ) ) ( not ( = ?auto_810202 ?auto_810206 ) ) ( not ( = ?auto_810203 ?auto_810204 ) ) ( not ( = ?auto_810203 ?auto_810205 ) ) ( not ( = ?auto_810203 ?auto_810206 ) ) ( not ( = ?auto_810204 ?auto_810205 ) ) ( not ( = ?auto_810204 ?auto_810206 ) ) ( not ( = ?auto_810205 ?auto_810206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810205 ?auto_810206 )
      ( !STACK ?auto_810205 ?auto_810204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_810223 - BLOCK
      ?auto_810224 - BLOCK
      ?auto_810225 - BLOCK
      ?auto_810226 - BLOCK
      ?auto_810227 - BLOCK
    )
    :vars
    (
      ?auto_810228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810227 ?auto_810228 ) ( ON-TABLE ?auto_810223 ) ( ON ?auto_810224 ?auto_810223 ) ( ON ?auto_810225 ?auto_810224 ) ( not ( = ?auto_810223 ?auto_810224 ) ) ( not ( = ?auto_810223 ?auto_810225 ) ) ( not ( = ?auto_810223 ?auto_810226 ) ) ( not ( = ?auto_810223 ?auto_810227 ) ) ( not ( = ?auto_810223 ?auto_810228 ) ) ( not ( = ?auto_810224 ?auto_810225 ) ) ( not ( = ?auto_810224 ?auto_810226 ) ) ( not ( = ?auto_810224 ?auto_810227 ) ) ( not ( = ?auto_810224 ?auto_810228 ) ) ( not ( = ?auto_810225 ?auto_810226 ) ) ( not ( = ?auto_810225 ?auto_810227 ) ) ( not ( = ?auto_810225 ?auto_810228 ) ) ( not ( = ?auto_810226 ?auto_810227 ) ) ( not ( = ?auto_810226 ?auto_810228 ) ) ( not ( = ?auto_810227 ?auto_810228 ) ) ( CLEAR ?auto_810225 ) ( ON ?auto_810226 ?auto_810227 ) ( CLEAR ?auto_810226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_810223 ?auto_810224 ?auto_810225 ?auto_810226 )
      ( MAKE-5PILE ?auto_810223 ?auto_810224 ?auto_810225 ?auto_810226 ?auto_810227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_810245 - BLOCK
      ?auto_810246 - BLOCK
      ?auto_810247 - BLOCK
      ?auto_810248 - BLOCK
      ?auto_810249 - BLOCK
    )
    :vars
    (
      ?auto_810250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810249 ?auto_810250 ) ( ON-TABLE ?auto_810245 ) ( ON ?auto_810246 ?auto_810245 ) ( not ( = ?auto_810245 ?auto_810246 ) ) ( not ( = ?auto_810245 ?auto_810247 ) ) ( not ( = ?auto_810245 ?auto_810248 ) ) ( not ( = ?auto_810245 ?auto_810249 ) ) ( not ( = ?auto_810245 ?auto_810250 ) ) ( not ( = ?auto_810246 ?auto_810247 ) ) ( not ( = ?auto_810246 ?auto_810248 ) ) ( not ( = ?auto_810246 ?auto_810249 ) ) ( not ( = ?auto_810246 ?auto_810250 ) ) ( not ( = ?auto_810247 ?auto_810248 ) ) ( not ( = ?auto_810247 ?auto_810249 ) ) ( not ( = ?auto_810247 ?auto_810250 ) ) ( not ( = ?auto_810248 ?auto_810249 ) ) ( not ( = ?auto_810248 ?auto_810250 ) ) ( not ( = ?auto_810249 ?auto_810250 ) ) ( ON ?auto_810248 ?auto_810249 ) ( CLEAR ?auto_810246 ) ( ON ?auto_810247 ?auto_810248 ) ( CLEAR ?auto_810247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_810245 ?auto_810246 ?auto_810247 )
      ( MAKE-5PILE ?auto_810245 ?auto_810246 ?auto_810247 ?auto_810248 ?auto_810249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_810267 - BLOCK
      ?auto_810268 - BLOCK
      ?auto_810269 - BLOCK
      ?auto_810270 - BLOCK
      ?auto_810271 - BLOCK
    )
    :vars
    (
      ?auto_810272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810271 ?auto_810272 ) ( ON-TABLE ?auto_810267 ) ( not ( = ?auto_810267 ?auto_810268 ) ) ( not ( = ?auto_810267 ?auto_810269 ) ) ( not ( = ?auto_810267 ?auto_810270 ) ) ( not ( = ?auto_810267 ?auto_810271 ) ) ( not ( = ?auto_810267 ?auto_810272 ) ) ( not ( = ?auto_810268 ?auto_810269 ) ) ( not ( = ?auto_810268 ?auto_810270 ) ) ( not ( = ?auto_810268 ?auto_810271 ) ) ( not ( = ?auto_810268 ?auto_810272 ) ) ( not ( = ?auto_810269 ?auto_810270 ) ) ( not ( = ?auto_810269 ?auto_810271 ) ) ( not ( = ?auto_810269 ?auto_810272 ) ) ( not ( = ?auto_810270 ?auto_810271 ) ) ( not ( = ?auto_810270 ?auto_810272 ) ) ( not ( = ?auto_810271 ?auto_810272 ) ) ( ON ?auto_810270 ?auto_810271 ) ( ON ?auto_810269 ?auto_810270 ) ( CLEAR ?auto_810267 ) ( ON ?auto_810268 ?auto_810269 ) ( CLEAR ?auto_810268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810267 ?auto_810268 )
      ( MAKE-5PILE ?auto_810267 ?auto_810268 ?auto_810269 ?auto_810270 ?auto_810271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_810289 - BLOCK
      ?auto_810290 - BLOCK
      ?auto_810291 - BLOCK
      ?auto_810292 - BLOCK
      ?auto_810293 - BLOCK
    )
    :vars
    (
      ?auto_810294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810293 ?auto_810294 ) ( not ( = ?auto_810289 ?auto_810290 ) ) ( not ( = ?auto_810289 ?auto_810291 ) ) ( not ( = ?auto_810289 ?auto_810292 ) ) ( not ( = ?auto_810289 ?auto_810293 ) ) ( not ( = ?auto_810289 ?auto_810294 ) ) ( not ( = ?auto_810290 ?auto_810291 ) ) ( not ( = ?auto_810290 ?auto_810292 ) ) ( not ( = ?auto_810290 ?auto_810293 ) ) ( not ( = ?auto_810290 ?auto_810294 ) ) ( not ( = ?auto_810291 ?auto_810292 ) ) ( not ( = ?auto_810291 ?auto_810293 ) ) ( not ( = ?auto_810291 ?auto_810294 ) ) ( not ( = ?auto_810292 ?auto_810293 ) ) ( not ( = ?auto_810292 ?auto_810294 ) ) ( not ( = ?auto_810293 ?auto_810294 ) ) ( ON ?auto_810292 ?auto_810293 ) ( ON ?auto_810291 ?auto_810292 ) ( ON ?auto_810290 ?auto_810291 ) ( ON ?auto_810289 ?auto_810290 ) ( CLEAR ?auto_810289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810289 )
      ( MAKE-5PILE ?auto_810289 ?auto_810290 ?auto_810291 ?auto_810292 ?auto_810293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810312 - BLOCK
      ?auto_810313 - BLOCK
      ?auto_810314 - BLOCK
      ?auto_810315 - BLOCK
      ?auto_810316 - BLOCK
      ?auto_810317 - BLOCK
    )
    :vars
    (
      ?auto_810318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810316 ) ( ON ?auto_810317 ?auto_810318 ) ( CLEAR ?auto_810317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810312 ) ( ON ?auto_810313 ?auto_810312 ) ( ON ?auto_810314 ?auto_810313 ) ( ON ?auto_810315 ?auto_810314 ) ( ON ?auto_810316 ?auto_810315 ) ( not ( = ?auto_810312 ?auto_810313 ) ) ( not ( = ?auto_810312 ?auto_810314 ) ) ( not ( = ?auto_810312 ?auto_810315 ) ) ( not ( = ?auto_810312 ?auto_810316 ) ) ( not ( = ?auto_810312 ?auto_810317 ) ) ( not ( = ?auto_810312 ?auto_810318 ) ) ( not ( = ?auto_810313 ?auto_810314 ) ) ( not ( = ?auto_810313 ?auto_810315 ) ) ( not ( = ?auto_810313 ?auto_810316 ) ) ( not ( = ?auto_810313 ?auto_810317 ) ) ( not ( = ?auto_810313 ?auto_810318 ) ) ( not ( = ?auto_810314 ?auto_810315 ) ) ( not ( = ?auto_810314 ?auto_810316 ) ) ( not ( = ?auto_810314 ?auto_810317 ) ) ( not ( = ?auto_810314 ?auto_810318 ) ) ( not ( = ?auto_810315 ?auto_810316 ) ) ( not ( = ?auto_810315 ?auto_810317 ) ) ( not ( = ?auto_810315 ?auto_810318 ) ) ( not ( = ?auto_810316 ?auto_810317 ) ) ( not ( = ?auto_810316 ?auto_810318 ) ) ( not ( = ?auto_810317 ?auto_810318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810317 ?auto_810318 )
      ( !STACK ?auto_810317 ?auto_810316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810338 - BLOCK
      ?auto_810339 - BLOCK
      ?auto_810340 - BLOCK
      ?auto_810341 - BLOCK
      ?auto_810342 - BLOCK
      ?auto_810343 - BLOCK
    )
    :vars
    (
      ?auto_810344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810343 ?auto_810344 ) ( ON-TABLE ?auto_810338 ) ( ON ?auto_810339 ?auto_810338 ) ( ON ?auto_810340 ?auto_810339 ) ( ON ?auto_810341 ?auto_810340 ) ( not ( = ?auto_810338 ?auto_810339 ) ) ( not ( = ?auto_810338 ?auto_810340 ) ) ( not ( = ?auto_810338 ?auto_810341 ) ) ( not ( = ?auto_810338 ?auto_810342 ) ) ( not ( = ?auto_810338 ?auto_810343 ) ) ( not ( = ?auto_810338 ?auto_810344 ) ) ( not ( = ?auto_810339 ?auto_810340 ) ) ( not ( = ?auto_810339 ?auto_810341 ) ) ( not ( = ?auto_810339 ?auto_810342 ) ) ( not ( = ?auto_810339 ?auto_810343 ) ) ( not ( = ?auto_810339 ?auto_810344 ) ) ( not ( = ?auto_810340 ?auto_810341 ) ) ( not ( = ?auto_810340 ?auto_810342 ) ) ( not ( = ?auto_810340 ?auto_810343 ) ) ( not ( = ?auto_810340 ?auto_810344 ) ) ( not ( = ?auto_810341 ?auto_810342 ) ) ( not ( = ?auto_810341 ?auto_810343 ) ) ( not ( = ?auto_810341 ?auto_810344 ) ) ( not ( = ?auto_810342 ?auto_810343 ) ) ( not ( = ?auto_810342 ?auto_810344 ) ) ( not ( = ?auto_810343 ?auto_810344 ) ) ( CLEAR ?auto_810341 ) ( ON ?auto_810342 ?auto_810343 ) ( CLEAR ?auto_810342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_810338 ?auto_810339 ?auto_810340 ?auto_810341 ?auto_810342 )
      ( MAKE-6PILE ?auto_810338 ?auto_810339 ?auto_810340 ?auto_810341 ?auto_810342 ?auto_810343 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810364 - BLOCK
      ?auto_810365 - BLOCK
      ?auto_810366 - BLOCK
      ?auto_810367 - BLOCK
      ?auto_810368 - BLOCK
      ?auto_810369 - BLOCK
    )
    :vars
    (
      ?auto_810370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810369 ?auto_810370 ) ( ON-TABLE ?auto_810364 ) ( ON ?auto_810365 ?auto_810364 ) ( ON ?auto_810366 ?auto_810365 ) ( not ( = ?auto_810364 ?auto_810365 ) ) ( not ( = ?auto_810364 ?auto_810366 ) ) ( not ( = ?auto_810364 ?auto_810367 ) ) ( not ( = ?auto_810364 ?auto_810368 ) ) ( not ( = ?auto_810364 ?auto_810369 ) ) ( not ( = ?auto_810364 ?auto_810370 ) ) ( not ( = ?auto_810365 ?auto_810366 ) ) ( not ( = ?auto_810365 ?auto_810367 ) ) ( not ( = ?auto_810365 ?auto_810368 ) ) ( not ( = ?auto_810365 ?auto_810369 ) ) ( not ( = ?auto_810365 ?auto_810370 ) ) ( not ( = ?auto_810366 ?auto_810367 ) ) ( not ( = ?auto_810366 ?auto_810368 ) ) ( not ( = ?auto_810366 ?auto_810369 ) ) ( not ( = ?auto_810366 ?auto_810370 ) ) ( not ( = ?auto_810367 ?auto_810368 ) ) ( not ( = ?auto_810367 ?auto_810369 ) ) ( not ( = ?auto_810367 ?auto_810370 ) ) ( not ( = ?auto_810368 ?auto_810369 ) ) ( not ( = ?auto_810368 ?auto_810370 ) ) ( not ( = ?auto_810369 ?auto_810370 ) ) ( ON ?auto_810368 ?auto_810369 ) ( CLEAR ?auto_810366 ) ( ON ?auto_810367 ?auto_810368 ) ( CLEAR ?auto_810367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_810364 ?auto_810365 ?auto_810366 ?auto_810367 )
      ( MAKE-6PILE ?auto_810364 ?auto_810365 ?auto_810366 ?auto_810367 ?auto_810368 ?auto_810369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810390 - BLOCK
      ?auto_810391 - BLOCK
      ?auto_810392 - BLOCK
      ?auto_810393 - BLOCK
      ?auto_810394 - BLOCK
      ?auto_810395 - BLOCK
    )
    :vars
    (
      ?auto_810396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810395 ?auto_810396 ) ( ON-TABLE ?auto_810390 ) ( ON ?auto_810391 ?auto_810390 ) ( not ( = ?auto_810390 ?auto_810391 ) ) ( not ( = ?auto_810390 ?auto_810392 ) ) ( not ( = ?auto_810390 ?auto_810393 ) ) ( not ( = ?auto_810390 ?auto_810394 ) ) ( not ( = ?auto_810390 ?auto_810395 ) ) ( not ( = ?auto_810390 ?auto_810396 ) ) ( not ( = ?auto_810391 ?auto_810392 ) ) ( not ( = ?auto_810391 ?auto_810393 ) ) ( not ( = ?auto_810391 ?auto_810394 ) ) ( not ( = ?auto_810391 ?auto_810395 ) ) ( not ( = ?auto_810391 ?auto_810396 ) ) ( not ( = ?auto_810392 ?auto_810393 ) ) ( not ( = ?auto_810392 ?auto_810394 ) ) ( not ( = ?auto_810392 ?auto_810395 ) ) ( not ( = ?auto_810392 ?auto_810396 ) ) ( not ( = ?auto_810393 ?auto_810394 ) ) ( not ( = ?auto_810393 ?auto_810395 ) ) ( not ( = ?auto_810393 ?auto_810396 ) ) ( not ( = ?auto_810394 ?auto_810395 ) ) ( not ( = ?auto_810394 ?auto_810396 ) ) ( not ( = ?auto_810395 ?auto_810396 ) ) ( ON ?auto_810394 ?auto_810395 ) ( ON ?auto_810393 ?auto_810394 ) ( CLEAR ?auto_810391 ) ( ON ?auto_810392 ?auto_810393 ) ( CLEAR ?auto_810392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_810390 ?auto_810391 ?auto_810392 )
      ( MAKE-6PILE ?auto_810390 ?auto_810391 ?auto_810392 ?auto_810393 ?auto_810394 ?auto_810395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810416 - BLOCK
      ?auto_810417 - BLOCK
      ?auto_810418 - BLOCK
      ?auto_810419 - BLOCK
      ?auto_810420 - BLOCK
      ?auto_810421 - BLOCK
    )
    :vars
    (
      ?auto_810422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810421 ?auto_810422 ) ( ON-TABLE ?auto_810416 ) ( not ( = ?auto_810416 ?auto_810417 ) ) ( not ( = ?auto_810416 ?auto_810418 ) ) ( not ( = ?auto_810416 ?auto_810419 ) ) ( not ( = ?auto_810416 ?auto_810420 ) ) ( not ( = ?auto_810416 ?auto_810421 ) ) ( not ( = ?auto_810416 ?auto_810422 ) ) ( not ( = ?auto_810417 ?auto_810418 ) ) ( not ( = ?auto_810417 ?auto_810419 ) ) ( not ( = ?auto_810417 ?auto_810420 ) ) ( not ( = ?auto_810417 ?auto_810421 ) ) ( not ( = ?auto_810417 ?auto_810422 ) ) ( not ( = ?auto_810418 ?auto_810419 ) ) ( not ( = ?auto_810418 ?auto_810420 ) ) ( not ( = ?auto_810418 ?auto_810421 ) ) ( not ( = ?auto_810418 ?auto_810422 ) ) ( not ( = ?auto_810419 ?auto_810420 ) ) ( not ( = ?auto_810419 ?auto_810421 ) ) ( not ( = ?auto_810419 ?auto_810422 ) ) ( not ( = ?auto_810420 ?auto_810421 ) ) ( not ( = ?auto_810420 ?auto_810422 ) ) ( not ( = ?auto_810421 ?auto_810422 ) ) ( ON ?auto_810420 ?auto_810421 ) ( ON ?auto_810419 ?auto_810420 ) ( ON ?auto_810418 ?auto_810419 ) ( CLEAR ?auto_810416 ) ( ON ?auto_810417 ?auto_810418 ) ( CLEAR ?auto_810417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810416 ?auto_810417 )
      ( MAKE-6PILE ?auto_810416 ?auto_810417 ?auto_810418 ?auto_810419 ?auto_810420 ?auto_810421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_810442 - BLOCK
      ?auto_810443 - BLOCK
      ?auto_810444 - BLOCK
      ?auto_810445 - BLOCK
      ?auto_810446 - BLOCK
      ?auto_810447 - BLOCK
    )
    :vars
    (
      ?auto_810448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810447 ?auto_810448 ) ( not ( = ?auto_810442 ?auto_810443 ) ) ( not ( = ?auto_810442 ?auto_810444 ) ) ( not ( = ?auto_810442 ?auto_810445 ) ) ( not ( = ?auto_810442 ?auto_810446 ) ) ( not ( = ?auto_810442 ?auto_810447 ) ) ( not ( = ?auto_810442 ?auto_810448 ) ) ( not ( = ?auto_810443 ?auto_810444 ) ) ( not ( = ?auto_810443 ?auto_810445 ) ) ( not ( = ?auto_810443 ?auto_810446 ) ) ( not ( = ?auto_810443 ?auto_810447 ) ) ( not ( = ?auto_810443 ?auto_810448 ) ) ( not ( = ?auto_810444 ?auto_810445 ) ) ( not ( = ?auto_810444 ?auto_810446 ) ) ( not ( = ?auto_810444 ?auto_810447 ) ) ( not ( = ?auto_810444 ?auto_810448 ) ) ( not ( = ?auto_810445 ?auto_810446 ) ) ( not ( = ?auto_810445 ?auto_810447 ) ) ( not ( = ?auto_810445 ?auto_810448 ) ) ( not ( = ?auto_810446 ?auto_810447 ) ) ( not ( = ?auto_810446 ?auto_810448 ) ) ( not ( = ?auto_810447 ?auto_810448 ) ) ( ON ?auto_810446 ?auto_810447 ) ( ON ?auto_810445 ?auto_810446 ) ( ON ?auto_810444 ?auto_810445 ) ( ON ?auto_810443 ?auto_810444 ) ( ON ?auto_810442 ?auto_810443 ) ( CLEAR ?auto_810442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810442 )
      ( MAKE-6PILE ?auto_810442 ?auto_810443 ?auto_810444 ?auto_810445 ?auto_810446 ?auto_810447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810469 - BLOCK
      ?auto_810470 - BLOCK
      ?auto_810471 - BLOCK
      ?auto_810472 - BLOCK
      ?auto_810473 - BLOCK
      ?auto_810474 - BLOCK
      ?auto_810475 - BLOCK
    )
    :vars
    (
      ?auto_810476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810474 ) ( ON ?auto_810475 ?auto_810476 ) ( CLEAR ?auto_810475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810469 ) ( ON ?auto_810470 ?auto_810469 ) ( ON ?auto_810471 ?auto_810470 ) ( ON ?auto_810472 ?auto_810471 ) ( ON ?auto_810473 ?auto_810472 ) ( ON ?auto_810474 ?auto_810473 ) ( not ( = ?auto_810469 ?auto_810470 ) ) ( not ( = ?auto_810469 ?auto_810471 ) ) ( not ( = ?auto_810469 ?auto_810472 ) ) ( not ( = ?auto_810469 ?auto_810473 ) ) ( not ( = ?auto_810469 ?auto_810474 ) ) ( not ( = ?auto_810469 ?auto_810475 ) ) ( not ( = ?auto_810469 ?auto_810476 ) ) ( not ( = ?auto_810470 ?auto_810471 ) ) ( not ( = ?auto_810470 ?auto_810472 ) ) ( not ( = ?auto_810470 ?auto_810473 ) ) ( not ( = ?auto_810470 ?auto_810474 ) ) ( not ( = ?auto_810470 ?auto_810475 ) ) ( not ( = ?auto_810470 ?auto_810476 ) ) ( not ( = ?auto_810471 ?auto_810472 ) ) ( not ( = ?auto_810471 ?auto_810473 ) ) ( not ( = ?auto_810471 ?auto_810474 ) ) ( not ( = ?auto_810471 ?auto_810475 ) ) ( not ( = ?auto_810471 ?auto_810476 ) ) ( not ( = ?auto_810472 ?auto_810473 ) ) ( not ( = ?auto_810472 ?auto_810474 ) ) ( not ( = ?auto_810472 ?auto_810475 ) ) ( not ( = ?auto_810472 ?auto_810476 ) ) ( not ( = ?auto_810473 ?auto_810474 ) ) ( not ( = ?auto_810473 ?auto_810475 ) ) ( not ( = ?auto_810473 ?auto_810476 ) ) ( not ( = ?auto_810474 ?auto_810475 ) ) ( not ( = ?auto_810474 ?auto_810476 ) ) ( not ( = ?auto_810475 ?auto_810476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810475 ?auto_810476 )
      ( !STACK ?auto_810475 ?auto_810474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810499 - BLOCK
      ?auto_810500 - BLOCK
      ?auto_810501 - BLOCK
      ?auto_810502 - BLOCK
      ?auto_810503 - BLOCK
      ?auto_810504 - BLOCK
      ?auto_810505 - BLOCK
    )
    :vars
    (
      ?auto_810506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810505 ?auto_810506 ) ( ON-TABLE ?auto_810499 ) ( ON ?auto_810500 ?auto_810499 ) ( ON ?auto_810501 ?auto_810500 ) ( ON ?auto_810502 ?auto_810501 ) ( ON ?auto_810503 ?auto_810502 ) ( not ( = ?auto_810499 ?auto_810500 ) ) ( not ( = ?auto_810499 ?auto_810501 ) ) ( not ( = ?auto_810499 ?auto_810502 ) ) ( not ( = ?auto_810499 ?auto_810503 ) ) ( not ( = ?auto_810499 ?auto_810504 ) ) ( not ( = ?auto_810499 ?auto_810505 ) ) ( not ( = ?auto_810499 ?auto_810506 ) ) ( not ( = ?auto_810500 ?auto_810501 ) ) ( not ( = ?auto_810500 ?auto_810502 ) ) ( not ( = ?auto_810500 ?auto_810503 ) ) ( not ( = ?auto_810500 ?auto_810504 ) ) ( not ( = ?auto_810500 ?auto_810505 ) ) ( not ( = ?auto_810500 ?auto_810506 ) ) ( not ( = ?auto_810501 ?auto_810502 ) ) ( not ( = ?auto_810501 ?auto_810503 ) ) ( not ( = ?auto_810501 ?auto_810504 ) ) ( not ( = ?auto_810501 ?auto_810505 ) ) ( not ( = ?auto_810501 ?auto_810506 ) ) ( not ( = ?auto_810502 ?auto_810503 ) ) ( not ( = ?auto_810502 ?auto_810504 ) ) ( not ( = ?auto_810502 ?auto_810505 ) ) ( not ( = ?auto_810502 ?auto_810506 ) ) ( not ( = ?auto_810503 ?auto_810504 ) ) ( not ( = ?auto_810503 ?auto_810505 ) ) ( not ( = ?auto_810503 ?auto_810506 ) ) ( not ( = ?auto_810504 ?auto_810505 ) ) ( not ( = ?auto_810504 ?auto_810506 ) ) ( not ( = ?auto_810505 ?auto_810506 ) ) ( CLEAR ?auto_810503 ) ( ON ?auto_810504 ?auto_810505 ) ( CLEAR ?auto_810504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_810499 ?auto_810500 ?auto_810501 ?auto_810502 ?auto_810503 ?auto_810504 )
      ( MAKE-7PILE ?auto_810499 ?auto_810500 ?auto_810501 ?auto_810502 ?auto_810503 ?auto_810504 ?auto_810505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810529 - BLOCK
      ?auto_810530 - BLOCK
      ?auto_810531 - BLOCK
      ?auto_810532 - BLOCK
      ?auto_810533 - BLOCK
      ?auto_810534 - BLOCK
      ?auto_810535 - BLOCK
    )
    :vars
    (
      ?auto_810536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810535 ?auto_810536 ) ( ON-TABLE ?auto_810529 ) ( ON ?auto_810530 ?auto_810529 ) ( ON ?auto_810531 ?auto_810530 ) ( ON ?auto_810532 ?auto_810531 ) ( not ( = ?auto_810529 ?auto_810530 ) ) ( not ( = ?auto_810529 ?auto_810531 ) ) ( not ( = ?auto_810529 ?auto_810532 ) ) ( not ( = ?auto_810529 ?auto_810533 ) ) ( not ( = ?auto_810529 ?auto_810534 ) ) ( not ( = ?auto_810529 ?auto_810535 ) ) ( not ( = ?auto_810529 ?auto_810536 ) ) ( not ( = ?auto_810530 ?auto_810531 ) ) ( not ( = ?auto_810530 ?auto_810532 ) ) ( not ( = ?auto_810530 ?auto_810533 ) ) ( not ( = ?auto_810530 ?auto_810534 ) ) ( not ( = ?auto_810530 ?auto_810535 ) ) ( not ( = ?auto_810530 ?auto_810536 ) ) ( not ( = ?auto_810531 ?auto_810532 ) ) ( not ( = ?auto_810531 ?auto_810533 ) ) ( not ( = ?auto_810531 ?auto_810534 ) ) ( not ( = ?auto_810531 ?auto_810535 ) ) ( not ( = ?auto_810531 ?auto_810536 ) ) ( not ( = ?auto_810532 ?auto_810533 ) ) ( not ( = ?auto_810532 ?auto_810534 ) ) ( not ( = ?auto_810532 ?auto_810535 ) ) ( not ( = ?auto_810532 ?auto_810536 ) ) ( not ( = ?auto_810533 ?auto_810534 ) ) ( not ( = ?auto_810533 ?auto_810535 ) ) ( not ( = ?auto_810533 ?auto_810536 ) ) ( not ( = ?auto_810534 ?auto_810535 ) ) ( not ( = ?auto_810534 ?auto_810536 ) ) ( not ( = ?auto_810535 ?auto_810536 ) ) ( ON ?auto_810534 ?auto_810535 ) ( CLEAR ?auto_810532 ) ( ON ?auto_810533 ?auto_810534 ) ( CLEAR ?auto_810533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_810529 ?auto_810530 ?auto_810531 ?auto_810532 ?auto_810533 )
      ( MAKE-7PILE ?auto_810529 ?auto_810530 ?auto_810531 ?auto_810532 ?auto_810533 ?auto_810534 ?auto_810535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810559 - BLOCK
      ?auto_810560 - BLOCK
      ?auto_810561 - BLOCK
      ?auto_810562 - BLOCK
      ?auto_810563 - BLOCK
      ?auto_810564 - BLOCK
      ?auto_810565 - BLOCK
    )
    :vars
    (
      ?auto_810566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810565 ?auto_810566 ) ( ON-TABLE ?auto_810559 ) ( ON ?auto_810560 ?auto_810559 ) ( ON ?auto_810561 ?auto_810560 ) ( not ( = ?auto_810559 ?auto_810560 ) ) ( not ( = ?auto_810559 ?auto_810561 ) ) ( not ( = ?auto_810559 ?auto_810562 ) ) ( not ( = ?auto_810559 ?auto_810563 ) ) ( not ( = ?auto_810559 ?auto_810564 ) ) ( not ( = ?auto_810559 ?auto_810565 ) ) ( not ( = ?auto_810559 ?auto_810566 ) ) ( not ( = ?auto_810560 ?auto_810561 ) ) ( not ( = ?auto_810560 ?auto_810562 ) ) ( not ( = ?auto_810560 ?auto_810563 ) ) ( not ( = ?auto_810560 ?auto_810564 ) ) ( not ( = ?auto_810560 ?auto_810565 ) ) ( not ( = ?auto_810560 ?auto_810566 ) ) ( not ( = ?auto_810561 ?auto_810562 ) ) ( not ( = ?auto_810561 ?auto_810563 ) ) ( not ( = ?auto_810561 ?auto_810564 ) ) ( not ( = ?auto_810561 ?auto_810565 ) ) ( not ( = ?auto_810561 ?auto_810566 ) ) ( not ( = ?auto_810562 ?auto_810563 ) ) ( not ( = ?auto_810562 ?auto_810564 ) ) ( not ( = ?auto_810562 ?auto_810565 ) ) ( not ( = ?auto_810562 ?auto_810566 ) ) ( not ( = ?auto_810563 ?auto_810564 ) ) ( not ( = ?auto_810563 ?auto_810565 ) ) ( not ( = ?auto_810563 ?auto_810566 ) ) ( not ( = ?auto_810564 ?auto_810565 ) ) ( not ( = ?auto_810564 ?auto_810566 ) ) ( not ( = ?auto_810565 ?auto_810566 ) ) ( ON ?auto_810564 ?auto_810565 ) ( ON ?auto_810563 ?auto_810564 ) ( CLEAR ?auto_810561 ) ( ON ?auto_810562 ?auto_810563 ) ( CLEAR ?auto_810562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_810559 ?auto_810560 ?auto_810561 ?auto_810562 )
      ( MAKE-7PILE ?auto_810559 ?auto_810560 ?auto_810561 ?auto_810562 ?auto_810563 ?auto_810564 ?auto_810565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810589 - BLOCK
      ?auto_810590 - BLOCK
      ?auto_810591 - BLOCK
      ?auto_810592 - BLOCK
      ?auto_810593 - BLOCK
      ?auto_810594 - BLOCK
      ?auto_810595 - BLOCK
    )
    :vars
    (
      ?auto_810596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810595 ?auto_810596 ) ( ON-TABLE ?auto_810589 ) ( ON ?auto_810590 ?auto_810589 ) ( not ( = ?auto_810589 ?auto_810590 ) ) ( not ( = ?auto_810589 ?auto_810591 ) ) ( not ( = ?auto_810589 ?auto_810592 ) ) ( not ( = ?auto_810589 ?auto_810593 ) ) ( not ( = ?auto_810589 ?auto_810594 ) ) ( not ( = ?auto_810589 ?auto_810595 ) ) ( not ( = ?auto_810589 ?auto_810596 ) ) ( not ( = ?auto_810590 ?auto_810591 ) ) ( not ( = ?auto_810590 ?auto_810592 ) ) ( not ( = ?auto_810590 ?auto_810593 ) ) ( not ( = ?auto_810590 ?auto_810594 ) ) ( not ( = ?auto_810590 ?auto_810595 ) ) ( not ( = ?auto_810590 ?auto_810596 ) ) ( not ( = ?auto_810591 ?auto_810592 ) ) ( not ( = ?auto_810591 ?auto_810593 ) ) ( not ( = ?auto_810591 ?auto_810594 ) ) ( not ( = ?auto_810591 ?auto_810595 ) ) ( not ( = ?auto_810591 ?auto_810596 ) ) ( not ( = ?auto_810592 ?auto_810593 ) ) ( not ( = ?auto_810592 ?auto_810594 ) ) ( not ( = ?auto_810592 ?auto_810595 ) ) ( not ( = ?auto_810592 ?auto_810596 ) ) ( not ( = ?auto_810593 ?auto_810594 ) ) ( not ( = ?auto_810593 ?auto_810595 ) ) ( not ( = ?auto_810593 ?auto_810596 ) ) ( not ( = ?auto_810594 ?auto_810595 ) ) ( not ( = ?auto_810594 ?auto_810596 ) ) ( not ( = ?auto_810595 ?auto_810596 ) ) ( ON ?auto_810594 ?auto_810595 ) ( ON ?auto_810593 ?auto_810594 ) ( ON ?auto_810592 ?auto_810593 ) ( CLEAR ?auto_810590 ) ( ON ?auto_810591 ?auto_810592 ) ( CLEAR ?auto_810591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_810589 ?auto_810590 ?auto_810591 )
      ( MAKE-7PILE ?auto_810589 ?auto_810590 ?auto_810591 ?auto_810592 ?auto_810593 ?auto_810594 ?auto_810595 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810619 - BLOCK
      ?auto_810620 - BLOCK
      ?auto_810621 - BLOCK
      ?auto_810622 - BLOCK
      ?auto_810623 - BLOCK
      ?auto_810624 - BLOCK
      ?auto_810625 - BLOCK
    )
    :vars
    (
      ?auto_810626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810625 ?auto_810626 ) ( ON-TABLE ?auto_810619 ) ( not ( = ?auto_810619 ?auto_810620 ) ) ( not ( = ?auto_810619 ?auto_810621 ) ) ( not ( = ?auto_810619 ?auto_810622 ) ) ( not ( = ?auto_810619 ?auto_810623 ) ) ( not ( = ?auto_810619 ?auto_810624 ) ) ( not ( = ?auto_810619 ?auto_810625 ) ) ( not ( = ?auto_810619 ?auto_810626 ) ) ( not ( = ?auto_810620 ?auto_810621 ) ) ( not ( = ?auto_810620 ?auto_810622 ) ) ( not ( = ?auto_810620 ?auto_810623 ) ) ( not ( = ?auto_810620 ?auto_810624 ) ) ( not ( = ?auto_810620 ?auto_810625 ) ) ( not ( = ?auto_810620 ?auto_810626 ) ) ( not ( = ?auto_810621 ?auto_810622 ) ) ( not ( = ?auto_810621 ?auto_810623 ) ) ( not ( = ?auto_810621 ?auto_810624 ) ) ( not ( = ?auto_810621 ?auto_810625 ) ) ( not ( = ?auto_810621 ?auto_810626 ) ) ( not ( = ?auto_810622 ?auto_810623 ) ) ( not ( = ?auto_810622 ?auto_810624 ) ) ( not ( = ?auto_810622 ?auto_810625 ) ) ( not ( = ?auto_810622 ?auto_810626 ) ) ( not ( = ?auto_810623 ?auto_810624 ) ) ( not ( = ?auto_810623 ?auto_810625 ) ) ( not ( = ?auto_810623 ?auto_810626 ) ) ( not ( = ?auto_810624 ?auto_810625 ) ) ( not ( = ?auto_810624 ?auto_810626 ) ) ( not ( = ?auto_810625 ?auto_810626 ) ) ( ON ?auto_810624 ?auto_810625 ) ( ON ?auto_810623 ?auto_810624 ) ( ON ?auto_810622 ?auto_810623 ) ( ON ?auto_810621 ?auto_810622 ) ( CLEAR ?auto_810619 ) ( ON ?auto_810620 ?auto_810621 ) ( CLEAR ?auto_810620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810619 ?auto_810620 )
      ( MAKE-7PILE ?auto_810619 ?auto_810620 ?auto_810621 ?auto_810622 ?auto_810623 ?auto_810624 ?auto_810625 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_810649 - BLOCK
      ?auto_810650 - BLOCK
      ?auto_810651 - BLOCK
      ?auto_810652 - BLOCK
      ?auto_810653 - BLOCK
      ?auto_810654 - BLOCK
      ?auto_810655 - BLOCK
    )
    :vars
    (
      ?auto_810656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810655 ?auto_810656 ) ( not ( = ?auto_810649 ?auto_810650 ) ) ( not ( = ?auto_810649 ?auto_810651 ) ) ( not ( = ?auto_810649 ?auto_810652 ) ) ( not ( = ?auto_810649 ?auto_810653 ) ) ( not ( = ?auto_810649 ?auto_810654 ) ) ( not ( = ?auto_810649 ?auto_810655 ) ) ( not ( = ?auto_810649 ?auto_810656 ) ) ( not ( = ?auto_810650 ?auto_810651 ) ) ( not ( = ?auto_810650 ?auto_810652 ) ) ( not ( = ?auto_810650 ?auto_810653 ) ) ( not ( = ?auto_810650 ?auto_810654 ) ) ( not ( = ?auto_810650 ?auto_810655 ) ) ( not ( = ?auto_810650 ?auto_810656 ) ) ( not ( = ?auto_810651 ?auto_810652 ) ) ( not ( = ?auto_810651 ?auto_810653 ) ) ( not ( = ?auto_810651 ?auto_810654 ) ) ( not ( = ?auto_810651 ?auto_810655 ) ) ( not ( = ?auto_810651 ?auto_810656 ) ) ( not ( = ?auto_810652 ?auto_810653 ) ) ( not ( = ?auto_810652 ?auto_810654 ) ) ( not ( = ?auto_810652 ?auto_810655 ) ) ( not ( = ?auto_810652 ?auto_810656 ) ) ( not ( = ?auto_810653 ?auto_810654 ) ) ( not ( = ?auto_810653 ?auto_810655 ) ) ( not ( = ?auto_810653 ?auto_810656 ) ) ( not ( = ?auto_810654 ?auto_810655 ) ) ( not ( = ?auto_810654 ?auto_810656 ) ) ( not ( = ?auto_810655 ?auto_810656 ) ) ( ON ?auto_810654 ?auto_810655 ) ( ON ?auto_810653 ?auto_810654 ) ( ON ?auto_810652 ?auto_810653 ) ( ON ?auto_810651 ?auto_810652 ) ( ON ?auto_810650 ?auto_810651 ) ( ON ?auto_810649 ?auto_810650 ) ( CLEAR ?auto_810649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810649 )
      ( MAKE-7PILE ?auto_810649 ?auto_810650 ?auto_810651 ?auto_810652 ?auto_810653 ?auto_810654 ?auto_810655 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810680 - BLOCK
      ?auto_810681 - BLOCK
      ?auto_810682 - BLOCK
      ?auto_810683 - BLOCK
      ?auto_810684 - BLOCK
      ?auto_810685 - BLOCK
      ?auto_810686 - BLOCK
      ?auto_810687 - BLOCK
    )
    :vars
    (
      ?auto_810688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810686 ) ( ON ?auto_810687 ?auto_810688 ) ( CLEAR ?auto_810687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810680 ) ( ON ?auto_810681 ?auto_810680 ) ( ON ?auto_810682 ?auto_810681 ) ( ON ?auto_810683 ?auto_810682 ) ( ON ?auto_810684 ?auto_810683 ) ( ON ?auto_810685 ?auto_810684 ) ( ON ?auto_810686 ?auto_810685 ) ( not ( = ?auto_810680 ?auto_810681 ) ) ( not ( = ?auto_810680 ?auto_810682 ) ) ( not ( = ?auto_810680 ?auto_810683 ) ) ( not ( = ?auto_810680 ?auto_810684 ) ) ( not ( = ?auto_810680 ?auto_810685 ) ) ( not ( = ?auto_810680 ?auto_810686 ) ) ( not ( = ?auto_810680 ?auto_810687 ) ) ( not ( = ?auto_810680 ?auto_810688 ) ) ( not ( = ?auto_810681 ?auto_810682 ) ) ( not ( = ?auto_810681 ?auto_810683 ) ) ( not ( = ?auto_810681 ?auto_810684 ) ) ( not ( = ?auto_810681 ?auto_810685 ) ) ( not ( = ?auto_810681 ?auto_810686 ) ) ( not ( = ?auto_810681 ?auto_810687 ) ) ( not ( = ?auto_810681 ?auto_810688 ) ) ( not ( = ?auto_810682 ?auto_810683 ) ) ( not ( = ?auto_810682 ?auto_810684 ) ) ( not ( = ?auto_810682 ?auto_810685 ) ) ( not ( = ?auto_810682 ?auto_810686 ) ) ( not ( = ?auto_810682 ?auto_810687 ) ) ( not ( = ?auto_810682 ?auto_810688 ) ) ( not ( = ?auto_810683 ?auto_810684 ) ) ( not ( = ?auto_810683 ?auto_810685 ) ) ( not ( = ?auto_810683 ?auto_810686 ) ) ( not ( = ?auto_810683 ?auto_810687 ) ) ( not ( = ?auto_810683 ?auto_810688 ) ) ( not ( = ?auto_810684 ?auto_810685 ) ) ( not ( = ?auto_810684 ?auto_810686 ) ) ( not ( = ?auto_810684 ?auto_810687 ) ) ( not ( = ?auto_810684 ?auto_810688 ) ) ( not ( = ?auto_810685 ?auto_810686 ) ) ( not ( = ?auto_810685 ?auto_810687 ) ) ( not ( = ?auto_810685 ?auto_810688 ) ) ( not ( = ?auto_810686 ?auto_810687 ) ) ( not ( = ?auto_810686 ?auto_810688 ) ) ( not ( = ?auto_810687 ?auto_810688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810687 ?auto_810688 )
      ( !STACK ?auto_810687 ?auto_810686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810714 - BLOCK
      ?auto_810715 - BLOCK
      ?auto_810716 - BLOCK
      ?auto_810717 - BLOCK
      ?auto_810718 - BLOCK
      ?auto_810719 - BLOCK
      ?auto_810720 - BLOCK
      ?auto_810721 - BLOCK
    )
    :vars
    (
      ?auto_810722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810721 ?auto_810722 ) ( ON-TABLE ?auto_810714 ) ( ON ?auto_810715 ?auto_810714 ) ( ON ?auto_810716 ?auto_810715 ) ( ON ?auto_810717 ?auto_810716 ) ( ON ?auto_810718 ?auto_810717 ) ( ON ?auto_810719 ?auto_810718 ) ( not ( = ?auto_810714 ?auto_810715 ) ) ( not ( = ?auto_810714 ?auto_810716 ) ) ( not ( = ?auto_810714 ?auto_810717 ) ) ( not ( = ?auto_810714 ?auto_810718 ) ) ( not ( = ?auto_810714 ?auto_810719 ) ) ( not ( = ?auto_810714 ?auto_810720 ) ) ( not ( = ?auto_810714 ?auto_810721 ) ) ( not ( = ?auto_810714 ?auto_810722 ) ) ( not ( = ?auto_810715 ?auto_810716 ) ) ( not ( = ?auto_810715 ?auto_810717 ) ) ( not ( = ?auto_810715 ?auto_810718 ) ) ( not ( = ?auto_810715 ?auto_810719 ) ) ( not ( = ?auto_810715 ?auto_810720 ) ) ( not ( = ?auto_810715 ?auto_810721 ) ) ( not ( = ?auto_810715 ?auto_810722 ) ) ( not ( = ?auto_810716 ?auto_810717 ) ) ( not ( = ?auto_810716 ?auto_810718 ) ) ( not ( = ?auto_810716 ?auto_810719 ) ) ( not ( = ?auto_810716 ?auto_810720 ) ) ( not ( = ?auto_810716 ?auto_810721 ) ) ( not ( = ?auto_810716 ?auto_810722 ) ) ( not ( = ?auto_810717 ?auto_810718 ) ) ( not ( = ?auto_810717 ?auto_810719 ) ) ( not ( = ?auto_810717 ?auto_810720 ) ) ( not ( = ?auto_810717 ?auto_810721 ) ) ( not ( = ?auto_810717 ?auto_810722 ) ) ( not ( = ?auto_810718 ?auto_810719 ) ) ( not ( = ?auto_810718 ?auto_810720 ) ) ( not ( = ?auto_810718 ?auto_810721 ) ) ( not ( = ?auto_810718 ?auto_810722 ) ) ( not ( = ?auto_810719 ?auto_810720 ) ) ( not ( = ?auto_810719 ?auto_810721 ) ) ( not ( = ?auto_810719 ?auto_810722 ) ) ( not ( = ?auto_810720 ?auto_810721 ) ) ( not ( = ?auto_810720 ?auto_810722 ) ) ( not ( = ?auto_810721 ?auto_810722 ) ) ( CLEAR ?auto_810719 ) ( ON ?auto_810720 ?auto_810721 ) ( CLEAR ?auto_810720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_810714 ?auto_810715 ?auto_810716 ?auto_810717 ?auto_810718 ?auto_810719 ?auto_810720 )
      ( MAKE-8PILE ?auto_810714 ?auto_810715 ?auto_810716 ?auto_810717 ?auto_810718 ?auto_810719 ?auto_810720 ?auto_810721 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810748 - BLOCK
      ?auto_810749 - BLOCK
      ?auto_810750 - BLOCK
      ?auto_810751 - BLOCK
      ?auto_810752 - BLOCK
      ?auto_810753 - BLOCK
      ?auto_810754 - BLOCK
      ?auto_810755 - BLOCK
    )
    :vars
    (
      ?auto_810756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810755 ?auto_810756 ) ( ON-TABLE ?auto_810748 ) ( ON ?auto_810749 ?auto_810748 ) ( ON ?auto_810750 ?auto_810749 ) ( ON ?auto_810751 ?auto_810750 ) ( ON ?auto_810752 ?auto_810751 ) ( not ( = ?auto_810748 ?auto_810749 ) ) ( not ( = ?auto_810748 ?auto_810750 ) ) ( not ( = ?auto_810748 ?auto_810751 ) ) ( not ( = ?auto_810748 ?auto_810752 ) ) ( not ( = ?auto_810748 ?auto_810753 ) ) ( not ( = ?auto_810748 ?auto_810754 ) ) ( not ( = ?auto_810748 ?auto_810755 ) ) ( not ( = ?auto_810748 ?auto_810756 ) ) ( not ( = ?auto_810749 ?auto_810750 ) ) ( not ( = ?auto_810749 ?auto_810751 ) ) ( not ( = ?auto_810749 ?auto_810752 ) ) ( not ( = ?auto_810749 ?auto_810753 ) ) ( not ( = ?auto_810749 ?auto_810754 ) ) ( not ( = ?auto_810749 ?auto_810755 ) ) ( not ( = ?auto_810749 ?auto_810756 ) ) ( not ( = ?auto_810750 ?auto_810751 ) ) ( not ( = ?auto_810750 ?auto_810752 ) ) ( not ( = ?auto_810750 ?auto_810753 ) ) ( not ( = ?auto_810750 ?auto_810754 ) ) ( not ( = ?auto_810750 ?auto_810755 ) ) ( not ( = ?auto_810750 ?auto_810756 ) ) ( not ( = ?auto_810751 ?auto_810752 ) ) ( not ( = ?auto_810751 ?auto_810753 ) ) ( not ( = ?auto_810751 ?auto_810754 ) ) ( not ( = ?auto_810751 ?auto_810755 ) ) ( not ( = ?auto_810751 ?auto_810756 ) ) ( not ( = ?auto_810752 ?auto_810753 ) ) ( not ( = ?auto_810752 ?auto_810754 ) ) ( not ( = ?auto_810752 ?auto_810755 ) ) ( not ( = ?auto_810752 ?auto_810756 ) ) ( not ( = ?auto_810753 ?auto_810754 ) ) ( not ( = ?auto_810753 ?auto_810755 ) ) ( not ( = ?auto_810753 ?auto_810756 ) ) ( not ( = ?auto_810754 ?auto_810755 ) ) ( not ( = ?auto_810754 ?auto_810756 ) ) ( not ( = ?auto_810755 ?auto_810756 ) ) ( ON ?auto_810754 ?auto_810755 ) ( CLEAR ?auto_810752 ) ( ON ?auto_810753 ?auto_810754 ) ( CLEAR ?auto_810753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_810748 ?auto_810749 ?auto_810750 ?auto_810751 ?auto_810752 ?auto_810753 )
      ( MAKE-8PILE ?auto_810748 ?auto_810749 ?auto_810750 ?auto_810751 ?auto_810752 ?auto_810753 ?auto_810754 ?auto_810755 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810782 - BLOCK
      ?auto_810783 - BLOCK
      ?auto_810784 - BLOCK
      ?auto_810785 - BLOCK
      ?auto_810786 - BLOCK
      ?auto_810787 - BLOCK
      ?auto_810788 - BLOCK
      ?auto_810789 - BLOCK
    )
    :vars
    (
      ?auto_810790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810789 ?auto_810790 ) ( ON-TABLE ?auto_810782 ) ( ON ?auto_810783 ?auto_810782 ) ( ON ?auto_810784 ?auto_810783 ) ( ON ?auto_810785 ?auto_810784 ) ( not ( = ?auto_810782 ?auto_810783 ) ) ( not ( = ?auto_810782 ?auto_810784 ) ) ( not ( = ?auto_810782 ?auto_810785 ) ) ( not ( = ?auto_810782 ?auto_810786 ) ) ( not ( = ?auto_810782 ?auto_810787 ) ) ( not ( = ?auto_810782 ?auto_810788 ) ) ( not ( = ?auto_810782 ?auto_810789 ) ) ( not ( = ?auto_810782 ?auto_810790 ) ) ( not ( = ?auto_810783 ?auto_810784 ) ) ( not ( = ?auto_810783 ?auto_810785 ) ) ( not ( = ?auto_810783 ?auto_810786 ) ) ( not ( = ?auto_810783 ?auto_810787 ) ) ( not ( = ?auto_810783 ?auto_810788 ) ) ( not ( = ?auto_810783 ?auto_810789 ) ) ( not ( = ?auto_810783 ?auto_810790 ) ) ( not ( = ?auto_810784 ?auto_810785 ) ) ( not ( = ?auto_810784 ?auto_810786 ) ) ( not ( = ?auto_810784 ?auto_810787 ) ) ( not ( = ?auto_810784 ?auto_810788 ) ) ( not ( = ?auto_810784 ?auto_810789 ) ) ( not ( = ?auto_810784 ?auto_810790 ) ) ( not ( = ?auto_810785 ?auto_810786 ) ) ( not ( = ?auto_810785 ?auto_810787 ) ) ( not ( = ?auto_810785 ?auto_810788 ) ) ( not ( = ?auto_810785 ?auto_810789 ) ) ( not ( = ?auto_810785 ?auto_810790 ) ) ( not ( = ?auto_810786 ?auto_810787 ) ) ( not ( = ?auto_810786 ?auto_810788 ) ) ( not ( = ?auto_810786 ?auto_810789 ) ) ( not ( = ?auto_810786 ?auto_810790 ) ) ( not ( = ?auto_810787 ?auto_810788 ) ) ( not ( = ?auto_810787 ?auto_810789 ) ) ( not ( = ?auto_810787 ?auto_810790 ) ) ( not ( = ?auto_810788 ?auto_810789 ) ) ( not ( = ?auto_810788 ?auto_810790 ) ) ( not ( = ?auto_810789 ?auto_810790 ) ) ( ON ?auto_810788 ?auto_810789 ) ( ON ?auto_810787 ?auto_810788 ) ( CLEAR ?auto_810785 ) ( ON ?auto_810786 ?auto_810787 ) ( CLEAR ?auto_810786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_810782 ?auto_810783 ?auto_810784 ?auto_810785 ?auto_810786 )
      ( MAKE-8PILE ?auto_810782 ?auto_810783 ?auto_810784 ?auto_810785 ?auto_810786 ?auto_810787 ?auto_810788 ?auto_810789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810816 - BLOCK
      ?auto_810817 - BLOCK
      ?auto_810818 - BLOCK
      ?auto_810819 - BLOCK
      ?auto_810820 - BLOCK
      ?auto_810821 - BLOCK
      ?auto_810822 - BLOCK
      ?auto_810823 - BLOCK
    )
    :vars
    (
      ?auto_810824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810823 ?auto_810824 ) ( ON-TABLE ?auto_810816 ) ( ON ?auto_810817 ?auto_810816 ) ( ON ?auto_810818 ?auto_810817 ) ( not ( = ?auto_810816 ?auto_810817 ) ) ( not ( = ?auto_810816 ?auto_810818 ) ) ( not ( = ?auto_810816 ?auto_810819 ) ) ( not ( = ?auto_810816 ?auto_810820 ) ) ( not ( = ?auto_810816 ?auto_810821 ) ) ( not ( = ?auto_810816 ?auto_810822 ) ) ( not ( = ?auto_810816 ?auto_810823 ) ) ( not ( = ?auto_810816 ?auto_810824 ) ) ( not ( = ?auto_810817 ?auto_810818 ) ) ( not ( = ?auto_810817 ?auto_810819 ) ) ( not ( = ?auto_810817 ?auto_810820 ) ) ( not ( = ?auto_810817 ?auto_810821 ) ) ( not ( = ?auto_810817 ?auto_810822 ) ) ( not ( = ?auto_810817 ?auto_810823 ) ) ( not ( = ?auto_810817 ?auto_810824 ) ) ( not ( = ?auto_810818 ?auto_810819 ) ) ( not ( = ?auto_810818 ?auto_810820 ) ) ( not ( = ?auto_810818 ?auto_810821 ) ) ( not ( = ?auto_810818 ?auto_810822 ) ) ( not ( = ?auto_810818 ?auto_810823 ) ) ( not ( = ?auto_810818 ?auto_810824 ) ) ( not ( = ?auto_810819 ?auto_810820 ) ) ( not ( = ?auto_810819 ?auto_810821 ) ) ( not ( = ?auto_810819 ?auto_810822 ) ) ( not ( = ?auto_810819 ?auto_810823 ) ) ( not ( = ?auto_810819 ?auto_810824 ) ) ( not ( = ?auto_810820 ?auto_810821 ) ) ( not ( = ?auto_810820 ?auto_810822 ) ) ( not ( = ?auto_810820 ?auto_810823 ) ) ( not ( = ?auto_810820 ?auto_810824 ) ) ( not ( = ?auto_810821 ?auto_810822 ) ) ( not ( = ?auto_810821 ?auto_810823 ) ) ( not ( = ?auto_810821 ?auto_810824 ) ) ( not ( = ?auto_810822 ?auto_810823 ) ) ( not ( = ?auto_810822 ?auto_810824 ) ) ( not ( = ?auto_810823 ?auto_810824 ) ) ( ON ?auto_810822 ?auto_810823 ) ( ON ?auto_810821 ?auto_810822 ) ( ON ?auto_810820 ?auto_810821 ) ( CLEAR ?auto_810818 ) ( ON ?auto_810819 ?auto_810820 ) ( CLEAR ?auto_810819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_810816 ?auto_810817 ?auto_810818 ?auto_810819 )
      ( MAKE-8PILE ?auto_810816 ?auto_810817 ?auto_810818 ?auto_810819 ?auto_810820 ?auto_810821 ?auto_810822 ?auto_810823 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810850 - BLOCK
      ?auto_810851 - BLOCK
      ?auto_810852 - BLOCK
      ?auto_810853 - BLOCK
      ?auto_810854 - BLOCK
      ?auto_810855 - BLOCK
      ?auto_810856 - BLOCK
      ?auto_810857 - BLOCK
    )
    :vars
    (
      ?auto_810858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810857 ?auto_810858 ) ( ON-TABLE ?auto_810850 ) ( ON ?auto_810851 ?auto_810850 ) ( not ( = ?auto_810850 ?auto_810851 ) ) ( not ( = ?auto_810850 ?auto_810852 ) ) ( not ( = ?auto_810850 ?auto_810853 ) ) ( not ( = ?auto_810850 ?auto_810854 ) ) ( not ( = ?auto_810850 ?auto_810855 ) ) ( not ( = ?auto_810850 ?auto_810856 ) ) ( not ( = ?auto_810850 ?auto_810857 ) ) ( not ( = ?auto_810850 ?auto_810858 ) ) ( not ( = ?auto_810851 ?auto_810852 ) ) ( not ( = ?auto_810851 ?auto_810853 ) ) ( not ( = ?auto_810851 ?auto_810854 ) ) ( not ( = ?auto_810851 ?auto_810855 ) ) ( not ( = ?auto_810851 ?auto_810856 ) ) ( not ( = ?auto_810851 ?auto_810857 ) ) ( not ( = ?auto_810851 ?auto_810858 ) ) ( not ( = ?auto_810852 ?auto_810853 ) ) ( not ( = ?auto_810852 ?auto_810854 ) ) ( not ( = ?auto_810852 ?auto_810855 ) ) ( not ( = ?auto_810852 ?auto_810856 ) ) ( not ( = ?auto_810852 ?auto_810857 ) ) ( not ( = ?auto_810852 ?auto_810858 ) ) ( not ( = ?auto_810853 ?auto_810854 ) ) ( not ( = ?auto_810853 ?auto_810855 ) ) ( not ( = ?auto_810853 ?auto_810856 ) ) ( not ( = ?auto_810853 ?auto_810857 ) ) ( not ( = ?auto_810853 ?auto_810858 ) ) ( not ( = ?auto_810854 ?auto_810855 ) ) ( not ( = ?auto_810854 ?auto_810856 ) ) ( not ( = ?auto_810854 ?auto_810857 ) ) ( not ( = ?auto_810854 ?auto_810858 ) ) ( not ( = ?auto_810855 ?auto_810856 ) ) ( not ( = ?auto_810855 ?auto_810857 ) ) ( not ( = ?auto_810855 ?auto_810858 ) ) ( not ( = ?auto_810856 ?auto_810857 ) ) ( not ( = ?auto_810856 ?auto_810858 ) ) ( not ( = ?auto_810857 ?auto_810858 ) ) ( ON ?auto_810856 ?auto_810857 ) ( ON ?auto_810855 ?auto_810856 ) ( ON ?auto_810854 ?auto_810855 ) ( ON ?auto_810853 ?auto_810854 ) ( CLEAR ?auto_810851 ) ( ON ?auto_810852 ?auto_810853 ) ( CLEAR ?auto_810852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_810850 ?auto_810851 ?auto_810852 )
      ( MAKE-8PILE ?auto_810850 ?auto_810851 ?auto_810852 ?auto_810853 ?auto_810854 ?auto_810855 ?auto_810856 ?auto_810857 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810884 - BLOCK
      ?auto_810885 - BLOCK
      ?auto_810886 - BLOCK
      ?auto_810887 - BLOCK
      ?auto_810888 - BLOCK
      ?auto_810889 - BLOCK
      ?auto_810890 - BLOCK
      ?auto_810891 - BLOCK
    )
    :vars
    (
      ?auto_810892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810891 ?auto_810892 ) ( ON-TABLE ?auto_810884 ) ( not ( = ?auto_810884 ?auto_810885 ) ) ( not ( = ?auto_810884 ?auto_810886 ) ) ( not ( = ?auto_810884 ?auto_810887 ) ) ( not ( = ?auto_810884 ?auto_810888 ) ) ( not ( = ?auto_810884 ?auto_810889 ) ) ( not ( = ?auto_810884 ?auto_810890 ) ) ( not ( = ?auto_810884 ?auto_810891 ) ) ( not ( = ?auto_810884 ?auto_810892 ) ) ( not ( = ?auto_810885 ?auto_810886 ) ) ( not ( = ?auto_810885 ?auto_810887 ) ) ( not ( = ?auto_810885 ?auto_810888 ) ) ( not ( = ?auto_810885 ?auto_810889 ) ) ( not ( = ?auto_810885 ?auto_810890 ) ) ( not ( = ?auto_810885 ?auto_810891 ) ) ( not ( = ?auto_810885 ?auto_810892 ) ) ( not ( = ?auto_810886 ?auto_810887 ) ) ( not ( = ?auto_810886 ?auto_810888 ) ) ( not ( = ?auto_810886 ?auto_810889 ) ) ( not ( = ?auto_810886 ?auto_810890 ) ) ( not ( = ?auto_810886 ?auto_810891 ) ) ( not ( = ?auto_810886 ?auto_810892 ) ) ( not ( = ?auto_810887 ?auto_810888 ) ) ( not ( = ?auto_810887 ?auto_810889 ) ) ( not ( = ?auto_810887 ?auto_810890 ) ) ( not ( = ?auto_810887 ?auto_810891 ) ) ( not ( = ?auto_810887 ?auto_810892 ) ) ( not ( = ?auto_810888 ?auto_810889 ) ) ( not ( = ?auto_810888 ?auto_810890 ) ) ( not ( = ?auto_810888 ?auto_810891 ) ) ( not ( = ?auto_810888 ?auto_810892 ) ) ( not ( = ?auto_810889 ?auto_810890 ) ) ( not ( = ?auto_810889 ?auto_810891 ) ) ( not ( = ?auto_810889 ?auto_810892 ) ) ( not ( = ?auto_810890 ?auto_810891 ) ) ( not ( = ?auto_810890 ?auto_810892 ) ) ( not ( = ?auto_810891 ?auto_810892 ) ) ( ON ?auto_810890 ?auto_810891 ) ( ON ?auto_810889 ?auto_810890 ) ( ON ?auto_810888 ?auto_810889 ) ( ON ?auto_810887 ?auto_810888 ) ( ON ?auto_810886 ?auto_810887 ) ( CLEAR ?auto_810884 ) ( ON ?auto_810885 ?auto_810886 ) ( CLEAR ?auto_810885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_810884 ?auto_810885 )
      ( MAKE-8PILE ?auto_810884 ?auto_810885 ?auto_810886 ?auto_810887 ?auto_810888 ?auto_810889 ?auto_810890 ?auto_810891 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_810918 - BLOCK
      ?auto_810919 - BLOCK
      ?auto_810920 - BLOCK
      ?auto_810921 - BLOCK
      ?auto_810922 - BLOCK
      ?auto_810923 - BLOCK
      ?auto_810924 - BLOCK
      ?auto_810925 - BLOCK
    )
    :vars
    (
      ?auto_810926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810925 ?auto_810926 ) ( not ( = ?auto_810918 ?auto_810919 ) ) ( not ( = ?auto_810918 ?auto_810920 ) ) ( not ( = ?auto_810918 ?auto_810921 ) ) ( not ( = ?auto_810918 ?auto_810922 ) ) ( not ( = ?auto_810918 ?auto_810923 ) ) ( not ( = ?auto_810918 ?auto_810924 ) ) ( not ( = ?auto_810918 ?auto_810925 ) ) ( not ( = ?auto_810918 ?auto_810926 ) ) ( not ( = ?auto_810919 ?auto_810920 ) ) ( not ( = ?auto_810919 ?auto_810921 ) ) ( not ( = ?auto_810919 ?auto_810922 ) ) ( not ( = ?auto_810919 ?auto_810923 ) ) ( not ( = ?auto_810919 ?auto_810924 ) ) ( not ( = ?auto_810919 ?auto_810925 ) ) ( not ( = ?auto_810919 ?auto_810926 ) ) ( not ( = ?auto_810920 ?auto_810921 ) ) ( not ( = ?auto_810920 ?auto_810922 ) ) ( not ( = ?auto_810920 ?auto_810923 ) ) ( not ( = ?auto_810920 ?auto_810924 ) ) ( not ( = ?auto_810920 ?auto_810925 ) ) ( not ( = ?auto_810920 ?auto_810926 ) ) ( not ( = ?auto_810921 ?auto_810922 ) ) ( not ( = ?auto_810921 ?auto_810923 ) ) ( not ( = ?auto_810921 ?auto_810924 ) ) ( not ( = ?auto_810921 ?auto_810925 ) ) ( not ( = ?auto_810921 ?auto_810926 ) ) ( not ( = ?auto_810922 ?auto_810923 ) ) ( not ( = ?auto_810922 ?auto_810924 ) ) ( not ( = ?auto_810922 ?auto_810925 ) ) ( not ( = ?auto_810922 ?auto_810926 ) ) ( not ( = ?auto_810923 ?auto_810924 ) ) ( not ( = ?auto_810923 ?auto_810925 ) ) ( not ( = ?auto_810923 ?auto_810926 ) ) ( not ( = ?auto_810924 ?auto_810925 ) ) ( not ( = ?auto_810924 ?auto_810926 ) ) ( not ( = ?auto_810925 ?auto_810926 ) ) ( ON ?auto_810924 ?auto_810925 ) ( ON ?auto_810923 ?auto_810924 ) ( ON ?auto_810922 ?auto_810923 ) ( ON ?auto_810921 ?auto_810922 ) ( ON ?auto_810920 ?auto_810921 ) ( ON ?auto_810919 ?auto_810920 ) ( ON ?auto_810918 ?auto_810919 ) ( CLEAR ?auto_810918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810918 )
      ( MAKE-8PILE ?auto_810918 ?auto_810919 ?auto_810920 ?auto_810921 ?auto_810922 ?auto_810923 ?auto_810924 ?auto_810925 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_810953 - BLOCK
      ?auto_810954 - BLOCK
      ?auto_810955 - BLOCK
      ?auto_810956 - BLOCK
      ?auto_810957 - BLOCK
      ?auto_810958 - BLOCK
      ?auto_810959 - BLOCK
      ?auto_810960 - BLOCK
      ?auto_810961 - BLOCK
    )
    :vars
    (
      ?auto_810962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_810960 ) ( ON ?auto_810961 ?auto_810962 ) ( CLEAR ?auto_810961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_810953 ) ( ON ?auto_810954 ?auto_810953 ) ( ON ?auto_810955 ?auto_810954 ) ( ON ?auto_810956 ?auto_810955 ) ( ON ?auto_810957 ?auto_810956 ) ( ON ?auto_810958 ?auto_810957 ) ( ON ?auto_810959 ?auto_810958 ) ( ON ?auto_810960 ?auto_810959 ) ( not ( = ?auto_810953 ?auto_810954 ) ) ( not ( = ?auto_810953 ?auto_810955 ) ) ( not ( = ?auto_810953 ?auto_810956 ) ) ( not ( = ?auto_810953 ?auto_810957 ) ) ( not ( = ?auto_810953 ?auto_810958 ) ) ( not ( = ?auto_810953 ?auto_810959 ) ) ( not ( = ?auto_810953 ?auto_810960 ) ) ( not ( = ?auto_810953 ?auto_810961 ) ) ( not ( = ?auto_810953 ?auto_810962 ) ) ( not ( = ?auto_810954 ?auto_810955 ) ) ( not ( = ?auto_810954 ?auto_810956 ) ) ( not ( = ?auto_810954 ?auto_810957 ) ) ( not ( = ?auto_810954 ?auto_810958 ) ) ( not ( = ?auto_810954 ?auto_810959 ) ) ( not ( = ?auto_810954 ?auto_810960 ) ) ( not ( = ?auto_810954 ?auto_810961 ) ) ( not ( = ?auto_810954 ?auto_810962 ) ) ( not ( = ?auto_810955 ?auto_810956 ) ) ( not ( = ?auto_810955 ?auto_810957 ) ) ( not ( = ?auto_810955 ?auto_810958 ) ) ( not ( = ?auto_810955 ?auto_810959 ) ) ( not ( = ?auto_810955 ?auto_810960 ) ) ( not ( = ?auto_810955 ?auto_810961 ) ) ( not ( = ?auto_810955 ?auto_810962 ) ) ( not ( = ?auto_810956 ?auto_810957 ) ) ( not ( = ?auto_810956 ?auto_810958 ) ) ( not ( = ?auto_810956 ?auto_810959 ) ) ( not ( = ?auto_810956 ?auto_810960 ) ) ( not ( = ?auto_810956 ?auto_810961 ) ) ( not ( = ?auto_810956 ?auto_810962 ) ) ( not ( = ?auto_810957 ?auto_810958 ) ) ( not ( = ?auto_810957 ?auto_810959 ) ) ( not ( = ?auto_810957 ?auto_810960 ) ) ( not ( = ?auto_810957 ?auto_810961 ) ) ( not ( = ?auto_810957 ?auto_810962 ) ) ( not ( = ?auto_810958 ?auto_810959 ) ) ( not ( = ?auto_810958 ?auto_810960 ) ) ( not ( = ?auto_810958 ?auto_810961 ) ) ( not ( = ?auto_810958 ?auto_810962 ) ) ( not ( = ?auto_810959 ?auto_810960 ) ) ( not ( = ?auto_810959 ?auto_810961 ) ) ( not ( = ?auto_810959 ?auto_810962 ) ) ( not ( = ?auto_810960 ?auto_810961 ) ) ( not ( = ?auto_810960 ?auto_810962 ) ) ( not ( = ?auto_810961 ?auto_810962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810961 ?auto_810962 )
      ( !STACK ?auto_810961 ?auto_810960 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_810991 - BLOCK
      ?auto_810992 - BLOCK
      ?auto_810993 - BLOCK
      ?auto_810994 - BLOCK
      ?auto_810995 - BLOCK
      ?auto_810996 - BLOCK
      ?auto_810997 - BLOCK
      ?auto_810998 - BLOCK
      ?auto_810999 - BLOCK
    )
    :vars
    (
      ?auto_811000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_810999 ?auto_811000 ) ( ON-TABLE ?auto_810991 ) ( ON ?auto_810992 ?auto_810991 ) ( ON ?auto_810993 ?auto_810992 ) ( ON ?auto_810994 ?auto_810993 ) ( ON ?auto_810995 ?auto_810994 ) ( ON ?auto_810996 ?auto_810995 ) ( ON ?auto_810997 ?auto_810996 ) ( not ( = ?auto_810991 ?auto_810992 ) ) ( not ( = ?auto_810991 ?auto_810993 ) ) ( not ( = ?auto_810991 ?auto_810994 ) ) ( not ( = ?auto_810991 ?auto_810995 ) ) ( not ( = ?auto_810991 ?auto_810996 ) ) ( not ( = ?auto_810991 ?auto_810997 ) ) ( not ( = ?auto_810991 ?auto_810998 ) ) ( not ( = ?auto_810991 ?auto_810999 ) ) ( not ( = ?auto_810991 ?auto_811000 ) ) ( not ( = ?auto_810992 ?auto_810993 ) ) ( not ( = ?auto_810992 ?auto_810994 ) ) ( not ( = ?auto_810992 ?auto_810995 ) ) ( not ( = ?auto_810992 ?auto_810996 ) ) ( not ( = ?auto_810992 ?auto_810997 ) ) ( not ( = ?auto_810992 ?auto_810998 ) ) ( not ( = ?auto_810992 ?auto_810999 ) ) ( not ( = ?auto_810992 ?auto_811000 ) ) ( not ( = ?auto_810993 ?auto_810994 ) ) ( not ( = ?auto_810993 ?auto_810995 ) ) ( not ( = ?auto_810993 ?auto_810996 ) ) ( not ( = ?auto_810993 ?auto_810997 ) ) ( not ( = ?auto_810993 ?auto_810998 ) ) ( not ( = ?auto_810993 ?auto_810999 ) ) ( not ( = ?auto_810993 ?auto_811000 ) ) ( not ( = ?auto_810994 ?auto_810995 ) ) ( not ( = ?auto_810994 ?auto_810996 ) ) ( not ( = ?auto_810994 ?auto_810997 ) ) ( not ( = ?auto_810994 ?auto_810998 ) ) ( not ( = ?auto_810994 ?auto_810999 ) ) ( not ( = ?auto_810994 ?auto_811000 ) ) ( not ( = ?auto_810995 ?auto_810996 ) ) ( not ( = ?auto_810995 ?auto_810997 ) ) ( not ( = ?auto_810995 ?auto_810998 ) ) ( not ( = ?auto_810995 ?auto_810999 ) ) ( not ( = ?auto_810995 ?auto_811000 ) ) ( not ( = ?auto_810996 ?auto_810997 ) ) ( not ( = ?auto_810996 ?auto_810998 ) ) ( not ( = ?auto_810996 ?auto_810999 ) ) ( not ( = ?auto_810996 ?auto_811000 ) ) ( not ( = ?auto_810997 ?auto_810998 ) ) ( not ( = ?auto_810997 ?auto_810999 ) ) ( not ( = ?auto_810997 ?auto_811000 ) ) ( not ( = ?auto_810998 ?auto_810999 ) ) ( not ( = ?auto_810998 ?auto_811000 ) ) ( not ( = ?auto_810999 ?auto_811000 ) ) ( CLEAR ?auto_810997 ) ( ON ?auto_810998 ?auto_810999 ) ( CLEAR ?auto_810998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_810991 ?auto_810992 ?auto_810993 ?auto_810994 ?auto_810995 ?auto_810996 ?auto_810997 ?auto_810998 )
      ( MAKE-9PILE ?auto_810991 ?auto_810992 ?auto_810993 ?auto_810994 ?auto_810995 ?auto_810996 ?auto_810997 ?auto_810998 ?auto_810999 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811029 - BLOCK
      ?auto_811030 - BLOCK
      ?auto_811031 - BLOCK
      ?auto_811032 - BLOCK
      ?auto_811033 - BLOCK
      ?auto_811034 - BLOCK
      ?auto_811035 - BLOCK
      ?auto_811036 - BLOCK
      ?auto_811037 - BLOCK
    )
    :vars
    (
      ?auto_811038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811037 ?auto_811038 ) ( ON-TABLE ?auto_811029 ) ( ON ?auto_811030 ?auto_811029 ) ( ON ?auto_811031 ?auto_811030 ) ( ON ?auto_811032 ?auto_811031 ) ( ON ?auto_811033 ?auto_811032 ) ( ON ?auto_811034 ?auto_811033 ) ( not ( = ?auto_811029 ?auto_811030 ) ) ( not ( = ?auto_811029 ?auto_811031 ) ) ( not ( = ?auto_811029 ?auto_811032 ) ) ( not ( = ?auto_811029 ?auto_811033 ) ) ( not ( = ?auto_811029 ?auto_811034 ) ) ( not ( = ?auto_811029 ?auto_811035 ) ) ( not ( = ?auto_811029 ?auto_811036 ) ) ( not ( = ?auto_811029 ?auto_811037 ) ) ( not ( = ?auto_811029 ?auto_811038 ) ) ( not ( = ?auto_811030 ?auto_811031 ) ) ( not ( = ?auto_811030 ?auto_811032 ) ) ( not ( = ?auto_811030 ?auto_811033 ) ) ( not ( = ?auto_811030 ?auto_811034 ) ) ( not ( = ?auto_811030 ?auto_811035 ) ) ( not ( = ?auto_811030 ?auto_811036 ) ) ( not ( = ?auto_811030 ?auto_811037 ) ) ( not ( = ?auto_811030 ?auto_811038 ) ) ( not ( = ?auto_811031 ?auto_811032 ) ) ( not ( = ?auto_811031 ?auto_811033 ) ) ( not ( = ?auto_811031 ?auto_811034 ) ) ( not ( = ?auto_811031 ?auto_811035 ) ) ( not ( = ?auto_811031 ?auto_811036 ) ) ( not ( = ?auto_811031 ?auto_811037 ) ) ( not ( = ?auto_811031 ?auto_811038 ) ) ( not ( = ?auto_811032 ?auto_811033 ) ) ( not ( = ?auto_811032 ?auto_811034 ) ) ( not ( = ?auto_811032 ?auto_811035 ) ) ( not ( = ?auto_811032 ?auto_811036 ) ) ( not ( = ?auto_811032 ?auto_811037 ) ) ( not ( = ?auto_811032 ?auto_811038 ) ) ( not ( = ?auto_811033 ?auto_811034 ) ) ( not ( = ?auto_811033 ?auto_811035 ) ) ( not ( = ?auto_811033 ?auto_811036 ) ) ( not ( = ?auto_811033 ?auto_811037 ) ) ( not ( = ?auto_811033 ?auto_811038 ) ) ( not ( = ?auto_811034 ?auto_811035 ) ) ( not ( = ?auto_811034 ?auto_811036 ) ) ( not ( = ?auto_811034 ?auto_811037 ) ) ( not ( = ?auto_811034 ?auto_811038 ) ) ( not ( = ?auto_811035 ?auto_811036 ) ) ( not ( = ?auto_811035 ?auto_811037 ) ) ( not ( = ?auto_811035 ?auto_811038 ) ) ( not ( = ?auto_811036 ?auto_811037 ) ) ( not ( = ?auto_811036 ?auto_811038 ) ) ( not ( = ?auto_811037 ?auto_811038 ) ) ( ON ?auto_811036 ?auto_811037 ) ( CLEAR ?auto_811034 ) ( ON ?auto_811035 ?auto_811036 ) ( CLEAR ?auto_811035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_811029 ?auto_811030 ?auto_811031 ?auto_811032 ?auto_811033 ?auto_811034 ?auto_811035 )
      ( MAKE-9PILE ?auto_811029 ?auto_811030 ?auto_811031 ?auto_811032 ?auto_811033 ?auto_811034 ?auto_811035 ?auto_811036 ?auto_811037 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811067 - BLOCK
      ?auto_811068 - BLOCK
      ?auto_811069 - BLOCK
      ?auto_811070 - BLOCK
      ?auto_811071 - BLOCK
      ?auto_811072 - BLOCK
      ?auto_811073 - BLOCK
      ?auto_811074 - BLOCK
      ?auto_811075 - BLOCK
    )
    :vars
    (
      ?auto_811076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811075 ?auto_811076 ) ( ON-TABLE ?auto_811067 ) ( ON ?auto_811068 ?auto_811067 ) ( ON ?auto_811069 ?auto_811068 ) ( ON ?auto_811070 ?auto_811069 ) ( ON ?auto_811071 ?auto_811070 ) ( not ( = ?auto_811067 ?auto_811068 ) ) ( not ( = ?auto_811067 ?auto_811069 ) ) ( not ( = ?auto_811067 ?auto_811070 ) ) ( not ( = ?auto_811067 ?auto_811071 ) ) ( not ( = ?auto_811067 ?auto_811072 ) ) ( not ( = ?auto_811067 ?auto_811073 ) ) ( not ( = ?auto_811067 ?auto_811074 ) ) ( not ( = ?auto_811067 ?auto_811075 ) ) ( not ( = ?auto_811067 ?auto_811076 ) ) ( not ( = ?auto_811068 ?auto_811069 ) ) ( not ( = ?auto_811068 ?auto_811070 ) ) ( not ( = ?auto_811068 ?auto_811071 ) ) ( not ( = ?auto_811068 ?auto_811072 ) ) ( not ( = ?auto_811068 ?auto_811073 ) ) ( not ( = ?auto_811068 ?auto_811074 ) ) ( not ( = ?auto_811068 ?auto_811075 ) ) ( not ( = ?auto_811068 ?auto_811076 ) ) ( not ( = ?auto_811069 ?auto_811070 ) ) ( not ( = ?auto_811069 ?auto_811071 ) ) ( not ( = ?auto_811069 ?auto_811072 ) ) ( not ( = ?auto_811069 ?auto_811073 ) ) ( not ( = ?auto_811069 ?auto_811074 ) ) ( not ( = ?auto_811069 ?auto_811075 ) ) ( not ( = ?auto_811069 ?auto_811076 ) ) ( not ( = ?auto_811070 ?auto_811071 ) ) ( not ( = ?auto_811070 ?auto_811072 ) ) ( not ( = ?auto_811070 ?auto_811073 ) ) ( not ( = ?auto_811070 ?auto_811074 ) ) ( not ( = ?auto_811070 ?auto_811075 ) ) ( not ( = ?auto_811070 ?auto_811076 ) ) ( not ( = ?auto_811071 ?auto_811072 ) ) ( not ( = ?auto_811071 ?auto_811073 ) ) ( not ( = ?auto_811071 ?auto_811074 ) ) ( not ( = ?auto_811071 ?auto_811075 ) ) ( not ( = ?auto_811071 ?auto_811076 ) ) ( not ( = ?auto_811072 ?auto_811073 ) ) ( not ( = ?auto_811072 ?auto_811074 ) ) ( not ( = ?auto_811072 ?auto_811075 ) ) ( not ( = ?auto_811072 ?auto_811076 ) ) ( not ( = ?auto_811073 ?auto_811074 ) ) ( not ( = ?auto_811073 ?auto_811075 ) ) ( not ( = ?auto_811073 ?auto_811076 ) ) ( not ( = ?auto_811074 ?auto_811075 ) ) ( not ( = ?auto_811074 ?auto_811076 ) ) ( not ( = ?auto_811075 ?auto_811076 ) ) ( ON ?auto_811074 ?auto_811075 ) ( ON ?auto_811073 ?auto_811074 ) ( CLEAR ?auto_811071 ) ( ON ?auto_811072 ?auto_811073 ) ( CLEAR ?auto_811072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_811067 ?auto_811068 ?auto_811069 ?auto_811070 ?auto_811071 ?auto_811072 )
      ( MAKE-9PILE ?auto_811067 ?auto_811068 ?auto_811069 ?auto_811070 ?auto_811071 ?auto_811072 ?auto_811073 ?auto_811074 ?auto_811075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811105 - BLOCK
      ?auto_811106 - BLOCK
      ?auto_811107 - BLOCK
      ?auto_811108 - BLOCK
      ?auto_811109 - BLOCK
      ?auto_811110 - BLOCK
      ?auto_811111 - BLOCK
      ?auto_811112 - BLOCK
      ?auto_811113 - BLOCK
    )
    :vars
    (
      ?auto_811114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811113 ?auto_811114 ) ( ON-TABLE ?auto_811105 ) ( ON ?auto_811106 ?auto_811105 ) ( ON ?auto_811107 ?auto_811106 ) ( ON ?auto_811108 ?auto_811107 ) ( not ( = ?auto_811105 ?auto_811106 ) ) ( not ( = ?auto_811105 ?auto_811107 ) ) ( not ( = ?auto_811105 ?auto_811108 ) ) ( not ( = ?auto_811105 ?auto_811109 ) ) ( not ( = ?auto_811105 ?auto_811110 ) ) ( not ( = ?auto_811105 ?auto_811111 ) ) ( not ( = ?auto_811105 ?auto_811112 ) ) ( not ( = ?auto_811105 ?auto_811113 ) ) ( not ( = ?auto_811105 ?auto_811114 ) ) ( not ( = ?auto_811106 ?auto_811107 ) ) ( not ( = ?auto_811106 ?auto_811108 ) ) ( not ( = ?auto_811106 ?auto_811109 ) ) ( not ( = ?auto_811106 ?auto_811110 ) ) ( not ( = ?auto_811106 ?auto_811111 ) ) ( not ( = ?auto_811106 ?auto_811112 ) ) ( not ( = ?auto_811106 ?auto_811113 ) ) ( not ( = ?auto_811106 ?auto_811114 ) ) ( not ( = ?auto_811107 ?auto_811108 ) ) ( not ( = ?auto_811107 ?auto_811109 ) ) ( not ( = ?auto_811107 ?auto_811110 ) ) ( not ( = ?auto_811107 ?auto_811111 ) ) ( not ( = ?auto_811107 ?auto_811112 ) ) ( not ( = ?auto_811107 ?auto_811113 ) ) ( not ( = ?auto_811107 ?auto_811114 ) ) ( not ( = ?auto_811108 ?auto_811109 ) ) ( not ( = ?auto_811108 ?auto_811110 ) ) ( not ( = ?auto_811108 ?auto_811111 ) ) ( not ( = ?auto_811108 ?auto_811112 ) ) ( not ( = ?auto_811108 ?auto_811113 ) ) ( not ( = ?auto_811108 ?auto_811114 ) ) ( not ( = ?auto_811109 ?auto_811110 ) ) ( not ( = ?auto_811109 ?auto_811111 ) ) ( not ( = ?auto_811109 ?auto_811112 ) ) ( not ( = ?auto_811109 ?auto_811113 ) ) ( not ( = ?auto_811109 ?auto_811114 ) ) ( not ( = ?auto_811110 ?auto_811111 ) ) ( not ( = ?auto_811110 ?auto_811112 ) ) ( not ( = ?auto_811110 ?auto_811113 ) ) ( not ( = ?auto_811110 ?auto_811114 ) ) ( not ( = ?auto_811111 ?auto_811112 ) ) ( not ( = ?auto_811111 ?auto_811113 ) ) ( not ( = ?auto_811111 ?auto_811114 ) ) ( not ( = ?auto_811112 ?auto_811113 ) ) ( not ( = ?auto_811112 ?auto_811114 ) ) ( not ( = ?auto_811113 ?auto_811114 ) ) ( ON ?auto_811112 ?auto_811113 ) ( ON ?auto_811111 ?auto_811112 ) ( ON ?auto_811110 ?auto_811111 ) ( CLEAR ?auto_811108 ) ( ON ?auto_811109 ?auto_811110 ) ( CLEAR ?auto_811109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_811105 ?auto_811106 ?auto_811107 ?auto_811108 ?auto_811109 )
      ( MAKE-9PILE ?auto_811105 ?auto_811106 ?auto_811107 ?auto_811108 ?auto_811109 ?auto_811110 ?auto_811111 ?auto_811112 ?auto_811113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811143 - BLOCK
      ?auto_811144 - BLOCK
      ?auto_811145 - BLOCK
      ?auto_811146 - BLOCK
      ?auto_811147 - BLOCK
      ?auto_811148 - BLOCK
      ?auto_811149 - BLOCK
      ?auto_811150 - BLOCK
      ?auto_811151 - BLOCK
    )
    :vars
    (
      ?auto_811152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811151 ?auto_811152 ) ( ON-TABLE ?auto_811143 ) ( ON ?auto_811144 ?auto_811143 ) ( ON ?auto_811145 ?auto_811144 ) ( not ( = ?auto_811143 ?auto_811144 ) ) ( not ( = ?auto_811143 ?auto_811145 ) ) ( not ( = ?auto_811143 ?auto_811146 ) ) ( not ( = ?auto_811143 ?auto_811147 ) ) ( not ( = ?auto_811143 ?auto_811148 ) ) ( not ( = ?auto_811143 ?auto_811149 ) ) ( not ( = ?auto_811143 ?auto_811150 ) ) ( not ( = ?auto_811143 ?auto_811151 ) ) ( not ( = ?auto_811143 ?auto_811152 ) ) ( not ( = ?auto_811144 ?auto_811145 ) ) ( not ( = ?auto_811144 ?auto_811146 ) ) ( not ( = ?auto_811144 ?auto_811147 ) ) ( not ( = ?auto_811144 ?auto_811148 ) ) ( not ( = ?auto_811144 ?auto_811149 ) ) ( not ( = ?auto_811144 ?auto_811150 ) ) ( not ( = ?auto_811144 ?auto_811151 ) ) ( not ( = ?auto_811144 ?auto_811152 ) ) ( not ( = ?auto_811145 ?auto_811146 ) ) ( not ( = ?auto_811145 ?auto_811147 ) ) ( not ( = ?auto_811145 ?auto_811148 ) ) ( not ( = ?auto_811145 ?auto_811149 ) ) ( not ( = ?auto_811145 ?auto_811150 ) ) ( not ( = ?auto_811145 ?auto_811151 ) ) ( not ( = ?auto_811145 ?auto_811152 ) ) ( not ( = ?auto_811146 ?auto_811147 ) ) ( not ( = ?auto_811146 ?auto_811148 ) ) ( not ( = ?auto_811146 ?auto_811149 ) ) ( not ( = ?auto_811146 ?auto_811150 ) ) ( not ( = ?auto_811146 ?auto_811151 ) ) ( not ( = ?auto_811146 ?auto_811152 ) ) ( not ( = ?auto_811147 ?auto_811148 ) ) ( not ( = ?auto_811147 ?auto_811149 ) ) ( not ( = ?auto_811147 ?auto_811150 ) ) ( not ( = ?auto_811147 ?auto_811151 ) ) ( not ( = ?auto_811147 ?auto_811152 ) ) ( not ( = ?auto_811148 ?auto_811149 ) ) ( not ( = ?auto_811148 ?auto_811150 ) ) ( not ( = ?auto_811148 ?auto_811151 ) ) ( not ( = ?auto_811148 ?auto_811152 ) ) ( not ( = ?auto_811149 ?auto_811150 ) ) ( not ( = ?auto_811149 ?auto_811151 ) ) ( not ( = ?auto_811149 ?auto_811152 ) ) ( not ( = ?auto_811150 ?auto_811151 ) ) ( not ( = ?auto_811150 ?auto_811152 ) ) ( not ( = ?auto_811151 ?auto_811152 ) ) ( ON ?auto_811150 ?auto_811151 ) ( ON ?auto_811149 ?auto_811150 ) ( ON ?auto_811148 ?auto_811149 ) ( ON ?auto_811147 ?auto_811148 ) ( CLEAR ?auto_811145 ) ( ON ?auto_811146 ?auto_811147 ) ( CLEAR ?auto_811146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_811143 ?auto_811144 ?auto_811145 ?auto_811146 )
      ( MAKE-9PILE ?auto_811143 ?auto_811144 ?auto_811145 ?auto_811146 ?auto_811147 ?auto_811148 ?auto_811149 ?auto_811150 ?auto_811151 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811181 - BLOCK
      ?auto_811182 - BLOCK
      ?auto_811183 - BLOCK
      ?auto_811184 - BLOCK
      ?auto_811185 - BLOCK
      ?auto_811186 - BLOCK
      ?auto_811187 - BLOCK
      ?auto_811188 - BLOCK
      ?auto_811189 - BLOCK
    )
    :vars
    (
      ?auto_811190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811189 ?auto_811190 ) ( ON-TABLE ?auto_811181 ) ( ON ?auto_811182 ?auto_811181 ) ( not ( = ?auto_811181 ?auto_811182 ) ) ( not ( = ?auto_811181 ?auto_811183 ) ) ( not ( = ?auto_811181 ?auto_811184 ) ) ( not ( = ?auto_811181 ?auto_811185 ) ) ( not ( = ?auto_811181 ?auto_811186 ) ) ( not ( = ?auto_811181 ?auto_811187 ) ) ( not ( = ?auto_811181 ?auto_811188 ) ) ( not ( = ?auto_811181 ?auto_811189 ) ) ( not ( = ?auto_811181 ?auto_811190 ) ) ( not ( = ?auto_811182 ?auto_811183 ) ) ( not ( = ?auto_811182 ?auto_811184 ) ) ( not ( = ?auto_811182 ?auto_811185 ) ) ( not ( = ?auto_811182 ?auto_811186 ) ) ( not ( = ?auto_811182 ?auto_811187 ) ) ( not ( = ?auto_811182 ?auto_811188 ) ) ( not ( = ?auto_811182 ?auto_811189 ) ) ( not ( = ?auto_811182 ?auto_811190 ) ) ( not ( = ?auto_811183 ?auto_811184 ) ) ( not ( = ?auto_811183 ?auto_811185 ) ) ( not ( = ?auto_811183 ?auto_811186 ) ) ( not ( = ?auto_811183 ?auto_811187 ) ) ( not ( = ?auto_811183 ?auto_811188 ) ) ( not ( = ?auto_811183 ?auto_811189 ) ) ( not ( = ?auto_811183 ?auto_811190 ) ) ( not ( = ?auto_811184 ?auto_811185 ) ) ( not ( = ?auto_811184 ?auto_811186 ) ) ( not ( = ?auto_811184 ?auto_811187 ) ) ( not ( = ?auto_811184 ?auto_811188 ) ) ( not ( = ?auto_811184 ?auto_811189 ) ) ( not ( = ?auto_811184 ?auto_811190 ) ) ( not ( = ?auto_811185 ?auto_811186 ) ) ( not ( = ?auto_811185 ?auto_811187 ) ) ( not ( = ?auto_811185 ?auto_811188 ) ) ( not ( = ?auto_811185 ?auto_811189 ) ) ( not ( = ?auto_811185 ?auto_811190 ) ) ( not ( = ?auto_811186 ?auto_811187 ) ) ( not ( = ?auto_811186 ?auto_811188 ) ) ( not ( = ?auto_811186 ?auto_811189 ) ) ( not ( = ?auto_811186 ?auto_811190 ) ) ( not ( = ?auto_811187 ?auto_811188 ) ) ( not ( = ?auto_811187 ?auto_811189 ) ) ( not ( = ?auto_811187 ?auto_811190 ) ) ( not ( = ?auto_811188 ?auto_811189 ) ) ( not ( = ?auto_811188 ?auto_811190 ) ) ( not ( = ?auto_811189 ?auto_811190 ) ) ( ON ?auto_811188 ?auto_811189 ) ( ON ?auto_811187 ?auto_811188 ) ( ON ?auto_811186 ?auto_811187 ) ( ON ?auto_811185 ?auto_811186 ) ( ON ?auto_811184 ?auto_811185 ) ( CLEAR ?auto_811182 ) ( ON ?auto_811183 ?auto_811184 ) ( CLEAR ?auto_811183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_811181 ?auto_811182 ?auto_811183 )
      ( MAKE-9PILE ?auto_811181 ?auto_811182 ?auto_811183 ?auto_811184 ?auto_811185 ?auto_811186 ?auto_811187 ?auto_811188 ?auto_811189 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811219 - BLOCK
      ?auto_811220 - BLOCK
      ?auto_811221 - BLOCK
      ?auto_811222 - BLOCK
      ?auto_811223 - BLOCK
      ?auto_811224 - BLOCK
      ?auto_811225 - BLOCK
      ?auto_811226 - BLOCK
      ?auto_811227 - BLOCK
    )
    :vars
    (
      ?auto_811228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811227 ?auto_811228 ) ( ON-TABLE ?auto_811219 ) ( not ( = ?auto_811219 ?auto_811220 ) ) ( not ( = ?auto_811219 ?auto_811221 ) ) ( not ( = ?auto_811219 ?auto_811222 ) ) ( not ( = ?auto_811219 ?auto_811223 ) ) ( not ( = ?auto_811219 ?auto_811224 ) ) ( not ( = ?auto_811219 ?auto_811225 ) ) ( not ( = ?auto_811219 ?auto_811226 ) ) ( not ( = ?auto_811219 ?auto_811227 ) ) ( not ( = ?auto_811219 ?auto_811228 ) ) ( not ( = ?auto_811220 ?auto_811221 ) ) ( not ( = ?auto_811220 ?auto_811222 ) ) ( not ( = ?auto_811220 ?auto_811223 ) ) ( not ( = ?auto_811220 ?auto_811224 ) ) ( not ( = ?auto_811220 ?auto_811225 ) ) ( not ( = ?auto_811220 ?auto_811226 ) ) ( not ( = ?auto_811220 ?auto_811227 ) ) ( not ( = ?auto_811220 ?auto_811228 ) ) ( not ( = ?auto_811221 ?auto_811222 ) ) ( not ( = ?auto_811221 ?auto_811223 ) ) ( not ( = ?auto_811221 ?auto_811224 ) ) ( not ( = ?auto_811221 ?auto_811225 ) ) ( not ( = ?auto_811221 ?auto_811226 ) ) ( not ( = ?auto_811221 ?auto_811227 ) ) ( not ( = ?auto_811221 ?auto_811228 ) ) ( not ( = ?auto_811222 ?auto_811223 ) ) ( not ( = ?auto_811222 ?auto_811224 ) ) ( not ( = ?auto_811222 ?auto_811225 ) ) ( not ( = ?auto_811222 ?auto_811226 ) ) ( not ( = ?auto_811222 ?auto_811227 ) ) ( not ( = ?auto_811222 ?auto_811228 ) ) ( not ( = ?auto_811223 ?auto_811224 ) ) ( not ( = ?auto_811223 ?auto_811225 ) ) ( not ( = ?auto_811223 ?auto_811226 ) ) ( not ( = ?auto_811223 ?auto_811227 ) ) ( not ( = ?auto_811223 ?auto_811228 ) ) ( not ( = ?auto_811224 ?auto_811225 ) ) ( not ( = ?auto_811224 ?auto_811226 ) ) ( not ( = ?auto_811224 ?auto_811227 ) ) ( not ( = ?auto_811224 ?auto_811228 ) ) ( not ( = ?auto_811225 ?auto_811226 ) ) ( not ( = ?auto_811225 ?auto_811227 ) ) ( not ( = ?auto_811225 ?auto_811228 ) ) ( not ( = ?auto_811226 ?auto_811227 ) ) ( not ( = ?auto_811226 ?auto_811228 ) ) ( not ( = ?auto_811227 ?auto_811228 ) ) ( ON ?auto_811226 ?auto_811227 ) ( ON ?auto_811225 ?auto_811226 ) ( ON ?auto_811224 ?auto_811225 ) ( ON ?auto_811223 ?auto_811224 ) ( ON ?auto_811222 ?auto_811223 ) ( ON ?auto_811221 ?auto_811222 ) ( CLEAR ?auto_811219 ) ( ON ?auto_811220 ?auto_811221 ) ( CLEAR ?auto_811220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_811219 ?auto_811220 )
      ( MAKE-9PILE ?auto_811219 ?auto_811220 ?auto_811221 ?auto_811222 ?auto_811223 ?auto_811224 ?auto_811225 ?auto_811226 ?auto_811227 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_811257 - BLOCK
      ?auto_811258 - BLOCK
      ?auto_811259 - BLOCK
      ?auto_811260 - BLOCK
      ?auto_811261 - BLOCK
      ?auto_811262 - BLOCK
      ?auto_811263 - BLOCK
      ?auto_811264 - BLOCK
      ?auto_811265 - BLOCK
    )
    :vars
    (
      ?auto_811266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811265 ?auto_811266 ) ( not ( = ?auto_811257 ?auto_811258 ) ) ( not ( = ?auto_811257 ?auto_811259 ) ) ( not ( = ?auto_811257 ?auto_811260 ) ) ( not ( = ?auto_811257 ?auto_811261 ) ) ( not ( = ?auto_811257 ?auto_811262 ) ) ( not ( = ?auto_811257 ?auto_811263 ) ) ( not ( = ?auto_811257 ?auto_811264 ) ) ( not ( = ?auto_811257 ?auto_811265 ) ) ( not ( = ?auto_811257 ?auto_811266 ) ) ( not ( = ?auto_811258 ?auto_811259 ) ) ( not ( = ?auto_811258 ?auto_811260 ) ) ( not ( = ?auto_811258 ?auto_811261 ) ) ( not ( = ?auto_811258 ?auto_811262 ) ) ( not ( = ?auto_811258 ?auto_811263 ) ) ( not ( = ?auto_811258 ?auto_811264 ) ) ( not ( = ?auto_811258 ?auto_811265 ) ) ( not ( = ?auto_811258 ?auto_811266 ) ) ( not ( = ?auto_811259 ?auto_811260 ) ) ( not ( = ?auto_811259 ?auto_811261 ) ) ( not ( = ?auto_811259 ?auto_811262 ) ) ( not ( = ?auto_811259 ?auto_811263 ) ) ( not ( = ?auto_811259 ?auto_811264 ) ) ( not ( = ?auto_811259 ?auto_811265 ) ) ( not ( = ?auto_811259 ?auto_811266 ) ) ( not ( = ?auto_811260 ?auto_811261 ) ) ( not ( = ?auto_811260 ?auto_811262 ) ) ( not ( = ?auto_811260 ?auto_811263 ) ) ( not ( = ?auto_811260 ?auto_811264 ) ) ( not ( = ?auto_811260 ?auto_811265 ) ) ( not ( = ?auto_811260 ?auto_811266 ) ) ( not ( = ?auto_811261 ?auto_811262 ) ) ( not ( = ?auto_811261 ?auto_811263 ) ) ( not ( = ?auto_811261 ?auto_811264 ) ) ( not ( = ?auto_811261 ?auto_811265 ) ) ( not ( = ?auto_811261 ?auto_811266 ) ) ( not ( = ?auto_811262 ?auto_811263 ) ) ( not ( = ?auto_811262 ?auto_811264 ) ) ( not ( = ?auto_811262 ?auto_811265 ) ) ( not ( = ?auto_811262 ?auto_811266 ) ) ( not ( = ?auto_811263 ?auto_811264 ) ) ( not ( = ?auto_811263 ?auto_811265 ) ) ( not ( = ?auto_811263 ?auto_811266 ) ) ( not ( = ?auto_811264 ?auto_811265 ) ) ( not ( = ?auto_811264 ?auto_811266 ) ) ( not ( = ?auto_811265 ?auto_811266 ) ) ( ON ?auto_811264 ?auto_811265 ) ( ON ?auto_811263 ?auto_811264 ) ( ON ?auto_811262 ?auto_811263 ) ( ON ?auto_811261 ?auto_811262 ) ( ON ?auto_811260 ?auto_811261 ) ( ON ?auto_811259 ?auto_811260 ) ( ON ?auto_811258 ?auto_811259 ) ( ON ?auto_811257 ?auto_811258 ) ( CLEAR ?auto_811257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_811257 )
      ( MAKE-9PILE ?auto_811257 ?auto_811258 ?auto_811259 ?auto_811260 ?auto_811261 ?auto_811262 ?auto_811263 ?auto_811264 ?auto_811265 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811296 - BLOCK
      ?auto_811297 - BLOCK
      ?auto_811298 - BLOCK
      ?auto_811299 - BLOCK
      ?auto_811300 - BLOCK
      ?auto_811301 - BLOCK
      ?auto_811302 - BLOCK
      ?auto_811303 - BLOCK
      ?auto_811304 - BLOCK
      ?auto_811305 - BLOCK
    )
    :vars
    (
      ?auto_811306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_811304 ) ( ON ?auto_811305 ?auto_811306 ) ( CLEAR ?auto_811305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_811296 ) ( ON ?auto_811297 ?auto_811296 ) ( ON ?auto_811298 ?auto_811297 ) ( ON ?auto_811299 ?auto_811298 ) ( ON ?auto_811300 ?auto_811299 ) ( ON ?auto_811301 ?auto_811300 ) ( ON ?auto_811302 ?auto_811301 ) ( ON ?auto_811303 ?auto_811302 ) ( ON ?auto_811304 ?auto_811303 ) ( not ( = ?auto_811296 ?auto_811297 ) ) ( not ( = ?auto_811296 ?auto_811298 ) ) ( not ( = ?auto_811296 ?auto_811299 ) ) ( not ( = ?auto_811296 ?auto_811300 ) ) ( not ( = ?auto_811296 ?auto_811301 ) ) ( not ( = ?auto_811296 ?auto_811302 ) ) ( not ( = ?auto_811296 ?auto_811303 ) ) ( not ( = ?auto_811296 ?auto_811304 ) ) ( not ( = ?auto_811296 ?auto_811305 ) ) ( not ( = ?auto_811296 ?auto_811306 ) ) ( not ( = ?auto_811297 ?auto_811298 ) ) ( not ( = ?auto_811297 ?auto_811299 ) ) ( not ( = ?auto_811297 ?auto_811300 ) ) ( not ( = ?auto_811297 ?auto_811301 ) ) ( not ( = ?auto_811297 ?auto_811302 ) ) ( not ( = ?auto_811297 ?auto_811303 ) ) ( not ( = ?auto_811297 ?auto_811304 ) ) ( not ( = ?auto_811297 ?auto_811305 ) ) ( not ( = ?auto_811297 ?auto_811306 ) ) ( not ( = ?auto_811298 ?auto_811299 ) ) ( not ( = ?auto_811298 ?auto_811300 ) ) ( not ( = ?auto_811298 ?auto_811301 ) ) ( not ( = ?auto_811298 ?auto_811302 ) ) ( not ( = ?auto_811298 ?auto_811303 ) ) ( not ( = ?auto_811298 ?auto_811304 ) ) ( not ( = ?auto_811298 ?auto_811305 ) ) ( not ( = ?auto_811298 ?auto_811306 ) ) ( not ( = ?auto_811299 ?auto_811300 ) ) ( not ( = ?auto_811299 ?auto_811301 ) ) ( not ( = ?auto_811299 ?auto_811302 ) ) ( not ( = ?auto_811299 ?auto_811303 ) ) ( not ( = ?auto_811299 ?auto_811304 ) ) ( not ( = ?auto_811299 ?auto_811305 ) ) ( not ( = ?auto_811299 ?auto_811306 ) ) ( not ( = ?auto_811300 ?auto_811301 ) ) ( not ( = ?auto_811300 ?auto_811302 ) ) ( not ( = ?auto_811300 ?auto_811303 ) ) ( not ( = ?auto_811300 ?auto_811304 ) ) ( not ( = ?auto_811300 ?auto_811305 ) ) ( not ( = ?auto_811300 ?auto_811306 ) ) ( not ( = ?auto_811301 ?auto_811302 ) ) ( not ( = ?auto_811301 ?auto_811303 ) ) ( not ( = ?auto_811301 ?auto_811304 ) ) ( not ( = ?auto_811301 ?auto_811305 ) ) ( not ( = ?auto_811301 ?auto_811306 ) ) ( not ( = ?auto_811302 ?auto_811303 ) ) ( not ( = ?auto_811302 ?auto_811304 ) ) ( not ( = ?auto_811302 ?auto_811305 ) ) ( not ( = ?auto_811302 ?auto_811306 ) ) ( not ( = ?auto_811303 ?auto_811304 ) ) ( not ( = ?auto_811303 ?auto_811305 ) ) ( not ( = ?auto_811303 ?auto_811306 ) ) ( not ( = ?auto_811304 ?auto_811305 ) ) ( not ( = ?auto_811304 ?auto_811306 ) ) ( not ( = ?auto_811305 ?auto_811306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_811305 ?auto_811306 )
      ( !STACK ?auto_811305 ?auto_811304 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811338 - BLOCK
      ?auto_811339 - BLOCK
      ?auto_811340 - BLOCK
      ?auto_811341 - BLOCK
      ?auto_811342 - BLOCK
      ?auto_811343 - BLOCK
      ?auto_811344 - BLOCK
      ?auto_811345 - BLOCK
      ?auto_811346 - BLOCK
      ?auto_811347 - BLOCK
    )
    :vars
    (
      ?auto_811348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811347 ?auto_811348 ) ( ON-TABLE ?auto_811338 ) ( ON ?auto_811339 ?auto_811338 ) ( ON ?auto_811340 ?auto_811339 ) ( ON ?auto_811341 ?auto_811340 ) ( ON ?auto_811342 ?auto_811341 ) ( ON ?auto_811343 ?auto_811342 ) ( ON ?auto_811344 ?auto_811343 ) ( ON ?auto_811345 ?auto_811344 ) ( not ( = ?auto_811338 ?auto_811339 ) ) ( not ( = ?auto_811338 ?auto_811340 ) ) ( not ( = ?auto_811338 ?auto_811341 ) ) ( not ( = ?auto_811338 ?auto_811342 ) ) ( not ( = ?auto_811338 ?auto_811343 ) ) ( not ( = ?auto_811338 ?auto_811344 ) ) ( not ( = ?auto_811338 ?auto_811345 ) ) ( not ( = ?auto_811338 ?auto_811346 ) ) ( not ( = ?auto_811338 ?auto_811347 ) ) ( not ( = ?auto_811338 ?auto_811348 ) ) ( not ( = ?auto_811339 ?auto_811340 ) ) ( not ( = ?auto_811339 ?auto_811341 ) ) ( not ( = ?auto_811339 ?auto_811342 ) ) ( not ( = ?auto_811339 ?auto_811343 ) ) ( not ( = ?auto_811339 ?auto_811344 ) ) ( not ( = ?auto_811339 ?auto_811345 ) ) ( not ( = ?auto_811339 ?auto_811346 ) ) ( not ( = ?auto_811339 ?auto_811347 ) ) ( not ( = ?auto_811339 ?auto_811348 ) ) ( not ( = ?auto_811340 ?auto_811341 ) ) ( not ( = ?auto_811340 ?auto_811342 ) ) ( not ( = ?auto_811340 ?auto_811343 ) ) ( not ( = ?auto_811340 ?auto_811344 ) ) ( not ( = ?auto_811340 ?auto_811345 ) ) ( not ( = ?auto_811340 ?auto_811346 ) ) ( not ( = ?auto_811340 ?auto_811347 ) ) ( not ( = ?auto_811340 ?auto_811348 ) ) ( not ( = ?auto_811341 ?auto_811342 ) ) ( not ( = ?auto_811341 ?auto_811343 ) ) ( not ( = ?auto_811341 ?auto_811344 ) ) ( not ( = ?auto_811341 ?auto_811345 ) ) ( not ( = ?auto_811341 ?auto_811346 ) ) ( not ( = ?auto_811341 ?auto_811347 ) ) ( not ( = ?auto_811341 ?auto_811348 ) ) ( not ( = ?auto_811342 ?auto_811343 ) ) ( not ( = ?auto_811342 ?auto_811344 ) ) ( not ( = ?auto_811342 ?auto_811345 ) ) ( not ( = ?auto_811342 ?auto_811346 ) ) ( not ( = ?auto_811342 ?auto_811347 ) ) ( not ( = ?auto_811342 ?auto_811348 ) ) ( not ( = ?auto_811343 ?auto_811344 ) ) ( not ( = ?auto_811343 ?auto_811345 ) ) ( not ( = ?auto_811343 ?auto_811346 ) ) ( not ( = ?auto_811343 ?auto_811347 ) ) ( not ( = ?auto_811343 ?auto_811348 ) ) ( not ( = ?auto_811344 ?auto_811345 ) ) ( not ( = ?auto_811344 ?auto_811346 ) ) ( not ( = ?auto_811344 ?auto_811347 ) ) ( not ( = ?auto_811344 ?auto_811348 ) ) ( not ( = ?auto_811345 ?auto_811346 ) ) ( not ( = ?auto_811345 ?auto_811347 ) ) ( not ( = ?auto_811345 ?auto_811348 ) ) ( not ( = ?auto_811346 ?auto_811347 ) ) ( not ( = ?auto_811346 ?auto_811348 ) ) ( not ( = ?auto_811347 ?auto_811348 ) ) ( CLEAR ?auto_811345 ) ( ON ?auto_811346 ?auto_811347 ) ( CLEAR ?auto_811346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_811338 ?auto_811339 ?auto_811340 ?auto_811341 ?auto_811342 ?auto_811343 ?auto_811344 ?auto_811345 ?auto_811346 )
      ( MAKE-10PILE ?auto_811338 ?auto_811339 ?auto_811340 ?auto_811341 ?auto_811342 ?auto_811343 ?auto_811344 ?auto_811345 ?auto_811346 ?auto_811347 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811380 - BLOCK
      ?auto_811381 - BLOCK
      ?auto_811382 - BLOCK
      ?auto_811383 - BLOCK
      ?auto_811384 - BLOCK
      ?auto_811385 - BLOCK
      ?auto_811386 - BLOCK
      ?auto_811387 - BLOCK
      ?auto_811388 - BLOCK
      ?auto_811389 - BLOCK
    )
    :vars
    (
      ?auto_811390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811389 ?auto_811390 ) ( ON-TABLE ?auto_811380 ) ( ON ?auto_811381 ?auto_811380 ) ( ON ?auto_811382 ?auto_811381 ) ( ON ?auto_811383 ?auto_811382 ) ( ON ?auto_811384 ?auto_811383 ) ( ON ?auto_811385 ?auto_811384 ) ( ON ?auto_811386 ?auto_811385 ) ( not ( = ?auto_811380 ?auto_811381 ) ) ( not ( = ?auto_811380 ?auto_811382 ) ) ( not ( = ?auto_811380 ?auto_811383 ) ) ( not ( = ?auto_811380 ?auto_811384 ) ) ( not ( = ?auto_811380 ?auto_811385 ) ) ( not ( = ?auto_811380 ?auto_811386 ) ) ( not ( = ?auto_811380 ?auto_811387 ) ) ( not ( = ?auto_811380 ?auto_811388 ) ) ( not ( = ?auto_811380 ?auto_811389 ) ) ( not ( = ?auto_811380 ?auto_811390 ) ) ( not ( = ?auto_811381 ?auto_811382 ) ) ( not ( = ?auto_811381 ?auto_811383 ) ) ( not ( = ?auto_811381 ?auto_811384 ) ) ( not ( = ?auto_811381 ?auto_811385 ) ) ( not ( = ?auto_811381 ?auto_811386 ) ) ( not ( = ?auto_811381 ?auto_811387 ) ) ( not ( = ?auto_811381 ?auto_811388 ) ) ( not ( = ?auto_811381 ?auto_811389 ) ) ( not ( = ?auto_811381 ?auto_811390 ) ) ( not ( = ?auto_811382 ?auto_811383 ) ) ( not ( = ?auto_811382 ?auto_811384 ) ) ( not ( = ?auto_811382 ?auto_811385 ) ) ( not ( = ?auto_811382 ?auto_811386 ) ) ( not ( = ?auto_811382 ?auto_811387 ) ) ( not ( = ?auto_811382 ?auto_811388 ) ) ( not ( = ?auto_811382 ?auto_811389 ) ) ( not ( = ?auto_811382 ?auto_811390 ) ) ( not ( = ?auto_811383 ?auto_811384 ) ) ( not ( = ?auto_811383 ?auto_811385 ) ) ( not ( = ?auto_811383 ?auto_811386 ) ) ( not ( = ?auto_811383 ?auto_811387 ) ) ( not ( = ?auto_811383 ?auto_811388 ) ) ( not ( = ?auto_811383 ?auto_811389 ) ) ( not ( = ?auto_811383 ?auto_811390 ) ) ( not ( = ?auto_811384 ?auto_811385 ) ) ( not ( = ?auto_811384 ?auto_811386 ) ) ( not ( = ?auto_811384 ?auto_811387 ) ) ( not ( = ?auto_811384 ?auto_811388 ) ) ( not ( = ?auto_811384 ?auto_811389 ) ) ( not ( = ?auto_811384 ?auto_811390 ) ) ( not ( = ?auto_811385 ?auto_811386 ) ) ( not ( = ?auto_811385 ?auto_811387 ) ) ( not ( = ?auto_811385 ?auto_811388 ) ) ( not ( = ?auto_811385 ?auto_811389 ) ) ( not ( = ?auto_811385 ?auto_811390 ) ) ( not ( = ?auto_811386 ?auto_811387 ) ) ( not ( = ?auto_811386 ?auto_811388 ) ) ( not ( = ?auto_811386 ?auto_811389 ) ) ( not ( = ?auto_811386 ?auto_811390 ) ) ( not ( = ?auto_811387 ?auto_811388 ) ) ( not ( = ?auto_811387 ?auto_811389 ) ) ( not ( = ?auto_811387 ?auto_811390 ) ) ( not ( = ?auto_811388 ?auto_811389 ) ) ( not ( = ?auto_811388 ?auto_811390 ) ) ( not ( = ?auto_811389 ?auto_811390 ) ) ( ON ?auto_811388 ?auto_811389 ) ( CLEAR ?auto_811386 ) ( ON ?auto_811387 ?auto_811388 ) ( CLEAR ?auto_811387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_811380 ?auto_811381 ?auto_811382 ?auto_811383 ?auto_811384 ?auto_811385 ?auto_811386 ?auto_811387 )
      ( MAKE-10PILE ?auto_811380 ?auto_811381 ?auto_811382 ?auto_811383 ?auto_811384 ?auto_811385 ?auto_811386 ?auto_811387 ?auto_811388 ?auto_811389 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811422 - BLOCK
      ?auto_811423 - BLOCK
      ?auto_811424 - BLOCK
      ?auto_811425 - BLOCK
      ?auto_811426 - BLOCK
      ?auto_811427 - BLOCK
      ?auto_811428 - BLOCK
      ?auto_811429 - BLOCK
      ?auto_811430 - BLOCK
      ?auto_811431 - BLOCK
    )
    :vars
    (
      ?auto_811432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811431 ?auto_811432 ) ( ON-TABLE ?auto_811422 ) ( ON ?auto_811423 ?auto_811422 ) ( ON ?auto_811424 ?auto_811423 ) ( ON ?auto_811425 ?auto_811424 ) ( ON ?auto_811426 ?auto_811425 ) ( ON ?auto_811427 ?auto_811426 ) ( not ( = ?auto_811422 ?auto_811423 ) ) ( not ( = ?auto_811422 ?auto_811424 ) ) ( not ( = ?auto_811422 ?auto_811425 ) ) ( not ( = ?auto_811422 ?auto_811426 ) ) ( not ( = ?auto_811422 ?auto_811427 ) ) ( not ( = ?auto_811422 ?auto_811428 ) ) ( not ( = ?auto_811422 ?auto_811429 ) ) ( not ( = ?auto_811422 ?auto_811430 ) ) ( not ( = ?auto_811422 ?auto_811431 ) ) ( not ( = ?auto_811422 ?auto_811432 ) ) ( not ( = ?auto_811423 ?auto_811424 ) ) ( not ( = ?auto_811423 ?auto_811425 ) ) ( not ( = ?auto_811423 ?auto_811426 ) ) ( not ( = ?auto_811423 ?auto_811427 ) ) ( not ( = ?auto_811423 ?auto_811428 ) ) ( not ( = ?auto_811423 ?auto_811429 ) ) ( not ( = ?auto_811423 ?auto_811430 ) ) ( not ( = ?auto_811423 ?auto_811431 ) ) ( not ( = ?auto_811423 ?auto_811432 ) ) ( not ( = ?auto_811424 ?auto_811425 ) ) ( not ( = ?auto_811424 ?auto_811426 ) ) ( not ( = ?auto_811424 ?auto_811427 ) ) ( not ( = ?auto_811424 ?auto_811428 ) ) ( not ( = ?auto_811424 ?auto_811429 ) ) ( not ( = ?auto_811424 ?auto_811430 ) ) ( not ( = ?auto_811424 ?auto_811431 ) ) ( not ( = ?auto_811424 ?auto_811432 ) ) ( not ( = ?auto_811425 ?auto_811426 ) ) ( not ( = ?auto_811425 ?auto_811427 ) ) ( not ( = ?auto_811425 ?auto_811428 ) ) ( not ( = ?auto_811425 ?auto_811429 ) ) ( not ( = ?auto_811425 ?auto_811430 ) ) ( not ( = ?auto_811425 ?auto_811431 ) ) ( not ( = ?auto_811425 ?auto_811432 ) ) ( not ( = ?auto_811426 ?auto_811427 ) ) ( not ( = ?auto_811426 ?auto_811428 ) ) ( not ( = ?auto_811426 ?auto_811429 ) ) ( not ( = ?auto_811426 ?auto_811430 ) ) ( not ( = ?auto_811426 ?auto_811431 ) ) ( not ( = ?auto_811426 ?auto_811432 ) ) ( not ( = ?auto_811427 ?auto_811428 ) ) ( not ( = ?auto_811427 ?auto_811429 ) ) ( not ( = ?auto_811427 ?auto_811430 ) ) ( not ( = ?auto_811427 ?auto_811431 ) ) ( not ( = ?auto_811427 ?auto_811432 ) ) ( not ( = ?auto_811428 ?auto_811429 ) ) ( not ( = ?auto_811428 ?auto_811430 ) ) ( not ( = ?auto_811428 ?auto_811431 ) ) ( not ( = ?auto_811428 ?auto_811432 ) ) ( not ( = ?auto_811429 ?auto_811430 ) ) ( not ( = ?auto_811429 ?auto_811431 ) ) ( not ( = ?auto_811429 ?auto_811432 ) ) ( not ( = ?auto_811430 ?auto_811431 ) ) ( not ( = ?auto_811430 ?auto_811432 ) ) ( not ( = ?auto_811431 ?auto_811432 ) ) ( ON ?auto_811430 ?auto_811431 ) ( ON ?auto_811429 ?auto_811430 ) ( CLEAR ?auto_811427 ) ( ON ?auto_811428 ?auto_811429 ) ( CLEAR ?auto_811428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_811422 ?auto_811423 ?auto_811424 ?auto_811425 ?auto_811426 ?auto_811427 ?auto_811428 )
      ( MAKE-10PILE ?auto_811422 ?auto_811423 ?auto_811424 ?auto_811425 ?auto_811426 ?auto_811427 ?auto_811428 ?auto_811429 ?auto_811430 ?auto_811431 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811464 - BLOCK
      ?auto_811465 - BLOCK
      ?auto_811466 - BLOCK
      ?auto_811467 - BLOCK
      ?auto_811468 - BLOCK
      ?auto_811469 - BLOCK
      ?auto_811470 - BLOCK
      ?auto_811471 - BLOCK
      ?auto_811472 - BLOCK
      ?auto_811473 - BLOCK
    )
    :vars
    (
      ?auto_811474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811473 ?auto_811474 ) ( ON-TABLE ?auto_811464 ) ( ON ?auto_811465 ?auto_811464 ) ( ON ?auto_811466 ?auto_811465 ) ( ON ?auto_811467 ?auto_811466 ) ( ON ?auto_811468 ?auto_811467 ) ( not ( = ?auto_811464 ?auto_811465 ) ) ( not ( = ?auto_811464 ?auto_811466 ) ) ( not ( = ?auto_811464 ?auto_811467 ) ) ( not ( = ?auto_811464 ?auto_811468 ) ) ( not ( = ?auto_811464 ?auto_811469 ) ) ( not ( = ?auto_811464 ?auto_811470 ) ) ( not ( = ?auto_811464 ?auto_811471 ) ) ( not ( = ?auto_811464 ?auto_811472 ) ) ( not ( = ?auto_811464 ?auto_811473 ) ) ( not ( = ?auto_811464 ?auto_811474 ) ) ( not ( = ?auto_811465 ?auto_811466 ) ) ( not ( = ?auto_811465 ?auto_811467 ) ) ( not ( = ?auto_811465 ?auto_811468 ) ) ( not ( = ?auto_811465 ?auto_811469 ) ) ( not ( = ?auto_811465 ?auto_811470 ) ) ( not ( = ?auto_811465 ?auto_811471 ) ) ( not ( = ?auto_811465 ?auto_811472 ) ) ( not ( = ?auto_811465 ?auto_811473 ) ) ( not ( = ?auto_811465 ?auto_811474 ) ) ( not ( = ?auto_811466 ?auto_811467 ) ) ( not ( = ?auto_811466 ?auto_811468 ) ) ( not ( = ?auto_811466 ?auto_811469 ) ) ( not ( = ?auto_811466 ?auto_811470 ) ) ( not ( = ?auto_811466 ?auto_811471 ) ) ( not ( = ?auto_811466 ?auto_811472 ) ) ( not ( = ?auto_811466 ?auto_811473 ) ) ( not ( = ?auto_811466 ?auto_811474 ) ) ( not ( = ?auto_811467 ?auto_811468 ) ) ( not ( = ?auto_811467 ?auto_811469 ) ) ( not ( = ?auto_811467 ?auto_811470 ) ) ( not ( = ?auto_811467 ?auto_811471 ) ) ( not ( = ?auto_811467 ?auto_811472 ) ) ( not ( = ?auto_811467 ?auto_811473 ) ) ( not ( = ?auto_811467 ?auto_811474 ) ) ( not ( = ?auto_811468 ?auto_811469 ) ) ( not ( = ?auto_811468 ?auto_811470 ) ) ( not ( = ?auto_811468 ?auto_811471 ) ) ( not ( = ?auto_811468 ?auto_811472 ) ) ( not ( = ?auto_811468 ?auto_811473 ) ) ( not ( = ?auto_811468 ?auto_811474 ) ) ( not ( = ?auto_811469 ?auto_811470 ) ) ( not ( = ?auto_811469 ?auto_811471 ) ) ( not ( = ?auto_811469 ?auto_811472 ) ) ( not ( = ?auto_811469 ?auto_811473 ) ) ( not ( = ?auto_811469 ?auto_811474 ) ) ( not ( = ?auto_811470 ?auto_811471 ) ) ( not ( = ?auto_811470 ?auto_811472 ) ) ( not ( = ?auto_811470 ?auto_811473 ) ) ( not ( = ?auto_811470 ?auto_811474 ) ) ( not ( = ?auto_811471 ?auto_811472 ) ) ( not ( = ?auto_811471 ?auto_811473 ) ) ( not ( = ?auto_811471 ?auto_811474 ) ) ( not ( = ?auto_811472 ?auto_811473 ) ) ( not ( = ?auto_811472 ?auto_811474 ) ) ( not ( = ?auto_811473 ?auto_811474 ) ) ( ON ?auto_811472 ?auto_811473 ) ( ON ?auto_811471 ?auto_811472 ) ( ON ?auto_811470 ?auto_811471 ) ( CLEAR ?auto_811468 ) ( ON ?auto_811469 ?auto_811470 ) ( CLEAR ?auto_811469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_811464 ?auto_811465 ?auto_811466 ?auto_811467 ?auto_811468 ?auto_811469 )
      ( MAKE-10PILE ?auto_811464 ?auto_811465 ?auto_811466 ?auto_811467 ?auto_811468 ?auto_811469 ?auto_811470 ?auto_811471 ?auto_811472 ?auto_811473 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811506 - BLOCK
      ?auto_811507 - BLOCK
      ?auto_811508 - BLOCK
      ?auto_811509 - BLOCK
      ?auto_811510 - BLOCK
      ?auto_811511 - BLOCK
      ?auto_811512 - BLOCK
      ?auto_811513 - BLOCK
      ?auto_811514 - BLOCK
      ?auto_811515 - BLOCK
    )
    :vars
    (
      ?auto_811516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811515 ?auto_811516 ) ( ON-TABLE ?auto_811506 ) ( ON ?auto_811507 ?auto_811506 ) ( ON ?auto_811508 ?auto_811507 ) ( ON ?auto_811509 ?auto_811508 ) ( not ( = ?auto_811506 ?auto_811507 ) ) ( not ( = ?auto_811506 ?auto_811508 ) ) ( not ( = ?auto_811506 ?auto_811509 ) ) ( not ( = ?auto_811506 ?auto_811510 ) ) ( not ( = ?auto_811506 ?auto_811511 ) ) ( not ( = ?auto_811506 ?auto_811512 ) ) ( not ( = ?auto_811506 ?auto_811513 ) ) ( not ( = ?auto_811506 ?auto_811514 ) ) ( not ( = ?auto_811506 ?auto_811515 ) ) ( not ( = ?auto_811506 ?auto_811516 ) ) ( not ( = ?auto_811507 ?auto_811508 ) ) ( not ( = ?auto_811507 ?auto_811509 ) ) ( not ( = ?auto_811507 ?auto_811510 ) ) ( not ( = ?auto_811507 ?auto_811511 ) ) ( not ( = ?auto_811507 ?auto_811512 ) ) ( not ( = ?auto_811507 ?auto_811513 ) ) ( not ( = ?auto_811507 ?auto_811514 ) ) ( not ( = ?auto_811507 ?auto_811515 ) ) ( not ( = ?auto_811507 ?auto_811516 ) ) ( not ( = ?auto_811508 ?auto_811509 ) ) ( not ( = ?auto_811508 ?auto_811510 ) ) ( not ( = ?auto_811508 ?auto_811511 ) ) ( not ( = ?auto_811508 ?auto_811512 ) ) ( not ( = ?auto_811508 ?auto_811513 ) ) ( not ( = ?auto_811508 ?auto_811514 ) ) ( not ( = ?auto_811508 ?auto_811515 ) ) ( not ( = ?auto_811508 ?auto_811516 ) ) ( not ( = ?auto_811509 ?auto_811510 ) ) ( not ( = ?auto_811509 ?auto_811511 ) ) ( not ( = ?auto_811509 ?auto_811512 ) ) ( not ( = ?auto_811509 ?auto_811513 ) ) ( not ( = ?auto_811509 ?auto_811514 ) ) ( not ( = ?auto_811509 ?auto_811515 ) ) ( not ( = ?auto_811509 ?auto_811516 ) ) ( not ( = ?auto_811510 ?auto_811511 ) ) ( not ( = ?auto_811510 ?auto_811512 ) ) ( not ( = ?auto_811510 ?auto_811513 ) ) ( not ( = ?auto_811510 ?auto_811514 ) ) ( not ( = ?auto_811510 ?auto_811515 ) ) ( not ( = ?auto_811510 ?auto_811516 ) ) ( not ( = ?auto_811511 ?auto_811512 ) ) ( not ( = ?auto_811511 ?auto_811513 ) ) ( not ( = ?auto_811511 ?auto_811514 ) ) ( not ( = ?auto_811511 ?auto_811515 ) ) ( not ( = ?auto_811511 ?auto_811516 ) ) ( not ( = ?auto_811512 ?auto_811513 ) ) ( not ( = ?auto_811512 ?auto_811514 ) ) ( not ( = ?auto_811512 ?auto_811515 ) ) ( not ( = ?auto_811512 ?auto_811516 ) ) ( not ( = ?auto_811513 ?auto_811514 ) ) ( not ( = ?auto_811513 ?auto_811515 ) ) ( not ( = ?auto_811513 ?auto_811516 ) ) ( not ( = ?auto_811514 ?auto_811515 ) ) ( not ( = ?auto_811514 ?auto_811516 ) ) ( not ( = ?auto_811515 ?auto_811516 ) ) ( ON ?auto_811514 ?auto_811515 ) ( ON ?auto_811513 ?auto_811514 ) ( ON ?auto_811512 ?auto_811513 ) ( ON ?auto_811511 ?auto_811512 ) ( CLEAR ?auto_811509 ) ( ON ?auto_811510 ?auto_811511 ) ( CLEAR ?auto_811510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_811506 ?auto_811507 ?auto_811508 ?auto_811509 ?auto_811510 )
      ( MAKE-10PILE ?auto_811506 ?auto_811507 ?auto_811508 ?auto_811509 ?auto_811510 ?auto_811511 ?auto_811512 ?auto_811513 ?auto_811514 ?auto_811515 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811548 - BLOCK
      ?auto_811549 - BLOCK
      ?auto_811550 - BLOCK
      ?auto_811551 - BLOCK
      ?auto_811552 - BLOCK
      ?auto_811553 - BLOCK
      ?auto_811554 - BLOCK
      ?auto_811555 - BLOCK
      ?auto_811556 - BLOCK
      ?auto_811557 - BLOCK
    )
    :vars
    (
      ?auto_811558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811557 ?auto_811558 ) ( ON-TABLE ?auto_811548 ) ( ON ?auto_811549 ?auto_811548 ) ( ON ?auto_811550 ?auto_811549 ) ( not ( = ?auto_811548 ?auto_811549 ) ) ( not ( = ?auto_811548 ?auto_811550 ) ) ( not ( = ?auto_811548 ?auto_811551 ) ) ( not ( = ?auto_811548 ?auto_811552 ) ) ( not ( = ?auto_811548 ?auto_811553 ) ) ( not ( = ?auto_811548 ?auto_811554 ) ) ( not ( = ?auto_811548 ?auto_811555 ) ) ( not ( = ?auto_811548 ?auto_811556 ) ) ( not ( = ?auto_811548 ?auto_811557 ) ) ( not ( = ?auto_811548 ?auto_811558 ) ) ( not ( = ?auto_811549 ?auto_811550 ) ) ( not ( = ?auto_811549 ?auto_811551 ) ) ( not ( = ?auto_811549 ?auto_811552 ) ) ( not ( = ?auto_811549 ?auto_811553 ) ) ( not ( = ?auto_811549 ?auto_811554 ) ) ( not ( = ?auto_811549 ?auto_811555 ) ) ( not ( = ?auto_811549 ?auto_811556 ) ) ( not ( = ?auto_811549 ?auto_811557 ) ) ( not ( = ?auto_811549 ?auto_811558 ) ) ( not ( = ?auto_811550 ?auto_811551 ) ) ( not ( = ?auto_811550 ?auto_811552 ) ) ( not ( = ?auto_811550 ?auto_811553 ) ) ( not ( = ?auto_811550 ?auto_811554 ) ) ( not ( = ?auto_811550 ?auto_811555 ) ) ( not ( = ?auto_811550 ?auto_811556 ) ) ( not ( = ?auto_811550 ?auto_811557 ) ) ( not ( = ?auto_811550 ?auto_811558 ) ) ( not ( = ?auto_811551 ?auto_811552 ) ) ( not ( = ?auto_811551 ?auto_811553 ) ) ( not ( = ?auto_811551 ?auto_811554 ) ) ( not ( = ?auto_811551 ?auto_811555 ) ) ( not ( = ?auto_811551 ?auto_811556 ) ) ( not ( = ?auto_811551 ?auto_811557 ) ) ( not ( = ?auto_811551 ?auto_811558 ) ) ( not ( = ?auto_811552 ?auto_811553 ) ) ( not ( = ?auto_811552 ?auto_811554 ) ) ( not ( = ?auto_811552 ?auto_811555 ) ) ( not ( = ?auto_811552 ?auto_811556 ) ) ( not ( = ?auto_811552 ?auto_811557 ) ) ( not ( = ?auto_811552 ?auto_811558 ) ) ( not ( = ?auto_811553 ?auto_811554 ) ) ( not ( = ?auto_811553 ?auto_811555 ) ) ( not ( = ?auto_811553 ?auto_811556 ) ) ( not ( = ?auto_811553 ?auto_811557 ) ) ( not ( = ?auto_811553 ?auto_811558 ) ) ( not ( = ?auto_811554 ?auto_811555 ) ) ( not ( = ?auto_811554 ?auto_811556 ) ) ( not ( = ?auto_811554 ?auto_811557 ) ) ( not ( = ?auto_811554 ?auto_811558 ) ) ( not ( = ?auto_811555 ?auto_811556 ) ) ( not ( = ?auto_811555 ?auto_811557 ) ) ( not ( = ?auto_811555 ?auto_811558 ) ) ( not ( = ?auto_811556 ?auto_811557 ) ) ( not ( = ?auto_811556 ?auto_811558 ) ) ( not ( = ?auto_811557 ?auto_811558 ) ) ( ON ?auto_811556 ?auto_811557 ) ( ON ?auto_811555 ?auto_811556 ) ( ON ?auto_811554 ?auto_811555 ) ( ON ?auto_811553 ?auto_811554 ) ( ON ?auto_811552 ?auto_811553 ) ( CLEAR ?auto_811550 ) ( ON ?auto_811551 ?auto_811552 ) ( CLEAR ?auto_811551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_811548 ?auto_811549 ?auto_811550 ?auto_811551 )
      ( MAKE-10PILE ?auto_811548 ?auto_811549 ?auto_811550 ?auto_811551 ?auto_811552 ?auto_811553 ?auto_811554 ?auto_811555 ?auto_811556 ?auto_811557 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811590 - BLOCK
      ?auto_811591 - BLOCK
      ?auto_811592 - BLOCK
      ?auto_811593 - BLOCK
      ?auto_811594 - BLOCK
      ?auto_811595 - BLOCK
      ?auto_811596 - BLOCK
      ?auto_811597 - BLOCK
      ?auto_811598 - BLOCK
      ?auto_811599 - BLOCK
    )
    :vars
    (
      ?auto_811600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811599 ?auto_811600 ) ( ON-TABLE ?auto_811590 ) ( ON ?auto_811591 ?auto_811590 ) ( not ( = ?auto_811590 ?auto_811591 ) ) ( not ( = ?auto_811590 ?auto_811592 ) ) ( not ( = ?auto_811590 ?auto_811593 ) ) ( not ( = ?auto_811590 ?auto_811594 ) ) ( not ( = ?auto_811590 ?auto_811595 ) ) ( not ( = ?auto_811590 ?auto_811596 ) ) ( not ( = ?auto_811590 ?auto_811597 ) ) ( not ( = ?auto_811590 ?auto_811598 ) ) ( not ( = ?auto_811590 ?auto_811599 ) ) ( not ( = ?auto_811590 ?auto_811600 ) ) ( not ( = ?auto_811591 ?auto_811592 ) ) ( not ( = ?auto_811591 ?auto_811593 ) ) ( not ( = ?auto_811591 ?auto_811594 ) ) ( not ( = ?auto_811591 ?auto_811595 ) ) ( not ( = ?auto_811591 ?auto_811596 ) ) ( not ( = ?auto_811591 ?auto_811597 ) ) ( not ( = ?auto_811591 ?auto_811598 ) ) ( not ( = ?auto_811591 ?auto_811599 ) ) ( not ( = ?auto_811591 ?auto_811600 ) ) ( not ( = ?auto_811592 ?auto_811593 ) ) ( not ( = ?auto_811592 ?auto_811594 ) ) ( not ( = ?auto_811592 ?auto_811595 ) ) ( not ( = ?auto_811592 ?auto_811596 ) ) ( not ( = ?auto_811592 ?auto_811597 ) ) ( not ( = ?auto_811592 ?auto_811598 ) ) ( not ( = ?auto_811592 ?auto_811599 ) ) ( not ( = ?auto_811592 ?auto_811600 ) ) ( not ( = ?auto_811593 ?auto_811594 ) ) ( not ( = ?auto_811593 ?auto_811595 ) ) ( not ( = ?auto_811593 ?auto_811596 ) ) ( not ( = ?auto_811593 ?auto_811597 ) ) ( not ( = ?auto_811593 ?auto_811598 ) ) ( not ( = ?auto_811593 ?auto_811599 ) ) ( not ( = ?auto_811593 ?auto_811600 ) ) ( not ( = ?auto_811594 ?auto_811595 ) ) ( not ( = ?auto_811594 ?auto_811596 ) ) ( not ( = ?auto_811594 ?auto_811597 ) ) ( not ( = ?auto_811594 ?auto_811598 ) ) ( not ( = ?auto_811594 ?auto_811599 ) ) ( not ( = ?auto_811594 ?auto_811600 ) ) ( not ( = ?auto_811595 ?auto_811596 ) ) ( not ( = ?auto_811595 ?auto_811597 ) ) ( not ( = ?auto_811595 ?auto_811598 ) ) ( not ( = ?auto_811595 ?auto_811599 ) ) ( not ( = ?auto_811595 ?auto_811600 ) ) ( not ( = ?auto_811596 ?auto_811597 ) ) ( not ( = ?auto_811596 ?auto_811598 ) ) ( not ( = ?auto_811596 ?auto_811599 ) ) ( not ( = ?auto_811596 ?auto_811600 ) ) ( not ( = ?auto_811597 ?auto_811598 ) ) ( not ( = ?auto_811597 ?auto_811599 ) ) ( not ( = ?auto_811597 ?auto_811600 ) ) ( not ( = ?auto_811598 ?auto_811599 ) ) ( not ( = ?auto_811598 ?auto_811600 ) ) ( not ( = ?auto_811599 ?auto_811600 ) ) ( ON ?auto_811598 ?auto_811599 ) ( ON ?auto_811597 ?auto_811598 ) ( ON ?auto_811596 ?auto_811597 ) ( ON ?auto_811595 ?auto_811596 ) ( ON ?auto_811594 ?auto_811595 ) ( ON ?auto_811593 ?auto_811594 ) ( CLEAR ?auto_811591 ) ( ON ?auto_811592 ?auto_811593 ) ( CLEAR ?auto_811592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_811590 ?auto_811591 ?auto_811592 )
      ( MAKE-10PILE ?auto_811590 ?auto_811591 ?auto_811592 ?auto_811593 ?auto_811594 ?auto_811595 ?auto_811596 ?auto_811597 ?auto_811598 ?auto_811599 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811632 - BLOCK
      ?auto_811633 - BLOCK
      ?auto_811634 - BLOCK
      ?auto_811635 - BLOCK
      ?auto_811636 - BLOCK
      ?auto_811637 - BLOCK
      ?auto_811638 - BLOCK
      ?auto_811639 - BLOCK
      ?auto_811640 - BLOCK
      ?auto_811641 - BLOCK
    )
    :vars
    (
      ?auto_811642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811641 ?auto_811642 ) ( ON-TABLE ?auto_811632 ) ( not ( = ?auto_811632 ?auto_811633 ) ) ( not ( = ?auto_811632 ?auto_811634 ) ) ( not ( = ?auto_811632 ?auto_811635 ) ) ( not ( = ?auto_811632 ?auto_811636 ) ) ( not ( = ?auto_811632 ?auto_811637 ) ) ( not ( = ?auto_811632 ?auto_811638 ) ) ( not ( = ?auto_811632 ?auto_811639 ) ) ( not ( = ?auto_811632 ?auto_811640 ) ) ( not ( = ?auto_811632 ?auto_811641 ) ) ( not ( = ?auto_811632 ?auto_811642 ) ) ( not ( = ?auto_811633 ?auto_811634 ) ) ( not ( = ?auto_811633 ?auto_811635 ) ) ( not ( = ?auto_811633 ?auto_811636 ) ) ( not ( = ?auto_811633 ?auto_811637 ) ) ( not ( = ?auto_811633 ?auto_811638 ) ) ( not ( = ?auto_811633 ?auto_811639 ) ) ( not ( = ?auto_811633 ?auto_811640 ) ) ( not ( = ?auto_811633 ?auto_811641 ) ) ( not ( = ?auto_811633 ?auto_811642 ) ) ( not ( = ?auto_811634 ?auto_811635 ) ) ( not ( = ?auto_811634 ?auto_811636 ) ) ( not ( = ?auto_811634 ?auto_811637 ) ) ( not ( = ?auto_811634 ?auto_811638 ) ) ( not ( = ?auto_811634 ?auto_811639 ) ) ( not ( = ?auto_811634 ?auto_811640 ) ) ( not ( = ?auto_811634 ?auto_811641 ) ) ( not ( = ?auto_811634 ?auto_811642 ) ) ( not ( = ?auto_811635 ?auto_811636 ) ) ( not ( = ?auto_811635 ?auto_811637 ) ) ( not ( = ?auto_811635 ?auto_811638 ) ) ( not ( = ?auto_811635 ?auto_811639 ) ) ( not ( = ?auto_811635 ?auto_811640 ) ) ( not ( = ?auto_811635 ?auto_811641 ) ) ( not ( = ?auto_811635 ?auto_811642 ) ) ( not ( = ?auto_811636 ?auto_811637 ) ) ( not ( = ?auto_811636 ?auto_811638 ) ) ( not ( = ?auto_811636 ?auto_811639 ) ) ( not ( = ?auto_811636 ?auto_811640 ) ) ( not ( = ?auto_811636 ?auto_811641 ) ) ( not ( = ?auto_811636 ?auto_811642 ) ) ( not ( = ?auto_811637 ?auto_811638 ) ) ( not ( = ?auto_811637 ?auto_811639 ) ) ( not ( = ?auto_811637 ?auto_811640 ) ) ( not ( = ?auto_811637 ?auto_811641 ) ) ( not ( = ?auto_811637 ?auto_811642 ) ) ( not ( = ?auto_811638 ?auto_811639 ) ) ( not ( = ?auto_811638 ?auto_811640 ) ) ( not ( = ?auto_811638 ?auto_811641 ) ) ( not ( = ?auto_811638 ?auto_811642 ) ) ( not ( = ?auto_811639 ?auto_811640 ) ) ( not ( = ?auto_811639 ?auto_811641 ) ) ( not ( = ?auto_811639 ?auto_811642 ) ) ( not ( = ?auto_811640 ?auto_811641 ) ) ( not ( = ?auto_811640 ?auto_811642 ) ) ( not ( = ?auto_811641 ?auto_811642 ) ) ( ON ?auto_811640 ?auto_811641 ) ( ON ?auto_811639 ?auto_811640 ) ( ON ?auto_811638 ?auto_811639 ) ( ON ?auto_811637 ?auto_811638 ) ( ON ?auto_811636 ?auto_811637 ) ( ON ?auto_811635 ?auto_811636 ) ( ON ?auto_811634 ?auto_811635 ) ( CLEAR ?auto_811632 ) ( ON ?auto_811633 ?auto_811634 ) ( CLEAR ?auto_811633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_811632 ?auto_811633 )
      ( MAKE-10PILE ?auto_811632 ?auto_811633 ?auto_811634 ?auto_811635 ?auto_811636 ?auto_811637 ?auto_811638 ?auto_811639 ?auto_811640 ?auto_811641 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_811674 - BLOCK
      ?auto_811675 - BLOCK
      ?auto_811676 - BLOCK
      ?auto_811677 - BLOCK
      ?auto_811678 - BLOCK
      ?auto_811679 - BLOCK
      ?auto_811680 - BLOCK
      ?auto_811681 - BLOCK
      ?auto_811682 - BLOCK
      ?auto_811683 - BLOCK
    )
    :vars
    (
      ?auto_811684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811683 ?auto_811684 ) ( not ( = ?auto_811674 ?auto_811675 ) ) ( not ( = ?auto_811674 ?auto_811676 ) ) ( not ( = ?auto_811674 ?auto_811677 ) ) ( not ( = ?auto_811674 ?auto_811678 ) ) ( not ( = ?auto_811674 ?auto_811679 ) ) ( not ( = ?auto_811674 ?auto_811680 ) ) ( not ( = ?auto_811674 ?auto_811681 ) ) ( not ( = ?auto_811674 ?auto_811682 ) ) ( not ( = ?auto_811674 ?auto_811683 ) ) ( not ( = ?auto_811674 ?auto_811684 ) ) ( not ( = ?auto_811675 ?auto_811676 ) ) ( not ( = ?auto_811675 ?auto_811677 ) ) ( not ( = ?auto_811675 ?auto_811678 ) ) ( not ( = ?auto_811675 ?auto_811679 ) ) ( not ( = ?auto_811675 ?auto_811680 ) ) ( not ( = ?auto_811675 ?auto_811681 ) ) ( not ( = ?auto_811675 ?auto_811682 ) ) ( not ( = ?auto_811675 ?auto_811683 ) ) ( not ( = ?auto_811675 ?auto_811684 ) ) ( not ( = ?auto_811676 ?auto_811677 ) ) ( not ( = ?auto_811676 ?auto_811678 ) ) ( not ( = ?auto_811676 ?auto_811679 ) ) ( not ( = ?auto_811676 ?auto_811680 ) ) ( not ( = ?auto_811676 ?auto_811681 ) ) ( not ( = ?auto_811676 ?auto_811682 ) ) ( not ( = ?auto_811676 ?auto_811683 ) ) ( not ( = ?auto_811676 ?auto_811684 ) ) ( not ( = ?auto_811677 ?auto_811678 ) ) ( not ( = ?auto_811677 ?auto_811679 ) ) ( not ( = ?auto_811677 ?auto_811680 ) ) ( not ( = ?auto_811677 ?auto_811681 ) ) ( not ( = ?auto_811677 ?auto_811682 ) ) ( not ( = ?auto_811677 ?auto_811683 ) ) ( not ( = ?auto_811677 ?auto_811684 ) ) ( not ( = ?auto_811678 ?auto_811679 ) ) ( not ( = ?auto_811678 ?auto_811680 ) ) ( not ( = ?auto_811678 ?auto_811681 ) ) ( not ( = ?auto_811678 ?auto_811682 ) ) ( not ( = ?auto_811678 ?auto_811683 ) ) ( not ( = ?auto_811678 ?auto_811684 ) ) ( not ( = ?auto_811679 ?auto_811680 ) ) ( not ( = ?auto_811679 ?auto_811681 ) ) ( not ( = ?auto_811679 ?auto_811682 ) ) ( not ( = ?auto_811679 ?auto_811683 ) ) ( not ( = ?auto_811679 ?auto_811684 ) ) ( not ( = ?auto_811680 ?auto_811681 ) ) ( not ( = ?auto_811680 ?auto_811682 ) ) ( not ( = ?auto_811680 ?auto_811683 ) ) ( not ( = ?auto_811680 ?auto_811684 ) ) ( not ( = ?auto_811681 ?auto_811682 ) ) ( not ( = ?auto_811681 ?auto_811683 ) ) ( not ( = ?auto_811681 ?auto_811684 ) ) ( not ( = ?auto_811682 ?auto_811683 ) ) ( not ( = ?auto_811682 ?auto_811684 ) ) ( not ( = ?auto_811683 ?auto_811684 ) ) ( ON ?auto_811682 ?auto_811683 ) ( ON ?auto_811681 ?auto_811682 ) ( ON ?auto_811680 ?auto_811681 ) ( ON ?auto_811679 ?auto_811680 ) ( ON ?auto_811678 ?auto_811679 ) ( ON ?auto_811677 ?auto_811678 ) ( ON ?auto_811676 ?auto_811677 ) ( ON ?auto_811675 ?auto_811676 ) ( ON ?auto_811674 ?auto_811675 ) ( CLEAR ?auto_811674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_811674 )
      ( MAKE-10PILE ?auto_811674 ?auto_811675 ?auto_811676 ?auto_811677 ?auto_811678 ?auto_811679 ?auto_811680 ?auto_811681 ?auto_811682 ?auto_811683 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811717 - BLOCK
      ?auto_811718 - BLOCK
      ?auto_811719 - BLOCK
      ?auto_811720 - BLOCK
      ?auto_811721 - BLOCK
      ?auto_811722 - BLOCK
      ?auto_811723 - BLOCK
      ?auto_811724 - BLOCK
      ?auto_811725 - BLOCK
      ?auto_811726 - BLOCK
      ?auto_811727 - BLOCK
    )
    :vars
    (
      ?auto_811728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_811726 ) ( ON ?auto_811727 ?auto_811728 ) ( CLEAR ?auto_811727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_811717 ) ( ON ?auto_811718 ?auto_811717 ) ( ON ?auto_811719 ?auto_811718 ) ( ON ?auto_811720 ?auto_811719 ) ( ON ?auto_811721 ?auto_811720 ) ( ON ?auto_811722 ?auto_811721 ) ( ON ?auto_811723 ?auto_811722 ) ( ON ?auto_811724 ?auto_811723 ) ( ON ?auto_811725 ?auto_811724 ) ( ON ?auto_811726 ?auto_811725 ) ( not ( = ?auto_811717 ?auto_811718 ) ) ( not ( = ?auto_811717 ?auto_811719 ) ) ( not ( = ?auto_811717 ?auto_811720 ) ) ( not ( = ?auto_811717 ?auto_811721 ) ) ( not ( = ?auto_811717 ?auto_811722 ) ) ( not ( = ?auto_811717 ?auto_811723 ) ) ( not ( = ?auto_811717 ?auto_811724 ) ) ( not ( = ?auto_811717 ?auto_811725 ) ) ( not ( = ?auto_811717 ?auto_811726 ) ) ( not ( = ?auto_811717 ?auto_811727 ) ) ( not ( = ?auto_811717 ?auto_811728 ) ) ( not ( = ?auto_811718 ?auto_811719 ) ) ( not ( = ?auto_811718 ?auto_811720 ) ) ( not ( = ?auto_811718 ?auto_811721 ) ) ( not ( = ?auto_811718 ?auto_811722 ) ) ( not ( = ?auto_811718 ?auto_811723 ) ) ( not ( = ?auto_811718 ?auto_811724 ) ) ( not ( = ?auto_811718 ?auto_811725 ) ) ( not ( = ?auto_811718 ?auto_811726 ) ) ( not ( = ?auto_811718 ?auto_811727 ) ) ( not ( = ?auto_811718 ?auto_811728 ) ) ( not ( = ?auto_811719 ?auto_811720 ) ) ( not ( = ?auto_811719 ?auto_811721 ) ) ( not ( = ?auto_811719 ?auto_811722 ) ) ( not ( = ?auto_811719 ?auto_811723 ) ) ( not ( = ?auto_811719 ?auto_811724 ) ) ( not ( = ?auto_811719 ?auto_811725 ) ) ( not ( = ?auto_811719 ?auto_811726 ) ) ( not ( = ?auto_811719 ?auto_811727 ) ) ( not ( = ?auto_811719 ?auto_811728 ) ) ( not ( = ?auto_811720 ?auto_811721 ) ) ( not ( = ?auto_811720 ?auto_811722 ) ) ( not ( = ?auto_811720 ?auto_811723 ) ) ( not ( = ?auto_811720 ?auto_811724 ) ) ( not ( = ?auto_811720 ?auto_811725 ) ) ( not ( = ?auto_811720 ?auto_811726 ) ) ( not ( = ?auto_811720 ?auto_811727 ) ) ( not ( = ?auto_811720 ?auto_811728 ) ) ( not ( = ?auto_811721 ?auto_811722 ) ) ( not ( = ?auto_811721 ?auto_811723 ) ) ( not ( = ?auto_811721 ?auto_811724 ) ) ( not ( = ?auto_811721 ?auto_811725 ) ) ( not ( = ?auto_811721 ?auto_811726 ) ) ( not ( = ?auto_811721 ?auto_811727 ) ) ( not ( = ?auto_811721 ?auto_811728 ) ) ( not ( = ?auto_811722 ?auto_811723 ) ) ( not ( = ?auto_811722 ?auto_811724 ) ) ( not ( = ?auto_811722 ?auto_811725 ) ) ( not ( = ?auto_811722 ?auto_811726 ) ) ( not ( = ?auto_811722 ?auto_811727 ) ) ( not ( = ?auto_811722 ?auto_811728 ) ) ( not ( = ?auto_811723 ?auto_811724 ) ) ( not ( = ?auto_811723 ?auto_811725 ) ) ( not ( = ?auto_811723 ?auto_811726 ) ) ( not ( = ?auto_811723 ?auto_811727 ) ) ( not ( = ?auto_811723 ?auto_811728 ) ) ( not ( = ?auto_811724 ?auto_811725 ) ) ( not ( = ?auto_811724 ?auto_811726 ) ) ( not ( = ?auto_811724 ?auto_811727 ) ) ( not ( = ?auto_811724 ?auto_811728 ) ) ( not ( = ?auto_811725 ?auto_811726 ) ) ( not ( = ?auto_811725 ?auto_811727 ) ) ( not ( = ?auto_811725 ?auto_811728 ) ) ( not ( = ?auto_811726 ?auto_811727 ) ) ( not ( = ?auto_811726 ?auto_811728 ) ) ( not ( = ?auto_811727 ?auto_811728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_811727 ?auto_811728 )
      ( !STACK ?auto_811727 ?auto_811726 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811763 - BLOCK
      ?auto_811764 - BLOCK
      ?auto_811765 - BLOCK
      ?auto_811766 - BLOCK
      ?auto_811767 - BLOCK
      ?auto_811768 - BLOCK
      ?auto_811769 - BLOCK
      ?auto_811770 - BLOCK
      ?auto_811771 - BLOCK
      ?auto_811772 - BLOCK
      ?auto_811773 - BLOCK
    )
    :vars
    (
      ?auto_811774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811773 ?auto_811774 ) ( ON-TABLE ?auto_811763 ) ( ON ?auto_811764 ?auto_811763 ) ( ON ?auto_811765 ?auto_811764 ) ( ON ?auto_811766 ?auto_811765 ) ( ON ?auto_811767 ?auto_811766 ) ( ON ?auto_811768 ?auto_811767 ) ( ON ?auto_811769 ?auto_811768 ) ( ON ?auto_811770 ?auto_811769 ) ( ON ?auto_811771 ?auto_811770 ) ( not ( = ?auto_811763 ?auto_811764 ) ) ( not ( = ?auto_811763 ?auto_811765 ) ) ( not ( = ?auto_811763 ?auto_811766 ) ) ( not ( = ?auto_811763 ?auto_811767 ) ) ( not ( = ?auto_811763 ?auto_811768 ) ) ( not ( = ?auto_811763 ?auto_811769 ) ) ( not ( = ?auto_811763 ?auto_811770 ) ) ( not ( = ?auto_811763 ?auto_811771 ) ) ( not ( = ?auto_811763 ?auto_811772 ) ) ( not ( = ?auto_811763 ?auto_811773 ) ) ( not ( = ?auto_811763 ?auto_811774 ) ) ( not ( = ?auto_811764 ?auto_811765 ) ) ( not ( = ?auto_811764 ?auto_811766 ) ) ( not ( = ?auto_811764 ?auto_811767 ) ) ( not ( = ?auto_811764 ?auto_811768 ) ) ( not ( = ?auto_811764 ?auto_811769 ) ) ( not ( = ?auto_811764 ?auto_811770 ) ) ( not ( = ?auto_811764 ?auto_811771 ) ) ( not ( = ?auto_811764 ?auto_811772 ) ) ( not ( = ?auto_811764 ?auto_811773 ) ) ( not ( = ?auto_811764 ?auto_811774 ) ) ( not ( = ?auto_811765 ?auto_811766 ) ) ( not ( = ?auto_811765 ?auto_811767 ) ) ( not ( = ?auto_811765 ?auto_811768 ) ) ( not ( = ?auto_811765 ?auto_811769 ) ) ( not ( = ?auto_811765 ?auto_811770 ) ) ( not ( = ?auto_811765 ?auto_811771 ) ) ( not ( = ?auto_811765 ?auto_811772 ) ) ( not ( = ?auto_811765 ?auto_811773 ) ) ( not ( = ?auto_811765 ?auto_811774 ) ) ( not ( = ?auto_811766 ?auto_811767 ) ) ( not ( = ?auto_811766 ?auto_811768 ) ) ( not ( = ?auto_811766 ?auto_811769 ) ) ( not ( = ?auto_811766 ?auto_811770 ) ) ( not ( = ?auto_811766 ?auto_811771 ) ) ( not ( = ?auto_811766 ?auto_811772 ) ) ( not ( = ?auto_811766 ?auto_811773 ) ) ( not ( = ?auto_811766 ?auto_811774 ) ) ( not ( = ?auto_811767 ?auto_811768 ) ) ( not ( = ?auto_811767 ?auto_811769 ) ) ( not ( = ?auto_811767 ?auto_811770 ) ) ( not ( = ?auto_811767 ?auto_811771 ) ) ( not ( = ?auto_811767 ?auto_811772 ) ) ( not ( = ?auto_811767 ?auto_811773 ) ) ( not ( = ?auto_811767 ?auto_811774 ) ) ( not ( = ?auto_811768 ?auto_811769 ) ) ( not ( = ?auto_811768 ?auto_811770 ) ) ( not ( = ?auto_811768 ?auto_811771 ) ) ( not ( = ?auto_811768 ?auto_811772 ) ) ( not ( = ?auto_811768 ?auto_811773 ) ) ( not ( = ?auto_811768 ?auto_811774 ) ) ( not ( = ?auto_811769 ?auto_811770 ) ) ( not ( = ?auto_811769 ?auto_811771 ) ) ( not ( = ?auto_811769 ?auto_811772 ) ) ( not ( = ?auto_811769 ?auto_811773 ) ) ( not ( = ?auto_811769 ?auto_811774 ) ) ( not ( = ?auto_811770 ?auto_811771 ) ) ( not ( = ?auto_811770 ?auto_811772 ) ) ( not ( = ?auto_811770 ?auto_811773 ) ) ( not ( = ?auto_811770 ?auto_811774 ) ) ( not ( = ?auto_811771 ?auto_811772 ) ) ( not ( = ?auto_811771 ?auto_811773 ) ) ( not ( = ?auto_811771 ?auto_811774 ) ) ( not ( = ?auto_811772 ?auto_811773 ) ) ( not ( = ?auto_811772 ?auto_811774 ) ) ( not ( = ?auto_811773 ?auto_811774 ) ) ( CLEAR ?auto_811771 ) ( ON ?auto_811772 ?auto_811773 ) ( CLEAR ?auto_811772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_811763 ?auto_811764 ?auto_811765 ?auto_811766 ?auto_811767 ?auto_811768 ?auto_811769 ?auto_811770 ?auto_811771 ?auto_811772 )
      ( MAKE-11PILE ?auto_811763 ?auto_811764 ?auto_811765 ?auto_811766 ?auto_811767 ?auto_811768 ?auto_811769 ?auto_811770 ?auto_811771 ?auto_811772 ?auto_811773 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811809 - BLOCK
      ?auto_811810 - BLOCK
      ?auto_811811 - BLOCK
      ?auto_811812 - BLOCK
      ?auto_811813 - BLOCK
      ?auto_811814 - BLOCK
      ?auto_811815 - BLOCK
      ?auto_811816 - BLOCK
      ?auto_811817 - BLOCK
      ?auto_811818 - BLOCK
      ?auto_811819 - BLOCK
    )
    :vars
    (
      ?auto_811820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811819 ?auto_811820 ) ( ON-TABLE ?auto_811809 ) ( ON ?auto_811810 ?auto_811809 ) ( ON ?auto_811811 ?auto_811810 ) ( ON ?auto_811812 ?auto_811811 ) ( ON ?auto_811813 ?auto_811812 ) ( ON ?auto_811814 ?auto_811813 ) ( ON ?auto_811815 ?auto_811814 ) ( ON ?auto_811816 ?auto_811815 ) ( not ( = ?auto_811809 ?auto_811810 ) ) ( not ( = ?auto_811809 ?auto_811811 ) ) ( not ( = ?auto_811809 ?auto_811812 ) ) ( not ( = ?auto_811809 ?auto_811813 ) ) ( not ( = ?auto_811809 ?auto_811814 ) ) ( not ( = ?auto_811809 ?auto_811815 ) ) ( not ( = ?auto_811809 ?auto_811816 ) ) ( not ( = ?auto_811809 ?auto_811817 ) ) ( not ( = ?auto_811809 ?auto_811818 ) ) ( not ( = ?auto_811809 ?auto_811819 ) ) ( not ( = ?auto_811809 ?auto_811820 ) ) ( not ( = ?auto_811810 ?auto_811811 ) ) ( not ( = ?auto_811810 ?auto_811812 ) ) ( not ( = ?auto_811810 ?auto_811813 ) ) ( not ( = ?auto_811810 ?auto_811814 ) ) ( not ( = ?auto_811810 ?auto_811815 ) ) ( not ( = ?auto_811810 ?auto_811816 ) ) ( not ( = ?auto_811810 ?auto_811817 ) ) ( not ( = ?auto_811810 ?auto_811818 ) ) ( not ( = ?auto_811810 ?auto_811819 ) ) ( not ( = ?auto_811810 ?auto_811820 ) ) ( not ( = ?auto_811811 ?auto_811812 ) ) ( not ( = ?auto_811811 ?auto_811813 ) ) ( not ( = ?auto_811811 ?auto_811814 ) ) ( not ( = ?auto_811811 ?auto_811815 ) ) ( not ( = ?auto_811811 ?auto_811816 ) ) ( not ( = ?auto_811811 ?auto_811817 ) ) ( not ( = ?auto_811811 ?auto_811818 ) ) ( not ( = ?auto_811811 ?auto_811819 ) ) ( not ( = ?auto_811811 ?auto_811820 ) ) ( not ( = ?auto_811812 ?auto_811813 ) ) ( not ( = ?auto_811812 ?auto_811814 ) ) ( not ( = ?auto_811812 ?auto_811815 ) ) ( not ( = ?auto_811812 ?auto_811816 ) ) ( not ( = ?auto_811812 ?auto_811817 ) ) ( not ( = ?auto_811812 ?auto_811818 ) ) ( not ( = ?auto_811812 ?auto_811819 ) ) ( not ( = ?auto_811812 ?auto_811820 ) ) ( not ( = ?auto_811813 ?auto_811814 ) ) ( not ( = ?auto_811813 ?auto_811815 ) ) ( not ( = ?auto_811813 ?auto_811816 ) ) ( not ( = ?auto_811813 ?auto_811817 ) ) ( not ( = ?auto_811813 ?auto_811818 ) ) ( not ( = ?auto_811813 ?auto_811819 ) ) ( not ( = ?auto_811813 ?auto_811820 ) ) ( not ( = ?auto_811814 ?auto_811815 ) ) ( not ( = ?auto_811814 ?auto_811816 ) ) ( not ( = ?auto_811814 ?auto_811817 ) ) ( not ( = ?auto_811814 ?auto_811818 ) ) ( not ( = ?auto_811814 ?auto_811819 ) ) ( not ( = ?auto_811814 ?auto_811820 ) ) ( not ( = ?auto_811815 ?auto_811816 ) ) ( not ( = ?auto_811815 ?auto_811817 ) ) ( not ( = ?auto_811815 ?auto_811818 ) ) ( not ( = ?auto_811815 ?auto_811819 ) ) ( not ( = ?auto_811815 ?auto_811820 ) ) ( not ( = ?auto_811816 ?auto_811817 ) ) ( not ( = ?auto_811816 ?auto_811818 ) ) ( not ( = ?auto_811816 ?auto_811819 ) ) ( not ( = ?auto_811816 ?auto_811820 ) ) ( not ( = ?auto_811817 ?auto_811818 ) ) ( not ( = ?auto_811817 ?auto_811819 ) ) ( not ( = ?auto_811817 ?auto_811820 ) ) ( not ( = ?auto_811818 ?auto_811819 ) ) ( not ( = ?auto_811818 ?auto_811820 ) ) ( not ( = ?auto_811819 ?auto_811820 ) ) ( ON ?auto_811818 ?auto_811819 ) ( CLEAR ?auto_811816 ) ( ON ?auto_811817 ?auto_811818 ) ( CLEAR ?auto_811817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_811809 ?auto_811810 ?auto_811811 ?auto_811812 ?auto_811813 ?auto_811814 ?auto_811815 ?auto_811816 ?auto_811817 )
      ( MAKE-11PILE ?auto_811809 ?auto_811810 ?auto_811811 ?auto_811812 ?auto_811813 ?auto_811814 ?auto_811815 ?auto_811816 ?auto_811817 ?auto_811818 ?auto_811819 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811855 - BLOCK
      ?auto_811856 - BLOCK
      ?auto_811857 - BLOCK
      ?auto_811858 - BLOCK
      ?auto_811859 - BLOCK
      ?auto_811860 - BLOCK
      ?auto_811861 - BLOCK
      ?auto_811862 - BLOCK
      ?auto_811863 - BLOCK
      ?auto_811864 - BLOCK
      ?auto_811865 - BLOCK
    )
    :vars
    (
      ?auto_811866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811865 ?auto_811866 ) ( ON-TABLE ?auto_811855 ) ( ON ?auto_811856 ?auto_811855 ) ( ON ?auto_811857 ?auto_811856 ) ( ON ?auto_811858 ?auto_811857 ) ( ON ?auto_811859 ?auto_811858 ) ( ON ?auto_811860 ?auto_811859 ) ( ON ?auto_811861 ?auto_811860 ) ( not ( = ?auto_811855 ?auto_811856 ) ) ( not ( = ?auto_811855 ?auto_811857 ) ) ( not ( = ?auto_811855 ?auto_811858 ) ) ( not ( = ?auto_811855 ?auto_811859 ) ) ( not ( = ?auto_811855 ?auto_811860 ) ) ( not ( = ?auto_811855 ?auto_811861 ) ) ( not ( = ?auto_811855 ?auto_811862 ) ) ( not ( = ?auto_811855 ?auto_811863 ) ) ( not ( = ?auto_811855 ?auto_811864 ) ) ( not ( = ?auto_811855 ?auto_811865 ) ) ( not ( = ?auto_811855 ?auto_811866 ) ) ( not ( = ?auto_811856 ?auto_811857 ) ) ( not ( = ?auto_811856 ?auto_811858 ) ) ( not ( = ?auto_811856 ?auto_811859 ) ) ( not ( = ?auto_811856 ?auto_811860 ) ) ( not ( = ?auto_811856 ?auto_811861 ) ) ( not ( = ?auto_811856 ?auto_811862 ) ) ( not ( = ?auto_811856 ?auto_811863 ) ) ( not ( = ?auto_811856 ?auto_811864 ) ) ( not ( = ?auto_811856 ?auto_811865 ) ) ( not ( = ?auto_811856 ?auto_811866 ) ) ( not ( = ?auto_811857 ?auto_811858 ) ) ( not ( = ?auto_811857 ?auto_811859 ) ) ( not ( = ?auto_811857 ?auto_811860 ) ) ( not ( = ?auto_811857 ?auto_811861 ) ) ( not ( = ?auto_811857 ?auto_811862 ) ) ( not ( = ?auto_811857 ?auto_811863 ) ) ( not ( = ?auto_811857 ?auto_811864 ) ) ( not ( = ?auto_811857 ?auto_811865 ) ) ( not ( = ?auto_811857 ?auto_811866 ) ) ( not ( = ?auto_811858 ?auto_811859 ) ) ( not ( = ?auto_811858 ?auto_811860 ) ) ( not ( = ?auto_811858 ?auto_811861 ) ) ( not ( = ?auto_811858 ?auto_811862 ) ) ( not ( = ?auto_811858 ?auto_811863 ) ) ( not ( = ?auto_811858 ?auto_811864 ) ) ( not ( = ?auto_811858 ?auto_811865 ) ) ( not ( = ?auto_811858 ?auto_811866 ) ) ( not ( = ?auto_811859 ?auto_811860 ) ) ( not ( = ?auto_811859 ?auto_811861 ) ) ( not ( = ?auto_811859 ?auto_811862 ) ) ( not ( = ?auto_811859 ?auto_811863 ) ) ( not ( = ?auto_811859 ?auto_811864 ) ) ( not ( = ?auto_811859 ?auto_811865 ) ) ( not ( = ?auto_811859 ?auto_811866 ) ) ( not ( = ?auto_811860 ?auto_811861 ) ) ( not ( = ?auto_811860 ?auto_811862 ) ) ( not ( = ?auto_811860 ?auto_811863 ) ) ( not ( = ?auto_811860 ?auto_811864 ) ) ( not ( = ?auto_811860 ?auto_811865 ) ) ( not ( = ?auto_811860 ?auto_811866 ) ) ( not ( = ?auto_811861 ?auto_811862 ) ) ( not ( = ?auto_811861 ?auto_811863 ) ) ( not ( = ?auto_811861 ?auto_811864 ) ) ( not ( = ?auto_811861 ?auto_811865 ) ) ( not ( = ?auto_811861 ?auto_811866 ) ) ( not ( = ?auto_811862 ?auto_811863 ) ) ( not ( = ?auto_811862 ?auto_811864 ) ) ( not ( = ?auto_811862 ?auto_811865 ) ) ( not ( = ?auto_811862 ?auto_811866 ) ) ( not ( = ?auto_811863 ?auto_811864 ) ) ( not ( = ?auto_811863 ?auto_811865 ) ) ( not ( = ?auto_811863 ?auto_811866 ) ) ( not ( = ?auto_811864 ?auto_811865 ) ) ( not ( = ?auto_811864 ?auto_811866 ) ) ( not ( = ?auto_811865 ?auto_811866 ) ) ( ON ?auto_811864 ?auto_811865 ) ( ON ?auto_811863 ?auto_811864 ) ( CLEAR ?auto_811861 ) ( ON ?auto_811862 ?auto_811863 ) ( CLEAR ?auto_811862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_811855 ?auto_811856 ?auto_811857 ?auto_811858 ?auto_811859 ?auto_811860 ?auto_811861 ?auto_811862 )
      ( MAKE-11PILE ?auto_811855 ?auto_811856 ?auto_811857 ?auto_811858 ?auto_811859 ?auto_811860 ?auto_811861 ?auto_811862 ?auto_811863 ?auto_811864 ?auto_811865 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811901 - BLOCK
      ?auto_811902 - BLOCK
      ?auto_811903 - BLOCK
      ?auto_811904 - BLOCK
      ?auto_811905 - BLOCK
      ?auto_811906 - BLOCK
      ?auto_811907 - BLOCK
      ?auto_811908 - BLOCK
      ?auto_811909 - BLOCK
      ?auto_811910 - BLOCK
      ?auto_811911 - BLOCK
    )
    :vars
    (
      ?auto_811912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811911 ?auto_811912 ) ( ON-TABLE ?auto_811901 ) ( ON ?auto_811902 ?auto_811901 ) ( ON ?auto_811903 ?auto_811902 ) ( ON ?auto_811904 ?auto_811903 ) ( ON ?auto_811905 ?auto_811904 ) ( ON ?auto_811906 ?auto_811905 ) ( not ( = ?auto_811901 ?auto_811902 ) ) ( not ( = ?auto_811901 ?auto_811903 ) ) ( not ( = ?auto_811901 ?auto_811904 ) ) ( not ( = ?auto_811901 ?auto_811905 ) ) ( not ( = ?auto_811901 ?auto_811906 ) ) ( not ( = ?auto_811901 ?auto_811907 ) ) ( not ( = ?auto_811901 ?auto_811908 ) ) ( not ( = ?auto_811901 ?auto_811909 ) ) ( not ( = ?auto_811901 ?auto_811910 ) ) ( not ( = ?auto_811901 ?auto_811911 ) ) ( not ( = ?auto_811901 ?auto_811912 ) ) ( not ( = ?auto_811902 ?auto_811903 ) ) ( not ( = ?auto_811902 ?auto_811904 ) ) ( not ( = ?auto_811902 ?auto_811905 ) ) ( not ( = ?auto_811902 ?auto_811906 ) ) ( not ( = ?auto_811902 ?auto_811907 ) ) ( not ( = ?auto_811902 ?auto_811908 ) ) ( not ( = ?auto_811902 ?auto_811909 ) ) ( not ( = ?auto_811902 ?auto_811910 ) ) ( not ( = ?auto_811902 ?auto_811911 ) ) ( not ( = ?auto_811902 ?auto_811912 ) ) ( not ( = ?auto_811903 ?auto_811904 ) ) ( not ( = ?auto_811903 ?auto_811905 ) ) ( not ( = ?auto_811903 ?auto_811906 ) ) ( not ( = ?auto_811903 ?auto_811907 ) ) ( not ( = ?auto_811903 ?auto_811908 ) ) ( not ( = ?auto_811903 ?auto_811909 ) ) ( not ( = ?auto_811903 ?auto_811910 ) ) ( not ( = ?auto_811903 ?auto_811911 ) ) ( not ( = ?auto_811903 ?auto_811912 ) ) ( not ( = ?auto_811904 ?auto_811905 ) ) ( not ( = ?auto_811904 ?auto_811906 ) ) ( not ( = ?auto_811904 ?auto_811907 ) ) ( not ( = ?auto_811904 ?auto_811908 ) ) ( not ( = ?auto_811904 ?auto_811909 ) ) ( not ( = ?auto_811904 ?auto_811910 ) ) ( not ( = ?auto_811904 ?auto_811911 ) ) ( not ( = ?auto_811904 ?auto_811912 ) ) ( not ( = ?auto_811905 ?auto_811906 ) ) ( not ( = ?auto_811905 ?auto_811907 ) ) ( not ( = ?auto_811905 ?auto_811908 ) ) ( not ( = ?auto_811905 ?auto_811909 ) ) ( not ( = ?auto_811905 ?auto_811910 ) ) ( not ( = ?auto_811905 ?auto_811911 ) ) ( not ( = ?auto_811905 ?auto_811912 ) ) ( not ( = ?auto_811906 ?auto_811907 ) ) ( not ( = ?auto_811906 ?auto_811908 ) ) ( not ( = ?auto_811906 ?auto_811909 ) ) ( not ( = ?auto_811906 ?auto_811910 ) ) ( not ( = ?auto_811906 ?auto_811911 ) ) ( not ( = ?auto_811906 ?auto_811912 ) ) ( not ( = ?auto_811907 ?auto_811908 ) ) ( not ( = ?auto_811907 ?auto_811909 ) ) ( not ( = ?auto_811907 ?auto_811910 ) ) ( not ( = ?auto_811907 ?auto_811911 ) ) ( not ( = ?auto_811907 ?auto_811912 ) ) ( not ( = ?auto_811908 ?auto_811909 ) ) ( not ( = ?auto_811908 ?auto_811910 ) ) ( not ( = ?auto_811908 ?auto_811911 ) ) ( not ( = ?auto_811908 ?auto_811912 ) ) ( not ( = ?auto_811909 ?auto_811910 ) ) ( not ( = ?auto_811909 ?auto_811911 ) ) ( not ( = ?auto_811909 ?auto_811912 ) ) ( not ( = ?auto_811910 ?auto_811911 ) ) ( not ( = ?auto_811910 ?auto_811912 ) ) ( not ( = ?auto_811911 ?auto_811912 ) ) ( ON ?auto_811910 ?auto_811911 ) ( ON ?auto_811909 ?auto_811910 ) ( ON ?auto_811908 ?auto_811909 ) ( CLEAR ?auto_811906 ) ( ON ?auto_811907 ?auto_811908 ) ( CLEAR ?auto_811907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_811901 ?auto_811902 ?auto_811903 ?auto_811904 ?auto_811905 ?auto_811906 ?auto_811907 )
      ( MAKE-11PILE ?auto_811901 ?auto_811902 ?auto_811903 ?auto_811904 ?auto_811905 ?auto_811906 ?auto_811907 ?auto_811908 ?auto_811909 ?auto_811910 ?auto_811911 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811947 - BLOCK
      ?auto_811948 - BLOCK
      ?auto_811949 - BLOCK
      ?auto_811950 - BLOCK
      ?auto_811951 - BLOCK
      ?auto_811952 - BLOCK
      ?auto_811953 - BLOCK
      ?auto_811954 - BLOCK
      ?auto_811955 - BLOCK
      ?auto_811956 - BLOCK
      ?auto_811957 - BLOCK
    )
    :vars
    (
      ?auto_811958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_811957 ?auto_811958 ) ( ON-TABLE ?auto_811947 ) ( ON ?auto_811948 ?auto_811947 ) ( ON ?auto_811949 ?auto_811948 ) ( ON ?auto_811950 ?auto_811949 ) ( ON ?auto_811951 ?auto_811950 ) ( not ( = ?auto_811947 ?auto_811948 ) ) ( not ( = ?auto_811947 ?auto_811949 ) ) ( not ( = ?auto_811947 ?auto_811950 ) ) ( not ( = ?auto_811947 ?auto_811951 ) ) ( not ( = ?auto_811947 ?auto_811952 ) ) ( not ( = ?auto_811947 ?auto_811953 ) ) ( not ( = ?auto_811947 ?auto_811954 ) ) ( not ( = ?auto_811947 ?auto_811955 ) ) ( not ( = ?auto_811947 ?auto_811956 ) ) ( not ( = ?auto_811947 ?auto_811957 ) ) ( not ( = ?auto_811947 ?auto_811958 ) ) ( not ( = ?auto_811948 ?auto_811949 ) ) ( not ( = ?auto_811948 ?auto_811950 ) ) ( not ( = ?auto_811948 ?auto_811951 ) ) ( not ( = ?auto_811948 ?auto_811952 ) ) ( not ( = ?auto_811948 ?auto_811953 ) ) ( not ( = ?auto_811948 ?auto_811954 ) ) ( not ( = ?auto_811948 ?auto_811955 ) ) ( not ( = ?auto_811948 ?auto_811956 ) ) ( not ( = ?auto_811948 ?auto_811957 ) ) ( not ( = ?auto_811948 ?auto_811958 ) ) ( not ( = ?auto_811949 ?auto_811950 ) ) ( not ( = ?auto_811949 ?auto_811951 ) ) ( not ( = ?auto_811949 ?auto_811952 ) ) ( not ( = ?auto_811949 ?auto_811953 ) ) ( not ( = ?auto_811949 ?auto_811954 ) ) ( not ( = ?auto_811949 ?auto_811955 ) ) ( not ( = ?auto_811949 ?auto_811956 ) ) ( not ( = ?auto_811949 ?auto_811957 ) ) ( not ( = ?auto_811949 ?auto_811958 ) ) ( not ( = ?auto_811950 ?auto_811951 ) ) ( not ( = ?auto_811950 ?auto_811952 ) ) ( not ( = ?auto_811950 ?auto_811953 ) ) ( not ( = ?auto_811950 ?auto_811954 ) ) ( not ( = ?auto_811950 ?auto_811955 ) ) ( not ( = ?auto_811950 ?auto_811956 ) ) ( not ( = ?auto_811950 ?auto_811957 ) ) ( not ( = ?auto_811950 ?auto_811958 ) ) ( not ( = ?auto_811951 ?auto_811952 ) ) ( not ( = ?auto_811951 ?auto_811953 ) ) ( not ( = ?auto_811951 ?auto_811954 ) ) ( not ( = ?auto_811951 ?auto_811955 ) ) ( not ( = ?auto_811951 ?auto_811956 ) ) ( not ( = ?auto_811951 ?auto_811957 ) ) ( not ( = ?auto_811951 ?auto_811958 ) ) ( not ( = ?auto_811952 ?auto_811953 ) ) ( not ( = ?auto_811952 ?auto_811954 ) ) ( not ( = ?auto_811952 ?auto_811955 ) ) ( not ( = ?auto_811952 ?auto_811956 ) ) ( not ( = ?auto_811952 ?auto_811957 ) ) ( not ( = ?auto_811952 ?auto_811958 ) ) ( not ( = ?auto_811953 ?auto_811954 ) ) ( not ( = ?auto_811953 ?auto_811955 ) ) ( not ( = ?auto_811953 ?auto_811956 ) ) ( not ( = ?auto_811953 ?auto_811957 ) ) ( not ( = ?auto_811953 ?auto_811958 ) ) ( not ( = ?auto_811954 ?auto_811955 ) ) ( not ( = ?auto_811954 ?auto_811956 ) ) ( not ( = ?auto_811954 ?auto_811957 ) ) ( not ( = ?auto_811954 ?auto_811958 ) ) ( not ( = ?auto_811955 ?auto_811956 ) ) ( not ( = ?auto_811955 ?auto_811957 ) ) ( not ( = ?auto_811955 ?auto_811958 ) ) ( not ( = ?auto_811956 ?auto_811957 ) ) ( not ( = ?auto_811956 ?auto_811958 ) ) ( not ( = ?auto_811957 ?auto_811958 ) ) ( ON ?auto_811956 ?auto_811957 ) ( ON ?auto_811955 ?auto_811956 ) ( ON ?auto_811954 ?auto_811955 ) ( ON ?auto_811953 ?auto_811954 ) ( CLEAR ?auto_811951 ) ( ON ?auto_811952 ?auto_811953 ) ( CLEAR ?auto_811952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_811947 ?auto_811948 ?auto_811949 ?auto_811950 ?auto_811951 ?auto_811952 )
      ( MAKE-11PILE ?auto_811947 ?auto_811948 ?auto_811949 ?auto_811950 ?auto_811951 ?auto_811952 ?auto_811953 ?auto_811954 ?auto_811955 ?auto_811956 ?auto_811957 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_811993 - BLOCK
      ?auto_811994 - BLOCK
      ?auto_811995 - BLOCK
      ?auto_811996 - BLOCK
      ?auto_811997 - BLOCK
      ?auto_811998 - BLOCK
      ?auto_811999 - BLOCK
      ?auto_812000 - BLOCK
      ?auto_812001 - BLOCK
      ?auto_812002 - BLOCK
      ?auto_812003 - BLOCK
    )
    :vars
    (
      ?auto_812004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812003 ?auto_812004 ) ( ON-TABLE ?auto_811993 ) ( ON ?auto_811994 ?auto_811993 ) ( ON ?auto_811995 ?auto_811994 ) ( ON ?auto_811996 ?auto_811995 ) ( not ( = ?auto_811993 ?auto_811994 ) ) ( not ( = ?auto_811993 ?auto_811995 ) ) ( not ( = ?auto_811993 ?auto_811996 ) ) ( not ( = ?auto_811993 ?auto_811997 ) ) ( not ( = ?auto_811993 ?auto_811998 ) ) ( not ( = ?auto_811993 ?auto_811999 ) ) ( not ( = ?auto_811993 ?auto_812000 ) ) ( not ( = ?auto_811993 ?auto_812001 ) ) ( not ( = ?auto_811993 ?auto_812002 ) ) ( not ( = ?auto_811993 ?auto_812003 ) ) ( not ( = ?auto_811993 ?auto_812004 ) ) ( not ( = ?auto_811994 ?auto_811995 ) ) ( not ( = ?auto_811994 ?auto_811996 ) ) ( not ( = ?auto_811994 ?auto_811997 ) ) ( not ( = ?auto_811994 ?auto_811998 ) ) ( not ( = ?auto_811994 ?auto_811999 ) ) ( not ( = ?auto_811994 ?auto_812000 ) ) ( not ( = ?auto_811994 ?auto_812001 ) ) ( not ( = ?auto_811994 ?auto_812002 ) ) ( not ( = ?auto_811994 ?auto_812003 ) ) ( not ( = ?auto_811994 ?auto_812004 ) ) ( not ( = ?auto_811995 ?auto_811996 ) ) ( not ( = ?auto_811995 ?auto_811997 ) ) ( not ( = ?auto_811995 ?auto_811998 ) ) ( not ( = ?auto_811995 ?auto_811999 ) ) ( not ( = ?auto_811995 ?auto_812000 ) ) ( not ( = ?auto_811995 ?auto_812001 ) ) ( not ( = ?auto_811995 ?auto_812002 ) ) ( not ( = ?auto_811995 ?auto_812003 ) ) ( not ( = ?auto_811995 ?auto_812004 ) ) ( not ( = ?auto_811996 ?auto_811997 ) ) ( not ( = ?auto_811996 ?auto_811998 ) ) ( not ( = ?auto_811996 ?auto_811999 ) ) ( not ( = ?auto_811996 ?auto_812000 ) ) ( not ( = ?auto_811996 ?auto_812001 ) ) ( not ( = ?auto_811996 ?auto_812002 ) ) ( not ( = ?auto_811996 ?auto_812003 ) ) ( not ( = ?auto_811996 ?auto_812004 ) ) ( not ( = ?auto_811997 ?auto_811998 ) ) ( not ( = ?auto_811997 ?auto_811999 ) ) ( not ( = ?auto_811997 ?auto_812000 ) ) ( not ( = ?auto_811997 ?auto_812001 ) ) ( not ( = ?auto_811997 ?auto_812002 ) ) ( not ( = ?auto_811997 ?auto_812003 ) ) ( not ( = ?auto_811997 ?auto_812004 ) ) ( not ( = ?auto_811998 ?auto_811999 ) ) ( not ( = ?auto_811998 ?auto_812000 ) ) ( not ( = ?auto_811998 ?auto_812001 ) ) ( not ( = ?auto_811998 ?auto_812002 ) ) ( not ( = ?auto_811998 ?auto_812003 ) ) ( not ( = ?auto_811998 ?auto_812004 ) ) ( not ( = ?auto_811999 ?auto_812000 ) ) ( not ( = ?auto_811999 ?auto_812001 ) ) ( not ( = ?auto_811999 ?auto_812002 ) ) ( not ( = ?auto_811999 ?auto_812003 ) ) ( not ( = ?auto_811999 ?auto_812004 ) ) ( not ( = ?auto_812000 ?auto_812001 ) ) ( not ( = ?auto_812000 ?auto_812002 ) ) ( not ( = ?auto_812000 ?auto_812003 ) ) ( not ( = ?auto_812000 ?auto_812004 ) ) ( not ( = ?auto_812001 ?auto_812002 ) ) ( not ( = ?auto_812001 ?auto_812003 ) ) ( not ( = ?auto_812001 ?auto_812004 ) ) ( not ( = ?auto_812002 ?auto_812003 ) ) ( not ( = ?auto_812002 ?auto_812004 ) ) ( not ( = ?auto_812003 ?auto_812004 ) ) ( ON ?auto_812002 ?auto_812003 ) ( ON ?auto_812001 ?auto_812002 ) ( ON ?auto_812000 ?auto_812001 ) ( ON ?auto_811999 ?auto_812000 ) ( ON ?auto_811998 ?auto_811999 ) ( CLEAR ?auto_811996 ) ( ON ?auto_811997 ?auto_811998 ) ( CLEAR ?auto_811997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_811993 ?auto_811994 ?auto_811995 ?auto_811996 ?auto_811997 )
      ( MAKE-11PILE ?auto_811993 ?auto_811994 ?auto_811995 ?auto_811996 ?auto_811997 ?auto_811998 ?auto_811999 ?auto_812000 ?auto_812001 ?auto_812002 ?auto_812003 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_812039 - BLOCK
      ?auto_812040 - BLOCK
      ?auto_812041 - BLOCK
      ?auto_812042 - BLOCK
      ?auto_812043 - BLOCK
      ?auto_812044 - BLOCK
      ?auto_812045 - BLOCK
      ?auto_812046 - BLOCK
      ?auto_812047 - BLOCK
      ?auto_812048 - BLOCK
      ?auto_812049 - BLOCK
    )
    :vars
    (
      ?auto_812050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812049 ?auto_812050 ) ( ON-TABLE ?auto_812039 ) ( ON ?auto_812040 ?auto_812039 ) ( ON ?auto_812041 ?auto_812040 ) ( not ( = ?auto_812039 ?auto_812040 ) ) ( not ( = ?auto_812039 ?auto_812041 ) ) ( not ( = ?auto_812039 ?auto_812042 ) ) ( not ( = ?auto_812039 ?auto_812043 ) ) ( not ( = ?auto_812039 ?auto_812044 ) ) ( not ( = ?auto_812039 ?auto_812045 ) ) ( not ( = ?auto_812039 ?auto_812046 ) ) ( not ( = ?auto_812039 ?auto_812047 ) ) ( not ( = ?auto_812039 ?auto_812048 ) ) ( not ( = ?auto_812039 ?auto_812049 ) ) ( not ( = ?auto_812039 ?auto_812050 ) ) ( not ( = ?auto_812040 ?auto_812041 ) ) ( not ( = ?auto_812040 ?auto_812042 ) ) ( not ( = ?auto_812040 ?auto_812043 ) ) ( not ( = ?auto_812040 ?auto_812044 ) ) ( not ( = ?auto_812040 ?auto_812045 ) ) ( not ( = ?auto_812040 ?auto_812046 ) ) ( not ( = ?auto_812040 ?auto_812047 ) ) ( not ( = ?auto_812040 ?auto_812048 ) ) ( not ( = ?auto_812040 ?auto_812049 ) ) ( not ( = ?auto_812040 ?auto_812050 ) ) ( not ( = ?auto_812041 ?auto_812042 ) ) ( not ( = ?auto_812041 ?auto_812043 ) ) ( not ( = ?auto_812041 ?auto_812044 ) ) ( not ( = ?auto_812041 ?auto_812045 ) ) ( not ( = ?auto_812041 ?auto_812046 ) ) ( not ( = ?auto_812041 ?auto_812047 ) ) ( not ( = ?auto_812041 ?auto_812048 ) ) ( not ( = ?auto_812041 ?auto_812049 ) ) ( not ( = ?auto_812041 ?auto_812050 ) ) ( not ( = ?auto_812042 ?auto_812043 ) ) ( not ( = ?auto_812042 ?auto_812044 ) ) ( not ( = ?auto_812042 ?auto_812045 ) ) ( not ( = ?auto_812042 ?auto_812046 ) ) ( not ( = ?auto_812042 ?auto_812047 ) ) ( not ( = ?auto_812042 ?auto_812048 ) ) ( not ( = ?auto_812042 ?auto_812049 ) ) ( not ( = ?auto_812042 ?auto_812050 ) ) ( not ( = ?auto_812043 ?auto_812044 ) ) ( not ( = ?auto_812043 ?auto_812045 ) ) ( not ( = ?auto_812043 ?auto_812046 ) ) ( not ( = ?auto_812043 ?auto_812047 ) ) ( not ( = ?auto_812043 ?auto_812048 ) ) ( not ( = ?auto_812043 ?auto_812049 ) ) ( not ( = ?auto_812043 ?auto_812050 ) ) ( not ( = ?auto_812044 ?auto_812045 ) ) ( not ( = ?auto_812044 ?auto_812046 ) ) ( not ( = ?auto_812044 ?auto_812047 ) ) ( not ( = ?auto_812044 ?auto_812048 ) ) ( not ( = ?auto_812044 ?auto_812049 ) ) ( not ( = ?auto_812044 ?auto_812050 ) ) ( not ( = ?auto_812045 ?auto_812046 ) ) ( not ( = ?auto_812045 ?auto_812047 ) ) ( not ( = ?auto_812045 ?auto_812048 ) ) ( not ( = ?auto_812045 ?auto_812049 ) ) ( not ( = ?auto_812045 ?auto_812050 ) ) ( not ( = ?auto_812046 ?auto_812047 ) ) ( not ( = ?auto_812046 ?auto_812048 ) ) ( not ( = ?auto_812046 ?auto_812049 ) ) ( not ( = ?auto_812046 ?auto_812050 ) ) ( not ( = ?auto_812047 ?auto_812048 ) ) ( not ( = ?auto_812047 ?auto_812049 ) ) ( not ( = ?auto_812047 ?auto_812050 ) ) ( not ( = ?auto_812048 ?auto_812049 ) ) ( not ( = ?auto_812048 ?auto_812050 ) ) ( not ( = ?auto_812049 ?auto_812050 ) ) ( ON ?auto_812048 ?auto_812049 ) ( ON ?auto_812047 ?auto_812048 ) ( ON ?auto_812046 ?auto_812047 ) ( ON ?auto_812045 ?auto_812046 ) ( ON ?auto_812044 ?auto_812045 ) ( ON ?auto_812043 ?auto_812044 ) ( CLEAR ?auto_812041 ) ( ON ?auto_812042 ?auto_812043 ) ( CLEAR ?auto_812042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_812039 ?auto_812040 ?auto_812041 ?auto_812042 )
      ( MAKE-11PILE ?auto_812039 ?auto_812040 ?auto_812041 ?auto_812042 ?auto_812043 ?auto_812044 ?auto_812045 ?auto_812046 ?auto_812047 ?auto_812048 ?auto_812049 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_812085 - BLOCK
      ?auto_812086 - BLOCK
      ?auto_812087 - BLOCK
      ?auto_812088 - BLOCK
      ?auto_812089 - BLOCK
      ?auto_812090 - BLOCK
      ?auto_812091 - BLOCK
      ?auto_812092 - BLOCK
      ?auto_812093 - BLOCK
      ?auto_812094 - BLOCK
      ?auto_812095 - BLOCK
    )
    :vars
    (
      ?auto_812096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812095 ?auto_812096 ) ( ON-TABLE ?auto_812085 ) ( ON ?auto_812086 ?auto_812085 ) ( not ( = ?auto_812085 ?auto_812086 ) ) ( not ( = ?auto_812085 ?auto_812087 ) ) ( not ( = ?auto_812085 ?auto_812088 ) ) ( not ( = ?auto_812085 ?auto_812089 ) ) ( not ( = ?auto_812085 ?auto_812090 ) ) ( not ( = ?auto_812085 ?auto_812091 ) ) ( not ( = ?auto_812085 ?auto_812092 ) ) ( not ( = ?auto_812085 ?auto_812093 ) ) ( not ( = ?auto_812085 ?auto_812094 ) ) ( not ( = ?auto_812085 ?auto_812095 ) ) ( not ( = ?auto_812085 ?auto_812096 ) ) ( not ( = ?auto_812086 ?auto_812087 ) ) ( not ( = ?auto_812086 ?auto_812088 ) ) ( not ( = ?auto_812086 ?auto_812089 ) ) ( not ( = ?auto_812086 ?auto_812090 ) ) ( not ( = ?auto_812086 ?auto_812091 ) ) ( not ( = ?auto_812086 ?auto_812092 ) ) ( not ( = ?auto_812086 ?auto_812093 ) ) ( not ( = ?auto_812086 ?auto_812094 ) ) ( not ( = ?auto_812086 ?auto_812095 ) ) ( not ( = ?auto_812086 ?auto_812096 ) ) ( not ( = ?auto_812087 ?auto_812088 ) ) ( not ( = ?auto_812087 ?auto_812089 ) ) ( not ( = ?auto_812087 ?auto_812090 ) ) ( not ( = ?auto_812087 ?auto_812091 ) ) ( not ( = ?auto_812087 ?auto_812092 ) ) ( not ( = ?auto_812087 ?auto_812093 ) ) ( not ( = ?auto_812087 ?auto_812094 ) ) ( not ( = ?auto_812087 ?auto_812095 ) ) ( not ( = ?auto_812087 ?auto_812096 ) ) ( not ( = ?auto_812088 ?auto_812089 ) ) ( not ( = ?auto_812088 ?auto_812090 ) ) ( not ( = ?auto_812088 ?auto_812091 ) ) ( not ( = ?auto_812088 ?auto_812092 ) ) ( not ( = ?auto_812088 ?auto_812093 ) ) ( not ( = ?auto_812088 ?auto_812094 ) ) ( not ( = ?auto_812088 ?auto_812095 ) ) ( not ( = ?auto_812088 ?auto_812096 ) ) ( not ( = ?auto_812089 ?auto_812090 ) ) ( not ( = ?auto_812089 ?auto_812091 ) ) ( not ( = ?auto_812089 ?auto_812092 ) ) ( not ( = ?auto_812089 ?auto_812093 ) ) ( not ( = ?auto_812089 ?auto_812094 ) ) ( not ( = ?auto_812089 ?auto_812095 ) ) ( not ( = ?auto_812089 ?auto_812096 ) ) ( not ( = ?auto_812090 ?auto_812091 ) ) ( not ( = ?auto_812090 ?auto_812092 ) ) ( not ( = ?auto_812090 ?auto_812093 ) ) ( not ( = ?auto_812090 ?auto_812094 ) ) ( not ( = ?auto_812090 ?auto_812095 ) ) ( not ( = ?auto_812090 ?auto_812096 ) ) ( not ( = ?auto_812091 ?auto_812092 ) ) ( not ( = ?auto_812091 ?auto_812093 ) ) ( not ( = ?auto_812091 ?auto_812094 ) ) ( not ( = ?auto_812091 ?auto_812095 ) ) ( not ( = ?auto_812091 ?auto_812096 ) ) ( not ( = ?auto_812092 ?auto_812093 ) ) ( not ( = ?auto_812092 ?auto_812094 ) ) ( not ( = ?auto_812092 ?auto_812095 ) ) ( not ( = ?auto_812092 ?auto_812096 ) ) ( not ( = ?auto_812093 ?auto_812094 ) ) ( not ( = ?auto_812093 ?auto_812095 ) ) ( not ( = ?auto_812093 ?auto_812096 ) ) ( not ( = ?auto_812094 ?auto_812095 ) ) ( not ( = ?auto_812094 ?auto_812096 ) ) ( not ( = ?auto_812095 ?auto_812096 ) ) ( ON ?auto_812094 ?auto_812095 ) ( ON ?auto_812093 ?auto_812094 ) ( ON ?auto_812092 ?auto_812093 ) ( ON ?auto_812091 ?auto_812092 ) ( ON ?auto_812090 ?auto_812091 ) ( ON ?auto_812089 ?auto_812090 ) ( ON ?auto_812088 ?auto_812089 ) ( CLEAR ?auto_812086 ) ( ON ?auto_812087 ?auto_812088 ) ( CLEAR ?auto_812087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_812085 ?auto_812086 ?auto_812087 )
      ( MAKE-11PILE ?auto_812085 ?auto_812086 ?auto_812087 ?auto_812088 ?auto_812089 ?auto_812090 ?auto_812091 ?auto_812092 ?auto_812093 ?auto_812094 ?auto_812095 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_812131 - BLOCK
      ?auto_812132 - BLOCK
      ?auto_812133 - BLOCK
      ?auto_812134 - BLOCK
      ?auto_812135 - BLOCK
      ?auto_812136 - BLOCK
      ?auto_812137 - BLOCK
      ?auto_812138 - BLOCK
      ?auto_812139 - BLOCK
      ?auto_812140 - BLOCK
      ?auto_812141 - BLOCK
    )
    :vars
    (
      ?auto_812142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812141 ?auto_812142 ) ( ON-TABLE ?auto_812131 ) ( not ( = ?auto_812131 ?auto_812132 ) ) ( not ( = ?auto_812131 ?auto_812133 ) ) ( not ( = ?auto_812131 ?auto_812134 ) ) ( not ( = ?auto_812131 ?auto_812135 ) ) ( not ( = ?auto_812131 ?auto_812136 ) ) ( not ( = ?auto_812131 ?auto_812137 ) ) ( not ( = ?auto_812131 ?auto_812138 ) ) ( not ( = ?auto_812131 ?auto_812139 ) ) ( not ( = ?auto_812131 ?auto_812140 ) ) ( not ( = ?auto_812131 ?auto_812141 ) ) ( not ( = ?auto_812131 ?auto_812142 ) ) ( not ( = ?auto_812132 ?auto_812133 ) ) ( not ( = ?auto_812132 ?auto_812134 ) ) ( not ( = ?auto_812132 ?auto_812135 ) ) ( not ( = ?auto_812132 ?auto_812136 ) ) ( not ( = ?auto_812132 ?auto_812137 ) ) ( not ( = ?auto_812132 ?auto_812138 ) ) ( not ( = ?auto_812132 ?auto_812139 ) ) ( not ( = ?auto_812132 ?auto_812140 ) ) ( not ( = ?auto_812132 ?auto_812141 ) ) ( not ( = ?auto_812132 ?auto_812142 ) ) ( not ( = ?auto_812133 ?auto_812134 ) ) ( not ( = ?auto_812133 ?auto_812135 ) ) ( not ( = ?auto_812133 ?auto_812136 ) ) ( not ( = ?auto_812133 ?auto_812137 ) ) ( not ( = ?auto_812133 ?auto_812138 ) ) ( not ( = ?auto_812133 ?auto_812139 ) ) ( not ( = ?auto_812133 ?auto_812140 ) ) ( not ( = ?auto_812133 ?auto_812141 ) ) ( not ( = ?auto_812133 ?auto_812142 ) ) ( not ( = ?auto_812134 ?auto_812135 ) ) ( not ( = ?auto_812134 ?auto_812136 ) ) ( not ( = ?auto_812134 ?auto_812137 ) ) ( not ( = ?auto_812134 ?auto_812138 ) ) ( not ( = ?auto_812134 ?auto_812139 ) ) ( not ( = ?auto_812134 ?auto_812140 ) ) ( not ( = ?auto_812134 ?auto_812141 ) ) ( not ( = ?auto_812134 ?auto_812142 ) ) ( not ( = ?auto_812135 ?auto_812136 ) ) ( not ( = ?auto_812135 ?auto_812137 ) ) ( not ( = ?auto_812135 ?auto_812138 ) ) ( not ( = ?auto_812135 ?auto_812139 ) ) ( not ( = ?auto_812135 ?auto_812140 ) ) ( not ( = ?auto_812135 ?auto_812141 ) ) ( not ( = ?auto_812135 ?auto_812142 ) ) ( not ( = ?auto_812136 ?auto_812137 ) ) ( not ( = ?auto_812136 ?auto_812138 ) ) ( not ( = ?auto_812136 ?auto_812139 ) ) ( not ( = ?auto_812136 ?auto_812140 ) ) ( not ( = ?auto_812136 ?auto_812141 ) ) ( not ( = ?auto_812136 ?auto_812142 ) ) ( not ( = ?auto_812137 ?auto_812138 ) ) ( not ( = ?auto_812137 ?auto_812139 ) ) ( not ( = ?auto_812137 ?auto_812140 ) ) ( not ( = ?auto_812137 ?auto_812141 ) ) ( not ( = ?auto_812137 ?auto_812142 ) ) ( not ( = ?auto_812138 ?auto_812139 ) ) ( not ( = ?auto_812138 ?auto_812140 ) ) ( not ( = ?auto_812138 ?auto_812141 ) ) ( not ( = ?auto_812138 ?auto_812142 ) ) ( not ( = ?auto_812139 ?auto_812140 ) ) ( not ( = ?auto_812139 ?auto_812141 ) ) ( not ( = ?auto_812139 ?auto_812142 ) ) ( not ( = ?auto_812140 ?auto_812141 ) ) ( not ( = ?auto_812140 ?auto_812142 ) ) ( not ( = ?auto_812141 ?auto_812142 ) ) ( ON ?auto_812140 ?auto_812141 ) ( ON ?auto_812139 ?auto_812140 ) ( ON ?auto_812138 ?auto_812139 ) ( ON ?auto_812137 ?auto_812138 ) ( ON ?auto_812136 ?auto_812137 ) ( ON ?auto_812135 ?auto_812136 ) ( ON ?auto_812134 ?auto_812135 ) ( ON ?auto_812133 ?auto_812134 ) ( CLEAR ?auto_812131 ) ( ON ?auto_812132 ?auto_812133 ) ( CLEAR ?auto_812132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_812131 ?auto_812132 )
      ( MAKE-11PILE ?auto_812131 ?auto_812132 ?auto_812133 ?auto_812134 ?auto_812135 ?auto_812136 ?auto_812137 ?auto_812138 ?auto_812139 ?auto_812140 ?auto_812141 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_812177 - BLOCK
      ?auto_812178 - BLOCK
      ?auto_812179 - BLOCK
      ?auto_812180 - BLOCK
      ?auto_812181 - BLOCK
      ?auto_812182 - BLOCK
      ?auto_812183 - BLOCK
      ?auto_812184 - BLOCK
      ?auto_812185 - BLOCK
      ?auto_812186 - BLOCK
      ?auto_812187 - BLOCK
    )
    :vars
    (
      ?auto_812188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812187 ?auto_812188 ) ( not ( = ?auto_812177 ?auto_812178 ) ) ( not ( = ?auto_812177 ?auto_812179 ) ) ( not ( = ?auto_812177 ?auto_812180 ) ) ( not ( = ?auto_812177 ?auto_812181 ) ) ( not ( = ?auto_812177 ?auto_812182 ) ) ( not ( = ?auto_812177 ?auto_812183 ) ) ( not ( = ?auto_812177 ?auto_812184 ) ) ( not ( = ?auto_812177 ?auto_812185 ) ) ( not ( = ?auto_812177 ?auto_812186 ) ) ( not ( = ?auto_812177 ?auto_812187 ) ) ( not ( = ?auto_812177 ?auto_812188 ) ) ( not ( = ?auto_812178 ?auto_812179 ) ) ( not ( = ?auto_812178 ?auto_812180 ) ) ( not ( = ?auto_812178 ?auto_812181 ) ) ( not ( = ?auto_812178 ?auto_812182 ) ) ( not ( = ?auto_812178 ?auto_812183 ) ) ( not ( = ?auto_812178 ?auto_812184 ) ) ( not ( = ?auto_812178 ?auto_812185 ) ) ( not ( = ?auto_812178 ?auto_812186 ) ) ( not ( = ?auto_812178 ?auto_812187 ) ) ( not ( = ?auto_812178 ?auto_812188 ) ) ( not ( = ?auto_812179 ?auto_812180 ) ) ( not ( = ?auto_812179 ?auto_812181 ) ) ( not ( = ?auto_812179 ?auto_812182 ) ) ( not ( = ?auto_812179 ?auto_812183 ) ) ( not ( = ?auto_812179 ?auto_812184 ) ) ( not ( = ?auto_812179 ?auto_812185 ) ) ( not ( = ?auto_812179 ?auto_812186 ) ) ( not ( = ?auto_812179 ?auto_812187 ) ) ( not ( = ?auto_812179 ?auto_812188 ) ) ( not ( = ?auto_812180 ?auto_812181 ) ) ( not ( = ?auto_812180 ?auto_812182 ) ) ( not ( = ?auto_812180 ?auto_812183 ) ) ( not ( = ?auto_812180 ?auto_812184 ) ) ( not ( = ?auto_812180 ?auto_812185 ) ) ( not ( = ?auto_812180 ?auto_812186 ) ) ( not ( = ?auto_812180 ?auto_812187 ) ) ( not ( = ?auto_812180 ?auto_812188 ) ) ( not ( = ?auto_812181 ?auto_812182 ) ) ( not ( = ?auto_812181 ?auto_812183 ) ) ( not ( = ?auto_812181 ?auto_812184 ) ) ( not ( = ?auto_812181 ?auto_812185 ) ) ( not ( = ?auto_812181 ?auto_812186 ) ) ( not ( = ?auto_812181 ?auto_812187 ) ) ( not ( = ?auto_812181 ?auto_812188 ) ) ( not ( = ?auto_812182 ?auto_812183 ) ) ( not ( = ?auto_812182 ?auto_812184 ) ) ( not ( = ?auto_812182 ?auto_812185 ) ) ( not ( = ?auto_812182 ?auto_812186 ) ) ( not ( = ?auto_812182 ?auto_812187 ) ) ( not ( = ?auto_812182 ?auto_812188 ) ) ( not ( = ?auto_812183 ?auto_812184 ) ) ( not ( = ?auto_812183 ?auto_812185 ) ) ( not ( = ?auto_812183 ?auto_812186 ) ) ( not ( = ?auto_812183 ?auto_812187 ) ) ( not ( = ?auto_812183 ?auto_812188 ) ) ( not ( = ?auto_812184 ?auto_812185 ) ) ( not ( = ?auto_812184 ?auto_812186 ) ) ( not ( = ?auto_812184 ?auto_812187 ) ) ( not ( = ?auto_812184 ?auto_812188 ) ) ( not ( = ?auto_812185 ?auto_812186 ) ) ( not ( = ?auto_812185 ?auto_812187 ) ) ( not ( = ?auto_812185 ?auto_812188 ) ) ( not ( = ?auto_812186 ?auto_812187 ) ) ( not ( = ?auto_812186 ?auto_812188 ) ) ( not ( = ?auto_812187 ?auto_812188 ) ) ( ON ?auto_812186 ?auto_812187 ) ( ON ?auto_812185 ?auto_812186 ) ( ON ?auto_812184 ?auto_812185 ) ( ON ?auto_812183 ?auto_812184 ) ( ON ?auto_812182 ?auto_812183 ) ( ON ?auto_812181 ?auto_812182 ) ( ON ?auto_812180 ?auto_812181 ) ( ON ?auto_812179 ?auto_812180 ) ( ON ?auto_812178 ?auto_812179 ) ( ON ?auto_812177 ?auto_812178 ) ( CLEAR ?auto_812177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_812177 )
      ( MAKE-11PILE ?auto_812177 ?auto_812178 ?auto_812179 ?auto_812180 ?auto_812181 ?auto_812182 ?auto_812183 ?auto_812184 ?auto_812185 ?auto_812186 ?auto_812187 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812224 - BLOCK
      ?auto_812225 - BLOCK
      ?auto_812226 - BLOCK
      ?auto_812227 - BLOCK
      ?auto_812228 - BLOCK
      ?auto_812229 - BLOCK
      ?auto_812230 - BLOCK
      ?auto_812231 - BLOCK
      ?auto_812232 - BLOCK
      ?auto_812233 - BLOCK
      ?auto_812234 - BLOCK
      ?auto_812235 - BLOCK
    )
    :vars
    (
      ?auto_812236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_812234 ) ( ON ?auto_812235 ?auto_812236 ) ( CLEAR ?auto_812235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_812224 ) ( ON ?auto_812225 ?auto_812224 ) ( ON ?auto_812226 ?auto_812225 ) ( ON ?auto_812227 ?auto_812226 ) ( ON ?auto_812228 ?auto_812227 ) ( ON ?auto_812229 ?auto_812228 ) ( ON ?auto_812230 ?auto_812229 ) ( ON ?auto_812231 ?auto_812230 ) ( ON ?auto_812232 ?auto_812231 ) ( ON ?auto_812233 ?auto_812232 ) ( ON ?auto_812234 ?auto_812233 ) ( not ( = ?auto_812224 ?auto_812225 ) ) ( not ( = ?auto_812224 ?auto_812226 ) ) ( not ( = ?auto_812224 ?auto_812227 ) ) ( not ( = ?auto_812224 ?auto_812228 ) ) ( not ( = ?auto_812224 ?auto_812229 ) ) ( not ( = ?auto_812224 ?auto_812230 ) ) ( not ( = ?auto_812224 ?auto_812231 ) ) ( not ( = ?auto_812224 ?auto_812232 ) ) ( not ( = ?auto_812224 ?auto_812233 ) ) ( not ( = ?auto_812224 ?auto_812234 ) ) ( not ( = ?auto_812224 ?auto_812235 ) ) ( not ( = ?auto_812224 ?auto_812236 ) ) ( not ( = ?auto_812225 ?auto_812226 ) ) ( not ( = ?auto_812225 ?auto_812227 ) ) ( not ( = ?auto_812225 ?auto_812228 ) ) ( not ( = ?auto_812225 ?auto_812229 ) ) ( not ( = ?auto_812225 ?auto_812230 ) ) ( not ( = ?auto_812225 ?auto_812231 ) ) ( not ( = ?auto_812225 ?auto_812232 ) ) ( not ( = ?auto_812225 ?auto_812233 ) ) ( not ( = ?auto_812225 ?auto_812234 ) ) ( not ( = ?auto_812225 ?auto_812235 ) ) ( not ( = ?auto_812225 ?auto_812236 ) ) ( not ( = ?auto_812226 ?auto_812227 ) ) ( not ( = ?auto_812226 ?auto_812228 ) ) ( not ( = ?auto_812226 ?auto_812229 ) ) ( not ( = ?auto_812226 ?auto_812230 ) ) ( not ( = ?auto_812226 ?auto_812231 ) ) ( not ( = ?auto_812226 ?auto_812232 ) ) ( not ( = ?auto_812226 ?auto_812233 ) ) ( not ( = ?auto_812226 ?auto_812234 ) ) ( not ( = ?auto_812226 ?auto_812235 ) ) ( not ( = ?auto_812226 ?auto_812236 ) ) ( not ( = ?auto_812227 ?auto_812228 ) ) ( not ( = ?auto_812227 ?auto_812229 ) ) ( not ( = ?auto_812227 ?auto_812230 ) ) ( not ( = ?auto_812227 ?auto_812231 ) ) ( not ( = ?auto_812227 ?auto_812232 ) ) ( not ( = ?auto_812227 ?auto_812233 ) ) ( not ( = ?auto_812227 ?auto_812234 ) ) ( not ( = ?auto_812227 ?auto_812235 ) ) ( not ( = ?auto_812227 ?auto_812236 ) ) ( not ( = ?auto_812228 ?auto_812229 ) ) ( not ( = ?auto_812228 ?auto_812230 ) ) ( not ( = ?auto_812228 ?auto_812231 ) ) ( not ( = ?auto_812228 ?auto_812232 ) ) ( not ( = ?auto_812228 ?auto_812233 ) ) ( not ( = ?auto_812228 ?auto_812234 ) ) ( not ( = ?auto_812228 ?auto_812235 ) ) ( not ( = ?auto_812228 ?auto_812236 ) ) ( not ( = ?auto_812229 ?auto_812230 ) ) ( not ( = ?auto_812229 ?auto_812231 ) ) ( not ( = ?auto_812229 ?auto_812232 ) ) ( not ( = ?auto_812229 ?auto_812233 ) ) ( not ( = ?auto_812229 ?auto_812234 ) ) ( not ( = ?auto_812229 ?auto_812235 ) ) ( not ( = ?auto_812229 ?auto_812236 ) ) ( not ( = ?auto_812230 ?auto_812231 ) ) ( not ( = ?auto_812230 ?auto_812232 ) ) ( not ( = ?auto_812230 ?auto_812233 ) ) ( not ( = ?auto_812230 ?auto_812234 ) ) ( not ( = ?auto_812230 ?auto_812235 ) ) ( not ( = ?auto_812230 ?auto_812236 ) ) ( not ( = ?auto_812231 ?auto_812232 ) ) ( not ( = ?auto_812231 ?auto_812233 ) ) ( not ( = ?auto_812231 ?auto_812234 ) ) ( not ( = ?auto_812231 ?auto_812235 ) ) ( not ( = ?auto_812231 ?auto_812236 ) ) ( not ( = ?auto_812232 ?auto_812233 ) ) ( not ( = ?auto_812232 ?auto_812234 ) ) ( not ( = ?auto_812232 ?auto_812235 ) ) ( not ( = ?auto_812232 ?auto_812236 ) ) ( not ( = ?auto_812233 ?auto_812234 ) ) ( not ( = ?auto_812233 ?auto_812235 ) ) ( not ( = ?auto_812233 ?auto_812236 ) ) ( not ( = ?auto_812234 ?auto_812235 ) ) ( not ( = ?auto_812234 ?auto_812236 ) ) ( not ( = ?auto_812235 ?auto_812236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_812235 ?auto_812236 )
      ( !STACK ?auto_812235 ?auto_812234 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812274 - BLOCK
      ?auto_812275 - BLOCK
      ?auto_812276 - BLOCK
      ?auto_812277 - BLOCK
      ?auto_812278 - BLOCK
      ?auto_812279 - BLOCK
      ?auto_812280 - BLOCK
      ?auto_812281 - BLOCK
      ?auto_812282 - BLOCK
      ?auto_812283 - BLOCK
      ?auto_812284 - BLOCK
      ?auto_812285 - BLOCK
    )
    :vars
    (
      ?auto_812286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812285 ?auto_812286 ) ( ON-TABLE ?auto_812274 ) ( ON ?auto_812275 ?auto_812274 ) ( ON ?auto_812276 ?auto_812275 ) ( ON ?auto_812277 ?auto_812276 ) ( ON ?auto_812278 ?auto_812277 ) ( ON ?auto_812279 ?auto_812278 ) ( ON ?auto_812280 ?auto_812279 ) ( ON ?auto_812281 ?auto_812280 ) ( ON ?auto_812282 ?auto_812281 ) ( ON ?auto_812283 ?auto_812282 ) ( not ( = ?auto_812274 ?auto_812275 ) ) ( not ( = ?auto_812274 ?auto_812276 ) ) ( not ( = ?auto_812274 ?auto_812277 ) ) ( not ( = ?auto_812274 ?auto_812278 ) ) ( not ( = ?auto_812274 ?auto_812279 ) ) ( not ( = ?auto_812274 ?auto_812280 ) ) ( not ( = ?auto_812274 ?auto_812281 ) ) ( not ( = ?auto_812274 ?auto_812282 ) ) ( not ( = ?auto_812274 ?auto_812283 ) ) ( not ( = ?auto_812274 ?auto_812284 ) ) ( not ( = ?auto_812274 ?auto_812285 ) ) ( not ( = ?auto_812274 ?auto_812286 ) ) ( not ( = ?auto_812275 ?auto_812276 ) ) ( not ( = ?auto_812275 ?auto_812277 ) ) ( not ( = ?auto_812275 ?auto_812278 ) ) ( not ( = ?auto_812275 ?auto_812279 ) ) ( not ( = ?auto_812275 ?auto_812280 ) ) ( not ( = ?auto_812275 ?auto_812281 ) ) ( not ( = ?auto_812275 ?auto_812282 ) ) ( not ( = ?auto_812275 ?auto_812283 ) ) ( not ( = ?auto_812275 ?auto_812284 ) ) ( not ( = ?auto_812275 ?auto_812285 ) ) ( not ( = ?auto_812275 ?auto_812286 ) ) ( not ( = ?auto_812276 ?auto_812277 ) ) ( not ( = ?auto_812276 ?auto_812278 ) ) ( not ( = ?auto_812276 ?auto_812279 ) ) ( not ( = ?auto_812276 ?auto_812280 ) ) ( not ( = ?auto_812276 ?auto_812281 ) ) ( not ( = ?auto_812276 ?auto_812282 ) ) ( not ( = ?auto_812276 ?auto_812283 ) ) ( not ( = ?auto_812276 ?auto_812284 ) ) ( not ( = ?auto_812276 ?auto_812285 ) ) ( not ( = ?auto_812276 ?auto_812286 ) ) ( not ( = ?auto_812277 ?auto_812278 ) ) ( not ( = ?auto_812277 ?auto_812279 ) ) ( not ( = ?auto_812277 ?auto_812280 ) ) ( not ( = ?auto_812277 ?auto_812281 ) ) ( not ( = ?auto_812277 ?auto_812282 ) ) ( not ( = ?auto_812277 ?auto_812283 ) ) ( not ( = ?auto_812277 ?auto_812284 ) ) ( not ( = ?auto_812277 ?auto_812285 ) ) ( not ( = ?auto_812277 ?auto_812286 ) ) ( not ( = ?auto_812278 ?auto_812279 ) ) ( not ( = ?auto_812278 ?auto_812280 ) ) ( not ( = ?auto_812278 ?auto_812281 ) ) ( not ( = ?auto_812278 ?auto_812282 ) ) ( not ( = ?auto_812278 ?auto_812283 ) ) ( not ( = ?auto_812278 ?auto_812284 ) ) ( not ( = ?auto_812278 ?auto_812285 ) ) ( not ( = ?auto_812278 ?auto_812286 ) ) ( not ( = ?auto_812279 ?auto_812280 ) ) ( not ( = ?auto_812279 ?auto_812281 ) ) ( not ( = ?auto_812279 ?auto_812282 ) ) ( not ( = ?auto_812279 ?auto_812283 ) ) ( not ( = ?auto_812279 ?auto_812284 ) ) ( not ( = ?auto_812279 ?auto_812285 ) ) ( not ( = ?auto_812279 ?auto_812286 ) ) ( not ( = ?auto_812280 ?auto_812281 ) ) ( not ( = ?auto_812280 ?auto_812282 ) ) ( not ( = ?auto_812280 ?auto_812283 ) ) ( not ( = ?auto_812280 ?auto_812284 ) ) ( not ( = ?auto_812280 ?auto_812285 ) ) ( not ( = ?auto_812280 ?auto_812286 ) ) ( not ( = ?auto_812281 ?auto_812282 ) ) ( not ( = ?auto_812281 ?auto_812283 ) ) ( not ( = ?auto_812281 ?auto_812284 ) ) ( not ( = ?auto_812281 ?auto_812285 ) ) ( not ( = ?auto_812281 ?auto_812286 ) ) ( not ( = ?auto_812282 ?auto_812283 ) ) ( not ( = ?auto_812282 ?auto_812284 ) ) ( not ( = ?auto_812282 ?auto_812285 ) ) ( not ( = ?auto_812282 ?auto_812286 ) ) ( not ( = ?auto_812283 ?auto_812284 ) ) ( not ( = ?auto_812283 ?auto_812285 ) ) ( not ( = ?auto_812283 ?auto_812286 ) ) ( not ( = ?auto_812284 ?auto_812285 ) ) ( not ( = ?auto_812284 ?auto_812286 ) ) ( not ( = ?auto_812285 ?auto_812286 ) ) ( CLEAR ?auto_812283 ) ( ON ?auto_812284 ?auto_812285 ) ( CLEAR ?auto_812284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_812274 ?auto_812275 ?auto_812276 ?auto_812277 ?auto_812278 ?auto_812279 ?auto_812280 ?auto_812281 ?auto_812282 ?auto_812283 ?auto_812284 )
      ( MAKE-12PILE ?auto_812274 ?auto_812275 ?auto_812276 ?auto_812277 ?auto_812278 ?auto_812279 ?auto_812280 ?auto_812281 ?auto_812282 ?auto_812283 ?auto_812284 ?auto_812285 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812324 - BLOCK
      ?auto_812325 - BLOCK
      ?auto_812326 - BLOCK
      ?auto_812327 - BLOCK
      ?auto_812328 - BLOCK
      ?auto_812329 - BLOCK
      ?auto_812330 - BLOCK
      ?auto_812331 - BLOCK
      ?auto_812332 - BLOCK
      ?auto_812333 - BLOCK
      ?auto_812334 - BLOCK
      ?auto_812335 - BLOCK
    )
    :vars
    (
      ?auto_812336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812335 ?auto_812336 ) ( ON-TABLE ?auto_812324 ) ( ON ?auto_812325 ?auto_812324 ) ( ON ?auto_812326 ?auto_812325 ) ( ON ?auto_812327 ?auto_812326 ) ( ON ?auto_812328 ?auto_812327 ) ( ON ?auto_812329 ?auto_812328 ) ( ON ?auto_812330 ?auto_812329 ) ( ON ?auto_812331 ?auto_812330 ) ( ON ?auto_812332 ?auto_812331 ) ( not ( = ?auto_812324 ?auto_812325 ) ) ( not ( = ?auto_812324 ?auto_812326 ) ) ( not ( = ?auto_812324 ?auto_812327 ) ) ( not ( = ?auto_812324 ?auto_812328 ) ) ( not ( = ?auto_812324 ?auto_812329 ) ) ( not ( = ?auto_812324 ?auto_812330 ) ) ( not ( = ?auto_812324 ?auto_812331 ) ) ( not ( = ?auto_812324 ?auto_812332 ) ) ( not ( = ?auto_812324 ?auto_812333 ) ) ( not ( = ?auto_812324 ?auto_812334 ) ) ( not ( = ?auto_812324 ?auto_812335 ) ) ( not ( = ?auto_812324 ?auto_812336 ) ) ( not ( = ?auto_812325 ?auto_812326 ) ) ( not ( = ?auto_812325 ?auto_812327 ) ) ( not ( = ?auto_812325 ?auto_812328 ) ) ( not ( = ?auto_812325 ?auto_812329 ) ) ( not ( = ?auto_812325 ?auto_812330 ) ) ( not ( = ?auto_812325 ?auto_812331 ) ) ( not ( = ?auto_812325 ?auto_812332 ) ) ( not ( = ?auto_812325 ?auto_812333 ) ) ( not ( = ?auto_812325 ?auto_812334 ) ) ( not ( = ?auto_812325 ?auto_812335 ) ) ( not ( = ?auto_812325 ?auto_812336 ) ) ( not ( = ?auto_812326 ?auto_812327 ) ) ( not ( = ?auto_812326 ?auto_812328 ) ) ( not ( = ?auto_812326 ?auto_812329 ) ) ( not ( = ?auto_812326 ?auto_812330 ) ) ( not ( = ?auto_812326 ?auto_812331 ) ) ( not ( = ?auto_812326 ?auto_812332 ) ) ( not ( = ?auto_812326 ?auto_812333 ) ) ( not ( = ?auto_812326 ?auto_812334 ) ) ( not ( = ?auto_812326 ?auto_812335 ) ) ( not ( = ?auto_812326 ?auto_812336 ) ) ( not ( = ?auto_812327 ?auto_812328 ) ) ( not ( = ?auto_812327 ?auto_812329 ) ) ( not ( = ?auto_812327 ?auto_812330 ) ) ( not ( = ?auto_812327 ?auto_812331 ) ) ( not ( = ?auto_812327 ?auto_812332 ) ) ( not ( = ?auto_812327 ?auto_812333 ) ) ( not ( = ?auto_812327 ?auto_812334 ) ) ( not ( = ?auto_812327 ?auto_812335 ) ) ( not ( = ?auto_812327 ?auto_812336 ) ) ( not ( = ?auto_812328 ?auto_812329 ) ) ( not ( = ?auto_812328 ?auto_812330 ) ) ( not ( = ?auto_812328 ?auto_812331 ) ) ( not ( = ?auto_812328 ?auto_812332 ) ) ( not ( = ?auto_812328 ?auto_812333 ) ) ( not ( = ?auto_812328 ?auto_812334 ) ) ( not ( = ?auto_812328 ?auto_812335 ) ) ( not ( = ?auto_812328 ?auto_812336 ) ) ( not ( = ?auto_812329 ?auto_812330 ) ) ( not ( = ?auto_812329 ?auto_812331 ) ) ( not ( = ?auto_812329 ?auto_812332 ) ) ( not ( = ?auto_812329 ?auto_812333 ) ) ( not ( = ?auto_812329 ?auto_812334 ) ) ( not ( = ?auto_812329 ?auto_812335 ) ) ( not ( = ?auto_812329 ?auto_812336 ) ) ( not ( = ?auto_812330 ?auto_812331 ) ) ( not ( = ?auto_812330 ?auto_812332 ) ) ( not ( = ?auto_812330 ?auto_812333 ) ) ( not ( = ?auto_812330 ?auto_812334 ) ) ( not ( = ?auto_812330 ?auto_812335 ) ) ( not ( = ?auto_812330 ?auto_812336 ) ) ( not ( = ?auto_812331 ?auto_812332 ) ) ( not ( = ?auto_812331 ?auto_812333 ) ) ( not ( = ?auto_812331 ?auto_812334 ) ) ( not ( = ?auto_812331 ?auto_812335 ) ) ( not ( = ?auto_812331 ?auto_812336 ) ) ( not ( = ?auto_812332 ?auto_812333 ) ) ( not ( = ?auto_812332 ?auto_812334 ) ) ( not ( = ?auto_812332 ?auto_812335 ) ) ( not ( = ?auto_812332 ?auto_812336 ) ) ( not ( = ?auto_812333 ?auto_812334 ) ) ( not ( = ?auto_812333 ?auto_812335 ) ) ( not ( = ?auto_812333 ?auto_812336 ) ) ( not ( = ?auto_812334 ?auto_812335 ) ) ( not ( = ?auto_812334 ?auto_812336 ) ) ( not ( = ?auto_812335 ?auto_812336 ) ) ( ON ?auto_812334 ?auto_812335 ) ( CLEAR ?auto_812332 ) ( ON ?auto_812333 ?auto_812334 ) ( CLEAR ?auto_812333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_812324 ?auto_812325 ?auto_812326 ?auto_812327 ?auto_812328 ?auto_812329 ?auto_812330 ?auto_812331 ?auto_812332 ?auto_812333 )
      ( MAKE-12PILE ?auto_812324 ?auto_812325 ?auto_812326 ?auto_812327 ?auto_812328 ?auto_812329 ?auto_812330 ?auto_812331 ?auto_812332 ?auto_812333 ?auto_812334 ?auto_812335 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812374 - BLOCK
      ?auto_812375 - BLOCK
      ?auto_812376 - BLOCK
      ?auto_812377 - BLOCK
      ?auto_812378 - BLOCK
      ?auto_812379 - BLOCK
      ?auto_812380 - BLOCK
      ?auto_812381 - BLOCK
      ?auto_812382 - BLOCK
      ?auto_812383 - BLOCK
      ?auto_812384 - BLOCK
      ?auto_812385 - BLOCK
    )
    :vars
    (
      ?auto_812386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812385 ?auto_812386 ) ( ON-TABLE ?auto_812374 ) ( ON ?auto_812375 ?auto_812374 ) ( ON ?auto_812376 ?auto_812375 ) ( ON ?auto_812377 ?auto_812376 ) ( ON ?auto_812378 ?auto_812377 ) ( ON ?auto_812379 ?auto_812378 ) ( ON ?auto_812380 ?auto_812379 ) ( ON ?auto_812381 ?auto_812380 ) ( not ( = ?auto_812374 ?auto_812375 ) ) ( not ( = ?auto_812374 ?auto_812376 ) ) ( not ( = ?auto_812374 ?auto_812377 ) ) ( not ( = ?auto_812374 ?auto_812378 ) ) ( not ( = ?auto_812374 ?auto_812379 ) ) ( not ( = ?auto_812374 ?auto_812380 ) ) ( not ( = ?auto_812374 ?auto_812381 ) ) ( not ( = ?auto_812374 ?auto_812382 ) ) ( not ( = ?auto_812374 ?auto_812383 ) ) ( not ( = ?auto_812374 ?auto_812384 ) ) ( not ( = ?auto_812374 ?auto_812385 ) ) ( not ( = ?auto_812374 ?auto_812386 ) ) ( not ( = ?auto_812375 ?auto_812376 ) ) ( not ( = ?auto_812375 ?auto_812377 ) ) ( not ( = ?auto_812375 ?auto_812378 ) ) ( not ( = ?auto_812375 ?auto_812379 ) ) ( not ( = ?auto_812375 ?auto_812380 ) ) ( not ( = ?auto_812375 ?auto_812381 ) ) ( not ( = ?auto_812375 ?auto_812382 ) ) ( not ( = ?auto_812375 ?auto_812383 ) ) ( not ( = ?auto_812375 ?auto_812384 ) ) ( not ( = ?auto_812375 ?auto_812385 ) ) ( not ( = ?auto_812375 ?auto_812386 ) ) ( not ( = ?auto_812376 ?auto_812377 ) ) ( not ( = ?auto_812376 ?auto_812378 ) ) ( not ( = ?auto_812376 ?auto_812379 ) ) ( not ( = ?auto_812376 ?auto_812380 ) ) ( not ( = ?auto_812376 ?auto_812381 ) ) ( not ( = ?auto_812376 ?auto_812382 ) ) ( not ( = ?auto_812376 ?auto_812383 ) ) ( not ( = ?auto_812376 ?auto_812384 ) ) ( not ( = ?auto_812376 ?auto_812385 ) ) ( not ( = ?auto_812376 ?auto_812386 ) ) ( not ( = ?auto_812377 ?auto_812378 ) ) ( not ( = ?auto_812377 ?auto_812379 ) ) ( not ( = ?auto_812377 ?auto_812380 ) ) ( not ( = ?auto_812377 ?auto_812381 ) ) ( not ( = ?auto_812377 ?auto_812382 ) ) ( not ( = ?auto_812377 ?auto_812383 ) ) ( not ( = ?auto_812377 ?auto_812384 ) ) ( not ( = ?auto_812377 ?auto_812385 ) ) ( not ( = ?auto_812377 ?auto_812386 ) ) ( not ( = ?auto_812378 ?auto_812379 ) ) ( not ( = ?auto_812378 ?auto_812380 ) ) ( not ( = ?auto_812378 ?auto_812381 ) ) ( not ( = ?auto_812378 ?auto_812382 ) ) ( not ( = ?auto_812378 ?auto_812383 ) ) ( not ( = ?auto_812378 ?auto_812384 ) ) ( not ( = ?auto_812378 ?auto_812385 ) ) ( not ( = ?auto_812378 ?auto_812386 ) ) ( not ( = ?auto_812379 ?auto_812380 ) ) ( not ( = ?auto_812379 ?auto_812381 ) ) ( not ( = ?auto_812379 ?auto_812382 ) ) ( not ( = ?auto_812379 ?auto_812383 ) ) ( not ( = ?auto_812379 ?auto_812384 ) ) ( not ( = ?auto_812379 ?auto_812385 ) ) ( not ( = ?auto_812379 ?auto_812386 ) ) ( not ( = ?auto_812380 ?auto_812381 ) ) ( not ( = ?auto_812380 ?auto_812382 ) ) ( not ( = ?auto_812380 ?auto_812383 ) ) ( not ( = ?auto_812380 ?auto_812384 ) ) ( not ( = ?auto_812380 ?auto_812385 ) ) ( not ( = ?auto_812380 ?auto_812386 ) ) ( not ( = ?auto_812381 ?auto_812382 ) ) ( not ( = ?auto_812381 ?auto_812383 ) ) ( not ( = ?auto_812381 ?auto_812384 ) ) ( not ( = ?auto_812381 ?auto_812385 ) ) ( not ( = ?auto_812381 ?auto_812386 ) ) ( not ( = ?auto_812382 ?auto_812383 ) ) ( not ( = ?auto_812382 ?auto_812384 ) ) ( not ( = ?auto_812382 ?auto_812385 ) ) ( not ( = ?auto_812382 ?auto_812386 ) ) ( not ( = ?auto_812383 ?auto_812384 ) ) ( not ( = ?auto_812383 ?auto_812385 ) ) ( not ( = ?auto_812383 ?auto_812386 ) ) ( not ( = ?auto_812384 ?auto_812385 ) ) ( not ( = ?auto_812384 ?auto_812386 ) ) ( not ( = ?auto_812385 ?auto_812386 ) ) ( ON ?auto_812384 ?auto_812385 ) ( ON ?auto_812383 ?auto_812384 ) ( CLEAR ?auto_812381 ) ( ON ?auto_812382 ?auto_812383 ) ( CLEAR ?auto_812382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_812374 ?auto_812375 ?auto_812376 ?auto_812377 ?auto_812378 ?auto_812379 ?auto_812380 ?auto_812381 ?auto_812382 )
      ( MAKE-12PILE ?auto_812374 ?auto_812375 ?auto_812376 ?auto_812377 ?auto_812378 ?auto_812379 ?auto_812380 ?auto_812381 ?auto_812382 ?auto_812383 ?auto_812384 ?auto_812385 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812424 - BLOCK
      ?auto_812425 - BLOCK
      ?auto_812426 - BLOCK
      ?auto_812427 - BLOCK
      ?auto_812428 - BLOCK
      ?auto_812429 - BLOCK
      ?auto_812430 - BLOCK
      ?auto_812431 - BLOCK
      ?auto_812432 - BLOCK
      ?auto_812433 - BLOCK
      ?auto_812434 - BLOCK
      ?auto_812435 - BLOCK
    )
    :vars
    (
      ?auto_812436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812435 ?auto_812436 ) ( ON-TABLE ?auto_812424 ) ( ON ?auto_812425 ?auto_812424 ) ( ON ?auto_812426 ?auto_812425 ) ( ON ?auto_812427 ?auto_812426 ) ( ON ?auto_812428 ?auto_812427 ) ( ON ?auto_812429 ?auto_812428 ) ( ON ?auto_812430 ?auto_812429 ) ( not ( = ?auto_812424 ?auto_812425 ) ) ( not ( = ?auto_812424 ?auto_812426 ) ) ( not ( = ?auto_812424 ?auto_812427 ) ) ( not ( = ?auto_812424 ?auto_812428 ) ) ( not ( = ?auto_812424 ?auto_812429 ) ) ( not ( = ?auto_812424 ?auto_812430 ) ) ( not ( = ?auto_812424 ?auto_812431 ) ) ( not ( = ?auto_812424 ?auto_812432 ) ) ( not ( = ?auto_812424 ?auto_812433 ) ) ( not ( = ?auto_812424 ?auto_812434 ) ) ( not ( = ?auto_812424 ?auto_812435 ) ) ( not ( = ?auto_812424 ?auto_812436 ) ) ( not ( = ?auto_812425 ?auto_812426 ) ) ( not ( = ?auto_812425 ?auto_812427 ) ) ( not ( = ?auto_812425 ?auto_812428 ) ) ( not ( = ?auto_812425 ?auto_812429 ) ) ( not ( = ?auto_812425 ?auto_812430 ) ) ( not ( = ?auto_812425 ?auto_812431 ) ) ( not ( = ?auto_812425 ?auto_812432 ) ) ( not ( = ?auto_812425 ?auto_812433 ) ) ( not ( = ?auto_812425 ?auto_812434 ) ) ( not ( = ?auto_812425 ?auto_812435 ) ) ( not ( = ?auto_812425 ?auto_812436 ) ) ( not ( = ?auto_812426 ?auto_812427 ) ) ( not ( = ?auto_812426 ?auto_812428 ) ) ( not ( = ?auto_812426 ?auto_812429 ) ) ( not ( = ?auto_812426 ?auto_812430 ) ) ( not ( = ?auto_812426 ?auto_812431 ) ) ( not ( = ?auto_812426 ?auto_812432 ) ) ( not ( = ?auto_812426 ?auto_812433 ) ) ( not ( = ?auto_812426 ?auto_812434 ) ) ( not ( = ?auto_812426 ?auto_812435 ) ) ( not ( = ?auto_812426 ?auto_812436 ) ) ( not ( = ?auto_812427 ?auto_812428 ) ) ( not ( = ?auto_812427 ?auto_812429 ) ) ( not ( = ?auto_812427 ?auto_812430 ) ) ( not ( = ?auto_812427 ?auto_812431 ) ) ( not ( = ?auto_812427 ?auto_812432 ) ) ( not ( = ?auto_812427 ?auto_812433 ) ) ( not ( = ?auto_812427 ?auto_812434 ) ) ( not ( = ?auto_812427 ?auto_812435 ) ) ( not ( = ?auto_812427 ?auto_812436 ) ) ( not ( = ?auto_812428 ?auto_812429 ) ) ( not ( = ?auto_812428 ?auto_812430 ) ) ( not ( = ?auto_812428 ?auto_812431 ) ) ( not ( = ?auto_812428 ?auto_812432 ) ) ( not ( = ?auto_812428 ?auto_812433 ) ) ( not ( = ?auto_812428 ?auto_812434 ) ) ( not ( = ?auto_812428 ?auto_812435 ) ) ( not ( = ?auto_812428 ?auto_812436 ) ) ( not ( = ?auto_812429 ?auto_812430 ) ) ( not ( = ?auto_812429 ?auto_812431 ) ) ( not ( = ?auto_812429 ?auto_812432 ) ) ( not ( = ?auto_812429 ?auto_812433 ) ) ( not ( = ?auto_812429 ?auto_812434 ) ) ( not ( = ?auto_812429 ?auto_812435 ) ) ( not ( = ?auto_812429 ?auto_812436 ) ) ( not ( = ?auto_812430 ?auto_812431 ) ) ( not ( = ?auto_812430 ?auto_812432 ) ) ( not ( = ?auto_812430 ?auto_812433 ) ) ( not ( = ?auto_812430 ?auto_812434 ) ) ( not ( = ?auto_812430 ?auto_812435 ) ) ( not ( = ?auto_812430 ?auto_812436 ) ) ( not ( = ?auto_812431 ?auto_812432 ) ) ( not ( = ?auto_812431 ?auto_812433 ) ) ( not ( = ?auto_812431 ?auto_812434 ) ) ( not ( = ?auto_812431 ?auto_812435 ) ) ( not ( = ?auto_812431 ?auto_812436 ) ) ( not ( = ?auto_812432 ?auto_812433 ) ) ( not ( = ?auto_812432 ?auto_812434 ) ) ( not ( = ?auto_812432 ?auto_812435 ) ) ( not ( = ?auto_812432 ?auto_812436 ) ) ( not ( = ?auto_812433 ?auto_812434 ) ) ( not ( = ?auto_812433 ?auto_812435 ) ) ( not ( = ?auto_812433 ?auto_812436 ) ) ( not ( = ?auto_812434 ?auto_812435 ) ) ( not ( = ?auto_812434 ?auto_812436 ) ) ( not ( = ?auto_812435 ?auto_812436 ) ) ( ON ?auto_812434 ?auto_812435 ) ( ON ?auto_812433 ?auto_812434 ) ( ON ?auto_812432 ?auto_812433 ) ( CLEAR ?auto_812430 ) ( ON ?auto_812431 ?auto_812432 ) ( CLEAR ?auto_812431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_812424 ?auto_812425 ?auto_812426 ?auto_812427 ?auto_812428 ?auto_812429 ?auto_812430 ?auto_812431 )
      ( MAKE-12PILE ?auto_812424 ?auto_812425 ?auto_812426 ?auto_812427 ?auto_812428 ?auto_812429 ?auto_812430 ?auto_812431 ?auto_812432 ?auto_812433 ?auto_812434 ?auto_812435 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812474 - BLOCK
      ?auto_812475 - BLOCK
      ?auto_812476 - BLOCK
      ?auto_812477 - BLOCK
      ?auto_812478 - BLOCK
      ?auto_812479 - BLOCK
      ?auto_812480 - BLOCK
      ?auto_812481 - BLOCK
      ?auto_812482 - BLOCK
      ?auto_812483 - BLOCK
      ?auto_812484 - BLOCK
      ?auto_812485 - BLOCK
    )
    :vars
    (
      ?auto_812486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812485 ?auto_812486 ) ( ON-TABLE ?auto_812474 ) ( ON ?auto_812475 ?auto_812474 ) ( ON ?auto_812476 ?auto_812475 ) ( ON ?auto_812477 ?auto_812476 ) ( ON ?auto_812478 ?auto_812477 ) ( ON ?auto_812479 ?auto_812478 ) ( not ( = ?auto_812474 ?auto_812475 ) ) ( not ( = ?auto_812474 ?auto_812476 ) ) ( not ( = ?auto_812474 ?auto_812477 ) ) ( not ( = ?auto_812474 ?auto_812478 ) ) ( not ( = ?auto_812474 ?auto_812479 ) ) ( not ( = ?auto_812474 ?auto_812480 ) ) ( not ( = ?auto_812474 ?auto_812481 ) ) ( not ( = ?auto_812474 ?auto_812482 ) ) ( not ( = ?auto_812474 ?auto_812483 ) ) ( not ( = ?auto_812474 ?auto_812484 ) ) ( not ( = ?auto_812474 ?auto_812485 ) ) ( not ( = ?auto_812474 ?auto_812486 ) ) ( not ( = ?auto_812475 ?auto_812476 ) ) ( not ( = ?auto_812475 ?auto_812477 ) ) ( not ( = ?auto_812475 ?auto_812478 ) ) ( not ( = ?auto_812475 ?auto_812479 ) ) ( not ( = ?auto_812475 ?auto_812480 ) ) ( not ( = ?auto_812475 ?auto_812481 ) ) ( not ( = ?auto_812475 ?auto_812482 ) ) ( not ( = ?auto_812475 ?auto_812483 ) ) ( not ( = ?auto_812475 ?auto_812484 ) ) ( not ( = ?auto_812475 ?auto_812485 ) ) ( not ( = ?auto_812475 ?auto_812486 ) ) ( not ( = ?auto_812476 ?auto_812477 ) ) ( not ( = ?auto_812476 ?auto_812478 ) ) ( not ( = ?auto_812476 ?auto_812479 ) ) ( not ( = ?auto_812476 ?auto_812480 ) ) ( not ( = ?auto_812476 ?auto_812481 ) ) ( not ( = ?auto_812476 ?auto_812482 ) ) ( not ( = ?auto_812476 ?auto_812483 ) ) ( not ( = ?auto_812476 ?auto_812484 ) ) ( not ( = ?auto_812476 ?auto_812485 ) ) ( not ( = ?auto_812476 ?auto_812486 ) ) ( not ( = ?auto_812477 ?auto_812478 ) ) ( not ( = ?auto_812477 ?auto_812479 ) ) ( not ( = ?auto_812477 ?auto_812480 ) ) ( not ( = ?auto_812477 ?auto_812481 ) ) ( not ( = ?auto_812477 ?auto_812482 ) ) ( not ( = ?auto_812477 ?auto_812483 ) ) ( not ( = ?auto_812477 ?auto_812484 ) ) ( not ( = ?auto_812477 ?auto_812485 ) ) ( not ( = ?auto_812477 ?auto_812486 ) ) ( not ( = ?auto_812478 ?auto_812479 ) ) ( not ( = ?auto_812478 ?auto_812480 ) ) ( not ( = ?auto_812478 ?auto_812481 ) ) ( not ( = ?auto_812478 ?auto_812482 ) ) ( not ( = ?auto_812478 ?auto_812483 ) ) ( not ( = ?auto_812478 ?auto_812484 ) ) ( not ( = ?auto_812478 ?auto_812485 ) ) ( not ( = ?auto_812478 ?auto_812486 ) ) ( not ( = ?auto_812479 ?auto_812480 ) ) ( not ( = ?auto_812479 ?auto_812481 ) ) ( not ( = ?auto_812479 ?auto_812482 ) ) ( not ( = ?auto_812479 ?auto_812483 ) ) ( not ( = ?auto_812479 ?auto_812484 ) ) ( not ( = ?auto_812479 ?auto_812485 ) ) ( not ( = ?auto_812479 ?auto_812486 ) ) ( not ( = ?auto_812480 ?auto_812481 ) ) ( not ( = ?auto_812480 ?auto_812482 ) ) ( not ( = ?auto_812480 ?auto_812483 ) ) ( not ( = ?auto_812480 ?auto_812484 ) ) ( not ( = ?auto_812480 ?auto_812485 ) ) ( not ( = ?auto_812480 ?auto_812486 ) ) ( not ( = ?auto_812481 ?auto_812482 ) ) ( not ( = ?auto_812481 ?auto_812483 ) ) ( not ( = ?auto_812481 ?auto_812484 ) ) ( not ( = ?auto_812481 ?auto_812485 ) ) ( not ( = ?auto_812481 ?auto_812486 ) ) ( not ( = ?auto_812482 ?auto_812483 ) ) ( not ( = ?auto_812482 ?auto_812484 ) ) ( not ( = ?auto_812482 ?auto_812485 ) ) ( not ( = ?auto_812482 ?auto_812486 ) ) ( not ( = ?auto_812483 ?auto_812484 ) ) ( not ( = ?auto_812483 ?auto_812485 ) ) ( not ( = ?auto_812483 ?auto_812486 ) ) ( not ( = ?auto_812484 ?auto_812485 ) ) ( not ( = ?auto_812484 ?auto_812486 ) ) ( not ( = ?auto_812485 ?auto_812486 ) ) ( ON ?auto_812484 ?auto_812485 ) ( ON ?auto_812483 ?auto_812484 ) ( ON ?auto_812482 ?auto_812483 ) ( ON ?auto_812481 ?auto_812482 ) ( CLEAR ?auto_812479 ) ( ON ?auto_812480 ?auto_812481 ) ( CLEAR ?auto_812480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_812474 ?auto_812475 ?auto_812476 ?auto_812477 ?auto_812478 ?auto_812479 ?auto_812480 )
      ( MAKE-12PILE ?auto_812474 ?auto_812475 ?auto_812476 ?auto_812477 ?auto_812478 ?auto_812479 ?auto_812480 ?auto_812481 ?auto_812482 ?auto_812483 ?auto_812484 ?auto_812485 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812524 - BLOCK
      ?auto_812525 - BLOCK
      ?auto_812526 - BLOCK
      ?auto_812527 - BLOCK
      ?auto_812528 - BLOCK
      ?auto_812529 - BLOCK
      ?auto_812530 - BLOCK
      ?auto_812531 - BLOCK
      ?auto_812532 - BLOCK
      ?auto_812533 - BLOCK
      ?auto_812534 - BLOCK
      ?auto_812535 - BLOCK
    )
    :vars
    (
      ?auto_812536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812535 ?auto_812536 ) ( ON-TABLE ?auto_812524 ) ( ON ?auto_812525 ?auto_812524 ) ( ON ?auto_812526 ?auto_812525 ) ( ON ?auto_812527 ?auto_812526 ) ( ON ?auto_812528 ?auto_812527 ) ( not ( = ?auto_812524 ?auto_812525 ) ) ( not ( = ?auto_812524 ?auto_812526 ) ) ( not ( = ?auto_812524 ?auto_812527 ) ) ( not ( = ?auto_812524 ?auto_812528 ) ) ( not ( = ?auto_812524 ?auto_812529 ) ) ( not ( = ?auto_812524 ?auto_812530 ) ) ( not ( = ?auto_812524 ?auto_812531 ) ) ( not ( = ?auto_812524 ?auto_812532 ) ) ( not ( = ?auto_812524 ?auto_812533 ) ) ( not ( = ?auto_812524 ?auto_812534 ) ) ( not ( = ?auto_812524 ?auto_812535 ) ) ( not ( = ?auto_812524 ?auto_812536 ) ) ( not ( = ?auto_812525 ?auto_812526 ) ) ( not ( = ?auto_812525 ?auto_812527 ) ) ( not ( = ?auto_812525 ?auto_812528 ) ) ( not ( = ?auto_812525 ?auto_812529 ) ) ( not ( = ?auto_812525 ?auto_812530 ) ) ( not ( = ?auto_812525 ?auto_812531 ) ) ( not ( = ?auto_812525 ?auto_812532 ) ) ( not ( = ?auto_812525 ?auto_812533 ) ) ( not ( = ?auto_812525 ?auto_812534 ) ) ( not ( = ?auto_812525 ?auto_812535 ) ) ( not ( = ?auto_812525 ?auto_812536 ) ) ( not ( = ?auto_812526 ?auto_812527 ) ) ( not ( = ?auto_812526 ?auto_812528 ) ) ( not ( = ?auto_812526 ?auto_812529 ) ) ( not ( = ?auto_812526 ?auto_812530 ) ) ( not ( = ?auto_812526 ?auto_812531 ) ) ( not ( = ?auto_812526 ?auto_812532 ) ) ( not ( = ?auto_812526 ?auto_812533 ) ) ( not ( = ?auto_812526 ?auto_812534 ) ) ( not ( = ?auto_812526 ?auto_812535 ) ) ( not ( = ?auto_812526 ?auto_812536 ) ) ( not ( = ?auto_812527 ?auto_812528 ) ) ( not ( = ?auto_812527 ?auto_812529 ) ) ( not ( = ?auto_812527 ?auto_812530 ) ) ( not ( = ?auto_812527 ?auto_812531 ) ) ( not ( = ?auto_812527 ?auto_812532 ) ) ( not ( = ?auto_812527 ?auto_812533 ) ) ( not ( = ?auto_812527 ?auto_812534 ) ) ( not ( = ?auto_812527 ?auto_812535 ) ) ( not ( = ?auto_812527 ?auto_812536 ) ) ( not ( = ?auto_812528 ?auto_812529 ) ) ( not ( = ?auto_812528 ?auto_812530 ) ) ( not ( = ?auto_812528 ?auto_812531 ) ) ( not ( = ?auto_812528 ?auto_812532 ) ) ( not ( = ?auto_812528 ?auto_812533 ) ) ( not ( = ?auto_812528 ?auto_812534 ) ) ( not ( = ?auto_812528 ?auto_812535 ) ) ( not ( = ?auto_812528 ?auto_812536 ) ) ( not ( = ?auto_812529 ?auto_812530 ) ) ( not ( = ?auto_812529 ?auto_812531 ) ) ( not ( = ?auto_812529 ?auto_812532 ) ) ( not ( = ?auto_812529 ?auto_812533 ) ) ( not ( = ?auto_812529 ?auto_812534 ) ) ( not ( = ?auto_812529 ?auto_812535 ) ) ( not ( = ?auto_812529 ?auto_812536 ) ) ( not ( = ?auto_812530 ?auto_812531 ) ) ( not ( = ?auto_812530 ?auto_812532 ) ) ( not ( = ?auto_812530 ?auto_812533 ) ) ( not ( = ?auto_812530 ?auto_812534 ) ) ( not ( = ?auto_812530 ?auto_812535 ) ) ( not ( = ?auto_812530 ?auto_812536 ) ) ( not ( = ?auto_812531 ?auto_812532 ) ) ( not ( = ?auto_812531 ?auto_812533 ) ) ( not ( = ?auto_812531 ?auto_812534 ) ) ( not ( = ?auto_812531 ?auto_812535 ) ) ( not ( = ?auto_812531 ?auto_812536 ) ) ( not ( = ?auto_812532 ?auto_812533 ) ) ( not ( = ?auto_812532 ?auto_812534 ) ) ( not ( = ?auto_812532 ?auto_812535 ) ) ( not ( = ?auto_812532 ?auto_812536 ) ) ( not ( = ?auto_812533 ?auto_812534 ) ) ( not ( = ?auto_812533 ?auto_812535 ) ) ( not ( = ?auto_812533 ?auto_812536 ) ) ( not ( = ?auto_812534 ?auto_812535 ) ) ( not ( = ?auto_812534 ?auto_812536 ) ) ( not ( = ?auto_812535 ?auto_812536 ) ) ( ON ?auto_812534 ?auto_812535 ) ( ON ?auto_812533 ?auto_812534 ) ( ON ?auto_812532 ?auto_812533 ) ( ON ?auto_812531 ?auto_812532 ) ( ON ?auto_812530 ?auto_812531 ) ( CLEAR ?auto_812528 ) ( ON ?auto_812529 ?auto_812530 ) ( CLEAR ?auto_812529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_812524 ?auto_812525 ?auto_812526 ?auto_812527 ?auto_812528 ?auto_812529 )
      ( MAKE-12PILE ?auto_812524 ?auto_812525 ?auto_812526 ?auto_812527 ?auto_812528 ?auto_812529 ?auto_812530 ?auto_812531 ?auto_812532 ?auto_812533 ?auto_812534 ?auto_812535 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812574 - BLOCK
      ?auto_812575 - BLOCK
      ?auto_812576 - BLOCK
      ?auto_812577 - BLOCK
      ?auto_812578 - BLOCK
      ?auto_812579 - BLOCK
      ?auto_812580 - BLOCK
      ?auto_812581 - BLOCK
      ?auto_812582 - BLOCK
      ?auto_812583 - BLOCK
      ?auto_812584 - BLOCK
      ?auto_812585 - BLOCK
    )
    :vars
    (
      ?auto_812586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812585 ?auto_812586 ) ( ON-TABLE ?auto_812574 ) ( ON ?auto_812575 ?auto_812574 ) ( ON ?auto_812576 ?auto_812575 ) ( ON ?auto_812577 ?auto_812576 ) ( not ( = ?auto_812574 ?auto_812575 ) ) ( not ( = ?auto_812574 ?auto_812576 ) ) ( not ( = ?auto_812574 ?auto_812577 ) ) ( not ( = ?auto_812574 ?auto_812578 ) ) ( not ( = ?auto_812574 ?auto_812579 ) ) ( not ( = ?auto_812574 ?auto_812580 ) ) ( not ( = ?auto_812574 ?auto_812581 ) ) ( not ( = ?auto_812574 ?auto_812582 ) ) ( not ( = ?auto_812574 ?auto_812583 ) ) ( not ( = ?auto_812574 ?auto_812584 ) ) ( not ( = ?auto_812574 ?auto_812585 ) ) ( not ( = ?auto_812574 ?auto_812586 ) ) ( not ( = ?auto_812575 ?auto_812576 ) ) ( not ( = ?auto_812575 ?auto_812577 ) ) ( not ( = ?auto_812575 ?auto_812578 ) ) ( not ( = ?auto_812575 ?auto_812579 ) ) ( not ( = ?auto_812575 ?auto_812580 ) ) ( not ( = ?auto_812575 ?auto_812581 ) ) ( not ( = ?auto_812575 ?auto_812582 ) ) ( not ( = ?auto_812575 ?auto_812583 ) ) ( not ( = ?auto_812575 ?auto_812584 ) ) ( not ( = ?auto_812575 ?auto_812585 ) ) ( not ( = ?auto_812575 ?auto_812586 ) ) ( not ( = ?auto_812576 ?auto_812577 ) ) ( not ( = ?auto_812576 ?auto_812578 ) ) ( not ( = ?auto_812576 ?auto_812579 ) ) ( not ( = ?auto_812576 ?auto_812580 ) ) ( not ( = ?auto_812576 ?auto_812581 ) ) ( not ( = ?auto_812576 ?auto_812582 ) ) ( not ( = ?auto_812576 ?auto_812583 ) ) ( not ( = ?auto_812576 ?auto_812584 ) ) ( not ( = ?auto_812576 ?auto_812585 ) ) ( not ( = ?auto_812576 ?auto_812586 ) ) ( not ( = ?auto_812577 ?auto_812578 ) ) ( not ( = ?auto_812577 ?auto_812579 ) ) ( not ( = ?auto_812577 ?auto_812580 ) ) ( not ( = ?auto_812577 ?auto_812581 ) ) ( not ( = ?auto_812577 ?auto_812582 ) ) ( not ( = ?auto_812577 ?auto_812583 ) ) ( not ( = ?auto_812577 ?auto_812584 ) ) ( not ( = ?auto_812577 ?auto_812585 ) ) ( not ( = ?auto_812577 ?auto_812586 ) ) ( not ( = ?auto_812578 ?auto_812579 ) ) ( not ( = ?auto_812578 ?auto_812580 ) ) ( not ( = ?auto_812578 ?auto_812581 ) ) ( not ( = ?auto_812578 ?auto_812582 ) ) ( not ( = ?auto_812578 ?auto_812583 ) ) ( not ( = ?auto_812578 ?auto_812584 ) ) ( not ( = ?auto_812578 ?auto_812585 ) ) ( not ( = ?auto_812578 ?auto_812586 ) ) ( not ( = ?auto_812579 ?auto_812580 ) ) ( not ( = ?auto_812579 ?auto_812581 ) ) ( not ( = ?auto_812579 ?auto_812582 ) ) ( not ( = ?auto_812579 ?auto_812583 ) ) ( not ( = ?auto_812579 ?auto_812584 ) ) ( not ( = ?auto_812579 ?auto_812585 ) ) ( not ( = ?auto_812579 ?auto_812586 ) ) ( not ( = ?auto_812580 ?auto_812581 ) ) ( not ( = ?auto_812580 ?auto_812582 ) ) ( not ( = ?auto_812580 ?auto_812583 ) ) ( not ( = ?auto_812580 ?auto_812584 ) ) ( not ( = ?auto_812580 ?auto_812585 ) ) ( not ( = ?auto_812580 ?auto_812586 ) ) ( not ( = ?auto_812581 ?auto_812582 ) ) ( not ( = ?auto_812581 ?auto_812583 ) ) ( not ( = ?auto_812581 ?auto_812584 ) ) ( not ( = ?auto_812581 ?auto_812585 ) ) ( not ( = ?auto_812581 ?auto_812586 ) ) ( not ( = ?auto_812582 ?auto_812583 ) ) ( not ( = ?auto_812582 ?auto_812584 ) ) ( not ( = ?auto_812582 ?auto_812585 ) ) ( not ( = ?auto_812582 ?auto_812586 ) ) ( not ( = ?auto_812583 ?auto_812584 ) ) ( not ( = ?auto_812583 ?auto_812585 ) ) ( not ( = ?auto_812583 ?auto_812586 ) ) ( not ( = ?auto_812584 ?auto_812585 ) ) ( not ( = ?auto_812584 ?auto_812586 ) ) ( not ( = ?auto_812585 ?auto_812586 ) ) ( ON ?auto_812584 ?auto_812585 ) ( ON ?auto_812583 ?auto_812584 ) ( ON ?auto_812582 ?auto_812583 ) ( ON ?auto_812581 ?auto_812582 ) ( ON ?auto_812580 ?auto_812581 ) ( ON ?auto_812579 ?auto_812580 ) ( CLEAR ?auto_812577 ) ( ON ?auto_812578 ?auto_812579 ) ( CLEAR ?auto_812578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_812574 ?auto_812575 ?auto_812576 ?auto_812577 ?auto_812578 )
      ( MAKE-12PILE ?auto_812574 ?auto_812575 ?auto_812576 ?auto_812577 ?auto_812578 ?auto_812579 ?auto_812580 ?auto_812581 ?auto_812582 ?auto_812583 ?auto_812584 ?auto_812585 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812624 - BLOCK
      ?auto_812625 - BLOCK
      ?auto_812626 - BLOCK
      ?auto_812627 - BLOCK
      ?auto_812628 - BLOCK
      ?auto_812629 - BLOCK
      ?auto_812630 - BLOCK
      ?auto_812631 - BLOCK
      ?auto_812632 - BLOCK
      ?auto_812633 - BLOCK
      ?auto_812634 - BLOCK
      ?auto_812635 - BLOCK
    )
    :vars
    (
      ?auto_812636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812635 ?auto_812636 ) ( ON-TABLE ?auto_812624 ) ( ON ?auto_812625 ?auto_812624 ) ( ON ?auto_812626 ?auto_812625 ) ( not ( = ?auto_812624 ?auto_812625 ) ) ( not ( = ?auto_812624 ?auto_812626 ) ) ( not ( = ?auto_812624 ?auto_812627 ) ) ( not ( = ?auto_812624 ?auto_812628 ) ) ( not ( = ?auto_812624 ?auto_812629 ) ) ( not ( = ?auto_812624 ?auto_812630 ) ) ( not ( = ?auto_812624 ?auto_812631 ) ) ( not ( = ?auto_812624 ?auto_812632 ) ) ( not ( = ?auto_812624 ?auto_812633 ) ) ( not ( = ?auto_812624 ?auto_812634 ) ) ( not ( = ?auto_812624 ?auto_812635 ) ) ( not ( = ?auto_812624 ?auto_812636 ) ) ( not ( = ?auto_812625 ?auto_812626 ) ) ( not ( = ?auto_812625 ?auto_812627 ) ) ( not ( = ?auto_812625 ?auto_812628 ) ) ( not ( = ?auto_812625 ?auto_812629 ) ) ( not ( = ?auto_812625 ?auto_812630 ) ) ( not ( = ?auto_812625 ?auto_812631 ) ) ( not ( = ?auto_812625 ?auto_812632 ) ) ( not ( = ?auto_812625 ?auto_812633 ) ) ( not ( = ?auto_812625 ?auto_812634 ) ) ( not ( = ?auto_812625 ?auto_812635 ) ) ( not ( = ?auto_812625 ?auto_812636 ) ) ( not ( = ?auto_812626 ?auto_812627 ) ) ( not ( = ?auto_812626 ?auto_812628 ) ) ( not ( = ?auto_812626 ?auto_812629 ) ) ( not ( = ?auto_812626 ?auto_812630 ) ) ( not ( = ?auto_812626 ?auto_812631 ) ) ( not ( = ?auto_812626 ?auto_812632 ) ) ( not ( = ?auto_812626 ?auto_812633 ) ) ( not ( = ?auto_812626 ?auto_812634 ) ) ( not ( = ?auto_812626 ?auto_812635 ) ) ( not ( = ?auto_812626 ?auto_812636 ) ) ( not ( = ?auto_812627 ?auto_812628 ) ) ( not ( = ?auto_812627 ?auto_812629 ) ) ( not ( = ?auto_812627 ?auto_812630 ) ) ( not ( = ?auto_812627 ?auto_812631 ) ) ( not ( = ?auto_812627 ?auto_812632 ) ) ( not ( = ?auto_812627 ?auto_812633 ) ) ( not ( = ?auto_812627 ?auto_812634 ) ) ( not ( = ?auto_812627 ?auto_812635 ) ) ( not ( = ?auto_812627 ?auto_812636 ) ) ( not ( = ?auto_812628 ?auto_812629 ) ) ( not ( = ?auto_812628 ?auto_812630 ) ) ( not ( = ?auto_812628 ?auto_812631 ) ) ( not ( = ?auto_812628 ?auto_812632 ) ) ( not ( = ?auto_812628 ?auto_812633 ) ) ( not ( = ?auto_812628 ?auto_812634 ) ) ( not ( = ?auto_812628 ?auto_812635 ) ) ( not ( = ?auto_812628 ?auto_812636 ) ) ( not ( = ?auto_812629 ?auto_812630 ) ) ( not ( = ?auto_812629 ?auto_812631 ) ) ( not ( = ?auto_812629 ?auto_812632 ) ) ( not ( = ?auto_812629 ?auto_812633 ) ) ( not ( = ?auto_812629 ?auto_812634 ) ) ( not ( = ?auto_812629 ?auto_812635 ) ) ( not ( = ?auto_812629 ?auto_812636 ) ) ( not ( = ?auto_812630 ?auto_812631 ) ) ( not ( = ?auto_812630 ?auto_812632 ) ) ( not ( = ?auto_812630 ?auto_812633 ) ) ( not ( = ?auto_812630 ?auto_812634 ) ) ( not ( = ?auto_812630 ?auto_812635 ) ) ( not ( = ?auto_812630 ?auto_812636 ) ) ( not ( = ?auto_812631 ?auto_812632 ) ) ( not ( = ?auto_812631 ?auto_812633 ) ) ( not ( = ?auto_812631 ?auto_812634 ) ) ( not ( = ?auto_812631 ?auto_812635 ) ) ( not ( = ?auto_812631 ?auto_812636 ) ) ( not ( = ?auto_812632 ?auto_812633 ) ) ( not ( = ?auto_812632 ?auto_812634 ) ) ( not ( = ?auto_812632 ?auto_812635 ) ) ( not ( = ?auto_812632 ?auto_812636 ) ) ( not ( = ?auto_812633 ?auto_812634 ) ) ( not ( = ?auto_812633 ?auto_812635 ) ) ( not ( = ?auto_812633 ?auto_812636 ) ) ( not ( = ?auto_812634 ?auto_812635 ) ) ( not ( = ?auto_812634 ?auto_812636 ) ) ( not ( = ?auto_812635 ?auto_812636 ) ) ( ON ?auto_812634 ?auto_812635 ) ( ON ?auto_812633 ?auto_812634 ) ( ON ?auto_812632 ?auto_812633 ) ( ON ?auto_812631 ?auto_812632 ) ( ON ?auto_812630 ?auto_812631 ) ( ON ?auto_812629 ?auto_812630 ) ( ON ?auto_812628 ?auto_812629 ) ( CLEAR ?auto_812626 ) ( ON ?auto_812627 ?auto_812628 ) ( CLEAR ?auto_812627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_812624 ?auto_812625 ?auto_812626 ?auto_812627 )
      ( MAKE-12PILE ?auto_812624 ?auto_812625 ?auto_812626 ?auto_812627 ?auto_812628 ?auto_812629 ?auto_812630 ?auto_812631 ?auto_812632 ?auto_812633 ?auto_812634 ?auto_812635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812674 - BLOCK
      ?auto_812675 - BLOCK
      ?auto_812676 - BLOCK
      ?auto_812677 - BLOCK
      ?auto_812678 - BLOCK
      ?auto_812679 - BLOCK
      ?auto_812680 - BLOCK
      ?auto_812681 - BLOCK
      ?auto_812682 - BLOCK
      ?auto_812683 - BLOCK
      ?auto_812684 - BLOCK
      ?auto_812685 - BLOCK
    )
    :vars
    (
      ?auto_812686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812685 ?auto_812686 ) ( ON-TABLE ?auto_812674 ) ( ON ?auto_812675 ?auto_812674 ) ( not ( = ?auto_812674 ?auto_812675 ) ) ( not ( = ?auto_812674 ?auto_812676 ) ) ( not ( = ?auto_812674 ?auto_812677 ) ) ( not ( = ?auto_812674 ?auto_812678 ) ) ( not ( = ?auto_812674 ?auto_812679 ) ) ( not ( = ?auto_812674 ?auto_812680 ) ) ( not ( = ?auto_812674 ?auto_812681 ) ) ( not ( = ?auto_812674 ?auto_812682 ) ) ( not ( = ?auto_812674 ?auto_812683 ) ) ( not ( = ?auto_812674 ?auto_812684 ) ) ( not ( = ?auto_812674 ?auto_812685 ) ) ( not ( = ?auto_812674 ?auto_812686 ) ) ( not ( = ?auto_812675 ?auto_812676 ) ) ( not ( = ?auto_812675 ?auto_812677 ) ) ( not ( = ?auto_812675 ?auto_812678 ) ) ( not ( = ?auto_812675 ?auto_812679 ) ) ( not ( = ?auto_812675 ?auto_812680 ) ) ( not ( = ?auto_812675 ?auto_812681 ) ) ( not ( = ?auto_812675 ?auto_812682 ) ) ( not ( = ?auto_812675 ?auto_812683 ) ) ( not ( = ?auto_812675 ?auto_812684 ) ) ( not ( = ?auto_812675 ?auto_812685 ) ) ( not ( = ?auto_812675 ?auto_812686 ) ) ( not ( = ?auto_812676 ?auto_812677 ) ) ( not ( = ?auto_812676 ?auto_812678 ) ) ( not ( = ?auto_812676 ?auto_812679 ) ) ( not ( = ?auto_812676 ?auto_812680 ) ) ( not ( = ?auto_812676 ?auto_812681 ) ) ( not ( = ?auto_812676 ?auto_812682 ) ) ( not ( = ?auto_812676 ?auto_812683 ) ) ( not ( = ?auto_812676 ?auto_812684 ) ) ( not ( = ?auto_812676 ?auto_812685 ) ) ( not ( = ?auto_812676 ?auto_812686 ) ) ( not ( = ?auto_812677 ?auto_812678 ) ) ( not ( = ?auto_812677 ?auto_812679 ) ) ( not ( = ?auto_812677 ?auto_812680 ) ) ( not ( = ?auto_812677 ?auto_812681 ) ) ( not ( = ?auto_812677 ?auto_812682 ) ) ( not ( = ?auto_812677 ?auto_812683 ) ) ( not ( = ?auto_812677 ?auto_812684 ) ) ( not ( = ?auto_812677 ?auto_812685 ) ) ( not ( = ?auto_812677 ?auto_812686 ) ) ( not ( = ?auto_812678 ?auto_812679 ) ) ( not ( = ?auto_812678 ?auto_812680 ) ) ( not ( = ?auto_812678 ?auto_812681 ) ) ( not ( = ?auto_812678 ?auto_812682 ) ) ( not ( = ?auto_812678 ?auto_812683 ) ) ( not ( = ?auto_812678 ?auto_812684 ) ) ( not ( = ?auto_812678 ?auto_812685 ) ) ( not ( = ?auto_812678 ?auto_812686 ) ) ( not ( = ?auto_812679 ?auto_812680 ) ) ( not ( = ?auto_812679 ?auto_812681 ) ) ( not ( = ?auto_812679 ?auto_812682 ) ) ( not ( = ?auto_812679 ?auto_812683 ) ) ( not ( = ?auto_812679 ?auto_812684 ) ) ( not ( = ?auto_812679 ?auto_812685 ) ) ( not ( = ?auto_812679 ?auto_812686 ) ) ( not ( = ?auto_812680 ?auto_812681 ) ) ( not ( = ?auto_812680 ?auto_812682 ) ) ( not ( = ?auto_812680 ?auto_812683 ) ) ( not ( = ?auto_812680 ?auto_812684 ) ) ( not ( = ?auto_812680 ?auto_812685 ) ) ( not ( = ?auto_812680 ?auto_812686 ) ) ( not ( = ?auto_812681 ?auto_812682 ) ) ( not ( = ?auto_812681 ?auto_812683 ) ) ( not ( = ?auto_812681 ?auto_812684 ) ) ( not ( = ?auto_812681 ?auto_812685 ) ) ( not ( = ?auto_812681 ?auto_812686 ) ) ( not ( = ?auto_812682 ?auto_812683 ) ) ( not ( = ?auto_812682 ?auto_812684 ) ) ( not ( = ?auto_812682 ?auto_812685 ) ) ( not ( = ?auto_812682 ?auto_812686 ) ) ( not ( = ?auto_812683 ?auto_812684 ) ) ( not ( = ?auto_812683 ?auto_812685 ) ) ( not ( = ?auto_812683 ?auto_812686 ) ) ( not ( = ?auto_812684 ?auto_812685 ) ) ( not ( = ?auto_812684 ?auto_812686 ) ) ( not ( = ?auto_812685 ?auto_812686 ) ) ( ON ?auto_812684 ?auto_812685 ) ( ON ?auto_812683 ?auto_812684 ) ( ON ?auto_812682 ?auto_812683 ) ( ON ?auto_812681 ?auto_812682 ) ( ON ?auto_812680 ?auto_812681 ) ( ON ?auto_812679 ?auto_812680 ) ( ON ?auto_812678 ?auto_812679 ) ( ON ?auto_812677 ?auto_812678 ) ( CLEAR ?auto_812675 ) ( ON ?auto_812676 ?auto_812677 ) ( CLEAR ?auto_812676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_812674 ?auto_812675 ?auto_812676 )
      ( MAKE-12PILE ?auto_812674 ?auto_812675 ?auto_812676 ?auto_812677 ?auto_812678 ?auto_812679 ?auto_812680 ?auto_812681 ?auto_812682 ?auto_812683 ?auto_812684 ?auto_812685 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812724 - BLOCK
      ?auto_812725 - BLOCK
      ?auto_812726 - BLOCK
      ?auto_812727 - BLOCK
      ?auto_812728 - BLOCK
      ?auto_812729 - BLOCK
      ?auto_812730 - BLOCK
      ?auto_812731 - BLOCK
      ?auto_812732 - BLOCK
      ?auto_812733 - BLOCK
      ?auto_812734 - BLOCK
      ?auto_812735 - BLOCK
    )
    :vars
    (
      ?auto_812736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812735 ?auto_812736 ) ( ON-TABLE ?auto_812724 ) ( not ( = ?auto_812724 ?auto_812725 ) ) ( not ( = ?auto_812724 ?auto_812726 ) ) ( not ( = ?auto_812724 ?auto_812727 ) ) ( not ( = ?auto_812724 ?auto_812728 ) ) ( not ( = ?auto_812724 ?auto_812729 ) ) ( not ( = ?auto_812724 ?auto_812730 ) ) ( not ( = ?auto_812724 ?auto_812731 ) ) ( not ( = ?auto_812724 ?auto_812732 ) ) ( not ( = ?auto_812724 ?auto_812733 ) ) ( not ( = ?auto_812724 ?auto_812734 ) ) ( not ( = ?auto_812724 ?auto_812735 ) ) ( not ( = ?auto_812724 ?auto_812736 ) ) ( not ( = ?auto_812725 ?auto_812726 ) ) ( not ( = ?auto_812725 ?auto_812727 ) ) ( not ( = ?auto_812725 ?auto_812728 ) ) ( not ( = ?auto_812725 ?auto_812729 ) ) ( not ( = ?auto_812725 ?auto_812730 ) ) ( not ( = ?auto_812725 ?auto_812731 ) ) ( not ( = ?auto_812725 ?auto_812732 ) ) ( not ( = ?auto_812725 ?auto_812733 ) ) ( not ( = ?auto_812725 ?auto_812734 ) ) ( not ( = ?auto_812725 ?auto_812735 ) ) ( not ( = ?auto_812725 ?auto_812736 ) ) ( not ( = ?auto_812726 ?auto_812727 ) ) ( not ( = ?auto_812726 ?auto_812728 ) ) ( not ( = ?auto_812726 ?auto_812729 ) ) ( not ( = ?auto_812726 ?auto_812730 ) ) ( not ( = ?auto_812726 ?auto_812731 ) ) ( not ( = ?auto_812726 ?auto_812732 ) ) ( not ( = ?auto_812726 ?auto_812733 ) ) ( not ( = ?auto_812726 ?auto_812734 ) ) ( not ( = ?auto_812726 ?auto_812735 ) ) ( not ( = ?auto_812726 ?auto_812736 ) ) ( not ( = ?auto_812727 ?auto_812728 ) ) ( not ( = ?auto_812727 ?auto_812729 ) ) ( not ( = ?auto_812727 ?auto_812730 ) ) ( not ( = ?auto_812727 ?auto_812731 ) ) ( not ( = ?auto_812727 ?auto_812732 ) ) ( not ( = ?auto_812727 ?auto_812733 ) ) ( not ( = ?auto_812727 ?auto_812734 ) ) ( not ( = ?auto_812727 ?auto_812735 ) ) ( not ( = ?auto_812727 ?auto_812736 ) ) ( not ( = ?auto_812728 ?auto_812729 ) ) ( not ( = ?auto_812728 ?auto_812730 ) ) ( not ( = ?auto_812728 ?auto_812731 ) ) ( not ( = ?auto_812728 ?auto_812732 ) ) ( not ( = ?auto_812728 ?auto_812733 ) ) ( not ( = ?auto_812728 ?auto_812734 ) ) ( not ( = ?auto_812728 ?auto_812735 ) ) ( not ( = ?auto_812728 ?auto_812736 ) ) ( not ( = ?auto_812729 ?auto_812730 ) ) ( not ( = ?auto_812729 ?auto_812731 ) ) ( not ( = ?auto_812729 ?auto_812732 ) ) ( not ( = ?auto_812729 ?auto_812733 ) ) ( not ( = ?auto_812729 ?auto_812734 ) ) ( not ( = ?auto_812729 ?auto_812735 ) ) ( not ( = ?auto_812729 ?auto_812736 ) ) ( not ( = ?auto_812730 ?auto_812731 ) ) ( not ( = ?auto_812730 ?auto_812732 ) ) ( not ( = ?auto_812730 ?auto_812733 ) ) ( not ( = ?auto_812730 ?auto_812734 ) ) ( not ( = ?auto_812730 ?auto_812735 ) ) ( not ( = ?auto_812730 ?auto_812736 ) ) ( not ( = ?auto_812731 ?auto_812732 ) ) ( not ( = ?auto_812731 ?auto_812733 ) ) ( not ( = ?auto_812731 ?auto_812734 ) ) ( not ( = ?auto_812731 ?auto_812735 ) ) ( not ( = ?auto_812731 ?auto_812736 ) ) ( not ( = ?auto_812732 ?auto_812733 ) ) ( not ( = ?auto_812732 ?auto_812734 ) ) ( not ( = ?auto_812732 ?auto_812735 ) ) ( not ( = ?auto_812732 ?auto_812736 ) ) ( not ( = ?auto_812733 ?auto_812734 ) ) ( not ( = ?auto_812733 ?auto_812735 ) ) ( not ( = ?auto_812733 ?auto_812736 ) ) ( not ( = ?auto_812734 ?auto_812735 ) ) ( not ( = ?auto_812734 ?auto_812736 ) ) ( not ( = ?auto_812735 ?auto_812736 ) ) ( ON ?auto_812734 ?auto_812735 ) ( ON ?auto_812733 ?auto_812734 ) ( ON ?auto_812732 ?auto_812733 ) ( ON ?auto_812731 ?auto_812732 ) ( ON ?auto_812730 ?auto_812731 ) ( ON ?auto_812729 ?auto_812730 ) ( ON ?auto_812728 ?auto_812729 ) ( ON ?auto_812727 ?auto_812728 ) ( ON ?auto_812726 ?auto_812727 ) ( CLEAR ?auto_812724 ) ( ON ?auto_812725 ?auto_812726 ) ( CLEAR ?auto_812725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_812724 ?auto_812725 )
      ( MAKE-12PILE ?auto_812724 ?auto_812725 ?auto_812726 ?auto_812727 ?auto_812728 ?auto_812729 ?auto_812730 ?auto_812731 ?auto_812732 ?auto_812733 ?auto_812734 ?auto_812735 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_812774 - BLOCK
      ?auto_812775 - BLOCK
      ?auto_812776 - BLOCK
      ?auto_812777 - BLOCK
      ?auto_812778 - BLOCK
      ?auto_812779 - BLOCK
      ?auto_812780 - BLOCK
      ?auto_812781 - BLOCK
      ?auto_812782 - BLOCK
      ?auto_812783 - BLOCK
      ?auto_812784 - BLOCK
      ?auto_812785 - BLOCK
    )
    :vars
    (
      ?auto_812786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812785 ?auto_812786 ) ( not ( = ?auto_812774 ?auto_812775 ) ) ( not ( = ?auto_812774 ?auto_812776 ) ) ( not ( = ?auto_812774 ?auto_812777 ) ) ( not ( = ?auto_812774 ?auto_812778 ) ) ( not ( = ?auto_812774 ?auto_812779 ) ) ( not ( = ?auto_812774 ?auto_812780 ) ) ( not ( = ?auto_812774 ?auto_812781 ) ) ( not ( = ?auto_812774 ?auto_812782 ) ) ( not ( = ?auto_812774 ?auto_812783 ) ) ( not ( = ?auto_812774 ?auto_812784 ) ) ( not ( = ?auto_812774 ?auto_812785 ) ) ( not ( = ?auto_812774 ?auto_812786 ) ) ( not ( = ?auto_812775 ?auto_812776 ) ) ( not ( = ?auto_812775 ?auto_812777 ) ) ( not ( = ?auto_812775 ?auto_812778 ) ) ( not ( = ?auto_812775 ?auto_812779 ) ) ( not ( = ?auto_812775 ?auto_812780 ) ) ( not ( = ?auto_812775 ?auto_812781 ) ) ( not ( = ?auto_812775 ?auto_812782 ) ) ( not ( = ?auto_812775 ?auto_812783 ) ) ( not ( = ?auto_812775 ?auto_812784 ) ) ( not ( = ?auto_812775 ?auto_812785 ) ) ( not ( = ?auto_812775 ?auto_812786 ) ) ( not ( = ?auto_812776 ?auto_812777 ) ) ( not ( = ?auto_812776 ?auto_812778 ) ) ( not ( = ?auto_812776 ?auto_812779 ) ) ( not ( = ?auto_812776 ?auto_812780 ) ) ( not ( = ?auto_812776 ?auto_812781 ) ) ( not ( = ?auto_812776 ?auto_812782 ) ) ( not ( = ?auto_812776 ?auto_812783 ) ) ( not ( = ?auto_812776 ?auto_812784 ) ) ( not ( = ?auto_812776 ?auto_812785 ) ) ( not ( = ?auto_812776 ?auto_812786 ) ) ( not ( = ?auto_812777 ?auto_812778 ) ) ( not ( = ?auto_812777 ?auto_812779 ) ) ( not ( = ?auto_812777 ?auto_812780 ) ) ( not ( = ?auto_812777 ?auto_812781 ) ) ( not ( = ?auto_812777 ?auto_812782 ) ) ( not ( = ?auto_812777 ?auto_812783 ) ) ( not ( = ?auto_812777 ?auto_812784 ) ) ( not ( = ?auto_812777 ?auto_812785 ) ) ( not ( = ?auto_812777 ?auto_812786 ) ) ( not ( = ?auto_812778 ?auto_812779 ) ) ( not ( = ?auto_812778 ?auto_812780 ) ) ( not ( = ?auto_812778 ?auto_812781 ) ) ( not ( = ?auto_812778 ?auto_812782 ) ) ( not ( = ?auto_812778 ?auto_812783 ) ) ( not ( = ?auto_812778 ?auto_812784 ) ) ( not ( = ?auto_812778 ?auto_812785 ) ) ( not ( = ?auto_812778 ?auto_812786 ) ) ( not ( = ?auto_812779 ?auto_812780 ) ) ( not ( = ?auto_812779 ?auto_812781 ) ) ( not ( = ?auto_812779 ?auto_812782 ) ) ( not ( = ?auto_812779 ?auto_812783 ) ) ( not ( = ?auto_812779 ?auto_812784 ) ) ( not ( = ?auto_812779 ?auto_812785 ) ) ( not ( = ?auto_812779 ?auto_812786 ) ) ( not ( = ?auto_812780 ?auto_812781 ) ) ( not ( = ?auto_812780 ?auto_812782 ) ) ( not ( = ?auto_812780 ?auto_812783 ) ) ( not ( = ?auto_812780 ?auto_812784 ) ) ( not ( = ?auto_812780 ?auto_812785 ) ) ( not ( = ?auto_812780 ?auto_812786 ) ) ( not ( = ?auto_812781 ?auto_812782 ) ) ( not ( = ?auto_812781 ?auto_812783 ) ) ( not ( = ?auto_812781 ?auto_812784 ) ) ( not ( = ?auto_812781 ?auto_812785 ) ) ( not ( = ?auto_812781 ?auto_812786 ) ) ( not ( = ?auto_812782 ?auto_812783 ) ) ( not ( = ?auto_812782 ?auto_812784 ) ) ( not ( = ?auto_812782 ?auto_812785 ) ) ( not ( = ?auto_812782 ?auto_812786 ) ) ( not ( = ?auto_812783 ?auto_812784 ) ) ( not ( = ?auto_812783 ?auto_812785 ) ) ( not ( = ?auto_812783 ?auto_812786 ) ) ( not ( = ?auto_812784 ?auto_812785 ) ) ( not ( = ?auto_812784 ?auto_812786 ) ) ( not ( = ?auto_812785 ?auto_812786 ) ) ( ON ?auto_812784 ?auto_812785 ) ( ON ?auto_812783 ?auto_812784 ) ( ON ?auto_812782 ?auto_812783 ) ( ON ?auto_812781 ?auto_812782 ) ( ON ?auto_812780 ?auto_812781 ) ( ON ?auto_812779 ?auto_812780 ) ( ON ?auto_812778 ?auto_812779 ) ( ON ?auto_812777 ?auto_812778 ) ( ON ?auto_812776 ?auto_812777 ) ( ON ?auto_812775 ?auto_812776 ) ( ON ?auto_812774 ?auto_812775 ) ( CLEAR ?auto_812774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_812774 )
      ( MAKE-12PILE ?auto_812774 ?auto_812775 ?auto_812776 ?auto_812777 ?auto_812778 ?auto_812779 ?auto_812780 ?auto_812781 ?auto_812782 ?auto_812783 ?auto_812784 ?auto_812785 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_812825 - BLOCK
      ?auto_812826 - BLOCK
      ?auto_812827 - BLOCK
      ?auto_812828 - BLOCK
      ?auto_812829 - BLOCK
      ?auto_812830 - BLOCK
      ?auto_812831 - BLOCK
      ?auto_812832 - BLOCK
      ?auto_812833 - BLOCK
      ?auto_812834 - BLOCK
      ?auto_812835 - BLOCK
      ?auto_812836 - BLOCK
      ?auto_812837 - BLOCK
    )
    :vars
    (
      ?auto_812838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_812836 ) ( ON ?auto_812837 ?auto_812838 ) ( CLEAR ?auto_812837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_812825 ) ( ON ?auto_812826 ?auto_812825 ) ( ON ?auto_812827 ?auto_812826 ) ( ON ?auto_812828 ?auto_812827 ) ( ON ?auto_812829 ?auto_812828 ) ( ON ?auto_812830 ?auto_812829 ) ( ON ?auto_812831 ?auto_812830 ) ( ON ?auto_812832 ?auto_812831 ) ( ON ?auto_812833 ?auto_812832 ) ( ON ?auto_812834 ?auto_812833 ) ( ON ?auto_812835 ?auto_812834 ) ( ON ?auto_812836 ?auto_812835 ) ( not ( = ?auto_812825 ?auto_812826 ) ) ( not ( = ?auto_812825 ?auto_812827 ) ) ( not ( = ?auto_812825 ?auto_812828 ) ) ( not ( = ?auto_812825 ?auto_812829 ) ) ( not ( = ?auto_812825 ?auto_812830 ) ) ( not ( = ?auto_812825 ?auto_812831 ) ) ( not ( = ?auto_812825 ?auto_812832 ) ) ( not ( = ?auto_812825 ?auto_812833 ) ) ( not ( = ?auto_812825 ?auto_812834 ) ) ( not ( = ?auto_812825 ?auto_812835 ) ) ( not ( = ?auto_812825 ?auto_812836 ) ) ( not ( = ?auto_812825 ?auto_812837 ) ) ( not ( = ?auto_812825 ?auto_812838 ) ) ( not ( = ?auto_812826 ?auto_812827 ) ) ( not ( = ?auto_812826 ?auto_812828 ) ) ( not ( = ?auto_812826 ?auto_812829 ) ) ( not ( = ?auto_812826 ?auto_812830 ) ) ( not ( = ?auto_812826 ?auto_812831 ) ) ( not ( = ?auto_812826 ?auto_812832 ) ) ( not ( = ?auto_812826 ?auto_812833 ) ) ( not ( = ?auto_812826 ?auto_812834 ) ) ( not ( = ?auto_812826 ?auto_812835 ) ) ( not ( = ?auto_812826 ?auto_812836 ) ) ( not ( = ?auto_812826 ?auto_812837 ) ) ( not ( = ?auto_812826 ?auto_812838 ) ) ( not ( = ?auto_812827 ?auto_812828 ) ) ( not ( = ?auto_812827 ?auto_812829 ) ) ( not ( = ?auto_812827 ?auto_812830 ) ) ( not ( = ?auto_812827 ?auto_812831 ) ) ( not ( = ?auto_812827 ?auto_812832 ) ) ( not ( = ?auto_812827 ?auto_812833 ) ) ( not ( = ?auto_812827 ?auto_812834 ) ) ( not ( = ?auto_812827 ?auto_812835 ) ) ( not ( = ?auto_812827 ?auto_812836 ) ) ( not ( = ?auto_812827 ?auto_812837 ) ) ( not ( = ?auto_812827 ?auto_812838 ) ) ( not ( = ?auto_812828 ?auto_812829 ) ) ( not ( = ?auto_812828 ?auto_812830 ) ) ( not ( = ?auto_812828 ?auto_812831 ) ) ( not ( = ?auto_812828 ?auto_812832 ) ) ( not ( = ?auto_812828 ?auto_812833 ) ) ( not ( = ?auto_812828 ?auto_812834 ) ) ( not ( = ?auto_812828 ?auto_812835 ) ) ( not ( = ?auto_812828 ?auto_812836 ) ) ( not ( = ?auto_812828 ?auto_812837 ) ) ( not ( = ?auto_812828 ?auto_812838 ) ) ( not ( = ?auto_812829 ?auto_812830 ) ) ( not ( = ?auto_812829 ?auto_812831 ) ) ( not ( = ?auto_812829 ?auto_812832 ) ) ( not ( = ?auto_812829 ?auto_812833 ) ) ( not ( = ?auto_812829 ?auto_812834 ) ) ( not ( = ?auto_812829 ?auto_812835 ) ) ( not ( = ?auto_812829 ?auto_812836 ) ) ( not ( = ?auto_812829 ?auto_812837 ) ) ( not ( = ?auto_812829 ?auto_812838 ) ) ( not ( = ?auto_812830 ?auto_812831 ) ) ( not ( = ?auto_812830 ?auto_812832 ) ) ( not ( = ?auto_812830 ?auto_812833 ) ) ( not ( = ?auto_812830 ?auto_812834 ) ) ( not ( = ?auto_812830 ?auto_812835 ) ) ( not ( = ?auto_812830 ?auto_812836 ) ) ( not ( = ?auto_812830 ?auto_812837 ) ) ( not ( = ?auto_812830 ?auto_812838 ) ) ( not ( = ?auto_812831 ?auto_812832 ) ) ( not ( = ?auto_812831 ?auto_812833 ) ) ( not ( = ?auto_812831 ?auto_812834 ) ) ( not ( = ?auto_812831 ?auto_812835 ) ) ( not ( = ?auto_812831 ?auto_812836 ) ) ( not ( = ?auto_812831 ?auto_812837 ) ) ( not ( = ?auto_812831 ?auto_812838 ) ) ( not ( = ?auto_812832 ?auto_812833 ) ) ( not ( = ?auto_812832 ?auto_812834 ) ) ( not ( = ?auto_812832 ?auto_812835 ) ) ( not ( = ?auto_812832 ?auto_812836 ) ) ( not ( = ?auto_812832 ?auto_812837 ) ) ( not ( = ?auto_812832 ?auto_812838 ) ) ( not ( = ?auto_812833 ?auto_812834 ) ) ( not ( = ?auto_812833 ?auto_812835 ) ) ( not ( = ?auto_812833 ?auto_812836 ) ) ( not ( = ?auto_812833 ?auto_812837 ) ) ( not ( = ?auto_812833 ?auto_812838 ) ) ( not ( = ?auto_812834 ?auto_812835 ) ) ( not ( = ?auto_812834 ?auto_812836 ) ) ( not ( = ?auto_812834 ?auto_812837 ) ) ( not ( = ?auto_812834 ?auto_812838 ) ) ( not ( = ?auto_812835 ?auto_812836 ) ) ( not ( = ?auto_812835 ?auto_812837 ) ) ( not ( = ?auto_812835 ?auto_812838 ) ) ( not ( = ?auto_812836 ?auto_812837 ) ) ( not ( = ?auto_812836 ?auto_812838 ) ) ( not ( = ?auto_812837 ?auto_812838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_812837 ?auto_812838 )
      ( !STACK ?auto_812837 ?auto_812836 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_812879 - BLOCK
      ?auto_812880 - BLOCK
      ?auto_812881 - BLOCK
      ?auto_812882 - BLOCK
      ?auto_812883 - BLOCK
      ?auto_812884 - BLOCK
      ?auto_812885 - BLOCK
      ?auto_812886 - BLOCK
      ?auto_812887 - BLOCK
      ?auto_812888 - BLOCK
      ?auto_812889 - BLOCK
      ?auto_812890 - BLOCK
      ?auto_812891 - BLOCK
    )
    :vars
    (
      ?auto_812892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812891 ?auto_812892 ) ( ON-TABLE ?auto_812879 ) ( ON ?auto_812880 ?auto_812879 ) ( ON ?auto_812881 ?auto_812880 ) ( ON ?auto_812882 ?auto_812881 ) ( ON ?auto_812883 ?auto_812882 ) ( ON ?auto_812884 ?auto_812883 ) ( ON ?auto_812885 ?auto_812884 ) ( ON ?auto_812886 ?auto_812885 ) ( ON ?auto_812887 ?auto_812886 ) ( ON ?auto_812888 ?auto_812887 ) ( ON ?auto_812889 ?auto_812888 ) ( not ( = ?auto_812879 ?auto_812880 ) ) ( not ( = ?auto_812879 ?auto_812881 ) ) ( not ( = ?auto_812879 ?auto_812882 ) ) ( not ( = ?auto_812879 ?auto_812883 ) ) ( not ( = ?auto_812879 ?auto_812884 ) ) ( not ( = ?auto_812879 ?auto_812885 ) ) ( not ( = ?auto_812879 ?auto_812886 ) ) ( not ( = ?auto_812879 ?auto_812887 ) ) ( not ( = ?auto_812879 ?auto_812888 ) ) ( not ( = ?auto_812879 ?auto_812889 ) ) ( not ( = ?auto_812879 ?auto_812890 ) ) ( not ( = ?auto_812879 ?auto_812891 ) ) ( not ( = ?auto_812879 ?auto_812892 ) ) ( not ( = ?auto_812880 ?auto_812881 ) ) ( not ( = ?auto_812880 ?auto_812882 ) ) ( not ( = ?auto_812880 ?auto_812883 ) ) ( not ( = ?auto_812880 ?auto_812884 ) ) ( not ( = ?auto_812880 ?auto_812885 ) ) ( not ( = ?auto_812880 ?auto_812886 ) ) ( not ( = ?auto_812880 ?auto_812887 ) ) ( not ( = ?auto_812880 ?auto_812888 ) ) ( not ( = ?auto_812880 ?auto_812889 ) ) ( not ( = ?auto_812880 ?auto_812890 ) ) ( not ( = ?auto_812880 ?auto_812891 ) ) ( not ( = ?auto_812880 ?auto_812892 ) ) ( not ( = ?auto_812881 ?auto_812882 ) ) ( not ( = ?auto_812881 ?auto_812883 ) ) ( not ( = ?auto_812881 ?auto_812884 ) ) ( not ( = ?auto_812881 ?auto_812885 ) ) ( not ( = ?auto_812881 ?auto_812886 ) ) ( not ( = ?auto_812881 ?auto_812887 ) ) ( not ( = ?auto_812881 ?auto_812888 ) ) ( not ( = ?auto_812881 ?auto_812889 ) ) ( not ( = ?auto_812881 ?auto_812890 ) ) ( not ( = ?auto_812881 ?auto_812891 ) ) ( not ( = ?auto_812881 ?auto_812892 ) ) ( not ( = ?auto_812882 ?auto_812883 ) ) ( not ( = ?auto_812882 ?auto_812884 ) ) ( not ( = ?auto_812882 ?auto_812885 ) ) ( not ( = ?auto_812882 ?auto_812886 ) ) ( not ( = ?auto_812882 ?auto_812887 ) ) ( not ( = ?auto_812882 ?auto_812888 ) ) ( not ( = ?auto_812882 ?auto_812889 ) ) ( not ( = ?auto_812882 ?auto_812890 ) ) ( not ( = ?auto_812882 ?auto_812891 ) ) ( not ( = ?auto_812882 ?auto_812892 ) ) ( not ( = ?auto_812883 ?auto_812884 ) ) ( not ( = ?auto_812883 ?auto_812885 ) ) ( not ( = ?auto_812883 ?auto_812886 ) ) ( not ( = ?auto_812883 ?auto_812887 ) ) ( not ( = ?auto_812883 ?auto_812888 ) ) ( not ( = ?auto_812883 ?auto_812889 ) ) ( not ( = ?auto_812883 ?auto_812890 ) ) ( not ( = ?auto_812883 ?auto_812891 ) ) ( not ( = ?auto_812883 ?auto_812892 ) ) ( not ( = ?auto_812884 ?auto_812885 ) ) ( not ( = ?auto_812884 ?auto_812886 ) ) ( not ( = ?auto_812884 ?auto_812887 ) ) ( not ( = ?auto_812884 ?auto_812888 ) ) ( not ( = ?auto_812884 ?auto_812889 ) ) ( not ( = ?auto_812884 ?auto_812890 ) ) ( not ( = ?auto_812884 ?auto_812891 ) ) ( not ( = ?auto_812884 ?auto_812892 ) ) ( not ( = ?auto_812885 ?auto_812886 ) ) ( not ( = ?auto_812885 ?auto_812887 ) ) ( not ( = ?auto_812885 ?auto_812888 ) ) ( not ( = ?auto_812885 ?auto_812889 ) ) ( not ( = ?auto_812885 ?auto_812890 ) ) ( not ( = ?auto_812885 ?auto_812891 ) ) ( not ( = ?auto_812885 ?auto_812892 ) ) ( not ( = ?auto_812886 ?auto_812887 ) ) ( not ( = ?auto_812886 ?auto_812888 ) ) ( not ( = ?auto_812886 ?auto_812889 ) ) ( not ( = ?auto_812886 ?auto_812890 ) ) ( not ( = ?auto_812886 ?auto_812891 ) ) ( not ( = ?auto_812886 ?auto_812892 ) ) ( not ( = ?auto_812887 ?auto_812888 ) ) ( not ( = ?auto_812887 ?auto_812889 ) ) ( not ( = ?auto_812887 ?auto_812890 ) ) ( not ( = ?auto_812887 ?auto_812891 ) ) ( not ( = ?auto_812887 ?auto_812892 ) ) ( not ( = ?auto_812888 ?auto_812889 ) ) ( not ( = ?auto_812888 ?auto_812890 ) ) ( not ( = ?auto_812888 ?auto_812891 ) ) ( not ( = ?auto_812888 ?auto_812892 ) ) ( not ( = ?auto_812889 ?auto_812890 ) ) ( not ( = ?auto_812889 ?auto_812891 ) ) ( not ( = ?auto_812889 ?auto_812892 ) ) ( not ( = ?auto_812890 ?auto_812891 ) ) ( not ( = ?auto_812890 ?auto_812892 ) ) ( not ( = ?auto_812891 ?auto_812892 ) ) ( CLEAR ?auto_812889 ) ( ON ?auto_812890 ?auto_812891 ) ( CLEAR ?auto_812890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_812879 ?auto_812880 ?auto_812881 ?auto_812882 ?auto_812883 ?auto_812884 ?auto_812885 ?auto_812886 ?auto_812887 ?auto_812888 ?auto_812889 ?auto_812890 )
      ( MAKE-13PILE ?auto_812879 ?auto_812880 ?auto_812881 ?auto_812882 ?auto_812883 ?auto_812884 ?auto_812885 ?auto_812886 ?auto_812887 ?auto_812888 ?auto_812889 ?auto_812890 ?auto_812891 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_812933 - BLOCK
      ?auto_812934 - BLOCK
      ?auto_812935 - BLOCK
      ?auto_812936 - BLOCK
      ?auto_812937 - BLOCK
      ?auto_812938 - BLOCK
      ?auto_812939 - BLOCK
      ?auto_812940 - BLOCK
      ?auto_812941 - BLOCK
      ?auto_812942 - BLOCK
      ?auto_812943 - BLOCK
      ?auto_812944 - BLOCK
      ?auto_812945 - BLOCK
    )
    :vars
    (
      ?auto_812946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812945 ?auto_812946 ) ( ON-TABLE ?auto_812933 ) ( ON ?auto_812934 ?auto_812933 ) ( ON ?auto_812935 ?auto_812934 ) ( ON ?auto_812936 ?auto_812935 ) ( ON ?auto_812937 ?auto_812936 ) ( ON ?auto_812938 ?auto_812937 ) ( ON ?auto_812939 ?auto_812938 ) ( ON ?auto_812940 ?auto_812939 ) ( ON ?auto_812941 ?auto_812940 ) ( ON ?auto_812942 ?auto_812941 ) ( not ( = ?auto_812933 ?auto_812934 ) ) ( not ( = ?auto_812933 ?auto_812935 ) ) ( not ( = ?auto_812933 ?auto_812936 ) ) ( not ( = ?auto_812933 ?auto_812937 ) ) ( not ( = ?auto_812933 ?auto_812938 ) ) ( not ( = ?auto_812933 ?auto_812939 ) ) ( not ( = ?auto_812933 ?auto_812940 ) ) ( not ( = ?auto_812933 ?auto_812941 ) ) ( not ( = ?auto_812933 ?auto_812942 ) ) ( not ( = ?auto_812933 ?auto_812943 ) ) ( not ( = ?auto_812933 ?auto_812944 ) ) ( not ( = ?auto_812933 ?auto_812945 ) ) ( not ( = ?auto_812933 ?auto_812946 ) ) ( not ( = ?auto_812934 ?auto_812935 ) ) ( not ( = ?auto_812934 ?auto_812936 ) ) ( not ( = ?auto_812934 ?auto_812937 ) ) ( not ( = ?auto_812934 ?auto_812938 ) ) ( not ( = ?auto_812934 ?auto_812939 ) ) ( not ( = ?auto_812934 ?auto_812940 ) ) ( not ( = ?auto_812934 ?auto_812941 ) ) ( not ( = ?auto_812934 ?auto_812942 ) ) ( not ( = ?auto_812934 ?auto_812943 ) ) ( not ( = ?auto_812934 ?auto_812944 ) ) ( not ( = ?auto_812934 ?auto_812945 ) ) ( not ( = ?auto_812934 ?auto_812946 ) ) ( not ( = ?auto_812935 ?auto_812936 ) ) ( not ( = ?auto_812935 ?auto_812937 ) ) ( not ( = ?auto_812935 ?auto_812938 ) ) ( not ( = ?auto_812935 ?auto_812939 ) ) ( not ( = ?auto_812935 ?auto_812940 ) ) ( not ( = ?auto_812935 ?auto_812941 ) ) ( not ( = ?auto_812935 ?auto_812942 ) ) ( not ( = ?auto_812935 ?auto_812943 ) ) ( not ( = ?auto_812935 ?auto_812944 ) ) ( not ( = ?auto_812935 ?auto_812945 ) ) ( not ( = ?auto_812935 ?auto_812946 ) ) ( not ( = ?auto_812936 ?auto_812937 ) ) ( not ( = ?auto_812936 ?auto_812938 ) ) ( not ( = ?auto_812936 ?auto_812939 ) ) ( not ( = ?auto_812936 ?auto_812940 ) ) ( not ( = ?auto_812936 ?auto_812941 ) ) ( not ( = ?auto_812936 ?auto_812942 ) ) ( not ( = ?auto_812936 ?auto_812943 ) ) ( not ( = ?auto_812936 ?auto_812944 ) ) ( not ( = ?auto_812936 ?auto_812945 ) ) ( not ( = ?auto_812936 ?auto_812946 ) ) ( not ( = ?auto_812937 ?auto_812938 ) ) ( not ( = ?auto_812937 ?auto_812939 ) ) ( not ( = ?auto_812937 ?auto_812940 ) ) ( not ( = ?auto_812937 ?auto_812941 ) ) ( not ( = ?auto_812937 ?auto_812942 ) ) ( not ( = ?auto_812937 ?auto_812943 ) ) ( not ( = ?auto_812937 ?auto_812944 ) ) ( not ( = ?auto_812937 ?auto_812945 ) ) ( not ( = ?auto_812937 ?auto_812946 ) ) ( not ( = ?auto_812938 ?auto_812939 ) ) ( not ( = ?auto_812938 ?auto_812940 ) ) ( not ( = ?auto_812938 ?auto_812941 ) ) ( not ( = ?auto_812938 ?auto_812942 ) ) ( not ( = ?auto_812938 ?auto_812943 ) ) ( not ( = ?auto_812938 ?auto_812944 ) ) ( not ( = ?auto_812938 ?auto_812945 ) ) ( not ( = ?auto_812938 ?auto_812946 ) ) ( not ( = ?auto_812939 ?auto_812940 ) ) ( not ( = ?auto_812939 ?auto_812941 ) ) ( not ( = ?auto_812939 ?auto_812942 ) ) ( not ( = ?auto_812939 ?auto_812943 ) ) ( not ( = ?auto_812939 ?auto_812944 ) ) ( not ( = ?auto_812939 ?auto_812945 ) ) ( not ( = ?auto_812939 ?auto_812946 ) ) ( not ( = ?auto_812940 ?auto_812941 ) ) ( not ( = ?auto_812940 ?auto_812942 ) ) ( not ( = ?auto_812940 ?auto_812943 ) ) ( not ( = ?auto_812940 ?auto_812944 ) ) ( not ( = ?auto_812940 ?auto_812945 ) ) ( not ( = ?auto_812940 ?auto_812946 ) ) ( not ( = ?auto_812941 ?auto_812942 ) ) ( not ( = ?auto_812941 ?auto_812943 ) ) ( not ( = ?auto_812941 ?auto_812944 ) ) ( not ( = ?auto_812941 ?auto_812945 ) ) ( not ( = ?auto_812941 ?auto_812946 ) ) ( not ( = ?auto_812942 ?auto_812943 ) ) ( not ( = ?auto_812942 ?auto_812944 ) ) ( not ( = ?auto_812942 ?auto_812945 ) ) ( not ( = ?auto_812942 ?auto_812946 ) ) ( not ( = ?auto_812943 ?auto_812944 ) ) ( not ( = ?auto_812943 ?auto_812945 ) ) ( not ( = ?auto_812943 ?auto_812946 ) ) ( not ( = ?auto_812944 ?auto_812945 ) ) ( not ( = ?auto_812944 ?auto_812946 ) ) ( not ( = ?auto_812945 ?auto_812946 ) ) ( ON ?auto_812944 ?auto_812945 ) ( CLEAR ?auto_812942 ) ( ON ?auto_812943 ?auto_812944 ) ( CLEAR ?auto_812943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_812933 ?auto_812934 ?auto_812935 ?auto_812936 ?auto_812937 ?auto_812938 ?auto_812939 ?auto_812940 ?auto_812941 ?auto_812942 ?auto_812943 )
      ( MAKE-13PILE ?auto_812933 ?auto_812934 ?auto_812935 ?auto_812936 ?auto_812937 ?auto_812938 ?auto_812939 ?auto_812940 ?auto_812941 ?auto_812942 ?auto_812943 ?auto_812944 ?auto_812945 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_812987 - BLOCK
      ?auto_812988 - BLOCK
      ?auto_812989 - BLOCK
      ?auto_812990 - BLOCK
      ?auto_812991 - BLOCK
      ?auto_812992 - BLOCK
      ?auto_812993 - BLOCK
      ?auto_812994 - BLOCK
      ?auto_812995 - BLOCK
      ?auto_812996 - BLOCK
      ?auto_812997 - BLOCK
      ?auto_812998 - BLOCK
      ?auto_812999 - BLOCK
    )
    :vars
    (
      ?auto_813000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_812999 ?auto_813000 ) ( ON-TABLE ?auto_812987 ) ( ON ?auto_812988 ?auto_812987 ) ( ON ?auto_812989 ?auto_812988 ) ( ON ?auto_812990 ?auto_812989 ) ( ON ?auto_812991 ?auto_812990 ) ( ON ?auto_812992 ?auto_812991 ) ( ON ?auto_812993 ?auto_812992 ) ( ON ?auto_812994 ?auto_812993 ) ( ON ?auto_812995 ?auto_812994 ) ( not ( = ?auto_812987 ?auto_812988 ) ) ( not ( = ?auto_812987 ?auto_812989 ) ) ( not ( = ?auto_812987 ?auto_812990 ) ) ( not ( = ?auto_812987 ?auto_812991 ) ) ( not ( = ?auto_812987 ?auto_812992 ) ) ( not ( = ?auto_812987 ?auto_812993 ) ) ( not ( = ?auto_812987 ?auto_812994 ) ) ( not ( = ?auto_812987 ?auto_812995 ) ) ( not ( = ?auto_812987 ?auto_812996 ) ) ( not ( = ?auto_812987 ?auto_812997 ) ) ( not ( = ?auto_812987 ?auto_812998 ) ) ( not ( = ?auto_812987 ?auto_812999 ) ) ( not ( = ?auto_812987 ?auto_813000 ) ) ( not ( = ?auto_812988 ?auto_812989 ) ) ( not ( = ?auto_812988 ?auto_812990 ) ) ( not ( = ?auto_812988 ?auto_812991 ) ) ( not ( = ?auto_812988 ?auto_812992 ) ) ( not ( = ?auto_812988 ?auto_812993 ) ) ( not ( = ?auto_812988 ?auto_812994 ) ) ( not ( = ?auto_812988 ?auto_812995 ) ) ( not ( = ?auto_812988 ?auto_812996 ) ) ( not ( = ?auto_812988 ?auto_812997 ) ) ( not ( = ?auto_812988 ?auto_812998 ) ) ( not ( = ?auto_812988 ?auto_812999 ) ) ( not ( = ?auto_812988 ?auto_813000 ) ) ( not ( = ?auto_812989 ?auto_812990 ) ) ( not ( = ?auto_812989 ?auto_812991 ) ) ( not ( = ?auto_812989 ?auto_812992 ) ) ( not ( = ?auto_812989 ?auto_812993 ) ) ( not ( = ?auto_812989 ?auto_812994 ) ) ( not ( = ?auto_812989 ?auto_812995 ) ) ( not ( = ?auto_812989 ?auto_812996 ) ) ( not ( = ?auto_812989 ?auto_812997 ) ) ( not ( = ?auto_812989 ?auto_812998 ) ) ( not ( = ?auto_812989 ?auto_812999 ) ) ( not ( = ?auto_812989 ?auto_813000 ) ) ( not ( = ?auto_812990 ?auto_812991 ) ) ( not ( = ?auto_812990 ?auto_812992 ) ) ( not ( = ?auto_812990 ?auto_812993 ) ) ( not ( = ?auto_812990 ?auto_812994 ) ) ( not ( = ?auto_812990 ?auto_812995 ) ) ( not ( = ?auto_812990 ?auto_812996 ) ) ( not ( = ?auto_812990 ?auto_812997 ) ) ( not ( = ?auto_812990 ?auto_812998 ) ) ( not ( = ?auto_812990 ?auto_812999 ) ) ( not ( = ?auto_812990 ?auto_813000 ) ) ( not ( = ?auto_812991 ?auto_812992 ) ) ( not ( = ?auto_812991 ?auto_812993 ) ) ( not ( = ?auto_812991 ?auto_812994 ) ) ( not ( = ?auto_812991 ?auto_812995 ) ) ( not ( = ?auto_812991 ?auto_812996 ) ) ( not ( = ?auto_812991 ?auto_812997 ) ) ( not ( = ?auto_812991 ?auto_812998 ) ) ( not ( = ?auto_812991 ?auto_812999 ) ) ( not ( = ?auto_812991 ?auto_813000 ) ) ( not ( = ?auto_812992 ?auto_812993 ) ) ( not ( = ?auto_812992 ?auto_812994 ) ) ( not ( = ?auto_812992 ?auto_812995 ) ) ( not ( = ?auto_812992 ?auto_812996 ) ) ( not ( = ?auto_812992 ?auto_812997 ) ) ( not ( = ?auto_812992 ?auto_812998 ) ) ( not ( = ?auto_812992 ?auto_812999 ) ) ( not ( = ?auto_812992 ?auto_813000 ) ) ( not ( = ?auto_812993 ?auto_812994 ) ) ( not ( = ?auto_812993 ?auto_812995 ) ) ( not ( = ?auto_812993 ?auto_812996 ) ) ( not ( = ?auto_812993 ?auto_812997 ) ) ( not ( = ?auto_812993 ?auto_812998 ) ) ( not ( = ?auto_812993 ?auto_812999 ) ) ( not ( = ?auto_812993 ?auto_813000 ) ) ( not ( = ?auto_812994 ?auto_812995 ) ) ( not ( = ?auto_812994 ?auto_812996 ) ) ( not ( = ?auto_812994 ?auto_812997 ) ) ( not ( = ?auto_812994 ?auto_812998 ) ) ( not ( = ?auto_812994 ?auto_812999 ) ) ( not ( = ?auto_812994 ?auto_813000 ) ) ( not ( = ?auto_812995 ?auto_812996 ) ) ( not ( = ?auto_812995 ?auto_812997 ) ) ( not ( = ?auto_812995 ?auto_812998 ) ) ( not ( = ?auto_812995 ?auto_812999 ) ) ( not ( = ?auto_812995 ?auto_813000 ) ) ( not ( = ?auto_812996 ?auto_812997 ) ) ( not ( = ?auto_812996 ?auto_812998 ) ) ( not ( = ?auto_812996 ?auto_812999 ) ) ( not ( = ?auto_812996 ?auto_813000 ) ) ( not ( = ?auto_812997 ?auto_812998 ) ) ( not ( = ?auto_812997 ?auto_812999 ) ) ( not ( = ?auto_812997 ?auto_813000 ) ) ( not ( = ?auto_812998 ?auto_812999 ) ) ( not ( = ?auto_812998 ?auto_813000 ) ) ( not ( = ?auto_812999 ?auto_813000 ) ) ( ON ?auto_812998 ?auto_812999 ) ( ON ?auto_812997 ?auto_812998 ) ( CLEAR ?auto_812995 ) ( ON ?auto_812996 ?auto_812997 ) ( CLEAR ?auto_812996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_812987 ?auto_812988 ?auto_812989 ?auto_812990 ?auto_812991 ?auto_812992 ?auto_812993 ?auto_812994 ?auto_812995 ?auto_812996 )
      ( MAKE-13PILE ?auto_812987 ?auto_812988 ?auto_812989 ?auto_812990 ?auto_812991 ?auto_812992 ?auto_812993 ?auto_812994 ?auto_812995 ?auto_812996 ?auto_812997 ?auto_812998 ?auto_812999 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813041 - BLOCK
      ?auto_813042 - BLOCK
      ?auto_813043 - BLOCK
      ?auto_813044 - BLOCK
      ?auto_813045 - BLOCK
      ?auto_813046 - BLOCK
      ?auto_813047 - BLOCK
      ?auto_813048 - BLOCK
      ?auto_813049 - BLOCK
      ?auto_813050 - BLOCK
      ?auto_813051 - BLOCK
      ?auto_813052 - BLOCK
      ?auto_813053 - BLOCK
    )
    :vars
    (
      ?auto_813054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813053 ?auto_813054 ) ( ON-TABLE ?auto_813041 ) ( ON ?auto_813042 ?auto_813041 ) ( ON ?auto_813043 ?auto_813042 ) ( ON ?auto_813044 ?auto_813043 ) ( ON ?auto_813045 ?auto_813044 ) ( ON ?auto_813046 ?auto_813045 ) ( ON ?auto_813047 ?auto_813046 ) ( ON ?auto_813048 ?auto_813047 ) ( not ( = ?auto_813041 ?auto_813042 ) ) ( not ( = ?auto_813041 ?auto_813043 ) ) ( not ( = ?auto_813041 ?auto_813044 ) ) ( not ( = ?auto_813041 ?auto_813045 ) ) ( not ( = ?auto_813041 ?auto_813046 ) ) ( not ( = ?auto_813041 ?auto_813047 ) ) ( not ( = ?auto_813041 ?auto_813048 ) ) ( not ( = ?auto_813041 ?auto_813049 ) ) ( not ( = ?auto_813041 ?auto_813050 ) ) ( not ( = ?auto_813041 ?auto_813051 ) ) ( not ( = ?auto_813041 ?auto_813052 ) ) ( not ( = ?auto_813041 ?auto_813053 ) ) ( not ( = ?auto_813041 ?auto_813054 ) ) ( not ( = ?auto_813042 ?auto_813043 ) ) ( not ( = ?auto_813042 ?auto_813044 ) ) ( not ( = ?auto_813042 ?auto_813045 ) ) ( not ( = ?auto_813042 ?auto_813046 ) ) ( not ( = ?auto_813042 ?auto_813047 ) ) ( not ( = ?auto_813042 ?auto_813048 ) ) ( not ( = ?auto_813042 ?auto_813049 ) ) ( not ( = ?auto_813042 ?auto_813050 ) ) ( not ( = ?auto_813042 ?auto_813051 ) ) ( not ( = ?auto_813042 ?auto_813052 ) ) ( not ( = ?auto_813042 ?auto_813053 ) ) ( not ( = ?auto_813042 ?auto_813054 ) ) ( not ( = ?auto_813043 ?auto_813044 ) ) ( not ( = ?auto_813043 ?auto_813045 ) ) ( not ( = ?auto_813043 ?auto_813046 ) ) ( not ( = ?auto_813043 ?auto_813047 ) ) ( not ( = ?auto_813043 ?auto_813048 ) ) ( not ( = ?auto_813043 ?auto_813049 ) ) ( not ( = ?auto_813043 ?auto_813050 ) ) ( not ( = ?auto_813043 ?auto_813051 ) ) ( not ( = ?auto_813043 ?auto_813052 ) ) ( not ( = ?auto_813043 ?auto_813053 ) ) ( not ( = ?auto_813043 ?auto_813054 ) ) ( not ( = ?auto_813044 ?auto_813045 ) ) ( not ( = ?auto_813044 ?auto_813046 ) ) ( not ( = ?auto_813044 ?auto_813047 ) ) ( not ( = ?auto_813044 ?auto_813048 ) ) ( not ( = ?auto_813044 ?auto_813049 ) ) ( not ( = ?auto_813044 ?auto_813050 ) ) ( not ( = ?auto_813044 ?auto_813051 ) ) ( not ( = ?auto_813044 ?auto_813052 ) ) ( not ( = ?auto_813044 ?auto_813053 ) ) ( not ( = ?auto_813044 ?auto_813054 ) ) ( not ( = ?auto_813045 ?auto_813046 ) ) ( not ( = ?auto_813045 ?auto_813047 ) ) ( not ( = ?auto_813045 ?auto_813048 ) ) ( not ( = ?auto_813045 ?auto_813049 ) ) ( not ( = ?auto_813045 ?auto_813050 ) ) ( not ( = ?auto_813045 ?auto_813051 ) ) ( not ( = ?auto_813045 ?auto_813052 ) ) ( not ( = ?auto_813045 ?auto_813053 ) ) ( not ( = ?auto_813045 ?auto_813054 ) ) ( not ( = ?auto_813046 ?auto_813047 ) ) ( not ( = ?auto_813046 ?auto_813048 ) ) ( not ( = ?auto_813046 ?auto_813049 ) ) ( not ( = ?auto_813046 ?auto_813050 ) ) ( not ( = ?auto_813046 ?auto_813051 ) ) ( not ( = ?auto_813046 ?auto_813052 ) ) ( not ( = ?auto_813046 ?auto_813053 ) ) ( not ( = ?auto_813046 ?auto_813054 ) ) ( not ( = ?auto_813047 ?auto_813048 ) ) ( not ( = ?auto_813047 ?auto_813049 ) ) ( not ( = ?auto_813047 ?auto_813050 ) ) ( not ( = ?auto_813047 ?auto_813051 ) ) ( not ( = ?auto_813047 ?auto_813052 ) ) ( not ( = ?auto_813047 ?auto_813053 ) ) ( not ( = ?auto_813047 ?auto_813054 ) ) ( not ( = ?auto_813048 ?auto_813049 ) ) ( not ( = ?auto_813048 ?auto_813050 ) ) ( not ( = ?auto_813048 ?auto_813051 ) ) ( not ( = ?auto_813048 ?auto_813052 ) ) ( not ( = ?auto_813048 ?auto_813053 ) ) ( not ( = ?auto_813048 ?auto_813054 ) ) ( not ( = ?auto_813049 ?auto_813050 ) ) ( not ( = ?auto_813049 ?auto_813051 ) ) ( not ( = ?auto_813049 ?auto_813052 ) ) ( not ( = ?auto_813049 ?auto_813053 ) ) ( not ( = ?auto_813049 ?auto_813054 ) ) ( not ( = ?auto_813050 ?auto_813051 ) ) ( not ( = ?auto_813050 ?auto_813052 ) ) ( not ( = ?auto_813050 ?auto_813053 ) ) ( not ( = ?auto_813050 ?auto_813054 ) ) ( not ( = ?auto_813051 ?auto_813052 ) ) ( not ( = ?auto_813051 ?auto_813053 ) ) ( not ( = ?auto_813051 ?auto_813054 ) ) ( not ( = ?auto_813052 ?auto_813053 ) ) ( not ( = ?auto_813052 ?auto_813054 ) ) ( not ( = ?auto_813053 ?auto_813054 ) ) ( ON ?auto_813052 ?auto_813053 ) ( ON ?auto_813051 ?auto_813052 ) ( ON ?auto_813050 ?auto_813051 ) ( CLEAR ?auto_813048 ) ( ON ?auto_813049 ?auto_813050 ) ( CLEAR ?auto_813049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_813041 ?auto_813042 ?auto_813043 ?auto_813044 ?auto_813045 ?auto_813046 ?auto_813047 ?auto_813048 ?auto_813049 )
      ( MAKE-13PILE ?auto_813041 ?auto_813042 ?auto_813043 ?auto_813044 ?auto_813045 ?auto_813046 ?auto_813047 ?auto_813048 ?auto_813049 ?auto_813050 ?auto_813051 ?auto_813052 ?auto_813053 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813095 - BLOCK
      ?auto_813096 - BLOCK
      ?auto_813097 - BLOCK
      ?auto_813098 - BLOCK
      ?auto_813099 - BLOCK
      ?auto_813100 - BLOCK
      ?auto_813101 - BLOCK
      ?auto_813102 - BLOCK
      ?auto_813103 - BLOCK
      ?auto_813104 - BLOCK
      ?auto_813105 - BLOCK
      ?auto_813106 - BLOCK
      ?auto_813107 - BLOCK
    )
    :vars
    (
      ?auto_813108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813107 ?auto_813108 ) ( ON-TABLE ?auto_813095 ) ( ON ?auto_813096 ?auto_813095 ) ( ON ?auto_813097 ?auto_813096 ) ( ON ?auto_813098 ?auto_813097 ) ( ON ?auto_813099 ?auto_813098 ) ( ON ?auto_813100 ?auto_813099 ) ( ON ?auto_813101 ?auto_813100 ) ( not ( = ?auto_813095 ?auto_813096 ) ) ( not ( = ?auto_813095 ?auto_813097 ) ) ( not ( = ?auto_813095 ?auto_813098 ) ) ( not ( = ?auto_813095 ?auto_813099 ) ) ( not ( = ?auto_813095 ?auto_813100 ) ) ( not ( = ?auto_813095 ?auto_813101 ) ) ( not ( = ?auto_813095 ?auto_813102 ) ) ( not ( = ?auto_813095 ?auto_813103 ) ) ( not ( = ?auto_813095 ?auto_813104 ) ) ( not ( = ?auto_813095 ?auto_813105 ) ) ( not ( = ?auto_813095 ?auto_813106 ) ) ( not ( = ?auto_813095 ?auto_813107 ) ) ( not ( = ?auto_813095 ?auto_813108 ) ) ( not ( = ?auto_813096 ?auto_813097 ) ) ( not ( = ?auto_813096 ?auto_813098 ) ) ( not ( = ?auto_813096 ?auto_813099 ) ) ( not ( = ?auto_813096 ?auto_813100 ) ) ( not ( = ?auto_813096 ?auto_813101 ) ) ( not ( = ?auto_813096 ?auto_813102 ) ) ( not ( = ?auto_813096 ?auto_813103 ) ) ( not ( = ?auto_813096 ?auto_813104 ) ) ( not ( = ?auto_813096 ?auto_813105 ) ) ( not ( = ?auto_813096 ?auto_813106 ) ) ( not ( = ?auto_813096 ?auto_813107 ) ) ( not ( = ?auto_813096 ?auto_813108 ) ) ( not ( = ?auto_813097 ?auto_813098 ) ) ( not ( = ?auto_813097 ?auto_813099 ) ) ( not ( = ?auto_813097 ?auto_813100 ) ) ( not ( = ?auto_813097 ?auto_813101 ) ) ( not ( = ?auto_813097 ?auto_813102 ) ) ( not ( = ?auto_813097 ?auto_813103 ) ) ( not ( = ?auto_813097 ?auto_813104 ) ) ( not ( = ?auto_813097 ?auto_813105 ) ) ( not ( = ?auto_813097 ?auto_813106 ) ) ( not ( = ?auto_813097 ?auto_813107 ) ) ( not ( = ?auto_813097 ?auto_813108 ) ) ( not ( = ?auto_813098 ?auto_813099 ) ) ( not ( = ?auto_813098 ?auto_813100 ) ) ( not ( = ?auto_813098 ?auto_813101 ) ) ( not ( = ?auto_813098 ?auto_813102 ) ) ( not ( = ?auto_813098 ?auto_813103 ) ) ( not ( = ?auto_813098 ?auto_813104 ) ) ( not ( = ?auto_813098 ?auto_813105 ) ) ( not ( = ?auto_813098 ?auto_813106 ) ) ( not ( = ?auto_813098 ?auto_813107 ) ) ( not ( = ?auto_813098 ?auto_813108 ) ) ( not ( = ?auto_813099 ?auto_813100 ) ) ( not ( = ?auto_813099 ?auto_813101 ) ) ( not ( = ?auto_813099 ?auto_813102 ) ) ( not ( = ?auto_813099 ?auto_813103 ) ) ( not ( = ?auto_813099 ?auto_813104 ) ) ( not ( = ?auto_813099 ?auto_813105 ) ) ( not ( = ?auto_813099 ?auto_813106 ) ) ( not ( = ?auto_813099 ?auto_813107 ) ) ( not ( = ?auto_813099 ?auto_813108 ) ) ( not ( = ?auto_813100 ?auto_813101 ) ) ( not ( = ?auto_813100 ?auto_813102 ) ) ( not ( = ?auto_813100 ?auto_813103 ) ) ( not ( = ?auto_813100 ?auto_813104 ) ) ( not ( = ?auto_813100 ?auto_813105 ) ) ( not ( = ?auto_813100 ?auto_813106 ) ) ( not ( = ?auto_813100 ?auto_813107 ) ) ( not ( = ?auto_813100 ?auto_813108 ) ) ( not ( = ?auto_813101 ?auto_813102 ) ) ( not ( = ?auto_813101 ?auto_813103 ) ) ( not ( = ?auto_813101 ?auto_813104 ) ) ( not ( = ?auto_813101 ?auto_813105 ) ) ( not ( = ?auto_813101 ?auto_813106 ) ) ( not ( = ?auto_813101 ?auto_813107 ) ) ( not ( = ?auto_813101 ?auto_813108 ) ) ( not ( = ?auto_813102 ?auto_813103 ) ) ( not ( = ?auto_813102 ?auto_813104 ) ) ( not ( = ?auto_813102 ?auto_813105 ) ) ( not ( = ?auto_813102 ?auto_813106 ) ) ( not ( = ?auto_813102 ?auto_813107 ) ) ( not ( = ?auto_813102 ?auto_813108 ) ) ( not ( = ?auto_813103 ?auto_813104 ) ) ( not ( = ?auto_813103 ?auto_813105 ) ) ( not ( = ?auto_813103 ?auto_813106 ) ) ( not ( = ?auto_813103 ?auto_813107 ) ) ( not ( = ?auto_813103 ?auto_813108 ) ) ( not ( = ?auto_813104 ?auto_813105 ) ) ( not ( = ?auto_813104 ?auto_813106 ) ) ( not ( = ?auto_813104 ?auto_813107 ) ) ( not ( = ?auto_813104 ?auto_813108 ) ) ( not ( = ?auto_813105 ?auto_813106 ) ) ( not ( = ?auto_813105 ?auto_813107 ) ) ( not ( = ?auto_813105 ?auto_813108 ) ) ( not ( = ?auto_813106 ?auto_813107 ) ) ( not ( = ?auto_813106 ?auto_813108 ) ) ( not ( = ?auto_813107 ?auto_813108 ) ) ( ON ?auto_813106 ?auto_813107 ) ( ON ?auto_813105 ?auto_813106 ) ( ON ?auto_813104 ?auto_813105 ) ( ON ?auto_813103 ?auto_813104 ) ( CLEAR ?auto_813101 ) ( ON ?auto_813102 ?auto_813103 ) ( CLEAR ?auto_813102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_813095 ?auto_813096 ?auto_813097 ?auto_813098 ?auto_813099 ?auto_813100 ?auto_813101 ?auto_813102 )
      ( MAKE-13PILE ?auto_813095 ?auto_813096 ?auto_813097 ?auto_813098 ?auto_813099 ?auto_813100 ?auto_813101 ?auto_813102 ?auto_813103 ?auto_813104 ?auto_813105 ?auto_813106 ?auto_813107 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813149 - BLOCK
      ?auto_813150 - BLOCK
      ?auto_813151 - BLOCK
      ?auto_813152 - BLOCK
      ?auto_813153 - BLOCK
      ?auto_813154 - BLOCK
      ?auto_813155 - BLOCK
      ?auto_813156 - BLOCK
      ?auto_813157 - BLOCK
      ?auto_813158 - BLOCK
      ?auto_813159 - BLOCK
      ?auto_813160 - BLOCK
      ?auto_813161 - BLOCK
    )
    :vars
    (
      ?auto_813162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813161 ?auto_813162 ) ( ON-TABLE ?auto_813149 ) ( ON ?auto_813150 ?auto_813149 ) ( ON ?auto_813151 ?auto_813150 ) ( ON ?auto_813152 ?auto_813151 ) ( ON ?auto_813153 ?auto_813152 ) ( ON ?auto_813154 ?auto_813153 ) ( not ( = ?auto_813149 ?auto_813150 ) ) ( not ( = ?auto_813149 ?auto_813151 ) ) ( not ( = ?auto_813149 ?auto_813152 ) ) ( not ( = ?auto_813149 ?auto_813153 ) ) ( not ( = ?auto_813149 ?auto_813154 ) ) ( not ( = ?auto_813149 ?auto_813155 ) ) ( not ( = ?auto_813149 ?auto_813156 ) ) ( not ( = ?auto_813149 ?auto_813157 ) ) ( not ( = ?auto_813149 ?auto_813158 ) ) ( not ( = ?auto_813149 ?auto_813159 ) ) ( not ( = ?auto_813149 ?auto_813160 ) ) ( not ( = ?auto_813149 ?auto_813161 ) ) ( not ( = ?auto_813149 ?auto_813162 ) ) ( not ( = ?auto_813150 ?auto_813151 ) ) ( not ( = ?auto_813150 ?auto_813152 ) ) ( not ( = ?auto_813150 ?auto_813153 ) ) ( not ( = ?auto_813150 ?auto_813154 ) ) ( not ( = ?auto_813150 ?auto_813155 ) ) ( not ( = ?auto_813150 ?auto_813156 ) ) ( not ( = ?auto_813150 ?auto_813157 ) ) ( not ( = ?auto_813150 ?auto_813158 ) ) ( not ( = ?auto_813150 ?auto_813159 ) ) ( not ( = ?auto_813150 ?auto_813160 ) ) ( not ( = ?auto_813150 ?auto_813161 ) ) ( not ( = ?auto_813150 ?auto_813162 ) ) ( not ( = ?auto_813151 ?auto_813152 ) ) ( not ( = ?auto_813151 ?auto_813153 ) ) ( not ( = ?auto_813151 ?auto_813154 ) ) ( not ( = ?auto_813151 ?auto_813155 ) ) ( not ( = ?auto_813151 ?auto_813156 ) ) ( not ( = ?auto_813151 ?auto_813157 ) ) ( not ( = ?auto_813151 ?auto_813158 ) ) ( not ( = ?auto_813151 ?auto_813159 ) ) ( not ( = ?auto_813151 ?auto_813160 ) ) ( not ( = ?auto_813151 ?auto_813161 ) ) ( not ( = ?auto_813151 ?auto_813162 ) ) ( not ( = ?auto_813152 ?auto_813153 ) ) ( not ( = ?auto_813152 ?auto_813154 ) ) ( not ( = ?auto_813152 ?auto_813155 ) ) ( not ( = ?auto_813152 ?auto_813156 ) ) ( not ( = ?auto_813152 ?auto_813157 ) ) ( not ( = ?auto_813152 ?auto_813158 ) ) ( not ( = ?auto_813152 ?auto_813159 ) ) ( not ( = ?auto_813152 ?auto_813160 ) ) ( not ( = ?auto_813152 ?auto_813161 ) ) ( not ( = ?auto_813152 ?auto_813162 ) ) ( not ( = ?auto_813153 ?auto_813154 ) ) ( not ( = ?auto_813153 ?auto_813155 ) ) ( not ( = ?auto_813153 ?auto_813156 ) ) ( not ( = ?auto_813153 ?auto_813157 ) ) ( not ( = ?auto_813153 ?auto_813158 ) ) ( not ( = ?auto_813153 ?auto_813159 ) ) ( not ( = ?auto_813153 ?auto_813160 ) ) ( not ( = ?auto_813153 ?auto_813161 ) ) ( not ( = ?auto_813153 ?auto_813162 ) ) ( not ( = ?auto_813154 ?auto_813155 ) ) ( not ( = ?auto_813154 ?auto_813156 ) ) ( not ( = ?auto_813154 ?auto_813157 ) ) ( not ( = ?auto_813154 ?auto_813158 ) ) ( not ( = ?auto_813154 ?auto_813159 ) ) ( not ( = ?auto_813154 ?auto_813160 ) ) ( not ( = ?auto_813154 ?auto_813161 ) ) ( not ( = ?auto_813154 ?auto_813162 ) ) ( not ( = ?auto_813155 ?auto_813156 ) ) ( not ( = ?auto_813155 ?auto_813157 ) ) ( not ( = ?auto_813155 ?auto_813158 ) ) ( not ( = ?auto_813155 ?auto_813159 ) ) ( not ( = ?auto_813155 ?auto_813160 ) ) ( not ( = ?auto_813155 ?auto_813161 ) ) ( not ( = ?auto_813155 ?auto_813162 ) ) ( not ( = ?auto_813156 ?auto_813157 ) ) ( not ( = ?auto_813156 ?auto_813158 ) ) ( not ( = ?auto_813156 ?auto_813159 ) ) ( not ( = ?auto_813156 ?auto_813160 ) ) ( not ( = ?auto_813156 ?auto_813161 ) ) ( not ( = ?auto_813156 ?auto_813162 ) ) ( not ( = ?auto_813157 ?auto_813158 ) ) ( not ( = ?auto_813157 ?auto_813159 ) ) ( not ( = ?auto_813157 ?auto_813160 ) ) ( not ( = ?auto_813157 ?auto_813161 ) ) ( not ( = ?auto_813157 ?auto_813162 ) ) ( not ( = ?auto_813158 ?auto_813159 ) ) ( not ( = ?auto_813158 ?auto_813160 ) ) ( not ( = ?auto_813158 ?auto_813161 ) ) ( not ( = ?auto_813158 ?auto_813162 ) ) ( not ( = ?auto_813159 ?auto_813160 ) ) ( not ( = ?auto_813159 ?auto_813161 ) ) ( not ( = ?auto_813159 ?auto_813162 ) ) ( not ( = ?auto_813160 ?auto_813161 ) ) ( not ( = ?auto_813160 ?auto_813162 ) ) ( not ( = ?auto_813161 ?auto_813162 ) ) ( ON ?auto_813160 ?auto_813161 ) ( ON ?auto_813159 ?auto_813160 ) ( ON ?auto_813158 ?auto_813159 ) ( ON ?auto_813157 ?auto_813158 ) ( ON ?auto_813156 ?auto_813157 ) ( CLEAR ?auto_813154 ) ( ON ?auto_813155 ?auto_813156 ) ( CLEAR ?auto_813155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_813149 ?auto_813150 ?auto_813151 ?auto_813152 ?auto_813153 ?auto_813154 ?auto_813155 )
      ( MAKE-13PILE ?auto_813149 ?auto_813150 ?auto_813151 ?auto_813152 ?auto_813153 ?auto_813154 ?auto_813155 ?auto_813156 ?auto_813157 ?auto_813158 ?auto_813159 ?auto_813160 ?auto_813161 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813203 - BLOCK
      ?auto_813204 - BLOCK
      ?auto_813205 - BLOCK
      ?auto_813206 - BLOCK
      ?auto_813207 - BLOCK
      ?auto_813208 - BLOCK
      ?auto_813209 - BLOCK
      ?auto_813210 - BLOCK
      ?auto_813211 - BLOCK
      ?auto_813212 - BLOCK
      ?auto_813213 - BLOCK
      ?auto_813214 - BLOCK
      ?auto_813215 - BLOCK
    )
    :vars
    (
      ?auto_813216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813215 ?auto_813216 ) ( ON-TABLE ?auto_813203 ) ( ON ?auto_813204 ?auto_813203 ) ( ON ?auto_813205 ?auto_813204 ) ( ON ?auto_813206 ?auto_813205 ) ( ON ?auto_813207 ?auto_813206 ) ( not ( = ?auto_813203 ?auto_813204 ) ) ( not ( = ?auto_813203 ?auto_813205 ) ) ( not ( = ?auto_813203 ?auto_813206 ) ) ( not ( = ?auto_813203 ?auto_813207 ) ) ( not ( = ?auto_813203 ?auto_813208 ) ) ( not ( = ?auto_813203 ?auto_813209 ) ) ( not ( = ?auto_813203 ?auto_813210 ) ) ( not ( = ?auto_813203 ?auto_813211 ) ) ( not ( = ?auto_813203 ?auto_813212 ) ) ( not ( = ?auto_813203 ?auto_813213 ) ) ( not ( = ?auto_813203 ?auto_813214 ) ) ( not ( = ?auto_813203 ?auto_813215 ) ) ( not ( = ?auto_813203 ?auto_813216 ) ) ( not ( = ?auto_813204 ?auto_813205 ) ) ( not ( = ?auto_813204 ?auto_813206 ) ) ( not ( = ?auto_813204 ?auto_813207 ) ) ( not ( = ?auto_813204 ?auto_813208 ) ) ( not ( = ?auto_813204 ?auto_813209 ) ) ( not ( = ?auto_813204 ?auto_813210 ) ) ( not ( = ?auto_813204 ?auto_813211 ) ) ( not ( = ?auto_813204 ?auto_813212 ) ) ( not ( = ?auto_813204 ?auto_813213 ) ) ( not ( = ?auto_813204 ?auto_813214 ) ) ( not ( = ?auto_813204 ?auto_813215 ) ) ( not ( = ?auto_813204 ?auto_813216 ) ) ( not ( = ?auto_813205 ?auto_813206 ) ) ( not ( = ?auto_813205 ?auto_813207 ) ) ( not ( = ?auto_813205 ?auto_813208 ) ) ( not ( = ?auto_813205 ?auto_813209 ) ) ( not ( = ?auto_813205 ?auto_813210 ) ) ( not ( = ?auto_813205 ?auto_813211 ) ) ( not ( = ?auto_813205 ?auto_813212 ) ) ( not ( = ?auto_813205 ?auto_813213 ) ) ( not ( = ?auto_813205 ?auto_813214 ) ) ( not ( = ?auto_813205 ?auto_813215 ) ) ( not ( = ?auto_813205 ?auto_813216 ) ) ( not ( = ?auto_813206 ?auto_813207 ) ) ( not ( = ?auto_813206 ?auto_813208 ) ) ( not ( = ?auto_813206 ?auto_813209 ) ) ( not ( = ?auto_813206 ?auto_813210 ) ) ( not ( = ?auto_813206 ?auto_813211 ) ) ( not ( = ?auto_813206 ?auto_813212 ) ) ( not ( = ?auto_813206 ?auto_813213 ) ) ( not ( = ?auto_813206 ?auto_813214 ) ) ( not ( = ?auto_813206 ?auto_813215 ) ) ( not ( = ?auto_813206 ?auto_813216 ) ) ( not ( = ?auto_813207 ?auto_813208 ) ) ( not ( = ?auto_813207 ?auto_813209 ) ) ( not ( = ?auto_813207 ?auto_813210 ) ) ( not ( = ?auto_813207 ?auto_813211 ) ) ( not ( = ?auto_813207 ?auto_813212 ) ) ( not ( = ?auto_813207 ?auto_813213 ) ) ( not ( = ?auto_813207 ?auto_813214 ) ) ( not ( = ?auto_813207 ?auto_813215 ) ) ( not ( = ?auto_813207 ?auto_813216 ) ) ( not ( = ?auto_813208 ?auto_813209 ) ) ( not ( = ?auto_813208 ?auto_813210 ) ) ( not ( = ?auto_813208 ?auto_813211 ) ) ( not ( = ?auto_813208 ?auto_813212 ) ) ( not ( = ?auto_813208 ?auto_813213 ) ) ( not ( = ?auto_813208 ?auto_813214 ) ) ( not ( = ?auto_813208 ?auto_813215 ) ) ( not ( = ?auto_813208 ?auto_813216 ) ) ( not ( = ?auto_813209 ?auto_813210 ) ) ( not ( = ?auto_813209 ?auto_813211 ) ) ( not ( = ?auto_813209 ?auto_813212 ) ) ( not ( = ?auto_813209 ?auto_813213 ) ) ( not ( = ?auto_813209 ?auto_813214 ) ) ( not ( = ?auto_813209 ?auto_813215 ) ) ( not ( = ?auto_813209 ?auto_813216 ) ) ( not ( = ?auto_813210 ?auto_813211 ) ) ( not ( = ?auto_813210 ?auto_813212 ) ) ( not ( = ?auto_813210 ?auto_813213 ) ) ( not ( = ?auto_813210 ?auto_813214 ) ) ( not ( = ?auto_813210 ?auto_813215 ) ) ( not ( = ?auto_813210 ?auto_813216 ) ) ( not ( = ?auto_813211 ?auto_813212 ) ) ( not ( = ?auto_813211 ?auto_813213 ) ) ( not ( = ?auto_813211 ?auto_813214 ) ) ( not ( = ?auto_813211 ?auto_813215 ) ) ( not ( = ?auto_813211 ?auto_813216 ) ) ( not ( = ?auto_813212 ?auto_813213 ) ) ( not ( = ?auto_813212 ?auto_813214 ) ) ( not ( = ?auto_813212 ?auto_813215 ) ) ( not ( = ?auto_813212 ?auto_813216 ) ) ( not ( = ?auto_813213 ?auto_813214 ) ) ( not ( = ?auto_813213 ?auto_813215 ) ) ( not ( = ?auto_813213 ?auto_813216 ) ) ( not ( = ?auto_813214 ?auto_813215 ) ) ( not ( = ?auto_813214 ?auto_813216 ) ) ( not ( = ?auto_813215 ?auto_813216 ) ) ( ON ?auto_813214 ?auto_813215 ) ( ON ?auto_813213 ?auto_813214 ) ( ON ?auto_813212 ?auto_813213 ) ( ON ?auto_813211 ?auto_813212 ) ( ON ?auto_813210 ?auto_813211 ) ( ON ?auto_813209 ?auto_813210 ) ( CLEAR ?auto_813207 ) ( ON ?auto_813208 ?auto_813209 ) ( CLEAR ?auto_813208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_813203 ?auto_813204 ?auto_813205 ?auto_813206 ?auto_813207 ?auto_813208 )
      ( MAKE-13PILE ?auto_813203 ?auto_813204 ?auto_813205 ?auto_813206 ?auto_813207 ?auto_813208 ?auto_813209 ?auto_813210 ?auto_813211 ?auto_813212 ?auto_813213 ?auto_813214 ?auto_813215 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813257 - BLOCK
      ?auto_813258 - BLOCK
      ?auto_813259 - BLOCK
      ?auto_813260 - BLOCK
      ?auto_813261 - BLOCK
      ?auto_813262 - BLOCK
      ?auto_813263 - BLOCK
      ?auto_813264 - BLOCK
      ?auto_813265 - BLOCK
      ?auto_813266 - BLOCK
      ?auto_813267 - BLOCK
      ?auto_813268 - BLOCK
      ?auto_813269 - BLOCK
    )
    :vars
    (
      ?auto_813270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813269 ?auto_813270 ) ( ON-TABLE ?auto_813257 ) ( ON ?auto_813258 ?auto_813257 ) ( ON ?auto_813259 ?auto_813258 ) ( ON ?auto_813260 ?auto_813259 ) ( not ( = ?auto_813257 ?auto_813258 ) ) ( not ( = ?auto_813257 ?auto_813259 ) ) ( not ( = ?auto_813257 ?auto_813260 ) ) ( not ( = ?auto_813257 ?auto_813261 ) ) ( not ( = ?auto_813257 ?auto_813262 ) ) ( not ( = ?auto_813257 ?auto_813263 ) ) ( not ( = ?auto_813257 ?auto_813264 ) ) ( not ( = ?auto_813257 ?auto_813265 ) ) ( not ( = ?auto_813257 ?auto_813266 ) ) ( not ( = ?auto_813257 ?auto_813267 ) ) ( not ( = ?auto_813257 ?auto_813268 ) ) ( not ( = ?auto_813257 ?auto_813269 ) ) ( not ( = ?auto_813257 ?auto_813270 ) ) ( not ( = ?auto_813258 ?auto_813259 ) ) ( not ( = ?auto_813258 ?auto_813260 ) ) ( not ( = ?auto_813258 ?auto_813261 ) ) ( not ( = ?auto_813258 ?auto_813262 ) ) ( not ( = ?auto_813258 ?auto_813263 ) ) ( not ( = ?auto_813258 ?auto_813264 ) ) ( not ( = ?auto_813258 ?auto_813265 ) ) ( not ( = ?auto_813258 ?auto_813266 ) ) ( not ( = ?auto_813258 ?auto_813267 ) ) ( not ( = ?auto_813258 ?auto_813268 ) ) ( not ( = ?auto_813258 ?auto_813269 ) ) ( not ( = ?auto_813258 ?auto_813270 ) ) ( not ( = ?auto_813259 ?auto_813260 ) ) ( not ( = ?auto_813259 ?auto_813261 ) ) ( not ( = ?auto_813259 ?auto_813262 ) ) ( not ( = ?auto_813259 ?auto_813263 ) ) ( not ( = ?auto_813259 ?auto_813264 ) ) ( not ( = ?auto_813259 ?auto_813265 ) ) ( not ( = ?auto_813259 ?auto_813266 ) ) ( not ( = ?auto_813259 ?auto_813267 ) ) ( not ( = ?auto_813259 ?auto_813268 ) ) ( not ( = ?auto_813259 ?auto_813269 ) ) ( not ( = ?auto_813259 ?auto_813270 ) ) ( not ( = ?auto_813260 ?auto_813261 ) ) ( not ( = ?auto_813260 ?auto_813262 ) ) ( not ( = ?auto_813260 ?auto_813263 ) ) ( not ( = ?auto_813260 ?auto_813264 ) ) ( not ( = ?auto_813260 ?auto_813265 ) ) ( not ( = ?auto_813260 ?auto_813266 ) ) ( not ( = ?auto_813260 ?auto_813267 ) ) ( not ( = ?auto_813260 ?auto_813268 ) ) ( not ( = ?auto_813260 ?auto_813269 ) ) ( not ( = ?auto_813260 ?auto_813270 ) ) ( not ( = ?auto_813261 ?auto_813262 ) ) ( not ( = ?auto_813261 ?auto_813263 ) ) ( not ( = ?auto_813261 ?auto_813264 ) ) ( not ( = ?auto_813261 ?auto_813265 ) ) ( not ( = ?auto_813261 ?auto_813266 ) ) ( not ( = ?auto_813261 ?auto_813267 ) ) ( not ( = ?auto_813261 ?auto_813268 ) ) ( not ( = ?auto_813261 ?auto_813269 ) ) ( not ( = ?auto_813261 ?auto_813270 ) ) ( not ( = ?auto_813262 ?auto_813263 ) ) ( not ( = ?auto_813262 ?auto_813264 ) ) ( not ( = ?auto_813262 ?auto_813265 ) ) ( not ( = ?auto_813262 ?auto_813266 ) ) ( not ( = ?auto_813262 ?auto_813267 ) ) ( not ( = ?auto_813262 ?auto_813268 ) ) ( not ( = ?auto_813262 ?auto_813269 ) ) ( not ( = ?auto_813262 ?auto_813270 ) ) ( not ( = ?auto_813263 ?auto_813264 ) ) ( not ( = ?auto_813263 ?auto_813265 ) ) ( not ( = ?auto_813263 ?auto_813266 ) ) ( not ( = ?auto_813263 ?auto_813267 ) ) ( not ( = ?auto_813263 ?auto_813268 ) ) ( not ( = ?auto_813263 ?auto_813269 ) ) ( not ( = ?auto_813263 ?auto_813270 ) ) ( not ( = ?auto_813264 ?auto_813265 ) ) ( not ( = ?auto_813264 ?auto_813266 ) ) ( not ( = ?auto_813264 ?auto_813267 ) ) ( not ( = ?auto_813264 ?auto_813268 ) ) ( not ( = ?auto_813264 ?auto_813269 ) ) ( not ( = ?auto_813264 ?auto_813270 ) ) ( not ( = ?auto_813265 ?auto_813266 ) ) ( not ( = ?auto_813265 ?auto_813267 ) ) ( not ( = ?auto_813265 ?auto_813268 ) ) ( not ( = ?auto_813265 ?auto_813269 ) ) ( not ( = ?auto_813265 ?auto_813270 ) ) ( not ( = ?auto_813266 ?auto_813267 ) ) ( not ( = ?auto_813266 ?auto_813268 ) ) ( not ( = ?auto_813266 ?auto_813269 ) ) ( not ( = ?auto_813266 ?auto_813270 ) ) ( not ( = ?auto_813267 ?auto_813268 ) ) ( not ( = ?auto_813267 ?auto_813269 ) ) ( not ( = ?auto_813267 ?auto_813270 ) ) ( not ( = ?auto_813268 ?auto_813269 ) ) ( not ( = ?auto_813268 ?auto_813270 ) ) ( not ( = ?auto_813269 ?auto_813270 ) ) ( ON ?auto_813268 ?auto_813269 ) ( ON ?auto_813267 ?auto_813268 ) ( ON ?auto_813266 ?auto_813267 ) ( ON ?auto_813265 ?auto_813266 ) ( ON ?auto_813264 ?auto_813265 ) ( ON ?auto_813263 ?auto_813264 ) ( ON ?auto_813262 ?auto_813263 ) ( CLEAR ?auto_813260 ) ( ON ?auto_813261 ?auto_813262 ) ( CLEAR ?auto_813261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_813257 ?auto_813258 ?auto_813259 ?auto_813260 ?auto_813261 )
      ( MAKE-13PILE ?auto_813257 ?auto_813258 ?auto_813259 ?auto_813260 ?auto_813261 ?auto_813262 ?auto_813263 ?auto_813264 ?auto_813265 ?auto_813266 ?auto_813267 ?auto_813268 ?auto_813269 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813311 - BLOCK
      ?auto_813312 - BLOCK
      ?auto_813313 - BLOCK
      ?auto_813314 - BLOCK
      ?auto_813315 - BLOCK
      ?auto_813316 - BLOCK
      ?auto_813317 - BLOCK
      ?auto_813318 - BLOCK
      ?auto_813319 - BLOCK
      ?auto_813320 - BLOCK
      ?auto_813321 - BLOCK
      ?auto_813322 - BLOCK
      ?auto_813323 - BLOCK
    )
    :vars
    (
      ?auto_813324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813323 ?auto_813324 ) ( ON-TABLE ?auto_813311 ) ( ON ?auto_813312 ?auto_813311 ) ( ON ?auto_813313 ?auto_813312 ) ( not ( = ?auto_813311 ?auto_813312 ) ) ( not ( = ?auto_813311 ?auto_813313 ) ) ( not ( = ?auto_813311 ?auto_813314 ) ) ( not ( = ?auto_813311 ?auto_813315 ) ) ( not ( = ?auto_813311 ?auto_813316 ) ) ( not ( = ?auto_813311 ?auto_813317 ) ) ( not ( = ?auto_813311 ?auto_813318 ) ) ( not ( = ?auto_813311 ?auto_813319 ) ) ( not ( = ?auto_813311 ?auto_813320 ) ) ( not ( = ?auto_813311 ?auto_813321 ) ) ( not ( = ?auto_813311 ?auto_813322 ) ) ( not ( = ?auto_813311 ?auto_813323 ) ) ( not ( = ?auto_813311 ?auto_813324 ) ) ( not ( = ?auto_813312 ?auto_813313 ) ) ( not ( = ?auto_813312 ?auto_813314 ) ) ( not ( = ?auto_813312 ?auto_813315 ) ) ( not ( = ?auto_813312 ?auto_813316 ) ) ( not ( = ?auto_813312 ?auto_813317 ) ) ( not ( = ?auto_813312 ?auto_813318 ) ) ( not ( = ?auto_813312 ?auto_813319 ) ) ( not ( = ?auto_813312 ?auto_813320 ) ) ( not ( = ?auto_813312 ?auto_813321 ) ) ( not ( = ?auto_813312 ?auto_813322 ) ) ( not ( = ?auto_813312 ?auto_813323 ) ) ( not ( = ?auto_813312 ?auto_813324 ) ) ( not ( = ?auto_813313 ?auto_813314 ) ) ( not ( = ?auto_813313 ?auto_813315 ) ) ( not ( = ?auto_813313 ?auto_813316 ) ) ( not ( = ?auto_813313 ?auto_813317 ) ) ( not ( = ?auto_813313 ?auto_813318 ) ) ( not ( = ?auto_813313 ?auto_813319 ) ) ( not ( = ?auto_813313 ?auto_813320 ) ) ( not ( = ?auto_813313 ?auto_813321 ) ) ( not ( = ?auto_813313 ?auto_813322 ) ) ( not ( = ?auto_813313 ?auto_813323 ) ) ( not ( = ?auto_813313 ?auto_813324 ) ) ( not ( = ?auto_813314 ?auto_813315 ) ) ( not ( = ?auto_813314 ?auto_813316 ) ) ( not ( = ?auto_813314 ?auto_813317 ) ) ( not ( = ?auto_813314 ?auto_813318 ) ) ( not ( = ?auto_813314 ?auto_813319 ) ) ( not ( = ?auto_813314 ?auto_813320 ) ) ( not ( = ?auto_813314 ?auto_813321 ) ) ( not ( = ?auto_813314 ?auto_813322 ) ) ( not ( = ?auto_813314 ?auto_813323 ) ) ( not ( = ?auto_813314 ?auto_813324 ) ) ( not ( = ?auto_813315 ?auto_813316 ) ) ( not ( = ?auto_813315 ?auto_813317 ) ) ( not ( = ?auto_813315 ?auto_813318 ) ) ( not ( = ?auto_813315 ?auto_813319 ) ) ( not ( = ?auto_813315 ?auto_813320 ) ) ( not ( = ?auto_813315 ?auto_813321 ) ) ( not ( = ?auto_813315 ?auto_813322 ) ) ( not ( = ?auto_813315 ?auto_813323 ) ) ( not ( = ?auto_813315 ?auto_813324 ) ) ( not ( = ?auto_813316 ?auto_813317 ) ) ( not ( = ?auto_813316 ?auto_813318 ) ) ( not ( = ?auto_813316 ?auto_813319 ) ) ( not ( = ?auto_813316 ?auto_813320 ) ) ( not ( = ?auto_813316 ?auto_813321 ) ) ( not ( = ?auto_813316 ?auto_813322 ) ) ( not ( = ?auto_813316 ?auto_813323 ) ) ( not ( = ?auto_813316 ?auto_813324 ) ) ( not ( = ?auto_813317 ?auto_813318 ) ) ( not ( = ?auto_813317 ?auto_813319 ) ) ( not ( = ?auto_813317 ?auto_813320 ) ) ( not ( = ?auto_813317 ?auto_813321 ) ) ( not ( = ?auto_813317 ?auto_813322 ) ) ( not ( = ?auto_813317 ?auto_813323 ) ) ( not ( = ?auto_813317 ?auto_813324 ) ) ( not ( = ?auto_813318 ?auto_813319 ) ) ( not ( = ?auto_813318 ?auto_813320 ) ) ( not ( = ?auto_813318 ?auto_813321 ) ) ( not ( = ?auto_813318 ?auto_813322 ) ) ( not ( = ?auto_813318 ?auto_813323 ) ) ( not ( = ?auto_813318 ?auto_813324 ) ) ( not ( = ?auto_813319 ?auto_813320 ) ) ( not ( = ?auto_813319 ?auto_813321 ) ) ( not ( = ?auto_813319 ?auto_813322 ) ) ( not ( = ?auto_813319 ?auto_813323 ) ) ( not ( = ?auto_813319 ?auto_813324 ) ) ( not ( = ?auto_813320 ?auto_813321 ) ) ( not ( = ?auto_813320 ?auto_813322 ) ) ( not ( = ?auto_813320 ?auto_813323 ) ) ( not ( = ?auto_813320 ?auto_813324 ) ) ( not ( = ?auto_813321 ?auto_813322 ) ) ( not ( = ?auto_813321 ?auto_813323 ) ) ( not ( = ?auto_813321 ?auto_813324 ) ) ( not ( = ?auto_813322 ?auto_813323 ) ) ( not ( = ?auto_813322 ?auto_813324 ) ) ( not ( = ?auto_813323 ?auto_813324 ) ) ( ON ?auto_813322 ?auto_813323 ) ( ON ?auto_813321 ?auto_813322 ) ( ON ?auto_813320 ?auto_813321 ) ( ON ?auto_813319 ?auto_813320 ) ( ON ?auto_813318 ?auto_813319 ) ( ON ?auto_813317 ?auto_813318 ) ( ON ?auto_813316 ?auto_813317 ) ( ON ?auto_813315 ?auto_813316 ) ( CLEAR ?auto_813313 ) ( ON ?auto_813314 ?auto_813315 ) ( CLEAR ?auto_813314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_813311 ?auto_813312 ?auto_813313 ?auto_813314 )
      ( MAKE-13PILE ?auto_813311 ?auto_813312 ?auto_813313 ?auto_813314 ?auto_813315 ?auto_813316 ?auto_813317 ?auto_813318 ?auto_813319 ?auto_813320 ?auto_813321 ?auto_813322 ?auto_813323 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813365 - BLOCK
      ?auto_813366 - BLOCK
      ?auto_813367 - BLOCK
      ?auto_813368 - BLOCK
      ?auto_813369 - BLOCK
      ?auto_813370 - BLOCK
      ?auto_813371 - BLOCK
      ?auto_813372 - BLOCK
      ?auto_813373 - BLOCK
      ?auto_813374 - BLOCK
      ?auto_813375 - BLOCK
      ?auto_813376 - BLOCK
      ?auto_813377 - BLOCK
    )
    :vars
    (
      ?auto_813378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813377 ?auto_813378 ) ( ON-TABLE ?auto_813365 ) ( ON ?auto_813366 ?auto_813365 ) ( not ( = ?auto_813365 ?auto_813366 ) ) ( not ( = ?auto_813365 ?auto_813367 ) ) ( not ( = ?auto_813365 ?auto_813368 ) ) ( not ( = ?auto_813365 ?auto_813369 ) ) ( not ( = ?auto_813365 ?auto_813370 ) ) ( not ( = ?auto_813365 ?auto_813371 ) ) ( not ( = ?auto_813365 ?auto_813372 ) ) ( not ( = ?auto_813365 ?auto_813373 ) ) ( not ( = ?auto_813365 ?auto_813374 ) ) ( not ( = ?auto_813365 ?auto_813375 ) ) ( not ( = ?auto_813365 ?auto_813376 ) ) ( not ( = ?auto_813365 ?auto_813377 ) ) ( not ( = ?auto_813365 ?auto_813378 ) ) ( not ( = ?auto_813366 ?auto_813367 ) ) ( not ( = ?auto_813366 ?auto_813368 ) ) ( not ( = ?auto_813366 ?auto_813369 ) ) ( not ( = ?auto_813366 ?auto_813370 ) ) ( not ( = ?auto_813366 ?auto_813371 ) ) ( not ( = ?auto_813366 ?auto_813372 ) ) ( not ( = ?auto_813366 ?auto_813373 ) ) ( not ( = ?auto_813366 ?auto_813374 ) ) ( not ( = ?auto_813366 ?auto_813375 ) ) ( not ( = ?auto_813366 ?auto_813376 ) ) ( not ( = ?auto_813366 ?auto_813377 ) ) ( not ( = ?auto_813366 ?auto_813378 ) ) ( not ( = ?auto_813367 ?auto_813368 ) ) ( not ( = ?auto_813367 ?auto_813369 ) ) ( not ( = ?auto_813367 ?auto_813370 ) ) ( not ( = ?auto_813367 ?auto_813371 ) ) ( not ( = ?auto_813367 ?auto_813372 ) ) ( not ( = ?auto_813367 ?auto_813373 ) ) ( not ( = ?auto_813367 ?auto_813374 ) ) ( not ( = ?auto_813367 ?auto_813375 ) ) ( not ( = ?auto_813367 ?auto_813376 ) ) ( not ( = ?auto_813367 ?auto_813377 ) ) ( not ( = ?auto_813367 ?auto_813378 ) ) ( not ( = ?auto_813368 ?auto_813369 ) ) ( not ( = ?auto_813368 ?auto_813370 ) ) ( not ( = ?auto_813368 ?auto_813371 ) ) ( not ( = ?auto_813368 ?auto_813372 ) ) ( not ( = ?auto_813368 ?auto_813373 ) ) ( not ( = ?auto_813368 ?auto_813374 ) ) ( not ( = ?auto_813368 ?auto_813375 ) ) ( not ( = ?auto_813368 ?auto_813376 ) ) ( not ( = ?auto_813368 ?auto_813377 ) ) ( not ( = ?auto_813368 ?auto_813378 ) ) ( not ( = ?auto_813369 ?auto_813370 ) ) ( not ( = ?auto_813369 ?auto_813371 ) ) ( not ( = ?auto_813369 ?auto_813372 ) ) ( not ( = ?auto_813369 ?auto_813373 ) ) ( not ( = ?auto_813369 ?auto_813374 ) ) ( not ( = ?auto_813369 ?auto_813375 ) ) ( not ( = ?auto_813369 ?auto_813376 ) ) ( not ( = ?auto_813369 ?auto_813377 ) ) ( not ( = ?auto_813369 ?auto_813378 ) ) ( not ( = ?auto_813370 ?auto_813371 ) ) ( not ( = ?auto_813370 ?auto_813372 ) ) ( not ( = ?auto_813370 ?auto_813373 ) ) ( not ( = ?auto_813370 ?auto_813374 ) ) ( not ( = ?auto_813370 ?auto_813375 ) ) ( not ( = ?auto_813370 ?auto_813376 ) ) ( not ( = ?auto_813370 ?auto_813377 ) ) ( not ( = ?auto_813370 ?auto_813378 ) ) ( not ( = ?auto_813371 ?auto_813372 ) ) ( not ( = ?auto_813371 ?auto_813373 ) ) ( not ( = ?auto_813371 ?auto_813374 ) ) ( not ( = ?auto_813371 ?auto_813375 ) ) ( not ( = ?auto_813371 ?auto_813376 ) ) ( not ( = ?auto_813371 ?auto_813377 ) ) ( not ( = ?auto_813371 ?auto_813378 ) ) ( not ( = ?auto_813372 ?auto_813373 ) ) ( not ( = ?auto_813372 ?auto_813374 ) ) ( not ( = ?auto_813372 ?auto_813375 ) ) ( not ( = ?auto_813372 ?auto_813376 ) ) ( not ( = ?auto_813372 ?auto_813377 ) ) ( not ( = ?auto_813372 ?auto_813378 ) ) ( not ( = ?auto_813373 ?auto_813374 ) ) ( not ( = ?auto_813373 ?auto_813375 ) ) ( not ( = ?auto_813373 ?auto_813376 ) ) ( not ( = ?auto_813373 ?auto_813377 ) ) ( not ( = ?auto_813373 ?auto_813378 ) ) ( not ( = ?auto_813374 ?auto_813375 ) ) ( not ( = ?auto_813374 ?auto_813376 ) ) ( not ( = ?auto_813374 ?auto_813377 ) ) ( not ( = ?auto_813374 ?auto_813378 ) ) ( not ( = ?auto_813375 ?auto_813376 ) ) ( not ( = ?auto_813375 ?auto_813377 ) ) ( not ( = ?auto_813375 ?auto_813378 ) ) ( not ( = ?auto_813376 ?auto_813377 ) ) ( not ( = ?auto_813376 ?auto_813378 ) ) ( not ( = ?auto_813377 ?auto_813378 ) ) ( ON ?auto_813376 ?auto_813377 ) ( ON ?auto_813375 ?auto_813376 ) ( ON ?auto_813374 ?auto_813375 ) ( ON ?auto_813373 ?auto_813374 ) ( ON ?auto_813372 ?auto_813373 ) ( ON ?auto_813371 ?auto_813372 ) ( ON ?auto_813370 ?auto_813371 ) ( ON ?auto_813369 ?auto_813370 ) ( ON ?auto_813368 ?auto_813369 ) ( CLEAR ?auto_813366 ) ( ON ?auto_813367 ?auto_813368 ) ( CLEAR ?auto_813367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_813365 ?auto_813366 ?auto_813367 )
      ( MAKE-13PILE ?auto_813365 ?auto_813366 ?auto_813367 ?auto_813368 ?auto_813369 ?auto_813370 ?auto_813371 ?auto_813372 ?auto_813373 ?auto_813374 ?auto_813375 ?auto_813376 ?auto_813377 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813419 - BLOCK
      ?auto_813420 - BLOCK
      ?auto_813421 - BLOCK
      ?auto_813422 - BLOCK
      ?auto_813423 - BLOCK
      ?auto_813424 - BLOCK
      ?auto_813425 - BLOCK
      ?auto_813426 - BLOCK
      ?auto_813427 - BLOCK
      ?auto_813428 - BLOCK
      ?auto_813429 - BLOCK
      ?auto_813430 - BLOCK
      ?auto_813431 - BLOCK
    )
    :vars
    (
      ?auto_813432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813431 ?auto_813432 ) ( ON-TABLE ?auto_813419 ) ( not ( = ?auto_813419 ?auto_813420 ) ) ( not ( = ?auto_813419 ?auto_813421 ) ) ( not ( = ?auto_813419 ?auto_813422 ) ) ( not ( = ?auto_813419 ?auto_813423 ) ) ( not ( = ?auto_813419 ?auto_813424 ) ) ( not ( = ?auto_813419 ?auto_813425 ) ) ( not ( = ?auto_813419 ?auto_813426 ) ) ( not ( = ?auto_813419 ?auto_813427 ) ) ( not ( = ?auto_813419 ?auto_813428 ) ) ( not ( = ?auto_813419 ?auto_813429 ) ) ( not ( = ?auto_813419 ?auto_813430 ) ) ( not ( = ?auto_813419 ?auto_813431 ) ) ( not ( = ?auto_813419 ?auto_813432 ) ) ( not ( = ?auto_813420 ?auto_813421 ) ) ( not ( = ?auto_813420 ?auto_813422 ) ) ( not ( = ?auto_813420 ?auto_813423 ) ) ( not ( = ?auto_813420 ?auto_813424 ) ) ( not ( = ?auto_813420 ?auto_813425 ) ) ( not ( = ?auto_813420 ?auto_813426 ) ) ( not ( = ?auto_813420 ?auto_813427 ) ) ( not ( = ?auto_813420 ?auto_813428 ) ) ( not ( = ?auto_813420 ?auto_813429 ) ) ( not ( = ?auto_813420 ?auto_813430 ) ) ( not ( = ?auto_813420 ?auto_813431 ) ) ( not ( = ?auto_813420 ?auto_813432 ) ) ( not ( = ?auto_813421 ?auto_813422 ) ) ( not ( = ?auto_813421 ?auto_813423 ) ) ( not ( = ?auto_813421 ?auto_813424 ) ) ( not ( = ?auto_813421 ?auto_813425 ) ) ( not ( = ?auto_813421 ?auto_813426 ) ) ( not ( = ?auto_813421 ?auto_813427 ) ) ( not ( = ?auto_813421 ?auto_813428 ) ) ( not ( = ?auto_813421 ?auto_813429 ) ) ( not ( = ?auto_813421 ?auto_813430 ) ) ( not ( = ?auto_813421 ?auto_813431 ) ) ( not ( = ?auto_813421 ?auto_813432 ) ) ( not ( = ?auto_813422 ?auto_813423 ) ) ( not ( = ?auto_813422 ?auto_813424 ) ) ( not ( = ?auto_813422 ?auto_813425 ) ) ( not ( = ?auto_813422 ?auto_813426 ) ) ( not ( = ?auto_813422 ?auto_813427 ) ) ( not ( = ?auto_813422 ?auto_813428 ) ) ( not ( = ?auto_813422 ?auto_813429 ) ) ( not ( = ?auto_813422 ?auto_813430 ) ) ( not ( = ?auto_813422 ?auto_813431 ) ) ( not ( = ?auto_813422 ?auto_813432 ) ) ( not ( = ?auto_813423 ?auto_813424 ) ) ( not ( = ?auto_813423 ?auto_813425 ) ) ( not ( = ?auto_813423 ?auto_813426 ) ) ( not ( = ?auto_813423 ?auto_813427 ) ) ( not ( = ?auto_813423 ?auto_813428 ) ) ( not ( = ?auto_813423 ?auto_813429 ) ) ( not ( = ?auto_813423 ?auto_813430 ) ) ( not ( = ?auto_813423 ?auto_813431 ) ) ( not ( = ?auto_813423 ?auto_813432 ) ) ( not ( = ?auto_813424 ?auto_813425 ) ) ( not ( = ?auto_813424 ?auto_813426 ) ) ( not ( = ?auto_813424 ?auto_813427 ) ) ( not ( = ?auto_813424 ?auto_813428 ) ) ( not ( = ?auto_813424 ?auto_813429 ) ) ( not ( = ?auto_813424 ?auto_813430 ) ) ( not ( = ?auto_813424 ?auto_813431 ) ) ( not ( = ?auto_813424 ?auto_813432 ) ) ( not ( = ?auto_813425 ?auto_813426 ) ) ( not ( = ?auto_813425 ?auto_813427 ) ) ( not ( = ?auto_813425 ?auto_813428 ) ) ( not ( = ?auto_813425 ?auto_813429 ) ) ( not ( = ?auto_813425 ?auto_813430 ) ) ( not ( = ?auto_813425 ?auto_813431 ) ) ( not ( = ?auto_813425 ?auto_813432 ) ) ( not ( = ?auto_813426 ?auto_813427 ) ) ( not ( = ?auto_813426 ?auto_813428 ) ) ( not ( = ?auto_813426 ?auto_813429 ) ) ( not ( = ?auto_813426 ?auto_813430 ) ) ( not ( = ?auto_813426 ?auto_813431 ) ) ( not ( = ?auto_813426 ?auto_813432 ) ) ( not ( = ?auto_813427 ?auto_813428 ) ) ( not ( = ?auto_813427 ?auto_813429 ) ) ( not ( = ?auto_813427 ?auto_813430 ) ) ( not ( = ?auto_813427 ?auto_813431 ) ) ( not ( = ?auto_813427 ?auto_813432 ) ) ( not ( = ?auto_813428 ?auto_813429 ) ) ( not ( = ?auto_813428 ?auto_813430 ) ) ( not ( = ?auto_813428 ?auto_813431 ) ) ( not ( = ?auto_813428 ?auto_813432 ) ) ( not ( = ?auto_813429 ?auto_813430 ) ) ( not ( = ?auto_813429 ?auto_813431 ) ) ( not ( = ?auto_813429 ?auto_813432 ) ) ( not ( = ?auto_813430 ?auto_813431 ) ) ( not ( = ?auto_813430 ?auto_813432 ) ) ( not ( = ?auto_813431 ?auto_813432 ) ) ( ON ?auto_813430 ?auto_813431 ) ( ON ?auto_813429 ?auto_813430 ) ( ON ?auto_813428 ?auto_813429 ) ( ON ?auto_813427 ?auto_813428 ) ( ON ?auto_813426 ?auto_813427 ) ( ON ?auto_813425 ?auto_813426 ) ( ON ?auto_813424 ?auto_813425 ) ( ON ?auto_813423 ?auto_813424 ) ( ON ?auto_813422 ?auto_813423 ) ( ON ?auto_813421 ?auto_813422 ) ( CLEAR ?auto_813419 ) ( ON ?auto_813420 ?auto_813421 ) ( CLEAR ?auto_813420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_813419 ?auto_813420 )
      ( MAKE-13PILE ?auto_813419 ?auto_813420 ?auto_813421 ?auto_813422 ?auto_813423 ?auto_813424 ?auto_813425 ?auto_813426 ?auto_813427 ?auto_813428 ?auto_813429 ?auto_813430 ?auto_813431 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_813473 - BLOCK
      ?auto_813474 - BLOCK
      ?auto_813475 - BLOCK
      ?auto_813476 - BLOCK
      ?auto_813477 - BLOCK
      ?auto_813478 - BLOCK
      ?auto_813479 - BLOCK
      ?auto_813480 - BLOCK
      ?auto_813481 - BLOCK
      ?auto_813482 - BLOCK
      ?auto_813483 - BLOCK
      ?auto_813484 - BLOCK
      ?auto_813485 - BLOCK
    )
    :vars
    (
      ?auto_813486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813485 ?auto_813486 ) ( not ( = ?auto_813473 ?auto_813474 ) ) ( not ( = ?auto_813473 ?auto_813475 ) ) ( not ( = ?auto_813473 ?auto_813476 ) ) ( not ( = ?auto_813473 ?auto_813477 ) ) ( not ( = ?auto_813473 ?auto_813478 ) ) ( not ( = ?auto_813473 ?auto_813479 ) ) ( not ( = ?auto_813473 ?auto_813480 ) ) ( not ( = ?auto_813473 ?auto_813481 ) ) ( not ( = ?auto_813473 ?auto_813482 ) ) ( not ( = ?auto_813473 ?auto_813483 ) ) ( not ( = ?auto_813473 ?auto_813484 ) ) ( not ( = ?auto_813473 ?auto_813485 ) ) ( not ( = ?auto_813473 ?auto_813486 ) ) ( not ( = ?auto_813474 ?auto_813475 ) ) ( not ( = ?auto_813474 ?auto_813476 ) ) ( not ( = ?auto_813474 ?auto_813477 ) ) ( not ( = ?auto_813474 ?auto_813478 ) ) ( not ( = ?auto_813474 ?auto_813479 ) ) ( not ( = ?auto_813474 ?auto_813480 ) ) ( not ( = ?auto_813474 ?auto_813481 ) ) ( not ( = ?auto_813474 ?auto_813482 ) ) ( not ( = ?auto_813474 ?auto_813483 ) ) ( not ( = ?auto_813474 ?auto_813484 ) ) ( not ( = ?auto_813474 ?auto_813485 ) ) ( not ( = ?auto_813474 ?auto_813486 ) ) ( not ( = ?auto_813475 ?auto_813476 ) ) ( not ( = ?auto_813475 ?auto_813477 ) ) ( not ( = ?auto_813475 ?auto_813478 ) ) ( not ( = ?auto_813475 ?auto_813479 ) ) ( not ( = ?auto_813475 ?auto_813480 ) ) ( not ( = ?auto_813475 ?auto_813481 ) ) ( not ( = ?auto_813475 ?auto_813482 ) ) ( not ( = ?auto_813475 ?auto_813483 ) ) ( not ( = ?auto_813475 ?auto_813484 ) ) ( not ( = ?auto_813475 ?auto_813485 ) ) ( not ( = ?auto_813475 ?auto_813486 ) ) ( not ( = ?auto_813476 ?auto_813477 ) ) ( not ( = ?auto_813476 ?auto_813478 ) ) ( not ( = ?auto_813476 ?auto_813479 ) ) ( not ( = ?auto_813476 ?auto_813480 ) ) ( not ( = ?auto_813476 ?auto_813481 ) ) ( not ( = ?auto_813476 ?auto_813482 ) ) ( not ( = ?auto_813476 ?auto_813483 ) ) ( not ( = ?auto_813476 ?auto_813484 ) ) ( not ( = ?auto_813476 ?auto_813485 ) ) ( not ( = ?auto_813476 ?auto_813486 ) ) ( not ( = ?auto_813477 ?auto_813478 ) ) ( not ( = ?auto_813477 ?auto_813479 ) ) ( not ( = ?auto_813477 ?auto_813480 ) ) ( not ( = ?auto_813477 ?auto_813481 ) ) ( not ( = ?auto_813477 ?auto_813482 ) ) ( not ( = ?auto_813477 ?auto_813483 ) ) ( not ( = ?auto_813477 ?auto_813484 ) ) ( not ( = ?auto_813477 ?auto_813485 ) ) ( not ( = ?auto_813477 ?auto_813486 ) ) ( not ( = ?auto_813478 ?auto_813479 ) ) ( not ( = ?auto_813478 ?auto_813480 ) ) ( not ( = ?auto_813478 ?auto_813481 ) ) ( not ( = ?auto_813478 ?auto_813482 ) ) ( not ( = ?auto_813478 ?auto_813483 ) ) ( not ( = ?auto_813478 ?auto_813484 ) ) ( not ( = ?auto_813478 ?auto_813485 ) ) ( not ( = ?auto_813478 ?auto_813486 ) ) ( not ( = ?auto_813479 ?auto_813480 ) ) ( not ( = ?auto_813479 ?auto_813481 ) ) ( not ( = ?auto_813479 ?auto_813482 ) ) ( not ( = ?auto_813479 ?auto_813483 ) ) ( not ( = ?auto_813479 ?auto_813484 ) ) ( not ( = ?auto_813479 ?auto_813485 ) ) ( not ( = ?auto_813479 ?auto_813486 ) ) ( not ( = ?auto_813480 ?auto_813481 ) ) ( not ( = ?auto_813480 ?auto_813482 ) ) ( not ( = ?auto_813480 ?auto_813483 ) ) ( not ( = ?auto_813480 ?auto_813484 ) ) ( not ( = ?auto_813480 ?auto_813485 ) ) ( not ( = ?auto_813480 ?auto_813486 ) ) ( not ( = ?auto_813481 ?auto_813482 ) ) ( not ( = ?auto_813481 ?auto_813483 ) ) ( not ( = ?auto_813481 ?auto_813484 ) ) ( not ( = ?auto_813481 ?auto_813485 ) ) ( not ( = ?auto_813481 ?auto_813486 ) ) ( not ( = ?auto_813482 ?auto_813483 ) ) ( not ( = ?auto_813482 ?auto_813484 ) ) ( not ( = ?auto_813482 ?auto_813485 ) ) ( not ( = ?auto_813482 ?auto_813486 ) ) ( not ( = ?auto_813483 ?auto_813484 ) ) ( not ( = ?auto_813483 ?auto_813485 ) ) ( not ( = ?auto_813483 ?auto_813486 ) ) ( not ( = ?auto_813484 ?auto_813485 ) ) ( not ( = ?auto_813484 ?auto_813486 ) ) ( not ( = ?auto_813485 ?auto_813486 ) ) ( ON ?auto_813484 ?auto_813485 ) ( ON ?auto_813483 ?auto_813484 ) ( ON ?auto_813482 ?auto_813483 ) ( ON ?auto_813481 ?auto_813482 ) ( ON ?auto_813480 ?auto_813481 ) ( ON ?auto_813479 ?auto_813480 ) ( ON ?auto_813478 ?auto_813479 ) ( ON ?auto_813477 ?auto_813478 ) ( ON ?auto_813476 ?auto_813477 ) ( ON ?auto_813475 ?auto_813476 ) ( ON ?auto_813474 ?auto_813475 ) ( ON ?auto_813473 ?auto_813474 ) ( CLEAR ?auto_813473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_813473 )
      ( MAKE-13PILE ?auto_813473 ?auto_813474 ?auto_813475 ?auto_813476 ?auto_813477 ?auto_813478 ?auto_813479 ?auto_813480 ?auto_813481 ?auto_813482 ?auto_813483 ?auto_813484 ?auto_813485 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813528 - BLOCK
      ?auto_813529 - BLOCK
      ?auto_813530 - BLOCK
      ?auto_813531 - BLOCK
      ?auto_813532 - BLOCK
      ?auto_813533 - BLOCK
      ?auto_813534 - BLOCK
      ?auto_813535 - BLOCK
      ?auto_813536 - BLOCK
      ?auto_813537 - BLOCK
      ?auto_813538 - BLOCK
      ?auto_813539 - BLOCK
      ?auto_813540 - BLOCK
      ?auto_813541 - BLOCK
    )
    :vars
    (
      ?auto_813542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_813540 ) ( ON ?auto_813541 ?auto_813542 ) ( CLEAR ?auto_813541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_813528 ) ( ON ?auto_813529 ?auto_813528 ) ( ON ?auto_813530 ?auto_813529 ) ( ON ?auto_813531 ?auto_813530 ) ( ON ?auto_813532 ?auto_813531 ) ( ON ?auto_813533 ?auto_813532 ) ( ON ?auto_813534 ?auto_813533 ) ( ON ?auto_813535 ?auto_813534 ) ( ON ?auto_813536 ?auto_813535 ) ( ON ?auto_813537 ?auto_813536 ) ( ON ?auto_813538 ?auto_813537 ) ( ON ?auto_813539 ?auto_813538 ) ( ON ?auto_813540 ?auto_813539 ) ( not ( = ?auto_813528 ?auto_813529 ) ) ( not ( = ?auto_813528 ?auto_813530 ) ) ( not ( = ?auto_813528 ?auto_813531 ) ) ( not ( = ?auto_813528 ?auto_813532 ) ) ( not ( = ?auto_813528 ?auto_813533 ) ) ( not ( = ?auto_813528 ?auto_813534 ) ) ( not ( = ?auto_813528 ?auto_813535 ) ) ( not ( = ?auto_813528 ?auto_813536 ) ) ( not ( = ?auto_813528 ?auto_813537 ) ) ( not ( = ?auto_813528 ?auto_813538 ) ) ( not ( = ?auto_813528 ?auto_813539 ) ) ( not ( = ?auto_813528 ?auto_813540 ) ) ( not ( = ?auto_813528 ?auto_813541 ) ) ( not ( = ?auto_813528 ?auto_813542 ) ) ( not ( = ?auto_813529 ?auto_813530 ) ) ( not ( = ?auto_813529 ?auto_813531 ) ) ( not ( = ?auto_813529 ?auto_813532 ) ) ( not ( = ?auto_813529 ?auto_813533 ) ) ( not ( = ?auto_813529 ?auto_813534 ) ) ( not ( = ?auto_813529 ?auto_813535 ) ) ( not ( = ?auto_813529 ?auto_813536 ) ) ( not ( = ?auto_813529 ?auto_813537 ) ) ( not ( = ?auto_813529 ?auto_813538 ) ) ( not ( = ?auto_813529 ?auto_813539 ) ) ( not ( = ?auto_813529 ?auto_813540 ) ) ( not ( = ?auto_813529 ?auto_813541 ) ) ( not ( = ?auto_813529 ?auto_813542 ) ) ( not ( = ?auto_813530 ?auto_813531 ) ) ( not ( = ?auto_813530 ?auto_813532 ) ) ( not ( = ?auto_813530 ?auto_813533 ) ) ( not ( = ?auto_813530 ?auto_813534 ) ) ( not ( = ?auto_813530 ?auto_813535 ) ) ( not ( = ?auto_813530 ?auto_813536 ) ) ( not ( = ?auto_813530 ?auto_813537 ) ) ( not ( = ?auto_813530 ?auto_813538 ) ) ( not ( = ?auto_813530 ?auto_813539 ) ) ( not ( = ?auto_813530 ?auto_813540 ) ) ( not ( = ?auto_813530 ?auto_813541 ) ) ( not ( = ?auto_813530 ?auto_813542 ) ) ( not ( = ?auto_813531 ?auto_813532 ) ) ( not ( = ?auto_813531 ?auto_813533 ) ) ( not ( = ?auto_813531 ?auto_813534 ) ) ( not ( = ?auto_813531 ?auto_813535 ) ) ( not ( = ?auto_813531 ?auto_813536 ) ) ( not ( = ?auto_813531 ?auto_813537 ) ) ( not ( = ?auto_813531 ?auto_813538 ) ) ( not ( = ?auto_813531 ?auto_813539 ) ) ( not ( = ?auto_813531 ?auto_813540 ) ) ( not ( = ?auto_813531 ?auto_813541 ) ) ( not ( = ?auto_813531 ?auto_813542 ) ) ( not ( = ?auto_813532 ?auto_813533 ) ) ( not ( = ?auto_813532 ?auto_813534 ) ) ( not ( = ?auto_813532 ?auto_813535 ) ) ( not ( = ?auto_813532 ?auto_813536 ) ) ( not ( = ?auto_813532 ?auto_813537 ) ) ( not ( = ?auto_813532 ?auto_813538 ) ) ( not ( = ?auto_813532 ?auto_813539 ) ) ( not ( = ?auto_813532 ?auto_813540 ) ) ( not ( = ?auto_813532 ?auto_813541 ) ) ( not ( = ?auto_813532 ?auto_813542 ) ) ( not ( = ?auto_813533 ?auto_813534 ) ) ( not ( = ?auto_813533 ?auto_813535 ) ) ( not ( = ?auto_813533 ?auto_813536 ) ) ( not ( = ?auto_813533 ?auto_813537 ) ) ( not ( = ?auto_813533 ?auto_813538 ) ) ( not ( = ?auto_813533 ?auto_813539 ) ) ( not ( = ?auto_813533 ?auto_813540 ) ) ( not ( = ?auto_813533 ?auto_813541 ) ) ( not ( = ?auto_813533 ?auto_813542 ) ) ( not ( = ?auto_813534 ?auto_813535 ) ) ( not ( = ?auto_813534 ?auto_813536 ) ) ( not ( = ?auto_813534 ?auto_813537 ) ) ( not ( = ?auto_813534 ?auto_813538 ) ) ( not ( = ?auto_813534 ?auto_813539 ) ) ( not ( = ?auto_813534 ?auto_813540 ) ) ( not ( = ?auto_813534 ?auto_813541 ) ) ( not ( = ?auto_813534 ?auto_813542 ) ) ( not ( = ?auto_813535 ?auto_813536 ) ) ( not ( = ?auto_813535 ?auto_813537 ) ) ( not ( = ?auto_813535 ?auto_813538 ) ) ( not ( = ?auto_813535 ?auto_813539 ) ) ( not ( = ?auto_813535 ?auto_813540 ) ) ( not ( = ?auto_813535 ?auto_813541 ) ) ( not ( = ?auto_813535 ?auto_813542 ) ) ( not ( = ?auto_813536 ?auto_813537 ) ) ( not ( = ?auto_813536 ?auto_813538 ) ) ( not ( = ?auto_813536 ?auto_813539 ) ) ( not ( = ?auto_813536 ?auto_813540 ) ) ( not ( = ?auto_813536 ?auto_813541 ) ) ( not ( = ?auto_813536 ?auto_813542 ) ) ( not ( = ?auto_813537 ?auto_813538 ) ) ( not ( = ?auto_813537 ?auto_813539 ) ) ( not ( = ?auto_813537 ?auto_813540 ) ) ( not ( = ?auto_813537 ?auto_813541 ) ) ( not ( = ?auto_813537 ?auto_813542 ) ) ( not ( = ?auto_813538 ?auto_813539 ) ) ( not ( = ?auto_813538 ?auto_813540 ) ) ( not ( = ?auto_813538 ?auto_813541 ) ) ( not ( = ?auto_813538 ?auto_813542 ) ) ( not ( = ?auto_813539 ?auto_813540 ) ) ( not ( = ?auto_813539 ?auto_813541 ) ) ( not ( = ?auto_813539 ?auto_813542 ) ) ( not ( = ?auto_813540 ?auto_813541 ) ) ( not ( = ?auto_813540 ?auto_813542 ) ) ( not ( = ?auto_813541 ?auto_813542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_813541 ?auto_813542 )
      ( !STACK ?auto_813541 ?auto_813540 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813586 - BLOCK
      ?auto_813587 - BLOCK
      ?auto_813588 - BLOCK
      ?auto_813589 - BLOCK
      ?auto_813590 - BLOCK
      ?auto_813591 - BLOCK
      ?auto_813592 - BLOCK
      ?auto_813593 - BLOCK
      ?auto_813594 - BLOCK
      ?auto_813595 - BLOCK
      ?auto_813596 - BLOCK
      ?auto_813597 - BLOCK
      ?auto_813598 - BLOCK
      ?auto_813599 - BLOCK
    )
    :vars
    (
      ?auto_813600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813599 ?auto_813600 ) ( ON-TABLE ?auto_813586 ) ( ON ?auto_813587 ?auto_813586 ) ( ON ?auto_813588 ?auto_813587 ) ( ON ?auto_813589 ?auto_813588 ) ( ON ?auto_813590 ?auto_813589 ) ( ON ?auto_813591 ?auto_813590 ) ( ON ?auto_813592 ?auto_813591 ) ( ON ?auto_813593 ?auto_813592 ) ( ON ?auto_813594 ?auto_813593 ) ( ON ?auto_813595 ?auto_813594 ) ( ON ?auto_813596 ?auto_813595 ) ( ON ?auto_813597 ?auto_813596 ) ( not ( = ?auto_813586 ?auto_813587 ) ) ( not ( = ?auto_813586 ?auto_813588 ) ) ( not ( = ?auto_813586 ?auto_813589 ) ) ( not ( = ?auto_813586 ?auto_813590 ) ) ( not ( = ?auto_813586 ?auto_813591 ) ) ( not ( = ?auto_813586 ?auto_813592 ) ) ( not ( = ?auto_813586 ?auto_813593 ) ) ( not ( = ?auto_813586 ?auto_813594 ) ) ( not ( = ?auto_813586 ?auto_813595 ) ) ( not ( = ?auto_813586 ?auto_813596 ) ) ( not ( = ?auto_813586 ?auto_813597 ) ) ( not ( = ?auto_813586 ?auto_813598 ) ) ( not ( = ?auto_813586 ?auto_813599 ) ) ( not ( = ?auto_813586 ?auto_813600 ) ) ( not ( = ?auto_813587 ?auto_813588 ) ) ( not ( = ?auto_813587 ?auto_813589 ) ) ( not ( = ?auto_813587 ?auto_813590 ) ) ( not ( = ?auto_813587 ?auto_813591 ) ) ( not ( = ?auto_813587 ?auto_813592 ) ) ( not ( = ?auto_813587 ?auto_813593 ) ) ( not ( = ?auto_813587 ?auto_813594 ) ) ( not ( = ?auto_813587 ?auto_813595 ) ) ( not ( = ?auto_813587 ?auto_813596 ) ) ( not ( = ?auto_813587 ?auto_813597 ) ) ( not ( = ?auto_813587 ?auto_813598 ) ) ( not ( = ?auto_813587 ?auto_813599 ) ) ( not ( = ?auto_813587 ?auto_813600 ) ) ( not ( = ?auto_813588 ?auto_813589 ) ) ( not ( = ?auto_813588 ?auto_813590 ) ) ( not ( = ?auto_813588 ?auto_813591 ) ) ( not ( = ?auto_813588 ?auto_813592 ) ) ( not ( = ?auto_813588 ?auto_813593 ) ) ( not ( = ?auto_813588 ?auto_813594 ) ) ( not ( = ?auto_813588 ?auto_813595 ) ) ( not ( = ?auto_813588 ?auto_813596 ) ) ( not ( = ?auto_813588 ?auto_813597 ) ) ( not ( = ?auto_813588 ?auto_813598 ) ) ( not ( = ?auto_813588 ?auto_813599 ) ) ( not ( = ?auto_813588 ?auto_813600 ) ) ( not ( = ?auto_813589 ?auto_813590 ) ) ( not ( = ?auto_813589 ?auto_813591 ) ) ( not ( = ?auto_813589 ?auto_813592 ) ) ( not ( = ?auto_813589 ?auto_813593 ) ) ( not ( = ?auto_813589 ?auto_813594 ) ) ( not ( = ?auto_813589 ?auto_813595 ) ) ( not ( = ?auto_813589 ?auto_813596 ) ) ( not ( = ?auto_813589 ?auto_813597 ) ) ( not ( = ?auto_813589 ?auto_813598 ) ) ( not ( = ?auto_813589 ?auto_813599 ) ) ( not ( = ?auto_813589 ?auto_813600 ) ) ( not ( = ?auto_813590 ?auto_813591 ) ) ( not ( = ?auto_813590 ?auto_813592 ) ) ( not ( = ?auto_813590 ?auto_813593 ) ) ( not ( = ?auto_813590 ?auto_813594 ) ) ( not ( = ?auto_813590 ?auto_813595 ) ) ( not ( = ?auto_813590 ?auto_813596 ) ) ( not ( = ?auto_813590 ?auto_813597 ) ) ( not ( = ?auto_813590 ?auto_813598 ) ) ( not ( = ?auto_813590 ?auto_813599 ) ) ( not ( = ?auto_813590 ?auto_813600 ) ) ( not ( = ?auto_813591 ?auto_813592 ) ) ( not ( = ?auto_813591 ?auto_813593 ) ) ( not ( = ?auto_813591 ?auto_813594 ) ) ( not ( = ?auto_813591 ?auto_813595 ) ) ( not ( = ?auto_813591 ?auto_813596 ) ) ( not ( = ?auto_813591 ?auto_813597 ) ) ( not ( = ?auto_813591 ?auto_813598 ) ) ( not ( = ?auto_813591 ?auto_813599 ) ) ( not ( = ?auto_813591 ?auto_813600 ) ) ( not ( = ?auto_813592 ?auto_813593 ) ) ( not ( = ?auto_813592 ?auto_813594 ) ) ( not ( = ?auto_813592 ?auto_813595 ) ) ( not ( = ?auto_813592 ?auto_813596 ) ) ( not ( = ?auto_813592 ?auto_813597 ) ) ( not ( = ?auto_813592 ?auto_813598 ) ) ( not ( = ?auto_813592 ?auto_813599 ) ) ( not ( = ?auto_813592 ?auto_813600 ) ) ( not ( = ?auto_813593 ?auto_813594 ) ) ( not ( = ?auto_813593 ?auto_813595 ) ) ( not ( = ?auto_813593 ?auto_813596 ) ) ( not ( = ?auto_813593 ?auto_813597 ) ) ( not ( = ?auto_813593 ?auto_813598 ) ) ( not ( = ?auto_813593 ?auto_813599 ) ) ( not ( = ?auto_813593 ?auto_813600 ) ) ( not ( = ?auto_813594 ?auto_813595 ) ) ( not ( = ?auto_813594 ?auto_813596 ) ) ( not ( = ?auto_813594 ?auto_813597 ) ) ( not ( = ?auto_813594 ?auto_813598 ) ) ( not ( = ?auto_813594 ?auto_813599 ) ) ( not ( = ?auto_813594 ?auto_813600 ) ) ( not ( = ?auto_813595 ?auto_813596 ) ) ( not ( = ?auto_813595 ?auto_813597 ) ) ( not ( = ?auto_813595 ?auto_813598 ) ) ( not ( = ?auto_813595 ?auto_813599 ) ) ( not ( = ?auto_813595 ?auto_813600 ) ) ( not ( = ?auto_813596 ?auto_813597 ) ) ( not ( = ?auto_813596 ?auto_813598 ) ) ( not ( = ?auto_813596 ?auto_813599 ) ) ( not ( = ?auto_813596 ?auto_813600 ) ) ( not ( = ?auto_813597 ?auto_813598 ) ) ( not ( = ?auto_813597 ?auto_813599 ) ) ( not ( = ?auto_813597 ?auto_813600 ) ) ( not ( = ?auto_813598 ?auto_813599 ) ) ( not ( = ?auto_813598 ?auto_813600 ) ) ( not ( = ?auto_813599 ?auto_813600 ) ) ( CLEAR ?auto_813597 ) ( ON ?auto_813598 ?auto_813599 ) ( CLEAR ?auto_813598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_813586 ?auto_813587 ?auto_813588 ?auto_813589 ?auto_813590 ?auto_813591 ?auto_813592 ?auto_813593 ?auto_813594 ?auto_813595 ?auto_813596 ?auto_813597 ?auto_813598 )
      ( MAKE-14PILE ?auto_813586 ?auto_813587 ?auto_813588 ?auto_813589 ?auto_813590 ?auto_813591 ?auto_813592 ?auto_813593 ?auto_813594 ?auto_813595 ?auto_813596 ?auto_813597 ?auto_813598 ?auto_813599 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813644 - BLOCK
      ?auto_813645 - BLOCK
      ?auto_813646 - BLOCK
      ?auto_813647 - BLOCK
      ?auto_813648 - BLOCK
      ?auto_813649 - BLOCK
      ?auto_813650 - BLOCK
      ?auto_813651 - BLOCK
      ?auto_813652 - BLOCK
      ?auto_813653 - BLOCK
      ?auto_813654 - BLOCK
      ?auto_813655 - BLOCK
      ?auto_813656 - BLOCK
      ?auto_813657 - BLOCK
    )
    :vars
    (
      ?auto_813658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813657 ?auto_813658 ) ( ON-TABLE ?auto_813644 ) ( ON ?auto_813645 ?auto_813644 ) ( ON ?auto_813646 ?auto_813645 ) ( ON ?auto_813647 ?auto_813646 ) ( ON ?auto_813648 ?auto_813647 ) ( ON ?auto_813649 ?auto_813648 ) ( ON ?auto_813650 ?auto_813649 ) ( ON ?auto_813651 ?auto_813650 ) ( ON ?auto_813652 ?auto_813651 ) ( ON ?auto_813653 ?auto_813652 ) ( ON ?auto_813654 ?auto_813653 ) ( not ( = ?auto_813644 ?auto_813645 ) ) ( not ( = ?auto_813644 ?auto_813646 ) ) ( not ( = ?auto_813644 ?auto_813647 ) ) ( not ( = ?auto_813644 ?auto_813648 ) ) ( not ( = ?auto_813644 ?auto_813649 ) ) ( not ( = ?auto_813644 ?auto_813650 ) ) ( not ( = ?auto_813644 ?auto_813651 ) ) ( not ( = ?auto_813644 ?auto_813652 ) ) ( not ( = ?auto_813644 ?auto_813653 ) ) ( not ( = ?auto_813644 ?auto_813654 ) ) ( not ( = ?auto_813644 ?auto_813655 ) ) ( not ( = ?auto_813644 ?auto_813656 ) ) ( not ( = ?auto_813644 ?auto_813657 ) ) ( not ( = ?auto_813644 ?auto_813658 ) ) ( not ( = ?auto_813645 ?auto_813646 ) ) ( not ( = ?auto_813645 ?auto_813647 ) ) ( not ( = ?auto_813645 ?auto_813648 ) ) ( not ( = ?auto_813645 ?auto_813649 ) ) ( not ( = ?auto_813645 ?auto_813650 ) ) ( not ( = ?auto_813645 ?auto_813651 ) ) ( not ( = ?auto_813645 ?auto_813652 ) ) ( not ( = ?auto_813645 ?auto_813653 ) ) ( not ( = ?auto_813645 ?auto_813654 ) ) ( not ( = ?auto_813645 ?auto_813655 ) ) ( not ( = ?auto_813645 ?auto_813656 ) ) ( not ( = ?auto_813645 ?auto_813657 ) ) ( not ( = ?auto_813645 ?auto_813658 ) ) ( not ( = ?auto_813646 ?auto_813647 ) ) ( not ( = ?auto_813646 ?auto_813648 ) ) ( not ( = ?auto_813646 ?auto_813649 ) ) ( not ( = ?auto_813646 ?auto_813650 ) ) ( not ( = ?auto_813646 ?auto_813651 ) ) ( not ( = ?auto_813646 ?auto_813652 ) ) ( not ( = ?auto_813646 ?auto_813653 ) ) ( not ( = ?auto_813646 ?auto_813654 ) ) ( not ( = ?auto_813646 ?auto_813655 ) ) ( not ( = ?auto_813646 ?auto_813656 ) ) ( not ( = ?auto_813646 ?auto_813657 ) ) ( not ( = ?auto_813646 ?auto_813658 ) ) ( not ( = ?auto_813647 ?auto_813648 ) ) ( not ( = ?auto_813647 ?auto_813649 ) ) ( not ( = ?auto_813647 ?auto_813650 ) ) ( not ( = ?auto_813647 ?auto_813651 ) ) ( not ( = ?auto_813647 ?auto_813652 ) ) ( not ( = ?auto_813647 ?auto_813653 ) ) ( not ( = ?auto_813647 ?auto_813654 ) ) ( not ( = ?auto_813647 ?auto_813655 ) ) ( not ( = ?auto_813647 ?auto_813656 ) ) ( not ( = ?auto_813647 ?auto_813657 ) ) ( not ( = ?auto_813647 ?auto_813658 ) ) ( not ( = ?auto_813648 ?auto_813649 ) ) ( not ( = ?auto_813648 ?auto_813650 ) ) ( not ( = ?auto_813648 ?auto_813651 ) ) ( not ( = ?auto_813648 ?auto_813652 ) ) ( not ( = ?auto_813648 ?auto_813653 ) ) ( not ( = ?auto_813648 ?auto_813654 ) ) ( not ( = ?auto_813648 ?auto_813655 ) ) ( not ( = ?auto_813648 ?auto_813656 ) ) ( not ( = ?auto_813648 ?auto_813657 ) ) ( not ( = ?auto_813648 ?auto_813658 ) ) ( not ( = ?auto_813649 ?auto_813650 ) ) ( not ( = ?auto_813649 ?auto_813651 ) ) ( not ( = ?auto_813649 ?auto_813652 ) ) ( not ( = ?auto_813649 ?auto_813653 ) ) ( not ( = ?auto_813649 ?auto_813654 ) ) ( not ( = ?auto_813649 ?auto_813655 ) ) ( not ( = ?auto_813649 ?auto_813656 ) ) ( not ( = ?auto_813649 ?auto_813657 ) ) ( not ( = ?auto_813649 ?auto_813658 ) ) ( not ( = ?auto_813650 ?auto_813651 ) ) ( not ( = ?auto_813650 ?auto_813652 ) ) ( not ( = ?auto_813650 ?auto_813653 ) ) ( not ( = ?auto_813650 ?auto_813654 ) ) ( not ( = ?auto_813650 ?auto_813655 ) ) ( not ( = ?auto_813650 ?auto_813656 ) ) ( not ( = ?auto_813650 ?auto_813657 ) ) ( not ( = ?auto_813650 ?auto_813658 ) ) ( not ( = ?auto_813651 ?auto_813652 ) ) ( not ( = ?auto_813651 ?auto_813653 ) ) ( not ( = ?auto_813651 ?auto_813654 ) ) ( not ( = ?auto_813651 ?auto_813655 ) ) ( not ( = ?auto_813651 ?auto_813656 ) ) ( not ( = ?auto_813651 ?auto_813657 ) ) ( not ( = ?auto_813651 ?auto_813658 ) ) ( not ( = ?auto_813652 ?auto_813653 ) ) ( not ( = ?auto_813652 ?auto_813654 ) ) ( not ( = ?auto_813652 ?auto_813655 ) ) ( not ( = ?auto_813652 ?auto_813656 ) ) ( not ( = ?auto_813652 ?auto_813657 ) ) ( not ( = ?auto_813652 ?auto_813658 ) ) ( not ( = ?auto_813653 ?auto_813654 ) ) ( not ( = ?auto_813653 ?auto_813655 ) ) ( not ( = ?auto_813653 ?auto_813656 ) ) ( not ( = ?auto_813653 ?auto_813657 ) ) ( not ( = ?auto_813653 ?auto_813658 ) ) ( not ( = ?auto_813654 ?auto_813655 ) ) ( not ( = ?auto_813654 ?auto_813656 ) ) ( not ( = ?auto_813654 ?auto_813657 ) ) ( not ( = ?auto_813654 ?auto_813658 ) ) ( not ( = ?auto_813655 ?auto_813656 ) ) ( not ( = ?auto_813655 ?auto_813657 ) ) ( not ( = ?auto_813655 ?auto_813658 ) ) ( not ( = ?auto_813656 ?auto_813657 ) ) ( not ( = ?auto_813656 ?auto_813658 ) ) ( not ( = ?auto_813657 ?auto_813658 ) ) ( ON ?auto_813656 ?auto_813657 ) ( CLEAR ?auto_813654 ) ( ON ?auto_813655 ?auto_813656 ) ( CLEAR ?auto_813655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_813644 ?auto_813645 ?auto_813646 ?auto_813647 ?auto_813648 ?auto_813649 ?auto_813650 ?auto_813651 ?auto_813652 ?auto_813653 ?auto_813654 ?auto_813655 )
      ( MAKE-14PILE ?auto_813644 ?auto_813645 ?auto_813646 ?auto_813647 ?auto_813648 ?auto_813649 ?auto_813650 ?auto_813651 ?auto_813652 ?auto_813653 ?auto_813654 ?auto_813655 ?auto_813656 ?auto_813657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813702 - BLOCK
      ?auto_813703 - BLOCK
      ?auto_813704 - BLOCK
      ?auto_813705 - BLOCK
      ?auto_813706 - BLOCK
      ?auto_813707 - BLOCK
      ?auto_813708 - BLOCK
      ?auto_813709 - BLOCK
      ?auto_813710 - BLOCK
      ?auto_813711 - BLOCK
      ?auto_813712 - BLOCK
      ?auto_813713 - BLOCK
      ?auto_813714 - BLOCK
      ?auto_813715 - BLOCK
    )
    :vars
    (
      ?auto_813716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813715 ?auto_813716 ) ( ON-TABLE ?auto_813702 ) ( ON ?auto_813703 ?auto_813702 ) ( ON ?auto_813704 ?auto_813703 ) ( ON ?auto_813705 ?auto_813704 ) ( ON ?auto_813706 ?auto_813705 ) ( ON ?auto_813707 ?auto_813706 ) ( ON ?auto_813708 ?auto_813707 ) ( ON ?auto_813709 ?auto_813708 ) ( ON ?auto_813710 ?auto_813709 ) ( ON ?auto_813711 ?auto_813710 ) ( not ( = ?auto_813702 ?auto_813703 ) ) ( not ( = ?auto_813702 ?auto_813704 ) ) ( not ( = ?auto_813702 ?auto_813705 ) ) ( not ( = ?auto_813702 ?auto_813706 ) ) ( not ( = ?auto_813702 ?auto_813707 ) ) ( not ( = ?auto_813702 ?auto_813708 ) ) ( not ( = ?auto_813702 ?auto_813709 ) ) ( not ( = ?auto_813702 ?auto_813710 ) ) ( not ( = ?auto_813702 ?auto_813711 ) ) ( not ( = ?auto_813702 ?auto_813712 ) ) ( not ( = ?auto_813702 ?auto_813713 ) ) ( not ( = ?auto_813702 ?auto_813714 ) ) ( not ( = ?auto_813702 ?auto_813715 ) ) ( not ( = ?auto_813702 ?auto_813716 ) ) ( not ( = ?auto_813703 ?auto_813704 ) ) ( not ( = ?auto_813703 ?auto_813705 ) ) ( not ( = ?auto_813703 ?auto_813706 ) ) ( not ( = ?auto_813703 ?auto_813707 ) ) ( not ( = ?auto_813703 ?auto_813708 ) ) ( not ( = ?auto_813703 ?auto_813709 ) ) ( not ( = ?auto_813703 ?auto_813710 ) ) ( not ( = ?auto_813703 ?auto_813711 ) ) ( not ( = ?auto_813703 ?auto_813712 ) ) ( not ( = ?auto_813703 ?auto_813713 ) ) ( not ( = ?auto_813703 ?auto_813714 ) ) ( not ( = ?auto_813703 ?auto_813715 ) ) ( not ( = ?auto_813703 ?auto_813716 ) ) ( not ( = ?auto_813704 ?auto_813705 ) ) ( not ( = ?auto_813704 ?auto_813706 ) ) ( not ( = ?auto_813704 ?auto_813707 ) ) ( not ( = ?auto_813704 ?auto_813708 ) ) ( not ( = ?auto_813704 ?auto_813709 ) ) ( not ( = ?auto_813704 ?auto_813710 ) ) ( not ( = ?auto_813704 ?auto_813711 ) ) ( not ( = ?auto_813704 ?auto_813712 ) ) ( not ( = ?auto_813704 ?auto_813713 ) ) ( not ( = ?auto_813704 ?auto_813714 ) ) ( not ( = ?auto_813704 ?auto_813715 ) ) ( not ( = ?auto_813704 ?auto_813716 ) ) ( not ( = ?auto_813705 ?auto_813706 ) ) ( not ( = ?auto_813705 ?auto_813707 ) ) ( not ( = ?auto_813705 ?auto_813708 ) ) ( not ( = ?auto_813705 ?auto_813709 ) ) ( not ( = ?auto_813705 ?auto_813710 ) ) ( not ( = ?auto_813705 ?auto_813711 ) ) ( not ( = ?auto_813705 ?auto_813712 ) ) ( not ( = ?auto_813705 ?auto_813713 ) ) ( not ( = ?auto_813705 ?auto_813714 ) ) ( not ( = ?auto_813705 ?auto_813715 ) ) ( not ( = ?auto_813705 ?auto_813716 ) ) ( not ( = ?auto_813706 ?auto_813707 ) ) ( not ( = ?auto_813706 ?auto_813708 ) ) ( not ( = ?auto_813706 ?auto_813709 ) ) ( not ( = ?auto_813706 ?auto_813710 ) ) ( not ( = ?auto_813706 ?auto_813711 ) ) ( not ( = ?auto_813706 ?auto_813712 ) ) ( not ( = ?auto_813706 ?auto_813713 ) ) ( not ( = ?auto_813706 ?auto_813714 ) ) ( not ( = ?auto_813706 ?auto_813715 ) ) ( not ( = ?auto_813706 ?auto_813716 ) ) ( not ( = ?auto_813707 ?auto_813708 ) ) ( not ( = ?auto_813707 ?auto_813709 ) ) ( not ( = ?auto_813707 ?auto_813710 ) ) ( not ( = ?auto_813707 ?auto_813711 ) ) ( not ( = ?auto_813707 ?auto_813712 ) ) ( not ( = ?auto_813707 ?auto_813713 ) ) ( not ( = ?auto_813707 ?auto_813714 ) ) ( not ( = ?auto_813707 ?auto_813715 ) ) ( not ( = ?auto_813707 ?auto_813716 ) ) ( not ( = ?auto_813708 ?auto_813709 ) ) ( not ( = ?auto_813708 ?auto_813710 ) ) ( not ( = ?auto_813708 ?auto_813711 ) ) ( not ( = ?auto_813708 ?auto_813712 ) ) ( not ( = ?auto_813708 ?auto_813713 ) ) ( not ( = ?auto_813708 ?auto_813714 ) ) ( not ( = ?auto_813708 ?auto_813715 ) ) ( not ( = ?auto_813708 ?auto_813716 ) ) ( not ( = ?auto_813709 ?auto_813710 ) ) ( not ( = ?auto_813709 ?auto_813711 ) ) ( not ( = ?auto_813709 ?auto_813712 ) ) ( not ( = ?auto_813709 ?auto_813713 ) ) ( not ( = ?auto_813709 ?auto_813714 ) ) ( not ( = ?auto_813709 ?auto_813715 ) ) ( not ( = ?auto_813709 ?auto_813716 ) ) ( not ( = ?auto_813710 ?auto_813711 ) ) ( not ( = ?auto_813710 ?auto_813712 ) ) ( not ( = ?auto_813710 ?auto_813713 ) ) ( not ( = ?auto_813710 ?auto_813714 ) ) ( not ( = ?auto_813710 ?auto_813715 ) ) ( not ( = ?auto_813710 ?auto_813716 ) ) ( not ( = ?auto_813711 ?auto_813712 ) ) ( not ( = ?auto_813711 ?auto_813713 ) ) ( not ( = ?auto_813711 ?auto_813714 ) ) ( not ( = ?auto_813711 ?auto_813715 ) ) ( not ( = ?auto_813711 ?auto_813716 ) ) ( not ( = ?auto_813712 ?auto_813713 ) ) ( not ( = ?auto_813712 ?auto_813714 ) ) ( not ( = ?auto_813712 ?auto_813715 ) ) ( not ( = ?auto_813712 ?auto_813716 ) ) ( not ( = ?auto_813713 ?auto_813714 ) ) ( not ( = ?auto_813713 ?auto_813715 ) ) ( not ( = ?auto_813713 ?auto_813716 ) ) ( not ( = ?auto_813714 ?auto_813715 ) ) ( not ( = ?auto_813714 ?auto_813716 ) ) ( not ( = ?auto_813715 ?auto_813716 ) ) ( ON ?auto_813714 ?auto_813715 ) ( ON ?auto_813713 ?auto_813714 ) ( CLEAR ?auto_813711 ) ( ON ?auto_813712 ?auto_813713 ) ( CLEAR ?auto_813712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_813702 ?auto_813703 ?auto_813704 ?auto_813705 ?auto_813706 ?auto_813707 ?auto_813708 ?auto_813709 ?auto_813710 ?auto_813711 ?auto_813712 )
      ( MAKE-14PILE ?auto_813702 ?auto_813703 ?auto_813704 ?auto_813705 ?auto_813706 ?auto_813707 ?auto_813708 ?auto_813709 ?auto_813710 ?auto_813711 ?auto_813712 ?auto_813713 ?auto_813714 ?auto_813715 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813760 - BLOCK
      ?auto_813761 - BLOCK
      ?auto_813762 - BLOCK
      ?auto_813763 - BLOCK
      ?auto_813764 - BLOCK
      ?auto_813765 - BLOCK
      ?auto_813766 - BLOCK
      ?auto_813767 - BLOCK
      ?auto_813768 - BLOCK
      ?auto_813769 - BLOCK
      ?auto_813770 - BLOCK
      ?auto_813771 - BLOCK
      ?auto_813772 - BLOCK
      ?auto_813773 - BLOCK
    )
    :vars
    (
      ?auto_813774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813773 ?auto_813774 ) ( ON-TABLE ?auto_813760 ) ( ON ?auto_813761 ?auto_813760 ) ( ON ?auto_813762 ?auto_813761 ) ( ON ?auto_813763 ?auto_813762 ) ( ON ?auto_813764 ?auto_813763 ) ( ON ?auto_813765 ?auto_813764 ) ( ON ?auto_813766 ?auto_813765 ) ( ON ?auto_813767 ?auto_813766 ) ( ON ?auto_813768 ?auto_813767 ) ( not ( = ?auto_813760 ?auto_813761 ) ) ( not ( = ?auto_813760 ?auto_813762 ) ) ( not ( = ?auto_813760 ?auto_813763 ) ) ( not ( = ?auto_813760 ?auto_813764 ) ) ( not ( = ?auto_813760 ?auto_813765 ) ) ( not ( = ?auto_813760 ?auto_813766 ) ) ( not ( = ?auto_813760 ?auto_813767 ) ) ( not ( = ?auto_813760 ?auto_813768 ) ) ( not ( = ?auto_813760 ?auto_813769 ) ) ( not ( = ?auto_813760 ?auto_813770 ) ) ( not ( = ?auto_813760 ?auto_813771 ) ) ( not ( = ?auto_813760 ?auto_813772 ) ) ( not ( = ?auto_813760 ?auto_813773 ) ) ( not ( = ?auto_813760 ?auto_813774 ) ) ( not ( = ?auto_813761 ?auto_813762 ) ) ( not ( = ?auto_813761 ?auto_813763 ) ) ( not ( = ?auto_813761 ?auto_813764 ) ) ( not ( = ?auto_813761 ?auto_813765 ) ) ( not ( = ?auto_813761 ?auto_813766 ) ) ( not ( = ?auto_813761 ?auto_813767 ) ) ( not ( = ?auto_813761 ?auto_813768 ) ) ( not ( = ?auto_813761 ?auto_813769 ) ) ( not ( = ?auto_813761 ?auto_813770 ) ) ( not ( = ?auto_813761 ?auto_813771 ) ) ( not ( = ?auto_813761 ?auto_813772 ) ) ( not ( = ?auto_813761 ?auto_813773 ) ) ( not ( = ?auto_813761 ?auto_813774 ) ) ( not ( = ?auto_813762 ?auto_813763 ) ) ( not ( = ?auto_813762 ?auto_813764 ) ) ( not ( = ?auto_813762 ?auto_813765 ) ) ( not ( = ?auto_813762 ?auto_813766 ) ) ( not ( = ?auto_813762 ?auto_813767 ) ) ( not ( = ?auto_813762 ?auto_813768 ) ) ( not ( = ?auto_813762 ?auto_813769 ) ) ( not ( = ?auto_813762 ?auto_813770 ) ) ( not ( = ?auto_813762 ?auto_813771 ) ) ( not ( = ?auto_813762 ?auto_813772 ) ) ( not ( = ?auto_813762 ?auto_813773 ) ) ( not ( = ?auto_813762 ?auto_813774 ) ) ( not ( = ?auto_813763 ?auto_813764 ) ) ( not ( = ?auto_813763 ?auto_813765 ) ) ( not ( = ?auto_813763 ?auto_813766 ) ) ( not ( = ?auto_813763 ?auto_813767 ) ) ( not ( = ?auto_813763 ?auto_813768 ) ) ( not ( = ?auto_813763 ?auto_813769 ) ) ( not ( = ?auto_813763 ?auto_813770 ) ) ( not ( = ?auto_813763 ?auto_813771 ) ) ( not ( = ?auto_813763 ?auto_813772 ) ) ( not ( = ?auto_813763 ?auto_813773 ) ) ( not ( = ?auto_813763 ?auto_813774 ) ) ( not ( = ?auto_813764 ?auto_813765 ) ) ( not ( = ?auto_813764 ?auto_813766 ) ) ( not ( = ?auto_813764 ?auto_813767 ) ) ( not ( = ?auto_813764 ?auto_813768 ) ) ( not ( = ?auto_813764 ?auto_813769 ) ) ( not ( = ?auto_813764 ?auto_813770 ) ) ( not ( = ?auto_813764 ?auto_813771 ) ) ( not ( = ?auto_813764 ?auto_813772 ) ) ( not ( = ?auto_813764 ?auto_813773 ) ) ( not ( = ?auto_813764 ?auto_813774 ) ) ( not ( = ?auto_813765 ?auto_813766 ) ) ( not ( = ?auto_813765 ?auto_813767 ) ) ( not ( = ?auto_813765 ?auto_813768 ) ) ( not ( = ?auto_813765 ?auto_813769 ) ) ( not ( = ?auto_813765 ?auto_813770 ) ) ( not ( = ?auto_813765 ?auto_813771 ) ) ( not ( = ?auto_813765 ?auto_813772 ) ) ( not ( = ?auto_813765 ?auto_813773 ) ) ( not ( = ?auto_813765 ?auto_813774 ) ) ( not ( = ?auto_813766 ?auto_813767 ) ) ( not ( = ?auto_813766 ?auto_813768 ) ) ( not ( = ?auto_813766 ?auto_813769 ) ) ( not ( = ?auto_813766 ?auto_813770 ) ) ( not ( = ?auto_813766 ?auto_813771 ) ) ( not ( = ?auto_813766 ?auto_813772 ) ) ( not ( = ?auto_813766 ?auto_813773 ) ) ( not ( = ?auto_813766 ?auto_813774 ) ) ( not ( = ?auto_813767 ?auto_813768 ) ) ( not ( = ?auto_813767 ?auto_813769 ) ) ( not ( = ?auto_813767 ?auto_813770 ) ) ( not ( = ?auto_813767 ?auto_813771 ) ) ( not ( = ?auto_813767 ?auto_813772 ) ) ( not ( = ?auto_813767 ?auto_813773 ) ) ( not ( = ?auto_813767 ?auto_813774 ) ) ( not ( = ?auto_813768 ?auto_813769 ) ) ( not ( = ?auto_813768 ?auto_813770 ) ) ( not ( = ?auto_813768 ?auto_813771 ) ) ( not ( = ?auto_813768 ?auto_813772 ) ) ( not ( = ?auto_813768 ?auto_813773 ) ) ( not ( = ?auto_813768 ?auto_813774 ) ) ( not ( = ?auto_813769 ?auto_813770 ) ) ( not ( = ?auto_813769 ?auto_813771 ) ) ( not ( = ?auto_813769 ?auto_813772 ) ) ( not ( = ?auto_813769 ?auto_813773 ) ) ( not ( = ?auto_813769 ?auto_813774 ) ) ( not ( = ?auto_813770 ?auto_813771 ) ) ( not ( = ?auto_813770 ?auto_813772 ) ) ( not ( = ?auto_813770 ?auto_813773 ) ) ( not ( = ?auto_813770 ?auto_813774 ) ) ( not ( = ?auto_813771 ?auto_813772 ) ) ( not ( = ?auto_813771 ?auto_813773 ) ) ( not ( = ?auto_813771 ?auto_813774 ) ) ( not ( = ?auto_813772 ?auto_813773 ) ) ( not ( = ?auto_813772 ?auto_813774 ) ) ( not ( = ?auto_813773 ?auto_813774 ) ) ( ON ?auto_813772 ?auto_813773 ) ( ON ?auto_813771 ?auto_813772 ) ( ON ?auto_813770 ?auto_813771 ) ( CLEAR ?auto_813768 ) ( ON ?auto_813769 ?auto_813770 ) ( CLEAR ?auto_813769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_813760 ?auto_813761 ?auto_813762 ?auto_813763 ?auto_813764 ?auto_813765 ?auto_813766 ?auto_813767 ?auto_813768 ?auto_813769 )
      ( MAKE-14PILE ?auto_813760 ?auto_813761 ?auto_813762 ?auto_813763 ?auto_813764 ?auto_813765 ?auto_813766 ?auto_813767 ?auto_813768 ?auto_813769 ?auto_813770 ?auto_813771 ?auto_813772 ?auto_813773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813818 - BLOCK
      ?auto_813819 - BLOCK
      ?auto_813820 - BLOCK
      ?auto_813821 - BLOCK
      ?auto_813822 - BLOCK
      ?auto_813823 - BLOCK
      ?auto_813824 - BLOCK
      ?auto_813825 - BLOCK
      ?auto_813826 - BLOCK
      ?auto_813827 - BLOCK
      ?auto_813828 - BLOCK
      ?auto_813829 - BLOCK
      ?auto_813830 - BLOCK
      ?auto_813831 - BLOCK
    )
    :vars
    (
      ?auto_813832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813831 ?auto_813832 ) ( ON-TABLE ?auto_813818 ) ( ON ?auto_813819 ?auto_813818 ) ( ON ?auto_813820 ?auto_813819 ) ( ON ?auto_813821 ?auto_813820 ) ( ON ?auto_813822 ?auto_813821 ) ( ON ?auto_813823 ?auto_813822 ) ( ON ?auto_813824 ?auto_813823 ) ( ON ?auto_813825 ?auto_813824 ) ( not ( = ?auto_813818 ?auto_813819 ) ) ( not ( = ?auto_813818 ?auto_813820 ) ) ( not ( = ?auto_813818 ?auto_813821 ) ) ( not ( = ?auto_813818 ?auto_813822 ) ) ( not ( = ?auto_813818 ?auto_813823 ) ) ( not ( = ?auto_813818 ?auto_813824 ) ) ( not ( = ?auto_813818 ?auto_813825 ) ) ( not ( = ?auto_813818 ?auto_813826 ) ) ( not ( = ?auto_813818 ?auto_813827 ) ) ( not ( = ?auto_813818 ?auto_813828 ) ) ( not ( = ?auto_813818 ?auto_813829 ) ) ( not ( = ?auto_813818 ?auto_813830 ) ) ( not ( = ?auto_813818 ?auto_813831 ) ) ( not ( = ?auto_813818 ?auto_813832 ) ) ( not ( = ?auto_813819 ?auto_813820 ) ) ( not ( = ?auto_813819 ?auto_813821 ) ) ( not ( = ?auto_813819 ?auto_813822 ) ) ( not ( = ?auto_813819 ?auto_813823 ) ) ( not ( = ?auto_813819 ?auto_813824 ) ) ( not ( = ?auto_813819 ?auto_813825 ) ) ( not ( = ?auto_813819 ?auto_813826 ) ) ( not ( = ?auto_813819 ?auto_813827 ) ) ( not ( = ?auto_813819 ?auto_813828 ) ) ( not ( = ?auto_813819 ?auto_813829 ) ) ( not ( = ?auto_813819 ?auto_813830 ) ) ( not ( = ?auto_813819 ?auto_813831 ) ) ( not ( = ?auto_813819 ?auto_813832 ) ) ( not ( = ?auto_813820 ?auto_813821 ) ) ( not ( = ?auto_813820 ?auto_813822 ) ) ( not ( = ?auto_813820 ?auto_813823 ) ) ( not ( = ?auto_813820 ?auto_813824 ) ) ( not ( = ?auto_813820 ?auto_813825 ) ) ( not ( = ?auto_813820 ?auto_813826 ) ) ( not ( = ?auto_813820 ?auto_813827 ) ) ( not ( = ?auto_813820 ?auto_813828 ) ) ( not ( = ?auto_813820 ?auto_813829 ) ) ( not ( = ?auto_813820 ?auto_813830 ) ) ( not ( = ?auto_813820 ?auto_813831 ) ) ( not ( = ?auto_813820 ?auto_813832 ) ) ( not ( = ?auto_813821 ?auto_813822 ) ) ( not ( = ?auto_813821 ?auto_813823 ) ) ( not ( = ?auto_813821 ?auto_813824 ) ) ( not ( = ?auto_813821 ?auto_813825 ) ) ( not ( = ?auto_813821 ?auto_813826 ) ) ( not ( = ?auto_813821 ?auto_813827 ) ) ( not ( = ?auto_813821 ?auto_813828 ) ) ( not ( = ?auto_813821 ?auto_813829 ) ) ( not ( = ?auto_813821 ?auto_813830 ) ) ( not ( = ?auto_813821 ?auto_813831 ) ) ( not ( = ?auto_813821 ?auto_813832 ) ) ( not ( = ?auto_813822 ?auto_813823 ) ) ( not ( = ?auto_813822 ?auto_813824 ) ) ( not ( = ?auto_813822 ?auto_813825 ) ) ( not ( = ?auto_813822 ?auto_813826 ) ) ( not ( = ?auto_813822 ?auto_813827 ) ) ( not ( = ?auto_813822 ?auto_813828 ) ) ( not ( = ?auto_813822 ?auto_813829 ) ) ( not ( = ?auto_813822 ?auto_813830 ) ) ( not ( = ?auto_813822 ?auto_813831 ) ) ( not ( = ?auto_813822 ?auto_813832 ) ) ( not ( = ?auto_813823 ?auto_813824 ) ) ( not ( = ?auto_813823 ?auto_813825 ) ) ( not ( = ?auto_813823 ?auto_813826 ) ) ( not ( = ?auto_813823 ?auto_813827 ) ) ( not ( = ?auto_813823 ?auto_813828 ) ) ( not ( = ?auto_813823 ?auto_813829 ) ) ( not ( = ?auto_813823 ?auto_813830 ) ) ( not ( = ?auto_813823 ?auto_813831 ) ) ( not ( = ?auto_813823 ?auto_813832 ) ) ( not ( = ?auto_813824 ?auto_813825 ) ) ( not ( = ?auto_813824 ?auto_813826 ) ) ( not ( = ?auto_813824 ?auto_813827 ) ) ( not ( = ?auto_813824 ?auto_813828 ) ) ( not ( = ?auto_813824 ?auto_813829 ) ) ( not ( = ?auto_813824 ?auto_813830 ) ) ( not ( = ?auto_813824 ?auto_813831 ) ) ( not ( = ?auto_813824 ?auto_813832 ) ) ( not ( = ?auto_813825 ?auto_813826 ) ) ( not ( = ?auto_813825 ?auto_813827 ) ) ( not ( = ?auto_813825 ?auto_813828 ) ) ( not ( = ?auto_813825 ?auto_813829 ) ) ( not ( = ?auto_813825 ?auto_813830 ) ) ( not ( = ?auto_813825 ?auto_813831 ) ) ( not ( = ?auto_813825 ?auto_813832 ) ) ( not ( = ?auto_813826 ?auto_813827 ) ) ( not ( = ?auto_813826 ?auto_813828 ) ) ( not ( = ?auto_813826 ?auto_813829 ) ) ( not ( = ?auto_813826 ?auto_813830 ) ) ( not ( = ?auto_813826 ?auto_813831 ) ) ( not ( = ?auto_813826 ?auto_813832 ) ) ( not ( = ?auto_813827 ?auto_813828 ) ) ( not ( = ?auto_813827 ?auto_813829 ) ) ( not ( = ?auto_813827 ?auto_813830 ) ) ( not ( = ?auto_813827 ?auto_813831 ) ) ( not ( = ?auto_813827 ?auto_813832 ) ) ( not ( = ?auto_813828 ?auto_813829 ) ) ( not ( = ?auto_813828 ?auto_813830 ) ) ( not ( = ?auto_813828 ?auto_813831 ) ) ( not ( = ?auto_813828 ?auto_813832 ) ) ( not ( = ?auto_813829 ?auto_813830 ) ) ( not ( = ?auto_813829 ?auto_813831 ) ) ( not ( = ?auto_813829 ?auto_813832 ) ) ( not ( = ?auto_813830 ?auto_813831 ) ) ( not ( = ?auto_813830 ?auto_813832 ) ) ( not ( = ?auto_813831 ?auto_813832 ) ) ( ON ?auto_813830 ?auto_813831 ) ( ON ?auto_813829 ?auto_813830 ) ( ON ?auto_813828 ?auto_813829 ) ( ON ?auto_813827 ?auto_813828 ) ( CLEAR ?auto_813825 ) ( ON ?auto_813826 ?auto_813827 ) ( CLEAR ?auto_813826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_813818 ?auto_813819 ?auto_813820 ?auto_813821 ?auto_813822 ?auto_813823 ?auto_813824 ?auto_813825 ?auto_813826 )
      ( MAKE-14PILE ?auto_813818 ?auto_813819 ?auto_813820 ?auto_813821 ?auto_813822 ?auto_813823 ?auto_813824 ?auto_813825 ?auto_813826 ?auto_813827 ?auto_813828 ?auto_813829 ?auto_813830 ?auto_813831 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813876 - BLOCK
      ?auto_813877 - BLOCK
      ?auto_813878 - BLOCK
      ?auto_813879 - BLOCK
      ?auto_813880 - BLOCK
      ?auto_813881 - BLOCK
      ?auto_813882 - BLOCK
      ?auto_813883 - BLOCK
      ?auto_813884 - BLOCK
      ?auto_813885 - BLOCK
      ?auto_813886 - BLOCK
      ?auto_813887 - BLOCK
      ?auto_813888 - BLOCK
      ?auto_813889 - BLOCK
    )
    :vars
    (
      ?auto_813890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813889 ?auto_813890 ) ( ON-TABLE ?auto_813876 ) ( ON ?auto_813877 ?auto_813876 ) ( ON ?auto_813878 ?auto_813877 ) ( ON ?auto_813879 ?auto_813878 ) ( ON ?auto_813880 ?auto_813879 ) ( ON ?auto_813881 ?auto_813880 ) ( ON ?auto_813882 ?auto_813881 ) ( not ( = ?auto_813876 ?auto_813877 ) ) ( not ( = ?auto_813876 ?auto_813878 ) ) ( not ( = ?auto_813876 ?auto_813879 ) ) ( not ( = ?auto_813876 ?auto_813880 ) ) ( not ( = ?auto_813876 ?auto_813881 ) ) ( not ( = ?auto_813876 ?auto_813882 ) ) ( not ( = ?auto_813876 ?auto_813883 ) ) ( not ( = ?auto_813876 ?auto_813884 ) ) ( not ( = ?auto_813876 ?auto_813885 ) ) ( not ( = ?auto_813876 ?auto_813886 ) ) ( not ( = ?auto_813876 ?auto_813887 ) ) ( not ( = ?auto_813876 ?auto_813888 ) ) ( not ( = ?auto_813876 ?auto_813889 ) ) ( not ( = ?auto_813876 ?auto_813890 ) ) ( not ( = ?auto_813877 ?auto_813878 ) ) ( not ( = ?auto_813877 ?auto_813879 ) ) ( not ( = ?auto_813877 ?auto_813880 ) ) ( not ( = ?auto_813877 ?auto_813881 ) ) ( not ( = ?auto_813877 ?auto_813882 ) ) ( not ( = ?auto_813877 ?auto_813883 ) ) ( not ( = ?auto_813877 ?auto_813884 ) ) ( not ( = ?auto_813877 ?auto_813885 ) ) ( not ( = ?auto_813877 ?auto_813886 ) ) ( not ( = ?auto_813877 ?auto_813887 ) ) ( not ( = ?auto_813877 ?auto_813888 ) ) ( not ( = ?auto_813877 ?auto_813889 ) ) ( not ( = ?auto_813877 ?auto_813890 ) ) ( not ( = ?auto_813878 ?auto_813879 ) ) ( not ( = ?auto_813878 ?auto_813880 ) ) ( not ( = ?auto_813878 ?auto_813881 ) ) ( not ( = ?auto_813878 ?auto_813882 ) ) ( not ( = ?auto_813878 ?auto_813883 ) ) ( not ( = ?auto_813878 ?auto_813884 ) ) ( not ( = ?auto_813878 ?auto_813885 ) ) ( not ( = ?auto_813878 ?auto_813886 ) ) ( not ( = ?auto_813878 ?auto_813887 ) ) ( not ( = ?auto_813878 ?auto_813888 ) ) ( not ( = ?auto_813878 ?auto_813889 ) ) ( not ( = ?auto_813878 ?auto_813890 ) ) ( not ( = ?auto_813879 ?auto_813880 ) ) ( not ( = ?auto_813879 ?auto_813881 ) ) ( not ( = ?auto_813879 ?auto_813882 ) ) ( not ( = ?auto_813879 ?auto_813883 ) ) ( not ( = ?auto_813879 ?auto_813884 ) ) ( not ( = ?auto_813879 ?auto_813885 ) ) ( not ( = ?auto_813879 ?auto_813886 ) ) ( not ( = ?auto_813879 ?auto_813887 ) ) ( not ( = ?auto_813879 ?auto_813888 ) ) ( not ( = ?auto_813879 ?auto_813889 ) ) ( not ( = ?auto_813879 ?auto_813890 ) ) ( not ( = ?auto_813880 ?auto_813881 ) ) ( not ( = ?auto_813880 ?auto_813882 ) ) ( not ( = ?auto_813880 ?auto_813883 ) ) ( not ( = ?auto_813880 ?auto_813884 ) ) ( not ( = ?auto_813880 ?auto_813885 ) ) ( not ( = ?auto_813880 ?auto_813886 ) ) ( not ( = ?auto_813880 ?auto_813887 ) ) ( not ( = ?auto_813880 ?auto_813888 ) ) ( not ( = ?auto_813880 ?auto_813889 ) ) ( not ( = ?auto_813880 ?auto_813890 ) ) ( not ( = ?auto_813881 ?auto_813882 ) ) ( not ( = ?auto_813881 ?auto_813883 ) ) ( not ( = ?auto_813881 ?auto_813884 ) ) ( not ( = ?auto_813881 ?auto_813885 ) ) ( not ( = ?auto_813881 ?auto_813886 ) ) ( not ( = ?auto_813881 ?auto_813887 ) ) ( not ( = ?auto_813881 ?auto_813888 ) ) ( not ( = ?auto_813881 ?auto_813889 ) ) ( not ( = ?auto_813881 ?auto_813890 ) ) ( not ( = ?auto_813882 ?auto_813883 ) ) ( not ( = ?auto_813882 ?auto_813884 ) ) ( not ( = ?auto_813882 ?auto_813885 ) ) ( not ( = ?auto_813882 ?auto_813886 ) ) ( not ( = ?auto_813882 ?auto_813887 ) ) ( not ( = ?auto_813882 ?auto_813888 ) ) ( not ( = ?auto_813882 ?auto_813889 ) ) ( not ( = ?auto_813882 ?auto_813890 ) ) ( not ( = ?auto_813883 ?auto_813884 ) ) ( not ( = ?auto_813883 ?auto_813885 ) ) ( not ( = ?auto_813883 ?auto_813886 ) ) ( not ( = ?auto_813883 ?auto_813887 ) ) ( not ( = ?auto_813883 ?auto_813888 ) ) ( not ( = ?auto_813883 ?auto_813889 ) ) ( not ( = ?auto_813883 ?auto_813890 ) ) ( not ( = ?auto_813884 ?auto_813885 ) ) ( not ( = ?auto_813884 ?auto_813886 ) ) ( not ( = ?auto_813884 ?auto_813887 ) ) ( not ( = ?auto_813884 ?auto_813888 ) ) ( not ( = ?auto_813884 ?auto_813889 ) ) ( not ( = ?auto_813884 ?auto_813890 ) ) ( not ( = ?auto_813885 ?auto_813886 ) ) ( not ( = ?auto_813885 ?auto_813887 ) ) ( not ( = ?auto_813885 ?auto_813888 ) ) ( not ( = ?auto_813885 ?auto_813889 ) ) ( not ( = ?auto_813885 ?auto_813890 ) ) ( not ( = ?auto_813886 ?auto_813887 ) ) ( not ( = ?auto_813886 ?auto_813888 ) ) ( not ( = ?auto_813886 ?auto_813889 ) ) ( not ( = ?auto_813886 ?auto_813890 ) ) ( not ( = ?auto_813887 ?auto_813888 ) ) ( not ( = ?auto_813887 ?auto_813889 ) ) ( not ( = ?auto_813887 ?auto_813890 ) ) ( not ( = ?auto_813888 ?auto_813889 ) ) ( not ( = ?auto_813888 ?auto_813890 ) ) ( not ( = ?auto_813889 ?auto_813890 ) ) ( ON ?auto_813888 ?auto_813889 ) ( ON ?auto_813887 ?auto_813888 ) ( ON ?auto_813886 ?auto_813887 ) ( ON ?auto_813885 ?auto_813886 ) ( ON ?auto_813884 ?auto_813885 ) ( CLEAR ?auto_813882 ) ( ON ?auto_813883 ?auto_813884 ) ( CLEAR ?auto_813883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_813876 ?auto_813877 ?auto_813878 ?auto_813879 ?auto_813880 ?auto_813881 ?auto_813882 ?auto_813883 )
      ( MAKE-14PILE ?auto_813876 ?auto_813877 ?auto_813878 ?auto_813879 ?auto_813880 ?auto_813881 ?auto_813882 ?auto_813883 ?auto_813884 ?auto_813885 ?auto_813886 ?auto_813887 ?auto_813888 ?auto_813889 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813934 - BLOCK
      ?auto_813935 - BLOCK
      ?auto_813936 - BLOCK
      ?auto_813937 - BLOCK
      ?auto_813938 - BLOCK
      ?auto_813939 - BLOCK
      ?auto_813940 - BLOCK
      ?auto_813941 - BLOCK
      ?auto_813942 - BLOCK
      ?auto_813943 - BLOCK
      ?auto_813944 - BLOCK
      ?auto_813945 - BLOCK
      ?auto_813946 - BLOCK
      ?auto_813947 - BLOCK
    )
    :vars
    (
      ?auto_813948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_813947 ?auto_813948 ) ( ON-TABLE ?auto_813934 ) ( ON ?auto_813935 ?auto_813934 ) ( ON ?auto_813936 ?auto_813935 ) ( ON ?auto_813937 ?auto_813936 ) ( ON ?auto_813938 ?auto_813937 ) ( ON ?auto_813939 ?auto_813938 ) ( not ( = ?auto_813934 ?auto_813935 ) ) ( not ( = ?auto_813934 ?auto_813936 ) ) ( not ( = ?auto_813934 ?auto_813937 ) ) ( not ( = ?auto_813934 ?auto_813938 ) ) ( not ( = ?auto_813934 ?auto_813939 ) ) ( not ( = ?auto_813934 ?auto_813940 ) ) ( not ( = ?auto_813934 ?auto_813941 ) ) ( not ( = ?auto_813934 ?auto_813942 ) ) ( not ( = ?auto_813934 ?auto_813943 ) ) ( not ( = ?auto_813934 ?auto_813944 ) ) ( not ( = ?auto_813934 ?auto_813945 ) ) ( not ( = ?auto_813934 ?auto_813946 ) ) ( not ( = ?auto_813934 ?auto_813947 ) ) ( not ( = ?auto_813934 ?auto_813948 ) ) ( not ( = ?auto_813935 ?auto_813936 ) ) ( not ( = ?auto_813935 ?auto_813937 ) ) ( not ( = ?auto_813935 ?auto_813938 ) ) ( not ( = ?auto_813935 ?auto_813939 ) ) ( not ( = ?auto_813935 ?auto_813940 ) ) ( not ( = ?auto_813935 ?auto_813941 ) ) ( not ( = ?auto_813935 ?auto_813942 ) ) ( not ( = ?auto_813935 ?auto_813943 ) ) ( not ( = ?auto_813935 ?auto_813944 ) ) ( not ( = ?auto_813935 ?auto_813945 ) ) ( not ( = ?auto_813935 ?auto_813946 ) ) ( not ( = ?auto_813935 ?auto_813947 ) ) ( not ( = ?auto_813935 ?auto_813948 ) ) ( not ( = ?auto_813936 ?auto_813937 ) ) ( not ( = ?auto_813936 ?auto_813938 ) ) ( not ( = ?auto_813936 ?auto_813939 ) ) ( not ( = ?auto_813936 ?auto_813940 ) ) ( not ( = ?auto_813936 ?auto_813941 ) ) ( not ( = ?auto_813936 ?auto_813942 ) ) ( not ( = ?auto_813936 ?auto_813943 ) ) ( not ( = ?auto_813936 ?auto_813944 ) ) ( not ( = ?auto_813936 ?auto_813945 ) ) ( not ( = ?auto_813936 ?auto_813946 ) ) ( not ( = ?auto_813936 ?auto_813947 ) ) ( not ( = ?auto_813936 ?auto_813948 ) ) ( not ( = ?auto_813937 ?auto_813938 ) ) ( not ( = ?auto_813937 ?auto_813939 ) ) ( not ( = ?auto_813937 ?auto_813940 ) ) ( not ( = ?auto_813937 ?auto_813941 ) ) ( not ( = ?auto_813937 ?auto_813942 ) ) ( not ( = ?auto_813937 ?auto_813943 ) ) ( not ( = ?auto_813937 ?auto_813944 ) ) ( not ( = ?auto_813937 ?auto_813945 ) ) ( not ( = ?auto_813937 ?auto_813946 ) ) ( not ( = ?auto_813937 ?auto_813947 ) ) ( not ( = ?auto_813937 ?auto_813948 ) ) ( not ( = ?auto_813938 ?auto_813939 ) ) ( not ( = ?auto_813938 ?auto_813940 ) ) ( not ( = ?auto_813938 ?auto_813941 ) ) ( not ( = ?auto_813938 ?auto_813942 ) ) ( not ( = ?auto_813938 ?auto_813943 ) ) ( not ( = ?auto_813938 ?auto_813944 ) ) ( not ( = ?auto_813938 ?auto_813945 ) ) ( not ( = ?auto_813938 ?auto_813946 ) ) ( not ( = ?auto_813938 ?auto_813947 ) ) ( not ( = ?auto_813938 ?auto_813948 ) ) ( not ( = ?auto_813939 ?auto_813940 ) ) ( not ( = ?auto_813939 ?auto_813941 ) ) ( not ( = ?auto_813939 ?auto_813942 ) ) ( not ( = ?auto_813939 ?auto_813943 ) ) ( not ( = ?auto_813939 ?auto_813944 ) ) ( not ( = ?auto_813939 ?auto_813945 ) ) ( not ( = ?auto_813939 ?auto_813946 ) ) ( not ( = ?auto_813939 ?auto_813947 ) ) ( not ( = ?auto_813939 ?auto_813948 ) ) ( not ( = ?auto_813940 ?auto_813941 ) ) ( not ( = ?auto_813940 ?auto_813942 ) ) ( not ( = ?auto_813940 ?auto_813943 ) ) ( not ( = ?auto_813940 ?auto_813944 ) ) ( not ( = ?auto_813940 ?auto_813945 ) ) ( not ( = ?auto_813940 ?auto_813946 ) ) ( not ( = ?auto_813940 ?auto_813947 ) ) ( not ( = ?auto_813940 ?auto_813948 ) ) ( not ( = ?auto_813941 ?auto_813942 ) ) ( not ( = ?auto_813941 ?auto_813943 ) ) ( not ( = ?auto_813941 ?auto_813944 ) ) ( not ( = ?auto_813941 ?auto_813945 ) ) ( not ( = ?auto_813941 ?auto_813946 ) ) ( not ( = ?auto_813941 ?auto_813947 ) ) ( not ( = ?auto_813941 ?auto_813948 ) ) ( not ( = ?auto_813942 ?auto_813943 ) ) ( not ( = ?auto_813942 ?auto_813944 ) ) ( not ( = ?auto_813942 ?auto_813945 ) ) ( not ( = ?auto_813942 ?auto_813946 ) ) ( not ( = ?auto_813942 ?auto_813947 ) ) ( not ( = ?auto_813942 ?auto_813948 ) ) ( not ( = ?auto_813943 ?auto_813944 ) ) ( not ( = ?auto_813943 ?auto_813945 ) ) ( not ( = ?auto_813943 ?auto_813946 ) ) ( not ( = ?auto_813943 ?auto_813947 ) ) ( not ( = ?auto_813943 ?auto_813948 ) ) ( not ( = ?auto_813944 ?auto_813945 ) ) ( not ( = ?auto_813944 ?auto_813946 ) ) ( not ( = ?auto_813944 ?auto_813947 ) ) ( not ( = ?auto_813944 ?auto_813948 ) ) ( not ( = ?auto_813945 ?auto_813946 ) ) ( not ( = ?auto_813945 ?auto_813947 ) ) ( not ( = ?auto_813945 ?auto_813948 ) ) ( not ( = ?auto_813946 ?auto_813947 ) ) ( not ( = ?auto_813946 ?auto_813948 ) ) ( not ( = ?auto_813947 ?auto_813948 ) ) ( ON ?auto_813946 ?auto_813947 ) ( ON ?auto_813945 ?auto_813946 ) ( ON ?auto_813944 ?auto_813945 ) ( ON ?auto_813943 ?auto_813944 ) ( ON ?auto_813942 ?auto_813943 ) ( ON ?auto_813941 ?auto_813942 ) ( CLEAR ?auto_813939 ) ( ON ?auto_813940 ?auto_813941 ) ( CLEAR ?auto_813940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_813934 ?auto_813935 ?auto_813936 ?auto_813937 ?auto_813938 ?auto_813939 ?auto_813940 )
      ( MAKE-14PILE ?auto_813934 ?auto_813935 ?auto_813936 ?auto_813937 ?auto_813938 ?auto_813939 ?auto_813940 ?auto_813941 ?auto_813942 ?auto_813943 ?auto_813944 ?auto_813945 ?auto_813946 ?auto_813947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_813992 - BLOCK
      ?auto_813993 - BLOCK
      ?auto_813994 - BLOCK
      ?auto_813995 - BLOCK
      ?auto_813996 - BLOCK
      ?auto_813997 - BLOCK
      ?auto_813998 - BLOCK
      ?auto_813999 - BLOCK
      ?auto_814000 - BLOCK
      ?auto_814001 - BLOCK
      ?auto_814002 - BLOCK
      ?auto_814003 - BLOCK
      ?auto_814004 - BLOCK
      ?auto_814005 - BLOCK
    )
    :vars
    (
      ?auto_814006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814005 ?auto_814006 ) ( ON-TABLE ?auto_813992 ) ( ON ?auto_813993 ?auto_813992 ) ( ON ?auto_813994 ?auto_813993 ) ( ON ?auto_813995 ?auto_813994 ) ( ON ?auto_813996 ?auto_813995 ) ( not ( = ?auto_813992 ?auto_813993 ) ) ( not ( = ?auto_813992 ?auto_813994 ) ) ( not ( = ?auto_813992 ?auto_813995 ) ) ( not ( = ?auto_813992 ?auto_813996 ) ) ( not ( = ?auto_813992 ?auto_813997 ) ) ( not ( = ?auto_813992 ?auto_813998 ) ) ( not ( = ?auto_813992 ?auto_813999 ) ) ( not ( = ?auto_813992 ?auto_814000 ) ) ( not ( = ?auto_813992 ?auto_814001 ) ) ( not ( = ?auto_813992 ?auto_814002 ) ) ( not ( = ?auto_813992 ?auto_814003 ) ) ( not ( = ?auto_813992 ?auto_814004 ) ) ( not ( = ?auto_813992 ?auto_814005 ) ) ( not ( = ?auto_813992 ?auto_814006 ) ) ( not ( = ?auto_813993 ?auto_813994 ) ) ( not ( = ?auto_813993 ?auto_813995 ) ) ( not ( = ?auto_813993 ?auto_813996 ) ) ( not ( = ?auto_813993 ?auto_813997 ) ) ( not ( = ?auto_813993 ?auto_813998 ) ) ( not ( = ?auto_813993 ?auto_813999 ) ) ( not ( = ?auto_813993 ?auto_814000 ) ) ( not ( = ?auto_813993 ?auto_814001 ) ) ( not ( = ?auto_813993 ?auto_814002 ) ) ( not ( = ?auto_813993 ?auto_814003 ) ) ( not ( = ?auto_813993 ?auto_814004 ) ) ( not ( = ?auto_813993 ?auto_814005 ) ) ( not ( = ?auto_813993 ?auto_814006 ) ) ( not ( = ?auto_813994 ?auto_813995 ) ) ( not ( = ?auto_813994 ?auto_813996 ) ) ( not ( = ?auto_813994 ?auto_813997 ) ) ( not ( = ?auto_813994 ?auto_813998 ) ) ( not ( = ?auto_813994 ?auto_813999 ) ) ( not ( = ?auto_813994 ?auto_814000 ) ) ( not ( = ?auto_813994 ?auto_814001 ) ) ( not ( = ?auto_813994 ?auto_814002 ) ) ( not ( = ?auto_813994 ?auto_814003 ) ) ( not ( = ?auto_813994 ?auto_814004 ) ) ( not ( = ?auto_813994 ?auto_814005 ) ) ( not ( = ?auto_813994 ?auto_814006 ) ) ( not ( = ?auto_813995 ?auto_813996 ) ) ( not ( = ?auto_813995 ?auto_813997 ) ) ( not ( = ?auto_813995 ?auto_813998 ) ) ( not ( = ?auto_813995 ?auto_813999 ) ) ( not ( = ?auto_813995 ?auto_814000 ) ) ( not ( = ?auto_813995 ?auto_814001 ) ) ( not ( = ?auto_813995 ?auto_814002 ) ) ( not ( = ?auto_813995 ?auto_814003 ) ) ( not ( = ?auto_813995 ?auto_814004 ) ) ( not ( = ?auto_813995 ?auto_814005 ) ) ( not ( = ?auto_813995 ?auto_814006 ) ) ( not ( = ?auto_813996 ?auto_813997 ) ) ( not ( = ?auto_813996 ?auto_813998 ) ) ( not ( = ?auto_813996 ?auto_813999 ) ) ( not ( = ?auto_813996 ?auto_814000 ) ) ( not ( = ?auto_813996 ?auto_814001 ) ) ( not ( = ?auto_813996 ?auto_814002 ) ) ( not ( = ?auto_813996 ?auto_814003 ) ) ( not ( = ?auto_813996 ?auto_814004 ) ) ( not ( = ?auto_813996 ?auto_814005 ) ) ( not ( = ?auto_813996 ?auto_814006 ) ) ( not ( = ?auto_813997 ?auto_813998 ) ) ( not ( = ?auto_813997 ?auto_813999 ) ) ( not ( = ?auto_813997 ?auto_814000 ) ) ( not ( = ?auto_813997 ?auto_814001 ) ) ( not ( = ?auto_813997 ?auto_814002 ) ) ( not ( = ?auto_813997 ?auto_814003 ) ) ( not ( = ?auto_813997 ?auto_814004 ) ) ( not ( = ?auto_813997 ?auto_814005 ) ) ( not ( = ?auto_813997 ?auto_814006 ) ) ( not ( = ?auto_813998 ?auto_813999 ) ) ( not ( = ?auto_813998 ?auto_814000 ) ) ( not ( = ?auto_813998 ?auto_814001 ) ) ( not ( = ?auto_813998 ?auto_814002 ) ) ( not ( = ?auto_813998 ?auto_814003 ) ) ( not ( = ?auto_813998 ?auto_814004 ) ) ( not ( = ?auto_813998 ?auto_814005 ) ) ( not ( = ?auto_813998 ?auto_814006 ) ) ( not ( = ?auto_813999 ?auto_814000 ) ) ( not ( = ?auto_813999 ?auto_814001 ) ) ( not ( = ?auto_813999 ?auto_814002 ) ) ( not ( = ?auto_813999 ?auto_814003 ) ) ( not ( = ?auto_813999 ?auto_814004 ) ) ( not ( = ?auto_813999 ?auto_814005 ) ) ( not ( = ?auto_813999 ?auto_814006 ) ) ( not ( = ?auto_814000 ?auto_814001 ) ) ( not ( = ?auto_814000 ?auto_814002 ) ) ( not ( = ?auto_814000 ?auto_814003 ) ) ( not ( = ?auto_814000 ?auto_814004 ) ) ( not ( = ?auto_814000 ?auto_814005 ) ) ( not ( = ?auto_814000 ?auto_814006 ) ) ( not ( = ?auto_814001 ?auto_814002 ) ) ( not ( = ?auto_814001 ?auto_814003 ) ) ( not ( = ?auto_814001 ?auto_814004 ) ) ( not ( = ?auto_814001 ?auto_814005 ) ) ( not ( = ?auto_814001 ?auto_814006 ) ) ( not ( = ?auto_814002 ?auto_814003 ) ) ( not ( = ?auto_814002 ?auto_814004 ) ) ( not ( = ?auto_814002 ?auto_814005 ) ) ( not ( = ?auto_814002 ?auto_814006 ) ) ( not ( = ?auto_814003 ?auto_814004 ) ) ( not ( = ?auto_814003 ?auto_814005 ) ) ( not ( = ?auto_814003 ?auto_814006 ) ) ( not ( = ?auto_814004 ?auto_814005 ) ) ( not ( = ?auto_814004 ?auto_814006 ) ) ( not ( = ?auto_814005 ?auto_814006 ) ) ( ON ?auto_814004 ?auto_814005 ) ( ON ?auto_814003 ?auto_814004 ) ( ON ?auto_814002 ?auto_814003 ) ( ON ?auto_814001 ?auto_814002 ) ( ON ?auto_814000 ?auto_814001 ) ( ON ?auto_813999 ?auto_814000 ) ( ON ?auto_813998 ?auto_813999 ) ( CLEAR ?auto_813996 ) ( ON ?auto_813997 ?auto_813998 ) ( CLEAR ?auto_813997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_813992 ?auto_813993 ?auto_813994 ?auto_813995 ?auto_813996 ?auto_813997 )
      ( MAKE-14PILE ?auto_813992 ?auto_813993 ?auto_813994 ?auto_813995 ?auto_813996 ?auto_813997 ?auto_813998 ?auto_813999 ?auto_814000 ?auto_814001 ?auto_814002 ?auto_814003 ?auto_814004 ?auto_814005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_814050 - BLOCK
      ?auto_814051 - BLOCK
      ?auto_814052 - BLOCK
      ?auto_814053 - BLOCK
      ?auto_814054 - BLOCK
      ?auto_814055 - BLOCK
      ?auto_814056 - BLOCK
      ?auto_814057 - BLOCK
      ?auto_814058 - BLOCK
      ?auto_814059 - BLOCK
      ?auto_814060 - BLOCK
      ?auto_814061 - BLOCK
      ?auto_814062 - BLOCK
      ?auto_814063 - BLOCK
    )
    :vars
    (
      ?auto_814064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814063 ?auto_814064 ) ( ON-TABLE ?auto_814050 ) ( ON ?auto_814051 ?auto_814050 ) ( ON ?auto_814052 ?auto_814051 ) ( ON ?auto_814053 ?auto_814052 ) ( not ( = ?auto_814050 ?auto_814051 ) ) ( not ( = ?auto_814050 ?auto_814052 ) ) ( not ( = ?auto_814050 ?auto_814053 ) ) ( not ( = ?auto_814050 ?auto_814054 ) ) ( not ( = ?auto_814050 ?auto_814055 ) ) ( not ( = ?auto_814050 ?auto_814056 ) ) ( not ( = ?auto_814050 ?auto_814057 ) ) ( not ( = ?auto_814050 ?auto_814058 ) ) ( not ( = ?auto_814050 ?auto_814059 ) ) ( not ( = ?auto_814050 ?auto_814060 ) ) ( not ( = ?auto_814050 ?auto_814061 ) ) ( not ( = ?auto_814050 ?auto_814062 ) ) ( not ( = ?auto_814050 ?auto_814063 ) ) ( not ( = ?auto_814050 ?auto_814064 ) ) ( not ( = ?auto_814051 ?auto_814052 ) ) ( not ( = ?auto_814051 ?auto_814053 ) ) ( not ( = ?auto_814051 ?auto_814054 ) ) ( not ( = ?auto_814051 ?auto_814055 ) ) ( not ( = ?auto_814051 ?auto_814056 ) ) ( not ( = ?auto_814051 ?auto_814057 ) ) ( not ( = ?auto_814051 ?auto_814058 ) ) ( not ( = ?auto_814051 ?auto_814059 ) ) ( not ( = ?auto_814051 ?auto_814060 ) ) ( not ( = ?auto_814051 ?auto_814061 ) ) ( not ( = ?auto_814051 ?auto_814062 ) ) ( not ( = ?auto_814051 ?auto_814063 ) ) ( not ( = ?auto_814051 ?auto_814064 ) ) ( not ( = ?auto_814052 ?auto_814053 ) ) ( not ( = ?auto_814052 ?auto_814054 ) ) ( not ( = ?auto_814052 ?auto_814055 ) ) ( not ( = ?auto_814052 ?auto_814056 ) ) ( not ( = ?auto_814052 ?auto_814057 ) ) ( not ( = ?auto_814052 ?auto_814058 ) ) ( not ( = ?auto_814052 ?auto_814059 ) ) ( not ( = ?auto_814052 ?auto_814060 ) ) ( not ( = ?auto_814052 ?auto_814061 ) ) ( not ( = ?auto_814052 ?auto_814062 ) ) ( not ( = ?auto_814052 ?auto_814063 ) ) ( not ( = ?auto_814052 ?auto_814064 ) ) ( not ( = ?auto_814053 ?auto_814054 ) ) ( not ( = ?auto_814053 ?auto_814055 ) ) ( not ( = ?auto_814053 ?auto_814056 ) ) ( not ( = ?auto_814053 ?auto_814057 ) ) ( not ( = ?auto_814053 ?auto_814058 ) ) ( not ( = ?auto_814053 ?auto_814059 ) ) ( not ( = ?auto_814053 ?auto_814060 ) ) ( not ( = ?auto_814053 ?auto_814061 ) ) ( not ( = ?auto_814053 ?auto_814062 ) ) ( not ( = ?auto_814053 ?auto_814063 ) ) ( not ( = ?auto_814053 ?auto_814064 ) ) ( not ( = ?auto_814054 ?auto_814055 ) ) ( not ( = ?auto_814054 ?auto_814056 ) ) ( not ( = ?auto_814054 ?auto_814057 ) ) ( not ( = ?auto_814054 ?auto_814058 ) ) ( not ( = ?auto_814054 ?auto_814059 ) ) ( not ( = ?auto_814054 ?auto_814060 ) ) ( not ( = ?auto_814054 ?auto_814061 ) ) ( not ( = ?auto_814054 ?auto_814062 ) ) ( not ( = ?auto_814054 ?auto_814063 ) ) ( not ( = ?auto_814054 ?auto_814064 ) ) ( not ( = ?auto_814055 ?auto_814056 ) ) ( not ( = ?auto_814055 ?auto_814057 ) ) ( not ( = ?auto_814055 ?auto_814058 ) ) ( not ( = ?auto_814055 ?auto_814059 ) ) ( not ( = ?auto_814055 ?auto_814060 ) ) ( not ( = ?auto_814055 ?auto_814061 ) ) ( not ( = ?auto_814055 ?auto_814062 ) ) ( not ( = ?auto_814055 ?auto_814063 ) ) ( not ( = ?auto_814055 ?auto_814064 ) ) ( not ( = ?auto_814056 ?auto_814057 ) ) ( not ( = ?auto_814056 ?auto_814058 ) ) ( not ( = ?auto_814056 ?auto_814059 ) ) ( not ( = ?auto_814056 ?auto_814060 ) ) ( not ( = ?auto_814056 ?auto_814061 ) ) ( not ( = ?auto_814056 ?auto_814062 ) ) ( not ( = ?auto_814056 ?auto_814063 ) ) ( not ( = ?auto_814056 ?auto_814064 ) ) ( not ( = ?auto_814057 ?auto_814058 ) ) ( not ( = ?auto_814057 ?auto_814059 ) ) ( not ( = ?auto_814057 ?auto_814060 ) ) ( not ( = ?auto_814057 ?auto_814061 ) ) ( not ( = ?auto_814057 ?auto_814062 ) ) ( not ( = ?auto_814057 ?auto_814063 ) ) ( not ( = ?auto_814057 ?auto_814064 ) ) ( not ( = ?auto_814058 ?auto_814059 ) ) ( not ( = ?auto_814058 ?auto_814060 ) ) ( not ( = ?auto_814058 ?auto_814061 ) ) ( not ( = ?auto_814058 ?auto_814062 ) ) ( not ( = ?auto_814058 ?auto_814063 ) ) ( not ( = ?auto_814058 ?auto_814064 ) ) ( not ( = ?auto_814059 ?auto_814060 ) ) ( not ( = ?auto_814059 ?auto_814061 ) ) ( not ( = ?auto_814059 ?auto_814062 ) ) ( not ( = ?auto_814059 ?auto_814063 ) ) ( not ( = ?auto_814059 ?auto_814064 ) ) ( not ( = ?auto_814060 ?auto_814061 ) ) ( not ( = ?auto_814060 ?auto_814062 ) ) ( not ( = ?auto_814060 ?auto_814063 ) ) ( not ( = ?auto_814060 ?auto_814064 ) ) ( not ( = ?auto_814061 ?auto_814062 ) ) ( not ( = ?auto_814061 ?auto_814063 ) ) ( not ( = ?auto_814061 ?auto_814064 ) ) ( not ( = ?auto_814062 ?auto_814063 ) ) ( not ( = ?auto_814062 ?auto_814064 ) ) ( not ( = ?auto_814063 ?auto_814064 ) ) ( ON ?auto_814062 ?auto_814063 ) ( ON ?auto_814061 ?auto_814062 ) ( ON ?auto_814060 ?auto_814061 ) ( ON ?auto_814059 ?auto_814060 ) ( ON ?auto_814058 ?auto_814059 ) ( ON ?auto_814057 ?auto_814058 ) ( ON ?auto_814056 ?auto_814057 ) ( ON ?auto_814055 ?auto_814056 ) ( CLEAR ?auto_814053 ) ( ON ?auto_814054 ?auto_814055 ) ( CLEAR ?auto_814054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_814050 ?auto_814051 ?auto_814052 ?auto_814053 ?auto_814054 )
      ( MAKE-14PILE ?auto_814050 ?auto_814051 ?auto_814052 ?auto_814053 ?auto_814054 ?auto_814055 ?auto_814056 ?auto_814057 ?auto_814058 ?auto_814059 ?auto_814060 ?auto_814061 ?auto_814062 ?auto_814063 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_814108 - BLOCK
      ?auto_814109 - BLOCK
      ?auto_814110 - BLOCK
      ?auto_814111 - BLOCK
      ?auto_814112 - BLOCK
      ?auto_814113 - BLOCK
      ?auto_814114 - BLOCK
      ?auto_814115 - BLOCK
      ?auto_814116 - BLOCK
      ?auto_814117 - BLOCK
      ?auto_814118 - BLOCK
      ?auto_814119 - BLOCK
      ?auto_814120 - BLOCK
      ?auto_814121 - BLOCK
    )
    :vars
    (
      ?auto_814122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814121 ?auto_814122 ) ( ON-TABLE ?auto_814108 ) ( ON ?auto_814109 ?auto_814108 ) ( ON ?auto_814110 ?auto_814109 ) ( not ( = ?auto_814108 ?auto_814109 ) ) ( not ( = ?auto_814108 ?auto_814110 ) ) ( not ( = ?auto_814108 ?auto_814111 ) ) ( not ( = ?auto_814108 ?auto_814112 ) ) ( not ( = ?auto_814108 ?auto_814113 ) ) ( not ( = ?auto_814108 ?auto_814114 ) ) ( not ( = ?auto_814108 ?auto_814115 ) ) ( not ( = ?auto_814108 ?auto_814116 ) ) ( not ( = ?auto_814108 ?auto_814117 ) ) ( not ( = ?auto_814108 ?auto_814118 ) ) ( not ( = ?auto_814108 ?auto_814119 ) ) ( not ( = ?auto_814108 ?auto_814120 ) ) ( not ( = ?auto_814108 ?auto_814121 ) ) ( not ( = ?auto_814108 ?auto_814122 ) ) ( not ( = ?auto_814109 ?auto_814110 ) ) ( not ( = ?auto_814109 ?auto_814111 ) ) ( not ( = ?auto_814109 ?auto_814112 ) ) ( not ( = ?auto_814109 ?auto_814113 ) ) ( not ( = ?auto_814109 ?auto_814114 ) ) ( not ( = ?auto_814109 ?auto_814115 ) ) ( not ( = ?auto_814109 ?auto_814116 ) ) ( not ( = ?auto_814109 ?auto_814117 ) ) ( not ( = ?auto_814109 ?auto_814118 ) ) ( not ( = ?auto_814109 ?auto_814119 ) ) ( not ( = ?auto_814109 ?auto_814120 ) ) ( not ( = ?auto_814109 ?auto_814121 ) ) ( not ( = ?auto_814109 ?auto_814122 ) ) ( not ( = ?auto_814110 ?auto_814111 ) ) ( not ( = ?auto_814110 ?auto_814112 ) ) ( not ( = ?auto_814110 ?auto_814113 ) ) ( not ( = ?auto_814110 ?auto_814114 ) ) ( not ( = ?auto_814110 ?auto_814115 ) ) ( not ( = ?auto_814110 ?auto_814116 ) ) ( not ( = ?auto_814110 ?auto_814117 ) ) ( not ( = ?auto_814110 ?auto_814118 ) ) ( not ( = ?auto_814110 ?auto_814119 ) ) ( not ( = ?auto_814110 ?auto_814120 ) ) ( not ( = ?auto_814110 ?auto_814121 ) ) ( not ( = ?auto_814110 ?auto_814122 ) ) ( not ( = ?auto_814111 ?auto_814112 ) ) ( not ( = ?auto_814111 ?auto_814113 ) ) ( not ( = ?auto_814111 ?auto_814114 ) ) ( not ( = ?auto_814111 ?auto_814115 ) ) ( not ( = ?auto_814111 ?auto_814116 ) ) ( not ( = ?auto_814111 ?auto_814117 ) ) ( not ( = ?auto_814111 ?auto_814118 ) ) ( not ( = ?auto_814111 ?auto_814119 ) ) ( not ( = ?auto_814111 ?auto_814120 ) ) ( not ( = ?auto_814111 ?auto_814121 ) ) ( not ( = ?auto_814111 ?auto_814122 ) ) ( not ( = ?auto_814112 ?auto_814113 ) ) ( not ( = ?auto_814112 ?auto_814114 ) ) ( not ( = ?auto_814112 ?auto_814115 ) ) ( not ( = ?auto_814112 ?auto_814116 ) ) ( not ( = ?auto_814112 ?auto_814117 ) ) ( not ( = ?auto_814112 ?auto_814118 ) ) ( not ( = ?auto_814112 ?auto_814119 ) ) ( not ( = ?auto_814112 ?auto_814120 ) ) ( not ( = ?auto_814112 ?auto_814121 ) ) ( not ( = ?auto_814112 ?auto_814122 ) ) ( not ( = ?auto_814113 ?auto_814114 ) ) ( not ( = ?auto_814113 ?auto_814115 ) ) ( not ( = ?auto_814113 ?auto_814116 ) ) ( not ( = ?auto_814113 ?auto_814117 ) ) ( not ( = ?auto_814113 ?auto_814118 ) ) ( not ( = ?auto_814113 ?auto_814119 ) ) ( not ( = ?auto_814113 ?auto_814120 ) ) ( not ( = ?auto_814113 ?auto_814121 ) ) ( not ( = ?auto_814113 ?auto_814122 ) ) ( not ( = ?auto_814114 ?auto_814115 ) ) ( not ( = ?auto_814114 ?auto_814116 ) ) ( not ( = ?auto_814114 ?auto_814117 ) ) ( not ( = ?auto_814114 ?auto_814118 ) ) ( not ( = ?auto_814114 ?auto_814119 ) ) ( not ( = ?auto_814114 ?auto_814120 ) ) ( not ( = ?auto_814114 ?auto_814121 ) ) ( not ( = ?auto_814114 ?auto_814122 ) ) ( not ( = ?auto_814115 ?auto_814116 ) ) ( not ( = ?auto_814115 ?auto_814117 ) ) ( not ( = ?auto_814115 ?auto_814118 ) ) ( not ( = ?auto_814115 ?auto_814119 ) ) ( not ( = ?auto_814115 ?auto_814120 ) ) ( not ( = ?auto_814115 ?auto_814121 ) ) ( not ( = ?auto_814115 ?auto_814122 ) ) ( not ( = ?auto_814116 ?auto_814117 ) ) ( not ( = ?auto_814116 ?auto_814118 ) ) ( not ( = ?auto_814116 ?auto_814119 ) ) ( not ( = ?auto_814116 ?auto_814120 ) ) ( not ( = ?auto_814116 ?auto_814121 ) ) ( not ( = ?auto_814116 ?auto_814122 ) ) ( not ( = ?auto_814117 ?auto_814118 ) ) ( not ( = ?auto_814117 ?auto_814119 ) ) ( not ( = ?auto_814117 ?auto_814120 ) ) ( not ( = ?auto_814117 ?auto_814121 ) ) ( not ( = ?auto_814117 ?auto_814122 ) ) ( not ( = ?auto_814118 ?auto_814119 ) ) ( not ( = ?auto_814118 ?auto_814120 ) ) ( not ( = ?auto_814118 ?auto_814121 ) ) ( not ( = ?auto_814118 ?auto_814122 ) ) ( not ( = ?auto_814119 ?auto_814120 ) ) ( not ( = ?auto_814119 ?auto_814121 ) ) ( not ( = ?auto_814119 ?auto_814122 ) ) ( not ( = ?auto_814120 ?auto_814121 ) ) ( not ( = ?auto_814120 ?auto_814122 ) ) ( not ( = ?auto_814121 ?auto_814122 ) ) ( ON ?auto_814120 ?auto_814121 ) ( ON ?auto_814119 ?auto_814120 ) ( ON ?auto_814118 ?auto_814119 ) ( ON ?auto_814117 ?auto_814118 ) ( ON ?auto_814116 ?auto_814117 ) ( ON ?auto_814115 ?auto_814116 ) ( ON ?auto_814114 ?auto_814115 ) ( ON ?auto_814113 ?auto_814114 ) ( ON ?auto_814112 ?auto_814113 ) ( CLEAR ?auto_814110 ) ( ON ?auto_814111 ?auto_814112 ) ( CLEAR ?auto_814111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_814108 ?auto_814109 ?auto_814110 ?auto_814111 )
      ( MAKE-14PILE ?auto_814108 ?auto_814109 ?auto_814110 ?auto_814111 ?auto_814112 ?auto_814113 ?auto_814114 ?auto_814115 ?auto_814116 ?auto_814117 ?auto_814118 ?auto_814119 ?auto_814120 ?auto_814121 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_814166 - BLOCK
      ?auto_814167 - BLOCK
      ?auto_814168 - BLOCK
      ?auto_814169 - BLOCK
      ?auto_814170 - BLOCK
      ?auto_814171 - BLOCK
      ?auto_814172 - BLOCK
      ?auto_814173 - BLOCK
      ?auto_814174 - BLOCK
      ?auto_814175 - BLOCK
      ?auto_814176 - BLOCK
      ?auto_814177 - BLOCK
      ?auto_814178 - BLOCK
      ?auto_814179 - BLOCK
    )
    :vars
    (
      ?auto_814180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814179 ?auto_814180 ) ( ON-TABLE ?auto_814166 ) ( ON ?auto_814167 ?auto_814166 ) ( not ( = ?auto_814166 ?auto_814167 ) ) ( not ( = ?auto_814166 ?auto_814168 ) ) ( not ( = ?auto_814166 ?auto_814169 ) ) ( not ( = ?auto_814166 ?auto_814170 ) ) ( not ( = ?auto_814166 ?auto_814171 ) ) ( not ( = ?auto_814166 ?auto_814172 ) ) ( not ( = ?auto_814166 ?auto_814173 ) ) ( not ( = ?auto_814166 ?auto_814174 ) ) ( not ( = ?auto_814166 ?auto_814175 ) ) ( not ( = ?auto_814166 ?auto_814176 ) ) ( not ( = ?auto_814166 ?auto_814177 ) ) ( not ( = ?auto_814166 ?auto_814178 ) ) ( not ( = ?auto_814166 ?auto_814179 ) ) ( not ( = ?auto_814166 ?auto_814180 ) ) ( not ( = ?auto_814167 ?auto_814168 ) ) ( not ( = ?auto_814167 ?auto_814169 ) ) ( not ( = ?auto_814167 ?auto_814170 ) ) ( not ( = ?auto_814167 ?auto_814171 ) ) ( not ( = ?auto_814167 ?auto_814172 ) ) ( not ( = ?auto_814167 ?auto_814173 ) ) ( not ( = ?auto_814167 ?auto_814174 ) ) ( not ( = ?auto_814167 ?auto_814175 ) ) ( not ( = ?auto_814167 ?auto_814176 ) ) ( not ( = ?auto_814167 ?auto_814177 ) ) ( not ( = ?auto_814167 ?auto_814178 ) ) ( not ( = ?auto_814167 ?auto_814179 ) ) ( not ( = ?auto_814167 ?auto_814180 ) ) ( not ( = ?auto_814168 ?auto_814169 ) ) ( not ( = ?auto_814168 ?auto_814170 ) ) ( not ( = ?auto_814168 ?auto_814171 ) ) ( not ( = ?auto_814168 ?auto_814172 ) ) ( not ( = ?auto_814168 ?auto_814173 ) ) ( not ( = ?auto_814168 ?auto_814174 ) ) ( not ( = ?auto_814168 ?auto_814175 ) ) ( not ( = ?auto_814168 ?auto_814176 ) ) ( not ( = ?auto_814168 ?auto_814177 ) ) ( not ( = ?auto_814168 ?auto_814178 ) ) ( not ( = ?auto_814168 ?auto_814179 ) ) ( not ( = ?auto_814168 ?auto_814180 ) ) ( not ( = ?auto_814169 ?auto_814170 ) ) ( not ( = ?auto_814169 ?auto_814171 ) ) ( not ( = ?auto_814169 ?auto_814172 ) ) ( not ( = ?auto_814169 ?auto_814173 ) ) ( not ( = ?auto_814169 ?auto_814174 ) ) ( not ( = ?auto_814169 ?auto_814175 ) ) ( not ( = ?auto_814169 ?auto_814176 ) ) ( not ( = ?auto_814169 ?auto_814177 ) ) ( not ( = ?auto_814169 ?auto_814178 ) ) ( not ( = ?auto_814169 ?auto_814179 ) ) ( not ( = ?auto_814169 ?auto_814180 ) ) ( not ( = ?auto_814170 ?auto_814171 ) ) ( not ( = ?auto_814170 ?auto_814172 ) ) ( not ( = ?auto_814170 ?auto_814173 ) ) ( not ( = ?auto_814170 ?auto_814174 ) ) ( not ( = ?auto_814170 ?auto_814175 ) ) ( not ( = ?auto_814170 ?auto_814176 ) ) ( not ( = ?auto_814170 ?auto_814177 ) ) ( not ( = ?auto_814170 ?auto_814178 ) ) ( not ( = ?auto_814170 ?auto_814179 ) ) ( not ( = ?auto_814170 ?auto_814180 ) ) ( not ( = ?auto_814171 ?auto_814172 ) ) ( not ( = ?auto_814171 ?auto_814173 ) ) ( not ( = ?auto_814171 ?auto_814174 ) ) ( not ( = ?auto_814171 ?auto_814175 ) ) ( not ( = ?auto_814171 ?auto_814176 ) ) ( not ( = ?auto_814171 ?auto_814177 ) ) ( not ( = ?auto_814171 ?auto_814178 ) ) ( not ( = ?auto_814171 ?auto_814179 ) ) ( not ( = ?auto_814171 ?auto_814180 ) ) ( not ( = ?auto_814172 ?auto_814173 ) ) ( not ( = ?auto_814172 ?auto_814174 ) ) ( not ( = ?auto_814172 ?auto_814175 ) ) ( not ( = ?auto_814172 ?auto_814176 ) ) ( not ( = ?auto_814172 ?auto_814177 ) ) ( not ( = ?auto_814172 ?auto_814178 ) ) ( not ( = ?auto_814172 ?auto_814179 ) ) ( not ( = ?auto_814172 ?auto_814180 ) ) ( not ( = ?auto_814173 ?auto_814174 ) ) ( not ( = ?auto_814173 ?auto_814175 ) ) ( not ( = ?auto_814173 ?auto_814176 ) ) ( not ( = ?auto_814173 ?auto_814177 ) ) ( not ( = ?auto_814173 ?auto_814178 ) ) ( not ( = ?auto_814173 ?auto_814179 ) ) ( not ( = ?auto_814173 ?auto_814180 ) ) ( not ( = ?auto_814174 ?auto_814175 ) ) ( not ( = ?auto_814174 ?auto_814176 ) ) ( not ( = ?auto_814174 ?auto_814177 ) ) ( not ( = ?auto_814174 ?auto_814178 ) ) ( not ( = ?auto_814174 ?auto_814179 ) ) ( not ( = ?auto_814174 ?auto_814180 ) ) ( not ( = ?auto_814175 ?auto_814176 ) ) ( not ( = ?auto_814175 ?auto_814177 ) ) ( not ( = ?auto_814175 ?auto_814178 ) ) ( not ( = ?auto_814175 ?auto_814179 ) ) ( not ( = ?auto_814175 ?auto_814180 ) ) ( not ( = ?auto_814176 ?auto_814177 ) ) ( not ( = ?auto_814176 ?auto_814178 ) ) ( not ( = ?auto_814176 ?auto_814179 ) ) ( not ( = ?auto_814176 ?auto_814180 ) ) ( not ( = ?auto_814177 ?auto_814178 ) ) ( not ( = ?auto_814177 ?auto_814179 ) ) ( not ( = ?auto_814177 ?auto_814180 ) ) ( not ( = ?auto_814178 ?auto_814179 ) ) ( not ( = ?auto_814178 ?auto_814180 ) ) ( not ( = ?auto_814179 ?auto_814180 ) ) ( ON ?auto_814178 ?auto_814179 ) ( ON ?auto_814177 ?auto_814178 ) ( ON ?auto_814176 ?auto_814177 ) ( ON ?auto_814175 ?auto_814176 ) ( ON ?auto_814174 ?auto_814175 ) ( ON ?auto_814173 ?auto_814174 ) ( ON ?auto_814172 ?auto_814173 ) ( ON ?auto_814171 ?auto_814172 ) ( ON ?auto_814170 ?auto_814171 ) ( ON ?auto_814169 ?auto_814170 ) ( CLEAR ?auto_814167 ) ( ON ?auto_814168 ?auto_814169 ) ( CLEAR ?auto_814168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_814166 ?auto_814167 ?auto_814168 )
      ( MAKE-14PILE ?auto_814166 ?auto_814167 ?auto_814168 ?auto_814169 ?auto_814170 ?auto_814171 ?auto_814172 ?auto_814173 ?auto_814174 ?auto_814175 ?auto_814176 ?auto_814177 ?auto_814178 ?auto_814179 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_814224 - BLOCK
      ?auto_814225 - BLOCK
      ?auto_814226 - BLOCK
      ?auto_814227 - BLOCK
      ?auto_814228 - BLOCK
      ?auto_814229 - BLOCK
      ?auto_814230 - BLOCK
      ?auto_814231 - BLOCK
      ?auto_814232 - BLOCK
      ?auto_814233 - BLOCK
      ?auto_814234 - BLOCK
      ?auto_814235 - BLOCK
      ?auto_814236 - BLOCK
      ?auto_814237 - BLOCK
    )
    :vars
    (
      ?auto_814238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814237 ?auto_814238 ) ( ON-TABLE ?auto_814224 ) ( not ( = ?auto_814224 ?auto_814225 ) ) ( not ( = ?auto_814224 ?auto_814226 ) ) ( not ( = ?auto_814224 ?auto_814227 ) ) ( not ( = ?auto_814224 ?auto_814228 ) ) ( not ( = ?auto_814224 ?auto_814229 ) ) ( not ( = ?auto_814224 ?auto_814230 ) ) ( not ( = ?auto_814224 ?auto_814231 ) ) ( not ( = ?auto_814224 ?auto_814232 ) ) ( not ( = ?auto_814224 ?auto_814233 ) ) ( not ( = ?auto_814224 ?auto_814234 ) ) ( not ( = ?auto_814224 ?auto_814235 ) ) ( not ( = ?auto_814224 ?auto_814236 ) ) ( not ( = ?auto_814224 ?auto_814237 ) ) ( not ( = ?auto_814224 ?auto_814238 ) ) ( not ( = ?auto_814225 ?auto_814226 ) ) ( not ( = ?auto_814225 ?auto_814227 ) ) ( not ( = ?auto_814225 ?auto_814228 ) ) ( not ( = ?auto_814225 ?auto_814229 ) ) ( not ( = ?auto_814225 ?auto_814230 ) ) ( not ( = ?auto_814225 ?auto_814231 ) ) ( not ( = ?auto_814225 ?auto_814232 ) ) ( not ( = ?auto_814225 ?auto_814233 ) ) ( not ( = ?auto_814225 ?auto_814234 ) ) ( not ( = ?auto_814225 ?auto_814235 ) ) ( not ( = ?auto_814225 ?auto_814236 ) ) ( not ( = ?auto_814225 ?auto_814237 ) ) ( not ( = ?auto_814225 ?auto_814238 ) ) ( not ( = ?auto_814226 ?auto_814227 ) ) ( not ( = ?auto_814226 ?auto_814228 ) ) ( not ( = ?auto_814226 ?auto_814229 ) ) ( not ( = ?auto_814226 ?auto_814230 ) ) ( not ( = ?auto_814226 ?auto_814231 ) ) ( not ( = ?auto_814226 ?auto_814232 ) ) ( not ( = ?auto_814226 ?auto_814233 ) ) ( not ( = ?auto_814226 ?auto_814234 ) ) ( not ( = ?auto_814226 ?auto_814235 ) ) ( not ( = ?auto_814226 ?auto_814236 ) ) ( not ( = ?auto_814226 ?auto_814237 ) ) ( not ( = ?auto_814226 ?auto_814238 ) ) ( not ( = ?auto_814227 ?auto_814228 ) ) ( not ( = ?auto_814227 ?auto_814229 ) ) ( not ( = ?auto_814227 ?auto_814230 ) ) ( not ( = ?auto_814227 ?auto_814231 ) ) ( not ( = ?auto_814227 ?auto_814232 ) ) ( not ( = ?auto_814227 ?auto_814233 ) ) ( not ( = ?auto_814227 ?auto_814234 ) ) ( not ( = ?auto_814227 ?auto_814235 ) ) ( not ( = ?auto_814227 ?auto_814236 ) ) ( not ( = ?auto_814227 ?auto_814237 ) ) ( not ( = ?auto_814227 ?auto_814238 ) ) ( not ( = ?auto_814228 ?auto_814229 ) ) ( not ( = ?auto_814228 ?auto_814230 ) ) ( not ( = ?auto_814228 ?auto_814231 ) ) ( not ( = ?auto_814228 ?auto_814232 ) ) ( not ( = ?auto_814228 ?auto_814233 ) ) ( not ( = ?auto_814228 ?auto_814234 ) ) ( not ( = ?auto_814228 ?auto_814235 ) ) ( not ( = ?auto_814228 ?auto_814236 ) ) ( not ( = ?auto_814228 ?auto_814237 ) ) ( not ( = ?auto_814228 ?auto_814238 ) ) ( not ( = ?auto_814229 ?auto_814230 ) ) ( not ( = ?auto_814229 ?auto_814231 ) ) ( not ( = ?auto_814229 ?auto_814232 ) ) ( not ( = ?auto_814229 ?auto_814233 ) ) ( not ( = ?auto_814229 ?auto_814234 ) ) ( not ( = ?auto_814229 ?auto_814235 ) ) ( not ( = ?auto_814229 ?auto_814236 ) ) ( not ( = ?auto_814229 ?auto_814237 ) ) ( not ( = ?auto_814229 ?auto_814238 ) ) ( not ( = ?auto_814230 ?auto_814231 ) ) ( not ( = ?auto_814230 ?auto_814232 ) ) ( not ( = ?auto_814230 ?auto_814233 ) ) ( not ( = ?auto_814230 ?auto_814234 ) ) ( not ( = ?auto_814230 ?auto_814235 ) ) ( not ( = ?auto_814230 ?auto_814236 ) ) ( not ( = ?auto_814230 ?auto_814237 ) ) ( not ( = ?auto_814230 ?auto_814238 ) ) ( not ( = ?auto_814231 ?auto_814232 ) ) ( not ( = ?auto_814231 ?auto_814233 ) ) ( not ( = ?auto_814231 ?auto_814234 ) ) ( not ( = ?auto_814231 ?auto_814235 ) ) ( not ( = ?auto_814231 ?auto_814236 ) ) ( not ( = ?auto_814231 ?auto_814237 ) ) ( not ( = ?auto_814231 ?auto_814238 ) ) ( not ( = ?auto_814232 ?auto_814233 ) ) ( not ( = ?auto_814232 ?auto_814234 ) ) ( not ( = ?auto_814232 ?auto_814235 ) ) ( not ( = ?auto_814232 ?auto_814236 ) ) ( not ( = ?auto_814232 ?auto_814237 ) ) ( not ( = ?auto_814232 ?auto_814238 ) ) ( not ( = ?auto_814233 ?auto_814234 ) ) ( not ( = ?auto_814233 ?auto_814235 ) ) ( not ( = ?auto_814233 ?auto_814236 ) ) ( not ( = ?auto_814233 ?auto_814237 ) ) ( not ( = ?auto_814233 ?auto_814238 ) ) ( not ( = ?auto_814234 ?auto_814235 ) ) ( not ( = ?auto_814234 ?auto_814236 ) ) ( not ( = ?auto_814234 ?auto_814237 ) ) ( not ( = ?auto_814234 ?auto_814238 ) ) ( not ( = ?auto_814235 ?auto_814236 ) ) ( not ( = ?auto_814235 ?auto_814237 ) ) ( not ( = ?auto_814235 ?auto_814238 ) ) ( not ( = ?auto_814236 ?auto_814237 ) ) ( not ( = ?auto_814236 ?auto_814238 ) ) ( not ( = ?auto_814237 ?auto_814238 ) ) ( ON ?auto_814236 ?auto_814237 ) ( ON ?auto_814235 ?auto_814236 ) ( ON ?auto_814234 ?auto_814235 ) ( ON ?auto_814233 ?auto_814234 ) ( ON ?auto_814232 ?auto_814233 ) ( ON ?auto_814231 ?auto_814232 ) ( ON ?auto_814230 ?auto_814231 ) ( ON ?auto_814229 ?auto_814230 ) ( ON ?auto_814228 ?auto_814229 ) ( ON ?auto_814227 ?auto_814228 ) ( ON ?auto_814226 ?auto_814227 ) ( CLEAR ?auto_814224 ) ( ON ?auto_814225 ?auto_814226 ) ( CLEAR ?auto_814225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_814224 ?auto_814225 )
      ( MAKE-14PILE ?auto_814224 ?auto_814225 ?auto_814226 ?auto_814227 ?auto_814228 ?auto_814229 ?auto_814230 ?auto_814231 ?auto_814232 ?auto_814233 ?auto_814234 ?auto_814235 ?auto_814236 ?auto_814237 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_814282 - BLOCK
      ?auto_814283 - BLOCK
      ?auto_814284 - BLOCK
      ?auto_814285 - BLOCK
      ?auto_814286 - BLOCK
      ?auto_814287 - BLOCK
      ?auto_814288 - BLOCK
      ?auto_814289 - BLOCK
      ?auto_814290 - BLOCK
      ?auto_814291 - BLOCK
      ?auto_814292 - BLOCK
      ?auto_814293 - BLOCK
      ?auto_814294 - BLOCK
      ?auto_814295 - BLOCK
    )
    :vars
    (
      ?auto_814296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814295 ?auto_814296 ) ( not ( = ?auto_814282 ?auto_814283 ) ) ( not ( = ?auto_814282 ?auto_814284 ) ) ( not ( = ?auto_814282 ?auto_814285 ) ) ( not ( = ?auto_814282 ?auto_814286 ) ) ( not ( = ?auto_814282 ?auto_814287 ) ) ( not ( = ?auto_814282 ?auto_814288 ) ) ( not ( = ?auto_814282 ?auto_814289 ) ) ( not ( = ?auto_814282 ?auto_814290 ) ) ( not ( = ?auto_814282 ?auto_814291 ) ) ( not ( = ?auto_814282 ?auto_814292 ) ) ( not ( = ?auto_814282 ?auto_814293 ) ) ( not ( = ?auto_814282 ?auto_814294 ) ) ( not ( = ?auto_814282 ?auto_814295 ) ) ( not ( = ?auto_814282 ?auto_814296 ) ) ( not ( = ?auto_814283 ?auto_814284 ) ) ( not ( = ?auto_814283 ?auto_814285 ) ) ( not ( = ?auto_814283 ?auto_814286 ) ) ( not ( = ?auto_814283 ?auto_814287 ) ) ( not ( = ?auto_814283 ?auto_814288 ) ) ( not ( = ?auto_814283 ?auto_814289 ) ) ( not ( = ?auto_814283 ?auto_814290 ) ) ( not ( = ?auto_814283 ?auto_814291 ) ) ( not ( = ?auto_814283 ?auto_814292 ) ) ( not ( = ?auto_814283 ?auto_814293 ) ) ( not ( = ?auto_814283 ?auto_814294 ) ) ( not ( = ?auto_814283 ?auto_814295 ) ) ( not ( = ?auto_814283 ?auto_814296 ) ) ( not ( = ?auto_814284 ?auto_814285 ) ) ( not ( = ?auto_814284 ?auto_814286 ) ) ( not ( = ?auto_814284 ?auto_814287 ) ) ( not ( = ?auto_814284 ?auto_814288 ) ) ( not ( = ?auto_814284 ?auto_814289 ) ) ( not ( = ?auto_814284 ?auto_814290 ) ) ( not ( = ?auto_814284 ?auto_814291 ) ) ( not ( = ?auto_814284 ?auto_814292 ) ) ( not ( = ?auto_814284 ?auto_814293 ) ) ( not ( = ?auto_814284 ?auto_814294 ) ) ( not ( = ?auto_814284 ?auto_814295 ) ) ( not ( = ?auto_814284 ?auto_814296 ) ) ( not ( = ?auto_814285 ?auto_814286 ) ) ( not ( = ?auto_814285 ?auto_814287 ) ) ( not ( = ?auto_814285 ?auto_814288 ) ) ( not ( = ?auto_814285 ?auto_814289 ) ) ( not ( = ?auto_814285 ?auto_814290 ) ) ( not ( = ?auto_814285 ?auto_814291 ) ) ( not ( = ?auto_814285 ?auto_814292 ) ) ( not ( = ?auto_814285 ?auto_814293 ) ) ( not ( = ?auto_814285 ?auto_814294 ) ) ( not ( = ?auto_814285 ?auto_814295 ) ) ( not ( = ?auto_814285 ?auto_814296 ) ) ( not ( = ?auto_814286 ?auto_814287 ) ) ( not ( = ?auto_814286 ?auto_814288 ) ) ( not ( = ?auto_814286 ?auto_814289 ) ) ( not ( = ?auto_814286 ?auto_814290 ) ) ( not ( = ?auto_814286 ?auto_814291 ) ) ( not ( = ?auto_814286 ?auto_814292 ) ) ( not ( = ?auto_814286 ?auto_814293 ) ) ( not ( = ?auto_814286 ?auto_814294 ) ) ( not ( = ?auto_814286 ?auto_814295 ) ) ( not ( = ?auto_814286 ?auto_814296 ) ) ( not ( = ?auto_814287 ?auto_814288 ) ) ( not ( = ?auto_814287 ?auto_814289 ) ) ( not ( = ?auto_814287 ?auto_814290 ) ) ( not ( = ?auto_814287 ?auto_814291 ) ) ( not ( = ?auto_814287 ?auto_814292 ) ) ( not ( = ?auto_814287 ?auto_814293 ) ) ( not ( = ?auto_814287 ?auto_814294 ) ) ( not ( = ?auto_814287 ?auto_814295 ) ) ( not ( = ?auto_814287 ?auto_814296 ) ) ( not ( = ?auto_814288 ?auto_814289 ) ) ( not ( = ?auto_814288 ?auto_814290 ) ) ( not ( = ?auto_814288 ?auto_814291 ) ) ( not ( = ?auto_814288 ?auto_814292 ) ) ( not ( = ?auto_814288 ?auto_814293 ) ) ( not ( = ?auto_814288 ?auto_814294 ) ) ( not ( = ?auto_814288 ?auto_814295 ) ) ( not ( = ?auto_814288 ?auto_814296 ) ) ( not ( = ?auto_814289 ?auto_814290 ) ) ( not ( = ?auto_814289 ?auto_814291 ) ) ( not ( = ?auto_814289 ?auto_814292 ) ) ( not ( = ?auto_814289 ?auto_814293 ) ) ( not ( = ?auto_814289 ?auto_814294 ) ) ( not ( = ?auto_814289 ?auto_814295 ) ) ( not ( = ?auto_814289 ?auto_814296 ) ) ( not ( = ?auto_814290 ?auto_814291 ) ) ( not ( = ?auto_814290 ?auto_814292 ) ) ( not ( = ?auto_814290 ?auto_814293 ) ) ( not ( = ?auto_814290 ?auto_814294 ) ) ( not ( = ?auto_814290 ?auto_814295 ) ) ( not ( = ?auto_814290 ?auto_814296 ) ) ( not ( = ?auto_814291 ?auto_814292 ) ) ( not ( = ?auto_814291 ?auto_814293 ) ) ( not ( = ?auto_814291 ?auto_814294 ) ) ( not ( = ?auto_814291 ?auto_814295 ) ) ( not ( = ?auto_814291 ?auto_814296 ) ) ( not ( = ?auto_814292 ?auto_814293 ) ) ( not ( = ?auto_814292 ?auto_814294 ) ) ( not ( = ?auto_814292 ?auto_814295 ) ) ( not ( = ?auto_814292 ?auto_814296 ) ) ( not ( = ?auto_814293 ?auto_814294 ) ) ( not ( = ?auto_814293 ?auto_814295 ) ) ( not ( = ?auto_814293 ?auto_814296 ) ) ( not ( = ?auto_814294 ?auto_814295 ) ) ( not ( = ?auto_814294 ?auto_814296 ) ) ( not ( = ?auto_814295 ?auto_814296 ) ) ( ON ?auto_814294 ?auto_814295 ) ( ON ?auto_814293 ?auto_814294 ) ( ON ?auto_814292 ?auto_814293 ) ( ON ?auto_814291 ?auto_814292 ) ( ON ?auto_814290 ?auto_814291 ) ( ON ?auto_814289 ?auto_814290 ) ( ON ?auto_814288 ?auto_814289 ) ( ON ?auto_814287 ?auto_814288 ) ( ON ?auto_814286 ?auto_814287 ) ( ON ?auto_814285 ?auto_814286 ) ( ON ?auto_814284 ?auto_814285 ) ( ON ?auto_814283 ?auto_814284 ) ( ON ?auto_814282 ?auto_814283 ) ( CLEAR ?auto_814282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_814282 )
      ( MAKE-14PILE ?auto_814282 ?auto_814283 ?auto_814284 ?auto_814285 ?auto_814286 ?auto_814287 ?auto_814288 ?auto_814289 ?auto_814290 ?auto_814291 ?auto_814292 ?auto_814293 ?auto_814294 ?auto_814295 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814341 - BLOCK
      ?auto_814342 - BLOCK
      ?auto_814343 - BLOCK
      ?auto_814344 - BLOCK
      ?auto_814345 - BLOCK
      ?auto_814346 - BLOCK
      ?auto_814347 - BLOCK
      ?auto_814348 - BLOCK
      ?auto_814349 - BLOCK
      ?auto_814350 - BLOCK
      ?auto_814351 - BLOCK
      ?auto_814352 - BLOCK
      ?auto_814353 - BLOCK
      ?auto_814354 - BLOCK
      ?auto_814355 - BLOCK
    )
    :vars
    (
      ?auto_814356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_814354 ) ( ON ?auto_814355 ?auto_814356 ) ( CLEAR ?auto_814355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_814341 ) ( ON ?auto_814342 ?auto_814341 ) ( ON ?auto_814343 ?auto_814342 ) ( ON ?auto_814344 ?auto_814343 ) ( ON ?auto_814345 ?auto_814344 ) ( ON ?auto_814346 ?auto_814345 ) ( ON ?auto_814347 ?auto_814346 ) ( ON ?auto_814348 ?auto_814347 ) ( ON ?auto_814349 ?auto_814348 ) ( ON ?auto_814350 ?auto_814349 ) ( ON ?auto_814351 ?auto_814350 ) ( ON ?auto_814352 ?auto_814351 ) ( ON ?auto_814353 ?auto_814352 ) ( ON ?auto_814354 ?auto_814353 ) ( not ( = ?auto_814341 ?auto_814342 ) ) ( not ( = ?auto_814341 ?auto_814343 ) ) ( not ( = ?auto_814341 ?auto_814344 ) ) ( not ( = ?auto_814341 ?auto_814345 ) ) ( not ( = ?auto_814341 ?auto_814346 ) ) ( not ( = ?auto_814341 ?auto_814347 ) ) ( not ( = ?auto_814341 ?auto_814348 ) ) ( not ( = ?auto_814341 ?auto_814349 ) ) ( not ( = ?auto_814341 ?auto_814350 ) ) ( not ( = ?auto_814341 ?auto_814351 ) ) ( not ( = ?auto_814341 ?auto_814352 ) ) ( not ( = ?auto_814341 ?auto_814353 ) ) ( not ( = ?auto_814341 ?auto_814354 ) ) ( not ( = ?auto_814341 ?auto_814355 ) ) ( not ( = ?auto_814341 ?auto_814356 ) ) ( not ( = ?auto_814342 ?auto_814343 ) ) ( not ( = ?auto_814342 ?auto_814344 ) ) ( not ( = ?auto_814342 ?auto_814345 ) ) ( not ( = ?auto_814342 ?auto_814346 ) ) ( not ( = ?auto_814342 ?auto_814347 ) ) ( not ( = ?auto_814342 ?auto_814348 ) ) ( not ( = ?auto_814342 ?auto_814349 ) ) ( not ( = ?auto_814342 ?auto_814350 ) ) ( not ( = ?auto_814342 ?auto_814351 ) ) ( not ( = ?auto_814342 ?auto_814352 ) ) ( not ( = ?auto_814342 ?auto_814353 ) ) ( not ( = ?auto_814342 ?auto_814354 ) ) ( not ( = ?auto_814342 ?auto_814355 ) ) ( not ( = ?auto_814342 ?auto_814356 ) ) ( not ( = ?auto_814343 ?auto_814344 ) ) ( not ( = ?auto_814343 ?auto_814345 ) ) ( not ( = ?auto_814343 ?auto_814346 ) ) ( not ( = ?auto_814343 ?auto_814347 ) ) ( not ( = ?auto_814343 ?auto_814348 ) ) ( not ( = ?auto_814343 ?auto_814349 ) ) ( not ( = ?auto_814343 ?auto_814350 ) ) ( not ( = ?auto_814343 ?auto_814351 ) ) ( not ( = ?auto_814343 ?auto_814352 ) ) ( not ( = ?auto_814343 ?auto_814353 ) ) ( not ( = ?auto_814343 ?auto_814354 ) ) ( not ( = ?auto_814343 ?auto_814355 ) ) ( not ( = ?auto_814343 ?auto_814356 ) ) ( not ( = ?auto_814344 ?auto_814345 ) ) ( not ( = ?auto_814344 ?auto_814346 ) ) ( not ( = ?auto_814344 ?auto_814347 ) ) ( not ( = ?auto_814344 ?auto_814348 ) ) ( not ( = ?auto_814344 ?auto_814349 ) ) ( not ( = ?auto_814344 ?auto_814350 ) ) ( not ( = ?auto_814344 ?auto_814351 ) ) ( not ( = ?auto_814344 ?auto_814352 ) ) ( not ( = ?auto_814344 ?auto_814353 ) ) ( not ( = ?auto_814344 ?auto_814354 ) ) ( not ( = ?auto_814344 ?auto_814355 ) ) ( not ( = ?auto_814344 ?auto_814356 ) ) ( not ( = ?auto_814345 ?auto_814346 ) ) ( not ( = ?auto_814345 ?auto_814347 ) ) ( not ( = ?auto_814345 ?auto_814348 ) ) ( not ( = ?auto_814345 ?auto_814349 ) ) ( not ( = ?auto_814345 ?auto_814350 ) ) ( not ( = ?auto_814345 ?auto_814351 ) ) ( not ( = ?auto_814345 ?auto_814352 ) ) ( not ( = ?auto_814345 ?auto_814353 ) ) ( not ( = ?auto_814345 ?auto_814354 ) ) ( not ( = ?auto_814345 ?auto_814355 ) ) ( not ( = ?auto_814345 ?auto_814356 ) ) ( not ( = ?auto_814346 ?auto_814347 ) ) ( not ( = ?auto_814346 ?auto_814348 ) ) ( not ( = ?auto_814346 ?auto_814349 ) ) ( not ( = ?auto_814346 ?auto_814350 ) ) ( not ( = ?auto_814346 ?auto_814351 ) ) ( not ( = ?auto_814346 ?auto_814352 ) ) ( not ( = ?auto_814346 ?auto_814353 ) ) ( not ( = ?auto_814346 ?auto_814354 ) ) ( not ( = ?auto_814346 ?auto_814355 ) ) ( not ( = ?auto_814346 ?auto_814356 ) ) ( not ( = ?auto_814347 ?auto_814348 ) ) ( not ( = ?auto_814347 ?auto_814349 ) ) ( not ( = ?auto_814347 ?auto_814350 ) ) ( not ( = ?auto_814347 ?auto_814351 ) ) ( not ( = ?auto_814347 ?auto_814352 ) ) ( not ( = ?auto_814347 ?auto_814353 ) ) ( not ( = ?auto_814347 ?auto_814354 ) ) ( not ( = ?auto_814347 ?auto_814355 ) ) ( not ( = ?auto_814347 ?auto_814356 ) ) ( not ( = ?auto_814348 ?auto_814349 ) ) ( not ( = ?auto_814348 ?auto_814350 ) ) ( not ( = ?auto_814348 ?auto_814351 ) ) ( not ( = ?auto_814348 ?auto_814352 ) ) ( not ( = ?auto_814348 ?auto_814353 ) ) ( not ( = ?auto_814348 ?auto_814354 ) ) ( not ( = ?auto_814348 ?auto_814355 ) ) ( not ( = ?auto_814348 ?auto_814356 ) ) ( not ( = ?auto_814349 ?auto_814350 ) ) ( not ( = ?auto_814349 ?auto_814351 ) ) ( not ( = ?auto_814349 ?auto_814352 ) ) ( not ( = ?auto_814349 ?auto_814353 ) ) ( not ( = ?auto_814349 ?auto_814354 ) ) ( not ( = ?auto_814349 ?auto_814355 ) ) ( not ( = ?auto_814349 ?auto_814356 ) ) ( not ( = ?auto_814350 ?auto_814351 ) ) ( not ( = ?auto_814350 ?auto_814352 ) ) ( not ( = ?auto_814350 ?auto_814353 ) ) ( not ( = ?auto_814350 ?auto_814354 ) ) ( not ( = ?auto_814350 ?auto_814355 ) ) ( not ( = ?auto_814350 ?auto_814356 ) ) ( not ( = ?auto_814351 ?auto_814352 ) ) ( not ( = ?auto_814351 ?auto_814353 ) ) ( not ( = ?auto_814351 ?auto_814354 ) ) ( not ( = ?auto_814351 ?auto_814355 ) ) ( not ( = ?auto_814351 ?auto_814356 ) ) ( not ( = ?auto_814352 ?auto_814353 ) ) ( not ( = ?auto_814352 ?auto_814354 ) ) ( not ( = ?auto_814352 ?auto_814355 ) ) ( not ( = ?auto_814352 ?auto_814356 ) ) ( not ( = ?auto_814353 ?auto_814354 ) ) ( not ( = ?auto_814353 ?auto_814355 ) ) ( not ( = ?auto_814353 ?auto_814356 ) ) ( not ( = ?auto_814354 ?auto_814355 ) ) ( not ( = ?auto_814354 ?auto_814356 ) ) ( not ( = ?auto_814355 ?auto_814356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_814355 ?auto_814356 )
      ( !STACK ?auto_814355 ?auto_814354 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814403 - BLOCK
      ?auto_814404 - BLOCK
      ?auto_814405 - BLOCK
      ?auto_814406 - BLOCK
      ?auto_814407 - BLOCK
      ?auto_814408 - BLOCK
      ?auto_814409 - BLOCK
      ?auto_814410 - BLOCK
      ?auto_814411 - BLOCK
      ?auto_814412 - BLOCK
      ?auto_814413 - BLOCK
      ?auto_814414 - BLOCK
      ?auto_814415 - BLOCK
      ?auto_814416 - BLOCK
      ?auto_814417 - BLOCK
    )
    :vars
    (
      ?auto_814418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814417 ?auto_814418 ) ( ON-TABLE ?auto_814403 ) ( ON ?auto_814404 ?auto_814403 ) ( ON ?auto_814405 ?auto_814404 ) ( ON ?auto_814406 ?auto_814405 ) ( ON ?auto_814407 ?auto_814406 ) ( ON ?auto_814408 ?auto_814407 ) ( ON ?auto_814409 ?auto_814408 ) ( ON ?auto_814410 ?auto_814409 ) ( ON ?auto_814411 ?auto_814410 ) ( ON ?auto_814412 ?auto_814411 ) ( ON ?auto_814413 ?auto_814412 ) ( ON ?auto_814414 ?auto_814413 ) ( ON ?auto_814415 ?auto_814414 ) ( not ( = ?auto_814403 ?auto_814404 ) ) ( not ( = ?auto_814403 ?auto_814405 ) ) ( not ( = ?auto_814403 ?auto_814406 ) ) ( not ( = ?auto_814403 ?auto_814407 ) ) ( not ( = ?auto_814403 ?auto_814408 ) ) ( not ( = ?auto_814403 ?auto_814409 ) ) ( not ( = ?auto_814403 ?auto_814410 ) ) ( not ( = ?auto_814403 ?auto_814411 ) ) ( not ( = ?auto_814403 ?auto_814412 ) ) ( not ( = ?auto_814403 ?auto_814413 ) ) ( not ( = ?auto_814403 ?auto_814414 ) ) ( not ( = ?auto_814403 ?auto_814415 ) ) ( not ( = ?auto_814403 ?auto_814416 ) ) ( not ( = ?auto_814403 ?auto_814417 ) ) ( not ( = ?auto_814403 ?auto_814418 ) ) ( not ( = ?auto_814404 ?auto_814405 ) ) ( not ( = ?auto_814404 ?auto_814406 ) ) ( not ( = ?auto_814404 ?auto_814407 ) ) ( not ( = ?auto_814404 ?auto_814408 ) ) ( not ( = ?auto_814404 ?auto_814409 ) ) ( not ( = ?auto_814404 ?auto_814410 ) ) ( not ( = ?auto_814404 ?auto_814411 ) ) ( not ( = ?auto_814404 ?auto_814412 ) ) ( not ( = ?auto_814404 ?auto_814413 ) ) ( not ( = ?auto_814404 ?auto_814414 ) ) ( not ( = ?auto_814404 ?auto_814415 ) ) ( not ( = ?auto_814404 ?auto_814416 ) ) ( not ( = ?auto_814404 ?auto_814417 ) ) ( not ( = ?auto_814404 ?auto_814418 ) ) ( not ( = ?auto_814405 ?auto_814406 ) ) ( not ( = ?auto_814405 ?auto_814407 ) ) ( not ( = ?auto_814405 ?auto_814408 ) ) ( not ( = ?auto_814405 ?auto_814409 ) ) ( not ( = ?auto_814405 ?auto_814410 ) ) ( not ( = ?auto_814405 ?auto_814411 ) ) ( not ( = ?auto_814405 ?auto_814412 ) ) ( not ( = ?auto_814405 ?auto_814413 ) ) ( not ( = ?auto_814405 ?auto_814414 ) ) ( not ( = ?auto_814405 ?auto_814415 ) ) ( not ( = ?auto_814405 ?auto_814416 ) ) ( not ( = ?auto_814405 ?auto_814417 ) ) ( not ( = ?auto_814405 ?auto_814418 ) ) ( not ( = ?auto_814406 ?auto_814407 ) ) ( not ( = ?auto_814406 ?auto_814408 ) ) ( not ( = ?auto_814406 ?auto_814409 ) ) ( not ( = ?auto_814406 ?auto_814410 ) ) ( not ( = ?auto_814406 ?auto_814411 ) ) ( not ( = ?auto_814406 ?auto_814412 ) ) ( not ( = ?auto_814406 ?auto_814413 ) ) ( not ( = ?auto_814406 ?auto_814414 ) ) ( not ( = ?auto_814406 ?auto_814415 ) ) ( not ( = ?auto_814406 ?auto_814416 ) ) ( not ( = ?auto_814406 ?auto_814417 ) ) ( not ( = ?auto_814406 ?auto_814418 ) ) ( not ( = ?auto_814407 ?auto_814408 ) ) ( not ( = ?auto_814407 ?auto_814409 ) ) ( not ( = ?auto_814407 ?auto_814410 ) ) ( not ( = ?auto_814407 ?auto_814411 ) ) ( not ( = ?auto_814407 ?auto_814412 ) ) ( not ( = ?auto_814407 ?auto_814413 ) ) ( not ( = ?auto_814407 ?auto_814414 ) ) ( not ( = ?auto_814407 ?auto_814415 ) ) ( not ( = ?auto_814407 ?auto_814416 ) ) ( not ( = ?auto_814407 ?auto_814417 ) ) ( not ( = ?auto_814407 ?auto_814418 ) ) ( not ( = ?auto_814408 ?auto_814409 ) ) ( not ( = ?auto_814408 ?auto_814410 ) ) ( not ( = ?auto_814408 ?auto_814411 ) ) ( not ( = ?auto_814408 ?auto_814412 ) ) ( not ( = ?auto_814408 ?auto_814413 ) ) ( not ( = ?auto_814408 ?auto_814414 ) ) ( not ( = ?auto_814408 ?auto_814415 ) ) ( not ( = ?auto_814408 ?auto_814416 ) ) ( not ( = ?auto_814408 ?auto_814417 ) ) ( not ( = ?auto_814408 ?auto_814418 ) ) ( not ( = ?auto_814409 ?auto_814410 ) ) ( not ( = ?auto_814409 ?auto_814411 ) ) ( not ( = ?auto_814409 ?auto_814412 ) ) ( not ( = ?auto_814409 ?auto_814413 ) ) ( not ( = ?auto_814409 ?auto_814414 ) ) ( not ( = ?auto_814409 ?auto_814415 ) ) ( not ( = ?auto_814409 ?auto_814416 ) ) ( not ( = ?auto_814409 ?auto_814417 ) ) ( not ( = ?auto_814409 ?auto_814418 ) ) ( not ( = ?auto_814410 ?auto_814411 ) ) ( not ( = ?auto_814410 ?auto_814412 ) ) ( not ( = ?auto_814410 ?auto_814413 ) ) ( not ( = ?auto_814410 ?auto_814414 ) ) ( not ( = ?auto_814410 ?auto_814415 ) ) ( not ( = ?auto_814410 ?auto_814416 ) ) ( not ( = ?auto_814410 ?auto_814417 ) ) ( not ( = ?auto_814410 ?auto_814418 ) ) ( not ( = ?auto_814411 ?auto_814412 ) ) ( not ( = ?auto_814411 ?auto_814413 ) ) ( not ( = ?auto_814411 ?auto_814414 ) ) ( not ( = ?auto_814411 ?auto_814415 ) ) ( not ( = ?auto_814411 ?auto_814416 ) ) ( not ( = ?auto_814411 ?auto_814417 ) ) ( not ( = ?auto_814411 ?auto_814418 ) ) ( not ( = ?auto_814412 ?auto_814413 ) ) ( not ( = ?auto_814412 ?auto_814414 ) ) ( not ( = ?auto_814412 ?auto_814415 ) ) ( not ( = ?auto_814412 ?auto_814416 ) ) ( not ( = ?auto_814412 ?auto_814417 ) ) ( not ( = ?auto_814412 ?auto_814418 ) ) ( not ( = ?auto_814413 ?auto_814414 ) ) ( not ( = ?auto_814413 ?auto_814415 ) ) ( not ( = ?auto_814413 ?auto_814416 ) ) ( not ( = ?auto_814413 ?auto_814417 ) ) ( not ( = ?auto_814413 ?auto_814418 ) ) ( not ( = ?auto_814414 ?auto_814415 ) ) ( not ( = ?auto_814414 ?auto_814416 ) ) ( not ( = ?auto_814414 ?auto_814417 ) ) ( not ( = ?auto_814414 ?auto_814418 ) ) ( not ( = ?auto_814415 ?auto_814416 ) ) ( not ( = ?auto_814415 ?auto_814417 ) ) ( not ( = ?auto_814415 ?auto_814418 ) ) ( not ( = ?auto_814416 ?auto_814417 ) ) ( not ( = ?auto_814416 ?auto_814418 ) ) ( not ( = ?auto_814417 ?auto_814418 ) ) ( CLEAR ?auto_814415 ) ( ON ?auto_814416 ?auto_814417 ) ( CLEAR ?auto_814416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_814403 ?auto_814404 ?auto_814405 ?auto_814406 ?auto_814407 ?auto_814408 ?auto_814409 ?auto_814410 ?auto_814411 ?auto_814412 ?auto_814413 ?auto_814414 ?auto_814415 ?auto_814416 )
      ( MAKE-15PILE ?auto_814403 ?auto_814404 ?auto_814405 ?auto_814406 ?auto_814407 ?auto_814408 ?auto_814409 ?auto_814410 ?auto_814411 ?auto_814412 ?auto_814413 ?auto_814414 ?auto_814415 ?auto_814416 ?auto_814417 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814465 - BLOCK
      ?auto_814466 - BLOCK
      ?auto_814467 - BLOCK
      ?auto_814468 - BLOCK
      ?auto_814469 - BLOCK
      ?auto_814470 - BLOCK
      ?auto_814471 - BLOCK
      ?auto_814472 - BLOCK
      ?auto_814473 - BLOCK
      ?auto_814474 - BLOCK
      ?auto_814475 - BLOCK
      ?auto_814476 - BLOCK
      ?auto_814477 - BLOCK
      ?auto_814478 - BLOCK
      ?auto_814479 - BLOCK
    )
    :vars
    (
      ?auto_814480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814479 ?auto_814480 ) ( ON-TABLE ?auto_814465 ) ( ON ?auto_814466 ?auto_814465 ) ( ON ?auto_814467 ?auto_814466 ) ( ON ?auto_814468 ?auto_814467 ) ( ON ?auto_814469 ?auto_814468 ) ( ON ?auto_814470 ?auto_814469 ) ( ON ?auto_814471 ?auto_814470 ) ( ON ?auto_814472 ?auto_814471 ) ( ON ?auto_814473 ?auto_814472 ) ( ON ?auto_814474 ?auto_814473 ) ( ON ?auto_814475 ?auto_814474 ) ( ON ?auto_814476 ?auto_814475 ) ( not ( = ?auto_814465 ?auto_814466 ) ) ( not ( = ?auto_814465 ?auto_814467 ) ) ( not ( = ?auto_814465 ?auto_814468 ) ) ( not ( = ?auto_814465 ?auto_814469 ) ) ( not ( = ?auto_814465 ?auto_814470 ) ) ( not ( = ?auto_814465 ?auto_814471 ) ) ( not ( = ?auto_814465 ?auto_814472 ) ) ( not ( = ?auto_814465 ?auto_814473 ) ) ( not ( = ?auto_814465 ?auto_814474 ) ) ( not ( = ?auto_814465 ?auto_814475 ) ) ( not ( = ?auto_814465 ?auto_814476 ) ) ( not ( = ?auto_814465 ?auto_814477 ) ) ( not ( = ?auto_814465 ?auto_814478 ) ) ( not ( = ?auto_814465 ?auto_814479 ) ) ( not ( = ?auto_814465 ?auto_814480 ) ) ( not ( = ?auto_814466 ?auto_814467 ) ) ( not ( = ?auto_814466 ?auto_814468 ) ) ( not ( = ?auto_814466 ?auto_814469 ) ) ( not ( = ?auto_814466 ?auto_814470 ) ) ( not ( = ?auto_814466 ?auto_814471 ) ) ( not ( = ?auto_814466 ?auto_814472 ) ) ( not ( = ?auto_814466 ?auto_814473 ) ) ( not ( = ?auto_814466 ?auto_814474 ) ) ( not ( = ?auto_814466 ?auto_814475 ) ) ( not ( = ?auto_814466 ?auto_814476 ) ) ( not ( = ?auto_814466 ?auto_814477 ) ) ( not ( = ?auto_814466 ?auto_814478 ) ) ( not ( = ?auto_814466 ?auto_814479 ) ) ( not ( = ?auto_814466 ?auto_814480 ) ) ( not ( = ?auto_814467 ?auto_814468 ) ) ( not ( = ?auto_814467 ?auto_814469 ) ) ( not ( = ?auto_814467 ?auto_814470 ) ) ( not ( = ?auto_814467 ?auto_814471 ) ) ( not ( = ?auto_814467 ?auto_814472 ) ) ( not ( = ?auto_814467 ?auto_814473 ) ) ( not ( = ?auto_814467 ?auto_814474 ) ) ( not ( = ?auto_814467 ?auto_814475 ) ) ( not ( = ?auto_814467 ?auto_814476 ) ) ( not ( = ?auto_814467 ?auto_814477 ) ) ( not ( = ?auto_814467 ?auto_814478 ) ) ( not ( = ?auto_814467 ?auto_814479 ) ) ( not ( = ?auto_814467 ?auto_814480 ) ) ( not ( = ?auto_814468 ?auto_814469 ) ) ( not ( = ?auto_814468 ?auto_814470 ) ) ( not ( = ?auto_814468 ?auto_814471 ) ) ( not ( = ?auto_814468 ?auto_814472 ) ) ( not ( = ?auto_814468 ?auto_814473 ) ) ( not ( = ?auto_814468 ?auto_814474 ) ) ( not ( = ?auto_814468 ?auto_814475 ) ) ( not ( = ?auto_814468 ?auto_814476 ) ) ( not ( = ?auto_814468 ?auto_814477 ) ) ( not ( = ?auto_814468 ?auto_814478 ) ) ( not ( = ?auto_814468 ?auto_814479 ) ) ( not ( = ?auto_814468 ?auto_814480 ) ) ( not ( = ?auto_814469 ?auto_814470 ) ) ( not ( = ?auto_814469 ?auto_814471 ) ) ( not ( = ?auto_814469 ?auto_814472 ) ) ( not ( = ?auto_814469 ?auto_814473 ) ) ( not ( = ?auto_814469 ?auto_814474 ) ) ( not ( = ?auto_814469 ?auto_814475 ) ) ( not ( = ?auto_814469 ?auto_814476 ) ) ( not ( = ?auto_814469 ?auto_814477 ) ) ( not ( = ?auto_814469 ?auto_814478 ) ) ( not ( = ?auto_814469 ?auto_814479 ) ) ( not ( = ?auto_814469 ?auto_814480 ) ) ( not ( = ?auto_814470 ?auto_814471 ) ) ( not ( = ?auto_814470 ?auto_814472 ) ) ( not ( = ?auto_814470 ?auto_814473 ) ) ( not ( = ?auto_814470 ?auto_814474 ) ) ( not ( = ?auto_814470 ?auto_814475 ) ) ( not ( = ?auto_814470 ?auto_814476 ) ) ( not ( = ?auto_814470 ?auto_814477 ) ) ( not ( = ?auto_814470 ?auto_814478 ) ) ( not ( = ?auto_814470 ?auto_814479 ) ) ( not ( = ?auto_814470 ?auto_814480 ) ) ( not ( = ?auto_814471 ?auto_814472 ) ) ( not ( = ?auto_814471 ?auto_814473 ) ) ( not ( = ?auto_814471 ?auto_814474 ) ) ( not ( = ?auto_814471 ?auto_814475 ) ) ( not ( = ?auto_814471 ?auto_814476 ) ) ( not ( = ?auto_814471 ?auto_814477 ) ) ( not ( = ?auto_814471 ?auto_814478 ) ) ( not ( = ?auto_814471 ?auto_814479 ) ) ( not ( = ?auto_814471 ?auto_814480 ) ) ( not ( = ?auto_814472 ?auto_814473 ) ) ( not ( = ?auto_814472 ?auto_814474 ) ) ( not ( = ?auto_814472 ?auto_814475 ) ) ( not ( = ?auto_814472 ?auto_814476 ) ) ( not ( = ?auto_814472 ?auto_814477 ) ) ( not ( = ?auto_814472 ?auto_814478 ) ) ( not ( = ?auto_814472 ?auto_814479 ) ) ( not ( = ?auto_814472 ?auto_814480 ) ) ( not ( = ?auto_814473 ?auto_814474 ) ) ( not ( = ?auto_814473 ?auto_814475 ) ) ( not ( = ?auto_814473 ?auto_814476 ) ) ( not ( = ?auto_814473 ?auto_814477 ) ) ( not ( = ?auto_814473 ?auto_814478 ) ) ( not ( = ?auto_814473 ?auto_814479 ) ) ( not ( = ?auto_814473 ?auto_814480 ) ) ( not ( = ?auto_814474 ?auto_814475 ) ) ( not ( = ?auto_814474 ?auto_814476 ) ) ( not ( = ?auto_814474 ?auto_814477 ) ) ( not ( = ?auto_814474 ?auto_814478 ) ) ( not ( = ?auto_814474 ?auto_814479 ) ) ( not ( = ?auto_814474 ?auto_814480 ) ) ( not ( = ?auto_814475 ?auto_814476 ) ) ( not ( = ?auto_814475 ?auto_814477 ) ) ( not ( = ?auto_814475 ?auto_814478 ) ) ( not ( = ?auto_814475 ?auto_814479 ) ) ( not ( = ?auto_814475 ?auto_814480 ) ) ( not ( = ?auto_814476 ?auto_814477 ) ) ( not ( = ?auto_814476 ?auto_814478 ) ) ( not ( = ?auto_814476 ?auto_814479 ) ) ( not ( = ?auto_814476 ?auto_814480 ) ) ( not ( = ?auto_814477 ?auto_814478 ) ) ( not ( = ?auto_814477 ?auto_814479 ) ) ( not ( = ?auto_814477 ?auto_814480 ) ) ( not ( = ?auto_814478 ?auto_814479 ) ) ( not ( = ?auto_814478 ?auto_814480 ) ) ( not ( = ?auto_814479 ?auto_814480 ) ) ( ON ?auto_814478 ?auto_814479 ) ( CLEAR ?auto_814476 ) ( ON ?auto_814477 ?auto_814478 ) ( CLEAR ?auto_814477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_814465 ?auto_814466 ?auto_814467 ?auto_814468 ?auto_814469 ?auto_814470 ?auto_814471 ?auto_814472 ?auto_814473 ?auto_814474 ?auto_814475 ?auto_814476 ?auto_814477 )
      ( MAKE-15PILE ?auto_814465 ?auto_814466 ?auto_814467 ?auto_814468 ?auto_814469 ?auto_814470 ?auto_814471 ?auto_814472 ?auto_814473 ?auto_814474 ?auto_814475 ?auto_814476 ?auto_814477 ?auto_814478 ?auto_814479 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814527 - BLOCK
      ?auto_814528 - BLOCK
      ?auto_814529 - BLOCK
      ?auto_814530 - BLOCK
      ?auto_814531 - BLOCK
      ?auto_814532 - BLOCK
      ?auto_814533 - BLOCK
      ?auto_814534 - BLOCK
      ?auto_814535 - BLOCK
      ?auto_814536 - BLOCK
      ?auto_814537 - BLOCK
      ?auto_814538 - BLOCK
      ?auto_814539 - BLOCK
      ?auto_814540 - BLOCK
      ?auto_814541 - BLOCK
    )
    :vars
    (
      ?auto_814542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814541 ?auto_814542 ) ( ON-TABLE ?auto_814527 ) ( ON ?auto_814528 ?auto_814527 ) ( ON ?auto_814529 ?auto_814528 ) ( ON ?auto_814530 ?auto_814529 ) ( ON ?auto_814531 ?auto_814530 ) ( ON ?auto_814532 ?auto_814531 ) ( ON ?auto_814533 ?auto_814532 ) ( ON ?auto_814534 ?auto_814533 ) ( ON ?auto_814535 ?auto_814534 ) ( ON ?auto_814536 ?auto_814535 ) ( ON ?auto_814537 ?auto_814536 ) ( not ( = ?auto_814527 ?auto_814528 ) ) ( not ( = ?auto_814527 ?auto_814529 ) ) ( not ( = ?auto_814527 ?auto_814530 ) ) ( not ( = ?auto_814527 ?auto_814531 ) ) ( not ( = ?auto_814527 ?auto_814532 ) ) ( not ( = ?auto_814527 ?auto_814533 ) ) ( not ( = ?auto_814527 ?auto_814534 ) ) ( not ( = ?auto_814527 ?auto_814535 ) ) ( not ( = ?auto_814527 ?auto_814536 ) ) ( not ( = ?auto_814527 ?auto_814537 ) ) ( not ( = ?auto_814527 ?auto_814538 ) ) ( not ( = ?auto_814527 ?auto_814539 ) ) ( not ( = ?auto_814527 ?auto_814540 ) ) ( not ( = ?auto_814527 ?auto_814541 ) ) ( not ( = ?auto_814527 ?auto_814542 ) ) ( not ( = ?auto_814528 ?auto_814529 ) ) ( not ( = ?auto_814528 ?auto_814530 ) ) ( not ( = ?auto_814528 ?auto_814531 ) ) ( not ( = ?auto_814528 ?auto_814532 ) ) ( not ( = ?auto_814528 ?auto_814533 ) ) ( not ( = ?auto_814528 ?auto_814534 ) ) ( not ( = ?auto_814528 ?auto_814535 ) ) ( not ( = ?auto_814528 ?auto_814536 ) ) ( not ( = ?auto_814528 ?auto_814537 ) ) ( not ( = ?auto_814528 ?auto_814538 ) ) ( not ( = ?auto_814528 ?auto_814539 ) ) ( not ( = ?auto_814528 ?auto_814540 ) ) ( not ( = ?auto_814528 ?auto_814541 ) ) ( not ( = ?auto_814528 ?auto_814542 ) ) ( not ( = ?auto_814529 ?auto_814530 ) ) ( not ( = ?auto_814529 ?auto_814531 ) ) ( not ( = ?auto_814529 ?auto_814532 ) ) ( not ( = ?auto_814529 ?auto_814533 ) ) ( not ( = ?auto_814529 ?auto_814534 ) ) ( not ( = ?auto_814529 ?auto_814535 ) ) ( not ( = ?auto_814529 ?auto_814536 ) ) ( not ( = ?auto_814529 ?auto_814537 ) ) ( not ( = ?auto_814529 ?auto_814538 ) ) ( not ( = ?auto_814529 ?auto_814539 ) ) ( not ( = ?auto_814529 ?auto_814540 ) ) ( not ( = ?auto_814529 ?auto_814541 ) ) ( not ( = ?auto_814529 ?auto_814542 ) ) ( not ( = ?auto_814530 ?auto_814531 ) ) ( not ( = ?auto_814530 ?auto_814532 ) ) ( not ( = ?auto_814530 ?auto_814533 ) ) ( not ( = ?auto_814530 ?auto_814534 ) ) ( not ( = ?auto_814530 ?auto_814535 ) ) ( not ( = ?auto_814530 ?auto_814536 ) ) ( not ( = ?auto_814530 ?auto_814537 ) ) ( not ( = ?auto_814530 ?auto_814538 ) ) ( not ( = ?auto_814530 ?auto_814539 ) ) ( not ( = ?auto_814530 ?auto_814540 ) ) ( not ( = ?auto_814530 ?auto_814541 ) ) ( not ( = ?auto_814530 ?auto_814542 ) ) ( not ( = ?auto_814531 ?auto_814532 ) ) ( not ( = ?auto_814531 ?auto_814533 ) ) ( not ( = ?auto_814531 ?auto_814534 ) ) ( not ( = ?auto_814531 ?auto_814535 ) ) ( not ( = ?auto_814531 ?auto_814536 ) ) ( not ( = ?auto_814531 ?auto_814537 ) ) ( not ( = ?auto_814531 ?auto_814538 ) ) ( not ( = ?auto_814531 ?auto_814539 ) ) ( not ( = ?auto_814531 ?auto_814540 ) ) ( not ( = ?auto_814531 ?auto_814541 ) ) ( not ( = ?auto_814531 ?auto_814542 ) ) ( not ( = ?auto_814532 ?auto_814533 ) ) ( not ( = ?auto_814532 ?auto_814534 ) ) ( not ( = ?auto_814532 ?auto_814535 ) ) ( not ( = ?auto_814532 ?auto_814536 ) ) ( not ( = ?auto_814532 ?auto_814537 ) ) ( not ( = ?auto_814532 ?auto_814538 ) ) ( not ( = ?auto_814532 ?auto_814539 ) ) ( not ( = ?auto_814532 ?auto_814540 ) ) ( not ( = ?auto_814532 ?auto_814541 ) ) ( not ( = ?auto_814532 ?auto_814542 ) ) ( not ( = ?auto_814533 ?auto_814534 ) ) ( not ( = ?auto_814533 ?auto_814535 ) ) ( not ( = ?auto_814533 ?auto_814536 ) ) ( not ( = ?auto_814533 ?auto_814537 ) ) ( not ( = ?auto_814533 ?auto_814538 ) ) ( not ( = ?auto_814533 ?auto_814539 ) ) ( not ( = ?auto_814533 ?auto_814540 ) ) ( not ( = ?auto_814533 ?auto_814541 ) ) ( not ( = ?auto_814533 ?auto_814542 ) ) ( not ( = ?auto_814534 ?auto_814535 ) ) ( not ( = ?auto_814534 ?auto_814536 ) ) ( not ( = ?auto_814534 ?auto_814537 ) ) ( not ( = ?auto_814534 ?auto_814538 ) ) ( not ( = ?auto_814534 ?auto_814539 ) ) ( not ( = ?auto_814534 ?auto_814540 ) ) ( not ( = ?auto_814534 ?auto_814541 ) ) ( not ( = ?auto_814534 ?auto_814542 ) ) ( not ( = ?auto_814535 ?auto_814536 ) ) ( not ( = ?auto_814535 ?auto_814537 ) ) ( not ( = ?auto_814535 ?auto_814538 ) ) ( not ( = ?auto_814535 ?auto_814539 ) ) ( not ( = ?auto_814535 ?auto_814540 ) ) ( not ( = ?auto_814535 ?auto_814541 ) ) ( not ( = ?auto_814535 ?auto_814542 ) ) ( not ( = ?auto_814536 ?auto_814537 ) ) ( not ( = ?auto_814536 ?auto_814538 ) ) ( not ( = ?auto_814536 ?auto_814539 ) ) ( not ( = ?auto_814536 ?auto_814540 ) ) ( not ( = ?auto_814536 ?auto_814541 ) ) ( not ( = ?auto_814536 ?auto_814542 ) ) ( not ( = ?auto_814537 ?auto_814538 ) ) ( not ( = ?auto_814537 ?auto_814539 ) ) ( not ( = ?auto_814537 ?auto_814540 ) ) ( not ( = ?auto_814537 ?auto_814541 ) ) ( not ( = ?auto_814537 ?auto_814542 ) ) ( not ( = ?auto_814538 ?auto_814539 ) ) ( not ( = ?auto_814538 ?auto_814540 ) ) ( not ( = ?auto_814538 ?auto_814541 ) ) ( not ( = ?auto_814538 ?auto_814542 ) ) ( not ( = ?auto_814539 ?auto_814540 ) ) ( not ( = ?auto_814539 ?auto_814541 ) ) ( not ( = ?auto_814539 ?auto_814542 ) ) ( not ( = ?auto_814540 ?auto_814541 ) ) ( not ( = ?auto_814540 ?auto_814542 ) ) ( not ( = ?auto_814541 ?auto_814542 ) ) ( ON ?auto_814540 ?auto_814541 ) ( ON ?auto_814539 ?auto_814540 ) ( CLEAR ?auto_814537 ) ( ON ?auto_814538 ?auto_814539 ) ( CLEAR ?auto_814538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_814527 ?auto_814528 ?auto_814529 ?auto_814530 ?auto_814531 ?auto_814532 ?auto_814533 ?auto_814534 ?auto_814535 ?auto_814536 ?auto_814537 ?auto_814538 )
      ( MAKE-15PILE ?auto_814527 ?auto_814528 ?auto_814529 ?auto_814530 ?auto_814531 ?auto_814532 ?auto_814533 ?auto_814534 ?auto_814535 ?auto_814536 ?auto_814537 ?auto_814538 ?auto_814539 ?auto_814540 ?auto_814541 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814589 - BLOCK
      ?auto_814590 - BLOCK
      ?auto_814591 - BLOCK
      ?auto_814592 - BLOCK
      ?auto_814593 - BLOCK
      ?auto_814594 - BLOCK
      ?auto_814595 - BLOCK
      ?auto_814596 - BLOCK
      ?auto_814597 - BLOCK
      ?auto_814598 - BLOCK
      ?auto_814599 - BLOCK
      ?auto_814600 - BLOCK
      ?auto_814601 - BLOCK
      ?auto_814602 - BLOCK
      ?auto_814603 - BLOCK
    )
    :vars
    (
      ?auto_814604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814603 ?auto_814604 ) ( ON-TABLE ?auto_814589 ) ( ON ?auto_814590 ?auto_814589 ) ( ON ?auto_814591 ?auto_814590 ) ( ON ?auto_814592 ?auto_814591 ) ( ON ?auto_814593 ?auto_814592 ) ( ON ?auto_814594 ?auto_814593 ) ( ON ?auto_814595 ?auto_814594 ) ( ON ?auto_814596 ?auto_814595 ) ( ON ?auto_814597 ?auto_814596 ) ( ON ?auto_814598 ?auto_814597 ) ( not ( = ?auto_814589 ?auto_814590 ) ) ( not ( = ?auto_814589 ?auto_814591 ) ) ( not ( = ?auto_814589 ?auto_814592 ) ) ( not ( = ?auto_814589 ?auto_814593 ) ) ( not ( = ?auto_814589 ?auto_814594 ) ) ( not ( = ?auto_814589 ?auto_814595 ) ) ( not ( = ?auto_814589 ?auto_814596 ) ) ( not ( = ?auto_814589 ?auto_814597 ) ) ( not ( = ?auto_814589 ?auto_814598 ) ) ( not ( = ?auto_814589 ?auto_814599 ) ) ( not ( = ?auto_814589 ?auto_814600 ) ) ( not ( = ?auto_814589 ?auto_814601 ) ) ( not ( = ?auto_814589 ?auto_814602 ) ) ( not ( = ?auto_814589 ?auto_814603 ) ) ( not ( = ?auto_814589 ?auto_814604 ) ) ( not ( = ?auto_814590 ?auto_814591 ) ) ( not ( = ?auto_814590 ?auto_814592 ) ) ( not ( = ?auto_814590 ?auto_814593 ) ) ( not ( = ?auto_814590 ?auto_814594 ) ) ( not ( = ?auto_814590 ?auto_814595 ) ) ( not ( = ?auto_814590 ?auto_814596 ) ) ( not ( = ?auto_814590 ?auto_814597 ) ) ( not ( = ?auto_814590 ?auto_814598 ) ) ( not ( = ?auto_814590 ?auto_814599 ) ) ( not ( = ?auto_814590 ?auto_814600 ) ) ( not ( = ?auto_814590 ?auto_814601 ) ) ( not ( = ?auto_814590 ?auto_814602 ) ) ( not ( = ?auto_814590 ?auto_814603 ) ) ( not ( = ?auto_814590 ?auto_814604 ) ) ( not ( = ?auto_814591 ?auto_814592 ) ) ( not ( = ?auto_814591 ?auto_814593 ) ) ( not ( = ?auto_814591 ?auto_814594 ) ) ( not ( = ?auto_814591 ?auto_814595 ) ) ( not ( = ?auto_814591 ?auto_814596 ) ) ( not ( = ?auto_814591 ?auto_814597 ) ) ( not ( = ?auto_814591 ?auto_814598 ) ) ( not ( = ?auto_814591 ?auto_814599 ) ) ( not ( = ?auto_814591 ?auto_814600 ) ) ( not ( = ?auto_814591 ?auto_814601 ) ) ( not ( = ?auto_814591 ?auto_814602 ) ) ( not ( = ?auto_814591 ?auto_814603 ) ) ( not ( = ?auto_814591 ?auto_814604 ) ) ( not ( = ?auto_814592 ?auto_814593 ) ) ( not ( = ?auto_814592 ?auto_814594 ) ) ( not ( = ?auto_814592 ?auto_814595 ) ) ( not ( = ?auto_814592 ?auto_814596 ) ) ( not ( = ?auto_814592 ?auto_814597 ) ) ( not ( = ?auto_814592 ?auto_814598 ) ) ( not ( = ?auto_814592 ?auto_814599 ) ) ( not ( = ?auto_814592 ?auto_814600 ) ) ( not ( = ?auto_814592 ?auto_814601 ) ) ( not ( = ?auto_814592 ?auto_814602 ) ) ( not ( = ?auto_814592 ?auto_814603 ) ) ( not ( = ?auto_814592 ?auto_814604 ) ) ( not ( = ?auto_814593 ?auto_814594 ) ) ( not ( = ?auto_814593 ?auto_814595 ) ) ( not ( = ?auto_814593 ?auto_814596 ) ) ( not ( = ?auto_814593 ?auto_814597 ) ) ( not ( = ?auto_814593 ?auto_814598 ) ) ( not ( = ?auto_814593 ?auto_814599 ) ) ( not ( = ?auto_814593 ?auto_814600 ) ) ( not ( = ?auto_814593 ?auto_814601 ) ) ( not ( = ?auto_814593 ?auto_814602 ) ) ( not ( = ?auto_814593 ?auto_814603 ) ) ( not ( = ?auto_814593 ?auto_814604 ) ) ( not ( = ?auto_814594 ?auto_814595 ) ) ( not ( = ?auto_814594 ?auto_814596 ) ) ( not ( = ?auto_814594 ?auto_814597 ) ) ( not ( = ?auto_814594 ?auto_814598 ) ) ( not ( = ?auto_814594 ?auto_814599 ) ) ( not ( = ?auto_814594 ?auto_814600 ) ) ( not ( = ?auto_814594 ?auto_814601 ) ) ( not ( = ?auto_814594 ?auto_814602 ) ) ( not ( = ?auto_814594 ?auto_814603 ) ) ( not ( = ?auto_814594 ?auto_814604 ) ) ( not ( = ?auto_814595 ?auto_814596 ) ) ( not ( = ?auto_814595 ?auto_814597 ) ) ( not ( = ?auto_814595 ?auto_814598 ) ) ( not ( = ?auto_814595 ?auto_814599 ) ) ( not ( = ?auto_814595 ?auto_814600 ) ) ( not ( = ?auto_814595 ?auto_814601 ) ) ( not ( = ?auto_814595 ?auto_814602 ) ) ( not ( = ?auto_814595 ?auto_814603 ) ) ( not ( = ?auto_814595 ?auto_814604 ) ) ( not ( = ?auto_814596 ?auto_814597 ) ) ( not ( = ?auto_814596 ?auto_814598 ) ) ( not ( = ?auto_814596 ?auto_814599 ) ) ( not ( = ?auto_814596 ?auto_814600 ) ) ( not ( = ?auto_814596 ?auto_814601 ) ) ( not ( = ?auto_814596 ?auto_814602 ) ) ( not ( = ?auto_814596 ?auto_814603 ) ) ( not ( = ?auto_814596 ?auto_814604 ) ) ( not ( = ?auto_814597 ?auto_814598 ) ) ( not ( = ?auto_814597 ?auto_814599 ) ) ( not ( = ?auto_814597 ?auto_814600 ) ) ( not ( = ?auto_814597 ?auto_814601 ) ) ( not ( = ?auto_814597 ?auto_814602 ) ) ( not ( = ?auto_814597 ?auto_814603 ) ) ( not ( = ?auto_814597 ?auto_814604 ) ) ( not ( = ?auto_814598 ?auto_814599 ) ) ( not ( = ?auto_814598 ?auto_814600 ) ) ( not ( = ?auto_814598 ?auto_814601 ) ) ( not ( = ?auto_814598 ?auto_814602 ) ) ( not ( = ?auto_814598 ?auto_814603 ) ) ( not ( = ?auto_814598 ?auto_814604 ) ) ( not ( = ?auto_814599 ?auto_814600 ) ) ( not ( = ?auto_814599 ?auto_814601 ) ) ( not ( = ?auto_814599 ?auto_814602 ) ) ( not ( = ?auto_814599 ?auto_814603 ) ) ( not ( = ?auto_814599 ?auto_814604 ) ) ( not ( = ?auto_814600 ?auto_814601 ) ) ( not ( = ?auto_814600 ?auto_814602 ) ) ( not ( = ?auto_814600 ?auto_814603 ) ) ( not ( = ?auto_814600 ?auto_814604 ) ) ( not ( = ?auto_814601 ?auto_814602 ) ) ( not ( = ?auto_814601 ?auto_814603 ) ) ( not ( = ?auto_814601 ?auto_814604 ) ) ( not ( = ?auto_814602 ?auto_814603 ) ) ( not ( = ?auto_814602 ?auto_814604 ) ) ( not ( = ?auto_814603 ?auto_814604 ) ) ( ON ?auto_814602 ?auto_814603 ) ( ON ?auto_814601 ?auto_814602 ) ( ON ?auto_814600 ?auto_814601 ) ( CLEAR ?auto_814598 ) ( ON ?auto_814599 ?auto_814600 ) ( CLEAR ?auto_814599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_814589 ?auto_814590 ?auto_814591 ?auto_814592 ?auto_814593 ?auto_814594 ?auto_814595 ?auto_814596 ?auto_814597 ?auto_814598 ?auto_814599 )
      ( MAKE-15PILE ?auto_814589 ?auto_814590 ?auto_814591 ?auto_814592 ?auto_814593 ?auto_814594 ?auto_814595 ?auto_814596 ?auto_814597 ?auto_814598 ?auto_814599 ?auto_814600 ?auto_814601 ?auto_814602 ?auto_814603 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814651 - BLOCK
      ?auto_814652 - BLOCK
      ?auto_814653 - BLOCK
      ?auto_814654 - BLOCK
      ?auto_814655 - BLOCK
      ?auto_814656 - BLOCK
      ?auto_814657 - BLOCK
      ?auto_814658 - BLOCK
      ?auto_814659 - BLOCK
      ?auto_814660 - BLOCK
      ?auto_814661 - BLOCK
      ?auto_814662 - BLOCK
      ?auto_814663 - BLOCK
      ?auto_814664 - BLOCK
      ?auto_814665 - BLOCK
    )
    :vars
    (
      ?auto_814666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814665 ?auto_814666 ) ( ON-TABLE ?auto_814651 ) ( ON ?auto_814652 ?auto_814651 ) ( ON ?auto_814653 ?auto_814652 ) ( ON ?auto_814654 ?auto_814653 ) ( ON ?auto_814655 ?auto_814654 ) ( ON ?auto_814656 ?auto_814655 ) ( ON ?auto_814657 ?auto_814656 ) ( ON ?auto_814658 ?auto_814657 ) ( ON ?auto_814659 ?auto_814658 ) ( not ( = ?auto_814651 ?auto_814652 ) ) ( not ( = ?auto_814651 ?auto_814653 ) ) ( not ( = ?auto_814651 ?auto_814654 ) ) ( not ( = ?auto_814651 ?auto_814655 ) ) ( not ( = ?auto_814651 ?auto_814656 ) ) ( not ( = ?auto_814651 ?auto_814657 ) ) ( not ( = ?auto_814651 ?auto_814658 ) ) ( not ( = ?auto_814651 ?auto_814659 ) ) ( not ( = ?auto_814651 ?auto_814660 ) ) ( not ( = ?auto_814651 ?auto_814661 ) ) ( not ( = ?auto_814651 ?auto_814662 ) ) ( not ( = ?auto_814651 ?auto_814663 ) ) ( not ( = ?auto_814651 ?auto_814664 ) ) ( not ( = ?auto_814651 ?auto_814665 ) ) ( not ( = ?auto_814651 ?auto_814666 ) ) ( not ( = ?auto_814652 ?auto_814653 ) ) ( not ( = ?auto_814652 ?auto_814654 ) ) ( not ( = ?auto_814652 ?auto_814655 ) ) ( not ( = ?auto_814652 ?auto_814656 ) ) ( not ( = ?auto_814652 ?auto_814657 ) ) ( not ( = ?auto_814652 ?auto_814658 ) ) ( not ( = ?auto_814652 ?auto_814659 ) ) ( not ( = ?auto_814652 ?auto_814660 ) ) ( not ( = ?auto_814652 ?auto_814661 ) ) ( not ( = ?auto_814652 ?auto_814662 ) ) ( not ( = ?auto_814652 ?auto_814663 ) ) ( not ( = ?auto_814652 ?auto_814664 ) ) ( not ( = ?auto_814652 ?auto_814665 ) ) ( not ( = ?auto_814652 ?auto_814666 ) ) ( not ( = ?auto_814653 ?auto_814654 ) ) ( not ( = ?auto_814653 ?auto_814655 ) ) ( not ( = ?auto_814653 ?auto_814656 ) ) ( not ( = ?auto_814653 ?auto_814657 ) ) ( not ( = ?auto_814653 ?auto_814658 ) ) ( not ( = ?auto_814653 ?auto_814659 ) ) ( not ( = ?auto_814653 ?auto_814660 ) ) ( not ( = ?auto_814653 ?auto_814661 ) ) ( not ( = ?auto_814653 ?auto_814662 ) ) ( not ( = ?auto_814653 ?auto_814663 ) ) ( not ( = ?auto_814653 ?auto_814664 ) ) ( not ( = ?auto_814653 ?auto_814665 ) ) ( not ( = ?auto_814653 ?auto_814666 ) ) ( not ( = ?auto_814654 ?auto_814655 ) ) ( not ( = ?auto_814654 ?auto_814656 ) ) ( not ( = ?auto_814654 ?auto_814657 ) ) ( not ( = ?auto_814654 ?auto_814658 ) ) ( not ( = ?auto_814654 ?auto_814659 ) ) ( not ( = ?auto_814654 ?auto_814660 ) ) ( not ( = ?auto_814654 ?auto_814661 ) ) ( not ( = ?auto_814654 ?auto_814662 ) ) ( not ( = ?auto_814654 ?auto_814663 ) ) ( not ( = ?auto_814654 ?auto_814664 ) ) ( not ( = ?auto_814654 ?auto_814665 ) ) ( not ( = ?auto_814654 ?auto_814666 ) ) ( not ( = ?auto_814655 ?auto_814656 ) ) ( not ( = ?auto_814655 ?auto_814657 ) ) ( not ( = ?auto_814655 ?auto_814658 ) ) ( not ( = ?auto_814655 ?auto_814659 ) ) ( not ( = ?auto_814655 ?auto_814660 ) ) ( not ( = ?auto_814655 ?auto_814661 ) ) ( not ( = ?auto_814655 ?auto_814662 ) ) ( not ( = ?auto_814655 ?auto_814663 ) ) ( not ( = ?auto_814655 ?auto_814664 ) ) ( not ( = ?auto_814655 ?auto_814665 ) ) ( not ( = ?auto_814655 ?auto_814666 ) ) ( not ( = ?auto_814656 ?auto_814657 ) ) ( not ( = ?auto_814656 ?auto_814658 ) ) ( not ( = ?auto_814656 ?auto_814659 ) ) ( not ( = ?auto_814656 ?auto_814660 ) ) ( not ( = ?auto_814656 ?auto_814661 ) ) ( not ( = ?auto_814656 ?auto_814662 ) ) ( not ( = ?auto_814656 ?auto_814663 ) ) ( not ( = ?auto_814656 ?auto_814664 ) ) ( not ( = ?auto_814656 ?auto_814665 ) ) ( not ( = ?auto_814656 ?auto_814666 ) ) ( not ( = ?auto_814657 ?auto_814658 ) ) ( not ( = ?auto_814657 ?auto_814659 ) ) ( not ( = ?auto_814657 ?auto_814660 ) ) ( not ( = ?auto_814657 ?auto_814661 ) ) ( not ( = ?auto_814657 ?auto_814662 ) ) ( not ( = ?auto_814657 ?auto_814663 ) ) ( not ( = ?auto_814657 ?auto_814664 ) ) ( not ( = ?auto_814657 ?auto_814665 ) ) ( not ( = ?auto_814657 ?auto_814666 ) ) ( not ( = ?auto_814658 ?auto_814659 ) ) ( not ( = ?auto_814658 ?auto_814660 ) ) ( not ( = ?auto_814658 ?auto_814661 ) ) ( not ( = ?auto_814658 ?auto_814662 ) ) ( not ( = ?auto_814658 ?auto_814663 ) ) ( not ( = ?auto_814658 ?auto_814664 ) ) ( not ( = ?auto_814658 ?auto_814665 ) ) ( not ( = ?auto_814658 ?auto_814666 ) ) ( not ( = ?auto_814659 ?auto_814660 ) ) ( not ( = ?auto_814659 ?auto_814661 ) ) ( not ( = ?auto_814659 ?auto_814662 ) ) ( not ( = ?auto_814659 ?auto_814663 ) ) ( not ( = ?auto_814659 ?auto_814664 ) ) ( not ( = ?auto_814659 ?auto_814665 ) ) ( not ( = ?auto_814659 ?auto_814666 ) ) ( not ( = ?auto_814660 ?auto_814661 ) ) ( not ( = ?auto_814660 ?auto_814662 ) ) ( not ( = ?auto_814660 ?auto_814663 ) ) ( not ( = ?auto_814660 ?auto_814664 ) ) ( not ( = ?auto_814660 ?auto_814665 ) ) ( not ( = ?auto_814660 ?auto_814666 ) ) ( not ( = ?auto_814661 ?auto_814662 ) ) ( not ( = ?auto_814661 ?auto_814663 ) ) ( not ( = ?auto_814661 ?auto_814664 ) ) ( not ( = ?auto_814661 ?auto_814665 ) ) ( not ( = ?auto_814661 ?auto_814666 ) ) ( not ( = ?auto_814662 ?auto_814663 ) ) ( not ( = ?auto_814662 ?auto_814664 ) ) ( not ( = ?auto_814662 ?auto_814665 ) ) ( not ( = ?auto_814662 ?auto_814666 ) ) ( not ( = ?auto_814663 ?auto_814664 ) ) ( not ( = ?auto_814663 ?auto_814665 ) ) ( not ( = ?auto_814663 ?auto_814666 ) ) ( not ( = ?auto_814664 ?auto_814665 ) ) ( not ( = ?auto_814664 ?auto_814666 ) ) ( not ( = ?auto_814665 ?auto_814666 ) ) ( ON ?auto_814664 ?auto_814665 ) ( ON ?auto_814663 ?auto_814664 ) ( ON ?auto_814662 ?auto_814663 ) ( ON ?auto_814661 ?auto_814662 ) ( CLEAR ?auto_814659 ) ( ON ?auto_814660 ?auto_814661 ) ( CLEAR ?auto_814660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_814651 ?auto_814652 ?auto_814653 ?auto_814654 ?auto_814655 ?auto_814656 ?auto_814657 ?auto_814658 ?auto_814659 ?auto_814660 )
      ( MAKE-15PILE ?auto_814651 ?auto_814652 ?auto_814653 ?auto_814654 ?auto_814655 ?auto_814656 ?auto_814657 ?auto_814658 ?auto_814659 ?auto_814660 ?auto_814661 ?auto_814662 ?auto_814663 ?auto_814664 ?auto_814665 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814713 - BLOCK
      ?auto_814714 - BLOCK
      ?auto_814715 - BLOCK
      ?auto_814716 - BLOCK
      ?auto_814717 - BLOCK
      ?auto_814718 - BLOCK
      ?auto_814719 - BLOCK
      ?auto_814720 - BLOCK
      ?auto_814721 - BLOCK
      ?auto_814722 - BLOCK
      ?auto_814723 - BLOCK
      ?auto_814724 - BLOCK
      ?auto_814725 - BLOCK
      ?auto_814726 - BLOCK
      ?auto_814727 - BLOCK
    )
    :vars
    (
      ?auto_814728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814727 ?auto_814728 ) ( ON-TABLE ?auto_814713 ) ( ON ?auto_814714 ?auto_814713 ) ( ON ?auto_814715 ?auto_814714 ) ( ON ?auto_814716 ?auto_814715 ) ( ON ?auto_814717 ?auto_814716 ) ( ON ?auto_814718 ?auto_814717 ) ( ON ?auto_814719 ?auto_814718 ) ( ON ?auto_814720 ?auto_814719 ) ( not ( = ?auto_814713 ?auto_814714 ) ) ( not ( = ?auto_814713 ?auto_814715 ) ) ( not ( = ?auto_814713 ?auto_814716 ) ) ( not ( = ?auto_814713 ?auto_814717 ) ) ( not ( = ?auto_814713 ?auto_814718 ) ) ( not ( = ?auto_814713 ?auto_814719 ) ) ( not ( = ?auto_814713 ?auto_814720 ) ) ( not ( = ?auto_814713 ?auto_814721 ) ) ( not ( = ?auto_814713 ?auto_814722 ) ) ( not ( = ?auto_814713 ?auto_814723 ) ) ( not ( = ?auto_814713 ?auto_814724 ) ) ( not ( = ?auto_814713 ?auto_814725 ) ) ( not ( = ?auto_814713 ?auto_814726 ) ) ( not ( = ?auto_814713 ?auto_814727 ) ) ( not ( = ?auto_814713 ?auto_814728 ) ) ( not ( = ?auto_814714 ?auto_814715 ) ) ( not ( = ?auto_814714 ?auto_814716 ) ) ( not ( = ?auto_814714 ?auto_814717 ) ) ( not ( = ?auto_814714 ?auto_814718 ) ) ( not ( = ?auto_814714 ?auto_814719 ) ) ( not ( = ?auto_814714 ?auto_814720 ) ) ( not ( = ?auto_814714 ?auto_814721 ) ) ( not ( = ?auto_814714 ?auto_814722 ) ) ( not ( = ?auto_814714 ?auto_814723 ) ) ( not ( = ?auto_814714 ?auto_814724 ) ) ( not ( = ?auto_814714 ?auto_814725 ) ) ( not ( = ?auto_814714 ?auto_814726 ) ) ( not ( = ?auto_814714 ?auto_814727 ) ) ( not ( = ?auto_814714 ?auto_814728 ) ) ( not ( = ?auto_814715 ?auto_814716 ) ) ( not ( = ?auto_814715 ?auto_814717 ) ) ( not ( = ?auto_814715 ?auto_814718 ) ) ( not ( = ?auto_814715 ?auto_814719 ) ) ( not ( = ?auto_814715 ?auto_814720 ) ) ( not ( = ?auto_814715 ?auto_814721 ) ) ( not ( = ?auto_814715 ?auto_814722 ) ) ( not ( = ?auto_814715 ?auto_814723 ) ) ( not ( = ?auto_814715 ?auto_814724 ) ) ( not ( = ?auto_814715 ?auto_814725 ) ) ( not ( = ?auto_814715 ?auto_814726 ) ) ( not ( = ?auto_814715 ?auto_814727 ) ) ( not ( = ?auto_814715 ?auto_814728 ) ) ( not ( = ?auto_814716 ?auto_814717 ) ) ( not ( = ?auto_814716 ?auto_814718 ) ) ( not ( = ?auto_814716 ?auto_814719 ) ) ( not ( = ?auto_814716 ?auto_814720 ) ) ( not ( = ?auto_814716 ?auto_814721 ) ) ( not ( = ?auto_814716 ?auto_814722 ) ) ( not ( = ?auto_814716 ?auto_814723 ) ) ( not ( = ?auto_814716 ?auto_814724 ) ) ( not ( = ?auto_814716 ?auto_814725 ) ) ( not ( = ?auto_814716 ?auto_814726 ) ) ( not ( = ?auto_814716 ?auto_814727 ) ) ( not ( = ?auto_814716 ?auto_814728 ) ) ( not ( = ?auto_814717 ?auto_814718 ) ) ( not ( = ?auto_814717 ?auto_814719 ) ) ( not ( = ?auto_814717 ?auto_814720 ) ) ( not ( = ?auto_814717 ?auto_814721 ) ) ( not ( = ?auto_814717 ?auto_814722 ) ) ( not ( = ?auto_814717 ?auto_814723 ) ) ( not ( = ?auto_814717 ?auto_814724 ) ) ( not ( = ?auto_814717 ?auto_814725 ) ) ( not ( = ?auto_814717 ?auto_814726 ) ) ( not ( = ?auto_814717 ?auto_814727 ) ) ( not ( = ?auto_814717 ?auto_814728 ) ) ( not ( = ?auto_814718 ?auto_814719 ) ) ( not ( = ?auto_814718 ?auto_814720 ) ) ( not ( = ?auto_814718 ?auto_814721 ) ) ( not ( = ?auto_814718 ?auto_814722 ) ) ( not ( = ?auto_814718 ?auto_814723 ) ) ( not ( = ?auto_814718 ?auto_814724 ) ) ( not ( = ?auto_814718 ?auto_814725 ) ) ( not ( = ?auto_814718 ?auto_814726 ) ) ( not ( = ?auto_814718 ?auto_814727 ) ) ( not ( = ?auto_814718 ?auto_814728 ) ) ( not ( = ?auto_814719 ?auto_814720 ) ) ( not ( = ?auto_814719 ?auto_814721 ) ) ( not ( = ?auto_814719 ?auto_814722 ) ) ( not ( = ?auto_814719 ?auto_814723 ) ) ( not ( = ?auto_814719 ?auto_814724 ) ) ( not ( = ?auto_814719 ?auto_814725 ) ) ( not ( = ?auto_814719 ?auto_814726 ) ) ( not ( = ?auto_814719 ?auto_814727 ) ) ( not ( = ?auto_814719 ?auto_814728 ) ) ( not ( = ?auto_814720 ?auto_814721 ) ) ( not ( = ?auto_814720 ?auto_814722 ) ) ( not ( = ?auto_814720 ?auto_814723 ) ) ( not ( = ?auto_814720 ?auto_814724 ) ) ( not ( = ?auto_814720 ?auto_814725 ) ) ( not ( = ?auto_814720 ?auto_814726 ) ) ( not ( = ?auto_814720 ?auto_814727 ) ) ( not ( = ?auto_814720 ?auto_814728 ) ) ( not ( = ?auto_814721 ?auto_814722 ) ) ( not ( = ?auto_814721 ?auto_814723 ) ) ( not ( = ?auto_814721 ?auto_814724 ) ) ( not ( = ?auto_814721 ?auto_814725 ) ) ( not ( = ?auto_814721 ?auto_814726 ) ) ( not ( = ?auto_814721 ?auto_814727 ) ) ( not ( = ?auto_814721 ?auto_814728 ) ) ( not ( = ?auto_814722 ?auto_814723 ) ) ( not ( = ?auto_814722 ?auto_814724 ) ) ( not ( = ?auto_814722 ?auto_814725 ) ) ( not ( = ?auto_814722 ?auto_814726 ) ) ( not ( = ?auto_814722 ?auto_814727 ) ) ( not ( = ?auto_814722 ?auto_814728 ) ) ( not ( = ?auto_814723 ?auto_814724 ) ) ( not ( = ?auto_814723 ?auto_814725 ) ) ( not ( = ?auto_814723 ?auto_814726 ) ) ( not ( = ?auto_814723 ?auto_814727 ) ) ( not ( = ?auto_814723 ?auto_814728 ) ) ( not ( = ?auto_814724 ?auto_814725 ) ) ( not ( = ?auto_814724 ?auto_814726 ) ) ( not ( = ?auto_814724 ?auto_814727 ) ) ( not ( = ?auto_814724 ?auto_814728 ) ) ( not ( = ?auto_814725 ?auto_814726 ) ) ( not ( = ?auto_814725 ?auto_814727 ) ) ( not ( = ?auto_814725 ?auto_814728 ) ) ( not ( = ?auto_814726 ?auto_814727 ) ) ( not ( = ?auto_814726 ?auto_814728 ) ) ( not ( = ?auto_814727 ?auto_814728 ) ) ( ON ?auto_814726 ?auto_814727 ) ( ON ?auto_814725 ?auto_814726 ) ( ON ?auto_814724 ?auto_814725 ) ( ON ?auto_814723 ?auto_814724 ) ( ON ?auto_814722 ?auto_814723 ) ( CLEAR ?auto_814720 ) ( ON ?auto_814721 ?auto_814722 ) ( CLEAR ?auto_814721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_814713 ?auto_814714 ?auto_814715 ?auto_814716 ?auto_814717 ?auto_814718 ?auto_814719 ?auto_814720 ?auto_814721 )
      ( MAKE-15PILE ?auto_814713 ?auto_814714 ?auto_814715 ?auto_814716 ?auto_814717 ?auto_814718 ?auto_814719 ?auto_814720 ?auto_814721 ?auto_814722 ?auto_814723 ?auto_814724 ?auto_814725 ?auto_814726 ?auto_814727 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814775 - BLOCK
      ?auto_814776 - BLOCK
      ?auto_814777 - BLOCK
      ?auto_814778 - BLOCK
      ?auto_814779 - BLOCK
      ?auto_814780 - BLOCK
      ?auto_814781 - BLOCK
      ?auto_814782 - BLOCK
      ?auto_814783 - BLOCK
      ?auto_814784 - BLOCK
      ?auto_814785 - BLOCK
      ?auto_814786 - BLOCK
      ?auto_814787 - BLOCK
      ?auto_814788 - BLOCK
      ?auto_814789 - BLOCK
    )
    :vars
    (
      ?auto_814790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814789 ?auto_814790 ) ( ON-TABLE ?auto_814775 ) ( ON ?auto_814776 ?auto_814775 ) ( ON ?auto_814777 ?auto_814776 ) ( ON ?auto_814778 ?auto_814777 ) ( ON ?auto_814779 ?auto_814778 ) ( ON ?auto_814780 ?auto_814779 ) ( ON ?auto_814781 ?auto_814780 ) ( not ( = ?auto_814775 ?auto_814776 ) ) ( not ( = ?auto_814775 ?auto_814777 ) ) ( not ( = ?auto_814775 ?auto_814778 ) ) ( not ( = ?auto_814775 ?auto_814779 ) ) ( not ( = ?auto_814775 ?auto_814780 ) ) ( not ( = ?auto_814775 ?auto_814781 ) ) ( not ( = ?auto_814775 ?auto_814782 ) ) ( not ( = ?auto_814775 ?auto_814783 ) ) ( not ( = ?auto_814775 ?auto_814784 ) ) ( not ( = ?auto_814775 ?auto_814785 ) ) ( not ( = ?auto_814775 ?auto_814786 ) ) ( not ( = ?auto_814775 ?auto_814787 ) ) ( not ( = ?auto_814775 ?auto_814788 ) ) ( not ( = ?auto_814775 ?auto_814789 ) ) ( not ( = ?auto_814775 ?auto_814790 ) ) ( not ( = ?auto_814776 ?auto_814777 ) ) ( not ( = ?auto_814776 ?auto_814778 ) ) ( not ( = ?auto_814776 ?auto_814779 ) ) ( not ( = ?auto_814776 ?auto_814780 ) ) ( not ( = ?auto_814776 ?auto_814781 ) ) ( not ( = ?auto_814776 ?auto_814782 ) ) ( not ( = ?auto_814776 ?auto_814783 ) ) ( not ( = ?auto_814776 ?auto_814784 ) ) ( not ( = ?auto_814776 ?auto_814785 ) ) ( not ( = ?auto_814776 ?auto_814786 ) ) ( not ( = ?auto_814776 ?auto_814787 ) ) ( not ( = ?auto_814776 ?auto_814788 ) ) ( not ( = ?auto_814776 ?auto_814789 ) ) ( not ( = ?auto_814776 ?auto_814790 ) ) ( not ( = ?auto_814777 ?auto_814778 ) ) ( not ( = ?auto_814777 ?auto_814779 ) ) ( not ( = ?auto_814777 ?auto_814780 ) ) ( not ( = ?auto_814777 ?auto_814781 ) ) ( not ( = ?auto_814777 ?auto_814782 ) ) ( not ( = ?auto_814777 ?auto_814783 ) ) ( not ( = ?auto_814777 ?auto_814784 ) ) ( not ( = ?auto_814777 ?auto_814785 ) ) ( not ( = ?auto_814777 ?auto_814786 ) ) ( not ( = ?auto_814777 ?auto_814787 ) ) ( not ( = ?auto_814777 ?auto_814788 ) ) ( not ( = ?auto_814777 ?auto_814789 ) ) ( not ( = ?auto_814777 ?auto_814790 ) ) ( not ( = ?auto_814778 ?auto_814779 ) ) ( not ( = ?auto_814778 ?auto_814780 ) ) ( not ( = ?auto_814778 ?auto_814781 ) ) ( not ( = ?auto_814778 ?auto_814782 ) ) ( not ( = ?auto_814778 ?auto_814783 ) ) ( not ( = ?auto_814778 ?auto_814784 ) ) ( not ( = ?auto_814778 ?auto_814785 ) ) ( not ( = ?auto_814778 ?auto_814786 ) ) ( not ( = ?auto_814778 ?auto_814787 ) ) ( not ( = ?auto_814778 ?auto_814788 ) ) ( not ( = ?auto_814778 ?auto_814789 ) ) ( not ( = ?auto_814778 ?auto_814790 ) ) ( not ( = ?auto_814779 ?auto_814780 ) ) ( not ( = ?auto_814779 ?auto_814781 ) ) ( not ( = ?auto_814779 ?auto_814782 ) ) ( not ( = ?auto_814779 ?auto_814783 ) ) ( not ( = ?auto_814779 ?auto_814784 ) ) ( not ( = ?auto_814779 ?auto_814785 ) ) ( not ( = ?auto_814779 ?auto_814786 ) ) ( not ( = ?auto_814779 ?auto_814787 ) ) ( not ( = ?auto_814779 ?auto_814788 ) ) ( not ( = ?auto_814779 ?auto_814789 ) ) ( not ( = ?auto_814779 ?auto_814790 ) ) ( not ( = ?auto_814780 ?auto_814781 ) ) ( not ( = ?auto_814780 ?auto_814782 ) ) ( not ( = ?auto_814780 ?auto_814783 ) ) ( not ( = ?auto_814780 ?auto_814784 ) ) ( not ( = ?auto_814780 ?auto_814785 ) ) ( not ( = ?auto_814780 ?auto_814786 ) ) ( not ( = ?auto_814780 ?auto_814787 ) ) ( not ( = ?auto_814780 ?auto_814788 ) ) ( not ( = ?auto_814780 ?auto_814789 ) ) ( not ( = ?auto_814780 ?auto_814790 ) ) ( not ( = ?auto_814781 ?auto_814782 ) ) ( not ( = ?auto_814781 ?auto_814783 ) ) ( not ( = ?auto_814781 ?auto_814784 ) ) ( not ( = ?auto_814781 ?auto_814785 ) ) ( not ( = ?auto_814781 ?auto_814786 ) ) ( not ( = ?auto_814781 ?auto_814787 ) ) ( not ( = ?auto_814781 ?auto_814788 ) ) ( not ( = ?auto_814781 ?auto_814789 ) ) ( not ( = ?auto_814781 ?auto_814790 ) ) ( not ( = ?auto_814782 ?auto_814783 ) ) ( not ( = ?auto_814782 ?auto_814784 ) ) ( not ( = ?auto_814782 ?auto_814785 ) ) ( not ( = ?auto_814782 ?auto_814786 ) ) ( not ( = ?auto_814782 ?auto_814787 ) ) ( not ( = ?auto_814782 ?auto_814788 ) ) ( not ( = ?auto_814782 ?auto_814789 ) ) ( not ( = ?auto_814782 ?auto_814790 ) ) ( not ( = ?auto_814783 ?auto_814784 ) ) ( not ( = ?auto_814783 ?auto_814785 ) ) ( not ( = ?auto_814783 ?auto_814786 ) ) ( not ( = ?auto_814783 ?auto_814787 ) ) ( not ( = ?auto_814783 ?auto_814788 ) ) ( not ( = ?auto_814783 ?auto_814789 ) ) ( not ( = ?auto_814783 ?auto_814790 ) ) ( not ( = ?auto_814784 ?auto_814785 ) ) ( not ( = ?auto_814784 ?auto_814786 ) ) ( not ( = ?auto_814784 ?auto_814787 ) ) ( not ( = ?auto_814784 ?auto_814788 ) ) ( not ( = ?auto_814784 ?auto_814789 ) ) ( not ( = ?auto_814784 ?auto_814790 ) ) ( not ( = ?auto_814785 ?auto_814786 ) ) ( not ( = ?auto_814785 ?auto_814787 ) ) ( not ( = ?auto_814785 ?auto_814788 ) ) ( not ( = ?auto_814785 ?auto_814789 ) ) ( not ( = ?auto_814785 ?auto_814790 ) ) ( not ( = ?auto_814786 ?auto_814787 ) ) ( not ( = ?auto_814786 ?auto_814788 ) ) ( not ( = ?auto_814786 ?auto_814789 ) ) ( not ( = ?auto_814786 ?auto_814790 ) ) ( not ( = ?auto_814787 ?auto_814788 ) ) ( not ( = ?auto_814787 ?auto_814789 ) ) ( not ( = ?auto_814787 ?auto_814790 ) ) ( not ( = ?auto_814788 ?auto_814789 ) ) ( not ( = ?auto_814788 ?auto_814790 ) ) ( not ( = ?auto_814789 ?auto_814790 ) ) ( ON ?auto_814788 ?auto_814789 ) ( ON ?auto_814787 ?auto_814788 ) ( ON ?auto_814786 ?auto_814787 ) ( ON ?auto_814785 ?auto_814786 ) ( ON ?auto_814784 ?auto_814785 ) ( ON ?auto_814783 ?auto_814784 ) ( CLEAR ?auto_814781 ) ( ON ?auto_814782 ?auto_814783 ) ( CLEAR ?auto_814782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_814775 ?auto_814776 ?auto_814777 ?auto_814778 ?auto_814779 ?auto_814780 ?auto_814781 ?auto_814782 )
      ( MAKE-15PILE ?auto_814775 ?auto_814776 ?auto_814777 ?auto_814778 ?auto_814779 ?auto_814780 ?auto_814781 ?auto_814782 ?auto_814783 ?auto_814784 ?auto_814785 ?auto_814786 ?auto_814787 ?auto_814788 ?auto_814789 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814837 - BLOCK
      ?auto_814838 - BLOCK
      ?auto_814839 - BLOCK
      ?auto_814840 - BLOCK
      ?auto_814841 - BLOCK
      ?auto_814842 - BLOCK
      ?auto_814843 - BLOCK
      ?auto_814844 - BLOCK
      ?auto_814845 - BLOCK
      ?auto_814846 - BLOCK
      ?auto_814847 - BLOCK
      ?auto_814848 - BLOCK
      ?auto_814849 - BLOCK
      ?auto_814850 - BLOCK
      ?auto_814851 - BLOCK
    )
    :vars
    (
      ?auto_814852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814851 ?auto_814852 ) ( ON-TABLE ?auto_814837 ) ( ON ?auto_814838 ?auto_814837 ) ( ON ?auto_814839 ?auto_814838 ) ( ON ?auto_814840 ?auto_814839 ) ( ON ?auto_814841 ?auto_814840 ) ( ON ?auto_814842 ?auto_814841 ) ( not ( = ?auto_814837 ?auto_814838 ) ) ( not ( = ?auto_814837 ?auto_814839 ) ) ( not ( = ?auto_814837 ?auto_814840 ) ) ( not ( = ?auto_814837 ?auto_814841 ) ) ( not ( = ?auto_814837 ?auto_814842 ) ) ( not ( = ?auto_814837 ?auto_814843 ) ) ( not ( = ?auto_814837 ?auto_814844 ) ) ( not ( = ?auto_814837 ?auto_814845 ) ) ( not ( = ?auto_814837 ?auto_814846 ) ) ( not ( = ?auto_814837 ?auto_814847 ) ) ( not ( = ?auto_814837 ?auto_814848 ) ) ( not ( = ?auto_814837 ?auto_814849 ) ) ( not ( = ?auto_814837 ?auto_814850 ) ) ( not ( = ?auto_814837 ?auto_814851 ) ) ( not ( = ?auto_814837 ?auto_814852 ) ) ( not ( = ?auto_814838 ?auto_814839 ) ) ( not ( = ?auto_814838 ?auto_814840 ) ) ( not ( = ?auto_814838 ?auto_814841 ) ) ( not ( = ?auto_814838 ?auto_814842 ) ) ( not ( = ?auto_814838 ?auto_814843 ) ) ( not ( = ?auto_814838 ?auto_814844 ) ) ( not ( = ?auto_814838 ?auto_814845 ) ) ( not ( = ?auto_814838 ?auto_814846 ) ) ( not ( = ?auto_814838 ?auto_814847 ) ) ( not ( = ?auto_814838 ?auto_814848 ) ) ( not ( = ?auto_814838 ?auto_814849 ) ) ( not ( = ?auto_814838 ?auto_814850 ) ) ( not ( = ?auto_814838 ?auto_814851 ) ) ( not ( = ?auto_814838 ?auto_814852 ) ) ( not ( = ?auto_814839 ?auto_814840 ) ) ( not ( = ?auto_814839 ?auto_814841 ) ) ( not ( = ?auto_814839 ?auto_814842 ) ) ( not ( = ?auto_814839 ?auto_814843 ) ) ( not ( = ?auto_814839 ?auto_814844 ) ) ( not ( = ?auto_814839 ?auto_814845 ) ) ( not ( = ?auto_814839 ?auto_814846 ) ) ( not ( = ?auto_814839 ?auto_814847 ) ) ( not ( = ?auto_814839 ?auto_814848 ) ) ( not ( = ?auto_814839 ?auto_814849 ) ) ( not ( = ?auto_814839 ?auto_814850 ) ) ( not ( = ?auto_814839 ?auto_814851 ) ) ( not ( = ?auto_814839 ?auto_814852 ) ) ( not ( = ?auto_814840 ?auto_814841 ) ) ( not ( = ?auto_814840 ?auto_814842 ) ) ( not ( = ?auto_814840 ?auto_814843 ) ) ( not ( = ?auto_814840 ?auto_814844 ) ) ( not ( = ?auto_814840 ?auto_814845 ) ) ( not ( = ?auto_814840 ?auto_814846 ) ) ( not ( = ?auto_814840 ?auto_814847 ) ) ( not ( = ?auto_814840 ?auto_814848 ) ) ( not ( = ?auto_814840 ?auto_814849 ) ) ( not ( = ?auto_814840 ?auto_814850 ) ) ( not ( = ?auto_814840 ?auto_814851 ) ) ( not ( = ?auto_814840 ?auto_814852 ) ) ( not ( = ?auto_814841 ?auto_814842 ) ) ( not ( = ?auto_814841 ?auto_814843 ) ) ( not ( = ?auto_814841 ?auto_814844 ) ) ( not ( = ?auto_814841 ?auto_814845 ) ) ( not ( = ?auto_814841 ?auto_814846 ) ) ( not ( = ?auto_814841 ?auto_814847 ) ) ( not ( = ?auto_814841 ?auto_814848 ) ) ( not ( = ?auto_814841 ?auto_814849 ) ) ( not ( = ?auto_814841 ?auto_814850 ) ) ( not ( = ?auto_814841 ?auto_814851 ) ) ( not ( = ?auto_814841 ?auto_814852 ) ) ( not ( = ?auto_814842 ?auto_814843 ) ) ( not ( = ?auto_814842 ?auto_814844 ) ) ( not ( = ?auto_814842 ?auto_814845 ) ) ( not ( = ?auto_814842 ?auto_814846 ) ) ( not ( = ?auto_814842 ?auto_814847 ) ) ( not ( = ?auto_814842 ?auto_814848 ) ) ( not ( = ?auto_814842 ?auto_814849 ) ) ( not ( = ?auto_814842 ?auto_814850 ) ) ( not ( = ?auto_814842 ?auto_814851 ) ) ( not ( = ?auto_814842 ?auto_814852 ) ) ( not ( = ?auto_814843 ?auto_814844 ) ) ( not ( = ?auto_814843 ?auto_814845 ) ) ( not ( = ?auto_814843 ?auto_814846 ) ) ( not ( = ?auto_814843 ?auto_814847 ) ) ( not ( = ?auto_814843 ?auto_814848 ) ) ( not ( = ?auto_814843 ?auto_814849 ) ) ( not ( = ?auto_814843 ?auto_814850 ) ) ( not ( = ?auto_814843 ?auto_814851 ) ) ( not ( = ?auto_814843 ?auto_814852 ) ) ( not ( = ?auto_814844 ?auto_814845 ) ) ( not ( = ?auto_814844 ?auto_814846 ) ) ( not ( = ?auto_814844 ?auto_814847 ) ) ( not ( = ?auto_814844 ?auto_814848 ) ) ( not ( = ?auto_814844 ?auto_814849 ) ) ( not ( = ?auto_814844 ?auto_814850 ) ) ( not ( = ?auto_814844 ?auto_814851 ) ) ( not ( = ?auto_814844 ?auto_814852 ) ) ( not ( = ?auto_814845 ?auto_814846 ) ) ( not ( = ?auto_814845 ?auto_814847 ) ) ( not ( = ?auto_814845 ?auto_814848 ) ) ( not ( = ?auto_814845 ?auto_814849 ) ) ( not ( = ?auto_814845 ?auto_814850 ) ) ( not ( = ?auto_814845 ?auto_814851 ) ) ( not ( = ?auto_814845 ?auto_814852 ) ) ( not ( = ?auto_814846 ?auto_814847 ) ) ( not ( = ?auto_814846 ?auto_814848 ) ) ( not ( = ?auto_814846 ?auto_814849 ) ) ( not ( = ?auto_814846 ?auto_814850 ) ) ( not ( = ?auto_814846 ?auto_814851 ) ) ( not ( = ?auto_814846 ?auto_814852 ) ) ( not ( = ?auto_814847 ?auto_814848 ) ) ( not ( = ?auto_814847 ?auto_814849 ) ) ( not ( = ?auto_814847 ?auto_814850 ) ) ( not ( = ?auto_814847 ?auto_814851 ) ) ( not ( = ?auto_814847 ?auto_814852 ) ) ( not ( = ?auto_814848 ?auto_814849 ) ) ( not ( = ?auto_814848 ?auto_814850 ) ) ( not ( = ?auto_814848 ?auto_814851 ) ) ( not ( = ?auto_814848 ?auto_814852 ) ) ( not ( = ?auto_814849 ?auto_814850 ) ) ( not ( = ?auto_814849 ?auto_814851 ) ) ( not ( = ?auto_814849 ?auto_814852 ) ) ( not ( = ?auto_814850 ?auto_814851 ) ) ( not ( = ?auto_814850 ?auto_814852 ) ) ( not ( = ?auto_814851 ?auto_814852 ) ) ( ON ?auto_814850 ?auto_814851 ) ( ON ?auto_814849 ?auto_814850 ) ( ON ?auto_814848 ?auto_814849 ) ( ON ?auto_814847 ?auto_814848 ) ( ON ?auto_814846 ?auto_814847 ) ( ON ?auto_814845 ?auto_814846 ) ( ON ?auto_814844 ?auto_814845 ) ( CLEAR ?auto_814842 ) ( ON ?auto_814843 ?auto_814844 ) ( CLEAR ?auto_814843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_814837 ?auto_814838 ?auto_814839 ?auto_814840 ?auto_814841 ?auto_814842 ?auto_814843 )
      ( MAKE-15PILE ?auto_814837 ?auto_814838 ?auto_814839 ?auto_814840 ?auto_814841 ?auto_814842 ?auto_814843 ?auto_814844 ?auto_814845 ?auto_814846 ?auto_814847 ?auto_814848 ?auto_814849 ?auto_814850 ?auto_814851 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814899 - BLOCK
      ?auto_814900 - BLOCK
      ?auto_814901 - BLOCK
      ?auto_814902 - BLOCK
      ?auto_814903 - BLOCK
      ?auto_814904 - BLOCK
      ?auto_814905 - BLOCK
      ?auto_814906 - BLOCK
      ?auto_814907 - BLOCK
      ?auto_814908 - BLOCK
      ?auto_814909 - BLOCK
      ?auto_814910 - BLOCK
      ?auto_814911 - BLOCK
      ?auto_814912 - BLOCK
      ?auto_814913 - BLOCK
    )
    :vars
    (
      ?auto_814914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814913 ?auto_814914 ) ( ON-TABLE ?auto_814899 ) ( ON ?auto_814900 ?auto_814899 ) ( ON ?auto_814901 ?auto_814900 ) ( ON ?auto_814902 ?auto_814901 ) ( ON ?auto_814903 ?auto_814902 ) ( not ( = ?auto_814899 ?auto_814900 ) ) ( not ( = ?auto_814899 ?auto_814901 ) ) ( not ( = ?auto_814899 ?auto_814902 ) ) ( not ( = ?auto_814899 ?auto_814903 ) ) ( not ( = ?auto_814899 ?auto_814904 ) ) ( not ( = ?auto_814899 ?auto_814905 ) ) ( not ( = ?auto_814899 ?auto_814906 ) ) ( not ( = ?auto_814899 ?auto_814907 ) ) ( not ( = ?auto_814899 ?auto_814908 ) ) ( not ( = ?auto_814899 ?auto_814909 ) ) ( not ( = ?auto_814899 ?auto_814910 ) ) ( not ( = ?auto_814899 ?auto_814911 ) ) ( not ( = ?auto_814899 ?auto_814912 ) ) ( not ( = ?auto_814899 ?auto_814913 ) ) ( not ( = ?auto_814899 ?auto_814914 ) ) ( not ( = ?auto_814900 ?auto_814901 ) ) ( not ( = ?auto_814900 ?auto_814902 ) ) ( not ( = ?auto_814900 ?auto_814903 ) ) ( not ( = ?auto_814900 ?auto_814904 ) ) ( not ( = ?auto_814900 ?auto_814905 ) ) ( not ( = ?auto_814900 ?auto_814906 ) ) ( not ( = ?auto_814900 ?auto_814907 ) ) ( not ( = ?auto_814900 ?auto_814908 ) ) ( not ( = ?auto_814900 ?auto_814909 ) ) ( not ( = ?auto_814900 ?auto_814910 ) ) ( not ( = ?auto_814900 ?auto_814911 ) ) ( not ( = ?auto_814900 ?auto_814912 ) ) ( not ( = ?auto_814900 ?auto_814913 ) ) ( not ( = ?auto_814900 ?auto_814914 ) ) ( not ( = ?auto_814901 ?auto_814902 ) ) ( not ( = ?auto_814901 ?auto_814903 ) ) ( not ( = ?auto_814901 ?auto_814904 ) ) ( not ( = ?auto_814901 ?auto_814905 ) ) ( not ( = ?auto_814901 ?auto_814906 ) ) ( not ( = ?auto_814901 ?auto_814907 ) ) ( not ( = ?auto_814901 ?auto_814908 ) ) ( not ( = ?auto_814901 ?auto_814909 ) ) ( not ( = ?auto_814901 ?auto_814910 ) ) ( not ( = ?auto_814901 ?auto_814911 ) ) ( not ( = ?auto_814901 ?auto_814912 ) ) ( not ( = ?auto_814901 ?auto_814913 ) ) ( not ( = ?auto_814901 ?auto_814914 ) ) ( not ( = ?auto_814902 ?auto_814903 ) ) ( not ( = ?auto_814902 ?auto_814904 ) ) ( not ( = ?auto_814902 ?auto_814905 ) ) ( not ( = ?auto_814902 ?auto_814906 ) ) ( not ( = ?auto_814902 ?auto_814907 ) ) ( not ( = ?auto_814902 ?auto_814908 ) ) ( not ( = ?auto_814902 ?auto_814909 ) ) ( not ( = ?auto_814902 ?auto_814910 ) ) ( not ( = ?auto_814902 ?auto_814911 ) ) ( not ( = ?auto_814902 ?auto_814912 ) ) ( not ( = ?auto_814902 ?auto_814913 ) ) ( not ( = ?auto_814902 ?auto_814914 ) ) ( not ( = ?auto_814903 ?auto_814904 ) ) ( not ( = ?auto_814903 ?auto_814905 ) ) ( not ( = ?auto_814903 ?auto_814906 ) ) ( not ( = ?auto_814903 ?auto_814907 ) ) ( not ( = ?auto_814903 ?auto_814908 ) ) ( not ( = ?auto_814903 ?auto_814909 ) ) ( not ( = ?auto_814903 ?auto_814910 ) ) ( not ( = ?auto_814903 ?auto_814911 ) ) ( not ( = ?auto_814903 ?auto_814912 ) ) ( not ( = ?auto_814903 ?auto_814913 ) ) ( not ( = ?auto_814903 ?auto_814914 ) ) ( not ( = ?auto_814904 ?auto_814905 ) ) ( not ( = ?auto_814904 ?auto_814906 ) ) ( not ( = ?auto_814904 ?auto_814907 ) ) ( not ( = ?auto_814904 ?auto_814908 ) ) ( not ( = ?auto_814904 ?auto_814909 ) ) ( not ( = ?auto_814904 ?auto_814910 ) ) ( not ( = ?auto_814904 ?auto_814911 ) ) ( not ( = ?auto_814904 ?auto_814912 ) ) ( not ( = ?auto_814904 ?auto_814913 ) ) ( not ( = ?auto_814904 ?auto_814914 ) ) ( not ( = ?auto_814905 ?auto_814906 ) ) ( not ( = ?auto_814905 ?auto_814907 ) ) ( not ( = ?auto_814905 ?auto_814908 ) ) ( not ( = ?auto_814905 ?auto_814909 ) ) ( not ( = ?auto_814905 ?auto_814910 ) ) ( not ( = ?auto_814905 ?auto_814911 ) ) ( not ( = ?auto_814905 ?auto_814912 ) ) ( not ( = ?auto_814905 ?auto_814913 ) ) ( not ( = ?auto_814905 ?auto_814914 ) ) ( not ( = ?auto_814906 ?auto_814907 ) ) ( not ( = ?auto_814906 ?auto_814908 ) ) ( not ( = ?auto_814906 ?auto_814909 ) ) ( not ( = ?auto_814906 ?auto_814910 ) ) ( not ( = ?auto_814906 ?auto_814911 ) ) ( not ( = ?auto_814906 ?auto_814912 ) ) ( not ( = ?auto_814906 ?auto_814913 ) ) ( not ( = ?auto_814906 ?auto_814914 ) ) ( not ( = ?auto_814907 ?auto_814908 ) ) ( not ( = ?auto_814907 ?auto_814909 ) ) ( not ( = ?auto_814907 ?auto_814910 ) ) ( not ( = ?auto_814907 ?auto_814911 ) ) ( not ( = ?auto_814907 ?auto_814912 ) ) ( not ( = ?auto_814907 ?auto_814913 ) ) ( not ( = ?auto_814907 ?auto_814914 ) ) ( not ( = ?auto_814908 ?auto_814909 ) ) ( not ( = ?auto_814908 ?auto_814910 ) ) ( not ( = ?auto_814908 ?auto_814911 ) ) ( not ( = ?auto_814908 ?auto_814912 ) ) ( not ( = ?auto_814908 ?auto_814913 ) ) ( not ( = ?auto_814908 ?auto_814914 ) ) ( not ( = ?auto_814909 ?auto_814910 ) ) ( not ( = ?auto_814909 ?auto_814911 ) ) ( not ( = ?auto_814909 ?auto_814912 ) ) ( not ( = ?auto_814909 ?auto_814913 ) ) ( not ( = ?auto_814909 ?auto_814914 ) ) ( not ( = ?auto_814910 ?auto_814911 ) ) ( not ( = ?auto_814910 ?auto_814912 ) ) ( not ( = ?auto_814910 ?auto_814913 ) ) ( not ( = ?auto_814910 ?auto_814914 ) ) ( not ( = ?auto_814911 ?auto_814912 ) ) ( not ( = ?auto_814911 ?auto_814913 ) ) ( not ( = ?auto_814911 ?auto_814914 ) ) ( not ( = ?auto_814912 ?auto_814913 ) ) ( not ( = ?auto_814912 ?auto_814914 ) ) ( not ( = ?auto_814913 ?auto_814914 ) ) ( ON ?auto_814912 ?auto_814913 ) ( ON ?auto_814911 ?auto_814912 ) ( ON ?auto_814910 ?auto_814911 ) ( ON ?auto_814909 ?auto_814910 ) ( ON ?auto_814908 ?auto_814909 ) ( ON ?auto_814907 ?auto_814908 ) ( ON ?auto_814906 ?auto_814907 ) ( ON ?auto_814905 ?auto_814906 ) ( CLEAR ?auto_814903 ) ( ON ?auto_814904 ?auto_814905 ) ( CLEAR ?auto_814904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_814899 ?auto_814900 ?auto_814901 ?auto_814902 ?auto_814903 ?auto_814904 )
      ( MAKE-15PILE ?auto_814899 ?auto_814900 ?auto_814901 ?auto_814902 ?auto_814903 ?auto_814904 ?auto_814905 ?auto_814906 ?auto_814907 ?auto_814908 ?auto_814909 ?auto_814910 ?auto_814911 ?auto_814912 ?auto_814913 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_814961 - BLOCK
      ?auto_814962 - BLOCK
      ?auto_814963 - BLOCK
      ?auto_814964 - BLOCK
      ?auto_814965 - BLOCK
      ?auto_814966 - BLOCK
      ?auto_814967 - BLOCK
      ?auto_814968 - BLOCK
      ?auto_814969 - BLOCK
      ?auto_814970 - BLOCK
      ?auto_814971 - BLOCK
      ?auto_814972 - BLOCK
      ?auto_814973 - BLOCK
      ?auto_814974 - BLOCK
      ?auto_814975 - BLOCK
    )
    :vars
    (
      ?auto_814976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814975 ?auto_814976 ) ( ON-TABLE ?auto_814961 ) ( ON ?auto_814962 ?auto_814961 ) ( ON ?auto_814963 ?auto_814962 ) ( ON ?auto_814964 ?auto_814963 ) ( not ( = ?auto_814961 ?auto_814962 ) ) ( not ( = ?auto_814961 ?auto_814963 ) ) ( not ( = ?auto_814961 ?auto_814964 ) ) ( not ( = ?auto_814961 ?auto_814965 ) ) ( not ( = ?auto_814961 ?auto_814966 ) ) ( not ( = ?auto_814961 ?auto_814967 ) ) ( not ( = ?auto_814961 ?auto_814968 ) ) ( not ( = ?auto_814961 ?auto_814969 ) ) ( not ( = ?auto_814961 ?auto_814970 ) ) ( not ( = ?auto_814961 ?auto_814971 ) ) ( not ( = ?auto_814961 ?auto_814972 ) ) ( not ( = ?auto_814961 ?auto_814973 ) ) ( not ( = ?auto_814961 ?auto_814974 ) ) ( not ( = ?auto_814961 ?auto_814975 ) ) ( not ( = ?auto_814961 ?auto_814976 ) ) ( not ( = ?auto_814962 ?auto_814963 ) ) ( not ( = ?auto_814962 ?auto_814964 ) ) ( not ( = ?auto_814962 ?auto_814965 ) ) ( not ( = ?auto_814962 ?auto_814966 ) ) ( not ( = ?auto_814962 ?auto_814967 ) ) ( not ( = ?auto_814962 ?auto_814968 ) ) ( not ( = ?auto_814962 ?auto_814969 ) ) ( not ( = ?auto_814962 ?auto_814970 ) ) ( not ( = ?auto_814962 ?auto_814971 ) ) ( not ( = ?auto_814962 ?auto_814972 ) ) ( not ( = ?auto_814962 ?auto_814973 ) ) ( not ( = ?auto_814962 ?auto_814974 ) ) ( not ( = ?auto_814962 ?auto_814975 ) ) ( not ( = ?auto_814962 ?auto_814976 ) ) ( not ( = ?auto_814963 ?auto_814964 ) ) ( not ( = ?auto_814963 ?auto_814965 ) ) ( not ( = ?auto_814963 ?auto_814966 ) ) ( not ( = ?auto_814963 ?auto_814967 ) ) ( not ( = ?auto_814963 ?auto_814968 ) ) ( not ( = ?auto_814963 ?auto_814969 ) ) ( not ( = ?auto_814963 ?auto_814970 ) ) ( not ( = ?auto_814963 ?auto_814971 ) ) ( not ( = ?auto_814963 ?auto_814972 ) ) ( not ( = ?auto_814963 ?auto_814973 ) ) ( not ( = ?auto_814963 ?auto_814974 ) ) ( not ( = ?auto_814963 ?auto_814975 ) ) ( not ( = ?auto_814963 ?auto_814976 ) ) ( not ( = ?auto_814964 ?auto_814965 ) ) ( not ( = ?auto_814964 ?auto_814966 ) ) ( not ( = ?auto_814964 ?auto_814967 ) ) ( not ( = ?auto_814964 ?auto_814968 ) ) ( not ( = ?auto_814964 ?auto_814969 ) ) ( not ( = ?auto_814964 ?auto_814970 ) ) ( not ( = ?auto_814964 ?auto_814971 ) ) ( not ( = ?auto_814964 ?auto_814972 ) ) ( not ( = ?auto_814964 ?auto_814973 ) ) ( not ( = ?auto_814964 ?auto_814974 ) ) ( not ( = ?auto_814964 ?auto_814975 ) ) ( not ( = ?auto_814964 ?auto_814976 ) ) ( not ( = ?auto_814965 ?auto_814966 ) ) ( not ( = ?auto_814965 ?auto_814967 ) ) ( not ( = ?auto_814965 ?auto_814968 ) ) ( not ( = ?auto_814965 ?auto_814969 ) ) ( not ( = ?auto_814965 ?auto_814970 ) ) ( not ( = ?auto_814965 ?auto_814971 ) ) ( not ( = ?auto_814965 ?auto_814972 ) ) ( not ( = ?auto_814965 ?auto_814973 ) ) ( not ( = ?auto_814965 ?auto_814974 ) ) ( not ( = ?auto_814965 ?auto_814975 ) ) ( not ( = ?auto_814965 ?auto_814976 ) ) ( not ( = ?auto_814966 ?auto_814967 ) ) ( not ( = ?auto_814966 ?auto_814968 ) ) ( not ( = ?auto_814966 ?auto_814969 ) ) ( not ( = ?auto_814966 ?auto_814970 ) ) ( not ( = ?auto_814966 ?auto_814971 ) ) ( not ( = ?auto_814966 ?auto_814972 ) ) ( not ( = ?auto_814966 ?auto_814973 ) ) ( not ( = ?auto_814966 ?auto_814974 ) ) ( not ( = ?auto_814966 ?auto_814975 ) ) ( not ( = ?auto_814966 ?auto_814976 ) ) ( not ( = ?auto_814967 ?auto_814968 ) ) ( not ( = ?auto_814967 ?auto_814969 ) ) ( not ( = ?auto_814967 ?auto_814970 ) ) ( not ( = ?auto_814967 ?auto_814971 ) ) ( not ( = ?auto_814967 ?auto_814972 ) ) ( not ( = ?auto_814967 ?auto_814973 ) ) ( not ( = ?auto_814967 ?auto_814974 ) ) ( not ( = ?auto_814967 ?auto_814975 ) ) ( not ( = ?auto_814967 ?auto_814976 ) ) ( not ( = ?auto_814968 ?auto_814969 ) ) ( not ( = ?auto_814968 ?auto_814970 ) ) ( not ( = ?auto_814968 ?auto_814971 ) ) ( not ( = ?auto_814968 ?auto_814972 ) ) ( not ( = ?auto_814968 ?auto_814973 ) ) ( not ( = ?auto_814968 ?auto_814974 ) ) ( not ( = ?auto_814968 ?auto_814975 ) ) ( not ( = ?auto_814968 ?auto_814976 ) ) ( not ( = ?auto_814969 ?auto_814970 ) ) ( not ( = ?auto_814969 ?auto_814971 ) ) ( not ( = ?auto_814969 ?auto_814972 ) ) ( not ( = ?auto_814969 ?auto_814973 ) ) ( not ( = ?auto_814969 ?auto_814974 ) ) ( not ( = ?auto_814969 ?auto_814975 ) ) ( not ( = ?auto_814969 ?auto_814976 ) ) ( not ( = ?auto_814970 ?auto_814971 ) ) ( not ( = ?auto_814970 ?auto_814972 ) ) ( not ( = ?auto_814970 ?auto_814973 ) ) ( not ( = ?auto_814970 ?auto_814974 ) ) ( not ( = ?auto_814970 ?auto_814975 ) ) ( not ( = ?auto_814970 ?auto_814976 ) ) ( not ( = ?auto_814971 ?auto_814972 ) ) ( not ( = ?auto_814971 ?auto_814973 ) ) ( not ( = ?auto_814971 ?auto_814974 ) ) ( not ( = ?auto_814971 ?auto_814975 ) ) ( not ( = ?auto_814971 ?auto_814976 ) ) ( not ( = ?auto_814972 ?auto_814973 ) ) ( not ( = ?auto_814972 ?auto_814974 ) ) ( not ( = ?auto_814972 ?auto_814975 ) ) ( not ( = ?auto_814972 ?auto_814976 ) ) ( not ( = ?auto_814973 ?auto_814974 ) ) ( not ( = ?auto_814973 ?auto_814975 ) ) ( not ( = ?auto_814973 ?auto_814976 ) ) ( not ( = ?auto_814974 ?auto_814975 ) ) ( not ( = ?auto_814974 ?auto_814976 ) ) ( not ( = ?auto_814975 ?auto_814976 ) ) ( ON ?auto_814974 ?auto_814975 ) ( ON ?auto_814973 ?auto_814974 ) ( ON ?auto_814972 ?auto_814973 ) ( ON ?auto_814971 ?auto_814972 ) ( ON ?auto_814970 ?auto_814971 ) ( ON ?auto_814969 ?auto_814970 ) ( ON ?auto_814968 ?auto_814969 ) ( ON ?auto_814967 ?auto_814968 ) ( ON ?auto_814966 ?auto_814967 ) ( CLEAR ?auto_814964 ) ( ON ?auto_814965 ?auto_814966 ) ( CLEAR ?auto_814965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_814961 ?auto_814962 ?auto_814963 ?auto_814964 ?auto_814965 )
      ( MAKE-15PILE ?auto_814961 ?auto_814962 ?auto_814963 ?auto_814964 ?auto_814965 ?auto_814966 ?auto_814967 ?auto_814968 ?auto_814969 ?auto_814970 ?auto_814971 ?auto_814972 ?auto_814973 ?auto_814974 ?auto_814975 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_815023 - BLOCK
      ?auto_815024 - BLOCK
      ?auto_815025 - BLOCK
      ?auto_815026 - BLOCK
      ?auto_815027 - BLOCK
      ?auto_815028 - BLOCK
      ?auto_815029 - BLOCK
      ?auto_815030 - BLOCK
      ?auto_815031 - BLOCK
      ?auto_815032 - BLOCK
      ?auto_815033 - BLOCK
      ?auto_815034 - BLOCK
      ?auto_815035 - BLOCK
      ?auto_815036 - BLOCK
      ?auto_815037 - BLOCK
    )
    :vars
    (
      ?auto_815038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815037 ?auto_815038 ) ( ON-TABLE ?auto_815023 ) ( ON ?auto_815024 ?auto_815023 ) ( ON ?auto_815025 ?auto_815024 ) ( not ( = ?auto_815023 ?auto_815024 ) ) ( not ( = ?auto_815023 ?auto_815025 ) ) ( not ( = ?auto_815023 ?auto_815026 ) ) ( not ( = ?auto_815023 ?auto_815027 ) ) ( not ( = ?auto_815023 ?auto_815028 ) ) ( not ( = ?auto_815023 ?auto_815029 ) ) ( not ( = ?auto_815023 ?auto_815030 ) ) ( not ( = ?auto_815023 ?auto_815031 ) ) ( not ( = ?auto_815023 ?auto_815032 ) ) ( not ( = ?auto_815023 ?auto_815033 ) ) ( not ( = ?auto_815023 ?auto_815034 ) ) ( not ( = ?auto_815023 ?auto_815035 ) ) ( not ( = ?auto_815023 ?auto_815036 ) ) ( not ( = ?auto_815023 ?auto_815037 ) ) ( not ( = ?auto_815023 ?auto_815038 ) ) ( not ( = ?auto_815024 ?auto_815025 ) ) ( not ( = ?auto_815024 ?auto_815026 ) ) ( not ( = ?auto_815024 ?auto_815027 ) ) ( not ( = ?auto_815024 ?auto_815028 ) ) ( not ( = ?auto_815024 ?auto_815029 ) ) ( not ( = ?auto_815024 ?auto_815030 ) ) ( not ( = ?auto_815024 ?auto_815031 ) ) ( not ( = ?auto_815024 ?auto_815032 ) ) ( not ( = ?auto_815024 ?auto_815033 ) ) ( not ( = ?auto_815024 ?auto_815034 ) ) ( not ( = ?auto_815024 ?auto_815035 ) ) ( not ( = ?auto_815024 ?auto_815036 ) ) ( not ( = ?auto_815024 ?auto_815037 ) ) ( not ( = ?auto_815024 ?auto_815038 ) ) ( not ( = ?auto_815025 ?auto_815026 ) ) ( not ( = ?auto_815025 ?auto_815027 ) ) ( not ( = ?auto_815025 ?auto_815028 ) ) ( not ( = ?auto_815025 ?auto_815029 ) ) ( not ( = ?auto_815025 ?auto_815030 ) ) ( not ( = ?auto_815025 ?auto_815031 ) ) ( not ( = ?auto_815025 ?auto_815032 ) ) ( not ( = ?auto_815025 ?auto_815033 ) ) ( not ( = ?auto_815025 ?auto_815034 ) ) ( not ( = ?auto_815025 ?auto_815035 ) ) ( not ( = ?auto_815025 ?auto_815036 ) ) ( not ( = ?auto_815025 ?auto_815037 ) ) ( not ( = ?auto_815025 ?auto_815038 ) ) ( not ( = ?auto_815026 ?auto_815027 ) ) ( not ( = ?auto_815026 ?auto_815028 ) ) ( not ( = ?auto_815026 ?auto_815029 ) ) ( not ( = ?auto_815026 ?auto_815030 ) ) ( not ( = ?auto_815026 ?auto_815031 ) ) ( not ( = ?auto_815026 ?auto_815032 ) ) ( not ( = ?auto_815026 ?auto_815033 ) ) ( not ( = ?auto_815026 ?auto_815034 ) ) ( not ( = ?auto_815026 ?auto_815035 ) ) ( not ( = ?auto_815026 ?auto_815036 ) ) ( not ( = ?auto_815026 ?auto_815037 ) ) ( not ( = ?auto_815026 ?auto_815038 ) ) ( not ( = ?auto_815027 ?auto_815028 ) ) ( not ( = ?auto_815027 ?auto_815029 ) ) ( not ( = ?auto_815027 ?auto_815030 ) ) ( not ( = ?auto_815027 ?auto_815031 ) ) ( not ( = ?auto_815027 ?auto_815032 ) ) ( not ( = ?auto_815027 ?auto_815033 ) ) ( not ( = ?auto_815027 ?auto_815034 ) ) ( not ( = ?auto_815027 ?auto_815035 ) ) ( not ( = ?auto_815027 ?auto_815036 ) ) ( not ( = ?auto_815027 ?auto_815037 ) ) ( not ( = ?auto_815027 ?auto_815038 ) ) ( not ( = ?auto_815028 ?auto_815029 ) ) ( not ( = ?auto_815028 ?auto_815030 ) ) ( not ( = ?auto_815028 ?auto_815031 ) ) ( not ( = ?auto_815028 ?auto_815032 ) ) ( not ( = ?auto_815028 ?auto_815033 ) ) ( not ( = ?auto_815028 ?auto_815034 ) ) ( not ( = ?auto_815028 ?auto_815035 ) ) ( not ( = ?auto_815028 ?auto_815036 ) ) ( not ( = ?auto_815028 ?auto_815037 ) ) ( not ( = ?auto_815028 ?auto_815038 ) ) ( not ( = ?auto_815029 ?auto_815030 ) ) ( not ( = ?auto_815029 ?auto_815031 ) ) ( not ( = ?auto_815029 ?auto_815032 ) ) ( not ( = ?auto_815029 ?auto_815033 ) ) ( not ( = ?auto_815029 ?auto_815034 ) ) ( not ( = ?auto_815029 ?auto_815035 ) ) ( not ( = ?auto_815029 ?auto_815036 ) ) ( not ( = ?auto_815029 ?auto_815037 ) ) ( not ( = ?auto_815029 ?auto_815038 ) ) ( not ( = ?auto_815030 ?auto_815031 ) ) ( not ( = ?auto_815030 ?auto_815032 ) ) ( not ( = ?auto_815030 ?auto_815033 ) ) ( not ( = ?auto_815030 ?auto_815034 ) ) ( not ( = ?auto_815030 ?auto_815035 ) ) ( not ( = ?auto_815030 ?auto_815036 ) ) ( not ( = ?auto_815030 ?auto_815037 ) ) ( not ( = ?auto_815030 ?auto_815038 ) ) ( not ( = ?auto_815031 ?auto_815032 ) ) ( not ( = ?auto_815031 ?auto_815033 ) ) ( not ( = ?auto_815031 ?auto_815034 ) ) ( not ( = ?auto_815031 ?auto_815035 ) ) ( not ( = ?auto_815031 ?auto_815036 ) ) ( not ( = ?auto_815031 ?auto_815037 ) ) ( not ( = ?auto_815031 ?auto_815038 ) ) ( not ( = ?auto_815032 ?auto_815033 ) ) ( not ( = ?auto_815032 ?auto_815034 ) ) ( not ( = ?auto_815032 ?auto_815035 ) ) ( not ( = ?auto_815032 ?auto_815036 ) ) ( not ( = ?auto_815032 ?auto_815037 ) ) ( not ( = ?auto_815032 ?auto_815038 ) ) ( not ( = ?auto_815033 ?auto_815034 ) ) ( not ( = ?auto_815033 ?auto_815035 ) ) ( not ( = ?auto_815033 ?auto_815036 ) ) ( not ( = ?auto_815033 ?auto_815037 ) ) ( not ( = ?auto_815033 ?auto_815038 ) ) ( not ( = ?auto_815034 ?auto_815035 ) ) ( not ( = ?auto_815034 ?auto_815036 ) ) ( not ( = ?auto_815034 ?auto_815037 ) ) ( not ( = ?auto_815034 ?auto_815038 ) ) ( not ( = ?auto_815035 ?auto_815036 ) ) ( not ( = ?auto_815035 ?auto_815037 ) ) ( not ( = ?auto_815035 ?auto_815038 ) ) ( not ( = ?auto_815036 ?auto_815037 ) ) ( not ( = ?auto_815036 ?auto_815038 ) ) ( not ( = ?auto_815037 ?auto_815038 ) ) ( ON ?auto_815036 ?auto_815037 ) ( ON ?auto_815035 ?auto_815036 ) ( ON ?auto_815034 ?auto_815035 ) ( ON ?auto_815033 ?auto_815034 ) ( ON ?auto_815032 ?auto_815033 ) ( ON ?auto_815031 ?auto_815032 ) ( ON ?auto_815030 ?auto_815031 ) ( ON ?auto_815029 ?auto_815030 ) ( ON ?auto_815028 ?auto_815029 ) ( ON ?auto_815027 ?auto_815028 ) ( CLEAR ?auto_815025 ) ( ON ?auto_815026 ?auto_815027 ) ( CLEAR ?auto_815026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_815023 ?auto_815024 ?auto_815025 ?auto_815026 )
      ( MAKE-15PILE ?auto_815023 ?auto_815024 ?auto_815025 ?auto_815026 ?auto_815027 ?auto_815028 ?auto_815029 ?auto_815030 ?auto_815031 ?auto_815032 ?auto_815033 ?auto_815034 ?auto_815035 ?auto_815036 ?auto_815037 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_815085 - BLOCK
      ?auto_815086 - BLOCK
      ?auto_815087 - BLOCK
      ?auto_815088 - BLOCK
      ?auto_815089 - BLOCK
      ?auto_815090 - BLOCK
      ?auto_815091 - BLOCK
      ?auto_815092 - BLOCK
      ?auto_815093 - BLOCK
      ?auto_815094 - BLOCK
      ?auto_815095 - BLOCK
      ?auto_815096 - BLOCK
      ?auto_815097 - BLOCK
      ?auto_815098 - BLOCK
      ?auto_815099 - BLOCK
    )
    :vars
    (
      ?auto_815100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815099 ?auto_815100 ) ( ON-TABLE ?auto_815085 ) ( ON ?auto_815086 ?auto_815085 ) ( not ( = ?auto_815085 ?auto_815086 ) ) ( not ( = ?auto_815085 ?auto_815087 ) ) ( not ( = ?auto_815085 ?auto_815088 ) ) ( not ( = ?auto_815085 ?auto_815089 ) ) ( not ( = ?auto_815085 ?auto_815090 ) ) ( not ( = ?auto_815085 ?auto_815091 ) ) ( not ( = ?auto_815085 ?auto_815092 ) ) ( not ( = ?auto_815085 ?auto_815093 ) ) ( not ( = ?auto_815085 ?auto_815094 ) ) ( not ( = ?auto_815085 ?auto_815095 ) ) ( not ( = ?auto_815085 ?auto_815096 ) ) ( not ( = ?auto_815085 ?auto_815097 ) ) ( not ( = ?auto_815085 ?auto_815098 ) ) ( not ( = ?auto_815085 ?auto_815099 ) ) ( not ( = ?auto_815085 ?auto_815100 ) ) ( not ( = ?auto_815086 ?auto_815087 ) ) ( not ( = ?auto_815086 ?auto_815088 ) ) ( not ( = ?auto_815086 ?auto_815089 ) ) ( not ( = ?auto_815086 ?auto_815090 ) ) ( not ( = ?auto_815086 ?auto_815091 ) ) ( not ( = ?auto_815086 ?auto_815092 ) ) ( not ( = ?auto_815086 ?auto_815093 ) ) ( not ( = ?auto_815086 ?auto_815094 ) ) ( not ( = ?auto_815086 ?auto_815095 ) ) ( not ( = ?auto_815086 ?auto_815096 ) ) ( not ( = ?auto_815086 ?auto_815097 ) ) ( not ( = ?auto_815086 ?auto_815098 ) ) ( not ( = ?auto_815086 ?auto_815099 ) ) ( not ( = ?auto_815086 ?auto_815100 ) ) ( not ( = ?auto_815087 ?auto_815088 ) ) ( not ( = ?auto_815087 ?auto_815089 ) ) ( not ( = ?auto_815087 ?auto_815090 ) ) ( not ( = ?auto_815087 ?auto_815091 ) ) ( not ( = ?auto_815087 ?auto_815092 ) ) ( not ( = ?auto_815087 ?auto_815093 ) ) ( not ( = ?auto_815087 ?auto_815094 ) ) ( not ( = ?auto_815087 ?auto_815095 ) ) ( not ( = ?auto_815087 ?auto_815096 ) ) ( not ( = ?auto_815087 ?auto_815097 ) ) ( not ( = ?auto_815087 ?auto_815098 ) ) ( not ( = ?auto_815087 ?auto_815099 ) ) ( not ( = ?auto_815087 ?auto_815100 ) ) ( not ( = ?auto_815088 ?auto_815089 ) ) ( not ( = ?auto_815088 ?auto_815090 ) ) ( not ( = ?auto_815088 ?auto_815091 ) ) ( not ( = ?auto_815088 ?auto_815092 ) ) ( not ( = ?auto_815088 ?auto_815093 ) ) ( not ( = ?auto_815088 ?auto_815094 ) ) ( not ( = ?auto_815088 ?auto_815095 ) ) ( not ( = ?auto_815088 ?auto_815096 ) ) ( not ( = ?auto_815088 ?auto_815097 ) ) ( not ( = ?auto_815088 ?auto_815098 ) ) ( not ( = ?auto_815088 ?auto_815099 ) ) ( not ( = ?auto_815088 ?auto_815100 ) ) ( not ( = ?auto_815089 ?auto_815090 ) ) ( not ( = ?auto_815089 ?auto_815091 ) ) ( not ( = ?auto_815089 ?auto_815092 ) ) ( not ( = ?auto_815089 ?auto_815093 ) ) ( not ( = ?auto_815089 ?auto_815094 ) ) ( not ( = ?auto_815089 ?auto_815095 ) ) ( not ( = ?auto_815089 ?auto_815096 ) ) ( not ( = ?auto_815089 ?auto_815097 ) ) ( not ( = ?auto_815089 ?auto_815098 ) ) ( not ( = ?auto_815089 ?auto_815099 ) ) ( not ( = ?auto_815089 ?auto_815100 ) ) ( not ( = ?auto_815090 ?auto_815091 ) ) ( not ( = ?auto_815090 ?auto_815092 ) ) ( not ( = ?auto_815090 ?auto_815093 ) ) ( not ( = ?auto_815090 ?auto_815094 ) ) ( not ( = ?auto_815090 ?auto_815095 ) ) ( not ( = ?auto_815090 ?auto_815096 ) ) ( not ( = ?auto_815090 ?auto_815097 ) ) ( not ( = ?auto_815090 ?auto_815098 ) ) ( not ( = ?auto_815090 ?auto_815099 ) ) ( not ( = ?auto_815090 ?auto_815100 ) ) ( not ( = ?auto_815091 ?auto_815092 ) ) ( not ( = ?auto_815091 ?auto_815093 ) ) ( not ( = ?auto_815091 ?auto_815094 ) ) ( not ( = ?auto_815091 ?auto_815095 ) ) ( not ( = ?auto_815091 ?auto_815096 ) ) ( not ( = ?auto_815091 ?auto_815097 ) ) ( not ( = ?auto_815091 ?auto_815098 ) ) ( not ( = ?auto_815091 ?auto_815099 ) ) ( not ( = ?auto_815091 ?auto_815100 ) ) ( not ( = ?auto_815092 ?auto_815093 ) ) ( not ( = ?auto_815092 ?auto_815094 ) ) ( not ( = ?auto_815092 ?auto_815095 ) ) ( not ( = ?auto_815092 ?auto_815096 ) ) ( not ( = ?auto_815092 ?auto_815097 ) ) ( not ( = ?auto_815092 ?auto_815098 ) ) ( not ( = ?auto_815092 ?auto_815099 ) ) ( not ( = ?auto_815092 ?auto_815100 ) ) ( not ( = ?auto_815093 ?auto_815094 ) ) ( not ( = ?auto_815093 ?auto_815095 ) ) ( not ( = ?auto_815093 ?auto_815096 ) ) ( not ( = ?auto_815093 ?auto_815097 ) ) ( not ( = ?auto_815093 ?auto_815098 ) ) ( not ( = ?auto_815093 ?auto_815099 ) ) ( not ( = ?auto_815093 ?auto_815100 ) ) ( not ( = ?auto_815094 ?auto_815095 ) ) ( not ( = ?auto_815094 ?auto_815096 ) ) ( not ( = ?auto_815094 ?auto_815097 ) ) ( not ( = ?auto_815094 ?auto_815098 ) ) ( not ( = ?auto_815094 ?auto_815099 ) ) ( not ( = ?auto_815094 ?auto_815100 ) ) ( not ( = ?auto_815095 ?auto_815096 ) ) ( not ( = ?auto_815095 ?auto_815097 ) ) ( not ( = ?auto_815095 ?auto_815098 ) ) ( not ( = ?auto_815095 ?auto_815099 ) ) ( not ( = ?auto_815095 ?auto_815100 ) ) ( not ( = ?auto_815096 ?auto_815097 ) ) ( not ( = ?auto_815096 ?auto_815098 ) ) ( not ( = ?auto_815096 ?auto_815099 ) ) ( not ( = ?auto_815096 ?auto_815100 ) ) ( not ( = ?auto_815097 ?auto_815098 ) ) ( not ( = ?auto_815097 ?auto_815099 ) ) ( not ( = ?auto_815097 ?auto_815100 ) ) ( not ( = ?auto_815098 ?auto_815099 ) ) ( not ( = ?auto_815098 ?auto_815100 ) ) ( not ( = ?auto_815099 ?auto_815100 ) ) ( ON ?auto_815098 ?auto_815099 ) ( ON ?auto_815097 ?auto_815098 ) ( ON ?auto_815096 ?auto_815097 ) ( ON ?auto_815095 ?auto_815096 ) ( ON ?auto_815094 ?auto_815095 ) ( ON ?auto_815093 ?auto_815094 ) ( ON ?auto_815092 ?auto_815093 ) ( ON ?auto_815091 ?auto_815092 ) ( ON ?auto_815090 ?auto_815091 ) ( ON ?auto_815089 ?auto_815090 ) ( ON ?auto_815088 ?auto_815089 ) ( CLEAR ?auto_815086 ) ( ON ?auto_815087 ?auto_815088 ) ( CLEAR ?auto_815087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_815085 ?auto_815086 ?auto_815087 )
      ( MAKE-15PILE ?auto_815085 ?auto_815086 ?auto_815087 ?auto_815088 ?auto_815089 ?auto_815090 ?auto_815091 ?auto_815092 ?auto_815093 ?auto_815094 ?auto_815095 ?auto_815096 ?auto_815097 ?auto_815098 ?auto_815099 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_815147 - BLOCK
      ?auto_815148 - BLOCK
      ?auto_815149 - BLOCK
      ?auto_815150 - BLOCK
      ?auto_815151 - BLOCK
      ?auto_815152 - BLOCK
      ?auto_815153 - BLOCK
      ?auto_815154 - BLOCK
      ?auto_815155 - BLOCK
      ?auto_815156 - BLOCK
      ?auto_815157 - BLOCK
      ?auto_815158 - BLOCK
      ?auto_815159 - BLOCK
      ?auto_815160 - BLOCK
      ?auto_815161 - BLOCK
    )
    :vars
    (
      ?auto_815162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815161 ?auto_815162 ) ( ON-TABLE ?auto_815147 ) ( not ( = ?auto_815147 ?auto_815148 ) ) ( not ( = ?auto_815147 ?auto_815149 ) ) ( not ( = ?auto_815147 ?auto_815150 ) ) ( not ( = ?auto_815147 ?auto_815151 ) ) ( not ( = ?auto_815147 ?auto_815152 ) ) ( not ( = ?auto_815147 ?auto_815153 ) ) ( not ( = ?auto_815147 ?auto_815154 ) ) ( not ( = ?auto_815147 ?auto_815155 ) ) ( not ( = ?auto_815147 ?auto_815156 ) ) ( not ( = ?auto_815147 ?auto_815157 ) ) ( not ( = ?auto_815147 ?auto_815158 ) ) ( not ( = ?auto_815147 ?auto_815159 ) ) ( not ( = ?auto_815147 ?auto_815160 ) ) ( not ( = ?auto_815147 ?auto_815161 ) ) ( not ( = ?auto_815147 ?auto_815162 ) ) ( not ( = ?auto_815148 ?auto_815149 ) ) ( not ( = ?auto_815148 ?auto_815150 ) ) ( not ( = ?auto_815148 ?auto_815151 ) ) ( not ( = ?auto_815148 ?auto_815152 ) ) ( not ( = ?auto_815148 ?auto_815153 ) ) ( not ( = ?auto_815148 ?auto_815154 ) ) ( not ( = ?auto_815148 ?auto_815155 ) ) ( not ( = ?auto_815148 ?auto_815156 ) ) ( not ( = ?auto_815148 ?auto_815157 ) ) ( not ( = ?auto_815148 ?auto_815158 ) ) ( not ( = ?auto_815148 ?auto_815159 ) ) ( not ( = ?auto_815148 ?auto_815160 ) ) ( not ( = ?auto_815148 ?auto_815161 ) ) ( not ( = ?auto_815148 ?auto_815162 ) ) ( not ( = ?auto_815149 ?auto_815150 ) ) ( not ( = ?auto_815149 ?auto_815151 ) ) ( not ( = ?auto_815149 ?auto_815152 ) ) ( not ( = ?auto_815149 ?auto_815153 ) ) ( not ( = ?auto_815149 ?auto_815154 ) ) ( not ( = ?auto_815149 ?auto_815155 ) ) ( not ( = ?auto_815149 ?auto_815156 ) ) ( not ( = ?auto_815149 ?auto_815157 ) ) ( not ( = ?auto_815149 ?auto_815158 ) ) ( not ( = ?auto_815149 ?auto_815159 ) ) ( not ( = ?auto_815149 ?auto_815160 ) ) ( not ( = ?auto_815149 ?auto_815161 ) ) ( not ( = ?auto_815149 ?auto_815162 ) ) ( not ( = ?auto_815150 ?auto_815151 ) ) ( not ( = ?auto_815150 ?auto_815152 ) ) ( not ( = ?auto_815150 ?auto_815153 ) ) ( not ( = ?auto_815150 ?auto_815154 ) ) ( not ( = ?auto_815150 ?auto_815155 ) ) ( not ( = ?auto_815150 ?auto_815156 ) ) ( not ( = ?auto_815150 ?auto_815157 ) ) ( not ( = ?auto_815150 ?auto_815158 ) ) ( not ( = ?auto_815150 ?auto_815159 ) ) ( not ( = ?auto_815150 ?auto_815160 ) ) ( not ( = ?auto_815150 ?auto_815161 ) ) ( not ( = ?auto_815150 ?auto_815162 ) ) ( not ( = ?auto_815151 ?auto_815152 ) ) ( not ( = ?auto_815151 ?auto_815153 ) ) ( not ( = ?auto_815151 ?auto_815154 ) ) ( not ( = ?auto_815151 ?auto_815155 ) ) ( not ( = ?auto_815151 ?auto_815156 ) ) ( not ( = ?auto_815151 ?auto_815157 ) ) ( not ( = ?auto_815151 ?auto_815158 ) ) ( not ( = ?auto_815151 ?auto_815159 ) ) ( not ( = ?auto_815151 ?auto_815160 ) ) ( not ( = ?auto_815151 ?auto_815161 ) ) ( not ( = ?auto_815151 ?auto_815162 ) ) ( not ( = ?auto_815152 ?auto_815153 ) ) ( not ( = ?auto_815152 ?auto_815154 ) ) ( not ( = ?auto_815152 ?auto_815155 ) ) ( not ( = ?auto_815152 ?auto_815156 ) ) ( not ( = ?auto_815152 ?auto_815157 ) ) ( not ( = ?auto_815152 ?auto_815158 ) ) ( not ( = ?auto_815152 ?auto_815159 ) ) ( not ( = ?auto_815152 ?auto_815160 ) ) ( not ( = ?auto_815152 ?auto_815161 ) ) ( not ( = ?auto_815152 ?auto_815162 ) ) ( not ( = ?auto_815153 ?auto_815154 ) ) ( not ( = ?auto_815153 ?auto_815155 ) ) ( not ( = ?auto_815153 ?auto_815156 ) ) ( not ( = ?auto_815153 ?auto_815157 ) ) ( not ( = ?auto_815153 ?auto_815158 ) ) ( not ( = ?auto_815153 ?auto_815159 ) ) ( not ( = ?auto_815153 ?auto_815160 ) ) ( not ( = ?auto_815153 ?auto_815161 ) ) ( not ( = ?auto_815153 ?auto_815162 ) ) ( not ( = ?auto_815154 ?auto_815155 ) ) ( not ( = ?auto_815154 ?auto_815156 ) ) ( not ( = ?auto_815154 ?auto_815157 ) ) ( not ( = ?auto_815154 ?auto_815158 ) ) ( not ( = ?auto_815154 ?auto_815159 ) ) ( not ( = ?auto_815154 ?auto_815160 ) ) ( not ( = ?auto_815154 ?auto_815161 ) ) ( not ( = ?auto_815154 ?auto_815162 ) ) ( not ( = ?auto_815155 ?auto_815156 ) ) ( not ( = ?auto_815155 ?auto_815157 ) ) ( not ( = ?auto_815155 ?auto_815158 ) ) ( not ( = ?auto_815155 ?auto_815159 ) ) ( not ( = ?auto_815155 ?auto_815160 ) ) ( not ( = ?auto_815155 ?auto_815161 ) ) ( not ( = ?auto_815155 ?auto_815162 ) ) ( not ( = ?auto_815156 ?auto_815157 ) ) ( not ( = ?auto_815156 ?auto_815158 ) ) ( not ( = ?auto_815156 ?auto_815159 ) ) ( not ( = ?auto_815156 ?auto_815160 ) ) ( not ( = ?auto_815156 ?auto_815161 ) ) ( not ( = ?auto_815156 ?auto_815162 ) ) ( not ( = ?auto_815157 ?auto_815158 ) ) ( not ( = ?auto_815157 ?auto_815159 ) ) ( not ( = ?auto_815157 ?auto_815160 ) ) ( not ( = ?auto_815157 ?auto_815161 ) ) ( not ( = ?auto_815157 ?auto_815162 ) ) ( not ( = ?auto_815158 ?auto_815159 ) ) ( not ( = ?auto_815158 ?auto_815160 ) ) ( not ( = ?auto_815158 ?auto_815161 ) ) ( not ( = ?auto_815158 ?auto_815162 ) ) ( not ( = ?auto_815159 ?auto_815160 ) ) ( not ( = ?auto_815159 ?auto_815161 ) ) ( not ( = ?auto_815159 ?auto_815162 ) ) ( not ( = ?auto_815160 ?auto_815161 ) ) ( not ( = ?auto_815160 ?auto_815162 ) ) ( not ( = ?auto_815161 ?auto_815162 ) ) ( ON ?auto_815160 ?auto_815161 ) ( ON ?auto_815159 ?auto_815160 ) ( ON ?auto_815158 ?auto_815159 ) ( ON ?auto_815157 ?auto_815158 ) ( ON ?auto_815156 ?auto_815157 ) ( ON ?auto_815155 ?auto_815156 ) ( ON ?auto_815154 ?auto_815155 ) ( ON ?auto_815153 ?auto_815154 ) ( ON ?auto_815152 ?auto_815153 ) ( ON ?auto_815151 ?auto_815152 ) ( ON ?auto_815150 ?auto_815151 ) ( ON ?auto_815149 ?auto_815150 ) ( CLEAR ?auto_815147 ) ( ON ?auto_815148 ?auto_815149 ) ( CLEAR ?auto_815148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_815147 ?auto_815148 )
      ( MAKE-15PILE ?auto_815147 ?auto_815148 ?auto_815149 ?auto_815150 ?auto_815151 ?auto_815152 ?auto_815153 ?auto_815154 ?auto_815155 ?auto_815156 ?auto_815157 ?auto_815158 ?auto_815159 ?auto_815160 ?auto_815161 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_815209 - BLOCK
      ?auto_815210 - BLOCK
      ?auto_815211 - BLOCK
      ?auto_815212 - BLOCK
      ?auto_815213 - BLOCK
      ?auto_815214 - BLOCK
      ?auto_815215 - BLOCK
      ?auto_815216 - BLOCK
      ?auto_815217 - BLOCK
      ?auto_815218 - BLOCK
      ?auto_815219 - BLOCK
      ?auto_815220 - BLOCK
      ?auto_815221 - BLOCK
      ?auto_815222 - BLOCK
      ?auto_815223 - BLOCK
    )
    :vars
    (
      ?auto_815224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815223 ?auto_815224 ) ( not ( = ?auto_815209 ?auto_815210 ) ) ( not ( = ?auto_815209 ?auto_815211 ) ) ( not ( = ?auto_815209 ?auto_815212 ) ) ( not ( = ?auto_815209 ?auto_815213 ) ) ( not ( = ?auto_815209 ?auto_815214 ) ) ( not ( = ?auto_815209 ?auto_815215 ) ) ( not ( = ?auto_815209 ?auto_815216 ) ) ( not ( = ?auto_815209 ?auto_815217 ) ) ( not ( = ?auto_815209 ?auto_815218 ) ) ( not ( = ?auto_815209 ?auto_815219 ) ) ( not ( = ?auto_815209 ?auto_815220 ) ) ( not ( = ?auto_815209 ?auto_815221 ) ) ( not ( = ?auto_815209 ?auto_815222 ) ) ( not ( = ?auto_815209 ?auto_815223 ) ) ( not ( = ?auto_815209 ?auto_815224 ) ) ( not ( = ?auto_815210 ?auto_815211 ) ) ( not ( = ?auto_815210 ?auto_815212 ) ) ( not ( = ?auto_815210 ?auto_815213 ) ) ( not ( = ?auto_815210 ?auto_815214 ) ) ( not ( = ?auto_815210 ?auto_815215 ) ) ( not ( = ?auto_815210 ?auto_815216 ) ) ( not ( = ?auto_815210 ?auto_815217 ) ) ( not ( = ?auto_815210 ?auto_815218 ) ) ( not ( = ?auto_815210 ?auto_815219 ) ) ( not ( = ?auto_815210 ?auto_815220 ) ) ( not ( = ?auto_815210 ?auto_815221 ) ) ( not ( = ?auto_815210 ?auto_815222 ) ) ( not ( = ?auto_815210 ?auto_815223 ) ) ( not ( = ?auto_815210 ?auto_815224 ) ) ( not ( = ?auto_815211 ?auto_815212 ) ) ( not ( = ?auto_815211 ?auto_815213 ) ) ( not ( = ?auto_815211 ?auto_815214 ) ) ( not ( = ?auto_815211 ?auto_815215 ) ) ( not ( = ?auto_815211 ?auto_815216 ) ) ( not ( = ?auto_815211 ?auto_815217 ) ) ( not ( = ?auto_815211 ?auto_815218 ) ) ( not ( = ?auto_815211 ?auto_815219 ) ) ( not ( = ?auto_815211 ?auto_815220 ) ) ( not ( = ?auto_815211 ?auto_815221 ) ) ( not ( = ?auto_815211 ?auto_815222 ) ) ( not ( = ?auto_815211 ?auto_815223 ) ) ( not ( = ?auto_815211 ?auto_815224 ) ) ( not ( = ?auto_815212 ?auto_815213 ) ) ( not ( = ?auto_815212 ?auto_815214 ) ) ( not ( = ?auto_815212 ?auto_815215 ) ) ( not ( = ?auto_815212 ?auto_815216 ) ) ( not ( = ?auto_815212 ?auto_815217 ) ) ( not ( = ?auto_815212 ?auto_815218 ) ) ( not ( = ?auto_815212 ?auto_815219 ) ) ( not ( = ?auto_815212 ?auto_815220 ) ) ( not ( = ?auto_815212 ?auto_815221 ) ) ( not ( = ?auto_815212 ?auto_815222 ) ) ( not ( = ?auto_815212 ?auto_815223 ) ) ( not ( = ?auto_815212 ?auto_815224 ) ) ( not ( = ?auto_815213 ?auto_815214 ) ) ( not ( = ?auto_815213 ?auto_815215 ) ) ( not ( = ?auto_815213 ?auto_815216 ) ) ( not ( = ?auto_815213 ?auto_815217 ) ) ( not ( = ?auto_815213 ?auto_815218 ) ) ( not ( = ?auto_815213 ?auto_815219 ) ) ( not ( = ?auto_815213 ?auto_815220 ) ) ( not ( = ?auto_815213 ?auto_815221 ) ) ( not ( = ?auto_815213 ?auto_815222 ) ) ( not ( = ?auto_815213 ?auto_815223 ) ) ( not ( = ?auto_815213 ?auto_815224 ) ) ( not ( = ?auto_815214 ?auto_815215 ) ) ( not ( = ?auto_815214 ?auto_815216 ) ) ( not ( = ?auto_815214 ?auto_815217 ) ) ( not ( = ?auto_815214 ?auto_815218 ) ) ( not ( = ?auto_815214 ?auto_815219 ) ) ( not ( = ?auto_815214 ?auto_815220 ) ) ( not ( = ?auto_815214 ?auto_815221 ) ) ( not ( = ?auto_815214 ?auto_815222 ) ) ( not ( = ?auto_815214 ?auto_815223 ) ) ( not ( = ?auto_815214 ?auto_815224 ) ) ( not ( = ?auto_815215 ?auto_815216 ) ) ( not ( = ?auto_815215 ?auto_815217 ) ) ( not ( = ?auto_815215 ?auto_815218 ) ) ( not ( = ?auto_815215 ?auto_815219 ) ) ( not ( = ?auto_815215 ?auto_815220 ) ) ( not ( = ?auto_815215 ?auto_815221 ) ) ( not ( = ?auto_815215 ?auto_815222 ) ) ( not ( = ?auto_815215 ?auto_815223 ) ) ( not ( = ?auto_815215 ?auto_815224 ) ) ( not ( = ?auto_815216 ?auto_815217 ) ) ( not ( = ?auto_815216 ?auto_815218 ) ) ( not ( = ?auto_815216 ?auto_815219 ) ) ( not ( = ?auto_815216 ?auto_815220 ) ) ( not ( = ?auto_815216 ?auto_815221 ) ) ( not ( = ?auto_815216 ?auto_815222 ) ) ( not ( = ?auto_815216 ?auto_815223 ) ) ( not ( = ?auto_815216 ?auto_815224 ) ) ( not ( = ?auto_815217 ?auto_815218 ) ) ( not ( = ?auto_815217 ?auto_815219 ) ) ( not ( = ?auto_815217 ?auto_815220 ) ) ( not ( = ?auto_815217 ?auto_815221 ) ) ( not ( = ?auto_815217 ?auto_815222 ) ) ( not ( = ?auto_815217 ?auto_815223 ) ) ( not ( = ?auto_815217 ?auto_815224 ) ) ( not ( = ?auto_815218 ?auto_815219 ) ) ( not ( = ?auto_815218 ?auto_815220 ) ) ( not ( = ?auto_815218 ?auto_815221 ) ) ( not ( = ?auto_815218 ?auto_815222 ) ) ( not ( = ?auto_815218 ?auto_815223 ) ) ( not ( = ?auto_815218 ?auto_815224 ) ) ( not ( = ?auto_815219 ?auto_815220 ) ) ( not ( = ?auto_815219 ?auto_815221 ) ) ( not ( = ?auto_815219 ?auto_815222 ) ) ( not ( = ?auto_815219 ?auto_815223 ) ) ( not ( = ?auto_815219 ?auto_815224 ) ) ( not ( = ?auto_815220 ?auto_815221 ) ) ( not ( = ?auto_815220 ?auto_815222 ) ) ( not ( = ?auto_815220 ?auto_815223 ) ) ( not ( = ?auto_815220 ?auto_815224 ) ) ( not ( = ?auto_815221 ?auto_815222 ) ) ( not ( = ?auto_815221 ?auto_815223 ) ) ( not ( = ?auto_815221 ?auto_815224 ) ) ( not ( = ?auto_815222 ?auto_815223 ) ) ( not ( = ?auto_815222 ?auto_815224 ) ) ( not ( = ?auto_815223 ?auto_815224 ) ) ( ON ?auto_815222 ?auto_815223 ) ( ON ?auto_815221 ?auto_815222 ) ( ON ?auto_815220 ?auto_815221 ) ( ON ?auto_815219 ?auto_815220 ) ( ON ?auto_815218 ?auto_815219 ) ( ON ?auto_815217 ?auto_815218 ) ( ON ?auto_815216 ?auto_815217 ) ( ON ?auto_815215 ?auto_815216 ) ( ON ?auto_815214 ?auto_815215 ) ( ON ?auto_815213 ?auto_815214 ) ( ON ?auto_815212 ?auto_815213 ) ( ON ?auto_815211 ?auto_815212 ) ( ON ?auto_815210 ?auto_815211 ) ( ON ?auto_815209 ?auto_815210 ) ( CLEAR ?auto_815209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_815209 )
      ( MAKE-15PILE ?auto_815209 ?auto_815210 ?auto_815211 ?auto_815212 ?auto_815213 ?auto_815214 ?auto_815215 ?auto_815216 ?auto_815217 ?auto_815218 ?auto_815219 ?auto_815220 ?auto_815221 ?auto_815222 ?auto_815223 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815272 - BLOCK
      ?auto_815273 - BLOCK
      ?auto_815274 - BLOCK
      ?auto_815275 - BLOCK
      ?auto_815276 - BLOCK
      ?auto_815277 - BLOCK
      ?auto_815278 - BLOCK
      ?auto_815279 - BLOCK
      ?auto_815280 - BLOCK
      ?auto_815281 - BLOCK
      ?auto_815282 - BLOCK
      ?auto_815283 - BLOCK
      ?auto_815284 - BLOCK
      ?auto_815285 - BLOCK
      ?auto_815286 - BLOCK
      ?auto_815287 - BLOCK
    )
    :vars
    (
      ?auto_815288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_815286 ) ( ON ?auto_815287 ?auto_815288 ) ( CLEAR ?auto_815287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_815272 ) ( ON ?auto_815273 ?auto_815272 ) ( ON ?auto_815274 ?auto_815273 ) ( ON ?auto_815275 ?auto_815274 ) ( ON ?auto_815276 ?auto_815275 ) ( ON ?auto_815277 ?auto_815276 ) ( ON ?auto_815278 ?auto_815277 ) ( ON ?auto_815279 ?auto_815278 ) ( ON ?auto_815280 ?auto_815279 ) ( ON ?auto_815281 ?auto_815280 ) ( ON ?auto_815282 ?auto_815281 ) ( ON ?auto_815283 ?auto_815282 ) ( ON ?auto_815284 ?auto_815283 ) ( ON ?auto_815285 ?auto_815284 ) ( ON ?auto_815286 ?auto_815285 ) ( not ( = ?auto_815272 ?auto_815273 ) ) ( not ( = ?auto_815272 ?auto_815274 ) ) ( not ( = ?auto_815272 ?auto_815275 ) ) ( not ( = ?auto_815272 ?auto_815276 ) ) ( not ( = ?auto_815272 ?auto_815277 ) ) ( not ( = ?auto_815272 ?auto_815278 ) ) ( not ( = ?auto_815272 ?auto_815279 ) ) ( not ( = ?auto_815272 ?auto_815280 ) ) ( not ( = ?auto_815272 ?auto_815281 ) ) ( not ( = ?auto_815272 ?auto_815282 ) ) ( not ( = ?auto_815272 ?auto_815283 ) ) ( not ( = ?auto_815272 ?auto_815284 ) ) ( not ( = ?auto_815272 ?auto_815285 ) ) ( not ( = ?auto_815272 ?auto_815286 ) ) ( not ( = ?auto_815272 ?auto_815287 ) ) ( not ( = ?auto_815272 ?auto_815288 ) ) ( not ( = ?auto_815273 ?auto_815274 ) ) ( not ( = ?auto_815273 ?auto_815275 ) ) ( not ( = ?auto_815273 ?auto_815276 ) ) ( not ( = ?auto_815273 ?auto_815277 ) ) ( not ( = ?auto_815273 ?auto_815278 ) ) ( not ( = ?auto_815273 ?auto_815279 ) ) ( not ( = ?auto_815273 ?auto_815280 ) ) ( not ( = ?auto_815273 ?auto_815281 ) ) ( not ( = ?auto_815273 ?auto_815282 ) ) ( not ( = ?auto_815273 ?auto_815283 ) ) ( not ( = ?auto_815273 ?auto_815284 ) ) ( not ( = ?auto_815273 ?auto_815285 ) ) ( not ( = ?auto_815273 ?auto_815286 ) ) ( not ( = ?auto_815273 ?auto_815287 ) ) ( not ( = ?auto_815273 ?auto_815288 ) ) ( not ( = ?auto_815274 ?auto_815275 ) ) ( not ( = ?auto_815274 ?auto_815276 ) ) ( not ( = ?auto_815274 ?auto_815277 ) ) ( not ( = ?auto_815274 ?auto_815278 ) ) ( not ( = ?auto_815274 ?auto_815279 ) ) ( not ( = ?auto_815274 ?auto_815280 ) ) ( not ( = ?auto_815274 ?auto_815281 ) ) ( not ( = ?auto_815274 ?auto_815282 ) ) ( not ( = ?auto_815274 ?auto_815283 ) ) ( not ( = ?auto_815274 ?auto_815284 ) ) ( not ( = ?auto_815274 ?auto_815285 ) ) ( not ( = ?auto_815274 ?auto_815286 ) ) ( not ( = ?auto_815274 ?auto_815287 ) ) ( not ( = ?auto_815274 ?auto_815288 ) ) ( not ( = ?auto_815275 ?auto_815276 ) ) ( not ( = ?auto_815275 ?auto_815277 ) ) ( not ( = ?auto_815275 ?auto_815278 ) ) ( not ( = ?auto_815275 ?auto_815279 ) ) ( not ( = ?auto_815275 ?auto_815280 ) ) ( not ( = ?auto_815275 ?auto_815281 ) ) ( not ( = ?auto_815275 ?auto_815282 ) ) ( not ( = ?auto_815275 ?auto_815283 ) ) ( not ( = ?auto_815275 ?auto_815284 ) ) ( not ( = ?auto_815275 ?auto_815285 ) ) ( not ( = ?auto_815275 ?auto_815286 ) ) ( not ( = ?auto_815275 ?auto_815287 ) ) ( not ( = ?auto_815275 ?auto_815288 ) ) ( not ( = ?auto_815276 ?auto_815277 ) ) ( not ( = ?auto_815276 ?auto_815278 ) ) ( not ( = ?auto_815276 ?auto_815279 ) ) ( not ( = ?auto_815276 ?auto_815280 ) ) ( not ( = ?auto_815276 ?auto_815281 ) ) ( not ( = ?auto_815276 ?auto_815282 ) ) ( not ( = ?auto_815276 ?auto_815283 ) ) ( not ( = ?auto_815276 ?auto_815284 ) ) ( not ( = ?auto_815276 ?auto_815285 ) ) ( not ( = ?auto_815276 ?auto_815286 ) ) ( not ( = ?auto_815276 ?auto_815287 ) ) ( not ( = ?auto_815276 ?auto_815288 ) ) ( not ( = ?auto_815277 ?auto_815278 ) ) ( not ( = ?auto_815277 ?auto_815279 ) ) ( not ( = ?auto_815277 ?auto_815280 ) ) ( not ( = ?auto_815277 ?auto_815281 ) ) ( not ( = ?auto_815277 ?auto_815282 ) ) ( not ( = ?auto_815277 ?auto_815283 ) ) ( not ( = ?auto_815277 ?auto_815284 ) ) ( not ( = ?auto_815277 ?auto_815285 ) ) ( not ( = ?auto_815277 ?auto_815286 ) ) ( not ( = ?auto_815277 ?auto_815287 ) ) ( not ( = ?auto_815277 ?auto_815288 ) ) ( not ( = ?auto_815278 ?auto_815279 ) ) ( not ( = ?auto_815278 ?auto_815280 ) ) ( not ( = ?auto_815278 ?auto_815281 ) ) ( not ( = ?auto_815278 ?auto_815282 ) ) ( not ( = ?auto_815278 ?auto_815283 ) ) ( not ( = ?auto_815278 ?auto_815284 ) ) ( not ( = ?auto_815278 ?auto_815285 ) ) ( not ( = ?auto_815278 ?auto_815286 ) ) ( not ( = ?auto_815278 ?auto_815287 ) ) ( not ( = ?auto_815278 ?auto_815288 ) ) ( not ( = ?auto_815279 ?auto_815280 ) ) ( not ( = ?auto_815279 ?auto_815281 ) ) ( not ( = ?auto_815279 ?auto_815282 ) ) ( not ( = ?auto_815279 ?auto_815283 ) ) ( not ( = ?auto_815279 ?auto_815284 ) ) ( not ( = ?auto_815279 ?auto_815285 ) ) ( not ( = ?auto_815279 ?auto_815286 ) ) ( not ( = ?auto_815279 ?auto_815287 ) ) ( not ( = ?auto_815279 ?auto_815288 ) ) ( not ( = ?auto_815280 ?auto_815281 ) ) ( not ( = ?auto_815280 ?auto_815282 ) ) ( not ( = ?auto_815280 ?auto_815283 ) ) ( not ( = ?auto_815280 ?auto_815284 ) ) ( not ( = ?auto_815280 ?auto_815285 ) ) ( not ( = ?auto_815280 ?auto_815286 ) ) ( not ( = ?auto_815280 ?auto_815287 ) ) ( not ( = ?auto_815280 ?auto_815288 ) ) ( not ( = ?auto_815281 ?auto_815282 ) ) ( not ( = ?auto_815281 ?auto_815283 ) ) ( not ( = ?auto_815281 ?auto_815284 ) ) ( not ( = ?auto_815281 ?auto_815285 ) ) ( not ( = ?auto_815281 ?auto_815286 ) ) ( not ( = ?auto_815281 ?auto_815287 ) ) ( not ( = ?auto_815281 ?auto_815288 ) ) ( not ( = ?auto_815282 ?auto_815283 ) ) ( not ( = ?auto_815282 ?auto_815284 ) ) ( not ( = ?auto_815282 ?auto_815285 ) ) ( not ( = ?auto_815282 ?auto_815286 ) ) ( not ( = ?auto_815282 ?auto_815287 ) ) ( not ( = ?auto_815282 ?auto_815288 ) ) ( not ( = ?auto_815283 ?auto_815284 ) ) ( not ( = ?auto_815283 ?auto_815285 ) ) ( not ( = ?auto_815283 ?auto_815286 ) ) ( not ( = ?auto_815283 ?auto_815287 ) ) ( not ( = ?auto_815283 ?auto_815288 ) ) ( not ( = ?auto_815284 ?auto_815285 ) ) ( not ( = ?auto_815284 ?auto_815286 ) ) ( not ( = ?auto_815284 ?auto_815287 ) ) ( not ( = ?auto_815284 ?auto_815288 ) ) ( not ( = ?auto_815285 ?auto_815286 ) ) ( not ( = ?auto_815285 ?auto_815287 ) ) ( not ( = ?auto_815285 ?auto_815288 ) ) ( not ( = ?auto_815286 ?auto_815287 ) ) ( not ( = ?auto_815286 ?auto_815288 ) ) ( not ( = ?auto_815287 ?auto_815288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_815287 ?auto_815288 )
      ( !STACK ?auto_815287 ?auto_815286 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815338 - BLOCK
      ?auto_815339 - BLOCK
      ?auto_815340 - BLOCK
      ?auto_815341 - BLOCK
      ?auto_815342 - BLOCK
      ?auto_815343 - BLOCK
      ?auto_815344 - BLOCK
      ?auto_815345 - BLOCK
      ?auto_815346 - BLOCK
      ?auto_815347 - BLOCK
      ?auto_815348 - BLOCK
      ?auto_815349 - BLOCK
      ?auto_815350 - BLOCK
      ?auto_815351 - BLOCK
      ?auto_815352 - BLOCK
      ?auto_815353 - BLOCK
    )
    :vars
    (
      ?auto_815354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815353 ?auto_815354 ) ( ON-TABLE ?auto_815338 ) ( ON ?auto_815339 ?auto_815338 ) ( ON ?auto_815340 ?auto_815339 ) ( ON ?auto_815341 ?auto_815340 ) ( ON ?auto_815342 ?auto_815341 ) ( ON ?auto_815343 ?auto_815342 ) ( ON ?auto_815344 ?auto_815343 ) ( ON ?auto_815345 ?auto_815344 ) ( ON ?auto_815346 ?auto_815345 ) ( ON ?auto_815347 ?auto_815346 ) ( ON ?auto_815348 ?auto_815347 ) ( ON ?auto_815349 ?auto_815348 ) ( ON ?auto_815350 ?auto_815349 ) ( ON ?auto_815351 ?auto_815350 ) ( not ( = ?auto_815338 ?auto_815339 ) ) ( not ( = ?auto_815338 ?auto_815340 ) ) ( not ( = ?auto_815338 ?auto_815341 ) ) ( not ( = ?auto_815338 ?auto_815342 ) ) ( not ( = ?auto_815338 ?auto_815343 ) ) ( not ( = ?auto_815338 ?auto_815344 ) ) ( not ( = ?auto_815338 ?auto_815345 ) ) ( not ( = ?auto_815338 ?auto_815346 ) ) ( not ( = ?auto_815338 ?auto_815347 ) ) ( not ( = ?auto_815338 ?auto_815348 ) ) ( not ( = ?auto_815338 ?auto_815349 ) ) ( not ( = ?auto_815338 ?auto_815350 ) ) ( not ( = ?auto_815338 ?auto_815351 ) ) ( not ( = ?auto_815338 ?auto_815352 ) ) ( not ( = ?auto_815338 ?auto_815353 ) ) ( not ( = ?auto_815338 ?auto_815354 ) ) ( not ( = ?auto_815339 ?auto_815340 ) ) ( not ( = ?auto_815339 ?auto_815341 ) ) ( not ( = ?auto_815339 ?auto_815342 ) ) ( not ( = ?auto_815339 ?auto_815343 ) ) ( not ( = ?auto_815339 ?auto_815344 ) ) ( not ( = ?auto_815339 ?auto_815345 ) ) ( not ( = ?auto_815339 ?auto_815346 ) ) ( not ( = ?auto_815339 ?auto_815347 ) ) ( not ( = ?auto_815339 ?auto_815348 ) ) ( not ( = ?auto_815339 ?auto_815349 ) ) ( not ( = ?auto_815339 ?auto_815350 ) ) ( not ( = ?auto_815339 ?auto_815351 ) ) ( not ( = ?auto_815339 ?auto_815352 ) ) ( not ( = ?auto_815339 ?auto_815353 ) ) ( not ( = ?auto_815339 ?auto_815354 ) ) ( not ( = ?auto_815340 ?auto_815341 ) ) ( not ( = ?auto_815340 ?auto_815342 ) ) ( not ( = ?auto_815340 ?auto_815343 ) ) ( not ( = ?auto_815340 ?auto_815344 ) ) ( not ( = ?auto_815340 ?auto_815345 ) ) ( not ( = ?auto_815340 ?auto_815346 ) ) ( not ( = ?auto_815340 ?auto_815347 ) ) ( not ( = ?auto_815340 ?auto_815348 ) ) ( not ( = ?auto_815340 ?auto_815349 ) ) ( not ( = ?auto_815340 ?auto_815350 ) ) ( not ( = ?auto_815340 ?auto_815351 ) ) ( not ( = ?auto_815340 ?auto_815352 ) ) ( not ( = ?auto_815340 ?auto_815353 ) ) ( not ( = ?auto_815340 ?auto_815354 ) ) ( not ( = ?auto_815341 ?auto_815342 ) ) ( not ( = ?auto_815341 ?auto_815343 ) ) ( not ( = ?auto_815341 ?auto_815344 ) ) ( not ( = ?auto_815341 ?auto_815345 ) ) ( not ( = ?auto_815341 ?auto_815346 ) ) ( not ( = ?auto_815341 ?auto_815347 ) ) ( not ( = ?auto_815341 ?auto_815348 ) ) ( not ( = ?auto_815341 ?auto_815349 ) ) ( not ( = ?auto_815341 ?auto_815350 ) ) ( not ( = ?auto_815341 ?auto_815351 ) ) ( not ( = ?auto_815341 ?auto_815352 ) ) ( not ( = ?auto_815341 ?auto_815353 ) ) ( not ( = ?auto_815341 ?auto_815354 ) ) ( not ( = ?auto_815342 ?auto_815343 ) ) ( not ( = ?auto_815342 ?auto_815344 ) ) ( not ( = ?auto_815342 ?auto_815345 ) ) ( not ( = ?auto_815342 ?auto_815346 ) ) ( not ( = ?auto_815342 ?auto_815347 ) ) ( not ( = ?auto_815342 ?auto_815348 ) ) ( not ( = ?auto_815342 ?auto_815349 ) ) ( not ( = ?auto_815342 ?auto_815350 ) ) ( not ( = ?auto_815342 ?auto_815351 ) ) ( not ( = ?auto_815342 ?auto_815352 ) ) ( not ( = ?auto_815342 ?auto_815353 ) ) ( not ( = ?auto_815342 ?auto_815354 ) ) ( not ( = ?auto_815343 ?auto_815344 ) ) ( not ( = ?auto_815343 ?auto_815345 ) ) ( not ( = ?auto_815343 ?auto_815346 ) ) ( not ( = ?auto_815343 ?auto_815347 ) ) ( not ( = ?auto_815343 ?auto_815348 ) ) ( not ( = ?auto_815343 ?auto_815349 ) ) ( not ( = ?auto_815343 ?auto_815350 ) ) ( not ( = ?auto_815343 ?auto_815351 ) ) ( not ( = ?auto_815343 ?auto_815352 ) ) ( not ( = ?auto_815343 ?auto_815353 ) ) ( not ( = ?auto_815343 ?auto_815354 ) ) ( not ( = ?auto_815344 ?auto_815345 ) ) ( not ( = ?auto_815344 ?auto_815346 ) ) ( not ( = ?auto_815344 ?auto_815347 ) ) ( not ( = ?auto_815344 ?auto_815348 ) ) ( not ( = ?auto_815344 ?auto_815349 ) ) ( not ( = ?auto_815344 ?auto_815350 ) ) ( not ( = ?auto_815344 ?auto_815351 ) ) ( not ( = ?auto_815344 ?auto_815352 ) ) ( not ( = ?auto_815344 ?auto_815353 ) ) ( not ( = ?auto_815344 ?auto_815354 ) ) ( not ( = ?auto_815345 ?auto_815346 ) ) ( not ( = ?auto_815345 ?auto_815347 ) ) ( not ( = ?auto_815345 ?auto_815348 ) ) ( not ( = ?auto_815345 ?auto_815349 ) ) ( not ( = ?auto_815345 ?auto_815350 ) ) ( not ( = ?auto_815345 ?auto_815351 ) ) ( not ( = ?auto_815345 ?auto_815352 ) ) ( not ( = ?auto_815345 ?auto_815353 ) ) ( not ( = ?auto_815345 ?auto_815354 ) ) ( not ( = ?auto_815346 ?auto_815347 ) ) ( not ( = ?auto_815346 ?auto_815348 ) ) ( not ( = ?auto_815346 ?auto_815349 ) ) ( not ( = ?auto_815346 ?auto_815350 ) ) ( not ( = ?auto_815346 ?auto_815351 ) ) ( not ( = ?auto_815346 ?auto_815352 ) ) ( not ( = ?auto_815346 ?auto_815353 ) ) ( not ( = ?auto_815346 ?auto_815354 ) ) ( not ( = ?auto_815347 ?auto_815348 ) ) ( not ( = ?auto_815347 ?auto_815349 ) ) ( not ( = ?auto_815347 ?auto_815350 ) ) ( not ( = ?auto_815347 ?auto_815351 ) ) ( not ( = ?auto_815347 ?auto_815352 ) ) ( not ( = ?auto_815347 ?auto_815353 ) ) ( not ( = ?auto_815347 ?auto_815354 ) ) ( not ( = ?auto_815348 ?auto_815349 ) ) ( not ( = ?auto_815348 ?auto_815350 ) ) ( not ( = ?auto_815348 ?auto_815351 ) ) ( not ( = ?auto_815348 ?auto_815352 ) ) ( not ( = ?auto_815348 ?auto_815353 ) ) ( not ( = ?auto_815348 ?auto_815354 ) ) ( not ( = ?auto_815349 ?auto_815350 ) ) ( not ( = ?auto_815349 ?auto_815351 ) ) ( not ( = ?auto_815349 ?auto_815352 ) ) ( not ( = ?auto_815349 ?auto_815353 ) ) ( not ( = ?auto_815349 ?auto_815354 ) ) ( not ( = ?auto_815350 ?auto_815351 ) ) ( not ( = ?auto_815350 ?auto_815352 ) ) ( not ( = ?auto_815350 ?auto_815353 ) ) ( not ( = ?auto_815350 ?auto_815354 ) ) ( not ( = ?auto_815351 ?auto_815352 ) ) ( not ( = ?auto_815351 ?auto_815353 ) ) ( not ( = ?auto_815351 ?auto_815354 ) ) ( not ( = ?auto_815352 ?auto_815353 ) ) ( not ( = ?auto_815352 ?auto_815354 ) ) ( not ( = ?auto_815353 ?auto_815354 ) ) ( CLEAR ?auto_815351 ) ( ON ?auto_815352 ?auto_815353 ) ( CLEAR ?auto_815352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_815338 ?auto_815339 ?auto_815340 ?auto_815341 ?auto_815342 ?auto_815343 ?auto_815344 ?auto_815345 ?auto_815346 ?auto_815347 ?auto_815348 ?auto_815349 ?auto_815350 ?auto_815351 ?auto_815352 )
      ( MAKE-16PILE ?auto_815338 ?auto_815339 ?auto_815340 ?auto_815341 ?auto_815342 ?auto_815343 ?auto_815344 ?auto_815345 ?auto_815346 ?auto_815347 ?auto_815348 ?auto_815349 ?auto_815350 ?auto_815351 ?auto_815352 ?auto_815353 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815404 - BLOCK
      ?auto_815405 - BLOCK
      ?auto_815406 - BLOCK
      ?auto_815407 - BLOCK
      ?auto_815408 - BLOCK
      ?auto_815409 - BLOCK
      ?auto_815410 - BLOCK
      ?auto_815411 - BLOCK
      ?auto_815412 - BLOCK
      ?auto_815413 - BLOCK
      ?auto_815414 - BLOCK
      ?auto_815415 - BLOCK
      ?auto_815416 - BLOCK
      ?auto_815417 - BLOCK
      ?auto_815418 - BLOCK
      ?auto_815419 - BLOCK
    )
    :vars
    (
      ?auto_815420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815419 ?auto_815420 ) ( ON-TABLE ?auto_815404 ) ( ON ?auto_815405 ?auto_815404 ) ( ON ?auto_815406 ?auto_815405 ) ( ON ?auto_815407 ?auto_815406 ) ( ON ?auto_815408 ?auto_815407 ) ( ON ?auto_815409 ?auto_815408 ) ( ON ?auto_815410 ?auto_815409 ) ( ON ?auto_815411 ?auto_815410 ) ( ON ?auto_815412 ?auto_815411 ) ( ON ?auto_815413 ?auto_815412 ) ( ON ?auto_815414 ?auto_815413 ) ( ON ?auto_815415 ?auto_815414 ) ( ON ?auto_815416 ?auto_815415 ) ( not ( = ?auto_815404 ?auto_815405 ) ) ( not ( = ?auto_815404 ?auto_815406 ) ) ( not ( = ?auto_815404 ?auto_815407 ) ) ( not ( = ?auto_815404 ?auto_815408 ) ) ( not ( = ?auto_815404 ?auto_815409 ) ) ( not ( = ?auto_815404 ?auto_815410 ) ) ( not ( = ?auto_815404 ?auto_815411 ) ) ( not ( = ?auto_815404 ?auto_815412 ) ) ( not ( = ?auto_815404 ?auto_815413 ) ) ( not ( = ?auto_815404 ?auto_815414 ) ) ( not ( = ?auto_815404 ?auto_815415 ) ) ( not ( = ?auto_815404 ?auto_815416 ) ) ( not ( = ?auto_815404 ?auto_815417 ) ) ( not ( = ?auto_815404 ?auto_815418 ) ) ( not ( = ?auto_815404 ?auto_815419 ) ) ( not ( = ?auto_815404 ?auto_815420 ) ) ( not ( = ?auto_815405 ?auto_815406 ) ) ( not ( = ?auto_815405 ?auto_815407 ) ) ( not ( = ?auto_815405 ?auto_815408 ) ) ( not ( = ?auto_815405 ?auto_815409 ) ) ( not ( = ?auto_815405 ?auto_815410 ) ) ( not ( = ?auto_815405 ?auto_815411 ) ) ( not ( = ?auto_815405 ?auto_815412 ) ) ( not ( = ?auto_815405 ?auto_815413 ) ) ( not ( = ?auto_815405 ?auto_815414 ) ) ( not ( = ?auto_815405 ?auto_815415 ) ) ( not ( = ?auto_815405 ?auto_815416 ) ) ( not ( = ?auto_815405 ?auto_815417 ) ) ( not ( = ?auto_815405 ?auto_815418 ) ) ( not ( = ?auto_815405 ?auto_815419 ) ) ( not ( = ?auto_815405 ?auto_815420 ) ) ( not ( = ?auto_815406 ?auto_815407 ) ) ( not ( = ?auto_815406 ?auto_815408 ) ) ( not ( = ?auto_815406 ?auto_815409 ) ) ( not ( = ?auto_815406 ?auto_815410 ) ) ( not ( = ?auto_815406 ?auto_815411 ) ) ( not ( = ?auto_815406 ?auto_815412 ) ) ( not ( = ?auto_815406 ?auto_815413 ) ) ( not ( = ?auto_815406 ?auto_815414 ) ) ( not ( = ?auto_815406 ?auto_815415 ) ) ( not ( = ?auto_815406 ?auto_815416 ) ) ( not ( = ?auto_815406 ?auto_815417 ) ) ( not ( = ?auto_815406 ?auto_815418 ) ) ( not ( = ?auto_815406 ?auto_815419 ) ) ( not ( = ?auto_815406 ?auto_815420 ) ) ( not ( = ?auto_815407 ?auto_815408 ) ) ( not ( = ?auto_815407 ?auto_815409 ) ) ( not ( = ?auto_815407 ?auto_815410 ) ) ( not ( = ?auto_815407 ?auto_815411 ) ) ( not ( = ?auto_815407 ?auto_815412 ) ) ( not ( = ?auto_815407 ?auto_815413 ) ) ( not ( = ?auto_815407 ?auto_815414 ) ) ( not ( = ?auto_815407 ?auto_815415 ) ) ( not ( = ?auto_815407 ?auto_815416 ) ) ( not ( = ?auto_815407 ?auto_815417 ) ) ( not ( = ?auto_815407 ?auto_815418 ) ) ( not ( = ?auto_815407 ?auto_815419 ) ) ( not ( = ?auto_815407 ?auto_815420 ) ) ( not ( = ?auto_815408 ?auto_815409 ) ) ( not ( = ?auto_815408 ?auto_815410 ) ) ( not ( = ?auto_815408 ?auto_815411 ) ) ( not ( = ?auto_815408 ?auto_815412 ) ) ( not ( = ?auto_815408 ?auto_815413 ) ) ( not ( = ?auto_815408 ?auto_815414 ) ) ( not ( = ?auto_815408 ?auto_815415 ) ) ( not ( = ?auto_815408 ?auto_815416 ) ) ( not ( = ?auto_815408 ?auto_815417 ) ) ( not ( = ?auto_815408 ?auto_815418 ) ) ( not ( = ?auto_815408 ?auto_815419 ) ) ( not ( = ?auto_815408 ?auto_815420 ) ) ( not ( = ?auto_815409 ?auto_815410 ) ) ( not ( = ?auto_815409 ?auto_815411 ) ) ( not ( = ?auto_815409 ?auto_815412 ) ) ( not ( = ?auto_815409 ?auto_815413 ) ) ( not ( = ?auto_815409 ?auto_815414 ) ) ( not ( = ?auto_815409 ?auto_815415 ) ) ( not ( = ?auto_815409 ?auto_815416 ) ) ( not ( = ?auto_815409 ?auto_815417 ) ) ( not ( = ?auto_815409 ?auto_815418 ) ) ( not ( = ?auto_815409 ?auto_815419 ) ) ( not ( = ?auto_815409 ?auto_815420 ) ) ( not ( = ?auto_815410 ?auto_815411 ) ) ( not ( = ?auto_815410 ?auto_815412 ) ) ( not ( = ?auto_815410 ?auto_815413 ) ) ( not ( = ?auto_815410 ?auto_815414 ) ) ( not ( = ?auto_815410 ?auto_815415 ) ) ( not ( = ?auto_815410 ?auto_815416 ) ) ( not ( = ?auto_815410 ?auto_815417 ) ) ( not ( = ?auto_815410 ?auto_815418 ) ) ( not ( = ?auto_815410 ?auto_815419 ) ) ( not ( = ?auto_815410 ?auto_815420 ) ) ( not ( = ?auto_815411 ?auto_815412 ) ) ( not ( = ?auto_815411 ?auto_815413 ) ) ( not ( = ?auto_815411 ?auto_815414 ) ) ( not ( = ?auto_815411 ?auto_815415 ) ) ( not ( = ?auto_815411 ?auto_815416 ) ) ( not ( = ?auto_815411 ?auto_815417 ) ) ( not ( = ?auto_815411 ?auto_815418 ) ) ( not ( = ?auto_815411 ?auto_815419 ) ) ( not ( = ?auto_815411 ?auto_815420 ) ) ( not ( = ?auto_815412 ?auto_815413 ) ) ( not ( = ?auto_815412 ?auto_815414 ) ) ( not ( = ?auto_815412 ?auto_815415 ) ) ( not ( = ?auto_815412 ?auto_815416 ) ) ( not ( = ?auto_815412 ?auto_815417 ) ) ( not ( = ?auto_815412 ?auto_815418 ) ) ( not ( = ?auto_815412 ?auto_815419 ) ) ( not ( = ?auto_815412 ?auto_815420 ) ) ( not ( = ?auto_815413 ?auto_815414 ) ) ( not ( = ?auto_815413 ?auto_815415 ) ) ( not ( = ?auto_815413 ?auto_815416 ) ) ( not ( = ?auto_815413 ?auto_815417 ) ) ( not ( = ?auto_815413 ?auto_815418 ) ) ( not ( = ?auto_815413 ?auto_815419 ) ) ( not ( = ?auto_815413 ?auto_815420 ) ) ( not ( = ?auto_815414 ?auto_815415 ) ) ( not ( = ?auto_815414 ?auto_815416 ) ) ( not ( = ?auto_815414 ?auto_815417 ) ) ( not ( = ?auto_815414 ?auto_815418 ) ) ( not ( = ?auto_815414 ?auto_815419 ) ) ( not ( = ?auto_815414 ?auto_815420 ) ) ( not ( = ?auto_815415 ?auto_815416 ) ) ( not ( = ?auto_815415 ?auto_815417 ) ) ( not ( = ?auto_815415 ?auto_815418 ) ) ( not ( = ?auto_815415 ?auto_815419 ) ) ( not ( = ?auto_815415 ?auto_815420 ) ) ( not ( = ?auto_815416 ?auto_815417 ) ) ( not ( = ?auto_815416 ?auto_815418 ) ) ( not ( = ?auto_815416 ?auto_815419 ) ) ( not ( = ?auto_815416 ?auto_815420 ) ) ( not ( = ?auto_815417 ?auto_815418 ) ) ( not ( = ?auto_815417 ?auto_815419 ) ) ( not ( = ?auto_815417 ?auto_815420 ) ) ( not ( = ?auto_815418 ?auto_815419 ) ) ( not ( = ?auto_815418 ?auto_815420 ) ) ( not ( = ?auto_815419 ?auto_815420 ) ) ( ON ?auto_815418 ?auto_815419 ) ( CLEAR ?auto_815416 ) ( ON ?auto_815417 ?auto_815418 ) ( CLEAR ?auto_815417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_815404 ?auto_815405 ?auto_815406 ?auto_815407 ?auto_815408 ?auto_815409 ?auto_815410 ?auto_815411 ?auto_815412 ?auto_815413 ?auto_815414 ?auto_815415 ?auto_815416 ?auto_815417 )
      ( MAKE-16PILE ?auto_815404 ?auto_815405 ?auto_815406 ?auto_815407 ?auto_815408 ?auto_815409 ?auto_815410 ?auto_815411 ?auto_815412 ?auto_815413 ?auto_815414 ?auto_815415 ?auto_815416 ?auto_815417 ?auto_815418 ?auto_815419 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815470 - BLOCK
      ?auto_815471 - BLOCK
      ?auto_815472 - BLOCK
      ?auto_815473 - BLOCK
      ?auto_815474 - BLOCK
      ?auto_815475 - BLOCK
      ?auto_815476 - BLOCK
      ?auto_815477 - BLOCK
      ?auto_815478 - BLOCK
      ?auto_815479 - BLOCK
      ?auto_815480 - BLOCK
      ?auto_815481 - BLOCK
      ?auto_815482 - BLOCK
      ?auto_815483 - BLOCK
      ?auto_815484 - BLOCK
      ?auto_815485 - BLOCK
    )
    :vars
    (
      ?auto_815486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815485 ?auto_815486 ) ( ON-TABLE ?auto_815470 ) ( ON ?auto_815471 ?auto_815470 ) ( ON ?auto_815472 ?auto_815471 ) ( ON ?auto_815473 ?auto_815472 ) ( ON ?auto_815474 ?auto_815473 ) ( ON ?auto_815475 ?auto_815474 ) ( ON ?auto_815476 ?auto_815475 ) ( ON ?auto_815477 ?auto_815476 ) ( ON ?auto_815478 ?auto_815477 ) ( ON ?auto_815479 ?auto_815478 ) ( ON ?auto_815480 ?auto_815479 ) ( ON ?auto_815481 ?auto_815480 ) ( not ( = ?auto_815470 ?auto_815471 ) ) ( not ( = ?auto_815470 ?auto_815472 ) ) ( not ( = ?auto_815470 ?auto_815473 ) ) ( not ( = ?auto_815470 ?auto_815474 ) ) ( not ( = ?auto_815470 ?auto_815475 ) ) ( not ( = ?auto_815470 ?auto_815476 ) ) ( not ( = ?auto_815470 ?auto_815477 ) ) ( not ( = ?auto_815470 ?auto_815478 ) ) ( not ( = ?auto_815470 ?auto_815479 ) ) ( not ( = ?auto_815470 ?auto_815480 ) ) ( not ( = ?auto_815470 ?auto_815481 ) ) ( not ( = ?auto_815470 ?auto_815482 ) ) ( not ( = ?auto_815470 ?auto_815483 ) ) ( not ( = ?auto_815470 ?auto_815484 ) ) ( not ( = ?auto_815470 ?auto_815485 ) ) ( not ( = ?auto_815470 ?auto_815486 ) ) ( not ( = ?auto_815471 ?auto_815472 ) ) ( not ( = ?auto_815471 ?auto_815473 ) ) ( not ( = ?auto_815471 ?auto_815474 ) ) ( not ( = ?auto_815471 ?auto_815475 ) ) ( not ( = ?auto_815471 ?auto_815476 ) ) ( not ( = ?auto_815471 ?auto_815477 ) ) ( not ( = ?auto_815471 ?auto_815478 ) ) ( not ( = ?auto_815471 ?auto_815479 ) ) ( not ( = ?auto_815471 ?auto_815480 ) ) ( not ( = ?auto_815471 ?auto_815481 ) ) ( not ( = ?auto_815471 ?auto_815482 ) ) ( not ( = ?auto_815471 ?auto_815483 ) ) ( not ( = ?auto_815471 ?auto_815484 ) ) ( not ( = ?auto_815471 ?auto_815485 ) ) ( not ( = ?auto_815471 ?auto_815486 ) ) ( not ( = ?auto_815472 ?auto_815473 ) ) ( not ( = ?auto_815472 ?auto_815474 ) ) ( not ( = ?auto_815472 ?auto_815475 ) ) ( not ( = ?auto_815472 ?auto_815476 ) ) ( not ( = ?auto_815472 ?auto_815477 ) ) ( not ( = ?auto_815472 ?auto_815478 ) ) ( not ( = ?auto_815472 ?auto_815479 ) ) ( not ( = ?auto_815472 ?auto_815480 ) ) ( not ( = ?auto_815472 ?auto_815481 ) ) ( not ( = ?auto_815472 ?auto_815482 ) ) ( not ( = ?auto_815472 ?auto_815483 ) ) ( not ( = ?auto_815472 ?auto_815484 ) ) ( not ( = ?auto_815472 ?auto_815485 ) ) ( not ( = ?auto_815472 ?auto_815486 ) ) ( not ( = ?auto_815473 ?auto_815474 ) ) ( not ( = ?auto_815473 ?auto_815475 ) ) ( not ( = ?auto_815473 ?auto_815476 ) ) ( not ( = ?auto_815473 ?auto_815477 ) ) ( not ( = ?auto_815473 ?auto_815478 ) ) ( not ( = ?auto_815473 ?auto_815479 ) ) ( not ( = ?auto_815473 ?auto_815480 ) ) ( not ( = ?auto_815473 ?auto_815481 ) ) ( not ( = ?auto_815473 ?auto_815482 ) ) ( not ( = ?auto_815473 ?auto_815483 ) ) ( not ( = ?auto_815473 ?auto_815484 ) ) ( not ( = ?auto_815473 ?auto_815485 ) ) ( not ( = ?auto_815473 ?auto_815486 ) ) ( not ( = ?auto_815474 ?auto_815475 ) ) ( not ( = ?auto_815474 ?auto_815476 ) ) ( not ( = ?auto_815474 ?auto_815477 ) ) ( not ( = ?auto_815474 ?auto_815478 ) ) ( not ( = ?auto_815474 ?auto_815479 ) ) ( not ( = ?auto_815474 ?auto_815480 ) ) ( not ( = ?auto_815474 ?auto_815481 ) ) ( not ( = ?auto_815474 ?auto_815482 ) ) ( not ( = ?auto_815474 ?auto_815483 ) ) ( not ( = ?auto_815474 ?auto_815484 ) ) ( not ( = ?auto_815474 ?auto_815485 ) ) ( not ( = ?auto_815474 ?auto_815486 ) ) ( not ( = ?auto_815475 ?auto_815476 ) ) ( not ( = ?auto_815475 ?auto_815477 ) ) ( not ( = ?auto_815475 ?auto_815478 ) ) ( not ( = ?auto_815475 ?auto_815479 ) ) ( not ( = ?auto_815475 ?auto_815480 ) ) ( not ( = ?auto_815475 ?auto_815481 ) ) ( not ( = ?auto_815475 ?auto_815482 ) ) ( not ( = ?auto_815475 ?auto_815483 ) ) ( not ( = ?auto_815475 ?auto_815484 ) ) ( not ( = ?auto_815475 ?auto_815485 ) ) ( not ( = ?auto_815475 ?auto_815486 ) ) ( not ( = ?auto_815476 ?auto_815477 ) ) ( not ( = ?auto_815476 ?auto_815478 ) ) ( not ( = ?auto_815476 ?auto_815479 ) ) ( not ( = ?auto_815476 ?auto_815480 ) ) ( not ( = ?auto_815476 ?auto_815481 ) ) ( not ( = ?auto_815476 ?auto_815482 ) ) ( not ( = ?auto_815476 ?auto_815483 ) ) ( not ( = ?auto_815476 ?auto_815484 ) ) ( not ( = ?auto_815476 ?auto_815485 ) ) ( not ( = ?auto_815476 ?auto_815486 ) ) ( not ( = ?auto_815477 ?auto_815478 ) ) ( not ( = ?auto_815477 ?auto_815479 ) ) ( not ( = ?auto_815477 ?auto_815480 ) ) ( not ( = ?auto_815477 ?auto_815481 ) ) ( not ( = ?auto_815477 ?auto_815482 ) ) ( not ( = ?auto_815477 ?auto_815483 ) ) ( not ( = ?auto_815477 ?auto_815484 ) ) ( not ( = ?auto_815477 ?auto_815485 ) ) ( not ( = ?auto_815477 ?auto_815486 ) ) ( not ( = ?auto_815478 ?auto_815479 ) ) ( not ( = ?auto_815478 ?auto_815480 ) ) ( not ( = ?auto_815478 ?auto_815481 ) ) ( not ( = ?auto_815478 ?auto_815482 ) ) ( not ( = ?auto_815478 ?auto_815483 ) ) ( not ( = ?auto_815478 ?auto_815484 ) ) ( not ( = ?auto_815478 ?auto_815485 ) ) ( not ( = ?auto_815478 ?auto_815486 ) ) ( not ( = ?auto_815479 ?auto_815480 ) ) ( not ( = ?auto_815479 ?auto_815481 ) ) ( not ( = ?auto_815479 ?auto_815482 ) ) ( not ( = ?auto_815479 ?auto_815483 ) ) ( not ( = ?auto_815479 ?auto_815484 ) ) ( not ( = ?auto_815479 ?auto_815485 ) ) ( not ( = ?auto_815479 ?auto_815486 ) ) ( not ( = ?auto_815480 ?auto_815481 ) ) ( not ( = ?auto_815480 ?auto_815482 ) ) ( not ( = ?auto_815480 ?auto_815483 ) ) ( not ( = ?auto_815480 ?auto_815484 ) ) ( not ( = ?auto_815480 ?auto_815485 ) ) ( not ( = ?auto_815480 ?auto_815486 ) ) ( not ( = ?auto_815481 ?auto_815482 ) ) ( not ( = ?auto_815481 ?auto_815483 ) ) ( not ( = ?auto_815481 ?auto_815484 ) ) ( not ( = ?auto_815481 ?auto_815485 ) ) ( not ( = ?auto_815481 ?auto_815486 ) ) ( not ( = ?auto_815482 ?auto_815483 ) ) ( not ( = ?auto_815482 ?auto_815484 ) ) ( not ( = ?auto_815482 ?auto_815485 ) ) ( not ( = ?auto_815482 ?auto_815486 ) ) ( not ( = ?auto_815483 ?auto_815484 ) ) ( not ( = ?auto_815483 ?auto_815485 ) ) ( not ( = ?auto_815483 ?auto_815486 ) ) ( not ( = ?auto_815484 ?auto_815485 ) ) ( not ( = ?auto_815484 ?auto_815486 ) ) ( not ( = ?auto_815485 ?auto_815486 ) ) ( ON ?auto_815484 ?auto_815485 ) ( ON ?auto_815483 ?auto_815484 ) ( CLEAR ?auto_815481 ) ( ON ?auto_815482 ?auto_815483 ) ( CLEAR ?auto_815482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_815470 ?auto_815471 ?auto_815472 ?auto_815473 ?auto_815474 ?auto_815475 ?auto_815476 ?auto_815477 ?auto_815478 ?auto_815479 ?auto_815480 ?auto_815481 ?auto_815482 )
      ( MAKE-16PILE ?auto_815470 ?auto_815471 ?auto_815472 ?auto_815473 ?auto_815474 ?auto_815475 ?auto_815476 ?auto_815477 ?auto_815478 ?auto_815479 ?auto_815480 ?auto_815481 ?auto_815482 ?auto_815483 ?auto_815484 ?auto_815485 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815536 - BLOCK
      ?auto_815537 - BLOCK
      ?auto_815538 - BLOCK
      ?auto_815539 - BLOCK
      ?auto_815540 - BLOCK
      ?auto_815541 - BLOCK
      ?auto_815542 - BLOCK
      ?auto_815543 - BLOCK
      ?auto_815544 - BLOCK
      ?auto_815545 - BLOCK
      ?auto_815546 - BLOCK
      ?auto_815547 - BLOCK
      ?auto_815548 - BLOCK
      ?auto_815549 - BLOCK
      ?auto_815550 - BLOCK
      ?auto_815551 - BLOCK
    )
    :vars
    (
      ?auto_815552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815551 ?auto_815552 ) ( ON-TABLE ?auto_815536 ) ( ON ?auto_815537 ?auto_815536 ) ( ON ?auto_815538 ?auto_815537 ) ( ON ?auto_815539 ?auto_815538 ) ( ON ?auto_815540 ?auto_815539 ) ( ON ?auto_815541 ?auto_815540 ) ( ON ?auto_815542 ?auto_815541 ) ( ON ?auto_815543 ?auto_815542 ) ( ON ?auto_815544 ?auto_815543 ) ( ON ?auto_815545 ?auto_815544 ) ( ON ?auto_815546 ?auto_815545 ) ( not ( = ?auto_815536 ?auto_815537 ) ) ( not ( = ?auto_815536 ?auto_815538 ) ) ( not ( = ?auto_815536 ?auto_815539 ) ) ( not ( = ?auto_815536 ?auto_815540 ) ) ( not ( = ?auto_815536 ?auto_815541 ) ) ( not ( = ?auto_815536 ?auto_815542 ) ) ( not ( = ?auto_815536 ?auto_815543 ) ) ( not ( = ?auto_815536 ?auto_815544 ) ) ( not ( = ?auto_815536 ?auto_815545 ) ) ( not ( = ?auto_815536 ?auto_815546 ) ) ( not ( = ?auto_815536 ?auto_815547 ) ) ( not ( = ?auto_815536 ?auto_815548 ) ) ( not ( = ?auto_815536 ?auto_815549 ) ) ( not ( = ?auto_815536 ?auto_815550 ) ) ( not ( = ?auto_815536 ?auto_815551 ) ) ( not ( = ?auto_815536 ?auto_815552 ) ) ( not ( = ?auto_815537 ?auto_815538 ) ) ( not ( = ?auto_815537 ?auto_815539 ) ) ( not ( = ?auto_815537 ?auto_815540 ) ) ( not ( = ?auto_815537 ?auto_815541 ) ) ( not ( = ?auto_815537 ?auto_815542 ) ) ( not ( = ?auto_815537 ?auto_815543 ) ) ( not ( = ?auto_815537 ?auto_815544 ) ) ( not ( = ?auto_815537 ?auto_815545 ) ) ( not ( = ?auto_815537 ?auto_815546 ) ) ( not ( = ?auto_815537 ?auto_815547 ) ) ( not ( = ?auto_815537 ?auto_815548 ) ) ( not ( = ?auto_815537 ?auto_815549 ) ) ( not ( = ?auto_815537 ?auto_815550 ) ) ( not ( = ?auto_815537 ?auto_815551 ) ) ( not ( = ?auto_815537 ?auto_815552 ) ) ( not ( = ?auto_815538 ?auto_815539 ) ) ( not ( = ?auto_815538 ?auto_815540 ) ) ( not ( = ?auto_815538 ?auto_815541 ) ) ( not ( = ?auto_815538 ?auto_815542 ) ) ( not ( = ?auto_815538 ?auto_815543 ) ) ( not ( = ?auto_815538 ?auto_815544 ) ) ( not ( = ?auto_815538 ?auto_815545 ) ) ( not ( = ?auto_815538 ?auto_815546 ) ) ( not ( = ?auto_815538 ?auto_815547 ) ) ( not ( = ?auto_815538 ?auto_815548 ) ) ( not ( = ?auto_815538 ?auto_815549 ) ) ( not ( = ?auto_815538 ?auto_815550 ) ) ( not ( = ?auto_815538 ?auto_815551 ) ) ( not ( = ?auto_815538 ?auto_815552 ) ) ( not ( = ?auto_815539 ?auto_815540 ) ) ( not ( = ?auto_815539 ?auto_815541 ) ) ( not ( = ?auto_815539 ?auto_815542 ) ) ( not ( = ?auto_815539 ?auto_815543 ) ) ( not ( = ?auto_815539 ?auto_815544 ) ) ( not ( = ?auto_815539 ?auto_815545 ) ) ( not ( = ?auto_815539 ?auto_815546 ) ) ( not ( = ?auto_815539 ?auto_815547 ) ) ( not ( = ?auto_815539 ?auto_815548 ) ) ( not ( = ?auto_815539 ?auto_815549 ) ) ( not ( = ?auto_815539 ?auto_815550 ) ) ( not ( = ?auto_815539 ?auto_815551 ) ) ( not ( = ?auto_815539 ?auto_815552 ) ) ( not ( = ?auto_815540 ?auto_815541 ) ) ( not ( = ?auto_815540 ?auto_815542 ) ) ( not ( = ?auto_815540 ?auto_815543 ) ) ( not ( = ?auto_815540 ?auto_815544 ) ) ( not ( = ?auto_815540 ?auto_815545 ) ) ( not ( = ?auto_815540 ?auto_815546 ) ) ( not ( = ?auto_815540 ?auto_815547 ) ) ( not ( = ?auto_815540 ?auto_815548 ) ) ( not ( = ?auto_815540 ?auto_815549 ) ) ( not ( = ?auto_815540 ?auto_815550 ) ) ( not ( = ?auto_815540 ?auto_815551 ) ) ( not ( = ?auto_815540 ?auto_815552 ) ) ( not ( = ?auto_815541 ?auto_815542 ) ) ( not ( = ?auto_815541 ?auto_815543 ) ) ( not ( = ?auto_815541 ?auto_815544 ) ) ( not ( = ?auto_815541 ?auto_815545 ) ) ( not ( = ?auto_815541 ?auto_815546 ) ) ( not ( = ?auto_815541 ?auto_815547 ) ) ( not ( = ?auto_815541 ?auto_815548 ) ) ( not ( = ?auto_815541 ?auto_815549 ) ) ( not ( = ?auto_815541 ?auto_815550 ) ) ( not ( = ?auto_815541 ?auto_815551 ) ) ( not ( = ?auto_815541 ?auto_815552 ) ) ( not ( = ?auto_815542 ?auto_815543 ) ) ( not ( = ?auto_815542 ?auto_815544 ) ) ( not ( = ?auto_815542 ?auto_815545 ) ) ( not ( = ?auto_815542 ?auto_815546 ) ) ( not ( = ?auto_815542 ?auto_815547 ) ) ( not ( = ?auto_815542 ?auto_815548 ) ) ( not ( = ?auto_815542 ?auto_815549 ) ) ( not ( = ?auto_815542 ?auto_815550 ) ) ( not ( = ?auto_815542 ?auto_815551 ) ) ( not ( = ?auto_815542 ?auto_815552 ) ) ( not ( = ?auto_815543 ?auto_815544 ) ) ( not ( = ?auto_815543 ?auto_815545 ) ) ( not ( = ?auto_815543 ?auto_815546 ) ) ( not ( = ?auto_815543 ?auto_815547 ) ) ( not ( = ?auto_815543 ?auto_815548 ) ) ( not ( = ?auto_815543 ?auto_815549 ) ) ( not ( = ?auto_815543 ?auto_815550 ) ) ( not ( = ?auto_815543 ?auto_815551 ) ) ( not ( = ?auto_815543 ?auto_815552 ) ) ( not ( = ?auto_815544 ?auto_815545 ) ) ( not ( = ?auto_815544 ?auto_815546 ) ) ( not ( = ?auto_815544 ?auto_815547 ) ) ( not ( = ?auto_815544 ?auto_815548 ) ) ( not ( = ?auto_815544 ?auto_815549 ) ) ( not ( = ?auto_815544 ?auto_815550 ) ) ( not ( = ?auto_815544 ?auto_815551 ) ) ( not ( = ?auto_815544 ?auto_815552 ) ) ( not ( = ?auto_815545 ?auto_815546 ) ) ( not ( = ?auto_815545 ?auto_815547 ) ) ( not ( = ?auto_815545 ?auto_815548 ) ) ( not ( = ?auto_815545 ?auto_815549 ) ) ( not ( = ?auto_815545 ?auto_815550 ) ) ( not ( = ?auto_815545 ?auto_815551 ) ) ( not ( = ?auto_815545 ?auto_815552 ) ) ( not ( = ?auto_815546 ?auto_815547 ) ) ( not ( = ?auto_815546 ?auto_815548 ) ) ( not ( = ?auto_815546 ?auto_815549 ) ) ( not ( = ?auto_815546 ?auto_815550 ) ) ( not ( = ?auto_815546 ?auto_815551 ) ) ( not ( = ?auto_815546 ?auto_815552 ) ) ( not ( = ?auto_815547 ?auto_815548 ) ) ( not ( = ?auto_815547 ?auto_815549 ) ) ( not ( = ?auto_815547 ?auto_815550 ) ) ( not ( = ?auto_815547 ?auto_815551 ) ) ( not ( = ?auto_815547 ?auto_815552 ) ) ( not ( = ?auto_815548 ?auto_815549 ) ) ( not ( = ?auto_815548 ?auto_815550 ) ) ( not ( = ?auto_815548 ?auto_815551 ) ) ( not ( = ?auto_815548 ?auto_815552 ) ) ( not ( = ?auto_815549 ?auto_815550 ) ) ( not ( = ?auto_815549 ?auto_815551 ) ) ( not ( = ?auto_815549 ?auto_815552 ) ) ( not ( = ?auto_815550 ?auto_815551 ) ) ( not ( = ?auto_815550 ?auto_815552 ) ) ( not ( = ?auto_815551 ?auto_815552 ) ) ( ON ?auto_815550 ?auto_815551 ) ( ON ?auto_815549 ?auto_815550 ) ( ON ?auto_815548 ?auto_815549 ) ( CLEAR ?auto_815546 ) ( ON ?auto_815547 ?auto_815548 ) ( CLEAR ?auto_815547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_815536 ?auto_815537 ?auto_815538 ?auto_815539 ?auto_815540 ?auto_815541 ?auto_815542 ?auto_815543 ?auto_815544 ?auto_815545 ?auto_815546 ?auto_815547 )
      ( MAKE-16PILE ?auto_815536 ?auto_815537 ?auto_815538 ?auto_815539 ?auto_815540 ?auto_815541 ?auto_815542 ?auto_815543 ?auto_815544 ?auto_815545 ?auto_815546 ?auto_815547 ?auto_815548 ?auto_815549 ?auto_815550 ?auto_815551 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815602 - BLOCK
      ?auto_815603 - BLOCK
      ?auto_815604 - BLOCK
      ?auto_815605 - BLOCK
      ?auto_815606 - BLOCK
      ?auto_815607 - BLOCK
      ?auto_815608 - BLOCK
      ?auto_815609 - BLOCK
      ?auto_815610 - BLOCK
      ?auto_815611 - BLOCK
      ?auto_815612 - BLOCK
      ?auto_815613 - BLOCK
      ?auto_815614 - BLOCK
      ?auto_815615 - BLOCK
      ?auto_815616 - BLOCK
      ?auto_815617 - BLOCK
    )
    :vars
    (
      ?auto_815618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815617 ?auto_815618 ) ( ON-TABLE ?auto_815602 ) ( ON ?auto_815603 ?auto_815602 ) ( ON ?auto_815604 ?auto_815603 ) ( ON ?auto_815605 ?auto_815604 ) ( ON ?auto_815606 ?auto_815605 ) ( ON ?auto_815607 ?auto_815606 ) ( ON ?auto_815608 ?auto_815607 ) ( ON ?auto_815609 ?auto_815608 ) ( ON ?auto_815610 ?auto_815609 ) ( ON ?auto_815611 ?auto_815610 ) ( not ( = ?auto_815602 ?auto_815603 ) ) ( not ( = ?auto_815602 ?auto_815604 ) ) ( not ( = ?auto_815602 ?auto_815605 ) ) ( not ( = ?auto_815602 ?auto_815606 ) ) ( not ( = ?auto_815602 ?auto_815607 ) ) ( not ( = ?auto_815602 ?auto_815608 ) ) ( not ( = ?auto_815602 ?auto_815609 ) ) ( not ( = ?auto_815602 ?auto_815610 ) ) ( not ( = ?auto_815602 ?auto_815611 ) ) ( not ( = ?auto_815602 ?auto_815612 ) ) ( not ( = ?auto_815602 ?auto_815613 ) ) ( not ( = ?auto_815602 ?auto_815614 ) ) ( not ( = ?auto_815602 ?auto_815615 ) ) ( not ( = ?auto_815602 ?auto_815616 ) ) ( not ( = ?auto_815602 ?auto_815617 ) ) ( not ( = ?auto_815602 ?auto_815618 ) ) ( not ( = ?auto_815603 ?auto_815604 ) ) ( not ( = ?auto_815603 ?auto_815605 ) ) ( not ( = ?auto_815603 ?auto_815606 ) ) ( not ( = ?auto_815603 ?auto_815607 ) ) ( not ( = ?auto_815603 ?auto_815608 ) ) ( not ( = ?auto_815603 ?auto_815609 ) ) ( not ( = ?auto_815603 ?auto_815610 ) ) ( not ( = ?auto_815603 ?auto_815611 ) ) ( not ( = ?auto_815603 ?auto_815612 ) ) ( not ( = ?auto_815603 ?auto_815613 ) ) ( not ( = ?auto_815603 ?auto_815614 ) ) ( not ( = ?auto_815603 ?auto_815615 ) ) ( not ( = ?auto_815603 ?auto_815616 ) ) ( not ( = ?auto_815603 ?auto_815617 ) ) ( not ( = ?auto_815603 ?auto_815618 ) ) ( not ( = ?auto_815604 ?auto_815605 ) ) ( not ( = ?auto_815604 ?auto_815606 ) ) ( not ( = ?auto_815604 ?auto_815607 ) ) ( not ( = ?auto_815604 ?auto_815608 ) ) ( not ( = ?auto_815604 ?auto_815609 ) ) ( not ( = ?auto_815604 ?auto_815610 ) ) ( not ( = ?auto_815604 ?auto_815611 ) ) ( not ( = ?auto_815604 ?auto_815612 ) ) ( not ( = ?auto_815604 ?auto_815613 ) ) ( not ( = ?auto_815604 ?auto_815614 ) ) ( not ( = ?auto_815604 ?auto_815615 ) ) ( not ( = ?auto_815604 ?auto_815616 ) ) ( not ( = ?auto_815604 ?auto_815617 ) ) ( not ( = ?auto_815604 ?auto_815618 ) ) ( not ( = ?auto_815605 ?auto_815606 ) ) ( not ( = ?auto_815605 ?auto_815607 ) ) ( not ( = ?auto_815605 ?auto_815608 ) ) ( not ( = ?auto_815605 ?auto_815609 ) ) ( not ( = ?auto_815605 ?auto_815610 ) ) ( not ( = ?auto_815605 ?auto_815611 ) ) ( not ( = ?auto_815605 ?auto_815612 ) ) ( not ( = ?auto_815605 ?auto_815613 ) ) ( not ( = ?auto_815605 ?auto_815614 ) ) ( not ( = ?auto_815605 ?auto_815615 ) ) ( not ( = ?auto_815605 ?auto_815616 ) ) ( not ( = ?auto_815605 ?auto_815617 ) ) ( not ( = ?auto_815605 ?auto_815618 ) ) ( not ( = ?auto_815606 ?auto_815607 ) ) ( not ( = ?auto_815606 ?auto_815608 ) ) ( not ( = ?auto_815606 ?auto_815609 ) ) ( not ( = ?auto_815606 ?auto_815610 ) ) ( not ( = ?auto_815606 ?auto_815611 ) ) ( not ( = ?auto_815606 ?auto_815612 ) ) ( not ( = ?auto_815606 ?auto_815613 ) ) ( not ( = ?auto_815606 ?auto_815614 ) ) ( not ( = ?auto_815606 ?auto_815615 ) ) ( not ( = ?auto_815606 ?auto_815616 ) ) ( not ( = ?auto_815606 ?auto_815617 ) ) ( not ( = ?auto_815606 ?auto_815618 ) ) ( not ( = ?auto_815607 ?auto_815608 ) ) ( not ( = ?auto_815607 ?auto_815609 ) ) ( not ( = ?auto_815607 ?auto_815610 ) ) ( not ( = ?auto_815607 ?auto_815611 ) ) ( not ( = ?auto_815607 ?auto_815612 ) ) ( not ( = ?auto_815607 ?auto_815613 ) ) ( not ( = ?auto_815607 ?auto_815614 ) ) ( not ( = ?auto_815607 ?auto_815615 ) ) ( not ( = ?auto_815607 ?auto_815616 ) ) ( not ( = ?auto_815607 ?auto_815617 ) ) ( not ( = ?auto_815607 ?auto_815618 ) ) ( not ( = ?auto_815608 ?auto_815609 ) ) ( not ( = ?auto_815608 ?auto_815610 ) ) ( not ( = ?auto_815608 ?auto_815611 ) ) ( not ( = ?auto_815608 ?auto_815612 ) ) ( not ( = ?auto_815608 ?auto_815613 ) ) ( not ( = ?auto_815608 ?auto_815614 ) ) ( not ( = ?auto_815608 ?auto_815615 ) ) ( not ( = ?auto_815608 ?auto_815616 ) ) ( not ( = ?auto_815608 ?auto_815617 ) ) ( not ( = ?auto_815608 ?auto_815618 ) ) ( not ( = ?auto_815609 ?auto_815610 ) ) ( not ( = ?auto_815609 ?auto_815611 ) ) ( not ( = ?auto_815609 ?auto_815612 ) ) ( not ( = ?auto_815609 ?auto_815613 ) ) ( not ( = ?auto_815609 ?auto_815614 ) ) ( not ( = ?auto_815609 ?auto_815615 ) ) ( not ( = ?auto_815609 ?auto_815616 ) ) ( not ( = ?auto_815609 ?auto_815617 ) ) ( not ( = ?auto_815609 ?auto_815618 ) ) ( not ( = ?auto_815610 ?auto_815611 ) ) ( not ( = ?auto_815610 ?auto_815612 ) ) ( not ( = ?auto_815610 ?auto_815613 ) ) ( not ( = ?auto_815610 ?auto_815614 ) ) ( not ( = ?auto_815610 ?auto_815615 ) ) ( not ( = ?auto_815610 ?auto_815616 ) ) ( not ( = ?auto_815610 ?auto_815617 ) ) ( not ( = ?auto_815610 ?auto_815618 ) ) ( not ( = ?auto_815611 ?auto_815612 ) ) ( not ( = ?auto_815611 ?auto_815613 ) ) ( not ( = ?auto_815611 ?auto_815614 ) ) ( not ( = ?auto_815611 ?auto_815615 ) ) ( not ( = ?auto_815611 ?auto_815616 ) ) ( not ( = ?auto_815611 ?auto_815617 ) ) ( not ( = ?auto_815611 ?auto_815618 ) ) ( not ( = ?auto_815612 ?auto_815613 ) ) ( not ( = ?auto_815612 ?auto_815614 ) ) ( not ( = ?auto_815612 ?auto_815615 ) ) ( not ( = ?auto_815612 ?auto_815616 ) ) ( not ( = ?auto_815612 ?auto_815617 ) ) ( not ( = ?auto_815612 ?auto_815618 ) ) ( not ( = ?auto_815613 ?auto_815614 ) ) ( not ( = ?auto_815613 ?auto_815615 ) ) ( not ( = ?auto_815613 ?auto_815616 ) ) ( not ( = ?auto_815613 ?auto_815617 ) ) ( not ( = ?auto_815613 ?auto_815618 ) ) ( not ( = ?auto_815614 ?auto_815615 ) ) ( not ( = ?auto_815614 ?auto_815616 ) ) ( not ( = ?auto_815614 ?auto_815617 ) ) ( not ( = ?auto_815614 ?auto_815618 ) ) ( not ( = ?auto_815615 ?auto_815616 ) ) ( not ( = ?auto_815615 ?auto_815617 ) ) ( not ( = ?auto_815615 ?auto_815618 ) ) ( not ( = ?auto_815616 ?auto_815617 ) ) ( not ( = ?auto_815616 ?auto_815618 ) ) ( not ( = ?auto_815617 ?auto_815618 ) ) ( ON ?auto_815616 ?auto_815617 ) ( ON ?auto_815615 ?auto_815616 ) ( ON ?auto_815614 ?auto_815615 ) ( ON ?auto_815613 ?auto_815614 ) ( CLEAR ?auto_815611 ) ( ON ?auto_815612 ?auto_815613 ) ( CLEAR ?auto_815612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_815602 ?auto_815603 ?auto_815604 ?auto_815605 ?auto_815606 ?auto_815607 ?auto_815608 ?auto_815609 ?auto_815610 ?auto_815611 ?auto_815612 )
      ( MAKE-16PILE ?auto_815602 ?auto_815603 ?auto_815604 ?auto_815605 ?auto_815606 ?auto_815607 ?auto_815608 ?auto_815609 ?auto_815610 ?auto_815611 ?auto_815612 ?auto_815613 ?auto_815614 ?auto_815615 ?auto_815616 ?auto_815617 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815668 - BLOCK
      ?auto_815669 - BLOCK
      ?auto_815670 - BLOCK
      ?auto_815671 - BLOCK
      ?auto_815672 - BLOCK
      ?auto_815673 - BLOCK
      ?auto_815674 - BLOCK
      ?auto_815675 - BLOCK
      ?auto_815676 - BLOCK
      ?auto_815677 - BLOCK
      ?auto_815678 - BLOCK
      ?auto_815679 - BLOCK
      ?auto_815680 - BLOCK
      ?auto_815681 - BLOCK
      ?auto_815682 - BLOCK
      ?auto_815683 - BLOCK
    )
    :vars
    (
      ?auto_815684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815683 ?auto_815684 ) ( ON-TABLE ?auto_815668 ) ( ON ?auto_815669 ?auto_815668 ) ( ON ?auto_815670 ?auto_815669 ) ( ON ?auto_815671 ?auto_815670 ) ( ON ?auto_815672 ?auto_815671 ) ( ON ?auto_815673 ?auto_815672 ) ( ON ?auto_815674 ?auto_815673 ) ( ON ?auto_815675 ?auto_815674 ) ( ON ?auto_815676 ?auto_815675 ) ( not ( = ?auto_815668 ?auto_815669 ) ) ( not ( = ?auto_815668 ?auto_815670 ) ) ( not ( = ?auto_815668 ?auto_815671 ) ) ( not ( = ?auto_815668 ?auto_815672 ) ) ( not ( = ?auto_815668 ?auto_815673 ) ) ( not ( = ?auto_815668 ?auto_815674 ) ) ( not ( = ?auto_815668 ?auto_815675 ) ) ( not ( = ?auto_815668 ?auto_815676 ) ) ( not ( = ?auto_815668 ?auto_815677 ) ) ( not ( = ?auto_815668 ?auto_815678 ) ) ( not ( = ?auto_815668 ?auto_815679 ) ) ( not ( = ?auto_815668 ?auto_815680 ) ) ( not ( = ?auto_815668 ?auto_815681 ) ) ( not ( = ?auto_815668 ?auto_815682 ) ) ( not ( = ?auto_815668 ?auto_815683 ) ) ( not ( = ?auto_815668 ?auto_815684 ) ) ( not ( = ?auto_815669 ?auto_815670 ) ) ( not ( = ?auto_815669 ?auto_815671 ) ) ( not ( = ?auto_815669 ?auto_815672 ) ) ( not ( = ?auto_815669 ?auto_815673 ) ) ( not ( = ?auto_815669 ?auto_815674 ) ) ( not ( = ?auto_815669 ?auto_815675 ) ) ( not ( = ?auto_815669 ?auto_815676 ) ) ( not ( = ?auto_815669 ?auto_815677 ) ) ( not ( = ?auto_815669 ?auto_815678 ) ) ( not ( = ?auto_815669 ?auto_815679 ) ) ( not ( = ?auto_815669 ?auto_815680 ) ) ( not ( = ?auto_815669 ?auto_815681 ) ) ( not ( = ?auto_815669 ?auto_815682 ) ) ( not ( = ?auto_815669 ?auto_815683 ) ) ( not ( = ?auto_815669 ?auto_815684 ) ) ( not ( = ?auto_815670 ?auto_815671 ) ) ( not ( = ?auto_815670 ?auto_815672 ) ) ( not ( = ?auto_815670 ?auto_815673 ) ) ( not ( = ?auto_815670 ?auto_815674 ) ) ( not ( = ?auto_815670 ?auto_815675 ) ) ( not ( = ?auto_815670 ?auto_815676 ) ) ( not ( = ?auto_815670 ?auto_815677 ) ) ( not ( = ?auto_815670 ?auto_815678 ) ) ( not ( = ?auto_815670 ?auto_815679 ) ) ( not ( = ?auto_815670 ?auto_815680 ) ) ( not ( = ?auto_815670 ?auto_815681 ) ) ( not ( = ?auto_815670 ?auto_815682 ) ) ( not ( = ?auto_815670 ?auto_815683 ) ) ( not ( = ?auto_815670 ?auto_815684 ) ) ( not ( = ?auto_815671 ?auto_815672 ) ) ( not ( = ?auto_815671 ?auto_815673 ) ) ( not ( = ?auto_815671 ?auto_815674 ) ) ( not ( = ?auto_815671 ?auto_815675 ) ) ( not ( = ?auto_815671 ?auto_815676 ) ) ( not ( = ?auto_815671 ?auto_815677 ) ) ( not ( = ?auto_815671 ?auto_815678 ) ) ( not ( = ?auto_815671 ?auto_815679 ) ) ( not ( = ?auto_815671 ?auto_815680 ) ) ( not ( = ?auto_815671 ?auto_815681 ) ) ( not ( = ?auto_815671 ?auto_815682 ) ) ( not ( = ?auto_815671 ?auto_815683 ) ) ( not ( = ?auto_815671 ?auto_815684 ) ) ( not ( = ?auto_815672 ?auto_815673 ) ) ( not ( = ?auto_815672 ?auto_815674 ) ) ( not ( = ?auto_815672 ?auto_815675 ) ) ( not ( = ?auto_815672 ?auto_815676 ) ) ( not ( = ?auto_815672 ?auto_815677 ) ) ( not ( = ?auto_815672 ?auto_815678 ) ) ( not ( = ?auto_815672 ?auto_815679 ) ) ( not ( = ?auto_815672 ?auto_815680 ) ) ( not ( = ?auto_815672 ?auto_815681 ) ) ( not ( = ?auto_815672 ?auto_815682 ) ) ( not ( = ?auto_815672 ?auto_815683 ) ) ( not ( = ?auto_815672 ?auto_815684 ) ) ( not ( = ?auto_815673 ?auto_815674 ) ) ( not ( = ?auto_815673 ?auto_815675 ) ) ( not ( = ?auto_815673 ?auto_815676 ) ) ( not ( = ?auto_815673 ?auto_815677 ) ) ( not ( = ?auto_815673 ?auto_815678 ) ) ( not ( = ?auto_815673 ?auto_815679 ) ) ( not ( = ?auto_815673 ?auto_815680 ) ) ( not ( = ?auto_815673 ?auto_815681 ) ) ( not ( = ?auto_815673 ?auto_815682 ) ) ( not ( = ?auto_815673 ?auto_815683 ) ) ( not ( = ?auto_815673 ?auto_815684 ) ) ( not ( = ?auto_815674 ?auto_815675 ) ) ( not ( = ?auto_815674 ?auto_815676 ) ) ( not ( = ?auto_815674 ?auto_815677 ) ) ( not ( = ?auto_815674 ?auto_815678 ) ) ( not ( = ?auto_815674 ?auto_815679 ) ) ( not ( = ?auto_815674 ?auto_815680 ) ) ( not ( = ?auto_815674 ?auto_815681 ) ) ( not ( = ?auto_815674 ?auto_815682 ) ) ( not ( = ?auto_815674 ?auto_815683 ) ) ( not ( = ?auto_815674 ?auto_815684 ) ) ( not ( = ?auto_815675 ?auto_815676 ) ) ( not ( = ?auto_815675 ?auto_815677 ) ) ( not ( = ?auto_815675 ?auto_815678 ) ) ( not ( = ?auto_815675 ?auto_815679 ) ) ( not ( = ?auto_815675 ?auto_815680 ) ) ( not ( = ?auto_815675 ?auto_815681 ) ) ( not ( = ?auto_815675 ?auto_815682 ) ) ( not ( = ?auto_815675 ?auto_815683 ) ) ( not ( = ?auto_815675 ?auto_815684 ) ) ( not ( = ?auto_815676 ?auto_815677 ) ) ( not ( = ?auto_815676 ?auto_815678 ) ) ( not ( = ?auto_815676 ?auto_815679 ) ) ( not ( = ?auto_815676 ?auto_815680 ) ) ( not ( = ?auto_815676 ?auto_815681 ) ) ( not ( = ?auto_815676 ?auto_815682 ) ) ( not ( = ?auto_815676 ?auto_815683 ) ) ( not ( = ?auto_815676 ?auto_815684 ) ) ( not ( = ?auto_815677 ?auto_815678 ) ) ( not ( = ?auto_815677 ?auto_815679 ) ) ( not ( = ?auto_815677 ?auto_815680 ) ) ( not ( = ?auto_815677 ?auto_815681 ) ) ( not ( = ?auto_815677 ?auto_815682 ) ) ( not ( = ?auto_815677 ?auto_815683 ) ) ( not ( = ?auto_815677 ?auto_815684 ) ) ( not ( = ?auto_815678 ?auto_815679 ) ) ( not ( = ?auto_815678 ?auto_815680 ) ) ( not ( = ?auto_815678 ?auto_815681 ) ) ( not ( = ?auto_815678 ?auto_815682 ) ) ( not ( = ?auto_815678 ?auto_815683 ) ) ( not ( = ?auto_815678 ?auto_815684 ) ) ( not ( = ?auto_815679 ?auto_815680 ) ) ( not ( = ?auto_815679 ?auto_815681 ) ) ( not ( = ?auto_815679 ?auto_815682 ) ) ( not ( = ?auto_815679 ?auto_815683 ) ) ( not ( = ?auto_815679 ?auto_815684 ) ) ( not ( = ?auto_815680 ?auto_815681 ) ) ( not ( = ?auto_815680 ?auto_815682 ) ) ( not ( = ?auto_815680 ?auto_815683 ) ) ( not ( = ?auto_815680 ?auto_815684 ) ) ( not ( = ?auto_815681 ?auto_815682 ) ) ( not ( = ?auto_815681 ?auto_815683 ) ) ( not ( = ?auto_815681 ?auto_815684 ) ) ( not ( = ?auto_815682 ?auto_815683 ) ) ( not ( = ?auto_815682 ?auto_815684 ) ) ( not ( = ?auto_815683 ?auto_815684 ) ) ( ON ?auto_815682 ?auto_815683 ) ( ON ?auto_815681 ?auto_815682 ) ( ON ?auto_815680 ?auto_815681 ) ( ON ?auto_815679 ?auto_815680 ) ( ON ?auto_815678 ?auto_815679 ) ( CLEAR ?auto_815676 ) ( ON ?auto_815677 ?auto_815678 ) ( CLEAR ?auto_815677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_815668 ?auto_815669 ?auto_815670 ?auto_815671 ?auto_815672 ?auto_815673 ?auto_815674 ?auto_815675 ?auto_815676 ?auto_815677 )
      ( MAKE-16PILE ?auto_815668 ?auto_815669 ?auto_815670 ?auto_815671 ?auto_815672 ?auto_815673 ?auto_815674 ?auto_815675 ?auto_815676 ?auto_815677 ?auto_815678 ?auto_815679 ?auto_815680 ?auto_815681 ?auto_815682 ?auto_815683 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815734 - BLOCK
      ?auto_815735 - BLOCK
      ?auto_815736 - BLOCK
      ?auto_815737 - BLOCK
      ?auto_815738 - BLOCK
      ?auto_815739 - BLOCK
      ?auto_815740 - BLOCK
      ?auto_815741 - BLOCK
      ?auto_815742 - BLOCK
      ?auto_815743 - BLOCK
      ?auto_815744 - BLOCK
      ?auto_815745 - BLOCK
      ?auto_815746 - BLOCK
      ?auto_815747 - BLOCK
      ?auto_815748 - BLOCK
      ?auto_815749 - BLOCK
    )
    :vars
    (
      ?auto_815750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815749 ?auto_815750 ) ( ON-TABLE ?auto_815734 ) ( ON ?auto_815735 ?auto_815734 ) ( ON ?auto_815736 ?auto_815735 ) ( ON ?auto_815737 ?auto_815736 ) ( ON ?auto_815738 ?auto_815737 ) ( ON ?auto_815739 ?auto_815738 ) ( ON ?auto_815740 ?auto_815739 ) ( ON ?auto_815741 ?auto_815740 ) ( not ( = ?auto_815734 ?auto_815735 ) ) ( not ( = ?auto_815734 ?auto_815736 ) ) ( not ( = ?auto_815734 ?auto_815737 ) ) ( not ( = ?auto_815734 ?auto_815738 ) ) ( not ( = ?auto_815734 ?auto_815739 ) ) ( not ( = ?auto_815734 ?auto_815740 ) ) ( not ( = ?auto_815734 ?auto_815741 ) ) ( not ( = ?auto_815734 ?auto_815742 ) ) ( not ( = ?auto_815734 ?auto_815743 ) ) ( not ( = ?auto_815734 ?auto_815744 ) ) ( not ( = ?auto_815734 ?auto_815745 ) ) ( not ( = ?auto_815734 ?auto_815746 ) ) ( not ( = ?auto_815734 ?auto_815747 ) ) ( not ( = ?auto_815734 ?auto_815748 ) ) ( not ( = ?auto_815734 ?auto_815749 ) ) ( not ( = ?auto_815734 ?auto_815750 ) ) ( not ( = ?auto_815735 ?auto_815736 ) ) ( not ( = ?auto_815735 ?auto_815737 ) ) ( not ( = ?auto_815735 ?auto_815738 ) ) ( not ( = ?auto_815735 ?auto_815739 ) ) ( not ( = ?auto_815735 ?auto_815740 ) ) ( not ( = ?auto_815735 ?auto_815741 ) ) ( not ( = ?auto_815735 ?auto_815742 ) ) ( not ( = ?auto_815735 ?auto_815743 ) ) ( not ( = ?auto_815735 ?auto_815744 ) ) ( not ( = ?auto_815735 ?auto_815745 ) ) ( not ( = ?auto_815735 ?auto_815746 ) ) ( not ( = ?auto_815735 ?auto_815747 ) ) ( not ( = ?auto_815735 ?auto_815748 ) ) ( not ( = ?auto_815735 ?auto_815749 ) ) ( not ( = ?auto_815735 ?auto_815750 ) ) ( not ( = ?auto_815736 ?auto_815737 ) ) ( not ( = ?auto_815736 ?auto_815738 ) ) ( not ( = ?auto_815736 ?auto_815739 ) ) ( not ( = ?auto_815736 ?auto_815740 ) ) ( not ( = ?auto_815736 ?auto_815741 ) ) ( not ( = ?auto_815736 ?auto_815742 ) ) ( not ( = ?auto_815736 ?auto_815743 ) ) ( not ( = ?auto_815736 ?auto_815744 ) ) ( not ( = ?auto_815736 ?auto_815745 ) ) ( not ( = ?auto_815736 ?auto_815746 ) ) ( not ( = ?auto_815736 ?auto_815747 ) ) ( not ( = ?auto_815736 ?auto_815748 ) ) ( not ( = ?auto_815736 ?auto_815749 ) ) ( not ( = ?auto_815736 ?auto_815750 ) ) ( not ( = ?auto_815737 ?auto_815738 ) ) ( not ( = ?auto_815737 ?auto_815739 ) ) ( not ( = ?auto_815737 ?auto_815740 ) ) ( not ( = ?auto_815737 ?auto_815741 ) ) ( not ( = ?auto_815737 ?auto_815742 ) ) ( not ( = ?auto_815737 ?auto_815743 ) ) ( not ( = ?auto_815737 ?auto_815744 ) ) ( not ( = ?auto_815737 ?auto_815745 ) ) ( not ( = ?auto_815737 ?auto_815746 ) ) ( not ( = ?auto_815737 ?auto_815747 ) ) ( not ( = ?auto_815737 ?auto_815748 ) ) ( not ( = ?auto_815737 ?auto_815749 ) ) ( not ( = ?auto_815737 ?auto_815750 ) ) ( not ( = ?auto_815738 ?auto_815739 ) ) ( not ( = ?auto_815738 ?auto_815740 ) ) ( not ( = ?auto_815738 ?auto_815741 ) ) ( not ( = ?auto_815738 ?auto_815742 ) ) ( not ( = ?auto_815738 ?auto_815743 ) ) ( not ( = ?auto_815738 ?auto_815744 ) ) ( not ( = ?auto_815738 ?auto_815745 ) ) ( not ( = ?auto_815738 ?auto_815746 ) ) ( not ( = ?auto_815738 ?auto_815747 ) ) ( not ( = ?auto_815738 ?auto_815748 ) ) ( not ( = ?auto_815738 ?auto_815749 ) ) ( not ( = ?auto_815738 ?auto_815750 ) ) ( not ( = ?auto_815739 ?auto_815740 ) ) ( not ( = ?auto_815739 ?auto_815741 ) ) ( not ( = ?auto_815739 ?auto_815742 ) ) ( not ( = ?auto_815739 ?auto_815743 ) ) ( not ( = ?auto_815739 ?auto_815744 ) ) ( not ( = ?auto_815739 ?auto_815745 ) ) ( not ( = ?auto_815739 ?auto_815746 ) ) ( not ( = ?auto_815739 ?auto_815747 ) ) ( not ( = ?auto_815739 ?auto_815748 ) ) ( not ( = ?auto_815739 ?auto_815749 ) ) ( not ( = ?auto_815739 ?auto_815750 ) ) ( not ( = ?auto_815740 ?auto_815741 ) ) ( not ( = ?auto_815740 ?auto_815742 ) ) ( not ( = ?auto_815740 ?auto_815743 ) ) ( not ( = ?auto_815740 ?auto_815744 ) ) ( not ( = ?auto_815740 ?auto_815745 ) ) ( not ( = ?auto_815740 ?auto_815746 ) ) ( not ( = ?auto_815740 ?auto_815747 ) ) ( not ( = ?auto_815740 ?auto_815748 ) ) ( not ( = ?auto_815740 ?auto_815749 ) ) ( not ( = ?auto_815740 ?auto_815750 ) ) ( not ( = ?auto_815741 ?auto_815742 ) ) ( not ( = ?auto_815741 ?auto_815743 ) ) ( not ( = ?auto_815741 ?auto_815744 ) ) ( not ( = ?auto_815741 ?auto_815745 ) ) ( not ( = ?auto_815741 ?auto_815746 ) ) ( not ( = ?auto_815741 ?auto_815747 ) ) ( not ( = ?auto_815741 ?auto_815748 ) ) ( not ( = ?auto_815741 ?auto_815749 ) ) ( not ( = ?auto_815741 ?auto_815750 ) ) ( not ( = ?auto_815742 ?auto_815743 ) ) ( not ( = ?auto_815742 ?auto_815744 ) ) ( not ( = ?auto_815742 ?auto_815745 ) ) ( not ( = ?auto_815742 ?auto_815746 ) ) ( not ( = ?auto_815742 ?auto_815747 ) ) ( not ( = ?auto_815742 ?auto_815748 ) ) ( not ( = ?auto_815742 ?auto_815749 ) ) ( not ( = ?auto_815742 ?auto_815750 ) ) ( not ( = ?auto_815743 ?auto_815744 ) ) ( not ( = ?auto_815743 ?auto_815745 ) ) ( not ( = ?auto_815743 ?auto_815746 ) ) ( not ( = ?auto_815743 ?auto_815747 ) ) ( not ( = ?auto_815743 ?auto_815748 ) ) ( not ( = ?auto_815743 ?auto_815749 ) ) ( not ( = ?auto_815743 ?auto_815750 ) ) ( not ( = ?auto_815744 ?auto_815745 ) ) ( not ( = ?auto_815744 ?auto_815746 ) ) ( not ( = ?auto_815744 ?auto_815747 ) ) ( not ( = ?auto_815744 ?auto_815748 ) ) ( not ( = ?auto_815744 ?auto_815749 ) ) ( not ( = ?auto_815744 ?auto_815750 ) ) ( not ( = ?auto_815745 ?auto_815746 ) ) ( not ( = ?auto_815745 ?auto_815747 ) ) ( not ( = ?auto_815745 ?auto_815748 ) ) ( not ( = ?auto_815745 ?auto_815749 ) ) ( not ( = ?auto_815745 ?auto_815750 ) ) ( not ( = ?auto_815746 ?auto_815747 ) ) ( not ( = ?auto_815746 ?auto_815748 ) ) ( not ( = ?auto_815746 ?auto_815749 ) ) ( not ( = ?auto_815746 ?auto_815750 ) ) ( not ( = ?auto_815747 ?auto_815748 ) ) ( not ( = ?auto_815747 ?auto_815749 ) ) ( not ( = ?auto_815747 ?auto_815750 ) ) ( not ( = ?auto_815748 ?auto_815749 ) ) ( not ( = ?auto_815748 ?auto_815750 ) ) ( not ( = ?auto_815749 ?auto_815750 ) ) ( ON ?auto_815748 ?auto_815749 ) ( ON ?auto_815747 ?auto_815748 ) ( ON ?auto_815746 ?auto_815747 ) ( ON ?auto_815745 ?auto_815746 ) ( ON ?auto_815744 ?auto_815745 ) ( ON ?auto_815743 ?auto_815744 ) ( CLEAR ?auto_815741 ) ( ON ?auto_815742 ?auto_815743 ) ( CLEAR ?auto_815742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_815734 ?auto_815735 ?auto_815736 ?auto_815737 ?auto_815738 ?auto_815739 ?auto_815740 ?auto_815741 ?auto_815742 )
      ( MAKE-16PILE ?auto_815734 ?auto_815735 ?auto_815736 ?auto_815737 ?auto_815738 ?auto_815739 ?auto_815740 ?auto_815741 ?auto_815742 ?auto_815743 ?auto_815744 ?auto_815745 ?auto_815746 ?auto_815747 ?auto_815748 ?auto_815749 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815800 - BLOCK
      ?auto_815801 - BLOCK
      ?auto_815802 - BLOCK
      ?auto_815803 - BLOCK
      ?auto_815804 - BLOCK
      ?auto_815805 - BLOCK
      ?auto_815806 - BLOCK
      ?auto_815807 - BLOCK
      ?auto_815808 - BLOCK
      ?auto_815809 - BLOCK
      ?auto_815810 - BLOCK
      ?auto_815811 - BLOCK
      ?auto_815812 - BLOCK
      ?auto_815813 - BLOCK
      ?auto_815814 - BLOCK
      ?auto_815815 - BLOCK
    )
    :vars
    (
      ?auto_815816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815815 ?auto_815816 ) ( ON-TABLE ?auto_815800 ) ( ON ?auto_815801 ?auto_815800 ) ( ON ?auto_815802 ?auto_815801 ) ( ON ?auto_815803 ?auto_815802 ) ( ON ?auto_815804 ?auto_815803 ) ( ON ?auto_815805 ?auto_815804 ) ( ON ?auto_815806 ?auto_815805 ) ( not ( = ?auto_815800 ?auto_815801 ) ) ( not ( = ?auto_815800 ?auto_815802 ) ) ( not ( = ?auto_815800 ?auto_815803 ) ) ( not ( = ?auto_815800 ?auto_815804 ) ) ( not ( = ?auto_815800 ?auto_815805 ) ) ( not ( = ?auto_815800 ?auto_815806 ) ) ( not ( = ?auto_815800 ?auto_815807 ) ) ( not ( = ?auto_815800 ?auto_815808 ) ) ( not ( = ?auto_815800 ?auto_815809 ) ) ( not ( = ?auto_815800 ?auto_815810 ) ) ( not ( = ?auto_815800 ?auto_815811 ) ) ( not ( = ?auto_815800 ?auto_815812 ) ) ( not ( = ?auto_815800 ?auto_815813 ) ) ( not ( = ?auto_815800 ?auto_815814 ) ) ( not ( = ?auto_815800 ?auto_815815 ) ) ( not ( = ?auto_815800 ?auto_815816 ) ) ( not ( = ?auto_815801 ?auto_815802 ) ) ( not ( = ?auto_815801 ?auto_815803 ) ) ( not ( = ?auto_815801 ?auto_815804 ) ) ( not ( = ?auto_815801 ?auto_815805 ) ) ( not ( = ?auto_815801 ?auto_815806 ) ) ( not ( = ?auto_815801 ?auto_815807 ) ) ( not ( = ?auto_815801 ?auto_815808 ) ) ( not ( = ?auto_815801 ?auto_815809 ) ) ( not ( = ?auto_815801 ?auto_815810 ) ) ( not ( = ?auto_815801 ?auto_815811 ) ) ( not ( = ?auto_815801 ?auto_815812 ) ) ( not ( = ?auto_815801 ?auto_815813 ) ) ( not ( = ?auto_815801 ?auto_815814 ) ) ( not ( = ?auto_815801 ?auto_815815 ) ) ( not ( = ?auto_815801 ?auto_815816 ) ) ( not ( = ?auto_815802 ?auto_815803 ) ) ( not ( = ?auto_815802 ?auto_815804 ) ) ( not ( = ?auto_815802 ?auto_815805 ) ) ( not ( = ?auto_815802 ?auto_815806 ) ) ( not ( = ?auto_815802 ?auto_815807 ) ) ( not ( = ?auto_815802 ?auto_815808 ) ) ( not ( = ?auto_815802 ?auto_815809 ) ) ( not ( = ?auto_815802 ?auto_815810 ) ) ( not ( = ?auto_815802 ?auto_815811 ) ) ( not ( = ?auto_815802 ?auto_815812 ) ) ( not ( = ?auto_815802 ?auto_815813 ) ) ( not ( = ?auto_815802 ?auto_815814 ) ) ( not ( = ?auto_815802 ?auto_815815 ) ) ( not ( = ?auto_815802 ?auto_815816 ) ) ( not ( = ?auto_815803 ?auto_815804 ) ) ( not ( = ?auto_815803 ?auto_815805 ) ) ( not ( = ?auto_815803 ?auto_815806 ) ) ( not ( = ?auto_815803 ?auto_815807 ) ) ( not ( = ?auto_815803 ?auto_815808 ) ) ( not ( = ?auto_815803 ?auto_815809 ) ) ( not ( = ?auto_815803 ?auto_815810 ) ) ( not ( = ?auto_815803 ?auto_815811 ) ) ( not ( = ?auto_815803 ?auto_815812 ) ) ( not ( = ?auto_815803 ?auto_815813 ) ) ( not ( = ?auto_815803 ?auto_815814 ) ) ( not ( = ?auto_815803 ?auto_815815 ) ) ( not ( = ?auto_815803 ?auto_815816 ) ) ( not ( = ?auto_815804 ?auto_815805 ) ) ( not ( = ?auto_815804 ?auto_815806 ) ) ( not ( = ?auto_815804 ?auto_815807 ) ) ( not ( = ?auto_815804 ?auto_815808 ) ) ( not ( = ?auto_815804 ?auto_815809 ) ) ( not ( = ?auto_815804 ?auto_815810 ) ) ( not ( = ?auto_815804 ?auto_815811 ) ) ( not ( = ?auto_815804 ?auto_815812 ) ) ( not ( = ?auto_815804 ?auto_815813 ) ) ( not ( = ?auto_815804 ?auto_815814 ) ) ( not ( = ?auto_815804 ?auto_815815 ) ) ( not ( = ?auto_815804 ?auto_815816 ) ) ( not ( = ?auto_815805 ?auto_815806 ) ) ( not ( = ?auto_815805 ?auto_815807 ) ) ( not ( = ?auto_815805 ?auto_815808 ) ) ( not ( = ?auto_815805 ?auto_815809 ) ) ( not ( = ?auto_815805 ?auto_815810 ) ) ( not ( = ?auto_815805 ?auto_815811 ) ) ( not ( = ?auto_815805 ?auto_815812 ) ) ( not ( = ?auto_815805 ?auto_815813 ) ) ( not ( = ?auto_815805 ?auto_815814 ) ) ( not ( = ?auto_815805 ?auto_815815 ) ) ( not ( = ?auto_815805 ?auto_815816 ) ) ( not ( = ?auto_815806 ?auto_815807 ) ) ( not ( = ?auto_815806 ?auto_815808 ) ) ( not ( = ?auto_815806 ?auto_815809 ) ) ( not ( = ?auto_815806 ?auto_815810 ) ) ( not ( = ?auto_815806 ?auto_815811 ) ) ( not ( = ?auto_815806 ?auto_815812 ) ) ( not ( = ?auto_815806 ?auto_815813 ) ) ( not ( = ?auto_815806 ?auto_815814 ) ) ( not ( = ?auto_815806 ?auto_815815 ) ) ( not ( = ?auto_815806 ?auto_815816 ) ) ( not ( = ?auto_815807 ?auto_815808 ) ) ( not ( = ?auto_815807 ?auto_815809 ) ) ( not ( = ?auto_815807 ?auto_815810 ) ) ( not ( = ?auto_815807 ?auto_815811 ) ) ( not ( = ?auto_815807 ?auto_815812 ) ) ( not ( = ?auto_815807 ?auto_815813 ) ) ( not ( = ?auto_815807 ?auto_815814 ) ) ( not ( = ?auto_815807 ?auto_815815 ) ) ( not ( = ?auto_815807 ?auto_815816 ) ) ( not ( = ?auto_815808 ?auto_815809 ) ) ( not ( = ?auto_815808 ?auto_815810 ) ) ( not ( = ?auto_815808 ?auto_815811 ) ) ( not ( = ?auto_815808 ?auto_815812 ) ) ( not ( = ?auto_815808 ?auto_815813 ) ) ( not ( = ?auto_815808 ?auto_815814 ) ) ( not ( = ?auto_815808 ?auto_815815 ) ) ( not ( = ?auto_815808 ?auto_815816 ) ) ( not ( = ?auto_815809 ?auto_815810 ) ) ( not ( = ?auto_815809 ?auto_815811 ) ) ( not ( = ?auto_815809 ?auto_815812 ) ) ( not ( = ?auto_815809 ?auto_815813 ) ) ( not ( = ?auto_815809 ?auto_815814 ) ) ( not ( = ?auto_815809 ?auto_815815 ) ) ( not ( = ?auto_815809 ?auto_815816 ) ) ( not ( = ?auto_815810 ?auto_815811 ) ) ( not ( = ?auto_815810 ?auto_815812 ) ) ( not ( = ?auto_815810 ?auto_815813 ) ) ( not ( = ?auto_815810 ?auto_815814 ) ) ( not ( = ?auto_815810 ?auto_815815 ) ) ( not ( = ?auto_815810 ?auto_815816 ) ) ( not ( = ?auto_815811 ?auto_815812 ) ) ( not ( = ?auto_815811 ?auto_815813 ) ) ( not ( = ?auto_815811 ?auto_815814 ) ) ( not ( = ?auto_815811 ?auto_815815 ) ) ( not ( = ?auto_815811 ?auto_815816 ) ) ( not ( = ?auto_815812 ?auto_815813 ) ) ( not ( = ?auto_815812 ?auto_815814 ) ) ( not ( = ?auto_815812 ?auto_815815 ) ) ( not ( = ?auto_815812 ?auto_815816 ) ) ( not ( = ?auto_815813 ?auto_815814 ) ) ( not ( = ?auto_815813 ?auto_815815 ) ) ( not ( = ?auto_815813 ?auto_815816 ) ) ( not ( = ?auto_815814 ?auto_815815 ) ) ( not ( = ?auto_815814 ?auto_815816 ) ) ( not ( = ?auto_815815 ?auto_815816 ) ) ( ON ?auto_815814 ?auto_815815 ) ( ON ?auto_815813 ?auto_815814 ) ( ON ?auto_815812 ?auto_815813 ) ( ON ?auto_815811 ?auto_815812 ) ( ON ?auto_815810 ?auto_815811 ) ( ON ?auto_815809 ?auto_815810 ) ( ON ?auto_815808 ?auto_815809 ) ( CLEAR ?auto_815806 ) ( ON ?auto_815807 ?auto_815808 ) ( CLEAR ?auto_815807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_815800 ?auto_815801 ?auto_815802 ?auto_815803 ?auto_815804 ?auto_815805 ?auto_815806 ?auto_815807 )
      ( MAKE-16PILE ?auto_815800 ?auto_815801 ?auto_815802 ?auto_815803 ?auto_815804 ?auto_815805 ?auto_815806 ?auto_815807 ?auto_815808 ?auto_815809 ?auto_815810 ?auto_815811 ?auto_815812 ?auto_815813 ?auto_815814 ?auto_815815 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815866 - BLOCK
      ?auto_815867 - BLOCK
      ?auto_815868 - BLOCK
      ?auto_815869 - BLOCK
      ?auto_815870 - BLOCK
      ?auto_815871 - BLOCK
      ?auto_815872 - BLOCK
      ?auto_815873 - BLOCK
      ?auto_815874 - BLOCK
      ?auto_815875 - BLOCK
      ?auto_815876 - BLOCK
      ?auto_815877 - BLOCK
      ?auto_815878 - BLOCK
      ?auto_815879 - BLOCK
      ?auto_815880 - BLOCK
      ?auto_815881 - BLOCK
    )
    :vars
    (
      ?auto_815882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815881 ?auto_815882 ) ( ON-TABLE ?auto_815866 ) ( ON ?auto_815867 ?auto_815866 ) ( ON ?auto_815868 ?auto_815867 ) ( ON ?auto_815869 ?auto_815868 ) ( ON ?auto_815870 ?auto_815869 ) ( ON ?auto_815871 ?auto_815870 ) ( not ( = ?auto_815866 ?auto_815867 ) ) ( not ( = ?auto_815866 ?auto_815868 ) ) ( not ( = ?auto_815866 ?auto_815869 ) ) ( not ( = ?auto_815866 ?auto_815870 ) ) ( not ( = ?auto_815866 ?auto_815871 ) ) ( not ( = ?auto_815866 ?auto_815872 ) ) ( not ( = ?auto_815866 ?auto_815873 ) ) ( not ( = ?auto_815866 ?auto_815874 ) ) ( not ( = ?auto_815866 ?auto_815875 ) ) ( not ( = ?auto_815866 ?auto_815876 ) ) ( not ( = ?auto_815866 ?auto_815877 ) ) ( not ( = ?auto_815866 ?auto_815878 ) ) ( not ( = ?auto_815866 ?auto_815879 ) ) ( not ( = ?auto_815866 ?auto_815880 ) ) ( not ( = ?auto_815866 ?auto_815881 ) ) ( not ( = ?auto_815866 ?auto_815882 ) ) ( not ( = ?auto_815867 ?auto_815868 ) ) ( not ( = ?auto_815867 ?auto_815869 ) ) ( not ( = ?auto_815867 ?auto_815870 ) ) ( not ( = ?auto_815867 ?auto_815871 ) ) ( not ( = ?auto_815867 ?auto_815872 ) ) ( not ( = ?auto_815867 ?auto_815873 ) ) ( not ( = ?auto_815867 ?auto_815874 ) ) ( not ( = ?auto_815867 ?auto_815875 ) ) ( not ( = ?auto_815867 ?auto_815876 ) ) ( not ( = ?auto_815867 ?auto_815877 ) ) ( not ( = ?auto_815867 ?auto_815878 ) ) ( not ( = ?auto_815867 ?auto_815879 ) ) ( not ( = ?auto_815867 ?auto_815880 ) ) ( not ( = ?auto_815867 ?auto_815881 ) ) ( not ( = ?auto_815867 ?auto_815882 ) ) ( not ( = ?auto_815868 ?auto_815869 ) ) ( not ( = ?auto_815868 ?auto_815870 ) ) ( not ( = ?auto_815868 ?auto_815871 ) ) ( not ( = ?auto_815868 ?auto_815872 ) ) ( not ( = ?auto_815868 ?auto_815873 ) ) ( not ( = ?auto_815868 ?auto_815874 ) ) ( not ( = ?auto_815868 ?auto_815875 ) ) ( not ( = ?auto_815868 ?auto_815876 ) ) ( not ( = ?auto_815868 ?auto_815877 ) ) ( not ( = ?auto_815868 ?auto_815878 ) ) ( not ( = ?auto_815868 ?auto_815879 ) ) ( not ( = ?auto_815868 ?auto_815880 ) ) ( not ( = ?auto_815868 ?auto_815881 ) ) ( not ( = ?auto_815868 ?auto_815882 ) ) ( not ( = ?auto_815869 ?auto_815870 ) ) ( not ( = ?auto_815869 ?auto_815871 ) ) ( not ( = ?auto_815869 ?auto_815872 ) ) ( not ( = ?auto_815869 ?auto_815873 ) ) ( not ( = ?auto_815869 ?auto_815874 ) ) ( not ( = ?auto_815869 ?auto_815875 ) ) ( not ( = ?auto_815869 ?auto_815876 ) ) ( not ( = ?auto_815869 ?auto_815877 ) ) ( not ( = ?auto_815869 ?auto_815878 ) ) ( not ( = ?auto_815869 ?auto_815879 ) ) ( not ( = ?auto_815869 ?auto_815880 ) ) ( not ( = ?auto_815869 ?auto_815881 ) ) ( not ( = ?auto_815869 ?auto_815882 ) ) ( not ( = ?auto_815870 ?auto_815871 ) ) ( not ( = ?auto_815870 ?auto_815872 ) ) ( not ( = ?auto_815870 ?auto_815873 ) ) ( not ( = ?auto_815870 ?auto_815874 ) ) ( not ( = ?auto_815870 ?auto_815875 ) ) ( not ( = ?auto_815870 ?auto_815876 ) ) ( not ( = ?auto_815870 ?auto_815877 ) ) ( not ( = ?auto_815870 ?auto_815878 ) ) ( not ( = ?auto_815870 ?auto_815879 ) ) ( not ( = ?auto_815870 ?auto_815880 ) ) ( not ( = ?auto_815870 ?auto_815881 ) ) ( not ( = ?auto_815870 ?auto_815882 ) ) ( not ( = ?auto_815871 ?auto_815872 ) ) ( not ( = ?auto_815871 ?auto_815873 ) ) ( not ( = ?auto_815871 ?auto_815874 ) ) ( not ( = ?auto_815871 ?auto_815875 ) ) ( not ( = ?auto_815871 ?auto_815876 ) ) ( not ( = ?auto_815871 ?auto_815877 ) ) ( not ( = ?auto_815871 ?auto_815878 ) ) ( not ( = ?auto_815871 ?auto_815879 ) ) ( not ( = ?auto_815871 ?auto_815880 ) ) ( not ( = ?auto_815871 ?auto_815881 ) ) ( not ( = ?auto_815871 ?auto_815882 ) ) ( not ( = ?auto_815872 ?auto_815873 ) ) ( not ( = ?auto_815872 ?auto_815874 ) ) ( not ( = ?auto_815872 ?auto_815875 ) ) ( not ( = ?auto_815872 ?auto_815876 ) ) ( not ( = ?auto_815872 ?auto_815877 ) ) ( not ( = ?auto_815872 ?auto_815878 ) ) ( not ( = ?auto_815872 ?auto_815879 ) ) ( not ( = ?auto_815872 ?auto_815880 ) ) ( not ( = ?auto_815872 ?auto_815881 ) ) ( not ( = ?auto_815872 ?auto_815882 ) ) ( not ( = ?auto_815873 ?auto_815874 ) ) ( not ( = ?auto_815873 ?auto_815875 ) ) ( not ( = ?auto_815873 ?auto_815876 ) ) ( not ( = ?auto_815873 ?auto_815877 ) ) ( not ( = ?auto_815873 ?auto_815878 ) ) ( not ( = ?auto_815873 ?auto_815879 ) ) ( not ( = ?auto_815873 ?auto_815880 ) ) ( not ( = ?auto_815873 ?auto_815881 ) ) ( not ( = ?auto_815873 ?auto_815882 ) ) ( not ( = ?auto_815874 ?auto_815875 ) ) ( not ( = ?auto_815874 ?auto_815876 ) ) ( not ( = ?auto_815874 ?auto_815877 ) ) ( not ( = ?auto_815874 ?auto_815878 ) ) ( not ( = ?auto_815874 ?auto_815879 ) ) ( not ( = ?auto_815874 ?auto_815880 ) ) ( not ( = ?auto_815874 ?auto_815881 ) ) ( not ( = ?auto_815874 ?auto_815882 ) ) ( not ( = ?auto_815875 ?auto_815876 ) ) ( not ( = ?auto_815875 ?auto_815877 ) ) ( not ( = ?auto_815875 ?auto_815878 ) ) ( not ( = ?auto_815875 ?auto_815879 ) ) ( not ( = ?auto_815875 ?auto_815880 ) ) ( not ( = ?auto_815875 ?auto_815881 ) ) ( not ( = ?auto_815875 ?auto_815882 ) ) ( not ( = ?auto_815876 ?auto_815877 ) ) ( not ( = ?auto_815876 ?auto_815878 ) ) ( not ( = ?auto_815876 ?auto_815879 ) ) ( not ( = ?auto_815876 ?auto_815880 ) ) ( not ( = ?auto_815876 ?auto_815881 ) ) ( not ( = ?auto_815876 ?auto_815882 ) ) ( not ( = ?auto_815877 ?auto_815878 ) ) ( not ( = ?auto_815877 ?auto_815879 ) ) ( not ( = ?auto_815877 ?auto_815880 ) ) ( not ( = ?auto_815877 ?auto_815881 ) ) ( not ( = ?auto_815877 ?auto_815882 ) ) ( not ( = ?auto_815878 ?auto_815879 ) ) ( not ( = ?auto_815878 ?auto_815880 ) ) ( not ( = ?auto_815878 ?auto_815881 ) ) ( not ( = ?auto_815878 ?auto_815882 ) ) ( not ( = ?auto_815879 ?auto_815880 ) ) ( not ( = ?auto_815879 ?auto_815881 ) ) ( not ( = ?auto_815879 ?auto_815882 ) ) ( not ( = ?auto_815880 ?auto_815881 ) ) ( not ( = ?auto_815880 ?auto_815882 ) ) ( not ( = ?auto_815881 ?auto_815882 ) ) ( ON ?auto_815880 ?auto_815881 ) ( ON ?auto_815879 ?auto_815880 ) ( ON ?auto_815878 ?auto_815879 ) ( ON ?auto_815877 ?auto_815878 ) ( ON ?auto_815876 ?auto_815877 ) ( ON ?auto_815875 ?auto_815876 ) ( ON ?auto_815874 ?auto_815875 ) ( ON ?auto_815873 ?auto_815874 ) ( CLEAR ?auto_815871 ) ( ON ?auto_815872 ?auto_815873 ) ( CLEAR ?auto_815872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_815866 ?auto_815867 ?auto_815868 ?auto_815869 ?auto_815870 ?auto_815871 ?auto_815872 )
      ( MAKE-16PILE ?auto_815866 ?auto_815867 ?auto_815868 ?auto_815869 ?auto_815870 ?auto_815871 ?auto_815872 ?auto_815873 ?auto_815874 ?auto_815875 ?auto_815876 ?auto_815877 ?auto_815878 ?auto_815879 ?auto_815880 ?auto_815881 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815932 - BLOCK
      ?auto_815933 - BLOCK
      ?auto_815934 - BLOCK
      ?auto_815935 - BLOCK
      ?auto_815936 - BLOCK
      ?auto_815937 - BLOCK
      ?auto_815938 - BLOCK
      ?auto_815939 - BLOCK
      ?auto_815940 - BLOCK
      ?auto_815941 - BLOCK
      ?auto_815942 - BLOCK
      ?auto_815943 - BLOCK
      ?auto_815944 - BLOCK
      ?auto_815945 - BLOCK
      ?auto_815946 - BLOCK
      ?auto_815947 - BLOCK
    )
    :vars
    (
      ?auto_815948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815947 ?auto_815948 ) ( ON-TABLE ?auto_815932 ) ( ON ?auto_815933 ?auto_815932 ) ( ON ?auto_815934 ?auto_815933 ) ( ON ?auto_815935 ?auto_815934 ) ( ON ?auto_815936 ?auto_815935 ) ( not ( = ?auto_815932 ?auto_815933 ) ) ( not ( = ?auto_815932 ?auto_815934 ) ) ( not ( = ?auto_815932 ?auto_815935 ) ) ( not ( = ?auto_815932 ?auto_815936 ) ) ( not ( = ?auto_815932 ?auto_815937 ) ) ( not ( = ?auto_815932 ?auto_815938 ) ) ( not ( = ?auto_815932 ?auto_815939 ) ) ( not ( = ?auto_815932 ?auto_815940 ) ) ( not ( = ?auto_815932 ?auto_815941 ) ) ( not ( = ?auto_815932 ?auto_815942 ) ) ( not ( = ?auto_815932 ?auto_815943 ) ) ( not ( = ?auto_815932 ?auto_815944 ) ) ( not ( = ?auto_815932 ?auto_815945 ) ) ( not ( = ?auto_815932 ?auto_815946 ) ) ( not ( = ?auto_815932 ?auto_815947 ) ) ( not ( = ?auto_815932 ?auto_815948 ) ) ( not ( = ?auto_815933 ?auto_815934 ) ) ( not ( = ?auto_815933 ?auto_815935 ) ) ( not ( = ?auto_815933 ?auto_815936 ) ) ( not ( = ?auto_815933 ?auto_815937 ) ) ( not ( = ?auto_815933 ?auto_815938 ) ) ( not ( = ?auto_815933 ?auto_815939 ) ) ( not ( = ?auto_815933 ?auto_815940 ) ) ( not ( = ?auto_815933 ?auto_815941 ) ) ( not ( = ?auto_815933 ?auto_815942 ) ) ( not ( = ?auto_815933 ?auto_815943 ) ) ( not ( = ?auto_815933 ?auto_815944 ) ) ( not ( = ?auto_815933 ?auto_815945 ) ) ( not ( = ?auto_815933 ?auto_815946 ) ) ( not ( = ?auto_815933 ?auto_815947 ) ) ( not ( = ?auto_815933 ?auto_815948 ) ) ( not ( = ?auto_815934 ?auto_815935 ) ) ( not ( = ?auto_815934 ?auto_815936 ) ) ( not ( = ?auto_815934 ?auto_815937 ) ) ( not ( = ?auto_815934 ?auto_815938 ) ) ( not ( = ?auto_815934 ?auto_815939 ) ) ( not ( = ?auto_815934 ?auto_815940 ) ) ( not ( = ?auto_815934 ?auto_815941 ) ) ( not ( = ?auto_815934 ?auto_815942 ) ) ( not ( = ?auto_815934 ?auto_815943 ) ) ( not ( = ?auto_815934 ?auto_815944 ) ) ( not ( = ?auto_815934 ?auto_815945 ) ) ( not ( = ?auto_815934 ?auto_815946 ) ) ( not ( = ?auto_815934 ?auto_815947 ) ) ( not ( = ?auto_815934 ?auto_815948 ) ) ( not ( = ?auto_815935 ?auto_815936 ) ) ( not ( = ?auto_815935 ?auto_815937 ) ) ( not ( = ?auto_815935 ?auto_815938 ) ) ( not ( = ?auto_815935 ?auto_815939 ) ) ( not ( = ?auto_815935 ?auto_815940 ) ) ( not ( = ?auto_815935 ?auto_815941 ) ) ( not ( = ?auto_815935 ?auto_815942 ) ) ( not ( = ?auto_815935 ?auto_815943 ) ) ( not ( = ?auto_815935 ?auto_815944 ) ) ( not ( = ?auto_815935 ?auto_815945 ) ) ( not ( = ?auto_815935 ?auto_815946 ) ) ( not ( = ?auto_815935 ?auto_815947 ) ) ( not ( = ?auto_815935 ?auto_815948 ) ) ( not ( = ?auto_815936 ?auto_815937 ) ) ( not ( = ?auto_815936 ?auto_815938 ) ) ( not ( = ?auto_815936 ?auto_815939 ) ) ( not ( = ?auto_815936 ?auto_815940 ) ) ( not ( = ?auto_815936 ?auto_815941 ) ) ( not ( = ?auto_815936 ?auto_815942 ) ) ( not ( = ?auto_815936 ?auto_815943 ) ) ( not ( = ?auto_815936 ?auto_815944 ) ) ( not ( = ?auto_815936 ?auto_815945 ) ) ( not ( = ?auto_815936 ?auto_815946 ) ) ( not ( = ?auto_815936 ?auto_815947 ) ) ( not ( = ?auto_815936 ?auto_815948 ) ) ( not ( = ?auto_815937 ?auto_815938 ) ) ( not ( = ?auto_815937 ?auto_815939 ) ) ( not ( = ?auto_815937 ?auto_815940 ) ) ( not ( = ?auto_815937 ?auto_815941 ) ) ( not ( = ?auto_815937 ?auto_815942 ) ) ( not ( = ?auto_815937 ?auto_815943 ) ) ( not ( = ?auto_815937 ?auto_815944 ) ) ( not ( = ?auto_815937 ?auto_815945 ) ) ( not ( = ?auto_815937 ?auto_815946 ) ) ( not ( = ?auto_815937 ?auto_815947 ) ) ( not ( = ?auto_815937 ?auto_815948 ) ) ( not ( = ?auto_815938 ?auto_815939 ) ) ( not ( = ?auto_815938 ?auto_815940 ) ) ( not ( = ?auto_815938 ?auto_815941 ) ) ( not ( = ?auto_815938 ?auto_815942 ) ) ( not ( = ?auto_815938 ?auto_815943 ) ) ( not ( = ?auto_815938 ?auto_815944 ) ) ( not ( = ?auto_815938 ?auto_815945 ) ) ( not ( = ?auto_815938 ?auto_815946 ) ) ( not ( = ?auto_815938 ?auto_815947 ) ) ( not ( = ?auto_815938 ?auto_815948 ) ) ( not ( = ?auto_815939 ?auto_815940 ) ) ( not ( = ?auto_815939 ?auto_815941 ) ) ( not ( = ?auto_815939 ?auto_815942 ) ) ( not ( = ?auto_815939 ?auto_815943 ) ) ( not ( = ?auto_815939 ?auto_815944 ) ) ( not ( = ?auto_815939 ?auto_815945 ) ) ( not ( = ?auto_815939 ?auto_815946 ) ) ( not ( = ?auto_815939 ?auto_815947 ) ) ( not ( = ?auto_815939 ?auto_815948 ) ) ( not ( = ?auto_815940 ?auto_815941 ) ) ( not ( = ?auto_815940 ?auto_815942 ) ) ( not ( = ?auto_815940 ?auto_815943 ) ) ( not ( = ?auto_815940 ?auto_815944 ) ) ( not ( = ?auto_815940 ?auto_815945 ) ) ( not ( = ?auto_815940 ?auto_815946 ) ) ( not ( = ?auto_815940 ?auto_815947 ) ) ( not ( = ?auto_815940 ?auto_815948 ) ) ( not ( = ?auto_815941 ?auto_815942 ) ) ( not ( = ?auto_815941 ?auto_815943 ) ) ( not ( = ?auto_815941 ?auto_815944 ) ) ( not ( = ?auto_815941 ?auto_815945 ) ) ( not ( = ?auto_815941 ?auto_815946 ) ) ( not ( = ?auto_815941 ?auto_815947 ) ) ( not ( = ?auto_815941 ?auto_815948 ) ) ( not ( = ?auto_815942 ?auto_815943 ) ) ( not ( = ?auto_815942 ?auto_815944 ) ) ( not ( = ?auto_815942 ?auto_815945 ) ) ( not ( = ?auto_815942 ?auto_815946 ) ) ( not ( = ?auto_815942 ?auto_815947 ) ) ( not ( = ?auto_815942 ?auto_815948 ) ) ( not ( = ?auto_815943 ?auto_815944 ) ) ( not ( = ?auto_815943 ?auto_815945 ) ) ( not ( = ?auto_815943 ?auto_815946 ) ) ( not ( = ?auto_815943 ?auto_815947 ) ) ( not ( = ?auto_815943 ?auto_815948 ) ) ( not ( = ?auto_815944 ?auto_815945 ) ) ( not ( = ?auto_815944 ?auto_815946 ) ) ( not ( = ?auto_815944 ?auto_815947 ) ) ( not ( = ?auto_815944 ?auto_815948 ) ) ( not ( = ?auto_815945 ?auto_815946 ) ) ( not ( = ?auto_815945 ?auto_815947 ) ) ( not ( = ?auto_815945 ?auto_815948 ) ) ( not ( = ?auto_815946 ?auto_815947 ) ) ( not ( = ?auto_815946 ?auto_815948 ) ) ( not ( = ?auto_815947 ?auto_815948 ) ) ( ON ?auto_815946 ?auto_815947 ) ( ON ?auto_815945 ?auto_815946 ) ( ON ?auto_815944 ?auto_815945 ) ( ON ?auto_815943 ?auto_815944 ) ( ON ?auto_815942 ?auto_815943 ) ( ON ?auto_815941 ?auto_815942 ) ( ON ?auto_815940 ?auto_815941 ) ( ON ?auto_815939 ?auto_815940 ) ( ON ?auto_815938 ?auto_815939 ) ( CLEAR ?auto_815936 ) ( ON ?auto_815937 ?auto_815938 ) ( CLEAR ?auto_815937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_815932 ?auto_815933 ?auto_815934 ?auto_815935 ?auto_815936 ?auto_815937 )
      ( MAKE-16PILE ?auto_815932 ?auto_815933 ?auto_815934 ?auto_815935 ?auto_815936 ?auto_815937 ?auto_815938 ?auto_815939 ?auto_815940 ?auto_815941 ?auto_815942 ?auto_815943 ?auto_815944 ?auto_815945 ?auto_815946 ?auto_815947 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_815998 - BLOCK
      ?auto_815999 - BLOCK
      ?auto_816000 - BLOCK
      ?auto_816001 - BLOCK
      ?auto_816002 - BLOCK
      ?auto_816003 - BLOCK
      ?auto_816004 - BLOCK
      ?auto_816005 - BLOCK
      ?auto_816006 - BLOCK
      ?auto_816007 - BLOCK
      ?auto_816008 - BLOCK
      ?auto_816009 - BLOCK
      ?auto_816010 - BLOCK
      ?auto_816011 - BLOCK
      ?auto_816012 - BLOCK
      ?auto_816013 - BLOCK
    )
    :vars
    (
      ?auto_816014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816013 ?auto_816014 ) ( ON-TABLE ?auto_815998 ) ( ON ?auto_815999 ?auto_815998 ) ( ON ?auto_816000 ?auto_815999 ) ( ON ?auto_816001 ?auto_816000 ) ( not ( = ?auto_815998 ?auto_815999 ) ) ( not ( = ?auto_815998 ?auto_816000 ) ) ( not ( = ?auto_815998 ?auto_816001 ) ) ( not ( = ?auto_815998 ?auto_816002 ) ) ( not ( = ?auto_815998 ?auto_816003 ) ) ( not ( = ?auto_815998 ?auto_816004 ) ) ( not ( = ?auto_815998 ?auto_816005 ) ) ( not ( = ?auto_815998 ?auto_816006 ) ) ( not ( = ?auto_815998 ?auto_816007 ) ) ( not ( = ?auto_815998 ?auto_816008 ) ) ( not ( = ?auto_815998 ?auto_816009 ) ) ( not ( = ?auto_815998 ?auto_816010 ) ) ( not ( = ?auto_815998 ?auto_816011 ) ) ( not ( = ?auto_815998 ?auto_816012 ) ) ( not ( = ?auto_815998 ?auto_816013 ) ) ( not ( = ?auto_815998 ?auto_816014 ) ) ( not ( = ?auto_815999 ?auto_816000 ) ) ( not ( = ?auto_815999 ?auto_816001 ) ) ( not ( = ?auto_815999 ?auto_816002 ) ) ( not ( = ?auto_815999 ?auto_816003 ) ) ( not ( = ?auto_815999 ?auto_816004 ) ) ( not ( = ?auto_815999 ?auto_816005 ) ) ( not ( = ?auto_815999 ?auto_816006 ) ) ( not ( = ?auto_815999 ?auto_816007 ) ) ( not ( = ?auto_815999 ?auto_816008 ) ) ( not ( = ?auto_815999 ?auto_816009 ) ) ( not ( = ?auto_815999 ?auto_816010 ) ) ( not ( = ?auto_815999 ?auto_816011 ) ) ( not ( = ?auto_815999 ?auto_816012 ) ) ( not ( = ?auto_815999 ?auto_816013 ) ) ( not ( = ?auto_815999 ?auto_816014 ) ) ( not ( = ?auto_816000 ?auto_816001 ) ) ( not ( = ?auto_816000 ?auto_816002 ) ) ( not ( = ?auto_816000 ?auto_816003 ) ) ( not ( = ?auto_816000 ?auto_816004 ) ) ( not ( = ?auto_816000 ?auto_816005 ) ) ( not ( = ?auto_816000 ?auto_816006 ) ) ( not ( = ?auto_816000 ?auto_816007 ) ) ( not ( = ?auto_816000 ?auto_816008 ) ) ( not ( = ?auto_816000 ?auto_816009 ) ) ( not ( = ?auto_816000 ?auto_816010 ) ) ( not ( = ?auto_816000 ?auto_816011 ) ) ( not ( = ?auto_816000 ?auto_816012 ) ) ( not ( = ?auto_816000 ?auto_816013 ) ) ( not ( = ?auto_816000 ?auto_816014 ) ) ( not ( = ?auto_816001 ?auto_816002 ) ) ( not ( = ?auto_816001 ?auto_816003 ) ) ( not ( = ?auto_816001 ?auto_816004 ) ) ( not ( = ?auto_816001 ?auto_816005 ) ) ( not ( = ?auto_816001 ?auto_816006 ) ) ( not ( = ?auto_816001 ?auto_816007 ) ) ( not ( = ?auto_816001 ?auto_816008 ) ) ( not ( = ?auto_816001 ?auto_816009 ) ) ( not ( = ?auto_816001 ?auto_816010 ) ) ( not ( = ?auto_816001 ?auto_816011 ) ) ( not ( = ?auto_816001 ?auto_816012 ) ) ( not ( = ?auto_816001 ?auto_816013 ) ) ( not ( = ?auto_816001 ?auto_816014 ) ) ( not ( = ?auto_816002 ?auto_816003 ) ) ( not ( = ?auto_816002 ?auto_816004 ) ) ( not ( = ?auto_816002 ?auto_816005 ) ) ( not ( = ?auto_816002 ?auto_816006 ) ) ( not ( = ?auto_816002 ?auto_816007 ) ) ( not ( = ?auto_816002 ?auto_816008 ) ) ( not ( = ?auto_816002 ?auto_816009 ) ) ( not ( = ?auto_816002 ?auto_816010 ) ) ( not ( = ?auto_816002 ?auto_816011 ) ) ( not ( = ?auto_816002 ?auto_816012 ) ) ( not ( = ?auto_816002 ?auto_816013 ) ) ( not ( = ?auto_816002 ?auto_816014 ) ) ( not ( = ?auto_816003 ?auto_816004 ) ) ( not ( = ?auto_816003 ?auto_816005 ) ) ( not ( = ?auto_816003 ?auto_816006 ) ) ( not ( = ?auto_816003 ?auto_816007 ) ) ( not ( = ?auto_816003 ?auto_816008 ) ) ( not ( = ?auto_816003 ?auto_816009 ) ) ( not ( = ?auto_816003 ?auto_816010 ) ) ( not ( = ?auto_816003 ?auto_816011 ) ) ( not ( = ?auto_816003 ?auto_816012 ) ) ( not ( = ?auto_816003 ?auto_816013 ) ) ( not ( = ?auto_816003 ?auto_816014 ) ) ( not ( = ?auto_816004 ?auto_816005 ) ) ( not ( = ?auto_816004 ?auto_816006 ) ) ( not ( = ?auto_816004 ?auto_816007 ) ) ( not ( = ?auto_816004 ?auto_816008 ) ) ( not ( = ?auto_816004 ?auto_816009 ) ) ( not ( = ?auto_816004 ?auto_816010 ) ) ( not ( = ?auto_816004 ?auto_816011 ) ) ( not ( = ?auto_816004 ?auto_816012 ) ) ( not ( = ?auto_816004 ?auto_816013 ) ) ( not ( = ?auto_816004 ?auto_816014 ) ) ( not ( = ?auto_816005 ?auto_816006 ) ) ( not ( = ?auto_816005 ?auto_816007 ) ) ( not ( = ?auto_816005 ?auto_816008 ) ) ( not ( = ?auto_816005 ?auto_816009 ) ) ( not ( = ?auto_816005 ?auto_816010 ) ) ( not ( = ?auto_816005 ?auto_816011 ) ) ( not ( = ?auto_816005 ?auto_816012 ) ) ( not ( = ?auto_816005 ?auto_816013 ) ) ( not ( = ?auto_816005 ?auto_816014 ) ) ( not ( = ?auto_816006 ?auto_816007 ) ) ( not ( = ?auto_816006 ?auto_816008 ) ) ( not ( = ?auto_816006 ?auto_816009 ) ) ( not ( = ?auto_816006 ?auto_816010 ) ) ( not ( = ?auto_816006 ?auto_816011 ) ) ( not ( = ?auto_816006 ?auto_816012 ) ) ( not ( = ?auto_816006 ?auto_816013 ) ) ( not ( = ?auto_816006 ?auto_816014 ) ) ( not ( = ?auto_816007 ?auto_816008 ) ) ( not ( = ?auto_816007 ?auto_816009 ) ) ( not ( = ?auto_816007 ?auto_816010 ) ) ( not ( = ?auto_816007 ?auto_816011 ) ) ( not ( = ?auto_816007 ?auto_816012 ) ) ( not ( = ?auto_816007 ?auto_816013 ) ) ( not ( = ?auto_816007 ?auto_816014 ) ) ( not ( = ?auto_816008 ?auto_816009 ) ) ( not ( = ?auto_816008 ?auto_816010 ) ) ( not ( = ?auto_816008 ?auto_816011 ) ) ( not ( = ?auto_816008 ?auto_816012 ) ) ( not ( = ?auto_816008 ?auto_816013 ) ) ( not ( = ?auto_816008 ?auto_816014 ) ) ( not ( = ?auto_816009 ?auto_816010 ) ) ( not ( = ?auto_816009 ?auto_816011 ) ) ( not ( = ?auto_816009 ?auto_816012 ) ) ( not ( = ?auto_816009 ?auto_816013 ) ) ( not ( = ?auto_816009 ?auto_816014 ) ) ( not ( = ?auto_816010 ?auto_816011 ) ) ( not ( = ?auto_816010 ?auto_816012 ) ) ( not ( = ?auto_816010 ?auto_816013 ) ) ( not ( = ?auto_816010 ?auto_816014 ) ) ( not ( = ?auto_816011 ?auto_816012 ) ) ( not ( = ?auto_816011 ?auto_816013 ) ) ( not ( = ?auto_816011 ?auto_816014 ) ) ( not ( = ?auto_816012 ?auto_816013 ) ) ( not ( = ?auto_816012 ?auto_816014 ) ) ( not ( = ?auto_816013 ?auto_816014 ) ) ( ON ?auto_816012 ?auto_816013 ) ( ON ?auto_816011 ?auto_816012 ) ( ON ?auto_816010 ?auto_816011 ) ( ON ?auto_816009 ?auto_816010 ) ( ON ?auto_816008 ?auto_816009 ) ( ON ?auto_816007 ?auto_816008 ) ( ON ?auto_816006 ?auto_816007 ) ( ON ?auto_816005 ?auto_816006 ) ( ON ?auto_816004 ?auto_816005 ) ( ON ?auto_816003 ?auto_816004 ) ( CLEAR ?auto_816001 ) ( ON ?auto_816002 ?auto_816003 ) ( CLEAR ?auto_816002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_815998 ?auto_815999 ?auto_816000 ?auto_816001 ?auto_816002 )
      ( MAKE-16PILE ?auto_815998 ?auto_815999 ?auto_816000 ?auto_816001 ?auto_816002 ?auto_816003 ?auto_816004 ?auto_816005 ?auto_816006 ?auto_816007 ?auto_816008 ?auto_816009 ?auto_816010 ?auto_816011 ?auto_816012 ?auto_816013 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_816064 - BLOCK
      ?auto_816065 - BLOCK
      ?auto_816066 - BLOCK
      ?auto_816067 - BLOCK
      ?auto_816068 - BLOCK
      ?auto_816069 - BLOCK
      ?auto_816070 - BLOCK
      ?auto_816071 - BLOCK
      ?auto_816072 - BLOCK
      ?auto_816073 - BLOCK
      ?auto_816074 - BLOCK
      ?auto_816075 - BLOCK
      ?auto_816076 - BLOCK
      ?auto_816077 - BLOCK
      ?auto_816078 - BLOCK
      ?auto_816079 - BLOCK
    )
    :vars
    (
      ?auto_816080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816079 ?auto_816080 ) ( ON-TABLE ?auto_816064 ) ( ON ?auto_816065 ?auto_816064 ) ( ON ?auto_816066 ?auto_816065 ) ( not ( = ?auto_816064 ?auto_816065 ) ) ( not ( = ?auto_816064 ?auto_816066 ) ) ( not ( = ?auto_816064 ?auto_816067 ) ) ( not ( = ?auto_816064 ?auto_816068 ) ) ( not ( = ?auto_816064 ?auto_816069 ) ) ( not ( = ?auto_816064 ?auto_816070 ) ) ( not ( = ?auto_816064 ?auto_816071 ) ) ( not ( = ?auto_816064 ?auto_816072 ) ) ( not ( = ?auto_816064 ?auto_816073 ) ) ( not ( = ?auto_816064 ?auto_816074 ) ) ( not ( = ?auto_816064 ?auto_816075 ) ) ( not ( = ?auto_816064 ?auto_816076 ) ) ( not ( = ?auto_816064 ?auto_816077 ) ) ( not ( = ?auto_816064 ?auto_816078 ) ) ( not ( = ?auto_816064 ?auto_816079 ) ) ( not ( = ?auto_816064 ?auto_816080 ) ) ( not ( = ?auto_816065 ?auto_816066 ) ) ( not ( = ?auto_816065 ?auto_816067 ) ) ( not ( = ?auto_816065 ?auto_816068 ) ) ( not ( = ?auto_816065 ?auto_816069 ) ) ( not ( = ?auto_816065 ?auto_816070 ) ) ( not ( = ?auto_816065 ?auto_816071 ) ) ( not ( = ?auto_816065 ?auto_816072 ) ) ( not ( = ?auto_816065 ?auto_816073 ) ) ( not ( = ?auto_816065 ?auto_816074 ) ) ( not ( = ?auto_816065 ?auto_816075 ) ) ( not ( = ?auto_816065 ?auto_816076 ) ) ( not ( = ?auto_816065 ?auto_816077 ) ) ( not ( = ?auto_816065 ?auto_816078 ) ) ( not ( = ?auto_816065 ?auto_816079 ) ) ( not ( = ?auto_816065 ?auto_816080 ) ) ( not ( = ?auto_816066 ?auto_816067 ) ) ( not ( = ?auto_816066 ?auto_816068 ) ) ( not ( = ?auto_816066 ?auto_816069 ) ) ( not ( = ?auto_816066 ?auto_816070 ) ) ( not ( = ?auto_816066 ?auto_816071 ) ) ( not ( = ?auto_816066 ?auto_816072 ) ) ( not ( = ?auto_816066 ?auto_816073 ) ) ( not ( = ?auto_816066 ?auto_816074 ) ) ( not ( = ?auto_816066 ?auto_816075 ) ) ( not ( = ?auto_816066 ?auto_816076 ) ) ( not ( = ?auto_816066 ?auto_816077 ) ) ( not ( = ?auto_816066 ?auto_816078 ) ) ( not ( = ?auto_816066 ?auto_816079 ) ) ( not ( = ?auto_816066 ?auto_816080 ) ) ( not ( = ?auto_816067 ?auto_816068 ) ) ( not ( = ?auto_816067 ?auto_816069 ) ) ( not ( = ?auto_816067 ?auto_816070 ) ) ( not ( = ?auto_816067 ?auto_816071 ) ) ( not ( = ?auto_816067 ?auto_816072 ) ) ( not ( = ?auto_816067 ?auto_816073 ) ) ( not ( = ?auto_816067 ?auto_816074 ) ) ( not ( = ?auto_816067 ?auto_816075 ) ) ( not ( = ?auto_816067 ?auto_816076 ) ) ( not ( = ?auto_816067 ?auto_816077 ) ) ( not ( = ?auto_816067 ?auto_816078 ) ) ( not ( = ?auto_816067 ?auto_816079 ) ) ( not ( = ?auto_816067 ?auto_816080 ) ) ( not ( = ?auto_816068 ?auto_816069 ) ) ( not ( = ?auto_816068 ?auto_816070 ) ) ( not ( = ?auto_816068 ?auto_816071 ) ) ( not ( = ?auto_816068 ?auto_816072 ) ) ( not ( = ?auto_816068 ?auto_816073 ) ) ( not ( = ?auto_816068 ?auto_816074 ) ) ( not ( = ?auto_816068 ?auto_816075 ) ) ( not ( = ?auto_816068 ?auto_816076 ) ) ( not ( = ?auto_816068 ?auto_816077 ) ) ( not ( = ?auto_816068 ?auto_816078 ) ) ( not ( = ?auto_816068 ?auto_816079 ) ) ( not ( = ?auto_816068 ?auto_816080 ) ) ( not ( = ?auto_816069 ?auto_816070 ) ) ( not ( = ?auto_816069 ?auto_816071 ) ) ( not ( = ?auto_816069 ?auto_816072 ) ) ( not ( = ?auto_816069 ?auto_816073 ) ) ( not ( = ?auto_816069 ?auto_816074 ) ) ( not ( = ?auto_816069 ?auto_816075 ) ) ( not ( = ?auto_816069 ?auto_816076 ) ) ( not ( = ?auto_816069 ?auto_816077 ) ) ( not ( = ?auto_816069 ?auto_816078 ) ) ( not ( = ?auto_816069 ?auto_816079 ) ) ( not ( = ?auto_816069 ?auto_816080 ) ) ( not ( = ?auto_816070 ?auto_816071 ) ) ( not ( = ?auto_816070 ?auto_816072 ) ) ( not ( = ?auto_816070 ?auto_816073 ) ) ( not ( = ?auto_816070 ?auto_816074 ) ) ( not ( = ?auto_816070 ?auto_816075 ) ) ( not ( = ?auto_816070 ?auto_816076 ) ) ( not ( = ?auto_816070 ?auto_816077 ) ) ( not ( = ?auto_816070 ?auto_816078 ) ) ( not ( = ?auto_816070 ?auto_816079 ) ) ( not ( = ?auto_816070 ?auto_816080 ) ) ( not ( = ?auto_816071 ?auto_816072 ) ) ( not ( = ?auto_816071 ?auto_816073 ) ) ( not ( = ?auto_816071 ?auto_816074 ) ) ( not ( = ?auto_816071 ?auto_816075 ) ) ( not ( = ?auto_816071 ?auto_816076 ) ) ( not ( = ?auto_816071 ?auto_816077 ) ) ( not ( = ?auto_816071 ?auto_816078 ) ) ( not ( = ?auto_816071 ?auto_816079 ) ) ( not ( = ?auto_816071 ?auto_816080 ) ) ( not ( = ?auto_816072 ?auto_816073 ) ) ( not ( = ?auto_816072 ?auto_816074 ) ) ( not ( = ?auto_816072 ?auto_816075 ) ) ( not ( = ?auto_816072 ?auto_816076 ) ) ( not ( = ?auto_816072 ?auto_816077 ) ) ( not ( = ?auto_816072 ?auto_816078 ) ) ( not ( = ?auto_816072 ?auto_816079 ) ) ( not ( = ?auto_816072 ?auto_816080 ) ) ( not ( = ?auto_816073 ?auto_816074 ) ) ( not ( = ?auto_816073 ?auto_816075 ) ) ( not ( = ?auto_816073 ?auto_816076 ) ) ( not ( = ?auto_816073 ?auto_816077 ) ) ( not ( = ?auto_816073 ?auto_816078 ) ) ( not ( = ?auto_816073 ?auto_816079 ) ) ( not ( = ?auto_816073 ?auto_816080 ) ) ( not ( = ?auto_816074 ?auto_816075 ) ) ( not ( = ?auto_816074 ?auto_816076 ) ) ( not ( = ?auto_816074 ?auto_816077 ) ) ( not ( = ?auto_816074 ?auto_816078 ) ) ( not ( = ?auto_816074 ?auto_816079 ) ) ( not ( = ?auto_816074 ?auto_816080 ) ) ( not ( = ?auto_816075 ?auto_816076 ) ) ( not ( = ?auto_816075 ?auto_816077 ) ) ( not ( = ?auto_816075 ?auto_816078 ) ) ( not ( = ?auto_816075 ?auto_816079 ) ) ( not ( = ?auto_816075 ?auto_816080 ) ) ( not ( = ?auto_816076 ?auto_816077 ) ) ( not ( = ?auto_816076 ?auto_816078 ) ) ( not ( = ?auto_816076 ?auto_816079 ) ) ( not ( = ?auto_816076 ?auto_816080 ) ) ( not ( = ?auto_816077 ?auto_816078 ) ) ( not ( = ?auto_816077 ?auto_816079 ) ) ( not ( = ?auto_816077 ?auto_816080 ) ) ( not ( = ?auto_816078 ?auto_816079 ) ) ( not ( = ?auto_816078 ?auto_816080 ) ) ( not ( = ?auto_816079 ?auto_816080 ) ) ( ON ?auto_816078 ?auto_816079 ) ( ON ?auto_816077 ?auto_816078 ) ( ON ?auto_816076 ?auto_816077 ) ( ON ?auto_816075 ?auto_816076 ) ( ON ?auto_816074 ?auto_816075 ) ( ON ?auto_816073 ?auto_816074 ) ( ON ?auto_816072 ?auto_816073 ) ( ON ?auto_816071 ?auto_816072 ) ( ON ?auto_816070 ?auto_816071 ) ( ON ?auto_816069 ?auto_816070 ) ( ON ?auto_816068 ?auto_816069 ) ( CLEAR ?auto_816066 ) ( ON ?auto_816067 ?auto_816068 ) ( CLEAR ?auto_816067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_816064 ?auto_816065 ?auto_816066 ?auto_816067 )
      ( MAKE-16PILE ?auto_816064 ?auto_816065 ?auto_816066 ?auto_816067 ?auto_816068 ?auto_816069 ?auto_816070 ?auto_816071 ?auto_816072 ?auto_816073 ?auto_816074 ?auto_816075 ?auto_816076 ?auto_816077 ?auto_816078 ?auto_816079 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_816130 - BLOCK
      ?auto_816131 - BLOCK
      ?auto_816132 - BLOCK
      ?auto_816133 - BLOCK
      ?auto_816134 - BLOCK
      ?auto_816135 - BLOCK
      ?auto_816136 - BLOCK
      ?auto_816137 - BLOCK
      ?auto_816138 - BLOCK
      ?auto_816139 - BLOCK
      ?auto_816140 - BLOCK
      ?auto_816141 - BLOCK
      ?auto_816142 - BLOCK
      ?auto_816143 - BLOCK
      ?auto_816144 - BLOCK
      ?auto_816145 - BLOCK
    )
    :vars
    (
      ?auto_816146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816145 ?auto_816146 ) ( ON-TABLE ?auto_816130 ) ( ON ?auto_816131 ?auto_816130 ) ( not ( = ?auto_816130 ?auto_816131 ) ) ( not ( = ?auto_816130 ?auto_816132 ) ) ( not ( = ?auto_816130 ?auto_816133 ) ) ( not ( = ?auto_816130 ?auto_816134 ) ) ( not ( = ?auto_816130 ?auto_816135 ) ) ( not ( = ?auto_816130 ?auto_816136 ) ) ( not ( = ?auto_816130 ?auto_816137 ) ) ( not ( = ?auto_816130 ?auto_816138 ) ) ( not ( = ?auto_816130 ?auto_816139 ) ) ( not ( = ?auto_816130 ?auto_816140 ) ) ( not ( = ?auto_816130 ?auto_816141 ) ) ( not ( = ?auto_816130 ?auto_816142 ) ) ( not ( = ?auto_816130 ?auto_816143 ) ) ( not ( = ?auto_816130 ?auto_816144 ) ) ( not ( = ?auto_816130 ?auto_816145 ) ) ( not ( = ?auto_816130 ?auto_816146 ) ) ( not ( = ?auto_816131 ?auto_816132 ) ) ( not ( = ?auto_816131 ?auto_816133 ) ) ( not ( = ?auto_816131 ?auto_816134 ) ) ( not ( = ?auto_816131 ?auto_816135 ) ) ( not ( = ?auto_816131 ?auto_816136 ) ) ( not ( = ?auto_816131 ?auto_816137 ) ) ( not ( = ?auto_816131 ?auto_816138 ) ) ( not ( = ?auto_816131 ?auto_816139 ) ) ( not ( = ?auto_816131 ?auto_816140 ) ) ( not ( = ?auto_816131 ?auto_816141 ) ) ( not ( = ?auto_816131 ?auto_816142 ) ) ( not ( = ?auto_816131 ?auto_816143 ) ) ( not ( = ?auto_816131 ?auto_816144 ) ) ( not ( = ?auto_816131 ?auto_816145 ) ) ( not ( = ?auto_816131 ?auto_816146 ) ) ( not ( = ?auto_816132 ?auto_816133 ) ) ( not ( = ?auto_816132 ?auto_816134 ) ) ( not ( = ?auto_816132 ?auto_816135 ) ) ( not ( = ?auto_816132 ?auto_816136 ) ) ( not ( = ?auto_816132 ?auto_816137 ) ) ( not ( = ?auto_816132 ?auto_816138 ) ) ( not ( = ?auto_816132 ?auto_816139 ) ) ( not ( = ?auto_816132 ?auto_816140 ) ) ( not ( = ?auto_816132 ?auto_816141 ) ) ( not ( = ?auto_816132 ?auto_816142 ) ) ( not ( = ?auto_816132 ?auto_816143 ) ) ( not ( = ?auto_816132 ?auto_816144 ) ) ( not ( = ?auto_816132 ?auto_816145 ) ) ( not ( = ?auto_816132 ?auto_816146 ) ) ( not ( = ?auto_816133 ?auto_816134 ) ) ( not ( = ?auto_816133 ?auto_816135 ) ) ( not ( = ?auto_816133 ?auto_816136 ) ) ( not ( = ?auto_816133 ?auto_816137 ) ) ( not ( = ?auto_816133 ?auto_816138 ) ) ( not ( = ?auto_816133 ?auto_816139 ) ) ( not ( = ?auto_816133 ?auto_816140 ) ) ( not ( = ?auto_816133 ?auto_816141 ) ) ( not ( = ?auto_816133 ?auto_816142 ) ) ( not ( = ?auto_816133 ?auto_816143 ) ) ( not ( = ?auto_816133 ?auto_816144 ) ) ( not ( = ?auto_816133 ?auto_816145 ) ) ( not ( = ?auto_816133 ?auto_816146 ) ) ( not ( = ?auto_816134 ?auto_816135 ) ) ( not ( = ?auto_816134 ?auto_816136 ) ) ( not ( = ?auto_816134 ?auto_816137 ) ) ( not ( = ?auto_816134 ?auto_816138 ) ) ( not ( = ?auto_816134 ?auto_816139 ) ) ( not ( = ?auto_816134 ?auto_816140 ) ) ( not ( = ?auto_816134 ?auto_816141 ) ) ( not ( = ?auto_816134 ?auto_816142 ) ) ( not ( = ?auto_816134 ?auto_816143 ) ) ( not ( = ?auto_816134 ?auto_816144 ) ) ( not ( = ?auto_816134 ?auto_816145 ) ) ( not ( = ?auto_816134 ?auto_816146 ) ) ( not ( = ?auto_816135 ?auto_816136 ) ) ( not ( = ?auto_816135 ?auto_816137 ) ) ( not ( = ?auto_816135 ?auto_816138 ) ) ( not ( = ?auto_816135 ?auto_816139 ) ) ( not ( = ?auto_816135 ?auto_816140 ) ) ( not ( = ?auto_816135 ?auto_816141 ) ) ( not ( = ?auto_816135 ?auto_816142 ) ) ( not ( = ?auto_816135 ?auto_816143 ) ) ( not ( = ?auto_816135 ?auto_816144 ) ) ( not ( = ?auto_816135 ?auto_816145 ) ) ( not ( = ?auto_816135 ?auto_816146 ) ) ( not ( = ?auto_816136 ?auto_816137 ) ) ( not ( = ?auto_816136 ?auto_816138 ) ) ( not ( = ?auto_816136 ?auto_816139 ) ) ( not ( = ?auto_816136 ?auto_816140 ) ) ( not ( = ?auto_816136 ?auto_816141 ) ) ( not ( = ?auto_816136 ?auto_816142 ) ) ( not ( = ?auto_816136 ?auto_816143 ) ) ( not ( = ?auto_816136 ?auto_816144 ) ) ( not ( = ?auto_816136 ?auto_816145 ) ) ( not ( = ?auto_816136 ?auto_816146 ) ) ( not ( = ?auto_816137 ?auto_816138 ) ) ( not ( = ?auto_816137 ?auto_816139 ) ) ( not ( = ?auto_816137 ?auto_816140 ) ) ( not ( = ?auto_816137 ?auto_816141 ) ) ( not ( = ?auto_816137 ?auto_816142 ) ) ( not ( = ?auto_816137 ?auto_816143 ) ) ( not ( = ?auto_816137 ?auto_816144 ) ) ( not ( = ?auto_816137 ?auto_816145 ) ) ( not ( = ?auto_816137 ?auto_816146 ) ) ( not ( = ?auto_816138 ?auto_816139 ) ) ( not ( = ?auto_816138 ?auto_816140 ) ) ( not ( = ?auto_816138 ?auto_816141 ) ) ( not ( = ?auto_816138 ?auto_816142 ) ) ( not ( = ?auto_816138 ?auto_816143 ) ) ( not ( = ?auto_816138 ?auto_816144 ) ) ( not ( = ?auto_816138 ?auto_816145 ) ) ( not ( = ?auto_816138 ?auto_816146 ) ) ( not ( = ?auto_816139 ?auto_816140 ) ) ( not ( = ?auto_816139 ?auto_816141 ) ) ( not ( = ?auto_816139 ?auto_816142 ) ) ( not ( = ?auto_816139 ?auto_816143 ) ) ( not ( = ?auto_816139 ?auto_816144 ) ) ( not ( = ?auto_816139 ?auto_816145 ) ) ( not ( = ?auto_816139 ?auto_816146 ) ) ( not ( = ?auto_816140 ?auto_816141 ) ) ( not ( = ?auto_816140 ?auto_816142 ) ) ( not ( = ?auto_816140 ?auto_816143 ) ) ( not ( = ?auto_816140 ?auto_816144 ) ) ( not ( = ?auto_816140 ?auto_816145 ) ) ( not ( = ?auto_816140 ?auto_816146 ) ) ( not ( = ?auto_816141 ?auto_816142 ) ) ( not ( = ?auto_816141 ?auto_816143 ) ) ( not ( = ?auto_816141 ?auto_816144 ) ) ( not ( = ?auto_816141 ?auto_816145 ) ) ( not ( = ?auto_816141 ?auto_816146 ) ) ( not ( = ?auto_816142 ?auto_816143 ) ) ( not ( = ?auto_816142 ?auto_816144 ) ) ( not ( = ?auto_816142 ?auto_816145 ) ) ( not ( = ?auto_816142 ?auto_816146 ) ) ( not ( = ?auto_816143 ?auto_816144 ) ) ( not ( = ?auto_816143 ?auto_816145 ) ) ( not ( = ?auto_816143 ?auto_816146 ) ) ( not ( = ?auto_816144 ?auto_816145 ) ) ( not ( = ?auto_816144 ?auto_816146 ) ) ( not ( = ?auto_816145 ?auto_816146 ) ) ( ON ?auto_816144 ?auto_816145 ) ( ON ?auto_816143 ?auto_816144 ) ( ON ?auto_816142 ?auto_816143 ) ( ON ?auto_816141 ?auto_816142 ) ( ON ?auto_816140 ?auto_816141 ) ( ON ?auto_816139 ?auto_816140 ) ( ON ?auto_816138 ?auto_816139 ) ( ON ?auto_816137 ?auto_816138 ) ( ON ?auto_816136 ?auto_816137 ) ( ON ?auto_816135 ?auto_816136 ) ( ON ?auto_816134 ?auto_816135 ) ( ON ?auto_816133 ?auto_816134 ) ( CLEAR ?auto_816131 ) ( ON ?auto_816132 ?auto_816133 ) ( CLEAR ?auto_816132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_816130 ?auto_816131 ?auto_816132 )
      ( MAKE-16PILE ?auto_816130 ?auto_816131 ?auto_816132 ?auto_816133 ?auto_816134 ?auto_816135 ?auto_816136 ?auto_816137 ?auto_816138 ?auto_816139 ?auto_816140 ?auto_816141 ?auto_816142 ?auto_816143 ?auto_816144 ?auto_816145 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_816196 - BLOCK
      ?auto_816197 - BLOCK
      ?auto_816198 - BLOCK
      ?auto_816199 - BLOCK
      ?auto_816200 - BLOCK
      ?auto_816201 - BLOCK
      ?auto_816202 - BLOCK
      ?auto_816203 - BLOCK
      ?auto_816204 - BLOCK
      ?auto_816205 - BLOCK
      ?auto_816206 - BLOCK
      ?auto_816207 - BLOCK
      ?auto_816208 - BLOCK
      ?auto_816209 - BLOCK
      ?auto_816210 - BLOCK
      ?auto_816211 - BLOCK
    )
    :vars
    (
      ?auto_816212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816211 ?auto_816212 ) ( ON-TABLE ?auto_816196 ) ( not ( = ?auto_816196 ?auto_816197 ) ) ( not ( = ?auto_816196 ?auto_816198 ) ) ( not ( = ?auto_816196 ?auto_816199 ) ) ( not ( = ?auto_816196 ?auto_816200 ) ) ( not ( = ?auto_816196 ?auto_816201 ) ) ( not ( = ?auto_816196 ?auto_816202 ) ) ( not ( = ?auto_816196 ?auto_816203 ) ) ( not ( = ?auto_816196 ?auto_816204 ) ) ( not ( = ?auto_816196 ?auto_816205 ) ) ( not ( = ?auto_816196 ?auto_816206 ) ) ( not ( = ?auto_816196 ?auto_816207 ) ) ( not ( = ?auto_816196 ?auto_816208 ) ) ( not ( = ?auto_816196 ?auto_816209 ) ) ( not ( = ?auto_816196 ?auto_816210 ) ) ( not ( = ?auto_816196 ?auto_816211 ) ) ( not ( = ?auto_816196 ?auto_816212 ) ) ( not ( = ?auto_816197 ?auto_816198 ) ) ( not ( = ?auto_816197 ?auto_816199 ) ) ( not ( = ?auto_816197 ?auto_816200 ) ) ( not ( = ?auto_816197 ?auto_816201 ) ) ( not ( = ?auto_816197 ?auto_816202 ) ) ( not ( = ?auto_816197 ?auto_816203 ) ) ( not ( = ?auto_816197 ?auto_816204 ) ) ( not ( = ?auto_816197 ?auto_816205 ) ) ( not ( = ?auto_816197 ?auto_816206 ) ) ( not ( = ?auto_816197 ?auto_816207 ) ) ( not ( = ?auto_816197 ?auto_816208 ) ) ( not ( = ?auto_816197 ?auto_816209 ) ) ( not ( = ?auto_816197 ?auto_816210 ) ) ( not ( = ?auto_816197 ?auto_816211 ) ) ( not ( = ?auto_816197 ?auto_816212 ) ) ( not ( = ?auto_816198 ?auto_816199 ) ) ( not ( = ?auto_816198 ?auto_816200 ) ) ( not ( = ?auto_816198 ?auto_816201 ) ) ( not ( = ?auto_816198 ?auto_816202 ) ) ( not ( = ?auto_816198 ?auto_816203 ) ) ( not ( = ?auto_816198 ?auto_816204 ) ) ( not ( = ?auto_816198 ?auto_816205 ) ) ( not ( = ?auto_816198 ?auto_816206 ) ) ( not ( = ?auto_816198 ?auto_816207 ) ) ( not ( = ?auto_816198 ?auto_816208 ) ) ( not ( = ?auto_816198 ?auto_816209 ) ) ( not ( = ?auto_816198 ?auto_816210 ) ) ( not ( = ?auto_816198 ?auto_816211 ) ) ( not ( = ?auto_816198 ?auto_816212 ) ) ( not ( = ?auto_816199 ?auto_816200 ) ) ( not ( = ?auto_816199 ?auto_816201 ) ) ( not ( = ?auto_816199 ?auto_816202 ) ) ( not ( = ?auto_816199 ?auto_816203 ) ) ( not ( = ?auto_816199 ?auto_816204 ) ) ( not ( = ?auto_816199 ?auto_816205 ) ) ( not ( = ?auto_816199 ?auto_816206 ) ) ( not ( = ?auto_816199 ?auto_816207 ) ) ( not ( = ?auto_816199 ?auto_816208 ) ) ( not ( = ?auto_816199 ?auto_816209 ) ) ( not ( = ?auto_816199 ?auto_816210 ) ) ( not ( = ?auto_816199 ?auto_816211 ) ) ( not ( = ?auto_816199 ?auto_816212 ) ) ( not ( = ?auto_816200 ?auto_816201 ) ) ( not ( = ?auto_816200 ?auto_816202 ) ) ( not ( = ?auto_816200 ?auto_816203 ) ) ( not ( = ?auto_816200 ?auto_816204 ) ) ( not ( = ?auto_816200 ?auto_816205 ) ) ( not ( = ?auto_816200 ?auto_816206 ) ) ( not ( = ?auto_816200 ?auto_816207 ) ) ( not ( = ?auto_816200 ?auto_816208 ) ) ( not ( = ?auto_816200 ?auto_816209 ) ) ( not ( = ?auto_816200 ?auto_816210 ) ) ( not ( = ?auto_816200 ?auto_816211 ) ) ( not ( = ?auto_816200 ?auto_816212 ) ) ( not ( = ?auto_816201 ?auto_816202 ) ) ( not ( = ?auto_816201 ?auto_816203 ) ) ( not ( = ?auto_816201 ?auto_816204 ) ) ( not ( = ?auto_816201 ?auto_816205 ) ) ( not ( = ?auto_816201 ?auto_816206 ) ) ( not ( = ?auto_816201 ?auto_816207 ) ) ( not ( = ?auto_816201 ?auto_816208 ) ) ( not ( = ?auto_816201 ?auto_816209 ) ) ( not ( = ?auto_816201 ?auto_816210 ) ) ( not ( = ?auto_816201 ?auto_816211 ) ) ( not ( = ?auto_816201 ?auto_816212 ) ) ( not ( = ?auto_816202 ?auto_816203 ) ) ( not ( = ?auto_816202 ?auto_816204 ) ) ( not ( = ?auto_816202 ?auto_816205 ) ) ( not ( = ?auto_816202 ?auto_816206 ) ) ( not ( = ?auto_816202 ?auto_816207 ) ) ( not ( = ?auto_816202 ?auto_816208 ) ) ( not ( = ?auto_816202 ?auto_816209 ) ) ( not ( = ?auto_816202 ?auto_816210 ) ) ( not ( = ?auto_816202 ?auto_816211 ) ) ( not ( = ?auto_816202 ?auto_816212 ) ) ( not ( = ?auto_816203 ?auto_816204 ) ) ( not ( = ?auto_816203 ?auto_816205 ) ) ( not ( = ?auto_816203 ?auto_816206 ) ) ( not ( = ?auto_816203 ?auto_816207 ) ) ( not ( = ?auto_816203 ?auto_816208 ) ) ( not ( = ?auto_816203 ?auto_816209 ) ) ( not ( = ?auto_816203 ?auto_816210 ) ) ( not ( = ?auto_816203 ?auto_816211 ) ) ( not ( = ?auto_816203 ?auto_816212 ) ) ( not ( = ?auto_816204 ?auto_816205 ) ) ( not ( = ?auto_816204 ?auto_816206 ) ) ( not ( = ?auto_816204 ?auto_816207 ) ) ( not ( = ?auto_816204 ?auto_816208 ) ) ( not ( = ?auto_816204 ?auto_816209 ) ) ( not ( = ?auto_816204 ?auto_816210 ) ) ( not ( = ?auto_816204 ?auto_816211 ) ) ( not ( = ?auto_816204 ?auto_816212 ) ) ( not ( = ?auto_816205 ?auto_816206 ) ) ( not ( = ?auto_816205 ?auto_816207 ) ) ( not ( = ?auto_816205 ?auto_816208 ) ) ( not ( = ?auto_816205 ?auto_816209 ) ) ( not ( = ?auto_816205 ?auto_816210 ) ) ( not ( = ?auto_816205 ?auto_816211 ) ) ( not ( = ?auto_816205 ?auto_816212 ) ) ( not ( = ?auto_816206 ?auto_816207 ) ) ( not ( = ?auto_816206 ?auto_816208 ) ) ( not ( = ?auto_816206 ?auto_816209 ) ) ( not ( = ?auto_816206 ?auto_816210 ) ) ( not ( = ?auto_816206 ?auto_816211 ) ) ( not ( = ?auto_816206 ?auto_816212 ) ) ( not ( = ?auto_816207 ?auto_816208 ) ) ( not ( = ?auto_816207 ?auto_816209 ) ) ( not ( = ?auto_816207 ?auto_816210 ) ) ( not ( = ?auto_816207 ?auto_816211 ) ) ( not ( = ?auto_816207 ?auto_816212 ) ) ( not ( = ?auto_816208 ?auto_816209 ) ) ( not ( = ?auto_816208 ?auto_816210 ) ) ( not ( = ?auto_816208 ?auto_816211 ) ) ( not ( = ?auto_816208 ?auto_816212 ) ) ( not ( = ?auto_816209 ?auto_816210 ) ) ( not ( = ?auto_816209 ?auto_816211 ) ) ( not ( = ?auto_816209 ?auto_816212 ) ) ( not ( = ?auto_816210 ?auto_816211 ) ) ( not ( = ?auto_816210 ?auto_816212 ) ) ( not ( = ?auto_816211 ?auto_816212 ) ) ( ON ?auto_816210 ?auto_816211 ) ( ON ?auto_816209 ?auto_816210 ) ( ON ?auto_816208 ?auto_816209 ) ( ON ?auto_816207 ?auto_816208 ) ( ON ?auto_816206 ?auto_816207 ) ( ON ?auto_816205 ?auto_816206 ) ( ON ?auto_816204 ?auto_816205 ) ( ON ?auto_816203 ?auto_816204 ) ( ON ?auto_816202 ?auto_816203 ) ( ON ?auto_816201 ?auto_816202 ) ( ON ?auto_816200 ?auto_816201 ) ( ON ?auto_816199 ?auto_816200 ) ( ON ?auto_816198 ?auto_816199 ) ( CLEAR ?auto_816196 ) ( ON ?auto_816197 ?auto_816198 ) ( CLEAR ?auto_816197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_816196 ?auto_816197 )
      ( MAKE-16PILE ?auto_816196 ?auto_816197 ?auto_816198 ?auto_816199 ?auto_816200 ?auto_816201 ?auto_816202 ?auto_816203 ?auto_816204 ?auto_816205 ?auto_816206 ?auto_816207 ?auto_816208 ?auto_816209 ?auto_816210 ?auto_816211 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_816262 - BLOCK
      ?auto_816263 - BLOCK
      ?auto_816264 - BLOCK
      ?auto_816265 - BLOCK
      ?auto_816266 - BLOCK
      ?auto_816267 - BLOCK
      ?auto_816268 - BLOCK
      ?auto_816269 - BLOCK
      ?auto_816270 - BLOCK
      ?auto_816271 - BLOCK
      ?auto_816272 - BLOCK
      ?auto_816273 - BLOCK
      ?auto_816274 - BLOCK
      ?auto_816275 - BLOCK
      ?auto_816276 - BLOCK
      ?auto_816277 - BLOCK
    )
    :vars
    (
      ?auto_816278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816277 ?auto_816278 ) ( not ( = ?auto_816262 ?auto_816263 ) ) ( not ( = ?auto_816262 ?auto_816264 ) ) ( not ( = ?auto_816262 ?auto_816265 ) ) ( not ( = ?auto_816262 ?auto_816266 ) ) ( not ( = ?auto_816262 ?auto_816267 ) ) ( not ( = ?auto_816262 ?auto_816268 ) ) ( not ( = ?auto_816262 ?auto_816269 ) ) ( not ( = ?auto_816262 ?auto_816270 ) ) ( not ( = ?auto_816262 ?auto_816271 ) ) ( not ( = ?auto_816262 ?auto_816272 ) ) ( not ( = ?auto_816262 ?auto_816273 ) ) ( not ( = ?auto_816262 ?auto_816274 ) ) ( not ( = ?auto_816262 ?auto_816275 ) ) ( not ( = ?auto_816262 ?auto_816276 ) ) ( not ( = ?auto_816262 ?auto_816277 ) ) ( not ( = ?auto_816262 ?auto_816278 ) ) ( not ( = ?auto_816263 ?auto_816264 ) ) ( not ( = ?auto_816263 ?auto_816265 ) ) ( not ( = ?auto_816263 ?auto_816266 ) ) ( not ( = ?auto_816263 ?auto_816267 ) ) ( not ( = ?auto_816263 ?auto_816268 ) ) ( not ( = ?auto_816263 ?auto_816269 ) ) ( not ( = ?auto_816263 ?auto_816270 ) ) ( not ( = ?auto_816263 ?auto_816271 ) ) ( not ( = ?auto_816263 ?auto_816272 ) ) ( not ( = ?auto_816263 ?auto_816273 ) ) ( not ( = ?auto_816263 ?auto_816274 ) ) ( not ( = ?auto_816263 ?auto_816275 ) ) ( not ( = ?auto_816263 ?auto_816276 ) ) ( not ( = ?auto_816263 ?auto_816277 ) ) ( not ( = ?auto_816263 ?auto_816278 ) ) ( not ( = ?auto_816264 ?auto_816265 ) ) ( not ( = ?auto_816264 ?auto_816266 ) ) ( not ( = ?auto_816264 ?auto_816267 ) ) ( not ( = ?auto_816264 ?auto_816268 ) ) ( not ( = ?auto_816264 ?auto_816269 ) ) ( not ( = ?auto_816264 ?auto_816270 ) ) ( not ( = ?auto_816264 ?auto_816271 ) ) ( not ( = ?auto_816264 ?auto_816272 ) ) ( not ( = ?auto_816264 ?auto_816273 ) ) ( not ( = ?auto_816264 ?auto_816274 ) ) ( not ( = ?auto_816264 ?auto_816275 ) ) ( not ( = ?auto_816264 ?auto_816276 ) ) ( not ( = ?auto_816264 ?auto_816277 ) ) ( not ( = ?auto_816264 ?auto_816278 ) ) ( not ( = ?auto_816265 ?auto_816266 ) ) ( not ( = ?auto_816265 ?auto_816267 ) ) ( not ( = ?auto_816265 ?auto_816268 ) ) ( not ( = ?auto_816265 ?auto_816269 ) ) ( not ( = ?auto_816265 ?auto_816270 ) ) ( not ( = ?auto_816265 ?auto_816271 ) ) ( not ( = ?auto_816265 ?auto_816272 ) ) ( not ( = ?auto_816265 ?auto_816273 ) ) ( not ( = ?auto_816265 ?auto_816274 ) ) ( not ( = ?auto_816265 ?auto_816275 ) ) ( not ( = ?auto_816265 ?auto_816276 ) ) ( not ( = ?auto_816265 ?auto_816277 ) ) ( not ( = ?auto_816265 ?auto_816278 ) ) ( not ( = ?auto_816266 ?auto_816267 ) ) ( not ( = ?auto_816266 ?auto_816268 ) ) ( not ( = ?auto_816266 ?auto_816269 ) ) ( not ( = ?auto_816266 ?auto_816270 ) ) ( not ( = ?auto_816266 ?auto_816271 ) ) ( not ( = ?auto_816266 ?auto_816272 ) ) ( not ( = ?auto_816266 ?auto_816273 ) ) ( not ( = ?auto_816266 ?auto_816274 ) ) ( not ( = ?auto_816266 ?auto_816275 ) ) ( not ( = ?auto_816266 ?auto_816276 ) ) ( not ( = ?auto_816266 ?auto_816277 ) ) ( not ( = ?auto_816266 ?auto_816278 ) ) ( not ( = ?auto_816267 ?auto_816268 ) ) ( not ( = ?auto_816267 ?auto_816269 ) ) ( not ( = ?auto_816267 ?auto_816270 ) ) ( not ( = ?auto_816267 ?auto_816271 ) ) ( not ( = ?auto_816267 ?auto_816272 ) ) ( not ( = ?auto_816267 ?auto_816273 ) ) ( not ( = ?auto_816267 ?auto_816274 ) ) ( not ( = ?auto_816267 ?auto_816275 ) ) ( not ( = ?auto_816267 ?auto_816276 ) ) ( not ( = ?auto_816267 ?auto_816277 ) ) ( not ( = ?auto_816267 ?auto_816278 ) ) ( not ( = ?auto_816268 ?auto_816269 ) ) ( not ( = ?auto_816268 ?auto_816270 ) ) ( not ( = ?auto_816268 ?auto_816271 ) ) ( not ( = ?auto_816268 ?auto_816272 ) ) ( not ( = ?auto_816268 ?auto_816273 ) ) ( not ( = ?auto_816268 ?auto_816274 ) ) ( not ( = ?auto_816268 ?auto_816275 ) ) ( not ( = ?auto_816268 ?auto_816276 ) ) ( not ( = ?auto_816268 ?auto_816277 ) ) ( not ( = ?auto_816268 ?auto_816278 ) ) ( not ( = ?auto_816269 ?auto_816270 ) ) ( not ( = ?auto_816269 ?auto_816271 ) ) ( not ( = ?auto_816269 ?auto_816272 ) ) ( not ( = ?auto_816269 ?auto_816273 ) ) ( not ( = ?auto_816269 ?auto_816274 ) ) ( not ( = ?auto_816269 ?auto_816275 ) ) ( not ( = ?auto_816269 ?auto_816276 ) ) ( not ( = ?auto_816269 ?auto_816277 ) ) ( not ( = ?auto_816269 ?auto_816278 ) ) ( not ( = ?auto_816270 ?auto_816271 ) ) ( not ( = ?auto_816270 ?auto_816272 ) ) ( not ( = ?auto_816270 ?auto_816273 ) ) ( not ( = ?auto_816270 ?auto_816274 ) ) ( not ( = ?auto_816270 ?auto_816275 ) ) ( not ( = ?auto_816270 ?auto_816276 ) ) ( not ( = ?auto_816270 ?auto_816277 ) ) ( not ( = ?auto_816270 ?auto_816278 ) ) ( not ( = ?auto_816271 ?auto_816272 ) ) ( not ( = ?auto_816271 ?auto_816273 ) ) ( not ( = ?auto_816271 ?auto_816274 ) ) ( not ( = ?auto_816271 ?auto_816275 ) ) ( not ( = ?auto_816271 ?auto_816276 ) ) ( not ( = ?auto_816271 ?auto_816277 ) ) ( not ( = ?auto_816271 ?auto_816278 ) ) ( not ( = ?auto_816272 ?auto_816273 ) ) ( not ( = ?auto_816272 ?auto_816274 ) ) ( not ( = ?auto_816272 ?auto_816275 ) ) ( not ( = ?auto_816272 ?auto_816276 ) ) ( not ( = ?auto_816272 ?auto_816277 ) ) ( not ( = ?auto_816272 ?auto_816278 ) ) ( not ( = ?auto_816273 ?auto_816274 ) ) ( not ( = ?auto_816273 ?auto_816275 ) ) ( not ( = ?auto_816273 ?auto_816276 ) ) ( not ( = ?auto_816273 ?auto_816277 ) ) ( not ( = ?auto_816273 ?auto_816278 ) ) ( not ( = ?auto_816274 ?auto_816275 ) ) ( not ( = ?auto_816274 ?auto_816276 ) ) ( not ( = ?auto_816274 ?auto_816277 ) ) ( not ( = ?auto_816274 ?auto_816278 ) ) ( not ( = ?auto_816275 ?auto_816276 ) ) ( not ( = ?auto_816275 ?auto_816277 ) ) ( not ( = ?auto_816275 ?auto_816278 ) ) ( not ( = ?auto_816276 ?auto_816277 ) ) ( not ( = ?auto_816276 ?auto_816278 ) ) ( not ( = ?auto_816277 ?auto_816278 ) ) ( ON ?auto_816276 ?auto_816277 ) ( ON ?auto_816275 ?auto_816276 ) ( ON ?auto_816274 ?auto_816275 ) ( ON ?auto_816273 ?auto_816274 ) ( ON ?auto_816272 ?auto_816273 ) ( ON ?auto_816271 ?auto_816272 ) ( ON ?auto_816270 ?auto_816271 ) ( ON ?auto_816269 ?auto_816270 ) ( ON ?auto_816268 ?auto_816269 ) ( ON ?auto_816267 ?auto_816268 ) ( ON ?auto_816266 ?auto_816267 ) ( ON ?auto_816265 ?auto_816266 ) ( ON ?auto_816264 ?auto_816265 ) ( ON ?auto_816263 ?auto_816264 ) ( ON ?auto_816262 ?auto_816263 ) ( CLEAR ?auto_816262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_816262 )
      ( MAKE-16PILE ?auto_816262 ?auto_816263 ?auto_816264 ?auto_816265 ?auto_816266 ?auto_816267 ?auto_816268 ?auto_816269 ?auto_816270 ?auto_816271 ?auto_816272 ?auto_816273 ?auto_816274 ?auto_816275 ?auto_816276 ?auto_816277 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816329 - BLOCK
      ?auto_816330 - BLOCK
      ?auto_816331 - BLOCK
      ?auto_816332 - BLOCK
      ?auto_816333 - BLOCK
      ?auto_816334 - BLOCK
      ?auto_816335 - BLOCK
      ?auto_816336 - BLOCK
      ?auto_816337 - BLOCK
      ?auto_816338 - BLOCK
      ?auto_816339 - BLOCK
      ?auto_816340 - BLOCK
      ?auto_816341 - BLOCK
      ?auto_816342 - BLOCK
      ?auto_816343 - BLOCK
      ?auto_816344 - BLOCK
      ?auto_816345 - BLOCK
    )
    :vars
    (
      ?auto_816346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_816344 ) ( ON ?auto_816345 ?auto_816346 ) ( CLEAR ?auto_816345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_816329 ) ( ON ?auto_816330 ?auto_816329 ) ( ON ?auto_816331 ?auto_816330 ) ( ON ?auto_816332 ?auto_816331 ) ( ON ?auto_816333 ?auto_816332 ) ( ON ?auto_816334 ?auto_816333 ) ( ON ?auto_816335 ?auto_816334 ) ( ON ?auto_816336 ?auto_816335 ) ( ON ?auto_816337 ?auto_816336 ) ( ON ?auto_816338 ?auto_816337 ) ( ON ?auto_816339 ?auto_816338 ) ( ON ?auto_816340 ?auto_816339 ) ( ON ?auto_816341 ?auto_816340 ) ( ON ?auto_816342 ?auto_816341 ) ( ON ?auto_816343 ?auto_816342 ) ( ON ?auto_816344 ?auto_816343 ) ( not ( = ?auto_816329 ?auto_816330 ) ) ( not ( = ?auto_816329 ?auto_816331 ) ) ( not ( = ?auto_816329 ?auto_816332 ) ) ( not ( = ?auto_816329 ?auto_816333 ) ) ( not ( = ?auto_816329 ?auto_816334 ) ) ( not ( = ?auto_816329 ?auto_816335 ) ) ( not ( = ?auto_816329 ?auto_816336 ) ) ( not ( = ?auto_816329 ?auto_816337 ) ) ( not ( = ?auto_816329 ?auto_816338 ) ) ( not ( = ?auto_816329 ?auto_816339 ) ) ( not ( = ?auto_816329 ?auto_816340 ) ) ( not ( = ?auto_816329 ?auto_816341 ) ) ( not ( = ?auto_816329 ?auto_816342 ) ) ( not ( = ?auto_816329 ?auto_816343 ) ) ( not ( = ?auto_816329 ?auto_816344 ) ) ( not ( = ?auto_816329 ?auto_816345 ) ) ( not ( = ?auto_816329 ?auto_816346 ) ) ( not ( = ?auto_816330 ?auto_816331 ) ) ( not ( = ?auto_816330 ?auto_816332 ) ) ( not ( = ?auto_816330 ?auto_816333 ) ) ( not ( = ?auto_816330 ?auto_816334 ) ) ( not ( = ?auto_816330 ?auto_816335 ) ) ( not ( = ?auto_816330 ?auto_816336 ) ) ( not ( = ?auto_816330 ?auto_816337 ) ) ( not ( = ?auto_816330 ?auto_816338 ) ) ( not ( = ?auto_816330 ?auto_816339 ) ) ( not ( = ?auto_816330 ?auto_816340 ) ) ( not ( = ?auto_816330 ?auto_816341 ) ) ( not ( = ?auto_816330 ?auto_816342 ) ) ( not ( = ?auto_816330 ?auto_816343 ) ) ( not ( = ?auto_816330 ?auto_816344 ) ) ( not ( = ?auto_816330 ?auto_816345 ) ) ( not ( = ?auto_816330 ?auto_816346 ) ) ( not ( = ?auto_816331 ?auto_816332 ) ) ( not ( = ?auto_816331 ?auto_816333 ) ) ( not ( = ?auto_816331 ?auto_816334 ) ) ( not ( = ?auto_816331 ?auto_816335 ) ) ( not ( = ?auto_816331 ?auto_816336 ) ) ( not ( = ?auto_816331 ?auto_816337 ) ) ( not ( = ?auto_816331 ?auto_816338 ) ) ( not ( = ?auto_816331 ?auto_816339 ) ) ( not ( = ?auto_816331 ?auto_816340 ) ) ( not ( = ?auto_816331 ?auto_816341 ) ) ( not ( = ?auto_816331 ?auto_816342 ) ) ( not ( = ?auto_816331 ?auto_816343 ) ) ( not ( = ?auto_816331 ?auto_816344 ) ) ( not ( = ?auto_816331 ?auto_816345 ) ) ( not ( = ?auto_816331 ?auto_816346 ) ) ( not ( = ?auto_816332 ?auto_816333 ) ) ( not ( = ?auto_816332 ?auto_816334 ) ) ( not ( = ?auto_816332 ?auto_816335 ) ) ( not ( = ?auto_816332 ?auto_816336 ) ) ( not ( = ?auto_816332 ?auto_816337 ) ) ( not ( = ?auto_816332 ?auto_816338 ) ) ( not ( = ?auto_816332 ?auto_816339 ) ) ( not ( = ?auto_816332 ?auto_816340 ) ) ( not ( = ?auto_816332 ?auto_816341 ) ) ( not ( = ?auto_816332 ?auto_816342 ) ) ( not ( = ?auto_816332 ?auto_816343 ) ) ( not ( = ?auto_816332 ?auto_816344 ) ) ( not ( = ?auto_816332 ?auto_816345 ) ) ( not ( = ?auto_816332 ?auto_816346 ) ) ( not ( = ?auto_816333 ?auto_816334 ) ) ( not ( = ?auto_816333 ?auto_816335 ) ) ( not ( = ?auto_816333 ?auto_816336 ) ) ( not ( = ?auto_816333 ?auto_816337 ) ) ( not ( = ?auto_816333 ?auto_816338 ) ) ( not ( = ?auto_816333 ?auto_816339 ) ) ( not ( = ?auto_816333 ?auto_816340 ) ) ( not ( = ?auto_816333 ?auto_816341 ) ) ( not ( = ?auto_816333 ?auto_816342 ) ) ( not ( = ?auto_816333 ?auto_816343 ) ) ( not ( = ?auto_816333 ?auto_816344 ) ) ( not ( = ?auto_816333 ?auto_816345 ) ) ( not ( = ?auto_816333 ?auto_816346 ) ) ( not ( = ?auto_816334 ?auto_816335 ) ) ( not ( = ?auto_816334 ?auto_816336 ) ) ( not ( = ?auto_816334 ?auto_816337 ) ) ( not ( = ?auto_816334 ?auto_816338 ) ) ( not ( = ?auto_816334 ?auto_816339 ) ) ( not ( = ?auto_816334 ?auto_816340 ) ) ( not ( = ?auto_816334 ?auto_816341 ) ) ( not ( = ?auto_816334 ?auto_816342 ) ) ( not ( = ?auto_816334 ?auto_816343 ) ) ( not ( = ?auto_816334 ?auto_816344 ) ) ( not ( = ?auto_816334 ?auto_816345 ) ) ( not ( = ?auto_816334 ?auto_816346 ) ) ( not ( = ?auto_816335 ?auto_816336 ) ) ( not ( = ?auto_816335 ?auto_816337 ) ) ( not ( = ?auto_816335 ?auto_816338 ) ) ( not ( = ?auto_816335 ?auto_816339 ) ) ( not ( = ?auto_816335 ?auto_816340 ) ) ( not ( = ?auto_816335 ?auto_816341 ) ) ( not ( = ?auto_816335 ?auto_816342 ) ) ( not ( = ?auto_816335 ?auto_816343 ) ) ( not ( = ?auto_816335 ?auto_816344 ) ) ( not ( = ?auto_816335 ?auto_816345 ) ) ( not ( = ?auto_816335 ?auto_816346 ) ) ( not ( = ?auto_816336 ?auto_816337 ) ) ( not ( = ?auto_816336 ?auto_816338 ) ) ( not ( = ?auto_816336 ?auto_816339 ) ) ( not ( = ?auto_816336 ?auto_816340 ) ) ( not ( = ?auto_816336 ?auto_816341 ) ) ( not ( = ?auto_816336 ?auto_816342 ) ) ( not ( = ?auto_816336 ?auto_816343 ) ) ( not ( = ?auto_816336 ?auto_816344 ) ) ( not ( = ?auto_816336 ?auto_816345 ) ) ( not ( = ?auto_816336 ?auto_816346 ) ) ( not ( = ?auto_816337 ?auto_816338 ) ) ( not ( = ?auto_816337 ?auto_816339 ) ) ( not ( = ?auto_816337 ?auto_816340 ) ) ( not ( = ?auto_816337 ?auto_816341 ) ) ( not ( = ?auto_816337 ?auto_816342 ) ) ( not ( = ?auto_816337 ?auto_816343 ) ) ( not ( = ?auto_816337 ?auto_816344 ) ) ( not ( = ?auto_816337 ?auto_816345 ) ) ( not ( = ?auto_816337 ?auto_816346 ) ) ( not ( = ?auto_816338 ?auto_816339 ) ) ( not ( = ?auto_816338 ?auto_816340 ) ) ( not ( = ?auto_816338 ?auto_816341 ) ) ( not ( = ?auto_816338 ?auto_816342 ) ) ( not ( = ?auto_816338 ?auto_816343 ) ) ( not ( = ?auto_816338 ?auto_816344 ) ) ( not ( = ?auto_816338 ?auto_816345 ) ) ( not ( = ?auto_816338 ?auto_816346 ) ) ( not ( = ?auto_816339 ?auto_816340 ) ) ( not ( = ?auto_816339 ?auto_816341 ) ) ( not ( = ?auto_816339 ?auto_816342 ) ) ( not ( = ?auto_816339 ?auto_816343 ) ) ( not ( = ?auto_816339 ?auto_816344 ) ) ( not ( = ?auto_816339 ?auto_816345 ) ) ( not ( = ?auto_816339 ?auto_816346 ) ) ( not ( = ?auto_816340 ?auto_816341 ) ) ( not ( = ?auto_816340 ?auto_816342 ) ) ( not ( = ?auto_816340 ?auto_816343 ) ) ( not ( = ?auto_816340 ?auto_816344 ) ) ( not ( = ?auto_816340 ?auto_816345 ) ) ( not ( = ?auto_816340 ?auto_816346 ) ) ( not ( = ?auto_816341 ?auto_816342 ) ) ( not ( = ?auto_816341 ?auto_816343 ) ) ( not ( = ?auto_816341 ?auto_816344 ) ) ( not ( = ?auto_816341 ?auto_816345 ) ) ( not ( = ?auto_816341 ?auto_816346 ) ) ( not ( = ?auto_816342 ?auto_816343 ) ) ( not ( = ?auto_816342 ?auto_816344 ) ) ( not ( = ?auto_816342 ?auto_816345 ) ) ( not ( = ?auto_816342 ?auto_816346 ) ) ( not ( = ?auto_816343 ?auto_816344 ) ) ( not ( = ?auto_816343 ?auto_816345 ) ) ( not ( = ?auto_816343 ?auto_816346 ) ) ( not ( = ?auto_816344 ?auto_816345 ) ) ( not ( = ?auto_816344 ?auto_816346 ) ) ( not ( = ?auto_816345 ?auto_816346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_816345 ?auto_816346 )
      ( !STACK ?auto_816345 ?auto_816344 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816399 - BLOCK
      ?auto_816400 - BLOCK
      ?auto_816401 - BLOCK
      ?auto_816402 - BLOCK
      ?auto_816403 - BLOCK
      ?auto_816404 - BLOCK
      ?auto_816405 - BLOCK
      ?auto_816406 - BLOCK
      ?auto_816407 - BLOCK
      ?auto_816408 - BLOCK
      ?auto_816409 - BLOCK
      ?auto_816410 - BLOCK
      ?auto_816411 - BLOCK
      ?auto_816412 - BLOCK
      ?auto_816413 - BLOCK
      ?auto_816414 - BLOCK
      ?auto_816415 - BLOCK
    )
    :vars
    (
      ?auto_816416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816415 ?auto_816416 ) ( ON-TABLE ?auto_816399 ) ( ON ?auto_816400 ?auto_816399 ) ( ON ?auto_816401 ?auto_816400 ) ( ON ?auto_816402 ?auto_816401 ) ( ON ?auto_816403 ?auto_816402 ) ( ON ?auto_816404 ?auto_816403 ) ( ON ?auto_816405 ?auto_816404 ) ( ON ?auto_816406 ?auto_816405 ) ( ON ?auto_816407 ?auto_816406 ) ( ON ?auto_816408 ?auto_816407 ) ( ON ?auto_816409 ?auto_816408 ) ( ON ?auto_816410 ?auto_816409 ) ( ON ?auto_816411 ?auto_816410 ) ( ON ?auto_816412 ?auto_816411 ) ( ON ?auto_816413 ?auto_816412 ) ( not ( = ?auto_816399 ?auto_816400 ) ) ( not ( = ?auto_816399 ?auto_816401 ) ) ( not ( = ?auto_816399 ?auto_816402 ) ) ( not ( = ?auto_816399 ?auto_816403 ) ) ( not ( = ?auto_816399 ?auto_816404 ) ) ( not ( = ?auto_816399 ?auto_816405 ) ) ( not ( = ?auto_816399 ?auto_816406 ) ) ( not ( = ?auto_816399 ?auto_816407 ) ) ( not ( = ?auto_816399 ?auto_816408 ) ) ( not ( = ?auto_816399 ?auto_816409 ) ) ( not ( = ?auto_816399 ?auto_816410 ) ) ( not ( = ?auto_816399 ?auto_816411 ) ) ( not ( = ?auto_816399 ?auto_816412 ) ) ( not ( = ?auto_816399 ?auto_816413 ) ) ( not ( = ?auto_816399 ?auto_816414 ) ) ( not ( = ?auto_816399 ?auto_816415 ) ) ( not ( = ?auto_816399 ?auto_816416 ) ) ( not ( = ?auto_816400 ?auto_816401 ) ) ( not ( = ?auto_816400 ?auto_816402 ) ) ( not ( = ?auto_816400 ?auto_816403 ) ) ( not ( = ?auto_816400 ?auto_816404 ) ) ( not ( = ?auto_816400 ?auto_816405 ) ) ( not ( = ?auto_816400 ?auto_816406 ) ) ( not ( = ?auto_816400 ?auto_816407 ) ) ( not ( = ?auto_816400 ?auto_816408 ) ) ( not ( = ?auto_816400 ?auto_816409 ) ) ( not ( = ?auto_816400 ?auto_816410 ) ) ( not ( = ?auto_816400 ?auto_816411 ) ) ( not ( = ?auto_816400 ?auto_816412 ) ) ( not ( = ?auto_816400 ?auto_816413 ) ) ( not ( = ?auto_816400 ?auto_816414 ) ) ( not ( = ?auto_816400 ?auto_816415 ) ) ( not ( = ?auto_816400 ?auto_816416 ) ) ( not ( = ?auto_816401 ?auto_816402 ) ) ( not ( = ?auto_816401 ?auto_816403 ) ) ( not ( = ?auto_816401 ?auto_816404 ) ) ( not ( = ?auto_816401 ?auto_816405 ) ) ( not ( = ?auto_816401 ?auto_816406 ) ) ( not ( = ?auto_816401 ?auto_816407 ) ) ( not ( = ?auto_816401 ?auto_816408 ) ) ( not ( = ?auto_816401 ?auto_816409 ) ) ( not ( = ?auto_816401 ?auto_816410 ) ) ( not ( = ?auto_816401 ?auto_816411 ) ) ( not ( = ?auto_816401 ?auto_816412 ) ) ( not ( = ?auto_816401 ?auto_816413 ) ) ( not ( = ?auto_816401 ?auto_816414 ) ) ( not ( = ?auto_816401 ?auto_816415 ) ) ( not ( = ?auto_816401 ?auto_816416 ) ) ( not ( = ?auto_816402 ?auto_816403 ) ) ( not ( = ?auto_816402 ?auto_816404 ) ) ( not ( = ?auto_816402 ?auto_816405 ) ) ( not ( = ?auto_816402 ?auto_816406 ) ) ( not ( = ?auto_816402 ?auto_816407 ) ) ( not ( = ?auto_816402 ?auto_816408 ) ) ( not ( = ?auto_816402 ?auto_816409 ) ) ( not ( = ?auto_816402 ?auto_816410 ) ) ( not ( = ?auto_816402 ?auto_816411 ) ) ( not ( = ?auto_816402 ?auto_816412 ) ) ( not ( = ?auto_816402 ?auto_816413 ) ) ( not ( = ?auto_816402 ?auto_816414 ) ) ( not ( = ?auto_816402 ?auto_816415 ) ) ( not ( = ?auto_816402 ?auto_816416 ) ) ( not ( = ?auto_816403 ?auto_816404 ) ) ( not ( = ?auto_816403 ?auto_816405 ) ) ( not ( = ?auto_816403 ?auto_816406 ) ) ( not ( = ?auto_816403 ?auto_816407 ) ) ( not ( = ?auto_816403 ?auto_816408 ) ) ( not ( = ?auto_816403 ?auto_816409 ) ) ( not ( = ?auto_816403 ?auto_816410 ) ) ( not ( = ?auto_816403 ?auto_816411 ) ) ( not ( = ?auto_816403 ?auto_816412 ) ) ( not ( = ?auto_816403 ?auto_816413 ) ) ( not ( = ?auto_816403 ?auto_816414 ) ) ( not ( = ?auto_816403 ?auto_816415 ) ) ( not ( = ?auto_816403 ?auto_816416 ) ) ( not ( = ?auto_816404 ?auto_816405 ) ) ( not ( = ?auto_816404 ?auto_816406 ) ) ( not ( = ?auto_816404 ?auto_816407 ) ) ( not ( = ?auto_816404 ?auto_816408 ) ) ( not ( = ?auto_816404 ?auto_816409 ) ) ( not ( = ?auto_816404 ?auto_816410 ) ) ( not ( = ?auto_816404 ?auto_816411 ) ) ( not ( = ?auto_816404 ?auto_816412 ) ) ( not ( = ?auto_816404 ?auto_816413 ) ) ( not ( = ?auto_816404 ?auto_816414 ) ) ( not ( = ?auto_816404 ?auto_816415 ) ) ( not ( = ?auto_816404 ?auto_816416 ) ) ( not ( = ?auto_816405 ?auto_816406 ) ) ( not ( = ?auto_816405 ?auto_816407 ) ) ( not ( = ?auto_816405 ?auto_816408 ) ) ( not ( = ?auto_816405 ?auto_816409 ) ) ( not ( = ?auto_816405 ?auto_816410 ) ) ( not ( = ?auto_816405 ?auto_816411 ) ) ( not ( = ?auto_816405 ?auto_816412 ) ) ( not ( = ?auto_816405 ?auto_816413 ) ) ( not ( = ?auto_816405 ?auto_816414 ) ) ( not ( = ?auto_816405 ?auto_816415 ) ) ( not ( = ?auto_816405 ?auto_816416 ) ) ( not ( = ?auto_816406 ?auto_816407 ) ) ( not ( = ?auto_816406 ?auto_816408 ) ) ( not ( = ?auto_816406 ?auto_816409 ) ) ( not ( = ?auto_816406 ?auto_816410 ) ) ( not ( = ?auto_816406 ?auto_816411 ) ) ( not ( = ?auto_816406 ?auto_816412 ) ) ( not ( = ?auto_816406 ?auto_816413 ) ) ( not ( = ?auto_816406 ?auto_816414 ) ) ( not ( = ?auto_816406 ?auto_816415 ) ) ( not ( = ?auto_816406 ?auto_816416 ) ) ( not ( = ?auto_816407 ?auto_816408 ) ) ( not ( = ?auto_816407 ?auto_816409 ) ) ( not ( = ?auto_816407 ?auto_816410 ) ) ( not ( = ?auto_816407 ?auto_816411 ) ) ( not ( = ?auto_816407 ?auto_816412 ) ) ( not ( = ?auto_816407 ?auto_816413 ) ) ( not ( = ?auto_816407 ?auto_816414 ) ) ( not ( = ?auto_816407 ?auto_816415 ) ) ( not ( = ?auto_816407 ?auto_816416 ) ) ( not ( = ?auto_816408 ?auto_816409 ) ) ( not ( = ?auto_816408 ?auto_816410 ) ) ( not ( = ?auto_816408 ?auto_816411 ) ) ( not ( = ?auto_816408 ?auto_816412 ) ) ( not ( = ?auto_816408 ?auto_816413 ) ) ( not ( = ?auto_816408 ?auto_816414 ) ) ( not ( = ?auto_816408 ?auto_816415 ) ) ( not ( = ?auto_816408 ?auto_816416 ) ) ( not ( = ?auto_816409 ?auto_816410 ) ) ( not ( = ?auto_816409 ?auto_816411 ) ) ( not ( = ?auto_816409 ?auto_816412 ) ) ( not ( = ?auto_816409 ?auto_816413 ) ) ( not ( = ?auto_816409 ?auto_816414 ) ) ( not ( = ?auto_816409 ?auto_816415 ) ) ( not ( = ?auto_816409 ?auto_816416 ) ) ( not ( = ?auto_816410 ?auto_816411 ) ) ( not ( = ?auto_816410 ?auto_816412 ) ) ( not ( = ?auto_816410 ?auto_816413 ) ) ( not ( = ?auto_816410 ?auto_816414 ) ) ( not ( = ?auto_816410 ?auto_816415 ) ) ( not ( = ?auto_816410 ?auto_816416 ) ) ( not ( = ?auto_816411 ?auto_816412 ) ) ( not ( = ?auto_816411 ?auto_816413 ) ) ( not ( = ?auto_816411 ?auto_816414 ) ) ( not ( = ?auto_816411 ?auto_816415 ) ) ( not ( = ?auto_816411 ?auto_816416 ) ) ( not ( = ?auto_816412 ?auto_816413 ) ) ( not ( = ?auto_816412 ?auto_816414 ) ) ( not ( = ?auto_816412 ?auto_816415 ) ) ( not ( = ?auto_816412 ?auto_816416 ) ) ( not ( = ?auto_816413 ?auto_816414 ) ) ( not ( = ?auto_816413 ?auto_816415 ) ) ( not ( = ?auto_816413 ?auto_816416 ) ) ( not ( = ?auto_816414 ?auto_816415 ) ) ( not ( = ?auto_816414 ?auto_816416 ) ) ( not ( = ?auto_816415 ?auto_816416 ) ) ( CLEAR ?auto_816413 ) ( ON ?auto_816414 ?auto_816415 ) ( CLEAR ?auto_816414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_816399 ?auto_816400 ?auto_816401 ?auto_816402 ?auto_816403 ?auto_816404 ?auto_816405 ?auto_816406 ?auto_816407 ?auto_816408 ?auto_816409 ?auto_816410 ?auto_816411 ?auto_816412 ?auto_816413 ?auto_816414 )
      ( MAKE-17PILE ?auto_816399 ?auto_816400 ?auto_816401 ?auto_816402 ?auto_816403 ?auto_816404 ?auto_816405 ?auto_816406 ?auto_816407 ?auto_816408 ?auto_816409 ?auto_816410 ?auto_816411 ?auto_816412 ?auto_816413 ?auto_816414 ?auto_816415 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816469 - BLOCK
      ?auto_816470 - BLOCK
      ?auto_816471 - BLOCK
      ?auto_816472 - BLOCK
      ?auto_816473 - BLOCK
      ?auto_816474 - BLOCK
      ?auto_816475 - BLOCK
      ?auto_816476 - BLOCK
      ?auto_816477 - BLOCK
      ?auto_816478 - BLOCK
      ?auto_816479 - BLOCK
      ?auto_816480 - BLOCK
      ?auto_816481 - BLOCK
      ?auto_816482 - BLOCK
      ?auto_816483 - BLOCK
      ?auto_816484 - BLOCK
      ?auto_816485 - BLOCK
    )
    :vars
    (
      ?auto_816486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816485 ?auto_816486 ) ( ON-TABLE ?auto_816469 ) ( ON ?auto_816470 ?auto_816469 ) ( ON ?auto_816471 ?auto_816470 ) ( ON ?auto_816472 ?auto_816471 ) ( ON ?auto_816473 ?auto_816472 ) ( ON ?auto_816474 ?auto_816473 ) ( ON ?auto_816475 ?auto_816474 ) ( ON ?auto_816476 ?auto_816475 ) ( ON ?auto_816477 ?auto_816476 ) ( ON ?auto_816478 ?auto_816477 ) ( ON ?auto_816479 ?auto_816478 ) ( ON ?auto_816480 ?auto_816479 ) ( ON ?auto_816481 ?auto_816480 ) ( ON ?auto_816482 ?auto_816481 ) ( not ( = ?auto_816469 ?auto_816470 ) ) ( not ( = ?auto_816469 ?auto_816471 ) ) ( not ( = ?auto_816469 ?auto_816472 ) ) ( not ( = ?auto_816469 ?auto_816473 ) ) ( not ( = ?auto_816469 ?auto_816474 ) ) ( not ( = ?auto_816469 ?auto_816475 ) ) ( not ( = ?auto_816469 ?auto_816476 ) ) ( not ( = ?auto_816469 ?auto_816477 ) ) ( not ( = ?auto_816469 ?auto_816478 ) ) ( not ( = ?auto_816469 ?auto_816479 ) ) ( not ( = ?auto_816469 ?auto_816480 ) ) ( not ( = ?auto_816469 ?auto_816481 ) ) ( not ( = ?auto_816469 ?auto_816482 ) ) ( not ( = ?auto_816469 ?auto_816483 ) ) ( not ( = ?auto_816469 ?auto_816484 ) ) ( not ( = ?auto_816469 ?auto_816485 ) ) ( not ( = ?auto_816469 ?auto_816486 ) ) ( not ( = ?auto_816470 ?auto_816471 ) ) ( not ( = ?auto_816470 ?auto_816472 ) ) ( not ( = ?auto_816470 ?auto_816473 ) ) ( not ( = ?auto_816470 ?auto_816474 ) ) ( not ( = ?auto_816470 ?auto_816475 ) ) ( not ( = ?auto_816470 ?auto_816476 ) ) ( not ( = ?auto_816470 ?auto_816477 ) ) ( not ( = ?auto_816470 ?auto_816478 ) ) ( not ( = ?auto_816470 ?auto_816479 ) ) ( not ( = ?auto_816470 ?auto_816480 ) ) ( not ( = ?auto_816470 ?auto_816481 ) ) ( not ( = ?auto_816470 ?auto_816482 ) ) ( not ( = ?auto_816470 ?auto_816483 ) ) ( not ( = ?auto_816470 ?auto_816484 ) ) ( not ( = ?auto_816470 ?auto_816485 ) ) ( not ( = ?auto_816470 ?auto_816486 ) ) ( not ( = ?auto_816471 ?auto_816472 ) ) ( not ( = ?auto_816471 ?auto_816473 ) ) ( not ( = ?auto_816471 ?auto_816474 ) ) ( not ( = ?auto_816471 ?auto_816475 ) ) ( not ( = ?auto_816471 ?auto_816476 ) ) ( not ( = ?auto_816471 ?auto_816477 ) ) ( not ( = ?auto_816471 ?auto_816478 ) ) ( not ( = ?auto_816471 ?auto_816479 ) ) ( not ( = ?auto_816471 ?auto_816480 ) ) ( not ( = ?auto_816471 ?auto_816481 ) ) ( not ( = ?auto_816471 ?auto_816482 ) ) ( not ( = ?auto_816471 ?auto_816483 ) ) ( not ( = ?auto_816471 ?auto_816484 ) ) ( not ( = ?auto_816471 ?auto_816485 ) ) ( not ( = ?auto_816471 ?auto_816486 ) ) ( not ( = ?auto_816472 ?auto_816473 ) ) ( not ( = ?auto_816472 ?auto_816474 ) ) ( not ( = ?auto_816472 ?auto_816475 ) ) ( not ( = ?auto_816472 ?auto_816476 ) ) ( not ( = ?auto_816472 ?auto_816477 ) ) ( not ( = ?auto_816472 ?auto_816478 ) ) ( not ( = ?auto_816472 ?auto_816479 ) ) ( not ( = ?auto_816472 ?auto_816480 ) ) ( not ( = ?auto_816472 ?auto_816481 ) ) ( not ( = ?auto_816472 ?auto_816482 ) ) ( not ( = ?auto_816472 ?auto_816483 ) ) ( not ( = ?auto_816472 ?auto_816484 ) ) ( not ( = ?auto_816472 ?auto_816485 ) ) ( not ( = ?auto_816472 ?auto_816486 ) ) ( not ( = ?auto_816473 ?auto_816474 ) ) ( not ( = ?auto_816473 ?auto_816475 ) ) ( not ( = ?auto_816473 ?auto_816476 ) ) ( not ( = ?auto_816473 ?auto_816477 ) ) ( not ( = ?auto_816473 ?auto_816478 ) ) ( not ( = ?auto_816473 ?auto_816479 ) ) ( not ( = ?auto_816473 ?auto_816480 ) ) ( not ( = ?auto_816473 ?auto_816481 ) ) ( not ( = ?auto_816473 ?auto_816482 ) ) ( not ( = ?auto_816473 ?auto_816483 ) ) ( not ( = ?auto_816473 ?auto_816484 ) ) ( not ( = ?auto_816473 ?auto_816485 ) ) ( not ( = ?auto_816473 ?auto_816486 ) ) ( not ( = ?auto_816474 ?auto_816475 ) ) ( not ( = ?auto_816474 ?auto_816476 ) ) ( not ( = ?auto_816474 ?auto_816477 ) ) ( not ( = ?auto_816474 ?auto_816478 ) ) ( not ( = ?auto_816474 ?auto_816479 ) ) ( not ( = ?auto_816474 ?auto_816480 ) ) ( not ( = ?auto_816474 ?auto_816481 ) ) ( not ( = ?auto_816474 ?auto_816482 ) ) ( not ( = ?auto_816474 ?auto_816483 ) ) ( not ( = ?auto_816474 ?auto_816484 ) ) ( not ( = ?auto_816474 ?auto_816485 ) ) ( not ( = ?auto_816474 ?auto_816486 ) ) ( not ( = ?auto_816475 ?auto_816476 ) ) ( not ( = ?auto_816475 ?auto_816477 ) ) ( not ( = ?auto_816475 ?auto_816478 ) ) ( not ( = ?auto_816475 ?auto_816479 ) ) ( not ( = ?auto_816475 ?auto_816480 ) ) ( not ( = ?auto_816475 ?auto_816481 ) ) ( not ( = ?auto_816475 ?auto_816482 ) ) ( not ( = ?auto_816475 ?auto_816483 ) ) ( not ( = ?auto_816475 ?auto_816484 ) ) ( not ( = ?auto_816475 ?auto_816485 ) ) ( not ( = ?auto_816475 ?auto_816486 ) ) ( not ( = ?auto_816476 ?auto_816477 ) ) ( not ( = ?auto_816476 ?auto_816478 ) ) ( not ( = ?auto_816476 ?auto_816479 ) ) ( not ( = ?auto_816476 ?auto_816480 ) ) ( not ( = ?auto_816476 ?auto_816481 ) ) ( not ( = ?auto_816476 ?auto_816482 ) ) ( not ( = ?auto_816476 ?auto_816483 ) ) ( not ( = ?auto_816476 ?auto_816484 ) ) ( not ( = ?auto_816476 ?auto_816485 ) ) ( not ( = ?auto_816476 ?auto_816486 ) ) ( not ( = ?auto_816477 ?auto_816478 ) ) ( not ( = ?auto_816477 ?auto_816479 ) ) ( not ( = ?auto_816477 ?auto_816480 ) ) ( not ( = ?auto_816477 ?auto_816481 ) ) ( not ( = ?auto_816477 ?auto_816482 ) ) ( not ( = ?auto_816477 ?auto_816483 ) ) ( not ( = ?auto_816477 ?auto_816484 ) ) ( not ( = ?auto_816477 ?auto_816485 ) ) ( not ( = ?auto_816477 ?auto_816486 ) ) ( not ( = ?auto_816478 ?auto_816479 ) ) ( not ( = ?auto_816478 ?auto_816480 ) ) ( not ( = ?auto_816478 ?auto_816481 ) ) ( not ( = ?auto_816478 ?auto_816482 ) ) ( not ( = ?auto_816478 ?auto_816483 ) ) ( not ( = ?auto_816478 ?auto_816484 ) ) ( not ( = ?auto_816478 ?auto_816485 ) ) ( not ( = ?auto_816478 ?auto_816486 ) ) ( not ( = ?auto_816479 ?auto_816480 ) ) ( not ( = ?auto_816479 ?auto_816481 ) ) ( not ( = ?auto_816479 ?auto_816482 ) ) ( not ( = ?auto_816479 ?auto_816483 ) ) ( not ( = ?auto_816479 ?auto_816484 ) ) ( not ( = ?auto_816479 ?auto_816485 ) ) ( not ( = ?auto_816479 ?auto_816486 ) ) ( not ( = ?auto_816480 ?auto_816481 ) ) ( not ( = ?auto_816480 ?auto_816482 ) ) ( not ( = ?auto_816480 ?auto_816483 ) ) ( not ( = ?auto_816480 ?auto_816484 ) ) ( not ( = ?auto_816480 ?auto_816485 ) ) ( not ( = ?auto_816480 ?auto_816486 ) ) ( not ( = ?auto_816481 ?auto_816482 ) ) ( not ( = ?auto_816481 ?auto_816483 ) ) ( not ( = ?auto_816481 ?auto_816484 ) ) ( not ( = ?auto_816481 ?auto_816485 ) ) ( not ( = ?auto_816481 ?auto_816486 ) ) ( not ( = ?auto_816482 ?auto_816483 ) ) ( not ( = ?auto_816482 ?auto_816484 ) ) ( not ( = ?auto_816482 ?auto_816485 ) ) ( not ( = ?auto_816482 ?auto_816486 ) ) ( not ( = ?auto_816483 ?auto_816484 ) ) ( not ( = ?auto_816483 ?auto_816485 ) ) ( not ( = ?auto_816483 ?auto_816486 ) ) ( not ( = ?auto_816484 ?auto_816485 ) ) ( not ( = ?auto_816484 ?auto_816486 ) ) ( not ( = ?auto_816485 ?auto_816486 ) ) ( ON ?auto_816484 ?auto_816485 ) ( CLEAR ?auto_816482 ) ( ON ?auto_816483 ?auto_816484 ) ( CLEAR ?auto_816483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_816469 ?auto_816470 ?auto_816471 ?auto_816472 ?auto_816473 ?auto_816474 ?auto_816475 ?auto_816476 ?auto_816477 ?auto_816478 ?auto_816479 ?auto_816480 ?auto_816481 ?auto_816482 ?auto_816483 )
      ( MAKE-17PILE ?auto_816469 ?auto_816470 ?auto_816471 ?auto_816472 ?auto_816473 ?auto_816474 ?auto_816475 ?auto_816476 ?auto_816477 ?auto_816478 ?auto_816479 ?auto_816480 ?auto_816481 ?auto_816482 ?auto_816483 ?auto_816484 ?auto_816485 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816539 - BLOCK
      ?auto_816540 - BLOCK
      ?auto_816541 - BLOCK
      ?auto_816542 - BLOCK
      ?auto_816543 - BLOCK
      ?auto_816544 - BLOCK
      ?auto_816545 - BLOCK
      ?auto_816546 - BLOCK
      ?auto_816547 - BLOCK
      ?auto_816548 - BLOCK
      ?auto_816549 - BLOCK
      ?auto_816550 - BLOCK
      ?auto_816551 - BLOCK
      ?auto_816552 - BLOCK
      ?auto_816553 - BLOCK
      ?auto_816554 - BLOCK
      ?auto_816555 - BLOCK
    )
    :vars
    (
      ?auto_816556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816555 ?auto_816556 ) ( ON-TABLE ?auto_816539 ) ( ON ?auto_816540 ?auto_816539 ) ( ON ?auto_816541 ?auto_816540 ) ( ON ?auto_816542 ?auto_816541 ) ( ON ?auto_816543 ?auto_816542 ) ( ON ?auto_816544 ?auto_816543 ) ( ON ?auto_816545 ?auto_816544 ) ( ON ?auto_816546 ?auto_816545 ) ( ON ?auto_816547 ?auto_816546 ) ( ON ?auto_816548 ?auto_816547 ) ( ON ?auto_816549 ?auto_816548 ) ( ON ?auto_816550 ?auto_816549 ) ( ON ?auto_816551 ?auto_816550 ) ( not ( = ?auto_816539 ?auto_816540 ) ) ( not ( = ?auto_816539 ?auto_816541 ) ) ( not ( = ?auto_816539 ?auto_816542 ) ) ( not ( = ?auto_816539 ?auto_816543 ) ) ( not ( = ?auto_816539 ?auto_816544 ) ) ( not ( = ?auto_816539 ?auto_816545 ) ) ( not ( = ?auto_816539 ?auto_816546 ) ) ( not ( = ?auto_816539 ?auto_816547 ) ) ( not ( = ?auto_816539 ?auto_816548 ) ) ( not ( = ?auto_816539 ?auto_816549 ) ) ( not ( = ?auto_816539 ?auto_816550 ) ) ( not ( = ?auto_816539 ?auto_816551 ) ) ( not ( = ?auto_816539 ?auto_816552 ) ) ( not ( = ?auto_816539 ?auto_816553 ) ) ( not ( = ?auto_816539 ?auto_816554 ) ) ( not ( = ?auto_816539 ?auto_816555 ) ) ( not ( = ?auto_816539 ?auto_816556 ) ) ( not ( = ?auto_816540 ?auto_816541 ) ) ( not ( = ?auto_816540 ?auto_816542 ) ) ( not ( = ?auto_816540 ?auto_816543 ) ) ( not ( = ?auto_816540 ?auto_816544 ) ) ( not ( = ?auto_816540 ?auto_816545 ) ) ( not ( = ?auto_816540 ?auto_816546 ) ) ( not ( = ?auto_816540 ?auto_816547 ) ) ( not ( = ?auto_816540 ?auto_816548 ) ) ( not ( = ?auto_816540 ?auto_816549 ) ) ( not ( = ?auto_816540 ?auto_816550 ) ) ( not ( = ?auto_816540 ?auto_816551 ) ) ( not ( = ?auto_816540 ?auto_816552 ) ) ( not ( = ?auto_816540 ?auto_816553 ) ) ( not ( = ?auto_816540 ?auto_816554 ) ) ( not ( = ?auto_816540 ?auto_816555 ) ) ( not ( = ?auto_816540 ?auto_816556 ) ) ( not ( = ?auto_816541 ?auto_816542 ) ) ( not ( = ?auto_816541 ?auto_816543 ) ) ( not ( = ?auto_816541 ?auto_816544 ) ) ( not ( = ?auto_816541 ?auto_816545 ) ) ( not ( = ?auto_816541 ?auto_816546 ) ) ( not ( = ?auto_816541 ?auto_816547 ) ) ( not ( = ?auto_816541 ?auto_816548 ) ) ( not ( = ?auto_816541 ?auto_816549 ) ) ( not ( = ?auto_816541 ?auto_816550 ) ) ( not ( = ?auto_816541 ?auto_816551 ) ) ( not ( = ?auto_816541 ?auto_816552 ) ) ( not ( = ?auto_816541 ?auto_816553 ) ) ( not ( = ?auto_816541 ?auto_816554 ) ) ( not ( = ?auto_816541 ?auto_816555 ) ) ( not ( = ?auto_816541 ?auto_816556 ) ) ( not ( = ?auto_816542 ?auto_816543 ) ) ( not ( = ?auto_816542 ?auto_816544 ) ) ( not ( = ?auto_816542 ?auto_816545 ) ) ( not ( = ?auto_816542 ?auto_816546 ) ) ( not ( = ?auto_816542 ?auto_816547 ) ) ( not ( = ?auto_816542 ?auto_816548 ) ) ( not ( = ?auto_816542 ?auto_816549 ) ) ( not ( = ?auto_816542 ?auto_816550 ) ) ( not ( = ?auto_816542 ?auto_816551 ) ) ( not ( = ?auto_816542 ?auto_816552 ) ) ( not ( = ?auto_816542 ?auto_816553 ) ) ( not ( = ?auto_816542 ?auto_816554 ) ) ( not ( = ?auto_816542 ?auto_816555 ) ) ( not ( = ?auto_816542 ?auto_816556 ) ) ( not ( = ?auto_816543 ?auto_816544 ) ) ( not ( = ?auto_816543 ?auto_816545 ) ) ( not ( = ?auto_816543 ?auto_816546 ) ) ( not ( = ?auto_816543 ?auto_816547 ) ) ( not ( = ?auto_816543 ?auto_816548 ) ) ( not ( = ?auto_816543 ?auto_816549 ) ) ( not ( = ?auto_816543 ?auto_816550 ) ) ( not ( = ?auto_816543 ?auto_816551 ) ) ( not ( = ?auto_816543 ?auto_816552 ) ) ( not ( = ?auto_816543 ?auto_816553 ) ) ( not ( = ?auto_816543 ?auto_816554 ) ) ( not ( = ?auto_816543 ?auto_816555 ) ) ( not ( = ?auto_816543 ?auto_816556 ) ) ( not ( = ?auto_816544 ?auto_816545 ) ) ( not ( = ?auto_816544 ?auto_816546 ) ) ( not ( = ?auto_816544 ?auto_816547 ) ) ( not ( = ?auto_816544 ?auto_816548 ) ) ( not ( = ?auto_816544 ?auto_816549 ) ) ( not ( = ?auto_816544 ?auto_816550 ) ) ( not ( = ?auto_816544 ?auto_816551 ) ) ( not ( = ?auto_816544 ?auto_816552 ) ) ( not ( = ?auto_816544 ?auto_816553 ) ) ( not ( = ?auto_816544 ?auto_816554 ) ) ( not ( = ?auto_816544 ?auto_816555 ) ) ( not ( = ?auto_816544 ?auto_816556 ) ) ( not ( = ?auto_816545 ?auto_816546 ) ) ( not ( = ?auto_816545 ?auto_816547 ) ) ( not ( = ?auto_816545 ?auto_816548 ) ) ( not ( = ?auto_816545 ?auto_816549 ) ) ( not ( = ?auto_816545 ?auto_816550 ) ) ( not ( = ?auto_816545 ?auto_816551 ) ) ( not ( = ?auto_816545 ?auto_816552 ) ) ( not ( = ?auto_816545 ?auto_816553 ) ) ( not ( = ?auto_816545 ?auto_816554 ) ) ( not ( = ?auto_816545 ?auto_816555 ) ) ( not ( = ?auto_816545 ?auto_816556 ) ) ( not ( = ?auto_816546 ?auto_816547 ) ) ( not ( = ?auto_816546 ?auto_816548 ) ) ( not ( = ?auto_816546 ?auto_816549 ) ) ( not ( = ?auto_816546 ?auto_816550 ) ) ( not ( = ?auto_816546 ?auto_816551 ) ) ( not ( = ?auto_816546 ?auto_816552 ) ) ( not ( = ?auto_816546 ?auto_816553 ) ) ( not ( = ?auto_816546 ?auto_816554 ) ) ( not ( = ?auto_816546 ?auto_816555 ) ) ( not ( = ?auto_816546 ?auto_816556 ) ) ( not ( = ?auto_816547 ?auto_816548 ) ) ( not ( = ?auto_816547 ?auto_816549 ) ) ( not ( = ?auto_816547 ?auto_816550 ) ) ( not ( = ?auto_816547 ?auto_816551 ) ) ( not ( = ?auto_816547 ?auto_816552 ) ) ( not ( = ?auto_816547 ?auto_816553 ) ) ( not ( = ?auto_816547 ?auto_816554 ) ) ( not ( = ?auto_816547 ?auto_816555 ) ) ( not ( = ?auto_816547 ?auto_816556 ) ) ( not ( = ?auto_816548 ?auto_816549 ) ) ( not ( = ?auto_816548 ?auto_816550 ) ) ( not ( = ?auto_816548 ?auto_816551 ) ) ( not ( = ?auto_816548 ?auto_816552 ) ) ( not ( = ?auto_816548 ?auto_816553 ) ) ( not ( = ?auto_816548 ?auto_816554 ) ) ( not ( = ?auto_816548 ?auto_816555 ) ) ( not ( = ?auto_816548 ?auto_816556 ) ) ( not ( = ?auto_816549 ?auto_816550 ) ) ( not ( = ?auto_816549 ?auto_816551 ) ) ( not ( = ?auto_816549 ?auto_816552 ) ) ( not ( = ?auto_816549 ?auto_816553 ) ) ( not ( = ?auto_816549 ?auto_816554 ) ) ( not ( = ?auto_816549 ?auto_816555 ) ) ( not ( = ?auto_816549 ?auto_816556 ) ) ( not ( = ?auto_816550 ?auto_816551 ) ) ( not ( = ?auto_816550 ?auto_816552 ) ) ( not ( = ?auto_816550 ?auto_816553 ) ) ( not ( = ?auto_816550 ?auto_816554 ) ) ( not ( = ?auto_816550 ?auto_816555 ) ) ( not ( = ?auto_816550 ?auto_816556 ) ) ( not ( = ?auto_816551 ?auto_816552 ) ) ( not ( = ?auto_816551 ?auto_816553 ) ) ( not ( = ?auto_816551 ?auto_816554 ) ) ( not ( = ?auto_816551 ?auto_816555 ) ) ( not ( = ?auto_816551 ?auto_816556 ) ) ( not ( = ?auto_816552 ?auto_816553 ) ) ( not ( = ?auto_816552 ?auto_816554 ) ) ( not ( = ?auto_816552 ?auto_816555 ) ) ( not ( = ?auto_816552 ?auto_816556 ) ) ( not ( = ?auto_816553 ?auto_816554 ) ) ( not ( = ?auto_816553 ?auto_816555 ) ) ( not ( = ?auto_816553 ?auto_816556 ) ) ( not ( = ?auto_816554 ?auto_816555 ) ) ( not ( = ?auto_816554 ?auto_816556 ) ) ( not ( = ?auto_816555 ?auto_816556 ) ) ( ON ?auto_816554 ?auto_816555 ) ( ON ?auto_816553 ?auto_816554 ) ( CLEAR ?auto_816551 ) ( ON ?auto_816552 ?auto_816553 ) ( CLEAR ?auto_816552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_816539 ?auto_816540 ?auto_816541 ?auto_816542 ?auto_816543 ?auto_816544 ?auto_816545 ?auto_816546 ?auto_816547 ?auto_816548 ?auto_816549 ?auto_816550 ?auto_816551 ?auto_816552 )
      ( MAKE-17PILE ?auto_816539 ?auto_816540 ?auto_816541 ?auto_816542 ?auto_816543 ?auto_816544 ?auto_816545 ?auto_816546 ?auto_816547 ?auto_816548 ?auto_816549 ?auto_816550 ?auto_816551 ?auto_816552 ?auto_816553 ?auto_816554 ?auto_816555 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816609 - BLOCK
      ?auto_816610 - BLOCK
      ?auto_816611 - BLOCK
      ?auto_816612 - BLOCK
      ?auto_816613 - BLOCK
      ?auto_816614 - BLOCK
      ?auto_816615 - BLOCK
      ?auto_816616 - BLOCK
      ?auto_816617 - BLOCK
      ?auto_816618 - BLOCK
      ?auto_816619 - BLOCK
      ?auto_816620 - BLOCK
      ?auto_816621 - BLOCK
      ?auto_816622 - BLOCK
      ?auto_816623 - BLOCK
      ?auto_816624 - BLOCK
      ?auto_816625 - BLOCK
    )
    :vars
    (
      ?auto_816626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816625 ?auto_816626 ) ( ON-TABLE ?auto_816609 ) ( ON ?auto_816610 ?auto_816609 ) ( ON ?auto_816611 ?auto_816610 ) ( ON ?auto_816612 ?auto_816611 ) ( ON ?auto_816613 ?auto_816612 ) ( ON ?auto_816614 ?auto_816613 ) ( ON ?auto_816615 ?auto_816614 ) ( ON ?auto_816616 ?auto_816615 ) ( ON ?auto_816617 ?auto_816616 ) ( ON ?auto_816618 ?auto_816617 ) ( ON ?auto_816619 ?auto_816618 ) ( ON ?auto_816620 ?auto_816619 ) ( not ( = ?auto_816609 ?auto_816610 ) ) ( not ( = ?auto_816609 ?auto_816611 ) ) ( not ( = ?auto_816609 ?auto_816612 ) ) ( not ( = ?auto_816609 ?auto_816613 ) ) ( not ( = ?auto_816609 ?auto_816614 ) ) ( not ( = ?auto_816609 ?auto_816615 ) ) ( not ( = ?auto_816609 ?auto_816616 ) ) ( not ( = ?auto_816609 ?auto_816617 ) ) ( not ( = ?auto_816609 ?auto_816618 ) ) ( not ( = ?auto_816609 ?auto_816619 ) ) ( not ( = ?auto_816609 ?auto_816620 ) ) ( not ( = ?auto_816609 ?auto_816621 ) ) ( not ( = ?auto_816609 ?auto_816622 ) ) ( not ( = ?auto_816609 ?auto_816623 ) ) ( not ( = ?auto_816609 ?auto_816624 ) ) ( not ( = ?auto_816609 ?auto_816625 ) ) ( not ( = ?auto_816609 ?auto_816626 ) ) ( not ( = ?auto_816610 ?auto_816611 ) ) ( not ( = ?auto_816610 ?auto_816612 ) ) ( not ( = ?auto_816610 ?auto_816613 ) ) ( not ( = ?auto_816610 ?auto_816614 ) ) ( not ( = ?auto_816610 ?auto_816615 ) ) ( not ( = ?auto_816610 ?auto_816616 ) ) ( not ( = ?auto_816610 ?auto_816617 ) ) ( not ( = ?auto_816610 ?auto_816618 ) ) ( not ( = ?auto_816610 ?auto_816619 ) ) ( not ( = ?auto_816610 ?auto_816620 ) ) ( not ( = ?auto_816610 ?auto_816621 ) ) ( not ( = ?auto_816610 ?auto_816622 ) ) ( not ( = ?auto_816610 ?auto_816623 ) ) ( not ( = ?auto_816610 ?auto_816624 ) ) ( not ( = ?auto_816610 ?auto_816625 ) ) ( not ( = ?auto_816610 ?auto_816626 ) ) ( not ( = ?auto_816611 ?auto_816612 ) ) ( not ( = ?auto_816611 ?auto_816613 ) ) ( not ( = ?auto_816611 ?auto_816614 ) ) ( not ( = ?auto_816611 ?auto_816615 ) ) ( not ( = ?auto_816611 ?auto_816616 ) ) ( not ( = ?auto_816611 ?auto_816617 ) ) ( not ( = ?auto_816611 ?auto_816618 ) ) ( not ( = ?auto_816611 ?auto_816619 ) ) ( not ( = ?auto_816611 ?auto_816620 ) ) ( not ( = ?auto_816611 ?auto_816621 ) ) ( not ( = ?auto_816611 ?auto_816622 ) ) ( not ( = ?auto_816611 ?auto_816623 ) ) ( not ( = ?auto_816611 ?auto_816624 ) ) ( not ( = ?auto_816611 ?auto_816625 ) ) ( not ( = ?auto_816611 ?auto_816626 ) ) ( not ( = ?auto_816612 ?auto_816613 ) ) ( not ( = ?auto_816612 ?auto_816614 ) ) ( not ( = ?auto_816612 ?auto_816615 ) ) ( not ( = ?auto_816612 ?auto_816616 ) ) ( not ( = ?auto_816612 ?auto_816617 ) ) ( not ( = ?auto_816612 ?auto_816618 ) ) ( not ( = ?auto_816612 ?auto_816619 ) ) ( not ( = ?auto_816612 ?auto_816620 ) ) ( not ( = ?auto_816612 ?auto_816621 ) ) ( not ( = ?auto_816612 ?auto_816622 ) ) ( not ( = ?auto_816612 ?auto_816623 ) ) ( not ( = ?auto_816612 ?auto_816624 ) ) ( not ( = ?auto_816612 ?auto_816625 ) ) ( not ( = ?auto_816612 ?auto_816626 ) ) ( not ( = ?auto_816613 ?auto_816614 ) ) ( not ( = ?auto_816613 ?auto_816615 ) ) ( not ( = ?auto_816613 ?auto_816616 ) ) ( not ( = ?auto_816613 ?auto_816617 ) ) ( not ( = ?auto_816613 ?auto_816618 ) ) ( not ( = ?auto_816613 ?auto_816619 ) ) ( not ( = ?auto_816613 ?auto_816620 ) ) ( not ( = ?auto_816613 ?auto_816621 ) ) ( not ( = ?auto_816613 ?auto_816622 ) ) ( not ( = ?auto_816613 ?auto_816623 ) ) ( not ( = ?auto_816613 ?auto_816624 ) ) ( not ( = ?auto_816613 ?auto_816625 ) ) ( not ( = ?auto_816613 ?auto_816626 ) ) ( not ( = ?auto_816614 ?auto_816615 ) ) ( not ( = ?auto_816614 ?auto_816616 ) ) ( not ( = ?auto_816614 ?auto_816617 ) ) ( not ( = ?auto_816614 ?auto_816618 ) ) ( not ( = ?auto_816614 ?auto_816619 ) ) ( not ( = ?auto_816614 ?auto_816620 ) ) ( not ( = ?auto_816614 ?auto_816621 ) ) ( not ( = ?auto_816614 ?auto_816622 ) ) ( not ( = ?auto_816614 ?auto_816623 ) ) ( not ( = ?auto_816614 ?auto_816624 ) ) ( not ( = ?auto_816614 ?auto_816625 ) ) ( not ( = ?auto_816614 ?auto_816626 ) ) ( not ( = ?auto_816615 ?auto_816616 ) ) ( not ( = ?auto_816615 ?auto_816617 ) ) ( not ( = ?auto_816615 ?auto_816618 ) ) ( not ( = ?auto_816615 ?auto_816619 ) ) ( not ( = ?auto_816615 ?auto_816620 ) ) ( not ( = ?auto_816615 ?auto_816621 ) ) ( not ( = ?auto_816615 ?auto_816622 ) ) ( not ( = ?auto_816615 ?auto_816623 ) ) ( not ( = ?auto_816615 ?auto_816624 ) ) ( not ( = ?auto_816615 ?auto_816625 ) ) ( not ( = ?auto_816615 ?auto_816626 ) ) ( not ( = ?auto_816616 ?auto_816617 ) ) ( not ( = ?auto_816616 ?auto_816618 ) ) ( not ( = ?auto_816616 ?auto_816619 ) ) ( not ( = ?auto_816616 ?auto_816620 ) ) ( not ( = ?auto_816616 ?auto_816621 ) ) ( not ( = ?auto_816616 ?auto_816622 ) ) ( not ( = ?auto_816616 ?auto_816623 ) ) ( not ( = ?auto_816616 ?auto_816624 ) ) ( not ( = ?auto_816616 ?auto_816625 ) ) ( not ( = ?auto_816616 ?auto_816626 ) ) ( not ( = ?auto_816617 ?auto_816618 ) ) ( not ( = ?auto_816617 ?auto_816619 ) ) ( not ( = ?auto_816617 ?auto_816620 ) ) ( not ( = ?auto_816617 ?auto_816621 ) ) ( not ( = ?auto_816617 ?auto_816622 ) ) ( not ( = ?auto_816617 ?auto_816623 ) ) ( not ( = ?auto_816617 ?auto_816624 ) ) ( not ( = ?auto_816617 ?auto_816625 ) ) ( not ( = ?auto_816617 ?auto_816626 ) ) ( not ( = ?auto_816618 ?auto_816619 ) ) ( not ( = ?auto_816618 ?auto_816620 ) ) ( not ( = ?auto_816618 ?auto_816621 ) ) ( not ( = ?auto_816618 ?auto_816622 ) ) ( not ( = ?auto_816618 ?auto_816623 ) ) ( not ( = ?auto_816618 ?auto_816624 ) ) ( not ( = ?auto_816618 ?auto_816625 ) ) ( not ( = ?auto_816618 ?auto_816626 ) ) ( not ( = ?auto_816619 ?auto_816620 ) ) ( not ( = ?auto_816619 ?auto_816621 ) ) ( not ( = ?auto_816619 ?auto_816622 ) ) ( not ( = ?auto_816619 ?auto_816623 ) ) ( not ( = ?auto_816619 ?auto_816624 ) ) ( not ( = ?auto_816619 ?auto_816625 ) ) ( not ( = ?auto_816619 ?auto_816626 ) ) ( not ( = ?auto_816620 ?auto_816621 ) ) ( not ( = ?auto_816620 ?auto_816622 ) ) ( not ( = ?auto_816620 ?auto_816623 ) ) ( not ( = ?auto_816620 ?auto_816624 ) ) ( not ( = ?auto_816620 ?auto_816625 ) ) ( not ( = ?auto_816620 ?auto_816626 ) ) ( not ( = ?auto_816621 ?auto_816622 ) ) ( not ( = ?auto_816621 ?auto_816623 ) ) ( not ( = ?auto_816621 ?auto_816624 ) ) ( not ( = ?auto_816621 ?auto_816625 ) ) ( not ( = ?auto_816621 ?auto_816626 ) ) ( not ( = ?auto_816622 ?auto_816623 ) ) ( not ( = ?auto_816622 ?auto_816624 ) ) ( not ( = ?auto_816622 ?auto_816625 ) ) ( not ( = ?auto_816622 ?auto_816626 ) ) ( not ( = ?auto_816623 ?auto_816624 ) ) ( not ( = ?auto_816623 ?auto_816625 ) ) ( not ( = ?auto_816623 ?auto_816626 ) ) ( not ( = ?auto_816624 ?auto_816625 ) ) ( not ( = ?auto_816624 ?auto_816626 ) ) ( not ( = ?auto_816625 ?auto_816626 ) ) ( ON ?auto_816624 ?auto_816625 ) ( ON ?auto_816623 ?auto_816624 ) ( ON ?auto_816622 ?auto_816623 ) ( CLEAR ?auto_816620 ) ( ON ?auto_816621 ?auto_816622 ) ( CLEAR ?auto_816621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_816609 ?auto_816610 ?auto_816611 ?auto_816612 ?auto_816613 ?auto_816614 ?auto_816615 ?auto_816616 ?auto_816617 ?auto_816618 ?auto_816619 ?auto_816620 ?auto_816621 )
      ( MAKE-17PILE ?auto_816609 ?auto_816610 ?auto_816611 ?auto_816612 ?auto_816613 ?auto_816614 ?auto_816615 ?auto_816616 ?auto_816617 ?auto_816618 ?auto_816619 ?auto_816620 ?auto_816621 ?auto_816622 ?auto_816623 ?auto_816624 ?auto_816625 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816679 - BLOCK
      ?auto_816680 - BLOCK
      ?auto_816681 - BLOCK
      ?auto_816682 - BLOCK
      ?auto_816683 - BLOCK
      ?auto_816684 - BLOCK
      ?auto_816685 - BLOCK
      ?auto_816686 - BLOCK
      ?auto_816687 - BLOCK
      ?auto_816688 - BLOCK
      ?auto_816689 - BLOCK
      ?auto_816690 - BLOCK
      ?auto_816691 - BLOCK
      ?auto_816692 - BLOCK
      ?auto_816693 - BLOCK
      ?auto_816694 - BLOCK
      ?auto_816695 - BLOCK
    )
    :vars
    (
      ?auto_816696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816695 ?auto_816696 ) ( ON-TABLE ?auto_816679 ) ( ON ?auto_816680 ?auto_816679 ) ( ON ?auto_816681 ?auto_816680 ) ( ON ?auto_816682 ?auto_816681 ) ( ON ?auto_816683 ?auto_816682 ) ( ON ?auto_816684 ?auto_816683 ) ( ON ?auto_816685 ?auto_816684 ) ( ON ?auto_816686 ?auto_816685 ) ( ON ?auto_816687 ?auto_816686 ) ( ON ?auto_816688 ?auto_816687 ) ( ON ?auto_816689 ?auto_816688 ) ( not ( = ?auto_816679 ?auto_816680 ) ) ( not ( = ?auto_816679 ?auto_816681 ) ) ( not ( = ?auto_816679 ?auto_816682 ) ) ( not ( = ?auto_816679 ?auto_816683 ) ) ( not ( = ?auto_816679 ?auto_816684 ) ) ( not ( = ?auto_816679 ?auto_816685 ) ) ( not ( = ?auto_816679 ?auto_816686 ) ) ( not ( = ?auto_816679 ?auto_816687 ) ) ( not ( = ?auto_816679 ?auto_816688 ) ) ( not ( = ?auto_816679 ?auto_816689 ) ) ( not ( = ?auto_816679 ?auto_816690 ) ) ( not ( = ?auto_816679 ?auto_816691 ) ) ( not ( = ?auto_816679 ?auto_816692 ) ) ( not ( = ?auto_816679 ?auto_816693 ) ) ( not ( = ?auto_816679 ?auto_816694 ) ) ( not ( = ?auto_816679 ?auto_816695 ) ) ( not ( = ?auto_816679 ?auto_816696 ) ) ( not ( = ?auto_816680 ?auto_816681 ) ) ( not ( = ?auto_816680 ?auto_816682 ) ) ( not ( = ?auto_816680 ?auto_816683 ) ) ( not ( = ?auto_816680 ?auto_816684 ) ) ( not ( = ?auto_816680 ?auto_816685 ) ) ( not ( = ?auto_816680 ?auto_816686 ) ) ( not ( = ?auto_816680 ?auto_816687 ) ) ( not ( = ?auto_816680 ?auto_816688 ) ) ( not ( = ?auto_816680 ?auto_816689 ) ) ( not ( = ?auto_816680 ?auto_816690 ) ) ( not ( = ?auto_816680 ?auto_816691 ) ) ( not ( = ?auto_816680 ?auto_816692 ) ) ( not ( = ?auto_816680 ?auto_816693 ) ) ( not ( = ?auto_816680 ?auto_816694 ) ) ( not ( = ?auto_816680 ?auto_816695 ) ) ( not ( = ?auto_816680 ?auto_816696 ) ) ( not ( = ?auto_816681 ?auto_816682 ) ) ( not ( = ?auto_816681 ?auto_816683 ) ) ( not ( = ?auto_816681 ?auto_816684 ) ) ( not ( = ?auto_816681 ?auto_816685 ) ) ( not ( = ?auto_816681 ?auto_816686 ) ) ( not ( = ?auto_816681 ?auto_816687 ) ) ( not ( = ?auto_816681 ?auto_816688 ) ) ( not ( = ?auto_816681 ?auto_816689 ) ) ( not ( = ?auto_816681 ?auto_816690 ) ) ( not ( = ?auto_816681 ?auto_816691 ) ) ( not ( = ?auto_816681 ?auto_816692 ) ) ( not ( = ?auto_816681 ?auto_816693 ) ) ( not ( = ?auto_816681 ?auto_816694 ) ) ( not ( = ?auto_816681 ?auto_816695 ) ) ( not ( = ?auto_816681 ?auto_816696 ) ) ( not ( = ?auto_816682 ?auto_816683 ) ) ( not ( = ?auto_816682 ?auto_816684 ) ) ( not ( = ?auto_816682 ?auto_816685 ) ) ( not ( = ?auto_816682 ?auto_816686 ) ) ( not ( = ?auto_816682 ?auto_816687 ) ) ( not ( = ?auto_816682 ?auto_816688 ) ) ( not ( = ?auto_816682 ?auto_816689 ) ) ( not ( = ?auto_816682 ?auto_816690 ) ) ( not ( = ?auto_816682 ?auto_816691 ) ) ( not ( = ?auto_816682 ?auto_816692 ) ) ( not ( = ?auto_816682 ?auto_816693 ) ) ( not ( = ?auto_816682 ?auto_816694 ) ) ( not ( = ?auto_816682 ?auto_816695 ) ) ( not ( = ?auto_816682 ?auto_816696 ) ) ( not ( = ?auto_816683 ?auto_816684 ) ) ( not ( = ?auto_816683 ?auto_816685 ) ) ( not ( = ?auto_816683 ?auto_816686 ) ) ( not ( = ?auto_816683 ?auto_816687 ) ) ( not ( = ?auto_816683 ?auto_816688 ) ) ( not ( = ?auto_816683 ?auto_816689 ) ) ( not ( = ?auto_816683 ?auto_816690 ) ) ( not ( = ?auto_816683 ?auto_816691 ) ) ( not ( = ?auto_816683 ?auto_816692 ) ) ( not ( = ?auto_816683 ?auto_816693 ) ) ( not ( = ?auto_816683 ?auto_816694 ) ) ( not ( = ?auto_816683 ?auto_816695 ) ) ( not ( = ?auto_816683 ?auto_816696 ) ) ( not ( = ?auto_816684 ?auto_816685 ) ) ( not ( = ?auto_816684 ?auto_816686 ) ) ( not ( = ?auto_816684 ?auto_816687 ) ) ( not ( = ?auto_816684 ?auto_816688 ) ) ( not ( = ?auto_816684 ?auto_816689 ) ) ( not ( = ?auto_816684 ?auto_816690 ) ) ( not ( = ?auto_816684 ?auto_816691 ) ) ( not ( = ?auto_816684 ?auto_816692 ) ) ( not ( = ?auto_816684 ?auto_816693 ) ) ( not ( = ?auto_816684 ?auto_816694 ) ) ( not ( = ?auto_816684 ?auto_816695 ) ) ( not ( = ?auto_816684 ?auto_816696 ) ) ( not ( = ?auto_816685 ?auto_816686 ) ) ( not ( = ?auto_816685 ?auto_816687 ) ) ( not ( = ?auto_816685 ?auto_816688 ) ) ( not ( = ?auto_816685 ?auto_816689 ) ) ( not ( = ?auto_816685 ?auto_816690 ) ) ( not ( = ?auto_816685 ?auto_816691 ) ) ( not ( = ?auto_816685 ?auto_816692 ) ) ( not ( = ?auto_816685 ?auto_816693 ) ) ( not ( = ?auto_816685 ?auto_816694 ) ) ( not ( = ?auto_816685 ?auto_816695 ) ) ( not ( = ?auto_816685 ?auto_816696 ) ) ( not ( = ?auto_816686 ?auto_816687 ) ) ( not ( = ?auto_816686 ?auto_816688 ) ) ( not ( = ?auto_816686 ?auto_816689 ) ) ( not ( = ?auto_816686 ?auto_816690 ) ) ( not ( = ?auto_816686 ?auto_816691 ) ) ( not ( = ?auto_816686 ?auto_816692 ) ) ( not ( = ?auto_816686 ?auto_816693 ) ) ( not ( = ?auto_816686 ?auto_816694 ) ) ( not ( = ?auto_816686 ?auto_816695 ) ) ( not ( = ?auto_816686 ?auto_816696 ) ) ( not ( = ?auto_816687 ?auto_816688 ) ) ( not ( = ?auto_816687 ?auto_816689 ) ) ( not ( = ?auto_816687 ?auto_816690 ) ) ( not ( = ?auto_816687 ?auto_816691 ) ) ( not ( = ?auto_816687 ?auto_816692 ) ) ( not ( = ?auto_816687 ?auto_816693 ) ) ( not ( = ?auto_816687 ?auto_816694 ) ) ( not ( = ?auto_816687 ?auto_816695 ) ) ( not ( = ?auto_816687 ?auto_816696 ) ) ( not ( = ?auto_816688 ?auto_816689 ) ) ( not ( = ?auto_816688 ?auto_816690 ) ) ( not ( = ?auto_816688 ?auto_816691 ) ) ( not ( = ?auto_816688 ?auto_816692 ) ) ( not ( = ?auto_816688 ?auto_816693 ) ) ( not ( = ?auto_816688 ?auto_816694 ) ) ( not ( = ?auto_816688 ?auto_816695 ) ) ( not ( = ?auto_816688 ?auto_816696 ) ) ( not ( = ?auto_816689 ?auto_816690 ) ) ( not ( = ?auto_816689 ?auto_816691 ) ) ( not ( = ?auto_816689 ?auto_816692 ) ) ( not ( = ?auto_816689 ?auto_816693 ) ) ( not ( = ?auto_816689 ?auto_816694 ) ) ( not ( = ?auto_816689 ?auto_816695 ) ) ( not ( = ?auto_816689 ?auto_816696 ) ) ( not ( = ?auto_816690 ?auto_816691 ) ) ( not ( = ?auto_816690 ?auto_816692 ) ) ( not ( = ?auto_816690 ?auto_816693 ) ) ( not ( = ?auto_816690 ?auto_816694 ) ) ( not ( = ?auto_816690 ?auto_816695 ) ) ( not ( = ?auto_816690 ?auto_816696 ) ) ( not ( = ?auto_816691 ?auto_816692 ) ) ( not ( = ?auto_816691 ?auto_816693 ) ) ( not ( = ?auto_816691 ?auto_816694 ) ) ( not ( = ?auto_816691 ?auto_816695 ) ) ( not ( = ?auto_816691 ?auto_816696 ) ) ( not ( = ?auto_816692 ?auto_816693 ) ) ( not ( = ?auto_816692 ?auto_816694 ) ) ( not ( = ?auto_816692 ?auto_816695 ) ) ( not ( = ?auto_816692 ?auto_816696 ) ) ( not ( = ?auto_816693 ?auto_816694 ) ) ( not ( = ?auto_816693 ?auto_816695 ) ) ( not ( = ?auto_816693 ?auto_816696 ) ) ( not ( = ?auto_816694 ?auto_816695 ) ) ( not ( = ?auto_816694 ?auto_816696 ) ) ( not ( = ?auto_816695 ?auto_816696 ) ) ( ON ?auto_816694 ?auto_816695 ) ( ON ?auto_816693 ?auto_816694 ) ( ON ?auto_816692 ?auto_816693 ) ( ON ?auto_816691 ?auto_816692 ) ( CLEAR ?auto_816689 ) ( ON ?auto_816690 ?auto_816691 ) ( CLEAR ?auto_816690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_816679 ?auto_816680 ?auto_816681 ?auto_816682 ?auto_816683 ?auto_816684 ?auto_816685 ?auto_816686 ?auto_816687 ?auto_816688 ?auto_816689 ?auto_816690 )
      ( MAKE-17PILE ?auto_816679 ?auto_816680 ?auto_816681 ?auto_816682 ?auto_816683 ?auto_816684 ?auto_816685 ?auto_816686 ?auto_816687 ?auto_816688 ?auto_816689 ?auto_816690 ?auto_816691 ?auto_816692 ?auto_816693 ?auto_816694 ?auto_816695 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816749 - BLOCK
      ?auto_816750 - BLOCK
      ?auto_816751 - BLOCK
      ?auto_816752 - BLOCK
      ?auto_816753 - BLOCK
      ?auto_816754 - BLOCK
      ?auto_816755 - BLOCK
      ?auto_816756 - BLOCK
      ?auto_816757 - BLOCK
      ?auto_816758 - BLOCK
      ?auto_816759 - BLOCK
      ?auto_816760 - BLOCK
      ?auto_816761 - BLOCK
      ?auto_816762 - BLOCK
      ?auto_816763 - BLOCK
      ?auto_816764 - BLOCK
      ?auto_816765 - BLOCK
    )
    :vars
    (
      ?auto_816766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816765 ?auto_816766 ) ( ON-TABLE ?auto_816749 ) ( ON ?auto_816750 ?auto_816749 ) ( ON ?auto_816751 ?auto_816750 ) ( ON ?auto_816752 ?auto_816751 ) ( ON ?auto_816753 ?auto_816752 ) ( ON ?auto_816754 ?auto_816753 ) ( ON ?auto_816755 ?auto_816754 ) ( ON ?auto_816756 ?auto_816755 ) ( ON ?auto_816757 ?auto_816756 ) ( ON ?auto_816758 ?auto_816757 ) ( not ( = ?auto_816749 ?auto_816750 ) ) ( not ( = ?auto_816749 ?auto_816751 ) ) ( not ( = ?auto_816749 ?auto_816752 ) ) ( not ( = ?auto_816749 ?auto_816753 ) ) ( not ( = ?auto_816749 ?auto_816754 ) ) ( not ( = ?auto_816749 ?auto_816755 ) ) ( not ( = ?auto_816749 ?auto_816756 ) ) ( not ( = ?auto_816749 ?auto_816757 ) ) ( not ( = ?auto_816749 ?auto_816758 ) ) ( not ( = ?auto_816749 ?auto_816759 ) ) ( not ( = ?auto_816749 ?auto_816760 ) ) ( not ( = ?auto_816749 ?auto_816761 ) ) ( not ( = ?auto_816749 ?auto_816762 ) ) ( not ( = ?auto_816749 ?auto_816763 ) ) ( not ( = ?auto_816749 ?auto_816764 ) ) ( not ( = ?auto_816749 ?auto_816765 ) ) ( not ( = ?auto_816749 ?auto_816766 ) ) ( not ( = ?auto_816750 ?auto_816751 ) ) ( not ( = ?auto_816750 ?auto_816752 ) ) ( not ( = ?auto_816750 ?auto_816753 ) ) ( not ( = ?auto_816750 ?auto_816754 ) ) ( not ( = ?auto_816750 ?auto_816755 ) ) ( not ( = ?auto_816750 ?auto_816756 ) ) ( not ( = ?auto_816750 ?auto_816757 ) ) ( not ( = ?auto_816750 ?auto_816758 ) ) ( not ( = ?auto_816750 ?auto_816759 ) ) ( not ( = ?auto_816750 ?auto_816760 ) ) ( not ( = ?auto_816750 ?auto_816761 ) ) ( not ( = ?auto_816750 ?auto_816762 ) ) ( not ( = ?auto_816750 ?auto_816763 ) ) ( not ( = ?auto_816750 ?auto_816764 ) ) ( not ( = ?auto_816750 ?auto_816765 ) ) ( not ( = ?auto_816750 ?auto_816766 ) ) ( not ( = ?auto_816751 ?auto_816752 ) ) ( not ( = ?auto_816751 ?auto_816753 ) ) ( not ( = ?auto_816751 ?auto_816754 ) ) ( not ( = ?auto_816751 ?auto_816755 ) ) ( not ( = ?auto_816751 ?auto_816756 ) ) ( not ( = ?auto_816751 ?auto_816757 ) ) ( not ( = ?auto_816751 ?auto_816758 ) ) ( not ( = ?auto_816751 ?auto_816759 ) ) ( not ( = ?auto_816751 ?auto_816760 ) ) ( not ( = ?auto_816751 ?auto_816761 ) ) ( not ( = ?auto_816751 ?auto_816762 ) ) ( not ( = ?auto_816751 ?auto_816763 ) ) ( not ( = ?auto_816751 ?auto_816764 ) ) ( not ( = ?auto_816751 ?auto_816765 ) ) ( not ( = ?auto_816751 ?auto_816766 ) ) ( not ( = ?auto_816752 ?auto_816753 ) ) ( not ( = ?auto_816752 ?auto_816754 ) ) ( not ( = ?auto_816752 ?auto_816755 ) ) ( not ( = ?auto_816752 ?auto_816756 ) ) ( not ( = ?auto_816752 ?auto_816757 ) ) ( not ( = ?auto_816752 ?auto_816758 ) ) ( not ( = ?auto_816752 ?auto_816759 ) ) ( not ( = ?auto_816752 ?auto_816760 ) ) ( not ( = ?auto_816752 ?auto_816761 ) ) ( not ( = ?auto_816752 ?auto_816762 ) ) ( not ( = ?auto_816752 ?auto_816763 ) ) ( not ( = ?auto_816752 ?auto_816764 ) ) ( not ( = ?auto_816752 ?auto_816765 ) ) ( not ( = ?auto_816752 ?auto_816766 ) ) ( not ( = ?auto_816753 ?auto_816754 ) ) ( not ( = ?auto_816753 ?auto_816755 ) ) ( not ( = ?auto_816753 ?auto_816756 ) ) ( not ( = ?auto_816753 ?auto_816757 ) ) ( not ( = ?auto_816753 ?auto_816758 ) ) ( not ( = ?auto_816753 ?auto_816759 ) ) ( not ( = ?auto_816753 ?auto_816760 ) ) ( not ( = ?auto_816753 ?auto_816761 ) ) ( not ( = ?auto_816753 ?auto_816762 ) ) ( not ( = ?auto_816753 ?auto_816763 ) ) ( not ( = ?auto_816753 ?auto_816764 ) ) ( not ( = ?auto_816753 ?auto_816765 ) ) ( not ( = ?auto_816753 ?auto_816766 ) ) ( not ( = ?auto_816754 ?auto_816755 ) ) ( not ( = ?auto_816754 ?auto_816756 ) ) ( not ( = ?auto_816754 ?auto_816757 ) ) ( not ( = ?auto_816754 ?auto_816758 ) ) ( not ( = ?auto_816754 ?auto_816759 ) ) ( not ( = ?auto_816754 ?auto_816760 ) ) ( not ( = ?auto_816754 ?auto_816761 ) ) ( not ( = ?auto_816754 ?auto_816762 ) ) ( not ( = ?auto_816754 ?auto_816763 ) ) ( not ( = ?auto_816754 ?auto_816764 ) ) ( not ( = ?auto_816754 ?auto_816765 ) ) ( not ( = ?auto_816754 ?auto_816766 ) ) ( not ( = ?auto_816755 ?auto_816756 ) ) ( not ( = ?auto_816755 ?auto_816757 ) ) ( not ( = ?auto_816755 ?auto_816758 ) ) ( not ( = ?auto_816755 ?auto_816759 ) ) ( not ( = ?auto_816755 ?auto_816760 ) ) ( not ( = ?auto_816755 ?auto_816761 ) ) ( not ( = ?auto_816755 ?auto_816762 ) ) ( not ( = ?auto_816755 ?auto_816763 ) ) ( not ( = ?auto_816755 ?auto_816764 ) ) ( not ( = ?auto_816755 ?auto_816765 ) ) ( not ( = ?auto_816755 ?auto_816766 ) ) ( not ( = ?auto_816756 ?auto_816757 ) ) ( not ( = ?auto_816756 ?auto_816758 ) ) ( not ( = ?auto_816756 ?auto_816759 ) ) ( not ( = ?auto_816756 ?auto_816760 ) ) ( not ( = ?auto_816756 ?auto_816761 ) ) ( not ( = ?auto_816756 ?auto_816762 ) ) ( not ( = ?auto_816756 ?auto_816763 ) ) ( not ( = ?auto_816756 ?auto_816764 ) ) ( not ( = ?auto_816756 ?auto_816765 ) ) ( not ( = ?auto_816756 ?auto_816766 ) ) ( not ( = ?auto_816757 ?auto_816758 ) ) ( not ( = ?auto_816757 ?auto_816759 ) ) ( not ( = ?auto_816757 ?auto_816760 ) ) ( not ( = ?auto_816757 ?auto_816761 ) ) ( not ( = ?auto_816757 ?auto_816762 ) ) ( not ( = ?auto_816757 ?auto_816763 ) ) ( not ( = ?auto_816757 ?auto_816764 ) ) ( not ( = ?auto_816757 ?auto_816765 ) ) ( not ( = ?auto_816757 ?auto_816766 ) ) ( not ( = ?auto_816758 ?auto_816759 ) ) ( not ( = ?auto_816758 ?auto_816760 ) ) ( not ( = ?auto_816758 ?auto_816761 ) ) ( not ( = ?auto_816758 ?auto_816762 ) ) ( not ( = ?auto_816758 ?auto_816763 ) ) ( not ( = ?auto_816758 ?auto_816764 ) ) ( not ( = ?auto_816758 ?auto_816765 ) ) ( not ( = ?auto_816758 ?auto_816766 ) ) ( not ( = ?auto_816759 ?auto_816760 ) ) ( not ( = ?auto_816759 ?auto_816761 ) ) ( not ( = ?auto_816759 ?auto_816762 ) ) ( not ( = ?auto_816759 ?auto_816763 ) ) ( not ( = ?auto_816759 ?auto_816764 ) ) ( not ( = ?auto_816759 ?auto_816765 ) ) ( not ( = ?auto_816759 ?auto_816766 ) ) ( not ( = ?auto_816760 ?auto_816761 ) ) ( not ( = ?auto_816760 ?auto_816762 ) ) ( not ( = ?auto_816760 ?auto_816763 ) ) ( not ( = ?auto_816760 ?auto_816764 ) ) ( not ( = ?auto_816760 ?auto_816765 ) ) ( not ( = ?auto_816760 ?auto_816766 ) ) ( not ( = ?auto_816761 ?auto_816762 ) ) ( not ( = ?auto_816761 ?auto_816763 ) ) ( not ( = ?auto_816761 ?auto_816764 ) ) ( not ( = ?auto_816761 ?auto_816765 ) ) ( not ( = ?auto_816761 ?auto_816766 ) ) ( not ( = ?auto_816762 ?auto_816763 ) ) ( not ( = ?auto_816762 ?auto_816764 ) ) ( not ( = ?auto_816762 ?auto_816765 ) ) ( not ( = ?auto_816762 ?auto_816766 ) ) ( not ( = ?auto_816763 ?auto_816764 ) ) ( not ( = ?auto_816763 ?auto_816765 ) ) ( not ( = ?auto_816763 ?auto_816766 ) ) ( not ( = ?auto_816764 ?auto_816765 ) ) ( not ( = ?auto_816764 ?auto_816766 ) ) ( not ( = ?auto_816765 ?auto_816766 ) ) ( ON ?auto_816764 ?auto_816765 ) ( ON ?auto_816763 ?auto_816764 ) ( ON ?auto_816762 ?auto_816763 ) ( ON ?auto_816761 ?auto_816762 ) ( ON ?auto_816760 ?auto_816761 ) ( CLEAR ?auto_816758 ) ( ON ?auto_816759 ?auto_816760 ) ( CLEAR ?auto_816759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_816749 ?auto_816750 ?auto_816751 ?auto_816752 ?auto_816753 ?auto_816754 ?auto_816755 ?auto_816756 ?auto_816757 ?auto_816758 ?auto_816759 )
      ( MAKE-17PILE ?auto_816749 ?auto_816750 ?auto_816751 ?auto_816752 ?auto_816753 ?auto_816754 ?auto_816755 ?auto_816756 ?auto_816757 ?auto_816758 ?auto_816759 ?auto_816760 ?auto_816761 ?auto_816762 ?auto_816763 ?auto_816764 ?auto_816765 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816819 - BLOCK
      ?auto_816820 - BLOCK
      ?auto_816821 - BLOCK
      ?auto_816822 - BLOCK
      ?auto_816823 - BLOCK
      ?auto_816824 - BLOCK
      ?auto_816825 - BLOCK
      ?auto_816826 - BLOCK
      ?auto_816827 - BLOCK
      ?auto_816828 - BLOCK
      ?auto_816829 - BLOCK
      ?auto_816830 - BLOCK
      ?auto_816831 - BLOCK
      ?auto_816832 - BLOCK
      ?auto_816833 - BLOCK
      ?auto_816834 - BLOCK
      ?auto_816835 - BLOCK
    )
    :vars
    (
      ?auto_816836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816835 ?auto_816836 ) ( ON-TABLE ?auto_816819 ) ( ON ?auto_816820 ?auto_816819 ) ( ON ?auto_816821 ?auto_816820 ) ( ON ?auto_816822 ?auto_816821 ) ( ON ?auto_816823 ?auto_816822 ) ( ON ?auto_816824 ?auto_816823 ) ( ON ?auto_816825 ?auto_816824 ) ( ON ?auto_816826 ?auto_816825 ) ( ON ?auto_816827 ?auto_816826 ) ( not ( = ?auto_816819 ?auto_816820 ) ) ( not ( = ?auto_816819 ?auto_816821 ) ) ( not ( = ?auto_816819 ?auto_816822 ) ) ( not ( = ?auto_816819 ?auto_816823 ) ) ( not ( = ?auto_816819 ?auto_816824 ) ) ( not ( = ?auto_816819 ?auto_816825 ) ) ( not ( = ?auto_816819 ?auto_816826 ) ) ( not ( = ?auto_816819 ?auto_816827 ) ) ( not ( = ?auto_816819 ?auto_816828 ) ) ( not ( = ?auto_816819 ?auto_816829 ) ) ( not ( = ?auto_816819 ?auto_816830 ) ) ( not ( = ?auto_816819 ?auto_816831 ) ) ( not ( = ?auto_816819 ?auto_816832 ) ) ( not ( = ?auto_816819 ?auto_816833 ) ) ( not ( = ?auto_816819 ?auto_816834 ) ) ( not ( = ?auto_816819 ?auto_816835 ) ) ( not ( = ?auto_816819 ?auto_816836 ) ) ( not ( = ?auto_816820 ?auto_816821 ) ) ( not ( = ?auto_816820 ?auto_816822 ) ) ( not ( = ?auto_816820 ?auto_816823 ) ) ( not ( = ?auto_816820 ?auto_816824 ) ) ( not ( = ?auto_816820 ?auto_816825 ) ) ( not ( = ?auto_816820 ?auto_816826 ) ) ( not ( = ?auto_816820 ?auto_816827 ) ) ( not ( = ?auto_816820 ?auto_816828 ) ) ( not ( = ?auto_816820 ?auto_816829 ) ) ( not ( = ?auto_816820 ?auto_816830 ) ) ( not ( = ?auto_816820 ?auto_816831 ) ) ( not ( = ?auto_816820 ?auto_816832 ) ) ( not ( = ?auto_816820 ?auto_816833 ) ) ( not ( = ?auto_816820 ?auto_816834 ) ) ( not ( = ?auto_816820 ?auto_816835 ) ) ( not ( = ?auto_816820 ?auto_816836 ) ) ( not ( = ?auto_816821 ?auto_816822 ) ) ( not ( = ?auto_816821 ?auto_816823 ) ) ( not ( = ?auto_816821 ?auto_816824 ) ) ( not ( = ?auto_816821 ?auto_816825 ) ) ( not ( = ?auto_816821 ?auto_816826 ) ) ( not ( = ?auto_816821 ?auto_816827 ) ) ( not ( = ?auto_816821 ?auto_816828 ) ) ( not ( = ?auto_816821 ?auto_816829 ) ) ( not ( = ?auto_816821 ?auto_816830 ) ) ( not ( = ?auto_816821 ?auto_816831 ) ) ( not ( = ?auto_816821 ?auto_816832 ) ) ( not ( = ?auto_816821 ?auto_816833 ) ) ( not ( = ?auto_816821 ?auto_816834 ) ) ( not ( = ?auto_816821 ?auto_816835 ) ) ( not ( = ?auto_816821 ?auto_816836 ) ) ( not ( = ?auto_816822 ?auto_816823 ) ) ( not ( = ?auto_816822 ?auto_816824 ) ) ( not ( = ?auto_816822 ?auto_816825 ) ) ( not ( = ?auto_816822 ?auto_816826 ) ) ( not ( = ?auto_816822 ?auto_816827 ) ) ( not ( = ?auto_816822 ?auto_816828 ) ) ( not ( = ?auto_816822 ?auto_816829 ) ) ( not ( = ?auto_816822 ?auto_816830 ) ) ( not ( = ?auto_816822 ?auto_816831 ) ) ( not ( = ?auto_816822 ?auto_816832 ) ) ( not ( = ?auto_816822 ?auto_816833 ) ) ( not ( = ?auto_816822 ?auto_816834 ) ) ( not ( = ?auto_816822 ?auto_816835 ) ) ( not ( = ?auto_816822 ?auto_816836 ) ) ( not ( = ?auto_816823 ?auto_816824 ) ) ( not ( = ?auto_816823 ?auto_816825 ) ) ( not ( = ?auto_816823 ?auto_816826 ) ) ( not ( = ?auto_816823 ?auto_816827 ) ) ( not ( = ?auto_816823 ?auto_816828 ) ) ( not ( = ?auto_816823 ?auto_816829 ) ) ( not ( = ?auto_816823 ?auto_816830 ) ) ( not ( = ?auto_816823 ?auto_816831 ) ) ( not ( = ?auto_816823 ?auto_816832 ) ) ( not ( = ?auto_816823 ?auto_816833 ) ) ( not ( = ?auto_816823 ?auto_816834 ) ) ( not ( = ?auto_816823 ?auto_816835 ) ) ( not ( = ?auto_816823 ?auto_816836 ) ) ( not ( = ?auto_816824 ?auto_816825 ) ) ( not ( = ?auto_816824 ?auto_816826 ) ) ( not ( = ?auto_816824 ?auto_816827 ) ) ( not ( = ?auto_816824 ?auto_816828 ) ) ( not ( = ?auto_816824 ?auto_816829 ) ) ( not ( = ?auto_816824 ?auto_816830 ) ) ( not ( = ?auto_816824 ?auto_816831 ) ) ( not ( = ?auto_816824 ?auto_816832 ) ) ( not ( = ?auto_816824 ?auto_816833 ) ) ( not ( = ?auto_816824 ?auto_816834 ) ) ( not ( = ?auto_816824 ?auto_816835 ) ) ( not ( = ?auto_816824 ?auto_816836 ) ) ( not ( = ?auto_816825 ?auto_816826 ) ) ( not ( = ?auto_816825 ?auto_816827 ) ) ( not ( = ?auto_816825 ?auto_816828 ) ) ( not ( = ?auto_816825 ?auto_816829 ) ) ( not ( = ?auto_816825 ?auto_816830 ) ) ( not ( = ?auto_816825 ?auto_816831 ) ) ( not ( = ?auto_816825 ?auto_816832 ) ) ( not ( = ?auto_816825 ?auto_816833 ) ) ( not ( = ?auto_816825 ?auto_816834 ) ) ( not ( = ?auto_816825 ?auto_816835 ) ) ( not ( = ?auto_816825 ?auto_816836 ) ) ( not ( = ?auto_816826 ?auto_816827 ) ) ( not ( = ?auto_816826 ?auto_816828 ) ) ( not ( = ?auto_816826 ?auto_816829 ) ) ( not ( = ?auto_816826 ?auto_816830 ) ) ( not ( = ?auto_816826 ?auto_816831 ) ) ( not ( = ?auto_816826 ?auto_816832 ) ) ( not ( = ?auto_816826 ?auto_816833 ) ) ( not ( = ?auto_816826 ?auto_816834 ) ) ( not ( = ?auto_816826 ?auto_816835 ) ) ( not ( = ?auto_816826 ?auto_816836 ) ) ( not ( = ?auto_816827 ?auto_816828 ) ) ( not ( = ?auto_816827 ?auto_816829 ) ) ( not ( = ?auto_816827 ?auto_816830 ) ) ( not ( = ?auto_816827 ?auto_816831 ) ) ( not ( = ?auto_816827 ?auto_816832 ) ) ( not ( = ?auto_816827 ?auto_816833 ) ) ( not ( = ?auto_816827 ?auto_816834 ) ) ( not ( = ?auto_816827 ?auto_816835 ) ) ( not ( = ?auto_816827 ?auto_816836 ) ) ( not ( = ?auto_816828 ?auto_816829 ) ) ( not ( = ?auto_816828 ?auto_816830 ) ) ( not ( = ?auto_816828 ?auto_816831 ) ) ( not ( = ?auto_816828 ?auto_816832 ) ) ( not ( = ?auto_816828 ?auto_816833 ) ) ( not ( = ?auto_816828 ?auto_816834 ) ) ( not ( = ?auto_816828 ?auto_816835 ) ) ( not ( = ?auto_816828 ?auto_816836 ) ) ( not ( = ?auto_816829 ?auto_816830 ) ) ( not ( = ?auto_816829 ?auto_816831 ) ) ( not ( = ?auto_816829 ?auto_816832 ) ) ( not ( = ?auto_816829 ?auto_816833 ) ) ( not ( = ?auto_816829 ?auto_816834 ) ) ( not ( = ?auto_816829 ?auto_816835 ) ) ( not ( = ?auto_816829 ?auto_816836 ) ) ( not ( = ?auto_816830 ?auto_816831 ) ) ( not ( = ?auto_816830 ?auto_816832 ) ) ( not ( = ?auto_816830 ?auto_816833 ) ) ( not ( = ?auto_816830 ?auto_816834 ) ) ( not ( = ?auto_816830 ?auto_816835 ) ) ( not ( = ?auto_816830 ?auto_816836 ) ) ( not ( = ?auto_816831 ?auto_816832 ) ) ( not ( = ?auto_816831 ?auto_816833 ) ) ( not ( = ?auto_816831 ?auto_816834 ) ) ( not ( = ?auto_816831 ?auto_816835 ) ) ( not ( = ?auto_816831 ?auto_816836 ) ) ( not ( = ?auto_816832 ?auto_816833 ) ) ( not ( = ?auto_816832 ?auto_816834 ) ) ( not ( = ?auto_816832 ?auto_816835 ) ) ( not ( = ?auto_816832 ?auto_816836 ) ) ( not ( = ?auto_816833 ?auto_816834 ) ) ( not ( = ?auto_816833 ?auto_816835 ) ) ( not ( = ?auto_816833 ?auto_816836 ) ) ( not ( = ?auto_816834 ?auto_816835 ) ) ( not ( = ?auto_816834 ?auto_816836 ) ) ( not ( = ?auto_816835 ?auto_816836 ) ) ( ON ?auto_816834 ?auto_816835 ) ( ON ?auto_816833 ?auto_816834 ) ( ON ?auto_816832 ?auto_816833 ) ( ON ?auto_816831 ?auto_816832 ) ( ON ?auto_816830 ?auto_816831 ) ( ON ?auto_816829 ?auto_816830 ) ( CLEAR ?auto_816827 ) ( ON ?auto_816828 ?auto_816829 ) ( CLEAR ?auto_816828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_816819 ?auto_816820 ?auto_816821 ?auto_816822 ?auto_816823 ?auto_816824 ?auto_816825 ?auto_816826 ?auto_816827 ?auto_816828 )
      ( MAKE-17PILE ?auto_816819 ?auto_816820 ?auto_816821 ?auto_816822 ?auto_816823 ?auto_816824 ?auto_816825 ?auto_816826 ?auto_816827 ?auto_816828 ?auto_816829 ?auto_816830 ?auto_816831 ?auto_816832 ?auto_816833 ?auto_816834 ?auto_816835 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816889 - BLOCK
      ?auto_816890 - BLOCK
      ?auto_816891 - BLOCK
      ?auto_816892 - BLOCK
      ?auto_816893 - BLOCK
      ?auto_816894 - BLOCK
      ?auto_816895 - BLOCK
      ?auto_816896 - BLOCK
      ?auto_816897 - BLOCK
      ?auto_816898 - BLOCK
      ?auto_816899 - BLOCK
      ?auto_816900 - BLOCK
      ?auto_816901 - BLOCK
      ?auto_816902 - BLOCK
      ?auto_816903 - BLOCK
      ?auto_816904 - BLOCK
      ?auto_816905 - BLOCK
    )
    :vars
    (
      ?auto_816906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816905 ?auto_816906 ) ( ON-TABLE ?auto_816889 ) ( ON ?auto_816890 ?auto_816889 ) ( ON ?auto_816891 ?auto_816890 ) ( ON ?auto_816892 ?auto_816891 ) ( ON ?auto_816893 ?auto_816892 ) ( ON ?auto_816894 ?auto_816893 ) ( ON ?auto_816895 ?auto_816894 ) ( ON ?auto_816896 ?auto_816895 ) ( not ( = ?auto_816889 ?auto_816890 ) ) ( not ( = ?auto_816889 ?auto_816891 ) ) ( not ( = ?auto_816889 ?auto_816892 ) ) ( not ( = ?auto_816889 ?auto_816893 ) ) ( not ( = ?auto_816889 ?auto_816894 ) ) ( not ( = ?auto_816889 ?auto_816895 ) ) ( not ( = ?auto_816889 ?auto_816896 ) ) ( not ( = ?auto_816889 ?auto_816897 ) ) ( not ( = ?auto_816889 ?auto_816898 ) ) ( not ( = ?auto_816889 ?auto_816899 ) ) ( not ( = ?auto_816889 ?auto_816900 ) ) ( not ( = ?auto_816889 ?auto_816901 ) ) ( not ( = ?auto_816889 ?auto_816902 ) ) ( not ( = ?auto_816889 ?auto_816903 ) ) ( not ( = ?auto_816889 ?auto_816904 ) ) ( not ( = ?auto_816889 ?auto_816905 ) ) ( not ( = ?auto_816889 ?auto_816906 ) ) ( not ( = ?auto_816890 ?auto_816891 ) ) ( not ( = ?auto_816890 ?auto_816892 ) ) ( not ( = ?auto_816890 ?auto_816893 ) ) ( not ( = ?auto_816890 ?auto_816894 ) ) ( not ( = ?auto_816890 ?auto_816895 ) ) ( not ( = ?auto_816890 ?auto_816896 ) ) ( not ( = ?auto_816890 ?auto_816897 ) ) ( not ( = ?auto_816890 ?auto_816898 ) ) ( not ( = ?auto_816890 ?auto_816899 ) ) ( not ( = ?auto_816890 ?auto_816900 ) ) ( not ( = ?auto_816890 ?auto_816901 ) ) ( not ( = ?auto_816890 ?auto_816902 ) ) ( not ( = ?auto_816890 ?auto_816903 ) ) ( not ( = ?auto_816890 ?auto_816904 ) ) ( not ( = ?auto_816890 ?auto_816905 ) ) ( not ( = ?auto_816890 ?auto_816906 ) ) ( not ( = ?auto_816891 ?auto_816892 ) ) ( not ( = ?auto_816891 ?auto_816893 ) ) ( not ( = ?auto_816891 ?auto_816894 ) ) ( not ( = ?auto_816891 ?auto_816895 ) ) ( not ( = ?auto_816891 ?auto_816896 ) ) ( not ( = ?auto_816891 ?auto_816897 ) ) ( not ( = ?auto_816891 ?auto_816898 ) ) ( not ( = ?auto_816891 ?auto_816899 ) ) ( not ( = ?auto_816891 ?auto_816900 ) ) ( not ( = ?auto_816891 ?auto_816901 ) ) ( not ( = ?auto_816891 ?auto_816902 ) ) ( not ( = ?auto_816891 ?auto_816903 ) ) ( not ( = ?auto_816891 ?auto_816904 ) ) ( not ( = ?auto_816891 ?auto_816905 ) ) ( not ( = ?auto_816891 ?auto_816906 ) ) ( not ( = ?auto_816892 ?auto_816893 ) ) ( not ( = ?auto_816892 ?auto_816894 ) ) ( not ( = ?auto_816892 ?auto_816895 ) ) ( not ( = ?auto_816892 ?auto_816896 ) ) ( not ( = ?auto_816892 ?auto_816897 ) ) ( not ( = ?auto_816892 ?auto_816898 ) ) ( not ( = ?auto_816892 ?auto_816899 ) ) ( not ( = ?auto_816892 ?auto_816900 ) ) ( not ( = ?auto_816892 ?auto_816901 ) ) ( not ( = ?auto_816892 ?auto_816902 ) ) ( not ( = ?auto_816892 ?auto_816903 ) ) ( not ( = ?auto_816892 ?auto_816904 ) ) ( not ( = ?auto_816892 ?auto_816905 ) ) ( not ( = ?auto_816892 ?auto_816906 ) ) ( not ( = ?auto_816893 ?auto_816894 ) ) ( not ( = ?auto_816893 ?auto_816895 ) ) ( not ( = ?auto_816893 ?auto_816896 ) ) ( not ( = ?auto_816893 ?auto_816897 ) ) ( not ( = ?auto_816893 ?auto_816898 ) ) ( not ( = ?auto_816893 ?auto_816899 ) ) ( not ( = ?auto_816893 ?auto_816900 ) ) ( not ( = ?auto_816893 ?auto_816901 ) ) ( not ( = ?auto_816893 ?auto_816902 ) ) ( not ( = ?auto_816893 ?auto_816903 ) ) ( not ( = ?auto_816893 ?auto_816904 ) ) ( not ( = ?auto_816893 ?auto_816905 ) ) ( not ( = ?auto_816893 ?auto_816906 ) ) ( not ( = ?auto_816894 ?auto_816895 ) ) ( not ( = ?auto_816894 ?auto_816896 ) ) ( not ( = ?auto_816894 ?auto_816897 ) ) ( not ( = ?auto_816894 ?auto_816898 ) ) ( not ( = ?auto_816894 ?auto_816899 ) ) ( not ( = ?auto_816894 ?auto_816900 ) ) ( not ( = ?auto_816894 ?auto_816901 ) ) ( not ( = ?auto_816894 ?auto_816902 ) ) ( not ( = ?auto_816894 ?auto_816903 ) ) ( not ( = ?auto_816894 ?auto_816904 ) ) ( not ( = ?auto_816894 ?auto_816905 ) ) ( not ( = ?auto_816894 ?auto_816906 ) ) ( not ( = ?auto_816895 ?auto_816896 ) ) ( not ( = ?auto_816895 ?auto_816897 ) ) ( not ( = ?auto_816895 ?auto_816898 ) ) ( not ( = ?auto_816895 ?auto_816899 ) ) ( not ( = ?auto_816895 ?auto_816900 ) ) ( not ( = ?auto_816895 ?auto_816901 ) ) ( not ( = ?auto_816895 ?auto_816902 ) ) ( not ( = ?auto_816895 ?auto_816903 ) ) ( not ( = ?auto_816895 ?auto_816904 ) ) ( not ( = ?auto_816895 ?auto_816905 ) ) ( not ( = ?auto_816895 ?auto_816906 ) ) ( not ( = ?auto_816896 ?auto_816897 ) ) ( not ( = ?auto_816896 ?auto_816898 ) ) ( not ( = ?auto_816896 ?auto_816899 ) ) ( not ( = ?auto_816896 ?auto_816900 ) ) ( not ( = ?auto_816896 ?auto_816901 ) ) ( not ( = ?auto_816896 ?auto_816902 ) ) ( not ( = ?auto_816896 ?auto_816903 ) ) ( not ( = ?auto_816896 ?auto_816904 ) ) ( not ( = ?auto_816896 ?auto_816905 ) ) ( not ( = ?auto_816896 ?auto_816906 ) ) ( not ( = ?auto_816897 ?auto_816898 ) ) ( not ( = ?auto_816897 ?auto_816899 ) ) ( not ( = ?auto_816897 ?auto_816900 ) ) ( not ( = ?auto_816897 ?auto_816901 ) ) ( not ( = ?auto_816897 ?auto_816902 ) ) ( not ( = ?auto_816897 ?auto_816903 ) ) ( not ( = ?auto_816897 ?auto_816904 ) ) ( not ( = ?auto_816897 ?auto_816905 ) ) ( not ( = ?auto_816897 ?auto_816906 ) ) ( not ( = ?auto_816898 ?auto_816899 ) ) ( not ( = ?auto_816898 ?auto_816900 ) ) ( not ( = ?auto_816898 ?auto_816901 ) ) ( not ( = ?auto_816898 ?auto_816902 ) ) ( not ( = ?auto_816898 ?auto_816903 ) ) ( not ( = ?auto_816898 ?auto_816904 ) ) ( not ( = ?auto_816898 ?auto_816905 ) ) ( not ( = ?auto_816898 ?auto_816906 ) ) ( not ( = ?auto_816899 ?auto_816900 ) ) ( not ( = ?auto_816899 ?auto_816901 ) ) ( not ( = ?auto_816899 ?auto_816902 ) ) ( not ( = ?auto_816899 ?auto_816903 ) ) ( not ( = ?auto_816899 ?auto_816904 ) ) ( not ( = ?auto_816899 ?auto_816905 ) ) ( not ( = ?auto_816899 ?auto_816906 ) ) ( not ( = ?auto_816900 ?auto_816901 ) ) ( not ( = ?auto_816900 ?auto_816902 ) ) ( not ( = ?auto_816900 ?auto_816903 ) ) ( not ( = ?auto_816900 ?auto_816904 ) ) ( not ( = ?auto_816900 ?auto_816905 ) ) ( not ( = ?auto_816900 ?auto_816906 ) ) ( not ( = ?auto_816901 ?auto_816902 ) ) ( not ( = ?auto_816901 ?auto_816903 ) ) ( not ( = ?auto_816901 ?auto_816904 ) ) ( not ( = ?auto_816901 ?auto_816905 ) ) ( not ( = ?auto_816901 ?auto_816906 ) ) ( not ( = ?auto_816902 ?auto_816903 ) ) ( not ( = ?auto_816902 ?auto_816904 ) ) ( not ( = ?auto_816902 ?auto_816905 ) ) ( not ( = ?auto_816902 ?auto_816906 ) ) ( not ( = ?auto_816903 ?auto_816904 ) ) ( not ( = ?auto_816903 ?auto_816905 ) ) ( not ( = ?auto_816903 ?auto_816906 ) ) ( not ( = ?auto_816904 ?auto_816905 ) ) ( not ( = ?auto_816904 ?auto_816906 ) ) ( not ( = ?auto_816905 ?auto_816906 ) ) ( ON ?auto_816904 ?auto_816905 ) ( ON ?auto_816903 ?auto_816904 ) ( ON ?auto_816902 ?auto_816903 ) ( ON ?auto_816901 ?auto_816902 ) ( ON ?auto_816900 ?auto_816901 ) ( ON ?auto_816899 ?auto_816900 ) ( ON ?auto_816898 ?auto_816899 ) ( CLEAR ?auto_816896 ) ( ON ?auto_816897 ?auto_816898 ) ( CLEAR ?auto_816897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_816889 ?auto_816890 ?auto_816891 ?auto_816892 ?auto_816893 ?auto_816894 ?auto_816895 ?auto_816896 ?auto_816897 )
      ( MAKE-17PILE ?auto_816889 ?auto_816890 ?auto_816891 ?auto_816892 ?auto_816893 ?auto_816894 ?auto_816895 ?auto_816896 ?auto_816897 ?auto_816898 ?auto_816899 ?auto_816900 ?auto_816901 ?auto_816902 ?auto_816903 ?auto_816904 ?auto_816905 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_816959 - BLOCK
      ?auto_816960 - BLOCK
      ?auto_816961 - BLOCK
      ?auto_816962 - BLOCK
      ?auto_816963 - BLOCK
      ?auto_816964 - BLOCK
      ?auto_816965 - BLOCK
      ?auto_816966 - BLOCK
      ?auto_816967 - BLOCK
      ?auto_816968 - BLOCK
      ?auto_816969 - BLOCK
      ?auto_816970 - BLOCK
      ?auto_816971 - BLOCK
      ?auto_816972 - BLOCK
      ?auto_816973 - BLOCK
      ?auto_816974 - BLOCK
      ?auto_816975 - BLOCK
    )
    :vars
    (
      ?auto_816976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_816975 ?auto_816976 ) ( ON-TABLE ?auto_816959 ) ( ON ?auto_816960 ?auto_816959 ) ( ON ?auto_816961 ?auto_816960 ) ( ON ?auto_816962 ?auto_816961 ) ( ON ?auto_816963 ?auto_816962 ) ( ON ?auto_816964 ?auto_816963 ) ( ON ?auto_816965 ?auto_816964 ) ( not ( = ?auto_816959 ?auto_816960 ) ) ( not ( = ?auto_816959 ?auto_816961 ) ) ( not ( = ?auto_816959 ?auto_816962 ) ) ( not ( = ?auto_816959 ?auto_816963 ) ) ( not ( = ?auto_816959 ?auto_816964 ) ) ( not ( = ?auto_816959 ?auto_816965 ) ) ( not ( = ?auto_816959 ?auto_816966 ) ) ( not ( = ?auto_816959 ?auto_816967 ) ) ( not ( = ?auto_816959 ?auto_816968 ) ) ( not ( = ?auto_816959 ?auto_816969 ) ) ( not ( = ?auto_816959 ?auto_816970 ) ) ( not ( = ?auto_816959 ?auto_816971 ) ) ( not ( = ?auto_816959 ?auto_816972 ) ) ( not ( = ?auto_816959 ?auto_816973 ) ) ( not ( = ?auto_816959 ?auto_816974 ) ) ( not ( = ?auto_816959 ?auto_816975 ) ) ( not ( = ?auto_816959 ?auto_816976 ) ) ( not ( = ?auto_816960 ?auto_816961 ) ) ( not ( = ?auto_816960 ?auto_816962 ) ) ( not ( = ?auto_816960 ?auto_816963 ) ) ( not ( = ?auto_816960 ?auto_816964 ) ) ( not ( = ?auto_816960 ?auto_816965 ) ) ( not ( = ?auto_816960 ?auto_816966 ) ) ( not ( = ?auto_816960 ?auto_816967 ) ) ( not ( = ?auto_816960 ?auto_816968 ) ) ( not ( = ?auto_816960 ?auto_816969 ) ) ( not ( = ?auto_816960 ?auto_816970 ) ) ( not ( = ?auto_816960 ?auto_816971 ) ) ( not ( = ?auto_816960 ?auto_816972 ) ) ( not ( = ?auto_816960 ?auto_816973 ) ) ( not ( = ?auto_816960 ?auto_816974 ) ) ( not ( = ?auto_816960 ?auto_816975 ) ) ( not ( = ?auto_816960 ?auto_816976 ) ) ( not ( = ?auto_816961 ?auto_816962 ) ) ( not ( = ?auto_816961 ?auto_816963 ) ) ( not ( = ?auto_816961 ?auto_816964 ) ) ( not ( = ?auto_816961 ?auto_816965 ) ) ( not ( = ?auto_816961 ?auto_816966 ) ) ( not ( = ?auto_816961 ?auto_816967 ) ) ( not ( = ?auto_816961 ?auto_816968 ) ) ( not ( = ?auto_816961 ?auto_816969 ) ) ( not ( = ?auto_816961 ?auto_816970 ) ) ( not ( = ?auto_816961 ?auto_816971 ) ) ( not ( = ?auto_816961 ?auto_816972 ) ) ( not ( = ?auto_816961 ?auto_816973 ) ) ( not ( = ?auto_816961 ?auto_816974 ) ) ( not ( = ?auto_816961 ?auto_816975 ) ) ( not ( = ?auto_816961 ?auto_816976 ) ) ( not ( = ?auto_816962 ?auto_816963 ) ) ( not ( = ?auto_816962 ?auto_816964 ) ) ( not ( = ?auto_816962 ?auto_816965 ) ) ( not ( = ?auto_816962 ?auto_816966 ) ) ( not ( = ?auto_816962 ?auto_816967 ) ) ( not ( = ?auto_816962 ?auto_816968 ) ) ( not ( = ?auto_816962 ?auto_816969 ) ) ( not ( = ?auto_816962 ?auto_816970 ) ) ( not ( = ?auto_816962 ?auto_816971 ) ) ( not ( = ?auto_816962 ?auto_816972 ) ) ( not ( = ?auto_816962 ?auto_816973 ) ) ( not ( = ?auto_816962 ?auto_816974 ) ) ( not ( = ?auto_816962 ?auto_816975 ) ) ( not ( = ?auto_816962 ?auto_816976 ) ) ( not ( = ?auto_816963 ?auto_816964 ) ) ( not ( = ?auto_816963 ?auto_816965 ) ) ( not ( = ?auto_816963 ?auto_816966 ) ) ( not ( = ?auto_816963 ?auto_816967 ) ) ( not ( = ?auto_816963 ?auto_816968 ) ) ( not ( = ?auto_816963 ?auto_816969 ) ) ( not ( = ?auto_816963 ?auto_816970 ) ) ( not ( = ?auto_816963 ?auto_816971 ) ) ( not ( = ?auto_816963 ?auto_816972 ) ) ( not ( = ?auto_816963 ?auto_816973 ) ) ( not ( = ?auto_816963 ?auto_816974 ) ) ( not ( = ?auto_816963 ?auto_816975 ) ) ( not ( = ?auto_816963 ?auto_816976 ) ) ( not ( = ?auto_816964 ?auto_816965 ) ) ( not ( = ?auto_816964 ?auto_816966 ) ) ( not ( = ?auto_816964 ?auto_816967 ) ) ( not ( = ?auto_816964 ?auto_816968 ) ) ( not ( = ?auto_816964 ?auto_816969 ) ) ( not ( = ?auto_816964 ?auto_816970 ) ) ( not ( = ?auto_816964 ?auto_816971 ) ) ( not ( = ?auto_816964 ?auto_816972 ) ) ( not ( = ?auto_816964 ?auto_816973 ) ) ( not ( = ?auto_816964 ?auto_816974 ) ) ( not ( = ?auto_816964 ?auto_816975 ) ) ( not ( = ?auto_816964 ?auto_816976 ) ) ( not ( = ?auto_816965 ?auto_816966 ) ) ( not ( = ?auto_816965 ?auto_816967 ) ) ( not ( = ?auto_816965 ?auto_816968 ) ) ( not ( = ?auto_816965 ?auto_816969 ) ) ( not ( = ?auto_816965 ?auto_816970 ) ) ( not ( = ?auto_816965 ?auto_816971 ) ) ( not ( = ?auto_816965 ?auto_816972 ) ) ( not ( = ?auto_816965 ?auto_816973 ) ) ( not ( = ?auto_816965 ?auto_816974 ) ) ( not ( = ?auto_816965 ?auto_816975 ) ) ( not ( = ?auto_816965 ?auto_816976 ) ) ( not ( = ?auto_816966 ?auto_816967 ) ) ( not ( = ?auto_816966 ?auto_816968 ) ) ( not ( = ?auto_816966 ?auto_816969 ) ) ( not ( = ?auto_816966 ?auto_816970 ) ) ( not ( = ?auto_816966 ?auto_816971 ) ) ( not ( = ?auto_816966 ?auto_816972 ) ) ( not ( = ?auto_816966 ?auto_816973 ) ) ( not ( = ?auto_816966 ?auto_816974 ) ) ( not ( = ?auto_816966 ?auto_816975 ) ) ( not ( = ?auto_816966 ?auto_816976 ) ) ( not ( = ?auto_816967 ?auto_816968 ) ) ( not ( = ?auto_816967 ?auto_816969 ) ) ( not ( = ?auto_816967 ?auto_816970 ) ) ( not ( = ?auto_816967 ?auto_816971 ) ) ( not ( = ?auto_816967 ?auto_816972 ) ) ( not ( = ?auto_816967 ?auto_816973 ) ) ( not ( = ?auto_816967 ?auto_816974 ) ) ( not ( = ?auto_816967 ?auto_816975 ) ) ( not ( = ?auto_816967 ?auto_816976 ) ) ( not ( = ?auto_816968 ?auto_816969 ) ) ( not ( = ?auto_816968 ?auto_816970 ) ) ( not ( = ?auto_816968 ?auto_816971 ) ) ( not ( = ?auto_816968 ?auto_816972 ) ) ( not ( = ?auto_816968 ?auto_816973 ) ) ( not ( = ?auto_816968 ?auto_816974 ) ) ( not ( = ?auto_816968 ?auto_816975 ) ) ( not ( = ?auto_816968 ?auto_816976 ) ) ( not ( = ?auto_816969 ?auto_816970 ) ) ( not ( = ?auto_816969 ?auto_816971 ) ) ( not ( = ?auto_816969 ?auto_816972 ) ) ( not ( = ?auto_816969 ?auto_816973 ) ) ( not ( = ?auto_816969 ?auto_816974 ) ) ( not ( = ?auto_816969 ?auto_816975 ) ) ( not ( = ?auto_816969 ?auto_816976 ) ) ( not ( = ?auto_816970 ?auto_816971 ) ) ( not ( = ?auto_816970 ?auto_816972 ) ) ( not ( = ?auto_816970 ?auto_816973 ) ) ( not ( = ?auto_816970 ?auto_816974 ) ) ( not ( = ?auto_816970 ?auto_816975 ) ) ( not ( = ?auto_816970 ?auto_816976 ) ) ( not ( = ?auto_816971 ?auto_816972 ) ) ( not ( = ?auto_816971 ?auto_816973 ) ) ( not ( = ?auto_816971 ?auto_816974 ) ) ( not ( = ?auto_816971 ?auto_816975 ) ) ( not ( = ?auto_816971 ?auto_816976 ) ) ( not ( = ?auto_816972 ?auto_816973 ) ) ( not ( = ?auto_816972 ?auto_816974 ) ) ( not ( = ?auto_816972 ?auto_816975 ) ) ( not ( = ?auto_816972 ?auto_816976 ) ) ( not ( = ?auto_816973 ?auto_816974 ) ) ( not ( = ?auto_816973 ?auto_816975 ) ) ( not ( = ?auto_816973 ?auto_816976 ) ) ( not ( = ?auto_816974 ?auto_816975 ) ) ( not ( = ?auto_816974 ?auto_816976 ) ) ( not ( = ?auto_816975 ?auto_816976 ) ) ( ON ?auto_816974 ?auto_816975 ) ( ON ?auto_816973 ?auto_816974 ) ( ON ?auto_816972 ?auto_816973 ) ( ON ?auto_816971 ?auto_816972 ) ( ON ?auto_816970 ?auto_816971 ) ( ON ?auto_816969 ?auto_816970 ) ( ON ?auto_816968 ?auto_816969 ) ( ON ?auto_816967 ?auto_816968 ) ( CLEAR ?auto_816965 ) ( ON ?auto_816966 ?auto_816967 ) ( CLEAR ?auto_816966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_816959 ?auto_816960 ?auto_816961 ?auto_816962 ?auto_816963 ?auto_816964 ?auto_816965 ?auto_816966 )
      ( MAKE-17PILE ?auto_816959 ?auto_816960 ?auto_816961 ?auto_816962 ?auto_816963 ?auto_816964 ?auto_816965 ?auto_816966 ?auto_816967 ?auto_816968 ?auto_816969 ?auto_816970 ?auto_816971 ?auto_816972 ?auto_816973 ?auto_816974 ?auto_816975 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817029 - BLOCK
      ?auto_817030 - BLOCK
      ?auto_817031 - BLOCK
      ?auto_817032 - BLOCK
      ?auto_817033 - BLOCK
      ?auto_817034 - BLOCK
      ?auto_817035 - BLOCK
      ?auto_817036 - BLOCK
      ?auto_817037 - BLOCK
      ?auto_817038 - BLOCK
      ?auto_817039 - BLOCK
      ?auto_817040 - BLOCK
      ?auto_817041 - BLOCK
      ?auto_817042 - BLOCK
      ?auto_817043 - BLOCK
      ?auto_817044 - BLOCK
      ?auto_817045 - BLOCK
    )
    :vars
    (
      ?auto_817046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817045 ?auto_817046 ) ( ON-TABLE ?auto_817029 ) ( ON ?auto_817030 ?auto_817029 ) ( ON ?auto_817031 ?auto_817030 ) ( ON ?auto_817032 ?auto_817031 ) ( ON ?auto_817033 ?auto_817032 ) ( ON ?auto_817034 ?auto_817033 ) ( not ( = ?auto_817029 ?auto_817030 ) ) ( not ( = ?auto_817029 ?auto_817031 ) ) ( not ( = ?auto_817029 ?auto_817032 ) ) ( not ( = ?auto_817029 ?auto_817033 ) ) ( not ( = ?auto_817029 ?auto_817034 ) ) ( not ( = ?auto_817029 ?auto_817035 ) ) ( not ( = ?auto_817029 ?auto_817036 ) ) ( not ( = ?auto_817029 ?auto_817037 ) ) ( not ( = ?auto_817029 ?auto_817038 ) ) ( not ( = ?auto_817029 ?auto_817039 ) ) ( not ( = ?auto_817029 ?auto_817040 ) ) ( not ( = ?auto_817029 ?auto_817041 ) ) ( not ( = ?auto_817029 ?auto_817042 ) ) ( not ( = ?auto_817029 ?auto_817043 ) ) ( not ( = ?auto_817029 ?auto_817044 ) ) ( not ( = ?auto_817029 ?auto_817045 ) ) ( not ( = ?auto_817029 ?auto_817046 ) ) ( not ( = ?auto_817030 ?auto_817031 ) ) ( not ( = ?auto_817030 ?auto_817032 ) ) ( not ( = ?auto_817030 ?auto_817033 ) ) ( not ( = ?auto_817030 ?auto_817034 ) ) ( not ( = ?auto_817030 ?auto_817035 ) ) ( not ( = ?auto_817030 ?auto_817036 ) ) ( not ( = ?auto_817030 ?auto_817037 ) ) ( not ( = ?auto_817030 ?auto_817038 ) ) ( not ( = ?auto_817030 ?auto_817039 ) ) ( not ( = ?auto_817030 ?auto_817040 ) ) ( not ( = ?auto_817030 ?auto_817041 ) ) ( not ( = ?auto_817030 ?auto_817042 ) ) ( not ( = ?auto_817030 ?auto_817043 ) ) ( not ( = ?auto_817030 ?auto_817044 ) ) ( not ( = ?auto_817030 ?auto_817045 ) ) ( not ( = ?auto_817030 ?auto_817046 ) ) ( not ( = ?auto_817031 ?auto_817032 ) ) ( not ( = ?auto_817031 ?auto_817033 ) ) ( not ( = ?auto_817031 ?auto_817034 ) ) ( not ( = ?auto_817031 ?auto_817035 ) ) ( not ( = ?auto_817031 ?auto_817036 ) ) ( not ( = ?auto_817031 ?auto_817037 ) ) ( not ( = ?auto_817031 ?auto_817038 ) ) ( not ( = ?auto_817031 ?auto_817039 ) ) ( not ( = ?auto_817031 ?auto_817040 ) ) ( not ( = ?auto_817031 ?auto_817041 ) ) ( not ( = ?auto_817031 ?auto_817042 ) ) ( not ( = ?auto_817031 ?auto_817043 ) ) ( not ( = ?auto_817031 ?auto_817044 ) ) ( not ( = ?auto_817031 ?auto_817045 ) ) ( not ( = ?auto_817031 ?auto_817046 ) ) ( not ( = ?auto_817032 ?auto_817033 ) ) ( not ( = ?auto_817032 ?auto_817034 ) ) ( not ( = ?auto_817032 ?auto_817035 ) ) ( not ( = ?auto_817032 ?auto_817036 ) ) ( not ( = ?auto_817032 ?auto_817037 ) ) ( not ( = ?auto_817032 ?auto_817038 ) ) ( not ( = ?auto_817032 ?auto_817039 ) ) ( not ( = ?auto_817032 ?auto_817040 ) ) ( not ( = ?auto_817032 ?auto_817041 ) ) ( not ( = ?auto_817032 ?auto_817042 ) ) ( not ( = ?auto_817032 ?auto_817043 ) ) ( not ( = ?auto_817032 ?auto_817044 ) ) ( not ( = ?auto_817032 ?auto_817045 ) ) ( not ( = ?auto_817032 ?auto_817046 ) ) ( not ( = ?auto_817033 ?auto_817034 ) ) ( not ( = ?auto_817033 ?auto_817035 ) ) ( not ( = ?auto_817033 ?auto_817036 ) ) ( not ( = ?auto_817033 ?auto_817037 ) ) ( not ( = ?auto_817033 ?auto_817038 ) ) ( not ( = ?auto_817033 ?auto_817039 ) ) ( not ( = ?auto_817033 ?auto_817040 ) ) ( not ( = ?auto_817033 ?auto_817041 ) ) ( not ( = ?auto_817033 ?auto_817042 ) ) ( not ( = ?auto_817033 ?auto_817043 ) ) ( not ( = ?auto_817033 ?auto_817044 ) ) ( not ( = ?auto_817033 ?auto_817045 ) ) ( not ( = ?auto_817033 ?auto_817046 ) ) ( not ( = ?auto_817034 ?auto_817035 ) ) ( not ( = ?auto_817034 ?auto_817036 ) ) ( not ( = ?auto_817034 ?auto_817037 ) ) ( not ( = ?auto_817034 ?auto_817038 ) ) ( not ( = ?auto_817034 ?auto_817039 ) ) ( not ( = ?auto_817034 ?auto_817040 ) ) ( not ( = ?auto_817034 ?auto_817041 ) ) ( not ( = ?auto_817034 ?auto_817042 ) ) ( not ( = ?auto_817034 ?auto_817043 ) ) ( not ( = ?auto_817034 ?auto_817044 ) ) ( not ( = ?auto_817034 ?auto_817045 ) ) ( not ( = ?auto_817034 ?auto_817046 ) ) ( not ( = ?auto_817035 ?auto_817036 ) ) ( not ( = ?auto_817035 ?auto_817037 ) ) ( not ( = ?auto_817035 ?auto_817038 ) ) ( not ( = ?auto_817035 ?auto_817039 ) ) ( not ( = ?auto_817035 ?auto_817040 ) ) ( not ( = ?auto_817035 ?auto_817041 ) ) ( not ( = ?auto_817035 ?auto_817042 ) ) ( not ( = ?auto_817035 ?auto_817043 ) ) ( not ( = ?auto_817035 ?auto_817044 ) ) ( not ( = ?auto_817035 ?auto_817045 ) ) ( not ( = ?auto_817035 ?auto_817046 ) ) ( not ( = ?auto_817036 ?auto_817037 ) ) ( not ( = ?auto_817036 ?auto_817038 ) ) ( not ( = ?auto_817036 ?auto_817039 ) ) ( not ( = ?auto_817036 ?auto_817040 ) ) ( not ( = ?auto_817036 ?auto_817041 ) ) ( not ( = ?auto_817036 ?auto_817042 ) ) ( not ( = ?auto_817036 ?auto_817043 ) ) ( not ( = ?auto_817036 ?auto_817044 ) ) ( not ( = ?auto_817036 ?auto_817045 ) ) ( not ( = ?auto_817036 ?auto_817046 ) ) ( not ( = ?auto_817037 ?auto_817038 ) ) ( not ( = ?auto_817037 ?auto_817039 ) ) ( not ( = ?auto_817037 ?auto_817040 ) ) ( not ( = ?auto_817037 ?auto_817041 ) ) ( not ( = ?auto_817037 ?auto_817042 ) ) ( not ( = ?auto_817037 ?auto_817043 ) ) ( not ( = ?auto_817037 ?auto_817044 ) ) ( not ( = ?auto_817037 ?auto_817045 ) ) ( not ( = ?auto_817037 ?auto_817046 ) ) ( not ( = ?auto_817038 ?auto_817039 ) ) ( not ( = ?auto_817038 ?auto_817040 ) ) ( not ( = ?auto_817038 ?auto_817041 ) ) ( not ( = ?auto_817038 ?auto_817042 ) ) ( not ( = ?auto_817038 ?auto_817043 ) ) ( not ( = ?auto_817038 ?auto_817044 ) ) ( not ( = ?auto_817038 ?auto_817045 ) ) ( not ( = ?auto_817038 ?auto_817046 ) ) ( not ( = ?auto_817039 ?auto_817040 ) ) ( not ( = ?auto_817039 ?auto_817041 ) ) ( not ( = ?auto_817039 ?auto_817042 ) ) ( not ( = ?auto_817039 ?auto_817043 ) ) ( not ( = ?auto_817039 ?auto_817044 ) ) ( not ( = ?auto_817039 ?auto_817045 ) ) ( not ( = ?auto_817039 ?auto_817046 ) ) ( not ( = ?auto_817040 ?auto_817041 ) ) ( not ( = ?auto_817040 ?auto_817042 ) ) ( not ( = ?auto_817040 ?auto_817043 ) ) ( not ( = ?auto_817040 ?auto_817044 ) ) ( not ( = ?auto_817040 ?auto_817045 ) ) ( not ( = ?auto_817040 ?auto_817046 ) ) ( not ( = ?auto_817041 ?auto_817042 ) ) ( not ( = ?auto_817041 ?auto_817043 ) ) ( not ( = ?auto_817041 ?auto_817044 ) ) ( not ( = ?auto_817041 ?auto_817045 ) ) ( not ( = ?auto_817041 ?auto_817046 ) ) ( not ( = ?auto_817042 ?auto_817043 ) ) ( not ( = ?auto_817042 ?auto_817044 ) ) ( not ( = ?auto_817042 ?auto_817045 ) ) ( not ( = ?auto_817042 ?auto_817046 ) ) ( not ( = ?auto_817043 ?auto_817044 ) ) ( not ( = ?auto_817043 ?auto_817045 ) ) ( not ( = ?auto_817043 ?auto_817046 ) ) ( not ( = ?auto_817044 ?auto_817045 ) ) ( not ( = ?auto_817044 ?auto_817046 ) ) ( not ( = ?auto_817045 ?auto_817046 ) ) ( ON ?auto_817044 ?auto_817045 ) ( ON ?auto_817043 ?auto_817044 ) ( ON ?auto_817042 ?auto_817043 ) ( ON ?auto_817041 ?auto_817042 ) ( ON ?auto_817040 ?auto_817041 ) ( ON ?auto_817039 ?auto_817040 ) ( ON ?auto_817038 ?auto_817039 ) ( ON ?auto_817037 ?auto_817038 ) ( ON ?auto_817036 ?auto_817037 ) ( CLEAR ?auto_817034 ) ( ON ?auto_817035 ?auto_817036 ) ( CLEAR ?auto_817035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_817029 ?auto_817030 ?auto_817031 ?auto_817032 ?auto_817033 ?auto_817034 ?auto_817035 )
      ( MAKE-17PILE ?auto_817029 ?auto_817030 ?auto_817031 ?auto_817032 ?auto_817033 ?auto_817034 ?auto_817035 ?auto_817036 ?auto_817037 ?auto_817038 ?auto_817039 ?auto_817040 ?auto_817041 ?auto_817042 ?auto_817043 ?auto_817044 ?auto_817045 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817099 - BLOCK
      ?auto_817100 - BLOCK
      ?auto_817101 - BLOCK
      ?auto_817102 - BLOCK
      ?auto_817103 - BLOCK
      ?auto_817104 - BLOCK
      ?auto_817105 - BLOCK
      ?auto_817106 - BLOCK
      ?auto_817107 - BLOCK
      ?auto_817108 - BLOCK
      ?auto_817109 - BLOCK
      ?auto_817110 - BLOCK
      ?auto_817111 - BLOCK
      ?auto_817112 - BLOCK
      ?auto_817113 - BLOCK
      ?auto_817114 - BLOCK
      ?auto_817115 - BLOCK
    )
    :vars
    (
      ?auto_817116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817115 ?auto_817116 ) ( ON-TABLE ?auto_817099 ) ( ON ?auto_817100 ?auto_817099 ) ( ON ?auto_817101 ?auto_817100 ) ( ON ?auto_817102 ?auto_817101 ) ( ON ?auto_817103 ?auto_817102 ) ( not ( = ?auto_817099 ?auto_817100 ) ) ( not ( = ?auto_817099 ?auto_817101 ) ) ( not ( = ?auto_817099 ?auto_817102 ) ) ( not ( = ?auto_817099 ?auto_817103 ) ) ( not ( = ?auto_817099 ?auto_817104 ) ) ( not ( = ?auto_817099 ?auto_817105 ) ) ( not ( = ?auto_817099 ?auto_817106 ) ) ( not ( = ?auto_817099 ?auto_817107 ) ) ( not ( = ?auto_817099 ?auto_817108 ) ) ( not ( = ?auto_817099 ?auto_817109 ) ) ( not ( = ?auto_817099 ?auto_817110 ) ) ( not ( = ?auto_817099 ?auto_817111 ) ) ( not ( = ?auto_817099 ?auto_817112 ) ) ( not ( = ?auto_817099 ?auto_817113 ) ) ( not ( = ?auto_817099 ?auto_817114 ) ) ( not ( = ?auto_817099 ?auto_817115 ) ) ( not ( = ?auto_817099 ?auto_817116 ) ) ( not ( = ?auto_817100 ?auto_817101 ) ) ( not ( = ?auto_817100 ?auto_817102 ) ) ( not ( = ?auto_817100 ?auto_817103 ) ) ( not ( = ?auto_817100 ?auto_817104 ) ) ( not ( = ?auto_817100 ?auto_817105 ) ) ( not ( = ?auto_817100 ?auto_817106 ) ) ( not ( = ?auto_817100 ?auto_817107 ) ) ( not ( = ?auto_817100 ?auto_817108 ) ) ( not ( = ?auto_817100 ?auto_817109 ) ) ( not ( = ?auto_817100 ?auto_817110 ) ) ( not ( = ?auto_817100 ?auto_817111 ) ) ( not ( = ?auto_817100 ?auto_817112 ) ) ( not ( = ?auto_817100 ?auto_817113 ) ) ( not ( = ?auto_817100 ?auto_817114 ) ) ( not ( = ?auto_817100 ?auto_817115 ) ) ( not ( = ?auto_817100 ?auto_817116 ) ) ( not ( = ?auto_817101 ?auto_817102 ) ) ( not ( = ?auto_817101 ?auto_817103 ) ) ( not ( = ?auto_817101 ?auto_817104 ) ) ( not ( = ?auto_817101 ?auto_817105 ) ) ( not ( = ?auto_817101 ?auto_817106 ) ) ( not ( = ?auto_817101 ?auto_817107 ) ) ( not ( = ?auto_817101 ?auto_817108 ) ) ( not ( = ?auto_817101 ?auto_817109 ) ) ( not ( = ?auto_817101 ?auto_817110 ) ) ( not ( = ?auto_817101 ?auto_817111 ) ) ( not ( = ?auto_817101 ?auto_817112 ) ) ( not ( = ?auto_817101 ?auto_817113 ) ) ( not ( = ?auto_817101 ?auto_817114 ) ) ( not ( = ?auto_817101 ?auto_817115 ) ) ( not ( = ?auto_817101 ?auto_817116 ) ) ( not ( = ?auto_817102 ?auto_817103 ) ) ( not ( = ?auto_817102 ?auto_817104 ) ) ( not ( = ?auto_817102 ?auto_817105 ) ) ( not ( = ?auto_817102 ?auto_817106 ) ) ( not ( = ?auto_817102 ?auto_817107 ) ) ( not ( = ?auto_817102 ?auto_817108 ) ) ( not ( = ?auto_817102 ?auto_817109 ) ) ( not ( = ?auto_817102 ?auto_817110 ) ) ( not ( = ?auto_817102 ?auto_817111 ) ) ( not ( = ?auto_817102 ?auto_817112 ) ) ( not ( = ?auto_817102 ?auto_817113 ) ) ( not ( = ?auto_817102 ?auto_817114 ) ) ( not ( = ?auto_817102 ?auto_817115 ) ) ( not ( = ?auto_817102 ?auto_817116 ) ) ( not ( = ?auto_817103 ?auto_817104 ) ) ( not ( = ?auto_817103 ?auto_817105 ) ) ( not ( = ?auto_817103 ?auto_817106 ) ) ( not ( = ?auto_817103 ?auto_817107 ) ) ( not ( = ?auto_817103 ?auto_817108 ) ) ( not ( = ?auto_817103 ?auto_817109 ) ) ( not ( = ?auto_817103 ?auto_817110 ) ) ( not ( = ?auto_817103 ?auto_817111 ) ) ( not ( = ?auto_817103 ?auto_817112 ) ) ( not ( = ?auto_817103 ?auto_817113 ) ) ( not ( = ?auto_817103 ?auto_817114 ) ) ( not ( = ?auto_817103 ?auto_817115 ) ) ( not ( = ?auto_817103 ?auto_817116 ) ) ( not ( = ?auto_817104 ?auto_817105 ) ) ( not ( = ?auto_817104 ?auto_817106 ) ) ( not ( = ?auto_817104 ?auto_817107 ) ) ( not ( = ?auto_817104 ?auto_817108 ) ) ( not ( = ?auto_817104 ?auto_817109 ) ) ( not ( = ?auto_817104 ?auto_817110 ) ) ( not ( = ?auto_817104 ?auto_817111 ) ) ( not ( = ?auto_817104 ?auto_817112 ) ) ( not ( = ?auto_817104 ?auto_817113 ) ) ( not ( = ?auto_817104 ?auto_817114 ) ) ( not ( = ?auto_817104 ?auto_817115 ) ) ( not ( = ?auto_817104 ?auto_817116 ) ) ( not ( = ?auto_817105 ?auto_817106 ) ) ( not ( = ?auto_817105 ?auto_817107 ) ) ( not ( = ?auto_817105 ?auto_817108 ) ) ( not ( = ?auto_817105 ?auto_817109 ) ) ( not ( = ?auto_817105 ?auto_817110 ) ) ( not ( = ?auto_817105 ?auto_817111 ) ) ( not ( = ?auto_817105 ?auto_817112 ) ) ( not ( = ?auto_817105 ?auto_817113 ) ) ( not ( = ?auto_817105 ?auto_817114 ) ) ( not ( = ?auto_817105 ?auto_817115 ) ) ( not ( = ?auto_817105 ?auto_817116 ) ) ( not ( = ?auto_817106 ?auto_817107 ) ) ( not ( = ?auto_817106 ?auto_817108 ) ) ( not ( = ?auto_817106 ?auto_817109 ) ) ( not ( = ?auto_817106 ?auto_817110 ) ) ( not ( = ?auto_817106 ?auto_817111 ) ) ( not ( = ?auto_817106 ?auto_817112 ) ) ( not ( = ?auto_817106 ?auto_817113 ) ) ( not ( = ?auto_817106 ?auto_817114 ) ) ( not ( = ?auto_817106 ?auto_817115 ) ) ( not ( = ?auto_817106 ?auto_817116 ) ) ( not ( = ?auto_817107 ?auto_817108 ) ) ( not ( = ?auto_817107 ?auto_817109 ) ) ( not ( = ?auto_817107 ?auto_817110 ) ) ( not ( = ?auto_817107 ?auto_817111 ) ) ( not ( = ?auto_817107 ?auto_817112 ) ) ( not ( = ?auto_817107 ?auto_817113 ) ) ( not ( = ?auto_817107 ?auto_817114 ) ) ( not ( = ?auto_817107 ?auto_817115 ) ) ( not ( = ?auto_817107 ?auto_817116 ) ) ( not ( = ?auto_817108 ?auto_817109 ) ) ( not ( = ?auto_817108 ?auto_817110 ) ) ( not ( = ?auto_817108 ?auto_817111 ) ) ( not ( = ?auto_817108 ?auto_817112 ) ) ( not ( = ?auto_817108 ?auto_817113 ) ) ( not ( = ?auto_817108 ?auto_817114 ) ) ( not ( = ?auto_817108 ?auto_817115 ) ) ( not ( = ?auto_817108 ?auto_817116 ) ) ( not ( = ?auto_817109 ?auto_817110 ) ) ( not ( = ?auto_817109 ?auto_817111 ) ) ( not ( = ?auto_817109 ?auto_817112 ) ) ( not ( = ?auto_817109 ?auto_817113 ) ) ( not ( = ?auto_817109 ?auto_817114 ) ) ( not ( = ?auto_817109 ?auto_817115 ) ) ( not ( = ?auto_817109 ?auto_817116 ) ) ( not ( = ?auto_817110 ?auto_817111 ) ) ( not ( = ?auto_817110 ?auto_817112 ) ) ( not ( = ?auto_817110 ?auto_817113 ) ) ( not ( = ?auto_817110 ?auto_817114 ) ) ( not ( = ?auto_817110 ?auto_817115 ) ) ( not ( = ?auto_817110 ?auto_817116 ) ) ( not ( = ?auto_817111 ?auto_817112 ) ) ( not ( = ?auto_817111 ?auto_817113 ) ) ( not ( = ?auto_817111 ?auto_817114 ) ) ( not ( = ?auto_817111 ?auto_817115 ) ) ( not ( = ?auto_817111 ?auto_817116 ) ) ( not ( = ?auto_817112 ?auto_817113 ) ) ( not ( = ?auto_817112 ?auto_817114 ) ) ( not ( = ?auto_817112 ?auto_817115 ) ) ( not ( = ?auto_817112 ?auto_817116 ) ) ( not ( = ?auto_817113 ?auto_817114 ) ) ( not ( = ?auto_817113 ?auto_817115 ) ) ( not ( = ?auto_817113 ?auto_817116 ) ) ( not ( = ?auto_817114 ?auto_817115 ) ) ( not ( = ?auto_817114 ?auto_817116 ) ) ( not ( = ?auto_817115 ?auto_817116 ) ) ( ON ?auto_817114 ?auto_817115 ) ( ON ?auto_817113 ?auto_817114 ) ( ON ?auto_817112 ?auto_817113 ) ( ON ?auto_817111 ?auto_817112 ) ( ON ?auto_817110 ?auto_817111 ) ( ON ?auto_817109 ?auto_817110 ) ( ON ?auto_817108 ?auto_817109 ) ( ON ?auto_817107 ?auto_817108 ) ( ON ?auto_817106 ?auto_817107 ) ( ON ?auto_817105 ?auto_817106 ) ( CLEAR ?auto_817103 ) ( ON ?auto_817104 ?auto_817105 ) ( CLEAR ?auto_817104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_817099 ?auto_817100 ?auto_817101 ?auto_817102 ?auto_817103 ?auto_817104 )
      ( MAKE-17PILE ?auto_817099 ?auto_817100 ?auto_817101 ?auto_817102 ?auto_817103 ?auto_817104 ?auto_817105 ?auto_817106 ?auto_817107 ?auto_817108 ?auto_817109 ?auto_817110 ?auto_817111 ?auto_817112 ?auto_817113 ?auto_817114 ?auto_817115 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817169 - BLOCK
      ?auto_817170 - BLOCK
      ?auto_817171 - BLOCK
      ?auto_817172 - BLOCK
      ?auto_817173 - BLOCK
      ?auto_817174 - BLOCK
      ?auto_817175 - BLOCK
      ?auto_817176 - BLOCK
      ?auto_817177 - BLOCK
      ?auto_817178 - BLOCK
      ?auto_817179 - BLOCK
      ?auto_817180 - BLOCK
      ?auto_817181 - BLOCK
      ?auto_817182 - BLOCK
      ?auto_817183 - BLOCK
      ?auto_817184 - BLOCK
      ?auto_817185 - BLOCK
    )
    :vars
    (
      ?auto_817186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817185 ?auto_817186 ) ( ON-TABLE ?auto_817169 ) ( ON ?auto_817170 ?auto_817169 ) ( ON ?auto_817171 ?auto_817170 ) ( ON ?auto_817172 ?auto_817171 ) ( not ( = ?auto_817169 ?auto_817170 ) ) ( not ( = ?auto_817169 ?auto_817171 ) ) ( not ( = ?auto_817169 ?auto_817172 ) ) ( not ( = ?auto_817169 ?auto_817173 ) ) ( not ( = ?auto_817169 ?auto_817174 ) ) ( not ( = ?auto_817169 ?auto_817175 ) ) ( not ( = ?auto_817169 ?auto_817176 ) ) ( not ( = ?auto_817169 ?auto_817177 ) ) ( not ( = ?auto_817169 ?auto_817178 ) ) ( not ( = ?auto_817169 ?auto_817179 ) ) ( not ( = ?auto_817169 ?auto_817180 ) ) ( not ( = ?auto_817169 ?auto_817181 ) ) ( not ( = ?auto_817169 ?auto_817182 ) ) ( not ( = ?auto_817169 ?auto_817183 ) ) ( not ( = ?auto_817169 ?auto_817184 ) ) ( not ( = ?auto_817169 ?auto_817185 ) ) ( not ( = ?auto_817169 ?auto_817186 ) ) ( not ( = ?auto_817170 ?auto_817171 ) ) ( not ( = ?auto_817170 ?auto_817172 ) ) ( not ( = ?auto_817170 ?auto_817173 ) ) ( not ( = ?auto_817170 ?auto_817174 ) ) ( not ( = ?auto_817170 ?auto_817175 ) ) ( not ( = ?auto_817170 ?auto_817176 ) ) ( not ( = ?auto_817170 ?auto_817177 ) ) ( not ( = ?auto_817170 ?auto_817178 ) ) ( not ( = ?auto_817170 ?auto_817179 ) ) ( not ( = ?auto_817170 ?auto_817180 ) ) ( not ( = ?auto_817170 ?auto_817181 ) ) ( not ( = ?auto_817170 ?auto_817182 ) ) ( not ( = ?auto_817170 ?auto_817183 ) ) ( not ( = ?auto_817170 ?auto_817184 ) ) ( not ( = ?auto_817170 ?auto_817185 ) ) ( not ( = ?auto_817170 ?auto_817186 ) ) ( not ( = ?auto_817171 ?auto_817172 ) ) ( not ( = ?auto_817171 ?auto_817173 ) ) ( not ( = ?auto_817171 ?auto_817174 ) ) ( not ( = ?auto_817171 ?auto_817175 ) ) ( not ( = ?auto_817171 ?auto_817176 ) ) ( not ( = ?auto_817171 ?auto_817177 ) ) ( not ( = ?auto_817171 ?auto_817178 ) ) ( not ( = ?auto_817171 ?auto_817179 ) ) ( not ( = ?auto_817171 ?auto_817180 ) ) ( not ( = ?auto_817171 ?auto_817181 ) ) ( not ( = ?auto_817171 ?auto_817182 ) ) ( not ( = ?auto_817171 ?auto_817183 ) ) ( not ( = ?auto_817171 ?auto_817184 ) ) ( not ( = ?auto_817171 ?auto_817185 ) ) ( not ( = ?auto_817171 ?auto_817186 ) ) ( not ( = ?auto_817172 ?auto_817173 ) ) ( not ( = ?auto_817172 ?auto_817174 ) ) ( not ( = ?auto_817172 ?auto_817175 ) ) ( not ( = ?auto_817172 ?auto_817176 ) ) ( not ( = ?auto_817172 ?auto_817177 ) ) ( not ( = ?auto_817172 ?auto_817178 ) ) ( not ( = ?auto_817172 ?auto_817179 ) ) ( not ( = ?auto_817172 ?auto_817180 ) ) ( not ( = ?auto_817172 ?auto_817181 ) ) ( not ( = ?auto_817172 ?auto_817182 ) ) ( not ( = ?auto_817172 ?auto_817183 ) ) ( not ( = ?auto_817172 ?auto_817184 ) ) ( not ( = ?auto_817172 ?auto_817185 ) ) ( not ( = ?auto_817172 ?auto_817186 ) ) ( not ( = ?auto_817173 ?auto_817174 ) ) ( not ( = ?auto_817173 ?auto_817175 ) ) ( not ( = ?auto_817173 ?auto_817176 ) ) ( not ( = ?auto_817173 ?auto_817177 ) ) ( not ( = ?auto_817173 ?auto_817178 ) ) ( not ( = ?auto_817173 ?auto_817179 ) ) ( not ( = ?auto_817173 ?auto_817180 ) ) ( not ( = ?auto_817173 ?auto_817181 ) ) ( not ( = ?auto_817173 ?auto_817182 ) ) ( not ( = ?auto_817173 ?auto_817183 ) ) ( not ( = ?auto_817173 ?auto_817184 ) ) ( not ( = ?auto_817173 ?auto_817185 ) ) ( not ( = ?auto_817173 ?auto_817186 ) ) ( not ( = ?auto_817174 ?auto_817175 ) ) ( not ( = ?auto_817174 ?auto_817176 ) ) ( not ( = ?auto_817174 ?auto_817177 ) ) ( not ( = ?auto_817174 ?auto_817178 ) ) ( not ( = ?auto_817174 ?auto_817179 ) ) ( not ( = ?auto_817174 ?auto_817180 ) ) ( not ( = ?auto_817174 ?auto_817181 ) ) ( not ( = ?auto_817174 ?auto_817182 ) ) ( not ( = ?auto_817174 ?auto_817183 ) ) ( not ( = ?auto_817174 ?auto_817184 ) ) ( not ( = ?auto_817174 ?auto_817185 ) ) ( not ( = ?auto_817174 ?auto_817186 ) ) ( not ( = ?auto_817175 ?auto_817176 ) ) ( not ( = ?auto_817175 ?auto_817177 ) ) ( not ( = ?auto_817175 ?auto_817178 ) ) ( not ( = ?auto_817175 ?auto_817179 ) ) ( not ( = ?auto_817175 ?auto_817180 ) ) ( not ( = ?auto_817175 ?auto_817181 ) ) ( not ( = ?auto_817175 ?auto_817182 ) ) ( not ( = ?auto_817175 ?auto_817183 ) ) ( not ( = ?auto_817175 ?auto_817184 ) ) ( not ( = ?auto_817175 ?auto_817185 ) ) ( not ( = ?auto_817175 ?auto_817186 ) ) ( not ( = ?auto_817176 ?auto_817177 ) ) ( not ( = ?auto_817176 ?auto_817178 ) ) ( not ( = ?auto_817176 ?auto_817179 ) ) ( not ( = ?auto_817176 ?auto_817180 ) ) ( not ( = ?auto_817176 ?auto_817181 ) ) ( not ( = ?auto_817176 ?auto_817182 ) ) ( not ( = ?auto_817176 ?auto_817183 ) ) ( not ( = ?auto_817176 ?auto_817184 ) ) ( not ( = ?auto_817176 ?auto_817185 ) ) ( not ( = ?auto_817176 ?auto_817186 ) ) ( not ( = ?auto_817177 ?auto_817178 ) ) ( not ( = ?auto_817177 ?auto_817179 ) ) ( not ( = ?auto_817177 ?auto_817180 ) ) ( not ( = ?auto_817177 ?auto_817181 ) ) ( not ( = ?auto_817177 ?auto_817182 ) ) ( not ( = ?auto_817177 ?auto_817183 ) ) ( not ( = ?auto_817177 ?auto_817184 ) ) ( not ( = ?auto_817177 ?auto_817185 ) ) ( not ( = ?auto_817177 ?auto_817186 ) ) ( not ( = ?auto_817178 ?auto_817179 ) ) ( not ( = ?auto_817178 ?auto_817180 ) ) ( not ( = ?auto_817178 ?auto_817181 ) ) ( not ( = ?auto_817178 ?auto_817182 ) ) ( not ( = ?auto_817178 ?auto_817183 ) ) ( not ( = ?auto_817178 ?auto_817184 ) ) ( not ( = ?auto_817178 ?auto_817185 ) ) ( not ( = ?auto_817178 ?auto_817186 ) ) ( not ( = ?auto_817179 ?auto_817180 ) ) ( not ( = ?auto_817179 ?auto_817181 ) ) ( not ( = ?auto_817179 ?auto_817182 ) ) ( not ( = ?auto_817179 ?auto_817183 ) ) ( not ( = ?auto_817179 ?auto_817184 ) ) ( not ( = ?auto_817179 ?auto_817185 ) ) ( not ( = ?auto_817179 ?auto_817186 ) ) ( not ( = ?auto_817180 ?auto_817181 ) ) ( not ( = ?auto_817180 ?auto_817182 ) ) ( not ( = ?auto_817180 ?auto_817183 ) ) ( not ( = ?auto_817180 ?auto_817184 ) ) ( not ( = ?auto_817180 ?auto_817185 ) ) ( not ( = ?auto_817180 ?auto_817186 ) ) ( not ( = ?auto_817181 ?auto_817182 ) ) ( not ( = ?auto_817181 ?auto_817183 ) ) ( not ( = ?auto_817181 ?auto_817184 ) ) ( not ( = ?auto_817181 ?auto_817185 ) ) ( not ( = ?auto_817181 ?auto_817186 ) ) ( not ( = ?auto_817182 ?auto_817183 ) ) ( not ( = ?auto_817182 ?auto_817184 ) ) ( not ( = ?auto_817182 ?auto_817185 ) ) ( not ( = ?auto_817182 ?auto_817186 ) ) ( not ( = ?auto_817183 ?auto_817184 ) ) ( not ( = ?auto_817183 ?auto_817185 ) ) ( not ( = ?auto_817183 ?auto_817186 ) ) ( not ( = ?auto_817184 ?auto_817185 ) ) ( not ( = ?auto_817184 ?auto_817186 ) ) ( not ( = ?auto_817185 ?auto_817186 ) ) ( ON ?auto_817184 ?auto_817185 ) ( ON ?auto_817183 ?auto_817184 ) ( ON ?auto_817182 ?auto_817183 ) ( ON ?auto_817181 ?auto_817182 ) ( ON ?auto_817180 ?auto_817181 ) ( ON ?auto_817179 ?auto_817180 ) ( ON ?auto_817178 ?auto_817179 ) ( ON ?auto_817177 ?auto_817178 ) ( ON ?auto_817176 ?auto_817177 ) ( ON ?auto_817175 ?auto_817176 ) ( ON ?auto_817174 ?auto_817175 ) ( CLEAR ?auto_817172 ) ( ON ?auto_817173 ?auto_817174 ) ( CLEAR ?auto_817173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_817169 ?auto_817170 ?auto_817171 ?auto_817172 ?auto_817173 )
      ( MAKE-17PILE ?auto_817169 ?auto_817170 ?auto_817171 ?auto_817172 ?auto_817173 ?auto_817174 ?auto_817175 ?auto_817176 ?auto_817177 ?auto_817178 ?auto_817179 ?auto_817180 ?auto_817181 ?auto_817182 ?auto_817183 ?auto_817184 ?auto_817185 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817239 - BLOCK
      ?auto_817240 - BLOCK
      ?auto_817241 - BLOCK
      ?auto_817242 - BLOCK
      ?auto_817243 - BLOCK
      ?auto_817244 - BLOCK
      ?auto_817245 - BLOCK
      ?auto_817246 - BLOCK
      ?auto_817247 - BLOCK
      ?auto_817248 - BLOCK
      ?auto_817249 - BLOCK
      ?auto_817250 - BLOCK
      ?auto_817251 - BLOCK
      ?auto_817252 - BLOCK
      ?auto_817253 - BLOCK
      ?auto_817254 - BLOCK
      ?auto_817255 - BLOCK
    )
    :vars
    (
      ?auto_817256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817255 ?auto_817256 ) ( ON-TABLE ?auto_817239 ) ( ON ?auto_817240 ?auto_817239 ) ( ON ?auto_817241 ?auto_817240 ) ( not ( = ?auto_817239 ?auto_817240 ) ) ( not ( = ?auto_817239 ?auto_817241 ) ) ( not ( = ?auto_817239 ?auto_817242 ) ) ( not ( = ?auto_817239 ?auto_817243 ) ) ( not ( = ?auto_817239 ?auto_817244 ) ) ( not ( = ?auto_817239 ?auto_817245 ) ) ( not ( = ?auto_817239 ?auto_817246 ) ) ( not ( = ?auto_817239 ?auto_817247 ) ) ( not ( = ?auto_817239 ?auto_817248 ) ) ( not ( = ?auto_817239 ?auto_817249 ) ) ( not ( = ?auto_817239 ?auto_817250 ) ) ( not ( = ?auto_817239 ?auto_817251 ) ) ( not ( = ?auto_817239 ?auto_817252 ) ) ( not ( = ?auto_817239 ?auto_817253 ) ) ( not ( = ?auto_817239 ?auto_817254 ) ) ( not ( = ?auto_817239 ?auto_817255 ) ) ( not ( = ?auto_817239 ?auto_817256 ) ) ( not ( = ?auto_817240 ?auto_817241 ) ) ( not ( = ?auto_817240 ?auto_817242 ) ) ( not ( = ?auto_817240 ?auto_817243 ) ) ( not ( = ?auto_817240 ?auto_817244 ) ) ( not ( = ?auto_817240 ?auto_817245 ) ) ( not ( = ?auto_817240 ?auto_817246 ) ) ( not ( = ?auto_817240 ?auto_817247 ) ) ( not ( = ?auto_817240 ?auto_817248 ) ) ( not ( = ?auto_817240 ?auto_817249 ) ) ( not ( = ?auto_817240 ?auto_817250 ) ) ( not ( = ?auto_817240 ?auto_817251 ) ) ( not ( = ?auto_817240 ?auto_817252 ) ) ( not ( = ?auto_817240 ?auto_817253 ) ) ( not ( = ?auto_817240 ?auto_817254 ) ) ( not ( = ?auto_817240 ?auto_817255 ) ) ( not ( = ?auto_817240 ?auto_817256 ) ) ( not ( = ?auto_817241 ?auto_817242 ) ) ( not ( = ?auto_817241 ?auto_817243 ) ) ( not ( = ?auto_817241 ?auto_817244 ) ) ( not ( = ?auto_817241 ?auto_817245 ) ) ( not ( = ?auto_817241 ?auto_817246 ) ) ( not ( = ?auto_817241 ?auto_817247 ) ) ( not ( = ?auto_817241 ?auto_817248 ) ) ( not ( = ?auto_817241 ?auto_817249 ) ) ( not ( = ?auto_817241 ?auto_817250 ) ) ( not ( = ?auto_817241 ?auto_817251 ) ) ( not ( = ?auto_817241 ?auto_817252 ) ) ( not ( = ?auto_817241 ?auto_817253 ) ) ( not ( = ?auto_817241 ?auto_817254 ) ) ( not ( = ?auto_817241 ?auto_817255 ) ) ( not ( = ?auto_817241 ?auto_817256 ) ) ( not ( = ?auto_817242 ?auto_817243 ) ) ( not ( = ?auto_817242 ?auto_817244 ) ) ( not ( = ?auto_817242 ?auto_817245 ) ) ( not ( = ?auto_817242 ?auto_817246 ) ) ( not ( = ?auto_817242 ?auto_817247 ) ) ( not ( = ?auto_817242 ?auto_817248 ) ) ( not ( = ?auto_817242 ?auto_817249 ) ) ( not ( = ?auto_817242 ?auto_817250 ) ) ( not ( = ?auto_817242 ?auto_817251 ) ) ( not ( = ?auto_817242 ?auto_817252 ) ) ( not ( = ?auto_817242 ?auto_817253 ) ) ( not ( = ?auto_817242 ?auto_817254 ) ) ( not ( = ?auto_817242 ?auto_817255 ) ) ( not ( = ?auto_817242 ?auto_817256 ) ) ( not ( = ?auto_817243 ?auto_817244 ) ) ( not ( = ?auto_817243 ?auto_817245 ) ) ( not ( = ?auto_817243 ?auto_817246 ) ) ( not ( = ?auto_817243 ?auto_817247 ) ) ( not ( = ?auto_817243 ?auto_817248 ) ) ( not ( = ?auto_817243 ?auto_817249 ) ) ( not ( = ?auto_817243 ?auto_817250 ) ) ( not ( = ?auto_817243 ?auto_817251 ) ) ( not ( = ?auto_817243 ?auto_817252 ) ) ( not ( = ?auto_817243 ?auto_817253 ) ) ( not ( = ?auto_817243 ?auto_817254 ) ) ( not ( = ?auto_817243 ?auto_817255 ) ) ( not ( = ?auto_817243 ?auto_817256 ) ) ( not ( = ?auto_817244 ?auto_817245 ) ) ( not ( = ?auto_817244 ?auto_817246 ) ) ( not ( = ?auto_817244 ?auto_817247 ) ) ( not ( = ?auto_817244 ?auto_817248 ) ) ( not ( = ?auto_817244 ?auto_817249 ) ) ( not ( = ?auto_817244 ?auto_817250 ) ) ( not ( = ?auto_817244 ?auto_817251 ) ) ( not ( = ?auto_817244 ?auto_817252 ) ) ( not ( = ?auto_817244 ?auto_817253 ) ) ( not ( = ?auto_817244 ?auto_817254 ) ) ( not ( = ?auto_817244 ?auto_817255 ) ) ( not ( = ?auto_817244 ?auto_817256 ) ) ( not ( = ?auto_817245 ?auto_817246 ) ) ( not ( = ?auto_817245 ?auto_817247 ) ) ( not ( = ?auto_817245 ?auto_817248 ) ) ( not ( = ?auto_817245 ?auto_817249 ) ) ( not ( = ?auto_817245 ?auto_817250 ) ) ( not ( = ?auto_817245 ?auto_817251 ) ) ( not ( = ?auto_817245 ?auto_817252 ) ) ( not ( = ?auto_817245 ?auto_817253 ) ) ( not ( = ?auto_817245 ?auto_817254 ) ) ( not ( = ?auto_817245 ?auto_817255 ) ) ( not ( = ?auto_817245 ?auto_817256 ) ) ( not ( = ?auto_817246 ?auto_817247 ) ) ( not ( = ?auto_817246 ?auto_817248 ) ) ( not ( = ?auto_817246 ?auto_817249 ) ) ( not ( = ?auto_817246 ?auto_817250 ) ) ( not ( = ?auto_817246 ?auto_817251 ) ) ( not ( = ?auto_817246 ?auto_817252 ) ) ( not ( = ?auto_817246 ?auto_817253 ) ) ( not ( = ?auto_817246 ?auto_817254 ) ) ( not ( = ?auto_817246 ?auto_817255 ) ) ( not ( = ?auto_817246 ?auto_817256 ) ) ( not ( = ?auto_817247 ?auto_817248 ) ) ( not ( = ?auto_817247 ?auto_817249 ) ) ( not ( = ?auto_817247 ?auto_817250 ) ) ( not ( = ?auto_817247 ?auto_817251 ) ) ( not ( = ?auto_817247 ?auto_817252 ) ) ( not ( = ?auto_817247 ?auto_817253 ) ) ( not ( = ?auto_817247 ?auto_817254 ) ) ( not ( = ?auto_817247 ?auto_817255 ) ) ( not ( = ?auto_817247 ?auto_817256 ) ) ( not ( = ?auto_817248 ?auto_817249 ) ) ( not ( = ?auto_817248 ?auto_817250 ) ) ( not ( = ?auto_817248 ?auto_817251 ) ) ( not ( = ?auto_817248 ?auto_817252 ) ) ( not ( = ?auto_817248 ?auto_817253 ) ) ( not ( = ?auto_817248 ?auto_817254 ) ) ( not ( = ?auto_817248 ?auto_817255 ) ) ( not ( = ?auto_817248 ?auto_817256 ) ) ( not ( = ?auto_817249 ?auto_817250 ) ) ( not ( = ?auto_817249 ?auto_817251 ) ) ( not ( = ?auto_817249 ?auto_817252 ) ) ( not ( = ?auto_817249 ?auto_817253 ) ) ( not ( = ?auto_817249 ?auto_817254 ) ) ( not ( = ?auto_817249 ?auto_817255 ) ) ( not ( = ?auto_817249 ?auto_817256 ) ) ( not ( = ?auto_817250 ?auto_817251 ) ) ( not ( = ?auto_817250 ?auto_817252 ) ) ( not ( = ?auto_817250 ?auto_817253 ) ) ( not ( = ?auto_817250 ?auto_817254 ) ) ( not ( = ?auto_817250 ?auto_817255 ) ) ( not ( = ?auto_817250 ?auto_817256 ) ) ( not ( = ?auto_817251 ?auto_817252 ) ) ( not ( = ?auto_817251 ?auto_817253 ) ) ( not ( = ?auto_817251 ?auto_817254 ) ) ( not ( = ?auto_817251 ?auto_817255 ) ) ( not ( = ?auto_817251 ?auto_817256 ) ) ( not ( = ?auto_817252 ?auto_817253 ) ) ( not ( = ?auto_817252 ?auto_817254 ) ) ( not ( = ?auto_817252 ?auto_817255 ) ) ( not ( = ?auto_817252 ?auto_817256 ) ) ( not ( = ?auto_817253 ?auto_817254 ) ) ( not ( = ?auto_817253 ?auto_817255 ) ) ( not ( = ?auto_817253 ?auto_817256 ) ) ( not ( = ?auto_817254 ?auto_817255 ) ) ( not ( = ?auto_817254 ?auto_817256 ) ) ( not ( = ?auto_817255 ?auto_817256 ) ) ( ON ?auto_817254 ?auto_817255 ) ( ON ?auto_817253 ?auto_817254 ) ( ON ?auto_817252 ?auto_817253 ) ( ON ?auto_817251 ?auto_817252 ) ( ON ?auto_817250 ?auto_817251 ) ( ON ?auto_817249 ?auto_817250 ) ( ON ?auto_817248 ?auto_817249 ) ( ON ?auto_817247 ?auto_817248 ) ( ON ?auto_817246 ?auto_817247 ) ( ON ?auto_817245 ?auto_817246 ) ( ON ?auto_817244 ?auto_817245 ) ( ON ?auto_817243 ?auto_817244 ) ( CLEAR ?auto_817241 ) ( ON ?auto_817242 ?auto_817243 ) ( CLEAR ?auto_817242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_817239 ?auto_817240 ?auto_817241 ?auto_817242 )
      ( MAKE-17PILE ?auto_817239 ?auto_817240 ?auto_817241 ?auto_817242 ?auto_817243 ?auto_817244 ?auto_817245 ?auto_817246 ?auto_817247 ?auto_817248 ?auto_817249 ?auto_817250 ?auto_817251 ?auto_817252 ?auto_817253 ?auto_817254 ?auto_817255 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817309 - BLOCK
      ?auto_817310 - BLOCK
      ?auto_817311 - BLOCK
      ?auto_817312 - BLOCK
      ?auto_817313 - BLOCK
      ?auto_817314 - BLOCK
      ?auto_817315 - BLOCK
      ?auto_817316 - BLOCK
      ?auto_817317 - BLOCK
      ?auto_817318 - BLOCK
      ?auto_817319 - BLOCK
      ?auto_817320 - BLOCK
      ?auto_817321 - BLOCK
      ?auto_817322 - BLOCK
      ?auto_817323 - BLOCK
      ?auto_817324 - BLOCK
      ?auto_817325 - BLOCK
    )
    :vars
    (
      ?auto_817326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817325 ?auto_817326 ) ( ON-TABLE ?auto_817309 ) ( ON ?auto_817310 ?auto_817309 ) ( not ( = ?auto_817309 ?auto_817310 ) ) ( not ( = ?auto_817309 ?auto_817311 ) ) ( not ( = ?auto_817309 ?auto_817312 ) ) ( not ( = ?auto_817309 ?auto_817313 ) ) ( not ( = ?auto_817309 ?auto_817314 ) ) ( not ( = ?auto_817309 ?auto_817315 ) ) ( not ( = ?auto_817309 ?auto_817316 ) ) ( not ( = ?auto_817309 ?auto_817317 ) ) ( not ( = ?auto_817309 ?auto_817318 ) ) ( not ( = ?auto_817309 ?auto_817319 ) ) ( not ( = ?auto_817309 ?auto_817320 ) ) ( not ( = ?auto_817309 ?auto_817321 ) ) ( not ( = ?auto_817309 ?auto_817322 ) ) ( not ( = ?auto_817309 ?auto_817323 ) ) ( not ( = ?auto_817309 ?auto_817324 ) ) ( not ( = ?auto_817309 ?auto_817325 ) ) ( not ( = ?auto_817309 ?auto_817326 ) ) ( not ( = ?auto_817310 ?auto_817311 ) ) ( not ( = ?auto_817310 ?auto_817312 ) ) ( not ( = ?auto_817310 ?auto_817313 ) ) ( not ( = ?auto_817310 ?auto_817314 ) ) ( not ( = ?auto_817310 ?auto_817315 ) ) ( not ( = ?auto_817310 ?auto_817316 ) ) ( not ( = ?auto_817310 ?auto_817317 ) ) ( not ( = ?auto_817310 ?auto_817318 ) ) ( not ( = ?auto_817310 ?auto_817319 ) ) ( not ( = ?auto_817310 ?auto_817320 ) ) ( not ( = ?auto_817310 ?auto_817321 ) ) ( not ( = ?auto_817310 ?auto_817322 ) ) ( not ( = ?auto_817310 ?auto_817323 ) ) ( not ( = ?auto_817310 ?auto_817324 ) ) ( not ( = ?auto_817310 ?auto_817325 ) ) ( not ( = ?auto_817310 ?auto_817326 ) ) ( not ( = ?auto_817311 ?auto_817312 ) ) ( not ( = ?auto_817311 ?auto_817313 ) ) ( not ( = ?auto_817311 ?auto_817314 ) ) ( not ( = ?auto_817311 ?auto_817315 ) ) ( not ( = ?auto_817311 ?auto_817316 ) ) ( not ( = ?auto_817311 ?auto_817317 ) ) ( not ( = ?auto_817311 ?auto_817318 ) ) ( not ( = ?auto_817311 ?auto_817319 ) ) ( not ( = ?auto_817311 ?auto_817320 ) ) ( not ( = ?auto_817311 ?auto_817321 ) ) ( not ( = ?auto_817311 ?auto_817322 ) ) ( not ( = ?auto_817311 ?auto_817323 ) ) ( not ( = ?auto_817311 ?auto_817324 ) ) ( not ( = ?auto_817311 ?auto_817325 ) ) ( not ( = ?auto_817311 ?auto_817326 ) ) ( not ( = ?auto_817312 ?auto_817313 ) ) ( not ( = ?auto_817312 ?auto_817314 ) ) ( not ( = ?auto_817312 ?auto_817315 ) ) ( not ( = ?auto_817312 ?auto_817316 ) ) ( not ( = ?auto_817312 ?auto_817317 ) ) ( not ( = ?auto_817312 ?auto_817318 ) ) ( not ( = ?auto_817312 ?auto_817319 ) ) ( not ( = ?auto_817312 ?auto_817320 ) ) ( not ( = ?auto_817312 ?auto_817321 ) ) ( not ( = ?auto_817312 ?auto_817322 ) ) ( not ( = ?auto_817312 ?auto_817323 ) ) ( not ( = ?auto_817312 ?auto_817324 ) ) ( not ( = ?auto_817312 ?auto_817325 ) ) ( not ( = ?auto_817312 ?auto_817326 ) ) ( not ( = ?auto_817313 ?auto_817314 ) ) ( not ( = ?auto_817313 ?auto_817315 ) ) ( not ( = ?auto_817313 ?auto_817316 ) ) ( not ( = ?auto_817313 ?auto_817317 ) ) ( not ( = ?auto_817313 ?auto_817318 ) ) ( not ( = ?auto_817313 ?auto_817319 ) ) ( not ( = ?auto_817313 ?auto_817320 ) ) ( not ( = ?auto_817313 ?auto_817321 ) ) ( not ( = ?auto_817313 ?auto_817322 ) ) ( not ( = ?auto_817313 ?auto_817323 ) ) ( not ( = ?auto_817313 ?auto_817324 ) ) ( not ( = ?auto_817313 ?auto_817325 ) ) ( not ( = ?auto_817313 ?auto_817326 ) ) ( not ( = ?auto_817314 ?auto_817315 ) ) ( not ( = ?auto_817314 ?auto_817316 ) ) ( not ( = ?auto_817314 ?auto_817317 ) ) ( not ( = ?auto_817314 ?auto_817318 ) ) ( not ( = ?auto_817314 ?auto_817319 ) ) ( not ( = ?auto_817314 ?auto_817320 ) ) ( not ( = ?auto_817314 ?auto_817321 ) ) ( not ( = ?auto_817314 ?auto_817322 ) ) ( not ( = ?auto_817314 ?auto_817323 ) ) ( not ( = ?auto_817314 ?auto_817324 ) ) ( not ( = ?auto_817314 ?auto_817325 ) ) ( not ( = ?auto_817314 ?auto_817326 ) ) ( not ( = ?auto_817315 ?auto_817316 ) ) ( not ( = ?auto_817315 ?auto_817317 ) ) ( not ( = ?auto_817315 ?auto_817318 ) ) ( not ( = ?auto_817315 ?auto_817319 ) ) ( not ( = ?auto_817315 ?auto_817320 ) ) ( not ( = ?auto_817315 ?auto_817321 ) ) ( not ( = ?auto_817315 ?auto_817322 ) ) ( not ( = ?auto_817315 ?auto_817323 ) ) ( not ( = ?auto_817315 ?auto_817324 ) ) ( not ( = ?auto_817315 ?auto_817325 ) ) ( not ( = ?auto_817315 ?auto_817326 ) ) ( not ( = ?auto_817316 ?auto_817317 ) ) ( not ( = ?auto_817316 ?auto_817318 ) ) ( not ( = ?auto_817316 ?auto_817319 ) ) ( not ( = ?auto_817316 ?auto_817320 ) ) ( not ( = ?auto_817316 ?auto_817321 ) ) ( not ( = ?auto_817316 ?auto_817322 ) ) ( not ( = ?auto_817316 ?auto_817323 ) ) ( not ( = ?auto_817316 ?auto_817324 ) ) ( not ( = ?auto_817316 ?auto_817325 ) ) ( not ( = ?auto_817316 ?auto_817326 ) ) ( not ( = ?auto_817317 ?auto_817318 ) ) ( not ( = ?auto_817317 ?auto_817319 ) ) ( not ( = ?auto_817317 ?auto_817320 ) ) ( not ( = ?auto_817317 ?auto_817321 ) ) ( not ( = ?auto_817317 ?auto_817322 ) ) ( not ( = ?auto_817317 ?auto_817323 ) ) ( not ( = ?auto_817317 ?auto_817324 ) ) ( not ( = ?auto_817317 ?auto_817325 ) ) ( not ( = ?auto_817317 ?auto_817326 ) ) ( not ( = ?auto_817318 ?auto_817319 ) ) ( not ( = ?auto_817318 ?auto_817320 ) ) ( not ( = ?auto_817318 ?auto_817321 ) ) ( not ( = ?auto_817318 ?auto_817322 ) ) ( not ( = ?auto_817318 ?auto_817323 ) ) ( not ( = ?auto_817318 ?auto_817324 ) ) ( not ( = ?auto_817318 ?auto_817325 ) ) ( not ( = ?auto_817318 ?auto_817326 ) ) ( not ( = ?auto_817319 ?auto_817320 ) ) ( not ( = ?auto_817319 ?auto_817321 ) ) ( not ( = ?auto_817319 ?auto_817322 ) ) ( not ( = ?auto_817319 ?auto_817323 ) ) ( not ( = ?auto_817319 ?auto_817324 ) ) ( not ( = ?auto_817319 ?auto_817325 ) ) ( not ( = ?auto_817319 ?auto_817326 ) ) ( not ( = ?auto_817320 ?auto_817321 ) ) ( not ( = ?auto_817320 ?auto_817322 ) ) ( not ( = ?auto_817320 ?auto_817323 ) ) ( not ( = ?auto_817320 ?auto_817324 ) ) ( not ( = ?auto_817320 ?auto_817325 ) ) ( not ( = ?auto_817320 ?auto_817326 ) ) ( not ( = ?auto_817321 ?auto_817322 ) ) ( not ( = ?auto_817321 ?auto_817323 ) ) ( not ( = ?auto_817321 ?auto_817324 ) ) ( not ( = ?auto_817321 ?auto_817325 ) ) ( not ( = ?auto_817321 ?auto_817326 ) ) ( not ( = ?auto_817322 ?auto_817323 ) ) ( not ( = ?auto_817322 ?auto_817324 ) ) ( not ( = ?auto_817322 ?auto_817325 ) ) ( not ( = ?auto_817322 ?auto_817326 ) ) ( not ( = ?auto_817323 ?auto_817324 ) ) ( not ( = ?auto_817323 ?auto_817325 ) ) ( not ( = ?auto_817323 ?auto_817326 ) ) ( not ( = ?auto_817324 ?auto_817325 ) ) ( not ( = ?auto_817324 ?auto_817326 ) ) ( not ( = ?auto_817325 ?auto_817326 ) ) ( ON ?auto_817324 ?auto_817325 ) ( ON ?auto_817323 ?auto_817324 ) ( ON ?auto_817322 ?auto_817323 ) ( ON ?auto_817321 ?auto_817322 ) ( ON ?auto_817320 ?auto_817321 ) ( ON ?auto_817319 ?auto_817320 ) ( ON ?auto_817318 ?auto_817319 ) ( ON ?auto_817317 ?auto_817318 ) ( ON ?auto_817316 ?auto_817317 ) ( ON ?auto_817315 ?auto_817316 ) ( ON ?auto_817314 ?auto_817315 ) ( ON ?auto_817313 ?auto_817314 ) ( ON ?auto_817312 ?auto_817313 ) ( CLEAR ?auto_817310 ) ( ON ?auto_817311 ?auto_817312 ) ( CLEAR ?auto_817311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_817309 ?auto_817310 ?auto_817311 )
      ( MAKE-17PILE ?auto_817309 ?auto_817310 ?auto_817311 ?auto_817312 ?auto_817313 ?auto_817314 ?auto_817315 ?auto_817316 ?auto_817317 ?auto_817318 ?auto_817319 ?auto_817320 ?auto_817321 ?auto_817322 ?auto_817323 ?auto_817324 ?auto_817325 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817379 - BLOCK
      ?auto_817380 - BLOCK
      ?auto_817381 - BLOCK
      ?auto_817382 - BLOCK
      ?auto_817383 - BLOCK
      ?auto_817384 - BLOCK
      ?auto_817385 - BLOCK
      ?auto_817386 - BLOCK
      ?auto_817387 - BLOCK
      ?auto_817388 - BLOCK
      ?auto_817389 - BLOCK
      ?auto_817390 - BLOCK
      ?auto_817391 - BLOCK
      ?auto_817392 - BLOCK
      ?auto_817393 - BLOCK
      ?auto_817394 - BLOCK
      ?auto_817395 - BLOCK
    )
    :vars
    (
      ?auto_817396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817395 ?auto_817396 ) ( ON-TABLE ?auto_817379 ) ( not ( = ?auto_817379 ?auto_817380 ) ) ( not ( = ?auto_817379 ?auto_817381 ) ) ( not ( = ?auto_817379 ?auto_817382 ) ) ( not ( = ?auto_817379 ?auto_817383 ) ) ( not ( = ?auto_817379 ?auto_817384 ) ) ( not ( = ?auto_817379 ?auto_817385 ) ) ( not ( = ?auto_817379 ?auto_817386 ) ) ( not ( = ?auto_817379 ?auto_817387 ) ) ( not ( = ?auto_817379 ?auto_817388 ) ) ( not ( = ?auto_817379 ?auto_817389 ) ) ( not ( = ?auto_817379 ?auto_817390 ) ) ( not ( = ?auto_817379 ?auto_817391 ) ) ( not ( = ?auto_817379 ?auto_817392 ) ) ( not ( = ?auto_817379 ?auto_817393 ) ) ( not ( = ?auto_817379 ?auto_817394 ) ) ( not ( = ?auto_817379 ?auto_817395 ) ) ( not ( = ?auto_817379 ?auto_817396 ) ) ( not ( = ?auto_817380 ?auto_817381 ) ) ( not ( = ?auto_817380 ?auto_817382 ) ) ( not ( = ?auto_817380 ?auto_817383 ) ) ( not ( = ?auto_817380 ?auto_817384 ) ) ( not ( = ?auto_817380 ?auto_817385 ) ) ( not ( = ?auto_817380 ?auto_817386 ) ) ( not ( = ?auto_817380 ?auto_817387 ) ) ( not ( = ?auto_817380 ?auto_817388 ) ) ( not ( = ?auto_817380 ?auto_817389 ) ) ( not ( = ?auto_817380 ?auto_817390 ) ) ( not ( = ?auto_817380 ?auto_817391 ) ) ( not ( = ?auto_817380 ?auto_817392 ) ) ( not ( = ?auto_817380 ?auto_817393 ) ) ( not ( = ?auto_817380 ?auto_817394 ) ) ( not ( = ?auto_817380 ?auto_817395 ) ) ( not ( = ?auto_817380 ?auto_817396 ) ) ( not ( = ?auto_817381 ?auto_817382 ) ) ( not ( = ?auto_817381 ?auto_817383 ) ) ( not ( = ?auto_817381 ?auto_817384 ) ) ( not ( = ?auto_817381 ?auto_817385 ) ) ( not ( = ?auto_817381 ?auto_817386 ) ) ( not ( = ?auto_817381 ?auto_817387 ) ) ( not ( = ?auto_817381 ?auto_817388 ) ) ( not ( = ?auto_817381 ?auto_817389 ) ) ( not ( = ?auto_817381 ?auto_817390 ) ) ( not ( = ?auto_817381 ?auto_817391 ) ) ( not ( = ?auto_817381 ?auto_817392 ) ) ( not ( = ?auto_817381 ?auto_817393 ) ) ( not ( = ?auto_817381 ?auto_817394 ) ) ( not ( = ?auto_817381 ?auto_817395 ) ) ( not ( = ?auto_817381 ?auto_817396 ) ) ( not ( = ?auto_817382 ?auto_817383 ) ) ( not ( = ?auto_817382 ?auto_817384 ) ) ( not ( = ?auto_817382 ?auto_817385 ) ) ( not ( = ?auto_817382 ?auto_817386 ) ) ( not ( = ?auto_817382 ?auto_817387 ) ) ( not ( = ?auto_817382 ?auto_817388 ) ) ( not ( = ?auto_817382 ?auto_817389 ) ) ( not ( = ?auto_817382 ?auto_817390 ) ) ( not ( = ?auto_817382 ?auto_817391 ) ) ( not ( = ?auto_817382 ?auto_817392 ) ) ( not ( = ?auto_817382 ?auto_817393 ) ) ( not ( = ?auto_817382 ?auto_817394 ) ) ( not ( = ?auto_817382 ?auto_817395 ) ) ( not ( = ?auto_817382 ?auto_817396 ) ) ( not ( = ?auto_817383 ?auto_817384 ) ) ( not ( = ?auto_817383 ?auto_817385 ) ) ( not ( = ?auto_817383 ?auto_817386 ) ) ( not ( = ?auto_817383 ?auto_817387 ) ) ( not ( = ?auto_817383 ?auto_817388 ) ) ( not ( = ?auto_817383 ?auto_817389 ) ) ( not ( = ?auto_817383 ?auto_817390 ) ) ( not ( = ?auto_817383 ?auto_817391 ) ) ( not ( = ?auto_817383 ?auto_817392 ) ) ( not ( = ?auto_817383 ?auto_817393 ) ) ( not ( = ?auto_817383 ?auto_817394 ) ) ( not ( = ?auto_817383 ?auto_817395 ) ) ( not ( = ?auto_817383 ?auto_817396 ) ) ( not ( = ?auto_817384 ?auto_817385 ) ) ( not ( = ?auto_817384 ?auto_817386 ) ) ( not ( = ?auto_817384 ?auto_817387 ) ) ( not ( = ?auto_817384 ?auto_817388 ) ) ( not ( = ?auto_817384 ?auto_817389 ) ) ( not ( = ?auto_817384 ?auto_817390 ) ) ( not ( = ?auto_817384 ?auto_817391 ) ) ( not ( = ?auto_817384 ?auto_817392 ) ) ( not ( = ?auto_817384 ?auto_817393 ) ) ( not ( = ?auto_817384 ?auto_817394 ) ) ( not ( = ?auto_817384 ?auto_817395 ) ) ( not ( = ?auto_817384 ?auto_817396 ) ) ( not ( = ?auto_817385 ?auto_817386 ) ) ( not ( = ?auto_817385 ?auto_817387 ) ) ( not ( = ?auto_817385 ?auto_817388 ) ) ( not ( = ?auto_817385 ?auto_817389 ) ) ( not ( = ?auto_817385 ?auto_817390 ) ) ( not ( = ?auto_817385 ?auto_817391 ) ) ( not ( = ?auto_817385 ?auto_817392 ) ) ( not ( = ?auto_817385 ?auto_817393 ) ) ( not ( = ?auto_817385 ?auto_817394 ) ) ( not ( = ?auto_817385 ?auto_817395 ) ) ( not ( = ?auto_817385 ?auto_817396 ) ) ( not ( = ?auto_817386 ?auto_817387 ) ) ( not ( = ?auto_817386 ?auto_817388 ) ) ( not ( = ?auto_817386 ?auto_817389 ) ) ( not ( = ?auto_817386 ?auto_817390 ) ) ( not ( = ?auto_817386 ?auto_817391 ) ) ( not ( = ?auto_817386 ?auto_817392 ) ) ( not ( = ?auto_817386 ?auto_817393 ) ) ( not ( = ?auto_817386 ?auto_817394 ) ) ( not ( = ?auto_817386 ?auto_817395 ) ) ( not ( = ?auto_817386 ?auto_817396 ) ) ( not ( = ?auto_817387 ?auto_817388 ) ) ( not ( = ?auto_817387 ?auto_817389 ) ) ( not ( = ?auto_817387 ?auto_817390 ) ) ( not ( = ?auto_817387 ?auto_817391 ) ) ( not ( = ?auto_817387 ?auto_817392 ) ) ( not ( = ?auto_817387 ?auto_817393 ) ) ( not ( = ?auto_817387 ?auto_817394 ) ) ( not ( = ?auto_817387 ?auto_817395 ) ) ( not ( = ?auto_817387 ?auto_817396 ) ) ( not ( = ?auto_817388 ?auto_817389 ) ) ( not ( = ?auto_817388 ?auto_817390 ) ) ( not ( = ?auto_817388 ?auto_817391 ) ) ( not ( = ?auto_817388 ?auto_817392 ) ) ( not ( = ?auto_817388 ?auto_817393 ) ) ( not ( = ?auto_817388 ?auto_817394 ) ) ( not ( = ?auto_817388 ?auto_817395 ) ) ( not ( = ?auto_817388 ?auto_817396 ) ) ( not ( = ?auto_817389 ?auto_817390 ) ) ( not ( = ?auto_817389 ?auto_817391 ) ) ( not ( = ?auto_817389 ?auto_817392 ) ) ( not ( = ?auto_817389 ?auto_817393 ) ) ( not ( = ?auto_817389 ?auto_817394 ) ) ( not ( = ?auto_817389 ?auto_817395 ) ) ( not ( = ?auto_817389 ?auto_817396 ) ) ( not ( = ?auto_817390 ?auto_817391 ) ) ( not ( = ?auto_817390 ?auto_817392 ) ) ( not ( = ?auto_817390 ?auto_817393 ) ) ( not ( = ?auto_817390 ?auto_817394 ) ) ( not ( = ?auto_817390 ?auto_817395 ) ) ( not ( = ?auto_817390 ?auto_817396 ) ) ( not ( = ?auto_817391 ?auto_817392 ) ) ( not ( = ?auto_817391 ?auto_817393 ) ) ( not ( = ?auto_817391 ?auto_817394 ) ) ( not ( = ?auto_817391 ?auto_817395 ) ) ( not ( = ?auto_817391 ?auto_817396 ) ) ( not ( = ?auto_817392 ?auto_817393 ) ) ( not ( = ?auto_817392 ?auto_817394 ) ) ( not ( = ?auto_817392 ?auto_817395 ) ) ( not ( = ?auto_817392 ?auto_817396 ) ) ( not ( = ?auto_817393 ?auto_817394 ) ) ( not ( = ?auto_817393 ?auto_817395 ) ) ( not ( = ?auto_817393 ?auto_817396 ) ) ( not ( = ?auto_817394 ?auto_817395 ) ) ( not ( = ?auto_817394 ?auto_817396 ) ) ( not ( = ?auto_817395 ?auto_817396 ) ) ( ON ?auto_817394 ?auto_817395 ) ( ON ?auto_817393 ?auto_817394 ) ( ON ?auto_817392 ?auto_817393 ) ( ON ?auto_817391 ?auto_817392 ) ( ON ?auto_817390 ?auto_817391 ) ( ON ?auto_817389 ?auto_817390 ) ( ON ?auto_817388 ?auto_817389 ) ( ON ?auto_817387 ?auto_817388 ) ( ON ?auto_817386 ?auto_817387 ) ( ON ?auto_817385 ?auto_817386 ) ( ON ?auto_817384 ?auto_817385 ) ( ON ?auto_817383 ?auto_817384 ) ( ON ?auto_817382 ?auto_817383 ) ( ON ?auto_817381 ?auto_817382 ) ( CLEAR ?auto_817379 ) ( ON ?auto_817380 ?auto_817381 ) ( CLEAR ?auto_817380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_817379 ?auto_817380 )
      ( MAKE-17PILE ?auto_817379 ?auto_817380 ?auto_817381 ?auto_817382 ?auto_817383 ?auto_817384 ?auto_817385 ?auto_817386 ?auto_817387 ?auto_817388 ?auto_817389 ?auto_817390 ?auto_817391 ?auto_817392 ?auto_817393 ?auto_817394 ?auto_817395 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_817449 - BLOCK
      ?auto_817450 - BLOCK
      ?auto_817451 - BLOCK
      ?auto_817452 - BLOCK
      ?auto_817453 - BLOCK
      ?auto_817454 - BLOCK
      ?auto_817455 - BLOCK
      ?auto_817456 - BLOCK
      ?auto_817457 - BLOCK
      ?auto_817458 - BLOCK
      ?auto_817459 - BLOCK
      ?auto_817460 - BLOCK
      ?auto_817461 - BLOCK
      ?auto_817462 - BLOCK
      ?auto_817463 - BLOCK
      ?auto_817464 - BLOCK
      ?auto_817465 - BLOCK
    )
    :vars
    (
      ?auto_817466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817465 ?auto_817466 ) ( not ( = ?auto_817449 ?auto_817450 ) ) ( not ( = ?auto_817449 ?auto_817451 ) ) ( not ( = ?auto_817449 ?auto_817452 ) ) ( not ( = ?auto_817449 ?auto_817453 ) ) ( not ( = ?auto_817449 ?auto_817454 ) ) ( not ( = ?auto_817449 ?auto_817455 ) ) ( not ( = ?auto_817449 ?auto_817456 ) ) ( not ( = ?auto_817449 ?auto_817457 ) ) ( not ( = ?auto_817449 ?auto_817458 ) ) ( not ( = ?auto_817449 ?auto_817459 ) ) ( not ( = ?auto_817449 ?auto_817460 ) ) ( not ( = ?auto_817449 ?auto_817461 ) ) ( not ( = ?auto_817449 ?auto_817462 ) ) ( not ( = ?auto_817449 ?auto_817463 ) ) ( not ( = ?auto_817449 ?auto_817464 ) ) ( not ( = ?auto_817449 ?auto_817465 ) ) ( not ( = ?auto_817449 ?auto_817466 ) ) ( not ( = ?auto_817450 ?auto_817451 ) ) ( not ( = ?auto_817450 ?auto_817452 ) ) ( not ( = ?auto_817450 ?auto_817453 ) ) ( not ( = ?auto_817450 ?auto_817454 ) ) ( not ( = ?auto_817450 ?auto_817455 ) ) ( not ( = ?auto_817450 ?auto_817456 ) ) ( not ( = ?auto_817450 ?auto_817457 ) ) ( not ( = ?auto_817450 ?auto_817458 ) ) ( not ( = ?auto_817450 ?auto_817459 ) ) ( not ( = ?auto_817450 ?auto_817460 ) ) ( not ( = ?auto_817450 ?auto_817461 ) ) ( not ( = ?auto_817450 ?auto_817462 ) ) ( not ( = ?auto_817450 ?auto_817463 ) ) ( not ( = ?auto_817450 ?auto_817464 ) ) ( not ( = ?auto_817450 ?auto_817465 ) ) ( not ( = ?auto_817450 ?auto_817466 ) ) ( not ( = ?auto_817451 ?auto_817452 ) ) ( not ( = ?auto_817451 ?auto_817453 ) ) ( not ( = ?auto_817451 ?auto_817454 ) ) ( not ( = ?auto_817451 ?auto_817455 ) ) ( not ( = ?auto_817451 ?auto_817456 ) ) ( not ( = ?auto_817451 ?auto_817457 ) ) ( not ( = ?auto_817451 ?auto_817458 ) ) ( not ( = ?auto_817451 ?auto_817459 ) ) ( not ( = ?auto_817451 ?auto_817460 ) ) ( not ( = ?auto_817451 ?auto_817461 ) ) ( not ( = ?auto_817451 ?auto_817462 ) ) ( not ( = ?auto_817451 ?auto_817463 ) ) ( not ( = ?auto_817451 ?auto_817464 ) ) ( not ( = ?auto_817451 ?auto_817465 ) ) ( not ( = ?auto_817451 ?auto_817466 ) ) ( not ( = ?auto_817452 ?auto_817453 ) ) ( not ( = ?auto_817452 ?auto_817454 ) ) ( not ( = ?auto_817452 ?auto_817455 ) ) ( not ( = ?auto_817452 ?auto_817456 ) ) ( not ( = ?auto_817452 ?auto_817457 ) ) ( not ( = ?auto_817452 ?auto_817458 ) ) ( not ( = ?auto_817452 ?auto_817459 ) ) ( not ( = ?auto_817452 ?auto_817460 ) ) ( not ( = ?auto_817452 ?auto_817461 ) ) ( not ( = ?auto_817452 ?auto_817462 ) ) ( not ( = ?auto_817452 ?auto_817463 ) ) ( not ( = ?auto_817452 ?auto_817464 ) ) ( not ( = ?auto_817452 ?auto_817465 ) ) ( not ( = ?auto_817452 ?auto_817466 ) ) ( not ( = ?auto_817453 ?auto_817454 ) ) ( not ( = ?auto_817453 ?auto_817455 ) ) ( not ( = ?auto_817453 ?auto_817456 ) ) ( not ( = ?auto_817453 ?auto_817457 ) ) ( not ( = ?auto_817453 ?auto_817458 ) ) ( not ( = ?auto_817453 ?auto_817459 ) ) ( not ( = ?auto_817453 ?auto_817460 ) ) ( not ( = ?auto_817453 ?auto_817461 ) ) ( not ( = ?auto_817453 ?auto_817462 ) ) ( not ( = ?auto_817453 ?auto_817463 ) ) ( not ( = ?auto_817453 ?auto_817464 ) ) ( not ( = ?auto_817453 ?auto_817465 ) ) ( not ( = ?auto_817453 ?auto_817466 ) ) ( not ( = ?auto_817454 ?auto_817455 ) ) ( not ( = ?auto_817454 ?auto_817456 ) ) ( not ( = ?auto_817454 ?auto_817457 ) ) ( not ( = ?auto_817454 ?auto_817458 ) ) ( not ( = ?auto_817454 ?auto_817459 ) ) ( not ( = ?auto_817454 ?auto_817460 ) ) ( not ( = ?auto_817454 ?auto_817461 ) ) ( not ( = ?auto_817454 ?auto_817462 ) ) ( not ( = ?auto_817454 ?auto_817463 ) ) ( not ( = ?auto_817454 ?auto_817464 ) ) ( not ( = ?auto_817454 ?auto_817465 ) ) ( not ( = ?auto_817454 ?auto_817466 ) ) ( not ( = ?auto_817455 ?auto_817456 ) ) ( not ( = ?auto_817455 ?auto_817457 ) ) ( not ( = ?auto_817455 ?auto_817458 ) ) ( not ( = ?auto_817455 ?auto_817459 ) ) ( not ( = ?auto_817455 ?auto_817460 ) ) ( not ( = ?auto_817455 ?auto_817461 ) ) ( not ( = ?auto_817455 ?auto_817462 ) ) ( not ( = ?auto_817455 ?auto_817463 ) ) ( not ( = ?auto_817455 ?auto_817464 ) ) ( not ( = ?auto_817455 ?auto_817465 ) ) ( not ( = ?auto_817455 ?auto_817466 ) ) ( not ( = ?auto_817456 ?auto_817457 ) ) ( not ( = ?auto_817456 ?auto_817458 ) ) ( not ( = ?auto_817456 ?auto_817459 ) ) ( not ( = ?auto_817456 ?auto_817460 ) ) ( not ( = ?auto_817456 ?auto_817461 ) ) ( not ( = ?auto_817456 ?auto_817462 ) ) ( not ( = ?auto_817456 ?auto_817463 ) ) ( not ( = ?auto_817456 ?auto_817464 ) ) ( not ( = ?auto_817456 ?auto_817465 ) ) ( not ( = ?auto_817456 ?auto_817466 ) ) ( not ( = ?auto_817457 ?auto_817458 ) ) ( not ( = ?auto_817457 ?auto_817459 ) ) ( not ( = ?auto_817457 ?auto_817460 ) ) ( not ( = ?auto_817457 ?auto_817461 ) ) ( not ( = ?auto_817457 ?auto_817462 ) ) ( not ( = ?auto_817457 ?auto_817463 ) ) ( not ( = ?auto_817457 ?auto_817464 ) ) ( not ( = ?auto_817457 ?auto_817465 ) ) ( not ( = ?auto_817457 ?auto_817466 ) ) ( not ( = ?auto_817458 ?auto_817459 ) ) ( not ( = ?auto_817458 ?auto_817460 ) ) ( not ( = ?auto_817458 ?auto_817461 ) ) ( not ( = ?auto_817458 ?auto_817462 ) ) ( not ( = ?auto_817458 ?auto_817463 ) ) ( not ( = ?auto_817458 ?auto_817464 ) ) ( not ( = ?auto_817458 ?auto_817465 ) ) ( not ( = ?auto_817458 ?auto_817466 ) ) ( not ( = ?auto_817459 ?auto_817460 ) ) ( not ( = ?auto_817459 ?auto_817461 ) ) ( not ( = ?auto_817459 ?auto_817462 ) ) ( not ( = ?auto_817459 ?auto_817463 ) ) ( not ( = ?auto_817459 ?auto_817464 ) ) ( not ( = ?auto_817459 ?auto_817465 ) ) ( not ( = ?auto_817459 ?auto_817466 ) ) ( not ( = ?auto_817460 ?auto_817461 ) ) ( not ( = ?auto_817460 ?auto_817462 ) ) ( not ( = ?auto_817460 ?auto_817463 ) ) ( not ( = ?auto_817460 ?auto_817464 ) ) ( not ( = ?auto_817460 ?auto_817465 ) ) ( not ( = ?auto_817460 ?auto_817466 ) ) ( not ( = ?auto_817461 ?auto_817462 ) ) ( not ( = ?auto_817461 ?auto_817463 ) ) ( not ( = ?auto_817461 ?auto_817464 ) ) ( not ( = ?auto_817461 ?auto_817465 ) ) ( not ( = ?auto_817461 ?auto_817466 ) ) ( not ( = ?auto_817462 ?auto_817463 ) ) ( not ( = ?auto_817462 ?auto_817464 ) ) ( not ( = ?auto_817462 ?auto_817465 ) ) ( not ( = ?auto_817462 ?auto_817466 ) ) ( not ( = ?auto_817463 ?auto_817464 ) ) ( not ( = ?auto_817463 ?auto_817465 ) ) ( not ( = ?auto_817463 ?auto_817466 ) ) ( not ( = ?auto_817464 ?auto_817465 ) ) ( not ( = ?auto_817464 ?auto_817466 ) ) ( not ( = ?auto_817465 ?auto_817466 ) ) ( ON ?auto_817464 ?auto_817465 ) ( ON ?auto_817463 ?auto_817464 ) ( ON ?auto_817462 ?auto_817463 ) ( ON ?auto_817461 ?auto_817462 ) ( ON ?auto_817460 ?auto_817461 ) ( ON ?auto_817459 ?auto_817460 ) ( ON ?auto_817458 ?auto_817459 ) ( ON ?auto_817457 ?auto_817458 ) ( ON ?auto_817456 ?auto_817457 ) ( ON ?auto_817455 ?auto_817456 ) ( ON ?auto_817454 ?auto_817455 ) ( ON ?auto_817453 ?auto_817454 ) ( ON ?auto_817452 ?auto_817453 ) ( ON ?auto_817451 ?auto_817452 ) ( ON ?auto_817450 ?auto_817451 ) ( ON ?auto_817449 ?auto_817450 ) ( CLEAR ?auto_817449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_817449 )
      ( MAKE-17PILE ?auto_817449 ?auto_817450 ?auto_817451 ?auto_817452 ?auto_817453 ?auto_817454 ?auto_817455 ?auto_817456 ?auto_817457 ?auto_817458 ?auto_817459 ?auto_817460 ?auto_817461 ?auto_817462 ?auto_817463 ?auto_817464 ?auto_817465 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817520 - BLOCK
      ?auto_817521 - BLOCK
      ?auto_817522 - BLOCK
      ?auto_817523 - BLOCK
      ?auto_817524 - BLOCK
      ?auto_817525 - BLOCK
      ?auto_817526 - BLOCK
      ?auto_817527 - BLOCK
      ?auto_817528 - BLOCK
      ?auto_817529 - BLOCK
      ?auto_817530 - BLOCK
      ?auto_817531 - BLOCK
      ?auto_817532 - BLOCK
      ?auto_817533 - BLOCK
      ?auto_817534 - BLOCK
      ?auto_817535 - BLOCK
      ?auto_817536 - BLOCK
      ?auto_817537 - BLOCK
    )
    :vars
    (
      ?auto_817538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_817536 ) ( ON ?auto_817537 ?auto_817538 ) ( CLEAR ?auto_817537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_817520 ) ( ON ?auto_817521 ?auto_817520 ) ( ON ?auto_817522 ?auto_817521 ) ( ON ?auto_817523 ?auto_817522 ) ( ON ?auto_817524 ?auto_817523 ) ( ON ?auto_817525 ?auto_817524 ) ( ON ?auto_817526 ?auto_817525 ) ( ON ?auto_817527 ?auto_817526 ) ( ON ?auto_817528 ?auto_817527 ) ( ON ?auto_817529 ?auto_817528 ) ( ON ?auto_817530 ?auto_817529 ) ( ON ?auto_817531 ?auto_817530 ) ( ON ?auto_817532 ?auto_817531 ) ( ON ?auto_817533 ?auto_817532 ) ( ON ?auto_817534 ?auto_817533 ) ( ON ?auto_817535 ?auto_817534 ) ( ON ?auto_817536 ?auto_817535 ) ( not ( = ?auto_817520 ?auto_817521 ) ) ( not ( = ?auto_817520 ?auto_817522 ) ) ( not ( = ?auto_817520 ?auto_817523 ) ) ( not ( = ?auto_817520 ?auto_817524 ) ) ( not ( = ?auto_817520 ?auto_817525 ) ) ( not ( = ?auto_817520 ?auto_817526 ) ) ( not ( = ?auto_817520 ?auto_817527 ) ) ( not ( = ?auto_817520 ?auto_817528 ) ) ( not ( = ?auto_817520 ?auto_817529 ) ) ( not ( = ?auto_817520 ?auto_817530 ) ) ( not ( = ?auto_817520 ?auto_817531 ) ) ( not ( = ?auto_817520 ?auto_817532 ) ) ( not ( = ?auto_817520 ?auto_817533 ) ) ( not ( = ?auto_817520 ?auto_817534 ) ) ( not ( = ?auto_817520 ?auto_817535 ) ) ( not ( = ?auto_817520 ?auto_817536 ) ) ( not ( = ?auto_817520 ?auto_817537 ) ) ( not ( = ?auto_817520 ?auto_817538 ) ) ( not ( = ?auto_817521 ?auto_817522 ) ) ( not ( = ?auto_817521 ?auto_817523 ) ) ( not ( = ?auto_817521 ?auto_817524 ) ) ( not ( = ?auto_817521 ?auto_817525 ) ) ( not ( = ?auto_817521 ?auto_817526 ) ) ( not ( = ?auto_817521 ?auto_817527 ) ) ( not ( = ?auto_817521 ?auto_817528 ) ) ( not ( = ?auto_817521 ?auto_817529 ) ) ( not ( = ?auto_817521 ?auto_817530 ) ) ( not ( = ?auto_817521 ?auto_817531 ) ) ( not ( = ?auto_817521 ?auto_817532 ) ) ( not ( = ?auto_817521 ?auto_817533 ) ) ( not ( = ?auto_817521 ?auto_817534 ) ) ( not ( = ?auto_817521 ?auto_817535 ) ) ( not ( = ?auto_817521 ?auto_817536 ) ) ( not ( = ?auto_817521 ?auto_817537 ) ) ( not ( = ?auto_817521 ?auto_817538 ) ) ( not ( = ?auto_817522 ?auto_817523 ) ) ( not ( = ?auto_817522 ?auto_817524 ) ) ( not ( = ?auto_817522 ?auto_817525 ) ) ( not ( = ?auto_817522 ?auto_817526 ) ) ( not ( = ?auto_817522 ?auto_817527 ) ) ( not ( = ?auto_817522 ?auto_817528 ) ) ( not ( = ?auto_817522 ?auto_817529 ) ) ( not ( = ?auto_817522 ?auto_817530 ) ) ( not ( = ?auto_817522 ?auto_817531 ) ) ( not ( = ?auto_817522 ?auto_817532 ) ) ( not ( = ?auto_817522 ?auto_817533 ) ) ( not ( = ?auto_817522 ?auto_817534 ) ) ( not ( = ?auto_817522 ?auto_817535 ) ) ( not ( = ?auto_817522 ?auto_817536 ) ) ( not ( = ?auto_817522 ?auto_817537 ) ) ( not ( = ?auto_817522 ?auto_817538 ) ) ( not ( = ?auto_817523 ?auto_817524 ) ) ( not ( = ?auto_817523 ?auto_817525 ) ) ( not ( = ?auto_817523 ?auto_817526 ) ) ( not ( = ?auto_817523 ?auto_817527 ) ) ( not ( = ?auto_817523 ?auto_817528 ) ) ( not ( = ?auto_817523 ?auto_817529 ) ) ( not ( = ?auto_817523 ?auto_817530 ) ) ( not ( = ?auto_817523 ?auto_817531 ) ) ( not ( = ?auto_817523 ?auto_817532 ) ) ( not ( = ?auto_817523 ?auto_817533 ) ) ( not ( = ?auto_817523 ?auto_817534 ) ) ( not ( = ?auto_817523 ?auto_817535 ) ) ( not ( = ?auto_817523 ?auto_817536 ) ) ( not ( = ?auto_817523 ?auto_817537 ) ) ( not ( = ?auto_817523 ?auto_817538 ) ) ( not ( = ?auto_817524 ?auto_817525 ) ) ( not ( = ?auto_817524 ?auto_817526 ) ) ( not ( = ?auto_817524 ?auto_817527 ) ) ( not ( = ?auto_817524 ?auto_817528 ) ) ( not ( = ?auto_817524 ?auto_817529 ) ) ( not ( = ?auto_817524 ?auto_817530 ) ) ( not ( = ?auto_817524 ?auto_817531 ) ) ( not ( = ?auto_817524 ?auto_817532 ) ) ( not ( = ?auto_817524 ?auto_817533 ) ) ( not ( = ?auto_817524 ?auto_817534 ) ) ( not ( = ?auto_817524 ?auto_817535 ) ) ( not ( = ?auto_817524 ?auto_817536 ) ) ( not ( = ?auto_817524 ?auto_817537 ) ) ( not ( = ?auto_817524 ?auto_817538 ) ) ( not ( = ?auto_817525 ?auto_817526 ) ) ( not ( = ?auto_817525 ?auto_817527 ) ) ( not ( = ?auto_817525 ?auto_817528 ) ) ( not ( = ?auto_817525 ?auto_817529 ) ) ( not ( = ?auto_817525 ?auto_817530 ) ) ( not ( = ?auto_817525 ?auto_817531 ) ) ( not ( = ?auto_817525 ?auto_817532 ) ) ( not ( = ?auto_817525 ?auto_817533 ) ) ( not ( = ?auto_817525 ?auto_817534 ) ) ( not ( = ?auto_817525 ?auto_817535 ) ) ( not ( = ?auto_817525 ?auto_817536 ) ) ( not ( = ?auto_817525 ?auto_817537 ) ) ( not ( = ?auto_817525 ?auto_817538 ) ) ( not ( = ?auto_817526 ?auto_817527 ) ) ( not ( = ?auto_817526 ?auto_817528 ) ) ( not ( = ?auto_817526 ?auto_817529 ) ) ( not ( = ?auto_817526 ?auto_817530 ) ) ( not ( = ?auto_817526 ?auto_817531 ) ) ( not ( = ?auto_817526 ?auto_817532 ) ) ( not ( = ?auto_817526 ?auto_817533 ) ) ( not ( = ?auto_817526 ?auto_817534 ) ) ( not ( = ?auto_817526 ?auto_817535 ) ) ( not ( = ?auto_817526 ?auto_817536 ) ) ( not ( = ?auto_817526 ?auto_817537 ) ) ( not ( = ?auto_817526 ?auto_817538 ) ) ( not ( = ?auto_817527 ?auto_817528 ) ) ( not ( = ?auto_817527 ?auto_817529 ) ) ( not ( = ?auto_817527 ?auto_817530 ) ) ( not ( = ?auto_817527 ?auto_817531 ) ) ( not ( = ?auto_817527 ?auto_817532 ) ) ( not ( = ?auto_817527 ?auto_817533 ) ) ( not ( = ?auto_817527 ?auto_817534 ) ) ( not ( = ?auto_817527 ?auto_817535 ) ) ( not ( = ?auto_817527 ?auto_817536 ) ) ( not ( = ?auto_817527 ?auto_817537 ) ) ( not ( = ?auto_817527 ?auto_817538 ) ) ( not ( = ?auto_817528 ?auto_817529 ) ) ( not ( = ?auto_817528 ?auto_817530 ) ) ( not ( = ?auto_817528 ?auto_817531 ) ) ( not ( = ?auto_817528 ?auto_817532 ) ) ( not ( = ?auto_817528 ?auto_817533 ) ) ( not ( = ?auto_817528 ?auto_817534 ) ) ( not ( = ?auto_817528 ?auto_817535 ) ) ( not ( = ?auto_817528 ?auto_817536 ) ) ( not ( = ?auto_817528 ?auto_817537 ) ) ( not ( = ?auto_817528 ?auto_817538 ) ) ( not ( = ?auto_817529 ?auto_817530 ) ) ( not ( = ?auto_817529 ?auto_817531 ) ) ( not ( = ?auto_817529 ?auto_817532 ) ) ( not ( = ?auto_817529 ?auto_817533 ) ) ( not ( = ?auto_817529 ?auto_817534 ) ) ( not ( = ?auto_817529 ?auto_817535 ) ) ( not ( = ?auto_817529 ?auto_817536 ) ) ( not ( = ?auto_817529 ?auto_817537 ) ) ( not ( = ?auto_817529 ?auto_817538 ) ) ( not ( = ?auto_817530 ?auto_817531 ) ) ( not ( = ?auto_817530 ?auto_817532 ) ) ( not ( = ?auto_817530 ?auto_817533 ) ) ( not ( = ?auto_817530 ?auto_817534 ) ) ( not ( = ?auto_817530 ?auto_817535 ) ) ( not ( = ?auto_817530 ?auto_817536 ) ) ( not ( = ?auto_817530 ?auto_817537 ) ) ( not ( = ?auto_817530 ?auto_817538 ) ) ( not ( = ?auto_817531 ?auto_817532 ) ) ( not ( = ?auto_817531 ?auto_817533 ) ) ( not ( = ?auto_817531 ?auto_817534 ) ) ( not ( = ?auto_817531 ?auto_817535 ) ) ( not ( = ?auto_817531 ?auto_817536 ) ) ( not ( = ?auto_817531 ?auto_817537 ) ) ( not ( = ?auto_817531 ?auto_817538 ) ) ( not ( = ?auto_817532 ?auto_817533 ) ) ( not ( = ?auto_817532 ?auto_817534 ) ) ( not ( = ?auto_817532 ?auto_817535 ) ) ( not ( = ?auto_817532 ?auto_817536 ) ) ( not ( = ?auto_817532 ?auto_817537 ) ) ( not ( = ?auto_817532 ?auto_817538 ) ) ( not ( = ?auto_817533 ?auto_817534 ) ) ( not ( = ?auto_817533 ?auto_817535 ) ) ( not ( = ?auto_817533 ?auto_817536 ) ) ( not ( = ?auto_817533 ?auto_817537 ) ) ( not ( = ?auto_817533 ?auto_817538 ) ) ( not ( = ?auto_817534 ?auto_817535 ) ) ( not ( = ?auto_817534 ?auto_817536 ) ) ( not ( = ?auto_817534 ?auto_817537 ) ) ( not ( = ?auto_817534 ?auto_817538 ) ) ( not ( = ?auto_817535 ?auto_817536 ) ) ( not ( = ?auto_817535 ?auto_817537 ) ) ( not ( = ?auto_817535 ?auto_817538 ) ) ( not ( = ?auto_817536 ?auto_817537 ) ) ( not ( = ?auto_817536 ?auto_817538 ) ) ( not ( = ?auto_817537 ?auto_817538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_817537 ?auto_817538 )
      ( !STACK ?auto_817537 ?auto_817536 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817557 - BLOCK
      ?auto_817558 - BLOCK
      ?auto_817559 - BLOCK
      ?auto_817560 - BLOCK
      ?auto_817561 - BLOCK
      ?auto_817562 - BLOCK
      ?auto_817563 - BLOCK
      ?auto_817564 - BLOCK
      ?auto_817565 - BLOCK
      ?auto_817566 - BLOCK
      ?auto_817567 - BLOCK
      ?auto_817568 - BLOCK
      ?auto_817569 - BLOCK
      ?auto_817570 - BLOCK
      ?auto_817571 - BLOCK
      ?auto_817572 - BLOCK
      ?auto_817573 - BLOCK
      ?auto_817574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_817573 ) ( ON-TABLE ?auto_817574 ) ( CLEAR ?auto_817574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_817557 ) ( ON ?auto_817558 ?auto_817557 ) ( ON ?auto_817559 ?auto_817558 ) ( ON ?auto_817560 ?auto_817559 ) ( ON ?auto_817561 ?auto_817560 ) ( ON ?auto_817562 ?auto_817561 ) ( ON ?auto_817563 ?auto_817562 ) ( ON ?auto_817564 ?auto_817563 ) ( ON ?auto_817565 ?auto_817564 ) ( ON ?auto_817566 ?auto_817565 ) ( ON ?auto_817567 ?auto_817566 ) ( ON ?auto_817568 ?auto_817567 ) ( ON ?auto_817569 ?auto_817568 ) ( ON ?auto_817570 ?auto_817569 ) ( ON ?auto_817571 ?auto_817570 ) ( ON ?auto_817572 ?auto_817571 ) ( ON ?auto_817573 ?auto_817572 ) ( not ( = ?auto_817557 ?auto_817558 ) ) ( not ( = ?auto_817557 ?auto_817559 ) ) ( not ( = ?auto_817557 ?auto_817560 ) ) ( not ( = ?auto_817557 ?auto_817561 ) ) ( not ( = ?auto_817557 ?auto_817562 ) ) ( not ( = ?auto_817557 ?auto_817563 ) ) ( not ( = ?auto_817557 ?auto_817564 ) ) ( not ( = ?auto_817557 ?auto_817565 ) ) ( not ( = ?auto_817557 ?auto_817566 ) ) ( not ( = ?auto_817557 ?auto_817567 ) ) ( not ( = ?auto_817557 ?auto_817568 ) ) ( not ( = ?auto_817557 ?auto_817569 ) ) ( not ( = ?auto_817557 ?auto_817570 ) ) ( not ( = ?auto_817557 ?auto_817571 ) ) ( not ( = ?auto_817557 ?auto_817572 ) ) ( not ( = ?auto_817557 ?auto_817573 ) ) ( not ( = ?auto_817557 ?auto_817574 ) ) ( not ( = ?auto_817558 ?auto_817559 ) ) ( not ( = ?auto_817558 ?auto_817560 ) ) ( not ( = ?auto_817558 ?auto_817561 ) ) ( not ( = ?auto_817558 ?auto_817562 ) ) ( not ( = ?auto_817558 ?auto_817563 ) ) ( not ( = ?auto_817558 ?auto_817564 ) ) ( not ( = ?auto_817558 ?auto_817565 ) ) ( not ( = ?auto_817558 ?auto_817566 ) ) ( not ( = ?auto_817558 ?auto_817567 ) ) ( not ( = ?auto_817558 ?auto_817568 ) ) ( not ( = ?auto_817558 ?auto_817569 ) ) ( not ( = ?auto_817558 ?auto_817570 ) ) ( not ( = ?auto_817558 ?auto_817571 ) ) ( not ( = ?auto_817558 ?auto_817572 ) ) ( not ( = ?auto_817558 ?auto_817573 ) ) ( not ( = ?auto_817558 ?auto_817574 ) ) ( not ( = ?auto_817559 ?auto_817560 ) ) ( not ( = ?auto_817559 ?auto_817561 ) ) ( not ( = ?auto_817559 ?auto_817562 ) ) ( not ( = ?auto_817559 ?auto_817563 ) ) ( not ( = ?auto_817559 ?auto_817564 ) ) ( not ( = ?auto_817559 ?auto_817565 ) ) ( not ( = ?auto_817559 ?auto_817566 ) ) ( not ( = ?auto_817559 ?auto_817567 ) ) ( not ( = ?auto_817559 ?auto_817568 ) ) ( not ( = ?auto_817559 ?auto_817569 ) ) ( not ( = ?auto_817559 ?auto_817570 ) ) ( not ( = ?auto_817559 ?auto_817571 ) ) ( not ( = ?auto_817559 ?auto_817572 ) ) ( not ( = ?auto_817559 ?auto_817573 ) ) ( not ( = ?auto_817559 ?auto_817574 ) ) ( not ( = ?auto_817560 ?auto_817561 ) ) ( not ( = ?auto_817560 ?auto_817562 ) ) ( not ( = ?auto_817560 ?auto_817563 ) ) ( not ( = ?auto_817560 ?auto_817564 ) ) ( not ( = ?auto_817560 ?auto_817565 ) ) ( not ( = ?auto_817560 ?auto_817566 ) ) ( not ( = ?auto_817560 ?auto_817567 ) ) ( not ( = ?auto_817560 ?auto_817568 ) ) ( not ( = ?auto_817560 ?auto_817569 ) ) ( not ( = ?auto_817560 ?auto_817570 ) ) ( not ( = ?auto_817560 ?auto_817571 ) ) ( not ( = ?auto_817560 ?auto_817572 ) ) ( not ( = ?auto_817560 ?auto_817573 ) ) ( not ( = ?auto_817560 ?auto_817574 ) ) ( not ( = ?auto_817561 ?auto_817562 ) ) ( not ( = ?auto_817561 ?auto_817563 ) ) ( not ( = ?auto_817561 ?auto_817564 ) ) ( not ( = ?auto_817561 ?auto_817565 ) ) ( not ( = ?auto_817561 ?auto_817566 ) ) ( not ( = ?auto_817561 ?auto_817567 ) ) ( not ( = ?auto_817561 ?auto_817568 ) ) ( not ( = ?auto_817561 ?auto_817569 ) ) ( not ( = ?auto_817561 ?auto_817570 ) ) ( not ( = ?auto_817561 ?auto_817571 ) ) ( not ( = ?auto_817561 ?auto_817572 ) ) ( not ( = ?auto_817561 ?auto_817573 ) ) ( not ( = ?auto_817561 ?auto_817574 ) ) ( not ( = ?auto_817562 ?auto_817563 ) ) ( not ( = ?auto_817562 ?auto_817564 ) ) ( not ( = ?auto_817562 ?auto_817565 ) ) ( not ( = ?auto_817562 ?auto_817566 ) ) ( not ( = ?auto_817562 ?auto_817567 ) ) ( not ( = ?auto_817562 ?auto_817568 ) ) ( not ( = ?auto_817562 ?auto_817569 ) ) ( not ( = ?auto_817562 ?auto_817570 ) ) ( not ( = ?auto_817562 ?auto_817571 ) ) ( not ( = ?auto_817562 ?auto_817572 ) ) ( not ( = ?auto_817562 ?auto_817573 ) ) ( not ( = ?auto_817562 ?auto_817574 ) ) ( not ( = ?auto_817563 ?auto_817564 ) ) ( not ( = ?auto_817563 ?auto_817565 ) ) ( not ( = ?auto_817563 ?auto_817566 ) ) ( not ( = ?auto_817563 ?auto_817567 ) ) ( not ( = ?auto_817563 ?auto_817568 ) ) ( not ( = ?auto_817563 ?auto_817569 ) ) ( not ( = ?auto_817563 ?auto_817570 ) ) ( not ( = ?auto_817563 ?auto_817571 ) ) ( not ( = ?auto_817563 ?auto_817572 ) ) ( not ( = ?auto_817563 ?auto_817573 ) ) ( not ( = ?auto_817563 ?auto_817574 ) ) ( not ( = ?auto_817564 ?auto_817565 ) ) ( not ( = ?auto_817564 ?auto_817566 ) ) ( not ( = ?auto_817564 ?auto_817567 ) ) ( not ( = ?auto_817564 ?auto_817568 ) ) ( not ( = ?auto_817564 ?auto_817569 ) ) ( not ( = ?auto_817564 ?auto_817570 ) ) ( not ( = ?auto_817564 ?auto_817571 ) ) ( not ( = ?auto_817564 ?auto_817572 ) ) ( not ( = ?auto_817564 ?auto_817573 ) ) ( not ( = ?auto_817564 ?auto_817574 ) ) ( not ( = ?auto_817565 ?auto_817566 ) ) ( not ( = ?auto_817565 ?auto_817567 ) ) ( not ( = ?auto_817565 ?auto_817568 ) ) ( not ( = ?auto_817565 ?auto_817569 ) ) ( not ( = ?auto_817565 ?auto_817570 ) ) ( not ( = ?auto_817565 ?auto_817571 ) ) ( not ( = ?auto_817565 ?auto_817572 ) ) ( not ( = ?auto_817565 ?auto_817573 ) ) ( not ( = ?auto_817565 ?auto_817574 ) ) ( not ( = ?auto_817566 ?auto_817567 ) ) ( not ( = ?auto_817566 ?auto_817568 ) ) ( not ( = ?auto_817566 ?auto_817569 ) ) ( not ( = ?auto_817566 ?auto_817570 ) ) ( not ( = ?auto_817566 ?auto_817571 ) ) ( not ( = ?auto_817566 ?auto_817572 ) ) ( not ( = ?auto_817566 ?auto_817573 ) ) ( not ( = ?auto_817566 ?auto_817574 ) ) ( not ( = ?auto_817567 ?auto_817568 ) ) ( not ( = ?auto_817567 ?auto_817569 ) ) ( not ( = ?auto_817567 ?auto_817570 ) ) ( not ( = ?auto_817567 ?auto_817571 ) ) ( not ( = ?auto_817567 ?auto_817572 ) ) ( not ( = ?auto_817567 ?auto_817573 ) ) ( not ( = ?auto_817567 ?auto_817574 ) ) ( not ( = ?auto_817568 ?auto_817569 ) ) ( not ( = ?auto_817568 ?auto_817570 ) ) ( not ( = ?auto_817568 ?auto_817571 ) ) ( not ( = ?auto_817568 ?auto_817572 ) ) ( not ( = ?auto_817568 ?auto_817573 ) ) ( not ( = ?auto_817568 ?auto_817574 ) ) ( not ( = ?auto_817569 ?auto_817570 ) ) ( not ( = ?auto_817569 ?auto_817571 ) ) ( not ( = ?auto_817569 ?auto_817572 ) ) ( not ( = ?auto_817569 ?auto_817573 ) ) ( not ( = ?auto_817569 ?auto_817574 ) ) ( not ( = ?auto_817570 ?auto_817571 ) ) ( not ( = ?auto_817570 ?auto_817572 ) ) ( not ( = ?auto_817570 ?auto_817573 ) ) ( not ( = ?auto_817570 ?auto_817574 ) ) ( not ( = ?auto_817571 ?auto_817572 ) ) ( not ( = ?auto_817571 ?auto_817573 ) ) ( not ( = ?auto_817571 ?auto_817574 ) ) ( not ( = ?auto_817572 ?auto_817573 ) ) ( not ( = ?auto_817572 ?auto_817574 ) ) ( not ( = ?auto_817573 ?auto_817574 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_817574 )
      ( !STACK ?auto_817574 ?auto_817573 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817593 - BLOCK
      ?auto_817594 - BLOCK
      ?auto_817595 - BLOCK
      ?auto_817596 - BLOCK
      ?auto_817597 - BLOCK
      ?auto_817598 - BLOCK
      ?auto_817599 - BLOCK
      ?auto_817600 - BLOCK
      ?auto_817601 - BLOCK
      ?auto_817602 - BLOCK
      ?auto_817603 - BLOCK
      ?auto_817604 - BLOCK
      ?auto_817605 - BLOCK
      ?auto_817606 - BLOCK
      ?auto_817607 - BLOCK
      ?auto_817608 - BLOCK
      ?auto_817609 - BLOCK
      ?auto_817610 - BLOCK
    )
    :vars
    (
      ?auto_817611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817610 ?auto_817611 ) ( ON-TABLE ?auto_817593 ) ( ON ?auto_817594 ?auto_817593 ) ( ON ?auto_817595 ?auto_817594 ) ( ON ?auto_817596 ?auto_817595 ) ( ON ?auto_817597 ?auto_817596 ) ( ON ?auto_817598 ?auto_817597 ) ( ON ?auto_817599 ?auto_817598 ) ( ON ?auto_817600 ?auto_817599 ) ( ON ?auto_817601 ?auto_817600 ) ( ON ?auto_817602 ?auto_817601 ) ( ON ?auto_817603 ?auto_817602 ) ( ON ?auto_817604 ?auto_817603 ) ( ON ?auto_817605 ?auto_817604 ) ( ON ?auto_817606 ?auto_817605 ) ( ON ?auto_817607 ?auto_817606 ) ( ON ?auto_817608 ?auto_817607 ) ( not ( = ?auto_817593 ?auto_817594 ) ) ( not ( = ?auto_817593 ?auto_817595 ) ) ( not ( = ?auto_817593 ?auto_817596 ) ) ( not ( = ?auto_817593 ?auto_817597 ) ) ( not ( = ?auto_817593 ?auto_817598 ) ) ( not ( = ?auto_817593 ?auto_817599 ) ) ( not ( = ?auto_817593 ?auto_817600 ) ) ( not ( = ?auto_817593 ?auto_817601 ) ) ( not ( = ?auto_817593 ?auto_817602 ) ) ( not ( = ?auto_817593 ?auto_817603 ) ) ( not ( = ?auto_817593 ?auto_817604 ) ) ( not ( = ?auto_817593 ?auto_817605 ) ) ( not ( = ?auto_817593 ?auto_817606 ) ) ( not ( = ?auto_817593 ?auto_817607 ) ) ( not ( = ?auto_817593 ?auto_817608 ) ) ( not ( = ?auto_817593 ?auto_817609 ) ) ( not ( = ?auto_817593 ?auto_817610 ) ) ( not ( = ?auto_817593 ?auto_817611 ) ) ( not ( = ?auto_817594 ?auto_817595 ) ) ( not ( = ?auto_817594 ?auto_817596 ) ) ( not ( = ?auto_817594 ?auto_817597 ) ) ( not ( = ?auto_817594 ?auto_817598 ) ) ( not ( = ?auto_817594 ?auto_817599 ) ) ( not ( = ?auto_817594 ?auto_817600 ) ) ( not ( = ?auto_817594 ?auto_817601 ) ) ( not ( = ?auto_817594 ?auto_817602 ) ) ( not ( = ?auto_817594 ?auto_817603 ) ) ( not ( = ?auto_817594 ?auto_817604 ) ) ( not ( = ?auto_817594 ?auto_817605 ) ) ( not ( = ?auto_817594 ?auto_817606 ) ) ( not ( = ?auto_817594 ?auto_817607 ) ) ( not ( = ?auto_817594 ?auto_817608 ) ) ( not ( = ?auto_817594 ?auto_817609 ) ) ( not ( = ?auto_817594 ?auto_817610 ) ) ( not ( = ?auto_817594 ?auto_817611 ) ) ( not ( = ?auto_817595 ?auto_817596 ) ) ( not ( = ?auto_817595 ?auto_817597 ) ) ( not ( = ?auto_817595 ?auto_817598 ) ) ( not ( = ?auto_817595 ?auto_817599 ) ) ( not ( = ?auto_817595 ?auto_817600 ) ) ( not ( = ?auto_817595 ?auto_817601 ) ) ( not ( = ?auto_817595 ?auto_817602 ) ) ( not ( = ?auto_817595 ?auto_817603 ) ) ( not ( = ?auto_817595 ?auto_817604 ) ) ( not ( = ?auto_817595 ?auto_817605 ) ) ( not ( = ?auto_817595 ?auto_817606 ) ) ( not ( = ?auto_817595 ?auto_817607 ) ) ( not ( = ?auto_817595 ?auto_817608 ) ) ( not ( = ?auto_817595 ?auto_817609 ) ) ( not ( = ?auto_817595 ?auto_817610 ) ) ( not ( = ?auto_817595 ?auto_817611 ) ) ( not ( = ?auto_817596 ?auto_817597 ) ) ( not ( = ?auto_817596 ?auto_817598 ) ) ( not ( = ?auto_817596 ?auto_817599 ) ) ( not ( = ?auto_817596 ?auto_817600 ) ) ( not ( = ?auto_817596 ?auto_817601 ) ) ( not ( = ?auto_817596 ?auto_817602 ) ) ( not ( = ?auto_817596 ?auto_817603 ) ) ( not ( = ?auto_817596 ?auto_817604 ) ) ( not ( = ?auto_817596 ?auto_817605 ) ) ( not ( = ?auto_817596 ?auto_817606 ) ) ( not ( = ?auto_817596 ?auto_817607 ) ) ( not ( = ?auto_817596 ?auto_817608 ) ) ( not ( = ?auto_817596 ?auto_817609 ) ) ( not ( = ?auto_817596 ?auto_817610 ) ) ( not ( = ?auto_817596 ?auto_817611 ) ) ( not ( = ?auto_817597 ?auto_817598 ) ) ( not ( = ?auto_817597 ?auto_817599 ) ) ( not ( = ?auto_817597 ?auto_817600 ) ) ( not ( = ?auto_817597 ?auto_817601 ) ) ( not ( = ?auto_817597 ?auto_817602 ) ) ( not ( = ?auto_817597 ?auto_817603 ) ) ( not ( = ?auto_817597 ?auto_817604 ) ) ( not ( = ?auto_817597 ?auto_817605 ) ) ( not ( = ?auto_817597 ?auto_817606 ) ) ( not ( = ?auto_817597 ?auto_817607 ) ) ( not ( = ?auto_817597 ?auto_817608 ) ) ( not ( = ?auto_817597 ?auto_817609 ) ) ( not ( = ?auto_817597 ?auto_817610 ) ) ( not ( = ?auto_817597 ?auto_817611 ) ) ( not ( = ?auto_817598 ?auto_817599 ) ) ( not ( = ?auto_817598 ?auto_817600 ) ) ( not ( = ?auto_817598 ?auto_817601 ) ) ( not ( = ?auto_817598 ?auto_817602 ) ) ( not ( = ?auto_817598 ?auto_817603 ) ) ( not ( = ?auto_817598 ?auto_817604 ) ) ( not ( = ?auto_817598 ?auto_817605 ) ) ( not ( = ?auto_817598 ?auto_817606 ) ) ( not ( = ?auto_817598 ?auto_817607 ) ) ( not ( = ?auto_817598 ?auto_817608 ) ) ( not ( = ?auto_817598 ?auto_817609 ) ) ( not ( = ?auto_817598 ?auto_817610 ) ) ( not ( = ?auto_817598 ?auto_817611 ) ) ( not ( = ?auto_817599 ?auto_817600 ) ) ( not ( = ?auto_817599 ?auto_817601 ) ) ( not ( = ?auto_817599 ?auto_817602 ) ) ( not ( = ?auto_817599 ?auto_817603 ) ) ( not ( = ?auto_817599 ?auto_817604 ) ) ( not ( = ?auto_817599 ?auto_817605 ) ) ( not ( = ?auto_817599 ?auto_817606 ) ) ( not ( = ?auto_817599 ?auto_817607 ) ) ( not ( = ?auto_817599 ?auto_817608 ) ) ( not ( = ?auto_817599 ?auto_817609 ) ) ( not ( = ?auto_817599 ?auto_817610 ) ) ( not ( = ?auto_817599 ?auto_817611 ) ) ( not ( = ?auto_817600 ?auto_817601 ) ) ( not ( = ?auto_817600 ?auto_817602 ) ) ( not ( = ?auto_817600 ?auto_817603 ) ) ( not ( = ?auto_817600 ?auto_817604 ) ) ( not ( = ?auto_817600 ?auto_817605 ) ) ( not ( = ?auto_817600 ?auto_817606 ) ) ( not ( = ?auto_817600 ?auto_817607 ) ) ( not ( = ?auto_817600 ?auto_817608 ) ) ( not ( = ?auto_817600 ?auto_817609 ) ) ( not ( = ?auto_817600 ?auto_817610 ) ) ( not ( = ?auto_817600 ?auto_817611 ) ) ( not ( = ?auto_817601 ?auto_817602 ) ) ( not ( = ?auto_817601 ?auto_817603 ) ) ( not ( = ?auto_817601 ?auto_817604 ) ) ( not ( = ?auto_817601 ?auto_817605 ) ) ( not ( = ?auto_817601 ?auto_817606 ) ) ( not ( = ?auto_817601 ?auto_817607 ) ) ( not ( = ?auto_817601 ?auto_817608 ) ) ( not ( = ?auto_817601 ?auto_817609 ) ) ( not ( = ?auto_817601 ?auto_817610 ) ) ( not ( = ?auto_817601 ?auto_817611 ) ) ( not ( = ?auto_817602 ?auto_817603 ) ) ( not ( = ?auto_817602 ?auto_817604 ) ) ( not ( = ?auto_817602 ?auto_817605 ) ) ( not ( = ?auto_817602 ?auto_817606 ) ) ( not ( = ?auto_817602 ?auto_817607 ) ) ( not ( = ?auto_817602 ?auto_817608 ) ) ( not ( = ?auto_817602 ?auto_817609 ) ) ( not ( = ?auto_817602 ?auto_817610 ) ) ( not ( = ?auto_817602 ?auto_817611 ) ) ( not ( = ?auto_817603 ?auto_817604 ) ) ( not ( = ?auto_817603 ?auto_817605 ) ) ( not ( = ?auto_817603 ?auto_817606 ) ) ( not ( = ?auto_817603 ?auto_817607 ) ) ( not ( = ?auto_817603 ?auto_817608 ) ) ( not ( = ?auto_817603 ?auto_817609 ) ) ( not ( = ?auto_817603 ?auto_817610 ) ) ( not ( = ?auto_817603 ?auto_817611 ) ) ( not ( = ?auto_817604 ?auto_817605 ) ) ( not ( = ?auto_817604 ?auto_817606 ) ) ( not ( = ?auto_817604 ?auto_817607 ) ) ( not ( = ?auto_817604 ?auto_817608 ) ) ( not ( = ?auto_817604 ?auto_817609 ) ) ( not ( = ?auto_817604 ?auto_817610 ) ) ( not ( = ?auto_817604 ?auto_817611 ) ) ( not ( = ?auto_817605 ?auto_817606 ) ) ( not ( = ?auto_817605 ?auto_817607 ) ) ( not ( = ?auto_817605 ?auto_817608 ) ) ( not ( = ?auto_817605 ?auto_817609 ) ) ( not ( = ?auto_817605 ?auto_817610 ) ) ( not ( = ?auto_817605 ?auto_817611 ) ) ( not ( = ?auto_817606 ?auto_817607 ) ) ( not ( = ?auto_817606 ?auto_817608 ) ) ( not ( = ?auto_817606 ?auto_817609 ) ) ( not ( = ?auto_817606 ?auto_817610 ) ) ( not ( = ?auto_817606 ?auto_817611 ) ) ( not ( = ?auto_817607 ?auto_817608 ) ) ( not ( = ?auto_817607 ?auto_817609 ) ) ( not ( = ?auto_817607 ?auto_817610 ) ) ( not ( = ?auto_817607 ?auto_817611 ) ) ( not ( = ?auto_817608 ?auto_817609 ) ) ( not ( = ?auto_817608 ?auto_817610 ) ) ( not ( = ?auto_817608 ?auto_817611 ) ) ( not ( = ?auto_817609 ?auto_817610 ) ) ( not ( = ?auto_817609 ?auto_817611 ) ) ( not ( = ?auto_817610 ?auto_817611 ) ) ( CLEAR ?auto_817608 ) ( ON ?auto_817609 ?auto_817610 ) ( CLEAR ?auto_817609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_817593 ?auto_817594 ?auto_817595 ?auto_817596 ?auto_817597 ?auto_817598 ?auto_817599 ?auto_817600 ?auto_817601 ?auto_817602 ?auto_817603 ?auto_817604 ?auto_817605 ?auto_817606 ?auto_817607 ?auto_817608 ?auto_817609 )
      ( MAKE-18PILE ?auto_817593 ?auto_817594 ?auto_817595 ?auto_817596 ?auto_817597 ?auto_817598 ?auto_817599 ?auto_817600 ?auto_817601 ?auto_817602 ?auto_817603 ?auto_817604 ?auto_817605 ?auto_817606 ?auto_817607 ?auto_817608 ?auto_817609 ?auto_817610 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817630 - BLOCK
      ?auto_817631 - BLOCK
      ?auto_817632 - BLOCK
      ?auto_817633 - BLOCK
      ?auto_817634 - BLOCK
      ?auto_817635 - BLOCK
      ?auto_817636 - BLOCK
      ?auto_817637 - BLOCK
      ?auto_817638 - BLOCK
      ?auto_817639 - BLOCK
      ?auto_817640 - BLOCK
      ?auto_817641 - BLOCK
      ?auto_817642 - BLOCK
      ?auto_817643 - BLOCK
      ?auto_817644 - BLOCK
      ?auto_817645 - BLOCK
      ?auto_817646 - BLOCK
      ?auto_817647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_817647 ) ( ON-TABLE ?auto_817630 ) ( ON ?auto_817631 ?auto_817630 ) ( ON ?auto_817632 ?auto_817631 ) ( ON ?auto_817633 ?auto_817632 ) ( ON ?auto_817634 ?auto_817633 ) ( ON ?auto_817635 ?auto_817634 ) ( ON ?auto_817636 ?auto_817635 ) ( ON ?auto_817637 ?auto_817636 ) ( ON ?auto_817638 ?auto_817637 ) ( ON ?auto_817639 ?auto_817638 ) ( ON ?auto_817640 ?auto_817639 ) ( ON ?auto_817641 ?auto_817640 ) ( ON ?auto_817642 ?auto_817641 ) ( ON ?auto_817643 ?auto_817642 ) ( ON ?auto_817644 ?auto_817643 ) ( ON ?auto_817645 ?auto_817644 ) ( not ( = ?auto_817630 ?auto_817631 ) ) ( not ( = ?auto_817630 ?auto_817632 ) ) ( not ( = ?auto_817630 ?auto_817633 ) ) ( not ( = ?auto_817630 ?auto_817634 ) ) ( not ( = ?auto_817630 ?auto_817635 ) ) ( not ( = ?auto_817630 ?auto_817636 ) ) ( not ( = ?auto_817630 ?auto_817637 ) ) ( not ( = ?auto_817630 ?auto_817638 ) ) ( not ( = ?auto_817630 ?auto_817639 ) ) ( not ( = ?auto_817630 ?auto_817640 ) ) ( not ( = ?auto_817630 ?auto_817641 ) ) ( not ( = ?auto_817630 ?auto_817642 ) ) ( not ( = ?auto_817630 ?auto_817643 ) ) ( not ( = ?auto_817630 ?auto_817644 ) ) ( not ( = ?auto_817630 ?auto_817645 ) ) ( not ( = ?auto_817630 ?auto_817646 ) ) ( not ( = ?auto_817630 ?auto_817647 ) ) ( not ( = ?auto_817631 ?auto_817632 ) ) ( not ( = ?auto_817631 ?auto_817633 ) ) ( not ( = ?auto_817631 ?auto_817634 ) ) ( not ( = ?auto_817631 ?auto_817635 ) ) ( not ( = ?auto_817631 ?auto_817636 ) ) ( not ( = ?auto_817631 ?auto_817637 ) ) ( not ( = ?auto_817631 ?auto_817638 ) ) ( not ( = ?auto_817631 ?auto_817639 ) ) ( not ( = ?auto_817631 ?auto_817640 ) ) ( not ( = ?auto_817631 ?auto_817641 ) ) ( not ( = ?auto_817631 ?auto_817642 ) ) ( not ( = ?auto_817631 ?auto_817643 ) ) ( not ( = ?auto_817631 ?auto_817644 ) ) ( not ( = ?auto_817631 ?auto_817645 ) ) ( not ( = ?auto_817631 ?auto_817646 ) ) ( not ( = ?auto_817631 ?auto_817647 ) ) ( not ( = ?auto_817632 ?auto_817633 ) ) ( not ( = ?auto_817632 ?auto_817634 ) ) ( not ( = ?auto_817632 ?auto_817635 ) ) ( not ( = ?auto_817632 ?auto_817636 ) ) ( not ( = ?auto_817632 ?auto_817637 ) ) ( not ( = ?auto_817632 ?auto_817638 ) ) ( not ( = ?auto_817632 ?auto_817639 ) ) ( not ( = ?auto_817632 ?auto_817640 ) ) ( not ( = ?auto_817632 ?auto_817641 ) ) ( not ( = ?auto_817632 ?auto_817642 ) ) ( not ( = ?auto_817632 ?auto_817643 ) ) ( not ( = ?auto_817632 ?auto_817644 ) ) ( not ( = ?auto_817632 ?auto_817645 ) ) ( not ( = ?auto_817632 ?auto_817646 ) ) ( not ( = ?auto_817632 ?auto_817647 ) ) ( not ( = ?auto_817633 ?auto_817634 ) ) ( not ( = ?auto_817633 ?auto_817635 ) ) ( not ( = ?auto_817633 ?auto_817636 ) ) ( not ( = ?auto_817633 ?auto_817637 ) ) ( not ( = ?auto_817633 ?auto_817638 ) ) ( not ( = ?auto_817633 ?auto_817639 ) ) ( not ( = ?auto_817633 ?auto_817640 ) ) ( not ( = ?auto_817633 ?auto_817641 ) ) ( not ( = ?auto_817633 ?auto_817642 ) ) ( not ( = ?auto_817633 ?auto_817643 ) ) ( not ( = ?auto_817633 ?auto_817644 ) ) ( not ( = ?auto_817633 ?auto_817645 ) ) ( not ( = ?auto_817633 ?auto_817646 ) ) ( not ( = ?auto_817633 ?auto_817647 ) ) ( not ( = ?auto_817634 ?auto_817635 ) ) ( not ( = ?auto_817634 ?auto_817636 ) ) ( not ( = ?auto_817634 ?auto_817637 ) ) ( not ( = ?auto_817634 ?auto_817638 ) ) ( not ( = ?auto_817634 ?auto_817639 ) ) ( not ( = ?auto_817634 ?auto_817640 ) ) ( not ( = ?auto_817634 ?auto_817641 ) ) ( not ( = ?auto_817634 ?auto_817642 ) ) ( not ( = ?auto_817634 ?auto_817643 ) ) ( not ( = ?auto_817634 ?auto_817644 ) ) ( not ( = ?auto_817634 ?auto_817645 ) ) ( not ( = ?auto_817634 ?auto_817646 ) ) ( not ( = ?auto_817634 ?auto_817647 ) ) ( not ( = ?auto_817635 ?auto_817636 ) ) ( not ( = ?auto_817635 ?auto_817637 ) ) ( not ( = ?auto_817635 ?auto_817638 ) ) ( not ( = ?auto_817635 ?auto_817639 ) ) ( not ( = ?auto_817635 ?auto_817640 ) ) ( not ( = ?auto_817635 ?auto_817641 ) ) ( not ( = ?auto_817635 ?auto_817642 ) ) ( not ( = ?auto_817635 ?auto_817643 ) ) ( not ( = ?auto_817635 ?auto_817644 ) ) ( not ( = ?auto_817635 ?auto_817645 ) ) ( not ( = ?auto_817635 ?auto_817646 ) ) ( not ( = ?auto_817635 ?auto_817647 ) ) ( not ( = ?auto_817636 ?auto_817637 ) ) ( not ( = ?auto_817636 ?auto_817638 ) ) ( not ( = ?auto_817636 ?auto_817639 ) ) ( not ( = ?auto_817636 ?auto_817640 ) ) ( not ( = ?auto_817636 ?auto_817641 ) ) ( not ( = ?auto_817636 ?auto_817642 ) ) ( not ( = ?auto_817636 ?auto_817643 ) ) ( not ( = ?auto_817636 ?auto_817644 ) ) ( not ( = ?auto_817636 ?auto_817645 ) ) ( not ( = ?auto_817636 ?auto_817646 ) ) ( not ( = ?auto_817636 ?auto_817647 ) ) ( not ( = ?auto_817637 ?auto_817638 ) ) ( not ( = ?auto_817637 ?auto_817639 ) ) ( not ( = ?auto_817637 ?auto_817640 ) ) ( not ( = ?auto_817637 ?auto_817641 ) ) ( not ( = ?auto_817637 ?auto_817642 ) ) ( not ( = ?auto_817637 ?auto_817643 ) ) ( not ( = ?auto_817637 ?auto_817644 ) ) ( not ( = ?auto_817637 ?auto_817645 ) ) ( not ( = ?auto_817637 ?auto_817646 ) ) ( not ( = ?auto_817637 ?auto_817647 ) ) ( not ( = ?auto_817638 ?auto_817639 ) ) ( not ( = ?auto_817638 ?auto_817640 ) ) ( not ( = ?auto_817638 ?auto_817641 ) ) ( not ( = ?auto_817638 ?auto_817642 ) ) ( not ( = ?auto_817638 ?auto_817643 ) ) ( not ( = ?auto_817638 ?auto_817644 ) ) ( not ( = ?auto_817638 ?auto_817645 ) ) ( not ( = ?auto_817638 ?auto_817646 ) ) ( not ( = ?auto_817638 ?auto_817647 ) ) ( not ( = ?auto_817639 ?auto_817640 ) ) ( not ( = ?auto_817639 ?auto_817641 ) ) ( not ( = ?auto_817639 ?auto_817642 ) ) ( not ( = ?auto_817639 ?auto_817643 ) ) ( not ( = ?auto_817639 ?auto_817644 ) ) ( not ( = ?auto_817639 ?auto_817645 ) ) ( not ( = ?auto_817639 ?auto_817646 ) ) ( not ( = ?auto_817639 ?auto_817647 ) ) ( not ( = ?auto_817640 ?auto_817641 ) ) ( not ( = ?auto_817640 ?auto_817642 ) ) ( not ( = ?auto_817640 ?auto_817643 ) ) ( not ( = ?auto_817640 ?auto_817644 ) ) ( not ( = ?auto_817640 ?auto_817645 ) ) ( not ( = ?auto_817640 ?auto_817646 ) ) ( not ( = ?auto_817640 ?auto_817647 ) ) ( not ( = ?auto_817641 ?auto_817642 ) ) ( not ( = ?auto_817641 ?auto_817643 ) ) ( not ( = ?auto_817641 ?auto_817644 ) ) ( not ( = ?auto_817641 ?auto_817645 ) ) ( not ( = ?auto_817641 ?auto_817646 ) ) ( not ( = ?auto_817641 ?auto_817647 ) ) ( not ( = ?auto_817642 ?auto_817643 ) ) ( not ( = ?auto_817642 ?auto_817644 ) ) ( not ( = ?auto_817642 ?auto_817645 ) ) ( not ( = ?auto_817642 ?auto_817646 ) ) ( not ( = ?auto_817642 ?auto_817647 ) ) ( not ( = ?auto_817643 ?auto_817644 ) ) ( not ( = ?auto_817643 ?auto_817645 ) ) ( not ( = ?auto_817643 ?auto_817646 ) ) ( not ( = ?auto_817643 ?auto_817647 ) ) ( not ( = ?auto_817644 ?auto_817645 ) ) ( not ( = ?auto_817644 ?auto_817646 ) ) ( not ( = ?auto_817644 ?auto_817647 ) ) ( not ( = ?auto_817645 ?auto_817646 ) ) ( not ( = ?auto_817645 ?auto_817647 ) ) ( not ( = ?auto_817646 ?auto_817647 ) ) ( CLEAR ?auto_817645 ) ( ON ?auto_817646 ?auto_817647 ) ( CLEAR ?auto_817646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_817630 ?auto_817631 ?auto_817632 ?auto_817633 ?auto_817634 ?auto_817635 ?auto_817636 ?auto_817637 ?auto_817638 ?auto_817639 ?auto_817640 ?auto_817641 ?auto_817642 ?auto_817643 ?auto_817644 ?auto_817645 ?auto_817646 )
      ( MAKE-18PILE ?auto_817630 ?auto_817631 ?auto_817632 ?auto_817633 ?auto_817634 ?auto_817635 ?auto_817636 ?auto_817637 ?auto_817638 ?auto_817639 ?auto_817640 ?auto_817641 ?auto_817642 ?auto_817643 ?auto_817644 ?auto_817645 ?auto_817646 ?auto_817647 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817666 - BLOCK
      ?auto_817667 - BLOCK
      ?auto_817668 - BLOCK
      ?auto_817669 - BLOCK
      ?auto_817670 - BLOCK
      ?auto_817671 - BLOCK
      ?auto_817672 - BLOCK
      ?auto_817673 - BLOCK
      ?auto_817674 - BLOCK
      ?auto_817675 - BLOCK
      ?auto_817676 - BLOCK
      ?auto_817677 - BLOCK
      ?auto_817678 - BLOCK
      ?auto_817679 - BLOCK
      ?auto_817680 - BLOCK
      ?auto_817681 - BLOCK
      ?auto_817682 - BLOCK
      ?auto_817683 - BLOCK
    )
    :vars
    (
      ?auto_817684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817683 ?auto_817684 ) ( ON-TABLE ?auto_817666 ) ( ON ?auto_817667 ?auto_817666 ) ( ON ?auto_817668 ?auto_817667 ) ( ON ?auto_817669 ?auto_817668 ) ( ON ?auto_817670 ?auto_817669 ) ( ON ?auto_817671 ?auto_817670 ) ( ON ?auto_817672 ?auto_817671 ) ( ON ?auto_817673 ?auto_817672 ) ( ON ?auto_817674 ?auto_817673 ) ( ON ?auto_817675 ?auto_817674 ) ( ON ?auto_817676 ?auto_817675 ) ( ON ?auto_817677 ?auto_817676 ) ( ON ?auto_817678 ?auto_817677 ) ( ON ?auto_817679 ?auto_817678 ) ( ON ?auto_817680 ?auto_817679 ) ( not ( = ?auto_817666 ?auto_817667 ) ) ( not ( = ?auto_817666 ?auto_817668 ) ) ( not ( = ?auto_817666 ?auto_817669 ) ) ( not ( = ?auto_817666 ?auto_817670 ) ) ( not ( = ?auto_817666 ?auto_817671 ) ) ( not ( = ?auto_817666 ?auto_817672 ) ) ( not ( = ?auto_817666 ?auto_817673 ) ) ( not ( = ?auto_817666 ?auto_817674 ) ) ( not ( = ?auto_817666 ?auto_817675 ) ) ( not ( = ?auto_817666 ?auto_817676 ) ) ( not ( = ?auto_817666 ?auto_817677 ) ) ( not ( = ?auto_817666 ?auto_817678 ) ) ( not ( = ?auto_817666 ?auto_817679 ) ) ( not ( = ?auto_817666 ?auto_817680 ) ) ( not ( = ?auto_817666 ?auto_817681 ) ) ( not ( = ?auto_817666 ?auto_817682 ) ) ( not ( = ?auto_817666 ?auto_817683 ) ) ( not ( = ?auto_817666 ?auto_817684 ) ) ( not ( = ?auto_817667 ?auto_817668 ) ) ( not ( = ?auto_817667 ?auto_817669 ) ) ( not ( = ?auto_817667 ?auto_817670 ) ) ( not ( = ?auto_817667 ?auto_817671 ) ) ( not ( = ?auto_817667 ?auto_817672 ) ) ( not ( = ?auto_817667 ?auto_817673 ) ) ( not ( = ?auto_817667 ?auto_817674 ) ) ( not ( = ?auto_817667 ?auto_817675 ) ) ( not ( = ?auto_817667 ?auto_817676 ) ) ( not ( = ?auto_817667 ?auto_817677 ) ) ( not ( = ?auto_817667 ?auto_817678 ) ) ( not ( = ?auto_817667 ?auto_817679 ) ) ( not ( = ?auto_817667 ?auto_817680 ) ) ( not ( = ?auto_817667 ?auto_817681 ) ) ( not ( = ?auto_817667 ?auto_817682 ) ) ( not ( = ?auto_817667 ?auto_817683 ) ) ( not ( = ?auto_817667 ?auto_817684 ) ) ( not ( = ?auto_817668 ?auto_817669 ) ) ( not ( = ?auto_817668 ?auto_817670 ) ) ( not ( = ?auto_817668 ?auto_817671 ) ) ( not ( = ?auto_817668 ?auto_817672 ) ) ( not ( = ?auto_817668 ?auto_817673 ) ) ( not ( = ?auto_817668 ?auto_817674 ) ) ( not ( = ?auto_817668 ?auto_817675 ) ) ( not ( = ?auto_817668 ?auto_817676 ) ) ( not ( = ?auto_817668 ?auto_817677 ) ) ( not ( = ?auto_817668 ?auto_817678 ) ) ( not ( = ?auto_817668 ?auto_817679 ) ) ( not ( = ?auto_817668 ?auto_817680 ) ) ( not ( = ?auto_817668 ?auto_817681 ) ) ( not ( = ?auto_817668 ?auto_817682 ) ) ( not ( = ?auto_817668 ?auto_817683 ) ) ( not ( = ?auto_817668 ?auto_817684 ) ) ( not ( = ?auto_817669 ?auto_817670 ) ) ( not ( = ?auto_817669 ?auto_817671 ) ) ( not ( = ?auto_817669 ?auto_817672 ) ) ( not ( = ?auto_817669 ?auto_817673 ) ) ( not ( = ?auto_817669 ?auto_817674 ) ) ( not ( = ?auto_817669 ?auto_817675 ) ) ( not ( = ?auto_817669 ?auto_817676 ) ) ( not ( = ?auto_817669 ?auto_817677 ) ) ( not ( = ?auto_817669 ?auto_817678 ) ) ( not ( = ?auto_817669 ?auto_817679 ) ) ( not ( = ?auto_817669 ?auto_817680 ) ) ( not ( = ?auto_817669 ?auto_817681 ) ) ( not ( = ?auto_817669 ?auto_817682 ) ) ( not ( = ?auto_817669 ?auto_817683 ) ) ( not ( = ?auto_817669 ?auto_817684 ) ) ( not ( = ?auto_817670 ?auto_817671 ) ) ( not ( = ?auto_817670 ?auto_817672 ) ) ( not ( = ?auto_817670 ?auto_817673 ) ) ( not ( = ?auto_817670 ?auto_817674 ) ) ( not ( = ?auto_817670 ?auto_817675 ) ) ( not ( = ?auto_817670 ?auto_817676 ) ) ( not ( = ?auto_817670 ?auto_817677 ) ) ( not ( = ?auto_817670 ?auto_817678 ) ) ( not ( = ?auto_817670 ?auto_817679 ) ) ( not ( = ?auto_817670 ?auto_817680 ) ) ( not ( = ?auto_817670 ?auto_817681 ) ) ( not ( = ?auto_817670 ?auto_817682 ) ) ( not ( = ?auto_817670 ?auto_817683 ) ) ( not ( = ?auto_817670 ?auto_817684 ) ) ( not ( = ?auto_817671 ?auto_817672 ) ) ( not ( = ?auto_817671 ?auto_817673 ) ) ( not ( = ?auto_817671 ?auto_817674 ) ) ( not ( = ?auto_817671 ?auto_817675 ) ) ( not ( = ?auto_817671 ?auto_817676 ) ) ( not ( = ?auto_817671 ?auto_817677 ) ) ( not ( = ?auto_817671 ?auto_817678 ) ) ( not ( = ?auto_817671 ?auto_817679 ) ) ( not ( = ?auto_817671 ?auto_817680 ) ) ( not ( = ?auto_817671 ?auto_817681 ) ) ( not ( = ?auto_817671 ?auto_817682 ) ) ( not ( = ?auto_817671 ?auto_817683 ) ) ( not ( = ?auto_817671 ?auto_817684 ) ) ( not ( = ?auto_817672 ?auto_817673 ) ) ( not ( = ?auto_817672 ?auto_817674 ) ) ( not ( = ?auto_817672 ?auto_817675 ) ) ( not ( = ?auto_817672 ?auto_817676 ) ) ( not ( = ?auto_817672 ?auto_817677 ) ) ( not ( = ?auto_817672 ?auto_817678 ) ) ( not ( = ?auto_817672 ?auto_817679 ) ) ( not ( = ?auto_817672 ?auto_817680 ) ) ( not ( = ?auto_817672 ?auto_817681 ) ) ( not ( = ?auto_817672 ?auto_817682 ) ) ( not ( = ?auto_817672 ?auto_817683 ) ) ( not ( = ?auto_817672 ?auto_817684 ) ) ( not ( = ?auto_817673 ?auto_817674 ) ) ( not ( = ?auto_817673 ?auto_817675 ) ) ( not ( = ?auto_817673 ?auto_817676 ) ) ( not ( = ?auto_817673 ?auto_817677 ) ) ( not ( = ?auto_817673 ?auto_817678 ) ) ( not ( = ?auto_817673 ?auto_817679 ) ) ( not ( = ?auto_817673 ?auto_817680 ) ) ( not ( = ?auto_817673 ?auto_817681 ) ) ( not ( = ?auto_817673 ?auto_817682 ) ) ( not ( = ?auto_817673 ?auto_817683 ) ) ( not ( = ?auto_817673 ?auto_817684 ) ) ( not ( = ?auto_817674 ?auto_817675 ) ) ( not ( = ?auto_817674 ?auto_817676 ) ) ( not ( = ?auto_817674 ?auto_817677 ) ) ( not ( = ?auto_817674 ?auto_817678 ) ) ( not ( = ?auto_817674 ?auto_817679 ) ) ( not ( = ?auto_817674 ?auto_817680 ) ) ( not ( = ?auto_817674 ?auto_817681 ) ) ( not ( = ?auto_817674 ?auto_817682 ) ) ( not ( = ?auto_817674 ?auto_817683 ) ) ( not ( = ?auto_817674 ?auto_817684 ) ) ( not ( = ?auto_817675 ?auto_817676 ) ) ( not ( = ?auto_817675 ?auto_817677 ) ) ( not ( = ?auto_817675 ?auto_817678 ) ) ( not ( = ?auto_817675 ?auto_817679 ) ) ( not ( = ?auto_817675 ?auto_817680 ) ) ( not ( = ?auto_817675 ?auto_817681 ) ) ( not ( = ?auto_817675 ?auto_817682 ) ) ( not ( = ?auto_817675 ?auto_817683 ) ) ( not ( = ?auto_817675 ?auto_817684 ) ) ( not ( = ?auto_817676 ?auto_817677 ) ) ( not ( = ?auto_817676 ?auto_817678 ) ) ( not ( = ?auto_817676 ?auto_817679 ) ) ( not ( = ?auto_817676 ?auto_817680 ) ) ( not ( = ?auto_817676 ?auto_817681 ) ) ( not ( = ?auto_817676 ?auto_817682 ) ) ( not ( = ?auto_817676 ?auto_817683 ) ) ( not ( = ?auto_817676 ?auto_817684 ) ) ( not ( = ?auto_817677 ?auto_817678 ) ) ( not ( = ?auto_817677 ?auto_817679 ) ) ( not ( = ?auto_817677 ?auto_817680 ) ) ( not ( = ?auto_817677 ?auto_817681 ) ) ( not ( = ?auto_817677 ?auto_817682 ) ) ( not ( = ?auto_817677 ?auto_817683 ) ) ( not ( = ?auto_817677 ?auto_817684 ) ) ( not ( = ?auto_817678 ?auto_817679 ) ) ( not ( = ?auto_817678 ?auto_817680 ) ) ( not ( = ?auto_817678 ?auto_817681 ) ) ( not ( = ?auto_817678 ?auto_817682 ) ) ( not ( = ?auto_817678 ?auto_817683 ) ) ( not ( = ?auto_817678 ?auto_817684 ) ) ( not ( = ?auto_817679 ?auto_817680 ) ) ( not ( = ?auto_817679 ?auto_817681 ) ) ( not ( = ?auto_817679 ?auto_817682 ) ) ( not ( = ?auto_817679 ?auto_817683 ) ) ( not ( = ?auto_817679 ?auto_817684 ) ) ( not ( = ?auto_817680 ?auto_817681 ) ) ( not ( = ?auto_817680 ?auto_817682 ) ) ( not ( = ?auto_817680 ?auto_817683 ) ) ( not ( = ?auto_817680 ?auto_817684 ) ) ( not ( = ?auto_817681 ?auto_817682 ) ) ( not ( = ?auto_817681 ?auto_817683 ) ) ( not ( = ?auto_817681 ?auto_817684 ) ) ( not ( = ?auto_817682 ?auto_817683 ) ) ( not ( = ?auto_817682 ?auto_817684 ) ) ( not ( = ?auto_817683 ?auto_817684 ) ) ( ON ?auto_817682 ?auto_817683 ) ( CLEAR ?auto_817680 ) ( ON ?auto_817681 ?auto_817682 ) ( CLEAR ?auto_817681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_817666 ?auto_817667 ?auto_817668 ?auto_817669 ?auto_817670 ?auto_817671 ?auto_817672 ?auto_817673 ?auto_817674 ?auto_817675 ?auto_817676 ?auto_817677 ?auto_817678 ?auto_817679 ?auto_817680 ?auto_817681 )
      ( MAKE-18PILE ?auto_817666 ?auto_817667 ?auto_817668 ?auto_817669 ?auto_817670 ?auto_817671 ?auto_817672 ?auto_817673 ?auto_817674 ?auto_817675 ?auto_817676 ?auto_817677 ?auto_817678 ?auto_817679 ?auto_817680 ?auto_817681 ?auto_817682 ?auto_817683 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817703 - BLOCK
      ?auto_817704 - BLOCK
      ?auto_817705 - BLOCK
      ?auto_817706 - BLOCK
      ?auto_817707 - BLOCK
      ?auto_817708 - BLOCK
      ?auto_817709 - BLOCK
      ?auto_817710 - BLOCK
      ?auto_817711 - BLOCK
      ?auto_817712 - BLOCK
      ?auto_817713 - BLOCK
      ?auto_817714 - BLOCK
      ?auto_817715 - BLOCK
      ?auto_817716 - BLOCK
      ?auto_817717 - BLOCK
      ?auto_817718 - BLOCK
      ?auto_817719 - BLOCK
      ?auto_817720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_817720 ) ( ON-TABLE ?auto_817703 ) ( ON ?auto_817704 ?auto_817703 ) ( ON ?auto_817705 ?auto_817704 ) ( ON ?auto_817706 ?auto_817705 ) ( ON ?auto_817707 ?auto_817706 ) ( ON ?auto_817708 ?auto_817707 ) ( ON ?auto_817709 ?auto_817708 ) ( ON ?auto_817710 ?auto_817709 ) ( ON ?auto_817711 ?auto_817710 ) ( ON ?auto_817712 ?auto_817711 ) ( ON ?auto_817713 ?auto_817712 ) ( ON ?auto_817714 ?auto_817713 ) ( ON ?auto_817715 ?auto_817714 ) ( ON ?auto_817716 ?auto_817715 ) ( ON ?auto_817717 ?auto_817716 ) ( not ( = ?auto_817703 ?auto_817704 ) ) ( not ( = ?auto_817703 ?auto_817705 ) ) ( not ( = ?auto_817703 ?auto_817706 ) ) ( not ( = ?auto_817703 ?auto_817707 ) ) ( not ( = ?auto_817703 ?auto_817708 ) ) ( not ( = ?auto_817703 ?auto_817709 ) ) ( not ( = ?auto_817703 ?auto_817710 ) ) ( not ( = ?auto_817703 ?auto_817711 ) ) ( not ( = ?auto_817703 ?auto_817712 ) ) ( not ( = ?auto_817703 ?auto_817713 ) ) ( not ( = ?auto_817703 ?auto_817714 ) ) ( not ( = ?auto_817703 ?auto_817715 ) ) ( not ( = ?auto_817703 ?auto_817716 ) ) ( not ( = ?auto_817703 ?auto_817717 ) ) ( not ( = ?auto_817703 ?auto_817718 ) ) ( not ( = ?auto_817703 ?auto_817719 ) ) ( not ( = ?auto_817703 ?auto_817720 ) ) ( not ( = ?auto_817704 ?auto_817705 ) ) ( not ( = ?auto_817704 ?auto_817706 ) ) ( not ( = ?auto_817704 ?auto_817707 ) ) ( not ( = ?auto_817704 ?auto_817708 ) ) ( not ( = ?auto_817704 ?auto_817709 ) ) ( not ( = ?auto_817704 ?auto_817710 ) ) ( not ( = ?auto_817704 ?auto_817711 ) ) ( not ( = ?auto_817704 ?auto_817712 ) ) ( not ( = ?auto_817704 ?auto_817713 ) ) ( not ( = ?auto_817704 ?auto_817714 ) ) ( not ( = ?auto_817704 ?auto_817715 ) ) ( not ( = ?auto_817704 ?auto_817716 ) ) ( not ( = ?auto_817704 ?auto_817717 ) ) ( not ( = ?auto_817704 ?auto_817718 ) ) ( not ( = ?auto_817704 ?auto_817719 ) ) ( not ( = ?auto_817704 ?auto_817720 ) ) ( not ( = ?auto_817705 ?auto_817706 ) ) ( not ( = ?auto_817705 ?auto_817707 ) ) ( not ( = ?auto_817705 ?auto_817708 ) ) ( not ( = ?auto_817705 ?auto_817709 ) ) ( not ( = ?auto_817705 ?auto_817710 ) ) ( not ( = ?auto_817705 ?auto_817711 ) ) ( not ( = ?auto_817705 ?auto_817712 ) ) ( not ( = ?auto_817705 ?auto_817713 ) ) ( not ( = ?auto_817705 ?auto_817714 ) ) ( not ( = ?auto_817705 ?auto_817715 ) ) ( not ( = ?auto_817705 ?auto_817716 ) ) ( not ( = ?auto_817705 ?auto_817717 ) ) ( not ( = ?auto_817705 ?auto_817718 ) ) ( not ( = ?auto_817705 ?auto_817719 ) ) ( not ( = ?auto_817705 ?auto_817720 ) ) ( not ( = ?auto_817706 ?auto_817707 ) ) ( not ( = ?auto_817706 ?auto_817708 ) ) ( not ( = ?auto_817706 ?auto_817709 ) ) ( not ( = ?auto_817706 ?auto_817710 ) ) ( not ( = ?auto_817706 ?auto_817711 ) ) ( not ( = ?auto_817706 ?auto_817712 ) ) ( not ( = ?auto_817706 ?auto_817713 ) ) ( not ( = ?auto_817706 ?auto_817714 ) ) ( not ( = ?auto_817706 ?auto_817715 ) ) ( not ( = ?auto_817706 ?auto_817716 ) ) ( not ( = ?auto_817706 ?auto_817717 ) ) ( not ( = ?auto_817706 ?auto_817718 ) ) ( not ( = ?auto_817706 ?auto_817719 ) ) ( not ( = ?auto_817706 ?auto_817720 ) ) ( not ( = ?auto_817707 ?auto_817708 ) ) ( not ( = ?auto_817707 ?auto_817709 ) ) ( not ( = ?auto_817707 ?auto_817710 ) ) ( not ( = ?auto_817707 ?auto_817711 ) ) ( not ( = ?auto_817707 ?auto_817712 ) ) ( not ( = ?auto_817707 ?auto_817713 ) ) ( not ( = ?auto_817707 ?auto_817714 ) ) ( not ( = ?auto_817707 ?auto_817715 ) ) ( not ( = ?auto_817707 ?auto_817716 ) ) ( not ( = ?auto_817707 ?auto_817717 ) ) ( not ( = ?auto_817707 ?auto_817718 ) ) ( not ( = ?auto_817707 ?auto_817719 ) ) ( not ( = ?auto_817707 ?auto_817720 ) ) ( not ( = ?auto_817708 ?auto_817709 ) ) ( not ( = ?auto_817708 ?auto_817710 ) ) ( not ( = ?auto_817708 ?auto_817711 ) ) ( not ( = ?auto_817708 ?auto_817712 ) ) ( not ( = ?auto_817708 ?auto_817713 ) ) ( not ( = ?auto_817708 ?auto_817714 ) ) ( not ( = ?auto_817708 ?auto_817715 ) ) ( not ( = ?auto_817708 ?auto_817716 ) ) ( not ( = ?auto_817708 ?auto_817717 ) ) ( not ( = ?auto_817708 ?auto_817718 ) ) ( not ( = ?auto_817708 ?auto_817719 ) ) ( not ( = ?auto_817708 ?auto_817720 ) ) ( not ( = ?auto_817709 ?auto_817710 ) ) ( not ( = ?auto_817709 ?auto_817711 ) ) ( not ( = ?auto_817709 ?auto_817712 ) ) ( not ( = ?auto_817709 ?auto_817713 ) ) ( not ( = ?auto_817709 ?auto_817714 ) ) ( not ( = ?auto_817709 ?auto_817715 ) ) ( not ( = ?auto_817709 ?auto_817716 ) ) ( not ( = ?auto_817709 ?auto_817717 ) ) ( not ( = ?auto_817709 ?auto_817718 ) ) ( not ( = ?auto_817709 ?auto_817719 ) ) ( not ( = ?auto_817709 ?auto_817720 ) ) ( not ( = ?auto_817710 ?auto_817711 ) ) ( not ( = ?auto_817710 ?auto_817712 ) ) ( not ( = ?auto_817710 ?auto_817713 ) ) ( not ( = ?auto_817710 ?auto_817714 ) ) ( not ( = ?auto_817710 ?auto_817715 ) ) ( not ( = ?auto_817710 ?auto_817716 ) ) ( not ( = ?auto_817710 ?auto_817717 ) ) ( not ( = ?auto_817710 ?auto_817718 ) ) ( not ( = ?auto_817710 ?auto_817719 ) ) ( not ( = ?auto_817710 ?auto_817720 ) ) ( not ( = ?auto_817711 ?auto_817712 ) ) ( not ( = ?auto_817711 ?auto_817713 ) ) ( not ( = ?auto_817711 ?auto_817714 ) ) ( not ( = ?auto_817711 ?auto_817715 ) ) ( not ( = ?auto_817711 ?auto_817716 ) ) ( not ( = ?auto_817711 ?auto_817717 ) ) ( not ( = ?auto_817711 ?auto_817718 ) ) ( not ( = ?auto_817711 ?auto_817719 ) ) ( not ( = ?auto_817711 ?auto_817720 ) ) ( not ( = ?auto_817712 ?auto_817713 ) ) ( not ( = ?auto_817712 ?auto_817714 ) ) ( not ( = ?auto_817712 ?auto_817715 ) ) ( not ( = ?auto_817712 ?auto_817716 ) ) ( not ( = ?auto_817712 ?auto_817717 ) ) ( not ( = ?auto_817712 ?auto_817718 ) ) ( not ( = ?auto_817712 ?auto_817719 ) ) ( not ( = ?auto_817712 ?auto_817720 ) ) ( not ( = ?auto_817713 ?auto_817714 ) ) ( not ( = ?auto_817713 ?auto_817715 ) ) ( not ( = ?auto_817713 ?auto_817716 ) ) ( not ( = ?auto_817713 ?auto_817717 ) ) ( not ( = ?auto_817713 ?auto_817718 ) ) ( not ( = ?auto_817713 ?auto_817719 ) ) ( not ( = ?auto_817713 ?auto_817720 ) ) ( not ( = ?auto_817714 ?auto_817715 ) ) ( not ( = ?auto_817714 ?auto_817716 ) ) ( not ( = ?auto_817714 ?auto_817717 ) ) ( not ( = ?auto_817714 ?auto_817718 ) ) ( not ( = ?auto_817714 ?auto_817719 ) ) ( not ( = ?auto_817714 ?auto_817720 ) ) ( not ( = ?auto_817715 ?auto_817716 ) ) ( not ( = ?auto_817715 ?auto_817717 ) ) ( not ( = ?auto_817715 ?auto_817718 ) ) ( not ( = ?auto_817715 ?auto_817719 ) ) ( not ( = ?auto_817715 ?auto_817720 ) ) ( not ( = ?auto_817716 ?auto_817717 ) ) ( not ( = ?auto_817716 ?auto_817718 ) ) ( not ( = ?auto_817716 ?auto_817719 ) ) ( not ( = ?auto_817716 ?auto_817720 ) ) ( not ( = ?auto_817717 ?auto_817718 ) ) ( not ( = ?auto_817717 ?auto_817719 ) ) ( not ( = ?auto_817717 ?auto_817720 ) ) ( not ( = ?auto_817718 ?auto_817719 ) ) ( not ( = ?auto_817718 ?auto_817720 ) ) ( not ( = ?auto_817719 ?auto_817720 ) ) ( ON ?auto_817719 ?auto_817720 ) ( CLEAR ?auto_817717 ) ( ON ?auto_817718 ?auto_817719 ) ( CLEAR ?auto_817718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_817703 ?auto_817704 ?auto_817705 ?auto_817706 ?auto_817707 ?auto_817708 ?auto_817709 ?auto_817710 ?auto_817711 ?auto_817712 ?auto_817713 ?auto_817714 ?auto_817715 ?auto_817716 ?auto_817717 ?auto_817718 )
      ( MAKE-18PILE ?auto_817703 ?auto_817704 ?auto_817705 ?auto_817706 ?auto_817707 ?auto_817708 ?auto_817709 ?auto_817710 ?auto_817711 ?auto_817712 ?auto_817713 ?auto_817714 ?auto_817715 ?auto_817716 ?auto_817717 ?auto_817718 ?auto_817719 ?auto_817720 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817739 - BLOCK
      ?auto_817740 - BLOCK
      ?auto_817741 - BLOCK
      ?auto_817742 - BLOCK
      ?auto_817743 - BLOCK
      ?auto_817744 - BLOCK
      ?auto_817745 - BLOCK
      ?auto_817746 - BLOCK
      ?auto_817747 - BLOCK
      ?auto_817748 - BLOCK
      ?auto_817749 - BLOCK
      ?auto_817750 - BLOCK
      ?auto_817751 - BLOCK
      ?auto_817752 - BLOCK
      ?auto_817753 - BLOCK
      ?auto_817754 - BLOCK
      ?auto_817755 - BLOCK
      ?auto_817756 - BLOCK
    )
    :vars
    (
      ?auto_817757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817756 ?auto_817757 ) ( ON-TABLE ?auto_817739 ) ( ON ?auto_817740 ?auto_817739 ) ( ON ?auto_817741 ?auto_817740 ) ( ON ?auto_817742 ?auto_817741 ) ( ON ?auto_817743 ?auto_817742 ) ( ON ?auto_817744 ?auto_817743 ) ( ON ?auto_817745 ?auto_817744 ) ( ON ?auto_817746 ?auto_817745 ) ( ON ?auto_817747 ?auto_817746 ) ( ON ?auto_817748 ?auto_817747 ) ( ON ?auto_817749 ?auto_817748 ) ( ON ?auto_817750 ?auto_817749 ) ( ON ?auto_817751 ?auto_817750 ) ( ON ?auto_817752 ?auto_817751 ) ( not ( = ?auto_817739 ?auto_817740 ) ) ( not ( = ?auto_817739 ?auto_817741 ) ) ( not ( = ?auto_817739 ?auto_817742 ) ) ( not ( = ?auto_817739 ?auto_817743 ) ) ( not ( = ?auto_817739 ?auto_817744 ) ) ( not ( = ?auto_817739 ?auto_817745 ) ) ( not ( = ?auto_817739 ?auto_817746 ) ) ( not ( = ?auto_817739 ?auto_817747 ) ) ( not ( = ?auto_817739 ?auto_817748 ) ) ( not ( = ?auto_817739 ?auto_817749 ) ) ( not ( = ?auto_817739 ?auto_817750 ) ) ( not ( = ?auto_817739 ?auto_817751 ) ) ( not ( = ?auto_817739 ?auto_817752 ) ) ( not ( = ?auto_817739 ?auto_817753 ) ) ( not ( = ?auto_817739 ?auto_817754 ) ) ( not ( = ?auto_817739 ?auto_817755 ) ) ( not ( = ?auto_817739 ?auto_817756 ) ) ( not ( = ?auto_817739 ?auto_817757 ) ) ( not ( = ?auto_817740 ?auto_817741 ) ) ( not ( = ?auto_817740 ?auto_817742 ) ) ( not ( = ?auto_817740 ?auto_817743 ) ) ( not ( = ?auto_817740 ?auto_817744 ) ) ( not ( = ?auto_817740 ?auto_817745 ) ) ( not ( = ?auto_817740 ?auto_817746 ) ) ( not ( = ?auto_817740 ?auto_817747 ) ) ( not ( = ?auto_817740 ?auto_817748 ) ) ( not ( = ?auto_817740 ?auto_817749 ) ) ( not ( = ?auto_817740 ?auto_817750 ) ) ( not ( = ?auto_817740 ?auto_817751 ) ) ( not ( = ?auto_817740 ?auto_817752 ) ) ( not ( = ?auto_817740 ?auto_817753 ) ) ( not ( = ?auto_817740 ?auto_817754 ) ) ( not ( = ?auto_817740 ?auto_817755 ) ) ( not ( = ?auto_817740 ?auto_817756 ) ) ( not ( = ?auto_817740 ?auto_817757 ) ) ( not ( = ?auto_817741 ?auto_817742 ) ) ( not ( = ?auto_817741 ?auto_817743 ) ) ( not ( = ?auto_817741 ?auto_817744 ) ) ( not ( = ?auto_817741 ?auto_817745 ) ) ( not ( = ?auto_817741 ?auto_817746 ) ) ( not ( = ?auto_817741 ?auto_817747 ) ) ( not ( = ?auto_817741 ?auto_817748 ) ) ( not ( = ?auto_817741 ?auto_817749 ) ) ( not ( = ?auto_817741 ?auto_817750 ) ) ( not ( = ?auto_817741 ?auto_817751 ) ) ( not ( = ?auto_817741 ?auto_817752 ) ) ( not ( = ?auto_817741 ?auto_817753 ) ) ( not ( = ?auto_817741 ?auto_817754 ) ) ( not ( = ?auto_817741 ?auto_817755 ) ) ( not ( = ?auto_817741 ?auto_817756 ) ) ( not ( = ?auto_817741 ?auto_817757 ) ) ( not ( = ?auto_817742 ?auto_817743 ) ) ( not ( = ?auto_817742 ?auto_817744 ) ) ( not ( = ?auto_817742 ?auto_817745 ) ) ( not ( = ?auto_817742 ?auto_817746 ) ) ( not ( = ?auto_817742 ?auto_817747 ) ) ( not ( = ?auto_817742 ?auto_817748 ) ) ( not ( = ?auto_817742 ?auto_817749 ) ) ( not ( = ?auto_817742 ?auto_817750 ) ) ( not ( = ?auto_817742 ?auto_817751 ) ) ( not ( = ?auto_817742 ?auto_817752 ) ) ( not ( = ?auto_817742 ?auto_817753 ) ) ( not ( = ?auto_817742 ?auto_817754 ) ) ( not ( = ?auto_817742 ?auto_817755 ) ) ( not ( = ?auto_817742 ?auto_817756 ) ) ( not ( = ?auto_817742 ?auto_817757 ) ) ( not ( = ?auto_817743 ?auto_817744 ) ) ( not ( = ?auto_817743 ?auto_817745 ) ) ( not ( = ?auto_817743 ?auto_817746 ) ) ( not ( = ?auto_817743 ?auto_817747 ) ) ( not ( = ?auto_817743 ?auto_817748 ) ) ( not ( = ?auto_817743 ?auto_817749 ) ) ( not ( = ?auto_817743 ?auto_817750 ) ) ( not ( = ?auto_817743 ?auto_817751 ) ) ( not ( = ?auto_817743 ?auto_817752 ) ) ( not ( = ?auto_817743 ?auto_817753 ) ) ( not ( = ?auto_817743 ?auto_817754 ) ) ( not ( = ?auto_817743 ?auto_817755 ) ) ( not ( = ?auto_817743 ?auto_817756 ) ) ( not ( = ?auto_817743 ?auto_817757 ) ) ( not ( = ?auto_817744 ?auto_817745 ) ) ( not ( = ?auto_817744 ?auto_817746 ) ) ( not ( = ?auto_817744 ?auto_817747 ) ) ( not ( = ?auto_817744 ?auto_817748 ) ) ( not ( = ?auto_817744 ?auto_817749 ) ) ( not ( = ?auto_817744 ?auto_817750 ) ) ( not ( = ?auto_817744 ?auto_817751 ) ) ( not ( = ?auto_817744 ?auto_817752 ) ) ( not ( = ?auto_817744 ?auto_817753 ) ) ( not ( = ?auto_817744 ?auto_817754 ) ) ( not ( = ?auto_817744 ?auto_817755 ) ) ( not ( = ?auto_817744 ?auto_817756 ) ) ( not ( = ?auto_817744 ?auto_817757 ) ) ( not ( = ?auto_817745 ?auto_817746 ) ) ( not ( = ?auto_817745 ?auto_817747 ) ) ( not ( = ?auto_817745 ?auto_817748 ) ) ( not ( = ?auto_817745 ?auto_817749 ) ) ( not ( = ?auto_817745 ?auto_817750 ) ) ( not ( = ?auto_817745 ?auto_817751 ) ) ( not ( = ?auto_817745 ?auto_817752 ) ) ( not ( = ?auto_817745 ?auto_817753 ) ) ( not ( = ?auto_817745 ?auto_817754 ) ) ( not ( = ?auto_817745 ?auto_817755 ) ) ( not ( = ?auto_817745 ?auto_817756 ) ) ( not ( = ?auto_817745 ?auto_817757 ) ) ( not ( = ?auto_817746 ?auto_817747 ) ) ( not ( = ?auto_817746 ?auto_817748 ) ) ( not ( = ?auto_817746 ?auto_817749 ) ) ( not ( = ?auto_817746 ?auto_817750 ) ) ( not ( = ?auto_817746 ?auto_817751 ) ) ( not ( = ?auto_817746 ?auto_817752 ) ) ( not ( = ?auto_817746 ?auto_817753 ) ) ( not ( = ?auto_817746 ?auto_817754 ) ) ( not ( = ?auto_817746 ?auto_817755 ) ) ( not ( = ?auto_817746 ?auto_817756 ) ) ( not ( = ?auto_817746 ?auto_817757 ) ) ( not ( = ?auto_817747 ?auto_817748 ) ) ( not ( = ?auto_817747 ?auto_817749 ) ) ( not ( = ?auto_817747 ?auto_817750 ) ) ( not ( = ?auto_817747 ?auto_817751 ) ) ( not ( = ?auto_817747 ?auto_817752 ) ) ( not ( = ?auto_817747 ?auto_817753 ) ) ( not ( = ?auto_817747 ?auto_817754 ) ) ( not ( = ?auto_817747 ?auto_817755 ) ) ( not ( = ?auto_817747 ?auto_817756 ) ) ( not ( = ?auto_817747 ?auto_817757 ) ) ( not ( = ?auto_817748 ?auto_817749 ) ) ( not ( = ?auto_817748 ?auto_817750 ) ) ( not ( = ?auto_817748 ?auto_817751 ) ) ( not ( = ?auto_817748 ?auto_817752 ) ) ( not ( = ?auto_817748 ?auto_817753 ) ) ( not ( = ?auto_817748 ?auto_817754 ) ) ( not ( = ?auto_817748 ?auto_817755 ) ) ( not ( = ?auto_817748 ?auto_817756 ) ) ( not ( = ?auto_817748 ?auto_817757 ) ) ( not ( = ?auto_817749 ?auto_817750 ) ) ( not ( = ?auto_817749 ?auto_817751 ) ) ( not ( = ?auto_817749 ?auto_817752 ) ) ( not ( = ?auto_817749 ?auto_817753 ) ) ( not ( = ?auto_817749 ?auto_817754 ) ) ( not ( = ?auto_817749 ?auto_817755 ) ) ( not ( = ?auto_817749 ?auto_817756 ) ) ( not ( = ?auto_817749 ?auto_817757 ) ) ( not ( = ?auto_817750 ?auto_817751 ) ) ( not ( = ?auto_817750 ?auto_817752 ) ) ( not ( = ?auto_817750 ?auto_817753 ) ) ( not ( = ?auto_817750 ?auto_817754 ) ) ( not ( = ?auto_817750 ?auto_817755 ) ) ( not ( = ?auto_817750 ?auto_817756 ) ) ( not ( = ?auto_817750 ?auto_817757 ) ) ( not ( = ?auto_817751 ?auto_817752 ) ) ( not ( = ?auto_817751 ?auto_817753 ) ) ( not ( = ?auto_817751 ?auto_817754 ) ) ( not ( = ?auto_817751 ?auto_817755 ) ) ( not ( = ?auto_817751 ?auto_817756 ) ) ( not ( = ?auto_817751 ?auto_817757 ) ) ( not ( = ?auto_817752 ?auto_817753 ) ) ( not ( = ?auto_817752 ?auto_817754 ) ) ( not ( = ?auto_817752 ?auto_817755 ) ) ( not ( = ?auto_817752 ?auto_817756 ) ) ( not ( = ?auto_817752 ?auto_817757 ) ) ( not ( = ?auto_817753 ?auto_817754 ) ) ( not ( = ?auto_817753 ?auto_817755 ) ) ( not ( = ?auto_817753 ?auto_817756 ) ) ( not ( = ?auto_817753 ?auto_817757 ) ) ( not ( = ?auto_817754 ?auto_817755 ) ) ( not ( = ?auto_817754 ?auto_817756 ) ) ( not ( = ?auto_817754 ?auto_817757 ) ) ( not ( = ?auto_817755 ?auto_817756 ) ) ( not ( = ?auto_817755 ?auto_817757 ) ) ( not ( = ?auto_817756 ?auto_817757 ) ) ( ON ?auto_817755 ?auto_817756 ) ( ON ?auto_817754 ?auto_817755 ) ( CLEAR ?auto_817752 ) ( ON ?auto_817753 ?auto_817754 ) ( CLEAR ?auto_817753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_817739 ?auto_817740 ?auto_817741 ?auto_817742 ?auto_817743 ?auto_817744 ?auto_817745 ?auto_817746 ?auto_817747 ?auto_817748 ?auto_817749 ?auto_817750 ?auto_817751 ?auto_817752 ?auto_817753 )
      ( MAKE-18PILE ?auto_817739 ?auto_817740 ?auto_817741 ?auto_817742 ?auto_817743 ?auto_817744 ?auto_817745 ?auto_817746 ?auto_817747 ?auto_817748 ?auto_817749 ?auto_817750 ?auto_817751 ?auto_817752 ?auto_817753 ?auto_817754 ?auto_817755 ?auto_817756 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817776 - BLOCK
      ?auto_817777 - BLOCK
      ?auto_817778 - BLOCK
      ?auto_817779 - BLOCK
      ?auto_817780 - BLOCK
      ?auto_817781 - BLOCK
      ?auto_817782 - BLOCK
      ?auto_817783 - BLOCK
      ?auto_817784 - BLOCK
      ?auto_817785 - BLOCK
      ?auto_817786 - BLOCK
      ?auto_817787 - BLOCK
      ?auto_817788 - BLOCK
      ?auto_817789 - BLOCK
      ?auto_817790 - BLOCK
      ?auto_817791 - BLOCK
      ?auto_817792 - BLOCK
      ?auto_817793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_817793 ) ( ON-TABLE ?auto_817776 ) ( ON ?auto_817777 ?auto_817776 ) ( ON ?auto_817778 ?auto_817777 ) ( ON ?auto_817779 ?auto_817778 ) ( ON ?auto_817780 ?auto_817779 ) ( ON ?auto_817781 ?auto_817780 ) ( ON ?auto_817782 ?auto_817781 ) ( ON ?auto_817783 ?auto_817782 ) ( ON ?auto_817784 ?auto_817783 ) ( ON ?auto_817785 ?auto_817784 ) ( ON ?auto_817786 ?auto_817785 ) ( ON ?auto_817787 ?auto_817786 ) ( ON ?auto_817788 ?auto_817787 ) ( ON ?auto_817789 ?auto_817788 ) ( not ( = ?auto_817776 ?auto_817777 ) ) ( not ( = ?auto_817776 ?auto_817778 ) ) ( not ( = ?auto_817776 ?auto_817779 ) ) ( not ( = ?auto_817776 ?auto_817780 ) ) ( not ( = ?auto_817776 ?auto_817781 ) ) ( not ( = ?auto_817776 ?auto_817782 ) ) ( not ( = ?auto_817776 ?auto_817783 ) ) ( not ( = ?auto_817776 ?auto_817784 ) ) ( not ( = ?auto_817776 ?auto_817785 ) ) ( not ( = ?auto_817776 ?auto_817786 ) ) ( not ( = ?auto_817776 ?auto_817787 ) ) ( not ( = ?auto_817776 ?auto_817788 ) ) ( not ( = ?auto_817776 ?auto_817789 ) ) ( not ( = ?auto_817776 ?auto_817790 ) ) ( not ( = ?auto_817776 ?auto_817791 ) ) ( not ( = ?auto_817776 ?auto_817792 ) ) ( not ( = ?auto_817776 ?auto_817793 ) ) ( not ( = ?auto_817777 ?auto_817778 ) ) ( not ( = ?auto_817777 ?auto_817779 ) ) ( not ( = ?auto_817777 ?auto_817780 ) ) ( not ( = ?auto_817777 ?auto_817781 ) ) ( not ( = ?auto_817777 ?auto_817782 ) ) ( not ( = ?auto_817777 ?auto_817783 ) ) ( not ( = ?auto_817777 ?auto_817784 ) ) ( not ( = ?auto_817777 ?auto_817785 ) ) ( not ( = ?auto_817777 ?auto_817786 ) ) ( not ( = ?auto_817777 ?auto_817787 ) ) ( not ( = ?auto_817777 ?auto_817788 ) ) ( not ( = ?auto_817777 ?auto_817789 ) ) ( not ( = ?auto_817777 ?auto_817790 ) ) ( not ( = ?auto_817777 ?auto_817791 ) ) ( not ( = ?auto_817777 ?auto_817792 ) ) ( not ( = ?auto_817777 ?auto_817793 ) ) ( not ( = ?auto_817778 ?auto_817779 ) ) ( not ( = ?auto_817778 ?auto_817780 ) ) ( not ( = ?auto_817778 ?auto_817781 ) ) ( not ( = ?auto_817778 ?auto_817782 ) ) ( not ( = ?auto_817778 ?auto_817783 ) ) ( not ( = ?auto_817778 ?auto_817784 ) ) ( not ( = ?auto_817778 ?auto_817785 ) ) ( not ( = ?auto_817778 ?auto_817786 ) ) ( not ( = ?auto_817778 ?auto_817787 ) ) ( not ( = ?auto_817778 ?auto_817788 ) ) ( not ( = ?auto_817778 ?auto_817789 ) ) ( not ( = ?auto_817778 ?auto_817790 ) ) ( not ( = ?auto_817778 ?auto_817791 ) ) ( not ( = ?auto_817778 ?auto_817792 ) ) ( not ( = ?auto_817778 ?auto_817793 ) ) ( not ( = ?auto_817779 ?auto_817780 ) ) ( not ( = ?auto_817779 ?auto_817781 ) ) ( not ( = ?auto_817779 ?auto_817782 ) ) ( not ( = ?auto_817779 ?auto_817783 ) ) ( not ( = ?auto_817779 ?auto_817784 ) ) ( not ( = ?auto_817779 ?auto_817785 ) ) ( not ( = ?auto_817779 ?auto_817786 ) ) ( not ( = ?auto_817779 ?auto_817787 ) ) ( not ( = ?auto_817779 ?auto_817788 ) ) ( not ( = ?auto_817779 ?auto_817789 ) ) ( not ( = ?auto_817779 ?auto_817790 ) ) ( not ( = ?auto_817779 ?auto_817791 ) ) ( not ( = ?auto_817779 ?auto_817792 ) ) ( not ( = ?auto_817779 ?auto_817793 ) ) ( not ( = ?auto_817780 ?auto_817781 ) ) ( not ( = ?auto_817780 ?auto_817782 ) ) ( not ( = ?auto_817780 ?auto_817783 ) ) ( not ( = ?auto_817780 ?auto_817784 ) ) ( not ( = ?auto_817780 ?auto_817785 ) ) ( not ( = ?auto_817780 ?auto_817786 ) ) ( not ( = ?auto_817780 ?auto_817787 ) ) ( not ( = ?auto_817780 ?auto_817788 ) ) ( not ( = ?auto_817780 ?auto_817789 ) ) ( not ( = ?auto_817780 ?auto_817790 ) ) ( not ( = ?auto_817780 ?auto_817791 ) ) ( not ( = ?auto_817780 ?auto_817792 ) ) ( not ( = ?auto_817780 ?auto_817793 ) ) ( not ( = ?auto_817781 ?auto_817782 ) ) ( not ( = ?auto_817781 ?auto_817783 ) ) ( not ( = ?auto_817781 ?auto_817784 ) ) ( not ( = ?auto_817781 ?auto_817785 ) ) ( not ( = ?auto_817781 ?auto_817786 ) ) ( not ( = ?auto_817781 ?auto_817787 ) ) ( not ( = ?auto_817781 ?auto_817788 ) ) ( not ( = ?auto_817781 ?auto_817789 ) ) ( not ( = ?auto_817781 ?auto_817790 ) ) ( not ( = ?auto_817781 ?auto_817791 ) ) ( not ( = ?auto_817781 ?auto_817792 ) ) ( not ( = ?auto_817781 ?auto_817793 ) ) ( not ( = ?auto_817782 ?auto_817783 ) ) ( not ( = ?auto_817782 ?auto_817784 ) ) ( not ( = ?auto_817782 ?auto_817785 ) ) ( not ( = ?auto_817782 ?auto_817786 ) ) ( not ( = ?auto_817782 ?auto_817787 ) ) ( not ( = ?auto_817782 ?auto_817788 ) ) ( not ( = ?auto_817782 ?auto_817789 ) ) ( not ( = ?auto_817782 ?auto_817790 ) ) ( not ( = ?auto_817782 ?auto_817791 ) ) ( not ( = ?auto_817782 ?auto_817792 ) ) ( not ( = ?auto_817782 ?auto_817793 ) ) ( not ( = ?auto_817783 ?auto_817784 ) ) ( not ( = ?auto_817783 ?auto_817785 ) ) ( not ( = ?auto_817783 ?auto_817786 ) ) ( not ( = ?auto_817783 ?auto_817787 ) ) ( not ( = ?auto_817783 ?auto_817788 ) ) ( not ( = ?auto_817783 ?auto_817789 ) ) ( not ( = ?auto_817783 ?auto_817790 ) ) ( not ( = ?auto_817783 ?auto_817791 ) ) ( not ( = ?auto_817783 ?auto_817792 ) ) ( not ( = ?auto_817783 ?auto_817793 ) ) ( not ( = ?auto_817784 ?auto_817785 ) ) ( not ( = ?auto_817784 ?auto_817786 ) ) ( not ( = ?auto_817784 ?auto_817787 ) ) ( not ( = ?auto_817784 ?auto_817788 ) ) ( not ( = ?auto_817784 ?auto_817789 ) ) ( not ( = ?auto_817784 ?auto_817790 ) ) ( not ( = ?auto_817784 ?auto_817791 ) ) ( not ( = ?auto_817784 ?auto_817792 ) ) ( not ( = ?auto_817784 ?auto_817793 ) ) ( not ( = ?auto_817785 ?auto_817786 ) ) ( not ( = ?auto_817785 ?auto_817787 ) ) ( not ( = ?auto_817785 ?auto_817788 ) ) ( not ( = ?auto_817785 ?auto_817789 ) ) ( not ( = ?auto_817785 ?auto_817790 ) ) ( not ( = ?auto_817785 ?auto_817791 ) ) ( not ( = ?auto_817785 ?auto_817792 ) ) ( not ( = ?auto_817785 ?auto_817793 ) ) ( not ( = ?auto_817786 ?auto_817787 ) ) ( not ( = ?auto_817786 ?auto_817788 ) ) ( not ( = ?auto_817786 ?auto_817789 ) ) ( not ( = ?auto_817786 ?auto_817790 ) ) ( not ( = ?auto_817786 ?auto_817791 ) ) ( not ( = ?auto_817786 ?auto_817792 ) ) ( not ( = ?auto_817786 ?auto_817793 ) ) ( not ( = ?auto_817787 ?auto_817788 ) ) ( not ( = ?auto_817787 ?auto_817789 ) ) ( not ( = ?auto_817787 ?auto_817790 ) ) ( not ( = ?auto_817787 ?auto_817791 ) ) ( not ( = ?auto_817787 ?auto_817792 ) ) ( not ( = ?auto_817787 ?auto_817793 ) ) ( not ( = ?auto_817788 ?auto_817789 ) ) ( not ( = ?auto_817788 ?auto_817790 ) ) ( not ( = ?auto_817788 ?auto_817791 ) ) ( not ( = ?auto_817788 ?auto_817792 ) ) ( not ( = ?auto_817788 ?auto_817793 ) ) ( not ( = ?auto_817789 ?auto_817790 ) ) ( not ( = ?auto_817789 ?auto_817791 ) ) ( not ( = ?auto_817789 ?auto_817792 ) ) ( not ( = ?auto_817789 ?auto_817793 ) ) ( not ( = ?auto_817790 ?auto_817791 ) ) ( not ( = ?auto_817790 ?auto_817792 ) ) ( not ( = ?auto_817790 ?auto_817793 ) ) ( not ( = ?auto_817791 ?auto_817792 ) ) ( not ( = ?auto_817791 ?auto_817793 ) ) ( not ( = ?auto_817792 ?auto_817793 ) ) ( ON ?auto_817792 ?auto_817793 ) ( ON ?auto_817791 ?auto_817792 ) ( CLEAR ?auto_817789 ) ( ON ?auto_817790 ?auto_817791 ) ( CLEAR ?auto_817790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_817776 ?auto_817777 ?auto_817778 ?auto_817779 ?auto_817780 ?auto_817781 ?auto_817782 ?auto_817783 ?auto_817784 ?auto_817785 ?auto_817786 ?auto_817787 ?auto_817788 ?auto_817789 ?auto_817790 )
      ( MAKE-18PILE ?auto_817776 ?auto_817777 ?auto_817778 ?auto_817779 ?auto_817780 ?auto_817781 ?auto_817782 ?auto_817783 ?auto_817784 ?auto_817785 ?auto_817786 ?auto_817787 ?auto_817788 ?auto_817789 ?auto_817790 ?auto_817791 ?auto_817792 ?auto_817793 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817812 - BLOCK
      ?auto_817813 - BLOCK
      ?auto_817814 - BLOCK
      ?auto_817815 - BLOCK
      ?auto_817816 - BLOCK
      ?auto_817817 - BLOCK
      ?auto_817818 - BLOCK
      ?auto_817819 - BLOCK
      ?auto_817820 - BLOCK
      ?auto_817821 - BLOCK
      ?auto_817822 - BLOCK
      ?auto_817823 - BLOCK
      ?auto_817824 - BLOCK
      ?auto_817825 - BLOCK
      ?auto_817826 - BLOCK
      ?auto_817827 - BLOCK
      ?auto_817828 - BLOCK
      ?auto_817829 - BLOCK
    )
    :vars
    (
      ?auto_817830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817829 ?auto_817830 ) ( ON-TABLE ?auto_817812 ) ( ON ?auto_817813 ?auto_817812 ) ( ON ?auto_817814 ?auto_817813 ) ( ON ?auto_817815 ?auto_817814 ) ( ON ?auto_817816 ?auto_817815 ) ( ON ?auto_817817 ?auto_817816 ) ( ON ?auto_817818 ?auto_817817 ) ( ON ?auto_817819 ?auto_817818 ) ( ON ?auto_817820 ?auto_817819 ) ( ON ?auto_817821 ?auto_817820 ) ( ON ?auto_817822 ?auto_817821 ) ( ON ?auto_817823 ?auto_817822 ) ( ON ?auto_817824 ?auto_817823 ) ( not ( = ?auto_817812 ?auto_817813 ) ) ( not ( = ?auto_817812 ?auto_817814 ) ) ( not ( = ?auto_817812 ?auto_817815 ) ) ( not ( = ?auto_817812 ?auto_817816 ) ) ( not ( = ?auto_817812 ?auto_817817 ) ) ( not ( = ?auto_817812 ?auto_817818 ) ) ( not ( = ?auto_817812 ?auto_817819 ) ) ( not ( = ?auto_817812 ?auto_817820 ) ) ( not ( = ?auto_817812 ?auto_817821 ) ) ( not ( = ?auto_817812 ?auto_817822 ) ) ( not ( = ?auto_817812 ?auto_817823 ) ) ( not ( = ?auto_817812 ?auto_817824 ) ) ( not ( = ?auto_817812 ?auto_817825 ) ) ( not ( = ?auto_817812 ?auto_817826 ) ) ( not ( = ?auto_817812 ?auto_817827 ) ) ( not ( = ?auto_817812 ?auto_817828 ) ) ( not ( = ?auto_817812 ?auto_817829 ) ) ( not ( = ?auto_817812 ?auto_817830 ) ) ( not ( = ?auto_817813 ?auto_817814 ) ) ( not ( = ?auto_817813 ?auto_817815 ) ) ( not ( = ?auto_817813 ?auto_817816 ) ) ( not ( = ?auto_817813 ?auto_817817 ) ) ( not ( = ?auto_817813 ?auto_817818 ) ) ( not ( = ?auto_817813 ?auto_817819 ) ) ( not ( = ?auto_817813 ?auto_817820 ) ) ( not ( = ?auto_817813 ?auto_817821 ) ) ( not ( = ?auto_817813 ?auto_817822 ) ) ( not ( = ?auto_817813 ?auto_817823 ) ) ( not ( = ?auto_817813 ?auto_817824 ) ) ( not ( = ?auto_817813 ?auto_817825 ) ) ( not ( = ?auto_817813 ?auto_817826 ) ) ( not ( = ?auto_817813 ?auto_817827 ) ) ( not ( = ?auto_817813 ?auto_817828 ) ) ( not ( = ?auto_817813 ?auto_817829 ) ) ( not ( = ?auto_817813 ?auto_817830 ) ) ( not ( = ?auto_817814 ?auto_817815 ) ) ( not ( = ?auto_817814 ?auto_817816 ) ) ( not ( = ?auto_817814 ?auto_817817 ) ) ( not ( = ?auto_817814 ?auto_817818 ) ) ( not ( = ?auto_817814 ?auto_817819 ) ) ( not ( = ?auto_817814 ?auto_817820 ) ) ( not ( = ?auto_817814 ?auto_817821 ) ) ( not ( = ?auto_817814 ?auto_817822 ) ) ( not ( = ?auto_817814 ?auto_817823 ) ) ( not ( = ?auto_817814 ?auto_817824 ) ) ( not ( = ?auto_817814 ?auto_817825 ) ) ( not ( = ?auto_817814 ?auto_817826 ) ) ( not ( = ?auto_817814 ?auto_817827 ) ) ( not ( = ?auto_817814 ?auto_817828 ) ) ( not ( = ?auto_817814 ?auto_817829 ) ) ( not ( = ?auto_817814 ?auto_817830 ) ) ( not ( = ?auto_817815 ?auto_817816 ) ) ( not ( = ?auto_817815 ?auto_817817 ) ) ( not ( = ?auto_817815 ?auto_817818 ) ) ( not ( = ?auto_817815 ?auto_817819 ) ) ( not ( = ?auto_817815 ?auto_817820 ) ) ( not ( = ?auto_817815 ?auto_817821 ) ) ( not ( = ?auto_817815 ?auto_817822 ) ) ( not ( = ?auto_817815 ?auto_817823 ) ) ( not ( = ?auto_817815 ?auto_817824 ) ) ( not ( = ?auto_817815 ?auto_817825 ) ) ( not ( = ?auto_817815 ?auto_817826 ) ) ( not ( = ?auto_817815 ?auto_817827 ) ) ( not ( = ?auto_817815 ?auto_817828 ) ) ( not ( = ?auto_817815 ?auto_817829 ) ) ( not ( = ?auto_817815 ?auto_817830 ) ) ( not ( = ?auto_817816 ?auto_817817 ) ) ( not ( = ?auto_817816 ?auto_817818 ) ) ( not ( = ?auto_817816 ?auto_817819 ) ) ( not ( = ?auto_817816 ?auto_817820 ) ) ( not ( = ?auto_817816 ?auto_817821 ) ) ( not ( = ?auto_817816 ?auto_817822 ) ) ( not ( = ?auto_817816 ?auto_817823 ) ) ( not ( = ?auto_817816 ?auto_817824 ) ) ( not ( = ?auto_817816 ?auto_817825 ) ) ( not ( = ?auto_817816 ?auto_817826 ) ) ( not ( = ?auto_817816 ?auto_817827 ) ) ( not ( = ?auto_817816 ?auto_817828 ) ) ( not ( = ?auto_817816 ?auto_817829 ) ) ( not ( = ?auto_817816 ?auto_817830 ) ) ( not ( = ?auto_817817 ?auto_817818 ) ) ( not ( = ?auto_817817 ?auto_817819 ) ) ( not ( = ?auto_817817 ?auto_817820 ) ) ( not ( = ?auto_817817 ?auto_817821 ) ) ( not ( = ?auto_817817 ?auto_817822 ) ) ( not ( = ?auto_817817 ?auto_817823 ) ) ( not ( = ?auto_817817 ?auto_817824 ) ) ( not ( = ?auto_817817 ?auto_817825 ) ) ( not ( = ?auto_817817 ?auto_817826 ) ) ( not ( = ?auto_817817 ?auto_817827 ) ) ( not ( = ?auto_817817 ?auto_817828 ) ) ( not ( = ?auto_817817 ?auto_817829 ) ) ( not ( = ?auto_817817 ?auto_817830 ) ) ( not ( = ?auto_817818 ?auto_817819 ) ) ( not ( = ?auto_817818 ?auto_817820 ) ) ( not ( = ?auto_817818 ?auto_817821 ) ) ( not ( = ?auto_817818 ?auto_817822 ) ) ( not ( = ?auto_817818 ?auto_817823 ) ) ( not ( = ?auto_817818 ?auto_817824 ) ) ( not ( = ?auto_817818 ?auto_817825 ) ) ( not ( = ?auto_817818 ?auto_817826 ) ) ( not ( = ?auto_817818 ?auto_817827 ) ) ( not ( = ?auto_817818 ?auto_817828 ) ) ( not ( = ?auto_817818 ?auto_817829 ) ) ( not ( = ?auto_817818 ?auto_817830 ) ) ( not ( = ?auto_817819 ?auto_817820 ) ) ( not ( = ?auto_817819 ?auto_817821 ) ) ( not ( = ?auto_817819 ?auto_817822 ) ) ( not ( = ?auto_817819 ?auto_817823 ) ) ( not ( = ?auto_817819 ?auto_817824 ) ) ( not ( = ?auto_817819 ?auto_817825 ) ) ( not ( = ?auto_817819 ?auto_817826 ) ) ( not ( = ?auto_817819 ?auto_817827 ) ) ( not ( = ?auto_817819 ?auto_817828 ) ) ( not ( = ?auto_817819 ?auto_817829 ) ) ( not ( = ?auto_817819 ?auto_817830 ) ) ( not ( = ?auto_817820 ?auto_817821 ) ) ( not ( = ?auto_817820 ?auto_817822 ) ) ( not ( = ?auto_817820 ?auto_817823 ) ) ( not ( = ?auto_817820 ?auto_817824 ) ) ( not ( = ?auto_817820 ?auto_817825 ) ) ( not ( = ?auto_817820 ?auto_817826 ) ) ( not ( = ?auto_817820 ?auto_817827 ) ) ( not ( = ?auto_817820 ?auto_817828 ) ) ( not ( = ?auto_817820 ?auto_817829 ) ) ( not ( = ?auto_817820 ?auto_817830 ) ) ( not ( = ?auto_817821 ?auto_817822 ) ) ( not ( = ?auto_817821 ?auto_817823 ) ) ( not ( = ?auto_817821 ?auto_817824 ) ) ( not ( = ?auto_817821 ?auto_817825 ) ) ( not ( = ?auto_817821 ?auto_817826 ) ) ( not ( = ?auto_817821 ?auto_817827 ) ) ( not ( = ?auto_817821 ?auto_817828 ) ) ( not ( = ?auto_817821 ?auto_817829 ) ) ( not ( = ?auto_817821 ?auto_817830 ) ) ( not ( = ?auto_817822 ?auto_817823 ) ) ( not ( = ?auto_817822 ?auto_817824 ) ) ( not ( = ?auto_817822 ?auto_817825 ) ) ( not ( = ?auto_817822 ?auto_817826 ) ) ( not ( = ?auto_817822 ?auto_817827 ) ) ( not ( = ?auto_817822 ?auto_817828 ) ) ( not ( = ?auto_817822 ?auto_817829 ) ) ( not ( = ?auto_817822 ?auto_817830 ) ) ( not ( = ?auto_817823 ?auto_817824 ) ) ( not ( = ?auto_817823 ?auto_817825 ) ) ( not ( = ?auto_817823 ?auto_817826 ) ) ( not ( = ?auto_817823 ?auto_817827 ) ) ( not ( = ?auto_817823 ?auto_817828 ) ) ( not ( = ?auto_817823 ?auto_817829 ) ) ( not ( = ?auto_817823 ?auto_817830 ) ) ( not ( = ?auto_817824 ?auto_817825 ) ) ( not ( = ?auto_817824 ?auto_817826 ) ) ( not ( = ?auto_817824 ?auto_817827 ) ) ( not ( = ?auto_817824 ?auto_817828 ) ) ( not ( = ?auto_817824 ?auto_817829 ) ) ( not ( = ?auto_817824 ?auto_817830 ) ) ( not ( = ?auto_817825 ?auto_817826 ) ) ( not ( = ?auto_817825 ?auto_817827 ) ) ( not ( = ?auto_817825 ?auto_817828 ) ) ( not ( = ?auto_817825 ?auto_817829 ) ) ( not ( = ?auto_817825 ?auto_817830 ) ) ( not ( = ?auto_817826 ?auto_817827 ) ) ( not ( = ?auto_817826 ?auto_817828 ) ) ( not ( = ?auto_817826 ?auto_817829 ) ) ( not ( = ?auto_817826 ?auto_817830 ) ) ( not ( = ?auto_817827 ?auto_817828 ) ) ( not ( = ?auto_817827 ?auto_817829 ) ) ( not ( = ?auto_817827 ?auto_817830 ) ) ( not ( = ?auto_817828 ?auto_817829 ) ) ( not ( = ?auto_817828 ?auto_817830 ) ) ( not ( = ?auto_817829 ?auto_817830 ) ) ( ON ?auto_817828 ?auto_817829 ) ( ON ?auto_817827 ?auto_817828 ) ( ON ?auto_817826 ?auto_817827 ) ( CLEAR ?auto_817824 ) ( ON ?auto_817825 ?auto_817826 ) ( CLEAR ?auto_817825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_817812 ?auto_817813 ?auto_817814 ?auto_817815 ?auto_817816 ?auto_817817 ?auto_817818 ?auto_817819 ?auto_817820 ?auto_817821 ?auto_817822 ?auto_817823 ?auto_817824 ?auto_817825 )
      ( MAKE-18PILE ?auto_817812 ?auto_817813 ?auto_817814 ?auto_817815 ?auto_817816 ?auto_817817 ?auto_817818 ?auto_817819 ?auto_817820 ?auto_817821 ?auto_817822 ?auto_817823 ?auto_817824 ?auto_817825 ?auto_817826 ?auto_817827 ?auto_817828 ?auto_817829 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817849 - BLOCK
      ?auto_817850 - BLOCK
      ?auto_817851 - BLOCK
      ?auto_817852 - BLOCK
      ?auto_817853 - BLOCK
      ?auto_817854 - BLOCK
      ?auto_817855 - BLOCK
      ?auto_817856 - BLOCK
      ?auto_817857 - BLOCK
      ?auto_817858 - BLOCK
      ?auto_817859 - BLOCK
      ?auto_817860 - BLOCK
      ?auto_817861 - BLOCK
      ?auto_817862 - BLOCK
      ?auto_817863 - BLOCK
      ?auto_817864 - BLOCK
      ?auto_817865 - BLOCK
      ?auto_817866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_817866 ) ( ON-TABLE ?auto_817849 ) ( ON ?auto_817850 ?auto_817849 ) ( ON ?auto_817851 ?auto_817850 ) ( ON ?auto_817852 ?auto_817851 ) ( ON ?auto_817853 ?auto_817852 ) ( ON ?auto_817854 ?auto_817853 ) ( ON ?auto_817855 ?auto_817854 ) ( ON ?auto_817856 ?auto_817855 ) ( ON ?auto_817857 ?auto_817856 ) ( ON ?auto_817858 ?auto_817857 ) ( ON ?auto_817859 ?auto_817858 ) ( ON ?auto_817860 ?auto_817859 ) ( ON ?auto_817861 ?auto_817860 ) ( not ( = ?auto_817849 ?auto_817850 ) ) ( not ( = ?auto_817849 ?auto_817851 ) ) ( not ( = ?auto_817849 ?auto_817852 ) ) ( not ( = ?auto_817849 ?auto_817853 ) ) ( not ( = ?auto_817849 ?auto_817854 ) ) ( not ( = ?auto_817849 ?auto_817855 ) ) ( not ( = ?auto_817849 ?auto_817856 ) ) ( not ( = ?auto_817849 ?auto_817857 ) ) ( not ( = ?auto_817849 ?auto_817858 ) ) ( not ( = ?auto_817849 ?auto_817859 ) ) ( not ( = ?auto_817849 ?auto_817860 ) ) ( not ( = ?auto_817849 ?auto_817861 ) ) ( not ( = ?auto_817849 ?auto_817862 ) ) ( not ( = ?auto_817849 ?auto_817863 ) ) ( not ( = ?auto_817849 ?auto_817864 ) ) ( not ( = ?auto_817849 ?auto_817865 ) ) ( not ( = ?auto_817849 ?auto_817866 ) ) ( not ( = ?auto_817850 ?auto_817851 ) ) ( not ( = ?auto_817850 ?auto_817852 ) ) ( not ( = ?auto_817850 ?auto_817853 ) ) ( not ( = ?auto_817850 ?auto_817854 ) ) ( not ( = ?auto_817850 ?auto_817855 ) ) ( not ( = ?auto_817850 ?auto_817856 ) ) ( not ( = ?auto_817850 ?auto_817857 ) ) ( not ( = ?auto_817850 ?auto_817858 ) ) ( not ( = ?auto_817850 ?auto_817859 ) ) ( not ( = ?auto_817850 ?auto_817860 ) ) ( not ( = ?auto_817850 ?auto_817861 ) ) ( not ( = ?auto_817850 ?auto_817862 ) ) ( not ( = ?auto_817850 ?auto_817863 ) ) ( not ( = ?auto_817850 ?auto_817864 ) ) ( not ( = ?auto_817850 ?auto_817865 ) ) ( not ( = ?auto_817850 ?auto_817866 ) ) ( not ( = ?auto_817851 ?auto_817852 ) ) ( not ( = ?auto_817851 ?auto_817853 ) ) ( not ( = ?auto_817851 ?auto_817854 ) ) ( not ( = ?auto_817851 ?auto_817855 ) ) ( not ( = ?auto_817851 ?auto_817856 ) ) ( not ( = ?auto_817851 ?auto_817857 ) ) ( not ( = ?auto_817851 ?auto_817858 ) ) ( not ( = ?auto_817851 ?auto_817859 ) ) ( not ( = ?auto_817851 ?auto_817860 ) ) ( not ( = ?auto_817851 ?auto_817861 ) ) ( not ( = ?auto_817851 ?auto_817862 ) ) ( not ( = ?auto_817851 ?auto_817863 ) ) ( not ( = ?auto_817851 ?auto_817864 ) ) ( not ( = ?auto_817851 ?auto_817865 ) ) ( not ( = ?auto_817851 ?auto_817866 ) ) ( not ( = ?auto_817852 ?auto_817853 ) ) ( not ( = ?auto_817852 ?auto_817854 ) ) ( not ( = ?auto_817852 ?auto_817855 ) ) ( not ( = ?auto_817852 ?auto_817856 ) ) ( not ( = ?auto_817852 ?auto_817857 ) ) ( not ( = ?auto_817852 ?auto_817858 ) ) ( not ( = ?auto_817852 ?auto_817859 ) ) ( not ( = ?auto_817852 ?auto_817860 ) ) ( not ( = ?auto_817852 ?auto_817861 ) ) ( not ( = ?auto_817852 ?auto_817862 ) ) ( not ( = ?auto_817852 ?auto_817863 ) ) ( not ( = ?auto_817852 ?auto_817864 ) ) ( not ( = ?auto_817852 ?auto_817865 ) ) ( not ( = ?auto_817852 ?auto_817866 ) ) ( not ( = ?auto_817853 ?auto_817854 ) ) ( not ( = ?auto_817853 ?auto_817855 ) ) ( not ( = ?auto_817853 ?auto_817856 ) ) ( not ( = ?auto_817853 ?auto_817857 ) ) ( not ( = ?auto_817853 ?auto_817858 ) ) ( not ( = ?auto_817853 ?auto_817859 ) ) ( not ( = ?auto_817853 ?auto_817860 ) ) ( not ( = ?auto_817853 ?auto_817861 ) ) ( not ( = ?auto_817853 ?auto_817862 ) ) ( not ( = ?auto_817853 ?auto_817863 ) ) ( not ( = ?auto_817853 ?auto_817864 ) ) ( not ( = ?auto_817853 ?auto_817865 ) ) ( not ( = ?auto_817853 ?auto_817866 ) ) ( not ( = ?auto_817854 ?auto_817855 ) ) ( not ( = ?auto_817854 ?auto_817856 ) ) ( not ( = ?auto_817854 ?auto_817857 ) ) ( not ( = ?auto_817854 ?auto_817858 ) ) ( not ( = ?auto_817854 ?auto_817859 ) ) ( not ( = ?auto_817854 ?auto_817860 ) ) ( not ( = ?auto_817854 ?auto_817861 ) ) ( not ( = ?auto_817854 ?auto_817862 ) ) ( not ( = ?auto_817854 ?auto_817863 ) ) ( not ( = ?auto_817854 ?auto_817864 ) ) ( not ( = ?auto_817854 ?auto_817865 ) ) ( not ( = ?auto_817854 ?auto_817866 ) ) ( not ( = ?auto_817855 ?auto_817856 ) ) ( not ( = ?auto_817855 ?auto_817857 ) ) ( not ( = ?auto_817855 ?auto_817858 ) ) ( not ( = ?auto_817855 ?auto_817859 ) ) ( not ( = ?auto_817855 ?auto_817860 ) ) ( not ( = ?auto_817855 ?auto_817861 ) ) ( not ( = ?auto_817855 ?auto_817862 ) ) ( not ( = ?auto_817855 ?auto_817863 ) ) ( not ( = ?auto_817855 ?auto_817864 ) ) ( not ( = ?auto_817855 ?auto_817865 ) ) ( not ( = ?auto_817855 ?auto_817866 ) ) ( not ( = ?auto_817856 ?auto_817857 ) ) ( not ( = ?auto_817856 ?auto_817858 ) ) ( not ( = ?auto_817856 ?auto_817859 ) ) ( not ( = ?auto_817856 ?auto_817860 ) ) ( not ( = ?auto_817856 ?auto_817861 ) ) ( not ( = ?auto_817856 ?auto_817862 ) ) ( not ( = ?auto_817856 ?auto_817863 ) ) ( not ( = ?auto_817856 ?auto_817864 ) ) ( not ( = ?auto_817856 ?auto_817865 ) ) ( not ( = ?auto_817856 ?auto_817866 ) ) ( not ( = ?auto_817857 ?auto_817858 ) ) ( not ( = ?auto_817857 ?auto_817859 ) ) ( not ( = ?auto_817857 ?auto_817860 ) ) ( not ( = ?auto_817857 ?auto_817861 ) ) ( not ( = ?auto_817857 ?auto_817862 ) ) ( not ( = ?auto_817857 ?auto_817863 ) ) ( not ( = ?auto_817857 ?auto_817864 ) ) ( not ( = ?auto_817857 ?auto_817865 ) ) ( not ( = ?auto_817857 ?auto_817866 ) ) ( not ( = ?auto_817858 ?auto_817859 ) ) ( not ( = ?auto_817858 ?auto_817860 ) ) ( not ( = ?auto_817858 ?auto_817861 ) ) ( not ( = ?auto_817858 ?auto_817862 ) ) ( not ( = ?auto_817858 ?auto_817863 ) ) ( not ( = ?auto_817858 ?auto_817864 ) ) ( not ( = ?auto_817858 ?auto_817865 ) ) ( not ( = ?auto_817858 ?auto_817866 ) ) ( not ( = ?auto_817859 ?auto_817860 ) ) ( not ( = ?auto_817859 ?auto_817861 ) ) ( not ( = ?auto_817859 ?auto_817862 ) ) ( not ( = ?auto_817859 ?auto_817863 ) ) ( not ( = ?auto_817859 ?auto_817864 ) ) ( not ( = ?auto_817859 ?auto_817865 ) ) ( not ( = ?auto_817859 ?auto_817866 ) ) ( not ( = ?auto_817860 ?auto_817861 ) ) ( not ( = ?auto_817860 ?auto_817862 ) ) ( not ( = ?auto_817860 ?auto_817863 ) ) ( not ( = ?auto_817860 ?auto_817864 ) ) ( not ( = ?auto_817860 ?auto_817865 ) ) ( not ( = ?auto_817860 ?auto_817866 ) ) ( not ( = ?auto_817861 ?auto_817862 ) ) ( not ( = ?auto_817861 ?auto_817863 ) ) ( not ( = ?auto_817861 ?auto_817864 ) ) ( not ( = ?auto_817861 ?auto_817865 ) ) ( not ( = ?auto_817861 ?auto_817866 ) ) ( not ( = ?auto_817862 ?auto_817863 ) ) ( not ( = ?auto_817862 ?auto_817864 ) ) ( not ( = ?auto_817862 ?auto_817865 ) ) ( not ( = ?auto_817862 ?auto_817866 ) ) ( not ( = ?auto_817863 ?auto_817864 ) ) ( not ( = ?auto_817863 ?auto_817865 ) ) ( not ( = ?auto_817863 ?auto_817866 ) ) ( not ( = ?auto_817864 ?auto_817865 ) ) ( not ( = ?auto_817864 ?auto_817866 ) ) ( not ( = ?auto_817865 ?auto_817866 ) ) ( ON ?auto_817865 ?auto_817866 ) ( ON ?auto_817864 ?auto_817865 ) ( ON ?auto_817863 ?auto_817864 ) ( CLEAR ?auto_817861 ) ( ON ?auto_817862 ?auto_817863 ) ( CLEAR ?auto_817862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_817849 ?auto_817850 ?auto_817851 ?auto_817852 ?auto_817853 ?auto_817854 ?auto_817855 ?auto_817856 ?auto_817857 ?auto_817858 ?auto_817859 ?auto_817860 ?auto_817861 ?auto_817862 )
      ( MAKE-18PILE ?auto_817849 ?auto_817850 ?auto_817851 ?auto_817852 ?auto_817853 ?auto_817854 ?auto_817855 ?auto_817856 ?auto_817857 ?auto_817858 ?auto_817859 ?auto_817860 ?auto_817861 ?auto_817862 ?auto_817863 ?auto_817864 ?auto_817865 ?auto_817866 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817885 - BLOCK
      ?auto_817886 - BLOCK
      ?auto_817887 - BLOCK
      ?auto_817888 - BLOCK
      ?auto_817889 - BLOCK
      ?auto_817890 - BLOCK
      ?auto_817891 - BLOCK
      ?auto_817892 - BLOCK
      ?auto_817893 - BLOCK
      ?auto_817894 - BLOCK
      ?auto_817895 - BLOCK
      ?auto_817896 - BLOCK
      ?auto_817897 - BLOCK
      ?auto_817898 - BLOCK
      ?auto_817899 - BLOCK
      ?auto_817900 - BLOCK
      ?auto_817901 - BLOCK
      ?auto_817902 - BLOCK
    )
    :vars
    (
      ?auto_817903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817902 ?auto_817903 ) ( ON-TABLE ?auto_817885 ) ( ON ?auto_817886 ?auto_817885 ) ( ON ?auto_817887 ?auto_817886 ) ( ON ?auto_817888 ?auto_817887 ) ( ON ?auto_817889 ?auto_817888 ) ( ON ?auto_817890 ?auto_817889 ) ( ON ?auto_817891 ?auto_817890 ) ( ON ?auto_817892 ?auto_817891 ) ( ON ?auto_817893 ?auto_817892 ) ( ON ?auto_817894 ?auto_817893 ) ( ON ?auto_817895 ?auto_817894 ) ( ON ?auto_817896 ?auto_817895 ) ( not ( = ?auto_817885 ?auto_817886 ) ) ( not ( = ?auto_817885 ?auto_817887 ) ) ( not ( = ?auto_817885 ?auto_817888 ) ) ( not ( = ?auto_817885 ?auto_817889 ) ) ( not ( = ?auto_817885 ?auto_817890 ) ) ( not ( = ?auto_817885 ?auto_817891 ) ) ( not ( = ?auto_817885 ?auto_817892 ) ) ( not ( = ?auto_817885 ?auto_817893 ) ) ( not ( = ?auto_817885 ?auto_817894 ) ) ( not ( = ?auto_817885 ?auto_817895 ) ) ( not ( = ?auto_817885 ?auto_817896 ) ) ( not ( = ?auto_817885 ?auto_817897 ) ) ( not ( = ?auto_817885 ?auto_817898 ) ) ( not ( = ?auto_817885 ?auto_817899 ) ) ( not ( = ?auto_817885 ?auto_817900 ) ) ( not ( = ?auto_817885 ?auto_817901 ) ) ( not ( = ?auto_817885 ?auto_817902 ) ) ( not ( = ?auto_817885 ?auto_817903 ) ) ( not ( = ?auto_817886 ?auto_817887 ) ) ( not ( = ?auto_817886 ?auto_817888 ) ) ( not ( = ?auto_817886 ?auto_817889 ) ) ( not ( = ?auto_817886 ?auto_817890 ) ) ( not ( = ?auto_817886 ?auto_817891 ) ) ( not ( = ?auto_817886 ?auto_817892 ) ) ( not ( = ?auto_817886 ?auto_817893 ) ) ( not ( = ?auto_817886 ?auto_817894 ) ) ( not ( = ?auto_817886 ?auto_817895 ) ) ( not ( = ?auto_817886 ?auto_817896 ) ) ( not ( = ?auto_817886 ?auto_817897 ) ) ( not ( = ?auto_817886 ?auto_817898 ) ) ( not ( = ?auto_817886 ?auto_817899 ) ) ( not ( = ?auto_817886 ?auto_817900 ) ) ( not ( = ?auto_817886 ?auto_817901 ) ) ( not ( = ?auto_817886 ?auto_817902 ) ) ( not ( = ?auto_817886 ?auto_817903 ) ) ( not ( = ?auto_817887 ?auto_817888 ) ) ( not ( = ?auto_817887 ?auto_817889 ) ) ( not ( = ?auto_817887 ?auto_817890 ) ) ( not ( = ?auto_817887 ?auto_817891 ) ) ( not ( = ?auto_817887 ?auto_817892 ) ) ( not ( = ?auto_817887 ?auto_817893 ) ) ( not ( = ?auto_817887 ?auto_817894 ) ) ( not ( = ?auto_817887 ?auto_817895 ) ) ( not ( = ?auto_817887 ?auto_817896 ) ) ( not ( = ?auto_817887 ?auto_817897 ) ) ( not ( = ?auto_817887 ?auto_817898 ) ) ( not ( = ?auto_817887 ?auto_817899 ) ) ( not ( = ?auto_817887 ?auto_817900 ) ) ( not ( = ?auto_817887 ?auto_817901 ) ) ( not ( = ?auto_817887 ?auto_817902 ) ) ( not ( = ?auto_817887 ?auto_817903 ) ) ( not ( = ?auto_817888 ?auto_817889 ) ) ( not ( = ?auto_817888 ?auto_817890 ) ) ( not ( = ?auto_817888 ?auto_817891 ) ) ( not ( = ?auto_817888 ?auto_817892 ) ) ( not ( = ?auto_817888 ?auto_817893 ) ) ( not ( = ?auto_817888 ?auto_817894 ) ) ( not ( = ?auto_817888 ?auto_817895 ) ) ( not ( = ?auto_817888 ?auto_817896 ) ) ( not ( = ?auto_817888 ?auto_817897 ) ) ( not ( = ?auto_817888 ?auto_817898 ) ) ( not ( = ?auto_817888 ?auto_817899 ) ) ( not ( = ?auto_817888 ?auto_817900 ) ) ( not ( = ?auto_817888 ?auto_817901 ) ) ( not ( = ?auto_817888 ?auto_817902 ) ) ( not ( = ?auto_817888 ?auto_817903 ) ) ( not ( = ?auto_817889 ?auto_817890 ) ) ( not ( = ?auto_817889 ?auto_817891 ) ) ( not ( = ?auto_817889 ?auto_817892 ) ) ( not ( = ?auto_817889 ?auto_817893 ) ) ( not ( = ?auto_817889 ?auto_817894 ) ) ( not ( = ?auto_817889 ?auto_817895 ) ) ( not ( = ?auto_817889 ?auto_817896 ) ) ( not ( = ?auto_817889 ?auto_817897 ) ) ( not ( = ?auto_817889 ?auto_817898 ) ) ( not ( = ?auto_817889 ?auto_817899 ) ) ( not ( = ?auto_817889 ?auto_817900 ) ) ( not ( = ?auto_817889 ?auto_817901 ) ) ( not ( = ?auto_817889 ?auto_817902 ) ) ( not ( = ?auto_817889 ?auto_817903 ) ) ( not ( = ?auto_817890 ?auto_817891 ) ) ( not ( = ?auto_817890 ?auto_817892 ) ) ( not ( = ?auto_817890 ?auto_817893 ) ) ( not ( = ?auto_817890 ?auto_817894 ) ) ( not ( = ?auto_817890 ?auto_817895 ) ) ( not ( = ?auto_817890 ?auto_817896 ) ) ( not ( = ?auto_817890 ?auto_817897 ) ) ( not ( = ?auto_817890 ?auto_817898 ) ) ( not ( = ?auto_817890 ?auto_817899 ) ) ( not ( = ?auto_817890 ?auto_817900 ) ) ( not ( = ?auto_817890 ?auto_817901 ) ) ( not ( = ?auto_817890 ?auto_817902 ) ) ( not ( = ?auto_817890 ?auto_817903 ) ) ( not ( = ?auto_817891 ?auto_817892 ) ) ( not ( = ?auto_817891 ?auto_817893 ) ) ( not ( = ?auto_817891 ?auto_817894 ) ) ( not ( = ?auto_817891 ?auto_817895 ) ) ( not ( = ?auto_817891 ?auto_817896 ) ) ( not ( = ?auto_817891 ?auto_817897 ) ) ( not ( = ?auto_817891 ?auto_817898 ) ) ( not ( = ?auto_817891 ?auto_817899 ) ) ( not ( = ?auto_817891 ?auto_817900 ) ) ( not ( = ?auto_817891 ?auto_817901 ) ) ( not ( = ?auto_817891 ?auto_817902 ) ) ( not ( = ?auto_817891 ?auto_817903 ) ) ( not ( = ?auto_817892 ?auto_817893 ) ) ( not ( = ?auto_817892 ?auto_817894 ) ) ( not ( = ?auto_817892 ?auto_817895 ) ) ( not ( = ?auto_817892 ?auto_817896 ) ) ( not ( = ?auto_817892 ?auto_817897 ) ) ( not ( = ?auto_817892 ?auto_817898 ) ) ( not ( = ?auto_817892 ?auto_817899 ) ) ( not ( = ?auto_817892 ?auto_817900 ) ) ( not ( = ?auto_817892 ?auto_817901 ) ) ( not ( = ?auto_817892 ?auto_817902 ) ) ( not ( = ?auto_817892 ?auto_817903 ) ) ( not ( = ?auto_817893 ?auto_817894 ) ) ( not ( = ?auto_817893 ?auto_817895 ) ) ( not ( = ?auto_817893 ?auto_817896 ) ) ( not ( = ?auto_817893 ?auto_817897 ) ) ( not ( = ?auto_817893 ?auto_817898 ) ) ( not ( = ?auto_817893 ?auto_817899 ) ) ( not ( = ?auto_817893 ?auto_817900 ) ) ( not ( = ?auto_817893 ?auto_817901 ) ) ( not ( = ?auto_817893 ?auto_817902 ) ) ( not ( = ?auto_817893 ?auto_817903 ) ) ( not ( = ?auto_817894 ?auto_817895 ) ) ( not ( = ?auto_817894 ?auto_817896 ) ) ( not ( = ?auto_817894 ?auto_817897 ) ) ( not ( = ?auto_817894 ?auto_817898 ) ) ( not ( = ?auto_817894 ?auto_817899 ) ) ( not ( = ?auto_817894 ?auto_817900 ) ) ( not ( = ?auto_817894 ?auto_817901 ) ) ( not ( = ?auto_817894 ?auto_817902 ) ) ( not ( = ?auto_817894 ?auto_817903 ) ) ( not ( = ?auto_817895 ?auto_817896 ) ) ( not ( = ?auto_817895 ?auto_817897 ) ) ( not ( = ?auto_817895 ?auto_817898 ) ) ( not ( = ?auto_817895 ?auto_817899 ) ) ( not ( = ?auto_817895 ?auto_817900 ) ) ( not ( = ?auto_817895 ?auto_817901 ) ) ( not ( = ?auto_817895 ?auto_817902 ) ) ( not ( = ?auto_817895 ?auto_817903 ) ) ( not ( = ?auto_817896 ?auto_817897 ) ) ( not ( = ?auto_817896 ?auto_817898 ) ) ( not ( = ?auto_817896 ?auto_817899 ) ) ( not ( = ?auto_817896 ?auto_817900 ) ) ( not ( = ?auto_817896 ?auto_817901 ) ) ( not ( = ?auto_817896 ?auto_817902 ) ) ( not ( = ?auto_817896 ?auto_817903 ) ) ( not ( = ?auto_817897 ?auto_817898 ) ) ( not ( = ?auto_817897 ?auto_817899 ) ) ( not ( = ?auto_817897 ?auto_817900 ) ) ( not ( = ?auto_817897 ?auto_817901 ) ) ( not ( = ?auto_817897 ?auto_817902 ) ) ( not ( = ?auto_817897 ?auto_817903 ) ) ( not ( = ?auto_817898 ?auto_817899 ) ) ( not ( = ?auto_817898 ?auto_817900 ) ) ( not ( = ?auto_817898 ?auto_817901 ) ) ( not ( = ?auto_817898 ?auto_817902 ) ) ( not ( = ?auto_817898 ?auto_817903 ) ) ( not ( = ?auto_817899 ?auto_817900 ) ) ( not ( = ?auto_817899 ?auto_817901 ) ) ( not ( = ?auto_817899 ?auto_817902 ) ) ( not ( = ?auto_817899 ?auto_817903 ) ) ( not ( = ?auto_817900 ?auto_817901 ) ) ( not ( = ?auto_817900 ?auto_817902 ) ) ( not ( = ?auto_817900 ?auto_817903 ) ) ( not ( = ?auto_817901 ?auto_817902 ) ) ( not ( = ?auto_817901 ?auto_817903 ) ) ( not ( = ?auto_817902 ?auto_817903 ) ) ( ON ?auto_817901 ?auto_817902 ) ( ON ?auto_817900 ?auto_817901 ) ( ON ?auto_817899 ?auto_817900 ) ( ON ?auto_817898 ?auto_817899 ) ( CLEAR ?auto_817896 ) ( ON ?auto_817897 ?auto_817898 ) ( CLEAR ?auto_817897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_817885 ?auto_817886 ?auto_817887 ?auto_817888 ?auto_817889 ?auto_817890 ?auto_817891 ?auto_817892 ?auto_817893 ?auto_817894 ?auto_817895 ?auto_817896 ?auto_817897 )
      ( MAKE-18PILE ?auto_817885 ?auto_817886 ?auto_817887 ?auto_817888 ?auto_817889 ?auto_817890 ?auto_817891 ?auto_817892 ?auto_817893 ?auto_817894 ?auto_817895 ?auto_817896 ?auto_817897 ?auto_817898 ?auto_817899 ?auto_817900 ?auto_817901 ?auto_817902 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817922 - BLOCK
      ?auto_817923 - BLOCK
      ?auto_817924 - BLOCK
      ?auto_817925 - BLOCK
      ?auto_817926 - BLOCK
      ?auto_817927 - BLOCK
      ?auto_817928 - BLOCK
      ?auto_817929 - BLOCK
      ?auto_817930 - BLOCK
      ?auto_817931 - BLOCK
      ?auto_817932 - BLOCK
      ?auto_817933 - BLOCK
      ?auto_817934 - BLOCK
      ?auto_817935 - BLOCK
      ?auto_817936 - BLOCK
      ?auto_817937 - BLOCK
      ?auto_817938 - BLOCK
      ?auto_817939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_817939 ) ( ON-TABLE ?auto_817922 ) ( ON ?auto_817923 ?auto_817922 ) ( ON ?auto_817924 ?auto_817923 ) ( ON ?auto_817925 ?auto_817924 ) ( ON ?auto_817926 ?auto_817925 ) ( ON ?auto_817927 ?auto_817926 ) ( ON ?auto_817928 ?auto_817927 ) ( ON ?auto_817929 ?auto_817928 ) ( ON ?auto_817930 ?auto_817929 ) ( ON ?auto_817931 ?auto_817930 ) ( ON ?auto_817932 ?auto_817931 ) ( ON ?auto_817933 ?auto_817932 ) ( not ( = ?auto_817922 ?auto_817923 ) ) ( not ( = ?auto_817922 ?auto_817924 ) ) ( not ( = ?auto_817922 ?auto_817925 ) ) ( not ( = ?auto_817922 ?auto_817926 ) ) ( not ( = ?auto_817922 ?auto_817927 ) ) ( not ( = ?auto_817922 ?auto_817928 ) ) ( not ( = ?auto_817922 ?auto_817929 ) ) ( not ( = ?auto_817922 ?auto_817930 ) ) ( not ( = ?auto_817922 ?auto_817931 ) ) ( not ( = ?auto_817922 ?auto_817932 ) ) ( not ( = ?auto_817922 ?auto_817933 ) ) ( not ( = ?auto_817922 ?auto_817934 ) ) ( not ( = ?auto_817922 ?auto_817935 ) ) ( not ( = ?auto_817922 ?auto_817936 ) ) ( not ( = ?auto_817922 ?auto_817937 ) ) ( not ( = ?auto_817922 ?auto_817938 ) ) ( not ( = ?auto_817922 ?auto_817939 ) ) ( not ( = ?auto_817923 ?auto_817924 ) ) ( not ( = ?auto_817923 ?auto_817925 ) ) ( not ( = ?auto_817923 ?auto_817926 ) ) ( not ( = ?auto_817923 ?auto_817927 ) ) ( not ( = ?auto_817923 ?auto_817928 ) ) ( not ( = ?auto_817923 ?auto_817929 ) ) ( not ( = ?auto_817923 ?auto_817930 ) ) ( not ( = ?auto_817923 ?auto_817931 ) ) ( not ( = ?auto_817923 ?auto_817932 ) ) ( not ( = ?auto_817923 ?auto_817933 ) ) ( not ( = ?auto_817923 ?auto_817934 ) ) ( not ( = ?auto_817923 ?auto_817935 ) ) ( not ( = ?auto_817923 ?auto_817936 ) ) ( not ( = ?auto_817923 ?auto_817937 ) ) ( not ( = ?auto_817923 ?auto_817938 ) ) ( not ( = ?auto_817923 ?auto_817939 ) ) ( not ( = ?auto_817924 ?auto_817925 ) ) ( not ( = ?auto_817924 ?auto_817926 ) ) ( not ( = ?auto_817924 ?auto_817927 ) ) ( not ( = ?auto_817924 ?auto_817928 ) ) ( not ( = ?auto_817924 ?auto_817929 ) ) ( not ( = ?auto_817924 ?auto_817930 ) ) ( not ( = ?auto_817924 ?auto_817931 ) ) ( not ( = ?auto_817924 ?auto_817932 ) ) ( not ( = ?auto_817924 ?auto_817933 ) ) ( not ( = ?auto_817924 ?auto_817934 ) ) ( not ( = ?auto_817924 ?auto_817935 ) ) ( not ( = ?auto_817924 ?auto_817936 ) ) ( not ( = ?auto_817924 ?auto_817937 ) ) ( not ( = ?auto_817924 ?auto_817938 ) ) ( not ( = ?auto_817924 ?auto_817939 ) ) ( not ( = ?auto_817925 ?auto_817926 ) ) ( not ( = ?auto_817925 ?auto_817927 ) ) ( not ( = ?auto_817925 ?auto_817928 ) ) ( not ( = ?auto_817925 ?auto_817929 ) ) ( not ( = ?auto_817925 ?auto_817930 ) ) ( not ( = ?auto_817925 ?auto_817931 ) ) ( not ( = ?auto_817925 ?auto_817932 ) ) ( not ( = ?auto_817925 ?auto_817933 ) ) ( not ( = ?auto_817925 ?auto_817934 ) ) ( not ( = ?auto_817925 ?auto_817935 ) ) ( not ( = ?auto_817925 ?auto_817936 ) ) ( not ( = ?auto_817925 ?auto_817937 ) ) ( not ( = ?auto_817925 ?auto_817938 ) ) ( not ( = ?auto_817925 ?auto_817939 ) ) ( not ( = ?auto_817926 ?auto_817927 ) ) ( not ( = ?auto_817926 ?auto_817928 ) ) ( not ( = ?auto_817926 ?auto_817929 ) ) ( not ( = ?auto_817926 ?auto_817930 ) ) ( not ( = ?auto_817926 ?auto_817931 ) ) ( not ( = ?auto_817926 ?auto_817932 ) ) ( not ( = ?auto_817926 ?auto_817933 ) ) ( not ( = ?auto_817926 ?auto_817934 ) ) ( not ( = ?auto_817926 ?auto_817935 ) ) ( not ( = ?auto_817926 ?auto_817936 ) ) ( not ( = ?auto_817926 ?auto_817937 ) ) ( not ( = ?auto_817926 ?auto_817938 ) ) ( not ( = ?auto_817926 ?auto_817939 ) ) ( not ( = ?auto_817927 ?auto_817928 ) ) ( not ( = ?auto_817927 ?auto_817929 ) ) ( not ( = ?auto_817927 ?auto_817930 ) ) ( not ( = ?auto_817927 ?auto_817931 ) ) ( not ( = ?auto_817927 ?auto_817932 ) ) ( not ( = ?auto_817927 ?auto_817933 ) ) ( not ( = ?auto_817927 ?auto_817934 ) ) ( not ( = ?auto_817927 ?auto_817935 ) ) ( not ( = ?auto_817927 ?auto_817936 ) ) ( not ( = ?auto_817927 ?auto_817937 ) ) ( not ( = ?auto_817927 ?auto_817938 ) ) ( not ( = ?auto_817927 ?auto_817939 ) ) ( not ( = ?auto_817928 ?auto_817929 ) ) ( not ( = ?auto_817928 ?auto_817930 ) ) ( not ( = ?auto_817928 ?auto_817931 ) ) ( not ( = ?auto_817928 ?auto_817932 ) ) ( not ( = ?auto_817928 ?auto_817933 ) ) ( not ( = ?auto_817928 ?auto_817934 ) ) ( not ( = ?auto_817928 ?auto_817935 ) ) ( not ( = ?auto_817928 ?auto_817936 ) ) ( not ( = ?auto_817928 ?auto_817937 ) ) ( not ( = ?auto_817928 ?auto_817938 ) ) ( not ( = ?auto_817928 ?auto_817939 ) ) ( not ( = ?auto_817929 ?auto_817930 ) ) ( not ( = ?auto_817929 ?auto_817931 ) ) ( not ( = ?auto_817929 ?auto_817932 ) ) ( not ( = ?auto_817929 ?auto_817933 ) ) ( not ( = ?auto_817929 ?auto_817934 ) ) ( not ( = ?auto_817929 ?auto_817935 ) ) ( not ( = ?auto_817929 ?auto_817936 ) ) ( not ( = ?auto_817929 ?auto_817937 ) ) ( not ( = ?auto_817929 ?auto_817938 ) ) ( not ( = ?auto_817929 ?auto_817939 ) ) ( not ( = ?auto_817930 ?auto_817931 ) ) ( not ( = ?auto_817930 ?auto_817932 ) ) ( not ( = ?auto_817930 ?auto_817933 ) ) ( not ( = ?auto_817930 ?auto_817934 ) ) ( not ( = ?auto_817930 ?auto_817935 ) ) ( not ( = ?auto_817930 ?auto_817936 ) ) ( not ( = ?auto_817930 ?auto_817937 ) ) ( not ( = ?auto_817930 ?auto_817938 ) ) ( not ( = ?auto_817930 ?auto_817939 ) ) ( not ( = ?auto_817931 ?auto_817932 ) ) ( not ( = ?auto_817931 ?auto_817933 ) ) ( not ( = ?auto_817931 ?auto_817934 ) ) ( not ( = ?auto_817931 ?auto_817935 ) ) ( not ( = ?auto_817931 ?auto_817936 ) ) ( not ( = ?auto_817931 ?auto_817937 ) ) ( not ( = ?auto_817931 ?auto_817938 ) ) ( not ( = ?auto_817931 ?auto_817939 ) ) ( not ( = ?auto_817932 ?auto_817933 ) ) ( not ( = ?auto_817932 ?auto_817934 ) ) ( not ( = ?auto_817932 ?auto_817935 ) ) ( not ( = ?auto_817932 ?auto_817936 ) ) ( not ( = ?auto_817932 ?auto_817937 ) ) ( not ( = ?auto_817932 ?auto_817938 ) ) ( not ( = ?auto_817932 ?auto_817939 ) ) ( not ( = ?auto_817933 ?auto_817934 ) ) ( not ( = ?auto_817933 ?auto_817935 ) ) ( not ( = ?auto_817933 ?auto_817936 ) ) ( not ( = ?auto_817933 ?auto_817937 ) ) ( not ( = ?auto_817933 ?auto_817938 ) ) ( not ( = ?auto_817933 ?auto_817939 ) ) ( not ( = ?auto_817934 ?auto_817935 ) ) ( not ( = ?auto_817934 ?auto_817936 ) ) ( not ( = ?auto_817934 ?auto_817937 ) ) ( not ( = ?auto_817934 ?auto_817938 ) ) ( not ( = ?auto_817934 ?auto_817939 ) ) ( not ( = ?auto_817935 ?auto_817936 ) ) ( not ( = ?auto_817935 ?auto_817937 ) ) ( not ( = ?auto_817935 ?auto_817938 ) ) ( not ( = ?auto_817935 ?auto_817939 ) ) ( not ( = ?auto_817936 ?auto_817937 ) ) ( not ( = ?auto_817936 ?auto_817938 ) ) ( not ( = ?auto_817936 ?auto_817939 ) ) ( not ( = ?auto_817937 ?auto_817938 ) ) ( not ( = ?auto_817937 ?auto_817939 ) ) ( not ( = ?auto_817938 ?auto_817939 ) ) ( ON ?auto_817938 ?auto_817939 ) ( ON ?auto_817937 ?auto_817938 ) ( ON ?auto_817936 ?auto_817937 ) ( ON ?auto_817935 ?auto_817936 ) ( CLEAR ?auto_817933 ) ( ON ?auto_817934 ?auto_817935 ) ( CLEAR ?auto_817934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_817922 ?auto_817923 ?auto_817924 ?auto_817925 ?auto_817926 ?auto_817927 ?auto_817928 ?auto_817929 ?auto_817930 ?auto_817931 ?auto_817932 ?auto_817933 ?auto_817934 )
      ( MAKE-18PILE ?auto_817922 ?auto_817923 ?auto_817924 ?auto_817925 ?auto_817926 ?auto_817927 ?auto_817928 ?auto_817929 ?auto_817930 ?auto_817931 ?auto_817932 ?auto_817933 ?auto_817934 ?auto_817935 ?auto_817936 ?auto_817937 ?auto_817938 ?auto_817939 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817958 - BLOCK
      ?auto_817959 - BLOCK
      ?auto_817960 - BLOCK
      ?auto_817961 - BLOCK
      ?auto_817962 - BLOCK
      ?auto_817963 - BLOCK
      ?auto_817964 - BLOCK
      ?auto_817965 - BLOCK
      ?auto_817966 - BLOCK
      ?auto_817967 - BLOCK
      ?auto_817968 - BLOCK
      ?auto_817969 - BLOCK
      ?auto_817970 - BLOCK
      ?auto_817971 - BLOCK
      ?auto_817972 - BLOCK
      ?auto_817973 - BLOCK
      ?auto_817974 - BLOCK
      ?auto_817975 - BLOCK
    )
    :vars
    (
      ?auto_817976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817975 ?auto_817976 ) ( ON-TABLE ?auto_817958 ) ( ON ?auto_817959 ?auto_817958 ) ( ON ?auto_817960 ?auto_817959 ) ( ON ?auto_817961 ?auto_817960 ) ( ON ?auto_817962 ?auto_817961 ) ( ON ?auto_817963 ?auto_817962 ) ( ON ?auto_817964 ?auto_817963 ) ( ON ?auto_817965 ?auto_817964 ) ( ON ?auto_817966 ?auto_817965 ) ( ON ?auto_817967 ?auto_817966 ) ( ON ?auto_817968 ?auto_817967 ) ( not ( = ?auto_817958 ?auto_817959 ) ) ( not ( = ?auto_817958 ?auto_817960 ) ) ( not ( = ?auto_817958 ?auto_817961 ) ) ( not ( = ?auto_817958 ?auto_817962 ) ) ( not ( = ?auto_817958 ?auto_817963 ) ) ( not ( = ?auto_817958 ?auto_817964 ) ) ( not ( = ?auto_817958 ?auto_817965 ) ) ( not ( = ?auto_817958 ?auto_817966 ) ) ( not ( = ?auto_817958 ?auto_817967 ) ) ( not ( = ?auto_817958 ?auto_817968 ) ) ( not ( = ?auto_817958 ?auto_817969 ) ) ( not ( = ?auto_817958 ?auto_817970 ) ) ( not ( = ?auto_817958 ?auto_817971 ) ) ( not ( = ?auto_817958 ?auto_817972 ) ) ( not ( = ?auto_817958 ?auto_817973 ) ) ( not ( = ?auto_817958 ?auto_817974 ) ) ( not ( = ?auto_817958 ?auto_817975 ) ) ( not ( = ?auto_817958 ?auto_817976 ) ) ( not ( = ?auto_817959 ?auto_817960 ) ) ( not ( = ?auto_817959 ?auto_817961 ) ) ( not ( = ?auto_817959 ?auto_817962 ) ) ( not ( = ?auto_817959 ?auto_817963 ) ) ( not ( = ?auto_817959 ?auto_817964 ) ) ( not ( = ?auto_817959 ?auto_817965 ) ) ( not ( = ?auto_817959 ?auto_817966 ) ) ( not ( = ?auto_817959 ?auto_817967 ) ) ( not ( = ?auto_817959 ?auto_817968 ) ) ( not ( = ?auto_817959 ?auto_817969 ) ) ( not ( = ?auto_817959 ?auto_817970 ) ) ( not ( = ?auto_817959 ?auto_817971 ) ) ( not ( = ?auto_817959 ?auto_817972 ) ) ( not ( = ?auto_817959 ?auto_817973 ) ) ( not ( = ?auto_817959 ?auto_817974 ) ) ( not ( = ?auto_817959 ?auto_817975 ) ) ( not ( = ?auto_817959 ?auto_817976 ) ) ( not ( = ?auto_817960 ?auto_817961 ) ) ( not ( = ?auto_817960 ?auto_817962 ) ) ( not ( = ?auto_817960 ?auto_817963 ) ) ( not ( = ?auto_817960 ?auto_817964 ) ) ( not ( = ?auto_817960 ?auto_817965 ) ) ( not ( = ?auto_817960 ?auto_817966 ) ) ( not ( = ?auto_817960 ?auto_817967 ) ) ( not ( = ?auto_817960 ?auto_817968 ) ) ( not ( = ?auto_817960 ?auto_817969 ) ) ( not ( = ?auto_817960 ?auto_817970 ) ) ( not ( = ?auto_817960 ?auto_817971 ) ) ( not ( = ?auto_817960 ?auto_817972 ) ) ( not ( = ?auto_817960 ?auto_817973 ) ) ( not ( = ?auto_817960 ?auto_817974 ) ) ( not ( = ?auto_817960 ?auto_817975 ) ) ( not ( = ?auto_817960 ?auto_817976 ) ) ( not ( = ?auto_817961 ?auto_817962 ) ) ( not ( = ?auto_817961 ?auto_817963 ) ) ( not ( = ?auto_817961 ?auto_817964 ) ) ( not ( = ?auto_817961 ?auto_817965 ) ) ( not ( = ?auto_817961 ?auto_817966 ) ) ( not ( = ?auto_817961 ?auto_817967 ) ) ( not ( = ?auto_817961 ?auto_817968 ) ) ( not ( = ?auto_817961 ?auto_817969 ) ) ( not ( = ?auto_817961 ?auto_817970 ) ) ( not ( = ?auto_817961 ?auto_817971 ) ) ( not ( = ?auto_817961 ?auto_817972 ) ) ( not ( = ?auto_817961 ?auto_817973 ) ) ( not ( = ?auto_817961 ?auto_817974 ) ) ( not ( = ?auto_817961 ?auto_817975 ) ) ( not ( = ?auto_817961 ?auto_817976 ) ) ( not ( = ?auto_817962 ?auto_817963 ) ) ( not ( = ?auto_817962 ?auto_817964 ) ) ( not ( = ?auto_817962 ?auto_817965 ) ) ( not ( = ?auto_817962 ?auto_817966 ) ) ( not ( = ?auto_817962 ?auto_817967 ) ) ( not ( = ?auto_817962 ?auto_817968 ) ) ( not ( = ?auto_817962 ?auto_817969 ) ) ( not ( = ?auto_817962 ?auto_817970 ) ) ( not ( = ?auto_817962 ?auto_817971 ) ) ( not ( = ?auto_817962 ?auto_817972 ) ) ( not ( = ?auto_817962 ?auto_817973 ) ) ( not ( = ?auto_817962 ?auto_817974 ) ) ( not ( = ?auto_817962 ?auto_817975 ) ) ( not ( = ?auto_817962 ?auto_817976 ) ) ( not ( = ?auto_817963 ?auto_817964 ) ) ( not ( = ?auto_817963 ?auto_817965 ) ) ( not ( = ?auto_817963 ?auto_817966 ) ) ( not ( = ?auto_817963 ?auto_817967 ) ) ( not ( = ?auto_817963 ?auto_817968 ) ) ( not ( = ?auto_817963 ?auto_817969 ) ) ( not ( = ?auto_817963 ?auto_817970 ) ) ( not ( = ?auto_817963 ?auto_817971 ) ) ( not ( = ?auto_817963 ?auto_817972 ) ) ( not ( = ?auto_817963 ?auto_817973 ) ) ( not ( = ?auto_817963 ?auto_817974 ) ) ( not ( = ?auto_817963 ?auto_817975 ) ) ( not ( = ?auto_817963 ?auto_817976 ) ) ( not ( = ?auto_817964 ?auto_817965 ) ) ( not ( = ?auto_817964 ?auto_817966 ) ) ( not ( = ?auto_817964 ?auto_817967 ) ) ( not ( = ?auto_817964 ?auto_817968 ) ) ( not ( = ?auto_817964 ?auto_817969 ) ) ( not ( = ?auto_817964 ?auto_817970 ) ) ( not ( = ?auto_817964 ?auto_817971 ) ) ( not ( = ?auto_817964 ?auto_817972 ) ) ( not ( = ?auto_817964 ?auto_817973 ) ) ( not ( = ?auto_817964 ?auto_817974 ) ) ( not ( = ?auto_817964 ?auto_817975 ) ) ( not ( = ?auto_817964 ?auto_817976 ) ) ( not ( = ?auto_817965 ?auto_817966 ) ) ( not ( = ?auto_817965 ?auto_817967 ) ) ( not ( = ?auto_817965 ?auto_817968 ) ) ( not ( = ?auto_817965 ?auto_817969 ) ) ( not ( = ?auto_817965 ?auto_817970 ) ) ( not ( = ?auto_817965 ?auto_817971 ) ) ( not ( = ?auto_817965 ?auto_817972 ) ) ( not ( = ?auto_817965 ?auto_817973 ) ) ( not ( = ?auto_817965 ?auto_817974 ) ) ( not ( = ?auto_817965 ?auto_817975 ) ) ( not ( = ?auto_817965 ?auto_817976 ) ) ( not ( = ?auto_817966 ?auto_817967 ) ) ( not ( = ?auto_817966 ?auto_817968 ) ) ( not ( = ?auto_817966 ?auto_817969 ) ) ( not ( = ?auto_817966 ?auto_817970 ) ) ( not ( = ?auto_817966 ?auto_817971 ) ) ( not ( = ?auto_817966 ?auto_817972 ) ) ( not ( = ?auto_817966 ?auto_817973 ) ) ( not ( = ?auto_817966 ?auto_817974 ) ) ( not ( = ?auto_817966 ?auto_817975 ) ) ( not ( = ?auto_817966 ?auto_817976 ) ) ( not ( = ?auto_817967 ?auto_817968 ) ) ( not ( = ?auto_817967 ?auto_817969 ) ) ( not ( = ?auto_817967 ?auto_817970 ) ) ( not ( = ?auto_817967 ?auto_817971 ) ) ( not ( = ?auto_817967 ?auto_817972 ) ) ( not ( = ?auto_817967 ?auto_817973 ) ) ( not ( = ?auto_817967 ?auto_817974 ) ) ( not ( = ?auto_817967 ?auto_817975 ) ) ( not ( = ?auto_817967 ?auto_817976 ) ) ( not ( = ?auto_817968 ?auto_817969 ) ) ( not ( = ?auto_817968 ?auto_817970 ) ) ( not ( = ?auto_817968 ?auto_817971 ) ) ( not ( = ?auto_817968 ?auto_817972 ) ) ( not ( = ?auto_817968 ?auto_817973 ) ) ( not ( = ?auto_817968 ?auto_817974 ) ) ( not ( = ?auto_817968 ?auto_817975 ) ) ( not ( = ?auto_817968 ?auto_817976 ) ) ( not ( = ?auto_817969 ?auto_817970 ) ) ( not ( = ?auto_817969 ?auto_817971 ) ) ( not ( = ?auto_817969 ?auto_817972 ) ) ( not ( = ?auto_817969 ?auto_817973 ) ) ( not ( = ?auto_817969 ?auto_817974 ) ) ( not ( = ?auto_817969 ?auto_817975 ) ) ( not ( = ?auto_817969 ?auto_817976 ) ) ( not ( = ?auto_817970 ?auto_817971 ) ) ( not ( = ?auto_817970 ?auto_817972 ) ) ( not ( = ?auto_817970 ?auto_817973 ) ) ( not ( = ?auto_817970 ?auto_817974 ) ) ( not ( = ?auto_817970 ?auto_817975 ) ) ( not ( = ?auto_817970 ?auto_817976 ) ) ( not ( = ?auto_817971 ?auto_817972 ) ) ( not ( = ?auto_817971 ?auto_817973 ) ) ( not ( = ?auto_817971 ?auto_817974 ) ) ( not ( = ?auto_817971 ?auto_817975 ) ) ( not ( = ?auto_817971 ?auto_817976 ) ) ( not ( = ?auto_817972 ?auto_817973 ) ) ( not ( = ?auto_817972 ?auto_817974 ) ) ( not ( = ?auto_817972 ?auto_817975 ) ) ( not ( = ?auto_817972 ?auto_817976 ) ) ( not ( = ?auto_817973 ?auto_817974 ) ) ( not ( = ?auto_817973 ?auto_817975 ) ) ( not ( = ?auto_817973 ?auto_817976 ) ) ( not ( = ?auto_817974 ?auto_817975 ) ) ( not ( = ?auto_817974 ?auto_817976 ) ) ( not ( = ?auto_817975 ?auto_817976 ) ) ( ON ?auto_817974 ?auto_817975 ) ( ON ?auto_817973 ?auto_817974 ) ( ON ?auto_817972 ?auto_817973 ) ( ON ?auto_817971 ?auto_817972 ) ( ON ?auto_817970 ?auto_817971 ) ( CLEAR ?auto_817968 ) ( ON ?auto_817969 ?auto_817970 ) ( CLEAR ?auto_817969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_817958 ?auto_817959 ?auto_817960 ?auto_817961 ?auto_817962 ?auto_817963 ?auto_817964 ?auto_817965 ?auto_817966 ?auto_817967 ?auto_817968 ?auto_817969 )
      ( MAKE-18PILE ?auto_817958 ?auto_817959 ?auto_817960 ?auto_817961 ?auto_817962 ?auto_817963 ?auto_817964 ?auto_817965 ?auto_817966 ?auto_817967 ?auto_817968 ?auto_817969 ?auto_817970 ?auto_817971 ?auto_817972 ?auto_817973 ?auto_817974 ?auto_817975 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_817995 - BLOCK
      ?auto_817996 - BLOCK
      ?auto_817997 - BLOCK
      ?auto_817998 - BLOCK
      ?auto_817999 - BLOCK
      ?auto_818000 - BLOCK
      ?auto_818001 - BLOCK
      ?auto_818002 - BLOCK
      ?auto_818003 - BLOCK
      ?auto_818004 - BLOCK
      ?auto_818005 - BLOCK
      ?auto_818006 - BLOCK
      ?auto_818007 - BLOCK
      ?auto_818008 - BLOCK
      ?auto_818009 - BLOCK
      ?auto_818010 - BLOCK
      ?auto_818011 - BLOCK
      ?auto_818012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818012 ) ( ON-TABLE ?auto_817995 ) ( ON ?auto_817996 ?auto_817995 ) ( ON ?auto_817997 ?auto_817996 ) ( ON ?auto_817998 ?auto_817997 ) ( ON ?auto_817999 ?auto_817998 ) ( ON ?auto_818000 ?auto_817999 ) ( ON ?auto_818001 ?auto_818000 ) ( ON ?auto_818002 ?auto_818001 ) ( ON ?auto_818003 ?auto_818002 ) ( ON ?auto_818004 ?auto_818003 ) ( ON ?auto_818005 ?auto_818004 ) ( not ( = ?auto_817995 ?auto_817996 ) ) ( not ( = ?auto_817995 ?auto_817997 ) ) ( not ( = ?auto_817995 ?auto_817998 ) ) ( not ( = ?auto_817995 ?auto_817999 ) ) ( not ( = ?auto_817995 ?auto_818000 ) ) ( not ( = ?auto_817995 ?auto_818001 ) ) ( not ( = ?auto_817995 ?auto_818002 ) ) ( not ( = ?auto_817995 ?auto_818003 ) ) ( not ( = ?auto_817995 ?auto_818004 ) ) ( not ( = ?auto_817995 ?auto_818005 ) ) ( not ( = ?auto_817995 ?auto_818006 ) ) ( not ( = ?auto_817995 ?auto_818007 ) ) ( not ( = ?auto_817995 ?auto_818008 ) ) ( not ( = ?auto_817995 ?auto_818009 ) ) ( not ( = ?auto_817995 ?auto_818010 ) ) ( not ( = ?auto_817995 ?auto_818011 ) ) ( not ( = ?auto_817995 ?auto_818012 ) ) ( not ( = ?auto_817996 ?auto_817997 ) ) ( not ( = ?auto_817996 ?auto_817998 ) ) ( not ( = ?auto_817996 ?auto_817999 ) ) ( not ( = ?auto_817996 ?auto_818000 ) ) ( not ( = ?auto_817996 ?auto_818001 ) ) ( not ( = ?auto_817996 ?auto_818002 ) ) ( not ( = ?auto_817996 ?auto_818003 ) ) ( not ( = ?auto_817996 ?auto_818004 ) ) ( not ( = ?auto_817996 ?auto_818005 ) ) ( not ( = ?auto_817996 ?auto_818006 ) ) ( not ( = ?auto_817996 ?auto_818007 ) ) ( not ( = ?auto_817996 ?auto_818008 ) ) ( not ( = ?auto_817996 ?auto_818009 ) ) ( not ( = ?auto_817996 ?auto_818010 ) ) ( not ( = ?auto_817996 ?auto_818011 ) ) ( not ( = ?auto_817996 ?auto_818012 ) ) ( not ( = ?auto_817997 ?auto_817998 ) ) ( not ( = ?auto_817997 ?auto_817999 ) ) ( not ( = ?auto_817997 ?auto_818000 ) ) ( not ( = ?auto_817997 ?auto_818001 ) ) ( not ( = ?auto_817997 ?auto_818002 ) ) ( not ( = ?auto_817997 ?auto_818003 ) ) ( not ( = ?auto_817997 ?auto_818004 ) ) ( not ( = ?auto_817997 ?auto_818005 ) ) ( not ( = ?auto_817997 ?auto_818006 ) ) ( not ( = ?auto_817997 ?auto_818007 ) ) ( not ( = ?auto_817997 ?auto_818008 ) ) ( not ( = ?auto_817997 ?auto_818009 ) ) ( not ( = ?auto_817997 ?auto_818010 ) ) ( not ( = ?auto_817997 ?auto_818011 ) ) ( not ( = ?auto_817997 ?auto_818012 ) ) ( not ( = ?auto_817998 ?auto_817999 ) ) ( not ( = ?auto_817998 ?auto_818000 ) ) ( not ( = ?auto_817998 ?auto_818001 ) ) ( not ( = ?auto_817998 ?auto_818002 ) ) ( not ( = ?auto_817998 ?auto_818003 ) ) ( not ( = ?auto_817998 ?auto_818004 ) ) ( not ( = ?auto_817998 ?auto_818005 ) ) ( not ( = ?auto_817998 ?auto_818006 ) ) ( not ( = ?auto_817998 ?auto_818007 ) ) ( not ( = ?auto_817998 ?auto_818008 ) ) ( not ( = ?auto_817998 ?auto_818009 ) ) ( not ( = ?auto_817998 ?auto_818010 ) ) ( not ( = ?auto_817998 ?auto_818011 ) ) ( not ( = ?auto_817998 ?auto_818012 ) ) ( not ( = ?auto_817999 ?auto_818000 ) ) ( not ( = ?auto_817999 ?auto_818001 ) ) ( not ( = ?auto_817999 ?auto_818002 ) ) ( not ( = ?auto_817999 ?auto_818003 ) ) ( not ( = ?auto_817999 ?auto_818004 ) ) ( not ( = ?auto_817999 ?auto_818005 ) ) ( not ( = ?auto_817999 ?auto_818006 ) ) ( not ( = ?auto_817999 ?auto_818007 ) ) ( not ( = ?auto_817999 ?auto_818008 ) ) ( not ( = ?auto_817999 ?auto_818009 ) ) ( not ( = ?auto_817999 ?auto_818010 ) ) ( not ( = ?auto_817999 ?auto_818011 ) ) ( not ( = ?auto_817999 ?auto_818012 ) ) ( not ( = ?auto_818000 ?auto_818001 ) ) ( not ( = ?auto_818000 ?auto_818002 ) ) ( not ( = ?auto_818000 ?auto_818003 ) ) ( not ( = ?auto_818000 ?auto_818004 ) ) ( not ( = ?auto_818000 ?auto_818005 ) ) ( not ( = ?auto_818000 ?auto_818006 ) ) ( not ( = ?auto_818000 ?auto_818007 ) ) ( not ( = ?auto_818000 ?auto_818008 ) ) ( not ( = ?auto_818000 ?auto_818009 ) ) ( not ( = ?auto_818000 ?auto_818010 ) ) ( not ( = ?auto_818000 ?auto_818011 ) ) ( not ( = ?auto_818000 ?auto_818012 ) ) ( not ( = ?auto_818001 ?auto_818002 ) ) ( not ( = ?auto_818001 ?auto_818003 ) ) ( not ( = ?auto_818001 ?auto_818004 ) ) ( not ( = ?auto_818001 ?auto_818005 ) ) ( not ( = ?auto_818001 ?auto_818006 ) ) ( not ( = ?auto_818001 ?auto_818007 ) ) ( not ( = ?auto_818001 ?auto_818008 ) ) ( not ( = ?auto_818001 ?auto_818009 ) ) ( not ( = ?auto_818001 ?auto_818010 ) ) ( not ( = ?auto_818001 ?auto_818011 ) ) ( not ( = ?auto_818001 ?auto_818012 ) ) ( not ( = ?auto_818002 ?auto_818003 ) ) ( not ( = ?auto_818002 ?auto_818004 ) ) ( not ( = ?auto_818002 ?auto_818005 ) ) ( not ( = ?auto_818002 ?auto_818006 ) ) ( not ( = ?auto_818002 ?auto_818007 ) ) ( not ( = ?auto_818002 ?auto_818008 ) ) ( not ( = ?auto_818002 ?auto_818009 ) ) ( not ( = ?auto_818002 ?auto_818010 ) ) ( not ( = ?auto_818002 ?auto_818011 ) ) ( not ( = ?auto_818002 ?auto_818012 ) ) ( not ( = ?auto_818003 ?auto_818004 ) ) ( not ( = ?auto_818003 ?auto_818005 ) ) ( not ( = ?auto_818003 ?auto_818006 ) ) ( not ( = ?auto_818003 ?auto_818007 ) ) ( not ( = ?auto_818003 ?auto_818008 ) ) ( not ( = ?auto_818003 ?auto_818009 ) ) ( not ( = ?auto_818003 ?auto_818010 ) ) ( not ( = ?auto_818003 ?auto_818011 ) ) ( not ( = ?auto_818003 ?auto_818012 ) ) ( not ( = ?auto_818004 ?auto_818005 ) ) ( not ( = ?auto_818004 ?auto_818006 ) ) ( not ( = ?auto_818004 ?auto_818007 ) ) ( not ( = ?auto_818004 ?auto_818008 ) ) ( not ( = ?auto_818004 ?auto_818009 ) ) ( not ( = ?auto_818004 ?auto_818010 ) ) ( not ( = ?auto_818004 ?auto_818011 ) ) ( not ( = ?auto_818004 ?auto_818012 ) ) ( not ( = ?auto_818005 ?auto_818006 ) ) ( not ( = ?auto_818005 ?auto_818007 ) ) ( not ( = ?auto_818005 ?auto_818008 ) ) ( not ( = ?auto_818005 ?auto_818009 ) ) ( not ( = ?auto_818005 ?auto_818010 ) ) ( not ( = ?auto_818005 ?auto_818011 ) ) ( not ( = ?auto_818005 ?auto_818012 ) ) ( not ( = ?auto_818006 ?auto_818007 ) ) ( not ( = ?auto_818006 ?auto_818008 ) ) ( not ( = ?auto_818006 ?auto_818009 ) ) ( not ( = ?auto_818006 ?auto_818010 ) ) ( not ( = ?auto_818006 ?auto_818011 ) ) ( not ( = ?auto_818006 ?auto_818012 ) ) ( not ( = ?auto_818007 ?auto_818008 ) ) ( not ( = ?auto_818007 ?auto_818009 ) ) ( not ( = ?auto_818007 ?auto_818010 ) ) ( not ( = ?auto_818007 ?auto_818011 ) ) ( not ( = ?auto_818007 ?auto_818012 ) ) ( not ( = ?auto_818008 ?auto_818009 ) ) ( not ( = ?auto_818008 ?auto_818010 ) ) ( not ( = ?auto_818008 ?auto_818011 ) ) ( not ( = ?auto_818008 ?auto_818012 ) ) ( not ( = ?auto_818009 ?auto_818010 ) ) ( not ( = ?auto_818009 ?auto_818011 ) ) ( not ( = ?auto_818009 ?auto_818012 ) ) ( not ( = ?auto_818010 ?auto_818011 ) ) ( not ( = ?auto_818010 ?auto_818012 ) ) ( not ( = ?auto_818011 ?auto_818012 ) ) ( ON ?auto_818011 ?auto_818012 ) ( ON ?auto_818010 ?auto_818011 ) ( ON ?auto_818009 ?auto_818010 ) ( ON ?auto_818008 ?auto_818009 ) ( ON ?auto_818007 ?auto_818008 ) ( CLEAR ?auto_818005 ) ( ON ?auto_818006 ?auto_818007 ) ( CLEAR ?auto_818006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_817995 ?auto_817996 ?auto_817997 ?auto_817998 ?auto_817999 ?auto_818000 ?auto_818001 ?auto_818002 ?auto_818003 ?auto_818004 ?auto_818005 ?auto_818006 )
      ( MAKE-18PILE ?auto_817995 ?auto_817996 ?auto_817997 ?auto_817998 ?auto_817999 ?auto_818000 ?auto_818001 ?auto_818002 ?auto_818003 ?auto_818004 ?auto_818005 ?auto_818006 ?auto_818007 ?auto_818008 ?auto_818009 ?auto_818010 ?auto_818011 ?auto_818012 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818031 - BLOCK
      ?auto_818032 - BLOCK
      ?auto_818033 - BLOCK
      ?auto_818034 - BLOCK
      ?auto_818035 - BLOCK
      ?auto_818036 - BLOCK
      ?auto_818037 - BLOCK
      ?auto_818038 - BLOCK
      ?auto_818039 - BLOCK
      ?auto_818040 - BLOCK
      ?auto_818041 - BLOCK
      ?auto_818042 - BLOCK
      ?auto_818043 - BLOCK
      ?auto_818044 - BLOCK
      ?auto_818045 - BLOCK
      ?auto_818046 - BLOCK
      ?auto_818047 - BLOCK
      ?auto_818048 - BLOCK
    )
    :vars
    (
      ?auto_818049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818048 ?auto_818049 ) ( ON-TABLE ?auto_818031 ) ( ON ?auto_818032 ?auto_818031 ) ( ON ?auto_818033 ?auto_818032 ) ( ON ?auto_818034 ?auto_818033 ) ( ON ?auto_818035 ?auto_818034 ) ( ON ?auto_818036 ?auto_818035 ) ( ON ?auto_818037 ?auto_818036 ) ( ON ?auto_818038 ?auto_818037 ) ( ON ?auto_818039 ?auto_818038 ) ( ON ?auto_818040 ?auto_818039 ) ( not ( = ?auto_818031 ?auto_818032 ) ) ( not ( = ?auto_818031 ?auto_818033 ) ) ( not ( = ?auto_818031 ?auto_818034 ) ) ( not ( = ?auto_818031 ?auto_818035 ) ) ( not ( = ?auto_818031 ?auto_818036 ) ) ( not ( = ?auto_818031 ?auto_818037 ) ) ( not ( = ?auto_818031 ?auto_818038 ) ) ( not ( = ?auto_818031 ?auto_818039 ) ) ( not ( = ?auto_818031 ?auto_818040 ) ) ( not ( = ?auto_818031 ?auto_818041 ) ) ( not ( = ?auto_818031 ?auto_818042 ) ) ( not ( = ?auto_818031 ?auto_818043 ) ) ( not ( = ?auto_818031 ?auto_818044 ) ) ( not ( = ?auto_818031 ?auto_818045 ) ) ( not ( = ?auto_818031 ?auto_818046 ) ) ( not ( = ?auto_818031 ?auto_818047 ) ) ( not ( = ?auto_818031 ?auto_818048 ) ) ( not ( = ?auto_818031 ?auto_818049 ) ) ( not ( = ?auto_818032 ?auto_818033 ) ) ( not ( = ?auto_818032 ?auto_818034 ) ) ( not ( = ?auto_818032 ?auto_818035 ) ) ( not ( = ?auto_818032 ?auto_818036 ) ) ( not ( = ?auto_818032 ?auto_818037 ) ) ( not ( = ?auto_818032 ?auto_818038 ) ) ( not ( = ?auto_818032 ?auto_818039 ) ) ( not ( = ?auto_818032 ?auto_818040 ) ) ( not ( = ?auto_818032 ?auto_818041 ) ) ( not ( = ?auto_818032 ?auto_818042 ) ) ( not ( = ?auto_818032 ?auto_818043 ) ) ( not ( = ?auto_818032 ?auto_818044 ) ) ( not ( = ?auto_818032 ?auto_818045 ) ) ( not ( = ?auto_818032 ?auto_818046 ) ) ( not ( = ?auto_818032 ?auto_818047 ) ) ( not ( = ?auto_818032 ?auto_818048 ) ) ( not ( = ?auto_818032 ?auto_818049 ) ) ( not ( = ?auto_818033 ?auto_818034 ) ) ( not ( = ?auto_818033 ?auto_818035 ) ) ( not ( = ?auto_818033 ?auto_818036 ) ) ( not ( = ?auto_818033 ?auto_818037 ) ) ( not ( = ?auto_818033 ?auto_818038 ) ) ( not ( = ?auto_818033 ?auto_818039 ) ) ( not ( = ?auto_818033 ?auto_818040 ) ) ( not ( = ?auto_818033 ?auto_818041 ) ) ( not ( = ?auto_818033 ?auto_818042 ) ) ( not ( = ?auto_818033 ?auto_818043 ) ) ( not ( = ?auto_818033 ?auto_818044 ) ) ( not ( = ?auto_818033 ?auto_818045 ) ) ( not ( = ?auto_818033 ?auto_818046 ) ) ( not ( = ?auto_818033 ?auto_818047 ) ) ( not ( = ?auto_818033 ?auto_818048 ) ) ( not ( = ?auto_818033 ?auto_818049 ) ) ( not ( = ?auto_818034 ?auto_818035 ) ) ( not ( = ?auto_818034 ?auto_818036 ) ) ( not ( = ?auto_818034 ?auto_818037 ) ) ( not ( = ?auto_818034 ?auto_818038 ) ) ( not ( = ?auto_818034 ?auto_818039 ) ) ( not ( = ?auto_818034 ?auto_818040 ) ) ( not ( = ?auto_818034 ?auto_818041 ) ) ( not ( = ?auto_818034 ?auto_818042 ) ) ( not ( = ?auto_818034 ?auto_818043 ) ) ( not ( = ?auto_818034 ?auto_818044 ) ) ( not ( = ?auto_818034 ?auto_818045 ) ) ( not ( = ?auto_818034 ?auto_818046 ) ) ( not ( = ?auto_818034 ?auto_818047 ) ) ( not ( = ?auto_818034 ?auto_818048 ) ) ( not ( = ?auto_818034 ?auto_818049 ) ) ( not ( = ?auto_818035 ?auto_818036 ) ) ( not ( = ?auto_818035 ?auto_818037 ) ) ( not ( = ?auto_818035 ?auto_818038 ) ) ( not ( = ?auto_818035 ?auto_818039 ) ) ( not ( = ?auto_818035 ?auto_818040 ) ) ( not ( = ?auto_818035 ?auto_818041 ) ) ( not ( = ?auto_818035 ?auto_818042 ) ) ( not ( = ?auto_818035 ?auto_818043 ) ) ( not ( = ?auto_818035 ?auto_818044 ) ) ( not ( = ?auto_818035 ?auto_818045 ) ) ( not ( = ?auto_818035 ?auto_818046 ) ) ( not ( = ?auto_818035 ?auto_818047 ) ) ( not ( = ?auto_818035 ?auto_818048 ) ) ( not ( = ?auto_818035 ?auto_818049 ) ) ( not ( = ?auto_818036 ?auto_818037 ) ) ( not ( = ?auto_818036 ?auto_818038 ) ) ( not ( = ?auto_818036 ?auto_818039 ) ) ( not ( = ?auto_818036 ?auto_818040 ) ) ( not ( = ?auto_818036 ?auto_818041 ) ) ( not ( = ?auto_818036 ?auto_818042 ) ) ( not ( = ?auto_818036 ?auto_818043 ) ) ( not ( = ?auto_818036 ?auto_818044 ) ) ( not ( = ?auto_818036 ?auto_818045 ) ) ( not ( = ?auto_818036 ?auto_818046 ) ) ( not ( = ?auto_818036 ?auto_818047 ) ) ( not ( = ?auto_818036 ?auto_818048 ) ) ( not ( = ?auto_818036 ?auto_818049 ) ) ( not ( = ?auto_818037 ?auto_818038 ) ) ( not ( = ?auto_818037 ?auto_818039 ) ) ( not ( = ?auto_818037 ?auto_818040 ) ) ( not ( = ?auto_818037 ?auto_818041 ) ) ( not ( = ?auto_818037 ?auto_818042 ) ) ( not ( = ?auto_818037 ?auto_818043 ) ) ( not ( = ?auto_818037 ?auto_818044 ) ) ( not ( = ?auto_818037 ?auto_818045 ) ) ( not ( = ?auto_818037 ?auto_818046 ) ) ( not ( = ?auto_818037 ?auto_818047 ) ) ( not ( = ?auto_818037 ?auto_818048 ) ) ( not ( = ?auto_818037 ?auto_818049 ) ) ( not ( = ?auto_818038 ?auto_818039 ) ) ( not ( = ?auto_818038 ?auto_818040 ) ) ( not ( = ?auto_818038 ?auto_818041 ) ) ( not ( = ?auto_818038 ?auto_818042 ) ) ( not ( = ?auto_818038 ?auto_818043 ) ) ( not ( = ?auto_818038 ?auto_818044 ) ) ( not ( = ?auto_818038 ?auto_818045 ) ) ( not ( = ?auto_818038 ?auto_818046 ) ) ( not ( = ?auto_818038 ?auto_818047 ) ) ( not ( = ?auto_818038 ?auto_818048 ) ) ( not ( = ?auto_818038 ?auto_818049 ) ) ( not ( = ?auto_818039 ?auto_818040 ) ) ( not ( = ?auto_818039 ?auto_818041 ) ) ( not ( = ?auto_818039 ?auto_818042 ) ) ( not ( = ?auto_818039 ?auto_818043 ) ) ( not ( = ?auto_818039 ?auto_818044 ) ) ( not ( = ?auto_818039 ?auto_818045 ) ) ( not ( = ?auto_818039 ?auto_818046 ) ) ( not ( = ?auto_818039 ?auto_818047 ) ) ( not ( = ?auto_818039 ?auto_818048 ) ) ( not ( = ?auto_818039 ?auto_818049 ) ) ( not ( = ?auto_818040 ?auto_818041 ) ) ( not ( = ?auto_818040 ?auto_818042 ) ) ( not ( = ?auto_818040 ?auto_818043 ) ) ( not ( = ?auto_818040 ?auto_818044 ) ) ( not ( = ?auto_818040 ?auto_818045 ) ) ( not ( = ?auto_818040 ?auto_818046 ) ) ( not ( = ?auto_818040 ?auto_818047 ) ) ( not ( = ?auto_818040 ?auto_818048 ) ) ( not ( = ?auto_818040 ?auto_818049 ) ) ( not ( = ?auto_818041 ?auto_818042 ) ) ( not ( = ?auto_818041 ?auto_818043 ) ) ( not ( = ?auto_818041 ?auto_818044 ) ) ( not ( = ?auto_818041 ?auto_818045 ) ) ( not ( = ?auto_818041 ?auto_818046 ) ) ( not ( = ?auto_818041 ?auto_818047 ) ) ( not ( = ?auto_818041 ?auto_818048 ) ) ( not ( = ?auto_818041 ?auto_818049 ) ) ( not ( = ?auto_818042 ?auto_818043 ) ) ( not ( = ?auto_818042 ?auto_818044 ) ) ( not ( = ?auto_818042 ?auto_818045 ) ) ( not ( = ?auto_818042 ?auto_818046 ) ) ( not ( = ?auto_818042 ?auto_818047 ) ) ( not ( = ?auto_818042 ?auto_818048 ) ) ( not ( = ?auto_818042 ?auto_818049 ) ) ( not ( = ?auto_818043 ?auto_818044 ) ) ( not ( = ?auto_818043 ?auto_818045 ) ) ( not ( = ?auto_818043 ?auto_818046 ) ) ( not ( = ?auto_818043 ?auto_818047 ) ) ( not ( = ?auto_818043 ?auto_818048 ) ) ( not ( = ?auto_818043 ?auto_818049 ) ) ( not ( = ?auto_818044 ?auto_818045 ) ) ( not ( = ?auto_818044 ?auto_818046 ) ) ( not ( = ?auto_818044 ?auto_818047 ) ) ( not ( = ?auto_818044 ?auto_818048 ) ) ( not ( = ?auto_818044 ?auto_818049 ) ) ( not ( = ?auto_818045 ?auto_818046 ) ) ( not ( = ?auto_818045 ?auto_818047 ) ) ( not ( = ?auto_818045 ?auto_818048 ) ) ( not ( = ?auto_818045 ?auto_818049 ) ) ( not ( = ?auto_818046 ?auto_818047 ) ) ( not ( = ?auto_818046 ?auto_818048 ) ) ( not ( = ?auto_818046 ?auto_818049 ) ) ( not ( = ?auto_818047 ?auto_818048 ) ) ( not ( = ?auto_818047 ?auto_818049 ) ) ( not ( = ?auto_818048 ?auto_818049 ) ) ( ON ?auto_818047 ?auto_818048 ) ( ON ?auto_818046 ?auto_818047 ) ( ON ?auto_818045 ?auto_818046 ) ( ON ?auto_818044 ?auto_818045 ) ( ON ?auto_818043 ?auto_818044 ) ( ON ?auto_818042 ?auto_818043 ) ( CLEAR ?auto_818040 ) ( ON ?auto_818041 ?auto_818042 ) ( CLEAR ?auto_818041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_818031 ?auto_818032 ?auto_818033 ?auto_818034 ?auto_818035 ?auto_818036 ?auto_818037 ?auto_818038 ?auto_818039 ?auto_818040 ?auto_818041 )
      ( MAKE-18PILE ?auto_818031 ?auto_818032 ?auto_818033 ?auto_818034 ?auto_818035 ?auto_818036 ?auto_818037 ?auto_818038 ?auto_818039 ?auto_818040 ?auto_818041 ?auto_818042 ?auto_818043 ?auto_818044 ?auto_818045 ?auto_818046 ?auto_818047 ?auto_818048 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818068 - BLOCK
      ?auto_818069 - BLOCK
      ?auto_818070 - BLOCK
      ?auto_818071 - BLOCK
      ?auto_818072 - BLOCK
      ?auto_818073 - BLOCK
      ?auto_818074 - BLOCK
      ?auto_818075 - BLOCK
      ?auto_818076 - BLOCK
      ?auto_818077 - BLOCK
      ?auto_818078 - BLOCK
      ?auto_818079 - BLOCK
      ?auto_818080 - BLOCK
      ?auto_818081 - BLOCK
      ?auto_818082 - BLOCK
      ?auto_818083 - BLOCK
      ?auto_818084 - BLOCK
      ?auto_818085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818085 ) ( ON-TABLE ?auto_818068 ) ( ON ?auto_818069 ?auto_818068 ) ( ON ?auto_818070 ?auto_818069 ) ( ON ?auto_818071 ?auto_818070 ) ( ON ?auto_818072 ?auto_818071 ) ( ON ?auto_818073 ?auto_818072 ) ( ON ?auto_818074 ?auto_818073 ) ( ON ?auto_818075 ?auto_818074 ) ( ON ?auto_818076 ?auto_818075 ) ( ON ?auto_818077 ?auto_818076 ) ( not ( = ?auto_818068 ?auto_818069 ) ) ( not ( = ?auto_818068 ?auto_818070 ) ) ( not ( = ?auto_818068 ?auto_818071 ) ) ( not ( = ?auto_818068 ?auto_818072 ) ) ( not ( = ?auto_818068 ?auto_818073 ) ) ( not ( = ?auto_818068 ?auto_818074 ) ) ( not ( = ?auto_818068 ?auto_818075 ) ) ( not ( = ?auto_818068 ?auto_818076 ) ) ( not ( = ?auto_818068 ?auto_818077 ) ) ( not ( = ?auto_818068 ?auto_818078 ) ) ( not ( = ?auto_818068 ?auto_818079 ) ) ( not ( = ?auto_818068 ?auto_818080 ) ) ( not ( = ?auto_818068 ?auto_818081 ) ) ( not ( = ?auto_818068 ?auto_818082 ) ) ( not ( = ?auto_818068 ?auto_818083 ) ) ( not ( = ?auto_818068 ?auto_818084 ) ) ( not ( = ?auto_818068 ?auto_818085 ) ) ( not ( = ?auto_818069 ?auto_818070 ) ) ( not ( = ?auto_818069 ?auto_818071 ) ) ( not ( = ?auto_818069 ?auto_818072 ) ) ( not ( = ?auto_818069 ?auto_818073 ) ) ( not ( = ?auto_818069 ?auto_818074 ) ) ( not ( = ?auto_818069 ?auto_818075 ) ) ( not ( = ?auto_818069 ?auto_818076 ) ) ( not ( = ?auto_818069 ?auto_818077 ) ) ( not ( = ?auto_818069 ?auto_818078 ) ) ( not ( = ?auto_818069 ?auto_818079 ) ) ( not ( = ?auto_818069 ?auto_818080 ) ) ( not ( = ?auto_818069 ?auto_818081 ) ) ( not ( = ?auto_818069 ?auto_818082 ) ) ( not ( = ?auto_818069 ?auto_818083 ) ) ( not ( = ?auto_818069 ?auto_818084 ) ) ( not ( = ?auto_818069 ?auto_818085 ) ) ( not ( = ?auto_818070 ?auto_818071 ) ) ( not ( = ?auto_818070 ?auto_818072 ) ) ( not ( = ?auto_818070 ?auto_818073 ) ) ( not ( = ?auto_818070 ?auto_818074 ) ) ( not ( = ?auto_818070 ?auto_818075 ) ) ( not ( = ?auto_818070 ?auto_818076 ) ) ( not ( = ?auto_818070 ?auto_818077 ) ) ( not ( = ?auto_818070 ?auto_818078 ) ) ( not ( = ?auto_818070 ?auto_818079 ) ) ( not ( = ?auto_818070 ?auto_818080 ) ) ( not ( = ?auto_818070 ?auto_818081 ) ) ( not ( = ?auto_818070 ?auto_818082 ) ) ( not ( = ?auto_818070 ?auto_818083 ) ) ( not ( = ?auto_818070 ?auto_818084 ) ) ( not ( = ?auto_818070 ?auto_818085 ) ) ( not ( = ?auto_818071 ?auto_818072 ) ) ( not ( = ?auto_818071 ?auto_818073 ) ) ( not ( = ?auto_818071 ?auto_818074 ) ) ( not ( = ?auto_818071 ?auto_818075 ) ) ( not ( = ?auto_818071 ?auto_818076 ) ) ( not ( = ?auto_818071 ?auto_818077 ) ) ( not ( = ?auto_818071 ?auto_818078 ) ) ( not ( = ?auto_818071 ?auto_818079 ) ) ( not ( = ?auto_818071 ?auto_818080 ) ) ( not ( = ?auto_818071 ?auto_818081 ) ) ( not ( = ?auto_818071 ?auto_818082 ) ) ( not ( = ?auto_818071 ?auto_818083 ) ) ( not ( = ?auto_818071 ?auto_818084 ) ) ( not ( = ?auto_818071 ?auto_818085 ) ) ( not ( = ?auto_818072 ?auto_818073 ) ) ( not ( = ?auto_818072 ?auto_818074 ) ) ( not ( = ?auto_818072 ?auto_818075 ) ) ( not ( = ?auto_818072 ?auto_818076 ) ) ( not ( = ?auto_818072 ?auto_818077 ) ) ( not ( = ?auto_818072 ?auto_818078 ) ) ( not ( = ?auto_818072 ?auto_818079 ) ) ( not ( = ?auto_818072 ?auto_818080 ) ) ( not ( = ?auto_818072 ?auto_818081 ) ) ( not ( = ?auto_818072 ?auto_818082 ) ) ( not ( = ?auto_818072 ?auto_818083 ) ) ( not ( = ?auto_818072 ?auto_818084 ) ) ( not ( = ?auto_818072 ?auto_818085 ) ) ( not ( = ?auto_818073 ?auto_818074 ) ) ( not ( = ?auto_818073 ?auto_818075 ) ) ( not ( = ?auto_818073 ?auto_818076 ) ) ( not ( = ?auto_818073 ?auto_818077 ) ) ( not ( = ?auto_818073 ?auto_818078 ) ) ( not ( = ?auto_818073 ?auto_818079 ) ) ( not ( = ?auto_818073 ?auto_818080 ) ) ( not ( = ?auto_818073 ?auto_818081 ) ) ( not ( = ?auto_818073 ?auto_818082 ) ) ( not ( = ?auto_818073 ?auto_818083 ) ) ( not ( = ?auto_818073 ?auto_818084 ) ) ( not ( = ?auto_818073 ?auto_818085 ) ) ( not ( = ?auto_818074 ?auto_818075 ) ) ( not ( = ?auto_818074 ?auto_818076 ) ) ( not ( = ?auto_818074 ?auto_818077 ) ) ( not ( = ?auto_818074 ?auto_818078 ) ) ( not ( = ?auto_818074 ?auto_818079 ) ) ( not ( = ?auto_818074 ?auto_818080 ) ) ( not ( = ?auto_818074 ?auto_818081 ) ) ( not ( = ?auto_818074 ?auto_818082 ) ) ( not ( = ?auto_818074 ?auto_818083 ) ) ( not ( = ?auto_818074 ?auto_818084 ) ) ( not ( = ?auto_818074 ?auto_818085 ) ) ( not ( = ?auto_818075 ?auto_818076 ) ) ( not ( = ?auto_818075 ?auto_818077 ) ) ( not ( = ?auto_818075 ?auto_818078 ) ) ( not ( = ?auto_818075 ?auto_818079 ) ) ( not ( = ?auto_818075 ?auto_818080 ) ) ( not ( = ?auto_818075 ?auto_818081 ) ) ( not ( = ?auto_818075 ?auto_818082 ) ) ( not ( = ?auto_818075 ?auto_818083 ) ) ( not ( = ?auto_818075 ?auto_818084 ) ) ( not ( = ?auto_818075 ?auto_818085 ) ) ( not ( = ?auto_818076 ?auto_818077 ) ) ( not ( = ?auto_818076 ?auto_818078 ) ) ( not ( = ?auto_818076 ?auto_818079 ) ) ( not ( = ?auto_818076 ?auto_818080 ) ) ( not ( = ?auto_818076 ?auto_818081 ) ) ( not ( = ?auto_818076 ?auto_818082 ) ) ( not ( = ?auto_818076 ?auto_818083 ) ) ( not ( = ?auto_818076 ?auto_818084 ) ) ( not ( = ?auto_818076 ?auto_818085 ) ) ( not ( = ?auto_818077 ?auto_818078 ) ) ( not ( = ?auto_818077 ?auto_818079 ) ) ( not ( = ?auto_818077 ?auto_818080 ) ) ( not ( = ?auto_818077 ?auto_818081 ) ) ( not ( = ?auto_818077 ?auto_818082 ) ) ( not ( = ?auto_818077 ?auto_818083 ) ) ( not ( = ?auto_818077 ?auto_818084 ) ) ( not ( = ?auto_818077 ?auto_818085 ) ) ( not ( = ?auto_818078 ?auto_818079 ) ) ( not ( = ?auto_818078 ?auto_818080 ) ) ( not ( = ?auto_818078 ?auto_818081 ) ) ( not ( = ?auto_818078 ?auto_818082 ) ) ( not ( = ?auto_818078 ?auto_818083 ) ) ( not ( = ?auto_818078 ?auto_818084 ) ) ( not ( = ?auto_818078 ?auto_818085 ) ) ( not ( = ?auto_818079 ?auto_818080 ) ) ( not ( = ?auto_818079 ?auto_818081 ) ) ( not ( = ?auto_818079 ?auto_818082 ) ) ( not ( = ?auto_818079 ?auto_818083 ) ) ( not ( = ?auto_818079 ?auto_818084 ) ) ( not ( = ?auto_818079 ?auto_818085 ) ) ( not ( = ?auto_818080 ?auto_818081 ) ) ( not ( = ?auto_818080 ?auto_818082 ) ) ( not ( = ?auto_818080 ?auto_818083 ) ) ( not ( = ?auto_818080 ?auto_818084 ) ) ( not ( = ?auto_818080 ?auto_818085 ) ) ( not ( = ?auto_818081 ?auto_818082 ) ) ( not ( = ?auto_818081 ?auto_818083 ) ) ( not ( = ?auto_818081 ?auto_818084 ) ) ( not ( = ?auto_818081 ?auto_818085 ) ) ( not ( = ?auto_818082 ?auto_818083 ) ) ( not ( = ?auto_818082 ?auto_818084 ) ) ( not ( = ?auto_818082 ?auto_818085 ) ) ( not ( = ?auto_818083 ?auto_818084 ) ) ( not ( = ?auto_818083 ?auto_818085 ) ) ( not ( = ?auto_818084 ?auto_818085 ) ) ( ON ?auto_818084 ?auto_818085 ) ( ON ?auto_818083 ?auto_818084 ) ( ON ?auto_818082 ?auto_818083 ) ( ON ?auto_818081 ?auto_818082 ) ( ON ?auto_818080 ?auto_818081 ) ( ON ?auto_818079 ?auto_818080 ) ( CLEAR ?auto_818077 ) ( ON ?auto_818078 ?auto_818079 ) ( CLEAR ?auto_818078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_818068 ?auto_818069 ?auto_818070 ?auto_818071 ?auto_818072 ?auto_818073 ?auto_818074 ?auto_818075 ?auto_818076 ?auto_818077 ?auto_818078 )
      ( MAKE-18PILE ?auto_818068 ?auto_818069 ?auto_818070 ?auto_818071 ?auto_818072 ?auto_818073 ?auto_818074 ?auto_818075 ?auto_818076 ?auto_818077 ?auto_818078 ?auto_818079 ?auto_818080 ?auto_818081 ?auto_818082 ?auto_818083 ?auto_818084 ?auto_818085 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818104 - BLOCK
      ?auto_818105 - BLOCK
      ?auto_818106 - BLOCK
      ?auto_818107 - BLOCK
      ?auto_818108 - BLOCK
      ?auto_818109 - BLOCK
      ?auto_818110 - BLOCK
      ?auto_818111 - BLOCK
      ?auto_818112 - BLOCK
      ?auto_818113 - BLOCK
      ?auto_818114 - BLOCK
      ?auto_818115 - BLOCK
      ?auto_818116 - BLOCK
      ?auto_818117 - BLOCK
      ?auto_818118 - BLOCK
      ?auto_818119 - BLOCK
      ?auto_818120 - BLOCK
      ?auto_818121 - BLOCK
    )
    :vars
    (
      ?auto_818122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818121 ?auto_818122 ) ( ON-TABLE ?auto_818104 ) ( ON ?auto_818105 ?auto_818104 ) ( ON ?auto_818106 ?auto_818105 ) ( ON ?auto_818107 ?auto_818106 ) ( ON ?auto_818108 ?auto_818107 ) ( ON ?auto_818109 ?auto_818108 ) ( ON ?auto_818110 ?auto_818109 ) ( ON ?auto_818111 ?auto_818110 ) ( ON ?auto_818112 ?auto_818111 ) ( not ( = ?auto_818104 ?auto_818105 ) ) ( not ( = ?auto_818104 ?auto_818106 ) ) ( not ( = ?auto_818104 ?auto_818107 ) ) ( not ( = ?auto_818104 ?auto_818108 ) ) ( not ( = ?auto_818104 ?auto_818109 ) ) ( not ( = ?auto_818104 ?auto_818110 ) ) ( not ( = ?auto_818104 ?auto_818111 ) ) ( not ( = ?auto_818104 ?auto_818112 ) ) ( not ( = ?auto_818104 ?auto_818113 ) ) ( not ( = ?auto_818104 ?auto_818114 ) ) ( not ( = ?auto_818104 ?auto_818115 ) ) ( not ( = ?auto_818104 ?auto_818116 ) ) ( not ( = ?auto_818104 ?auto_818117 ) ) ( not ( = ?auto_818104 ?auto_818118 ) ) ( not ( = ?auto_818104 ?auto_818119 ) ) ( not ( = ?auto_818104 ?auto_818120 ) ) ( not ( = ?auto_818104 ?auto_818121 ) ) ( not ( = ?auto_818104 ?auto_818122 ) ) ( not ( = ?auto_818105 ?auto_818106 ) ) ( not ( = ?auto_818105 ?auto_818107 ) ) ( not ( = ?auto_818105 ?auto_818108 ) ) ( not ( = ?auto_818105 ?auto_818109 ) ) ( not ( = ?auto_818105 ?auto_818110 ) ) ( not ( = ?auto_818105 ?auto_818111 ) ) ( not ( = ?auto_818105 ?auto_818112 ) ) ( not ( = ?auto_818105 ?auto_818113 ) ) ( not ( = ?auto_818105 ?auto_818114 ) ) ( not ( = ?auto_818105 ?auto_818115 ) ) ( not ( = ?auto_818105 ?auto_818116 ) ) ( not ( = ?auto_818105 ?auto_818117 ) ) ( not ( = ?auto_818105 ?auto_818118 ) ) ( not ( = ?auto_818105 ?auto_818119 ) ) ( not ( = ?auto_818105 ?auto_818120 ) ) ( not ( = ?auto_818105 ?auto_818121 ) ) ( not ( = ?auto_818105 ?auto_818122 ) ) ( not ( = ?auto_818106 ?auto_818107 ) ) ( not ( = ?auto_818106 ?auto_818108 ) ) ( not ( = ?auto_818106 ?auto_818109 ) ) ( not ( = ?auto_818106 ?auto_818110 ) ) ( not ( = ?auto_818106 ?auto_818111 ) ) ( not ( = ?auto_818106 ?auto_818112 ) ) ( not ( = ?auto_818106 ?auto_818113 ) ) ( not ( = ?auto_818106 ?auto_818114 ) ) ( not ( = ?auto_818106 ?auto_818115 ) ) ( not ( = ?auto_818106 ?auto_818116 ) ) ( not ( = ?auto_818106 ?auto_818117 ) ) ( not ( = ?auto_818106 ?auto_818118 ) ) ( not ( = ?auto_818106 ?auto_818119 ) ) ( not ( = ?auto_818106 ?auto_818120 ) ) ( not ( = ?auto_818106 ?auto_818121 ) ) ( not ( = ?auto_818106 ?auto_818122 ) ) ( not ( = ?auto_818107 ?auto_818108 ) ) ( not ( = ?auto_818107 ?auto_818109 ) ) ( not ( = ?auto_818107 ?auto_818110 ) ) ( not ( = ?auto_818107 ?auto_818111 ) ) ( not ( = ?auto_818107 ?auto_818112 ) ) ( not ( = ?auto_818107 ?auto_818113 ) ) ( not ( = ?auto_818107 ?auto_818114 ) ) ( not ( = ?auto_818107 ?auto_818115 ) ) ( not ( = ?auto_818107 ?auto_818116 ) ) ( not ( = ?auto_818107 ?auto_818117 ) ) ( not ( = ?auto_818107 ?auto_818118 ) ) ( not ( = ?auto_818107 ?auto_818119 ) ) ( not ( = ?auto_818107 ?auto_818120 ) ) ( not ( = ?auto_818107 ?auto_818121 ) ) ( not ( = ?auto_818107 ?auto_818122 ) ) ( not ( = ?auto_818108 ?auto_818109 ) ) ( not ( = ?auto_818108 ?auto_818110 ) ) ( not ( = ?auto_818108 ?auto_818111 ) ) ( not ( = ?auto_818108 ?auto_818112 ) ) ( not ( = ?auto_818108 ?auto_818113 ) ) ( not ( = ?auto_818108 ?auto_818114 ) ) ( not ( = ?auto_818108 ?auto_818115 ) ) ( not ( = ?auto_818108 ?auto_818116 ) ) ( not ( = ?auto_818108 ?auto_818117 ) ) ( not ( = ?auto_818108 ?auto_818118 ) ) ( not ( = ?auto_818108 ?auto_818119 ) ) ( not ( = ?auto_818108 ?auto_818120 ) ) ( not ( = ?auto_818108 ?auto_818121 ) ) ( not ( = ?auto_818108 ?auto_818122 ) ) ( not ( = ?auto_818109 ?auto_818110 ) ) ( not ( = ?auto_818109 ?auto_818111 ) ) ( not ( = ?auto_818109 ?auto_818112 ) ) ( not ( = ?auto_818109 ?auto_818113 ) ) ( not ( = ?auto_818109 ?auto_818114 ) ) ( not ( = ?auto_818109 ?auto_818115 ) ) ( not ( = ?auto_818109 ?auto_818116 ) ) ( not ( = ?auto_818109 ?auto_818117 ) ) ( not ( = ?auto_818109 ?auto_818118 ) ) ( not ( = ?auto_818109 ?auto_818119 ) ) ( not ( = ?auto_818109 ?auto_818120 ) ) ( not ( = ?auto_818109 ?auto_818121 ) ) ( not ( = ?auto_818109 ?auto_818122 ) ) ( not ( = ?auto_818110 ?auto_818111 ) ) ( not ( = ?auto_818110 ?auto_818112 ) ) ( not ( = ?auto_818110 ?auto_818113 ) ) ( not ( = ?auto_818110 ?auto_818114 ) ) ( not ( = ?auto_818110 ?auto_818115 ) ) ( not ( = ?auto_818110 ?auto_818116 ) ) ( not ( = ?auto_818110 ?auto_818117 ) ) ( not ( = ?auto_818110 ?auto_818118 ) ) ( not ( = ?auto_818110 ?auto_818119 ) ) ( not ( = ?auto_818110 ?auto_818120 ) ) ( not ( = ?auto_818110 ?auto_818121 ) ) ( not ( = ?auto_818110 ?auto_818122 ) ) ( not ( = ?auto_818111 ?auto_818112 ) ) ( not ( = ?auto_818111 ?auto_818113 ) ) ( not ( = ?auto_818111 ?auto_818114 ) ) ( not ( = ?auto_818111 ?auto_818115 ) ) ( not ( = ?auto_818111 ?auto_818116 ) ) ( not ( = ?auto_818111 ?auto_818117 ) ) ( not ( = ?auto_818111 ?auto_818118 ) ) ( not ( = ?auto_818111 ?auto_818119 ) ) ( not ( = ?auto_818111 ?auto_818120 ) ) ( not ( = ?auto_818111 ?auto_818121 ) ) ( not ( = ?auto_818111 ?auto_818122 ) ) ( not ( = ?auto_818112 ?auto_818113 ) ) ( not ( = ?auto_818112 ?auto_818114 ) ) ( not ( = ?auto_818112 ?auto_818115 ) ) ( not ( = ?auto_818112 ?auto_818116 ) ) ( not ( = ?auto_818112 ?auto_818117 ) ) ( not ( = ?auto_818112 ?auto_818118 ) ) ( not ( = ?auto_818112 ?auto_818119 ) ) ( not ( = ?auto_818112 ?auto_818120 ) ) ( not ( = ?auto_818112 ?auto_818121 ) ) ( not ( = ?auto_818112 ?auto_818122 ) ) ( not ( = ?auto_818113 ?auto_818114 ) ) ( not ( = ?auto_818113 ?auto_818115 ) ) ( not ( = ?auto_818113 ?auto_818116 ) ) ( not ( = ?auto_818113 ?auto_818117 ) ) ( not ( = ?auto_818113 ?auto_818118 ) ) ( not ( = ?auto_818113 ?auto_818119 ) ) ( not ( = ?auto_818113 ?auto_818120 ) ) ( not ( = ?auto_818113 ?auto_818121 ) ) ( not ( = ?auto_818113 ?auto_818122 ) ) ( not ( = ?auto_818114 ?auto_818115 ) ) ( not ( = ?auto_818114 ?auto_818116 ) ) ( not ( = ?auto_818114 ?auto_818117 ) ) ( not ( = ?auto_818114 ?auto_818118 ) ) ( not ( = ?auto_818114 ?auto_818119 ) ) ( not ( = ?auto_818114 ?auto_818120 ) ) ( not ( = ?auto_818114 ?auto_818121 ) ) ( not ( = ?auto_818114 ?auto_818122 ) ) ( not ( = ?auto_818115 ?auto_818116 ) ) ( not ( = ?auto_818115 ?auto_818117 ) ) ( not ( = ?auto_818115 ?auto_818118 ) ) ( not ( = ?auto_818115 ?auto_818119 ) ) ( not ( = ?auto_818115 ?auto_818120 ) ) ( not ( = ?auto_818115 ?auto_818121 ) ) ( not ( = ?auto_818115 ?auto_818122 ) ) ( not ( = ?auto_818116 ?auto_818117 ) ) ( not ( = ?auto_818116 ?auto_818118 ) ) ( not ( = ?auto_818116 ?auto_818119 ) ) ( not ( = ?auto_818116 ?auto_818120 ) ) ( not ( = ?auto_818116 ?auto_818121 ) ) ( not ( = ?auto_818116 ?auto_818122 ) ) ( not ( = ?auto_818117 ?auto_818118 ) ) ( not ( = ?auto_818117 ?auto_818119 ) ) ( not ( = ?auto_818117 ?auto_818120 ) ) ( not ( = ?auto_818117 ?auto_818121 ) ) ( not ( = ?auto_818117 ?auto_818122 ) ) ( not ( = ?auto_818118 ?auto_818119 ) ) ( not ( = ?auto_818118 ?auto_818120 ) ) ( not ( = ?auto_818118 ?auto_818121 ) ) ( not ( = ?auto_818118 ?auto_818122 ) ) ( not ( = ?auto_818119 ?auto_818120 ) ) ( not ( = ?auto_818119 ?auto_818121 ) ) ( not ( = ?auto_818119 ?auto_818122 ) ) ( not ( = ?auto_818120 ?auto_818121 ) ) ( not ( = ?auto_818120 ?auto_818122 ) ) ( not ( = ?auto_818121 ?auto_818122 ) ) ( ON ?auto_818120 ?auto_818121 ) ( ON ?auto_818119 ?auto_818120 ) ( ON ?auto_818118 ?auto_818119 ) ( ON ?auto_818117 ?auto_818118 ) ( ON ?auto_818116 ?auto_818117 ) ( ON ?auto_818115 ?auto_818116 ) ( ON ?auto_818114 ?auto_818115 ) ( CLEAR ?auto_818112 ) ( ON ?auto_818113 ?auto_818114 ) ( CLEAR ?auto_818113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_818104 ?auto_818105 ?auto_818106 ?auto_818107 ?auto_818108 ?auto_818109 ?auto_818110 ?auto_818111 ?auto_818112 ?auto_818113 )
      ( MAKE-18PILE ?auto_818104 ?auto_818105 ?auto_818106 ?auto_818107 ?auto_818108 ?auto_818109 ?auto_818110 ?auto_818111 ?auto_818112 ?auto_818113 ?auto_818114 ?auto_818115 ?auto_818116 ?auto_818117 ?auto_818118 ?auto_818119 ?auto_818120 ?auto_818121 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818141 - BLOCK
      ?auto_818142 - BLOCK
      ?auto_818143 - BLOCK
      ?auto_818144 - BLOCK
      ?auto_818145 - BLOCK
      ?auto_818146 - BLOCK
      ?auto_818147 - BLOCK
      ?auto_818148 - BLOCK
      ?auto_818149 - BLOCK
      ?auto_818150 - BLOCK
      ?auto_818151 - BLOCK
      ?auto_818152 - BLOCK
      ?auto_818153 - BLOCK
      ?auto_818154 - BLOCK
      ?auto_818155 - BLOCK
      ?auto_818156 - BLOCK
      ?auto_818157 - BLOCK
      ?auto_818158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818158 ) ( ON-TABLE ?auto_818141 ) ( ON ?auto_818142 ?auto_818141 ) ( ON ?auto_818143 ?auto_818142 ) ( ON ?auto_818144 ?auto_818143 ) ( ON ?auto_818145 ?auto_818144 ) ( ON ?auto_818146 ?auto_818145 ) ( ON ?auto_818147 ?auto_818146 ) ( ON ?auto_818148 ?auto_818147 ) ( ON ?auto_818149 ?auto_818148 ) ( not ( = ?auto_818141 ?auto_818142 ) ) ( not ( = ?auto_818141 ?auto_818143 ) ) ( not ( = ?auto_818141 ?auto_818144 ) ) ( not ( = ?auto_818141 ?auto_818145 ) ) ( not ( = ?auto_818141 ?auto_818146 ) ) ( not ( = ?auto_818141 ?auto_818147 ) ) ( not ( = ?auto_818141 ?auto_818148 ) ) ( not ( = ?auto_818141 ?auto_818149 ) ) ( not ( = ?auto_818141 ?auto_818150 ) ) ( not ( = ?auto_818141 ?auto_818151 ) ) ( not ( = ?auto_818141 ?auto_818152 ) ) ( not ( = ?auto_818141 ?auto_818153 ) ) ( not ( = ?auto_818141 ?auto_818154 ) ) ( not ( = ?auto_818141 ?auto_818155 ) ) ( not ( = ?auto_818141 ?auto_818156 ) ) ( not ( = ?auto_818141 ?auto_818157 ) ) ( not ( = ?auto_818141 ?auto_818158 ) ) ( not ( = ?auto_818142 ?auto_818143 ) ) ( not ( = ?auto_818142 ?auto_818144 ) ) ( not ( = ?auto_818142 ?auto_818145 ) ) ( not ( = ?auto_818142 ?auto_818146 ) ) ( not ( = ?auto_818142 ?auto_818147 ) ) ( not ( = ?auto_818142 ?auto_818148 ) ) ( not ( = ?auto_818142 ?auto_818149 ) ) ( not ( = ?auto_818142 ?auto_818150 ) ) ( not ( = ?auto_818142 ?auto_818151 ) ) ( not ( = ?auto_818142 ?auto_818152 ) ) ( not ( = ?auto_818142 ?auto_818153 ) ) ( not ( = ?auto_818142 ?auto_818154 ) ) ( not ( = ?auto_818142 ?auto_818155 ) ) ( not ( = ?auto_818142 ?auto_818156 ) ) ( not ( = ?auto_818142 ?auto_818157 ) ) ( not ( = ?auto_818142 ?auto_818158 ) ) ( not ( = ?auto_818143 ?auto_818144 ) ) ( not ( = ?auto_818143 ?auto_818145 ) ) ( not ( = ?auto_818143 ?auto_818146 ) ) ( not ( = ?auto_818143 ?auto_818147 ) ) ( not ( = ?auto_818143 ?auto_818148 ) ) ( not ( = ?auto_818143 ?auto_818149 ) ) ( not ( = ?auto_818143 ?auto_818150 ) ) ( not ( = ?auto_818143 ?auto_818151 ) ) ( not ( = ?auto_818143 ?auto_818152 ) ) ( not ( = ?auto_818143 ?auto_818153 ) ) ( not ( = ?auto_818143 ?auto_818154 ) ) ( not ( = ?auto_818143 ?auto_818155 ) ) ( not ( = ?auto_818143 ?auto_818156 ) ) ( not ( = ?auto_818143 ?auto_818157 ) ) ( not ( = ?auto_818143 ?auto_818158 ) ) ( not ( = ?auto_818144 ?auto_818145 ) ) ( not ( = ?auto_818144 ?auto_818146 ) ) ( not ( = ?auto_818144 ?auto_818147 ) ) ( not ( = ?auto_818144 ?auto_818148 ) ) ( not ( = ?auto_818144 ?auto_818149 ) ) ( not ( = ?auto_818144 ?auto_818150 ) ) ( not ( = ?auto_818144 ?auto_818151 ) ) ( not ( = ?auto_818144 ?auto_818152 ) ) ( not ( = ?auto_818144 ?auto_818153 ) ) ( not ( = ?auto_818144 ?auto_818154 ) ) ( not ( = ?auto_818144 ?auto_818155 ) ) ( not ( = ?auto_818144 ?auto_818156 ) ) ( not ( = ?auto_818144 ?auto_818157 ) ) ( not ( = ?auto_818144 ?auto_818158 ) ) ( not ( = ?auto_818145 ?auto_818146 ) ) ( not ( = ?auto_818145 ?auto_818147 ) ) ( not ( = ?auto_818145 ?auto_818148 ) ) ( not ( = ?auto_818145 ?auto_818149 ) ) ( not ( = ?auto_818145 ?auto_818150 ) ) ( not ( = ?auto_818145 ?auto_818151 ) ) ( not ( = ?auto_818145 ?auto_818152 ) ) ( not ( = ?auto_818145 ?auto_818153 ) ) ( not ( = ?auto_818145 ?auto_818154 ) ) ( not ( = ?auto_818145 ?auto_818155 ) ) ( not ( = ?auto_818145 ?auto_818156 ) ) ( not ( = ?auto_818145 ?auto_818157 ) ) ( not ( = ?auto_818145 ?auto_818158 ) ) ( not ( = ?auto_818146 ?auto_818147 ) ) ( not ( = ?auto_818146 ?auto_818148 ) ) ( not ( = ?auto_818146 ?auto_818149 ) ) ( not ( = ?auto_818146 ?auto_818150 ) ) ( not ( = ?auto_818146 ?auto_818151 ) ) ( not ( = ?auto_818146 ?auto_818152 ) ) ( not ( = ?auto_818146 ?auto_818153 ) ) ( not ( = ?auto_818146 ?auto_818154 ) ) ( not ( = ?auto_818146 ?auto_818155 ) ) ( not ( = ?auto_818146 ?auto_818156 ) ) ( not ( = ?auto_818146 ?auto_818157 ) ) ( not ( = ?auto_818146 ?auto_818158 ) ) ( not ( = ?auto_818147 ?auto_818148 ) ) ( not ( = ?auto_818147 ?auto_818149 ) ) ( not ( = ?auto_818147 ?auto_818150 ) ) ( not ( = ?auto_818147 ?auto_818151 ) ) ( not ( = ?auto_818147 ?auto_818152 ) ) ( not ( = ?auto_818147 ?auto_818153 ) ) ( not ( = ?auto_818147 ?auto_818154 ) ) ( not ( = ?auto_818147 ?auto_818155 ) ) ( not ( = ?auto_818147 ?auto_818156 ) ) ( not ( = ?auto_818147 ?auto_818157 ) ) ( not ( = ?auto_818147 ?auto_818158 ) ) ( not ( = ?auto_818148 ?auto_818149 ) ) ( not ( = ?auto_818148 ?auto_818150 ) ) ( not ( = ?auto_818148 ?auto_818151 ) ) ( not ( = ?auto_818148 ?auto_818152 ) ) ( not ( = ?auto_818148 ?auto_818153 ) ) ( not ( = ?auto_818148 ?auto_818154 ) ) ( not ( = ?auto_818148 ?auto_818155 ) ) ( not ( = ?auto_818148 ?auto_818156 ) ) ( not ( = ?auto_818148 ?auto_818157 ) ) ( not ( = ?auto_818148 ?auto_818158 ) ) ( not ( = ?auto_818149 ?auto_818150 ) ) ( not ( = ?auto_818149 ?auto_818151 ) ) ( not ( = ?auto_818149 ?auto_818152 ) ) ( not ( = ?auto_818149 ?auto_818153 ) ) ( not ( = ?auto_818149 ?auto_818154 ) ) ( not ( = ?auto_818149 ?auto_818155 ) ) ( not ( = ?auto_818149 ?auto_818156 ) ) ( not ( = ?auto_818149 ?auto_818157 ) ) ( not ( = ?auto_818149 ?auto_818158 ) ) ( not ( = ?auto_818150 ?auto_818151 ) ) ( not ( = ?auto_818150 ?auto_818152 ) ) ( not ( = ?auto_818150 ?auto_818153 ) ) ( not ( = ?auto_818150 ?auto_818154 ) ) ( not ( = ?auto_818150 ?auto_818155 ) ) ( not ( = ?auto_818150 ?auto_818156 ) ) ( not ( = ?auto_818150 ?auto_818157 ) ) ( not ( = ?auto_818150 ?auto_818158 ) ) ( not ( = ?auto_818151 ?auto_818152 ) ) ( not ( = ?auto_818151 ?auto_818153 ) ) ( not ( = ?auto_818151 ?auto_818154 ) ) ( not ( = ?auto_818151 ?auto_818155 ) ) ( not ( = ?auto_818151 ?auto_818156 ) ) ( not ( = ?auto_818151 ?auto_818157 ) ) ( not ( = ?auto_818151 ?auto_818158 ) ) ( not ( = ?auto_818152 ?auto_818153 ) ) ( not ( = ?auto_818152 ?auto_818154 ) ) ( not ( = ?auto_818152 ?auto_818155 ) ) ( not ( = ?auto_818152 ?auto_818156 ) ) ( not ( = ?auto_818152 ?auto_818157 ) ) ( not ( = ?auto_818152 ?auto_818158 ) ) ( not ( = ?auto_818153 ?auto_818154 ) ) ( not ( = ?auto_818153 ?auto_818155 ) ) ( not ( = ?auto_818153 ?auto_818156 ) ) ( not ( = ?auto_818153 ?auto_818157 ) ) ( not ( = ?auto_818153 ?auto_818158 ) ) ( not ( = ?auto_818154 ?auto_818155 ) ) ( not ( = ?auto_818154 ?auto_818156 ) ) ( not ( = ?auto_818154 ?auto_818157 ) ) ( not ( = ?auto_818154 ?auto_818158 ) ) ( not ( = ?auto_818155 ?auto_818156 ) ) ( not ( = ?auto_818155 ?auto_818157 ) ) ( not ( = ?auto_818155 ?auto_818158 ) ) ( not ( = ?auto_818156 ?auto_818157 ) ) ( not ( = ?auto_818156 ?auto_818158 ) ) ( not ( = ?auto_818157 ?auto_818158 ) ) ( ON ?auto_818157 ?auto_818158 ) ( ON ?auto_818156 ?auto_818157 ) ( ON ?auto_818155 ?auto_818156 ) ( ON ?auto_818154 ?auto_818155 ) ( ON ?auto_818153 ?auto_818154 ) ( ON ?auto_818152 ?auto_818153 ) ( ON ?auto_818151 ?auto_818152 ) ( CLEAR ?auto_818149 ) ( ON ?auto_818150 ?auto_818151 ) ( CLEAR ?auto_818150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_818141 ?auto_818142 ?auto_818143 ?auto_818144 ?auto_818145 ?auto_818146 ?auto_818147 ?auto_818148 ?auto_818149 ?auto_818150 )
      ( MAKE-18PILE ?auto_818141 ?auto_818142 ?auto_818143 ?auto_818144 ?auto_818145 ?auto_818146 ?auto_818147 ?auto_818148 ?auto_818149 ?auto_818150 ?auto_818151 ?auto_818152 ?auto_818153 ?auto_818154 ?auto_818155 ?auto_818156 ?auto_818157 ?auto_818158 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818177 - BLOCK
      ?auto_818178 - BLOCK
      ?auto_818179 - BLOCK
      ?auto_818180 - BLOCK
      ?auto_818181 - BLOCK
      ?auto_818182 - BLOCK
      ?auto_818183 - BLOCK
      ?auto_818184 - BLOCK
      ?auto_818185 - BLOCK
      ?auto_818186 - BLOCK
      ?auto_818187 - BLOCK
      ?auto_818188 - BLOCK
      ?auto_818189 - BLOCK
      ?auto_818190 - BLOCK
      ?auto_818191 - BLOCK
      ?auto_818192 - BLOCK
      ?auto_818193 - BLOCK
      ?auto_818194 - BLOCK
    )
    :vars
    (
      ?auto_818195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818194 ?auto_818195 ) ( ON-TABLE ?auto_818177 ) ( ON ?auto_818178 ?auto_818177 ) ( ON ?auto_818179 ?auto_818178 ) ( ON ?auto_818180 ?auto_818179 ) ( ON ?auto_818181 ?auto_818180 ) ( ON ?auto_818182 ?auto_818181 ) ( ON ?auto_818183 ?auto_818182 ) ( ON ?auto_818184 ?auto_818183 ) ( not ( = ?auto_818177 ?auto_818178 ) ) ( not ( = ?auto_818177 ?auto_818179 ) ) ( not ( = ?auto_818177 ?auto_818180 ) ) ( not ( = ?auto_818177 ?auto_818181 ) ) ( not ( = ?auto_818177 ?auto_818182 ) ) ( not ( = ?auto_818177 ?auto_818183 ) ) ( not ( = ?auto_818177 ?auto_818184 ) ) ( not ( = ?auto_818177 ?auto_818185 ) ) ( not ( = ?auto_818177 ?auto_818186 ) ) ( not ( = ?auto_818177 ?auto_818187 ) ) ( not ( = ?auto_818177 ?auto_818188 ) ) ( not ( = ?auto_818177 ?auto_818189 ) ) ( not ( = ?auto_818177 ?auto_818190 ) ) ( not ( = ?auto_818177 ?auto_818191 ) ) ( not ( = ?auto_818177 ?auto_818192 ) ) ( not ( = ?auto_818177 ?auto_818193 ) ) ( not ( = ?auto_818177 ?auto_818194 ) ) ( not ( = ?auto_818177 ?auto_818195 ) ) ( not ( = ?auto_818178 ?auto_818179 ) ) ( not ( = ?auto_818178 ?auto_818180 ) ) ( not ( = ?auto_818178 ?auto_818181 ) ) ( not ( = ?auto_818178 ?auto_818182 ) ) ( not ( = ?auto_818178 ?auto_818183 ) ) ( not ( = ?auto_818178 ?auto_818184 ) ) ( not ( = ?auto_818178 ?auto_818185 ) ) ( not ( = ?auto_818178 ?auto_818186 ) ) ( not ( = ?auto_818178 ?auto_818187 ) ) ( not ( = ?auto_818178 ?auto_818188 ) ) ( not ( = ?auto_818178 ?auto_818189 ) ) ( not ( = ?auto_818178 ?auto_818190 ) ) ( not ( = ?auto_818178 ?auto_818191 ) ) ( not ( = ?auto_818178 ?auto_818192 ) ) ( not ( = ?auto_818178 ?auto_818193 ) ) ( not ( = ?auto_818178 ?auto_818194 ) ) ( not ( = ?auto_818178 ?auto_818195 ) ) ( not ( = ?auto_818179 ?auto_818180 ) ) ( not ( = ?auto_818179 ?auto_818181 ) ) ( not ( = ?auto_818179 ?auto_818182 ) ) ( not ( = ?auto_818179 ?auto_818183 ) ) ( not ( = ?auto_818179 ?auto_818184 ) ) ( not ( = ?auto_818179 ?auto_818185 ) ) ( not ( = ?auto_818179 ?auto_818186 ) ) ( not ( = ?auto_818179 ?auto_818187 ) ) ( not ( = ?auto_818179 ?auto_818188 ) ) ( not ( = ?auto_818179 ?auto_818189 ) ) ( not ( = ?auto_818179 ?auto_818190 ) ) ( not ( = ?auto_818179 ?auto_818191 ) ) ( not ( = ?auto_818179 ?auto_818192 ) ) ( not ( = ?auto_818179 ?auto_818193 ) ) ( not ( = ?auto_818179 ?auto_818194 ) ) ( not ( = ?auto_818179 ?auto_818195 ) ) ( not ( = ?auto_818180 ?auto_818181 ) ) ( not ( = ?auto_818180 ?auto_818182 ) ) ( not ( = ?auto_818180 ?auto_818183 ) ) ( not ( = ?auto_818180 ?auto_818184 ) ) ( not ( = ?auto_818180 ?auto_818185 ) ) ( not ( = ?auto_818180 ?auto_818186 ) ) ( not ( = ?auto_818180 ?auto_818187 ) ) ( not ( = ?auto_818180 ?auto_818188 ) ) ( not ( = ?auto_818180 ?auto_818189 ) ) ( not ( = ?auto_818180 ?auto_818190 ) ) ( not ( = ?auto_818180 ?auto_818191 ) ) ( not ( = ?auto_818180 ?auto_818192 ) ) ( not ( = ?auto_818180 ?auto_818193 ) ) ( not ( = ?auto_818180 ?auto_818194 ) ) ( not ( = ?auto_818180 ?auto_818195 ) ) ( not ( = ?auto_818181 ?auto_818182 ) ) ( not ( = ?auto_818181 ?auto_818183 ) ) ( not ( = ?auto_818181 ?auto_818184 ) ) ( not ( = ?auto_818181 ?auto_818185 ) ) ( not ( = ?auto_818181 ?auto_818186 ) ) ( not ( = ?auto_818181 ?auto_818187 ) ) ( not ( = ?auto_818181 ?auto_818188 ) ) ( not ( = ?auto_818181 ?auto_818189 ) ) ( not ( = ?auto_818181 ?auto_818190 ) ) ( not ( = ?auto_818181 ?auto_818191 ) ) ( not ( = ?auto_818181 ?auto_818192 ) ) ( not ( = ?auto_818181 ?auto_818193 ) ) ( not ( = ?auto_818181 ?auto_818194 ) ) ( not ( = ?auto_818181 ?auto_818195 ) ) ( not ( = ?auto_818182 ?auto_818183 ) ) ( not ( = ?auto_818182 ?auto_818184 ) ) ( not ( = ?auto_818182 ?auto_818185 ) ) ( not ( = ?auto_818182 ?auto_818186 ) ) ( not ( = ?auto_818182 ?auto_818187 ) ) ( not ( = ?auto_818182 ?auto_818188 ) ) ( not ( = ?auto_818182 ?auto_818189 ) ) ( not ( = ?auto_818182 ?auto_818190 ) ) ( not ( = ?auto_818182 ?auto_818191 ) ) ( not ( = ?auto_818182 ?auto_818192 ) ) ( not ( = ?auto_818182 ?auto_818193 ) ) ( not ( = ?auto_818182 ?auto_818194 ) ) ( not ( = ?auto_818182 ?auto_818195 ) ) ( not ( = ?auto_818183 ?auto_818184 ) ) ( not ( = ?auto_818183 ?auto_818185 ) ) ( not ( = ?auto_818183 ?auto_818186 ) ) ( not ( = ?auto_818183 ?auto_818187 ) ) ( not ( = ?auto_818183 ?auto_818188 ) ) ( not ( = ?auto_818183 ?auto_818189 ) ) ( not ( = ?auto_818183 ?auto_818190 ) ) ( not ( = ?auto_818183 ?auto_818191 ) ) ( not ( = ?auto_818183 ?auto_818192 ) ) ( not ( = ?auto_818183 ?auto_818193 ) ) ( not ( = ?auto_818183 ?auto_818194 ) ) ( not ( = ?auto_818183 ?auto_818195 ) ) ( not ( = ?auto_818184 ?auto_818185 ) ) ( not ( = ?auto_818184 ?auto_818186 ) ) ( not ( = ?auto_818184 ?auto_818187 ) ) ( not ( = ?auto_818184 ?auto_818188 ) ) ( not ( = ?auto_818184 ?auto_818189 ) ) ( not ( = ?auto_818184 ?auto_818190 ) ) ( not ( = ?auto_818184 ?auto_818191 ) ) ( not ( = ?auto_818184 ?auto_818192 ) ) ( not ( = ?auto_818184 ?auto_818193 ) ) ( not ( = ?auto_818184 ?auto_818194 ) ) ( not ( = ?auto_818184 ?auto_818195 ) ) ( not ( = ?auto_818185 ?auto_818186 ) ) ( not ( = ?auto_818185 ?auto_818187 ) ) ( not ( = ?auto_818185 ?auto_818188 ) ) ( not ( = ?auto_818185 ?auto_818189 ) ) ( not ( = ?auto_818185 ?auto_818190 ) ) ( not ( = ?auto_818185 ?auto_818191 ) ) ( not ( = ?auto_818185 ?auto_818192 ) ) ( not ( = ?auto_818185 ?auto_818193 ) ) ( not ( = ?auto_818185 ?auto_818194 ) ) ( not ( = ?auto_818185 ?auto_818195 ) ) ( not ( = ?auto_818186 ?auto_818187 ) ) ( not ( = ?auto_818186 ?auto_818188 ) ) ( not ( = ?auto_818186 ?auto_818189 ) ) ( not ( = ?auto_818186 ?auto_818190 ) ) ( not ( = ?auto_818186 ?auto_818191 ) ) ( not ( = ?auto_818186 ?auto_818192 ) ) ( not ( = ?auto_818186 ?auto_818193 ) ) ( not ( = ?auto_818186 ?auto_818194 ) ) ( not ( = ?auto_818186 ?auto_818195 ) ) ( not ( = ?auto_818187 ?auto_818188 ) ) ( not ( = ?auto_818187 ?auto_818189 ) ) ( not ( = ?auto_818187 ?auto_818190 ) ) ( not ( = ?auto_818187 ?auto_818191 ) ) ( not ( = ?auto_818187 ?auto_818192 ) ) ( not ( = ?auto_818187 ?auto_818193 ) ) ( not ( = ?auto_818187 ?auto_818194 ) ) ( not ( = ?auto_818187 ?auto_818195 ) ) ( not ( = ?auto_818188 ?auto_818189 ) ) ( not ( = ?auto_818188 ?auto_818190 ) ) ( not ( = ?auto_818188 ?auto_818191 ) ) ( not ( = ?auto_818188 ?auto_818192 ) ) ( not ( = ?auto_818188 ?auto_818193 ) ) ( not ( = ?auto_818188 ?auto_818194 ) ) ( not ( = ?auto_818188 ?auto_818195 ) ) ( not ( = ?auto_818189 ?auto_818190 ) ) ( not ( = ?auto_818189 ?auto_818191 ) ) ( not ( = ?auto_818189 ?auto_818192 ) ) ( not ( = ?auto_818189 ?auto_818193 ) ) ( not ( = ?auto_818189 ?auto_818194 ) ) ( not ( = ?auto_818189 ?auto_818195 ) ) ( not ( = ?auto_818190 ?auto_818191 ) ) ( not ( = ?auto_818190 ?auto_818192 ) ) ( not ( = ?auto_818190 ?auto_818193 ) ) ( not ( = ?auto_818190 ?auto_818194 ) ) ( not ( = ?auto_818190 ?auto_818195 ) ) ( not ( = ?auto_818191 ?auto_818192 ) ) ( not ( = ?auto_818191 ?auto_818193 ) ) ( not ( = ?auto_818191 ?auto_818194 ) ) ( not ( = ?auto_818191 ?auto_818195 ) ) ( not ( = ?auto_818192 ?auto_818193 ) ) ( not ( = ?auto_818192 ?auto_818194 ) ) ( not ( = ?auto_818192 ?auto_818195 ) ) ( not ( = ?auto_818193 ?auto_818194 ) ) ( not ( = ?auto_818193 ?auto_818195 ) ) ( not ( = ?auto_818194 ?auto_818195 ) ) ( ON ?auto_818193 ?auto_818194 ) ( ON ?auto_818192 ?auto_818193 ) ( ON ?auto_818191 ?auto_818192 ) ( ON ?auto_818190 ?auto_818191 ) ( ON ?auto_818189 ?auto_818190 ) ( ON ?auto_818188 ?auto_818189 ) ( ON ?auto_818187 ?auto_818188 ) ( ON ?auto_818186 ?auto_818187 ) ( CLEAR ?auto_818184 ) ( ON ?auto_818185 ?auto_818186 ) ( CLEAR ?auto_818185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_818177 ?auto_818178 ?auto_818179 ?auto_818180 ?auto_818181 ?auto_818182 ?auto_818183 ?auto_818184 ?auto_818185 )
      ( MAKE-18PILE ?auto_818177 ?auto_818178 ?auto_818179 ?auto_818180 ?auto_818181 ?auto_818182 ?auto_818183 ?auto_818184 ?auto_818185 ?auto_818186 ?auto_818187 ?auto_818188 ?auto_818189 ?auto_818190 ?auto_818191 ?auto_818192 ?auto_818193 ?auto_818194 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818214 - BLOCK
      ?auto_818215 - BLOCK
      ?auto_818216 - BLOCK
      ?auto_818217 - BLOCK
      ?auto_818218 - BLOCK
      ?auto_818219 - BLOCK
      ?auto_818220 - BLOCK
      ?auto_818221 - BLOCK
      ?auto_818222 - BLOCK
      ?auto_818223 - BLOCK
      ?auto_818224 - BLOCK
      ?auto_818225 - BLOCK
      ?auto_818226 - BLOCK
      ?auto_818227 - BLOCK
      ?auto_818228 - BLOCK
      ?auto_818229 - BLOCK
      ?auto_818230 - BLOCK
      ?auto_818231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818231 ) ( ON-TABLE ?auto_818214 ) ( ON ?auto_818215 ?auto_818214 ) ( ON ?auto_818216 ?auto_818215 ) ( ON ?auto_818217 ?auto_818216 ) ( ON ?auto_818218 ?auto_818217 ) ( ON ?auto_818219 ?auto_818218 ) ( ON ?auto_818220 ?auto_818219 ) ( ON ?auto_818221 ?auto_818220 ) ( not ( = ?auto_818214 ?auto_818215 ) ) ( not ( = ?auto_818214 ?auto_818216 ) ) ( not ( = ?auto_818214 ?auto_818217 ) ) ( not ( = ?auto_818214 ?auto_818218 ) ) ( not ( = ?auto_818214 ?auto_818219 ) ) ( not ( = ?auto_818214 ?auto_818220 ) ) ( not ( = ?auto_818214 ?auto_818221 ) ) ( not ( = ?auto_818214 ?auto_818222 ) ) ( not ( = ?auto_818214 ?auto_818223 ) ) ( not ( = ?auto_818214 ?auto_818224 ) ) ( not ( = ?auto_818214 ?auto_818225 ) ) ( not ( = ?auto_818214 ?auto_818226 ) ) ( not ( = ?auto_818214 ?auto_818227 ) ) ( not ( = ?auto_818214 ?auto_818228 ) ) ( not ( = ?auto_818214 ?auto_818229 ) ) ( not ( = ?auto_818214 ?auto_818230 ) ) ( not ( = ?auto_818214 ?auto_818231 ) ) ( not ( = ?auto_818215 ?auto_818216 ) ) ( not ( = ?auto_818215 ?auto_818217 ) ) ( not ( = ?auto_818215 ?auto_818218 ) ) ( not ( = ?auto_818215 ?auto_818219 ) ) ( not ( = ?auto_818215 ?auto_818220 ) ) ( not ( = ?auto_818215 ?auto_818221 ) ) ( not ( = ?auto_818215 ?auto_818222 ) ) ( not ( = ?auto_818215 ?auto_818223 ) ) ( not ( = ?auto_818215 ?auto_818224 ) ) ( not ( = ?auto_818215 ?auto_818225 ) ) ( not ( = ?auto_818215 ?auto_818226 ) ) ( not ( = ?auto_818215 ?auto_818227 ) ) ( not ( = ?auto_818215 ?auto_818228 ) ) ( not ( = ?auto_818215 ?auto_818229 ) ) ( not ( = ?auto_818215 ?auto_818230 ) ) ( not ( = ?auto_818215 ?auto_818231 ) ) ( not ( = ?auto_818216 ?auto_818217 ) ) ( not ( = ?auto_818216 ?auto_818218 ) ) ( not ( = ?auto_818216 ?auto_818219 ) ) ( not ( = ?auto_818216 ?auto_818220 ) ) ( not ( = ?auto_818216 ?auto_818221 ) ) ( not ( = ?auto_818216 ?auto_818222 ) ) ( not ( = ?auto_818216 ?auto_818223 ) ) ( not ( = ?auto_818216 ?auto_818224 ) ) ( not ( = ?auto_818216 ?auto_818225 ) ) ( not ( = ?auto_818216 ?auto_818226 ) ) ( not ( = ?auto_818216 ?auto_818227 ) ) ( not ( = ?auto_818216 ?auto_818228 ) ) ( not ( = ?auto_818216 ?auto_818229 ) ) ( not ( = ?auto_818216 ?auto_818230 ) ) ( not ( = ?auto_818216 ?auto_818231 ) ) ( not ( = ?auto_818217 ?auto_818218 ) ) ( not ( = ?auto_818217 ?auto_818219 ) ) ( not ( = ?auto_818217 ?auto_818220 ) ) ( not ( = ?auto_818217 ?auto_818221 ) ) ( not ( = ?auto_818217 ?auto_818222 ) ) ( not ( = ?auto_818217 ?auto_818223 ) ) ( not ( = ?auto_818217 ?auto_818224 ) ) ( not ( = ?auto_818217 ?auto_818225 ) ) ( not ( = ?auto_818217 ?auto_818226 ) ) ( not ( = ?auto_818217 ?auto_818227 ) ) ( not ( = ?auto_818217 ?auto_818228 ) ) ( not ( = ?auto_818217 ?auto_818229 ) ) ( not ( = ?auto_818217 ?auto_818230 ) ) ( not ( = ?auto_818217 ?auto_818231 ) ) ( not ( = ?auto_818218 ?auto_818219 ) ) ( not ( = ?auto_818218 ?auto_818220 ) ) ( not ( = ?auto_818218 ?auto_818221 ) ) ( not ( = ?auto_818218 ?auto_818222 ) ) ( not ( = ?auto_818218 ?auto_818223 ) ) ( not ( = ?auto_818218 ?auto_818224 ) ) ( not ( = ?auto_818218 ?auto_818225 ) ) ( not ( = ?auto_818218 ?auto_818226 ) ) ( not ( = ?auto_818218 ?auto_818227 ) ) ( not ( = ?auto_818218 ?auto_818228 ) ) ( not ( = ?auto_818218 ?auto_818229 ) ) ( not ( = ?auto_818218 ?auto_818230 ) ) ( not ( = ?auto_818218 ?auto_818231 ) ) ( not ( = ?auto_818219 ?auto_818220 ) ) ( not ( = ?auto_818219 ?auto_818221 ) ) ( not ( = ?auto_818219 ?auto_818222 ) ) ( not ( = ?auto_818219 ?auto_818223 ) ) ( not ( = ?auto_818219 ?auto_818224 ) ) ( not ( = ?auto_818219 ?auto_818225 ) ) ( not ( = ?auto_818219 ?auto_818226 ) ) ( not ( = ?auto_818219 ?auto_818227 ) ) ( not ( = ?auto_818219 ?auto_818228 ) ) ( not ( = ?auto_818219 ?auto_818229 ) ) ( not ( = ?auto_818219 ?auto_818230 ) ) ( not ( = ?auto_818219 ?auto_818231 ) ) ( not ( = ?auto_818220 ?auto_818221 ) ) ( not ( = ?auto_818220 ?auto_818222 ) ) ( not ( = ?auto_818220 ?auto_818223 ) ) ( not ( = ?auto_818220 ?auto_818224 ) ) ( not ( = ?auto_818220 ?auto_818225 ) ) ( not ( = ?auto_818220 ?auto_818226 ) ) ( not ( = ?auto_818220 ?auto_818227 ) ) ( not ( = ?auto_818220 ?auto_818228 ) ) ( not ( = ?auto_818220 ?auto_818229 ) ) ( not ( = ?auto_818220 ?auto_818230 ) ) ( not ( = ?auto_818220 ?auto_818231 ) ) ( not ( = ?auto_818221 ?auto_818222 ) ) ( not ( = ?auto_818221 ?auto_818223 ) ) ( not ( = ?auto_818221 ?auto_818224 ) ) ( not ( = ?auto_818221 ?auto_818225 ) ) ( not ( = ?auto_818221 ?auto_818226 ) ) ( not ( = ?auto_818221 ?auto_818227 ) ) ( not ( = ?auto_818221 ?auto_818228 ) ) ( not ( = ?auto_818221 ?auto_818229 ) ) ( not ( = ?auto_818221 ?auto_818230 ) ) ( not ( = ?auto_818221 ?auto_818231 ) ) ( not ( = ?auto_818222 ?auto_818223 ) ) ( not ( = ?auto_818222 ?auto_818224 ) ) ( not ( = ?auto_818222 ?auto_818225 ) ) ( not ( = ?auto_818222 ?auto_818226 ) ) ( not ( = ?auto_818222 ?auto_818227 ) ) ( not ( = ?auto_818222 ?auto_818228 ) ) ( not ( = ?auto_818222 ?auto_818229 ) ) ( not ( = ?auto_818222 ?auto_818230 ) ) ( not ( = ?auto_818222 ?auto_818231 ) ) ( not ( = ?auto_818223 ?auto_818224 ) ) ( not ( = ?auto_818223 ?auto_818225 ) ) ( not ( = ?auto_818223 ?auto_818226 ) ) ( not ( = ?auto_818223 ?auto_818227 ) ) ( not ( = ?auto_818223 ?auto_818228 ) ) ( not ( = ?auto_818223 ?auto_818229 ) ) ( not ( = ?auto_818223 ?auto_818230 ) ) ( not ( = ?auto_818223 ?auto_818231 ) ) ( not ( = ?auto_818224 ?auto_818225 ) ) ( not ( = ?auto_818224 ?auto_818226 ) ) ( not ( = ?auto_818224 ?auto_818227 ) ) ( not ( = ?auto_818224 ?auto_818228 ) ) ( not ( = ?auto_818224 ?auto_818229 ) ) ( not ( = ?auto_818224 ?auto_818230 ) ) ( not ( = ?auto_818224 ?auto_818231 ) ) ( not ( = ?auto_818225 ?auto_818226 ) ) ( not ( = ?auto_818225 ?auto_818227 ) ) ( not ( = ?auto_818225 ?auto_818228 ) ) ( not ( = ?auto_818225 ?auto_818229 ) ) ( not ( = ?auto_818225 ?auto_818230 ) ) ( not ( = ?auto_818225 ?auto_818231 ) ) ( not ( = ?auto_818226 ?auto_818227 ) ) ( not ( = ?auto_818226 ?auto_818228 ) ) ( not ( = ?auto_818226 ?auto_818229 ) ) ( not ( = ?auto_818226 ?auto_818230 ) ) ( not ( = ?auto_818226 ?auto_818231 ) ) ( not ( = ?auto_818227 ?auto_818228 ) ) ( not ( = ?auto_818227 ?auto_818229 ) ) ( not ( = ?auto_818227 ?auto_818230 ) ) ( not ( = ?auto_818227 ?auto_818231 ) ) ( not ( = ?auto_818228 ?auto_818229 ) ) ( not ( = ?auto_818228 ?auto_818230 ) ) ( not ( = ?auto_818228 ?auto_818231 ) ) ( not ( = ?auto_818229 ?auto_818230 ) ) ( not ( = ?auto_818229 ?auto_818231 ) ) ( not ( = ?auto_818230 ?auto_818231 ) ) ( ON ?auto_818230 ?auto_818231 ) ( ON ?auto_818229 ?auto_818230 ) ( ON ?auto_818228 ?auto_818229 ) ( ON ?auto_818227 ?auto_818228 ) ( ON ?auto_818226 ?auto_818227 ) ( ON ?auto_818225 ?auto_818226 ) ( ON ?auto_818224 ?auto_818225 ) ( ON ?auto_818223 ?auto_818224 ) ( CLEAR ?auto_818221 ) ( ON ?auto_818222 ?auto_818223 ) ( CLEAR ?auto_818222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_818214 ?auto_818215 ?auto_818216 ?auto_818217 ?auto_818218 ?auto_818219 ?auto_818220 ?auto_818221 ?auto_818222 )
      ( MAKE-18PILE ?auto_818214 ?auto_818215 ?auto_818216 ?auto_818217 ?auto_818218 ?auto_818219 ?auto_818220 ?auto_818221 ?auto_818222 ?auto_818223 ?auto_818224 ?auto_818225 ?auto_818226 ?auto_818227 ?auto_818228 ?auto_818229 ?auto_818230 ?auto_818231 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818250 - BLOCK
      ?auto_818251 - BLOCK
      ?auto_818252 - BLOCK
      ?auto_818253 - BLOCK
      ?auto_818254 - BLOCK
      ?auto_818255 - BLOCK
      ?auto_818256 - BLOCK
      ?auto_818257 - BLOCK
      ?auto_818258 - BLOCK
      ?auto_818259 - BLOCK
      ?auto_818260 - BLOCK
      ?auto_818261 - BLOCK
      ?auto_818262 - BLOCK
      ?auto_818263 - BLOCK
      ?auto_818264 - BLOCK
      ?auto_818265 - BLOCK
      ?auto_818266 - BLOCK
      ?auto_818267 - BLOCK
    )
    :vars
    (
      ?auto_818268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818267 ?auto_818268 ) ( ON-TABLE ?auto_818250 ) ( ON ?auto_818251 ?auto_818250 ) ( ON ?auto_818252 ?auto_818251 ) ( ON ?auto_818253 ?auto_818252 ) ( ON ?auto_818254 ?auto_818253 ) ( ON ?auto_818255 ?auto_818254 ) ( ON ?auto_818256 ?auto_818255 ) ( not ( = ?auto_818250 ?auto_818251 ) ) ( not ( = ?auto_818250 ?auto_818252 ) ) ( not ( = ?auto_818250 ?auto_818253 ) ) ( not ( = ?auto_818250 ?auto_818254 ) ) ( not ( = ?auto_818250 ?auto_818255 ) ) ( not ( = ?auto_818250 ?auto_818256 ) ) ( not ( = ?auto_818250 ?auto_818257 ) ) ( not ( = ?auto_818250 ?auto_818258 ) ) ( not ( = ?auto_818250 ?auto_818259 ) ) ( not ( = ?auto_818250 ?auto_818260 ) ) ( not ( = ?auto_818250 ?auto_818261 ) ) ( not ( = ?auto_818250 ?auto_818262 ) ) ( not ( = ?auto_818250 ?auto_818263 ) ) ( not ( = ?auto_818250 ?auto_818264 ) ) ( not ( = ?auto_818250 ?auto_818265 ) ) ( not ( = ?auto_818250 ?auto_818266 ) ) ( not ( = ?auto_818250 ?auto_818267 ) ) ( not ( = ?auto_818250 ?auto_818268 ) ) ( not ( = ?auto_818251 ?auto_818252 ) ) ( not ( = ?auto_818251 ?auto_818253 ) ) ( not ( = ?auto_818251 ?auto_818254 ) ) ( not ( = ?auto_818251 ?auto_818255 ) ) ( not ( = ?auto_818251 ?auto_818256 ) ) ( not ( = ?auto_818251 ?auto_818257 ) ) ( not ( = ?auto_818251 ?auto_818258 ) ) ( not ( = ?auto_818251 ?auto_818259 ) ) ( not ( = ?auto_818251 ?auto_818260 ) ) ( not ( = ?auto_818251 ?auto_818261 ) ) ( not ( = ?auto_818251 ?auto_818262 ) ) ( not ( = ?auto_818251 ?auto_818263 ) ) ( not ( = ?auto_818251 ?auto_818264 ) ) ( not ( = ?auto_818251 ?auto_818265 ) ) ( not ( = ?auto_818251 ?auto_818266 ) ) ( not ( = ?auto_818251 ?auto_818267 ) ) ( not ( = ?auto_818251 ?auto_818268 ) ) ( not ( = ?auto_818252 ?auto_818253 ) ) ( not ( = ?auto_818252 ?auto_818254 ) ) ( not ( = ?auto_818252 ?auto_818255 ) ) ( not ( = ?auto_818252 ?auto_818256 ) ) ( not ( = ?auto_818252 ?auto_818257 ) ) ( not ( = ?auto_818252 ?auto_818258 ) ) ( not ( = ?auto_818252 ?auto_818259 ) ) ( not ( = ?auto_818252 ?auto_818260 ) ) ( not ( = ?auto_818252 ?auto_818261 ) ) ( not ( = ?auto_818252 ?auto_818262 ) ) ( not ( = ?auto_818252 ?auto_818263 ) ) ( not ( = ?auto_818252 ?auto_818264 ) ) ( not ( = ?auto_818252 ?auto_818265 ) ) ( not ( = ?auto_818252 ?auto_818266 ) ) ( not ( = ?auto_818252 ?auto_818267 ) ) ( not ( = ?auto_818252 ?auto_818268 ) ) ( not ( = ?auto_818253 ?auto_818254 ) ) ( not ( = ?auto_818253 ?auto_818255 ) ) ( not ( = ?auto_818253 ?auto_818256 ) ) ( not ( = ?auto_818253 ?auto_818257 ) ) ( not ( = ?auto_818253 ?auto_818258 ) ) ( not ( = ?auto_818253 ?auto_818259 ) ) ( not ( = ?auto_818253 ?auto_818260 ) ) ( not ( = ?auto_818253 ?auto_818261 ) ) ( not ( = ?auto_818253 ?auto_818262 ) ) ( not ( = ?auto_818253 ?auto_818263 ) ) ( not ( = ?auto_818253 ?auto_818264 ) ) ( not ( = ?auto_818253 ?auto_818265 ) ) ( not ( = ?auto_818253 ?auto_818266 ) ) ( not ( = ?auto_818253 ?auto_818267 ) ) ( not ( = ?auto_818253 ?auto_818268 ) ) ( not ( = ?auto_818254 ?auto_818255 ) ) ( not ( = ?auto_818254 ?auto_818256 ) ) ( not ( = ?auto_818254 ?auto_818257 ) ) ( not ( = ?auto_818254 ?auto_818258 ) ) ( not ( = ?auto_818254 ?auto_818259 ) ) ( not ( = ?auto_818254 ?auto_818260 ) ) ( not ( = ?auto_818254 ?auto_818261 ) ) ( not ( = ?auto_818254 ?auto_818262 ) ) ( not ( = ?auto_818254 ?auto_818263 ) ) ( not ( = ?auto_818254 ?auto_818264 ) ) ( not ( = ?auto_818254 ?auto_818265 ) ) ( not ( = ?auto_818254 ?auto_818266 ) ) ( not ( = ?auto_818254 ?auto_818267 ) ) ( not ( = ?auto_818254 ?auto_818268 ) ) ( not ( = ?auto_818255 ?auto_818256 ) ) ( not ( = ?auto_818255 ?auto_818257 ) ) ( not ( = ?auto_818255 ?auto_818258 ) ) ( not ( = ?auto_818255 ?auto_818259 ) ) ( not ( = ?auto_818255 ?auto_818260 ) ) ( not ( = ?auto_818255 ?auto_818261 ) ) ( not ( = ?auto_818255 ?auto_818262 ) ) ( not ( = ?auto_818255 ?auto_818263 ) ) ( not ( = ?auto_818255 ?auto_818264 ) ) ( not ( = ?auto_818255 ?auto_818265 ) ) ( not ( = ?auto_818255 ?auto_818266 ) ) ( not ( = ?auto_818255 ?auto_818267 ) ) ( not ( = ?auto_818255 ?auto_818268 ) ) ( not ( = ?auto_818256 ?auto_818257 ) ) ( not ( = ?auto_818256 ?auto_818258 ) ) ( not ( = ?auto_818256 ?auto_818259 ) ) ( not ( = ?auto_818256 ?auto_818260 ) ) ( not ( = ?auto_818256 ?auto_818261 ) ) ( not ( = ?auto_818256 ?auto_818262 ) ) ( not ( = ?auto_818256 ?auto_818263 ) ) ( not ( = ?auto_818256 ?auto_818264 ) ) ( not ( = ?auto_818256 ?auto_818265 ) ) ( not ( = ?auto_818256 ?auto_818266 ) ) ( not ( = ?auto_818256 ?auto_818267 ) ) ( not ( = ?auto_818256 ?auto_818268 ) ) ( not ( = ?auto_818257 ?auto_818258 ) ) ( not ( = ?auto_818257 ?auto_818259 ) ) ( not ( = ?auto_818257 ?auto_818260 ) ) ( not ( = ?auto_818257 ?auto_818261 ) ) ( not ( = ?auto_818257 ?auto_818262 ) ) ( not ( = ?auto_818257 ?auto_818263 ) ) ( not ( = ?auto_818257 ?auto_818264 ) ) ( not ( = ?auto_818257 ?auto_818265 ) ) ( not ( = ?auto_818257 ?auto_818266 ) ) ( not ( = ?auto_818257 ?auto_818267 ) ) ( not ( = ?auto_818257 ?auto_818268 ) ) ( not ( = ?auto_818258 ?auto_818259 ) ) ( not ( = ?auto_818258 ?auto_818260 ) ) ( not ( = ?auto_818258 ?auto_818261 ) ) ( not ( = ?auto_818258 ?auto_818262 ) ) ( not ( = ?auto_818258 ?auto_818263 ) ) ( not ( = ?auto_818258 ?auto_818264 ) ) ( not ( = ?auto_818258 ?auto_818265 ) ) ( not ( = ?auto_818258 ?auto_818266 ) ) ( not ( = ?auto_818258 ?auto_818267 ) ) ( not ( = ?auto_818258 ?auto_818268 ) ) ( not ( = ?auto_818259 ?auto_818260 ) ) ( not ( = ?auto_818259 ?auto_818261 ) ) ( not ( = ?auto_818259 ?auto_818262 ) ) ( not ( = ?auto_818259 ?auto_818263 ) ) ( not ( = ?auto_818259 ?auto_818264 ) ) ( not ( = ?auto_818259 ?auto_818265 ) ) ( not ( = ?auto_818259 ?auto_818266 ) ) ( not ( = ?auto_818259 ?auto_818267 ) ) ( not ( = ?auto_818259 ?auto_818268 ) ) ( not ( = ?auto_818260 ?auto_818261 ) ) ( not ( = ?auto_818260 ?auto_818262 ) ) ( not ( = ?auto_818260 ?auto_818263 ) ) ( not ( = ?auto_818260 ?auto_818264 ) ) ( not ( = ?auto_818260 ?auto_818265 ) ) ( not ( = ?auto_818260 ?auto_818266 ) ) ( not ( = ?auto_818260 ?auto_818267 ) ) ( not ( = ?auto_818260 ?auto_818268 ) ) ( not ( = ?auto_818261 ?auto_818262 ) ) ( not ( = ?auto_818261 ?auto_818263 ) ) ( not ( = ?auto_818261 ?auto_818264 ) ) ( not ( = ?auto_818261 ?auto_818265 ) ) ( not ( = ?auto_818261 ?auto_818266 ) ) ( not ( = ?auto_818261 ?auto_818267 ) ) ( not ( = ?auto_818261 ?auto_818268 ) ) ( not ( = ?auto_818262 ?auto_818263 ) ) ( not ( = ?auto_818262 ?auto_818264 ) ) ( not ( = ?auto_818262 ?auto_818265 ) ) ( not ( = ?auto_818262 ?auto_818266 ) ) ( not ( = ?auto_818262 ?auto_818267 ) ) ( not ( = ?auto_818262 ?auto_818268 ) ) ( not ( = ?auto_818263 ?auto_818264 ) ) ( not ( = ?auto_818263 ?auto_818265 ) ) ( not ( = ?auto_818263 ?auto_818266 ) ) ( not ( = ?auto_818263 ?auto_818267 ) ) ( not ( = ?auto_818263 ?auto_818268 ) ) ( not ( = ?auto_818264 ?auto_818265 ) ) ( not ( = ?auto_818264 ?auto_818266 ) ) ( not ( = ?auto_818264 ?auto_818267 ) ) ( not ( = ?auto_818264 ?auto_818268 ) ) ( not ( = ?auto_818265 ?auto_818266 ) ) ( not ( = ?auto_818265 ?auto_818267 ) ) ( not ( = ?auto_818265 ?auto_818268 ) ) ( not ( = ?auto_818266 ?auto_818267 ) ) ( not ( = ?auto_818266 ?auto_818268 ) ) ( not ( = ?auto_818267 ?auto_818268 ) ) ( ON ?auto_818266 ?auto_818267 ) ( ON ?auto_818265 ?auto_818266 ) ( ON ?auto_818264 ?auto_818265 ) ( ON ?auto_818263 ?auto_818264 ) ( ON ?auto_818262 ?auto_818263 ) ( ON ?auto_818261 ?auto_818262 ) ( ON ?auto_818260 ?auto_818261 ) ( ON ?auto_818259 ?auto_818260 ) ( ON ?auto_818258 ?auto_818259 ) ( CLEAR ?auto_818256 ) ( ON ?auto_818257 ?auto_818258 ) ( CLEAR ?auto_818257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_818250 ?auto_818251 ?auto_818252 ?auto_818253 ?auto_818254 ?auto_818255 ?auto_818256 ?auto_818257 )
      ( MAKE-18PILE ?auto_818250 ?auto_818251 ?auto_818252 ?auto_818253 ?auto_818254 ?auto_818255 ?auto_818256 ?auto_818257 ?auto_818258 ?auto_818259 ?auto_818260 ?auto_818261 ?auto_818262 ?auto_818263 ?auto_818264 ?auto_818265 ?auto_818266 ?auto_818267 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818287 - BLOCK
      ?auto_818288 - BLOCK
      ?auto_818289 - BLOCK
      ?auto_818290 - BLOCK
      ?auto_818291 - BLOCK
      ?auto_818292 - BLOCK
      ?auto_818293 - BLOCK
      ?auto_818294 - BLOCK
      ?auto_818295 - BLOCK
      ?auto_818296 - BLOCK
      ?auto_818297 - BLOCK
      ?auto_818298 - BLOCK
      ?auto_818299 - BLOCK
      ?auto_818300 - BLOCK
      ?auto_818301 - BLOCK
      ?auto_818302 - BLOCK
      ?auto_818303 - BLOCK
      ?auto_818304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818304 ) ( ON-TABLE ?auto_818287 ) ( ON ?auto_818288 ?auto_818287 ) ( ON ?auto_818289 ?auto_818288 ) ( ON ?auto_818290 ?auto_818289 ) ( ON ?auto_818291 ?auto_818290 ) ( ON ?auto_818292 ?auto_818291 ) ( ON ?auto_818293 ?auto_818292 ) ( not ( = ?auto_818287 ?auto_818288 ) ) ( not ( = ?auto_818287 ?auto_818289 ) ) ( not ( = ?auto_818287 ?auto_818290 ) ) ( not ( = ?auto_818287 ?auto_818291 ) ) ( not ( = ?auto_818287 ?auto_818292 ) ) ( not ( = ?auto_818287 ?auto_818293 ) ) ( not ( = ?auto_818287 ?auto_818294 ) ) ( not ( = ?auto_818287 ?auto_818295 ) ) ( not ( = ?auto_818287 ?auto_818296 ) ) ( not ( = ?auto_818287 ?auto_818297 ) ) ( not ( = ?auto_818287 ?auto_818298 ) ) ( not ( = ?auto_818287 ?auto_818299 ) ) ( not ( = ?auto_818287 ?auto_818300 ) ) ( not ( = ?auto_818287 ?auto_818301 ) ) ( not ( = ?auto_818287 ?auto_818302 ) ) ( not ( = ?auto_818287 ?auto_818303 ) ) ( not ( = ?auto_818287 ?auto_818304 ) ) ( not ( = ?auto_818288 ?auto_818289 ) ) ( not ( = ?auto_818288 ?auto_818290 ) ) ( not ( = ?auto_818288 ?auto_818291 ) ) ( not ( = ?auto_818288 ?auto_818292 ) ) ( not ( = ?auto_818288 ?auto_818293 ) ) ( not ( = ?auto_818288 ?auto_818294 ) ) ( not ( = ?auto_818288 ?auto_818295 ) ) ( not ( = ?auto_818288 ?auto_818296 ) ) ( not ( = ?auto_818288 ?auto_818297 ) ) ( not ( = ?auto_818288 ?auto_818298 ) ) ( not ( = ?auto_818288 ?auto_818299 ) ) ( not ( = ?auto_818288 ?auto_818300 ) ) ( not ( = ?auto_818288 ?auto_818301 ) ) ( not ( = ?auto_818288 ?auto_818302 ) ) ( not ( = ?auto_818288 ?auto_818303 ) ) ( not ( = ?auto_818288 ?auto_818304 ) ) ( not ( = ?auto_818289 ?auto_818290 ) ) ( not ( = ?auto_818289 ?auto_818291 ) ) ( not ( = ?auto_818289 ?auto_818292 ) ) ( not ( = ?auto_818289 ?auto_818293 ) ) ( not ( = ?auto_818289 ?auto_818294 ) ) ( not ( = ?auto_818289 ?auto_818295 ) ) ( not ( = ?auto_818289 ?auto_818296 ) ) ( not ( = ?auto_818289 ?auto_818297 ) ) ( not ( = ?auto_818289 ?auto_818298 ) ) ( not ( = ?auto_818289 ?auto_818299 ) ) ( not ( = ?auto_818289 ?auto_818300 ) ) ( not ( = ?auto_818289 ?auto_818301 ) ) ( not ( = ?auto_818289 ?auto_818302 ) ) ( not ( = ?auto_818289 ?auto_818303 ) ) ( not ( = ?auto_818289 ?auto_818304 ) ) ( not ( = ?auto_818290 ?auto_818291 ) ) ( not ( = ?auto_818290 ?auto_818292 ) ) ( not ( = ?auto_818290 ?auto_818293 ) ) ( not ( = ?auto_818290 ?auto_818294 ) ) ( not ( = ?auto_818290 ?auto_818295 ) ) ( not ( = ?auto_818290 ?auto_818296 ) ) ( not ( = ?auto_818290 ?auto_818297 ) ) ( not ( = ?auto_818290 ?auto_818298 ) ) ( not ( = ?auto_818290 ?auto_818299 ) ) ( not ( = ?auto_818290 ?auto_818300 ) ) ( not ( = ?auto_818290 ?auto_818301 ) ) ( not ( = ?auto_818290 ?auto_818302 ) ) ( not ( = ?auto_818290 ?auto_818303 ) ) ( not ( = ?auto_818290 ?auto_818304 ) ) ( not ( = ?auto_818291 ?auto_818292 ) ) ( not ( = ?auto_818291 ?auto_818293 ) ) ( not ( = ?auto_818291 ?auto_818294 ) ) ( not ( = ?auto_818291 ?auto_818295 ) ) ( not ( = ?auto_818291 ?auto_818296 ) ) ( not ( = ?auto_818291 ?auto_818297 ) ) ( not ( = ?auto_818291 ?auto_818298 ) ) ( not ( = ?auto_818291 ?auto_818299 ) ) ( not ( = ?auto_818291 ?auto_818300 ) ) ( not ( = ?auto_818291 ?auto_818301 ) ) ( not ( = ?auto_818291 ?auto_818302 ) ) ( not ( = ?auto_818291 ?auto_818303 ) ) ( not ( = ?auto_818291 ?auto_818304 ) ) ( not ( = ?auto_818292 ?auto_818293 ) ) ( not ( = ?auto_818292 ?auto_818294 ) ) ( not ( = ?auto_818292 ?auto_818295 ) ) ( not ( = ?auto_818292 ?auto_818296 ) ) ( not ( = ?auto_818292 ?auto_818297 ) ) ( not ( = ?auto_818292 ?auto_818298 ) ) ( not ( = ?auto_818292 ?auto_818299 ) ) ( not ( = ?auto_818292 ?auto_818300 ) ) ( not ( = ?auto_818292 ?auto_818301 ) ) ( not ( = ?auto_818292 ?auto_818302 ) ) ( not ( = ?auto_818292 ?auto_818303 ) ) ( not ( = ?auto_818292 ?auto_818304 ) ) ( not ( = ?auto_818293 ?auto_818294 ) ) ( not ( = ?auto_818293 ?auto_818295 ) ) ( not ( = ?auto_818293 ?auto_818296 ) ) ( not ( = ?auto_818293 ?auto_818297 ) ) ( not ( = ?auto_818293 ?auto_818298 ) ) ( not ( = ?auto_818293 ?auto_818299 ) ) ( not ( = ?auto_818293 ?auto_818300 ) ) ( not ( = ?auto_818293 ?auto_818301 ) ) ( not ( = ?auto_818293 ?auto_818302 ) ) ( not ( = ?auto_818293 ?auto_818303 ) ) ( not ( = ?auto_818293 ?auto_818304 ) ) ( not ( = ?auto_818294 ?auto_818295 ) ) ( not ( = ?auto_818294 ?auto_818296 ) ) ( not ( = ?auto_818294 ?auto_818297 ) ) ( not ( = ?auto_818294 ?auto_818298 ) ) ( not ( = ?auto_818294 ?auto_818299 ) ) ( not ( = ?auto_818294 ?auto_818300 ) ) ( not ( = ?auto_818294 ?auto_818301 ) ) ( not ( = ?auto_818294 ?auto_818302 ) ) ( not ( = ?auto_818294 ?auto_818303 ) ) ( not ( = ?auto_818294 ?auto_818304 ) ) ( not ( = ?auto_818295 ?auto_818296 ) ) ( not ( = ?auto_818295 ?auto_818297 ) ) ( not ( = ?auto_818295 ?auto_818298 ) ) ( not ( = ?auto_818295 ?auto_818299 ) ) ( not ( = ?auto_818295 ?auto_818300 ) ) ( not ( = ?auto_818295 ?auto_818301 ) ) ( not ( = ?auto_818295 ?auto_818302 ) ) ( not ( = ?auto_818295 ?auto_818303 ) ) ( not ( = ?auto_818295 ?auto_818304 ) ) ( not ( = ?auto_818296 ?auto_818297 ) ) ( not ( = ?auto_818296 ?auto_818298 ) ) ( not ( = ?auto_818296 ?auto_818299 ) ) ( not ( = ?auto_818296 ?auto_818300 ) ) ( not ( = ?auto_818296 ?auto_818301 ) ) ( not ( = ?auto_818296 ?auto_818302 ) ) ( not ( = ?auto_818296 ?auto_818303 ) ) ( not ( = ?auto_818296 ?auto_818304 ) ) ( not ( = ?auto_818297 ?auto_818298 ) ) ( not ( = ?auto_818297 ?auto_818299 ) ) ( not ( = ?auto_818297 ?auto_818300 ) ) ( not ( = ?auto_818297 ?auto_818301 ) ) ( not ( = ?auto_818297 ?auto_818302 ) ) ( not ( = ?auto_818297 ?auto_818303 ) ) ( not ( = ?auto_818297 ?auto_818304 ) ) ( not ( = ?auto_818298 ?auto_818299 ) ) ( not ( = ?auto_818298 ?auto_818300 ) ) ( not ( = ?auto_818298 ?auto_818301 ) ) ( not ( = ?auto_818298 ?auto_818302 ) ) ( not ( = ?auto_818298 ?auto_818303 ) ) ( not ( = ?auto_818298 ?auto_818304 ) ) ( not ( = ?auto_818299 ?auto_818300 ) ) ( not ( = ?auto_818299 ?auto_818301 ) ) ( not ( = ?auto_818299 ?auto_818302 ) ) ( not ( = ?auto_818299 ?auto_818303 ) ) ( not ( = ?auto_818299 ?auto_818304 ) ) ( not ( = ?auto_818300 ?auto_818301 ) ) ( not ( = ?auto_818300 ?auto_818302 ) ) ( not ( = ?auto_818300 ?auto_818303 ) ) ( not ( = ?auto_818300 ?auto_818304 ) ) ( not ( = ?auto_818301 ?auto_818302 ) ) ( not ( = ?auto_818301 ?auto_818303 ) ) ( not ( = ?auto_818301 ?auto_818304 ) ) ( not ( = ?auto_818302 ?auto_818303 ) ) ( not ( = ?auto_818302 ?auto_818304 ) ) ( not ( = ?auto_818303 ?auto_818304 ) ) ( ON ?auto_818303 ?auto_818304 ) ( ON ?auto_818302 ?auto_818303 ) ( ON ?auto_818301 ?auto_818302 ) ( ON ?auto_818300 ?auto_818301 ) ( ON ?auto_818299 ?auto_818300 ) ( ON ?auto_818298 ?auto_818299 ) ( ON ?auto_818297 ?auto_818298 ) ( ON ?auto_818296 ?auto_818297 ) ( ON ?auto_818295 ?auto_818296 ) ( CLEAR ?auto_818293 ) ( ON ?auto_818294 ?auto_818295 ) ( CLEAR ?auto_818294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_818287 ?auto_818288 ?auto_818289 ?auto_818290 ?auto_818291 ?auto_818292 ?auto_818293 ?auto_818294 )
      ( MAKE-18PILE ?auto_818287 ?auto_818288 ?auto_818289 ?auto_818290 ?auto_818291 ?auto_818292 ?auto_818293 ?auto_818294 ?auto_818295 ?auto_818296 ?auto_818297 ?auto_818298 ?auto_818299 ?auto_818300 ?auto_818301 ?auto_818302 ?auto_818303 ?auto_818304 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818323 - BLOCK
      ?auto_818324 - BLOCK
      ?auto_818325 - BLOCK
      ?auto_818326 - BLOCK
      ?auto_818327 - BLOCK
      ?auto_818328 - BLOCK
      ?auto_818329 - BLOCK
      ?auto_818330 - BLOCK
      ?auto_818331 - BLOCK
      ?auto_818332 - BLOCK
      ?auto_818333 - BLOCK
      ?auto_818334 - BLOCK
      ?auto_818335 - BLOCK
      ?auto_818336 - BLOCK
      ?auto_818337 - BLOCK
      ?auto_818338 - BLOCK
      ?auto_818339 - BLOCK
      ?auto_818340 - BLOCK
    )
    :vars
    (
      ?auto_818341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818340 ?auto_818341 ) ( ON-TABLE ?auto_818323 ) ( ON ?auto_818324 ?auto_818323 ) ( ON ?auto_818325 ?auto_818324 ) ( ON ?auto_818326 ?auto_818325 ) ( ON ?auto_818327 ?auto_818326 ) ( ON ?auto_818328 ?auto_818327 ) ( not ( = ?auto_818323 ?auto_818324 ) ) ( not ( = ?auto_818323 ?auto_818325 ) ) ( not ( = ?auto_818323 ?auto_818326 ) ) ( not ( = ?auto_818323 ?auto_818327 ) ) ( not ( = ?auto_818323 ?auto_818328 ) ) ( not ( = ?auto_818323 ?auto_818329 ) ) ( not ( = ?auto_818323 ?auto_818330 ) ) ( not ( = ?auto_818323 ?auto_818331 ) ) ( not ( = ?auto_818323 ?auto_818332 ) ) ( not ( = ?auto_818323 ?auto_818333 ) ) ( not ( = ?auto_818323 ?auto_818334 ) ) ( not ( = ?auto_818323 ?auto_818335 ) ) ( not ( = ?auto_818323 ?auto_818336 ) ) ( not ( = ?auto_818323 ?auto_818337 ) ) ( not ( = ?auto_818323 ?auto_818338 ) ) ( not ( = ?auto_818323 ?auto_818339 ) ) ( not ( = ?auto_818323 ?auto_818340 ) ) ( not ( = ?auto_818323 ?auto_818341 ) ) ( not ( = ?auto_818324 ?auto_818325 ) ) ( not ( = ?auto_818324 ?auto_818326 ) ) ( not ( = ?auto_818324 ?auto_818327 ) ) ( not ( = ?auto_818324 ?auto_818328 ) ) ( not ( = ?auto_818324 ?auto_818329 ) ) ( not ( = ?auto_818324 ?auto_818330 ) ) ( not ( = ?auto_818324 ?auto_818331 ) ) ( not ( = ?auto_818324 ?auto_818332 ) ) ( not ( = ?auto_818324 ?auto_818333 ) ) ( not ( = ?auto_818324 ?auto_818334 ) ) ( not ( = ?auto_818324 ?auto_818335 ) ) ( not ( = ?auto_818324 ?auto_818336 ) ) ( not ( = ?auto_818324 ?auto_818337 ) ) ( not ( = ?auto_818324 ?auto_818338 ) ) ( not ( = ?auto_818324 ?auto_818339 ) ) ( not ( = ?auto_818324 ?auto_818340 ) ) ( not ( = ?auto_818324 ?auto_818341 ) ) ( not ( = ?auto_818325 ?auto_818326 ) ) ( not ( = ?auto_818325 ?auto_818327 ) ) ( not ( = ?auto_818325 ?auto_818328 ) ) ( not ( = ?auto_818325 ?auto_818329 ) ) ( not ( = ?auto_818325 ?auto_818330 ) ) ( not ( = ?auto_818325 ?auto_818331 ) ) ( not ( = ?auto_818325 ?auto_818332 ) ) ( not ( = ?auto_818325 ?auto_818333 ) ) ( not ( = ?auto_818325 ?auto_818334 ) ) ( not ( = ?auto_818325 ?auto_818335 ) ) ( not ( = ?auto_818325 ?auto_818336 ) ) ( not ( = ?auto_818325 ?auto_818337 ) ) ( not ( = ?auto_818325 ?auto_818338 ) ) ( not ( = ?auto_818325 ?auto_818339 ) ) ( not ( = ?auto_818325 ?auto_818340 ) ) ( not ( = ?auto_818325 ?auto_818341 ) ) ( not ( = ?auto_818326 ?auto_818327 ) ) ( not ( = ?auto_818326 ?auto_818328 ) ) ( not ( = ?auto_818326 ?auto_818329 ) ) ( not ( = ?auto_818326 ?auto_818330 ) ) ( not ( = ?auto_818326 ?auto_818331 ) ) ( not ( = ?auto_818326 ?auto_818332 ) ) ( not ( = ?auto_818326 ?auto_818333 ) ) ( not ( = ?auto_818326 ?auto_818334 ) ) ( not ( = ?auto_818326 ?auto_818335 ) ) ( not ( = ?auto_818326 ?auto_818336 ) ) ( not ( = ?auto_818326 ?auto_818337 ) ) ( not ( = ?auto_818326 ?auto_818338 ) ) ( not ( = ?auto_818326 ?auto_818339 ) ) ( not ( = ?auto_818326 ?auto_818340 ) ) ( not ( = ?auto_818326 ?auto_818341 ) ) ( not ( = ?auto_818327 ?auto_818328 ) ) ( not ( = ?auto_818327 ?auto_818329 ) ) ( not ( = ?auto_818327 ?auto_818330 ) ) ( not ( = ?auto_818327 ?auto_818331 ) ) ( not ( = ?auto_818327 ?auto_818332 ) ) ( not ( = ?auto_818327 ?auto_818333 ) ) ( not ( = ?auto_818327 ?auto_818334 ) ) ( not ( = ?auto_818327 ?auto_818335 ) ) ( not ( = ?auto_818327 ?auto_818336 ) ) ( not ( = ?auto_818327 ?auto_818337 ) ) ( not ( = ?auto_818327 ?auto_818338 ) ) ( not ( = ?auto_818327 ?auto_818339 ) ) ( not ( = ?auto_818327 ?auto_818340 ) ) ( not ( = ?auto_818327 ?auto_818341 ) ) ( not ( = ?auto_818328 ?auto_818329 ) ) ( not ( = ?auto_818328 ?auto_818330 ) ) ( not ( = ?auto_818328 ?auto_818331 ) ) ( not ( = ?auto_818328 ?auto_818332 ) ) ( not ( = ?auto_818328 ?auto_818333 ) ) ( not ( = ?auto_818328 ?auto_818334 ) ) ( not ( = ?auto_818328 ?auto_818335 ) ) ( not ( = ?auto_818328 ?auto_818336 ) ) ( not ( = ?auto_818328 ?auto_818337 ) ) ( not ( = ?auto_818328 ?auto_818338 ) ) ( not ( = ?auto_818328 ?auto_818339 ) ) ( not ( = ?auto_818328 ?auto_818340 ) ) ( not ( = ?auto_818328 ?auto_818341 ) ) ( not ( = ?auto_818329 ?auto_818330 ) ) ( not ( = ?auto_818329 ?auto_818331 ) ) ( not ( = ?auto_818329 ?auto_818332 ) ) ( not ( = ?auto_818329 ?auto_818333 ) ) ( not ( = ?auto_818329 ?auto_818334 ) ) ( not ( = ?auto_818329 ?auto_818335 ) ) ( not ( = ?auto_818329 ?auto_818336 ) ) ( not ( = ?auto_818329 ?auto_818337 ) ) ( not ( = ?auto_818329 ?auto_818338 ) ) ( not ( = ?auto_818329 ?auto_818339 ) ) ( not ( = ?auto_818329 ?auto_818340 ) ) ( not ( = ?auto_818329 ?auto_818341 ) ) ( not ( = ?auto_818330 ?auto_818331 ) ) ( not ( = ?auto_818330 ?auto_818332 ) ) ( not ( = ?auto_818330 ?auto_818333 ) ) ( not ( = ?auto_818330 ?auto_818334 ) ) ( not ( = ?auto_818330 ?auto_818335 ) ) ( not ( = ?auto_818330 ?auto_818336 ) ) ( not ( = ?auto_818330 ?auto_818337 ) ) ( not ( = ?auto_818330 ?auto_818338 ) ) ( not ( = ?auto_818330 ?auto_818339 ) ) ( not ( = ?auto_818330 ?auto_818340 ) ) ( not ( = ?auto_818330 ?auto_818341 ) ) ( not ( = ?auto_818331 ?auto_818332 ) ) ( not ( = ?auto_818331 ?auto_818333 ) ) ( not ( = ?auto_818331 ?auto_818334 ) ) ( not ( = ?auto_818331 ?auto_818335 ) ) ( not ( = ?auto_818331 ?auto_818336 ) ) ( not ( = ?auto_818331 ?auto_818337 ) ) ( not ( = ?auto_818331 ?auto_818338 ) ) ( not ( = ?auto_818331 ?auto_818339 ) ) ( not ( = ?auto_818331 ?auto_818340 ) ) ( not ( = ?auto_818331 ?auto_818341 ) ) ( not ( = ?auto_818332 ?auto_818333 ) ) ( not ( = ?auto_818332 ?auto_818334 ) ) ( not ( = ?auto_818332 ?auto_818335 ) ) ( not ( = ?auto_818332 ?auto_818336 ) ) ( not ( = ?auto_818332 ?auto_818337 ) ) ( not ( = ?auto_818332 ?auto_818338 ) ) ( not ( = ?auto_818332 ?auto_818339 ) ) ( not ( = ?auto_818332 ?auto_818340 ) ) ( not ( = ?auto_818332 ?auto_818341 ) ) ( not ( = ?auto_818333 ?auto_818334 ) ) ( not ( = ?auto_818333 ?auto_818335 ) ) ( not ( = ?auto_818333 ?auto_818336 ) ) ( not ( = ?auto_818333 ?auto_818337 ) ) ( not ( = ?auto_818333 ?auto_818338 ) ) ( not ( = ?auto_818333 ?auto_818339 ) ) ( not ( = ?auto_818333 ?auto_818340 ) ) ( not ( = ?auto_818333 ?auto_818341 ) ) ( not ( = ?auto_818334 ?auto_818335 ) ) ( not ( = ?auto_818334 ?auto_818336 ) ) ( not ( = ?auto_818334 ?auto_818337 ) ) ( not ( = ?auto_818334 ?auto_818338 ) ) ( not ( = ?auto_818334 ?auto_818339 ) ) ( not ( = ?auto_818334 ?auto_818340 ) ) ( not ( = ?auto_818334 ?auto_818341 ) ) ( not ( = ?auto_818335 ?auto_818336 ) ) ( not ( = ?auto_818335 ?auto_818337 ) ) ( not ( = ?auto_818335 ?auto_818338 ) ) ( not ( = ?auto_818335 ?auto_818339 ) ) ( not ( = ?auto_818335 ?auto_818340 ) ) ( not ( = ?auto_818335 ?auto_818341 ) ) ( not ( = ?auto_818336 ?auto_818337 ) ) ( not ( = ?auto_818336 ?auto_818338 ) ) ( not ( = ?auto_818336 ?auto_818339 ) ) ( not ( = ?auto_818336 ?auto_818340 ) ) ( not ( = ?auto_818336 ?auto_818341 ) ) ( not ( = ?auto_818337 ?auto_818338 ) ) ( not ( = ?auto_818337 ?auto_818339 ) ) ( not ( = ?auto_818337 ?auto_818340 ) ) ( not ( = ?auto_818337 ?auto_818341 ) ) ( not ( = ?auto_818338 ?auto_818339 ) ) ( not ( = ?auto_818338 ?auto_818340 ) ) ( not ( = ?auto_818338 ?auto_818341 ) ) ( not ( = ?auto_818339 ?auto_818340 ) ) ( not ( = ?auto_818339 ?auto_818341 ) ) ( not ( = ?auto_818340 ?auto_818341 ) ) ( ON ?auto_818339 ?auto_818340 ) ( ON ?auto_818338 ?auto_818339 ) ( ON ?auto_818337 ?auto_818338 ) ( ON ?auto_818336 ?auto_818337 ) ( ON ?auto_818335 ?auto_818336 ) ( ON ?auto_818334 ?auto_818335 ) ( ON ?auto_818333 ?auto_818334 ) ( ON ?auto_818332 ?auto_818333 ) ( ON ?auto_818331 ?auto_818332 ) ( ON ?auto_818330 ?auto_818331 ) ( CLEAR ?auto_818328 ) ( ON ?auto_818329 ?auto_818330 ) ( CLEAR ?auto_818329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_818323 ?auto_818324 ?auto_818325 ?auto_818326 ?auto_818327 ?auto_818328 ?auto_818329 )
      ( MAKE-18PILE ?auto_818323 ?auto_818324 ?auto_818325 ?auto_818326 ?auto_818327 ?auto_818328 ?auto_818329 ?auto_818330 ?auto_818331 ?auto_818332 ?auto_818333 ?auto_818334 ?auto_818335 ?auto_818336 ?auto_818337 ?auto_818338 ?auto_818339 ?auto_818340 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818360 - BLOCK
      ?auto_818361 - BLOCK
      ?auto_818362 - BLOCK
      ?auto_818363 - BLOCK
      ?auto_818364 - BLOCK
      ?auto_818365 - BLOCK
      ?auto_818366 - BLOCK
      ?auto_818367 - BLOCK
      ?auto_818368 - BLOCK
      ?auto_818369 - BLOCK
      ?auto_818370 - BLOCK
      ?auto_818371 - BLOCK
      ?auto_818372 - BLOCK
      ?auto_818373 - BLOCK
      ?auto_818374 - BLOCK
      ?auto_818375 - BLOCK
      ?auto_818376 - BLOCK
      ?auto_818377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818377 ) ( ON-TABLE ?auto_818360 ) ( ON ?auto_818361 ?auto_818360 ) ( ON ?auto_818362 ?auto_818361 ) ( ON ?auto_818363 ?auto_818362 ) ( ON ?auto_818364 ?auto_818363 ) ( ON ?auto_818365 ?auto_818364 ) ( not ( = ?auto_818360 ?auto_818361 ) ) ( not ( = ?auto_818360 ?auto_818362 ) ) ( not ( = ?auto_818360 ?auto_818363 ) ) ( not ( = ?auto_818360 ?auto_818364 ) ) ( not ( = ?auto_818360 ?auto_818365 ) ) ( not ( = ?auto_818360 ?auto_818366 ) ) ( not ( = ?auto_818360 ?auto_818367 ) ) ( not ( = ?auto_818360 ?auto_818368 ) ) ( not ( = ?auto_818360 ?auto_818369 ) ) ( not ( = ?auto_818360 ?auto_818370 ) ) ( not ( = ?auto_818360 ?auto_818371 ) ) ( not ( = ?auto_818360 ?auto_818372 ) ) ( not ( = ?auto_818360 ?auto_818373 ) ) ( not ( = ?auto_818360 ?auto_818374 ) ) ( not ( = ?auto_818360 ?auto_818375 ) ) ( not ( = ?auto_818360 ?auto_818376 ) ) ( not ( = ?auto_818360 ?auto_818377 ) ) ( not ( = ?auto_818361 ?auto_818362 ) ) ( not ( = ?auto_818361 ?auto_818363 ) ) ( not ( = ?auto_818361 ?auto_818364 ) ) ( not ( = ?auto_818361 ?auto_818365 ) ) ( not ( = ?auto_818361 ?auto_818366 ) ) ( not ( = ?auto_818361 ?auto_818367 ) ) ( not ( = ?auto_818361 ?auto_818368 ) ) ( not ( = ?auto_818361 ?auto_818369 ) ) ( not ( = ?auto_818361 ?auto_818370 ) ) ( not ( = ?auto_818361 ?auto_818371 ) ) ( not ( = ?auto_818361 ?auto_818372 ) ) ( not ( = ?auto_818361 ?auto_818373 ) ) ( not ( = ?auto_818361 ?auto_818374 ) ) ( not ( = ?auto_818361 ?auto_818375 ) ) ( not ( = ?auto_818361 ?auto_818376 ) ) ( not ( = ?auto_818361 ?auto_818377 ) ) ( not ( = ?auto_818362 ?auto_818363 ) ) ( not ( = ?auto_818362 ?auto_818364 ) ) ( not ( = ?auto_818362 ?auto_818365 ) ) ( not ( = ?auto_818362 ?auto_818366 ) ) ( not ( = ?auto_818362 ?auto_818367 ) ) ( not ( = ?auto_818362 ?auto_818368 ) ) ( not ( = ?auto_818362 ?auto_818369 ) ) ( not ( = ?auto_818362 ?auto_818370 ) ) ( not ( = ?auto_818362 ?auto_818371 ) ) ( not ( = ?auto_818362 ?auto_818372 ) ) ( not ( = ?auto_818362 ?auto_818373 ) ) ( not ( = ?auto_818362 ?auto_818374 ) ) ( not ( = ?auto_818362 ?auto_818375 ) ) ( not ( = ?auto_818362 ?auto_818376 ) ) ( not ( = ?auto_818362 ?auto_818377 ) ) ( not ( = ?auto_818363 ?auto_818364 ) ) ( not ( = ?auto_818363 ?auto_818365 ) ) ( not ( = ?auto_818363 ?auto_818366 ) ) ( not ( = ?auto_818363 ?auto_818367 ) ) ( not ( = ?auto_818363 ?auto_818368 ) ) ( not ( = ?auto_818363 ?auto_818369 ) ) ( not ( = ?auto_818363 ?auto_818370 ) ) ( not ( = ?auto_818363 ?auto_818371 ) ) ( not ( = ?auto_818363 ?auto_818372 ) ) ( not ( = ?auto_818363 ?auto_818373 ) ) ( not ( = ?auto_818363 ?auto_818374 ) ) ( not ( = ?auto_818363 ?auto_818375 ) ) ( not ( = ?auto_818363 ?auto_818376 ) ) ( not ( = ?auto_818363 ?auto_818377 ) ) ( not ( = ?auto_818364 ?auto_818365 ) ) ( not ( = ?auto_818364 ?auto_818366 ) ) ( not ( = ?auto_818364 ?auto_818367 ) ) ( not ( = ?auto_818364 ?auto_818368 ) ) ( not ( = ?auto_818364 ?auto_818369 ) ) ( not ( = ?auto_818364 ?auto_818370 ) ) ( not ( = ?auto_818364 ?auto_818371 ) ) ( not ( = ?auto_818364 ?auto_818372 ) ) ( not ( = ?auto_818364 ?auto_818373 ) ) ( not ( = ?auto_818364 ?auto_818374 ) ) ( not ( = ?auto_818364 ?auto_818375 ) ) ( not ( = ?auto_818364 ?auto_818376 ) ) ( not ( = ?auto_818364 ?auto_818377 ) ) ( not ( = ?auto_818365 ?auto_818366 ) ) ( not ( = ?auto_818365 ?auto_818367 ) ) ( not ( = ?auto_818365 ?auto_818368 ) ) ( not ( = ?auto_818365 ?auto_818369 ) ) ( not ( = ?auto_818365 ?auto_818370 ) ) ( not ( = ?auto_818365 ?auto_818371 ) ) ( not ( = ?auto_818365 ?auto_818372 ) ) ( not ( = ?auto_818365 ?auto_818373 ) ) ( not ( = ?auto_818365 ?auto_818374 ) ) ( not ( = ?auto_818365 ?auto_818375 ) ) ( not ( = ?auto_818365 ?auto_818376 ) ) ( not ( = ?auto_818365 ?auto_818377 ) ) ( not ( = ?auto_818366 ?auto_818367 ) ) ( not ( = ?auto_818366 ?auto_818368 ) ) ( not ( = ?auto_818366 ?auto_818369 ) ) ( not ( = ?auto_818366 ?auto_818370 ) ) ( not ( = ?auto_818366 ?auto_818371 ) ) ( not ( = ?auto_818366 ?auto_818372 ) ) ( not ( = ?auto_818366 ?auto_818373 ) ) ( not ( = ?auto_818366 ?auto_818374 ) ) ( not ( = ?auto_818366 ?auto_818375 ) ) ( not ( = ?auto_818366 ?auto_818376 ) ) ( not ( = ?auto_818366 ?auto_818377 ) ) ( not ( = ?auto_818367 ?auto_818368 ) ) ( not ( = ?auto_818367 ?auto_818369 ) ) ( not ( = ?auto_818367 ?auto_818370 ) ) ( not ( = ?auto_818367 ?auto_818371 ) ) ( not ( = ?auto_818367 ?auto_818372 ) ) ( not ( = ?auto_818367 ?auto_818373 ) ) ( not ( = ?auto_818367 ?auto_818374 ) ) ( not ( = ?auto_818367 ?auto_818375 ) ) ( not ( = ?auto_818367 ?auto_818376 ) ) ( not ( = ?auto_818367 ?auto_818377 ) ) ( not ( = ?auto_818368 ?auto_818369 ) ) ( not ( = ?auto_818368 ?auto_818370 ) ) ( not ( = ?auto_818368 ?auto_818371 ) ) ( not ( = ?auto_818368 ?auto_818372 ) ) ( not ( = ?auto_818368 ?auto_818373 ) ) ( not ( = ?auto_818368 ?auto_818374 ) ) ( not ( = ?auto_818368 ?auto_818375 ) ) ( not ( = ?auto_818368 ?auto_818376 ) ) ( not ( = ?auto_818368 ?auto_818377 ) ) ( not ( = ?auto_818369 ?auto_818370 ) ) ( not ( = ?auto_818369 ?auto_818371 ) ) ( not ( = ?auto_818369 ?auto_818372 ) ) ( not ( = ?auto_818369 ?auto_818373 ) ) ( not ( = ?auto_818369 ?auto_818374 ) ) ( not ( = ?auto_818369 ?auto_818375 ) ) ( not ( = ?auto_818369 ?auto_818376 ) ) ( not ( = ?auto_818369 ?auto_818377 ) ) ( not ( = ?auto_818370 ?auto_818371 ) ) ( not ( = ?auto_818370 ?auto_818372 ) ) ( not ( = ?auto_818370 ?auto_818373 ) ) ( not ( = ?auto_818370 ?auto_818374 ) ) ( not ( = ?auto_818370 ?auto_818375 ) ) ( not ( = ?auto_818370 ?auto_818376 ) ) ( not ( = ?auto_818370 ?auto_818377 ) ) ( not ( = ?auto_818371 ?auto_818372 ) ) ( not ( = ?auto_818371 ?auto_818373 ) ) ( not ( = ?auto_818371 ?auto_818374 ) ) ( not ( = ?auto_818371 ?auto_818375 ) ) ( not ( = ?auto_818371 ?auto_818376 ) ) ( not ( = ?auto_818371 ?auto_818377 ) ) ( not ( = ?auto_818372 ?auto_818373 ) ) ( not ( = ?auto_818372 ?auto_818374 ) ) ( not ( = ?auto_818372 ?auto_818375 ) ) ( not ( = ?auto_818372 ?auto_818376 ) ) ( not ( = ?auto_818372 ?auto_818377 ) ) ( not ( = ?auto_818373 ?auto_818374 ) ) ( not ( = ?auto_818373 ?auto_818375 ) ) ( not ( = ?auto_818373 ?auto_818376 ) ) ( not ( = ?auto_818373 ?auto_818377 ) ) ( not ( = ?auto_818374 ?auto_818375 ) ) ( not ( = ?auto_818374 ?auto_818376 ) ) ( not ( = ?auto_818374 ?auto_818377 ) ) ( not ( = ?auto_818375 ?auto_818376 ) ) ( not ( = ?auto_818375 ?auto_818377 ) ) ( not ( = ?auto_818376 ?auto_818377 ) ) ( ON ?auto_818376 ?auto_818377 ) ( ON ?auto_818375 ?auto_818376 ) ( ON ?auto_818374 ?auto_818375 ) ( ON ?auto_818373 ?auto_818374 ) ( ON ?auto_818372 ?auto_818373 ) ( ON ?auto_818371 ?auto_818372 ) ( ON ?auto_818370 ?auto_818371 ) ( ON ?auto_818369 ?auto_818370 ) ( ON ?auto_818368 ?auto_818369 ) ( ON ?auto_818367 ?auto_818368 ) ( CLEAR ?auto_818365 ) ( ON ?auto_818366 ?auto_818367 ) ( CLEAR ?auto_818366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_818360 ?auto_818361 ?auto_818362 ?auto_818363 ?auto_818364 ?auto_818365 ?auto_818366 )
      ( MAKE-18PILE ?auto_818360 ?auto_818361 ?auto_818362 ?auto_818363 ?auto_818364 ?auto_818365 ?auto_818366 ?auto_818367 ?auto_818368 ?auto_818369 ?auto_818370 ?auto_818371 ?auto_818372 ?auto_818373 ?auto_818374 ?auto_818375 ?auto_818376 ?auto_818377 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818396 - BLOCK
      ?auto_818397 - BLOCK
      ?auto_818398 - BLOCK
      ?auto_818399 - BLOCK
      ?auto_818400 - BLOCK
      ?auto_818401 - BLOCK
      ?auto_818402 - BLOCK
      ?auto_818403 - BLOCK
      ?auto_818404 - BLOCK
      ?auto_818405 - BLOCK
      ?auto_818406 - BLOCK
      ?auto_818407 - BLOCK
      ?auto_818408 - BLOCK
      ?auto_818409 - BLOCK
      ?auto_818410 - BLOCK
      ?auto_818411 - BLOCK
      ?auto_818412 - BLOCK
      ?auto_818413 - BLOCK
    )
    :vars
    (
      ?auto_818414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818413 ?auto_818414 ) ( ON-TABLE ?auto_818396 ) ( ON ?auto_818397 ?auto_818396 ) ( ON ?auto_818398 ?auto_818397 ) ( ON ?auto_818399 ?auto_818398 ) ( ON ?auto_818400 ?auto_818399 ) ( not ( = ?auto_818396 ?auto_818397 ) ) ( not ( = ?auto_818396 ?auto_818398 ) ) ( not ( = ?auto_818396 ?auto_818399 ) ) ( not ( = ?auto_818396 ?auto_818400 ) ) ( not ( = ?auto_818396 ?auto_818401 ) ) ( not ( = ?auto_818396 ?auto_818402 ) ) ( not ( = ?auto_818396 ?auto_818403 ) ) ( not ( = ?auto_818396 ?auto_818404 ) ) ( not ( = ?auto_818396 ?auto_818405 ) ) ( not ( = ?auto_818396 ?auto_818406 ) ) ( not ( = ?auto_818396 ?auto_818407 ) ) ( not ( = ?auto_818396 ?auto_818408 ) ) ( not ( = ?auto_818396 ?auto_818409 ) ) ( not ( = ?auto_818396 ?auto_818410 ) ) ( not ( = ?auto_818396 ?auto_818411 ) ) ( not ( = ?auto_818396 ?auto_818412 ) ) ( not ( = ?auto_818396 ?auto_818413 ) ) ( not ( = ?auto_818396 ?auto_818414 ) ) ( not ( = ?auto_818397 ?auto_818398 ) ) ( not ( = ?auto_818397 ?auto_818399 ) ) ( not ( = ?auto_818397 ?auto_818400 ) ) ( not ( = ?auto_818397 ?auto_818401 ) ) ( not ( = ?auto_818397 ?auto_818402 ) ) ( not ( = ?auto_818397 ?auto_818403 ) ) ( not ( = ?auto_818397 ?auto_818404 ) ) ( not ( = ?auto_818397 ?auto_818405 ) ) ( not ( = ?auto_818397 ?auto_818406 ) ) ( not ( = ?auto_818397 ?auto_818407 ) ) ( not ( = ?auto_818397 ?auto_818408 ) ) ( not ( = ?auto_818397 ?auto_818409 ) ) ( not ( = ?auto_818397 ?auto_818410 ) ) ( not ( = ?auto_818397 ?auto_818411 ) ) ( not ( = ?auto_818397 ?auto_818412 ) ) ( not ( = ?auto_818397 ?auto_818413 ) ) ( not ( = ?auto_818397 ?auto_818414 ) ) ( not ( = ?auto_818398 ?auto_818399 ) ) ( not ( = ?auto_818398 ?auto_818400 ) ) ( not ( = ?auto_818398 ?auto_818401 ) ) ( not ( = ?auto_818398 ?auto_818402 ) ) ( not ( = ?auto_818398 ?auto_818403 ) ) ( not ( = ?auto_818398 ?auto_818404 ) ) ( not ( = ?auto_818398 ?auto_818405 ) ) ( not ( = ?auto_818398 ?auto_818406 ) ) ( not ( = ?auto_818398 ?auto_818407 ) ) ( not ( = ?auto_818398 ?auto_818408 ) ) ( not ( = ?auto_818398 ?auto_818409 ) ) ( not ( = ?auto_818398 ?auto_818410 ) ) ( not ( = ?auto_818398 ?auto_818411 ) ) ( not ( = ?auto_818398 ?auto_818412 ) ) ( not ( = ?auto_818398 ?auto_818413 ) ) ( not ( = ?auto_818398 ?auto_818414 ) ) ( not ( = ?auto_818399 ?auto_818400 ) ) ( not ( = ?auto_818399 ?auto_818401 ) ) ( not ( = ?auto_818399 ?auto_818402 ) ) ( not ( = ?auto_818399 ?auto_818403 ) ) ( not ( = ?auto_818399 ?auto_818404 ) ) ( not ( = ?auto_818399 ?auto_818405 ) ) ( not ( = ?auto_818399 ?auto_818406 ) ) ( not ( = ?auto_818399 ?auto_818407 ) ) ( not ( = ?auto_818399 ?auto_818408 ) ) ( not ( = ?auto_818399 ?auto_818409 ) ) ( not ( = ?auto_818399 ?auto_818410 ) ) ( not ( = ?auto_818399 ?auto_818411 ) ) ( not ( = ?auto_818399 ?auto_818412 ) ) ( not ( = ?auto_818399 ?auto_818413 ) ) ( not ( = ?auto_818399 ?auto_818414 ) ) ( not ( = ?auto_818400 ?auto_818401 ) ) ( not ( = ?auto_818400 ?auto_818402 ) ) ( not ( = ?auto_818400 ?auto_818403 ) ) ( not ( = ?auto_818400 ?auto_818404 ) ) ( not ( = ?auto_818400 ?auto_818405 ) ) ( not ( = ?auto_818400 ?auto_818406 ) ) ( not ( = ?auto_818400 ?auto_818407 ) ) ( not ( = ?auto_818400 ?auto_818408 ) ) ( not ( = ?auto_818400 ?auto_818409 ) ) ( not ( = ?auto_818400 ?auto_818410 ) ) ( not ( = ?auto_818400 ?auto_818411 ) ) ( not ( = ?auto_818400 ?auto_818412 ) ) ( not ( = ?auto_818400 ?auto_818413 ) ) ( not ( = ?auto_818400 ?auto_818414 ) ) ( not ( = ?auto_818401 ?auto_818402 ) ) ( not ( = ?auto_818401 ?auto_818403 ) ) ( not ( = ?auto_818401 ?auto_818404 ) ) ( not ( = ?auto_818401 ?auto_818405 ) ) ( not ( = ?auto_818401 ?auto_818406 ) ) ( not ( = ?auto_818401 ?auto_818407 ) ) ( not ( = ?auto_818401 ?auto_818408 ) ) ( not ( = ?auto_818401 ?auto_818409 ) ) ( not ( = ?auto_818401 ?auto_818410 ) ) ( not ( = ?auto_818401 ?auto_818411 ) ) ( not ( = ?auto_818401 ?auto_818412 ) ) ( not ( = ?auto_818401 ?auto_818413 ) ) ( not ( = ?auto_818401 ?auto_818414 ) ) ( not ( = ?auto_818402 ?auto_818403 ) ) ( not ( = ?auto_818402 ?auto_818404 ) ) ( not ( = ?auto_818402 ?auto_818405 ) ) ( not ( = ?auto_818402 ?auto_818406 ) ) ( not ( = ?auto_818402 ?auto_818407 ) ) ( not ( = ?auto_818402 ?auto_818408 ) ) ( not ( = ?auto_818402 ?auto_818409 ) ) ( not ( = ?auto_818402 ?auto_818410 ) ) ( not ( = ?auto_818402 ?auto_818411 ) ) ( not ( = ?auto_818402 ?auto_818412 ) ) ( not ( = ?auto_818402 ?auto_818413 ) ) ( not ( = ?auto_818402 ?auto_818414 ) ) ( not ( = ?auto_818403 ?auto_818404 ) ) ( not ( = ?auto_818403 ?auto_818405 ) ) ( not ( = ?auto_818403 ?auto_818406 ) ) ( not ( = ?auto_818403 ?auto_818407 ) ) ( not ( = ?auto_818403 ?auto_818408 ) ) ( not ( = ?auto_818403 ?auto_818409 ) ) ( not ( = ?auto_818403 ?auto_818410 ) ) ( not ( = ?auto_818403 ?auto_818411 ) ) ( not ( = ?auto_818403 ?auto_818412 ) ) ( not ( = ?auto_818403 ?auto_818413 ) ) ( not ( = ?auto_818403 ?auto_818414 ) ) ( not ( = ?auto_818404 ?auto_818405 ) ) ( not ( = ?auto_818404 ?auto_818406 ) ) ( not ( = ?auto_818404 ?auto_818407 ) ) ( not ( = ?auto_818404 ?auto_818408 ) ) ( not ( = ?auto_818404 ?auto_818409 ) ) ( not ( = ?auto_818404 ?auto_818410 ) ) ( not ( = ?auto_818404 ?auto_818411 ) ) ( not ( = ?auto_818404 ?auto_818412 ) ) ( not ( = ?auto_818404 ?auto_818413 ) ) ( not ( = ?auto_818404 ?auto_818414 ) ) ( not ( = ?auto_818405 ?auto_818406 ) ) ( not ( = ?auto_818405 ?auto_818407 ) ) ( not ( = ?auto_818405 ?auto_818408 ) ) ( not ( = ?auto_818405 ?auto_818409 ) ) ( not ( = ?auto_818405 ?auto_818410 ) ) ( not ( = ?auto_818405 ?auto_818411 ) ) ( not ( = ?auto_818405 ?auto_818412 ) ) ( not ( = ?auto_818405 ?auto_818413 ) ) ( not ( = ?auto_818405 ?auto_818414 ) ) ( not ( = ?auto_818406 ?auto_818407 ) ) ( not ( = ?auto_818406 ?auto_818408 ) ) ( not ( = ?auto_818406 ?auto_818409 ) ) ( not ( = ?auto_818406 ?auto_818410 ) ) ( not ( = ?auto_818406 ?auto_818411 ) ) ( not ( = ?auto_818406 ?auto_818412 ) ) ( not ( = ?auto_818406 ?auto_818413 ) ) ( not ( = ?auto_818406 ?auto_818414 ) ) ( not ( = ?auto_818407 ?auto_818408 ) ) ( not ( = ?auto_818407 ?auto_818409 ) ) ( not ( = ?auto_818407 ?auto_818410 ) ) ( not ( = ?auto_818407 ?auto_818411 ) ) ( not ( = ?auto_818407 ?auto_818412 ) ) ( not ( = ?auto_818407 ?auto_818413 ) ) ( not ( = ?auto_818407 ?auto_818414 ) ) ( not ( = ?auto_818408 ?auto_818409 ) ) ( not ( = ?auto_818408 ?auto_818410 ) ) ( not ( = ?auto_818408 ?auto_818411 ) ) ( not ( = ?auto_818408 ?auto_818412 ) ) ( not ( = ?auto_818408 ?auto_818413 ) ) ( not ( = ?auto_818408 ?auto_818414 ) ) ( not ( = ?auto_818409 ?auto_818410 ) ) ( not ( = ?auto_818409 ?auto_818411 ) ) ( not ( = ?auto_818409 ?auto_818412 ) ) ( not ( = ?auto_818409 ?auto_818413 ) ) ( not ( = ?auto_818409 ?auto_818414 ) ) ( not ( = ?auto_818410 ?auto_818411 ) ) ( not ( = ?auto_818410 ?auto_818412 ) ) ( not ( = ?auto_818410 ?auto_818413 ) ) ( not ( = ?auto_818410 ?auto_818414 ) ) ( not ( = ?auto_818411 ?auto_818412 ) ) ( not ( = ?auto_818411 ?auto_818413 ) ) ( not ( = ?auto_818411 ?auto_818414 ) ) ( not ( = ?auto_818412 ?auto_818413 ) ) ( not ( = ?auto_818412 ?auto_818414 ) ) ( not ( = ?auto_818413 ?auto_818414 ) ) ( ON ?auto_818412 ?auto_818413 ) ( ON ?auto_818411 ?auto_818412 ) ( ON ?auto_818410 ?auto_818411 ) ( ON ?auto_818409 ?auto_818410 ) ( ON ?auto_818408 ?auto_818409 ) ( ON ?auto_818407 ?auto_818408 ) ( ON ?auto_818406 ?auto_818407 ) ( ON ?auto_818405 ?auto_818406 ) ( ON ?auto_818404 ?auto_818405 ) ( ON ?auto_818403 ?auto_818404 ) ( ON ?auto_818402 ?auto_818403 ) ( CLEAR ?auto_818400 ) ( ON ?auto_818401 ?auto_818402 ) ( CLEAR ?auto_818401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_818396 ?auto_818397 ?auto_818398 ?auto_818399 ?auto_818400 ?auto_818401 )
      ( MAKE-18PILE ?auto_818396 ?auto_818397 ?auto_818398 ?auto_818399 ?auto_818400 ?auto_818401 ?auto_818402 ?auto_818403 ?auto_818404 ?auto_818405 ?auto_818406 ?auto_818407 ?auto_818408 ?auto_818409 ?auto_818410 ?auto_818411 ?auto_818412 ?auto_818413 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818433 - BLOCK
      ?auto_818434 - BLOCK
      ?auto_818435 - BLOCK
      ?auto_818436 - BLOCK
      ?auto_818437 - BLOCK
      ?auto_818438 - BLOCK
      ?auto_818439 - BLOCK
      ?auto_818440 - BLOCK
      ?auto_818441 - BLOCK
      ?auto_818442 - BLOCK
      ?auto_818443 - BLOCK
      ?auto_818444 - BLOCK
      ?auto_818445 - BLOCK
      ?auto_818446 - BLOCK
      ?auto_818447 - BLOCK
      ?auto_818448 - BLOCK
      ?auto_818449 - BLOCK
      ?auto_818450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818450 ) ( ON-TABLE ?auto_818433 ) ( ON ?auto_818434 ?auto_818433 ) ( ON ?auto_818435 ?auto_818434 ) ( ON ?auto_818436 ?auto_818435 ) ( ON ?auto_818437 ?auto_818436 ) ( not ( = ?auto_818433 ?auto_818434 ) ) ( not ( = ?auto_818433 ?auto_818435 ) ) ( not ( = ?auto_818433 ?auto_818436 ) ) ( not ( = ?auto_818433 ?auto_818437 ) ) ( not ( = ?auto_818433 ?auto_818438 ) ) ( not ( = ?auto_818433 ?auto_818439 ) ) ( not ( = ?auto_818433 ?auto_818440 ) ) ( not ( = ?auto_818433 ?auto_818441 ) ) ( not ( = ?auto_818433 ?auto_818442 ) ) ( not ( = ?auto_818433 ?auto_818443 ) ) ( not ( = ?auto_818433 ?auto_818444 ) ) ( not ( = ?auto_818433 ?auto_818445 ) ) ( not ( = ?auto_818433 ?auto_818446 ) ) ( not ( = ?auto_818433 ?auto_818447 ) ) ( not ( = ?auto_818433 ?auto_818448 ) ) ( not ( = ?auto_818433 ?auto_818449 ) ) ( not ( = ?auto_818433 ?auto_818450 ) ) ( not ( = ?auto_818434 ?auto_818435 ) ) ( not ( = ?auto_818434 ?auto_818436 ) ) ( not ( = ?auto_818434 ?auto_818437 ) ) ( not ( = ?auto_818434 ?auto_818438 ) ) ( not ( = ?auto_818434 ?auto_818439 ) ) ( not ( = ?auto_818434 ?auto_818440 ) ) ( not ( = ?auto_818434 ?auto_818441 ) ) ( not ( = ?auto_818434 ?auto_818442 ) ) ( not ( = ?auto_818434 ?auto_818443 ) ) ( not ( = ?auto_818434 ?auto_818444 ) ) ( not ( = ?auto_818434 ?auto_818445 ) ) ( not ( = ?auto_818434 ?auto_818446 ) ) ( not ( = ?auto_818434 ?auto_818447 ) ) ( not ( = ?auto_818434 ?auto_818448 ) ) ( not ( = ?auto_818434 ?auto_818449 ) ) ( not ( = ?auto_818434 ?auto_818450 ) ) ( not ( = ?auto_818435 ?auto_818436 ) ) ( not ( = ?auto_818435 ?auto_818437 ) ) ( not ( = ?auto_818435 ?auto_818438 ) ) ( not ( = ?auto_818435 ?auto_818439 ) ) ( not ( = ?auto_818435 ?auto_818440 ) ) ( not ( = ?auto_818435 ?auto_818441 ) ) ( not ( = ?auto_818435 ?auto_818442 ) ) ( not ( = ?auto_818435 ?auto_818443 ) ) ( not ( = ?auto_818435 ?auto_818444 ) ) ( not ( = ?auto_818435 ?auto_818445 ) ) ( not ( = ?auto_818435 ?auto_818446 ) ) ( not ( = ?auto_818435 ?auto_818447 ) ) ( not ( = ?auto_818435 ?auto_818448 ) ) ( not ( = ?auto_818435 ?auto_818449 ) ) ( not ( = ?auto_818435 ?auto_818450 ) ) ( not ( = ?auto_818436 ?auto_818437 ) ) ( not ( = ?auto_818436 ?auto_818438 ) ) ( not ( = ?auto_818436 ?auto_818439 ) ) ( not ( = ?auto_818436 ?auto_818440 ) ) ( not ( = ?auto_818436 ?auto_818441 ) ) ( not ( = ?auto_818436 ?auto_818442 ) ) ( not ( = ?auto_818436 ?auto_818443 ) ) ( not ( = ?auto_818436 ?auto_818444 ) ) ( not ( = ?auto_818436 ?auto_818445 ) ) ( not ( = ?auto_818436 ?auto_818446 ) ) ( not ( = ?auto_818436 ?auto_818447 ) ) ( not ( = ?auto_818436 ?auto_818448 ) ) ( not ( = ?auto_818436 ?auto_818449 ) ) ( not ( = ?auto_818436 ?auto_818450 ) ) ( not ( = ?auto_818437 ?auto_818438 ) ) ( not ( = ?auto_818437 ?auto_818439 ) ) ( not ( = ?auto_818437 ?auto_818440 ) ) ( not ( = ?auto_818437 ?auto_818441 ) ) ( not ( = ?auto_818437 ?auto_818442 ) ) ( not ( = ?auto_818437 ?auto_818443 ) ) ( not ( = ?auto_818437 ?auto_818444 ) ) ( not ( = ?auto_818437 ?auto_818445 ) ) ( not ( = ?auto_818437 ?auto_818446 ) ) ( not ( = ?auto_818437 ?auto_818447 ) ) ( not ( = ?auto_818437 ?auto_818448 ) ) ( not ( = ?auto_818437 ?auto_818449 ) ) ( not ( = ?auto_818437 ?auto_818450 ) ) ( not ( = ?auto_818438 ?auto_818439 ) ) ( not ( = ?auto_818438 ?auto_818440 ) ) ( not ( = ?auto_818438 ?auto_818441 ) ) ( not ( = ?auto_818438 ?auto_818442 ) ) ( not ( = ?auto_818438 ?auto_818443 ) ) ( not ( = ?auto_818438 ?auto_818444 ) ) ( not ( = ?auto_818438 ?auto_818445 ) ) ( not ( = ?auto_818438 ?auto_818446 ) ) ( not ( = ?auto_818438 ?auto_818447 ) ) ( not ( = ?auto_818438 ?auto_818448 ) ) ( not ( = ?auto_818438 ?auto_818449 ) ) ( not ( = ?auto_818438 ?auto_818450 ) ) ( not ( = ?auto_818439 ?auto_818440 ) ) ( not ( = ?auto_818439 ?auto_818441 ) ) ( not ( = ?auto_818439 ?auto_818442 ) ) ( not ( = ?auto_818439 ?auto_818443 ) ) ( not ( = ?auto_818439 ?auto_818444 ) ) ( not ( = ?auto_818439 ?auto_818445 ) ) ( not ( = ?auto_818439 ?auto_818446 ) ) ( not ( = ?auto_818439 ?auto_818447 ) ) ( not ( = ?auto_818439 ?auto_818448 ) ) ( not ( = ?auto_818439 ?auto_818449 ) ) ( not ( = ?auto_818439 ?auto_818450 ) ) ( not ( = ?auto_818440 ?auto_818441 ) ) ( not ( = ?auto_818440 ?auto_818442 ) ) ( not ( = ?auto_818440 ?auto_818443 ) ) ( not ( = ?auto_818440 ?auto_818444 ) ) ( not ( = ?auto_818440 ?auto_818445 ) ) ( not ( = ?auto_818440 ?auto_818446 ) ) ( not ( = ?auto_818440 ?auto_818447 ) ) ( not ( = ?auto_818440 ?auto_818448 ) ) ( not ( = ?auto_818440 ?auto_818449 ) ) ( not ( = ?auto_818440 ?auto_818450 ) ) ( not ( = ?auto_818441 ?auto_818442 ) ) ( not ( = ?auto_818441 ?auto_818443 ) ) ( not ( = ?auto_818441 ?auto_818444 ) ) ( not ( = ?auto_818441 ?auto_818445 ) ) ( not ( = ?auto_818441 ?auto_818446 ) ) ( not ( = ?auto_818441 ?auto_818447 ) ) ( not ( = ?auto_818441 ?auto_818448 ) ) ( not ( = ?auto_818441 ?auto_818449 ) ) ( not ( = ?auto_818441 ?auto_818450 ) ) ( not ( = ?auto_818442 ?auto_818443 ) ) ( not ( = ?auto_818442 ?auto_818444 ) ) ( not ( = ?auto_818442 ?auto_818445 ) ) ( not ( = ?auto_818442 ?auto_818446 ) ) ( not ( = ?auto_818442 ?auto_818447 ) ) ( not ( = ?auto_818442 ?auto_818448 ) ) ( not ( = ?auto_818442 ?auto_818449 ) ) ( not ( = ?auto_818442 ?auto_818450 ) ) ( not ( = ?auto_818443 ?auto_818444 ) ) ( not ( = ?auto_818443 ?auto_818445 ) ) ( not ( = ?auto_818443 ?auto_818446 ) ) ( not ( = ?auto_818443 ?auto_818447 ) ) ( not ( = ?auto_818443 ?auto_818448 ) ) ( not ( = ?auto_818443 ?auto_818449 ) ) ( not ( = ?auto_818443 ?auto_818450 ) ) ( not ( = ?auto_818444 ?auto_818445 ) ) ( not ( = ?auto_818444 ?auto_818446 ) ) ( not ( = ?auto_818444 ?auto_818447 ) ) ( not ( = ?auto_818444 ?auto_818448 ) ) ( not ( = ?auto_818444 ?auto_818449 ) ) ( not ( = ?auto_818444 ?auto_818450 ) ) ( not ( = ?auto_818445 ?auto_818446 ) ) ( not ( = ?auto_818445 ?auto_818447 ) ) ( not ( = ?auto_818445 ?auto_818448 ) ) ( not ( = ?auto_818445 ?auto_818449 ) ) ( not ( = ?auto_818445 ?auto_818450 ) ) ( not ( = ?auto_818446 ?auto_818447 ) ) ( not ( = ?auto_818446 ?auto_818448 ) ) ( not ( = ?auto_818446 ?auto_818449 ) ) ( not ( = ?auto_818446 ?auto_818450 ) ) ( not ( = ?auto_818447 ?auto_818448 ) ) ( not ( = ?auto_818447 ?auto_818449 ) ) ( not ( = ?auto_818447 ?auto_818450 ) ) ( not ( = ?auto_818448 ?auto_818449 ) ) ( not ( = ?auto_818448 ?auto_818450 ) ) ( not ( = ?auto_818449 ?auto_818450 ) ) ( ON ?auto_818449 ?auto_818450 ) ( ON ?auto_818448 ?auto_818449 ) ( ON ?auto_818447 ?auto_818448 ) ( ON ?auto_818446 ?auto_818447 ) ( ON ?auto_818445 ?auto_818446 ) ( ON ?auto_818444 ?auto_818445 ) ( ON ?auto_818443 ?auto_818444 ) ( ON ?auto_818442 ?auto_818443 ) ( ON ?auto_818441 ?auto_818442 ) ( ON ?auto_818440 ?auto_818441 ) ( ON ?auto_818439 ?auto_818440 ) ( CLEAR ?auto_818437 ) ( ON ?auto_818438 ?auto_818439 ) ( CLEAR ?auto_818438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_818433 ?auto_818434 ?auto_818435 ?auto_818436 ?auto_818437 ?auto_818438 )
      ( MAKE-18PILE ?auto_818433 ?auto_818434 ?auto_818435 ?auto_818436 ?auto_818437 ?auto_818438 ?auto_818439 ?auto_818440 ?auto_818441 ?auto_818442 ?auto_818443 ?auto_818444 ?auto_818445 ?auto_818446 ?auto_818447 ?auto_818448 ?auto_818449 ?auto_818450 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818469 - BLOCK
      ?auto_818470 - BLOCK
      ?auto_818471 - BLOCK
      ?auto_818472 - BLOCK
      ?auto_818473 - BLOCK
      ?auto_818474 - BLOCK
      ?auto_818475 - BLOCK
      ?auto_818476 - BLOCK
      ?auto_818477 - BLOCK
      ?auto_818478 - BLOCK
      ?auto_818479 - BLOCK
      ?auto_818480 - BLOCK
      ?auto_818481 - BLOCK
      ?auto_818482 - BLOCK
      ?auto_818483 - BLOCK
      ?auto_818484 - BLOCK
      ?auto_818485 - BLOCK
      ?auto_818486 - BLOCK
    )
    :vars
    (
      ?auto_818487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818486 ?auto_818487 ) ( ON-TABLE ?auto_818469 ) ( ON ?auto_818470 ?auto_818469 ) ( ON ?auto_818471 ?auto_818470 ) ( ON ?auto_818472 ?auto_818471 ) ( not ( = ?auto_818469 ?auto_818470 ) ) ( not ( = ?auto_818469 ?auto_818471 ) ) ( not ( = ?auto_818469 ?auto_818472 ) ) ( not ( = ?auto_818469 ?auto_818473 ) ) ( not ( = ?auto_818469 ?auto_818474 ) ) ( not ( = ?auto_818469 ?auto_818475 ) ) ( not ( = ?auto_818469 ?auto_818476 ) ) ( not ( = ?auto_818469 ?auto_818477 ) ) ( not ( = ?auto_818469 ?auto_818478 ) ) ( not ( = ?auto_818469 ?auto_818479 ) ) ( not ( = ?auto_818469 ?auto_818480 ) ) ( not ( = ?auto_818469 ?auto_818481 ) ) ( not ( = ?auto_818469 ?auto_818482 ) ) ( not ( = ?auto_818469 ?auto_818483 ) ) ( not ( = ?auto_818469 ?auto_818484 ) ) ( not ( = ?auto_818469 ?auto_818485 ) ) ( not ( = ?auto_818469 ?auto_818486 ) ) ( not ( = ?auto_818469 ?auto_818487 ) ) ( not ( = ?auto_818470 ?auto_818471 ) ) ( not ( = ?auto_818470 ?auto_818472 ) ) ( not ( = ?auto_818470 ?auto_818473 ) ) ( not ( = ?auto_818470 ?auto_818474 ) ) ( not ( = ?auto_818470 ?auto_818475 ) ) ( not ( = ?auto_818470 ?auto_818476 ) ) ( not ( = ?auto_818470 ?auto_818477 ) ) ( not ( = ?auto_818470 ?auto_818478 ) ) ( not ( = ?auto_818470 ?auto_818479 ) ) ( not ( = ?auto_818470 ?auto_818480 ) ) ( not ( = ?auto_818470 ?auto_818481 ) ) ( not ( = ?auto_818470 ?auto_818482 ) ) ( not ( = ?auto_818470 ?auto_818483 ) ) ( not ( = ?auto_818470 ?auto_818484 ) ) ( not ( = ?auto_818470 ?auto_818485 ) ) ( not ( = ?auto_818470 ?auto_818486 ) ) ( not ( = ?auto_818470 ?auto_818487 ) ) ( not ( = ?auto_818471 ?auto_818472 ) ) ( not ( = ?auto_818471 ?auto_818473 ) ) ( not ( = ?auto_818471 ?auto_818474 ) ) ( not ( = ?auto_818471 ?auto_818475 ) ) ( not ( = ?auto_818471 ?auto_818476 ) ) ( not ( = ?auto_818471 ?auto_818477 ) ) ( not ( = ?auto_818471 ?auto_818478 ) ) ( not ( = ?auto_818471 ?auto_818479 ) ) ( not ( = ?auto_818471 ?auto_818480 ) ) ( not ( = ?auto_818471 ?auto_818481 ) ) ( not ( = ?auto_818471 ?auto_818482 ) ) ( not ( = ?auto_818471 ?auto_818483 ) ) ( not ( = ?auto_818471 ?auto_818484 ) ) ( not ( = ?auto_818471 ?auto_818485 ) ) ( not ( = ?auto_818471 ?auto_818486 ) ) ( not ( = ?auto_818471 ?auto_818487 ) ) ( not ( = ?auto_818472 ?auto_818473 ) ) ( not ( = ?auto_818472 ?auto_818474 ) ) ( not ( = ?auto_818472 ?auto_818475 ) ) ( not ( = ?auto_818472 ?auto_818476 ) ) ( not ( = ?auto_818472 ?auto_818477 ) ) ( not ( = ?auto_818472 ?auto_818478 ) ) ( not ( = ?auto_818472 ?auto_818479 ) ) ( not ( = ?auto_818472 ?auto_818480 ) ) ( not ( = ?auto_818472 ?auto_818481 ) ) ( not ( = ?auto_818472 ?auto_818482 ) ) ( not ( = ?auto_818472 ?auto_818483 ) ) ( not ( = ?auto_818472 ?auto_818484 ) ) ( not ( = ?auto_818472 ?auto_818485 ) ) ( not ( = ?auto_818472 ?auto_818486 ) ) ( not ( = ?auto_818472 ?auto_818487 ) ) ( not ( = ?auto_818473 ?auto_818474 ) ) ( not ( = ?auto_818473 ?auto_818475 ) ) ( not ( = ?auto_818473 ?auto_818476 ) ) ( not ( = ?auto_818473 ?auto_818477 ) ) ( not ( = ?auto_818473 ?auto_818478 ) ) ( not ( = ?auto_818473 ?auto_818479 ) ) ( not ( = ?auto_818473 ?auto_818480 ) ) ( not ( = ?auto_818473 ?auto_818481 ) ) ( not ( = ?auto_818473 ?auto_818482 ) ) ( not ( = ?auto_818473 ?auto_818483 ) ) ( not ( = ?auto_818473 ?auto_818484 ) ) ( not ( = ?auto_818473 ?auto_818485 ) ) ( not ( = ?auto_818473 ?auto_818486 ) ) ( not ( = ?auto_818473 ?auto_818487 ) ) ( not ( = ?auto_818474 ?auto_818475 ) ) ( not ( = ?auto_818474 ?auto_818476 ) ) ( not ( = ?auto_818474 ?auto_818477 ) ) ( not ( = ?auto_818474 ?auto_818478 ) ) ( not ( = ?auto_818474 ?auto_818479 ) ) ( not ( = ?auto_818474 ?auto_818480 ) ) ( not ( = ?auto_818474 ?auto_818481 ) ) ( not ( = ?auto_818474 ?auto_818482 ) ) ( not ( = ?auto_818474 ?auto_818483 ) ) ( not ( = ?auto_818474 ?auto_818484 ) ) ( not ( = ?auto_818474 ?auto_818485 ) ) ( not ( = ?auto_818474 ?auto_818486 ) ) ( not ( = ?auto_818474 ?auto_818487 ) ) ( not ( = ?auto_818475 ?auto_818476 ) ) ( not ( = ?auto_818475 ?auto_818477 ) ) ( not ( = ?auto_818475 ?auto_818478 ) ) ( not ( = ?auto_818475 ?auto_818479 ) ) ( not ( = ?auto_818475 ?auto_818480 ) ) ( not ( = ?auto_818475 ?auto_818481 ) ) ( not ( = ?auto_818475 ?auto_818482 ) ) ( not ( = ?auto_818475 ?auto_818483 ) ) ( not ( = ?auto_818475 ?auto_818484 ) ) ( not ( = ?auto_818475 ?auto_818485 ) ) ( not ( = ?auto_818475 ?auto_818486 ) ) ( not ( = ?auto_818475 ?auto_818487 ) ) ( not ( = ?auto_818476 ?auto_818477 ) ) ( not ( = ?auto_818476 ?auto_818478 ) ) ( not ( = ?auto_818476 ?auto_818479 ) ) ( not ( = ?auto_818476 ?auto_818480 ) ) ( not ( = ?auto_818476 ?auto_818481 ) ) ( not ( = ?auto_818476 ?auto_818482 ) ) ( not ( = ?auto_818476 ?auto_818483 ) ) ( not ( = ?auto_818476 ?auto_818484 ) ) ( not ( = ?auto_818476 ?auto_818485 ) ) ( not ( = ?auto_818476 ?auto_818486 ) ) ( not ( = ?auto_818476 ?auto_818487 ) ) ( not ( = ?auto_818477 ?auto_818478 ) ) ( not ( = ?auto_818477 ?auto_818479 ) ) ( not ( = ?auto_818477 ?auto_818480 ) ) ( not ( = ?auto_818477 ?auto_818481 ) ) ( not ( = ?auto_818477 ?auto_818482 ) ) ( not ( = ?auto_818477 ?auto_818483 ) ) ( not ( = ?auto_818477 ?auto_818484 ) ) ( not ( = ?auto_818477 ?auto_818485 ) ) ( not ( = ?auto_818477 ?auto_818486 ) ) ( not ( = ?auto_818477 ?auto_818487 ) ) ( not ( = ?auto_818478 ?auto_818479 ) ) ( not ( = ?auto_818478 ?auto_818480 ) ) ( not ( = ?auto_818478 ?auto_818481 ) ) ( not ( = ?auto_818478 ?auto_818482 ) ) ( not ( = ?auto_818478 ?auto_818483 ) ) ( not ( = ?auto_818478 ?auto_818484 ) ) ( not ( = ?auto_818478 ?auto_818485 ) ) ( not ( = ?auto_818478 ?auto_818486 ) ) ( not ( = ?auto_818478 ?auto_818487 ) ) ( not ( = ?auto_818479 ?auto_818480 ) ) ( not ( = ?auto_818479 ?auto_818481 ) ) ( not ( = ?auto_818479 ?auto_818482 ) ) ( not ( = ?auto_818479 ?auto_818483 ) ) ( not ( = ?auto_818479 ?auto_818484 ) ) ( not ( = ?auto_818479 ?auto_818485 ) ) ( not ( = ?auto_818479 ?auto_818486 ) ) ( not ( = ?auto_818479 ?auto_818487 ) ) ( not ( = ?auto_818480 ?auto_818481 ) ) ( not ( = ?auto_818480 ?auto_818482 ) ) ( not ( = ?auto_818480 ?auto_818483 ) ) ( not ( = ?auto_818480 ?auto_818484 ) ) ( not ( = ?auto_818480 ?auto_818485 ) ) ( not ( = ?auto_818480 ?auto_818486 ) ) ( not ( = ?auto_818480 ?auto_818487 ) ) ( not ( = ?auto_818481 ?auto_818482 ) ) ( not ( = ?auto_818481 ?auto_818483 ) ) ( not ( = ?auto_818481 ?auto_818484 ) ) ( not ( = ?auto_818481 ?auto_818485 ) ) ( not ( = ?auto_818481 ?auto_818486 ) ) ( not ( = ?auto_818481 ?auto_818487 ) ) ( not ( = ?auto_818482 ?auto_818483 ) ) ( not ( = ?auto_818482 ?auto_818484 ) ) ( not ( = ?auto_818482 ?auto_818485 ) ) ( not ( = ?auto_818482 ?auto_818486 ) ) ( not ( = ?auto_818482 ?auto_818487 ) ) ( not ( = ?auto_818483 ?auto_818484 ) ) ( not ( = ?auto_818483 ?auto_818485 ) ) ( not ( = ?auto_818483 ?auto_818486 ) ) ( not ( = ?auto_818483 ?auto_818487 ) ) ( not ( = ?auto_818484 ?auto_818485 ) ) ( not ( = ?auto_818484 ?auto_818486 ) ) ( not ( = ?auto_818484 ?auto_818487 ) ) ( not ( = ?auto_818485 ?auto_818486 ) ) ( not ( = ?auto_818485 ?auto_818487 ) ) ( not ( = ?auto_818486 ?auto_818487 ) ) ( ON ?auto_818485 ?auto_818486 ) ( ON ?auto_818484 ?auto_818485 ) ( ON ?auto_818483 ?auto_818484 ) ( ON ?auto_818482 ?auto_818483 ) ( ON ?auto_818481 ?auto_818482 ) ( ON ?auto_818480 ?auto_818481 ) ( ON ?auto_818479 ?auto_818480 ) ( ON ?auto_818478 ?auto_818479 ) ( ON ?auto_818477 ?auto_818478 ) ( ON ?auto_818476 ?auto_818477 ) ( ON ?auto_818475 ?auto_818476 ) ( ON ?auto_818474 ?auto_818475 ) ( CLEAR ?auto_818472 ) ( ON ?auto_818473 ?auto_818474 ) ( CLEAR ?auto_818473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_818469 ?auto_818470 ?auto_818471 ?auto_818472 ?auto_818473 )
      ( MAKE-18PILE ?auto_818469 ?auto_818470 ?auto_818471 ?auto_818472 ?auto_818473 ?auto_818474 ?auto_818475 ?auto_818476 ?auto_818477 ?auto_818478 ?auto_818479 ?auto_818480 ?auto_818481 ?auto_818482 ?auto_818483 ?auto_818484 ?auto_818485 ?auto_818486 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818506 - BLOCK
      ?auto_818507 - BLOCK
      ?auto_818508 - BLOCK
      ?auto_818509 - BLOCK
      ?auto_818510 - BLOCK
      ?auto_818511 - BLOCK
      ?auto_818512 - BLOCK
      ?auto_818513 - BLOCK
      ?auto_818514 - BLOCK
      ?auto_818515 - BLOCK
      ?auto_818516 - BLOCK
      ?auto_818517 - BLOCK
      ?auto_818518 - BLOCK
      ?auto_818519 - BLOCK
      ?auto_818520 - BLOCK
      ?auto_818521 - BLOCK
      ?auto_818522 - BLOCK
      ?auto_818523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818523 ) ( ON-TABLE ?auto_818506 ) ( ON ?auto_818507 ?auto_818506 ) ( ON ?auto_818508 ?auto_818507 ) ( ON ?auto_818509 ?auto_818508 ) ( not ( = ?auto_818506 ?auto_818507 ) ) ( not ( = ?auto_818506 ?auto_818508 ) ) ( not ( = ?auto_818506 ?auto_818509 ) ) ( not ( = ?auto_818506 ?auto_818510 ) ) ( not ( = ?auto_818506 ?auto_818511 ) ) ( not ( = ?auto_818506 ?auto_818512 ) ) ( not ( = ?auto_818506 ?auto_818513 ) ) ( not ( = ?auto_818506 ?auto_818514 ) ) ( not ( = ?auto_818506 ?auto_818515 ) ) ( not ( = ?auto_818506 ?auto_818516 ) ) ( not ( = ?auto_818506 ?auto_818517 ) ) ( not ( = ?auto_818506 ?auto_818518 ) ) ( not ( = ?auto_818506 ?auto_818519 ) ) ( not ( = ?auto_818506 ?auto_818520 ) ) ( not ( = ?auto_818506 ?auto_818521 ) ) ( not ( = ?auto_818506 ?auto_818522 ) ) ( not ( = ?auto_818506 ?auto_818523 ) ) ( not ( = ?auto_818507 ?auto_818508 ) ) ( not ( = ?auto_818507 ?auto_818509 ) ) ( not ( = ?auto_818507 ?auto_818510 ) ) ( not ( = ?auto_818507 ?auto_818511 ) ) ( not ( = ?auto_818507 ?auto_818512 ) ) ( not ( = ?auto_818507 ?auto_818513 ) ) ( not ( = ?auto_818507 ?auto_818514 ) ) ( not ( = ?auto_818507 ?auto_818515 ) ) ( not ( = ?auto_818507 ?auto_818516 ) ) ( not ( = ?auto_818507 ?auto_818517 ) ) ( not ( = ?auto_818507 ?auto_818518 ) ) ( not ( = ?auto_818507 ?auto_818519 ) ) ( not ( = ?auto_818507 ?auto_818520 ) ) ( not ( = ?auto_818507 ?auto_818521 ) ) ( not ( = ?auto_818507 ?auto_818522 ) ) ( not ( = ?auto_818507 ?auto_818523 ) ) ( not ( = ?auto_818508 ?auto_818509 ) ) ( not ( = ?auto_818508 ?auto_818510 ) ) ( not ( = ?auto_818508 ?auto_818511 ) ) ( not ( = ?auto_818508 ?auto_818512 ) ) ( not ( = ?auto_818508 ?auto_818513 ) ) ( not ( = ?auto_818508 ?auto_818514 ) ) ( not ( = ?auto_818508 ?auto_818515 ) ) ( not ( = ?auto_818508 ?auto_818516 ) ) ( not ( = ?auto_818508 ?auto_818517 ) ) ( not ( = ?auto_818508 ?auto_818518 ) ) ( not ( = ?auto_818508 ?auto_818519 ) ) ( not ( = ?auto_818508 ?auto_818520 ) ) ( not ( = ?auto_818508 ?auto_818521 ) ) ( not ( = ?auto_818508 ?auto_818522 ) ) ( not ( = ?auto_818508 ?auto_818523 ) ) ( not ( = ?auto_818509 ?auto_818510 ) ) ( not ( = ?auto_818509 ?auto_818511 ) ) ( not ( = ?auto_818509 ?auto_818512 ) ) ( not ( = ?auto_818509 ?auto_818513 ) ) ( not ( = ?auto_818509 ?auto_818514 ) ) ( not ( = ?auto_818509 ?auto_818515 ) ) ( not ( = ?auto_818509 ?auto_818516 ) ) ( not ( = ?auto_818509 ?auto_818517 ) ) ( not ( = ?auto_818509 ?auto_818518 ) ) ( not ( = ?auto_818509 ?auto_818519 ) ) ( not ( = ?auto_818509 ?auto_818520 ) ) ( not ( = ?auto_818509 ?auto_818521 ) ) ( not ( = ?auto_818509 ?auto_818522 ) ) ( not ( = ?auto_818509 ?auto_818523 ) ) ( not ( = ?auto_818510 ?auto_818511 ) ) ( not ( = ?auto_818510 ?auto_818512 ) ) ( not ( = ?auto_818510 ?auto_818513 ) ) ( not ( = ?auto_818510 ?auto_818514 ) ) ( not ( = ?auto_818510 ?auto_818515 ) ) ( not ( = ?auto_818510 ?auto_818516 ) ) ( not ( = ?auto_818510 ?auto_818517 ) ) ( not ( = ?auto_818510 ?auto_818518 ) ) ( not ( = ?auto_818510 ?auto_818519 ) ) ( not ( = ?auto_818510 ?auto_818520 ) ) ( not ( = ?auto_818510 ?auto_818521 ) ) ( not ( = ?auto_818510 ?auto_818522 ) ) ( not ( = ?auto_818510 ?auto_818523 ) ) ( not ( = ?auto_818511 ?auto_818512 ) ) ( not ( = ?auto_818511 ?auto_818513 ) ) ( not ( = ?auto_818511 ?auto_818514 ) ) ( not ( = ?auto_818511 ?auto_818515 ) ) ( not ( = ?auto_818511 ?auto_818516 ) ) ( not ( = ?auto_818511 ?auto_818517 ) ) ( not ( = ?auto_818511 ?auto_818518 ) ) ( not ( = ?auto_818511 ?auto_818519 ) ) ( not ( = ?auto_818511 ?auto_818520 ) ) ( not ( = ?auto_818511 ?auto_818521 ) ) ( not ( = ?auto_818511 ?auto_818522 ) ) ( not ( = ?auto_818511 ?auto_818523 ) ) ( not ( = ?auto_818512 ?auto_818513 ) ) ( not ( = ?auto_818512 ?auto_818514 ) ) ( not ( = ?auto_818512 ?auto_818515 ) ) ( not ( = ?auto_818512 ?auto_818516 ) ) ( not ( = ?auto_818512 ?auto_818517 ) ) ( not ( = ?auto_818512 ?auto_818518 ) ) ( not ( = ?auto_818512 ?auto_818519 ) ) ( not ( = ?auto_818512 ?auto_818520 ) ) ( not ( = ?auto_818512 ?auto_818521 ) ) ( not ( = ?auto_818512 ?auto_818522 ) ) ( not ( = ?auto_818512 ?auto_818523 ) ) ( not ( = ?auto_818513 ?auto_818514 ) ) ( not ( = ?auto_818513 ?auto_818515 ) ) ( not ( = ?auto_818513 ?auto_818516 ) ) ( not ( = ?auto_818513 ?auto_818517 ) ) ( not ( = ?auto_818513 ?auto_818518 ) ) ( not ( = ?auto_818513 ?auto_818519 ) ) ( not ( = ?auto_818513 ?auto_818520 ) ) ( not ( = ?auto_818513 ?auto_818521 ) ) ( not ( = ?auto_818513 ?auto_818522 ) ) ( not ( = ?auto_818513 ?auto_818523 ) ) ( not ( = ?auto_818514 ?auto_818515 ) ) ( not ( = ?auto_818514 ?auto_818516 ) ) ( not ( = ?auto_818514 ?auto_818517 ) ) ( not ( = ?auto_818514 ?auto_818518 ) ) ( not ( = ?auto_818514 ?auto_818519 ) ) ( not ( = ?auto_818514 ?auto_818520 ) ) ( not ( = ?auto_818514 ?auto_818521 ) ) ( not ( = ?auto_818514 ?auto_818522 ) ) ( not ( = ?auto_818514 ?auto_818523 ) ) ( not ( = ?auto_818515 ?auto_818516 ) ) ( not ( = ?auto_818515 ?auto_818517 ) ) ( not ( = ?auto_818515 ?auto_818518 ) ) ( not ( = ?auto_818515 ?auto_818519 ) ) ( not ( = ?auto_818515 ?auto_818520 ) ) ( not ( = ?auto_818515 ?auto_818521 ) ) ( not ( = ?auto_818515 ?auto_818522 ) ) ( not ( = ?auto_818515 ?auto_818523 ) ) ( not ( = ?auto_818516 ?auto_818517 ) ) ( not ( = ?auto_818516 ?auto_818518 ) ) ( not ( = ?auto_818516 ?auto_818519 ) ) ( not ( = ?auto_818516 ?auto_818520 ) ) ( not ( = ?auto_818516 ?auto_818521 ) ) ( not ( = ?auto_818516 ?auto_818522 ) ) ( not ( = ?auto_818516 ?auto_818523 ) ) ( not ( = ?auto_818517 ?auto_818518 ) ) ( not ( = ?auto_818517 ?auto_818519 ) ) ( not ( = ?auto_818517 ?auto_818520 ) ) ( not ( = ?auto_818517 ?auto_818521 ) ) ( not ( = ?auto_818517 ?auto_818522 ) ) ( not ( = ?auto_818517 ?auto_818523 ) ) ( not ( = ?auto_818518 ?auto_818519 ) ) ( not ( = ?auto_818518 ?auto_818520 ) ) ( not ( = ?auto_818518 ?auto_818521 ) ) ( not ( = ?auto_818518 ?auto_818522 ) ) ( not ( = ?auto_818518 ?auto_818523 ) ) ( not ( = ?auto_818519 ?auto_818520 ) ) ( not ( = ?auto_818519 ?auto_818521 ) ) ( not ( = ?auto_818519 ?auto_818522 ) ) ( not ( = ?auto_818519 ?auto_818523 ) ) ( not ( = ?auto_818520 ?auto_818521 ) ) ( not ( = ?auto_818520 ?auto_818522 ) ) ( not ( = ?auto_818520 ?auto_818523 ) ) ( not ( = ?auto_818521 ?auto_818522 ) ) ( not ( = ?auto_818521 ?auto_818523 ) ) ( not ( = ?auto_818522 ?auto_818523 ) ) ( ON ?auto_818522 ?auto_818523 ) ( ON ?auto_818521 ?auto_818522 ) ( ON ?auto_818520 ?auto_818521 ) ( ON ?auto_818519 ?auto_818520 ) ( ON ?auto_818518 ?auto_818519 ) ( ON ?auto_818517 ?auto_818518 ) ( ON ?auto_818516 ?auto_818517 ) ( ON ?auto_818515 ?auto_818516 ) ( ON ?auto_818514 ?auto_818515 ) ( ON ?auto_818513 ?auto_818514 ) ( ON ?auto_818512 ?auto_818513 ) ( ON ?auto_818511 ?auto_818512 ) ( CLEAR ?auto_818509 ) ( ON ?auto_818510 ?auto_818511 ) ( CLEAR ?auto_818510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_818506 ?auto_818507 ?auto_818508 ?auto_818509 ?auto_818510 )
      ( MAKE-18PILE ?auto_818506 ?auto_818507 ?auto_818508 ?auto_818509 ?auto_818510 ?auto_818511 ?auto_818512 ?auto_818513 ?auto_818514 ?auto_818515 ?auto_818516 ?auto_818517 ?auto_818518 ?auto_818519 ?auto_818520 ?auto_818521 ?auto_818522 ?auto_818523 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818542 - BLOCK
      ?auto_818543 - BLOCK
      ?auto_818544 - BLOCK
      ?auto_818545 - BLOCK
      ?auto_818546 - BLOCK
      ?auto_818547 - BLOCK
      ?auto_818548 - BLOCK
      ?auto_818549 - BLOCK
      ?auto_818550 - BLOCK
      ?auto_818551 - BLOCK
      ?auto_818552 - BLOCK
      ?auto_818553 - BLOCK
      ?auto_818554 - BLOCK
      ?auto_818555 - BLOCK
      ?auto_818556 - BLOCK
      ?auto_818557 - BLOCK
      ?auto_818558 - BLOCK
      ?auto_818559 - BLOCK
    )
    :vars
    (
      ?auto_818560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818559 ?auto_818560 ) ( ON-TABLE ?auto_818542 ) ( ON ?auto_818543 ?auto_818542 ) ( ON ?auto_818544 ?auto_818543 ) ( not ( = ?auto_818542 ?auto_818543 ) ) ( not ( = ?auto_818542 ?auto_818544 ) ) ( not ( = ?auto_818542 ?auto_818545 ) ) ( not ( = ?auto_818542 ?auto_818546 ) ) ( not ( = ?auto_818542 ?auto_818547 ) ) ( not ( = ?auto_818542 ?auto_818548 ) ) ( not ( = ?auto_818542 ?auto_818549 ) ) ( not ( = ?auto_818542 ?auto_818550 ) ) ( not ( = ?auto_818542 ?auto_818551 ) ) ( not ( = ?auto_818542 ?auto_818552 ) ) ( not ( = ?auto_818542 ?auto_818553 ) ) ( not ( = ?auto_818542 ?auto_818554 ) ) ( not ( = ?auto_818542 ?auto_818555 ) ) ( not ( = ?auto_818542 ?auto_818556 ) ) ( not ( = ?auto_818542 ?auto_818557 ) ) ( not ( = ?auto_818542 ?auto_818558 ) ) ( not ( = ?auto_818542 ?auto_818559 ) ) ( not ( = ?auto_818542 ?auto_818560 ) ) ( not ( = ?auto_818543 ?auto_818544 ) ) ( not ( = ?auto_818543 ?auto_818545 ) ) ( not ( = ?auto_818543 ?auto_818546 ) ) ( not ( = ?auto_818543 ?auto_818547 ) ) ( not ( = ?auto_818543 ?auto_818548 ) ) ( not ( = ?auto_818543 ?auto_818549 ) ) ( not ( = ?auto_818543 ?auto_818550 ) ) ( not ( = ?auto_818543 ?auto_818551 ) ) ( not ( = ?auto_818543 ?auto_818552 ) ) ( not ( = ?auto_818543 ?auto_818553 ) ) ( not ( = ?auto_818543 ?auto_818554 ) ) ( not ( = ?auto_818543 ?auto_818555 ) ) ( not ( = ?auto_818543 ?auto_818556 ) ) ( not ( = ?auto_818543 ?auto_818557 ) ) ( not ( = ?auto_818543 ?auto_818558 ) ) ( not ( = ?auto_818543 ?auto_818559 ) ) ( not ( = ?auto_818543 ?auto_818560 ) ) ( not ( = ?auto_818544 ?auto_818545 ) ) ( not ( = ?auto_818544 ?auto_818546 ) ) ( not ( = ?auto_818544 ?auto_818547 ) ) ( not ( = ?auto_818544 ?auto_818548 ) ) ( not ( = ?auto_818544 ?auto_818549 ) ) ( not ( = ?auto_818544 ?auto_818550 ) ) ( not ( = ?auto_818544 ?auto_818551 ) ) ( not ( = ?auto_818544 ?auto_818552 ) ) ( not ( = ?auto_818544 ?auto_818553 ) ) ( not ( = ?auto_818544 ?auto_818554 ) ) ( not ( = ?auto_818544 ?auto_818555 ) ) ( not ( = ?auto_818544 ?auto_818556 ) ) ( not ( = ?auto_818544 ?auto_818557 ) ) ( not ( = ?auto_818544 ?auto_818558 ) ) ( not ( = ?auto_818544 ?auto_818559 ) ) ( not ( = ?auto_818544 ?auto_818560 ) ) ( not ( = ?auto_818545 ?auto_818546 ) ) ( not ( = ?auto_818545 ?auto_818547 ) ) ( not ( = ?auto_818545 ?auto_818548 ) ) ( not ( = ?auto_818545 ?auto_818549 ) ) ( not ( = ?auto_818545 ?auto_818550 ) ) ( not ( = ?auto_818545 ?auto_818551 ) ) ( not ( = ?auto_818545 ?auto_818552 ) ) ( not ( = ?auto_818545 ?auto_818553 ) ) ( not ( = ?auto_818545 ?auto_818554 ) ) ( not ( = ?auto_818545 ?auto_818555 ) ) ( not ( = ?auto_818545 ?auto_818556 ) ) ( not ( = ?auto_818545 ?auto_818557 ) ) ( not ( = ?auto_818545 ?auto_818558 ) ) ( not ( = ?auto_818545 ?auto_818559 ) ) ( not ( = ?auto_818545 ?auto_818560 ) ) ( not ( = ?auto_818546 ?auto_818547 ) ) ( not ( = ?auto_818546 ?auto_818548 ) ) ( not ( = ?auto_818546 ?auto_818549 ) ) ( not ( = ?auto_818546 ?auto_818550 ) ) ( not ( = ?auto_818546 ?auto_818551 ) ) ( not ( = ?auto_818546 ?auto_818552 ) ) ( not ( = ?auto_818546 ?auto_818553 ) ) ( not ( = ?auto_818546 ?auto_818554 ) ) ( not ( = ?auto_818546 ?auto_818555 ) ) ( not ( = ?auto_818546 ?auto_818556 ) ) ( not ( = ?auto_818546 ?auto_818557 ) ) ( not ( = ?auto_818546 ?auto_818558 ) ) ( not ( = ?auto_818546 ?auto_818559 ) ) ( not ( = ?auto_818546 ?auto_818560 ) ) ( not ( = ?auto_818547 ?auto_818548 ) ) ( not ( = ?auto_818547 ?auto_818549 ) ) ( not ( = ?auto_818547 ?auto_818550 ) ) ( not ( = ?auto_818547 ?auto_818551 ) ) ( not ( = ?auto_818547 ?auto_818552 ) ) ( not ( = ?auto_818547 ?auto_818553 ) ) ( not ( = ?auto_818547 ?auto_818554 ) ) ( not ( = ?auto_818547 ?auto_818555 ) ) ( not ( = ?auto_818547 ?auto_818556 ) ) ( not ( = ?auto_818547 ?auto_818557 ) ) ( not ( = ?auto_818547 ?auto_818558 ) ) ( not ( = ?auto_818547 ?auto_818559 ) ) ( not ( = ?auto_818547 ?auto_818560 ) ) ( not ( = ?auto_818548 ?auto_818549 ) ) ( not ( = ?auto_818548 ?auto_818550 ) ) ( not ( = ?auto_818548 ?auto_818551 ) ) ( not ( = ?auto_818548 ?auto_818552 ) ) ( not ( = ?auto_818548 ?auto_818553 ) ) ( not ( = ?auto_818548 ?auto_818554 ) ) ( not ( = ?auto_818548 ?auto_818555 ) ) ( not ( = ?auto_818548 ?auto_818556 ) ) ( not ( = ?auto_818548 ?auto_818557 ) ) ( not ( = ?auto_818548 ?auto_818558 ) ) ( not ( = ?auto_818548 ?auto_818559 ) ) ( not ( = ?auto_818548 ?auto_818560 ) ) ( not ( = ?auto_818549 ?auto_818550 ) ) ( not ( = ?auto_818549 ?auto_818551 ) ) ( not ( = ?auto_818549 ?auto_818552 ) ) ( not ( = ?auto_818549 ?auto_818553 ) ) ( not ( = ?auto_818549 ?auto_818554 ) ) ( not ( = ?auto_818549 ?auto_818555 ) ) ( not ( = ?auto_818549 ?auto_818556 ) ) ( not ( = ?auto_818549 ?auto_818557 ) ) ( not ( = ?auto_818549 ?auto_818558 ) ) ( not ( = ?auto_818549 ?auto_818559 ) ) ( not ( = ?auto_818549 ?auto_818560 ) ) ( not ( = ?auto_818550 ?auto_818551 ) ) ( not ( = ?auto_818550 ?auto_818552 ) ) ( not ( = ?auto_818550 ?auto_818553 ) ) ( not ( = ?auto_818550 ?auto_818554 ) ) ( not ( = ?auto_818550 ?auto_818555 ) ) ( not ( = ?auto_818550 ?auto_818556 ) ) ( not ( = ?auto_818550 ?auto_818557 ) ) ( not ( = ?auto_818550 ?auto_818558 ) ) ( not ( = ?auto_818550 ?auto_818559 ) ) ( not ( = ?auto_818550 ?auto_818560 ) ) ( not ( = ?auto_818551 ?auto_818552 ) ) ( not ( = ?auto_818551 ?auto_818553 ) ) ( not ( = ?auto_818551 ?auto_818554 ) ) ( not ( = ?auto_818551 ?auto_818555 ) ) ( not ( = ?auto_818551 ?auto_818556 ) ) ( not ( = ?auto_818551 ?auto_818557 ) ) ( not ( = ?auto_818551 ?auto_818558 ) ) ( not ( = ?auto_818551 ?auto_818559 ) ) ( not ( = ?auto_818551 ?auto_818560 ) ) ( not ( = ?auto_818552 ?auto_818553 ) ) ( not ( = ?auto_818552 ?auto_818554 ) ) ( not ( = ?auto_818552 ?auto_818555 ) ) ( not ( = ?auto_818552 ?auto_818556 ) ) ( not ( = ?auto_818552 ?auto_818557 ) ) ( not ( = ?auto_818552 ?auto_818558 ) ) ( not ( = ?auto_818552 ?auto_818559 ) ) ( not ( = ?auto_818552 ?auto_818560 ) ) ( not ( = ?auto_818553 ?auto_818554 ) ) ( not ( = ?auto_818553 ?auto_818555 ) ) ( not ( = ?auto_818553 ?auto_818556 ) ) ( not ( = ?auto_818553 ?auto_818557 ) ) ( not ( = ?auto_818553 ?auto_818558 ) ) ( not ( = ?auto_818553 ?auto_818559 ) ) ( not ( = ?auto_818553 ?auto_818560 ) ) ( not ( = ?auto_818554 ?auto_818555 ) ) ( not ( = ?auto_818554 ?auto_818556 ) ) ( not ( = ?auto_818554 ?auto_818557 ) ) ( not ( = ?auto_818554 ?auto_818558 ) ) ( not ( = ?auto_818554 ?auto_818559 ) ) ( not ( = ?auto_818554 ?auto_818560 ) ) ( not ( = ?auto_818555 ?auto_818556 ) ) ( not ( = ?auto_818555 ?auto_818557 ) ) ( not ( = ?auto_818555 ?auto_818558 ) ) ( not ( = ?auto_818555 ?auto_818559 ) ) ( not ( = ?auto_818555 ?auto_818560 ) ) ( not ( = ?auto_818556 ?auto_818557 ) ) ( not ( = ?auto_818556 ?auto_818558 ) ) ( not ( = ?auto_818556 ?auto_818559 ) ) ( not ( = ?auto_818556 ?auto_818560 ) ) ( not ( = ?auto_818557 ?auto_818558 ) ) ( not ( = ?auto_818557 ?auto_818559 ) ) ( not ( = ?auto_818557 ?auto_818560 ) ) ( not ( = ?auto_818558 ?auto_818559 ) ) ( not ( = ?auto_818558 ?auto_818560 ) ) ( not ( = ?auto_818559 ?auto_818560 ) ) ( ON ?auto_818558 ?auto_818559 ) ( ON ?auto_818557 ?auto_818558 ) ( ON ?auto_818556 ?auto_818557 ) ( ON ?auto_818555 ?auto_818556 ) ( ON ?auto_818554 ?auto_818555 ) ( ON ?auto_818553 ?auto_818554 ) ( ON ?auto_818552 ?auto_818553 ) ( ON ?auto_818551 ?auto_818552 ) ( ON ?auto_818550 ?auto_818551 ) ( ON ?auto_818549 ?auto_818550 ) ( ON ?auto_818548 ?auto_818549 ) ( ON ?auto_818547 ?auto_818548 ) ( ON ?auto_818546 ?auto_818547 ) ( CLEAR ?auto_818544 ) ( ON ?auto_818545 ?auto_818546 ) ( CLEAR ?auto_818545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_818542 ?auto_818543 ?auto_818544 ?auto_818545 )
      ( MAKE-18PILE ?auto_818542 ?auto_818543 ?auto_818544 ?auto_818545 ?auto_818546 ?auto_818547 ?auto_818548 ?auto_818549 ?auto_818550 ?auto_818551 ?auto_818552 ?auto_818553 ?auto_818554 ?auto_818555 ?auto_818556 ?auto_818557 ?auto_818558 ?auto_818559 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818579 - BLOCK
      ?auto_818580 - BLOCK
      ?auto_818581 - BLOCK
      ?auto_818582 - BLOCK
      ?auto_818583 - BLOCK
      ?auto_818584 - BLOCK
      ?auto_818585 - BLOCK
      ?auto_818586 - BLOCK
      ?auto_818587 - BLOCK
      ?auto_818588 - BLOCK
      ?auto_818589 - BLOCK
      ?auto_818590 - BLOCK
      ?auto_818591 - BLOCK
      ?auto_818592 - BLOCK
      ?auto_818593 - BLOCK
      ?auto_818594 - BLOCK
      ?auto_818595 - BLOCK
      ?auto_818596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818596 ) ( ON-TABLE ?auto_818579 ) ( ON ?auto_818580 ?auto_818579 ) ( ON ?auto_818581 ?auto_818580 ) ( not ( = ?auto_818579 ?auto_818580 ) ) ( not ( = ?auto_818579 ?auto_818581 ) ) ( not ( = ?auto_818579 ?auto_818582 ) ) ( not ( = ?auto_818579 ?auto_818583 ) ) ( not ( = ?auto_818579 ?auto_818584 ) ) ( not ( = ?auto_818579 ?auto_818585 ) ) ( not ( = ?auto_818579 ?auto_818586 ) ) ( not ( = ?auto_818579 ?auto_818587 ) ) ( not ( = ?auto_818579 ?auto_818588 ) ) ( not ( = ?auto_818579 ?auto_818589 ) ) ( not ( = ?auto_818579 ?auto_818590 ) ) ( not ( = ?auto_818579 ?auto_818591 ) ) ( not ( = ?auto_818579 ?auto_818592 ) ) ( not ( = ?auto_818579 ?auto_818593 ) ) ( not ( = ?auto_818579 ?auto_818594 ) ) ( not ( = ?auto_818579 ?auto_818595 ) ) ( not ( = ?auto_818579 ?auto_818596 ) ) ( not ( = ?auto_818580 ?auto_818581 ) ) ( not ( = ?auto_818580 ?auto_818582 ) ) ( not ( = ?auto_818580 ?auto_818583 ) ) ( not ( = ?auto_818580 ?auto_818584 ) ) ( not ( = ?auto_818580 ?auto_818585 ) ) ( not ( = ?auto_818580 ?auto_818586 ) ) ( not ( = ?auto_818580 ?auto_818587 ) ) ( not ( = ?auto_818580 ?auto_818588 ) ) ( not ( = ?auto_818580 ?auto_818589 ) ) ( not ( = ?auto_818580 ?auto_818590 ) ) ( not ( = ?auto_818580 ?auto_818591 ) ) ( not ( = ?auto_818580 ?auto_818592 ) ) ( not ( = ?auto_818580 ?auto_818593 ) ) ( not ( = ?auto_818580 ?auto_818594 ) ) ( not ( = ?auto_818580 ?auto_818595 ) ) ( not ( = ?auto_818580 ?auto_818596 ) ) ( not ( = ?auto_818581 ?auto_818582 ) ) ( not ( = ?auto_818581 ?auto_818583 ) ) ( not ( = ?auto_818581 ?auto_818584 ) ) ( not ( = ?auto_818581 ?auto_818585 ) ) ( not ( = ?auto_818581 ?auto_818586 ) ) ( not ( = ?auto_818581 ?auto_818587 ) ) ( not ( = ?auto_818581 ?auto_818588 ) ) ( not ( = ?auto_818581 ?auto_818589 ) ) ( not ( = ?auto_818581 ?auto_818590 ) ) ( not ( = ?auto_818581 ?auto_818591 ) ) ( not ( = ?auto_818581 ?auto_818592 ) ) ( not ( = ?auto_818581 ?auto_818593 ) ) ( not ( = ?auto_818581 ?auto_818594 ) ) ( not ( = ?auto_818581 ?auto_818595 ) ) ( not ( = ?auto_818581 ?auto_818596 ) ) ( not ( = ?auto_818582 ?auto_818583 ) ) ( not ( = ?auto_818582 ?auto_818584 ) ) ( not ( = ?auto_818582 ?auto_818585 ) ) ( not ( = ?auto_818582 ?auto_818586 ) ) ( not ( = ?auto_818582 ?auto_818587 ) ) ( not ( = ?auto_818582 ?auto_818588 ) ) ( not ( = ?auto_818582 ?auto_818589 ) ) ( not ( = ?auto_818582 ?auto_818590 ) ) ( not ( = ?auto_818582 ?auto_818591 ) ) ( not ( = ?auto_818582 ?auto_818592 ) ) ( not ( = ?auto_818582 ?auto_818593 ) ) ( not ( = ?auto_818582 ?auto_818594 ) ) ( not ( = ?auto_818582 ?auto_818595 ) ) ( not ( = ?auto_818582 ?auto_818596 ) ) ( not ( = ?auto_818583 ?auto_818584 ) ) ( not ( = ?auto_818583 ?auto_818585 ) ) ( not ( = ?auto_818583 ?auto_818586 ) ) ( not ( = ?auto_818583 ?auto_818587 ) ) ( not ( = ?auto_818583 ?auto_818588 ) ) ( not ( = ?auto_818583 ?auto_818589 ) ) ( not ( = ?auto_818583 ?auto_818590 ) ) ( not ( = ?auto_818583 ?auto_818591 ) ) ( not ( = ?auto_818583 ?auto_818592 ) ) ( not ( = ?auto_818583 ?auto_818593 ) ) ( not ( = ?auto_818583 ?auto_818594 ) ) ( not ( = ?auto_818583 ?auto_818595 ) ) ( not ( = ?auto_818583 ?auto_818596 ) ) ( not ( = ?auto_818584 ?auto_818585 ) ) ( not ( = ?auto_818584 ?auto_818586 ) ) ( not ( = ?auto_818584 ?auto_818587 ) ) ( not ( = ?auto_818584 ?auto_818588 ) ) ( not ( = ?auto_818584 ?auto_818589 ) ) ( not ( = ?auto_818584 ?auto_818590 ) ) ( not ( = ?auto_818584 ?auto_818591 ) ) ( not ( = ?auto_818584 ?auto_818592 ) ) ( not ( = ?auto_818584 ?auto_818593 ) ) ( not ( = ?auto_818584 ?auto_818594 ) ) ( not ( = ?auto_818584 ?auto_818595 ) ) ( not ( = ?auto_818584 ?auto_818596 ) ) ( not ( = ?auto_818585 ?auto_818586 ) ) ( not ( = ?auto_818585 ?auto_818587 ) ) ( not ( = ?auto_818585 ?auto_818588 ) ) ( not ( = ?auto_818585 ?auto_818589 ) ) ( not ( = ?auto_818585 ?auto_818590 ) ) ( not ( = ?auto_818585 ?auto_818591 ) ) ( not ( = ?auto_818585 ?auto_818592 ) ) ( not ( = ?auto_818585 ?auto_818593 ) ) ( not ( = ?auto_818585 ?auto_818594 ) ) ( not ( = ?auto_818585 ?auto_818595 ) ) ( not ( = ?auto_818585 ?auto_818596 ) ) ( not ( = ?auto_818586 ?auto_818587 ) ) ( not ( = ?auto_818586 ?auto_818588 ) ) ( not ( = ?auto_818586 ?auto_818589 ) ) ( not ( = ?auto_818586 ?auto_818590 ) ) ( not ( = ?auto_818586 ?auto_818591 ) ) ( not ( = ?auto_818586 ?auto_818592 ) ) ( not ( = ?auto_818586 ?auto_818593 ) ) ( not ( = ?auto_818586 ?auto_818594 ) ) ( not ( = ?auto_818586 ?auto_818595 ) ) ( not ( = ?auto_818586 ?auto_818596 ) ) ( not ( = ?auto_818587 ?auto_818588 ) ) ( not ( = ?auto_818587 ?auto_818589 ) ) ( not ( = ?auto_818587 ?auto_818590 ) ) ( not ( = ?auto_818587 ?auto_818591 ) ) ( not ( = ?auto_818587 ?auto_818592 ) ) ( not ( = ?auto_818587 ?auto_818593 ) ) ( not ( = ?auto_818587 ?auto_818594 ) ) ( not ( = ?auto_818587 ?auto_818595 ) ) ( not ( = ?auto_818587 ?auto_818596 ) ) ( not ( = ?auto_818588 ?auto_818589 ) ) ( not ( = ?auto_818588 ?auto_818590 ) ) ( not ( = ?auto_818588 ?auto_818591 ) ) ( not ( = ?auto_818588 ?auto_818592 ) ) ( not ( = ?auto_818588 ?auto_818593 ) ) ( not ( = ?auto_818588 ?auto_818594 ) ) ( not ( = ?auto_818588 ?auto_818595 ) ) ( not ( = ?auto_818588 ?auto_818596 ) ) ( not ( = ?auto_818589 ?auto_818590 ) ) ( not ( = ?auto_818589 ?auto_818591 ) ) ( not ( = ?auto_818589 ?auto_818592 ) ) ( not ( = ?auto_818589 ?auto_818593 ) ) ( not ( = ?auto_818589 ?auto_818594 ) ) ( not ( = ?auto_818589 ?auto_818595 ) ) ( not ( = ?auto_818589 ?auto_818596 ) ) ( not ( = ?auto_818590 ?auto_818591 ) ) ( not ( = ?auto_818590 ?auto_818592 ) ) ( not ( = ?auto_818590 ?auto_818593 ) ) ( not ( = ?auto_818590 ?auto_818594 ) ) ( not ( = ?auto_818590 ?auto_818595 ) ) ( not ( = ?auto_818590 ?auto_818596 ) ) ( not ( = ?auto_818591 ?auto_818592 ) ) ( not ( = ?auto_818591 ?auto_818593 ) ) ( not ( = ?auto_818591 ?auto_818594 ) ) ( not ( = ?auto_818591 ?auto_818595 ) ) ( not ( = ?auto_818591 ?auto_818596 ) ) ( not ( = ?auto_818592 ?auto_818593 ) ) ( not ( = ?auto_818592 ?auto_818594 ) ) ( not ( = ?auto_818592 ?auto_818595 ) ) ( not ( = ?auto_818592 ?auto_818596 ) ) ( not ( = ?auto_818593 ?auto_818594 ) ) ( not ( = ?auto_818593 ?auto_818595 ) ) ( not ( = ?auto_818593 ?auto_818596 ) ) ( not ( = ?auto_818594 ?auto_818595 ) ) ( not ( = ?auto_818594 ?auto_818596 ) ) ( not ( = ?auto_818595 ?auto_818596 ) ) ( ON ?auto_818595 ?auto_818596 ) ( ON ?auto_818594 ?auto_818595 ) ( ON ?auto_818593 ?auto_818594 ) ( ON ?auto_818592 ?auto_818593 ) ( ON ?auto_818591 ?auto_818592 ) ( ON ?auto_818590 ?auto_818591 ) ( ON ?auto_818589 ?auto_818590 ) ( ON ?auto_818588 ?auto_818589 ) ( ON ?auto_818587 ?auto_818588 ) ( ON ?auto_818586 ?auto_818587 ) ( ON ?auto_818585 ?auto_818586 ) ( ON ?auto_818584 ?auto_818585 ) ( ON ?auto_818583 ?auto_818584 ) ( CLEAR ?auto_818581 ) ( ON ?auto_818582 ?auto_818583 ) ( CLEAR ?auto_818582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_818579 ?auto_818580 ?auto_818581 ?auto_818582 )
      ( MAKE-18PILE ?auto_818579 ?auto_818580 ?auto_818581 ?auto_818582 ?auto_818583 ?auto_818584 ?auto_818585 ?auto_818586 ?auto_818587 ?auto_818588 ?auto_818589 ?auto_818590 ?auto_818591 ?auto_818592 ?auto_818593 ?auto_818594 ?auto_818595 ?auto_818596 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818615 - BLOCK
      ?auto_818616 - BLOCK
      ?auto_818617 - BLOCK
      ?auto_818618 - BLOCK
      ?auto_818619 - BLOCK
      ?auto_818620 - BLOCK
      ?auto_818621 - BLOCK
      ?auto_818622 - BLOCK
      ?auto_818623 - BLOCK
      ?auto_818624 - BLOCK
      ?auto_818625 - BLOCK
      ?auto_818626 - BLOCK
      ?auto_818627 - BLOCK
      ?auto_818628 - BLOCK
      ?auto_818629 - BLOCK
      ?auto_818630 - BLOCK
      ?auto_818631 - BLOCK
      ?auto_818632 - BLOCK
    )
    :vars
    (
      ?auto_818633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818632 ?auto_818633 ) ( ON-TABLE ?auto_818615 ) ( ON ?auto_818616 ?auto_818615 ) ( not ( = ?auto_818615 ?auto_818616 ) ) ( not ( = ?auto_818615 ?auto_818617 ) ) ( not ( = ?auto_818615 ?auto_818618 ) ) ( not ( = ?auto_818615 ?auto_818619 ) ) ( not ( = ?auto_818615 ?auto_818620 ) ) ( not ( = ?auto_818615 ?auto_818621 ) ) ( not ( = ?auto_818615 ?auto_818622 ) ) ( not ( = ?auto_818615 ?auto_818623 ) ) ( not ( = ?auto_818615 ?auto_818624 ) ) ( not ( = ?auto_818615 ?auto_818625 ) ) ( not ( = ?auto_818615 ?auto_818626 ) ) ( not ( = ?auto_818615 ?auto_818627 ) ) ( not ( = ?auto_818615 ?auto_818628 ) ) ( not ( = ?auto_818615 ?auto_818629 ) ) ( not ( = ?auto_818615 ?auto_818630 ) ) ( not ( = ?auto_818615 ?auto_818631 ) ) ( not ( = ?auto_818615 ?auto_818632 ) ) ( not ( = ?auto_818615 ?auto_818633 ) ) ( not ( = ?auto_818616 ?auto_818617 ) ) ( not ( = ?auto_818616 ?auto_818618 ) ) ( not ( = ?auto_818616 ?auto_818619 ) ) ( not ( = ?auto_818616 ?auto_818620 ) ) ( not ( = ?auto_818616 ?auto_818621 ) ) ( not ( = ?auto_818616 ?auto_818622 ) ) ( not ( = ?auto_818616 ?auto_818623 ) ) ( not ( = ?auto_818616 ?auto_818624 ) ) ( not ( = ?auto_818616 ?auto_818625 ) ) ( not ( = ?auto_818616 ?auto_818626 ) ) ( not ( = ?auto_818616 ?auto_818627 ) ) ( not ( = ?auto_818616 ?auto_818628 ) ) ( not ( = ?auto_818616 ?auto_818629 ) ) ( not ( = ?auto_818616 ?auto_818630 ) ) ( not ( = ?auto_818616 ?auto_818631 ) ) ( not ( = ?auto_818616 ?auto_818632 ) ) ( not ( = ?auto_818616 ?auto_818633 ) ) ( not ( = ?auto_818617 ?auto_818618 ) ) ( not ( = ?auto_818617 ?auto_818619 ) ) ( not ( = ?auto_818617 ?auto_818620 ) ) ( not ( = ?auto_818617 ?auto_818621 ) ) ( not ( = ?auto_818617 ?auto_818622 ) ) ( not ( = ?auto_818617 ?auto_818623 ) ) ( not ( = ?auto_818617 ?auto_818624 ) ) ( not ( = ?auto_818617 ?auto_818625 ) ) ( not ( = ?auto_818617 ?auto_818626 ) ) ( not ( = ?auto_818617 ?auto_818627 ) ) ( not ( = ?auto_818617 ?auto_818628 ) ) ( not ( = ?auto_818617 ?auto_818629 ) ) ( not ( = ?auto_818617 ?auto_818630 ) ) ( not ( = ?auto_818617 ?auto_818631 ) ) ( not ( = ?auto_818617 ?auto_818632 ) ) ( not ( = ?auto_818617 ?auto_818633 ) ) ( not ( = ?auto_818618 ?auto_818619 ) ) ( not ( = ?auto_818618 ?auto_818620 ) ) ( not ( = ?auto_818618 ?auto_818621 ) ) ( not ( = ?auto_818618 ?auto_818622 ) ) ( not ( = ?auto_818618 ?auto_818623 ) ) ( not ( = ?auto_818618 ?auto_818624 ) ) ( not ( = ?auto_818618 ?auto_818625 ) ) ( not ( = ?auto_818618 ?auto_818626 ) ) ( not ( = ?auto_818618 ?auto_818627 ) ) ( not ( = ?auto_818618 ?auto_818628 ) ) ( not ( = ?auto_818618 ?auto_818629 ) ) ( not ( = ?auto_818618 ?auto_818630 ) ) ( not ( = ?auto_818618 ?auto_818631 ) ) ( not ( = ?auto_818618 ?auto_818632 ) ) ( not ( = ?auto_818618 ?auto_818633 ) ) ( not ( = ?auto_818619 ?auto_818620 ) ) ( not ( = ?auto_818619 ?auto_818621 ) ) ( not ( = ?auto_818619 ?auto_818622 ) ) ( not ( = ?auto_818619 ?auto_818623 ) ) ( not ( = ?auto_818619 ?auto_818624 ) ) ( not ( = ?auto_818619 ?auto_818625 ) ) ( not ( = ?auto_818619 ?auto_818626 ) ) ( not ( = ?auto_818619 ?auto_818627 ) ) ( not ( = ?auto_818619 ?auto_818628 ) ) ( not ( = ?auto_818619 ?auto_818629 ) ) ( not ( = ?auto_818619 ?auto_818630 ) ) ( not ( = ?auto_818619 ?auto_818631 ) ) ( not ( = ?auto_818619 ?auto_818632 ) ) ( not ( = ?auto_818619 ?auto_818633 ) ) ( not ( = ?auto_818620 ?auto_818621 ) ) ( not ( = ?auto_818620 ?auto_818622 ) ) ( not ( = ?auto_818620 ?auto_818623 ) ) ( not ( = ?auto_818620 ?auto_818624 ) ) ( not ( = ?auto_818620 ?auto_818625 ) ) ( not ( = ?auto_818620 ?auto_818626 ) ) ( not ( = ?auto_818620 ?auto_818627 ) ) ( not ( = ?auto_818620 ?auto_818628 ) ) ( not ( = ?auto_818620 ?auto_818629 ) ) ( not ( = ?auto_818620 ?auto_818630 ) ) ( not ( = ?auto_818620 ?auto_818631 ) ) ( not ( = ?auto_818620 ?auto_818632 ) ) ( not ( = ?auto_818620 ?auto_818633 ) ) ( not ( = ?auto_818621 ?auto_818622 ) ) ( not ( = ?auto_818621 ?auto_818623 ) ) ( not ( = ?auto_818621 ?auto_818624 ) ) ( not ( = ?auto_818621 ?auto_818625 ) ) ( not ( = ?auto_818621 ?auto_818626 ) ) ( not ( = ?auto_818621 ?auto_818627 ) ) ( not ( = ?auto_818621 ?auto_818628 ) ) ( not ( = ?auto_818621 ?auto_818629 ) ) ( not ( = ?auto_818621 ?auto_818630 ) ) ( not ( = ?auto_818621 ?auto_818631 ) ) ( not ( = ?auto_818621 ?auto_818632 ) ) ( not ( = ?auto_818621 ?auto_818633 ) ) ( not ( = ?auto_818622 ?auto_818623 ) ) ( not ( = ?auto_818622 ?auto_818624 ) ) ( not ( = ?auto_818622 ?auto_818625 ) ) ( not ( = ?auto_818622 ?auto_818626 ) ) ( not ( = ?auto_818622 ?auto_818627 ) ) ( not ( = ?auto_818622 ?auto_818628 ) ) ( not ( = ?auto_818622 ?auto_818629 ) ) ( not ( = ?auto_818622 ?auto_818630 ) ) ( not ( = ?auto_818622 ?auto_818631 ) ) ( not ( = ?auto_818622 ?auto_818632 ) ) ( not ( = ?auto_818622 ?auto_818633 ) ) ( not ( = ?auto_818623 ?auto_818624 ) ) ( not ( = ?auto_818623 ?auto_818625 ) ) ( not ( = ?auto_818623 ?auto_818626 ) ) ( not ( = ?auto_818623 ?auto_818627 ) ) ( not ( = ?auto_818623 ?auto_818628 ) ) ( not ( = ?auto_818623 ?auto_818629 ) ) ( not ( = ?auto_818623 ?auto_818630 ) ) ( not ( = ?auto_818623 ?auto_818631 ) ) ( not ( = ?auto_818623 ?auto_818632 ) ) ( not ( = ?auto_818623 ?auto_818633 ) ) ( not ( = ?auto_818624 ?auto_818625 ) ) ( not ( = ?auto_818624 ?auto_818626 ) ) ( not ( = ?auto_818624 ?auto_818627 ) ) ( not ( = ?auto_818624 ?auto_818628 ) ) ( not ( = ?auto_818624 ?auto_818629 ) ) ( not ( = ?auto_818624 ?auto_818630 ) ) ( not ( = ?auto_818624 ?auto_818631 ) ) ( not ( = ?auto_818624 ?auto_818632 ) ) ( not ( = ?auto_818624 ?auto_818633 ) ) ( not ( = ?auto_818625 ?auto_818626 ) ) ( not ( = ?auto_818625 ?auto_818627 ) ) ( not ( = ?auto_818625 ?auto_818628 ) ) ( not ( = ?auto_818625 ?auto_818629 ) ) ( not ( = ?auto_818625 ?auto_818630 ) ) ( not ( = ?auto_818625 ?auto_818631 ) ) ( not ( = ?auto_818625 ?auto_818632 ) ) ( not ( = ?auto_818625 ?auto_818633 ) ) ( not ( = ?auto_818626 ?auto_818627 ) ) ( not ( = ?auto_818626 ?auto_818628 ) ) ( not ( = ?auto_818626 ?auto_818629 ) ) ( not ( = ?auto_818626 ?auto_818630 ) ) ( not ( = ?auto_818626 ?auto_818631 ) ) ( not ( = ?auto_818626 ?auto_818632 ) ) ( not ( = ?auto_818626 ?auto_818633 ) ) ( not ( = ?auto_818627 ?auto_818628 ) ) ( not ( = ?auto_818627 ?auto_818629 ) ) ( not ( = ?auto_818627 ?auto_818630 ) ) ( not ( = ?auto_818627 ?auto_818631 ) ) ( not ( = ?auto_818627 ?auto_818632 ) ) ( not ( = ?auto_818627 ?auto_818633 ) ) ( not ( = ?auto_818628 ?auto_818629 ) ) ( not ( = ?auto_818628 ?auto_818630 ) ) ( not ( = ?auto_818628 ?auto_818631 ) ) ( not ( = ?auto_818628 ?auto_818632 ) ) ( not ( = ?auto_818628 ?auto_818633 ) ) ( not ( = ?auto_818629 ?auto_818630 ) ) ( not ( = ?auto_818629 ?auto_818631 ) ) ( not ( = ?auto_818629 ?auto_818632 ) ) ( not ( = ?auto_818629 ?auto_818633 ) ) ( not ( = ?auto_818630 ?auto_818631 ) ) ( not ( = ?auto_818630 ?auto_818632 ) ) ( not ( = ?auto_818630 ?auto_818633 ) ) ( not ( = ?auto_818631 ?auto_818632 ) ) ( not ( = ?auto_818631 ?auto_818633 ) ) ( not ( = ?auto_818632 ?auto_818633 ) ) ( ON ?auto_818631 ?auto_818632 ) ( ON ?auto_818630 ?auto_818631 ) ( ON ?auto_818629 ?auto_818630 ) ( ON ?auto_818628 ?auto_818629 ) ( ON ?auto_818627 ?auto_818628 ) ( ON ?auto_818626 ?auto_818627 ) ( ON ?auto_818625 ?auto_818626 ) ( ON ?auto_818624 ?auto_818625 ) ( ON ?auto_818623 ?auto_818624 ) ( ON ?auto_818622 ?auto_818623 ) ( ON ?auto_818621 ?auto_818622 ) ( ON ?auto_818620 ?auto_818621 ) ( ON ?auto_818619 ?auto_818620 ) ( ON ?auto_818618 ?auto_818619 ) ( CLEAR ?auto_818616 ) ( ON ?auto_818617 ?auto_818618 ) ( CLEAR ?auto_818617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_818615 ?auto_818616 ?auto_818617 )
      ( MAKE-18PILE ?auto_818615 ?auto_818616 ?auto_818617 ?auto_818618 ?auto_818619 ?auto_818620 ?auto_818621 ?auto_818622 ?auto_818623 ?auto_818624 ?auto_818625 ?auto_818626 ?auto_818627 ?auto_818628 ?auto_818629 ?auto_818630 ?auto_818631 ?auto_818632 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818652 - BLOCK
      ?auto_818653 - BLOCK
      ?auto_818654 - BLOCK
      ?auto_818655 - BLOCK
      ?auto_818656 - BLOCK
      ?auto_818657 - BLOCK
      ?auto_818658 - BLOCK
      ?auto_818659 - BLOCK
      ?auto_818660 - BLOCK
      ?auto_818661 - BLOCK
      ?auto_818662 - BLOCK
      ?auto_818663 - BLOCK
      ?auto_818664 - BLOCK
      ?auto_818665 - BLOCK
      ?auto_818666 - BLOCK
      ?auto_818667 - BLOCK
      ?auto_818668 - BLOCK
      ?auto_818669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818669 ) ( ON-TABLE ?auto_818652 ) ( ON ?auto_818653 ?auto_818652 ) ( not ( = ?auto_818652 ?auto_818653 ) ) ( not ( = ?auto_818652 ?auto_818654 ) ) ( not ( = ?auto_818652 ?auto_818655 ) ) ( not ( = ?auto_818652 ?auto_818656 ) ) ( not ( = ?auto_818652 ?auto_818657 ) ) ( not ( = ?auto_818652 ?auto_818658 ) ) ( not ( = ?auto_818652 ?auto_818659 ) ) ( not ( = ?auto_818652 ?auto_818660 ) ) ( not ( = ?auto_818652 ?auto_818661 ) ) ( not ( = ?auto_818652 ?auto_818662 ) ) ( not ( = ?auto_818652 ?auto_818663 ) ) ( not ( = ?auto_818652 ?auto_818664 ) ) ( not ( = ?auto_818652 ?auto_818665 ) ) ( not ( = ?auto_818652 ?auto_818666 ) ) ( not ( = ?auto_818652 ?auto_818667 ) ) ( not ( = ?auto_818652 ?auto_818668 ) ) ( not ( = ?auto_818652 ?auto_818669 ) ) ( not ( = ?auto_818653 ?auto_818654 ) ) ( not ( = ?auto_818653 ?auto_818655 ) ) ( not ( = ?auto_818653 ?auto_818656 ) ) ( not ( = ?auto_818653 ?auto_818657 ) ) ( not ( = ?auto_818653 ?auto_818658 ) ) ( not ( = ?auto_818653 ?auto_818659 ) ) ( not ( = ?auto_818653 ?auto_818660 ) ) ( not ( = ?auto_818653 ?auto_818661 ) ) ( not ( = ?auto_818653 ?auto_818662 ) ) ( not ( = ?auto_818653 ?auto_818663 ) ) ( not ( = ?auto_818653 ?auto_818664 ) ) ( not ( = ?auto_818653 ?auto_818665 ) ) ( not ( = ?auto_818653 ?auto_818666 ) ) ( not ( = ?auto_818653 ?auto_818667 ) ) ( not ( = ?auto_818653 ?auto_818668 ) ) ( not ( = ?auto_818653 ?auto_818669 ) ) ( not ( = ?auto_818654 ?auto_818655 ) ) ( not ( = ?auto_818654 ?auto_818656 ) ) ( not ( = ?auto_818654 ?auto_818657 ) ) ( not ( = ?auto_818654 ?auto_818658 ) ) ( not ( = ?auto_818654 ?auto_818659 ) ) ( not ( = ?auto_818654 ?auto_818660 ) ) ( not ( = ?auto_818654 ?auto_818661 ) ) ( not ( = ?auto_818654 ?auto_818662 ) ) ( not ( = ?auto_818654 ?auto_818663 ) ) ( not ( = ?auto_818654 ?auto_818664 ) ) ( not ( = ?auto_818654 ?auto_818665 ) ) ( not ( = ?auto_818654 ?auto_818666 ) ) ( not ( = ?auto_818654 ?auto_818667 ) ) ( not ( = ?auto_818654 ?auto_818668 ) ) ( not ( = ?auto_818654 ?auto_818669 ) ) ( not ( = ?auto_818655 ?auto_818656 ) ) ( not ( = ?auto_818655 ?auto_818657 ) ) ( not ( = ?auto_818655 ?auto_818658 ) ) ( not ( = ?auto_818655 ?auto_818659 ) ) ( not ( = ?auto_818655 ?auto_818660 ) ) ( not ( = ?auto_818655 ?auto_818661 ) ) ( not ( = ?auto_818655 ?auto_818662 ) ) ( not ( = ?auto_818655 ?auto_818663 ) ) ( not ( = ?auto_818655 ?auto_818664 ) ) ( not ( = ?auto_818655 ?auto_818665 ) ) ( not ( = ?auto_818655 ?auto_818666 ) ) ( not ( = ?auto_818655 ?auto_818667 ) ) ( not ( = ?auto_818655 ?auto_818668 ) ) ( not ( = ?auto_818655 ?auto_818669 ) ) ( not ( = ?auto_818656 ?auto_818657 ) ) ( not ( = ?auto_818656 ?auto_818658 ) ) ( not ( = ?auto_818656 ?auto_818659 ) ) ( not ( = ?auto_818656 ?auto_818660 ) ) ( not ( = ?auto_818656 ?auto_818661 ) ) ( not ( = ?auto_818656 ?auto_818662 ) ) ( not ( = ?auto_818656 ?auto_818663 ) ) ( not ( = ?auto_818656 ?auto_818664 ) ) ( not ( = ?auto_818656 ?auto_818665 ) ) ( not ( = ?auto_818656 ?auto_818666 ) ) ( not ( = ?auto_818656 ?auto_818667 ) ) ( not ( = ?auto_818656 ?auto_818668 ) ) ( not ( = ?auto_818656 ?auto_818669 ) ) ( not ( = ?auto_818657 ?auto_818658 ) ) ( not ( = ?auto_818657 ?auto_818659 ) ) ( not ( = ?auto_818657 ?auto_818660 ) ) ( not ( = ?auto_818657 ?auto_818661 ) ) ( not ( = ?auto_818657 ?auto_818662 ) ) ( not ( = ?auto_818657 ?auto_818663 ) ) ( not ( = ?auto_818657 ?auto_818664 ) ) ( not ( = ?auto_818657 ?auto_818665 ) ) ( not ( = ?auto_818657 ?auto_818666 ) ) ( not ( = ?auto_818657 ?auto_818667 ) ) ( not ( = ?auto_818657 ?auto_818668 ) ) ( not ( = ?auto_818657 ?auto_818669 ) ) ( not ( = ?auto_818658 ?auto_818659 ) ) ( not ( = ?auto_818658 ?auto_818660 ) ) ( not ( = ?auto_818658 ?auto_818661 ) ) ( not ( = ?auto_818658 ?auto_818662 ) ) ( not ( = ?auto_818658 ?auto_818663 ) ) ( not ( = ?auto_818658 ?auto_818664 ) ) ( not ( = ?auto_818658 ?auto_818665 ) ) ( not ( = ?auto_818658 ?auto_818666 ) ) ( not ( = ?auto_818658 ?auto_818667 ) ) ( not ( = ?auto_818658 ?auto_818668 ) ) ( not ( = ?auto_818658 ?auto_818669 ) ) ( not ( = ?auto_818659 ?auto_818660 ) ) ( not ( = ?auto_818659 ?auto_818661 ) ) ( not ( = ?auto_818659 ?auto_818662 ) ) ( not ( = ?auto_818659 ?auto_818663 ) ) ( not ( = ?auto_818659 ?auto_818664 ) ) ( not ( = ?auto_818659 ?auto_818665 ) ) ( not ( = ?auto_818659 ?auto_818666 ) ) ( not ( = ?auto_818659 ?auto_818667 ) ) ( not ( = ?auto_818659 ?auto_818668 ) ) ( not ( = ?auto_818659 ?auto_818669 ) ) ( not ( = ?auto_818660 ?auto_818661 ) ) ( not ( = ?auto_818660 ?auto_818662 ) ) ( not ( = ?auto_818660 ?auto_818663 ) ) ( not ( = ?auto_818660 ?auto_818664 ) ) ( not ( = ?auto_818660 ?auto_818665 ) ) ( not ( = ?auto_818660 ?auto_818666 ) ) ( not ( = ?auto_818660 ?auto_818667 ) ) ( not ( = ?auto_818660 ?auto_818668 ) ) ( not ( = ?auto_818660 ?auto_818669 ) ) ( not ( = ?auto_818661 ?auto_818662 ) ) ( not ( = ?auto_818661 ?auto_818663 ) ) ( not ( = ?auto_818661 ?auto_818664 ) ) ( not ( = ?auto_818661 ?auto_818665 ) ) ( not ( = ?auto_818661 ?auto_818666 ) ) ( not ( = ?auto_818661 ?auto_818667 ) ) ( not ( = ?auto_818661 ?auto_818668 ) ) ( not ( = ?auto_818661 ?auto_818669 ) ) ( not ( = ?auto_818662 ?auto_818663 ) ) ( not ( = ?auto_818662 ?auto_818664 ) ) ( not ( = ?auto_818662 ?auto_818665 ) ) ( not ( = ?auto_818662 ?auto_818666 ) ) ( not ( = ?auto_818662 ?auto_818667 ) ) ( not ( = ?auto_818662 ?auto_818668 ) ) ( not ( = ?auto_818662 ?auto_818669 ) ) ( not ( = ?auto_818663 ?auto_818664 ) ) ( not ( = ?auto_818663 ?auto_818665 ) ) ( not ( = ?auto_818663 ?auto_818666 ) ) ( not ( = ?auto_818663 ?auto_818667 ) ) ( not ( = ?auto_818663 ?auto_818668 ) ) ( not ( = ?auto_818663 ?auto_818669 ) ) ( not ( = ?auto_818664 ?auto_818665 ) ) ( not ( = ?auto_818664 ?auto_818666 ) ) ( not ( = ?auto_818664 ?auto_818667 ) ) ( not ( = ?auto_818664 ?auto_818668 ) ) ( not ( = ?auto_818664 ?auto_818669 ) ) ( not ( = ?auto_818665 ?auto_818666 ) ) ( not ( = ?auto_818665 ?auto_818667 ) ) ( not ( = ?auto_818665 ?auto_818668 ) ) ( not ( = ?auto_818665 ?auto_818669 ) ) ( not ( = ?auto_818666 ?auto_818667 ) ) ( not ( = ?auto_818666 ?auto_818668 ) ) ( not ( = ?auto_818666 ?auto_818669 ) ) ( not ( = ?auto_818667 ?auto_818668 ) ) ( not ( = ?auto_818667 ?auto_818669 ) ) ( not ( = ?auto_818668 ?auto_818669 ) ) ( ON ?auto_818668 ?auto_818669 ) ( ON ?auto_818667 ?auto_818668 ) ( ON ?auto_818666 ?auto_818667 ) ( ON ?auto_818665 ?auto_818666 ) ( ON ?auto_818664 ?auto_818665 ) ( ON ?auto_818663 ?auto_818664 ) ( ON ?auto_818662 ?auto_818663 ) ( ON ?auto_818661 ?auto_818662 ) ( ON ?auto_818660 ?auto_818661 ) ( ON ?auto_818659 ?auto_818660 ) ( ON ?auto_818658 ?auto_818659 ) ( ON ?auto_818657 ?auto_818658 ) ( ON ?auto_818656 ?auto_818657 ) ( ON ?auto_818655 ?auto_818656 ) ( CLEAR ?auto_818653 ) ( ON ?auto_818654 ?auto_818655 ) ( CLEAR ?auto_818654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_818652 ?auto_818653 ?auto_818654 )
      ( MAKE-18PILE ?auto_818652 ?auto_818653 ?auto_818654 ?auto_818655 ?auto_818656 ?auto_818657 ?auto_818658 ?auto_818659 ?auto_818660 ?auto_818661 ?auto_818662 ?auto_818663 ?auto_818664 ?auto_818665 ?auto_818666 ?auto_818667 ?auto_818668 ?auto_818669 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818688 - BLOCK
      ?auto_818689 - BLOCK
      ?auto_818690 - BLOCK
      ?auto_818691 - BLOCK
      ?auto_818692 - BLOCK
      ?auto_818693 - BLOCK
      ?auto_818694 - BLOCK
      ?auto_818695 - BLOCK
      ?auto_818696 - BLOCK
      ?auto_818697 - BLOCK
      ?auto_818698 - BLOCK
      ?auto_818699 - BLOCK
      ?auto_818700 - BLOCK
      ?auto_818701 - BLOCK
      ?auto_818702 - BLOCK
      ?auto_818703 - BLOCK
      ?auto_818704 - BLOCK
      ?auto_818705 - BLOCK
    )
    :vars
    (
      ?auto_818706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818705 ?auto_818706 ) ( ON-TABLE ?auto_818688 ) ( not ( = ?auto_818688 ?auto_818689 ) ) ( not ( = ?auto_818688 ?auto_818690 ) ) ( not ( = ?auto_818688 ?auto_818691 ) ) ( not ( = ?auto_818688 ?auto_818692 ) ) ( not ( = ?auto_818688 ?auto_818693 ) ) ( not ( = ?auto_818688 ?auto_818694 ) ) ( not ( = ?auto_818688 ?auto_818695 ) ) ( not ( = ?auto_818688 ?auto_818696 ) ) ( not ( = ?auto_818688 ?auto_818697 ) ) ( not ( = ?auto_818688 ?auto_818698 ) ) ( not ( = ?auto_818688 ?auto_818699 ) ) ( not ( = ?auto_818688 ?auto_818700 ) ) ( not ( = ?auto_818688 ?auto_818701 ) ) ( not ( = ?auto_818688 ?auto_818702 ) ) ( not ( = ?auto_818688 ?auto_818703 ) ) ( not ( = ?auto_818688 ?auto_818704 ) ) ( not ( = ?auto_818688 ?auto_818705 ) ) ( not ( = ?auto_818688 ?auto_818706 ) ) ( not ( = ?auto_818689 ?auto_818690 ) ) ( not ( = ?auto_818689 ?auto_818691 ) ) ( not ( = ?auto_818689 ?auto_818692 ) ) ( not ( = ?auto_818689 ?auto_818693 ) ) ( not ( = ?auto_818689 ?auto_818694 ) ) ( not ( = ?auto_818689 ?auto_818695 ) ) ( not ( = ?auto_818689 ?auto_818696 ) ) ( not ( = ?auto_818689 ?auto_818697 ) ) ( not ( = ?auto_818689 ?auto_818698 ) ) ( not ( = ?auto_818689 ?auto_818699 ) ) ( not ( = ?auto_818689 ?auto_818700 ) ) ( not ( = ?auto_818689 ?auto_818701 ) ) ( not ( = ?auto_818689 ?auto_818702 ) ) ( not ( = ?auto_818689 ?auto_818703 ) ) ( not ( = ?auto_818689 ?auto_818704 ) ) ( not ( = ?auto_818689 ?auto_818705 ) ) ( not ( = ?auto_818689 ?auto_818706 ) ) ( not ( = ?auto_818690 ?auto_818691 ) ) ( not ( = ?auto_818690 ?auto_818692 ) ) ( not ( = ?auto_818690 ?auto_818693 ) ) ( not ( = ?auto_818690 ?auto_818694 ) ) ( not ( = ?auto_818690 ?auto_818695 ) ) ( not ( = ?auto_818690 ?auto_818696 ) ) ( not ( = ?auto_818690 ?auto_818697 ) ) ( not ( = ?auto_818690 ?auto_818698 ) ) ( not ( = ?auto_818690 ?auto_818699 ) ) ( not ( = ?auto_818690 ?auto_818700 ) ) ( not ( = ?auto_818690 ?auto_818701 ) ) ( not ( = ?auto_818690 ?auto_818702 ) ) ( not ( = ?auto_818690 ?auto_818703 ) ) ( not ( = ?auto_818690 ?auto_818704 ) ) ( not ( = ?auto_818690 ?auto_818705 ) ) ( not ( = ?auto_818690 ?auto_818706 ) ) ( not ( = ?auto_818691 ?auto_818692 ) ) ( not ( = ?auto_818691 ?auto_818693 ) ) ( not ( = ?auto_818691 ?auto_818694 ) ) ( not ( = ?auto_818691 ?auto_818695 ) ) ( not ( = ?auto_818691 ?auto_818696 ) ) ( not ( = ?auto_818691 ?auto_818697 ) ) ( not ( = ?auto_818691 ?auto_818698 ) ) ( not ( = ?auto_818691 ?auto_818699 ) ) ( not ( = ?auto_818691 ?auto_818700 ) ) ( not ( = ?auto_818691 ?auto_818701 ) ) ( not ( = ?auto_818691 ?auto_818702 ) ) ( not ( = ?auto_818691 ?auto_818703 ) ) ( not ( = ?auto_818691 ?auto_818704 ) ) ( not ( = ?auto_818691 ?auto_818705 ) ) ( not ( = ?auto_818691 ?auto_818706 ) ) ( not ( = ?auto_818692 ?auto_818693 ) ) ( not ( = ?auto_818692 ?auto_818694 ) ) ( not ( = ?auto_818692 ?auto_818695 ) ) ( not ( = ?auto_818692 ?auto_818696 ) ) ( not ( = ?auto_818692 ?auto_818697 ) ) ( not ( = ?auto_818692 ?auto_818698 ) ) ( not ( = ?auto_818692 ?auto_818699 ) ) ( not ( = ?auto_818692 ?auto_818700 ) ) ( not ( = ?auto_818692 ?auto_818701 ) ) ( not ( = ?auto_818692 ?auto_818702 ) ) ( not ( = ?auto_818692 ?auto_818703 ) ) ( not ( = ?auto_818692 ?auto_818704 ) ) ( not ( = ?auto_818692 ?auto_818705 ) ) ( not ( = ?auto_818692 ?auto_818706 ) ) ( not ( = ?auto_818693 ?auto_818694 ) ) ( not ( = ?auto_818693 ?auto_818695 ) ) ( not ( = ?auto_818693 ?auto_818696 ) ) ( not ( = ?auto_818693 ?auto_818697 ) ) ( not ( = ?auto_818693 ?auto_818698 ) ) ( not ( = ?auto_818693 ?auto_818699 ) ) ( not ( = ?auto_818693 ?auto_818700 ) ) ( not ( = ?auto_818693 ?auto_818701 ) ) ( not ( = ?auto_818693 ?auto_818702 ) ) ( not ( = ?auto_818693 ?auto_818703 ) ) ( not ( = ?auto_818693 ?auto_818704 ) ) ( not ( = ?auto_818693 ?auto_818705 ) ) ( not ( = ?auto_818693 ?auto_818706 ) ) ( not ( = ?auto_818694 ?auto_818695 ) ) ( not ( = ?auto_818694 ?auto_818696 ) ) ( not ( = ?auto_818694 ?auto_818697 ) ) ( not ( = ?auto_818694 ?auto_818698 ) ) ( not ( = ?auto_818694 ?auto_818699 ) ) ( not ( = ?auto_818694 ?auto_818700 ) ) ( not ( = ?auto_818694 ?auto_818701 ) ) ( not ( = ?auto_818694 ?auto_818702 ) ) ( not ( = ?auto_818694 ?auto_818703 ) ) ( not ( = ?auto_818694 ?auto_818704 ) ) ( not ( = ?auto_818694 ?auto_818705 ) ) ( not ( = ?auto_818694 ?auto_818706 ) ) ( not ( = ?auto_818695 ?auto_818696 ) ) ( not ( = ?auto_818695 ?auto_818697 ) ) ( not ( = ?auto_818695 ?auto_818698 ) ) ( not ( = ?auto_818695 ?auto_818699 ) ) ( not ( = ?auto_818695 ?auto_818700 ) ) ( not ( = ?auto_818695 ?auto_818701 ) ) ( not ( = ?auto_818695 ?auto_818702 ) ) ( not ( = ?auto_818695 ?auto_818703 ) ) ( not ( = ?auto_818695 ?auto_818704 ) ) ( not ( = ?auto_818695 ?auto_818705 ) ) ( not ( = ?auto_818695 ?auto_818706 ) ) ( not ( = ?auto_818696 ?auto_818697 ) ) ( not ( = ?auto_818696 ?auto_818698 ) ) ( not ( = ?auto_818696 ?auto_818699 ) ) ( not ( = ?auto_818696 ?auto_818700 ) ) ( not ( = ?auto_818696 ?auto_818701 ) ) ( not ( = ?auto_818696 ?auto_818702 ) ) ( not ( = ?auto_818696 ?auto_818703 ) ) ( not ( = ?auto_818696 ?auto_818704 ) ) ( not ( = ?auto_818696 ?auto_818705 ) ) ( not ( = ?auto_818696 ?auto_818706 ) ) ( not ( = ?auto_818697 ?auto_818698 ) ) ( not ( = ?auto_818697 ?auto_818699 ) ) ( not ( = ?auto_818697 ?auto_818700 ) ) ( not ( = ?auto_818697 ?auto_818701 ) ) ( not ( = ?auto_818697 ?auto_818702 ) ) ( not ( = ?auto_818697 ?auto_818703 ) ) ( not ( = ?auto_818697 ?auto_818704 ) ) ( not ( = ?auto_818697 ?auto_818705 ) ) ( not ( = ?auto_818697 ?auto_818706 ) ) ( not ( = ?auto_818698 ?auto_818699 ) ) ( not ( = ?auto_818698 ?auto_818700 ) ) ( not ( = ?auto_818698 ?auto_818701 ) ) ( not ( = ?auto_818698 ?auto_818702 ) ) ( not ( = ?auto_818698 ?auto_818703 ) ) ( not ( = ?auto_818698 ?auto_818704 ) ) ( not ( = ?auto_818698 ?auto_818705 ) ) ( not ( = ?auto_818698 ?auto_818706 ) ) ( not ( = ?auto_818699 ?auto_818700 ) ) ( not ( = ?auto_818699 ?auto_818701 ) ) ( not ( = ?auto_818699 ?auto_818702 ) ) ( not ( = ?auto_818699 ?auto_818703 ) ) ( not ( = ?auto_818699 ?auto_818704 ) ) ( not ( = ?auto_818699 ?auto_818705 ) ) ( not ( = ?auto_818699 ?auto_818706 ) ) ( not ( = ?auto_818700 ?auto_818701 ) ) ( not ( = ?auto_818700 ?auto_818702 ) ) ( not ( = ?auto_818700 ?auto_818703 ) ) ( not ( = ?auto_818700 ?auto_818704 ) ) ( not ( = ?auto_818700 ?auto_818705 ) ) ( not ( = ?auto_818700 ?auto_818706 ) ) ( not ( = ?auto_818701 ?auto_818702 ) ) ( not ( = ?auto_818701 ?auto_818703 ) ) ( not ( = ?auto_818701 ?auto_818704 ) ) ( not ( = ?auto_818701 ?auto_818705 ) ) ( not ( = ?auto_818701 ?auto_818706 ) ) ( not ( = ?auto_818702 ?auto_818703 ) ) ( not ( = ?auto_818702 ?auto_818704 ) ) ( not ( = ?auto_818702 ?auto_818705 ) ) ( not ( = ?auto_818702 ?auto_818706 ) ) ( not ( = ?auto_818703 ?auto_818704 ) ) ( not ( = ?auto_818703 ?auto_818705 ) ) ( not ( = ?auto_818703 ?auto_818706 ) ) ( not ( = ?auto_818704 ?auto_818705 ) ) ( not ( = ?auto_818704 ?auto_818706 ) ) ( not ( = ?auto_818705 ?auto_818706 ) ) ( ON ?auto_818704 ?auto_818705 ) ( ON ?auto_818703 ?auto_818704 ) ( ON ?auto_818702 ?auto_818703 ) ( ON ?auto_818701 ?auto_818702 ) ( ON ?auto_818700 ?auto_818701 ) ( ON ?auto_818699 ?auto_818700 ) ( ON ?auto_818698 ?auto_818699 ) ( ON ?auto_818697 ?auto_818698 ) ( ON ?auto_818696 ?auto_818697 ) ( ON ?auto_818695 ?auto_818696 ) ( ON ?auto_818694 ?auto_818695 ) ( ON ?auto_818693 ?auto_818694 ) ( ON ?auto_818692 ?auto_818693 ) ( ON ?auto_818691 ?auto_818692 ) ( ON ?auto_818690 ?auto_818691 ) ( CLEAR ?auto_818688 ) ( ON ?auto_818689 ?auto_818690 ) ( CLEAR ?auto_818689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_818688 ?auto_818689 )
      ( MAKE-18PILE ?auto_818688 ?auto_818689 ?auto_818690 ?auto_818691 ?auto_818692 ?auto_818693 ?auto_818694 ?auto_818695 ?auto_818696 ?auto_818697 ?auto_818698 ?auto_818699 ?auto_818700 ?auto_818701 ?auto_818702 ?auto_818703 ?auto_818704 ?auto_818705 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818725 - BLOCK
      ?auto_818726 - BLOCK
      ?auto_818727 - BLOCK
      ?auto_818728 - BLOCK
      ?auto_818729 - BLOCK
      ?auto_818730 - BLOCK
      ?auto_818731 - BLOCK
      ?auto_818732 - BLOCK
      ?auto_818733 - BLOCK
      ?auto_818734 - BLOCK
      ?auto_818735 - BLOCK
      ?auto_818736 - BLOCK
      ?auto_818737 - BLOCK
      ?auto_818738 - BLOCK
      ?auto_818739 - BLOCK
      ?auto_818740 - BLOCK
      ?auto_818741 - BLOCK
      ?auto_818742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818742 ) ( ON-TABLE ?auto_818725 ) ( not ( = ?auto_818725 ?auto_818726 ) ) ( not ( = ?auto_818725 ?auto_818727 ) ) ( not ( = ?auto_818725 ?auto_818728 ) ) ( not ( = ?auto_818725 ?auto_818729 ) ) ( not ( = ?auto_818725 ?auto_818730 ) ) ( not ( = ?auto_818725 ?auto_818731 ) ) ( not ( = ?auto_818725 ?auto_818732 ) ) ( not ( = ?auto_818725 ?auto_818733 ) ) ( not ( = ?auto_818725 ?auto_818734 ) ) ( not ( = ?auto_818725 ?auto_818735 ) ) ( not ( = ?auto_818725 ?auto_818736 ) ) ( not ( = ?auto_818725 ?auto_818737 ) ) ( not ( = ?auto_818725 ?auto_818738 ) ) ( not ( = ?auto_818725 ?auto_818739 ) ) ( not ( = ?auto_818725 ?auto_818740 ) ) ( not ( = ?auto_818725 ?auto_818741 ) ) ( not ( = ?auto_818725 ?auto_818742 ) ) ( not ( = ?auto_818726 ?auto_818727 ) ) ( not ( = ?auto_818726 ?auto_818728 ) ) ( not ( = ?auto_818726 ?auto_818729 ) ) ( not ( = ?auto_818726 ?auto_818730 ) ) ( not ( = ?auto_818726 ?auto_818731 ) ) ( not ( = ?auto_818726 ?auto_818732 ) ) ( not ( = ?auto_818726 ?auto_818733 ) ) ( not ( = ?auto_818726 ?auto_818734 ) ) ( not ( = ?auto_818726 ?auto_818735 ) ) ( not ( = ?auto_818726 ?auto_818736 ) ) ( not ( = ?auto_818726 ?auto_818737 ) ) ( not ( = ?auto_818726 ?auto_818738 ) ) ( not ( = ?auto_818726 ?auto_818739 ) ) ( not ( = ?auto_818726 ?auto_818740 ) ) ( not ( = ?auto_818726 ?auto_818741 ) ) ( not ( = ?auto_818726 ?auto_818742 ) ) ( not ( = ?auto_818727 ?auto_818728 ) ) ( not ( = ?auto_818727 ?auto_818729 ) ) ( not ( = ?auto_818727 ?auto_818730 ) ) ( not ( = ?auto_818727 ?auto_818731 ) ) ( not ( = ?auto_818727 ?auto_818732 ) ) ( not ( = ?auto_818727 ?auto_818733 ) ) ( not ( = ?auto_818727 ?auto_818734 ) ) ( not ( = ?auto_818727 ?auto_818735 ) ) ( not ( = ?auto_818727 ?auto_818736 ) ) ( not ( = ?auto_818727 ?auto_818737 ) ) ( not ( = ?auto_818727 ?auto_818738 ) ) ( not ( = ?auto_818727 ?auto_818739 ) ) ( not ( = ?auto_818727 ?auto_818740 ) ) ( not ( = ?auto_818727 ?auto_818741 ) ) ( not ( = ?auto_818727 ?auto_818742 ) ) ( not ( = ?auto_818728 ?auto_818729 ) ) ( not ( = ?auto_818728 ?auto_818730 ) ) ( not ( = ?auto_818728 ?auto_818731 ) ) ( not ( = ?auto_818728 ?auto_818732 ) ) ( not ( = ?auto_818728 ?auto_818733 ) ) ( not ( = ?auto_818728 ?auto_818734 ) ) ( not ( = ?auto_818728 ?auto_818735 ) ) ( not ( = ?auto_818728 ?auto_818736 ) ) ( not ( = ?auto_818728 ?auto_818737 ) ) ( not ( = ?auto_818728 ?auto_818738 ) ) ( not ( = ?auto_818728 ?auto_818739 ) ) ( not ( = ?auto_818728 ?auto_818740 ) ) ( not ( = ?auto_818728 ?auto_818741 ) ) ( not ( = ?auto_818728 ?auto_818742 ) ) ( not ( = ?auto_818729 ?auto_818730 ) ) ( not ( = ?auto_818729 ?auto_818731 ) ) ( not ( = ?auto_818729 ?auto_818732 ) ) ( not ( = ?auto_818729 ?auto_818733 ) ) ( not ( = ?auto_818729 ?auto_818734 ) ) ( not ( = ?auto_818729 ?auto_818735 ) ) ( not ( = ?auto_818729 ?auto_818736 ) ) ( not ( = ?auto_818729 ?auto_818737 ) ) ( not ( = ?auto_818729 ?auto_818738 ) ) ( not ( = ?auto_818729 ?auto_818739 ) ) ( not ( = ?auto_818729 ?auto_818740 ) ) ( not ( = ?auto_818729 ?auto_818741 ) ) ( not ( = ?auto_818729 ?auto_818742 ) ) ( not ( = ?auto_818730 ?auto_818731 ) ) ( not ( = ?auto_818730 ?auto_818732 ) ) ( not ( = ?auto_818730 ?auto_818733 ) ) ( not ( = ?auto_818730 ?auto_818734 ) ) ( not ( = ?auto_818730 ?auto_818735 ) ) ( not ( = ?auto_818730 ?auto_818736 ) ) ( not ( = ?auto_818730 ?auto_818737 ) ) ( not ( = ?auto_818730 ?auto_818738 ) ) ( not ( = ?auto_818730 ?auto_818739 ) ) ( not ( = ?auto_818730 ?auto_818740 ) ) ( not ( = ?auto_818730 ?auto_818741 ) ) ( not ( = ?auto_818730 ?auto_818742 ) ) ( not ( = ?auto_818731 ?auto_818732 ) ) ( not ( = ?auto_818731 ?auto_818733 ) ) ( not ( = ?auto_818731 ?auto_818734 ) ) ( not ( = ?auto_818731 ?auto_818735 ) ) ( not ( = ?auto_818731 ?auto_818736 ) ) ( not ( = ?auto_818731 ?auto_818737 ) ) ( not ( = ?auto_818731 ?auto_818738 ) ) ( not ( = ?auto_818731 ?auto_818739 ) ) ( not ( = ?auto_818731 ?auto_818740 ) ) ( not ( = ?auto_818731 ?auto_818741 ) ) ( not ( = ?auto_818731 ?auto_818742 ) ) ( not ( = ?auto_818732 ?auto_818733 ) ) ( not ( = ?auto_818732 ?auto_818734 ) ) ( not ( = ?auto_818732 ?auto_818735 ) ) ( not ( = ?auto_818732 ?auto_818736 ) ) ( not ( = ?auto_818732 ?auto_818737 ) ) ( not ( = ?auto_818732 ?auto_818738 ) ) ( not ( = ?auto_818732 ?auto_818739 ) ) ( not ( = ?auto_818732 ?auto_818740 ) ) ( not ( = ?auto_818732 ?auto_818741 ) ) ( not ( = ?auto_818732 ?auto_818742 ) ) ( not ( = ?auto_818733 ?auto_818734 ) ) ( not ( = ?auto_818733 ?auto_818735 ) ) ( not ( = ?auto_818733 ?auto_818736 ) ) ( not ( = ?auto_818733 ?auto_818737 ) ) ( not ( = ?auto_818733 ?auto_818738 ) ) ( not ( = ?auto_818733 ?auto_818739 ) ) ( not ( = ?auto_818733 ?auto_818740 ) ) ( not ( = ?auto_818733 ?auto_818741 ) ) ( not ( = ?auto_818733 ?auto_818742 ) ) ( not ( = ?auto_818734 ?auto_818735 ) ) ( not ( = ?auto_818734 ?auto_818736 ) ) ( not ( = ?auto_818734 ?auto_818737 ) ) ( not ( = ?auto_818734 ?auto_818738 ) ) ( not ( = ?auto_818734 ?auto_818739 ) ) ( not ( = ?auto_818734 ?auto_818740 ) ) ( not ( = ?auto_818734 ?auto_818741 ) ) ( not ( = ?auto_818734 ?auto_818742 ) ) ( not ( = ?auto_818735 ?auto_818736 ) ) ( not ( = ?auto_818735 ?auto_818737 ) ) ( not ( = ?auto_818735 ?auto_818738 ) ) ( not ( = ?auto_818735 ?auto_818739 ) ) ( not ( = ?auto_818735 ?auto_818740 ) ) ( not ( = ?auto_818735 ?auto_818741 ) ) ( not ( = ?auto_818735 ?auto_818742 ) ) ( not ( = ?auto_818736 ?auto_818737 ) ) ( not ( = ?auto_818736 ?auto_818738 ) ) ( not ( = ?auto_818736 ?auto_818739 ) ) ( not ( = ?auto_818736 ?auto_818740 ) ) ( not ( = ?auto_818736 ?auto_818741 ) ) ( not ( = ?auto_818736 ?auto_818742 ) ) ( not ( = ?auto_818737 ?auto_818738 ) ) ( not ( = ?auto_818737 ?auto_818739 ) ) ( not ( = ?auto_818737 ?auto_818740 ) ) ( not ( = ?auto_818737 ?auto_818741 ) ) ( not ( = ?auto_818737 ?auto_818742 ) ) ( not ( = ?auto_818738 ?auto_818739 ) ) ( not ( = ?auto_818738 ?auto_818740 ) ) ( not ( = ?auto_818738 ?auto_818741 ) ) ( not ( = ?auto_818738 ?auto_818742 ) ) ( not ( = ?auto_818739 ?auto_818740 ) ) ( not ( = ?auto_818739 ?auto_818741 ) ) ( not ( = ?auto_818739 ?auto_818742 ) ) ( not ( = ?auto_818740 ?auto_818741 ) ) ( not ( = ?auto_818740 ?auto_818742 ) ) ( not ( = ?auto_818741 ?auto_818742 ) ) ( ON ?auto_818741 ?auto_818742 ) ( ON ?auto_818740 ?auto_818741 ) ( ON ?auto_818739 ?auto_818740 ) ( ON ?auto_818738 ?auto_818739 ) ( ON ?auto_818737 ?auto_818738 ) ( ON ?auto_818736 ?auto_818737 ) ( ON ?auto_818735 ?auto_818736 ) ( ON ?auto_818734 ?auto_818735 ) ( ON ?auto_818733 ?auto_818734 ) ( ON ?auto_818732 ?auto_818733 ) ( ON ?auto_818731 ?auto_818732 ) ( ON ?auto_818730 ?auto_818731 ) ( ON ?auto_818729 ?auto_818730 ) ( ON ?auto_818728 ?auto_818729 ) ( ON ?auto_818727 ?auto_818728 ) ( CLEAR ?auto_818725 ) ( ON ?auto_818726 ?auto_818727 ) ( CLEAR ?auto_818726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_818725 ?auto_818726 )
      ( MAKE-18PILE ?auto_818725 ?auto_818726 ?auto_818727 ?auto_818728 ?auto_818729 ?auto_818730 ?auto_818731 ?auto_818732 ?auto_818733 ?auto_818734 ?auto_818735 ?auto_818736 ?auto_818737 ?auto_818738 ?auto_818739 ?auto_818740 ?auto_818741 ?auto_818742 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818761 - BLOCK
      ?auto_818762 - BLOCK
      ?auto_818763 - BLOCK
      ?auto_818764 - BLOCK
      ?auto_818765 - BLOCK
      ?auto_818766 - BLOCK
      ?auto_818767 - BLOCK
      ?auto_818768 - BLOCK
      ?auto_818769 - BLOCK
      ?auto_818770 - BLOCK
      ?auto_818771 - BLOCK
      ?auto_818772 - BLOCK
      ?auto_818773 - BLOCK
      ?auto_818774 - BLOCK
      ?auto_818775 - BLOCK
      ?auto_818776 - BLOCK
      ?auto_818777 - BLOCK
      ?auto_818778 - BLOCK
    )
    :vars
    (
      ?auto_818779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818778 ?auto_818779 ) ( not ( = ?auto_818761 ?auto_818762 ) ) ( not ( = ?auto_818761 ?auto_818763 ) ) ( not ( = ?auto_818761 ?auto_818764 ) ) ( not ( = ?auto_818761 ?auto_818765 ) ) ( not ( = ?auto_818761 ?auto_818766 ) ) ( not ( = ?auto_818761 ?auto_818767 ) ) ( not ( = ?auto_818761 ?auto_818768 ) ) ( not ( = ?auto_818761 ?auto_818769 ) ) ( not ( = ?auto_818761 ?auto_818770 ) ) ( not ( = ?auto_818761 ?auto_818771 ) ) ( not ( = ?auto_818761 ?auto_818772 ) ) ( not ( = ?auto_818761 ?auto_818773 ) ) ( not ( = ?auto_818761 ?auto_818774 ) ) ( not ( = ?auto_818761 ?auto_818775 ) ) ( not ( = ?auto_818761 ?auto_818776 ) ) ( not ( = ?auto_818761 ?auto_818777 ) ) ( not ( = ?auto_818761 ?auto_818778 ) ) ( not ( = ?auto_818761 ?auto_818779 ) ) ( not ( = ?auto_818762 ?auto_818763 ) ) ( not ( = ?auto_818762 ?auto_818764 ) ) ( not ( = ?auto_818762 ?auto_818765 ) ) ( not ( = ?auto_818762 ?auto_818766 ) ) ( not ( = ?auto_818762 ?auto_818767 ) ) ( not ( = ?auto_818762 ?auto_818768 ) ) ( not ( = ?auto_818762 ?auto_818769 ) ) ( not ( = ?auto_818762 ?auto_818770 ) ) ( not ( = ?auto_818762 ?auto_818771 ) ) ( not ( = ?auto_818762 ?auto_818772 ) ) ( not ( = ?auto_818762 ?auto_818773 ) ) ( not ( = ?auto_818762 ?auto_818774 ) ) ( not ( = ?auto_818762 ?auto_818775 ) ) ( not ( = ?auto_818762 ?auto_818776 ) ) ( not ( = ?auto_818762 ?auto_818777 ) ) ( not ( = ?auto_818762 ?auto_818778 ) ) ( not ( = ?auto_818762 ?auto_818779 ) ) ( not ( = ?auto_818763 ?auto_818764 ) ) ( not ( = ?auto_818763 ?auto_818765 ) ) ( not ( = ?auto_818763 ?auto_818766 ) ) ( not ( = ?auto_818763 ?auto_818767 ) ) ( not ( = ?auto_818763 ?auto_818768 ) ) ( not ( = ?auto_818763 ?auto_818769 ) ) ( not ( = ?auto_818763 ?auto_818770 ) ) ( not ( = ?auto_818763 ?auto_818771 ) ) ( not ( = ?auto_818763 ?auto_818772 ) ) ( not ( = ?auto_818763 ?auto_818773 ) ) ( not ( = ?auto_818763 ?auto_818774 ) ) ( not ( = ?auto_818763 ?auto_818775 ) ) ( not ( = ?auto_818763 ?auto_818776 ) ) ( not ( = ?auto_818763 ?auto_818777 ) ) ( not ( = ?auto_818763 ?auto_818778 ) ) ( not ( = ?auto_818763 ?auto_818779 ) ) ( not ( = ?auto_818764 ?auto_818765 ) ) ( not ( = ?auto_818764 ?auto_818766 ) ) ( not ( = ?auto_818764 ?auto_818767 ) ) ( not ( = ?auto_818764 ?auto_818768 ) ) ( not ( = ?auto_818764 ?auto_818769 ) ) ( not ( = ?auto_818764 ?auto_818770 ) ) ( not ( = ?auto_818764 ?auto_818771 ) ) ( not ( = ?auto_818764 ?auto_818772 ) ) ( not ( = ?auto_818764 ?auto_818773 ) ) ( not ( = ?auto_818764 ?auto_818774 ) ) ( not ( = ?auto_818764 ?auto_818775 ) ) ( not ( = ?auto_818764 ?auto_818776 ) ) ( not ( = ?auto_818764 ?auto_818777 ) ) ( not ( = ?auto_818764 ?auto_818778 ) ) ( not ( = ?auto_818764 ?auto_818779 ) ) ( not ( = ?auto_818765 ?auto_818766 ) ) ( not ( = ?auto_818765 ?auto_818767 ) ) ( not ( = ?auto_818765 ?auto_818768 ) ) ( not ( = ?auto_818765 ?auto_818769 ) ) ( not ( = ?auto_818765 ?auto_818770 ) ) ( not ( = ?auto_818765 ?auto_818771 ) ) ( not ( = ?auto_818765 ?auto_818772 ) ) ( not ( = ?auto_818765 ?auto_818773 ) ) ( not ( = ?auto_818765 ?auto_818774 ) ) ( not ( = ?auto_818765 ?auto_818775 ) ) ( not ( = ?auto_818765 ?auto_818776 ) ) ( not ( = ?auto_818765 ?auto_818777 ) ) ( not ( = ?auto_818765 ?auto_818778 ) ) ( not ( = ?auto_818765 ?auto_818779 ) ) ( not ( = ?auto_818766 ?auto_818767 ) ) ( not ( = ?auto_818766 ?auto_818768 ) ) ( not ( = ?auto_818766 ?auto_818769 ) ) ( not ( = ?auto_818766 ?auto_818770 ) ) ( not ( = ?auto_818766 ?auto_818771 ) ) ( not ( = ?auto_818766 ?auto_818772 ) ) ( not ( = ?auto_818766 ?auto_818773 ) ) ( not ( = ?auto_818766 ?auto_818774 ) ) ( not ( = ?auto_818766 ?auto_818775 ) ) ( not ( = ?auto_818766 ?auto_818776 ) ) ( not ( = ?auto_818766 ?auto_818777 ) ) ( not ( = ?auto_818766 ?auto_818778 ) ) ( not ( = ?auto_818766 ?auto_818779 ) ) ( not ( = ?auto_818767 ?auto_818768 ) ) ( not ( = ?auto_818767 ?auto_818769 ) ) ( not ( = ?auto_818767 ?auto_818770 ) ) ( not ( = ?auto_818767 ?auto_818771 ) ) ( not ( = ?auto_818767 ?auto_818772 ) ) ( not ( = ?auto_818767 ?auto_818773 ) ) ( not ( = ?auto_818767 ?auto_818774 ) ) ( not ( = ?auto_818767 ?auto_818775 ) ) ( not ( = ?auto_818767 ?auto_818776 ) ) ( not ( = ?auto_818767 ?auto_818777 ) ) ( not ( = ?auto_818767 ?auto_818778 ) ) ( not ( = ?auto_818767 ?auto_818779 ) ) ( not ( = ?auto_818768 ?auto_818769 ) ) ( not ( = ?auto_818768 ?auto_818770 ) ) ( not ( = ?auto_818768 ?auto_818771 ) ) ( not ( = ?auto_818768 ?auto_818772 ) ) ( not ( = ?auto_818768 ?auto_818773 ) ) ( not ( = ?auto_818768 ?auto_818774 ) ) ( not ( = ?auto_818768 ?auto_818775 ) ) ( not ( = ?auto_818768 ?auto_818776 ) ) ( not ( = ?auto_818768 ?auto_818777 ) ) ( not ( = ?auto_818768 ?auto_818778 ) ) ( not ( = ?auto_818768 ?auto_818779 ) ) ( not ( = ?auto_818769 ?auto_818770 ) ) ( not ( = ?auto_818769 ?auto_818771 ) ) ( not ( = ?auto_818769 ?auto_818772 ) ) ( not ( = ?auto_818769 ?auto_818773 ) ) ( not ( = ?auto_818769 ?auto_818774 ) ) ( not ( = ?auto_818769 ?auto_818775 ) ) ( not ( = ?auto_818769 ?auto_818776 ) ) ( not ( = ?auto_818769 ?auto_818777 ) ) ( not ( = ?auto_818769 ?auto_818778 ) ) ( not ( = ?auto_818769 ?auto_818779 ) ) ( not ( = ?auto_818770 ?auto_818771 ) ) ( not ( = ?auto_818770 ?auto_818772 ) ) ( not ( = ?auto_818770 ?auto_818773 ) ) ( not ( = ?auto_818770 ?auto_818774 ) ) ( not ( = ?auto_818770 ?auto_818775 ) ) ( not ( = ?auto_818770 ?auto_818776 ) ) ( not ( = ?auto_818770 ?auto_818777 ) ) ( not ( = ?auto_818770 ?auto_818778 ) ) ( not ( = ?auto_818770 ?auto_818779 ) ) ( not ( = ?auto_818771 ?auto_818772 ) ) ( not ( = ?auto_818771 ?auto_818773 ) ) ( not ( = ?auto_818771 ?auto_818774 ) ) ( not ( = ?auto_818771 ?auto_818775 ) ) ( not ( = ?auto_818771 ?auto_818776 ) ) ( not ( = ?auto_818771 ?auto_818777 ) ) ( not ( = ?auto_818771 ?auto_818778 ) ) ( not ( = ?auto_818771 ?auto_818779 ) ) ( not ( = ?auto_818772 ?auto_818773 ) ) ( not ( = ?auto_818772 ?auto_818774 ) ) ( not ( = ?auto_818772 ?auto_818775 ) ) ( not ( = ?auto_818772 ?auto_818776 ) ) ( not ( = ?auto_818772 ?auto_818777 ) ) ( not ( = ?auto_818772 ?auto_818778 ) ) ( not ( = ?auto_818772 ?auto_818779 ) ) ( not ( = ?auto_818773 ?auto_818774 ) ) ( not ( = ?auto_818773 ?auto_818775 ) ) ( not ( = ?auto_818773 ?auto_818776 ) ) ( not ( = ?auto_818773 ?auto_818777 ) ) ( not ( = ?auto_818773 ?auto_818778 ) ) ( not ( = ?auto_818773 ?auto_818779 ) ) ( not ( = ?auto_818774 ?auto_818775 ) ) ( not ( = ?auto_818774 ?auto_818776 ) ) ( not ( = ?auto_818774 ?auto_818777 ) ) ( not ( = ?auto_818774 ?auto_818778 ) ) ( not ( = ?auto_818774 ?auto_818779 ) ) ( not ( = ?auto_818775 ?auto_818776 ) ) ( not ( = ?auto_818775 ?auto_818777 ) ) ( not ( = ?auto_818775 ?auto_818778 ) ) ( not ( = ?auto_818775 ?auto_818779 ) ) ( not ( = ?auto_818776 ?auto_818777 ) ) ( not ( = ?auto_818776 ?auto_818778 ) ) ( not ( = ?auto_818776 ?auto_818779 ) ) ( not ( = ?auto_818777 ?auto_818778 ) ) ( not ( = ?auto_818777 ?auto_818779 ) ) ( not ( = ?auto_818778 ?auto_818779 ) ) ( ON ?auto_818777 ?auto_818778 ) ( ON ?auto_818776 ?auto_818777 ) ( ON ?auto_818775 ?auto_818776 ) ( ON ?auto_818774 ?auto_818775 ) ( ON ?auto_818773 ?auto_818774 ) ( ON ?auto_818772 ?auto_818773 ) ( ON ?auto_818771 ?auto_818772 ) ( ON ?auto_818770 ?auto_818771 ) ( ON ?auto_818769 ?auto_818770 ) ( ON ?auto_818768 ?auto_818769 ) ( ON ?auto_818767 ?auto_818768 ) ( ON ?auto_818766 ?auto_818767 ) ( ON ?auto_818765 ?auto_818766 ) ( ON ?auto_818764 ?auto_818765 ) ( ON ?auto_818763 ?auto_818764 ) ( ON ?auto_818762 ?auto_818763 ) ( ON ?auto_818761 ?auto_818762 ) ( CLEAR ?auto_818761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_818761 )
      ( MAKE-18PILE ?auto_818761 ?auto_818762 ?auto_818763 ?auto_818764 ?auto_818765 ?auto_818766 ?auto_818767 ?auto_818768 ?auto_818769 ?auto_818770 ?auto_818771 ?auto_818772 ?auto_818773 ?auto_818774 ?auto_818775 ?auto_818776 ?auto_818777 ?auto_818778 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818798 - BLOCK
      ?auto_818799 - BLOCK
      ?auto_818800 - BLOCK
      ?auto_818801 - BLOCK
      ?auto_818802 - BLOCK
      ?auto_818803 - BLOCK
      ?auto_818804 - BLOCK
      ?auto_818805 - BLOCK
      ?auto_818806 - BLOCK
      ?auto_818807 - BLOCK
      ?auto_818808 - BLOCK
      ?auto_818809 - BLOCK
      ?auto_818810 - BLOCK
      ?auto_818811 - BLOCK
      ?auto_818812 - BLOCK
      ?auto_818813 - BLOCK
      ?auto_818814 - BLOCK
      ?auto_818815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_818815 ) ( not ( = ?auto_818798 ?auto_818799 ) ) ( not ( = ?auto_818798 ?auto_818800 ) ) ( not ( = ?auto_818798 ?auto_818801 ) ) ( not ( = ?auto_818798 ?auto_818802 ) ) ( not ( = ?auto_818798 ?auto_818803 ) ) ( not ( = ?auto_818798 ?auto_818804 ) ) ( not ( = ?auto_818798 ?auto_818805 ) ) ( not ( = ?auto_818798 ?auto_818806 ) ) ( not ( = ?auto_818798 ?auto_818807 ) ) ( not ( = ?auto_818798 ?auto_818808 ) ) ( not ( = ?auto_818798 ?auto_818809 ) ) ( not ( = ?auto_818798 ?auto_818810 ) ) ( not ( = ?auto_818798 ?auto_818811 ) ) ( not ( = ?auto_818798 ?auto_818812 ) ) ( not ( = ?auto_818798 ?auto_818813 ) ) ( not ( = ?auto_818798 ?auto_818814 ) ) ( not ( = ?auto_818798 ?auto_818815 ) ) ( not ( = ?auto_818799 ?auto_818800 ) ) ( not ( = ?auto_818799 ?auto_818801 ) ) ( not ( = ?auto_818799 ?auto_818802 ) ) ( not ( = ?auto_818799 ?auto_818803 ) ) ( not ( = ?auto_818799 ?auto_818804 ) ) ( not ( = ?auto_818799 ?auto_818805 ) ) ( not ( = ?auto_818799 ?auto_818806 ) ) ( not ( = ?auto_818799 ?auto_818807 ) ) ( not ( = ?auto_818799 ?auto_818808 ) ) ( not ( = ?auto_818799 ?auto_818809 ) ) ( not ( = ?auto_818799 ?auto_818810 ) ) ( not ( = ?auto_818799 ?auto_818811 ) ) ( not ( = ?auto_818799 ?auto_818812 ) ) ( not ( = ?auto_818799 ?auto_818813 ) ) ( not ( = ?auto_818799 ?auto_818814 ) ) ( not ( = ?auto_818799 ?auto_818815 ) ) ( not ( = ?auto_818800 ?auto_818801 ) ) ( not ( = ?auto_818800 ?auto_818802 ) ) ( not ( = ?auto_818800 ?auto_818803 ) ) ( not ( = ?auto_818800 ?auto_818804 ) ) ( not ( = ?auto_818800 ?auto_818805 ) ) ( not ( = ?auto_818800 ?auto_818806 ) ) ( not ( = ?auto_818800 ?auto_818807 ) ) ( not ( = ?auto_818800 ?auto_818808 ) ) ( not ( = ?auto_818800 ?auto_818809 ) ) ( not ( = ?auto_818800 ?auto_818810 ) ) ( not ( = ?auto_818800 ?auto_818811 ) ) ( not ( = ?auto_818800 ?auto_818812 ) ) ( not ( = ?auto_818800 ?auto_818813 ) ) ( not ( = ?auto_818800 ?auto_818814 ) ) ( not ( = ?auto_818800 ?auto_818815 ) ) ( not ( = ?auto_818801 ?auto_818802 ) ) ( not ( = ?auto_818801 ?auto_818803 ) ) ( not ( = ?auto_818801 ?auto_818804 ) ) ( not ( = ?auto_818801 ?auto_818805 ) ) ( not ( = ?auto_818801 ?auto_818806 ) ) ( not ( = ?auto_818801 ?auto_818807 ) ) ( not ( = ?auto_818801 ?auto_818808 ) ) ( not ( = ?auto_818801 ?auto_818809 ) ) ( not ( = ?auto_818801 ?auto_818810 ) ) ( not ( = ?auto_818801 ?auto_818811 ) ) ( not ( = ?auto_818801 ?auto_818812 ) ) ( not ( = ?auto_818801 ?auto_818813 ) ) ( not ( = ?auto_818801 ?auto_818814 ) ) ( not ( = ?auto_818801 ?auto_818815 ) ) ( not ( = ?auto_818802 ?auto_818803 ) ) ( not ( = ?auto_818802 ?auto_818804 ) ) ( not ( = ?auto_818802 ?auto_818805 ) ) ( not ( = ?auto_818802 ?auto_818806 ) ) ( not ( = ?auto_818802 ?auto_818807 ) ) ( not ( = ?auto_818802 ?auto_818808 ) ) ( not ( = ?auto_818802 ?auto_818809 ) ) ( not ( = ?auto_818802 ?auto_818810 ) ) ( not ( = ?auto_818802 ?auto_818811 ) ) ( not ( = ?auto_818802 ?auto_818812 ) ) ( not ( = ?auto_818802 ?auto_818813 ) ) ( not ( = ?auto_818802 ?auto_818814 ) ) ( not ( = ?auto_818802 ?auto_818815 ) ) ( not ( = ?auto_818803 ?auto_818804 ) ) ( not ( = ?auto_818803 ?auto_818805 ) ) ( not ( = ?auto_818803 ?auto_818806 ) ) ( not ( = ?auto_818803 ?auto_818807 ) ) ( not ( = ?auto_818803 ?auto_818808 ) ) ( not ( = ?auto_818803 ?auto_818809 ) ) ( not ( = ?auto_818803 ?auto_818810 ) ) ( not ( = ?auto_818803 ?auto_818811 ) ) ( not ( = ?auto_818803 ?auto_818812 ) ) ( not ( = ?auto_818803 ?auto_818813 ) ) ( not ( = ?auto_818803 ?auto_818814 ) ) ( not ( = ?auto_818803 ?auto_818815 ) ) ( not ( = ?auto_818804 ?auto_818805 ) ) ( not ( = ?auto_818804 ?auto_818806 ) ) ( not ( = ?auto_818804 ?auto_818807 ) ) ( not ( = ?auto_818804 ?auto_818808 ) ) ( not ( = ?auto_818804 ?auto_818809 ) ) ( not ( = ?auto_818804 ?auto_818810 ) ) ( not ( = ?auto_818804 ?auto_818811 ) ) ( not ( = ?auto_818804 ?auto_818812 ) ) ( not ( = ?auto_818804 ?auto_818813 ) ) ( not ( = ?auto_818804 ?auto_818814 ) ) ( not ( = ?auto_818804 ?auto_818815 ) ) ( not ( = ?auto_818805 ?auto_818806 ) ) ( not ( = ?auto_818805 ?auto_818807 ) ) ( not ( = ?auto_818805 ?auto_818808 ) ) ( not ( = ?auto_818805 ?auto_818809 ) ) ( not ( = ?auto_818805 ?auto_818810 ) ) ( not ( = ?auto_818805 ?auto_818811 ) ) ( not ( = ?auto_818805 ?auto_818812 ) ) ( not ( = ?auto_818805 ?auto_818813 ) ) ( not ( = ?auto_818805 ?auto_818814 ) ) ( not ( = ?auto_818805 ?auto_818815 ) ) ( not ( = ?auto_818806 ?auto_818807 ) ) ( not ( = ?auto_818806 ?auto_818808 ) ) ( not ( = ?auto_818806 ?auto_818809 ) ) ( not ( = ?auto_818806 ?auto_818810 ) ) ( not ( = ?auto_818806 ?auto_818811 ) ) ( not ( = ?auto_818806 ?auto_818812 ) ) ( not ( = ?auto_818806 ?auto_818813 ) ) ( not ( = ?auto_818806 ?auto_818814 ) ) ( not ( = ?auto_818806 ?auto_818815 ) ) ( not ( = ?auto_818807 ?auto_818808 ) ) ( not ( = ?auto_818807 ?auto_818809 ) ) ( not ( = ?auto_818807 ?auto_818810 ) ) ( not ( = ?auto_818807 ?auto_818811 ) ) ( not ( = ?auto_818807 ?auto_818812 ) ) ( not ( = ?auto_818807 ?auto_818813 ) ) ( not ( = ?auto_818807 ?auto_818814 ) ) ( not ( = ?auto_818807 ?auto_818815 ) ) ( not ( = ?auto_818808 ?auto_818809 ) ) ( not ( = ?auto_818808 ?auto_818810 ) ) ( not ( = ?auto_818808 ?auto_818811 ) ) ( not ( = ?auto_818808 ?auto_818812 ) ) ( not ( = ?auto_818808 ?auto_818813 ) ) ( not ( = ?auto_818808 ?auto_818814 ) ) ( not ( = ?auto_818808 ?auto_818815 ) ) ( not ( = ?auto_818809 ?auto_818810 ) ) ( not ( = ?auto_818809 ?auto_818811 ) ) ( not ( = ?auto_818809 ?auto_818812 ) ) ( not ( = ?auto_818809 ?auto_818813 ) ) ( not ( = ?auto_818809 ?auto_818814 ) ) ( not ( = ?auto_818809 ?auto_818815 ) ) ( not ( = ?auto_818810 ?auto_818811 ) ) ( not ( = ?auto_818810 ?auto_818812 ) ) ( not ( = ?auto_818810 ?auto_818813 ) ) ( not ( = ?auto_818810 ?auto_818814 ) ) ( not ( = ?auto_818810 ?auto_818815 ) ) ( not ( = ?auto_818811 ?auto_818812 ) ) ( not ( = ?auto_818811 ?auto_818813 ) ) ( not ( = ?auto_818811 ?auto_818814 ) ) ( not ( = ?auto_818811 ?auto_818815 ) ) ( not ( = ?auto_818812 ?auto_818813 ) ) ( not ( = ?auto_818812 ?auto_818814 ) ) ( not ( = ?auto_818812 ?auto_818815 ) ) ( not ( = ?auto_818813 ?auto_818814 ) ) ( not ( = ?auto_818813 ?auto_818815 ) ) ( not ( = ?auto_818814 ?auto_818815 ) ) ( ON ?auto_818814 ?auto_818815 ) ( ON ?auto_818813 ?auto_818814 ) ( ON ?auto_818812 ?auto_818813 ) ( ON ?auto_818811 ?auto_818812 ) ( ON ?auto_818810 ?auto_818811 ) ( ON ?auto_818809 ?auto_818810 ) ( ON ?auto_818808 ?auto_818809 ) ( ON ?auto_818807 ?auto_818808 ) ( ON ?auto_818806 ?auto_818807 ) ( ON ?auto_818805 ?auto_818806 ) ( ON ?auto_818804 ?auto_818805 ) ( ON ?auto_818803 ?auto_818804 ) ( ON ?auto_818802 ?auto_818803 ) ( ON ?auto_818801 ?auto_818802 ) ( ON ?auto_818800 ?auto_818801 ) ( ON ?auto_818799 ?auto_818800 ) ( ON ?auto_818798 ?auto_818799 ) ( CLEAR ?auto_818798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_818798 )
      ( MAKE-18PILE ?auto_818798 ?auto_818799 ?auto_818800 ?auto_818801 ?auto_818802 ?auto_818803 ?auto_818804 ?auto_818805 ?auto_818806 ?auto_818807 ?auto_818808 ?auto_818809 ?auto_818810 ?auto_818811 ?auto_818812 ?auto_818813 ?auto_818814 ?auto_818815 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_818834 - BLOCK
      ?auto_818835 - BLOCK
      ?auto_818836 - BLOCK
      ?auto_818837 - BLOCK
      ?auto_818838 - BLOCK
      ?auto_818839 - BLOCK
      ?auto_818840 - BLOCK
      ?auto_818841 - BLOCK
      ?auto_818842 - BLOCK
      ?auto_818843 - BLOCK
      ?auto_818844 - BLOCK
      ?auto_818845 - BLOCK
      ?auto_818846 - BLOCK
      ?auto_818847 - BLOCK
      ?auto_818848 - BLOCK
      ?auto_818849 - BLOCK
      ?auto_818850 - BLOCK
      ?auto_818851 - BLOCK
    )
    :vars
    (
      ?auto_818852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_818834 ?auto_818835 ) ) ( not ( = ?auto_818834 ?auto_818836 ) ) ( not ( = ?auto_818834 ?auto_818837 ) ) ( not ( = ?auto_818834 ?auto_818838 ) ) ( not ( = ?auto_818834 ?auto_818839 ) ) ( not ( = ?auto_818834 ?auto_818840 ) ) ( not ( = ?auto_818834 ?auto_818841 ) ) ( not ( = ?auto_818834 ?auto_818842 ) ) ( not ( = ?auto_818834 ?auto_818843 ) ) ( not ( = ?auto_818834 ?auto_818844 ) ) ( not ( = ?auto_818834 ?auto_818845 ) ) ( not ( = ?auto_818834 ?auto_818846 ) ) ( not ( = ?auto_818834 ?auto_818847 ) ) ( not ( = ?auto_818834 ?auto_818848 ) ) ( not ( = ?auto_818834 ?auto_818849 ) ) ( not ( = ?auto_818834 ?auto_818850 ) ) ( not ( = ?auto_818834 ?auto_818851 ) ) ( not ( = ?auto_818835 ?auto_818836 ) ) ( not ( = ?auto_818835 ?auto_818837 ) ) ( not ( = ?auto_818835 ?auto_818838 ) ) ( not ( = ?auto_818835 ?auto_818839 ) ) ( not ( = ?auto_818835 ?auto_818840 ) ) ( not ( = ?auto_818835 ?auto_818841 ) ) ( not ( = ?auto_818835 ?auto_818842 ) ) ( not ( = ?auto_818835 ?auto_818843 ) ) ( not ( = ?auto_818835 ?auto_818844 ) ) ( not ( = ?auto_818835 ?auto_818845 ) ) ( not ( = ?auto_818835 ?auto_818846 ) ) ( not ( = ?auto_818835 ?auto_818847 ) ) ( not ( = ?auto_818835 ?auto_818848 ) ) ( not ( = ?auto_818835 ?auto_818849 ) ) ( not ( = ?auto_818835 ?auto_818850 ) ) ( not ( = ?auto_818835 ?auto_818851 ) ) ( not ( = ?auto_818836 ?auto_818837 ) ) ( not ( = ?auto_818836 ?auto_818838 ) ) ( not ( = ?auto_818836 ?auto_818839 ) ) ( not ( = ?auto_818836 ?auto_818840 ) ) ( not ( = ?auto_818836 ?auto_818841 ) ) ( not ( = ?auto_818836 ?auto_818842 ) ) ( not ( = ?auto_818836 ?auto_818843 ) ) ( not ( = ?auto_818836 ?auto_818844 ) ) ( not ( = ?auto_818836 ?auto_818845 ) ) ( not ( = ?auto_818836 ?auto_818846 ) ) ( not ( = ?auto_818836 ?auto_818847 ) ) ( not ( = ?auto_818836 ?auto_818848 ) ) ( not ( = ?auto_818836 ?auto_818849 ) ) ( not ( = ?auto_818836 ?auto_818850 ) ) ( not ( = ?auto_818836 ?auto_818851 ) ) ( not ( = ?auto_818837 ?auto_818838 ) ) ( not ( = ?auto_818837 ?auto_818839 ) ) ( not ( = ?auto_818837 ?auto_818840 ) ) ( not ( = ?auto_818837 ?auto_818841 ) ) ( not ( = ?auto_818837 ?auto_818842 ) ) ( not ( = ?auto_818837 ?auto_818843 ) ) ( not ( = ?auto_818837 ?auto_818844 ) ) ( not ( = ?auto_818837 ?auto_818845 ) ) ( not ( = ?auto_818837 ?auto_818846 ) ) ( not ( = ?auto_818837 ?auto_818847 ) ) ( not ( = ?auto_818837 ?auto_818848 ) ) ( not ( = ?auto_818837 ?auto_818849 ) ) ( not ( = ?auto_818837 ?auto_818850 ) ) ( not ( = ?auto_818837 ?auto_818851 ) ) ( not ( = ?auto_818838 ?auto_818839 ) ) ( not ( = ?auto_818838 ?auto_818840 ) ) ( not ( = ?auto_818838 ?auto_818841 ) ) ( not ( = ?auto_818838 ?auto_818842 ) ) ( not ( = ?auto_818838 ?auto_818843 ) ) ( not ( = ?auto_818838 ?auto_818844 ) ) ( not ( = ?auto_818838 ?auto_818845 ) ) ( not ( = ?auto_818838 ?auto_818846 ) ) ( not ( = ?auto_818838 ?auto_818847 ) ) ( not ( = ?auto_818838 ?auto_818848 ) ) ( not ( = ?auto_818838 ?auto_818849 ) ) ( not ( = ?auto_818838 ?auto_818850 ) ) ( not ( = ?auto_818838 ?auto_818851 ) ) ( not ( = ?auto_818839 ?auto_818840 ) ) ( not ( = ?auto_818839 ?auto_818841 ) ) ( not ( = ?auto_818839 ?auto_818842 ) ) ( not ( = ?auto_818839 ?auto_818843 ) ) ( not ( = ?auto_818839 ?auto_818844 ) ) ( not ( = ?auto_818839 ?auto_818845 ) ) ( not ( = ?auto_818839 ?auto_818846 ) ) ( not ( = ?auto_818839 ?auto_818847 ) ) ( not ( = ?auto_818839 ?auto_818848 ) ) ( not ( = ?auto_818839 ?auto_818849 ) ) ( not ( = ?auto_818839 ?auto_818850 ) ) ( not ( = ?auto_818839 ?auto_818851 ) ) ( not ( = ?auto_818840 ?auto_818841 ) ) ( not ( = ?auto_818840 ?auto_818842 ) ) ( not ( = ?auto_818840 ?auto_818843 ) ) ( not ( = ?auto_818840 ?auto_818844 ) ) ( not ( = ?auto_818840 ?auto_818845 ) ) ( not ( = ?auto_818840 ?auto_818846 ) ) ( not ( = ?auto_818840 ?auto_818847 ) ) ( not ( = ?auto_818840 ?auto_818848 ) ) ( not ( = ?auto_818840 ?auto_818849 ) ) ( not ( = ?auto_818840 ?auto_818850 ) ) ( not ( = ?auto_818840 ?auto_818851 ) ) ( not ( = ?auto_818841 ?auto_818842 ) ) ( not ( = ?auto_818841 ?auto_818843 ) ) ( not ( = ?auto_818841 ?auto_818844 ) ) ( not ( = ?auto_818841 ?auto_818845 ) ) ( not ( = ?auto_818841 ?auto_818846 ) ) ( not ( = ?auto_818841 ?auto_818847 ) ) ( not ( = ?auto_818841 ?auto_818848 ) ) ( not ( = ?auto_818841 ?auto_818849 ) ) ( not ( = ?auto_818841 ?auto_818850 ) ) ( not ( = ?auto_818841 ?auto_818851 ) ) ( not ( = ?auto_818842 ?auto_818843 ) ) ( not ( = ?auto_818842 ?auto_818844 ) ) ( not ( = ?auto_818842 ?auto_818845 ) ) ( not ( = ?auto_818842 ?auto_818846 ) ) ( not ( = ?auto_818842 ?auto_818847 ) ) ( not ( = ?auto_818842 ?auto_818848 ) ) ( not ( = ?auto_818842 ?auto_818849 ) ) ( not ( = ?auto_818842 ?auto_818850 ) ) ( not ( = ?auto_818842 ?auto_818851 ) ) ( not ( = ?auto_818843 ?auto_818844 ) ) ( not ( = ?auto_818843 ?auto_818845 ) ) ( not ( = ?auto_818843 ?auto_818846 ) ) ( not ( = ?auto_818843 ?auto_818847 ) ) ( not ( = ?auto_818843 ?auto_818848 ) ) ( not ( = ?auto_818843 ?auto_818849 ) ) ( not ( = ?auto_818843 ?auto_818850 ) ) ( not ( = ?auto_818843 ?auto_818851 ) ) ( not ( = ?auto_818844 ?auto_818845 ) ) ( not ( = ?auto_818844 ?auto_818846 ) ) ( not ( = ?auto_818844 ?auto_818847 ) ) ( not ( = ?auto_818844 ?auto_818848 ) ) ( not ( = ?auto_818844 ?auto_818849 ) ) ( not ( = ?auto_818844 ?auto_818850 ) ) ( not ( = ?auto_818844 ?auto_818851 ) ) ( not ( = ?auto_818845 ?auto_818846 ) ) ( not ( = ?auto_818845 ?auto_818847 ) ) ( not ( = ?auto_818845 ?auto_818848 ) ) ( not ( = ?auto_818845 ?auto_818849 ) ) ( not ( = ?auto_818845 ?auto_818850 ) ) ( not ( = ?auto_818845 ?auto_818851 ) ) ( not ( = ?auto_818846 ?auto_818847 ) ) ( not ( = ?auto_818846 ?auto_818848 ) ) ( not ( = ?auto_818846 ?auto_818849 ) ) ( not ( = ?auto_818846 ?auto_818850 ) ) ( not ( = ?auto_818846 ?auto_818851 ) ) ( not ( = ?auto_818847 ?auto_818848 ) ) ( not ( = ?auto_818847 ?auto_818849 ) ) ( not ( = ?auto_818847 ?auto_818850 ) ) ( not ( = ?auto_818847 ?auto_818851 ) ) ( not ( = ?auto_818848 ?auto_818849 ) ) ( not ( = ?auto_818848 ?auto_818850 ) ) ( not ( = ?auto_818848 ?auto_818851 ) ) ( not ( = ?auto_818849 ?auto_818850 ) ) ( not ( = ?auto_818849 ?auto_818851 ) ) ( not ( = ?auto_818850 ?auto_818851 ) ) ( ON ?auto_818834 ?auto_818852 ) ( not ( = ?auto_818851 ?auto_818852 ) ) ( not ( = ?auto_818850 ?auto_818852 ) ) ( not ( = ?auto_818849 ?auto_818852 ) ) ( not ( = ?auto_818848 ?auto_818852 ) ) ( not ( = ?auto_818847 ?auto_818852 ) ) ( not ( = ?auto_818846 ?auto_818852 ) ) ( not ( = ?auto_818845 ?auto_818852 ) ) ( not ( = ?auto_818844 ?auto_818852 ) ) ( not ( = ?auto_818843 ?auto_818852 ) ) ( not ( = ?auto_818842 ?auto_818852 ) ) ( not ( = ?auto_818841 ?auto_818852 ) ) ( not ( = ?auto_818840 ?auto_818852 ) ) ( not ( = ?auto_818839 ?auto_818852 ) ) ( not ( = ?auto_818838 ?auto_818852 ) ) ( not ( = ?auto_818837 ?auto_818852 ) ) ( not ( = ?auto_818836 ?auto_818852 ) ) ( not ( = ?auto_818835 ?auto_818852 ) ) ( not ( = ?auto_818834 ?auto_818852 ) ) ( ON ?auto_818835 ?auto_818834 ) ( ON ?auto_818836 ?auto_818835 ) ( ON ?auto_818837 ?auto_818836 ) ( ON ?auto_818838 ?auto_818837 ) ( ON ?auto_818839 ?auto_818838 ) ( ON ?auto_818840 ?auto_818839 ) ( ON ?auto_818841 ?auto_818840 ) ( ON ?auto_818842 ?auto_818841 ) ( ON ?auto_818843 ?auto_818842 ) ( ON ?auto_818844 ?auto_818843 ) ( ON ?auto_818845 ?auto_818844 ) ( ON ?auto_818846 ?auto_818845 ) ( ON ?auto_818847 ?auto_818846 ) ( ON ?auto_818848 ?auto_818847 ) ( ON ?auto_818849 ?auto_818848 ) ( ON ?auto_818850 ?auto_818849 ) ( ON ?auto_818851 ?auto_818850 ) ( CLEAR ?auto_818851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_818851 ?auto_818850 ?auto_818849 ?auto_818848 ?auto_818847 ?auto_818846 ?auto_818845 ?auto_818844 ?auto_818843 ?auto_818842 ?auto_818841 ?auto_818840 ?auto_818839 ?auto_818838 ?auto_818837 ?auto_818836 ?auto_818835 ?auto_818834 )
      ( MAKE-18PILE ?auto_818834 ?auto_818835 ?auto_818836 ?auto_818837 ?auto_818838 ?auto_818839 ?auto_818840 ?auto_818841 ?auto_818842 ?auto_818843 ?auto_818844 ?auto_818845 ?auto_818846 ?auto_818847 ?auto_818848 ?auto_818849 ?auto_818850 ?auto_818851 ) )
  )

)

