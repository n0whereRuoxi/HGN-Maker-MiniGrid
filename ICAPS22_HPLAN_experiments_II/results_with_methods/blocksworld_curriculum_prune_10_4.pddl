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
      ?auto_80165 - BLOCK
    )
    :vars
    (
      ?auto_80166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80165 ?auto_80166 ) ( CLEAR ?auto_80165 ) ( HAND-EMPTY ) ( not ( = ?auto_80165 ?auto_80166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80165 ?auto_80166 )
      ( !PUTDOWN ?auto_80165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80172 - BLOCK
      ?auto_80173 - BLOCK
    )
    :vars
    (
      ?auto_80174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80172 ) ( ON ?auto_80173 ?auto_80174 ) ( CLEAR ?auto_80173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80172 ) ( not ( = ?auto_80172 ?auto_80173 ) ) ( not ( = ?auto_80172 ?auto_80174 ) ) ( not ( = ?auto_80173 ?auto_80174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80173 ?auto_80174 )
      ( !STACK ?auto_80173 ?auto_80172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80182 - BLOCK
      ?auto_80183 - BLOCK
    )
    :vars
    (
      ?auto_80184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80183 ?auto_80184 ) ( not ( = ?auto_80182 ?auto_80183 ) ) ( not ( = ?auto_80182 ?auto_80184 ) ) ( not ( = ?auto_80183 ?auto_80184 ) ) ( ON ?auto_80182 ?auto_80183 ) ( CLEAR ?auto_80182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80182 )
      ( MAKE-2PILE ?auto_80182 ?auto_80183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80193 - BLOCK
      ?auto_80194 - BLOCK
      ?auto_80195 - BLOCK
    )
    :vars
    (
      ?auto_80196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80194 ) ( ON ?auto_80195 ?auto_80196 ) ( CLEAR ?auto_80195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80193 ) ( ON ?auto_80194 ?auto_80193 ) ( not ( = ?auto_80193 ?auto_80194 ) ) ( not ( = ?auto_80193 ?auto_80195 ) ) ( not ( = ?auto_80193 ?auto_80196 ) ) ( not ( = ?auto_80194 ?auto_80195 ) ) ( not ( = ?auto_80194 ?auto_80196 ) ) ( not ( = ?auto_80195 ?auto_80196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80195 ?auto_80196 )
      ( !STACK ?auto_80195 ?auto_80194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80207 - BLOCK
      ?auto_80208 - BLOCK
      ?auto_80209 - BLOCK
    )
    :vars
    (
      ?auto_80210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80209 ?auto_80210 ) ( ON-TABLE ?auto_80207 ) ( not ( = ?auto_80207 ?auto_80208 ) ) ( not ( = ?auto_80207 ?auto_80209 ) ) ( not ( = ?auto_80207 ?auto_80210 ) ) ( not ( = ?auto_80208 ?auto_80209 ) ) ( not ( = ?auto_80208 ?auto_80210 ) ) ( not ( = ?auto_80209 ?auto_80210 ) ) ( CLEAR ?auto_80207 ) ( ON ?auto_80208 ?auto_80209 ) ( CLEAR ?auto_80208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80207 ?auto_80208 )
      ( MAKE-3PILE ?auto_80207 ?auto_80208 ?auto_80209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80221 - BLOCK
      ?auto_80222 - BLOCK
      ?auto_80223 - BLOCK
    )
    :vars
    (
      ?auto_80224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80223 ?auto_80224 ) ( not ( = ?auto_80221 ?auto_80222 ) ) ( not ( = ?auto_80221 ?auto_80223 ) ) ( not ( = ?auto_80221 ?auto_80224 ) ) ( not ( = ?auto_80222 ?auto_80223 ) ) ( not ( = ?auto_80222 ?auto_80224 ) ) ( not ( = ?auto_80223 ?auto_80224 ) ) ( ON ?auto_80222 ?auto_80223 ) ( ON ?auto_80221 ?auto_80222 ) ( CLEAR ?auto_80221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80221 )
      ( MAKE-3PILE ?auto_80221 ?auto_80222 ?auto_80223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80236 - BLOCK
      ?auto_80237 - BLOCK
      ?auto_80238 - BLOCK
      ?auto_80239 - BLOCK
    )
    :vars
    (
      ?auto_80240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80238 ) ( ON ?auto_80239 ?auto_80240 ) ( CLEAR ?auto_80239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80236 ) ( ON ?auto_80237 ?auto_80236 ) ( ON ?auto_80238 ?auto_80237 ) ( not ( = ?auto_80236 ?auto_80237 ) ) ( not ( = ?auto_80236 ?auto_80238 ) ) ( not ( = ?auto_80236 ?auto_80239 ) ) ( not ( = ?auto_80236 ?auto_80240 ) ) ( not ( = ?auto_80237 ?auto_80238 ) ) ( not ( = ?auto_80237 ?auto_80239 ) ) ( not ( = ?auto_80237 ?auto_80240 ) ) ( not ( = ?auto_80238 ?auto_80239 ) ) ( not ( = ?auto_80238 ?auto_80240 ) ) ( not ( = ?auto_80239 ?auto_80240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80239 ?auto_80240 )
      ( !STACK ?auto_80239 ?auto_80238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80254 - BLOCK
      ?auto_80255 - BLOCK
      ?auto_80256 - BLOCK
      ?auto_80257 - BLOCK
    )
    :vars
    (
      ?auto_80258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80257 ?auto_80258 ) ( ON-TABLE ?auto_80254 ) ( ON ?auto_80255 ?auto_80254 ) ( not ( = ?auto_80254 ?auto_80255 ) ) ( not ( = ?auto_80254 ?auto_80256 ) ) ( not ( = ?auto_80254 ?auto_80257 ) ) ( not ( = ?auto_80254 ?auto_80258 ) ) ( not ( = ?auto_80255 ?auto_80256 ) ) ( not ( = ?auto_80255 ?auto_80257 ) ) ( not ( = ?auto_80255 ?auto_80258 ) ) ( not ( = ?auto_80256 ?auto_80257 ) ) ( not ( = ?auto_80256 ?auto_80258 ) ) ( not ( = ?auto_80257 ?auto_80258 ) ) ( CLEAR ?auto_80255 ) ( ON ?auto_80256 ?auto_80257 ) ( CLEAR ?auto_80256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80254 ?auto_80255 ?auto_80256 )
      ( MAKE-4PILE ?auto_80254 ?auto_80255 ?auto_80256 ?auto_80257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80272 - BLOCK
      ?auto_80273 - BLOCK
      ?auto_80274 - BLOCK
      ?auto_80275 - BLOCK
    )
    :vars
    (
      ?auto_80276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80275 ?auto_80276 ) ( ON-TABLE ?auto_80272 ) ( not ( = ?auto_80272 ?auto_80273 ) ) ( not ( = ?auto_80272 ?auto_80274 ) ) ( not ( = ?auto_80272 ?auto_80275 ) ) ( not ( = ?auto_80272 ?auto_80276 ) ) ( not ( = ?auto_80273 ?auto_80274 ) ) ( not ( = ?auto_80273 ?auto_80275 ) ) ( not ( = ?auto_80273 ?auto_80276 ) ) ( not ( = ?auto_80274 ?auto_80275 ) ) ( not ( = ?auto_80274 ?auto_80276 ) ) ( not ( = ?auto_80275 ?auto_80276 ) ) ( ON ?auto_80274 ?auto_80275 ) ( CLEAR ?auto_80272 ) ( ON ?auto_80273 ?auto_80274 ) ( CLEAR ?auto_80273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80272 ?auto_80273 )
      ( MAKE-4PILE ?auto_80272 ?auto_80273 ?auto_80274 ?auto_80275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80290 - BLOCK
      ?auto_80291 - BLOCK
      ?auto_80292 - BLOCK
      ?auto_80293 - BLOCK
    )
    :vars
    (
      ?auto_80294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80293 ?auto_80294 ) ( not ( = ?auto_80290 ?auto_80291 ) ) ( not ( = ?auto_80290 ?auto_80292 ) ) ( not ( = ?auto_80290 ?auto_80293 ) ) ( not ( = ?auto_80290 ?auto_80294 ) ) ( not ( = ?auto_80291 ?auto_80292 ) ) ( not ( = ?auto_80291 ?auto_80293 ) ) ( not ( = ?auto_80291 ?auto_80294 ) ) ( not ( = ?auto_80292 ?auto_80293 ) ) ( not ( = ?auto_80292 ?auto_80294 ) ) ( not ( = ?auto_80293 ?auto_80294 ) ) ( ON ?auto_80292 ?auto_80293 ) ( ON ?auto_80291 ?auto_80292 ) ( ON ?auto_80290 ?auto_80291 ) ( CLEAR ?auto_80290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80290 )
      ( MAKE-4PILE ?auto_80290 ?auto_80291 ?auto_80292 ?auto_80293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80309 - BLOCK
      ?auto_80310 - BLOCK
      ?auto_80311 - BLOCK
      ?auto_80312 - BLOCK
      ?auto_80313 - BLOCK
    )
    :vars
    (
      ?auto_80314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80312 ) ( ON ?auto_80313 ?auto_80314 ) ( CLEAR ?auto_80313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80309 ) ( ON ?auto_80310 ?auto_80309 ) ( ON ?auto_80311 ?auto_80310 ) ( ON ?auto_80312 ?auto_80311 ) ( not ( = ?auto_80309 ?auto_80310 ) ) ( not ( = ?auto_80309 ?auto_80311 ) ) ( not ( = ?auto_80309 ?auto_80312 ) ) ( not ( = ?auto_80309 ?auto_80313 ) ) ( not ( = ?auto_80309 ?auto_80314 ) ) ( not ( = ?auto_80310 ?auto_80311 ) ) ( not ( = ?auto_80310 ?auto_80312 ) ) ( not ( = ?auto_80310 ?auto_80313 ) ) ( not ( = ?auto_80310 ?auto_80314 ) ) ( not ( = ?auto_80311 ?auto_80312 ) ) ( not ( = ?auto_80311 ?auto_80313 ) ) ( not ( = ?auto_80311 ?auto_80314 ) ) ( not ( = ?auto_80312 ?auto_80313 ) ) ( not ( = ?auto_80312 ?auto_80314 ) ) ( not ( = ?auto_80313 ?auto_80314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80313 ?auto_80314 )
      ( !STACK ?auto_80313 ?auto_80312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80331 - BLOCK
      ?auto_80332 - BLOCK
      ?auto_80333 - BLOCK
      ?auto_80334 - BLOCK
      ?auto_80335 - BLOCK
    )
    :vars
    (
      ?auto_80336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80335 ?auto_80336 ) ( ON-TABLE ?auto_80331 ) ( ON ?auto_80332 ?auto_80331 ) ( ON ?auto_80333 ?auto_80332 ) ( not ( = ?auto_80331 ?auto_80332 ) ) ( not ( = ?auto_80331 ?auto_80333 ) ) ( not ( = ?auto_80331 ?auto_80334 ) ) ( not ( = ?auto_80331 ?auto_80335 ) ) ( not ( = ?auto_80331 ?auto_80336 ) ) ( not ( = ?auto_80332 ?auto_80333 ) ) ( not ( = ?auto_80332 ?auto_80334 ) ) ( not ( = ?auto_80332 ?auto_80335 ) ) ( not ( = ?auto_80332 ?auto_80336 ) ) ( not ( = ?auto_80333 ?auto_80334 ) ) ( not ( = ?auto_80333 ?auto_80335 ) ) ( not ( = ?auto_80333 ?auto_80336 ) ) ( not ( = ?auto_80334 ?auto_80335 ) ) ( not ( = ?auto_80334 ?auto_80336 ) ) ( not ( = ?auto_80335 ?auto_80336 ) ) ( CLEAR ?auto_80333 ) ( ON ?auto_80334 ?auto_80335 ) ( CLEAR ?auto_80334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80331 ?auto_80332 ?auto_80333 ?auto_80334 )
      ( MAKE-5PILE ?auto_80331 ?auto_80332 ?auto_80333 ?auto_80334 ?auto_80335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80353 - BLOCK
      ?auto_80354 - BLOCK
      ?auto_80355 - BLOCK
      ?auto_80356 - BLOCK
      ?auto_80357 - BLOCK
    )
    :vars
    (
      ?auto_80358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80357 ?auto_80358 ) ( ON-TABLE ?auto_80353 ) ( ON ?auto_80354 ?auto_80353 ) ( not ( = ?auto_80353 ?auto_80354 ) ) ( not ( = ?auto_80353 ?auto_80355 ) ) ( not ( = ?auto_80353 ?auto_80356 ) ) ( not ( = ?auto_80353 ?auto_80357 ) ) ( not ( = ?auto_80353 ?auto_80358 ) ) ( not ( = ?auto_80354 ?auto_80355 ) ) ( not ( = ?auto_80354 ?auto_80356 ) ) ( not ( = ?auto_80354 ?auto_80357 ) ) ( not ( = ?auto_80354 ?auto_80358 ) ) ( not ( = ?auto_80355 ?auto_80356 ) ) ( not ( = ?auto_80355 ?auto_80357 ) ) ( not ( = ?auto_80355 ?auto_80358 ) ) ( not ( = ?auto_80356 ?auto_80357 ) ) ( not ( = ?auto_80356 ?auto_80358 ) ) ( not ( = ?auto_80357 ?auto_80358 ) ) ( ON ?auto_80356 ?auto_80357 ) ( CLEAR ?auto_80354 ) ( ON ?auto_80355 ?auto_80356 ) ( CLEAR ?auto_80355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80353 ?auto_80354 ?auto_80355 )
      ( MAKE-5PILE ?auto_80353 ?auto_80354 ?auto_80355 ?auto_80356 ?auto_80357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80375 - BLOCK
      ?auto_80376 - BLOCK
      ?auto_80377 - BLOCK
      ?auto_80378 - BLOCK
      ?auto_80379 - BLOCK
    )
    :vars
    (
      ?auto_80380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80379 ?auto_80380 ) ( ON-TABLE ?auto_80375 ) ( not ( = ?auto_80375 ?auto_80376 ) ) ( not ( = ?auto_80375 ?auto_80377 ) ) ( not ( = ?auto_80375 ?auto_80378 ) ) ( not ( = ?auto_80375 ?auto_80379 ) ) ( not ( = ?auto_80375 ?auto_80380 ) ) ( not ( = ?auto_80376 ?auto_80377 ) ) ( not ( = ?auto_80376 ?auto_80378 ) ) ( not ( = ?auto_80376 ?auto_80379 ) ) ( not ( = ?auto_80376 ?auto_80380 ) ) ( not ( = ?auto_80377 ?auto_80378 ) ) ( not ( = ?auto_80377 ?auto_80379 ) ) ( not ( = ?auto_80377 ?auto_80380 ) ) ( not ( = ?auto_80378 ?auto_80379 ) ) ( not ( = ?auto_80378 ?auto_80380 ) ) ( not ( = ?auto_80379 ?auto_80380 ) ) ( ON ?auto_80378 ?auto_80379 ) ( ON ?auto_80377 ?auto_80378 ) ( CLEAR ?auto_80375 ) ( ON ?auto_80376 ?auto_80377 ) ( CLEAR ?auto_80376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80375 ?auto_80376 )
      ( MAKE-5PILE ?auto_80375 ?auto_80376 ?auto_80377 ?auto_80378 ?auto_80379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80397 - BLOCK
      ?auto_80398 - BLOCK
      ?auto_80399 - BLOCK
      ?auto_80400 - BLOCK
      ?auto_80401 - BLOCK
    )
    :vars
    (
      ?auto_80402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80401 ?auto_80402 ) ( not ( = ?auto_80397 ?auto_80398 ) ) ( not ( = ?auto_80397 ?auto_80399 ) ) ( not ( = ?auto_80397 ?auto_80400 ) ) ( not ( = ?auto_80397 ?auto_80401 ) ) ( not ( = ?auto_80397 ?auto_80402 ) ) ( not ( = ?auto_80398 ?auto_80399 ) ) ( not ( = ?auto_80398 ?auto_80400 ) ) ( not ( = ?auto_80398 ?auto_80401 ) ) ( not ( = ?auto_80398 ?auto_80402 ) ) ( not ( = ?auto_80399 ?auto_80400 ) ) ( not ( = ?auto_80399 ?auto_80401 ) ) ( not ( = ?auto_80399 ?auto_80402 ) ) ( not ( = ?auto_80400 ?auto_80401 ) ) ( not ( = ?auto_80400 ?auto_80402 ) ) ( not ( = ?auto_80401 ?auto_80402 ) ) ( ON ?auto_80400 ?auto_80401 ) ( ON ?auto_80399 ?auto_80400 ) ( ON ?auto_80398 ?auto_80399 ) ( ON ?auto_80397 ?auto_80398 ) ( CLEAR ?auto_80397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80397 )
      ( MAKE-5PILE ?auto_80397 ?auto_80398 ?auto_80399 ?auto_80400 ?auto_80401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80420 - BLOCK
      ?auto_80421 - BLOCK
      ?auto_80422 - BLOCK
      ?auto_80423 - BLOCK
      ?auto_80424 - BLOCK
      ?auto_80425 - BLOCK
    )
    :vars
    (
      ?auto_80426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80424 ) ( ON ?auto_80425 ?auto_80426 ) ( CLEAR ?auto_80425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80420 ) ( ON ?auto_80421 ?auto_80420 ) ( ON ?auto_80422 ?auto_80421 ) ( ON ?auto_80423 ?auto_80422 ) ( ON ?auto_80424 ?auto_80423 ) ( not ( = ?auto_80420 ?auto_80421 ) ) ( not ( = ?auto_80420 ?auto_80422 ) ) ( not ( = ?auto_80420 ?auto_80423 ) ) ( not ( = ?auto_80420 ?auto_80424 ) ) ( not ( = ?auto_80420 ?auto_80425 ) ) ( not ( = ?auto_80420 ?auto_80426 ) ) ( not ( = ?auto_80421 ?auto_80422 ) ) ( not ( = ?auto_80421 ?auto_80423 ) ) ( not ( = ?auto_80421 ?auto_80424 ) ) ( not ( = ?auto_80421 ?auto_80425 ) ) ( not ( = ?auto_80421 ?auto_80426 ) ) ( not ( = ?auto_80422 ?auto_80423 ) ) ( not ( = ?auto_80422 ?auto_80424 ) ) ( not ( = ?auto_80422 ?auto_80425 ) ) ( not ( = ?auto_80422 ?auto_80426 ) ) ( not ( = ?auto_80423 ?auto_80424 ) ) ( not ( = ?auto_80423 ?auto_80425 ) ) ( not ( = ?auto_80423 ?auto_80426 ) ) ( not ( = ?auto_80424 ?auto_80425 ) ) ( not ( = ?auto_80424 ?auto_80426 ) ) ( not ( = ?auto_80425 ?auto_80426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80425 ?auto_80426 )
      ( !STACK ?auto_80425 ?auto_80424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80446 - BLOCK
      ?auto_80447 - BLOCK
      ?auto_80448 - BLOCK
      ?auto_80449 - BLOCK
      ?auto_80450 - BLOCK
      ?auto_80451 - BLOCK
    )
    :vars
    (
      ?auto_80452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80451 ?auto_80452 ) ( ON-TABLE ?auto_80446 ) ( ON ?auto_80447 ?auto_80446 ) ( ON ?auto_80448 ?auto_80447 ) ( ON ?auto_80449 ?auto_80448 ) ( not ( = ?auto_80446 ?auto_80447 ) ) ( not ( = ?auto_80446 ?auto_80448 ) ) ( not ( = ?auto_80446 ?auto_80449 ) ) ( not ( = ?auto_80446 ?auto_80450 ) ) ( not ( = ?auto_80446 ?auto_80451 ) ) ( not ( = ?auto_80446 ?auto_80452 ) ) ( not ( = ?auto_80447 ?auto_80448 ) ) ( not ( = ?auto_80447 ?auto_80449 ) ) ( not ( = ?auto_80447 ?auto_80450 ) ) ( not ( = ?auto_80447 ?auto_80451 ) ) ( not ( = ?auto_80447 ?auto_80452 ) ) ( not ( = ?auto_80448 ?auto_80449 ) ) ( not ( = ?auto_80448 ?auto_80450 ) ) ( not ( = ?auto_80448 ?auto_80451 ) ) ( not ( = ?auto_80448 ?auto_80452 ) ) ( not ( = ?auto_80449 ?auto_80450 ) ) ( not ( = ?auto_80449 ?auto_80451 ) ) ( not ( = ?auto_80449 ?auto_80452 ) ) ( not ( = ?auto_80450 ?auto_80451 ) ) ( not ( = ?auto_80450 ?auto_80452 ) ) ( not ( = ?auto_80451 ?auto_80452 ) ) ( CLEAR ?auto_80449 ) ( ON ?auto_80450 ?auto_80451 ) ( CLEAR ?auto_80450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80446 ?auto_80447 ?auto_80448 ?auto_80449 ?auto_80450 )
      ( MAKE-6PILE ?auto_80446 ?auto_80447 ?auto_80448 ?auto_80449 ?auto_80450 ?auto_80451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80472 - BLOCK
      ?auto_80473 - BLOCK
      ?auto_80474 - BLOCK
      ?auto_80475 - BLOCK
      ?auto_80476 - BLOCK
      ?auto_80477 - BLOCK
    )
    :vars
    (
      ?auto_80478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80477 ?auto_80478 ) ( ON-TABLE ?auto_80472 ) ( ON ?auto_80473 ?auto_80472 ) ( ON ?auto_80474 ?auto_80473 ) ( not ( = ?auto_80472 ?auto_80473 ) ) ( not ( = ?auto_80472 ?auto_80474 ) ) ( not ( = ?auto_80472 ?auto_80475 ) ) ( not ( = ?auto_80472 ?auto_80476 ) ) ( not ( = ?auto_80472 ?auto_80477 ) ) ( not ( = ?auto_80472 ?auto_80478 ) ) ( not ( = ?auto_80473 ?auto_80474 ) ) ( not ( = ?auto_80473 ?auto_80475 ) ) ( not ( = ?auto_80473 ?auto_80476 ) ) ( not ( = ?auto_80473 ?auto_80477 ) ) ( not ( = ?auto_80473 ?auto_80478 ) ) ( not ( = ?auto_80474 ?auto_80475 ) ) ( not ( = ?auto_80474 ?auto_80476 ) ) ( not ( = ?auto_80474 ?auto_80477 ) ) ( not ( = ?auto_80474 ?auto_80478 ) ) ( not ( = ?auto_80475 ?auto_80476 ) ) ( not ( = ?auto_80475 ?auto_80477 ) ) ( not ( = ?auto_80475 ?auto_80478 ) ) ( not ( = ?auto_80476 ?auto_80477 ) ) ( not ( = ?auto_80476 ?auto_80478 ) ) ( not ( = ?auto_80477 ?auto_80478 ) ) ( ON ?auto_80476 ?auto_80477 ) ( CLEAR ?auto_80474 ) ( ON ?auto_80475 ?auto_80476 ) ( CLEAR ?auto_80475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80472 ?auto_80473 ?auto_80474 ?auto_80475 )
      ( MAKE-6PILE ?auto_80472 ?auto_80473 ?auto_80474 ?auto_80475 ?auto_80476 ?auto_80477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80498 - BLOCK
      ?auto_80499 - BLOCK
      ?auto_80500 - BLOCK
      ?auto_80501 - BLOCK
      ?auto_80502 - BLOCK
      ?auto_80503 - BLOCK
    )
    :vars
    (
      ?auto_80504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80503 ?auto_80504 ) ( ON-TABLE ?auto_80498 ) ( ON ?auto_80499 ?auto_80498 ) ( not ( = ?auto_80498 ?auto_80499 ) ) ( not ( = ?auto_80498 ?auto_80500 ) ) ( not ( = ?auto_80498 ?auto_80501 ) ) ( not ( = ?auto_80498 ?auto_80502 ) ) ( not ( = ?auto_80498 ?auto_80503 ) ) ( not ( = ?auto_80498 ?auto_80504 ) ) ( not ( = ?auto_80499 ?auto_80500 ) ) ( not ( = ?auto_80499 ?auto_80501 ) ) ( not ( = ?auto_80499 ?auto_80502 ) ) ( not ( = ?auto_80499 ?auto_80503 ) ) ( not ( = ?auto_80499 ?auto_80504 ) ) ( not ( = ?auto_80500 ?auto_80501 ) ) ( not ( = ?auto_80500 ?auto_80502 ) ) ( not ( = ?auto_80500 ?auto_80503 ) ) ( not ( = ?auto_80500 ?auto_80504 ) ) ( not ( = ?auto_80501 ?auto_80502 ) ) ( not ( = ?auto_80501 ?auto_80503 ) ) ( not ( = ?auto_80501 ?auto_80504 ) ) ( not ( = ?auto_80502 ?auto_80503 ) ) ( not ( = ?auto_80502 ?auto_80504 ) ) ( not ( = ?auto_80503 ?auto_80504 ) ) ( ON ?auto_80502 ?auto_80503 ) ( ON ?auto_80501 ?auto_80502 ) ( CLEAR ?auto_80499 ) ( ON ?auto_80500 ?auto_80501 ) ( CLEAR ?auto_80500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80498 ?auto_80499 ?auto_80500 )
      ( MAKE-6PILE ?auto_80498 ?auto_80499 ?auto_80500 ?auto_80501 ?auto_80502 ?auto_80503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80524 - BLOCK
      ?auto_80525 - BLOCK
      ?auto_80526 - BLOCK
      ?auto_80527 - BLOCK
      ?auto_80528 - BLOCK
      ?auto_80529 - BLOCK
    )
    :vars
    (
      ?auto_80530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80529 ?auto_80530 ) ( ON-TABLE ?auto_80524 ) ( not ( = ?auto_80524 ?auto_80525 ) ) ( not ( = ?auto_80524 ?auto_80526 ) ) ( not ( = ?auto_80524 ?auto_80527 ) ) ( not ( = ?auto_80524 ?auto_80528 ) ) ( not ( = ?auto_80524 ?auto_80529 ) ) ( not ( = ?auto_80524 ?auto_80530 ) ) ( not ( = ?auto_80525 ?auto_80526 ) ) ( not ( = ?auto_80525 ?auto_80527 ) ) ( not ( = ?auto_80525 ?auto_80528 ) ) ( not ( = ?auto_80525 ?auto_80529 ) ) ( not ( = ?auto_80525 ?auto_80530 ) ) ( not ( = ?auto_80526 ?auto_80527 ) ) ( not ( = ?auto_80526 ?auto_80528 ) ) ( not ( = ?auto_80526 ?auto_80529 ) ) ( not ( = ?auto_80526 ?auto_80530 ) ) ( not ( = ?auto_80527 ?auto_80528 ) ) ( not ( = ?auto_80527 ?auto_80529 ) ) ( not ( = ?auto_80527 ?auto_80530 ) ) ( not ( = ?auto_80528 ?auto_80529 ) ) ( not ( = ?auto_80528 ?auto_80530 ) ) ( not ( = ?auto_80529 ?auto_80530 ) ) ( ON ?auto_80528 ?auto_80529 ) ( ON ?auto_80527 ?auto_80528 ) ( ON ?auto_80526 ?auto_80527 ) ( CLEAR ?auto_80524 ) ( ON ?auto_80525 ?auto_80526 ) ( CLEAR ?auto_80525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80524 ?auto_80525 )
      ( MAKE-6PILE ?auto_80524 ?auto_80525 ?auto_80526 ?auto_80527 ?auto_80528 ?auto_80529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_80550 - BLOCK
      ?auto_80551 - BLOCK
      ?auto_80552 - BLOCK
      ?auto_80553 - BLOCK
      ?auto_80554 - BLOCK
      ?auto_80555 - BLOCK
    )
    :vars
    (
      ?auto_80556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80555 ?auto_80556 ) ( not ( = ?auto_80550 ?auto_80551 ) ) ( not ( = ?auto_80550 ?auto_80552 ) ) ( not ( = ?auto_80550 ?auto_80553 ) ) ( not ( = ?auto_80550 ?auto_80554 ) ) ( not ( = ?auto_80550 ?auto_80555 ) ) ( not ( = ?auto_80550 ?auto_80556 ) ) ( not ( = ?auto_80551 ?auto_80552 ) ) ( not ( = ?auto_80551 ?auto_80553 ) ) ( not ( = ?auto_80551 ?auto_80554 ) ) ( not ( = ?auto_80551 ?auto_80555 ) ) ( not ( = ?auto_80551 ?auto_80556 ) ) ( not ( = ?auto_80552 ?auto_80553 ) ) ( not ( = ?auto_80552 ?auto_80554 ) ) ( not ( = ?auto_80552 ?auto_80555 ) ) ( not ( = ?auto_80552 ?auto_80556 ) ) ( not ( = ?auto_80553 ?auto_80554 ) ) ( not ( = ?auto_80553 ?auto_80555 ) ) ( not ( = ?auto_80553 ?auto_80556 ) ) ( not ( = ?auto_80554 ?auto_80555 ) ) ( not ( = ?auto_80554 ?auto_80556 ) ) ( not ( = ?auto_80555 ?auto_80556 ) ) ( ON ?auto_80554 ?auto_80555 ) ( ON ?auto_80553 ?auto_80554 ) ( ON ?auto_80552 ?auto_80553 ) ( ON ?auto_80551 ?auto_80552 ) ( ON ?auto_80550 ?auto_80551 ) ( CLEAR ?auto_80550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80550 )
      ( MAKE-6PILE ?auto_80550 ?auto_80551 ?auto_80552 ?auto_80553 ?auto_80554 ?auto_80555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80577 - BLOCK
      ?auto_80578 - BLOCK
      ?auto_80579 - BLOCK
      ?auto_80580 - BLOCK
      ?auto_80581 - BLOCK
      ?auto_80582 - BLOCK
      ?auto_80583 - BLOCK
    )
    :vars
    (
      ?auto_80584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80582 ) ( ON ?auto_80583 ?auto_80584 ) ( CLEAR ?auto_80583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80577 ) ( ON ?auto_80578 ?auto_80577 ) ( ON ?auto_80579 ?auto_80578 ) ( ON ?auto_80580 ?auto_80579 ) ( ON ?auto_80581 ?auto_80580 ) ( ON ?auto_80582 ?auto_80581 ) ( not ( = ?auto_80577 ?auto_80578 ) ) ( not ( = ?auto_80577 ?auto_80579 ) ) ( not ( = ?auto_80577 ?auto_80580 ) ) ( not ( = ?auto_80577 ?auto_80581 ) ) ( not ( = ?auto_80577 ?auto_80582 ) ) ( not ( = ?auto_80577 ?auto_80583 ) ) ( not ( = ?auto_80577 ?auto_80584 ) ) ( not ( = ?auto_80578 ?auto_80579 ) ) ( not ( = ?auto_80578 ?auto_80580 ) ) ( not ( = ?auto_80578 ?auto_80581 ) ) ( not ( = ?auto_80578 ?auto_80582 ) ) ( not ( = ?auto_80578 ?auto_80583 ) ) ( not ( = ?auto_80578 ?auto_80584 ) ) ( not ( = ?auto_80579 ?auto_80580 ) ) ( not ( = ?auto_80579 ?auto_80581 ) ) ( not ( = ?auto_80579 ?auto_80582 ) ) ( not ( = ?auto_80579 ?auto_80583 ) ) ( not ( = ?auto_80579 ?auto_80584 ) ) ( not ( = ?auto_80580 ?auto_80581 ) ) ( not ( = ?auto_80580 ?auto_80582 ) ) ( not ( = ?auto_80580 ?auto_80583 ) ) ( not ( = ?auto_80580 ?auto_80584 ) ) ( not ( = ?auto_80581 ?auto_80582 ) ) ( not ( = ?auto_80581 ?auto_80583 ) ) ( not ( = ?auto_80581 ?auto_80584 ) ) ( not ( = ?auto_80582 ?auto_80583 ) ) ( not ( = ?auto_80582 ?auto_80584 ) ) ( not ( = ?auto_80583 ?auto_80584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80583 ?auto_80584 )
      ( !STACK ?auto_80583 ?auto_80582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80607 - BLOCK
      ?auto_80608 - BLOCK
      ?auto_80609 - BLOCK
      ?auto_80610 - BLOCK
      ?auto_80611 - BLOCK
      ?auto_80612 - BLOCK
      ?auto_80613 - BLOCK
    )
    :vars
    (
      ?auto_80614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80613 ?auto_80614 ) ( ON-TABLE ?auto_80607 ) ( ON ?auto_80608 ?auto_80607 ) ( ON ?auto_80609 ?auto_80608 ) ( ON ?auto_80610 ?auto_80609 ) ( ON ?auto_80611 ?auto_80610 ) ( not ( = ?auto_80607 ?auto_80608 ) ) ( not ( = ?auto_80607 ?auto_80609 ) ) ( not ( = ?auto_80607 ?auto_80610 ) ) ( not ( = ?auto_80607 ?auto_80611 ) ) ( not ( = ?auto_80607 ?auto_80612 ) ) ( not ( = ?auto_80607 ?auto_80613 ) ) ( not ( = ?auto_80607 ?auto_80614 ) ) ( not ( = ?auto_80608 ?auto_80609 ) ) ( not ( = ?auto_80608 ?auto_80610 ) ) ( not ( = ?auto_80608 ?auto_80611 ) ) ( not ( = ?auto_80608 ?auto_80612 ) ) ( not ( = ?auto_80608 ?auto_80613 ) ) ( not ( = ?auto_80608 ?auto_80614 ) ) ( not ( = ?auto_80609 ?auto_80610 ) ) ( not ( = ?auto_80609 ?auto_80611 ) ) ( not ( = ?auto_80609 ?auto_80612 ) ) ( not ( = ?auto_80609 ?auto_80613 ) ) ( not ( = ?auto_80609 ?auto_80614 ) ) ( not ( = ?auto_80610 ?auto_80611 ) ) ( not ( = ?auto_80610 ?auto_80612 ) ) ( not ( = ?auto_80610 ?auto_80613 ) ) ( not ( = ?auto_80610 ?auto_80614 ) ) ( not ( = ?auto_80611 ?auto_80612 ) ) ( not ( = ?auto_80611 ?auto_80613 ) ) ( not ( = ?auto_80611 ?auto_80614 ) ) ( not ( = ?auto_80612 ?auto_80613 ) ) ( not ( = ?auto_80612 ?auto_80614 ) ) ( not ( = ?auto_80613 ?auto_80614 ) ) ( CLEAR ?auto_80611 ) ( ON ?auto_80612 ?auto_80613 ) ( CLEAR ?auto_80612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80607 ?auto_80608 ?auto_80609 ?auto_80610 ?auto_80611 ?auto_80612 )
      ( MAKE-7PILE ?auto_80607 ?auto_80608 ?auto_80609 ?auto_80610 ?auto_80611 ?auto_80612 ?auto_80613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80637 - BLOCK
      ?auto_80638 - BLOCK
      ?auto_80639 - BLOCK
      ?auto_80640 - BLOCK
      ?auto_80641 - BLOCK
      ?auto_80642 - BLOCK
      ?auto_80643 - BLOCK
    )
    :vars
    (
      ?auto_80644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80643 ?auto_80644 ) ( ON-TABLE ?auto_80637 ) ( ON ?auto_80638 ?auto_80637 ) ( ON ?auto_80639 ?auto_80638 ) ( ON ?auto_80640 ?auto_80639 ) ( not ( = ?auto_80637 ?auto_80638 ) ) ( not ( = ?auto_80637 ?auto_80639 ) ) ( not ( = ?auto_80637 ?auto_80640 ) ) ( not ( = ?auto_80637 ?auto_80641 ) ) ( not ( = ?auto_80637 ?auto_80642 ) ) ( not ( = ?auto_80637 ?auto_80643 ) ) ( not ( = ?auto_80637 ?auto_80644 ) ) ( not ( = ?auto_80638 ?auto_80639 ) ) ( not ( = ?auto_80638 ?auto_80640 ) ) ( not ( = ?auto_80638 ?auto_80641 ) ) ( not ( = ?auto_80638 ?auto_80642 ) ) ( not ( = ?auto_80638 ?auto_80643 ) ) ( not ( = ?auto_80638 ?auto_80644 ) ) ( not ( = ?auto_80639 ?auto_80640 ) ) ( not ( = ?auto_80639 ?auto_80641 ) ) ( not ( = ?auto_80639 ?auto_80642 ) ) ( not ( = ?auto_80639 ?auto_80643 ) ) ( not ( = ?auto_80639 ?auto_80644 ) ) ( not ( = ?auto_80640 ?auto_80641 ) ) ( not ( = ?auto_80640 ?auto_80642 ) ) ( not ( = ?auto_80640 ?auto_80643 ) ) ( not ( = ?auto_80640 ?auto_80644 ) ) ( not ( = ?auto_80641 ?auto_80642 ) ) ( not ( = ?auto_80641 ?auto_80643 ) ) ( not ( = ?auto_80641 ?auto_80644 ) ) ( not ( = ?auto_80642 ?auto_80643 ) ) ( not ( = ?auto_80642 ?auto_80644 ) ) ( not ( = ?auto_80643 ?auto_80644 ) ) ( ON ?auto_80642 ?auto_80643 ) ( CLEAR ?auto_80640 ) ( ON ?auto_80641 ?auto_80642 ) ( CLEAR ?auto_80641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80637 ?auto_80638 ?auto_80639 ?auto_80640 ?auto_80641 )
      ( MAKE-7PILE ?auto_80637 ?auto_80638 ?auto_80639 ?auto_80640 ?auto_80641 ?auto_80642 ?auto_80643 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80667 - BLOCK
      ?auto_80668 - BLOCK
      ?auto_80669 - BLOCK
      ?auto_80670 - BLOCK
      ?auto_80671 - BLOCK
      ?auto_80672 - BLOCK
      ?auto_80673 - BLOCK
    )
    :vars
    (
      ?auto_80674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80673 ?auto_80674 ) ( ON-TABLE ?auto_80667 ) ( ON ?auto_80668 ?auto_80667 ) ( ON ?auto_80669 ?auto_80668 ) ( not ( = ?auto_80667 ?auto_80668 ) ) ( not ( = ?auto_80667 ?auto_80669 ) ) ( not ( = ?auto_80667 ?auto_80670 ) ) ( not ( = ?auto_80667 ?auto_80671 ) ) ( not ( = ?auto_80667 ?auto_80672 ) ) ( not ( = ?auto_80667 ?auto_80673 ) ) ( not ( = ?auto_80667 ?auto_80674 ) ) ( not ( = ?auto_80668 ?auto_80669 ) ) ( not ( = ?auto_80668 ?auto_80670 ) ) ( not ( = ?auto_80668 ?auto_80671 ) ) ( not ( = ?auto_80668 ?auto_80672 ) ) ( not ( = ?auto_80668 ?auto_80673 ) ) ( not ( = ?auto_80668 ?auto_80674 ) ) ( not ( = ?auto_80669 ?auto_80670 ) ) ( not ( = ?auto_80669 ?auto_80671 ) ) ( not ( = ?auto_80669 ?auto_80672 ) ) ( not ( = ?auto_80669 ?auto_80673 ) ) ( not ( = ?auto_80669 ?auto_80674 ) ) ( not ( = ?auto_80670 ?auto_80671 ) ) ( not ( = ?auto_80670 ?auto_80672 ) ) ( not ( = ?auto_80670 ?auto_80673 ) ) ( not ( = ?auto_80670 ?auto_80674 ) ) ( not ( = ?auto_80671 ?auto_80672 ) ) ( not ( = ?auto_80671 ?auto_80673 ) ) ( not ( = ?auto_80671 ?auto_80674 ) ) ( not ( = ?auto_80672 ?auto_80673 ) ) ( not ( = ?auto_80672 ?auto_80674 ) ) ( not ( = ?auto_80673 ?auto_80674 ) ) ( ON ?auto_80672 ?auto_80673 ) ( ON ?auto_80671 ?auto_80672 ) ( CLEAR ?auto_80669 ) ( ON ?auto_80670 ?auto_80671 ) ( CLEAR ?auto_80670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80667 ?auto_80668 ?auto_80669 ?auto_80670 )
      ( MAKE-7PILE ?auto_80667 ?auto_80668 ?auto_80669 ?auto_80670 ?auto_80671 ?auto_80672 ?auto_80673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80697 - BLOCK
      ?auto_80698 - BLOCK
      ?auto_80699 - BLOCK
      ?auto_80700 - BLOCK
      ?auto_80701 - BLOCK
      ?auto_80702 - BLOCK
      ?auto_80703 - BLOCK
    )
    :vars
    (
      ?auto_80704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80703 ?auto_80704 ) ( ON-TABLE ?auto_80697 ) ( ON ?auto_80698 ?auto_80697 ) ( not ( = ?auto_80697 ?auto_80698 ) ) ( not ( = ?auto_80697 ?auto_80699 ) ) ( not ( = ?auto_80697 ?auto_80700 ) ) ( not ( = ?auto_80697 ?auto_80701 ) ) ( not ( = ?auto_80697 ?auto_80702 ) ) ( not ( = ?auto_80697 ?auto_80703 ) ) ( not ( = ?auto_80697 ?auto_80704 ) ) ( not ( = ?auto_80698 ?auto_80699 ) ) ( not ( = ?auto_80698 ?auto_80700 ) ) ( not ( = ?auto_80698 ?auto_80701 ) ) ( not ( = ?auto_80698 ?auto_80702 ) ) ( not ( = ?auto_80698 ?auto_80703 ) ) ( not ( = ?auto_80698 ?auto_80704 ) ) ( not ( = ?auto_80699 ?auto_80700 ) ) ( not ( = ?auto_80699 ?auto_80701 ) ) ( not ( = ?auto_80699 ?auto_80702 ) ) ( not ( = ?auto_80699 ?auto_80703 ) ) ( not ( = ?auto_80699 ?auto_80704 ) ) ( not ( = ?auto_80700 ?auto_80701 ) ) ( not ( = ?auto_80700 ?auto_80702 ) ) ( not ( = ?auto_80700 ?auto_80703 ) ) ( not ( = ?auto_80700 ?auto_80704 ) ) ( not ( = ?auto_80701 ?auto_80702 ) ) ( not ( = ?auto_80701 ?auto_80703 ) ) ( not ( = ?auto_80701 ?auto_80704 ) ) ( not ( = ?auto_80702 ?auto_80703 ) ) ( not ( = ?auto_80702 ?auto_80704 ) ) ( not ( = ?auto_80703 ?auto_80704 ) ) ( ON ?auto_80702 ?auto_80703 ) ( ON ?auto_80701 ?auto_80702 ) ( ON ?auto_80700 ?auto_80701 ) ( CLEAR ?auto_80698 ) ( ON ?auto_80699 ?auto_80700 ) ( CLEAR ?auto_80699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80697 ?auto_80698 ?auto_80699 )
      ( MAKE-7PILE ?auto_80697 ?auto_80698 ?auto_80699 ?auto_80700 ?auto_80701 ?auto_80702 ?auto_80703 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80727 - BLOCK
      ?auto_80728 - BLOCK
      ?auto_80729 - BLOCK
      ?auto_80730 - BLOCK
      ?auto_80731 - BLOCK
      ?auto_80732 - BLOCK
      ?auto_80733 - BLOCK
    )
    :vars
    (
      ?auto_80734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80733 ?auto_80734 ) ( ON-TABLE ?auto_80727 ) ( not ( = ?auto_80727 ?auto_80728 ) ) ( not ( = ?auto_80727 ?auto_80729 ) ) ( not ( = ?auto_80727 ?auto_80730 ) ) ( not ( = ?auto_80727 ?auto_80731 ) ) ( not ( = ?auto_80727 ?auto_80732 ) ) ( not ( = ?auto_80727 ?auto_80733 ) ) ( not ( = ?auto_80727 ?auto_80734 ) ) ( not ( = ?auto_80728 ?auto_80729 ) ) ( not ( = ?auto_80728 ?auto_80730 ) ) ( not ( = ?auto_80728 ?auto_80731 ) ) ( not ( = ?auto_80728 ?auto_80732 ) ) ( not ( = ?auto_80728 ?auto_80733 ) ) ( not ( = ?auto_80728 ?auto_80734 ) ) ( not ( = ?auto_80729 ?auto_80730 ) ) ( not ( = ?auto_80729 ?auto_80731 ) ) ( not ( = ?auto_80729 ?auto_80732 ) ) ( not ( = ?auto_80729 ?auto_80733 ) ) ( not ( = ?auto_80729 ?auto_80734 ) ) ( not ( = ?auto_80730 ?auto_80731 ) ) ( not ( = ?auto_80730 ?auto_80732 ) ) ( not ( = ?auto_80730 ?auto_80733 ) ) ( not ( = ?auto_80730 ?auto_80734 ) ) ( not ( = ?auto_80731 ?auto_80732 ) ) ( not ( = ?auto_80731 ?auto_80733 ) ) ( not ( = ?auto_80731 ?auto_80734 ) ) ( not ( = ?auto_80732 ?auto_80733 ) ) ( not ( = ?auto_80732 ?auto_80734 ) ) ( not ( = ?auto_80733 ?auto_80734 ) ) ( ON ?auto_80732 ?auto_80733 ) ( ON ?auto_80731 ?auto_80732 ) ( ON ?auto_80730 ?auto_80731 ) ( ON ?auto_80729 ?auto_80730 ) ( CLEAR ?auto_80727 ) ( ON ?auto_80728 ?auto_80729 ) ( CLEAR ?auto_80728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80727 ?auto_80728 )
      ( MAKE-7PILE ?auto_80727 ?auto_80728 ?auto_80729 ?auto_80730 ?auto_80731 ?auto_80732 ?auto_80733 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_80757 - BLOCK
      ?auto_80758 - BLOCK
      ?auto_80759 - BLOCK
      ?auto_80760 - BLOCK
      ?auto_80761 - BLOCK
      ?auto_80762 - BLOCK
      ?auto_80763 - BLOCK
    )
    :vars
    (
      ?auto_80764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80763 ?auto_80764 ) ( not ( = ?auto_80757 ?auto_80758 ) ) ( not ( = ?auto_80757 ?auto_80759 ) ) ( not ( = ?auto_80757 ?auto_80760 ) ) ( not ( = ?auto_80757 ?auto_80761 ) ) ( not ( = ?auto_80757 ?auto_80762 ) ) ( not ( = ?auto_80757 ?auto_80763 ) ) ( not ( = ?auto_80757 ?auto_80764 ) ) ( not ( = ?auto_80758 ?auto_80759 ) ) ( not ( = ?auto_80758 ?auto_80760 ) ) ( not ( = ?auto_80758 ?auto_80761 ) ) ( not ( = ?auto_80758 ?auto_80762 ) ) ( not ( = ?auto_80758 ?auto_80763 ) ) ( not ( = ?auto_80758 ?auto_80764 ) ) ( not ( = ?auto_80759 ?auto_80760 ) ) ( not ( = ?auto_80759 ?auto_80761 ) ) ( not ( = ?auto_80759 ?auto_80762 ) ) ( not ( = ?auto_80759 ?auto_80763 ) ) ( not ( = ?auto_80759 ?auto_80764 ) ) ( not ( = ?auto_80760 ?auto_80761 ) ) ( not ( = ?auto_80760 ?auto_80762 ) ) ( not ( = ?auto_80760 ?auto_80763 ) ) ( not ( = ?auto_80760 ?auto_80764 ) ) ( not ( = ?auto_80761 ?auto_80762 ) ) ( not ( = ?auto_80761 ?auto_80763 ) ) ( not ( = ?auto_80761 ?auto_80764 ) ) ( not ( = ?auto_80762 ?auto_80763 ) ) ( not ( = ?auto_80762 ?auto_80764 ) ) ( not ( = ?auto_80763 ?auto_80764 ) ) ( ON ?auto_80762 ?auto_80763 ) ( ON ?auto_80761 ?auto_80762 ) ( ON ?auto_80760 ?auto_80761 ) ( ON ?auto_80759 ?auto_80760 ) ( ON ?auto_80758 ?auto_80759 ) ( ON ?auto_80757 ?auto_80758 ) ( CLEAR ?auto_80757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80757 )
      ( MAKE-7PILE ?auto_80757 ?auto_80758 ?auto_80759 ?auto_80760 ?auto_80761 ?auto_80762 ?auto_80763 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80788 - BLOCK
      ?auto_80789 - BLOCK
      ?auto_80790 - BLOCK
      ?auto_80791 - BLOCK
      ?auto_80792 - BLOCK
      ?auto_80793 - BLOCK
      ?auto_80794 - BLOCK
      ?auto_80795 - BLOCK
    )
    :vars
    (
      ?auto_80796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80794 ) ( ON ?auto_80795 ?auto_80796 ) ( CLEAR ?auto_80795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80788 ) ( ON ?auto_80789 ?auto_80788 ) ( ON ?auto_80790 ?auto_80789 ) ( ON ?auto_80791 ?auto_80790 ) ( ON ?auto_80792 ?auto_80791 ) ( ON ?auto_80793 ?auto_80792 ) ( ON ?auto_80794 ?auto_80793 ) ( not ( = ?auto_80788 ?auto_80789 ) ) ( not ( = ?auto_80788 ?auto_80790 ) ) ( not ( = ?auto_80788 ?auto_80791 ) ) ( not ( = ?auto_80788 ?auto_80792 ) ) ( not ( = ?auto_80788 ?auto_80793 ) ) ( not ( = ?auto_80788 ?auto_80794 ) ) ( not ( = ?auto_80788 ?auto_80795 ) ) ( not ( = ?auto_80788 ?auto_80796 ) ) ( not ( = ?auto_80789 ?auto_80790 ) ) ( not ( = ?auto_80789 ?auto_80791 ) ) ( not ( = ?auto_80789 ?auto_80792 ) ) ( not ( = ?auto_80789 ?auto_80793 ) ) ( not ( = ?auto_80789 ?auto_80794 ) ) ( not ( = ?auto_80789 ?auto_80795 ) ) ( not ( = ?auto_80789 ?auto_80796 ) ) ( not ( = ?auto_80790 ?auto_80791 ) ) ( not ( = ?auto_80790 ?auto_80792 ) ) ( not ( = ?auto_80790 ?auto_80793 ) ) ( not ( = ?auto_80790 ?auto_80794 ) ) ( not ( = ?auto_80790 ?auto_80795 ) ) ( not ( = ?auto_80790 ?auto_80796 ) ) ( not ( = ?auto_80791 ?auto_80792 ) ) ( not ( = ?auto_80791 ?auto_80793 ) ) ( not ( = ?auto_80791 ?auto_80794 ) ) ( not ( = ?auto_80791 ?auto_80795 ) ) ( not ( = ?auto_80791 ?auto_80796 ) ) ( not ( = ?auto_80792 ?auto_80793 ) ) ( not ( = ?auto_80792 ?auto_80794 ) ) ( not ( = ?auto_80792 ?auto_80795 ) ) ( not ( = ?auto_80792 ?auto_80796 ) ) ( not ( = ?auto_80793 ?auto_80794 ) ) ( not ( = ?auto_80793 ?auto_80795 ) ) ( not ( = ?auto_80793 ?auto_80796 ) ) ( not ( = ?auto_80794 ?auto_80795 ) ) ( not ( = ?auto_80794 ?auto_80796 ) ) ( not ( = ?auto_80795 ?auto_80796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80795 ?auto_80796 )
      ( !STACK ?auto_80795 ?auto_80794 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80822 - BLOCK
      ?auto_80823 - BLOCK
      ?auto_80824 - BLOCK
      ?auto_80825 - BLOCK
      ?auto_80826 - BLOCK
      ?auto_80827 - BLOCK
      ?auto_80828 - BLOCK
      ?auto_80829 - BLOCK
    )
    :vars
    (
      ?auto_80830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80829 ?auto_80830 ) ( ON-TABLE ?auto_80822 ) ( ON ?auto_80823 ?auto_80822 ) ( ON ?auto_80824 ?auto_80823 ) ( ON ?auto_80825 ?auto_80824 ) ( ON ?auto_80826 ?auto_80825 ) ( ON ?auto_80827 ?auto_80826 ) ( not ( = ?auto_80822 ?auto_80823 ) ) ( not ( = ?auto_80822 ?auto_80824 ) ) ( not ( = ?auto_80822 ?auto_80825 ) ) ( not ( = ?auto_80822 ?auto_80826 ) ) ( not ( = ?auto_80822 ?auto_80827 ) ) ( not ( = ?auto_80822 ?auto_80828 ) ) ( not ( = ?auto_80822 ?auto_80829 ) ) ( not ( = ?auto_80822 ?auto_80830 ) ) ( not ( = ?auto_80823 ?auto_80824 ) ) ( not ( = ?auto_80823 ?auto_80825 ) ) ( not ( = ?auto_80823 ?auto_80826 ) ) ( not ( = ?auto_80823 ?auto_80827 ) ) ( not ( = ?auto_80823 ?auto_80828 ) ) ( not ( = ?auto_80823 ?auto_80829 ) ) ( not ( = ?auto_80823 ?auto_80830 ) ) ( not ( = ?auto_80824 ?auto_80825 ) ) ( not ( = ?auto_80824 ?auto_80826 ) ) ( not ( = ?auto_80824 ?auto_80827 ) ) ( not ( = ?auto_80824 ?auto_80828 ) ) ( not ( = ?auto_80824 ?auto_80829 ) ) ( not ( = ?auto_80824 ?auto_80830 ) ) ( not ( = ?auto_80825 ?auto_80826 ) ) ( not ( = ?auto_80825 ?auto_80827 ) ) ( not ( = ?auto_80825 ?auto_80828 ) ) ( not ( = ?auto_80825 ?auto_80829 ) ) ( not ( = ?auto_80825 ?auto_80830 ) ) ( not ( = ?auto_80826 ?auto_80827 ) ) ( not ( = ?auto_80826 ?auto_80828 ) ) ( not ( = ?auto_80826 ?auto_80829 ) ) ( not ( = ?auto_80826 ?auto_80830 ) ) ( not ( = ?auto_80827 ?auto_80828 ) ) ( not ( = ?auto_80827 ?auto_80829 ) ) ( not ( = ?auto_80827 ?auto_80830 ) ) ( not ( = ?auto_80828 ?auto_80829 ) ) ( not ( = ?auto_80828 ?auto_80830 ) ) ( not ( = ?auto_80829 ?auto_80830 ) ) ( CLEAR ?auto_80827 ) ( ON ?auto_80828 ?auto_80829 ) ( CLEAR ?auto_80828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80822 ?auto_80823 ?auto_80824 ?auto_80825 ?auto_80826 ?auto_80827 ?auto_80828 )
      ( MAKE-8PILE ?auto_80822 ?auto_80823 ?auto_80824 ?auto_80825 ?auto_80826 ?auto_80827 ?auto_80828 ?auto_80829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80856 - BLOCK
      ?auto_80857 - BLOCK
      ?auto_80858 - BLOCK
      ?auto_80859 - BLOCK
      ?auto_80860 - BLOCK
      ?auto_80861 - BLOCK
      ?auto_80862 - BLOCK
      ?auto_80863 - BLOCK
    )
    :vars
    (
      ?auto_80864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80863 ?auto_80864 ) ( ON-TABLE ?auto_80856 ) ( ON ?auto_80857 ?auto_80856 ) ( ON ?auto_80858 ?auto_80857 ) ( ON ?auto_80859 ?auto_80858 ) ( ON ?auto_80860 ?auto_80859 ) ( not ( = ?auto_80856 ?auto_80857 ) ) ( not ( = ?auto_80856 ?auto_80858 ) ) ( not ( = ?auto_80856 ?auto_80859 ) ) ( not ( = ?auto_80856 ?auto_80860 ) ) ( not ( = ?auto_80856 ?auto_80861 ) ) ( not ( = ?auto_80856 ?auto_80862 ) ) ( not ( = ?auto_80856 ?auto_80863 ) ) ( not ( = ?auto_80856 ?auto_80864 ) ) ( not ( = ?auto_80857 ?auto_80858 ) ) ( not ( = ?auto_80857 ?auto_80859 ) ) ( not ( = ?auto_80857 ?auto_80860 ) ) ( not ( = ?auto_80857 ?auto_80861 ) ) ( not ( = ?auto_80857 ?auto_80862 ) ) ( not ( = ?auto_80857 ?auto_80863 ) ) ( not ( = ?auto_80857 ?auto_80864 ) ) ( not ( = ?auto_80858 ?auto_80859 ) ) ( not ( = ?auto_80858 ?auto_80860 ) ) ( not ( = ?auto_80858 ?auto_80861 ) ) ( not ( = ?auto_80858 ?auto_80862 ) ) ( not ( = ?auto_80858 ?auto_80863 ) ) ( not ( = ?auto_80858 ?auto_80864 ) ) ( not ( = ?auto_80859 ?auto_80860 ) ) ( not ( = ?auto_80859 ?auto_80861 ) ) ( not ( = ?auto_80859 ?auto_80862 ) ) ( not ( = ?auto_80859 ?auto_80863 ) ) ( not ( = ?auto_80859 ?auto_80864 ) ) ( not ( = ?auto_80860 ?auto_80861 ) ) ( not ( = ?auto_80860 ?auto_80862 ) ) ( not ( = ?auto_80860 ?auto_80863 ) ) ( not ( = ?auto_80860 ?auto_80864 ) ) ( not ( = ?auto_80861 ?auto_80862 ) ) ( not ( = ?auto_80861 ?auto_80863 ) ) ( not ( = ?auto_80861 ?auto_80864 ) ) ( not ( = ?auto_80862 ?auto_80863 ) ) ( not ( = ?auto_80862 ?auto_80864 ) ) ( not ( = ?auto_80863 ?auto_80864 ) ) ( ON ?auto_80862 ?auto_80863 ) ( CLEAR ?auto_80860 ) ( ON ?auto_80861 ?auto_80862 ) ( CLEAR ?auto_80861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80856 ?auto_80857 ?auto_80858 ?auto_80859 ?auto_80860 ?auto_80861 )
      ( MAKE-8PILE ?auto_80856 ?auto_80857 ?auto_80858 ?auto_80859 ?auto_80860 ?auto_80861 ?auto_80862 ?auto_80863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80890 - BLOCK
      ?auto_80891 - BLOCK
      ?auto_80892 - BLOCK
      ?auto_80893 - BLOCK
      ?auto_80894 - BLOCK
      ?auto_80895 - BLOCK
      ?auto_80896 - BLOCK
      ?auto_80897 - BLOCK
    )
    :vars
    (
      ?auto_80898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80897 ?auto_80898 ) ( ON-TABLE ?auto_80890 ) ( ON ?auto_80891 ?auto_80890 ) ( ON ?auto_80892 ?auto_80891 ) ( ON ?auto_80893 ?auto_80892 ) ( not ( = ?auto_80890 ?auto_80891 ) ) ( not ( = ?auto_80890 ?auto_80892 ) ) ( not ( = ?auto_80890 ?auto_80893 ) ) ( not ( = ?auto_80890 ?auto_80894 ) ) ( not ( = ?auto_80890 ?auto_80895 ) ) ( not ( = ?auto_80890 ?auto_80896 ) ) ( not ( = ?auto_80890 ?auto_80897 ) ) ( not ( = ?auto_80890 ?auto_80898 ) ) ( not ( = ?auto_80891 ?auto_80892 ) ) ( not ( = ?auto_80891 ?auto_80893 ) ) ( not ( = ?auto_80891 ?auto_80894 ) ) ( not ( = ?auto_80891 ?auto_80895 ) ) ( not ( = ?auto_80891 ?auto_80896 ) ) ( not ( = ?auto_80891 ?auto_80897 ) ) ( not ( = ?auto_80891 ?auto_80898 ) ) ( not ( = ?auto_80892 ?auto_80893 ) ) ( not ( = ?auto_80892 ?auto_80894 ) ) ( not ( = ?auto_80892 ?auto_80895 ) ) ( not ( = ?auto_80892 ?auto_80896 ) ) ( not ( = ?auto_80892 ?auto_80897 ) ) ( not ( = ?auto_80892 ?auto_80898 ) ) ( not ( = ?auto_80893 ?auto_80894 ) ) ( not ( = ?auto_80893 ?auto_80895 ) ) ( not ( = ?auto_80893 ?auto_80896 ) ) ( not ( = ?auto_80893 ?auto_80897 ) ) ( not ( = ?auto_80893 ?auto_80898 ) ) ( not ( = ?auto_80894 ?auto_80895 ) ) ( not ( = ?auto_80894 ?auto_80896 ) ) ( not ( = ?auto_80894 ?auto_80897 ) ) ( not ( = ?auto_80894 ?auto_80898 ) ) ( not ( = ?auto_80895 ?auto_80896 ) ) ( not ( = ?auto_80895 ?auto_80897 ) ) ( not ( = ?auto_80895 ?auto_80898 ) ) ( not ( = ?auto_80896 ?auto_80897 ) ) ( not ( = ?auto_80896 ?auto_80898 ) ) ( not ( = ?auto_80897 ?auto_80898 ) ) ( ON ?auto_80896 ?auto_80897 ) ( ON ?auto_80895 ?auto_80896 ) ( CLEAR ?auto_80893 ) ( ON ?auto_80894 ?auto_80895 ) ( CLEAR ?auto_80894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80890 ?auto_80891 ?auto_80892 ?auto_80893 ?auto_80894 )
      ( MAKE-8PILE ?auto_80890 ?auto_80891 ?auto_80892 ?auto_80893 ?auto_80894 ?auto_80895 ?auto_80896 ?auto_80897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80924 - BLOCK
      ?auto_80925 - BLOCK
      ?auto_80926 - BLOCK
      ?auto_80927 - BLOCK
      ?auto_80928 - BLOCK
      ?auto_80929 - BLOCK
      ?auto_80930 - BLOCK
      ?auto_80931 - BLOCK
    )
    :vars
    (
      ?auto_80932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80931 ?auto_80932 ) ( ON-TABLE ?auto_80924 ) ( ON ?auto_80925 ?auto_80924 ) ( ON ?auto_80926 ?auto_80925 ) ( not ( = ?auto_80924 ?auto_80925 ) ) ( not ( = ?auto_80924 ?auto_80926 ) ) ( not ( = ?auto_80924 ?auto_80927 ) ) ( not ( = ?auto_80924 ?auto_80928 ) ) ( not ( = ?auto_80924 ?auto_80929 ) ) ( not ( = ?auto_80924 ?auto_80930 ) ) ( not ( = ?auto_80924 ?auto_80931 ) ) ( not ( = ?auto_80924 ?auto_80932 ) ) ( not ( = ?auto_80925 ?auto_80926 ) ) ( not ( = ?auto_80925 ?auto_80927 ) ) ( not ( = ?auto_80925 ?auto_80928 ) ) ( not ( = ?auto_80925 ?auto_80929 ) ) ( not ( = ?auto_80925 ?auto_80930 ) ) ( not ( = ?auto_80925 ?auto_80931 ) ) ( not ( = ?auto_80925 ?auto_80932 ) ) ( not ( = ?auto_80926 ?auto_80927 ) ) ( not ( = ?auto_80926 ?auto_80928 ) ) ( not ( = ?auto_80926 ?auto_80929 ) ) ( not ( = ?auto_80926 ?auto_80930 ) ) ( not ( = ?auto_80926 ?auto_80931 ) ) ( not ( = ?auto_80926 ?auto_80932 ) ) ( not ( = ?auto_80927 ?auto_80928 ) ) ( not ( = ?auto_80927 ?auto_80929 ) ) ( not ( = ?auto_80927 ?auto_80930 ) ) ( not ( = ?auto_80927 ?auto_80931 ) ) ( not ( = ?auto_80927 ?auto_80932 ) ) ( not ( = ?auto_80928 ?auto_80929 ) ) ( not ( = ?auto_80928 ?auto_80930 ) ) ( not ( = ?auto_80928 ?auto_80931 ) ) ( not ( = ?auto_80928 ?auto_80932 ) ) ( not ( = ?auto_80929 ?auto_80930 ) ) ( not ( = ?auto_80929 ?auto_80931 ) ) ( not ( = ?auto_80929 ?auto_80932 ) ) ( not ( = ?auto_80930 ?auto_80931 ) ) ( not ( = ?auto_80930 ?auto_80932 ) ) ( not ( = ?auto_80931 ?auto_80932 ) ) ( ON ?auto_80930 ?auto_80931 ) ( ON ?auto_80929 ?auto_80930 ) ( ON ?auto_80928 ?auto_80929 ) ( CLEAR ?auto_80926 ) ( ON ?auto_80927 ?auto_80928 ) ( CLEAR ?auto_80927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80924 ?auto_80925 ?auto_80926 ?auto_80927 )
      ( MAKE-8PILE ?auto_80924 ?auto_80925 ?auto_80926 ?auto_80927 ?auto_80928 ?auto_80929 ?auto_80930 ?auto_80931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80958 - BLOCK
      ?auto_80959 - BLOCK
      ?auto_80960 - BLOCK
      ?auto_80961 - BLOCK
      ?auto_80962 - BLOCK
      ?auto_80963 - BLOCK
      ?auto_80964 - BLOCK
      ?auto_80965 - BLOCK
    )
    :vars
    (
      ?auto_80966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80965 ?auto_80966 ) ( ON-TABLE ?auto_80958 ) ( ON ?auto_80959 ?auto_80958 ) ( not ( = ?auto_80958 ?auto_80959 ) ) ( not ( = ?auto_80958 ?auto_80960 ) ) ( not ( = ?auto_80958 ?auto_80961 ) ) ( not ( = ?auto_80958 ?auto_80962 ) ) ( not ( = ?auto_80958 ?auto_80963 ) ) ( not ( = ?auto_80958 ?auto_80964 ) ) ( not ( = ?auto_80958 ?auto_80965 ) ) ( not ( = ?auto_80958 ?auto_80966 ) ) ( not ( = ?auto_80959 ?auto_80960 ) ) ( not ( = ?auto_80959 ?auto_80961 ) ) ( not ( = ?auto_80959 ?auto_80962 ) ) ( not ( = ?auto_80959 ?auto_80963 ) ) ( not ( = ?auto_80959 ?auto_80964 ) ) ( not ( = ?auto_80959 ?auto_80965 ) ) ( not ( = ?auto_80959 ?auto_80966 ) ) ( not ( = ?auto_80960 ?auto_80961 ) ) ( not ( = ?auto_80960 ?auto_80962 ) ) ( not ( = ?auto_80960 ?auto_80963 ) ) ( not ( = ?auto_80960 ?auto_80964 ) ) ( not ( = ?auto_80960 ?auto_80965 ) ) ( not ( = ?auto_80960 ?auto_80966 ) ) ( not ( = ?auto_80961 ?auto_80962 ) ) ( not ( = ?auto_80961 ?auto_80963 ) ) ( not ( = ?auto_80961 ?auto_80964 ) ) ( not ( = ?auto_80961 ?auto_80965 ) ) ( not ( = ?auto_80961 ?auto_80966 ) ) ( not ( = ?auto_80962 ?auto_80963 ) ) ( not ( = ?auto_80962 ?auto_80964 ) ) ( not ( = ?auto_80962 ?auto_80965 ) ) ( not ( = ?auto_80962 ?auto_80966 ) ) ( not ( = ?auto_80963 ?auto_80964 ) ) ( not ( = ?auto_80963 ?auto_80965 ) ) ( not ( = ?auto_80963 ?auto_80966 ) ) ( not ( = ?auto_80964 ?auto_80965 ) ) ( not ( = ?auto_80964 ?auto_80966 ) ) ( not ( = ?auto_80965 ?auto_80966 ) ) ( ON ?auto_80964 ?auto_80965 ) ( ON ?auto_80963 ?auto_80964 ) ( ON ?auto_80962 ?auto_80963 ) ( ON ?auto_80961 ?auto_80962 ) ( CLEAR ?auto_80959 ) ( ON ?auto_80960 ?auto_80961 ) ( CLEAR ?auto_80960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80958 ?auto_80959 ?auto_80960 )
      ( MAKE-8PILE ?auto_80958 ?auto_80959 ?auto_80960 ?auto_80961 ?auto_80962 ?auto_80963 ?auto_80964 ?auto_80965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_80992 - BLOCK
      ?auto_80993 - BLOCK
      ?auto_80994 - BLOCK
      ?auto_80995 - BLOCK
      ?auto_80996 - BLOCK
      ?auto_80997 - BLOCK
      ?auto_80998 - BLOCK
      ?auto_80999 - BLOCK
    )
    :vars
    (
      ?auto_81000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80999 ?auto_81000 ) ( ON-TABLE ?auto_80992 ) ( not ( = ?auto_80992 ?auto_80993 ) ) ( not ( = ?auto_80992 ?auto_80994 ) ) ( not ( = ?auto_80992 ?auto_80995 ) ) ( not ( = ?auto_80992 ?auto_80996 ) ) ( not ( = ?auto_80992 ?auto_80997 ) ) ( not ( = ?auto_80992 ?auto_80998 ) ) ( not ( = ?auto_80992 ?auto_80999 ) ) ( not ( = ?auto_80992 ?auto_81000 ) ) ( not ( = ?auto_80993 ?auto_80994 ) ) ( not ( = ?auto_80993 ?auto_80995 ) ) ( not ( = ?auto_80993 ?auto_80996 ) ) ( not ( = ?auto_80993 ?auto_80997 ) ) ( not ( = ?auto_80993 ?auto_80998 ) ) ( not ( = ?auto_80993 ?auto_80999 ) ) ( not ( = ?auto_80993 ?auto_81000 ) ) ( not ( = ?auto_80994 ?auto_80995 ) ) ( not ( = ?auto_80994 ?auto_80996 ) ) ( not ( = ?auto_80994 ?auto_80997 ) ) ( not ( = ?auto_80994 ?auto_80998 ) ) ( not ( = ?auto_80994 ?auto_80999 ) ) ( not ( = ?auto_80994 ?auto_81000 ) ) ( not ( = ?auto_80995 ?auto_80996 ) ) ( not ( = ?auto_80995 ?auto_80997 ) ) ( not ( = ?auto_80995 ?auto_80998 ) ) ( not ( = ?auto_80995 ?auto_80999 ) ) ( not ( = ?auto_80995 ?auto_81000 ) ) ( not ( = ?auto_80996 ?auto_80997 ) ) ( not ( = ?auto_80996 ?auto_80998 ) ) ( not ( = ?auto_80996 ?auto_80999 ) ) ( not ( = ?auto_80996 ?auto_81000 ) ) ( not ( = ?auto_80997 ?auto_80998 ) ) ( not ( = ?auto_80997 ?auto_80999 ) ) ( not ( = ?auto_80997 ?auto_81000 ) ) ( not ( = ?auto_80998 ?auto_80999 ) ) ( not ( = ?auto_80998 ?auto_81000 ) ) ( not ( = ?auto_80999 ?auto_81000 ) ) ( ON ?auto_80998 ?auto_80999 ) ( ON ?auto_80997 ?auto_80998 ) ( ON ?auto_80996 ?auto_80997 ) ( ON ?auto_80995 ?auto_80996 ) ( ON ?auto_80994 ?auto_80995 ) ( CLEAR ?auto_80992 ) ( ON ?auto_80993 ?auto_80994 ) ( CLEAR ?auto_80993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80992 ?auto_80993 )
      ( MAKE-8PILE ?auto_80992 ?auto_80993 ?auto_80994 ?auto_80995 ?auto_80996 ?auto_80997 ?auto_80998 ?auto_80999 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_81026 - BLOCK
      ?auto_81027 - BLOCK
      ?auto_81028 - BLOCK
      ?auto_81029 - BLOCK
      ?auto_81030 - BLOCK
      ?auto_81031 - BLOCK
      ?auto_81032 - BLOCK
      ?auto_81033 - BLOCK
    )
    :vars
    (
      ?auto_81034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81033 ?auto_81034 ) ( not ( = ?auto_81026 ?auto_81027 ) ) ( not ( = ?auto_81026 ?auto_81028 ) ) ( not ( = ?auto_81026 ?auto_81029 ) ) ( not ( = ?auto_81026 ?auto_81030 ) ) ( not ( = ?auto_81026 ?auto_81031 ) ) ( not ( = ?auto_81026 ?auto_81032 ) ) ( not ( = ?auto_81026 ?auto_81033 ) ) ( not ( = ?auto_81026 ?auto_81034 ) ) ( not ( = ?auto_81027 ?auto_81028 ) ) ( not ( = ?auto_81027 ?auto_81029 ) ) ( not ( = ?auto_81027 ?auto_81030 ) ) ( not ( = ?auto_81027 ?auto_81031 ) ) ( not ( = ?auto_81027 ?auto_81032 ) ) ( not ( = ?auto_81027 ?auto_81033 ) ) ( not ( = ?auto_81027 ?auto_81034 ) ) ( not ( = ?auto_81028 ?auto_81029 ) ) ( not ( = ?auto_81028 ?auto_81030 ) ) ( not ( = ?auto_81028 ?auto_81031 ) ) ( not ( = ?auto_81028 ?auto_81032 ) ) ( not ( = ?auto_81028 ?auto_81033 ) ) ( not ( = ?auto_81028 ?auto_81034 ) ) ( not ( = ?auto_81029 ?auto_81030 ) ) ( not ( = ?auto_81029 ?auto_81031 ) ) ( not ( = ?auto_81029 ?auto_81032 ) ) ( not ( = ?auto_81029 ?auto_81033 ) ) ( not ( = ?auto_81029 ?auto_81034 ) ) ( not ( = ?auto_81030 ?auto_81031 ) ) ( not ( = ?auto_81030 ?auto_81032 ) ) ( not ( = ?auto_81030 ?auto_81033 ) ) ( not ( = ?auto_81030 ?auto_81034 ) ) ( not ( = ?auto_81031 ?auto_81032 ) ) ( not ( = ?auto_81031 ?auto_81033 ) ) ( not ( = ?auto_81031 ?auto_81034 ) ) ( not ( = ?auto_81032 ?auto_81033 ) ) ( not ( = ?auto_81032 ?auto_81034 ) ) ( not ( = ?auto_81033 ?auto_81034 ) ) ( ON ?auto_81032 ?auto_81033 ) ( ON ?auto_81031 ?auto_81032 ) ( ON ?auto_81030 ?auto_81031 ) ( ON ?auto_81029 ?auto_81030 ) ( ON ?auto_81028 ?auto_81029 ) ( ON ?auto_81027 ?auto_81028 ) ( ON ?auto_81026 ?auto_81027 ) ( CLEAR ?auto_81026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81026 )
      ( MAKE-8PILE ?auto_81026 ?auto_81027 ?auto_81028 ?auto_81029 ?auto_81030 ?auto_81031 ?auto_81032 ?auto_81033 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81061 - BLOCK
      ?auto_81062 - BLOCK
      ?auto_81063 - BLOCK
      ?auto_81064 - BLOCK
      ?auto_81065 - BLOCK
      ?auto_81066 - BLOCK
      ?auto_81067 - BLOCK
      ?auto_81068 - BLOCK
      ?auto_81069 - BLOCK
    )
    :vars
    (
      ?auto_81070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81068 ) ( ON ?auto_81069 ?auto_81070 ) ( CLEAR ?auto_81069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81061 ) ( ON ?auto_81062 ?auto_81061 ) ( ON ?auto_81063 ?auto_81062 ) ( ON ?auto_81064 ?auto_81063 ) ( ON ?auto_81065 ?auto_81064 ) ( ON ?auto_81066 ?auto_81065 ) ( ON ?auto_81067 ?auto_81066 ) ( ON ?auto_81068 ?auto_81067 ) ( not ( = ?auto_81061 ?auto_81062 ) ) ( not ( = ?auto_81061 ?auto_81063 ) ) ( not ( = ?auto_81061 ?auto_81064 ) ) ( not ( = ?auto_81061 ?auto_81065 ) ) ( not ( = ?auto_81061 ?auto_81066 ) ) ( not ( = ?auto_81061 ?auto_81067 ) ) ( not ( = ?auto_81061 ?auto_81068 ) ) ( not ( = ?auto_81061 ?auto_81069 ) ) ( not ( = ?auto_81061 ?auto_81070 ) ) ( not ( = ?auto_81062 ?auto_81063 ) ) ( not ( = ?auto_81062 ?auto_81064 ) ) ( not ( = ?auto_81062 ?auto_81065 ) ) ( not ( = ?auto_81062 ?auto_81066 ) ) ( not ( = ?auto_81062 ?auto_81067 ) ) ( not ( = ?auto_81062 ?auto_81068 ) ) ( not ( = ?auto_81062 ?auto_81069 ) ) ( not ( = ?auto_81062 ?auto_81070 ) ) ( not ( = ?auto_81063 ?auto_81064 ) ) ( not ( = ?auto_81063 ?auto_81065 ) ) ( not ( = ?auto_81063 ?auto_81066 ) ) ( not ( = ?auto_81063 ?auto_81067 ) ) ( not ( = ?auto_81063 ?auto_81068 ) ) ( not ( = ?auto_81063 ?auto_81069 ) ) ( not ( = ?auto_81063 ?auto_81070 ) ) ( not ( = ?auto_81064 ?auto_81065 ) ) ( not ( = ?auto_81064 ?auto_81066 ) ) ( not ( = ?auto_81064 ?auto_81067 ) ) ( not ( = ?auto_81064 ?auto_81068 ) ) ( not ( = ?auto_81064 ?auto_81069 ) ) ( not ( = ?auto_81064 ?auto_81070 ) ) ( not ( = ?auto_81065 ?auto_81066 ) ) ( not ( = ?auto_81065 ?auto_81067 ) ) ( not ( = ?auto_81065 ?auto_81068 ) ) ( not ( = ?auto_81065 ?auto_81069 ) ) ( not ( = ?auto_81065 ?auto_81070 ) ) ( not ( = ?auto_81066 ?auto_81067 ) ) ( not ( = ?auto_81066 ?auto_81068 ) ) ( not ( = ?auto_81066 ?auto_81069 ) ) ( not ( = ?auto_81066 ?auto_81070 ) ) ( not ( = ?auto_81067 ?auto_81068 ) ) ( not ( = ?auto_81067 ?auto_81069 ) ) ( not ( = ?auto_81067 ?auto_81070 ) ) ( not ( = ?auto_81068 ?auto_81069 ) ) ( not ( = ?auto_81068 ?auto_81070 ) ) ( not ( = ?auto_81069 ?auto_81070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81069 ?auto_81070 )
      ( !STACK ?auto_81069 ?auto_81068 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81099 - BLOCK
      ?auto_81100 - BLOCK
      ?auto_81101 - BLOCK
      ?auto_81102 - BLOCK
      ?auto_81103 - BLOCK
      ?auto_81104 - BLOCK
      ?auto_81105 - BLOCK
      ?auto_81106 - BLOCK
      ?auto_81107 - BLOCK
    )
    :vars
    (
      ?auto_81108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81107 ?auto_81108 ) ( ON-TABLE ?auto_81099 ) ( ON ?auto_81100 ?auto_81099 ) ( ON ?auto_81101 ?auto_81100 ) ( ON ?auto_81102 ?auto_81101 ) ( ON ?auto_81103 ?auto_81102 ) ( ON ?auto_81104 ?auto_81103 ) ( ON ?auto_81105 ?auto_81104 ) ( not ( = ?auto_81099 ?auto_81100 ) ) ( not ( = ?auto_81099 ?auto_81101 ) ) ( not ( = ?auto_81099 ?auto_81102 ) ) ( not ( = ?auto_81099 ?auto_81103 ) ) ( not ( = ?auto_81099 ?auto_81104 ) ) ( not ( = ?auto_81099 ?auto_81105 ) ) ( not ( = ?auto_81099 ?auto_81106 ) ) ( not ( = ?auto_81099 ?auto_81107 ) ) ( not ( = ?auto_81099 ?auto_81108 ) ) ( not ( = ?auto_81100 ?auto_81101 ) ) ( not ( = ?auto_81100 ?auto_81102 ) ) ( not ( = ?auto_81100 ?auto_81103 ) ) ( not ( = ?auto_81100 ?auto_81104 ) ) ( not ( = ?auto_81100 ?auto_81105 ) ) ( not ( = ?auto_81100 ?auto_81106 ) ) ( not ( = ?auto_81100 ?auto_81107 ) ) ( not ( = ?auto_81100 ?auto_81108 ) ) ( not ( = ?auto_81101 ?auto_81102 ) ) ( not ( = ?auto_81101 ?auto_81103 ) ) ( not ( = ?auto_81101 ?auto_81104 ) ) ( not ( = ?auto_81101 ?auto_81105 ) ) ( not ( = ?auto_81101 ?auto_81106 ) ) ( not ( = ?auto_81101 ?auto_81107 ) ) ( not ( = ?auto_81101 ?auto_81108 ) ) ( not ( = ?auto_81102 ?auto_81103 ) ) ( not ( = ?auto_81102 ?auto_81104 ) ) ( not ( = ?auto_81102 ?auto_81105 ) ) ( not ( = ?auto_81102 ?auto_81106 ) ) ( not ( = ?auto_81102 ?auto_81107 ) ) ( not ( = ?auto_81102 ?auto_81108 ) ) ( not ( = ?auto_81103 ?auto_81104 ) ) ( not ( = ?auto_81103 ?auto_81105 ) ) ( not ( = ?auto_81103 ?auto_81106 ) ) ( not ( = ?auto_81103 ?auto_81107 ) ) ( not ( = ?auto_81103 ?auto_81108 ) ) ( not ( = ?auto_81104 ?auto_81105 ) ) ( not ( = ?auto_81104 ?auto_81106 ) ) ( not ( = ?auto_81104 ?auto_81107 ) ) ( not ( = ?auto_81104 ?auto_81108 ) ) ( not ( = ?auto_81105 ?auto_81106 ) ) ( not ( = ?auto_81105 ?auto_81107 ) ) ( not ( = ?auto_81105 ?auto_81108 ) ) ( not ( = ?auto_81106 ?auto_81107 ) ) ( not ( = ?auto_81106 ?auto_81108 ) ) ( not ( = ?auto_81107 ?auto_81108 ) ) ( CLEAR ?auto_81105 ) ( ON ?auto_81106 ?auto_81107 ) ( CLEAR ?auto_81106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_81099 ?auto_81100 ?auto_81101 ?auto_81102 ?auto_81103 ?auto_81104 ?auto_81105 ?auto_81106 )
      ( MAKE-9PILE ?auto_81099 ?auto_81100 ?auto_81101 ?auto_81102 ?auto_81103 ?auto_81104 ?auto_81105 ?auto_81106 ?auto_81107 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81137 - BLOCK
      ?auto_81138 - BLOCK
      ?auto_81139 - BLOCK
      ?auto_81140 - BLOCK
      ?auto_81141 - BLOCK
      ?auto_81142 - BLOCK
      ?auto_81143 - BLOCK
      ?auto_81144 - BLOCK
      ?auto_81145 - BLOCK
    )
    :vars
    (
      ?auto_81146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81145 ?auto_81146 ) ( ON-TABLE ?auto_81137 ) ( ON ?auto_81138 ?auto_81137 ) ( ON ?auto_81139 ?auto_81138 ) ( ON ?auto_81140 ?auto_81139 ) ( ON ?auto_81141 ?auto_81140 ) ( ON ?auto_81142 ?auto_81141 ) ( not ( = ?auto_81137 ?auto_81138 ) ) ( not ( = ?auto_81137 ?auto_81139 ) ) ( not ( = ?auto_81137 ?auto_81140 ) ) ( not ( = ?auto_81137 ?auto_81141 ) ) ( not ( = ?auto_81137 ?auto_81142 ) ) ( not ( = ?auto_81137 ?auto_81143 ) ) ( not ( = ?auto_81137 ?auto_81144 ) ) ( not ( = ?auto_81137 ?auto_81145 ) ) ( not ( = ?auto_81137 ?auto_81146 ) ) ( not ( = ?auto_81138 ?auto_81139 ) ) ( not ( = ?auto_81138 ?auto_81140 ) ) ( not ( = ?auto_81138 ?auto_81141 ) ) ( not ( = ?auto_81138 ?auto_81142 ) ) ( not ( = ?auto_81138 ?auto_81143 ) ) ( not ( = ?auto_81138 ?auto_81144 ) ) ( not ( = ?auto_81138 ?auto_81145 ) ) ( not ( = ?auto_81138 ?auto_81146 ) ) ( not ( = ?auto_81139 ?auto_81140 ) ) ( not ( = ?auto_81139 ?auto_81141 ) ) ( not ( = ?auto_81139 ?auto_81142 ) ) ( not ( = ?auto_81139 ?auto_81143 ) ) ( not ( = ?auto_81139 ?auto_81144 ) ) ( not ( = ?auto_81139 ?auto_81145 ) ) ( not ( = ?auto_81139 ?auto_81146 ) ) ( not ( = ?auto_81140 ?auto_81141 ) ) ( not ( = ?auto_81140 ?auto_81142 ) ) ( not ( = ?auto_81140 ?auto_81143 ) ) ( not ( = ?auto_81140 ?auto_81144 ) ) ( not ( = ?auto_81140 ?auto_81145 ) ) ( not ( = ?auto_81140 ?auto_81146 ) ) ( not ( = ?auto_81141 ?auto_81142 ) ) ( not ( = ?auto_81141 ?auto_81143 ) ) ( not ( = ?auto_81141 ?auto_81144 ) ) ( not ( = ?auto_81141 ?auto_81145 ) ) ( not ( = ?auto_81141 ?auto_81146 ) ) ( not ( = ?auto_81142 ?auto_81143 ) ) ( not ( = ?auto_81142 ?auto_81144 ) ) ( not ( = ?auto_81142 ?auto_81145 ) ) ( not ( = ?auto_81142 ?auto_81146 ) ) ( not ( = ?auto_81143 ?auto_81144 ) ) ( not ( = ?auto_81143 ?auto_81145 ) ) ( not ( = ?auto_81143 ?auto_81146 ) ) ( not ( = ?auto_81144 ?auto_81145 ) ) ( not ( = ?auto_81144 ?auto_81146 ) ) ( not ( = ?auto_81145 ?auto_81146 ) ) ( ON ?auto_81144 ?auto_81145 ) ( CLEAR ?auto_81142 ) ( ON ?auto_81143 ?auto_81144 ) ( CLEAR ?auto_81143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81137 ?auto_81138 ?auto_81139 ?auto_81140 ?auto_81141 ?auto_81142 ?auto_81143 )
      ( MAKE-9PILE ?auto_81137 ?auto_81138 ?auto_81139 ?auto_81140 ?auto_81141 ?auto_81142 ?auto_81143 ?auto_81144 ?auto_81145 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81175 - BLOCK
      ?auto_81176 - BLOCK
      ?auto_81177 - BLOCK
      ?auto_81178 - BLOCK
      ?auto_81179 - BLOCK
      ?auto_81180 - BLOCK
      ?auto_81181 - BLOCK
      ?auto_81182 - BLOCK
      ?auto_81183 - BLOCK
    )
    :vars
    (
      ?auto_81184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81183 ?auto_81184 ) ( ON-TABLE ?auto_81175 ) ( ON ?auto_81176 ?auto_81175 ) ( ON ?auto_81177 ?auto_81176 ) ( ON ?auto_81178 ?auto_81177 ) ( ON ?auto_81179 ?auto_81178 ) ( not ( = ?auto_81175 ?auto_81176 ) ) ( not ( = ?auto_81175 ?auto_81177 ) ) ( not ( = ?auto_81175 ?auto_81178 ) ) ( not ( = ?auto_81175 ?auto_81179 ) ) ( not ( = ?auto_81175 ?auto_81180 ) ) ( not ( = ?auto_81175 ?auto_81181 ) ) ( not ( = ?auto_81175 ?auto_81182 ) ) ( not ( = ?auto_81175 ?auto_81183 ) ) ( not ( = ?auto_81175 ?auto_81184 ) ) ( not ( = ?auto_81176 ?auto_81177 ) ) ( not ( = ?auto_81176 ?auto_81178 ) ) ( not ( = ?auto_81176 ?auto_81179 ) ) ( not ( = ?auto_81176 ?auto_81180 ) ) ( not ( = ?auto_81176 ?auto_81181 ) ) ( not ( = ?auto_81176 ?auto_81182 ) ) ( not ( = ?auto_81176 ?auto_81183 ) ) ( not ( = ?auto_81176 ?auto_81184 ) ) ( not ( = ?auto_81177 ?auto_81178 ) ) ( not ( = ?auto_81177 ?auto_81179 ) ) ( not ( = ?auto_81177 ?auto_81180 ) ) ( not ( = ?auto_81177 ?auto_81181 ) ) ( not ( = ?auto_81177 ?auto_81182 ) ) ( not ( = ?auto_81177 ?auto_81183 ) ) ( not ( = ?auto_81177 ?auto_81184 ) ) ( not ( = ?auto_81178 ?auto_81179 ) ) ( not ( = ?auto_81178 ?auto_81180 ) ) ( not ( = ?auto_81178 ?auto_81181 ) ) ( not ( = ?auto_81178 ?auto_81182 ) ) ( not ( = ?auto_81178 ?auto_81183 ) ) ( not ( = ?auto_81178 ?auto_81184 ) ) ( not ( = ?auto_81179 ?auto_81180 ) ) ( not ( = ?auto_81179 ?auto_81181 ) ) ( not ( = ?auto_81179 ?auto_81182 ) ) ( not ( = ?auto_81179 ?auto_81183 ) ) ( not ( = ?auto_81179 ?auto_81184 ) ) ( not ( = ?auto_81180 ?auto_81181 ) ) ( not ( = ?auto_81180 ?auto_81182 ) ) ( not ( = ?auto_81180 ?auto_81183 ) ) ( not ( = ?auto_81180 ?auto_81184 ) ) ( not ( = ?auto_81181 ?auto_81182 ) ) ( not ( = ?auto_81181 ?auto_81183 ) ) ( not ( = ?auto_81181 ?auto_81184 ) ) ( not ( = ?auto_81182 ?auto_81183 ) ) ( not ( = ?auto_81182 ?auto_81184 ) ) ( not ( = ?auto_81183 ?auto_81184 ) ) ( ON ?auto_81182 ?auto_81183 ) ( ON ?auto_81181 ?auto_81182 ) ( CLEAR ?auto_81179 ) ( ON ?auto_81180 ?auto_81181 ) ( CLEAR ?auto_81180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81175 ?auto_81176 ?auto_81177 ?auto_81178 ?auto_81179 ?auto_81180 )
      ( MAKE-9PILE ?auto_81175 ?auto_81176 ?auto_81177 ?auto_81178 ?auto_81179 ?auto_81180 ?auto_81181 ?auto_81182 ?auto_81183 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81213 - BLOCK
      ?auto_81214 - BLOCK
      ?auto_81215 - BLOCK
      ?auto_81216 - BLOCK
      ?auto_81217 - BLOCK
      ?auto_81218 - BLOCK
      ?auto_81219 - BLOCK
      ?auto_81220 - BLOCK
      ?auto_81221 - BLOCK
    )
    :vars
    (
      ?auto_81222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81221 ?auto_81222 ) ( ON-TABLE ?auto_81213 ) ( ON ?auto_81214 ?auto_81213 ) ( ON ?auto_81215 ?auto_81214 ) ( ON ?auto_81216 ?auto_81215 ) ( not ( = ?auto_81213 ?auto_81214 ) ) ( not ( = ?auto_81213 ?auto_81215 ) ) ( not ( = ?auto_81213 ?auto_81216 ) ) ( not ( = ?auto_81213 ?auto_81217 ) ) ( not ( = ?auto_81213 ?auto_81218 ) ) ( not ( = ?auto_81213 ?auto_81219 ) ) ( not ( = ?auto_81213 ?auto_81220 ) ) ( not ( = ?auto_81213 ?auto_81221 ) ) ( not ( = ?auto_81213 ?auto_81222 ) ) ( not ( = ?auto_81214 ?auto_81215 ) ) ( not ( = ?auto_81214 ?auto_81216 ) ) ( not ( = ?auto_81214 ?auto_81217 ) ) ( not ( = ?auto_81214 ?auto_81218 ) ) ( not ( = ?auto_81214 ?auto_81219 ) ) ( not ( = ?auto_81214 ?auto_81220 ) ) ( not ( = ?auto_81214 ?auto_81221 ) ) ( not ( = ?auto_81214 ?auto_81222 ) ) ( not ( = ?auto_81215 ?auto_81216 ) ) ( not ( = ?auto_81215 ?auto_81217 ) ) ( not ( = ?auto_81215 ?auto_81218 ) ) ( not ( = ?auto_81215 ?auto_81219 ) ) ( not ( = ?auto_81215 ?auto_81220 ) ) ( not ( = ?auto_81215 ?auto_81221 ) ) ( not ( = ?auto_81215 ?auto_81222 ) ) ( not ( = ?auto_81216 ?auto_81217 ) ) ( not ( = ?auto_81216 ?auto_81218 ) ) ( not ( = ?auto_81216 ?auto_81219 ) ) ( not ( = ?auto_81216 ?auto_81220 ) ) ( not ( = ?auto_81216 ?auto_81221 ) ) ( not ( = ?auto_81216 ?auto_81222 ) ) ( not ( = ?auto_81217 ?auto_81218 ) ) ( not ( = ?auto_81217 ?auto_81219 ) ) ( not ( = ?auto_81217 ?auto_81220 ) ) ( not ( = ?auto_81217 ?auto_81221 ) ) ( not ( = ?auto_81217 ?auto_81222 ) ) ( not ( = ?auto_81218 ?auto_81219 ) ) ( not ( = ?auto_81218 ?auto_81220 ) ) ( not ( = ?auto_81218 ?auto_81221 ) ) ( not ( = ?auto_81218 ?auto_81222 ) ) ( not ( = ?auto_81219 ?auto_81220 ) ) ( not ( = ?auto_81219 ?auto_81221 ) ) ( not ( = ?auto_81219 ?auto_81222 ) ) ( not ( = ?auto_81220 ?auto_81221 ) ) ( not ( = ?auto_81220 ?auto_81222 ) ) ( not ( = ?auto_81221 ?auto_81222 ) ) ( ON ?auto_81220 ?auto_81221 ) ( ON ?auto_81219 ?auto_81220 ) ( ON ?auto_81218 ?auto_81219 ) ( CLEAR ?auto_81216 ) ( ON ?auto_81217 ?auto_81218 ) ( CLEAR ?auto_81217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81213 ?auto_81214 ?auto_81215 ?auto_81216 ?auto_81217 )
      ( MAKE-9PILE ?auto_81213 ?auto_81214 ?auto_81215 ?auto_81216 ?auto_81217 ?auto_81218 ?auto_81219 ?auto_81220 ?auto_81221 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81251 - BLOCK
      ?auto_81252 - BLOCK
      ?auto_81253 - BLOCK
      ?auto_81254 - BLOCK
      ?auto_81255 - BLOCK
      ?auto_81256 - BLOCK
      ?auto_81257 - BLOCK
      ?auto_81258 - BLOCK
      ?auto_81259 - BLOCK
    )
    :vars
    (
      ?auto_81260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81259 ?auto_81260 ) ( ON-TABLE ?auto_81251 ) ( ON ?auto_81252 ?auto_81251 ) ( ON ?auto_81253 ?auto_81252 ) ( not ( = ?auto_81251 ?auto_81252 ) ) ( not ( = ?auto_81251 ?auto_81253 ) ) ( not ( = ?auto_81251 ?auto_81254 ) ) ( not ( = ?auto_81251 ?auto_81255 ) ) ( not ( = ?auto_81251 ?auto_81256 ) ) ( not ( = ?auto_81251 ?auto_81257 ) ) ( not ( = ?auto_81251 ?auto_81258 ) ) ( not ( = ?auto_81251 ?auto_81259 ) ) ( not ( = ?auto_81251 ?auto_81260 ) ) ( not ( = ?auto_81252 ?auto_81253 ) ) ( not ( = ?auto_81252 ?auto_81254 ) ) ( not ( = ?auto_81252 ?auto_81255 ) ) ( not ( = ?auto_81252 ?auto_81256 ) ) ( not ( = ?auto_81252 ?auto_81257 ) ) ( not ( = ?auto_81252 ?auto_81258 ) ) ( not ( = ?auto_81252 ?auto_81259 ) ) ( not ( = ?auto_81252 ?auto_81260 ) ) ( not ( = ?auto_81253 ?auto_81254 ) ) ( not ( = ?auto_81253 ?auto_81255 ) ) ( not ( = ?auto_81253 ?auto_81256 ) ) ( not ( = ?auto_81253 ?auto_81257 ) ) ( not ( = ?auto_81253 ?auto_81258 ) ) ( not ( = ?auto_81253 ?auto_81259 ) ) ( not ( = ?auto_81253 ?auto_81260 ) ) ( not ( = ?auto_81254 ?auto_81255 ) ) ( not ( = ?auto_81254 ?auto_81256 ) ) ( not ( = ?auto_81254 ?auto_81257 ) ) ( not ( = ?auto_81254 ?auto_81258 ) ) ( not ( = ?auto_81254 ?auto_81259 ) ) ( not ( = ?auto_81254 ?auto_81260 ) ) ( not ( = ?auto_81255 ?auto_81256 ) ) ( not ( = ?auto_81255 ?auto_81257 ) ) ( not ( = ?auto_81255 ?auto_81258 ) ) ( not ( = ?auto_81255 ?auto_81259 ) ) ( not ( = ?auto_81255 ?auto_81260 ) ) ( not ( = ?auto_81256 ?auto_81257 ) ) ( not ( = ?auto_81256 ?auto_81258 ) ) ( not ( = ?auto_81256 ?auto_81259 ) ) ( not ( = ?auto_81256 ?auto_81260 ) ) ( not ( = ?auto_81257 ?auto_81258 ) ) ( not ( = ?auto_81257 ?auto_81259 ) ) ( not ( = ?auto_81257 ?auto_81260 ) ) ( not ( = ?auto_81258 ?auto_81259 ) ) ( not ( = ?auto_81258 ?auto_81260 ) ) ( not ( = ?auto_81259 ?auto_81260 ) ) ( ON ?auto_81258 ?auto_81259 ) ( ON ?auto_81257 ?auto_81258 ) ( ON ?auto_81256 ?auto_81257 ) ( ON ?auto_81255 ?auto_81256 ) ( CLEAR ?auto_81253 ) ( ON ?auto_81254 ?auto_81255 ) ( CLEAR ?auto_81254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81251 ?auto_81252 ?auto_81253 ?auto_81254 )
      ( MAKE-9PILE ?auto_81251 ?auto_81252 ?auto_81253 ?auto_81254 ?auto_81255 ?auto_81256 ?auto_81257 ?auto_81258 ?auto_81259 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81289 - BLOCK
      ?auto_81290 - BLOCK
      ?auto_81291 - BLOCK
      ?auto_81292 - BLOCK
      ?auto_81293 - BLOCK
      ?auto_81294 - BLOCK
      ?auto_81295 - BLOCK
      ?auto_81296 - BLOCK
      ?auto_81297 - BLOCK
    )
    :vars
    (
      ?auto_81298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81297 ?auto_81298 ) ( ON-TABLE ?auto_81289 ) ( ON ?auto_81290 ?auto_81289 ) ( not ( = ?auto_81289 ?auto_81290 ) ) ( not ( = ?auto_81289 ?auto_81291 ) ) ( not ( = ?auto_81289 ?auto_81292 ) ) ( not ( = ?auto_81289 ?auto_81293 ) ) ( not ( = ?auto_81289 ?auto_81294 ) ) ( not ( = ?auto_81289 ?auto_81295 ) ) ( not ( = ?auto_81289 ?auto_81296 ) ) ( not ( = ?auto_81289 ?auto_81297 ) ) ( not ( = ?auto_81289 ?auto_81298 ) ) ( not ( = ?auto_81290 ?auto_81291 ) ) ( not ( = ?auto_81290 ?auto_81292 ) ) ( not ( = ?auto_81290 ?auto_81293 ) ) ( not ( = ?auto_81290 ?auto_81294 ) ) ( not ( = ?auto_81290 ?auto_81295 ) ) ( not ( = ?auto_81290 ?auto_81296 ) ) ( not ( = ?auto_81290 ?auto_81297 ) ) ( not ( = ?auto_81290 ?auto_81298 ) ) ( not ( = ?auto_81291 ?auto_81292 ) ) ( not ( = ?auto_81291 ?auto_81293 ) ) ( not ( = ?auto_81291 ?auto_81294 ) ) ( not ( = ?auto_81291 ?auto_81295 ) ) ( not ( = ?auto_81291 ?auto_81296 ) ) ( not ( = ?auto_81291 ?auto_81297 ) ) ( not ( = ?auto_81291 ?auto_81298 ) ) ( not ( = ?auto_81292 ?auto_81293 ) ) ( not ( = ?auto_81292 ?auto_81294 ) ) ( not ( = ?auto_81292 ?auto_81295 ) ) ( not ( = ?auto_81292 ?auto_81296 ) ) ( not ( = ?auto_81292 ?auto_81297 ) ) ( not ( = ?auto_81292 ?auto_81298 ) ) ( not ( = ?auto_81293 ?auto_81294 ) ) ( not ( = ?auto_81293 ?auto_81295 ) ) ( not ( = ?auto_81293 ?auto_81296 ) ) ( not ( = ?auto_81293 ?auto_81297 ) ) ( not ( = ?auto_81293 ?auto_81298 ) ) ( not ( = ?auto_81294 ?auto_81295 ) ) ( not ( = ?auto_81294 ?auto_81296 ) ) ( not ( = ?auto_81294 ?auto_81297 ) ) ( not ( = ?auto_81294 ?auto_81298 ) ) ( not ( = ?auto_81295 ?auto_81296 ) ) ( not ( = ?auto_81295 ?auto_81297 ) ) ( not ( = ?auto_81295 ?auto_81298 ) ) ( not ( = ?auto_81296 ?auto_81297 ) ) ( not ( = ?auto_81296 ?auto_81298 ) ) ( not ( = ?auto_81297 ?auto_81298 ) ) ( ON ?auto_81296 ?auto_81297 ) ( ON ?auto_81295 ?auto_81296 ) ( ON ?auto_81294 ?auto_81295 ) ( ON ?auto_81293 ?auto_81294 ) ( ON ?auto_81292 ?auto_81293 ) ( CLEAR ?auto_81290 ) ( ON ?auto_81291 ?auto_81292 ) ( CLEAR ?auto_81291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81289 ?auto_81290 ?auto_81291 )
      ( MAKE-9PILE ?auto_81289 ?auto_81290 ?auto_81291 ?auto_81292 ?auto_81293 ?auto_81294 ?auto_81295 ?auto_81296 ?auto_81297 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81327 - BLOCK
      ?auto_81328 - BLOCK
      ?auto_81329 - BLOCK
      ?auto_81330 - BLOCK
      ?auto_81331 - BLOCK
      ?auto_81332 - BLOCK
      ?auto_81333 - BLOCK
      ?auto_81334 - BLOCK
      ?auto_81335 - BLOCK
    )
    :vars
    (
      ?auto_81336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81335 ?auto_81336 ) ( ON-TABLE ?auto_81327 ) ( not ( = ?auto_81327 ?auto_81328 ) ) ( not ( = ?auto_81327 ?auto_81329 ) ) ( not ( = ?auto_81327 ?auto_81330 ) ) ( not ( = ?auto_81327 ?auto_81331 ) ) ( not ( = ?auto_81327 ?auto_81332 ) ) ( not ( = ?auto_81327 ?auto_81333 ) ) ( not ( = ?auto_81327 ?auto_81334 ) ) ( not ( = ?auto_81327 ?auto_81335 ) ) ( not ( = ?auto_81327 ?auto_81336 ) ) ( not ( = ?auto_81328 ?auto_81329 ) ) ( not ( = ?auto_81328 ?auto_81330 ) ) ( not ( = ?auto_81328 ?auto_81331 ) ) ( not ( = ?auto_81328 ?auto_81332 ) ) ( not ( = ?auto_81328 ?auto_81333 ) ) ( not ( = ?auto_81328 ?auto_81334 ) ) ( not ( = ?auto_81328 ?auto_81335 ) ) ( not ( = ?auto_81328 ?auto_81336 ) ) ( not ( = ?auto_81329 ?auto_81330 ) ) ( not ( = ?auto_81329 ?auto_81331 ) ) ( not ( = ?auto_81329 ?auto_81332 ) ) ( not ( = ?auto_81329 ?auto_81333 ) ) ( not ( = ?auto_81329 ?auto_81334 ) ) ( not ( = ?auto_81329 ?auto_81335 ) ) ( not ( = ?auto_81329 ?auto_81336 ) ) ( not ( = ?auto_81330 ?auto_81331 ) ) ( not ( = ?auto_81330 ?auto_81332 ) ) ( not ( = ?auto_81330 ?auto_81333 ) ) ( not ( = ?auto_81330 ?auto_81334 ) ) ( not ( = ?auto_81330 ?auto_81335 ) ) ( not ( = ?auto_81330 ?auto_81336 ) ) ( not ( = ?auto_81331 ?auto_81332 ) ) ( not ( = ?auto_81331 ?auto_81333 ) ) ( not ( = ?auto_81331 ?auto_81334 ) ) ( not ( = ?auto_81331 ?auto_81335 ) ) ( not ( = ?auto_81331 ?auto_81336 ) ) ( not ( = ?auto_81332 ?auto_81333 ) ) ( not ( = ?auto_81332 ?auto_81334 ) ) ( not ( = ?auto_81332 ?auto_81335 ) ) ( not ( = ?auto_81332 ?auto_81336 ) ) ( not ( = ?auto_81333 ?auto_81334 ) ) ( not ( = ?auto_81333 ?auto_81335 ) ) ( not ( = ?auto_81333 ?auto_81336 ) ) ( not ( = ?auto_81334 ?auto_81335 ) ) ( not ( = ?auto_81334 ?auto_81336 ) ) ( not ( = ?auto_81335 ?auto_81336 ) ) ( ON ?auto_81334 ?auto_81335 ) ( ON ?auto_81333 ?auto_81334 ) ( ON ?auto_81332 ?auto_81333 ) ( ON ?auto_81331 ?auto_81332 ) ( ON ?auto_81330 ?auto_81331 ) ( ON ?auto_81329 ?auto_81330 ) ( CLEAR ?auto_81327 ) ( ON ?auto_81328 ?auto_81329 ) ( CLEAR ?auto_81328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81327 ?auto_81328 )
      ( MAKE-9PILE ?auto_81327 ?auto_81328 ?auto_81329 ?auto_81330 ?auto_81331 ?auto_81332 ?auto_81333 ?auto_81334 ?auto_81335 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_81365 - BLOCK
      ?auto_81366 - BLOCK
      ?auto_81367 - BLOCK
      ?auto_81368 - BLOCK
      ?auto_81369 - BLOCK
      ?auto_81370 - BLOCK
      ?auto_81371 - BLOCK
      ?auto_81372 - BLOCK
      ?auto_81373 - BLOCK
    )
    :vars
    (
      ?auto_81374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81373 ?auto_81374 ) ( not ( = ?auto_81365 ?auto_81366 ) ) ( not ( = ?auto_81365 ?auto_81367 ) ) ( not ( = ?auto_81365 ?auto_81368 ) ) ( not ( = ?auto_81365 ?auto_81369 ) ) ( not ( = ?auto_81365 ?auto_81370 ) ) ( not ( = ?auto_81365 ?auto_81371 ) ) ( not ( = ?auto_81365 ?auto_81372 ) ) ( not ( = ?auto_81365 ?auto_81373 ) ) ( not ( = ?auto_81365 ?auto_81374 ) ) ( not ( = ?auto_81366 ?auto_81367 ) ) ( not ( = ?auto_81366 ?auto_81368 ) ) ( not ( = ?auto_81366 ?auto_81369 ) ) ( not ( = ?auto_81366 ?auto_81370 ) ) ( not ( = ?auto_81366 ?auto_81371 ) ) ( not ( = ?auto_81366 ?auto_81372 ) ) ( not ( = ?auto_81366 ?auto_81373 ) ) ( not ( = ?auto_81366 ?auto_81374 ) ) ( not ( = ?auto_81367 ?auto_81368 ) ) ( not ( = ?auto_81367 ?auto_81369 ) ) ( not ( = ?auto_81367 ?auto_81370 ) ) ( not ( = ?auto_81367 ?auto_81371 ) ) ( not ( = ?auto_81367 ?auto_81372 ) ) ( not ( = ?auto_81367 ?auto_81373 ) ) ( not ( = ?auto_81367 ?auto_81374 ) ) ( not ( = ?auto_81368 ?auto_81369 ) ) ( not ( = ?auto_81368 ?auto_81370 ) ) ( not ( = ?auto_81368 ?auto_81371 ) ) ( not ( = ?auto_81368 ?auto_81372 ) ) ( not ( = ?auto_81368 ?auto_81373 ) ) ( not ( = ?auto_81368 ?auto_81374 ) ) ( not ( = ?auto_81369 ?auto_81370 ) ) ( not ( = ?auto_81369 ?auto_81371 ) ) ( not ( = ?auto_81369 ?auto_81372 ) ) ( not ( = ?auto_81369 ?auto_81373 ) ) ( not ( = ?auto_81369 ?auto_81374 ) ) ( not ( = ?auto_81370 ?auto_81371 ) ) ( not ( = ?auto_81370 ?auto_81372 ) ) ( not ( = ?auto_81370 ?auto_81373 ) ) ( not ( = ?auto_81370 ?auto_81374 ) ) ( not ( = ?auto_81371 ?auto_81372 ) ) ( not ( = ?auto_81371 ?auto_81373 ) ) ( not ( = ?auto_81371 ?auto_81374 ) ) ( not ( = ?auto_81372 ?auto_81373 ) ) ( not ( = ?auto_81372 ?auto_81374 ) ) ( not ( = ?auto_81373 ?auto_81374 ) ) ( ON ?auto_81372 ?auto_81373 ) ( ON ?auto_81371 ?auto_81372 ) ( ON ?auto_81370 ?auto_81371 ) ( ON ?auto_81369 ?auto_81370 ) ( ON ?auto_81368 ?auto_81369 ) ( ON ?auto_81367 ?auto_81368 ) ( ON ?auto_81366 ?auto_81367 ) ( ON ?auto_81365 ?auto_81366 ) ( CLEAR ?auto_81365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81365 )
      ( MAKE-9PILE ?auto_81365 ?auto_81366 ?auto_81367 ?auto_81368 ?auto_81369 ?auto_81370 ?auto_81371 ?auto_81372 ?auto_81373 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81404 - BLOCK
      ?auto_81405 - BLOCK
      ?auto_81406 - BLOCK
      ?auto_81407 - BLOCK
      ?auto_81408 - BLOCK
      ?auto_81409 - BLOCK
      ?auto_81410 - BLOCK
      ?auto_81411 - BLOCK
      ?auto_81412 - BLOCK
      ?auto_81413 - BLOCK
    )
    :vars
    (
      ?auto_81414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81412 ) ( ON ?auto_81413 ?auto_81414 ) ( CLEAR ?auto_81413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81404 ) ( ON ?auto_81405 ?auto_81404 ) ( ON ?auto_81406 ?auto_81405 ) ( ON ?auto_81407 ?auto_81406 ) ( ON ?auto_81408 ?auto_81407 ) ( ON ?auto_81409 ?auto_81408 ) ( ON ?auto_81410 ?auto_81409 ) ( ON ?auto_81411 ?auto_81410 ) ( ON ?auto_81412 ?auto_81411 ) ( not ( = ?auto_81404 ?auto_81405 ) ) ( not ( = ?auto_81404 ?auto_81406 ) ) ( not ( = ?auto_81404 ?auto_81407 ) ) ( not ( = ?auto_81404 ?auto_81408 ) ) ( not ( = ?auto_81404 ?auto_81409 ) ) ( not ( = ?auto_81404 ?auto_81410 ) ) ( not ( = ?auto_81404 ?auto_81411 ) ) ( not ( = ?auto_81404 ?auto_81412 ) ) ( not ( = ?auto_81404 ?auto_81413 ) ) ( not ( = ?auto_81404 ?auto_81414 ) ) ( not ( = ?auto_81405 ?auto_81406 ) ) ( not ( = ?auto_81405 ?auto_81407 ) ) ( not ( = ?auto_81405 ?auto_81408 ) ) ( not ( = ?auto_81405 ?auto_81409 ) ) ( not ( = ?auto_81405 ?auto_81410 ) ) ( not ( = ?auto_81405 ?auto_81411 ) ) ( not ( = ?auto_81405 ?auto_81412 ) ) ( not ( = ?auto_81405 ?auto_81413 ) ) ( not ( = ?auto_81405 ?auto_81414 ) ) ( not ( = ?auto_81406 ?auto_81407 ) ) ( not ( = ?auto_81406 ?auto_81408 ) ) ( not ( = ?auto_81406 ?auto_81409 ) ) ( not ( = ?auto_81406 ?auto_81410 ) ) ( not ( = ?auto_81406 ?auto_81411 ) ) ( not ( = ?auto_81406 ?auto_81412 ) ) ( not ( = ?auto_81406 ?auto_81413 ) ) ( not ( = ?auto_81406 ?auto_81414 ) ) ( not ( = ?auto_81407 ?auto_81408 ) ) ( not ( = ?auto_81407 ?auto_81409 ) ) ( not ( = ?auto_81407 ?auto_81410 ) ) ( not ( = ?auto_81407 ?auto_81411 ) ) ( not ( = ?auto_81407 ?auto_81412 ) ) ( not ( = ?auto_81407 ?auto_81413 ) ) ( not ( = ?auto_81407 ?auto_81414 ) ) ( not ( = ?auto_81408 ?auto_81409 ) ) ( not ( = ?auto_81408 ?auto_81410 ) ) ( not ( = ?auto_81408 ?auto_81411 ) ) ( not ( = ?auto_81408 ?auto_81412 ) ) ( not ( = ?auto_81408 ?auto_81413 ) ) ( not ( = ?auto_81408 ?auto_81414 ) ) ( not ( = ?auto_81409 ?auto_81410 ) ) ( not ( = ?auto_81409 ?auto_81411 ) ) ( not ( = ?auto_81409 ?auto_81412 ) ) ( not ( = ?auto_81409 ?auto_81413 ) ) ( not ( = ?auto_81409 ?auto_81414 ) ) ( not ( = ?auto_81410 ?auto_81411 ) ) ( not ( = ?auto_81410 ?auto_81412 ) ) ( not ( = ?auto_81410 ?auto_81413 ) ) ( not ( = ?auto_81410 ?auto_81414 ) ) ( not ( = ?auto_81411 ?auto_81412 ) ) ( not ( = ?auto_81411 ?auto_81413 ) ) ( not ( = ?auto_81411 ?auto_81414 ) ) ( not ( = ?auto_81412 ?auto_81413 ) ) ( not ( = ?auto_81412 ?auto_81414 ) ) ( not ( = ?auto_81413 ?auto_81414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81413 ?auto_81414 )
      ( !STACK ?auto_81413 ?auto_81412 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81425 - BLOCK
      ?auto_81426 - BLOCK
      ?auto_81427 - BLOCK
      ?auto_81428 - BLOCK
      ?auto_81429 - BLOCK
      ?auto_81430 - BLOCK
      ?auto_81431 - BLOCK
      ?auto_81432 - BLOCK
      ?auto_81433 - BLOCK
      ?auto_81434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81433 ) ( ON-TABLE ?auto_81434 ) ( CLEAR ?auto_81434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81425 ) ( ON ?auto_81426 ?auto_81425 ) ( ON ?auto_81427 ?auto_81426 ) ( ON ?auto_81428 ?auto_81427 ) ( ON ?auto_81429 ?auto_81428 ) ( ON ?auto_81430 ?auto_81429 ) ( ON ?auto_81431 ?auto_81430 ) ( ON ?auto_81432 ?auto_81431 ) ( ON ?auto_81433 ?auto_81432 ) ( not ( = ?auto_81425 ?auto_81426 ) ) ( not ( = ?auto_81425 ?auto_81427 ) ) ( not ( = ?auto_81425 ?auto_81428 ) ) ( not ( = ?auto_81425 ?auto_81429 ) ) ( not ( = ?auto_81425 ?auto_81430 ) ) ( not ( = ?auto_81425 ?auto_81431 ) ) ( not ( = ?auto_81425 ?auto_81432 ) ) ( not ( = ?auto_81425 ?auto_81433 ) ) ( not ( = ?auto_81425 ?auto_81434 ) ) ( not ( = ?auto_81426 ?auto_81427 ) ) ( not ( = ?auto_81426 ?auto_81428 ) ) ( not ( = ?auto_81426 ?auto_81429 ) ) ( not ( = ?auto_81426 ?auto_81430 ) ) ( not ( = ?auto_81426 ?auto_81431 ) ) ( not ( = ?auto_81426 ?auto_81432 ) ) ( not ( = ?auto_81426 ?auto_81433 ) ) ( not ( = ?auto_81426 ?auto_81434 ) ) ( not ( = ?auto_81427 ?auto_81428 ) ) ( not ( = ?auto_81427 ?auto_81429 ) ) ( not ( = ?auto_81427 ?auto_81430 ) ) ( not ( = ?auto_81427 ?auto_81431 ) ) ( not ( = ?auto_81427 ?auto_81432 ) ) ( not ( = ?auto_81427 ?auto_81433 ) ) ( not ( = ?auto_81427 ?auto_81434 ) ) ( not ( = ?auto_81428 ?auto_81429 ) ) ( not ( = ?auto_81428 ?auto_81430 ) ) ( not ( = ?auto_81428 ?auto_81431 ) ) ( not ( = ?auto_81428 ?auto_81432 ) ) ( not ( = ?auto_81428 ?auto_81433 ) ) ( not ( = ?auto_81428 ?auto_81434 ) ) ( not ( = ?auto_81429 ?auto_81430 ) ) ( not ( = ?auto_81429 ?auto_81431 ) ) ( not ( = ?auto_81429 ?auto_81432 ) ) ( not ( = ?auto_81429 ?auto_81433 ) ) ( not ( = ?auto_81429 ?auto_81434 ) ) ( not ( = ?auto_81430 ?auto_81431 ) ) ( not ( = ?auto_81430 ?auto_81432 ) ) ( not ( = ?auto_81430 ?auto_81433 ) ) ( not ( = ?auto_81430 ?auto_81434 ) ) ( not ( = ?auto_81431 ?auto_81432 ) ) ( not ( = ?auto_81431 ?auto_81433 ) ) ( not ( = ?auto_81431 ?auto_81434 ) ) ( not ( = ?auto_81432 ?auto_81433 ) ) ( not ( = ?auto_81432 ?auto_81434 ) ) ( not ( = ?auto_81433 ?auto_81434 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_81434 )
      ( !STACK ?auto_81434 ?auto_81433 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81445 - BLOCK
      ?auto_81446 - BLOCK
      ?auto_81447 - BLOCK
      ?auto_81448 - BLOCK
      ?auto_81449 - BLOCK
      ?auto_81450 - BLOCK
      ?auto_81451 - BLOCK
      ?auto_81452 - BLOCK
      ?auto_81453 - BLOCK
      ?auto_81454 - BLOCK
    )
    :vars
    (
      ?auto_81455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81454 ?auto_81455 ) ( ON-TABLE ?auto_81445 ) ( ON ?auto_81446 ?auto_81445 ) ( ON ?auto_81447 ?auto_81446 ) ( ON ?auto_81448 ?auto_81447 ) ( ON ?auto_81449 ?auto_81448 ) ( ON ?auto_81450 ?auto_81449 ) ( ON ?auto_81451 ?auto_81450 ) ( ON ?auto_81452 ?auto_81451 ) ( not ( = ?auto_81445 ?auto_81446 ) ) ( not ( = ?auto_81445 ?auto_81447 ) ) ( not ( = ?auto_81445 ?auto_81448 ) ) ( not ( = ?auto_81445 ?auto_81449 ) ) ( not ( = ?auto_81445 ?auto_81450 ) ) ( not ( = ?auto_81445 ?auto_81451 ) ) ( not ( = ?auto_81445 ?auto_81452 ) ) ( not ( = ?auto_81445 ?auto_81453 ) ) ( not ( = ?auto_81445 ?auto_81454 ) ) ( not ( = ?auto_81445 ?auto_81455 ) ) ( not ( = ?auto_81446 ?auto_81447 ) ) ( not ( = ?auto_81446 ?auto_81448 ) ) ( not ( = ?auto_81446 ?auto_81449 ) ) ( not ( = ?auto_81446 ?auto_81450 ) ) ( not ( = ?auto_81446 ?auto_81451 ) ) ( not ( = ?auto_81446 ?auto_81452 ) ) ( not ( = ?auto_81446 ?auto_81453 ) ) ( not ( = ?auto_81446 ?auto_81454 ) ) ( not ( = ?auto_81446 ?auto_81455 ) ) ( not ( = ?auto_81447 ?auto_81448 ) ) ( not ( = ?auto_81447 ?auto_81449 ) ) ( not ( = ?auto_81447 ?auto_81450 ) ) ( not ( = ?auto_81447 ?auto_81451 ) ) ( not ( = ?auto_81447 ?auto_81452 ) ) ( not ( = ?auto_81447 ?auto_81453 ) ) ( not ( = ?auto_81447 ?auto_81454 ) ) ( not ( = ?auto_81447 ?auto_81455 ) ) ( not ( = ?auto_81448 ?auto_81449 ) ) ( not ( = ?auto_81448 ?auto_81450 ) ) ( not ( = ?auto_81448 ?auto_81451 ) ) ( not ( = ?auto_81448 ?auto_81452 ) ) ( not ( = ?auto_81448 ?auto_81453 ) ) ( not ( = ?auto_81448 ?auto_81454 ) ) ( not ( = ?auto_81448 ?auto_81455 ) ) ( not ( = ?auto_81449 ?auto_81450 ) ) ( not ( = ?auto_81449 ?auto_81451 ) ) ( not ( = ?auto_81449 ?auto_81452 ) ) ( not ( = ?auto_81449 ?auto_81453 ) ) ( not ( = ?auto_81449 ?auto_81454 ) ) ( not ( = ?auto_81449 ?auto_81455 ) ) ( not ( = ?auto_81450 ?auto_81451 ) ) ( not ( = ?auto_81450 ?auto_81452 ) ) ( not ( = ?auto_81450 ?auto_81453 ) ) ( not ( = ?auto_81450 ?auto_81454 ) ) ( not ( = ?auto_81450 ?auto_81455 ) ) ( not ( = ?auto_81451 ?auto_81452 ) ) ( not ( = ?auto_81451 ?auto_81453 ) ) ( not ( = ?auto_81451 ?auto_81454 ) ) ( not ( = ?auto_81451 ?auto_81455 ) ) ( not ( = ?auto_81452 ?auto_81453 ) ) ( not ( = ?auto_81452 ?auto_81454 ) ) ( not ( = ?auto_81452 ?auto_81455 ) ) ( not ( = ?auto_81453 ?auto_81454 ) ) ( not ( = ?auto_81453 ?auto_81455 ) ) ( not ( = ?auto_81454 ?auto_81455 ) ) ( CLEAR ?auto_81452 ) ( ON ?auto_81453 ?auto_81454 ) ( CLEAR ?auto_81453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_81445 ?auto_81446 ?auto_81447 ?auto_81448 ?auto_81449 ?auto_81450 ?auto_81451 ?auto_81452 ?auto_81453 )
      ( MAKE-10PILE ?auto_81445 ?auto_81446 ?auto_81447 ?auto_81448 ?auto_81449 ?auto_81450 ?auto_81451 ?auto_81452 ?auto_81453 ?auto_81454 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81466 - BLOCK
      ?auto_81467 - BLOCK
      ?auto_81468 - BLOCK
      ?auto_81469 - BLOCK
      ?auto_81470 - BLOCK
      ?auto_81471 - BLOCK
      ?auto_81472 - BLOCK
      ?auto_81473 - BLOCK
      ?auto_81474 - BLOCK
      ?auto_81475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81475 ) ( ON-TABLE ?auto_81466 ) ( ON ?auto_81467 ?auto_81466 ) ( ON ?auto_81468 ?auto_81467 ) ( ON ?auto_81469 ?auto_81468 ) ( ON ?auto_81470 ?auto_81469 ) ( ON ?auto_81471 ?auto_81470 ) ( ON ?auto_81472 ?auto_81471 ) ( ON ?auto_81473 ?auto_81472 ) ( not ( = ?auto_81466 ?auto_81467 ) ) ( not ( = ?auto_81466 ?auto_81468 ) ) ( not ( = ?auto_81466 ?auto_81469 ) ) ( not ( = ?auto_81466 ?auto_81470 ) ) ( not ( = ?auto_81466 ?auto_81471 ) ) ( not ( = ?auto_81466 ?auto_81472 ) ) ( not ( = ?auto_81466 ?auto_81473 ) ) ( not ( = ?auto_81466 ?auto_81474 ) ) ( not ( = ?auto_81466 ?auto_81475 ) ) ( not ( = ?auto_81467 ?auto_81468 ) ) ( not ( = ?auto_81467 ?auto_81469 ) ) ( not ( = ?auto_81467 ?auto_81470 ) ) ( not ( = ?auto_81467 ?auto_81471 ) ) ( not ( = ?auto_81467 ?auto_81472 ) ) ( not ( = ?auto_81467 ?auto_81473 ) ) ( not ( = ?auto_81467 ?auto_81474 ) ) ( not ( = ?auto_81467 ?auto_81475 ) ) ( not ( = ?auto_81468 ?auto_81469 ) ) ( not ( = ?auto_81468 ?auto_81470 ) ) ( not ( = ?auto_81468 ?auto_81471 ) ) ( not ( = ?auto_81468 ?auto_81472 ) ) ( not ( = ?auto_81468 ?auto_81473 ) ) ( not ( = ?auto_81468 ?auto_81474 ) ) ( not ( = ?auto_81468 ?auto_81475 ) ) ( not ( = ?auto_81469 ?auto_81470 ) ) ( not ( = ?auto_81469 ?auto_81471 ) ) ( not ( = ?auto_81469 ?auto_81472 ) ) ( not ( = ?auto_81469 ?auto_81473 ) ) ( not ( = ?auto_81469 ?auto_81474 ) ) ( not ( = ?auto_81469 ?auto_81475 ) ) ( not ( = ?auto_81470 ?auto_81471 ) ) ( not ( = ?auto_81470 ?auto_81472 ) ) ( not ( = ?auto_81470 ?auto_81473 ) ) ( not ( = ?auto_81470 ?auto_81474 ) ) ( not ( = ?auto_81470 ?auto_81475 ) ) ( not ( = ?auto_81471 ?auto_81472 ) ) ( not ( = ?auto_81471 ?auto_81473 ) ) ( not ( = ?auto_81471 ?auto_81474 ) ) ( not ( = ?auto_81471 ?auto_81475 ) ) ( not ( = ?auto_81472 ?auto_81473 ) ) ( not ( = ?auto_81472 ?auto_81474 ) ) ( not ( = ?auto_81472 ?auto_81475 ) ) ( not ( = ?auto_81473 ?auto_81474 ) ) ( not ( = ?auto_81473 ?auto_81475 ) ) ( not ( = ?auto_81474 ?auto_81475 ) ) ( CLEAR ?auto_81473 ) ( ON ?auto_81474 ?auto_81475 ) ( CLEAR ?auto_81474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_81466 ?auto_81467 ?auto_81468 ?auto_81469 ?auto_81470 ?auto_81471 ?auto_81472 ?auto_81473 ?auto_81474 )
      ( MAKE-10PILE ?auto_81466 ?auto_81467 ?auto_81468 ?auto_81469 ?auto_81470 ?auto_81471 ?auto_81472 ?auto_81473 ?auto_81474 ?auto_81475 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81486 - BLOCK
      ?auto_81487 - BLOCK
      ?auto_81488 - BLOCK
      ?auto_81489 - BLOCK
      ?auto_81490 - BLOCK
      ?auto_81491 - BLOCK
      ?auto_81492 - BLOCK
      ?auto_81493 - BLOCK
      ?auto_81494 - BLOCK
      ?auto_81495 - BLOCK
    )
    :vars
    (
      ?auto_81496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81495 ?auto_81496 ) ( ON-TABLE ?auto_81486 ) ( ON ?auto_81487 ?auto_81486 ) ( ON ?auto_81488 ?auto_81487 ) ( ON ?auto_81489 ?auto_81488 ) ( ON ?auto_81490 ?auto_81489 ) ( ON ?auto_81491 ?auto_81490 ) ( ON ?auto_81492 ?auto_81491 ) ( not ( = ?auto_81486 ?auto_81487 ) ) ( not ( = ?auto_81486 ?auto_81488 ) ) ( not ( = ?auto_81486 ?auto_81489 ) ) ( not ( = ?auto_81486 ?auto_81490 ) ) ( not ( = ?auto_81486 ?auto_81491 ) ) ( not ( = ?auto_81486 ?auto_81492 ) ) ( not ( = ?auto_81486 ?auto_81493 ) ) ( not ( = ?auto_81486 ?auto_81494 ) ) ( not ( = ?auto_81486 ?auto_81495 ) ) ( not ( = ?auto_81486 ?auto_81496 ) ) ( not ( = ?auto_81487 ?auto_81488 ) ) ( not ( = ?auto_81487 ?auto_81489 ) ) ( not ( = ?auto_81487 ?auto_81490 ) ) ( not ( = ?auto_81487 ?auto_81491 ) ) ( not ( = ?auto_81487 ?auto_81492 ) ) ( not ( = ?auto_81487 ?auto_81493 ) ) ( not ( = ?auto_81487 ?auto_81494 ) ) ( not ( = ?auto_81487 ?auto_81495 ) ) ( not ( = ?auto_81487 ?auto_81496 ) ) ( not ( = ?auto_81488 ?auto_81489 ) ) ( not ( = ?auto_81488 ?auto_81490 ) ) ( not ( = ?auto_81488 ?auto_81491 ) ) ( not ( = ?auto_81488 ?auto_81492 ) ) ( not ( = ?auto_81488 ?auto_81493 ) ) ( not ( = ?auto_81488 ?auto_81494 ) ) ( not ( = ?auto_81488 ?auto_81495 ) ) ( not ( = ?auto_81488 ?auto_81496 ) ) ( not ( = ?auto_81489 ?auto_81490 ) ) ( not ( = ?auto_81489 ?auto_81491 ) ) ( not ( = ?auto_81489 ?auto_81492 ) ) ( not ( = ?auto_81489 ?auto_81493 ) ) ( not ( = ?auto_81489 ?auto_81494 ) ) ( not ( = ?auto_81489 ?auto_81495 ) ) ( not ( = ?auto_81489 ?auto_81496 ) ) ( not ( = ?auto_81490 ?auto_81491 ) ) ( not ( = ?auto_81490 ?auto_81492 ) ) ( not ( = ?auto_81490 ?auto_81493 ) ) ( not ( = ?auto_81490 ?auto_81494 ) ) ( not ( = ?auto_81490 ?auto_81495 ) ) ( not ( = ?auto_81490 ?auto_81496 ) ) ( not ( = ?auto_81491 ?auto_81492 ) ) ( not ( = ?auto_81491 ?auto_81493 ) ) ( not ( = ?auto_81491 ?auto_81494 ) ) ( not ( = ?auto_81491 ?auto_81495 ) ) ( not ( = ?auto_81491 ?auto_81496 ) ) ( not ( = ?auto_81492 ?auto_81493 ) ) ( not ( = ?auto_81492 ?auto_81494 ) ) ( not ( = ?auto_81492 ?auto_81495 ) ) ( not ( = ?auto_81492 ?auto_81496 ) ) ( not ( = ?auto_81493 ?auto_81494 ) ) ( not ( = ?auto_81493 ?auto_81495 ) ) ( not ( = ?auto_81493 ?auto_81496 ) ) ( not ( = ?auto_81494 ?auto_81495 ) ) ( not ( = ?auto_81494 ?auto_81496 ) ) ( not ( = ?auto_81495 ?auto_81496 ) ) ( ON ?auto_81494 ?auto_81495 ) ( CLEAR ?auto_81492 ) ( ON ?auto_81493 ?auto_81494 ) ( CLEAR ?auto_81493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_81486 ?auto_81487 ?auto_81488 ?auto_81489 ?auto_81490 ?auto_81491 ?auto_81492 ?auto_81493 )
      ( MAKE-10PILE ?auto_81486 ?auto_81487 ?auto_81488 ?auto_81489 ?auto_81490 ?auto_81491 ?auto_81492 ?auto_81493 ?auto_81494 ?auto_81495 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81507 - BLOCK
      ?auto_81508 - BLOCK
      ?auto_81509 - BLOCK
      ?auto_81510 - BLOCK
      ?auto_81511 - BLOCK
      ?auto_81512 - BLOCK
      ?auto_81513 - BLOCK
      ?auto_81514 - BLOCK
      ?auto_81515 - BLOCK
      ?auto_81516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81516 ) ( ON-TABLE ?auto_81507 ) ( ON ?auto_81508 ?auto_81507 ) ( ON ?auto_81509 ?auto_81508 ) ( ON ?auto_81510 ?auto_81509 ) ( ON ?auto_81511 ?auto_81510 ) ( ON ?auto_81512 ?auto_81511 ) ( ON ?auto_81513 ?auto_81512 ) ( not ( = ?auto_81507 ?auto_81508 ) ) ( not ( = ?auto_81507 ?auto_81509 ) ) ( not ( = ?auto_81507 ?auto_81510 ) ) ( not ( = ?auto_81507 ?auto_81511 ) ) ( not ( = ?auto_81507 ?auto_81512 ) ) ( not ( = ?auto_81507 ?auto_81513 ) ) ( not ( = ?auto_81507 ?auto_81514 ) ) ( not ( = ?auto_81507 ?auto_81515 ) ) ( not ( = ?auto_81507 ?auto_81516 ) ) ( not ( = ?auto_81508 ?auto_81509 ) ) ( not ( = ?auto_81508 ?auto_81510 ) ) ( not ( = ?auto_81508 ?auto_81511 ) ) ( not ( = ?auto_81508 ?auto_81512 ) ) ( not ( = ?auto_81508 ?auto_81513 ) ) ( not ( = ?auto_81508 ?auto_81514 ) ) ( not ( = ?auto_81508 ?auto_81515 ) ) ( not ( = ?auto_81508 ?auto_81516 ) ) ( not ( = ?auto_81509 ?auto_81510 ) ) ( not ( = ?auto_81509 ?auto_81511 ) ) ( not ( = ?auto_81509 ?auto_81512 ) ) ( not ( = ?auto_81509 ?auto_81513 ) ) ( not ( = ?auto_81509 ?auto_81514 ) ) ( not ( = ?auto_81509 ?auto_81515 ) ) ( not ( = ?auto_81509 ?auto_81516 ) ) ( not ( = ?auto_81510 ?auto_81511 ) ) ( not ( = ?auto_81510 ?auto_81512 ) ) ( not ( = ?auto_81510 ?auto_81513 ) ) ( not ( = ?auto_81510 ?auto_81514 ) ) ( not ( = ?auto_81510 ?auto_81515 ) ) ( not ( = ?auto_81510 ?auto_81516 ) ) ( not ( = ?auto_81511 ?auto_81512 ) ) ( not ( = ?auto_81511 ?auto_81513 ) ) ( not ( = ?auto_81511 ?auto_81514 ) ) ( not ( = ?auto_81511 ?auto_81515 ) ) ( not ( = ?auto_81511 ?auto_81516 ) ) ( not ( = ?auto_81512 ?auto_81513 ) ) ( not ( = ?auto_81512 ?auto_81514 ) ) ( not ( = ?auto_81512 ?auto_81515 ) ) ( not ( = ?auto_81512 ?auto_81516 ) ) ( not ( = ?auto_81513 ?auto_81514 ) ) ( not ( = ?auto_81513 ?auto_81515 ) ) ( not ( = ?auto_81513 ?auto_81516 ) ) ( not ( = ?auto_81514 ?auto_81515 ) ) ( not ( = ?auto_81514 ?auto_81516 ) ) ( not ( = ?auto_81515 ?auto_81516 ) ) ( ON ?auto_81515 ?auto_81516 ) ( CLEAR ?auto_81513 ) ( ON ?auto_81514 ?auto_81515 ) ( CLEAR ?auto_81514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_81507 ?auto_81508 ?auto_81509 ?auto_81510 ?auto_81511 ?auto_81512 ?auto_81513 ?auto_81514 )
      ( MAKE-10PILE ?auto_81507 ?auto_81508 ?auto_81509 ?auto_81510 ?auto_81511 ?auto_81512 ?auto_81513 ?auto_81514 ?auto_81515 ?auto_81516 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81527 - BLOCK
      ?auto_81528 - BLOCK
      ?auto_81529 - BLOCK
      ?auto_81530 - BLOCK
      ?auto_81531 - BLOCK
      ?auto_81532 - BLOCK
      ?auto_81533 - BLOCK
      ?auto_81534 - BLOCK
      ?auto_81535 - BLOCK
      ?auto_81536 - BLOCK
    )
    :vars
    (
      ?auto_81537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81536 ?auto_81537 ) ( ON-TABLE ?auto_81527 ) ( ON ?auto_81528 ?auto_81527 ) ( ON ?auto_81529 ?auto_81528 ) ( ON ?auto_81530 ?auto_81529 ) ( ON ?auto_81531 ?auto_81530 ) ( ON ?auto_81532 ?auto_81531 ) ( not ( = ?auto_81527 ?auto_81528 ) ) ( not ( = ?auto_81527 ?auto_81529 ) ) ( not ( = ?auto_81527 ?auto_81530 ) ) ( not ( = ?auto_81527 ?auto_81531 ) ) ( not ( = ?auto_81527 ?auto_81532 ) ) ( not ( = ?auto_81527 ?auto_81533 ) ) ( not ( = ?auto_81527 ?auto_81534 ) ) ( not ( = ?auto_81527 ?auto_81535 ) ) ( not ( = ?auto_81527 ?auto_81536 ) ) ( not ( = ?auto_81527 ?auto_81537 ) ) ( not ( = ?auto_81528 ?auto_81529 ) ) ( not ( = ?auto_81528 ?auto_81530 ) ) ( not ( = ?auto_81528 ?auto_81531 ) ) ( not ( = ?auto_81528 ?auto_81532 ) ) ( not ( = ?auto_81528 ?auto_81533 ) ) ( not ( = ?auto_81528 ?auto_81534 ) ) ( not ( = ?auto_81528 ?auto_81535 ) ) ( not ( = ?auto_81528 ?auto_81536 ) ) ( not ( = ?auto_81528 ?auto_81537 ) ) ( not ( = ?auto_81529 ?auto_81530 ) ) ( not ( = ?auto_81529 ?auto_81531 ) ) ( not ( = ?auto_81529 ?auto_81532 ) ) ( not ( = ?auto_81529 ?auto_81533 ) ) ( not ( = ?auto_81529 ?auto_81534 ) ) ( not ( = ?auto_81529 ?auto_81535 ) ) ( not ( = ?auto_81529 ?auto_81536 ) ) ( not ( = ?auto_81529 ?auto_81537 ) ) ( not ( = ?auto_81530 ?auto_81531 ) ) ( not ( = ?auto_81530 ?auto_81532 ) ) ( not ( = ?auto_81530 ?auto_81533 ) ) ( not ( = ?auto_81530 ?auto_81534 ) ) ( not ( = ?auto_81530 ?auto_81535 ) ) ( not ( = ?auto_81530 ?auto_81536 ) ) ( not ( = ?auto_81530 ?auto_81537 ) ) ( not ( = ?auto_81531 ?auto_81532 ) ) ( not ( = ?auto_81531 ?auto_81533 ) ) ( not ( = ?auto_81531 ?auto_81534 ) ) ( not ( = ?auto_81531 ?auto_81535 ) ) ( not ( = ?auto_81531 ?auto_81536 ) ) ( not ( = ?auto_81531 ?auto_81537 ) ) ( not ( = ?auto_81532 ?auto_81533 ) ) ( not ( = ?auto_81532 ?auto_81534 ) ) ( not ( = ?auto_81532 ?auto_81535 ) ) ( not ( = ?auto_81532 ?auto_81536 ) ) ( not ( = ?auto_81532 ?auto_81537 ) ) ( not ( = ?auto_81533 ?auto_81534 ) ) ( not ( = ?auto_81533 ?auto_81535 ) ) ( not ( = ?auto_81533 ?auto_81536 ) ) ( not ( = ?auto_81533 ?auto_81537 ) ) ( not ( = ?auto_81534 ?auto_81535 ) ) ( not ( = ?auto_81534 ?auto_81536 ) ) ( not ( = ?auto_81534 ?auto_81537 ) ) ( not ( = ?auto_81535 ?auto_81536 ) ) ( not ( = ?auto_81535 ?auto_81537 ) ) ( not ( = ?auto_81536 ?auto_81537 ) ) ( ON ?auto_81535 ?auto_81536 ) ( ON ?auto_81534 ?auto_81535 ) ( CLEAR ?auto_81532 ) ( ON ?auto_81533 ?auto_81534 ) ( CLEAR ?auto_81533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81527 ?auto_81528 ?auto_81529 ?auto_81530 ?auto_81531 ?auto_81532 ?auto_81533 )
      ( MAKE-10PILE ?auto_81527 ?auto_81528 ?auto_81529 ?auto_81530 ?auto_81531 ?auto_81532 ?auto_81533 ?auto_81534 ?auto_81535 ?auto_81536 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81548 - BLOCK
      ?auto_81549 - BLOCK
      ?auto_81550 - BLOCK
      ?auto_81551 - BLOCK
      ?auto_81552 - BLOCK
      ?auto_81553 - BLOCK
      ?auto_81554 - BLOCK
      ?auto_81555 - BLOCK
      ?auto_81556 - BLOCK
      ?auto_81557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81557 ) ( ON-TABLE ?auto_81548 ) ( ON ?auto_81549 ?auto_81548 ) ( ON ?auto_81550 ?auto_81549 ) ( ON ?auto_81551 ?auto_81550 ) ( ON ?auto_81552 ?auto_81551 ) ( ON ?auto_81553 ?auto_81552 ) ( not ( = ?auto_81548 ?auto_81549 ) ) ( not ( = ?auto_81548 ?auto_81550 ) ) ( not ( = ?auto_81548 ?auto_81551 ) ) ( not ( = ?auto_81548 ?auto_81552 ) ) ( not ( = ?auto_81548 ?auto_81553 ) ) ( not ( = ?auto_81548 ?auto_81554 ) ) ( not ( = ?auto_81548 ?auto_81555 ) ) ( not ( = ?auto_81548 ?auto_81556 ) ) ( not ( = ?auto_81548 ?auto_81557 ) ) ( not ( = ?auto_81549 ?auto_81550 ) ) ( not ( = ?auto_81549 ?auto_81551 ) ) ( not ( = ?auto_81549 ?auto_81552 ) ) ( not ( = ?auto_81549 ?auto_81553 ) ) ( not ( = ?auto_81549 ?auto_81554 ) ) ( not ( = ?auto_81549 ?auto_81555 ) ) ( not ( = ?auto_81549 ?auto_81556 ) ) ( not ( = ?auto_81549 ?auto_81557 ) ) ( not ( = ?auto_81550 ?auto_81551 ) ) ( not ( = ?auto_81550 ?auto_81552 ) ) ( not ( = ?auto_81550 ?auto_81553 ) ) ( not ( = ?auto_81550 ?auto_81554 ) ) ( not ( = ?auto_81550 ?auto_81555 ) ) ( not ( = ?auto_81550 ?auto_81556 ) ) ( not ( = ?auto_81550 ?auto_81557 ) ) ( not ( = ?auto_81551 ?auto_81552 ) ) ( not ( = ?auto_81551 ?auto_81553 ) ) ( not ( = ?auto_81551 ?auto_81554 ) ) ( not ( = ?auto_81551 ?auto_81555 ) ) ( not ( = ?auto_81551 ?auto_81556 ) ) ( not ( = ?auto_81551 ?auto_81557 ) ) ( not ( = ?auto_81552 ?auto_81553 ) ) ( not ( = ?auto_81552 ?auto_81554 ) ) ( not ( = ?auto_81552 ?auto_81555 ) ) ( not ( = ?auto_81552 ?auto_81556 ) ) ( not ( = ?auto_81552 ?auto_81557 ) ) ( not ( = ?auto_81553 ?auto_81554 ) ) ( not ( = ?auto_81553 ?auto_81555 ) ) ( not ( = ?auto_81553 ?auto_81556 ) ) ( not ( = ?auto_81553 ?auto_81557 ) ) ( not ( = ?auto_81554 ?auto_81555 ) ) ( not ( = ?auto_81554 ?auto_81556 ) ) ( not ( = ?auto_81554 ?auto_81557 ) ) ( not ( = ?auto_81555 ?auto_81556 ) ) ( not ( = ?auto_81555 ?auto_81557 ) ) ( not ( = ?auto_81556 ?auto_81557 ) ) ( ON ?auto_81556 ?auto_81557 ) ( ON ?auto_81555 ?auto_81556 ) ( CLEAR ?auto_81553 ) ( ON ?auto_81554 ?auto_81555 ) ( CLEAR ?auto_81554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81548 ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 ?auto_81553 ?auto_81554 )
      ( MAKE-10PILE ?auto_81548 ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 ?auto_81553 ?auto_81554 ?auto_81555 ?auto_81556 ?auto_81557 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81568 - BLOCK
      ?auto_81569 - BLOCK
      ?auto_81570 - BLOCK
      ?auto_81571 - BLOCK
      ?auto_81572 - BLOCK
      ?auto_81573 - BLOCK
      ?auto_81574 - BLOCK
      ?auto_81575 - BLOCK
      ?auto_81576 - BLOCK
      ?auto_81577 - BLOCK
    )
    :vars
    (
      ?auto_81578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81577 ?auto_81578 ) ( ON-TABLE ?auto_81568 ) ( ON ?auto_81569 ?auto_81568 ) ( ON ?auto_81570 ?auto_81569 ) ( ON ?auto_81571 ?auto_81570 ) ( ON ?auto_81572 ?auto_81571 ) ( not ( = ?auto_81568 ?auto_81569 ) ) ( not ( = ?auto_81568 ?auto_81570 ) ) ( not ( = ?auto_81568 ?auto_81571 ) ) ( not ( = ?auto_81568 ?auto_81572 ) ) ( not ( = ?auto_81568 ?auto_81573 ) ) ( not ( = ?auto_81568 ?auto_81574 ) ) ( not ( = ?auto_81568 ?auto_81575 ) ) ( not ( = ?auto_81568 ?auto_81576 ) ) ( not ( = ?auto_81568 ?auto_81577 ) ) ( not ( = ?auto_81568 ?auto_81578 ) ) ( not ( = ?auto_81569 ?auto_81570 ) ) ( not ( = ?auto_81569 ?auto_81571 ) ) ( not ( = ?auto_81569 ?auto_81572 ) ) ( not ( = ?auto_81569 ?auto_81573 ) ) ( not ( = ?auto_81569 ?auto_81574 ) ) ( not ( = ?auto_81569 ?auto_81575 ) ) ( not ( = ?auto_81569 ?auto_81576 ) ) ( not ( = ?auto_81569 ?auto_81577 ) ) ( not ( = ?auto_81569 ?auto_81578 ) ) ( not ( = ?auto_81570 ?auto_81571 ) ) ( not ( = ?auto_81570 ?auto_81572 ) ) ( not ( = ?auto_81570 ?auto_81573 ) ) ( not ( = ?auto_81570 ?auto_81574 ) ) ( not ( = ?auto_81570 ?auto_81575 ) ) ( not ( = ?auto_81570 ?auto_81576 ) ) ( not ( = ?auto_81570 ?auto_81577 ) ) ( not ( = ?auto_81570 ?auto_81578 ) ) ( not ( = ?auto_81571 ?auto_81572 ) ) ( not ( = ?auto_81571 ?auto_81573 ) ) ( not ( = ?auto_81571 ?auto_81574 ) ) ( not ( = ?auto_81571 ?auto_81575 ) ) ( not ( = ?auto_81571 ?auto_81576 ) ) ( not ( = ?auto_81571 ?auto_81577 ) ) ( not ( = ?auto_81571 ?auto_81578 ) ) ( not ( = ?auto_81572 ?auto_81573 ) ) ( not ( = ?auto_81572 ?auto_81574 ) ) ( not ( = ?auto_81572 ?auto_81575 ) ) ( not ( = ?auto_81572 ?auto_81576 ) ) ( not ( = ?auto_81572 ?auto_81577 ) ) ( not ( = ?auto_81572 ?auto_81578 ) ) ( not ( = ?auto_81573 ?auto_81574 ) ) ( not ( = ?auto_81573 ?auto_81575 ) ) ( not ( = ?auto_81573 ?auto_81576 ) ) ( not ( = ?auto_81573 ?auto_81577 ) ) ( not ( = ?auto_81573 ?auto_81578 ) ) ( not ( = ?auto_81574 ?auto_81575 ) ) ( not ( = ?auto_81574 ?auto_81576 ) ) ( not ( = ?auto_81574 ?auto_81577 ) ) ( not ( = ?auto_81574 ?auto_81578 ) ) ( not ( = ?auto_81575 ?auto_81576 ) ) ( not ( = ?auto_81575 ?auto_81577 ) ) ( not ( = ?auto_81575 ?auto_81578 ) ) ( not ( = ?auto_81576 ?auto_81577 ) ) ( not ( = ?auto_81576 ?auto_81578 ) ) ( not ( = ?auto_81577 ?auto_81578 ) ) ( ON ?auto_81576 ?auto_81577 ) ( ON ?auto_81575 ?auto_81576 ) ( ON ?auto_81574 ?auto_81575 ) ( CLEAR ?auto_81572 ) ( ON ?auto_81573 ?auto_81574 ) ( CLEAR ?auto_81573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81568 ?auto_81569 ?auto_81570 ?auto_81571 ?auto_81572 ?auto_81573 )
      ( MAKE-10PILE ?auto_81568 ?auto_81569 ?auto_81570 ?auto_81571 ?auto_81572 ?auto_81573 ?auto_81574 ?auto_81575 ?auto_81576 ?auto_81577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81589 - BLOCK
      ?auto_81590 - BLOCK
      ?auto_81591 - BLOCK
      ?auto_81592 - BLOCK
      ?auto_81593 - BLOCK
      ?auto_81594 - BLOCK
      ?auto_81595 - BLOCK
      ?auto_81596 - BLOCK
      ?auto_81597 - BLOCK
      ?auto_81598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81598 ) ( ON-TABLE ?auto_81589 ) ( ON ?auto_81590 ?auto_81589 ) ( ON ?auto_81591 ?auto_81590 ) ( ON ?auto_81592 ?auto_81591 ) ( ON ?auto_81593 ?auto_81592 ) ( not ( = ?auto_81589 ?auto_81590 ) ) ( not ( = ?auto_81589 ?auto_81591 ) ) ( not ( = ?auto_81589 ?auto_81592 ) ) ( not ( = ?auto_81589 ?auto_81593 ) ) ( not ( = ?auto_81589 ?auto_81594 ) ) ( not ( = ?auto_81589 ?auto_81595 ) ) ( not ( = ?auto_81589 ?auto_81596 ) ) ( not ( = ?auto_81589 ?auto_81597 ) ) ( not ( = ?auto_81589 ?auto_81598 ) ) ( not ( = ?auto_81590 ?auto_81591 ) ) ( not ( = ?auto_81590 ?auto_81592 ) ) ( not ( = ?auto_81590 ?auto_81593 ) ) ( not ( = ?auto_81590 ?auto_81594 ) ) ( not ( = ?auto_81590 ?auto_81595 ) ) ( not ( = ?auto_81590 ?auto_81596 ) ) ( not ( = ?auto_81590 ?auto_81597 ) ) ( not ( = ?auto_81590 ?auto_81598 ) ) ( not ( = ?auto_81591 ?auto_81592 ) ) ( not ( = ?auto_81591 ?auto_81593 ) ) ( not ( = ?auto_81591 ?auto_81594 ) ) ( not ( = ?auto_81591 ?auto_81595 ) ) ( not ( = ?auto_81591 ?auto_81596 ) ) ( not ( = ?auto_81591 ?auto_81597 ) ) ( not ( = ?auto_81591 ?auto_81598 ) ) ( not ( = ?auto_81592 ?auto_81593 ) ) ( not ( = ?auto_81592 ?auto_81594 ) ) ( not ( = ?auto_81592 ?auto_81595 ) ) ( not ( = ?auto_81592 ?auto_81596 ) ) ( not ( = ?auto_81592 ?auto_81597 ) ) ( not ( = ?auto_81592 ?auto_81598 ) ) ( not ( = ?auto_81593 ?auto_81594 ) ) ( not ( = ?auto_81593 ?auto_81595 ) ) ( not ( = ?auto_81593 ?auto_81596 ) ) ( not ( = ?auto_81593 ?auto_81597 ) ) ( not ( = ?auto_81593 ?auto_81598 ) ) ( not ( = ?auto_81594 ?auto_81595 ) ) ( not ( = ?auto_81594 ?auto_81596 ) ) ( not ( = ?auto_81594 ?auto_81597 ) ) ( not ( = ?auto_81594 ?auto_81598 ) ) ( not ( = ?auto_81595 ?auto_81596 ) ) ( not ( = ?auto_81595 ?auto_81597 ) ) ( not ( = ?auto_81595 ?auto_81598 ) ) ( not ( = ?auto_81596 ?auto_81597 ) ) ( not ( = ?auto_81596 ?auto_81598 ) ) ( not ( = ?auto_81597 ?auto_81598 ) ) ( ON ?auto_81597 ?auto_81598 ) ( ON ?auto_81596 ?auto_81597 ) ( ON ?auto_81595 ?auto_81596 ) ( CLEAR ?auto_81593 ) ( ON ?auto_81594 ?auto_81595 ) ( CLEAR ?auto_81594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81589 ?auto_81590 ?auto_81591 ?auto_81592 ?auto_81593 ?auto_81594 )
      ( MAKE-10PILE ?auto_81589 ?auto_81590 ?auto_81591 ?auto_81592 ?auto_81593 ?auto_81594 ?auto_81595 ?auto_81596 ?auto_81597 ?auto_81598 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81609 - BLOCK
      ?auto_81610 - BLOCK
      ?auto_81611 - BLOCK
      ?auto_81612 - BLOCK
      ?auto_81613 - BLOCK
      ?auto_81614 - BLOCK
      ?auto_81615 - BLOCK
      ?auto_81616 - BLOCK
      ?auto_81617 - BLOCK
      ?auto_81618 - BLOCK
    )
    :vars
    (
      ?auto_81619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81618 ?auto_81619 ) ( ON-TABLE ?auto_81609 ) ( ON ?auto_81610 ?auto_81609 ) ( ON ?auto_81611 ?auto_81610 ) ( ON ?auto_81612 ?auto_81611 ) ( not ( = ?auto_81609 ?auto_81610 ) ) ( not ( = ?auto_81609 ?auto_81611 ) ) ( not ( = ?auto_81609 ?auto_81612 ) ) ( not ( = ?auto_81609 ?auto_81613 ) ) ( not ( = ?auto_81609 ?auto_81614 ) ) ( not ( = ?auto_81609 ?auto_81615 ) ) ( not ( = ?auto_81609 ?auto_81616 ) ) ( not ( = ?auto_81609 ?auto_81617 ) ) ( not ( = ?auto_81609 ?auto_81618 ) ) ( not ( = ?auto_81609 ?auto_81619 ) ) ( not ( = ?auto_81610 ?auto_81611 ) ) ( not ( = ?auto_81610 ?auto_81612 ) ) ( not ( = ?auto_81610 ?auto_81613 ) ) ( not ( = ?auto_81610 ?auto_81614 ) ) ( not ( = ?auto_81610 ?auto_81615 ) ) ( not ( = ?auto_81610 ?auto_81616 ) ) ( not ( = ?auto_81610 ?auto_81617 ) ) ( not ( = ?auto_81610 ?auto_81618 ) ) ( not ( = ?auto_81610 ?auto_81619 ) ) ( not ( = ?auto_81611 ?auto_81612 ) ) ( not ( = ?auto_81611 ?auto_81613 ) ) ( not ( = ?auto_81611 ?auto_81614 ) ) ( not ( = ?auto_81611 ?auto_81615 ) ) ( not ( = ?auto_81611 ?auto_81616 ) ) ( not ( = ?auto_81611 ?auto_81617 ) ) ( not ( = ?auto_81611 ?auto_81618 ) ) ( not ( = ?auto_81611 ?auto_81619 ) ) ( not ( = ?auto_81612 ?auto_81613 ) ) ( not ( = ?auto_81612 ?auto_81614 ) ) ( not ( = ?auto_81612 ?auto_81615 ) ) ( not ( = ?auto_81612 ?auto_81616 ) ) ( not ( = ?auto_81612 ?auto_81617 ) ) ( not ( = ?auto_81612 ?auto_81618 ) ) ( not ( = ?auto_81612 ?auto_81619 ) ) ( not ( = ?auto_81613 ?auto_81614 ) ) ( not ( = ?auto_81613 ?auto_81615 ) ) ( not ( = ?auto_81613 ?auto_81616 ) ) ( not ( = ?auto_81613 ?auto_81617 ) ) ( not ( = ?auto_81613 ?auto_81618 ) ) ( not ( = ?auto_81613 ?auto_81619 ) ) ( not ( = ?auto_81614 ?auto_81615 ) ) ( not ( = ?auto_81614 ?auto_81616 ) ) ( not ( = ?auto_81614 ?auto_81617 ) ) ( not ( = ?auto_81614 ?auto_81618 ) ) ( not ( = ?auto_81614 ?auto_81619 ) ) ( not ( = ?auto_81615 ?auto_81616 ) ) ( not ( = ?auto_81615 ?auto_81617 ) ) ( not ( = ?auto_81615 ?auto_81618 ) ) ( not ( = ?auto_81615 ?auto_81619 ) ) ( not ( = ?auto_81616 ?auto_81617 ) ) ( not ( = ?auto_81616 ?auto_81618 ) ) ( not ( = ?auto_81616 ?auto_81619 ) ) ( not ( = ?auto_81617 ?auto_81618 ) ) ( not ( = ?auto_81617 ?auto_81619 ) ) ( not ( = ?auto_81618 ?auto_81619 ) ) ( ON ?auto_81617 ?auto_81618 ) ( ON ?auto_81616 ?auto_81617 ) ( ON ?auto_81615 ?auto_81616 ) ( ON ?auto_81614 ?auto_81615 ) ( CLEAR ?auto_81612 ) ( ON ?auto_81613 ?auto_81614 ) ( CLEAR ?auto_81613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81609 ?auto_81610 ?auto_81611 ?auto_81612 ?auto_81613 )
      ( MAKE-10PILE ?auto_81609 ?auto_81610 ?auto_81611 ?auto_81612 ?auto_81613 ?auto_81614 ?auto_81615 ?auto_81616 ?auto_81617 ?auto_81618 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81630 - BLOCK
      ?auto_81631 - BLOCK
      ?auto_81632 - BLOCK
      ?auto_81633 - BLOCK
      ?auto_81634 - BLOCK
      ?auto_81635 - BLOCK
      ?auto_81636 - BLOCK
      ?auto_81637 - BLOCK
      ?auto_81638 - BLOCK
      ?auto_81639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81639 ) ( ON-TABLE ?auto_81630 ) ( ON ?auto_81631 ?auto_81630 ) ( ON ?auto_81632 ?auto_81631 ) ( ON ?auto_81633 ?auto_81632 ) ( not ( = ?auto_81630 ?auto_81631 ) ) ( not ( = ?auto_81630 ?auto_81632 ) ) ( not ( = ?auto_81630 ?auto_81633 ) ) ( not ( = ?auto_81630 ?auto_81634 ) ) ( not ( = ?auto_81630 ?auto_81635 ) ) ( not ( = ?auto_81630 ?auto_81636 ) ) ( not ( = ?auto_81630 ?auto_81637 ) ) ( not ( = ?auto_81630 ?auto_81638 ) ) ( not ( = ?auto_81630 ?auto_81639 ) ) ( not ( = ?auto_81631 ?auto_81632 ) ) ( not ( = ?auto_81631 ?auto_81633 ) ) ( not ( = ?auto_81631 ?auto_81634 ) ) ( not ( = ?auto_81631 ?auto_81635 ) ) ( not ( = ?auto_81631 ?auto_81636 ) ) ( not ( = ?auto_81631 ?auto_81637 ) ) ( not ( = ?auto_81631 ?auto_81638 ) ) ( not ( = ?auto_81631 ?auto_81639 ) ) ( not ( = ?auto_81632 ?auto_81633 ) ) ( not ( = ?auto_81632 ?auto_81634 ) ) ( not ( = ?auto_81632 ?auto_81635 ) ) ( not ( = ?auto_81632 ?auto_81636 ) ) ( not ( = ?auto_81632 ?auto_81637 ) ) ( not ( = ?auto_81632 ?auto_81638 ) ) ( not ( = ?auto_81632 ?auto_81639 ) ) ( not ( = ?auto_81633 ?auto_81634 ) ) ( not ( = ?auto_81633 ?auto_81635 ) ) ( not ( = ?auto_81633 ?auto_81636 ) ) ( not ( = ?auto_81633 ?auto_81637 ) ) ( not ( = ?auto_81633 ?auto_81638 ) ) ( not ( = ?auto_81633 ?auto_81639 ) ) ( not ( = ?auto_81634 ?auto_81635 ) ) ( not ( = ?auto_81634 ?auto_81636 ) ) ( not ( = ?auto_81634 ?auto_81637 ) ) ( not ( = ?auto_81634 ?auto_81638 ) ) ( not ( = ?auto_81634 ?auto_81639 ) ) ( not ( = ?auto_81635 ?auto_81636 ) ) ( not ( = ?auto_81635 ?auto_81637 ) ) ( not ( = ?auto_81635 ?auto_81638 ) ) ( not ( = ?auto_81635 ?auto_81639 ) ) ( not ( = ?auto_81636 ?auto_81637 ) ) ( not ( = ?auto_81636 ?auto_81638 ) ) ( not ( = ?auto_81636 ?auto_81639 ) ) ( not ( = ?auto_81637 ?auto_81638 ) ) ( not ( = ?auto_81637 ?auto_81639 ) ) ( not ( = ?auto_81638 ?auto_81639 ) ) ( ON ?auto_81638 ?auto_81639 ) ( ON ?auto_81637 ?auto_81638 ) ( ON ?auto_81636 ?auto_81637 ) ( ON ?auto_81635 ?auto_81636 ) ( CLEAR ?auto_81633 ) ( ON ?auto_81634 ?auto_81635 ) ( CLEAR ?auto_81634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81630 ?auto_81631 ?auto_81632 ?auto_81633 ?auto_81634 )
      ( MAKE-10PILE ?auto_81630 ?auto_81631 ?auto_81632 ?auto_81633 ?auto_81634 ?auto_81635 ?auto_81636 ?auto_81637 ?auto_81638 ?auto_81639 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81650 - BLOCK
      ?auto_81651 - BLOCK
      ?auto_81652 - BLOCK
      ?auto_81653 - BLOCK
      ?auto_81654 - BLOCK
      ?auto_81655 - BLOCK
      ?auto_81656 - BLOCK
      ?auto_81657 - BLOCK
      ?auto_81658 - BLOCK
      ?auto_81659 - BLOCK
    )
    :vars
    (
      ?auto_81660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81659 ?auto_81660 ) ( ON-TABLE ?auto_81650 ) ( ON ?auto_81651 ?auto_81650 ) ( ON ?auto_81652 ?auto_81651 ) ( not ( = ?auto_81650 ?auto_81651 ) ) ( not ( = ?auto_81650 ?auto_81652 ) ) ( not ( = ?auto_81650 ?auto_81653 ) ) ( not ( = ?auto_81650 ?auto_81654 ) ) ( not ( = ?auto_81650 ?auto_81655 ) ) ( not ( = ?auto_81650 ?auto_81656 ) ) ( not ( = ?auto_81650 ?auto_81657 ) ) ( not ( = ?auto_81650 ?auto_81658 ) ) ( not ( = ?auto_81650 ?auto_81659 ) ) ( not ( = ?auto_81650 ?auto_81660 ) ) ( not ( = ?auto_81651 ?auto_81652 ) ) ( not ( = ?auto_81651 ?auto_81653 ) ) ( not ( = ?auto_81651 ?auto_81654 ) ) ( not ( = ?auto_81651 ?auto_81655 ) ) ( not ( = ?auto_81651 ?auto_81656 ) ) ( not ( = ?auto_81651 ?auto_81657 ) ) ( not ( = ?auto_81651 ?auto_81658 ) ) ( not ( = ?auto_81651 ?auto_81659 ) ) ( not ( = ?auto_81651 ?auto_81660 ) ) ( not ( = ?auto_81652 ?auto_81653 ) ) ( not ( = ?auto_81652 ?auto_81654 ) ) ( not ( = ?auto_81652 ?auto_81655 ) ) ( not ( = ?auto_81652 ?auto_81656 ) ) ( not ( = ?auto_81652 ?auto_81657 ) ) ( not ( = ?auto_81652 ?auto_81658 ) ) ( not ( = ?auto_81652 ?auto_81659 ) ) ( not ( = ?auto_81652 ?auto_81660 ) ) ( not ( = ?auto_81653 ?auto_81654 ) ) ( not ( = ?auto_81653 ?auto_81655 ) ) ( not ( = ?auto_81653 ?auto_81656 ) ) ( not ( = ?auto_81653 ?auto_81657 ) ) ( not ( = ?auto_81653 ?auto_81658 ) ) ( not ( = ?auto_81653 ?auto_81659 ) ) ( not ( = ?auto_81653 ?auto_81660 ) ) ( not ( = ?auto_81654 ?auto_81655 ) ) ( not ( = ?auto_81654 ?auto_81656 ) ) ( not ( = ?auto_81654 ?auto_81657 ) ) ( not ( = ?auto_81654 ?auto_81658 ) ) ( not ( = ?auto_81654 ?auto_81659 ) ) ( not ( = ?auto_81654 ?auto_81660 ) ) ( not ( = ?auto_81655 ?auto_81656 ) ) ( not ( = ?auto_81655 ?auto_81657 ) ) ( not ( = ?auto_81655 ?auto_81658 ) ) ( not ( = ?auto_81655 ?auto_81659 ) ) ( not ( = ?auto_81655 ?auto_81660 ) ) ( not ( = ?auto_81656 ?auto_81657 ) ) ( not ( = ?auto_81656 ?auto_81658 ) ) ( not ( = ?auto_81656 ?auto_81659 ) ) ( not ( = ?auto_81656 ?auto_81660 ) ) ( not ( = ?auto_81657 ?auto_81658 ) ) ( not ( = ?auto_81657 ?auto_81659 ) ) ( not ( = ?auto_81657 ?auto_81660 ) ) ( not ( = ?auto_81658 ?auto_81659 ) ) ( not ( = ?auto_81658 ?auto_81660 ) ) ( not ( = ?auto_81659 ?auto_81660 ) ) ( ON ?auto_81658 ?auto_81659 ) ( ON ?auto_81657 ?auto_81658 ) ( ON ?auto_81656 ?auto_81657 ) ( ON ?auto_81655 ?auto_81656 ) ( ON ?auto_81654 ?auto_81655 ) ( CLEAR ?auto_81652 ) ( ON ?auto_81653 ?auto_81654 ) ( CLEAR ?auto_81653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81650 ?auto_81651 ?auto_81652 ?auto_81653 )
      ( MAKE-10PILE ?auto_81650 ?auto_81651 ?auto_81652 ?auto_81653 ?auto_81654 ?auto_81655 ?auto_81656 ?auto_81657 ?auto_81658 ?auto_81659 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81671 - BLOCK
      ?auto_81672 - BLOCK
      ?auto_81673 - BLOCK
      ?auto_81674 - BLOCK
      ?auto_81675 - BLOCK
      ?auto_81676 - BLOCK
      ?auto_81677 - BLOCK
      ?auto_81678 - BLOCK
      ?auto_81679 - BLOCK
      ?auto_81680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81680 ) ( ON-TABLE ?auto_81671 ) ( ON ?auto_81672 ?auto_81671 ) ( ON ?auto_81673 ?auto_81672 ) ( not ( = ?auto_81671 ?auto_81672 ) ) ( not ( = ?auto_81671 ?auto_81673 ) ) ( not ( = ?auto_81671 ?auto_81674 ) ) ( not ( = ?auto_81671 ?auto_81675 ) ) ( not ( = ?auto_81671 ?auto_81676 ) ) ( not ( = ?auto_81671 ?auto_81677 ) ) ( not ( = ?auto_81671 ?auto_81678 ) ) ( not ( = ?auto_81671 ?auto_81679 ) ) ( not ( = ?auto_81671 ?auto_81680 ) ) ( not ( = ?auto_81672 ?auto_81673 ) ) ( not ( = ?auto_81672 ?auto_81674 ) ) ( not ( = ?auto_81672 ?auto_81675 ) ) ( not ( = ?auto_81672 ?auto_81676 ) ) ( not ( = ?auto_81672 ?auto_81677 ) ) ( not ( = ?auto_81672 ?auto_81678 ) ) ( not ( = ?auto_81672 ?auto_81679 ) ) ( not ( = ?auto_81672 ?auto_81680 ) ) ( not ( = ?auto_81673 ?auto_81674 ) ) ( not ( = ?auto_81673 ?auto_81675 ) ) ( not ( = ?auto_81673 ?auto_81676 ) ) ( not ( = ?auto_81673 ?auto_81677 ) ) ( not ( = ?auto_81673 ?auto_81678 ) ) ( not ( = ?auto_81673 ?auto_81679 ) ) ( not ( = ?auto_81673 ?auto_81680 ) ) ( not ( = ?auto_81674 ?auto_81675 ) ) ( not ( = ?auto_81674 ?auto_81676 ) ) ( not ( = ?auto_81674 ?auto_81677 ) ) ( not ( = ?auto_81674 ?auto_81678 ) ) ( not ( = ?auto_81674 ?auto_81679 ) ) ( not ( = ?auto_81674 ?auto_81680 ) ) ( not ( = ?auto_81675 ?auto_81676 ) ) ( not ( = ?auto_81675 ?auto_81677 ) ) ( not ( = ?auto_81675 ?auto_81678 ) ) ( not ( = ?auto_81675 ?auto_81679 ) ) ( not ( = ?auto_81675 ?auto_81680 ) ) ( not ( = ?auto_81676 ?auto_81677 ) ) ( not ( = ?auto_81676 ?auto_81678 ) ) ( not ( = ?auto_81676 ?auto_81679 ) ) ( not ( = ?auto_81676 ?auto_81680 ) ) ( not ( = ?auto_81677 ?auto_81678 ) ) ( not ( = ?auto_81677 ?auto_81679 ) ) ( not ( = ?auto_81677 ?auto_81680 ) ) ( not ( = ?auto_81678 ?auto_81679 ) ) ( not ( = ?auto_81678 ?auto_81680 ) ) ( not ( = ?auto_81679 ?auto_81680 ) ) ( ON ?auto_81679 ?auto_81680 ) ( ON ?auto_81678 ?auto_81679 ) ( ON ?auto_81677 ?auto_81678 ) ( ON ?auto_81676 ?auto_81677 ) ( ON ?auto_81675 ?auto_81676 ) ( CLEAR ?auto_81673 ) ( ON ?auto_81674 ?auto_81675 ) ( CLEAR ?auto_81674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81671 ?auto_81672 ?auto_81673 ?auto_81674 )
      ( MAKE-10PILE ?auto_81671 ?auto_81672 ?auto_81673 ?auto_81674 ?auto_81675 ?auto_81676 ?auto_81677 ?auto_81678 ?auto_81679 ?auto_81680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81691 - BLOCK
      ?auto_81692 - BLOCK
      ?auto_81693 - BLOCK
      ?auto_81694 - BLOCK
      ?auto_81695 - BLOCK
      ?auto_81696 - BLOCK
      ?auto_81697 - BLOCK
      ?auto_81698 - BLOCK
      ?auto_81699 - BLOCK
      ?auto_81700 - BLOCK
    )
    :vars
    (
      ?auto_81701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81700 ?auto_81701 ) ( ON-TABLE ?auto_81691 ) ( ON ?auto_81692 ?auto_81691 ) ( not ( = ?auto_81691 ?auto_81692 ) ) ( not ( = ?auto_81691 ?auto_81693 ) ) ( not ( = ?auto_81691 ?auto_81694 ) ) ( not ( = ?auto_81691 ?auto_81695 ) ) ( not ( = ?auto_81691 ?auto_81696 ) ) ( not ( = ?auto_81691 ?auto_81697 ) ) ( not ( = ?auto_81691 ?auto_81698 ) ) ( not ( = ?auto_81691 ?auto_81699 ) ) ( not ( = ?auto_81691 ?auto_81700 ) ) ( not ( = ?auto_81691 ?auto_81701 ) ) ( not ( = ?auto_81692 ?auto_81693 ) ) ( not ( = ?auto_81692 ?auto_81694 ) ) ( not ( = ?auto_81692 ?auto_81695 ) ) ( not ( = ?auto_81692 ?auto_81696 ) ) ( not ( = ?auto_81692 ?auto_81697 ) ) ( not ( = ?auto_81692 ?auto_81698 ) ) ( not ( = ?auto_81692 ?auto_81699 ) ) ( not ( = ?auto_81692 ?auto_81700 ) ) ( not ( = ?auto_81692 ?auto_81701 ) ) ( not ( = ?auto_81693 ?auto_81694 ) ) ( not ( = ?auto_81693 ?auto_81695 ) ) ( not ( = ?auto_81693 ?auto_81696 ) ) ( not ( = ?auto_81693 ?auto_81697 ) ) ( not ( = ?auto_81693 ?auto_81698 ) ) ( not ( = ?auto_81693 ?auto_81699 ) ) ( not ( = ?auto_81693 ?auto_81700 ) ) ( not ( = ?auto_81693 ?auto_81701 ) ) ( not ( = ?auto_81694 ?auto_81695 ) ) ( not ( = ?auto_81694 ?auto_81696 ) ) ( not ( = ?auto_81694 ?auto_81697 ) ) ( not ( = ?auto_81694 ?auto_81698 ) ) ( not ( = ?auto_81694 ?auto_81699 ) ) ( not ( = ?auto_81694 ?auto_81700 ) ) ( not ( = ?auto_81694 ?auto_81701 ) ) ( not ( = ?auto_81695 ?auto_81696 ) ) ( not ( = ?auto_81695 ?auto_81697 ) ) ( not ( = ?auto_81695 ?auto_81698 ) ) ( not ( = ?auto_81695 ?auto_81699 ) ) ( not ( = ?auto_81695 ?auto_81700 ) ) ( not ( = ?auto_81695 ?auto_81701 ) ) ( not ( = ?auto_81696 ?auto_81697 ) ) ( not ( = ?auto_81696 ?auto_81698 ) ) ( not ( = ?auto_81696 ?auto_81699 ) ) ( not ( = ?auto_81696 ?auto_81700 ) ) ( not ( = ?auto_81696 ?auto_81701 ) ) ( not ( = ?auto_81697 ?auto_81698 ) ) ( not ( = ?auto_81697 ?auto_81699 ) ) ( not ( = ?auto_81697 ?auto_81700 ) ) ( not ( = ?auto_81697 ?auto_81701 ) ) ( not ( = ?auto_81698 ?auto_81699 ) ) ( not ( = ?auto_81698 ?auto_81700 ) ) ( not ( = ?auto_81698 ?auto_81701 ) ) ( not ( = ?auto_81699 ?auto_81700 ) ) ( not ( = ?auto_81699 ?auto_81701 ) ) ( not ( = ?auto_81700 ?auto_81701 ) ) ( ON ?auto_81699 ?auto_81700 ) ( ON ?auto_81698 ?auto_81699 ) ( ON ?auto_81697 ?auto_81698 ) ( ON ?auto_81696 ?auto_81697 ) ( ON ?auto_81695 ?auto_81696 ) ( ON ?auto_81694 ?auto_81695 ) ( CLEAR ?auto_81692 ) ( ON ?auto_81693 ?auto_81694 ) ( CLEAR ?auto_81693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81691 ?auto_81692 ?auto_81693 )
      ( MAKE-10PILE ?auto_81691 ?auto_81692 ?auto_81693 ?auto_81694 ?auto_81695 ?auto_81696 ?auto_81697 ?auto_81698 ?auto_81699 ?auto_81700 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81712 - BLOCK
      ?auto_81713 - BLOCK
      ?auto_81714 - BLOCK
      ?auto_81715 - BLOCK
      ?auto_81716 - BLOCK
      ?auto_81717 - BLOCK
      ?auto_81718 - BLOCK
      ?auto_81719 - BLOCK
      ?auto_81720 - BLOCK
      ?auto_81721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81721 ) ( ON-TABLE ?auto_81712 ) ( ON ?auto_81713 ?auto_81712 ) ( not ( = ?auto_81712 ?auto_81713 ) ) ( not ( = ?auto_81712 ?auto_81714 ) ) ( not ( = ?auto_81712 ?auto_81715 ) ) ( not ( = ?auto_81712 ?auto_81716 ) ) ( not ( = ?auto_81712 ?auto_81717 ) ) ( not ( = ?auto_81712 ?auto_81718 ) ) ( not ( = ?auto_81712 ?auto_81719 ) ) ( not ( = ?auto_81712 ?auto_81720 ) ) ( not ( = ?auto_81712 ?auto_81721 ) ) ( not ( = ?auto_81713 ?auto_81714 ) ) ( not ( = ?auto_81713 ?auto_81715 ) ) ( not ( = ?auto_81713 ?auto_81716 ) ) ( not ( = ?auto_81713 ?auto_81717 ) ) ( not ( = ?auto_81713 ?auto_81718 ) ) ( not ( = ?auto_81713 ?auto_81719 ) ) ( not ( = ?auto_81713 ?auto_81720 ) ) ( not ( = ?auto_81713 ?auto_81721 ) ) ( not ( = ?auto_81714 ?auto_81715 ) ) ( not ( = ?auto_81714 ?auto_81716 ) ) ( not ( = ?auto_81714 ?auto_81717 ) ) ( not ( = ?auto_81714 ?auto_81718 ) ) ( not ( = ?auto_81714 ?auto_81719 ) ) ( not ( = ?auto_81714 ?auto_81720 ) ) ( not ( = ?auto_81714 ?auto_81721 ) ) ( not ( = ?auto_81715 ?auto_81716 ) ) ( not ( = ?auto_81715 ?auto_81717 ) ) ( not ( = ?auto_81715 ?auto_81718 ) ) ( not ( = ?auto_81715 ?auto_81719 ) ) ( not ( = ?auto_81715 ?auto_81720 ) ) ( not ( = ?auto_81715 ?auto_81721 ) ) ( not ( = ?auto_81716 ?auto_81717 ) ) ( not ( = ?auto_81716 ?auto_81718 ) ) ( not ( = ?auto_81716 ?auto_81719 ) ) ( not ( = ?auto_81716 ?auto_81720 ) ) ( not ( = ?auto_81716 ?auto_81721 ) ) ( not ( = ?auto_81717 ?auto_81718 ) ) ( not ( = ?auto_81717 ?auto_81719 ) ) ( not ( = ?auto_81717 ?auto_81720 ) ) ( not ( = ?auto_81717 ?auto_81721 ) ) ( not ( = ?auto_81718 ?auto_81719 ) ) ( not ( = ?auto_81718 ?auto_81720 ) ) ( not ( = ?auto_81718 ?auto_81721 ) ) ( not ( = ?auto_81719 ?auto_81720 ) ) ( not ( = ?auto_81719 ?auto_81721 ) ) ( not ( = ?auto_81720 ?auto_81721 ) ) ( ON ?auto_81720 ?auto_81721 ) ( ON ?auto_81719 ?auto_81720 ) ( ON ?auto_81718 ?auto_81719 ) ( ON ?auto_81717 ?auto_81718 ) ( ON ?auto_81716 ?auto_81717 ) ( ON ?auto_81715 ?auto_81716 ) ( CLEAR ?auto_81713 ) ( ON ?auto_81714 ?auto_81715 ) ( CLEAR ?auto_81714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81712 ?auto_81713 ?auto_81714 )
      ( MAKE-10PILE ?auto_81712 ?auto_81713 ?auto_81714 ?auto_81715 ?auto_81716 ?auto_81717 ?auto_81718 ?auto_81719 ?auto_81720 ?auto_81721 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81732 - BLOCK
      ?auto_81733 - BLOCK
      ?auto_81734 - BLOCK
      ?auto_81735 - BLOCK
      ?auto_81736 - BLOCK
      ?auto_81737 - BLOCK
      ?auto_81738 - BLOCK
      ?auto_81739 - BLOCK
      ?auto_81740 - BLOCK
      ?auto_81741 - BLOCK
    )
    :vars
    (
      ?auto_81742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81741 ?auto_81742 ) ( ON-TABLE ?auto_81732 ) ( not ( = ?auto_81732 ?auto_81733 ) ) ( not ( = ?auto_81732 ?auto_81734 ) ) ( not ( = ?auto_81732 ?auto_81735 ) ) ( not ( = ?auto_81732 ?auto_81736 ) ) ( not ( = ?auto_81732 ?auto_81737 ) ) ( not ( = ?auto_81732 ?auto_81738 ) ) ( not ( = ?auto_81732 ?auto_81739 ) ) ( not ( = ?auto_81732 ?auto_81740 ) ) ( not ( = ?auto_81732 ?auto_81741 ) ) ( not ( = ?auto_81732 ?auto_81742 ) ) ( not ( = ?auto_81733 ?auto_81734 ) ) ( not ( = ?auto_81733 ?auto_81735 ) ) ( not ( = ?auto_81733 ?auto_81736 ) ) ( not ( = ?auto_81733 ?auto_81737 ) ) ( not ( = ?auto_81733 ?auto_81738 ) ) ( not ( = ?auto_81733 ?auto_81739 ) ) ( not ( = ?auto_81733 ?auto_81740 ) ) ( not ( = ?auto_81733 ?auto_81741 ) ) ( not ( = ?auto_81733 ?auto_81742 ) ) ( not ( = ?auto_81734 ?auto_81735 ) ) ( not ( = ?auto_81734 ?auto_81736 ) ) ( not ( = ?auto_81734 ?auto_81737 ) ) ( not ( = ?auto_81734 ?auto_81738 ) ) ( not ( = ?auto_81734 ?auto_81739 ) ) ( not ( = ?auto_81734 ?auto_81740 ) ) ( not ( = ?auto_81734 ?auto_81741 ) ) ( not ( = ?auto_81734 ?auto_81742 ) ) ( not ( = ?auto_81735 ?auto_81736 ) ) ( not ( = ?auto_81735 ?auto_81737 ) ) ( not ( = ?auto_81735 ?auto_81738 ) ) ( not ( = ?auto_81735 ?auto_81739 ) ) ( not ( = ?auto_81735 ?auto_81740 ) ) ( not ( = ?auto_81735 ?auto_81741 ) ) ( not ( = ?auto_81735 ?auto_81742 ) ) ( not ( = ?auto_81736 ?auto_81737 ) ) ( not ( = ?auto_81736 ?auto_81738 ) ) ( not ( = ?auto_81736 ?auto_81739 ) ) ( not ( = ?auto_81736 ?auto_81740 ) ) ( not ( = ?auto_81736 ?auto_81741 ) ) ( not ( = ?auto_81736 ?auto_81742 ) ) ( not ( = ?auto_81737 ?auto_81738 ) ) ( not ( = ?auto_81737 ?auto_81739 ) ) ( not ( = ?auto_81737 ?auto_81740 ) ) ( not ( = ?auto_81737 ?auto_81741 ) ) ( not ( = ?auto_81737 ?auto_81742 ) ) ( not ( = ?auto_81738 ?auto_81739 ) ) ( not ( = ?auto_81738 ?auto_81740 ) ) ( not ( = ?auto_81738 ?auto_81741 ) ) ( not ( = ?auto_81738 ?auto_81742 ) ) ( not ( = ?auto_81739 ?auto_81740 ) ) ( not ( = ?auto_81739 ?auto_81741 ) ) ( not ( = ?auto_81739 ?auto_81742 ) ) ( not ( = ?auto_81740 ?auto_81741 ) ) ( not ( = ?auto_81740 ?auto_81742 ) ) ( not ( = ?auto_81741 ?auto_81742 ) ) ( ON ?auto_81740 ?auto_81741 ) ( ON ?auto_81739 ?auto_81740 ) ( ON ?auto_81738 ?auto_81739 ) ( ON ?auto_81737 ?auto_81738 ) ( ON ?auto_81736 ?auto_81737 ) ( ON ?auto_81735 ?auto_81736 ) ( ON ?auto_81734 ?auto_81735 ) ( CLEAR ?auto_81732 ) ( ON ?auto_81733 ?auto_81734 ) ( CLEAR ?auto_81733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81732 ?auto_81733 )
      ( MAKE-10PILE ?auto_81732 ?auto_81733 ?auto_81734 ?auto_81735 ?auto_81736 ?auto_81737 ?auto_81738 ?auto_81739 ?auto_81740 ?auto_81741 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81753 - BLOCK
      ?auto_81754 - BLOCK
      ?auto_81755 - BLOCK
      ?auto_81756 - BLOCK
      ?auto_81757 - BLOCK
      ?auto_81758 - BLOCK
      ?auto_81759 - BLOCK
      ?auto_81760 - BLOCK
      ?auto_81761 - BLOCK
      ?auto_81762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81762 ) ( ON-TABLE ?auto_81753 ) ( not ( = ?auto_81753 ?auto_81754 ) ) ( not ( = ?auto_81753 ?auto_81755 ) ) ( not ( = ?auto_81753 ?auto_81756 ) ) ( not ( = ?auto_81753 ?auto_81757 ) ) ( not ( = ?auto_81753 ?auto_81758 ) ) ( not ( = ?auto_81753 ?auto_81759 ) ) ( not ( = ?auto_81753 ?auto_81760 ) ) ( not ( = ?auto_81753 ?auto_81761 ) ) ( not ( = ?auto_81753 ?auto_81762 ) ) ( not ( = ?auto_81754 ?auto_81755 ) ) ( not ( = ?auto_81754 ?auto_81756 ) ) ( not ( = ?auto_81754 ?auto_81757 ) ) ( not ( = ?auto_81754 ?auto_81758 ) ) ( not ( = ?auto_81754 ?auto_81759 ) ) ( not ( = ?auto_81754 ?auto_81760 ) ) ( not ( = ?auto_81754 ?auto_81761 ) ) ( not ( = ?auto_81754 ?auto_81762 ) ) ( not ( = ?auto_81755 ?auto_81756 ) ) ( not ( = ?auto_81755 ?auto_81757 ) ) ( not ( = ?auto_81755 ?auto_81758 ) ) ( not ( = ?auto_81755 ?auto_81759 ) ) ( not ( = ?auto_81755 ?auto_81760 ) ) ( not ( = ?auto_81755 ?auto_81761 ) ) ( not ( = ?auto_81755 ?auto_81762 ) ) ( not ( = ?auto_81756 ?auto_81757 ) ) ( not ( = ?auto_81756 ?auto_81758 ) ) ( not ( = ?auto_81756 ?auto_81759 ) ) ( not ( = ?auto_81756 ?auto_81760 ) ) ( not ( = ?auto_81756 ?auto_81761 ) ) ( not ( = ?auto_81756 ?auto_81762 ) ) ( not ( = ?auto_81757 ?auto_81758 ) ) ( not ( = ?auto_81757 ?auto_81759 ) ) ( not ( = ?auto_81757 ?auto_81760 ) ) ( not ( = ?auto_81757 ?auto_81761 ) ) ( not ( = ?auto_81757 ?auto_81762 ) ) ( not ( = ?auto_81758 ?auto_81759 ) ) ( not ( = ?auto_81758 ?auto_81760 ) ) ( not ( = ?auto_81758 ?auto_81761 ) ) ( not ( = ?auto_81758 ?auto_81762 ) ) ( not ( = ?auto_81759 ?auto_81760 ) ) ( not ( = ?auto_81759 ?auto_81761 ) ) ( not ( = ?auto_81759 ?auto_81762 ) ) ( not ( = ?auto_81760 ?auto_81761 ) ) ( not ( = ?auto_81760 ?auto_81762 ) ) ( not ( = ?auto_81761 ?auto_81762 ) ) ( ON ?auto_81761 ?auto_81762 ) ( ON ?auto_81760 ?auto_81761 ) ( ON ?auto_81759 ?auto_81760 ) ( ON ?auto_81758 ?auto_81759 ) ( ON ?auto_81757 ?auto_81758 ) ( ON ?auto_81756 ?auto_81757 ) ( ON ?auto_81755 ?auto_81756 ) ( CLEAR ?auto_81753 ) ( ON ?auto_81754 ?auto_81755 ) ( CLEAR ?auto_81754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81753 ?auto_81754 )
      ( MAKE-10PILE ?auto_81753 ?auto_81754 ?auto_81755 ?auto_81756 ?auto_81757 ?auto_81758 ?auto_81759 ?auto_81760 ?auto_81761 ?auto_81762 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81773 - BLOCK
      ?auto_81774 - BLOCK
      ?auto_81775 - BLOCK
      ?auto_81776 - BLOCK
      ?auto_81777 - BLOCK
      ?auto_81778 - BLOCK
      ?auto_81779 - BLOCK
      ?auto_81780 - BLOCK
      ?auto_81781 - BLOCK
      ?auto_81782 - BLOCK
    )
    :vars
    (
      ?auto_81783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81782 ?auto_81783 ) ( not ( = ?auto_81773 ?auto_81774 ) ) ( not ( = ?auto_81773 ?auto_81775 ) ) ( not ( = ?auto_81773 ?auto_81776 ) ) ( not ( = ?auto_81773 ?auto_81777 ) ) ( not ( = ?auto_81773 ?auto_81778 ) ) ( not ( = ?auto_81773 ?auto_81779 ) ) ( not ( = ?auto_81773 ?auto_81780 ) ) ( not ( = ?auto_81773 ?auto_81781 ) ) ( not ( = ?auto_81773 ?auto_81782 ) ) ( not ( = ?auto_81773 ?auto_81783 ) ) ( not ( = ?auto_81774 ?auto_81775 ) ) ( not ( = ?auto_81774 ?auto_81776 ) ) ( not ( = ?auto_81774 ?auto_81777 ) ) ( not ( = ?auto_81774 ?auto_81778 ) ) ( not ( = ?auto_81774 ?auto_81779 ) ) ( not ( = ?auto_81774 ?auto_81780 ) ) ( not ( = ?auto_81774 ?auto_81781 ) ) ( not ( = ?auto_81774 ?auto_81782 ) ) ( not ( = ?auto_81774 ?auto_81783 ) ) ( not ( = ?auto_81775 ?auto_81776 ) ) ( not ( = ?auto_81775 ?auto_81777 ) ) ( not ( = ?auto_81775 ?auto_81778 ) ) ( not ( = ?auto_81775 ?auto_81779 ) ) ( not ( = ?auto_81775 ?auto_81780 ) ) ( not ( = ?auto_81775 ?auto_81781 ) ) ( not ( = ?auto_81775 ?auto_81782 ) ) ( not ( = ?auto_81775 ?auto_81783 ) ) ( not ( = ?auto_81776 ?auto_81777 ) ) ( not ( = ?auto_81776 ?auto_81778 ) ) ( not ( = ?auto_81776 ?auto_81779 ) ) ( not ( = ?auto_81776 ?auto_81780 ) ) ( not ( = ?auto_81776 ?auto_81781 ) ) ( not ( = ?auto_81776 ?auto_81782 ) ) ( not ( = ?auto_81776 ?auto_81783 ) ) ( not ( = ?auto_81777 ?auto_81778 ) ) ( not ( = ?auto_81777 ?auto_81779 ) ) ( not ( = ?auto_81777 ?auto_81780 ) ) ( not ( = ?auto_81777 ?auto_81781 ) ) ( not ( = ?auto_81777 ?auto_81782 ) ) ( not ( = ?auto_81777 ?auto_81783 ) ) ( not ( = ?auto_81778 ?auto_81779 ) ) ( not ( = ?auto_81778 ?auto_81780 ) ) ( not ( = ?auto_81778 ?auto_81781 ) ) ( not ( = ?auto_81778 ?auto_81782 ) ) ( not ( = ?auto_81778 ?auto_81783 ) ) ( not ( = ?auto_81779 ?auto_81780 ) ) ( not ( = ?auto_81779 ?auto_81781 ) ) ( not ( = ?auto_81779 ?auto_81782 ) ) ( not ( = ?auto_81779 ?auto_81783 ) ) ( not ( = ?auto_81780 ?auto_81781 ) ) ( not ( = ?auto_81780 ?auto_81782 ) ) ( not ( = ?auto_81780 ?auto_81783 ) ) ( not ( = ?auto_81781 ?auto_81782 ) ) ( not ( = ?auto_81781 ?auto_81783 ) ) ( not ( = ?auto_81782 ?auto_81783 ) ) ( ON ?auto_81781 ?auto_81782 ) ( ON ?auto_81780 ?auto_81781 ) ( ON ?auto_81779 ?auto_81780 ) ( ON ?auto_81778 ?auto_81779 ) ( ON ?auto_81777 ?auto_81778 ) ( ON ?auto_81776 ?auto_81777 ) ( ON ?auto_81775 ?auto_81776 ) ( ON ?auto_81774 ?auto_81775 ) ( ON ?auto_81773 ?auto_81774 ) ( CLEAR ?auto_81773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81773 )
      ( MAKE-10PILE ?auto_81773 ?auto_81774 ?auto_81775 ?auto_81776 ?auto_81777 ?auto_81778 ?auto_81779 ?auto_81780 ?auto_81781 ?auto_81782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81794 - BLOCK
      ?auto_81795 - BLOCK
      ?auto_81796 - BLOCK
      ?auto_81797 - BLOCK
      ?auto_81798 - BLOCK
      ?auto_81799 - BLOCK
      ?auto_81800 - BLOCK
      ?auto_81801 - BLOCK
      ?auto_81802 - BLOCK
      ?auto_81803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81803 ) ( not ( = ?auto_81794 ?auto_81795 ) ) ( not ( = ?auto_81794 ?auto_81796 ) ) ( not ( = ?auto_81794 ?auto_81797 ) ) ( not ( = ?auto_81794 ?auto_81798 ) ) ( not ( = ?auto_81794 ?auto_81799 ) ) ( not ( = ?auto_81794 ?auto_81800 ) ) ( not ( = ?auto_81794 ?auto_81801 ) ) ( not ( = ?auto_81794 ?auto_81802 ) ) ( not ( = ?auto_81794 ?auto_81803 ) ) ( not ( = ?auto_81795 ?auto_81796 ) ) ( not ( = ?auto_81795 ?auto_81797 ) ) ( not ( = ?auto_81795 ?auto_81798 ) ) ( not ( = ?auto_81795 ?auto_81799 ) ) ( not ( = ?auto_81795 ?auto_81800 ) ) ( not ( = ?auto_81795 ?auto_81801 ) ) ( not ( = ?auto_81795 ?auto_81802 ) ) ( not ( = ?auto_81795 ?auto_81803 ) ) ( not ( = ?auto_81796 ?auto_81797 ) ) ( not ( = ?auto_81796 ?auto_81798 ) ) ( not ( = ?auto_81796 ?auto_81799 ) ) ( not ( = ?auto_81796 ?auto_81800 ) ) ( not ( = ?auto_81796 ?auto_81801 ) ) ( not ( = ?auto_81796 ?auto_81802 ) ) ( not ( = ?auto_81796 ?auto_81803 ) ) ( not ( = ?auto_81797 ?auto_81798 ) ) ( not ( = ?auto_81797 ?auto_81799 ) ) ( not ( = ?auto_81797 ?auto_81800 ) ) ( not ( = ?auto_81797 ?auto_81801 ) ) ( not ( = ?auto_81797 ?auto_81802 ) ) ( not ( = ?auto_81797 ?auto_81803 ) ) ( not ( = ?auto_81798 ?auto_81799 ) ) ( not ( = ?auto_81798 ?auto_81800 ) ) ( not ( = ?auto_81798 ?auto_81801 ) ) ( not ( = ?auto_81798 ?auto_81802 ) ) ( not ( = ?auto_81798 ?auto_81803 ) ) ( not ( = ?auto_81799 ?auto_81800 ) ) ( not ( = ?auto_81799 ?auto_81801 ) ) ( not ( = ?auto_81799 ?auto_81802 ) ) ( not ( = ?auto_81799 ?auto_81803 ) ) ( not ( = ?auto_81800 ?auto_81801 ) ) ( not ( = ?auto_81800 ?auto_81802 ) ) ( not ( = ?auto_81800 ?auto_81803 ) ) ( not ( = ?auto_81801 ?auto_81802 ) ) ( not ( = ?auto_81801 ?auto_81803 ) ) ( not ( = ?auto_81802 ?auto_81803 ) ) ( ON ?auto_81802 ?auto_81803 ) ( ON ?auto_81801 ?auto_81802 ) ( ON ?auto_81800 ?auto_81801 ) ( ON ?auto_81799 ?auto_81800 ) ( ON ?auto_81798 ?auto_81799 ) ( ON ?auto_81797 ?auto_81798 ) ( ON ?auto_81796 ?auto_81797 ) ( ON ?auto_81795 ?auto_81796 ) ( ON ?auto_81794 ?auto_81795 ) ( CLEAR ?auto_81794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81794 )
      ( MAKE-10PILE ?auto_81794 ?auto_81795 ?auto_81796 ?auto_81797 ?auto_81798 ?auto_81799 ?auto_81800 ?auto_81801 ?auto_81802 ?auto_81803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_81814 - BLOCK
      ?auto_81815 - BLOCK
      ?auto_81816 - BLOCK
      ?auto_81817 - BLOCK
      ?auto_81818 - BLOCK
      ?auto_81819 - BLOCK
      ?auto_81820 - BLOCK
      ?auto_81821 - BLOCK
      ?auto_81822 - BLOCK
      ?auto_81823 - BLOCK
    )
    :vars
    (
      ?auto_81824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81814 ?auto_81815 ) ) ( not ( = ?auto_81814 ?auto_81816 ) ) ( not ( = ?auto_81814 ?auto_81817 ) ) ( not ( = ?auto_81814 ?auto_81818 ) ) ( not ( = ?auto_81814 ?auto_81819 ) ) ( not ( = ?auto_81814 ?auto_81820 ) ) ( not ( = ?auto_81814 ?auto_81821 ) ) ( not ( = ?auto_81814 ?auto_81822 ) ) ( not ( = ?auto_81814 ?auto_81823 ) ) ( not ( = ?auto_81815 ?auto_81816 ) ) ( not ( = ?auto_81815 ?auto_81817 ) ) ( not ( = ?auto_81815 ?auto_81818 ) ) ( not ( = ?auto_81815 ?auto_81819 ) ) ( not ( = ?auto_81815 ?auto_81820 ) ) ( not ( = ?auto_81815 ?auto_81821 ) ) ( not ( = ?auto_81815 ?auto_81822 ) ) ( not ( = ?auto_81815 ?auto_81823 ) ) ( not ( = ?auto_81816 ?auto_81817 ) ) ( not ( = ?auto_81816 ?auto_81818 ) ) ( not ( = ?auto_81816 ?auto_81819 ) ) ( not ( = ?auto_81816 ?auto_81820 ) ) ( not ( = ?auto_81816 ?auto_81821 ) ) ( not ( = ?auto_81816 ?auto_81822 ) ) ( not ( = ?auto_81816 ?auto_81823 ) ) ( not ( = ?auto_81817 ?auto_81818 ) ) ( not ( = ?auto_81817 ?auto_81819 ) ) ( not ( = ?auto_81817 ?auto_81820 ) ) ( not ( = ?auto_81817 ?auto_81821 ) ) ( not ( = ?auto_81817 ?auto_81822 ) ) ( not ( = ?auto_81817 ?auto_81823 ) ) ( not ( = ?auto_81818 ?auto_81819 ) ) ( not ( = ?auto_81818 ?auto_81820 ) ) ( not ( = ?auto_81818 ?auto_81821 ) ) ( not ( = ?auto_81818 ?auto_81822 ) ) ( not ( = ?auto_81818 ?auto_81823 ) ) ( not ( = ?auto_81819 ?auto_81820 ) ) ( not ( = ?auto_81819 ?auto_81821 ) ) ( not ( = ?auto_81819 ?auto_81822 ) ) ( not ( = ?auto_81819 ?auto_81823 ) ) ( not ( = ?auto_81820 ?auto_81821 ) ) ( not ( = ?auto_81820 ?auto_81822 ) ) ( not ( = ?auto_81820 ?auto_81823 ) ) ( not ( = ?auto_81821 ?auto_81822 ) ) ( not ( = ?auto_81821 ?auto_81823 ) ) ( not ( = ?auto_81822 ?auto_81823 ) ) ( ON ?auto_81814 ?auto_81824 ) ( not ( = ?auto_81823 ?auto_81824 ) ) ( not ( = ?auto_81822 ?auto_81824 ) ) ( not ( = ?auto_81821 ?auto_81824 ) ) ( not ( = ?auto_81820 ?auto_81824 ) ) ( not ( = ?auto_81819 ?auto_81824 ) ) ( not ( = ?auto_81818 ?auto_81824 ) ) ( not ( = ?auto_81817 ?auto_81824 ) ) ( not ( = ?auto_81816 ?auto_81824 ) ) ( not ( = ?auto_81815 ?auto_81824 ) ) ( not ( = ?auto_81814 ?auto_81824 ) ) ( ON ?auto_81815 ?auto_81814 ) ( ON ?auto_81816 ?auto_81815 ) ( ON ?auto_81817 ?auto_81816 ) ( ON ?auto_81818 ?auto_81817 ) ( ON ?auto_81819 ?auto_81818 ) ( ON ?auto_81820 ?auto_81819 ) ( ON ?auto_81821 ?auto_81820 ) ( ON ?auto_81822 ?auto_81821 ) ( ON ?auto_81823 ?auto_81822 ) ( CLEAR ?auto_81823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_81823 ?auto_81822 ?auto_81821 ?auto_81820 ?auto_81819 ?auto_81818 ?auto_81817 ?auto_81816 ?auto_81815 ?auto_81814 )
      ( MAKE-10PILE ?auto_81814 ?auto_81815 ?auto_81816 ?auto_81817 ?auto_81818 ?auto_81819 ?auto_81820 ?auto_81821 ?auto_81822 ?auto_81823 ) )
  )

)

