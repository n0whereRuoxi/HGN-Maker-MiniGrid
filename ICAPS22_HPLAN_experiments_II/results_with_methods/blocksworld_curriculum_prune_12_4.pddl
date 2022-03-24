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
      ?auto_161177 - BLOCK
    )
    :vars
    (
      ?auto_161178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161177 ?auto_161178 ) ( CLEAR ?auto_161177 ) ( HAND-EMPTY ) ( not ( = ?auto_161177 ?auto_161178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161177 ?auto_161178 )
      ( !PUTDOWN ?auto_161177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161184 - BLOCK
      ?auto_161185 - BLOCK
    )
    :vars
    (
      ?auto_161186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161184 ) ( ON ?auto_161185 ?auto_161186 ) ( CLEAR ?auto_161185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161184 ) ( not ( = ?auto_161184 ?auto_161185 ) ) ( not ( = ?auto_161184 ?auto_161186 ) ) ( not ( = ?auto_161185 ?auto_161186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161185 ?auto_161186 )
      ( !STACK ?auto_161185 ?auto_161184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161194 - BLOCK
      ?auto_161195 - BLOCK
    )
    :vars
    (
      ?auto_161196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161195 ?auto_161196 ) ( not ( = ?auto_161194 ?auto_161195 ) ) ( not ( = ?auto_161194 ?auto_161196 ) ) ( not ( = ?auto_161195 ?auto_161196 ) ) ( ON ?auto_161194 ?auto_161195 ) ( CLEAR ?auto_161194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161194 )
      ( MAKE-2PILE ?auto_161194 ?auto_161195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161205 - BLOCK
      ?auto_161206 - BLOCK
      ?auto_161207 - BLOCK
    )
    :vars
    (
      ?auto_161208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161206 ) ( ON ?auto_161207 ?auto_161208 ) ( CLEAR ?auto_161207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161205 ) ( ON ?auto_161206 ?auto_161205 ) ( not ( = ?auto_161205 ?auto_161206 ) ) ( not ( = ?auto_161205 ?auto_161207 ) ) ( not ( = ?auto_161205 ?auto_161208 ) ) ( not ( = ?auto_161206 ?auto_161207 ) ) ( not ( = ?auto_161206 ?auto_161208 ) ) ( not ( = ?auto_161207 ?auto_161208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161207 ?auto_161208 )
      ( !STACK ?auto_161207 ?auto_161206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161219 - BLOCK
      ?auto_161220 - BLOCK
      ?auto_161221 - BLOCK
    )
    :vars
    (
      ?auto_161222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161221 ?auto_161222 ) ( ON-TABLE ?auto_161219 ) ( not ( = ?auto_161219 ?auto_161220 ) ) ( not ( = ?auto_161219 ?auto_161221 ) ) ( not ( = ?auto_161219 ?auto_161222 ) ) ( not ( = ?auto_161220 ?auto_161221 ) ) ( not ( = ?auto_161220 ?auto_161222 ) ) ( not ( = ?auto_161221 ?auto_161222 ) ) ( CLEAR ?auto_161219 ) ( ON ?auto_161220 ?auto_161221 ) ( CLEAR ?auto_161220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161219 ?auto_161220 )
      ( MAKE-3PILE ?auto_161219 ?auto_161220 ?auto_161221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161233 - BLOCK
      ?auto_161234 - BLOCK
      ?auto_161235 - BLOCK
    )
    :vars
    (
      ?auto_161236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161235 ?auto_161236 ) ( not ( = ?auto_161233 ?auto_161234 ) ) ( not ( = ?auto_161233 ?auto_161235 ) ) ( not ( = ?auto_161233 ?auto_161236 ) ) ( not ( = ?auto_161234 ?auto_161235 ) ) ( not ( = ?auto_161234 ?auto_161236 ) ) ( not ( = ?auto_161235 ?auto_161236 ) ) ( ON ?auto_161234 ?auto_161235 ) ( ON ?auto_161233 ?auto_161234 ) ( CLEAR ?auto_161233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161233 )
      ( MAKE-3PILE ?auto_161233 ?auto_161234 ?auto_161235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161248 - BLOCK
      ?auto_161249 - BLOCK
      ?auto_161250 - BLOCK
      ?auto_161251 - BLOCK
    )
    :vars
    (
      ?auto_161252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161250 ) ( ON ?auto_161251 ?auto_161252 ) ( CLEAR ?auto_161251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161248 ) ( ON ?auto_161249 ?auto_161248 ) ( ON ?auto_161250 ?auto_161249 ) ( not ( = ?auto_161248 ?auto_161249 ) ) ( not ( = ?auto_161248 ?auto_161250 ) ) ( not ( = ?auto_161248 ?auto_161251 ) ) ( not ( = ?auto_161248 ?auto_161252 ) ) ( not ( = ?auto_161249 ?auto_161250 ) ) ( not ( = ?auto_161249 ?auto_161251 ) ) ( not ( = ?auto_161249 ?auto_161252 ) ) ( not ( = ?auto_161250 ?auto_161251 ) ) ( not ( = ?auto_161250 ?auto_161252 ) ) ( not ( = ?auto_161251 ?auto_161252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161251 ?auto_161252 )
      ( !STACK ?auto_161251 ?auto_161250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161266 - BLOCK
      ?auto_161267 - BLOCK
      ?auto_161268 - BLOCK
      ?auto_161269 - BLOCK
    )
    :vars
    (
      ?auto_161270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161269 ?auto_161270 ) ( ON-TABLE ?auto_161266 ) ( ON ?auto_161267 ?auto_161266 ) ( not ( = ?auto_161266 ?auto_161267 ) ) ( not ( = ?auto_161266 ?auto_161268 ) ) ( not ( = ?auto_161266 ?auto_161269 ) ) ( not ( = ?auto_161266 ?auto_161270 ) ) ( not ( = ?auto_161267 ?auto_161268 ) ) ( not ( = ?auto_161267 ?auto_161269 ) ) ( not ( = ?auto_161267 ?auto_161270 ) ) ( not ( = ?auto_161268 ?auto_161269 ) ) ( not ( = ?auto_161268 ?auto_161270 ) ) ( not ( = ?auto_161269 ?auto_161270 ) ) ( CLEAR ?auto_161267 ) ( ON ?auto_161268 ?auto_161269 ) ( CLEAR ?auto_161268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161266 ?auto_161267 ?auto_161268 )
      ( MAKE-4PILE ?auto_161266 ?auto_161267 ?auto_161268 ?auto_161269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161284 - BLOCK
      ?auto_161285 - BLOCK
      ?auto_161286 - BLOCK
      ?auto_161287 - BLOCK
    )
    :vars
    (
      ?auto_161288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161287 ?auto_161288 ) ( ON-TABLE ?auto_161284 ) ( not ( = ?auto_161284 ?auto_161285 ) ) ( not ( = ?auto_161284 ?auto_161286 ) ) ( not ( = ?auto_161284 ?auto_161287 ) ) ( not ( = ?auto_161284 ?auto_161288 ) ) ( not ( = ?auto_161285 ?auto_161286 ) ) ( not ( = ?auto_161285 ?auto_161287 ) ) ( not ( = ?auto_161285 ?auto_161288 ) ) ( not ( = ?auto_161286 ?auto_161287 ) ) ( not ( = ?auto_161286 ?auto_161288 ) ) ( not ( = ?auto_161287 ?auto_161288 ) ) ( ON ?auto_161286 ?auto_161287 ) ( CLEAR ?auto_161284 ) ( ON ?auto_161285 ?auto_161286 ) ( CLEAR ?auto_161285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161284 ?auto_161285 )
      ( MAKE-4PILE ?auto_161284 ?auto_161285 ?auto_161286 ?auto_161287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161302 - BLOCK
      ?auto_161303 - BLOCK
      ?auto_161304 - BLOCK
      ?auto_161305 - BLOCK
    )
    :vars
    (
      ?auto_161306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161305 ?auto_161306 ) ( not ( = ?auto_161302 ?auto_161303 ) ) ( not ( = ?auto_161302 ?auto_161304 ) ) ( not ( = ?auto_161302 ?auto_161305 ) ) ( not ( = ?auto_161302 ?auto_161306 ) ) ( not ( = ?auto_161303 ?auto_161304 ) ) ( not ( = ?auto_161303 ?auto_161305 ) ) ( not ( = ?auto_161303 ?auto_161306 ) ) ( not ( = ?auto_161304 ?auto_161305 ) ) ( not ( = ?auto_161304 ?auto_161306 ) ) ( not ( = ?auto_161305 ?auto_161306 ) ) ( ON ?auto_161304 ?auto_161305 ) ( ON ?auto_161303 ?auto_161304 ) ( ON ?auto_161302 ?auto_161303 ) ( CLEAR ?auto_161302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161302 )
      ( MAKE-4PILE ?auto_161302 ?auto_161303 ?auto_161304 ?auto_161305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161321 - BLOCK
      ?auto_161322 - BLOCK
      ?auto_161323 - BLOCK
      ?auto_161324 - BLOCK
      ?auto_161325 - BLOCK
    )
    :vars
    (
      ?auto_161326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161324 ) ( ON ?auto_161325 ?auto_161326 ) ( CLEAR ?auto_161325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161321 ) ( ON ?auto_161322 ?auto_161321 ) ( ON ?auto_161323 ?auto_161322 ) ( ON ?auto_161324 ?auto_161323 ) ( not ( = ?auto_161321 ?auto_161322 ) ) ( not ( = ?auto_161321 ?auto_161323 ) ) ( not ( = ?auto_161321 ?auto_161324 ) ) ( not ( = ?auto_161321 ?auto_161325 ) ) ( not ( = ?auto_161321 ?auto_161326 ) ) ( not ( = ?auto_161322 ?auto_161323 ) ) ( not ( = ?auto_161322 ?auto_161324 ) ) ( not ( = ?auto_161322 ?auto_161325 ) ) ( not ( = ?auto_161322 ?auto_161326 ) ) ( not ( = ?auto_161323 ?auto_161324 ) ) ( not ( = ?auto_161323 ?auto_161325 ) ) ( not ( = ?auto_161323 ?auto_161326 ) ) ( not ( = ?auto_161324 ?auto_161325 ) ) ( not ( = ?auto_161324 ?auto_161326 ) ) ( not ( = ?auto_161325 ?auto_161326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161325 ?auto_161326 )
      ( !STACK ?auto_161325 ?auto_161324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161343 - BLOCK
      ?auto_161344 - BLOCK
      ?auto_161345 - BLOCK
      ?auto_161346 - BLOCK
      ?auto_161347 - BLOCK
    )
    :vars
    (
      ?auto_161348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161347 ?auto_161348 ) ( ON-TABLE ?auto_161343 ) ( ON ?auto_161344 ?auto_161343 ) ( ON ?auto_161345 ?auto_161344 ) ( not ( = ?auto_161343 ?auto_161344 ) ) ( not ( = ?auto_161343 ?auto_161345 ) ) ( not ( = ?auto_161343 ?auto_161346 ) ) ( not ( = ?auto_161343 ?auto_161347 ) ) ( not ( = ?auto_161343 ?auto_161348 ) ) ( not ( = ?auto_161344 ?auto_161345 ) ) ( not ( = ?auto_161344 ?auto_161346 ) ) ( not ( = ?auto_161344 ?auto_161347 ) ) ( not ( = ?auto_161344 ?auto_161348 ) ) ( not ( = ?auto_161345 ?auto_161346 ) ) ( not ( = ?auto_161345 ?auto_161347 ) ) ( not ( = ?auto_161345 ?auto_161348 ) ) ( not ( = ?auto_161346 ?auto_161347 ) ) ( not ( = ?auto_161346 ?auto_161348 ) ) ( not ( = ?auto_161347 ?auto_161348 ) ) ( CLEAR ?auto_161345 ) ( ON ?auto_161346 ?auto_161347 ) ( CLEAR ?auto_161346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161343 ?auto_161344 ?auto_161345 ?auto_161346 )
      ( MAKE-5PILE ?auto_161343 ?auto_161344 ?auto_161345 ?auto_161346 ?auto_161347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161365 - BLOCK
      ?auto_161366 - BLOCK
      ?auto_161367 - BLOCK
      ?auto_161368 - BLOCK
      ?auto_161369 - BLOCK
    )
    :vars
    (
      ?auto_161370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161369 ?auto_161370 ) ( ON-TABLE ?auto_161365 ) ( ON ?auto_161366 ?auto_161365 ) ( not ( = ?auto_161365 ?auto_161366 ) ) ( not ( = ?auto_161365 ?auto_161367 ) ) ( not ( = ?auto_161365 ?auto_161368 ) ) ( not ( = ?auto_161365 ?auto_161369 ) ) ( not ( = ?auto_161365 ?auto_161370 ) ) ( not ( = ?auto_161366 ?auto_161367 ) ) ( not ( = ?auto_161366 ?auto_161368 ) ) ( not ( = ?auto_161366 ?auto_161369 ) ) ( not ( = ?auto_161366 ?auto_161370 ) ) ( not ( = ?auto_161367 ?auto_161368 ) ) ( not ( = ?auto_161367 ?auto_161369 ) ) ( not ( = ?auto_161367 ?auto_161370 ) ) ( not ( = ?auto_161368 ?auto_161369 ) ) ( not ( = ?auto_161368 ?auto_161370 ) ) ( not ( = ?auto_161369 ?auto_161370 ) ) ( ON ?auto_161368 ?auto_161369 ) ( CLEAR ?auto_161366 ) ( ON ?auto_161367 ?auto_161368 ) ( CLEAR ?auto_161367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161365 ?auto_161366 ?auto_161367 )
      ( MAKE-5PILE ?auto_161365 ?auto_161366 ?auto_161367 ?auto_161368 ?auto_161369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161387 - BLOCK
      ?auto_161388 - BLOCK
      ?auto_161389 - BLOCK
      ?auto_161390 - BLOCK
      ?auto_161391 - BLOCK
    )
    :vars
    (
      ?auto_161392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161391 ?auto_161392 ) ( ON-TABLE ?auto_161387 ) ( not ( = ?auto_161387 ?auto_161388 ) ) ( not ( = ?auto_161387 ?auto_161389 ) ) ( not ( = ?auto_161387 ?auto_161390 ) ) ( not ( = ?auto_161387 ?auto_161391 ) ) ( not ( = ?auto_161387 ?auto_161392 ) ) ( not ( = ?auto_161388 ?auto_161389 ) ) ( not ( = ?auto_161388 ?auto_161390 ) ) ( not ( = ?auto_161388 ?auto_161391 ) ) ( not ( = ?auto_161388 ?auto_161392 ) ) ( not ( = ?auto_161389 ?auto_161390 ) ) ( not ( = ?auto_161389 ?auto_161391 ) ) ( not ( = ?auto_161389 ?auto_161392 ) ) ( not ( = ?auto_161390 ?auto_161391 ) ) ( not ( = ?auto_161390 ?auto_161392 ) ) ( not ( = ?auto_161391 ?auto_161392 ) ) ( ON ?auto_161390 ?auto_161391 ) ( ON ?auto_161389 ?auto_161390 ) ( CLEAR ?auto_161387 ) ( ON ?auto_161388 ?auto_161389 ) ( CLEAR ?auto_161388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161387 ?auto_161388 )
      ( MAKE-5PILE ?auto_161387 ?auto_161388 ?auto_161389 ?auto_161390 ?auto_161391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161409 - BLOCK
      ?auto_161410 - BLOCK
      ?auto_161411 - BLOCK
      ?auto_161412 - BLOCK
      ?auto_161413 - BLOCK
    )
    :vars
    (
      ?auto_161414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161413 ?auto_161414 ) ( not ( = ?auto_161409 ?auto_161410 ) ) ( not ( = ?auto_161409 ?auto_161411 ) ) ( not ( = ?auto_161409 ?auto_161412 ) ) ( not ( = ?auto_161409 ?auto_161413 ) ) ( not ( = ?auto_161409 ?auto_161414 ) ) ( not ( = ?auto_161410 ?auto_161411 ) ) ( not ( = ?auto_161410 ?auto_161412 ) ) ( not ( = ?auto_161410 ?auto_161413 ) ) ( not ( = ?auto_161410 ?auto_161414 ) ) ( not ( = ?auto_161411 ?auto_161412 ) ) ( not ( = ?auto_161411 ?auto_161413 ) ) ( not ( = ?auto_161411 ?auto_161414 ) ) ( not ( = ?auto_161412 ?auto_161413 ) ) ( not ( = ?auto_161412 ?auto_161414 ) ) ( not ( = ?auto_161413 ?auto_161414 ) ) ( ON ?auto_161412 ?auto_161413 ) ( ON ?auto_161411 ?auto_161412 ) ( ON ?auto_161410 ?auto_161411 ) ( ON ?auto_161409 ?auto_161410 ) ( CLEAR ?auto_161409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161409 )
      ( MAKE-5PILE ?auto_161409 ?auto_161410 ?auto_161411 ?auto_161412 ?auto_161413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161432 - BLOCK
      ?auto_161433 - BLOCK
      ?auto_161434 - BLOCK
      ?auto_161435 - BLOCK
      ?auto_161436 - BLOCK
      ?auto_161437 - BLOCK
    )
    :vars
    (
      ?auto_161438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161436 ) ( ON ?auto_161437 ?auto_161438 ) ( CLEAR ?auto_161437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161432 ) ( ON ?auto_161433 ?auto_161432 ) ( ON ?auto_161434 ?auto_161433 ) ( ON ?auto_161435 ?auto_161434 ) ( ON ?auto_161436 ?auto_161435 ) ( not ( = ?auto_161432 ?auto_161433 ) ) ( not ( = ?auto_161432 ?auto_161434 ) ) ( not ( = ?auto_161432 ?auto_161435 ) ) ( not ( = ?auto_161432 ?auto_161436 ) ) ( not ( = ?auto_161432 ?auto_161437 ) ) ( not ( = ?auto_161432 ?auto_161438 ) ) ( not ( = ?auto_161433 ?auto_161434 ) ) ( not ( = ?auto_161433 ?auto_161435 ) ) ( not ( = ?auto_161433 ?auto_161436 ) ) ( not ( = ?auto_161433 ?auto_161437 ) ) ( not ( = ?auto_161433 ?auto_161438 ) ) ( not ( = ?auto_161434 ?auto_161435 ) ) ( not ( = ?auto_161434 ?auto_161436 ) ) ( not ( = ?auto_161434 ?auto_161437 ) ) ( not ( = ?auto_161434 ?auto_161438 ) ) ( not ( = ?auto_161435 ?auto_161436 ) ) ( not ( = ?auto_161435 ?auto_161437 ) ) ( not ( = ?auto_161435 ?auto_161438 ) ) ( not ( = ?auto_161436 ?auto_161437 ) ) ( not ( = ?auto_161436 ?auto_161438 ) ) ( not ( = ?auto_161437 ?auto_161438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161437 ?auto_161438 )
      ( !STACK ?auto_161437 ?auto_161436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161458 - BLOCK
      ?auto_161459 - BLOCK
      ?auto_161460 - BLOCK
      ?auto_161461 - BLOCK
      ?auto_161462 - BLOCK
      ?auto_161463 - BLOCK
    )
    :vars
    (
      ?auto_161464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161463 ?auto_161464 ) ( ON-TABLE ?auto_161458 ) ( ON ?auto_161459 ?auto_161458 ) ( ON ?auto_161460 ?auto_161459 ) ( ON ?auto_161461 ?auto_161460 ) ( not ( = ?auto_161458 ?auto_161459 ) ) ( not ( = ?auto_161458 ?auto_161460 ) ) ( not ( = ?auto_161458 ?auto_161461 ) ) ( not ( = ?auto_161458 ?auto_161462 ) ) ( not ( = ?auto_161458 ?auto_161463 ) ) ( not ( = ?auto_161458 ?auto_161464 ) ) ( not ( = ?auto_161459 ?auto_161460 ) ) ( not ( = ?auto_161459 ?auto_161461 ) ) ( not ( = ?auto_161459 ?auto_161462 ) ) ( not ( = ?auto_161459 ?auto_161463 ) ) ( not ( = ?auto_161459 ?auto_161464 ) ) ( not ( = ?auto_161460 ?auto_161461 ) ) ( not ( = ?auto_161460 ?auto_161462 ) ) ( not ( = ?auto_161460 ?auto_161463 ) ) ( not ( = ?auto_161460 ?auto_161464 ) ) ( not ( = ?auto_161461 ?auto_161462 ) ) ( not ( = ?auto_161461 ?auto_161463 ) ) ( not ( = ?auto_161461 ?auto_161464 ) ) ( not ( = ?auto_161462 ?auto_161463 ) ) ( not ( = ?auto_161462 ?auto_161464 ) ) ( not ( = ?auto_161463 ?auto_161464 ) ) ( CLEAR ?auto_161461 ) ( ON ?auto_161462 ?auto_161463 ) ( CLEAR ?auto_161462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161458 ?auto_161459 ?auto_161460 ?auto_161461 ?auto_161462 )
      ( MAKE-6PILE ?auto_161458 ?auto_161459 ?auto_161460 ?auto_161461 ?auto_161462 ?auto_161463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161484 - BLOCK
      ?auto_161485 - BLOCK
      ?auto_161486 - BLOCK
      ?auto_161487 - BLOCK
      ?auto_161488 - BLOCK
      ?auto_161489 - BLOCK
    )
    :vars
    (
      ?auto_161490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161489 ?auto_161490 ) ( ON-TABLE ?auto_161484 ) ( ON ?auto_161485 ?auto_161484 ) ( ON ?auto_161486 ?auto_161485 ) ( not ( = ?auto_161484 ?auto_161485 ) ) ( not ( = ?auto_161484 ?auto_161486 ) ) ( not ( = ?auto_161484 ?auto_161487 ) ) ( not ( = ?auto_161484 ?auto_161488 ) ) ( not ( = ?auto_161484 ?auto_161489 ) ) ( not ( = ?auto_161484 ?auto_161490 ) ) ( not ( = ?auto_161485 ?auto_161486 ) ) ( not ( = ?auto_161485 ?auto_161487 ) ) ( not ( = ?auto_161485 ?auto_161488 ) ) ( not ( = ?auto_161485 ?auto_161489 ) ) ( not ( = ?auto_161485 ?auto_161490 ) ) ( not ( = ?auto_161486 ?auto_161487 ) ) ( not ( = ?auto_161486 ?auto_161488 ) ) ( not ( = ?auto_161486 ?auto_161489 ) ) ( not ( = ?auto_161486 ?auto_161490 ) ) ( not ( = ?auto_161487 ?auto_161488 ) ) ( not ( = ?auto_161487 ?auto_161489 ) ) ( not ( = ?auto_161487 ?auto_161490 ) ) ( not ( = ?auto_161488 ?auto_161489 ) ) ( not ( = ?auto_161488 ?auto_161490 ) ) ( not ( = ?auto_161489 ?auto_161490 ) ) ( ON ?auto_161488 ?auto_161489 ) ( CLEAR ?auto_161486 ) ( ON ?auto_161487 ?auto_161488 ) ( CLEAR ?auto_161487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161484 ?auto_161485 ?auto_161486 ?auto_161487 )
      ( MAKE-6PILE ?auto_161484 ?auto_161485 ?auto_161486 ?auto_161487 ?auto_161488 ?auto_161489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161510 - BLOCK
      ?auto_161511 - BLOCK
      ?auto_161512 - BLOCK
      ?auto_161513 - BLOCK
      ?auto_161514 - BLOCK
      ?auto_161515 - BLOCK
    )
    :vars
    (
      ?auto_161516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161515 ?auto_161516 ) ( ON-TABLE ?auto_161510 ) ( ON ?auto_161511 ?auto_161510 ) ( not ( = ?auto_161510 ?auto_161511 ) ) ( not ( = ?auto_161510 ?auto_161512 ) ) ( not ( = ?auto_161510 ?auto_161513 ) ) ( not ( = ?auto_161510 ?auto_161514 ) ) ( not ( = ?auto_161510 ?auto_161515 ) ) ( not ( = ?auto_161510 ?auto_161516 ) ) ( not ( = ?auto_161511 ?auto_161512 ) ) ( not ( = ?auto_161511 ?auto_161513 ) ) ( not ( = ?auto_161511 ?auto_161514 ) ) ( not ( = ?auto_161511 ?auto_161515 ) ) ( not ( = ?auto_161511 ?auto_161516 ) ) ( not ( = ?auto_161512 ?auto_161513 ) ) ( not ( = ?auto_161512 ?auto_161514 ) ) ( not ( = ?auto_161512 ?auto_161515 ) ) ( not ( = ?auto_161512 ?auto_161516 ) ) ( not ( = ?auto_161513 ?auto_161514 ) ) ( not ( = ?auto_161513 ?auto_161515 ) ) ( not ( = ?auto_161513 ?auto_161516 ) ) ( not ( = ?auto_161514 ?auto_161515 ) ) ( not ( = ?auto_161514 ?auto_161516 ) ) ( not ( = ?auto_161515 ?auto_161516 ) ) ( ON ?auto_161514 ?auto_161515 ) ( ON ?auto_161513 ?auto_161514 ) ( CLEAR ?auto_161511 ) ( ON ?auto_161512 ?auto_161513 ) ( CLEAR ?auto_161512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161510 ?auto_161511 ?auto_161512 )
      ( MAKE-6PILE ?auto_161510 ?auto_161511 ?auto_161512 ?auto_161513 ?auto_161514 ?auto_161515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161536 - BLOCK
      ?auto_161537 - BLOCK
      ?auto_161538 - BLOCK
      ?auto_161539 - BLOCK
      ?auto_161540 - BLOCK
      ?auto_161541 - BLOCK
    )
    :vars
    (
      ?auto_161542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161541 ?auto_161542 ) ( ON-TABLE ?auto_161536 ) ( not ( = ?auto_161536 ?auto_161537 ) ) ( not ( = ?auto_161536 ?auto_161538 ) ) ( not ( = ?auto_161536 ?auto_161539 ) ) ( not ( = ?auto_161536 ?auto_161540 ) ) ( not ( = ?auto_161536 ?auto_161541 ) ) ( not ( = ?auto_161536 ?auto_161542 ) ) ( not ( = ?auto_161537 ?auto_161538 ) ) ( not ( = ?auto_161537 ?auto_161539 ) ) ( not ( = ?auto_161537 ?auto_161540 ) ) ( not ( = ?auto_161537 ?auto_161541 ) ) ( not ( = ?auto_161537 ?auto_161542 ) ) ( not ( = ?auto_161538 ?auto_161539 ) ) ( not ( = ?auto_161538 ?auto_161540 ) ) ( not ( = ?auto_161538 ?auto_161541 ) ) ( not ( = ?auto_161538 ?auto_161542 ) ) ( not ( = ?auto_161539 ?auto_161540 ) ) ( not ( = ?auto_161539 ?auto_161541 ) ) ( not ( = ?auto_161539 ?auto_161542 ) ) ( not ( = ?auto_161540 ?auto_161541 ) ) ( not ( = ?auto_161540 ?auto_161542 ) ) ( not ( = ?auto_161541 ?auto_161542 ) ) ( ON ?auto_161540 ?auto_161541 ) ( ON ?auto_161539 ?auto_161540 ) ( ON ?auto_161538 ?auto_161539 ) ( CLEAR ?auto_161536 ) ( ON ?auto_161537 ?auto_161538 ) ( CLEAR ?auto_161537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161536 ?auto_161537 )
      ( MAKE-6PILE ?auto_161536 ?auto_161537 ?auto_161538 ?auto_161539 ?auto_161540 ?auto_161541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161562 - BLOCK
      ?auto_161563 - BLOCK
      ?auto_161564 - BLOCK
      ?auto_161565 - BLOCK
      ?auto_161566 - BLOCK
      ?auto_161567 - BLOCK
    )
    :vars
    (
      ?auto_161568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161567 ?auto_161568 ) ( not ( = ?auto_161562 ?auto_161563 ) ) ( not ( = ?auto_161562 ?auto_161564 ) ) ( not ( = ?auto_161562 ?auto_161565 ) ) ( not ( = ?auto_161562 ?auto_161566 ) ) ( not ( = ?auto_161562 ?auto_161567 ) ) ( not ( = ?auto_161562 ?auto_161568 ) ) ( not ( = ?auto_161563 ?auto_161564 ) ) ( not ( = ?auto_161563 ?auto_161565 ) ) ( not ( = ?auto_161563 ?auto_161566 ) ) ( not ( = ?auto_161563 ?auto_161567 ) ) ( not ( = ?auto_161563 ?auto_161568 ) ) ( not ( = ?auto_161564 ?auto_161565 ) ) ( not ( = ?auto_161564 ?auto_161566 ) ) ( not ( = ?auto_161564 ?auto_161567 ) ) ( not ( = ?auto_161564 ?auto_161568 ) ) ( not ( = ?auto_161565 ?auto_161566 ) ) ( not ( = ?auto_161565 ?auto_161567 ) ) ( not ( = ?auto_161565 ?auto_161568 ) ) ( not ( = ?auto_161566 ?auto_161567 ) ) ( not ( = ?auto_161566 ?auto_161568 ) ) ( not ( = ?auto_161567 ?auto_161568 ) ) ( ON ?auto_161566 ?auto_161567 ) ( ON ?auto_161565 ?auto_161566 ) ( ON ?auto_161564 ?auto_161565 ) ( ON ?auto_161563 ?auto_161564 ) ( ON ?auto_161562 ?auto_161563 ) ( CLEAR ?auto_161562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161562 )
      ( MAKE-6PILE ?auto_161562 ?auto_161563 ?auto_161564 ?auto_161565 ?auto_161566 ?auto_161567 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161589 - BLOCK
      ?auto_161590 - BLOCK
      ?auto_161591 - BLOCK
      ?auto_161592 - BLOCK
      ?auto_161593 - BLOCK
      ?auto_161594 - BLOCK
      ?auto_161595 - BLOCK
    )
    :vars
    (
      ?auto_161596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161594 ) ( ON ?auto_161595 ?auto_161596 ) ( CLEAR ?auto_161595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161589 ) ( ON ?auto_161590 ?auto_161589 ) ( ON ?auto_161591 ?auto_161590 ) ( ON ?auto_161592 ?auto_161591 ) ( ON ?auto_161593 ?auto_161592 ) ( ON ?auto_161594 ?auto_161593 ) ( not ( = ?auto_161589 ?auto_161590 ) ) ( not ( = ?auto_161589 ?auto_161591 ) ) ( not ( = ?auto_161589 ?auto_161592 ) ) ( not ( = ?auto_161589 ?auto_161593 ) ) ( not ( = ?auto_161589 ?auto_161594 ) ) ( not ( = ?auto_161589 ?auto_161595 ) ) ( not ( = ?auto_161589 ?auto_161596 ) ) ( not ( = ?auto_161590 ?auto_161591 ) ) ( not ( = ?auto_161590 ?auto_161592 ) ) ( not ( = ?auto_161590 ?auto_161593 ) ) ( not ( = ?auto_161590 ?auto_161594 ) ) ( not ( = ?auto_161590 ?auto_161595 ) ) ( not ( = ?auto_161590 ?auto_161596 ) ) ( not ( = ?auto_161591 ?auto_161592 ) ) ( not ( = ?auto_161591 ?auto_161593 ) ) ( not ( = ?auto_161591 ?auto_161594 ) ) ( not ( = ?auto_161591 ?auto_161595 ) ) ( not ( = ?auto_161591 ?auto_161596 ) ) ( not ( = ?auto_161592 ?auto_161593 ) ) ( not ( = ?auto_161592 ?auto_161594 ) ) ( not ( = ?auto_161592 ?auto_161595 ) ) ( not ( = ?auto_161592 ?auto_161596 ) ) ( not ( = ?auto_161593 ?auto_161594 ) ) ( not ( = ?auto_161593 ?auto_161595 ) ) ( not ( = ?auto_161593 ?auto_161596 ) ) ( not ( = ?auto_161594 ?auto_161595 ) ) ( not ( = ?auto_161594 ?auto_161596 ) ) ( not ( = ?auto_161595 ?auto_161596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161595 ?auto_161596 )
      ( !STACK ?auto_161595 ?auto_161594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161619 - BLOCK
      ?auto_161620 - BLOCK
      ?auto_161621 - BLOCK
      ?auto_161622 - BLOCK
      ?auto_161623 - BLOCK
      ?auto_161624 - BLOCK
      ?auto_161625 - BLOCK
    )
    :vars
    (
      ?auto_161626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161625 ?auto_161626 ) ( ON-TABLE ?auto_161619 ) ( ON ?auto_161620 ?auto_161619 ) ( ON ?auto_161621 ?auto_161620 ) ( ON ?auto_161622 ?auto_161621 ) ( ON ?auto_161623 ?auto_161622 ) ( not ( = ?auto_161619 ?auto_161620 ) ) ( not ( = ?auto_161619 ?auto_161621 ) ) ( not ( = ?auto_161619 ?auto_161622 ) ) ( not ( = ?auto_161619 ?auto_161623 ) ) ( not ( = ?auto_161619 ?auto_161624 ) ) ( not ( = ?auto_161619 ?auto_161625 ) ) ( not ( = ?auto_161619 ?auto_161626 ) ) ( not ( = ?auto_161620 ?auto_161621 ) ) ( not ( = ?auto_161620 ?auto_161622 ) ) ( not ( = ?auto_161620 ?auto_161623 ) ) ( not ( = ?auto_161620 ?auto_161624 ) ) ( not ( = ?auto_161620 ?auto_161625 ) ) ( not ( = ?auto_161620 ?auto_161626 ) ) ( not ( = ?auto_161621 ?auto_161622 ) ) ( not ( = ?auto_161621 ?auto_161623 ) ) ( not ( = ?auto_161621 ?auto_161624 ) ) ( not ( = ?auto_161621 ?auto_161625 ) ) ( not ( = ?auto_161621 ?auto_161626 ) ) ( not ( = ?auto_161622 ?auto_161623 ) ) ( not ( = ?auto_161622 ?auto_161624 ) ) ( not ( = ?auto_161622 ?auto_161625 ) ) ( not ( = ?auto_161622 ?auto_161626 ) ) ( not ( = ?auto_161623 ?auto_161624 ) ) ( not ( = ?auto_161623 ?auto_161625 ) ) ( not ( = ?auto_161623 ?auto_161626 ) ) ( not ( = ?auto_161624 ?auto_161625 ) ) ( not ( = ?auto_161624 ?auto_161626 ) ) ( not ( = ?auto_161625 ?auto_161626 ) ) ( CLEAR ?auto_161623 ) ( ON ?auto_161624 ?auto_161625 ) ( CLEAR ?auto_161624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161619 ?auto_161620 ?auto_161621 ?auto_161622 ?auto_161623 ?auto_161624 )
      ( MAKE-7PILE ?auto_161619 ?auto_161620 ?auto_161621 ?auto_161622 ?auto_161623 ?auto_161624 ?auto_161625 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161649 - BLOCK
      ?auto_161650 - BLOCK
      ?auto_161651 - BLOCK
      ?auto_161652 - BLOCK
      ?auto_161653 - BLOCK
      ?auto_161654 - BLOCK
      ?auto_161655 - BLOCK
    )
    :vars
    (
      ?auto_161656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161655 ?auto_161656 ) ( ON-TABLE ?auto_161649 ) ( ON ?auto_161650 ?auto_161649 ) ( ON ?auto_161651 ?auto_161650 ) ( ON ?auto_161652 ?auto_161651 ) ( not ( = ?auto_161649 ?auto_161650 ) ) ( not ( = ?auto_161649 ?auto_161651 ) ) ( not ( = ?auto_161649 ?auto_161652 ) ) ( not ( = ?auto_161649 ?auto_161653 ) ) ( not ( = ?auto_161649 ?auto_161654 ) ) ( not ( = ?auto_161649 ?auto_161655 ) ) ( not ( = ?auto_161649 ?auto_161656 ) ) ( not ( = ?auto_161650 ?auto_161651 ) ) ( not ( = ?auto_161650 ?auto_161652 ) ) ( not ( = ?auto_161650 ?auto_161653 ) ) ( not ( = ?auto_161650 ?auto_161654 ) ) ( not ( = ?auto_161650 ?auto_161655 ) ) ( not ( = ?auto_161650 ?auto_161656 ) ) ( not ( = ?auto_161651 ?auto_161652 ) ) ( not ( = ?auto_161651 ?auto_161653 ) ) ( not ( = ?auto_161651 ?auto_161654 ) ) ( not ( = ?auto_161651 ?auto_161655 ) ) ( not ( = ?auto_161651 ?auto_161656 ) ) ( not ( = ?auto_161652 ?auto_161653 ) ) ( not ( = ?auto_161652 ?auto_161654 ) ) ( not ( = ?auto_161652 ?auto_161655 ) ) ( not ( = ?auto_161652 ?auto_161656 ) ) ( not ( = ?auto_161653 ?auto_161654 ) ) ( not ( = ?auto_161653 ?auto_161655 ) ) ( not ( = ?auto_161653 ?auto_161656 ) ) ( not ( = ?auto_161654 ?auto_161655 ) ) ( not ( = ?auto_161654 ?auto_161656 ) ) ( not ( = ?auto_161655 ?auto_161656 ) ) ( ON ?auto_161654 ?auto_161655 ) ( CLEAR ?auto_161652 ) ( ON ?auto_161653 ?auto_161654 ) ( CLEAR ?auto_161653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161652 ?auto_161653 )
      ( MAKE-7PILE ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161652 ?auto_161653 ?auto_161654 ?auto_161655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161679 - BLOCK
      ?auto_161680 - BLOCK
      ?auto_161681 - BLOCK
      ?auto_161682 - BLOCK
      ?auto_161683 - BLOCK
      ?auto_161684 - BLOCK
      ?auto_161685 - BLOCK
    )
    :vars
    (
      ?auto_161686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161685 ?auto_161686 ) ( ON-TABLE ?auto_161679 ) ( ON ?auto_161680 ?auto_161679 ) ( ON ?auto_161681 ?auto_161680 ) ( not ( = ?auto_161679 ?auto_161680 ) ) ( not ( = ?auto_161679 ?auto_161681 ) ) ( not ( = ?auto_161679 ?auto_161682 ) ) ( not ( = ?auto_161679 ?auto_161683 ) ) ( not ( = ?auto_161679 ?auto_161684 ) ) ( not ( = ?auto_161679 ?auto_161685 ) ) ( not ( = ?auto_161679 ?auto_161686 ) ) ( not ( = ?auto_161680 ?auto_161681 ) ) ( not ( = ?auto_161680 ?auto_161682 ) ) ( not ( = ?auto_161680 ?auto_161683 ) ) ( not ( = ?auto_161680 ?auto_161684 ) ) ( not ( = ?auto_161680 ?auto_161685 ) ) ( not ( = ?auto_161680 ?auto_161686 ) ) ( not ( = ?auto_161681 ?auto_161682 ) ) ( not ( = ?auto_161681 ?auto_161683 ) ) ( not ( = ?auto_161681 ?auto_161684 ) ) ( not ( = ?auto_161681 ?auto_161685 ) ) ( not ( = ?auto_161681 ?auto_161686 ) ) ( not ( = ?auto_161682 ?auto_161683 ) ) ( not ( = ?auto_161682 ?auto_161684 ) ) ( not ( = ?auto_161682 ?auto_161685 ) ) ( not ( = ?auto_161682 ?auto_161686 ) ) ( not ( = ?auto_161683 ?auto_161684 ) ) ( not ( = ?auto_161683 ?auto_161685 ) ) ( not ( = ?auto_161683 ?auto_161686 ) ) ( not ( = ?auto_161684 ?auto_161685 ) ) ( not ( = ?auto_161684 ?auto_161686 ) ) ( not ( = ?auto_161685 ?auto_161686 ) ) ( ON ?auto_161684 ?auto_161685 ) ( ON ?auto_161683 ?auto_161684 ) ( CLEAR ?auto_161681 ) ( ON ?auto_161682 ?auto_161683 ) ( CLEAR ?auto_161682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161679 ?auto_161680 ?auto_161681 ?auto_161682 )
      ( MAKE-7PILE ?auto_161679 ?auto_161680 ?auto_161681 ?auto_161682 ?auto_161683 ?auto_161684 ?auto_161685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161709 - BLOCK
      ?auto_161710 - BLOCK
      ?auto_161711 - BLOCK
      ?auto_161712 - BLOCK
      ?auto_161713 - BLOCK
      ?auto_161714 - BLOCK
      ?auto_161715 - BLOCK
    )
    :vars
    (
      ?auto_161716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161715 ?auto_161716 ) ( ON-TABLE ?auto_161709 ) ( ON ?auto_161710 ?auto_161709 ) ( not ( = ?auto_161709 ?auto_161710 ) ) ( not ( = ?auto_161709 ?auto_161711 ) ) ( not ( = ?auto_161709 ?auto_161712 ) ) ( not ( = ?auto_161709 ?auto_161713 ) ) ( not ( = ?auto_161709 ?auto_161714 ) ) ( not ( = ?auto_161709 ?auto_161715 ) ) ( not ( = ?auto_161709 ?auto_161716 ) ) ( not ( = ?auto_161710 ?auto_161711 ) ) ( not ( = ?auto_161710 ?auto_161712 ) ) ( not ( = ?auto_161710 ?auto_161713 ) ) ( not ( = ?auto_161710 ?auto_161714 ) ) ( not ( = ?auto_161710 ?auto_161715 ) ) ( not ( = ?auto_161710 ?auto_161716 ) ) ( not ( = ?auto_161711 ?auto_161712 ) ) ( not ( = ?auto_161711 ?auto_161713 ) ) ( not ( = ?auto_161711 ?auto_161714 ) ) ( not ( = ?auto_161711 ?auto_161715 ) ) ( not ( = ?auto_161711 ?auto_161716 ) ) ( not ( = ?auto_161712 ?auto_161713 ) ) ( not ( = ?auto_161712 ?auto_161714 ) ) ( not ( = ?auto_161712 ?auto_161715 ) ) ( not ( = ?auto_161712 ?auto_161716 ) ) ( not ( = ?auto_161713 ?auto_161714 ) ) ( not ( = ?auto_161713 ?auto_161715 ) ) ( not ( = ?auto_161713 ?auto_161716 ) ) ( not ( = ?auto_161714 ?auto_161715 ) ) ( not ( = ?auto_161714 ?auto_161716 ) ) ( not ( = ?auto_161715 ?auto_161716 ) ) ( ON ?auto_161714 ?auto_161715 ) ( ON ?auto_161713 ?auto_161714 ) ( ON ?auto_161712 ?auto_161713 ) ( CLEAR ?auto_161710 ) ( ON ?auto_161711 ?auto_161712 ) ( CLEAR ?auto_161711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161709 ?auto_161710 ?auto_161711 )
      ( MAKE-7PILE ?auto_161709 ?auto_161710 ?auto_161711 ?auto_161712 ?auto_161713 ?auto_161714 ?auto_161715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161739 - BLOCK
      ?auto_161740 - BLOCK
      ?auto_161741 - BLOCK
      ?auto_161742 - BLOCK
      ?auto_161743 - BLOCK
      ?auto_161744 - BLOCK
      ?auto_161745 - BLOCK
    )
    :vars
    (
      ?auto_161746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161745 ?auto_161746 ) ( ON-TABLE ?auto_161739 ) ( not ( = ?auto_161739 ?auto_161740 ) ) ( not ( = ?auto_161739 ?auto_161741 ) ) ( not ( = ?auto_161739 ?auto_161742 ) ) ( not ( = ?auto_161739 ?auto_161743 ) ) ( not ( = ?auto_161739 ?auto_161744 ) ) ( not ( = ?auto_161739 ?auto_161745 ) ) ( not ( = ?auto_161739 ?auto_161746 ) ) ( not ( = ?auto_161740 ?auto_161741 ) ) ( not ( = ?auto_161740 ?auto_161742 ) ) ( not ( = ?auto_161740 ?auto_161743 ) ) ( not ( = ?auto_161740 ?auto_161744 ) ) ( not ( = ?auto_161740 ?auto_161745 ) ) ( not ( = ?auto_161740 ?auto_161746 ) ) ( not ( = ?auto_161741 ?auto_161742 ) ) ( not ( = ?auto_161741 ?auto_161743 ) ) ( not ( = ?auto_161741 ?auto_161744 ) ) ( not ( = ?auto_161741 ?auto_161745 ) ) ( not ( = ?auto_161741 ?auto_161746 ) ) ( not ( = ?auto_161742 ?auto_161743 ) ) ( not ( = ?auto_161742 ?auto_161744 ) ) ( not ( = ?auto_161742 ?auto_161745 ) ) ( not ( = ?auto_161742 ?auto_161746 ) ) ( not ( = ?auto_161743 ?auto_161744 ) ) ( not ( = ?auto_161743 ?auto_161745 ) ) ( not ( = ?auto_161743 ?auto_161746 ) ) ( not ( = ?auto_161744 ?auto_161745 ) ) ( not ( = ?auto_161744 ?auto_161746 ) ) ( not ( = ?auto_161745 ?auto_161746 ) ) ( ON ?auto_161744 ?auto_161745 ) ( ON ?auto_161743 ?auto_161744 ) ( ON ?auto_161742 ?auto_161743 ) ( ON ?auto_161741 ?auto_161742 ) ( CLEAR ?auto_161739 ) ( ON ?auto_161740 ?auto_161741 ) ( CLEAR ?auto_161740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161739 ?auto_161740 )
      ( MAKE-7PILE ?auto_161739 ?auto_161740 ?auto_161741 ?auto_161742 ?auto_161743 ?auto_161744 ?auto_161745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161769 - BLOCK
      ?auto_161770 - BLOCK
      ?auto_161771 - BLOCK
      ?auto_161772 - BLOCK
      ?auto_161773 - BLOCK
      ?auto_161774 - BLOCK
      ?auto_161775 - BLOCK
    )
    :vars
    (
      ?auto_161776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161775 ?auto_161776 ) ( not ( = ?auto_161769 ?auto_161770 ) ) ( not ( = ?auto_161769 ?auto_161771 ) ) ( not ( = ?auto_161769 ?auto_161772 ) ) ( not ( = ?auto_161769 ?auto_161773 ) ) ( not ( = ?auto_161769 ?auto_161774 ) ) ( not ( = ?auto_161769 ?auto_161775 ) ) ( not ( = ?auto_161769 ?auto_161776 ) ) ( not ( = ?auto_161770 ?auto_161771 ) ) ( not ( = ?auto_161770 ?auto_161772 ) ) ( not ( = ?auto_161770 ?auto_161773 ) ) ( not ( = ?auto_161770 ?auto_161774 ) ) ( not ( = ?auto_161770 ?auto_161775 ) ) ( not ( = ?auto_161770 ?auto_161776 ) ) ( not ( = ?auto_161771 ?auto_161772 ) ) ( not ( = ?auto_161771 ?auto_161773 ) ) ( not ( = ?auto_161771 ?auto_161774 ) ) ( not ( = ?auto_161771 ?auto_161775 ) ) ( not ( = ?auto_161771 ?auto_161776 ) ) ( not ( = ?auto_161772 ?auto_161773 ) ) ( not ( = ?auto_161772 ?auto_161774 ) ) ( not ( = ?auto_161772 ?auto_161775 ) ) ( not ( = ?auto_161772 ?auto_161776 ) ) ( not ( = ?auto_161773 ?auto_161774 ) ) ( not ( = ?auto_161773 ?auto_161775 ) ) ( not ( = ?auto_161773 ?auto_161776 ) ) ( not ( = ?auto_161774 ?auto_161775 ) ) ( not ( = ?auto_161774 ?auto_161776 ) ) ( not ( = ?auto_161775 ?auto_161776 ) ) ( ON ?auto_161774 ?auto_161775 ) ( ON ?auto_161773 ?auto_161774 ) ( ON ?auto_161772 ?auto_161773 ) ( ON ?auto_161771 ?auto_161772 ) ( ON ?auto_161770 ?auto_161771 ) ( ON ?auto_161769 ?auto_161770 ) ( CLEAR ?auto_161769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161769 )
      ( MAKE-7PILE ?auto_161769 ?auto_161770 ?auto_161771 ?auto_161772 ?auto_161773 ?auto_161774 ?auto_161775 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161800 - BLOCK
      ?auto_161801 - BLOCK
      ?auto_161802 - BLOCK
      ?auto_161803 - BLOCK
      ?auto_161804 - BLOCK
      ?auto_161805 - BLOCK
      ?auto_161806 - BLOCK
      ?auto_161807 - BLOCK
    )
    :vars
    (
      ?auto_161808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161806 ) ( ON ?auto_161807 ?auto_161808 ) ( CLEAR ?auto_161807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161800 ) ( ON ?auto_161801 ?auto_161800 ) ( ON ?auto_161802 ?auto_161801 ) ( ON ?auto_161803 ?auto_161802 ) ( ON ?auto_161804 ?auto_161803 ) ( ON ?auto_161805 ?auto_161804 ) ( ON ?auto_161806 ?auto_161805 ) ( not ( = ?auto_161800 ?auto_161801 ) ) ( not ( = ?auto_161800 ?auto_161802 ) ) ( not ( = ?auto_161800 ?auto_161803 ) ) ( not ( = ?auto_161800 ?auto_161804 ) ) ( not ( = ?auto_161800 ?auto_161805 ) ) ( not ( = ?auto_161800 ?auto_161806 ) ) ( not ( = ?auto_161800 ?auto_161807 ) ) ( not ( = ?auto_161800 ?auto_161808 ) ) ( not ( = ?auto_161801 ?auto_161802 ) ) ( not ( = ?auto_161801 ?auto_161803 ) ) ( not ( = ?auto_161801 ?auto_161804 ) ) ( not ( = ?auto_161801 ?auto_161805 ) ) ( not ( = ?auto_161801 ?auto_161806 ) ) ( not ( = ?auto_161801 ?auto_161807 ) ) ( not ( = ?auto_161801 ?auto_161808 ) ) ( not ( = ?auto_161802 ?auto_161803 ) ) ( not ( = ?auto_161802 ?auto_161804 ) ) ( not ( = ?auto_161802 ?auto_161805 ) ) ( not ( = ?auto_161802 ?auto_161806 ) ) ( not ( = ?auto_161802 ?auto_161807 ) ) ( not ( = ?auto_161802 ?auto_161808 ) ) ( not ( = ?auto_161803 ?auto_161804 ) ) ( not ( = ?auto_161803 ?auto_161805 ) ) ( not ( = ?auto_161803 ?auto_161806 ) ) ( not ( = ?auto_161803 ?auto_161807 ) ) ( not ( = ?auto_161803 ?auto_161808 ) ) ( not ( = ?auto_161804 ?auto_161805 ) ) ( not ( = ?auto_161804 ?auto_161806 ) ) ( not ( = ?auto_161804 ?auto_161807 ) ) ( not ( = ?auto_161804 ?auto_161808 ) ) ( not ( = ?auto_161805 ?auto_161806 ) ) ( not ( = ?auto_161805 ?auto_161807 ) ) ( not ( = ?auto_161805 ?auto_161808 ) ) ( not ( = ?auto_161806 ?auto_161807 ) ) ( not ( = ?auto_161806 ?auto_161808 ) ) ( not ( = ?auto_161807 ?auto_161808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161807 ?auto_161808 )
      ( !STACK ?auto_161807 ?auto_161806 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161834 - BLOCK
      ?auto_161835 - BLOCK
      ?auto_161836 - BLOCK
      ?auto_161837 - BLOCK
      ?auto_161838 - BLOCK
      ?auto_161839 - BLOCK
      ?auto_161840 - BLOCK
      ?auto_161841 - BLOCK
    )
    :vars
    (
      ?auto_161842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161841 ?auto_161842 ) ( ON-TABLE ?auto_161834 ) ( ON ?auto_161835 ?auto_161834 ) ( ON ?auto_161836 ?auto_161835 ) ( ON ?auto_161837 ?auto_161836 ) ( ON ?auto_161838 ?auto_161837 ) ( ON ?auto_161839 ?auto_161838 ) ( not ( = ?auto_161834 ?auto_161835 ) ) ( not ( = ?auto_161834 ?auto_161836 ) ) ( not ( = ?auto_161834 ?auto_161837 ) ) ( not ( = ?auto_161834 ?auto_161838 ) ) ( not ( = ?auto_161834 ?auto_161839 ) ) ( not ( = ?auto_161834 ?auto_161840 ) ) ( not ( = ?auto_161834 ?auto_161841 ) ) ( not ( = ?auto_161834 ?auto_161842 ) ) ( not ( = ?auto_161835 ?auto_161836 ) ) ( not ( = ?auto_161835 ?auto_161837 ) ) ( not ( = ?auto_161835 ?auto_161838 ) ) ( not ( = ?auto_161835 ?auto_161839 ) ) ( not ( = ?auto_161835 ?auto_161840 ) ) ( not ( = ?auto_161835 ?auto_161841 ) ) ( not ( = ?auto_161835 ?auto_161842 ) ) ( not ( = ?auto_161836 ?auto_161837 ) ) ( not ( = ?auto_161836 ?auto_161838 ) ) ( not ( = ?auto_161836 ?auto_161839 ) ) ( not ( = ?auto_161836 ?auto_161840 ) ) ( not ( = ?auto_161836 ?auto_161841 ) ) ( not ( = ?auto_161836 ?auto_161842 ) ) ( not ( = ?auto_161837 ?auto_161838 ) ) ( not ( = ?auto_161837 ?auto_161839 ) ) ( not ( = ?auto_161837 ?auto_161840 ) ) ( not ( = ?auto_161837 ?auto_161841 ) ) ( not ( = ?auto_161837 ?auto_161842 ) ) ( not ( = ?auto_161838 ?auto_161839 ) ) ( not ( = ?auto_161838 ?auto_161840 ) ) ( not ( = ?auto_161838 ?auto_161841 ) ) ( not ( = ?auto_161838 ?auto_161842 ) ) ( not ( = ?auto_161839 ?auto_161840 ) ) ( not ( = ?auto_161839 ?auto_161841 ) ) ( not ( = ?auto_161839 ?auto_161842 ) ) ( not ( = ?auto_161840 ?auto_161841 ) ) ( not ( = ?auto_161840 ?auto_161842 ) ) ( not ( = ?auto_161841 ?auto_161842 ) ) ( CLEAR ?auto_161839 ) ( ON ?auto_161840 ?auto_161841 ) ( CLEAR ?auto_161840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161834 ?auto_161835 ?auto_161836 ?auto_161837 ?auto_161838 ?auto_161839 ?auto_161840 )
      ( MAKE-8PILE ?auto_161834 ?auto_161835 ?auto_161836 ?auto_161837 ?auto_161838 ?auto_161839 ?auto_161840 ?auto_161841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161868 - BLOCK
      ?auto_161869 - BLOCK
      ?auto_161870 - BLOCK
      ?auto_161871 - BLOCK
      ?auto_161872 - BLOCK
      ?auto_161873 - BLOCK
      ?auto_161874 - BLOCK
      ?auto_161875 - BLOCK
    )
    :vars
    (
      ?auto_161876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161875 ?auto_161876 ) ( ON-TABLE ?auto_161868 ) ( ON ?auto_161869 ?auto_161868 ) ( ON ?auto_161870 ?auto_161869 ) ( ON ?auto_161871 ?auto_161870 ) ( ON ?auto_161872 ?auto_161871 ) ( not ( = ?auto_161868 ?auto_161869 ) ) ( not ( = ?auto_161868 ?auto_161870 ) ) ( not ( = ?auto_161868 ?auto_161871 ) ) ( not ( = ?auto_161868 ?auto_161872 ) ) ( not ( = ?auto_161868 ?auto_161873 ) ) ( not ( = ?auto_161868 ?auto_161874 ) ) ( not ( = ?auto_161868 ?auto_161875 ) ) ( not ( = ?auto_161868 ?auto_161876 ) ) ( not ( = ?auto_161869 ?auto_161870 ) ) ( not ( = ?auto_161869 ?auto_161871 ) ) ( not ( = ?auto_161869 ?auto_161872 ) ) ( not ( = ?auto_161869 ?auto_161873 ) ) ( not ( = ?auto_161869 ?auto_161874 ) ) ( not ( = ?auto_161869 ?auto_161875 ) ) ( not ( = ?auto_161869 ?auto_161876 ) ) ( not ( = ?auto_161870 ?auto_161871 ) ) ( not ( = ?auto_161870 ?auto_161872 ) ) ( not ( = ?auto_161870 ?auto_161873 ) ) ( not ( = ?auto_161870 ?auto_161874 ) ) ( not ( = ?auto_161870 ?auto_161875 ) ) ( not ( = ?auto_161870 ?auto_161876 ) ) ( not ( = ?auto_161871 ?auto_161872 ) ) ( not ( = ?auto_161871 ?auto_161873 ) ) ( not ( = ?auto_161871 ?auto_161874 ) ) ( not ( = ?auto_161871 ?auto_161875 ) ) ( not ( = ?auto_161871 ?auto_161876 ) ) ( not ( = ?auto_161872 ?auto_161873 ) ) ( not ( = ?auto_161872 ?auto_161874 ) ) ( not ( = ?auto_161872 ?auto_161875 ) ) ( not ( = ?auto_161872 ?auto_161876 ) ) ( not ( = ?auto_161873 ?auto_161874 ) ) ( not ( = ?auto_161873 ?auto_161875 ) ) ( not ( = ?auto_161873 ?auto_161876 ) ) ( not ( = ?auto_161874 ?auto_161875 ) ) ( not ( = ?auto_161874 ?auto_161876 ) ) ( not ( = ?auto_161875 ?auto_161876 ) ) ( ON ?auto_161874 ?auto_161875 ) ( CLEAR ?auto_161872 ) ( ON ?auto_161873 ?auto_161874 ) ( CLEAR ?auto_161873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161868 ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ?auto_161873 )
      ( MAKE-8PILE ?auto_161868 ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ?auto_161873 ?auto_161874 ?auto_161875 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161902 - BLOCK
      ?auto_161903 - BLOCK
      ?auto_161904 - BLOCK
      ?auto_161905 - BLOCK
      ?auto_161906 - BLOCK
      ?auto_161907 - BLOCK
      ?auto_161908 - BLOCK
      ?auto_161909 - BLOCK
    )
    :vars
    (
      ?auto_161910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161909 ?auto_161910 ) ( ON-TABLE ?auto_161902 ) ( ON ?auto_161903 ?auto_161902 ) ( ON ?auto_161904 ?auto_161903 ) ( ON ?auto_161905 ?auto_161904 ) ( not ( = ?auto_161902 ?auto_161903 ) ) ( not ( = ?auto_161902 ?auto_161904 ) ) ( not ( = ?auto_161902 ?auto_161905 ) ) ( not ( = ?auto_161902 ?auto_161906 ) ) ( not ( = ?auto_161902 ?auto_161907 ) ) ( not ( = ?auto_161902 ?auto_161908 ) ) ( not ( = ?auto_161902 ?auto_161909 ) ) ( not ( = ?auto_161902 ?auto_161910 ) ) ( not ( = ?auto_161903 ?auto_161904 ) ) ( not ( = ?auto_161903 ?auto_161905 ) ) ( not ( = ?auto_161903 ?auto_161906 ) ) ( not ( = ?auto_161903 ?auto_161907 ) ) ( not ( = ?auto_161903 ?auto_161908 ) ) ( not ( = ?auto_161903 ?auto_161909 ) ) ( not ( = ?auto_161903 ?auto_161910 ) ) ( not ( = ?auto_161904 ?auto_161905 ) ) ( not ( = ?auto_161904 ?auto_161906 ) ) ( not ( = ?auto_161904 ?auto_161907 ) ) ( not ( = ?auto_161904 ?auto_161908 ) ) ( not ( = ?auto_161904 ?auto_161909 ) ) ( not ( = ?auto_161904 ?auto_161910 ) ) ( not ( = ?auto_161905 ?auto_161906 ) ) ( not ( = ?auto_161905 ?auto_161907 ) ) ( not ( = ?auto_161905 ?auto_161908 ) ) ( not ( = ?auto_161905 ?auto_161909 ) ) ( not ( = ?auto_161905 ?auto_161910 ) ) ( not ( = ?auto_161906 ?auto_161907 ) ) ( not ( = ?auto_161906 ?auto_161908 ) ) ( not ( = ?auto_161906 ?auto_161909 ) ) ( not ( = ?auto_161906 ?auto_161910 ) ) ( not ( = ?auto_161907 ?auto_161908 ) ) ( not ( = ?auto_161907 ?auto_161909 ) ) ( not ( = ?auto_161907 ?auto_161910 ) ) ( not ( = ?auto_161908 ?auto_161909 ) ) ( not ( = ?auto_161908 ?auto_161910 ) ) ( not ( = ?auto_161909 ?auto_161910 ) ) ( ON ?auto_161908 ?auto_161909 ) ( ON ?auto_161907 ?auto_161908 ) ( CLEAR ?auto_161905 ) ( ON ?auto_161906 ?auto_161907 ) ( CLEAR ?auto_161906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161902 ?auto_161903 ?auto_161904 ?auto_161905 ?auto_161906 )
      ( MAKE-8PILE ?auto_161902 ?auto_161903 ?auto_161904 ?auto_161905 ?auto_161906 ?auto_161907 ?auto_161908 ?auto_161909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161936 - BLOCK
      ?auto_161937 - BLOCK
      ?auto_161938 - BLOCK
      ?auto_161939 - BLOCK
      ?auto_161940 - BLOCK
      ?auto_161941 - BLOCK
      ?auto_161942 - BLOCK
      ?auto_161943 - BLOCK
    )
    :vars
    (
      ?auto_161944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161943 ?auto_161944 ) ( ON-TABLE ?auto_161936 ) ( ON ?auto_161937 ?auto_161936 ) ( ON ?auto_161938 ?auto_161937 ) ( not ( = ?auto_161936 ?auto_161937 ) ) ( not ( = ?auto_161936 ?auto_161938 ) ) ( not ( = ?auto_161936 ?auto_161939 ) ) ( not ( = ?auto_161936 ?auto_161940 ) ) ( not ( = ?auto_161936 ?auto_161941 ) ) ( not ( = ?auto_161936 ?auto_161942 ) ) ( not ( = ?auto_161936 ?auto_161943 ) ) ( not ( = ?auto_161936 ?auto_161944 ) ) ( not ( = ?auto_161937 ?auto_161938 ) ) ( not ( = ?auto_161937 ?auto_161939 ) ) ( not ( = ?auto_161937 ?auto_161940 ) ) ( not ( = ?auto_161937 ?auto_161941 ) ) ( not ( = ?auto_161937 ?auto_161942 ) ) ( not ( = ?auto_161937 ?auto_161943 ) ) ( not ( = ?auto_161937 ?auto_161944 ) ) ( not ( = ?auto_161938 ?auto_161939 ) ) ( not ( = ?auto_161938 ?auto_161940 ) ) ( not ( = ?auto_161938 ?auto_161941 ) ) ( not ( = ?auto_161938 ?auto_161942 ) ) ( not ( = ?auto_161938 ?auto_161943 ) ) ( not ( = ?auto_161938 ?auto_161944 ) ) ( not ( = ?auto_161939 ?auto_161940 ) ) ( not ( = ?auto_161939 ?auto_161941 ) ) ( not ( = ?auto_161939 ?auto_161942 ) ) ( not ( = ?auto_161939 ?auto_161943 ) ) ( not ( = ?auto_161939 ?auto_161944 ) ) ( not ( = ?auto_161940 ?auto_161941 ) ) ( not ( = ?auto_161940 ?auto_161942 ) ) ( not ( = ?auto_161940 ?auto_161943 ) ) ( not ( = ?auto_161940 ?auto_161944 ) ) ( not ( = ?auto_161941 ?auto_161942 ) ) ( not ( = ?auto_161941 ?auto_161943 ) ) ( not ( = ?auto_161941 ?auto_161944 ) ) ( not ( = ?auto_161942 ?auto_161943 ) ) ( not ( = ?auto_161942 ?auto_161944 ) ) ( not ( = ?auto_161943 ?auto_161944 ) ) ( ON ?auto_161942 ?auto_161943 ) ( ON ?auto_161941 ?auto_161942 ) ( ON ?auto_161940 ?auto_161941 ) ( CLEAR ?auto_161938 ) ( ON ?auto_161939 ?auto_161940 ) ( CLEAR ?auto_161939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161939 )
      ( MAKE-8PILE ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161939 ?auto_161940 ?auto_161941 ?auto_161942 ?auto_161943 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161970 - BLOCK
      ?auto_161971 - BLOCK
      ?auto_161972 - BLOCK
      ?auto_161973 - BLOCK
      ?auto_161974 - BLOCK
      ?auto_161975 - BLOCK
      ?auto_161976 - BLOCK
      ?auto_161977 - BLOCK
    )
    :vars
    (
      ?auto_161978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161977 ?auto_161978 ) ( ON-TABLE ?auto_161970 ) ( ON ?auto_161971 ?auto_161970 ) ( not ( = ?auto_161970 ?auto_161971 ) ) ( not ( = ?auto_161970 ?auto_161972 ) ) ( not ( = ?auto_161970 ?auto_161973 ) ) ( not ( = ?auto_161970 ?auto_161974 ) ) ( not ( = ?auto_161970 ?auto_161975 ) ) ( not ( = ?auto_161970 ?auto_161976 ) ) ( not ( = ?auto_161970 ?auto_161977 ) ) ( not ( = ?auto_161970 ?auto_161978 ) ) ( not ( = ?auto_161971 ?auto_161972 ) ) ( not ( = ?auto_161971 ?auto_161973 ) ) ( not ( = ?auto_161971 ?auto_161974 ) ) ( not ( = ?auto_161971 ?auto_161975 ) ) ( not ( = ?auto_161971 ?auto_161976 ) ) ( not ( = ?auto_161971 ?auto_161977 ) ) ( not ( = ?auto_161971 ?auto_161978 ) ) ( not ( = ?auto_161972 ?auto_161973 ) ) ( not ( = ?auto_161972 ?auto_161974 ) ) ( not ( = ?auto_161972 ?auto_161975 ) ) ( not ( = ?auto_161972 ?auto_161976 ) ) ( not ( = ?auto_161972 ?auto_161977 ) ) ( not ( = ?auto_161972 ?auto_161978 ) ) ( not ( = ?auto_161973 ?auto_161974 ) ) ( not ( = ?auto_161973 ?auto_161975 ) ) ( not ( = ?auto_161973 ?auto_161976 ) ) ( not ( = ?auto_161973 ?auto_161977 ) ) ( not ( = ?auto_161973 ?auto_161978 ) ) ( not ( = ?auto_161974 ?auto_161975 ) ) ( not ( = ?auto_161974 ?auto_161976 ) ) ( not ( = ?auto_161974 ?auto_161977 ) ) ( not ( = ?auto_161974 ?auto_161978 ) ) ( not ( = ?auto_161975 ?auto_161976 ) ) ( not ( = ?auto_161975 ?auto_161977 ) ) ( not ( = ?auto_161975 ?auto_161978 ) ) ( not ( = ?auto_161976 ?auto_161977 ) ) ( not ( = ?auto_161976 ?auto_161978 ) ) ( not ( = ?auto_161977 ?auto_161978 ) ) ( ON ?auto_161976 ?auto_161977 ) ( ON ?auto_161975 ?auto_161976 ) ( ON ?auto_161974 ?auto_161975 ) ( ON ?auto_161973 ?auto_161974 ) ( CLEAR ?auto_161971 ) ( ON ?auto_161972 ?auto_161973 ) ( CLEAR ?auto_161972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161970 ?auto_161971 ?auto_161972 )
      ( MAKE-8PILE ?auto_161970 ?auto_161971 ?auto_161972 ?auto_161973 ?auto_161974 ?auto_161975 ?auto_161976 ?auto_161977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162004 - BLOCK
      ?auto_162005 - BLOCK
      ?auto_162006 - BLOCK
      ?auto_162007 - BLOCK
      ?auto_162008 - BLOCK
      ?auto_162009 - BLOCK
      ?auto_162010 - BLOCK
      ?auto_162011 - BLOCK
    )
    :vars
    (
      ?auto_162012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162011 ?auto_162012 ) ( ON-TABLE ?auto_162004 ) ( not ( = ?auto_162004 ?auto_162005 ) ) ( not ( = ?auto_162004 ?auto_162006 ) ) ( not ( = ?auto_162004 ?auto_162007 ) ) ( not ( = ?auto_162004 ?auto_162008 ) ) ( not ( = ?auto_162004 ?auto_162009 ) ) ( not ( = ?auto_162004 ?auto_162010 ) ) ( not ( = ?auto_162004 ?auto_162011 ) ) ( not ( = ?auto_162004 ?auto_162012 ) ) ( not ( = ?auto_162005 ?auto_162006 ) ) ( not ( = ?auto_162005 ?auto_162007 ) ) ( not ( = ?auto_162005 ?auto_162008 ) ) ( not ( = ?auto_162005 ?auto_162009 ) ) ( not ( = ?auto_162005 ?auto_162010 ) ) ( not ( = ?auto_162005 ?auto_162011 ) ) ( not ( = ?auto_162005 ?auto_162012 ) ) ( not ( = ?auto_162006 ?auto_162007 ) ) ( not ( = ?auto_162006 ?auto_162008 ) ) ( not ( = ?auto_162006 ?auto_162009 ) ) ( not ( = ?auto_162006 ?auto_162010 ) ) ( not ( = ?auto_162006 ?auto_162011 ) ) ( not ( = ?auto_162006 ?auto_162012 ) ) ( not ( = ?auto_162007 ?auto_162008 ) ) ( not ( = ?auto_162007 ?auto_162009 ) ) ( not ( = ?auto_162007 ?auto_162010 ) ) ( not ( = ?auto_162007 ?auto_162011 ) ) ( not ( = ?auto_162007 ?auto_162012 ) ) ( not ( = ?auto_162008 ?auto_162009 ) ) ( not ( = ?auto_162008 ?auto_162010 ) ) ( not ( = ?auto_162008 ?auto_162011 ) ) ( not ( = ?auto_162008 ?auto_162012 ) ) ( not ( = ?auto_162009 ?auto_162010 ) ) ( not ( = ?auto_162009 ?auto_162011 ) ) ( not ( = ?auto_162009 ?auto_162012 ) ) ( not ( = ?auto_162010 ?auto_162011 ) ) ( not ( = ?auto_162010 ?auto_162012 ) ) ( not ( = ?auto_162011 ?auto_162012 ) ) ( ON ?auto_162010 ?auto_162011 ) ( ON ?auto_162009 ?auto_162010 ) ( ON ?auto_162008 ?auto_162009 ) ( ON ?auto_162007 ?auto_162008 ) ( ON ?auto_162006 ?auto_162007 ) ( CLEAR ?auto_162004 ) ( ON ?auto_162005 ?auto_162006 ) ( CLEAR ?auto_162005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162004 ?auto_162005 )
      ( MAKE-8PILE ?auto_162004 ?auto_162005 ?auto_162006 ?auto_162007 ?auto_162008 ?auto_162009 ?auto_162010 ?auto_162011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162038 - BLOCK
      ?auto_162039 - BLOCK
      ?auto_162040 - BLOCK
      ?auto_162041 - BLOCK
      ?auto_162042 - BLOCK
      ?auto_162043 - BLOCK
      ?auto_162044 - BLOCK
      ?auto_162045 - BLOCK
    )
    :vars
    (
      ?auto_162046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162045 ?auto_162046 ) ( not ( = ?auto_162038 ?auto_162039 ) ) ( not ( = ?auto_162038 ?auto_162040 ) ) ( not ( = ?auto_162038 ?auto_162041 ) ) ( not ( = ?auto_162038 ?auto_162042 ) ) ( not ( = ?auto_162038 ?auto_162043 ) ) ( not ( = ?auto_162038 ?auto_162044 ) ) ( not ( = ?auto_162038 ?auto_162045 ) ) ( not ( = ?auto_162038 ?auto_162046 ) ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( not ( = ?auto_162039 ?auto_162041 ) ) ( not ( = ?auto_162039 ?auto_162042 ) ) ( not ( = ?auto_162039 ?auto_162043 ) ) ( not ( = ?auto_162039 ?auto_162044 ) ) ( not ( = ?auto_162039 ?auto_162045 ) ) ( not ( = ?auto_162039 ?auto_162046 ) ) ( not ( = ?auto_162040 ?auto_162041 ) ) ( not ( = ?auto_162040 ?auto_162042 ) ) ( not ( = ?auto_162040 ?auto_162043 ) ) ( not ( = ?auto_162040 ?auto_162044 ) ) ( not ( = ?auto_162040 ?auto_162045 ) ) ( not ( = ?auto_162040 ?auto_162046 ) ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162044 ) ) ( not ( = ?auto_162041 ?auto_162045 ) ) ( not ( = ?auto_162041 ?auto_162046 ) ) ( not ( = ?auto_162042 ?auto_162043 ) ) ( not ( = ?auto_162042 ?auto_162044 ) ) ( not ( = ?auto_162042 ?auto_162045 ) ) ( not ( = ?auto_162042 ?auto_162046 ) ) ( not ( = ?auto_162043 ?auto_162044 ) ) ( not ( = ?auto_162043 ?auto_162045 ) ) ( not ( = ?auto_162043 ?auto_162046 ) ) ( not ( = ?auto_162044 ?auto_162045 ) ) ( not ( = ?auto_162044 ?auto_162046 ) ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( ON ?auto_162044 ?auto_162045 ) ( ON ?auto_162043 ?auto_162044 ) ( ON ?auto_162042 ?auto_162043 ) ( ON ?auto_162041 ?auto_162042 ) ( ON ?auto_162040 ?auto_162041 ) ( ON ?auto_162039 ?auto_162040 ) ( ON ?auto_162038 ?auto_162039 ) ( CLEAR ?auto_162038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162038 )
      ( MAKE-8PILE ?auto_162038 ?auto_162039 ?auto_162040 ?auto_162041 ?auto_162042 ?auto_162043 ?auto_162044 ?auto_162045 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162073 - BLOCK
      ?auto_162074 - BLOCK
      ?auto_162075 - BLOCK
      ?auto_162076 - BLOCK
      ?auto_162077 - BLOCK
      ?auto_162078 - BLOCK
      ?auto_162079 - BLOCK
      ?auto_162080 - BLOCK
      ?auto_162081 - BLOCK
    )
    :vars
    (
      ?auto_162082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162080 ) ( ON ?auto_162081 ?auto_162082 ) ( CLEAR ?auto_162081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162073 ) ( ON ?auto_162074 ?auto_162073 ) ( ON ?auto_162075 ?auto_162074 ) ( ON ?auto_162076 ?auto_162075 ) ( ON ?auto_162077 ?auto_162076 ) ( ON ?auto_162078 ?auto_162077 ) ( ON ?auto_162079 ?auto_162078 ) ( ON ?auto_162080 ?auto_162079 ) ( not ( = ?auto_162073 ?auto_162074 ) ) ( not ( = ?auto_162073 ?auto_162075 ) ) ( not ( = ?auto_162073 ?auto_162076 ) ) ( not ( = ?auto_162073 ?auto_162077 ) ) ( not ( = ?auto_162073 ?auto_162078 ) ) ( not ( = ?auto_162073 ?auto_162079 ) ) ( not ( = ?auto_162073 ?auto_162080 ) ) ( not ( = ?auto_162073 ?auto_162081 ) ) ( not ( = ?auto_162073 ?auto_162082 ) ) ( not ( = ?auto_162074 ?auto_162075 ) ) ( not ( = ?auto_162074 ?auto_162076 ) ) ( not ( = ?auto_162074 ?auto_162077 ) ) ( not ( = ?auto_162074 ?auto_162078 ) ) ( not ( = ?auto_162074 ?auto_162079 ) ) ( not ( = ?auto_162074 ?auto_162080 ) ) ( not ( = ?auto_162074 ?auto_162081 ) ) ( not ( = ?auto_162074 ?auto_162082 ) ) ( not ( = ?auto_162075 ?auto_162076 ) ) ( not ( = ?auto_162075 ?auto_162077 ) ) ( not ( = ?auto_162075 ?auto_162078 ) ) ( not ( = ?auto_162075 ?auto_162079 ) ) ( not ( = ?auto_162075 ?auto_162080 ) ) ( not ( = ?auto_162075 ?auto_162081 ) ) ( not ( = ?auto_162075 ?auto_162082 ) ) ( not ( = ?auto_162076 ?auto_162077 ) ) ( not ( = ?auto_162076 ?auto_162078 ) ) ( not ( = ?auto_162076 ?auto_162079 ) ) ( not ( = ?auto_162076 ?auto_162080 ) ) ( not ( = ?auto_162076 ?auto_162081 ) ) ( not ( = ?auto_162076 ?auto_162082 ) ) ( not ( = ?auto_162077 ?auto_162078 ) ) ( not ( = ?auto_162077 ?auto_162079 ) ) ( not ( = ?auto_162077 ?auto_162080 ) ) ( not ( = ?auto_162077 ?auto_162081 ) ) ( not ( = ?auto_162077 ?auto_162082 ) ) ( not ( = ?auto_162078 ?auto_162079 ) ) ( not ( = ?auto_162078 ?auto_162080 ) ) ( not ( = ?auto_162078 ?auto_162081 ) ) ( not ( = ?auto_162078 ?auto_162082 ) ) ( not ( = ?auto_162079 ?auto_162080 ) ) ( not ( = ?auto_162079 ?auto_162081 ) ) ( not ( = ?auto_162079 ?auto_162082 ) ) ( not ( = ?auto_162080 ?auto_162081 ) ) ( not ( = ?auto_162080 ?auto_162082 ) ) ( not ( = ?auto_162081 ?auto_162082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162081 ?auto_162082 )
      ( !STACK ?auto_162081 ?auto_162080 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162111 - BLOCK
      ?auto_162112 - BLOCK
      ?auto_162113 - BLOCK
      ?auto_162114 - BLOCK
      ?auto_162115 - BLOCK
      ?auto_162116 - BLOCK
      ?auto_162117 - BLOCK
      ?auto_162118 - BLOCK
      ?auto_162119 - BLOCK
    )
    :vars
    (
      ?auto_162120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162119 ?auto_162120 ) ( ON-TABLE ?auto_162111 ) ( ON ?auto_162112 ?auto_162111 ) ( ON ?auto_162113 ?auto_162112 ) ( ON ?auto_162114 ?auto_162113 ) ( ON ?auto_162115 ?auto_162114 ) ( ON ?auto_162116 ?auto_162115 ) ( ON ?auto_162117 ?auto_162116 ) ( not ( = ?auto_162111 ?auto_162112 ) ) ( not ( = ?auto_162111 ?auto_162113 ) ) ( not ( = ?auto_162111 ?auto_162114 ) ) ( not ( = ?auto_162111 ?auto_162115 ) ) ( not ( = ?auto_162111 ?auto_162116 ) ) ( not ( = ?auto_162111 ?auto_162117 ) ) ( not ( = ?auto_162111 ?auto_162118 ) ) ( not ( = ?auto_162111 ?auto_162119 ) ) ( not ( = ?auto_162111 ?auto_162120 ) ) ( not ( = ?auto_162112 ?auto_162113 ) ) ( not ( = ?auto_162112 ?auto_162114 ) ) ( not ( = ?auto_162112 ?auto_162115 ) ) ( not ( = ?auto_162112 ?auto_162116 ) ) ( not ( = ?auto_162112 ?auto_162117 ) ) ( not ( = ?auto_162112 ?auto_162118 ) ) ( not ( = ?auto_162112 ?auto_162119 ) ) ( not ( = ?auto_162112 ?auto_162120 ) ) ( not ( = ?auto_162113 ?auto_162114 ) ) ( not ( = ?auto_162113 ?auto_162115 ) ) ( not ( = ?auto_162113 ?auto_162116 ) ) ( not ( = ?auto_162113 ?auto_162117 ) ) ( not ( = ?auto_162113 ?auto_162118 ) ) ( not ( = ?auto_162113 ?auto_162119 ) ) ( not ( = ?auto_162113 ?auto_162120 ) ) ( not ( = ?auto_162114 ?auto_162115 ) ) ( not ( = ?auto_162114 ?auto_162116 ) ) ( not ( = ?auto_162114 ?auto_162117 ) ) ( not ( = ?auto_162114 ?auto_162118 ) ) ( not ( = ?auto_162114 ?auto_162119 ) ) ( not ( = ?auto_162114 ?auto_162120 ) ) ( not ( = ?auto_162115 ?auto_162116 ) ) ( not ( = ?auto_162115 ?auto_162117 ) ) ( not ( = ?auto_162115 ?auto_162118 ) ) ( not ( = ?auto_162115 ?auto_162119 ) ) ( not ( = ?auto_162115 ?auto_162120 ) ) ( not ( = ?auto_162116 ?auto_162117 ) ) ( not ( = ?auto_162116 ?auto_162118 ) ) ( not ( = ?auto_162116 ?auto_162119 ) ) ( not ( = ?auto_162116 ?auto_162120 ) ) ( not ( = ?auto_162117 ?auto_162118 ) ) ( not ( = ?auto_162117 ?auto_162119 ) ) ( not ( = ?auto_162117 ?auto_162120 ) ) ( not ( = ?auto_162118 ?auto_162119 ) ) ( not ( = ?auto_162118 ?auto_162120 ) ) ( not ( = ?auto_162119 ?auto_162120 ) ) ( CLEAR ?auto_162117 ) ( ON ?auto_162118 ?auto_162119 ) ( CLEAR ?auto_162118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162111 ?auto_162112 ?auto_162113 ?auto_162114 ?auto_162115 ?auto_162116 ?auto_162117 ?auto_162118 )
      ( MAKE-9PILE ?auto_162111 ?auto_162112 ?auto_162113 ?auto_162114 ?auto_162115 ?auto_162116 ?auto_162117 ?auto_162118 ?auto_162119 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162149 - BLOCK
      ?auto_162150 - BLOCK
      ?auto_162151 - BLOCK
      ?auto_162152 - BLOCK
      ?auto_162153 - BLOCK
      ?auto_162154 - BLOCK
      ?auto_162155 - BLOCK
      ?auto_162156 - BLOCK
      ?auto_162157 - BLOCK
    )
    :vars
    (
      ?auto_162158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162157 ?auto_162158 ) ( ON-TABLE ?auto_162149 ) ( ON ?auto_162150 ?auto_162149 ) ( ON ?auto_162151 ?auto_162150 ) ( ON ?auto_162152 ?auto_162151 ) ( ON ?auto_162153 ?auto_162152 ) ( ON ?auto_162154 ?auto_162153 ) ( not ( = ?auto_162149 ?auto_162150 ) ) ( not ( = ?auto_162149 ?auto_162151 ) ) ( not ( = ?auto_162149 ?auto_162152 ) ) ( not ( = ?auto_162149 ?auto_162153 ) ) ( not ( = ?auto_162149 ?auto_162154 ) ) ( not ( = ?auto_162149 ?auto_162155 ) ) ( not ( = ?auto_162149 ?auto_162156 ) ) ( not ( = ?auto_162149 ?auto_162157 ) ) ( not ( = ?auto_162149 ?auto_162158 ) ) ( not ( = ?auto_162150 ?auto_162151 ) ) ( not ( = ?auto_162150 ?auto_162152 ) ) ( not ( = ?auto_162150 ?auto_162153 ) ) ( not ( = ?auto_162150 ?auto_162154 ) ) ( not ( = ?auto_162150 ?auto_162155 ) ) ( not ( = ?auto_162150 ?auto_162156 ) ) ( not ( = ?auto_162150 ?auto_162157 ) ) ( not ( = ?auto_162150 ?auto_162158 ) ) ( not ( = ?auto_162151 ?auto_162152 ) ) ( not ( = ?auto_162151 ?auto_162153 ) ) ( not ( = ?auto_162151 ?auto_162154 ) ) ( not ( = ?auto_162151 ?auto_162155 ) ) ( not ( = ?auto_162151 ?auto_162156 ) ) ( not ( = ?auto_162151 ?auto_162157 ) ) ( not ( = ?auto_162151 ?auto_162158 ) ) ( not ( = ?auto_162152 ?auto_162153 ) ) ( not ( = ?auto_162152 ?auto_162154 ) ) ( not ( = ?auto_162152 ?auto_162155 ) ) ( not ( = ?auto_162152 ?auto_162156 ) ) ( not ( = ?auto_162152 ?auto_162157 ) ) ( not ( = ?auto_162152 ?auto_162158 ) ) ( not ( = ?auto_162153 ?auto_162154 ) ) ( not ( = ?auto_162153 ?auto_162155 ) ) ( not ( = ?auto_162153 ?auto_162156 ) ) ( not ( = ?auto_162153 ?auto_162157 ) ) ( not ( = ?auto_162153 ?auto_162158 ) ) ( not ( = ?auto_162154 ?auto_162155 ) ) ( not ( = ?auto_162154 ?auto_162156 ) ) ( not ( = ?auto_162154 ?auto_162157 ) ) ( not ( = ?auto_162154 ?auto_162158 ) ) ( not ( = ?auto_162155 ?auto_162156 ) ) ( not ( = ?auto_162155 ?auto_162157 ) ) ( not ( = ?auto_162155 ?auto_162158 ) ) ( not ( = ?auto_162156 ?auto_162157 ) ) ( not ( = ?auto_162156 ?auto_162158 ) ) ( not ( = ?auto_162157 ?auto_162158 ) ) ( ON ?auto_162156 ?auto_162157 ) ( CLEAR ?auto_162154 ) ( ON ?auto_162155 ?auto_162156 ) ( CLEAR ?auto_162155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162149 ?auto_162150 ?auto_162151 ?auto_162152 ?auto_162153 ?auto_162154 ?auto_162155 )
      ( MAKE-9PILE ?auto_162149 ?auto_162150 ?auto_162151 ?auto_162152 ?auto_162153 ?auto_162154 ?auto_162155 ?auto_162156 ?auto_162157 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162187 - BLOCK
      ?auto_162188 - BLOCK
      ?auto_162189 - BLOCK
      ?auto_162190 - BLOCK
      ?auto_162191 - BLOCK
      ?auto_162192 - BLOCK
      ?auto_162193 - BLOCK
      ?auto_162194 - BLOCK
      ?auto_162195 - BLOCK
    )
    :vars
    (
      ?auto_162196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162195 ?auto_162196 ) ( ON-TABLE ?auto_162187 ) ( ON ?auto_162188 ?auto_162187 ) ( ON ?auto_162189 ?auto_162188 ) ( ON ?auto_162190 ?auto_162189 ) ( ON ?auto_162191 ?auto_162190 ) ( not ( = ?auto_162187 ?auto_162188 ) ) ( not ( = ?auto_162187 ?auto_162189 ) ) ( not ( = ?auto_162187 ?auto_162190 ) ) ( not ( = ?auto_162187 ?auto_162191 ) ) ( not ( = ?auto_162187 ?auto_162192 ) ) ( not ( = ?auto_162187 ?auto_162193 ) ) ( not ( = ?auto_162187 ?auto_162194 ) ) ( not ( = ?auto_162187 ?auto_162195 ) ) ( not ( = ?auto_162187 ?auto_162196 ) ) ( not ( = ?auto_162188 ?auto_162189 ) ) ( not ( = ?auto_162188 ?auto_162190 ) ) ( not ( = ?auto_162188 ?auto_162191 ) ) ( not ( = ?auto_162188 ?auto_162192 ) ) ( not ( = ?auto_162188 ?auto_162193 ) ) ( not ( = ?auto_162188 ?auto_162194 ) ) ( not ( = ?auto_162188 ?auto_162195 ) ) ( not ( = ?auto_162188 ?auto_162196 ) ) ( not ( = ?auto_162189 ?auto_162190 ) ) ( not ( = ?auto_162189 ?auto_162191 ) ) ( not ( = ?auto_162189 ?auto_162192 ) ) ( not ( = ?auto_162189 ?auto_162193 ) ) ( not ( = ?auto_162189 ?auto_162194 ) ) ( not ( = ?auto_162189 ?auto_162195 ) ) ( not ( = ?auto_162189 ?auto_162196 ) ) ( not ( = ?auto_162190 ?auto_162191 ) ) ( not ( = ?auto_162190 ?auto_162192 ) ) ( not ( = ?auto_162190 ?auto_162193 ) ) ( not ( = ?auto_162190 ?auto_162194 ) ) ( not ( = ?auto_162190 ?auto_162195 ) ) ( not ( = ?auto_162190 ?auto_162196 ) ) ( not ( = ?auto_162191 ?auto_162192 ) ) ( not ( = ?auto_162191 ?auto_162193 ) ) ( not ( = ?auto_162191 ?auto_162194 ) ) ( not ( = ?auto_162191 ?auto_162195 ) ) ( not ( = ?auto_162191 ?auto_162196 ) ) ( not ( = ?auto_162192 ?auto_162193 ) ) ( not ( = ?auto_162192 ?auto_162194 ) ) ( not ( = ?auto_162192 ?auto_162195 ) ) ( not ( = ?auto_162192 ?auto_162196 ) ) ( not ( = ?auto_162193 ?auto_162194 ) ) ( not ( = ?auto_162193 ?auto_162195 ) ) ( not ( = ?auto_162193 ?auto_162196 ) ) ( not ( = ?auto_162194 ?auto_162195 ) ) ( not ( = ?auto_162194 ?auto_162196 ) ) ( not ( = ?auto_162195 ?auto_162196 ) ) ( ON ?auto_162194 ?auto_162195 ) ( ON ?auto_162193 ?auto_162194 ) ( CLEAR ?auto_162191 ) ( ON ?auto_162192 ?auto_162193 ) ( CLEAR ?auto_162192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162187 ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 ?auto_162192 )
      ( MAKE-9PILE ?auto_162187 ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 ?auto_162192 ?auto_162193 ?auto_162194 ?auto_162195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162225 - BLOCK
      ?auto_162226 - BLOCK
      ?auto_162227 - BLOCK
      ?auto_162228 - BLOCK
      ?auto_162229 - BLOCK
      ?auto_162230 - BLOCK
      ?auto_162231 - BLOCK
      ?auto_162232 - BLOCK
      ?auto_162233 - BLOCK
    )
    :vars
    (
      ?auto_162234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162233 ?auto_162234 ) ( ON-TABLE ?auto_162225 ) ( ON ?auto_162226 ?auto_162225 ) ( ON ?auto_162227 ?auto_162226 ) ( ON ?auto_162228 ?auto_162227 ) ( not ( = ?auto_162225 ?auto_162226 ) ) ( not ( = ?auto_162225 ?auto_162227 ) ) ( not ( = ?auto_162225 ?auto_162228 ) ) ( not ( = ?auto_162225 ?auto_162229 ) ) ( not ( = ?auto_162225 ?auto_162230 ) ) ( not ( = ?auto_162225 ?auto_162231 ) ) ( not ( = ?auto_162225 ?auto_162232 ) ) ( not ( = ?auto_162225 ?auto_162233 ) ) ( not ( = ?auto_162225 ?auto_162234 ) ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162228 ) ) ( not ( = ?auto_162226 ?auto_162229 ) ) ( not ( = ?auto_162226 ?auto_162230 ) ) ( not ( = ?auto_162226 ?auto_162231 ) ) ( not ( = ?auto_162226 ?auto_162232 ) ) ( not ( = ?auto_162226 ?auto_162233 ) ) ( not ( = ?auto_162226 ?auto_162234 ) ) ( not ( = ?auto_162227 ?auto_162228 ) ) ( not ( = ?auto_162227 ?auto_162229 ) ) ( not ( = ?auto_162227 ?auto_162230 ) ) ( not ( = ?auto_162227 ?auto_162231 ) ) ( not ( = ?auto_162227 ?auto_162232 ) ) ( not ( = ?auto_162227 ?auto_162233 ) ) ( not ( = ?auto_162227 ?auto_162234 ) ) ( not ( = ?auto_162228 ?auto_162229 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162231 ) ) ( not ( = ?auto_162228 ?auto_162232 ) ) ( not ( = ?auto_162228 ?auto_162233 ) ) ( not ( = ?auto_162228 ?auto_162234 ) ) ( not ( = ?auto_162229 ?auto_162230 ) ) ( not ( = ?auto_162229 ?auto_162231 ) ) ( not ( = ?auto_162229 ?auto_162232 ) ) ( not ( = ?auto_162229 ?auto_162233 ) ) ( not ( = ?auto_162229 ?auto_162234 ) ) ( not ( = ?auto_162230 ?auto_162231 ) ) ( not ( = ?auto_162230 ?auto_162232 ) ) ( not ( = ?auto_162230 ?auto_162233 ) ) ( not ( = ?auto_162230 ?auto_162234 ) ) ( not ( = ?auto_162231 ?auto_162232 ) ) ( not ( = ?auto_162231 ?auto_162233 ) ) ( not ( = ?auto_162231 ?auto_162234 ) ) ( not ( = ?auto_162232 ?auto_162233 ) ) ( not ( = ?auto_162232 ?auto_162234 ) ) ( not ( = ?auto_162233 ?auto_162234 ) ) ( ON ?auto_162232 ?auto_162233 ) ( ON ?auto_162231 ?auto_162232 ) ( ON ?auto_162230 ?auto_162231 ) ( CLEAR ?auto_162228 ) ( ON ?auto_162229 ?auto_162230 ) ( CLEAR ?auto_162229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162225 ?auto_162226 ?auto_162227 ?auto_162228 ?auto_162229 )
      ( MAKE-9PILE ?auto_162225 ?auto_162226 ?auto_162227 ?auto_162228 ?auto_162229 ?auto_162230 ?auto_162231 ?auto_162232 ?auto_162233 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162263 - BLOCK
      ?auto_162264 - BLOCK
      ?auto_162265 - BLOCK
      ?auto_162266 - BLOCK
      ?auto_162267 - BLOCK
      ?auto_162268 - BLOCK
      ?auto_162269 - BLOCK
      ?auto_162270 - BLOCK
      ?auto_162271 - BLOCK
    )
    :vars
    (
      ?auto_162272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162271 ?auto_162272 ) ( ON-TABLE ?auto_162263 ) ( ON ?auto_162264 ?auto_162263 ) ( ON ?auto_162265 ?auto_162264 ) ( not ( = ?auto_162263 ?auto_162264 ) ) ( not ( = ?auto_162263 ?auto_162265 ) ) ( not ( = ?auto_162263 ?auto_162266 ) ) ( not ( = ?auto_162263 ?auto_162267 ) ) ( not ( = ?auto_162263 ?auto_162268 ) ) ( not ( = ?auto_162263 ?auto_162269 ) ) ( not ( = ?auto_162263 ?auto_162270 ) ) ( not ( = ?auto_162263 ?auto_162271 ) ) ( not ( = ?auto_162263 ?auto_162272 ) ) ( not ( = ?auto_162264 ?auto_162265 ) ) ( not ( = ?auto_162264 ?auto_162266 ) ) ( not ( = ?auto_162264 ?auto_162267 ) ) ( not ( = ?auto_162264 ?auto_162268 ) ) ( not ( = ?auto_162264 ?auto_162269 ) ) ( not ( = ?auto_162264 ?auto_162270 ) ) ( not ( = ?auto_162264 ?auto_162271 ) ) ( not ( = ?auto_162264 ?auto_162272 ) ) ( not ( = ?auto_162265 ?auto_162266 ) ) ( not ( = ?auto_162265 ?auto_162267 ) ) ( not ( = ?auto_162265 ?auto_162268 ) ) ( not ( = ?auto_162265 ?auto_162269 ) ) ( not ( = ?auto_162265 ?auto_162270 ) ) ( not ( = ?auto_162265 ?auto_162271 ) ) ( not ( = ?auto_162265 ?auto_162272 ) ) ( not ( = ?auto_162266 ?auto_162267 ) ) ( not ( = ?auto_162266 ?auto_162268 ) ) ( not ( = ?auto_162266 ?auto_162269 ) ) ( not ( = ?auto_162266 ?auto_162270 ) ) ( not ( = ?auto_162266 ?auto_162271 ) ) ( not ( = ?auto_162266 ?auto_162272 ) ) ( not ( = ?auto_162267 ?auto_162268 ) ) ( not ( = ?auto_162267 ?auto_162269 ) ) ( not ( = ?auto_162267 ?auto_162270 ) ) ( not ( = ?auto_162267 ?auto_162271 ) ) ( not ( = ?auto_162267 ?auto_162272 ) ) ( not ( = ?auto_162268 ?auto_162269 ) ) ( not ( = ?auto_162268 ?auto_162270 ) ) ( not ( = ?auto_162268 ?auto_162271 ) ) ( not ( = ?auto_162268 ?auto_162272 ) ) ( not ( = ?auto_162269 ?auto_162270 ) ) ( not ( = ?auto_162269 ?auto_162271 ) ) ( not ( = ?auto_162269 ?auto_162272 ) ) ( not ( = ?auto_162270 ?auto_162271 ) ) ( not ( = ?auto_162270 ?auto_162272 ) ) ( not ( = ?auto_162271 ?auto_162272 ) ) ( ON ?auto_162270 ?auto_162271 ) ( ON ?auto_162269 ?auto_162270 ) ( ON ?auto_162268 ?auto_162269 ) ( ON ?auto_162267 ?auto_162268 ) ( CLEAR ?auto_162265 ) ( ON ?auto_162266 ?auto_162267 ) ( CLEAR ?auto_162266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162263 ?auto_162264 ?auto_162265 ?auto_162266 )
      ( MAKE-9PILE ?auto_162263 ?auto_162264 ?auto_162265 ?auto_162266 ?auto_162267 ?auto_162268 ?auto_162269 ?auto_162270 ?auto_162271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162301 - BLOCK
      ?auto_162302 - BLOCK
      ?auto_162303 - BLOCK
      ?auto_162304 - BLOCK
      ?auto_162305 - BLOCK
      ?auto_162306 - BLOCK
      ?auto_162307 - BLOCK
      ?auto_162308 - BLOCK
      ?auto_162309 - BLOCK
    )
    :vars
    (
      ?auto_162310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162309 ?auto_162310 ) ( ON-TABLE ?auto_162301 ) ( ON ?auto_162302 ?auto_162301 ) ( not ( = ?auto_162301 ?auto_162302 ) ) ( not ( = ?auto_162301 ?auto_162303 ) ) ( not ( = ?auto_162301 ?auto_162304 ) ) ( not ( = ?auto_162301 ?auto_162305 ) ) ( not ( = ?auto_162301 ?auto_162306 ) ) ( not ( = ?auto_162301 ?auto_162307 ) ) ( not ( = ?auto_162301 ?auto_162308 ) ) ( not ( = ?auto_162301 ?auto_162309 ) ) ( not ( = ?auto_162301 ?auto_162310 ) ) ( not ( = ?auto_162302 ?auto_162303 ) ) ( not ( = ?auto_162302 ?auto_162304 ) ) ( not ( = ?auto_162302 ?auto_162305 ) ) ( not ( = ?auto_162302 ?auto_162306 ) ) ( not ( = ?auto_162302 ?auto_162307 ) ) ( not ( = ?auto_162302 ?auto_162308 ) ) ( not ( = ?auto_162302 ?auto_162309 ) ) ( not ( = ?auto_162302 ?auto_162310 ) ) ( not ( = ?auto_162303 ?auto_162304 ) ) ( not ( = ?auto_162303 ?auto_162305 ) ) ( not ( = ?auto_162303 ?auto_162306 ) ) ( not ( = ?auto_162303 ?auto_162307 ) ) ( not ( = ?auto_162303 ?auto_162308 ) ) ( not ( = ?auto_162303 ?auto_162309 ) ) ( not ( = ?auto_162303 ?auto_162310 ) ) ( not ( = ?auto_162304 ?auto_162305 ) ) ( not ( = ?auto_162304 ?auto_162306 ) ) ( not ( = ?auto_162304 ?auto_162307 ) ) ( not ( = ?auto_162304 ?auto_162308 ) ) ( not ( = ?auto_162304 ?auto_162309 ) ) ( not ( = ?auto_162304 ?auto_162310 ) ) ( not ( = ?auto_162305 ?auto_162306 ) ) ( not ( = ?auto_162305 ?auto_162307 ) ) ( not ( = ?auto_162305 ?auto_162308 ) ) ( not ( = ?auto_162305 ?auto_162309 ) ) ( not ( = ?auto_162305 ?auto_162310 ) ) ( not ( = ?auto_162306 ?auto_162307 ) ) ( not ( = ?auto_162306 ?auto_162308 ) ) ( not ( = ?auto_162306 ?auto_162309 ) ) ( not ( = ?auto_162306 ?auto_162310 ) ) ( not ( = ?auto_162307 ?auto_162308 ) ) ( not ( = ?auto_162307 ?auto_162309 ) ) ( not ( = ?auto_162307 ?auto_162310 ) ) ( not ( = ?auto_162308 ?auto_162309 ) ) ( not ( = ?auto_162308 ?auto_162310 ) ) ( not ( = ?auto_162309 ?auto_162310 ) ) ( ON ?auto_162308 ?auto_162309 ) ( ON ?auto_162307 ?auto_162308 ) ( ON ?auto_162306 ?auto_162307 ) ( ON ?auto_162305 ?auto_162306 ) ( ON ?auto_162304 ?auto_162305 ) ( CLEAR ?auto_162302 ) ( ON ?auto_162303 ?auto_162304 ) ( CLEAR ?auto_162303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162301 ?auto_162302 ?auto_162303 )
      ( MAKE-9PILE ?auto_162301 ?auto_162302 ?auto_162303 ?auto_162304 ?auto_162305 ?auto_162306 ?auto_162307 ?auto_162308 ?auto_162309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162339 - BLOCK
      ?auto_162340 - BLOCK
      ?auto_162341 - BLOCK
      ?auto_162342 - BLOCK
      ?auto_162343 - BLOCK
      ?auto_162344 - BLOCK
      ?auto_162345 - BLOCK
      ?auto_162346 - BLOCK
      ?auto_162347 - BLOCK
    )
    :vars
    (
      ?auto_162348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162347 ?auto_162348 ) ( ON-TABLE ?auto_162339 ) ( not ( = ?auto_162339 ?auto_162340 ) ) ( not ( = ?auto_162339 ?auto_162341 ) ) ( not ( = ?auto_162339 ?auto_162342 ) ) ( not ( = ?auto_162339 ?auto_162343 ) ) ( not ( = ?auto_162339 ?auto_162344 ) ) ( not ( = ?auto_162339 ?auto_162345 ) ) ( not ( = ?auto_162339 ?auto_162346 ) ) ( not ( = ?auto_162339 ?auto_162347 ) ) ( not ( = ?auto_162339 ?auto_162348 ) ) ( not ( = ?auto_162340 ?auto_162341 ) ) ( not ( = ?auto_162340 ?auto_162342 ) ) ( not ( = ?auto_162340 ?auto_162343 ) ) ( not ( = ?auto_162340 ?auto_162344 ) ) ( not ( = ?auto_162340 ?auto_162345 ) ) ( not ( = ?auto_162340 ?auto_162346 ) ) ( not ( = ?auto_162340 ?auto_162347 ) ) ( not ( = ?auto_162340 ?auto_162348 ) ) ( not ( = ?auto_162341 ?auto_162342 ) ) ( not ( = ?auto_162341 ?auto_162343 ) ) ( not ( = ?auto_162341 ?auto_162344 ) ) ( not ( = ?auto_162341 ?auto_162345 ) ) ( not ( = ?auto_162341 ?auto_162346 ) ) ( not ( = ?auto_162341 ?auto_162347 ) ) ( not ( = ?auto_162341 ?auto_162348 ) ) ( not ( = ?auto_162342 ?auto_162343 ) ) ( not ( = ?auto_162342 ?auto_162344 ) ) ( not ( = ?auto_162342 ?auto_162345 ) ) ( not ( = ?auto_162342 ?auto_162346 ) ) ( not ( = ?auto_162342 ?auto_162347 ) ) ( not ( = ?auto_162342 ?auto_162348 ) ) ( not ( = ?auto_162343 ?auto_162344 ) ) ( not ( = ?auto_162343 ?auto_162345 ) ) ( not ( = ?auto_162343 ?auto_162346 ) ) ( not ( = ?auto_162343 ?auto_162347 ) ) ( not ( = ?auto_162343 ?auto_162348 ) ) ( not ( = ?auto_162344 ?auto_162345 ) ) ( not ( = ?auto_162344 ?auto_162346 ) ) ( not ( = ?auto_162344 ?auto_162347 ) ) ( not ( = ?auto_162344 ?auto_162348 ) ) ( not ( = ?auto_162345 ?auto_162346 ) ) ( not ( = ?auto_162345 ?auto_162347 ) ) ( not ( = ?auto_162345 ?auto_162348 ) ) ( not ( = ?auto_162346 ?auto_162347 ) ) ( not ( = ?auto_162346 ?auto_162348 ) ) ( not ( = ?auto_162347 ?auto_162348 ) ) ( ON ?auto_162346 ?auto_162347 ) ( ON ?auto_162345 ?auto_162346 ) ( ON ?auto_162344 ?auto_162345 ) ( ON ?auto_162343 ?auto_162344 ) ( ON ?auto_162342 ?auto_162343 ) ( ON ?auto_162341 ?auto_162342 ) ( CLEAR ?auto_162339 ) ( ON ?auto_162340 ?auto_162341 ) ( CLEAR ?auto_162340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162339 ?auto_162340 )
      ( MAKE-9PILE ?auto_162339 ?auto_162340 ?auto_162341 ?auto_162342 ?auto_162343 ?auto_162344 ?auto_162345 ?auto_162346 ?auto_162347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162377 - BLOCK
      ?auto_162378 - BLOCK
      ?auto_162379 - BLOCK
      ?auto_162380 - BLOCK
      ?auto_162381 - BLOCK
      ?auto_162382 - BLOCK
      ?auto_162383 - BLOCK
      ?auto_162384 - BLOCK
      ?auto_162385 - BLOCK
    )
    :vars
    (
      ?auto_162386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162385 ?auto_162386 ) ( not ( = ?auto_162377 ?auto_162378 ) ) ( not ( = ?auto_162377 ?auto_162379 ) ) ( not ( = ?auto_162377 ?auto_162380 ) ) ( not ( = ?auto_162377 ?auto_162381 ) ) ( not ( = ?auto_162377 ?auto_162382 ) ) ( not ( = ?auto_162377 ?auto_162383 ) ) ( not ( = ?auto_162377 ?auto_162384 ) ) ( not ( = ?auto_162377 ?auto_162385 ) ) ( not ( = ?auto_162377 ?auto_162386 ) ) ( not ( = ?auto_162378 ?auto_162379 ) ) ( not ( = ?auto_162378 ?auto_162380 ) ) ( not ( = ?auto_162378 ?auto_162381 ) ) ( not ( = ?auto_162378 ?auto_162382 ) ) ( not ( = ?auto_162378 ?auto_162383 ) ) ( not ( = ?auto_162378 ?auto_162384 ) ) ( not ( = ?auto_162378 ?auto_162385 ) ) ( not ( = ?auto_162378 ?auto_162386 ) ) ( not ( = ?auto_162379 ?auto_162380 ) ) ( not ( = ?auto_162379 ?auto_162381 ) ) ( not ( = ?auto_162379 ?auto_162382 ) ) ( not ( = ?auto_162379 ?auto_162383 ) ) ( not ( = ?auto_162379 ?auto_162384 ) ) ( not ( = ?auto_162379 ?auto_162385 ) ) ( not ( = ?auto_162379 ?auto_162386 ) ) ( not ( = ?auto_162380 ?auto_162381 ) ) ( not ( = ?auto_162380 ?auto_162382 ) ) ( not ( = ?auto_162380 ?auto_162383 ) ) ( not ( = ?auto_162380 ?auto_162384 ) ) ( not ( = ?auto_162380 ?auto_162385 ) ) ( not ( = ?auto_162380 ?auto_162386 ) ) ( not ( = ?auto_162381 ?auto_162382 ) ) ( not ( = ?auto_162381 ?auto_162383 ) ) ( not ( = ?auto_162381 ?auto_162384 ) ) ( not ( = ?auto_162381 ?auto_162385 ) ) ( not ( = ?auto_162381 ?auto_162386 ) ) ( not ( = ?auto_162382 ?auto_162383 ) ) ( not ( = ?auto_162382 ?auto_162384 ) ) ( not ( = ?auto_162382 ?auto_162385 ) ) ( not ( = ?auto_162382 ?auto_162386 ) ) ( not ( = ?auto_162383 ?auto_162384 ) ) ( not ( = ?auto_162383 ?auto_162385 ) ) ( not ( = ?auto_162383 ?auto_162386 ) ) ( not ( = ?auto_162384 ?auto_162385 ) ) ( not ( = ?auto_162384 ?auto_162386 ) ) ( not ( = ?auto_162385 ?auto_162386 ) ) ( ON ?auto_162384 ?auto_162385 ) ( ON ?auto_162383 ?auto_162384 ) ( ON ?auto_162382 ?auto_162383 ) ( ON ?auto_162381 ?auto_162382 ) ( ON ?auto_162380 ?auto_162381 ) ( ON ?auto_162379 ?auto_162380 ) ( ON ?auto_162378 ?auto_162379 ) ( ON ?auto_162377 ?auto_162378 ) ( CLEAR ?auto_162377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162377 )
      ( MAKE-9PILE ?auto_162377 ?auto_162378 ?auto_162379 ?auto_162380 ?auto_162381 ?auto_162382 ?auto_162383 ?auto_162384 ?auto_162385 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162416 - BLOCK
      ?auto_162417 - BLOCK
      ?auto_162418 - BLOCK
      ?auto_162419 - BLOCK
      ?auto_162420 - BLOCK
      ?auto_162421 - BLOCK
      ?auto_162422 - BLOCK
      ?auto_162423 - BLOCK
      ?auto_162424 - BLOCK
      ?auto_162425 - BLOCK
    )
    :vars
    (
      ?auto_162426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162424 ) ( ON ?auto_162425 ?auto_162426 ) ( CLEAR ?auto_162425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162416 ) ( ON ?auto_162417 ?auto_162416 ) ( ON ?auto_162418 ?auto_162417 ) ( ON ?auto_162419 ?auto_162418 ) ( ON ?auto_162420 ?auto_162419 ) ( ON ?auto_162421 ?auto_162420 ) ( ON ?auto_162422 ?auto_162421 ) ( ON ?auto_162423 ?auto_162422 ) ( ON ?auto_162424 ?auto_162423 ) ( not ( = ?auto_162416 ?auto_162417 ) ) ( not ( = ?auto_162416 ?auto_162418 ) ) ( not ( = ?auto_162416 ?auto_162419 ) ) ( not ( = ?auto_162416 ?auto_162420 ) ) ( not ( = ?auto_162416 ?auto_162421 ) ) ( not ( = ?auto_162416 ?auto_162422 ) ) ( not ( = ?auto_162416 ?auto_162423 ) ) ( not ( = ?auto_162416 ?auto_162424 ) ) ( not ( = ?auto_162416 ?auto_162425 ) ) ( not ( = ?auto_162416 ?auto_162426 ) ) ( not ( = ?auto_162417 ?auto_162418 ) ) ( not ( = ?auto_162417 ?auto_162419 ) ) ( not ( = ?auto_162417 ?auto_162420 ) ) ( not ( = ?auto_162417 ?auto_162421 ) ) ( not ( = ?auto_162417 ?auto_162422 ) ) ( not ( = ?auto_162417 ?auto_162423 ) ) ( not ( = ?auto_162417 ?auto_162424 ) ) ( not ( = ?auto_162417 ?auto_162425 ) ) ( not ( = ?auto_162417 ?auto_162426 ) ) ( not ( = ?auto_162418 ?auto_162419 ) ) ( not ( = ?auto_162418 ?auto_162420 ) ) ( not ( = ?auto_162418 ?auto_162421 ) ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( not ( = ?auto_162418 ?auto_162423 ) ) ( not ( = ?auto_162418 ?auto_162424 ) ) ( not ( = ?auto_162418 ?auto_162425 ) ) ( not ( = ?auto_162418 ?auto_162426 ) ) ( not ( = ?auto_162419 ?auto_162420 ) ) ( not ( = ?auto_162419 ?auto_162421 ) ) ( not ( = ?auto_162419 ?auto_162422 ) ) ( not ( = ?auto_162419 ?auto_162423 ) ) ( not ( = ?auto_162419 ?auto_162424 ) ) ( not ( = ?auto_162419 ?auto_162425 ) ) ( not ( = ?auto_162419 ?auto_162426 ) ) ( not ( = ?auto_162420 ?auto_162421 ) ) ( not ( = ?auto_162420 ?auto_162422 ) ) ( not ( = ?auto_162420 ?auto_162423 ) ) ( not ( = ?auto_162420 ?auto_162424 ) ) ( not ( = ?auto_162420 ?auto_162425 ) ) ( not ( = ?auto_162420 ?auto_162426 ) ) ( not ( = ?auto_162421 ?auto_162422 ) ) ( not ( = ?auto_162421 ?auto_162423 ) ) ( not ( = ?auto_162421 ?auto_162424 ) ) ( not ( = ?auto_162421 ?auto_162425 ) ) ( not ( = ?auto_162421 ?auto_162426 ) ) ( not ( = ?auto_162422 ?auto_162423 ) ) ( not ( = ?auto_162422 ?auto_162424 ) ) ( not ( = ?auto_162422 ?auto_162425 ) ) ( not ( = ?auto_162422 ?auto_162426 ) ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( not ( = ?auto_162423 ?auto_162425 ) ) ( not ( = ?auto_162423 ?auto_162426 ) ) ( not ( = ?auto_162424 ?auto_162425 ) ) ( not ( = ?auto_162424 ?auto_162426 ) ) ( not ( = ?auto_162425 ?auto_162426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162425 ?auto_162426 )
      ( !STACK ?auto_162425 ?auto_162424 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162458 - BLOCK
      ?auto_162459 - BLOCK
      ?auto_162460 - BLOCK
      ?auto_162461 - BLOCK
      ?auto_162462 - BLOCK
      ?auto_162463 - BLOCK
      ?auto_162464 - BLOCK
      ?auto_162465 - BLOCK
      ?auto_162466 - BLOCK
      ?auto_162467 - BLOCK
    )
    :vars
    (
      ?auto_162468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162467 ?auto_162468 ) ( ON-TABLE ?auto_162458 ) ( ON ?auto_162459 ?auto_162458 ) ( ON ?auto_162460 ?auto_162459 ) ( ON ?auto_162461 ?auto_162460 ) ( ON ?auto_162462 ?auto_162461 ) ( ON ?auto_162463 ?auto_162462 ) ( ON ?auto_162464 ?auto_162463 ) ( ON ?auto_162465 ?auto_162464 ) ( not ( = ?auto_162458 ?auto_162459 ) ) ( not ( = ?auto_162458 ?auto_162460 ) ) ( not ( = ?auto_162458 ?auto_162461 ) ) ( not ( = ?auto_162458 ?auto_162462 ) ) ( not ( = ?auto_162458 ?auto_162463 ) ) ( not ( = ?auto_162458 ?auto_162464 ) ) ( not ( = ?auto_162458 ?auto_162465 ) ) ( not ( = ?auto_162458 ?auto_162466 ) ) ( not ( = ?auto_162458 ?auto_162467 ) ) ( not ( = ?auto_162458 ?auto_162468 ) ) ( not ( = ?auto_162459 ?auto_162460 ) ) ( not ( = ?auto_162459 ?auto_162461 ) ) ( not ( = ?auto_162459 ?auto_162462 ) ) ( not ( = ?auto_162459 ?auto_162463 ) ) ( not ( = ?auto_162459 ?auto_162464 ) ) ( not ( = ?auto_162459 ?auto_162465 ) ) ( not ( = ?auto_162459 ?auto_162466 ) ) ( not ( = ?auto_162459 ?auto_162467 ) ) ( not ( = ?auto_162459 ?auto_162468 ) ) ( not ( = ?auto_162460 ?auto_162461 ) ) ( not ( = ?auto_162460 ?auto_162462 ) ) ( not ( = ?auto_162460 ?auto_162463 ) ) ( not ( = ?auto_162460 ?auto_162464 ) ) ( not ( = ?auto_162460 ?auto_162465 ) ) ( not ( = ?auto_162460 ?auto_162466 ) ) ( not ( = ?auto_162460 ?auto_162467 ) ) ( not ( = ?auto_162460 ?auto_162468 ) ) ( not ( = ?auto_162461 ?auto_162462 ) ) ( not ( = ?auto_162461 ?auto_162463 ) ) ( not ( = ?auto_162461 ?auto_162464 ) ) ( not ( = ?auto_162461 ?auto_162465 ) ) ( not ( = ?auto_162461 ?auto_162466 ) ) ( not ( = ?auto_162461 ?auto_162467 ) ) ( not ( = ?auto_162461 ?auto_162468 ) ) ( not ( = ?auto_162462 ?auto_162463 ) ) ( not ( = ?auto_162462 ?auto_162464 ) ) ( not ( = ?auto_162462 ?auto_162465 ) ) ( not ( = ?auto_162462 ?auto_162466 ) ) ( not ( = ?auto_162462 ?auto_162467 ) ) ( not ( = ?auto_162462 ?auto_162468 ) ) ( not ( = ?auto_162463 ?auto_162464 ) ) ( not ( = ?auto_162463 ?auto_162465 ) ) ( not ( = ?auto_162463 ?auto_162466 ) ) ( not ( = ?auto_162463 ?auto_162467 ) ) ( not ( = ?auto_162463 ?auto_162468 ) ) ( not ( = ?auto_162464 ?auto_162465 ) ) ( not ( = ?auto_162464 ?auto_162466 ) ) ( not ( = ?auto_162464 ?auto_162467 ) ) ( not ( = ?auto_162464 ?auto_162468 ) ) ( not ( = ?auto_162465 ?auto_162466 ) ) ( not ( = ?auto_162465 ?auto_162467 ) ) ( not ( = ?auto_162465 ?auto_162468 ) ) ( not ( = ?auto_162466 ?auto_162467 ) ) ( not ( = ?auto_162466 ?auto_162468 ) ) ( not ( = ?auto_162467 ?auto_162468 ) ) ( CLEAR ?auto_162465 ) ( ON ?auto_162466 ?auto_162467 ) ( CLEAR ?auto_162466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162458 ?auto_162459 ?auto_162460 ?auto_162461 ?auto_162462 ?auto_162463 ?auto_162464 ?auto_162465 ?auto_162466 )
      ( MAKE-10PILE ?auto_162458 ?auto_162459 ?auto_162460 ?auto_162461 ?auto_162462 ?auto_162463 ?auto_162464 ?auto_162465 ?auto_162466 ?auto_162467 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162500 - BLOCK
      ?auto_162501 - BLOCK
      ?auto_162502 - BLOCK
      ?auto_162503 - BLOCK
      ?auto_162504 - BLOCK
      ?auto_162505 - BLOCK
      ?auto_162506 - BLOCK
      ?auto_162507 - BLOCK
      ?auto_162508 - BLOCK
      ?auto_162509 - BLOCK
    )
    :vars
    (
      ?auto_162510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162509 ?auto_162510 ) ( ON-TABLE ?auto_162500 ) ( ON ?auto_162501 ?auto_162500 ) ( ON ?auto_162502 ?auto_162501 ) ( ON ?auto_162503 ?auto_162502 ) ( ON ?auto_162504 ?auto_162503 ) ( ON ?auto_162505 ?auto_162504 ) ( ON ?auto_162506 ?auto_162505 ) ( not ( = ?auto_162500 ?auto_162501 ) ) ( not ( = ?auto_162500 ?auto_162502 ) ) ( not ( = ?auto_162500 ?auto_162503 ) ) ( not ( = ?auto_162500 ?auto_162504 ) ) ( not ( = ?auto_162500 ?auto_162505 ) ) ( not ( = ?auto_162500 ?auto_162506 ) ) ( not ( = ?auto_162500 ?auto_162507 ) ) ( not ( = ?auto_162500 ?auto_162508 ) ) ( not ( = ?auto_162500 ?auto_162509 ) ) ( not ( = ?auto_162500 ?auto_162510 ) ) ( not ( = ?auto_162501 ?auto_162502 ) ) ( not ( = ?auto_162501 ?auto_162503 ) ) ( not ( = ?auto_162501 ?auto_162504 ) ) ( not ( = ?auto_162501 ?auto_162505 ) ) ( not ( = ?auto_162501 ?auto_162506 ) ) ( not ( = ?auto_162501 ?auto_162507 ) ) ( not ( = ?auto_162501 ?auto_162508 ) ) ( not ( = ?auto_162501 ?auto_162509 ) ) ( not ( = ?auto_162501 ?auto_162510 ) ) ( not ( = ?auto_162502 ?auto_162503 ) ) ( not ( = ?auto_162502 ?auto_162504 ) ) ( not ( = ?auto_162502 ?auto_162505 ) ) ( not ( = ?auto_162502 ?auto_162506 ) ) ( not ( = ?auto_162502 ?auto_162507 ) ) ( not ( = ?auto_162502 ?auto_162508 ) ) ( not ( = ?auto_162502 ?auto_162509 ) ) ( not ( = ?auto_162502 ?auto_162510 ) ) ( not ( = ?auto_162503 ?auto_162504 ) ) ( not ( = ?auto_162503 ?auto_162505 ) ) ( not ( = ?auto_162503 ?auto_162506 ) ) ( not ( = ?auto_162503 ?auto_162507 ) ) ( not ( = ?auto_162503 ?auto_162508 ) ) ( not ( = ?auto_162503 ?auto_162509 ) ) ( not ( = ?auto_162503 ?auto_162510 ) ) ( not ( = ?auto_162504 ?auto_162505 ) ) ( not ( = ?auto_162504 ?auto_162506 ) ) ( not ( = ?auto_162504 ?auto_162507 ) ) ( not ( = ?auto_162504 ?auto_162508 ) ) ( not ( = ?auto_162504 ?auto_162509 ) ) ( not ( = ?auto_162504 ?auto_162510 ) ) ( not ( = ?auto_162505 ?auto_162506 ) ) ( not ( = ?auto_162505 ?auto_162507 ) ) ( not ( = ?auto_162505 ?auto_162508 ) ) ( not ( = ?auto_162505 ?auto_162509 ) ) ( not ( = ?auto_162505 ?auto_162510 ) ) ( not ( = ?auto_162506 ?auto_162507 ) ) ( not ( = ?auto_162506 ?auto_162508 ) ) ( not ( = ?auto_162506 ?auto_162509 ) ) ( not ( = ?auto_162506 ?auto_162510 ) ) ( not ( = ?auto_162507 ?auto_162508 ) ) ( not ( = ?auto_162507 ?auto_162509 ) ) ( not ( = ?auto_162507 ?auto_162510 ) ) ( not ( = ?auto_162508 ?auto_162509 ) ) ( not ( = ?auto_162508 ?auto_162510 ) ) ( not ( = ?auto_162509 ?auto_162510 ) ) ( ON ?auto_162508 ?auto_162509 ) ( CLEAR ?auto_162506 ) ( ON ?auto_162507 ?auto_162508 ) ( CLEAR ?auto_162507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162500 ?auto_162501 ?auto_162502 ?auto_162503 ?auto_162504 ?auto_162505 ?auto_162506 ?auto_162507 )
      ( MAKE-10PILE ?auto_162500 ?auto_162501 ?auto_162502 ?auto_162503 ?auto_162504 ?auto_162505 ?auto_162506 ?auto_162507 ?auto_162508 ?auto_162509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162542 - BLOCK
      ?auto_162543 - BLOCK
      ?auto_162544 - BLOCK
      ?auto_162545 - BLOCK
      ?auto_162546 - BLOCK
      ?auto_162547 - BLOCK
      ?auto_162548 - BLOCK
      ?auto_162549 - BLOCK
      ?auto_162550 - BLOCK
      ?auto_162551 - BLOCK
    )
    :vars
    (
      ?auto_162552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162551 ?auto_162552 ) ( ON-TABLE ?auto_162542 ) ( ON ?auto_162543 ?auto_162542 ) ( ON ?auto_162544 ?auto_162543 ) ( ON ?auto_162545 ?auto_162544 ) ( ON ?auto_162546 ?auto_162545 ) ( ON ?auto_162547 ?auto_162546 ) ( not ( = ?auto_162542 ?auto_162543 ) ) ( not ( = ?auto_162542 ?auto_162544 ) ) ( not ( = ?auto_162542 ?auto_162545 ) ) ( not ( = ?auto_162542 ?auto_162546 ) ) ( not ( = ?auto_162542 ?auto_162547 ) ) ( not ( = ?auto_162542 ?auto_162548 ) ) ( not ( = ?auto_162542 ?auto_162549 ) ) ( not ( = ?auto_162542 ?auto_162550 ) ) ( not ( = ?auto_162542 ?auto_162551 ) ) ( not ( = ?auto_162542 ?auto_162552 ) ) ( not ( = ?auto_162543 ?auto_162544 ) ) ( not ( = ?auto_162543 ?auto_162545 ) ) ( not ( = ?auto_162543 ?auto_162546 ) ) ( not ( = ?auto_162543 ?auto_162547 ) ) ( not ( = ?auto_162543 ?auto_162548 ) ) ( not ( = ?auto_162543 ?auto_162549 ) ) ( not ( = ?auto_162543 ?auto_162550 ) ) ( not ( = ?auto_162543 ?auto_162551 ) ) ( not ( = ?auto_162543 ?auto_162552 ) ) ( not ( = ?auto_162544 ?auto_162545 ) ) ( not ( = ?auto_162544 ?auto_162546 ) ) ( not ( = ?auto_162544 ?auto_162547 ) ) ( not ( = ?auto_162544 ?auto_162548 ) ) ( not ( = ?auto_162544 ?auto_162549 ) ) ( not ( = ?auto_162544 ?auto_162550 ) ) ( not ( = ?auto_162544 ?auto_162551 ) ) ( not ( = ?auto_162544 ?auto_162552 ) ) ( not ( = ?auto_162545 ?auto_162546 ) ) ( not ( = ?auto_162545 ?auto_162547 ) ) ( not ( = ?auto_162545 ?auto_162548 ) ) ( not ( = ?auto_162545 ?auto_162549 ) ) ( not ( = ?auto_162545 ?auto_162550 ) ) ( not ( = ?auto_162545 ?auto_162551 ) ) ( not ( = ?auto_162545 ?auto_162552 ) ) ( not ( = ?auto_162546 ?auto_162547 ) ) ( not ( = ?auto_162546 ?auto_162548 ) ) ( not ( = ?auto_162546 ?auto_162549 ) ) ( not ( = ?auto_162546 ?auto_162550 ) ) ( not ( = ?auto_162546 ?auto_162551 ) ) ( not ( = ?auto_162546 ?auto_162552 ) ) ( not ( = ?auto_162547 ?auto_162548 ) ) ( not ( = ?auto_162547 ?auto_162549 ) ) ( not ( = ?auto_162547 ?auto_162550 ) ) ( not ( = ?auto_162547 ?auto_162551 ) ) ( not ( = ?auto_162547 ?auto_162552 ) ) ( not ( = ?auto_162548 ?auto_162549 ) ) ( not ( = ?auto_162548 ?auto_162550 ) ) ( not ( = ?auto_162548 ?auto_162551 ) ) ( not ( = ?auto_162548 ?auto_162552 ) ) ( not ( = ?auto_162549 ?auto_162550 ) ) ( not ( = ?auto_162549 ?auto_162551 ) ) ( not ( = ?auto_162549 ?auto_162552 ) ) ( not ( = ?auto_162550 ?auto_162551 ) ) ( not ( = ?auto_162550 ?auto_162552 ) ) ( not ( = ?auto_162551 ?auto_162552 ) ) ( ON ?auto_162550 ?auto_162551 ) ( ON ?auto_162549 ?auto_162550 ) ( CLEAR ?auto_162547 ) ( ON ?auto_162548 ?auto_162549 ) ( CLEAR ?auto_162548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162542 ?auto_162543 ?auto_162544 ?auto_162545 ?auto_162546 ?auto_162547 ?auto_162548 )
      ( MAKE-10PILE ?auto_162542 ?auto_162543 ?auto_162544 ?auto_162545 ?auto_162546 ?auto_162547 ?auto_162548 ?auto_162549 ?auto_162550 ?auto_162551 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162584 - BLOCK
      ?auto_162585 - BLOCK
      ?auto_162586 - BLOCK
      ?auto_162587 - BLOCK
      ?auto_162588 - BLOCK
      ?auto_162589 - BLOCK
      ?auto_162590 - BLOCK
      ?auto_162591 - BLOCK
      ?auto_162592 - BLOCK
      ?auto_162593 - BLOCK
    )
    :vars
    (
      ?auto_162594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162593 ?auto_162594 ) ( ON-TABLE ?auto_162584 ) ( ON ?auto_162585 ?auto_162584 ) ( ON ?auto_162586 ?auto_162585 ) ( ON ?auto_162587 ?auto_162586 ) ( ON ?auto_162588 ?auto_162587 ) ( not ( = ?auto_162584 ?auto_162585 ) ) ( not ( = ?auto_162584 ?auto_162586 ) ) ( not ( = ?auto_162584 ?auto_162587 ) ) ( not ( = ?auto_162584 ?auto_162588 ) ) ( not ( = ?auto_162584 ?auto_162589 ) ) ( not ( = ?auto_162584 ?auto_162590 ) ) ( not ( = ?auto_162584 ?auto_162591 ) ) ( not ( = ?auto_162584 ?auto_162592 ) ) ( not ( = ?auto_162584 ?auto_162593 ) ) ( not ( = ?auto_162584 ?auto_162594 ) ) ( not ( = ?auto_162585 ?auto_162586 ) ) ( not ( = ?auto_162585 ?auto_162587 ) ) ( not ( = ?auto_162585 ?auto_162588 ) ) ( not ( = ?auto_162585 ?auto_162589 ) ) ( not ( = ?auto_162585 ?auto_162590 ) ) ( not ( = ?auto_162585 ?auto_162591 ) ) ( not ( = ?auto_162585 ?auto_162592 ) ) ( not ( = ?auto_162585 ?auto_162593 ) ) ( not ( = ?auto_162585 ?auto_162594 ) ) ( not ( = ?auto_162586 ?auto_162587 ) ) ( not ( = ?auto_162586 ?auto_162588 ) ) ( not ( = ?auto_162586 ?auto_162589 ) ) ( not ( = ?auto_162586 ?auto_162590 ) ) ( not ( = ?auto_162586 ?auto_162591 ) ) ( not ( = ?auto_162586 ?auto_162592 ) ) ( not ( = ?auto_162586 ?auto_162593 ) ) ( not ( = ?auto_162586 ?auto_162594 ) ) ( not ( = ?auto_162587 ?auto_162588 ) ) ( not ( = ?auto_162587 ?auto_162589 ) ) ( not ( = ?auto_162587 ?auto_162590 ) ) ( not ( = ?auto_162587 ?auto_162591 ) ) ( not ( = ?auto_162587 ?auto_162592 ) ) ( not ( = ?auto_162587 ?auto_162593 ) ) ( not ( = ?auto_162587 ?auto_162594 ) ) ( not ( = ?auto_162588 ?auto_162589 ) ) ( not ( = ?auto_162588 ?auto_162590 ) ) ( not ( = ?auto_162588 ?auto_162591 ) ) ( not ( = ?auto_162588 ?auto_162592 ) ) ( not ( = ?auto_162588 ?auto_162593 ) ) ( not ( = ?auto_162588 ?auto_162594 ) ) ( not ( = ?auto_162589 ?auto_162590 ) ) ( not ( = ?auto_162589 ?auto_162591 ) ) ( not ( = ?auto_162589 ?auto_162592 ) ) ( not ( = ?auto_162589 ?auto_162593 ) ) ( not ( = ?auto_162589 ?auto_162594 ) ) ( not ( = ?auto_162590 ?auto_162591 ) ) ( not ( = ?auto_162590 ?auto_162592 ) ) ( not ( = ?auto_162590 ?auto_162593 ) ) ( not ( = ?auto_162590 ?auto_162594 ) ) ( not ( = ?auto_162591 ?auto_162592 ) ) ( not ( = ?auto_162591 ?auto_162593 ) ) ( not ( = ?auto_162591 ?auto_162594 ) ) ( not ( = ?auto_162592 ?auto_162593 ) ) ( not ( = ?auto_162592 ?auto_162594 ) ) ( not ( = ?auto_162593 ?auto_162594 ) ) ( ON ?auto_162592 ?auto_162593 ) ( ON ?auto_162591 ?auto_162592 ) ( ON ?auto_162590 ?auto_162591 ) ( CLEAR ?auto_162588 ) ( ON ?auto_162589 ?auto_162590 ) ( CLEAR ?auto_162589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162584 ?auto_162585 ?auto_162586 ?auto_162587 ?auto_162588 ?auto_162589 )
      ( MAKE-10PILE ?auto_162584 ?auto_162585 ?auto_162586 ?auto_162587 ?auto_162588 ?auto_162589 ?auto_162590 ?auto_162591 ?auto_162592 ?auto_162593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162626 - BLOCK
      ?auto_162627 - BLOCK
      ?auto_162628 - BLOCK
      ?auto_162629 - BLOCK
      ?auto_162630 - BLOCK
      ?auto_162631 - BLOCK
      ?auto_162632 - BLOCK
      ?auto_162633 - BLOCK
      ?auto_162634 - BLOCK
      ?auto_162635 - BLOCK
    )
    :vars
    (
      ?auto_162636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162635 ?auto_162636 ) ( ON-TABLE ?auto_162626 ) ( ON ?auto_162627 ?auto_162626 ) ( ON ?auto_162628 ?auto_162627 ) ( ON ?auto_162629 ?auto_162628 ) ( not ( = ?auto_162626 ?auto_162627 ) ) ( not ( = ?auto_162626 ?auto_162628 ) ) ( not ( = ?auto_162626 ?auto_162629 ) ) ( not ( = ?auto_162626 ?auto_162630 ) ) ( not ( = ?auto_162626 ?auto_162631 ) ) ( not ( = ?auto_162626 ?auto_162632 ) ) ( not ( = ?auto_162626 ?auto_162633 ) ) ( not ( = ?auto_162626 ?auto_162634 ) ) ( not ( = ?auto_162626 ?auto_162635 ) ) ( not ( = ?auto_162626 ?auto_162636 ) ) ( not ( = ?auto_162627 ?auto_162628 ) ) ( not ( = ?auto_162627 ?auto_162629 ) ) ( not ( = ?auto_162627 ?auto_162630 ) ) ( not ( = ?auto_162627 ?auto_162631 ) ) ( not ( = ?auto_162627 ?auto_162632 ) ) ( not ( = ?auto_162627 ?auto_162633 ) ) ( not ( = ?auto_162627 ?auto_162634 ) ) ( not ( = ?auto_162627 ?auto_162635 ) ) ( not ( = ?auto_162627 ?auto_162636 ) ) ( not ( = ?auto_162628 ?auto_162629 ) ) ( not ( = ?auto_162628 ?auto_162630 ) ) ( not ( = ?auto_162628 ?auto_162631 ) ) ( not ( = ?auto_162628 ?auto_162632 ) ) ( not ( = ?auto_162628 ?auto_162633 ) ) ( not ( = ?auto_162628 ?auto_162634 ) ) ( not ( = ?auto_162628 ?auto_162635 ) ) ( not ( = ?auto_162628 ?auto_162636 ) ) ( not ( = ?auto_162629 ?auto_162630 ) ) ( not ( = ?auto_162629 ?auto_162631 ) ) ( not ( = ?auto_162629 ?auto_162632 ) ) ( not ( = ?auto_162629 ?auto_162633 ) ) ( not ( = ?auto_162629 ?auto_162634 ) ) ( not ( = ?auto_162629 ?auto_162635 ) ) ( not ( = ?auto_162629 ?auto_162636 ) ) ( not ( = ?auto_162630 ?auto_162631 ) ) ( not ( = ?auto_162630 ?auto_162632 ) ) ( not ( = ?auto_162630 ?auto_162633 ) ) ( not ( = ?auto_162630 ?auto_162634 ) ) ( not ( = ?auto_162630 ?auto_162635 ) ) ( not ( = ?auto_162630 ?auto_162636 ) ) ( not ( = ?auto_162631 ?auto_162632 ) ) ( not ( = ?auto_162631 ?auto_162633 ) ) ( not ( = ?auto_162631 ?auto_162634 ) ) ( not ( = ?auto_162631 ?auto_162635 ) ) ( not ( = ?auto_162631 ?auto_162636 ) ) ( not ( = ?auto_162632 ?auto_162633 ) ) ( not ( = ?auto_162632 ?auto_162634 ) ) ( not ( = ?auto_162632 ?auto_162635 ) ) ( not ( = ?auto_162632 ?auto_162636 ) ) ( not ( = ?auto_162633 ?auto_162634 ) ) ( not ( = ?auto_162633 ?auto_162635 ) ) ( not ( = ?auto_162633 ?auto_162636 ) ) ( not ( = ?auto_162634 ?auto_162635 ) ) ( not ( = ?auto_162634 ?auto_162636 ) ) ( not ( = ?auto_162635 ?auto_162636 ) ) ( ON ?auto_162634 ?auto_162635 ) ( ON ?auto_162633 ?auto_162634 ) ( ON ?auto_162632 ?auto_162633 ) ( ON ?auto_162631 ?auto_162632 ) ( CLEAR ?auto_162629 ) ( ON ?auto_162630 ?auto_162631 ) ( CLEAR ?auto_162630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162626 ?auto_162627 ?auto_162628 ?auto_162629 ?auto_162630 )
      ( MAKE-10PILE ?auto_162626 ?auto_162627 ?auto_162628 ?auto_162629 ?auto_162630 ?auto_162631 ?auto_162632 ?auto_162633 ?auto_162634 ?auto_162635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162668 - BLOCK
      ?auto_162669 - BLOCK
      ?auto_162670 - BLOCK
      ?auto_162671 - BLOCK
      ?auto_162672 - BLOCK
      ?auto_162673 - BLOCK
      ?auto_162674 - BLOCK
      ?auto_162675 - BLOCK
      ?auto_162676 - BLOCK
      ?auto_162677 - BLOCK
    )
    :vars
    (
      ?auto_162678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162677 ?auto_162678 ) ( ON-TABLE ?auto_162668 ) ( ON ?auto_162669 ?auto_162668 ) ( ON ?auto_162670 ?auto_162669 ) ( not ( = ?auto_162668 ?auto_162669 ) ) ( not ( = ?auto_162668 ?auto_162670 ) ) ( not ( = ?auto_162668 ?auto_162671 ) ) ( not ( = ?auto_162668 ?auto_162672 ) ) ( not ( = ?auto_162668 ?auto_162673 ) ) ( not ( = ?auto_162668 ?auto_162674 ) ) ( not ( = ?auto_162668 ?auto_162675 ) ) ( not ( = ?auto_162668 ?auto_162676 ) ) ( not ( = ?auto_162668 ?auto_162677 ) ) ( not ( = ?auto_162668 ?auto_162678 ) ) ( not ( = ?auto_162669 ?auto_162670 ) ) ( not ( = ?auto_162669 ?auto_162671 ) ) ( not ( = ?auto_162669 ?auto_162672 ) ) ( not ( = ?auto_162669 ?auto_162673 ) ) ( not ( = ?auto_162669 ?auto_162674 ) ) ( not ( = ?auto_162669 ?auto_162675 ) ) ( not ( = ?auto_162669 ?auto_162676 ) ) ( not ( = ?auto_162669 ?auto_162677 ) ) ( not ( = ?auto_162669 ?auto_162678 ) ) ( not ( = ?auto_162670 ?auto_162671 ) ) ( not ( = ?auto_162670 ?auto_162672 ) ) ( not ( = ?auto_162670 ?auto_162673 ) ) ( not ( = ?auto_162670 ?auto_162674 ) ) ( not ( = ?auto_162670 ?auto_162675 ) ) ( not ( = ?auto_162670 ?auto_162676 ) ) ( not ( = ?auto_162670 ?auto_162677 ) ) ( not ( = ?auto_162670 ?auto_162678 ) ) ( not ( = ?auto_162671 ?auto_162672 ) ) ( not ( = ?auto_162671 ?auto_162673 ) ) ( not ( = ?auto_162671 ?auto_162674 ) ) ( not ( = ?auto_162671 ?auto_162675 ) ) ( not ( = ?auto_162671 ?auto_162676 ) ) ( not ( = ?auto_162671 ?auto_162677 ) ) ( not ( = ?auto_162671 ?auto_162678 ) ) ( not ( = ?auto_162672 ?auto_162673 ) ) ( not ( = ?auto_162672 ?auto_162674 ) ) ( not ( = ?auto_162672 ?auto_162675 ) ) ( not ( = ?auto_162672 ?auto_162676 ) ) ( not ( = ?auto_162672 ?auto_162677 ) ) ( not ( = ?auto_162672 ?auto_162678 ) ) ( not ( = ?auto_162673 ?auto_162674 ) ) ( not ( = ?auto_162673 ?auto_162675 ) ) ( not ( = ?auto_162673 ?auto_162676 ) ) ( not ( = ?auto_162673 ?auto_162677 ) ) ( not ( = ?auto_162673 ?auto_162678 ) ) ( not ( = ?auto_162674 ?auto_162675 ) ) ( not ( = ?auto_162674 ?auto_162676 ) ) ( not ( = ?auto_162674 ?auto_162677 ) ) ( not ( = ?auto_162674 ?auto_162678 ) ) ( not ( = ?auto_162675 ?auto_162676 ) ) ( not ( = ?auto_162675 ?auto_162677 ) ) ( not ( = ?auto_162675 ?auto_162678 ) ) ( not ( = ?auto_162676 ?auto_162677 ) ) ( not ( = ?auto_162676 ?auto_162678 ) ) ( not ( = ?auto_162677 ?auto_162678 ) ) ( ON ?auto_162676 ?auto_162677 ) ( ON ?auto_162675 ?auto_162676 ) ( ON ?auto_162674 ?auto_162675 ) ( ON ?auto_162673 ?auto_162674 ) ( ON ?auto_162672 ?auto_162673 ) ( CLEAR ?auto_162670 ) ( ON ?auto_162671 ?auto_162672 ) ( CLEAR ?auto_162671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 )
      ( MAKE-10PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 ?auto_162672 ?auto_162673 ?auto_162674 ?auto_162675 ?auto_162676 ?auto_162677 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162710 - BLOCK
      ?auto_162711 - BLOCK
      ?auto_162712 - BLOCK
      ?auto_162713 - BLOCK
      ?auto_162714 - BLOCK
      ?auto_162715 - BLOCK
      ?auto_162716 - BLOCK
      ?auto_162717 - BLOCK
      ?auto_162718 - BLOCK
      ?auto_162719 - BLOCK
    )
    :vars
    (
      ?auto_162720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162719 ?auto_162720 ) ( ON-TABLE ?auto_162710 ) ( ON ?auto_162711 ?auto_162710 ) ( not ( = ?auto_162710 ?auto_162711 ) ) ( not ( = ?auto_162710 ?auto_162712 ) ) ( not ( = ?auto_162710 ?auto_162713 ) ) ( not ( = ?auto_162710 ?auto_162714 ) ) ( not ( = ?auto_162710 ?auto_162715 ) ) ( not ( = ?auto_162710 ?auto_162716 ) ) ( not ( = ?auto_162710 ?auto_162717 ) ) ( not ( = ?auto_162710 ?auto_162718 ) ) ( not ( = ?auto_162710 ?auto_162719 ) ) ( not ( = ?auto_162710 ?auto_162720 ) ) ( not ( = ?auto_162711 ?auto_162712 ) ) ( not ( = ?auto_162711 ?auto_162713 ) ) ( not ( = ?auto_162711 ?auto_162714 ) ) ( not ( = ?auto_162711 ?auto_162715 ) ) ( not ( = ?auto_162711 ?auto_162716 ) ) ( not ( = ?auto_162711 ?auto_162717 ) ) ( not ( = ?auto_162711 ?auto_162718 ) ) ( not ( = ?auto_162711 ?auto_162719 ) ) ( not ( = ?auto_162711 ?auto_162720 ) ) ( not ( = ?auto_162712 ?auto_162713 ) ) ( not ( = ?auto_162712 ?auto_162714 ) ) ( not ( = ?auto_162712 ?auto_162715 ) ) ( not ( = ?auto_162712 ?auto_162716 ) ) ( not ( = ?auto_162712 ?auto_162717 ) ) ( not ( = ?auto_162712 ?auto_162718 ) ) ( not ( = ?auto_162712 ?auto_162719 ) ) ( not ( = ?auto_162712 ?auto_162720 ) ) ( not ( = ?auto_162713 ?auto_162714 ) ) ( not ( = ?auto_162713 ?auto_162715 ) ) ( not ( = ?auto_162713 ?auto_162716 ) ) ( not ( = ?auto_162713 ?auto_162717 ) ) ( not ( = ?auto_162713 ?auto_162718 ) ) ( not ( = ?auto_162713 ?auto_162719 ) ) ( not ( = ?auto_162713 ?auto_162720 ) ) ( not ( = ?auto_162714 ?auto_162715 ) ) ( not ( = ?auto_162714 ?auto_162716 ) ) ( not ( = ?auto_162714 ?auto_162717 ) ) ( not ( = ?auto_162714 ?auto_162718 ) ) ( not ( = ?auto_162714 ?auto_162719 ) ) ( not ( = ?auto_162714 ?auto_162720 ) ) ( not ( = ?auto_162715 ?auto_162716 ) ) ( not ( = ?auto_162715 ?auto_162717 ) ) ( not ( = ?auto_162715 ?auto_162718 ) ) ( not ( = ?auto_162715 ?auto_162719 ) ) ( not ( = ?auto_162715 ?auto_162720 ) ) ( not ( = ?auto_162716 ?auto_162717 ) ) ( not ( = ?auto_162716 ?auto_162718 ) ) ( not ( = ?auto_162716 ?auto_162719 ) ) ( not ( = ?auto_162716 ?auto_162720 ) ) ( not ( = ?auto_162717 ?auto_162718 ) ) ( not ( = ?auto_162717 ?auto_162719 ) ) ( not ( = ?auto_162717 ?auto_162720 ) ) ( not ( = ?auto_162718 ?auto_162719 ) ) ( not ( = ?auto_162718 ?auto_162720 ) ) ( not ( = ?auto_162719 ?auto_162720 ) ) ( ON ?auto_162718 ?auto_162719 ) ( ON ?auto_162717 ?auto_162718 ) ( ON ?auto_162716 ?auto_162717 ) ( ON ?auto_162715 ?auto_162716 ) ( ON ?auto_162714 ?auto_162715 ) ( ON ?auto_162713 ?auto_162714 ) ( CLEAR ?auto_162711 ) ( ON ?auto_162712 ?auto_162713 ) ( CLEAR ?auto_162712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162710 ?auto_162711 ?auto_162712 )
      ( MAKE-10PILE ?auto_162710 ?auto_162711 ?auto_162712 ?auto_162713 ?auto_162714 ?auto_162715 ?auto_162716 ?auto_162717 ?auto_162718 ?auto_162719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162752 - BLOCK
      ?auto_162753 - BLOCK
      ?auto_162754 - BLOCK
      ?auto_162755 - BLOCK
      ?auto_162756 - BLOCK
      ?auto_162757 - BLOCK
      ?auto_162758 - BLOCK
      ?auto_162759 - BLOCK
      ?auto_162760 - BLOCK
      ?auto_162761 - BLOCK
    )
    :vars
    (
      ?auto_162762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162761 ?auto_162762 ) ( ON-TABLE ?auto_162752 ) ( not ( = ?auto_162752 ?auto_162753 ) ) ( not ( = ?auto_162752 ?auto_162754 ) ) ( not ( = ?auto_162752 ?auto_162755 ) ) ( not ( = ?auto_162752 ?auto_162756 ) ) ( not ( = ?auto_162752 ?auto_162757 ) ) ( not ( = ?auto_162752 ?auto_162758 ) ) ( not ( = ?auto_162752 ?auto_162759 ) ) ( not ( = ?auto_162752 ?auto_162760 ) ) ( not ( = ?auto_162752 ?auto_162761 ) ) ( not ( = ?auto_162752 ?auto_162762 ) ) ( not ( = ?auto_162753 ?auto_162754 ) ) ( not ( = ?auto_162753 ?auto_162755 ) ) ( not ( = ?auto_162753 ?auto_162756 ) ) ( not ( = ?auto_162753 ?auto_162757 ) ) ( not ( = ?auto_162753 ?auto_162758 ) ) ( not ( = ?auto_162753 ?auto_162759 ) ) ( not ( = ?auto_162753 ?auto_162760 ) ) ( not ( = ?auto_162753 ?auto_162761 ) ) ( not ( = ?auto_162753 ?auto_162762 ) ) ( not ( = ?auto_162754 ?auto_162755 ) ) ( not ( = ?auto_162754 ?auto_162756 ) ) ( not ( = ?auto_162754 ?auto_162757 ) ) ( not ( = ?auto_162754 ?auto_162758 ) ) ( not ( = ?auto_162754 ?auto_162759 ) ) ( not ( = ?auto_162754 ?auto_162760 ) ) ( not ( = ?auto_162754 ?auto_162761 ) ) ( not ( = ?auto_162754 ?auto_162762 ) ) ( not ( = ?auto_162755 ?auto_162756 ) ) ( not ( = ?auto_162755 ?auto_162757 ) ) ( not ( = ?auto_162755 ?auto_162758 ) ) ( not ( = ?auto_162755 ?auto_162759 ) ) ( not ( = ?auto_162755 ?auto_162760 ) ) ( not ( = ?auto_162755 ?auto_162761 ) ) ( not ( = ?auto_162755 ?auto_162762 ) ) ( not ( = ?auto_162756 ?auto_162757 ) ) ( not ( = ?auto_162756 ?auto_162758 ) ) ( not ( = ?auto_162756 ?auto_162759 ) ) ( not ( = ?auto_162756 ?auto_162760 ) ) ( not ( = ?auto_162756 ?auto_162761 ) ) ( not ( = ?auto_162756 ?auto_162762 ) ) ( not ( = ?auto_162757 ?auto_162758 ) ) ( not ( = ?auto_162757 ?auto_162759 ) ) ( not ( = ?auto_162757 ?auto_162760 ) ) ( not ( = ?auto_162757 ?auto_162761 ) ) ( not ( = ?auto_162757 ?auto_162762 ) ) ( not ( = ?auto_162758 ?auto_162759 ) ) ( not ( = ?auto_162758 ?auto_162760 ) ) ( not ( = ?auto_162758 ?auto_162761 ) ) ( not ( = ?auto_162758 ?auto_162762 ) ) ( not ( = ?auto_162759 ?auto_162760 ) ) ( not ( = ?auto_162759 ?auto_162761 ) ) ( not ( = ?auto_162759 ?auto_162762 ) ) ( not ( = ?auto_162760 ?auto_162761 ) ) ( not ( = ?auto_162760 ?auto_162762 ) ) ( not ( = ?auto_162761 ?auto_162762 ) ) ( ON ?auto_162760 ?auto_162761 ) ( ON ?auto_162759 ?auto_162760 ) ( ON ?auto_162758 ?auto_162759 ) ( ON ?auto_162757 ?auto_162758 ) ( ON ?auto_162756 ?auto_162757 ) ( ON ?auto_162755 ?auto_162756 ) ( ON ?auto_162754 ?auto_162755 ) ( CLEAR ?auto_162752 ) ( ON ?auto_162753 ?auto_162754 ) ( CLEAR ?auto_162753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162752 ?auto_162753 )
      ( MAKE-10PILE ?auto_162752 ?auto_162753 ?auto_162754 ?auto_162755 ?auto_162756 ?auto_162757 ?auto_162758 ?auto_162759 ?auto_162760 ?auto_162761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162794 - BLOCK
      ?auto_162795 - BLOCK
      ?auto_162796 - BLOCK
      ?auto_162797 - BLOCK
      ?auto_162798 - BLOCK
      ?auto_162799 - BLOCK
      ?auto_162800 - BLOCK
      ?auto_162801 - BLOCK
      ?auto_162802 - BLOCK
      ?auto_162803 - BLOCK
    )
    :vars
    (
      ?auto_162804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162803 ?auto_162804 ) ( not ( = ?auto_162794 ?auto_162795 ) ) ( not ( = ?auto_162794 ?auto_162796 ) ) ( not ( = ?auto_162794 ?auto_162797 ) ) ( not ( = ?auto_162794 ?auto_162798 ) ) ( not ( = ?auto_162794 ?auto_162799 ) ) ( not ( = ?auto_162794 ?auto_162800 ) ) ( not ( = ?auto_162794 ?auto_162801 ) ) ( not ( = ?auto_162794 ?auto_162802 ) ) ( not ( = ?auto_162794 ?auto_162803 ) ) ( not ( = ?auto_162794 ?auto_162804 ) ) ( not ( = ?auto_162795 ?auto_162796 ) ) ( not ( = ?auto_162795 ?auto_162797 ) ) ( not ( = ?auto_162795 ?auto_162798 ) ) ( not ( = ?auto_162795 ?auto_162799 ) ) ( not ( = ?auto_162795 ?auto_162800 ) ) ( not ( = ?auto_162795 ?auto_162801 ) ) ( not ( = ?auto_162795 ?auto_162802 ) ) ( not ( = ?auto_162795 ?auto_162803 ) ) ( not ( = ?auto_162795 ?auto_162804 ) ) ( not ( = ?auto_162796 ?auto_162797 ) ) ( not ( = ?auto_162796 ?auto_162798 ) ) ( not ( = ?auto_162796 ?auto_162799 ) ) ( not ( = ?auto_162796 ?auto_162800 ) ) ( not ( = ?auto_162796 ?auto_162801 ) ) ( not ( = ?auto_162796 ?auto_162802 ) ) ( not ( = ?auto_162796 ?auto_162803 ) ) ( not ( = ?auto_162796 ?auto_162804 ) ) ( not ( = ?auto_162797 ?auto_162798 ) ) ( not ( = ?auto_162797 ?auto_162799 ) ) ( not ( = ?auto_162797 ?auto_162800 ) ) ( not ( = ?auto_162797 ?auto_162801 ) ) ( not ( = ?auto_162797 ?auto_162802 ) ) ( not ( = ?auto_162797 ?auto_162803 ) ) ( not ( = ?auto_162797 ?auto_162804 ) ) ( not ( = ?auto_162798 ?auto_162799 ) ) ( not ( = ?auto_162798 ?auto_162800 ) ) ( not ( = ?auto_162798 ?auto_162801 ) ) ( not ( = ?auto_162798 ?auto_162802 ) ) ( not ( = ?auto_162798 ?auto_162803 ) ) ( not ( = ?auto_162798 ?auto_162804 ) ) ( not ( = ?auto_162799 ?auto_162800 ) ) ( not ( = ?auto_162799 ?auto_162801 ) ) ( not ( = ?auto_162799 ?auto_162802 ) ) ( not ( = ?auto_162799 ?auto_162803 ) ) ( not ( = ?auto_162799 ?auto_162804 ) ) ( not ( = ?auto_162800 ?auto_162801 ) ) ( not ( = ?auto_162800 ?auto_162802 ) ) ( not ( = ?auto_162800 ?auto_162803 ) ) ( not ( = ?auto_162800 ?auto_162804 ) ) ( not ( = ?auto_162801 ?auto_162802 ) ) ( not ( = ?auto_162801 ?auto_162803 ) ) ( not ( = ?auto_162801 ?auto_162804 ) ) ( not ( = ?auto_162802 ?auto_162803 ) ) ( not ( = ?auto_162802 ?auto_162804 ) ) ( not ( = ?auto_162803 ?auto_162804 ) ) ( ON ?auto_162802 ?auto_162803 ) ( ON ?auto_162801 ?auto_162802 ) ( ON ?auto_162800 ?auto_162801 ) ( ON ?auto_162799 ?auto_162800 ) ( ON ?auto_162798 ?auto_162799 ) ( ON ?auto_162797 ?auto_162798 ) ( ON ?auto_162796 ?auto_162797 ) ( ON ?auto_162795 ?auto_162796 ) ( ON ?auto_162794 ?auto_162795 ) ( CLEAR ?auto_162794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162794 )
      ( MAKE-10PILE ?auto_162794 ?auto_162795 ?auto_162796 ?auto_162797 ?auto_162798 ?auto_162799 ?auto_162800 ?auto_162801 ?auto_162802 ?auto_162803 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162837 - BLOCK
      ?auto_162838 - BLOCK
      ?auto_162839 - BLOCK
      ?auto_162840 - BLOCK
      ?auto_162841 - BLOCK
      ?auto_162842 - BLOCK
      ?auto_162843 - BLOCK
      ?auto_162844 - BLOCK
      ?auto_162845 - BLOCK
      ?auto_162846 - BLOCK
      ?auto_162847 - BLOCK
    )
    :vars
    (
      ?auto_162848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162846 ) ( ON ?auto_162847 ?auto_162848 ) ( CLEAR ?auto_162847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162837 ) ( ON ?auto_162838 ?auto_162837 ) ( ON ?auto_162839 ?auto_162838 ) ( ON ?auto_162840 ?auto_162839 ) ( ON ?auto_162841 ?auto_162840 ) ( ON ?auto_162842 ?auto_162841 ) ( ON ?auto_162843 ?auto_162842 ) ( ON ?auto_162844 ?auto_162843 ) ( ON ?auto_162845 ?auto_162844 ) ( ON ?auto_162846 ?auto_162845 ) ( not ( = ?auto_162837 ?auto_162838 ) ) ( not ( = ?auto_162837 ?auto_162839 ) ) ( not ( = ?auto_162837 ?auto_162840 ) ) ( not ( = ?auto_162837 ?auto_162841 ) ) ( not ( = ?auto_162837 ?auto_162842 ) ) ( not ( = ?auto_162837 ?auto_162843 ) ) ( not ( = ?auto_162837 ?auto_162844 ) ) ( not ( = ?auto_162837 ?auto_162845 ) ) ( not ( = ?auto_162837 ?auto_162846 ) ) ( not ( = ?auto_162837 ?auto_162847 ) ) ( not ( = ?auto_162837 ?auto_162848 ) ) ( not ( = ?auto_162838 ?auto_162839 ) ) ( not ( = ?auto_162838 ?auto_162840 ) ) ( not ( = ?auto_162838 ?auto_162841 ) ) ( not ( = ?auto_162838 ?auto_162842 ) ) ( not ( = ?auto_162838 ?auto_162843 ) ) ( not ( = ?auto_162838 ?auto_162844 ) ) ( not ( = ?auto_162838 ?auto_162845 ) ) ( not ( = ?auto_162838 ?auto_162846 ) ) ( not ( = ?auto_162838 ?auto_162847 ) ) ( not ( = ?auto_162838 ?auto_162848 ) ) ( not ( = ?auto_162839 ?auto_162840 ) ) ( not ( = ?auto_162839 ?auto_162841 ) ) ( not ( = ?auto_162839 ?auto_162842 ) ) ( not ( = ?auto_162839 ?auto_162843 ) ) ( not ( = ?auto_162839 ?auto_162844 ) ) ( not ( = ?auto_162839 ?auto_162845 ) ) ( not ( = ?auto_162839 ?auto_162846 ) ) ( not ( = ?auto_162839 ?auto_162847 ) ) ( not ( = ?auto_162839 ?auto_162848 ) ) ( not ( = ?auto_162840 ?auto_162841 ) ) ( not ( = ?auto_162840 ?auto_162842 ) ) ( not ( = ?auto_162840 ?auto_162843 ) ) ( not ( = ?auto_162840 ?auto_162844 ) ) ( not ( = ?auto_162840 ?auto_162845 ) ) ( not ( = ?auto_162840 ?auto_162846 ) ) ( not ( = ?auto_162840 ?auto_162847 ) ) ( not ( = ?auto_162840 ?auto_162848 ) ) ( not ( = ?auto_162841 ?auto_162842 ) ) ( not ( = ?auto_162841 ?auto_162843 ) ) ( not ( = ?auto_162841 ?auto_162844 ) ) ( not ( = ?auto_162841 ?auto_162845 ) ) ( not ( = ?auto_162841 ?auto_162846 ) ) ( not ( = ?auto_162841 ?auto_162847 ) ) ( not ( = ?auto_162841 ?auto_162848 ) ) ( not ( = ?auto_162842 ?auto_162843 ) ) ( not ( = ?auto_162842 ?auto_162844 ) ) ( not ( = ?auto_162842 ?auto_162845 ) ) ( not ( = ?auto_162842 ?auto_162846 ) ) ( not ( = ?auto_162842 ?auto_162847 ) ) ( not ( = ?auto_162842 ?auto_162848 ) ) ( not ( = ?auto_162843 ?auto_162844 ) ) ( not ( = ?auto_162843 ?auto_162845 ) ) ( not ( = ?auto_162843 ?auto_162846 ) ) ( not ( = ?auto_162843 ?auto_162847 ) ) ( not ( = ?auto_162843 ?auto_162848 ) ) ( not ( = ?auto_162844 ?auto_162845 ) ) ( not ( = ?auto_162844 ?auto_162846 ) ) ( not ( = ?auto_162844 ?auto_162847 ) ) ( not ( = ?auto_162844 ?auto_162848 ) ) ( not ( = ?auto_162845 ?auto_162846 ) ) ( not ( = ?auto_162845 ?auto_162847 ) ) ( not ( = ?auto_162845 ?auto_162848 ) ) ( not ( = ?auto_162846 ?auto_162847 ) ) ( not ( = ?auto_162846 ?auto_162848 ) ) ( not ( = ?auto_162847 ?auto_162848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162847 ?auto_162848 )
      ( !STACK ?auto_162847 ?auto_162846 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162883 - BLOCK
      ?auto_162884 - BLOCK
      ?auto_162885 - BLOCK
      ?auto_162886 - BLOCK
      ?auto_162887 - BLOCK
      ?auto_162888 - BLOCK
      ?auto_162889 - BLOCK
      ?auto_162890 - BLOCK
      ?auto_162891 - BLOCK
      ?auto_162892 - BLOCK
      ?auto_162893 - BLOCK
    )
    :vars
    (
      ?auto_162894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162893 ?auto_162894 ) ( ON-TABLE ?auto_162883 ) ( ON ?auto_162884 ?auto_162883 ) ( ON ?auto_162885 ?auto_162884 ) ( ON ?auto_162886 ?auto_162885 ) ( ON ?auto_162887 ?auto_162886 ) ( ON ?auto_162888 ?auto_162887 ) ( ON ?auto_162889 ?auto_162888 ) ( ON ?auto_162890 ?auto_162889 ) ( ON ?auto_162891 ?auto_162890 ) ( not ( = ?auto_162883 ?auto_162884 ) ) ( not ( = ?auto_162883 ?auto_162885 ) ) ( not ( = ?auto_162883 ?auto_162886 ) ) ( not ( = ?auto_162883 ?auto_162887 ) ) ( not ( = ?auto_162883 ?auto_162888 ) ) ( not ( = ?auto_162883 ?auto_162889 ) ) ( not ( = ?auto_162883 ?auto_162890 ) ) ( not ( = ?auto_162883 ?auto_162891 ) ) ( not ( = ?auto_162883 ?auto_162892 ) ) ( not ( = ?auto_162883 ?auto_162893 ) ) ( not ( = ?auto_162883 ?auto_162894 ) ) ( not ( = ?auto_162884 ?auto_162885 ) ) ( not ( = ?auto_162884 ?auto_162886 ) ) ( not ( = ?auto_162884 ?auto_162887 ) ) ( not ( = ?auto_162884 ?auto_162888 ) ) ( not ( = ?auto_162884 ?auto_162889 ) ) ( not ( = ?auto_162884 ?auto_162890 ) ) ( not ( = ?auto_162884 ?auto_162891 ) ) ( not ( = ?auto_162884 ?auto_162892 ) ) ( not ( = ?auto_162884 ?auto_162893 ) ) ( not ( = ?auto_162884 ?auto_162894 ) ) ( not ( = ?auto_162885 ?auto_162886 ) ) ( not ( = ?auto_162885 ?auto_162887 ) ) ( not ( = ?auto_162885 ?auto_162888 ) ) ( not ( = ?auto_162885 ?auto_162889 ) ) ( not ( = ?auto_162885 ?auto_162890 ) ) ( not ( = ?auto_162885 ?auto_162891 ) ) ( not ( = ?auto_162885 ?auto_162892 ) ) ( not ( = ?auto_162885 ?auto_162893 ) ) ( not ( = ?auto_162885 ?auto_162894 ) ) ( not ( = ?auto_162886 ?auto_162887 ) ) ( not ( = ?auto_162886 ?auto_162888 ) ) ( not ( = ?auto_162886 ?auto_162889 ) ) ( not ( = ?auto_162886 ?auto_162890 ) ) ( not ( = ?auto_162886 ?auto_162891 ) ) ( not ( = ?auto_162886 ?auto_162892 ) ) ( not ( = ?auto_162886 ?auto_162893 ) ) ( not ( = ?auto_162886 ?auto_162894 ) ) ( not ( = ?auto_162887 ?auto_162888 ) ) ( not ( = ?auto_162887 ?auto_162889 ) ) ( not ( = ?auto_162887 ?auto_162890 ) ) ( not ( = ?auto_162887 ?auto_162891 ) ) ( not ( = ?auto_162887 ?auto_162892 ) ) ( not ( = ?auto_162887 ?auto_162893 ) ) ( not ( = ?auto_162887 ?auto_162894 ) ) ( not ( = ?auto_162888 ?auto_162889 ) ) ( not ( = ?auto_162888 ?auto_162890 ) ) ( not ( = ?auto_162888 ?auto_162891 ) ) ( not ( = ?auto_162888 ?auto_162892 ) ) ( not ( = ?auto_162888 ?auto_162893 ) ) ( not ( = ?auto_162888 ?auto_162894 ) ) ( not ( = ?auto_162889 ?auto_162890 ) ) ( not ( = ?auto_162889 ?auto_162891 ) ) ( not ( = ?auto_162889 ?auto_162892 ) ) ( not ( = ?auto_162889 ?auto_162893 ) ) ( not ( = ?auto_162889 ?auto_162894 ) ) ( not ( = ?auto_162890 ?auto_162891 ) ) ( not ( = ?auto_162890 ?auto_162892 ) ) ( not ( = ?auto_162890 ?auto_162893 ) ) ( not ( = ?auto_162890 ?auto_162894 ) ) ( not ( = ?auto_162891 ?auto_162892 ) ) ( not ( = ?auto_162891 ?auto_162893 ) ) ( not ( = ?auto_162891 ?auto_162894 ) ) ( not ( = ?auto_162892 ?auto_162893 ) ) ( not ( = ?auto_162892 ?auto_162894 ) ) ( not ( = ?auto_162893 ?auto_162894 ) ) ( CLEAR ?auto_162891 ) ( ON ?auto_162892 ?auto_162893 ) ( CLEAR ?auto_162892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_162883 ?auto_162884 ?auto_162885 ?auto_162886 ?auto_162887 ?auto_162888 ?auto_162889 ?auto_162890 ?auto_162891 ?auto_162892 )
      ( MAKE-11PILE ?auto_162883 ?auto_162884 ?auto_162885 ?auto_162886 ?auto_162887 ?auto_162888 ?auto_162889 ?auto_162890 ?auto_162891 ?auto_162892 ?auto_162893 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162929 - BLOCK
      ?auto_162930 - BLOCK
      ?auto_162931 - BLOCK
      ?auto_162932 - BLOCK
      ?auto_162933 - BLOCK
      ?auto_162934 - BLOCK
      ?auto_162935 - BLOCK
      ?auto_162936 - BLOCK
      ?auto_162937 - BLOCK
      ?auto_162938 - BLOCK
      ?auto_162939 - BLOCK
    )
    :vars
    (
      ?auto_162940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162939 ?auto_162940 ) ( ON-TABLE ?auto_162929 ) ( ON ?auto_162930 ?auto_162929 ) ( ON ?auto_162931 ?auto_162930 ) ( ON ?auto_162932 ?auto_162931 ) ( ON ?auto_162933 ?auto_162932 ) ( ON ?auto_162934 ?auto_162933 ) ( ON ?auto_162935 ?auto_162934 ) ( ON ?auto_162936 ?auto_162935 ) ( not ( = ?auto_162929 ?auto_162930 ) ) ( not ( = ?auto_162929 ?auto_162931 ) ) ( not ( = ?auto_162929 ?auto_162932 ) ) ( not ( = ?auto_162929 ?auto_162933 ) ) ( not ( = ?auto_162929 ?auto_162934 ) ) ( not ( = ?auto_162929 ?auto_162935 ) ) ( not ( = ?auto_162929 ?auto_162936 ) ) ( not ( = ?auto_162929 ?auto_162937 ) ) ( not ( = ?auto_162929 ?auto_162938 ) ) ( not ( = ?auto_162929 ?auto_162939 ) ) ( not ( = ?auto_162929 ?auto_162940 ) ) ( not ( = ?auto_162930 ?auto_162931 ) ) ( not ( = ?auto_162930 ?auto_162932 ) ) ( not ( = ?auto_162930 ?auto_162933 ) ) ( not ( = ?auto_162930 ?auto_162934 ) ) ( not ( = ?auto_162930 ?auto_162935 ) ) ( not ( = ?auto_162930 ?auto_162936 ) ) ( not ( = ?auto_162930 ?auto_162937 ) ) ( not ( = ?auto_162930 ?auto_162938 ) ) ( not ( = ?auto_162930 ?auto_162939 ) ) ( not ( = ?auto_162930 ?auto_162940 ) ) ( not ( = ?auto_162931 ?auto_162932 ) ) ( not ( = ?auto_162931 ?auto_162933 ) ) ( not ( = ?auto_162931 ?auto_162934 ) ) ( not ( = ?auto_162931 ?auto_162935 ) ) ( not ( = ?auto_162931 ?auto_162936 ) ) ( not ( = ?auto_162931 ?auto_162937 ) ) ( not ( = ?auto_162931 ?auto_162938 ) ) ( not ( = ?auto_162931 ?auto_162939 ) ) ( not ( = ?auto_162931 ?auto_162940 ) ) ( not ( = ?auto_162932 ?auto_162933 ) ) ( not ( = ?auto_162932 ?auto_162934 ) ) ( not ( = ?auto_162932 ?auto_162935 ) ) ( not ( = ?auto_162932 ?auto_162936 ) ) ( not ( = ?auto_162932 ?auto_162937 ) ) ( not ( = ?auto_162932 ?auto_162938 ) ) ( not ( = ?auto_162932 ?auto_162939 ) ) ( not ( = ?auto_162932 ?auto_162940 ) ) ( not ( = ?auto_162933 ?auto_162934 ) ) ( not ( = ?auto_162933 ?auto_162935 ) ) ( not ( = ?auto_162933 ?auto_162936 ) ) ( not ( = ?auto_162933 ?auto_162937 ) ) ( not ( = ?auto_162933 ?auto_162938 ) ) ( not ( = ?auto_162933 ?auto_162939 ) ) ( not ( = ?auto_162933 ?auto_162940 ) ) ( not ( = ?auto_162934 ?auto_162935 ) ) ( not ( = ?auto_162934 ?auto_162936 ) ) ( not ( = ?auto_162934 ?auto_162937 ) ) ( not ( = ?auto_162934 ?auto_162938 ) ) ( not ( = ?auto_162934 ?auto_162939 ) ) ( not ( = ?auto_162934 ?auto_162940 ) ) ( not ( = ?auto_162935 ?auto_162936 ) ) ( not ( = ?auto_162935 ?auto_162937 ) ) ( not ( = ?auto_162935 ?auto_162938 ) ) ( not ( = ?auto_162935 ?auto_162939 ) ) ( not ( = ?auto_162935 ?auto_162940 ) ) ( not ( = ?auto_162936 ?auto_162937 ) ) ( not ( = ?auto_162936 ?auto_162938 ) ) ( not ( = ?auto_162936 ?auto_162939 ) ) ( not ( = ?auto_162936 ?auto_162940 ) ) ( not ( = ?auto_162937 ?auto_162938 ) ) ( not ( = ?auto_162937 ?auto_162939 ) ) ( not ( = ?auto_162937 ?auto_162940 ) ) ( not ( = ?auto_162938 ?auto_162939 ) ) ( not ( = ?auto_162938 ?auto_162940 ) ) ( not ( = ?auto_162939 ?auto_162940 ) ) ( ON ?auto_162938 ?auto_162939 ) ( CLEAR ?auto_162936 ) ( ON ?auto_162937 ?auto_162938 ) ( CLEAR ?auto_162937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162929 ?auto_162930 ?auto_162931 ?auto_162932 ?auto_162933 ?auto_162934 ?auto_162935 ?auto_162936 ?auto_162937 )
      ( MAKE-11PILE ?auto_162929 ?auto_162930 ?auto_162931 ?auto_162932 ?auto_162933 ?auto_162934 ?auto_162935 ?auto_162936 ?auto_162937 ?auto_162938 ?auto_162939 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162975 - BLOCK
      ?auto_162976 - BLOCK
      ?auto_162977 - BLOCK
      ?auto_162978 - BLOCK
      ?auto_162979 - BLOCK
      ?auto_162980 - BLOCK
      ?auto_162981 - BLOCK
      ?auto_162982 - BLOCK
      ?auto_162983 - BLOCK
      ?auto_162984 - BLOCK
      ?auto_162985 - BLOCK
    )
    :vars
    (
      ?auto_162986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162985 ?auto_162986 ) ( ON-TABLE ?auto_162975 ) ( ON ?auto_162976 ?auto_162975 ) ( ON ?auto_162977 ?auto_162976 ) ( ON ?auto_162978 ?auto_162977 ) ( ON ?auto_162979 ?auto_162978 ) ( ON ?auto_162980 ?auto_162979 ) ( ON ?auto_162981 ?auto_162980 ) ( not ( = ?auto_162975 ?auto_162976 ) ) ( not ( = ?auto_162975 ?auto_162977 ) ) ( not ( = ?auto_162975 ?auto_162978 ) ) ( not ( = ?auto_162975 ?auto_162979 ) ) ( not ( = ?auto_162975 ?auto_162980 ) ) ( not ( = ?auto_162975 ?auto_162981 ) ) ( not ( = ?auto_162975 ?auto_162982 ) ) ( not ( = ?auto_162975 ?auto_162983 ) ) ( not ( = ?auto_162975 ?auto_162984 ) ) ( not ( = ?auto_162975 ?auto_162985 ) ) ( not ( = ?auto_162975 ?auto_162986 ) ) ( not ( = ?auto_162976 ?auto_162977 ) ) ( not ( = ?auto_162976 ?auto_162978 ) ) ( not ( = ?auto_162976 ?auto_162979 ) ) ( not ( = ?auto_162976 ?auto_162980 ) ) ( not ( = ?auto_162976 ?auto_162981 ) ) ( not ( = ?auto_162976 ?auto_162982 ) ) ( not ( = ?auto_162976 ?auto_162983 ) ) ( not ( = ?auto_162976 ?auto_162984 ) ) ( not ( = ?auto_162976 ?auto_162985 ) ) ( not ( = ?auto_162976 ?auto_162986 ) ) ( not ( = ?auto_162977 ?auto_162978 ) ) ( not ( = ?auto_162977 ?auto_162979 ) ) ( not ( = ?auto_162977 ?auto_162980 ) ) ( not ( = ?auto_162977 ?auto_162981 ) ) ( not ( = ?auto_162977 ?auto_162982 ) ) ( not ( = ?auto_162977 ?auto_162983 ) ) ( not ( = ?auto_162977 ?auto_162984 ) ) ( not ( = ?auto_162977 ?auto_162985 ) ) ( not ( = ?auto_162977 ?auto_162986 ) ) ( not ( = ?auto_162978 ?auto_162979 ) ) ( not ( = ?auto_162978 ?auto_162980 ) ) ( not ( = ?auto_162978 ?auto_162981 ) ) ( not ( = ?auto_162978 ?auto_162982 ) ) ( not ( = ?auto_162978 ?auto_162983 ) ) ( not ( = ?auto_162978 ?auto_162984 ) ) ( not ( = ?auto_162978 ?auto_162985 ) ) ( not ( = ?auto_162978 ?auto_162986 ) ) ( not ( = ?auto_162979 ?auto_162980 ) ) ( not ( = ?auto_162979 ?auto_162981 ) ) ( not ( = ?auto_162979 ?auto_162982 ) ) ( not ( = ?auto_162979 ?auto_162983 ) ) ( not ( = ?auto_162979 ?auto_162984 ) ) ( not ( = ?auto_162979 ?auto_162985 ) ) ( not ( = ?auto_162979 ?auto_162986 ) ) ( not ( = ?auto_162980 ?auto_162981 ) ) ( not ( = ?auto_162980 ?auto_162982 ) ) ( not ( = ?auto_162980 ?auto_162983 ) ) ( not ( = ?auto_162980 ?auto_162984 ) ) ( not ( = ?auto_162980 ?auto_162985 ) ) ( not ( = ?auto_162980 ?auto_162986 ) ) ( not ( = ?auto_162981 ?auto_162982 ) ) ( not ( = ?auto_162981 ?auto_162983 ) ) ( not ( = ?auto_162981 ?auto_162984 ) ) ( not ( = ?auto_162981 ?auto_162985 ) ) ( not ( = ?auto_162981 ?auto_162986 ) ) ( not ( = ?auto_162982 ?auto_162983 ) ) ( not ( = ?auto_162982 ?auto_162984 ) ) ( not ( = ?auto_162982 ?auto_162985 ) ) ( not ( = ?auto_162982 ?auto_162986 ) ) ( not ( = ?auto_162983 ?auto_162984 ) ) ( not ( = ?auto_162983 ?auto_162985 ) ) ( not ( = ?auto_162983 ?auto_162986 ) ) ( not ( = ?auto_162984 ?auto_162985 ) ) ( not ( = ?auto_162984 ?auto_162986 ) ) ( not ( = ?auto_162985 ?auto_162986 ) ) ( ON ?auto_162984 ?auto_162985 ) ( ON ?auto_162983 ?auto_162984 ) ( CLEAR ?auto_162981 ) ( ON ?auto_162982 ?auto_162983 ) ( CLEAR ?auto_162982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162975 ?auto_162976 ?auto_162977 ?auto_162978 ?auto_162979 ?auto_162980 ?auto_162981 ?auto_162982 )
      ( MAKE-11PILE ?auto_162975 ?auto_162976 ?auto_162977 ?auto_162978 ?auto_162979 ?auto_162980 ?auto_162981 ?auto_162982 ?auto_162983 ?auto_162984 ?auto_162985 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163021 - BLOCK
      ?auto_163022 - BLOCK
      ?auto_163023 - BLOCK
      ?auto_163024 - BLOCK
      ?auto_163025 - BLOCK
      ?auto_163026 - BLOCK
      ?auto_163027 - BLOCK
      ?auto_163028 - BLOCK
      ?auto_163029 - BLOCK
      ?auto_163030 - BLOCK
      ?auto_163031 - BLOCK
    )
    :vars
    (
      ?auto_163032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163031 ?auto_163032 ) ( ON-TABLE ?auto_163021 ) ( ON ?auto_163022 ?auto_163021 ) ( ON ?auto_163023 ?auto_163022 ) ( ON ?auto_163024 ?auto_163023 ) ( ON ?auto_163025 ?auto_163024 ) ( ON ?auto_163026 ?auto_163025 ) ( not ( = ?auto_163021 ?auto_163022 ) ) ( not ( = ?auto_163021 ?auto_163023 ) ) ( not ( = ?auto_163021 ?auto_163024 ) ) ( not ( = ?auto_163021 ?auto_163025 ) ) ( not ( = ?auto_163021 ?auto_163026 ) ) ( not ( = ?auto_163021 ?auto_163027 ) ) ( not ( = ?auto_163021 ?auto_163028 ) ) ( not ( = ?auto_163021 ?auto_163029 ) ) ( not ( = ?auto_163021 ?auto_163030 ) ) ( not ( = ?auto_163021 ?auto_163031 ) ) ( not ( = ?auto_163021 ?auto_163032 ) ) ( not ( = ?auto_163022 ?auto_163023 ) ) ( not ( = ?auto_163022 ?auto_163024 ) ) ( not ( = ?auto_163022 ?auto_163025 ) ) ( not ( = ?auto_163022 ?auto_163026 ) ) ( not ( = ?auto_163022 ?auto_163027 ) ) ( not ( = ?auto_163022 ?auto_163028 ) ) ( not ( = ?auto_163022 ?auto_163029 ) ) ( not ( = ?auto_163022 ?auto_163030 ) ) ( not ( = ?auto_163022 ?auto_163031 ) ) ( not ( = ?auto_163022 ?auto_163032 ) ) ( not ( = ?auto_163023 ?auto_163024 ) ) ( not ( = ?auto_163023 ?auto_163025 ) ) ( not ( = ?auto_163023 ?auto_163026 ) ) ( not ( = ?auto_163023 ?auto_163027 ) ) ( not ( = ?auto_163023 ?auto_163028 ) ) ( not ( = ?auto_163023 ?auto_163029 ) ) ( not ( = ?auto_163023 ?auto_163030 ) ) ( not ( = ?auto_163023 ?auto_163031 ) ) ( not ( = ?auto_163023 ?auto_163032 ) ) ( not ( = ?auto_163024 ?auto_163025 ) ) ( not ( = ?auto_163024 ?auto_163026 ) ) ( not ( = ?auto_163024 ?auto_163027 ) ) ( not ( = ?auto_163024 ?auto_163028 ) ) ( not ( = ?auto_163024 ?auto_163029 ) ) ( not ( = ?auto_163024 ?auto_163030 ) ) ( not ( = ?auto_163024 ?auto_163031 ) ) ( not ( = ?auto_163024 ?auto_163032 ) ) ( not ( = ?auto_163025 ?auto_163026 ) ) ( not ( = ?auto_163025 ?auto_163027 ) ) ( not ( = ?auto_163025 ?auto_163028 ) ) ( not ( = ?auto_163025 ?auto_163029 ) ) ( not ( = ?auto_163025 ?auto_163030 ) ) ( not ( = ?auto_163025 ?auto_163031 ) ) ( not ( = ?auto_163025 ?auto_163032 ) ) ( not ( = ?auto_163026 ?auto_163027 ) ) ( not ( = ?auto_163026 ?auto_163028 ) ) ( not ( = ?auto_163026 ?auto_163029 ) ) ( not ( = ?auto_163026 ?auto_163030 ) ) ( not ( = ?auto_163026 ?auto_163031 ) ) ( not ( = ?auto_163026 ?auto_163032 ) ) ( not ( = ?auto_163027 ?auto_163028 ) ) ( not ( = ?auto_163027 ?auto_163029 ) ) ( not ( = ?auto_163027 ?auto_163030 ) ) ( not ( = ?auto_163027 ?auto_163031 ) ) ( not ( = ?auto_163027 ?auto_163032 ) ) ( not ( = ?auto_163028 ?auto_163029 ) ) ( not ( = ?auto_163028 ?auto_163030 ) ) ( not ( = ?auto_163028 ?auto_163031 ) ) ( not ( = ?auto_163028 ?auto_163032 ) ) ( not ( = ?auto_163029 ?auto_163030 ) ) ( not ( = ?auto_163029 ?auto_163031 ) ) ( not ( = ?auto_163029 ?auto_163032 ) ) ( not ( = ?auto_163030 ?auto_163031 ) ) ( not ( = ?auto_163030 ?auto_163032 ) ) ( not ( = ?auto_163031 ?auto_163032 ) ) ( ON ?auto_163030 ?auto_163031 ) ( ON ?auto_163029 ?auto_163030 ) ( ON ?auto_163028 ?auto_163029 ) ( CLEAR ?auto_163026 ) ( ON ?auto_163027 ?auto_163028 ) ( CLEAR ?auto_163027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163021 ?auto_163022 ?auto_163023 ?auto_163024 ?auto_163025 ?auto_163026 ?auto_163027 )
      ( MAKE-11PILE ?auto_163021 ?auto_163022 ?auto_163023 ?auto_163024 ?auto_163025 ?auto_163026 ?auto_163027 ?auto_163028 ?auto_163029 ?auto_163030 ?auto_163031 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163067 - BLOCK
      ?auto_163068 - BLOCK
      ?auto_163069 - BLOCK
      ?auto_163070 - BLOCK
      ?auto_163071 - BLOCK
      ?auto_163072 - BLOCK
      ?auto_163073 - BLOCK
      ?auto_163074 - BLOCK
      ?auto_163075 - BLOCK
      ?auto_163076 - BLOCK
      ?auto_163077 - BLOCK
    )
    :vars
    (
      ?auto_163078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163077 ?auto_163078 ) ( ON-TABLE ?auto_163067 ) ( ON ?auto_163068 ?auto_163067 ) ( ON ?auto_163069 ?auto_163068 ) ( ON ?auto_163070 ?auto_163069 ) ( ON ?auto_163071 ?auto_163070 ) ( not ( = ?auto_163067 ?auto_163068 ) ) ( not ( = ?auto_163067 ?auto_163069 ) ) ( not ( = ?auto_163067 ?auto_163070 ) ) ( not ( = ?auto_163067 ?auto_163071 ) ) ( not ( = ?auto_163067 ?auto_163072 ) ) ( not ( = ?auto_163067 ?auto_163073 ) ) ( not ( = ?auto_163067 ?auto_163074 ) ) ( not ( = ?auto_163067 ?auto_163075 ) ) ( not ( = ?auto_163067 ?auto_163076 ) ) ( not ( = ?auto_163067 ?auto_163077 ) ) ( not ( = ?auto_163067 ?auto_163078 ) ) ( not ( = ?auto_163068 ?auto_163069 ) ) ( not ( = ?auto_163068 ?auto_163070 ) ) ( not ( = ?auto_163068 ?auto_163071 ) ) ( not ( = ?auto_163068 ?auto_163072 ) ) ( not ( = ?auto_163068 ?auto_163073 ) ) ( not ( = ?auto_163068 ?auto_163074 ) ) ( not ( = ?auto_163068 ?auto_163075 ) ) ( not ( = ?auto_163068 ?auto_163076 ) ) ( not ( = ?auto_163068 ?auto_163077 ) ) ( not ( = ?auto_163068 ?auto_163078 ) ) ( not ( = ?auto_163069 ?auto_163070 ) ) ( not ( = ?auto_163069 ?auto_163071 ) ) ( not ( = ?auto_163069 ?auto_163072 ) ) ( not ( = ?auto_163069 ?auto_163073 ) ) ( not ( = ?auto_163069 ?auto_163074 ) ) ( not ( = ?auto_163069 ?auto_163075 ) ) ( not ( = ?auto_163069 ?auto_163076 ) ) ( not ( = ?auto_163069 ?auto_163077 ) ) ( not ( = ?auto_163069 ?auto_163078 ) ) ( not ( = ?auto_163070 ?auto_163071 ) ) ( not ( = ?auto_163070 ?auto_163072 ) ) ( not ( = ?auto_163070 ?auto_163073 ) ) ( not ( = ?auto_163070 ?auto_163074 ) ) ( not ( = ?auto_163070 ?auto_163075 ) ) ( not ( = ?auto_163070 ?auto_163076 ) ) ( not ( = ?auto_163070 ?auto_163077 ) ) ( not ( = ?auto_163070 ?auto_163078 ) ) ( not ( = ?auto_163071 ?auto_163072 ) ) ( not ( = ?auto_163071 ?auto_163073 ) ) ( not ( = ?auto_163071 ?auto_163074 ) ) ( not ( = ?auto_163071 ?auto_163075 ) ) ( not ( = ?auto_163071 ?auto_163076 ) ) ( not ( = ?auto_163071 ?auto_163077 ) ) ( not ( = ?auto_163071 ?auto_163078 ) ) ( not ( = ?auto_163072 ?auto_163073 ) ) ( not ( = ?auto_163072 ?auto_163074 ) ) ( not ( = ?auto_163072 ?auto_163075 ) ) ( not ( = ?auto_163072 ?auto_163076 ) ) ( not ( = ?auto_163072 ?auto_163077 ) ) ( not ( = ?auto_163072 ?auto_163078 ) ) ( not ( = ?auto_163073 ?auto_163074 ) ) ( not ( = ?auto_163073 ?auto_163075 ) ) ( not ( = ?auto_163073 ?auto_163076 ) ) ( not ( = ?auto_163073 ?auto_163077 ) ) ( not ( = ?auto_163073 ?auto_163078 ) ) ( not ( = ?auto_163074 ?auto_163075 ) ) ( not ( = ?auto_163074 ?auto_163076 ) ) ( not ( = ?auto_163074 ?auto_163077 ) ) ( not ( = ?auto_163074 ?auto_163078 ) ) ( not ( = ?auto_163075 ?auto_163076 ) ) ( not ( = ?auto_163075 ?auto_163077 ) ) ( not ( = ?auto_163075 ?auto_163078 ) ) ( not ( = ?auto_163076 ?auto_163077 ) ) ( not ( = ?auto_163076 ?auto_163078 ) ) ( not ( = ?auto_163077 ?auto_163078 ) ) ( ON ?auto_163076 ?auto_163077 ) ( ON ?auto_163075 ?auto_163076 ) ( ON ?auto_163074 ?auto_163075 ) ( ON ?auto_163073 ?auto_163074 ) ( CLEAR ?auto_163071 ) ( ON ?auto_163072 ?auto_163073 ) ( CLEAR ?auto_163072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163067 ?auto_163068 ?auto_163069 ?auto_163070 ?auto_163071 ?auto_163072 )
      ( MAKE-11PILE ?auto_163067 ?auto_163068 ?auto_163069 ?auto_163070 ?auto_163071 ?auto_163072 ?auto_163073 ?auto_163074 ?auto_163075 ?auto_163076 ?auto_163077 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163113 - BLOCK
      ?auto_163114 - BLOCK
      ?auto_163115 - BLOCK
      ?auto_163116 - BLOCK
      ?auto_163117 - BLOCK
      ?auto_163118 - BLOCK
      ?auto_163119 - BLOCK
      ?auto_163120 - BLOCK
      ?auto_163121 - BLOCK
      ?auto_163122 - BLOCK
      ?auto_163123 - BLOCK
    )
    :vars
    (
      ?auto_163124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163123 ?auto_163124 ) ( ON-TABLE ?auto_163113 ) ( ON ?auto_163114 ?auto_163113 ) ( ON ?auto_163115 ?auto_163114 ) ( ON ?auto_163116 ?auto_163115 ) ( not ( = ?auto_163113 ?auto_163114 ) ) ( not ( = ?auto_163113 ?auto_163115 ) ) ( not ( = ?auto_163113 ?auto_163116 ) ) ( not ( = ?auto_163113 ?auto_163117 ) ) ( not ( = ?auto_163113 ?auto_163118 ) ) ( not ( = ?auto_163113 ?auto_163119 ) ) ( not ( = ?auto_163113 ?auto_163120 ) ) ( not ( = ?auto_163113 ?auto_163121 ) ) ( not ( = ?auto_163113 ?auto_163122 ) ) ( not ( = ?auto_163113 ?auto_163123 ) ) ( not ( = ?auto_163113 ?auto_163124 ) ) ( not ( = ?auto_163114 ?auto_163115 ) ) ( not ( = ?auto_163114 ?auto_163116 ) ) ( not ( = ?auto_163114 ?auto_163117 ) ) ( not ( = ?auto_163114 ?auto_163118 ) ) ( not ( = ?auto_163114 ?auto_163119 ) ) ( not ( = ?auto_163114 ?auto_163120 ) ) ( not ( = ?auto_163114 ?auto_163121 ) ) ( not ( = ?auto_163114 ?auto_163122 ) ) ( not ( = ?auto_163114 ?auto_163123 ) ) ( not ( = ?auto_163114 ?auto_163124 ) ) ( not ( = ?auto_163115 ?auto_163116 ) ) ( not ( = ?auto_163115 ?auto_163117 ) ) ( not ( = ?auto_163115 ?auto_163118 ) ) ( not ( = ?auto_163115 ?auto_163119 ) ) ( not ( = ?auto_163115 ?auto_163120 ) ) ( not ( = ?auto_163115 ?auto_163121 ) ) ( not ( = ?auto_163115 ?auto_163122 ) ) ( not ( = ?auto_163115 ?auto_163123 ) ) ( not ( = ?auto_163115 ?auto_163124 ) ) ( not ( = ?auto_163116 ?auto_163117 ) ) ( not ( = ?auto_163116 ?auto_163118 ) ) ( not ( = ?auto_163116 ?auto_163119 ) ) ( not ( = ?auto_163116 ?auto_163120 ) ) ( not ( = ?auto_163116 ?auto_163121 ) ) ( not ( = ?auto_163116 ?auto_163122 ) ) ( not ( = ?auto_163116 ?auto_163123 ) ) ( not ( = ?auto_163116 ?auto_163124 ) ) ( not ( = ?auto_163117 ?auto_163118 ) ) ( not ( = ?auto_163117 ?auto_163119 ) ) ( not ( = ?auto_163117 ?auto_163120 ) ) ( not ( = ?auto_163117 ?auto_163121 ) ) ( not ( = ?auto_163117 ?auto_163122 ) ) ( not ( = ?auto_163117 ?auto_163123 ) ) ( not ( = ?auto_163117 ?auto_163124 ) ) ( not ( = ?auto_163118 ?auto_163119 ) ) ( not ( = ?auto_163118 ?auto_163120 ) ) ( not ( = ?auto_163118 ?auto_163121 ) ) ( not ( = ?auto_163118 ?auto_163122 ) ) ( not ( = ?auto_163118 ?auto_163123 ) ) ( not ( = ?auto_163118 ?auto_163124 ) ) ( not ( = ?auto_163119 ?auto_163120 ) ) ( not ( = ?auto_163119 ?auto_163121 ) ) ( not ( = ?auto_163119 ?auto_163122 ) ) ( not ( = ?auto_163119 ?auto_163123 ) ) ( not ( = ?auto_163119 ?auto_163124 ) ) ( not ( = ?auto_163120 ?auto_163121 ) ) ( not ( = ?auto_163120 ?auto_163122 ) ) ( not ( = ?auto_163120 ?auto_163123 ) ) ( not ( = ?auto_163120 ?auto_163124 ) ) ( not ( = ?auto_163121 ?auto_163122 ) ) ( not ( = ?auto_163121 ?auto_163123 ) ) ( not ( = ?auto_163121 ?auto_163124 ) ) ( not ( = ?auto_163122 ?auto_163123 ) ) ( not ( = ?auto_163122 ?auto_163124 ) ) ( not ( = ?auto_163123 ?auto_163124 ) ) ( ON ?auto_163122 ?auto_163123 ) ( ON ?auto_163121 ?auto_163122 ) ( ON ?auto_163120 ?auto_163121 ) ( ON ?auto_163119 ?auto_163120 ) ( ON ?auto_163118 ?auto_163119 ) ( CLEAR ?auto_163116 ) ( ON ?auto_163117 ?auto_163118 ) ( CLEAR ?auto_163117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163113 ?auto_163114 ?auto_163115 ?auto_163116 ?auto_163117 )
      ( MAKE-11PILE ?auto_163113 ?auto_163114 ?auto_163115 ?auto_163116 ?auto_163117 ?auto_163118 ?auto_163119 ?auto_163120 ?auto_163121 ?auto_163122 ?auto_163123 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163159 - BLOCK
      ?auto_163160 - BLOCK
      ?auto_163161 - BLOCK
      ?auto_163162 - BLOCK
      ?auto_163163 - BLOCK
      ?auto_163164 - BLOCK
      ?auto_163165 - BLOCK
      ?auto_163166 - BLOCK
      ?auto_163167 - BLOCK
      ?auto_163168 - BLOCK
      ?auto_163169 - BLOCK
    )
    :vars
    (
      ?auto_163170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163169 ?auto_163170 ) ( ON-TABLE ?auto_163159 ) ( ON ?auto_163160 ?auto_163159 ) ( ON ?auto_163161 ?auto_163160 ) ( not ( = ?auto_163159 ?auto_163160 ) ) ( not ( = ?auto_163159 ?auto_163161 ) ) ( not ( = ?auto_163159 ?auto_163162 ) ) ( not ( = ?auto_163159 ?auto_163163 ) ) ( not ( = ?auto_163159 ?auto_163164 ) ) ( not ( = ?auto_163159 ?auto_163165 ) ) ( not ( = ?auto_163159 ?auto_163166 ) ) ( not ( = ?auto_163159 ?auto_163167 ) ) ( not ( = ?auto_163159 ?auto_163168 ) ) ( not ( = ?auto_163159 ?auto_163169 ) ) ( not ( = ?auto_163159 ?auto_163170 ) ) ( not ( = ?auto_163160 ?auto_163161 ) ) ( not ( = ?auto_163160 ?auto_163162 ) ) ( not ( = ?auto_163160 ?auto_163163 ) ) ( not ( = ?auto_163160 ?auto_163164 ) ) ( not ( = ?auto_163160 ?auto_163165 ) ) ( not ( = ?auto_163160 ?auto_163166 ) ) ( not ( = ?auto_163160 ?auto_163167 ) ) ( not ( = ?auto_163160 ?auto_163168 ) ) ( not ( = ?auto_163160 ?auto_163169 ) ) ( not ( = ?auto_163160 ?auto_163170 ) ) ( not ( = ?auto_163161 ?auto_163162 ) ) ( not ( = ?auto_163161 ?auto_163163 ) ) ( not ( = ?auto_163161 ?auto_163164 ) ) ( not ( = ?auto_163161 ?auto_163165 ) ) ( not ( = ?auto_163161 ?auto_163166 ) ) ( not ( = ?auto_163161 ?auto_163167 ) ) ( not ( = ?auto_163161 ?auto_163168 ) ) ( not ( = ?auto_163161 ?auto_163169 ) ) ( not ( = ?auto_163161 ?auto_163170 ) ) ( not ( = ?auto_163162 ?auto_163163 ) ) ( not ( = ?auto_163162 ?auto_163164 ) ) ( not ( = ?auto_163162 ?auto_163165 ) ) ( not ( = ?auto_163162 ?auto_163166 ) ) ( not ( = ?auto_163162 ?auto_163167 ) ) ( not ( = ?auto_163162 ?auto_163168 ) ) ( not ( = ?auto_163162 ?auto_163169 ) ) ( not ( = ?auto_163162 ?auto_163170 ) ) ( not ( = ?auto_163163 ?auto_163164 ) ) ( not ( = ?auto_163163 ?auto_163165 ) ) ( not ( = ?auto_163163 ?auto_163166 ) ) ( not ( = ?auto_163163 ?auto_163167 ) ) ( not ( = ?auto_163163 ?auto_163168 ) ) ( not ( = ?auto_163163 ?auto_163169 ) ) ( not ( = ?auto_163163 ?auto_163170 ) ) ( not ( = ?auto_163164 ?auto_163165 ) ) ( not ( = ?auto_163164 ?auto_163166 ) ) ( not ( = ?auto_163164 ?auto_163167 ) ) ( not ( = ?auto_163164 ?auto_163168 ) ) ( not ( = ?auto_163164 ?auto_163169 ) ) ( not ( = ?auto_163164 ?auto_163170 ) ) ( not ( = ?auto_163165 ?auto_163166 ) ) ( not ( = ?auto_163165 ?auto_163167 ) ) ( not ( = ?auto_163165 ?auto_163168 ) ) ( not ( = ?auto_163165 ?auto_163169 ) ) ( not ( = ?auto_163165 ?auto_163170 ) ) ( not ( = ?auto_163166 ?auto_163167 ) ) ( not ( = ?auto_163166 ?auto_163168 ) ) ( not ( = ?auto_163166 ?auto_163169 ) ) ( not ( = ?auto_163166 ?auto_163170 ) ) ( not ( = ?auto_163167 ?auto_163168 ) ) ( not ( = ?auto_163167 ?auto_163169 ) ) ( not ( = ?auto_163167 ?auto_163170 ) ) ( not ( = ?auto_163168 ?auto_163169 ) ) ( not ( = ?auto_163168 ?auto_163170 ) ) ( not ( = ?auto_163169 ?auto_163170 ) ) ( ON ?auto_163168 ?auto_163169 ) ( ON ?auto_163167 ?auto_163168 ) ( ON ?auto_163166 ?auto_163167 ) ( ON ?auto_163165 ?auto_163166 ) ( ON ?auto_163164 ?auto_163165 ) ( ON ?auto_163163 ?auto_163164 ) ( CLEAR ?auto_163161 ) ( ON ?auto_163162 ?auto_163163 ) ( CLEAR ?auto_163162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163159 ?auto_163160 ?auto_163161 ?auto_163162 )
      ( MAKE-11PILE ?auto_163159 ?auto_163160 ?auto_163161 ?auto_163162 ?auto_163163 ?auto_163164 ?auto_163165 ?auto_163166 ?auto_163167 ?auto_163168 ?auto_163169 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163205 - BLOCK
      ?auto_163206 - BLOCK
      ?auto_163207 - BLOCK
      ?auto_163208 - BLOCK
      ?auto_163209 - BLOCK
      ?auto_163210 - BLOCK
      ?auto_163211 - BLOCK
      ?auto_163212 - BLOCK
      ?auto_163213 - BLOCK
      ?auto_163214 - BLOCK
      ?auto_163215 - BLOCK
    )
    :vars
    (
      ?auto_163216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163215 ?auto_163216 ) ( ON-TABLE ?auto_163205 ) ( ON ?auto_163206 ?auto_163205 ) ( not ( = ?auto_163205 ?auto_163206 ) ) ( not ( = ?auto_163205 ?auto_163207 ) ) ( not ( = ?auto_163205 ?auto_163208 ) ) ( not ( = ?auto_163205 ?auto_163209 ) ) ( not ( = ?auto_163205 ?auto_163210 ) ) ( not ( = ?auto_163205 ?auto_163211 ) ) ( not ( = ?auto_163205 ?auto_163212 ) ) ( not ( = ?auto_163205 ?auto_163213 ) ) ( not ( = ?auto_163205 ?auto_163214 ) ) ( not ( = ?auto_163205 ?auto_163215 ) ) ( not ( = ?auto_163205 ?auto_163216 ) ) ( not ( = ?auto_163206 ?auto_163207 ) ) ( not ( = ?auto_163206 ?auto_163208 ) ) ( not ( = ?auto_163206 ?auto_163209 ) ) ( not ( = ?auto_163206 ?auto_163210 ) ) ( not ( = ?auto_163206 ?auto_163211 ) ) ( not ( = ?auto_163206 ?auto_163212 ) ) ( not ( = ?auto_163206 ?auto_163213 ) ) ( not ( = ?auto_163206 ?auto_163214 ) ) ( not ( = ?auto_163206 ?auto_163215 ) ) ( not ( = ?auto_163206 ?auto_163216 ) ) ( not ( = ?auto_163207 ?auto_163208 ) ) ( not ( = ?auto_163207 ?auto_163209 ) ) ( not ( = ?auto_163207 ?auto_163210 ) ) ( not ( = ?auto_163207 ?auto_163211 ) ) ( not ( = ?auto_163207 ?auto_163212 ) ) ( not ( = ?auto_163207 ?auto_163213 ) ) ( not ( = ?auto_163207 ?auto_163214 ) ) ( not ( = ?auto_163207 ?auto_163215 ) ) ( not ( = ?auto_163207 ?auto_163216 ) ) ( not ( = ?auto_163208 ?auto_163209 ) ) ( not ( = ?auto_163208 ?auto_163210 ) ) ( not ( = ?auto_163208 ?auto_163211 ) ) ( not ( = ?auto_163208 ?auto_163212 ) ) ( not ( = ?auto_163208 ?auto_163213 ) ) ( not ( = ?auto_163208 ?auto_163214 ) ) ( not ( = ?auto_163208 ?auto_163215 ) ) ( not ( = ?auto_163208 ?auto_163216 ) ) ( not ( = ?auto_163209 ?auto_163210 ) ) ( not ( = ?auto_163209 ?auto_163211 ) ) ( not ( = ?auto_163209 ?auto_163212 ) ) ( not ( = ?auto_163209 ?auto_163213 ) ) ( not ( = ?auto_163209 ?auto_163214 ) ) ( not ( = ?auto_163209 ?auto_163215 ) ) ( not ( = ?auto_163209 ?auto_163216 ) ) ( not ( = ?auto_163210 ?auto_163211 ) ) ( not ( = ?auto_163210 ?auto_163212 ) ) ( not ( = ?auto_163210 ?auto_163213 ) ) ( not ( = ?auto_163210 ?auto_163214 ) ) ( not ( = ?auto_163210 ?auto_163215 ) ) ( not ( = ?auto_163210 ?auto_163216 ) ) ( not ( = ?auto_163211 ?auto_163212 ) ) ( not ( = ?auto_163211 ?auto_163213 ) ) ( not ( = ?auto_163211 ?auto_163214 ) ) ( not ( = ?auto_163211 ?auto_163215 ) ) ( not ( = ?auto_163211 ?auto_163216 ) ) ( not ( = ?auto_163212 ?auto_163213 ) ) ( not ( = ?auto_163212 ?auto_163214 ) ) ( not ( = ?auto_163212 ?auto_163215 ) ) ( not ( = ?auto_163212 ?auto_163216 ) ) ( not ( = ?auto_163213 ?auto_163214 ) ) ( not ( = ?auto_163213 ?auto_163215 ) ) ( not ( = ?auto_163213 ?auto_163216 ) ) ( not ( = ?auto_163214 ?auto_163215 ) ) ( not ( = ?auto_163214 ?auto_163216 ) ) ( not ( = ?auto_163215 ?auto_163216 ) ) ( ON ?auto_163214 ?auto_163215 ) ( ON ?auto_163213 ?auto_163214 ) ( ON ?auto_163212 ?auto_163213 ) ( ON ?auto_163211 ?auto_163212 ) ( ON ?auto_163210 ?auto_163211 ) ( ON ?auto_163209 ?auto_163210 ) ( ON ?auto_163208 ?auto_163209 ) ( CLEAR ?auto_163206 ) ( ON ?auto_163207 ?auto_163208 ) ( CLEAR ?auto_163207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163205 ?auto_163206 ?auto_163207 )
      ( MAKE-11PILE ?auto_163205 ?auto_163206 ?auto_163207 ?auto_163208 ?auto_163209 ?auto_163210 ?auto_163211 ?auto_163212 ?auto_163213 ?auto_163214 ?auto_163215 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163251 - BLOCK
      ?auto_163252 - BLOCK
      ?auto_163253 - BLOCK
      ?auto_163254 - BLOCK
      ?auto_163255 - BLOCK
      ?auto_163256 - BLOCK
      ?auto_163257 - BLOCK
      ?auto_163258 - BLOCK
      ?auto_163259 - BLOCK
      ?auto_163260 - BLOCK
      ?auto_163261 - BLOCK
    )
    :vars
    (
      ?auto_163262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163261 ?auto_163262 ) ( ON-TABLE ?auto_163251 ) ( not ( = ?auto_163251 ?auto_163252 ) ) ( not ( = ?auto_163251 ?auto_163253 ) ) ( not ( = ?auto_163251 ?auto_163254 ) ) ( not ( = ?auto_163251 ?auto_163255 ) ) ( not ( = ?auto_163251 ?auto_163256 ) ) ( not ( = ?auto_163251 ?auto_163257 ) ) ( not ( = ?auto_163251 ?auto_163258 ) ) ( not ( = ?auto_163251 ?auto_163259 ) ) ( not ( = ?auto_163251 ?auto_163260 ) ) ( not ( = ?auto_163251 ?auto_163261 ) ) ( not ( = ?auto_163251 ?auto_163262 ) ) ( not ( = ?auto_163252 ?auto_163253 ) ) ( not ( = ?auto_163252 ?auto_163254 ) ) ( not ( = ?auto_163252 ?auto_163255 ) ) ( not ( = ?auto_163252 ?auto_163256 ) ) ( not ( = ?auto_163252 ?auto_163257 ) ) ( not ( = ?auto_163252 ?auto_163258 ) ) ( not ( = ?auto_163252 ?auto_163259 ) ) ( not ( = ?auto_163252 ?auto_163260 ) ) ( not ( = ?auto_163252 ?auto_163261 ) ) ( not ( = ?auto_163252 ?auto_163262 ) ) ( not ( = ?auto_163253 ?auto_163254 ) ) ( not ( = ?auto_163253 ?auto_163255 ) ) ( not ( = ?auto_163253 ?auto_163256 ) ) ( not ( = ?auto_163253 ?auto_163257 ) ) ( not ( = ?auto_163253 ?auto_163258 ) ) ( not ( = ?auto_163253 ?auto_163259 ) ) ( not ( = ?auto_163253 ?auto_163260 ) ) ( not ( = ?auto_163253 ?auto_163261 ) ) ( not ( = ?auto_163253 ?auto_163262 ) ) ( not ( = ?auto_163254 ?auto_163255 ) ) ( not ( = ?auto_163254 ?auto_163256 ) ) ( not ( = ?auto_163254 ?auto_163257 ) ) ( not ( = ?auto_163254 ?auto_163258 ) ) ( not ( = ?auto_163254 ?auto_163259 ) ) ( not ( = ?auto_163254 ?auto_163260 ) ) ( not ( = ?auto_163254 ?auto_163261 ) ) ( not ( = ?auto_163254 ?auto_163262 ) ) ( not ( = ?auto_163255 ?auto_163256 ) ) ( not ( = ?auto_163255 ?auto_163257 ) ) ( not ( = ?auto_163255 ?auto_163258 ) ) ( not ( = ?auto_163255 ?auto_163259 ) ) ( not ( = ?auto_163255 ?auto_163260 ) ) ( not ( = ?auto_163255 ?auto_163261 ) ) ( not ( = ?auto_163255 ?auto_163262 ) ) ( not ( = ?auto_163256 ?auto_163257 ) ) ( not ( = ?auto_163256 ?auto_163258 ) ) ( not ( = ?auto_163256 ?auto_163259 ) ) ( not ( = ?auto_163256 ?auto_163260 ) ) ( not ( = ?auto_163256 ?auto_163261 ) ) ( not ( = ?auto_163256 ?auto_163262 ) ) ( not ( = ?auto_163257 ?auto_163258 ) ) ( not ( = ?auto_163257 ?auto_163259 ) ) ( not ( = ?auto_163257 ?auto_163260 ) ) ( not ( = ?auto_163257 ?auto_163261 ) ) ( not ( = ?auto_163257 ?auto_163262 ) ) ( not ( = ?auto_163258 ?auto_163259 ) ) ( not ( = ?auto_163258 ?auto_163260 ) ) ( not ( = ?auto_163258 ?auto_163261 ) ) ( not ( = ?auto_163258 ?auto_163262 ) ) ( not ( = ?auto_163259 ?auto_163260 ) ) ( not ( = ?auto_163259 ?auto_163261 ) ) ( not ( = ?auto_163259 ?auto_163262 ) ) ( not ( = ?auto_163260 ?auto_163261 ) ) ( not ( = ?auto_163260 ?auto_163262 ) ) ( not ( = ?auto_163261 ?auto_163262 ) ) ( ON ?auto_163260 ?auto_163261 ) ( ON ?auto_163259 ?auto_163260 ) ( ON ?auto_163258 ?auto_163259 ) ( ON ?auto_163257 ?auto_163258 ) ( ON ?auto_163256 ?auto_163257 ) ( ON ?auto_163255 ?auto_163256 ) ( ON ?auto_163254 ?auto_163255 ) ( ON ?auto_163253 ?auto_163254 ) ( CLEAR ?auto_163251 ) ( ON ?auto_163252 ?auto_163253 ) ( CLEAR ?auto_163252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163251 ?auto_163252 )
      ( MAKE-11PILE ?auto_163251 ?auto_163252 ?auto_163253 ?auto_163254 ?auto_163255 ?auto_163256 ?auto_163257 ?auto_163258 ?auto_163259 ?auto_163260 ?auto_163261 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163297 - BLOCK
      ?auto_163298 - BLOCK
      ?auto_163299 - BLOCK
      ?auto_163300 - BLOCK
      ?auto_163301 - BLOCK
      ?auto_163302 - BLOCK
      ?auto_163303 - BLOCK
      ?auto_163304 - BLOCK
      ?auto_163305 - BLOCK
      ?auto_163306 - BLOCK
      ?auto_163307 - BLOCK
    )
    :vars
    (
      ?auto_163308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163307 ?auto_163308 ) ( not ( = ?auto_163297 ?auto_163298 ) ) ( not ( = ?auto_163297 ?auto_163299 ) ) ( not ( = ?auto_163297 ?auto_163300 ) ) ( not ( = ?auto_163297 ?auto_163301 ) ) ( not ( = ?auto_163297 ?auto_163302 ) ) ( not ( = ?auto_163297 ?auto_163303 ) ) ( not ( = ?auto_163297 ?auto_163304 ) ) ( not ( = ?auto_163297 ?auto_163305 ) ) ( not ( = ?auto_163297 ?auto_163306 ) ) ( not ( = ?auto_163297 ?auto_163307 ) ) ( not ( = ?auto_163297 ?auto_163308 ) ) ( not ( = ?auto_163298 ?auto_163299 ) ) ( not ( = ?auto_163298 ?auto_163300 ) ) ( not ( = ?auto_163298 ?auto_163301 ) ) ( not ( = ?auto_163298 ?auto_163302 ) ) ( not ( = ?auto_163298 ?auto_163303 ) ) ( not ( = ?auto_163298 ?auto_163304 ) ) ( not ( = ?auto_163298 ?auto_163305 ) ) ( not ( = ?auto_163298 ?auto_163306 ) ) ( not ( = ?auto_163298 ?auto_163307 ) ) ( not ( = ?auto_163298 ?auto_163308 ) ) ( not ( = ?auto_163299 ?auto_163300 ) ) ( not ( = ?auto_163299 ?auto_163301 ) ) ( not ( = ?auto_163299 ?auto_163302 ) ) ( not ( = ?auto_163299 ?auto_163303 ) ) ( not ( = ?auto_163299 ?auto_163304 ) ) ( not ( = ?auto_163299 ?auto_163305 ) ) ( not ( = ?auto_163299 ?auto_163306 ) ) ( not ( = ?auto_163299 ?auto_163307 ) ) ( not ( = ?auto_163299 ?auto_163308 ) ) ( not ( = ?auto_163300 ?auto_163301 ) ) ( not ( = ?auto_163300 ?auto_163302 ) ) ( not ( = ?auto_163300 ?auto_163303 ) ) ( not ( = ?auto_163300 ?auto_163304 ) ) ( not ( = ?auto_163300 ?auto_163305 ) ) ( not ( = ?auto_163300 ?auto_163306 ) ) ( not ( = ?auto_163300 ?auto_163307 ) ) ( not ( = ?auto_163300 ?auto_163308 ) ) ( not ( = ?auto_163301 ?auto_163302 ) ) ( not ( = ?auto_163301 ?auto_163303 ) ) ( not ( = ?auto_163301 ?auto_163304 ) ) ( not ( = ?auto_163301 ?auto_163305 ) ) ( not ( = ?auto_163301 ?auto_163306 ) ) ( not ( = ?auto_163301 ?auto_163307 ) ) ( not ( = ?auto_163301 ?auto_163308 ) ) ( not ( = ?auto_163302 ?auto_163303 ) ) ( not ( = ?auto_163302 ?auto_163304 ) ) ( not ( = ?auto_163302 ?auto_163305 ) ) ( not ( = ?auto_163302 ?auto_163306 ) ) ( not ( = ?auto_163302 ?auto_163307 ) ) ( not ( = ?auto_163302 ?auto_163308 ) ) ( not ( = ?auto_163303 ?auto_163304 ) ) ( not ( = ?auto_163303 ?auto_163305 ) ) ( not ( = ?auto_163303 ?auto_163306 ) ) ( not ( = ?auto_163303 ?auto_163307 ) ) ( not ( = ?auto_163303 ?auto_163308 ) ) ( not ( = ?auto_163304 ?auto_163305 ) ) ( not ( = ?auto_163304 ?auto_163306 ) ) ( not ( = ?auto_163304 ?auto_163307 ) ) ( not ( = ?auto_163304 ?auto_163308 ) ) ( not ( = ?auto_163305 ?auto_163306 ) ) ( not ( = ?auto_163305 ?auto_163307 ) ) ( not ( = ?auto_163305 ?auto_163308 ) ) ( not ( = ?auto_163306 ?auto_163307 ) ) ( not ( = ?auto_163306 ?auto_163308 ) ) ( not ( = ?auto_163307 ?auto_163308 ) ) ( ON ?auto_163306 ?auto_163307 ) ( ON ?auto_163305 ?auto_163306 ) ( ON ?auto_163304 ?auto_163305 ) ( ON ?auto_163303 ?auto_163304 ) ( ON ?auto_163302 ?auto_163303 ) ( ON ?auto_163301 ?auto_163302 ) ( ON ?auto_163300 ?auto_163301 ) ( ON ?auto_163299 ?auto_163300 ) ( ON ?auto_163298 ?auto_163299 ) ( ON ?auto_163297 ?auto_163298 ) ( CLEAR ?auto_163297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163297 )
      ( MAKE-11PILE ?auto_163297 ?auto_163298 ?auto_163299 ?auto_163300 ?auto_163301 ?auto_163302 ?auto_163303 ?auto_163304 ?auto_163305 ?auto_163306 ?auto_163307 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163344 - BLOCK
      ?auto_163345 - BLOCK
      ?auto_163346 - BLOCK
      ?auto_163347 - BLOCK
      ?auto_163348 - BLOCK
      ?auto_163349 - BLOCK
      ?auto_163350 - BLOCK
      ?auto_163351 - BLOCK
      ?auto_163352 - BLOCK
      ?auto_163353 - BLOCK
      ?auto_163354 - BLOCK
      ?auto_163355 - BLOCK
    )
    :vars
    (
      ?auto_163356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163354 ) ( ON ?auto_163355 ?auto_163356 ) ( CLEAR ?auto_163355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163344 ) ( ON ?auto_163345 ?auto_163344 ) ( ON ?auto_163346 ?auto_163345 ) ( ON ?auto_163347 ?auto_163346 ) ( ON ?auto_163348 ?auto_163347 ) ( ON ?auto_163349 ?auto_163348 ) ( ON ?auto_163350 ?auto_163349 ) ( ON ?auto_163351 ?auto_163350 ) ( ON ?auto_163352 ?auto_163351 ) ( ON ?auto_163353 ?auto_163352 ) ( ON ?auto_163354 ?auto_163353 ) ( not ( = ?auto_163344 ?auto_163345 ) ) ( not ( = ?auto_163344 ?auto_163346 ) ) ( not ( = ?auto_163344 ?auto_163347 ) ) ( not ( = ?auto_163344 ?auto_163348 ) ) ( not ( = ?auto_163344 ?auto_163349 ) ) ( not ( = ?auto_163344 ?auto_163350 ) ) ( not ( = ?auto_163344 ?auto_163351 ) ) ( not ( = ?auto_163344 ?auto_163352 ) ) ( not ( = ?auto_163344 ?auto_163353 ) ) ( not ( = ?auto_163344 ?auto_163354 ) ) ( not ( = ?auto_163344 ?auto_163355 ) ) ( not ( = ?auto_163344 ?auto_163356 ) ) ( not ( = ?auto_163345 ?auto_163346 ) ) ( not ( = ?auto_163345 ?auto_163347 ) ) ( not ( = ?auto_163345 ?auto_163348 ) ) ( not ( = ?auto_163345 ?auto_163349 ) ) ( not ( = ?auto_163345 ?auto_163350 ) ) ( not ( = ?auto_163345 ?auto_163351 ) ) ( not ( = ?auto_163345 ?auto_163352 ) ) ( not ( = ?auto_163345 ?auto_163353 ) ) ( not ( = ?auto_163345 ?auto_163354 ) ) ( not ( = ?auto_163345 ?auto_163355 ) ) ( not ( = ?auto_163345 ?auto_163356 ) ) ( not ( = ?auto_163346 ?auto_163347 ) ) ( not ( = ?auto_163346 ?auto_163348 ) ) ( not ( = ?auto_163346 ?auto_163349 ) ) ( not ( = ?auto_163346 ?auto_163350 ) ) ( not ( = ?auto_163346 ?auto_163351 ) ) ( not ( = ?auto_163346 ?auto_163352 ) ) ( not ( = ?auto_163346 ?auto_163353 ) ) ( not ( = ?auto_163346 ?auto_163354 ) ) ( not ( = ?auto_163346 ?auto_163355 ) ) ( not ( = ?auto_163346 ?auto_163356 ) ) ( not ( = ?auto_163347 ?auto_163348 ) ) ( not ( = ?auto_163347 ?auto_163349 ) ) ( not ( = ?auto_163347 ?auto_163350 ) ) ( not ( = ?auto_163347 ?auto_163351 ) ) ( not ( = ?auto_163347 ?auto_163352 ) ) ( not ( = ?auto_163347 ?auto_163353 ) ) ( not ( = ?auto_163347 ?auto_163354 ) ) ( not ( = ?auto_163347 ?auto_163355 ) ) ( not ( = ?auto_163347 ?auto_163356 ) ) ( not ( = ?auto_163348 ?auto_163349 ) ) ( not ( = ?auto_163348 ?auto_163350 ) ) ( not ( = ?auto_163348 ?auto_163351 ) ) ( not ( = ?auto_163348 ?auto_163352 ) ) ( not ( = ?auto_163348 ?auto_163353 ) ) ( not ( = ?auto_163348 ?auto_163354 ) ) ( not ( = ?auto_163348 ?auto_163355 ) ) ( not ( = ?auto_163348 ?auto_163356 ) ) ( not ( = ?auto_163349 ?auto_163350 ) ) ( not ( = ?auto_163349 ?auto_163351 ) ) ( not ( = ?auto_163349 ?auto_163352 ) ) ( not ( = ?auto_163349 ?auto_163353 ) ) ( not ( = ?auto_163349 ?auto_163354 ) ) ( not ( = ?auto_163349 ?auto_163355 ) ) ( not ( = ?auto_163349 ?auto_163356 ) ) ( not ( = ?auto_163350 ?auto_163351 ) ) ( not ( = ?auto_163350 ?auto_163352 ) ) ( not ( = ?auto_163350 ?auto_163353 ) ) ( not ( = ?auto_163350 ?auto_163354 ) ) ( not ( = ?auto_163350 ?auto_163355 ) ) ( not ( = ?auto_163350 ?auto_163356 ) ) ( not ( = ?auto_163351 ?auto_163352 ) ) ( not ( = ?auto_163351 ?auto_163353 ) ) ( not ( = ?auto_163351 ?auto_163354 ) ) ( not ( = ?auto_163351 ?auto_163355 ) ) ( not ( = ?auto_163351 ?auto_163356 ) ) ( not ( = ?auto_163352 ?auto_163353 ) ) ( not ( = ?auto_163352 ?auto_163354 ) ) ( not ( = ?auto_163352 ?auto_163355 ) ) ( not ( = ?auto_163352 ?auto_163356 ) ) ( not ( = ?auto_163353 ?auto_163354 ) ) ( not ( = ?auto_163353 ?auto_163355 ) ) ( not ( = ?auto_163353 ?auto_163356 ) ) ( not ( = ?auto_163354 ?auto_163355 ) ) ( not ( = ?auto_163354 ?auto_163356 ) ) ( not ( = ?auto_163355 ?auto_163356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163355 ?auto_163356 )
      ( !STACK ?auto_163355 ?auto_163354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163369 - BLOCK
      ?auto_163370 - BLOCK
      ?auto_163371 - BLOCK
      ?auto_163372 - BLOCK
      ?auto_163373 - BLOCK
      ?auto_163374 - BLOCK
      ?auto_163375 - BLOCK
      ?auto_163376 - BLOCK
      ?auto_163377 - BLOCK
      ?auto_163378 - BLOCK
      ?auto_163379 - BLOCK
      ?auto_163380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163379 ) ( ON-TABLE ?auto_163380 ) ( CLEAR ?auto_163380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163369 ) ( ON ?auto_163370 ?auto_163369 ) ( ON ?auto_163371 ?auto_163370 ) ( ON ?auto_163372 ?auto_163371 ) ( ON ?auto_163373 ?auto_163372 ) ( ON ?auto_163374 ?auto_163373 ) ( ON ?auto_163375 ?auto_163374 ) ( ON ?auto_163376 ?auto_163375 ) ( ON ?auto_163377 ?auto_163376 ) ( ON ?auto_163378 ?auto_163377 ) ( ON ?auto_163379 ?auto_163378 ) ( not ( = ?auto_163369 ?auto_163370 ) ) ( not ( = ?auto_163369 ?auto_163371 ) ) ( not ( = ?auto_163369 ?auto_163372 ) ) ( not ( = ?auto_163369 ?auto_163373 ) ) ( not ( = ?auto_163369 ?auto_163374 ) ) ( not ( = ?auto_163369 ?auto_163375 ) ) ( not ( = ?auto_163369 ?auto_163376 ) ) ( not ( = ?auto_163369 ?auto_163377 ) ) ( not ( = ?auto_163369 ?auto_163378 ) ) ( not ( = ?auto_163369 ?auto_163379 ) ) ( not ( = ?auto_163369 ?auto_163380 ) ) ( not ( = ?auto_163370 ?auto_163371 ) ) ( not ( = ?auto_163370 ?auto_163372 ) ) ( not ( = ?auto_163370 ?auto_163373 ) ) ( not ( = ?auto_163370 ?auto_163374 ) ) ( not ( = ?auto_163370 ?auto_163375 ) ) ( not ( = ?auto_163370 ?auto_163376 ) ) ( not ( = ?auto_163370 ?auto_163377 ) ) ( not ( = ?auto_163370 ?auto_163378 ) ) ( not ( = ?auto_163370 ?auto_163379 ) ) ( not ( = ?auto_163370 ?auto_163380 ) ) ( not ( = ?auto_163371 ?auto_163372 ) ) ( not ( = ?auto_163371 ?auto_163373 ) ) ( not ( = ?auto_163371 ?auto_163374 ) ) ( not ( = ?auto_163371 ?auto_163375 ) ) ( not ( = ?auto_163371 ?auto_163376 ) ) ( not ( = ?auto_163371 ?auto_163377 ) ) ( not ( = ?auto_163371 ?auto_163378 ) ) ( not ( = ?auto_163371 ?auto_163379 ) ) ( not ( = ?auto_163371 ?auto_163380 ) ) ( not ( = ?auto_163372 ?auto_163373 ) ) ( not ( = ?auto_163372 ?auto_163374 ) ) ( not ( = ?auto_163372 ?auto_163375 ) ) ( not ( = ?auto_163372 ?auto_163376 ) ) ( not ( = ?auto_163372 ?auto_163377 ) ) ( not ( = ?auto_163372 ?auto_163378 ) ) ( not ( = ?auto_163372 ?auto_163379 ) ) ( not ( = ?auto_163372 ?auto_163380 ) ) ( not ( = ?auto_163373 ?auto_163374 ) ) ( not ( = ?auto_163373 ?auto_163375 ) ) ( not ( = ?auto_163373 ?auto_163376 ) ) ( not ( = ?auto_163373 ?auto_163377 ) ) ( not ( = ?auto_163373 ?auto_163378 ) ) ( not ( = ?auto_163373 ?auto_163379 ) ) ( not ( = ?auto_163373 ?auto_163380 ) ) ( not ( = ?auto_163374 ?auto_163375 ) ) ( not ( = ?auto_163374 ?auto_163376 ) ) ( not ( = ?auto_163374 ?auto_163377 ) ) ( not ( = ?auto_163374 ?auto_163378 ) ) ( not ( = ?auto_163374 ?auto_163379 ) ) ( not ( = ?auto_163374 ?auto_163380 ) ) ( not ( = ?auto_163375 ?auto_163376 ) ) ( not ( = ?auto_163375 ?auto_163377 ) ) ( not ( = ?auto_163375 ?auto_163378 ) ) ( not ( = ?auto_163375 ?auto_163379 ) ) ( not ( = ?auto_163375 ?auto_163380 ) ) ( not ( = ?auto_163376 ?auto_163377 ) ) ( not ( = ?auto_163376 ?auto_163378 ) ) ( not ( = ?auto_163376 ?auto_163379 ) ) ( not ( = ?auto_163376 ?auto_163380 ) ) ( not ( = ?auto_163377 ?auto_163378 ) ) ( not ( = ?auto_163377 ?auto_163379 ) ) ( not ( = ?auto_163377 ?auto_163380 ) ) ( not ( = ?auto_163378 ?auto_163379 ) ) ( not ( = ?auto_163378 ?auto_163380 ) ) ( not ( = ?auto_163379 ?auto_163380 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_163380 )
      ( !STACK ?auto_163380 ?auto_163379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163393 - BLOCK
      ?auto_163394 - BLOCK
      ?auto_163395 - BLOCK
      ?auto_163396 - BLOCK
      ?auto_163397 - BLOCK
      ?auto_163398 - BLOCK
      ?auto_163399 - BLOCK
      ?auto_163400 - BLOCK
      ?auto_163401 - BLOCK
      ?auto_163402 - BLOCK
      ?auto_163403 - BLOCK
      ?auto_163404 - BLOCK
    )
    :vars
    (
      ?auto_163405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163404 ?auto_163405 ) ( ON-TABLE ?auto_163393 ) ( ON ?auto_163394 ?auto_163393 ) ( ON ?auto_163395 ?auto_163394 ) ( ON ?auto_163396 ?auto_163395 ) ( ON ?auto_163397 ?auto_163396 ) ( ON ?auto_163398 ?auto_163397 ) ( ON ?auto_163399 ?auto_163398 ) ( ON ?auto_163400 ?auto_163399 ) ( ON ?auto_163401 ?auto_163400 ) ( ON ?auto_163402 ?auto_163401 ) ( not ( = ?auto_163393 ?auto_163394 ) ) ( not ( = ?auto_163393 ?auto_163395 ) ) ( not ( = ?auto_163393 ?auto_163396 ) ) ( not ( = ?auto_163393 ?auto_163397 ) ) ( not ( = ?auto_163393 ?auto_163398 ) ) ( not ( = ?auto_163393 ?auto_163399 ) ) ( not ( = ?auto_163393 ?auto_163400 ) ) ( not ( = ?auto_163393 ?auto_163401 ) ) ( not ( = ?auto_163393 ?auto_163402 ) ) ( not ( = ?auto_163393 ?auto_163403 ) ) ( not ( = ?auto_163393 ?auto_163404 ) ) ( not ( = ?auto_163393 ?auto_163405 ) ) ( not ( = ?auto_163394 ?auto_163395 ) ) ( not ( = ?auto_163394 ?auto_163396 ) ) ( not ( = ?auto_163394 ?auto_163397 ) ) ( not ( = ?auto_163394 ?auto_163398 ) ) ( not ( = ?auto_163394 ?auto_163399 ) ) ( not ( = ?auto_163394 ?auto_163400 ) ) ( not ( = ?auto_163394 ?auto_163401 ) ) ( not ( = ?auto_163394 ?auto_163402 ) ) ( not ( = ?auto_163394 ?auto_163403 ) ) ( not ( = ?auto_163394 ?auto_163404 ) ) ( not ( = ?auto_163394 ?auto_163405 ) ) ( not ( = ?auto_163395 ?auto_163396 ) ) ( not ( = ?auto_163395 ?auto_163397 ) ) ( not ( = ?auto_163395 ?auto_163398 ) ) ( not ( = ?auto_163395 ?auto_163399 ) ) ( not ( = ?auto_163395 ?auto_163400 ) ) ( not ( = ?auto_163395 ?auto_163401 ) ) ( not ( = ?auto_163395 ?auto_163402 ) ) ( not ( = ?auto_163395 ?auto_163403 ) ) ( not ( = ?auto_163395 ?auto_163404 ) ) ( not ( = ?auto_163395 ?auto_163405 ) ) ( not ( = ?auto_163396 ?auto_163397 ) ) ( not ( = ?auto_163396 ?auto_163398 ) ) ( not ( = ?auto_163396 ?auto_163399 ) ) ( not ( = ?auto_163396 ?auto_163400 ) ) ( not ( = ?auto_163396 ?auto_163401 ) ) ( not ( = ?auto_163396 ?auto_163402 ) ) ( not ( = ?auto_163396 ?auto_163403 ) ) ( not ( = ?auto_163396 ?auto_163404 ) ) ( not ( = ?auto_163396 ?auto_163405 ) ) ( not ( = ?auto_163397 ?auto_163398 ) ) ( not ( = ?auto_163397 ?auto_163399 ) ) ( not ( = ?auto_163397 ?auto_163400 ) ) ( not ( = ?auto_163397 ?auto_163401 ) ) ( not ( = ?auto_163397 ?auto_163402 ) ) ( not ( = ?auto_163397 ?auto_163403 ) ) ( not ( = ?auto_163397 ?auto_163404 ) ) ( not ( = ?auto_163397 ?auto_163405 ) ) ( not ( = ?auto_163398 ?auto_163399 ) ) ( not ( = ?auto_163398 ?auto_163400 ) ) ( not ( = ?auto_163398 ?auto_163401 ) ) ( not ( = ?auto_163398 ?auto_163402 ) ) ( not ( = ?auto_163398 ?auto_163403 ) ) ( not ( = ?auto_163398 ?auto_163404 ) ) ( not ( = ?auto_163398 ?auto_163405 ) ) ( not ( = ?auto_163399 ?auto_163400 ) ) ( not ( = ?auto_163399 ?auto_163401 ) ) ( not ( = ?auto_163399 ?auto_163402 ) ) ( not ( = ?auto_163399 ?auto_163403 ) ) ( not ( = ?auto_163399 ?auto_163404 ) ) ( not ( = ?auto_163399 ?auto_163405 ) ) ( not ( = ?auto_163400 ?auto_163401 ) ) ( not ( = ?auto_163400 ?auto_163402 ) ) ( not ( = ?auto_163400 ?auto_163403 ) ) ( not ( = ?auto_163400 ?auto_163404 ) ) ( not ( = ?auto_163400 ?auto_163405 ) ) ( not ( = ?auto_163401 ?auto_163402 ) ) ( not ( = ?auto_163401 ?auto_163403 ) ) ( not ( = ?auto_163401 ?auto_163404 ) ) ( not ( = ?auto_163401 ?auto_163405 ) ) ( not ( = ?auto_163402 ?auto_163403 ) ) ( not ( = ?auto_163402 ?auto_163404 ) ) ( not ( = ?auto_163402 ?auto_163405 ) ) ( not ( = ?auto_163403 ?auto_163404 ) ) ( not ( = ?auto_163403 ?auto_163405 ) ) ( not ( = ?auto_163404 ?auto_163405 ) ) ( CLEAR ?auto_163402 ) ( ON ?auto_163403 ?auto_163404 ) ( CLEAR ?auto_163403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_163393 ?auto_163394 ?auto_163395 ?auto_163396 ?auto_163397 ?auto_163398 ?auto_163399 ?auto_163400 ?auto_163401 ?auto_163402 ?auto_163403 )
      ( MAKE-12PILE ?auto_163393 ?auto_163394 ?auto_163395 ?auto_163396 ?auto_163397 ?auto_163398 ?auto_163399 ?auto_163400 ?auto_163401 ?auto_163402 ?auto_163403 ?auto_163404 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163418 - BLOCK
      ?auto_163419 - BLOCK
      ?auto_163420 - BLOCK
      ?auto_163421 - BLOCK
      ?auto_163422 - BLOCK
      ?auto_163423 - BLOCK
      ?auto_163424 - BLOCK
      ?auto_163425 - BLOCK
      ?auto_163426 - BLOCK
      ?auto_163427 - BLOCK
      ?auto_163428 - BLOCK
      ?auto_163429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163429 ) ( ON-TABLE ?auto_163418 ) ( ON ?auto_163419 ?auto_163418 ) ( ON ?auto_163420 ?auto_163419 ) ( ON ?auto_163421 ?auto_163420 ) ( ON ?auto_163422 ?auto_163421 ) ( ON ?auto_163423 ?auto_163422 ) ( ON ?auto_163424 ?auto_163423 ) ( ON ?auto_163425 ?auto_163424 ) ( ON ?auto_163426 ?auto_163425 ) ( ON ?auto_163427 ?auto_163426 ) ( not ( = ?auto_163418 ?auto_163419 ) ) ( not ( = ?auto_163418 ?auto_163420 ) ) ( not ( = ?auto_163418 ?auto_163421 ) ) ( not ( = ?auto_163418 ?auto_163422 ) ) ( not ( = ?auto_163418 ?auto_163423 ) ) ( not ( = ?auto_163418 ?auto_163424 ) ) ( not ( = ?auto_163418 ?auto_163425 ) ) ( not ( = ?auto_163418 ?auto_163426 ) ) ( not ( = ?auto_163418 ?auto_163427 ) ) ( not ( = ?auto_163418 ?auto_163428 ) ) ( not ( = ?auto_163418 ?auto_163429 ) ) ( not ( = ?auto_163419 ?auto_163420 ) ) ( not ( = ?auto_163419 ?auto_163421 ) ) ( not ( = ?auto_163419 ?auto_163422 ) ) ( not ( = ?auto_163419 ?auto_163423 ) ) ( not ( = ?auto_163419 ?auto_163424 ) ) ( not ( = ?auto_163419 ?auto_163425 ) ) ( not ( = ?auto_163419 ?auto_163426 ) ) ( not ( = ?auto_163419 ?auto_163427 ) ) ( not ( = ?auto_163419 ?auto_163428 ) ) ( not ( = ?auto_163419 ?auto_163429 ) ) ( not ( = ?auto_163420 ?auto_163421 ) ) ( not ( = ?auto_163420 ?auto_163422 ) ) ( not ( = ?auto_163420 ?auto_163423 ) ) ( not ( = ?auto_163420 ?auto_163424 ) ) ( not ( = ?auto_163420 ?auto_163425 ) ) ( not ( = ?auto_163420 ?auto_163426 ) ) ( not ( = ?auto_163420 ?auto_163427 ) ) ( not ( = ?auto_163420 ?auto_163428 ) ) ( not ( = ?auto_163420 ?auto_163429 ) ) ( not ( = ?auto_163421 ?auto_163422 ) ) ( not ( = ?auto_163421 ?auto_163423 ) ) ( not ( = ?auto_163421 ?auto_163424 ) ) ( not ( = ?auto_163421 ?auto_163425 ) ) ( not ( = ?auto_163421 ?auto_163426 ) ) ( not ( = ?auto_163421 ?auto_163427 ) ) ( not ( = ?auto_163421 ?auto_163428 ) ) ( not ( = ?auto_163421 ?auto_163429 ) ) ( not ( = ?auto_163422 ?auto_163423 ) ) ( not ( = ?auto_163422 ?auto_163424 ) ) ( not ( = ?auto_163422 ?auto_163425 ) ) ( not ( = ?auto_163422 ?auto_163426 ) ) ( not ( = ?auto_163422 ?auto_163427 ) ) ( not ( = ?auto_163422 ?auto_163428 ) ) ( not ( = ?auto_163422 ?auto_163429 ) ) ( not ( = ?auto_163423 ?auto_163424 ) ) ( not ( = ?auto_163423 ?auto_163425 ) ) ( not ( = ?auto_163423 ?auto_163426 ) ) ( not ( = ?auto_163423 ?auto_163427 ) ) ( not ( = ?auto_163423 ?auto_163428 ) ) ( not ( = ?auto_163423 ?auto_163429 ) ) ( not ( = ?auto_163424 ?auto_163425 ) ) ( not ( = ?auto_163424 ?auto_163426 ) ) ( not ( = ?auto_163424 ?auto_163427 ) ) ( not ( = ?auto_163424 ?auto_163428 ) ) ( not ( = ?auto_163424 ?auto_163429 ) ) ( not ( = ?auto_163425 ?auto_163426 ) ) ( not ( = ?auto_163425 ?auto_163427 ) ) ( not ( = ?auto_163425 ?auto_163428 ) ) ( not ( = ?auto_163425 ?auto_163429 ) ) ( not ( = ?auto_163426 ?auto_163427 ) ) ( not ( = ?auto_163426 ?auto_163428 ) ) ( not ( = ?auto_163426 ?auto_163429 ) ) ( not ( = ?auto_163427 ?auto_163428 ) ) ( not ( = ?auto_163427 ?auto_163429 ) ) ( not ( = ?auto_163428 ?auto_163429 ) ) ( CLEAR ?auto_163427 ) ( ON ?auto_163428 ?auto_163429 ) ( CLEAR ?auto_163428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_163418 ?auto_163419 ?auto_163420 ?auto_163421 ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 )
      ( MAKE-12PILE ?auto_163418 ?auto_163419 ?auto_163420 ?auto_163421 ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 ?auto_163429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163442 - BLOCK
      ?auto_163443 - BLOCK
      ?auto_163444 - BLOCK
      ?auto_163445 - BLOCK
      ?auto_163446 - BLOCK
      ?auto_163447 - BLOCK
      ?auto_163448 - BLOCK
      ?auto_163449 - BLOCK
      ?auto_163450 - BLOCK
      ?auto_163451 - BLOCK
      ?auto_163452 - BLOCK
      ?auto_163453 - BLOCK
    )
    :vars
    (
      ?auto_163454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163453 ?auto_163454 ) ( ON-TABLE ?auto_163442 ) ( ON ?auto_163443 ?auto_163442 ) ( ON ?auto_163444 ?auto_163443 ) ( ON ?auto_163445 ?auto_163444 ) ( ON ?auto_163446 ?auto_163445 ) ( ON ?auto_163447 ?auto_163446 ) ( ON ?auto_163448 ?auto_163447 ) ( ON ?auto_163449 ?auto_163448 ) ( ON ?auto_163450 ?auto_163449 ) ( not ( = ?auto_163442 ?auto_163443 ) ) ( not ( = ?auto_163442 ?auto_163444 ) ) ( not ( = ?auto_163442 ?auto_163445 ) ) ( not ( = ?auto_163442 ?auto_163446 ) ) ( not ( = ?auto_163442 ?auto_163447 ) ) ( not ( = ?auto_163442 ?auto_163448 ) ) ( not ( = ?auto_163442 ?auto_163449 ) ) ( not ( = ?auto_163442 ?auto_163450 ) ) ( not ( = ?auto_163442 ?auto_163451 ) ) ( not ( = ?auto_163442 ?auto_163452 ) ) ( not ( = ?auto_163442 ?auto_163453 ) ) ( not ( = ?auto_163442 ?auto_163454 ) ) ( not ( = ?auto_163443 ?auto_163444 ) ) ( not ( = ?auto_163443 ?auto_163445 ) ) ( not ( = ?auto_163443 ?auto_163446 ) ) ( not ( = ?auto_163443 ?auto_163447 ) ) ( not ( = ?auto_163443 ?auto_163448 ) ) ( not ( = ?auto_163443 ?auto_163449 ) ) ( not ( = ?auto_163443 ?auto_163450 ) ) ( not ( = ?auto_163443 ?auto_163451 ) ) ( not ( = ?auto_163443 ?auto_163452 ) ) ( not ( = ?auto_163443 ?auto_163453 ) ) ( not ( = ?auto_163443 ?auto_163454 ) ) ( not ( = ?auto_163444 ?auto_163445 ) ) ( not ( = ?auto_163444 ?auto_163446 ) ) ( not ( = ?auto_163444 ?auto_163447 ) ) ( not ( = ?auto_163444 ?auto_163448 ) ) ( not ( = ?auto_163444 ?auto_163449 ) ) ( not ( = ?auto_163444 ?auto_163450 ) ) ( not ( = ?auto_163444 ?auto_163451 ) ) ( not ( = ?auto_163444 ?auto_163452 ) ) ( not ( = ?auto_163444 ?auto_163453 ) ) ( not ( = ?auto_163444 ?auto_163454 ) ) ( not ( = ?auto_163445 ?auto_163446 ) ) ( not ( = ?auto_163445 ?auto_163447 ) ) ( not ( = ?auto_163445 ?auto_163448 ) ) ( not ( = ?auto_163445 ?auto_163449 ) ) ( not ( = ?auto_163445 ?auto_163450 ) ) ( not ( = ?auto_163445 ?auto_163451 ) ) ( not ( = ?auto_163445 ?auto_163452 ) ) ( not ( = ?auto_163445 ?auto_163453 ) ) ( not ( = ?auto_163445 ?auto_163454 ) ) ( not ( = ?auto_163446 ?auto_163447 ) ) ( not ( = ?auto_163446 ?auto_163448 ) ) ( not ( = ?auto_163446 ?auto_163449 ) ) ( not ( = ?auto_163446 ?auto_163450 ) ) ( not ( = ?auto_163446 ?auto_163451 ) ) ( not ( = ?auto_163446 ?auto_163452 ) ) ( not ( = ?auto_163446 ?auto_163453 ) ) ( not ( = ?auto_163446 ?auto_163454 ) ) ( not ( = ?auto_163447 ?auto_163448 ) ) ( not ( = ?auto_163447 ?auto_163449 ) ) ( not ( = ?auto_163447 ?auto_163450 ) ) ( not ( = ?auto_163447 ?auto_163451 ) ) ( not ( = ?auto_163447 ?auto_163452 ) ) ( not ( = ?auto_163447 ?auto_163453 ) ) ( not ( = ?auto_163447 ?auto_163454 ) ) ( not ( = ?auto_163448 ?auto_163449 ) ) ( not ( = ?auto_163448 ?auto_163450 ) ) ( not ( = ?auto_163448 ?auto_163451 ) ) ( not ( = ?auto_163448 ?auto_163452 ) ) ( not ( = ?auto_163448 ?auto_163453 ) ) ( not ( = ?auto_163448 ?auto_163454 ) ) ( not ( = ?auto_163449 ?auto_163450 ) ) ( not ( = ?auto_163449 ?auto_163451 ) ) ( not ( = ?auto_163449 ?auto_163452 ) ) ( not ( = ?auto_163449 ?auto_163453 ) ) ( not ( = ?auto_163449 ?auto_163454 ) ) ( not ( = ?auto_163450 ?auto_163451 ) ) ( not ( = ?auto_163450 ?auto_163452 ) ) ( not ( = ?auto_163450 ?auto_163453 ) ) ( not ( = ?auto_163450 ?auto_163454 ) ) ( not ( = ?auto_163451 ?auto_163452 ) ) ( not ( = ?auto_163451 ?auto_163453 ) ) ( not ( = ?auto_163451 ?auto_163454 ) ) ( not ( = ?auto_163452 ?auto_163453 ) ) ( not ( = ?auto_163452 ?auto_163454 ) ) ( not ( = ?auto_163453 ?auto_163454 ) ) ( ON ?auto_163452 ?auto_163453 ) ( CLEAR ?auto_163450 ) ( ON ?auto_163451 ?auto_163452 ) ( CLEAR ?auto_163451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 ?auto_163446 ?auto_163447 ?auto_163448 ?auto_163449 ?auto_163450 ?auto_163451 )
      ( MAKE-12PILE ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 ?auto_163446 ?auto_163447 ?auto_163448 ?auto_163449 ?auto_163450 ?auto_163451 ?auto_163452 ?auto_163453 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163467 - BLOCK
      ?auto_163468 - BLOCK
      ?auto_163469 - BLOCK
      ?auto_163470 - BLOCK
      ?auto_163471 - BLOCK
      ?auto_163472 - BLOCK
      ?auto_163473 - BLOCK
      ?auto_163474 - BLOCK
      ?auto_163475 - BLOCK
      ?auto_163476 - BLOCK
      ?auto_163477 - BLOCK
      ?auto_163478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163478 ) ( ON-TABLE ?auto_163467 ) ( ON ?auto_163468 ?auto_163467 ) ( ON ?auto_163469 ?auto_163468 ) ( ON ?auto_163470 ?auto_163469 ) ( ON ?auto_163471 ?auto_163470 ) ( ON ?auto_163472 ?auto_163471 ) ( ON ?auto_163473 ?auto_163472 ) ( ON ?auto_163474 ?auto_163473 ) ( ON ?auto_163475 ?auto_163474 ) ( not ( = ?auto_163467 ?auto_163468 ) ) ( not ( = ?auto_163467 ?auto_163469 ) ) ( not ( = ?auto_163467 ?auto_163470 ) ) ( not ( = ?auto_163467 ?auto_163471 ) ) ( not ( = ?auto_163467 ?auto_163472 ) ) ( not ( = ?auto_163467 ?auto_163473 ) ) ( not ( = ?auto_163467 ?auto_163474 ) ) ( not ( = ?auto_163467 ?auto_163475 ) ) ( not ( = ?auto_163467 ?auto_163476 ) ) ( not ( = ?auto_163467 ?auto_163477 ) ) ( not ( = ?auto_163467 ?auto_163478 ) ) ( not ( = ?auto_163468 ?auto_163469 ) ) ( not ( = ?auto_163468 ?auto_163470 ) ) ( not ( = ?auto_163468 ?auto_163471 ) ) ( not ( = ?auto_163468 ?auto_163472 ) ) ( not ( = ?auto_163468 ?auto_163473 ) ) ( not ( = ?auto_163468 ?auto_163474 ) ) ( not ( = ?auto_163468 ?auto_163475 ) ) ( not ( = ?auto_163468 ?auto_163476 ) ) ( not ( = ?auto_163468 ?auto_163477 ) ) ( not ( = ?auto_163468 ?auto_163478 ) ) ( not ( = ?auto_163469 ?auto_163470 ) ) ( not ( = ?auto_163469 ?auto_163471 ) ) ( not ( = ?auto_163469 ?auto_163472 ) ) ( not ( = ?auto_163469 ?auto_163473 ) ) ( not ( = ?auto_163469 ?auto_163474 ) ) ( not ( = ?auto_163469 ?auto_163475 ) ) ( not ( = ?auto_163469 ?auto_163476 ) ) ( not ( = ?auto_163469 ?auto_163477 ) ) ( not ( = ?auto_163469 ?auto_163478 ) ) ( not ( = ?auto_163470 ?auto_163471 ) ) ( not ( = ?auto_163470 ?auto_163472 ) ) ( not ( = ?auto_163470 ?auto_163473 ) ) ( not ( = ?auto_163470 ?auto_163474 ) ) ( not ( = ?auto_163470 ?auto_163475 ) ) ( not ( = ?auto_163470 ?auto_163476 ) ) ( not ( = ?auto_163470 ?auto_163477 ) ) ( not ( = ?auto_163470 ?auto_163478 ) ) ( not ( = ?auto_163471 ?auto_163472 ) ) ( not ( = ?auto_163471 ?auto_163473 ) ) ( not ( = ?auto_163471 ?auto_163474 ) ) ( not ( = ?auto_163471 ?auto_163475 ) ) ( not ( = ?auto_163471 ?auto_163476 ) ) ( not ( = ?auto_163471 ?auto_163477 ) ) ( not ( = ?auto_163471 ?auto_163478 ) ) ( not ( = ?auto_163472 ?auto_163473 ) ) ( not ( = ?auto_163472 ?auto_163474 ) ) ( not ( = ?auto_163472 ?auto_163475 ) ) ( not ( = ?auto_163472 ?auto_163476 ) ) ( not ( = ?auto_163472 ?auto_163477 ) ) ( not ( = ?auto_163472 ?auto_163478 ) ) ( not ( = ?auto_163473 ?auto_163474 ) ) ( not ( = ?auto_163473 ?auto_163475 ) ) ( not ( = ?auto_163473 ?auto_163476 ) ) ( not ( = ?auto_163473 ?auto_163477 ) ) ( not ( = ?auto_163473 ?auto_163478 ) ) ( not ( = ?auto_163474 ?auto_163475 ) ) ( not ( = ?auto_163474 ?auto_163476 ) ) ( not ( = ?auto_163474 ?auto_163477 ) ) ( not ( = ?auto_163474 ?auto_163478 ) ) ( not ( = ?auto_163475 ?auto_163476 ) ) ( not ( = ?auto_163475 ?auto_163477 ) ) ( not ( = ?auto_163475 ?auto_163478 ) ) ( not ( = ?auto_163476 ?auto_163477 ) ) ( not ( = ?auto_163476 ?auto_163478 ) ) ( not ( = ?auto_163477 ?auto_163478 ) ) ( ON ?auto_163477 ?auto_163478 ) ( CLEAR ?auto_163475 ) ( ON ?auto_163476 ?auto_163477 ) ( CLEAR ?auto_163476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_163467 ?auto_163468 ?auto_163469 ?auto_163470 ?auto_163471 ?auto_163472 ?auto_163473 ?auto_163474 ?auto_163475 ?auto_163476 )
      ( MAKE-12PILE ?auto_163467 ?auto_163468 ?auto_163469 ?auto_163470 ?auto_163471 ?auto_163472 ?auto_163473 ?auto_163474 ?auto_163475 ?auto_163476 ?auto_163477 ?auto_163478 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163491 - BLOCK
      ?auto_163492 - BLOCK
      ?auto_163493 - BLOCK
      ?auto_163494 - BLOCK
      ?auto_163495 - BLOCK
      ?auto_163496 - BLOCK
      ?auto_163497 - BLOCK
      ?auto_163498 - BLOCK
      ?auto_163499 - BLOCK
      ?auto_163500 - BLOCK
      ?auto_163501 - BLOCK
      ?auto_163502 - BLOCK
    )
    :vars
    (
      ?auto_163503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163502 ?auto_163503 ) ( ON-TABLE ?auto_163491 ) ( ON ?auto_163492 ?auto_163491 ) ( ON ?auto_163493 ?auto_163492 ) ( ON ?auto_163494 ?auto_163493 ) ( ON ?auto_163495 ?auto_163494 ) ( ON ?auto_163496 ?auto_163495 ) ( ON ?auto_163497 ?auto_163496 ) ( ON ?auto_163498 ?auto_163497 ) ( not ( = ?auto_163491 ?auto_163492 ) ) ( not ( = ?auto_163491 ?auto_163493 ) ) ( not ( = ?auto_163491 ?auto_163494 ) ) ( not ( = ?auto_163491 ?auto_163495 ) ) ( not ( = ?auto_163491 ?auto_163496 ) ) ( not ( = ?auto_163491 ?auto_163497 ) ) ( not ( = ?auto_163491 ?auto_163498 ) ) ( not ( = ?auto_163491 ?auto_163499 ) ) ( not ( = ?auto_163491 ?auto_163500 ) ) ( not ( = ?auto_163491 ?auto_163501 ) ) ( not ( = ?auto_163491 ?auto_163502 ) ) ( not ( = ?auto_163491 ?auto_163503 ) ) ( not ( = ?auto_163492 ?auto_163493 ) ) ( not ( = ?auto_163492 ?auto_163494 ) ) ( not ( = ?auto_163492 ?auto_163495 ) ) ( not ( = ?auto_163492 ?auto_163496 ) ) ( not ( = ?auto_163492 ?auto_163497 ) ) ( not ( = ?auto_163492 ?auto_163498 ) ) ( not ( = ?auto_163492 ?auto_163499 ) ) ( not ( = ?auto_163492 ?auto_163500 ) ) ( not ( = ?auto_163492 ?auto_163501 ) ) ( not ( = ?auto_163492 ?auto_163502 ) ) ( not ( = ?auto_163492 ?auto_163503 ) ) ( not ( = ?auto_163493 ?auto_163494 ) ) ( not ( = ?auto_163493 ?auto_163495 ) ) ( not ( = ?auto_163493 ?auto_163496 ) ) ( not ( = ?auto_163493 ?auto_163497 ) ) ( not ( = ?auto_163493 ?auto_163498 ) ) ( not ( = ?auto_163493 ?auto_163499 ) ) ( not ( = ?auto_163493 ?auto_163500 ) ) ( not ( = ?auto_163493 ?auto_163501 ) ) ( not ( = ?auto_163493 ?auto_163502 ) ) ( not ( = ?auto_163493 ?auto_163503 ) ) ( not ( = ?auto_163494 ?auto_163495 ) ) ( not ( = ?auto_163494 ?auto_163496 ) ) ( not ( = ?auto_163494 ?auto_163497 ) ) ( not ( = ?auto_163494 ?auto_163498 ) ) ( not ( = ?auto_163494 ?auto_163499 ) ) ( not ( = ?auto_163494 ?auto_163500 ) ) ( not ( = ?auto_163494 ?auto_163501 ) ) ( not ( = ?auto_163494 ?auto_163502 ) ) ( not ( = ?auto_163494 ?auto_163503 ) ) ( not ( = ?auto_163495 ?auto_163496 ) ) ( not ( = ?auto_163495 ?auto_163497 ) ) ( not ( = ?auto_163495 ?auto_163498 ) ) ( not ( = ?auto_163495 ?auto_163499 ) ) ( not ( = ?auto_163495 ?auto_163500 ) ) ( not ( = ?auto_163495 ?auto_163501 ) ) ( not ( = ?auto_163495 ?auto_163502 ) ) ( not ( = ?auto_163495 ?auto_163503 ) ) ( not ( = ?auto_163496 ?auto_163497 ) ) ( not ( = ?auto_163496 ?auto_163498 ) ) ( not ( = ?auto_163496 ?auto_163499 ) ) ( not ( = ?auto_163496 ?auto_163500 ) ) ( not ( = ?auto_163496 ?auto_163501 ) ) ( not ( = ?auto_163496 ?auto_163502 ) ) ( not ( = ?auto_163496 ?auto_163503 ) ) ( not ( = ?auto_163497 ?auto_163498 ) ) ( not ( = ?auto_163497 ?auto_163499 ) ) ( not ( = ?auto_163497 ?auto_163500 ) ) ( not ( = ?auto_163497 ?auto_163501 ) ) ( not ( = ?auto_163497 ?auto_163502 ) ) ( not ( = ?auto_163497 ?auto_163503 ) ) ( not ( = ?auto_163498 ?auto_163499 ) ) ( not ( = ?auto_163498 ?auto_163500 ) ) ( not ( = ?auto_163498 ?auto_163501 ) ) ( not ( = ?auto_163498 ?auto_163502 ) ) ( not ( = ?auto_163498 ?auto_163503 ) ) ( not ( = ?auto_163499 ?auto_163500 ) ) ( not ( = ?auto_163499 ?auto_163501 ) ) ( not ( = ?auto_163499 ?auto_163502 ) ) ( not ( = ?auto_163499 ?auto_163503 ) ) ( not ( = ?auto_163500 ?auto_163501 ) ) ( not ( = ?auto_163500 ?auto_163502 ) ) ( not ( = ?auto_163500 ?auto_163503 ) ) ( not ( = ?auto_163501 ?auto_163502 ) ) ( not ( = ?auto_163501 ?auto_163503 ) ) ( not ( = ?auto_163502 ?auto_163503 ) ) ( ON ?auto_163501 ?auto_163502 ) ( ON ?auto_163500 ?auto_163501 ) ( CLEAR ?auto_163498 ) ( ON ?auto_163499 ?auto_163500 ) ( CLEAR ?auto_163499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_163491 ?auto_163492 ?auto_163493 ?auto_163494 ?auto_163495 ?auto_163496 ?auto_163497 ?auto_163498 ?auto_163499 )
      ( MAKE-12PILE ?auto_163491 ?auto_163492 ?auto_163493 ?auto_163494 ?auto_163495 ?auto_163496 ?auto_163497 ?auto_163498 ?auto_163499 ?auto_163500 ?auto_163501 ?auto_163502 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163516 - BLOCK
      ?auto_163517 - BLOCK
      ?auto_163518 - BLOCK
      ?auto_163519 - BLOCK
      ?auto_163520 - BLOCK
      ?auto_163521 - BLOCK
      ?auto_163522 - BLOCK
      ?auto_163523 - BLOCK
      ?auto_163524 - BLOCK
      ?auto_163525 - BLOCK
      ?auto_163526 - BLOCK
      ?auto_163527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163527 ) ( ON-TABLE ?auto_163516 ) ( ON ?auto_163517 ?auto_163516 ) ( ON ?auto_163518 ?auto_163517 ) ( ON ?auto_163519 ?auto_163518 ) ( ON ?auto_163520 ?auto_163519 ) ( ON ?auto_163521 ?auto_163520 ) ( ON ?auto_163522 ?auto_163521 ) ( ON ?auto_163523 ?auto_163522 ) ( not ( = ?auto_163516 ?auto_163517 ) ) ( not ( = ?auto_163516 ?auto_163518 ) ) ( not ( = ?auto_163516 ?auto_163519 ) ) ( not ( = ?auto_163516 ?auto_163520 ) ) ( not ( = ?auto_163516 ?auto_163521 ) ) ( not ( = ?auto_163516 ?auto_163522 ) ) ( not ( = ?auto_163516 ?auto_163523 ) ) ( not ( = ?auto_163516 ?auto_163524 ) ) ( not ( = ?auto_163516 ?auto_163525 ) ) ( not ( = ?auto_163516 ?auto_163526 ) ) ( not ( = ?auto_163516 ?auto_163527 ) ) ( not ( = ?auto_163517 ?auto_163518 ) ) ( not ( = ?auto_163517 ?auto_163519 ) ) ( not ( = ?auto_163517 ?auto_163520 ) ) ( not ( = ?auto_163517 ?auto_163521 ) ) ( not ( = ?auto_163517 ?auto_163522 ) ) ( not ( = ?auto_163517 ?auto_163523 ) ) ( not ( = ?auto_163517 ?auto_163524 ) ) ( not ( = ?auto_163517 ?auto_163525 ) ) ( not ( = ?auto_163517 ?auto_163526 ) ) ( not ( = ?auto_163517 ?auto_163527 ) ) ( not ( = ?auto_163518 ?auto_163519 ) ) ( not ( = ?auto_163518 ?auto_163520 ) ) ( not ( = ?auto_163518 ?auto_163521 ) ) ( not ( = ?auto_163518 ?auto_163522 ) ) ( not ( = ?auto_163518 ?auto_163523 ) ) ( not ( = ?auto_163518 ?auto_163524 ) ) ( not ( = ?auto_163518 ?auto_163525 ) ) ( not ( = ?auto_163518 ?auto_163526 ) ) ( not ( = ?auto_163518 ?auto_163527 ) ) ( not ( = ?auto_163519 ?auto_163520 ) ) ( not ( = ?auto_163519 ?auto_163521 ) ) ( not ( = ?auto_163519 ?auto_163522 ) ) ( not ( = ?auto_163519 ?auto_163523 ) ) ( not ( = ?auto_163519 ?auto_163524 ) ) ( not ( = ?auto_163519 ?auto_163525 ) ) ( not ( = ?auto_163519 ?auto_163526 ) ) ( not ( = ?auto_163519 ?auto_163527 ) ) ( not ( = ?auto_163520 ?auto_163521 ) ) ( not ( = ?auto_163520 ?auto_163522 ) ) ( not ( = ?auto_163520 ?auto_163523 ) ) ( not ( = ?auto_163520 ?auto_163524 ) ) ( not ( = ?auto_163520 ?auto_163525 ) ) ( not ( = ?auto_163520 ?auto_163526 ) ) ( not ( = ?auto_163520 ?auto_163527 ) ) ( not ( = ?auto_163521 ?auto_163522 ) ) ( not ( = ?auto_163521 ?auto_163523 ) ) ( not ( = ?auto_163521 ?auto_163524 ) ) ( not ( = ?auto_163521 ?auto_163525 ) ) ( not ( = ?auto_163521 ?auto_163526 ) ) ( not ( = ?auto_163521 ?auto_163527 ) ) ( not ( = ?auto_163522 ?auto_163523 ) ) ( not ( = ?auto_163522 ?auto_163524 ) ) ( not ( = ?auto_163522 ?auto_163525 ) ) ( not ( = ?auto_163522 ?auto_163526 ) ) ( not ( = ?auto_163522 ?auto_163527 ) ) ( not ( = ?auto_163523 ?auto_163524 ) ) ( not ( = ?auto_163523 ?auto_163525 ) ) ( not ( = ?auto_163523 ?auto_163526 ) ) ( not ( = ?auto_163523 ?auto_163527 ) ) ( not ( = ?auto_163524 ?auto_163525 ) ) ( not ( = ?auto_163524 ?auto_163526 ) ) ( not ( = ?auto_163524 ?auto_163527 ) ) ( not ( = ?auto_163525 ?auto_163526 ) ) ( not ( = ?auto_163525 ?auto_163527 ) ) ( not ( = ?auto_163526 ?auto_163527 ) ) ( ON ?auto_163526 ?auto_163527 ) ( ON ?auto_163525 ?auto_163526 ) ( CLEAR ?auto_163523 ) ( ON ?auto_163524 ?auto_163525 ) ( CLEAR ?auto_163524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_163516 ?auto_163517 ?auto_163518 ?auto_163519 ?auto_163520 ?auto_163521 ?auto_163522 ?auto_163523 ?auto_163524 )
      ( MAKE-12PILE ?auto_163516 ?auto_163517 ?auto_163518 ?auto_163519 ?auto_163520 ?auto_163521 ?auto_163522 ?auto_163523 ?auto_163524 ?auto_163525 ?auto_163526 ?auto_163527 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163540 - BLOCK
      ?auto_163541 - BLOCK
      ?auto_163542 - BLOCK
      ?auto_163543 - BLOCK
      ?auto_163544 - BLOCK
      ?auto_163545 - BLOCK
      ?auto_163546 - BLOCK
      ?auto_163547 - BLOCK
      ?auto_163548 - BLOCK
      ?auto_163549 - BLOCK
      ?auto_163550 - BLOCK
      ?auto_163551 - BLOCK
    )
    :vars
    (
      ?auto_163552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163551 ?auto_163552 ) ( ON-TABLE ?auto_163540 ) ( ON ?auto_163541 ?auto_163540 ) ( ON ?auto_163542 ?auto_163541 ) ( ON ?auto_163543 ?auto_163542 ) ( ON ?auto_163544 ?auto_163543 ) ( ON ?auto_163545 ?auto_163544 ) ( ON ?auto_163546 ?auto_163545 ) ( not ( = ?auto_163540 ?auto_163541 ) ) ( not ( = ?auto_163540 ?auto_163542 ) ) ( not ( = ?auto_163540 ?auto_163543 ) ) ( not ( = ?auto_163540 ?auto_163544 ) ) ( not ( = ?auto_163540 ?auto_163545 ) ) ( not ( = ?auto_163540 ?auto_163546 ) ) ( not ( = ?auto_163540 ?auto_163547 ) ) ( not ( = ?auto_163540 ?auto_163548 ) ) ( not ( = ?auto_163540 ?auto_163549 ) ) ( not ( = ?auto_163540 ?auto_163550 ) ) ( not ( = ?auto_163540 ?auto_163551 ) ) ( not ( = ?auto_163540 ?auto_163552 ) ) ( not ( = ?auto_163541 ?auto_163542 ) ) ( not ( = ?auto_163541 ?auto_163543 ) ) ( not ( = ?auto_163541 ?auto_163544 ) ) ( not ( = ?auto_163541 ?auto_163545 ) ) ( not ( = ?auto_163541 ?auto_163546 ) ) ( not ( = ?auto_163541 ?auto_163547 ) ) ( not ( = ?auto_163541 ?auto_163548 ) ) ( not ( = ?auto_163541 ?auto_163549 ) ) ( not ( = ?auto_163541 ?auto_163550 ) ) ( not ( = ?auto_163541 ?auto_163551 ) ) ( not ( = ?auto_163541 ?auto_163552 ) ) ( not ( = ?auto_163542 ?auto_163543 ) ) ( not ( = ?auto_163542 ?auto_163544 ) ) ( not ( = ?auto_163542 ?auto_163545 ) ) ( not ( = ?auto_163542 ?auto_163546 ) ) ( not ( = ?auto_163542 ?auto_163547 ) ) ( not ( = ?auto_163542 ?auto_163548 ) ) ( not ( = ?auto_163542 ?auto_163549 ) ) ( not ( = ?auto_163542 ?auto_163550 ) ) ( not ( = ?auto_163542 ?auto_163551 ) ) ( not ( = ?auto_163542 ?auto_163552 ) ) ( not ( = ?auto_163543 ?auto_163544 ) ) ( not ( = ?auto_163543 ?auto_163545 ) ) ( not ( = ?auto_163543 ?auto_163546 ) ) ( not ( = ?auto_163543 ?auto_163547 ) ) ( not ( = ?auto_163543 ?auto_163548 ) ) ( not ( = ?auto_163543 ?auto_163549 ) ) ( not ( = ?auto_163543 ?auto_163550 ) ) ( not ( = ?auto_163543 ?auto_163551 ) ) ( not ( = ?auto_163543 ?auto_163552 ) ) ( not ( = ?auto_163544 ?auto_163545 ) ) ( not ( = ?auto_163544 ?auto_163546 ) ) ( not ( = ?auto_163544 ?auto_163547 ) ) ( not ( = ?auto_163544 ?auto_163548 ) ) ( not ( = ?auto_163544 ?auto_163549 ) ) ( not ( = ?auto_163544 ?auto_163550 ) ) ( not ( = ?auto_163544 ?auto_163551 ) ) ( not ( = ?auto_163544 ?auto_163552 ) ) ( not ( = ?auto_163545 ?auto_163546 ) ) ( not ( = ?auto_163545 ?auto_163547 ) ) ( not ( = ?auto_163545 ?auto_163548 ) ) ( not ( = ?auto_163545 ?auto_163549 ) ) ( not ( = ?auto_163545 ?auto_163550 ) ) ( not ( = ?auto_163545 ?auto_163551 ) ) ( not ( = ?auto_163545 ?auto_163552 ) ) ( not ( = ?auto_163546 ?auto_163547 ) ) ( not ( = ?auto_163546 ?auto_163548 ) ) ( not ( = ?auto_163546 ?auto_163549 ) ) ( not ( = ?auto_163546 ?auto_163550 ) ) ( not ( = ?auto_163546 ?auto_163551 ) ) ( not ( = ?auto_163546 ?auto_163552 ) ) ( not ( = ?auto_163547 ?auto_163548 ) ) ( not ( = ?auto_163547 ?auto_163549 ) ) ( not ( = ?auto_163547 ?auto_163550 ) ) ( not ( = ?auto_163547 ?auto_163551 ) ) ( not ( = ?auto_163547 ?auto_163552 ) ) ( not ( = ?auto_163548 ?auto_163549 ) ) ( not ( = ?auto_163548 ?auto_163550 ) ) ( not ( = ?auto_163548 ?auto_163551 ) ) ( not ( = ?auto_163548 ?auto_163552 ) ) ( not ( = ?auto_163549 ?auto_163550 ) ) ( not ( = ?auto_163549 ?auto_163551 ) ) ( not ( = ?auto_163549 ?auto_163552 ) ) ( not ( = ?auto_163550 ?auto_163551 ) ) ( not ( = ?auto_163550 ?auto_163552 ) ) ( not ( = ?auto_163551 ?auto_163552 ) ) ( ON ?auto_163550 ?auto_163551 ) ( ON ?auto_163549 ?auto_163550 ) ( ON ?auto_163548 ?auto_163549 ) ( CLEAR ?auto_163546 ) ( ON ?auto_163547 ?auto_163548 ) ( CLEAR ?auto_163547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163540 ?auto_163541 ?auto_163542 ?auto_163543 ?auto_163544 ?auto_163545 ?auto_163546 ?auto_163547 )
      ( MAKE-12PILE ?auto_163540 ?auto_163541 ?auto_163542 ?auto_163543 ?auto_163544 ?auto_163545 ?auto_163546 ?auto_163547 ?auto_163548 ?auto_163549 ?auto_163550 ?auto_163551 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163565 - BLOCK
      ?auto_163566 - BLOCK
      ?auto_163567 - BLOCK
      ?auto_163568 - BLOCK
      ?auto_163569 - BLOCK
      ?auto_163570 - BLOCK
      ?auto_163571 - BLOCK
      ?auto_163572 - BLOCK
      ?auto_163573 - BLOCK
      ?auto_163574 - BLOCK
      ?auto_163575 - BLOCK
      ?auto_163576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163576 ) ( ON-TABLE ?auto_163565 ) ( ON ?auto_163566 ?auto_163565 ) ( ON ?auto_163567 ?auto_163566 ) ( ON ?auto_163568 ?auto_163567 ) ( ON ?auto_163569 ?auto_163568 ) ( ON ?auto_163570 ?auto_163569 ) ( ON ?auto_163571 ?auto_163570 ) ( not ( = ?auto_163565 ?auto_163566 ) ) ( not ( = ?auto_163565 ?auto_163567 ) ) ( not ( = ?auto_163565 ?auto_163568 ) ) ( not ( = ?auto_163565 ?auto_163569 ) ) ( not ( = ?auto_163565 ?auto_163570 ) ) ( not ( = ?auto_163565 ?auto_163571 ) ) ( not ( = ?auto_163565 ?auto_163572 ) ) ( not ( = ?auto_163565 ?auto_163573 ) ) ( not ( = ?auto_163565 ?auto_163574 ) ) ( not ( = ?auto_163565 ?auto_163575 ) ) ( not ( = ?auto_163565 ?auto_163576 ) ) ( not ( = ?auto_163566 ?auto_163567 ) ) ( not ( = ?auto_163566 ?auto_163568 ) ) ( not ( = ?auto_163566 ?auto_163569 ) ) ( not ( = ?auto_163566 ?auto_163570 ) ) ( not ( = ?auto_163566 ?auto_163571 ) ) ( not ( = ?auto_163566 ?auto_163572 ) ) ( not ( = ?auto_163566 ?auto_163573 ) ) ( not ( = ?auto_163566 ?auto_163574 ) ) ( not ( = ?auto_163566 ?auto_163575 ) ) ( not ( = ?auto_163566 ?auto_163576 ) ) ( not ( = ?auto_163567 ?auto_163568 ) ) ( not ( = ?auto_163567 ?auto_163569 ) ) ( not ( = ?auto_163567 ?auto_163570 ) ) ( not ( = ?auto_163567 ?auto_163571 ) ) ( not ( = ?auto_163567 ?auto_163572 ) ) ( not ( = ?auto_163567 ?auto_163573 ) ) ( not ( = ?auto_163567 ?auto_163574 ) ) ( not ( = ?auto_163567 ?auto_163575 ) ) ( not ( = ?auto_163567 ?auto_163576 ) ) ( not ( = ?auto_163568 ?auto_163569 ) ) ( not ( = ?auto_163568 ?auto_163570 ) ) ( not ( = ?auto_163568 ?auto_163571 ) ) ( not ( = ?auto_163568 ?auto_163572 ) ) ( not ( = ?auto_163568 ?auto_163573 ) ) ( not ( = ?auto_163568 ?auto_163574 ) ) ( not ( = ?auto_163568 ?auto_163575 ) ) ( not ( = ?auto_163568 ?auto_163576 ) ) ( not ( = ?auto_163569 ?auto_163570 ) ) ( not ( = ?auto_163569 ?auto_163571 ) ) ( not ( = ?auto_163569 ?auto_163572 ) ) ( not ( = ?auto_163569 ?auto_163573 ) ) ( not ( = ?auto_163569 ?auto_163574 ) ) ( not ( = ?auto_163569 ?auto_163575 ) ) ( not ( = ?auto_163569 ?auto_163576 ) ) ( not ( = ?auto_163570 ?auto_163571 ) ) ( not ( = ?auto_163570 ?auto_163572 ) ) ( not ( = ?auto_163570 ?auto_163573 ) ) ( not ( = ?auto_163570 ?auto_163574 ) ) ( not ( = ?auto_163570 ?auto_163575 ) ) ( not ( = ?auto_163570 ?auto_163576 ) ) ( not ( = ?auto_163571 ?auto_163572 ) ) ( not ( = ?auto_163571 ?auto_163573 ) ) ( not ( = ?auto_163571 ?auto_163574 ) ) ( not ( = ?auto_163571 ?auto_163575 ) ) ( not ( = ?auto_163571 ?auto_163576 ) ) ( not ( = ?auto_163572 ?auto_163573 ) ) ( not ( = ?auto_163572 ?auto_163574 ) ) ( not ( = ?auto_163572 ?auto_163575 ) ) ( not ( = ?auto_163572 ?auto_163576 ) ) ( not ( = ?auto_163573 ?auto_163574 ) ) ( not ( = ?auto_163573 ?auto_163575 ) ) ( not ( = ?auto_163573 ?auto_163576 ) ) ( not ( = ?auto_163574 ?auto_163575 ) ) ( not ( = ?auto_163574 ?auto_163576 ) ) ( not ( = ?auto_163575 ?auto_163576 ) ) ( ON ?auto_163575 ?auto_163576 ) ( ON ?auto_163574 ?auto_163575 ) ( ON ?auto_163573 ?auto_163574 ) ( CLEAR ?auto_163571 ) ( ON ?auto_163572 ?auto_163573 ) ( CLEAR ?auto_163572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163565 ?auto_163566 ?auto_163567 ?auto_163568 ?auto_163569 ?auto_163570 ?auto_163571 ?auto_163572 )
      ( MAKE-12PILE ?auto_163565 ?auto_163566 ?auto_163567 ?auto_163568 ?auto_163569 ?auto_163570 ?auto_163571 ?auto_163572 ?auto_163573 ?auto_163574 ?auto_163575 ?auto_163576 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163589 - BLOCK
      ?auto_163590 - BLOCK
      ?auto_163591 - BLOCK
      ?auto_163592 - BLOCK
      ?auto_163593 - BLOCK
      ?auto_163594 - BLOCK
      ?auto_163595 - BLOCK
      ?auto_163596 - BLOCK
      ?auto_163597 - BLOCK
      ?auto_163598 - BLOCK
      ?auto_163599 - BLOCK
      ?auto_163600 - BLOCK
    )
    :vars
    (
      ?auto_163601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163600 ?auto_163601 ) ( ON-TABLE ?auto_163589 ) ( ON ?auto_163590 ?auto_163589 ) ( ON ?auto_163591 ?auto_163590 ) ( ON ?auto_163592 ?auto_163591 ) ( ON ?auto_163593 ?auto_163592 ) ( ON ?auto_163594 ?auto_163593 ) ( not ( = ?auto_163589 ?auto_163590 ) ) ( not ( = ?auto_163589 ?auto_163591 ) ) ( not ( = ?auto_163589 ?auto_163592 ) ) ( not ( = ?auto_163589 ?auto_163593 ) ) ( not ( = ?auto_163589 ?auto_163594 ) ) ( not ( = ?auto_163589 ?auto_163595 ) ) ( not ( = ?auto_163589 ?auto_163596 ) ) ( not ( = ?auto_163589 ?auto_163597 ) ) ( not ( = ?auto_163589 ?auto_163598 ) ) ( not ( = ?auto_163589 ?auto_163599 ) ) ( not ( = ?auto_163589 ?auto_163600 ) ) ( not ( = ?auto_163589 ?auto_163601 ) ) ( not ( = ?auto_163590 ?auto_163591 ) ) ( not ( = ?auto_163590 ?auto_163592 ) ) ( not ( = ?auto_163590 ?auto_163593 ) ) ( not ( = ?auto_163590 ?auto_163594 ) ) ( not ( = ?auto_163590 ?auto_163595 ) ) ( not ( = ?auto_163590 ?auto_163596 ) ) ( not ( = ?auto_163590 ?auto_163597 ) ) ( not ( = ?auto_163590 ?auto_163598 ) ) ( not ( = ?auto_163590 ?auto_163599 ) ) ( not ( = ?auto_163590 ?auto_163600 ) ) ( not ( = ?auto_163590 ?auto_163601 ) ) ( not ( = ?auto_163591 ?auto_163592 ) ) ( not ( = ?auto_163591 ?auto_163593 ) ) ( not ( = ?auto_163591 ?auto_163594 ) ) ( not ( = ?auto_163591 ?auto_163595 ) ) ( not ( = ?auto_163591 ?auto_163596 ) ) ( not ( = ?auto_163591 ?auto_163597 ) ) ( not ( = ?auto_163591 ?auto_163598 ) ) ( not ( = ?auto_163591 ?auto_163599 ) ) ( not ( = ?auto_163591 ?auto_163600 ) ) ( not ( = ?auto_163591 ?auto_163601 ) ) ( not ( = ?auto_163592 ?auto_163593 ) ) ( not ( = ?auto_163592 ?auto_163594 ) ) ( not ( = ?auto_163592 ?auto_163595 ) ) ( not ( = ?auto_163592 ?auto_163596 ) ) ( not ( = ?auto_163592 ?auto_163597 ) ) ( not ( = ?auto_163592 ?auto_163598 ) ) ( not ( = ?auto_163592 ?auto_163599 ) ) ( not ( = ?auto_163592 ?auto_163600 ) ) ( not ( = ?auto_163592 ?auto_163601 ) ) ( not ( = ?auto_163593 ?auto_163594 ) ) ( not ( = ?auto_163593 ?auto_163595 ) ) ( not ( = ?auto_163593 ?auto_163596 ) ) ( not ( = ?auto_163593 ?auto_163597 ) ) ( not ( = ?auto_163593 ?auto_163598 ) ) ( not ( = ?auto_163593 ?auto_163599 ) ) ( not ( = ?auto_163593 ?auto_163600 ) ) ( not ( = ?auto_163593 ?auto_163601 ) ) ( not ( = ?auto_163594 ?auto_163595 ) ) ( not ( = ?auto_163594 ?auto_163596 ) ) ( not ( = ?auto_163594 ?auto_163597 ) ) ( not ( = ?auto_163594 ?auto_163598 ) ) ( not ( = ?auto_163594 ?auto_163599 ) ) ( not ( = ?auto_163594 ?auto_163600 ) ) ( not ( = ?auto_163594 ?auto_163601 ) ) ( not ( = ?auto_163595 ?auto_163596 ) ) ( not ( = ?auto_163595 ?auto_163597 ) ) ( not ( = ?auto_163595 ?auto_163598 ) ) ( not ( = ?auto_163595 ?auto_163599 ) ) ( not ( = ?auto_163595 ?auto_163600 ) ) ( not ( = ?auto_163595 ?auto_163601 ) ) ( not ( = ?auto_163596 ?auto_163597 ) ) ( not ( = ?auto_163596 ?auto_163598 ) ) ( not ( = ?auto_163596 ?auto_163599 ) ) ( not ( = ?auto_163596 ?auto_163600 ) ) ( not ( = ?auto_163596 ?auto_163601 ) ) ( not ( = ?auto_163597 ?auto_163598 ) ) ( not ( = ?auto_163597 ?auto_163599 ) ) ( not ( = ?auto_163597 ?auto_163600 ) ) ( not ( = ?auto_163597 ?auto_163601 ) ) ( not ( = ?auto_163598 ?auto_163599 ) ) ( not ( = ?auto_163598 ?auto_163600 ) ) ( not ( = ?auto_163598 ?auto_163601 ) ) ( not ( = ?auto_163599 ?auto_163600 ) ) ( not ( = ?auto_163599 ?auto_163601 ) ) ( not ( = ?auto_163600 ?auto_163601 ) ) ( ON ?auto_163599 ?auto_163600 ) ( ON ?auto_163598 ?auto_163599 ) ( ON ?auto_163597 ?auto_163598 ) ( ON ?auto_163596 ?auto_163597 ) ( CLEAR ?auto_163594 ) ( ON ?auto_163595 ?auto_163596 ) ( CLEAR ?auto_163595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163589 ?auto_163590 ?auto_163591 ?auto_163592 ?auto_163593 ?auto_163594 ?auto_163595 )
      ( MAKE-12PILE ?auto_163589 ?auto_163590 ?auto_163591 ?auto_163592 ?auto_163593 ?auto_163594 ?auto_163595 ?auto_163596 ?auto_163597 ?auto_163598 ?auto_163599 ?auto_163600 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163614 - BLOCK
      ?auto_163615 - BLOCK
      ?auto_163616 - BLOCK
      ?auto_163617 - BLOCK
      ?auto_163618 - BLOCK
      ?auto_163619 - BLOCK
      ?auto_163620 - BLOCK
      ?auto_163621 - BLOCK
      ?auto_163622 - BLOCK
      ?auto_163623 - BLOCK
      ?auto_163624 - BLOCK
      ?auto_163625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163625 ) ( ON-TABLE ?auto_163614 ) ( ON ?auto_163615 ?auto_163614 ) ( ON ?auto_163616 ?auto_163615 ) ( ON ?auto_163617 ?auto_163616 ) ( ON ?auto_163618 ?auto_163617 ) ( ON ?auto_163619 ?auto_163618 ) ( not ( = ?auto_163614 ?auto_163615 ) ) ( not ( = ?auto_163614 ?auto_163616 ) ) ( not ( = ?auto_163614 ?auto_163617 ) ) ( not ( = ?auto_163614 ?auto_163618 ) ) ( not ( = ?auto_163614 ?auto_163619 ) ) ( not ( = ?auto_163614 ?auto_163620 ) ) ( not ( = ?auto_163614 ?auto_163621 ) ) ( not ( = ?auto_163614 ?auto_163622 ) ) ( not ( = ?auto_163614 ?auto_163623 ) ) ( not ( = ?auto_163614 ?auto_163624 ) ) ( not ( = ?auto_163614 ?auto_163625 ) ) ( not ( = ?auto_163615 ?auto_163616 ) ) ( not ( = ?auto_163615 ?auto_163617 ) ) ( not ( = ?auto_163615 ?auto_163618 ) ) ( not ( = ?auto_163615 ?auto_163619 ) ) ( not ( = ?auto_163615 ?auto_163620 ) ) ( not ( = ?auto_163615 ?auto_163621 ) ) ( not ( = ?auto_163615 ?auto_163622 ) ) ( not ( = ?auto_163615 ?auto_163623 ) ) ( not ( = ?auto_163615 ?auto_163624 ) ) ( not ( = ?auto_163615 ?auto_163625 ) ) ( not ( = ?auto_163616 ?auto_163617 ) ) ( not ( = ?auto_163616 ?auto_163618 ) ) ( not ( = ?auto_163616 ?auto_163619 ) ) ( not ( = ?auto_163616 ?auto_163620 ) ) ( not ( = ?auto_163616 ?auto_163621 ) ) ( not ( = ?auto_163616 ?auto_163622 ) ) ( not ( = ?auto_163616 ?auto_163623 ) ) ( not ( = ?auto_163616 ?auto_163624 ) ) ( not ( = ?auto_163616 ?auto_163625 ) ) ( not ( = ?auto_163617 ?auto_163618 ) ) ( not ( = ?auto_163617 ?auto_163619 ) ) ( not ( = ?auto_163617 ?auto_163620 ) ) ( not ( = ?auto_163617 ?auto_163621 ) ) ( not ( = ?auto_163617 ?auto_163622 ) ) ( not ( = ?auto_163617 ?auto_163623 ) ) ( not ( = ?auto_163617 ?auto_163624 ) ) ( not ( = ?auto_163617 ?auto_163625 ) ) ( not ( = ?auto_163618 ?auto_163619 ) ) ( not ( = ?auto_163618 ?auto_163620 ) ) ( not ( = ?auto_163618 ?auto_163621 ) ) ( not ( = ?auto_163618 ?auto_163622 ) ) ( not ( = ?auto_163618 ?auto_163623 ) ) ( not ( = ?auto_163618 ?auto_163624 ) ) ( not ( = ?auto_163618 ?auto_163625 ) ) ( not ( = ?auto_163619 ?auto_163620 ) ) ( not ( = ?auto_163619 ?auto_163621 ) ) ( not ( = ?auto_163619 ?auto_163622 ) ) ( not ( = ?auto_163619 ?auto_163623 ) ) ( not ( = ?auto_163619 ?auto_163624 ) ) ( not ( = ?auto_163619 ?auto_163625 ) ) ( not ( = ?auto_163620 ?auto_163621 ) ) ( not ( = ?auto_163620 ?auto_163622 ) ) ( not ( = ?auto_163620 ?auto_163623 ) ) ( not ( = ?auto_163620 ?auto_163624 ) ) ( not ( = ?auto_163620 ?auto_163625 ) ) ( not ( = ?auto_163621 ?auto_163622 ) ) ( not ( = ?auto_163621 ?auto_163623 ) ) ( not ( = ?auto_163621 ?auto_163624 ) ) ( not ( = ?auto_163621 ?auto_163625 ) ) ( not ( = ?auto_163622 ?auto_163623 ) ) ( not ( = ?auto_163622 ?auto_163624 ) ) ( not ( = ?auto_163622 ?auto_163625 ) ) ( not ( = ?auto_163623 ?auto_163624 ) ) ( not ( = ?auto_163623 ?auto_163625 ) ) ( not ( = ?auto_163624 ?auto_163625 ) ) ( ON ?auto_163624 ?auto_163625 ) ( ON ?auto_163623 ?auto_163624 ) ( ON ?auto_163622 ?auto_163623 ) ( ON ?auto_163621 ?auto_163622 ) ( CLEAR ?auto_163619 ) ( ON ?auto_163620 ?auto_163621 ) ( CLEAR ?auto_163620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163614 ?auto_163615 ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 )
      ( MAKE-12PILE ?auto_163614 ?auto_163615 ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 ?auto_163621 ?auto_163622 ?auto_163623 ?auto_163624 ?auto_163625 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163638 - BLOCK
      ?auto_163639 - BLOCK
      ?auto_163640 - BLOCK
      ?auto_163641 - BLOCK
      ?auto_163642 - BLOCK
      ?auto_163643 - BLOCK
      ?auto_163644 - BLOCK
      ?auto_163645 - BLOCK
      ?auto_163646 - BLOCK
      ?auto_163647 - BLOCK
      ?auto_163648 - BLOCK
      ?auto_163649 - BLOCK
    )
    :vars
    (
      ?auto_163650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163649 ?auto_163650 ) ( ON-TABLE ?auto_163638 ) ( ON ?auto_163639 ?auto_163638 ) ( ON ?auto_163640 ?auto_163639 ) ( ON ?auto_163641 ?auto_163640 ) ( ON ?auto_163642 ?auto_163641 ) ( not ( = ?auto_163638 ?auto_163639 ) ) ( not ( = ?auto_163638 ?auto_163640 ) ) ( not ( = ?auto_163638 ?auto_163641 ) ) ( not ( = ?auto_163638 ?auto_163642 ) ) ( not ( = ?auto_163638 ?auto_163643 ) ) ( not ( = ?auto_163638 ?auto_163644 ) ) ( not ( = ?auto_163638 ?auto_163645 ) ) ( not ( = ?auto_163638 ?auto_163646 ) ) ( not ( = ?auto_163638 ?auto_163647 ) ) ( not ( = ?auto_163638 ?auto_163648 ) ) ( not ( = ?auto_163638 ?auto_163649 ) ) ( not ( = ?auto_163638 ?auto_163650 ) ) ( not ( = ?auto_163639 ?auto_163640 ) ) ( not ( = ?auto_163639 ?auto_163641 ) ) ( not ( = ?auto_163639 ?auto_163642 ) ) ( not ( = ?auto_163639 ?auto_163643 ) ) ( not ( = ?auto_163639 ?auto_163644 ) ) ( not ( = ?auto_163639 ?auto_163645 ) ) ( not ( = ?auto_163639 ?auto_163646 ) ) ( not ( = ?auto_163639 ?auto_163647 ) ) ( not ( = ?auto_163639 ?auto_163648 ) ) ( not ( = ?auto_163639 ?auto_163649 ) ) ( not ( = ?auto_163639 ?auto_163650 ) ) ( not ( = ?auto_163640 ?auto_163641 ) ) ( not ( = ?auto_163640 ?auto_163642 ) ) ( not ( = ?auto_163640 ?auto_163643 ) ) ( not ( = ?auto_163640 ?auto_163644 ) ) ( not ( = ?auto_163640 ?auto_163645 ) ) ( not ( = ?auto_163640 ?auto_163646 ) ) ( not ( = ?auto_163640 ?auto_163647 ) ) ( not ( = ?auto_163640 ?auto_163648 ) ) ( not ( = ?auto_163640 ?auto_163649 ) ) ( not ( = ?auto_163640 ?auto_163650 ) ) ( not ( = ?auto_163641 ?auto_163642 ) ) ( not ( = ?auto_163641 ?auto_163643 ) ) ( not ( = ?auto_163641 ?auto_163644 ) ) ( not ( = ?auto_163641 ?auto_163645 ) ) ( not ( = ?auto_163641 ?auto_163646 ) ) ( not ( = ?auto_163641 ?auto_163647 ) ) ( not ( = ?auto_163641 ?auto_163648 ) ) ( not ( = ?auto_163641 ?auto_163649 ) ) ( not ( = ?auto_163641 ?auto_163650 ) ) ( not ( = ?auto_163642 ?auto_163643 ) ) ( not ( = ?auto_163642 ?auto_163644 ) ) ( not ( = ?auto_163642 ?auto_163645 ) ) ( not ( = ?auto_163642 ?auto_163646 ) ) ( not ( = ?auto_163642 ?auto_163647 ) ) ( not ( = ?auto_163642 ?auto_163648 ) ) ( not ( = ?auto_163642 ?auto_163649 ) ) ( not ( = ?auto_163642 ?auto_163650 ) ) ( not ( = ?auto_163643 ?auto_163644 ) ) ( not ( = ?auto_163643 ?auto_163645 ) ) ( not ( = ?auto_163643 ?auto_163646 ) ) ( not ( = ?auto_163643 ?auto_163647 ) ) ( not ( = ?auto_163643 ?auto_163648 ) ) ( not ( = ?auto_163643 ?auto_163649 ) ) ( not ( = ?auto_163643 ?auto_163650 ) ) ( not ( = ?auto_163644 ?auto_163645 ) ) ( not ( = ?auto_163644 ?auto_163646 ) ) ( not ( = ?auto_163644 ?auto_163647 ) ) ( not ( = ?auto_163644 ?auto_163648 ) ) ( not ( = ?auto_163644 ?auto_163649 ) ) ( not ( = ?auto_163644 ?auto_163650 ) ) ( not ( = ?auto_163645 ?auto_163646 ) ) ( not ( = ?auto_163645 ?auto_163647 ) ) ( not ( = ?auto_163645 ?auto_163648 ) ) ( not ( = ?auto_163645 ?auto_163649 ) ) ( not ( = ?auto_163645 ?auto_163650 ) ) ( not ( = ?auto_163646 ?auto_163647 ) ) ( not ( = ?auto_163646 ?auto_163648 ) ) ( not ( = ?auto_163646 ?auto_163649 ) ) ( not ( = ?auto_163646 ?auto_163650 ) ) ( not ( = ?auto_163647 ?auto_163648 ) ) ( not ( = ?auto_163647 ?auto_163649 ) ) ( not ( = ?auto_163647 ?auto_163650 ) ) ( not ( = ?auto_163648 ?auto_163649 ) ) ( not ( = ?auto_163648 ?auto_163650 ) ) ( not ( = ?auto_163649 ?auto_163650 ) ) ( ON ?auto_163648 ?auto_163649 ) ( ON ?auto_163647 ?auto_163648 ) ( ON ?auto_163646 ?auto_163647 ) ( ON ?auto_163645 ?auto_163646 ) ( ON ?auto_163644 ?auto_163645 ) ( CLEAR ?auto_163642 ) ( ON ?auto_163643 ?auto_163644 ) ( CLEAR ?auto_163643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163638 ?auto_163639 ?auto_163640 ?auto_163641 ?auto_163642 ?auto_163643 )
      ( MAKE-12PILE ?auto_163638 ?auto_163639 ?auto_163640 ?auto_163641 ?auto_163642 ?auto_163643 ?auto_163644 ?auto_163645 ?auto_163646 ?auto_163647 ?auto_163648 ?auto_163649 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163663 - BLOCK
      ?auto_163664 - BLOCK
      ?auto_163665 - BLOCK
      ?auto_163666 - BLOCK
      ?auto_163667 - BLOCK
      ?auto_163668 - BLOCK
      ?auto_163669 - BLOCK
      ?auto_163670 - BLOCK
      ?auto_163671 - BLOCK
      ?auto_163672 - BLOCK
      ?auto_163673 - BLOCK
      ?auto_163674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163674 ) ( ON-TABLE ?auto_163663 ) ( ON ?auto_163664 ?auto_163663 ) ( ON ?auto_163665 ?auto_163664 ) ( ON ?auto_163666 ?auto_163665 ) ( ON ?auto_163667 ?auto_163666 ) ( not ( = ?auto_163663 ?auto_163664 ) ) ( not ( = ?auto_163663 ?auto_163665 ) ) ( not ( = ?auto_163663 ?auto_163666 ) ) ( not ( = ?auto_163663 ?auto_163667 ) ) ( not ( = ?auto_163663 ?auto_163668 ) ) ( not ( = ?auto_163663 ?auto_163669 ) ) ( not ( = ?auto_163663 ?auto_163670 ) ) ( not ( = ?auto_163663 ?auto_163671 ) ) ( not ( = ?auto_163663 ?auto_163672 ) ) ( not ( = ?auto_163663 ?auto_163673 ) ) ( not ( = ?auto_163663 ?auto_163674 ) ) ( not ( = ?auto_163664 ?auto_163665 ) ) ( not ( = ?auto_163664 ?auto_163666 ) ) ( not ( = ?auto_163664 ?auto_163667 ) ) ( not ( = ?auto_163664 ?auto_163668 ) ) ( not ( = ?auto_163664 ?auto_163669 ) ) ( not ( = ?auto_163664 ?auto_163670 ) ) ( not ( = ?auto_163664 ?auto_163671 ) ) ( not ( = ?auto_163664 ?auto_163672 ) ) ( not ( = ?auto_163664 ?auto_163673 ) ) ( not ( = ?auto_163664 ?auto_163674 ) ) ( not ( = ?auto_163665 ?auto_163666 ) ) ( not ( = ?auto_163665 ?auto_163667 ) ) ( not ( = ?auto_163665 ?auto_163668 ) ) ( not ( = ?auto_163665 ?auto_163669 ) ) ( not ( = ?auto_163665 ?auto_163670 ) ) ( not ( = ?auto_163665 ?auto_163671 ) ) ( not ( = ?auto_163665 ?auto_163672 ) ) ( not ( = ?auto_163665 ?auto_163673 ) ) ( not ( = ?auto_163665 ?auto_163674 ) ) ( not ( = ?auto_163666 ?auto_163667 ) ) ( not ( = ?auto_163666 ?auto_163668 ) ) ( not ( = ?auto_163666 ?auto_163669 ) ) ( not ( = ?auto_163666 ?auto_163670 ) ) ( not ( = ?auto_163666 ?auto_163671 ) ) ( not ( = ?auto_163666 ?auto_163672 ) ) ( not ( = ?auto_163666 ?auto_163673 ) ) ( not ( = ?auto_163666 ?auto_163674 ) ) ( not ( = ?auto_163667 ?auto_163668 ) ) ( not ( = ?auto_163667 ?auto_163669 ) ) ( not ( = ?auto_163667 ?auto_163670 ) ) ( not ( = ?auto_163667 ?auto_163671 ) ) ( not ( = ?auto_163667 ?auto_163672 ) ) ( not ( = ?auto_163667 ?auto_163673 ) ) ( not ( = ?auto_163667 ?auto_163674 ) ) ( not ( = ?auto_163668 ?auto_163669 ) ) ( not ( = ?auto_163668 ?auto_163670 ) ) ( not ( = ?auto_163668 ?auto_163671 ) ) ( not ( = ?auto_163668 ?auto_163672 ) ) ( not ( = ?auto_163668 ?auto_163673 ) ) ( not ( = ?auto_163668 ?auto_163674 ) ) ( not ( = ?auto_163669 ?auto_163670 ) ) ( not ( = ?auto_163669 ?auto_163671 ) ) ( not ( = ?auto_163669 ?auto_163672 ) ) ( not ( = ?auto_163669 ?auto_163673 ) ) ( not ( = ?auto_163669 ?auto_163674 ) ) ( not ( = ?auto_163670 ?auto_163671 ) ) ( not ( = ?auto_163670 ?auto_163672 ) ) ( not ( = ?auto_163670 ?auto_163673 ) ) ( not ( = ?auto_163670 ?auto_163674 ) ) ( not ( = ?auto_163671 ?auto_163672 ) ) ( not ( = ?auto_163671 ?auto_163673 ) ) ( not ( = ?auto_163671 ?auto_163674 ) ) ( not ( = ?auto_163672 ?auto_163673 ) ) ( not ( = ?auto_163672 ?auto_163674 ) ) ( not ( = ?auto_163673 ?auto_163674 ) ) ( ON ?auto_163673 ?auto_163674 ) ( ON ?auto_163672 ?auto_163673 ) ( ON ?auto_163671 ?auto_163672 ) ( ON ?auto_163670 ?auto_163671 ) ( ON ?auto_163669 ?auto_163670 ) ( CLEAR ?auto_163667 ) ( ON ?auto_163668 ?auto_163669 ) ( CLEAR ?auto_163668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163663 ?auto_163664 ?auto_163665 ?auto_163666 ?auto_163667 ?auto_163668 )
      ( MAKE-12PILE ?auto_163663 ?auto_163664 ?auto_163665 ?auto_163666 ?auto_163667 ?auto_163668 ?auto_163669 ?auto_163670 ?auto_163671 ?auto_163672 ?auto_163673 ?auto_163674 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163687 - BLOCK
      ?auto_163688 - BLOCK
      ?auto_163689 - BLOCK
      ?auto_163690 - BLOCK
      ?auto_163691 - BLOCK
      ?auto_163692 - BLOCK
      ?auto_163693 - BLOCK
      ?auto_163694 - BLOCK
      ?auto_163695 - BLOCK
      ?auto_163696 - BLOCK
      ?auto_163697 - BLOCK
      ?auto_163698 - BLOCK
    )
    :vars
    (
      ?auto_163699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163698 ?auto_163699 ) ( ON-TABLE ?auto_163687 ) ( ON ?auto_163688 ?auto_163687 ) ( ON ?auto_163689 ?auto_163688 ) ( ON ?auto_163690 ?auto_163689 ) ( not ( = ?auto_163687 ?auto_163688 ) ) ( not ( = ?auto_163687 ?auto_163689 ) ) ( not ( = ?auto_163687 ?auto_163690 ) ) ( not ( = ?auto_163687 ?auto_163691 ) ) ( not ( = ?auto_163687 ?auto_163692 ) ) ( not ( = ?auto_163687 ?auto_163693 ) ) ( not ( = ?auto_163687 ?auto_163694 ) ) ( not ( = ?auto_163687 ?auto_163695 ) ) ( not ( = ?auto_163687 ?auto_163696 ) ) ( not ( = ?auto_163687 ?auto_163697 ) ) ( not ( = ?auto_163687 ?auto_163698 ) ) ( not ( = ?auto_163687 ?auto_163699 ) ) ( not ( = ?auto_163688 ?auto_163689 ) ) ( not ( = ?auto_163688 ?auto_163690 ) ) ( not ( = ?auto_163688 ?auto_163691 ) ) ( not ( = ?auto_163688 ?auto_163692 ) ) ( not ( = ?auto_163688 ?auto_163693 ) ) ( not ( = ?auto_163688 ?auto_163694 ) ) ( not ( = ?auto_163688 ?auto_163695 ) ) ( not ( = ?auto_163688 ?auto_163696 ) ) ( not ( = ?auto_163688 ?auto_163697 ) ) ( not ( = ?auto_163688 ?auto_163698 ) ) ( not ( = ?auto_163688 ?auto_163699 ) ) ( not ( = ?auto_163689 ?auto_163690 ) ) ( not ( = ?auto_163689 ?auto_163691 ) ) ( not ( = ?auto_163689 ?auto_163692 ) ) ( not ( = ?auto_163689 ?auto_163693 ) ) ( not ( = ?auto_163689 ?auto_163694 ) ) ( not ( = ?auto_163689 ?auto_163695 ) ) ( not ( = ?auto_163689 ?auto_163696 ) ) ( not ( = ?auto_163689 ?auto_163697 ) ) ( not ( = ?auto_163689 ?auto_163698 ) ) ( not ( = ?auto_163689 ?auto_163699 ) ) ( not ( = ?auto_163690 ?auto_163691 ) ) ( not ( = ?auto_163690 ?auto_163692 ) ) ( not ( = ?auto_163690 ?auto_163693 ) ) ( not ( = ?auto_163690 ?auto_163694 ) ) ( not ( = ?auto_163690 ?auto_163695 ) ) ( not ( = ?auto_163690 ?auto_163696 ) ) ( not ( = ?auto_163690 ?auto_163697 ) ) ( not ( = ?auto_163690 ?auto_163698 ) ) ( not ( = ?auto_163690 ?auto_163699 ) ) ( not ( = ?auto_163691 ?auto_163692 ) ) ( not ( = ?auto_163691 ?auto_163693 ) ) ( not ( = ?auto_163691 ?auto_163694 ) ) ( not ( = ?auto_163691 ?auto_163695 ) ) ( not ( = ?auto_163691 ?auto_163696 ) ) ( not ( = ?auto_163691 ?auto_163697 ) ) ( not ( = ?auto_163691 ?auto_163698 ) ) ( not ( = ?auto_163691 ?auto_163699 ) ) ( not ( = ?auto_163692 ?auto_163693 ) ) ( not ( = ?auto_163692 ?auto_163694 ) ) ( not ( = ?auto_163692 ?auto_163695 ) ) ( not ( = ?auto_163692 ?auto_163696 ) ) ( not ( = ?auto_163692 ?auto_163697 ) ) ( not ( = ?auto_163692 ?auto_163698 ) ) ( not ( = ?auto_163692 ?auto_163699 ) ) ( not ( = ?auto_163693 ?auto_163694 ) ) ( not ( = ?auto_163693 ?auto_163695 ) ) ( not ( = ?auto_163693 ?auto_163696 ) ) ( not ( = ?auto_163693 ?auto_163697 ) ) ( not ( = ?auto_163693 ?auto_163698 ) ) ( not ( = ?auto_163693 ?auto_163699 ) ) ( not ( = ?auto_163694 ?auto_163695 ) ) ( not ( = ?auto_163694 ?auto_163696 ) ) ( not ( = ?auto_163694 ?auto_163697 ) ) ( not ( = ?auto_163694 ?auto_163698 ) ) ( not ( = ?auto_163694 ?auto_163699 ) ) ( not ( = ?auto_163695 ?auto_163696 ) ) ( not ( = ?auto_163695 ?auto_163697 ) ) ( not ( = ?auto_163695 ?auto_163698 ) ) ( not ( = ?auto_163695 ?auto_163699 ) ) ( not ( = ?auto_163696 ?auto_163697 ) ) ( not ( = ?auto_163696 ?auto_163698 ) ) ( not ( = ?auto_163696 ?auto_163699 ) ) ( not ( = ?auto_163697 ?auto_163698 ) ) ( not ( = ?auto_163697 ?auto_163699 ) ) ( not ( = ?auto_163698 ?auto_163699 ) ) ( ON ?auto_163697 ?auto_163698 ) ( ON ?auto_163696 ?auto_163697 ) ( ON ?auto_163695 ?auto_163696 ) ( ON ?auto_163694 ?auto_163695 ) ( ON ?auto_163693 ?auto_163694 ) ( ON ?auto_163692 ?auto_163693 ) ( CLEAR ?auto_163690 ) ( ON ?auto_163691 ?auto_163692 ) ( CLEAR ?auto_163691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163687 ?auto_163688 ?auto_163689 ?auto_163690 ?auto_163691 )
      ( MAKE-12PILE ?auto_163687 ?auto_163688 ?auto_163689 ?auto_163690 ?auto_163691 ?auto_163692 ?auto_163693 ?auto_163694 ?auto_163695 ?auto_163696 ?auto_163697 ?auto_163698 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163712 - BLOCK
      ?auto_163713 - BLOCK
      ?auto_163714 - BLOCK
      ?auto_163715 - BLOCK
      ?auto_163716 - BLOCK
      ?auto_163717 - BLOCK
      ?auto_163718 - BLOCK
      ?auto_163719 - BLOCK
      ?auto_163720 - BLOCK
      ?auto_163721 - BLOCK
      ?auto_163722 - BLOCK
      ?auto_163723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163723 ) ( ON-TABLE ?auto_163712 ) ( ON ?auto_163713 ?auto_163712 ) ( ON ?auto_163714 ?auto_163713 ) ( ON ?auto_163715 ?auto_163714 ) ( not ( = ?auto_163712 ?auto_163713 ) ) ( not ( = ?auto_163712 ?auto_163714 ) ) ( not ( = ?auto_163712 ?auto_163715 ) ) ( not ( = ?auto_163712 ?auto_163716 ) ) ( not ( = ?auto_163712 ?auto_163717 ) ) ( not ( = ?auto_163712 ?auto_163718 ) ) ( not ( = ?auto_163712 ?auto_163719 ) ) ( not ( = ?auto_163712 ?auto_163720 ) ) ( not ( = ?auto_163712 ?auto_163721 ) ) ( not ( = ?auto_163712 ?auto_163722 ) ) ( not ( = ?auto_163712 ?auto_163723 ) ) ( not ( = ?auto_163713 ?auto_163714 ) ) ( not ( = ?auto_163713 ?auto_163715 ) ) ( not ( = ?auto_163713 ?auto_163716 ) ) ( not ( = ?auto_163713 ?auto_163717 ) ) ( not ( = ?auto_163713 ?auto_163718 ) ) ( not ( = ?auto_163713 ?auto_163719 ) ) ( not ( = ?auto_163713 ?auto_163720 ) ) ( not ( = ?auto_163713 ?auto_163721 ) ) ( not ( = ?auto_163713 ?auto_163722 ) ) ( not ( = ?auto_163713 ?auto_163723 ) ) ( not ( = ?auto_163714 ?auto_163715 ) ) ( not ( = ?auto_163714 ?auto_163716 ) ) ( not ( = ?auto_163714 ?auto_163717 ) ) ( not ( = ?auto_163714 ?auto_163718 ) ) ( not ( = ?auto_163714 ?auto_163719 ) ) ( not ( = ?auto_163714 ?auto_163720 ) ) ( not ( = ?auto_163714 ?auto_163721 ) ) ( not ( = ?auto_163714 ?auto_163722 ) ) ( not ( = ?auto_163714 ?auto_163723 ) ) ( not ( = ?auto_163715 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163717 ) ) ( not ( = ?auto_163715 ?auto_163718 ) ) ( not ( = ?auto_163715 ?auto_163719 ) ) ( not ( = ?auto_163715 ?auto_163720 ) ) ( not ( = ?auto_163715 ?auto_163721 ) ) ( not ( = ?auto_163715 ?auto_163722 ) ) ( not ( = ?auto_163715 ?auto_163723 ) ) ( not ( = ?auto_163716 ?auto_163717 ) ) ( not ( = ?auto_163716 ?auto_163718 ) ) ( not ( = ?auto_163716 ?auto_163719 ) ) ( not ( = ?auto_163716 ?auto_163720 ) ) ( not ( = ?auto_163716 ?auto_163721 ) ) ( not ( = ?auto_163716 ?auto_163722 ) ) ( not ( = ?auto_163716 ?auto_163723 ) ) ( not ( = ?auto_163717 ?auto_163718 ) ) ( not ( = ?auto_163717 ?auto_163719 ) ) ( not ( = ?auto_163717 ?auto_163720 ) ) ( not ( = ?auto_163717 ?auto_163721 ) ) ( not ( = ?auto_163717 ?auto_163722 ) ) ( not ( = ?auto_163717 ?auto_163723 ) ) ( not ( = ?auto_163718 ?auto_163719 ) ) ( not ( = ?auto_163718 ?auto_163720 ) ) ( not ( = ?auto_163718 ?auto_163721 ) ) ( not ( = ?auto_163718 ?auto_163722 ) ) ( not ( = ?auto_163718 ?auto_163723 ) ) ( not ( = ?auto_163719 ?auto_163720 ) ) ( not ( = ?auto_163719 ?auto_163721 ) ) ( not ( = ?auto_163719 ?auto_163722 ) ) ( not ( = ?auto_163719 ?auto_163723 ) ) ( not ( = ?auto_163720 ?auto_163721 ) ) ( not ( = ?auto_163720 ?auto_163722 ) ) ( not ( = ?auto_163720 ?auto_163723 ) ) ( not ( = ?auto_163721 ?auto_163722 ) ) ( not ( = ?auto_163721 ?auto_163723 ) ) ( not ( = ?auto_163722 ?auto_163723 ) ) ( ON ?auto_163722 ?auto_163723 ) ( ON ?auto_163721 ?auto_163722 ) ( ON ?auto_163720 ?auto_163721 ) ( ON ?auto_163719 ?auto_163720 ) ( ON ?auto_163718 ?auto_163719 ) ( ON ?auto_163717 ?auto_163718 ) ( CLEAR ?auto_163715 ) ( ON ?auto_163716 ?auto_163717 ) ( CLEAR ?auto_163716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163712 ?auto_163713 ?auto_163714 ?auto_163715 ?auto_163716 )
      ( MAKE-12PILE ?auto_163712 ?auto_163713 ?auto_163714 ?auto_163715 ?auto_163716 ?auto_163717 ?auto_163718 ?auto_163719 ?auto_163720 ?auto_163721 ?auto_163722 ?auto_163723 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163736 - BLOCK
      ?auto_163737 - BLOCK
      ?auto_163738 - BLOCK
      ?auto_163739 - BLOCK
      ?auto_163740 - BLOCK
      ?auto_163741 - BLOCK
      ?auto_163742 - BLOCK
      ?auto_163743 - BLOCK
      ?auto_163744 - BLOCK
      ?auto_163745 - BLOCK
      ?auto_163746 - BLOCK
      ?auto_163747 - BLOCK
    )
    :vars
    (
      ?auto_163748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163747 ?auto_163748 ) ( ON-TABLE ?auto_163736 ) ( ON ?auto_163737 ?auto_163736 ) ( ON ?auto_163738 ?auto_163737 ) ( not ( = ?auto_163736 ?auto_163737 ) ) ( not ( = ?auto_163736 ?auto_163738 ) ) ( not ( = ?auto_163736 ?auto_163739 ) ) ( not ( = ?auto_163736 ?auto_163740 ) ) ( not ( = ?auto_163736 ?auto_163741 ) ) ( not ( = ?auto_163736 ?auto_163742 ) ) ( not ( = ?auto_163736 ?auto_163743 ) ) ( not ( = ?auto_163736 ?auto_163744 ) ) ( not ( = ?auto_163736 ?auto_163745 ) ) ( not ( = ?auto_163736 ?auto_163746 ) ) ( not ( = ?auto_163736 ?auto_163747 ) ) ( not ( = ?auto_163736 ?auto_163748 ) ) ( not ( = ?auto_163737 ?auto_163738 ) ) ( not ( = ?auto_163737 ?auto_163739 ) ) ( not ( = ?auto_163737 ?auto_163740 ) ) ( not ( = ?auto_163737 ?auto_163741 ) ) ( not ( = ?auto_163737 ?auto_163742 ) ) ( not ( = ?auto_163737 ?auto_163743 ) ) ( not ( = ?auto_163737 ?auto_163744 ) ) ( not ( = ?auto_163737 ?auto_163745 ) ) ( not ( = ?auto_163737 ?auto_163746 ) ) ( not ( = ?auto_163737 ?auto_163747 ) ) ( not ( = ?auto_163737 ?auto_163748 ) ) ( not ( = ?auto_163738 ?auto_163739 ) ) ( not ( = ?auto_163738 ?auto_163740 ) ) ( not ( = ?auto_163738 ?auto_163741 ) ) ( not ( = ?auto_163738 ?auto_163742 ) ) ( not ( = ?auto_163738 ?auto_163743 ) ) ( not ( = ?auto_163738 ?auto_163744 ) ) ( not ( = ?auto_163738 ?auto_163745 ) ) ( not ( = ?auto_163738 ?auto_163746 ) ) ( not ( = ?auto_163738 ?auto_163747 ) ) ( not ( = ?auto_163738 ?auto_163748 ) ) ( not ( = ?auto_163739 ?auto_163740 ) ) ( not ( = ?auto_163739 ?auto_163741 ) ) ( not ( = ?auto_163739 ?auto_163742 ) ) ( not ( = ?auto_163739 ?auto_163743 ) ) ( not ( = ?auto_163739 ?auto_163744 ) ) ( not ( = ?auto_163739 ?auto_163745 ) ) ( not ( = ?auto_163739 ?auto_163746 ) ) ( not ( = ?auto_163739 ?auto_163747 ) ) ( not ( = ?auto_163739 ?auto_163748 ) ) ( not ( = ?auto_163740 ?auto_163741 ) ) ( not ( = ?auto_163740 ?auto_163742 ) ) ( not ( = ?auto_163740 ?auto_163743 ) ) ( not ( = ?auto_163740 ?auto_163744 ) ) ( not ( = ?auto_163740 ?auto_163745 ) ) ( not ( = ?auto_163740 ?auto_163746 ) ) ( not ( = ?auto_163740 ?auto_163747 ) ) ( not ( = ?auto_163740 ?auto_163748 ) ) ( not ( = ?auto_163741 ?auto_163742 ) ) ( not ( = ?auto_163741 ?auto_163743 ) ) ( not ( = ?auto_163741 ?auto_163744 ) ) ( not ( = ?auto_163741 ?auto_163745 ) ) ( not ( = ?auto_163741 ?auto_163746 ) ) ( not ( = ?auto_163741 ?auto_163747 ) ) ( not ( = ?auto_163741 ?auto_163748 ) ) ( not ( = ?auto_163742 ?auto_163743 ) ) ( not ( = ?auto_163742 ?auto_163744 ) ) ( not ( = ?auto_163742 ?auto_163745 ) ) ( not ( = ?auto_163742 ?auto_163746 ) ) ( not ( = ?auto_163742 ?auto_163747 ) ) ( not ( = ?auto_163742 ?auto_163748 ) ) ( not ( = ?auto_163743 ?auto_163744 ) ) ( not ( = ?auto_163743 ?auto_163745 ) ) ( not ( = ?auto_163743 ?auto_163746 ) ) ( not ( = ?auto_163743 ?auto_163747 ) ) ( not ( = ?auto_163743 ?auto_163748 ) ) ( not ( = ?auto_163744 ?auto_163745 ) ) ( not ( = ?auto_163744 ?auto_163746 ) ) ( not ( = ?auto_163744 ?auto_163747 ) ) ( not ( = ?auto_163744 ?auto_163748 ) ) ( not ( = ?auto_163745 ?auto_163746 ) ) ( not ( = ?auto_163745 ?auto_163747 ) ) ( not ( = ?auto_163745 ?auto_163748 ) ) ( not ( = ?auto_163746 ?auto_163747 ) ) ( not ( = ?auto_163746 ?auto_163748 ) ) ( not ( = ?auto_163747 ?auto_163748 ) ) ( ON ?auto_163746 ?auto_163747 ) ( ON ?auto_163745 ?auto_163746 ) ( ON ?auto_163744 ?auto_163745 ) ( ON ?auto_163743 ?auto_163744 ) ( ON ?auto_163742 ?auto_163743 ) ( ON ?auto_163741 ?auto_163742 ) ( ON ?auto_163740 ?auto_163741 ) ( CLEAR ?auto_163738 ) ( ON ?auto_163739 ?auto_163740 ) ( CLEAR ?auto_163739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163736 ?auto_163737 ?auto_163738 ?auto_163739 )
      ( MAKE-12PILE ?auto_163736 ?auto_163737 ?auto_163738 ?auto_163739 ?auto_163740 ?auto_163741 ?auto_163742 ?auto_163743 ?auto_163744 ?auto_163745 ?auto_163746 ?auto_163747 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163761 - BLOCK
      ?auto_163762 - BLOCK
      ?auto_163763 - BLOCK
      ?auto_163764 - BLOCK
      ?auto_163765 - BLOCK
      ?auto_163766 - BLOCK
      ?auto_163767 - BLOCK
      ?auto_163768 - BLOCK
      ?auto_163769 - BLOCK
      ?auto_163770 - BLOCK
      ?auto_163771 - BLOCK
      ?auto_163772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163772 ) ( ON-TABLE ?auto_163761 ) ( ON ?auto_163762 ?auto_163761 ) ( ON ?auto_163763 ?auto_163762 ) ( not ( = ?auto_163761 ?auto_163762 ) ) ( not ( = ?auto_163761 ?auto_163763 ) ) ( not ( = ?auto_163761 ?auto_163764 ) ) ( not ( = ?auto_163761 ?auto_163765 ) ) ( not ( = ?auto_163761 ?auto_163766 ) ) ( not ( = ?auto_163761 ?auto_163767 ) ) ( not ( = ?auto_163761 ?auto_163768 ) ) ( not ( = ?auto_163761 ?auto_163769 ) ) ( not ( = ?auto_163761 ?auto_163770 ) ) ( not ( = ?auto_163761 ?auto_163771 ) ) ( not ( = ?auto_163761 ?auto_163772 ) ) ( not ( = ?auto_163762 ?auto_163763 ) ) ( not ( = ?auto_163762 ?auto_163764 ) ) ( not ( = ?auto_163762 ?auto_163765 ) ) ( not ( = ?auto_163762 ?auto_163766 ) ) ( not ( = ?auto_163762 ?auto_163767 ) ) ( not ( = ?auto_163762 ?auto_163768 ) ) ( not ( = ?auto_163762 ?auto_163769 ) ) ( not ( = ?auto_163762 ?auto_163770 ) ) ( not ( = ?auto_163762 ?auto_163771 ) ) ( not ( = ?auto_163762 ?auto_163772 ) ) ( not ( = ?auto_163763 ?auto_163764 ) ) ( not ( = ?auto_163763 ?auto_163765 ) ) ( not ( = ?auto_163763 ?auto_163766 ) ) ( not ( = ?auto_163763 ?auto_163767 ) ) ( not ( = ?auto_163763 ?auto_163768 ) ) ( not ( = ?auto_163763 ?auto_163769 ) ) ( not ( = ?auto_163763 ?auto_163770 ) ) ( not ( = ?auto_163763 ?auto_163771 ) ) ( not ( = ?auto_163763 ?auto_163772 ) ) ( not ( = ?auto_163764 ?auto_163765 ) ) ( not ( = ?auto_163764 ?auto_163766 ) ) ( not ( = ?auto_163764 ?auto_163767 ) ) ( not ( = ?auto_163764 ?auto_163768 ) ) ( not ( = ?auto_163764 ?auto_163769 ) ) ( not ( = ?auto_163764 ?auto_163770 ) ) ( not ( = ?auto_163764 ?auto_163771 ) ) ( not ( = ?auto_163764 ?auto_163772 ) ) ( not ( = ?auto_163765 ?auto_163766 ) ) ( not ( = ?auto_163765 ?auto_163767 ) ) ( not ( = ?auto_163765 ?auto_163768 ) ) ( not ( = ?auto_163765 ?auto_163769 ) ) ( not ( = ?auto_163765 ?auto_163770 ) ) ( not ( = ?auto_163765 ?auto_163771 ) ) ( not ( = ?auto_163765 ?auto_163772 ) ) ( not ( = ?auto_163766 ?auto_163767 ) ) ( not ( = ?auto_163766 ?auto_163768 ) ) ( not ( = ?auto_163766 ?auto_163769 ) ) ( not ( = ?auto_163766 ?auto_163770 ) ) ( not ( = ?auto_163766 ?auto_163771 ) ) ( not ( = ?auto_163766 ?auto_163772 ) ) ( not ( = ?auto_163767 ?auto_163768 ) ) ( not ( = ?auto_163767 ?auto_163769 ) ) ( not ( = ?auto_163767 ?auto_163770 ) ) ( not ( = ?auto_163767 ?auto_163771 ) ) ( not ( = ?auto_163767 ?auto_163772 ) ) ( not ( = ?auto_163768 ?auto_163769 ) ) ( not ( = ?auto_163768 ?auto_163770 ) ) ( not ( = ?auto_163768 ?auto_163771 ) ) ( not ( = ?auto_163768 ?auto_163772 ) ) ( not ( = ?auto_163769 ?auto_163770 ) ) ( not ( = ?auto_163769 ?auto_163771 ) ) ( not ( = ?auto_163769 ?auto_163772 ) ) ( not ( = ?auto_163770 ?auto_163771 ) ) ( not ( = ?auto_163770 ?auto_163772 ) ) ( not ( = ?auto_163771 ?auto_163772 ) ) ( ON ?auto_163771 ?auto_163772 ) ( ON ?auto_163770 ?auto_163771 ) ( ON ?auto_163769 ?auto_163770 ) ( ON ?auto_163768 ?auto_163769 ) ( ON ?auto_163767 ?auto_163768 ) ( ON ?auto_163766 ?auto_163767 ) ( ON ?auto_163765 ?auto_163766 ) ( CLEAR ?auto_163763 ) ( ON ?auto_163764 ?auto_163765 ) ( CLEAR ?auto_163764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163761 ?auto_163762 ?auto_163763 ?auto_163764 )
      ( MAKE-12PILE ?auto_163761 ?auto_163762 ?auto_163763 ?auto_163764 ?auto_163765 ?auto_163766 ?auto_163767 ?auto_163768 ?auto_163769 ?auto_163770 ?auto_163771 ?auto_163772 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163785 - BLOCK
      ?auto_163786 - BLOCK
      ?auto_163787 - BLOCK
      ?auto_163788 - BLOCK
      ?auto_163789 - BLOCK
      ?auto_163790 - BLOCK
      ?auto_163791 - BLOCK
      ?auto_163792 - BLOCK
      ?auto_163793 - BLOCK
      ?auto_163794 - BLOCK
      ?auto_163795 - BLOCK
      ?auto_163796 - BLOCK
    )
    :vars
    (
      ?auto_163797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163796 ?auto_163797 ) ( ON-TABLE ?auto_163785 ) ( ON ?auto_163786 ?auto_163785 ) ( not ( = ?auto_163785 ?auto_163786 ) ) ( not ( = ?auto_163785 ?auto_163787 ) ) ( not ( = ?auto_163785 ?auto_163788 ) ) ( not ( = ?auto_163785 ?auto_163789 ) ) ( not ( = ?auto_163785 ?auto_163790 ) ) ( not ( = ?auto_163785 ?auto_163791 ) ) ( not ( = ?auto_163785 ?auto_163792 ) ) ( not ( = ?auto_163785 ?auto_163793 ) ) ( not ( = ?auto_163785 ?auto_163794 ) ) ( not ( = ?auto_163785 ?auto_163795 ) ) ( not ( = ?auto_163785 ?auto_163796 ) ) ( not ( = ?auto_163785 ?auto_163797 ) ) ( not ( = ?auto_163786 ?auto_163787 ) ) ( not ( = ?auto_163786 ?auto_163788 ) ) ( not ( = ?auto_163786 ?auto_163789 ) ) ( not ( = ?auto_163786 ?auto_163790 ) ) ( not ( = ?auto_163786 ?auto_163791 ) ) ( not ( = ?auto_163786 ?auto_163792 ) ) ( not ( = ?auto_163786 ?auto_163793 ) ) ( not ( = ?auto_163786 ?auto_163794 ) ) ( not ( = ?auto_163786 ?auto_163795 ) ) ( not ( = ?auto_163786 ?auto_163796 ) ) ( not ( = ?auto_163786 ?auto_163797 ) ) ( not ( = ?auto_163787 ?auto_163788 ) ) ( not ( = ?auto_163787 ?auto_163789 ) ) ( not ( = ?auto_163787 ?auto_163790 ) ) ( not ( = ?auto_163787 ?auto_163791 ) ) ( not ( = ?auto_163787 ?auto_163792 ) ) ( not ( = ?auto_163787 ?auto_163793 ) ) ( not ( = ?auto_163787 ?auto_163794 ) ) ( not ( = ?auto_163787 ?auto_163795 ) ) ( not ( = ?auto_163787 ?auto_163796 ) ) ( not ( = ?auto_163787 ?auto_163797 ) ) ( not ( = ?auto_163788 ?auto_163789 ) ) ( not ( = ?auto_163788 ?auto_163790 ) ) ( not ( = ?auto_163788 ?auto_163791 ) ) ( not ( = ?auto_163788 ?auto_163792 ) ) ( not ( = ?auto_163788 ?auto_163793 ) ) ( not ( = ?auto_163788 ?auto_163794 ) ) ( not ( = ?auto_163788 ?auto_163795 ) ) ( not ( = ?auto_163788 ?auto_163796 ) ) ( not ( = ?auto_163788 ?auto_163797 ) ) ( not ( = ?auto_163789 ?auto_163790 ) ) ( not ( = ?auto_163789 ?auto_163791 ) ) ( not ( = ?auto_163789 ?auto_163792 ) ) ( not ( = ?auto_163789 ?auto_163793 ) ) ( not ( = ?auto_163789 ?auto_163794 ) ) ( not ( = ?auto_163789 ?auto_163795 ) ) ( not ( = ?auto_163789 ?auto_163796 ) ) ( not ( = ?auto_163789 ?auto_163797 ) ) ( not ( = ?auto_163790 ?auto_163791 ) ) ( not ( = ?auto_163790 ?auto_163792 ) ) ( not ( = ?auto_163790 ?auto_163793 ) ) ( not ( = ?auto_163790 ?auto_163794 ) ) ( not ( = ?auto_163790 ?auto_163795 ) ) ( not ( = ?auto_163790 ?auto_163796 ) ) ( not ( = ?auto_163790 ?auto_163797 ) ) ( not ( = ?auto_163791 ?auto_163792 ) ) ( not ( = ?auto_163791 ?auto_163793 ) ) ( not ( = ?auto_163791 ?auto_163794 ) ) ( not ( = ?auto_163791 ?auto_163795 ) ) ( not ( = ?auto_163791 ?auto_163796 ) ) ( not ( = ?auto_163791 ?auto_163797 ) ) ( not ( = ?auto_163792 ?auto_163793 ) ) ( not ( = ?auto_163792 ?auto_163794 ) ) ( not ( = ?auto_163792 ?auto_163795 ) ) ( not ( = ?auto_163792 ?auto_163796 ) ) ( not ( = ?auto_163792 ?auto_163797 ) ) ( not ( = ?auto_163793 ?auto_163794 ) ) ( not ( = ?auto_163793 ?auto_163795 ) ) ( not ( = ?auto_163793 ?auto_163796 ) ) ( not ( = ?auto_163793 ?auto_163797 ) ) ( not ( = ?auto_163794 ?auto_163795 ) ) ( not ( = ?auto_163794 ?auto_163796 ) ) ( not ( = ?auto_163794 ?auto_163797 ) ) ( not ( = ?auto_163795 ?auto_163796 ) ) ( not ( = ?auto_163795 ?auto_163797 ) ) ( not ( = ?auto_163796 ?auto_163797 ) ) ( ON ?auto_163795 ?auto_163796 ) ( ON ?auto_163794 ?auto_163795 ) ( ON ?auto_163793 ?auto_163794 ) ( ON ?auto_163792 ?auto_163793 ) ( ON ?auto_163791 ?auto_163792 ) ( ON ?auto_163790 ?auto_163791 ) ( ON ?auto_163789 ?auto_163790 ) ( ON ?auto_163788 ?auto_163789 ) ( CLEAR ?auto_163786 ) ( ON ?auto_163787 ?auto_163788 ) ( CLEAR ?auto_163787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163785 ?auto_163786 ?auto_163787 )
      ( MAKE-12PILE ?auto_163785 ?auto_163786 ?auto_163787 ?auto_163788 ?auto_163789 ?auto_163790 ?auto_163791 ?auto_163792 ?auto_163793 ?auto_163794 ?auto_163795 ?auto_163796 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163810 - BLOCK
      ?auto_163811 - BLOCK
      ?auto_163812 - BLOCK
      ?auto_163813 - BLOCK
      ?auto_163814 - BLOCK
      ?auto_163815 - BLOCK
      ?auto_163816 - BLOCK
      ?auto_163817 - BLOCK
      ?auto_163818 - BLOCK
      ?auto_163819 - BLOCK
      ?auto_163820 - BLOCK
      ?auto_163821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163821 ) ( ON-TABLE ?auto_163810 ) ( ON ?auto_163811 ?auto_163810 ) ( not ( = ?auto_163810 ?auto_163811 ) ) ( not ( = ?auto_163810 ?auto_163812 ) ) ( not ( = ?auto_163810 ?auto_163813 ) ) ( not ( = ?auto_163810 ?auto_163814 ) ) ( not ( = ?auto_163810 ?auto_163815 ) ) ( not ( = ?auto_163810 ?auto_163816 ) ) ( not ( = ?auto_163810 ?auto_163817 ) ) ( not ( = ?auto_163810 ?auto_163818 ) ) ( not ( = ?auto_163810 ?auto_163819 ) ) ( not ( = ?auto_163810 ?auto_163820 ) ) ( not ( = ?auto_163810 ?auto_163821 ) ) ( not ( = ?auto_163811 ?auto_163812 ) ) ( not ( = ?auto_163811 ?auto_163813 ) ) ( not ( = ?auto_163811 ?auto_163814 ) ) ( not ( = ?auto_163811 ?auto_163815 ) ) ( not ( = ?auto_163811 ?auto_163816 ) ) ( not ( = ?auto_163811 ?auto_163817 ) ) ( not ( = ?auto_163811 ?auto_163818 ) ) ( not ( = ?auto_163811 ?auto_163819 ) ) ( not ( = ?auto_163811 ?auto_163820 ) ) ( not ( = ?auto_163811 ?auto_163821 ) ) ( not ( = ?auto_163812 ?auto_163813 ) ) ( not ( = ?auto_163812 ?auto_163814 ) ) ( not ( = ?auto_163812 ?auto_163815 ) ) ( not ( = ?auto_163812 ?auto_163816 ) ) ( not ( = ?auto_163812 ?auto_163817 ) ) ( not ( = ?auto_163812 ?auto_163818 ) ) ( not ( = ?auto_163812 ?auto_163819 ) ) ( not ( = ?auto_163812 ?auto_163820 ) ) ( not ( = ?auto_163812 ?auto_163821 ) ) ( not ( = ?auto_163813 ?auto_163814 ) ) ( not ( = ?auto_163813 ?auto_163815 ) ) ( not ( = ?auto_163813 ?auto_163816 ) ) ( not ( = ?auto_163813 ?auto_163817 ) ) ( not ( = ?auto_163813 ?auto_163818 ) ) ( not ( = ?auto_163813 ?auto_163819 ) ) ( not ( = ?auto_163813 ?auto_163820 ) ) ( not ( = ?auto_163813 ?auto_163821 ) ) ( not ( = ?auto_163814 ?auto_163815 ) ) ( not ( = ?auto_163814 ?auto_163816 ) ) ( not ( = ?auto_163814 ?auto_163817 ) ) ( not ( = ?auto_163814 ?auto_163818 ) ) ( not ( = ?auto_163814 ?auto_163819 ) ) ( not ( = ?auto_163814 ?auto_163820 ) ) ( not ( = ?auto_163814 ?auto_163821 ) ) ( not ( = ?auto_163815 ?auto_163816 ) ) ( not ( = ?auto_163815 ?auto_163817 ) ) ( not ( = ?auto_163815 ?auto_163818 ) ) ( not ( = ?auto_163815 ?auto_163819 ) ) ( not ( = ?auto_163815 ?auto_163820 ) ) ( not ( = ?auto_163815 ?auto_163821 ) ) ( not ( = ?auto_163816 ?auto_163817 ) ) ( not ( = ?auto_163816 ?auto_163818 ) ) ( not ( = ?auto_163816 ?auto_163819 ) ) ( not ( = ?auto_163816 ?auto_163820 ) ) ( not ( = ?auto_163816 ?auto_163821 ) ) ( not ( = ?auto_163817 ?auto_163818 ) ) ( not ( = ?auto_163817 ?auto_163819 ) ) ( not ( = ?auto_163817 ?auto_163820 ) ) ( not ( = ?auto_163817 ?auto_163821 ) ) ( not ( = ?auto_163818 ?auto_163819 ) ) ( not ( = ?auto_163818 ?auto_163820 ) ) ( not ( = ?auto_163818 ?auto_163821 ) ) ( not ( = ?auto_163819 ?auto_163820 ) ) ( not ( = ?auto_163819 ?auto_163821 ) ) ( not ( = ?auto_163820 ?auto_163821 ) ) ( ON ?auto_163820 ?auto_163821 ) ( ON ?auto_163819 ?auto_163820 ) ( ON ?auto_163818 ?auto_163819 ) ( ON ?auto_163817 ?auto_163818 ) ( ON ?auto_163816 ?auto_163817 ) ( ON ?auto_163815 ?auto_163816 ) ( ON ?auto_163814 ?auto_163815 ) ( ON ?auto_163813 ?auto_163814 ) ( CLEAR ?auto_163811 ) ( ON ?auto_163812 ?auto_163813 ) ( CLEAR ?auto_163812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163810 ?auto_163811 ?auto_163812 )
      ( MAKE-12PILE ?auto_163810 ?auto_163811 ?auto_163812 ?auto_163813 ?auto_163814 ?auto_163815 ?auto_163816 ?auto_163817 ?auto_163818 ?auto_163819 ?auto_163820 ?auto_163821 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163834 - BLOCK
      ?auto_163835 - BLOCK
      ?auto_163836 - BLOCK
      ?auto_163837 - BLOCK
      ?auto_163838 - BLOCK
      ?auto_163839 - BLOCK
      ?auto_163840 - BLOCK
      ?auto_163841 - BLOCK
      ?auto_163842 - BLOCK
      ?auto_163843 - BLOCK
      ?auto_163844 - BLOCK
      ?auto_163845 - BLOCK
    )
    :vars
    (
      ?auto_163846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163845 ?auto_163846 ) ( ON-TABLE ?auto_163834 ) ( not ( = ?auto_163834 ?auto_163835 ) ) ( not ( = ?auto_163834 ?auto_163836 ) ) ( not ( = ?auto_163834 ?auto_163837 ) ) ( not ( = ?auto_163834 ?auto_163838 ) ) ( not ( = ?auto_163834 ?auto_163839 ) ) ( not ( = ?auto_163834 ?auto_163840 ) ) ( not ( = ?auto_163834 ?auto_163841 ) ) ( not ( = ?auto_163834 ?auto_163842 ) ) ( not ( = ?auto_163834 ?auto_163843 ) ) ( not ( = ?auto_163834 ?auto_163844 ) ) ( not ( = ?auto_163834 ?auto_163845 ) ) ( not ( = ?auto_163834 ?auto_163846 ) ) ( not ( = ?auto_163835 ?auto_163836 ) ) ( not ( = ?auto_163835 ?auto_163837 ) ) ( not ( = ?auto_163835 ?auto_163838 ) ) ( not ( = ?auto_163835 ?auto_163839 ) ) ( not ( = ?auto_163835 ?auto_163840 ) ) ( not ( = ?auto_163835 ?auto_163841 ) ) ( not ( = ?auto_163835 ?auto_163842 ) ) ( not ( = ?auto_163835 ?auto_163843 ) ) ( not ( = ?auto_163835 ?auto_163844 ) ) ( not ( = ?auto_163835 ?auto_163845 ) ) ( not ( = ?auto_163835 ?auto_163846 ) ) ( not ( = ?auto_163836 ?auto_163837 ) ) ( not ( = ?auto_163836 ?auto_163838 ) ) ( not ( = ?auto_163836 ?auto_163839 ) ) ( not ( = ?auto_163836 ?auto_163840 ) ) ( not ( = ?auto_163836 ?auto_163841 ) ) ( not ( = ?auto_163836 ?auto_163842 ) ) ( not ( = ?auto_163836 ?auto_163843 ) ) ( not ( = ?auto_163836 ?auto_163844 ) ) ( not ( = ?auto_163836 ?auto_163845 ) ) ( not ( = ?auto_163836 ?auto_163846 ) ) ( not ( = ?auto_163837 ?auto_163838 ) ) ( not ( = ?auto_163837 ?auto_163839 ) ) ( not ( = ?auto_163837 ?auto_163840 ) ) ( not ( = ?auto_163837 ?auto_163841 ) ) ( not ( = ?auto_163837 ?auto_163842 ) ) ( not ( = ?auto_163837 ?auto_163843 ) ) ( not ( = ?auto_163837 ?auto_163844 ) ) ( not ( = ?auto_163837 ?auto_163845 ) ) ( not ( = ?auto_163837 ?auto_163846 ) ) ( not ( = ?auto_163838 ?auto_163839 ) ) ( not ( = ?auto_163838 ?auto_163840 ) ) ( not ( = ?auto_163838 ?auto_163841 ) ) ( not ( = ?auto_163838 ?auto_163842 ) ) ( not ( = ?auto_163838 ?auto_163843 ) ) ( not ( = ?auto_163838 ?auto_163844 ) ) ( not ( = ?auto_163838 ?auto_163845 ) ) ( not ( = ?auto_163838 ?auto_163846 ) ) ( not ( = ?auto_163839 ?auto_163840 ) ) ( not ( = ?auto_163839 ?auto_163841 ) ) ( not ( = ?auto_163839 ?auto_163842 ) ) ( not ( = ?auto_163839 ?auto_163843 ) ) ( not ( = ?auto_163839 ?auto_163844 ) ) ( not ( = ?auto_163839 ?auto_163845 ) ) ( not ( = ?auto_163839 ?auto_163846 ) ) ( not ( = ?auto_163840 ?auto_163841 ) ) ( not ( = ?auto_163840 ?auto_163842 ) ) ( not ( = ?auto_163840 ?auto_163843 ) ) ( not ( = ?auto_163840 ?auto_163844 ) ) ( not ( = ?auto_163840 ?auto_163845 ) ) ( not ( = ?auto_163840 ?auto_163846 ) ) ( not ( = ?auto_163841 ?auto_163842 ) ) ( not ( = ?auto_163841 ?auto_163843 ) ) ( not ( = ?auto_163841 ?auto_163844 ) ) ( not ( = ?auto_163841 ?auto_163845 ) ) ( not ( = ?auto_163841 ?auto_163846 ) ) ( not ( = ?auto_163842 ?auto_163843 ) ) ( not ( = ?auto_163842 ?auto_163844 ) ) ( not ( = ?auto_163842 ?auto_163845 ) ) ( not ( = ?auto_163842 ?auto_163846 ) ) ( not ( = ?auto_163843 ?auto_163844 ) ) ( not ( = ?auto_163843 ?auto_163845 ) ) ( not ( = ?auto_163843 ?auto_163846 ) ) ( not ( = ?auto_163844 ?auto_163845 ) ) ( not ( = ?auto_163844 ?auto_163846 ) ) ( not ( = ?auto_163845 ?auto_163846 ) ) ( ON ?auto_163844 ?auto_163845 ) ( ON ?auto_163843 ?auto_163844 ) ( ON ?auto_163842 ?auto_163843 ) ( ON ?auto_163841 ?auto_163842 ) ( ON ?auto_163840 ?auto_163841 ) ( ON ?auto_163839 ?auto_163840 ) ( ON ?auto_163838 ?auto_163839 ) ( ON ?auto_163837 ?auto_163838 ) ( ON ?auto_163836 ?auto_163837 ) ( CLEAR ?auto_163834 ) ( ON ?auto_163835 ?auto_163836 ) ( CLEAR ?auto_163835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163834 ?auto_163835 )
      ( MAKE-12PILE ?auto_163834 ?auto_163835 ?auto_163836 ?auto_163837 ?auto_163838 ?auto_163839 ?auto_163840 ?auto_163841 ?auto_163842 ?auto_163843 ?auto_163844 ?auto_163845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163859 - BLOCK
      ?auto_163860 - BLOCK
      ?auto_163861 - BLOCK
      ?auto_163862 - BLOCK
      ?auto_163863 - BLOCK
      ?auto_163864 - BLOCK
      ?auto_163865 - BLOCK
      ?auto_163866 - BLOCK
      ?auto_163867 - BLOCK
      ?auto_163868 - BLOCK
      ?auto_163869 - BLOCK
      ?auto_163870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163870 ) ( ON-TABLE ?auto_163859 ) ( not ( = ?auto_163859 ?auto_163860 ) ) ( not ( = ?auto_163859 ?auto_163861 ) ) ( not ( = ?auto_163859 ?auto_163862 ) ) ( not ( = ?auto_163859 ?auto_163863 ) ) ( not ( = ?auto_163859 ?auto_163864 ) ) ( not ( = ?auto_163859 ?auto_163865 ) ) ( not ( = ?auto_163859 ?auto_163866 ) ) ( not ( = ?auto_163859 ?auto_163867 ) ) ( not ( = ?auto_163859 ?auto_163868 ) ) ( not ( = ?auto_163859 ?auto_163869 ) ) ( not ( = ?auto_163859 ?auto_163870 ) ) ( not ( = ?auto_163860 ?auto_163861 ) ) ( not ( = ?auto_163860 ?auto_163862 ) ) ( not ( = ?auto_163860 ?auto_163863 ) ) ( not ( = ?auto_163860 ?auto_163864 ) ) ( not ( = ?auto_163860 ?auto_163865 ) ) ( not ( = ?auto_163860 ?auto_163866 ) ) ( not ( = ?auto_163860 ?auto_163867 ) ) ( not ( = ?auto_163860 ?auto_163868 ) ) ( not ( = ?auto_163860 ?auto_163869 ) ) ( not ( = ?auto_163860 ?auto_163870 ) ) ( not ( = ?auto_163861 ?auto_163862 ) ) ( not ( = ?auto_163861 ?auto_163863 ) ) ( not ( = ?auto_163861 ?auto_163864 ) ) ( not ( = ?auto_163861 ?auto_163865 ) ) ( not ( = ?auto_163861 ?auto_163866 ) ) ( not ( = ?auto_163861 ?auto_163867 ) ) ( not ( = ?auto_163861 ?auto_163868 ) ) ( not ( = ?auto_163861 ?auto_163869 ) ) ( not ( = ?auto_163861 ?auto_163870 ) ) ( not ( = ?auto_163862 ?auto_163863 ) ) ( not ( = ?auto_163862 ?auto_163864 ) ) ( not ( = ?auto_163862 ?auto_163865 ) ) ( not ( = ?auto_163862 ?auto_163866 ) ) ( not ( = ?auto_163862 ?auto_163867 ) ) ( not ( = ?auto_163862 ?auto_163868 ) ) ( not ( = ?auto_163862 ?auto_163869 ) ) ( not ( = ?auto_163862 ?auto_163870 ) ) ( not ( = ?auto_163863 ?auto_163864 ) ) ( not ( = ?auto_163863 ?auto_163865 ) ) ( not ( = ?auto_163863 ?auto_163866 ) ) ( not ( = ?auto_163863 ?auto_163867 ) ) ( not ( = ?auto_163863 ?auto_163868 ) ) ( not ( = ?auto_163863 ?auto_163869 ) ) ( not ( = ?auto_163863 ?auto_163870 ) ) ( not ( = ?auto_163864 ?auto_163865 ) ) ( not ( = ?auto_163864 ?auto_163866 ) ) ( not ( = ?auto_163864 ?auto_163867 ) ) ( not ( = ?auto_163864 ?auto_163868 ) ) ( not ( = ?auto_163864 ?auto_163869 ) ) ( not ( = ?auto_163864 ?auto_163870 ) ) ( not ( = ?auto_163865 ?auto_163866 ) ) ( not ( = ?auto_163865 ?auto_163867 ) ) ( not ( = ?auto_163865 ?auto_163868 ) ) ( not ( = ?auto_163865 ?auto_163869 ) ) ( not ( = ?auto_163865 ?auto_163870 ) ) ( not ( = ?auto_163866 ?auto_163867 ) ) ( not ( = ?auto_163866 ?auto_163868 ) ) ( not ( = ?auto_163866 ?auto_163869 ) ) ( not ( = ?auto_163866 ?auto_163870 ) ) ( not ( = ?auto_163867 ?auto_163868 ) ) ( not ( = ?auto_163867 ?auto_163869 ) ) ( not ( = ?auto_163867 ?auto_163870 ) ) ( not ( = ?auto_163868 ?auto_163869 ) ) ( not ( = ?auto_163868 ?auto_163870 ) ) ( not ( = ?auto_163869 ?auto_163870 ) ) ( ON ?auto_163869 ?auto_163870 ) ( ON ?auto_163868 ?auto_163869 ) ( ON ?auto_163867 ?auto_163868 ) ( ON ?auto_163866 ?auto_163867 ) ( ON ?auto_163865 ?auto_163866 ) ( ON ?auto_163864 ?auto_163865 ) ( ON ?auto_163863 ?auto_163864 ) ( ON ?auto_163862 ?auto_163863 ) ( ON ?auto_163861 ?auto_163862 ) ( CLEAR ?auto_163859 ) ( ON ?auto_163860 ?auto_163861 ) ( CLEAR ?auto_163860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163859 ?auto_163860 )
      ( MAKE-12PILE ?auto_163859 ?auto_163860 ?auto_163861 ?auto_163862 ?auto_163863 ?auto_163864 ?auto_163865 ?auto_163866 ?auto_163867 ?auto_163868 ?auto_163869 ?auto_163870 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163883 - BLOCK
      ?auto_163884 - BLOCK
      ?auto_163885 - BLOCK
      ?auto_163886 - BLOCK
      ?auto_163887 - BLOCK
      ?auto_163888 - BLOCK
      ?auto_163889 - BLOCK
      ?auto_163890 - BLOCK
      ?auto_163891 - BLOCK
      ?auto_163892 - BLOCK
      ?auto_163893 - BLOCK
      ?auto_163894 - BLOCK
    )
    :vars
    (
      ?auto_163895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163894 ?auto_163895 ) ( not ( = ?auto_163883 ?auto_163884 ) ) ( not ( = ?auto_163883 ?auto_163885 ) ) ( not ( = ?auto_163883 ?auto_163886 ) ) ( not ( = ?auto_163883 ?auto_163887 ) ) ( not ( = ?auto_163883 ?auto_163888 ) ) ( not ( = ?auto_163883 ?auto_163889 ) ) ( not ( = ?auto_163883 ?auto_163890 ) ) ( not ( = ?auto_163883 ?auto_163891 ) ) ( not ( = ?auto_163883 ?auto_163892 ) ) ( not ( = ?auto_163883 ?auto_163893 ) ) ( not ( = ?auto_163883 ?auto_163894 ) ) ( not ( = ?auto_163883 ?auto_163895 ) ) ( not ( = ?auto_163884 ?auto_163885 ) ) ( not ( = ?auto_163884 ?auto_163886 ) ) ( not ( = ?auto_163884 ?auto_163887 ) ) ( not ( = ?auto_163884 ?auto_163888 ) ) ( not ( = ?auto_163884 ?auto_163889 ) ) ( not ( = ?auto_163884 ?auto_163890 ) ) ( not ( = ?auto_163884 ?auto_163891 ) ) ( not ( = ?auto_163884 ?auto_163892 ) ) ( not ( = ?auto_163884 ?auto_163893 ) ) ( not ( = ?auto_163884 ?auto_163894 ) ) ( not ( = ?auto_163884 ?auto_163895 ) ) ( not ( = ?auto_163885 ?auto_163886 ) ) ( not ( = ?auto_163885 ?auto_163887 ) ) ( not ( = ?auto_163885 ?auto_163888 ) ) ( not ( = ?auto_163885 ?auto_163889 ) ) ( not ( = ?auto_163885 ?auto_163890 ) ) ( not ( = ?auto_163885 ?auto_163891 ) ) ( not ( = ?auto_163885 ?auto_163892 ) ) ( not ( = ?auto_163885 ?auto_163893 ) ) ( not ( = ?auto_163885 ?auto_163894 ) ) ( not ( = ?auto_163885 ?auto_163895 ) ) ( not ( = ?auto_163886 ?auto_163887 ) ) ( not ( = ?auto_163886 ?auto_163888 ) ) ( not ( = ?auto_163886 ?auto_163889 ) ) ( not ( = ?auto_163886 ?auto_163890 ) ) ( not ( = ?auto_163886 ?auto_163891 ) ) ( not ( = ?auto_163886 ?auto_163892 ) ) ( not ( = ?auto_163886 ?auto_163893 ) ) ( not ( = ?auto_163886 ?auto_163894 ) ) ( not ( = ?auto_163886 ?auto_163895 ) ) ( not ( = ?auto_163887 ?auto_163888 ) ) ( not ( = ?auto_163887 ?auto_163889 ) ) ( not ( = ?auto_163887 ?auto_163890 ) ) ( not ( = ?auto_163887 ?auto_163891 ) ) ( not ( = ?auto_163887 ?auto_163892 ) ) ( not ( = ?auto_163887 ?auto_163893 ) ) ( not ( = ?auto_163887 ?auto_163894 ) ) ( not ( = ?auto_163887 ?auto_163895 ) ) ( not ( = ?auto_163888 ?auto_163889 ) ) ( not ( = ?auto_163888 ?auto_163890 ) ) ( not ( = ?auto_163888 ?auto_163891 ) ) ( not ( = ?auto_163888 ?auto_163892 ) ) ( not ( = ?auto_163888 ?auto_163893 ) ) ( not ( = ?auto_163888 ?auto_163894 ) ) ( not ( = ?auto_163888 ?auto_163895 ) ) ( not ( = ?auto_163889 ?auto_163890 ) ) ( not ( = ?auto_163889 ?auto_163891 ) ) ( not ( = ?auto_163889 ?auto_163892 ) ) ( not ( = ?auto_163889 ?auto_163893 ) ) ( not ( = ?auto_163889 ?auto_163894 ) ) ( not ( = ?auto_163889 ?auto_163895 ) ) ( not ( = ?auto_163890 ?auto_163891 ) ) ( not ( = ?auto_163890 ?auto_163892 ) ) ( not ( = ?auto_163890 ?auto_163893 ) ) ( not ( = ?auto_163890 ?auto_163894 ) ) ( not ( = ?auto_163890 ?auto_163895 ) ) ( not ( = ?auto_163891 ?auto_163892 ) ) ( not ( = ?auto_163891 ?auto_163893 ) ) ( not ( = ?auto_163891 ?auto_163894 ) ) ( not ( = ?auto_163891 ?auto_163895 ) ) ( not ( = ?auto_163892 ?auto_163893 ) ) ( not ( = ?auto_163892 ?auto_163894 ) ) ( not ( = ?auto_163892 ?auto_163895 ) ) ( not ( = ?auto_163893 ?auto_163894 ) ) ( not ( = ?auto_163893 ?auto_163895 ) ) ( not ( = ?auto_163894 ?auto_163895 ) ) ( ON ?auto_163893 ?auto_163894 ) ( ON ?auto_163892 ?auto_163893 ) ( ON ?auto_163891 ?auto_163892 ) ( ON ?auto_163890 ?auto_163891 ) ( ON ?auto_163889 ?auto_163890 ) ( ON ?auto_163888 ?auto_163889 ) ( ON ?auto_163887 ?auto_163888 ) ( ON ?auto_163886 ?auto_163887 ) ( ON ?auto_163885 ?auto_163886 ) ( ON ?auto_163884 ?auto_163885 ) ( ON ?auto_163883 ?auto_163884 ) ( CLEAR ?auto_163883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163883 )
      ( MAKE-12PILE ?auto_163883 ?auto_163884 ?auto_163885 ?auto_163886 ?auto_163887 ?auto_163888 ?auto_163889 ?auto_163890 ?auto_163891 ?auto_163892 ?auto_163893 ?auto_163894 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163908 - BLOCK
      ?auto_163909 - BLOCK
      ?auto_163910 - BLOCK
      ?auto_163911 - BLOCK
      ?auto_163912 - BLOCK
      ?auto_163913 - BLOCK
      ?auto_163914 - BLOCK
      ?auto_163915 - BLOCK
      ?auto_163916 - BLOCK
      ?auto_163917 - BLOCK
      ?auto_163918 - BLOCK
      ?auto_163919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163919 ) ( not ( = ?auto_163908 ?auto_163909 ) ) ( not ( = ?auto_163908 ?auto_163910 ) ) ( not ( = ?auto_163908 ?auto_163911 ) ) ( not ( = ?auto_163908 ?auto_163912 ) ) ( not ( = ?auto_163908 ?auto_163913 ) ) ( not ( = ?auto_163908 ?auto_163914 ) ) ( not ( = ?auto_163908 ?auto_163915 ) ) ( not ( = ?auto_163908 ?auto_163916 ) ) ( not ( = ?auto_163908 ?auto_163917 ) ) ( not ( = ?auto_163908 ?auto_163918 ) ) ( not ( = ?auto_163908 ?auto_163919 ) ) ( not ( = ?auto_163909 ?auto_163910 ) ) ( not ( = ?auto_163909 ?auto_163911 ) ) ( not ( = ?auto_163909 ?auto_163912 ) ) ( not ( = ?auto_163909 ?auto_163913 ) ) ( not ( = ?auto_163909 ?auto_163914 ) ) ( not ( = ?auto_163909 ?auto_163915 ) ) ( not ( = ?auto_163909 ?auto_163916 ) ) ( not ( = ?auto_163909 ?auto_163917 ) ) ( not ( = ?auto_163909 ?auto_163918 ) ) ( not ( = ?auto_163909 ?auto_163919 ) ) ( not ( = ?auto_163910 ?auto_163911 ) ) ( not ( = ?auto_163910 ?auto_163912 ) ) ( not ( = ?auto_163910 ?auto_163913 ) ) ( not ( = ?auto_163910 ?auto_163914 ) ) ( not ( = ?auto_163910 ?auto_163915 ) ) ( not ( = ?auto_163910 ?auto_163916 ) ) ( not ( = ?auto_163910 ?auto_163917 ) ) ( not ( = ?auto_163910 ?auto_163918 ) ) ( not ( = ?auto_163910 ?auto_163919 ) ) ( not ( = ?auto_163911 ?auto_163912 ) ) ( not ( = ?auto_163911 ?auto_163913 ) ) ( not ( = ?auto_163911 ?auto_163914 ) ) ( not ( = ?auto_163911 ?auto_163915 ) ) ( not ( = ?auto_163911 ?auto_163916 ) ) ( not ( = ?auto_163911 ?auto_163917 ) ) ( not ( = ?auto_163911 ?auto_163918 ) ) ( not ( = ?auto_163911 ?auto_163919 ) ) ( not ( = ?auto_163912 ?auto_163913 ) ) ( not ( = ?auto_163912 ?auto_163914 ) ) ( not ( = ?auto_163912 ?auto_163915 ) ) ( not ( = ?auto_163912 ?auto_163916 ) ) ( not ( = ?auto_163912 ?auto_163917 ) ) ( not ( = ?auto_163912 ?auto_163918 ) ) ( not ( = ?auto_163912 ?auto_163919 ) ) ( not ( = ?auto_163913 ?auto_163914 ) ) ( not ( = ?auto_163913 ?auto_163915 ) ) ( not ( = ?auto_163913 ?auto_163916 ) ) ( not ( = ?auto_163913 ?auto_163917 ) ) ( not ( = ?auto_163913 ?auto_163918 ) ) ( not ( = ?auto_163913 ?auto_163919 ) ) ( not ( = ?auto_163914 ?auto_163915 ) ) ( not ( = ?auto_163914 ?auto_163916 ) ) ( not ( = ?auto_163914 ?auto_163917 ) ) ( not ( = ?auto_163914 ?auto_163918 ) ) ( not ( = ?auto_163914 ?auto_163919 ) ) ( not ( = ?auto_163915 ?auto_163916 ) ) ( not ( = ?auto_163915 ?auto_163917 ) ) ( not ( = ?auto_163915 ?auto_163918 ) ) ( not ( = ?auto_163915 ?auto_163919 ) ) ( not ( = ?auto_163916 ?auto_163917 ) ) ( not ( = ?auto_163916 ?auto_163918 ) ) ( not ( = ?auto_163916 ?auto_163919 ) ) ( not ( = ?auto_163917 ?auto_163918 ) ) ( not ( = ?auto_163917 ?auto_163919 ) ) ( not ( = ?auto_163918 ?auto_163919 ) ) ( ON ?auto_163918 ?auto_163919 ) ( ON ?auto_163917 ?auto_163918 ) ( ON ?auto_163916 ?auto_163917 ) ( ON ?auto_163915 ?auto_163916 ) ( ON ?auto_163914 ?auto_163915 ) ( ON ?auto_163913 ?auto_163914 ) ( ON ?auto_163912 ?auto_163913 ) ( ON ?auto_163911 ?auto_163912 ) ( ON ?auto_163910 ?auto_163911 ) ( ON ?auto_163909 ?auto_163910 ) ( ON ?auto_163908 ?auto_163909 ) ( CLEAR ?auto_163908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163908 )
      ( MAKE-12PILE ?auto_163908 ?auto_163909 ?auto_163910 ?auto_163911 ?auto_163912 ?auto_163913 ?auto_163914 ?auto_163915 ?auto_163916 ?auto_163917 ?auto_163918 ?auto_163919 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163932 - BLOCK
      ?auto_163933 - BLOCK
      ?auto_163934 - BLOCK
      ?auto_163935 - BLOCK
      ?auto_163936 - BLOCK
      ?auto_163937 - BLOCK
      ?auto_163938 - BLOCK
      ?auto_163939 - BLOCK
      ?auto_163940 - BLOCK
      ?auto_163941 - BLOCK
      ?auto_163942 - BLOCK
      ?auto_163943 - BLOCK
    )
    :vars
    (
      ?auto_163944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163932 ?auto_163933 ) ) ( not ( = ?auto_163932 ?auto_163934 ) ) ( not ( = ?auto_163932 ?auto_163935 ) ) ( not ( = ?auto_163932 ?auto_163936 ) ) ( not ( = ?auto_163932 ?auto_163937 ) ) ( not ( = ?auto_163932 ?auto_163938 ) ) ( not ( = ?auto_163932 ?auto_163939 ) ) ( not ( = ?auto_163932 ?auto_163940 ) ) ( not ( = ?auto_163932 ?auto_163941 ) ) ( not ( = ?auto_163932 ?auto_163942 ) ) ( not ( = ?auto_163932 ?auto_163943 ) ) ( not ( = ?auto_163933 ?auto_163934 ) ) ( not ( = ?auto_163933 ?auto_163935 ) ) ( not ( = ?auto_163933 ?auto_163936 ) ) ( not ( = ?auto_163933 ?auto_163937 ) ) ( not ( = ?auto_163933 ?auto_163938 ) ) ( not ( = ?auto_163933 ?auto_163939 ) ) ( not ( = ?auto_163933 ?auto_163940 ) ) ( not ( = ?auto_163933 ?auto_163941 ) ) ( not ( = ?auto_163933 ?auto_163942 ) ) ( not ( = ?auto_163933 ?auto_163943 ) ) ( not ( = ?auto_163934 ?auto_163935 ) ) ( not ( = ?auto_163934 ?auto_163936 ) ) ( not ( = ?auto_163934 ?auto_163937 ) ) ( not ( = ?auto_163934 ?auto_163938 ) ) ( not ( = ?auto_163934 ?auto_163939 ) ) ( not ( = ?auto_163934 ?auto_163940 ) ) ( not ( = ?auto_163934 ?auto_163941 ) ) ( not ( = ?auto_163934 ?auto_163942 ) ) ( not ( = ?auto_163934 ?auto_163943 ) ) ( not ( = ?auto_163935 ?auto_163936 ) ) ( not ( = ?auto_163935 ?auto_163937 ) ) ( not ( = ?auto_163935 ?auto_163938 ) ) ( not ( = ?auto_163935 ?auto_163939 ) ) ( not ( = ?auto_163935 ?auto_163940 ) ) ( not ( = ?auto_163935 ?auto_163941 ) ) ( not ( = ?auto_163935 ?auto_163942 ) ) ( not ( = ?auto_163935 ?auto_163943 ) ) ( not ( = ?auto_163936 ?auto_163937 ) ) ( not ( = ?auto_163936 ?auto_163938 ) ) ( not ( = ?auto_163936 ?auto_163939 ) ) ( not ( = ?auto_163936 ?auto_163940 ) ) ( not ( = ?auto_163936 ?auto_163941 ) ) ( not ( = ?auto_163936 ?auto_163942 ) ) ( not ( = ?auto_163936 ?auto_163943 ) ) ( not ( = ?auto_163937 ?auto_163938 ) ) ( not ( = ?auto_163937 ?auto_163939 ) ) ( not ( = ?auto_163937 ?auto_163940 ) ) ( not ( = ?auto_163937 ?auto_163941 ) ) ( not ( = ?auto_163937 ?auto_163942 ) ) ( not ( = ?auto_163937 ?auto_163943 ) ) ( not ( = ?auto_163938 ?auto_163939 ) ) ( not ( = ?auto_163938 ?auto_163940 ) ) ( not ( = ?auto_163938 ?auto_163941 ) ) ( not ( = ?auto_163938 ?auto_163942 ) ) ( not ( = ?auto_163938 ?auto_163943 ) ) ( not ( = ?auto_163939 ?auto_163940 ) ) ( not ( = ?auto_163939 ?auto_163941 ) ) ( not ( = ?auto_163939 ?auto_163942 ) ) ( not ( = ?auto_163939 ?auto_163943 ) ) ( not ( = ?auto_163940 ?auto_163941 ) ) ( not ( = ?auto_163940 ?auto_163942 ) ) ( not ( = ?auto_163940 ?auto_163943 ) ) ( not ( = ?auto_163941 ?auto_163942 ) ) ( not ( = ?auto_163941 ?auto_163943 ) ) ( not ( = ?auto_163942 ?auto_163943 ) ) ( ON ?auto_163932 ?auto_163944 ) ( not ( = ?auto_163943 ?auto_163944 ) ) ( not ( = ?auto_163942 ?auto_163944 ) ) ( not ( = ?auto_163941 ?auto_163944 ) ) ( not ( = ?auto_163940 ?auto_163944 ) ) ( not ( = ?auto_163939 ?auto_163944 ) ) ( not ( = ?auto_163938 ?auto_163944 ) ) ( not ( = ?auto_163937 ?auto_163944 ) ) ( not ( = ?auto_163936 ?auto_163944 ) ) ( not ( = ?auto_163935 ?auto_163944 ) ) ( not ( = ?auto_163934 ?auto_163944 ) ) ( not ( = ?auto_163933 ?auto_163944 ) ) ( not ( = ?auto_163932 ?auto_163944 ) ) ( ON ?auto_163933 ?auto_163932 ) ( ON ?auto_163934 ?auto_163933 ) ( ON ?auto_163935 ?auto_163934 ) ( ON ?auto_163936 ?auto_163935 ) ( ON ?auto_163937 ?auto_163936 ) ( ON ?auto_163938 ?auto_163937 ) ( ON ?auto_163939 ?auto_163938 ) ( ON ?auto_163940 ?auto_163939 ) ( ON ?auto_163941 ?auto_163940 ) ( ON ?auto_163942 ?auto_163941 ) ( ON ?auto_163943 ?auto_163942 ) ( CLEAR ?auto_163943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_163943 ?auto_163942 ?auto_163941 ?auto_163940 ?auto_163939 ?auto_163938 ?auto_163937 ?auto_163936 ?auto_163935 ?auto_163934 ?auto_163933 ?auto_163932 )
      ( MAKE-12PILE ?auto_163932 ?auto_163933 ?auto_163934 ?auto_163935 ?auto_163936 ?auto_163937 ?auto_163938 ?auto_163939 ?auto_163940 ?auto_163941 ?auto_163942 ?auto_163943 ) )
  )

)

