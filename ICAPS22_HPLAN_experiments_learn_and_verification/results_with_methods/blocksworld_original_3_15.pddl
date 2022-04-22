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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5373 - BLOCK
      ?auto_5374 - BLOCK
      ?auto_5375 - BLOCK
    )
    :vars
    (
      ?auto_5376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5376 ?auto_5375 ) ( CLEAR ?auto_5376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5373 ) ( ON ?auto_5374 ?auto_5373 ) ( ON ?auto_5375 ?auto_5374 ) ( not ( = ?auto_5373 ?auto_5374 ) ) ( not ( = ?auto_5373 ?auto_5375 ) ) ( not ( = ?auto_5373 ?auto_5376 ) ) ( not ( = ?auto_5374 ?auto_5375 ) ) ( not ( = ?auto_5374 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5376 ?auto_5375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5378 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5379 - BLOCK
    )
    :vars
    (
      ?auto_5380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5379 ?auto_5380 ) ( CLEAR ?auto_5379 ) ( HAND-EMPTY ) ( not ( = ?auto_5379 ?auto_5380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5379 ?auto_5380 )
      ( MAKE-1PILE ?auto_5379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5383 - BLOCK
      ?auto_5384 - BLOCK
    )
    :vars
    (
      ?auto_5385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5385 ?auto_5384 ) ( CLEAR ?auto_5385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5383 ) ( ON ?auto_5384 ?auto_5383 ) ( not ( = ?auto_5383 ?auto_5384 ) ) ( not ( = ?auto_5383 ?auto_5385 ) ) ( not ( = ?auto_5384 ?auto_5385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5385 ?auto_5384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5386 - BLOCK
      ?auto_5387 - BLOCK
    )
    :vars
    (
      ?auto_5388 - BLOCK
      ?auto_5389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5388 ?auto_5387 ) ( CLEAR ?auto_5388 ) ( ON-TABLE ?auto_5386 ) ( ON ?auto_5387 ?auto_5386 ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( HOLDING ?auto_5389 ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5389 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5389 )
      ( MAKE-2PILE ?auto_5386 ?auto_5387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5390 - BLOCK
      ?auto_5391 - BLOCK
    )
    :vars
    (
      ?auto_5393 - BLOCK
      ?auto_5392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5393 ?auto_5391 ) ( ON-TABLE ?auto_5390 ) ( ON ?auto_5391 ?auto_5390 ) ( not ( = ?auto_5390 ?auto_5391 ) ) ( not ( = ?auto_5390 ?auto_5393 ) ) ( not ( = ?auto_5391 ?auto_5393 ) ) ( not ( = ?auto_5390 ?auto_5392 ) ) ( not ( = ?auto_5391 ?auto_5392 ) ) ( not ( = ?auto_5393 ?auto_5392 ) ) ( ON ?auto_5392 ?auto_5393 ) ( CLEAR ?auto_5392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5390 ?auto_5391 ?auto_5393 )
      ( MAKE-2PILE ?auto_5390 ?auto_5391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5396 - BLOCK
      ?auto_5397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5397 ) ( CLEAR ?auto_5396 ) ( ON-TABLE ?auto_5396 ) ( not ( = ?auto_5396 ?auto_5397 ) ) )
    :subtasks
    ( ( !STACK ?auto_5397 ?auto_5396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5398 - BLOCK
      ?auto_5399 - BLOCK
    )
    :vars
    (
      ?auto_5400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5398 ) ( ON-TABLE ?auto_5398 ) ( not ( = ?auto_5398 ?auto_5399 ) ) ( ON ?auto_5399 ?auto_5400 ) ( CLEAR ?auto_5399 ) ( HAND-EMPTY ) ( not ( = ?auto_5398 ?auto_5400 ) ) ( not ( = ?auto_5399 ?auto_5400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5399 ?auto_5400 )
      ( MAKE-2PILE ?auto_5398 ?auto_5399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5401 - BLOCK
      ?auto_5402 - BLOCK
    )
    :vars
    (
      ?auto_5403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5401 ?auto_5402 ) ) ( ON ?auto_5402 ?auto_5403 ) ( CLEAR ?auto_5402 ) ( not ( = ?auto_5401 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( HOLDING ?auto_5401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5401 )
      ( MAKE-2PILE ?auto_5401 ?auto_5402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5404 - BLOCK
      ?auto_5405 - BLOCK
    )
    :vars
    (
      ?auto_5406 - BLOCK
      ?auto_5407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5404 ?auto_5405 ) ) ( ON ?auto_5405 ?auto_5406 ) ( not ( = ?auto_5404 ?auto_5406 ) ) ( not ( = ?auto_5405 ?auto_5406 ) ) ( ON ?auto_5404 ?auto_5405 ) ( CLEAR ?auto_5404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5407 ) ( ON ?auto_5406 ?auto_5407 ) ( not ( = ?auto_5407 ?auto_5406 ) ) ( not ( = ?auto_5407 ?auto_5405 ) ) ( not ( = ?auto_5407 ?auto_5404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5407 ?auto_5406 ?auto_5405 )
      ( MAKE-2PILE ?auto_5404 ?auto_5405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5409 - BLOCK
    )
    :vars
    (
      ?auto_5410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5410 ?auto_5409 ) ( CLEAR ?auto_5410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5409 ) ( not ( = ?auto_5409 ?auto_5410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5410 ?auto_5409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5411 - BLOCK
    )
    :vars
    (
      ?auto_5412 - BLOCK
      ?auto_5413 - BLOCK
      ?auto_5414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5412 ?auto_5411 ) ( CLEAR ?auto_5412 ) ( ON-TABLE ?auto_5411 ) ( not ( = ?auto_5411 ?auto_5412 ) ) ( HOLDING ?auto_5413 ) ( CLEAR ?auto_5414 ) ( not ( = ?auto_5411 ?auto_5413 ) ) ( not ( = ?auto_5411 ?auto_5414 ) ) ( not ( = ?auto_5412 ?auto_5413 ) ) ( not ( = ?auto_5412 ?auto_5414 ) ) ( not ( = ?auto_5413 ?auto_5414 ) ) )
    :subtasks
    ( ( !STACK ?auto_5413 ?auto_5414 )
      ( MAKE-1PILE ?auto_5411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5415 - BLOCK
    )
    :vars
    (
      ?auto_5416 - BLOCK
      ?auto_5417 - BLOCK
      ?auto_5418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5416 ?auto_5415 ) ( ON-TABLE ?auto_5415 ) ( not ( = ?auto_5415 ?auto_5416 ) ) ( CLEAR ?auto_5417 ) ( not ( = ?auto_5415 ?auto_5418 ) ) ( not ( = ?auto_5415 ?auto_5417 ) ) ( not ( = ?auto_5416 ?auto_5418 ) ) ( not ( = ?auto_5416 ?auto_5417 ) ) ( not ( = ?auto_5418 ?auto_5417 ) ) ( ON ?auto_5418 ?auto_5416 ) ( CLEAR ?auto_5418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5415 ?auto_5416 )
      ( MAKE-1PILE ?auto_5415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5419 - BLOCK
    )
    :vars
    (
      ?auto_5421 - BLOCK
      ?auto_5422 - BLOCK
      ?auto_5420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5421 ?auto_5419 ) ( ON-TABLE ?auto_5419 ) ( not ( = ?auto_5419 ?auto_5421 ) ) ( not ( = ?auto_5419 ?auto_5422 ) ) ( not ( = ?auto_5419 ?auto_5420 ) ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5420 ) ) ( not ( = ?auto_5422 ?auto_5420 ) ) ( ON ?auto_5422 ?auto_5421 ) ( CLEAR ?auto_5422 ) ( HOLDING ?auto_5420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5420 )
      ( MAKE-1PILE ?auto_5419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5423 - BLOCK
    )
    :vars
    (
      ?auto_5424 - BLOCK
      ?auto_5425 - BLOCK
      ?auto_5426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5424 ?auto_5423 ) ( ON-TABLE ?auto_5423 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5426 ) ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5426 ) ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( ON ?auto_5425 ?auto_5424 ) ( ON ?auto_5426 ?auto_5425 ) ( CLEAR ?auto_5426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5423 ?auto_5424 ?auto_5425 )
      ( MAKE-1PILE ?auto_5423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5430 - BLOCK
      ?auto_5431 - BLOCK
      ?auto_5432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5432 ) ( CLEAR ?auto_5431 ) ( ON-TABLE ?auto_5430 ) ( ON ?auto_5431 ?auto_5430 ) ( not ( = ?auto_5430 ?auto_5431 ) ) ( not ( = ?auto_5430 ?auto_5432 ) ) ( not ( = ?auto_5431 ?auto_5432 ) ) )
    :subtasks
    ( ( !STACK ?auto_5432 ?auto_5431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5433 - BLOCK
      ?auto_5434 - BLOCK
      ?auto_5435 - BLOCK
    )
    :vars
    (
      ?auto_5436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5434 ) ( ON-TABLE ?auto_5433 ) ( ON ?auto_5434 ?auto_5433 ) ( not ( = ?auto_5433 ?auto_5434 ) ) ( not ( = ?auto_5433 ?auto_5435 ) ) ( not ( = ?auto_5434 ?auto_5435 ) ) ( ON ?auto_5435 ?auto_5436 ) ( CLEAR ?auto_5435 ) ( HAND-EMPTY ) ( not ( = ?auto_5433 ?auto_5436 ) ) ( not ( = ?auto_5434 ?auto_5436 ) ) ( not ( = ?auto_5435 ?auto_5436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5435 ?auto_5436 )
      ( MAKE-3PILE ?auto_5433 ?auto_5434 ?auto_5435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5437 - BLOCK
      ?auto_5438 - BLOCK
      ?auto_5439 - BLOCK
    )
    :vars
    (
      ?auto_5440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5437 ) ( not ( = ?auto_5437 ?auto_5438 ) ) ( not ( = ?auto_5437 ?auto_5439 ) ) ( not ( = ?auto_5438 ?auto_5439 ) ) ( ON ?auto_5439 ?auto_5440 ) ( CLEAR ?auto_5439 ) ( not ( = ?auto_5437 ?auto_5440 ) ) ( not ( = ?auto_5438 ?auto_5440 ) ) ( not ( = ?auto_5439 ?auto_5440 ) ) ( HOLDING ?auto_5438 ) ( CLEAR ?auto_5437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5437 ?auto_5438 )
      ( MAKE-3PILE ?auto_5437 ?auto_5438 ?auto_5439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5441 - BLOCK
      ?auto_5442 - BLOCK
      ?auto_5443 - BLOCK
    )
    :vars
    (
      ?auto_5444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5441 ) ( not ( = ?auto_5441 ?auto_5442 ) ) ( not ( = ?auto_5441 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( ON ?auto_5443 ?auto_5444 ) ( not ( = ?auto_5441 ?auto_5444 ) ) ( not ( = ?auto_5442 ?auto_5444 ) ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( CLEAR ?auto_5441 ) ( ON ?auto_5442 ?auto_5443 ) ( CLEAR ?auto_5442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5444 ?auto_5443 )
      ( MAKE-3PILE ?auto_5441 ?auto_5442 ?auto_5443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5445 - BLOCK
      ?auto_5446 - BLOCK
      ?auto_5447 - BLOCK
    )
    :vars
    (
      ?auto_5448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5445 ?auto_5446 ) ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( not ( = ?auto_5446 ?auto_5447 ) ) ( ON ?auto_5447 ?auto_5448 ) ( not ( = ?auto_5445 ?auto_5448 ) ) ( not ( = ?auto_5446 ?auto_5448 ) ) ( not ( = ?auto_5447 ?auto_5448 ) ) ( ON ?auto_5446 ?auto_5447 ) ( CLEAR ?auto_5446 ) ( ON-TABLE ?auto_5448 ) ( HOLDING ?auto_5445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5445 )
      ( MAKE-3PILE ?auto_5445 ?auto_5446 ?auto_5447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5449 - BLOCK
      ?auto_5450 - BLOCK
      ?auto_5451 - BLOCK
    )
    :vars
    (
      ?auto_5452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5449 ?auto_5450 ) ) ( not ( = ?auto_5449 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( ON ?auto_5451 ?auto_5452 ) ( not ( = ?auto_5449 ?auto_5452 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( ON ?auto_5450 ?auto_5451 ) ( ON-TABLE ?auto_5452 ) ( ON ?auto_5449 ?auto_5450 ) ( CLEAR ?auto_5449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5452 ?auto_5451 ?auto_5450 )
      ( MAKE-3PILE ?auto_5449 ?auto_5450 ?auto_5451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5455 - BLOCK
      ?auto_5456 - BLOCK
    )
    :vars
    (
      ?auto_5457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5457 ?auto_5456 ) ( CLEAR ?auto_5457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5455 ) ( ON ?auto_5456 ?auto_5455 ) ( not ( = ?auto_5455 ?auto_5456 ) ) ( not ( = ?auto_5455 ?auto_5457 ) ) ( not ( = ?auto_5456 ?auto_5457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5457 ?auto_5456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5465 - BLOCK
      ?auto_5466 - BLOCK
    )
    :vars
    (
      ?auto_5467 - BLOCK
      ?auto_5468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5465 ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( not ( = ?auto_5465 ?auto_5467 ) ) ( not ( = ?auto_5466 ?auto_5467 ) ) ( ON ?auto_5467 ?auto_5468 ) ( CLEAR ?auto_5467 ) ( not ( = ?auto_5465 ?auto_5468 ) ) ( not ( = ?auto_5466 ?auto_5468 ) ) ( not ( = ?auto_5467 ?auto_5468 ) ) ( HOLDING ?auto_5466 ) ( CLEAR ?auto_5465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5465 ?auto_5466 ?auto_5467 )
      ( MAKE-2PILE ?auto_5465 ?auto_5466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5469 - BLOCK
      ?auto_5470 - BLOCK
    )
    :vars
    (
      ?auto_5471 - BLOCK
      ?auto_5472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5469 ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( not ( = ?auto_5469 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( ON ?auto_5471 ?auto_5472 ) ( not ( = ?auto_5469 ?auto_5472 ) ) ( not ( = ?auto_5470 ?auto_5472 ) ) ( not ( = ?auto_5471 ?auto_5472 ) ) ( CLEAR ?auto_5469 ) ( ON ?auto_5470 ?auto_5471 ) ( CLEAR ?auto_5470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5472 ?auto_5471 )
      ( MAKE-2PILE ?auto_5469 ?auto_5470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5473 - BLOCK
      ?auto_5474 - BLOCK
    )
    :vars
    (
      ?auto_5476 - BLOCK
      ?auto_5475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5473 ?auto_5474 ) ) ( not ( = ?auto_5473 ?auto_5476 ) ) ( not ( = ?auto_5474 ?auto_5476 ) ) ( ON ?auto_5476 ?auto_5475 ) ( not ( = ?auto_5473 ?auto_5475 ) ) ( not ( = ?auto_5474 ?auto_5475 ) ) ( not ( = ?auto_5476 ?auto_5475 ) ) ( ON ?auto_5474 ?auto_5476 ) ( CLEAR ?auto_5474 ) ( ON-TABLE ?auto_5475 ) ( HOLDING ?auto_5473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5473 )
      ( MAKE-2PILE ?auto_5473 ?auto_5474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5477 - BLOCK
      ?auto_5478 - BLOCK
    )
    :vars
    (
      ?auto_5480 - BLOCK
      ?auto_5479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5477 ?auto_5478 ) ) ( not ( = ?auto_5477 ?auto_5480 ) ) ( not ( = ?auto_5478 ?auto_5480 ) ) ( ON ?auto_5480 ?auto_5479 ) ( not ( = ?auto_5477 ?auto_5479 ) ) ( not ( = ?auto_5478 ?auto_5479 ) ) ( not ( = ?auto_5480 ?auto_5479 ) ) ( ON ?auto_5478 ?auto_5480 ) ( ON-TABLE ?auto_5479 ) ( ON ?auto_5477 ?auto_5478 ) ( CLEAR ?auto_5477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5479 ?auto_5480 ?auto_5478 )
      ( MAKE-2PILE ?auto_5477 ?auto_5478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5483 - BLOCK
    )
    :vars
    (
      ?auto_5484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5483 ?auto_5484 ) ( CLEAR ?auto_5483 ) ( HAND-EMPTY ) ( not ( = ?auto_5483 ?auto_5484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5483 ?auto_5484 )
      ( MAKE-1PILE ?auto_5483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5485 - BLOCK
    )
    :vars
    (
      ?auto_5486 - BLOCK
      ?auto_5487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5485 ?auto_5486 ) ) ( HOLDING ?auto_5485 ) ( CLEAR ?auto_5486 ) ( ON-TABLE ?auto_5487 ) ( ON ?auto_5486 ?auto_5487 ) ( not ( = ?auto_5487 ?auto_5486 ) ) ( not ( = ?auto_5487 ?auto_5485 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5487 ?auto_5486 ?auto_5485 )
      ( MAKE-1PILE ?auto_5485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5488 - BLOCK
    )
    :vars
    (
      ?auto_5489 - BLOCK
      ?auto_5490 - BLOCK
      ?auto_5491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5488 ?auto_5489 ) ) ( CLEAR ?auto_5489 ) ( ON-TABLE ?auto_5490 ) ( ON ?auto_5489 ?auto_5490 ) ( not ( = ?auto_5490 ?auto_5489 ) ) ( not ( = ?auto_5490 ?auto_5488 ) ) ( ON ?auto_5488 ?auto_5491 ) ( CLEAR ?auto_5488 ) ( HAND-EMPTY ) ( not ( = ?auto_5488 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5491 ) ) ( not ( = ?auto_5490 ?auto_5491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5488 ?auto_5491 )
      ( MAKE-1PILE ?auto_5488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5492 - BLOCK
    )
    :vars
    (
      ?auto_5493 - BLOCK
      ?auto_5495 - BLOCK
      ?auto_5494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5492 ?auto_5493 ) ) ( ON-TABLE ?auto_5495 ) ( not ( = ?auto_5495 ?auto_5493 ) ) ( not ( = ?auto_5495 ?auto_5492 ) ) ( ON ?auto_5492 ?auto_5494 ) ( CLEAR ?auto_5492 ) ( not ( = ?auto_5492 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5494 ) ) ( not ( = ?auto_5495 ?auto_5494 ) ) ( HOLDING ?auto_5493 ) ( CLEAR ?auto_5495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5495 ?auto_5493 )
      ( MAKE-1PILE ?auto_5492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5496 - BLOCK
    )
    :vars
    (
      ?auto_5499 - BLOCK
      ?auto_5498 - BLOCK
      ?auto_5497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5496 ?auto_5499 ) ) ( ON-TABLE ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5499 ) ) ( not ( = ?auto_5498 ?auto_5496 ) ) ( ON ?auto_5496 ?auto_5497 ) ( not ( = ?auto_5496 ?auto_5497 ) ) ( not ( = ?auto_5499 ?auto_5497 ) ) ( not ( = ?auto_5498 ?auto_5497 ) ) ( CLEAR ?auto_5498 ) ( ON ?auto_5499 ?auto_5496 ) ( CLEAR ?auto_5499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5497 ?auto_5496 )
      ( MAKE-1PILE ?auto_5496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5500 - BLOCK
    )
    :vars
    (
      ?auto_5503 - BLOCK
      ?auto_5502 - BLOCK
      ?auto_5501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5500 ?auto_5503 ) ) ( not ( = ?auto_5502 ?auto_5503 ) ) ( not ( = ?auto_5502 ?auto_5500 ) ) ( ON ?auto_5500 ?auto_5501 ) ( not ( = ?auto_5500 ?auto_5501 ) ) ( not ( = ?auto_5503 ?auto_5501 ) ) ( not ( = ?auto_5502 ?auto_5501 ) ) ( ON ?auto_5503 ?auto_5500 ) ( CLEAR ?auto_5503 ) ( ON-TABLE ?auto_5501 ) ( HOLDING ?auto_5502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5502 )
      ( MAKE-1PILE ?auto_5500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5504 - BLOCK
    )
    :vars
    (
      ?auto_5507 - BLOCK
      ?auto_5505 - BLOCK
      ?auto_5506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5504 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5504 ) ) ( ON ?auto_5504 ?auto_5506 ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5507 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( ON ?auto_5507 ?auto_5504 ) ( ON-TABLE ?auto_5506 ) ( ON ?auto_5505 ?auto_5507 ) ( CLEAR ?auto_5505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5506 ?auto_5504 ?auto_5507 )
      ( MAKE-1PILE ?auto_5504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5509 - BLOCK
    )
    :vars
    (
      ?auto_5510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5510 ?auto_5509 ) ( CLEAR ?auto_5510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5509 ) ( not ( = ?auto_5509 ?auto_5510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5510 ?auto_5509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5511 - BLOCK
    )
    :vars
    (
      ?auto_5512 - BLOCK
      ?auto_5513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5512 ?auto_5511 ) ( CLEAR ?auto_5512 ) ( ON-TABLE ?auto_5511 ) ( not ( = ?auto_5511 ?auto_5512 ) ) ( HOLDING ?auto_5513 ) ( not ( = ?auto_5511 ?auto_5513 ) ) ( not ( = ?auto_5512 ?auto_5513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5513 )
      ( MAKE-1PILE ?auto_5511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5514 - BLOCK
    )
    :vars
    (
      ?auto_5516 - BLOCK
      ?auto_5515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5516 ?auto_5514 ) ( ON-TABLE ?auto_5514 ) ( not ( = ?auto_5514 ?auto_5516 ) ) ( not ( = ?auto_5514 ?auto_5515 ) ) ( not ( = ?auto_5516 ?auto_5515 ) ) ( ON ?auto_5515 ?auto_5516 ) ( CLEAR ?auto_5515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5514 ?auto_5516 )
      ( MAKE-1PILE ?auto_5514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5517 - BLOCK
    )
    :vars
    (
      ?auto_5519 - BLOCK
      ?auto_5518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5519 ?auto_5517 ) ( ON-TABLE ?auto_5517 ) ( not ( = ?auto_5517 ?auto_5519 ) ) ( not ( = ?auto_5517 ?auto_5518 ) ) ( not ( = ?auto_5519 ?auto_5518 ) ) ( HOLDING ?auto_5518 ) ( CLEAR ?auto_5519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5517 ?auto_5519 ?auto_5518 )
      ( MAKE-1PILE ?auto_5517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5520 - BLOCK
    )
    :vars
    (
      ?auto_5522 - BLOCK
      ?auto_5521 - BLOCK
      ?auto_5523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5522 ?auto_5520 ) ( ON-TABLE ?auto_5520 ) ( not ( = ?auto_5520 ?auto_5522 ) ) ( not ( = ?auto_5520 ?auto_5521 ) ) ( not ( = ?auto_5522 ?auto_5521 ) ) ( CLEAR ?auto_5522 ) ( ON ?auto_5521 ?auto_5523 ) ( CLEAR ?auto_5521 ) ( HAND-EMPTY ) ( not ( = ?auto_5520 ?auto_5523 ) ) ( not ( = ?auto_5522 ?auto_5523 ) ) ( not ( = ?auto_5521 ?auto_5523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5521 ?auto_5523 )
      ( MAKE-1PILE ?auto_5520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5532 - BLOCK
    )
    :vars
    (
      ?auto_5535 - BLOCK
      ?auto_5533 - BLOCK
      ?auto_5534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5532 ?auto_5535 ) ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5535 ?auto_5533 ) ) ( ON ?auto_5533 ?auto_5534 ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5535 ?auto_5534 ) ) ( not ( = ?auto_5533 ?auto_5534 ) ) ( ON ?auto_5535 ?auto_5533 ) ( CLEAR ?auto_5535 ) ( HOLDING ?auto_5532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5532 ?auto_5535 )
      ( MAKE-1PILE ?auto_5532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5536 - BLOCK
    )
    :vars
    (
      ?auto_5537 - BLOCK
      ?auto_5539 - BLOCK
      ?auto_5538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5536 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5539 ) ) ( not ( = ?auto_5537 ?auto_5539 ) ) ( ON ?auto_5539 ?auto_5538 ) ( not ( = ?auto_5536 ?auto_5538 ) ) ( not ( = ?auto_5537 ?auto_5538 ) ) ( not ( = ?auto_5539 ?auto_5538 ) ) ( ON ?auto_5537 ?auto_5539 ) ( ON ?auto_5536 ?auto_5537 ) ( CLEAR ?auto_5536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5538 ?auto_5539 ?auto_5537 )
      ( MAKE-1PILE ?auto_5536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5542 - BLOCK
      ?auto_5543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5543 ) ( CLEAR ?auto_5542 ) ( ON-TABLE ?auto_5542 ) ( not ( = ?auto_5542 ?auto_5543 ) ) )
    :subtasks
    ( ( !STACK ?auto_5543 ?auto_5542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5544 - BLOCK
      ?auto_5545 - BLOCK
    )
    :vars
    (
      ?auto_5546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5544 ) ( ON-TABLE ?auto_5544 ) ( not ( = ?auto_5544 ?auto_5545 ) ) ( ON ?auto_5545 ?auto_5546 ) ( CLEAR ?auto_5545 ) ( HAND-EMPTY ) ( not ( = ?auto_5544 ?auto_5546 ) ) ( not ( = ?auto_5545 ?auto_5546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5545 ?auto_5546 )
      ( MAKE-2PILE ?auto_5544 ?auto_5545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5547 - BLOCK
      ?auto_5548 - BLOCK
    )
    :vars
    (
      ?auto_5549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5547 ?auto_5548 ) ) ( ON ?auto_5548 ?auto_5549 ) ( CLEAR ?auto_5548 ) ( not ( = ?auto_5547 ?auto_5549 ) ) ( not ( = ?auto_5548 ?auto_5549 ) ) ( HOLDING ?auto_5547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5547 )
      ( MAKE-2PILE ?auto_5547 ?auto_5548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5550 - BLOCK
      ?auto_5551 - BLOCK
    )
    :vars
    (
      ?auto_5552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5550 ?auto_5551 ) ) ( ON ?auto_5551 ?auto_5552 ) ( not ( = ?auto_5550 ?auto_5552 ) ) ( not ( = ?auto_5551 ?auto_5552 ) ) ( ON ?auto_5550 ?auto_5551 ) ( CLEAR ?auto_5550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5552 ?auto_5551 )
      ( MAKE-2PILE ?auto_5550 ?auto_5551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5553 - BLOCK
      ?auto_5554 - BLOCK
    )
    :vars
    (
      ?auto_5555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5553 ?auto_5554 ) ) ( ON ?auto_5554 ?auto_5555 ) ( not ( = ?auto_5553 ?auto_5555 ) ) ( not ( = ?auto_5554 ?auto_5555 ) ) ( ON-TABLE ?auto_5555 ) ( HOLDING ?auto_5553 ) ( CLEAR ?auto_5554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5555 ?auto_5554 ?auto_5553 )
      ( MAKE-2PILE ?auto_5553 ?auto_5554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5556 - BLOCK
      ?auto_5557 - BLOCK
    )
    :vars
    (
      ?auto_5558 - BLOCK
      ?auto_5559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5556 ?auto_5557 ) ) ( ON ?auto_5557 ?auto_5558 ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( ON-TABLE ?auto_5558 ) ( CLEAR ?auto_5557 ) ( ON ?auto_5556 ?auto_5559 ) ( CLEAR ?auto_5556 ) ( HAND-EMPTY ) ( not ( = ?auto_5556 ?auto_5559 ) ) ( not ( = ?auto_5557 ?auto_5559 ) ) ( not ( = ?auto_5558 ?auto_5559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5556 ?auto_5559 )
      ( MAKE-2PILE ?auto_5556 ?auto_5557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5560 - BLOCK
      ?auto_5561 - BLOCK
    )
    :vars
    (
      ?auto_5563 - BLOCK
      ?auto_5562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5560 ?auto_5561 ) ) ( not ( = ?auto_5560 ?auto_5563 ) ) ( not ( = ?auto_5561 ?auto_5563 ) ) ( ON-TABLE ?auto_5563 ) ( ON ?auto_5560 ?auto_5562 ) ( CLEAR ?auto_5560 ) ( not ( = ?auto_5560 ?auto_5562 ) ) ( not ( = ?auto_5561 ?auto_5562 ) ) ( not ( = ?auto_5563 ?auto_5562 ) ) ( HOLDING ?auto_5561 ) ( CLEAR ?auto_5563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5563 ?auto_5561 )
      ( MAKE-2PILE ?auto_5560 ?auto_5561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5564 - BLOCK
      ?auto_5565 - BLOCK
    )
    :vars
    (
      ?auto_5567 - BLOCK
      ?auto_5566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5564 ?auto_5565 ) ) ( not ( = ?auto_5564 ?auto_5567 ) ) ( not ( = ?auto_5565 ?auto_5567 ) ) ( ON-TABLE ?auto_5567 ) ( ON ?auto_5564 ?auto_5566 ) ( not ( = ?auto_5564 ?auto_5566 ) ) ( not ( = ?auto_5565 ?auto_5566 ) ) ( not ( = ?auto_5567 ?auto_5566 ) ) ( CLEAR ?auto_5567 ) ( ON ?auto_5565 ?auto_5564 ) ( CLEAR ?auto_5565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5566 ?auto_5564 )
      ( MAKE-2PILE ?auto_5564 ?auto_5565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5568 - BLOCK
      ?auto_5569 - BLOCK
    )
    :vars
    (
      ?auto_5570 - BLOCK
      ?auto_5571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5568 ?auto_5569 ) ) ( not ( = ?auto_5568 ?auto_5570 ) ) ( not ( = ?auto_5569 ?auto_5570 ) ) ( ON ?auto_5568 ?auto_5571 ) ( not ( = ?auto_5568 ?auto_5571 ) ) ( not ( = ?auto_5569 ?auto_5571 ) ) ( not ( = ?auto_5570 ?auto_5571 ) ) ( ON ?auto_5569 ?auto_5568 ) ( CLEAR ?auto_5569 ) ( ON-TABLE ?auto_5571 ) ( HOLDING ?auto_5570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5570 )
      ( MAKE-2PILE ?auto_5568 ?auto_5569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5572 - BLOCK
      ?auto_5573 - BLOCK
    )
    :vars
    (
      ?auto_5575 - BLOCK
      ?auto_5574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5572 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5575 ) ) ( not ( = ?auto_5573 ?auto_5575 ) ) ( ON ?auto_5572 ?auto_5574 ) ( not ( = ?auto_5572 ?auto_5574 ) ) ( not ( = ?auto_5573 ?auto_5574 ) ) ( not ( = ?auto_5575 ?auto_5574 ) ) ( ON ?auto_5573 ?auto_5572 ) ( ON-TABLE ?auto_5574 ) ( ON ?auto_5575 ?auto_5573 ) ( CLEAR ?auto_5575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5574 ?auto_5572 ?auto_5573 )
      ( MAKE-2PILE ?auto_5572 ?auto_5573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5579 - BLOCK
      ?auto_5580 - BLOCK
      ?auto_5581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5581 ) ( CLEAR ?auto_5580 ) ( ON-TABLE ?auto_5579 ) ( ON ?auto_5580 ?auto_5579 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5581 ) ) )
    :subtasks
    ( ( !STACK ?auto_5581 ?auto_5580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5582 - BLOCK
      ?auto_5583 - BLOCK
      ?auto_5584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5583 ) ( ON-TABLE ?auto_5582 ) ( ON ?auto_5583 ?auto_5582 ) ( not ( = ?auto_5582 ?auto_5583 ) ) ( not ( = ?auto_5582 ?auto_5584 ) ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( ON-TABLE ?auto_5584 ) ( CLEAR ?auto_5584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5584 )
      ( MAKE-3PILE ?auto_5582 ?auto_5583 ?auto_5584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5585 - BLOCK
      ?auto_5586 - BLOCK
      ?auto_5587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5585 ) ( not ( = ?auto_5585 ?auto_5586 ) ) ( not ( = ?auto_5585 ?auto_5587 ) ) ( not ( = ?auto_5586 ?auto_5587 ) ) ( ON-TABLE ?auto_5587 ) ( CLEAR ?auto_5587 ) ( HOLDING ?auto_5586 ) ( CLEAR ?auto_5585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5585 ?auto_5586 )
      ( MAKE-3PILE ?auto_5585 ?auto_5586 ?auto_5587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5588 - BLOCK
      ?auto_5589 - BLOCK
      ?auto_5590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5588 ) ( not ( = ?auto_5588 ?auto_5589 ) ) ( not ( = ?auto_5588 ?auto_5590 ) ) ( not ( = ?auto_5589 ?auto_5590 ) ) ( ON-TABLE ?auto_5590 ) ( CLEAR ?auto_5588 ) ( ON ?auto_5589 ?auto_5590 ) ( CLEAR ?auto_5589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5590 )
      ( MAKE-3PILE ?auto_5588 ?auto_5589 ?auto_5590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5591 - BLOCK
      ?auto_5592 - BLOCK
      ?auto_5593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5591 ?auto_5592 ) ) ( not ( = ?auto_5591 ?auto_5593 ) ) ( not ( = ?auto_5592 ?auto_5593 ) ) ( ON-TABLE ?auto_5593 ) ( ON ?auto_5592 ?auto_5593 ) ( CLEAR ?auto_5592 ) ( HOLDING ?auto_5591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5591 )
      ( MAKE-3PILE ?auto_5591 ?auto_5592 ?auto_5593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5594 - BLOCK
      ?auto_5595 - BLOCK
      ?auto_5596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5594 ?auto_5595 ) ) ( not ( = ?auto_5594 ?auto_5596 ) ) ( not ( = ?auto_5595 ?auto_5596 ) ) ( ON-TABLE ?auto_5596 ) ( ON ?auto_5595 ?auto_5596 ) ( ON ?auto_5594 ?auto_5595 ) ( CLEAR ?auto_5594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5596 ?auto_5595 )
      ( MAKE-3PILE ?auto_5594 ?auto_5595 ?auto_5596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5597 - BLOCK
      ?auto_5598 - BLOCK
      ?auto_5599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5597 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5599 ) ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( ON-TABLE ?auto_5599 ) ( ON ?auto_5598 ?auto_5599 ) ( HOLDING ?auto_5597 ) ( CLEAR ?auto_5598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5599 ?auto_5598 ?auto_5597 )
      ( MAKE-3PILE ?auto_5597 ?auto_5598 ?auto_5599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5600 - BLOCK
      ?auto_5601 - BLOCK
      ?auto_5602 - BLOCK
    )
    :vars
    (
      ?auto_5603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5600 ?auto_5601 ) ) ( not ( = ?auto_5600 ?auto_5602 ) ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( ON-TABLE ?auto_5602 ) ( ON ?auto_5601 ?auto_5602 ) ( CLEAR ?auto_5601 ) ( ON ?auto_5600 ?auto_5603 ) ( CLEAR ?auto_5600 ) ( HAND-EMPTY ) ( not ( = ?auto_5600 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5602 ?auto_5603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5600 ?auto_5603 )
      ( MAKE-3PILE ?auto_5600 ?auto_5601 ?auto_5602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5604 - BLOCK
      ?auto_5605 - BLOCK
      ?auto_5606 - BLOCK
    )
    :vars
    (
      ?auto_5607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5604 ?auto_5606 ) ) ( not ( = ?auto_5605 ?auto_5606 ) ) ( ON-TABLE ?auto_5606 ) ( ON ?auto_5604 ?auto_5607 ) ( CLEAR ?auto_5604 ) ( not ( = ?auto_5604 ?auto_5607 ) ) ( not ( = ?auto_5605 ?auto_5607 ) ) ( not ( = ?auto_5606 ?auto_5607 ) ) ( HOLDING ?auto_5605 ) ( CLEAR ?auto_5606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5606 ?auto_5605 )
      ( MAKE-3PILE ?auto_5604 ?auto_5605 ?auto_5606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5608 - BLOCK
      ?auto_5609 - BLOCK
      ?auto_5610 - BLOCK
    )
    :vars
    (
      ?auto_5611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5608 ?auto_5609 ) ) ( not ( = ?auto_5608 ?auto_5610 ) ) ( not ( = ?auto_5609 ?auto_5610 ) ) ( ON-TABLE ?auto_5610 ) ( ON ?auto_5608 ?auto_5611 ) ( not ( = ?auto_5608 ?auto_5611 ) ) ( not ( = ?auto_5609 ?auto_5611 ) ) ( not ( = ?auto_5610 ?auto_5611 ) ) ( CLEAR ?auto_5610 ) ( ON ?auto_5609 ?auto_5608 ) ( CLEAR ?auto_5609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5611 ?auto_5608 )
      ( MAKE-3PILE ?auto_5608 ?auto_5609 ?auto_5610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5612 - BLOCK
      ?auto_5613 - BLOCK
      ?auto_5614 - BLOCK
    )
    :vars
    (
      ?auto_5615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5612 ?auto_5614 ) ) ( not ( = ?auto_5613 ?auto_5614 ) ) ( ON ?auto_5612 ?auto_5615 ) ( not ( = ?auto_5612 ?auto_5615 ) ) ( not ( = ?auto_5613 ?auto_5615 ) ) ( not ( = ?auto_5614 ?auto_5615 ) ) ( ON ?auto_5613 ?auto_5612 ) ( CLEAR ?auto_5613 ) ( ON-TABLE ?auto_5615 ) ( HOLDING ?auto_5614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5614 )
      ( MAKE-3PILE ?auto_5612 ?auto_5613 ?auto_5614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5616 - BLOCK
      ?auto_5617 - BLOCK
      ?auto_5618 - BLOCK
    )
    :vars
    (
      ?auto_5619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5616 ?auto_5617 ) ) ( not ( = ?auto_5616 ?auto_5618 ) ) ( not ( = ?auto_5617 ?auto_5618 ) ) ( ON ?auto_5616 ?auto_5619 ) ( not ( = ?auto_5616 ?auto_5619 ) ) ( not ( = ?auto_5617 ?auto_5619 ) ) ( not ( = ?auto_5618 ?auto_5619 ) ) ( ON ?auto_5617 ?auto_5616 ) ( ON-TABLE ?auto_5619 ) ( ON ?auto_5618 ?auto_5617 ) ( CLEAR ?auto_5618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5619 ?auto_5616 ?auto_5617 )
      ( MAKE-3PILE ?auto_5616 ?auto_5617 ?auto_5618 ) )
  )

)

