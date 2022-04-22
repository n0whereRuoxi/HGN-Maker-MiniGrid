( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?B - BLOCK )
    ( ON ?B1 - BLOCK ?B2 - BLOCK )
    ( CLEAR ?B - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?B - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?B ) ( CLEAR ?B ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?B ) ) ( not ( CLEAR ?B ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?B ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B ) )
    :effect
    ( and ( not ( HOLDING ?B ) ) ( HAND-EMPTY ) ( ON-TABLE ?B ) ( CLEAR ?B ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?B1 ?B2 ) ) ( not ( CLEAR ?B1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?B2 ) ( HOLDING ?B1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B1 ) ( CLEAR ?B2 ) )
    :effect
    ( and ( not ( HOLDING ?B1 ) ) ( not ( CLEAR ?B2 ) ) ( HAND-EMPTY ) ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?GOAL - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?GOAL ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?TOP - BLOCK
      ?BOTTOM - BLOCK
    )
    :precondition
    ( and ( ON ?TOP ?BOTTOM ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE-VERIFY
    :parameters
    (
      ?BLOCK - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?BLOCK ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2 - BLOCK
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2 ) ( CLEAR ?AUTO_3 ) )
    :subtasks
    ( ( !STACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6 - BLOCK
      ?AUTO_7 - BLOCK
    )
    :vars
    (
      ?AUTO_11 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7 ) ( ON ?AUTO_6 ?AUTO_11 ) ( CLEAR ?AUTO_6 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6 ?AUTO_11 )
      ( MAKE-ON ?AUTO_6 ?AUTO_7 )
      ( MAKE-ON-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_13 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_13 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_13 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_15 - BLOCK
    )
    :vars
    (
      ?AUTO_18 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15 ?AUTO_18 ) ( CLEAR ?AUTO_15 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_15 ?AUTO_18 )
      ( MAKE-ON-TABLE ?AUTO_15 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_15 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_19 - BLOCK
    )
    :vars
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
      ?AUTO_23 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_19 ?AUTO_21 ) ( CLEAR ?AUTO_19 ) ( HOLDING ?AUTO_22 ) ( CLEAR ?AUTO_23 ) )
    :subtasks
    ( ( !STACK ?AUTO_22 ?AUTO_23 )
      ( MAKE-ON-TABLE ?AUTO_19 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_19 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_24 - BLOCK
    )
    :vars
    (
      ?AUTO_27 - BLOCK
      ?AUTO_25 - BLOCK
      ?AUTO_28 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_24 ?AUTO_27 ) ( CLEAR ?AUTO_25 ) ( ON ?AUTO_28 ?AUTO_24 ) ( CLEAR ?AUTO_28 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_28 ?AUTO_24 )
      ( MAKE-ON-TABLE ?AUTO_24 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_24 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_38 - BLOCK
    )
    :vars
    (
      ?AUTO_40 - BLOCK
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_38 ?AUTO_40 ) ( CLEAR ?AUTO_38 ) ( HOLDING ?AUTO_41 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_41 )
      ( MAKE-ON-TABLE ?AUTO_38 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_52 ) ( ON-TABLE ?AUTO_51 ) ( CLEAR ?AUTO_51 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_51 )
      ( MAKE-ON ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON-VERIFY ?AUTO_51 ?AUTO_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_56 ) ( CLEAR ?AUTO_56 ) ( HOLDING ?AUTO_57 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57 )
      ( MAKE-ON ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_489 - BLOCK
      ?AUTO_490 - BLOCK
    )
    :vars
    (
      ?AUTO_494 - BLOCK
      ?AUTO_492 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_490 ) ( ON-TABLE ?AUTO_489 ) ( CLEAR ?AUTO_494 ) ( ON ?AUTO_492 ?AUTO_489 ) ( CLEAR ?AUTO_492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_492 ?AUTO_489 )
      ( MAKE-ON ?AUTO_489 ?AUTO_490 )
      ( MAKE-ON-VERIFY ?AUTO_489 ?AUTO_490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_738 - BLOCK
      ?AUTO_739 - BLOCK
    )
    :vars
    (
      ?AUTO_743 - BLOCK
      ?AUTO_742 - BLOCK
      ?AUTO_744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_739 ) ( ON-TABLE ?AUTO_738 ) ( CLEAR ?AUTO_743 ) ( ON ?AUTO_742 ?AUTO_738 ) ( CLEAR ?AUTO_742 ) ( HOLDING ?AUTO_744 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_744 )
      ( MAKE-ON ?AUTO_738 ?AUTO_739 )
      ( MAKE-ON-VERIFY ?AUTO_738 ?AUTO_739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_109 - BLOCK
      ?AUTO_110 - BLOCK
    )
    :vars
    (
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_110 ) ( ON ?AUTO_109 ?AUTO_113 ) ( CLEAR ?AUTO_109 ) ( HOLDING ?AUTO_114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_114 )
      ( MAKE-ON ?AUTO_109 ?AUTO_110 )
      ( MAKE-ON-VERIFY ?AUTO_109 ?AUTO_110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_115 - BLOCK
      ?AUTO_116 - BLOCK
    )
    :vars
    (
      ?AUTO_120 - BLOCK
      ?AUTO_117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_116 ) ( ON ?AUTO_115 ?AUTO_120 ) ( ON ?AUTO_117 ?AUTO_115 ) ( CLEAR ?AUTO_117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_117 ?AUTO_115 )
      ( MAKE-ON ?AUTO_115 ?AUTO_116 )
      ( MAKE-ON-VERIFY ?AUTO_115 ?AUTO_116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_123 - BLOCK
      ?AUTO_124 - BLOCK
    )
    :vars
    (
      ?AUTO_128 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_124 ) ( ON ?AUTO_123 ?AUTO_128 ) ( ON ?AUTO_125 ?AUTO_123 ) ( CLEAR ?AUTO_125 ) ( HOLDING ?AUTO_129 ) ( CLEAR ?AUTO_130 ) )
    :subtasks
    ( ( !STACK ?AUTO_129 ?AUTO_130 )
      ( MAKE-ON ?AUTO_123 ?AUTO_124 )
      ( MAKE-ON-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_139 - BLOCK
      ?AUTO_140 - BLOCK
    )
    :vars
    (
      ?AUTO_144 - BLOCK
      ?AUTO_143 - BLOCK
      ?AUTO_146 - BLOCK
      ?AUTO_141 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_139 ?AUTO_144 ) ( ON ?AUTO_143 ?AUTO_139 ) ( CLEAR ?AUTO_143 ) ( CLEAR ?AUTO_146 ) ( ON ?AUTO_141 ?AUTO_140 ) ( CLEAR ?AUTO_141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_141 ?AUTO_140 )
      ( MAKE-ON ?AUTO_139 ?AUTO_140 )
      ( MAKE-ON-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
    )
    :vars
    (
      ?AUTO_3415 - BLOCK
      ?AUTO_3414 - BLOCK
      ?AUTO_3411 - BLOCK
      ?AUTO_3417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3409 ?AUTO_3415 ) ( CLEAR ?AUTO_3409 ) ( ON ?AUTO_3414 ?AUTO_3410 ) ( CLEAR ?AUTO_3414 ) ( HOLDING ?AUTO_3411 ) ( CLEAR ?AUTO_3417 ) )
    :subtasks
    ( ( !STACK ?AUTO_3411 ?AUTO_3417 )
      ( MAKE-ON ?AUTO_3409 ?AUTO_3410 )
      ( MAKE-ON-VERIFY ?AUTO_3409 ?AUTO_3410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_159 - BLOCK
      ?AUTO_160 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
      ?AUTO_161 - BLOCK
      ?AUTO_166 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_159 ?AUTO_162 ) ( CLEAR ?AUTO_161 ) ( ON ?AUTO_166 ?AUTO_160 ) ( CLEAR ?AUTO_159 ) ( ON ?AUTO_164 ?AUTO_166 ) ( CLEAR ?AUTO_164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_164 ?AUTO_166 )
      ( MAKE-ON ?AUTO_159 ?AUTO_160 )
      ( MAKE-ON-VERIFY ?AUTO_159 ?AUTO_160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_180 - BLOCK
      ?AUTO_181 - BLOCK
    )
    :vars
    (
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_180 ) ( CLEAR ?AUTO_180 ) ( HOLDING ?AUTO_181 ) ( CLEAR ?AUTO_185 ) )
    :subtasks
    ( ( !STACK ?AUTO_181 ?AUTO_185 )
      ( MAKE-ON ?AUTO_180 ?AUTO_181 )
      ( MAKE-ON-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_279 - BLOCK
      ?AUTO_280 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_279 ?AUTO_283 ) ( CLEAR ?AUTO_279 ) ( HOLDING ?AUTO_280 ) ( CLEAR ?AUTO_285 ) )
    :subtasks
    ( ( !STACK ?AUTO_280 ?AUTO_285 )
      ( MAKE-ON ?AUTO_279 ?AUTO_280 )
      ( MAKE-ON-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_288 - BLOCK
      ?AUTO_289 - BLOCK
    )
    :vars
    (
      ?AUTO_290 - BLOCK
      ?AUTO_293 - BLOCK
      ?AUTO_294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_289 ) ( ON ?AUTO_288 ?AUTO_290 ) ( CLEAR ?AUTO_288 ) ( HOLDING ?AUTO_293 ) ( CLEAR ?AUTO_294 ) )
    :subtasks
    ( ( !STACK ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON ?AUTO_288 ?AUTO_289 )
      ( MAKE-ON-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_304 - BLOCK
      ?AUTO_305 - BLOCK
    )
    :vars
    (
      ?AUTO_309 - BLOCK
      ?AUTO_306 - BLOCK
      ?AUTO_310 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_304 ?AUTO_309 ) ( CLEAR ?AUTO_306 ) ( ON ?AUTO_310 ?AUTO_304 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_305 )
      ( MAKE-ON ?AUTO_304 ?AUTO_305 )
      ( MAKE-ON-VERIFY ?AUTO_304 ?AUTO_305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_694 - BLOCK
      ?AUTO_695 - BLOCK
    )
    :vars
    (
      ?AUTO_696 - BLOCK
      ?AUTO_697 - BLOCK
      ?AUTO_699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_695 ) ( ON ?AUTO_694 ?AUTO_696 ) ( ON ?AUTO_697 ?AUTO_694 ) ( ON ?AUTO_699 ?AUTO_697 ) ( CLEAR ?AUTO_699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_699 ?AUTO_697 )
      ( MAKE-ON ?AUTO_694 ?AUTO_695 )
      ( MAKE-ON-VERIFY ?AUTO_694 ?AUTO_695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4104 - BLOCK
      ?AUTO_4105 - BLOCK
    )
    :vars
    (
      ?AUTO_4109 - BLOCK
      ?AUTO_4108 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4107 - BLOCK
      ?AUTO_4113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4105 ) ( ON ?AUTO_4104 ?AUTO_4109 ) ( ON ?AUTO_4108 ?AUTO_4104 ) ( ON ?AUTO_4106 ?AUTO_4108 ) ( CLEAR ?AUTO_4106 ) ( HOLDING ?AUTO_4107 ) ( CLEAR ?AUTO_4113 ) )
    :subtasks
    ( ( !STACK ?AUTO_4107 ?AUTO_4113 )
      ( MAKE-ON ?AUTO_4104 ?AUTO_4105 )
      ( MAKE-ON-VERIFY ?AUTO_4104 ?AUTO_4105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_376 - BLOCK
      ?AUTO_377 - BLOCK
    )
    :vars
    (
      ?AUTO_378 - BLOCK
      ?AUTO_381 - BLOCK
      ?AUTO_382 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_376 ?AUTO_378 ) ( CLEAR ?AUTO_376 ) ( CLEAR ?AUTO_381 ) ( ON ?AUTO_382 ?AUTO_377 ) ( CLEAR ?AUTO_382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_382 ?AUTO_377 )
      ( MAKE-ON ?AUTO_376 ?AUTO_377 )
      ( MAKE-ON-VERIFY ?AUTO_376 ?AUTO_377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_385 - BLOCK
      ?AUTO_386 - BLOCK
    )
    :vars
    (
      ?AUTO_389 - BLOCK
      ?AUTO_391 - BLOCK
      ?AUTO_390 - BLOCK
      ?AUTO_392 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_385 ?AUTO_389 ) ( CLEAR ?AUTO_385 ) ( CLEAR ?AUTO_391 ) ( ON ?AUTO_390 ?AUTO_386 ) ( CLEAR ?AUTO_390 ) ( HOLDING ?AUTO_392 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_392 )
      ( MAKE-ON ?AUTO_385 ?AUTO_386 )
      ( MAKE-ON-VERIFY ?AUTO_385 ?AUTO_386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_403 - BLOCK
      ?AUTO_404 - BLOCK
    )
    :vars
    (
      ?AUTO_405 - BLOCK
      ?AUTO_406 - BLOCK
      ?AUTO_407 - BLOCK
      ?AUTO_410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_405 ) ( ON ?AUTO_406 ?AUTO_404 ) ( ON ?AUTO_407 ?AUTO_406 ) ( CLEAR ?AUTO_407 ) ( HOLDING ?AUTO_403 ) ( CLEAR ?AUTO_410 ) )
    :subtasks
    ( ( !STACK ?AUTO_403 ?AUTO_410 )
      ( MAKE-ON ?AUTO_403 ?AUTO_404 )
      ( MAKE-ON-VERIFY ?AUTO_403 ?AUTO_404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1454 - BLOCK
      ?AUTO_1455 - BLOCK
    )
    :vars
    (
      ?AUTO_1460 - BLOCK
      ?AUTO_1457 - BLOCK
      ?AUTO_1458 - BLOCK
      ?AUTO_1461 - BLOCK
      ?AUTO_1459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1454 ) ( CLEAR ?AUTO_1460 ) ( CLEAR ?AUTO_1457 ) ( ON ?AUTO_1458 ?AUTO_1455 ) ( ON ?AUTO_1461 ?AUTO_1458 ) ( CLEAR ?AUTO_1461 ) ( CLEAR ?AUTO_1454 ) ( ON-TABLE ?AUTO_1459 ) ( CLEAR ?AUTO_1459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1459 )
      ( MAKE-ON ?AUTO_1454 ?AUTO_1455 )
      ( MAKE-ON-VERIFY ?AUTO_1454 ?AUTO_1455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_422 - BLOCK
      ?AUTO_423 - BLOCK
    )
    :vars
    (
      ?AUTO_429 - BLOCK
      ?AUTO_427 - BLOCK
      ?AUTO_428 - BLOCK
      ?AUTO_426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_429 ) ( ON ?AUTO_427 ?AUTO_423 ) ( ON ?AUTO_428 ?AUTO_427 ) ( CLEAR ?AUTO_428 ) ( ON-TABLE ?AUTO_422 ) ( CLEAR ?AUTO_422 ) ( HOLDING ?AUTO_426 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_426 )
      ( MAKE-ON ?AUTO_422 ?AUTO_423 )
      ( MAKE-ON-VERIFY ?AUTO_422 ?AUTO_423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_431 - BLOCK
      ?AUTO_432 - BLOCK
    )
    :vars
    (
      ?AUTO_437 - BLOCK
      ?AUTO_435 - BLOCK
      ?AUTO_436 - BLOCK
      ?AUTO_438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_437 ) ( ON ?AUTO_435 ?AUTO_432 ) ( ON ?AUTO_436 ?AUTO_435 ) ( CLEAR ?AUTO_436 ) ( ON-TABLE ?AUTO_431 ) ( ON ?AUTO_438 ?AUTO_431 ) ( CLEAR ?AUTO_438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_438 ?AUTO_431 )
      ( MAKE-ON ?AUTO_431 ?AUTO_432 )
      ( MAKE-ON-VERIFY ?AUTO_431 ?AUTO_432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_441 - BLOCK
      ?AUTO_442 - BLOCK
    )
    :vars
    (
      ?AUTO_444 - BLOCK
      ?AUTO_448 - BLOCK
      ?AUTO_446 - BLOCK
      ?AUTO_445 - BLOCK
      ?AUTO_449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_444 ) ( ON ?AUTO_448 ?AUTO_442 ) ( ON ?AUTO_446 ?AUTO_448 ) ( CLEAR ?AUTO_446 ) ( ON-TABLE ?AUTO_441 ) ( ON ?AUTO_445 ?AUTO_441 ) ( CLEAR ?AUTO_445 ) ( HOLDING ?AUTO_449 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_449 )
      ( MAKE-ON ?AUTO_441 ?AUTO_442 )
      ( MAKE-ON-VERIFY ?AUTO_441 ?AUTO_442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_514 - BLOCK
      ?AUTO_515 - BLOCK
    )
    :vars
    (
      ?AUTO_516 - BLOCK
      ?AUTO_517 - BLOCK
      ?AUTO_518 - BLOCK
      ?AUTO_522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_514 ) ( ON ?AUTO_516 ?AUTO_514 ) ( CLEAR ?AUTO_516 ) ( ON ?AUTO_517 ?AUTO_515 ) ( CLEAR ?AUTO_517 ) ( HOLDING ?AUTO_518 ) ( CLEAR ?AUTO_522 ) )
    :subtasks
    ( ( !STACK ?AUTO_518 ?AUTO_522 )
      ( MAKE-ON ?AUTO_514 ?AUTO_515 )
      ( MAKE-ON-VERIFY ?AUTO_514 ?AUTO_515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_462 - BLOCK
      ?AUTO_463 - BLOCK
    )
    :vars
    (
      ?AUTO_467 - BLOCK
      ?AUTO_469 - BLOCK
      ?AUTO_468 - BLOCK
      ?AUTO_466 - BLOCK
      ?AUTO_471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_467 ) ( ON ?AUTO_469 ?AUTO_463 ) ( ON-TABLE ?AUTO_462 ) ( ON ?AUTO_468 ?AUTO_462 ) ( CLEAR ?AUTO_468 ) ( CLEAR ?AUTO_469 ) ( ON ?AUTO_466 ?AUTO_471 ) ( CLEAR ?AUTO_466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_466 ?AUTO_471 )
      ( MAKE-ON ?AUTO_462 ?AUTO_463 )
      ( MAKE-ON-VERIFY ?AUTO_462 ?AUTO_463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_483 - BLOCK
      ?AUTO_484 - BLOCK
    )
    :vars
    (
      ?AUTO_487 - BLOCK
      ?AUTO_488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_484 ) ( ON-TABLE ?AUTO_483 ) ( CLEAR ?AUTO_483 ) ( HOLDING ?AUTO_487 ) ( CLEAR ?AUTO_488 ) )
    :subtasks
    ( ( !STACK ?AUTO_487 ?AUTO_488 )
      ( MAKE-ON ?AUTO_483 ?AUTO_484 )
      ( MAKE-ON-VERIFY ?AUTO_483 ?AUTO_484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_497 - BLOCK
      ?AUTO_498 - BLOCK
    )
    :vars
    (
      ?AUTO_502 - BLOCK
      ?AUTO_499 - BLOCK
      ?AUTO_504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_498 ) ( ON-TABLE ?AUTO_497 ) ( ON ?AUTO_502 ?AUTO_497 ) ( CLEAR ?AUTO_502 ) ( HOLDING ?AUTO_499 ) ( CLEAR ?AUTO_504 ) )
    :subtasks
    ( ( !STACK ?AUTO_499 ?AUTO_504 )
      ( MAKE-ON ?AUTO_497 ?AUTO_498 )
      ( MAKE-ON-VERIFY ?AUTO_497 ?AUTO_498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_527 - BLOCK
      ?AUTO_528 - BLOCK
    )
    :vars
    (
      ?AUTO_534 - BLOCK
      ?AUTO_531 - BLOCK
      ?AUTO_533 - BLOCK
      ?AUTO_532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_527 ) ( ON ?AUTO_534 ?AUTO_527 ) ( CLEAR ?AUTO_534 ) ( ON ?AUTO_531 ?AUTO_528 ) ( CLEAR ?AUTO_533 ) ( ON ?AUTO_532 ?AUTO_531 ) ( CLEAR ?AUTO_532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_532 ?AUTO_531 )
      ( MAKE-ON ?AUTO_527 ?AUTO_528 )
      ( MAKE-ON-VERIFY ?AUTO_527 ?AUTO_528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_546 - BLOCK
      ?AUTO_547 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_550 - BLOCK
      ?AUTO_551 - BLOCK
      ?AUTO_553 - BLOCK
      ?AUTO_554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_546 ) ( ON ?AUTO_552 ?AUTO_546 ) ( CLEAR ?AUTO_552 ) ( ON ?AUTO_550 ?AUTO_547 ) ( CLEAR ?AUTO_551 ) ( ON ?AUTO_553 ?AUTO_550 ) ( ON ?AUTO_554 ?AUTO_553 ) ( CLEAR ?AUTO_554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_554 ?AUTO_553 )
      ( MAKE-ON ?AUTO_546 ?AUTO_547 )
      ( MAKE-ON-VERIFY ?AUTO_546 ?AUTO_547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
    )
    :vars
    (
      ?AUTO_2873 - BLOCK
      ?AUTO_2872 - BLOCK
      ?AUTO_2874 - BLOCK
      ?AUTO_2871 - BLOCK
      ?AUTO_2875 - BLOCK
      ?AUTO_2876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2867 ) ( CLEAR ?AUTO_2873 ) ( ON ?AUTO_2872 ?AUTO_2868 ) ( ON ?AUTO_2874 ?AUTO_2872 ) ( CLEAR ?AUTO_2867 ) ( ON ?AUTO_2871 ?AUTO_2874 ) ( CLEAR ?AUTO_2871 ) ( HOLDING ?AUTO_2875 ) ( CLEAR ?AUTO_2876 ) )
    :subtasks
    ( ( !STACK ?AUTO_2875 ?AUTO_2876 )
      ( MAKE-ON ?AUTO_2867 ?AUTO_2868 )
      ( MAKE-ON-VERIFY ?AUTO_2867 ?AUTO_2868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_568 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :vars
    (
      ?AUTO_571 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_570 - BLOCK
      ?AUTO_575 - BLOCK
      ?AUTO_572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_568 ) ( ON ?AUTO_571 ?AUTO_569 ) ( CLEAR ?AUTO_574 ) ( ON ?AUTO_570 ?AUTO_571 ) ( ON ?AUTO_575 ?AUTO_570 ) ( CLEAR ?AUTO_575 ) ( CLEAR ?AUTO_568 ) ( ON-TABLE ?AUTO_572 ) ( CLEAR ?AUTO_572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_572 )
      ( MAKE-ON ?AUTO_568 ?AUTO_569 )
      ( MAKE-ON-VERIFY ?AUTO_568 ?AUTO_569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6256 - BLOCK
      ?AUTO_6257 - BLOCK
    )
    :vars
    (
      ?AUTO_6258 - BLOCK
      ?AUTO_6262 - BLOCK
      ?AUTO_6261 - BLOCK
      ?AUTO_6263 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6258 ?AUTO_6257 ) ( ON ?AUTO_6262 ?AUTO_6258 ) ( CLEAR ?AUTO_6261 ) ( ON ?AUTO_6263 ?AUTO_6262 ) ( CLEAR ?AUTO_6263 ) ( HOLDING ?AUTO_6256 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6256 )
      ( MAKE-ON ?AUTO_6256 ?AUTO_6257 )
      ( MAKE-ON-VERIFY ?AUTO_6256 ?AUTO_6257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6265 - BLOCK
      ?AUTO_6266 - BLOCK
    )
    :vars
    (
      ?AUTO_6269 - BLOCK
      ?AUTO_6267 - BLOCK
      ?AUTO_6270 - BLOCK
      ?AUTO_6268 - BLOCK
      ?AUTO_6274 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6269 ?AUTO_6266 ) ( ON ?AUTO_6267 ?AUTO_6269 ) ( CLEAR ?AUTO_6270 ) ( ON ?AUTO_6268 ?AUTO_6267 ) ( CLEAR ?AUTO_6268 ) ( ON ?AUTO_6265 ?AUTO_6274 ) ( CLEAR ?AUTO_6265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6265 ?AUTO_6274 )
      ( MAKE-ON ?AUTO_6265 ?AUTO_6266 )
      ( MAKE-ON-VERIFY ?AUTO_6265 ?AUTO_6266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2277 - BLOCK
      ?AUTO_2278 - BLOCK
    )
    :vars
    (
      ?AUTO_2280 - BLOCK
      ?AUTO_2281 - BLOCK
      ?AUTO_2285 - BLOCK
      ?AUTO_2284 - BLOCK
      ?AUTO_2279 - BLOCK
      ?AUTO_2286 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2277 ?AUTO_2280 ) ( CLEAR ?AUTO_2277 ) ( CLEAR ?AUTO_2281 ) ( ON ?AUTO_2285 ?AUTO_2278 ) ( ON ?AUTO_2284 ?AUTO_2285 ) ( ON ?AUTO_2279 ?AUTO_2284 ) ( CLEAR ?AUTO_2279 ) ( HOLDING ?AUTO_2286 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2286 )
      ( MAKE-ON ?AUTO_2277 ?AUTO_2278 )
      ( MAKE-ON-VERIFY ?AUTO_2277 ?AUTO_2278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3146 - BLOCK
      ?AUTO_3147 - BLOCK
    )
    :vars
    (
      ?AUTO_3149 - BLOCK
      ?AUTO_3151 - BLOCK
      ?AUTO_3153 - BLOCK
      ?AUTO_3152 - BLOCK
      ?AUTO_3154 - BLOCK
      ?AUTO_3155 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3146 ?AUTO_3149 ) ( CLEAR ?AUTO_3146 ) ( CLEAR ?AUTO_3151 ) ( ON ?AUTO_3153 ?AUTO_3147 ) ( ON ?AUTO_3152 ?AUTO_3153 ) ( CLEAR ?AUTO_3152 ) ( HOLDING ?AUTO_3154 ) ( CLEAR ?AUTO_3155 ) )
    :subtasks
    ( ( !STACK ?AUTO_3154 ?AUTO_3155 )
      ( MAKE-ON ?AUTO_3146 ?AUTO_3147 )
      ( MAKE-ON-VERIFY ?AUTO_3146 ?AUTO_3147 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_655 - BLOCK
    )
    :vars
    (
      ?AUTO_658 - BLOCK
      ?AUTO_657 - BLOCK
      ?AUTO_659 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_655 ?AUTO_658 ) ( ON ?AUTO_657 ?AUTO_655 ) ( CLEAR ?AUTO_657 ) ( HOLDING ?AUTO_659 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_659 )
      ( MAKE-ON-TABLE ?AUTO_655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_687 - BLOCK
      ?AUTO_688 - BLOCK
    )
    :vars
    (
      ?AUTO_692 - BLOCK
      ?AUTO_690 - BLOCK
      ?AUTO_693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_688 ) ( ON ?AUTO_687 ?AUTO_692 ) ( ON ?AUTO_690 ?AUTO_687 ) ( CLEAR ?AUTO_690 ) ( HOLDING ?AUTO_693 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_693 )
      ( MAKE-ON ?AUTO_687 ?AUTO_688 )
      ( MAKE-ON-VERIFY ?AUTO_687 ?AUTO_688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_703 - BLOCK
      ?AUTO_704 - BLOCK
    )
    :vars
    (
      ?AUTO_705 - BLOCK
      ?AUTO_707 - BLOCK
      ?AUTO_709 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_703 ?AUTO_705 ) ( ON ?AUTO_707 ?AUTO_703 ) ( ON ?AUTO_709 ?AUTO_707 ) ( CLEAR ?AUTO_709 ) ( HOLDING ?AUTO_704 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_704 )
      ( MAKE-ON ?AUTO_703 ?AUTO_704 )
      ( MAKE-ON-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_745 - BLOCK
      ?AUTO_746 - BLOCK
    )
    :vars
    (
      ?AUTO_751 - BLOCK
      ?AUTO_747 - BLOCK
      ?AUTO_749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_746 ) ( ON-TABLE ?AUTO_745 ) ( CLEAR ?AUTO_751 ) ( ON ?AUTO_747 ?AUTO_745 ) ( ON ?AUTO_749 ?AUTO_747 ) ( CLEAR ?AUTO_749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_749 ?AUTO_747 )
      ( MAKE-ON ?AUTO_745 ?AUTO_746 )
      ( MAKE-ON-VERIFY ?AUTO_745 ?AUTO_746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_754 - BLOCK
      ?AUTO_755 - BLOCK
    )
    :vars
    (
      ?AUTO_757 - BLOCK
      ?AUTO_759 - BLOCK
      ?AUTO_760 - BLOCK
      ?AUTO_761 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_755 ) ( ON-TABLE ?AUTO_754 ) ( CLEAR ?AUTO_757 ) ( ON ?AUTO_759 ?AUTO_754 ) ( ON ?AUTO_760 ?AUTO_759 ) ( CLEAR ?AUTO_760 ) ( HOLDING ?AUTO_761 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_761 )
      ( MAKE-ON ?AUTO_754 ?AUTO_755 )
      ( MAKE-ON-VERIFY ?AUTO_754 ?AUTO_755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_762 - BLOCK
      ?AUTO_763 - BLOCK
    )
    :vars
    (
      ?AUTO_764 - BLOCK
      ?AUTO_768 - BLOCK
      ?AUTO_765 - BLOCK
      ?AUTO_769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_763 ) ( ON-TABLE ?AUTO_762 ) ( CLEAR ?AUTO_764 ) ( ON ?AUTO_768 ?AUTO_762 ) ( ON ?AUTO_765 ?AUTO_768 ) ( ON ?AUTO_769 ?AUTO_765 ) ( CLEAR ?AUTO_769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_769 ?AUTO_765 )
      ( MAKE-ON ?AUTO_762 ?AUTO_763 )
      ( MAKE-ON-VERIFY ?AUTO_762 ?AUTO_763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_772 - BLOCK
      ?AUTO_773 - BLOCK
    )
    :vars
    (
      ?AUTO_779 - BLOCK
      ?AUTO_776 - BLOCK
      ?AUTO_775 - BLOCK
      ?AUTO_777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_773 ) ( ON-TABLE ?AUTO_772 ) ( ON ?AUTO_779 ?AUTO_772 ) ( ON ?AUTO_776 ?AUTO_779 ) ( ON ?AUTO_775 ?AUTO_776 ) ( CLEAR ?AUTO_775 ) ( HOLDING ?AUTO_777 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_777 )
      ( MAKE-ON ?AUTO_772 ?AUTO_773 )
      ( MAKE-ON-VERIFY ?AUTO_772 ?AUTO_773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_804 - BLOCK
      ?AUTO_805 - BLOCK
    )
    :vars
    (
      ?AUTO_809 - BLOCK
      ?AUTO_806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_804 ) ( CLEAR ?AUTO_804 ) ( CLEAR ?AUTO_809 ) ( ON ?AUTO_806 ?AUTO_805 ) ( CLEAR ?AUTO_806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_806 ?AUTO_805 )
      ( MAKE-ON ?AUTO_804 ?AUTO_805 )
      ( MAKE-ON-VERIFY ?AUTO_804 ?AUTO_805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_812 - BLOCK
      ?AUTO_813 - BLOCK
    )
    :vars
    (
      ?AUTO_817 - BLOCK
      ?AUTO_816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_817 ) ( ON ?AUTO_816 ?AUTO_813 ) ( CLEAR ?AUTO_816 ) ( HOLDING ?AUTO_812 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_812 )
      ( MAKE-ON ?AUTO_812 ?AUTO_813 )
      ( MAKE-ON-VERIFY ?AUTO_812 ?AUTO_813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2257 - BLOCK
      ?AUTO_2258 - BLOCK
    )
    :vars
    (
      ?AUTO_2260 - BLOCK
      ?AUTO_2263 - BLOCK
      ?AUTO_2261 - BLOCK
      ?AUTO_2262 - BLOCK
      ?AUTO_2265 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2257 ?AUTO_2260 ) ( CLEAR ?AUTO_2257 ) ( CLEAR ?AUTO_2263 ) ( ON ?AUTO_2261 ?AUTO_2258 ) ( ON ?AUTO_2262 ?AUTO_2261 ) ( CLEAR ?AUTO_2262 ) ( HOLDING ?AUTO_2265 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2265 )
      ( MAKE-ON ?AUTO_2257 ?AUTO_2258 )
      ( MAKE-ON-VERIFY ?AUTO_2257 ?AUTO_2258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3183 - BLOCK
      ?AUTO_3184 - BLOCK
    )
    :vars
    (
      ?AUTO_3187 - BLOCK
      ?AUTO_3191 - BLOCK
      ?AUTO_3188 - BLOCK
      ?AUTO_3190 - BLOCK
      ?AUTO_3185 - BLOCK
      ?AUTO_3192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3183 ?AUTO_3187 ) ( ON ?AUTO_3191 ?AUTO_3184 ) ( ON ?AUTO_3188 ?AUTO_3191 ) ( CLEAR ?AUTO_3190 ) ( ON ?AUTO_3185 ?AUTO_3183 ) ( CLEAR ?AUTO_3185 ) ( ON ?AUTO_3192 ?AUTO_3188 ) ( CLEAR ?AUTO_3192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3192 ?AUTO_3188 )
      ( MAKE-ON ?AUTO_3183 ?AUTO_3184 )
      ( MAKE-ON-VERIFY ?AUTO_3183 ?AUTO_3184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5693 - BLOCK
      ?AUTO_5694 - BLOCK
    )
    :vars
    (
      ?AUTO_5699 - BLOCK
      ?AUTO_5695 - BLOCK
      ?AUTO_5703 - BLOCK
      ?AUTO_5700 - BLOCK
      ?AUTO_5697 - BLOCK
      ?AUTO_5701 - BLOCK
      ?AUTO_5696 - BLOCK
      ?AUTO_5704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5693 ?AUTO_5699 ) ( CLEAR ?AUTO_5695 ) ( ON ?AUTO_5703 ?AUTO_5693 ) ( CLEAR ?AUTO_5703 ) ( ON ?AUTO_5700 ?AUTO_5694 ) ( CLEAR ?AUTO_5697 ) ( ON ?AUTO_5701 ?AUTO_5700 ) ( ON ?AUTO_5696 ?AUTO_5701 ) ( CLEAR ?AUTO_5696 ) ( HOLDING ?AUTO_5704 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5704 )
      ( MAKE-ON ?AUTO_5693 ?AUTO_5694 )
      ( MAKE-ON-VERIFY ?AUTO_5693 ?AUTO_5694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_911 - BLOCK
      ?AUTO_912 - BLOCK
    )
    :vars
    (
      ?AUTO_915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_912 ) ( ON-TABLE ?AUTO_911 ) ( CLEAR ?AUTO_911 ) ( HOLDING ?AUTO_915 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_915 )
      ( MAKE-ON ?AUTO_911 ?AUTO_912 )
      ( MAKE-ON-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_923 - BLOCK
      ?AUTO_924 - BLOCK
    )
    :vars
    (
      ?AUTO_925 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_923 ) ( CLEAR ?AUTO_923 ) ( ON ?AUTO_925 ?AUTO_924 ) ( CLEAR ?AUTO_925 ) ( HOLDING ?AUTO_928 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_928 )
      ( MAKE-ON ?AUTO_923 ?AUTO_924 )
      ( MAKE-ON-VERIFY ?AUTO_923 ?AUTO_924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_982 - BLOCK
      ?AUTO_983 - BLOCK
    )
    :vars
    (
      ?AUTO_985 - BLOCK
      ?AUTO_986 - BLOCK
      ?AUTO_984 - BLOCK
      ?AUTO_989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_983 ) ( ON ?AUTO_982 ?AUTO_985 ) ( ON ?AUTO_986 ?AUTO_982 ) ( ON ?AUTO_984 ?AUTO_986 ) ( CLEAR ?AUTO_984 ) ( HOLDING ?AUTO_989 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_989 )
      ( MAKE-ON ?AUTO_982 ?AUTO_983 )
      ( MAKE-ON-VERIFY ?AUTO_982 ?AUTO_983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1052 - BLOCK
      ?AUTO_1053 - BLOCK
    )
    :vars
    (
      ?AUTO_1058 - BLOCK
      ?AUTO_1057 - BLOCK
      ?AUTO_1059 - BLOCK
      ?AUTO_1055 - BLOCK
      ?AUTO_1060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1053 ) ( ON ?AUTO_1052 ?AUTO_1058 ) ( ON ?AUTO_1057 ?AUTO_1052 ) ( CLEAR ?AUTO_1059 ) ( ON ?AUTO_1055 ?AUTO_1057 ) ( ON ?AUTO_1060 ?AUTO_1055 ) ( CLEAR ?AUTO_1060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1060 ?AUTO_1055 )
      ( MAKE-ON ?AUTO_1052 ?AUTO_1053 )
      ( MAKE-ON-VERIFY ?AUTO_1052 ?AUTO_1053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1063 - BLOCK
      ?AUTO_1064 - BLOCK
    )
    :vars
    (
      ?AUTO_1070 - BLOCK
      ?AUTO_1071 - BLOCK
      ?AUTO_1066 - BLOCK
      ?AUTO_1069 - BLOCK
      ?AUTO_1068 - BLOCK
      ?AUTO_1072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1064 ) ( ON ?AUTO_1063 ?AUTO_1070 ) ( ON ?AUTO_1071 ?AUTO_1063 ) ( CLEAR ?AUTO_1066 ) ( ON ?AUTO_1069 ?AUTO_1071 ) ( ON ?AUTO_1068 ?AUTO_1069 ) ( CLEAR ?AUTO_1068 ) ( HOLDING ?AUTO_1072 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1072 )
      ( MAKE-ON ?AUTO_1063 ?AUTO_1064 )
      ( MAKE-ON-VERIFY ?AUTO_1063 ?AUTO_1064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1073 - BLOCK
      ?AUTO_1074 - BLOCK
    )
    :vars
    (
      ?AUTO_1080 - BLOCK
      ?AUTO_1077 - BLOCK
      ?AUTO_1079 - BLOCK
      ?AUTO_1075 - BLOCK
      ?AUTO_1082 - BLOCK
      ?AUTO_1078 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1073 ?AUTO_1080 ) ( ON ?AUTO_1077 ?AUTO_1073 ) ( CLEAR ?AUTO_1079 ) ( ON ?AUTO_1075 ?AUTO_1077 ) ( ON ?AUTO_1082 ?AUTO_1075 ) ( CLEAR ?AUTO_1082 ) ( ON ?AUTO_1078 ?AUTO_1074 ) ( CLEAR ?AUTO_1078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1078 ?AUTO_1074 )
      ( MAKE-ON ?AUTO_1073 ?AUTO_1074 )
      ( MAKE-ON-VERIFY ?AUTO_1073 ?AUTO_1074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1128 - BLOCK
      ?AUTO_1129 - BLOCK
    )
    :vars
    (
      ?AUTO_1132 - BLOCK
      ?AUTO_1135 - BLOCK
      ?AUTO_1130 - BLOCK
      ?AUTO_1134 - BLOCK
      ?AUTO_1137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1129 ) ( ON-TABLE ?AUTO_1128 ) ( CLEAR ?AUTO_1132 ) ( ON ?AUTO_1135 ?AUTO_1128 ) ( ON ?AUTO_1130 ?AUTO_1135 ) ( CLEAR ?AUTO_1130 ) ( HOLDING ?AUTO_1134 ) ( CLEAR ?AUTO_1137 ) )
    :subtasks
    ( ( !STACK ?AUTO_1134 ?AUTO_1137 )
      ( MAKE-ON ?AUTO_1128 ?AUTO_1129 )
      ( MAKE-ON-VERIFY ?AUTO_1128 ?AUTO_1129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
    )
    :vars
    (
      ?AUTO_1171 - BLOCK
      ?AUTO_1167 - BLOCK
      ?AUTO_1165 - BLOCK
      ?AUTO_1169 - BLOCK
      ?AUTO_1170 - BLOCK
      ?AUTO_1172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1164 ) ( ON-TABLE ?AUTO_1163 ) ( CLEAR ?AUTO_1171 ) ( ON ?AUTO_1167 ?AUTO_1163 ) ( ON ?AUTO_1165 ?AUTO_1167 ) ( CLEAR ?AUTO_1169 ) ( ON ?AUTO_1170 ?AUTO_1165 ) ( ON ?AUTO_1172 ?AUTO_1170 ) ( CLEAR ?AUTO_1172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1172 ?AUTO_1170 )
      ( MAKE-ON ?AUTO_1163 ?AUTO_1164 )
      ( MAKE-ON-VERIFY ?AUTO_1163 ?AUTO_1164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1176 - BLOCK
    )
    :vars
    (
      ?AUTO_1184 - BLOCK
      ?AUTO_1179 - BLOCK
      ?AUTO_1183 - BLOCK
      ?AUTO_1178 - BLOCK
      ?AUTO_1177 - BLOCK
      ?AUTO_1181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1175 ) ( CLEAR ?AUTO_1184 ) ( ON ?AUTO_1179 ?AUTO_1175 ) ( ON ?AUTO_1183 ?AUTO_1179 ) ( CLEAR ?AUTO_1178 ) ( ON ?AUTO_1177 ?AUTO_1183 ) ( ON ?AUTO_1181 ?AUTO_1177 ) ( CLEAR ?AUTO_1181 ) ( HOLDING ?AUTO_1176 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1176 )
      ( MAKE-ON ?AUTO_1175 ?AUTO_1176 )
      ( MAKE-ON-VERIFY ?AUTO_1175 ?AUTO_1176 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1221 - BLOCK
    )
    :vars
    (
      ?AUTO_1222 - BLOCK
      ?AUTO_1224 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1221 ?AUTO_1222 ) ( CLEAR ?AUTO_1224 ) ( ON ?AUTO_1225 ?AUTO_1221 ) ( ON ?AUTO_1226 ?AUTO_1225 ) ( CLEAR ?AUTO_1226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1226 ?AUTO_1225 )
      ( MAKE-ON-TABLE ?AUTO_1221 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1221 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1229 - BLOCK
    )
    :vars
    (
      ?AUTO_1232 - BLOCK
      ?AUTO_1234 - BLOCK
      ?AUTO_1230 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1235 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1229 ?AUTO_1232 ) ( CLEAR ?AUTO_1234 ) ( ON ?AUTO_1230 ?AUTO_1229 ) ( ON ?AUTO_1231 ?AUTO_1230 ) ( CLEAR ?AUTO_1231 ) ( HOLDING ?AUTO_1235 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1235 )
      ( MAKE-ON-TABLE ?AUTO_1229 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1273 - BLOCK
      ?AUTO_1274 - BLOCK
    )
    :vars
    (
      ?AUTO_1275 - BLOCK
      ?AUTO_1276 - BLOCK
      ?AUTO_1280 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1273 ?AUTO_1275 ) ( ON ?AUTO_1276 ?AUTO_1273 ) ( CLEAR ?AUTO_1276 ) ( HOLDING ?AUTO_1274 ) ( CLEAR ?AUTO_1280 ) )
    :subtasks
    ( ( !STACK ?AUTO_1274 ?AUTO_1280 )
      ( MAKE-ON ?AUTO_1273 ?AUTO_1274 )
      ( MAKE-ON-VERIFY ?AUTO_1273 ?AUTO_1274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1293 - BLOCK
      ?AUTO_1294 - BLOCK
    )
    :vars
    (
      ?AUTO_1298 - BLOCK
      ?AUTO_1297 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1298 ?AUTO_1294 ) ( CLEAR ?AUTO_1298 ) ( HOLDING ?AUTO_1293 ) ( CLEAR ?AUTO_1297 ) )
    :subtasks
    ( ( !STACK ?AUTO_1293 ?AUTO_1297 )
      ( MAKE-ON ?AUTO_1293 ?AUTO_1294 )
      ( MAKE-ON-VERIFY ?AUTO_1293 ?AUTO_1294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1301 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :vars
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1306 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1305 ?AUTO_1302 ) ( CLEAR ?AUTO_1305 ) ( CLEAR ?AUTO_1306 ) ( ON-TABLE ?AUTO_1301 ) ( CLEAR ?AUTO_1301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1301 )
      ( MAKE-ON ?AUTO_1301 ?AUTO_1302 )
      ( MAKE-ON-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1315 - BLOCK
      ?AUTO_1316 - BLOCK
    )
    :vars
    (
      ?AUTO_1320 - BLOCK
      ?AUTO_1317 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1320 ?AUTO_1316 ) ( ON-TABLE ?AUTO_1315 ) ( CLEAR ?AUTO_1315 ) ( ON ?AUTO_1317 ?AUTO_1320 ) ( CLEAR ?AUTO_1317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1317 ?AUTO_1320 )
      ( MAKE-ON ?AUTO_1315 ?AUTO_1316 )
      ( MAKE-ON-VERIFY ?AUTO_1315 ?AUTO_1316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1330 - BLOCK
      ?AUTO_1331 - BLOCK
    )
    :vars
    (
      ?AUTO_1335 - BLOCK
      ?AUTO_1334 - BLOCK
      ?AUTO_1336 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1335 ?AUTO_1331 ) ( ON-TABLE ?AUTO_1330 ) ( CLEAR ?AUTO_1330 ) ( ON ?AUTO_1334 ?AUTO_1335 ) ( ON ?AUTO_1336 ?AUTO_1334 ) ( CLEAR ?AUTO_1336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1336 ?AUTO_1334 )
      ( MAKE-ON ?AUTO_1330 ?AUTO_1331 )
      ( MAKE-ON-VERIFY ?AUTO_1330 ?AUTO_1331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1339 - BLOCK
      ?AUTO_1340 - BLOCK
    )
    :vars
    (
      ?AUTO_1341 - BLOCK
      ?AUTO_1344 - BLOCK
      ?AUTO_1345 - BLOCK
      ?AUTO_1346 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1341 ?AUTO_1340 ) ( ON-TABLE ?AUTO_1339 ) ( CLEAR ?AUTO_1339 ) ( ON ?AUTO_1344 ?AUTO_1341 ) ( ON ?AUTO_1345 ?AUTO_1344 ) ( CLEAR ?AUTO_1345 ) ( HOLDING ?AUTO_1346 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1346 )
      ( MAKE-ON ?AUTO_1339 ?AUTO_1340 )
      ( MAKE-ON-VERIFY ?AUTO_1339 ?AUTO_1340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1390 - BLOCK
      ?AUTO_1391 - BLOCK
    )
    :vars
    (
      ?AUTO_1395 - BLOCK
      ?AUTO_1392 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1390 ) ( CLEAR ?AUTO_1395 ) ( ON ?AUTO_1392 ?AUTO_1390 ) ( ON ?AUTO_1396 ?AUTO_1392 ) ( CLEAR ?AUTO_1396 ) ( HOLDING ?AUTO_1391 ) ( CLEAR ?AUTO_1398 ) )
    :subtasks
    ( ( !STACK ?AUTO_1391 ?AUTO_1398 )
      ( MAKE-ON ?AUTO_1390 ?AUTO_1391 )
      ( MAKE-ON-VERIFY ?AUTO_1390 ?AUTO_1391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1410 - BLOCK
      ?AUTO_1411 - BLOCK
    )
    :vars
    (
      ?AUTO_1416 - BLOCK
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
      ?AUTO_1418 - BLOCK
      ?AUTO_1417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1410 ) ( CLEAR ?AUTO_1416 ) ( ON ?AUTO_1414 ?AUTO_1410 ) ( ON ?AUTO_1415 ?AUTO_1414 ) ( CLEAR ?AUTO_1415 ) ( CLEAR ?AUTO_1418 ) ( ON ?AUTO_1417 ?AUTO_1411 ) ( CLEAR ?AUTO_1417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1417 ?AUTO_1411 )
      ( MAKE-ON ?AUTO_1410 ?AUTO_1411 )
      ( MAKE-ON-VERIFY ?AUTO_1410 ?AUTO_1411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3305 - BLOCK
      ?AUTO_3306 - BLOCK
    )
    :vars
    (
      ?AUTO_3309 - BLOCK
      ?AUTO_3307 - BLOCK
      ?AUTO_3308 - BLOCK
      ?AUTO_3312 - BLOCK
      ?AUTO_3313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3305 ) ( CLEAR ?AUTO_3305 ) ( ON ?AUTO_3309 ?AUTO_3306 ) ( CLEAR ?AUTO_3307 ) ( ON ?AUTO_3308 ?AUTO_3309 ) ( CLEAR ?AUTO_3308 ) ( HOLDING ?AUTO_3312 ) ( CLEAR ?AUTO_3313 ) )
    :subtasks
    ( ( !STACK ?AUTO_3312 ?AUTO_3313 )
      ( MAKE-ON ?AUTO_3305 ?AUTO_3306 )
      ( MAKE-ON-VERIFY ?AUTO_3305 ?AUTO_3306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2153 - BLOCK
      ?AUTO_2154 - BLOCK
    )
    :vars
    (
      ?AUTO_2156 - BLOCK
      ?AUTO_2155 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2156 ?AUTO_2154 ) ( ON ?AUTO_2155 ?AUTO_2156 ) ( CLEAR ?AUTO_2155 ) ( HOLDING ?AUTO_2153 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2153 )
      ( MAKE-ON ?AUTO_2153 ?AUTO_2154 )
      ( MAKE-ON-VERIFY ?AUTO_2153 ?AUTO_2154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2266 - BLOCK
      ?AUTO_2267 - BLOCK
    )
    :vars
    (
      ?AUTO_2270 - BLOCK
      ?AUTO_2271 - BLOCK
      ?AUTO_2273 - BLOCK
      ?AUTO_2272 - BLOCK
      ?AUTO_2268 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2266 ?AUTO_2270 ) ( CLEAR ?AUTO_2266 ) ( CLEAR ?AUTO_2271 ) ( ON ?AUTO_2273 ?AUTO_2267 ) ( ON ?AUTO_2272 ?AUTO_2273 ) ( ON ?AUTO_2268 ?AUTO_2272 ) ( CLEAR ?AUTO_2268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2268 ?AUTO_2272 )
      ( MAKE-ON ?AUTO_2266 ?AUTO_2267 )
      ( MAKE-ON-VERIFY ?AUTO_2266 ?AUTO_2267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5474 - BLOCK
      ?AUTO_5469 - BLOCK
    )
    :vars
    (
      ?AUTO_5475 - BLOCK
      ?AUTO_5477 - BLOCK
      ?AUTO_5472 - BLOCK
      ?AUTO_5470 - BLOCK
      ?AUTO_5476 - BLOCK
      ?AUTO_5478 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5474 ?AUTO_5475 ) ( ON ?AUTO_5477 ?AUTO_5469 ) ( ON ?AUTO_5472 ?AUTO_5477 ) ( ON ?AUTO_5470 ?AUTO_5472 ) ( ON ?AUTO_5476 ?AUTO_5470 ) ( CLEAR ?AUTO_5476 ) ( ON ?AUTO_5478 ?AUTO_5474 ) ( CLEAR ?AUTO_5478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5478 ?AUTO_5474 )
      ( MAKE-ON ?AUTO_5474 ?AUTO_5469 )
      ( MAKE-ON-VERIFY ?AUTO_5474 ?AUTO_5469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1507 - BLOCK
      ?AUTO_1508 - BLOCK
    )
    :vars
    (
      ?AUTO_1514 - BLOCK
      ?AUTO_1509 - BLOCK
      ?AUTO_1513 - BLOCK
      ?AUTO_1510 - BLOCK
      ?AUTO_1515 - BLOCK
      ?AUTO_1516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1514 ) ( ON ?AUTO_1509 ?AUTO_1508 ) ( ON ?AUTO_1513 ?AUTO_1509 ) ( ON-TABLE ?AUTO_1510 ) ( CLEAR ?AUTO_1510 ) ( ON ?AUTO_1507 ?AUTO_1513 ) ( ON ?AUTO_1515 ?AUTO_1507 ) ( CLEAR ?AUTO_1515 ) ( HOLDING ?AUTO_1516 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1516 )
      ( MAKE-ON ?AUTO_1507 ?AUTO_1508 )
      ( MAKE-ON-VERIFY ?AUTO_1507 ?AUTO_1508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
    )
    :vars
    (
      ?AUTO_1552 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1548 ?AUTO_1552 ) ( CLEAR ?AUTO_1548 ) ( HOLDING ?AUTO_1549 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1549 )
      ( MAKE-ON ?AUTO_1548 ?AUTO_1549 )
      ( MAKE-ON-VERIFY ?AUTO_1548 ?AUTO_1549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1611 - BLOCK
      ?AUTO_1612 - BLOCK
    )
    :vars
    (
      ?AUTO_1616 - BLOCK
      ?AUTO_1614 - BLOCK
      ?AUTO_1613 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1611 ?AUTO_1616 ) ( ON ?AUTO_1614 ?AUTO_1612 ) ( CLEAR ?AUTO_1614 ) ( ON ?AUTO_1613 ?AUTO_1611 ) ( CLEAR ?AUTO_1613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1613 ?AUTO_1611 )
      ( MAKE-ON ?AUTO_1611 ?AUTO_1612 )
      ( MAKE-ON-VERIFY ?AUTO_1611 ?AUTO_1612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1659 - BLOCK
      ?AUTO_1660 - BLOCK
    )
    :vars
    (
      ?AUTO_1661 - BLOCK
      ?AUTO_1664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1659 ) ( CLEAR ?AUTO_1661 ) ( ON ?AUTO_1664 ?AUTO_1659 ) ( CLEAR ?AUTO_1664 ) ( HOLDING ?AUTO_1660 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1660 )
      ( MAKE-ON ?AUTO_1659 ?AUTO_1660 )
      ( MAKE-ON-VERIFY ?AUTO_1659 ?AUTO_1660 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1736 - BLOCK
    )
    :vars
    (
      ?AUTO_1737 - BLOCK
      ?AUTO_1738 - BLOCK
      ?AUTO_1740 - BLOCK
      ?AUTO_1741 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1736 ?AUTO_1737 ) ( ON ?AUTO_1738 ?AUTO_1736 ) ( CLEAR ?AUTO_1738 ) ( HOLDING ?AUTO_1740 ) ( CLEAR ?AUTO_1741 ) )
    :subtasks
    ( ( !STACK ?AUTO_1740 ?AUTO_1741 )
      ( MAKE-ON-TABLE ?AUTO_1736 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1736 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1761 - BLOCK
    )
    :vars
    (
      ?AUTO_1763 - BLOCK
      ?AUTO_1762 - BLOCK
      ?AUTO_1767 - BLOCK
      ?AUTO_1764 - BLOCK
      ?AUTO_1766 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1761 ?AUTO_1763 ) ( ON ?AUTO_1762 ?AUTO_1761 ) ( CLEAR ?AUTO_1767 ) ( ON ?AUTO_1764 ?AUTO_1762 ) ( ON ?AUTO_1766 ?AUTO_1764 ) ( CLEAR ?AUTO_1766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1766 ?AUTO_1764 )
      ( MAKE-ON-TABLE ?AUTO_1761 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1761 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1770 - BLOCK
    )
    :vars
    (
      ?AUTO_1774 - BLOCK
      ?AUTO_1771 - BLOCK
      ?AUTO_1776 - BLOCK
      ?AUTO_1773 - BLOCK
      ?AUTO_1772 - BLOCK
      ?AUTO_1777 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1770 ?AUTO_1774 ) ( ON ?AUTO_1771 ?AUTO_1770 ) ( CLEAR ?AUTO_1776 ) ( ON ?AUTO_1773 ?AUTO_1771 ) ( ON ?AUTO_1772 ?AUTO_1773 ) ( CLEAR ?AUTO_1772 ) ( HOLDING ?AUTO_1777 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1777 )
      ( MAKE-ON-TABLE ?AUTO_1770 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1844 - BLOCK
      ?AUTO_1845 - BLOCK
    )
    :vars
    (
      ?AUTO_1849 - BLOCK
      ?AUTO_1851 - BLOCK
      ?AUTO_1848 - BLOCK
      ?AUTO_1850 - BLOCK
      ?AUTO_1853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1844 ) ( ON ?AUTO_1849 ?AUTO_1844 ) ( ON ?AUTO_1851 ?AUTO_1849 ) ( CLEAR ?AUTO_1851 ) ( ON ?AUTO_1848 ?AUTO_1845 ) ( CLEAR ?AUTO_1848 ) ( HOLDING ?AUTO_1850 ) ( CLEAR ?AUTO_1853 ) )
    :subtasks
    ( ( !STACK ?AUTO_1850 ?AUTO_1853 )
      ( MAKE-ON ?AUTO_1844 ?AUTO_1845 )
      ( MAKE-ON-VERIFY ?AUTO_1844 ?AUTO_1845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1854 - BLOCK
      ?AUTO_1855 - BLOCK
    )
    :vars
    (
      ?AUTO_1858 - BLOCK
      ?AUTO_1860 - BLOCK
      ?AUTO_1857 - BLOCK
      ?AUTO_1862 - BLOCK
      ?AUTO_1861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1854 ) ( ON ?AUTO_1858 ?AUTO_1854 ) ( ON ?AUTO_1860 ?AUTO_1858 ) ( ON ?AUTO_1857 ?AUTO_1855 ) ( CLEAR ?AUTO_1857 ) ( CLEAR ?AUTO_1862 ) ( ON ?AUTO_1861 ?AUTO_1860 ) ( CLEAR ?AUTO_1861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1861 ?AUTO_1860 )
      ( MAKE-ON ?AUTO_1854 ?AUTO_1855 )
      ( MAKE-ON-VERIFY ?AUTO_1854 ?AUTO_1855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1865 - BLOCK
      ?AUTO_1866 - BLOCK
    )
    :vars
    (
      ?AUTO_1873 - BLOCK
      ?AUTO_1871 - BLOCK
      ?AUTO_1867 - BLOCK
      ?AUTO_1869 - BLOCK
      ?AUTO_1868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1865 ) ( ON ?AUTO_1873 ?AUTO_1865 ) ( ON ?AUTO_1871 ?AUTO_1873 ) ( ON ?AUTO_1867 ?AUTO_1866 ) ( CLEAR ?AUTO_1867 ) ( ON ?AUTO_1869 ?AUTO_1871 ) ( CLEAR ?AUTO_1869 ) ( HOLDING ?AUTO_1868 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1868 )
      ( MAKE-ON ?AUTO_1865 ?AUTO_1866 )
      ( MAKE-ON-VERIFY ?AUTO_1865 ?AUTO_1866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1875 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :vars
    (
      ?AUTO_1880 - BLOCK
      ?AUTO_1882 - BLOCK
      ?AUTO_1878 - BLOCK
      ?AUTO_1883 - BLOCK
      ?AUTO_1877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1875 ) ( ON ?AUTO_1880 ?AUTO_1875 ) ( ON ?AUTO_1882 ?AUTO_1880 ) ( ON ?AUTO_1878 ?AUTO_1876 ) ( CLEAR ?AUTO_1878 ) ( ON ?AUTO_1883 ?AUTO_1882 ) ( ON ?AUTO_1877 ?AUTO_1883 ) ( CLEAR ?AUTO_1877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1877 ?AUTO_1883 )
      ( MAKE-ON ?AUTO_1875 ?AUTO_1876 )
      ( MAKE-ON-VERIFY ?AUTO_1875 ?AUTO_1876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1886 - BLOCK
      ?AUTO_1887 - BLOCK
    )
    :vars
    (
      ?AUTO_1894 - BLOCK
      ?AUTO_1890 - BLOCK
      ?AUTO_1893 - BLOCK
      ?AUTO_1889 - BLOCK
      ?AUTO_1891 - BLOCK
      ?AUTO_1895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1886 ) ( ON ?AUTO_1894 ?AUTO_1886 ) ( ON ?AUTO_1890 ?AUTO_1894 ) ( ON ?AUTO_1893 ?AUTO_1887 ) ( CLEAR ?AUTO_1893 ) ( ON ?AUTO_1889 ?AUTO_1890 ) ( ON ?AUTO_1891 ?AUTO_1889 ) ( CLEAR ?AUTO_1891 ) ( HOLDING ?AUTO_1895 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1895 )
      ( MAKE-ON ?AUTO_1886 ?AUTO_1887 )
      ( MAKE-ON-VERIFY ?AUTO_1886 ?AUTO_1887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1896 - BLOCK
      ?AUTO_1897 - BLOCK
    )
    :vars
    (
      ?AUTO_1901 - BLOCK
      ?AUTO_1903 - BLOCK
      ?AUTO_1900 - BLOCK
      ?AUTO_1905 - BLOCK
      ?AUTO_1902 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1896 ) ( ON ?AUTO_1901 ?AUTO_1896 ) ( ON ?AUTO_1903 ?AUTO_1901 ) ( ON ?AUTO_1900 ?AUTO_1897 ) ( ON ?AUTO_1905 ?AUTO_1903 ) ( ON ?AUTO_1902 ?AUTO_1905 ) ( CLEAR ?AUTO_1902 ) ( ON ?AUTO_1904 ?AUTO_1900 ) ( CLEAR ?AUTO_1904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1904 ?AUTO_1900 )
      ( MAKE-ON ?AUTO_1896 ?AUTO_1897 )
      ( MAKE-ON-VERIFY ?AUTO_1896 ?AUTO_1897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1981 - BLOCK
      ?AUTO_1982 - BLOCK
    )
    :vars
    (
      ?AUTO_1983 - BLOCK
      ?AUTO_1987 - BLOCK
      ?AUTO_1988 - BLOCK
      ?AUTO_1985 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1983 ?AUTO_1982 ) ( ON ?AUTO_1981 ?AUTO_1983 ) ( CLEAR ?AUTO_1987 ) ( ON ?AUTO_1988 ?AUTO_1981 ) ( ON ?AUTO_1985 ?AUTO_1988 ) ( CLEAR ?AUTO_1985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1985 ?AUTO_1988 )
      ( MAKE-ON ?AUTO_1981 ?AUTO_1982 )
      ( MAKE-ON-VERIFY ?AUTO_1981 ?AUTO_1982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1991 - BLOCK
      ?AUTO_1992 - BLOCK
    )
    :vars
    (
      ?AUTO_1996 - BLOCK
      ?AUTO_1993 - BLOCK
      ?AUTO_1995 - BLOCK
      ?AUTO_1994 - BLOCK
      ?AUTO_1999 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1996 ?AUTO_1992 ) ( ON ?AUTO_1991 ?AUTO_1996 ) ( CLEAR ?AUTO_1993 ) ( ON ?AUTO_1995 ?AUTO_1991 ) ( ON ?AUTO_1994 ?AUTO_1995 ) ( CLEAR ?AUTO_1994 ) ( HOLDING ?AUTO_1999 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1999 )
      ( MAKE-ON ?AUTO_1991 ?AUTO_1992 )
      ( MAKE-ON-VERIFY ?AUTO_1991 ?AUTO_1992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3437 - BLOCK
      ?AUTO_3438 - BLOCK
    )
    :vars
    (
      ?AUTO_3440 - BLOCK
      ?AUTO_3443 - BLOCK
      ?AUTO_3444 - BLOCK
      ?AUTO_3442 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3437 ?AUTO_3440 ) ( ON ?AUTO_3443 ?AUTO_3438 ) ( CLEAR ?AUTO_3443 ) ( ON ?AUTO_3444 ?AUTO_3437 ) ( ON ?AUTO_3442 ?AUTO_3444 ) ( CLEAR ?AUTO_3442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3442 ?AUTO_3444 )
      ( MAKE-ON ?AUTO_3437 ?AUTO_3438 )
      ( MAKE-ON-VERIFY ?AUTO_3437 ?AUTO_3438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3726 - BLOCK
      ?AUTO_3727 - BLOCK
    )
    :vars
    (
      ?AUTO_3729 - BLOCK
      ?AUTO_3734 - BLOCK
      ?AUTO_3733 - BLOCK
      ?AUTO_3731 - BLOCK
      ?AUTO_3728 - BLOCK
      ?AUTO_3735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3726 ?AUTO_3729 ) ( ON ?AUTO_3734 ?AUTO_3727 ) ( CLEAR ?AUTO_3734 ) ( ON ?AUTO_3733 ?AUTO_3726 ) ( CLEAR ?AUTO_3731 ) ( ON ?AUTO_3728 ?AUTO_3733 ) ( CLEAR ?AUTO_3728 ) ( HOLDING ?AUTO_3735 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3735 )
      ( MAKE-ON ?AUTO_3726 ?AUTO_3727 )
      ( MAKE-ON-VERIFY ?AUTO_3726 ?AUTO_3727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3759 - BLOCK
      ?AUTO_3760 - BLOCK
    )
    :vars
    (
      ?AUTO_3761 - BLOCK
      ?AUTO_3767 - BLOCK
      ?AUTO_3762 - BLOCK
      ?AUTO_3768 - BLOCK
      ?AUTO_3763 - BLOCK
      ?AUTO_3764 - BLOCK
      ?AUTO_3769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3759 ?AUTO_3761 ) ( ON ?AUTO_3767 ?AUTO_3760 ) ( ON ?AUTO_3762 ?AUTO_3759 ) ( CLEAR ?AUTO_3768 ) ( ON ?AUTO_3763 ?AUTO_3762 ) ( ON ?AUTO_3764 ?AUTO_3763 ) ( CLEAR ?AUTO_3764 ) ( ON ?AUTO_3769 ?AUTO_3767 ) ( CLEAR ?AUTO_3769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3769 ?AUTO_3767 )
      ( MAKE-ON ?AUTO_3759 ?AUTO_3760 )
      ( MAKE-ON-VERIFY ?AUTO_3759 ?AUTO_3760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2287 - BLOCK
      ?AUTO_2288 - BLOCK
    )
    :vars
    (
      ?AUTO_2295 - BLOCK
      ?AUTO_2291 - BLOCK
      ?AUTO_2292 - BLOCK
      ?AUTO_2293 - BLOCK
      ?AUTO_2294 - BLOCK
      ?AUTO_2296 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2287 ?AUTO_2295 ) ( CLEAR ?AUTO_2287 ) ( CLEAR ?AUTO_2291 ) ( ON ?AUTO_2292 ?AUTO_2288 ) ( ON ?AUTO_2293 ?AUTO_2292 ) ( ON ?AUTO_2294 ?AUTO_2293 ) ( ON ?AUTO_2296 ?AUTO_2294 ) ( CLEAR ?AUTO_2296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2296 ?AUTO_2294 )
      ( MAKE-ON ?AUTO_2287 ?AUTO_2288 )
      ( MAKE-ON-VERIFY ?AUTO_2287 ?AUTO_2288 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2367 - BLOCK
    )
    :vars
    (
      ?AUTO_2369 - BLOCK
      ?AUTO_2371 - BLOCK
      ?AUTO_2372 - BLOCK
      ?AUTO_2370 - BLOCK
      ?AUTO_2373 - BLOCK
      ?AUTO_2374 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2367 ?AUTO_2369 ) ( ON ?AUTO_2371 ?AUTO_2367 ) ( CLEAR ?AUTO_2372 ) ( ON ?AUTO_2370 ?AUTO_2371 ) ( CLEAR ?AUTO_2370 ) ( HOLDING ?AUTO_2373 ) ( CLEAR ?AUTO_2374 ) )
    :subtasks
    ( ( !STACK ?AUTO_2373 ?AUTO_2374 )
      ( MAKE-ON-TABLE ?AUTO_2367 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2829 - BLOCK
      ?AUTO_2830 - BLOCK
    )
    :vars
    (
      ?AUTO_2833 - BLOCK
      ?AUTO_2835 - BLOCK
      ?AUTO_2834 - BLOCK
      ?AUTO_2836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2829 ) ( ON ?AUTO_2833 ?AUTO_2829 ) ( CLEAR ?AUTO_2833 ) ( CLEAR ?AUTO_2835 ) ( ON ?AUTO_2834 ?AUTO_2830 ) ( CLEAR ?AUTO_2834 ) ( HOLDING ?AUTO_2836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2836 )
      ( MAKE-ON ?AUTO_2829 ?AUTO_2830 )
      ( MAKE-ON-VERIFY ?AUTO_2829 ?AUTO_2830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2885 - BLOCK
      ?AUTO_2886 - BLOCK
    )
    :vars
    (
      ?AUTO_2891 - BLOCK
      ?AUTO_2892 - BLOCK
      ?AUTO_2887 - BLOCK
      ?AUTO_2888 - BLOCK
      ?AUTO_2889 - BLOCK
      ?AUTO_2893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2885 ) ( CLEAR ?AUTO_2891 ) ( ON ?AUTO_2892 ?AUTO_2886 ) ( ON ?AUTO_2887 ?AUTO_2892 ) ( ON ?AUTO_2888 ?AUTO_2887 ) ( CLEAR ?AUTO_2888 ) ( CLEAR ?AUTO_2889 ) ( ON ?AUTO_2893 ?AUTO_2885 ) ( CLEAR ?AUTO_2893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2893 ?AUTO_2885 )
      ( MAKE-ON ?AUTO_2885 ?AUTO_2886 )
      ( MAKE-ON-VERIFY ?AUTO_2885 ?AUTO_2886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2897 - BLOCK
      ?AUTO_2898 - BLOCK
    )
    :vars
    (
      ?AUTO_2905 - BLOCK
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
      ?AUTO_2903 - BLOCK
      ?AUTO_2906 - BLOCK
      ?AUTO_2904 - BLOCK
      ?AUTO_2907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2897 ) ( CLEAR ?AUTO_2905 ) ( ON ?AUTO_2901 ?AUTO_2898 ) ( ON ?AUTO_2902 ?AUTO_2901 ) ( ON ?AUTO_2903 ?AUTO_2902 ) ( CLEAR ?AUTO_2903 ) ( CLEAR ?AUTO_2906 ) ( ON ?AUTO_2904 ?AUTO_2897 ) ( CLEAR ?AUTO_2904 ) ( HOLDING ?AUTO_2907 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2907 )
      ( MAKE-ON ?AUTO_2897 ?AUTO_2898 )
      ( MAKE-ON-VERIFY ?AUTO_2897 ?AUTO_2898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2908 - BLOCK
      ?AUTO_2909 - BLOCK
    )
    :vars
    (
      ?AUTO_2918 - BLOCK
      ?AUTO_2913 - BLOCK
      ?AUTO_2917 - BLOCK
      ?AUTO_2916 - BLOCK
      ?AUTO_2914 - BLOCK
      ?AUTO_2912 - BLOCK
      ?AUTO_2910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2908 ) ( CLEAR ?AUTO_2918 ) ( ON ?AUTO_2913 ?AUTO_2909 ) ( ON ?AUTO_2917 ?AUTO_2913 ) ( ON ?AUTO_2916 ?AUTO_2917 ) ( CLEAR ?AUTO_2916 ) ( CLEAR ?AUTO_2914 ) ( ON ?AUTO_2912 ?AUTO_2908 ) ( ON ?AUTO_2910 ?AUTO_2912 ) ( CLEAR ?AUTO_2910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2910 ?AUTO_2912 )
      ( MAKE-ON ?AUTO_2908 ?AUTO_2909 )
      ( MAKE-ON-VERIFY ?AUTO_2908 ?AUTO_2909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2921 - BLOCK
      ?AUTO_2922 - BLOCK
    )
    :vars
    (
      ?AUTO_2924 - BLOCK
      ?AUTO_2927 - BLOCK
      ?AUTO_2925 - BLOCK
      ?AUTO_2926 - BLOCK
      ?AUTO_2931 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2929 - BLOCK
      ?AUTO_2932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2921 ) ( CLEAR ?AUTO_2924 ) ( ON ?AUTO_2927 ?AUTO_2922 ) ( ON ?AUTO_2925 ?AUTO_2927 ) ( ON ?AUTO_2926 ?AUTO_2925 ) ( CLEAR ?AUTO_2926 ) ( CLEAR ?AUTO_2931 ) ( ON ?AUTO_2930 ?AUTO_2921 ) ( ON ?AUTO_2929 ?AUTO_2930 ) ( CLEAR ?AUTO_2929 ) ( HOLDING ?AUTO_2932 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2932 )
      ( MAKE-ON ?AUTO_2921 ?AUTO_2922 )
      ( MAKE-ON-VERIFY ?AUTO_2921 ?AUTO_2922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2933 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :vars
    (
      ?AUTO_2937 - BLOCK
      ?AUTO_2944 - BLOCK
      ?AUTO_2942 - BLOCK
      ?AUTO_2941 - BLOCK
      ?AUTO_2938 - BLOCK
      ?AUTO_2935 - BLOCK
      ?AUTO_2936 - BLOCK
      ?AUTO_2943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2933 ) ( CLEAR ?AUTO_2937 ) ( ON ?AUTO_2944 ?AUTO_2934 ) ( ON ?AUTO_2942 ?AUTO_2944 ) ( ON ?AUTO_2941 ?AUTO_2942 ) ( CLEAR ?AUTO_2941 ) ( CLEAR ?AUTO_2938 ) ( ON ?AUTO_2935 ?AUTO_2933 ) ( ON ?AUTO_2936 ?AUTO_2935 ) ( ON ?AUTO_2943 ?AUTO_2936 ) ( CLEAR ?AUTO_2943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2943 ?AUTO_2936 )
      ( MAKE-ON ?AUTO_2933 ?AUTO_2934 )
      ( MAKE-ON-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2947 - BLOCK
      ?AUTO_2948 - BLOCK
    )
    :vars
    (
      ?AUTO_2954 - BLOCK
      ?AUTO_2951 - BLOCK
      ?AUTO_2957 - BLOCK
      ?AUTO_2953 - BLOCK
      ?AUTO_2958 - BLOCK
      ?AUTO_2950 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2956 - BLOCK
      ?AUTO_2959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2947 ) ( CLEAR ?AUTO_2954 ) ( ON ?AUTO_2951 ?AUTO_2948 ) ( ON ?AUTO_2957 ?AUTO_2951 ) ( ON ?AUTO_2953 ?AUTO_2957 ) ( CLEAR ?AUTO_2953 ) ( CLEAR ?AUTO_2958 ) ( ON ?AUTO_2950 ?AUTO_2947 ) ( ON ?AUTO_2955 ?AUTO_2950 ) ( ON ?AUTO_2956 ?AUTO_2955 ) ( CLEAR ?AUTO_2956 ) ( HOLDING ?AUTO_2959 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2959 )
      ( MAKE-ON ?AUTO_2947 ?AUTO_2948 )
      ( MAKE-ON-VERIFY ?AUTO_2947 ?AUTO_2948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2960 - BLOCK
      ?AUTO_2961 - BLOCK
    )
    :vars
    (
      ?AUTO_2967 - BLOCK
      ?AUTO_2971 - BLOCK
      ?AUTO_2962 - BLOCK
      ?AUTO_2970 - BLOCK
      ?AUTO_2965 - BLOCK
      ?AUTO_2964 - BLOCK
      ?AUTO_2963 - BLOCK
      ?AUTO_2968 - BLOCK
      ?AUTO_2972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2960 ) ( CLEAR ?AUTO_2967 ) ( ON ?AUTO_2971 ?AUTO_2961 ) ( ON ?AUTO_2962 ?AUTO_2971 ) ( ON ?AUTO_2970 ?AUTO_2962 ) ( CLEAR ?AUTO_2970 ) ( CLEAR ?AUTO_2965 ) ( ON ?AUTO_2964 ?AUTO_2960 ) ( ON ?AUTO_2963 ?AUTO_2964 ) ( ON ?AUTO_2968 ?AUTO_2963 ) ( ON ?AUTO_2972 ?AUTO_2968 ) ( CLEAR ?AUTO_2972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2972 ?AUTO_2968 )
      ( MAKE-ON ?AUTO_2960 ?AUTO_2961 )
      ( MAKE-ON-VERIFY ?AUTO_2960 ?AUTO_2961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3156 - BLOCK
      ?AUTO_3157 - BLOCK
    )
    :vars
    (
      ?AUTO_3160 - BLOCK
      ?AUTO_3162 - BLOCK
      ?AUTO_3163 - BLOCK
      ?AUTO_3164 - BLOCK
      ?AUTO_3165 - BLOCK
      ?AUTO_3158 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3156 ?AUTO_3160 ) ( CLEAR ?AUTO_3162 ) ( ON ?AUTO_3163 ?AUTO_3157 ) ( ON ?AUTO_3164 ?AUTO_3163 ) ( CLEAR ?AUTO_3164 ) ( CLEAR ?AUTO_3165 ) ( ON ?AUTO_3158 ?AUTO_3156 ) ( CLEAR ?AUTO_3158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3158 ?AUTO_3156 )
      ( MAKE-ON ?AUTO_3156 ?AUTO_3157 )
      ( MAKE-ON-VERIFY ?AUTO_3156 ?AUTO_3157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3168 - BLOCK
      ?AUTO_3169 - BLOCK
    )
    :vars
    (
      ?AUTO_3171 - BLOCK
      ?AUTO_3177 - BLOCK
      ?AUTO_3172 - BLOCK
      ?AUTO_3173 - BLOCK
      ?AUTO_3170 - BLOCK
      ?AUTO_3175 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3168 ?AUTO_3171 ) ( ON ?AUTO_3177 ?AUTO_3169 ) ( ON ?AUTO_3172 ?AUTO_3177 ) ( CLEAR ?AUTO_3172 ) ( CLEAR ?AUTO_3173 ) ( ON ?AUTO_3170 ?AUTO_3168 ) ( CLEAR ?AUTO_3170 ) ( HOLDING ?AUTO_3175 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3175 )
      ( MAKE-ON ?AUTO_3168 ?AUTO_3169 )
      ( MAKE-ON-VERIFY ?AUTO_3168 ?AUTO_3169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3288 - BLOCK
      ?AUTO_3289 - BLOCK
    )
    :vars
    (
      ?AUTO_3293 - BLOCK
      ?AUTO_3292 - BLOCK
      ?AUTO_3295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3288 ) ( CLEAR ?AUTO_3288 ) ( ON ?AUTO_3293 ?AUTO_3289 ) ( CLEAR ?AUTO_3293 ) ( HOLDING ?AUTO_3292 ) ( CLEAR ?AUTO_3295 ) )
    :subtasks
    ( ( !STACK ?AUTO_3292 ?AUTO_3295 )
      ( MAKE-ON ?AUTO_3288 ?AUTO_3289 )
      ( MAKE-ON-VERIFY ?AUTO_3288 ?AUTO_3289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3428 - BLOCK
      ?AUTO_3429 - BLOCK
    )
    :vars
    (
      ?AUTO_3432 - BLOCK
      ?AUTO_3431 - BLOCK
      ?AUTO_3430 - BLOCK
      ?AUTO_3435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3428 ?AUTO_3432 ) ( ON ?AUTO_3431 ?AUTO_3429 ) ( CLEAR ?AUTO_3431 ) ( ON ?AUTO_3430 ?AUTO_3428 ) ( CLEAR ?AUTO_3430 ) ( HOLDING ?AUTO_3435 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3435 )
      ( MAKE-ON ?AUTO_3428 ?AUTO_3429 )
      ( MAKE-ON-VERIFY ?AUTO_3428 ?AUTO_3429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3649 - BLOCK
      ?AUTO_3650 - BLOCK
    )
    :vars
    (
      ?AUTO_3652 - BLOCK
      ?AUTO_3651 - BLOCK
      ?AUTO_3654 - BLOCK
      ?AUTO_3653 - BLOCK
      ?AUTO_3656 - BLOCK
      ?AUTO_3657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3649 ?AUTO_3652 ) ( CLEAR ?AUTO_3651 ) ( ON ?AUTO_3654 ?AUTO_3650 ) ( ON ?AUTO_3653 ?AUTO_3654 ) ( CLEAR ?AUTO_3653 ) ( ON ?AUTO_3656 ?AUTO_3649 ) ( ON ?AUTO_3657 ?AUTO_3656 ) ( CLEAR ?AUTO_3657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3657 ?AUTO_3656 )
      ( MAKE-ON ?AUTO_3649 ?AUTO_3650 )
      ( MAKE-ON-VERIFY ?AUTO_3649 ?AUTO_3650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3706 - BLOCK
      ?AUTO_3707 - BLOCK
    )
    :vars
    (
      ?AUTO_3711 - BLOCK
      ?AUTO_3710 - BLOCK
      ?AUTO_3712 - BLOCK
      ?AUTO_3713 - BLOCK
      ?AUTO_3714 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3706 ?AUTO_3711 ) ( ON ?AUTO_3710 ?AUTO_3707 ) ( CLEAR ?AUTO_3710 ) ( ON ?AUTO_3712 ?AUTO_3706 ) ( CLEAR ?AUTO_3712 ) ( HOLDING ?AUTO_3713 ) ( CLEAR ?AUTO_3714 ) )
    :subtasks
    ( ( !STACK ?AUTO_3713 ?AUTO_3714 )
      ( MAKE-ON ?AUTO_3706 ?AUTO_3707 )
      ( MAKE-ON-VERIFY ?AUTO_3706 ?AUTO_3707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3736 - BLOCK
      ?AUTO_3737 - BLOCK
    )
    :vars
    (
      ?AUTO_3739 - BLOCK
      ?AUTO_3741 - BLOCK
      ?AUTO_3740 - BLOCK
      ?AUTO_3744 - BLOCK
      ?AUTO_3738 - BLOCK
      ?AUTO_3745 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3736 ?AUTO_3739 ) ( ON ?AUTO_3741 ?AUTO_3737 ) ( CLEAR ?AUTO_3741 ) ( ON ?AUTO_3740 ?AUTO_3736 ) ( CLEAR ?AUTO_3744 ) ( ON ?AUTO_3738 ?AUTO_3740 ) ( ON ?AUTO_3745 ?AUTO_3738 ) ( CLEAR ?AUTO_3745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3745 ?AUTO_3738 )
      ( MAKE-ON ?AUTO_3736 ?AUTO_3737 )
      ( MAKE-ON-VERIFY ?AUTO_3736 ?AUTO_3737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3748 - BLOCK
      ?AUTO_3749 - BLOCK
    )
    :vars
    (
      ?AUTO_3750 - BLOCK
      ?AUTO_3752 - BLOCK
      ?AUTO_3754 - BLOCK
      ?AUTO_3753 - BLOCK
      ?AUTO_3751 - BLOCK
      ?AUTO_3756 - BLOCK
      ?AUTO_3758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3748 ?AUTO_3750 ) ( ON ?AUTO_3752 ?AUTO_3749 ) ( CLEAR ?AUTO_3752 ) ( ON ?AUTO_3754 ?AUTO_3748 ) ( CLEAR ?AUTO_3753 ) ( ON ?AUTO_3751 ?AUTO_3754 ) ( ON ?AUTO_3756 ?AUTO_3751 ) ( CLEAR ?AUTO_3756 ) ( HOLDING ?AUTO_3758 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3758 )
      ( MAKE-ON ?AUTO_3748 ?AUTO_3749 )
      ( MAKE-ON-VERIFY ?AUTO_3748 ?AUTO_3749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3772 - BLOCK
      ?AUTO_3773 - BLOCK
    )
    :vars
    (
      ?AUTO_3776 - BLOCK
      ?AUTO_3779 - BLOCK
      ?AUTO_3774 - BLOCK
      ?AUTO_3775 - BLOCK
      ?AUTO_3782 - BLOCK
      ?AUTO_3780 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3783 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3772 ?AUTO_3776 ) ( ON ?AUTO_3779 ?AUTO_3773 ) ( ON ?AUTO_3774 ?AUTO_3772 ) ( CLEAR ?AUTO_3775 ) ( ON ?AUTO_3782 ?AUTO_3774 ) ( ON ?AUTO_3780 ?AUTO_3782 ) ( CLEAR ?AUTO_3780 ) ( ON ?AUTO_3781 ?AUTO_3779 ) ( CLEAR ?AUTO_3781 ) ( HOLDING ?AUTO_3783 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3783 )
      ( MAKE-ON ?AUTO_3772 ?AUTO_3773 )
      ( MAKE-ON-VERIFY ?AUTO_3772 ?AUTO_3773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3784 - BLOCK
      ?AUTO_3785 - BLOCK
    )
    :vars
    (
      ?AUTO_3793 - BLOCK
      ?AUTO_3786 - BLOCK
      ?AUTO_3789 - BLOCK
      ?AUTO_3787 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3790 - BLOCK
      ?AUTO_3788 - BLOCK
      ?AUTO_3795 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3784 ?AUTO_3793 ) ( ON ?AUTO_3786 ?AUTO_3785 ) ( ON ?AUTO_3789 ?AUTO_3784 ) ( CLEAR ?AUTO_3787 ) ( ON ?AUTO_3794 ?AUTO_3789 ) ( ON ?AUTO_3790 ?AUTO_3794 ) ( CLEAR ?AUTO_3790 ) ( ON ?AUTO_3788 ?AUTO_3786 ) ( ON ?AUTO_3795 ?AUTO_3788 ) ( CLEAR ?AUTO_3795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3795 ?AUTO_3788 )
      ( MAKE-ON ?AUTO_3784 ?AUTO_3785 )
      ( MAKE-ON-VERIFY ?AUTO_3784 ?AUTO_3785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4125 - BLOCK
      ?AUTO_4126 - BLOCK
    )
    :vars
    (
      ?AUTO_4130 - BLOCK
      ?AUTO_4129 - BLOCK
      ?AUTO_4131 - BLOCK
      ?AUTO_4128 - BLOCK
      ?AUTO_4127 - BLOCK
      ?AUTO_4135 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4125 ?AUTO_4130 ) ( ON ?AUTO_4129 ?AUTO_4125 ) ( ON ?AUTO_4131 ?AUTO_4129 ) ( CLEAR ?AUTO_4128 ) ( ON ?AUTO_4127 ?AUTO_4131 ) ( CLEAR ?AUTO_4127 ) ( HOLDING ?AUTO_4126 ) ( CLEAR ?AUTO_4135 ) )
    :subtasks
    ( ( !STACK ?AUTO_4126 ?AUTO_4135 )
      ( MAKE-ON ?AUTO_4125 ?AUTO_4126 )
      ( MAKE-ON-VERIFY ?AUTO_4125 ?AUTO_4126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4220 - BLOCK
      ?AUTO_4221 - BLOCK
    )
    :vars
    (
      ?AUTO_4227 - BLOCK
      ?AUTO_4226 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4222 - BLOCK
      ?AUTO_4229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4227 ) ( ON ?AUTO_4226 ?AUTO_4221 ) ( ON ?AUTO_4223 ?AUTO_4226 ) ( ON ?AUTO_4220 ?AUTO_4223 ) ( CLEAR ?AUTO_4220 ) ( HOLDING ?AUTO_4222 ) ( CLEAR ?AUTO_4229 ) )
    :subtasks
    ( ( !STACK ?AUTO_4222 ?AUTO_4229 )
      ( MAKE-ON ?AUTO_4220 ?AUTO_4221 )
      ( MAKE-ON-VERIFY ?AUTO_4220 ?AUTO_4221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4241 - BLOCK
      ?AUTO_4242 - BLOCK
    )
    :vars
    (
      ?AUTO_4243 - BLOCK
      ?AUTO_4246 - BLOCK
      ?AUTO_4247 - BLOCK
      ?AUTO_4248 - BLOCK
      ?AUTO_4244 - BLOCK
      ?AUTO_4251 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4243 ?AUTO_4242 ) ( ON ?AUTO_4246 ?AUTO_4243 ) ( ON ?AUTO_4241 ?AUTO_4246 ) ( CLEAR ?AUTO_4247 ) ( ON ?AUTO_4248 ?AUTO_4241 ) ( CLEAR ?AUTO_4248 ) ( HOLDING ?AUTO_4244 ) ( CLEAR ?AUTO_4251 ) )
    :subtasks
    ( ( !STACK ?AUTO_4244 ?AUTO_4251 )
      ( MAKE-ON ?AUTO_4241 ?AUTO_4242 )
      ( MAKE-ON-VERIFY ?AUTO_4241 ?AUTO_4242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4662 - BLOCK
      ?AUTO_4663 - BLOCK
    )
    :vars
    (
      ?AUTO_4666 - BLOCK
      ?AUTO_4669 - BLOCK
      ?AUTO_4668 - BLOCK
      ?AUTO_4664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4662 ) ( ON ?AUTO_4666 ?AUTO_4662 ) ( CLEAR ?AUTO_4669 ) ( ON ?AUTO_4668 ?AUTO_4663 ) ( CLEAR ?AUTO_4668 ) ( ON ?AUTO_4664 ?AUTO_4666 ) ( CLEAR ?AUTO_4664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4664 ?AUTO_4666 )
      ( MAKE-ON ?AUTO_4662 ?AUTO_4663 )
      ( MAKE-ON-VERIFY ?AUTO_4662 ?AUTO_4663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4672 - BLOCK
      ?AUTO_4673 - BLOCK
    )
    :vars
    (
      ?AUTO_4676 - BLOCK
      ?AUTO_4679 - BLOCK
      ?AUTO_4678 - BLOCK
      ?AUTO_4677 - BLOCK
      ?AUTO_4680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4672 ) ( ON ?AUTO_4676 ?AUTO_4672 ) ( CLEAR ?AUTO_4679 ) ( ON ?AUTO_4678 ?AUTO_4673 ) ( CLEAR ?AUTO_4678 ) ( ON ?AUTO_4677 ?AUTO_4676 ) ( CLEAR ?AUTO_4677 ) ( HOLDING ?AUTO_4680 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4680 )
      ( MAKE-ON ?AUTO_4672 ?AUTO_4673 )
      ( MAKE-ON-VERIFY ?AUTO_4672 ?AUTO_4673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7765 - BLOCK
      ?AUTO_7766 - BLOCK
    )
    :vars
    (
      ?AUTO_7771 - BLOCK
      ?AUTO_7772 - BLOCK
      ?AUTO_7768 - BLOCK
      ?AUTO_7767 - BLOCK
      ?AUTO_7773 - BLOCK
      ?AUTO_7774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7765 ) ( ON ?AUTO_7771 ?AUTO_7765 ) ( CLEAR ?AUTO_7772 ) ( ON ?AUTO_7768 ?AUTO_7771 ) ( CLEAR ?AUTO_7766 ) ( ON ?AUTO_7767 ?AUTO_7768 ) ( CLEAR ?AUTO_7767 ) ( HOLDING ?AUTO_7773 ) ( CLEAR ?AUTO_7774 ) )
    :subtasks
    ( ( !STACK ?AUTO_7773 ?AUTO_7774 )
      ( MAKE-ON ?AUTO_7765 ?AUTO_7766 )
      ( MAKE-ON-VERIFY ?AUTO_7765 ?AUTO_7766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4714 - BLOCK
      ?AUTO_4715 - BLOCK
    )
    :vars
    (
      ?AUTO_4720 - BLOCK
      ?AUTO_4718 - BLOCK
      ?AUTO_4717 - BLOCK
      ?AUTO_4716 - BLOCK
      ?AUTO_4721 - BLOCK
      ?AUTO_4723 - BLOCK
      ?AUTO_4724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4714 ) ( ON ?AUTO_4720 ?AUTO_4714 ) ( CLEAR ?AUTO_4718 ) ( ON ?AUTO_4717 ?AUTO_4720 ) ( ON ?AUTO_4716 ?AUTO_4717 ) ( CLEAR ?AUTO_4715 ) ( ON ?AUTO_4721 ?AUTO_4716 ) ( CLEAR ?AUTO_4721 ) ( HOLDING ?AUTO_4723 ) ( CLEAR ?AUTO_4724 ) )
    :subtasks
    ( ( !STACK ?AUTO_4723 ?AUTO_4724 )
      ( MAKE-ON ?AUTO_4714 ?AUTO_4715 )
      ( MAKE-ON-VERIFY ?AUTO_4714 ?AUTO_4715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4741 - BLOCK
      ?AUTO_4742 - BLOCK
    )
    :vars
    (
      ?AUTO_4744 - BLOCK
      ?AUTO_4746 - BLOCK
      ?AUTO_4751 - BLOCK
      ?AUTO_4743 - BLOCK
      ?AUTO_4748 - BLOCK
      ?AUTO_4747 - BLOCK
      ?AUTO_4749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4741 ) ( ON ?AUTO_4744 ?AUTO_4741 ) ( CLEAR ?AUTO_4746 ) ( ON ?AUTO_4751 ?AUTO_4744 ) ( ON ?AUTO_4743 ?AUTO_4751 ) ( ON ?AUTO_4748 ?AUTO_4743 ) ( CLEAR ?AUTO_4748 ) ( CLEAR ?AUTO_4747 ) ( ON ?AUTO_4749 ?AUTO_4742 ) ( CLEAR ?AUTO_4749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4749 ?AUTO_4742 )
      ( MAKE-ON ?AUTO_4741 ?AUTO_4742 )
      ( MAKE-ON-VERIFY ?AUTO_4741 ?AUTO_4742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4889 - BLOCK
      ?AUTO_4890 - BLOCK
    )
    :vars
    (
      ?AUTO_4892 - BLOCK
      ?AUTO_4893 - BLOCK
      ?AUTO_4894 - BLOCK
      ?AUTO_4891 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4889 ?AUTO_4892 ) ( ON ?AUTO_4893 ?AUTO_4889 ) ( CLEAR ?AUTO_4893 ) ( ON ?AUTO_4894 ?AUTO_4890 ) ( ON ?AUTO_4891 ?AUTO_4894 ) ( CLEAR ?AUTO_4891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4891 ?AUTO_4894 )
      ( MAKE-ON ?AUTO_4889 ?AUTO_4890 )
      ( MAKE-ON-VERIFY ?AUTO_4889 ?AUTO_4890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4951 - BLOCK
      ?AUTO_4952 - BLOCK
    )
    :vars
    (
      ?AUTO_4956 - BLOCK
      ?AUTO_4957 - BLOCK
      ?AUTO_4953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4951 ) ( CLEAR ?AUTO_4956 ) ( ON ?AUTO_4957 ?AUTO_4951 ) ( ON ?AUTO_4953 ?AUTO_4957 ) ( CLEAR ?AUTO_4953 ) ( HOLDING ?AUTO_4952 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4952 )
      ( MAKE-ON ?AUTO_4951 ?AUTO_4952 )
      ( MAKE-ON-VERIFY ?AUTO_4951 ?AUTO_4952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5176 - BLOCK
      ?AUTO_5177 - BLOCK
    )
    :vars
    (
      ?AUTO_5180 - BLOCK
      ?AUTO_5181 - BLOCK
      ?AUTO_5183 - BLOCK
      ?AUTO_5178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5176 ) ( ON ?AUTO_5180 ?AUTO_5176 ) ( ON ?AUTO_5181 ?AUTO_5180 ) ( CLEAR ?AUTO_5183 ) ( ON ?AUTO_5178 ?AUTO_5181 ) ( CLEAR ?AUTO_5178 ) ( HOLDING ?AUTO_5177 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5177 )
      ( MAKE-ON ?AUTO_5176 ?AUTO_5177 )
      ( MAKE-ON-VERIFY ?AUTO_5176 ?AUTO_5177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5457 - BLOCK
      ?AUTO_5458 - BLOCK
    )
    :vars
    (
      ?AUTO_5464 - BLOCK
      ?AUTO_5462 - BLOCK
      ?AUTO_5460 - BLOCK
      ?AUTO_5466 - BLOCK
      ?AUTO_5465 - BLOCK
      ?AUTO_5463 - BLOCK
      ?AUTO_5467 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5457 ?AUTO_5464 ) ( CLEAR ?AUTO_5457 ) ( ON ?AUTO_5462 ?AUTO_5458 ) ( ON ?AUTO_5460 ?AUTO_5462 ) ( CLEAR ?AUTO_5466 ) ( ON ?AUTO_5465 ?AUTO_5460 ) ( ON ?AUTO_5463 ?AUTO_5465 ) ( CLEAR ?AUTO_5463 ) ( HOLDING ?AUTO_5467 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5467 )
      ( MAKE-ON ?AUTO_5457 ?AUTO_5458 )
      ( MAKE-ON-VERIFY ?AUTO_5457 ?AUTO_5458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5705 - BLOCK
      ?AUTO_5706 - BLOCK
    )
    :vars
    (
      ?AUTO_5712 - BLOCK
      ?AUTO_5710 - BLOCK
      ?AUTO_5707 - BLOCK
      ?AUTO_5713 - BLOCK
      ?AUTO_5708 - BLOCK
      ?AUTO_5716 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5705 ?AUTO_5712 ) ( ON ?AUTO_5710 ?AUTO_5705 ) ( ON ?AUTO_5707 ?AUTO_5706 ) ( ON ?AUTO_5713 ?AUTO_5707 ) ( ON ?AUTO_5708 ?AUTO_5713 ) ( CLEAR ?AUTO_5708 ) ( ON ?AUTO_5716 ?AUTO_5710 ) ( CLEAR ?AUTO_5716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5716 ?AUTO_5710 )
      ( MAKE-ON ?AUTO_5705 ?AUTO_5706 )
      ( MAKE-ON-VERIFY ?AUTO_5705 ?AUTO_5706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5902 - BLOCK
      ?AUTO_5903 - BLOCK
    )
    :vars
    (
      ?AUTO_5907 - BLOCK
      ?AUTO_5909 - BLOCK
      ?AUTO_5906 - BLOCK
      ?AUTO_5904 - BLOCK
      ?AUTO_5912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5902 ?AUTO_5907 ) ( ON ?AUTO_5909 ?AUTO_5902 ) ( ON ?AUTO_5906 ?AUTO_5903 ) ( ON ?AUTO_5904 ?AUTO_5909 ) ( CLEAR ?AUTO_5904 ) ( ON ?AUTO_5912 ?AUTO_5906 ) ( CLEAR ?AUTO_5912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5912 ?AUTO_5906 )
      ( MAKE-ON ?AUTO_5902 ?AUTO_5903 )
      ( MAKE-ON-VERIFY ?AUTO_5902 ?AUTO_5903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6454 - BLOCK
      ?AUTO_6455 - BLOCK
    )
    :vars
    (
      ?AUTO_6462 - BLOCK
      ?AUTO_6458 - BLOCK
      ?AUTO_6461 - BLOCK
      ?AUTO_6459 - BLOCK
      ?AUTO_6460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6454 ?AUTO_6462 ) ( CLEAR ?AUTO_6458 ) ( ON ?AUTO_6461 ?AUTO_6454 ) ( ON ?AUTO_6459 ?AUTO_6461 ) ( CLEAR ?AUTO_6459 ) ( ON ?AUTO_6460 ?AUTO_6455 ) ( CLEAR ?AUTO_6460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6460 ?AUTO_6455 )
      ( MAKE-ON ?AUTO_6454 ?AUTO_6455 )
      ( MAKE-ON-VERIFY ?AUTO_6454 ?AUTO_6455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6602 - BLOCK
      ?AUTO_6603 - BLOCK
    )
    :vars
    (
      ?AUTO_6606 - BLOCK
      ?AUTO_6610 - BLOCK
      ?AUTO_6605 - BLOCK
      ?AUTO_6607 - BLOCK
      ?AUTO_6604 - BLOCK
      ?AUTO_6609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6602 ) ( ON ?AUTO_6606 ?AUTO_6603 ) ( ON ?AUTO_6610 ?AUTO_6606 ) ( ON ?AUTO_6605 ?AUTO_6610 ) ( ON ?AUTO_6607 ?AUTO_6602 ) ( ON ?AUTO_6604 ?AUTO_6607 ) ( CLEAR ?AUTO_6604 ) ( ON ?AUTO_6609 ?AUTO_6605 ) ( CLEAR ?AUTO_6609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6609 ?AUTO_6605 )
      ( MAKE-ON ?AUTO_6602 ?AUTO_6603 )
      ( MAKE-ON-VERIFY ?AUTO_6602 ?AUTO_6603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6689 - BLOCK
      ?AUTO_6690 - BLOCK
    )
    :vars
    (
      ?AUTO_6691 - BLOCK
      ?AUTO_6695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6689 ) ( ON ?AUTO_6691 ?AUTO_6689 ) ( CLEAR ?AUTO_6691 ) ( HOLDING ?AUTO_6690 ) ( CLEAR ?AUTO_6695 ) )
    :subtasks
    ( ( !STACK ?AUTO_6690 ?AUTO_6695 )
      ( MAKE-ON ?AUTO_6689 ?AUTO_6690 )
      ( MAKE-ON-VERIFY ?AUTO_6689 ?AUTO_6690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6719 - BLOCK
      ?AUTO_6720 - BLOCK
    )
    :vars
    (
      ?AUTO_6721 - BLOCK
      ?AUTO_6723 - BLOCK
      ?AUTO_6722 - BLOCK
      ?AUTO_6724 - BLOCK
      ?AUTO_6728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6721 ) ( ON ?AUTO_6723 ?AUTO_6720 ) ( CLEAR ?AUTO_6722 ) ( ON ?AUTO_6724 ?AUTO_6723 ) ( CLEAR ?AUTO_6724 ) ( ON ?AUTO_6719 ?AUTO_6728 ) ( CLEAR ?AUTO_6719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6719 ?AUTO_6728 )
      ( MAKE-ON ?AUTO_6719 ?AUTO_6720 )
      ( MAKE-ON-VERIFY ?AUTO_6719 ?AUTO_6720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7032 - BLOCK
      ?AUTO_7033 - BLOCK
    )
    :vars
    (
      ?AUTO_7036 - BLOCK
      ?AUTO_7039 - BLOCK
      ?AUTO_7040 - BLOCK
      ?AUTO_7034 - BLOCK
      ?AUTO_7035 - BLOCK
      ?AUTO_7042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7033 ) ( ON ?AUTO_7032 ?AUTO_7036 ) ( ON ?AUTO_7039 ?AUTO_7032 ) ( ON ?AUTO_7040 ?AUTO_7039 ) ( ON ?AUTO_7034 ?AUTO_7040 ) ( CLEAR ?AUTO_7034 ) ( HOLDING ?AUTO_7035 ) ( CLEAR ?AUTO_7042 ) )
    :subtasks
    ( ( !STACK ?AUTO_7035 ?AUTO_7042 )
      ( MAKE-ON ?AUTO_7032 ?AUTO_7033 )
      ( MAKE-ON-VERIFY ?AUTO_7032 ?AUTO_7033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7367 - BLOCK
      ?AUTO_7368 - BLOCK
    )
    :vars
    (
      ?AUTO_7374 - BLOCK
      ?AUTO_7375 - BLOCK
      ?AUTO_7373 - BLOCK
      ?AUTO_7372 - BLOCK
      ?AUTO_7369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7374 ) ( ON ?AUTO_7375 ?AUTO_7368 ) ( ON ?AUTO_7373 ?AUTO_7375 ) ( ON ?AUTO_7372 ?AUTO_7373 ) ( CLEAR ?AUTO_7372 ) ( HOLDING ?AUTO_7367 ) ( CLEAR ?AUTO_7369 ) )
    :subtasks
    ( ( !STACK ?AUTO_7367 ?AUTO_7369 )
      ( MAKE-ON ?AUTO_7367 ?AUTO_7368 )
      ( MAKE-ON-VERIFY ?AUTO_7367 ?AUTO_7368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7389 - BLOCK
      ?AUTO_7390 - BLOCK
    )
    :vars
    (
      ?AUTO_7392 - BLOCK
      ?AUTO_7397 - BLOCK
      ?AUTO_7396 - BLOCK
      ?AUTO_7394 - BLOCK
      ?AUTO_7391 - BLOCK
      ?AUTO_7399 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7392 ) ( ON ?AUTO_7397 ?AUTO_7390 ) ( ON ?AUTO_7396 ?AUTO_7397 ) ( ON ?AUTO_7394 ?AUTO_7396 ) ( ON ?AUTO_7389 ?AUTO_7394 ) ( CLEAR ?AUTO_7389 ) ( HOLDING ?AUTO_7391 ) ( CLEAR ?AUTO_7399 ) )
    :subtasks
    ( ( !STACK ?AUTO_7391 ?AUTO_7399 )
      ( MAKE-ON ?AUTO_7389 ?AUTO_7390 )
      ( MAKE-ON-VERIFY ?AUTO_7389 ?AUTO_7390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7779 - BLOCK
      ?AUTO_7780 - BLOCK
    )
    :vars
    (
      ?AUTO_7786 - BLOCK
      ?AUTO_7783 - BLOCK
      ?AUTO_7781 - BLOCK
      ?AUTO_7782 - BLOCK
      ?AUTO_7788 - BLOCK
      ?AUTO_7784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7779 ) ( ON ?AUTO_7786 ?AUTO_7779 ) ( CLEAR ?AUTO_7783 ) ( ON ?AUTO_7781 ?AUTO_7786 ) ( ON ?AUTO_7782 ?AUTO_7781 ) ( CLEAR ?AUTO_7782 ) ( CLEAR ?AUTO_7788 ) ( ON ?AUTO_7784 ?AUTO_7780 ) ( CLEAR ?AUTO_7784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7784 ?AUTO_7780 )
      ( MAKE-ON ?AUTO_7779 ?AUTO_7780 )
      ( MAKE-ON-VERIFY ?AUTO_7779 ?AUTO_7780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7802 - BLOCK
      ?AUTO_7803 - BLOCK
    )
    :vars
    (
      ?AUTO_7804 - BLOCK
      ?AUTO_7808 - BLOCK
      ?AUTO_7810 - BLOCK
      ?AUTO_7811 - BLOCK
      ?AUTO_7809 - BLOCK
      ?AUTO_7805 - BLOCK
      ?AUTO_7812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7802 ) ( ON ?AUTO_7804 ?AUTO_7802 ) ( CLEAR ?AUTO_7808 ) ( ON ?AUTO_7810 ?AUTO_7804 ) ( ON ?AUTO_7811 ?AUTO_7810 ) ( CLEAR ?AUTO_7811 ) ( CLEAR ?AUTO_7809 ) ( ON ?AUTO_7805 ?AUTO_7803 ) ( ON ?AUTO_7812 ?AUTO_7805 ) ( CLEAR ?AUTO_7812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7812 ?AUTO_7805 )
      ( MAKE-ON ?AUTO_7802 ?AUTO_7803 )
      ( MAKE-ON-VERIFY ?AUTO_7802 ?AUTO_7803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7815 - BLOCK
      ?AUTO_7816 - BLOCK
    )
    :vars
    (
      ?AUTO_7823 - BLOCK
      ?AUTO_7817 - BLOCK
      ?AUTO_7820 - BLOCK
      ?AUTO_7818 - BLOCK
      ?AUTO_7821 - BLOCK
      ?AUTO_7824 - BLOCK
      ?AUTO_7825 - BLOCK
      ?AUTO_7826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7815 ) ( ON ?AUTO_7823 ?AUTO_7815 ) ( CLEAR ?AUTO_7817 ) ( ON ?AUTO_7820 ?AUTO_7823 ) ( ON ?AUTO_7818 ?AUTO_7820 ) ( CLEAR ?AUTO_7818 ) ( CLEAR ?AUTO_7821 ) ( ON ?AUTO_7824 ?AUTO_7816 ) ( ON ?AUTO_7825 ?AUTO_7824 ) ( CLEAR ?AUTO_7825 ) ( HOLDING ?AUTO_7826 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7826 )
      ( MAKE-ON ?AUTO_7815 ?AUTO_7816 )
      ( MAKE-ON-VERIFY ?AUTO_7815 ?AUTO_7816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7827 - BLOCK
      ?AUTO_7828 - BLOCK
    )
    :vars
    (
      ?AUTO_7832 - BLOCK
      ?AUTO_7836 - BLOCK
      ?AUTO_7831 - BLOCK
      ?AUTO_7833 - BLOCK
      ?AUTO_7838 - BLOCK
      ?AUTO_7835 - BLOCK
      ?AUTO_7834 - BLOCK
      ?AUTO_7837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7827 ) ( ON ?AUTO_7832 ?AUTO_7827 ) ( CLEAR ?AUTO_7836 ) ( ON ?AUTO_7831 ?AUTO_7832 ) ( ON ?AUTO_7833 ?AUTO_7831 ) ( CLEAR ?AUTO_7833 ) ( CLEAR ?AUTO_7838 ) ( ON ?AUTO_7835 ?AUTO_7828 ) ( ON ?AUTO_7834 ?AUTO_7835 ) ( ON ?AUTO_7837 ?AUTO_7834 ) ( CLEAR ?AUTO_7837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7837 ?AUTO_7834 )
      ( MAKE-ON ?AUTO_7827 ?AUTO_7828 )
      ( MAKE-ON-VERIFY ?AUTO_7827 ?AUTO_7828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7841 - BLOCK
      ?AUTO_7842 - BLOCK
    )
    :vars
    (
      ?AUTO_7852 - BLOCK
      ?AUTO_7848 - BLOCK
      ?AUTO_7843 - BLOCK
      ?AUTO_7851 - BLOCK
      ?AUTO_7849 - BLOCK
      ?AUTO_7844 - BLOCK
      ?AUTO_7850 - BLOCK
      ?AUTO_7846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7841 ) ( ON ?AUTO_7852 ?AUTO_7841 ) ( CLEAR ?AUTO_7848 ) ( ON ?AUTO_7843 ?AUTO_7852 ) ( CLEAR ?AUTO_7851 ) ( ON ?AUTO_7849 ?AUTO_7842 ) ( ON ?AUTO_7844 ?AUTO_7849 ) ( ON ?AUTO_7850 ?AUTO_7844 ) ( CLEAR ?AUTO_7850 ) ( HOLDING ?AUTO_7846 ) ( CLEAR ?AUTO_7843 ) )
    :subtasks
    ( ( !STACK ?AUTO_7846 ?AUTO_7843 )
      ( MAKE-ON ?AUTO_7841 ?AUTO_7842 )
      ( MAKE-ON-VERIFY ?AUTO_7841 ?AUTO_7842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7869 - BLOCK
      ?AUTO_7870 - BLOCK
    )
    :vars
    (
      ?AUTO_7871 - BLOCK
      ?AUTO_7879 - BLOCK
      ?AUTO_7876 - BLOCK
      ?AUTO_7874 - BLOCK
      ?AUTO_7878 - BLOCK
      ?AUTO_7880 - BLOCK
      ?AUTO_7877 - BLOCK
      ?AUTO_7875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7869 ) ( ON ?AUTO_7871 ?AUTO_7869 ) ( CLEAR ?AUTO_7879 ) ( CLEAR ?AUTO_7876 ) ( ON ?AUTO_7874 ?AUTO_7870 ) ( ON ?AUTO_7878 ?AUTO_7874 ) ( ON ?AUTO_7880 ?AUTO_7878 ) ( ON ?AUTO_7877 ?AUTO_7880 ) ( CLEAR ?AUTO_7877 ) ( HOLDING ?AUTO_7875 ) ( CLEAR ?AUTO_7871 ) )
    :subtasks
    ( ( !STACK ?AUTO_7875 ?AUTO_7871 )
      ( MAKE-ON ?AUTO_7869 ?AUTO_7870 )
      ( MAKE-ON-VERIFY ?AUTO_7869 ?AUTO_7870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7883 - BLOCK
      ?AUTO_7884 - BLOCK
    )
    :vars
    (
      ?AUTO_7887 - BLOCK
      ?AUTO_7885 - BLOCK
      ?AUTO_7889 - BLOCK
      ?AUTO_7892 - BLOCK
      ?AUTO_7886 - BLOCK
      ?AUTO_7893 - BLOCK
      ?AUTO_7891 - BLOCK
      ?AUTO_7894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7883 ) ( ON ?AUTO_7887 ?AUTO_7883 ) ( CLEAR ?AUTO_7885 ) ( CLEAR ?AUTO_7889 ) ( ON ?AUTO_7892 ?AUTO_7884 ) ( ON ?AUTO_7886 ?AUTO_7892 ) ( ON ?AUTO_7893 ?AUTO_7886 ) ( ON ?AUTO_7891 ?AUTO_7893 ) ( CLEAR ?AUTO_7891 ) ( CLEAR ?AUTO_7887 ) ( ON-TABLE ?AUTO_7894 ) ( CLEAR ?AUTO_7894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7894 )
      ( MAKE-ON ?AUTO_7883 ?AUTO_7884 )
      ( MAKE-ON-VERIFY ?AUTO_7883 ?AUTO_7884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7896 - BLOCK
      ?AUTO_7897 - BLOCK
    )
    :vars
    (
      ?AUTO_7898 - BLOCK
      ?AUTO_7900 - BLOCK
      ?AUTO_7901 - BLOCK
      ?AUTO_7903 - BLOCK
      ?AUTO_7905 - BLOCK
      ?AUTO_7906 - BLOCK
      ?AUTO_7902 - BLOCK
      ?AUTO_7907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7896 ) ( CLEAR ?AUTO_7898 ) ( CLEAR ?AUTO_7900 ) ( ON ?AUTO_7901 ?AUTO_7897 ) ( ON ?AUTO_7903 ?AUTO_7901 ) ( ON ?AUTO_7905 ?AUTO_7903 ) ( ON ?AUTO_7906 ?AUTO_7905 ) ( CLEAR ?AUTO_7906 ) ( ON-TABLE ?AUTO_7902 ) ( CLEAR ?AUTO_7902 ) ( HOLDING ?AUTO_7907 ) ( CLEAR ?AUTO_7896 ) )
    :subtasks
    ( ( !STACK ?AUTO_7907 ?AUTO_7896 )
      ( MAKE-ON ?AUTO_7896 ?AUTO_7897 )
      ( MAKE-ON-VERIFY ?AUTO_7896 ?AUTO_7897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7930 - BLOCK
      ?AUTO_7931 - BLOCK
    )
    :vars
    (
      ?AUTO_7938 - BLOCK
      ?AUTO_7935 - BLOCK
      ?AUTO_7939 - BLOCK
      ?AUTO_7940 - BLOCK
      ?AUTO_7932 - BLOCK
      ?AUTO_7936 - BLOCK
      ?AUTO_7941 - BLOCK
      ?AUTO_7937 - BLOCK
      ?AUTO_7943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7930 ) ( CLEAR ?AUTO_7938 ) ( CLEAR ?AUTO_7935 ) ( ON ?AUTO_7939 ?AUTO_7931 ) ( ON ?AUTO_7940 ?AUTO_7939 ) ( ON ?AUTO_7932 ?AUTO_7940 ) ( ON ?AUTO_7936 ?AUTO_7932 ) ( CLEAR ?AUTO_7936 ) ( ON-TABLE ?AUTO_7941 ) ( CLEAR ?AUTO_7941 ) ( CLEAR ?AUTO_7930 ) ( ON ?AUTO_7937 ?AUTO_7943 ) ( CLEAR ?AUTO_7937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7937 ?AUTO_7943 )
      ( MAKE-ON ?AUTO_7930 ?AUTO_7931 )
      ( MAKE-ON-VERIFY ?AUTO_7930 ?AUTO_7931 ) )
  )

)

