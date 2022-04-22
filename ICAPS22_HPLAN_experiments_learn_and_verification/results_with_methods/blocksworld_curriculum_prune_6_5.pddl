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
      ?auto_12106 - BLOCK
    )
    :vars
    (
      ?auto_12107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12106 ?auto_12107 ) ( CLEAR ?auto_12106 ) ( HAND-EMPTY ) ( not ( = ?auto_12106 ?auto_12107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12106 ?auto_12107 )
      ( !PUTDOWN ?auto_12106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12113 - BLOCK
      ?auto_12114 - BLOCK
    )
    :vars
    (
      ?auto_12115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12113 ) ( ON ?auto_12114 ?auto_12115 ) ( CLEAR ?auto_12114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12113 ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12114 ?auto_12115 )
      ( !STACK ?auto_12114 ?auto_12113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12123 - BLOCK
      ?auto_12124 - BLOCK
    )
    :vars
    (
      ?auto_12125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12124 ?auto_12125 ) ( not ( = ?auto_12123 ?auto_12124 ) ) ( not ( = ?auto_12123 ?auto_12125 ) ) ( not ( = ?auto_12124 ?auto_12125 ) ) ( ON ?auto_12123 ?auto_12124 ) ( CLEAR ?auto_12123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12123 )
      ( MAKE-2PILE ?auto_12123 ?auto_12124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12134 - BLOCK
      ?auto_12135 - BLOCK
      ?auto_12136 - BLOCK
    )
    :vars
    (
      ?auto_12137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12135 ) ( ON ?auto_12136 ?auto_12137 ) ( CLEAR ?auto_12136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12134 ) ( ON ?auto_12135 ?auto_12134 ) ( not ( = ?auto_12134 ?auto_12135 ) ) ( not ( = ?auto_12134 ?auto_12136 ) ) ( not ( = ?auto_12134 ?auto_12137 ) ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12136 ?auto_12137 )
      ( !STACK ?auto_12136 ?auto_12135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12148 - BLOCK
      ?auto_12149 - BLOCK
      ?auto_12150 - BLOCK
    )
    :vars
    (
      ?auto_12151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12150 ?auto_12151 ) ( ON-TABLE ?auto_12148 ) ( not ( = ?auto_12148 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12150 ) ) ( not ( = ?auto_12148 ?auto_12151 ) ) ( not ( = ?auto_12149 ?auto_12150 ) ) ( not ( = ?auto_12149 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( CLEAR ?auto_12148 ) ( ON ?auto_12149 ?auto_12150 ) ( CLEAR ?auto_12149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12148 ?auto_12149 )
      ( MAKE-3PILE ?auto_12148 ?auto_12149 ?auto_12150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12162 - BLOCK
      ?auto_12163 - BLOCK
      ?auto_12164 - BLOCK
    )
    :vars
    (
      ?auto_12165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12164 ?auto_12165 ) ( not ( = ?auto_12162 ?auto_12163 ) ) ( not ( = ?auto_12162 ?auto_12164 ) ) ( not ( = ?auto_12162 ?auto_12165 ) ) ( not ( = ?auto_12163 ?auto_12164 ) ) ( not ( = ?auto_12163 ?auto_12165 ) ) ( not ( = ?auto_12164 ?auto_12165 ) ) ( ON ?auto_12163 ?auto_12164 ) ( ON ?auto_12162 ?auto_12163 ) ( CLEAR ?auto_12162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12162 )
      ( MAKE-3PILE ?auto_12162 ?auto_12163 ?auto_12164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12177 - BLOCK
      ?auto_12178 - BLOCK
      ?auto_12179 - BLOCK
      ?auto_12180 - BLOCK
    )
    :vars
    (
      ?auto_12181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12179 ) ( ON ?auto_12180 ?auto_12181 ) ( CLEAR ?auto_12180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12177 ) ( ON ?auto_12178 ?auto_12177 ) ( ON ?auto_12179 ?auto_12178 ) ( not ( = ?auto_12177 ?auto_12178 ) ) ( not ( = ?auto_12177 ?auto_12179 ) ) ( not ( = ?auto_12177 ?auto_12180 ) ) ( not ( = ?auto_12177 ?auto_12181 ) ) ( not ( = ?auto_12178 ?auto_12179 ) ) ( not ( = ?auto_12178 ?auto_12180 ) ) ( not ( = ?auto_12178 ?auto_12181 ) ) ( not ( = ?auto_12179 ?auto_12180 ) ) ( not ( = ?auto_12179 ?auto_12181 ) ) ( not ( = ?auto_12180 ?auto_12181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12180 ?auto_12181 )
      ( !STACK ?auto_12180 ?auto_12179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12195 - BLOCK
      ?auto_12196 - BLOCK
      ?auto_12197 - BLOCK
      ?auto_12198 - BLOCK
    )
    :vars
    (
      ?auto_12199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12198 ?auto_12199 ) ( ON-TABLE ?auto_12195 ) ( ON ?auto_12196 ?auto_12195 ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12197 ) ) ( not ( = ?auto_12195 ?auto_12198 ) ) ( not ( = ?auto_12195 ?auto_12199 ) ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( not ( = ?auto_12196 ?auto_12198 ) ) ( not ( = ?auto_12196 ?auto_12199 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12199 ) ) ( not ( = ?auto_12198 ?auto_12199 ) ) ( CLEAR ?auto_12196 ) ( ON ?auto_12197 ?auto_12198 ) ( CLEAR ?auto_12197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12195 ?auto_12196 ?auto_12197 )
      ( MAKE-4PILE ?auto_12195 ?auto_12196 ?auto_12197 ?auto_12198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12213 - BLOCK
      ?auto_12214 - BLOCK
      ?auto_12215 - BLOCK
      ?auto_12216 - BLOCK
    )
    :vars
    (
      ?auto_12217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12216 ?auto_12217 ) ( ON-TABLE ?auto_12213 ) ( not ( = ?auto_12213 ?auto_12214 ) ) ( not ( = ?auto_12213 ?auto_12215 ) ) ( not ( = ?auto_12213 ?auto_12216 ) ) ( not ( = ?auto_12213 ?auto_12217 ) ) ( not ( = ?auto_12214 ?auto_12215 ) ) ( not ( = ?auto_12214 ?auto_12216 ) ) ( not ( = ?auto_12214 ?auto_12217 ) ) ( not ( = ?auto_12215 ?auto_12216 ) ) ( not ( = ?auto_12215 ?auto_12217 ) ) ( not ( = ?auto_12216 ?auto_12217 ) ) ( ON ?auto_12215 ?auto_12216 ) ( CLEAR ?auto_12213 ) ( ON ?auto_12214 ?auto_12215 ) ( CLEAR ?auto_12214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12213 ?auto_12214 )
      ( MAKE-4PILE ?auto_12213 ?auto_12214 ?auto_12215 ?auto_12216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12231 - BLOCK
      ?auto_12232 - BLOCK
      ?auto_12233 - BLOCK
      ?auto_12234 - BLOCK
    )
    :vars
    (
      ?auto_12235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12234 ?auto_12235 ) ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12231 ?auto_12233 ) ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12231 ?auto_12235 ) ) ( not ( = ?auto_12232 ?auto_12233 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12232 ?auto_12235 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12235 ) ) ( not ( = ?auto_12234 ?auto_12235 ) ) ( ON ?auto_12233 ?auto_12234 ) ( ON ?auto_12232 ?auto_12233 ) ( ON ?auto_12231 ?auto_12232 ) ( CLEAR ?auto_12231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12231 )
      ( MAKE-4PILE ?auto_12231 ?auto_12232 ?auto_12233 ?auto_12234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12250 - BLOCK
      ?auto_12251 - BLOCK
      ?auto_12252 - BLOCK
      ?auto_12253 - BLOCK
      ?auto_12254 - BLOCK
    )
    :vars
    (
      ?auto_12255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12253 ) ( ON ?auto_12254 ?auto_12255 ) ( CLEAR ?auto_12254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12250 ) ( ON ?auto_12251 ?auto_12250 ) ( ON ?auto_12252 ?auto_12251 ) ( ON ?auto_12253 ?auto_12252 ) ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12250 ?auto_12255 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12255 ) ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( not ( = ?auto_12252 ?auto_12255 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12254 ?auto_12255 )
      ( !STACK ?auto_12254 ?auto_12253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12272 - BLOCK
      ?auto_12273 - BLOCK
      ?auto_12274 - BLOCK
      ?auto_12275 - BLOCK
      ?auto_12276 - BLOCK
    )
    :vars
    (
      ?auto_12277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12276 ?auto_12277 ) ( ON-TABLE ?auto_12272 ) ( ON ?auto_12273 ?auto_12272 ) ( ON ?auto_12274 ?auto_12273 ) ( not ( = ?auto_12272 ?auto_12273 ) ) ( not ( = ?auto_12272 ?auto_12274 ) ) ( not ( = ?auto_12272 ?auto_12275 ) ) ( not ( = ?auto_12272 ?auto_12276 ) ) ( not ( = ?auto_12272 ?auto_12277 ) ) ( not ( = ?auto_12273 ?auto_12274 ) ) ( not ( = ?auto_12273 ?auto_12275 ) ) ( not ( = ?auto_12273 ?auto_12276 ) ) ( not ( = ?auto_12273 ?auto_12277 ) ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( not ( = ?auto_12274 ?auto_12277 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12277 ) ) ( not ( = ?auto_12276 ?auto_12277 ) ) ( CLEAR ?auto_12274 ) ( ON ?auto_12275 ?auto_12276 ) ( CLEAR ?auto_12275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12272 ?auto_12273 ?auto_12274 ?auto_12275 )
      ( MAKE-5PILE ?auto_12272 ?auto_12273 ?auto_12274 ?auto_12275 ?auto_12276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12294 - BLOCK
      ?auto_12295 - BLOCK
      ?auto_12296 - BLOCK
      ?auto_12297 - BLOCK
      ?auto_12298 - BLOCK
    )
    :vars
    (
      ?auto_12299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12298 ?auto_12299 ) ( ON-TABLE ?auto_12294 ) ( ON ?auto_12295 ?auto_12294 ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( not ( = ?auto_12294 ?auto_12296 ) ) ( not ( = ?auto_12294 ?auto_12297 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) ( not ( = ?auto_12294 ?auto_12299 ) ) ( not ( = ?auto_12295 ?auto_12296 ) ) ( not ( = ?auto_12295 ?auto_12297 ) ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12299 ) ) ( not ( = ?auto_12296 ?auto_12297 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12296 ?auto_12299 ) ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12298 ?auto_12299 ) ) ( ON ?auto_12297 ?auto_12298 ) ( CLEAR ?auto_12295 ) ( ON ?auto_12296 ?auto_12297 ) ( CLEAR ?auto_12296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12294 ?auto_12295 ?auto_12296 )
      ( MAKE-5PILE ?auto_12294 ?auto_12295 ?auto_12296 ?auto_12297 ?auto_12298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12316 - BLOCK
      ?auto_12317 - BLOCK
      ?auto_12318 - BLOCK
      ?auto_12319 - BLOCK
      ?auto_12320 - BLOCK
    )
    :vars
    (
      ?auto_12321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12320 ?auto_12321 ) ( ON-TABLE ?auto_12316 ) ( not ( = ?auto_12316 ?auto_12317 ) ) ( not ( = ?auto_12316 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12319 ) ) ( not ( = ?auto_12316 ?auto_12320 ) ) ( not ( = ?auto_12316 ?auto_12321 ) ) ( not ( = ?auto_12317 ?auto_12318 ) ) ( not ( = ?auto_12317 ?auto_12319 ) ) ( not ( = ?auto_12317 ?auto_12320 ) ) ( not ( = ?auto_12317 ?auto_12321 ) ) ( not ( = ?auto_12318 ?auto_12319 ) ) ( not ( = ?auto_12318 ?auto_12320 ) ) ( not ( = ?auto_12318 ?auto_12321 ) ) ( not ( = ?auto_12319 ?auto_12320 ) ) ( not ( = ?auto_12319 ?auto_12321 ) ) ( not ( = ?auto_12320 ?auto_12321 ) ) ( ON ?auto_12319 ?auto_12320 ) ( ON ?auto_12318 ?auto_12319 ) ( CLEAR ?auto_12316 ) ( ON ?auto_12317 ?auto_12318 ) ( CLEAR ?auto_12317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12316 ?auto_12317 )
      ( MAKE-5PILE ?auto_12316 ?auto_12317 ?auto_12318 ?auto_12319 ?auto_12320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12338 - BLOCK
      ?auto_12339 - BLOCK
      ?auto_12340 - BLOCK
      ?auto_12341 - BLOCK
      ?auto_12342 - BLOCK
    )
    :vars
    (
      ?auto_12343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12342 ?auto_12343 ) ( not ( = ?auto_12338 ?auto_12339 ) ) ( not ( = ?auto_12338 ?auto_12340 ) ) ( not ( = ?auto_12338 ?auto_12341 ) ) ( not ( = ?auto_12338 ?auto_12342 ) ) ( not ( = ?auto_12338 ?auto_12343 ) ) ( not ( = ?auto_12339 ?auto_12340 ) ) ( not ( = ?auto_12339 ?auto_12341 ) ) ( not ( = ?auto_12339 ?auto_12342 ) ) ( not ( = ?auto_12339 ?auto_12343 ) ) ( not ( = ?auto_12340 ?auto_12341 ) ) ( not ( = ?auto_12340 ?auto_12342 ) ) ( not ( = ?auto_12340 ?auto_12343 ) ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12341 ?auto_12343 ) ) ( not ( = ?auto_12342 ?auto_12343 ) ) ( ON ?auto_12341 ?auto_12342 ) ( ON ?auto_12340 ?auto_12341 ) ( ON ?auto_12339 ?auto_12340 ) ( ON ?auto_12338 ?auto_12339 ) ( CLEAR ?auto_12338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12338 )
      ( MAKE-5PILE ?auto_12338 ?auto_12339 ?auto_12340 ?auto_12341 ?auto_12342 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12361 - BLOCK
      ?auto_12362 - BLOCK
      ?auto_12363 - BLOCK
      ?auto_12364 - BLOCK
      ?auto_12365 - BLOCK
      ?auto_12366 - BLOCK
    )
    :vars
    (
      ?auto_12367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12365 ) ( ON ?auto_12366 ?auto_12367 ) ( CLEAR ?auto_12366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12361 ) ( ON ?auto_12362 ?auto_12361 ) ( ON ?auto_12363 ?auto_12362 ) ( ON ?auto_12364 ?auto_12363 ) ( ON ?auto_12365 ?auto_12364 ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12363 ) ) ( not ( = ?auto_12361 ?auto_12364 ) ) ( not ( = ?auto_12361 ?auto_12365 ) ) ( not ( = ?auto_12361 ?auto_12366 ) ) ( not ( = ?auto_12361 ?auto_12367 ) ) ( not ( = ?auto_12362 ?auto_12363 ) ) ( not ( = ?auto_12362 ?auto_12364 ) ) ( not ( = ?auto_12362 ?auto_12365 ) ) ( not ( = ?auto_12362 ?auto_12366 ) ) ( not ( = ?auto_12362 ?auto_12367 ) ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12363 ?auto_12367 ) ) ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( not ( = ?auto_12365 ?auto_12366 ) ) ( not ( = ?auto_12365 ?auto_12367 ) ) ( not ( = ?auto_12366 ?auto_12367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12366 ?auto_12367 )
      ( !STACK ?auto_12366 ?auto_12365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12374 - BLOCK
      ?auto_12375 - BLOCK
      ?auto_12376 - BLOCK
      ?auto_12377 - BLOCK
      ?auto_12378 - BLOCK
      ?auto_12379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12378 ) ( ON-TABLE ?auto_12379 ) ( CLEAR ?auto_12379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12374 ) ( ON ?auto_12375 ?auto_12374 ) ( ON ?auto_12376 ?auto_12375 ) ( ON ?auto_12377 ?auto_12376 ) ( ON ?auto_12378 ?auto_12377 ) ( not ( = ?auto_12374 ?auto_12375 ) ) ( not ( = ?auto_12374 ?auto_12376 ) ) ( not ( = ?auto_12374 ?auto_12377 ) ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12379 ) ) ( not ( = ?auto_12375 ?auto_12376 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12378 ) ) ( not ( = ?auto_12375 ?auto_12379 ) ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( not ( = ?auto_12376 ?auto_12379 ) ) ( not ( = ?auto_12377 ?auto_12378 ) ) ( not ( = ?auto_12377 ?auto_12379 ) ) ( not ( = ?auto_12378 ?auto_12379 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_12379 )
      ( !STACK ?auto_12379 ?auto_12378 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12386 - BLOCK
      ?auto_12387 - BLOCK
      ?auto_12388 - BLOCK
      ?auto_12389 - BLOCK
      ?auto_12390 - BLOCK
      ?auto_12391 - BLOCK
    )
    :vars
    (
      ?auto_12392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12391 ?auto_12392 ) ( ON-TABLE ?auto_12386 ) ( ON ?auto_12387 ?auto_12386 ) ( ON ?auto_12388 ?auto_12387 ) ( ON ?auto_12389 ?auto_12388 ) ( not ( = ?auto_12386 ?auto_12387 ) ) ( not ( = ?auto_12386 ?auto_12388 ) ) ( not ( = ?auto_12386 ?auto_12389 ) ) ( not ( = ?auto_12386 ?auto_12390 ) ) ( not ( = ?auto_12386 ?auto_12391 ) ) ( not ( = ?auto_12386 ?auto_12392 ) ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( not ( = ?auto_12387 ?auto_12389 ) ) ( not ( = ?auto_12387 ?auto_12390 ) ) ( not ( = ?auto_12387 ?auto_12391 ) ) ( not ( = ?auto_12387 ?auto_12392 ) ) ( not ( = ?auto_12388 ?auto_12389 ) ) ( not ( = ?auto_12388 ?auto_12390 ) ) ( not ( = ?auto_12388 ?auto_12391 ) ) ( not ( = ?auto_12388 ?auto_12392 ) ) ( not ( = ?auto_12389 ?auto_12390 ) ) ( not ( = ?auto_12389 ?auto_12391 ) ) ( not ( = ?auto_12389 ?auto_12392 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12392 ) ) ( not ( = ?auto_12391 ?auto_12392 ) ) ( CLEAR ?auto_12389 ) ( ON ?auto_12390 ?auto_12391 ) ( CLEAR ?auto_12390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_12386 ?auto_12387 ?auto_12388 ?auto_12389 ?auto_12390 )
      ( MAKE-6PILE ?auto_12386 ?auto_12387 ?auto_12388 ?auto_12389 ?auto_12390 ?auto_12391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12399 - BLOCK
      ?auto_12400 - BLOCK
      ?auto_12401 - BLOCK
      ?auto_12402 - BLOCK
      ?auto_12403 - BLOCK
      ?auto_12404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12404 ) ( ON-TABLE ?auto_12399 ) ( ON ?auto_12400 ?auto_12399 ) ( ON ?auto_12401 ?auto_12400 ) ( ON ?auto_12402 ?auto_12401 ) ( not ( = ?auto_12399 ?auto_12400 ) ) ( not ( = ?auto_12399 ?auto_12401 ) ) ( not ( = ?auto_12399 ?auto_12402 ) ) ( not ( = ?auto_12399 ?auto_12403 ) ) ( not ( = ?auto_12399 ?auto_12404 ) ) ( not ( = ?auto_12400 ?auto_12401 ) ) ( not ( = ?auto_12400 ?auto_12402 ) ) ( not ( = ?auto_12400 ?auto_12403 ) ) ( not ( = ?auto_12400 ?auto_12404 ) ) ( not ( = ?auto_12401 ?auto_12402 ) ) ( not ( = ?auto_12401 ?auto_12403 ) ) ( not ( = ?auto_12401 ?auto_12404 ) ) ( not ( = ?auto_12402 ?auto_12403 ) ) ( not ( = ?auto_12402 ?auto_12404 ) ) ( not ( = ?auto_12403 ?auto_12404 ) ) ( CLEAR ?auto_12402 ) ( ON ?auto_12403 ?auto_12404 ) ( CLEAR ?auto_12403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_12399 ?auto_12400 ?auto_12401 ?auto_12402 ?auto_12403 )
      ( MAKE-6PILE ?auto_12399 ?auto_12400 ?auto_12401 ?auto_12402 ?auto_12403 ?auto_12404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12411 - BLOCK
      ?auto_12412 - BLOCK
      ?auto_12413 - BLOCK
      ?auto_12414 - BLOCK
      ?auto_12415 - BLOCK
      ?auto_12416 - BLOCK
    )
    :vars
    (
      ?auto_12417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12416 ?auto_12417 ) ( ON-TABLE ?auto_12411 ) ( ON ?auto_12412 ?auto_12411 ) ( ON ?auto_12413 ?auto_12412 ) ( not ( = ?auto_12411 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12413 ) ) ( not ( = ?auto_12411 ?auto_12414 ) ) ( not ( = ?auto_12411 ?auto_12415 ) ) ( not ( = ?auto_12411 ?auto_12416 ) ) ( not ( = ?auto_12411 ?auto_12417 ) ) ( not ( = ?auto_12412 ?auto_12413 ) ) ( not ( = ?auto_12412 ?auto_12414 ) ) ( not ( = ?auto_12412 ?auto_12415 ) ) ( not ( = ?auto_12412 ?auto_12416 ) ) ( not ( = ?auto_12412 ?auto_12417 ) ) ( not ( = ?auto_12413 ?auto_12414 ) ) ( not ( = ?auto_12413 ?auto_12415 ) ) ( not ( = ?auto_12413 ?auto_12416 ) ) ( not ( = ?auto_12413 ?auto_12417 ) ) ( not ( = ?auto_12414 ?auto_12415 ) ) ( not ( = ?auto_12414 ?auto_12416 ) ) ( not ( = ?auto_12414 ?auto_12417 ) ) ( not ( = ?auto_12415 ?auto_12416 ) ) ( not ( = ?auto_12415 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12417 ) ) ( ON ?auto_12415 ?auto_12416 ) ( CLEAR ?auto_12413 ) ( ON ?auto_12414 ?auto_12415 ) ( CLEAR ?auto_12414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12411 ?auto_12412 ?auto_12413 ?auto_12414 )
      ( MAKE-6PILE ?auto_12411 ?auto_12412 ?auto_12413 ?auto_12414 ?auto_12415 ?auto_12416 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12424 - BLOCK
      ?auto_12425 - BLOCK
      ?auto_12426 - BLOCK
      ?auto_12427 - BLOCK
      ?auto_12428 - BLOCK
      ?auto_12429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12429 ) ( ON-TABLE ?auto_12424 ) ( ON ?auto_12425 ?auto_12424 ) ( ON ?auto_12426 ?auto_12425 ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( not ( = ?auto_12424 ?auto_12426 ) ) ( not ( = ?auto_12424 ?auto_12427 ) ) ( not ( = ?auto_12424 ?auto_12428 ) ) ( not ( = ?auto_12424 ?auto_12429 ) ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( not ( = ?auto_12425 ?auto_12428 ) ) ( not ( = ?auto_12425 ?auto_12429 ) ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12428 ) ) ( not ( = ?auto_12426 ?auto_12429 ) ) ( not ( = ?auto_12427 ?auto_12428 ) ) ( not ( = ?auto_12427 ?auto_12429 ) ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( ON ?auto_12428 ?auto_12429 ) ( CLEAR ?auto_12426 ) ( ON ?auto_12427 ?auto_12428 ) ( CLEAR ?auto_12427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12424 ?auto_12425 ?auto_12426 ?auto_12427 )
      ( MAKE-6PILE ?auto_12424 ?auto_12425 ?auto_12426 ?auto_12427 ?auto_12428 ?auto_12429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12436 - BLOCK
      ?auto_12437 - BLOCK
      ?auto_12438 - BLOCK
      ?auto_12439 - BLOCK
      ?auto_12440 - BLOCK
      ?auto_12441 - BLOCK
    )
    :vars
    (
      ?auto_12442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12441 ?auto_12442 ) ( ON-TABLE ?auto_12436 ) ( ON ?auto_12437 ?auto_12436 ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12438 ) ) ( not ( = ?auto_12436 ?auto_12439 ) ) ( not ( = ?auto_12436 ?auto_12440 ) ) ( not ( = ?auto_12436 ?auto_12441 ) ) ( not ( = ?auto_12436 ?auto_12442 ) ) ( not ( = ?auto_12437 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12439 ) ) ( not ( = ?auto_12437 ?auto_12440 ) ) ( not ( = ?auto_12437 ?auto_12441 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( not ( = ?auto_12438 ?auto_12439 ) ) ( not ( = ?auto_12438 ?auto_12440 ) ) ( not ( = ?auto_12438 ?auto_12441 ) ) ( not ( = ?auto_12438 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12441 ) ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( not ( = ?auto_12440 ?auto_12441 ) ) ( not ( = ?auto_12440 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( ON ?auto_12440 ?auto_12441 ) ( ON ?auto_12439 ?auto_12440 ) ( CLEAR ?auto_12437 ) ( ON ?auto_12438 ?auto_12439 ) ( CLEAR ?auto_12438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12436 ?auto_12437 ?auto_12438 )
      ( MAKE-6PILE ?auto_12436 ?auto_12437 ?auto_12438 ?auto_12439 ?auto_12440 ?auto_12441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12449 - BLOCK
      ?auto_12450 - BLOCK
      ?auto_12451 - BLOCK
      ?auto_12452 - BLOCK
      ?auto_12453 - BLOCK
      ?auto_12454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12454 ) ( ON-TABLE ?auto_12449 ) ( ON ?auto_12450 ?auto_12449 ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12449 ?auto_12452 ) ) ( not ( = ?auto_12449 ?auto_12453 ) ) ( not ( = ?auto_12449 ?auto_12454 ) ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12450 ?auto_12452 ) ) ( not ( = ?auto_12450 ?auto_12453 ) ) ( not ( = ?auto_12450 ?auto_12454 ) ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12451 ?auto_12453 ) ) ( not ( = ?auto_12451 ?auto_12454 ) ) ( not ( = ?auto_12452 ?auto_12453 ) ) ( not ( = ?auto_12452 ?auto_12454 ) ) ( not ( = ?auto_12453 ?auto_12454 ) ) ( ON ?auto_12453 ?auto_12454 ) ( ON ?auto_12452 ?auto_12453 ) ( CLEAR ?auto_12450 ) ( ON ?auto_12451 ?auto_12452 ) ( CLEAR ?auto_12451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12449 ?auto_12450 ?auto_12451 )
      ( MAKE-6PILE ?auto_12449 ?auto_12450 ?auto_12451 ?auto_12452 ?auto_12453 ?auto_12454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12461 - BLOCK
      ?auto_12462 - BLOCK
      ?auto_12463 - BLOCK
      ?auto_12464 - BLOCK
      ?auto_12465 - BLOCK
      ?auto_12466 - BLOCK
    )
    :vars
    (
      ?auto_12467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12466 ?auto_12467 ) ( ON-TABLE ?auto_12461 ) ( not ( = ?auto_12461 ?auto_12462 ) ) ( not ( = ?auto_12461 ?auto_12463 ) ) ( not ( = ?auto_12461 ?auto_12464 ) ) ( not ( = ?auto_12461 ?auto_12465 ) ) ( not ( = ?auto_12461 ?auto_12466 ) ) ( not ( = ?auto_12461 ?auto_12467 ) ) ( not ( = ?auto_12462 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12464 ) ) ( not ( = ?auto_12462 ?auto_12465 ) ) ( not ( = ?auto_12462 ?auto_12466 ) ) ( not ( = ?auto_12462 ?auto_12467 ) ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12465 ) ) ( not ( = ?auto_12463 ?auto_12466 ) ) ( not ( = ?auto_12463 ?auto_12467 ) ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( ON ?auto_12465 ?auto_12466 ) ( ON ?auto_12464 ?auto_12465 ) ( ON ?auto_12463 ?auto_12464 ) ( CLEAR ?auto_12461 ) ( ON ?auto_12462 ?auto_12463 ) ( CLEAR ?auto_12462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12461 ?auto_12462 )
      ( MAKE-6PILE ?auto_12461 ?auto_12462 ?auto_12463 ?auto_12464 ?auto_12465 ?auto_12466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12474 - BLOCK
      ?auto_12475 - BLOCK
      ?auto_12476 - BLOCK
      ?auto_12477 - BLOCK
      ?auto_12478 - BLOCK
      ?auto_12479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12479 ) ( ON-TABLE ?auto_12474 ) ( not ( = ?auto_12474 ?auto_12475 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( not ( = ?auto_12474 ?auto_12477 ) ) ( not ( = ?auto_12474 ?auto_12478 ) ) ( not ( = ?auto_12474 ?auto_12479 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12477 ) ) ( not ( = ?auto_12475 ?auto_12478 ) ) ( not ( = ?auto_12475 ?auto_12479 ) ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( not ( = ?auto_12476 ?auto_12479 ) ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12479 ) ) ( not ( = ?auto_12478 ?auto_12479 ) ) ( ON ?auto_12478 ?auto_12479 ) ( ON ?auto_12477 ?auto_12478 ) ( ON ?auto_12476 ?auto_12477 ) ( CLEAR ?auto_12474 ) ( ON ?auto_12475 ?auto_12476 ) ( CLEAR ?auto_12475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12474 ?auto_12475 )
      ( MAKE-6PILE ?auto_12474 ?auto_12475 ?auto_12476 ?auto_12477 ?auto_12478 ?auto_12479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12486 - BLOCK
      ?auto_12487 - BLOCK
      ?auto_12488 - BLOCK
      ?auto_12489 - BLOCK
      ?auto_12490 - BLOCK
      ?auto_12491 - BLOCK
    )
    :vars
    (
      ?auto_12492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12491 ?auto_12492 ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12489 ) ) ( not ( = ?auto_12486 ?auto_12490 ) ) ( not ( = ?auto_12486 ?auto_12491 ) ) ( not ( = ?auto_12486 ?auto_12492 ) ) ( not ( = ?auto_12487 ?auto_12488 ) ) ( not ( = ?auto_12487 ?auto_12489 ) ) ( not ( = ?auto_12487 ?auto_12490 ) ) ( not ( = ?auto_12487 ?auto_12491 ) ) ( not ( = ?auto_12487 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12491 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( ON ?auto_12490 ?auto_12491 ) ( ON ?auto_12489 ?auto_12490 ) ( ON ?auto_12488 ?auto_12489 ) ( ON ?auto_12487 ?auto_12488 ) ( ON ?auto_12486 ?auto_12487 ) ( CLEAR ?auto_12486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12486 )
      ( MAKE-6PILE ?auto_12486 ?auto_12487 ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12499 - BLOCK
      ?auto_12500 - BLOCK
      ?auto_12501 - BLOCK
      ?auto_12502 - BLOCK
      ?auto_12503 - BLOCK
      ?auto_12504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12504 ) ( not ( = ?auto_12499 ?auto_12500 ) ) ( not ( = ?auto_12499 ?auto_12501 ) ) ( not ( = ?auto_12499 ?auto_12502 ) ) ( not ( = ?auto_12499 ?auto_12503 ) ) ( not ( = ?auto_12499 ?auto_12504 ) ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12500 ?auto_12502 ) ) ( not ( = ?auto_12500 ?auto_12503 ) ) ( not ( = ?auto_12500 ?auto_12504 ) ) ( not ( = ?auto_12501 ?auto_12502 ) ) ( not ( = ?auto_12501 ?auto_12503 ) ) ( not ( = ?auto_12501 ?auto_12504 ) ) ( not ( = ?auto_12502 ?auto_12503 ) ) ( not ( = ?auto_12502 ?auto_12504 ) ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( ON ?auto_12503 ?auto_12504 ) ( ON ?auto_12502 ?auto_12503 ) ( ON ?auto_12501 ?auto_12502 ) ( ON ?auto_12500 ?auto_12501 ) ( ON ?auto_12499 ?auto_12500 ) ( CLEAR ?auto_12499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12499 )
      ( MAKE-6PILE ?auto_12499 ?auto_12500 ?auto_12501 ?auto_12502 ?auto_12503 ?auto_12504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12511 - BLOCK
      ?auto_12512 - BLOCK
      ?auto_12513 - BLOCK
      ?auto_12514 - BLOCK
      ?auto_12515 - BLOCK
      ?auto_12516 - BLOCK
    )
    :vars
    (
      ?auto_12517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12513 ) ) ( not ( = ?auto_12511 ?auto_12514 ) ) ( not ( = ?auto_12511 ?auto_12515 ) ) ( not ( = ?auto_12511 ?auto_12516 ) ) ( not ( = ?auto_12512 ?auto_12513 ) ) ( not ( = ?auto_12512 ?auto_12514 ) ) ( not ( = ?auto_12512 ?auto_12515 ) ) ( not ( = ?auto_12512 ?auto_12516 ) ) ( not ( = ?auto_12513 ?auto_12514 ) ) ( not ( = ?auto_12513 ?auto_12515 ) ) ( not ( = ?auto_12513 ?auto_12516 ) ) ( not ( = ?auto_12514 ?auto_12515 ) ) ( not ( = ?auto_12514 ?auto_12516 ) ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( ON ?auto_12511 ?auto_12517 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( not ( = ?auto_12515 ?auto_12517 ) ) ( not ( = ?auto_12514 ?auto_12517 ) ) ( not ( = ?auto_12513 ?auto_12517 ) ) ( not ( = ?auto_12512 ?auto_12517 ) ) ( not ( = ?auto_12511 ?auto_12517 ) ) ( ON ?auto_12512 ?auto_12511 ) ( ON ?auto_12513 ?auto_12512 ) ( ON ?auto_12514 ?auto_12513 ) ( ON ?auto_12515 ?auto_12514 ) ( ON ?auto_12516 ?auto_12515 ) ( CLEAR ?auto_12516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_12516 ?auto_12515 ?auto_12514 ?auto_12513 ?auto_12512 ?auto_12511 )
      ( MAKE-6PILE ?auto_12511 ?auto_12512 ?auto_12513 ?auto_12514 ?auto_12515 ?auto_12516 ) )
  )

)

