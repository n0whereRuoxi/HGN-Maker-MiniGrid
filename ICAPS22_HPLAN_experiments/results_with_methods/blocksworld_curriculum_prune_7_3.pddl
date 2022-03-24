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
      ?auto_20173 - BLOCK
    )
    :vars
    (
      ?auto_20174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20173 ?auto_20174 ) ( CLEAR ?auto_20173 ) ( HAND-EMPTY ) ( not ( = ?auto_20173 ?auto_20174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20173 ?auto_20174 )
      ( !PUTDOWN ?auto_20173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20180 - BLOCK
      ?auto_20181 - BLOCK
    )
    :vars
    (
      ?auto_20182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20180 ) ( ON ?auto_20181 ?auto_20182 ) ( CLEAR ?auto_20181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20180 ) ( not ( = ?auto_20180 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20181 ?auto_20182 )
      ( !STACK ?auto_20181 ?auto_20180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20190 - BLOCK
      ?auto_20191 - BLOCK
    )
    :vars
    (
      ?auto_20192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20191 ?auto_20192 ) ( not ( = ?auto_20190 ?auto_20191 ) ) ( not ( = ?auto_20190 ?auto_20192 ) ) ( not ( = ?auto_20191 ?auto_20192 ) ) ( ON ?auto_20190 ?auto_20191 ) ( CLEAR ?auto_20190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20190 )
      ( MAKE-2PILE ?auto_20190 ?auto_20191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20201 - BLOCK
      ?auto_20202 - BLOCK
      ?auto_20203 - BLOCK
    )
    :vars
    (
      ?auto_20204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20202 ) ( ON ?auto_20203 ?auto_20204 ) ( CLEAR ?auto_20203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20201 ) ( ON ?auto_20202 ?auto_20201 ) ( not ( = ?auto_20201 ?auto_20202 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20201 ?auto_20204 ) ) ( not ( = ?auto_20202 ?auto_20203 ) ) ( not ( = ?auto_20202 ?auto_20204 ) ) ( not ( = ?auto_20203 ?auto_20204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20203 ?auto_20204 )
      ( !STACK ?auto_20203 ?auto_20202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20215 - BLOCK
      ?auto_20216 - BLOCK
      ?auto_20217 - BLOCK
    )
    :vars
    (
      ?auto_20218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20217 ?auto_20218 ) ( ON-TABLE ?auto_20215 ) ( not ( = ?auto_20215 ?auto_20216 ) ) ( not ( = ?auto_20215 ?auto_20217 ) ) ( not ( = ?auto_20215 ?auto_20218 ) ) ( not ( = ?auto_20216 ?auto_20217 ) ) ( not ( = ?auto_20216 ?auto_20218 ) ) ( not ( = ?auto_20217 ?auto_20218 ) ) ( CLEAR ?auto_20215 ) ( ON ?auto_20216 ?auto_20217 ) ( CLEAR ?auto_20216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20215 ?auto_20216 )
      ( MAKE-3PILE ?auto_20215 ?auto_20216 ?auto_20217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20229 - BLOCK
      ?auto_20230 - BLOCK
      ?auto_20231 - BLOCK
    )
    :vars
    (
      ?auto_20232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20231 ?auto_20232 ) ( not ( = ?auto_20229 ?auto_20230 ) ) ( not ( = ?auto_20229 ?auto_20231 ) ) ( not ( = ?auto_20229 ?auto_20232 ) ) ( not ( = ?auto_20230 ?auto_20231 ) ) ( not ( = ?auto_20230 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( ON ?auto_20230 ?auto_20231 ) ( ON ?auto_20229 ?auto_20230 ) ( CLEAR ?auto_20229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20229 )
      ( MAKE-3PILE ?auto_20229 ?auto_20230 ?auto_20231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20244 - BLOCK
      ?auto_20245 - BLOCK
      ?auto_20246 - BLOCK
      ?auto_20247 - BLOCK
    )
    :vars
    (
      ?auto_20248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20246 ) ( ON ?auto_20247 ?auto_20248 ) ( CLEAR ?auto_20247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20244 ) ( ON ?auto_20245 ?auto_20244 ) ( ON ?auto_20246 ?auto_20245 ) ( not ( = ?auto_20244 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20246 ) ) ( not ( = ?auto_20244 ?auto_20247 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20245 ?auto_20246 ) ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( not ( = ?auto_20245 ?auto_20248 ) ) ( not ( = ?auto_20246 ?auto_20247 ) ) ( not ( = ?auto_20246 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20247 ?auto_20248 )
      ( !STACK ?auto_20247 ?auto_20246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20262 - BLOCK
      ?auto_20263 - BLOCK
      ?auto_20264 - BLOCK
      ?auto_20265 - BLOCK
    )
    :vars
    (
      ?auto_20266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20265 ?auto_20266 ) ( ON-TABLE ?auto_20262 ) ( ON ?auto_20263 ?auto_20262 ) ( not ( = ?auto_20262 ?auto_20263 ) ) ( not ( = ?auto_20262 ?auto_20264 ) ) ( not ( = ?auto_20262 ?auto_20265 ) ) ( not ( = ?auto_20262 ?auto_20266 ) ) ( not ( = ?auto_20263 ?auto_20264 ) ) ( not ( = ?auto_20263 ?auto_20265 ) ) ( not ( = ?auto_20263 ?auto_20266 ) ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20266 ) ) ( not ( = ?auto_20265 ?auto_20266 ) ) ( CLEAR ?auto_20263 ) ( ON ?auto_20264 ?auto_20265 ) ( CLEAR ?auto_20264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20262 ?auto_20263 ?auto_20264 )
      ( MAKE-4PILE ?auto_20262 ?auto_20263 ?auto_20264 ?auto_20265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20280 - BLOCK
      ?auto_20281 - BLOCK
      ?auto_20282 - BLOCK
      ?auto_20283 - BLOCK
    )
    :vars
    (
      ?auto_20284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20283 ?auto_20284 ) ( ON-TABLE ?auto_20280 ) ( not ( = ?auto_20280 ?auto_20281 ) ) ( not ( = ?auto_20280 ?auto_20282 ) ) ( not ( = ?auto_20280 ?auto_20283 ) ) ( not ( = ?auto_20280 ?auto_20284 ) ) ( not ( = ?auto_20281 ?auto_20282 ) ) ( not ( = ?auto_20281 ?auto_20283 ) ) ( not ( = ?auto_20281 ?auto_20284 ) ) ( not ( = ?auto_20282 ?auto_20283 ) ) ( not ( = ?auto_20282 ?auto_20284 ) ) ( not ( = ?auto_20283 ?auto_20284 ) ) ( ON ?auto_20282 ?auto_20283 ) ( CLEAR ?auto_20280 ) ( ON ?auto_20281 ?auto_20282 ) ( CLEAR ?auto_20281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20280 ?auto_20281 )
      ( MAKE-4PILE ?auto_20280 ?auto_20281 ?auto_20282 ?auto_20283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20298 - BLOCK
      ?auto_20299 - BLOCK
      ?auto_20300 - BLOCK
      ?auto_20301 - BLOCK
    )
    :vars
    (
      ?auto_20302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20301 ?auto_20302 ) ( not ( = ?auto_20298 ?auto_20299 ) ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( not ( = ?auto_20298 ?auto_20301 ) ) ( not ( = ?auto_20298 ?auto_20302 ) ) ( not ( = ?auto_20299 ?auto_20300 ) ) ( not ( = ?auto_20299 ?auto_20301 ) ) ( not ( = ?auto_20299 ?auto_20302 ) ) ( not ( = ?auto_20300 ?auto_20301 ) ) ( not ( = ?auto_20300 ?auto_20302 ) ) ( not ( = ?auto_20301 ?auto_20302 ) ) ( ON ?auto_20300 ?auto_20301 ) ( ON ?auto_20299 ?auto_20300 ) ( ON ?auto_20298 ?auto_20299 ) ( CLEAR ?auto_20298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20298 )
      ( MAKE-4PILE ?auto_20298 ?auto_20299 ?auto_20300 ?auto_20301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20317 - BLOCK
      ?auto_20318 - BLOCK
      ?auto_20319 - BLOCK
      ?auto_20320 - BLOCK
      ?auto_20321 - BLOCK
    )
    :vars
    (
      ?auto_20322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20320 ) ( ON ?auto_20321 ?auto_20322 ) ( CLEAR ?auto_20321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20317 ) ( ON ?auto_20318 ?auto_20317 ) ( ON ?auto_20319 ?auto_20318 ) ( ON ?auto_20320 ?auto_20319 ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( not ( = ?auto_20317 ?auto_20319 ) ) ( not ( = ?auto_20317 ?auto_20320 ) ) ( not ( = ?auto_20317 ?auto_20321 ) ) ( not ( = ?auto_20317 ?auto_20322 ) ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20320 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20322 ) ) ( not ( = ?auto_20320 ?auto_20321 ) ) ( not ( = ?auto_20320 ?auto_20322 ) ) ( not ( = ?auto_20321 ?auto_20322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20321 ?auto_20322 )
      ( !STACK ?auto_20321 ?auto_20320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20339 - BLOCK
      ?auto_20340 - BLOCK
      ?auto_20341 - BLOCK
      ?auto_20342 - BLOCK
      ?auto_20343 - BLOCK
    )
    :vars
    (
      ?auto_20344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20343 ?auto_20344 ) ( ON-TABLE ?auto_20339 ) ( ON ?auto_20340 ?auto_20339 ) ( ON ?auto_20341 ?auto_20340 ) ( not ( = ?auto_20339 ?auto_20340 ) ) ( not ( = ?auto_20339 ?auto_20341 ) ) ( not ( = ?auto_20339 ?auto_20342 ) ) ( not ( = ?auto_20339 ?auto_20343 ) ) ( not ( = ?auto_20339 ?auto_20344 ) ) ( not ( = ?auto_20340 ?auto_20341 ) ) ( not ( = ?auto_20340 ?auto_20342 ) ) ( not ( = ?auto_20340 ?auto_20343 ) ) ( not ( = ?auto_20340 ?auto_20344 ) ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20341 ?auto_20343 ) ) ( not ( = ?auto_20341 ?auto_20344 ) ) ( not ( = ?auto_20342 ?auto_20343 ) ) ( not ( = ?auto_20342 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( CLEAR ?auto_20341 ) ( ON ?auto_20342 ?auto_20343 ) ( CLEAR ?auto_20342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20339 ?auto_20340 ?auto_20341 ?auto_20342 )
      ( MAKE-5PILE ?auto_20339 ?auto_20340 ?auto_20341 ?auto_20342 ?auto_20343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20361 - BLOCK
      ?auto_20362 - BLOCK
      ?auto_20363 - BLOCK
      ?auto_20364 - BLOCK
      ?auto_20365 - BLOCK
    )
    :vars
    (
      ?auto_20366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20365 ?auto_20366 ) ( ON-TABLE ?auto_20361 ) ( ON ?auto_20362 ?auto_20361 ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( not ( = ?auto_20361 ?auto_20363 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20365 ) ) ( not ( = ?auto_20361 ?auto_20366 ) ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20366 ) ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( not ( = ?auto_20363 ?auto_20365 ) ) ( not ( = ?auto_20363 ?auto_20366 ) ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20366 ) ) ( not ( = ?auto_20365 ?auto_20366 ) ) ( ON ?auto_20364 ?auto_20365 ) ( CLEAR ?auto_20362 ) ( ON ?auto_20363 ?auto_20364 ) ( CLEAR ?auto_20363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20361 ?auto_20362 ?auto_20363 )
      ( MAKE-5PILE ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20383 - BLOCK
      ?auto_20384 - BLOCK
      ?auto_20385 - BLOCK
      ?auto_20386 - BLOCK
      ?auto_20387 - BLOCK
    )
    :vars
    (
      ?auto_20388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20387 ?auto_20388 ) ( ON-TABLE ?auto_20383 ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20386 ) ) ( not ( = ?auto_20384 ?auto_20387 ) ) ( not ( = ?auto_20384 ?auto_20388 ) ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( not ( = ?auto_20385 ?auto_20387 ) ) ( not ( = ?auto_20385 ?auto_20388 ) ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20388 ) ) ( not ( = ?auto_20387 ?auto_20388 ) ) ( ON ?auto_20386 ?auto_20387 ) ( ON ?auto_20385 ?auto_20386 ) ( CLEAR ?auto_20383 ) ( ON ?auto_20384 ?auto_20385 ) ( CLEAR ?auto_20384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20383 ?auto_20384 )
      ( MAKE-5PILE ?auto_20383 ?auto_20384 ?auto_20385 ?auto_20386 ?auto_20387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20405 - BLOCK
      ?auto_20406 - BLOCK
      ?auto_20407 - BLOCK
      ?auto_20408 - BLOCK
      ?auto_20409 - BLOCK
    )
    :vars
    (
      ?auto_20410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20409 ?auto_20410 ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20405 ?auto_20407 ) ) ( not ( = ?auto_20405 ?auto_20408 ) ) ( not ( = ?auto_20405 ?auto_20409 ) ) ( not ( = ?auto_20405 ?auto_20410 ) ) ( not ( = ?auto_20406 ?auto_20407 ) ) ( not ( = ?auto_20406 ?auto_20408 ) ) ( not ( = ?auto_20406 ?auto_20409 ) ) ( not ( = ?auto_20406 ?auto_20410 ) ) ( not ( = ?auto_20407 ?auto_20408 ) ) ( not ( = ?auto_20407 ?auto_20409 ) ) ( not ( = ?auto_20407 ?auto_20410 ) ) ( not ( = ?auto_20408 ?auto_20409 ) ) ( not ( = ?auto_20408 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20410 ) ) ( ON ?auto_20408 ?auto_20409 ) ( ON ?auto_20407 ?auto_20408 ) ( ON ?auto_20406 ?auto_20407 ) ( ON ?auto_20405 ?auto_20406 ) ( CLEAR ?auto_20405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20405 )
      ( MAKE-5PILE ?auto_20405 ?auto_20406 ?auto_20407 ?auto_20408 ?auto_20409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20428 - BLOCK
      ?auto_20429 - BLOCK
      ?auto_20430 - BLOCK
      ?auto_20431 - BLOCK
      ?auto_20432 - BLOCK
      ?auto_20433 - BLOCK
    )
    :vars
    (
      ?auto_20434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20432 ) ( ON ?auto_20433 ?auto_20434 ) ( CLEAR ?auto_20433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20428 ) ( ON ?auto_20429 ?auto_20428 ) ( ON ?auto_20430 ?auto_20429 ) ( ON ?auto_20431 ?auto_20430 ) ( ON ?auto_20432 ?auto_20431 ) ( not ( = ?auto_20428 ?auto_20429 ) ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( not ( = ?auto_20428 ?auto_20432 ) ) ( not ( = ?auto_20428 ?auto_20433 ) ) ( not ( = ?auto_20428 ?auto_20434 ) ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20429 ?auto_20432 ) ) ( not ( = ?auto_20429 ?auto_20433 ) ) ( not ( = ?auto_20429 ?auto_20434 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20433 ) ) ( not ( = ?auto_20430 ?auto_20434 ) ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20433 ) ) ( not ( = ?auto_20431 ?auto_20434 ) ) ( not ( = ?auto_20432 ?auto_20433 ) ) ( not ( = ?auto_20432 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20433 ?auto_20434 )
      ( !STACK ?auto_20433 ?auto_20432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20454 - BLOCK
      ?auto_20455 - BLOCK
      ?auto_20456 - BLOCK
      ?auto_20457 - BLOCK
      ?auto_20458 - BLOCK
      ?auto_20459 - BLOCK
    )
    :vars
    (
      ?auto_20460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20459 ?auto_20460 ) ( ON-TABLE ?auto_20454 ) ( ON ?auto_20455 ?auto_20454 ) ( ON ?auto_20456 ?auto_20455 ) ( ON ?auto_20457 ?auto_20456 ) ( not ( = ?auto_20454 ?auto_20455 ) ) ( not ( = ?auto_20454 ?auto_20456 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20458 ) ) ( not ( = ?auto_20454 ?auto_20459 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20455 ?auto_20456 ) ) ( not ( = ?auto_20455 ?auto_20457 ) ) ( not ( = ?auto_20455 ?auto_20458 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20460 ) ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20459 ) ) ( not ( = ?auto_20456 ?auto_20460 ) ) ( not ( = ?auto_20457 ?auto_20458 ) ) ( not ( = ?auto_20457 ?auto_20459 ) ) ( not ( = ?auto_20457 ?auto_20460 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( CLEAR ?auto_20457 ) ( ON ?auto_20458 ?auto_20459 ) ( CLEAR ?auto_20458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 )
      ( MAKE-6PILE ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 ?auto_20459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20480 - BLOCK
      ?auto_20481 - BLOCK
      ?auto_20482 - BLOCK
      ?auto_20483 - BLOCK
      ?auto_20484 - BLOCK
      ?auto_20485 - BLOCK
    )
    :vars
    (
      ?auto_20486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20485 ?auto_20486 ) ( ON-TABLE ?auto_20480 ) ( ON ?auto_20481 ?auto_20480 ) ( ON ?auto_20482 ?auto_20481 ) ( not ( = ?auto_20480 ?auto_20481 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20483 ) ) ( not ( = ?auto_20480 ?auto_20484 ) ) ( not ( = ?auto_20480 ?auto_20485 ) ) ( not ( = ?auto_20480 ?auto_20486 ) ) ( not ( = ?auto_20481 ?auto_20482 ) ) ( not ( = ?auto_20481 ?auto_20483 ) ) ( not ( = ?auto_20481 ?auto_20484 ) ) ( not ( = ?auto_20481 ?auto_20485 ) ) ( not ( = ?auto_20481 ?auto_20486 ) ) ( not ( = ?auto_20482 ?auto_20483 ) ) ( not ( = ?auto_20482 ?auto_20484 ) ) ( not ( = ?auto_20482 ?auto_20485 ) ) ( not ( = ?auto_20482 ?auto_20486 ) ) ( not ( = ?auto_20483 ?auto_20484 ) ) ( not ( = ?auto_20483 ?auto_20485 ) ) ( not ( = ?auto_20483 ?auto_20486 ) ) ( not ( = ?auto_20484 ?auto_20485 ) ) ( not ( = ?auto_20484 ?auto_20486 ) ) ( not ( = ?auto_20485 ?auto_20486 ) ) ( ON ?auto_20484 ?auto_20485 ) ( CLEAR ?auto_20482 ) ( ON ?auto_20483 ?auto_20484 ) ( CLEAR ?auto_20483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20480 ?auto_20481 ?auto_20482 ?auto_20483 )
      ( MAKE-6PILE ?auto_20480 ?auto_20481 ?auto_20482 ?auto_20483 ?auto_20484 ?auto_20485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20506 - BLOCK
      ?auto_20507 - BLOCK
      ?auto_20508 - BLOCK
      ?auto_20509 - BLOCK
      ?auto_20510 - BLOCK
      ?auto_20511 - BLOCK
    )
    :vars
    (
      ?auto_20512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20511 ?auto_20512 ) ( ON-TABLE ?auto_20506 ) ( ON ?auto_20507 ?auto_20506 ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20509 ) ) ( not ( = ?auto_20506 ?auto_20510 ) ) ( not ( = ?auto_20506 ?auto_20511 ) ) ( not ( = ?auto_20506 ?auto_20512 ) ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20509 ) ) ( not ( = ?auto_20507 ?auto_20510 ) ) ( not ( = ?auto_20507 ?auto_20511 ) ) ( not ( = ?auto_20507 ?auto_20512 ) ) ( not ( = ?auto_20508 ?auto_20509 ) ) ( not ( = ?auto_20508 ?auto_20510 ) ) ( not ( = ?auto_20508 ?auto_20511 ) ) ( not ( = ?auto_20508 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( not ( = ?auto_20509 ?auto_20511 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20510 ?auto_20511 ) ) ( not ( = ?auto_20510 ?auto_20512 ) ) ( not ( = ?auto_20511 ?auto_20512 ) ) ( ON ?auto_20510 ?auto_20511 ) ( ON ?auto_20509 ?auto_20510 ) ( CLEAR ?auto_20507 ) ( ON ?auto_20508 ?auto_20509 ) ( CLEAR ?auto_20508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20506 ?auto_20507 ?auto_20508 )
      ( MAKE-6PILE ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20509 ?auto_20510 ?auto_20511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20532 - BLOCK
      ?auto_20533 - BLOCK
      ?auto_20534 - BLOCK
      ?auto_20535 - BLOCK
      ?auto_20536 - BLOCK
      ?auto_20537 - BLOCK
    )
    :vars
    (
      ?auto_20538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20537 ?auto_20538 ) ( ON-TABLE ?auto_20532 ) ( not ( = ?auto_20532 ?auto_20533 ) ) ( not ( = ?auto_20532 ?auto_20534 ) ) ( not ( = ?auto_20532 ?auto_20535 ) ) ( not ( = ?auto_20532 ?auto_20536 ) ) ( not ( = ?auto_20532 ?auto_20537 ) ) ( not ( = ?auto_20532 ?auto_20538 ) ) ( not ( = ?auto_20533 ?auto_20534 ) ) ( not ( = ?auto_20533 ?auto_20535 ) ) ( not ( = ?auto_20533 ?auto_20536 ) ) ( not ( = ?auto_20533 ?auto_20537 ) ) ( not ( = ?auto_20533 ?auto_20538 ) ) ( not ( = ?auto_20534 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20534 ?auto_20537 ) ) ( not ( = ?auto_20534 ?auto_20538 ) ) ( not ( = ?auto_20535 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20538 ) ) ( not ( = ?auto_20536 ?auto_20537 ) ) ( not ( = ?auto_20536 ?auto_20538 ) ) ( not ( = ?auto_20537 ?auto_20538 ) ) ( ON ?auto_20536 ?auto_20537 ) ( ON ?auto_20535 ?auto_20536 ) ( ON ?auto_20534 ?auto_20535 ) ( CLEAR ?auto_20532 ) ( ON ?auto_20533 ?auto_20534 ) ( CLEAR ?auto_20533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20532 ?auto_20533 )
      ( MAKE-6PILE ?auto_20532 ?auto_20533 ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_20558 - BLOCK
      ?auto_20559 - BLOCK
      ?auto_20560 - BLOCK
      ?auto_20561 - BLOCK
      ?auto_20562 - BLOCK
      ?auto_20563 - BLOCK
    )
    :vars
    (
      ?auto_20564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20563 ?auto_20564 ) ( not ( = ?auto_20558 ?auto_20559 ) ) ( not ( = ?auto_20558 ?auto_20560 ) ) ( not ( = ?auto_20558 ?auto_20561 ) ) ( not ( = ?auto_20558 ?auto_20562 ) ) ( not ( = ?auto_20558 ?auto_20563 ) ) ( not ( = ?auto_20558 ?auto_20564 ) ) ( not ( = ?auto_20559 ?auto_20560 ) ) ( not ( = ?auto_20559 ?auto_20561 ) ) ( not ( = ?auto_20559 ?auto_20562 ) ) ( not ( = ?auto_20559 ?auto_20563 ) ) ( not ( = ?auto_20559 ?auto_20564 ) ) ( not ( = ?auto_20560 ?auto_20561 ) ) ( not ( = ?auto_20560 ?auto_20562 ) ) ( not ( = ?auto_20560 ?auto_20563 ) ) ( not ( = ?auto_20560 ?auto_20564 ) ) ( not ( = ?auto_20561 ?auto_20562 ) ) ( not ( = ?auto_20561 ?auto_20563 ) ) ( not ( = ?auto_20561 ?auto_20564 ) ) ( not ( = ?auto_20562 ?auto_20563 ) ) ( not ( = ?auto_20562 ?auto_20564 ) ) ( not ( = ?auto_20563 ?auto_20564 ) ) ( ON ?auto_20562 ?auto_20563 ) ( ON ?auto_20561 ?auto_20562 ) ( ON ?auto_20560 ?auto_20561 ) ( ON ?auto_20559 ?auto_20560 ) ( ON ?auto_20558 ?auto_20559 ) ( CLEAR ?auto_20558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20558 )
      ( MAKE-6PILE ?auto_20558 ?auto_20559 ?auto_20560 ?auto_20561 ?auto_20562 ?auto_20563 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20585 - BLOCK
      ?auto_20586 - BLOCK
      ?auto_20587 - BLOCK
      ?auto_20588 - BLOCK
      ?auto_20589 - BLOCK
      ?auto_20590 - BLOCK
      ?auto_20591 - BLOCK
    )
    :vars
    (
      ?auto_20592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20590 ) ( ON ?auto_20591 ?auto_20592 ) ( CLEAR ?auto_20591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20585 ) ( ON ?auto_20586 ?auto_20585 ) ( ON ?auto_20587 ?auto_20586 ) ( ON ?auto_20588 ?auto_20587 ) ( ON ?auto_20589 ?auto_20588 ) ( ON ?auto_20590 ?auto_20589 ) ( not ( = ?auto_20585 ?auto_20586 ) ) ( not ( = ?auto_20585 ?auto_20587 ) ) ( not ( = ?auto_20585 ?auto_20588 ) ) ( not ( = ?auto_20585 ?auto_20589 ) ) ( not ( = ?auto_20585 ?auto_20590 ) ) ( not ( = ?auto_20585 ?auto_20591 ) ) ( not ( = ?auto_20585 ?auto_20592 ) ) ( not ( = ?auto_20586 ?auto_20587 ) ) ( not ( = ?auto_20586 ?auto_20588 ) ) ( not ( = ?auto_20586 ?auto_20589 ) ) ( not ( = ?auto_20586 ?auto_20590 ) ) ( not ( = ?auto_20586 ?auto_20591 ) ) ( not ( = ?auto_20586 ?auto_20592 ) ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20589 ) ) ( not ( = ?auto_20587 ?auto_20590 ) ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( not ( = ?auto_20587 ?auto_20592 ) ) ( not ( = ?auto_20588 ?auto_20589 ) ) ( not ( = ?auto_20588 ?auto_20590 ) ) ( not ( = ?auto_20588 ?auto_20591 ) ) ( not ( = ?auto_20588 ?auto_20592 ) ) ( not ( = ?auto_20589 ?auto_20590 ) ) ( not ( = ?auto_20589 ?auto_20591 ) ) ( not ( = ?auto_20589 ?auto_20592 ) ) ( not ( = ?auto_20590 ?auto_20591 ) ) ( not ( = ?auto_20590 ?auto_20592 ) ) ( not ( = ?auto_20591 ?auto_20592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20591 ?auto_20592 )
      ( !STACK ?auto_20591 ?auto_20590 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20600 - BLOCK
      ?auto_20601 - BLOCK
      ?auto_20602 - BLOCK
      ?auto_20603 - BLOCK
      ?auto_20604 - BLOCK
      ?auto_20605 - BLOCK
      ?auto_20606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20605 ) ( ON-TABLE ?auto_20606 ) ( CLEAR ?auto_20606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20600 ) ( ON ?auto_20601 ?auto_20600 ) ( ON ?auto_20602 ?auto_20601 ) ( ON ?auto_20603 ?auto_20602 ) ( ON ?auto_20604 ?auto_20603 ) ( ON ?auto_20605 ?auto_20604 ) ( not ( = ?auto_20600 ?auto_20601 ) ) ( not ( = ?auto_20600 ?auto_20602 ) ) ( not ( = ?auto_20600 ?auto_20603 ) ) ( not ( = ?auto_20600 ?auto_20604 ) ) ( not ( = ?auto_20600 ?auto_20605 ) ) ( not ( = ?auto_20600 ?auto_20606 ) ) ( not ( = ?auto_20601 ?auto_20602 ) ) ( not ( = ?auto_20601 ?auto_20603 ) ) ( not ( = ?auto_20601 ?auto_20604 ) ) ( not ( = ?auto_20601 ?auto_20605 ) ) ( not ( = ?auto_20601 ?auto_20606 ) ) ( not ( = ?auto_20602 ?auto_20603 ) ) ( not ( = ?auto_20602 ?auto_20604 ) ) ( not ( = ?auto_20602 ?auto_20605 ) ) ( not ( = ?auto_20602 ?auto_20606 ) ) ( not ( = ?auto_20603 ?auto_20604 ) ) ( not ( = ?auto_20603 ?auto_20605 ) ) ( not ( = ?auto_20603 ?auto_20606 ) ) ( not ( = ?auto_20604 ?auto_20605 ) ) ( not ( = ?auto_20604 ?auto_20606 ) ) ( not ( = ?auto_20605 ?auto_20606 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_20606 )
      ( !STACK ?auto_20606 ?auto_20605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20614 - BLOCK
      ?auto_20615 - BLOCK
      ?auto_20616 - BLOCK
      ?auto_20617 - BLOCK
      ?auto_20618 - BLOCK
      ?auto_20619 - BLOCK
      ?auto_20620 - BLOCK
    )
    :vars
    (
      ?auto_20621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20620 ?auto_20621 ) ( ON-TABLE ?auto_20614 ) ( ON ?auto_20615 ?auto_20614 ) ( ON ?auto_20616 ?auto_20615 ) ( ON ?auto_20617 ?auto_20616 ) ( ON ?auto_20618 ?auto_20617 ) ( not ( = ?auto_20614 ?auto_20615 ) ) ( not ( = ?auto_20614 ?auto_20616 ) ) ( not ( = ?auto_20614 ?auto_20617 ) ) ( not ( = ?auto_20614 ?auto_20618 ) ) ( not ( = ?auto_20614 ?auto_20619 ) ) ( not ( = ?auto_20614 ?auto_20620 ) ) ( not ( = ?auto_20614 ?auto_20621 ) ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( not ( = ?auto_20615 ?auto_20617 ) ) ( not ( = ?auto_20615 ?auto_20618 ) ) ( not ( = ?auto_20615 ?auto_20619 ) ) ( not ( = ?auto_20615 ?auto_20620 ) ) ( not ( = ?auto_20615 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20616 ?auto_20618 ) ) ( not ( = ?auto_20616 ?auto_20619 ) ) ( not ( = ?auto_20616 ?auto_20620 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20617 ?auto_20618 ) ) ( not ( = ?auto_20617 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) ( not ( = ?auto_20617 ?auto_20621 ) ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( not ( = ?auto_20618 ?auto_20621 ) ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( not ( = ?auto_20620 ?auto_20621 ) ) ( CLEAR ?auto_20618 ) ( ON ?auto_20619 ?auto_20620 ) ( CLEAR ?auto_20619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_20614 ?auto_20615 ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 )
      ( MAKE-7PILE ?auto_20614 ?auto_20615 ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20629 - BLOCK
      ?auto_20630 - BLOCK
      ?auto_20631 - BLOCK
      ?auto_20632 - BLOCK
      ?auto_20633 - BLOCK
      ?auto_20634 - BLOCK
      ?auto_20635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20635 ) ( ON-TABLE ?auto_20629 ) ( ON ?auto_20630 ?auto_20629 ) ( ON ?auto_20631 ?auto_20630 ) ( ON ?auto_20632 ?auto_20631 ) ( ON ?auto_20633 ?auto_20632 ) ( not ( = ?auto_20629 ?auto_20630 ) ) ( not ( = ?auto_20629 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20632 ) ) ( not ( = ?auto_20629 ?auto_20633 ) ) ( not ( = ?auto_20629 ?auto_20634 ) ) ( not ( = ?auto_20629 ?auto_20635 ) ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20630 ?auto_20632 ) ) ( not ( = ?auto_20630 ?auto_20633 ) ) ( not ( = ?auto_20630 ?auto_20634 ) ) ( not ( = ?auto_20630 ?auto_20635 ) ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( not ( = ?auto_20631 ?auto_20634 ) ) ( not ( = ?auto_20631 ?auto_20635 ) ) ( not ( = ?auto_20632 ?auto_20633 ) ) ( not ( = ?auto_20632 ?auto_20634 ) ) ( not ( = ?auto_20632 ?auto_20635 ) ) ( not ( = ?auto_20633 ?auto_20634 ) ) ( not ( = ?auto_20633 ?auto_20635 ) ) ( not ( = ?auto_20634 ?auto_20635 ) ) ( CLEAR ?auto_20633 ) ( ON ?auto_20634 ?auto_20635 ) ( CLEAR ?auto_20634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_20629 ?auto_20630 ?auto_20631 ?auto_20632 ?auto_20633 ?auto_20634 )
      ( MAKE-7PILE ?auto_20629 ?auto_20630 ?auto_20631 ?auto_20632 ?auto_20633 ?auto_20634 ?auto_20635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20643 - BLOCK
      ?auto_20644 - BLOCK
      ?auto_20645 - BLOCK
      ?auto_20646 - BLOCK
      ?auto_20647 - BLOCK
      ?auto_20648 - BLOCK
      ?auto_20649 - BLOCK
    )
    :vars
    (
      ?auto_20650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20649 ?auto_20650 ) ( ON-TABLE ?auto_20643 ) ( ON ?auto_20644 ?auto_20643 ) ( ON ?auto_20645 ?auto_20644 ) ( ON ?auto_20646 ?auto_20645 ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20645 ) ) ( not ( = ?auto_20643 ?auto_20646 ) ) ( not ( = ?auto_20643 ?auto_20647 ) ) ( not ( = ?auto_20643 ?auto_20648 ) ) ( not ( = ?auto_20643 ?auto_20649 ) ) ( not ( = ?auto_20643 ?auto_20650 ) ) ( not ( = ?auto_20644 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20646 ) ) ( not ( = ?auto_20644 ?auto_20647 ) ) ( not ( = ?auto_20644 ?auto_20648 ) ) ( not ( = ?auto_20644 ?auto_20649 ) ) ( not ( = ?auto_20644 ?auto_20650 ) ) ( not ( = ?auto_20645 ?auto_20646 ) ) ( not ( = ?auto_20645 ?auto_20647 ) ) ( not ( = ?auto_20645 ?auto_20648 ) ) ( not ( = ?auto_20645 ?auto_20649 ) ) ( not ( = ?auto_20645 ?auto_20650 ) ) ( not ( = ?auto_20646 ?auto_20647 ) ) ( not ( = ?auto_20646 ?auto_20648 ) ) ( not ( = ?auto_20646 ?auto_20649 ) ) ( not ( = ?auto_20646 ?auto_20650 ) ) ( not ( = ?auto_20647 ?auto_20648 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( not ( = ?auto_20647 ?auto_20650 ) ) ( not ( = ?auto_20648 ?auto_20649 ) ) ( not ( = ?auto_20648 ?auto_20650 ) ) ( not ( = ?auto_20649 ?auto_20650 ) ) ( ON ?auto_20648 ?auto_20649 ) ( CLEAR ?auto_20646 ) ( ON ?auto_20647 ?auto_20648 ) ( CLEAR ?auto_20647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20643 ?auto_20644 ?auto_20645 ?auto_20646 ?auto_20647 )
      ( MAKE-7PILE ?auto_20643 ?auto_20644 ?auto_20645 ?auto_20646 ?auto_20647 ?auto_20648 ?auto_20649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20658 - BLOCK
      ?auto_20659 - BLOCK
      ?auto_20660 - BLOCK
      ?auto_20661 - BLOCK
      ?auto_20662 - BLOCK
      ?auto_20663 - BLOCK
      ?auto_20664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20664 ) ( ON-TABLE ?auto_20658 ) ( ON ?auto_20659 ?auto_20658 ) ( ON ?auto_20660 ?auto_20659 ) ( ON ?auto_20661 ?auto_20660 ) ( not ( = ?auto_20658 ?auto_20659 ) ) ( not ( = ?auto_20658 ?auto_20660 ) ) ( not ( = ?auto_20658 ?auto_20661 ) ) ( not ( = ?auto_20658 ?auto_20662 ) ) ( not ( = ?auto_20658 ?auto_20663 ) ) ( not ( = ?auto_20658 ?auto_20664 ) ) ( not ( = ?auto_20659 ?auto_20660 ) ) ( not ( = ?auto_20659 ?auto_20661 ) ) ( not ( = ?auto_20659 ?auto_20662 ) ) ( not ( = ?auto_20659 ?auto_20663 ) ) ( not ( = ?auto_20659 ?auto_20664 ) ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20662 ) ) ( not ( = ?auto_20660 ?auto_20663 ) ) ( not ( = ?auto_20660 ?auto_20664 ) ) ( not ( = ?auto_20661 ?auto_20662 ) ) ( not ( = ?auto_20661 ?auto_20663 ) ) ( not ( = ?auto_20661 ?auto_20664 ) ) ( not ( = ?auto_20662 ?auto_20663 ) ) ( not ( = ?auto_20662 ?auto_20664 ) ) ( not ( = ?auto_20663 ?auto_20664 ) ) ( ON ?auto_20663 ?auto_20664 ) ( CLEAR ?auto_20661 ) ( ON ?auto_20662 ?auto_20663 ) ( CLEAR ?auto_20662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20658 ?auto_20659 ?auto_20660 ?auto_20661 ?auto_20662 )
      ( MAKE-7PILE ?auto_20658 ?auto_20659 ?auto_20660 ?auto_20661 ?auto_20662 ?auto_20663 ?auto_20664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20672 - BLOCK
      ?auto_20673 - BLOCK
      ?auto_20674 - BLOCK
      ?auto_20675 - BLOCK
      ?auto_20676 - BLOCK
      ?auto_20677 - BLOCK
      ?auto_20678 - BLOCK
    )
    :vars
    (
      ?auto_20679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20678 ?auto_20679 ) ( ON-TABLE ?auto_20672 ) ( ON ?auto_20673 ?auto_20672 ) ( ON ?auto_20674 ?auto_20673 ) ( not ( = ?auto_20672 ?auto_20673 ) ) ( not ( = ?auto_20672 ?auto_20674 ) ) ( not ( = ?auto_20672 ?auto_20675 ) ) ( not ( = ?auto_20672 ?auto_20676 ) ) ( not ( = ?auto_20672 ?auto_20677 ) ) ( not ( = ?auto_20672 ?auto_20678 ) ) ( not ( = ?auto_20672 ?auto_20679 ) ) ( not ( = ?auto_20673 ?auto_20674 ) ) ( not ( = ?auto_20673 ?auto_20675 ) ) ( not ( = ?auto_20673 ?auto_20676 ) ) ( not ( = ?auto_20673 ?auto_20677 ) ) ( not ( = ?auto_20673 ?auto_20678 ) ) ( not ( = ?auto_20673 ?auto_20679 ) ) ( not ( = ?auto_20674 ?auto_20675 ) ) ( not ( = ?auto_20674 ?auto_20676 ) ) ( not ( = ?auto_20674 ?auto_20677 ) ) ( not ( = ?auto_20674 ?auto_20678 ) ) ( not ( = ?auto_20674 ?auto_20679 ) ) ( not ( = ?auto_20675 ?auto_20676 ) ) ( not ( = ?auto_20675 ?auto_20677 ) ) ( not ( = ?auto_20675 ?auto_20678 ) ) ( not ( = ?auto_20675 ?auto_20679 ) ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20678 ) ) ( not ( = ?auto_20676 ?auto_20679 ) ) ( not ( = ?auto_20677 ?auto_20678 ) ) ( not ( = ?auto_20677 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( ON ?auto_20677 ?auto_20678 ) ( ON ?auto_20676 ?auto_20677 ) ( CLEAR ?auto_20674 ) ( ON ?auto_20675 ?auto_20676 ) ( CLEAR ?auto_20675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20672 ?auto_20673 ?auto_20674 ?auto_20675 )
      ( MAKE-7PILE ?auto_20672 ?auto_20673 ?auto_20674 ?auto_20675 ?auto_20676 ?auto_20677 ?auto_20678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20687 - BLOCK
      ?auto_20688 - BLOCK
      ?auto_20689 - BLOCK
      ?auto_20690 - BLOCK
      ?auto_20691 - BLOCK
      ?auto_20692 - BLOCK
      ?auto_20693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20693 ) ( ON-TABLE ?auto_20687 ) ( ON ?auto_20688 ?auto_20687 ) ( ON ?auto_20689 ?auto_20688 ) ( not ( = ?auto_20687 ?auto_20688 ) ) ( not ( = ?auto_20687 ?auto_20689 ) ) ( not ( = ?auto_20687 ?auto_20690 ) ) ( not ( = ?auto_20687 ?auto_20691 ) ) ( not ( = ?auto_20687 ?auto_20692 ) ) ( not ( = ?auto_20687 ?auto_20693 ) ) ( not ( = ?auto_20688 ?auto_20689 ) ) ( not ( = ?auto_20688 ?auto_20690 ) ) ( not ( = ?auto_20688 ?auto_20691 ) ) ( not ( = ?auto_20688 ?auto_20692 ) ) ( not ( = ?auto_20688 ?auto_20693 ) ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20691 ) ) ( not ( = ?auto_20689 ?auto_20692 ) ) ( not ( = ?auto_20689 ?auto_20693 ) ) ( not ( = ?auto_20690 ?auto_20691 ) ) ( not ( = ?auto_20690 ?auto_20692 ) ) ( not ( = ?auto_20690 ?auto_20693 ) ) ( not ( = ?auto_20691 ?auto_20692 ) ) ( not ( = ?auto_20691 ?auto_20693 ) ) ( not ( = ?auto_20692 ?auto_20693 ) ) ( ON ?auto_20692 ?auto_20693 ) ( ON ?auto_20691 ?auto_20692 ) ( CLEAR ?auto_20689 ) ( ON ?auto_20690 ?auto_20691 ) ( CLEAR ?auto_20690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20687 ?auto_20688 ?auto_20689 ?auto_20690 )
      ( MAKE-7PILE ?auto_20687 ?auto_20688 ?auto_20689 ?auto_20690 ?auto_20691 ?auto_20692 ?auto_20693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20701 - BLOCK
      ?auto_20702 - BLOCK
      ?auto_20703 - BLOCK
      ?auto_20704 - BLOCK
      ?auto_20705 - BLOCK
      ?auto_20706 - BLOCK
      ?auto_20707 - BLOCK
    )
    :vars
    (
      ?auto_20708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20707 ?auto_20708 ) ( ON-TABLE ?auto_20701 ) ( ON ?auto_20702 ?auto_20701 ) ( not ( = ?auto_20701 ?auto_20702 ) ) ( not ( = ?auto_20701 ?auto_20703 ) ) ( not ( = ?auto_20701 ?auto_20704 ) ) ( not ( = ?auto_20701 ?auto_20705 ) ) ( not ( = ?auto_20701 ?auto_20706 ) ) ( not ( = ?auto_20701 ?auto_20707 ) ) ( not ( = ?auto_20701 ?auto_20708 ) ) ( not ( = ?auto_20702 ?auto_20703 ) ) ( not ( = ?auto_20702 ?auto_20704 ) ) ( not ( = ?auto_20702 ?auto_20705 ) ) ( not ( = ?auto_20702 ?auto_20706 ) ) ( not ( = ?auto_20702 ?auto_20707 ) ) ( not ( = ?auto_20702 ?auto_20708 ) ) ( not ( = ?auto_20703 ?auto_20704 ) ) ( not ( = ?auto_20703 ?auto_20705 ) ) ( not ( = ?auto_20703 ?auto_20706 ) ) ( not ( = ?auto_20703 ?auto_20707 ) ) ( not ( = ?auto_20703 ?auto_20708 ) ) ( not ( = ?auto_20704 ?auto_20705 ) ) ( not ( = ?auto_20704 ?auto_20706 ) ) ( not ( = ?auto_20704 ?auto_20707 ) ) ( not ( = ?auto_20704 ?auto_20708 ) ) ( not ( = ?auto_20705 ?auto_20706 ) ) ( not ( = ?auto_20705 ?auto_20707 ) ) ( not ( = ?auto_20705 ?auto_20708 ) ) ( not ( = ?auto_20706 ?auto_20707 ) ) ( not ( = ?auto_20706 ?auto_20708 ) ) ( not ( = ?auto_20707 ?auto_20708 ) ) ( ON ?auto_20706 ?auto_20707 ) ( ON ?auto_20705 ?auto_20706 ) ( ON ?auto_20704 ?auto_20705 ) ( CLEAR ?auto_20702 ) ( ON ?auto_20703 ?auto_20704 ) ( CLEAR ?auto_20703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20701 ?auto_20702 ?auto_20703 )
      ( MAKE-7PILE ?auto_20701 ?auto_20702 ?auto_20703 ?auto_20704 ?auto_20705 ?auto_20706 ?auto_20707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20716 - BLOCK
      ?auto_20717 - BLOCK
      ?auto_20718 - BLOCK
      ?auto_20719 - BLOCK
      ?auto_20720 - BLOCK
      ?auto_20721 - BLOCK
      ?auto_20722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20722 ) ( ON-TABLE ?auto_20716 ) ( ON ?auto_20717 ?auto_20716 ) ( not ( = ?auto_20716 ?auto_20717 ) ) ( not ( = ?auto_20716 ?auto_20718 ) ) ( not ( = ?auto_20716 ?auto_20719 ) ) ( not ( = ?auto_20716 ?auto_20720 ) ) ( not ( = ?auto_20716 ?auto_20721 ) ) ( not ( = ?auto_20716 ?auto_20722 ) ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20719 ) ) ( not ( = ?auto_20717 ?auto_20720 ) ) ( not ( = ?auto_20717 ?auto_20721 ) ) ( not ( = ?auto_20717 ?auto_20722 ) ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( not ( = ?auto_20718 ?auto_20720 ) ) ( not ( = ?auto_20718 ?auto_20721 ) ) ( not ( = ?auto_20718 ?auto_20722 ) ) ( not ( = ?auto_20719 ?auto_20720 ) ) ( not ( = ?auto_20719 ?auto_20721 ) ) ( not ( = ?auto_20719 ?auto_20722 ) ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( not ( = ?auto_20720 ?auto_20722 ) ) ( not ( = ?auto_20721 ?auto_20722 ) ) ( ON ?auto_20721 ?auto_20722 ) ( ON ?auto_20720 ?auto_20721 ) ( ON ?auto_20719 ?auto_20720 ) ( CLEAR ?auto_20717 ) ( ON ?auto_20718 ?auto_20719 ) ( CLEAR ?auto_20718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20716 ?auto_20717 ?auto_20718 )
      ( MAKE-7PILE ?auto_20716 ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ?auto_20721 ?auto_20722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20730 - BLOCK
      ?auto_20731 - BLOCK
      ?auto_20732 - BLOCK
      ?auto_20733 - BLOCK
      ?auto_20734 - BLOCK
      ?auto_20735 - BLOCK
      ?auto_20736 - BLOCK
    )
    :vars
    (
      ?auto_20737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20736 ?auto_20737 ) ( ON-TABLE ?auto_20730 ) ( not ( = ?auto_20730 ?auto_20731 ) ) ( not ( = ?auto_20730 ?auto_20732 ) ) ( not ( = ?auto_20730 ?auto_20733 ) ) ( not ( = ?auto_20730 ?auto_20734 ) ) ( not ( = ?auto_20730 ?auto_20735 ) ) ( not ( = ?auto_20730 ?auto_20736 ) ) ( not ( = ?auto_20730 ?auto_20737 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20733 ) ) ( not ( = ?auto_20731 ?auto_20734 ) ) ( not ( = ?auto_20731 ?auto_20735 ) ) ( not ( = ?auto_20731 ?auto_20736 ) ) ( not ( = ?auto_20731 ?auto_20737 ) ) ( not ( = ?auto_20732 ?auto_20733 ) ) ( not ( = ?auto_20732 ?auto_20734 ) ) ( not ( = ?auto_20732 ?auto_20735 ) ) ( not ( = ?auto_20732 ?auto_20736 ) ) ( not ( = ?auto_20732 ?auto_20737 ) ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20733 ?auto_20735 ) ) ( not ( = ?auto_20733 ?auto_20736 ) ) ( not ( = ?auto_20733 ?auto_20737 ) ) ( not ( = ?auto_20734 ?auto_20735 ) ) ( not ( = ?auto_20734 ?auto_20736 ) ) ( not ( = ?auto_20734 ?auto_20737 ) ) ( not ( = ?auto_20735 ?auto_20736 ) ) ( not ( = ?auto_20735 ?auto_20737 ) ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( ON ?auto_20735 ?auto_20736 ) ( ON ?auto_20734 ?auto_20735 ) ( ON ?auto_20733 ?auto_20734 ) ( ON ?auto_20732 ?auto_20733 ) ( CLEAR ?auto_20730 ) ( ON ?auto_20731 ?auto_20732 ) ( CLEAR ?auto_20731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20730 ?auto_20731 )
      ( MAKE-7PILE ?auto_20730 ?auto_20731 ?auto_20732 ?auto_20733 ?auto_20734 ?auto_20735 ?auto_20736 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20745 - BLOCK
      ?auto_20746 - BLOCK
      ?auto_20747 - BLOCK
      ?auto_20748 - BLOCK
      ?auto_20749 - BLOCK
      ?auto_20750 - BLOCK
      ?auto_20751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20751 ) ( ON-TABLE ?auto_20745 ) ( not ( = ?auto_20745 ?auto_20746 ) ) ( not ( = ?auto_20745 ?auto_20747 ) ) ( not ( = ?auto_20745 ?auto_20748 ) ) ( not ( = ?auto_20745 ?auto_20749 ) ) ( not ( = ?auto_20745 ?auto_20750 ) ) ( not ( = ?auto_20745 ?auto_20751 ) ) ( not ( = ?auto_20746 ?auto_20747 ) ) ( not ( = ?auto_20746 ?auto_20748 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20746 ?auto_20750 ) ) ( not ( = ?auto_20746 ?auto_20751 ) ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20749 ) ) ( not ( = ?auto_20747 ?auto_20750 ) ) ( not ( = ?auto_20747 ?auto_20751 ) ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20748 ?auto_20751 ) ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20751 ) ) ( ON ?auto_20750 ?auto_20751 ) ( ON ?auto_20749 ?auto_20750 ) ( ON ?auto_20748 ?auto_20749 ) ( ON ?auto_20747 ?auto_20748 ) ( CLEAR ?auto_20745 ) ( ON ?auto_20746 ?auto_20747 ) ( CLEAR ?auto_20746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20745 ?auto_20746 )
      ( MAKE-7PILE ?auto_20745 ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ?auto_20751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20759 - BLOCK
      ?auto_20760 - BLOCK
      ?auto_20761 - BLOCK
      ?auto_20762 - BLOCK
      ?auto_20763 - BLOCK
      ?auto_20764 - BLOCK
      ?auto_20765 - BLOCK
    )
    :vars
    (
      ?auto_20766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20765 ?auto_20766 ) ( not ( = ?auto_20759 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20761 ) ) ( not ( = ?auto_20759 ?auto_20762 ) ) ( not ( = ?auto_20759 ?auto_20763 ) ) ( not ( = ?auto_20759 ?auto_20764 ) ) ( not ( = ?auto_20759 ?auto_20765 ) ) ( not ( = ?auto_20759 ?auto_20766 ) ) ( not ( = ?auto_20760 ?auto_20761 ) ) ( not ( = ?auto_20760 ?auto_20762 ) ) ( not ( = ?auto_20760 ?auto_20763 ) ) ( not ( = ?auto_20760 ?auto_20764 ) ) ( not ( = ?auto_20760 ?auto_20765 ) ) ( not ( = ?auto_20760 ?auto_20766 ) ) ( not ( = ?auto_20761 ?auto_20762 ) ) ( not ( = ?auto_20761 ?auto_20763 ) ) ( not ( = ?auto_20761 ?auto_20764 ) ) ( not ( = ?auto_20761 ?auto_20765 ) ) ( not ( = ?auto_20761 ?auto_20766 ) ) ( not ( = ?auto_20762 ?auto_20763 ) ) ( not ( = ?auto_20762 ?auto_20764 ) ) ( not ( = ?auto_20762 ?auto_20765 ) ) ( not ( = ?auto_20762 ?auto_20766 ) ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( not ( = ?auto_20763 ?auto_20765 ) ) ( not ( = ?auto_20763 ?auto_20766 ) ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20766 ) ) ( not ( = ?auto_20765 ?auto_20766 ) ) ( ON ?auto_20764 ?auto_20765 ) ( ON ?auto_20763 ?auto_20764 ) ( ON ?auto_20762 ?auto_20763 ) ( ON ?auto_20761 ?auto_20762 ) ( ON ?auto_20760 ?auto_20761 ) ( ON ?auto_20759 ?auto_20760 ) ( CLEAR ?auto_20759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20759 )
      ( MAKE-7PILE ?auto_20759 ?auto_20760 ?auto_20761 ?auto_20762 ?auto_20763 ?auto_20764 ?auto_20765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20774 - BLOCK
      ?auto_20775 - BLOCK
      ?auto_20776 - BLOCK
      ?auto_20777 - BLOCK
      ?auto_20778 - BLOCK
      ?auto_20779 - BLOCK
      ?auto_20780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20780 ) ( not ( = ?auto_20774 ?auto_20775 ) ) ( not ( = ?auto_20774 ?auto_20776 ) ) ( not ( = ?auto_20774 ?auto_20777 ) ) ( not ( = ?auto_20774 ?auto_20778 ) ) ( not ( = ?auto_20774 ?auto_20779 ) ) ( not ( = ?auto_20774 ?auto_20780 ) ) ( not ( = ?auto_20775 ?auto_20776 ) ) ( not ( = ?auto_20775 ?auto_20777 ) ) ( not ( = ?auto_20775 ?auto_20778 ) ) ( not ( = ?auto_20775 ?auto_20779 ) ) ( not ( = ?auto_20775 ?auto_20780 ) ) ( not ( = ?auto_20776 ?auto_20777 ) ) ( not ( = ?auto_20776 ?auto_20778 ) ) ( not ( = ?auto_20776 ?auto_20779 ) ) ( not ( = ?auto_20776 ?auto_20780 ) ) ( not ( = ?auto_20777 ?auto_20778 ) ) ( not ( = ?auto_20777 ?auto_20779 ) ) ( not ( = ?auto_20777 ?auto_20780 ) ) ( not ( = ?auto_20778 ?auto_20779 ) ) ( not ( = ?auto_20778 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( ON ?auto_20779 ?auto_20780 ) ( ON ?auto_20778 ?auto_20779 ) ( ON ?auto_20777 ?auto_20778 ) ( ON ?auto_20776 ?auto_20777 ) ( ON ?auto_20775 ?auto_20776 ) ( ON ?auto_20774 ?auto_20775 ) ( CLEAR ?auto_20774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20774 )
      ( MAKE-7PILE ?auto_20774 ?auto_20775 ?auto_20776 ?auto_20777 ?auto_20778 ?auto_20779 ?auto_20780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20788 - BLOCK
      ?auto_20789 - BLOCK
      ?auto_20790 - BLOCK
      ?auto_20791 - BLOCK
      ?auto_20792 - BLOCK
      ?auto_20793 - BLOCK
      ?auto_20794 - BLOCK
    )
    :vars
    (
      ?auto_20795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20788 ?auto_20789 ) ) ( not ( = ?auto_20788 ?auto_20790 ) ) ( not ( = ?auto_20788 ?auto_20791 ) ) ( not ( = ?auto_20788 ?auto_20792 ) ) ( not ( = ?auto_20788 ?auto_20793 ) ) ( not ( = ?auto_20788 ?auto_20794 ) ) ( not ( = ?auto_20789 ?auto_20790 ) ) ( not ( = ?auto_20789 ?auto_20791 ) ) ( not ( = ?auto_20789 ?auto_20792 ) ) ( not ( = ?auto_20789 ?auto_20793 ) ) ( not ( = ?auto_20789 ?auto_20794 ) ) ( not ( = ?auto_20790 ?auto_20791 ) ) ( not ( = ?auto_20790 ?auto_20792 ) ) ( not ( = ?auto_20790 ?auto_20793 ) ) ( not ( = ?auto_20790 ?auto_20794 ) ) ( not ( = ?auto_20791 ?auto_20792 ) ) ( not ( = ?auto_20791 ?auto_20793 ) ) ( not ( = ?auto_20791 ?auto_20794 ) ) ( not ( = ?auto_20792 ?auto_20793 ) ) ( not ( = ?auto_20792 ?auto_20794 ) ) ( not ( = ?auto_20793 ?auto_20794 ) ) ( ON ?auto_20788 ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20793 ?auto_20795 ) ) ( not ( = ?auto_20792 ?auto_20795 ) ) ( not ( = ?auto_20791 ?auto_20795 ) ) ( not ( = ?auto_20790 ?auto_20795 ) ) ( not ( = ?auto_20789 ?auto_20795 ) ) ( not ( = ?auto_20788 ?auto_20795 ) ) ( ON ?auto_20789 ?auto_20788 ) ( ON ?auto_20790 ?auto_20789 ) ( ON ?auto_20791 ?auto_20790 ) ( ON ?auto_20792 ?auto_20791 ) ( ON ?auto_20793 ?auto_20792 ) ( ON ?auto_20794 ?auto_20793 ) ( CLEAR ?auto_20794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_20794 ?auto_20793 ?auto_20792 ?auto_20791 ?auto_20790 ?auto_20789 ?auto_20788 )
      ( MAKE-7PILE ?auto_20788 ?auto_20789 ?auto_20790 ?auto_20791 ?auto_20792 ?auto_20793 ?auto_20794 ) )
  )

)

