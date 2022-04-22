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
      ?auto_14171 - BLOCK
    )
    :vars
    (
      ?auto_14172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14171 ?auto_14172 ) ( CLEAR ?auto_14171 ) ( HAND-EMPTY ) ( not ( = ?auto_14171 ?auto_14172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14171 ?auto_14172 )
      ( !PUTDOWN ?auto_14171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14178 - BLOCK
      ?auto_14179 - BLOCK
    )
    :vars
    (
      ?auto_14180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14178 ) ( ON ?auto_14179 ?auto_14180 ) ( CLEAR ?auto_14179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14178 ) ( not ( = ?auto_14178 ?auto_14179 ) ) ( not ( = ?auto_14178 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14179 ?auto_14180 )
      ( !STACK ?auto_14179 ?auto_14178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14188 - BLOCK
      ?auto_14189 - BLOCK
    )
    :vars
    (
      ?auto_14190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14189 ?auto_14190 ) ( not ( = ?auto_14188 ?auto_14189 ) ) ( not ( = ?auto_14188 ?auto_14190 ) ) ( not ( = ?auto_14189 ?auto_14190 ) ) ( ON ?auto_14188 ?auto_14189 ) ( CLEAR ?auto_14188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14188 )
      ( MAKE-2PILE ?auto_14188 ?auto_14189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14199 - BLOCK
      ?auto_14200 - BLOCK
      ?auto_14201 - BLOCK
    )
    :vars
    (
      ?auto_14202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14200 ) ( ON ?auto_14201 ?auto_14202 ) ( CLEAR ?auto_14201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14199 ) ( ON ?auto_14200 ?auto_14199 ) ( not ( = ?auto_14199 ?auto_14200 ) ) ( not ( = ?auto_14199 ?auto_14201 ) ) ( not ( = ?auto_14199 ?auto_14202 ) ) ( not ( = ?auto_14200 ?auto_14201 ) ) ( not ( = ?auto_14200 ?auto_14202 ) ) ( not ( = ?auto_14201 ?auto_14202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14201 ?auto_14202 )
      ( !STACK ?auto_14201 ?auto_14200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14213 - BLOCK
      ?auto_14214 - BLOCK
      ?auto_14215 - BLOCK
    )
    :vars
    (
      ?auto_14216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14215 ?auto_14216 ) ( ON-TABLE ?auto_14213 ) ( not ( = ?auto_14213 ?auto_14214 ) ) ( not ( = ?auto_14213 ?auto_14215 ) ) ( not ( = ?auto_14213 ?auto_14216 ) ) ( not ( = ?auto_14214 ?auto_14215 ) ) ( not ( = ?auto_14214 ?auto_14216 ) ) ( not ( = ?auto_14215 ?auto_14216 ) ) ( CLEAR ?auto_14213 ) ( ON ?auto_14214 ?auto_14215 ) ( CLEAR ?auto_14214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14213 ?auto_14214 )
      ( MAKE-3PILE ?auto_14213 ?auto_14214 ?auto_14215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14227 - BLOCK
      ?auto_14228 - BLOCK
      ?auto_14229 - BLOCK
    )
    :vars
    (
      ?auto_14230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14229 ?auto_14230 ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( not ( = ?auto_14227 ?auto_14229 ) ) ( not ( = ?auto_14227 ?auto_14230 ) ) ( not ( = ?auto_14228 ?auto_14229 ) ) ( not ( = ?auto_14228 ?auto_14230 ) ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( ON ?auto_14228 ?auto_14229 ) ( ON ?auto_14227 ?auto_14228 ) ( CLEAR ?auto_14227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14227 )
      ( MAKE-3PILE ?auto_14227 ?auto_14228 ?auto_14229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14242 - BLOCK
      ?auto_14243 - BLOCK
      ?auto_14244 - BLOCK
      ?auto_14245 - BLOCK
    )
    :vars
    (
      ?auto_14246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14244 ) ( ON ?auto_14245 ?auto_14246 ) ( CLEAR ?auto_14245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14242 ) ( ON ?auto_14243 ?auto_14242 ) ( ON ?auto_14244 ?auto_14243 ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14245 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14245 ) ) ( not ( = ?auto_14243 ?auto_14246 ) ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( not ( = ?auto_14245 ?auto_14246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14245 ?auto_14246 )
      ( !STACK ?auto_14245 ?auto_14244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14260 - BLOCK
      ?auto_14261 - BLOCK
      ?auto_14262 - BLOCK
      ?auto_14263 - BLOCK
    )
    :vars
    (
      ?auto_14264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14263 ?auto_14264 ) ( ON-TABLE ?auto_14260 ) ( ON ?auto_14261 ?auto_14260 ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( not ( = ?auto_14260 ?auto_14263 ) ) ( not ( = ?auto_14260 ?auto_14264 ) ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14263 ) ) ( not ( = ?auto_14261 ?auto_14264 ) ) ( not ( = ?auto_14262 ?auto_14263 ) ) ( not ( = ?auto_14262 ?auto_14264 ) ) ( not ( = ?auto_14263 ?auto_14264 ) ) ( CLEAR ?auto_14261 ) ( ON ?auto_14262 ?auto_14263 ) ( CLEAR ?auto_14262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14260 ?auto_14261 ?auto_14262 )
      ( MAKE-4PILE ?auto_14260 ?auto_14261 ?auto_14262 ?auto_14263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14278 - BLOCK
      ?auto_14279 - BLOCK
      ?auto_14280 - BLOCK
      ?auto_14281 - BLOCK
    )
    :vars
    (
      ?auto_14282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14281 ?auto_14282 ) ( ON-TABLE ?auto_14278 ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14281 ) ) ( not ( = ?auto_14278 ?auto_14282 ) ) ( not ( = ?auto_14279 ?auto_14280 ) ) ( not ( = ?auto_14279 ?auto_14281 ) ) ( not ( = ?auto_14279 ?auto_14282 ) ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( ON ?auto_14280 ?auto_14281 ) ( CLEAR ?auto_14278 ) ( ON ?auto_14279 ?auto_14280 ) ( CLEAR ?auto_14279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14278 ?auto_14279 )
      ( MAKE-4PILE ?auto_14278 ?auto_14279 ?auto_14280 ?auto_14281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14296 - BLOCK
      ?auto_14297 - BLOCK
      ?auto_14298 - BLOCK
      ?auto_14299 - BLOCK
    )
    :vars
    (
      ?auto_14300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14299 ?auto_14300 ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14296 ?auto_14298 ) ) ( not ( = ?auto_14296 ?auto_14299 ) ) ( not ( = ?auto_14296 ?auto_14300 ) ) ( not ( = ?auto_14297 ?auto_14298 ) ) ( not ( = ?auto_14297 ?auto_14299 ) ) ( not ( = ?auto_14297 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( ON ?auto_14298 ?auto_14299 ) ( ON ?auto_14297 ?auto_14298 ) ( ON ?auto_14296 ?auto_14297 ) ( CLEAR ?auto_14296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14296 )
      ( MAKE-4PILE ?auto_14296 ?auto_14297 ?auto_14298 ?auto_14299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14315 - BLOCK
      ?auto_14316 - BLOCK
      ?auto_14317 - BLOCK
      ?auto_14318 - BLOCK
      ?auto_14319 - BLOCK
    )
    :vars
    (
      ?auto_14320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14318 ) ( ON ?auto_14319 ?auto_14320 ) ( CLEAR ?auto_14319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14315 ) ( ON ?auto_14316 ?auto_14315 ) ( ON ?auto_14317 ?auto_14316 ) ( ON ?auto_14318 ?auto_14317 ) ( not ( = ?auto_14315 ?auto_14316 ) ) ( not ( = ?auto_14315 ?auto_14317 ) ) ( not ( = ?auto_14315 ?auto_14318 ) ) ( not ( = ?auto_14315 ?auto_14319 ) ) ( not ( = ?auto_14315 ?auto_14320 ) ) ( not ( = ?auto_14316 ?auto_14317 ) ) ( not ( = ?auto_14316 ?auto_14318 ) ) ( not ( = ?auto_14316 ?auto_14319 ) ) ( not ( = ?auto_14316 ?auto_14320 ) ) ( not ( = ?auto_14317 ?auto_14318 ) ) ( not ( = ?auto_14317 ?auto_14319 ) ) ( not ( = ?auto_14317 ?auto_14320 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14320 ) ) ( not ( = ?auto_14319 ?auto_14320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14319 ?auto_14320 )
      ( !STACK ?auto_14319 ?auto_14318 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14337 - BLOCK
      ?auto_14338 - BLOCK
      ?auto_14339 - BLOCK
      ?auto_14340 - BLOCK
      ?auto_14341 - BLOCK
    )
    :vars
    (
      ?auto_14342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14341 ?auto_14342 ) ( ON-TABLE ?auto_14337 ) ( ON ?auto_14338 ?auto_14337 ) ( ON ?auto_14339 ?auto_14338 ) ( not ( = ?auto_14337 ?auto_14338 ) ) ( not ( = ?auto_14337 ?auto_14339 ) ) ( not ( = ?auto_14337 ?auto_14340 ) ) ( not ( = ?auto_14337 ?auto_14341 ) ) ( not ( = ?auto_14337 ?auto_14342 ) ) ( not ( = ?auto_14338 ?auto_14339 ) ) ( not ( = ?auto_14338 ?auto_14340 ) ) ( not ( = ?auto_14338 ?auto_14341 ) ) ( not ( = ?auto_14338 ?auto_14342 ) ) ( not ( = ?auto_14339 ?auto_14340 ) ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14342 ) ) ( not ( = ?auto_14340 ?auto_14341 ) ) ( not ( = ?auto_14340 ?auto_14342 ) ) ( not ( = ?auto_14341 ?auto_14342 ) ) ( CLEAR ?auto_14339 ) ( ON ?auto_14340 ?auto_14341 ) ( CLEAR ?auto_14340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14337 ?auto_14338 ?auto_14339 ?auto_14340 )
      ( MAKE-5PILE ?auto_14337 ?auto_14338 ?auto_14339 ?auto_14340 ?auto_14341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14359 - BLOCK
      ?auto_14360 - BLOCK
      ?auto_14361 - BLOCK
      ?auto_14362 - BLOCK
      ?auto_14363 - BLOCK
    )
    :vars
    (
      ?auto_14364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14363 ?auto_14364 ) ( ON-TABLE ?auto_14359 ) ( ON ?auto_14360 ?auto_14359 ) ( not ( = ?auto_14359 ?auto_14360 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14362 ) ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14359 ?auto_14364 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14364 ) ) ( not ( = ?auto_14361 ?auto_14362 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( not ( = ?auto_14361 ?auto_14364 ) ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( not ( = ?auto_14362 ?auto_14364 ) ) ( not ( = ?auto_14363 ?auto_14364 ) ) ( ON ?auto_14362 ?auto_14363 ) ( CLEAR ?auto_14360 ) ( ON ?auto_14361 ?auto_14362 ) ( CLEAR ?auto_14361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14359 ?auto_14360 ?auto_14361 )
      ( MAKE-5PILE ?auto_14359 ?auto_14360 ?auto_14361 ?auto_14362 ?auto_14363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14381 - BLOCK
      ?auto_14382 - BLOCK
      ?auto_14383 - BLOCK
      ?auto_14384 - BLOCK
      ?auto_14385 - BLOCK
    )
    :vars
    (
      ?auto_14386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14385 ?auto_14386 ) ( ON-TABLE ?auto_14381 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14384 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14382 ?auto_14384 ) ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14386 ) ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14385 ) ) ( not ( = ?auto_14383 ?auto_14386 ) ) ( not ( = ?auto_14384 ?auto_14385 ) ) ( not ( = ?auto_14384 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( ON ?auto_14384 ?auto_14385 ) ( ON ?auto_14383 ?auto_14384 ) ( CLEAR ?auto_14381 ) ( ON ?auto_14382 ?auto_14383 ) ( CLEAR ?auto_14382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14381 ?auto_14382 )
      ( MAKE-5PILE ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ?auto_14385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14403 - BLOCK
      ?auto_14404 - BLOCK
      ?auto_14405 - BLOCK
      ?auto_14406 - BLOCK
      ?auto_14407 - BLOCK
    )
    :vars
    (
      ?auto_14408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14407 ?auto_14408 ) ( not ( = ?auto_14403 ?auto_14404 ) ) ( not ( = ?auto_14403 ?auto_14405 ) ) ( not ( = ?auto_14403 ?auto_14406 ) ) ( not ( = ?auto_14403 ?auto_14407 ) ) ( not ( = ?auto_14403 ?auto_14408 ) ) ( not ( = ?auto_14404 ?auto_14405 ) ) ( not ( = ?auto_14404 ?auto_14406 ) ) ( not ( = ?auto_14404 ?auto_14407 ) ) ( not ( = ?auto_14404 ?auto_14408 ) ) ( not ( = ?auto_14405 ?auto_14406 ) ) ( not ( = ?auto_14405 ?auto_14407 ) ) ( not ( = ?auto_14405 ?auto_14408 ) ) ( not ( = ?auto_14406 ?auto_14407 ) ) ( not ( = ?auto_14406 ?auto_14408 ) ) ( not ( = ?auto_14407 ?auto_14408 ) ) ( ON ?auto_14406 ?auto_14407 ) ( ON ?auto_14405 ?auto_14406 ) ( ON ?auto_14404 ?auto_14405 ) ( ON ?auto_14403 ?auto_14404 ) ( CLEAR ?auto_14403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14403 )
      ( MAKE-5PILE ?auto_14403 ?auto_14404 ?auto_14405 ?auto_14406 ?auto_14407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14426 - BLOCK
      ?auto_14427 - BLOCK
      ?auto_14428 - BLOCK
      ?auto_14429 - BLOCK
      ?auto_14430 - BLOCK
      ?auto_14431 - BLOCK
    )
    :vars
    (
      ?auto_14432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14430 ) ( ON ?auto_14431 ?auto_14432 ) ( CLEAR ?auto_14431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14426 ) ( ON ?auto_14427 ?auto_14426 ) ( ON ?auto_14428 ?auto_14427 ) ( ON ?auto_14429 ?auto_14428 ) ( ON ?auto_14430 ?auto_14429 ) ( not ( = ?auto_14426 ?auto_14427 ) ) ( not ( = ?auto_14426 ?auto_14428 ) ) ( not ( = ?auto_14426 ?auto_14429 ) ) ( not ( = ?auto_14426 ?auto_14430 ) ) ( not ( = ?auto_14426 ?auto_14431 ) ) ( not ( = ?auto_14426 ?auto_14432 ) ) ( not ( = ?auto_14427 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14429 ) ) ( not ( = ?auto_14427 ?auto_14430 ) ) ( not ( = ?auto_14427 ?auto_14431 ) ) ( not ( = ?auto_14427 ?auto_14432 ) ) ( not ( = ?auto_14428 ?auto_14429 ) ) ( not ( = ?auto_14428 ?auto_14430 ) ) ( not ( = ?auto_14428 ?auto_14431 ) ) ( not ( = ?auto_14428 ?auto_14432 ) ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14429 ?auto_14432 ) ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14431 ?auto_14432 )
      ( !STACK ?auto_14431 ?auto_14430 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14439 - BLOCK
      ?auto_14440 - BLOCK
      ?auto_14441 - BLOCK
      ?auto_14442 - BLOCK
      ?auto_14443 - BLOCK
      ?auto_14444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14443 ) ( ON-TABLE ?auto_14444 ) ( CLEAR ?auto_14444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14439 ) ( ON ?auto_14440 ?auto_14439 ) ( ON ?auto_14441 ?auto_14440 ) ( ON ?auto_14442 ?auto_14441 ) ( ON ?auto_14443 ?auto_14442 ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14442 ) ) ( not ( = ?auto_14439 ?auto_14443 ) ) ( not ( = ?auto_14439 ?auto_14444 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14443 ) ) ( not ( = ?auto_14440 ?auto_14444 ) ) ( not ( = ?auto_14441 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14443 ) ) ( not ( = ?auto_14441 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14443 ?auto_14444 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_14444 )
      ( !STACK ?auto_14444 ?auto_14443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14451 - BLOCK
      ?auto_14452 - BLOCK
      ?auto_14453 - BLOCK
      ?auto_14454 - BLOCK
      ?auto_14455 - BLOCK
      ?auto_14456 - BLOCK
    )
    :vars
    (
      ?auto_14457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14456 ?auto_14457 ) ( ON-TABLE ?auto_14451 ) ( ON ?auto_14452 ?auto_14451 ) ( ON ?auto_14453 ?auto_14452 ) ( ON ?auto_14454 ?auto_14453 ) ( not ( = ?auto_14451 ?auto_14452 ) ) ( not ( = ?auto_14451 ?auto_14453 ) ) ( not ( = ?auto_14451 ?auto_14454 ) ) ( not ( = ?auto_14451 ?auto_14455 ) ) ( not ( = ?auto_14451 ?auto_14456 ) ) ( not ( = ?auto_14451 ?auto_14457 ) ) ( not ( = ?auto_14452 ?auto_14453 ) ) ( not ( = ?auto_14452 ?auto_14454 ) ) ( not ( = ?auto_14452 ?auto_14455 ) ) ( not ( = ?auto_14452 ?auto_14456 ) ) ( not ( = ?auto_14452 ?auto_14457 ) ) ( not ( = ?auto_14453 ?auto_14454 ) ) ( not ( = ?auto_14453 ?auto_14455 ) ) ( not ( = ?auto_14453 ?auto_14456 ) ) ( not ( = ?auto_14453 ?auto_14457 ) ) ( not ( = ?auto_14454 ?auto_14455 ) ) ( not ( = ?auto_14454 ?auto_14456 ) ) ( not ( = ?auto_14454 ?auto_14457 ) ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14457 ) ) ( not ( = ?auto_14456 ?auto_14457 ) ) ( CLEAR ?auto_14454 ) ( ON ?auto_14455 ?auto_14456 ) ( CLEAR ?auto_14455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14451 ?auto_14452 ?auto_14453 ?auto_14454 ?auto_14455 )
      ( MAKE-6PILE ?auto_14451 ?auto_14452 ?auto_14453 ?auto_14454 ?auto_14455 ?auto_14456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14464 - BLOCK
      ?auto_14465 - BLOCK
      ?auto_14466 - BLOCK
      ?auto_14467 - BLOCK
      ?auto_14468 - BLOCK
      ?auto_14469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14469 ) ( ON-TABLE ?auto_14464 ) ( ON ?auto_14465 ?auto_14464 ) ( ON ?auto_14466 ?auto_14465 ) ( ON ?auto_14467 ?auto_14466 ) ( not ( = ?auto_14464 ?auto_14465 ) ) ( not ( = ?auto_14464 ?auto_14466 ) ) ( not ( = ?auto_14464 ?auto_14467 ) ) ( not ( = ?auto_14464 ?auto_14468 ) ) ( not ( = ?auto_14464 ?auto_14469 ) ) ( not ( = ?auto_14465 ?auto_14466 ) ) ( not ( = ?auto_14465 ?auto_14467 ) ) ( not ( = ?auto_14465 ?auto_14468 ) ) ( not ( = ?auto_14465 ?auto_14469 ) ) ( not ( = ?auto_14466 ?auto_14467 ) ) ( not ( = ?auto_14466 ?auto_14468 ) ) ( not ( = ?auto_14466 ?auto_14469 ) ) ( not ( = ?auto_14467 ?auto_14468 ) ) ( not ( = ?auto_14467 ?auto_14469 ) ) ( not ( = ?auto_14468 ?auto_14469 ) ) ( CLEAR ?auto_14467 ) ( ON ?auto_14468 ?auto_14469 ) ( CLEAR ?auto_14468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14464 ?auto_14465 ?auto_14466 ?auto_14467 ?auto_14468 )
      ( MAKE-6PILE ?auto_14464 ?auto_14465 ?auto_14466 ?auto_14467 ?auto_14468 ?auto_14469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14476 - BLOCK
      ?auto_14477 - BLOCK
      ?auto_14478 - BLOCK
      ?auto_14479 - BLOCK
      ?auto_14480 - BLOCK
      ?auto_14481 - BLOCK
    )
    :vars
    (
      ?auto_14482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14481 ?auto_14482 ) ( ON-TABLE ?auto_14476 ) ( ON ?auto_14477 ?auto_14476 ) ( ON ?auto_14478 ?auto_14477 ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14479 ) ) ( not ( = ?auto_14476 ?auto_14480 ) ) ( not ( = ?auto_14476 ?auto_14481 ) ) ( not ( = ?auto_14476 ?auto_14482 ) ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( not ( = ?auto_14477 ?auto_14479 ) ) ( not ( = ?auto_14477 ?auto_14480 ) ) ( not ( = ?auto_14477 ?auto_14481 ) ) ( not ( = ?auto_14477 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14479 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( not ( = ?auto_14478 ?auto_14481 ) ) ( not ( = ?auto_14478 ?auto_14482 ) ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( ON ?auto_14480 ?auto_14481 ) ( CLEAR ?auto_14478 ) ( ON ?auto_14479 ?auto_14480 ) ( CLEAR ?auto_14479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14479 )
      ( MAKE-6PILE ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14489 - BLOCK
      ?auto_14490 - BLOCK
      ?auto_14491 - BLOCK
      ?auto_14492 - BLOCK
      ?auto_14493 - BLOCK
      ?auto_14494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14494 ) ( ON-TABLE ?auto_14489 ) ( ON ?auto_14490 ?auto_14489 ) ( ON ?auto_14491 ?auto_14490 ) ( not ( = ?auto_14489 ?auto_14490 ) ) ( not ( = ?auto_14489 ?auto_14491 ) ) ( not ( = ?auto_14489 ?auto_14492 ) ) ( not ( = ?auto_14489 ?auto_14493 ) ) ( not ( = ?auto_14489 ?auto_14494 ) ) ( not ( = ?auto_14490 ?auto_14491 ) ) ( not ( = ?auto_14490 ?auto_14492 ) ) ( not ( = ?auto_14490 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14494 ) ) ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( not ( = ?auto_14491 ?auto_14494 ) ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( not ( = ?auto_14492 ?auto_14494 ) ) ( not ( = ?auto_14493 ?auto_14494 ) ) ( ON ?auto_14493 ?auto_14494 ) ( CLEAR ?auto_14491 ) ( ON ?auto_14492 ?auto_14493 ) ( CLEAR ?auto_14492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14489 ?auto_14490 ?auto_14491 ?auto_14492 )
      ( MAKE-6PILE ?auto_14489 ?auto_14490 ?auto_14491 ?auto_14492 ?auto_14493 ?auto_14494 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14501 - BLOCK
      ?auto_14502 - BLOCK
      ?auto_14503 - BLOCK
      ?auto_14504 - BLOCK
      ?auto_14505 - BLOCK
      ?auto_14506 - BLOCK
    )
    :vars
    (
      ?auto_14507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14506 ?auto_14507 ) ( ON-TABLE ?auto_14501 ) ( ON ?auto_14502 ?auto_14501 ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( not ( = ?auto_14501 ?auto_14503 ) ) ( not ( = ?auto_14501 ?auto_14504 ) ) ( not ( = ?auto_14501 ?auto_14505 ) ) ( not ( = ?auto_14501 ?auto_14506 ) ) ( not ( = ?auto_14501 ?auto_14507 ) ) ( not ( = ?auto_14502 ?auto_14503 ) ) ( not ( = ?auto_14502 ?auto_14504 ) ) ( not ( = ?auto_14502 ?auto_14505 ) ) ( not ( = ?auto_14502 ?auto_14506 ) ) ( not ( = ?auto_14502 ?auto_14507 ) ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14505 ) ) ( not ( = ?auto_14503 ?auto_14506 ) ) ( not ( = ?auto_14503 ?auto_14507 ) ) ( not ( = ?auto_14504 ?auto_14505 ) ) ( not ( = ?auto_14504 ?auto_14506 ) ) ( not ( = ?auto_14504 ?auto_14507 ) ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14507 ) ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( ON ?auto_14505 ?auto_14506 ) ( ON ?auto_14504 ?auto_14505 ) ( CLEAR ?auto_14502 ) ( ON ?auto_14503 ?auto_14504 ) ( CLEAR ?auto_14503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14501 ?auto_14502 ?auto_14503 )
      ( MAKE-6PILE ?auto_14501 ?auto_14502 ?auto_14503 ?auto_14504 ?auto_14505 ?auto_14506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14514 - BLOCK
      ?auto_14515 - BLOCK
      ?auto_14516 - BLOCK
      ?auto_14517 - BLOCK
      ?auto_14518 - BLOCK
      ?auto_14519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14519 ) ( ON-TABLE ?auto_14514 ) ( ON ?auto_14515 ?auto_14514 ) ( not ( = ?auto_14514 ?auto_14515 ) ) ( not ( = ?auto_14514 ?auto_14516 ) ) ( not ( = ?auto_14514 ?auto_14517 ) ) ( not ( = ?auto_14514 ?auto_14518 ) ) ( not ( = ?auto_14514 ?auto_14519 ) ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14517 ) ) ( not ( = ?auto_14515 ?auto_14518 ) ) ( not ( = ?auto_14515 ?auto_14519 ) ) ( not ( = ?auto_14516 ?auto_14517 ) ) ( not ( = ?auto_14516 ?auto_14518 ) ) ( not ( = ?auto_14516 ?auto_14519 ) ) ( not ( = ?auto_14517 ?auto_14518 ) ) ( not ( = ?auto_14517 ?auto_14519 ) ) ( not ( = ?auto_14518 ?auto_14519 ) ) ( ON ?auto_14518 ?auto_14519 ) ( ON ?auto_14517 ?auto_14518 ) ( CLEAR ?auto_14515 ) ( ON ?auto_14516 ?auto_14517 ) ( CLEAR ?auto_14516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14514 ?auto_14515 ?auto_14516 )
      ( MAKE-6PILE ?auto_14514 ?auto_14515 ?auto_14516 ?auto_14517 ?auto_14518 ?auto_14519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14526 - BLOCK
      ?auto_14527 - BLOCK
      ?auto_14528 - BLOCK
      ?auto_14529 - BLOCK
      ?auto_14530 - BLOCK
      ?auto_14531 - BLOCK
    )
    :vars
    (
      ?auto_14532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14531 ?auto_14532 ) ( ON-TABLE ?auto_14526 ) ( not ( = ?auto_14526 ?auto_14527 ) ) ( not ( = ?auto_14526 ?auto_14528 ) ) ( not ( = ?auto_14526 ?auto_14529 ) ) ( not ( = ?auto_14526 ?auto_14530 ) ) ( not ( = ?auto_14526 ?auto_14531 ) ) ( not ( = ?auto_14526 ?auto_14532 ) ) ( not ( = ?auto_14527 ?auto_14528 ) ) ( not ( = ?auto_14527 ?auto_14529 ) ) ( not ( = ?auto_14527 ?auto_14530 ) ) ( not ( = ?auto_14527 ?auto_14531 ) ) ( not ( = ?auto_14527 ?auto_14532 ) ) ( not ( = ?auto_14528 ?auto_14529 ) ) ( not ( = ?auto_14528 ?auto_14530 ) ) ( not ( = ?auto_14528 ?auto_14531 ) ) ( not ( = ?auto_14528 ?auto_14532 ) ) ( not ( = ?auto_14529 ?auto_14530 ) ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14532 ) ) ( not ( = ?auto_14530 ?auto_14531 ) ) ( not ( = ?auto_14530 ?auto_14532 ) ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( ON ?auto_14530 ?auto_14531 ) ( ON ?auto_14529 ?auto_14530 ) ( ON ?auto_14528 ?auto_14529 ) ( CLEAR ?auto_14526 ) ( ON ?auto_14527 ?auto_14528 ) ( CLEAR ?auto_14527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14526 ?auto_14527 )
      ( MAKE-6PILE ?auto_14526 ?auto_14527 ?auto_14528 ?auto_14529 ?auto_14530 ?auto_14531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14539 - BLOCK
      ?auto_14540 - BLOCK
      ?auto_14541 - BLOCK
      ?auto_14542 - BLOCK
      ?auto_14543 - BLOCK
      ?auto_14544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14544 ) ( ON-TABLE ?auto_14539 ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14539 ?auto_14544 ) ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14543 ) ) ( not ( = ?auto_14540 ?auto_14544 ) ) ( not ( = ?auto_14541 ?auto_14542 ) ) ( not ( = ?auto_14541 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14544 ) ) ( not ( = ?auto_14542 ?auto_14543 ) ) ( not ( = ?auto_14542 ?auto_14544 ) ) ( not ( = ?auto_14543 ?auto_14544 ) ) ( ON ?auto_14543 ?auto_14544 ) ( ON ?auto_14542 ?auto_14543 ) ( ON ?auto_14541 ?auto_14542 ) ( CLEAR ?auto_14539 ) ( ON ?auto_14540 ?auto_14541 ) ( CLEAR ?auto_14540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14539 ?auto_14540 )
      ( MAKE-6PILE ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14542 ?auto_14543 ?auto_14544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14551 - BLOCK
      ?auto_14552 - BLOCK
      ?auto_14553 - BLOCK
      ?auto_14554 - BLOCK
      ?auto_14555 - BLOCK
      ?auto_14556 - BLOCK
    )
    :vars
    (
      ?auto_14557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14556 ?auto_14557 ) ( not ( = ?auto_14551 ?auto_14552 ) ) ( not ( = ?auto_14551 ?auto_14553 ) ) ( not ( = ?auto_14551 ?auto_14554 ) ) ( not ( = ?auto_14551 ?auto_14555 ) ) ( not ( = ?auto_14551 ?auto_14556 ) ) ( not ( = ?auto_14551 ?auto_14557 ) ) ( not ( = ?auto_14552 ?auto_14553 ) ) ( not ( = ?auto_14552 ?auto_14554 ) ) ( not ( = ?auto_14552 ?auto_14555 ) ) ( not ( = ?auto_14552 ?auto_14556 ) ) ( not ( = ?auto_14552 ?auto_14557 ) ) ( not ( = ?auto_14553 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14556 ) ) ( not ( = ?auto_14553 ?auto_14557 ) ) ( not ( = ?auto_14554 ?auto_14555 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( not ( = ?auto_14554 ?auto_14557 ) ) ( not ( = ?auto_14555 ?auto_14556 ) ) ( not ( = ?auto_14555 ?auto_14557 ) ) ( not ( = ?auto_14556 ?auto_14557 ) ) ( ON ?auto_14555 ?auto_14556 ) ( ON ?auto_14554 ?auto_14555 ) ( ON ?auto_14553 ?auto_14554 ) ( ON ?auto_14552 ?auto_14553 ) ( ON ?auto_14551 ?auto_14552 ) ( CLEAR ?auto_14551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14551 )
      ( MAKE-6PILE ?auto_14551 ?auto_14552 ?auto_14553 ?auto_14554 ?auto_14555 ?auto_14556 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14564 - BLOCK
      ?auto_14565 - BLOCK
      ?auto_14566 - BLOCK
      ?auto_14567 - BLOCK
      ?auto_14568 - BLOCK
      ?auto_14569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14569 ) ( not ( = ?auto_14564 ?auto_14565 ) ) ( not ( = ?auto_14564 ?auto_14566 ) ) ( not ( = ?auto_14564 ?auto_14567 ) ) ( not ( = ?auto_14564 ?auto_14568 ) ) ( not ( = ?auto_14564 ?auto_14569 ) ) ( not ( = ?auto_14565 ?auto_14566 ) ) ( not ( = ?auto_14565 ?auto_14567 ) ) ( not ( = ?auto_14565 ?auto_14568 ) ) ( not ( = ?auto_14565 ?auto_14569 ) ) ( not ( = ?auto_14566 ?auto_14567 ) ) ( not ( = ?auto_14566 ?auto_14568 ) ) ( not ( = ?auto_14566 ?auto_14569 ) ) ( not ( = ?auto_14567 ?auto_14568 ) ) ( not ( = ?auto_14567 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( ON ?auto_14568 ?auto_14569 ) ( ON ?auto_14567 ?auto_14568 ) ( ON ?auto_14566 ?auto_14567 ) ( ON ?auto_14565 ?auto_14566 ) ( ON ?auto_14564 ?auto_14565 ) ( CLEAR ?auto_14564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14564 )
      ( MAKE-6PILE ?auto_14564 ?auto_14565 ?auto_14566 ?auto_14567 ?auto_14568 ?auto_14569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14576 - BLOCK
      ?auto_14577 - BLOCK
      ?auto_14578 - BLOCK
      ?auto_14579 - BLOCK
      ?auto_14580 - BLOCK
      ?auto_14581 - BLOCK
    )
    :vars
    (
      ?auto_14582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14576 ?auto_14577 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14579 ) ) ( not ( = ?auto_14576 ?auto_14580 ) ) ( not ( = ?auto_14576 ?auto_14581 ) ) ( not ( = ?auto_14577 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14577 ?auto_14581 ) ) ( not ( = ?auto_14578 ?auto_14579 ) ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( ON ?auto_14576 ?auto_14582 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( not ( = ?auto_14578 ?auto_14582 ) ) ( not ( = ?auto_14577 ?auto_14582 ) ) ( not ( = ?auto_14576 ?auto_14582 ) ) ( ON ?auto_14577 ?auto_14576 ) ( ON ?auto_14578 ?auto_14577 ) ( ON ?auto_14579 ?auto_14578 ) ( ON ?auto_14580 ?auto_14579 ) ( ON ?auto_14581 ?auto_14580 ) ( CLEAR ?auto_14581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_14581 ?auto_14580 ?auto_14579 ?auto_14578 ?auto_14577 ?auto_14576 )
      ( MAKE-6PILE ?auto_14576 ?auto_14577 ?auto_14578 ?auto_14579 ?auto_14580 ?auto_14581 ) )
  )

)

