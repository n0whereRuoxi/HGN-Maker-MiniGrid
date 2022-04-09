( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5436 - SURFACE
      ?auto_5437 - SURFACE
    )
    :vars
    (
      ?auto_5438 - HOIST
      ?auto_5439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5438 ?auto_5439 ) ( SURFACE-AT ?auto_5436 ?auto_5439 ) ( CLEAR ?auto_5436 ) ( LIFTING ?auto_5438 ?auto_5437 ) ( IS-CRATE ?auto_5437 ) ( not ( = ?auto_5436 ?auto_5437 ) ) )
    :subtasks
    ( ( !DROP ?auto_5438 ?auto_5437 ?auto_5436 ?auto_5439 )
      ( MAKE-1CRATE-VERIFY ?auto_5436 ?auto_5437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5440 - SURFACE
      ?auto_5441 - SURFACE
    )
    :vars
    (
      ?auto_5443 - HOIST
      ?auto_5442 - PLACE
      ?auto_5444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5443 ?auto_5442 ) ( SURFACE-AT ?auto_5440 ?auto_5442 ) ( CLEAR ?auto_5440 ) ( IS-CRATE ?auto_5441 ) ( not ( = ?auto_5440 ?auto_5441 ) ) ( TRUCK-AT ?auto_5444 ?auto_5442 ) ( AVAILABLE ?auto_5443 ) ( IN ?auto_5441 ?auto_5444 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5443 ?auto_5441 ?auto_5444 ?auto_5442 )
      ( MAKE-1CRATE ?auto_5440 ?auto_5441 )
      ( MAKE-1CRATE-VERIFY ?auto_5440 ?auto_5441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5445 - SURFACE
      ?auto_5446 - SURFACE
    )
    :vars
    (
      ?auto_5447 - HOIST
      ?auto_5449 - PLACE
      ?auto_5448 - TRUCK
      ?auto_5450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5447 ?auto_5449 ) ( SURFACE-AT ?auto_5445 ?auto_5449 ) ( CLEAR ?auto_5445 ) ( IS-CRATE ?auto_5446 ) ( not ( = ?auto_5445 ?auto_5446 ) ) ( AVAILABLE ?auto_5447 ) ( IN ?auto_5446 ?auto_5448 ) ( TRUCK-AT ?auto_5448 ?auto_5450 ) ( not ( = ?auto_5450 ?auto_5449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5448 ?auto_5450 ?auto_5449 )
      ( MAKE-1CRATE ?auto_5445 ?auto_5446 )
      ( MAKE-1CRATE-VERIFY ?auto_5445 ?auto_5446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5451 - SURFACE
      ?auto_5452 - SURFACE
    )
    :vars
    (
      ?auto_5456 - HOIST
      ?auto_5455 - PLACE
      ?auto_5454 - TRUCK
      ?auto_5453 - PLACE
      ?auto_5457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5456 ?auto_5455 ) ( SURFACE-AT ?auto_5451 ?auto_5455 ) ( CLEAR ?auto_5451 ) ( IS-CRATE ?auto_5452 ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( AVAILABLE ?auto_5456 ) ( TRUCK-AT ?auto_5454 ?auto_5453 ) ( not ( = ?auto_5453 ?auto_5455 ) ) ( HOIST-AT ?auto_5457 ?auto_5453 ) ( LIFTING ?auto_5457 ?auto_5452 ) ( not ( = ?auto_5456 ?auto_5457 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5457 ?auto_5452 ?auto_5454 ?auto_5453 )
      ( MAKE-1CRATE ?auto_5451 ?auto_5452 )
      ( MAKE-1CRATE-VERIFY ?auto_5451 ?auto_5452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5458 - SURFACE
      ?auto_5459 - SURFACE
    )
    :vars
    (
      ?auto_5461 - HOIST
      ?auto_5460 - PLACE
      ?auto_5462 - TRUCK
      ?auto_5463 - PLACE
      ?auto_5464 - HOIST
      ?auto_5465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5461 ?auto_5460 ) ( SURFACE-AT ?auto_5458 ?auto_5460 ) ( CLEAR ?auto_5458 ) ( IS-CRATE ?auto_5459 ) ( not ( = ?auto_5458 ?auto_5459 ) ) ( AVAILABLE ?auto_5461 ) ( TRUCK-AT ?auto_5462 ?auto_5463 ) ( not ( = ?auto_5463 ?auto_5460 ) ) ( HOIST-AT ?auto_5464 ?auto_5463 ) ( not ( = ?auto_5461 ?auto_5464 ) ) ( AVAILABLE ?auto_5464 ) ( SURFACE-AT ?auto_5459 ?auto_5463 ) ( ON ?auto_5459 ?auto_5465 ) ( CLEAR ?auto_5459 ) ( not ( = ?auto_5458 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5465 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5464 ?auto_5459 ?auto_5465 ?auto_5463 )
      ( MAKE-1CRATE ?auto_5458 ?auto_5459 )
      ( MAKE-1CRATE-VERIFY ?auto_5458 ?auto_5459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5466 - SURFACE
      ?auto_5467 - SURFACE
    )
    :vars
    (
      ?auto_5473 - HOIST
      ?auto_5469 - PLACE
      ?auto_5471 - PLACE
      ?auto_5472 - HOIST
      ?auto_5470 - SURFACE
      ?auto_5468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5473 ?auto_5469 ) ( SURFACE-AT ?auto_5466 ?auto_5469 ) ( CLEAR ?auto_5466 ) ( IS-CRATE ?auto_5467 ) ( not ( = ?auto_5466 ?auto_5467 ) ) ( AVAILABLE ?auto_5473 ) ( not ( = ?auto_5471 ?auto_5469 ) ) ( HOIST-AT ?auto_5472 ?auto_5471 ) ( not ( = ?auto_5473 ?auto_5472 ) ) ( AVAILABLE ?auto_5472 ) ( SURFACE-AT ?auto_5467 ?auto_5471 ) ( ON ?auto_5467 ?auto_5470 ) ( CLEAR ?auto_5467 ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( not ( = ?auto_5467 ?auto_5470 ) ) ( TRUCK-AT ?auto_5468 ?auto_5469 ) )
    :subtasks
    ( ( !DRIVE ?auto_5468 ?auto_5469 ?auto_5471 )
      ( MAKE-1CRATE ?auto_5466 ?auto_5467 )
      ( MAKE-1CRATE-VERIFY ?auto_5466 ?auto_5467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5479 - SURFACE
      ?auto_5480 - SURFACE
    )
    :vars
    (
      ?auto_5481 - HOIST
      ?auto_5482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5481 ?auto_5482 ) ( SURFACE-AT ?auto_5479 ?auto_5482 ) ( CLEAR ?auto_5479 ) ( LIFTING ?auto_5481 ?auto_5480 ) ( IS-CRATE ?auto_5480 ) ( not ( = ?auto_5479 ?auto_5480 ) ) )
    :subtasks
    ( ( !DROP ?auto_5481 ?auto_5480 ?auto_5479 ?auto_5482 )
      ( MAKE-1CRATE-VERIFY ?auto_5479 ?auto_5480 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5483 - SURFACE
      ?auto_5484 - SURFACE
      ?auto_5485 - SURFACE
    )
    :vars
    (
      ?auto_5486 - HOIST
      ?auto_5487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5486 ?auto_5487 ) ( SURFACE-AT ?auto_5484 ?auto_5487 ) ( CLEAR ?auto_5484 ) ( LIFTING ?auto_5486 ?auto_5485 ) ( IS-CRATE ?auto_5485 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( ON ?auto_5484 ?auto_5483 ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5484 ?auto_5485 )
      ( MAKE-2CRATE-VERIFY ?auto_5483 ?auto_5484 ?auto_5485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5488 - SURFACE
      ?auto_5489 - SURFACE
    )
    :vars
    (
      ?auto_5490 - HOIST
      ?auto_5491 - PLACE
      ?auto_5492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5490 ?auto_5491 ) ( SURFACE-AT ?auto_5488 ?auto_5491 ) ( CLEAR ?auto_5488 ) ( IS-CRATE ?auto_5489 ) ( not ( = ?auto_5488 ?auto_5489 ) ) ( TRUCK-AT ?auto_5492 ?auto_5491 ) ( AVAILABLE ?auto_5490 ) ( IN ?auto_5489 ?auto_5492 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5490 ?auto_5489 ?auto_5492 ?auto_5491 )
      ( MAKE-1CRATE ?auto_5488 ?auto_5489 )
      ( MAKE-1CRATE-VERIFY ?auto_5488 ?auto_5489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5493 - SURFACE
      ?auto_5494 - SURFACE
      ?auto_5495 - SURFACE
    )
    :vars
    (
      ?auto_5496 - HOIST
      ?auto_5497 - PLACE
      ?auto_5498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5496 ?auto_5497 ) ( SURFACE-AT ?auto_5494 ?auto_5497 ) ( CLEAR ?auto_5494 ) ( IS-CRATE ?auto_5495 ) ( not ( = ?auto_5494 ?auto_5495 ) ) ( TRUCK-AT ?auto_5498 ?auto_5497 ) ( AVAILABLE ?auto_5496 ) ( IN ?auto_5495 ?auto_5498 ) ( ON ?auto_5494 ?auto_5493 ) ( not ( = ?auto_5493 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5495 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5494 ?auto_5495 )
      ( MAKE-2CRATE-VERIFY ?auto_5493 ?auto_5494 ?auto_5495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5499 - SURFACE
      ?auto_5500 - SURFACE
    )
    :vars
    (
      ?auto_5502 - HOIST
      ?auto_5504 - PLACE
      ?auto_5503 - TRUCK
      ?auto_5501 - SURFACE
      ?auto_5505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5502 ?auto_5504 ) ( SURFACE-AT ?auto_5499 ?auto_5504 ) ( CLEAR ?auto_5499 ) ( IS-CRATE ?auto_5500 ) ( not ( = ?auto_5499 ?auto_5500 ) ) ( AVAILABLE ?auto_5502 ) ( IN ?auto_5500 ?auto_5503 ) ( ON ?auto_5499 ?auto_5501 ) ( not ( = ?auto_5501 ?auto_5499 ) ) ( not ( = ?auto_5501 ?auto_5500 ) ) ( TRUCK-AT ?auto_5503 ?auto_5505 ) ( not ( = ?auto_5505 ?auto_5504 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5503 ?auto_5505 ?auto_5504 )
      ( MAKE-2CRATE ?auto_5501 ?auto_5499 ?auto_5500 )
      ( MAKE-1CRATE-VERIFY ?auto_5499 ?auto_5500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5506 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5508 - SURFACE
    )
    :vars
    (
      ?auto_5512 - HOIST
      ?auto_5511 - PLACE
      ?auto_5510 - TRUCK
      ?auto_5509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5512 ?auto_5511 ) ( SURFACE-AT ?auto_5507 ?auto_5511 ) ( CLEAR ?auto_5507 ) ( IS-CRATE ?auto_5508 ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( AVAILABLE ?auto_5512 ) ( IN ?auto_5508 ?auto_5510 ) ( ON ?auto_5507 ?auto_5506 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( TRUCK-AT ?auto_5510 ?auto_5509 ) ( not ( = ?auto_5509 ?auto_5511 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5507 ?auto_5508 )
      ( MAKE-2CRATE-VERIFY ?auto_5506 ?auto_5507 ?auto_5508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5513 - SURFACE
      ?auto_5514 - SURFACE
    )
    :vars
    (
      ?auto_5516 - HOIST
      ?auto_5517 - PLACE
      ?auto_5519 - SURFACE
      ?auto_5515 - TRUCK
      ?auto_5518 - PLACE
      ?auto_5520 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5516 ?auto_5517 ) ( SURFACE-AT ?auto_5513 ?auto_5517 ) ( CLEAR ?auto_5513 ) ( IS-CRATE ?auto_5514 ) ( not ( = ?auto_5513 ?auto_5514 ) ) ( AVAILABLE ?auto_5516 ) ( ON ?auto_5513 ?auto_5519 ) ( not ( = ?auto_5519 ?auto_5513 ) ) ( not ( = ?auto_5519 ?auto_5514 ) ) ( TRUCK-AT ?auto_5515 ?auto_5518 ) ( not ( = ?auto_5518 ?auto_5517 ) ) ( HOIST-AT ?auto_5520 ?auto_5518 ) ( LIFTING ?auto_5520 ?auto_5514 ) ( not ( = ?auto_5516 ?auto_5520 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5520 ?auto_5514 ?auto_5515 ?auto_5518 )
      ( MAKE-2CRATE ?auto_5519 ?auto_5513 ?auto_5514 )
      ( MAKE-1CRATE-VERIFY ?auto_5513 ?auto_5514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5521 - SURFACE
      ?auto_5522 - SURFACE
      ?auto_5523 - SURFACE
    )
    :vars
    (
      ?auto_5524 - HOIST
      ?auto_5525 - PLACE
      ?auto_5528 - TRUCK
      ?auto_5526 - PLACE
      ?auto_5527 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5524 ?auto_5525 ) ( SURFACE-AT ?auto_5522 ?auto_5525 ) ( CLEAR ?auto_5522 ) ( IS-CRATE ?auto_5523 ) ( not ( = ?auto_5522 ?auto_5523 ) ) ( AVAILABLE ?auto_5524 ) ( ON ?auto_5522 ?auto_5521 ) ( not ( = ?auto_5521 ?auto_5522 ) ) ( not ( = ?auto_5521 ?auto_5523 ) ) ( TRUCK-AT ?auto_5528 ?auto_5526 ) ( not ( = ?auto_5526 ?auto_5525 ) ) ( HOIST-AT ?auto_5527 ?auto_5526 ) ( LIFTING ?auto_5527 ?auto_5523 ) ( not ( = ?auto_5524 ?auto_5527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5522 ?auto_5523 )
      ( MAKE-2CRATE-VERIFY ?auto_5521 ?auto_5522 ?auto_5523 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5529 - SURFACE
      ?auto_5530 - SURFACE
    )
    :vars
    (
      ?auto_5535 - HOIST
      ?auto_5532 - PLACE
      ?auto_5536 - SURFACE
      ?auto_5531 - TRUCK
      ?auto_5533 - PLACE
      ?auto_5534 - HOIST
      ?auto_5537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5535 ?auto_5532 ) ( SURFACE-AT ?auto_5529 ?auto_5532 ) ( CLEAR ?auto_5529 ) ( IS-CRATE ?auto_5530 ) ( not ( = ?auto_5529 ?auto_5530 ) ) ( AVAILABLE ?auto_5535 ) ( ON ?auto_5529 ?auto_5536 ) ( not ( = ?auto_5536 ?auto_5529 ) ) ( not ( = ?auto_5536 ?auto_5530 ) ) ( TRUCK-AT ?auto_5531 ?auto_5533 ) ( not ( = ?auto_5533 ?auto_5532 ) ) ( HOIST-AT ?auto_5534 ?auto_5533 ) ( not ( = ?auto_5535 ?auto_5534 ) ) ( AVAILABLE ?auto_5534 ) ( SURFACE-AT ?auto_5530 ?auto_5533 ) ( ON ?auto_5530 ?auto_5537 ) ( CLEAR ?auto_5530 ) ( not ( = ?auto_5529 ?auto_5537 ) ) ( not ( = ?auto_5530 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5537 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5534 ?auto_5530 ?auto_5537 ?auto_5533 )
      ( MAKE-2CRATE ?auto_5536 ?auto_5529 ?auto_5530 )
      ( MAKE-1CRATE-VERIFY ?auto_5529 ?auto_5530 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5538 - SURFACE
      ?auto_5539 - SURFACE
      ?auto_5540 - SURFACE
    )
    :vars
    (
      ?auto_5546 - HOIST
      ?auto_5541 - PLACE
      ?auto_5545 - TRUCK
      ?auto_5544 - PLACE
      ?auto_5542 - HOIST
      ?auto_5543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5546 ?auto_5541 ) ( SURFACE-AT ?auto_5539 ?auto_5541 ) ( CLEAR ?auto_5539 ) ( IS-CRATE ?auto_5540 ) ( not ( = ?auto_5539 ?auto_5540 ) ) ( AVAILABLE ?auto_5546 ) ( ON ?auto_5539 ?auto_5538 ) ( not ( = ?auto_5538 ?auto_5539 ) ) ( not ( = ?auto_5538 ?auto_5540 ) ) ( TRUCK-AT ?auto_5545 ?auto_5544 ) ( not ( = ?auto_5544 ?auto_5541 ) ) ( HOIST-AT ?auto_5542 ?auto_5544 ) ( not ( = ?auto_5546 ?auto_5542 ) ) ( AVAILABLE ?auto_5542 ) ( SURFACE-AT ?auto_5540 ?auto_5544 ) ( ON ?auto_5540 ?auto_5543 ) ( CLEAR ?auto_5540 ) ( not ( = ?auto_5539 ?auto_5543 ) ) ( not ( = ?auto_5540 ?auto_5543 ) ) ( not ( = ?auto_5538 ?auto_5543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5539 ?auto_5540 )
      ( MAKE-2CRATE-VERIFY ?auto_5538 ?auto_5539 ?auto_5540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5547 - SURFACE
      ?auto_5548 - SURFACE
    )
    :vars
    (
      ?auto_5549 - HOIST
      ?auto_5552 - PLACE
      ?auto_5554 - SURFACE
      ?auto_5555 - PLACE
      ?auto_5550 - HOIST
      ?auto_5553 - SURFACE
      ?auto_5551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5549 ?auto_5552 ) ( SURFACE-AT ?auto_5547 ?auto_5552 ) ( CLEAR ?auto_5547 ) ( IS-CRATE ?auto_5548 ) ( not ( = ?auto_5547 ?auto_5548 ) ) ( AVAILABLE ?auto_5549 ) ( ON ?auto_5547 ?auto_5554 ) ( not ( = ?auto_5554 ?auto_5547 ) ) ( not ( = ?auto_5554 ?auto_5548 ) ) ( not ( = ?auto_5555 ?auto_5552 ) ) ( HOIST-AT ?auto_5550 ?auto_5555 ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( AVAILABLE ?auto_5550 ) ( SURFACE-AT ?auto_5548 ?auto_5555 ) ( ON ?auto_5548 ?auto_5553 ) ( CLEAR ?auto_5548 ) ( not ( = ?auto_5547 ?auto_5553 ) ) ( not ( = ?auto_5548 ?auto_5553 ) ) ( not ( = ?auto_5554 ?auto_5553 ) ) ( TRUCK-AT ?auto_5551 ?auto_5552 ) )
    :subtasks
    ( ( !DRIVE ?auto_5551 ?auto_5552 ?auto_5555 )
      ( MAKE-2CRATE ?auto_5554 ?auto_5547 ?auto_5548 )
      ( MAKE-1CRATE-VERIFY ?auto_5547 ?auto_5548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5556 - SURFACE
      ?auto_5557 - SURFACE
      ?auto_5558 - SURFACE
    )
    :vars
    (
      ?auto_5561 - HOIST
      ?auto_5563 - PLACE
      ?auto_5564 - PLACE
      ?auto_5559 - HOIST
      ?auto_5562 - SURFACE
      ?auto_5560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5561 ?auto_5563 ) ( SURFACE-AT ?auto_5557 ?auto_5563 ) ( CLEAR ?auto_5557 ) ( IS-CRATE ?auto_5558 ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( AVAILABLE ?auto_5561 ) ( ON ?auto_5557 ?auto_5556 ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5564 ?auto_5563 ) ) ( HOIST-AT ?auto_5559 ?auto_5564 ) ( not ( = ?auto_5561 ?auto_5559 ) ) ( AVAILABLE ?auto_5559 ) ( SURFACE-AT ?auto_5558 ?auto_5564 ) ( ON ?auto_5558 ?auto_5562 ) ( CLEAR ?auto_5558 ) ( not ( = ?auto_5557 ?auto_5562 ) ) ( not ( = ?auto_5558 ?auto_5562 ) ) ( not ( = ?auto_5556 ?auto_5562 ) ) ( TRUCK-AT ?auto_5560 ?auto_5563 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5557 ?auto_5558 )
      ( MAKE-2CRATE-VERIFY ?auto_5556 ?auto_5557 ?auto_5558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5565 - SURFACE
      ?auto_5566 - SURFACE
    )
    :vars
    (
      ?auto_5570 - HOIST
      ?auto_5568 - PLACE
      ?auto_5567 - SURFACE
      ?auto_5573 - PLACE
      ?auto_5571 - HOIST
      ?auto_5569 - SURFACE
      ?auto_5572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5570 ?auto_5568 ) ( IS-CRATE ?auto_5566 ) ( not ( = ?auto_5565 ?auto_5566 ) ) ( not ( = ?auto_5567 ?auto_5565 ) ) ( not ( = ?auto_5567 ?auto_5566 ) ) ( not ( = ?auto_5573 ?auto_5568 ) ) ( HOIST-AT ?auto_5571 ?auto_5573 ) ( not ( = ?auto_5570 ?auto_5571 ) ) ( AVAILABLE ?auto_5571 ) ( SURFACE-AT ?auto_5566 ?auto_5573 ) ( ON ?auto_5566 ?auto_5569 ) ( CLEAR ?auto_5566 ) ( not ( = ?auto_5565 ?auto_5569 ) ) ( not ( = ?auto_5566 ?auto_5569 ) ) ( not ( = ?auto_5567 ?auto_5569 ) ) ( TRUCK-AT ?auto_5572 ?auto_5568 ) ( SURFACE-AT ?auto_5567 ?auto_5568 ) ( CLEAR ?auto_5567 ) ( LIFTING ?auto_5570 ?auto_5565 ) ( IS-CRATE ?auto_5565 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5567 ?auto_5565 )
      ( MAKE-2CRATE ?auto_5567 ?auto_5565 ?auto_5566 )
      ( MAKE-1CRATE-VERIFY ?auto_5565 ?auto_5566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5574 - SURFACE
      ?auto_5575 - SURFACE
      ?auto_5576 - SURFACE
    )
    :vars
    (
      ?auto_5579 - HOIST
      ?auto_5577 - PLACE
      ?auto_5582 - PLACE
      ?auto_5578 - HOIST
      ?auto_5581 - SURFACE
      ?auto_5580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5579 ?auto_5577 ) ( IS-CRATE ?auto_5576 ) ( not ( = ?auto_5575 ?auto_5576 ) ) ( not ( = ?auto_5574 ?auto_5575 ) ) ( not ( = ?auto_5574 ?auto_5576 ) ) ( not ( = ?auto_5582 ?auto_5577 ) ) ( HOIST-AT ?auto_5578 ?auto_5582 ) ( not ( = ?auto_5579 ?auto_5578 ) ) ( AVAILABLE ?auto_5578 ) ( SURFACE-AT ?auto_5576 ?auto_5582 ) ( ON ?auto_5576 ?auto_5581 ) ( CLEAR ?auto_5576 ) ( not ( = ?auto_5575 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5574 ?auto_5581 ) ) ( TRUCK-AT ?auto_5580 ?auto_5577 ) ( SURFACE-AT ?auto_5574 ?auto_5577 ) ( CLEAR ?auto_5574 ) ( LIFTING ?auto_5579 ?auto_5575 ) ( IS-CRATE ?auto_5575 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5575 ?auto_5576 )
      ( MAKE-2CRATE-VERIFY ?auto_5574 ?auto_5575 ?auto_5576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5583 - SURFACE
      ?auto_5584 - SURFACE
    )
    :vars
    (
      ?auto_5591 - HOIST
      ?auto_5585 - PLACE
      ?auto_5588 - SURFACE
      ?auto_5590 - PLACE
      ?auto_5589 - HOIST
      ?auto_5587 - SURFACE
      ?auto_5586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5591 ?auto_5585 ) ( IS-CRATE ?auto_5584 ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( not ( = ?auto_5588 ?auto_5583 ) ) ( not ( = ?auto_5588 ?auto_5584 ) ) ( not ( = ?auto_5590 ?auto_5585 ) ) ( HOIST-AT ?auto_5589 ?auto_5590 ) ( not ( = ?auto_5591 ?auto_5589 ) ) ( AVAILABLE ?auto_5589 ) ( SURFACE-AT ?auto_5584 ?auto_5590 ) ( ON ?auto_5584 ?auto_5587 ) ( CLEAR ?auto_5584 ) ( not ( = ?auto_5583 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5587 ) ) ( not ( = ?auto_5588 ?auto_5587 ) ) ( TRUCK-AT ?auto_5586 ?auto_5585 ) ( SURFACE-AT ?auto_5588 ?auto_5585 ) ( CLEAR ?auto_5588 ) ( IS-CRATE ?auto_5583 ) ( AVAILABLE ?auto_5591 ) ( IN ?auto_5583 ?auto_5586 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5591 ?auto_5583 ?auto_5586 ?auto_5585 )
      ( MAKE-2CRATE ?auto_5588 ?auto_5583 ?auto_5584 )
      ( MAKE-1CRATE-VERIFY ?auto_5583 ?auto_5584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5592 - SURFACE
      ?auto_5593 - SURFACE
      ?auto_5594 - SURFACE
    )
    :vars
    (
      ?auto_5595 - HOIST
      ?auto_5598 - PLACE
      ?auto_5599 - PLACE
      ?auto_5600 - HOIST
      ?auto_5597 - SURFACE
      ?auto_5596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5595 ?auto_5598 ) ( IS-CRATE ?auto_5594 ) ( not ( = ?auto_5593 ?auto_5594 ) ) ( not ( = ?auto_5592 ?auto_5593 ) ) ( not ( = ?auto_5592 ?auto_5594 ) ) ( not ( = ?auto_5599 ?auto_5598 ) ) ( HOIST-AT ?auto_5600 ?auto_5599 ) ( not ( = ?auto_5595 ?auto_5600 ) ) ( AVAILABLE ?auto_5600 ) ( SURFACE-AT ?auto_5594 ?auto_5599 ) ( ON ?auto_5594 ?auto_5597 ) ( CLEAR ?auto_5594 ) ( not ( = ?auto_5593 ?auto_5597 ) ) ( not ( = ?auto_5594 ?auto_5597 ) ) ( not ( = ?auto_5592 ?auto_5597 ) ) ( TRUCK-AT ?auto_5596 ?auto_5598 ) ( SURFACE-AT ?auto_5592 ?auto_5598 ) ( CLEAR ?auto_5592 ) ( IS-CRATE ?auto_5593 ) ( AVAILABLE ?auto_5595 ) ( IN ?auto_5593 ?auto_5596 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5593 ?auto_5594 )
      ( MAKE-2CRATE-VERIFY ?auto_5592 ?auto_5593 ?auto_5594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5601 - SURFACE
      ?auto_5602 - SURFACE
    )
    :vars
    (
      ?auto_5605 - HOIST
      ?auto_5603 - PLACE
      ?auto_5604 - SURFACE
      ?auto_5608 - PLACE
      ?auto_5609 - HOIST
      ?auto_5607 - SURFACE
      ?auto_5606 - TRUCK
      ?auto_5610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5605 ?auto_5603 ) ( IS-CRATE ?auto_5602 ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( not ( = ?auto_5604 ?auto_5601 ) ) ( not ( = ?auto_5604 ?auto_5602 ) ) ( not ( = ?auto_5608 ?auto_5603 ) ) ( HOIST-AT ?auto_5609 ?auto_5608 ) ( not ( = ?auto_5605 ?auto_5609 ) ) ( AVAILABLE ?auto_5609 ) ( SURFACE-AT ?auto_5602 ?auto_5608 ) ( ON ?auto_5602 ?auto_5607 ) ( CLEAR ?auto_5602 ) ( not ( = ?auto_5601 ?auto_5607 ) ) ( not ( = ?auto_5602 ?auto_5607 ) ) ( not ( = ?auto_5604 ?auto_5607 ) ) ( SURFACE-AT ?auto_5604 ?auto_5603 ) ( CLEAR ?auto_5604 ) ( IS-CRATE ?auto_5601 ) ( AVAILABLE ?auto_5605 ) ( IN ?auto_5601 ?auto_5606 ) ( TRUCK-AT ?auto_5606 ?auto_5610 ) ( not ( = ?auto_5610 ?auto_5603 ) ) ( not ( = ?auto_5608 ?auto_5610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5606 ?auto_5610 ?auto_5603 )
      ( MAKE-2CRATE ?auto_5604 ?auto_5601 ?auto_5602 )
      ( MAKE-1CRATE-VERIFY ?auto_5601 ?auto_5602 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5611 - SURFACE
      ?auto_5612 - SURFACE
      ?auto_5613 - SURFACE
    )
    :vars
    (
      ?auto_5617 - HOIST
      ?auto_5616 - PLACE
      ?auto_5615 - PLACE
      ?auto_5614 - HOIST
      ?auto_5619 - SURFACE
      ?auto_5620 - TRUCK
      ?auto_5618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5617 ?auto_5616 ) ( IS-CRATE ?auto_5613 ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5611 ?auto_5613 ) ) ( not ( = ?auto_5615 ?auto_5616 ) ) ( HOIST-AT ?auto_5614 ?auto_5615 ) ( not ( = ?auto_5617 ?auto_5614 ) ) ( AVAILABLE ?auto_5614 ) ( SURFACE-AT ?auto_5613 ?auto_5615 ) ( ON ?auto_5613 ?auto_5619 ) ( CLEAR ?auto_5613 ) ( not ( = ?auto_5612 ?auto_5619 ) ) ( not ( = ?auto_5613 ?auto_5619 ) ) ( not ( = ?auto_5611 ?auto_5619 ) ) ( SURFACE-AT ?auto_5611 ?auto_5616 ) ( CLEAR ?auto_5611 ) ( IS-CRATE ?auto_5612 ) ( AVAILABLE ?auto_5617 ) ( IN ?auto_5612 ?auto_5620 ) ( TRUCK-AT ?auto_5620 ?auto_5618 ) ( not ( = ?auto_5618 ?auto_5616 ) ) ( not ( = ?auto_5615 ?auto_5618 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5612 ?auto_5613 )
      ( MAKE-2CRATE-VERIFY ?auto_5611 ?auto_5612 ?auto_5613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5621 - SURFACE
      ?auto_5622 - SURFACE
    )
    :vars
    (
      ?auto_5626 - HOIST
      ?auto_5627 - PLACE
      ?auto_5625 - SURFACE
      ?auto_5623 - PLACE
      ?auto_5630 - HOIST
      ?auto_5628 - SURFACE
      ?auto_5624 - TRUCK
      ?auto_5629 - PLACE
      ?auto_5631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5626 ?auto_5627 ) ( IS-CRATE ?auto_5622 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5625 ?auto_5621 ) ) ( not ( = ?auto_5625 ?auto_5622 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( HOIST-AT ?auto_5630 ?auto_5623 ) ( not ( = ?auto_5626 ?auto_5630 ) ) ( AVAILABLE ?auto_5630 ) ( SURFACE-AT ?auto_5622 ?auto_5623 ) ( ON ?auto_5622 ?auto_5628 ) ( CLEAR ?auto_5622 ) ( not ( = ?auto_5621 ?auto_5628 ) ) ( not ( = ?auto_5622 ?auto_5628 ) ) ( not ( = ?auto_5625 ?auto_5628 ) ) ( SURFACE-AT ?auto_5625 ?auto_5627 ) ( CLEAR ?auto_5625 ) ( IS-CRATE ?auto_5621 ) ( AVAILABLE ?auto_5626 ) ( TRUCK-AT ?auto_5624 ?auto_5629 ) ( not ( = ?auto_5629 ?auto_5627 ) ) ( not ( = ?auto_5623 ?auto_5629 ) ) ( HOIST-AT ?auto_5631 ?auto_5629 ) ( LIFTING ?auto_5631 ?auto_5621 ) ( not ( = ?auto_5626 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5631 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5631 ?auto_5621 ?auto_5624 ?auto_5629 )
      ( MAKE-2CRATE ?auto_5625 ?auto_5621 ?auto_5622 )
      ( MAKE-1CRATE-VERIFY ?auto_5621 ?auto_5622 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5632 - SURFACE
      ?auto_5633 - SURFACE
      ?auto_5634 - SURFACE
    )
    :vars
    (
      ?auto_5638 - HOIST
      ?auto_5636 - PLACE
      ?auto_5637 - PLACE
      ?auto_5640 - HOIST
      ?auto_5639 - SURFACE
      ?auto_5642 - TRUCK
      ?auto_5635 - PLACE
      ?auto_5641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5638 ?auto_5636 ) ( IS-CRATE ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( not ( = ?auto_5637 ?auto_5636 ) ) ( HOIST-AT ?auto_5640 ?auto_5637 ) ( not ( = ?auto_5638 ?auto_5640 ) ) ( AVAILABLE ?auto_5640 ) ( SURFACE-AT ?auto_5634 ?auto_5637 ) ( ON ?auto_5634 ?auto_5639 ) ( CLEAR ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5639 ) ) ( not ( = ?auto_5634 ?auto_5639 ) ) ( not ( = ?auto_5632 ?auto_5639 ) ) ( SURFACE-AT ?auto_5632 ?auto_5636 ) ( CLEAR ?auto_5632 ) ( IS-CRATE ?auto_5633 ) ( AVAILABLE ?auto_5638 ) ( TRUCK-AT ?auto_5642 ?auto_5635 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( not ( = ?auto_5637 ?auto_5635 ) ) ( HOIST-AT ?auto_5641 ?auto_5635 ) ( LIFTING ?auto_5641 ?auto_5633 ) ( not ( = ?auto_5638 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5641 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5633 ?auto_5634 )
      ( MAKE-2CRATE-VERIFY ?auto_5632 ?auto_5633 ?auto_5634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5643 - SURFACE
      ?auto_5644 - SURFACE
    )
    :vars
    (
      ?auto_5645 - HOIST
      ?auto_5648 - PLACE
      ?auto_5653 - SURFACE
      ?auto_5646 - PLACE
      ?auto_5652 - HOIST
      ?auto_5650 - SURFACE
      ?auto_5647 - TRUCK
      ?auto_5651 - PLACE
      ?auto_5649 - HOIST
      ?auto_5654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5645 ?auto_5648 ) ( IS-CRATE ?auto_5644 ) ( not ( = ?auto_5643 ?auto_5644 ) ) ( not ( = ?auto_5653 ?auto_5643 ) ) ( not ( = ?auto_5653 ?auto_5644 ) ) ( not ( = ?auto_5646 ?auto_5648 ) ) ( HOIST-AT ?auto_5652 ?auto_5646 ) ( not ( = ?auto_5645 ?auto_5652 ) ) ( AVAILABLE ?auto_5652 ) ( SURFACE-AT ?auto_5644 ?auto_5646 ) ( ON ?auto_5644 ?auto_5650 ) ( CLEAR ?auto_5644 ) ( not ( = ?auto_5643 ?auto_5650 ) ) ( not ( = ?auto_5644 ?auto_5650 ) ) ( not ( = ?auto_5653 ?auto_5650 ) ) ( SURFACE-AT ?auto_5653 ?auto_5648 ) ( CLEAR ?auto_5653 ) ( IS-CRATE ?auto_5643 ) ( AVAILABLE ?auto_5645 ) ( TRUCK-AT ?auto_5647 ?auto_5651 ) ( not ( = ?auto_5651 ?auto_5648 ) ) ( not ( = ?auto_5646 ?auto_5651 ) ) ( HOIST-AT ?auto_5649 ?auto_5651 ) ( not ( = ?auto_5645 ?auto_5649 ) ) ( not ( = ?auto_5652 ?auto_5649 ) ) ( AVAILABLE ?auto_5649 ) ( SURFACE-AT ?auto_5643 ?auto_5651 ) ( ON ?auto_5643 ?auto_5654 ) ( CLEAR ?auto_5643 ) ( not ( = ?auto_5643 ?auto_5654 ) ) ( not ( = ?auto_5644 ?auto_5654 ) ) ( not ( = ?auto_5653 ?auto_5654 ) ) ( not ( = ?auto_5650 ?auto_5654 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5649 ?auto_5643 ?auto_5654 ?auto_5651 )
      ( MAKE-2CRATE ?auto_5653 ?auto_5643 ?auto_5644 )
      ( MAKE-1CRATE-VERIFY ?auto_5643 ?auto_5644 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5655 - SURFACE
      ?auto_5656 - SURFACE
      ?auto_5657 - SURFACE
    )
    :vars
    (
      ?auto_5664 - HOIST
      ?auto_5663 - PLACE
      ?auto_5666 - PLACE
      ?auto_5659 - HOIST
      ?auto_5665 - SURFACE
      ?auto_5658 - TRUCK
      ?auto_5660 - PLACE
      ?auto_5661 - HOIST
      ?auto_5662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5664 ?auto_5663 ) ( IS-CRATE ?auto_5657 ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( not ( = ?auto_5655 ?auto_5656 ) ) ( not ( = ?auto_5655 ?auto_5657 ) ) ( not ( = ?auto_5666 ?auto_5663 ) ) ( HOIST-AT ?auto_5659 ?auto_5666 ) ( not ( = ?auto_5664 ?auto_5659 ) ) ( AVAILABLE ?auto_5659 ) ( SURFACE-AT ?auto_5657 ?auto_5666 ) ( ON ?auto_5657 ?auto_5665 ) ( CLEAR ?auto_5657 ) ( not ( = ?auto_5656 ?auto_5665 ) ) ( not ( = ?auto_5657 ?auto_5665 ) ) ( not ( = ?auto_5655 ?auto_5665 ) ) ( SURFACE-AT ?auto_5655 ?auto_5663 ) ( CLEAR ?auto_5655 ) ( IS-CRATE ?auto_5656 ) ( AVAILABLE ?auto_5664 ) ( TRUCK-AT ?auto_5658 ?auto_5660 ) ( not ( = ?auto_5660 ?auto_5663 ) ) ( not ( = ?auto_5666 ?auto_5660 ) ) ( HOIST-AT ?auto_5661 ?auto_5660 ) ( not ( = ?auto_5664 ?auto_5661 ) ) ( not ( = ?auto_5659 ?auto_5661 ) ) ( AVAILABLE ?auto_5661 ) ( SURFACE-AT ?auto_5656 ?auto_5660 ) ( ON ?auto_5656 ?auto_5662 ) ( CLEAR ?auto_5656 ) ( not ( = ?auto_5656 ?auto_5662 ) ) ( not ( = ?auto_5657 ?auto_5662 ) ) ( not ( = ?auto_5655 ?auto_5662 ) ) ( not ( = ?auto_5665 ?auto_5662 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5656 ?auto_5657 )
      ( MAKE-2CRATE-VERIFY ?auto_5655 ?auto_5656 ?auto_5657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5667 - SURFACE
      ?auto_5668 - SURFACE
    )
    :vars
    (
      ?auto_5672 - HOIST
      ?auto_5674 - PLACE
      ?auto_5678 - SURFACE
      ?auto_5675 - PLACE
      ?auto_5669 - HOIST
      ?auto_5670 - SURFACE
      ?auto_5673 - PLACE
      ?auto_5677 - HOIST
      ?auto_5671 - SURFACE
      ?auto_5676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5672 ?auto_5674 ) ( IS-CRATE ?auto_5668 ) ( not ( = ?auto_5667 ?auto_5668 ) ) ( not ( = ?auto_5678 ?auto_5667 ) ) ( not ( = ?auto_5678 ?auto_5668 ) ) ( not ( = ?auto_5675 ?auto_5674 ) ) ( HOIST-AT ?auto_5669 ?auto_5675 ) ( not ( = ?auto_5672 ?auto_5669 ) ) ( AVAILABLE ?auto_5669 ) ( SURFACE-AT ?auto_5668 ?auto_5675 ) ( ON ?auto_5668 ?auto_5670 ) ( CLEAR ?auto_5668 ) ( not ( = ?auto_5667 ?auto_5670 ) ) ( not ( = ?auto_5668 ?auto_5670 ) ) ( not ( = ?auto_5678 ?auto_5670 ) ) ( SURFACE-AT ?auto_5678 ?auto_5674 ) ( CLEAR ?auto_5678 ) ( IS-CRATE ?auto_5667 ) ( AVAILABLE ?auto_5672 ) ( not ( = ?auto_5673 ?auto_5674 ) ) ( not ( = ?auto_5675 ?auto_5673 ) ) ( HOIST-AT ?auto_5677 ?auto_5673 ) ( not ( = ?auto_5672 ?auto_5677 ) ) ( not ( = ?auto_5669 ?auto_5677 ) ) ( AVAILABLE ?auto_5677 ) ( SURFACE-AT ?auto_5667 ?auto_5673 ) ( ON ?auto_5667 ?auto_5671 ) ( CLEAR ?auto_5667 ) ( not ( = ?auto_5667 ?auto_5671 ) ) ( not ( = ?auto_5668 ?auto_5671 ) ) ( not ( = ?auto_5678 ?auto_5671 ) ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( TRUCK-AT ?auto_5676 ?auto_5674 ) )
    :subtasks
    ( ( !DRIVE ?auto_5676 ?auto_5674 ?auto_5673 )
      ( MAKE-2CRATE ?auto_5678 ?auto_5667 ?auto_5668 )
      ( MAKE-1CRATE-VERIFY ?auto_5667 ?auto_5668 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5679 - SURFACE
      ?auto_5680 - SURFACE
      ?auto_5681 - SURFACE
    )
    :vars
    (
      ?auto_5686 - HOIST
      ?auto_5690 - PLACE
      ?auto_5687 - PLACE
      ?auto_5689 - HOIST
      ?auto_5682 - SURFACE
      ?auto_5685 - PLACE
      ?auto_5688 - HOIST
      ?auto_5684 - SURFACE
      ?auto_5683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5686 ?auto_5690 ) ( IS-CRATE ?auto_5681 ) ( not ( = ?auto_5680 ?auto_5681 ) ) ( not ( = ?auto_5679 ?auto_5680 ) ) ( not ( = ?auto_5679 ?auto_5681 ) ) ( not ( = ?auto_5687 ?auto_5690 ) ) ( HOIST-AT ?auto_5689 ?auto_5687 ) ( not ( = ?auto_5686 ?auto_5689 ) ) ( AVAILABLE ?auto_5689 ) ( SURFACE-AT ?auto_5681 ?auto_5687 ) ( ON ?auto_5681 ?auto_5682 ) ( CLEAR ?auto_5681 ) ( not ( = ?auto_5680 ?auto_5682 ) ) ( not ( = ?auto_5681 ?auto_5682 ) ) ( not ( = ?auto_5679 ?auto_5682 ) ) ( SURFACE-AT ?auto_5679 ?auto_5690 ) ( CLEAR ?auto_5679 ) ( IS-CRATE ?auto_5680 ) ( AVAILABLE ?auto_5686 ) ( not ( = ?auto_5685 ?auto_5690 ) ) ( not ( = ?auto_5687 ?auto_5685 ) ) ( HOIST-AT ?auto_5688 ?auto_5685 ) ( not ( = ?auto_5686 ?auto_5688 ) ) ( not ( = ?auto_5689 ?auto_5688 ) ) ( AVAILABLE ?auto_5688 ) ( SURFACE-AT ?auto_5680 ?auto_5685 ) ( ON ?auto_5680 ?auto_5684 ) ( CLEAR ?auto_5680 ) ( not ( = ?auto_5680 ?auto_5684 ) ) ( not ( = ?auto_5681 ?auto_5684 ) ) ( not ( = ?auto_5679 ?auto_5684 ) ) ( not ( = ?auto_5682 ?auto_5684 ) ) ( TRUCK-AT ?auto_5683 ?auto_5690 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5680 ?auto_5681 )
      ( MAKE-2CRATE-VERIFY ?auto_5679 ?auto_5680 ?auto_5681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5700 - SURFACE
      ?auto_5701 - SURFACE
    )
    :vars
    (
      ?auto_5702 - HOIST
      ?auto_5703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5702 ?auto_5703 ) ( SURFACE-AT ?auto_5700 ?auto_5703 ) ( CLEAR ?auto_5700 ) ( LIFTING ?auto_5702 ?auto_5701 ) ( IS-CRATE ?auto_5701 ) ( not ( = ?auto_5700 ?auto_5701 ) ) )
    :subtasks
    ( ( !DROP ?auto_5702 ?auto_5701 ?auto_5700 ?auto_5703 )
      ( MAKE-1CRATE-VERIFY ?auto_5700 ?auto_5701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5704 - SURFACE
      ?auto_5705 - SURFACE
      ?auto_5706 - SURFACE
    )
    :vars
    (
      ?auto_5707 - HOIST
      ?auto_5708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5707 ?auto_5708 ) ( SURFACE-AT ?auto_5705 ?auto_5708 ) ( CLEAR ?auto_5705 ) ( LIFTING ?auto_5707 ?auto_5706 ) ( IS-CRATE ?auto_5706 ) ( not ( = ?auto_5705 ?auto_5706 ) ) ( ON ?auto_5705 ?auto_5704 ) ( not ( = ?auto_5704 ?auto_5705 ) ) ( not ( = ?auto_5704 ?auto_5706 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5705 ?auto_5706 )
      ( MAKE-2CRATE-VERIFY ?auto_5704 ?auto_5705 ?auto_5706 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5709 - SURFACE
      ?auto_5710 - SURFACE
      ?auto_5711 - SURFACE
      ?auto_5712 - SURFACE
    )
    :vars
    (
      ?auto_5713 - HOIST
      ?auto_5714 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5713 ?auto_5714 ) ( SURFACE-AT ?auto_5711 ?auto_5714 ) ( CLEAR ?auto_5711 ) ( LIFTING ?auto_5713 ?auto_5712 ) ( IS-CRATE ?auto_5712 ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( ON ?auto_5710 ?auto_5709 ) ( ON ?auto_5711 ?auto_5710 ) ( not ( = ?auto_5709 ?auto_5710 ) ) ( not ( = ?auto_5709 ?auto_5711 ) ) ( not ( = ?auto_5709 ?auto_5712 ) ) ( not ( = ?auto_5710 ?auto_5711 ) ) ( not ( = ?auto_5710 ?auto_5712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5711 ?auto_5712 )
      ( MAKE-3CRATE-VERIFY ?auto_5709 ?auto_5710 ?auto_5711 ?auto_5712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5715 - SURFACE
      ?auto_5716 - SURFACE
    )
    :vars
    (
      ?auto_5717 - HOIST
      ?auto_5718 - PLACE
      ?auto_5719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5717 ?auto_5718 ) ( SURFACE-AT ?auto_5715 ?auto_5718 ) ( CLEAR ?auto_5715 ) ( IS-CRATE ?auto_5716 ) ( not ( = ?auto_5715 ?auto_5716 ) ) ( TRUCK-AT ?auto_5719 ?auto_5718 ) ( AVAILABLE ?auto_5717 ) ( IN ?auto_5716 ?auto_5719 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5717 ?auto_5716 ?auto_5719 ?auto_5718 )
      ( MAKE-1CRATE ?auto_5715 ?auto_5716 )
      ( MAKE-1CRATE-VERIFY ?auto_5715 ?auto_5716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5720 - SURFACE
      ?auto_5721 - SURFACE
      ?auto_5722 - SURFACE
    )
    :vars
    (
      ?auto_5724 - HOIST
      ?auto_5723 - PLACE
      ?auto_5725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5724 ?auto_5723 ) ( SURFACE-AT ?auto_5721 ?auto_5723 ) ( CLEAR ?auto_5721 ) ( IS-CRATE ?auto_5722 ) ( not ( = ?auto_5721 ?auto_5722 ) ) ( TRUCK-AT ?auto_5725 ?auto_5723 ) ( AVAILABLE ?auto_5724 ) ( IN ?auto_5722 ?auto_5725 ) ( ON ?auto_5721 ?auto_5720 ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5721 ?auto_5722 )
      ( MAKE-2CRATE-VERIFY ?auto_5720 ?auto_5721 ?auto_5722 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5726 - SURFACE
      ?auto_5727 - SURFACE
      ?auto_5728 - SURFACE
      ?auto_5729 - SURFACE
    )
    :vars
    (
      ?auto_5730 - HOIST
      ?auto_5732 - PLACE
      ?auto_5731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5730 ?auto_5732 ) ( SURFACE-AT ?auto_5728 ?auto_5732 ) ( CLEAR ?auto_5728 ) ( IS-CRATE ?auto_5729 ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( TRUCK-AT ?auto_5731 ?auto_5732 ) ( AVAILABLE ?auto_5730 ) ( IN ?auto_5729 ?auto_5731 ) ( ON ?auto_5728 ?auto_5727 ) ( not ( = ?auto_5727 ?auto_5728 ) ) ( not ( = ?auto_5727 ?auto_5729 ) ) ( ON ?auto_5727 ?auto_5726 ) ( not ( = ?auto_5726 ?auto_5727 ) ) ( not ( = ?auto_5726 ?auto_5728 ) ) ( not ( = ?auto_5726 ?auto_5729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5727 ?auto_5728 ?auto_5729 )
      ( MAKE-3CRATE-VERIFY ?auto_5726 ?auto_5727 ?auto_5728 ?auto_5729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5733 - SURFACE
      ?auto_5734 - SURFACE
    )
    :vars
    (
      ?auto_5735 - HOIST
      ?auto_5737 - PLACE
      ?auto_5736 - TRUCK
      ?auto_5738 - SURFACE
      ?auto_5739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5735 ?auto_5737 ) ( SURFACE-AT ?auto_5733 ?auto_5737 ) ( CLEAR ?auto_5733 ) ( IS-CRATE ?auto_5734 ) ( not ( = ?auto_5733 ?auto_5734 ) ) ( AVAILABLE ?auto_5735 ) ( IN ?auto_5734 ?auto_5736 ) ( ON ?auto_5733 ?auto_5738 ) ( not ( = ?auto_5738 ?auto_5733 ) ) ( not ( = ?auto_5738 ?auto_5734 ) ) ( TRUCK-AT ?auto_5736 ?auto_5739 ) ( not ( = ?auto_5739 ?auto_5737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5736 ?auto_5739 ?auto_5737 )
      ( MAKE-2CRATE ?auto_5738 ?auto_5733 ?auto_5734 )
      ( MAKE-1CRATE-VERIFY ?auto_5733 ?auto_5734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5740 - SURFACE
      ?auto_5741 - SURFACE
      ?auto_5742 - SURFACE
    )
    :vars
    (
      ?auto_5743 - HOIST
      ?auto_5746 - PLACE
      ?auto_5745 - TRUCK
      ?auto_5744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5743 ?auto_5746 ) ( SURFACE-AT ?auto_5741 ?auto_5746 ) ( CLEAR ?auto_5741 ) ( IS-CRATE ?auto_5742 ) ( not ( = ?auto_5741 ?auto_5742 ) ) ( AVAILABLE ?auto_5743 ) ( IN ?auto_5742 ?auto_5745 ) ( ON ?auto_5741 ?auto_5740 ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( not ( = ?auto_5740 ?auto_5742 ) ) ( TRUCK-AT ?auto_5745 ?auto_5744 ) ( not ( = ?auto_5744 ?auto_5746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5741 ?auto_5742 )
      ( MAKE-2CRATE-VERIFY ?auto_5740 ?auto_5741 ?auto_5742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5747 - SURFACE
      ?auto_5748 - SURFACE
      ?auto_5749 - SURFACE
      ?auto_5750 - SURFACE
    )
    :vars
    (
      ?auto_5754 - HOIST
      ?auto_5752 - PLACE
      ?auto_5753 - TRUCK
      ?auto_5751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5754 ?auto_5752 ) ( SURFACE-AT ?auto_5749 ?auto_5752 ) ( CLEAR ?auto_5749 ) ( IS-CRATE ?auto_5750 ) ( not ( = ?auto_5749 ?auto_5750 ) ) ( AVAILABLE ?auto_5754 ) ( IN ?auto_5750 ?auto_5753 ) ( ON ?auto_5749 ?auto_5748 ) ( not ( = ?auto_5748 ?auto_5749 ) ) ( not ( = ?auto_5748 ?auto_5750 ) ) ( TRUCK-AT ?auto_5753 ?auto_5751 ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( ON ?auto_5748 ?auto_5747 ) ( not ( = ?auto_5747 ?auto_5748 ) ) ( not ( = ?auto_5747 ?auto_5749 ) ) ( not ( = ?auto_5747 ?auto_5750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5748 ?auto_5749 ?auto_5750 )
      ( MAKE-3CRATE-VERIFY ?auto_5747 ?auto_5748 ?auto_5749 ?auto_5750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5755 - SURFACE
      ?auto_5756 - SURFACE
    )
    :vars
    (
      ?auto_5761 - HOIST
      ?auto_5759 - PLACE
      ?auto_5757 - SURFACE
      ?auto_5760 - TRUCK
      ?auto_5758 - PLACE
      ?auto_5762 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5761 ?auto_5759 ) ( SURFACE-AT ?auto_5755 ?auto_5759 ) ( CLEAR ?auto_5755 ) ( IS-CRATE ?auto_5756 ) ( not ( = ?auto_5755 ?auto_5756 ) ) ( AVAILABLE ?auto_5761 ) ( ON ?auto_5755 ?auto_5757 ) ( not ( = ?auto_5757 ?auto_5755 ) ) ( not ( = ?auto_5757 ?auto_5756 ) ) ( TRUCK-AT ?auto_5760 ?auto_5758 ) ( not ( = ?auto_5758 ?auto_5759 ) ) ( HOIST-AT ?auto_5762 ?auto_5758 ) ( LIFTING ?auto_5762 ?auto_5756 ) ( not ( = ?auto_5761 ?auto_5762 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5762 ?auto_5756 ?auto_5760 ?auto_5758 )
      ( MAKE-2CRATE ?auto_5757 ?auto_5755 ?auto_5756 )
      ( MAKE-1CRATE-VERIFY ?auto_5755 ?auto_5756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5763 - SURFACE
      ?auto_5764 - SURFACE
      ?auto_5765 - SURFACE
    )
    :vars
    (
      ?auto_5766 - HOIST
      ?auto_5768 - PLACE
      ?auto_5767 - TRUCK
      ?auto_5769 - PLACE
      ?auto_5770 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5766 ?auto_5768 ) ( SURFACE-AT ?auto_5764 ?auto_5768 ) ( CLEAR ?auto_5764 ) ( IS-CRATE ?auto_5765 ) ( not ( = ?auto_5764 ?auto_5765 ) ) ( AVAILABLE ?auto_5766 ) ( ON ?auto_5764 ?auto_5763 ) ( not ( = ?auto_5763 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5765 ) ) ( TRUCK-AT ?auto_5767 ?auto_5769 ) ( not ( = ?auto_5769 ?auto_5768 ) ) ( HOIST-AT ?auto_5770 ?auto_5769 ) ( LIFTING ?auto_5770 ?auto_5765 ) ( not ( = ?auto_5766 ?auto_5770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5764 ?auto_5765 )
      ( MAKE-2CRATE-VERIFY ?auto_5763 ?auto_5764 ?auto_5765 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5771 - SURFACE
      ?auto_5772 - SURFACE
      ?auto_5773 - SURFACE
      ?auto_5774 - SURFACE
    )
    :vars
    (
      ?auto_5779 - HOIST
      ?auto_5775 - PLACE
      ?auto_5776 - TRUCK
      ?auto_5777 - PLACE
      ?auto_5778 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5779 ?auto_5775 ) ( SURFACE-AT ?auto_5773 ?auto_5775 ) ( CLEAR ?auto_5773 ) ( IS-CRATE ?auto_5774 ) ( not ( = ?auto_5773 ?auto_5774 ) ) ( AVAILABLE ?auto_5779 ) ( ON ?auto_5773 ?auto_5772 ) ( not ( = ?auto_5772 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5774 ) ) ( TRUCK-AT ?auto_5776 ?auto_5777 ) ( not ( = ?auto_5777 ?auto_5775 ) ) ( HOIST-AT ?auto_5778 ?auto_5777 ) ( LIFTING ?auto_5778 ?auto_5774 ) ( not ( = ?auto_5779 ?auto_5778 ) ) ( ON ?auto_5772 ?auto_5771 ) ( not ( = ?auto_5771 ?auto_5772 ) ) ( not ( = ?auto_5771 ?auto_5773 ) ) ( not ( = ?auto_5771 ?auto_5774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5772 ?auto_5773 ?auto_5774 )
      ( MAKE-3CRATE-VERIFY ?auto_5771 ?auto_5772 ?auto_5773 ?auto_5774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5780 - SURFACE
      ?auto_5781 - SURFACE
    )
    :vars
    (
      ?auto_5787 - HOIST
      ?auto_5782 - PLACE
      ?auto_5784 - SURFACE
      ?auto_5783 - TRUCK
      ?auto_5785 - PLACE
      ?auto_5786 - HOIST
      ?auto_5788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5787 ?auto_5782 ) ( SURFACE-AT ?auto_5780 ?auto_5782 ) ( CLEAR ?auto_5780 ) ( IS-CRATE ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( AVAILABLE ?auto_5787 ) ( ON ?auto_5780 ?auto_5784 ) ( not ( = ?auto_5784 ?auto_5780 ) ) ( not ( = ?auto_5784 ?auto_5781 ) ) ( TRUCK-AT ?auto_5783 ?auto_5785 ) ( not ( = ?auto_5785 ?auto_5782 ) ) ( HOIST-AT ?auto_5786 ?auto_5785 ) ( not ( = ?auto_5787 ?auto_5786 ) ) ( AVAILABLE ?auto_5786 ) ( SURFACE-AT ?auto_5781 ?auto_5785 ) ( ON ?auto_5781 ?auto_5788 ) ( CLEAR ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5788 ) ) ( not ( = ?auto_5781 ?auto_5788 ) ) ( not ( = ?auto_5784 ?auto_5788 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5786 ?auto_5781 ?auto_5788 ?auto_5785 )
      ( MAKE-2CRATE ?auto_5784 ?auto_5780 ?auto_5781 )
      ( MAKE-1CRATE-VERIFY ?auto_5780 ?auto_5781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5789 - SURFACE
      ?auto_5790 - SURFACE
      ?auto_5791 - SURFACE
    )
    :vars
    (
      ?auto_5797 - HOIST
      ?auto_5796 - PLACE
      ?auto_5793 - TRUCK
      ?auto_5795 - PLACE
      ?auto_5792 - HOIST
      ?auto_5794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5797 ?auto_5796 ) ( SURFACE-AT ?auto_5790 ?auto_5796 ) ( CLEAR ?auto_5790 ) ( IS-CRATE ?auto_5791 ) ( not ( = ?auto_5790 ?auto_5791 ) ) ( AVAILABLE ?auto_5797 ) ( ON ?auto_5790 ?auto_5789 ) ( not ( = ?auto_5789 ?auto_5790 ) ) ( not ( = ?auto_5789 ?auto_5791 ) ) ( TRUCK-AT ?auto_5793 ?auto_5795 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( HOIST-AT ?auto_5792 ?auto_5795 ) ( not ( = ?auto_5797 ?auto_5792 ) ) ( AVAILABLE ?auto_5792 ) ( SURFACE-AT ?auto_5791 ?auto_5795 ) ( ON ?auto_5791 ?auto_5794 ) ( CLEAR ?auto_5791 ) ( not ( = ?auto_5790 ?auto_5794 ) ) ( not ( = ?auto_5791 ?auto_5794 ) ) ( not ( = ?auto_5789 ?auto_5794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5790 ?auto_5791 )
      ( MAKE-2CRATE-VERIFY ?auto_5789 ?auto_5790 ?auto_5791 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5798 - SURFACE
      ?auto_5799 - SURFACE
      ?auto_5800 - SURFACE
      ?auto_5801 - SURFACE
    )
    :vars
    (
      ?auto_5802 - HOIST
      ?auto_5803 - PLACE
      ?auto_5806 - TRUCK
      ?auto_5805 - PLACE
      ?auto_5807 - HOIST
      ?auto_5804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5802 ?auto_5803 ) ( SURFACE-AT ?auto_5800 ?auto_5803 ) ( CLEAR ?auto_5800 ) ( IS-CRATE ?auto_5801 ) ( not ( = ?auto_5800 ?auto_5801 ) ) ( AVAILABLE ?auto_5802 ) ( ON ?auto_5800 ?auto_5799 ) ( not ( = ?auto_5799 ?auto_5800 ) ) ( not ( = ?auto_5799 ?auto_5801 ) ) ( TRUCK-AT ?auto_5806 ?auto_5805 ) ( not ( = ?auto_5805 ?auto_5803 ) ) ( HOIST-AT ?auto_5807 ?auto_5805 ) ( not ( = ?auto_5802 ?auto_5807 ) ) ( AVAILABLE ?auto_5807 ) ( SURFACE-AT ?auto_5801 ?auto_5805 ) ( ON ?auto_5801 ?auto_5804 ) ( CLEAR ?auto_5801 ) ( not ( = ?auto_5800 ?auto_5804 ) ) ( not ( = ?auto_5801 ?auto_5804 ) ) ( not ( = ?auto_5799 ?auto_5804 ) ) ( ON ?auto_5799 ?auto_5798 ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5800 ) ) ( not ( = ?auto_5798 ?auto_5801 ) ) ( not ( = ?auto_5798 ?auto_5804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5799 ?auto_5800 ?auto_5801 )
      ( MAKE-3CRATE-VERIFY ?auto_5798 ?auto_5799 ?auto_5800 ?auto_5801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5808 - SURFACE
      ?auto_5809 - SURFACE
    )
    :vars
    (
      ?auto_5811 - HOIST
      ?auto_5812 - PLACE
      ?auto_5810 - SURFACE
      ?auto_5814 - PLACE
      ?auto_5816 - HOIST
      ?auto_5813 - SURFACE
      ?auto_5815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5811 ?auto_5812 ) ( SURFACE-AT ?auto_5808 ?auto_5812 ) ( CLEAR ?auto_5808 ) ( IS-CRATE ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( AVAILABLE ?auto_5811 ) ( ON ?auto_5808 ?auto_5810 ) ( not ( = ?auto_5810 ?auto_5808 ) ) ( not ( = ?auto_5810 ?auto_5809 ) ) ( not ( = ?auto_5814 ?auto_5812 ) ) ( HOIST-AT ?auto_5816 ?auto_5814 ) ( not ( = ?auto_5811 ?auto_5816 ) ) ( AVAILABLE ?auto_5816 ) ( SURFACE-AT ?auto_5809 ?auto_5814 ) ( ON ?auto_5809 ?auto_5813 ) ( CLEAR ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5813 ) ) ( not ( = ?auto_5809 ?auto_5813 ) ) ( not ( = ?auto_5810 ?auto_5813 ) ) ( TRUCK-AT ?auto_5815 ?auto_5812 ) )
    :subtasks
    ( ( !DRIVE ?auto_5815 ?auto_5812 ?auto_5814 )
      ( MAKE-2CRATE ?auto_5810 ?auto_5808 ?auto_5809 )
      ( MAKE-1CRATE-VERIFY ?auto_5808 ?auto_5809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5817 - SURFACE
      ?auto_5818 - SURFACE
      ?auto_5819 - SURFACE
    )
    :vars
    (
      ?auto_5823 - HOIST
      ?auto_5821 - PLACE
      ?auto_5824 - PLACE
      ?auto_5820 - HOIST
      ?auto_5822 - SURFACE
      ?auto_5825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5823 ?auto_5821 ) ( SURFACE-AT ?auto_5818 ?auto_5821 ) ( CLEAR ?auto_5818 ) ( IS-CRATE ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5819 ) ) ( AVAILABLE ?auto_5823 ) ( ON ?auto_5818 ?auto_5817 ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5819 ) ) ( not ( = ?auto_5824 ?auto_5821 ) ) ( HOIST-AT ?auto_5820 ?auto_5824 ) ( not ( = ?auto_5823 ?auto_5820 ) ) ( AVAILABLE ?auto_5820 ) ( SURFACE-AT ?auto_5819 ?auto_5824 ) ( ON ?auto_5819 ?auto_5822 ) ( CLEAR ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5822 ) ) ( not ( = ?auto_5819 ?auto_5822 ) ) ( not ( = ?auto_5817 ?auto_5822 ) ) ( TRUCK-AT ?auto_5825 ?auto_5821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5818 ?auto_5819 )
      ( MAKE-2CRATE-VERIFY ?auto_5817 ?auto_5818 ?auto_5819 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5826 - SURFACE
      ?auto_5827 - SURFACE
      ?auto_5828 - SURFACE
      ?auto_5829 - SURFACE
    )
    :vars
    (
      ?auto_5835 - HOIST
      ?auto_5832 - PLACE
      ?auto_5831 - PLACE
      ?auto_5830 - HOIST
      ?auto_5834 - SURFACE
      ?auto_5833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5835 ?auto_5832 ) ( SURFACE-AT ?auto_5828 ?auto_5832 ) ( CLEAR ?auto_5828 ) ( IS-CRATE ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( AVAILABLE ?auto_5835 ) ( ON ?auto_5828 ?auto_5827 ) ( not ( = ?auto_5827 ?auto_5828 ) ) ( not ( = ?auto_5827 ?auto_5829 ) ) ( not ( = ?auto_5831 ?auto_5832 ) ) ( HOIST-AT ?auto_5830 ?auto_5831 ) ( not ( = ?auto_5835 ?auto_5830 ) ) ( AVAILABLE ?auto_5830 ) ( SURFACE-AT ?auto_5829 ?auto_5831 ) ( ON ?auto_5829 ?auto_5834 ) ( CLEAR ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5834 ) ) ( not ( = ?auto_5829 ?auto_5834 ) ) ( not ( = ?auto_5827 ?auto_5834 ) ) ( TRUCK-AT ?auto_5833 ?auto_5832 ) ( ON ?auto_5827 ?auto_5826 ) ( not ( = ?auto_5826 ?auto_5827 ) ) ( not ( = ?auto_5826 ?auto_5828 ) ) ( not ( = ?auto_5826 ?auto_5829 ) ) ( not ( = ?auto_5826 ?auto_5834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5827 ?auto_5828 ?auto_5829 )
      ( MAKE-3CRATE-VERIFY ?auto_5826 ?auto_5827 ?auto_5828 ?auto_5829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5836 - SURFACE
      ?auto_5837 - SURFACE
    )
    :vars
    (
      ?auto_5844 - HOIST
      ?auto_5841 - PLACE
      ?auto_5838 - SURFACE
      ?auto_5840 - PLACE
      ?auto_5839 - HOIST
      ?auto_5843 - SURFACE
      ?auto_5842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5844 ?auto_5841 ) ( IS-CRATE ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5838 ?auto_5836 ) ) ( not ( = ?auto_5838 ?auto_5837 ) ) ( not ( = ?auto_5840 ?auto_5841 ) ) ( HOIST-AT ?auto_5839 ?auto_5840 ) ( not ( = ?auto_5844 ?auto_5839 ) ) ( AVAILABLE ?auto_5839 ) ( SURFACE-AT ?auto_5837 ?auto_5840 ) ( ON ?auto_5837 ?auto_5843 ) ( CLEAR ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5843 ) ) ( not ( = ?auto_5837 ?auto_5843 ) ) ( not ( = ?auto_5838 ?auto_5843 ) ) ( TRUCK-AT ?auto_5842 ?auto_5841 ) ( SURFACE-AT ?auto_5838 ?auto_5841 ) ( CLEAR ?auto_5838 ) ( LIFTING ?auto_5844 ?auto_5836 ) ( IS-CRATE ?auto_5836 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5838 ?auto_5836 )
      ( MAKE-2CRATE ?auto_5838 ?auto_5836 ?auto_5837 )
      ( MAKE-1CRATE-VERIFY ?auto_5836 ?auto_5837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5845 - SURFACE
      ?auto_5846 - SURFACE
      ?auto_5847 - SURFACE
    )
    :vars
    (
      ?auto_5848 - HOIST
      ?auto_5849 - PLACE
      ?auto_5853 - PLACE
      ?auto_5850 - HOIST
      ?auto_5852 - SURFACE
      ?auto_5851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5848 ?auto_5849 ) ( IS-CRATE ?auto_5847 ) ( not ( = ?auto_5846 ?auto_5847 ) ) ( not ( = ?auto_5845 ?auto_5846 ) ) ( not ( = ?auto_5845 ?auto_5847 ) ) ( not ( = ?auto_5853 ?auto_5849 ) ) ( HOIST-AT ?auto_5850 ?auto_5853 ) ( not ( = ?auto_5848 ?auto_5850 ) ) ( AVAILABLE ?auto_5850 ) ( SURFACE-AT ?auto_5847 ?auto_5853 ) ( ON ?auto_5847 ?auto_5852 ) ( CLEAR ?auto_5847 ) ( not ( = ?auto_5846 ?auto_5852 ) ) ( not ( = ?auto_5847 ?auto_5852 ) ) ( not ( = ?auto_5845 ?auto_5852 ) ) ( TRUCK-AT ?auto_5851 ?auto_5849 ) ( SURFACE-AT ?auto_5845 ?auto_5849 ) ( CLEAR ?auto_5845 ) ( LIFTING ?auto_5848 ?auto_5846 ) ( IS-CRATE ?auto_5846 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5846 ?auto_5847 )
      ( MAKE-2CRATE-VERIFY ?auto_5845 ?auto_5846 ?auto_5847 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5854 - SURFACE
      ?auto_5855 - SURFACE
      ?auto_5856 - SURFACE
      ?auto_5857 - SURFACE
    )
    :vars
    (
      ?auto_5862 - HOIST
      ?auto_5863 - PLACE
      ?auto_5858 - PLACE
      ?auto_5861 - HOIST
      ?auto_5860 - SURFACE
      ?auto_5859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5862 ?auto_5863 ) ( IS-CRATE ?auto_5857 ) ( not ( = ?auto_5856 ?auto_5857 ) ) ( not ( = ?auto_5855 ?auto_5856 ) ) ( not ( = ?auto_5855 ?auto_5857 ) ) ( not ( = ?auto_5858 ?auto_5863 ) ) ( HOIST-AT ?auto_5861 ?auto_5858 ) ( not ( = ?auto_5862 ?auto_5861 ) ) ( AVAILABLE ?auto_5861 ) ( SURFACE-AT ?auto_5857 ?auto_5858 ) ( ON ?auto_5857 ?auto_5860 ) ( CLEAR ?auto_5857 ) ( not ( = ?auto_5856 ?auto_5860 ) ) ( not ( = ?auto_5857 ?auto_5860 ) ) ( not ( = ?auto_5855 ?auto_5860 ) ) ( TRUCK-AT ?auto_5859 ?auto_5863 ) ( SURFACE-AT ?auto_5855 ?auto_5863 ) ( CLEAR ?auto_5855 ) ( LIFTING ?auto_5862 ?auto_5856 ) ( IS-CRATE ?auto_5856 ) ( ON ?auto_5855 ?auto_5854 ) ( not ( = ?auto_5854 ?auto_5855 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( not ( = ?auto_5854 ?auto_5857 ) ) ( not ( = ?auto_5854 ?auto_5860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5855 ?auto_5856 ?auto_5857 )
      ( MAKE-3CRATE-VERIFY ?auto_5854 ?auto_5855 ?auto_5856 ?auto_5857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5864 - SURFACE
      ?auto_5865 - SURFACE
    )
    :vars
    (
      ?auto_5870 - HOIST
      ?auto_5872 - PLACE
      ?auto_5871 - SURFACE
      ?auto_5866 - PLACE
      ?auto_5869 - HOIST
      ?auto_5868 - SURFACE
      ?auto_5867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5870 ?auto_5872 ) ( IS-CRATE ?auto_5865 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5871 ?auto_5864 ) ) ( not ( = ?auto_5871 ?auto_5865 ) ) ( not ( = ?auto_5866 ?auto_5872 ) ) ( HOIST-AT ?auto_5869 ?auto_5866 ) ( not ( = ?auto_5870 ?auto_5869 ) ) ( AVAILABLE ?auto_5869 ) ( SURFACE-AT ?auto_5865 ?auto_5866 ) ( ON ?auto_5865 ?auto_5868 ) ( CLEAR ?auto_5865 ) ( not ( = ?auto_5864 ?auto_5868 ) ) ( not ( = ?auto_5865 ?auto_5868 ) ) ( not ( = ?auto_5871 ?auto_5868 ) ) ( TRUCK-AT ?auto_5867 ?auto_5872 ) ( SURFACE-AT ?auto_5871 ?auto_5872 ) ( CLEAR ?auto_5871 ) ( IS-CRATE ?auto_5864 ) ( AVAILABLE ?auto_5870 ) ( IN ?auto_5864 ?auto_5867 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5870 ?auto_5864 ?auto_5867 ?auto_5872 )
      ( MAKE-2CRATE ?auto_5871 ?auto_5864 ?auto_5865 )
      ( MAKE-1CRATE-VERIFY ?auto_5864 ?auto_5865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5873 - SURFACE
      ?auto_5874 - SURFACE
      ?auto_5875 - SURFACE
    )
    :vars
    (
      ?auto_5880 - HOIST
      ?auto_5876 - PLACE
      ?auto_5877 - PLACE
      ?auto_5879 - HOIST
      ?auto_5881 - SURFACE
      ?auto_5878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5880 ?auto_5876 ) ( IS-CRATE ?auto_5875 ) ( not ( = ?auto_5874 ?auto_5875 ) ) ( not ( = ?auto_5873 ?auto_5874 ) ) ( not ( = ?auto_5873 ?auto_5875 ) ) ( not ( = ?auto_5877 ?auto_5876 ) ) ( HOIST-AT ?auto_5879 ?auto_5877 ) ( not ( = ?auto_5880 ?auto_5879 ) ) ( AVAILABLE ?auto_5879 ) ( SURFACE-AT ?auto_5875 ?auto_5877 ) ( ON ?auto_5875 ?auto_5881 ) ( CLEAR ?auto_5875 ) ( not ( = ?auto_5874 ?auto_5881 ) ) ( not ( = ?auto_5875 ?auto_5881 ) ) ( not ( = ?auto_5873 ?auto_5881 ) ) ( TRUCK-AT ?auto_5878 ?auto_5876 ) ( SURFACE-AT ?auto_5873 ?auto_5876 ) ( CLEAR ?auto_5873 ) ( IS-CRATE ?auto_5874 ) ( AVAILABLE ?auto_5880 ) ( IN ?auto_5874 ?auto_5878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5874 ?auto_5875 )
      ( MAKE-2CRATE-VERIFY ?auto_5873 ?auto_5874 ?auto_5875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5882 - SURFACE
      ?auto_5883 - SURFACE
      ?auto_5884 - SURFACE
      ?auto_5885 - SURFACE
    )
    :vars
    (
      ?auto_5889 - HOIST
      ?auto_5890 - PLACE
      ?auto_5891 - PLACE
      ?auto_5887 - HOIST
      ?auto_5886 - SURFACE
      ?auto_5888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5889 ?auto_5890 ) ( IS-CRATE ?auto_5885 ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( not ( = ?auto_5883 ?auto_5884 ) ) ( not ( = ?auto_5883 ?auto_5885 ) ) ( not ( = ?auto_5891 ?auto_5890 ) ) ( HOIST-AT ?auto_5887 ?auto_5891 ) ( not ( = ?auto_5889 ?auto_5887 ) ) ( AVAILABLE ?auto_5887 ) ( SURFACE-AT ?auto_5885 ?auto_5891 ) ( ON ?auto_5885 ?auto_5886 ) ( CLEAR ?auto_5885 ) ( not ( = ?auto_5884 ?auto_5886 ) ) ( not ( = ?auto_5885 ?auto_5886 ) ) ( not ( = ?auto_5883 ?auto_5886 ) ) ( TRUCK-AT ?auto_5888 ?auto_5890 ) ( SURFACE-AT ?auto_5883 ?auto_5890 ) ( CLEAR ?auto_5883 ) ( IS-CRATE ?auto_5884 ) ( AVAILABLE ?auto_5889 ) ( IN ?auto_5884 ?auto_5888 ) ( ON ?auto_5883 ?auto_5882 ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5884 ) ) ( not ( = ?auto_5882 ?auto_5885 ) ) ( not ( = ?auto_5882 ?auto_5886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5883 ?auto_5884 ?auto_5885 )
      ( MAKE-3CRATE-VERIFY ?auto_5882 ?auto_5883 ?auto_5884 ?auto_5885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5892 - SURFACE
      ?auto_5893 - SURFACE
    )
    :vars
    (
      ?auto_5898 - HOIST
      ?auto_5899 - PLACE
      ?auto_5897 - SURFACE
      ?auto_5900 - PLACE
      ?auto_5895 - HOIST
      ?auto_5894 - SURFACE
      ?auto_5896 - TRUCK
      ?auto_5901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5898 ?auto_5899 ) ( IS-CRATE ?auto_5893 ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( not ( = ?auto_5897 ?auto_5892 ) ) ( not ( = ?auto_5897 ?auto_5893 ) ) ( not ( = ?auto_5900 ?auto_5899 ) ) ( HOIST-AT ?auto_5895 ?auto_5900 ) ( not ( = ?auto_5898 ?auto_5895 ) ) ( AVAILABLE ?auto_5895 ) ( SURFACE-AT ?auto_5893 ?auto_5900 ) ( ON ?auto_5893 ?auto_5894 ) ( CLEAR ?auto_5893 ) ( not ( = ?auto_5892 ?auto_5894 ) ) ( not ( = ?auto_5893 ?auto_5894 ) ) ( not ( = ?auto_5897 ?auto_5894 ) ) ( SURFACE-AT ?auto_5897 ?auto_5899 ) ( CLEAR ?auto_5897 ) ( IS-CRATE ?auto_5892 ) ( AVAILABLE ?auto_5898 ) ( IN ?auto_5892 ?auto_5896 ) ( TRUCK-AT ?auto_5896 ?auto_5901 ) ( not ( = ?auto_5901 ?auto_5899 ) ) ( not ( = ?auto_5900 ?auto_5901 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5896 ?auto_5901 ?auto_5899 )
      ( MAKE-2CRATE ?auto_5897 ?auto_5892 ?auto_5893 )
      ( MAKE-1CRATE-VERIFY ?auto_5892 ?auto_5893 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5902 - SURFACE
      ?auto_5903 - SURFACE
      ?auto_5904 - SURFACE
    )
    :vars
    (
      ?auto_5909 - HOIST
      ?auto_5910 - PLACE
      ?auto_5911 - PLACE
      ?auto_5906 - HOIST
      ?auto_5905 - SURFACE
      ?auto_5908 - TRUCK
      ?auto_5907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5909 ?auto_5910 ) ( IS-CRATE ?auto_5904 ) ( not ( = ?auto_5903 ?auto_5904 ) ) ( not ( = ?auto_5902 ?auto_5903 ) ) ( not ( = ?auto_5902 ?auto_5904 ) ) ( not ( = ?auto_5911 ?auto_5910 ) ) ( HOIST-AT ?auto_5906 ?auto_5911 ) ( not ( = ?auto_5909 ?auto_5906 ) ) ( AVAILABLE ?auto_5906 ) ( SURFACE-AT ?auto_5904 ?auto_5911 ) ( ON ?auto_5904 ?auto_5905 ) ( CLEAR ?auto_5904 ) ( not ( = ?auto_5903 ?auto_5905 ) ) ( not ( = ?auto_5904 ?auto_5905 ) ) ( not ( = ?auto_5902 ?auto_5905 ) ) ( SURFACE-AT ?auto_5902 ?auto_5910 ) ( CLEAR ?auto_5902 ) ( IS-CRATE ?auto_5903 ) ( AVAILABLE ?auto_5909 ) ( IN ?auto_5903 ?auto_5908 ) ( TRUCK-AT ?auto_5908 ?auto_5907 ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5911 ?auto_5907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5903 ?auto_5904 )
      ( MAKE-2CRATE-VERIFY ?auto_5902 ?auto_5903 ?auto_5904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5912 - SURFACE
      ?auto_5913 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5915 - SURFACE
    )
    :vars
    (
      ?auto_5917 - HOIST
      ?auto_5916 - PLACE
      ?auto_5920 - PLACE
      ?auto_5922 - HOIST
      ?auto_5919 - SURFACE
      ?auto_5918 - TRUCK
      ?auto_5921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5917 ?auto_5916 ) ( IS-CRATE ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5915 ) ) ( not ( = ?auto_5913 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5915 ) ) ( not ( = ?auto_5920 ?auto_5916 ) ) ( HOIST-AT ?auto_5922 ?auto_5920 ) ( not ( = ?auto_5917 ?auto_5922 ) ) ( AVAILABLE ?auto_5922 ) ( SURFACE-AT ?auto_5915 ?auto_5920 ) ( ON ?auto_5915 ?auto_5919 ) ( CLEAR ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5919 ) ) ( not ( = ?auto_5915 ?auto_5919 ) ) ( not ( = ?auto_5913 ?auto_5919 ) ) ( SURFACE-AT ?auto_5913 ?auto_5916 ) ( CLEAR ?auto_5913 ) ( IS-CRATE ?auto_5914 ) ( AVAILABLE ?auto_5917 ) ( IN ?auto_5914 ?auto_5918 ) ( TRUCK-AT ?auto_5918 ?auto_5921 ) ( not ( = ?auto_5921 ?auto_5916 ) ) ( not ( = ?auto_5920 ?auto_5921 ) ) ( ON ?auto_5913 ?auto_5912 ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5915 ) ) ( not ( = ?auto_5912 ?auto_5919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5913 ?auto_5914 ?auto_5915 )
      ( MAKE-3CRATE-VERIFY ?auto_5912 ?auto_5913 ?auto_5914 ?auto_5915 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5923 - SURFACE
      ?auto_5924 - SURFACE
    )
    :vars
    (
      ?auto_5927 - HOIST
      ?auto_5926 - PLACE
      ?auto_5925 - SURFACE
      ?auto_5930 - PLACE
      ?auto_5932 - HOIST
      ?auto_5929 - SURFACE
      ?auto_5928 - TRUCK
      ?auto_5931 - PLACE
      ?auto_5933 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5927 ?auto_5926 ) ( IS-CRATE ?auto_5924 ) ( not ( = ?auto_5923 ?auto_5924 ) ) ( not ( = ?auto_5925 ?auto_5923 ) ) ( not ( = ?auto_5925 ?auto_5924 ) ) ( not ( = ?auto_5930 ?auto_5926 ) ) ( HOIST-AT ?auto_5932 ?auto_5930 ) ( not ( = ?auto_5927 ?auto_5932 ) ) ( AVAILABLE ?auto_5932 ) ( SURFACE-AT ?auto_5924 ?auto_5930 ) ( ON ?auto_5924 ?auto_5929 ) ( CLEAR ?auto_5924 ) ( not ( = ?auto_5923 ?auto_5929 ) ) ( not ( = ?auto_5924 ?auto_5929 ) ) ( not ( = ?auto_5925 ?auto_5929 ) ) ( SURFACE-AT ?auto_5925 ?auto_5926 ) ( CLEAR ?auto_5925 ) ( IS-CRATE ?auto_5923 ) ( AVAILABLE ?auto_5927 ) ( TRUCK-AT ?auto_5928 ?auto_5931 ) ( not ( = ?auto_5931 ?auto_5926 ) ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( HOIST-AT ?auto_5933 ?auto_5931 ) ( LIFTING ?auto_5933 ?auto_5923 ) ( not ( = ?auto_5927 ?auto_5933 ) ) ( not ( = ?auto_5932 ?auto_5933 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5933 ?auto_5923 ?auto_5928 ?auto_5931 )
      ( MAKE-2CRATE ?auto_5925 ?auto_5923 ?auto_5924 )
      ( MAKE-1CRATE-VERIFY ?auto_5923 ?auto_5924 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5934 - SURFACE
      ?auto_5935 - SURFACE
      ?auto_5936 - SURFACE
    )
    :vars
    (
      ?auto_5944 - HOIST
      ?auto_5938 - PLACE
      ?auto_5940 - PLACE
      ?auto_5937 - HOIST
      ?auto_5939 - SURFACE
      ?auto_5942 - TRUCK
      ?auto_5943 - PLACE
      ?auto_5941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5944 ?auto_5938 ) ( IS-CRATE ?auto_5936 ) ( not ( = ?auto_5935 ?auto_5936 ) ) ( not ( = ?auto_5934 ?auto_5935 ) ) ( not ( = ?auto_5934 ?auto_5936 ) ) ( not ( = ?auto_5940 ?auto_5938 ) ) ( HOIST-AT ?auto_5937 ?auto_5940 ) ( not ( = ?auto_5944 ?auto_5937 ) ) ( AVAILABLE ?auto_5937 ) ( SURFACE-AT ?auto_5936 ?auto_5940 ) ( ON ?auto_5936 ?auto_5939 ) ( CLEAR ?auto_5936 ) ( not ( = ?auto_5935 ?auto_5939 ) ) ( not ( = ?auto_5936 ?auto_5939 ) ) ( not ( = ?auto_5934 ?auto_5939 ) ) ( SURFACE-AT ?auto_5934 ?auto_5938 ) ( CLEAR ?auto_5934 ) ( IS-CRATE ?auto_5935 ) ( AVAILABLE ?auto_5944 ) ( TRUCK-AT ?auto_5942 ?auto_5943 ) ( not ( = ?auto_5943 ?auto_5938 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( HOIST-AT ?auto_5941 ?auto_5943 ) ( LIFTING ?auto_5941 ?auto_5935 ) ( not ( = ?auto_5944 ?auto_5941 ) ) ( not ( = ?auto_5937 ?auto_5941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5935 ?auto_5936 )
      ( MAKE-2CRATE-VERIFY ?auto_5934 ?auto_5935 ?auto_5936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5945 - SURFACE
      ?auto_5946 - SURFACE
      ?auto_5947 - SURFACE
      ?auto_5948 - SURFACE
    )
    :vars
    (
      ?auto_5953 - HOIST
      ?auto_5949 - PLACE
      ?auto_5951 - PLACE
      ?auto_5952 - HOIST
      ?auto_5950 - SURFACE
      ?auto_5955 - TRUCK
      ?auto_5954 - PLACE
      ?auto_5956 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5953 ?auto_5949 ) ( IS-CRATE ?auto_5948 ) ( not ( = ?auto_5947 ?auto_5948 ) ) ( not ( = ?auto_5946 ?auto_5947 ) ) ( not ( = ?auto_5946 ?auto_5948 ) ) ( not ( = ?auto_5951 ?auto_5949 ) ) ( HOIST-AT ?auto_5952 ?auto_5951 ) ( not ( = ?auto_5953 ?auto_5952 ) ) ( AVAILABLE ?auto_5952 ) ( SURFACE-AT ?auto_5948 ?auto_5951 ) ( ON ?auto_5948 ?auto_5950 ) ( CLEAR ?auto_5948 ) ( not ( = ?auto_5947 ?auto_5950 ) ) ( not ( = ?auto_5948 ?auto_5950 ) ) ( not ( = ?auto_5946 ?auto_5950 ) ) ( SURFACE-AT ?auto_5946 ?auto_5949 ) ( CLEAR ?auto_5946 ) ( IS-CRATE ?auto_5947 ) ( AVAILABLE ?auto_5953 ) ( TRUCK-AT ?auto_5955 ?auto_5954 ) ( not ( = ?auto_5954 ?auto_5949 ) ) ( not ( = ?auto_5951 ?auto_5954 ) ) ( HOIST-AT ?auto_5956 ?auto_5954 ) ( LIFTING ?auto_5956 ?auto_5947 ) ( not ( = ?auto_5953 ?auto_5956 ) ) ( not ( = ?auto_5952 ?auto_5956 ) ) ( ON ?auto_5946 ?auto_5945 ) ( not ( = ?auto_5945 ?auto_5946 ) ) ( not ( = ?auto_5945 ?auto_5947 ) ) ( not ( = ?auto_5945 ?auto_5948 ) ) ( not ( = ?auto_5945 ?auto_5950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5946 ?auto_5947 ?auto_5948 )
      ( MAKE-3CRATE-VERIFY ?auto_5945 ?auto_5946 ?auto_5947 ?auto_5948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5957 - SURFACE
      ?auto_5958 - SURFACE
    )
    :vars
    (
      ?auto_5964 - HOIST
      ?auto_5959 - PLACE
      ?auto_5963 - SURFACE
      ?auto_5961 - PLACE
      ?auto_5962 - HOIST
      ?auto_5960 - SURFACE
      ?auto_5966 - TRUCK
      ?auto_5965 - PLACE
      ?auto_5967 - HOIST
      ?auto_5968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5964 ?auto_5959 ) ( IS-CRATE ?auto_5958 ) ( not ( = ?auto_5957 ?auto_5958 ) ) ( not ( = ?auto_5963 ?auto_5957 ) ) ( not ( = ?auto_5963 ?auto_5958 ) ) ( not ( = ?auto_5961 ?auto_5959 ) ) ( HOIST-AT ?auto_5962 ?auto_5961 ) ( not ( = ?auto_5964 ?auto_5962 ) ) ( AVAILABLE ?auto_5962 ) ( SURFACE-AT ?auto_5958 ?auto_5961 ) ( ON ?auto_5958 ?auto_5960 ) ( CLEAR ?auto_5958 ) ( not ( = ?auto_5957 ?auto_5960 ) ) ( not ( = ?auto_5958 ?auto_5960 ) ) ( not ( = ?auto_5963 ?auto_5960 ) ) ( SURFACE-AT ?auto_5963 ?auto_5959 ) ( CLEAR ?auto_5963 ) ( IS-CRATE ?auto_5957 ) ( AVAILABLE ?auto_5964 ) ( TRUCK-AT ?auto_5966 ?auto_5965 ) ( not ( = ?auto_5965 ?auto_5959 ) ) ( not ( = ?auto_5961 ?auto_5965 ) ) ( HOIST-AT ?auto_5967 ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5967 ) ) ( not ( = ?auto_5962 ?auto_5967 ) ) ( AVAILABLE ?auto_5967 ) ( SURFACE-AT ?auto_5957 ?auto_5965 ) ( ON ?auto_5957 ?auto_5968 ) ( CLEAR ?auto_5957 ) ( not ( = ?auto_5957 ?auto_5968 ) ) ( not ( = ?auto_5958 ?auto_5968 ) ) ( not ( = ?auto_5963 ?auto_5968 ) ) ( not ( = ?auto_5960 ?auto_5968 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5967 ?auto_5957 ?auto_5968 ?auto_5965 )
      ( MAKE-2CRATE ?auto_5963 ?auto_5957 ?auto_5958 )
      ( MAKE-1CRATE-VERIFY ?auto_5957 ?auto_5958 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5969 - SURFACE
      ?auto_5970 - SURFACE
      ?auto_5971 - SURFACE
    )
    :vars
    (
      ?auto_5977 - HOIST
      ?auto_5978 - PLACE
      ?auto_5980 - PLACE
      ?auto_5972 - HOIST
      ?auto_5975 - SURFACE
      ?auto_5979 - TRUCK
      ?auto_5973 - PLACE
      ?auto_5974 - HOIST
      ?auto_5976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5977 ?auto_5978 ) ( IS-CRATE ?auto_5971 ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( not ( = ?auto_5969 ?auto_5970 ) ) ( not ( = ?auto_5969 ?auto_5971 ) ) ( not ( = ?auto_5980 ?auto_5978 ) ) ( HOIST-AT ?auto_5972 ?auto_5980 ) ( not ( = ?auto_5977 ?auto_5972 ) ) ( AVAILABLE ?auto_5972 ) ( SURFACE-AT ?auto_5971 ?auto_5980 ) ( ON ?auto_5971 ?auto_5975 ) ( CLEAR ?auto_5971 ) ( not ( = ?auto_5970 ?auto_5975 ) ) ( not ( = ?auto_5971 ?auto_5975 ) ) ( not ( = ?auto_5969 ?auto_5975 ) ) ( SURFACE-AT ?auto_5969 ?auto_5978 ) ( CLEAR ?auto_5969 ) ( IS-CRATE ?auto_5970 ) ( AVAILABLE ?auto_5977 ) ( TRUCK-AT ?auto_5979 ?auto_5973 ) ( not ( = ?auto_5973 ?auto_5978 ) ) ( not ( = ?auto_5980 ?auto_5973 ) ) ( HOIST-AT ?auto_5974 ?auto_5973 ) ( not ( = ?auto_5977 ?auto_5974 ) ) ( not ( = ?auto_5972 ?auto_5974 ) ) ( AVAILABLE ?auto_5974 ) ( SURFACE-AT ?auto_5970 ?auto_5973 ) ( ON ?auto_5970 ?auto_5976 ) ( CLEAR ?auto_5970 ) ( not ( = ?auto_5970 ?auto_5976 ) ) ( not ( = ?auto_5971 ?auto_5976 ) ) ( not ( = ?auto_5969 ?auto_5976 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5970 ?auto_5971 )
      ( MAKE-2CRATE-VERIFY ?auto_5969 ?auto_5970 ?auto_5971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5981 - SURFACE
      ?auto_5982 - SURFACE
      ?auto_5983 - SURFACE
      ?auto_5984 - SURFACE
    )
    :vars
    (
      ?auto_5992 - HOIST
      ?auto_5986 - PLACE
      ?auto_5988 - PLACE
      ?auto_5990 - HOIST
      ?auto_5985 - SURFACE
      ?auto_5991 - TRUCK
      ?auto_5989 - PLACE
      ?auto_5993 - HOIST
      ?auto_5987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5992 ?auto_5986 ) ( IS-CRATE ?auto_5984 ) ( not ( = ?auto_5983 ?auto_5984 ) ) ( not ( = ?auto_5982 ?auto_5983 ) ) ( not ( = ?auto_5982 ?auto_5984 ) ) ( not ( = ?auto_5988 ?auto_5986 ) ) ( HOIST-AT ?auto_5990 ?auto_5988 ) ( not ( = ?auto_5992 ?auto_5990 ) ) ( AVAILABLE ?auto_5990 ) ( SURFACE-AT ?auto_5984 ?auto_5988 ) ( ON ?auto_5984 ?auto_5985 ) ( CLEAR ?auto_5984 ) ( not ( = ?auto_5983 ?auto_5985 ) ) ( not ( = ?auto_5984 ?auto_5985 ) ) ( not ( = ?auto_5982 ?auto_5985 ) ) ( SURFACE-AT ?auto_5982 ?auto_5986 ) ( CLEAR ?auto_5982 ) ( IS-CRATE ?auto_5983 ) ( AVAILABLE ?auto_5992 ) ( TRUCK-AT ?auto_5991 ?auto_5989 ) ( not ( = ?auto_5989 ?auto_5986 ) ) ( not ( = ?auto_5988 ?auto_5989 ) ) ( HOIST-AT ?auto_5993 ?auto_5989 ) ( not ( = ?auto_5992 ?auto_5993 ) ) ( not ( = ?auto_5990 ?auto_5993 ) ) ( AVAILABLE ?auto_5993 ) ( SURFACE-AT ?auto_5983 ?auto_5989 ) ( ON ?auto_5983 ?auto_5987 ) ( CLEAR ?auto_5983 ) ( not ( = ?auto_5983 ?auto_5987 ) ) ( not ( = ?auto_5984 ?auto_5987 ) ) ( not ( = ?auto_5982 ?auto_5987 ) ) ( not ( = ?auto_5985 ?auto_5987 ) ) ( ON ?auto_5982 ?auto_5981 ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5983 ) ) ( not ( = ?auto_5981 ?auto_5984 ) ) ( not ( = ?auto_5981 ?auto_5985 ) ) ( not ( = ?auto_5981 ?auto_5987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5982 ?auto_5983 ?auto_5984 )
      ( MAKE-3CRATE-VERIFY ?auto_5981 ?auto_5982 ?auto_5983 ?auto_5984 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5994 - SURFACE
      ?auto_5995 - SURFACE
    )
    :vars
    (
      ?auto_6004 - HOIST
      ?auto_5997 - PLACE
      ?auto_6001 - SURFACE
      ?auto_5999 - PLACE
      ?auto_6002 - HOIST
      ?auto_5996 - SURFACE
      ?auto_6000 - PLACE
      ?auto_6005 - HOIST
      ?auto_5998 - SURFACE
      ?auto_6003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6004 ?auto_5997 ) ( IS-CRATE ?auto_5995 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_6001 ?auto_5994 ) ) ( not ( = ?auto_6001 ?auto_5995 ) ) ( not ( = ?auto_5999 ?auto_5997 ) ) ( HOIST-AT ?auto_6002 ?auto_5999 ) ( not ( = ?auto_6004 ?auto_6002 ) ) ( AVAILABLE ?auto_6002 ) ( SURFACE-AT ?auto_5995 ?auto_5999 ) ( ON ?auto_5995 ?auto_5996 ) ( CLEAR ?auto_5995 ) ( not ( = ?auto_5994 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_5996 ) ) ( not ( = ?auto_6001 ?auto_5996 ) ) ( SURFACE-AT ?auto_6001 ?auto_5997 ) ( CLEAR ?auto_6001 ) ( IS-CRATE ?auto_5994 ) ( AVAILABLE ?auto_6004 ) ( not ( = ?auto_6000 ?auto_5997 ) ) ( not ( = ?auto_5999 ?auto_6000 ) ) ( HOIST-AT ?auto_6005 ?auto_6000 ) ( not ( = ?auto_6004 ?auto_6005 ) ) ( not ( = ?auto_6002 ?auto_6005 ) ) ( AVAILABLE ?auto_6005 ) ( SURFACE-AT ?auto_5994 ?auto_6000 ) ( ON ?auto_5994 ?auto_5998 ) ( CLEAR ?auto_5994 ) ( not ( = ?auto_5994 ?auto_5998 ) ) ( not ( = ?auto_5995 ?auto_5998 ) ) ( not ( = ?auto_6001 ?auto_5998 ) ) ( not ( = ?auto_5996 ?auto_5998 ) ) ( TRUCK-AT ?auto_6003 ?auto_5997 ) )
    :subtasks
    ( ( !DRIVE ?auto_6003 ?auto_5997 ?auto_6000 )
      ( MAKE-2CRATE ?auto_6001 ?auto_5994 ?auto_5995 )
      ( MAKE-1CRATE-VERIFY ?auto_5994 ?auto_5995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6006 - SURFACE
      ?auto_6007 - SURFACE
      ?auto_6008 - SURFACE
    )
    :vars
    (
      ?auto_6009 - HOIST
      ?auto_6012 - PLACE
      ?auto_6011 - PLACE
      ?auto_6017 - HOIST
      ?auto_6016 - SURFACE
      ?auto_6010 - PLACE
      ?auto_6015 - HOIST
      ?auto_6014 - SURFACE
      ?auto_6013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6009 ?auto_6012 ) ( IS-CRATE ?auto_6008 ) ( not ( = ?auto_6007 ?auto_6008 ) ) ( not ( = ?auto_6006 ?auto_6007 ) ) ( not ( = ?auto_6006 ?auto_6008 ) ) ( not ( = ?auto_6011 ?auto_6012 ) ) ( HOIST-AT ?auto_6017 ?auto_6011 ) ( not ( = ?auto_6009 ?auto_6017 ) ) ( AVAILABLE ?auto_6017 ) ( SURFACE-AT ?auto_6008 ?auto_6011 ) ( ON ?auto_6008 ?auto_6016 ) ( CLEAR ?auto_6008 ) ( not ( = ?auto_6007 ?auto_6016 ) ) ( not ( = ?auto_6008 ?auto_6016 ) ) ( not ( = ?auto_6006 ?auto_6016 ) ) ( SURFACE-AT ?auto_6006 ?auto_6012 ) ( CLEAR ?auto_6006 ) ( IS-CRATE ?auto_6007 ) ( AVAILABLE ?auto_6009 ) ( not ( = ?auto_6010 ?auto_6012 ) ) ( not ( = ?auto_6011 ?auto_6010 ) ) ( HOIST-AT ?auto_6015 ?auto_6010 ) ( not ( = ?auto_6009 ?auto_6015 ) ) ( not ( = ?auto_6017 ?auto_6015 ) ) ( AVAILABLE ?auto_6015 ) ( SURFACE-AT ?auto_6007 ?auto_6010 ) ( ON ?auto_6007 ?auto_6014 ) ( CLEAR ?auto_6007 ) ( not ( = ?auto_6007 ?auto_6014 ) ) ( not ( = ?auto_6008 ?auto_6014 ) ) ( not ( = ?auto_6006 ?auto_6014 ) ) ( not ( = ?auto_6016 ?auto_6014 ) ) ( TRUCK-AT ?auto_6013 ?auto_6012 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6007 ?auto_6008 )
      ( MAKE-2CRATE-VERIFY ?auto_6006 ?auto_6007 ?auto_6008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6018 - SURFACE
      ?auto_6019 - SURFACE
      ?auto_6020 - SURFACE
      ?auto_6021 - SURFACE
    )
    :vars
    (
      ?auto_6024 - HOIST
      ?auto_6023 - PLACE
      ?auto_6030 - PLACE
      ?auto_6022 - HOIST
      ?auto_6029 - SURFACE
      ?auto_6027 - PLACE
      ?auto_6028 - HOIST
      ?auto_6025 - SURFACE
      ?auto_6026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6024 ?auto_6023 ) ( IS-CRATE ?auto_6021 ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( not ( = ?auto_6019 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6021 ) ) ( not ( = ?auto_6030 ?auto_6023 ) ) ( HOIST-AT ?auto_6022 ?auto_6030 ) ( not ( = ?auto_6024 ?auto_6022 ) ) ( AVAILABLE ?auto_6022 ) ( SURFACE-AT ?auto_6021 ?auto_6030 ) ( ON ?auto_6021 ?auto_6029 ) ( CLEAR ?auto_6021 ) ( not ( = ?auto_6020 ?auto_6029 ) ) ( not ( = ?auto_6021 ?auto_6029 ) ) ( not ( = ?auto_6019 ?auto_6029 ) ) ( SURFACE-AT ?auto_6019 ?auto_6023 ) ( CLEAR ?auto_6019 ) ( IS-CRATE ?auto_6020 ) ( AVAILABLE ?auto_6024 ) ( not ( = ?auto_6027 ?auto_6023 ) ) ( not ( = ?auto_6030 ?auto_6027 ) ) ( HOIST-AT ?auto_6028 ?auto_6027 ) ( not ( = ?auto_6024 ?auto_6028 ) ) ( not ( = ?auto_6022 ?auto_6028 ) ) ( AVAILABLE ?auto_6028 ) ( SURFACE-AT ?auto_6020 ?auto_6027 ) ( ON ?auto_6020 ?auto_6025 ) ( CLEAR ?auto_6020 ) ( not ( = ?auto_6020 ?auto_6025 ) ) ( not ( = ?auto_6021 ?auto_6025 ) ) ( not ( = ?auto_6019 ?auto_6025 ) ) ( not ( = ?auto_6029 ?auto_6025 ) ) ( TRUCK-AT ?auto_6026 ?auto_6023 ) ( ON ?auto_6019 ?auto_6018 ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6020 ) ) ( not ( = ?auto_6018 ?auto_6021 ) ) ( not ( = ?auto_6018 ?auto_6029 ) ) ( not ( = ?auto_6018 ?auto_6025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6019 ?auto_6020 ?auto_6021 )
      ( MAKE-3CRATE-VERIFY ?auto_6018 ?auto_6019 ?auto_6020 ?auto_6021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6031 - SURFACE
      ?auto_6032 - SURFACE
    )
    :vars
    (
      ?auto_6036 - HOIST
      ?auto_6035 - PLACE
      ?auto_6034 - SURFACE
      ?auto_6042 - PLACE
      ?auto_6033 - HOIST
      ?auto_6041 - SURFACE
      ?auto_6039 - PLACE
      ?auto_6040 - HOIST
      ?auto_6037 - SURFACE
      ?auto_6038 - TRUCK
      ?auto_6043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6036 ?auto_6035 ) ( IS-CRATE ?auto_6032 ) ( not ( = ?auto_6031 ?auto_6032 ) ) ( not ( = ?auto_6034 ?auto_6031 ) ) ( not ( = ?auto_6034 ?auto_6032 ) ) ( not ( = ?auto_6042 ?auto_6035 ) ) ( HOIST-AT ?auto_6033 ?auto_6042 ) ( not ( = ?auto_6036 ?auto_6033 ) ) ( AVAILABLE ?auto_6033 ) ( SURFACE-AT ?auto_6032 ?auto_6042 ) ( ON ?auto_6032 ?auto_6041 ) ( CLEAR ?auto_6032 ) ( not ( = ?auto_6031 ?auto_6041 ) ) ( not ( = ?auto_6032 ?auto_6041 ) ) ( not ( = ?auto_6034 ?auto_6041 ) ) ( IS-CRATE ?auto_6031 ) ( not ( = ?auto_6039 ?auto_6035 ) ) ( not ( = ?auto_6042 ?auto_6039 ) ) ( HOIST-AT ?auto_6040 ?auto_6039 ) ( not ( = ?auto_6036 ?auto_6040 ) ) ( not ( = ?auto_6033 ?auto_6040 ) ) ( AVAILABLE ?auto_6040 ) ( SURFACE-AT ?auto_6031 ?auto_6039 ) ( ON ?auto_6031 ?auto_6037 ) ( CLEAR ?auto_6031 ) ( not ( = ?auto_6031 ?auto_6037 ) ) ( not ( = ?auto_6032 ?auto_6037 ) ) ( not ( = ?auto_6034 ?auto_6037 ) ) ( not ( = ?auto_6041 ?auto_6037 ) ) ( TRUCK-AT ?auto_6038 ?auto_6035 ) ( SURFACE-AT ?auto_6043 ?auto_6035 ) ( CLEAR ?auto_6043 ) ( LIFTING ?auto_6036 ?auto_6034 ) ( IS-CRATE ?auto_6034 ) ( not ( = ?auto_6043 ?auto_6034 ) ) ( not ( = ?auto_6031 ?auto_6043 ) ) ( not ( = ?auto_6032 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6037 ?auto_6043 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6043 ?auto_6034 )
      ( MAKE-2CRATE ?auto_6034 ?auto_6031 ?auto_6032 )
      ( MAKE-1CRATE-VERIFY ?auto_6031 ?auto_6032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6044 - SURFACE
      ?auto_6045 - SURFACE
      ?auto_6046 - SURFACE
    )
    :vars
    (
      ?auto_6050 - HOIST
      ?auto_6056 - PLACE
      ?auto_6047 - PLACE
      ?auto_6053 - HOIST
      ?auto_6054 - SURFACE
      ?auto_6052 - PLACE
      ?auto_6048 - HOIST
      ?auto_6055 - SURFACE
      ?auto_6051 - TRUCK
      ?auto_6049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6050 ?auto_6056 ) ( IS-CRATE ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( not ( = ?auto_6044 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6046 ) ) ( not ( = ?auto_6047 ?auto_6056 ) ) ( HOIST-AT ?auto_6053 ?auto_6047 ) ( not ( = ?auto_6050 ?auto_6053 ) ) ( AVAILABLE ?auto_6053 ) ( SURFACE-AT ?auto_6046 ?auto_6047 ) ( ON ?auto_6046 ?auto_6054 ) ( CLEAR ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6054 ) ) ( not ( = ?auto_6046 ?auto_6054 ) ) ( not ( = ?auto_6044 ?auto_6054 ) ) ( IS-CRATE ?auto_6045 ) ( not ( = ?auto_6052 ?auto_6056 ) ) ( not ( = ?auto_6047 ?auto_6052 ) ) ( HOIST-AT ?auto_6048 ?auto_6052 ) ( not ( = ?auto_6050 ?auto_6048 ) ) ( not ( = ?auto_6053 ?auto_6048 ) ) ( AVAILABLE ?auto_6048 ) ( SURFACE-AT ?auto_6045 ?auto_6052 ) ( ON ?auto_6045 ?auto_6055 ) ( CLEAR ?auto_6045 ) ( not ( = ?auto_6045 ?auto_6055 ) ) ( not ( = ?auto_6046 ?auto_6055 ) ) ( not ( = ?auto_6044 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( TRUCK-AT ?auto_6051 ?auto_6056 ) ( SURFACE-AT ?auto_6049 ?auto_6056 ) ( CLEAR ?auto_6049 ) ( LIFTING ?auto_6050 ?auto_6044 ) ( IS-CRATE ?auto_6044 ) ( not ( = ?auto_6049 ?auto_6044 ) ) ( not ( = ?auto_6045 ?auto_6049 ) ) ( not ( = ?auto_6046 ?auto_6049 ) ) ( not ( = ?auto_6054 ?auto_6049 ) ) ( not ( = ?auto_6055 ?auto_6049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6045 ?auto_6046 )
      ( MAKE-2CRATE-VERIFY ?auto_6044 ?auto_6045 ?auto_6046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6057 - SURFACE
      ?auto_6058 - SURFACE
      ?auto_6059 - SURFACE
      ?auto_6060 - SURFACE
    )
    :vars
    (
      ?auto_6061 - HOIST
      ?auto_6065 - PLACE
      ?auto_6064 - PLACE
      ?auto_6069 - HOIST
      ?auto_6063 - SURFACE
      ?auto_6066 - PLACE
      ?auto_6068 - HOIST
      ?auto_6062 - SURFACE
      ?auto_6067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6061 ?auto_6065 ) ( IS-CRATE ?auto_6060 ) ( not ( = ?auto_6059 ?auto_6060 ) ) ( not ( = ?auto_6058 ?auto_6059 ) ) ( not ( = ?auto_6058 ?auto_6060 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( HOIST-AT ?auto_6069 ?auto_6064 ) ( not ( = ?auto_6061 ?auto_6069 ) ) ( AVAILABLE ?auto_6069 ) ( SURFACE-AT ?auto_6060 ?auto_6064 ) ( ON ?auto_6060 ?auto_6063 ) ( CLEAR ?auto_6060 ) ( not ( = ?auto_6059 ?auto_6063 ) ) ( not ( = ?auto_6060 ?auto_6063 ) ) ( not ( = ?auto_6058 ?auto_6063 ) ) ( IS-CRATE ?auto_6059 ) ( not ( = ?auto_6066 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( HOIST-AT ?auto_6068 ?auto_6066 ) ( not ( = ?auto_6061 ?auto_6068 ) ) ( not ( = ?auto_6069 ?auto_6068 ) ) ( AVAILABLE ?auto_6068 ) ( SURFACE-AT ?auto_6059 ?auto_6066 ) ( ON ?auto_6059 ?auto_6062 ) ( CLEAR ?auto_6059 ) ( not ( = ?auto_6059 ?auto_6062 ) ) ( not ( = ?auto_6060 ?auto_6062 ) ) ( not ( = ?auto_6058 ?auto_6062 ) ) ( not ( = ?auto_6063 ?auto_6062 ) ) ( TRUCK-AT ?auto_6067 ?auto_6065 ) ( SURFACE-AT ?auto_6057 ?auto_6065 ) ( CLEAR ?auto_6057 ) ( LIFTING ?auto_6061 ?auto_6058 ) ( IS-CRATE ?auto_6058 ) ( not ( = ?auto_6057 ?auto_6058 ) ) ( not ( = ?auto_6059 ?auto_6057 ) ) ( not ( = ?auto_6060 ?auto_6057 ) ) ( not ( = ?auto_6063 ?auto_6057 ) ) ( not ( = ?auto_6062 ?auto_6057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6058 ?auto_6059 ?auto_6060 )
      ( MAKE-3CRATE-VERIFY ?auto_6057 ?auto_6058 ?auto_6059 ?auto_6060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6070 - SURFACE
      ?auto_6071 - SURFACE
    )
    :vars
    (
      ?auto_6072 - HOIST
      ?auto_6076 - PLACE
      ?auto_6080 - SURFACE
      ?auto_6075 - PLACE
      ?auto_6082 - HOIST
      ?auto_6074 - SURFACE
      ?auto_6077 - PLACE
      ?auto_6079 - HOIST
      ?auto_6073 - SURFACE
      ?auto_6078 - TRUCK
      ?auto_6081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6072 ?auto_6076 ) ( IS-CRATE ?auto_6071 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6080 ?auto_6070 ) ) ( not ( = ?auto_6080 ?auto_6071 ) ) ( not ( = ?auto_6075 ?auto_6076 ) ) ( HOIST-AT ?auto_6082 ?auto_6075 ) ( not ( = ?auto_6072 ?auto_6082 ) ) ( AVAILABLE ?auto_6082 ) ( SURFACE-AT ?auto_6071 ?auto_6075 ) ( ON ?auto_6071 ?auto_6074 ) ( CLEAR ?auto_6071 ) ( not ( = ?auto_6070 ?auto_6074 ) ) ( not ( = ?auto_6071 ?auto_6074 ) ) ( not ( = ?auto_6080 ?auto_6074 ) ) ( IS-CRATE ?auto_6070 ) ( not ( = ?auto_6077 ?auto_6076 ) ) ( not ( = ?auto_6075 ?auto_6077 ) ) ( HOIST-AT ?auto_6079 ?auto_6077 ) ( not ( = ?auto_6072 ?auto_6079 ) ) ( not ( = ?auto_6082 ?auto_6079 ) ) ( AVAILABLE ?auto_6079 ) ( SURFACE-AT ?auto_6070 ?auto_6077 ) ( ON ?auto_6070 ?auto_6073 ) ( CLEAR ?auto_6070 ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6080 ?auto_6073 ) ) ( not ( = ?auto_6074 ?auto_6073 ) ) ( TRUCK-AT ?auto_6078 ?auto_6076 ) ( SURFACE-AT ?auto_6081 ?auto_6076 ) ( CLEAR ?auto_6081 ) ( IS-CRATE ?auto_6080 ) ( not ( = ?auto_6081 ?auto_6080 ) ) ( not ( = ?auto_6070 ?auto_6081 ) ) ( not ( = ?auto_6071 ?auto_6081 ) ) ( not ( = ?auto_6074 ?auto_6081 ) ) ( not ( = ?auto_6073 ?auto_6081 ) ) ( AVAILABLE ?auto_6072 ) ( IN ?auto_6080 ?auto_6078 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6072 ?auto_6080 ?auto_6078 ?auto_6076 )
      ( MAKE-2CRATE ?auto_6080 ?auto_6070 ?auto_6071 )
      ( MAKE-1CRATE-VERIFY ?auto_6070 ?auto_6071 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6083 - SURFACE
      ?auto_6084 - SURFACE
      ?auto_6085 - SURFACE
    )
    :vars
    (
      ?auto_6089 - HOIST
      ?auto_6090 - PLACE
      ?auto_6095 - PLACE
      ?auto_6091 - HOIST
      ?auto_6092 - SURFACE
      ?auto_6094 - PLACE
      ?auto_6093 - HOIST
      ?auto_6087 - SURFACE
      ?auto_6086 - TRUCK
      ?auto_6088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6089 ?auto_6090 ) ( IS-CRATE ?auto_6085 ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6083 ?auto_6084 ) ) ( not ( = ?auto_6083 ?auto_6085 ) ) ( not ( = ?auto_6095 ?auto_6090 ) ) ( HOIST-AT ?auto_6091 ?auto_6095 ) ( not ( = ?auto_6089 ?auto_6091 ) ) ( AVAILABLE ?auto_6091 ) ( SURFACE-AT ?auto_6085 ?auto_6095 ) ( ON ?auto_6085 ?auto_6092 ) ( CLEAR ?auto_6085 ) ( not ( = ?auto_6084 ?auto_6092 ) ) ( not ( = ?auto_6085 ?auto_6092 ) ) ( not ( = ?auto_6083 ?auto_6092 ) ) ( IS-CRATE ?auto_6084 ) ( not ( = ?auto_6094 ?auto_6090 ) ) ( not ( = ?auto_6095 ?auto_6094 ) ) ( HOIST-AT ?auto_6093 ?auto_6094 ) ( not ( = ?auto_6089 ?auto_6093 ) ) ( not ( = ?auto_6091 ?auto_6093 ) ) ( AVAILABLE ?auto_6093 ) ( SURFACE-AT ?auto_6084 ?auto_6094 ) ( ON ?auto_6084 ?auto_6087 ) ( CLEAR ?auto_6084 ) ( not ( = ?auto_6084 ?auto_6087 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6083 ?auto_6087 ) ) ( not ( = ?auto_6092 ?auto_6087 ) ) ( TRUCK-AT ?auto_6086 ?auto_6090 ) ( SURFACE-AT ?auto_6088 ?auto_6090 ) ( CLEAR ?auto_6088 ) ( IS-CRATE ?auto_6083 ) ( not ( = ?auto_6088 ?auto_6083 ) ) ( not ( = ?auto_6084 ?auto_6088 ) ) ( not ( = ?auto_6085 ?auto_6088 ) ) ( not ( = ?auto_6092 ?auto_6088 ) ) ( not ( = ?auto_6087 ?auto_6088 ) ) ( AVAILABLE ?auto_6089 ) ( IN ?auto_6083 ?auto_6086 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6084 ?auto_6085 )
      ( MAKE-2CRATE-VERIFY ?auto_6083 ?auto_6084 ?auto_6085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6096 - SURFACE
      ?auto_6097 - SURFACE
      ?auto_6098 - SURFACE
      ?auto_6099 - SURFACE
    )
    :vars
    (
      ?auto_6102 - HOIST
      ?auto_6104 - PLACE
      ?auto_6103 - PLACE
      ?auto_6107 - HOIST
      ?auto_6106 - SURFACE
      ?auto_6101 - PLACE
      ?auto_6100 - HOIST
      ?auto_6108 - SURFACE
      ?auto_6105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6102 ?auto_6104 ) ( IS-CRATE ?auto_6099 ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( not ( = ?auto_6097 ?auto_6098 ) ) ( not ( = ?auto_6097 ?auto_6099 ) ) ( not ( = ?auto_6103 ?auto_6104 ) ) ( HOIST-AT ?auto_6107 ?auto_6103 ) ( not ( = ?auto_6102 ?auto_6107 ) ) ( AVAILABLE ?auto_6107 ) ( SURFACE-AT ?auto_6099 ?auto_6103 ) ( ON ?auto_6099 ?auto_6106 ) ( CLEAR ?auto_6099 ) ( not ( = ?auto_6098 ?auto_6106 ) ) ( not ( = ?auto_6099 ?auto_6106 ) ) ( not ( = ?auto_6097 ?auto_6106 ) ) ( IS-CRATE ?auto_6098 ) ( not ( = ?auto_6101 ?auto_6104 ) ) ( not ( = ?auto_6103 ?auto_6101 ) ) ( HOIST-AT ?auto_6100 ?auto_6101 ) ( not ( = ?auto_6102 ?auto_6100 ) ) ( not ( = ?auto_6107 ?auto_6100 ) ) ( AVAILABLE ?auto_6100 ) ( SURFACE-AT ?auto_6098 ?auto_6101 ) ( ON ?auto_6098 ?auto_6108 ) ( CLEAR ?auto_6098 ) ( not ( = ?auto_6098 ?auto_6108 ) ) ( not ( = ?auto_6099 ?auto_6108 ) ) ( not ( = ?auto_6097 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( TRUCK-AT ?auto_6105 ?auto_6104 ) ( SURFACE-AT ?auto_6096 ?auto_6104 ) ( CLEAR ?auto_6096 ) ( IS-CRATE ?auto_6097 ) ( not ( = ?auto_6096 ?auto_6097 ) ) ( not ( = ?auto_6098 ?auto_6096 ) ) ( not ( = ?auto_6099 ?auto_6096 ) ) ( not ( = ?auto_6106 ?auto_6096 ) ) ( not ( = ?auto_6108 ?auto_6096 ) ) ( AVAILABLE ?auto_6102 ) ( IN ?auto_6097 ?auto_6105 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6097 ?auto_6098 ?auto_6099 )
      ( MAKE-3CRATE-VERIFY ?auto_6096 ?auto_6097 ?auto_6098 ?auto_6099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6109 - SURFACE
      ?auto_6110 - SURFACE
    )
    :vars
    (
      ?auto_6114 - HOIST
      ?auto_6116 - PLACE
      ?auto_6121 - SURFACE
      ?auto_6115 - PLACE
      ?auto_6119 - HOIST
      ?auto_6118 - SURFACE
      ?auto_6113 - PLACE
      ?auto_6111 - HOIST
      ?auto_6120 - SURFACE
      ?auto_6112 - SURFACE
      ?auto_6117 - TRUCK
      ?auto_6122 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6114 ?auto_6116 ) ( IS-CRATE ?auto_6110 ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( not ( = ?auto_6121 ?auto_6109 ) ) ( not ( = ?auto_6121 ?auto_6110 ) ) ( not ( = ?auto_6115 ?auto_6116 ) ) ( HOIST-AT ?auto_6119 ?auto_6115 ) ( not ( = ?auto_6114 ?auto_6119 ) ) ( AVAILABLE ?auto_6119 ) ( SURFACE-AT ?auto_6110 ?auto_6115 ) ( ON ?auto_6110 ?auto_6118 ) ( CLEAR ?auto_6110 ) ( not ( = ?auto_6109 ?auto_6118 ) ) ( not ( = ?auto_6110 ?auto_6118 ) ) ( not ( = ?auto_6121 ?auto_6118 ) ) ( IS-CRATE ?auto_6109 ) ( not ( = ?auto_6113 ?auto_6116 ) ) ( not ( = ?auto_6115 ?auto_6113 ) ) ( HOIST-AT ?auto_6111 ?auto_6113 ) ( not ( = ?auto_6114 ?auto_6111 ) ) ( not ( = ?auto_6119 ?auto_6111 ) ) ( AVAILABLE ?auto_6111 ) ( SURFACE-AT ?auto_6109 ?auto_6113 ) ( ON ?auto_6109 ?auto_6120 ) ( CLEAR ?auto_6109 ) ( not ( = ?auto_6109 ?auto_6120 ) ) ( not ( = ?auto_6110 ?auto_6120 ) ) ( not ( = ?auto_6121 ?auto_6120 ) ) ( not ( = ?auto_6118 ?auto_6120 ) ) ( SURFACE-AT ?auto_6112 ?auto_6116 ) ( CLEAR ?auto_6112 ) ( IS-CRATE ?auto_6121 ) ( not ( = ?auto_6112 ?auto_6121 ) ) ( not ( = ?auto_6109 ?auto_6112 ) ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6118 ?auto_6112 ) ) ( not ( = ?auto_6120 ?auto_6112 ) ) ( AVAILABLE ?auto_6114 ) ( IN ?auto_6121 ?auto_6117 ) ( TRUCK-AT ?auto_6117 ?auto_6122 ) ( not ( = ?auto_6122 ?auto_6116 ) ) ( not ( = ?auto_6115 ?auto_6122 ) ) ( not ( = ?auto_6113 ?auto_6122 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6117 ?auto_6122 ?auto_6116 )
      ( MAKE-2CRATE ?auto_6121 ?auto_6109 ?auto_6110 )
      ( MAKE-1CRATE-VERIFY ?auto_6109 ?auto_6110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6123 - SURFACE
      ?auto_6124 - SURFACE
      ?auto_6125 - SURFACE
    )
    :vars
    (
      ?auto_6134 - HOIST
      ?auto_6126 - PLACE
      ?auto_6130 - PLACE
      ?auto_6128 - HOIST
      ?auto_6132 - SURFACE
      ?auto_6131 - PLACE
      ?auto_6127 - HOIST
      ?auto_6129 - SURFACE
      ?auto_6136 - SURFACE
      ?auto_6133 - TRUCK
      ?auto_6135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6134 ?auto_6126 ) ( IS-CRATE ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6130 ?auto_6126 ) ) ( HOIST-AT ?auto_6128 ?auto_6130 ) ( not ( = ?auto_6134 ?auto_6128 ) ) ( AVAILABLE ?auto_6128 ) ( SURFACE-AT ?auto_6125 ?auto_6130 ) ( ON ?auto_6125 ?auto_6132 ) ( CLEAR ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6132 ) ) ( not ( = ?auto_6125 ?auto_6132 ) ) ( not ( = ?auto_6123 ?auto_6132 ) ) ( IS-CRATE ?auto_6124 ) ( not ( = ?auto_6131 ?auto_6126 ) ) ( not ( = ?auto_6130 ?auto_6131 ) ) ( HOIST-AT ?auto_6127 ?auto_6131 ) ( not ( = ?auto_6134 ?auto_6127 ) ) ( not ( = ?auto_6128 ?auto_6127 ) ) ( AVAILABLE ?auto_6127 ) ( SURFACE-AT ?auto_6124 ?auto_6131 ) ( ON ?auto_6124 ?auto_6129 ) ( CLEAR ?auto_6124 ) ( not ( = ?auto_6124 ?auto_6129 ) ) ( not ( = ?auto_6125 ?auto_6129 ) ) ( not ( = ?auto_6123 ?auto_6129 ) ) ( not ( = ?auto_6132 ?auto_6129 ) ) ( SURFACE-AT ?auto_6136 ?auto_6126 ) ( CLEAR ?auto_6136 ) ( IS-CRATE ?auto_6123 ) ( not ( = ?auto_6136 ?auto_6123 ) ) ( not ( = ?auto_6124 ?auto_6136 ) ) ( not ( = ?auto_6125 ?auto_6136 ) ) ( not ( = ?auto_6132 ?auto_6136 ) ) ( not ( = ?auto_6129 ?auto_6136 ) ) ( AVAILABLE ?auto_6134 ) ( IN ?auto_6123 ?auto_6133 ) ( TRUCK-AT ?auto_6133 ?auto_6135 ) ( not ( = ?auto_6135 ?auto_6126 ) ) ( not ( = ?auto_6130 ?auto_6135 ) ) ( not ( = ?auto_6131 ?auto_6135 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6124 ?auto_6125 )
      ( MAKE-2CRATE-VERIFY ?auto_6123 ?auto_6124 ?auto_6125 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6137 - SURFACE
      ?auto_6138 - SURFACE
      ?auto_6139 - SURFACE
      ?auto_6140 - SURFACE
    )
    :vars
    (
      ?auto_6148 - HOIST
      ?auto_6142 - PLACE
      ?auto_6144 - PLACE
      ?auto_6143 - HOIST
      ?auto_6149 - SURFACE
      ?auto_6145 - PLACE
      ?auto_6147 - HOIST
      ?auto_6146 - SURFACE
      ?auto_6150 - TRUCK
      ?auto_6141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6148 ?auto_6142 ) ( IS-CRATE ?auto_6140 ) ( not ( = ?auto_6139 ?auto_6140 ) ) ( not ( = ?auto_6138 ?auto_6139 ) ) ( not ( = ?auto_6138 ?auto_6140 ) ) ( not ( = ?auto_6144 ?auto_6142 ) ) ( HOIST-AT ?auto_6143 ?auto_6144 ) ( not ( = ?auto_6148 ?auto_6143 ) ) ( AVAILABLE ?auto_6143 ) ( SURFACE-AT ?auto_6140 ?auto_6144 ) ( ON ?auto_6140 ?auto_6149 ) ( CLEAR ?auto_6140 ) ( not ( = ?auto_6139 ?auto_6149 ) ) ( not ( = ?auto_6140 ?auto_6149 ) ) ( not ( = ?auto_6138 ?auto_6149 ) ) ( IS-CRATE ?auto_6139 ) ( not ( = ?auto_6145 ?auto_6142 ) ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( HOIST-AT ?auto_6147 ?auto_6145 ) ( not ( = ?auto_6148 ?auto_6147 ) ) ( not ( = ?auto_6143 ?auto_6147 ) ) ( AVAILABLE ?auto_6147 ) ( SURFACE-AT ?auto_6139 ?auto_6145 ) ( ON ?auto_6139 ?auto_6146 ) ( CLEAR ?auto_6139 ) ( not ( = ?auto_6139 ?auto_6146 ) ) ( not ( = ?auto_6140 ?auto_6146 ) ) ( not ( = ?auto_6138 ?auto_6146 ) ) ( not ( = ?auto_6149 ?auto_6146 ) ) ( SURFACE-AT ?auto_6137 ?auto_6142 ) ( CLEAR ?auto_6137 ) ( IS-CRATE ?auto_6138 ) ( not ( = ?auto_6137 ?auto_6138 ) ) ( not ( = ?auto_6139 ?auto_6137 ) ) ( not ( = ?auto_6140 ?auto_6137 ) ) ( not ( = ?auto_6149 ?auto_6137 ) ) ( not ( = ?auto_6146 ?auto_6137 ) ) ( AVAILABLE ?auto_6148 ) ( IN ?auto_6138 ?auto_6150 ) ( TRUCK-AT ?auto_6150 ?auto_6141 ) ( not ( = ?auto_6141 ?auto_6142 ) ) ( not ( = ?auto_6144 ?auto_6141 ) ) ( not ( = ?auto_6145 ?auto_6141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6138 ?auto_6139 ?auto_6140 )
      ( MAKE-3CRATE-VERIFY ?auto_6137 ?auto_6138 ?auto_6139 ?auto_6140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6151 - SURFACE
      ?auto_6152 - SURFACE
    )
    :vars
    (
      ?auto_6162 - HOIST
      ?auto_6155 - PLACE
      ?auto_6160 - SURFACE
      ?auto_6157 - PLACE
      ?auto_6156 - HOIST
      ?auto_6163 - SURFACE
      ?auto_6158 - PLACE
      ?auto_6161 - HOIST
      ?auto_6159 - SURFACE
      ?auto_6154 - SURFACE
      ?auto_6164 - TRUCK
      ?auto_6153 - PLACE
      ?auto_6165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6162 ?auto_6155 ) ( IS-CRATE ?auto_6152 ) ( not ( = ?auto_6151 ?auto_6152 ) ) ( not ( = ?auto_6160 ?auto_6151 ) ) ( not ( = ?auto_6160 ?auto_6152 ) ) ( not ( = ?auto_6157 ?auto_6155 ) ) ( HOIST-AT ?auto_6156 ?auto_6157 ) ( not ( = ?auto_6162 ?auto_6156 ) ) ( AVAILABLE ?auto_6156 ) ( SURFACE-AT ?auto_6152 ?auto_6157 ) ( ON ?auto_6152 ?auto_6163 ) ( CLEAR ?auto_6152 ) ( not ( = ?auto_6151 ?auto_6163 ) ) ( not ( = ?auto_6152 ?auto_6163 ) ) ( not ( = ?auto_6160 ?auto_6163 ) ) ( IS-CRATE ?auto_6151 ) ( not ( = ?auto_6158 ?auto_6155 ) ) ( not ( = ?auto_6157 ?auto_6158 ) ) ( HOIST-AT ?auto_6161 ?auto_6158 ) ( not ( = ?auto_6162 ?auto_6161 ) ) ( not ( = ?auto_6156 ?auto_6161 ) ) ( AVAILABLE ?auto_6161 ) ( SURFACE-AT ?auto_6151 ?auto_6158 ) ( ON ?auto_6151 ?auto_6159 ) ( CLEAR ?auto_6151 ) ( not ( = ?auto_6151 ?auto_6159 ) ) ( not ( = ?auto_6152 ?auto_6159 ) ) ( not ( = ?auto_6160 ?auto_6159 ) ) ( not ( = ?auto_6163 ?auto_6159 ) ) ( SURFACE-AT ?auto_6154 ?auto_6155 ) ( CLEAR ?auto_6154 ) ( IS-CRATE ?auto_6160 ) ( not ( = ?auto_6154 ?auto_6160 ) ) ( not ( = ?auto_6151 ?auto_6154 ) ) ( not ( = ?auto_6152 ?auto_6154 ) ) ( not ( = ?auto_6163 ?auto_6154 ) ) ( not ( = ?auto_6159 ?auto_6154 ) ) ( AVAILABLE ?auto_6162 ) ( TRUCK-AT ?auto_6164 ?auto_6153 ) ( not ( = ?auto_6153 ?auto_6155 ) ) ( not ( = ?auto_6157 ?auto_6153 ) ) ( not ( = ?auto_6158 ?auto_6153 ) ) ( HOIST-AT ?auto_6165 ?auto_6153 ) ( LIFTING ?auto_6165 ?auto_6160 ) ( not ( = ?auto_6162 ?auto_6165 ) ) ( not ( = ?auto_6156 ?auto_6165 ) ) ( not ( = ?auto_6161 ?auto_6165 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6165 ?auto_6160 ?auto_6164 ?auto_6153 )
      ( MAKE-2CRATE ?auto_6160 ?auto_6151 ?auto_6152 )
      ( MAKE-1CRATE-VERIFY ?auto_6151 ?auto_6152 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6166 - SURFACE
      ?auto_6167 - SURFACE
      ?auto_6168 - SURFACE
    )
    :vars
    (
      ?auto_6179 - HOIST
      ?auto_6172 - PLACE
      ?auto_6173 - PLACE
      ?auto_6178 - HOIST
      ?auto_6180 - SURFACE
      ?auto_6174 - PLACE
      ?auto_6175 - HOIST
      ?auto_6169 - SURFACE
      ?auto_6170 - SURFACE
      ?auto_6171 - TRUCK
      ?auto_6177 - PLACE
      ?auto_6176 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6179 ?auto_6172 ) ( IS-CRATE ?auto_6168 ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( not ( = ?auto_6173 ?auto_6172 ) ) ( HOIST-AT ?auto_6178 ?auto_6173 ) ( not ( = ?auto_6179 ?auto_6178 ) ) ( AVAILABLE ?auto_6178 ) ( SURFACE-AT ?auto_6168 ?auto_6173 ) ( ON ?auto_6168 ?auto_6180 ) ( CLEAR ?auto_6168 ) ( not ( = ?auto_6167 ?auto_6180 ) ) ( not ( = ?auto_6168 ?auto_6180 ) ) ( not ( = ?auto_6166 ?auto_6180 ) ) ( IS-CRATE ?auto_6167 ) ( not ( = ?auto_6174 ?auto_6172 ) ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( HOIST-AT ?auto_6175 ?auto_6174 ) ( not ( = ?auto_6179 ?auto_6175 ) ) ( not ( = ?auto_6178 ?auto_6175 ) ) ( AVAILABLE ?auto_6175 ) ( SURFACE-AT ?auto_6167 ?auto_6174 ) ( ON ?auto_6167 ?auto_6169 ) ( CLEAR ?auto_6167 ) ( not ( = ?auto_6167 ?auto_6169 ) ) ( not ( = ?auto_6168 ?auto_6169 ) ) ( not ( = ?auto_6166 ?auto_6169 ) ) ( not ( = ?auto_6180 ?auto_6169 ) ) ( SURFACE-AT ?auto_6170 ?auto_6172 ) ( CLEAR ?auto_6170 ) ( IS-CRATE ?auto_6166 ) ( not ( = ?auto_6170 ?auto_6166 ) ) ( not ( = ?auto_6167 ?auto_6170 ) ) ( not ( = ?auto_6168 ?auto_6170 ) ) ( not ( = ?auto_6180 ?auto_6170 ) ) ( not ( = ?auto_6169 ?auto_6170 ) ) ( AVAILABLE ?auto_6179 ) ( TRUCK-AT ?auto_6171 ?auto_6177 ) ( not ( = ?auto_6177 ?auto_6172 ) ) ( not ( = ?auto_6173 ?auto_6177 ) ) ( not ( = ?auto_6174 ?auto_6177 ) ) ( HOIST-AT ?auto_6176 ?auto_6177 ) ( LIFTING ?auto_6176 ?auto_6166 ) ( not ( = ?auto_6179 ?auto_6176 ) ) ( not ( = ?auto_6178 ?auto_6176 ) ) ( not ( = ?auto_6175 ?auto_6176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6167 ?auto_6168 )
      ( MAKE-2CRATE-VERIFY ?auto_6166 ?auto_6167 ?auto_6168 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6181 - SURFACE
      ?auto_6182 - SURFACE
      ?auto_6183 - SURFACE
      ?auto_6184 - SURFACE
    )
    :vars
    (
      ?auto_6195 - HOIST
      ?auto_6189 - PLACE
      ?auto_6194 - PLACE
      ?auto_6187 - HOIST
      ?auto_6193 - SURFACE
      ?auto_6192 - PLACE
      ?auto_6185 - HOIST
      ?auto_6190 - SURFACE
      ?auto_6191 - TRUCK
      ?auto_6186 - PLACE
      ?auto_6188 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6195 ?auto_6189 ) ( IS-CRATE ?auto_6184 ) ( not ( = ?auto_6183 ?auto_6184 ) ) ( not ( = ?auto_6182 ?auto_6183 ) ) ( not ( = ?auto_6182 ?auto_6184 ) ) ( not ( = ?auto_6194 ?auto_6189 ) ) ( HOIST-AT ?auto_6187 ?auto_6194 ) ( not ( = ?auto_6195 ?auto_6187 ) ) ( AVAILABLE ?auto_6187 ) ( SURFACE-AT ?auto_6184 ?auto_6194 ) ( ON ?auto_6184 ?auto_6193 ) ( CLEAR ?auto_6184 ) ( not ( = ?auto_6183 ?auto_6193 ) ) ( not ( = ?auto_6184 ?auto_6193 ) ) ( not ( = ?auto_6182 ?auto_6193 ) ) ( IS-CRATE ?auto_6183 ) ( not ( = ?auto_6192 ?auto_6189 ) ) ( not ( = ?auto_6194 ?auto_6192 ) ) ( HOIST-AT ?auto_6185 ?auto_6192 ) ( not ( = ?auto_6195 ?auto_6185 ) ) ( not ( = ?auto_6187 ?auto_6185 ) ) ( AVAILABLE ?auto_6185 ) ( SURFACE-AT ?auto_6183 ?auto_6192 ) ( ON ?auto_6183 ?auto_6190 ) ( CLEAR ?auto_6183 ) ( not ( = ?auto_6183 ?auto_6190 ) ) ( not ( = ?auto_6184 ?auto_6190 ) ) ( not ( = ?auto_6182 ?auto_6190 ) ) ( not ( = ?auto_6193 ?auto_6190 ) ) ( SURFACE-AT ?auto_6181 ?auto_6189 ) ( CLEAR ?auto_6181 ) ( IS-CRATE ?auto_6182 ) ( not ( = ?auto_6181 ?auto_6182 ) ) ( not ( = ?auto_6183 ?auto_6181 ) ) ( not ( = ?auto_6184 ?auto_6181 ) ) ( not ( = ?auto_6193 ?auto_6181 ) ) ( not ( = ?auto_6190 ?auto_6181 ) ) ( AVAILABLE ?auto_6195 ) ( TRUCK-AT ?auto_6191 ?auto_6186 ) ( not ( = ?auto_6186 ?auto_6189 ) ) ( not ( = ?auto_6194 ?auto_6186 ) ) ( not ( = ?auto_6192 ?auto_6186 ) ) ( HOIST-AT ?auto_6188 ?auto_6186 ) ( LIFTING ?auto_6188 ?auto_6182 ) ( not ( = ?auto_6195 ?auto_6188 ) ) ( not ( = ?auto_6187 ?auto_6188 ) ) ( not ( = ?auto_6185 ?auto_6188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6182 ?auto_6183 ?auto_6184 )
      ( MAKE-3CRATE-VERIFY ?auto_6181 ?auto_6182 ?auto_6183 ?auto_6184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6196 - SURFACE
      ?auto_6197 - SURFACE
    )
    :vars
    (
      ?auto_6209 - HOIST
      ?auto_6202 - PLACE
      ?auto_6210 - SURFACE
      ?auto_6208 - PLACE
      ?auto_6200 - HOIST
      ?auto_6207 - SURFACE
      ?auto_6206 - PLACE
      ?auto_6198 - HOIST
      ?auto_6203 - SURFACE
      ?auto_6204 - SURFACE
      ?auto_6205 - TRUCK
      ?auto_6199 - PLACE
      ?auto_6201 - HOIST
      ?auto_6211 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6209 ?auto_6202 ) ( IS-CRATE ?auto_6197 ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6210 ?auto_6196 ) ) ( not ( = ?auto_6210 ?auto_6197 ) ) ( not ( = ?auto_6208 ?auto_6202 ) ) ( HOIST-AT ?auto_6200 ?auto_6208 ) ( not ( = ?auto_6209 ?auto_6200 ) ) ( AVAILABLE ?auto_6200 ) ( SURFACE-AT ?auto_6197 ?auto_6208 ) ( ON ?auto_6197 ?auto_6207 ) ( CLEAR ?auto_6197 ) ( not ( = ?auto_6196 ?auto_6207 ) ) ( not ( = ?auto_6197 ?auto_6207 ) ) ( not ( = ?auto_6210 ?auto_6207 ) ) ( IS-CRATE ?auto_6196 ) ( not ( = ?auto_6206 ?auto_6202 ) ) ( not ( = ?auto_6208 ?auto_6206 ) ) ( HOIST-AT ?auto_6198 ?auto_6206 ) ( not ( = ?auto_6209 ?auto_6198 ) ) ( not ( = ?auto_6200 ?auto_6198 ) ) ( AVAILABLE ?auto_6198 ) ( SURFACE-AT ?auto_6196 ?auto_6206 ) ( ON ?auto_6196 ?auto_6203 ) ( CLEAR ?auto_6196 ) ( not ( = ?auto_6196 ?auto_6203 ) ) ( not ( = ?auto_6197 ?auto_6203 ) ) ( not ( = ?auto_6210 ?auto_6203 ) ) ( not ( = ?auto_6207 ?auto_6203 ) ) ( SURFACE-AT ?auto_6204 ?auto_6202 ) ( CLEAR ?auto_6204 ) ( IS-CRATE ?auto_6210 ) ( not ( = ?auto_6204 ?auto_6210 ) ) ( not ( = ?auto_6196 ?auto_6204 ) ) ( not ( = ?auto_6197 ?auto_6204 ) ) ( not ( = ?auto_6207 ?auto_6204 ) ) ( not ( = ?auto_6203 ?auto_6204 ) ) ( AVAILABLE ?auto_6209 ) ( TRUCK-AT ?auto_6205 ?auto_6199 ) ( not ( = ?auto_6199 ?auto_6202 ) ) ( not ( = ?auto_6208 ?auto_6199 ) ) ( not ( = ?auto_6206 ?auto_6199 ) ) ( HOIST-AT ?auto_6201 ?auto_6199 ) ( not ( = ?auto_6209 ?auto_6201 ) ) ( not ( = ?auto_6200 ?auto_6201 ) ) ( not ( = ?auto_6198 ?auto_6201 ) ) ( AVAILABLE ?auto_6201 ) ( SURFACE-AT ?auto_6210 ?auto_6199 ) ( ON ?auto_6210 ?auto_6211 ) ( CLEAR ?auto_6210 ) ( not ( = ?auto_6196 ?auto_6211 ) ) ( not ( = ?auto_6197 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6207 ?auto_6211 ) ) ( not ( = ?auto_6203 ?auto_6211 ) ) ( not ( = ?auto_6204 ?auto_6211 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6201 ?auto_6210 ?auto_6211 ?auto_6199 )
      ( MAKE-2CRATE ?auto_6210 ?auto_6196 ?auto_6197 )
      ( MAKE-1CRATE-VERIFY ?auto_6196 ?auto_6197 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6212 - SURFACE
      ?auto_6213 - SURFACE
      ?auto_6214 - SURFACE
    )
    :vars
    (
      ?auto_6216 - HOIST
      ?auto_6218 - PLACE
      ?auto_6219 - PLACE
      ?auto_6217 - HOIST
      ?auto_6224 - SURFACE
      ?auto_6227 - PLACE
      ?auto_6220 - HOIST
      ?auto_6215 - SURFACE
      ?auto_6223 - SURFACE
      ?auto_6221 - TRUCK
      ?auto_6226 - PLACE
      ?auto_6222 - HOIST
      ?auto_6225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6216 ?auto_6218 ) ( IS-CRATE ?auto_6214 ) ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( not ( = ?auto_6212 ?auto_6214 ) ) ( not ( = ?auto_6219 ?auto_6218 ) ) ( HOIST-AT ?auto_6217 ?auto_6219 ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( AVAILABLE ?auto_6217 ) ( SURFACE-AT ?auto_6214 ?auto_6219 ) ( ON ?auto_6214 ?auto_6224 ) ( CLEAR ?auto_6214 ) ( not ( = ?auto_6213 ?auto_6224 ) ) ( not ( = ?auto_6214 ?auto_6224 ) ) ( not ( = ?auto_6212 ?auto_6224 ) ) ( IS-CRATE ?auto_6213 ) ( not ( = ?auto_6227 ?auto_6218 ) ) ( not ( = ?auto_6219 ?auto_6227 ) ) ( HOIST-AT ?auto_6220 ?auto_6227 ) ( not ( = ?auto_6216 ?auto_6220 ) ) ( not ( = ?auto_6217 ?auto_6220 ) ) ( AVAILABLE ?auto_6220 ) ( SURFACE-AT ?auto_6213 ?auto_6227 ) ( ON ?auto_6213 ?auto_6215 ) ( CLEAR ?auto_6213 ) ( not ( = ?auto_6213 ?auto_6215 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) ( not ( = ?auto_6212 ?auto_6215 ) ) ( not ( = ?auto_6224 ?auto_6215 ) ) ( SURFACE-AT ?auto_6223 ?auto_6218 ) ( CLEAR ?auto_6223 ) ( IS-CRATE ?auto_6212 ) ( not ( = ?auto_6223 ?auto_6212 ) ) ( not ( = ?auto_6213 ?auto_6223 ) ) ( not ( = ?auto_6214 ?auto_6223 ) ) ( not ( = ?auto_6224 ?auto_6223 ) ) ( not ( = ?auto_6215 ?auto_6223 ) ) ( AVAILABLE ?auto_6216 ) ( TRUCK-AT ?auto_6221 ?auto_6226 ) ( not ( = ?auto_6226 ?auto_6218 ) ) ( not ( = ?auto_6219 ?auto_6226 ) ) ( not ( = ?auto_6227 ?auto_6226 ) ) ( HOIST-AT ?auto_6222 ?auto_6226 ) ( not ( = ?auto_6216 ?auto_6222 ) ) ( not ( = ?auto_6217 ?auto_6222 ) ) ( not ( = ?auto_6220 ?auto_6222 ) ) ( AVAILABLE ?auto_6222 ) ( SURFACE-AT ?auto_6212 ?auto_6226 ) ( ON ?auto_6212 ?auto_6225 ) ( CLEAR ?auto_6212 ) ( not ( = ?auto_6213 ?auto_6225 ) ) ( not ( = ?auto_6214 ?auto_6225 ) ) ( not ( = ?auto_6212 ?auto_6225 ) ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( not ( = ?auto_6215 ?auto_6225 ) ) ( not ( = ?auto_6223 ?auto_6225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6213 ?auto_6214 )
      ( MAKE-2CRATE-VERIFY ?auto_6212 ?auto_6213 ?auto_6214 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6228 - SURFACE
      ?auto_6229 - SURFACE
      ?auto_6230 - SURFACE
      ?auto_6231 - SURFACE
    )
    :vars
    (
      ?auto_6239 - HOIST
      ?auto_6241 - PLACE
      ?auto_6238 - PLACE
      ?auto_6233 - HOIST
      ?auto_6237 - SURFACE
      ?auto_6234 - PLACE
      ?auto_6242 - HOIST
      ?auto_6240 - SURFACE
      ?auto_6243 - TRUCK
      ?auto_6232 - PLACE
      ?auto_6235 - HOIST
      ?auto_6236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6239 ?auto_6241 ) ( IS-CRATE ?auto_6231 ) ( not ( = ?auto_6230 ?auto_6231 ) ) ( not ( = ?auto_6229 ?auto_6230 ) ) ( not ( = ?auto_6229 ?auto_6231 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( HOIST-AT ?auto_6233 ?auto_6238 ) ( not ( = ?auto_6239 ?auto_6233 ) ) ( AVAILABLE ?auto_6233 ) ( SURFACE-AT ?auto_6231 ?auto_6238 ) ( ON ?auto_6231 ?auto_6237 ) ( CLEAR ?auto_6231 ) ( not ( = ?auto_6230 ?auto_6237 ) ) ( not ( = ?auto_6231 ?auto_6237 ) ) ( not ( = ?auto_6229 ?auto_6237 ) ) ( IS-CRATE ?auto_6230 ) ( not ( = ?auto_6234 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6234 ) ) ( HOIST-AT ?auto_6242 ?auto_6234 ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6233 ?auto_6242 ) ) ( AVAILABLE ?auto_6242 ) ( SURFACE-AT ?auto_6230 ?auto_6234 ) ( ON ?auto_6230 ?auto_6240 ) ( CLEAR ?auto_6230 ) ( not ( = ?auto_6230 ?auto_6240 ) ) ( not ( = ?auto_6231 ?auto_6240 ) ) ( not ( = ?auto_6229 ?auto_6240 ) ) ( not ( = ?auto_6237 ?auto_6240 ) ) ( SURFACE-AT ?auto_6228 ?auto_6241 ) ( CLEAR ?auto_6228 ) ( IS-CRATE ?auto_6229 ) ( not ( = ?auto_6228 ?auto_6229 ) ) ( not ( = ?auto_6230 ?auto_6228 ) ) ( not ( = ?auto_6231 ?auto_6228 ) ) ( not ( = ?auto_6237 ?auto_6228 ) ) ( not ( = ?auto_6240 ?auto_6228 ) ) ( AVAILABLE ?auto_6239 ) ( TRUCK-AT ?auto_6243 ?auto_6232 ) ( not ( = ?auto_6232 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6232 ) ) ( not ( = ?auto_6234 ?auto_6232 ) ) ( HOIST-AT ?auto_6235 ?auto_6232 ) ( not ( = ?auto_6239 ?auto_6235 ) ) ( not ( = ?auto_6233 ?auto_6235 ) ) ( not ( = ?auto_6242 ?auto_6235 ) ) ( AVAILABLE ?auto_6235 ) ( SURFACE-AT ?auto_6229 ?auto_6232 ) ( ON ?auto_6229 ?auto_6236 ) ( CLEAR ?auto_6229 ) ( not ( = ?auto_6230 ?auto_6236 ) ) ( not ( = ?auto_6231 ?auto_6236 ) ) ( not ( = ?auto_6229 ?auto_6236 ) ) ( not ( = ?auto_6237 ?auto_6236 ) ) ( not ( = ?auto_6240 ?auto_6236 ) ) ( not ( = ?auto_6228 ?auto_6236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6229 ?auto_6230 ?auto_6231 )
      ( MAKE-3CRATE-VERIFY ?auto_6228 ?auto_6229 ?auto_6230 ?auto_6231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6244 - SURFACE
      ?auto_6245 - SURFACE
    )
    :vars
    (
      ?auto_6254 - HOIST
      ?auto_6256 - PLACE
      ?auto_6259 - SURFACE
      ?auto_6253 - PLACE
      ?auto_6248 - HOIST
      ?auto_6252 - SURFACE
      ?auto_6249 - PLACE
      ?auto_6257 - HOIST
      ?auto_6255 - SURFACE
      ?auto_6246 - SURFACE
      ?auto_6247 - PLACE
      ?auto_6250 - HOIST
      ?auto_6251 - SURFACE
      ?auto_6258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6254 ?auto_6256 ) ( IS-CRATE ?auto_6245 ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( not ( = ?auto_6259 ?auto_6244 ) ) ( not ( = ?auto_6259 ?auto_6245 ) ) ( not ( = ?auto_6253 ?auto_6256 ) ) ( HOIST-AT ?auto_6248 ?auto_6253 ) ( not ( = ?auto_6254 ?auto_6248 ) ) ( AVAILABLE ?auto_6248 ) ( SURFACE-AT ?auto_6245 ?auto_6253 ) ( ON ?auto_6245 ?auto_6252 ) ( CLEAR ?auto_6245 ) ( not ( = ?auto_6244 ?auto_6252 ) ) ( not ( = ?auto_6245 ?auto_6252 ) ) ( not ( = ?auto_6259 ?auto_6252 ) ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6249 ?auto_6256 ) ) ( not ( = ?auto_6253 ?auto_6249 ) ) ( HOIST-AT ?auto_6257 ?auto_6249 ) ( not ( = ?auto_6254 ?auto_6257 ) ) ( not ( = ?auto_6248 ?auto_6257 ) ) ( AVAILABLE ?auto_6257 ) ( SURFACE-AT ?auto_6244 ?auto_6249 ) ( ON ?auto_6244 ?auto_6255 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6244 ?auto_6255 ) ) ( not ( = ?auto_6245 ?auto_6255 ) ) ( not ( = ?auto_6259 ?auto_6255 ) ) ( not ( = ?auto_6252 ?auto_6255 ) ) ( SURFACE-AT ?auto_6246 ?auto_6256 ) ( CLEAR ?auto_6246 ) ( IS-CRATE ?auto_6259 ) ( not ( = ?auto_6246 ?auto_6259 ) ) ( not ( = ?auto_6244 ?auto_6246 ) ) ( not ( = ?auto_6245 ?auto_6246 ) ) ( not ( = ?auto_6252 ?auto_6246 ) ) ( not ( = ?auto_6255 ?auto_6246 ) ) ( AVAILABLE ?auto_6254 ) ( not ( = ?auto_6247 ?auto_6256 ) ) ( not ( = ?auto_6253 ?auto_6247 ) ) ( not ( = ?auto_6249 ?auto_6247 ) ) ( HOIST-AT ?auto_6250 ?auto_6247 ) ( not ( = ?auto_6254 ?auto_6250 ) ) ( not ( = ?auto_6248 ?auto_6250 ) ) ( not ( = ?auto_6257 ?auto_6250 ) ) ( AVAILABLE ?auto_6250 ) ( SURFACE-AT ?auto_6259 ?auto_6247 ) ( ON ?auto_6259 ?auto_6251 ) ( CLEAR ?auto_6259 ) ( not ( = ?auto_6244 ?auto_6251 ) ) ( not ( = ?auto_6245 ?auto_6251 ) ) ( not ( = ?auto_6259 ?auto_6251 ) ) ( not ( = ?auto_6252 ?auto_6251 ) ) ( not ( = ?auto_6255 ?auto_6251 ) ) ( not ( = ?auto_6246 ?auto_6251 ) ) ( TRUCK-AT ?auto_6258 ?auto_6256 ) )
    :subtasks
    ( ( !DRIVE ?auto_6258 ?auto_6256 ?auto_6247 )
      ( MAKE-2CRATE ?auto_6259 ?auto_6244 ?auto_6245 )
      ( MAKE-1CRATE-VERIFY ?auto_6244 ?auto_6245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6260 - SURFACE
      ?auto_6261 - SURFACE
      ?auto_6262 - SURFACE
    )
    :vars
    (
      ?auto_6268 - HOIST
      ?auto_6272 - PLACE
      ?auto_6266 - PLACE
      ?auto_6267 - HOIST
      ?auto_6263 - SURFACE
      ?auto_6265 - PLACE
      ?auto_6273 - HOIST
      ?auto_6274 - SURFACE
      ?auto_6271 - SURFACE
      ?auto_6269 - PLACE
      ?auto_6264 - HOIST
      ?auto_6270 - SURFACE
      ?auto_6275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6268 ?auto_6272 ) ( IS-CRATE ?auto_6262 ) ( not ( = ?auto_6261 ?auto_6262 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6262 ) ) ( not ( = ?auto_6266 ?auto_6272 ) ) ( HOIST-AT ?auto_6267 ?auto_6266 ) ( not ( = ?auto_6268 ?auto_6267 ) ) ( AVAILABLE ?auto_6267 ) ( SURFACE-AT ?auto_6262 ?auto_6266 ) ( ON ?auto_6262 ?auto_6263 ) ( CLEAR ?auto_6262 ) ( not ( = ?auto_6261 ?auto_6263 ) ) ( not ( = ?auto_6262 ?auto_6263 ) ) ( not ( = ?auto_6260 ?auto_6263 ) ) ( IS-CRATE ?auto_6261 ) ( not ( = ?auto_6265 ?auto_6272 ) ) ( not ( = ?auto_6266 ?auto_6265 ) ) ( HOIST-AT ?auto_6273 ?auto_6265 ) ( not ( = ?auto_6268 ?auto_6273 ) ) ( not ( = ?auto_6267 ?auto_6273 ) ) ( AVAILABLE ?auto_6273 ) ( SURFACE-AT ?auto_6261 ?auto_6265 ) ( ON ?auto_6261 ?auto_6274 ) ( CLEAR ?auto_6261 ) ( not ( = ?auto_6261 ?auto_6274 ) ) ( not ( = ?auto_6262 ?auto_6274 ) ) ( not ( = ?auto_6260 ?auto_6274 ) ) ( not ( = ?auto_6263 ?auto_6274 ) ) ( SURFACE-AT ?auto_6271 ?auto_6272 ) ( CLEAR ?auto_6271 ) ( IS-CRATE ?auto_6260 ) ( not ( = ?auto_6271 ?auto_6260 ) ) ( not ( = ?auto_6261 ?auto_6271 ) ) ( not ( = ?auto_6262 ?auto_6271 ) ) ( not ( = ?auto_6263 ?auto_6271 ) ) ( not ( = ?auto_6274 ?auto_6271 ) ) ( AVAILABLE ?auto_6268 ) ( not ( = ?auto_6269 ?auto_6272 ) ) ( not ( = ?auto_6266 ?auto_6269 ) ) ( not ( = ?auto_6265 ?auto_6269 ) ) ( HOIST-AT ?auto_6264 ?auto_6269 ) ( not ( = ?auto_6268 ?auto_6264 ) ) ( not ( = ?auto_6267 ?auto_6264 ) ) ( not ( = ?auto_6273 ?auto_6264 ) ) ( AVAILABLE ?auto_6264 ) ( SURFACE-AT ?auto_6260 ?auto_6269 ) ( ON ?auto_6260 ?auto_6270 ) ( CLEAR ?auto_6260 ) ( not ( = ?auto_6261 ?auto_6270 ) ) ( not ( = ?auto_6262 ?auto_6270 ) ) ( not ( = ?auto_6260 ?auto_6270 ) ) ( not ( = ?auto_6263 ?auto_6270 ) ) ( not ( = ?auto_6274 ?auto_6270 ) ) ( not ( = ?auto_6271 ?auto_6270 ) ) ( TRUCK-AT ?auto_6275 ?auto_6272 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6261 ?auto_6262 )
      ( MAKE-2CRATE-VERIFY ?auto_6260 ?auto_6261 ?auto_6262 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6276 - SURFACE
      ?auto_6277 - SURFACE
      ?auto_6278 - SURFACE
      ?auto_6279 - SURFACE
    )
    :vars
    (
      ?auto_6281 - HOIST
      ?auto_6282 - PLACE
      ?auto_6286 - PLACE
      ?auto_6291 - HOIST
      ?auto_6287 - SURFACE
      ?auto_6284 - PLACE
      ?auto_6285 - HOIST
      ?auto_6280 - SURFACE
      ?auto_6288 - PLACE
      ?auto_6289 - HOIST
      ?auto_6290 - SURFACE
      ?auto_6283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6281 ?auto_6282 ) ( IS-CRATE ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( not ( = ?auto_6277 ?auto_6278 ) ) ( not ( = ?auto_6277 ?auto_6279 ) ) ( not ( = ?auto_6286 ?auto_6282 ) ) ( HOIST-AT ?auto_6291 ?auto_6286 ) ( not ( = ?auto_6281 ?auto_6291 ) ) ( AVAILABLE ?auto_6291 ) ( SURFACE-AT ?auto_6279 ?auto_6286 ) ( ON ?auto_6279 ?auto_6287 ) ( CLEAR ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6287 ) ) ( not ( = ?auto_6279 ?auto_6287 ) ) ( not ( = ?auto_6277 ?auto_6287 ) ) ( IS-CRATE ?auto_6278 ) ( not ( = ?auto_6284 ?auto_6282 ) ) ( not ( = ?auto_6286 ?auto_6284 ) ) ( HOIST-AT ?auto_6285 ?auto_6284 ) ( not ( = ?auto_6281 ?auto_6285 ) ) ( not ( = ?auto_6291 ?auto_6285 ) ) ( AVAILABLE ?auto_6285 ) ( SURFACE-AT ?auto_6278 ?auto_6284 ) ( ON ?auto_6278 ?auto_6280 ) ( CLEAR ?auto_6278 ) ( not ( = ?auto_6278 ?auto_6280 ) ) ( not ( = ?auto_6279 ?auto_6280 ) ) ( not ( = ?auto_6277 ?auto_6280 ) ) ( not ( = ?auto_6287 ?auto_6280 ) ) ( SURFACE-AT ?auto_6276 ?auto_6282 ) ( CLEAR ?auto_6276 ) ( IS-CRATE ?auto_6277 ) ( not ( = ?auto_6276 ?auto_6277 ) ) ( not ( = ?auto_6278 ?auto_6276 ) ) ( not ( = ?auto_6279 ?auto_6276 ) ) ( not ( = ?auto_6287 ?auto_6276 ) ) ( not ( = ?auto_6280 ?auto_6276 ) ) ( AVAILABLE ?auto_6281 ) ( not ( = ?auto_6288 ?auto_6282 ) ) ( not ( = ?auto_6286 ?auto_6288 ) ) ( not ( = ?auto_6284 ?auto_6288 ) ) ( HOIST-AT ?auto_6289 ?auto_6288 ) ( not ( = ?auto_6281 ?auto_6289 ) ) ( not ( = ?auto_6291 ?auto_6289 ) ) ( not ( = ?auto_6285 ?auto_6289 ) ) ( AVAILABLE ?auto_6289 ) ( SURFACE-AT ?auto_6277 ?auto_6288 ) ( ON ?auto_6277 ?auto_6290 ) ( CLEAR ?auto_6277 ) ( not ( = ?auto_6278 ?auto_6290 ) ) ( not ( = ?auto_6279 ?auto_6290 ) ) ( not ( = ?auto_6277 ?auto_6290 ) ) ( not ( = ?auto_6287 ?auto_6290 ) ) ( not ( = ?auto_6280 ?auto_6290 ) ) ( not ( = ?auto_6276 ?auto_6290 ) ) ( TRUCK-AT ?auto_6283 ?auto_6282 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6277 ?auto_6278 ?auto_6279 )
      ( MAKE-3CRATE-VERIFY ?auto_6276 ?auto_6277 ?auto_6278 ?auto_6279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6306 - SURFACE
      ?auto_6307 - SURFACE
    )
    :vars
    (
      ?auto_6308 - HOIST
      ?auto_6309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6308 ?auto_6309 ) ( SURFACE-AT ?auto_6306 ?auto_6309 ) ( CLEAR ?auto_6306 ) ( LIFTING ?auto_6308 ?auto_6307 ) ( IS-CRATE ?auto_6307 ) ( not ( = ?auto_6306 ?auto_6307 ) ) )
    :subtasks
    ( ( !DROP ?auto_6308 ?auto_6307 ?auto_6306 ?auto_6309 )
      ( MAKE-1CRATE-VERIFY ?auto_6306 ?auto_6307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6310 - SURFACE
      ?auto_6311 - SURFACE
      ?auto_6312 - SURFACE
    )
    :vars
    (
      ?auto_6314 - HOIST
      ?auto_6313 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6314 ?auto_6313 ) ( SURFACE-AT ?auto_6311 ?auto_6313 ) ( CLEAR ?auto_6311 ) ( LIFTING ?auto_6314 ?auto_6312 ) ( IS-CRATE ?auto_6312 ) ( not ( = ?auto_6311 ?auto_6312 ) ) ( ON ?auto_6311 ?auto_6310 ) ( not ( = ?auto_6310 ?auto_6311 ) ) ( not ( = ?auto_6310 ?auto_6312 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6311 ?auto_6312 )
      ( MAKE-2CRATE-VERIFY ?auto_6310 ?auto_6311 ?auto_6312 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6315 - SURFACE
      ?auto_6316 - SURFACE
      ?auto_6317 - SURFACE
      ?auto_6318 - SURFACE
    )
    :vars
    (
      ?auto_6320 - HOIST
      ?auto_6319 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6320 ?auto_6319 ) ( SURFACE-AT ?auto_6317 ?auto_6319 ) ( CLEAR ?auto_6317 ) ( LIFTING ?auto_6320 ?auto_6318 ) ( IS-CRATE ?auto_6318 ) ( not ( = ?auto_6317 ?auto_6318 ) ) ( ON ?auto_6316 ?auto_6315 ) ( ON ?auto_6317 ?auto_6316 ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6317 ) ) ( not ( = ?auto_6315 ?auto_6318 ) ) ( not ( = ?auto_6316 ?auto_6317 ) ) ( not ( = ?auto_6316 ?auto_6318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6317 ?auto_6318 )
      ( MAKE-3CRATE-VERIFY ?auto_6315 ?auto_6316 ?auto_6317 ?auto_6318 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6321 - SURFACE
      ?auto_6322 - SURFACE
      ?auto_6323 - SURFACE
      ?auto_6324 - SURFACE
      ?auto_6325 - SURFACE
    )
    :vars
    (
      ?auto_6327 - HOIST
      ?auto_6326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6327 ?auto_6326 ) ( SURFACE-AT ?auto_6324 ?auto_6326 ) ( CLEAR ?auto_6324 ) ( LIFTING ?auto_6327 ?auto_6325 ) ( IS-CRATE ?auto_6325 ) ( not ( = ?auto_6324 ?auto_6325 ) ) ( ON ?auto_6322 ?auto_6321 ) ( ON ?auto_6323 ?auto_6322 ) ( ON ?auto_6324 ?auto_6323 ) ( not ( = ?auto_6321 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6323 ) ) ( not ( = ?auto_6321 ?auto_6324 ) ) ( not ( = ?auto_6321 ?auto_6325 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6322 ?auto_6325 ) ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6324 ?auto_6325 )
      ( MAKE-4CRATE-VERIFY ?auto_6321 ?auto_6322 ?auto_6323 ?auto_6324 ?auto_6325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6328 - SURFACE
      ?auto_6329 - SURFACE
    )
    :vars
    (
      ?auto_6331 - HOIST
      ?auto_6330 - PLACE
      ?auto_6332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6331 ?auto_6330 ) ( SURFACE-AT ?auto_6328 ?auto_6330 ) ( CLEAR ?auto_6328 ) ( IS-CRATE ?auto_6329 ) ( not ( = ?auto_6328 ?auto_6329 ) ) ( TRUCK-AT ?auto_6332 ?auto_6330 ) ( AVAILABLE ?auto_6331 ) ( IN ?auto_6329 ?auto_6332 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6331 ?auto_6329 ?auto_6332 ?auto_6330 )
      ( MAKE-1CRATE ?auto_6328 ?auto_6329 )
      ( MAKE-1CRATE-VERIFY ?auto_6328 ?auto_6329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6333 - SURFACE
      ?auto_6334 - SURFACE
      ?auto_6335 - SURFACE
    )
    :vars
    (
      ?auto_6337 - HOIST
      ?auto_6338 - PLACE
      ?auto_6336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6337 ?auto_6338 ) ( SURFACE-AT ?auto_6334 ?auto_6338 ) ( CLEAR ?auto_6334 ) ( IS-CRATE ?auto_6335 ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( TRUCK-AT ?auto_6336 ?auto_6338 ) ( AVAILABLE ?auto_6337 ) ( IN ?auto_6335 ?auto_6336 ) ( ON ?auto_6334 ?auto_6333 ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6334 ?auto_6335 )
      ( MAKE-2CRATE-VERIFY ?auto_6333 ?auto_6334 ?auto_6335 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6339 - SURFACE
      ?auto_6340 - SURFACE
      ?auto_6341 - SURFACE
      ?auto_6342 - SURFACE
    )
    :vars
    (
      ?auto_6345 - HOIST
      ?auto_6343 - PLACE
      ?auto_6344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6345 ?auto_6343 ) ( SURFACE-AT ?auto_6341 ?auto_6343 ) ( CLEAR ?auto_6341 ) ( IS-CRATE ?auto_6342 ) ( not ( = ?auto_6341 ?auto_6342 ) ) ( TRUCK-AT ?auto_6344 ?auto_6343 ) ( AVAILABLE ?auto_6345 ) ( IN ?auto_6342 ?auto_6344 ) ( ON ?auto_6341 ?auto_6340 ) ( not ( = ?auto_6340 ?auto_6341 ) ) ( not ( = ?auto_6340 ?auto_6342 ) ) ( ON ?auto_6340 ?auto_6339 ) ( not ( = ?auto_6339 ?auto_6340 ) ) ( not ( = ?auto_6339 ?auto_6341 ) ) ( not ( = ?auto_6339 ?auto_6342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6340 ?auto_6341 ?auto_6342 )
      ( MAKE-3CRATE-VERIFY ?auto_6339 ?auto_6340 ?auto_6341 ?auto_6342 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6346 - SURFACE
      ?auto_6347 - SURFACE
      ?auto_6348 - SURFACE
      ?auto_6349 - SURFACE
      ?auto_6350 - SURFACE
    )
    :vars
    (
      ?auto_6353 - HOIST
      ?auto_6351 - PLACE
      ?auto_6352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6353 ?auto_6351 ) ( SURFACE-AT ?auto_6349 ?auto_6351 ) ( CLEAR ?auto_6349 ) ( IS-CRATE ?auto_6350 ) ( not ( = ?auto_6349 ?auto_6350 ) ) ( TRUCK-AT ?auto_6352 ?auto_6351 ) ( AVAILABLE ?auto_6353 ) ( IN ?auto_6350 ?auto_6352 ) ( ON ?auto_6349 ?auto_6348 ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( ON ?auto_6347 ?auto_6346 ) ( ON ?auto_6348 ?auto_6347 ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6349 ) ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6348 ?auto_6349 ?auto_6350 )
      ( MAKE-4CRATE-VERIFY ?auto_6346 ?auto_6347 ?auto_6348 ?auto_6349 ?auto_6350 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6354 - SURFACE
      ?auto_6355 - SURFACE
    )
    :vars
    (
      ?auto_6358 - HOIST
      ?auto_6356 - PLACE
      ?auto_6357 - TRUCK
      ?auto_6359 - SURFACE
      ?auto_6360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6358 ?auto_6356 ) ( SURFACE-AT ?auto_6354 ?auto_6356 ) ( CLEAR ?auto_6354 ) ( IS-CRATE ?auto_6355 ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( AVAILABLE ?auto_6358 ) ( IN ?auto_6355 ?auto_6357 ) ( ON ?auto_6354 ?auto_6359 ) ( not ( = ?auto_6359 ?auto_6354 ) ) ( not ( = ?auto_6359 ?auto_6355 ) ) ( TRUCK-AT ?auto_6357 ?auto_6360 ) ( not ( = ?auto_6360 ?auto_6356 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6357 ?auto_6360 ?auto_6356 )
      ( MAKE-2CRATE ?auto_6359 ?auto_6354 ?auto_6355 )
      ( MAKE-1CRATE-VERIFY ?auto_6354 ?auto_6355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6361 - SURFACE
      ?auto_6362 - SURFACE
      ?auto_6363 - SURFACE
    )
    :vars
    (
      ?auto_6365 - HOIST
      ?auto_6367 - PLACE
      ?auto_6364 - TRUCK
      ?auto_6366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6365 ?auto_6367 ) ( SURFACE-AT ?auto_6362 ?auto_6367 ) ( CLEAR ?auto_6362 ) ( IS-CRATE ?auto_6363 ) ( not ( = ?auto_6362 ?auto_6363 ) ) ( AVAILABLE ?auto_6365 ) ( IN ?auto_6363 ?auto_6364 ) ( ON ?auto_6362 ?auto_6361 ) ( not ( = ?auto_6361 ?auto_6362 ) ) ( not ( = ?auto_6361 ?auto_6363 ) ) ( TRUCK-AT ?auto_6364 ?auto_6366 ) ( not ( = ?auto_6366 ?auto_6367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6362 ?auto_6363 )
      ( MAKE-2CRATE-VERIFY ?auto_6361 ?auto_6362 ?auto_6363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6368 - SURFACE
      ?auto_6369 - SURFACE
      ?auto_6370 - SURFACE
      ?auto_6371 - SURFACE
    )
    :vars
    (
      ?auto_6373 - HOIST
      ?auto_6372 - PLACE
      ?auto_6375 - TRUCK
      ?auto_6374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6373 ?auto_6372 ) ( SURFACE-AT ?auto_6370 ?auto_6372 ) ( CLEAR ?auto_6370 ) ( IS-CRATE ?auto_6371 ) ( not ( = ?auto_6370 ?auto_6371 ) ) ( AVAILABLE ?auto_6373 ) ( IN ?auto_6371 ?auto_6375 ) ( ON ?auto_6370 ?auto_6369 ) ( not ( = ?auto_6369 ?auto_6370 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( TRUCK-AT ?auto_6375 ?auto_6374 ) ( not ( = ?auto_6374 ?auto_6372 ) ) ( ON ?auto_6369 ?auto_6368 ) ( not ( = ?auto_6368 ?auto_6369 ) ) ( not ( = ?auto_6368 ?auto_6370 ) ) ( not ( = ?auto_6368 ?auto_6371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6369 ?auto_6370 ?auto_6371 )
      ( MAKE-3CRATE-VERIFY ?auto_6368 ?auto_6369 ?auto_6370 ?auto_6371 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6376 - SURFACE
      ?auto_6377 - SURFACE
      ?auto_6378 - SURFACE
      ?auto_6379 - SURFACE
      ?auto_6380 - SURFACE
    )
    :vars
    (
      ?auto_6382 - HOIST
      ?auto_6381 - PLACE
      ?auto_6384 - TRUCK
      ?auto_6383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6382 ?auto_6381 ) ( SURFACE-AT ?auto_6379 ?auto_6381 ) ( CLEAR ?auto_6379 ) ( IS-CRATE ?auto_6380 ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( AVAILABLE ?auto_6382 ) ( IN ?auto_6380 ?auto_6384 ) ( ON ?auto_6379 ?auto_6378 ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( TRUCK-AT ?auto_6384 ?auto_6383 ) ( not ( = ?auto_6383 ?auto_6381 ) ) ( ON ?auto_6377 ?auto_6376 ) ( ON ?auto_6378 ?auto_6377 ) ( not ( = ?auto_6376 ?auto_6377 ) ) ( not ( = ?auto_6376 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6379 ) ) ( not ( = ?auto_6376 ?auto_6380 ) ) ( not ( = ?auto_6377 ?auto_6378 ) ) ( not ( = ?auto_6377 ?auto_6379 ) ) ( not ( = ?auto_6377 ?auto_6380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6378 ?auto_6379 ?auto_6380 )
      ( MAKE-4CRATE-VERIFY ?auto_6376 ?auto_6377 ?auto_6378 ?auto_6379 ?auto_6380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6385 - SURFACE
      ?auto_6386 - SURFACE
    )
    :vars
    (
      ?auto_6388 - HOIST
      ?auto_6387 - PLACE
      ?auto_6391 - SURFACE
      ?auto_6390 - TRUCK
      ?auto_6389 - PLACE
      ?auto_6392 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6388 ?auto_6387 ) ( SURFACE-AT ?auto_6385 ?auto_6387 ) ( CLEAR ?auto_6385 ) ( IS-CRATE ?auto_6386 ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( AVAILABLE ?auto_6388 ) ( ON ?auto_6385 ?auto_6391 ) ( not ( = ?auto_6391 ?auto_6385 ) ) ( not ( = ?auto_6391 ?auto_6386 ) ) ( TRUCK-AT ?auto_6390 ?auto_6389 ) ( not ( = ?auto_6389 ?auto_6387 ) ) ( HOIST-AT ?auto_6392 ?auto_6389 ) ( LIFTING ?auto_6392 ?auto_6386 ) ( not ( = ?auto_6388 ?auto_6392 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6392 ?auto_6386 ?auto_6390 ?auto_6389 )
      ( MAKE-2CRATE ?auto_6391 ?auto_6385 ?auto_6386 )
      ( MAKE-1CRATE-VERIFY ?auto_6385 ?auto_6386 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6393 - SURFACE
      ?auto_6394 - SURFACE
      ?auto_6395 - SURFACE
    )
    :vars
    (
      ?auto_6400 - HOIST
      ?auto_6396 - PLACE
      ?auto_6397 - TRUCK
      ?auto_6398 - PLACE
      ?auto_6399 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6400 ?auto_6396 ) ( SURFACE-AT ?auto_6394 ?auto_6396 ) ( CLEAR ?auto_6394 ) ( IS-CRATE ?auto_6395 ) ( not ( = ?auto_6394 ?auto_6395 ) ) ( AVAILABLE ?auto_6400 ) ( ON ?auto_6394 ?auto_6393 ) ( not ( = ?auto_6393 ?auto_6394 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( TRUCK-AT ?auto_6397 ?auto_6398 ) ( not ( = ?auto_6398 ?auto_6396 ) ) ( HOIST-AT ?auto_6399 ?auto_6398 ) ( LIFTING ?auto_6399 ?auto_6395 ) ( not ( = ?auto_6400 ?auto_6399 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6394 ?auto_6395 )
      ( MAKE-2CRATE-VERIFY ?auto_6393 ?auto_6394 ?auto_6395 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6401 - SURFACE
      ?auto_6402 - SURFACE
      ?auto_6403 - SURFACE
      ?auto_6404 - SURFACE
    )
    :vars
    (
      ?auto_6406 - HOIST
      ?auto_6405 - PLACE
      ?auto_6409 - TRUCK
      ?auto_6407 - PLACE
      ?auto_6408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6406 ?auto_6405 ) ( SURFACE-AT ?auto_6403 ?auto_6405 ) ( CLEAR ?auto_6403 ) ( IS-CRATE ?auto_6404 ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( AVAILABLE ?auto_6406 ) ( ON ?auto_6403 ?auto_6402 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6404 ) ) ( TRUCK-AT ?auto_6409 ?auto_6407 ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( HOIST-AT ?auto_6408 ?auto_6407 ) ( LIFTING ?auto_6408 ?auto_6404 ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( ON ?auto_6402 ?auto_6401 ) ( not ( = ?auto_6401 ?auto_6402 ) ) ( not ( = ?auto_6401 ?auto_6403 ) ) ( not ( = ?auto_6401 ?auto_6404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6402 ?auto_6403 ?auto_6404 )
      ( MAKE-3CRATE-VERIFY ?auto_6401 ?auto_6402 ?auto_6403 ?auto_6404 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6410 - SURFACE
      ?auto_6411 - SURFACE
      ?auto_6412 - SURFACE
      ?auto_6413 - SURFACE
      ?auto_6414 - SURFACE
    )
    :vars
    (
      ?auto_6416 - HOIST
      ?auto_6415 - PLACE
      ?auto_6419 - TRUCK
      ?auto_6417 - PLACE
      ?auto_6418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6416 ?auto_6415 ) ( SURFACE-AT ?auto_6413 ?auto_6415 ) ( CLEAR ?auto_6413 ) ( IS-CRATE ?auto_6414 ) ( not ( = ?auto_6413 ?auto_6414 ) ) ( AVAILABLE ?auto_6416 ) ( ON ?auto_6413 ?auto_6412 ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6414 ) ) ( TRUCK-AT ?auto_6419 ?auto_6417 ) ( not ( = ?auto_6417 ?auto_6415 ) ) ( HOIST-AT ?auto_6418 ?auto_6417 ) ( LIFTING ?auto_6418 ?auto_6414 ) ( not ( = ?auto_6416 ?auto_6418 ) ) ( ON ?auto_6411 ?auto_6410 ) ( ON ?auto_6412 ?auto_6411 ) ( not ( = ?auto_6410 ?auto_6411 ) ) ( not ( = ?auto_6410 ?auto_6412 ) ) ( not ( = ?auto_6410 ?auto_6413 ) ) ( not ( = ?auto_6410 ?auto_6414 ) ) ( not ( = ?auto_6411 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6413 ) ) ( not ( = ?auto_6411 ?auto_6414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6412 ?auto_6413 ?auto_6414 )
      ( MAKE-4CRATE-VERIFY ?auto_6410 ?auto_6411 ?auto_6412 ?auto_6413 ?auto_6414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6420 - SURFACE
      ?auto_6421 - SURFACE
    )
    :vars
    (
      ?auto_6423 - HOIST
      ?auto_6422 - PLACE
      ?auto_6427 - SURFACE
      ?auto_6426 - TRUCK
      ?auto_6424 - PLACE
      ?auto_6425 - HOIST
      ?auto_6428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6423 ?auto_6422 ) ( SURFACE-AT ?auto_6420 ?auto_6422 ) ( CLEAR ?auto_6420 ) ( IS-CRATE ?auto_6421 ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( AVAILABLE ?auto_6423 ) ( ON ?auto_6420 ?auto_6427 ) ( not ( = ?auto_6427 ?auto_6420 ) ) ( not ( = ?auto_6427 ?auto_6421 ) ) ( TRUCK-AT ?auto_6426 ?auto_6424 ) ( not ( = ?auto_6424 ?auto_6422 ) ) ( HOIST-AT ?auto_6425 ?auto_6424 ) ( not ( = ?auto_6423 ?auto_6425 ) ) ( AVAILABLE ?auto_6425 ) ( SURFACE-AT ?auto_6421 ?auto_6424 ) ( ON ?auto_6421 ?auto_6428 ) ( CLEAR ?auto_6421 ) ( not ( = ?auto_6420 ?auto_6428 ) ) ( not ( = ?auto_6421 ?auto_6428 ) ) ( not ( = ?auto_6427 ?auto_6428 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6425 ?auto_6421 ?auto_6428 ?auto_6424 )
      ( MAKE-2CRATE ?auto_6427 ?auto_6420 ?auto_6421 )
      ( MAKE-1CRATE-VERIFY ?auto_6420 ?auto_6421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6429 - SURFACE
      ?auto_6430 - SURFACE
      ?auto_6431 - SURFACE
    )
    :vars
    (
      ?auto_6434 - HOIST
      ?auto_6432 - PLACE
      ?auto_6436 - TRUCK
      ?auto_6437 - PLACE
      ?auto_6435 - HOIST
      ?auto_6433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6434 ?auto_6432 ) ( SURFACE-AT ?auto_6430 ?auto_6432 ) ( CLEAR ?auto_6430 ) ( IS-CRATE ?auto_6431 ) ( not ( = ?auto_6430 ?auto_6431 ) ) ( AVAILABLE ?auto_6434 ) ( ON ?auto_6430 ?auto_6429 ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6431 ) ) ( TRUCK-AT ?auto_6436 ?auto_6437 ) ( not ( = ?auto_6437 ?auto_6432 ) ) ( HOIST-AT ?auto_6435 ?auto_6437 ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( AVAILABLE ?auto_6435 ) ( SURFACE-AT ?auto_6431 ?auto_6437 ) ( ON ?auto_6431 ?auto_6433 ) ( CLEAR ?auto_6431 ) ( not ( = ?auto_6430 ?auto_6433 ) ) ( not ( = ?auto_6431 ?auto_6433 ) ) ( not ( = ?auto_6429 ?auto_6433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6430 ?auto_6431 )
      ( MAKE-2CRATE-VERIFY ?auto_6429 ?auto_6430 ?auto_6431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6438 - SURFACE
      ?auto_6439 - SURFACE
      ?auto_6440 - SURFACE
      ?auto_6441 - SURFACE
    )
    :vars
    (
      ?auto_6446 - HOIST
      ?auto_6445 - PLACE
      ?auto_6443 - TRUCK
      ?auto_6447 - PLACE
      ?auto_6444 - HOIST
      ?auto_6442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6446 ?auto_6445 ) ( SURFACE-AT ?auto_6440 ?auto_6445 ) ( CLEAR ?auto_6440 ) ( IS-CRATE ?auto_6441 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( AVAILABLE ?auto_6446 ) ( ON ?auto_6440 ?auto_6439 ) ( not ( = ?auto_6439 ?auto_6440 ) ) ( not ( = ?auto_6439 ?auto_6441 ) ) ( TRUCK-AT ?auto_6443 ?auto_6447 ) ( not ( = ?auto_6447 ?auto_6445 ) ) ( HOIST-AT ?auto_6444 ?auto_6447 ) ( not ( = ?auto_6446 ?auto_6444 ) ) ( AVAILABLE ?auto_6444 ) ( SURFACE-AT ?auto_6441 ?auto_6447 ) ( ON ?auto_6441 ?auto_6442 ) ( CLEAR ?auto_6441 ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6439 ?auto_6442 ) ) ( ON ?auto_6439 ?auto_6438 ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6440 ) ) ( not ( = ?auto_6438 ?auto_6441 ) ) ( not ( = ?auto_6438 ?auto_6442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6439 ?auto_6440 ?auto_6441 )
      ( MAKE-3CRATE-VERIFY ?auto_6438 ?auto_6439 ?auto_6440 ?auto_6441 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6448 - SURFACE
      ?auto_6449 - SURFACE
      ?auto_6450 - SURFACE
      ?auto_6451 - SURFACE
      ?auto_6452 - SURFACE
    )
    :vars
    (
      ?auto_6457 - HOIST
      ?auto_6456 - PLACE
      ?auto_6454 - TRUCK
      ?auto_6458 - PLACE
      ?auto_6455 - HOIST
      ?auto_6453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6457 ?auto_6456 ) ( SURFACE-AT ?auto_6451 ?auto_6456 ) ( CLEAR ?auto_6451 ) ( IS-CRATE ?auto_6452 ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( AVAILABLE ?auto_6457 ) ( ON ?auto_6451 ?auto_6450 ) ( not ( = ?auto_6450 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6452 ) ) ( TRUCK-AT ?auto_6454 ?auto_6458 ) ( not ( = ?auto_6458 ?auto_6456 ) ) ( HOIST-AT ?auto_6455 ?auto_6458 ) ( not ( = ?auto_6457 ?auto_6455 ) ) ( AVAILABLE ?auto_6455 ) ( SURFACE-AT ?auto_6452 ?auto_6458 ) ( ON ?auto_6452 ?auto_6453 ) ( CLEAR ?auto_6452 ) ( not ( = ?auto_6451 ?auto_6453 ) ) ( not ( = ?auto_6452 ?auto_6453 ) ) ( not ( = ?auto_6450 ?auto_6453 ) ) ( ON ?auto_6449 ?auto_6448 ) ( ON ?auto_6450 ?auto_6449 ) ( not ( = ?auto_6448 ?auto_6449 ) ) ( not ( = ?auto_6448 ?auto_6450 ) ) ( not ( = ?auto_6448 ?auto_6451 ) ) ( not ( = ?auto_6448 ?auto_6452 ) ) ( not ( = ?auto_6448 ?auto_6453 ) ) ( not ( = ?auto_6449 ?auto_6450 ) ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( not ( = ?auto_6449 ?auto_6452 ) ) ( not ( = ?auto_6449 ?auto_6453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6450 ?auto_6451 ?auto_6452 )
      ( MAKE-4CRATE-VERIFY ?auto_6448 ?auto_6449 ?auto_6450 ?auto_6451 ?auto_6452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
    )
    :vars
    (
      ?auto_6465 - HOIST
      ?auto_6464 - PLACE
      ?auto_6467 - SURFACE
      ?auto_6466 - PLACE
      ?auto_6463 - HOIST
      ?auto_6461 - SURFACE
      ?auto_6462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6465 ?auto_6464 ) ( SURFACE-AT ?auto_6459 ?auto_6464 ) ( CLEAR ?auto_6459 ) ( IS-CRATE ?auto_6460 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( AVAILABLE ?auto_6465 ) ( ON ?auto_6459 ?auto_6467 ) ( not ( = ?auto_6467 ?auto_6459 ) ) ( not ( = ?auto_6467 ?auto_6460 ) ) ( not ( = ?auto_6466 ?auto_6464 ) ) ( HOIST-AT ?auto_6463 ?auto_6466 ) ( not ( = ?auto_6465 ?auto_6463 ) ) ( AVAILABLE ?auto_6463 ) ( SURFACE-AT ?auto_6460 ?auto_6466 ) ( ON ?auto_6460 ?auto_6461 ) ( CLEAR ?auto_6460 ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6467 ?auto_6461 ) ) ( TRUCK-AT ?auto_6462 ?auto_6464 ) )
    :subtasks
    ( ( !DRIVE ?auto_6462 ?auto_6464 ?auto_6466 )
      ( MAKE-2CRATE ?auto_6467 ?auto_6459 ?auto_6460 )
      ( MAKE-1CRATE-VERIFY ?auto_6459 ?auto_6460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6468 - SURFACE
      ?auto_6469 - SURFACE
      ?auto_6470 - SURFACE
    )
    :vars
    (
      ?auto_6471 - HOIST
      ?auto_6476 - PLACE
      ?auto_6473 - PLACE
      ?auto_6472 - HOIST
      ?auto_6474 - SURFACE
      ?auto_6475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6471 ?auto_6476 ) ( SURFACE-AT ?auto_6469 ?auto_6476 ) ( CLEAR ?auto_6469 ) ( IS-CRATE ?auto_6470 ) ( not ( = ?auto_6469 ?auto_6470 ) ) ( AVAILABLE ?auto_6471 ) ( ON ?auto_6469 ?auto_6468 ) ( not ( = ?auto_6468 ?auto_6469 ) ) ( not ( = ?auto_6468 ?auto_6470 ) ) ( not ( = ?auto_6473 ?auto_6476 ) ) ( HOIST-AT ?auto_6472 ?auto_6473 ) ( not ( = ?auto_6471 ?auto_6472 ) ) ( AVAILABLE ?auto_6472 ) ( SURFACE-AT ?auto_6470 ?auto_6473 ) ( ON ?auto_6470 ?auto_6474 ) ( CLEAR ?auto_6470 ) ( not ( = ?auto_6469 ?auto_6474 ) ) ( not ( = ?auto_6470 ?auto_6474 ) ) ( not ( = ?auto_6468 ?auto_6474 ) ) ( TRUCK-AT ?auto_6475 ?auto_6476 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6469 ?auto_6470 )
      ( MAKE-2CRATE-VERIFY ?auto_6468 ?auto_6469 ?auto_6470 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6477 - SURFACE
      ?auto_6478 - SURFACE
      ?auto_6479 - SURFACE
      ?auto_6480 - SURFACE
    )
    :vars
    (
      ?auto_6483 - HOIST
      ?auto_6485 - PLACE
      ?auto_6486 - PLACE
      ?auto_6484 - HOIST
      ?auto_6482 - SURFACE
      ?auto_6481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6483 ?auto_6485 ) ( SURFACE-AT ?auto_6479 ?auto_6485 ) ( CLEAR ?auto_6479 ) ( IS-CRATE ?auto_6480 ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( AVAILABLE ?auto_6483 ) ( ON ?auto_6479 ?auto_6478 ) ( not ( = ?auto_6478 ?auto_6479 ) ) ( not ( = ?auto_6478 ?auto_6480 ) ) ( not ( = ?auto_6486 ?auto_6485 ) ) ( HOIST-AT ?auto_6484 ?auto_6486 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( AVAILABLE ?auto_6484 ) ( SURFACE-AT ?auto_6480 ?auto_6486 ) ( ON ?auto_6480 ?auto_6482 ) ( CLEAR ?auto_6480 ) ( not ( = ?auto_6479 ?auto_6482 ) ) ( not ( = ?auto_6480 ?auto_6482 ) ) ( not ( = ?auto_6478 ?auto_6482 ) ) ( TRUCK-AT ?auto_6481 ?auto_6485 ) ( ON ?auto_6478 ?auto_6477 ) ( not ( = ?auto_6477 ?auto_6478 ) ) ( not ( = ?auto_6477 ?auto_6479 ) ) ( not ( = ?auto_6477 ?auto_6480 ) ) ( not ( = ?auto_6477 ?auto_6482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6478 ?auto_6479 ?auto_6480 )
      ( MAKE-3CRATE-VERIFY ?auto_6477 ?auto_6478 ?auto_6479 ?auto_6480 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6487 - SURFACE
      ?auto_6488 - SURFACE
      ?auto_6489 - SURFACE
      ?auto_6490 - SURFACE
      ?auto_6491 - SURFACE
    )
    :vars
    (
      ?auto_6494 - HOIST
      ?auto_6496 - PLACE
      ?auto_6497 - PLACE
      ?auto_6495 - HOIST
      ?auto_6493 - SURFACE
      ?auto_6492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6494 ?auto_6496 ) ( SURFACE-AT ?auto_6490 ?auto_6496 ) ( CLEAR ?auto_6490 ) ( IS-CRATE ?auto_6491 ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( AVAILABLE ?auto_6494 ) ( ON ?auto_6490 ?auto_6489 ) ( not ( = ?auto_6489 ?auto_6490 ) ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6497 ?auto_6496 ) ) ( HOIST-AT ?auto_6495 ?auto_6497 ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( AVAILABLE ?auto_6495 ) ( SURFACE-AT ?auto_6491 ?auto_6497 ) ( ON ?auto_6491 ?auto_6493 ) ( CLEAR ?auto_6491 ) ( not ( = ?auto_6490 ?auto_6493 ) ) ( not ( = ?auto_6491 ?auto_6493 ) ) ( not ( = ?auto_6489 ?auto_6493 ) ) ( TRUCK-AT ?auto_6492 ?auto_6496 ) ( ON ?auto_6488 ?auto_6487 ) ( ON ?auto_6489 ?auto_6488 ) ( not ( = ?auto_6487 ?auto_6488 ) ) ( not ( = ?auto_6487 ?auto_6489 ) ) ( not ( = ?auto_6487 ?auto_6490 ) ) ( not ( = ?auto_6487 ?auto_6491 ) ) ( not ( = ?auto_6487 ?auto_6493 ) ) ( not ( = ?auto_6488 ?auto_6489 ) ) ( not ( = ?auto_6488 ?auto_6490 ) ) ( not ( = ?auto_6488 ?auto_6491 ) ) ( not ( = ?auto_6488 ?auto_6493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6489 ?auto_6490 ?auto_6491 )
      ( MAKE-4CRATE-VERIFY ?auto_6487 ?auto_6488 ?auto_6489 ?auto_6490 ?auto_6491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6498 - SURFACE
      ?auto_6499 - SURFACE
    )
    :vars
    (
      ?auto_6502 - HOIST
      ?auto_6504 - PLACE
      ?auto_6506 - SURFACE
      ?auto_6505 - PLACE
      ?auto_6503 - HOIST
      ?auto_6501 - SURFACE
      ?auto_6500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6502 ?auto_6504 ) ( IS-CRATE ?auto_6499 ) ( not ( = ?auto_6498 ?auto_6499 ) ) ( not ( = ?auto_6506 ?auto_6498 ) ) ( not ( = ?auto_6506 ?auto_6499 ) ) ( not ( = ?auto_6505 ?auto_6504 ) ) ( HOIST-AT ?auto_6503 ?auto_6505 ) ( not ( = ?auto_6502 ?auto_6503 ) ) ( AVAILABLE ?auto_6503 ) ( SURFACE-AT ?auto_6499 ?auto_6505 ) ( ON ?auto_6499 ?auto_6501 ) ( CLEAR ?auto_6499 ) ( not ( = ?auto_6498 ?auto_6501 ) ) ( not ( = ?auto_6499 ?auto_6501 ) ) ( not ( = ?auto_6506 ?auto_6501 ) ) ( TRUCK-AT ?auto_6500 ?auto_6504 ) ( SURFACE-AT ?auto_6506 ?auto_6504 ) ( CLEAR ?auto_6506 ) ( LIFTING ?auto_6502 ?auto_6498 ) ( IS-CRATE ?auto_6498 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6506 ?auto_6498 )
      ( MAKE-2CRATE ?auto_6506 ?auto_6498 ?auto_6499 )
      ( MAKE-1CRATE-VERIFY ?auto_6498 ?auto_6499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6507 - SURFACE
      ?auto_6508 - SURFACE
      ?auto_6509 - SURFACE
    )
    :vars
    (
      ?auto_6513 - HOIST
      ?auto_6512 - PLACE
      ?auto_6510 - PLACE
      ?auto_6511 - HOIST
      ?auto_6514 - SURFACE
      ?auto_6515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6513 ?auto_6512 ) ( IS-CRATE ?auto_6509 ) ( not ( = ?auto_6508 ?auto_6509 ) ) ( not ( = ?auto_6507 ?auto_6508 ) ) ( not ( = ?auto_6507 ?auto_6509 ) ) ( not ( = ?auto_6510 ?auto_6512 ) ) ( HOIST-AT ?auto_6511 ?auto_6510 ) ( not ( = ?auto_6513 ?auto_6511 ) ) ( AVAILABLE ?auto_6511 ) ( SURFACE-AT ?auto_6509 ?auto_6510 ) ( ON ?auto_6509 ?auto_6514 ) ( CLEAR ?auto_6509 ) ( not ( = ?auto_6508 ?auto_6514 ) ) ( not ( = ?auto_6509 ?auto_6514 ) ) ( not ( = ?auto_6507 ?auto_6514 ) ) ( TRUCK-AT ?auto_6515 ?auto_6512 ) ( SURFACE-AT ?auto_6507 ?auto_6512 ) ( CLEAR ?auto_6507 ) ( LIFTING ?auto_6513 ?auto_6508 ) ( IS-CRATE ?auto_6508 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6508 ?auto_6509 )
      ( MAKE-2CRATE-VERIFY ?auto_6507 ?auto_6508 ?auto_6509 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6516 - SURFACE
      ?auto_6517 - SURFACE
      ?auto_6518 - SURFACE
      ?auto_6519 - SURFACE
    )
    :vars
    (
      ?auto_6525 - HOIST
      ?auto_6523 - PLACE
      ?auto_6520 - PLACE
      ?auto_6522 - HOIST
      ?auto_6524 - SURFACE
      ?auto_6521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6525 ?auto_6523 ) ( IS-CRATE ?auto_6519 ) ( not ( = ?auto_6518 ?auto_6519 ) ) ( not ( = ?auto_6517 ?auto_6518 ) ) ( not ( = ?auto_6517 ?auto_6519 ) ) ( not ( = ?auto_6520 ?auto_6523 ) ) ( HOIST-AT ?auto_6522 ?auto_6520 ) ( not ( = ?auto_6525 ?auto_6522 ) ) ( AVAILABLE ?auto_6522 ) ( SURFACE-AT ?auto_6519 ?auto_6520 ) ( ON ?auto_6519 ?auto_6524 ) ( CLEAR ?auto_6519 ) ( not ( = ?auto_6518 ?auto_6524 ) ) ( not ( = ?auto_6519 ?auto_6524 ) ) ( not ( = ?auto_6517 ?auto_6524 ) ) ( TRUCK-AT ?auto_6521 ?auto_6523 ) ( SURFACE-AT ?auto_6517 ?auto_6523 ) ( CLEAR ?auto_6517 ) ( LIFTING ?auto_6525 ?auto_6518 ) ( IS-CRATE ?auto_6518 ) ( ON ?auto_6517 ?auto_6516 ) ( not ( = ?auto_6516 ?auto_6517 ) ) ( not ( = ?auto_6516 ?auto_6518 ) ) ( not ( = ?auto_6516 ?auto_6519 ) ) ( not ( = ?auto_6516 ?auto_6524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6517 ?auto_6518 ?auto_6519 )
      ( MAKE-3CRATE-VERIFY ?auto_6516 ?auto_6517 ?auto_6518 ?auto_6519 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6526 - SURFACE
      ?auto_6527 - SURFACE
      ?auto_6528 - SURFACE
      ?auto_6529 - SURFACE
      ?auto_6530 - SURFACE
    )
    :vars
    (
      ?auto_6536 - HOIST
      ?auto_6534 - PLACE
      ?auto_6531 - PLACE
      ?auto_6533 - HOIST
      ?auto_6535 - SURFACE
      ?auto_6532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6536 ?auto_6534 ) ( IS-CRATE ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6531 ?auto_6534 ) ) ( HOIST-AT ?auto_6533 ?auto_6531 ) ( not ( = ?auto_6536 ?auto_6533 ) ) ( AVAILABLE ?auto_6533 ) ( SURFACE-AT ?auto_6530 ?auto_6531 ) ( ON ?auto_6530 ?auto_6535 ) ( CLEAR ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6535 ) ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( not ( = ?auto_6528 ?auto_6535 ) ) ( TRUCK-AT ?auto_6532 ?auto_6534 ) ( SURFACE-AT ?auto_6528 ?auto_6534 ) ( CLEAR ?auto_6528 ) ( LIFTING ?auto_6536 ?auto_6529 ) ( IS-CRATE ?auto_6529 ) ( ON ?auto_6527 ?auto_6526 ) ( ON ?auto_6528 ?auto_6527 ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6528 ) ) ( not ( = ?auto_6526 ?auto_6529 ) ) ( not ( = ?auto_6526 ?auto_6530 ) ) ( not ( = ?auto_6526 ?auto_6535 ) ) ( not ( = ?auto_6527 ?auto_6528 ) ) ( not ( = ?auto_6527 ?auto_6529 ) ) ( not ( = ?auto_6527 ?auto_6530 ) ) ( not ( = ?auto_6527 ?auto_6535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6528 ?auto_6529 ?auto_6530 )
      ( MAKE-4CRATE-VERIFY ?auto_6526 ?auto_6527 ?auto_6528 ?auto_6529 ?auto_6530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6537 - SURFACE
      ?auto_6538 - SURFACE
    )
    :vars
    (
      ?auto_6544 - HOIST
      ?auto_6542 - PLACE
      ?auto_6545 - SURFACE
      ?auto_6539 - PLACE
      ?auto_6541 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6544 ?auto_6542 ) ( IS-CRATE ?auto_6538 ) ( not ( = ?auto_6537 ?auto_6538 ) ) ( not ( = ?auto_6545 ?auto_6537 ) ) ( not ( = ?auto_6545 ?auto_6538 ) ) ( not ( = ?auto_6539 ?auto_6542 ) ) ( HOIST-AT ?auto_6541 ?auto_6539 ) ( not ( = ?auto_6544 ?auto_6541 ) ) ( AVAILABLE ?auto_6541 ) ( SURFACE-AT ?auto_6538 ?auto_6539 ) ( ON ?auto_6538 ?auto_6543 ) ( CLEAR ?auto_6538 ) ( not ( = ?auto_6537 ?auto_6543 ) ) ( not ( = ?auto_6538 ?auto_6543 ) ) ( not ( = ?auto_6545 ?auto_6543 ) ) ( TRUCK-AT ?auto_6540 ?auto_6542 ) ( SURFACE-AT ?auto_6545 ?auto_6542 ) ( CLEAR ?auto_6545 ) ( IS-CRATE ?auto_6537 ) ( AVAILABLE ?auto_6544 ) ( IN ?auto_6537 ?auto_6540 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6544 ?auto_6537 ?auto_6540 ?auto_6542 )
      ( MAKE-2CRATE ?auto_6545 ?auto_6537 ?auto_6538 )
      ( MAKE-1CRATE-VERIFY ?auto_6537 ?auto_6538 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6546 - SURFACE
      ?auto_6547 - SURFACE
      ?auto_6548 - SURFACE
    )
    :vars
    (
      ?auto_6551 - HOIST
      ?auto_6549 - PLACE
      ?auto_6552 - PLACE
      ?auto_6554 - HOIST
      ?auto_6550 - SURFACE
      ?auto_6553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6551 ?auto_6549 ) ( IS-CRATE ?auto_6548 ) ( not ( = ?auto_6547 ?auto_6548 ) ) ( not ( = ?auto_6546 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6548 ) ) ( not ( = ?auto_6552 ?auto_6549 ) ) ( HOIST-AT ?auto_6554 ?auto_6552 ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( AVAILABLE ?auto_6554 ) ( SURFACE-AT ?auto_6548 ?auto_6552 ) ( ON ?auto_6548 ?auto_6550 ) ( CLEAR ?auto_6548 ) ( not ( = ?auto_6547 ?auto_6550 ) ) ( not ( = ?auto_6548 ?auto_6550 ) ) ( not ( = ?auto_6546 ?auto_6550 ) ) ( TRUCK-AT ?auto_6553 ?auto_6549 ) ( SURFACE-AT ?auto_6546 ?auto_6549 ) ( CLEAR ?auto_6546 ) ( IS-CRATE ?auto_6547 ) ( AVAILABLE ?auto_6551 ) ( IN ?auto_6547 ?auto_6553 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6547 ?auto_6548 )
      ( MAKE-2CRATE-VERIFY ?auto_6546 ?auto_6547 ?auto_6548 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6555 - SURFACE
      ?auto_6556 - SURFACE
      ?auto_6557 - SURFACE
      ?auto_6558 - SURFACE
    )
    :vars
    (
      ?auto_6559 - HOIST
      ?auto_6560 - PLACE
      ?auto_6564 - PLACE
      ?auto_6561 - HOIST
      ?auto_6563 - SURFACE
      ?auto_6562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6559 ?auto_6560 ) ( IS-CRATE ?auto_6558 ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6558 ) ) ( not ( = ?auto_6564 ?auto_6560 ) ) ( HOIST-AT ?auto_6561 ?auto_6564 ) ( not ( = ?auto_6559 ?auto_6561 ) ) ( AVAILABLE ?auto_6561 ) ( SURFACE-AT ?auto_6558 ?auto_6564 ) ( ON ?auto_6558 ?auto_6563 ) ( CLEAR ?auto_6558 ) ( not ( = ?auto_6557 ?auto_6563 ) ) ( not ( = ?auto_6558 ?auto_6563 ) ) ( not ( = ?auto_6556 ?auto_6563 ) ) ( TRUCK-AT ?auto_6562 ?auto_6560 ) ( SURFACE-AT ?auto_6556 ?auto_6560 ) ( CLEAR ?auto_6556 ) ( IS-CRATE ?auto_6557 ) ( AVAILABLE ?auto_6559 ) ( IN ?auto_6557 ?auto_6562 ) ( ON ?auto_6556 ?auto_6555 ) ( not ( = ?auto_6555 ?auto_6556 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6558 ) ) ( not ( = ?auto_6555 ?auto_6563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6556 ?auto_6557 ?auto_6558 )
      ( MAKE-3CRATE-VERIFY ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6565 - SURFACE
      ?auto_6566 - SURFACE
      ?auto_6567 - SURFACE
      ?auto_6568 - SURFACE
      ?auto_6569 - SURFACE
    )
    :vars
    (
      ?auto_6570 - HOIST
      ?auto_6571 - PLACE
      ?auto_6575 - PLACE
      ?auto_6572 - HOIST
      ?auto_6574 - SURFACE
      ?auto_6573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6570 ?auto_6571 ) ( IS-CRATE ?auto_6569 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6575 ?auto_6571 ) ) ( HOIST-AT ?auto_6572 ?auto_6575 ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( AVAILABLE ?auto_6572 ) ( SURFACE-AT ?auto_6569 ?auto_6575 ) ( ON ?auto_6569 ?auto_6574 ) ( CLEAR ?auto_6569 ) ( not ( = ?auto_6568 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6574 ) ) ( not ( = ?auto_6567 ?auto_6574 ) ) ( TRUCK-AT ?auto_6573 ?auto_6571 ) ( SURFACE-AT ?auto_6567 ?auto_6571 ) ( CLEAR ?auto_6567 ) ( IS-CRATE ?auto_6568 ) ( AVAILABLE ?auto_6570 ) ( IN ?auto_6568 ?auto_6573 ) ( ON ?auto_6566 ?auto_6565 ) ( ON ?auto_6567 ?auto_6566 ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( not ( = ?auto_6565 ?auto_6569 ) ) ( not ( = ?auto_6565 ?auto_6574 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6567 ?auto_6568 ?auto_6569 )
      ( MAKE-4CRATE-VERIFY ?auto_6565 ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6569 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6576 - SURFACE
      ?auto_6577 - SURFACE
    )
    :vars
    (
      ?auto_6578 - HOIST
      ?auto_6579 - PLACE
      ?auto_6584 - SURFACE
      ?auto_6583 - PLACE
      ?auto_6580 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6581 - TRUCK
      ?auto_6585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6578 ?auto_6579 ) ( IS-CRATE ?auto_6577 ) ( not ( = ?auto_6576 ?auto_6577 ) ) ( not ( = ?auto_6584 ?auto_6576 ) ) ( not ( = ?auto_6584 ?auto_6577 ) ) ( not ( = ?auto_6583 ?auto_6579 ) ) ( HOIST-AT ?auto_6580 ?auto_6583 ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( AVAILABLE ?auto_6580 ) ( SURFACE-AT ?auto_6577 ?auto_6583 ) ( ON ?auto_6577 ?auto_6582 ) ( CLEAR ?auto_6577 ) ( not ( = ?auto_6576 ?auto_6582 ) ) ( not ( = ?auto_6577 ?auto_6582 ) ) ( not ( = ?auto_6584 ?auto_6582 ) ) ( SURFACE-AT ?auto_6584 ?auto_6579 ) ( CLEAR ?auto_6584 ) ( IS-CRATE ?auto_6576 ) ( AVAILABLE ?auto_6578 ) ( IN ?auto_6576 ?auto_6581 ) ( TRUCK-AT ?auto_6581 ?auto_6585 ) ( not ( = ?auto_6585 ?auto_6579 ) ) ( not ( = ?auto_6583 ?auto_6585 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6581 ?auto_6585 ?auto_6579 )
      ( MAKE-2CRATE ?auto_6584 ?auto_6576 ?auto_6577 )
      ( MAKE-1CRATE-VERIFY ?auto_6576 ?auto_6577 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6586 - SURFACE
      ?auto_6587 - SURFACE
      ?auto_6588 - SURFACE
    )
    :vars
    (
      ?auto_6595 - HOIST
      ?auto_6592 - PLACE
      ?auto_6590 - PLACE
      ?auto_6589 - HOIST
      ?auto_6591 - SURFACE
      ?auto_6593 - TRUCK
      ?auto_6594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6595 ?auto_6592 ) ( IS-CRATE ?auto_6588 ) ( not ( = ?auto_6587 ?auto_6588 ) ) ( not ( = ?auto_6586 ?auto_6587 ) ) ( not ( = ?auto_6586 ?auto_6588 ) ) ( not ( = ?auto_6590 ?auto_6592 ) ) ( HOIST-AT ?auto_6589 ?auto_6590 ) ( not ( = ?auto_6595 ?auto_6589 ) ) ( AVAILABLE ?auto_6589 ) ( SURFACE-AT ?auto_6588 ?auto_6590 ) ( ON ?auto_6588 ?auto_6591 ) ( CLEAR ?auto_6588 ) ( not ( = ?auto_6587 ?auto_6591 ) ) ( not ( = ?auto_6588 ?auto_6591 ) ) ( not ( = ?auto_6586 ?auto_6591 ) ) ( SURFACE-AT ?auto_6586 ?auto_6592 ) ( CLEAR ?auto_6586 ) ( IS-CRATE ?auto_6587 ) ( AVAILABLE ?auto_6595 ) ( IN ?auto_6587 ?auto_6593 ) ( TRUCK-AT ?auto_6593 ?auto_6594 ) ( not ( = ?auto_6594 ?auto_6592 ) ) ( not ( = ?auto_6590 ?auto_6594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6587 ?auto_6588 )
      ( MAKE-2CRATE-VERIFY ?auto_6586 ?auto_6587 ?auto_6588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6596 - SURFACE
      ?auto_6597 - SURFACE
      ?auto_6598 - SURFACE
      ?auto_6599 - SURFACE
    )
    :vars
    (
      ?auto_6601 - HOIST
      ?auto_6603 - PLACE
      ?auto_6602 - PLACE
      ?auto_6600 - HOIST
      ?auto_6605 - SURFACE
      ?auto_6606 - TRUCK
      ?auto_6604 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6601 ?auto_6603 ) ( IS-CRATE ?auto_6599 ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6597 ?auto_6598 ) ) ( not ( = ?auto_6597 ?auto_6599 ) ) ( not ( = ?auto_6602 ?auto_6603 ) ) ( HOIST-AT ?auto_6600 ?auto_6602 ) ( not ( = ?auto_6601 ?auto_6600 ) ) ( AVAILABLE ?auto_6600 ) ( SURFACE-AT ?auto_6599 ?auto_6602 ) ( ON ?auto_6599 ?auto_6605 ) ( CLEAR ?auto_6599 ) ( not ( = ?auto_6598 ?auto_6605 ) ) ( not ( = ?auto_6599 ?auto_6605 ) ) ( not ( = ?auto_6597 ?auto_6605 ) ) ( SURFACE-AT ?auto_6597 ?auto_6603 ) ( CLEAR ?auto_6597 ) ( IS-CRATE ?auto_6598 ) ( AVAILABLE ?auto_6601 ) ( IN ?auto_6598 ?auto_6606 ) ( TRUCK-AT ?auto_6606 ?auto_6604 ) ( not ( = ?auto_6604 ?auto_6603 ) ) ( not ( = ?auto_6602 ?auto_6604 ) ) ( ON ?auto_6597 ?auto_6596 ) ( not ( = ?auto_6596 ?auto_6597 ) ) ( not ( = ?auto_6596 ?auto_6598 ) ) ( not ( = ?auto_6596 ?auto_6599 ) ) ( not ( = ?auto_6596 ?auto_6605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6597 ?auto_6598 ?auto_6599 )
      ( MAKE-3CRATE-VERIFY ?auto_6596 ?auto_6597 ?auto_6598 ?auto_6599 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6607 - SURFACE
      ?auto_6608 - SURFACE
      ?auto_6609 - SURFACE
      ?auto_6610 - SURFACE
      ?auto_6611 - SURFACE
    )
    :vars
    (
      ?auto_6613 - HOIST
      ?auto_6615 - PLACE
      ?auto_6614 - PLACE
      ?auto_6612 - HOIST
      ?auto_6617 - SURFACE
      ?auto_6618 - TRUCK
      ?auto_6616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6613 ?auto_6615 ) ( IS-CRATE ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( not ( = ?auto_6609 ?auto_6610 ) ) ( not ( = ?auto_6609 ?auto_6611 ) ) ( not ( = ?auto_6614 ?auto_6615 ) ) ( HOIST-AT ?auto_6612 ?auto_6614 ) ( not ( = ?auto_6613 ?auto_6612 ) ) ( AVAILABLE ?auto_6612 ) ( SURFACE-AT ?auto_6611 ?auto_6614 ) ( ON ?auto_6611 ?auto_6617 ) ( CLEAR ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6617 ) ) ( not ( = ?auto_6611 ?auto_6617 ) ) ( not ( = ?auto_6609 ?auto_6617 ) ) ( SURFACE-AT ?auto_6609 ?auto_6615 ) ( CLEAR ?auto_6609 ) ( IS-CRATE ?auto_6610 ) ( AVAILABLE ?auto_6613 ) ( IN ?auto_6610 ?auto_6618 ) ( TRUCK-AT ?auto_6618 ?auto_6616 ) ( not ( = ?auto_6616 ?auto_6615 ) ) ( not ( = ?auto_6614 ?auto_6616 ) ) ( ON ?auto_6608 ?auto_6607 ) ( ON ?auto_6609 ?auto_6608 ) ( not ( = ?auto_6607 ?auto_6608 ) ) ( not ( = ?auto_6607 ?auto_6609 ) ) ( not ( = ?auto_6607 ?auto_6610 ) ) ( not ( = ?auto_6607 ?auto_6611 ) ) ( not ( = ?auto_6607 ?auto_6617 ) ) ( not ( = ?auto_6608 ?auto_6609 ) ) ( not ( = ?auto_6608 ?auto_6610 ) ) ( not ( = ?auto_6608 ?auto_6611 ) ) ( not ( = ?auto_6608 ?auto_6617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6609 ?auto_6610 ?auto_6611 )
      ( MAKE-4CRATE-VERIFY ?auto_6607 ?auto_6608 ?auto_6609 ?auto_6610 ?auto_6611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6619 - SURFACE
      ?auto_6620 - SURFACE
    )
    :vars
    (
      ?auto_6622 - HOIST
      ?auto_6624 - PLACE
      ?auto_6628 - SURFACE
      ?auto_6623 - PLACE
      ?auto_6621 - HOIST
      ?auto_6626 - SURFACE
      ?auto_6627 - TRUCK
      ?auto_6625 - PLACE
      ?auto_6629 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6622 ?auto_6624 ) ( IS-CRATE ?auto_6620 ) ( not ( = ?auto_6619 ?auto_6620 ) ) ( not ( = ?auto_6628 ?auto_6619 ) ) ( not ( = ?auto_6628 ?auto_6620 ) ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( HOIST-AT ?auto_6621 ?auto_6623 ) ( not ( = ?auto_6622 ?auto_6621 ) ) ( AVAILABLE ?auto_6621 ) ( SURFACE-AT ?auto_6620 ?auto_6623 ) ( ON ?auto_6620 ?auto_6626 ) ( CLEAR ?auto_6620 ) ( not ( = ?auto_6619 ?auto_6626 ) ) ( not ( = ?auto_6620 ?auto_6626 ) ) ( not ( = ?auto_6628 ?auto_6626 ) ) ( SURFACE-AT ?auto_6628 ?auto_6624 ) ( CLEAR ?auto_6628 ) ( IS-CRATE ?auto_6619 ) ( AVAILABLE ?auto_6622 ) ( TRUCK-AT ?auto_6627 ?auto_6625 ) ( not ( = ?auto_6625 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( HOIST-AT ?auto_6629 ?auto_6625 ) ( LIFTING ?auto_6629 ?auto_6619 ) ( not ( = ?auto_6622 ?auto_6629 ) ) ( not ( = ?auto_6621 ?auto_6629 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6629 ?auto_6619 ?auto_6627 ?auto_6625 )
      ( MAKE-2CRATE ?auto_6628 ?auto_6619 ?auto_6620 )
      ( MAKE-1CRATE-VERIFY ?auto_6619 ?auto_6620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6630 - SURFACE
      ?auto_6631 - SURFACE
      ?auto_6632 - SURFACE
    )
    :vars
    (
      ?auto_6640 - HOIST
      ?auto_6633 - PLACE
      ?auto_6637 - PLACE
      ?auto_6634 - HOIST
      ?auto_6638 - SURFACE
      ?auto_6635 - TRUCK
      ?auto_6636 - PLACE
      ?auto_6639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6640 ?auto_6633 ) ( IS-CRATE ?auto_6632 ) ( not ( = ?auto_6631 ?auto_6632 ) ) ( not ( = ?auto_6630 ?auto_6631 ) ) ( not ( = ?auto_6630 ?auto_6632 ) ) ( not ( = ?auto_6637 ?auto_6633 ) ) ( HOIST-AT ?auto_6634 ?auto_6637 ) ( not ( = ?auto_6640 ?auto_6634 ) ) ( AVAILABLE ?auto_6634 ) ( SURFACE-AT ?auto_6632 ?auto_6637 ) ( ON ?auto_6632 ?auto_6638 ) ( CLEAR ?auto_6632 ) ( not ( = ?auto_6631 ?auto_6638 ) ) ( not ( = ?auto_6632 ?auto_6638 ) ) ( not ( = ?auto_6630 ?auto_6638 ) ) ( SURFACE-AT ?auto_6630 ?auto_6633 ) ( CLEAR ?auto_6630 ) ( IS-CRATE ?auto_6631 ) ( AVAILABLE ?auto_6640 ) ( TRUCK-AT ?auto_6635 ?auto_6636 ) ( not ( = ?auto_6636 ?auto_6633 ) ) ( not ( = ?auto_6637 ?auto_6636 ) ) ( HOIST-AT ?auto_6639 ?auto_6636 ) ( LIFTING ?auto_6639 ?auto_6631 ) ( not ( = ?auto_6640 ?auto_6639 ) ) ( not ( = ?auto_6634 ?auto_6639 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6631 ?auto_6632 )
      ( MAKE-2CRATE-VERIFY ?auto_6630 ?auto_6631 ?auto_6632 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6641 - SURFACE
      ?auto_6642 - SURFACE
      ?auto_6643 - SURFACE
      ?auto_6644 - SURFACE
    )
    :vars
    (
      ?auto_6646 - HOIST
      ?auto_6650 - PLACE
      ?auto_6651 - PLACE
      ?auto_6647 - HOIST
      ?auto_6645 - SURFACE
      ?auto_6649 - TRUCK
      ?auto_6652 - PLACE
      ?auto_6648 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6646 ?auto_6650 ) ( IS-CRATE ?auto_6644 ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( not ( = ?auto_6642 ?auto_6643 ) ) ( not ( = ?auto_6642 ?auto_6644 ) ) ( not ( = ?auto_6651 ?auto_6650 ) ) ( HOIST-AT ?auto_6647 ?auto_6651 ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( AVAILABLE ?auto_6647 ) ( SURFACE-AT ?auto_6644 ?auto_6651 ) ( ON ?auto_6644 ?auto_6645 ) ( CLEAR ?auto_6644 ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6645 ) ) ( not ( = ?auto_6642 ?auto_6645 ) ) ( SURFACE-AT ?auto_6642 ?auto_6650 ) ( CLEAR ?auto_6642 ) ( IS-CRATE ?auto_6643 ) ( AVAILABLE ?auto_6646 ) ( TRUCK-AT ?auto_6649 ?auto_6652 ) ( not ( = ?auto_6652 ?auto_6650 ) ) ( not ( = ?auto_6651 ?auto_6652 ) ) ( HOIST-AT ?auto_6648 ?auto_6652 ) ( LIFTING ?auto_6648 ?auto_6643 ) ( not ( = ?auto_6646 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( ON ?auto_6642 ?auto_6641 ) ( not ( = ?auto_6641 ?auto_6642 ) ) ( not ( = ?auto_6641 ?auto_6643 ) ) ( not ( = ?auto_6641 ?auto_6644 ) ) ( not ( = ?auto_6641 ?auto_6645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6642 ?auto_6643 ?auto_6644 )
      ( MAKE-3CRATE-VERIFY ?auto_6641 ?auto_6642 ?auto_6643 ?auto_6644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6653 - SURFACE
      ?auto_6654 - SURFACE
      ?auto_6655 - SURFACE
      ?auto_6656 - SURFACE
      ?auto_6657 - SURFACE
    )
    :vars
    (
      ?auto_6659 - HOIST
      ?auto_6663 - PLACE
      ?auto_6664 - PLACE
      ?auto_6660 - HOIST
      ?auto_6658 - SURFACE
      ?auto_6662 - TRUCK
      ?auto_6665 - PLACE
      ?auto_6661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6659 ?auto_6663 ) ( IS-CRATE ?auto_6657 ) ( not ( = ?auto_6656 ?auto_6657 ) ) ( not ( = ?auto_6655 ?auto_6656 ) ) ( not ( = ?auto_6655 ?auto_6657 ) ) ( not ( = ?auto_6664 ?auto_6663 ) ) ( HOIST-AT ?auto_6660 ?auto_6664 ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( AVAILABLE ?auto_6660 ) ( SURFACE-AT ?auto_6657 ?auto_6664 ) ( ON ?auto_6657 ?auto_6658 ) ( CLEAR ?auto_6657 ) ( not ( = ?auto_6656 ?auto_6658 ) ) ( not ( = ?auto_6657 ?auto_6658 ) ) ( not ( = ?auto_6655 ?auto_6658 ) ) ( SURFACE-AT ?auto_6655 ?auto_6663 ) ( CLEAR ?auto_6655 ) ( IS-CRATE ?auto_6656 ) ( AVAILABLE ?auto_6659 ) ( TRUCK-AT ?auto_6662 ?auto_6665 ) ( not ( = ?auto_6665 ?auto_6663 ) ) ( not ( = ?auto_6664 ?auto_6665 ) ) ( HOIST-AT ?auto_6661 ?auto_6665 ) ( LIFTING ?auto_6661 ?auto_6656 ) ( not ( = ?auto_6659 ?auto_6661 ) ) ( not ( = ?auto_6660 ?auto_6661 ) ) ( ON ?auto_6654 ?auto_6653 ) ( ON ?auto_6655 ?auto_6654 ) ( not ( = ?auto_6653 ?auto_6654 ) ) ( not ( = ?auto_6653 ?auto_6655 ) ) ( not ( = ?auto_6653 ?auto_6656 ) ) ( not ( = ?auto_6653 ?auto_6657 ) ) ( not ( = ?auto_6653 ?auto_6658 ) ) ( not ( = ?auto_6654 ?auto_6655 ) ) ( not ( = ?auto_6654 ?auto_6656 ) ) ( not ( = ?auto_6654 ?auto_6657 ) ) ( not ( = ?auto_6654 ?auto_6658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6655 ?auto_6656 ?auto_6657 )
      ( MAKE-4CRATE-VERIFY ?auto_6653 ?auto_6654 ?auto_6655 ?auto_6656 ?auto_6657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6666 - SURFACE
      ?auto_6667 - SURFACE
    )
    :vars
    (
      ?auto_6669 - HOIST
      ?auto_6673 - PLACE
      ?auto_6676 - SURFACE
      ?auto_6674 - PLACE
      ?auto_6670 - HOIST
      ?auto_6668 - SURFACE
      ?auto_6672 - TRUCK
      ?auto_6675 - PLACE
      ?auto_6671 - HOIST
      ?auto_6677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6669 ?auto_6673 ) ( IS-CRATE ?auto_6667 ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( not ( = ?auto_6676 ?auto_6666 ) ) ( not ( = ?auto_6676 ?auto_6667 ) ) ( not ( = ?auto_6674 ?auto_6673 ) ) ( HOIST-AT ?auto_6670 ?auto_6674 ) ( not ( = ?auto_6669 ?auto_6670 ) ) ( AVAILABLE ?auto_6670 ) ( SURFACE-AT ?auto_6667 ?auto_6674 ) ( ON ?auto_6667 ?auto_6668 ) ( CLEAR ?auto_6667 ) ( not ( = ?auto_6666 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6676 ?auto_6668 ) ) ( SURFACE-AT ?auto_6676 ?auto_6673 ) ( CLEAR ?auto_6676 ) ( IS-CRATE ?auto_6666 ) ( AVAILABLE ?auto_6669 ) ( TRUCK-AT ?auto_6672 ?auto_6675 ) ( not ( = ?auto_6675 ?auto_6673 ) ) ( not ( = ?auto_6674 ?auto_6675 ) ) ( HOIST-AT ?auto_6671 ?auto_6675 ) ( not ( = ?auto_6669 ?auto_6671 ) ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( AVAILABLE ?auto_6671 ) ( SURFACE-AT ?auto_6666 ?auto_6675 ) ( ON ?auto_6666 ?auto_6677 ) ( CLEAR ?auto_6666 ) ( not ( = ?auto_6666 ?auto_6677 ) ) ( not ( = ?auto_6667 ?auto_6677 ) ) ( not ( = ?auto_6676 ?auto_6677 ) ) ( not ( = ?auto_6668 ?auto_6677 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6671 ?auto_6666 ?auto_6677 ?auto_6675 )
      ( MAKE-2CRATE ?auto_6676 ?auto_6666 ?auto_6667 )
      ( MAKE-1CRATE-VERIFY ?auto_6666 ?auto_6667 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6678 - SURFACE
      ?auto_6679 - SURFACE
      ?auto_6680 - SURFACE
    )
    :vars
    (
      ?auto_6687 - HOIST
      ?auto_6681 - PLACE
      ?auto_6682 - PLACE
      ?auto_6688 - HOIST
      ?auto_6689 - SURFACE
      ?auto_6683 - TRUCK
      ?auto_6684 - PLACE
      ?auto_6685 - HOIST
      ?auto_6686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6687 ?auto_6681 ) ( IS-CRATE ?auto_6680 ) ( not ( = ?auto_6679 ?auto_6680 ) ) ( not ( = ?auto_6678 ?auto_6679 ) ) ( not ( = ?auto_6678 ?auto_6680 ) ) ( not ( = ?auto_6682 ?auto_6681 ) ) ( HOIST-AT ?auto_6688 ?auto_6682 ) ( not ( = ?auto_6687 ?auto_6688 ) ) ( AVAILABLE ?auto_6688 ) ( SURFACE-AT ?auto_6680 ?auto_6682 ) ( ON ?auto_6680 ?auto_6689 ) ( CLEAR ?auto_6680 ) ( not ( = ?auto_6679 ?auto_6689 ) ) ( not ( = ?auto_6680 ?auto_6689 ) ) ( not ( = ?auto_6678 ?auto_6689 ) ) ( SURFACE-AT ?auto_6678 ?auto_6681 ) ( CLEAR ?auto_6678 ) ( IS-CRATE ?auto_6679 ) ( AVAILABLE ?auto_6687 ) ( TRUCK-AT ?auto_6683 ?auto_6684 ) ( not ( = ?auto_6684 ?auto_6681 ) ) ( not ( = ?auto_6682 ?auto_6684 ) ) ( HOIST-AT ?auto_6685 ?auto_6684 ) ( not ( = ?auto_6687 ?auto_6685 ) ) ( not ( = ?auto_6688 ?auto_6685 ) ) ( AVAILABLE ?auto_6685 ) ( SURFACE-AT ?auto_6679 ?auto_6684 ) ( ON ?auto_6679 ?auto_6686 ) ( CLEAR ?auto_6679 ) ( not ( = ?auto_6679 ?auto_6686 ) ) ( not ( = ?auto_6680 ?auto_6686 ) ) ( not ( = ?auto_6678 ?auto_6686 ) ) ( not ( = ?auto_6689 ?auto_6686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6679 ?auto_6680 )
      ( MAKE-2CRATE-VERIFY ?auto_6678 ?auto_6679 ?auto_6680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6690 - SURFACE
      ?auto_6691 - SURFACE
      ?auto_6692 - SURFACE
      ?auto_6693 - SURFACE
    )
    :vars
    (
      ?auto_6701 - HOIST
      ?auto_6700 - PLACE
      ?auto_6699 - PLACE
      ?auto_6702 - HOIST
      ?auto_6696 - SURFACE
      ?auto_6694 - TRUCK
      ?auto_6697 - PLACE
      ?auto_6698 - HOIST
      ?auto_6695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6701 ?auto_6700 ) ( IS-CRATE ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6693 ) ) ( not ( = ?auto_6691 ?auto_6692 ) ) ( not ( = ?auto_6691 ?auto_6693 ) ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( HOIST-AT ?auto_6702 ?auto_6699 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( AVAILABLE ?auto_6702 ) ( SURFACE-AT ?auto_6693 ?auto_6699 ) ( ON ?auto_6693 ?auto_6696 ) ( CLEAR ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6696 ) ) ( not ( = ?auto_6693 ?auto_6696 ) ) ( not ( = ?auto_6691 ?auto_6696 ) ) ( SURFACE-AT ?auto_6691 ?auto_6700 ) ( CLEAR ?auto_6691 ) ( IS-CRATE ?auto_6692 ) ( AVAILABLE ?auto_6701 ) ( TRUCK-AT ?auto_6694 ?auto_6697 ) ( not ( = ?auto_6697 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6697 ) ) ( HOIST-AT ?auto_6698 ?auto_6697 ) ( not ( = ?auto_6701 ?auto_6698 ) ) ( not ( = ?auto_6702 ?auto_6698 ) ) ( AVAILABLE ?auto_6698 ) ( SURFACE-AT ?auto_6692 ?auto_6697 ) ( ON ?auto_6692 ?auto_6695 ) ( CLEAR ?auto_6692 ) ( not ( = ?auto_6692 ?auto_6695 ) ) ( not ( = ?auto_6693 ?auto_6695 ) ) ( not ( = ?auto_6691 ?auto_6695 ) ) ( not ( = ?auto_6696 ?auto_6695 ) ) ( ON ?auto_6691 ?auto_6690 ) ( not ( = ?auto_6690 ?auto_6691 ) ) ( not ( = ?auto_6690 ?auto_6692 ) ) ( not ( = ?auto_6690 ?auto_6693 ) ) ( not ( = ?auto_6690 ?auto_6696 ) ) ( not ( = ?auto_6690 ?auto_6695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6691 ?auto_6692 ?auto_6693 )
      ( MAKE-3CRATE-VERIFY ?auto_6690 ?auto_6691 ?auto_6692 ?auto_6693 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6703 - SURFACE
      ?auto_6704 - SURFACE
      ?auto_6705 - SURFACE
      ?auto_6706 - SURFACE
      ?auto_6707 - SURFACE
    )
    :vars
    (
      ?auto_6715 - HOIST
      ?auto_6714 - PLACE
      ?auto_6713 - PLACE
      ?auto_6716 - HOIST
      ?auto_6710 - SURFACE
      ?auto_6708 - TRUCK
      ?auto_6711 - PLACE
      ?auto_6712 - HOIST
      ?auto_6709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6715 ?auto_6714 ) ( IS-CRATE ?auto_6707 ) ( not ( = ?auto_6706 ?auto_6707 ) ) ( not ( = ?auto_6705 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6707 ) ) ( not ( = ?auto_6713 ?auto_6714 ) ) ( HOIST-AT ?auto_6716 ?auto_6713 ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( AVAILABLE ?auto_6716 ) ( SURFACE-AT ?auto_6707 ?auto_6713 ) ( ON ?auto_6707 ?auto_6710 ) ( CLEAR ?auto_6707 ) ( not ( = ?auto_6706 ?auto_6710 ) ) ( not ( = ?auto_6707 ?auto_6710 ) ) ( not ( = ?auto_6705 ?auto_6710 ) ) ( SURFACE-AT ?auto_6705 ?auto_6714 ) ( CLEAR ?auto_6705 ) ( IS-CRATE ?auto_6706 ) ( AVAILABLE ?auto_6715 ) ( TRUCK-AT ?auto_6708 ?auto_6711 ) ( not ( = ?auto_6711 ?auto_6714 ) ) ( not ( = ?auto_6713 ?auto_6711 ) ) ( HOIST-AT ?auto_6712 ?auto_6711 ) ( not ( = ?auto_6715 ?auto_6712 ) ) ( not ( = ?auto_6716 ?auto_6712 ) ) ( AVAILABLE ?auto_6712 ) ( SURFACE-AT ?auto_6706 ?auto_6711 ) ( ON ?auto_6706 ?auto_6709 ) ( CLEAR ?auto_6706 ) ( not ( = ?auto_6706 ?auto_6709 ) ) ( not ( = ?auto_6707 ?auto_6709 ) ) ( not ( = ?auto_6705 ?auto_6709 ) ) ( not ( = ?auto_6710 ?auto_6709 ) ) ( ON ?auto_6704 ?auto_6703 ) ( ON ?auto_6705 ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( not ( = ?auto_6703 ?auto_6705 ) ) ( not ( = ?auto_6703 ?auto_6706 ) ) ( not ( = ?auto_6703 ?auto_6707 ) ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6703 ?auto_6709 ) ) ( not ( = ?auto_6704 ?auto_6705 ) ) ( not ( = ?auto_6704 ?auto_6706 ) ) ( not ( = ?auto_6704 ?auto_6707 ) ) ( not ( = ?auto_6704 ?auto_6710 ) ) ( not ( = ?auto_6704 ?auto_6709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6705 ?auto_6706 ?auto_6707 )
      ( MAKE-4CRATE-VERIFY ?auto_6703 ?auto_6704 ?auto_6705 ?auto_6706 ?auto_6707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6717 - SURFACE
      ?auto_6718 - SURFACE
    )
    :vars
    (
      ?auto_6726 - HOIST
      ?auto_6725 - PLACE
      ?auto_6728 - SURFACE
      ?auto_6724 - PLACE
      ?auto_6727 - HOIST
      ?auto_6721 - SURFACE
      ?auto_6722 - PLACE
      ?auto_6723 - HOIST
      ?auto_6720 - SURFACE
      ?auto_6719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6726 ?auto_6725 ) ( IS-CRATE ?auto_6718 ) ( not ( = ?auto_6717 ?auto_6718 ) ) ( not ( = ?auto_6728 ?auto_6717 ) ) ( not ( = ?auto_6728 ?auto_6718 ) ) ( not ( = ?auto_6724 ?auto_6725 ) ) ( HOIST-AT ?auto_6727 ?auto_6724 ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( AVAILABLE ?auto_6727 ) ( SURFACE-AT ?auto_6718 ?auto_6724 ) ( ON ?auto_6718 ?auto_6721 ) ( CLEAR ?auto_6718 ) ( not ( = ?auto_6717 ?auto_6721 ) ) ( not ( = ?auto_6718 ?auto_6721 ) ) ( not ( = ?auto_6728 ?auto_6721 ) ) ( SURFACE-AT ?auto_6728 ?auto_6725 ) ( CLEAR ?auto_6728 ) ( IS-CRATE ?auto_6717 ) ( AVAILABLE ?auto_6726 ) ( not ( = ?auto_6722 ?auto_6725 ) ) ( not ( = ?auto_6724 ?auto_6722 ) ) ( HOIST-AT ?auto_6723 ?auto_6722 ) ( not ( = ?auto_6726 ?auto_6723 ) ) ( not ( = ?auto_6727 ?auto_6723 ) ) ( AVAILABLE ?auto_6723 ) ( SURFACE-AT ?auto_6717 ?auto_6722 ) ( ON ?auto_6717 ?auto_6720 ) ( CLEAR ?auto_6717 ) ( not ( = ?auto_6717 ?auto_6720 ) ) ( not ( = ?auto_6718 ?auto_6720 ) ) ( not ( = ?auto_6728 ?auto_6720 ) ) ( not ( = ?auto_6721 ?auto_6720 ) ) ( TRUCK-AT ?auto_6719 ?auto_6725 ) )
    :subtasks
    ( ( !DRIVE ?auto_6719 ?auto_6725 ?auto_6722 )
      ( MAKE-2CRATE ?auto_6728 ?auto_6717 ?auto_6718 )
      ( MAKE-1CRATE-VERIFY ?auto_6717 ?auto_6718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6729 - SURFACE
      ?auto_6730 - SURFACE
      ?auto_6731 - SURFACE
    )
    :vars
    (
      ?auto_6738 - HOIST
      ?auto_6736 - PLACE
      ?auto_6740 - PLACE
      ?auto_6737 - HOIST
      ?auto_6732 - SURFACE
      ?auto_6734 - PLACE
      ?auto_6735 - HOIST
      ?auto_6739 - SURFACE
      ?auto_6733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6738 ?auto_6736 ) ( IS-CRATE ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6730 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6740 ?auto_6736 ) ) ( HOIST-AT ?auto_6737 ?auto_6740 ) ( not ( = ?auto_6738 ?auto_6737 ) ) ( AVAILABLE ?auto_6737 ) ( SURFACE-AT ?auto_6731 ?auto_6740 ) ( ON ?auto_6731 ?auto_6732 ) ( CLEAR ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6731 ?auto_6732 ) ) ( not ( = ?auto_6729 ?auto_6732 ) ) ( SURFACE-AT ?auto_6729 ?auto_6736 ) ( CLEAR ?auto_6729 ) ( IS-CRATE ?auto_6730 ) ( AVAILABLE ?auto_6738 ) ( not ( = ?auto_6734 ?auto_6736 ) ) ( not ( = ?auto_6740 ?auto_6734 ) ) ( HOIST-AT ?auto_6735 ?auto_6734 ) ( not ( = ?auto_6738 ?auto_6735 ) ) ( not ( = ?auto_6737 ?auto_6735 ) ) ( AVAILABLE ?auto_6735 ) ( SURFACE-AT ?auto_6730 ?auto_6734 ) ( ON ?auto_6730 ?auto_6739 ) ( CLEAR ?auto_6730 ) ( not ( = ?auto_6730 ?auto_6739 ) ) ( not ( = ?auto_6731 ?auto_6739 ) ) ( not ( = ?auto_6729 ?auto_6739 ) ) ( not ( = ?auto_6732 ?auto_6739 ) ) ( TRUCK-AT ?auto_6733 ?auto_6736 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6730 ?auto_6731 )
      ( MAKE-2CRATE-VERIFY ?auto_6729 ?auto_6730 ?auto_6731 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6741 - SURFACE
      ?auto_6742 - SURFACE
      ?auto_6743 - SURFACE
      ?auto_6744 - SURFACE
    )
    :vars
    (
      ?auto_6749 - HOIST
      ?auto_6748 - PLACE
      ?auto_6746 - PLACE
      ?auto_6750 - HOIST
      ?auto_6751 - SURFACE
      ?auto_6753 - PLACE
      ?auto_6747 - HOIST
      ?auto_6752 - SURFACE
      ?auto_6745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6749 ?auto_6748 ) ( IS-CRATE ?auto_6744 ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( not ( = ?auto_6742 ?auto_6743 ) ) ( not ( = ?auto_6742 ?auto_6744 ) ) ( not ( = ?auto_6746 ?auto_6748 ) ) ( HOIST-AT ?auto_6750 ?auto_6746 ) ( not ( = ?auto_6749 ?auto_6750 ) ) ( AVAILABLE ?auto_6750 ) ( SURFACE-AT ?auto_6744 ?auto_6746 ) ( ON ?auto_6744 ?auto_6751 ) ( CLEAR ?auto_6744 ) ( not ( = ?auto_6743 ?auto_6751 ) ) ( not ( = ?auto_6744 ?auto_6751 ) ) ( not ( = ?auto_6742 ?auto_6751 ) ) ( SURFACE-AT ?auto_6742 ?auto_6748 ) ( CLEAR ?auto_6742 ) ( IS-CRATE ?auto_6743 ) ( AVAILABLE ?auto_6749 ) ( not ( = ?auto_6753 ?auto_6748 ) ) ( not ( = ?auto_6746 ?auto_6753 ) ) ( HOIST-AT ?auto_6747 ?auto_6753 ) ( not ( = ?auto_6749 ?auto_6747 ) ) ( not ( = ?auto_6750 ?auto_6747 ) ) ( AVAILABLE ?auto_6747 ) ( SURFACE-AT ?auto_6743 ?auto_6753 ) ( ON ?auto_6743 ?auto_6752 ) ( CLEAR ?auto_6743 ) ( not ( = ?auto_6743 ?auto_6752 ) ) ( not ( = ?auto_6744 ?auto_6752 ) ) ( not ( = ?auto_6742 ?auto_6752 ) ) ( not ( = ?auto_6751 ?auto_6752 ) ) ( TRUCK-AT ?auto_6745 ?auto_6748 ) ( ON ?auto_6742 ?auto_6741 ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6741 ?auto_6743 ) ) ( not ( = ?auto_6741 ?auto_6744 ) ) ( not ( = ?auto_6741 ?auto_6751 ) ) ( not ( = ?auto_6741 ?auto_6752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6742 ?auto_6743 ?auto_6744 )
      ( MAKE-3CRATE-VERIFY ?auto_6741 ?auto_6742 ?auto_6743 ?auto_6744 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6754 - SURFACE
      ?auto_6755 - SURFACE
      ?auto_6756 - SURFACE
      ?auto_6757 - SURFACE
      ?auto_6758 - SURFACE
    )
    :vars
    (
      ?auto_6763 - HOIST
      ?auto_6762 - PLACE
      ?auto_6760 - PLACE
      ?auto_6764 - HOIST
      ?auto_6765 - SURFACE
      ?auto_6767 - PLACE
      ?auto_6761 - HOIST
      ?auto_6766 - SURFACE
      ?auto_6759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6763 ?auto_6762 ) ( IS-CRATE ?auto_6758 ) ( not ( = ?auto_6757 ?auto_6758 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6758 ) ) ( not ( = ?auto_6760 ?auto_6762 ) ) ( HOIST-AT ?auto_6764 ?auto_6760 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( AVAILABLE ?auto_6764 ) ( SURFACE-AT ?auto_6758 ?auto_6760 ) ( ON ?auto_6758 ?auto_6765 ) ( CLEAR ?auto_6758 ) ( not ( = ?auto_6757 ?auto_6765 ) ) ( not ( = ?auto_6758 ?auto_6765 ) ) ( not ( = ?auto_6756 ?auto_6765 ) ) ( SURFACE-AT ?auto_6756 ?auto_6762 ) ( CLEAR ?auto_6756 ) ( IS-CRATE ?auto_6757 ) ( AVAILABLE ?auto_6763 ) ( not ( = ?auto_6767 ?auto_6762 ) ) ( not ( = ?auto_6760 ?auto_6767 ) ) ( HOIST-AT ?auto_6761 ?auto_6767 ) ( not ( = ?auto_6763 ?auto_6761 ) ) ( not ( = ?auto_6764 ?auto_6761 ) ) ( AVAILABLE ?auto_6761 ) ( SURFACE-AT ?auto_6757 ?auto_6767 ) ( ON ?auto_6757 ?auto_6766 ) ( CLEAR ?auto_6757 ) ( not ( = ?auto_6757 ?auto_6766 ) ) ( not ( = ?auto_6758 ?auto_6766 ) ) ( not ( = ?auto_6756 ?auto_6766 ) ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( TRUCK-AT ?auto_6759 ?auto_6762 ) ( ON ?auto_6755 ?auto_6754 ) ( ON ?auto_6756 ?auto_6755 ) ( not ( = ?auto_6754 ?auto_6755 ) ) ( not ( = ?auto_6754 ?auto_6756 ) ) ( not ( = ?auto_6754 ?auto_6757 ) ) ( not ( = ?auto_6754 ?auto_6758 ) ) ( not ( = ?auto_6754 ?auto_6765 ) ) ( not ( = ?auto_6754 ?auto_6766 ) ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6758 ) ) ( not ( = ?auto_6755 ?auto_6765 ) ) ( not ( = ?auto_6755 ?auto_6766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6756 ?auto_6757 ?auto_6758 )
      ( MAKE-4CRATE-VERIFY ?auto_6754 ?auto_6755 ?auto_6756 ?auto_6757 ?auto_6758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6768 - SURFACE
      ?auto_6769 - SURFACE
    )
    :vars
    (
      ?auto_6774 - HOIST
      ?auto_6773 - PLACE
      ?auto_6779 - SURFACE
      ?auto_6771 - PLACE
      ?auto_6775 - HOIST
      ?auto_6776 - SURFACE
      ?auto_6778 - PLACE
      ?auto_6772 - HOIST
      ?auto_6777 - SURFACE
      ?auto_6770 - TRUCK
      ?auto_6780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6774 ?auto_6773 ) ( IS-CRATE ?auto_6769 ) ( not ( = ?auto_6768 ?auto_6769 ) ) ( not ( = ?auto_6779 ?auto_6768 ) ) ( not ( = ?auto_6779 ?auto_6769 ) ) ( not ( = ?auto_6771 ?auto_6773 ) ) ( HOIST-AT ?auto_6775 ?auto_6771 ) ( not ( = ?auto_6774 ?auto_6775 ) ) ( AVAILABLE ?auto_6775 ) ( SURFACE-AT ?auto_6769 ?auto_6771 ) ( ON ?auto_6769 ?auto_6776 ) ( CLEAR ?auto_6769 ) ( not ( = ?auto_6768 ?auto_6776 ) ) ( not ( = ?auto_6769 ?auto_6776 ) ) ( not ( = ?auto_6779 ?auto_6776 ) ) ( IS-CRATE ?auto_6768 ) ( not ( = ?auto_6778 ?auto_6773 ) ) ( not ( = ?auto_6771 ?auto_6778 ) ) ( HOIST-AT ?auto_6772 ?auto_6778 ) ( not ( = ?auto_6774 ?auto_6772 ) ) ( not ( = ?auto_6775 ?auto_6772 ) ) ( AVAILABLE ?auto_6772 ) ( SURFACE-AT ?auto_6768 ?auto_6778 ) ( ON ?auto_6768 ?auto_6777 ) ( CLEAR ?auto_6768 ) ( not ( = ?auto_6768 ?auto_6777 ) ) ( not ( = ?auto_6769 ?auto_6777 ) ) ( not ( = ?auto_6779 ?auto_6777 ) ) ( not ( = ?auto_6776 ?auto_6777 ) ) ( TRUCK-AT ?auto_6770 ?auto_6773 ) ( SURFACE-AT ?auto_6780 ?auto_6773 ) ( CLEAR ?auto_6780 ) ( LIFTING ?auto_6774 ?auto_6779 ) ( IS-CRATE ?auto_6779 ) ( not ( = ?auto_6780 ?auto_6779 ) ) ( not ( = ?auto_6768 ?auto_6780 ) ) ( not ( = ?auto_6769 ?auto_6780 ) ) ( not ( = ?auto_6776 ?auto_6780 ) ) ( not ( = ?auto_6777 ?auto_6780 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6780 ?auto_6779 )
      ( MAKE-2CRATE ?auto_6779 ?auto_6768 ?auto_6769 )
      ( MAKE-1CRATE-VERIFY ?auto_6768 ?auto_6769 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6781 - SURFACE
      ?auto_6782 - SURFACE
      ?auto_6783 - SURFACE
    )
    :vars
    (
      ?auto_6789 - HOIST
      ?auto_6791 - PLACE
      ?auto_6792 - PLACE
      ?auto_6784 - HOIST
      ?auto_6786 - SURFACE
      ?auto_6787 - PLACE
      ?auto_6790 - HOIST
      ?auto_6785 - SURFACE
      ?auto_6793 - TRUCK
      ?auto_6788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6789 ?auto_6791 ) ( IS-CRATE ?auto_6783 ) ( not ( = ?auto_6782 ?auto_6783 ) ) ( not ( = ?auto_6781 ?auto_6782 ) ) ( not ( = ?auto_6781 ?auto_6783 ) ) ( not ( = ?auto_6792 ?auto_6791 ) ) ( HOIST-AT ?auto_6784 ?auto_6792 ) ( not ( = ?auto_6789 ?auto_6784 ) ) ( AVAILABLE ?auto_6784 ) ( SURFACE-AT ?auto_6783 ?auto_6792 ) ( ON ?auto_6783 ?auto_6786 ) ( CLEAR ?auto_6783 ) ( not ( = ?auto_6782 ?auto_6786 ) ) ( not ( = ?auto_6783 ?auto_6786 ) ) ( not ( = ?auto_6781 ?auto_6786 ) ) ( IS-CRATE ?auto_6782 ) ( not ( = ?auto_6787 ?auto_6791 ) ) ( not ( = ?auto_6792 ?auto_6787 ) ) ( HOIST-AT ?auto_6790 ?auto_6787 ) ( not ( = ?auto_6789 ?auto_6790 ) ) ( not ( = ?auto_6784 ?auto_6790 ) ) ( AVAILABLE ?auto_6790 ) ( SURFACE-AT ?auto_6782 ?auto_6787 ) ( ON ?auto_6782 ?auto_6785 ) ( CLEAR ?auto_6782 ) ( not ( = ?auto_6782 ?auto_6785 ) ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6781 ?auto_6785 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( TRUCK-AT ?auto_6793 ?auto_6791 ) ( SURFACE-AT ?auto_6788 ?auto_6791 ) ( CLEAR ?auto_6788 ) ( LIFTING ?auto_6789 ?auto_6781 ) ( IS-CRATE ?auto_6781 ) ( not ( = ?auto_6788 ?auto_6781 ) ) ( not ( = ?auto_6782 ?auto_6788 ) ) ( not ( = ?auto_6783 ?auto_6788 ) ) ( not ( = ?auto_6786 ?auto_6788 ) ) ( not ( = ?auto_6785 ?auto_6788 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6782 ?auto_6783 )
      ( MAKE-2CRATE-VERIFY ?auto_6781 ?auto_6782 ?auto_6783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6794 - SURFACE
      ?auto_6795 - SURFACE
      ?auto_6796 - SURFACE
      ?auto_6797 - SURFACE
    )
    :vars
    (
      ?auto_6802 - HOIST
      ?auto_6800 - PLACE
      ?auto_6803 - PLACE
      ?auto_6804 - HOIST
      ?auto_6799 - SURFACE
      ?auto_6798 - PLACE
      ?auto_6806 - HOIST
      ?auto_6805 - SURFACE
      ?auto_6801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6802 ?auto_6800 ) ( IS-CRATE ?auto_6797 ) ( not ( = ?auto_6796 ?auto_6797 ) ) ( not ( = ?auto_6795 ?auto_6796 ) ) ( not ( = ?auto_6795 ?auto_6797 ) ) ( not ( = ?auto_6803 ?auto_6800 ) ) ( HOIST-AT ?auto_6804 ?auto_6803 ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( AVAILABLE ?auto_6804 ) ( SURFACE-AT ?auto_6797 ?auto_6803 ) ( ON ?auto_6797 ?auto_6799 ) ( CLEAR ?auto_6797 ) ( not ( = ?auto_6796 ?auto_6799 ) ) ( not ( = ?auto_6797 ?auto_6799 ) ) ( not ( = ?auto_6795 ?auto_6799 ) ) ( IS-CRATE ?auto_6796 ) ( not ( = ?auto_6798 ?auto_6800 ) ) ( not ( = ?auto_6803 ?auto_6798 ) ) ( HOIST-AT ?auto_6806 ?auto_6798 ) ( not ( = ?auto_6802 ?auto_6806 ) ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( AVAILABLE ?auto_6806 ) ( SURFACE-AT ?auto_6796 ?auto_6798 ) ( ON ?auto_6796 ?auto_6805 ) ( CLEAR ?auto_6796 ) ( not ( = ?auto_6796 ?auto_6805 ) ) ( not ( = ?auto_6797 ?auto_6805 ) ) ( not ( = ?auto_6795 ?auto_6805 ) ) ( not ( = ?auto_6799 ?auto_6805 ) ) ( TRUCK-AT ?auto_6801 ?auto_6800 ) ( SURFACE-AT ?auto_6794 ?auto_6800 ) ( CLEAR ?auto_6794 ) ( LIFTING ?auto_6802 ?auto_6795 ) ( IS-CRATE ?auto_6795 ) ( not ( = ?auto_6794 ?auto_6795 ) ) ( not ( = ?auto_6796 ?auto_6794 ) ) ( not ( = ?auto_6797 ?auto_6794 ) ) ( not ( = ?auto_6799 ?auto_6794 ) ) ( not ( = ?auto_6805 ?auto_6794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6795 ?auto_6796 ?auto_6797 )
      ( MAKE-3CRATE-VERIFY ?auto_6794 ?auto_6795 ?auto_6796 ?auto_6797 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6807 - SURFACE
      ?auto_6808 - SURFACE
      ?auto_6809 - SURFACE
      ?auto_6810 - SURFACE
      ?auto_6811 - SURFACE
    )
    :vars
    (
      ?auto_6816 - HOIST
      ?auto_6814 - PLACE
      ?auto_6817 - PLACE
      ?auto_6818 - HOIST
      ?auto_6813 - SURFACE
      ?auto_6812 - PLACE
      ?auto_6820 - HOIST
      ?auto_6819 - SURFACE
      ?auto_6815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6816 ?auto_6814 ) ( IS-CRATE ?auto_6811 ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( not ( = ?auto_6809 ?auto_6810 ) ) ( not ( = ?auto_6809 ?auto_6811 ) ) ( not ( = ?auto_6817 ?auto_6814 ) ) ( HOIST-AT ?auto_6818 ?auto_6817 ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( AVAILABLE ?auto_6818 ) ( SURFACE-AT ?auto_6811 ?auto_6817 ) ( ON ?auto_6811 ?auto_6813 ) ( CLEAR ?auto_6811 ) ( not ( = ?auto_6810 ?auto_6813 ) ) ( not ( = ?auto_6811 ?auto_6813 ) ) ( not ( = ?auto_6809 ?auto_6813 ) ) ( IS-CRATE ?auto_6810 ) ( not ( = ?auto_6812 ?auto_6814 ) ) ( not ( = ?auto_6817 ?auto_6812 ) ) ( HOIST-AT ?auto_6820 ?auto_6812 ) ( not ( = ?auto_6816 ?auto_6820 ) ) ( not ( = ?auto_6818 ?auto_6820 ) ) ( AVAILABLE ?auto_6820 ) ( SURFACE-AT ?auto_6810 ?auto_6812 ) ( ON ?auto_6810 ?auto_6819 ) ( CLEAR ?auto_6810 ) ( not ( = ?auto_6810 ?auto_6819 ) ) ( not ( = ?auto_6811 ?auto_6819 ) ) ( not ( = ?auto_6809 ?auto_6819 ) ) ( not ( = ?auto_6813 ?auto_6819 ) ) ( TRUCK-AT ?auto_6815 ?auto_6814 ) ( SURFACE-AT ?auto_6808 ?auto_6814 ) ( CLEAR ?auto_6808 ) ( LIFTING ?auto_6816 ?auto_6809 ) ( IS-CRATE ?auto_6809 ) ( not ( = ?auto_6808 ?auto_6809 ) ) ( not ( = ?auto_6810 ?auto_6808 ) ) ( not ( = ?auto_6811 ?auto_6808 ) ) ( not ( = ?auto_6813 ?auto_6808 ) ) ( not ( = ?auto_6819 ?auto_6808 ) ) ( ON ?auto_6808 ?auto_6807 ) ( not ( = ?auto_6807 ?auto_6808 ) ) ( not ( = ?auto_6807 ?auto_6809 ) ) ( not ( = ?auto_6807 ?auto_6810 ) ) ( not ( = ?auto_6807 ?auto_6811 ) ) ( not ( = ?auto_6807 ?auto_6813 ) ) ( not ( = ?auto_6807 ?auto_6819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6809 ?auto_6810 ?auto_6811 )
      ( MAKE-4CRATE-VERIFY ?auto_6807 ?auto_6808 ?auto_6809 ?auto_6810 ?auto_6811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6821 - SURFACE
      ?auto_6822 - SURFACE
    )
    :vars
    (
      ?auto_6827 - HOIST
      ?auto_6825 - PLACE
      ?auto_6833 - SURFACE
      ?auto_6828 - PLACE
      ?auto_6829 - HOIST
      ?auto_6824 - SURFACE
      ?auto_6823 - PLACE
      ?auto_6832 - HOIST
      ?auto_6830 - SURFACE
      ?auto_6826 - TRUCK
      ?auto_6831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6827 ?auto_6825 ) ( IS-CRATE ?auto_6822 ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( not ( = ?auto_6833 ?auto_6821 ) ) ( not ( = ?auto_6833 ?auto_6822 ) ) ( not ( = ?auto_6828 ?auto_6825 ) ) ( HOIST-AT ?auto_6829 ?auto_6828 ) ( not ( = ?auto_6827 ?auto_6829 ) ) ( AVAILABLE ?auto_6829 ) ( SURFACE-AT ?auto_6822 ?auto_6828 ) ( ON ?auto_6822 ?auto_6824 ) ( CLEAR ?auto_6822 ) ( not ( = ?auto_6821 ?auto_6824 ) ) ( not ( = ?auto_6822 ?auto_6824 ) ) ( not ( = ?auto_6833 ?auto_6824 ) ) ( IS-CRATE ?auto_6821 ) ( not ( = ?auto_6823 ?auto_6825 ) ) ( not ( = ?auto_6828 ?auto_6823 ) ) ( HOIST-AT ?auto_6832 ?auto_6823 ) ( not ( = ?auto_6827 ?auto_6832 ) ) ( not ( = ?auto_6829 ?auto_6832 ) ) ( AVAILABLE ?auto_6832 ) ( SURFACE-AT ?auto_6821 ?auto_6823 ) ( ON ?auto_6821 ?auto_6830 ) ( CLEAR ?auto_6821 ) ( not ( = ?auto_6821 ?auto_6830 ) ) ( not ( = ?auto_6822 ?auto_6830 ) ) ( not ( = ?auto_6833 ?auto_6830 ) ) ( not ( = ?auto_6824 ?auto_6830 ) ) ( TRUCK-AT ?auto_6826 ?auto_6825 ) ( SURFACE-AT ?auto_6831 ?auto_6825 ) ( CLEAR ?auto_6831 ) ( IS-CRATE ?auto_6833 ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( not ( = ?auto_6821 ?auto_6831 ) ) ( not ( = ?auto_6822 ?auto_6831 ) ) ( not ( = ?auto_6824 ?auto_6831 ) ) ( not ( = ?auto_6830 ?auto_6831 ) ) ( AVAILABLE ?auto_6827 ) ( IN ?auto_6833 ?auto_6826 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6827 ?auto_6833 ?auto_6826 ?auto_6825 )
      ( MAKE-2CRATE ?auto_6833 ?auto_6821 ?auto_6822 )
      ( MAKE-1CRATE-VERIFY ?auto_6821 ?auto_6822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6834 - SURFACE
      ?auto_6835 - SURFACE
      ?auto_6836 - SURFACE
    )
    :vars
    (
      ?auto_6842 - HOIST
      ?auto_6846 - PLACE
      ?auto_6837 - PLACE
      ?auto_6845 - HOIST
      ?auto_6839 - SURFACE
      ?auto_6840 - PLACE
      ?auto_6841 - HOIST
      ?auto_6838 - SURFACE
      ?auto_6844 - TRUCK
      ?auto_6843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6842 ?auto_6846 ) ( IS-CRATE ?auto_6836 ) ( not ( = ?auto_6835 ?auto_6836 ) ) ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( not ( = ?auto_6837 ?auto_6846 ) ) ( HOIST-AT ?auto_6845 ?auto_6837 ) ( not ( = ?auto_6842 ?auto_6845 ) ) ( AVAILABLE ?auto_6845 ) ( SURFACE-AT ?auto_6836 ?auto_6837 ) ( ON ?auto_6836 ?auto_6839 ) ( CLEAR ?auto_6836 ) ( not ( = ?auto_6835 ?auto_6839 ) ) ( not ( = ?auto_6836 ?auto_6839 ) ) ( not ( = ?auto_6834 ?auto_6839 ) ) ( IS-CRATE ?auto_6835 ) ( not ( = ?auto_6840 ?auto_6846 ) ) ( not ( = ?auto_6837 ?auto_6840 ) ) ( HOIST-AT ?auto_6841 ?auto_6840 ) ( not ( = ?auto_6842 ?auto_6841 ) ) ( not ( = ?auto_6845 ?auto_6841 ) ) ( AVAILABLE ?auto_6841 ) ( SURFACE-AT ?auto_6835 ?auto_6840 ) ( ON ?auto_6835 ?auto_6838 ) ( CLEAR ?auto_6835 ) ( not ( = ?auto_6835 ?auto_6838 ) ) ( not ( = ?auto_6836 ?auto_6838 ) ) ( not ( = ?auto_6834 ?auto_6838 ) ) ( not ( = ?auto_6839 ?auto_6838 ) ) ( TRUCK-AT ?auto_6844 ?auto_6846 ) ( SURFACE-AT ?auto_6843 ?auto_6846 ) ( CLEAR ?auto_6843 ) ( IS-CRATE ?auto_6834 ) ( not ( = ?auto_6843 ?auto_6834 ) ) ( not ( = ?auto_6835 ?auto_6843 ) ) ( not ( = ?auto_6836 ?auto_6843 ) ) ( not ( = ?auto_6839 ?auto_6843 ) ) ( not ( = ?auto_6838 ?auto_6843 ) ) ( AVAILABLE ?auto_6842 ) ( IN ?auto_6834 ?auto_6844 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6835 ?auto_6836 )
      ( MAKE-2CRATE-VERIFY ?auto_6834 ?auto_6835 ?auto_6836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6847 - SURFACE
      ?auto_6848 - SURFACE
      ?auto_6849 - SURFACE
      ?auto_6850 - SURFACE
    )
    :vars
    (
      ?auto_6856 - HOIST
      ?auto_6854 - PLACE
      ?auto_6858 - PLACE
      ?auto_6851 - HOIST
      ?auto_6852 - SURFACE
      ?auto_6855 - PLACE
      ?auto_6857 - HOIST
      ?auto_6853 - SURFACE
      ?auto_6859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6856 ?auto_6854 ) ( IS-CRATE ?auto_6850 ) ( not ( = ?auto_6849 ?auto_6850 ) ) ( not ( = ?auto_6848 ?auto_6849 ) ) ( not ( = ?auto_6848 ?auto_6850 ) ) ( not ( = ?auto_6858 ?auto_6854 ) ) ( HOIST-AT ?auto_6851 ?auto_6858 ) ( not ( = ?auto_6856 ?auto_6851 ) ) ( AVAILABLE ?auto_6851 ) ( SURFACE-AT ?auto_6850 ?auto_6858 ) ( ON ?auto_6850 ?auto_6852 ) ( CLEAR ?auto_6850 ) ( not ( = ?auto_6849 ?auto_6852 ) ) ( not ( = ?auto_6850 ?auto_6852 ) ) ( not ( = ?auto_6848 ?auto_6852 ) ) ( IS-CRATE ?auto_6849 ) ( not ( = ?auto_6855 ?auto_6854 ) ) ( not ( = ?auto_6858 ?auto_6855 ) ) ( HOIST-AT ?auto_6857 ?auto_6855 ) ( not ( = ?auto_6856 ?auto_6857 ) ) ( not ( = ?auto_6851 ?auto_6857 ) ) ( AVAILABLE ?auto_6857 ) ( SURFACE-AT ?auto_6849 ?auto_6855 ) ( ON ?auto_6849 ?auto_6853 ) ( CLEAR ?auto_6849 ) ( not ( = ?auto_6849 ?auto_6853 ) ) ( not ( = ?auto_6850 ?auto_6853 ) ) ( not ( = ?auto_6848 ?auto_6853 ) ) ( not ( = ?auto_6852 ?auto_6853 ) ) ( TRUCK-AT ?auto_6859 ?auto_6854 ) ( SURFACE-AT ?auto_6847 ?auto_6854 ) ( CLEAR ?auto_6847 ) ( IS-CRATE ?auto_6848 ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( not ( = ?auto_6849 ?auto_6847 ) ) ( not ( = ?auto_6850 ?auto_6847 ) ) ( not ( = ?auto_6852 ?auto_6847 ) ) ( not ( = ?auto_6853 ?auto_6847 ) ) ( AVAILABLE ?auto_6856 ) ( IN ?auto_6848 ?auto_6859 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6848 ?auto_6849 ?auto_6850 )
      ( MAKE-3CRATE-VERIFY ?auto_6847 ?auto_6848 ?auto_6849 ?auto_6850 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6860 - SURFACE
      ?auto_6861 - SURFACE
      ?auto_6862 - SURFACE
      ?auto_6863 - SURFACE
      ?auto_6864 - SURFACE
    )
    :vars
    (
      ?auto_6870 - HOIST
      ?auto_6868 - PLACE
      ?auto_6872 - PLACE
      ?auto_6865 - HOIST
      ?auto_6866 - SURFACE
      ?auto_6869 - PLACE
      ?auto_6871 - HOIST
      ?auto_6867 - SURFACE
      ?auto_6873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6870 ?auto_6868 ) ( IS-CRATE ?auto_6864 ) ( not ( = ?auto_6863 ?auto_6864 ) ) ( not ( = ?auto_6862 ?auto_6863 ) ) ( not ( = ?auto_6862 ?auto_6864 ) ) ( not ( = ?auto_6872 ?auto_6868 ) ) ( HOIST-AT ?auto_6865 ?auto_6872 ) ( not ( = ?auto_6870 ?auto_6865 ) ) ( AVAILABLE ?auto_6865 ) ( SURFACE-AT ?auto_6864 ?auto_6872 ) ( ON ?auto_6864 ?auto_6866 ) ( CLEAR ?auto_6864 ) ( not ( = ?auto_6863 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6866 ) ) ( not ( = ?auto_6862 ?auto_6866 ) ) ( IS-CRATE ?auto_6863 ) ( not ( = ?auto_6869 ?auto_6868 ) ) ( not ( = ?auto_6872 ?auto_6869 ) ) ( HOIST-AT ?auto_6871 ?auto_6869 ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6865 ?auto_6871 ) ) ( AVAILABLE ?auto_6871 ) ( SURFACE-AT ?auto_6863 ?auto_6869 ) ( ON ?auto_6863 ?auto_6867 ) ( CLEAR ?auto_6863 ) ( not ( = ?auto_6863 ?auto_6867 ) ) ( not ( = ?auto_6864 ?auto_6867 ) ) ( not ( = ?auto_6862 ?auto_6867 ) ) ( not ( = ?auto_6866 ?auto_6867 ) ) ( TRUCK-AT ?auto_6873 ?auto_6868 ) ( SURFACE-AT ?auto_6861 ?auto_6868 ) ( CLEAR ?auto_6861 ) ( IS-CRATE ?auto_6862 ) ( not ( = ?auto_6861 ?auto_6862 ) ) ( not ( = ?auto_6863 ?auto_6861 ) ) ( not ( = ?auto_6864 ?auto_6861 ) ) ( not ( = ?auto_6866 ?auto_6861 ) ) ( not ( = ?auto_6867 ?auto_6861 ) ) ( AVAILABLE ?auto_6870 ) ( IN ?auto_6862 ?auto_6873 ) ( ON ?auto_6861 ?auto_6860 ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6862 ) ) ( not ( = ?auto_6860 ?auto_6863 ) ) ( not ( = ?auto_6860 ?auto_6864 ) ) ( not ( = ?auto_6860 ?auto_6866 ) ) ( not ( = ?auto_6860 ?auto_6867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6862 ?auto_6863 ?auto_6864 )
      ( MAKE-4CRATE-VERIFY ?auto_6860 ?auto_6861 ?auto_6862 ?auto_6863 ?auto_6864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6874 - SURFACE
      ?auto_6875 - SURFACE
    )
    :vars
    (
      ?auto_6882 - HOIST
      ?auto_6879 - PLACE
      ?auto_6886 - SURFACE
      ?auto_6884 - PLACE
      ?auto_6876 - HOIST
      ?auto_6877 - SURFACE
      ?auto_6880 - PLACE
      ?auto_6883 - HOIST
      ?auto_6878 - SURFACE
      ?auto_6881 - SURFACE
      ?auto_6885 - TRUCK
      ?auto_6887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6882 ?auto_6879 ) ( IS-CRATE ?auto_6875 ) ( not ( = ?auto_6874 ?auto_6875 ) ) ( not ( = ?auto_6886 ?auto_6874 ) ) ( not ( = ?auto_6886 ?auto_6875 ) ) ( not ( = ?auto_6884 ?auto_6879 ) ) ( HOIST-AT ?auto_6876 ?auto_6884 ) ( not ( = ?auto_6882 ?auto_6876 ) ) ( AVAILABLE ?auto_6876 ) ( SURFACE-AT ?auto_6875 ?auto_6884 ) ( ON ?auto_6875 ?auto_6877 ) ( CLEAR ?auto_6875 ) ( not ( = ?auto_6874 ?auto_6877 ) ) ( not ( = ?auto_6875 ?auto_6877 ) ) ( not ( = ?auto_6886 ?auto_6877 ) ) ( IS-CRATE ?auto_6874 ) ( not ( = ?auto_6880 ?auto_6879 ) ) ( not ( = ?auto_6884 ?auto_6880 ) ) ( HOIST-AT ?auto_6883 ?auto_6880 ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( not ( = ?auto_6876 ?auto_6883 ) ) ( AVAILABLE ?auto_6883 ) ( SURFACE-AT ?auto_6874 ?auto_6880 ) ( ON ?auto_6874 ?auto_6878 ) ( CLEAR ?auto_6874 ) ( not ( = ?auto_6874 ?auto_6878 ) ) ( not ( = ?auto_6875 ?auto_6878 ) ) ( not ( = ?auto_6886 ?auto_6878 ) ) ( not ( = ?auto_6877 ?auto_6878 ) ) ( SURFACE-AT ?auto_6881 ?auto_6879 ) ( CLEAR ?auto_6881 ) ( IS-CRATE ?auto_6886 ) ( not ( = ?auto_6881 ?auto_6886 ) ) ( not ( = ?auto_6874 ?auto_6881 ) ) ( not ( = ?auto_6875 ?auto_6881 ) ) ( not ( = ?auto_6877 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( AVAILABLE ?auto_6882 ) ( IN ?auto_6886 ?auto_6885 ) ( TRUCK-AT ?auto_6885 ?auto_6887 ) ( not ( = ?auto_6887 ?auto_6879 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6880 ?auto_6887 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6885 ?auto_6887 ?auto_6879 )
      ( MAKE-2CRATE ?auto_6886 ?auto_6874 ?auto_6875 )
      ( MAKE-1CRATE-VERIFY ?auto_6874 ?auto_6875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6888 - SURFACE
      ?auto_6889 - SURFACE
      ?auto_6890 - SURFACE
    )
    :vars
    (
      ?auto_6899 - HOIST
      ?auto_6896 - PLACE
      ?auto_6894 - PLACE
      ?auto_6901 - HOIST
      ?auto_6891 - SURFACE
      ?auto_6892 - PLACE
      ?auto_6897 - HOIST
      ?auto_6895 - SURFACE
      ?auto_6898 - SURFACE
      ?auto_6893 - TRUCK
      ?auto_6900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6899 ?auto_6896 ) ( IS-CRATE ?auto_6890 ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6890 ) ) ( not ( = ?auto_6894 ?auto_6896 ) ) ( HOIST-AT ?auto_6901 ?auto_6894 ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( AVAILABLE ?auto_6901 ) ( SURFACE-AT ?auto_6890 ?auto_6894 ) ( ON ?auto_6890 ?auto_6891 ) ( CLEAR ?auto_6890 ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6888 ?auto_6891 ) ) ( IS-CRATE ?auto_6889 ) ( not ( = ?auto_6892 ?auto_6896 ) ) ( not ( = ?auto_6894 ?auto_6892 ) ) ( HOIST-AT ?auto_6897 ?auto_6892 ) ( not ( = ?auto_6899 ?auto_6897 ) ) ( not ( = ?auto_6901 ?auto_6897 ) ) ( AVAILABLE ?auto_6897 ) ( SURFACE-AT ?auto_6889 ?auto_6892 ) ( ON ?auto_6889 ?auto_6895 ) ( CLEAR ?auto_6889 ) ( not ( = ?auto_6889 ?auto_6895 ) ) ( not ( = ?auto_6890 ?auto_6895 ) ) ( not ( = ?auto_6888 ?auto_6895 ) ) ( not ( = ?auto_6891 ?auto_6895 ) ) ( SURFACE-AT ?auto_6898 ?auto_6896 ) ( CLEAR ?auto_6898 ) ( IS-CRATE ?auto_6888 ) ( not ( = ?auto_6898 ?auto_6888 ) ) ( not ( = ?auto_6889 ?auto_6898 ) ) ( not ( = ?auto_6890 ?auto_6898 ) ) ( not ( = ?auto_6891 ?auto_6898 ) ) ( not ( = ?auto_6895 ?auto_6898 ) ) ( AVAILABLE ?auto_6899 ) ( IN ?auto_6888 ?auto_6893 ) ( TRUCK-AT ?auto_6893 ?auto_6900 ) ( not ( = ?auto_6900 ?auto_6896 ) ) ( not ( = ?auto_6894 ?auto_6900 ) ) ( not ( = ?auto_6892 ?auto_6900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6889 ?auto_6890 )
      ( MAKE-2CRATE-VERIFY ?auto_6888 ?auto_6889 ?auto_6890 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6902 - SURFACE
      ?auto_6903 - SURFACE
      ?auto_6904 - SURFACE
      ?auto_6905 - SURFACE
    )
    :vars
    (
      ?auto_6910 - HOIST
      ?auto_6909 - PLACE
      ?auto_6912 - PLACE
      ?auto_6911 - HOIST
      ?auto_6913 - SURFACE
      ?auto_6906 - PLACE
      ?auto_6908 - HOIST
      ?auto_6907 - SURFACE
      ?auto_6915 - TRUCK
      ?auto_6914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6910 ?auto_6909 ) ( IS-CRATE ?auto_6905 ) ( not ( = ?auto_6904 ?auto_6905 ) ) ( not ( = ?auto_6903 ?auto_6904 ) ) ( not ( = ?auto_6903 ?auto_6905 ) ) ( not ( = ?auto_6912 ?auto_6909 ) ) ( HOIST-AT ?auto_6911 ?auto_6912 ) ( not ( = ?auto_6910 ?auto_6911 ) ) ( AVAILABLE ?auto_6911 ) ( SURFACE-AT ?auto_6905 ?auto_6912 ) ( ON ?auto_6905 ?auto_6913 ) ( CLEAR ?auto_6905 ) ( not ( = ?auto_6904 ?auto_6913 ) ) ( not ( = ?auto_6905 ?auto_6913 ) ) ( not ( = ?auto_6903 ?auto_6913 ) ) ( IS-CRATE ?auto_6904 ) ( not ( = ?auto_6906 ?auto_6909 ) ) ( not ( = ?auto_6912 ?auto_6906 ) ) ( HOIST-AT ?auto_6908 ?auto_6906 ) ( not ( = ?auto_6910 ?auto_6908 ) ) ( not ( = ?auto_6911 ?auto_6908 ) ) ( AVAILABLE ?auto_6908 ) ( SURFACE-AT ?auto_6904 ?auto_6906 ) ( ON ?auto_6904 ?auto_6907 ) ( CLEAR ?auto_6904 ) ( not ( = ?auto_6904 ?auto_6907 ) ) ( not ( = ?auto_6905 ?auto_6907 ) ) ( not ( = ?auto_6903 ?auto_6907 ) ) ( not ( = ?auto_6913 ?auto_6907 ) ) ( SURFACE-AT ?auto_6902 ?auto_6909 ) ( CLEAR ?auto_6902 ) ( IS-CRATE ?auto_6903 ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( not ( = ?auto_6904 ?auto_6902 ) ) ( not ( = ?auto_6905 ?auto_6902 ) ) ( not ( = ?auto_6913 ?auto_6902 ) ) ( not ( = ?auto_6907 ?auto_6902 ) ) ( AVAILABLE ?auto_6910 ) ( IN ?auto_6903 ?auto_6915 ) ( TRUCK-AT ?auto_6915 ?auto_6914 ) ( not ( = ?auto_6914 ?auto_6909 ) ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6906 ?auto_6914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6903 ?auto_6904 ?auto_6905 )
      ( MAKE-3CRATE-VERIFY ?auto_6902 ?auto_6903 ?auto_6904 ?auto_6905 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6916 - SURFACE
      ?auto_6917 - SURFACE
      ?auto_6918 - SURFACE
      ?auto_6919 - SURFACE
      ?auto_6920 - SURFACE
    )
    :vars
    (
      ?auto_6925 - HOIST
      ?auto_6924 - PLACE
      ?auto_6927 - PLACE
      ?auto_6926 - HOIST
      ?auto_6928 - SURFACE
      ?auto_6921 - PLACE
      ?auto_6923 - HOIST
      ?auto_6922 - SURFACE
      ?auto_6930 - TRUCK
      ?auto_6929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6925 ?auto_6924 ) ( IS-CRATE ?auto_6920 ) ( not ( = ?auto_6919 ?auto_6920 ) ) ( not ( = ?auto_6918 ?auto_6919 ) ) ( not ( = ?auto_6918 ?auto_6920 ) ) ( not ( = ?auto_6927 ?auto_6924 ) ) ( HOIST-AT ?auto_6926 ?auto_6927 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( AVAILABLE ?auto_6926 ) ( SURFACE-AT ?auto_6920 ?auto_6927 ) ( ON ?auto_6920 ?auto_6928 ) ( CLEAR ?auto_6920 ) ( not ( = ?auto_6919 ?auto_6928 ) ) ( not ( = ?auto_6920 ?auto_6928 ) ) ( not ( = ?auto_6918 ?auto_6928 ) ) ( IS-CRATE ?auto_6919 ) ( not ( = ?auto_6921 ?auto_6924 ) ) ( not ( = ?auto_6927 ?auto_6921 ) ) ( HOIST-AT ?auto_6923 ?auto_6921 ) ( not ( = ?auto_6925 ?auto_6923 ) ) ( not ( = ?auto_6926 ?auto_6923 ) ) ( AVAILABLE ?auto_6923 ) ( SURFACE-AT ?auto_6919 ?auto_6921 ) ( ON ?auto_6919 ?auto_6922 ) ( CLEAR ?auto_6919 ) ( not ( = ?auto_6919 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6918 ?auto_6922 ) ) ( not ( = ?auto_6928 ?auto_6922 ) ) ( SURFACE-AT ?auto_6917 ?auto_6924 ) ( CLEAR ?auto_6917 ) ( IS-CRATE ?auto_6918 ) ( not ( = ?auto_6917 ?auto_6918 ) ) ( not ( = ?auto_6919 ?auto_6917 ) ) ( not ( = ?auto_6920 ?auto_6917 ) ) ( not ( = ?auto_6928 ?auto_6917 ) ) ( not ( = ?auto_6922 ?auto_6917 ) ) ( AVAILABLE ?auto_6925 ) ( IN ?auto_6918 ?auto_6930 ) ( TRUCK-AT ?auto_6930 ?auto_6929 ) ( not ( = ?auto_6929 ?auto_6924 ) ) ( not ( = ?auto_6927 ?auto_6929 ) ) ( not ( = ?auto_6921 ?auto_6929 ) ) ( ON ?auto_6917 ?auto_6916 ) ( not ( = ?auto_6916 ?auto_6917 ) ) ( not ( = ?auto_6916 ?auto_6918 ) ) ( not ( = ?auto_6916 ?auto_6919 ) ) ( not ( = ?auto_6916 ?auto_6920 ) ) ( not ( = ?auto_6916 ?auto_6928 ) ) ( not ( = ?auto_6916 ?auto_6922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6918 ?auto_6919 ?auto_6920 )
      ( MAKE-4CRATE-VERIFY ?auto_6916 ?auto_6917 ?auto_6918 ?auto_6919 ?auto_6920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6931 - SURFACE
      ?auto_6932 - SURFACE
    )
    :vars
    (
      ?auto_6938 - HOIST
      ?auto_6937 - PLACE
      ?auto_6944 - SURFACE
      ?auto_6940 - PLACE
      ?auto_6939 - HOIST
      ?auto_6941 - SURFACE
      ?auto_6933 - PLACE
      ?auto_6936 - HOIST
      ?auto_6935 - SURFACE
      ?auto_6934 - SURFACE
      ?auto_6943 - TRUCK
      ?auto_6942 - PLACE
      ?auto_6945 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6938 ?auto_6937 ) ( IS-CRATE ?auto_6932 ) ( not ( = ?auto_6931 ?auto_6932 ) ) ( not ( = ?auto_6944 ?auto_6931 ) ) ( not ( = ?auto_6944 ?auto_6932 ) ) ( not ( = ?auto_6940 ?auto_6937 ) ) ( HOIST-AT ?auto_6939 ?auto_6940 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( AVAILABLE ?auto_6939 ) ( SURFACE-AT ?auto_6932 ?auto_6940 ) ( ON ?auto_6932 ?auto_6941 ) ( CLEAR ?auto_6932 ) ( not ( = ?auto_6931 ?auto_6941 ) ) ( not ( = ?auto_6932 ?auto_6941 ) ) ( not ( = ?auto_6944 ?auto_6941 ) ) ( IS-CRATE ?auto_6931 ) ( not ( = ?auto_6933 ?auto_6937 ) ) ( not ( = ?auto_6940 ?auto_6933 ) ) ( HOIST-AT ?auto_6936 ?auto_6933 ) ( not ( = ?auto_6938 ?auto_6936 ) ) ( not ( = ?auto_6939 ?auto_6936 ) ) ( AVAILABLE ?auto_6936 ) ( SURFACE-AT ?auto_6931 ?auto_6933 ) ( ON ?auto_6931 ?auto_6935 ) ( CLEAR ?auto_6931 ) ( not ( = ?auto_6931 ?auto_6935 ) ) ( not ( = ?auto_6932 ?auto_6935 ) ) ( not ( = ?auto_6944 ?auto_6935 ) ) ( not ( = ?auto_6941 ?auto_6935 ) ) ( SURFACE-AT ?auto_6934 ?auto_6937 ) ( CLEAR ?auto_6934 ) ( IS-CRATE ?auto_6944 ) ( not ( = ?auto_6934 ?auto_6944 ) ) ( not ( = ?auto_6931 ?auto_6934 ) ) ( not ( = ?auto_6932 ?auto_6934 ) ) ( not ( = ?auto_6941 ?auto_6934 ) ) ( not ( = ?auto_6935 ?auto_6934 ) ) ( AVAILABLE ?auto_6938 ) ( TRUCK-AT ?auto_6943 ?auto_6942 ) ( not ( = ?auto_6942 ?auto_6937 ) ) ( not ( = ?auto_6940 ?auto_6942 ) ) ( not ( = ?auto_6933 ?auto_6942 ) ) ( HOIST-AT ?auto_6945 ?auto_6942 ) ( LIFTING ?auto_6945 ?auto_6944 ) ( not ( = ?auto_6938 ?auto_6945 ) ) ( not ( = ?auto_6939 ?auto_6945 ) ) ( not ( = ?auto_6936 ?auto_6945 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6945 ?auto_6944 ?auto_6943 ?auto_6942 )
      ( MAKE-2CRATE ?auto_6944 ?auto_6931 ?auto_6932 )
      ( MAKE-1CRATE-VERIFY ?auto_6931 ?auto_6932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6946 - SURFACE
      ?auto_6947 - SURFACE
      ?auto_6948 - SURFACE
    )
    :vars
    (
      ?auto_6956 - HOIST
      ?auto_6952 - PLACE
      ?auto_6951 - PLACE
      ?auto_6958 - HOIST
      ?auto_6955 - SURFACE
      ?auto_6950 - PLACE
      ?auto_6957 - HOIST
      ?auto_6949 - SURFACE
      ?auto_6960 - SURFACE
      ?auto_6953 - TRUCK
      ?auto_6954 - PLACE
      ?auto_6959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6956 ?auto_6952 ) ( IS-CRATE ?auto_6948 ) ( not ( = ?auto_6947 ?auto_6948 ) ) ( not ( = ?auto_6946 ?auto_6947 ) ) ( not ( = ?auto_6946 ?auto_6948 ) ) ( not ( = ?auto_6951 ?auto_6952 ) ) ( HOIST-AT ?auto_6958 ?auto_6951 ) ( not ( = ?auto_6956 ?auto_6958 ) ) ( AVAILABLE ?auto_6958 ) ( SURFACE-AT ?auto_6948 ?auto_6951 ) ( ON ?auto_6948 ?auto_6955 ) ( CLEAR ?auto_6948 ) ( not ( = ?auto_6947 ?auto_6955 ) ) ( not ( = ?auto_6948 ?auto_6955 ) ) ( not ( = ?auto_6946 ?auto_6955 ) ) ( IS-CRATE ?auto_6947 ) ( not ( = ?auto_6950 ?auto_6952 ) ) ( not ( = ?auto_6951 ?auto_6950 ) ) ( HOIST-AT ?auto_6957 ?auto_6950 ) ( not ( = ?auto_6956 ?auto_6957 ) ) ( not ( = ?auto_6958 ?auto_6957 ) ) ( AVAILABLE ?auto_6957 ) ( SURFACE-AT ?auto_6947 ?auto_6950 ) ( ON ?auto_6947 ?auto_6949 ) ( CLEAR ?auto_6947 ) ( not ( = ?auto_6947 ?auto_6949 ) ) ( not ( = ?auto_6948 ?auto_6949 ) ) ( not ( = ?auto_6946 ?auto_6949 ) ) ( not ( = ?auto_6955 ?auto_6949 ) ) ( SURFACE-AT ?auto_6960 ?auto_6952 ) ( CLEAR ?auto_6960 ) ( IS-CRATE ?auto_6946 ) ( not ( = ?auto_6960 ?auto_6946 ) ) ( not ( = ?auto_6947 ?auto_6960 ) ) ( not ( = ?auto_6948 ?auto_6960 ) ) ( not ( = ?auto_6955 ?auto_6960 ) ) ( not ( = ?auto_6949 ?auto_6960 ) ) ( AVAILABLE ?auto_6956 ) ( TRUCK-AT ?auto_6953 ?auto_6954 ) ( not ( = ?auto_6954 ?auto_6952 ) ) ( not ( = ?auto_6951 ?auto_6954 ) ) ( not ( = ?auto_6950 ?auto_6954 ) ) ( HOIST-AT ?auto_6959 ?auto_6954 ) ( LIFTING ?auto_6959 ?auto_6946 ) ( not ( = ?auto_6956 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) ( not ( = ?auto_6957 ?auto_6959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6947 ?auto_6948 )
      ( MAKE-2CRATE-VERIFY ?auto_6946 ?auto_6947 ?auto_6948 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6961 - SURFACE
      ?auto_6962 - SURFACE
      ?auto_6963 - SURFACE
      ?auto_6964 - SURFACE
    )
    :vars
    (
      ?auto_6973 - HOIST
      ?auto_6974 - PLACE
      ?auto_6972 - PLACE
      ?auto_6969 - HOIST
      ?auto_6966 - SURFACE
      ?auto_6975 - PLACE
      ?auto_6971 - HOIST
      ?auto_6970 - SURFACE
      ?auto_6967 - TRUCK
      ?auto_6965 - PLACE
      ?auto_6968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6973 ?auto_6974 ) ( IS-CRATE ?auto_6964 ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6972 ?auto_6974 ) ) ( HOIST-AT ?auto_6969 ?auto_6972 ) ( not ( = ?auto_6973 ?auto_6969 ) ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6964 ?auto_6972 ) ( ON ?auto_6964 ?auto_6966 ) ( CLEAR ?auto_6964 ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( not ( = ?auto_6962 ?auto_6966 ) ) ( IS-CRATE ?auto_6963 ) ( not ( = ?auto_6975 ?auto_6974 ) ) ( not ( = ?auto_6972 ?auto_6975 ) ) ( HOIST-AT ?auto_6971 ?auto_6975 ) ( not ( = ?auto_6973 ?auto_6971 ) ) ( not ( = ?auto_6969 ?auto_6971 ) ) ( AVAILABLE ?auto_6971 ) ( SURFACE-AT ?auto_6963 ?auto_6975 ) ( ON ?auto_6963 ?auto_6970 ) ( CLEAR ?auto_6963 ) ( not ( = ?auto_6963 ?auto_6970 ) ) ( not ( = ?auto_6964 ?auto_6970 ) ) ( not ( = ?auto_6962 ?auto_6970 ) ) ( not ( = ?auto_6966 ?auto_6970 ) ) ( SURFACE-AT ?auto_6961 ?auto_6974 ) ( CLEAR ?auto_6961 ) ( IS-CRATE ?auto_6962 ) ( not ( = ?auto_6961 ?auto_6962 ) ) ( not ( = ?auto_6963 ?auto_6961 ) ) ( not ( = ?auto_6964 ?auto_6961 ) ) ( not ( = ?auto_6966 ?auto_6961 ) ) ( not ( = ?auto_6970 ?auto_6961 ) ) ( AVAILABLE ?auto_6973 ) ( TRUCK-AT ?auto_6967 ?auto_6965 ) ( not ( = ?auto_6965 ?auto_6974 ) ) ( not ( = ?auto_6972 ?auto_6965 ) ) ( not ( = ?auto_6975 ?auto_6965 ) ) ( HOIST-AT ?auto_6968 ?auto_6965 ) ( LIFTING ?auto_6968 ?auto_6962 ) ( not ( = ?auto_6973 ?auto_6968 ) ) ( not ( = ?auto_6969 ?auto_6968 ) ) ( not ( = ?auto_6971 ?auto_6968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6962 ?auto_6963 ?auto_6964 )
      ( MAKE-3CRATE-VERIFY ?auto_6961 ?auto_6962 ?auto_6963 ?auto_6964 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6976 - SURFACE
      ?auto_6977 - SURFACE
      ?auto_6978 - SURFACE
      ?auto_6979 - SURFACE
      ?auto_6980 - SURFACE
    )
    :vars
    (
      ?auto_6989 - HOIST
      ?auto_6990 - PLACE
      ?auto_6988 - PLACE
      ?auto_6985 - HOIST
      ?auto_6982 - SURFACE
      ?auto_6991 - PLACE
      ?auto_6987 - HOIST
      ?auto_6986 - SURFACE
      ?auto_6983 - TRUCK
      ?auto_6981 - PLACE
      ?auto_6984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6989 ?auto_6990 ) ( IS-CRATE ?auto_6980 ) ( not ( = ?auto_6979 ?auto_6980 ) ) ( not ( = ?auto_6978 ?auto_6979 ) ) ( not ( = ?auto_6978 ?auto_6980 ) ) ( not ( = ?auto_6988 ?auto_6990 ) ) ( HOIST-AT ?auto_6985 ?auto_6988 ) ( not ( = ?auto_6989 ?auto_6985 ) ) ( AVAILABLE ?auto_6985 ) ( SURFACE-AT ?auto_6980 ?auto_6988 ) ( ON ?auto_6980 ?auto_6982 ) ( CLEAR ?auto_6980 ) ( not ( = ?auto_6979 ?auto_6982 ) ) ( not ( = ?auto_6980 ?auto_6982 ) ) ( not ( = ?auto_6978 ?auto_6982 ) ) ( IS-CRATE ?auto_6979 ) ( not ( = ?auto_6991 ?auto_6990 ) ) ( not ( = ?auto_6988 ?auto_6991 ) ) ( HOIST-AT ?auto_6987 ?auto_6991 ) ( not ( = ?auto_6989 ?auto_6987 ) ) ( not ( = ?auto_6985 ?auto_6987 ) ) ( AVAILABLE ?auto_6987 ) ( SURFACE-AT ?auto_6979 ?auto_6991 ) ( ON ?auto_6979 ?auto_6986 ) ( CLEAR ?auto_6979 ) ( not ( = ?auto_6979 ?auto_6986 ) ) ( not ( = ?auto_6980 ?auto_6986 ) ) ( not ( = ?auto_6978 ?auto_6986 ) ) ( not ( = ?auto_6982 ?auto_6986 ) ) ( SURFACE-AT ?auto_6977 ?auto_6990 ) ( CLEAR ?auto_6977 ) ( IS-CRATE ?auto_6978 ) ( not ( = ?auto_6977 ?auto_6978 ) ) ( not ( = ?auto_6979 ?auto_6977 ) ) ( not ( = ?auto_6980 ?auto_6977 ) ) ( not ( = ?auto_6982 ?auto_6977 ) ) ( not ( = ?auto_6986 ?auto_6977 ) ) ( AVAILABLE ?auto_6989 ) ( TRUCK-AT ?auto_6983 ?auto_6981 ) ( not ( = ?auto_6981 ?auto_6990 ) ) ( not ( = ?auto_6988 ?auto_6981 ) ) ( not ( = ?auto_6991 ?auto_6981 ) ) ( HOIST-AT ?auto_6984 ?auto_6981 ) ( LIFTING ?auto_6984 ?auto_6978 ) ( not ( = ?auto_6989 ?auto_6984 ) ) ( not ( = ?auto_6985 ?auto_6984 ) ) ( not ( = ?auto_6987 ?auto_6984 ) ) ( ON ?auto_6977 ?auto_6976 ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6976 ?auto_6978 ) ) ( not ( = ?auto_6976 ?auto_6979 ) ) ( not ( = ?auto_6976 ?auto_6980 ) ) ( not ( = ?auto_6976 ?auto_6982 ) ) ( not ( = ?auto_6976 ?auto_6986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6978 ?auto_6979 ?auto_6980 )
      ( MAKE-4CRATE-VERIFY ?auto_6976 ?auto_6977 ?auto_6978 ?auto_6979 ?auto_6980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6992 - SURFACE
      ?auto_6993 - SURFACE
    )
    :vars
    (
      ?auto_7002 - HOIST
      ?auto_7004 - PLACE
      ?auto_7006 - SURFACE
      ?auto_7001 - PLACE
      ?auto_6998 - HOIST
      ?auto_6995 - SURFACE
      ?auto_7005 - PLACE
      ?auto_7000 - HOIST
      ?auto_6999 - SURFACE
      ?auto_7003 - SURFACE
      ?auto_6996 - TRUCK
      ?auto_6994 - PLACE
      ?auto_6997 - HOIST
      ?auto_7007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7002 ?auto_7004 ) ( IS-CRATE ?auto_6993 ) ( not ( = ?auto_6992 ?auto_6993 ) ) ( not ( = ?auto_7006 ?auto_6992 ) ) ( not ( = ?auto_7006 ?auto_6993 ) ) ( not ( = ?auto_7001 ?auto_7004 ) ) ( HOIST-AT ?auto_6998 ?auto_7001 ) ( not ( = ?auto_7002 ?auto_6998 ) ) ( AVAILABLE ?auto_6998 ) ( SURFACE-AT ?auto_6993 ?auto_7001 ) ( ON ?auto_6993 ?auto_6995 ) ( CLEAR ?auto_6993 ) ( not ( = ?auto_6992 ?auto_6995 ) ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( not ( = ?auto_7006 ?auto_6995 ) ) ( IS-CRATE ?auto_6992 ) ( not ( = ?auto_7005 ?auto_7004 ) ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( HOIST-AT ?auto_7000 ?auto_7005 ) ( not ( = ?auto_7002 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( AVAILABLE ?auto_7000 ) ( SURFACE-AT ?auto_6992 ?auto_7005 ) ( ON ?auto_6992 ?auto_6999 ) ( CLEAR ?auto_6992 ) ( not ( = ?auto_6992 ?auto_6999 ) ) ( not ( = ?auto_6993 ?auto_6999 ) ) ( not ( = ?auto_7006 ?auto_6999 ) ) ( not ( = ?auto_6995 ?auto_6999 ) ) ( SURFACE-AT ?auto_7003 ?auto_7004 ) ( CLEAR ?auto_7003 ) ( IS-CRATE ?auto_7006 ) ( not ( = ?auto_7003 ?auto_7006 ) ) ( not ( = ?auto_6992 ?auto_7003 ) ) ( not ( = ?auto_6993 ?auto_7003 ) ) ( not ( = ?auto_6995 ?auto_7003 ) ) ( not ( = ?auto_6999 ?auto_7003 ) ) ( AVAILABLE ?auto_7002 ) ( TRUCK-AT ?auto_6996 ?auto_6994 ) ( not ( = ?auto_6994 ?auto_7004 ) ) ( not ( = ?auto_7001 ?auto_6994 ) ) ( not ( = ?auto_7005 ?auto_6994 ) ) ( HOIST-AT ?auto_6997 ?auto_6994 ) ( not ( = ?auto_7002 ?auto_6997 ) ) ( not ( = ?auto_6998 ?auto_6997 ) ) ( not ( = ?auto_7000 ?auto_6997 ) ) ( AVAILABLE ?auto_6997 ) ( SURFACE-AT ?auto_7006 ?auto_6994 ) ( ON ?auto_7006 ?auto_7007 ) ( CLEAR ?auto_7006 ) ( not ( = ?auto_6992 ?auto_7007 ) ) ( not ( = ?auto_6993 ?auto_7007 ) ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( not ( = ?auto_6995 ?auto_7007 ) ) ( not ( = ?auto_6999 ?auto_7007 ) ) ( not ( = ?auto_7003 ?auto_7007 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6997 ?auto_7006 ?auto_7007 ?auto_6994 )
      ( MAKE-2CRATE ?auto_7006 ?auto_6992 ?auto_6993 )
      ( MAKE-1CRATE-VERIFY ?auto_6992 ?auto_6993 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7008 - SURFACE
      ?auto_7009 - SURFACE
      ?auto_7010 - SURFACE
    )
    :vars
    (
      ?auto_7012 - HOIST
      ?auto_7013 - PLACE
      ?auto_7011 - PLACE
      ?auto_7014 - HOIST
      ?auto_7016 - SURFACE
      ?auto_7017 - PLACE
      ?auto_7020 - HOIST
      ?auto_7019 - SURFACE
      ?auto_7015 - SURFACE
      ?auto_7022 - TRUCK
      ?auto_7023 - PLACE
      ?auto_7018 - HOIST
      ?auto_7021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7012 ?auto_7013 ) ( IS-CRATE ?auto_7010 ) ( not ( = ?auto_7009 ?auto_7010 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( not ( = ?auto_7008 ?auto_7010 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) ( HOIST-AT ?auto_7014 ?auto_7011 ) ( not ( = ?auto_7012 ?auto_7014 ) ) ( AVAILABLE ?auto_7014 ) ( SURFACE-AT ?auto_7010 ?auto_7011 ) ( ON ?auto_7010 ?auto_7016 ) ( CLEAR ?auto_7010 ) ( not ( = ?auto_7009 ?auto_7016 ) ) ( not ( = ?auto_7010 ?auto_7016 ) ) ( not ( = ?auto_7008 ?auto_7016 ) ) ( IS-CRATE ?auto_7009 ) ( not ( = ?auto_7017 ?auto_7013 ) ) ( not ( = ?auto_7011 ?auto_7017 ) ) ( HOIST-AT ?auto_7020 ?auto_7017 ) ( not ( = ?auto_7012 ?auto_7020 ) ) ( not ( = ?auto_7014 ?auto_7020 ) ) ( AVAILABLE ?auto_7020 ) ( SURFACE-AT ?auto_7009 ?auto_7017 ) ( ON ?auto_7009 ?auto_7019 ) ( CLEAR ?auto_7009 ) ( not ( = ?auto_7009 ?auto_7019 ) ) ( not ( = ?auto_7010 ?auto_7019 ) ) ( not ( = ?auto_7008 ?auto_7019 ) ) ( not ( = ?auto_7016 ?auto_7019 ) ) ( SURFACE-AT ?auto_7015 ?auto_7013 ) ( CLEAR ?auto_7015 ) ( IS-CRATE ?auto_7008 ) ( not ( = ?auto_7015 ?auto_7008 ) ) ( not ( = ?auto_7009 ?auto_7015 ) ) ( not ( = ?auto_7010 ?auto_7015 ) ) ( not ( = ?auto_7016 ?auto_7015 ) ) ( not ( = ?auto_7019 ?auto_7015 ) ) ( AVAILABLE ?auto_7012 ) ( TRUCK-AT ?auto_7022 ?auto_7023 ) ( not ( = ?auto_7023 ?auto_7013 ) ) ( not ( = ?auto_7011 ?auto_7023 ) ) ( not ( = ?auto_7017 ?auto_7023 ) ) ( HOIST-AT ?auto_7018 ?auto_7023 ) ( not ( = ?auto_7012 ?auto_7018 ) ) ( not ( = ?auto_7014 ?auto_7018 ) ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( AVAILABLE ?auto_7018 ) ( SURFACE-AT ?auto_7008 ?auto_7023 ) ( ON ?auto_7008 ?auto_7021 ) ( CLEAR ?auto_7008 ) ( not ( = ?auto_7009 ?auto_7021 ) ) ( not ( = ?auto_7010 ?auto_7021 ) ) ( not ( = ?auto_7008 ?auto_7021 ) ) ( not ( = ?auto_7016 ?auto_7021 ) ) ( not ( = ?auto_7019 ?auto_7021 ) ) ( not ( = ?auto_7015 ?auto_7021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7009 ?auto_7010 )
      ( MAKE-2CRATE-VERIFY ?auto_7008 ?auto_7009 ?auto_7010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7024 - SURFACE
      ?auto_7025 - SURFACE
      ?auto_7026 - SURFACE
      ?auto_7027 - SURFACE
    )
    :vars
    (
      ?auto_7037 - HOIST
      ?auto_7039 - PLACE
      ?auto_7032 - PLACE
      ?auto_7035 - HOIST
      ?auto_7036 - SURFACE
      ?auto_7028 - PLACE
      ?auto_7029 - HOIST
      ?auto_7038 - SURFACE
      ?auto_7031 - TRUCK
      ?auto_7033 - PLACE
      ?auto_7034 - HOIST
      ?auto_7030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7037 ?auto_7039 ) ( IS-CRATE ?auto_7027 ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( not ( = ?auto_7032 ?auto_7039 ) ) ( HOIST-AT ?auto_7035 ?auto_7032 ) ( not ( = ?auto_7037 ?auto_7035 ) ) ( AVAILABLE ?auto_7035 ) ( SURFACE-AT ?auto_7027 ?auto_7032 ) ( ON ?auto_7027 ?auto_7036 ) ( CLEAR ?auto_7027 ) ( not ( = ?auto_7026 ?auto_7036 ) ) ( not ( = ?auto_7027 ?auto_7036 ) ) ( not ( = ?auto_7025 ?auto_7036 ) ) ( IS-CRATE ?auto_7026 ) ( not ( = ?auto_7028 ?auto_7039 ) ) ( not ( = ?auto_7032 ?auto_7028 ) ) ( HOIST-AT ?auto_7029 ?auto_7028 ) ( not ( = ?auto_7037 ?auto_7029 ) ) ( not ( = ?auto_7035 ?auto_7029 ) ) ( AVAILABLE ?auto_7029 ) ( SURFACE-AT ?auto_7026 ?auto_7028 ) ( ON ?auto_7026 ?auto_7038 ) ( CLEAR ?auto_7026 ) ( not ( = ?auto_7026 ?auto_7038 ) ) ( not ( = ?auto_7027 ?auto_7038 ) ) ( not ( = ?auto_7025 ?auto_7038 ) ) ( not ( = ?auto_7036 ?auto_7038 ) ) ( SURFACE-AT ?auto_7024 ?auto_7039 ) ( CLEAR ?auto_7024 ) ( IS-CRATE ?auto_7025 ) ( not ( = ?auto_7024 ?auto_7025 ) ) ( not ( = ?auto_7026 ?auto_7024 ) ) ( not ( = ?auto_7027 ?auto_7024 ) ) ( not ( = ?auto_7036 ?auto_7024 ) ) ( not ( = ?auto_7038 ?auto_7024 ) ) ( AVAILABLE ?auto_7037 ) ( TRUCK-AT ?auto_7031 ?auto_7033 ) ( not ( = ?auto_7033 ?auto_7039 ) ) ( not ( = ?auto_7032 ?auto_7033 ) ) ( not ( = ?auto_7028 ?auto_7033 ) ) ( HOIST-AT ?auto_7034 ?auto_7033 ) ( not ( = ?auto_7037 ?auto_7034 ) ) ( not ( = ?auto_7035 ?auto_7034 ) ) ( not ( = ?auto_7029 ?auto_7034 ) ) ( AVAILABLE ?auto_7034 ) ( SURFACE-AT ?auto_7025 ?auto_7033 ) ( ON ?auto_7025 ?auto_7030 ) ( CLEAR ?auto_7025 ) ( not ( = ?auto_7026 ?auto_7030 ) ) ( not ( = ?auto_7027 ?auto_7030 ) ) ( not ( = ?auto_7025 ?auto_7030 ) ) ( not ( = ?auto_7036 ?auto_7030 ) ) ( not ( = ?auto_7038 ?auto_7030 ) ) ( not ( = ?auto_7024 ?auto_7030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7025 ?auto_7026 ?auto_7027 )
      ( MAKE-3CRATE-VERIFY ?auto_7024 ?auto_7025 ?auto_7026 ?auto_7027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7040 - SURFACE
      ?auto_7041 - SURFACE
      ?auto_7042 - SURFACE
      ?auto_7043 - SURFACE
      ?auto_7044 - SURFACE
    )
    :vars
    (
      ?auto_7054 - HOIST
      ?auto_7056 - PLACE
      ?auto_7049 - PLACE
      ?auto_7052 - HOIST
      ?auto_7053 - SURFACE
      ?auto_7045 - PLACE
      ?auto_7046 - HOIST
      ?auto_7055 - SURFACE
      ?auto_7048 - TRUCK
      ?auto_7050 - PLACE
      ?auto_7051 - HOIST
      ?auto_7047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7054 ?auto_7056 ) ( IS-CRATE ?auto_7044 ) ( not ( = ?auto_7043 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( not ( = ?auto_7049 ?auto_7056 ) ) ( HOIST-AT ?auto_7052 ?auto_7049 ) ( not ( = ?auto_7054 ?auto_7052 ) ) ( AVAILABLE ?auto_7052 ) ( SURFACE-AT ?auto_7044 ?auto_7049 ) ( ON ?auto_7044 ?auto_7053 ) ( CLEAR ?auto_7044 ) ( not ( = ?auto_7043 ?auto_7053 ) ) ( not ( = ?auto_7044 ?auto_7053 ) ) ( not ( = ?auto_7042 ?auto_7053 ) ) ( IS-CRATE ?auto_7043 ) ( not ( = ?auto_7045 ?auto_7056 ) ) ( not ( = ?auto_7049 ?auto_7045 ) ) ( HOIST-AT ?auto_7046 ?auto_7045 ) ( not ( = ?auto_7054 ?auto_7046 ) ) ( not ( = ?auto_7052 ?auto_7046 ) ) ( AVAILABLE ?auto_7046 ) ( SURFACE-AT ?auto_7043 ?auto_7045 ) ( ON ?auto_7043 ?auto_7055 ) ( CLEAR ?auto_7043 ) ( not ( = ?auto_7043 ?auto_7055 ) ) ( not ( = ?auto_7044 ?auto_7055 ) ) ( not ( = ?auto_7042 ?auto_7055 ) ) ( not ( = ?auto_7053 ?auto_7055 ) ) ( SURFACE-AT ?auto_7041 ?auto_7056 ) ( CLEAR ?auto_7041 ) ( IS-CRATE ?auto_7042 ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( not ( = ?auto_7043 ?auto_7041 ) ) ( not ( = ?auto_7044 ?auto_7041 ) ) ( not ( = ?auto_7053 ?auto_7041 ) ) ( not ( = ?auto_7055 ?auto_7041 ) ) ( AVAILABLE ?auto_7054 ) ( TRUCK-AT ?auto_7048 ?auto_7050 ) ( not ( = ?auto_7050 ?auto_7056 ) ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( not ( = ?auto_7045 ?auto_7050 ) ) ( HOIST-AT ?auto_7051 ?auto_7050 ) ( not ( = ?auto_7054 ?auto_7051 ) ) ( not ( = ?auto_7052 ?auto_7051 ) ) ( not ( = ?auto_7046 ?auto_7051 ) ) ( AVAILABLE ?auto_7051 ) ( SURFACE-AT ?auto_7042 ?auto_7050 ) ( ON ?auto_7042 ?auto_7047 ) ( CLEAR ?auto_7042 ) ( not ( = ?auto_7043 ?auto_7047 ) ) ( not ( = ?auto_7044 ?auto_7047 ) ) ( not ( = ?auto_7042 ?auto_7047 ) ) ( not ( = ?auto_7053 ?auto_7047 ) ) ( not ( = ?auto_7055 ?auto_7047 ) ) ( not ( = ?auto_7041 ?auto_7047 ) ) ( ON ?auto_7041 ?auto_7040 ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7040 ?auto_7043 ) ) ( not ( = ?auto_7040 ?auto_7044 ) ) ( not ( = ?auto_7040 ?auto_7053 ) ) ( not ( = ?auto_7040 ?auto_7055 ) ) ( not ( = ?auto_7040 ?auto_7047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7042 ?auto_7043 ?auto_7044 )
      ( MAKE-4CRATE-VERIFY ?auto_7040 ?auto_7041 ?auto_7042 ?auto_7043 ?auto_7044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7057 - SURFACE
      ?auto_7058 - SURFACE
    )
    :vars
    (
      ?auto_7069 - HOIST
      ?auto_7071 - PLACE
      ?auto_7072 - SURFACE
      ?auto_7064 - PLACE
      ?auto_7067 - HOIST
      ?auto_7068 - SURFACE
      ?auto_7059 - PLACE
      ?auto_7060 - HOIST
      ?auto_7070 - SURFACE
      ?auto_7062 - SURFACE
      ?auto_7065 - PLACE
      ?auto_7066 - HOIST
      ?auto_7061 - SURFACE
      ?auto_7063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7069 ?auto_7071 ) ( IS-CRATE ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( not ( = ?auto_7072 ?auto_7057 ) ) ( not ( = ?auto_7072 ?auto_7058 ) ) ( not ( = ?auto_7064 ?auto_7071 ) ) ( HOIST-AT ?auto_7067 ?auto_7064 ) ( not ( = ?auto_7069 ?auto_7067 ) ) ( AVAILABLE ?auto_7067 ) ( SURFACE-AT ?auto_7058 ?auto_7064 ) ( ON ?auto_7058 ?auto_7068 ) ( CLEAR ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7068 ) ) ( not ( = ?auto_7058 ?auto_7068 ) ) ( not ( = ?auto_7072 ?auto_7068 ) ) ( IS-CRATE ?auto_7057 ) ( not ( = ?auto_7059 ?auto_7071 ) ) ( not ( = ?auto_7064 ?auto_7059 ) ) ( HOIST-AT ?auto_7060 ?auto_7059 ) ( not ( = ?auto_7069 ?auto_7060 ) ) ( not ( = ?auto_7067 ?auto_7060 ) ) ( AVAILABLE ?auto_7060 ) ( SURFACE-AT ?auto_7057 ?auto_7059 ) ( ON ?auto_7057 ?auto_7070 ) ( CLEAR ?auto_7057 ) ( not ( = ?auto_7057 ?auto_7070 ) ) ( not ( = ?auto_7058 ?auto_7070 ) ) ( not ( = ?auto_7072 ?auto_7070 ) ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( SURFACE-AT ?auto_7062 ?auto_7071 ) ( CLEAR ?auto_7062 ) ( IS-CRATE ?auto_7072 ) ( not ( = ?auto_7062 ?auto_7072 ) ) ( not ( = ?auto_7057 ?auto_7062 ) ) ( not ( = ?auto_7058 ?auto_7062 ) ) ( not ( = ?auto_7068 ?auto_7062 ) ) ( not ( = ?auto_7070 ?auto_7062 ) ) ( AVAILABLE ?auto_7069 ) ( not ( = ?auto_7065 ?auto_7071 ) ) ( not ( = ?auto_7064 ?auto_7065 ) ) ( not ( = ?auto_7059 ?auto_7065 ) ) ( HOIST-AT ?auto_7066 ?auto_7065 ) ( not ( = ?auto_7069 ?auto_7066 ) ) ( not ( = ?auto_7067 ?auto_7066 ) ) ( not ( = ?auto_7060 ?auto_7066 ) ) ( AVAILABLE ?auto_7066 ) ( SURFACE-AT ?auto_7072 ?auto_7065 ) ( ON ?auto_7072 ?auto_7061 ) ( CLEAR ?auto_7072 ) ( not ( = ?auto_7057 ?auto_7061 ) ) ( not ( = ?auto_7058 ?auto_7061 ) ) ( not ( = ?auto_7072 ?auto_7061 ) ) ( not ( = ?auto_7068 ?auto_7061 ) ) ( not ( = ?auto_7070 ?auto_7061 ) ) ( not ( = ?auto_7062 ?auto_7061 ) ) ( TRUCK-AT ?auto_7063 ?auto_7071 ) )
    :subtasks
    ( ( !DRIVE ?auto_7063 ?auto_7071 ?auto_7065 )
      ( MAKE-2CRATE ?auto_7072 ?auto_7057 ?auto_7058 )
      ( MAKE-1CRATE-VERIFY ?auto_7057 ?auto_7058 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7073 - SURFACE
      ?auto_7074 - SURFACE
      ?auto_7075 - SURFACE
    )
    :vars
    (
      ?auto_7088 - HOIST
      ?auto_7080 - PLACE
      ?auto_7077 - PLACE
      ?auto_7085 - HOIST
      ?auto_7081 - SURFACE
      ?auto_7082 - PLACE
      ?auto_7084 - HOIST
      ?auto_7076 - SURFACE
      ?auto_7086 - SURFACE
      ?auto_7087 - PLACE
      ?auto_7079 - HOIST
      ?auto_7078 - SURFACE
      ?auto_7083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7088 ?auto_7080 ) ( IS-CRATE ?auto_7075 ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( not ( = ?auto_7073 ?auto_7074 ) ) ( not ( = ?auto_7073 ?auto_7075 ) ) ( not ( = ?auto_7077 ?auto_7080 ) ) ( HOIST-AT ?auto_7085 ?auto_7077 ) ( not ( = ?auto_7088 ?auto_7085 ) ) ( AVAILABLE ?auto_7085 ) ( SURFACE-AT ?auto_7075 ?auto_7077 ) ( ON ?auto_7075 ?auto_7081 ) ( CLEAR ?auto_7075 ) ( not ( = ?auto_7074 ?auto_7081 ) ) ( not ( = ?auto_7075 ?auto_7081 ) ) ( not ( = ?auto_7073 ?auto_7081 ) ) ( IS-CRATE ?auto_7074 ) ( not ( = ?auto_7082 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7082 ) ) ( HOIST-AT ?auto_7084 ?auto_7082 ) ( not ( = ?auto_7088 ?auto_7084 ) ) ( not ( = ?auto_7085 ?auto_7084 ) ) ( AVAILABLE ?auto_7084 ) ( SURFACE-AT ?auto_7074 ?auto_7082 ) ( ON ?auto_7074 ?auto_7076 ) ( CLEAR ?auto_7074 ) ( not ( = ?auto_7074 ?auto_7076 ) ) ( not ( = ?auto_7075 ?auto_7076 ) ) ( not ( = ?auto_7073 ?auto_7076 ) ) ( not ( = ?auto_7081 ?auto_7076 ) ) ( SURFACE-AT ?auto_7086 ?auto_7080 ) ( CLEAR ?auto_7086 ) ( IS-CRATE ?auto_7073 ) ( not ( = ?auto_7086 ?auto_7073 ) ) ( not ( = ?auto_7074 ?auto_7086 ) ) ( not ( = ?auto_7075 ?auto_7086 ) ) ( not ( = ?auto_7081 ?auto_7086 ) ) ( not ( = ?auto_7076 ?auto_7086 ) ) ( AVAILABLE ?auto_7088 ) ( not ( = ?auto_7087 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7087 ) ) ( not ( = ?auto_7082 ?auto_7087 ) ) ( HOIST-AT ?auto_7079 ?auto_7087 ) ( not ( = ?auto_7088 ?auto_7079 ) ) ( not ( = ?auto_7085 ?auto_7079 ) ) ( not ( = ?auto_7084 ?auto_7079 ) ) ( AVAILABLE ?auto_7079 ) ( SURFACE-AT ?auto_7073 ?auto_7087 ) ( ON ?auto_7073 ?auto_7078 ) ( CLEAR ?auto_7073 ) ( not ( = ?auto_7074 ?auto_7078 ) ) ( not ( = ?auto_7075 ?auto_7078 ) ) ( not ( = ?auto_7073 ?auto_7078 ) ) ( not ( = ?auto_7081 ?auto_7078 ) ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( not ( = ?auto_7086 ?auto_7078 ) ) ( TRUCK-AT ?auto_7083 ?auto_7080 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7074 ?auto_7075 )
      ( MAKE-2CRATE-VERIFY ?auto_7073 ?auto_7074 ?auto_7075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7089 - SURFACE
      ?auto_7090 - SURFACE
      ?auto_7091 - SURFACE
      ?auto_7092 - SURFACE
    )
    :vars
    (
      ?auto_7103 - HOIST
      ?auto_7096 - PLACE
      ?auto_7102 - PLACE
      ?auto_7095 - HOIST
      ?auto_7099 - SURFACE
      ?auto_7094 - PLACE
      ?auto_7101 - HOIST
      ?auto_7098 - SURFACE
      ?auto_7093 - PLACE
      ?auto_7097 - HOIST
      ?auto_7100 - SURFACE
      ?auto_7104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7103 ?auto_7096 ) ( IS-CRATE ?auto_7092 ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7090 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7092 ) ) ( not ( = ?auto_7102 ?auto_7096 ) ) ( HOIST-AT ?auto_7095 ?auto_7102 ) ( not ( = ?auto_7103 ?auto_7095 ) ) ( AVAILABLE ?auto_7095 ) ( SURFACE-AT ?auto_7092 ?auto_7102 ) ( ON ?auto_7092 ?auto_7099 ) ( CLEAR ?auto_7092 ) ( not ( = ?auto_7091 ?auto_7099 ) ) ( not ( = ?auto_7092 ?auto_7099 ) ) ( not ( = ?auto_7090 ?auto_7099 ) ) ( IS-CRATE ?auto_7091 ) ( not ( = ?auto_7094 ?auto_7096 ) ) ( not ( = ?auto_7102 ?auto_7094 ) ) ( HOIST-AT ?auto_7101 ?auto_7094 ) ( not ( = ?auto_7103 ?auto_7101 ) ) ( not ( = ?auto_7095 ?auto_7101 ) ) ( AVAILABLE ?auto_7101 ) ( SURFACE-AT ?auto_7091 ?auto_7094 ) ( ON ?auto_7091 ?auto_7098 ) ( CLEAR ?auto_7091 ) ( not ( = ?auto_7091 ?auto_7098 ) ) ( not ( = ?auto_7092 ?auto_7098 ) ) ( not ( = ?auto_7090 ?auto_7098 ) ) ( not ( = ?auto_7099 ?auto_7098 ) ) ( SURFACE-AT ?auto_7089 ?auto_7096 ) ( CLEAR ?auto_7089 ) ( IS-CRATE ?auto_7090 ) ( not ( = ?auto_7089 ?auto_7090 ) ) ( not ( = ?auto_7091 ?auto_7089 ) ) ( not ( = ?auto_7092 ?auto_7089 ) ) ( not ( = ?auto_7099 ?auto_7089 ) ) ( not ( = ?auto_7098 ?auto_7089 ) ) ( AVAILABLE ?auto_7103 ) ( not ( = ?auto_7093 ?auto_7096 ) ) ( not ( = ?auto_7102 ?auto_7093 ) ) ( not ( = ?auto_7094 ?auto_7093 ) ) ( HOIST-AT ?auto_7097 ?auto_7093 ) ( not ( = ?auto_7103 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7101 ?auto_7097 ) ) ( AVAILABLE ?auto_7097 ) ( SURFACE-AT ?auto_7090 ?auto_7093 ) ( ON ?auto_7090 ?auto_7100 ) ( CLEAR ?auto_7090 ) ( not ( = ?auto_7091 ?auto_7100 ) ) ( not ( = ?auto_7092 ?auto_7100 ) ) ( not ( = ?auto_7090 ?auto_7100 ) ) ( not ( = ?auto_7099 ?auto_7100 ) ) ( not ( = ?auto_7098 ?auto_7100 ) ) ( not ( = ?auto_7089 ?auto_7100 ) ) ( TRUCK-AT ?auto_7104 ?auto_7096 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7090 ?auto_7091 ?auto_7092 )
      ( MAKE-3CRATE-VERIFY ?auto_7089 ?auto_7090 ?auto_7091 ?auto_7092 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7105 - SURFACE
      ?auto_7106 - SURFACE
      ?auto_7107 - SURFACE
      ?auto_7108 - SURFACE
      ?auto_7109 - SURFACE
    )
    :vars
    (
      ?auto_7120 - HOIST
      ?auto_7113 - PLACE
      ?auto_7119 - PLACE
      ?auto_7112 - HOIST
      ?auto_7116 - SURFACE
      ?auto_7111 - PLACE
      ?auto_7118 - HOIST
      ?auto_7115 - SURFACE
      ?auto_7110 - PLACE
      ?auto_7114 - HOIST
      ?auto_7117 - SURFACE
      ?auto_7121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7120 ?auto_7113 ) ( IS-CRATE ?auto_7109 ) ( not ( = ?auto_7108 ?auto_7109 ) ) ( not ( = ?auto_7107 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7109 ) ) ( not ( = ?auto_7119 ?auto_7113 ) ) ( HOIST-AT ?auto_7112 ?auto_7119 ) ( not ( = ?auto_7120 ?auto_7112 ) ) ( AVAILABLE ?auto_7112 ) ( SURFACE-AT ?auto_7109 ?auto_7119 ) ( ON ?auto_7109 ?auto_7116 ) ( CLEAR ?auto_7109 ) ( not ( = ?auto_7108 ?auto_7116 ) ) ( not ( = ?auto_7109 ?auto_7116 ) ) ( not ( = ?auto_7107 ?auto_7116 ) ) ( IS-CRATE ?auto_7108 ) ( not ( = ?auto_7111 ?auto_7113 ) ) ( not ( = ?auto_7119 ?auto_7111 ) ) ( HOIST-AT ?auto_7118 ?auto_7111 ) ( not ( = ?auto_7120 ?auto_7118 ) ) ( not ( = ?auto_7112 ?auto_7118 ) ) ( AVAILABLE ?auto_7118 ) ( SURFACE-AT ?auto_7108 ?auto_7111 ) ( ON ?auto_7108 ?auto_7115 ) ( CLEAR ?auto_7108 ) ( not ( = ?auto_7108 ?auto_7115 ) ) ( not ( = ?auto_7109 ?auto_7115 ) ) ( not ( = ?auto_7107 ?auto_7115 ) ) ( not ( = ?auto_7116 ?auto_7115 ) ) ( SURFACE-AT ?auto_7106 ?auto_7113 ) ( CLEAR ?auto_7106 ) ( IS-CRATE ?auto_7107 ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( not ( = ?auto_7108 ?auto_7106 ) ) ( not ( = ?auto_7109 ?auto_7106 ) ) ( not ( = ?auto_7116 ?auto_7106 ) ) ( not ( = ?auto_7115 ?auto_7106 ) ) ( AVAILABLE ?auto_7120 ) ( not ( = ?auto_7110 ?auto_7113 ) ) ( not ( = ?auto_7119 ?auto_7110 ) ) ( not ( = ?auto_7111 ?auto_7110 ) ) ( HOIST-AT ?auto_7114 ?auto_7110 ) ( not ( = ?auto_7120 ?auto_7114 ) ) ( not ( = ?auto_7112 ?auto_7114 ) ) ( not ( = ?auto_7118 ?auto_7114 ) ) ( AVAILABLE ?auto_7114 ) ( SURFACE-AT ?auto_7107 ?auto_7110 ) ( ON ?auto_7107 ?auto_7117 ) ( CLEAR ?auto_7107 ) ( not ( = ?auto_7108 ?auto_7117 ) ) ( not ( = ?auto_7109 ?auto_7117 ) ) ( not ( = ?auto_7107 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7106 ?auto_7117 ) ) ( TRUCK-AT ?auto_7121 ?auto_7113 ) ( ON ?auto_7106 ?auto_7105 ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7108 ) ) ( not ( = ?auto_7105 ?auto_7109 ) ) ( not ( = ?auto_7105 ?auto_7116 ) ) ( not ( = ?auto_7105 ?auto_7115 ) ) ( not ( = ?auto_7105 ?auto_7117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7107 ?auto_7108 ?auto_7109 )
      ( MAKE-4CRATE-VERIFY ?auto_7105 ?auto_7106 ?auto_7107 ?auto_7108 ?auto_7109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7122 - SURFACE
      ?auto_7123 - SURFACE
    )
    :vars
    (
      ?auto_7135 - HOIST
      ?auto_7127 - PLACE
      ?auto_7137 - SURFACE
      ?auto_7134 - PLACE
      ?auto_7126 - HOIST
      ?auto_7130 - SURFACE
      ?auto_7125 - PLACE
      ?auto_7133 - HOIST
      ?auto_7129 - SURFACE
      ?auto_7131 - SURFACE
      ?auto_7124 - PLACE
      ?auto_7128 - HOIST
      ?auto_7132 - SURFACE
      ?auto_7136 - TRUCK
      ?auto_7138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7135 ?auto_7127 ) ( IS-CRATE ?auto_7123 ) ( not ( = ?auto_7122 ?auto_7123 ) ) ( not ( = ?auto_7137 ?auto_7122 ) ) ( not ( = ?auto_7137 ?auto_7123 ) ) ( not ( = ?auto_7134 ?auto_7127 ) ) ( HOIST-AT ?auto_7126 ?auto_7134 ) ( not ( = ?auto_7135 ?auto_7126 ) ) ( AVAILABLE ?auto_7126 ) ( SURFACE-AT ?auto_7123 ?auto_7134 ) ( ON ?auto_7123 ?auto_7130 ) ( CLEAR ?auto_7123 ) ( not ( = ?auto_7122 ?auto_7130 ) ) ( not ( = ?auto_7123 ?auto_7130 ) ) ( not ( = ?auto_7137 ?auto_7130 ) ) ( IS-CRATE ?auto_7122 ) ( not ( = ?auto_7125 ?auto_7127 ) ) ( not ( = ?auto_7134 ?auto_7125 ) ) ( HOIST-AT ?auto_7133 ?auto_7125 ) ( not ( = ?auto_7135 ?auto_7133 ) ) ( not ( = ?auto_7126 ?auto_7133 ) ) ( AVAILABLE ?auto_7133 ) ( SURFACE-AT ?auto_7122 ?auto_7125 ) ( ON ?auto_7122 ?auto_7129 ) ( CLEAR ?auto_7122 ) ( not ( = ?auto_7122 ?auto_7129 ) ) ( not ( = ?auto_7123 ?auto_7129 ) ) ( not ( = ?auto_7137 ?auto_7129 ) ) ( not ( = ?auto_7130 ?auto_7129 ) ) ( IS-CRATE ?auto_7137 ) ( not ( = ?auto_7131 ?auto_7137 ) ) ( not ( = ?auto_7122 ?auto_7131 ) ) ( not ( = ?auto_7123 ?auto_7131 ) ) ( not ( = ?auto_7130 ?auto_7131 ) ) ( not ( = ?auto_7129 ?auto_7131 ) ) ( not ( = ?auto_7124 ?auto_7127 ) ) ( not ( = ?auto_7134 ?auto_7124 ) ) ( not ( = ?auto_7125 ?auto_7124 ) ) ( HOIST-AT ?auto_7128 ?auto_7124 ) ( not ( = ?auto_7135 ?auto_7128 ) ) ( not ( = ?auto_7126 ?auto_7128 ) ) ( not ( = ?auto_7133 ?auto_7128 ) ) ( AVAILABLE ?auto_7128 ) ( SURFACE-AT ?auto_7137 ?auto_7124 ) ( ON ?auto_7137 ?auto_7132 ) ( CLEAR ?auto_7137 ) ( not ( = ?auto_7122 ?auto_7132 ) ) ( not ( = ?auto_7123 ?auto_7132 ) ) ( not ( = ?auto_7137 ?auto_7132 ) ) ( not ( = ?auto_7130 ?auto_7132 ) ) ( not ( = ?auto_7129 ?auto_7132 ) ) ( not ( = ?auto_7131 ?auto_7132 ) ) ( TRUCK-AT ?auto_7136 ?auto_7127 ) ( SURFACE-AT ?auto_7138 ?auto_7127 ) ( CLEAR ?auto_7138 ) ( LIFTING ?auto_7135 ?auto_7131 ) ( IS-CRATE ?auto_7131 ) ( not ( = ?auto_7138 ?auto_7131 ) ) ( not ( = ?auto_7122 ?auto_7138 ) ) ( not ( = ?auto_7123 ?auto_7138 ) ) ( not ( = ?auto_7137 ?auto_7138 ) ) ( not ( = ?auto_7130 ?auto_7138 ) ) ( not ( = ?auto_7129 ?auto_7138 ) ) ( not ( = ?auto_7132 ?auto_7138 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7138 ?auto_7131 )
      ( MAKE-2CRATE ?auto_7137 ?auto_7122 ?auto_7123 )
      ( MAKE-1CRATE-VERIFY ?auto_7122 ?auto_7123 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7139 - SURFACE
      ?auto_7140 - SURFACE
      ?auto_7141 - SURFACE
    )
    :vars
    (
      ?auto_7142 - HOIST
      ?auto_7150 - PLACE
      ?auto_7147 - PLACE
      ?auto_7149 - HOIST
      ?auto_7152 - SURFACE
      ?auto_7154 - PLACE
      ?auto_7144 - HOIST
      ?auto_7151 - SURFACE
      ?auto_7148 - SURFACE
      ?auto_7155 - PLACE
      ?auto_7145 - HOIST
      ?auto_7146 - SURFACE
      ?auto_7143 - TRUCK
      ?auto_7153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7142 ?auto_7150 ) ( IS-CRATE ?auto_7141 ) ( not ( = ?auto_7140 ?auto_7141 ) ) ( not ( = ?auto_7139 ?auto_7140 ) ) ( not ( = ?auto_7139 ?auto_7141 ) ) ( not ( = ?auto_7147 ?auto_7150 ) ) ( HOIST-AT ?auto_7149 ?auto_7147 ) ( not ( = ?auto_7142 ?auto_7149 ) ) ( AVAILABLE ?auto_7149 ) ( SURFACE-AT ?auto_7141 ?auto_7147 ) ( ON ?auto_7141 ?auto_7152 ) ( CLEAR ?auto_7141 ) ( not ( = ?auto_7140 ?auto_7152 ) ) ( not ( = ?auto_7141 ?auto_7152 ) ) ( not ( = ?auto_7139 ?auto_7152 ) ) ( IS-CRATE ?auto_7140 ) ( not ( = ?auto_7154 ?auto_7150 ) ) ( not ( = ?auto_7147 ?auto_7154 ) ) ( HOIST-AT ?auto_7144 ?auto_7154 ) ( not ( = ?auto_7142 ?auto_7144 ) ) ( not ( = ?auto_7149 ?auto_7144 ) ) ( AVAILABLE ?auto_7144 ) ( SURFACE-AT ?auto_7140 ?auto_7154 ) ( ON ?auto_7140 ?auto_7151 ) ( CLEAR ?auto_7140 ) ( not ( = ?auto_7140 ?auto_7151 ) ) ( not ( = ?auto_7141 ?auto_7151 ) ) ( not ( = ?auto_7139 ?auto_7151 ) ) ( not ( = ?auto_7152 ?auto_7151 ) ) ( IS-CRATE ?auto_7139 ) ( not ( = ?auto_7148 ?auto_7139 ) ) ( not ( = ?auto_7140 ?auto_7148 ) ) ( not ( = ?auto_7141 ?auto_7148 ) ) ( not ( = ?auto_7152 ?auto_7148 ) ) ( not ( = ?auto_7151 ?auto_7148 ) ) ( not ( = ?auto_7155 ?auto_7150 ) ) ( not ( = ?auto_7147 ?auto_7155 ) ) ( not ( = ?auto_7154 ?auto_7155 ) ) ( HOIST-AT ?auto_7145 ?auto_7155 ) ( not ( = ?auto_7142 ?auto_7145 ) ) ( not ( = ?auto_7149 ?auto_7145 ) ) ( not ( = ?auto_7144 ?auto_7145 ) ) ( AVAILABLE ?auto_7145 ) ( SURFACE-AT ?auto_7139 ?auto_7155 ) ( ON ?auto_7139 ?auto_7146 ) ( CLEAR ?auto_7139 ) ( not ( = ?auto_7140 ?auto_7146 ) ) ( not ( = ?auto_7141 ?auto_7146 ) ) ( not ( = ?auto_7139 ?auto_7146 ) ) ( not ( = ?auto_7152 ?auto_7146 ) ) ( not ( = ?auto_7151 ?auto_7146 ) ) ( not ( = ?auto_7148 ?auto_7146 ) ) ( TRUCK-AT ?auto_7143 ?auto_7150 ) ( SURFACE-AT ?auto_7153 ?auto_7150 ) ( CLEAR ?auto_7153 ) ( LIFTING ?auto_7142 ?auto_7148 ) ( IS-CRATE ?auto_7148 ) ( not ( = ?auto_7153 ?auto_7148 ) ) ( not ( = ?auto_7140 ?auto_7153 ) ) ( not ( = ?auto_7141 ?auto_7153 ) ) ( not ( = ?auto_7139 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7146 ?auto_7153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7140 ?auto_7141 )
      ( MAKE-2CRATE-VERIFY ?auto_7139 ?auto_7140 ?auto_7141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7156 - SURFACE
      ?auto_7157 - SURFACE
      ?auto_7158 - SURFACE
      ?auto_7159 - SURFACE
    )
    :vars
    (
      ?auto_7166 - HOIST
      ?auto_7165 - PLACE
      ?auto_7172 - PLACE
      ?auto_7161 - HOIST
      ?auto_7171 - SURFACE
      ?auto_7170 - PLACE
      ?auto_7163 - HOIST
      ?auto_7164 - SURFACE
      ?auto_7168 - PLACE
      ?auto_7169 - HOIST
      ?auto_7160 - SURFACE
      ?auto_7167 - TRUCK
      ?auto_7162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7166 ?auto_7165 ) ( IS-CRATE ?auto_7159 ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7159 ) ) ( not ( = ?auto_7172 ?auto_7165 ) ) ( HOIST-AT ?auto_7161 ?auto_7172 ) ( not ( = ?auto_7166 ?auto_7161 ) ) ( AVAILABLE ?auto_7161 ) ( SURFACE-AT ?auto_7159 ?auto_7172 ) ( ON ?auto_7159 ?auto_7171 ) ( CLEAR ?auto_7159 ) ( not ( = ?auto_7158 ?auto_7171 ) ) ( not ( = ?auto_7159 ?auto_7171 ) ) ( not ( = ?auto_7157 ?auto_7171 ) ) ( IS-CRATE ?auto_7158 ) ( not ( = ?auto_7170 ?auto_7165 ) ) ( not ( = ?auto_7172 ?auto_7170 ) ) ( HOIST-AT ?auto_7163 ?auto_7170 ) ( not ( = ?auto_7166 ?auto_7163 ) ) ( not ( = ?auto_7161 ?auto_7163 ) ) ( AVAILABLE ?auto_7163 ) ( SURFACE-AT ?auto_7158 ?auto_7170 ) ( ON ?auto_7158 ?auto_7164 ) ( CLEAR ?auto_7158 ) ( not ( = ?auto_7158 ?auto_7164 ) ) ( not ( = ?auto_7159 ?auto_7164 ) ) ( not ( = ?auto_7157 ?auto_7164 ) ) ( not ( = ?auto_7171 ?auto_7164 ) ) ( IS-CRATE ?auto_7157 ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7158 ?auto_7156 ) ) ( not ( = ?auto_7159 ?auto_7156 ) ) ( not ( = ?auto_7171 ?auto_7156 ) ) ( not ( = ?auto_7164 ?auto_7156 ) ) ( not ( = ?auto_7168 ?auto_7165 ) ) ( not ( = ?auto_7172 ?auto_7168 ) ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( HOIST-AT ?auto_7169 ?auto_7168 ) ( not ( = ?auto_7166 ?auto_7169 ) ) ( not ( = ?auto_7161 ?auto_7169 ) ) ( not ( = ?auto_7163 ?auto_7169 ) ) ( AVAILABLE ?auto_7169 ) ( SURFACE-AT ?auto_7157 ?auto_7168 ) ( ON ?auto_7157 ?auto_7160 ) ( CLEAR ?auto_7157 ) ( not ( = ?auto_7158 ?auto_7160 ) ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7157 ?auto_7160 ) ) ( not ( = ?auto_7171 ?auto_7160 ) ) ( not ( = ?auto_7164 ?auto_7160 ) ) ( not ( = ?auto_7156 ?auto_7160 ) ) ( TRUCK-AT ?auto_7167 ?auto_7165 ) ( SURFACE-AT ?auto_7162 ?auto_7165 ) ( CLEAR ?auto_7162 ) ( LIFTING ?auto_7166 ?auto_7156 ) ( IS-CRATE ?auto_7156 ) ( not ( = ?auto_7162 ?auto_7156 ) ) ( not ( = ?auto_7158 ?auto_7162 ) ) ( not ( = ?auto_7159 ?auto_7162 ) ) ( not ( = ?auto_7157 ?auto_7162 ) ) ( not ( = ?auto_7171 ?auto_7162 ) ) ( not ( = ?auto_7164 ?auto_7162 ) ) ( not ( = ?auto_7160 ?auto_7162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7157 ?auto_7158 ?auto_7159 )
      ( MAKE-3CRATE-VERIFY ?auto_7156 ?auto_7157 ?auto_7158 ?auto_7159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7173 - SURFACE
      ?auto_7174 - SURFACE
      ?auto_7175 - SURFACE
      ?auto_7176 - SURFACE
      ?auto_7177 - SURFACE
    )
    :vars
    (
      ?auto_7183 - HOIST
      ?auto_7182 - PLACE
      ?auto_7189 - PLACE
      ?auto_7179 - HOIST
      ?auto_7188 - SURFACE
      ?auto_7187 - PLACE
      ?auto_7180 - HOIST
      ?auto_7181 - SURFACE
      ?auto_7185 - PLACE
      ?auto_7186 - HOIST
      ?auto_7178 - SURFACE
      ?auto_7184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7183 ?auto_7182 ) ( IS-CRATE ?auto_7177 ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( not ( = ?auto_7175 ?auto_7176 ) ) ( not ( = ?auto_7175 ?auto_7177 ) ) ( not ( = ?auto_7189 ?auto_7182 ) ) ( HOIST-AT ?auto_7179 ?auto_7189 ) ( not ( = ?auto_7183 ?auto_7179 ) ) ( AVAILABLE ?auto_7179 ) ( SURFACE-AT ?auto_7177 ?auto_7189 ) ( ON ?auto_7177 ?auto_7188 ) ( CLEAR ?auto_7177 ) ( not ( = ?auto_7176 ?auto_7188 ) ) ( not ( = ?auto_7177 ?auto_7188 ) ) ( not ( = ?auto_7175 ?auto_7188 ) ) ( IS-CRATE ?auto_7176 ) ( not ( = ?auto_7187 ?auto_7182 ) ) ( not ( = ?auto_7189 ?auto_7187 ) ) ( HOIST-AT ?auto_7180 ?auto_7187 ) ( not ( = ?auto_7183 ?auto_7180 ) ) ( not ( = ?auto_7179 ?auto_7180 ) ) ( AVAILABLE ?auto_7180 ) ( SURFACE-AT ?auto_7176 ?auto_7187 ) ( ON ?auto_7176 ?auto_7181 ) ( CLEAR ?auto_7176 ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( not ( = ?auto_7177 ?auto_7181 ) ) ( not ( = ?auto_7175 ?auto_7181 ) ) ( not ( = ?auto_7188 ?auto_7181 ) ) ( IS-CRATE ?auto_7175 ) ( not ( = ?auto_7174 ?auto_7175 ) ) ( not ( = ?auto_7176 ?auto_7174 ) ) ( not ( = ?auto_7177 ?auto_7174 ) ) ( not ( = ?auto_7188 ?auto_7174 ) ) ( not ( = ?auto_7181 ?auto_7174 ) ) ( not ( = ?auto_7185 ?auto_7182 ) ) ( not ( = ?auto_7189 ?auto_7185 ) ) ( not ( = ?auto_7187 ?auto_7185 ) ) ( HOIST-AT ?auto_7186 ?auto_7185 ) ( not ( = ?auto_7183 ?auto_7186 ) ) ( not ( = ?auto_7179 ?auto_7186 ) ) ( not ( = ?auto_7180 ?auto_7186 ) ) ( AVAILABLE ?auto_7186 ) ( SURFACE-AT ?auto_7175 ?auto_7185 ) ( ON ?auto_7175 ?auto_7178 ) ( CLEAR ?auto_7175 ) ( not ( = ?auto_7176 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7178 ) ) ( not ( = ?auto_7175 ?auto_7178 ) ) ( not ( = ?auto_7188 ?auto_7178 ) ) ( not ( = ?auto_7181 ?auto_7178 ) ) ( not ( = ?auto_7174 ?auto_7178 ) ) ( TRUCK-AT ?auto_7184 ?auto_7182 ) ( SURFACE-AT ?auto_7173 ?auto_7182 ) ( CLEAR ?auto_7173 ) ( LIFTING ?auto_7183 ?auto_7174 ) ( IS-CRATE ?auto_7174 ) ( not ( = ?auto_7173 ?auto_7174 ) ) ( not ( = ?auto_7176 ?auto_7173 ) ) ( not ( = ?auto_7177 ?auto_7173 ) ) ( not ( = ?auto_7175 ?auto_7173 ) ) ( not ( = ?auto_7188 ?auto_7173 ) ) ( not ( = ?auto_7181 ?auto_7173 ) ) ( not ( = ?auto_7178 ?auto_7173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7175 ?auto_7176 ?auto_7177 )
      ( MAKE-4CRATE-VERIFY ?auto_7173 ?auto_7174 ?auto_7175 ?auto_7176 ?auto_7177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7190 - SURFACE
      ?auto_7191 - SURFACE
    )
    :vars
    (
      ?auto_7199 - HOIST
      ?auto_7198 - PLACE
      ?auto_7206 - SURFACE
      ?auto_7205 - PLACE
      ?auto_7193 - HOIST
      ?auto_7204 - SURFACE
      ?auto_7203 - PLACE
      ?auto_7196 - HOIST
      ?auto_7197 - SURFACE
      ?auto_7194 - SURFACE
      ?auto_7201 - PLACE
      ?auto_7202 - HOIST
      ?auto_7192 - SURFACE
      ?auto_7200 - TRUCK
      ?auto_7195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7199 ?auto_7198 ) ( IS-CRATE ?auto_7191 ) ( not ( = ?auto_7190 ?auto_7191 ) ) ( not ( = ?auto_7206 ?auto_7190 ) ) ( not ( = ?auto_7206 ?auto_7191 ) ) ( not ( = ?auto_7205 ?auto_7198 ) ) ( HOIST-AT ?auto_7193 ?auto_7205 ) ( not ( = ?auto_7199 ?auto_7193 ) ) ( AVAILABLE ?auto_7193 ) ( SURFACE-AT ?auto_7191 ?auto_7205 ) ( ON ?auto_7191 ?auto_7204 ) ( CLEAR ?auto_7191 ) ( not ( = ?auto_7190 ?auto_7204 ) ) ( not ( = ?auto_7191 ?auto_7204 ) ) ( not ( = ?auto_7206 ?auto_7204 ) ) ( IS-CRATE ?auto_7190 ) ( not ( = ?auto_7203 ?auto_7198 ) ) ( not ( = ?auto_7205 ?auto_7203 ) ) ( HOIST-AT ?auto_7196 ?auto_7203 ) ( not ( = ?auto_7199 ?auto_7196 ) ) ( not ( = ?auto_7193 ?auto_7196 ) ) ( AVAILABLE ?auto_7196 ) ( SURFACE-AT ?auto_7190 ?auto_7203 ) ( ON ?auto_7190 ?auto_7197 ) ( CLEAR ?auto_7190 ) ( not ( = ?auto_7190 ?auto_7197 ) ) ( not ( = ?auto_7191 ?auto_7197 ) ) ( not ( = ?auto_7206 ?auto_7197 ) ) ( not ( = ?auto_7204 ?auto_7197 ) ) ( IS-CRATE ?auto_7206 ) ( not ( = ?auto_7194 ?auto_7206 ) ) ( not ( = ?auto_7190 ?auto_7194 ) ) ( not ( = ?auto_7191 ?auto_7194 ) ) ( not ( = ?auto_7204 ?auto_7194 ) ) ( not ( = ?auto_7197 ?auto_7194 ) ) ( not ( = ?auto_7201 ?auto_7198 ) ) ( not ( = ?auto_7205 ?auto_7201 ) ) ( not ( = ?auto_7203 ?auto_7201 ) ) ( HOIST-AT ?auto_7202 ?auto_7201 ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7193 ?auto_7202 ) ) ( not ( = ?auto_7196 ?auto_7202 ) ) ( AVAILABLE ?auto_7202 ) ( SURFACE-AT ?auto_7206 ?auto_7201 ) ( ON ?auto_7206 ?auto_7192 ) ( CLEAR ?auto_7206 ) ( not ( = ?auto_7190 ?auto_7192 ) ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7206 ?auto_7192 ) ) ( not ( = ?auto_7204 ?auto_7192 ) ) ( not ( = ?auto_7197 ?auto_7192 ) ) ( not ( = ?auto_7194 ?auto_7192 ) ) ( TRUCK-AT ?auto_7200 ?auto_7198 ) ( SURFACE-AT ?auto_7195 ?auto_7198 ) ( CLEAR ?auto_7195 ) ( IS-CRATE ?auto_7194 ) ( not ( = ?auto_7195 ?auto_7194 ) ) ( not ( = ?auto_7190 ?auto_7195 ) ) ( not ( = ?auto_7191 ?auto_7195 ) ) ( not ( = ?auto_7206 ?auto_7195 ) ) ( not ( = ?auto_7204 ?auto_7195 ) ) ( not ( = ?auto_7197 ?auto_7195 ) ) ( not ( = ?auto_7192 ?auto_7195 ) ) ( AVAILABLE ?auto_7199 ) ( IN ?auto_7194 ?auto_7200 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7199 ?auto_7194 ?auto_7200 ?auto_7198 )
      ( MAKE-2CRATE ?auto_7206 ?auto_7190 ?auto_7191 )
      ( MAKE-1CRATE-VERIFY ?auto_7190 ?auto_7191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7207 - SURFACE
      ?auto_7208 - SURFACE
      ?auto_7209 - SURFACE
    )
    :vars
    (
      ?auto_7216 - HOIST
      ?auto_7221 - PLACE
      ?auto_7218 - PLACE
      ?auto_7212 - HOIST
      ?auto_7210 - SURFACE
      ?auto_7215 - PLACE
      ?auto_7211 - HOIST
      ?auto_7220 - SURFACE
      ?auto_7223 - SURFACE
      ?auto_7213 - PLACE
      ?auto_7219 - HOIST
      ?auto_7214 - SURFACE
      ?auto_7217 - TRUCK
      ?auto_7222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7216 ?auto_7221 ) ( IS-CRATE ?auto_7209 ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( not ( = ?auto_7207 ?auto_7208 ) ) ( not ( = ?auto_7207 ?auto_7209 ) ) ( not ( = ?auto_7218 ?auto_7221 ) ) ( HOIST-AT ?auto_7212 ?auto_7218 ) ( not ( = ?auto_7216 ?auto_7212 ) ) ( AVAILABLE ?auto_7212 ) ( SURFACE-AT ?auto_7209 ?auto_7218 ) ( ON ?auto_7209 ?auto_7210 ) ( CLEAR ?auto_7209 ) ( not ( = ?auto_7208 ?auto_7210 ) ) ( not ( = ?auto_7209 ?auto_7210 ) ) ( not ( = ?auto_7207 ?auto_7210 ) ) ( IS-CRATE ?auto_7208 ) ( not ( = ?auto_7215 ?auto_7221 ) ) ( not ( = ?auto_7218 ?auto_7215 ) ) ( HOIST-AT ?auto_7211 ?auto_7215 ) ( not ( = ?auto_7216 ?auto_7211 ) ) ( not ( = ?auto_7212 ?auto_7211 ) ) ( AVAILABLE ?auto_7211 ) ( SURFACE-AT ?auto_7208 ?auto_7215 ) ( ON ?auto_7208 ?auto_7220 ) ( CLEAR ?auto_7208 ) ( not ( = ?auto_7208 ?auto_7220 ) ) ( not ( = ?auto_7209 ?auto_7220 ) ) ( not ( = ?auto_7207 ?auto_7220 ) ) ( not ( = ?auto_7210 ?auto_7220 ) ) ( IS-CRATE ?auto_7207 ) ( not ( = ?auto_7223 ?auto_7207 ) ) ( not ( = ?auto_7208 ?auto_7223 ) ) ( not ( = ?auto_7209 ?auto_7223 ) ) ( not ( = ?auto_7210 ?auto_7223 ) ) ( not ( = ?auto_7220 ?auto_7223 ) ) ( not ( = ?auto_7213 ?auto_7221 ) ) ( not ( = ?auto_7218 ?auto_7213 ) ) ( not ( = ?auto_7215 ?auto_7213 ) ) ( HOIST-AT ?auto_7219 ?auto_7213 ) ( not ( = ?auto_7216 ?auto_7219 ) ) ( not ( = ?auto_7212 ?auto_7219 ) ) ( not ( = ?auto_7211 ?auto_7219 ) ) ( AVAILABLE ?auto_7219 ) ( SURFACE-AT ?auto_7207 ?auto_7213 ) ( ON ?auto_7207 ?auto_7214 ) ( CLEAR ?auto_7207 ) ( not ( = ?auto_7208 ?auto_7214 ) ) ( not ( = ?auto_7209 ?auto_7214 ) ) ( not ( = ?auto_7207 ?auto_7214 ) ) ( not ( = ?auto_7210 ?auto_7214 ) ) ( not ( = ?auto_7220 ?auto_7214 ) ) ( not ( = ?auto_7223 ?auto_7214 ) ) ( TRUCK-AT ?auto_7217 ?auto_7221 ) ( SURFACE-AT ?auto_7222 ?auto_7221 ) ( CLEAR ?auto_7222 ) ( IS-CRATE ?auto_7223 ) ( not ( = ?auto_7222 ?auto_7223 ) ) ( not ( = ?auto_7208 ?auto_7222 ) ) ( not ( = ?auto_7209 ?auto_7222 ) ) ( not ( = ?auto_7207 ?auto_7222 ) ) ( not ( = ?auto_7210 ?auto_7222 ) ) ( not ( = ?auto_7220 ?auto_7222 ) ) ( not ( = ?auto_7214 ?auto_7222 ) ) ( AVAILABLE ?auto_7216 ) ( IN ?auto_7223 ?auto_7217 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7208 ?auto_7209 )
      ( MAKE-2CRATE-VERIFY ?auto_7207 ?auto_7208 ?auto_7209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7224 - SURFACE
      ?auto_7225 - SURFACE
      ?auto_7226 - SURFACE
      ?auto_7227 - SURFACE
    )
    :vars
    (
      ?auto_7231 - HOIST
      ?auto_7237 - PLACE
      ?auto_7232 - PLACE
      ?auto_7238 - HOIST
      ?auto_7230 - SURFACE
      ?auto_7234 - PLACE
      ?auto_7229 - HOIST
      ?auto_7235 - SURFACE
      ?auto_7240 - PLACE
      ?auto_7228 - HOIST
      ?auto_7233 - SURFACE
      ?auto_7239 - TRUCK
      ?auto_7236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7231 ?auto_7237 ) ( IS-CRATE ?auto_7227 ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( not ( = ?auto_7225 ?auto_7226 ) ) ( not ( = ?auto_7225 ?auto_7227 ) ) ( not ( = ?auto_7232 ?auto_7237 ) ) ( HOIST-AT ?auto_7238 ?auto_7232 ) ( not ( = ?auto_7231 ?auto_7238 ) ) ( AVAILABLE ?auto_7238 ) ( SURFACE-AT ?auto_7227 ?auto_7232 ) ( ON ?auto_7227 ?auto_7230 ) ( CLEAR ?auto_7227 ) ( not ( = ?auto_7226 ?auto_7230 ) ) ( not ( = ?auto_7227 ?auto_7230 ) ) ( not ( = ?auto_7225 ?auto_7230 ) ) ( IS-CRATE ?auto_7226 ) ( not ( = ?auto_7234 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( HOIST-AT ?auto_7229 ?auto_7234 ) ( not ( = ?auto_7231 ?auto_7229 ) ) ( not ( = ?auto_7238 ?auto_7229 ) ) ( AVAILABLE ?auto_7229 ) ( SURFACE-AT ?auto_7226 ?auto_7234 ) ( ON ?auto_7226 ?auto_7235 ) ( CLEAR ?auto_7226 ) ( not ( = ?auto_7226 ?auto_7235 ) ) ( not ( = ?auto_7227 ?auto_7235 ) ) ( not ( = ?auto_7225 ?auto_7235 ) ) ( not ( = ?auto_7230 ?auto_7235 ) ) ( IS-CRATE ?auto_7225 ) ( not ( = ?auto_7224 ?auto_7225 ) ) ( not ( = ?auto_7226 ?auto_7224 ) ) ( not ( = ?auto_7227 ?auto_7224 ) ) ( not ( = ?auto_7230 ?auto_7224 ) ) ( not ( = ?auto_7235 ?auto_7224 ) ) ( not ( = ?auto_7240 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7240 ) ) ( not ( = ?auto_7234 ?auto_7240 ) ) ( HOIST-AT ?auto_7228 ?auto_7240 ) ( not ( = ?auto_7231 ?auto_7228 ) ) ( not ( = ?auto_7238 ?auto_7228 ) ) ( not ( = ?auto_7229 ?auto_7228 ) ) ( AVAILABLE ?auto_7228 ) ( SURFACE-AT ?auto_7225 ?auto_7240 ) ( ON ?auto_7225 ?auto_7233 ) ( CLEAR ?auto_7225 ) ( not ( = ?auto_7226 ?auto_7233 ) ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7225 ?auto_7233 ) ) ( not ( = ?auto_7230 ?auto_7233 ) ) ( not ( = ?auto_7235 ?auto_7233 ) ) ( not ( = ?auto_7224 ?auto_7233 ) ) ( TRUCK-AT ?auto_7239 ?auto_7237 ) ( SURFACE-AT ?auto_7236 ?auto_7237 ) ( CLEAR ?auto_7236 ) ( IS-CRATE ?auto_7224 ) ( not ( = ?auto_7236 ?auto_7224 ) ) ( not ( = ?auto_7226 ?auto_7236 ) ) ( not ( = ?auto_7227 ?auto_7236 ) ) ( not ( = ?auto_7225 ?auto_7236 ) ) ( not ( = ?auto_7230 ?auto_7236 ) ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( not ( = ?auto_7233 ?auto_7236 ) ) ( AVAILABLE ?auto_7231 ) ( IN ?auto_7224 ?auto_7239 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7225 ?auto_7226 ?auto_7227 )
      ( MAKE-3CRATE-VERIFY ?auto_7224 ?auto_7225 ?auto_7226 ?auto_7227 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7241 - SURFACE
      ?auto_7242 - SURFACE
      ?auto_7243 - SURFACE
      ?auto_7244 - SURFACE
      ?auto_7245 - SURFACE
    )
    :vars
    (
      ?auto_7249 - HOIST
      ?auto_7254 - PLACE
      ?auto_7250 - PLACE
      ?auto_7255 - HOIST
      ?auto_7248 - SURFACE
      ?auto_7252 - PLACE
      ?auto_7247 - HOIST
      ?auto_7253 - SURFACE
      ?auto_7257 - PLACE
      ?auto_7246 - HOIST
      ?auto_7251 - SURFACE
      ?auto_7256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7249 ?auto_7254 ) ( IS-CRATE ?auto_7245 ) ( not ( = ?auto_7244 ?auto_7245 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( not ( = ?auto_7243 ?auto_7245 ) ) ( not ( = ?auto_7250 ?auto_7254 ) ) ( HOIST-AT ?auto_7255 ?auto_7250 ) ( not ( = ?auto_7249 ?auto_7255 ) ) ( AVAILABLE ?auto_7255 ) ( SURFACE-AT ?auto_7245 ?auto_7250 ) ( ON ?auto_7245 ?auto_7248 ) ( CLEAR ?auto_7245 ) ( not ( = ?auto_7244 ?auto_7248 ) ) ( not ( = ?auto_7245 ?auto_7248 ) ) ( not ( = ?auto_7243 ?auto_7248 ) ) ( IS-CRATE ?auto_7244 ) ( not ( = ?auto_7252 ?auto_7254 ) ) ( not ( = ?auto_7250 ?auto_7252 ) ) ( HOIST-AT ?auto_7247 ?auto_7252 ) ( not ( = ?auto_7249 ?auto_7247 ) ) ( not ( = ?auto_7255 ?auto_7247 ) ) ( AVAILABLE ?auto_7247 ) ( SURFACE-AT ?auto_7244 ?auto_7252 ) ( ON ?auto_7244 ?auto_7253 ) ( CLEAR ?auto_7244 ) ( not ( = ?auto_7244 ?auto_7253 ) ) ( not ( = ?auto_7245 ?auto_7253 ) ) ( not ( = ?auto_7243 ?auto_7253 ) ) ( not ( = ?auto_7248 ?auto_7253 ) ) ( IS-CRATE ?auto_7243 ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7244 ?auto_7242 ) ) ( not ( = ?auto_7245 ?auto_7242 ) ) ( not ( = ?auto_7248 ?auto_7242 ) ) ( not ( = ?auto_7253 ?auto_7242 ) ) ( not ( = ?auto_7257 ?auto_7254 ) ) ( not ( = ?auto_7250 ?auto_7257 ) ) ( not ( = ?auto_7252 ?auto_7257 ) ) ( HOIST-AT ?auto_7246 ?auto_7257 ) ( not ( = ?auto_7249 ?auto_7246 ) ) ( not ( = ?auto_7255 ?auto_7246 ) ) ( not ( = ?auto_7247 ?auto_7246 ) ) ( AVAILABLE ?auto_7246 ) ( SURFACE-AT ?auto_7243 ?auto_7257 ) ( ON ?auto_7243 ?auto_7251 ) ( CLEAR ?auto_7243 ) ( not ( = ?auto_7244 ?auto_7251 ) ) ( not ( = ?auto_7245 ?auto_7251 ) ) ( not ( = ?auto_7243 ?auto_7251 ) ) ( not ( = ?auto_7248 ?auto_7251 ) ) ( not ( = ?auto_7253 ?auto_7251 ) ) ( not ( = ?auto_7242 ?auto_7251 ) ) ( TRUCK-AT ?auto_7256 ?auto_7254 ) ( SURFACE-AT ?auto_7241 ?auto_7254 ) ( CLEAR ?auto_7241 ) ( IS-CRATE ?auto_7242 ) ( not ( = ?auto_7241 ?auto_7242 ) ) ( not ( = ?auto_7244 ?auto_7241 ) ) ( not ( = ?auto_7245 ?auto_7241 ) ) ( not ( = ?auto_7243 ?auto_7241 ) ) ( not ( = ?auto_7248 ?auto_7241 ) ) ( not ( = ?auto_7253 ?auto_7241 ) ) ( not ( = ?auto_7251 ?auto_7241 ) ) ( AVAILABLE ?auto_7249 ) ( IN ?auto_7242 ?auto_7256 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7243 ?auto_7244 ?auto_7245 )
      ( MAKE-4CRATE-VERIFY ?auto_7241 ?auto_7242 ?auto_7243 ?auto_7244 ?auto_7245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7258 - SURFACE
      ?auto_7259 - SURFACE
    )
    :vars
    (
      ?auto_7263 - HOIST
      ?auto_7270 - PLACE
      ?auto_7274 - SURFACE
      ?auto_7264 - PLACE
      ?auto_7271 - HOIST
      ?auto_7262 - SURFACE
      ?auto_7266 - PLACE
      ?auto_7261 - HOIST
      ?auto_7267 - SURFACE
      ?auto_7268 - SURFACE
      ?auto_7273 - PLACE
      ?auto_7260 - HOIST
      ?auto_7265 - SURFACE
      ?auto_7269 - SURFACE
      ?auto_7272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7263 ?auto_7270 ) ( IS-CRATE ?auto_7259 ) ( not ( = ?auto_7258 ?auto_7259 ) ) ( not ( = ?auto_7274 ?auto_7258 ) ) ( not ( = ?auto_7274 ?auto_7259 ) ) ( not ( = ?auto_7264 ?auto_7270 ) ) ( HOIST-AT ?auto_7271 ?auto_7264 ) ( not ( = ?auto_7263 ?auto_7271 ) ) ( AVAILABLE ?auto_7271 ) ( SURFACE-AT ?auto_7259 ?auto_7264 ) ( ON ?auto_7259 ?auto_7262 ) ( CLEAR ?auto_7259 ) ( not ( = ?auto_7258 ?auto_7262 ) ) ( not ( = ?auto_7259 ?auto_7262 ) ) ( not ( = ?auto_7274 ?auto_7262 ) ) ( IS-CRATE ?auto_7258 ) ( not ( = ?auto_7266 ?auto_7270 ) ) ( not ( = ?auto_7264 ?auto_7266 ) ) ( HOIST-AT ?auto_7261 ?auto_7266 ) ( not ( = ?auto_7263 ?auto_7261 ) ) ( not ( = ?auto_7271 ?auto_7261 ) ) ( AVAILABLE ?auto_7261 ) ( SURFACE-AT ?auto_7258 ?auto_7266 ) ( ON ?auto_7258 ?auto_7267 ) ( CLEAR ?auto_7258 ) ( not ( = ?auto_7258 ?auto_7267 ) ) ( not ( = ?auto_7259 ?auto_7267 ) ) ( not ( = ?auto_7274 ?auto_7267 ) ) ( not ( = ?auto_7262 ?auto_7267 ) ) ( IS-CRATE ?auto_7274 ) ( not ( = ?auto_7268 ?auto_7274 ) ) ( not ( = ?auto_7258 ?auto_7268 ) ) ( not ( = ?auto_7259 ?auto_7268 ) ) ( not ( = ?auto_7262 ?auto_7268 ) ) ( not ( = ?auto_7267 ?auto_7268 ) ) ( not ( = ?auto_7273 ?auto_7270 ) ) ( not ( = ?auto_7264 ?auto_7273 ) ) ( not ( = ?auto_7266 ?auto_7273 ) ) ( HOIST-AT ?auto_7260 ?auto_7273 ) ( not ( = ?auto_7263 ?auto_7260 ) ) ( not ( = ?auto_7271 ?auto_7260 ) ) ( not ( = ?auto_7261 ?auto_7260 ) ) ( AVAILABLE ?auto_7260 ) ( SURFACE-AT ?auto_7274 ?auto_7273 ) ( ON ?auto_7274 ?auto_7265 ) ( CLEAR ?auto_7274 ) ( not ( = ?auto_7258 ?auto_7265 ) ) ( not ( = ?auto_7259 ?auto_7265 ) ) ( not ( = ?auto_7274 ?auto_7265 ) ) ( not ( = ?auto_7262 ?auto_7265 ) ) ( not ( = ?auto_7267 ?auto_7265 ) ) ( not ( = ?auto_7268 ?auto_7265 ) ) ( SURFACE-AT ?auto_7269 ?auto_7270 ) ( CLEAR ?auto_7269 ) ( IS-CRATE ?auto_7268 ) ( not ( = ?auto_7269 ?auto_7268 ) ) ( not ( = ?auto_7258 ?auto_7269 ) ) ( not ( = ?auto_7259 ?auto_7269 ) ) ( not ( = ?auto_7274 ?auto_7269 ) ) ( not ( = ?auto_7262 ?auto_7269 ) ) ( not ( = ?auto_7267 ?auto_7269 ) ) ( not ( = ?auto_7265 ?auto_7269 ) ) ( AVAILABLE ?auto_7263 ) ( IN ?auto_7268 ?auto_7272 ) ( TRUCK-AT ?auto_7272 ?auto_7264 ) )
    :subtasks
    ( ( !DRIVE ?auto_7272 ?auto_7264 ?auto_7270 )
      ( MAKE-2CRATE ?auto_7274 ?auto_7258 ?auto_7259 )
      ( MAKE-1CRATE-VERIFY ?auto_7258 ?auto_7259 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7275 - SURFACE
      ?auto_7276 - SURFACE
      ?auto_7277 - SURFACE
    )
    :vars
    (
      ?auto_7283 - HOIST
      ?auto_7290 - PLACE
      ?auto_7279 - PLACE
      ?auto_7285 - HOIST
      ?auto_7287 - SURFACE
      ?auto_7281 - PLACE
      ?auto_7282 - HOIST
      ?auto_7284 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7289 - PLACE
      ?auto_7291 - HOIST
      ?auto_7278 - SURFACE
      ?auto_7286 - SURFACE
      ?auto_7288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7283 ?auto_7290 ) ( IS-CRATE ?auto_7277 ) ( not ( = ?auto_7276 ?auto_7277 ) ) ( not ( = ?auto_7275 ?auto_7276 ) ) ( not ( = ?auto_7275 ?auto_7277 ) ) ( not ( = ?auto_7279 ?auto_7290 ) ) ( HOIST-AT ?auto_7285 ?auto_7279 ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( AVAILABLE ?auto_7285 ) ( SURFACE-AT ?auto_7277 ?auto_7279 ) ( ON ?auto_7277 ?auto_7287 ) ( CLEAR ?auto_7277 ) ( not ( = ?auto_7276 ?auto_7287 ) ) ( not ( = ?auto_7277 ?auto_7287 ) ) ( not ( = ?auto_7275 ?auto_7287 ) ) ( IS-CRATE ?auto_7276 ) ( not ( = ?auto_7281 ?auto_7290 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( HOIST-AT ?auto_7282 ?auto_7281 ) ( not ( = ?auto_7283 ?auto_7282 ) ) ( not ( = ?auto_7285 ?auto_7282 ) ) ( AVAILABLE ?auto_7282 ) ( SURFACE-AT ?auto_7276 ?auto_7281 ) ( ON ?auto_7276 ?auto_7284 ) ( CLEAR ?auto_7276 ) ( not ( = ?auto_7276 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7284 ) ) ( not ( = ?auto_7275 ?auto_7284 ) ) ( not ( = ?auto_7287 ?auto_7284 ) ) ( IS-CRATE ?auto_7275 ) ( not ( = ?auto_7280 ?auto_7275 ) ) ( not ( = ?auto_7276 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( not ( = ?auto_7287 ?auto_7280 ) ) ( not ( = ?auto_7284 ?auto_7280 ) ) ( not ( = ?auto_7289 ?auto_7290 ) ) ( not ( = ?auto_7279 ?auto_7289 ) ) ( not ( = ?auto_7281 ?auto_7289 ) ) ( HOIST-AT ?auto_7291 ?auto_7289 ) ( not ( = ?auto_7283 ?auto_7291 ) ) ( not ( = ?auto_7285 ?auto_7291 ) ) ( not ( = ?auto_7282 ?auto_7291 ) ) ( AVAILABLE ?auto_7291 ) ( SURFACE-AT ?auto_7275 ?auto_7289 ) ( ON ?auto_7275 ?auto_7278 ) ( CLEAR ?auto_7275 ) ( not ( = ?auto_7276 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( not ( = ?auto_7275 ?auto_7278 ) ) ( not ( = ?auto_7287 ?auto_7278 ) ) ( not ( = ?auto_7284 ?auto_7278 ) ) ( not ( = ?auto_7280 ?auto_7278 ) ) ( SURFACE-AT ?auto_7286 ?auto_7290 ) ( CLEAR ?auto_7286 ) ( IS-CRATE ?auto_7280 ) ( not ( = ?auto_7286 ?auto_7280 ) ) ( not ( = ?auto_7276 ?auto_7286 ) ) ( not ( = ?auto_7277 ?auto_7286 ) ) ( not ( = ?auto_7275 ?auto_7286 ) ) ( not ( = ?auto_7287 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7286 ) ) ( not ( = ?auto_7278 ?auto_7286 ) ) ( AVAILABLE ?auto_7283 ) ( IN ?auto_7280 ?auto_7288 ) ( TRUCK-AT ?auto_7288 ?auto_7279 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7276 ?auto_7277 )
      ( MAKE-2CRATE-VERIFY ?auto_7275 ?auto_7276 ?auto_7277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7292 - SURFACE
      ?auto_7293 - SURFACE
      ?auto_7294 - SURFACE
      ?auto_7295 - SURFACE
    )
    :vars
    (
      ?auto_7299 - HOIST
      ?auto_7306 - PLACE
      ?auto_7300 - PLACE
      ?auto_7308 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7298 - PLACE
      ?auto_7301 - HOIST
      ?auto_7304 - SURFACE
      ?auto_7296 - PLACE
      ?auto_7307 - HOIST
      ?auto_7297 - SURFACE
      ?auto_7302 - SURFACE
      ?auto_7305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7299 ?auto_7306 ) ( IS-CRATE ?auto_7295 ) ( not ( = ?auto_7294 ?auto_7295 ) ) ( not ( = ?auto_7293 ?auto_7294 ) ) ( not ( = ?auto_7293 ?auto_7295 ) ) ( not ( = ?auto_7300 ?auto_7306 ) ) ( HOIST-AT ?auto_7308 ?auto_7300 ) ( not ( = ?auto_7299 ?auto_7308 ) ) ( AVAILABLE ?auto_7308 ) ( SURFACE-AT ?auto_7295 ?auto_7300 ) ( ON ?auto_7295 ?auto_7303 ) ( CLEAR ?auto_7295 ) ( not ( = ?auto_7294 ?auto_7303 ) ) ( not ( = ?auto_7295 ?auto_7303 ) ) ( not ( = ?auto_7293 ?auto_7303 ) ) ( IS-CRATE ?auto_7294 ) ( not ( = ?auto_7298 ?auto_7306 ) ) ( not ( = ?auto_7300 ?auto_7298 ) ) ( HOIST-AT ?auto_7301 ?auto_7298 ) ( not ( = ?auto_7299 ?auto_7301 ) ) ( not ( = ?auto_7308 ?auto_7301 ) ) ( AVAILABLE ?auto_7301 ) ( SURFACE-AT ?auto_7294 ?auto_7298 ) ( ON ?auto_7294 ?auto_7304 ) ( CLEAR ?auto_7294 ) ( not ( = ?auto_7294 ?auto_7304 ) ) ( not ( = ?auto_7295 ?auto_7304 ) ) ( not ( = ?auto_7293 ?auto_7304 ) ) ( not ( = ?auto_7303 ?auto_7304 ) ) ( IS-CRATE ?auto_7293 ) ( not ( = ?auto_7292 ?auto_7293 ) ) ( not ( = ?auto_7294 ?auto_7292 ) ) ( not ( = ?auto_7295 ?auto_7292 ) ) ( not ( = ?auto_7303 ?auto_7292 ) ) ( not ( = ?auto_7304 ?auto_7292 ) ) ( not ( = ?auto_7296 ?auto_7306 ) ) ( not ( = ?auto_7300 ?auto_7296 ) ) ( not ( = ?auto_7298 ?auto_7296 ) ) ( HOIST-AT ?auto_7307 ?auto_7296 ) ( not ( = ?auto_7299 ?auto_7307 ) ) ( not ( = ?auto_7308 ?auto_7307 ) ) ( not ( = ?auto_7301 ?auto_7307 ) ) ( AVAILABLE ?auto_7307 ) ( SURFACE-AT ?auto_7293 ?auto_7296 ) ( ON ?auto_7293 ?auto_7297 ) ( CLEAR ?auto_7293 ) ( not ( = ?auto_7294 ?auto_7297 ) ) ( not ( = ?auto_7295 ?auto_7297 ) ) ( not ( = ?auto_7293 ?auto_7297 ) ) ( not ( = ?auto_7303 ?auto_7297 ) ) ( not ( = ?auto_7304 ?auto_7297 ) ) ( not ( = ?auto_7292 ?auto_7297 ) ) ( SURFACE-AT ?auto_7302 ?auto_7306 ) ( CLEAR ?auto_7302 ) ( IS-CRATE ?auto_7292 ) ( not ( = ?auto_7302 ?auto_7292 ) ) ( not ( = ?auto_7294 ?auto_7302 ) ) ( not ( = ?auto_7295 ?auto_7302 ) ) ( not ( = ?auto_7293 ?auto_7302 ) ) ( not ( = ?auto_7303 ?auto_7302 ) ) ( not ( = ?auto_7304 ?auto_7302 ) ) ( not ( = ?auto_7297 ?auto_7302 ) ) ( AVAILABLE ?auto_7299 ) ( IN ?auto_7292 ?auto_7305 ) ( TRUCK-AT ?auto_7305 ?auto_7300 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7293 ?auto_7294 ?auto_7295 )
      ( MAKE-3CRATE-VERIFY ?auto_7292 ?auto_7293 ?auto_7294 ?auto_7295 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7309 - SURFACE
      ?auto_7310 - SURFACE
      ?auto_7311 - SURFACE
      ?auto_7312 - SURFACE
      ?auto_7313 - SURFACE
    )
    :vars
    (
      ?auto_7317 - HOIST
      ?auto_7323 - PLACE
      ?auto_7318 - PLACE
      ?auto_7325 - HOIST
      ?auto_7320 - SURFACE
      ?auto_7316 - PLACE
      ?auto_7319 - HOIST
      ?auto_7321 - SURFACE
      ?auto_7314 - PLACE
      ?auto_7324 - HOIST
      ?auto_7315 - SURFACE
      ?auto_7322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7317 ?auto_7323 ) ( IS-CRATE ?auto_7313 ) ( not ( = ?auto_7312 ?auto_7313 ) ) ( not ( = ?auto_7311 ?auto_7312 ) ) ( not ( = ?auto_7311 ?auto_7313 ) ) ( not ( = ?auto_7318 ?auto_7323 ) ) ( HOIST-AT ?auto_7325 ?auto_7318 ) ( not ( = ?auto_7317 ?auto_7325 ) ) ( AVAILABLE ?auto_7325 ) ( SURFACE-AT ?auto_7313 ?auto_7318 ) ( ON ?auto_7313 ?auto_7320 ) ( CLEAR ?auto_7313 ) ( not ( = ?auto_7312 ?auto_7320 ) ) ( not ( = ?auto_7313 ?auto_7320 ) ) ( not ( = ?auto_7311 ?auto_7320 ) ) ( IS-CRATE ?auto_7312 ) ( not ( = ?auto_7316 ?auto_7323 ) ) ( not ( = ?auto_7318 ?auto_7316 ) ) ( HOIST-AT ?auto_7319 ?auto_7316 ) ( not ( = ?auto_7317 ?auto_7319 ) ) ( not ( = ?auto_7325 ?auto_7319 ) ) ( AVAILABLE ?auto_7319 ) ( SURFACE-AT ?auto_7312 ?auto_7316 ) ( ON ?auto_7312 ?auto_7321 ) ( CLEAR ?auto_7312 ) ( not ( = ?auto_7312 ?auto_7321 ) ) ( not ( = ?auto_7313 ?auto_7321 ) ) ( not ( = ?auto_7311 ?auto_7321 ) ) ( not ( = ?auto_7320 ?auto_7321 ) ) ( IS-CRATE ?auto_7311 ) ( not ( = ?auto_7310 ?auto_7311 ) ) ( not ( = ?auto_7312 ?auto_7310 ) ) ( not ( = ?auto_7313 ?auto_7310 ) ) ( not ( = ?auto_7320 ?auto_7310 ) ) ( not ( = ?auto_7321 ?auto_7310 ) ) ( not ( = ?auto_7314 ?auto_7323 ) ) ( not ( = ?auto_7318 ?auto_7314 ) ) ( not ( = ?auto_7316 ?auto_7314 ) ) ( HOIST-AT ?auto_7324 ?auto_7314 ) ( not ( = ?auto_7317 ?auto_7324 ) ) ( not ( = ?auto_7325 ?auto_7324 ) ) ( not ( = ?auto_7319 ?auto_7324 ) ) ( AVAILABLE ?auto_7324 ) ( SURFACE-AT ?auto_7311 ?auto_7314 ) ( ON ?auto_7311 ?auto_7315 ) ( CLEAR ?auto_7311 ) ( not ( = ?auto_7312 ?auto_7315 ) ) ( not ( = ?auto_7313 ?auto_7315 ) ) ( not ( = ?auto_7311 ?auto_7315 ) ) ( not ( = ?auto_7320 ?auto_7315 ) ) ( not ( = ?auto_7321 ?auto_7315 ) ) ( not ( = ?auto_7310 ?auto_7315 ) ) ( SURFACE-AT ?auto_7309 ?auto_7323 ) ( CLEAR ?auto_7309 ) ( IS-CRATE ?auto_7310 ) ( not ( = ?auto_7309 ?auto_7310 ) ) ( not ( = ?auto_7312 ?auto_7309 ) ) ( not ( = ?auto_7313 ?auto_7309 ) ) ( not ( = ?auto_7311 ?auto_7309 ) ) ( not ( = ?auto_7320 ?auto_7309 ) ) ( not ( = ?auto_7321 ?auto_7309 ) ) ( not ( = ?auto_7315 ?auto_7309 ) ) ( AVAILABLE ?auto_7317 ) ( IN ?auto_7310 ?auto_7322 ) ( TRUCK-AT ?auto_7322 ?auto_7318 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7311 ?auto_7312 ?auto_7313 )
      ( MAKE-4CRATE-VERIFY ?auto_7309 ?auto_7310 ?auto_7311 ?auto_7312 ?auto_7313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7326 - SURFACE
      ?auto_7327 - SURFACE
    )
    :vars
    (
      ?auto_7331 - HOIST
      ?auto_7340 - PLACE
      ?auto_7332 - SURFACE
      ?auto_7333 - PLACE
      ?auto_7342 - HOIST
      ?auto_7337 - SURFACE
      ?auto_7330 - PLACE
      ?auto_7335 - HOIST
      ?auto_7338 - SURFACE
      ?auto_7334 - SURFACE
      ?auto_7328 - PLACE
      ?auto_7341 - HOIST
      ?auto_7329 - SURFACE
      ?auto_7336 - SURFACE
      ?auto_7339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7331 ?auto_7340 ) ( IS-CRATE ?auto_7327 ) ( not ( = ?auto_7326 ?auto_7327 ) ) ( not ( = ?auto_7332 ?auto_7326 ) ) ( not ( = ?auto_7332 ?auto_7327 ) ) ( not ( = ?auto_7333 ?auto_7340 ) ) ( HOIST-AT ?auto_7342 ?auto_7333 ) ( not ( = ?auto_7331 ?auto_7342 ) ) ( SURFACE-AT ?auto_7327 ?auto_7333 ) ( ON ?auto_7327 ?auto_7337 ) ( CLEAR ?auto_7327 ) ( not ( = ?auto_7326 ?auto_7337 ) ) ( not ( = ?auto_7327 ?auto_7337 ) ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( IS-CRATE ?auto_7326 ) ( not ( = ?auto_7330 ?auto_7340 ) ) ( not ( = ?auto_7333 ?auto_7330 ) ) ( HOIST-AT ?auto_7335 ?auto_7330 ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7342 ?auto_7335 ) ) ( AVAILABLE ?auto_7335 ) ( SURFACE-AT ?auto_7326 ?auto_7330 ) ( ON ?auto_7326 ?auto_7338 ) ( CLEAR ?auto_7326 ) ( not ( = ?auto_7326 ?auto_7338 ) ) ( not ( = ?auto_7327 ?auto_7338 ) ) ( not ( = ?auto_7332 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( IS-CRATE ?auto_7332 ) ( not ( = ?auto_7334 ?auto_7332 ) ) ( not ( = ?auto_7326 ?auto_7334 ) ) ( not ( = ?auto_7327 ?auto_7334 ) ) ( not ( = ?auto_7337 ?auto_7334 ) ) ( not ( = ?auto_7338 ?auto_7334 ) ) ( not ( = ?auto_7328 ?auto_7340 ) ) ( not ( = ?auto_7333 ?auto_7328 ) ) ( not ( = ?auto_7330 ?auto_7328 ) ) ( HOIST-AT ?auto_7341 ?auto_7328 ) ( not ( = ?auto_7331 ?auto_7341 ) ) ( not ( = ?auto_7342 ?auto_7341 ) ) ( not ( = ?auto_7335 ?auto_7341 ) ) ( AVAILABLE ?auto_7341 ) ( SURFACE-AT ?auto_7332 ?auto_7328 ) ( ON ?auto_7332 ?auto_7329 ) ( CLEAR ?auto_7332 ) ( not ( = ?auto_7326 ?auto_7329 ) ) ( not ( = ?auto_7327 ?auto_7329 ) ) ( not ( = ?auto_7332 ?auto_7329 ) ) ( not ( = ?auto_7337 ?auto_7329 ) ) ( not ( = ?auto_7338 ?auto_7329 ) ) ( not ( = ?auto_7334 ?auto_7329 ) ) ( SURFACE-AT ?auto_7336 ?auto_7340 ) ( CLEAR ?auto_7336 ) ( IS-CRATE ?auto_7334 ) ( not ( = ?auto_7336 ?auto_7334 ) ) ( not ( = ?auto_7326 ?auto_7336 ) ) ( not ( = ?auto_7327 ?auto_7336 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7337 ?auto_7336 ) ) ( not ( = ?auto_7338 ?auto_7336 ) ) ( not ( = ?auto_7329 ?auto_7336 ) ) ( AVAILABLE ?auto_7331 ) ( TRUCK-AT ?auto_7339 ?auto_7333 ) ( LIFTING ?auto_7342 ?auto_7334 ) )
    :subtasks
    ( ( !LOAD ?auto_7342 ?auto_7334 ?auto_7339 ?auto_7333 )
      ( MAKE-2CRATE ?auto_7332 ?auto_7326 ?auto_7327 )
      ( MAKE-1CRATE-VERIFY ?auto_7326 ?auto_7327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7343 - SURFACE
      ?auto_7344 - SURFACE
      ?auto_7345 - SURFACE
    )
    :vars
    (
      ?auto_7358 - HOIST
      ?auto_7349 - PLACE
      ?auto_7355 - PLACE
      ?auto_7351 - HOIST
      ?auto_7350 - SURFACE
      ?auto_7356 - PLACE
      ?auto_7353 - HOIST
      ?auto_7352 - SURFACE
      ?auto_7357 - SURFACE
      ?auto_7346 - PLACE
      ?auto_7347 - HOIST
      ?auto_7359 - SURFACE
      ?auto_7354 - SURFACE
      ?auto_7348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7358 ?auto_7349 ) ( IS-CRATE ?auto_7345 ) ( not ( = ?auto_7344 ?auto_7345 ) ) ( not ( = ?auto_7343 ?auto_7344 ) ) ( not ( = ?auto_7343 ?auto_7345 ) ) ( not ( = ?auto_7355 ?auto_7349 ) ) ( HOIST-AT ?auto_7351 ?auto_7355 ) ( not ( = ?auto_7358 ?auto_7351 ) ) ( SURFACE-AT ?auto_7345 ?auto_7355 ) ( ON ?auto_7345 ?auto_7350 ) ( CLEAR ?auto_7345 ) ( not ( = ?auto_7344 ?auto_7350 ) ) ( not ( = ?auto_7345 ?auto_7350 ) ) ( not ( = ?auto_7343 ?auto_7350 ) ) ( IS-CRATE ?auto_7344 ) ( not ( = ?auto_7356 ?auto_7349 ) ) ( not ( = ?auto_7355 ?auto_7356 ) ) ( HOIST-AT ?auto_7353 ?auto_7356 ) ( not ( = ?auto_7358 ?auto_7353 ) ) ( not ( = ?auto_7351 ?auto_7353 ) ) ( AVAILABLE ?auto_7353 ) ( SURFACE-AT ?auto_7344 ?auto_7356 ) ( ON ?auto_7344 ?auto_7352 ) ( CLEAR ?auto_7344 ) ( not ( = ?auto_7344 ?auto_7352 ) ) ( not ( = ?auto_7345 ?auto_7352 ) ) ( not ( = ?auto_7343 ?auto_7352 ) ) ( not ( = ?auto_7350 ?auto_7352 ) ) ( IS-CRATE ?auto_7343 ) ( not ( = ?auto_7357 ?auto_7343 ) ) ( not ( = ?auto_7344 ?auto_7357 ) ) ( not ( = ?auto_7345 ?auto_7357 ) ) ( not ( = ?auto_7350 ?auto_7357 ) ) ( not ( = ?auto_7352 ?auto_7357 ) ) ( not ( = ?auto_7346 ?auto_7349 ) ) ( not ( = ?auto_7355 ?auto_7346 ) ) ( not ( = ?auto_7356 ?auto_7346 ) ) ( HOIST-AT ?auto_7347 ?auto_7346 ) ( not ( = ?auto_7358 ?auto_7347 ) ) ( not ( = ?auto_7351 ?auto_7347 ) ) ( not ( = ?auto_7353 ?auto_7347 ) ) ( AVAILABLE ?auto_7347 ) ( SURFACE-AT ?auto_7343 ?auto_7346 ) ( ON ?auto_7343 ?auto_7359 ) ( CLEAR ?auto_7343 ) ( not ( = ?auto_7344 ?auto_7359 ) ) ( not ( = ?auto_7345 ?auto_7359 ) ) ( not ( = ?auto_7343 ?auto_7359 ) ) ( not ( = ?auto_7350 ?auto_7359 ) ) ( not ( = ?auto_7352 ?auto_7359 ) ) ( not ( = ?auto_7357 ?auto_7359 ) ) ( SURFACE-AT ?auto_7354 ?auto_7349 ) ( CLEAR ?auto_7354 ) ( IS-CRATE ?auto_7357 ) ( not ( = ?auto_7354 ?auto_7357 ) ) ( not ( = ?auto_7344 ?auto_7354 ) ) ( not ( = ?auto_7345 ?auto_7354 ) ) ( not ( = ?auto_7343 ?auto_7354 ) ) ( not ( = ?auto_7350 ?auto_7354 ) ) ( not ( = ?auto_7352 ?auto_7354 ) ) ( not ( = ?auto_7359 ?auto_7354 ) ) ( AVAILABLE ?auto_7358 ) ( TRUCK-AT ?auto_7348 ?auto_7355 ) ( LIFTING ?auto_7351 ?auto_7357 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7344 ?auto_7345 )
      ( MAKE-2CRATE-VERIFY ?auto_7343 ?auto_7344 ?auto_7345 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7360 - SURFACE
      ?auto_7361 - SURFACE
      ?auto_7362 - SURFACE
      ?auto_7363 - SURFACE
    )
    :vars
    (
      ?auto_7372 - HOIST
      ?auto_7373 - PLACE
      ?auto_7374 - PLACE
      ?auto_7369 - HOIST
      ?auto_7364 - SURFACE
      ?auto_7375 - PLACE
      ?auto_7376 - HOIST
      ?auto_7371 - SURFACE
      ?auto_7365 - PLACE
      ?auto_7370 - HOIST
      ?auto_7368 - SURFACE
      ?auto_7367 - SURFACE
      ?auto_7366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7372 ?auto_7373 ) ( IS-CRATE ?auto_7363 ) ( not ( = ?auto_7362 ?auto_7363 ) ) ( not ( = ?auto_7361 ?auto_7362 ) ) ( not ( = ?auto_7361 ?auto_7363 ) ) ( not ( = ?auto_7374 ?auto_7373 ) ) ( HOIST-AT ?auto_7369 ?auto_7374 ) ( not ( = ?auto_7372 ?auto_7369 ) ) ( SURFACE-AT ?auto_7363 ?auto_7374 ) ( ON ?auto_7363 ?auto_7364 ) ( CLEAR ?auto_7363 ) ( not ( = ?auto_7362 ?auto_7364 ) ) ( not ( = ?auto_7363 ?auto_7364 ) ) ( not ( = ?auto_7361 ?auto_7364 ) ) ( IS-CRATE ?auto_7362 ) ( not ( = ?auto_7375 ?auto_7373 ) ) ( not ( = ?auto_7374 ?auto_7375 ) ) ( HOIST-AT ?auto_7376 ?auto_7375 ) ( not ( = ?auto_7372 ?auto_7376 ) ) ( not ( = ?auto_7369 ?auto_7376 ) ) ( AVAILABLE ?auto_7376 ) ( SURFACE-AT ?auto_7362 ?auto_7375 ) ( ON ?auto_7362 ?auto_7371 ) ( CLEAR ?auto_7362 ) ( not ( = ?auto_7362 ?auto_7371 ) ) ( not ( = ?auto_7363 ?auto_7371 ) ) ( not ( = ?auto_7361 ?auto_7371 ) ) ( not ( = ?auto_7364 ?auto_7371 ) ) ( IS-CRATE ?auto_7361 ) ( not ( = ?auto_7360 ?auto_7361 ) ) ( not ( = ?auto_7362 ?auto_7360 ) ) ( not ( = ?auto_7363 ?auto_7360 ) ) ( not ( = ?auto_7364 ?auto_7360 ) ) ( not ( = ?auto_7371 ?auto_7360 ) ) ( not ( = ?auto_7365 ?auto_7373 ) ) ( not ( = ?auto_7374 ?auto_7365 ) ) ( not ( = ?auto_7375 ?auto_7365 ) ) ( HOIST-AT ?auto_7370 ?auto_7365 ) ( not ( = ?auto_7372 ?auto_7370 ) ) ( not ( = ?auto_7369 ?auto_7370 ) ) ( not ( = ?auto_7376 ?auto_7370 ) ) ( AVAILABLE ?auto_7370 ) ( SURFACE-AT ?auto_7361 ?auto_7365 ) ( ON ?auto_7361 ?auto_7368 ) ( CLEAR ?auto_7361 ) ( not ( = ?auto_7362 ?auto_7368 ) ) ( not ( = ?auto_7363 ?auto_7368 ) ) ( not ( = ?auto_7361 ?auto_7368 ) ) ( not ( = ?auto_7364 ?auto_7368 ) ) ( not ( = ?auto_7371 ?auto_7368 ) ) ( not ( = ?auto_7360 ?auto_7368 ) ) ( SURFACE-AT ?auto_7367 ?auto_7373 ) ( CLEAR ?auto_7367 ) ( IS-CRATE ?auto_7360 ) ( not ( = ?auto_7367 ?auto_7360 ) ) ( not ( = ?auto_7362 ?auto_7367 ) ) ( not ( = ?auto_7363 ?auto_7367 ) ) ( not ( = ?auto_7361 ?auto_7367 ) ) ( not ( = ?auto_7364 ?auto_7367 ) ) ( not ( = ?auto_7371 ?auto_7367 ) ) ( not ( = ?auto_7368 ?auto_7367 ) ) ( AVAILABLE ?auto_7372 ) ( TRUCK-AT ?auto_7366 ?auto_7374 ) ( LIFTING ?auto_7369 ?auto_7360 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7361 ?auto_7362 ?auto_7363 )
      ( MAKE-3CRATE-VERIFY ?auto_7360 ?auto_7361 ?auto_7362 ?auto_7363 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7377 - SURFACE
      ?auto_7378 - SURFACE
      ?auto_7379 - SURFACE
      ?auto_7380 - SURFACE
      ?auto_7381 - SURFACE
    )
    :vars
    (
      ?auto_7389 - HOIST
      ?auto_7390 - PLACE
      ?auto_7391 - PLACE
      ?auto_7386 - HOIST
      ?auto_7382 - SURFACE
      ?auto_7392 - PLACE
      ?auto_7393 - HOIST
      ?auto_7388 - SURFACE
      ?auto_7383 - PLACE
      ?auto_7387 - HOIST
      ?auto_7385 - SURFACE
      ?auto_7384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7389 ?auto_7390 ) ( IS-CRATE ?auto_7381 ) ( not ( = ?auto_7380 ?auto_7381 ) ) ( not ( = ?auto_7379 ?auto_7380 ) ) ( not ( = ?auto_7379 ?auto_7381 ) ) ( not ( = ?auto_7391 ?auto_7390 ) ) ( HOIST-AT ?auto_7386 ?auto_7391 ) ( not ( = ?auto_7389 ?auto_7386 ) ) ( SURFACE-AT ?auto_7381 ?auto_7391 ) ( ON ?auto_7381 ?auto_7382 ) ( CLEAR ?auto_7381 ) ( not ( = ?auto_7380 ?auto_7382 ) ) ( not ( = ?auto_7381 ?auto_7382 ) ) ( not ( = ?auto_7379 ?auto_7382 ) ) ( IS-CRATE ?auto_7380 ) ( not ( = ?auto_7392 ?auto_7390 ) ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( HOIST-AT ?auto_7393 ?auto_7392 ) ( not ( = ?auto_7389 ?auto_7393 ) ) ( not ( = ?auto_7386 ?auto_7393 ) ) ( AVAILABLE ?auto_7393 ) ( SURFACE-AT ?auto_7380 ?auto_7392 ) ( ON ?auto_7380 ?auto_7388 ) ( CLEAR ?auto_7380 ) ( not ( = ?auto_7380 ?auto_7388 ) ) ( not ( = ?auto_7381 ?auto_7388 ) ) ( not ( = ?auto_7379 ?auto_7388 ) ) ( not ( = ?auto_7382 ?auto_7388 ) ) ( IS-CRATE ?auto_7379 ) ( not ( = ?auto_7378 ?auto_7379 ) ) ( not ( = ?auto_7380 ?auto_7378 ) ) ( not ( = ?auto_7381 ?auto_7378 ) ) ( not ( = ?auto_7382 ?auto_7378 ) ) ( not ( = ?auto_7388 ?auto_7378 ) ) ( not ( = ?auto_7383 ?auto_7390 ) ) ( not ( = ?auto_7391 ?auto_7383 ) ) ( not ( = ?auto_7392 ?auto_7383 ) ) ( HOIST-AT ?auto_7387 ?auto_7383 ) ( not ( = ?auto_7389 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7393 ?auto_7387 ) ) ( AVAILABLE ?auto_7387 ) ( SURFACE-AT ?auto_7379 ?auto_7383 ) ( ON ?auto_7379 ?auto_7385 ) ( CLEAR ?auto_7379 ) ( not ( = ?auto_7380 ?auto_7385 ) ) ( not ( = ?auto_7381 ?auto_7385 ) ) ( not ( = ?auto_7379 ?auto_7385 ) ) ( not ( = ?auto_7382 ?auto_7385 ) ) ( not ( = ?auto_7388 ?auto_7385 ) ) ( not ( = ?auto_7378 ?auto_7385 ) ) ( SURFACE-AT ?auto_7377 ?auto_7390 ) ( CLEAR ?auto_7377 ) ( IS-CRATE ?auto_7378 ) ( not ( = ?auto_7377 ?auto_7378 ) ) ( not ( = ?auto_7380 ?auto_7377 ) ) ( not ( = ?auto_7381 ?auto_7377 ) ) ( not ( = ?auto_7379 ?auto_7377 ) ) ( not ( = ?auto_7382 ?auto_7377 ) ) ( not ( = ?auto_7388 ?auto_7377 ) ) ( not ( = ?auto_7385 ?auto_7377 ) ) ( AVAILABLE ?auto_7389 ) ( TRUCK-AT ?auto_7384 ?auto_7391 ) ( LIFTING ?auto_7386 ?auto_7378 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7379 ?auto_7380 ?auto_7381 )
      ( MAKE-4CRATE-VERIFY ?auto_7377 ?auto_7378 ?auto_7379 ?auto_7380 ?auto_7381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7394 - SURFACE
      ?auto_7395 - SURFACE
    )
    :vars
    (
      ?auto_7405 - HOIST
      ?auto_7406 - PLACE
      ?auto_7409 - SURFACE
      ?auto_7407 - PLACE
      ?auto_7402 - HOIST
      ?auto_7396 - SURFACE
      ?auto_7408 - PLACE
      ?auto_7410 - HOIST
      ?auto_7404 - SURFACE
      ?auto_7397 - SURFACE
      ?auto_7398 - PLACE
      ?auto_7403 - HOIST
      ?auto_7401 - SURFACE
      ?auto_7400 - SURFACE
      ?auto_7399 - TRUCK
      ?auto_7411 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7405 ?auto_7406 ) ( IS-CRATE ?auto_7395 ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( not ( = ?auto_7409 ?auto_7394 ) ) ( not ( = ?auto_7409 ?auto_7395 ) ) ( not ( = ?auto_7407 ?auto_7406 ) ) ( HOIST-AT ?auto_7402 ?auto_7407 ) ( not ( = ?auto_7405 ?auto_7402 ) ) ( SURFACE-AT ?auto_7395 ?auto_7407 ) ( ON ?auto_7395 ?auto_7396 ) ( CLEAR ?auto_7395 ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7409 ?auto_7396 ) ) ( IS-CRATE ?auto_7394 ) ( not ( = ?auto_7408 ?auto_7406 ) ) ( not ( = ?auto_7407 ?auto_7408 ) ) ( HOIST-AT ?auto_7410 ?auto_7408 ) ( not ( = ?auto_7405 ?auto_7410 ) ) ( not ( = ?auto_7402 ?auto_7410 ) ) ( AVAILABLE ?auto_7410 ) ( SURFACE-AT ?auto_7394 ?auto_7408 ) ( ON ?auto_7394 ?auto_7404 ) ( CLEAR ?auto_7394 ) ( not ( = ?auto_7394 ?auto_7404 ) ) ( not ( = ?auto_7395 ?auto_7404 ) ) ( not ( = ?auto_7409 ?auto_7404 ) ) ( not ( = ?auto_7396 ?auto_7404 ) ) ( IS-CRATE ?auto_7409 ) ( not ( = ?auto_7397 ?auto_7409 ) ) ( not ( = ?auto_7394 ?auto_7397 ) ) ( not ( = ?auto_7395 ?auto_7397 ) ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( not ( = ?auto_7404 ?auto_7397 ) ) ( not ( = ?auto_7398 ?auto_7406 ) ) ( not ( = ?auto_7407 ?auto_7398 ) ) ( not ( = ?auto_7408 ?auto_7398 ) ) ( HOIST-AT ?auto_7403 ?auto_7398 ) ( not ( = ?auto_7405 ?auto_7403 ) ) ( not ( = ?auto_7402 ?auto_7403 ) ) ( not ( = ?auto_7410 ?auto_7403 ) ) ( AVAILABLE ?auto_7403 ) ( SURFACE-AT ?auto_7409 ?auto_7398 ) ( ON ?auto_7409 ?auto_7401 ) ( CLEAR ?auto_7409 ) ( not ( = ?auto_7394 ?auto_7401 ) ) ( not ( = ?auto_7395 ?auto_7401 ) ) ( not ( = ?auto_7409 ?auto_7401 ) ) ( not ( = ?auto_7396 ?auto_7401 ) ) ( not ( = ?auto_7404 ?auto_7401 ) ) ( not ( = ?auto_7397 ?auto_7401 ) ) ( SURFACE-AT ?auto_7400 ?auto_7406 ) ( CLEAR ?auto_7400 ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7400 ?auto_7397 ) ) ( not ( = ?auto_7394 ?auto_7400 ) ) ( not ( = ?auto_7395 ?auto_7400 ) ) ( not ( = ?auto_7409 ?auto_7400 ) ) ( not ( = ?auto_7396 ?auto_7400 ) ) ( not ( = ?auto_7404 ?auto_7400 ) ) ( not ( = ?auto_7401 ?auto_7400 ) ) ( AVAILABLE ?auto_7405 ) ( TRUCK-AT ?auto_7399 ?auto_7407 ) ( AVAILABLE ?auto_7402 ) ( SURFACE-AT ?auto_7397 ?auto_7407 ) ( ON ?auto_7397 ?auto_7411 ) ( CLEAR ?auto_7397 ) ( not ( = ?auto_7394 ?auto_7411 ) ) ( not ( = ?auto_7395 ?auto_7411 ) ) ( not ( = ?auto_7409 ?auto_7411 ) ) ( not ( = ?auto_7396 ?auto_7411 ) ) ( not ( = ?auto_7404 ?auto_7411 ) ) ( not ( = ?auto_7397 ?auto_7411 ) ) ( not ( = ?auto_7401 ?auto_7411 ) ) ( not ( = ?auto_7400 ?auto_7411 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7402 ?auto_7397 ?auto_7411 ?auto_7407 )
      ( MAKE-2CRATE ?auto_7409 ?auto_7394 ?auto_7395 )
      ( MAKE-1CRATE-VERIFY ?auto_7394 ?auto_7395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7412 - SURFACE
      ?auto_7413 - SURFACE
      ?auto_7414 - SURFACE
    )
    :vars
    (
      ?auto_7419 - HOIST
      ?auto_7423 - PLACE
      ?auto_7415 - PLACE
      ?auto_7425 - HOIST
      ?auto_7429 - SURFACE
      ?auto_7426 - PLACE
      ?auto_7420 - HOIST
      ?auto_7417 - SURFACE
      ?auto_7418 - SURFACE
      ?auto_7428 - PLACE
      ?auto_7421 - HOIST
      ?auto_7424 - SURFACE
      ?auto_7422 - SURFACE
      ?auto_7416 - TRUCK
      ?auto_7427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7419 ?auto_7423 ) ( IS-CRATE ?auto_7414 ) ( not ( = ?auto_7413 ?auto_7414 ) ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( not ( = ?auto_7412 ?auto_7414 ) ) ( not ( = ?auto_7415 ?auto_7423 ) ) ( HOIST-AT ?auto_7425 ?auto_7415 ) ( not ( = ?auto_7419 ?auto_7425 ) ) ( SURFACE-AT ?auto_7414 ?auto_7415 ) ( ON ?auto_7414 ?auto_7429 ) ( CLEAR ?auto_7414 ) ( not ( = ?auto_7413 ?auto_7429 ) ) ( not ( = ?auto_7414 ?auto_7429 ) ) ( not ( = ?auto_7412 ?auto_7429 ) ) ( IS-CRATE ?auto_7413 ) ( not ( = ?auto_7426 ?auto_7423 ) ) ( not ( = ?auto_7415 ?auto_7426 ) ) ( HOIST-AT ?auto_7420 ?auto_7426 ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( not ( = ?auto_7425 ?auto_7420 ) ) ( AVAILABLE ?auto_7420 ) ( SURFACE-AT ?auto_7413 ?auto_7426 ) ( ON ?auto_7413 ?auto_7417 ) ( CLEAR ?auto_7413 ) ( not ( = ?auto_7413 ?auto_7417 ) ) ( not ( = ?auto_7414 ?auto_7417 ) ) ( not ( = ?auto_7412 ?auto_7417 ) ) ( not ( = ?auto_7429 ?auto_7417 ) ) ( IS-CRATE ?auto_7412 ) ( not ( = ?auto_7418 ?auto_7412 ) ) ( not ( = ?auto_7413 ?auto_7418 ) ) ( not ( = ?auto_7414 ?auto_7418 ) ) ( not ( = ?auto_7429 ?auto_7418 ) ) ( not ( = ?auto_7417 ?auto_7418 ) ) ( not ( = ?auto_7428 ?auto_7423 ) ) ( not ( = ?auto_7415 ?auto_7428 ) ) ( not ( = ?auto_7426 ?auto_7428 ) ) ( HOIST-AT ?auto_7421 ?auto_7428 ) ( not ( = ?auto_7419 ?auto_7421 ) ) ( not ( = ?auto_7425 ?auto_7421 ) ) ( not ( = ?auto_7420 ?auto_7421 ) ) ( AVAILABLE ?auto_7421 ) ( SURFACE-AT ?auto_7412 ?auto_7428 ) ( ON ?auto_7412 ?auto_7424 ) ( CLEAR ?auto_7412 ) ( not ( = ?auto_7413 ?auto_7424 ) ) ( not ( = ?auto_7414 ?auto_7424 ) ) ( not ( = ?auto_7412 ?auto_7424 ) ) ( not ( = ?auto_7429 ?auto_7424 ) ) ( not ( = ?auto_7417 ?auto_7424 ) ) ( not ( = ?auto_7418 ?auto_7424 ) ) ( SURFACE-AT ?auto_7422 ?auto_7423 ) ( CLEAR ?auto_7422 ) ( IS-CRATE ?auto_7418 ) ( not ( = ?auto_7422 ?auto_7418 ) ) ( not ( = ?auto_7413 ?auto_7422 ) ) ( not ( = ?auto_7414 ?auto_7422 ) ) ( not ( = ?auto_7412 ?auto_7422 ) ) ( not ( = ?auto_7429 ?auto_7422 ) ) ( not ( = ?auto_7417 ?auto_7422 ) ) ( not ( = ?auto_7424 ?auto_7422 ) ) ( AVAILABLE ?auto_7419 ) ( TRUCK-AT ?auto_7416 ?auto_7415 ) ( AVAILABLE ?auto_7425 ) ( SURFACE-AT ?auto_7418 ?auto_7415 ) ( ON ?auto_7418 ?auto_7427 ) ( CLEAR ?auto_7418 ) ( not ( = ?auto_7413 ?auto_7427 ) ) ( not ( = ?auto_7414 ?auto_7427 ) ) ( not ( = ?auto_7412 ?auto_7427 ) ) ( not ( = ?auto_7429 ?auto_7427 ) ) ( not ( = ?auto_7417 ?auto_7427 ) ) ( not ( = ?auto_7418 ?auto_7427 ) ) ( not ( = ?auto_7424 ?auto_7427 ) ) ( not ( = ?auto_7422 ?auto_7427 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7413 ?auto_7414 )
      ( MAKE-2CRATE-VERIFY ?auto_7412 ?auto_7413 ?auto_7414 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7430 - SURFACE
      ?auto_7431 - SURFACE
      ?auto_7432 - SURFACE
      ?auto_7433 - SURFACE
    )
    :vars
    (
      ?auto_7435 - HOIST
      ?auto_7445 - PLACE
      ?auto_7437 - PLACE
      ?auto_7436 - HOIST
      ?auto_7444 - SURFACE
      ?auto_7442 - PLACE
      ?auto_7439 - HOIST
      ?auto_7443 - SURFACE
      ?auto_7434 - PLACE
      ?auto_7441 - HOIST
      ?auto_7446 - SURFACE
      ?auto_7447 - SURFACE
      ?auto_7438 - TRUCK
      ?auto_7440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7435 ?auto_7445 ) ( IS-CRATE ?auto_7433 ) ( not ( = ?auto_7432 ?auto_7433 ) ) ( not ( = ?auto_7431 ?auto_7432 ) ) ( not ( = ?auto_7431 ?auto_7433 ) ) ( not ( = ?auto_7437 ?auto_7445 ) ) ( HOIST-AT ?auto_7436 ?auto_7437 ) ( not ( = ?auto_7435 ?auto_7436 ) ) ( SURFACE-AT ?auto_7433 ?auto_7437 ) ( ON ?auto_7433 ?auto_7444 ) ( CLEAR ?auto_7433 ) ( not ( = ?auto_7432 ?auto_7444 ) ) ( not ( = ?auto_7433 ?auto_7444 ) ) ( not ( = ?auto_7431 ?auto_7444 ) ) ( IS-CRATE ?auto_7432 ) ( not ( = ?auto_7442 ?auto_7445 ) ) ( not ( = ?auto_7437 ?auto_7442 ) ) ( HOIST-AT ?auto_7439 ?auto_7442 ) ( not ( = ?auto_7435 ?auto_7439 ) ) ( not ( = ?auto_7436 ?auto_7439 ) ) ( AVAILABLE ?auto_7439 ) ( SURFACE-AT ?auto_7432 ?auto_7442 ) ( ON ?auto_7432 ?auto_7443 ) ( CLEAR ?auto_7432 ) ( not ( = ?auto_7432 ?auto_7443 ) ) ( not ( = ?auto_7433 ?auto_7443 ) ) ( not ( = ?auto_7431 ?auto_7443 ) ) ( not ( = ?auto_7444 ?auto_7443 ) ) ( IS-CRATE ?auto_7431 ) ( not ( = ?auto_7430 ?auto_7431 ) ) ( not ( = ?auto_7432 ?auto_7430 ) ) ( not ( = ?auto_7433 ?auto_7430 ) ) ( not ( = ?auto_7444 ?auto_7430 ) ) ( not ( = ?auto_7443 ?auto_7430 ) ) ( not ( = ?auto_7434 ?auto_7445 ) ) ( not ( = ?auto_7437 ?auto_7434 ) ) ( not ( = ?auto_7442 ?auto_7434 ) ) ( HOIST-AT ?auto_7441 ?auto_7434 ) ( not ( = ?auto_7435 ?auto_7441 ) ) ( not ( = ?auto_7436 ?auto_7441 ) ) ( not ( = ?auto_7439 ?auto_7441 ) ) ( AVAILABLE ?auto_7441 ) ( SURFACE-AT ?auto_7431 ?auto_7434 ) ( ON ?auto_7431 ?auto_7446 ) ( CLEAR ?auto_7431 ) ( not ( = ?auto_7432 ?auto_7446 ) ) ( not ( = ?auto_7433 ?auto_7446 ) ) ( not ( = ?auto_7431 ?auto_7446 ) ) ( not ( = ?auto_7444 ?auto_7446 ) ) ( not ( = ?auto_7443 ?auto_7446 ) ) ( not ( = ?auto_7430 ?auto_7446 ) ) ( SURFACE-AT ?auto_7447 ?auto_7445 ) ( CLEAR ?auto_7447 ) ( IS-CRATE ?auto_7430 ) ( not ( = ?auto_7447 ?auto_7430 ) ) ( not ( = ?auto_7432 ?auto_7447 ) ) ( not ( = ?auto_7433 ?auto_7447 ) ) ( not ( = ?auto_7431 ?auto_7447 ) ) ( not ( = ?auto_7444 ?auto_7447 ) ) ( not ( = ?auto_7443 ?auto_7447 ) ) ( not ( = ?auto_7446 ?auto_7447 ) ) ( AVAILABLE ?auto_7435 ) ( TRUCK-AT ?auto_7438 ?auto_7437 ) ( AVAILABLE ?auto_7436 ) ( SURFACE-AT ?auto_7430 ?auto_7437 ) ( ON ?auto_7430 ?auto_7440 ) ( CLEAR ?auto_7430 ) ( not ( = ?auto_7432 ?auto_7440 ) ) ( not ( = ?auto_7433 ?auto_7440 ) ) ( not ( = ?auto_7431 ?auto_7440 ) ) ( not ( = ?auto_7444 ?auto_7440 ) ) ( not ( = ?auto_7443 ?auto_7440 ) ) ( not ( = ?auto_7430 ?auto_7440 ) ) ( not ( = ?auto_7446 ?auto_7440 ) ) ( not ( = ?auto_7447 ?auto_7440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7431 ?auto_7432 ?auto_7433 )
      ( MAKE-3CRATE-VERIFY ?auto_7430 ?auto_7431 ?auto_7432 ?auto_7433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7448 - SURFACE
      ?auto_7449 - SURFACE
      ?auto_7450 - SURFACE
      ?auto_7451 - SURFACE
      ?auto_7452 - SURFACE
    )
    :vars
    (
      ?auto_7454 - HOIST
      ?auto_7464 - PLACE
      ?auto_7456 - PLACE
      ?auto_7455 - HOIST
      ?auto_7463 - SURFACE
      ?auto_7461 - PLACE
      ?auto_7458 - HOIST
      ?auto_7462 - SURFACE
      ?auto_7453 - PLACE
      ?auto_7460 - HOIST
      ?auto_7465 - SURFACE
      ?auto_7457 - TRUCK
      ?auto_7459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7454 ?auto_7464 ) ( IS-CRATE ?auto_7452 ) ( not ( = ?auto_7451 ?auto_7452 ) ) ( not ( = ?auto_7450 ?auto_7451 ) ) ( not ( = ?auto_7450 ?auto_7452 ) ) ( not ( = ?auto_7456 ?auto_7464 ) ) ( HOIST-AT ?auto_7455 ?auto_7456 ) ( not ( = ?auto_7454 ?auto_7455 ) ) ( SURFACE-AT ?auto_7452 ?auto_7456 ) ( ON ?auto_7452 ?auto_7463 ) ( CLEAR ?auto_7452 ) ( not ( = ?auto_7451 ?auto_7463 ) ) ( not ( = ?auto_7452 ?auto_7463 ) ) ( not ( = ?auto_7450 ?auto_7463 ) ) ( IS-CRATE ?auto_7451 ) ( not ( = ?auto_7461 ?auto_7464 ) ) ( not ( = ?auto_7456 ?auto_7461 ) ) ( HOIST-AT ?auto_7458 ?auto_7461 ) ( not ( = ?auto_7454 ?auto_7458 ) ) ( not ( = ?auto_7455 ?auto_7458 ) ) ( AVAILABLE ?auto_7458 ) ( SURFACE-AT ?auto_7451 ?auto_7461 ) ( ON ?auto_7451 ?auto_7462 ) ( CLEAR ?auto_7451 ) ( not ( = ?auto_7451 ?auto_7462 ) ) ( not ( = ?auto_7452 ?auto_7462 ) ) ( not ( = ?auto_7450 ?auto_7462 ) ) ( not ( = ?auto_7463 ?auto_7462 ) ) ( IS-CRATE ?auto_7450 ) ( not ( = ?auto_7449 ?auto_7450 ) ) ( not ( = ?auto_7451 ?auto_7449 ) ) ( not ( = ?auto_7452 ?auto_7449 ) ) ( not ( = ?auto_7463 ?auto_7449 ) ) ( not ( = ?auto_7462 ?auto_7449 ) ) ( not ( = ?auto_7453 ?auto_7464 ) ) ( not ( = ?auto_7456 ?auto_7453 ) ) ( not ( = ?auto_7461 ?auto_7453 ) ) ( HOIST-AT ?auto_7460 ?auto_7453 ) ( not ( = ?auto_7454 ?auto_7460 ) ) ( not ( = ?auto_7455 ?auto_7460 ) ) ( not ( = ?auto_7458 ?auto_7460 ) ) ( AVAILABLE ?auto_7460 ) ( SURFACE-AT ?auto_7450 ?auto_7453 ) ( ON ?auto_7450 ?auto_7465 ) ( CLEAR ?auto_7450 ) ( not ( = ?auto_7451 ?auto_7465 ) ) ( not ( = ?auto_7452 ?auto_7465 ) ) ( not ( = ?auto_7450 ?auto_7465 ) ) ( not ( = ?auto_7463 ?auto_7465 ) ) ( not ( = ?auto_7462 ?auto_7465 ) ) ( not ( = ?auto_7449 ?auto_7465 ) ) ( SURFACE-AT ?auto_7448 ?auto_7464 ) ( CLEAR ?auto_7448 ) ( IS-CRATE ?auto_7449 ) ( not ( = ?auto_7448 ?auto_7449 ) ) ( not ( = ?auto_7451 ?auto_7448 ) ) ( not ( = ?auto_7452 ?auto_7448 ) ) ( not ( = ?auto_7450 ?auto_7448 ) ) ( not ( = ?auto_7463 ?auto_7448 ) ) ( not ( = ?auto_7462 ?auto_7448 ) ) ( not ( = ?auto_7465 ?auto_7448 ) ) ( AVAILABLE ?auto_7454 ) ( TRUCK-AT ?auto_7457 ?auto_7456 ) ( AVAILABLE ?auto_7455 ) ( SURFACE-AT ?auto_7449 ?auto_7456 ) ( ON ?auto_7449 ?auto_7459 ) ( CLEAR ?auto_7449 ) ( not ( = ?auto_7451 ?auto_7459 ) ) ( not ( = ?auto_7452 ?auto_7459 ) ) ( not ( = ?auto_7450 ?auto_7459 ) ) ( not ( = ?auto_7463 ?auto_7459 ) ) ( not ( = ?auto_7462 ?auto_7459 ) ) ( not ( = ?auto_7449 ?auto_7459 ) ) ( not ( = ?auto_7465 ?auto_7459 ) ) ( not ( = ?auto_7448 ?auto_7459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7450 ?auto_7451 ?auto_7452 )
      ( MAKE-4CRATE-VERIFY ?auto_7448 ?auto_7449 ?auto_7450 ?auto_7451 ?auto_7452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7466 - SURFACE
      ?auto_7467 - SURFACE
    )
    :vars
    (
      ?auto_7469 - HOIST
      ?auto_7480 - PLACE
      ?auto_7483 - SURFACE
      ?auto_7471 - PLACE
      ?auto_7470 - HOIST
      ?auto_7479 - SURFACE
      ?auto_7477 - PLACE
      ?auto_7473 - HOIST
      ?auto_7478 - SURFACE
      ?auto_7476 - SURFACE
      ?auto_7468 - PLACE
      ?auto_7475 - HOIST
      ?auto_7481 - SURFACE
      ?auto_7482 - SURFACE
      ?auto_7474 - SURFACE
      ?auto_7472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7469 ?auto_7480 ) ( IS-CRATE ?auto_7467 ) ( not ( = ?auto_7466 ?auto_7467 ) ) ( not ( = ?auto_7483 ?auto_7466 ) ) ( not ( = ?auto_7483 ?auto_7467 ) ) ( not ( = ?auto_7471 ?auto_7480 ) ) ( HOIST-AT ?auto_7470 ?auto_7471 ) ( not ( = ?auto_7469 ?auto_7470 ) ) ( SURFACE-AT ?auto_7467 ?auto_7471 ) ( ON ?auto_7467 ?auto_7479 ) ( CLEAR ?auto_7467 ) ( not ( = ?auto_7466 ?auto_7479 ) ) ( not ( = ?auto_7467 ?auto_7479 ) ) ( not ( = ?auto_7483 ?auto_7479 ) ) ( IS-CRATE ?auto_7466 ) ( not ( = ?auto_7477 ?auto_7480 ) ) ( not ( = ?auto_7471 ?auto_7477 ) ) ( HOIST-AT ?auto_7473 ?auto_7477 ) ( not ( = ?auto_7469 ?auto_7473 ) ) ( not ( = ?auto_7470 ?auto_7473 ) ) ( AVAILABLE ?auto_7473 ) ( SURFACE-AT ?auto_7466 ?auto_7477 ) ( ON ?auto_7466 ?auto_7478 ) ( CLEAR ?auto_7466 ) ( not ( = ?auto_7466 ?auto_7478 ) ) ( not ( = ?auto_7467 ?auto_7478 ) ) ( not ( = ?auto_7483 ?auto_7478 ) ) ( not ( = ?auto_7479 ?auto_7478 ) ) ( IS-CRATE ?auto_7483 ) ( not ( = ?auto_7476 ?auto_7483 ) ) ( not ( = ?auto_7466 ?auto_7476 ) ) ( not ( = ?auto_7467 ?auto_7476 ) ) ( not ( = ?auto_7479 ?auto_7476 ) ) ( not ( = ?auto_7478 ?auto_7476 ) ) ( not ( = ?auto_7468 ?auto_7480 ) ) ( not ( = ?auto_7471 ?auto_7468 ) ) ( not ( = ?auto_7477 ?auto_7468 ) ) ( HOIST-AT ?auto_7475 ?auto_7468 ) ( not ( = ?auto_7469 ?auto_7475 ) ) ( not ( = ?auto_7470 ?auto_7475 ) ) ( not ( = ?auto_7473 ?auto_7475 ) ) ( AVAILABLE ?auto_7475 ) ( SURFACE-AT ?auto_7483 ?auto_7468 ) ( ON ?auto_7483 ?auto_7481 ) ( CLEAR ?auto_7483 ) ( not ( = ?auto_7466 ?auto_7481 ) ) ( not ( = ?auto_7467 ?auto_7481 ) ) ( not ( = ?auto_7483 ?auto_7481 ) ) ( not ( = ?auto_7479 ?auto_7481 ) ) ( not ( = ?auto_7478 ?auto_7481 ) ) ( not ( = ?auto_7476 ?auto_7481 ) ) ( SURFACE-AT ?auto_7482 ?auto_7480 ) ( CLEAR ?auto_7482 ) ( IS-CRATE ?auto_7476 ) ( not ( = ?auto_7482 ?auto_7476 ) ) ( not ( = ?auto_7466 ?auto_7482 ) ) ( not ( = ?auto_7467 ?auto_7482 ) ) ( not ( = ?auto_7483 ?auto_7482 ) ) ( not ( = ?auto_7479 ?auto_7482 ) ) ( not ( = ?auto_7478 ?auto_7482 ) ) ( not ( = ?auto_7481 ?auto_7482 ) ) ( AVAILABLE ?auto_7469 ) ( AVAILABLE ?auto_7470 ) ( SURFACE-AT ?auto_7476 ?auto_7471 ) ( ON ?auto_7476 ?auto_7474 ) ( CLEAR ?auto_7476 ) ( not ( = ?auto_7466 ?auto_7474 ) ) ( not ( = ?auto_7467 ?auto_7474 ) ) ( not ( = ?auto_7483 ?auto_7474 ) ) ( not ( = ?auto_7479 ?auto_7474 ) ) ( not ( = ?auto_7478 ?auto_7474 ) ) ( not ( = ?auto_7476 ?auto_7474 ) ) ( not ( = ?auto_7481 ?auto_7474 ) ) ( not ( = ?auto_7482 ?auto_7474 ) ) ( TRUCK-AT ?auto_7472 ?auto_7480 ) )
    :subtasks
    ( ( !DRIVE ?auto_7472 ?auto_7480 ?auto_7471 )
      ( MAKE-2CRATE ?auto_7483 ?auto_7466 ?auto_7467 )
      ( MAKE-1CRATE-VERIFY ?auto_7466 ?auto_7467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7484 - SURFACE
      ?auto_7485 - SURFACE
      ?auto_7486 - SURFACE
    )
    :vars
    (
      ?auto_7500 - HOIST
      ?auto_7499 - PLACE
      ?auto_7491 - PLACE
      ?auto_7496 - HOIST
      ?auto_7489 - SURFACE
      ?auto_7497 - PLACE
      ?auto_7494 - HOIST
      ?auto_7501 - SURFACE
      ?auto_7492 - SURFACE
      ?auto_7488 - PLACE
      ?auto_7498 - HOIST
      ?auto_7487 - SURFACE
      ?auto_7493 - SURFACE
      ?auto_7490 - SURFACE
      ?auto_7495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7500 ?auto_7499 ) ( IS-CRATE ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7484 ?auto_7485 ) ) ( not ( = ?auto_7484 ?auto_7486 ) ) ( not ( = ?auto_7491 ?auto_7499 ) ) ( HOIST-AT ?auto_7496 ?auto_7491 ) ( not ( = ?auto_7500 ?auto_7496 ) ) ( SURFACE-AT ?auto_7486 ?auto_7491 ) ( ON ?auto_7486 ?auto_7489 ) ( CLEAR ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7489 ) ) ( not ( = ?auto_7486 ?auto_7489 ) ) ( not ( = ?auto_7484 ?auto_7489 ) ) ( IS-CRATE ?auto_7485 ) ( not ( = ?auto_7497 ?auto_7499 ) ) ( not ( = ?auto_7491 ?auto_7497 ) ) ( HOIST-AT ?auto_7494 ?auto_7497 ) ( not ( = ?auto_7500 ?auto_7494 ) ) ( not ( = ?auto_7496 ?auto_7494 ) ) ( AVAILABLE ?auto_7494 ) ( SURFACE-AT ?auto_7485 ?auto_7497 ) ( ON ?auto_7485 ?auto_7501 ) ( CLEAR ?auto_7485 ) ( not ( = ?auto_7485 ?auto_7501 ) ) ( not ( = ?auto_7486 ?auto_7501 ) ) ( not ( = ?auto_7484 ?auto_7501 ) ) ( not ( = ?auto_7489 ?auto_7501 ) ) ( IS-CRATE ?auto_7484 ) ( not ( = ?auto_7492 ?auto_7484 ) ) ( not ( = ?auto_7485 ?auto_7492 ) ) ( not ( = ?auto_7486 ?auto_7492 ) ) ( not ( = ?auto_7489 ?auto_7492 ) ) ( not ( = ?auto_7501 ?auto_7492 ) ) ( not ( = ?auto_7488 ?auto_7499 ) ) ( not ( = ?auto_7491 ?auto_7488 ) ) ( not ( = ?auto_7497 ?auto_7488 ) ) ( HOIST-AT ?auto_7498 ?auto_7488 ) ( not ( = ?auto_7500 ?auto_7498 ) ) ( not ( = ?auto_7496 ?auto_7498 ) ) ( not ( = ?auto_7494 ?auto_7498 ) ) ( AVAILABLE ?auto_7498 ) ( SURFACE-AT ?auto_7484 ?auto_7488 ) ( ON ?auto_7484 ?auto_7487 ) ( CLEAR ?auto_7484 ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( not ( = ?auto_7486 ?auto_7487 ) ) ( not ( = ?auto_7484 ?auto_7487 ) ) ( not ( = ?auto_7489 ?auto_7487 ) ) ( not ( = ?auto_7501 ?auto_7487 ) ) ( not ( = ?auto_7492 ?auto_7487 ) ) ( SURFACE-AT ?auto_7493 ?auto_7499 ) ( CLEAR ?auto_7493 ) ( IS-CRATE ?auto_7492 ) ( not ( = ?auto_7493 ?auto_7492 ) ) ( not ( = ?auto_7485 ?auto_7493 ) ) ( not ( = ?auto_7486 ?auto_7493 ) ) ( not ( = ?auto_7484 ?auto_7493 ) ) ( not ( = ?auto_7489 ?auto_7493 ) ) ( not ( = ?auto_7501 ?auto_7493 ) ) ( not ( = ?auto_7487 ?auto_7493 ) ) ( AVAILABLE ?auto_7500 ) ( AVAILABLE ?auto_7496 ) ( SURFACE-AT ?auto_7492 ?auto_7491 ) ( ON ?auto_7492 ?auto_7490 ) ( CLEAR ?auto_7492 ) ( not ( = ?auto_7485 ?auto_7490 ) ) ( not ( = ?auto_7486 ?auto_7490 ) ) ( not ( = ?auto_7484 ?auto_7490 ) ) ( not ( = ?auto_7489 ?auto_7490 ) ) ( not ( = ?auto_7501 ?auto_7490 ) ) ( not ( = ?auto_7492 ?auto_7490 ) ) ( not ( = ?auto_7487 ?auto_7490 ) ) ( not ( = ?auto_7493 ?auto_7490 ) ) ( TRUCK-AT ?auto_7495 ?auto_7499 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7485 ?auto_7486 )
      ( MAKE-2CRATE-VERIFY ?auto_7484 ?auto_7485 ?auto_7486 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7502 - SURFACE
      ?auto_7503 - SURFACE
      ?auto_7504 - SURFACE
      ?auto_7505 - SURFACE
    )
    :vars
    (
      ?auto_7514 - HOIST
      ?auto_7512 - PLACE
      ?auto_7506 - PLACE
      ?auto_7510 - HOIST
      ?auto_7519 - SURFACE
      ?auto_7513 - PLACE
      ?auto_7517 - HOIST
      ?auto_7509 - SURFACE
      ?auto_7516 - PLACE
      ?auto_7515 - HOIST
      ?auto_7511 - SURFACE
      ?auto_7518 - SURFACE
      ?auto_7508 - SURFACE
      ?auto_7507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7514 ?auto_7512 ) ( IS-CRATE ?auto_7505 ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( not ( = ?auto_7503 ?auto_7505 ) ) ( not ( = ?auto_7506 ?auto_7512 ) ) ( HOIST-AT ?auto_7510 ?auto_7506 ) ( not ( = ?auto_7514 ?auto_7510 ) ) ( SURFACE-AT ?auto_7505 ?auto_7506 ) ( ON ?auto_7505 ?auto_7519 ) ( CLEAR ?auto_7505 ) ( not ( = ?auto_7504 ?auto_7519 ) ) ( not ( = ?auto_7505 ?auto_7519 ) ) ( not ( = ?auto_7503 ?auto_7519 ) ) ( IS-CRATE ?auto_7504 ) ( not ( = ?auto_7513 ?auto_7512 ) ) ( not ( = ?auto_7506 ?auto_7513 ) ) ( HOIST-AT ?auto_7517 ?auto_7513 ) ( not ( = ?auto_7514 ?auto_7517 ) ) ( not ( = ?auto_7510 ?auto_7517 ) ) ( AVAILABLE ?auto_7517 ) ( SURFACE-AT ?auto_7504 ?auto_7513 ) ( ON ?auto_7504 ?auto_7509 ) ( CLEAR ?auto_7504 ) ( not ( = ?auto_7504 ?auto_7509 ) ) ( not ( = ?auto_7505 ?auto_7509 ) ) ( not ( = ?auto_7503 ?auto_7509 ) ) ( not ( = ?auto_7519 ?auto_7509 ) ) ( IS-CRATE ?auto_7503 ) ( not ( = ?auto_7502 ?auto_7503 ) ) ( not ( = ?auto_7504 ?auto_7502 ) ) ( not ( = ?auto_7505 ?auto_7502 ) ) ( not ( = ?auto_7519 ?auto_7502 ) ) ( not ( = ?auto_7509 ?auto_7502 ) ) ( not ( = ?auto_7516 ?auto_7512 ) ) ( not ( = ?auto_7506 ?auto_7516 ) ) ( not ( = ?auto_7513 ?auto_7516 ) ) ( HOIST-AT ?auto_7515 ?auto_7516 ) ( not ( = ?auto_7514 ?auto_7515 ) ) ( not ( = ?auto_7510 ?auto_7515 ) ) ( not ( = ?auto_7517 ?auto_7515 ) ) ( AVAILABLE ?auto_7515 ) ( SURFACE-AT ?auto_7503 ?auto_7516 ) ( ON ?auto_7503 ?auto_7511 ) ( CLEAR ?auto_7503 ) ( not ( = ?auto_7504 ?auto_7511 ) ) ( not ( = ?auto_7505 ?auto_7511 ) ) ( not ( = ?auto_7503 ?auto_7511 ) ) ( not ( = ?auto_7519 ?auto_7511 ) ) ( not ( = ?auto_7509 ?auto_7511 ) ) ( not ( = ?auto_7502 ?auto_7511 ) ) ( SURFACE-AT ?auto_7518 ?auto_7512 ) ( CLEAR ?auto_7518 ) ( IS-CRATE ?auto_7502 ) ( not ( = ?auto_7518 ?auto_7502 ) ) ( not ( = ?auto_7504 ?auto_7518 ) ) ( not ( = ?auto_7505 ?auto_7518 ) ) ( not ( = ?auto_7503 ?auto_7518 ) ) ( not ( = ?auto_7519 ?auto_7518 ) ) ( not ( = ?auto_7509 ?auto_7518 ) ) ( not ( = ?auto_7511 ?auto_7518 ) ) ( AVAILABLE ?auto_7514 ) ( AVAILABLE ?auto_7510 ) ( SURFACE-AT ?auto_7502 ?auto_7506 ) ( ON ?auto_7502 ?auto_7508 ) ( CLEAR ?auto_7502 ) ( not ( = ?auto_7504 ?auto_7508 ) ) ( not ( = ?auto_7505 ?auto_7508 ) ) ( not ( = ?auto_7503 ?auto_7508 ) ) ( not ( = ?auto_7519 ?auto_7508 ) ) ( not ( = ?auto_7509 ?auto_7508 ) ) ( not ( = ?auto_7502 ?auto_7508 ) ) ( not ( = ?auto_7511 ?auto_7508 ) ) ( not ( = ?auto_7518 ?auto_7508 ) ) ( TRUCK-AT ?auto_7507 ?auto_7512 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7503 ?auto_7504 ?auto_7505 )
      ( MAKE-3CRATE-VERIFY ?auto_7502 ?auto_7503 ?auto_7504 ?auto_7505 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7520 - SURFACE
      ?auto_7521 - SURFACE
      ?auto_7522 - SURFACE
      ?auto_7523 - SURFACE
      ?auto_7524 - SURFACE
    )
    :vars
    (
      ?auto_7533 - HOIST
      ?auto_7531 - PLACE
      ?auto_7525 - PLACE
      ?auto_7529 - HOIST
      ?auto_7537 - SURFACE
      ?auto_7532 - PLACE
      ?auto_7536 - HOIST
      ?auto_7528 - SURFACE
      ?auto_7535 - PLACE
      ?auto_7534 - HOIST
      ?auto_7530 - SURFACE
      ?auto_7527 - SURFACE
      ?auto_7526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7533 ?auto_7531 ) ( IS-CRATE ?auto_7524 ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7522 ?auto_7524 ) ) ( not ( = ?auto_7525 ?auto_7531 ) ) ( HOIST-AT ?auto_7529 ?auto_7525 ) ( not ( = ?auto_7533 ?auto_7529 ) ) ( SURFACE-AT ?auto_7524 ?auto_7525 ) ( ON ?auto_7524 ?auto_7537 ) ( CLEAR ?auto_7524 ) ( not ( = ?auto_7523 ?auto_7537 ) ) ( not ( = ?auto_7524 ?auto_7537 ) ) ( not ( = ?auto_7522 ?auto_7537 ) ) ( IS-CRATE ?auto_7523 ) ( not ( = ?auto_7532 ?auto_7531 ) ) ( not ( = ?auto_7525 ?auto_7532 ) ) ( HOIST-AT ?auto_7536 ?auto_7532 ) ( not ( = ?auto_7533 ?auto_7536 ) ) ( not ( = ?auto_7529 ?auto_7536 ) ) ( AVAILABLE ?auto_7536 ) ( SURFACE-AT ?auto_7523 ?auto_7532 ) ( ON ?auto_7523 ?auto_7528 ) ( CLEAR ?auto_7523 ) ( not ( = ?auto_7523 ?auto_7528 ) ) ( not ( = ?auto_7524 ?auto_7528 ) ) ( not ( = ?auto_7522 ?auto_7528 ) ) ( not ( = ?auto_7537 ?auto_7528 ) ) ( IS-CRATE ?auto_7522 ) ( not ( = ?auto_7521 ?auto_7522 ) ) ( not ( = ?auto_7523 ?auto_7521 ) ) ( not ( = ?auto_7524 ?auto_7521 ) ) ( not ( = ?auto_7537 ?auto_7521 ) ) ( not ( = ?auto_7528 ?auto_7521 ) ) ( not ( = ?auto_7535 ?auto_7531 ) ) ( not ( = ?auto_7525 ?auto_7535 ) ) ( not ( = ?auto_7532 ?auto_7535 ) ) ( HOIST-AT ?auto_7534 ?auto_7535 ) ( not ( = ?auto_7533 ?auto_7534 ) ) ( not ( = ?auto_7529 ?auto_7534 ) ) ( not ( = ?auto_7536 ?auto_7534 ) ) ( AVAILABLE ?auto_7534 ) ( SURFACE-AT ?auto_7522 ?auto_7535 ) ( ON ?auto_7522 ?auto_7530 ) ( CLEAR ?auto_7522 ) ( not ( = ?auto_7523 ?auto_7530 ) ) ( not ( = ?auto_7524 ?auto_7530 ) ) ( not ( = ?auto_7522 ?auto_7530 ) ) ( not ( = ?auto_7537 ?auto_7530 ) ) ( not ( = ?auto_7528 ?auto_7530 ) ) ( not ( = ?auto_7521 ?auto_7530 ) ) ( SURFACE-AT ?auto_7520 ?auto_7531 ) ( CLEAR ?auto_7520 ) ( IS-CRATE ?auto_7521 ) ( not ( = ?auto_7520 ?auto_7521 ) ) ( not ( = ?auto_7523 ?auto_7520 ) ) ( not ( = ?auto_7524 ?auto_7520 ) ) ( not ( = ?auto_7522 ?auto_7520 ) ) ( not ( = ?auto_7537 ?auto_7520 ) ) ( not ( = ?auto_7528 ?auto_7520 ) ) ( not ( = ?auto_7530 ?auto_7520 ) ) ( AVAILABLE ?auto_7533 ) ( AVAILABLE ?auto_7529 ) ( SURFACE-AT ?auto_7521 ?auto_7525 ) ( ON ?auto_7521 ?auto_7527 ) ( CLEAR ?auto_7521 ) ( not ( = ?auto_7523 ?auto_7527 ) ) ( not ( = ?auto_7524 ?auto_7527 ) ) ( not ( = ?auto_7522 ?auto_7527 ) ) ( not ( = ?auto_7537 ?auto_7527 ) ) ( not ( = ?auto_7528 ?auto_7527 ) ) ( not ( = ?auto_7521 ?auto_7527 ) ) ( not ( = ?auto_7530 ?auto_7527 ) ) ( not ( = ?auto_7520 ?auto_7527 ) ) ( TRUCK-AT ?auto_7526 ?auto_7531 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7522 ?auto_7523 ?auto_7524 )
      ( MAKE-4CRATE-VERIFY ?auto_7520 ?auto_7521 ?auto_7522 ?auto_7523 ?auto_7524 ) )
  )

)

