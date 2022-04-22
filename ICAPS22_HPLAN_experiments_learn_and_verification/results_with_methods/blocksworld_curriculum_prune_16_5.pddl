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
      ?auto_496306 - BLOCK
    )
    :vars
    (
      ?auto_496307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496306 ?auto_496307 ) ( CLEAR ?auto_496306 ) ( HAND-EMPTY ) ( not ( = ?auto_496306 ?auto_496307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496306 ?auto_496307 )
      ( !PUTDOWN ?auto_496306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_496313 - BLOCK
      ?auto_496314 - BLOCK
    )
    :vars
    (
      ?auto_496315 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496313 ) ( ON ?auto_496314 ?auto_496315 ) ( CLEAR ?auto_496314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496313 ) ( not ( = ?auto_496313 ?auto_496314 ) ) ( not ( = ?auto_496313 ?auto_496315 ) ) ( not ( = ?auto_496314 ?auto_496315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496314 ?auto_496315 )
      ( !STACK ?auto_496314 ?auto_496313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_496323 - BLOCK
      ?auto_496324 - BLOCK
    )
    :vars
    (
      ?auto_496325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496324 ?auto_496325 ) ( not ( = ?auto_496323 ?auto_496324 ) ) ( not ( = ?auto_496323 ?auto_496325 ) ) ( not ( = ?auto_496324 ?auto_496325 ) ) ( ON ?auto_496323 ?auto_496324 ) ( CLEAR ?auto_496323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496323 )
      ( MAKE-2PILE ?auto_496323 ?auto_496324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_496334 - BLOCK
      ?auto_496335 - BLOCK
      ?auto_496336 - BLOCK
    )
    :vars
    (
      ?auto_496337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496335 ) ( ON ?auto_496336 ?auto_496337 ) ( CLEAR ?auto_496336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496334 ) ( ON ?auto_496335 ?auto_496334 ) ( not ( = ?auto_496334 ?auto_496335 ) ) ( not ( = ?auto_496334 ?auto_496336 ) ) ( not ( = ?auto_496334 ?auto_496337 ) ) ( not ( = ?auto_496335 ?auto_496336 ) ) ( not ( = ?auto_496335 ?auto_496337 ) ) ( not ( = ?auto_496336 ?auto_496337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496336 ?auto_496337 )
      ( !STACK ?auto_496336 ?auto_496335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_496348 - BLOCK
      ?auto_496349 - BLOCK
      ?auto_496350 - BLOCK
    )
    :vars
    (
      ?auto_496351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496350 ?auto_496351 ) ( ON-TABLE ?auto_496348 ) ( not ( = ?auto_496348 ?auto_496349 ) ) ( not ( = ?auto_496348 ?auto_496350 ) ) ( not ( = ?auto_496348 ?auto_496351 ) ) ( not ( = ?auto_496349 ?auto_496350 ) ) ( not ( = ?auto_496349 ?auto_496351 ) ) ( not ( = ?auto_496350 ?auto_496351 ) ) ( CLEAR ?auto_496348 ) ( ON ?auto_496349 ?auto_496350 ) ( CLEAR ?auto_496349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496348 ?auto_496349 )
      ( MAKE-3PILE ?auto_496348 ?auto_496349 ?auto_496350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_496362 - BLOCK
      ?auto_496363 - BLOCK
      ?auto_496364 - BLOCK
    )
    :vars
    (
      ?auto_496365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496364 ?auto_496365 ) ( not ( = ?auto_496362 ?auto_496363 ) ) ( not ( = ?auto_496362 ?auto_496364 ) ) ( not ( = ?auto_496362 ?auto_496365 ) ) ( not ( = ?auto_496363 ?auto_496364 ) ) ( not ( = ?auto_496363 ?auto_496365 ) ) ( not ( = ?auto_496364 ?auto_496365 ) ) ( ON ?auto_496363 ?auto_496364 ) ( ON ?auto_496362 ?auto_496363 ) ( CLEAR ?auto_496362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496362 )
      ( MAKE-3PILE ?auto_496362 ?auto_496363 ?auto_496364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_496377 - BLOCK
      ?auto_496378 - BLOCK
      ?auto_496379 - BLOCK
      ?auto_496380 - BLOCK
    )
    :vars
    (
      ?auto_496381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496379 ) ( ON ?auto_496380 ?auto_496381 ) ( CLEAR ?auto_496380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496377 ) ( ON ?auto_496378 ?auto_496377 ) ( ON ?auto_496379 ?auto_496378 ) ( not ( = ?auto_496377 ?auto_496378 ) ) ( not ( = ?auto_496377 ?auto_496379 ) ) ( not ( = ?auto_496377 ?auto_496380 ) ) ( not ( = ?auto_496377 ?auto_496381 ) ) ( not ( = ?auto_496378 ?auto_496379 ) ) ( not ( = ?auto_496378 ?auto_496380 ) ) ( not ( = ?auto_496378 ?auto_496381 ) ) ( not ( = ?auto_496379 ?auto_496380 ) ) ( not ( = ?auto_496379 ?auto_496381 ) ) ( not ( = ?auto_496380 ?auto_496381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496380 ?auto_496381 )
      ( !STACK ?auto_496380 ?auto_496379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_496395 - BLOCK
      ?auto_496396 - BLOCK
      ?auto_496397 - BLOCK
      ?auto_496398 - BLOCK
    )
    :vars
    (
      ?auto_496399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496398 ?auto_496399 ) ( ON-TABLE ?auto_496395 ) ( ON ?auto_496396 ?auto_496395 ) ( not ( = ?auto_496395 ?auto_496396 ) ) ( not ( = ?auto_496395 ?auto_496397 ) ) ( not ( = ?auto_496395 ?auto_496398 ) ) ( not ( = ?auto_496395 ?auto_496399 ) ) ( not ( = ?auto_496396 ?auto_496397 ) ) ( not ( = ?auto_496396 ?auto_496398 ) ) ( not ( = ?auto_496396 ?auto_496399 ) ) ( not ( = ?auto_496397 ?auto_496398 ) ) ( not ( = ?auto_496397 ?auto_496399 ) ) ( not ( = ?auto_496398 ?auto_496399 ) ) ( CLEAR ?auto_496396 ) ( ON ?auto_496397 ?auto_496398 ) ( CLEAR ?auto_496397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496395 ?auto_496396 ?auto_496397 )
      ( MAKE-4PILE ?auto_496395 ?auto_496396 ?auto_496397 ?auto_496398 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_496413 - BLOCK
      ?auto_496414 - BLOCK
      ?auto_496415 - BLOCK
      ?auto_496416 - BLOCK
    )
    :vars
    (
      ?auto_496417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496416 ?auto_496417 ) ( ON-TABLE ?auto_496413 ) ( not ( = ?auto_496413 ?auto_496414 ) ) ( not ( = ?auto_496413 ?auto_496415 ) ) ( not ( = ?auto_496413 ?auto_496416 ) ) ( not ( = ?auto_496413 ?auto_496417 ) ) ( not ( = ?auto_496414 ?auto_496415 ) ) ( not ( = ?auto_496414 ?auto_496416 ) ) ( not ( = ?auto_496414 ?auto_496417 ) ) ( not ( = ?auto_496415 ?auto_496416 ) ) ( not ( = ?auto_496415 ?auto_496417 ) ) ( not ( = ?auto_496416 ?auto_496417 ) ) ( ON ?auto_496415 ?auto_496416 ) ( CLEAR ?auto_496413 ) ( ON ?auto_496414 ?auto_496415 ) ( CLEAR ?auto_496414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496413 ?auto_496414 )
      ( MAKE-4PILE ?auto_496413 ?auto_496414 ?auto_496415 ?auto_496416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_496431 - BLOCK
      ?auto_496432 - BLOCK
      ?auto_496433 - BLOCK
      ?auto_496434 - BLOCK
    )
    :vars
    (
      ?auto_496435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496434 ?auto_496435 ) ( not ( = ?auto_496431 ?auto_496432 ) ) ( not ( = ?auto_496431 ?auto_496433 ) ) ( not ( = ?auto_496431 ?auto_496434 ) ) ( not ( = ?auto_496431 ?auto_496435 ) ) ( not ( = ?auto_496432 ?auto_496433 ) ) ( not ( = ?auto_496432 ?auto_496434 ) ) ( not ( = ?auto_496432 ?auto_496435 ) ) ( not ( = ?auto_496433 ?auto_496434 ) ) ( not ( = ?auto_496433 ?auto_496435 ) ) ( not ( = ?auto_496434 ?auto_496435 ) ) ( ON ?auto_496433 ?auto_496434 ) ( ON ?auto_496432 ?auto_496433 ) ( ON ?auto_496431 ?auto_496432 ) ( CLEAR ?auto_496431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496431 )
      ( MAKE-4PILE ?auto_496431 ?auto_496432 ?auto_496433 ?auto_496434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_496450 - BLOCK
      ?auto_496451 - BLOCK
      ?auto_496452 - BLOCK
      ?auto_496453 - BLOCK
      ?auto_496454 - BLOCK
    )
    :vars
    (
      ?auto_496455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496453 ) ( ON ?auto_496454 ?auto_496455 ) ( CLEAR ?auto_496454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496450 ) ( ON ?auto_496451 ?auto_496450 ) ( ON ?auto_496452 ?auto_496451 ) ( ON ?auto_496453 ?auto_496452 ) ( not ( = ?auto_496450 ?auto_496451 ) ) ( not ( = ?auto_496450 ?auto_496452 ) ) ( not ( = ?auto_496450 ?auto_496453 ) ) ( not ( = ?auto_496450 ?auto_496454 ) ) ( not ( = ?auto_496450 ?auto_496455 ) ) ( not ( = ?auto_496451 ?auto_496452 ) ) ( not ( = ?auto_496451 ?auto_496453 ) ) ( not ( = ?auto_496451 ?auto_496454 ) ) ( not ( = ?auto_496451 ?auto_496455 ) ) ( not ( = ?auto_496452 ?auto_496453 ) ) ( not ( = ?auto_496452 ?auto_496454 ) ) ( not ( = ?auto_496452 ?auto_496455 ) ) ( not ( = ?auto_496453 ?auto_496454 ) ) ( not ( = ?auto_496453 ?auto_496455 ) ) ( not ( = ?auto_496454 ?auto_496455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496454 ?auto_496455 )
      ( !STACK ?auto_496454 ?auto_496453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_496472 - BLOCK
      ?auto_496473 - BLOCK
      ?auto_496474 - BLOCK
      ?auto_496475 - BLOCK
      ?auto_496476 - BLOCK
    )
    :vars
    (
      ?auto_496477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496476 ?auto_496477 ) ( ON-TABLE ?auto_496472 ) ( ON ?auto_496473 ?auto_496472 ) ( ON ?auto_496474 ?auto_496473 ) ( not ( = ?auto_496472 ?auto_496473 ) ) ( not ( = ?auto_496472 ?auto_496474 ) ) ( not ( = ?auto_496472 ?auto_496475 ) ) ( not ( = ?auto_496472 ?auto_496476 ) ) ( not ( = ?auto_496472 ?auto_496477 ) ) ( not ( = ?auto_496473 ?auto_496474 ) ) ( not ( = ?auto_496473 ?auto_496475 ) ) ( not ( = ?auto_496473 ?auto_496476 ) ) ( not ( = ?auto_496473 ?auto_496477 ) ) ( not ( = ?auto_496474 ?auto_496475 ) ) ( not ( = ?auto_496474 ?auto_496476 ) ) ( not ( = ?auto_496474 ?auto_496477 ) ) ( not ( = ?auto_496475 ?auto_496476 ) ) ( not ( = ?auto_496475 ?auto_496477 ) ) ( not ( = ?auto_496476 ?auto_496477 ) ) ( CLEAR ?auto_496474 ) ( ON ?auto_496475 ?auto_496476 ) ( CLEAR ?auto_496475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_496472 ?auto_496473 ?auto_496474 ?auto_496475 )
      ( MAKE-5PILE ?auto_496472 ?auto_496473 ?auto_496474 ?auto_496475 ?auto_496476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_496494 - BLOCK
      ?auto_496495 - BLOCK
      ?auto_496496 - BLOCK
      ?auto_496497 - BLOCK
      ?auto_496498 - BLOCK
    )
    :vars
    (
      ?auto_496499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496498 ?auto_496499 ) ( ON-TABLE ?auto_496494 ) ( ON ?auto_496495 ?auto_496494 ) ( not ( = ?auto_496494 ?auto_496495 ) ) ( not ( = ?auto_496494 ?auto_496496 ) ) ( not ( = ?auto_496494 ?auto_496497 ) ) ( not ( = ?auto_496494 ?auto_496498 ) ) ( not ( = ?auto_496494 ?auto_496499 ) ) ( not ( = ?auto_496495 ?auto_496496 ) ) ( not ( = ?auto_496495 ?auto_496497 ) ) ( not ( = ?auto_496495 ?auto_496498 ) ) ( not ( = ?auto_496495 ?auto_496499 ) ) ( not ( = ?auto_496496 ?auto_496497 ) ) ( not ( = ?auto_496496 ?auto_496498 ) ) ( not ( = ?auto_496496 ?auto_496499 ) ) ( not ( = ?auto_496497 ?auto_496498 ) ) ( not ( = ?auto_496497 ?auto_496499 ) ) ( not ( = ?auto_496498 ?auto_496499 ) ) ( ON ?auto_496497 ?auto_496498 ) ( CLEAR ?auto_496495 ) ( ON ?auto_496496 ?auto_496497 ) ( CLEAR ?auto_496496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496494 ?auto_496495 ?auto_496496 )
      ( MAKE-5PILE ?auto_496494 ?auto_496495 ?auto_496496 ?auto_496497 ?auto_496498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_496516 - BLOCK
      ?auto_496517 - BLOCK
      ?auto_496518 - BLOCK
      ?auto_496519 - BLOCK
      ?auto_496520 - BLOCK
    )
    :vars
    (
      ?auto_496521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496520 ?auto_496521 ) ( ON-TABLE ?auto_496516 ) ( not ( = ?auto_496516 ?auto_496517 ) ) ( not ( = ?auto_496516 ?auto_496518 ) ) ( not ( = ?auto_496516 ?auto_496519 ) ) ( not ( = ?auto_496516 ?auto_496520 ) ) ( not ( = ?auto_496516 ?auto_496521 ) ) ( not ( = ?auto_496517 ?auto_496518 ) ) ( not ( = ?auto_496517 ?auto_496519 ) ) ( not ( = ?auto_496517 ?auto_496520 ) ) ( not ( = ?auto_496517 ?auto_496521 ) ) ( not ( = ?auto_496518 ?auto_496519 ) ) ( not ( = ?auto_496518 ?auto_496520 ) ) ( not ( = ?auto_496518 ?auto_496521 ) ) ( not ( = ?auto_496519 ?auto_496520 ) ) ( not ( = ?auto_496519 ?auto_496521 ) ) ( not ( = ?auto_496520 ?auto_496521 ) ) ( ON ?auto_496519 ?auto_496520 ) ( ON ?auto_496518 ?auto_496519 ) ( CLEAR ?auto_496516 ) ( ON ?auto_496517 ?auto_496518 ) ( CLEAR ?auto_496517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496516 ?auto_496517 )
      ( MAKE-5PILE ?auto_496516 ?auto_496517 ?auto_496518 ?auto_496519 ?auto_496520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_496538 - BLOCK
      ?auto_496539 - BLOCK
      ?auto_496540 - BLOCK
      ?auto_496541 - BLOCK
      ?auto_496542 - BLOCK
    )
    :vars
    (
      ?auto_496543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496542 ?auto_496543 ) ( not ( = ?auto_496538 ?auto_496539 ) ) ( not ( = ?auto_496538 ?auto_496540 ) ) ( not ( = ?auto_496538 ?auto_496541 ) ) ( not ( = ?auto_496538 ?auto_496542 ) ) ( not ( = ?auto_496538 ?auto_496543 ) ) ( not ( = ?auto_496539 ?auto_496540 ) ) ( not ( = ?auto_496539 ?auto_496541 ) ) ( not ( = ?auto_496539 ?auto_496542 ) ) ( not ( = ?auto_496539 ?auto_496543 ) ) ( not ( = ?auto_496540 ?auto_496541 ) ) ( not ( = ?auto_496540 ?auto_496542 ) ) ( not ( = ?auto_496540 ?auto_496543 ) ) ( not ( = ?auto_496541 ?auto_496542 ) ) ( not ( = ?auto_496541 ?auto_496543 ) ) ( not ( = ?auto_496542 ?auto_496543 ) ) ( ON ?auto_496541 ?auto_496542 ) ( ON ?auto_496540 ?auto_496541 ) ( ON ?auto_496539 ?auto_496540 ) ( ON ?auto_496538 ?auto_496539 ) ( CLEAR ?auto_496538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496538 )
      ( MAKE-5PILE ?auto_496538 ?auto_496539 ?auto_496540 ?auto_496541 ?auto_496542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496561 - BLOCK
      ?auto_496562 - BLOCK
      ?auto_496563 - BLOCK
      ?auto_496564 - BLOCK
      ?auto_496565 - BLOCK
      ?auto_496566 - BLOCK
    )
    :vars
    (
      ?auto_496567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496565 ) ( ON ?auto_496566 ?auto_496567 ) ( CLEAR ?auto_496566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496561 ) ( ON ?auto_496562 ?auto_496561 ) ( ON ?auto_496563 ?auto_496562 ) ( ON ?auto_496564 ?auto_496563 ) ( ON ?auto_496565 ?auto_496564 ) ( not ( = ?auto_496561 ?auto_496562 ) ) ( not ( = ?auto_496561 ?auto_496563 ) ) ( not ( = ?auto_496561 ?auto_496564 ) ) ( not ( = ?auto_496561 ?auto_496565 ) ) ( not ( = ?auto_496561 ?auto_496566 ) ) ( not ( = ?auto_496561 ?auto_496567 ) ) ( not ( = ?auto_496562 ?auto_496563 ) ) ( not ( = ?auto_496562 ?auto_496564 ) ) ( not ( = ?auto_496562 ?auto_496565 ) ) ( not ( = ?auto_496562 ?auto_496566 ) ) ( not ( = ?auto_496562 ?auto_496567 ) ) ( not ( = ?auto_496563 ?auto_496564 ) ) ( not ( = ?auto_496563 ?auto_496565 ) ) ( not ( = ?auto_496563 ?auto_496566 ) ) ( not ( = ?auto_496563 ?auto_496567 ) ) ( not ( = ?auto_496564 ?auto_496565 ) ) ( not ( = ?auto_496564 ?auto_496566 ) ) ( not ( = ?auto_496564 ?auto_496567 ) ) ( not ( = ?auto_496565 ?auto_496566 ) ) ( not ( = ?auto_496565 ?auto_496567 ) ) ( not ( = ?auto_496566 ?auto_496567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496566 ?auto_496567 )
      ( !STACK ?auto_496566 ?auto_496565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496587 - BLOCK
      ?auto_496588 - BLOCK
      ?auto_496589 - BLOCK
      ?auto_496590 - BLOCK
      ?auto_496591 - BLOCK
      ?auto_496592 - BLOCK
    )
    :vars
    (
      ?auto_496593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496592 ?auto_496593 ) ( ON-TABLE ?auto_496587 ) ( ON ?auto_496588 ?auto_496587 ) ( ON ?auto_496589 ?auto_496588 ) ( ON ?auto_496590 ?auto_496589 ) ( not ( = ?auto_496587 ?auto_496588 ) ) ( not ( = ?auto_496587 ?auto_496589 ) ) ( not ( = ?auto_496587 ?auto_496590 ) ) ( not ( = ?auto_496587 ?auto_496591 ) ) ( not ( = ?auto_496587 ?auto_496592 ) ) ( not ( = ?auto_496587 ?auto_496593 ) ) ( not ( = ?auto_496588 ?auto_496589 ) ) ( not ( = ?auto_496588 ?auto_496590 ) ) ( not ( = ?auto_496588 ?auto_496591 ) ) ( not ( = ?auto_496588 ?auto_496592 ) ) ( not ( = ?auto_496588 ?auto_496593 ) ) ( not ( = ?auto_496589 ?auto_496590 ) ) ( not ( = ?auto_496589 ?auto_496591 ) ) ( not ( = ?auto_496589 ?auto_496592 ) ) ( not ( = ?auto_496589 ?auto_496593 ) ) ( not ( = ?auto_496590 ?auto_496591 ) ) ( not ( = ?auto_496590 ?auto_496592 ) ) ( not ( = ?auto_496590 ?auto_496593 ) ) ( not ( = ?auto_496591 ?auto_496592 ) ) ( not ( = ?auto_496591 ?auto_496593 ) ) ( not ( = ?auto_496592 ?auto_496593 ) ) ( CLEAR ?auto_496590 ) ( ON ?auto_496591 ?auto_496592 ) ( CLEAR ?auto_496591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_496587 ?auto_496588 ?auto_496589 ?auto_496590 ?auto_496591 )
      ( MAKE-6PILE ?auto_496587 ?auto_496588 ?auto_496589 ?auto_496590 ?auto_496591 ?auto_496592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496613 - BLOCK
      ?auto_496614 - BLOCK
      ?auto_496615 - BLOCK
      ?auto_496616 - BLOCK
      ?auto_496617 - BLOCK
      ?auto_496618 - BLOCK
    )
    :vars
    (
      ?auto_496619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496618 ?auto_496619 ) ( ON-TABLE ?auto_496613 ) ( ON ?auto_496614 ?auto_496613 ) ( ON ?auto_496615 ?auto_496614 ) ( not ( = ?auto_496613 ?auto_496614 ) ) ( not ( = ?auto_496613 ?auto_496615 ) ) ( not ( = ?auto_496613 ?auto_496616 ) ) ( not ( = ?auto_496613 ?auto_496617 ) ) ( not ( = ?auto_496613 ?auto_496618 ) ) ( not ( = ?auto_496613 ?auto_496619 ) ) ( not ( = ?auto_496614 ?auto_496615 ) ) ( not ( = ?auto_496614 ?auto_496616 ) ) ( not ( = ?auto_496614 ?auto_496617 ) ) ( not ( = ?auto_496614 ?auto_496618 ) ) ( not ( = ?auto_496614 ?auto_496619 ) ) ( not ( = ?auto_496615 ?auto_496616 ) ) ( not ( = ?auto_496615 ?auto_496617 ) ) ( not ( = ?auto_496615 ?auto_496618 ) ) ( not ( = ?auto_496615 ?auto_496619 ) ) ( not ( = ?auto_496616 ?auto_496617 ) ) ( not ( = ?auto_496616 ?auto_496618 ) ) ( not ( = ?auto_496616 ?auto_496619 ) ) ( not ( = ?auto_496617 ?auto_496618 ) ) ( not ( = ?auto_496617 ?auto_496619 ) ) ( not ( = ?auto_496618 ?auto_496619 ) ) ( ON ?auto_496617 ?auto_496618 ) ( CLEAR ?auto_496615 ) ( ON ?auto_496616 ?auto_496617 ) ( CLEAR ?auto_496616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_496613 ?auto_496614 ?auto_496615 ?auto_496616 )
      ( MAKE-6PILE ?auto_496613 ?auto_496614 ?auto_496615 ?auto_496616 ?auto_496617 ?auto_496618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496639 - BLOCK
      ?auto_496640 - BLOCK
      ?auto_496641 - BLOCK
      ?auto_496642 - BLOCK
      ?auto_496643 - BLOCK
      ?auto_496644 - BLOCK
    )
    :vars
    (
      ?auto_496645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496644 ?auto_496645 ) ( ON-TABLE ?auto_496639 ) ( ON ?auto_496640 ?auto_496639 ) ( not ( = ?auto_496639 ?auto_496640 ) ) ( not ( = ?auto_496639 ?auto_496641 ) ) ( not ( = ?auto_496639 ?auto_496642 ) ) ( not ( = ?auto_496639 ?auto_496643 ) ) ( not ( = ?auto_496639 ?auto_496644 ) ) ( not ( = ?auto_496639 ?auto_496645 ) ) ( not ( = ?auto_496640 ?auto_496641 ) ) ( not ( = ?auto_496640 ?auto_496642 ) ) ( not ( = ?auto_496640 ?auto_496643 ) ) ( not ( = ?auto_496640 ?auto_496644 ) ) ( not ( = ?auto_496640 ?auto_496645 ) ) ( not ( = ?auto_496641 ?auto_496642 ) ) ( not ( = ?auto_496641 ?auto_496643 ) ) ( not ( = ?auto_496641 ?auto_496644 ) ) ( not ( = ?auto_496641 ?auto_496645 ) ) ( not ( = ?auto_496642 ?auto_496643 ) ) ( not ( = ?auto_496642 ?auto_496644 ) ) ( not ( = ?auto_496642 ?auto_496645 ) ) ( not ( = ?auto_496643 ?auto_496644 ) ) ( not ( = ?auto_496643 ?auto_496645 ) ) ( not ( = ?auto_496644 ?auto_496645 ) ) ( ON ?auto_496643 ?auto_496644 ) ( ON ?auto_496642 ?auto_496643 ) ( CLEAR ?auto_496640 ) ( ON ?auto_496641 ?auto_496642 ) ( CLEAR ?auto_496641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496639 ?auto_496640 ?auto_496641 )
      ( MAKE-6PILE ?auto_496639 ?auto_496640 ?auto_496641 ?auto_496642 ?auto_496643 ?auto_496644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496665 - BLOCK
      ?auto_496666 - BLOCK
      ?auto_496667 - BLOCK
      ?auto_496668 - BLOCK
      ?auto_496669 - BLOCK
      ?auto_496670 - BLOCK
    )
    :vars
    (
      ?auto_496671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496670 ?auto_496671 ) ( ON-TABLE ?auto_496665 ) ( not ( = ?auto_496665 ?auto_496666 ) ) ( not ( = ?auto_496665 ?auto_496667 ) ) ( not ( = ?auto_496665 ?auto_496668 ) ) ( not ( = ?auto_496665 ?auto_496669 ) ) ( not ( = ?auto_496665 ?auto_496670 ) ) ( not ( = ?auto_496665 ?auto_496671 ) ) ( not ( = ?auto_496666 ?auto_496667 ) ) ( not ( = ?auto_496666 ?auto_496668 ) ) ( not ( = ?auto_496666 ?auto_496669 ) ) ( not ( = ?auto_496666 ?auto_496670 ) ) ( not ( = ?auto_496666 ?auto_496671 ) ) ( not ( = ?auto_496667 ?auto_496668 ) ) ( not ( = ?auto_496667 ?auto_496669 ) ) ( not ( = ?auto_496667 ?auto_496670 ) ) ( not ( = ?auto_496667 ?auto_496671 ) ) ( not ( = ?auto_496668 ?auto_496669 ) ) ( not ( = ?auto_496668 ?auto_496670 ) ) ( not ( = ?auto_496668 ?auto_496671 ) ) ( not ( = ?auto_496669 ?auto_496670 ) ) ( not ( = ?auto_496669 ?auto_496671 ) ) ( not ( = ?auto_496670 ?auto_496671 ) ) ( ON ?auto_496669 ?auto_496670 ) ( ON ?auto_496668 ?auto_496669 ) ( ON ?auto_496667 ?auto_496668 ) ( CLEAR ?auto_496665 ) ( ON ?auto_496666 ?auto_496667 ) ( CLEAR ?auto_496666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496665 ?auto_496666 )
      ( MAKE-6PILE ?auto_496665 ?auto_496666 ?auto_496667 ?auto_496668 ?auto_496669 ?auto_496670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_496691 - BLOCK
      ?auto_496692 - BLOCK
      ?auto_496693 - BLOCK
      ?auto_496694 - BLOCK
      ?auto_496695 - BLOCK
      ?auto_496696 - BLOCK
    )
    :vars
    (
      ?auto_496697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496696 ?auto_496697 ) ( not ( = ?auto_496691 ?auto_496692 ) ) ( not ( = ?auto_496691 ?auto_496693 ) ) ( not ( = ?auto_496691 ?auto_496694 ) ) ( not ( = ?auto_496691 ?auto_496695 ) ) ( not ( = ?auto_496691 ?auto_496696 ) ) ( not ( = ?auto_496691 ?auto_496697 ) ) ( not ( = ?auto_496692 ?auto_496693 ) ) ( not ( = ?auto_496692 ?auto_496694 ) ) ( not ( = ?auto_496692 ?auto_496695 ) ) ( not ( = ?auto_496692 ?auto_496696 ) ) ( not ( = ?auto_496692 ?auto_496697 ) ) ( not ( = ?auto_496693 ?auto_496694 ) ) ( not ( = ?auto_496693 ?auto_496695 ) ) ( not ( = ?auto_496693 ?auto_496696 ) ) ( not ( = ?auto_496693 ?auto_496697 ) ) ( not ( = ?auto_496694 ?auto_496695 ) ) ( not ( = ?auto_496694 ?auto_496696 ) ) ( not ( = ?auto_496694 ?auto_496697 ) ) ( not ( = ?auto_496695 ?auto_496696 ) ) ( not ( = ?auto_496695 ?auto_496697 ) ) ( not ( = ?auto_496696 ?auto_496697 ) ) ( ON ?auto_496695 ?auto_496696 ) ( ON ?auto_496694 ?auto_496695 ) ( ON ?auto_496693 ?auto_496694 ) ( ON ?auto_496692 ?auto_496693 ) ( ON ?auto_496691 ?auto_496692 ) ( CLEAR ?auto_496691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496691 )
      ( MAKE-6PILE ?auto_496691 ?auto_496692 ?auto_496693 ?auto_496694 ?auto_496695 ?auto_496696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496718 - BLOCK
      ?auto_496719 - BLOCK
      ?auto_496720 - BLOCK
      ?auto_496721 - BLOCK
      ?auto_496722 - BLOCK
      ?auto_496723 - BLOCK
      ?auto_496724 - BLOCK
    )
    :vars
    (
      ?auto_496725 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496723 ) ( ON ?auto_496724 ?auto_496725 ) ( CLEAR ?auto_496724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496718 ) ( ON ?auto_496719 ?auto_496718 ) ( ON ?auto_496720 ?auto_496719 ) ( ON ?auto_496721 ?auto_496720 ) ( ON ?auto_496722 ?auto_496721 ) ( ON ?auto_496723 ?auto_496722 ) ( not ( = ?auto_496718 ?auto_496719 ) ) ( not ( = ?auto_496718 ?auto_496720 ) ) ( not ( = ?auto_496718 ?auto_496721 ) ) ( not ( = ?auto_496718 ?auto_496722 ) ) ( not ( = ?auto_496718 ?auto_496723 ) ) ( not ( = ?auto_496718 ?auto_496724 ) ) ( not ( = ?auto_496718 ?auto_496725 ) ) ( not ( = ?auto_496719 ?auto_496720 ) ) ( not ( = ?auto_496719 ?auto_496721 ) ) ( not ( = ?auto_496719 ?auto_496722 ) ) ( not ( = ?auto_496719 ?auto_496723 ) ) ( not ( = ?auto_496719 ?auto_496724 ) ) ( not ( = ?auto_496719 ?auto_496725 ) ) ( not ( = ?auto_496720 ?auto_496721 ) ) ( not ( = ?auto_496720 ?auto_496722 ) ) ( not ( = ?auto_496720 ?auto_496723 ) ) ( not ( = ?auto_496720 ?auto_496724 ) ) ( not ( = ?auto_496720 ?auto_496725 ) ) ( not ( = ?auto_496721 ?auto_496722 ) ) ( not ( = ?auto_496721 ?auto_496723 ) ) ( not ( = ?auto_496721 ?auto_496724 ) ) ( not ( = ?auto_496721 ?auto_496725 ) ) ( not ( = ?auto_496722 ?auto_496723 ) ) ( not ( = ?auto_496722 ?auto_496724 ) ) ( not ( = ?auto_496722 ?auto_496725 ) ) ( not ( = ?auto_496723 ?auto_496724 ) ) ( not ( = ?auto_496723 ?auto_496725 ) ) ( not ( = ?auto_496724 ?auto_496725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496724 ?auto_496725 )
      ( !STACK ?auto_496724 ?auto_496723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496748 - BLOCK
      ?auto_496749 - BLOCK
      ?auto_496750 - BLOCK
      ?auto_496751 - BLOCK
      ?auto_496752 - BLOCK
      ?auto_496753 - BLOCK
      ?auto_496754 - BLOCK
    )
    :vars
    (
      ?auto_496755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496754 ?auto_496755 ) ( ON-TABLE ?auto_496748 ) ( ON ?auto_496749 ?auto_496748 ) ( ON ?auto_496750 ?auto_496749 ) ( ON ?auto_496751 ?auto_496750 ) ( ON ?auto_496752 ?auto_496751 ) ( not ( = ?auto_496748 ?auto_496749 ) ) ( not ( = ?auto_496748 ?auto_496750 ) ) ( not ( = ?auto_496748 ?auto_496751 ) ) ( not ( = ?auto_496748 ?auto_496752 ) ) ( not ( = ?auto_496748 ?auto_496753 ) ) ( not ( = ?auto_496748 ?auto_496754 ) ) ( not ( = ?auto_496748 ?auto_496755 ) ) ( not ( = ?auto_496749 ?auto_496750 ) ) ( not ( = ?auto_496749 ?auto_496751 ) ) ( not ( = ?auto_496749 ?auto_496752 ) ) ( not ( = ?auto_496749 ?auto_496753 ) ) ( not ( = ?auto_496749 ?auto_496754 ) ) ( not ( = ?auto_496749 ?auto_496755 ) ) ( not ( = ?auto_496750 ?auto_496751 ) ) ( not ( = ?auto_496750 ?auto_496752 ) ) ( not ( = ?auto_496750 ?auto_496753 ) ) ( not ( = ?auto_496750 ?auto_496754 ) ) ( not ( = ?auto_496750 ?auto_496755 ) ) ( not ( = ?auto_496751 ?auto_496752 ) ) ( not ( = ?auto_496751 ?auto_496753 ) ) ( not ( = ?auto_496751 ?auto_496754 ) ) ( not ( = ?auto_496751 ?auto_496755 ) ) ( not ( = ?auto_496752 ?auto_496753 ) ) ( not ( = ?auto_496752 ?auto_496754 ) ) ( not ( = ?auto_496752 ?auto_496755 ) ) ( not ( = ?auto_496753 ?auto_496754 ) ) ( not ( = ?auto_496753 ?auto_496755 ) ) ( not ( = ?auto_496754 ?auto_496755 ) ) ( CLEAR ?auto_496752 ) ( ON ?auto_496753 ?auto_496754 ) ( CLEAR ?auto_496753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_496748 ?auto_496749 ?auto_496750 ?auto_496751 ?auto_496752 ?auto_496753 )
      ( MAKE-7PILE ?auto_496748 ?auto_496749 ?auto_496750 ?auto_496751 ?auto_496752 ?auto_496753 ?auto_496754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496778 - BLOCK
      ?auto_496779 - BLOCK
      ?auto_496780 - BLOCK
      ?auto_496781 - BLOCK
      ?auto_496782 - BLOCK
      ?auto_496783 - BLOCK
      ?auto_496784 - BLOCK
    )
    :vars
    (
      ?auto_496785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496784 ?auto_496785 ) ( ON-TABLE ?auto_496778 ) ( ON ?auto_496779 ?auto_496778 ) ( ON ?auto_496780 ?auto_496779 ) ( ON ?auto_496781 ?auto_496780 ) ( not ( = ?auto_496778 ?auto_496779 ) ) ( not ( = ?auto_496778 ?auto_496780 ) ) ( not ( = ?auto_496778 ?auto_496781 ) ) ( not ( = ?auto_496778 ?auto_496782 ) ) ( not ( = ?auto_496778 ?auto_496783 ) ) ( not ( = ?auto_496778 ?auto_496784 ) ) ( not ( = ?auto_496778 ?auto_496785 ) ) ( not ( = ?auto_496779 ?auto_496780 ) ) ( not ( = ?auto_496779 ?auto_496781 ) ) ( not ( = ?auto_496779 ?auto_496782 ) ) ( not ( = ?auto_496779 ?auto_496783 ) ) ( not ( = ?auto_496779 ?auto_496784 ) ) ( not ( = ?auto_496779 ?auto_496785 ) ) ( not ( = ?auto_496780 ?auto_496781 ) ) ( not ( = ?auto_496780 ?auto_496782 ) ) ( not ( = ?auto_496780 ?auto_496783 ) ) ( not ( = ?auto_496780 ?auto_496784 ) ) ( not ( = ?auto_496780 ?auto_496785 ) ) ( not ( = ?auto_496781 ?auto_496782 ) ) ( not ( = ?auto_496781 ?auto_496783 ) ) ( not ( = ?auto_496781 ?auto_496784 ) ) ( not ( = ?auto_496781 ?auto_496785 ) ) ( not ( = ?auto_496782 ?auto_496783 ) ) ( not ( = ?auto_496782 ?auto_496784 ) ) ( not ( = ?auto_496782 ?auto_496785 ) ) ( not ( = ?auto_496783 ?auto_496784 ) ) ( not ( = ?auto_496783 ?auto_496785 ) ) ( not ( = ?auto_496784 ?auto_496785 ) ) ( ON ?auto_496783 ?auto_496784 ) ( CLEAR ?auto_496781 ) ( ON ?auto_496782 ?auto_496783 ) ( CLEAR ?auto_496782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_496778 ?auto_496779 ?auto_496780 ?auto_496781 ?auto_496782 )
      ( MAKE-7PILE ?auto_496778 ?auto_496779 ?auto_496780 ?auto_496781 ?auto_496782 ?auto_496783 ?auto_496784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496808 - BLOCK
      ?auto_496809 - BLOCK
      ?auto_496810 - BLOCK
      ?auto_496811 - BLOCK
      ?auto_496812 - BLOCK
      ?auto_496813 - BLOCK
      ?auto_496814 - BLOCK
    )
    :vars
    (
      ?auto_496815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496814 ?auto_496815 ) ( ON-TABLE ?auto_496808 ) ( ON ?auto_496809 ?auto_496808 ) ( ON ?auto_496810 ?auto_496809 ) ( not ( = ?auto_496808 ?auto_496809 ) ) ( not ( = ?auto_496808 ?auto_496810 ) ) ( not ( = ?auto_496808 ?auto_496811 ) ) ( not ( = ?auto_496808 ?auto_496812 ) ) ( not ( = ?auto_496808 ?auto_496813 ) ) ( not ( = ?auto_496808 ?auto_496814 ) ) ( not ( = ?auto_496808 ?auto_496815 ) ) ( not ( = ?auto_496809 ?auto_496810 ) ) ( not ( = ?auto_496809 ?auto_496811 ) ) ( not ( = ?auto_496809 ?auto_496812 ) ) ( not ( = ?auto_496809 ?auto_496813 ) ) ( not ( = ?auto_496809 ?auto_496814 ) ) ( not ( = ?auto_496809 ?auto_496815 ) ) ( not ( = ?auto_496810 ?auto_496811 ) ) ( not ( = ?auto_496810 ?auto_496812 ) ) ( not ( = ?auto_496810 ?auto_496813 ) ) ( not ( = ?auto_496810 ?auto_496814 ) ) ( not ( = ?auto_496810 ?auto_496815 ) ) ( not ( = ?auto_496811 ?auto_496812 ) ) ( not ( = ?auto_496811 ?auto_496813 ) ) ( not ( = ?auto_496811 ?auto_496814 ) ) ( not ( = ?auto_496811 ?auto_496815 ) ) ( not ( = ?auto_496812 ?auto_496813 ) ) ( not ( = ?auto_496812 ?auto_496814 ) ) ( not ( = ?auto_496812 ?auto_496815 ) ) ( not ( = ?auto_496813 ?auto_496814 ) ) ( not ( = ?auto_496813 ?auto_496815 ) ) ( not ( = ?auto_496814 ?auto_496815 ) ) ( ON ?auto_496813 ?auto_496814 ) ( ON ?auto_496812 ?auto_496813 ) ( CLEAR ?auto_496810 ) ( ON ?auto_496811 ?auto_496812 ) ( CLEAR ?auto_496811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_496808 ?auto_496809 ?auto_496810 ?auto_496811 )
      ( MAKE-7PILE ?auto_496808 ?auto_496809 ?auto_496810 ?auto_496811 ?auto_496812 ?auto_496813 ?auto_496814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496838 - BLOCK
      ?auto_496839 - BLOCK
      ?auto_496840 - BLOCK
      ?auto_496841 - BLOCK
      ?auto_496842 - BLOCK
      ?auto_496843 - BLOCK
      ?auto_496844 - BLOCK
    )
    :vars
    (
      ?auto_496845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496844 ?auto_496845 ) ( ON-TABLE ?auto_496838 ) ( ON ?auto_496839 ?auto_496838 ) ( not ( = ?auto_496838 ?auto_496839 ) ) ( not ( = ?auto_496838 ?auto_496840 ) ) ( not ( = ?auto_496838 ?auto_496841 ) ) ( not ( = ?auto_496838 ?auto_496842 ) ) ( not ( = ?auto_496838 ?auto_496843 ) ) ( not ( = ?auto_496838 ?auto_496844 ) ) ( not ( = ?auto_496838 ?auto_496845 ) ) ( not ( = ?auto_496839 ?auto_496840 ) ) ( not ( = ?auto_496839 ?auto_496841 ) ) ( not ( = ?auto_496839 ?auto_496842 ) ) ( not ( = ?auto_496839 ?auto_496843 ) ) ( not ( = ?auto_496839 ?auto_496844 ) ) ( not ( = ?auto_496839 ?auto_496845 ) ) ( not ( = ?auto_496840 ?auto_496841 ) ) ( not ( = ?auto_496840 ?auto_496842 ) ) ( not ( = ?auto_496840 ?auto_496843 ) ) ( not ( = ?auto_496840 ?auto_496844 ) ) ( not ( = ?auto_496840 ?auto_496845 ) ) ( not ( = ?auto_496841 ?auto_496842 ) ) ( not ( = ?auto_496841 ?auto_496843 ) ) ( not ( = ?auto_496841 ?auto_496844 ) ) ( not ( = ?auto_496841 ?auto_496845 ) ) ( not ( = ?auto_496842 ?auto_496843 ) ) ( not ( = ?auto_496842 ?auto_496844 ) ) ( not ( = ?auto_496842 ?auto_496845 ) ) ( not ( = ?auto_496843 ?auto_496844 ) ) ( not ( = ?auto_496843 ?auto_496845 ) ) ( not ( = ?auto_496844 ?auto_496845 ) ) ( ON ?auto_496843 ?auto_496844 ) ( ON ?auto_496842 ?auto_496843 ) ( ON ?auto_496841 ?auto_496842 ) ( CLEAR ?auto_496839 ) ( ON ?auto_496840 ?auto_496841 ) ( CLEAR ?auto_496840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496838 ?auto_496839 ?auto_496840 )
      ( MAKE-7PILE ?auto_496838 ?auto_496839 ?auto_496840 ?auto_496841 ?auto_496842 ?auto_496843 ?auto_496844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496868 - BLOCK
      ?auto_496869 - BLOCK
      ?auto_496870 - BLOCK
      ?auto_496871 - BLOCK
      ?auto_496872 - BLOCK
      ?auto_496873 - BLOCK
      ?auto_496874 - BLOCK
    )
    :vars
    (
      ?auto_496875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496874 ?auto_496875 ) ( ON-TABLE ?auto_496868 ) ( not ( = ?auto_496868 ?auto_496869 ) ) ( not ( = ?auto_496868 ?auto_496870 ) ) ( not ( = ?auto_496868 ?auto_496871 ) ) ( not ( = ?auto_496868 ?auto_496872 ) ) ( not ( = ?auto_496868 ?auto_496873 ) ) ( not ( = ?auto_496868 ?auto_496874 ) ) ( not ( = ?auto_496868 ?auto_496875 ) ) ( not ( = ?auto_496869 ?auto_496870 ) ) ( not ( = ?auto_496869 ?auto_496871 ) ) ( not ( = ?auto_496869 ?auto_496872 ) ) ( not ( = ?auto_496869 ?auto_496873 ) ) ( not ( = ?auto_496869 ?auto_496874 ) ) ( not ( = ?auto_496869 ?auto_496875 ) ) ( not ( = ?auto_496870 ?auto_496871 ) ) ( not ( = ?auto_496870 ?auto_496872 ) ) ( not ( = ?auto_496870 ?auto_496873 ) ) ( not ( = ?auto_496870 ?auto_496874 ) ) ( not ( = ?auto_496870 ?auto_496875 ) ) ( not ( = ?auto_496871 ?auto_496872 ) ) ( not ( = ?auto_496871 ?auto_496873 ) ) ( not ( = ?auto_496871 ?auto_496874 ) ) ( not ( = ?auto_496871 ?auto_496875 ) ) ( not ( = ?auto_496872 ?auto_496873 ) ) ( not ( = ?auto_496872 ?auto_496874 ) ) ( not ( = ?auto_496872 ?auto_496875 ) ) ( not ( = ?auto_496873 ?auto_496874 ) ) ( not ( = ?auto_496873 ?auto_496875 ) ) ( not ( = ?auto_496874 ?auto_496875 ) ) ( ON ?auto_496873 ?auto_496874 ) ( ON ?auto_496872 ?auto_496873 ) ( ON ?auto_496871 ?auto_496872 ) ( ON ?auto_496870 ?auto_496871 ) ( CLEAR ?auto_496868 ) ( ON ?auto_496869 ?auto_496870 ) ( CLEAR ?auto_496869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496868 ?auto_496869 )
      ( MAKE-7PILE ?auto_496868 ?auto_496869 ?auto_496870 ?auto_496871 ?auto_496872 ?auto_496873 ?auto_496874 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_496898 - BLOCK
      ?auto_496899 - BLOCK
      ?auto_496900 - BLOCK
      ?auto_496901 - BLOCK
      ?auto_496902 - BLOCK
      ?auto_496903 - BLOCK
      ?auto_496904 - BLOCK
    )
    :vars
    (
      ?auto_496905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496904 ?auto_496905 ) ( not ( = ?auto_496898 ?auto_496899 ) ) ( not ( = ?auto_496898 ?auto_496900 ) ) ( not ( = ?auto_496898 ?auto_496901 ) ) ( not ( = ?auto_496898 ?auto_496902 ) ) ( not ( = ?auto_496898 ?auto_496903 ) ) ( not ( = ?auto_496898 ?auto_496904 ) ) ( not ( = ?auto_496898 ?auto_496905 ) ) ( not ( = ?auto_496899 ?auto_496900 ) ) ( not ( = ?auto_496899 ?auto_496901 ) ) ( not ( = ?auto_496899 ?auto_496902 ) ) ( not ( = ?auto_496899 ?auto_496903 ) ) ( not ( = ?auto_496899 ?auto_496904 ) ) ( not ( = ?auto_496899 ?auto_496905 ) ) ( not ( = ?auto_496900 ?auto_496901 ) ) ( not ( = ?auto_496900 ?auto_496902 ) ) ( not ( = ?auto_496900 ?auto_496903 ) ) ( not ( = ?auto_496900 ?auto_496904 ) ) ( not ( = ?auto_496900 ?auto_496905 ) ) ( not ( = ?auto_496901 ?auto_496902 ) ) ( not ( = ?auto_496901 ?auto_496903 ) ) ( not ( = ?auto_496901 ?auto_496904 ) ) ( not ( = ?auto_496901 ?auto_496905 ) ) ( not ( = ?auto_496902 ?auto_496903 ) ) ( not ( = ?auto_496902 ?auto_496904 ) ) ( not ( = ?auto_496902 ?auto_496905 ) ) ( not ( = ?auto_496903 ?auto_496904 ) ) ( not ( = ?auto_496903 ?auto_496905 ) ) ( not ( = ?auto_496904 ?auto_496905 ) ) ( ON ?auto_496903 ?auto_496904 ) ( ON ?auto_496902 ?auto_496903 ) ( ON ?auto_496901 ?auto_496902 ) ( ON ?auto_496900 ?auto_496901 ) ( ON ?auto_496899 ?auto_496900 ) ( ON ?auto_496898 ?auto_496899 ) ( CLEAR ?auto_496898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496898 )
      ( MAKE-7PILE ?auto_496898 ?auto_496899 ?auto_496900 ?auto_496901 ?auto_496902 ?auto_496903 ?auto_496904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_496929 - BLOCK
      ?auto_496930 - BLOCK
      ?auto_496931 - BLOCK
      ?auto_496932 - BLOCK
      ?auto_496933 - BLOCK
      ?auto_496934 - BLOCK
      ?auto_496935 - BLOCK
      ?auto_496936 - BLOCK
    )
    :vars
    (
      ?auto_496937 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_496935 ) ( ON ?auto_496936 ?auto_496937 ) ( CLEAR ?auto_496936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496929 ) ( ON ?auto_496930 ?auto_496929 ) ( ON ?auto_496931 ?auto_496930 ) ( ON ?auto_496932 ?auto_496931 ) ( ON ?auto_496933 ?auto_496932 ) ( ON ?auto_496934 ?auto_496933 ) ( ON ?auto_496935 ?auto_496934 ) ( not ( = ?auto_496929 ?auto_496930 ) ) ( not ( = ?auto_496929 ?auto_496931 ) ) ( not ( = ?auto_496929 ?auto_496932 ) ) ( not ( = ?auto_496929 ?auto_496933 ) ) ( not ( = ?auto_496929 ?auto_496934 ) ) ( not ( = ?auto_496929 ?auto_496935 ) ) ( not ( = ?auto_496929 ?auto_496936 ) ) ( not ( = ?auto_496929 ?auto_496937 ) ) ( not ( = ?auto_496930 ?auto_496931 ) ) ( not ( = ?auto_496930 ?auto_496932 ) ) ( not ( = ?auto_496930 ?auto_496933 ) ) ( not ( = ?auto_496930 ?auto_496934 ) ) ( not ( = ?auto_496930 ?auto_496935 ) ) ( not ( = ?auto_496930 ?auto_496936 ) ) ( not ( = ?auto_496930 ?auto_496937 ) ) ( not ( = ?auto_496931 ?auto_496932 ) ) ( not ( = ?auto_496931 ?auto_496933 ) ) ( not ( = ?auto_496931 ?auto_496934 ) ) ( not ( = ?auto_496931 ?auto_496935 ) ) ( not ( = ?auto_496931 ?auto_496936 ) ) ( not ( = ?auto_496931 ?auto_496937 ) ) ( not ( = ?auto_496932 ?auto_496933 ) ) ( not ( = ?auto_496932 ?auto_496934 ) ) ( not ( = ?auto_496932 ?auto_496935 ) ) ( not ( = ?auto_496932 ?auto_496936 ) ) ( not ( = ?auto_496932 ?auto_496937 ) ) ( not ( = ?auto_496933 ?auto_496934 ) ) ( not ( = ?auto_496933 ?auto_496935 ) ) ( not ( = ?auto_496933 ?auto_496936 ) ) ( not ( = ?auto_496933 ?auto_496937 ) ) ( not ( = ?auto_496934 ?auto_496935 ) ) ( not ( = ?auto_496934 ?auto_496936 ) ) ( not ( = ?auto_496934 ?auto_496937 ) ) ( not ( = ?auto_496935 ?auto_496936 ) ) ( not ( = ?auto_496935 ?auto_496937 ) ) ( not ( = ?auto_496936 ?auto_496937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_496936 ?auto_496937 )
      ( !STACK ?auto_496936 ?auto_496935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_496963 - BLOCK
      ?auto_496964 - BLOCK
      ?auto_496965 - BLOCK
      ?auto_496966 - BLOCK
      ?auto_496967 - BLOCK
      ?auto_496968 - BLOCK
      ?auto_496969 - BLOCK
      ?auto_496970 - BLOCK
    )
    :vars
    (
      ?auto_496971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496970 ?auto_496971 ) ( ON-TABLE ?auto_496963 ) ( ON ?auto_496964 ?auto_496963 ) ( ON ?auto_496965 ?auto_496964 ) ( ON ?auto_496966 ?auto_496965 ) ( ON ?auto_496967 ?auto_496966 ) ( ON ?auto_496968 ?auto_496967 ) ( not ( = ?auto_496963 ?auto_496964 ) ) ( not ( = ?auto_496963 ?auto_496965 ) ) ( not ( = ?auto_496963 ?auto_496966 ) ) ( not ( = ?auto_496963 ?auto_496967 ) ) ( not ( = ?auto_496963 ?auto_496968 ) ) ( not ( = ?auto_496963 ?auto_496969 ) ) ( not ( = ?auto_496963 ?auto_496970 ) ) ( not ( = ?auto_496963 ?auto_496971 ) ) ( not ( = ?auto_496964 ?auto_496965 ) ) ( not ( = ?auto_496964 ?auto_496966 ) ) ( not ( = ?auto_496964 ?auto_496967 ) ) ( not ( = ?auto_496964 ?auto_496968 ) ) ( not ( = ?auto_496964 ?auto_496969 ) ) ( not ( = ?auto_496964 ?auto_496970 ) ) ( not ( = ?auto_496964 ?auto_496971 ) ) ( not ( = ?auto_496965 ?auto_496966 ) ) ( not ( = ?auto_496965 ?auto_496967 ) ) ( not ( = ?auto_496965 ?auto_496968 ) ) ( not ( = ?auto_496965 ?auto_496969 ) ) ( not ( = ?auto_496965 ?auto_496970 ) ) ( not ( = ?auto_496965 ?auto_496971 ) ) ( not ( = ?auto_496966 ?auto_496967 ) ) ( not ( = ?auto_496966 ?auto_496968 ) ) ( not ( = ?auto_496966 ?auto_496969 ) ) ( not ( = ?auto_496966 ?auto_496970 ) ) ( not ( = ?auto_496966 ?auto_496971 ) ) ( not ( = ?auto_496967 ?auto_496968 ) ) ( not ( = ?auto_496967 ?auto_496969 ) ) ( not ( = ?auto_496967 ?auto_496970 ) ) ( not ( = ?auto_496967 ?auto_496971 ) ) ( not ( = ?auto_496968 ?auto_496969 ) ) ( not ( = ?auto_496968 ?auto_496970 ) ) ( not ( = ?auto_496968 ?auto_496971 ) ) ( not ( = ?auto_496969 ?auto_496970 ) ) ( not ( = ?auto_496969 ?auto_496971 ) ) ( not ( = ?auto_496970 ?auto_496971 ) ) ( CLEAR ?auto_496968 ) ( ON ?auto_496969 ?auto_496970 ) ( CLEAR ?auto_496969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_496963 ?auto_496964 ?auto_496965 ?auto_496966 ?auto_496967 ?auto_496968 ?auto_496969 )
      ( MAKE-8PILE ?auto_496963 ?auto_496964 ?auto_496965 ?auto_496966 ?auto_496967 ?auto_496968 ?auto_496969 ?auto_496970 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_496997 - BLOCK
      ?auto_496998 - BLOCK
      ?auto_496999 - BLOCK
      ?auto_497000 - BLOCK
      ?auto_497001 - BLOCK
      ?auto_497002 - BLOCK
      ?auto_497003 - BLOCK
      ?auto_497004 - BLOCK
    )
    :vars
    (
      ?auto_497005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497004 ?auto_497005 ) ( ON-TABLE ?auto_496997 ) ( ON ?auto_496998 ?auto_496997 ) ( ON ?auto_496999 ?auto_496998 ) ( ON ?auto_497000 ?auto_496999 ) ( ON ?auto_497001 ?auto_497000 ) ( not ( = ?auto_496997 ?auto_496998 ) ) ( not ( = ?auto_496997 ?auto_496999 ) ) ( not ( = ?auto_496997 ?auto_497000 ) ) ( not ( = ?auto_496997 ?auto_497001 ) ) ( not ( = ?auto_496997 ?auto_497002 ) ) ( not ( = ?auto_496997 ?auto_497003 ) ) ( not ( = ?auto_496997 ?auto_497004 ) ) ( not ( = ?auto_496997 ?auto_497005 ) ) ( not ( = ?auto_496998 ?auto_496999 ) ) ( not ( = ?auto_496998 ?auto_497000 ) ) ( not ( = ?auto_496998 ?auto_497001 ) ) ( not ( = ?auto_496998 ?auto_497002 ) ) ( not ( = ?auto_496998 ?auto_497003 ) ) ( not ( = ?auto_496998 ?auto_497004 ) ) ( not ( = ?auto_496998 ?auto_497005 ) ) ( not ( = ?auto_496999 ?auto_497000 ) ) ( not ( = ?auto_496999 ?auto_497001 ) ) ( not ( = ?auto_496999 ?auto_497002 ) ) ( not ( = ?auto_496999 ?auto_497003 ) ) ( not ( = ?auto_496999 ?auto_497004 ) ) ( not ( = ?auto_496999 ?auto_497005 ) ) ( not ( = ?auto_497000 ?auto_497001 ) ) ( not ( = ?auto_497000 ?auto_497002 ) ) ( not ( = ?auto_497000 ?auto_497003 ) ) ( not ( = ?auto_497000 ?auto_497004 ) ) ( not ( = ?auto_497000 ?auto_497005 ) ) ( not ( = ?auto_497001 ?auto_497002 ) ) ( not ( = ?auto_497001 ?auto_497003 ) ) ( not ( = ?auto_497001 ?auto_497004 ) ) ( not ( = ?auto_497001 ?auto_497005 ) ) ( not ( = ?auto_497002 ?auto_497003 ) ) ( not ( = ?auto_497002 ?auto_497004 ) ) ( not ( = ?auto_497002 ?auto_497005 ) ) ( not ( = ?auto_497003 ?auto_497004 ) ) ( not ( = ?auto_497003 ?auto_497005 ) ) ( not ( = ?auto_497004 ?auto_497005 ) ) ( ON ?auto_497003 ?auto_497004 ) ( CLEAR ?auto_497001 ) ( ON ?auto_497002 ?auto_497003 ) ( CLEAR ?auto_497002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_496997 ?auto_496998 ?auto_496999 ?auto_497000 ?auto_497001 ?auto_497002 )
      ( MAKE-8PILE ?auto_496997 ?auto_496998 ?auto_496999 ?auto_497000 ?auto_497001 ?auto_497002 ?auto_497003 ?auto_497004 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_497031 - BLOCK
      ?auto_497032 - BLOCK
      ?auto_497033 - BLOCK
      ?auto_497034 - BLOCK
      ?auto_497035 - BLOCK
      ?auto_497036 - BLOCK
      ?auto_497037 - BLOCK
      ?auto_497038 - BLOCK
    )
    :vars
    (
      ?auto_497039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497038 ?auto_497039 ) ( ON-TABLE ?auto_497031 ) ( ON ?auto_497032 ?auto_497031 ) ( ON ?auto_497033 ?auto_497032 ) ( ON ?auto_497034 ?auto_497033 ) ( not ( = ?auto_497031 ?auto_497032 ) ) ( not ( = ?auto_497031 ?auto_497033 ) ) ( not ( = ?auto_497031 ?auto_497034 ) ) ( not ( = ?auto_497031 ?auto_497035 ) ) ( not ( = ?auto_497031 ?auto_497036 ) ) ( not ( = ?auto_497031 ?auto_497037 ) ) ( not ( = ?auto_497031 ?auto_497038 ) ) ( not ( = ?auto_497031 ?auto_497039 ) ) ( not ( = ?auto_497032 ?auto_497033 ) ) ( not ( = ?auto_497032 ?auto_497034 ) ) ( not ( = ?auto_497032 ?auto_497035 ) ) ( not ( = ?auto_497032 ?auto_497036 ) ) ( not ( = ?auto_497032 ?auto_497037 ) ) ( not ( = ?auto_497032 ?auto_497038 ) ) ( not ( = ?auto_497032 ?auto_497039 ) ) ( not ( = ?auto_497033 ?auto_497034 ) ) ( not ( = ?auto_497033 ?auto_497035 ) ) ( not ( = ?auto_497033 ?auto_497036 ) ) ( not ( = ?auto_497033 ?auto_497037 ) ) ( not ( = ?auto_497033 ?auto_497038 ) ) ( not ( = ?auto_497033 ?auto_497039 ) ) ( not ( = ?auto_497034 ?auto_497035 ) ) ( not ( = ?auto_497034 ?auto_497036 ) ) ( not ( = ?auto_497034 ?auto_497037 ) ) ( not ( = ?auto_497034 ?auto_497038 ) ) ( not ( = ?auto_497034 ?auto_497039 ) ) ( not ( = ?auto_497035 ?auto_497036 ) ) ( not ( = ?auto_497035 ?auto_497037 ) ) ( not ( = ?auto_497035 ?auto_497038 ) ) ( not ( = ?auto_497035 ?auto_497039 ) ) ( not ( = ?auto_497036 ?auto_497037 ) ) ( not ( = ?auto_497036 ?auto_497038 ) ) ( not ( = ?auto_497036 ?auto_497039 ) ) ( not ( = ?auto_497037 ?auto_497038 ) ) ( not ( = ?auto_497037 ?auto_497039 ) ) ( not ( = ?auto_497038 ?auto_497039 ) ) ( ON ?auto_497037 ?auto_497038 ) ( ON ?auto_497036 ?auto_497037 ) ( CLEAR ?auto_497034 ) ( ON ?auto_497035 ?auto_497036 ) ( CLEAR ?auto_497035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_497031 ?auto_497032 ?auto_497033 ?auto_497034 ?auto_497035 )
      ( MAKE-8PILE ?auto_497031 ?auto_497032 ?auto_497033 ?auto_497034 ?auto_497035 ?auto_497036 ?auto_497037 ?auto_497038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_497065 - BLOCK
      ?auto_497066 - BLOCK
      ?auto_497067 - BLOCK
      ?auto_497068 - BLOCK
      ?auto_497069 - BLOCK
      ?auto_497070 - BLOCK
      ?auto_497071 - BLOCK
      ?auto_497072 - BLOCK
    )
    :vars
    (
      ?auto_497073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497072 ?auto_497073 ) ( ON-TABLE ?auto_497065 ) ( ON ?auto_497066 ?auto_497065 ) ( ON ?auto_497067 ?auto_497066 ) ( not ( = ?auto_497065 ?auto_497066 ) ) ( not ( = ?auto_497065 ?auto_497067 ) ) ( not ( = ?auto_497065 ?auto_497068 ) ) ( not ( = ?auto_497065 ?auto_497069 ) ) ( not ( = ?auto_497065 ?auto_497070 ) ) ( not ( = ?auto_497065 ?auto_497071 ) ) ( not ( = ?auto_497065 ?auto_497072 ) ) ( not ( = ?auto_497065 ?auto_497073 ) ) ( not ( = ?auto_497066 ?auto_497067 ) ) ( not ( = ?auto_497066 ?auto_497068 ) ) ( not ( = ?auto_497066 ?auto_497069 ) ) ( not ( = ?auto_497066 ?auto_497070 ) ) ( not ( = ?auto_497066 ?auto_497071 ) ) ( not ( = ?auto_497066 ?auto_497072 ) ) ( not ( = ?auto_497066 ?auto_497073 ) ) ( not ( = ?auto_497067 ?auto_497068 ) ) ( not ( = ?auto_497067 ?auto_497069 ) ) ( not ( = ?auto_497067 ?auto_497070 ) ) ( not ( = ?auto_497067 ?auto_497071 ) ) ( not ( = ?auto_497067 ?auto_497072 ) ) ( not ( = ?auto_497067 ?auto_497073 ) ) ( not ( = ?auto_497068 ?auto_497069 ) ) ( not ( = ?auto_497068 ?auto_497070 ) ) ( not ( = ?auto_497068 ?auto_497071 ) ) ( not ( = ?auto_497068 ?auto_497072 ) ) ( not ( = ?auto_497068 ?auto_497073 ) ) ( not ( = ?auto_497069 ?auto_497070 ) ) ( not ( = ?auto_497069 ?auto_497071 ) ) ( not ( = ?auto_497069 ?auto_497072 ) ) ( not ( = ?auto_497069 ?auto_497073 ) ) ( not ( = ?auto_497070 ?auto_497071 ) ) ( not ( = ?auto_497070 ?auto_497072 ) ) ( not ( = ?auto_497070 ?auto_497073 ) ) ( not ( = ?auto_497071 ?auto_497072 ) ) ( not ( = ?auto_497071 ?auto_497073 ) ) ( not ( = ?auto_497072 ?auto_497073 ) ) ( ON ?auto_497071 ?auto_497072 ) ( ON ?auto_497070 ?auto_497071 ) ( ON ?auto_497069 ?auto_497070 ) ( CLEAR ?auto_497067 ) ( ON ?auto_497068 ?auto_497069 ) ( CLEAR ?auto_497068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_497065 ?auto_497066 ?auto_497067 ?auto_497068 )
      ( MAKE-8PILE ?auto_497065 ?auto_497066 ?auto_497067 ?auto_497068 ?auto_497069 ?auto_497070 ?auto_497071 ?auto_497072 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_497099 - BLOCK
      ?auto_497100 - BLOCK
      ?auto_497101 - BLOCK
      ?auto_497102 - BLOCK
      ?auto_497103 - BLOCK
      ?auto_497104 - BLOCK
      ?auto_497105 - BLOCK
      ?auto_497106 - BLOCK
    )
    :vars
    (
      ?auto_497107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497106 ?auto_497107 ) ( ON-TABLE ?auto_497099 ) ( ON ?auto_497100 ?auto_497099 ) ( not ( = ?auto_497099 ?auto_497100 ) ) ( not ( = ?auto_497099 ?auto_497101 ) ) ( not ( = ?auto_497099 ?auto_497102 ) ) ( not ( = ?auto_497099 ?auto_497103 ) ) ( not ( = ?auto_497099 ?auto_497104 ) ) ( not ( = ?auto_497099 ?auto_497105 ) ) ( not ( = ?auto_497099 ?auto_497106 ) ) ( not ( = ?auto_497099 ?auto_497107 ) ) ( not ( = ?auto_497100 ?auto_497101 ) ) ( not ( = ?auto_497100 ?auto_497102 ) ) ( not ( = ?auto_497100 ?auto_497103 ) ) ( not ( = ?auto_497100 ?auto_497104 ) ) ( not ( = ?auto_497100 ?auto_497105 ) ) ( not ( = ?auto_497100 ?auto_497106 ) ) ( not ( = ?auto_497100 ?auto_497107 ) ) ( not ( = ?auto_497101 ?auto_497102 ) ) ( not ( = ?auto_497101 ?auto_497103 ) ) ( not ( = ?auto_497101 ?auto_497104 ) ) ( not ( = ?auto_497101 ?auto_497105 ) ) ( not ( = ?auto_497101 ?auto_497106 ) ) ( not ( = ?auto_497101 ?auto_497107 ) ) ( not ( = ?auto_497102 ?auto_497103 ) ) ( not ( = ?auto_497102 ?auto_497104 ) ) ( not ( = ?auto_497102 ?auto_497105 ) ) ( not ( = ?auto_497102 ?auto_497106 ) ) ( not ( = ?auto_497102 ?auto_497107 ) ) ( not ( = ?auto_497103 ?auto_497104 ) ) ( not ( = ?auto_497103 ?auto_497105 ) ) ( not ( = ?auto_497103 ?auto_497106 ) ) ( not ( = ?auto_497103 ?auto_497107 ) ) ( not ( = ?auto_497104 ?auto_497105 ) ) ( not ( = ?auto_497104 ?auto_497106 ) ) ( not ( = ?auto_497104 ?auto_497107 ) ) ( not ( = ?auto_497105 ?auto_497106 ) ) ( not ( = ?auto_497105 ?auto_497107 ) ) ( not ( = ?auto_497106 ?auto_497107 ) ) ( ON ?auto_497105 ?auto_497106 ) ( ON ?auto_497104 ?auto_497105 ) ( ON ?auto_497103 ?auto_497104 ) ( ON ?auto_497102 ?auto_497103 ) ( CLEAR ?auto_497100 ) ( ON ?auto_497101 ?auto_497102 ) ( CLEAR ?auto_497101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_497099 ?auto_497100 ?auto_497101 )
      ( MAKE-8PILE ?auto_497099 ?auto_497100 ?auto_497101 ?auto_497102 ?auto_497103 ?auto_497104 ?auto_497105 ?auto_497106 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_497133 - BLOCK
      ?auto_497134 - BLOCK
      ?auto_497135 - BLOCK
      ?auto_497136 - BLOCK
      ?auto_497137 - BLOCK
      ?auto_497138 - BLOCK
      ?auto_497139 - BLOCK
      ?auto_497140 - BLOCK
    )
    :vars
    (
      ?auto_497141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497140 ?auto_497141 ) ( ON-TABLE ?auto_497133 ) ( not ( = ?auto_497133 ?auto_497134 ) ) ( not ( = ?auto_497133 ?auto_497135 ) ) ( not ( = ?auto_497133 ?auto_497136 ) ) ( not ( = ?auto_497133 ?auto_497137 ) ) ( not ( = ?auto_497133 ?auto_497138 ) ) ( not ( = ?auto_497133 ?auto_497139 ) ) ( not ( = ?auto_497133 ?auto_497140 ) ) ( not ( = ?auto_497133 ?auto_497141 ) ) ( not ( = ?auto_497134 ?auto_497135 ) ) ( not ( = ?auto_497134 ?auto_497136 ) ) ( not ( = ?auto_497134 ?auto_497137 ) ) ( not ( = ?auto_497134 ?auto_497138 ) ) ( not ( = ?auto_497134 ?auto_497139 ) ) ( not ( = ?auto_497134 ?auto_497140 ) ) ( not ( = ?auto_497134 ?auto_497141 ) ) ( not ( = ?auto_497135 ?auto_497136 ) ) ( not ( = ?auto_497135 ?auto_497137 ) ) ( not ( = ?auto_497135 ?auto_497138 ) ) ( not ( = ?auto_497135 ?auto_497139 ) ) ( not ( = ?auto_497135 ?auto_497140 ) ) ( not ( = ?auto_497135 ?auto_497141 ) ) ( not ( = ?auto_497136 ?auto_497137 ) ) ( not ( = ?auto_497136 ?auto_497138 ) ) ( not ( = ?auto_497136 ?auto_497139 ) ) ( not ( = ?auto_497136 ?auto_497140 ) ) ( not ( = ?auto_497136 ?auto_497141 ) ) ( not ( = ?auto_497137 ?auto_497138 ) ) ( not ( = ?auto_497137 ?auto_497139 ) ) ( not ( = ?auto_497137 ?auto_497140 ) ) ( not ( = ?auto_497137 ?auto_497141 ) ) ( not ( = ?auto_497138 ?auto_497139 ) ) ( not ( = ?auto_497138 ?auto_497140 ) ) ( not ( = ?auto_497138 ?auto_497141 ) ) ( not ( = ?auto_497139 ?auto_497140 ) ) ( not ( = ?auto_497139 ?auto_497141 ) ) ( not ( = ?auto_497140 ?auto_497141 ) ) ( ON ?auto_497139 ?auto_497140 ) ( ON ?auto_497138 ?auto_497139 ) ( ON ?auto_497137 ?auto_497138 ) ( ON ?auto_497136 ?auto_497137 ) ( ON ?auto_497135 ?auto_497136 ) ( CLEAR ?auto_497133 ) ( ON ?auto_497134 ?auto_497135 ) ( CLEAR ?auto_497134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_497133 ?auto_497134 )
      ( MAKE-8PILE ?auto_497133 ?auto_497134 ?auto_497135 ?auto_497136 ?auto_497137 ?auto_497138 ?auto_497139 ?auto_497140 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_497167 - BLOCK
      ?auto_497168 - BLOCK
      ?auto_497169 - BLOCK
      ?auto_497170 - BLOCK
      ?auto_497171 - BLOCK
      ?auto_497172 - BLOCK
      ?auto_497173 - BLOCK
      ?auto_497174 - BLOCK
    )
    :vars
    (
      ?auto_497175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497174 ?auto_497175 ) ( not ( = ?auto_497167 ?auto_497168 ) ) ( not ( = ?auto_497167 ?auto_497169 ) ) ( not ( = ?auto_497167 ?auto_497170 ) ) ( not ( = ?auto_497167 ?auto_497171 ) ) ( not ( = ?auto_497167 ?auto_497172 ) ) ( not ( = ?auto_497167 ?auto_497173 ) ) ( not ( = ?auto_497167 ?auto_497174 ) ) ( not ( = ?auto_497167 ?auto_497175 ) ) ( not ( = ?auto_497168 ?auto_497169 ) ) ( not ( = ?auto_497168 ?auto_497170 ) ) ( not ( = ?auto_497168 ?auto_497171 ) ) ( not ( = ?auto_497168 ?auto_497172 ) ) ( not ( = ?auto_497168 ?auto_497173 ) ) ( not ( = ?auto_497168 ?auto_497174 ) ) ( not ( = ?auto_497168 ?auto_497175 ) ) ( not ( = ?auto_497169 ?auto_497170 ) ) ( not ( = ?auto_497169 ?auto_497171 ) ) ( not ( = ?auto_497169 ?auto_497172 ) ) ( not ( = ?auto_497169 ?auto_497173 ) ) ( not ( = ?auto_497169 ?auto_497174 ) ) ( not ( = ?auto_497169 ?auto_497175 ) ) ( not ( = ?auto_497170 ?auto_497171 ) ) ( not ( = ?auto_497170 ?auto_497172 ) ) ( not ( = ?auto_497170 ?auto_497173 ) ) ( not ( = ?auto_497170 ?auto_497174 ) ) ( not ( = ?auto_497170 ?auto_497175 ) ) ( not ( = ?auto_497171 ?auto_497172 ) ) ( not ( = ?auto_497171 ?auto_497173 ) ) ( not ( = ?auto_497171 ?auto_497174 ) ) ( not ( = ?auto_497171 ?auto_497175 ) ) ( not ( = ?auto_497172 ?auto_497173 ) ) ( not ( = ?auto_497172 ?auto_497174 ) ) ( not ( = ?auto_497172 ?auto_497175 ) ) ( not ( = ?auto_497173 ?auto_497174 ) ) ( not ( = ?auto_497173 ?auto_497175 ) ) ( not ( = ?auto_497174 ?auto_497175 ) ) ( ON ?auto_497173 ?auto_497174 ) ( ON ?auto_497172 ?auto_497173 ) ( ON ?auto_497171 ?auto_497172 ) ( ON ?auto_497170 ?auto_497171 ) ( ON ?auto_497169 ?auto_497170 ) ( ON ?auto_497168 ?auto_497169 ) ( ON ?auto_497167 ?auto_497168 ) ( CLEAR ?auto_497167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_497167 )
      ( MAKE-8PILE ?auto_497167 ?auto_497168 ?auto_497169 ?auto_497170 ?auto_497171 ?auto_497172 ?auto_497173 ?auto_497174 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497202 - BLOCK
      ?auto_497203 - BLOCK
      ?auto_497204 - BLOCK
      ?auto_497205 - BLOCK
      ?auto_497206 - BLOCK
      ?auto_497207 - BLOCK
      ?auto_497208 - BLOCK
      ?auto_497209 - BLOCK
      ?auto_497210 - BLOCK
    )
    :vars
    (
      ?auto_497211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_497209 ) ( ON ?auto_497210 ?auto_497211 ) ( CLEAR ?auto_497210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_497202 ) ( ON ?auto_497203 ?auto_497202 ) ( ON ?auto_497204 ?auto_497203 ) ( ON ?auto_497205 ?auto_497204 ) ( ON ?auto_497206 ?auto_497205 ) ( ON ?auto_497207 ?auto_497206 ) ( ON ?auto_497208 ?auto_497207 ) ( ON ?auto_497209 ?auto_497208 ) ( not ( = ?auto_497202 ?auto_497203 ) ) ( not ( = ?auto_497202 ?auto_497204 ) ) ( not ( = ?auto_497202 ?auto_497205 ) ) ( not ( = ?auto_497202 ?auto_497206 ) ) ( not ( = ?auto_497202 ?auto_497207 ) ) ( not ( = ?auto_497202 ?auto_497208 ) ) ( not ( = ?auto_497202 ?auto_497209 ) ) ( not ( = ?auto_497202 ?auto_497210 ) ) ( not ( = ?auto_497202 ?auto_497211 ) ) ( not ( = ?auto_497203 ?auto_497204 ) ) ( not ( = ?auto_497203 ?auto_497205 ) ) ( not ( = ?auto_497203 ?auto_497206 ) ) ( not ( = ?auto_497203 ?auto_497207 ) ) ( not ( = ?auto_497203 ?auto_497208 ) ) ( not ( = ?auto_497203 ?auto_497209 ) ) ( not ( = ?auto_497203 ?auto_497210 ) ) ( not ( = ?auto_497203 ?auto_497211 ) ) ( not ( = ?auto_497204 ?auto_497205 ) ) ( not ( = ?auto_497204 ?auto_497206 ) ) ( not ( = ?auto_497204 ?auto_497207 ) ) ( not ( = ?auto_497204 ?auto_497208 ) ) ( not ( = ?auto_497204 ?auto_497209 ) ) ( not ( = ?auto_497204 ?auto_497210 ) ) ( not ( = ?auto_497204 ?auto_497211 ) ) ( not ( = ?auto_497205 ?auto_497206 ) ) ( not ( = ?auto_497205 ?auto_497207 ) ) ( not ( = ?auto_497205 ?auto_497208 ) ) ( not ( = ?auto_497205 ?auto_497209 ) ) ( not ( = ?auto_497205 ?auto_497210 ) ) ( not ( = ?auto_497205 ?auto_497211 ) ) ( not ( = ?auto_497206 ?auto_497207 ) ) ( not ( = ?auto_497206 ?auto_497208 ) ) ( not ( = ?auto_497206 ?auto_497209 ) ) ( not ( = ?auto_497206 ?auto_497210 ) ) ( not ( = ?auto_497206 ?auto_497211 ) ) ( not ( = ?auto_497207 ?auto_497208 ) ) ( not ( = ?auto_497207 ?auto_497209 ) ) ( not ( = ?auto_497207 ?auto_497210 ) ) ( not ( = ?auto_497207 ?auto_497211 ) ) ( not ( = ?auto_497208 ?auto_497209 ) ) ( not ( = ?auto_497208 ?auto_497210 ) ) ( not ( = ?auto_497208 ?auto_497211 ) ) ( not ( = ?auto_497209 ?auto_497210 ) ) ( not ( = ?auto_497209 ?auto_497211 ) ) ( not ( = ?auto_497210 ?auto_497211 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_497210 ?auto_497211 )
      ( !STACK ?auto_497210 ?auto_497209 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497240 - BLOCK
      ?auto_497241 - BLOCK
      ?auto_497242 - BLOCK
      ?auto_497243 - BLOCK
      ?auto_497244 - BLOCK
      ?auto_497245 - BLOCK
      ?auto_497246 - BLOCK
      ?auto_497247 - BLOCK
      ?auto_497248 - BLOCK
    )
    :vars
    (
      ?auto_497249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497248 ?auto_497249 ) ( ON-TABLE ?auto_497240 ) ( ON ?auto_497241 ?auto_497240 ) ( ON ?auto_497242 ?auto_497241 ) ( ON ?auto_497243 ?auto_497242 ) ( ON ?auto_497244 ?auto_497243 ) ( ON ?auto_497245 ?auto_497244 ) ( ON ?auto_497246 ?auto_497245 ) ( not ( = ?auto_497240 ?auto_497241 ) ) ( not ( = ?auto_497240 ?auto_497242 ) ) ( not ( = ?auto_497240 ?auto_497243 ) ) ( not ( = ?auto_497240 ?auto_497244 ) ) ( not ( = ?auto_497240 ?auto_497245 ) ) ( not ( = ?auto_497240 ?auto_497246 ) ) ( not ( = ?auto_497240 ?auto_497247 ) ) ( not ( = ?auto_497240 ?auto_497248 ) ) ( not ( = ?auto_497240 ?auto_497249 ) ) ( not ( = ?auto_497241 ?auto_497242 ) ) ( not ( = ?auto_497241 ?auto_497243 ) ) ( not ( = ?auto_497241 ?auto_497244 ) ) ( not ( = ?auto_497241 ?auto_497245 ) ) ( not ( = ?auto_497241 ?auto_497246 ) ) ( not ( = ?auto_497241 ?auto_497247 ) ) ( not ( = ?auto_497241 ?auto_497248 ) ) ( not ( = ?auto_497241 ?auto_497249 ) ) ( not ( = ?auto_497242 ?auto_497243 ) ) ( not ( = ?auto_497242 ?auto_497244 ) ) ( not ( = ?auto_497242 ?auto_497245 ) ) ( not ( = ?auto_497242 ?auto_497246 ) ) ( not ( = ?auto_497242 ?auto_497247 ) ) ( not ( = ?auto_497242 ?auto_497248 ) ) ( not ( = ?auto_497242 ?auto_497249 ) ) ( not ( = ?auto_497243 ?auto_497244 ) ) ( not ( = ?auto_497243 ?auto_497245 ) ) ( not ( = ?auto_497243 ?auto_497246 ) ) ( not ( = ?auto_497243 ?auto_497247 ) ) ( not ( = ?auto_497243 ?auto_497248 ) ) ( not ( = ?auto_497243 ?auto_497249 ) ) ( not ( = ?auto_497244 ?auto_497245 ) ) ( not ( = ?auto_497244 ?auto_497246 ) ) ( not ( = ?auto_497244 ?auto_497247 ) ) ( not ( = ?auto_497244 ?auto_497248 ) ) ( not ( = ?auto_497244 ?auto_497249 ) ) ( not ( = ?auto_497245 ?auto_497246 ) ) ( not ( = ?auto_497245 ?auto_497247 ) ) ( not ( = ?auto_497245 ?auto_497248 ) ) ( not ( = ?auto_497245 ?auto_497249 ) ) ( not ( = ?auto_497246 ?auto_497247 ) ) ( not ( = ?auto_497246 ?auto_497248 ) ) ( not ( = ?auto_497246 ?auto_497249 ) ) ( not ( = ?auto_497247 ?auto_497248 ) ) ( not ( = ?auto_497247 ?auto_497249 ) ) ( not ( = ?auto_497248 ?auto_497249 ) ) ( CLEAR ?auto_497246 ) ( ON ?auto_497247 ?auto_497248 ) ( CLEAR ?auto_497247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_497240 ?auto_497241 ?auto_497242 ?auto_497243 ?auto_497244 ?auto_497245 ?auto_497246 ?auto_497247 )
      ( MAKE-9PILE ?auto_497240 ?auto_497241 ?auto_497242 ?auto_497243 ?auto_497244 ?auto_497245 ?auto_497246 ?auto_497247 ?auto_497248 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497278 - BLOCK
      ?auto_497279 - BLOCK
      ?auto_497280 - BLOCK
      ?auto_497281 - BLOCK
      ?auto_497282 - BLOCK
      ?auto_497283 - BLOCK
      ?auto_497284 - BLOCK
      ?auto_497285 - BLOCK
      ?auto_497286 - BLOCK
    )
    :vars
    (
      ?auto_497287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497286 ?auto_497287 ) ( ON-TABLE ?auto_497278 ) ( ON ?auto_497279 ?auto_497278 ) ( ON ?auto_497280 ?auto_497279 ) ( ON ?auto_497281 ?auto_497280 ) ( ON ?auto_497282 ?auto_497281 ) ( ON ?auto_497283 ?auto_497282 ) ( not ( = ?auto_497278 ?auto_497279 ) ) ( not ( = ?auto_497278 ?auto_497280 ) ) ( not ( = ?auto_497278 ?auto_497281 ) ) ( not ( = ?auto_497278 ?auto_497282 ) ) ( not ( = ?auto_497278 ?auto_497283 ) ) ( not ( = ?auto_497278 ?auto_497284 ) ) ( not ( = ?auto_497278 ?auto_497285 ) ) ( not ( = ?auto_497278 ?auto_497286 ) ) ( not ( = ?auto_497278 ?auto_497287 ) ) ( not ( = ?auto_497279 ?auto_497280 ) ) ( not ( = ?auto_497279 ?auto_497281 ) ) ( not ( = ?auto_497279 ?auto_497282 ) ) ( not ( = ?auto_497279 ?auto_497283 ) ) ( not ( = ?auto_497279 ?auto_497284 ) ) ( not ( = ?auto_497279 ?auto_497285 ) ) ( not ( = ?auto_497279 ?auto_497286 ) ) ( not ( = ?auto_497279 ?auto_497287 ) ) ( not ( = ?auto_497280 ?auto_497281 ) ) ( not ( = ?auto_497280 ?auto_497282 ) ) ( not ( = ?auto_497280 ?auto_497283 ) ) ( not ( = ?auto_497280 ?auto_497284 ) ) ( not ( = ?auto_497280 ?auto_497285 ) ) ( not ( = ?auto_497280 ?auto_497286 ) ) ( not ( = ?auto_497280 ?auto_497287 ) ) ( not ( = ?auto_497281 ?auto_497282 ) ) ( not ( = ?auto_497281 ?auto_497283 ) ) ( not ( = ?auto_497281 ?auto_497284 ) ) ( not ( = ?auto_497281 ?auto_497285 ) ) ( not ( = ?auto_497281 ?auto_497286 ) ) ( not ( = ?auto_497281 ?auto_497287 ) ) ( not ( = ?auto_497282 ?auto_497283 ) ) ( not ( = ?auto_497282 ?auto_497284 ) ) ( not ( = ?auto_497282 ?auto_497285 ) ) ( not ( = ?auto_497282 ?auto_497286 ) ) ( not ( = ?auto_497282 ?auto_497287 ) ) ( not ( = ?auto_497283 ?auto_497284 ) ) ( not ( = ?auto_497283 ?auto_497285 ) ) ( not ( = ?auto_497283 ?auto_497286 ) ) ( not ( = ?auto_497283 ?auto_497287 ) ) ( not ( = ?auto_497284 ?auto_497285 ) ) ( not ( = ?auto_497284 ?auto_497286 ) ) ( not ( = ?auto_497284 ?auto_497287 ) ) ( not ( = ?auto_497285 ?auto_497286 ) ) ( not ( = ?auto_497285 ?auto_497287 ) ) ( not ( = ?auto_497286 ?auto_497287 ) ) ( ON ?auto_497285 ?auto_497286 ) ( CLEAR ?auto_497283 ) ( ON ?auto_497284 ?auto_497285 ) ( CLEAR ?auto_497284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_497278 ?auto_497279 ?auto_497280 ?auto_497281 ?auto_497282 ?auto_497283 ?auto_497284 )
      ( MAKE-9PILE ?auto_497278 ?auto_497279 ?auto_497280 ?auto_497281 ?auto_497282 ?auto_497283 ?auto_497284 ?auto_497285 ?auto_497286 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497316 - BLOCK
      ?auto_497317 - BLOCK
      ?auto_497318 - BLOCK
      ?auto_497319 - BLOCK
      ?auto_497320 - BLOCK
      ?auto_497321 - BLOCK
      ?auto_497322 - BLOCK
      ?auto_497323 - BLOCK
      ?auto_497324 - BLOCK
    )
    :vars
    (
      ?auto_497325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497324 ?auto_497325 ) ( ON-TABLE ?auto_497316 ) ( ON ?auto_497317 ?auto_497316 ) ( ON ?auto_497318 ?auto_497317 ) ( ON ?auto_497319 ?auto_497318 ) ( ON ?auto_497320 ?auto_497319 ) ( not ( = ?auto_497316 ?auto_497317 ) ) ( not ( = ?auto_497316 ?auto_497318 ) ) ( not ( = ?auto_497316 ?auto_497319 ) ) ( not ( = ?auto_497316 ?auto_497320 ) ) ( not ( = ?auto_497316 ?auto_497321 ) ) ( not ( = ?auto_497316 ?auto_497322 ) ) ( not ( = ?auto_497316 ?auto_497323 ) ) ( not ( = ?auto_497316 ?auto_497324 ) ) ( not ( = ?auto_497316 ?auto_497325 ) ) ( not ( = ?auto_497317 ?auto_497318 ) ) ( not ( = ?auto_497317 ?auto_497319 ) ) ( not ( = ?auto_497317 ?auto_497320 ) ) ( not ( = ?auto_497317 ?auto_497321 ) ) ( not ( = ?auto_497317 ?auto_497322 ) ) ( not ( = ?auto_497317 ?auto_497323 ) ) ( not ( = ?auto_497317 ?auto_497324 ) ) ( not ( = ?auto_497317 ?auto_497325 ) ) ( not ( = ?auto_497318 ?auto_497319 ) ) ( not ( = ?auto_497318 ?auto_497320 ) ) ( not ( = ?auto_497318 ?auto_497321 ) ) ( not ( = ?auto_497318 ?auto_497322 ) ) ( not ( = ?auto_497318 ?auto_497323 ) ) ( not ( = ?auto_497318 ?auto_497324 ) ) ( not ( = ?auto_497318 ?auto_497325 ) ) ( not ( = ?auto_497319 ?auto_497320 ) ) ( not ( = ?auto_497319 ?auto_497321 ) ) ( not ( = ?auto_497319 ?auto_497322 ) ) ( not ( = ?auto_497319 ?auto_497323 ) ) ( not ( = ?auto_497319 ?auto_497324 ) ) ( not ( = ?auto_497319 ?auto_497325 ) ) ( not ( = ?auto_497320 ?auto_497321 ) ) ( not ( = ?auto_497320 ?auto_497322 ) ) ( not ( = ?auto_497320 ?auto_497323 ) ) ( not ( = ?auto_497320 ?auto_497324 ) ) ( not ( = ?auto_497320 ?auto_497325 ) ) ( not ( = ?auto_497321 ?auto_497322 ) ) ( not ( = ?auto_497321 ?auto_497323 ) ) ( not ( = ?auto_497321 ?auto_497324 ) ) ( not ( = ?auto_497321 ?auto_497325 ) ) ( not ( = ?auto_497322 ?auto_497323 ) ) ( not ( = ?auto_497322 ?auto_497324 ) ) ( not ( = ?auto_497322 ?auto_497325 ) ) ( not ( = ?auto_497323 ?auto_497324 ) ) ( not ( = ?auto_497323 ?auto_497325 ) ) ( not ( = ?auto_497324 ?auto_497325 ) ) ( ON ?auto_497323 ?auto_497324 ) ( ON ?auto_497322 ?auto_497323 ) ( CLEAR ?auto_497320 ) ( ON ?auto_497321 ?auto_497322 ) ( CLEAR ?auto_497321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_497316 ?auto_497317 ?auto_497318 ?auto_497319 ?auto_497320 ?auto_497321 )
      ( MAKE-9PILE ?auto_497316 ?auto_497317 ?auto_497318 ?auto_497319 ?auto_497320 ?auto_497321 ?auto_497322 ?auto_497323 ?auto_497324 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497354 - BLOCK
      ?auto_497355 - BLOCK
      ?auto_497356 - BLOCK
      ?auto_497357 - BLOCK
      ?auto_497358 - BLOCK
      ?auto_497359 - BLOCK
      ?auto_497360 - BLOCK
      ?auto_497361 - BLOCK
      ?auto_497362 - BLOCK
    )
    :vars
    (
      ?auto_497363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497362 ?auto_497363 ) ( ON-TABLE ?auto_497354 ) ( ON ?auto_497355 ?auto_497354 ) ( ON ?auto_497356 ?auto_497355 ) ( ON ?auto_497357 ?auto_497356 ) ( not ( = ?auto_497354 ?auto_497355 ) ) ( not ( = ?auto_497354 ?auto_497356 ) ) ( not ( = ?auto_497354 ?auto_497357 ) ) ( not ( = ?auto_497354 ?auto_497358 ) ) ( not ( = ?auto_497354 ?auto_497359 ) ) ( not ( = ?auto_497354 ?auto_497360 ) ) ( not ( = ?auto_497354 ?auto_497361 ) ) ( not ( = ?auto_497354 ?auto_497362 ) ) ( not ( = ?auto_497354 ?auto_497363 ) ) ( not ( = ?auto_497355 ?auto_497356 ) ) ( not ( = ?auto_497355 ?auto_497357 ) ) ( not ( = ?auto_497355 ?auto_497358 ) ) ( not ( = ?auto_497355 ?auto_497359 ) ) ( not ( = ?auto_497355 ?auto_497360 ) ) ( not ( = ?auto_497355 ?auto_497361 ) ) ( not ( = ?auto_497355 ?auto_497362 ) ) ( not ( = ?auto_497355 ?auto_497363 ) ) ( not ( = ?auto_497356 ?auto_497357 ) ) ( not ( = ?auto_497356 ?auto_497358 ) ) ( not ( = ?auto_497356 ?auto_497359 ) ) ( not ( = ?auto_497356 ?auto_497360 ) ) ( not ( = ?auto_497356 ?auto_497361 ) ) ( not ( = ?auto_497356 ?auto_497362 ) ) ( not ( = ?auto_497356 ?auto_497363 ) ) ( not ( = ?auto_497357 ?auto_497358 ) ) ( not ( = ?auto_497357 ?auto_497359 ) ) ( not ( = ?auto_497357 ?auto_497360 ) ) ( not ( = ?auto_497357 ?auto_497361 ) ) ( not ( = ?auto_497357 ?auto_497362 ) ) ( not ( = ?auto_497357 ?auto_497363 ) ) ( not ( = ?auto_497358 ?auto_497359 ) ) ( not ( = ?auto_497358 ?auto_497360 ) ) ( not ( = ?auto_497358 ?auto_497361 ) ) ( not ( = ?auto_497358 ?auto_497362 ) ) ( not ( = ?auto_497358 ?auto_497363 ) ) ( not ( = ?auto_497359 ?auto_497360 ) ) ( not ( = ?auto_497359 ?auto_497361 ) ) ( not ( = ?auto_497359 ?auto_497362 ) ) ( not ( = ?auto_497359 ?auto_497363 ) ) ( not ( = ?auto_497360 ?auto_497361 ) ) ( not ( = ?auto_497360 ?auto_497362 ) ) ( not ( = ?auto_497360 ?auto_497363 ) ) ( not ( = ?auto_497361 ?auto_497362 ) ) ( not ( = ?auto_497361 ?auto_497363 ) ) ( not ( = ?auto_497362 ?auto_497363 ) ) ( ON ?auto_497361 ?auto_497362 ) ( ON ?auto_497360 ?auto_497361 ) ( ON ?auto_497359 ?auto_497360 ) ( CLEAR ?auto_497357 ) ( ON ?auto_497358 ?auto_497359 ) ( CLEAR ?auto_497358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_497354 ?auto_497355 ?auto_497356 ?auto_497357 ?auto_497358 )
      ( MAKE-9PILE ?auto_497354 ?auto_497355 ?auto_497356 ?auto_497357 ?auto_497358 ?auto_497359 ?auto_497360 ?auto_497361 ?auto_497362 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497392 - BLOCK
      ?auto_497393 - BLOCK
      ?auto_497394 - BLOCK
      ?auto_497395 - BLOCK
      ?auto_497396 - BLOCK
      ?auto_497397 - BLOCK
      ?auto_497398 - BLOCK
      ?auto_497399 - BLOCK
      ?auto_497400 - BLOCK
    )
    :vars
    (
      ?auto_497401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497400 ?auto_497401 ) ( ON-TABLE ?auto_497392 ) ( ON ?auto_497393 ?auto_497392 ) ( ON ?auto_497394 ?auto_497393 ) ( not ( = ?auto_497392 ?auto_497393 ) ) ( not ( = ?auto_497392 ?auto_497394 ) ) ( not ( = ?auto_497392 ?auto_497395 ) ) ( not ( = ?auto_497392 ?auto_497396 ) ) ( not ( = ?auto_497392 ?auto_497397 ) ) ( not ( = ?auto_497392 ?auto_497398 ) ) ( not ( = ?auto_497392 ?auto_497399 ) ) ( not ( = ?auto_497392 ?auto_497400 ) ) ( not ( = ?auto_497392 ?auto_497401 ) ) ( not ( = ?auto_497393 ?auto_497394 ) ) ( not ( = ?auto_497393 ?auto_497395 ) ) ( not ( = ?auto_497393 ?auto_497396 ) ) ( not ( = ?auto_497393 ?auto_497397 ) ) ( not ( = ?auto_497393 ?auto_497398 ) ) ( not ( = ?auto_497393 ?auto_497399 ) ) ( not ( = ?auto_497393 ?auto_497400 ) ) ( not ( = ?auto_497393 ?auto_497401 ) ) ( not ( = ?auto_497394 ?auto_497395 ) ) ( not ( = ?auto_497394 ?auto_497396 ) ) ( not ( = ?auto_497394 ?auto_497397 ) ) ( not ( = ?auto_497394 ?auto_497398 ) ) ( not ( = ?auto_497394 ?auto_497399 ) ) ( not ( = ?auto_497394 ?auto_497400 ) ) ( not ( = ?auto_497394 ?auto_497401 ) ) ( not ( = ?auto_497395 ?auto_497396 ) ) ( not ( = ?auto_497395 ?auto_497397 ) ) ( not ( = ?auto_497395 ?auto_497398 ) ) ( not ( = ?auto_497395 ?auto_497399 ) ) ( not ( = ?auto_497395 ?auto_497400 ) ) ( not ( = ?auto_497395 ?auto_497401 ) ) ( not ( = ?auto_497396 ?auto_497397 ) ) ( not ( = ?auto_497396 ?auto_497398 ) ) ( not ( = ?auto_497396 ?auto_497399 ) ) ( not ( = ?auto_497396 ?auto_497400 ) ) ( not ( = ?auto_497396 ?auto_497401 ) ) ( not ( = ?auto_497397 ?auto_497398 ) ) ( not ( = ?auto_497397 ?auto_497399 ) ) ( not ( = ?auto_497397 ?auto_497400 ) ) ( not ( = ?auto_497397 ?auto_497401 ) ) ( not ( = ?auto_497398 ?auto_497399 ) ) ( not ( = ?auto_497398 ?auto_497400 ) ) ( not ( = ?auto_497398 ?auto_497401 ) ) ( not ( = ?auto_497399 ?auto_497400 ) ) ( not ( = ?auto_497399 ?auto_497401 ) ) ( not ( = ?auto_497400 ?auto_497401 ) ) ( ON ?auto_497399 ?auto_497400 ) ( ON ?auto_497398 ?auto_497399 ) ( ON ?auto_497397 ?auto_497398 ) ( ON ?auto_497396 ?auto_497397 ) ( CLEAR ?auto_497394 ) ( ON ?auto_497395 ?auto_497396 ) ( CLEAR ?auto_497395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_497392 ?auto_497393 ?auto_497394 ?auto_497395 )
      ( MAKE-9PILE ?auto_497392 ?auto_497393 ?auto_497394 ?auto_497395 ?auto_497396 ?auto_497397 ?auto_497398 ?auto_497399 ?auto_497400 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497430 - BLOCK
      ?auto_497431 - BLOCK
      ?auto_497432 - BLOCK
      ?auto_497433 - BLOCK
      ?auto_497434 - BLOCK
      ?auto_497435 - BLOCK
      ?auto_497436 - BLOCK
      ?auto_497437 - BLOCK
      ?auto_497438 - BLOCK
    )
    :vars
    (
      ?auto_497439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497438 ?auto_497439 ) ( ON-TABLE ?auto_497430 ) ( ON ?auto_497431 ?auto_497430 ) ( not ( = ?auto_497430 ?auto_497431 ) ) ( not ( = ?auto_497430 ?auto_497432 ) ) ( not ( = ?auto_497430 ?auto_497433 ) ) ( not ( = ?auto_497430 ?auto_497434 ) ) ( not ( = ?auto_497430 ?auto_497435 ) ) ( not ( = ?auto_497430 ?auto_497436 ) ) ( not ( = ?auto_497430 ?auto_497437 ) ) ( not ( = ?auto_497430 ?auto_497438 ) ) ( not ( = ?auto_497430 ?auto_497439 ) ) ( not ( = ?auto_497431 ?auto_497432 ) ) ( not ( = ?auto_497431 ?auto_497433 ) ) ( not ( = ?auto_497431 ?auto_497434 ) ) ( not ( = ?auto_497431 ?auto_497435 ) ) ( not ( = ?auto_497431 ?auto_497436 ) ) ( not ( = ?auto_497431 ?auto_497437 ) ) ( not ( = ?auto_497431 ?auto_497438 ) ) ( not ( = ?auto_497431 ?auto_497439 ) ) ( not ( = ?auto_497432 ?auto_497433 ) ) ( not ( = ?auto_497432 ?auto_497434 ) ) ( not ( = ?auto_497432 ?auto_497435 ) ) ( not ( = ?auto_497432 ?auto_497436 ) ) ( not ( = ?auto_497432 ?auto_497437 ) ) ( not ( = ?auto_497432 ?auto_497438 ) ) ( not ( = ?auto_497432 ?auto_497439 ) ) ( not ( = ?auto_497433 ?auto_497434 ) ) ( not ( = ?auto_497433 ?auto_497435 ) ) ( not ( = ?auto_497433 ?auto_497436 ) ) ( not ( = ?auto_497433 ?auto_497437 ) ) ( not ( = ?auto_497433 ?auto_497438 ) ) ( not ( = ?auto_497433 ?auto_497439 ) ) ( not ( = ?auto_497434 ?auto_497435 ) ) ( not ( = ?auto_497434 ?auto_497436 ) ) ( not ( = ?auto_497434 ?auto_497437 ) ) ( not ( = ?auto_497434 ?auto_497438 ) ) ( not ( = ?auto_497434 ?auto_497439 ) ) ( not ( = ?auto_497435 ?auto_497436 ) ) ( not ( = ?auto_497435 ?auto_497437 ) ) ( not ( = ?auto_497435 ?auto_497438 ) ) ( not ( = ?auto_497435 ?auto_497439 ) ) ( not ( = ?auto_497436 ?auto_497437 ) ) ( not ( = ?auto_497436 ?auto_497438 ) ) ( not ( = ?auto_497436 ?auto_497439 ) ) ( not ( = ?auto_497437 ?auto_497438 ) ) ( not ( = ?auto_497437 ?auto_497439 ) ) ( not ( = ?auto_497438 ?auto_497439 ) ) ( ON ?auto_497437 ?auto_497438 ) ( ON ?auto_497436 ?auto_497437 ) ( ON ?auto_497435 ?auto_497436 ) ( ON ?auto_497434 ?auto_497435 ) ( ON ?auto_497433 ?auto_497434 ) ( CLEAR ?auto_497431 ) ( ON ?auto_497432 ?auto_497433 ) ( CLEAR ?auto_497432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_497430 ?auto_497431 ?auto_497432 )
      ( MAKE-9PILE ?auto_497430 ?auto_497431 ?auto_497432 ?auto_497433 ?auto_497434 ?auto_497435 ?auto_497436 ?auto_497437 ?auto_497438 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497468 - BLOCK
      ?auto_497469 - BLOCK
      ?auto_497470 - BLOCK
      ?auto_497471 - BLOCK
      ?auto_497472 - BLOCK
      ?auto_497473 - BLOCK
      ?auto_497474 - BLOCK
      ?auto_497475 - BLOCK
      ?auto_497476 - BLOCK
    )
    :vars
    (
      ?auto_497477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497476 ?auto_497477 ) ( ON-TABLE ?auto_497468 ) ( not ( = ?auto_497468 ?auto_497469 ) ) ( not ( = ?auto_497468 ?auto_497470 ) ) ( not ( = ?auto_497468 ?auto_497471 ) ) ( not ( = ?auto_497468 ?auto_497472 ) ) ( not ( = ?auto_497468 ?auto_497473 ) ) ( not ( = ?auto_497468 ?auto_497474 ) ) ( not ( = ?auto_497468 ?auto_497475 ) ) ( not ( = ?auto_497468 ?auto_497476 ) ) ( not ( = ?auto_497468 ?auto_497477 ) ) ( not ( = ?auto_497469 ?auto_497470 ) ) ( not ( = ?auto_497469 ?auto_497471 ) ) ( not ( = ?auto_497469 ?auto_497472 ) ) ( not ( = ?auto_497469 ?auto_497473 ) ) ( not ( = ?auto_497469 ?auto_497474 ) ) ( not ( = ?auto_497469 ?auto_497475 ) ) ( not ( = ?auto_497469 ?auto_497476 ) ) ( not ( = ?auto_497469 ?auto_497477 ) ) ( not ( = ?auto_497470 ?auto_497471 ) ) ( not ( = ?auto_497470 ?auto_497472 ) ) ( not ( = ?auto_497470 ?auto_497473 ) ) ( not ( = ?auto_497470 ?auto_497474 ) ) ( not ( = ?auto_497470 ?auto_497475 ) ) ( not ( = ?auto_497470 ?auto_497476 ) ) ( not ( = ?auto_497470 ?auto_497477 ) ) ( not ( = ?auto_497471 ?auto_497472 ) ) ( not ( = ?auto_497471 ?auto_497473 ) ) ( not ( = ?auto_497471 ?auto_497474 ) ) ( not ( = ?auto_497471 ?auto_497475 ) ) ( not ( = ?auto_497471 ?auto_497476 ) ) ( not ( = ?auto_497471 ?auto_497477 ) ) ( not ( = ?auto_497472 ?auto_497473 ) ) ( not ( = ?auto_497472 ?auto_497474 ) ) ( not ( = ?auto_497472 ?auto_497475 ) ) ( not ( = ?auto_497472 ?auto_497476 ) ) ( not ( = ?auto_497472 ?auto_497477 ) ) ( not ( = ?auto_497473 ?auto_497474 ) ) ( not ( = ?auto_497473 ?auto_497475 ) ) ( not ( = ?auto_497473 ?auto_497476 ) ) ( not ( = ?auto_497473 ?auto_497477 ) ) ( not ( = ?auto_497474 ?auto_497475 ) ) ( not ( = ?auto_497474 ?auto_497476 ) ) ( not ( = ?auto_497474 ?auto_497477 ) ) ( not ( = ?auto_497475 ?auto_497476 ) ) ( not ( = ?auto_497475 ?auto_497477 ) ) ( not ( = ?auto_497476 ?auto_497477 ) ) ( ON ?auto_497475 ?auto_497476 ) ( ON ?auto_497474 ?auto_497475 ) ( ON ?auto_497473 ?auto_497474 ) ( ON ?auto_497472 ?auto_497473 ) ( ON ?auto_497471 ?auto_497472 ) ( ON ?auto_497470 ?auto_497471 ) ( CLEAR ?auto_497468 ) ( ON ?auto_497469 ?auto_497470 ) ( CLEAR ?auto_497469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_497468 ?auto_497469 )
      ( MAKE-9PILE ?auto_497468 ?auto_497469 ?auto_497470 ?auto_497471 ?auto_497472 ?auto_497473 ?auto_497474 ?auto_497475 ?auto_497476 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_497506 - BLOCK
      ?auto_497507 - BLOCK
      ?auto_497508 - BLOCK
      ?auto_497509 - BLOCK
      ?auto_497510 - BLOCK
      ?auto_497511 - BLOCK
      ?auto_497512 - BLOCK
      ?auto_497513 - BLOCK
      ?auto_497514 - BLOCK
    )
    :vars
    (
      ?auto_497515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497514 ?auto_497515 ) ( not ( = ?auto_497506 ?auto_497507 ) ) ( not ( = ?auto_497506 ?auto_497508 ) ) ( not ( = ?auto_497506 ?auto_497509 ) ) ( not ( = ?auto_497506 ?auto_497510 ) ) ( not ( = ?auto_497506 ?auto_497511 ) ) ( not ( = ?auto_497506 ?auto_497512 ) ) ( not ( = ?auto_497506 ?auto_497513 ) ) ( not ( = ?auto_497506 ?auto_497514 ) ) ( not ( = ?auto_497506 ?auto_497515 ) ) ( not ( = ?auto_497507 ?auto_497508 ) ) ( not ( = ?auto_497507 ?auto_497509 ) ) ( not ( = ?auto_497507 ?auto_497510 ) ) ( not ( = ?auto_497507 ?auto_497511 ) ) ( not ( = ?auto_497507 ?auto_497512 ) ) ( not ( = ?auto_497507 ?auto_497513 ) ) ( not ( = ?auto_497507 ?auto_497514 ) ) ( not ( = ?auto_497507 ?auto_497515 ) ) ( not ( = ?auto_497508 ?auto_497509 ) ) ( not ( = ?auto_497508 ?auto_497510 ) ) ( not ( = ?auto_497508 ?auto_497511 ) ) ( not ( = ?auto_497508 ?auto_497512 ) ) ( not ( = ?auto_497508 ?auto_497513 ) ) ( not ( = ?auto_497508 ?auto_497514 ) ) ( not ( = ?auto_497508 ?auto_497515 ) ) ( not ( = ?auto_497509 ?auto_497510 ) ) ( not ( = ?auto_497509 ?auto_497511 ) ) ( not ( = ?auto_497509 ?auto_497512 ) ) ( not ( = ?auto_497509 ?auto_497513 ) ) ( not ( = ?auto_497509 ?auto_497514 ) ) ( not ( = ?auto_497509 ?auto_497515 ) ) ( not ( = ?auto_497510 ?auto_497511 ) ) ( not ( = ?auto_497510 ?auto_497512 ) ) ( not ( = ?auto_497510 ?auto_497513 ) ) ( not ( = ?auto_497510 ?auto_497514 ) ) ( not ( = ?auto_497510 ?auto_497515 ) ) ( not ( = ?auto_497511 ?auto_497512 ) ) ( not ( = ?auto_497511 ?auto_497513 ) ) ( not ( = ?auto_497511 ?auto_497514 ) ) ( not ( = ?auto_497511 ?auto_497515 ) ) ( not ( = ?auto_497512 ?auto_497513 ) ) ( not ( = ?auto_497512 ?auto_497514 ) ) ( not ( = ?auto_497512 ?auto_497515 ) ) ( not ( = ?auto_497513 ?auto_497514 ) ) ( not ( = ?auto_497513 ?auto_497515 ) ) ( not ( = ?auto_497514 ?auto_497515 ) ) ( ON ?auto_497513 ?auto_497514 ) ( ON ?auto_497512 ?auto_497513 ) ( ON ?auto_497511 ?auto_497512 ) ( ON ?auto_497510 ?auto_497511 ) ( ON ?auto_497509 ?auto_497510 ) ( ON ?auto_497508 ?auto_497509 ) ( ON ?auto_497507 ?auto_497508 ) ( ON ?auto_497506 ?auto_497507 ) ( CLEAR ?auto_497506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_497506 )
      ( MAKE-9PILE ?auto_497506 ?auto_497507 ?auto_497508 ?auto_497509 ?auto_497510 ?auto_497511 ?auto_497512 ?auto_497513 ?auto_497514 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497545 - BLOCK
      ?auto_497546 - BLOCK
      ?auto_497547 - BLOCK
      ?auto_497548 - BLOCK
      ?auto_497549 - BLOCK
      ?auto_497550 - BLOCK
      ?auto_497551 - BLOCK
      ?auto_497552 - BLOCK
      ?auto_497553 - BLOCK
      ?auto_497554 - BLOCK
    )
    :vars
    (
      ?auto_497555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_497553 ) ( ON ?auto_497554 ?auto_497555 ) ( CLEAR ?auto_497554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_497545 ) ( ON ?auto_497546 ?auto_497545 ) ( ON ?auto_497547 ?auto_497546 ) ( ON ?auto_497548 ?auto_497547 ) ( ON ?auto_497549 ?auto_497548 ) ( ON ?auto_497550 ?auto_497549 ) ( ON ?auto_497551 ?auto_497550 ) ( ON ?auto_497552 ?auto_497551 ) ( ON ?auto_497553 ?auto_497552 ) ( not ( = ?auto_497545 ?auto_497546 ) ) ( not ( = ?auto_497545 ?auto_497547 ) ) ( not ( = ?auto_497545 ?auto_497548 ) ) ( not ( = ?auto_497545 ?auto_497549 ) ) ( not ( = ?auto_497545 ?auto_497550 ) ) ( not ( = ?auto_497545 ?auto_497551 ) ) ( not ( = ?auto_497545 ?auto_497552 ) ) ( not ( = ?auto_497545 ?auto_497553 ) ) ( not ( = ?auto_497545 ?auto_497554 ) ) ( not ( = ?auto_497545 ?auto_497555 ) ) ( not ( = ?auto_497546 ?auto_497547 ) ) ( not ( = ?auto_497546 ?auto_497548 ) ) ( not ( = ?auto_497546 ?auto_497549 ) ) ( not ( = ?auto_497546 ?auto_497550 ) ) ( not ( = ?auto_497546 ?auto_497551 ) ) ( not ( = ?auto_497546 ?auto_497552 ) ) ( not ( = ?auto_497546 ?auto_497553 ) ) ( not ( = ?auto_497546 ?auto_497554 ) ) ( not ( = ?auto_497546 ?auto_497555 ) ) ( not ( = ?auto_497547 ?auto_497548 ) ) ( not ( = ?auto_497547 ?auto_497549 ) ) ( not ( = ?auto_497547 ?auto_497550 ) ) ( not ( = ?auto_497547 ?auto_497551 ) ) ( not ( = ?auto_497547 ?auto_497552 ) ) ( not ( = ?auto_497547 ?auto_497553 ) ) ( not ( = ?auto_497547 ?auto_497554 ) ) ( not ( = ?auto_497547 ?auto_497555 ) ) ( not ( = ?auto_497548 ?auto_497549 ) ) ( not ( = ?auto_497548 ?auto_497550 ) ) ( not ( = ?auto_497548 ?auto_497551 ) ) ( not ( = ?auto_497548 ?auto_497552 ) ) ( not ( = ?auto_497548 ?auto_497553 ) ) ( not ( = ?auto_497548 ?auto_497554 ) ) ( not ( = ?auto_497548 ?auto_497555 ) ) ( not ( = ?auto_497549 ?auto_497550 ) ) ( not ( = ?auto_497549 ?auto_497551 ) ) ( not ( = ?auto_497549 ?auto_497552 ) ) ( not ( = ?auto_497549 ?auto_497553 ) ) ( not ( = ?auto_497549 ?auto_497554 ) ) ( not ( = ?auto_497549 ?auto_497555 ) ) ( not ( = ?auto_497550 ?auto_497551 ) ) ( not ( = ?auto_497550 ?auto_497552 ) ) ( not ( = ?auto_497550 ?auto_497553 ) ) ( not ( = ?auto_497550 ?auto_497554 ) ) ( not ( = ?auto_497550 ?auto_497555 ) ) ( not ( = ?auto_497551 ?auto_497552 ) ) ( not ( = ?auto_497551 ?auto_497553 ) ) ( not ( = ?auto_497551 ?auto_497554 ) ) ( not ( = ?auto_497551 ?auto_497555 ) ) ( not ( = ?auto_497552 ?auto_497553 ) ) ( not ( = ?auto_497552 ?auto_497554 ) ) ( not ( = ?auto_497552 ?auto_497555 ) ) ( not ( = ?auto_497553 ?auto_497554 ) ) ( not ( = ?auto_497553 ?auto_497555 ) ) ( not ( = ?auto_497554 ?auto_497555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_497554 ?auto_497555 )
      ( !STACK ?auto_497554 ?auto_497553 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497587 - BLOCK
      ?auto_497588 - BLOCK
      ?auto_497589 - BLOCK
      ?auto_497590 - BLOCK
      ?auto_497591 - BLOCK
      ?auto_497592 - BLOCK
      ?auto_497593 - BLOCK
      ?auto_497594 - BLOCK
      ?auto_497595 - BLOCK
      ?auto_497596 - BLOCK
    )
    :vars
    (
      ?auto_497597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497596 ?auto_497597 ) ( ON-TABLE ?auto_497587 ) ( ON ?auto_497588 ?auto_497587 ) ( ON ?auto_497589 ?auto_497588 ) ( ON ?auto_497590 ?auto_497589 ) ( ON ?auto_497591 ?auto_497590 ) ( ON ?auto_497592 ?auto_497591 ) ( ON ?auto_497593 ?auto_497592 ) ( ON ?auto_497594 ?auto_497593 ) ( not ( = ?auto_497587 ?auto_497588 ) ) ( not ( = ?auto_497587 ?auto_497589 ) ) ( not ( = ?auto_497587 ?auto_497590 ) ) ( not ( = ?auto_497587 ?auto_497591 ) ) ( not ( = ?auto_497587 ?auto_497592 ) ) ( not ( = ?auto_497587 ?auto_497593 ) ) ( not ( = ?auto_497587 ?auto_497594 ) ) ( not ( = ?auto_497587 ?auto_497595 ) ) ( not ( = ?auto_497587 ?auto_497596 ) ) ( not ( = ?auto_497587 ?auto_497597 ) ) ( not ( = ?auto_497588 ?auto_497589 ) ) ( not ( = ?auto_497588 ?auto_497590 ) ) ( not ( = ?auto_497588 ?auto_497591 ) ) ( not ( = ?auto_497588 ?auto_497592 ) ) ( not ( = ?auto_497588 ?auto_497593 ) ) ( not ( = ?auto_497588 ?auto_497594 ) ) ( not ( = ?auto_497588 ?auto_497595 ) ) ( not ( = ?auto_497588 ?auto_497596 ) ) ( not ( = ?auto_497588 ?auto_497597 ) ) ( not ( = ?auto_497589 ?auto_497590 ) ) ( not ( = ?auto_497589 ?auto_497591 ) ) ( not ( = ?auto_497589 ?auto_497592 ) ) ( not ( = ?auto_497589 ?auto_497593 ) ) ( not ( = ?auto_497589 ?auto_497594 ) ) ( not ( = ?auto_497589 ?auto_497595 ) ) ( not ( = ?auto_497589 ?auto_497596 ) ) ( not ( = ?auto_497589 ?auto_497597 ) ) ( not ( = ?auto_497590 ?auto_497591 ) ) ( not ( = ?auto_497590 ?auto_497592 ) ) ( not ( = ?auto_497590 ?auto_497593 ) ) ( not ( = ?auto_497590 ?auto_497594 ) ) ( not ( = ?auto_497590 ?auto_497595 ) ) ( not ( = ?auto_497590 ?auto_497596 ) ) ( not ( = ?auto_497590 ?auto_497597 ) ) ( not ( = ?auto_497591 ?auto_497592 ) ) ( not ( = ?auto_497591 ?auto_497593 ) ) ( not ( = ?auto_497591 ?auto_497594 ) ) ( not ( = ?auto_497591 ?auto_497595 ) ) ( not ( = ?auto_497591 ?auto_497596 ) ) ( not ( = ?auto_497591 ?auto_497597 ) ) ( not ( = ?auto_497592 ?auto_497593 ) ) ( not ( = ?auto_497592 ?auto_497594 ) ) ( not ( = ?auto_497592 ?auto_497595 ) ) ( not ( = ?auto_497592 ?auto_497596 ) ) ( not ( = ?auto_497592 ?auto_497597 ) ) ( not ( = ?auto_497593 ?auto_497594 ) ) ( not ( = ?auto_497593 ?auto_497595 ) ) ( not ( = ?auto_497593 ?auto_497596 ) ) ( not ( = ?auto_497593 ?auto_497597 ) ) ( not ( = ?auto_497594 ?auto_497595 ) ) ( not ( = ?auto_497594 ?auto_497596 ) ) ( not ( = ?auto_497594 ?auto_497597 ) ) ( not ( = ?auto_497595 ?auto_497596 ) ) ( not ( = ?auto_497595 ?auto_497597 ) ) ( not ( = ?auto_497596 ?auto_497597 ) ) ( CLEAR ?auto_497594 ) ( ON ?auto_497595 ?auto_497596 ) ( CLEAR ?auto_497595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_497587 ?auto_497588 ?auto_497589 ?auto_497590 ?auto_497591 ?auto_497592 ?auto_497593 ?auto_497594 ?auto_497595 )
      ( MAKE-10PILE ?auto_497587 ?auto_497588 ?auto_497589 ?auto_497590 ?auto_497591 ?auto_497592 ?auto_497593 ?auto_497594 ?auto_497595 ?auto_497596 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497629 - BLOCK
      ?auto_497630 - BLOCK
      ?auto_497631 - BLOCK
      ?auto_497632 - BLOCK
      ?auto_497633 - BLOCK
      ?auto_497634 - BLOCK
      ?auto_497635 - BLOCK
      ?auto_497636 - BLOCK
      ?auto_497637 - BLOCK
      ?auto_497638 - BLOCK
    )
    :vars
    (
      ?auto_497639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497638 ?auto_497639 ) ( ON-TABLE ?auto_497629 ) ( ON ?auto_497630 ?auto_497629 ) ( ON ?auto_497631 ?auto_497630 ) ( ON ?auto_497632 ?auto_497631 ) ( ON ?auto_497633 ?auto_497632 ) ( ON ?auto_497634 ?auto_497633 ) ( ON ?auto_497635 ?auto_497634 ) ( not ( = ?auto_497629 ?auto_497630 ) ) ( not ( = ?auto_497629 ?auto_497631 ) ) ( not ( = ?auto_497629 ?auto_497632 ) ) ( not ( = ?auto_497629 ?auto_497633 ) ) ( not ( = ?auto_497629 ?auto_497634 ) ) ( not ( = ?auto_497629 ?auto_497635 ) ) ( not ( = ?auto_497629 ?auto_497636 ) ) ( not ( = ?auto_497629 ?auto_497637 ) ) ( not ( = ?auto_497629 ?auto_497638 ) ) ( not ( = ?auto_497629 ?auto_497639 ) ) ( not ( = ?auto_497630 ?auto_497631 ) ) ( not ( = ?auto_497630 ?auto_497632 ) ) ( not ( = ?auto_497630 ?auto_497633 ) ) ( not ( = ?auto_497630 ?auto_497634 ) ) ( not ( = ?auto_497630 ?auto_497635 ) ) ( not ( = ?auto_497630 ?auto_497636 ) ) ( not ( = ?auto_497630 ?auto_497637 ) ) ( not ( = ?auto_497630 ?auto_497638 ) ) ( not ( = ?auto_497630 ?auto_497639 ) ) ( not ( = ?auto_497631 ?auto_497632 ) ) ( not ( = ?auto_497631 ?auto_497633 ) ) ( not ( = ?auto_497631 ?auto_497634 ) ) ( not ( = ?auto_497631 ?auto_497635 ) ) ( not ( = ?auto_497631 ?auto_497636 ) ) ( not ( = ?auto_497631 ?auto_497637 ) ) ( not ( = ?auto_497631 ?auto_497638 ) ) ( not ( = ?auto_497631 ?auto_497639 ) ) ( not ( = ?auto_497632 ?auto_497633 ) ) ( not ( = ?auto_497632 ?auto_497634 ) ) ( not ( = ?auto_497632 ?auto_497635 ) ) ( not ( = ?auto_497632 ?auto_497636 ) ) ( not ( = ?auto_497632 ?auto_497637 ) ) ( not ( = ?auto_497632 ?auto_497638 ) ) ( not ( = ?auto_497632 ?auto_497639 ) ) ( not ( = ?auto_497633 ?auto_497634 ) ) ( not ( = ?auto_497633 ?auto_497635 ) ) ( not ( = ?auto_497633 ?auto_497636 ) ) ( not ( = ?auto_497633 ?auto_497637 ) ) ( not ( = ?auto_497633 ?auto_497638 ) ) ( not ( = ?auto_497633 ?auto_497639 ) ) ( not ( = ?auto_497634 ?auto_497635 ) ) ( not ( = ?auto_497634 ?auto_497636 ) ) ( not ( = ?auto_497634 ?auto_497637 ) ) ( not ( = ?auto_497634 ?auto_497638 ) ) ( not ( = ?auto_497634 ?auto_497639 ) ) ( not ( = ?auto_497635 ?auto_497636 ) ) ( not ( = ?auto_497635 ?auto_497637 ) ) ( not ( = ?auto_497635 ?auto_497638 ) ) ( not ( = ?auto_497635 ?auto_497639 ) ) ( not ( = ?auto_497636 ?auto_497637 ) ) ( not ( = ?auto_497636 ?auto_497638 ) ) ( not ( = ?auto_497636 ?auto_497639 ) ) ( not ( = ?auto_497637 ?auto_497638 ) ) ( not ( = ?auto_497637 ?auto_497639 ) ) ( not ( = ?auto_497638 ?auto_497639 ) ) ( ON ?auto_497637 ?auto_497638 ) ( CLEAR ?auto_497635 ) ( ON ?auto_497636 ?auto_497637 ) ( CLEAR ?auto_497636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_497629 ?auto_497630 ?auto_497631 ?auto_497632 ?auto_497633 ?auto_497634 ?auto_497635 ?auto_497636 )
      ( MAKE-10PILE ?auto_497629 ?auto_497630 ?auto_497631 ?auto_497632 ?auto_497633 ?auto_497634 ?auto_497635 ?auto_497636 ?auto_497637 ?auto_497638 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497671 - BLOCK
      ?auto_497672 - BLOCK
      ?auto_497673 - BLOCK
      ?auto_497674 - BLOCK
      ?auto_497675 - BLOCK
      ?auto_497676 - BLOCK
      ?auto_497677 - BLOCK
      ?auto_497678 - BLOCK
      ?auto_497679 - BLOCK
      ?auto_497680 - BLOCK
    )
    :vars
    (
      ?auto_497681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497680 ?auto_497681 ) ( ON-TABLE ?auto_497671 ) ( ON ?auto_497672 ?auto_497671 ) ( ON ?auto_497673 ?auto_497672 ) ( ON ?auto_497674 ?auto_497673 ) ( ON ?auto_497675 ?auto_497674 ) ( ON ?auto_497676 ?auto_497675 ) ( not ( = ?auto_497671 ?auto_497672 ) ) ( not ( = ?auto_497671 ?auto_497673 ) ) ( not ( = ?auto_497671 ?auto_497674 ) ) ( not ( = ?auto_497671 ?auto_497675 ) ) ( not ( = ?auto_497671 ?auto_497676 ) ) ( not ( = ?auto_497671 ?auto_497677 ) ) ( not ( = ?auto_497671 ?auto_497678 ) ) ( not ( = ?auto_497671 ?auto_497679 ) ) ( not ( = ?auto_497671 ?auto_497680 ) ) ( not ( = ?auto_497671 ?auto_497681 ) ) ( not ( = ?auto_497672 ?auto_497673 ) ) ( not ( = ?auto_497672 ?auto_497674 ) ) ( not ( = ?auto_497672 ?auto_497675 ) ) ( not ( = ?auto_497672 ?auto_497676 ) ) ( not ( = ?auto_497672 ?auto_497677 ) ) ( not ( = ?auto_497672 ?auto_497678 ) ) ( not ( = ?auto_497672 ?auto_497679 ) ) ( not ( = ?auto_497672 ?auto_497680 ) ) ( not ( = ?auto_497672 ?auto_497681 ) ) ( not ( = ?auto_497673 ?auto_497674 ) ) ( not ( = ?auto_497673 ?auto_497675 ) ) ( not ( = ?auto_497673 ?auto_497676 ) ) ( not ( = ?auto_497673 ?auto_497677 ) ) ( not ( = ?auto_497673 ?auto_497678 ) ) ( not ( = ?auto_497673 ?auto_497679 ) ) ( not ( = ?auto_497673 ?auto_497680 ) ) ( not ( = ?auto_497673 ?auto_497681 ) ) ( not ( = ?auto_497674 ?auto_497675 ) ) ( not ( = ?auto_497674 ?auto_497676 ) ) ( not ( = ?auto_497674 ?auto_497677 ) ) ( not ( = ?auto_497674 ?auto_497678 ) ) ( not ( = ?auto_497674 ?auto_497679 ) ) ( not ( = ?auto_497674 ?auto_497680 ) ) ( not ( = ?auto_497674 ?auto_497681 ) ) ( not ( = ?auto_497675 ?auto_497676 ) ) ( not ( = ?auto_497675 ?auto_497677 ) ) ( not ( = ?auto_497675 ?auto_497678 ) ) ( not ( = ?auto_497675 ?auto_497679 ) ) ( not ( = ?auto_497675 ?auto_497680 ) ) ( not ( = ?auto_497675 ?auto_497681 ) ) ( not ( = ?auto_497676 ?auto_497677 ) ) ( not ( = ?auto_497676 ?auto_497678 ) ) ( not ( = ?auto_497676 ?auto_497679 ) ) ( not ( = ?auto_497676 ?auto_497680 ) ) ( not ( = ?auto_497676 ?auto_497681 ) ) ( not ( = ?auto_497677 ?auto_497678 ) ) ( not ( = ?auto_497677 ?auto_497679 ) ) ( not ( = ?auto_497677 ?auto_497680 ) ) ( not ( = ?auto_497677 ?auto_497681 ) ) ( not ( = ?auto_497678 ?auto_497679 ) ) ( not ( = ?auto_497678 ?auto_497680 ) ) ( not ( = ?auto_497678 ?auto_497681 ) ) ( not ( = ?auto_497679 ?auto_497680 ) ) ( not ( = ?auto_497679 ?auto_497681 ) ) ( not ( = ?auto_497680 ?auto_497681 ) ) ( ON ?auto_497679 ?auto_497680 ) ( ON ?auto_497678 ?auto_497679 ) ( CLEAR ?auto_497676 ) ( ON ?auto_497677 ?auto_497678 ) ( CLEAR ?auto_497677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_497671 ?auto_497672 ?auto_497673 ?auto_497674 ?auto_497675 ?auto_497676 ?auto_497677 )
      ( MAKE-10PILE ?auto_497671 ?auto_497672 ?auto_497673 ?auto_497674 ?auto_497675 ?auto_497676 ?auto_497677 ?auto_497678 ?auto_497679 ?auto_497680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497713 - BLOCK
      ?auto_497714 - BLOCK
      ?auto_497715 - BLOCK
      ?auto_497716 - BLOCK
      ?auto_497717 - BLOCK
      ?auto_497718 - BLOCK
      ?auto_497719 - BLOCK
      ?auto_497720 - BLOCK
      ?auto_497721 - BLOCK
      ?auto_497722 - BLOCK
    )
    :vars
    (
      ?auto_497723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497722 ?auto_497723 ) ( ON-TABLE ?auto_497713 ) ( ON ?auto_497714 ?auto_497713 ) ( ON ?auto_497715 ?auto_497714 ) ( ON ?auto_497716 ?auto_497715 ) ( ON ?auto_497717 ?auto_497716 ) ( not ( = ?auto_497713 ?auto_497714 ) ) ( not ( = ?auto_497713 ?auto_497715 ) ) ( not ( = ?auto_497713 ?auto_497716 ) ) ( not ( = ?auto_497713 ?auto_497717 ) ) ( not ( = ?auto_497713 ?auto_497718 ) ) ( not ( = ?auto_497713 ?auto_497719 ) ) ( not ( = ?auto_497713 ?auto_497720 ) ) ( not ( = ?auto_497713 ?auto_497721 ) ) ( not ( = ?auto_497713 ?auto_497722 ) ) ( not ( = ?auto_497713 ?auto_497723 ) ) ( not ( = ?auto_497714 ?auto_497715 ) ) ( not ( = ?auto_497714 ?auto_497716 ) ) ( not ( = ?auto_497714 ?auto_497717 ) ) ( not ( = ?auto_497714 ?auto_497718 ) ) ( not ( = ?auto_497714 ?auto_497719 ) ) ( not ( = ?auto_497714 ?auto_497720 ) ) ( not ( = ?auto_497714 ?auto_497721 ) ) ( not ( = ?auto_497714 ?auto_497722 ) ) ( not ( = ?auto_497714 ?auto_497723 ) ) ( not ( = ?auto_497715 ?auto_497716 ) ) ( not ( = ?auto_497715 ?auto_497717 ) ) ( not ( = ?auto_497715 ?auto_497718 ) ) ( not ( = ?auto_497715 ?auto_497719 ) ) ( not ( = ?auto_497715 ?auto_497720 ) ) ( not ( = ?auto_497715 ?auto_497721 ) ) ( not ( = ?auto_497715 ?auto_497722 ) ) ( not ( = ?auto_497715 ?auto_497723 ) ) ( not ( = ?auto_497716 ?auto_497717 ) ) ( not ( = ?auto_497716 ?auto_497718 ) ) ( not ( = ?auto_497716 ?auto_497719 ) ) ( not ( = ?auto_497716 ?auto_497720 ) ) ( not ( = ?auto_497716 ?auto_497721 ) ) ( not ( = ?auto_497716 ?auto_497722 ) ) ( not ( = ?auto_497716 ?auto_497723 ) ) ( not ( = ?auto_497717 ?auto_497718 ) ) ( not ( = ?auto_497717 ?auto_497719 ) ) ( not ( = ?auto_497717 ?auto_497720 ) ) ( not ( = ?auto_497717 ?auto_497721 ) ) ( not ( = ?auto_497717 ?auto_497722 ) ) ( not ( = ?auto_497717 ?auto_497723 ) ) ( not ( = ?auto_497718 ?auto_497719 ) ) ( not ( = ?auto_497718 ?auto_497720 ) ) ( not ( = ?auto_497718 ?auto_497721 ) ) ( not ( = ?auto_497718 ?auto_497722 ) ) ( not ( = ?auto_497718 ?auto_497723 ) ) ( not ( = ?auto_497719 ?auto_497720 ) ) ( not ( = ?auto_497719 ?auto_497721 ) ) ( not ( = ?auto_497719 ?auto_497722 ) ) ( not ( = ?auto_497719 ?auto_497723 ) ) ( not ( = ?auto_497720 ?auto_497721 ) ) ( not ( = ?auto_497720 ?auto_497722 ) ) ( not ( = ?auto_497720 ?auto_497723 ) ) ( not ( = ?auto_497721 ?auto_497722 ) ) ( not ( = ?auto_497721 ?auto_497723 ) ) ( not ( = ?auto_497722 ?auto_497723 ) ) ( ON ?auto_497721 ?auto_497722 ) ( ON ?auto_497720 ?auto_497721 ) ( ON ?auto_497719 ?auto_497720 ) ( CLEAR ?auto_497717 ) ( ON ?auto_497718 ?auto_497719 ) ( CLEAR ?auto_497718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_497713 ?auto_497714 ?auto_497715 ?auto_497716 ?auto_497717 ?auto_497718 )
      ( MAKE-10PILE ?auto_497713 ?auto_497714 ?auto_497715 ?auto_497716 ?auto_497717 ?auto_497718 ?auto_497719 ?auto_497720 ?auto_497721 ?auto_497722 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497755 - BLOCK
      ?auto_497756 - BLOCK
      ?auto_497757 - BLOCK
      ?auto_497758 - BLOCK
      ?auto_497759 - BLOCK
      ?auto_497760 - BLOCK
      ?auto_497761 - BLOCK
      ?auto_497762 - BLOCK
      ?auto_497763 - BLOCK
      ?auto_497764 - BLOCK
    )
    :vars
    (
      ?auto_497765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497764 ?auto_497765 ) ( ON-TABLE ?auto_497755 ) ( ON ?auto_497756 ?auto_497755 ) ( ON ?auto_497757 ?auto_497756 ) ( ON ?auto_497758 ?auto_497757 ) ( not ( = ?auto_497755 ?auto_497756 ) ) ( not ( = ?auto_497755 ?auto_497757 ) ) ( not ( = ?auto_497755 ?auto_497758 ) ) ( not ( = ?auto_497755 ?auto_497759 ) ) ( not ( = ?auto_497755 ?auto_497760 ) ) ( not ( = ?auto_497755 ?auto_497761 ) ) ( not ( = ?auto_497755 ?auto_497762 ) ) ( not ( = ?auto_497755 ?auto_497763 ) ) ( not ( = ?auto_497755 ?auto_497764 ) ) ( not ( = ?auto_497755 ?auto_497765 ) ) ( not ( = ?auto_497756 ?auto_497757 ) ) ( not ( = ?auto_497756 ?auto_497758 ) ) ( not ( = ?auto_497756 ?auto_497759 ) ) ( not ( = ?auto_497756 ?auto_497760 ) ) ( not ( = ?auto_497756 ?auto_497761 ) ) ( not ( = ?auto_497756 ?auto_497762 ) ) ( not ( = ?auto_497756 ?auto_497763 ) ) ( not ( = ?auto_497756 ?auto_497764 ) ) ( not ( = ?auto_497756 ?auto_497765 ) ) ( not ( = ?auto_497757 ?auto_497758 ) ) ( not ( = ?auto_497757 ?auto_497759 ) ) ( not ( = ?auto_497757 ?auto_497760 ) ) ( not ( = ?auto_497757 ?auto_497761 ) ) ( not ( = ?auto_497757 ?auto_497762 ) ) ( not ( = ?auto_497757 ?auto_497763 ) ) ( not ( = ?auto_497757 ?auto_497764 ) ) ( not ( = ?auto_497757 ?auto_497765 ) ) ( not ( = ?auto_497758 ?auto_497759 ) ) ( not ( = ?auto_497758 ?auto_497760 ) ) ( not ( = ?auto_497758 ?auto_497761 ) ) ( not ( = ?auto_497758 ?auto_497762 ) ) ( not ( = ?auto_497758 ?auto_497763 ) ) ( not ( = ?auto_497758 ?auto_497764 ) ) ( not ( = ?auto_497758 ?auto_497765 ) ) ( not ( = ?auto_497759 ?auto_497760 ) ) ( not ( = ?auto_497759 ?auto_497761 ) ) ( not ( = ?auto_497759 ?auto_497762 ) ) ( not ( = ?auto_497759 ?auto_497763 ) ) ( not ( = ?auto_497759 ?auto_497764 ) ) ( not ( = ?auto_497759 ?auto_497765 ) ) ( not ( = ?auto_497760 ?auto_497761 ) ) ( not ( = ?auto_497760 ?auto_497762 ) ) ( not ( = ?auto_497760 ?auto_497763 ) ) ( not ( = ?auto_497760 ?auto_497764 ) ) ( not ( = ?auto_497760 ?auto_497765 ) ) ( not ( = ?auto_497761 ?auto_497762 ) ) ( not ( = ?auto_497761 ?auto_497763 ) ) ( not ( = ?auto_497761 ?auto_497764 ) ) ( not ( = ?auto_497761 ?auto_497765 ) ) ( not ( = ?auto_497762 ?auto_497763 ) ) ( not ( = ?auto_497762 ?auto_497764 ) ) ( not ( = ?auto_497762 ?auto_497765 ) ) ( not ( = ?auto_497763 ?auto_497764 ) ) ( not ( = ?auto_497763 ?auto_497765 ) ) ( not ( = ?auto_497764 ?auto_497765 ) ) ( ON ?auto_497763 ?auto_497764 ) ( ON ?auto_497762 ?auto_497763 ) ( ON ?auto_497761 ?auto_497762 ) ( ON ?auto_497760 ?auto_497761 ) ( CLEAR ?auto_497758 ) ( ON ?auto_497759 ?auto_497760 ) ( CLEAR ?auto_497759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_497755 ?auto_497756 ?auto_497757 ?auto_497758 ?auto_497759 )
      ( MAKE-10PILE ?auto_497755 ?auto_497756 ?auto_497757 ?auto_497758 ?auto_497759 ?auto_497760 ?auto_497761 ?auto_497762 ?auto_497763 ?auto_497764 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497797 - BLOCK
      ?auto_497798 - BLOCK
      ?auto_497799 - BLOCK
      ?auto_497800 - BLOCK
      ?auto_497801 - BLOCK
      ?auto_497802 - BLOCK
      ?auto_497803 - BLOCK
      ?auto_497804 - BLOCK
      ?auto_497805 - BLOCK
      ?auto_497806 - BLOCK
    )
    :vars
    (
      ?auto_497807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497806 ?auto_497807 ) ( ON-TABLE ?auto_497797 ) ( ON ?auto_497798 ?auto_497797 ) ( ON ?auto_497799 ?auto_497798 ) ( not ( = ?auto_497797 ?auto_497798 ) ) ( not ( = ?auto_497797 ?auto_497799 ) ) ( not ( = ?auto_497797 ?auto_497800 ) ) ( not ( = ?auto_497797 ?auto_497801 ) ) ( not ( = ?auto_497797 ?auto_497802 ) ) ( not ( = ?auto_497797 ?auto_497803 ) ) ( not ( = ?auto_497797 ?auto_497804 ) ) ( not ( = ?auto_497797 ?auto_497805 ) ) ( not ( = ?auto_497797 ?auto_497806 ) ) ( not ( = ?auto_497797 ?auto_497807 ) ) ( not ( = ?auto_497798 ?auto_497799 ) ) ( not ( = ?auto_497798 ?auto_497800 ) ) ( not ( = ?auto_497798 ?auto_497801 ) ) ( not ( = ?auto_497798 ?auto_497802 ) ) ( not ( = ?auto_497798 ?auto_497803 ) ) ( not ( = ?auto_497798 ?auto_497804 ) ) ( not ( = ?auto_497798 ?auto_497805 ) ) ( not ( = ?auto_497798 ?auto_497806 ) ) ( not ( = ?auto_497798 ?auto_497807 ) ) ( not ( = ?auto_497799 ?auto_497800 ) ) ( not ( = ?auto_497799 ?auto_497801 ) ) ( not ( = ?auto_497799 ?auto_497802 ) ) ( not ( = ?auto_497799 ?auto_497803 ) ) ( not ( = ?auto_497799 ?auto_497804 ) ) ( not ( = ?auto_497799 ?auto_497805 ) ) ( not ( = ?auto_497799 ?auto_497806 ) ) ( not ( = ?auto_497799 ?auto_497807 ) ) ( not ( = ?auto_497800 ?auto_497801 ) ) ( not ( = ?auto_497800 ?auto_497802 ) ) ( not ( = ?auto_497800 ?auto_497803 ) ) ( not ( = ?auto_497800 ?auto_497804 ) ) ( not ( = ?auto_497800 ?auto_497805 ) ) ( not ( = ?auto_497800 ?auto_497806 ) ) ( not ( = ?auto_497800 ?auto_497807 ) ) ( not ( = ?auto_497801 ?auto_497802 ) ) ( not ( = ?auto_497801 ?auto_497803 ) ) ( not ( = ?auto_497801 ?auto_497804 ) ) ( not ( = ?auto_497801 ?auto_497805 ) ) ( not ( = ?auto_497801 ?auto_497806 ) ) ( not ( = ?auto_497801 ?auto_497807 ) ) ( not ( = ?auto_497802 ?auto_497803 ) ) ( not ( = ?auto_497802 ?auto_497804 ) ) ( not ( = ?auto_497802 ?auto_497805 ) ) ( not ( = ?auto_497802 ?auto_497806 ) ) ( not ( = ?auto_497802 ?auto_497807 ) ) ( not ( = ?auto_497803 ?auto_497804 ) ) ( not ( = ?auto_497803 ?auto_497805 ) ) ( not ( = ?auto_497803 ?auto_497806 ) ) ( not ( = ?auto_497803 ?auto_497807 ) ) ( not ( = ?auto_497804 ?auto_497805 ) ) ( not ( = ?auto_497804 ?auto_497806 ) ) ( not ( = ?auto_497804 ?auto_497807 ) ) ( not ( = ?auto_497805 ?auto_497806 ) ) ( not ( = ?auto_497805 ?auto_497807 ) ) ( not ( = ?auto_497806 ?auto_497807 ) ) ( ON ?auto_497805 ?auto_497806 ) ( ON ?auto_497804 ?auto_497805 ) ( ON ?auto_497803 ?auto_497804 ) ( ON ?auto_497802 ?auto_497803 ) ( ON ?auto_497801 ?auto_497802 ) ( CLEAR ?auto_497799 ) ( ON ?auto_497800 ?auto_497801 ) ( CLEAR ?auto_497800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_497797 ?auto_497798 ?auto_497799 ?auto_497800 )
      ( MAKE-10PILE ?auto_497797 ?auto_497798 ?auto_497799 ?auto_497800 ?auto_497801 ?auto_497802 ?auto_497803 ?auto_497804 ?auto_497805 ?auto_497806 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497839 - BLOCK
      ?auto_497840 - BLOCK
      ?auto_497841 - BLOCK
      ?auto_497842 - BLOCK
      ?auto_497843 - BLOCK
      ?auto_497844 - BLOCK
      ?auto_497845 - BLOCK
      ?auto_497846 - BLOCK
      ?auto_497847 - BLOCK
      ?auto_497848 - BLOCK
    )
    :vars
    (
      ?auto_497849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497848 ?auto_497849 ) ( ON-TABLE ?auto_497839 ) ( ON ?auto_497840 ?auto_497839 ) ( not ( = ?auto_497839 ?auto_497840 ) ) ( not ( = ?auto_497839 ?auto_497841 ) ) ( not ( = ?auto_497839 ?auto_497842 ) ) ( not ( = ?auto_497839 ?auto_497843 ) ) ( not ( = ?auto_497839 ?auto_497844 ) ) ( not ( = ?auto_497839 ?auto_497845 ) ) ( not ( = ?auto_497839 ?auto_497846 ) ) ( not ( = ?auto_497839 ?auto_497847 ) ) ( not ( = ?auto_497839 ?auto_497848 ) ) ( not ( = ?auto_497839 ?auto_497849 ) ) ( not ( = ?auto_497840 ?auto_497841 ) ) ( not ( = ?auto_497840 ?auto_497842 ) ) ( not ( = ?auto_497840 ?auto_497843 ) ) ( not ( = ?auto_497840 ?auto_497844 ) ) ( not ( = ?auto_497840 ?auto_497845 ) ) ( not ( = ?auto_497840 ?auto_497846 ) ) ( not ( = ?auto_497840 ?auto_497847 ) ) ( not ( = ?auto_497840 ?auto_497848 ) ) ( not ( = ?auto_497840 ?auto_497849 ) ) ( not ( = ?auto_497841 ?auto_497842 ) ) ( not ( = ?auto_497841 ?auto_497843 ) ) ( not ( = ?auto_497841 ?auto_497844 ) ) ( not ( = ?auto_497841 ?auto_497845 ) ) ( not ( = ?auto_497841 ?auto_497846 ) ) ( not ( = ?auto_497841 ?auto_497847 ) ) ( not ( = ?auto_497841 ?auto_497848 ) ) ( not ( = ?auto_497841 ?auto_497849 ) ) ( not ( = ?auto_497842 ?auto_497843 ) ) ( not ( = ?auto_497842 ?auto_497844 ) ) ( not ( = ?auto_497842 ?auto_497845 ) ) ( not ( = ?auto_497842 ?auto_497846 ) ) ( not ( = ?auto_497842 ?auto_497847 ) ) ( not ( = ?auto_497842 ?auto_497848 ) ) ( not ( = ?auto_497842 ?auto_497849 ) ) ( not ( = ?auto_497843 ?auto_497844 ) ) ( not ( = ?auto_497843 ?auto_497845 ) ) ( not ( = ?auto_497843 ?auto_497846 ) ) ( not ( = ?auto_497843 ?auto_497847 ) ) ( not ( = ?auto_497843 ?auto_497848 ) ) ( not ( = ?auto_497843 ?auto_497849 ) ) ( not ( = ?auto_497844 ?auto_497845 ) ) ( not ( = ?auto_497844 ?auto_497846 ) ) ( not ( = ?auto_497844 ?auto_497847 ) ) ( not ( = ?auto_497844 ?auto_497848 ) ) ( not ( = ?auto_497844 ?auto_497849 ) ) ( not ( = ?auto_497845 ?auto_497846 ) ) ( not ( = ?auto_497845 ?auto_497847 ) ) ( not ( = ?auto_497845 ?auto_497848 ) ) ( not ( = ?auto_497845 ?auto_497849 ) ) ( not ( = ?auto_497846 ?auto_497847 ) ) ( not ( = ?auto_497846 ?auto_497848 ) ) ( not ( = ?auto_497846 ?auto_497849 ) ) ( not ( = ?auto_497847 ?auto_497848 ) ) ( not ( = ?auto_497847 ?auto_497849 ) ) ( not ( = ?auto_497848 ?auto_497849 ) ) ( ON ?auto_497847 ?auto_497848 ) ( ON ?auto_497846 ?auto_497847 ) ( ON ?auto_497845 ?auto_497846 ) ( ON ?auto_497844 ?auto_497845 ) ( ON ?auto_497843 ?auto_497844 ) ( ON ?auto_497842 ?auto_497843 ) ( CLEAR ?auto_497840 ) ( ON ?auto_497841 ?auto_497842 ) ( CLEAR ?auto_497841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_497839 ?auto_497840 ?auto_497841 )
      ( MAKE-10PILE ?auto_497839 ?auto_497840 ?auto_497841 ?auto_497842 ?auto_497843 ?auto_497844 ?auto_497845 ?auto_497846 ?auto_497847 ?auto_497848 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497881 - BLOCK
      ?auto_497882 - BLOCK
      ?auto_497883 - BLOCK
      ?auto_497884 - BLOCK
      ?auto_497885 - BLOCK
      ?auto_497886 - BLOCK
      ?auto_497887 - BLOCK
      ?auto_497888 - BLOCK
      ?auto_497889 - BLOCK
      ?auto_497890 - BLOCK
    )
    :vars
    (
      ?auto_497891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497890 ?auto_497891 ) ( ON-TABLE ?auto_497881 ) ( not ( = ?auto_497881 ?auto_497882 ) ) ( not ( = ?auto_497881 ?auto_497883 ) ) ( not ( = ?auto_497881 ?auto_497884 ) ) ( not ( = ?auto_497881 ?auto_497885 ) ) ( not ( = ?auto_497881 ?auto_497886 ) ) ( not ( = ?auto_497881 ?auto_497887 ) ) ( not ( = ?auto_497881 ?auto_497888 ) ) ( not ( = ?auto_497881 ?auto_497889 ) ) ( not ( = ?auto_497881 ?auto_497890 ) ) ( not ( = ?auto_497881 ?auto_497891 ) ) ( not ( = ?auto_497882 ?auto_497883 ) ) ( not ( = ?auto_497882 ?auto_497884 ) ) ( not ( = ?auto_497882 ?auto_497885 ) ) ( not ( = ?auto_497882 ?auto_497886 ) ) ( not ( = ?auto_497882 ?auto_497887 ) ) ( not ( = ?auto_497882 ?auto_497888 ) ) ( not ( = ?auto_497882 ?auto_497889 ) ) ( not ( = ?auto_497882 ?auto_497890 ) ) ( not ( = ?auto_497882 ?auto_497891 ) ) ( not ( = ?auto_497883 ?auto_497884 ) ) ( not ( = ?auto_497883 ?auto_497885 ) ) ( not ( = ?auto_497883 ?auto_497886 ) ) ( not ( = ?auto_497883 ?auto_497887 ) ) ( not ( = ?auto_497883 ?auto_497888 ) ) ( not ( = ?auto_497883 ?auto_497889 ) ) ( not ( = ?auto_497883 ?auto_497890 ) ) ( not ( = ?auto_497883 ?auto_497891 ) ) ( not ( = ?auto_497884 ?auto_497885 ) ) ( not ( = ?auto_497884 ?auto_497886 ) ) ( not ( = ?auto_497884 ?auto_497887 ) ) ( not ( = ?auto_497884 ?auto_497888 ) ) ( not ( = ?auto_497884 ?auto_497889 ) ) ( not ( = ?auto_497884 ?auto_497890 ) ) ( not ( = ?auto_497884 ?auto_497891 ) ) ( not ( = ?auto_497885 ?auto_497886 ) ) ( not ( = ?auto_497885 ?auto_497887 ) ) ( not ( = ?auto_497885 ?auto_497888 ) ) ( not ( = ?auto_497885 ?auto_497889 ) ) ( not ( = ?auto_497885 ?auto_497890 ) ) ( not ( = ?auto_497885 ?auto_497891 ) ) ( not ( = ?auto_497886 ?auto_497887 ) ) ( not ( = ?auto_497886 ?auto_497888 ) ) ( not ( = ?auto_497886 ?auto_497889 ) ) ( not ( = ?auto_497886 ?auto_497890 ) ) ( not ( = ?auto_497886 ?auto_497891 ) ) ( not ( = ?auto_497887 ?auto_497888 ) ) ( not ( = ?auto_497887 ?auto_497889 ) ) ( not ( = ?auto_497887 ?auto_497890 ) ) ( not ( = ?auto_497887 ?auto_497891 ) ) ( not ( = ?auto_497888 ?auto_497889 ) ) ( not ( = ?auto_497888 ?auto_497890 ) ) ( not ( = ?auto_497888 ?auto_497891 ) ) ( not ( = ?auto_497889 ?auto_497890 ) ) ( not ( = ?auto_497889 ?auto_497891 ) ) ( not ( = ?auto_497890 ?auto_497891 ) ) ( ON ?auto_497889 ?auto_497890 ) ( ON ?auto_497888 ?auto_497889 ) ( ON ?auto_497887 ?auto_497888 ) ( ON ?auto_497886 ?auto_497887 ) ( ON ?auto_497885 ?auto_497886 ) ( ON ?auto_497884 ?auto_497885 ) ( ON ?auto_497883 ?auto_497884 ) ( CLEAR ?auto_497881 ) ( ON ?auto_497882 ?auto_497883 ) ( CLEAR ?auto_497882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_497881 ?auto_497882 )
      ( MAKE-10PILE ?auto_497881 ?auto_497882 ?auto_497883 ?auto_497884 ?auto_497885 ?auto_497886 ?auto_497887 ?auto_497888 ?auto_497889 ?auto_497890 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_497923 - BLOCK
      ?auto_497924 - BLOCK
      ?auto_497925 - BLOCK
      ?auto_497926 - BLOCK
      ?auto_497927 - BLOCK
      ?auto_497928 - BLOCK
      ?auto_497929 - BLOCK
      ?auto_497930 - BLOCK
      ?auto_497931 - BLOCK
      ?auto_497932 - BLOCK
    )
    :vars
    (
      ?auto_497933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497932 ?auto_497933 ) ( not ( = ?auto_497923 ?auto_497924 ) ) ( not ( = ?auto_497923 ?auto_497925 ) ) ( not ( = ?auto_497923 ?auto_497926 ) ) ( not ( = ?auto_497923 ?auto_497927 ) ) ( not ( = ?auto_497923 ?auto_497928 ) ) ( not ( = ?auto_497923 ?auto_497929 ) ) ( not ( = ?auto_497923 ?auto_497930 ) ) ( not ( = ?auto_497923 ?auto_497931 ) ) ( not ( = ?auto_497923 ?auto_497932 ) ) ( not ( = ?auto_497923 ?auto_497933 ) ) ( not ( = ?auto_497924 ?auto_497925 ) ) ( not ( = ?auto_497924 ?auto_497926 ) ) ( not ( = ?auto_497924 ?auto_497927 ) ) ( not ( = ?auto_497924 ?auto_497928 ) ) ( not ( = ?auto_497924 ?auto_497929 ) ) ( not ( = ?auto_497924 ?auto_497930 ) ) ( not ( = ?auto_497924 ?auto_497931 ) ) ( not ( = ?auto_497924 ?auto_497932 ) ) ( not ( = ?auto_497924 ?auto_497933 ) ) ( not ( = ?auto_497925 ?auto_497926 ) ) ( not ( = ?auto_497925 ?auto_497927 ) ) ( not ( = ?auto_497925 ?auto_497928 ) ) ( not ( = ?auto_497925 ?auto_497929 ) ) ( not ( = ?auto_497925 ?auto_497930 ) ) ( not ( = ?auto_497925 ?auto_497931 ) ) ( not ( = ?auto_497925 ?auto_497932 ) ) ( not ( = ?auto_497925 ?auto_497933 ) ) ( not ( = ?auto_497926 ?auto_497927 ) ) ( not ( = ?auto_497926 ?auto_497928 ) ) ( not ( = ?auto_497926 ?auto_497929 ) ) ( not ( = ?auto_497926 ?auto_497930 ) ) ( not ( = ?auto_497926 ?auto_497931 ) ) ( not ( = ?auto_497926 ?auto_497932 ) ) ( not ( = ?auto_497926 ?auto_497933 ) ) ( not ( = ?auto_497927 ?auto_497928 ) ) ( not ( = ?auto_497927 ?auto_497929 ) ) ( not ( = ?auto_497927 ?auto_497930 ) ) ( not ( = ?auto_497927 ?auto_497931 ) ) ( not ( = ?auto_497927 ?auto_497932 ) ) ( not ( = ?auto_497927 ?auto_497933 ) ) ( not ( = ?auto_497928 ?auto_497929 ) ) ( not ( = ?auto_497928 ?auto_497930 ) ) ( not ( = ?auto_497928 ?auto_497931 ) ) ( not ( = ?auto_497928 ?auto_497932 ) ) ( not ( = ?auto_497928 ?auto_497933 ) ) ( not ( = ?auto_497929 ?auto_497930 ) ) ( not ( = ?auto_497929 ?auto_497931 ) ) ( not ( = ?auto_497929 ?auto_497932 ) ) ( not ( = ?auto_497929 ?auto_497933 ) ) ( not ( = ?auto_497930 ?auto_497931 ) ) ( not ( = ?auto_497930 ?auto_497932 ) ) ( not ( = ?auto_497930 ?auto_497933 ) ) ( not ( = ?auto_497931 ?auto_497932 ) ) ( not ( = ?auto_497931 ?auto_497933 ) ) ( not ( = ?auto_497932 ?auto_497933 ) ) ( ON ?auto_497931 ?auto_497932 ) ( ON ?auto_497930 ?auto_497931 ) ( ON ?auto_497929 ?auto_497930 ) ( ON ?auto_497928 ?auto_497929 ) ( ON ?auto_497927 ?auto_497928 ) ( ON ?auto_497926 ?auto_497927 ) ( ON ?auto_497925 ?auto_497926 ) ( ON ?auto_497924 ?auto_497925 ) ( ON ?auto_497923 ?auto_497924 ) ( CLEAR ?auto_497923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_497923 )
      ( MAKE-10PILE ?auto_497923 ?auto_497924 ?auto_497925 ?auto_497926 ?auto_497927 ?auto_497928 ?auto_497929 ?auto_497930 ?auto_497931 ?auto_497932 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_497966 - BLOCK
      ?auto_497967 - BLOCK
      ?auto_497968 - BLOCK
      ?auto_497969 - BLOCK
      ?auto_497970 - BLOCK
      ?auto_497971 - BLOCK
      ?auto_497972 - BLOCK
      ?auto_497973 - BLOCK
      ?auto_497974 - BLOCK
      ?auto_497975 - BLOCK
      ?auto_497976 - BLOCK
    )
    :vars
    (
      ?auto_497977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_497975 ) ( ON ?auto_497976 ?auto_497977 ) ( CLEAR ?auto_497976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_497966 ) ( ON ?auto_497967 ?auto_497966 ) ( ON ?auto_497968 ?auto_497967 ) ( ON ?auto_497969 ?auto_497968 ) ( ON ?auto_497970 ?auto_497969 ) ( ON ?auto_497971 ?auto_497970 ) ( ON ?auto_497972 ?auto_497971 ) ( ON ?auto_497973 ?auto_497972 ) ( ON ?auto_497974 ?auto_497973 ) ( ON ?auto_497975 ?auto_497974 ) ( not ( = ?auto_497966 ?auto_497967 ) ) ( not ( = ?auto_497966 ?auto_497968 ) ) ( not ( = ?auto_497966 ?auto_497969 ) ) ( not ( = ?auto_497966 ?auto_497970 ) ) ( not ( = ?auto_497966 ?auto_497971 ) ) ( not ( = ?auto_497966 ?auto_497972 ) ) ( not ( = ?auto_497966 ?auto_497973 ) ) ( not ( = ?auto_497966 ?auto_497974 ) ) ( not ( = ?auto_497966 ?auto_497975 ) ) ( not ( = ?auto_497966 ?auto_497976 ) ) ( not ( = ?auto_497966 ?auto_497977 ) ) ( not ( = ?auto_497967 ?auto_497968 ) ) ( not ( = ?auto_497967 ?auto_497969 ) ) ( not ( = ?auto_497967 ?auto_497970 ) ) ( not ( = ?auto_497967 ?auto_497971 ) ) ( not ( = ?auto_497967 ?auto_497972 ) ) ( not ( = ?auto_497967 ?auto_497973 ) ) ( not ( = ?auto_497967 ?auto_497974 ) ) ( not ( = ?auto_497967 ?auto_497975 ) ) ( not ( = ?auto_497967 ?auto_497976 ) ) ( not ( = ?auto_497967 ?auto_497977 ) ) ( not ( = ?auto_497968 ?auto_497969 ) ) ( not ( = ?auto_497968 ?auto_497970 ) ) ( not ( = ?auto_497968 ?auto_497971 ) ) ( not ( = ?auto_497968 ?auto_497972 ) ) ( not ( = ?auto_497968 ?auto_497973 ) ) ( not ( = ?auto_497968 ?auto_497974 ) ) ( not ( = ?auto_497968 ?auto_497975 ) ) ( not ( = ?auto_497968 ?auto_497976 ) ) ( not ( = ?auto_497968 ?auto_497977 ) ) ( not ( = ?auto_497969 ?auto_497970 ) ) ( not ( = ?auto_497969 ?auto_497971 ) ) ( not ( = ?auto_497969 ?auto_497972 ) ) ( not ( = ?auto_497969 ?auto_497973 ) ) ( not ( = ?auto_497969 ?auto_497974 ) ) ( not ( = ?auto_497969 ?auto_497975 ) ) ( not ( = ?auto_497969 ?auto_497976 ) ) ( not ( = ?auto_497969 ?auto_497977 ) ) ( not ( = ?auto_497970 ?auto_497971 ) ) ( not ( = ?auto_497970 ?auto_497972 ) ) ( not ( = ?auto_497970 ?auto_497973 ) ) ( not ( = ?auto_497970 ?auto_497974 ) ) ( not ( = ?auto_497970 ?auto_497975 ) ) ( not ( = ?auto_497970 ?auto_497976 ) ) ( not ( = ?auto_497970 ?auto_497977 ) ) ( not ( = ?auto_497971 ?auto_497972 ) ) ( not ( = ?auto_497971 ?auto_497973 ) ) ( not ( = ?auto_497971 ?auto_497974 ) ) ( not ( = ?auto_497971 ?auto_497975 ) ) ( not ( = ?auto_497971 ?auto_497976 ) ) ( not ( = ?auto_497971 ?auto_497977 ) ) ( not ( = ?auto_497972 ?auto_497973 ) ) ( not ( = ?auto_497972 ?auto_497974 ) ) ( not ( = ?auto_497972 ?auto_497975 ) ) ( not ( = ?auto_497972 ?auto_497976 ) ) ( not ( = ?auto_497972 ?auto_497977 ) ) ( not ( = ?auto_497973 ?auto_497974 ) ) ( not ( = ?auto_497973 ?auto_497975 ) ) ( not ( = ?auto_497973 ?auto_497976 ) ) ( not ( = ?auto_497973 ?auto_497977 ) ) ( not ( = ?auto_497974 ?auto_497975 ) ) ( not ( = ?auto_497974 ?auto_497976 ) ) ( not ( = ?auto_497974 ?auto_497977 ) ) ( not ( = ?auto_497975 ?auto_497976 ) ) ( not ( = ?auto_497975 ?auto_497977 ) ) ( not ( = ?auto_497976 ?auto_497977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_497976 ?auto_497977 )
      ( !STACK ?auto_497976 ?auto_497975 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498012 - BLOCK
      ?auto_498013 - BLOCK
      ?auto_498014 - BLOCK
      ?auto_498015 - BLOCK
      ?auto_498016 - BLOCK
      ?auto_498017 - BLOCK
      ?auto_498018 - BLOCK
      ?auto_498019 - BLOCK
      ?auto_498020 - BLOCK
      ?auto_498021 - BLOCK
      ?auto_498022 - BLOCK
    )
    :vars
    (
      ?auto_498023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498022 ?auto_498023 ) ( ON-TABLE ?auto_498012 ) ( ON ?auto_498013 ?auto_498012 ) ( ON ?auto_498014 ?auto_498013 ) ( ON ?auto_498015 ?auto_498014 ) ( ON ?auto_498016 ?auto_498015 ) ( ON ?auto_498017 ?auto_498016 ) ( ON ?auto_498018 ?auto_498017 ) ( ON ?auto_498019 ?auto_498018 ) ( ON ?auto_498020 ?auto_498019 ) ( not ( = ?auto_498012 ?auto_498013 ) ) ( not ( = ?auto_498012 ?auto_498014 ) ) ( not ( = ?auto_498012 ?auto_498015 ) ) ( not ( = ?auto_498012 ?auto_498016 ) ) ( not ( = ?auto_498012 ?auto_498017 ) ) ( not ( = ?auto_498012 ?auto_498018 ) ) ( not ( = ?auto_498012 ?auto_498019 ) ) ( not ( = ?auto_498012 ?auto_498020 ) ) ( not ( = ?auto_498012 ?auto_498021 ) ) ( not ( = ?auto_498012 ?auto_498022 ) ) ( not ( = ?auto_498012 ?auto_498023 ) ) ( not ( = ?auto_498013 ?auto_498014 ) ) ( not ( = ?auto_498013 ?auto_498015 ) ) ( not ( = ?auto_498013 ?auto_498016 ) ) ( not ( = ?auto_498013 ?auto_498017 ) ) ( not ( = ?auto_498013 ?auto_498018 ) ) ( not ( = ?auto_498013 ?auto_498019 ) ) ( not ( = ?auto_498013 ?auto_498020 ) ) ( not ( = ?auto_498013 ?auto_498021 ) ) ( not ( = ?auto_498013 ?auto_498022 ) ) ( not ( = ?auto_498013 ?auto_498023 ) ) ( not ( = ?auto_498014 ?auto_498015 ) ) ( not ( = ?auto_498014 ?auto_498016 ) ) ( not ( = ?auto_498014 ?auto_498017 ) ) ( not ( = ?auto_498014 ?auto_498018 ) ) ( not ( = ?auto_498014 ?auto_498019 ) ) ( not ( = ?auto_498014 ?auto_498020 ) ) ( not ( = ?auto_498014 ?auto_498021 ) ) ( not ( = ?auto_498014 ?auto_498022 ) ) ( not ( = ?auto_498014 ?auto_498023 ) ) ( not ( = ?auto_498015 ?auto_498016 ) ) ( not ( = ?auto_498015 ?auto_498017 ) ) ( not ( = ?auto_498015 ?auto_498018 ) ) ( not ( = ?auto_498015 ?auto_498019 ) ) ( not ( = ?auto_498015 ?auto_498020 ) ) ( not ( = ?auto_498015 ?auto_498021 ) ) ( not ( = ?auto_498015 ?auto_498022 ) ) ( not ( = ?auto_498015 ?auto_498023 ) ) ( not ( = ?auto_498016 ?auto_498017 ) ) ( not ( = ?auto_498016 ?auto_498018 ) ) ( not ( = ?auto_498016 ?auto_498019 ) ) ( not ( = ?auto_498016 ?auto_498020 ) ) ( not ( = ?auto_498016 ?auto_498021 ) ) ( not ( = ?auto_498016 ?auto_498022 ) ) ( not ( = ?auto_498016 ?auto_498023 ) ) ( not ( = ?auto_498017 ?auto_498018 ) ) ( not ( = ?auto_498017 ?auto_498019 ) ) ( not ( = ?auto_498017 ?auto_498020 ) ) ( not ( = ?auto_498017 ?auto_498021 ) ) ( not ( = ?auto_498017 ?auto_498022 ) ) ( not ( = ?auto_498017 ?auto_498023 ) ) ( not ( = ?auto_498018 ?auto_498019 ) ) ( not ( = ?auto_498018 ?auto_498020 ) ) ( not ( = ?auto_498018 ?auto_498021 ) ) ( not ( = ?auto_498018 ?auto_498022 ) ) ( not ( = ?auto_498018 ?auto_498023 ) ) ( not ( = ?auto_498019 ?auto_498020 ) ) ( not ( = ?auto_498019 ?auto_498021 ) ) ( not ( = ?auto_498019 ?auto_498022 ) ) ( not ( = ?auto_498019 ?auto_498023 ) ) ( not ( = ?auto_498020 ?auto_498021 ) ) ( not ( = ?auto_498020 ?auto_498022 ) ) ( not ( = ?auto_498020 ?auto_498023 ) ) ( not ( = ?auto_498021 ?auto_498022 ) ) ( not ( = ?auto_498021 ?auto_498023 ) ) ( not ( = ?auto_498022 ?auto_498023 ) ) ( CLEAR ?auto_498020 ) ( ON ?auto_498021 ?auto_498022 ) ( CLEAR ?auto_498021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_498012 ?auto_498013 ?auto_498014 ?auto_498015 ?auto_498016 ?auto_498017 ?auto_498018 ?auto_498019 ?auto_498020 ?auto_498021 )
      ( MAKE-11PILE ?auto_498012 ?auto_498013 ?auto_498014 ?auto_498015 ?auto_498016 ?auto_498017 ?auto_498018 ?auto_498019 ?auto_498020 ?auto_498021 ?auto_498022 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498058 - BLOCK
      ?auto_498059 - BLOCK
      ?auto_498060 - BLOCK
      ?auto_498061 - BLOCK
      ?auto_498062 - BLOCK
      ?auto_498063 - BLOCK
      ?auto_498064 - BLOCK
      ?auto_498065 - BLOCK
      ?auto_498066 - BLOCK
      ?auto_498067 - BLOCK
      ?auto_498068 - BLOCK
    )
    :vars
    (
      ?auto_498069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498068 ?auto_498069 ) ( ON-TABLE ?auto_498058 ) ( ON ?auto_498059 ?auto_498058 ) ( ON ?auto_498060 ?auto_498059 ) ( ON ?auto_498061 ?auto_498060 ) ( ON ?auto_498062 ?auto_498061 ) ( ON ?auto_498063 ?auto_498062 ) ( ON ?auto_498064 ?auto_498063 ) ( ON ?auto_498065 ?auto_498064 ) ( not ( = ?auto_498058 ?auto_498059 ) ) ( not ( = ?auto_498058 ?auto_498060 ) ) ( not ( = ?auto_498058 ?auto_498061 ) ) ( not ( = ?auto_498058 ?auto_498062 ) ) ( not ( = ?auto_498058 ?auto_498063 ) ) ( not ( = ?auto_498058 ?auto_498064 ) ) ( not ( = ?auto_498058 ?auto_498065 ) ) ( not ( = ?auto_498058 ?auto_498066 ) ) ( not ( = ?auto_498058 ?auto_498067 ) ) ( not ( = ?auto_498058 ?auto_498068 ) ) ( not ( = ?auto_498058 ?auto_498069 ) ) ( not ( = ?auto_498059 ?auto_498060 ) ) ( not ( = ?auto_498059 ?auto_498061 ) ) ( not ( = ?auto_498059 ?auto_498062 ) ) ( not ( = ?auto_498059 ?auto_498063 ) ) ( not ( = ?auto_498059 ?auto_498064 ) ) ( not ( = ?auto_498059 ?auto_498065 ) ) ( not ( = ?auto_498059 ?auto_498066 ) ) ( not ( = ?auto_498059 ?auto_498067 ) ) ( not ( = ?auto_498059 ?auto_498068 ) ) ( not ( = ?auto_498059 ?auto_498069 ) ) ( not ( = ?auto_498060 ?auto_498061 ) ) ( not ( = ?auto_498060 ?auto_498062 ) ) ( not ( = ?auto_498060 ?auto_498063 ) ) ( not ( = ?auto_498060 ?auto_498064 ) ) ( not ( = ?auto_498060 ?auto_498065 ) ) ( not ( = ?auto_498060 ?auto_498066 ) ) ( not ( = ?auto_498060 ?auto_498067 ) ) ( not ( = ?auto_498060 ?auto_498068 ) ) ( not ( = ?auto_498060 ?auto_498069 ) ) ( not ( = ?auto_498061 ?auto_498062 ) ) ( not ( = ?auto_498061 ?auto_498063 ) ) ( not ( = ?auto_498061 ?auto_498064 ) ) ( not ( = ?auto_498061 ?auto_498065 ) ) ( not ( = ?auto_498061 ?auto_498066 ) ) ( not ( = ?auto_498061 ?auto_498067 ) ) ( not ( = ?auto_498061 ?auto_498068 ) ) ( not ( = ?auto_498061 ?auto_498069 ) ) ( not ( = ?auto_498062 ?auto_498063 ) ) ( not ( = ?auto_498062 ?auto_498064 ) ) ( not ( = ?auto_498062 ?auto_498065 ) ) ( not ( = ?auto_498062 ?auto_498066 ) ) ( not ( = ?auto_498062 ?auto_498067 ) ) ( not ( = ?auto_498062 ?auto_498068 ) ) ( not ( = ?auto_498062 ?auto_498069 ) ) ( not ( = ?auto_498063 ?auto_498064 ) ) ( not ( = ?auto_498063 ?auto_498065 ) ) ( not ( = ?auto_498063 ?auto_498066 ) ) ( not ( = ?auto_498063 ?auto_498067 ) ) ( not ( = ?auto_498063 ?auto_498068 ) ) ( not ( = ?auto_498063 ?auto_498069 ) ) ( not ( = ?auto_498064 ?auto_498065 ) ) ( not ( = ?auto_498064 ?auto_498066 ) ) ( not ( = ?auto_498064 ?auto_498067 ) ) ( not ( = ?auto_498064 ?auto_498068 ) ) ( not ( = ?auto_498064 ?auto_498069 ) ) ( not ( = ?auto_498065 ?auto_498066 ) ) ( not ( = ?auto_498065 ?auto_498067 ) ) ( not ( = ?auto_498065 ?auto_498068 ) ) ( not ( = ?auto_498065 ?auto_498069 ) ) ( not ( = ?auto_498066 ?auto_498067 ) ) ( not ( = ?auto_498066 ?auto_498068 ) ) ( not ( = ?auto_498066 ?auto_498069 ) ) ( not ( = ?auto_498067 ?auto_498068 ) ) ( not ( = ?auto_498067 ?auto_498069 ) ) ( not ( = ?auto_498068 ?auto_498069 ) ) ( ON ?auto_498067 ?auto_498068 ) ( CLEAR ?auto_498065 ) ( ON ?auto_498066 ?auto_498067 ) ( CLEAR ?auto_498066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_498058 ?auto_498059 ?auto_498060 ?auto_498061 ?auto_498062 ?auto_498063 ?auto_498064 ?auto_498065 ?auto_498066 )
      ( MAKE-11PILE ?auto_498058 ?auto_498059 ?auto_498060 ?auto_498061 ?auto_498062 ?auto_498063 ?auto_498064 ?auto_498065 ?auto_498066 ?auto_498067 ?auto_498068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498104 - BLOCK
      ?auto_498105 - BLOCK
      ?auto_498106 - BLOCK
      ?auto_498107 - BLOCK
      ?auto_498108 - BLOCK
      ?auto_498109 - BLOCK
      ?auto_498110 - BLOCK
      ?auto_498111 - BLOCK
      ?auto_498112 - BLOCK
      ?auto_498113 - BLOCK
      ?auto_498114 - BLOCK
    )
    :vars
    (
      ?auto_498115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498114 ?auto_498115 ) ( ON-TABLE ?auto_498104 ) ( ON ?auto_498105 ?auto_498104 ) ( ON ?auto_498106 ?auto_498105 ) ( ON ?auto_498107 ?auto_498106 ) ( ON ?auto_498108 ?auto_498107 ) ( ON ?auto_498109 ?auto_498108 ) ( ON ?auto_498110 ?auto_498109 ) ( not ( = ?auto_498104 ?auto_498105 ) ) ( not ( = ?auto_498104 ?auto_498106 ) ) ( not ( = ?auto_498104 ?auto_498107 ) ) ( not ( = ?auto_498104 ?auto_498108 ) ) ( not ( = ?auto_498104 ?auto_498109 ) ) ( not ( = ?auto_498104 ?auto_498110 ) ) ( not ( = ?auto_498104 ?auto_498111 ) ) ( not ( = ?auto_498104 ?auto_498112 ) ) ( not ( = ?auto_498104 ?auto_498113 ) ) ( not ( = ?auto_498104 ?auto_498114 ) ) ( not ( = ?auto_498104 ?auto_498115 ) ) ( not ( = ?auto_498105 ?auto_498106 ) ) ( not ( = ?auto_498105 ?auto_498107 ) ) ( not ( = ?auto_498105 ?auto_498108 ) ) ( not ( = ?auto_498105 ?auto_498109 ) ) ( not ( = ?auto_498105 ?auto_498110 ) ) ( not ( = ?auto_498105 ?auto_498111 ) ) ( not ( = ?auto_498105 ?auto_498112 ) ) ( not ( = ?auto_498105 ?auto_498113 ) ) ( not ( = ?auto_498105 ?auto_498114 ) ) ( not ( = ?auto_498105 ?auto_498115 ) ) ( not ( = ?auto_498106 ?auto_498107 ) ) ( not ( = ?auto_498106 ?auto_498108 ) ) ( not ( = ?auto_498106 ?auto_498109 ) ) ( not ( = ?auto_498106 ?auto_498110 ) ) ( not ( = ?auto_498106 ?auto_498111 ) ) ( not ( = ?auto_498106 ?auto_498112 ) ) ( not ( = ?auto_498106 ?auto_498113 ) ) ( not ( = ?auto_498106 ?auto_498114 ) ) ( not ( = ?auto_498106 ?auto_498115 ) ) ( not ( = ?auto_498107 ?auto_498108 ) ) ( not ( = ?auto_498107 ?auto_498109 ) ) ( not ( = ?auto_498107 ?auto_498110 ) ) ( not ( = ?auto_498107 ?auto_498111 ) ) ( not ( = ?auto_498107 ?auto_498112 ) ) ( not ( = ?auto_498107 ?auto_498113 ) ) ( not ( = ?auto_498107 ?auto_498114 ) ) ( not ( = ?auto_498107 ?auto_498115 ) ) ( not ( = ?auto_498108 ?auto_498109 ) ) ( not ( = ?auto_498108 ?auto_498110 ) ) ( not ( = ?auto_498108 ?auto_498111 ) ) ( not ( = ?auto_498108 ?auto_498112 ) ) ( not ( = ?auto_498108 ?auto_498113 ) ) ( not ( = ?auto_498108 ?auto_498114 ) ) ( not ( = ?auto_498108 ?auto_498115 ) ) ( not ( = ?auto_498109 ?auto_498110 ) ) ( not ( = ?auto_498109 ?auto_498111 ) ) ( not ( = ?auto_498109 ?auto_498112 ) ) ( not ( = ?auto_498109 ?auto_498113 ) ) ( not ( = ?auto_498109 ?auto_498114 ) ) ( not ( = ?auto_498109 ?auto_498115 ) ) ( not ( = ?auto_498110 ?auto_498111 ) ) ( not ( = ?auto_498110 ?auto_498112 ) ) ( not ( = ?auto_498110 ?auto_498113 ) ) ( not ( = ?auto_498110 ?auto_498114 ) ) ( not ( = ?auto_498110 ?auto_498115 ) ) ( not ( = ?auto_498111 ?auto_498112 ) ) ( not ( = ?auto_498111 ?auto_498113 ) ) ( not ( = ?auto_498111 ?auto_498114 ) ) ( not ( = ?auto_498111 ?auto_498115 ) ) ( not ( = ?auto_498112 ?auto_498113 ) ) ( not ( = ?auto_498112 ?auto_498114 ) ) ( not ( = ?auto_498112 ?auto_498115 ) ) ( not ( = ?auto_498113 ?auto_498114 ) ) ( not ( = ?auto_498113 ?auto_498115 ) ) ( not ( = ?auto_498114 ?auto_498115 ) ) ( ON ?auto_498113 ?auto_498114 ) ( ON ?auto_498112 ?auto_498113 ) ( CLEAR ?auto_498110 ) ( ON ?auto_498111 ?auto_498112 ) ( CLEAR ?auto_498111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_498104 ?auto_498105 ?auto_498106 ?auto_498107 ?auto_498108 ?auto_498109 ?auto_498110 ?auto_498111 )
      ( MAKE-11PILE ?auto_498104 ?auto_498105 ?auto_498106 ?auto_498107 ?auto_498108 ?auto_498109 ?auto_498110 ?auto_498111 ?auto_498112 ?auto_498113 ?auto_498114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498150 - BLOCK
      ?auto_498151 - BLOCK
      ?auto_498152 - BLOCK
      ?auto_498153 - BLOCK
      ?auto_498154 - BLOCK
      ?auto_498155 - BLOCK
      ?auto_498156 - BLOCK
      ?auto_498157 - BLOCK
      ?auto_498158 - BLOCK
      ?auto_498159 - BLOCK
      ?auto_498160 - BLOCK
    )
    :vars
    (
      ?auto_498161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498160 ?auto_498161 ) ( ON-TABLE ?auto_498150 ) ( ON ?auto_498151 ?auto_498150 ) ( ON ?auto_498152 ?auto_498151 ) ( ON ?auto_498153 ?auto_498152 ) ( ON ?auto_498154 ?auto_498153 ) ( ON ?auto_498155 ?auto_498154 ) ( not ( = ?auto_498150 ?auto_498151 ) ) ( not ( = ?auto_498150 ?auto_498152 ) ) ( not ( = ?auto_498150 ?auto_498153 ) ) ( not ( = ?auto_498150 ?auto_498154 ) ) ( not ( = ?auto_498150 ?auto_498155 ) ) ( not ( = ?auto_498150 ?auto_498156 ) ) ( not ( = ?auto_498150 ?auto_498157 ) ) ( not ( = ?auto_498150 ?auto_498158 ) ) ( not ( = ?auto_498150 ?auto_498159 ) ) ( not ( = ?auto_498150 ?auto_498160 ) ) ( not ( = ?auto_498150 ?auto_498161 ) ) ( not ( = ?auto_498151 ?auto_498152 ) ) ( not ( = ?auto_498151 ?auto_498153 ) ) ( not ( = ?auto_498151 ?auto_498154 ) ) ( not ( = ?auto_498151 ?auto_498155 ) ) ( not ( = ?auto_498151 ?auto_498156 ) ) ( not ( = ?auto_498151 ?auto_498157 ) ) ( not ( = ?auto_498151 ?auto_498158 ) ) ( not ( = ?auto_498151 ?auto_498159 ) ) ( not ( = ?auto_498151 ?auto_498160 ) ) ( not ( = ?auto_498151 ?auto_498161 ) ) ( not ( = ?auto_498152 ?auto_498153 ) ) ( not ( = ?auto_498152 ?auto_498154 ) ) ( not ( = ?auto_498152 ?auto_498155 ) ) ( not ( = ?auto_498152 ?auto_498156 ) ) ( not ( = ?auto_498152 ?auto_498157 ) ) ( not ( = ?auto_498152 ?auto_498158 ) ) ( not ( = ?auto_498152 ?auto_498159 ) ) ( not ( = ?auto_498152 ?auto_498160 ) ) ( not ( = ?auto_498152 ?auto_498161 ) ) ( not ( = ?auto_498153 ?auto_498154 ) ) ( not ( = ?auto_498153 ?auto_498155 ) ) ( not ( = ?auto_498153 ?auto_498156 ) ) ( not ( = ?auto_498153 ?auto_498157 ) ) ( not ( = ?auto_498153 ?auto_498158 ) ) ( not ( = ?auto_498153 ?auto_498159 ) ) ( not ( = ?auto_498153 ?auto_498160 ) ) ( not ( = ?auto_498153 ?auto_498161 ) ) ( not ( = ?auto_498154 ?auto_498155 ) ) ( not ( = ?auto_498154 ?auto_498156 ) ) ( not ( = ?auto_498154 ?auto_498157 ) ) ( not ( = ?auto_498154 ?auto_498158 ) ) ( not ( = ?auto_498154 ?auto_498159 ) ) ( not ( = ?auto_498154 ?auto_498160 ) ) ( not ( = ?auto_498154 ?auto_498161 ) ) ( not ( = ?auto_498155 ?auto_498156 ) ) ( not ( = ?auto_498155 ?auto_498157 ) ) ( not ( = ?auto_498155 ?auto_498158 ) ) ( not ( = ?auto_498155 ?auto_498159 ) ) ( not ( = ?auto_498155 ?auto_498160 ) ) ( not ( = ?auto_498155 ?auto_498161 ) ) ( not ( = ?auto_498156 ?auto_498157 ) ) ( not ( = ?auto_498156 ?auto_498158 ) ) ( not ( = ?auto_498156 ?auto_498159 ) ) ( not ( = ?auto_498156 ?auto_498160 ) ) ( not ( = ?auto_498156 ?auto_498161 ) ) ( not ( = ?auto_498157 ?auto_498158 ) ) ( not ( = ?auto_498157 ?auto_498159 ) ) ( not ( = ?auto_498157 ?auto_498160 ) ) ( not ( = ?auto_498157 ?auto_498161 ) ) ( not ( = ?auto_498158 ?auto_498159 ) ) ( not ( = ?auto_498158 ?auto_498160 ) ) ( not ( = ?auto_498158 ?auto_498161 ) ) ( not ( = ?auto_498159 ?auto_498160 ) ) ( not ( = ?auto_498159 ?auto_498161 ) ) ( not ( = ?auto_498160 ?auto_498161 ) ) ( ON ?auto_498159 ?auto_498160 ) ( ON ?auto_498158 ?auto_498159 ) ( ON ?auto_498157 ?auto_498158 ) ( CLEAR ?auto_498155 ) ( ON ?auto_498156 ?auto_498157 ) ( CLEAR ?auto_498156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_498150 ?auto_498151 ?auto_498152 ?auto_498153 ?auto_498154 ?auto_498155 ?auto_498156 )
      ( MAKE-11PILE ?auto_498150 ?auto_498151 ?auto_498152 ?auto_498153 ?auto_498154 ?auto_498155 ?auto_498156 ?auto_498157 ?auto_498158 ?auto_498159 ?auto_498160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498196 - BLOCK
      ?auto_498197 - BLOCK
      ?auto_498198 - BLOCK
      ?auto_498199 - BLOCK
      ?auto_498200 - BLOCK
      ?auto_498201 - BLOCK
      ?auto_498202 - BLOCK
      ?auto_498203 - BLOCK
      ?auto_498204 - BLOCK
      ?auto_498205 - BLOCK
      ?auto_498206 - BLOCK
    )
    :vars
    (
      ?auto_498207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498206 ?auto_498207 ) ( ON-TABLE ?auto_498196 ) ( ON ?auto_498197 ?auto_498196 ) ( ON ?auto_498198 ?auto_498197 ) ( ON ?auto_498199 ?auto_498198 ) ( ON ?auto_498200 ?auto_498199 ) ( not ( = ?auto_498196 ?auto_498197 ) ) ( not ( = ?auto_498196 ?auto_498198 ) ) ( not ( = ?auto_498196 ?auto_498199 ) ) ( not ( = ?auto_498196 ?auto_498200 ) ) ( not ( = ?auto_498196 ?auto_498201 ) ) ( not ( = ?auto_498196 ?auto_498202 ) ) ( not ( = ?auto_498196 ?auto_498203 ) ) ( not ( = ?auto_498196 ?auto_498204 ) ) ( not ( = ?auto_498196 ?auto_498205 ) ) ( not ( = ?auto_498196 ?auto_498206 ) ) ( not ( = ?auto_498196 ?auto_498207 ) ) ( not ( = ?auto_498197 ?auto_498198 ) ) ( not ( = ?auto_498197 ?auto_498199 ) ) ( not ( = ?auto_498197 ?auto_498200 ) ) ( not ( = ?auto_498197 ?auto_498201 ) ) ( not ( = ?auto_498197 ?auto_498202 ) ) ( not ( = ?auto_498197 ?auto_498203 ) ) ( not ( = ?auto_498197 ?auto_498204 ) ) ( not ( = ?auto_498197 ?auto_498205 ) ) ( not ( = ?auto_498197 ?auto_498206 ) ) ( not ( = ?auto_498197 ?auto_498207 ) ) ( not ( = ?auto_498198 ?auto_498199 ) ) ( not ( = ?auto_498198 ?auto_498200 ) ) ( not ( = ?auto_498198 ?auto_498201 ) ) ( not ( = ?auto_498198 ?auto_498202 ) ) ( not ( = ?auto_498198 ?auto_498203 ) ) ( not ( = ?auto_498198 ?auto_498204 ) ) ( not ( = ?auto_498198 ?auto_498205 ) ) ( not ( = ?auto_498198 ?auto_498206 ) ) ( not ( = ?auto_498198 ?auto_498207 ) ) ( not ( = ?auto_498199 ?auto_498200 ) ) ( not ( = ?auto_498199 ?auto_498201 ) ) ( not ( = ?auto_498199 ?auto_498202 ) ) ( not ( = ?auto_498199 ?auto_498203 ) ) ( not ( = ?auto_498199 ?auto_498204 ) ) ( not ( = ?auto_498199 ?auto_498205 ) ) ( not ( = ?auto_498199 ?auto_498206 ) ) ( not ( = ?auto_498199 ?auto_498207 ) ) ( not ( = ?auto_498200 ?auto_498201 ) ) ( not ( = ?auto_498200 ?auto_498202 ) ) ( not ( = ?auto_498200 ?auto_498203 ) ) ( not ( = ?auto_498200 ?auto_498204 ) ) ( not ( = ?auto_498200 ?auto_498205 ) ) ( not ( = ?auto_498200 ?auto_498206 ) ) ( not ( = ?auto_498200 ?auto_498207 ) ) ( not ( = ?auto_498201 ?auto_498202 ) ) ( not ( = ?auto_498201 ?auto_498203 ) ) ( not ( = ?auto_498201 ?auto_498204 ) ) ( not ( = ?auto_498201 ?auto_498205 ) ) ( not ( = ?auto_498201 ?auto_498206 ) ) ( not ( = ?auto_498201 ?auto_498207 ) ) ( not ( = ?auto_498202 ?auto_498203 ) ) ( not ( = ?auto_498202 ?auto_498204 ) ) ( not ( = ?auto_498202 ?auto_498205 ) ) ( not ( = ?auto_498202 ?auto_498206 ) ) ( not ( = ?auto_498202 ?auto_498207 ) ) ( not ( = ?auto_498203 ?auto_498204 ) ) ( not ( = ?auto_498203 ?auto_498205 ) ) ( not ( = ?auto_498203 ?auto_498206 ) ) ( not ( = ?auto_498203 ?auto_498207 ) ) ( not ( = ?auto_498204 ?auto_498205 ) ) ( not ( = ?auto_498204 ?auto_498206 ) ) ( not ( = ?auto_498204 ?auto_498207 ) ) ( not ( = ?auto_498205 ?auto_498206 ) ) ( not ( = ?auto_498205 ?auto_498207 ) ) ( not ( = ?auto_498206 ?auto_498207 ) ) ( ON ?auto_498205 ?auto_498206 ) ( ON ?auto_498204 ?auto_498205 ) ( ON ?auto_498203 ?auto_498204 ) ( ON ?auto_498202 ?auto_498203 ) ( CLEAR ?auto_498200 ) ( ON ?auto_498201 ?auto_498202 ) ( CLEAR ?auto_498201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_498196 ?auto_498197 ?auto_498198 ?auto_498199 ?auto_498200 ?auto_498201 )
      ( MAKE-11PILE ?auto_498196 ?auto_498197 ?auto_498198 ?auto_498199 ?auto_498200 ?auto_498201 ?auto_498202 ?auto_498203 ?auto_498204 ?auto_498205 ?auto_498206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498242 - BLOCK
      ?auto_498243 - BLOCK
      ?auto_498244 - BLOCK
      ?auto_498245 - BLOCK
      ?auto_498246 - BLOCK
      ?auto_498247 - BLOCK
      ?auto_498248 - BLOCK
      ?auto_498249 - BLOCK
      ?auto_498250 - BLOCK
      ?auto_498251 - BLOCK
      ?auto_498252 - BLOCK
    )
    :vars
    (
      ?auto_498253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498252 ?auto_498253 ) ( ON-TABLE ?auto_498242 ) ( ON ?auto_498243 ?auto_498242 ) ( ON ?auto_498244 ?auto_498243 ) ( ON ?auto_498245 ?auto_498244 ) ( not ( = ?auto_498242 ?auto_498243 ) ) ( not ( = ?auto_498242 ?auto_498244 ) ) ( not ( = ?auto_498242 ?auto_498245 ) ) ( not ( = ?auto_498242 ?auto_498246 ) ) ( not ( = ?auto_498242 ?auto_498247 ) ) ( not ( = ?auto_498242 ?auto_498248 ) ) ( not ( = ?auto_498242 ?auto_498249 ) ) ( not ( = ?auto_498242 ?auto_498250 ) ) ( not ( = ?auto_498242 ?auto_498251 ) ) ( not ( = ?auto_498242 ?auto_498252 ) ) ( not ( = ?auto_498242 ?auto_498253 ) ) ( not ( = ?auto_498243 ?auto_498244 ) ) ( not ( = ?auto_498243 ?auto_498245 ) ) ( not ( = ?auto_498243 ?auto_498246 ) ) ( not ( = ?auto_498243 ?auto_498247 ) ) ( not ( = ?auto_498243 ?auto_498248 ) ) ( not ( = ?auto_498243 ?auto_498249 ) ) ( not ( = ?auto_498243 ?auto_498250 ) ) ( not ( = ?auto_498243 ?auto_498251 ) ) ( not ( = ?auto_498243 ?auto_498252 ) ) ( not ( = ?auto_498243 ?auto_498253 ) ) ( not ( = ?auto_498244 ?auto_498245 ) ) ( not ( = ?auto_498244 ?auto_498246 ) ) ( not ( = ?auto_498244 ?auto_498247 ) ) ( not ( = ?auto_498244 ?auto_498248 ) ) ( not ( = ?auto_498244 ?auto_498249 ) ) ( not ( = ?auto_498244 ?auto_498250 ) ) ( not ( = ?auto_498244 ?auto_498251 ) ) ( not ( = ?auto_498244 ?auto_498252 ) ) ( not ( = ?auto_498244 ?auto_498253 ) ) ( not ( = ?auto_498245 ?auto_498246 ) ) ( not ( = ?auto_498245 ?auto_498247 ) ) ( not ( = ?auto_498245 ?auto_498248 ) ) ( not ( = ?auto_498245 ?auto_498249 ) ) ( not ( = ?auto_498245 ?auto_498250 ) ) ( not ( = ?auto_498245 ?auto_498251 ) ) ( not ( = ?auto_498245 ?auto_498252 ) ) ( not ( = ?auto_498245 ?auto_498253 ) ) ( not ( = ?auto_498246 ?auto_498247 ) ) ( not ( = ?auto_498246 ?auto_498248 ) ) ( not ( = ?auto_498246 ?auto_498249 ) ) ( not ( = ?auto_498246 ?auto_498250 ) ) ( not ( = ?auto_498246 ?auto_498251 ) ) ( not ( = ?auto_498246 ?auto_498252 ) ) ( not ( = ?auto_498246 ?auto_498253 ) ) ( not ( = ?auto_498247 ?auto_498248 ) ) ( not ( = ?auto_498247 ?auto_498249 ) ) ( not ( = ?auto_498247 ?auto_498250 ) ) ( not ( = ?auto_498247 ?auto_498251 ) ) ( not ( = ?auto_498247 ?auto_498252 ) ) ( not ( = ?auto_498247 ?auto_498253 ) ) ( not ( = ?auto_498248 ?auto_498249 ) ) ( not ( = ?auto_498248 ?auto_498250 ) ) ( not ( = ?auto_498248 ?auto_498251 ) ) ( not ( = ?auto_498248 ?auto_498252 ) ) ( not ( = ?auto_498248 ?auto_498253 ) ) ( not ( = ?auto_498249 ?auto_498250 ) ) ( not ( = ?auto_498249 ?auto_498251 ) ) ( not ( = ?auto_498249 ?auto_498252 ) ) ( not ( = ?auto_498249 ?auto_498253 ) ) ( not ( = ?auto_498250 ?auto_498251 ) ) ( not ( = ?auto_498250 ?auto_498252 ) ) ( not ( = ?auto_498250 ?auto_498253 ) ) ( not ( = ?auto_498251 ?auto_498252 ) ) ( not ( = ?auto_498251 ?auto_498253 ) ) ( not ( = ?auto_498252 ?auto_498253 ) ) ( ON ?auto_498251 ?auto_498252 ) ( ON ?auto_498250 ?auto_498251 ) ( ON ?auto_498249 ?auto_498250 ) ( ON ?auto_498248 ?auto_498249 ) ( ON ?auto_498247 ?auto_498248 ) ( CLEAR ?auto_498245 ) ( ON ?auto_498246 ?auto_498247 ) ( CLEAR ?auto_498246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_498242 ?auto_498243 ?auto_498244 ?auto_498245 ?auto_498246 )
      ( MAKE-11PILE ?auto_498242 ?auto_498243 ?auto_498244 ?auto_498245 ?auto_498246 ?auto_498247 ?auto_498248 ?auto_498249 ?auto_498250 ?auto_498251 ?auto_498252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498288 - BLOCK
      ?auto_498289 - BLOCK
      ?auto_498290 - BLOCK
      ?auto_498291 - BLOCK
      ?auto_498292 - BLOCK
      ?auto_498293 - BLOCK
      ?auto_498294 - BLOCK
      ?auto_498295 - BLOCK
      ?auto_498296 - BLOCK
      ?auto_498297 - BLOCK
      ?auto_498298 - BLOCK
    )
    :vars
    (
      ?auto_498299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498298 ?auto_498299 ) ( ON-TABLE ?auto_498288 ) ( ON ?auto_498289 ?auto_498288 ) ( ON ?auto_498290 ?auto_498289 ) ( not ( = ?auto_498288 ?auto_498289 ) ) ( not ( = ?auto_498288 ?auto_498290 ) ) ( not ( = ?auto_498288 ?auto_498291 ) ) ( not ( = ?auto_498288 ?auto_498292 ) ) ( not ( = ?auto_498288 ?auto_498293 ) ) ( not ( = ?auto_498288 ?auto_498294 ) ) ( not ( = ?auto_498288 ?auto_498295 ) ) ( not ( = ?auto_498288 ?auto_498296 ) ) ( not ( = ?auto_498288 ?auto_498297 ) ) ( not ( = ?auto_498288 ?auto_498298 ) ) ( not ( = ?auto_498288 ?auto_498299 ) ) ( not ( = ?auto_498289 ?auto_498290 ) ) ( not ( = ?auto_498289 ?auto_498291 ) ) ( not ( = ?auto_498289 ?auto_498292 ) ) ( not ( = ?auto_498289 ?auto_498293 ) ) ( not ( = ?auto_498289 ?auto_498294 ) ) ( not ( = ?auto_498289 ?auto_498295 ) ) ( not ( = ?auto_498289 ?auto_498296 ) ) ( not ( = ?auto_498289 ?auto_498297 ) ) ( not ( = ?auto_498289 ?auto_498298 ) ) ( not ( = ?auto_498289 ?auto_498299 ) ) ( not ( = ?auto_498290 ?auto_498291 ) ) ( not ( = ?auto_498290 ?auto_498292 ) ) ( not ( = ?auto_498290 ?auto_498293 ) ) ( not ( = ?auto_498290 ?auto_498294 ) ) ( not ( = ?auto_498290 ?auto_498295 ) ) ( not ( = ?auto_498290 ?auto_498296 ) ) ( not ( = ?auto_498290 ?auto_498297 ) ) ( not ( = ?auto_498290 ?auto_498298 ) ) ( not ( = ?auto_498290 ?auto_498299 ) ) ( not ( = ?auto_498291 ?auto_498292 ) ) ( not ( = ?auto_498291 ?auto_498293 ) ) ( not ( = ?auto_498291 ?auto_498294 ) ) ( not ( = ?auto_498291 ?auto_498295 ) ) ( not ( = ?auto_498291 ?auto_498296 ) ) ( not ( = ?auto_498291 ?auto_498297 ) ) ( not ( = ?auto_498291 ?auto_498298 ) ) ( not ( = ?auto_498291 ?auto_498299 ) ) ( not ( = ?auto_498292 ?auto_498293 ) ) ( not ( = ?auto_498292 ?auto_498294 ) ) ( not ( = ?auto_498292 ?auto_498295 ) ) ( not ( = ?auto_498292 ?auto_498296 ) ) ( not ( = ?auto_498292 ?auto_498297 ) ) ( not ( = ?auto_498292 ?auto_498298 ) ) ( not ( = ?auto_498292 ?auto_498299 ) ) ( not ( = ?auto_498293 ?auto_498294 ) ) ( not ( = ?auto_498293 ?auto_498295 ) ) ( not ( = ?auto_498293 ?auto_498296 ) ) ( not ( = ?auto_498293 ?auto_498297 ) ) ( not ( = ?auto_498293 ?auto_498298 ) ) ( not ( = ?auto_498293 ?auto_498299 ) ) ( not ( = ?auto_498294 ?auto_498295 ) ) ( not ( = ?auto_498294 ?auto_498296 ) ) ( not ( = ?auto_498294 ?auto_498297 ) ) ( not ( = ?auto_498294 ?auto_498298 ) ) ( not ( = ?auto_498294 ?auto_498299 ) ) ( not ( = ?auto_498295 ?auto_498296 ) ) ( not ( = ?auto_498295 ?auto_498297 ) ) ( not ( = ?auto_498295 ?auto_498298 ) ) ( not ( = ?auto_498295 ?auto_498299 ) ) ( not ( = ?auto_498296 ?auto_498297 ) ) ( not ( = ?auto_498296 ?auto_498298 ) ) ( not ( = ?auto_498296 ?auto_498299 ) ) ( not ( = ?auto_498297 ?auto_498298 ) ) ( not ( = ?auto_498297 ?auto_498299 ) ) ( not ( = ?auto_498298 ?auto_498299 ) ) ( ON ?auto_498297 ?auto_498298 ) ( ON ?auto_498296 ?auto_498297 ) ( ON ?auto_498295 ?auto_498296 ) ( ON ?auto_498294 ?auto_498295 ) ( ON ?auto_498293 ?auto_498294 ) ( ON ?auto_498292 ?auto_498293 ) ( CLEAR ?auto_498290 ) ( ON ?auto_498291 ?auto_498292 ) ( CLEAR ?auto_498291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_498288 ?auto_498289 ?auto_498290 ?auto_498291 )
      ( MAKE-11PILE ?auto_498288 ?auto_498289 ?auto_498290 ?auto_498291 ?auto_498292 ?auto_498293 ?auto_498294 ?auto_498295 ?auto_498296 ?auto_498297 ?auto_498298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498334 - BLOCK
      ?auto_498335 - BLOCK
      ?auto_498336 - BLOCK
      ?auto_498337 - BLOCK
      ?auto_498338 - BLOCK
      ?auto_498339 - BLOCK
      ?auto_498340 - BLOCK
      ?auto_498341 - BLOCK
      ?auto_498342 - BLOCK
      ?auto_498343 - BLOCK
      ?auto_498344 - BLOCK
    )
    :vars
    (
      ?auto_498345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498344 ?auto_498345 ) ( ON-TABLE ?auto_498334 ) ( ON ?auto_498335 ?auto_498334 ) ( not ( = ?auto_498334 ?auto_498335 ) ) ( not ( = ?auto_498334 ?auto_498336 ) ) ( not ( = ?auto_498334 ?auto_498337 ) ) ( not ( = ?auto_498334 ?auto_498338 ) ) ( not ( = ?auto_498334 ?auto_498339 ) ) ( not ( = ?auto_498334 ?auto_498340 ) ) ( not ( = ?auto_498334 ?auto_498341 ) ) ( not ( = ?auto_498334 ?auto_498342 ) ) ( not ( = ?auto_498334 ?auto_498343 ) ) ( not ( = ?auto_498334 ?auto_498344 ) ) ( not ( = ?auto_498334 ?auto_498345 ) ) ( not ( = ?auto_498335 ?auto_498336 ) ) ( not ( = ?auto_498335 ?auto_498337 ) ) ( not ( = ?auto_498335 ?auto_498338 ) ) ( not ( = ?auto_498335 ?auto_498339 ) ) ( not ( = ?auto_498335 ?auto_498340 ) ) ( not ( = ?auto_498335 ?auto_498341 ) ) ( not ( = ?auto_498335 ?auto_498342 ) ) ( not ( = ?auto_498335 ?auto_498343 ) ) ( not ( = ?auto_498335 ?auto_498344 ) ) ( not ( = ?auto_498335 ?auto_498345 ) ) ( not ( = ?auto_498336 ?auto_498337 ) ) ( not ( = ?auto_498336 ?auto_498338 ) ) ( not ( = ?auto_498336 ?auto_498339 ) ) ( not ( = ?auto_498336 ?auto_498340 ) ) ( not ( = ?auto_498336 ?auto_498341 ) ) ( not ( = ?auto_498336 ?auto_498342 ) ) ( not ( = ?auto_498336 ?auto_498343 ) ) ( not ( = ?auto_498336 ?auto_498344 ) ) ( not ( = ?auto_498336 ?auto_498345 ) ) ( not ( = ?auto_498337 ?auto_498338 ) ) ( not ( = ?auto_498337 ?auto_498339 ) ) ( not ( = ?auto_498337 ?auto_498340 ) ) ( not ( = ?auto_498337 ?auto_498341 ) ) ( not ( = ?auto_498337 ?auto_498342 ) ) ( not ( = ?auto_498337 ?auto_498343 ) ) ( not ( = ?auto_498337 ?auto_498344 ) ) ( not ( = ?auto_498337 ?auto_498345 ) ) ( not ( = ?auto_498338 ?auto_498339 ) ) ( not ( = ?auto_498338 ?auto_498340 ) ) ( not ( = ?auto_498338 ?auto_498341 ) ) ( not ( = ?auto_498338 ?auto_498342 ) ) ( not ( = ?auto_498338 ?auto_498343 ) ) ( not ( = ?auto_498338 ?auto_498344 ) ) ( not ( = ?auto_498338 ?auto_498345 ) ) ( not ( = ?auto_498339 ?auto_498340 ) ) ( not ( = ?auto_498339 ?auto_498341 ) ) ( not ( = ?auto_498339 ?auto_498342 ) ) ( not ( = ?auto_498339 ?auto_498343 ) ) ( not ( = ?auto_498339 ?auto_498344 ) ) ( not ( = ?auto_498339 ?auto_498345 ) ) ( not ( = ?auto_498340 ?auto_498341 ) ) ( not ( = ?auto_498340 ?auto_498342 ) ) ( not ( = ?auto_498340 ?auto_498343 ) ) ( not ( = ?auto_498340 ?auto_498344 ) ) ( not ( = ?auto_498340 ?auto_498345 ) ) ( not ( = ?auto_498341 ?auto_498342 ) ) ( not ( = ?auto_498341 ?auto_498343 ) ) ( not ( = ?auto_498341 ?auto_498344 ) ) ( not ( = ?auto_498341 ?auto_498345 ) ) ( not ( = ?auto_498342 ?auto_498343 ) ) ( not ( = ?auto_498342 ?auto_498344 ) ) ( not ( = ?auto_498342 ?auto_498345 ) ) ( not ( = ?auto_498343 ?auto_498344 ) ) ( not ( = ?auto_498343 ?auto_498345 ) ) ( not ( = ?auto_498344 ?auto_498345 ) ) ( ON ?auto_498343 ?auto_498344 ) ( ON ?auto_498342 ?auto_498343 ) ( ON ?auto_498341 ?auto_498342 ) ( ON ?auto_498340 ?auto_498341 ) ( ON ?auto_498339 ?auto_498340 ) ( ON ?auto_498338 ?auto_498339 ) ( ON ?auto_498337 ?auto_498338 ) ( CLEAR ?auto_498335 ) ( ON ?auto_498336 ?auto_498337 ) ( CLEAR ?auto_498336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_498334 ?auto_498335 ?auto_498336 )
      ( MAKE-11PILE ?auto_498334 ?auto_498335 ?auto_498336 ?auto_498337 ?auto_498338 ?auto_498339 ?auto_498340 ?auto_498341 ?auto_498342 ?auto_498343 ?auto_498344 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498380 - BLOCK
      ?auto_498381 - BLOCK
      ?auto_498382 - BLOCK
      ?auto_498383 - BLOCK
      ?auto_498384 - BLOCK
      ?auto_498385 - BLOCK
      ?auto_498386 - BLOCK
      ?auto_498387 - BLOCK
      ?auto_498388 - BLOCK
      ?auto_498389 - BLOCK
      ?auto_498390 - BLOCK
    )
    :vars
    (
      ?auto_498391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498390 ?auto_498391 ) ( ON-TABLE ?auto_498380 ) ( not ( = ?auto_498380 ?auto_498381 ) ) ( not ( = ?auto_498380 ?auto_498382 ) ) ( not ( = ?auto_498380 ?auto_498383 ) ) ( not ( = ?auto_498380 ?auto_498384 ) ) ( not ( = ?auto_498380 ?auto_498385 ) ) ( not ( = ?auto_498380 ?auto_498386 ) ) ( not ( = ?auto_498380 ?auto_498387 ) ) ( not ( = ?auto_498380 ?auto_498388 ) ) ( not ( = ?auto_498380 ?auto_498389 ) ) ( not ( = ?auto_498380 ?auto_498390 ) ) ( not ( = ?auto_498380 ?auto_498391 ) ) ( not ( = ?auto_498381 ?auto_498382 ) ) ( not ( = ?auto_498381 ?auto_498383 ) ) ( not ( = ?auto_498381 ?auto_498384 ) ) ( not ( = ?auto_498381 ?auto_498385 ) ) ( not ( = ?auto_498381 ?auto_498386 ) ) ( not ( = ?auto_498381 ?auto_498387 ) ) ( not ( = ?auto_498381 ?auto_498388 ) ) ( not ( = ?auto_498381 ?auto_498389 ) ) ( not ( = ?auto_498381 ?auto_498390 ) ) ( not ( = ?auto_498381 ?auto_498391 ) ) ( not ( = ?auto_498382 ?auto_498383 ) ) ( not ( = ?auto_498382 ?auto_498384 ) ) ( not ( = ?auto_498382 ?auto_498385 ) ) ( not ( = ?auto_498382 ?auto_498386 ) ) ( not ( = ?auto_498382 ?auto_498387 ) ) ( not ( = ?auto_498382 ?auto_498388 ) ) ( not ( = ?auto_498382 ?auto_498389 ) ) ( not ( = ?auto_498382 ?auto_498390 ) ) ( not ( = ?auto_498382 ?auto_498391 ) ) ( not ( = ?auto_498383 ?auto_498384 ) ) ( not ( = ?auto_498383 ?auto_498385 ) ) ( not ( = ?auto_498383 ?auto_498386 ) ) ( not ( = ?auto_498383 ?auto_498387 ) ) ( not ( = ?auto_498383 ?auto_498388 ) ) ( not ( = ?auto_498383 ?auto_498389 ) ) ( not ( = ?auto_498383 ?auto_498390 ) ) ( not ( = ?auto_498383 ?auto_498391 ) ) ( not ( = ?auto_498384 ?auto_498385 ) ) ( not ( = ?auto_498384 ?auto_498386 ) ) ( not ( = ?auto_498384 ?auto_498387 ) ) ( not ( = ?auto_498384 ?auto_498388 ) ) ( not ( = ?auto_498384 ?auto_498389 ) ) ( not ( = ?auto_498384 ?auto_498390 ) ) ( not ( = ?auto_498384 ?auto_498391 ) ) ( not ( = ?auto_498385 ?auto_498386 ) ) ( not ( = ?auto_498385 ?auto_498387 ) ) ( not ( = ?auto_498385 ?auto_498388 ) ) ( not ( = ?auto_498385 ?auto_498389 ) ) ( not ( = ?auto_498385 ?auto_498390 ) ) ( not ( = ?auto_498385 ?auto_498391 ) ) ( not ( = ?auto_498386 ?auto_498387 ) ) ( not ( = ?auto_498386 ?auto_498388 ) ) ( not ( = ?auto_498386 ?auto_498389 ) ) ( not ( = ?auto_498386 ?auto_498390 ) ) ( not ( = ?auto_498386 ?auto_498391 ) ) ( not ( = ?auto_498387 ?auto_498388 ) ) ( not ( = ?auto_498387 ?auto_498389 ) ) ( not ( = ?auto_498387 ?auto_498390 ) ) ( not ( = ?auto_498387 ?auto_498391 ) ) ( not ( = ?auto_498388 ?auto_498389 ) ) ( not ( = ?auto_498388 ?auto_498390 ) ) ( not ( = ?auto_498388 ?auto_498391 ) ) ( not ( = ?auto_498389 ?auto_498390 ) ) ( not ( = ?auto_498389 ?auto_498391 ) ) ( not ( = ?auto_498390 ?auto_498391 ) ) ( ON ?auto_498389 ?auto_498390 ) ( ON ?auto_498388 ?auto_498389 ) ( ON ?auto_498387 ?auto_498388 ) ( ON ?auto_498386 ?auto_498387 ) ( ON ?auto_498385 ?auto_498386 ) ( ON ?auto_498384 ?auto_498385 ) ( ON ?auto_498383 ?auto_498384 ) ( ON ?auto_498382 ?auto_498383 ) ( CLEAR ?auto_498380 ) ( ON ?auto_498381 ?auto_498382 ) ( CLEAR ?auto_498381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_498380 ?auto_498381 )
      ( MAKE-11PILE ?auto_498380 ?auto_498381 ?auto_498382 ?auto_498383 ?auto_498384 ?auto_498385 ?auto_498386 ?auto_498387 ?auto_498388 ?auto_498389 ?auto_498390 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_498426 - BLOCK
      ?auto_498427 - BLOCK
      ?auto_498428 - BLOCK
      ?auto_498429 - BLOCK
      ?auto_498430 - BLOCK
      ?auto_498431 - BLOCK
      ?auto_498432 - BLOCK
      ?auto_498433 - BLOCK
      ?auto_498434 - BLOCK
      ?auto_498435 - BLOCK
      ?auto_498436 - BLOCK
    )
    :vars
    (
      ?auto_498437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498436 ?auto_498437 ) ( not ( = ?auto_498426 ?auto_498427 ) ) ( not ( = ?auto_498426 ?auto_498428 ) ) ( not ( = ?auto_498426 ?auto_498429 ) ) ( not ( = ?auto_498426 ?auto_498430 ) ) ( not ( = ?auto_498426 ?auto_498431 ) ) ( not ( = ?auto_498426 ?auto_498432 ) ) ( not ( = ?auto_498426 ?auto_498433 ) ) ( not ( = ?auto_498426 ?auto_498434 ) ) ( not ( = ?auto_498426 ?auto_498435 ) ) ( not ( = ?auto_498426 ?auto_498436 ) ) ( not ( = ?auto_498426 ?auto_498437 ) ) ( not ( = ?auto_498427 ?auto_498428 ) ) ( not ( = ?auto_498427 ?auto_498429 ) ) ( not ( = ?auto_498427 ?auto_498430 ) ) ( not ( = ?auto_498427 ?auto_498431 ) ) ( not ( = ?auto_498427 ?auto_498432 ) ) ( not ( = ?auto_498427 ?auto_498433 ) ) ( not ( = ?auto_498427 ?auto_498434 ) ) ( not ( = ?auto_498427 ?auto_498435 ) ) ( not ( = ?auto_498427 ?auto_498436 ) ) ( not ( = ?auto_498427 ?auto_498437 ) ) ( not ( = ?auto_498428 ?auto_498429 ) ) ( not ( = ?auto_498428 ?auto_498430 ) ) ( not ( = ?auto_498428 ?auto_498431 ) ) ( not ( = ?auto_498428 ?auto_498432 ) ) ( not ( = ?auto_498428 ?auto_498433 ) ) ( not ( = ?auto_498428 ?auto_498434 ) ) ( not ( = ?auto_498428 ?auto_498435 ) ) ( not ( = ?auto_498428 ?auto_498436 ) ) ( not ( = ?auto_498428 ?auto_498437 ) ) ( not ( = ?auto_498429 ?auto_498430 ) ) ( not ( = ?auto_498429 ?auto_498431 ) ) ( not ( = ?auto_498429 ?auto_498432 ) ) ( not ( = ?auto_498429 ?auto_498433 ) ) ( not ( = ?auto_498429 ?auto_498434 ) ) ( not ( = ?auto_498429 ?auto_498435 ) ) ( not ( = ?auto_498429 ?auto_498436 ) ) ( not ( = ?auto_498429 ?auto_498437 ) ) ( not ( = ?auto_498430 ?auto_498431 ) ) ( not ( = ?auto_498430 ?auto_498432 ) ) ( not ( = ?auto_498430 ?auto_498433 ) ) ( not ( = ?auto_498430 ?auto_498434 ) ) ( not ( = ?auto_498430 ?auto_498435 ) ) ( not ( = ?auto_498430 ?auto_498436 ) ) ( not ( = ?auto_498430 ?auto_498437 ) ) ( not ( = ?auto_498431 ?auto_498432 ) ) ( not ( = ?auto_498431 ?auto_498433 ) ) ( not ( = ?auto_498431 ?auto_498434 ) ) ( not ( = ?auto_498431 ?auto_498435 ) ) ( not ( = ?auto_498431 ?auto_498436 ) ) ( not ( = ?auto_498431 ?auto_498437 ) ) ( not ( = ?auto_498432 ?auto_498433 ) ) ( not ( = ?auto_498432 ?auto_498434 ) ) ( not ( = ?auto_498432 ?auto_498435 ) ) ( not ( = ?auto_498432 ?auto_498436 ) ) ( not ( = ?auto_498432 ?auto_498437 ) ) ( not ( = ?auto_498433 ?auto_498434 ) ) ( not ( = ?auto_498433 ?auto_498435 ) ) ( not ( = ?auto_498433 ?auto_498436 ) ) ( not ( = ?auto_498433 ?auto_498437 ) ) ( not ( = ?auto_498434 ?auto_498435 ) ) ( not ( = ?auto_498434 ?auto_498436 ) ) ( not ( = ?auto_498434 ?auto_498437 ) ) ( not ( = ?auto_498435 ?auto_498436 ) ) ( not ( = ?auto_498435 ?auto_498437 ) ) ( not ( = ?auto_498436 ?auto_498437 ) ) ( ON ?auto_498435 ?auto_498436 ) ( ON ?auto_498434 ?auto_498435 ) ( ON ?auto_498433 ?auto_498434 ) ( ON ?auto_498432 ?auto_498433 ) ( ON ?auto_498431 ?auto_498432 ) ( ON ?auto_498430 ?auto_498431 ) ( ON ?auto_498429 ?auto_498430 ) ( ON ?auto_498428 ?auto_498429 ) ( ON ?auto_498427 ?auto_498428 ) ( ON ?auto_498426 ?auto_498427 ) ( CLEAR ?auto_498426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_498426 )
      ( MAKE-11PILE ?auto_498426 ?auto_498427 ?auto_498428 ?auto_498429 ?auto_498430 ?auto_498431 ?auto_498432 ?auto_498433 ?auto_498434 ?auto_498435 ?auto_498436 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498473 - BLOCK
      ?auto_498474 - BLOCK
      ?auto_498475 - BLOCK
      ?auto_498476 - BLOCK
      ?auto_498477 - BLOCK
      ?auto_498478 - BLOCK
      ?auto_498479 - BLOCK
      ?auto_498480 - BLOCK
      ?auto_498481 - BLOCK
      ?auto_498482 - BLOCK
      ?auto_498483 - BLOCK
      ?auto_498484 - BLOCK
    )
    :vars
    (
      ?auto_498485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_498483 ) ( ON ?auto_498484 ?auto_498485 ) ( CLEAR ?auto_498484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_498473 ) ( ON ?auto_498474 ?auto_498473 ) ( ON ?auto_498475 ?auto_498474 ) ( ON ?auto_498476 ?auto_498475 ) ( ON ?auto_498477 ?auto_498476 ) ( ON ?auto_498478 ?auto_498477 ) ( ON ?auto_498479 ?auto_498478 ) ( ON ?auto_498480 ?auto_498479 ) ( ON ?auto_498481 ?auto_498480 ) ( ON ?auto_498482 ?auto_498481 ) ( ON ?auto_498483 ?auto_498482 ) ( not ( = ?auto_498473 ?auto_498474 ) ) ( not ( = ?auto_498473 ?auto_498475 ) ) ( not ( = ?auto_498473 ?auto_498476 ) ) ( not ( = ?auto_498473 ?auto_498477 ) ) ( not ( = ?auto_498473 ?auto_498478 ) ) ( not ( = ?auto_498473 ?auto_498479 ) ) ( not ( = ?auto_498473 ?auto_498480 ) ) ( not ( = ?auto_498473 ?auto_498481 ) ) ( not ( = ?auto_498473 ?auto_498482 ) ) ( not ( = ?auto_498473 ?auto_498483 ) ) ( not ( = ?auto_498473 ?auto_498484 ) ) ( not ( = ?auto_498473 ?auto_498485 ) ) ( not ( = ?auto_498474 ?auto_498475 ) ) ( not ( = ?auto_498474 ?auto_498476 ) ) ( not ( = ?auto_498474 ?auto_498477 ) ) ( not ( = ?auto_498474 ?auto_498478 ) ) ( not ( = ?auto_498474 ?auto_498479 ) ) ( not ( = ?auto_498474 ?auto_498480 ) ) ( not ( = ?auto_498474 ?auto_498481 ) ) ( not ( = ?auto_498474 ?auto_498482 ) ) ( not ( = ?auto_498474 ?auto_498483 ) ) ( not ( = ?auto_498474 ?auto_498484 ) ) ( not ( = ?auto_498474 ?auto_498485 ) ) ( not ( = ?auto_498475 ?auto_498476 ) ) ( not ( = ?auto_498475 ?auto_498477 ) ) ( not ( = ?auto_498475 ?auto_498478 ) ) ( not ( = ?auto_498475 ?auto_498479 ) ) ( not ( = ?auto_498475 ?auto_498480 ) ) ( not ( = ?auto_498475 ?auto_498481 ) ) ( not ( = ?auto_498475 ?auto_498482 ) ) ( not ( = ?auto_498475 ?auto_498483 ) ) ( not ( = ?auto_498475 ?auto_498484 ) ) ( not ( = ?auto_498475 ?auto_498485 ) ) ( not ( = ?auto_498476 ?auto_498477 ) ) ( not ( = ?auto_498476 ?auto_498478 ) ) ( not ( = ?auto_498476 ?auto_498479 ) ) ( not ( = ?auto_498476 ?auto_498480 ) ) ( not ( = ?auto_498476 ?auto_498481 ) ) ( not ( = ?auto_498476 ?auto_498482 ) ) ( not ( = ?auto_498476 ?auto_498483 ) ) ( not ( = ?auto_498476 ?auto_498484 ) ) ( not ( = ?auto_498476 ?auto_498485 ) ) ( not ( = ?auto_498477 ?auto_498478 ) ) ( not ( = ?auto_498477 ?auto_498479 ) ) ( not ( = ?auto_498477 ?auto_498480 ) ) ( not ( = ?auto_498477 ?auto_498481 ) ) ( not ( = ?auto_498477 ?auto_498482 ) ) ( not ( = ?auto_498477 ?auto_498483 ) ) ( not ( = ?auto_498477 ?auto_498484 ) ) ( not ( = ?auto_498477 ?auto_498485 ) ) ( not ( = ?auto_498478 ?auto_498479 ) ) ( not ( = ?auto_498478 ?auto_498480 ) ) ( not ( = ?auto_498478 ?auto_498481 ) ) ( not ( = ?auto_498478 ?auto_498482 ) ) ( not ( = ?auto_498478 ?auto_498483 ) ) ( not ( = ?auto_498478 ?auto_498484 ) ) ( not ( = ?auto_498478 ?auto_498485 ) ) ( not ( = ?auto_498479 ?auto_498480 ) ) ( not ( = ?auto_498479 ?auto_498481 ) ) ( not ( = ?auto_498479 ?auto_498482 ) ) ( not ( = ?auto_498479 ?auto_498483 ) ) ( not ( = ?auto_498479 ?auto_498484 ) ) ( not ( = ?auto_498479 ?auto_498485 ) ) ( not ( = ?auto_498480 ?auto_498481 ) ) ( not ( = ?auto_498480 ?auto_498482 ) ) ( not ( = ?auto_498480 ?auto_498483 ) ) ( not ( = ?auto_498480 ?auto_498484 ) ) ( not ( = ?auto_498480 ?auto_498485 ) ) ( not ( = ?auto_498481 ?auto_498482 ) ) ( not ( = ?auto_498481 ?auto_498483 ) ) ( not ( = ?auto_498481 ?auto_498484 ) ) ( not ( = ?auto_498481 ?auto_498485 ) ) ( not ( = ?auto_498482 ?auto_498483 ) ) ( not ( = ?auto_498482 ?auto_498484 ) ) ( not ( = ?auto_498482 ?auto_498485 ) ) ( not ( = ?auto_498483 ?auto_498484 ) ) ( not ( = ?auto_498483 ?auto_498485 ) ) ( not ( = ?auto_498484 ?auto_498485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_498484 ?auto_498485 )
      ( !STACK ?auto_498484 ?auto_498483 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498523 - BLOCK
      ?auto_498524 - BLOCK
      ?auto_498525 - BLOCK
      ?auto_498526 - BLOCK
      ?auto_498527 - BLOCK
      ?auto_498528 - BLOCK
      ?auto_498529 - BLOCK
      ?auto_498530 - BLOCK
      ?auto_498531 - BLOCK
      ?auto_498532 - BLOCK
      ?auto_498533 - BLOCK
      ?auto_498534 - BLOCK
    )
    :vars
    (
      ?auto_498535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498534 ?auto_498535 ) ( ON-TABLE ?auto_498523 ) ( ON ?auto_498524 ?auto_498523 ) ( ON ?auto_498525 ?auto_498524 ) ( ON ?auto_498526 ?auto_498525 ) ( ON ?auto_498527 ?auto_498526 ) ( ON ?auto_498528 ?auto_498527 ) ( ON ?auto_498529 ?auto_498528 ) ( ON ?auto_498530 ?auto_498529 ) ( ON ?auto_498531 ?auto_498530 ) ( ON ?auto_498532 ?auto_498531 ) ( not ( = ?auto_498523 ?auto_498524 ) ) ( not ( = ?auto_498523 ?auto_498525 ) ) ( not ( = ?auto_498523 ?auto_498526 ) ) ( not ( = ?auto_498523 ?auto_498527 ) ) ( not ( = ?auto_498523 ?auto_498528 ) ) ( not ( = ?auto_498523 ?auto_498529 ) ) ( not ( = ?auto_498523 ?auto_498530 ) ) ( not ( = ?auto_498523 ?auto_498531 ) ) ( not ( = ?auto_498523 ?auto_498532 ) ) ( not ( = ?auto_498523 ?auto_498533 ) ) ( not ( = ?auto_498523 ?auto_498534 ) ) ( not ( = ?auto_498523 ?auto_498535 ) ) ( not ( = ?auto_498524 ?auto_498525 ) ) ( not ( = ?auto_498524 ?auto_498526 ) ) ( not ( = ?auto_498524 ?auto_498527 ) ) ( not ( = ?auto_498524 ?auto_498528 ) ) ( not ( = ?auto_498524 ?auto_498529 ) ) ( not ( = ?auto_498524 ?auto_498530 ) ) ( not ( = ?auto_498524 ?auto_498531 ) ) ( not ( = ?auto_498524 ?auto_498532 ) ) ( not ( = ?auto_498524 ?auto_498533 ) ) ( not ( = ?auto_498524 ?auto_498534 ) ) ( not ( = ?auto_498524 ?auto_498535 ) ) ( not ( = ?auto_498525 ?auto_498526 ) ) ( not ( = ?auto_498525 ?auto_498527 ) ) ( not ( = ?auto_498525 ?auto_498528 ) ) ( not ( = ?auto_498525 ?auto_498529 ) ) ( not ( = ?auto_498525 ?auto_498530 ) ) ( not ( = ?auto_498525 ?auto_498531 ) ) ( not ( = ?auto_498525 ?auto_498532 ) ) ( not ( = ?auto_498525 ?auto_498533 ) ) ( not ( = ?auto_498525 ?auto_498534 ) ) ( not ( = ?auto_498525 ?auto_498535 ) ) ( not ( = ?auto_498526 ?auto_498527 ) ) ( not ( = ?auto_498526 ?auto_498528 ) ) ( not ( = ?auto_498526 ?auto_498529 ) ) ( not ( = ?auto_498526 ?auto_498530 ) ) ( not ( = ?auto_498526 ?auto_498531 ) ) ( not ( = ?auto_498526 ?auto_498532 ) ) ( not ( = ?auto_498526 ?auto_498533 ) ) ( not ( = ?auto_498526 ?auto_498534 ) ) ( not ( = ?auto_498526 ?auto_498535 ) ) ( not ( = ?auto_498527 ?auto_498528 ) ) ( not ( = ?auto_498527 ?auto_498529 ) ) ( not ( = ?auto_498527 ?auto_498530 ) ) ( not ( = ?auto_498527 ?auto_498531 ) ) ( not ( = ?auto_498527 ?auto_498532 ) ) ( not ( = ?auto_498527 ?auto_498533 ) ) ( not ( = ?auto_498527 ?auto_498534 ) ) ( not ( = ?auto_498527 ?auto_498535 ) ) ( not ( = ?auto_498528 ?auto_498529 ) ) ( not ( = ?auto_498528 ?auto_498530 ) ) ( not ( = ?auto_498528 ?auto_498531 ) ) ( not ( = ?auto_498528 ?auto_498532 ) ) ( not ( = ?auto_498528 ?auto_498533 ) ) ( not ( = ?auto_498528 ?auto_498534 ) ) ( not ( = ?auto_498528 ?auto_498535 ) ) ( not ( = ?auto_498529 ?auto_498530 ) ) ( not ( = ?auto_498529 ?auto_498531 ) ) ( not ( = ?auto_498529 ?auto_498532 ) ) ( not ( = ?auto_498529 ?auto_498533 ) ) ( not ( = ?auto_498529 ?auto_498534 ) ) ( not ( = ?auto_498529 ?auto_498535 ) ) ( not ( = ?auto_498530 ?auto_498531 ) ) ( not ( = ?auto_498530 ?auto_498532 ) ) ( not ( = ?auto_498530 ?auto_498533 ) ) ( not ( = ?auto_498530 ?auto_498534 ) ) ( not ( = ?auto_498530 ?auto_498535 ) ) ( not ( = ?auto_498531 ?auto_498532 ) ) ( not ( = ?auto_498531 ?auto_498533 ) ) ( not ( = ?auto_498531 ?auto_498534 ) ) ( not ( = ?auto_498531 ?auto_498535 ) ) ( not ( = ?auto_498532 ?auto_498533 ) ) ( not ( = ?auto_498532 ?auto_498534 ) ) ( not ( = ?auto_498532 ?auto_498535 ) ) ( not ( = ?auto_498533 ?auto_498534 ) ) ( not ( = ?auto_498533 ?auto_498535 ) ) ( not ( = ?auto_498534 ?auto_498535 ) ) ( CLEAR ?auto_498532 ) ( ON ?auto_498533 ?auto_498534 ) ( CLEAR ?auto_498533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_498523 ?auto_498524 ?auto_498525 ?auto_498526 ?auto_498527 ?auto_498528 ?auto_498529 ?auto_498530 ?auto_498531 ?auto_498532 ?auto_498533 )
      ( MAKE-12PILE ?auto_498523 ?auto_498524 ?auto_498525 ?auto_498526 ?auto_498527 ?auto_498528 ?auto_498529 ?auto_498530 ?auto_498531 ?auto_498532 ?auto_498533 ?auto_498534 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498573 - BLOCK
      ?auto_498574 - BLOCK
      ?auto_498575 - BLOCK
      ?auto_498576 - BLOCK
      ?auto_498577 - BLOCK
      ?auto_498578 - BLOCK
      ?auto_498579 - BLOCK
      ?auto_498580 - BLOCK
      ?auto_498581 - BLOCK
      ?auto_498582 - BLOCK
      ?auto_498583 - BLOCK
      ?auto_498584 - BLOCK
    )
    :vars
    (
      ?auto_498585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498584 ?auto_498585 ) ( ON-TABLE ?auto_498573 ) ( ON ?auto_498574 ?auto_498573 ) ( ON ?auto_498575 ?auto_498574 ) ( ON ?auto_498576 ?auto_498575 ) ( ON ?auto_498577 ?auto_498576 ) ( ON ?auto_498578 ?auto_498577 ) ( ON ?auto_498579 ?auto_498578 ) ( ON ?auto_498580 ?auto_498579 ) ( ON ?auto_498581 ?auto_498580 ) ( not ( = ?auto_498573 ?auto_498574 ) ) ( not ( = ?auto_498573 ?auto_498575 ) ) ( not ( = ?auto_498573 ?auto_498576 ) ) ( not ( = ?auto_498573 ?auto_498577 ) ) ( not ( = ?auto_498573 ?auto_498578 ) ) ( not ( = ?auto_498573 ?auto_498579 ) ) ( not ( = ?auto_498573 ?auto_498580 ) ) ( not ( = ?auto_498573 ?auto_498581 ) ) ( not ( = ?auto_498573 ?auto_498582 ) ) ( not ( = ?auto_498573 ?auto_498583 ) ) ( not ( = ?auto_498573 ?auto_498584 ) ) ( not ( = ?auto_498573 ?auto_498585 ) ) ( not ( = ?auto_498574 ?auto_498575 ) ) ( not ( = ?auto_498574 ?auto_498576 ) ) ( not ( = ?auto_498574 ?auto_498577 ) ) ( not ( = ?auto_498574 ?auto_498578 ) ) ( not ( = ?auto_498574 ?auto_498579 ) ) ( not ( = ?auto_498574 ?auto_498580 ) ) ( not ( = ?auto_498574 ?auto_498581 ) ) ( not ( = ?auto_498574 ?auto_498582 ) ) ( not ( = ?auto_498574 ?auto_498583 ) ) ( not ( = ?auto_498574 ?auto_498584 ) ) ( not ( = ?auto_498574 ?auto_498585 ) ) ( not ( = ?auto_498575 ?auto_498576 ) ) ( not ( = ?auto_498575 ?auto_498577 ) ) ( not ( = ?auto_498575 ?auto_498578 ) ) ( not ( = ?auto_498575 ?auto_498579 ) ) ( not ( = ?auto_498575 ?auto_498580 ) ) ( not ( = ?auto_498575 ?auto_498581 ) ) ( not ( = ?auto_498575 ?auto_498582 ) ) ( not ( = ?auto_498575 ?auto_498583 ) ) ( not ( = ?auto_498575 ?auto_498584 ) ) ( not ( = ?auto_498575 ?auto_498585 ) ) ( not ( = ?auto_498576 ?auto_498577 ) ) ( not ( = ?auto_498576 ?auto_498578 ) ) ( not ( = ?auto_498576 ?auto_498579 ) ) ( not ( = ?auto_498576 ?auto_498580 ) ) ( not ( = ?auto_498576 ?auto_498581 ) ) ( not ( = ?auto_498576 ?auto_498582 ) ) ( not ( = ?auto_498576 ?auto_498583 ) ) ( not ( = ?auto_498576 ?auto_498584 ) ) ( not ( = ?auto_498576 ?auto_498585 ) ) ( not ( = ?auto_498577 ?auto_498578 ) ) ( not ( = ?auto_498577 ?auto_498579 ) ) ( not ( = ?auto_498577 ?auto_498580 ) ) ( not ( = ?auto_498577 ?auto_498581 ) ) ( not ( = ?auto_498577 ?auto_498582 ) ) ( not ( = ?auto_498577 ?auto_498583 ) ) ( not ( = ?auto_498577 ?auto_498584 ) ) ( not ( = ?auto_498577 ?auto_498585 ) ) ( not ( = ?auto_498578 ?auto_498579 ) ) ( not ( = ?auto_498578 ?auto_498580 ) ) ( not ( = ?auto_498578 ?auto_498581 ) ) ( not ( = ?auto_498578 ?auto_498582 ) ) ( not ( = ?auto_498578 ?auto_498583 ) ) ( not ( = ?auto_498578 ?auto_498584 ) ) ( not ( = ?auto_498578 ?auto_498585 ) ) ( not ( = ?auto_498579 ?auto_498580 ) ) ( not ( = ?auto_498579 ?auto_498581 ) ) ( not ( = ?auto_498579 ?auto_498582 ) ) ( not ( = ?auto_498579 ?auto_498583 ) ) ( not ( = ?auto_498579 ?auto_498584 ) ) ( not ( = ?auto_498579 ?auto_498585 ) ) ( not ( = ?auto_498580 ?auto_498581 ) ) ( not ( = ?auto_498580 ?auto_498582 ) ) ( not ( = ?auto_498580 ?auto_498583 ) ) ( not ( = ?auto_498580 ?auto_498584 ) ) ( not ( = ?auto_498580 ?auto_498585 ) ) ( not ( = ?auto_498581 ?auto_498582 ) ) ( not ( = ?auto_498581 ?auto_498583 ) ) ( not ( = ?auto_498581 ?auto_498584 ) ) ( not ( = ?auto_498581 ?auto_498585 ) ) ( not ( = ?auto_498582 ?auto_498583 ) ) ( not ( = ?auto_498582 ?auto_498584 ) ) ( not ( = ?auto_498582 ?auto_498585 ) ) ( not ( = ?auto_498583 ?auto_498584 ) ) ( not ( = ?auto_498583 ?auto_498585 ) ) ( not ( = ?auto_498584 ?auto_498585 ) ) ( ON ?auto_498583 ?auto_498584 ) ( CLEAR ?auto_498581 ) ( ON ?auto_498582 ?auto_498583 ) ( CLEAR ?auto_498582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_498573 ?auto_498574 ?auto_498575 ?auto_498576 ?auto_498577 ?auto_498578 ?auto_498579 ?auto_498580 ?auto_498581 ?auto_498582 )
      ( MAKE-12PILE ?auto_498573 ?auto_498574 ?auto_498575 ?auto_498576 ?auto_498577 ?auto_498578 ?auto_498579 ?auto_498580 ?auto_498581 ?auto_498582 ?auto_498583 ?auto_498584 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498623 - BLOCK
      ?auto_498624 - BLOCK
      ?auto_498625 - BLOCK
      ?auto_498626 - BLOCK
      ?auto_498627 - BLOCK
      ?auto_498628 - BLOCK
      ?auto_498629 - BLOCK
      ?auto_498630 - BLOCK
      ?auto_498631 - BLOCK
      ?auto_498632 - BLOCK
      ?auto_498633 - BLOCK
      ?auto_498634 - BLOCK
    )
    :vars
    (
      ?auto_498635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498634 ?auto_498635 ) ( ON-TABLE ?auto_498623 ) ( ON ?auto_498624 ?auto_498623 ) ( ON ?auto_498625 ?auto_498624 ) ( ON ?auto_498626 ?auto_498625 ) ( ON ?auto_498627 ?auto_498626 ) ( ON ?auto_498628 ?auto_498627 ) ( ON ?auto_498629 ?auto_498628 ) ( ON ?auto_498630 ?auto_498629 ) ( not ( = ?auto_498623 ?auto_498624 ) ) ( not ( = ?auto_498623 ?auto_498625 ) ) ( not ( = ?auto_498623 ?auto_498626 ) ) ( not ( = ?auto_498623 ?auto_498627 ) ) ( not ( = ?auto_498623 ?auto_498628 ) ) ( not ( = ?auto_498623 ?auto_498629 ) ) ( not ( = ?auto_498623 ?auto_498630 ) ) ( not ( = ?auto_498623 ?auto_498631 ) ) ( not ( = ?auto_498623 ?auto_498632 ) ) ( not ( = ?auto_498623 ?auto_498633 ) ) ( not ( = ?auto_498623 ?auto_498634 ) ) ( not ( = ?auto_498623 ?auto_498635 ) ) ( not ( = ?auto_498624 ?auto_498625 ) ) ( not ( = ?auto_498624 ?auto_498626 ) ) ( not ( = ?auto_498624 ?auto_498627 ) ) ( not ( = ?auto_498624 ?auto_498628 ) ) ( not ( = ?auto_498624 ?auto_498629 ) ) ( not ( = ?auto_498624 ?auto_498630 ) ) ( not ( = ?auto_498624 ?auto_498631 ) ) ( not ( = ?auto_498624 ?auto_498632 ) ) ( not ( = ?auto_498624 ?auto_498633 ) ) ( not ( = ?auto_498624 ?auto_498634 ) ) ( not ( = ?auto_498624 ?auto_498635 ) ) ( not ( = ?auto_498625 ?auto_498626 ) ) ( not ( = ?auto_498625 ?auto_498627 ) ) ( not ( = ?auto_498625 ?auto_498628 ) ) ( not ( = ?auto_498625 ?auto_498629 ) ) ( not ( = ?auto_498625 ?auto_498630 ) ) ( not ( = ?auto_498625 ?auto_498631 ) ) ( not ( = ?auto_498625 ?auto_498632 ) ) ( not ( = ?auto_498625 ?auto_498633 ) ) ( not ( = ?auto_498625 ?auto_498634 ) ) ( not ( = ?auto_498625 ?auto_498635 ) ) ( not ( = ?auto_498626 ?auto_498627 ) ) ( not ( = ?auto_498626 ?auto_498628 ) ) ( not ( = ?auto_498626 ?auto_498629 ) ) ( not ( = ?auto_498626 ?auto_498630 ) ) ( not ( = ?auto_498626 ?auto_498631 ) ) ( not ( = ?auto_498626 ?auto_498632 ) ) ( not ( = ?auto_498626 ?auto_498633 ) ) ( not ( = ?auto_498626 ?auto_498634 ) ) ( not ( = ?auto_498626 ?auto_498635 ) ) ( not ( = ?auto_498627 ?auto_498628 ) ) ( not ( = ?auto_498627 ?auto_498629 ) ) ( not ( = ?auto_498627 ?auto_498630 ) ) ( not ( = ?auto_498627 ?auto_498631 ) ) ( not ( = ?auto_498627 ?auto_498632 ) ) ( not ( = ?auto_498627 ?auto_498633 ) ) ( not ( = ?auto_498627 ?auto_498634 ) ) ( not ( = ?auto_498627 ?auto_498635 ) ) ( not ( = ?auto_498628 ?auto_498629 ) ) ( not ( = ?auto_498628 ?auto_498630 ) ) ( not ( = ?auto_498628 ?auto_498631 ) ) ( not ( = ?auto_498628 ?auto_498632 ) ) ( not ( = ?auto_498628 ?auto_498633 ) ) ( not ( = ?auto_498628 ?auto_498634 ) ) ( not ( = ?auto_498628 ?auto_498635 ) ) ( not ( = ?auto_498629 ?auto_498630 ) ) ( not ( = ?auto_498629 ?auto_498631 ) ) ( not ( = ?auto_498629 ?auto_498632 ) ) ( not ( = ?auto_498629 ?auto_498633 ) ) ( not ( = ?auto_498629 ?auto_498634 ) ) ( not ( = ?auto_498629 ?auto_498635 ) ) ( not ( = ?auto_498630 ?auto_498631 ) ) ( not ( = ?auto_498630 ?auto_498632 ) ) ( not ( = ?auto_498630 ?auto_498633 ) ) ( not ( = ?auto_498630 ?auto_498634 ) ) ( not ( = ?auto_498630 ?auto_498635 ) ) ( not ( = ?auto_498631 ?auto_498632 ) ) ( not ( = ?auto_498631 ?auto_498633 ) ) ( not ( = ?auto_498631 ?auto_498634 ) ) ( not ( = ?auto_498631 ?auto_498635 ) ) ( not ( = ?auto_498632 ?auto_498633 ) ) ( not ( = ?auto_498632 ?auto_498634 ) ) ( not ( = ?auto_498632 ?auto_498635 ) ) ( not ( = ?auto_498633 ?auto_498634 ) ) ( not ( = ?auto_498633 ?auto_498635 ) ) ( not ( = ?auto_498634 ?auto_498635 ) ) ( ON ?auto_498633 ?auto_498634 ) ( ON ?auto_498632 ?auto_498633 ) ( CLEAR ?auto_498630 ) ( ON ?auto_498631 ?auto_498632 ) ( CLEAR ?auto_498631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_498623 ?auto_498624 ?auto_498625 ?auto_498626 ?auto_498627 ?auto_498628 ?auto_498629 ?auto_498630 ?auto_498631 )
      ( MAKE-12PILE ?auto_498623 ?auto_498624 ?auto_498625 ?auto_498626 ?auto_498627 ?auto_498628 ?auto_498629 ?auto_498630 ?auto_498631 ?auto_498632 ?auto_498633 ?auto_498634 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498673 - BLOCK
      ?auto_498674 - BLOCK
      ?auto_498675 - BLOCK
      ?auto_498676 - BLOCK
      ?auto_498677 - BLOCK
      ?auto_498678 - BLOCK
      ?auto_498679 - BLOCK
      ?auto_498680 - BLOCK
      ?auto_498681 - BLOCK
      ?auto_498682 - BLOCK
      ?auto_498683 - BLOCK
      ?auto_498684 - BLOCK
    )
    :vars
    (
      ?auto_498685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498684 ?auto_498685 ) ( ON-TABLE ?auto_498673 ) ( ON ?auto_498674 ?auto_498673 ) ( ON ?auto_498675 ?auto_498674 ) ( ON ?auto_498676 ?auto_498675 ) ( ON ?auto_498677 ?auto_498676 ) ( ON ?auto_498678 ?auto_498677 ) ( ON ?auto_498679 ?auto_498678 ) ( not ( = ?auto_498673 ?auto_498674 ) ) ( not ( = ?auto_498673 ?auto_498675 ) ) ( not ( = ?auto_498673 ?auto_498676 ) ) ( not ( = ?auto_498673 ?auto_498677 ) ) ( not ( = ?auto_498673 ?auto_498678 ) ) ( not ( = ?auto_498673 ?auto_498679 ) ) ( not ( = ?auto_498673 ?auto_498680 ) ) ( not ( = ?auto_498673 ?auto_498681 ) ) ( not ( = ?auto_498673 ?auto_498682 ) ) ( not ( = ?auto_498673 ?auto_498683 ) ) ( not ( = ?auto_498673 ?auto_498684 ) ) ( not ( = ?auto_498673 ?auto_498685 ) ) ( not ( = ?auto_498674 ?auto_498675 ) ) ( not ( = ?auto_498674 ?auto_498676 ) ) ( not ( = ?auto_498674 ?auto_498677 ) ) ( not ( = ?auto_498674 ?auto_498678 ) ) ( not ( = ?auto_498674 ?auto_498679 ) ) ( not ( = ?auto_498674 ?auto_498680 ) ) ( not ( = ?auto_498674 ?auto_498681 ) ) ( not ( = ?auto_498674 ?auto_498682 ) ) ( not ( = ?auto_498674 ?auto_498683 ) ) ( not ( = ?auto_498674 ?auto_498684 ) ) ( not ( = ?auto_498674 ?auto_498685 ) ) ( not ( = ?auto_498675 ?auto_498676 ) ) ( not ( = ?auto_498675 ?auto_498677 ) ) ( not ( = ?auto_498675 ?auto_498678 ) ) ( not ( = ?auto_498675 ?auto_498679 ) ) ( not ( = ?auto_498675 ?auto_498680 ) ) ( not ( = ?auto_498675 ?auto_498681 ) ) ( not ( = ?auto_498675 ?auto_498682 ) ) ( not ( = ?auto_498675 ?auto_498683 ) ) ( not ( = ?auto_498675 ?auto_498684 ) ) ( not ( = ?auto_498675 ?auto_498685 ) ) ( not ( = ?auto_498676 ?auto_498677 ) ) ( not ( = ?auto_498676 ?auto_498678 ) ) ( not ( = ?auto_498676 ?auto_498679 ) ) ( not ( = ?auto_498676 ?auto_498680 ) ) ( not ( = ?auto_498676 ?auto_498681 ) ) ( not ( = ?auto_498676 ?auto_498682 ) ) ( not ( = ?auto_498676 ?auto_498683 ) ) ( not ( = ?auto_498676 ?auto_498684 ) ) ( not ( = ?auto_498676 ?auto_498685 ) ) ( not ( = ?auto_498677 ?auto_498678 ) ) ( not ( = ?auto_498677 ?auto_498679 ) ) ( not ( = ?auto_498677 ?auto_498680 ) ) ( not ( = ?auto_498677 ?auto_498681 ) ) ( not ( = ?auto_498677 ?auto_498682 ) ) ( not ( = ?auto_498677 ?auto_498683 ) ) ( not ( = ?auto_498677 ?auto_498684 ) ) ( not ( = ?auto_498677 ?auto_498685 ) ) ( not ( = ?auto_498678 ?auto_498679 ) ) ( not ( = ?auto_498678 ?auto_498680 ) ) ( not ( = ?auto_498678 ?auto_498681 ) ) ( not ( = ?auto_498678 ?auto_498682 ) ) ( not ( = ?auto_498678 ?auto_498683 ) ) ( not ( = ?auto_498678 ?auto_498684 ) ) ( not ( = ?auto_498678 ?auto_498685 ) ) ( not ( = ?auto_498679 ?auto_498680 ) ) ( not ( = ?auto_498679 ?auto_498681 ) ) ( not ( = ?auto_498679 ?auto_498682 ) ) ( not ( = ?auto_498679 ?auto_498683 ) ) ( not ( = ?auto_498679 ?auto_498684 ) ) ( not ( = ?auto_498679 ?auto_498685 ) ) ( not ( = ?auto_498680 ?auto_498681 ) ) ( not ( = ?auto_498680 ?auto_498682 ) ) ( not ( = ?auto_498680 ?auto_498683 ) ) ( not ( = ?auto_498680 ?auto_498684 ) ) ( not ( = ?auto_498680 ?auto_498685 ) ) ( not ( = ?auto_498681 ?auto_498682 ) ) ( not ( = ?auto_498681 ?auto_498683 ) ) ( not ( = ?auto_498681 ?auto_498684 ) ) ( not ( = ?auto_498681 ?auto_498685 ) ) ( not ( = ?auto_498682 ?auto_498683 ) ) ( not ( = ?auto_498682 ?auto_498684 ) ) ( not ( = ?auto_498682 ?auto_498685 ) ) ( not ( = ?auto_498683 ?auto_498684 ) ) ( not ( = ?auto_498683 ?auto_498685 ) ) ( not ( = ?auto_498684 ?auto_498685 ) ) ( ON ?auto_498683 ?auto_498684 ) ( ON ?auto_498682 ?auto_498683 ) ( ON ?auto_498681 ?auto_498682 ) ( CLEAR ?auto_498679 ) ( ON ?auto_498680 ?auto_498681 ) ( CLEAR ?auto_498680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_498673 ?auto_498674 ?auto_498675 ?auto_498676 ?auto_498677 ?auto_498678 ?auto_498679 ?auto_498680 )
      ( MAKE-12PILE ?auto_498673 ?auto_498674 ?auto_498675 ?auto_498676 ?auto_498677 ?auto_498678 ?auto_498679 ?auto_498680 ?auto_498681 ?auto_498682 ?auto_498683 ?auto_498684 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498723 - BLOCK
      ?auto_498724 - BLOCK
      ?auto_498725 - BLOCK
      ?auto_498726 - BLOCK
      ?auto_498727 - BLOCK
      ?auto_498728 - BLOCK
      ?auto_498729 - BLOCK
      ?auto_498730 - BLOCK
      ?auto_498731 - BLOCK
      ?auto_498732 - BLOCK
      ?auto_498733 - BLOCK
      ?auto_498734 - BLOCK
    )
    :vars
    (
      ?auto_498735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498734 ?auto_498735 ) ( ON-TABLE ?auto_498723 ) ( ON ?auto_498724 ?auto_498723 ) ( ON ?auto_498725 ?auto_498724 ) ( ON ?auto_498726 ?auto_498725 ) ( ON ?auto_498727 ?auto_498726 ) ( ON ?auto_498728 ?auto_498727 ) ( not ( = ?auto_498723 ?auto_498724 ) ) ( not ( = ?auto_498723 ?auto_498725 ) ) ( not ( = ?auto_498723 ?auto_498726 ) ) ( not ( = ?auto_498723 ?auto_498727 ) ) ( not ( = ?auto_498723 ?auto_498728 ) ) ( not ( = ?auto_498723 ?auto_498729 ) ) ( not ( = ?auto_498723 ?auto_498730 ) ) ( not ( = ?auto_498723 ?auto_498731 ) ) ( not ( = ?auto_498723 ?auto_498732 ) ) ( not ( = ?auto_498723 ?auto_498733 ) ) ( not ( = ?auto_498723 ?auto_498734 ) ) ( not ( = ?auto_498723 ?auto_498735 ) ) ( not ( = ?auto_498724 ?auto_498725 ) ) ( not ( = ?auto_498724 ?auto_498726 ) ) ( not ( = ?auto_498724 ?auto_498727 ) ) ( not ( = ?auto_498724 ?auto_498728 ) ) ( not ( = ?auto_498724 ?auto_498729 ) ) ( not ( = ?auto_498724 ?auto_498730 ) ) ( not ( = ?auto_498724 ?auto_498731 ) ) ( not ( = ?auto_498724 ?auto_498732 ) ) ( not ( = ?auto_498724 ?auto_498733 ) ) ( not ( = ?auto_498724 ?auto_498734 ) ) ( not ( = ?auto_498724 ?auto_498735 ) ) ( not ( = ?auto_498725 ?auto_498726 ) ) ( not ( = ?auto_498725 ?auto_498727 ) ) ( not ( = ?auto_498725 ?auto_498728 ) ) ( not ( = ?auto_498725 ?auto_498729 ) ) ( not ( = ?auto_498725 ?auto_498730 ) ) ( not ( = ?auto_498725 ?auto_498731 ) ) ( not ( = ?auto_498725 ?auto_498732 ) ) ( not ( = ?auto_498725 ?auto_498733 ) ) ( not ( = ?auto_498725 ?auto_498734 ) ) ( not ( = ?auto_498725 ?auto_498735 ) ) ( not ( = ?auto_498726 ?auto_498727 ) ) ( not ( = ?auto_498726 ?auto_498728 ) ) ( not ( = ?auto_498726 ?auto_498729 ) ) ( not ( = ?auto_498726 ?auto_498730 ) ) ( not ( = ?auto_498726 ?auto_498731 ) ) ( not ( = ?auto_498726 ?auto_498732 ) ) ( not ( = ?auto_498726 ?auto_498733 ) ) ( not ( = ?auto_498726 ?auto_498734 ) ) ( not ( = ?auto_498726 ?auto_498735 ) ) ( not ( = ?auto_498727 ?auto_498728 ) ) ( not ( = ?auto_498727 ?auto_498729 ) ) ( not ( = ?auto_498727 ?auto_498730 ) ) ( not ( = ?auto_498727 ?auto_498731 ) ) ( not ( = ?auto_498727 ?auto_498732 ) ) ( not ( = ?auto_498727 ?auto_498733 ) ) ( not ( = ?auto_498727 ?auto_498734 ) ) ( not ( = ?auto_498727 ?auto_498735 ) ) ( not ( = ?auto_498728 ?auto_498729 ) ) ( not ( = ?auto_498728 ?auto_498730 ) ) ( not ( = ?auto_498728 ?auto_498731 ) ) ( not ( = ?auto_498728 ?auto_498732 ) ) ( not ( = ?auto_498728 ?auto_498733 ) ) ( not ( = ?auto_498728 ?auto_498734 ) ) ( not ( = ?auto_498728 ?auto_498735 ) ) ( not ( = ?auto_498729 ?auto_498730 ) ) ( not ( = ?auto_498729 ?auto_498731 ) ) ( not ( = ?auto_498729 ?auto_498732 ) ) ( not ( = ?auto_498729 ?auto_498733 ) ) ( not ( = ?auto_498729 ?auto_498734 ) ) ( not ( = ?auto_498729 ?auto_498735 ) ) ( not ( = ?auto_498730 ?auto_498731 ) ) ( not ( = ?auto_498730 ?auto_498732 ) ) ( not ( = ?auto_498730 ?auto_498733 ) ) ( not ( = ?auto_498730 ?auto_498734 ) ) ( not ( = ?auto_498730 ?auto_498735 ) ) ( not ( = ?auto_498731 ?auto_498732 ) ) ( not ( = ?auto_498731 ?auto_498733 ) ) ( not ( = ?auto_498731 ?auto_498734 ) ) ( not ( = ?auto_498731 ?auto_498735 ) ) ( not ( = ?auto_498732 ?auto_498733 ) ) ( not ( = ?auto_498732 ?auto_498734 ) ) ( not ( = ?auto_498732 ?auto_498735 ) ) ( not ( = ?auto_498733 ?auto_498734 ) ) ( not ( = ?auto_498733 ?auto_498735 ) ) ( not ( = ?auto_498734 ?auto_498735 ) ) ( ON ?auto_498733 ?auto_498734 ) ( ON ?auto_498732 ?auto_498733 ) ( ON ?auto_498731 ?auto_498732 ) ( ON ?auto_498730 ?auto_498731 ) ( CLEAR ?auto_498728 ) ( ON ?auto_498729 ?auto_498730 ) ( CLEAR ?auto_498729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_498723 ?auto_498724 ?auto_498725 ?auto_498726 ?auto_498727 ?auto_498728 ?auto_498729 )
      ( MAKE-12PILE ?auto_498723 ?auto_498724 ?auto_498725 ?auto_498726 ?auto_498727 ?auto_498728 ?auto_498729 ?auto_498730 ?auto_498731 ?auto_498732 ?auto_498733 ?auto_498734 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498773 - BLOCK
      ?auto_498774 - BLOCK
      ?auto_498775 - BLOCK
      ?auto_498776 - BLOCK
      ?auto_498777 - BLOCK
      ?auto_498778 - BLOCK
      ?auto_498779 - BLOCK
      ?auto_498780 - BLOCK
      ?auto_498781 - BLOCK
      ?auto_498782 - BLOCK
      ?auto_498783 - BLOCK
      ?auto_498784 - BLOCK
    )
    :vars
    (
      ?auto_498785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498784 ?auto_498785 ) ( ON-TABLE ?auto_498773 ) ( ON ?auto_498774 ?auto_498773 ) ( ON ?auto_498775 ?auto_498774 ) ( ON ?auto_498776 ?auto_498775 ) ( ON ?auto_498777 ?auto_498776 ) ( not ( = ?auto_498773 ?auto_498774 ) ) ( not ( = ?auto_498773 ?auto_498775 ) ) ( not ( = ?auto_498773 ?auto_498776 ) ) ( not ( = ?auto_498773 ?auto_498777 ) ) ( not ( = ?auto_498773 ?auto_498778 ) ) ( not ( = ?auto_498773 ?auto_498779 ) ) ( not ( = ?auto_498773 ?auto_498780 ) ) ( not ( = ?auto_498773 ?auto_498781 ) ) ( not ( = ?auto_498773 ?auto_498782 ) ) ( not ( = ?auto_498773 ?auto_498783 ) ) ( not ( = ?auto_498773 ?auto_498784 ) ) ( not ( = ?auto_498773 ?auto_498785 ) ) ( not ( = ?auto_498774 ?auto_498775 ) ) ( not ( = ?auto_498774 ?auto_498776 ) ) ( not ( = ?auto_498774 ?auto_498777 ) ) ( not ( = ?auto_498774 ?auto_498778 ) ) ( not ( = ?auto_498774 ?auto_498779 ) ) ( not ( = ?auto_498774 ?auto_498780 ) ) ( not ( = ?auto_498774 ?auto_498781 ) ) ( not ( = ?auto_498774 ?auto_498782 ) ) ( not ( = ?auto_498774 ?auto_498783 ) ) ( not ( = ?auto_498774 ?auto_498784 ) ) ( not ( = ?auto_498774 ?auto_498785 ) ) ( not ( = ?auto_498775 ?auto_498776 ) ) ( not ( = ?auto_498775 ?auto_498777 ) ) ( not ( = ?auto_498775 ?auto_498778 ) ) ( not ( = ?auto_498775 ?auto_498779 ) ) ( not ( = ?auto_498775 ?auto_498780 ) ) ( not ( = ?auto_498775 ?auto_498781 ) ) ( not ( = ?auto_498775 ?auto_498782 ) ) ( not ( = ?auto_498775 ?auto_498783 ) ) ( not ( = ?auto_498775 ?auto_498784 ) ) ( not ( = ?auto_498775 ?auto_498785 ) ) ( not ( = ?auto_498776 ?auto_498777 ) ) ( not ( = ?auto_498776 ?auto_498778 ) ) ( not ( = ?auto_498776 ?auto_498779 ) ) ( not ( = ?auto_498776 ?auto_498780 ) ) ( not ( = ?auto_498776 ?auto_498781 ) ) ( not ( = ?auto_498776 ?auto_498782 ) ) ( not ( = ?auto_498776 ?auto_498783 ) ) ( not ( = ?auto_498776 ?auto_498784 ) ) ( not ( = ?auto_498776 ?auto_498785 ) ) ( not ( = ?auto_498777 ?auto_498778 ) ) ( not ( = ?auto_498777 ?auto_498779 ) ) ( not ( = ?auto_498777 ?auto_498780 ) ) ( not ( = ?auto_498777 ?auto_498781 ) ) ( not ( = ?auto_498777 ?auto_498782 ) ) ( not ( = ?auto_498777 ?auto_498783 ) ) ( not ( = ?auto_498777 ?auto_498784 ) ) ( not ( = ?auto_498777 ?auto_498785 ) ) ( not ( = ?auto_498778 ?auto_498779 ) ) ( not ( = ?auto_498778 ?auto_498780 ) ) ( not ( = ?auto_498778 ?auto_498781 ) ) ( not ( = ?auto_498778 ?auto_498782 ) ) ( not ( = ?auto_498778 ?auto_498783 ) ) ( not ( = ?auto_498778 ?auto_498784 ) ) ( not ( = ?auto_498778 ?auto_498785 ) ) ( not ( = ?auto_498779 ?auto_498780 ) ) ( not ( = ?auto_498779 ?auto_498781 ) ) ( not ( = ?auto_498779 ?auto_498782 ) ) ( not ( = ?auto_498779 ?auto_498783 ) ) ( not ( = ?auto_498779 ?auto_498784 ) ) ( not ( = ?auto_498779 ?auto_498785 ) ) ( not ( = ?auto_498780 ?auto_498781 ) ) ( not ( = ?auto_498780 ?auto_498782 ) ) ( not ( = ?auto_498780 ?auto_498783 ) ) ( not ( = ?auto_498780 ?auto_498784 ) ) ( not ( = ?auto_498780 ?auto_498785 ) ) ( not ( = ?auto_498781 ?auto_498782 ) ) ( not ( = ?auto_498781 ?auto_498783 ) ) ( not ( = ?auto_498781 ?auto_498784 ) ) ( not ( = ?auto_498781 ?auto_498785 ) ) ( not ( = ?auto_498782 ?auto_498783 ) ) ( not ( = ?auto_498782 ?auto_498784 ) ) ( not ( = ?auto_498782 ?auto_498785 ) ) ( not ( = ?auto_498783 ?auto_498784 ) ) ( not ( = ?auto_498783 ?auto_498785 ) ) ( not ( = ?auto_498784 ?auto_498785 ) ) ( ON ?auto_498783 ?auto_498784 ) ( ON ?auto_498782 ?auto_498783 ) ( ON ?auto_498781 ?auto_498782 ) ( ON ?auto_498780 ?auto_498781 ) ( ON ?auto_498779 ?auto_498780 ) ( CLEAR ?auto_498777 ) ( ON ?auto_498778 ?auto_498779 ) ( CLEAR ?auto_498778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_498773 ?auto_498774 ?auto_498775 ?auto_498776 ?auto_498777 ?auto_498778 )
      ( MAKE-12PILE ?auto_498773 ?auto_498774 ?auto_498775 ?auto_498776 ?auto_498777 ?auto_498778 ?auto_498779 ?auto_498780 ?auto_498781 ?auto_498782 ?auto_498783 ?auto_498784 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498823 - BLOCK
      ?auto_498824 - BLOCK
      ?auto_498825 - BLOCK
      ?auto_498826 - BLOCK
      ?auto_498827 - BLOCK
      ?auto_498828 - BLOCK
      ?auto_498829 - BLOCK
      ?auto_498830 - BLOCK
      ?auto_498831 - BLOCK
      ?auto_498832 - BLOCK
      ?auto_498833 - BLOCK
      ?auto_498834 - BLOCK
    )
    :vars
    (
      ?auto_498835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498834 ?auto_498835 ) ( ON-TABLE ?auto_498823 ) ( ON ?auto_498824 ?auto_498823 ) ( ON ?auto_498825 ?auto_498824 ) ( ON ?auto_498826 ?auto_498825 ) ( not ( = ?auto_498823 ?auto_498824 ) ) ( not ( = ?auto_498823 ?auto_498825 ) ) ( not ( = ?auto_498823 ?auto_498826 ) ) ( not ( = ?auto_498823 ?auto_498827 ) ) ( not ( = ?auto_498823 ?auto_498828 ) ) ( not ( = ?auto_498823 ?auto_498829 ) ) ( not ( = ?auto_498823 ?auto_498830 ) ) ( not ( = ?auto_498823 ?auto_498831 ) ) ( not ( = ?auto_498823 ?auto_498832 ) ) ( not ( = ?auto_498823 ?auto_498833 ) ) ( not ( = ?auto_498823 ?auto_498834 ) ) ( not ( = ?auto_498823 ?auto_498835 ) ) ( not ( = ?auto_498824 ?auto_498825 ) ) ( not ( = ?auto_498824 ?auto_498826 ) ) ( not ( = ?auto_498824 ?auto_498827 ) ) ( not ( = ?auto_498824 ?auto_498828 ) ) ( not ( = ?auto_498824 ?auto_498829 ) ) ( not ( = ?auto_498824 ?auto_498830 ) ) ( not ( = ?auto_498824 ?auto_498831 ) ) ( not ( = ?auto_498824 ?auto_498832 ) ) ( not ( = ?auto_498824 ?auto_498833 ) ) ( not ( = ?auto_498824 ?auto_498834 ) ) ( not ( = ?auto_498824 ?auto_498835 ) ) ( not ( = ?auto_498825 ?auto_498826 ) ) ( not ( = ?auto_498825 ?auto_498827 ) ) ( not ( = ?auto_498825 ?auto_498828 ) ) ( not ( = ?auto_498825 ?auto_498829 ) ) ( not ( = ?auto_498825 ?auto_498830 ) ) ( not ( = ?auto_498825 ?auto_498831 ) ) ( not ( = ?auto_498825 ?auto_498832 ) ) ( not ( = ?auto_498825 ?auto_498833 ) ) ( not ( = ?auto_498825 ?auto_498834 ) ) ( not ( = ?auto_498825 ?auto_498835 ) ) ( not ( = ?auto_498826 ?auto_498827 ) ) ( not ( = ?auto_498826 ?auto_498828 ) ) ( not ( = ?auto_498826 ?auto_498829 ) ) ( not ( = ?auto_498826 ?auto_498830 ) ) ( not ( = ?auto_498826 ?auto_498831 ) ) ( not ( = ?auto_498826 ?auto_498832 ) ) ( not ( = ?auto_498826 ?auto_498833 ) ) ( not ( = ?auto_498826 ?auto_498834 ) ) ( not ( = ?auto_498826 ?auto_498835 ) ) ( not ( = ?auto_498827 ?auto_498828 ) ) ( not ( = ?auto_498827 ?auto_498829 ) ) ( not ( = ?auto_498827 ?auto_498830 ) ) ( not ( = ?auto_498827 ?auto_498831 ) ) ( not ( = ?auto_498827 ?auto_498832 ) ) ( not ( = ?auto_498827 ?auto_498833 ) ) ( not ( = ?auto_498827 ?auto_498834 ) ) ( not ( = ?auto_498827 ?auto_498835 ) ) ( not ( = ?auto_498828 ?auto_498829 ) ) ( not ( = ?auto_498828 ?auto_498830 ) ) ( not ( = ?auto_498828 ?auto_498831 ) ) ( not ( = ?auto_498828 ?auto_498832 ) ) ( not ( = ?auto_498828 ?auto_498833 ) ) ( not ( = ?auto_498828 ?auto_498834 ) ) ( not ( = ?auto_498828 ?auto_498835 ) ) ( not ( = ?auto_498829 ?auto_498830 ) ) ( not ( = ?auto_498829 ?auto_498831 ) ) ( not ( = ?auto_498829 ?auto_498832 ) ) ( not ( = ?auto_498829 ?auto_498833 ) ) ( not ( = ?auto_498829 ?auto_498834 ) ) ( not ( = ?auto_498829 ?auto_498835 ) ) ( not ( = ?auto_498830 ?auto_498831 ) ) ( not ( = ?auto_498830 ?auto_498832 ) ) ( not ( = ?auto_498830 ?auto_498833 ) ) ( not ( = ?auto_498830 ?auto_498834 ) ) ( not ( = ?auto_498830 ?auto_498835 ) ) ( not ( = ?auto_498831 ?auto_498832 ) ) ( not ( = ?auto_498831 ?auto_498833 ) ) ( not ( = ?auto_498831 ?auto_498834 ) ) ( not ( = ?auto_498831 ?auto_498835 ) ) ( not ( = ?auto_498832 ?auto_498833 ) ) ( not ( = ?auto_498832 ?auto_498834 ) ) ( not ( = ?auto_498832 ?auto_498835 ) ) ( not ( = ?auto_498833 ?auto_498834 ) ) ( not ( = ?auto_498833 ?auto_498835 ) ) ( not ( = ?auto_498834 ?auto_498835 ) ) ( ON ?auto_498833 ?auto_498834 ) ( ON ?auto_498832 ?auto_498833 ) ( ON ?auto_498831 ?auto_498832 ) ( ON ?auto_498830 ?auto_498831 ) ( ON ?auto_498829 ?auto_498830 ) ( ON ?auto_498828 ?auto_498829 ) ( CLEAR ?auto_498826 ) ( ON ?auto_498827 ?auto_498828 ) ( CLEAR ?auto_498827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_498823 ?auto_498824 ?auto_498825 ?auto_498826 ?auto_498827 )
      ( MAKE-12PILE ?auto_498823 ?auto_498824 ?auto_498825 ?auto_498826 ?auto_498827 ?auto_498828 ?auto_498829 ?auto_498830 ?auto_498831 ?auto_498832 ?auto_498833 ?auto_498834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498873 - BLOCK
      ?auto_498874 - BLOCK
      ?auto_498875 - BLOCK
      ?auto_498876 - BLOCK
      ?auto_498877 - BLOCK
      ?auto_498878 - BLOCK
      ?auto_498879 - BLOCK
      ?auto_498880 - BLOCK
      ?auto_498881 - BLOCK
      ?auto_498882 - BLOCK
      ?auto_498883 - BLOCK
      ?auto_498884 - BLOCK
    )
    :vars
    (
      ?auto_498885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498884 ?auto_498885 ) ( ON-TABLE ?auto_498873 ) ( ON ?auto_498874 ?auto_498873 ) ( ON ?auto_498875 ?auto_498874 ) ( not ( = ?auto_498873 ?auto_498874 ) ) ( not ( = ?auto_498873 ?auto_498875 ) ) ( not ( = ?auto_498873 ?auto_498876 ) ) ( not ( = ?auto_498873 ?auto_498877 ) ) ( not ( = ?auto_498873 ?auto_498878 ) ) ( not ( = ?auto_498873 ?auto_498879 ) ) ( not ( = ?auto_498873 ?auto_498880 ) ) ( not ( = ?auto_498873 ?auto_498881 ) ) ( not ( = ?auto_498873 ?auto_498882 ) ) ( not ( = ?auto_498873 ?auto_498883 ) ) ( not ( = ?auto_498873 ?auto_498884 ) ) ( not ( = ?auto_498873 ?auto_498885 ) ) ( not ( = ?auto_498874 ?auto_498875 ) ) ( not ( = ?auto_498874 ?auto_498876 ) ) ( not ( = ?auto_498874 ?auto_498877 ) ) ( not ( = ?auto_498874 ?auto_498878 ) ) ( not ( = ?auto_498874 ?auto_498879 ) ) ( not ( = ?auto_498874 ?auto_498880 ) ) ( not ( = ?auto_498874 ?auto_498881 ) ) ( not ( = ?auto_498874 ?auto_498882 ) ) ( not ( = ?auto_498874 ?auto_498883 ) ) ( not ( = ?auto_498874 ?auto_498884 ) ) ( not ( = ?auto_498874 ?auto_498885 ) ) ( not ( = ?auto_498875 ?auto_498876 ) ) ( not ( = ?auto_498875 ?auto_498877 ) ) ( not ( = ?auto_498875 ?auto_498878 ) ) ( not ( = ?auto_498875 ?auto_498879 ) ) ( not ( = ?auto_498875 ?auto_498880 ) ) ( not ( = ?auto_498875 ?auto_498881 ) ) ( not ( = ?auto_498875 ?auto_498882 ) ) ( not ( = ?auto_498875 ?auto_498883 ) ) ( not ( = ?auto_498875 ?auto_498884 ) ) ( not ( = ?auto_498875 ?auto_498885 ) ) ( not ( = ?auto_498876 ?auto_498877 ) ) ( not ( = ?auto_498876 ?auto_498878 ) ) ( not ( = ?auto_498876 ?auto_498879 ) ) ( not ( = ?auto_498876 ?auto_498880 ) ) ( not ( = ?auto_498876 ?auto_498881 ) ) ( not ( = ?auto_498876 ?auto_498882 ) ) ( not ( = ?auto_498876 ?auto_498883 ) ) ( not ( = ?auto_498876 ?auto_498884 ) ) ( not ( = ?auto_498876 ?auto_498885 ) ) ( not ( = ?auto_498877 ?auto_498878 ) ) ( not ( = ?auto_498877 ?auto_498879 ) ) ( not ( = ?auto_498877 ?auto_498880 ) ) ( not ( = ?auto_498877 ?auto_498881 ) ) ( not ( = ?auto_498877 ?auto_498882 ) ) ( not ( = ?auto_498877 ?auto_498883 ) ) ( not ( = ?auto_498877 ?auto_498884 ) ) ( not ( = ?auto_498877 ?auto_498885 ) ) ( not ( = ?auto_498878 ?auto_498879 ) ) ( not ( = ?auto_498878 ?auto_498880 ) ) ( not ( = ?auto_498878 ?auto_498881 ) ) ( not ( = ?auto_498878 ?auto_498882 ) ) ( not ( = ?auto_498878 ?auto_498883 ) ) ( not ( = ?auto_498878 ?auto_498884 ) ) ( not ( = ?auto_498878 ?auto_498885 ) ) ( not ( = ?auto_498879 ?auto_498880 ) ) ( not ( = ?auto_498879 ?auto_498881 ) ) ( not ( = ?auto_498879 ?auto_498882 ) ) ( not ( = ?auto_498879 ?auto_498883 ) ) ( not ( = ?auto_498879 ?auto_498884 ) ) ( not ( = ?auto_498879 ?auto_498885 ) ) ( not ( = ?auto_498880 ?auto_498881 ) ) ( not ( = ?auto_498880 ?auto_498882 ) ) ( not ( = ?auto_498880 ?auto_498883 ) ) ( not ( = ?auto_498880 ?auto_498884 ) ) ( not ( = ?auto_498880 ?auto_498885 ) ) ( not ( = ?auto_498881 ?auto_498882 ) ) ( not ( = ?auto_498881 ?auto_498883 ) ) ( not ( = ?auto_498881 ?auto_498884 ) ) ( not ( = ?auto_498881 ?auto_498885 ) ) ( not ( = ?auto_498882 ?auto_498883 ) ) ( not ( = ?auto_498882 ?auto_498884 ) ) ( not ( = ?auto_498882 ?auto_498885 ) ) ( not ( = ?auto_498883 ?auto_498884 ) ) ( not ( = ?auto_498883 ?auto_498885 ) ) ( not ( = ?auto_498884 ?auto_498885 ) ) ( ON ?auto_498883 ?auto_498884 ) ( ON ?auto_498882 ?auto_498883 ) ( ON ?auto_498881 ?auto_498882 ) ( ON ?auto_498880 ?auto_498881 ) ( ON ?auto_498879 ?auto_498880 ) ( ON ?auto_498878 ?auto_498879 ) ( ON ?auto_498877 ?auto_498878 ) ( CLEAR ?auto_498875 ) ( ON ?auto_498876 ?auto_498877 ) ( CLEAR ?auto_498876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_498873 ?auto_498874 ?auto_498875 ?auto_498876 )
      ( MAKE-12PILE ?auto_498873 ?auto_498874 ?auto_498875 ?auto_498876 ?auto_498877 ?auto_498878 ?auto_498879 ?auto_498880 ?auto_498881 ?auto_498882 ?auto_498883 ?auto_498884 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498923 - BLOCK
      ?auto_498924 - BLOCK
      ?auto_498925 - BLOCK
      ?auto_498926 - BLOCK
      ?auto_498927 - BLOCK
      ?auto_498928 - BLOCK
      ?auto_498929 - BLOCK
      ?auto_498930 - BLOCK
      ?auto_498931 - BLOCK
      ?auto_498932 - BLOCK
      ?auto_498933 - BLOCK
      ?auto_498934 - BLOCK
    )
    :vars
    (
      ?auto_498935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498934 ?auto_498935 ) ( ON-TABLE ?auto_498923 ) ( ON ?auto_498924 ?auto_498923 ) ( not ( = ?auto_498923 ?auto_498924 ) ) ( not ( = ?auto_498923 ?auto_498925 ) ) ( not ( = ?auto_498923 ?auto_498926 ) ) ( not ( = ?auto_498923 ?auto_498927 ) ) ( not ( = ?auto_498923 ?auto_498928 ) ) ( not ( = ?auto_498923 ?auto_498929 ) ) ( not ( = ?auto_498923 ?auto_498930 ) ) ( not ( = ?auto_498923 ?auto_498931 ) ) ( not ( = ?auto_498923 ?auto_498932 ) ) ( not ( = ?auto_498923 ?auto_498933 ) ) ( not ( = ?auto_498923 ?auto_498934 ) ) ( not ( = ?auto_498923 ?auto_498935 ) ) ( not ( = ?auto_498924 ?auto_498925 ) ) ( not ( = ?auto_498924 ?auto_498926 ) ) ( not ( = ?auto_498924 ?auto_498927 ) ) ( not ( = ?auto_498924 ?auto_498928 ) ) ( not ( = ?auto_498924 ?auto_498929 ) ) ( not ( = ?auto_498924 ?auto_498930 ) ) ( not ( = ?auto_498924 ?auto_498931 ) ) ( not ( = ?auto_498924 ?auto_498932 ) ) ( not ( = ?auto_498924 ?auto_498933 ) ) ( not ( = ?auto_498924 ?auto_498934 ) ) ( not ( = ?auto_498924 ?auto_498935 ) ) ( not ( = ?auto_498925 ?auto_498926 ) ) ( not ( = ?auto_498925 ?auto_498927 ) ) ( not ( = ?auto_498925 ?auto_498928 ) ) ( not ( = ?auto_498925 ?auto_498929 ) ) ( not ( = ?auto_498925 ?auto_498930 ) ) ( not ( = ?auto_498925 ?auto_498931 ) ) ( not ( = ?auto_498925 ?auto_498932 ) ) ( not ( = ?auto_498925 ?auto_498933 ) ) ( not ( = ?auto_498925 ?auto_498934 ) ) ( not ( = ?auto_498925 ?auto_498935 ) ) ( not ( = ?auto_498926 ?auto_498927 ) ) ( not ( = ?auto_498926 ?auto_498928 ) ) ( not ( = ?auto_498926 ?auto_498929 ) ) ( not ( = ?auto_498926 ?auto_498930 ) ) ( not ( = ?auto_498926 ?auto_498931 ) ) ( not ( = ?auto_498926 ?auto_498932 ) ) ( not ( = ?auto_498926 ?auto_498933 ) ) ( not ( = ?auto_498926 ?auto_498934 ) ) ( not ( = ?auto_498926 ?auto_498935 ) ) ( not ( = ?auto_498927 ?auto_498928 ) ) ( not ( = ?auto_498927 ?auto_498929 ) ) ( not ( = ?auto_498927 ?auto_498930 ) ) ( not ( = ?auto_498927 ?auto_498931 ) ) ( not ( = ?auto_498927 ?auto_498932 ) ) ( not ( = ?auto_498927 ?auto_498933 ) ) ( not ( = ?auto_498927 ?auto_498934 ) ) ( not ( = ?auto_498927 ?auto_498935 ) ) ( not ( = ?auto_498928 ?auto_498929 ) ) ( not ( = ?auto_498928 ?auto_498930 ) ) ( not ( = ?auto_498928 ?auto_498931 ) ) ( not ( = ?auto_498928 ?auto_498932 ) ) ( not ( = ?auto_498928 ?auto_498933 ) ) ( not ( = ?auto_498928 ?auto_498934 ) ) ( not ( = ?auto_498928 ?auto_498935 ) ) ( not ( = ?auto_498929 ?auto_498930 ) ) ( not ( = ?auto_498929 ?auto_498931 ) ) ( not ( = ?auto_498929 ?auto_498932 ) ) ( not ( = ?auto_498929 ?auto_498933 ) ) ( not ( = ?auto_498929 ?auto_498934 ) ) ( not ( = ?auto_498929 ?auto_498935 ) ) ( not ( = ?auto_498930 ?auto_498931 ) ) ( not ( = ?auto_498930 ?auto_498932 ) ) ( not ( = ?auto_498930 ?auto_498933 ) ) ( not ( = ?auto_498930 ?auto_498934 ) ) ( not ( = ?auto_498930 ?auto_498935 ) ) ( not ( = ?auto_498931 ?auto_498932 ) ) ( not ( = ?auto_498931 ?auto_498933 ) ) ( not ( = ?auto_498931 ?auto_498934 ) ) ( not ( = ?auto_498931 ?auto_498935 ) ) ( not ( = ?auto_498932 ?auto_498933 ) ) ( not ( = ?auto_498932 ?auto_498934 ) ) ( not ( = ?auto_498932 ?auto_498935 ) ) ( not ( = ?auto_498933 ?auto_498934 ) ) ( not ( = ?auto_498933 ?auto_498935 ) ) ( not ( = ?auto_498934 ?auto_498935 ) ) ( ON ?auto_498933 ?auto_498934 ) ( ON ?auto_498932 ?auto_498933 ) ( ON ?auto_498931 ?auto_498932 ) ( ON ?auto_498930 ?auto_498931 ) ( ON ?auto_498929 ?auto_498930 ) ( ON ?auto_498928 ?auto_498929 ) ( ON ?auto_498927 ?auto_498928 ) ( ON ?auto_498926 ?auto_498927 ) ( CLEAR ?auto_498924 ) ( ON ?auto_498925 ?auto_498926 ) ( CLEAR ?auto_498925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_498923 ?auto_498924 ?auto_498925 )
      ( MAKE-12PILE ?auto_498923 ?auto_498924 ?auto_498925 ?auto_498926 ?auto_498927 ?auto_498928 ?auto_498929 ?auto_498930 ?auto_498931 ?auto_498932 ?auto_498933 ?auto_498934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_498973 - BLOCK
      ?auto_498974 - BLOCK
      ?auto_498975 - BLOCK
      ?auto_498976 - BLOCK
      ?auto_498977 - BLOCK
      ?auto_498978 - BLOCK
      ?auto_498979 - BLOCK
      ?auto_498980 - BLOCK
      ?auto_498981 - BLOCK
      ?auto_498982 - BLOCK
      ?auto_498983 - BLOCK
      ?auto_498984 - BLOCK
    )
    :vars
    (
      ?auto_498985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_498984 ?auto_498985 ) ( ON-TABLE ?auto_498973 ) ( not ( = ?auto_498973 ?auto_498974 ) ) ( not ( = ?auto_498973 ?auto_498975 ) ) ( not ( = ?auto_498973 ?auto_498976 ) ) ( not ( = ?auto_498973 ?auto_498977 ) ) ( not ( = ?auto_498973 ?auto_498978 ) ) ( not ( = ?auto_498973 ?auto_498979 ) ) ( not ( = ?auto_498973 ?auto_498980 ) ) ( not ( = ?auto_498973 ?auto_498981 ) ) ( not ( = ?auto_498973 ?auto_498982 ) ) ( not ( = ?auto_498973 ?auto_498983 ) ) ( not ( = ?auto_498973 ?auto_498984 ) ) ( not ( = ?auto_498973 ?auto_498985 ) ) ( not ( = ?auto_498974 ?auto_498975 ) ) ( not ( = ?auto_498974 ?auto_498976 ) ) ( not ( = ?auto_498974 ?auto_498977 ) ) ( not ( = ?auto_498974 ?auto_498978 ) ) ( not ( = ?auto_498974 ?auto_498979 ) ) ( not ( = ?auto_498974 ?auto_498980 ) ) ( not ( = ?auto_498974 ?auto_498981 ) ) ( not ( = ?auto_498974 ?auto_498982 ) ) ( not ( = ?auto_498974 ?auto_498983 ) ) ( not ( = ?auto_498974 ?auto_498984 ) ) ( not ( = ?auto_498974 ?auto_498985 ) ) ( not ( = ?auto_498975 ?auto_498976 ) ) ( not ( = ?auto_498975 ?auto_498977 ) ) ( not ( = ?auto_498975 ?auto_498978 ) ) ( not ( = ?auto_498975 ?auto_498979 ) ) ( not ( = ?auto_498975 ?auto_498980 ) ) ( not ( = ?auto_498975 ?auto_498981 ) ) ( not ( = ?auto_498975 ?auto_498982 ) ) ( not ( = ?auto_498975 ?auto_498983 ) ) ( not ( = ?auto_498975 ?auto_498984 ) ) ( not ( = ?auto_498975 ?auto_498985 ) ) ( not ( = ?auto_498976 ?auto_498977 ) ) ( not ( = ?auto_498976 ?auto_498978 ) ) ( not ( = ?auto_498976 ?auto_498979 ) ) ( not ( = ?auto_498976 ?auto_498980 ) ) ( not ( = ?auto_498976 ?auto_498981 ) ) ( not ( = ?auto_498976 ?auto_498982 ) ) ( not ( = ?auto_498976 ?auto_498983 ) ) ( not ( = ?auto_498976 ?auto_498984 ) ) ( not ( = ?auto_498976 ?auto_498985 ) ) ( not ( = ?auto_498977 ?auto_498978 ) ) ( not ( = ?auto_498977 ?auto_498979 ) ) ( not ( = ?auto_498977 ?auto_498980 ) ) ( not ( = ?auto_498977 ?auto_498981 ) ) ( not ( = ?auto_498977 ?auto_498982 ) ) ( not ( = ?auto_498977 ?auto_498983 ) ) ( not ( = ?auto_498977 ?auto_498984 ) ) ( not ( = ?auto_498977 ?auto_498985 ) ) ( not ( = ?auto_498978 ?auto_498979 ) ) ( not ( = ?auto_498978 ?auto_498980 ) ) ( not ( = ?auto_498978 ?auto_498981 ) ) ( not ( = ?auto_498978 ?auto_498982 ) ) ( not ( = ?auto_498978 ?auto_498983 ) ) ( not ( = ?auto_498978 ?auto_498984 ) ) ( not ( = ?auto_498978 ?auto_498985 ) ) ( not ( = ?auto_498979 ?auto_498980 ) ) ( not ( = ?auto_498979 ?auto_498981 ) ) ( not ( = ?auto_498979 ?auto_498982 ) ) ( not ( = ?auto_498979 ?auto_498983 ) ) ( not ( = ?auto_498979 ?auto_498984 ) ) ( not ( = ?auto_498979 ?auto_498985 ) ) ( not ( = ?auto_498980 ?auto_498981 ) ) ( not ( = ?auto_498980 ?auto_498982 ) ) ( not ( = ?auto_498980 ?auto_498983 ) ) ( not ( = ?auto_498980 ?auto_498984 ) ) ( not ( = ?auto_498980 ?auto_498985 ) ) ( not ( = ?auto_498981 ?auto_498982 ) ) ( not ( = ?auto_498981 ?auto_498983 ) ) ( not ( = ?auto_498981 ?auto_498984 ) ) ( not ( = ?auto_498981 ?auto_498985 ) ) ( not ( = ?auto_498982 ?auto_498983 ) ) ( not ( = ?auto_498982 ?auto_498984 ) ) ( not ( = ?auto_498982 ?auto_498985 ) ) ( not ( = ?auto_498983 ?auto_498984 ) ) ( not ( = ?auto_498983 ?auto_498985 ) ) ( not ( = ?auto_498984 ?auto_498985 ) ) ( ON ?auto_498983 ?auto_498984 ) ( ON ?auto_498982 ?auto_498983 ) ( ON ?auto_498981 ?auto_498982 ) ( ON ?auto_498980 ?auto_498981 ) ( ON ?auto_498979 ?auto_498980 ) ( ON ?auto_498978 ?auto_498979 ) ( ON ?auto_498977 ?auto_498978 ) ( ON ?auto_498976 ?auto_498977 ) ( ON ?auto_498975 ?auto_498976 ) ( CLEAR ?auto_498973 ) ( ON ?auto_498974 ?auto_498975 ) ( CLEAR ?auto_498974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_498973 ?auto_498974 )
      ( MAKE-12PILE ?auto_498973 ?auto_498974 ?auto_498975 ?auto_498976 ?auto_498977 ?auto_498978 ?auto_498979 ?auto_498980 ?auto_498981 ?auto_498982 ?auto_498983 ?auto_498984 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_499023 - BLOCK
      ?auto_499024 - BLOCK
      ?auto_499025 - BLOCK
      ?auto_499026 - BLOCK
      ?auto_499027 - BLOCK
      ?auto_499028 - BLOCK
      ?auto_499029 - BLOCK
      ?auto_499030 - BLOCK
      ?auto_499031 - BLOCK
      ?auto_499032 - BLOCK
      ?auto_499033 - BLOCK
      ?auto_499034 - BLOCK
    )
    :vars
    (
      ?auto_499035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499034 ?auto_499035 ) ( not ( = ?auto_499023 ?auto_499024 ) ) ( not ( = ?auto_499023 ?auto_499025 ) ) ( not ( = ?auto_499023 ?auto_499026 ) ) ( not ( = ?auto_499023 ?auto_499027 ) ) ( not ( = ?auto_499023 ?auto_499028 ) ) ( not ( = ?auto_499023 ?auto_499029 ) ) ( not ( = ?auto_499023 ?auto_499030 ) ) ( not ( = ?auto_499023 ?auto_499031 ) ) ( not ( = ?auto_499023 ?auto_499032 ) ) ( not ( = ?auto_499023 ?auto_499033 ) ) ( not ( = ?auto_499023 ?auto_499034 ) ) ( not ( = ?auto_499023 ?auto_499035 ) ) ( not ( = ?auto_499024 ?auto_499025 ) ) ( not ( = ?auto_499024 ?auto_499026 ) ) ( not ( = ?auto_499024 ?auto_499027 ) ) ( not ( = ?auto_499024 ?auto_499028 ) ) ( not ( = ?auto_499024 ?auto_499029 ) ) ( not ( = ?auto_499024 ?auto_499030 ) ) ( not ( = ?auto_499024 ?auto_499031 ) ) ( not ( = ?auto_499024 ?auto_499032 ) ) ( not ( = ?auto_499024 ?auto_499033 ) ) ( not ( = ?auto_499024 ?auto_499034 ) ) ( not ( = ?auto_499024 ?auto_499035 ) ) ( not ( = ?auto_499025 ?auto_499026 ) ) ( not ( = ?auto_499025 ?auto_499027 ) ) ( not ( = ?auto_499025 ?auto_499028 ) ) ( not ( = ?auto_499025 ?auto_499029 ) ) ( not ( = ?auto_499025 ?auto_499030 ) ) ( not ( = ?auto_499025 ?auto_499031 ) ) ( not ( = ?auto_499025 ?auto_499032 ) ) ( not ( = ?auto_499025 ?auto_499033 ) ) ( not ( = ?auto_499025 ?auto_499034 ) ) ( not ( = ?auto_499025 ?auto_499035 ) ) ( not ( = ?auto_499026 ?auto_499027 ) ) ( not ( = ?auto_499026 ?auto_499028 ) ) ( not ( = ?auto_499026 ?auto_499029 ) ) ( not ( = ?auto_499026 ?auto_499030 ) ) ( not ( = ?auto_499026 ?auto_499031 ) ) ( not ( = ?auto_499026 ?auto_499032 ) ) ( not ( = ?auto_499026 ?auto_499033 ) ) ( not ( = ?auto_499026 ?auto_499034 ) ) ( not ( = ?auto_499026 ?auto_499035 ) ) ( not ( = ?auto_499027 ?auto_499028 ) ) ( not ( = ?auto_499027 ?auto_499029 ) ) ( not ( = ?auto_499027 ?auto_499030 ) ) ( not ( = ?auto_499027 ?auto_499031 ) ) ( not ( = ?auto_499027 ?auto_499032 ) ) ( not ( = ?auto_499027 ?auto_499033 ) ) ( not ( = ?auto_499027 ?auto_499034 ) ) ( not ( = ?auto_499027 ?auto_499035 ) ) ( not ( = ?auto_499028 ?auto_499029 ) ) ( not ( = ?auto_499028 ?auto_499030 ) ) ( not ( = ?auto_499028 ?auto_499031 ) ) ( not ( = ?auto_499028 ?auto_499032 ) ) ( not ( = ?auto_499028 ?auto_499033 ) ) ( not ( = ?auto_499028 ?auto_499034 ) ) ( not ( = ?auto_499028 ?auto_499035 ) ) ( not ( = ?auto_499029 ?auto_499030 ) ) ( not ( = ?auto_499029 ?auto_499031 ) ) ( not ( = ?auto_499029 ?auto_499032 ) ) ( not ( = ?auto_499029 ?auto_499033 ) ) ( not ( = ?auto_499029 ?auto_499034 ) ) ( not ( = ?auto_499029 ?auto_499035 ) ) ( not ( = ?auto_499030 ?auto_499031 ) ) ( not ( = ?auto_499030 ?auto_499032 ) ) ( not ( = ?auto_499030 ?auto_499033 ) ) ( not ( = ?auto_499030 ?auto_499034 ) ) ( not ( = ?auto_499030 ?auto_499035 ) ) ( not ( = ?auto_499031 ?auto_499032 ) ) ( not ( = ?auto_499031 ?auto_499033 ) ) ( not ( = ?auto_499031 ?auto_499034 ) ) ( not ( = ?auto_499031 ?auto_499035 ) ) ( not ( = ?auto_499032 ?auto_499033 ) ) ( not ( = ?auto_499032 ?auto_499034 ) ) ( not ( = ?auto_499032 ?auto_499035 ) ) ( not ( = ?auto_499033 ?auto_499034 ) ) ( not ( = ?auto_499033 ?auto_499035 ) ) ( not ( = ?auto_499034 ?auto_499035 ) ) ( ON ?auto_499033 ?auto_499034 ) ( ON ?auto_499032 ?auto_499033 ) ( ON ?auto_499031 ?auto_499032 ) ( ON ?auto_499030 ?auto_499031 ) ( ON ?auto_499029 ?auto_499030 ) ( ON ?auto_499028 ?auto_499029 ) ( ON ?auto_499027 ?auto_499028 ) ( ON ?auto_499026 ?auto_499027 ) ( ON ?auto_499025 ?auto_499026 ) ( ON ?auto_499024 ?auto_499025 ) ( ON ?auto_499023 ?auto_499024 ) ( CLEAR ?auto_499023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_499023 )
      ( MAKE-12PILE ?auto_499023 ?auto_499024 ?auto_499025 ?auto_499026 ?auto_499027 ?auto_499028 ?auto_499029 ?auto_499030 ?auto_499031 ?auto_499032 ?auto_499033 ?auto_499034 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499074 - BLOCK
      ?auto_499075 - BLOCK
      ?auto_499076 - BLOCK
      ?auto_499077 - BLOCK
      ?auto_499078 - BLOCK
      ?auto_499079 - BLOCK
      ?auto_499080 - BLOCK
      ?auto_499081 - BLOCK
      ?auto_499082 - BLOCK
      ?auto_499083 - BLOCK
      ?auto_499084 - BLOCK
      ?auto_499085 - BLOCK
      ?auto_499086 - BLOCK
    )
    :vars
    (
      ?auto_499087 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_499085 ) ( ON ?auto_499086 ?auto_499087 ) ( CLEAR ?auto_499086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_499074 ) ( ON ?auto_499075 ?auto_499074 ) ( ON ?auto_499076 ?auto_499075 ) ( ON ?auto_499077 ?auto_499076 ) ( ON ?auto_499078 ?auto_499077 ) ( ON ?auto_499079 ?auto_499078 ) ( ON ?auto_499080 ?auto_499079 ) ( ON ?auto_499081 ?auto_499080 ) ( ON ?auto_499082 ?auto_499081 ) ( ON ?auto_499083 ?auto_499082 ) ( ON ?auto_499084 ?auto_499083 ) ( ON ?auto_499085 ?auto_499084 ) ( not ( = ?auto_499074 ?auto_499075 ) ) ( not ( = ?auto_499074 ?auto_499076 ) ) ( not ( = ?auto_499074 ?auto_499077 ) ) ( not ( = ?auto_499074 ?auto_499078 ) ) ( not ( = ?auto_499074 ?auto_499079 ) ) ( not ( = ?auto_499074 ?auto_499080 ) ) ( not ( = ?auto_499074 ?auto_499081 ) ) ( not ( = ?auto_499074 ?auto_499082 ) ) ( not ( = ?auto_499074 ?auto_499083 ) ) ( not ( = ?auto_499074 ?auto_499084 ) ) ( not ( = ?auto_499074 ?auto_499085 ) ) ( not ( = ?auto_499074 ?auto_499086 ) ) ( not ( = ?auto_499074 ?auto_499087 ) ) ( not ( = ?auto_499075 ?auto_499076 ) ) ( not ( = ?auto_499075 ?auto_499077 ) ) ( not ( = ?auto_499075 ?auto_499078 ) ) ( not ( = ?auto_499075 ?auto_499079 ) ) ( not ( = ?auto_499075 ?auto_499080 ) ) ( not ( = ?auto_499075 ?auto_499081 ) ) ( not ( = ?auto_499075 ?auto_499082 ) ) ( not ( = ?auto_499075 ?auto_499083 ) ) ( not ( = ?auto_499075 ?auto_499084 ) ) ( not ( = ?auto_499075 ?auto_499085 ) ) ( not ( = ?auto_499075 ?auto_499086 ) ) ( not ( = ?auto_499075 ?auto_499087 ) ) ( not ( = ?auto_499076 ?auto_499077 ) ) ( not ( = ?auto_499076 ?auto_499078 ) ) ( not ( = ?auto_499076 ?auto_499079 ) ) ( not ( = ?auto_499076 ?auto_499080 ) ) ( not ( = ?auto_499076 ?auto_499081 ) ) ( not ( = ?auto_499076 ?auto_499082 ) ) ( not ( = ?auto_499076 ?auto_499083 ) ) ( not ( = ?auto_499076 ?auto_499084 ) ) ( not ( = ?auto_499076 ?auto_499085 ) ) ( not ( = ?auto_499076 ?auto_499086 ) ) ( not ( = ?auto_499076 ?auto_499087 ) ) ( not ( = ?auto_499077 ?auto_499078 ) ) ( not ( = ?auto_499077 ?auto_499079 ) ) ( not ( = ?auto_499077 ?auto_499080 ) ) ( not ( = ?auto_499077 ?auto_499081 ) ) ( not ( = ?auto_499077 ?auto_499082 ) ) ( not ( = ?auto_499077 ?auto_499083 ) ) ( not ( = ?auto_499077 ?auto_499084 ) ) ( not ( = ?auto_499077 ?auto_499085 ) ) ( not ( = ?auto_499077 ?auto_499086 ) ) ( not ( = ?auto_499077 ?auto_499087 ) ) ( not ( = ?auto_499078 ?auto_499079 ) ) ( not ( = ?auto_499078 ?auto_499080 ) ) ( not ( = ?auto_499078 ?auto_499081 ) ) ( not ( = ?auto_499078 ?auto_499082 ) ) ( not ( = ?auto_499078 ?auto_499083 ) ) ( not ( = ?auto_499078 ?auto_499084 ) ) ( not ( = ?auto_499078 ?auto_499085 ) ) ( not ( = ?auto_499078 ?auto_499086 ) ) ( not ( = ?auto_499078 ?auto_499087 ) ) ( not ( = ?auto_499079 ?auto_499080 ) ) ( not ( = ?auto_499079 ?auto_499081 ) ) ( not ( = ?auto_499079 ?auto_499082 ) ) ( not ( = ?auto_499079 ?auto_499083 ) ) ( not ( = ?auto_499079 ?auto_499084 ) ) ( not ( = ?auto_499079 ?auto_499085 ) ) ( not ( = ?auto_499079 ?auto_499086 ) ) ( not ( = ?auto_499079 ?auto_499087 ) ) ( not ( = ?auto_499080 ?auto_499081 ) ) ( not ( = ?auto_499080 ?auto_499082 ) ) ( not ( = ?auto_499080 ?auto_499083 ) ) ( not ( = ?auto_499080 ?auto_499084 ) ) ( not ( = ?auto_499080 ?auto_499085 ) ) ( not ( = ?auto_499080 ?auto_499086 ) ) ( not ( = ?auto_499080 ?auto_499087 ) ) ( not ( = ?auto_499081 ?auto_499082 ) ) ( not ( = ?auto_499081 ?auto_499083 ) ) ( not ( = ?auto_499081 ?auto_499084 ) ) ( not ( = ?auto_499081 ?auto_499085 ) ) ( not ( = ?auto_499081 ?auto_499086 ) ) ( not ( = ?auto_499081 ?auto_499087 ) ) ( not ( = ?auto_499082 ?auto_499083 ) ) ( not ( = ?auto_499082 ?auto_499084 ) ) ( not ( = ?auto_499082 ?auto_499085 ) ) ( not ( = ?auto_499082 ?auto_499086 ) ) ( not ( = ?auto_499082 ?auto_499087 ) ) ( not ( = ?auto_499083 ?auto_499084 ) ) ( not ( = ?auto_499083 ?auto_499085 ) ) ( not ( = ?auto_499083 ?auto_499086 ) ) ( not ( = ?auto_499083 ?auto_499087 ) ) ( not ( = ?auto_499084 ?auto_499085 ) ) ( not ( = ?auto_499084 ?auto_499086 ) ) ( not ( = ?auto_499084 ?auto_499087 ) ) ( not ( = ?auto_499085 ?auto_499086 ) ) ( not ( = ?auto_499085 ?auto_499087 ) ) ( not ( = ?auto_499086 ?auto_499087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_499086 ?auto_499087 )
      ( !STACK ?auto_499086 ?auto_499085 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499128 - BLOCK
      ?auto_499129 - BLOCK
      ?auto_499130 - BLOCK
      ?auto_499131 - BLOCK
      ?auto_499132 - BLOCK
      ?auto_499133 - BLOCK
      ?auto_499134 - BLOCK
      ?auto_499135 - BLOCK
      ?auto_499136 - BLOCK
      ?auto_499137 - BLOCK
      ?auto_499138 - BLOCK
      ?auto_499139 - BLOCK
      ?auto_499140 - BLOCK
    )
    :vars
    (
      ?auto_499141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499140 ?auto_499141 ) ( ON-TABLE ?auto_499128 ) ( ON ?auto_499129 ?auto_499128 ) ( ON ?auto_499130 ?auto_499129 ) ( ON ?auto_499131 ?auto_499130 ) ( ON ?auto_499132 ?auto_499131 ) ( ON ?auto_499133 ?auto_499132 ) ( ON ?auto_499134 ?auto_499133 ) ( ON ?auto_499135 ?auto_499134 ) ( ON ?auto_499136 ?auto_499135 ) ( ON ?auto_499137 ?auto_499136 ) ( ON ?auto_499138 ?auto_499137 ) ( not ( = ?auto_499128 ?auto_499129 ) ) ( not ( = ?auto_499128 ?auto_499130 ) ) ( not ( = ?auto_499128 ?auto_499131 ) ) ( not ( = ?auto_499128 ?auto_499132 ) ) ( not ( = ?auto_499128 ?auto_499133 ) ) ( not ( = ?auto_499128 ?auto_499134 ) ) ( not ( = ?auto_499128 ?auto_499135 ) ) ( not ( = ?auto_499128 ?auto_499136 ) ) ( not ( = ?auto_499128 ?auto_499137 ) ) ( not ( = ?auto_499128 ?auto_499138 ) ) ( not ( = ?auto_499128 ?auto_499139 ) ) ( not ( = ?auto_499128 ?auto_499140 ) ) ( not ( = ?auto_499128 ?auto_499141 ) ) ( not ( = ?auto_499129 ?auto_499130 ) ) ( not ( = ?auto_499129 ?auto_499131 ) ) ( not ( = ?auto_499129 ?auto_499132 ) ) ( not ( = ?auto_499129 ?auto_499133 ) ) ( not ( = ?auto_499129 ?auto_499134 ) ) ( not ( = ?auto_499129 ?auto_499135 ) ) ( not ( = ?auto_499129 ?auto_499136 ) ) ( not ( = ?auto_499129 ?auto_499137 ) ) ( not ( = ?auto_499129 ?auto_499138 ) ) ( not ( = ?auto_499129 ?auto_499139 ) ) ( not ( = ?auto_499129 ?auto_499140 ) ) ( not ( = ?auto_499129 ?auto_499141 ) ) ( not ( = ?auto_499130 ?auto_499131 ) ) ( not ( = ?auto_499130 ?auto_499132 ) ) ( not ( = ?auto_499130 ?auto_499133 ) ) ( not ( = ?auto_499130 ?auto_499134 ) ) ( not ( = ?auto_499130 ?auto_499135 ) ) ( not ( = ?auto_499130 ?auto_499136 ) ) ( not ( = ?auto_499130 ?auto_499137 ) ) ( not ( = ?auto_499130 ?auto_499138 ) ) ( not ( = ?auto_499130 ?auto_499139 ) ) ( not ( = ?auto_499130 ?auto_499140 ) ) ( not ( = ?auto_499130 ?auto_499141 ) ) ( not ( = ?auto_499131 ?auto_499132 ) ) ( not ( = ?auto_499131 ?auto_499133 ) ) ( not ( = ?auto_499131 ?auto_499134 ) ) ( not ( = ?auto_499131 ?auto_499135 ) ) ( not ( = ?auto_499131 ?auto_499136 ) ) ( not ( = ?auto_499131 ?auto_499137 ) ) ( not ( = ?auto_499131 ?auto_499138 ) ) ( not ( = ?auto_499131 ?auto_499139 ) ) ( not ( = ?auto_499131 ?auto_499140 ) ) ( not ( = ?auto_499131 ?auto_499141 ) ) ( not ( = ?auto_499132 ?auto_499133 ) ) ( not ( = ?auto_499132 ?auto_499134 ) ) ( not ( = ?auto_499132 ?auto_499135 ) ) ( not ( = ?auto_499132 ?auto_499136 ) ) ( not ( = ?auto_499132 ?auto_499137 ) ) ( not ( = ?auto_499132 ?auto_499138 ) ) ( not ( = ?auto_499132 ?auto_499139 ) ) ( not ( = ?auto_499132 ?auto_499140 ) ) ( not ( = ?auto_499132 ?auto_499141 ) ) ( not ( = ?auto_499133 ?auto_499134 ) ) ( not ( = ?auto_499133 ?auto_499135 ) ) ( not ( = ?auto_499133 ?auto_499136 ) ) ( not ( = ?auto_499133 ?auto_499137 ) ) ( not ( = ?auto_499133 ?auto_499138 ) ) ( not ( = ?auto_499133 ?auto_499139 ) ) ( not ( = ?auto_499133 ?auto_499140 ) ) ( not ( = ?auto_499133 ?auto_499141 ) ) ( not ( = ?auto_499134 ?auto_499135 ) ) ( not ( = ?auto_499134 ?auto_499136 ) ) ( not ( = ?auto_499134 ?auto_499137 ) ) ( not ( = ?auto_499134 ?auto_499138 ) ) ( not ( = ?auto_499134 ?auto_499139 ) ) ( not ( = ?auto_499134 ?auto_499140 ) ) ( not ( = ?auto_499134 ?auto_499141 ) ) ( not ( = ?auto_499135 ?auto_499136 ) ) ( not ( = ?auto_499135 ?auto_499137 ) ) ( not ( = ?auto_499135 ?auto_499138 ) ) ( not ( = ?auto_499135 ?auto_499139 ) ) ( not ( = ?auto_499135 ?auto_499140 ) ) ( not ( = ?auto_499135 ?auto_499141 ) ) ( not ( = ?auto_499136 ?auto_499137 ) ) ( not ( = ?auto_499136 ?auto_499138 ) ) ( not ( = ?auto_499136 ?auto_499139 ) ) ( not ( = ?auto_499136 ?auto_499140 ) ) ( not ( = ?auto_499136 ?auto_499141 ) ) ( not ( = ?auto_499137 ?auto_499138 ) ) ( not ( = ?auto_499137 ?auto_499139 ) ) ( not ( = ?auto_499137 ?auto_499140 ) ) ( not ( = ?auto_499137 ?auto_499141 ) ) ( not ( = ?auto_499138 ?auto_499139 ) ) ( not ( = ?auto_499138 ?auto_499140 ) ) ( not ( = ?auto_499138 ?auto_499141 ) ) ( not ( = ?auto_499139 ?auto_499140 ) ) ( not ( = ?auto_499139 ?auto_499141 ) ) ( not ( = ?auto_499140 ?auto_499141 ) ) ( CLEAR ?auto_499138 ) ( ON ?auto_499139 ?auto_499140 ) ( CLEAR ?auto_499139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_499128 ?auto_499129 ?auto_499130 ?auto_499131 ?auto_499132 ?auto_499133 ?auto_499134 ?auto_499135 ?auto_499136 ?auto_499137 ?auto_499138 ?auto_499139 )
      ( MAKE-13PILE ?auto_499128 ?auto_499129 ?auto_499130 ?auto_499131 ?auto_499132 ?auto_499133 ?auto_499134 ?auto_499135 ?auto_499136 ?auto_499137 ?auto_499138 ?auto_499139 ?auto_499140 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499182 - BLOCK
      ?auto_499183 - BLOCK
      ?auto_499184 - BLOCK
      ?auto_499185 - BLOCK
      ?auto_499186 - BLOCK
      ?auto_499187 - BLOCK
      ?auto_499188 - BLOCK
      ?auto_499189 - BLOCK
      ?auto_499190 - BLOCK
      ?auto_499191 - BLOCK
      ?auto_499192 - BLOCK
      ?auto_499193 - BLOCK
      ?auto_499194 - BLOCK
    )
    :vars
    (
      ?auto_499195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499194 ?auto_499195 ) ( ON-TABLE ?auto_499182 ) ( ON ?auto_499183 ?auto_499182 ) ( ON ?auto_499184 ?auto_499183 ) ( ON ?auto_499185 ?auto_499184 ) ( ON ?auto_499186 ?auto_499185 ) ( ON ?auto_499187 ?auto_499186 ) ( ON ?auto_499188 ?auto_499187 ) ( ON ?auto_499189 ?auto_499188 ) ( ON ?auto_499190 ?auto_499189 ) ( ON ?auto_499191 ?auto_499190 ) ( not ( = ?auto_499182 ?auto_499183 ) ) ( not ( = ?auto_499182 ?auto_499184 ) ) ( not ( = ?auto_499182 ?auto_499185 ) ) ( not ( = ?auto_499182 ?auto_499186 ) ) ( not ( = ?auto_499182 ?auto_499187 ) ) ( not ( = ?auto_499182 ?auto_499188 ) ) ( not ( = ?auto_499182 ?auto_499189 ) ) ( not ( = ?auto_499182 ?auto_499190 ) ) ( not ( = ?auto_499182 ?auto_499191 ) ) ( not ( = ?auto_499182 ?auto_499192 ) ) ( not ( = ?auto_499182 ?auto_499193 ) ) ( not ( = ?auto_499182 ?auto_499194 ) ) ( not ( = ?auto_499182 ?auto_499195 ) ) ( not ( = ?auto_499183 ?auto_499184 ) ) ( not ( = ?auto_499183 ?auto_499185 ) ) ( not ( = ?auto_499183 ?auto_499186 ) ) ( not ( = ?auto_499183 ?auto_499187 ) ) ( not ( = ?auto_499183 ?auto_499188 ) ) ( not ( = ?auto_499183 ?auto_499189 ) ) ( not ( = ?auto_499183 ?auto_499190 ) ) ( not ( = ?auto_499183 ?auto_499191 ) ) ( not ( = ?auto_499183 ?auto_499192 ) ) ( not ( = ?auto_499183 ?auto_499193 ) ) ( not ( = ?auto_499183 ?auto_499194 ) ) ( not ( = ?auto_499183 ?auto_499195 ) ) ( not ( = ?auto_499184 ?auto_499185 ) ) ( not ( = ?auto_499184 ?auto_499186 ) ) ( not ( = ?auto_499184 ?auto_499187 ) ) ( not ( = ?auto_499184 ?auto_499188 ) ) ( not ( = ?auto_499184 ?auto_499189 ) ) ( not ( = ?auto_499184 ?auto_499190 ) ) ( not ( = ?auto_499184 ?auto_499191 ) ) ( not ( = ?auto_499184 ?auto_499192 ) ) ( not ( = ?auto_499184 ?auto_499193 ) ) ( not ( = ?auto_499184 ?auto_499194 ) ) ( not ( = ?auto_499184 ?auto_499195 ) ) ( not ( = ?auto_499185 ?auto_499186 ) ) ( not ( = ?auto_499185 ?auto_499187 ) ) ( not ( = ?auto_499185 ?auto_499188 ) ) ( not ( = ?auto_499185 ?auto_499189 ) ) ( not ( = ?auto_499185 ?auto_499190 ) ) ( not ( = ?auto_499185 ?auto_499191 ) ) ( not ( = ?auto_499185 ?auto_499192 ) ) ( not ( = ?auto_499185 ?auto_499193 ) ) ( not ( = ?auto_499185 ?auto_499194 ) ) ( not ( = ?auto_499185 ?auto_499195 ) ) ( not ( = ?auto_499186 ?auto_499187 ) ) ( not ( = ?auto_499186 ?auto_499188 ) ) ( not ( = ?auto_499186 ?auto_499189 ) ) ( not ( = ?auto_499186 ?auto_499190 ) ) ( not ( = ?auto_499186 ?auto_499191 ) ) ( not ( = ?auto_499186 ?auto_499192 ) ) ( not ( = ?auto_499186 ?auto_499193 ) ) ( not ( = ?auto_499186 ?auto_499194 ) ) ( not ( = ?auto_499186 ?auto_499195 ) ) ( not ( = ?auto_499187 ?auto_499188 ) ) ( not ( = ?auto_499187 ?auto_499189 ) ) ( not ( = ?auto_499187 ?auto_499190 ) ) ( not ( = ?auto_499187 ?auto_499191 ) ) ( not ( = ?auto_499187 ?auto_499192 ) ) ( not ( = ?auto_499187 ?auto_499193 ) ) ( not ( = ?auto_499187 ?auto_499194 ) ) ( not ( = ?auto_499187 ?auto_499195 ) ) ( not ( = ?auto_499188 ?auto_499189 ) ) ( not ( = ?auto_499188 ?auto_499190 ) ) ( not ( = ?auto_499188 ?auto_499191 ) ) ( not ( = ?auto_499188 ?auto_499192 ) ) ( not ( = ?auto_499188 ?auto_499193 ) ) ( not ( = ?auto_499188 ?auto_499194 ) ) ( not ( = ?auto_499188 ?auto_499195 ) ) ( not ( = ?auto_499189 ?auto_499190 ) ) ( not ( = ?auto_499189 ?auto_499191 ) ) ( not ( = ?auto_499189 ?auto_499192 ) ) ( not ( = ?auto_499189 ?auto_499193 ) ) ( not ( = ?auto_499189 ?auto_499194 ) ) ( not ( = ?auto_499189 ?auto_499195 ) ) ( not ( = ?auto_499190 ?auto_499191 ) ) ( not ( = ?auto_499190 ?auto_499192 ) ) ( not ( = ?auto_499190 ?auto_499193 ) ) ( not ( = ?auto_499190 ?auto_499194 ) ) ( not ( = ?auto_499190 ?auto_499195 ) ) ( not ( = ?auto_499191 ?auto_499192 ) ) ( not ( = ?auto_499191 ?auto_499193 ) ) ( not ( = ?auto_499191 ?auto_499194 ) ) ( not ( = ?auto_499191 ?auto_499195 ) ) ( not ( = ?auto_499192 ?auto_499193 ) ) ( not ( = ?auto_499192 ?auto_499194 ) ) ( not ( = ?auto_499192 ?auto_499195 ) ) ( not ( = ?auto_499193 ?auto_499194 ) ) ( not ( = ?auto_499193 ?auto_499195 ) ) ( not ( = ?auto_499194 ?auto_499195 ) ) ( ON ?auto_499193 ?auto_499194 ) ( CLEAR ?auto_499191 ) ( ON ?auto_499192 ?auto_499193 ) ( CLEAR ?auto_499192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_499182 ?auto_499183 ?auto_499184 ?auto_499185 ?auto_499186 ?auto_499187 ?auto_499188 ?auto_499189 ?auto_499190 ?auto_499191 ?auto_499192 )
      ( MAKE-13PILE ?auto_499182 ?auto_499183 ?auto_499184 ?auto_499185 ?auto_499186 ?auto_499187 ?auto_499188 ?auto_499189 ?auto_499190 ?auto_499191 ?auto_499192 ?auto_499193 ?auto_499194 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499236 - BLOCK
      ?auto_499237 - BLOCK
      ?auto_499238 - BLOCK
      ?auto_499239 - BLOCK
      ?auto_499240 - BLOCK
      ?auto_499241 - BLOCK
      ?auto_499242 - BLOCK
      ?auto_499243 - BLOCK
      ?auto_499244 - BLOCK
      ?auto_499245 - BLOCK
      ?auto_499246 - BLOCK
      ?auto_499247 - BLOCK
      ?auto_499248 - BLOCK
    )
    :vars
    (
      ?auto_499249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499248 ?auto_499249 ) ( ON-TABLE ?auto_499236 ) ( ON ?auto_499237 ?auto_499236 ) ( ON ?auto_499238 ?auto_499237 ) ( ON ?auto_499239 ?auto_499238 ) ( ON ?auto_499240 ?auto_499239 ) ( ON ?auto_499241 ?auto_499240 ) ( ON ?auto_499242 ?auto_499241 ) ( ON ?auto_499243 ?auto_499242 ) ( ON ?auto_499244 ?auto_499243 ) ( not ( = ?auto_499236 ?auto_499237 ) ) ( not ( = ?auto_499236 ?auto_499238 ) ) ( not ( = ?auto_499236 ?auto_499239 ) ) ( not ( = ?auto_499236 ?auto_499240 ) ) ( not ( = ?auto_499236 ?auto_499241 ) ) ( not ( = ?auto_499236 ?auto_499242 ) ) ( not ( = ?auto_499236 ?auto_499243 ) ) ( not ( = ?auto_499236 ?auto_499244 ) ) ( not ( = ?auto_499236 ?auto_499245 ) ) ( not ( = ?auto_499236 ?auto_499246 ) ) ( not ( = ?auto_499236 ?auto_499247 ) ) ( not ( = ?auto_499236 ?auto_499248 ) ) ( not ( = ?auto_499236 ?auto_499249 ) ) ( not ( = ?auto_499237 ?auto_499238 ) ) ( not ( = ?auto_499237 ?auto_499239 ) ) ( not ( = ?auto_499237 ?auto_499240 ) ) ( not ( = ?auto_499237 ?auto_499241 ) ) ( not ( = ?auto_499237 ?auto_499242 ) ) ( not ( = ?auto_499237 ?auto_499243 ) ) ( not ( = ?auto_499237 ?auto_499244 ) ) ( not ( = ?auto_499237 ?auto_499245 ) ) ( not ( = ?auto_499237 ?auto_499246 ) ) ( not ( = ?auto_499237 ?auto_499247 ) ) ( not ( = ?auto_499237 ?auto_499248 ) ) ( not ( = ?auto_499237 ?auto_499249 ) ) ( not ( = ?auto_499238 ?auto_499239 ) ) ( not ( = ?auto_499238 ?auto_499240 ) ) ( not ( = ?auto_499238 ?auto_499241 ) ) ( not ( = ?auto_499238 ?auto_499242 ) ) ( not ( = ?auto_499238 ?auto_499243 ) ) ( not ( = ?auto_499238 ?auto_499244 ) ) ( not ( = ?auto_499238 ?auto_499245 ) ) ( not ( = ?auto_499238 ?auto_499246 ) ) ( not ( = ?auto_499238 ?auto_499247 ) ) ( not ( = ?auto_499238 ?auto_499248 ) ) ( not ( = ?auto_499238 ?auto_499249 ) ) ( not ( = ?auto_499239 ?auto_499240 ) ) ( not ( = ?auto_499239 ?auto_499241 ) ) ( not ( = ?auto_499239 ?auto_499242 ) ) ( not ( = ?auto_499239 ?auto_499243 ) ) ( not ( = ?auto_499239 ?auto_499244 ) ) ( not ( = ?auto_499239 ?auto_499245 ) ) ( not ( = ?auto_499239 ?auto_499246 ) ) ( not ( = ?auto_499239 ?auto_499247 ) ) ( not ( = ?auto_499239 ?auto_499248 ) ) ( not ( = ?auto_499239 ?auto_499249 ) ) ( not ( = ?auto_499240 ?auto_499241 ) ) ( not ( = ?auto_499240 ?auto_499242 ) ) ( not ( = ?auto_499240 ?auto_499243 ) ) ( not ( = ?auto_499240 ?auto_499244 ) ) ( not ( = ?auto_499240 ?auto_499245 ) ) ( not ( = ?auto_499240 ?auto_499246 ) ) ( not ( = ?auto_499240 ?auto_499247 ) ) ( not ( = ?auto_499240 ?auto_499248 ) ) ( not ( = ?auto_499240 ?auto_499249 ) ) ( not ( = ?auto_499241 ?auto_499242 ) ) ( not ( = ?auto_499241 ?auto_499243 ) ) ( not ( = ?auto_499241 ?auto_499244 ) ) ( not ( = ?auto_499241 ?auto_499245 ) ) ( not ( = ?auto_499241 ?auto_499246 ) ) ( not ( = ?auto_499241 ?auto_499247 ) ) ( not ( = ?auto_499241 ?auto_499248 ) ) ( not ( = ?auto_499241 ?auto_499249 ) ) ( not ( = ?auto_499242 ?auto_499243 ) ) ( not ( = ?auto_499242 ?auto_499244 ) ) ( not ( = ?auto_499242 ?auto_499245 ) ) ( not ( = ?auto_499242 ?auto_499246 ) ) ( not ( = ?auto_499242 ?auto_499247 ) ) ( not ( = ?auto_499242 ?auto_499248 ) ) ( not ( = ?auto_499242 ?auto_499249 ) ) ( not ( = ?auto_499243 ?auto_499244 ) ) ( not ( = ?auto_499243 ?auto_499245 ) ) ( not ( = ?auto_499243 ?auto_499246 ) ) ( not ( = ?auto_499243 ?auto_499247 ) ) ( not ( = ?auto_499243 ?auto_499248 ) ) ( not ( = ?auto_499243 ?auto_499249 ) ) ( not ( = ?auto_499244 ?auto_499245 ) ) ( not ( = ?auto_499244 ?auto_499246 ) ) ( not ( = ?auto_499244 ?auto_499247 ) ) ( not ( = ?auto_499244 ?auto_499248 ) ) ( not ( = ?auto_499244 ?auto_499249 ) ) ( not ( = ?auto_499245 ?auto_499246 ) ) ( not ( = ?auto_499245 ?auto_499247 ) ) ( not ( = ?auto_499245 ?auto_499248 ) ) ( not ( = ?auto_499245 ?auto_499249 ) ) ( not ( = ?auto_499246 ?auto_499247 ) ) ( not ( = ?auto_499246 ?auto_499248 ) ) ( not ( = ?auto_499246 ?auto_499249 ) ) ( not ( = ?auto_499247 ?auto_499248 ) ) ( not ( = ?auto_499247 ?auto_499249 ) ) ( not ( = ?auto_499248 ?auto_499249 ) ) ( ON ?auto_499247 ?auto_499248 ) ( ON ?auto_499246 ?auto_499247 ) ( CLEAR ?auto_499244 ) ( ON ?auto_499245 ?auto_499246 ) ( CLEAR ?auto_499245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_499236 ?auto_499237 ?auto_499238 ?auto_499239 ?auto_499240 ?auto_499241 ?auto_499242 ?auto_499243 ?auto_499244 ?auto_499245 )
      ( MAKE-13PILE ?auto_499236 ?auto_499237 ?auto_499238 ?auto_499239 ?auto_499240 ?auto_499241 ?auto_499242 ?auto_499243 ?auto_499244 ?auto_499245 ?auto_499246 ?auto_499247 ?auto_499248 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499290 - BLOCK
      ?auto_499291 - BLOCK
      ?auto_499292 - BLOCK
      ?auto_499293 - BLOCK
      ?auto_499294 - BLOCK
      ?auto_499295 - BLOCK
      ?auto_499296 - BLOCK
      ?auto_499297 - BLOCK
      ?auto_499298 - BLOCK
      ?auto_499299 - BLOCK
      ?auto_499300 - BLOCK
      ?auto_499301 - BLOCK
      ?auto_499302 - BLOCK
    )
    :vars
    (
      ?auto_499303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499302 ?auto_499303 ) ( ON-TABLE ?auto_499290 ) ( ON ?auto_499291 ?auto_499290 ) ( ON ?auto_499292 ?auto_499291 ) ( ON ?auto_499293 ?auto_499292 ) ( ON ?auto_499294 ?auto_499293 ) ( ON ?auto_499295 ?auto_499294 ) ( ON ?auto_499296 ?auto_499295 ) ( ON ?auto_499297 ?auto_499296 ) ( not ( = ?auto_499290 ?auto_499291 ) ) ( not ( = ?auto_499290 ?auto_499292 ) ) ( not ( = ?auto_499290 ?auto_499293 ) ) ( not ( = ?auto_499290 ?auto_499294 ) ) ( not ( = ?auto_499290 ?auto_499295 ) ) ( not ( = ?auto_499290 ?auto_499296 ) ) ( not ( = ?auto_499290 ?auto_499297 ) ) ( not ( = ?auto_499290 ?auto_499298 ) ) ( not ( = ?auto_499290 ?auto_499299 ) ) ( not ( = ?auto_499290 ?auto_499300 ) ) ( not ( = ?auto_499290 ?auto_499301 ) ) ( not ( = ?auto_499290 ?auto_499302 ) ) ( not ( = ?auto_499290 ?auto_499303 ) ) ( not ( = ?auto_499291 ?auto_499292 ) ) ( not ( = ?auto_499291 ?auto_499293 ) ) ( not ( = ?auto_499291 ?auto_499294 ) ) ( not ( = ?auto_499291 ?auto_499295 ) ) ( not ( = ?auto_499291 ?auto_499296 ) ) ( not ( = ?auto_499291 ?auto_499297 ) ) ( not ( = ?auto_499291 ?auto_499298 ) ) ( not ( = ?auto_499291 ?auto_499299 ) ) ( not ( = ?auto_499291 ?auto_499300 ) ) ( not ( = ?auto_499291 ?auto_499301 ) ) ( not ( = ?auto_499291 ?auto_499302 ) ) ( not ( = ?auto_499291 ?auto_499303 ) ) ( not ( = ?auto_499292 ?auto_499293 ) ) ( not ( = ?auto_499292 ?auto_499294 ) ) ( not ( = ?auto_499292 ?auto_499295 ) ) ( not ( = ?auto_499292 ?auto_499296 ) ) ( not ( = ?auto_499292 ?auto_499297 ) ) ( not ( = ?auto_499292 ?auto_499298 ) ) ( not ( = ?auto_499292 ?auto_499299 ) ) ( not ( = ?auto_499292 ?auto_499300 ) ) ( not ( = ?auto_499292 ?auto_499301 ) ) ( not ( = ?auto_499292 ?auto_499302 ) ) ( not ( = ?auto_499292 ?auto_499303 ) ) ( not ( = ?auto_499293 ?auto_499294 ) ) ( not ( = ?auto_499293 ?auto_499295 ) ) ( not ( = ?auto_499293 ?auto_499296 ) ) ( not ( = ?auto_499293 ?auto_499297 ) ) ( not ( = ?auto_499293 ?auto_499298 ) ) ( not ( = ?auto_499293 ?auto_499299 ) ) ( not ( = ?auto_499293 ?auto_499300 ) ) ( not ( = ?auto_499293 ?auto_499301 ) ) ( not ( = ?auto_499293 ?auto_499302 ) ) ( not ( = ?auto_499293 ?auto_499303 ) ) ( not ( = ?auto_499294 ?auto_499295 ) ) ( not ( = ?auto_499294 ?auto_499296 ) ) ( not ( = ?auto_499294 ?auto_499297 ) ) ( not ( = ?auto_499294 ?auto_499298 ) ) ( not ( = ?auto_499294 ?auto_499299 ) ) ( not ( = ?auto_499294 ?auto_499300 ) ) ( not ( = ?auto_499294 ?auto_499301 ) ) ( not ( = ?auto_499294 ?auto_499302 ) ) ( not ( = ?auto_499294 ?auto_499303 ) ) ( not ( = ?auto_499295 ?auto_499296 ) ) ( not ( = ?auto_499295 ?auto_499297 ) ) ( not ( = ?auto_499295 ?auto_499298 ) ) ( not ( = ?auto_499295 ?auto_499299 ) ) ( not ( = ?auto_499295 ?auto_499300 ) ) ( not ( = ?auto_499295 ?auto_499301 ) ) ( not ( = ?auto_499295 ?auto_499302 ) ) ( not ( = ?auto_499295 ?auto_499303 ) ) ( not ( = ?auto_499296 ?auto_499297 ) ) ( not ( = ?auto_499296 ?auto_499298 ) ) ( not ( = ?auto_499296 ?auto_499299 ) ) ( not ( = ?auto_499296 ?auto_499300 ) ) ( not ( = ?auto_499296 ?auto_499301 ) ) ( not ( = ?auto_499296 ?auto_499302 ) ) ( not ( = ?auto_499296 ?auto_499303 ) ) ( not ( = ?auto_499297 ?auto_499298 ) ) ( not ( = ?auto_499297 ?auto_499299 ) ) ( not ( = ?auto_499297 ?auto_499300 ) ) ( not ( = ?auto_499297 ?auto_499301 ) ) ( not ( = ?auto_499297 ?auto_499302 ) ) ( not ( = ?auto_499297 ?auto_499303 ) ) ( not ( = ?auto_499298 ?auto_499299 ) ) ( not ( = ?auto_499298 ?auto_499300 ) ) ( not ( = ?auto_499298 ?auto_499301 ) ) ( not ( = ?auto_499298 ?auto_499302 ) ) ( not ( = ?auto_499298 ?auto_499303 ) ) ( not ( = ?auto_499299 ?auto_499300 ) ) ( not ( = ?auto_499299 ?auto_499301 ) ) ( not ( = ?auto_499299 ?auto_499302 ) ) ( not ( = ?auto_499299 ?auto_499303 ) ) ( not ( = ?auto_499300 ?auto_499301 ) ) ( not ( = ?auto_499300 ?auto_499302 ) ) ( not ( = ?auto_499300 ?auto_499303 ) ) ( not ( = ?auto_499301 ?auto_499302 ) ) ( not ( = ?auto_499301 ?auto_499303 ) ) ( not ( = ?auto_499302 ?auto_499303 ) ) ( ON ?auto_499301 ?auto_499302 ) ( ON ?auto_499300 ?auto_499301 ) ( ON ?auto_499299 ?auto_499300 ) ( CLEAR ?auto_499297 ) ( ON ?auto_499298 ?auto_499299 ) ( CLEAR ?auto_499298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_499290 ?auto_499291 ?auto_499292 ?auto_499293 ?auto_499294 ?auto_499295 ?auto_499296 ?auto_499297 ?auto_499298 )
      ( MAKE-13PILE ?auto_499290 ?auto_499291 ?auto_499292 ?auto_499293 ?auto_499294 ?auto_499295 ?auto_499296 ?auto_499297 ?auto_499298 ?auto_499299 ?auto_499300 ?auto_499301 ?auto_499302 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499344 - BLOCK
      ?auto_499345 - BLOCK
      ?auto_499346 - BLOCK
      ?auto_499347 - BLOCK
      ?auto_499348 - BLOCK
      ?auto_499349 - BLOCK
      ?auto_499350 - BLOCK
      ?auto_499351 - BLOCK
      ?auto_499352 - BLOCK
      ?auto_499353 - BLOCK
      ?auto_499354 - BLOCK
      ?auto_499355 - BLOCK
      ?auto_499356 - BLOCK
    )
    :vars
    (
      ?auto_499357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499356 ?auto_499357 ) ( ON-TABLE ?auto_499344 ) ( ON ?auto_499345 ?auto_499344 ) ( ON ?auto_499346 ?auto_499345 ) ( ON ?auto_499347 ?auto_499346 ) ( ON ?auto_499348 ?auto_499347 ) ( ON ?auto_499349 ?auto_499348 ) ( ON ?auto_499350 ?auto_499349 ) ( not ( = ?auto_499344 ?auto_499345 ) ) ( not ( = ?auto_499344 ?auto_499346 ) ) ( not ( = ?auto_499344 ?auto_499347 ) ) ( not ( = ?auto_499344 ?auto_499348 ) ) ( not ( = ?auto_499344 ?auto_499349 ) ) ( not ( = ?auto_499344 ?auto_499350 ) ) ( not ( = ?auto_499344 ?auto_499351 ) ) ( not ( = ?auto_499344 ?auto_499352 ) ) ( not ( = ?auto_499344 ?auto_499353 ) ) ( not ( = ?auto_499344 ?auto_499354 ) ) ( not ( = ?auto_499344 ?auto_499355 ) ) ( not ( = ?auto_499344 ?auto_499356 ) ) ( not ( = ?auto_499344 ?auto_499357 ) ) ( not ( = ?auto_499345 ?auto_499346 ) ) ( not ( = ?auto_499345 ?auto_499347 ) ) ( not ( = ?auto_499345 ?auto_499348 ) ) ( not ( = ?auto_499345 ?auto_499349 ) ) ( not ( = ?auto_499345 ?auto_499350 ) ) ( not ( = ?auto_499345 ?auto_499351 ) ) ( not ( = ?auto_499345 ?auto_499352 ) ) ( not ( = ?auto_499345 ?auto_499353 ) ) ( not ( = ?auto_499345 ?auto_499354 ) ) ( not ( = ?auto_499345 ?auto_499355 ) ) ( not ( = ?auto_499345 ?auto_499356 ) ) ( not ( = ?auto_499345 ?auto_499357 ) ) ( not ( = ?auto_499346 ?auto_499347 ) ) ( not ( = ?auto_499346 ?auto_499348 ) ) ( not ( = ?auto_499346 ?auto_499349 ) ) ( not ( = ?auto_499346 ?auto_499350 ) ) ( not ( = ?auto_499346 ?auto_499351 ) ) ( not ( = ?auto_499346 ?auto_499352 ) ) ( not ( = ?auto_499346 ?auto_499353 ) ) ( not ( = ?auto_499346 ?auto_499354 ) ) ( not ( = ?auto_499346 ?auto_499355 ) ) ( not ( = ?auto_499346 ?auto_499356 ) ) ( not ( = ?auto_499346 ?auto_499357 ) ) ( not ( = ?auto_499347 ?auto_499348 ) ) ( not ( = ?auto_499347 ?auto_499349 ) ) ( not ( = ?auto_499347 ?auto_499350 ) ) ( not ( = ?auto_499347 ?auto_499351 ) ) ( not ( = ?auto_499347 ?auto_499352 ) ) ( not ( = ?auto_499347 ?auto_499353 ) ) ( not ( = ?auto_499347 ?auto_499354 ) ) ( not ( = ?auto_499347 ?auto_499355 ) ) ( not ( = ?auto_499347 ?auto_499356 ) ) ( not ( = ?auto_499347 ?auto_499357 ) ) ( not ( = ?auto_499348 ?auto_499349 ) ) ( not ( = ?auto_499348 ?auto_499350 ) ) ( not ( = ?auto_499348 ?auto_499351 ) ) ( not ( = ?auto_499348 ?auto_499352 ) ) ( not ( = ?auto_499348 ?auto_499353 ) ) ( not ( = ?auto_499348 ?auto_499354 ) ) ( not ( = ?auto_499348 ?auto_499355 ) ) ( not ( = ?auto_499348 ?auto_499356 ) ) ( not ( = ?auto_499348 ?auto_499357 ) ) ( not ( = ?auto_499349 ?auto_499350 ) ) ( not ( = ?auto_499349 ?auto_499351 ) ) ( not ( = ?auto_499349 ?auto_499352 ) ) ( not ( = ?auto_499349 ?auto_499353 ) ) ( not ( = ?auto_499349 ?auto_499354 ) ) ( not ( = ?auto_499349 ?auto_499355 ) ) ( not ( = ?auto_499349 ?auto_499356 ) ) ( not ( = ?auto_499349 ?auto_499357 ) ) ( not ( = ?auto_499350 ?auto_499351 ) ) ( not ( = ?auto_499350 ?auto_499352 ) ) ( not ( = ?auto_499350 ?auto_499353 ) ) ( not ( = ?auto_499350 ?auto_499354 ) ) ( not ( = ?auto_499350 ?auto_499355 ) ) ( not ( = ?auto_499350 ?auto_499356 ) ) ( not ( = ?auto_499350 ?auto_499357 ) ) ( not ( = ?auto_499351 ?auto_499352 ) ) ( not ( = ?auto_499351 ?auto_499353 ) ) ( not ( = ?auto_499351 ?auto_499354 ) ) ( not ( = ?auto_499351 ?auto_499355 ) ) ( not ( = ?auto_499351 ?auto_499356 ) ) ( not ( = ?auto_499351 ?auto_499357 ) ) ( not ( = ?auto_499352 ?auto_499353 ) ) ( not ( = ?auto_499352 ?auto_499354 ) ) ( not ( = ?auto_499352 ?auto_499355 ) ) ( not ( = ?auto_499352 ?auto_499356 ) ) ( not ( = ?auto_499352 ?auto_499357 ) ) ( not ( = ?auto_499353 ?auto_499354 ) ) ( not ( = ?auto_499353 ?auto_499355 ) ) ( not ( = ?auto_499353 ?auto_499356 ) ) ( not ( = ?auto_499353 ?auto_499357 ) ) ( not ( = ?auto_499354 ?auto_499355 ) ) ( not ( = ?auto_499354 ?auto_499356 ) ) ( not ( = ?auto_499354 ?auto_499357 ) ) ( not ( = ?auto_499355 ?auto_499356 ) ) ( not ( = ?auto_499355 ?auto_499357 ) ) ( not ( = ?auto_499356 ?auto_499357 ) ) ( ON ?auto_499355 ?auto_499356 ) ( ON ?auto_499354 ?auto_499355 ) ( ON ?auto_499353 ?auto_499354 ) ( ON ?auto_499352 ?auto_499353 ) ( CLEAR ?auto_499350 ) ( ON ?auto_499351 ?auto_499352 ) ( CLEAR ?auto_499351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_499344 ?auto_499345 ?auto_499346 ?auto_499347 ?auto_499348 ?auto_499349 ?auto_499350 ?auto_499351 )
      ( MAKE-13PILE ?auto_499344 ?auto_499345 ?auto_499346 ?auto_499347 ?auto_499348 ?auto_499349 ?auto_499350 ?auto_499351 ?auto_499352 ?auto_499353 ?auto_499354 ?auto_499355 ?auto_499356 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499398 - BLOCK
      ?auto_499399 - BLOCK
      ?auto_499400 - BLOCK
      ?auto_499401 - BLOCK
      ?auto_499402 - BLOCK
      ?auto_499403 - BLOCK
      ?auto_499404 - BLOCK
      ?auto_499405 - BLOCK
      ?auto_499406 - BLOCK
      ?auto_499407 - BLOCK
      ?auto_499408 - BLOCK
      ?auto_499409 - BLOCK
      ?auto_499410 - BLOCK
    )
    :vars
    (
      ?auto_499411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499410 ?auto_499411 ) ( ON-TABLE ?auto_499398 ) ( ON ?auto_499399 ?auto_499398 ) ( ON ?auto_499400 ?auto_499399 ) ( ON ?auto_499401 ?auto_499400 ) ( ON ?auto_499402 ?auto_499401 ) ( ON ?auto_499403 ?auto_499402 ) ( not ( = ?auto_499398 ?auto_499399 ) ) ( not ( = ?auto_499398 ?auto_499400 ) ) ( not ( = ?auto_499398 ?auto_499401 ) ) ( not ( = ?auto_499398 ?auto_499402 ) ) ( not ( = ?auto_499398 ?auto_499403 ) ) ( not ( = ?auto_499398 ?auto_499404 ) ) ( not ( = ?auto_499398 ?auto_499405 ) ) ( not ( = ?auto_499398 ?auto_499406 ) ) ( not ( = ?auto_499398 ?auto_499407 ) ) ( not ( = ?auto_499398 ?auto_499408 ) ) ( not ( = ?auto_499398 ?auto_499409 ) ) ( not ( = ?auto_499398 ?auto_499410 ) ) ( not ( = ?auto_499398 ?auto_499411 ) ) ( not ( = ?auto_499399 ?auto_499400 ) ) ( not ( = ?auto_499399 ?auto_499401 ) ) ( not ( = ?auto_499399 ?auto_499402 ) ) ( not ( = ?auto_499399 ?auto_499403 ) ) ( not ( = ?auto_499399 ?auto_499404 ) ) ( not ( = ?auto_499399 ?auto_499405 ) ) ( not ( = ?auto_499399 ?auto_499406 ) ) ( not ( = ?auto_499399 ?auto_499407 ) ) ( not ( = ?auto_499399 ?auto_499408 ) ) ( not ( = ?auto_499399 ?auto_499409 ) ) ( not ( = ?auto_499399 ?auto_499410 ) ) ( not ( = ?auto_499399 ?auto_499411 ) ) ( not ( = ?auto_499400 ?auto_499401 ) ) ( not ( = ?auto_499400 ?auto_499402 ) ) ( not ( = ?auto_499400 ?auto_499403 ) ) ( not ( = ?auto_499400 ?auto_499404 ) ) ( not ( = ?auto_499400 ?auto_499405 ) ) ( not ( = ?auto_499400 ?auto_499406 ) ) ( not ( = ?auto_499400 ?auto_499407 ) ) ( not ( = ?auto_499400 ?auto_499408 ) ) ( not ( = ?auto_499400 ?auto_499409 ) ) ( not ( = ?auto_499400 ?auto_499410 ) ) ( not ( = ?auto_499400 ?auto_499411 ) ) ( not ( = ?auto_499401 ?auto_499402 ) ) ( not ( = ?auto_499401 ?auto_499403 ) ) ( not ( = ?auto_499401 ?auto_499404 ) ) ( not ( = ?auto_499401 ?auto_499405 ) ) ( not ( = ?auto_499401 ?auto_499406 ) ) ( not ( = ?auto_499401 ?auto_499407 ) ) ( not ( = ?auto_499401 ?auto_499408 ) ) ( not ( = ?auto_499401 ?auto_499409 ) ) ( not ( = ?auto_499401 ?auto_499410 ) ) ( not ( = ?auto_499401 ?auto_499411 ) ) ( not ( = ?auto_499402 ?auto_499403 ) ) ( not ( = ?auto_499402 ?auto_499404 ) ) ( not ( = ?auto_499402 ?auto_499405 ) ) ( not ( = ?auto_499402 ?auto_499406 ) ) ( not ( = ?auto_499402 ?auto_499407 ) ) ( not ( = ?auto_499402 ?auto_499408 ) ) ( not ( = ?auto_499402 ?auto_499409 ) ) ( not ( = ?auto_499402 ?auto_499410 ) ) ( not ( = ?auto_499402 ?auto_499411 ) ) ( not ( = ?auto_499403 ?auto_499404 ) ) ( not ( = ?auto_499403 ?auto_499405 ) ) ( not ( = ?auto_499403 ?auto_499406 ) ) ( not ( = ?auto_499403 ?auto_499407 ) ) ( not ( = ?auto_499403 ?auto_499408 ) ) ( not ( = ?auto_499403 ?auto_499409 ) ) ( not ( = ?auto_499403 ?auto_499410 ) ) ( not ( = ?auto_499403 ?auto_499411 ) ) ( not ( = ?auto_499404 ?auto_499405 ) ) ( not ( = ?auto_499404 ?auto_499406 ) ) ( not ( = ?auto_499404 ?auto_499407 ) ) ( not ( = ?auto_499404 ?auto_499408 ) ) ( not ( = ?auto_499404 ?auto_499409 ) ) ( not ( = ?auto_499404 ?auto_499410 ) ) ( not ( = ?auto_499404 ?auto_499411 ) ) ( not ( = ?auto_499405 ?auto_499406 ) ) ( not ( = ?auto_499405 ?auto_499407 ) ) ( not ( = ?auto_499405 ?auto_499408 ) ) ( not ( = ?auto_499405 ?auto_499409 ) ) ( not ( = ?auto_499405 ?auto_499410 ) ) ( not ( = ?auto_499405 ?auto_499411 ) ) ( not ( = ?auto_499406 ?auto_499407 ) ) ( not ( = ?auto_499406 ?auto_499408 ) ) ( not ( = ?auto_499406 ?auto_499409 ) ) ( not ( = ?auto_499406 ?auto_499410 ) ) ( not ( = ?auto_499406 ?auto_499411 ) ) ( not ( = ?auto_499407 ?auto_499408 ) ) ( not ( = ?auto_499407 ?auto_499409 ) ) ( not ( = ?auto_499407 ?auto_499410 ) ) ( not ( = ?auto_499407 ?auto_499411 ) ) ( not ( = ?auto_499408 ?auto_499409 ) ) ( not ( = ?auto_499408 ?auto_499410 ) ) ( not ( = ?auto_499408 ?auto_499411 ) ) ( not ( = ?auto_499409 ?auto_499410 ) ) ( not ( = ?auto_499409 ?auto_499411 ) ) ( not ( = ?auto_499410 ?auto_499411 ) ) ( ON ?auto_499409 ?auto_499410 ) ( ON ?auto_499408 ?auto_499409 ) ( ON ?auto_499407 ?auto_499408 ) ( ON ?auto_499406 ?auto_499407 ) ( ON ?auto_499405 ?auto_499406 ) ( CLEAR ?auto_499403 ) ( ON ?auto_499404 ?auto_499405 ) ( CLEAR ?auto_499404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_499398 ?auto_499399 ?auto_499400 ?auto_499401 ?auto_499402 ?auto_499403 ?auto_499404 )
      ( MAKE-13PILE ?auto_499398 ?auto_499399 ?auto_499400 ?auto_499401 ?auto_499402 ?auto_499403 ?auto_499404 ?auto_499405 ?auto_499406 ?auto_499407 ?auto_499408 ?auto_499409 ?auto_499410 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499452 - BLOCK
      ?auto_499453 - BLOCK
      ?auto_499454 - BLOCK
      ?auto_499455 - BLOCK
      ?auto_499456 - BLOCK
      ?auto_499457 - BLOCK
      ?auto_499458 - BLOCK
      ?auto_499459 - BLOCK
      ?auto_499460 - BLOCK
      ?auto_499461 - BLOCK
      ?auto_499462 - BLOCK
      ?auto_499463 - BLOCK
      ?auto_499464 - BLOCK
    )
    :vars
    (
      ?auto_499465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499464 ?auto_499465 ) ( ON-TABLE ?auto_499452 ) ( ON ?auto_499453 ?auto_499452 ) ( ON ?auto_499454 ?auto_499453 ) ( ON ?auto_499455 ?auto_499454 ) ( ON ?auto_499456 ?auto_499455 ) ( not ( = ?auto_499452 ?auto_499453 ) ) ( not ( = ?auto_499452 ?auto_499454 ) ) ( not ( = ?auto_499452 ?auto_499455 ) ) ( not ( = ?auto_499452 ?auto_499456 ) ) ( not ( = ?auto_499452 ?auto_499457 ) ) ( not ( = ?auto_499452 ?auto_499458 ) ) ( not ( = ?auto_499452 ?auto_499459 ) ) ( not ( = ?auto_499452 ?auto_499460 ) ) ( not ( = ?auto_499452 ?auto_499461 ) ) ( not ( = ?auto_499452 ?auto_499462 ) ) ( not ( = ?auto_499452 ?auto_499463 ) ) ( not ( = ?auto_499452 ?auto_499464 ) ) ( not ( = ?auto_499452 ?auto_499465 ) ) ( not ( = ?auto_499453 ?auto_499454 ) ) ( not ( = ?auto_499453 ?auto_499455 ) ) ( not ( = ?auto_499453 ?auto_499456 ) ) ( not ( = ?auto_499453 ?auto_499457 ) ) ( not ( = ?auto_499453 ?auto_499458 ) ) ( not ( = ?auto_499453 ?auto_499459 ) ) ( not ( = ?auto_499453 ?auto_499460 ) ) ( not ( = ?auto_499453 ?auto_499461 ) ) ( not ( = ?auto_499453 ?auto_499462 ) ) ( not ( = ?auto_499453 ?auto_499463 ) ) ( not ( = ?auto_499453 ?auto_499464 ) ) ( not ( = ?auto_499453 ?auto_499465 ) ) ( not ( = ?auto_499454 ?auto_499455 ) ) ( not ( = ?auto_499454 ?auto_499456 ) ) ( not ( = ?auto_499454 ?auto_499457 ) ) ( not ( = ?auto_499454 ?auto_499458 ) ) ( not ( = ?auto_499454 ?auto_499459 ) ) ( not ( = ?auto_499454 ?auto_499460 ) ) ( not ( = ?auto_499454 ?auto_499461 ) ) ( not ( = ?auto_499454 ?auto_499462 ) ) ( not ( = ?auto_499454 ?auto_499463 ) ) ( not ( = ?auto_499454 ?auto_499464 ) ) ( not ( = ?auto_499454 ?auto_499465 ) ) ( not ( = ?auto_499455 ?auto_499456 ) ) ( not ( = ?auto_499455 ?auto_499457 ) ) ( not ( = ?auto_499455 ?auto_499458 ) ) ( not ( = ?auto_499455 ?auto_499459 ) ) ( not ( = ?auto_499455 ?auto_499460 ) ) ( not ( = ?auto_499455 ?auto_499461 ) ) ( not ( = ?auto_499455 ?auto_499462 ) ) ( not ( = ?auto_499455 ?auto_499463 ) ) ( not ( = ?auto_499455 ?auto_499464 ) ) ( not ( = ?auto_499455 ?auto_499465 ) ) ( not ( = ?auto_499456 ?auto_499457 ) ) ( not ( = ?auto_499456 ?auto_499458 ) ) ( not ( = ?auto_499456 ?auto_499459 ) ) ( not ( = ?auto_499456 ?auto_499460 ) ) ( not ( = ?auto_499456 ?auto_499461 ) ) ( not ( = ?auto_499456 ?auto_499462 ) ) ( not ( = ?auto_499456 ?auto_499463 ) ) ( not ( = ?auto_499456 ?auto_499464 ) ) ( not ( = ?auto_499456 ?auto_499465 ) ) ( not ( = ?auto_499457 ?auto_499458 ) ) ( not ( = ?auto_499457 ?auto_499459 ) ) ( not ( = ?auto_499457 ?auto_499460 ) ) ( not ( = ?auto_499457 ?auto_499461 ) ) ( not ( = ?auto_499457 ?auto_499462 ) ) ( not ( = ?auto_499457 ?auto_499463 ) ) ( not ( = ?auto_499457 ?auto_499464 ) ) ( not ( = ?auto_499457 ?auto_499465 ) ) ( not ( = ?auto_499458 ?auto_499459 ) ) ( not ( = ?auto_499458 ?auto_499460 ) ) ( not ( = ?auto_499458 ?auto_499461 ) ) ( not ( = ?auto_499458 ?auto_499462 ) ) ( not ( = ?auto_499458 ?auto_499463 ) ) ( not ( = ?auto_499458 ?auto_499464 ) ) ( not ( = ?auto_499458 ?auto_499465 ) ) ( not ( = ?auto_499459 ?auto_499460 ) ) ( not ( = ?auto_499459 ?auto_499461 ) ) ( not ( = ?auto_499459 ?auto_499462 ) ) ( not ( = ?auto_499459 ?auto_499463 ) ) ( not ( = ?auto_499459 ?auto_499464 ) ) ( not ( = ?auto_499459 ?auto_499465 ) ) ( not ( = ?auto_499460 ?auto_499461 ) ) ( not ( = ?auto_499460 ?auto_499462 ) ) ( not ( = ?auto_499460 ?auto_499463 ) ) ( not ( = ?auto_499460 ?auto_499464 ) ) ( not ( = ?auto_499460 ?auto_499465 ) ) ( not ( = ?auto_499461 ?auto_499462 ) ) ( not ( = ?auto_499461 ?auto_499463 ) ) ( not ( = ?auto_499461 ?auto_499464 ) ) ( not ( = ?auto_499461 ?auto_499465 ) ) ( not ( = ?auto_499462 ?auto_499463 ) ) ( not ( = ?auto_499462 ?auto_499464 ) ) ( not ( = ?auto_499462 ?auto_499465 ) ) ( not ( = ?auto_499463 ?auto_499464 ) ) ( not ( = ?auto_499463 ?auto_499465 ) ) ( not ( = ?auto_499464 ?auto_499465 ) ) ( ON ?auto_499463 ?auto_499464 ) ( ON ?auto_499462 ?auto_499463 ) ( ON ?auto_499461 ?auto_499462 ) ( ON ?auto_499460 ?auto_499461 ) ( ON ?auto_499459 ?auto_499460 ) ( ON ?auto_499458 ?auto_499459 ) ( CLEAR ?auto_499456 ) ( ON ?auto_499457 ?auto_499458 ) ( CLEAR ?auto_499457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_499452 ?auto_499453 ?auto_499454 ?auto_499455 ?auto_499456 ?auto_499457 )
      ( MAKE-13PILE ?auto_499452 ?auto_499453 ?auto_499454 ?auto_499455 ?auto_499456 ?auto_499457 ?auto_499458 ?auto_499459 ?auto_499460 ?auto_499461 ?auto_499462 ?auto_499463 ?auto_499464 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499506 - BLOCK
      ?auto_499507 - BLOCK
      ?auto_499508 - BLOCK
      ?auto_499509 - BLOCK
      ?auto_499510 - BLOCK
      ?auto_499511 - BLOCK
      ?auto_499512 - BLOCK
      ?auto_499513 - BLOCK
      ?auto_499514 - BLOCK
      ?auto_499515 - BLOCK
      ?auto_499516 - BLOCK
      ?auto_499517 - BLOCK
      ?auto_499518 - BLOCK
    )
    :vars
    (
      ?auto_499519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499518 ?auto_499519 ) ( ON-TABLE ?auto_499506 ) ( ON ?auto_499507 ?auto_499506 ) ( ON ?auto_499508 ?auto_499507 ) ( ON ?auto_499509 ?auto_499508 ) ( not ( = ?auto_499506 ?auto_499507 ) ) ( not ( = ?auto_499506 ?auto_499508 ) ) ( not ( = ?auto_499506 ?auto_499509 ) ) ( not ( = ?auto_499506 ?auto_499510 ) ) ( not ( = ?auto_499506 ?auto_499511 ) ) ( not ( = ?auto_499506 ?auto_499512 ) ) ( not ( = ?auto_499506 ?auto_499513 ) ) ( not ( = ?auto_499506 ?auto_499514 ) ) ( not ( = ?auto_499506 ?auto_499515 ) ) ( not ( = ?auto_499506 ?auto_499516 ) ) ( not ( = ?auto_499506 ?auto_499517 ) ) ( not ( = ?auto_499506 ?auto_499518 ) ) ( not ( = ?auto_499506 ?auto_499519 ) ) ( not ( = ?auto_499507 ?auto_499508 ) ) ( not ( = ?auto_499507 ?auto_499509 ) ) ( not ( = ?auto_499507 ?auto_499510 ) ) ( not ( = ?auto_499507 ?auto_499511 ) ) ( not ( = ?auto_499507 ?auto_499512 ) ) ( not ( = ?auto_499507 ?auto_499513 ) ) ( not ( = ?auto_499507 ?auto_499514 ) ) ( not ( = ?auto_499507 ?auto_499515 ) ) ( not ( = ?auto_499507 ?auto_499516 ) ) ( not ( = ?auto_499507 ?auto_499517 ) ) ( not ( = ?auto_499507 ?auto_499518 ) ) ( not ( = ?auto_499507 ?auto_499519 ) ) ( not ( = ?auto_499508 ?auto_499509 ) ) ( not ( = ?auto_499508 ?auto_499510 ) ) ( not ( = ?auto_499508 ?auto_499511 ) ) ( not ( = ?auto_499508 ?auto_499512 ) ) ( not ( = ?auto_499508 ?auto_499513 ) ) ( not ( = ?auto_499508 ?auto_499514 ) ) ( not ( = ?auto_499508 ?auto_499515 ) ) ( not ( = ?auto_499508 ?auto_499516 ) ) ( not ( = ?auto_499508 ?auto_499517 ) ) ( not ( = ?auto_499508 ?auto_499518 ) ) ( not ( = ?auto_499508 ?auto_499519 ) ) ( not ( = ?auto_499509 ?auto_499510 ) ) ( not ( = ?auto_499509 ?auto_499511 ) ) ( not ( = ?auto_499509 ?auto_499512 ) ) ( not ( = ?auto_499509 ?auto_499513 ) ) ( not ( = ?auto_499509 ?auto_499514 ) ) ( not ( = ?auto_499509 ?auto_499515 ) ) ( not ( = ?auto_499509 ?auto_499516 ) ) ( not ( = ?auto_499509 ?auto_499517 ) ) ( not ( = ?auto_499509 ?auto_499518 ) ) ( not ( = ?auto_499509 ?auto_499519 ) ) ( not ( = ?auto_499510 ?auto_499511 ) ) ( not ( = ?auto_499510 ?auto_499512 ) ) ( not ( = ?auto_499510 ?auto_499513 ) ) ( not ( = ?auto_499510 ?auto_499514 ) ) ( not ( = ?auto_499510 ?auto_499515 ) ) ( not ( = ?auto_499510 ?auto_499516 ) ) ( not ( = ?auto_499510 ?auto_499517 ) ) ( not ( = ?auto_499510 ?auto_499518 ) ) ( not ( = ?auto_499510 ?auto_499519 ) ) ( not ( = ?auto_499511 ?auto_499512 ) ) ( not ( = ?auto_499511 ?auto_499513 ) ) ( not ( = ?auto_499511 ?auto_499514 ) ) ( not ( = ?auto_499511 ?auto_499515 ) ) ( not ( = ?auto_499511 ?auto_499516 ) ) ( not ( = ?auto_499511 ?auto_499517 ) ) ( not ( = ?auto_499511 ?auto_499518 ) ) ( not ( = ?auto_499511 ?auto_499519 ) ) ( not ( = ?auto_499512 ?auto_499513 ) ) ( not ( = ?auto_499512 ?auto_499514 ) ) ( not ( = ?auto_499512 ?auto_499515 ) ) ( not ( = ?auto_499512 ?auto_499516 ) ) ( not ( = ?auto_499512 ?auto_499517 ) ) ( not ( = ?auto_499512 ?auto_499518 ) ) ( not ( = ?auto_499512 ?auto_499519 ) ) ( not ( = ?auto_499513 ?auto_499514 ) ) ( not ( = ?auto_499513 ?auto_499515 ) ) ( not ( = ?auto_499513 ?auto_499516 ) ) ( not ( = ?auto_499513 ?auto_499517 ) ) ( not ( = ?auto_499513 ?auto_499518 ) ) ( not ( = ?auto_499513 ?auto_499519 ) ) ( not ( = ?auto_499514 ?auto_499515 ) ) ( not ( = ?auto_499514 ?auto_499516 ) ) ( not ( = ?auto_499514 ?auto_499517 ) ) ( not ( = ?auto_499514 ?auto_499518 ) ) ( not ( = ?auto_499514 ?auto_499519 ) ) ( not ( = ?auto_499515 ?auto_499516 ) ) ( not ( = ?auto_499515 ?auto_499517 ) ) ( not ( = ?auto_499515 ?auto_499518 ) ) ( not ( = ?auto_499515 ?auto_499519 ) ) ( not ( = ?auto_499516 ?auto_499517 ) ) ( not ( = ?auto_499516 ?auto_499518 ) ) ( not ( = ?auto_499516 ?auto_499519 ) ) ( not ( = ?auto_499517 ?auto_499518 ) ) ( not ( = ?auto_499517 ?auto_499519 ) ) ( not ( = ?auto_499518 ?auto_499519 ) ) ( ON ?auto_499517 ?auto_499518 ) ( ON ?auto_499516 ?auto_499517 ) ( ON ?auto_499515 ?auto_499516 ) ( ON ?auto_499514 ?auto_499515 ) ( ON ?auto_499513 ?auto_499514 ) ( ON ?auto_499512 ?auto_499513 ) ( ON ?auto_499511 ?auto_499512 ) ( CLEAR ?auto_499509 ) ( ON ?auto_499510 ?auto_499511 ) ( CLEAR ?auto_499510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_499506 ?auto_499507 ?auto_499508 ?auto_499509 ?auto_499510 )
      ( MAKE-13PILE ?auto_499506 ?auto_499507 ?auto_499508 ?auto_499509 ?auto_499510 ?auto_499511 ?auto_499512 ?auto_499513 ?auto_499514 ?auto_499515 ?auto_499516 ?auto_499517 ?auto_499518 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499560 - BLOCK
      ?auto_499561 - BLOCK
      ?auto_499562 - BLOCK
      ?auto_499563 - BLOCK
      ?auto_499564 - BLOCK
      ?auto_499565 - BLOCK
      ?auto_499566 - BLOCK
      ?auto_499567 - BLOCK
      ?auto_499568 - BLOCK
      ?auto_499569 - BLOCK
      ?auto_499570 - BLOCK
      ?auto_499571 - BLOCK
      ?auto_499572 - BLOCK
    )
    :vars
    (
      ?auto_499573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499572 ?auto_499573 ) ( ON-TABLE ?auto_499560 ) ( ON ?auto_499561 ?auto_499560 ) ( ON ?auto_499562 ?auto_499561 ) ( not ( = ?auto_499560 ?auto_499561 ) ) ( not ( = ?auto_499560 ?auto_499562 ) ) ( not ( = ?auto_499560 ?auto_499563 ) ) ( not ( = ?auto_499560 ?auto_499564 ) ) ( not ( = ?auto_499560 ?auto_499565 ) ) ( not ( = ?auto_499560 ?auto_499566 ) ) ( not ( = ?auto_499560 ?auto_499567 ) ) ( not ( = ?auto_499560 ?auto_499568 ) ) ( not ( = ?auto_499560 ?auto_499569 ) ) ( not ( = ?auto_499560 ?auto_499570 ) ) ( not ( = ?auto_499560 ?auto_499571 ) ) ( not ( = ?auto_499560 ?auto_499572 ) ) ( not ( = ?auto_499560 ?auto_499573 ) ) ( not ( = ?auto_499561 ?auto_499562 ) ) ( not ( = ?auto_499561 ?auto_499563 ) ) ( not ( = ?auto_499561 ?auto_499564 ) ) ( not ( = ?auto_499561 ?auto_499565 ) ) ( not ( = ?auto_499561 ?auto_499566 ) ) ( not ( = ?auto_499561 ?auto_499567 ) ) ( not ( = ?auto_499561 ?auto_499568 ) ) ( not ( = ?auto_499561 ?auto_499569 ) ) ( not ( = ?auto_499561 ?auto_499570 ) ) ( not ( = ?auto_499561 ?auto_499571 ) ) ( not ( = ?auto_499561 ?auto_499572 ) ) ( not ( = ?auto_499561 ?auto_499573 ) ) ( not ( = ?auto_499562 ?auto_499563 ) ) ( not ( = ?auto_499562 ?auto_499564 ) ) ( not ( = ?auto_499562 ?auto_499565 ) ) ( not ( = ?auto_499562 ?auto_499566 ) ) ( not ( = ?auto_499562 ?auto_499567 ) ) ( not ( = ?auto_499562 ?auto_499568 ) ) ( not ( = ?auto_499562 ?auto_499569 ) ) ( not ( = ?auto_499562 ?auto_499570 ) ) ( not ( = ?auto_499562 ?auto_499571 ) ) ( not ( = ?auto_499562 ?auto_499572 ) ) ( not ( = ?auto_499562 ?auto_499573 ) ) ( not ( = ?auto_499563 ?auto_499564 ) ) ( not ( = ?auto_499563 ?auto_499565 ) ) ( not ( = ?auto_499563 ?auto_499566 ) ) ( not ( = ?auto_499563 ?auto_499567 ) ) ( not ( = ?auto_499563 ?auto_499568 ) ) ( not ( = ?auto_499563 ?auto_499569 ) ) ( not ( = ?auto_499563 ?auto_499570 ) ) ( not ( = ?auto_499563 ?auto_499571 ) ) ( not ( = ?auto_499563 ?auto_499572 ) ) ( not ( = ?auto_499563 ?auto_499573 ) ) ( not ( = ?auto_499564 ?auto_499565 ) ) ( not ( = ?auto_499564 ?auto_499566 ) ) ( not ( = ?auto_499564 ?auto_499567 ) ) ( not ( = ?auto_499564 ?auto_499568 ) ) ( not ( = ?auto_499564 ?auto_499569 ) ) ( not ( = ?auto_499564 ?auto_499570 ) ) ( not ( = ?auto_499564 ?auto_499571 ) ) ( not ( = ?auto_499564 ?auto_499572 ) ) ( not ( = ?auto_499564 ?auto_499573 ) ) ( not ( = ?auto_499565 ?auto_499566 ) ) ( not ( = ?auto_499565 ?auto_499567 ) ) ( not ( = ?auto_499565 ?auto_499568 ) ) ( not ( = ?auto_499565 ?auto_499569 ) ) ( not ( = ?auto_499565 ?auto_499570 ) ) ( not ( = ?auto_499565 ?auto_499571 ) ) ( not ( = ?auto_499565 ?auto_499572 ) ) ( not ( = ?auto_499565 ?auto_499573 ) ) ( not ( = ?auto_499566 ?auto_499567 ) ) ( not ( = ?auto_499566 ?auto_499568 ) ) ( not ( = ?auto_499566 ?auto_499569 ) ) ( not ( = ?auto_499566 ?auto_499570 ) ) ( not ( = ?auto_499566 ?auto_499571 ) ) ( not ( = ?auto_499566 ?auto_499572 ) ) ( not ( = ?auto_499566 ?auto_499573 ) ) ( not ( = ?auto_499567 ?auto_499568 ) ) ( not ( = ?auto_499567 ?auto_499569 ) ) ( not ( = ?auto_499567 ?auto_499570 ) ) ( not ( = ?auto_499567 ?auto_499571 ) ) ( not ( = ?auto_499567 ?auto_499572 ) ) ( not ( = ?auto_499567 ?auto_499573 ) ) ( not ( = ?auto_499568 ?auto_499569 ) ) ( not ( = ?auto_499568 ?auto_499570 ) ) ( not ( = ?auto_499568 ?auto_499571 ) ) ( not ( = ?auto_499568 ?auto_499572 ) ) ( not ( = ?auto_499568 ?auto_499573 ) ) ( not ( = ?auto_499569 ?auto_499570 ) ) ( not ( = ?auto_499569 ?auto_499571 ) ) ( not ( = ?auto_499569 ?auto_499572 ) ) ( not ( = ?auto_499569 ?auto_499573 ) ) ( not ( = ?auto_499570 ?auto_499571 ) ) ( not ( = ?auto_499570 ?auto_499572 ) ) ( not ( = ?auto_499570 ?auto_499573 ) ) ( not ( = ?auto_499571 ?auto_499572 ) ) ( not ( = ?auto_499571 ?auto_499573 ) ) ( not ( = ?auto_499572 ?auto_499573 ) ) ( ON ?auto_499571 ?auto_499572 ) ( ON ?auto_499570 ?auto_499571 ) ( ON ?auto_499569 ?auto_499570 ) ( ON ?auto_499568 ?auto_499569 ) ( ON ?auto_499567 ?auto_499568 ) ( ON ?auto_499566 ?auto_499567 ) ( ON ?auto_499565 ?auto_499566 ) ( ON ?auto_499564 ?auto_499565 ) ( CLEAR ?auto_499562 ) ( ON ?auto_499563 ?auto_499564 ) ( CLEAR ?auto_499563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_499560 ?auto_499561 ?auto_499562 ?auto_499563 )
      ( MAKE-13PILE ?auto_499560 ?auto_499561 ?auto_499562 ?auto_499563 ?auto_499564 ?auto_499565 ?auto_499566 ?auto_499567 ?auto_499568 ?auto_499569 ?auto_499570 ?auto_499571 ?auto_499572 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499614 - BLOCK
      ?auto_499615 - BLOCK
      ?auto_499616 - BLOCK
      ?auto_499617 - BLOCK
      ?auto_499618 - BLOCK
      ?auto_499619 - BLOCK
      ?auto_499620 - BLOCK
      ?auto_499621 - BLOCK
      ?auto_499622 - BLOCK
      ?auto_499623 - BLOCK
      ?auto_499624 - BLOCK
      ?auto_499625 - BLOCK
      ?auto_499626 - BLOCK
    )
    :vars
    (
      ?auto_499627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499626 ?auto_499627 ) ( ON-TABLE ?auto_499614 ) ( ON ?auto_499615 ?auto_499614 ) ( not ( = ?auto_499614 ?auto_499615 ) ) ( not ( = ?auto_499614 ?auto_499616 ) ) ( not ( = ?auto_499614 ?auto_499617 ) ) ( not ( = ?auto_499614 ?auto_499618 ) ) ( not ( = ?auto_499614 ?auto_499619 ) ) ( not ( = ?auto_499614 ?auto_499620 ) ) ( not ( = ?auto_499614 ?auto_499621 ) ) ( not ( = ?auto_499614 ?auto_499622 ) ) ( not ( = ?auto_499614 ?auto_499623 ) ) ( not ( = ?auto_499614 ?auto_499624 ) ) ( not ( = ?auto_499614 ?auto_499625 ) ) ( not ( = ?auto_499614 ?auto_499626 ) ) ( not ( = ?auto_499614 ?auto_499627 ) ) ( not ( = ?auto_499615 ?auto_499616 ) ) ( not ( = ?auto_499615 ?auto_499617 ) ) ( not ( = ?auto_499615 ?auto_499618 ) ) ( not ( = ?auto_499615 ?auto_499619 ) ) ( not ( = ?auto_499615 ?auto_499620 ) ) ( not ( = ?auto_499615 ?auto_499621 ) ) ( not ( = ?auto_499615 ?auto_499622 ) ) ( not ( = ?auto_499615 ?auto_499623 ) ) ( not ( = ?auto_499615 ?auto_499624 ) ) ( not ( = ?auto_499615 ?auto_499625 ) ) ( not ( = ?auto_499615 ?auto_499626 ) ) ( not ( = ?auto_499615 ?auto_499627 ) ) ( not ( = ?auto_499616 ?auto_499617 ) ) ( not ( = ?auto_499616 ?auto_499618 ) ) ( not ( = ?auto_499616 ?auto_499619 ) ) ( not ( = ?auto_499616 ?auto_499620 ) ) ( not ( = ?auto_499616 ?auto_499621 ) ) ( not ( = ?auto_499616 ?auto_499622 ) ) ( not ( = ?auto_499616 ?auto_499623 ) ) ( not ( = ?auto_499616 ?auto_499624 ) ) ( not ( = ?auto_499616 ?auto_499625 ) ) ( not ( = ?auto_499616 ?auto_499626 ) ) ( not ( = ?auto_499616 ?auto_499627 ) ) ( not ( = ?auto_499617 ?auto_499618 ) ) ( not ( = ?auto_499617 ?auto_499619 ) ) ( not ( = ?auto_499617 ?auto_499620 ) ) ( not ( = ?auto_499617 ?auto_499621 ) ) ( not ( = ?auto_499617 ?auto_499622 ) ) ( not ( = ?auto_499617 ?auto_499623 ) ) ( not ( = ?auto_499617 ?auto_499624 ) ) ( not ( = ?auto_499617 ?auto_499625 ) ) ( not ( = ?auto_499617 ?auto_499626 ) ) ( not ( = ?auto_499617 ?auto_499627 ) ) ( not ( = ?auto_499618 ?auto_499619 ) ) ( not ( = ?auto_499618 ?auto_499620 ) ) ( not ( = ?auto_499618 ?auto_499621 ) ) ( not ( = ?auto_499618 ?auto_499622 ) ) ( not ( = ?auto_499618 ?auto_499623 ) ) ( not ( = ?auto_499618 ?auto_499624 ) ) ( not ( = ?auto_499618 ?auto_499625 ) ) ( not ( = ?auto_499618 ?auto_499626 ) ) ( not ( = ?auto_499618 ?auto_499627 ) ) ( not ( = ?auto_499619 ?auto_499620 ) ) ( not ( = ?auto_499619 ?auto_499621 ) ) ( not ( = ?auto_499619 ?auto_499622 ) ) ( not ( = ?auto_499619 ?auto_499623 ) ) ( not ( = ?auto_499619 ?auto_499624 ) ) ( not ( = ?auto_499619 ?auto_499625 ) ) ( not ( = ?auto_499619 ?auto_499626 ) ) ( not ( = ?auto_499619 ?auto_499627 ) ) ( not ( = ?auto_499620 ?auto_499621 ) ) ( not ( = ?auto_499620 ?auto_499622 ) ) ( not ( = ?auto_499620 ?auto_499623 ) ) ( not ( = ?auto_499620 ?auto_499624 ) ) ( not ( = ?auto_499620 ?auto_499625 ) ) ( not ( = ?auto_499620 ?auto_499626 ) ) ( not ( = ?auto_499620 ?auto_499627 ) ) ( not ( = ?auto_499621 ?auto_499622 ) ) ( not ( = ?auto_499621 ?auto_499623 ) ) ( not ( = ?auto_499621 ?auto_499624 ) ) ( not ( = ?auto_499621 ?auto_499625 ) ) ( not ( = ?auto_499621 ?auto_499626 ) ) ( not ( = ?auto_499621 ?auto_499627 ) ) ( not ( = ?auto_499622 ?auto_499623 ) ) ( not ( = ?auto_499622 ?auto_499624 ) ) ( not ( = ?auto_499622 ?auto_499625 ) ) ( not ( = ?auto_499622 ?auto_499626 ) ) ( not ( = ?auto_499622 ?auto_499627 ) ) ( not ( = ?auto_499623 ?auto_499624 ) ) ( not ( = ?auto_499623 ?auto_499625 ) ) ( not ( = ?auto_499623 ?auto_499626 ) ) ( not ( = ?auto_499623 ?auto_499627 ) ) ( not ( = ?auto_499624 ?auto_499625 ) ) ( not ( = ?auto_499624 ?auto_499626 ) ) ( not ( = ?auto_499624 ?auto_499627 ) ) ( not ( = ?auto_499625 ?auto_499626 ) ) ( not ( = ?auto_499625 ?auto_499627 ) ) ( not ( = ?auto_499626 ?auto_499627 ) ) ( ON ?auto_499625 ?auto_499626 ) ( ON ?auto_499624 ?auto_499625 ) ( ON ?auto_499623 ?auto_499624 ) ( ON ?auto_499622 ?auto_499623 ) ( ON ?auto_499621 ?auto_499622 ) ( ON ?auto_499620 ?auto_499621 ) ( ON ?auto_499619 ?auto_499620 ) ( ON ?auto_499618 ?auto_499619 ) ( ON ?auto_499617 ?auto_499618 ) ( CLEAR ?auto_499615 ) ( ON ?auto_499616 ?auto_499617 ) ( CLEAR ?auto_499616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_499614 ?auto_499615 ?auto_499616 )
      ( MAKE-13PILE ?auto_499614 ?auto_499615 ?auto_499616 ?auto_499617 ?auto_499618 ?auto_499619 ?auto_499620 ?auto_499621 ?auto_499622 ?auto_499623 ?auto_499624 ?auto_499625 ?auto_499626 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499668 - BLOCK
      ?auto_499669 - BLOCK
      ?auto_499670 - BLOCK
      ?auto_499671 - BLOCK
      ?auto_499672 - BLOCK
      ?auto_499673 - BLOCK
      ?auto_499674 - BLOCK
      ?auto_499675 - BLOCK
      ?auto_499676 - BLOCK
      ?auto_499677 - BLOCK
      ?auto_499678 - BLOCK
      ?auto_499679 - BLOCK
      ?auto_499680 - BLOCK
    )
    :vars
    (
      ?auto_499681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499680 ?auto_499681 ) ( ON-TABLE ?auto_499668 ) ( not ( = ?auto_499668 ?auto_499669 ) ) ( not ( = ?auto_499668 ?auto_499670 ) ) ( not ( = ?auto_499668 ?auto_499671 ) ) ( not ( = ?auto_499668 ?auto_499672 ) ) ( not ( = ?auto_499668 ?auto_499673 ) ) ( not ( = ?auto_499668 ?auto_499674 ) ) ( not ( = ?auto_499668 ?auto_499675 ) ) ( not ( = ?auto_499668 ?auto_499676 ) ) ( not ( = ?auto_499668 ?auto_499677 ) ) ( not ( = ?auto_499668 ?auto_499678 ) ) ( not ( = ?auto_499668 ?auto_499679 ) ) ( not ( = ?auto_499668 ?auto_499680 ) ) ( not ( = ?auto_499668 ?auto_499681 ) ) ( not ( = ?auto_499669 ?auto_499670 ) ) ( not ( = ?auto_499669 ?auto_499671 ) ) ( not ( = ?auto_499669 ?auto_499672 ) ) ( not ( = ?auto_499669 ?auto_499673 ) ) ( not ( = ?auto_499669 ?auto_499674 ) ) ( not ( = ?auto_499669 ?auto_499675 ) ) ( not ( = ?auto_499669 ?auto_499676 ) ) ( not ( = ?auto_499669 ?auto_499677 ) ) ( not ( = ?auto_499669 ?auto_499678 ) ) ( not ( = ?auto_499669 ?auto_499679 ) ) ( not ( = ?auto_499669 ?auto_499680 ) ) ( not ( = ?auto_499669 ?auto_499681 ) ) ( not ( = ?auto_499670 ?auto_499671 ) ) ( not ( = ?auto_499670 ?auto_499672 ) ) ( not ( = ?auto_499670 ?auto_499673 ) ) ( not ( = ?auto_499670 ?auto_499674 ) ) ( not ( = ?auto_499670 ?auto_499675 ) ) ( not ( = ?auto_499670 ?auto_499676 ) ) ( not ( = ?auto_499670 ?auto_499677 ) ) ( not ( = ?auto_499670 ?auto_499678 ) ) ( not ( = ?auto_499670 ?auto_499679 ) ) ( not ( = ?auto_499670 ?auto_499680 ) ) ( not ( = ?auto_499670 ?auto_499681 ) ) ( not ( = ?auto_499671 ?auto_499672 ) ) ( not ( = ?auto_499671 ?auto_499673 ) ) ( not ( = ?auto_499671 ?auto_499674 ) ) ( not ( = ?auto_499671 ?auto_499675 ) ) ( not ( = ?auto_499671 ?auto_499676 ) ) ( not ( = ?auto_499671 ?auto_499677 ) ) ( not ( = ?auto_499671 ?auto_499678 ) ) ( not ( = ?auto_499671 ?auto_499679 ) ) ( not ( = ?auto_499671 ?auto_499680 ) ) ( not ( = ?auto_499671 ?auto_499681 ) ) ( not ( = ?auto_499672 ?auto_499673 ) ) ( not ( = ?auto_499672 ?auto_499674 ) ) ( not ( = ?auto_499672 ?auto_499675 ) ) ( not ( = ?auto_499672 ?auto_499676 ) ) ( not ( = ?auto_499672 ?auto_499677 ) ) ( not ( = ?auto_499672 ?auto_499678 ) ) ( not ( = ?auto_499672 ?auto_499679 ) ) ( not ( = ?auto_499672 ?auto_499680 ) ) ( not ( = ?auto_499672 ?auto_499681 ) ) ( not ( = ?auto_499673 ?auto_499674 ) ) ( not ( = ?auto_499673 ?auto_499675 ) ) ( not ( = ?auto_499673 ?auto_499676 ) ) ( not ( = ?auto_499673 ?auto_499677 ) ) ( not ( = ?auto_499673 ?auto_499678 ) ) ( not ( = ?auto_499673 ?auto_499679 ) ) ( not ( = ?auto_499673 ?auto_499680 ) ) ( not ( = ?auto_499673 ?auto_499681 ) ) ( not ( = ?auto_499674 ?auto_499675 ) ) ( not ( = ?auto_499674 ?auto_499676 ) ) ( not ( = ?auto_499674 ?auto_499677 ) ) ( not ( = ?auto_499674 ?auto_499678 ) ) ( not ( = ?auto_499674 ?auto_499679 ) ) ( not ( = ?auto_499674 ?auto_499680 ) ) ( not ( = ?auto_499674 ?auto_499681 ) ) ( not ( = ?auto_499675 ?auto_499676 ) ) ( not ( = ?auto_499675 ?auto_499677 ) ) ( not ( = ?auto_499675 ?auto_499678 ) ) ( not ( = ?auto_499675 ?auto_499679 ) ) ( not ( = ?auto_499675 ?auto_499680 ) ) ( not ( = ?auto_499675 ?auto_499681 ) ) ( not ( = ?auto_499676 ?auto_499677 ) ) ( not ( = ?auto_499676 ?auto_499678 ) ) ( not ( = ?auto_499676 ?auto_499679 ) ) ( not ( = ?auto_499676 ?auto_499680 ) ) ( not ( = ?auto_499676 ?auto_499681 ) ) ( not ( = ?auto_499677 ?auto_499678 ) ) ( not ( = ?auto_499677 ?auto_499679 ) ) ( not ( = ?auto_499677 ?auto_499680 ) ) ( not ( = ?auto_499677 ?auto_499681 ) ) ( not ( = ?auto_499678 ?auto_499679 ) ) ( not ( = ?auto_499678 ?auto_499680 ) ) ( not ( = ?auto_499678 ?auto_499681 ) ) ( not ( = ?auto_499679 ?auto_499680 ) ) ( not ( = ?auto_499679 ?auto_499681 ) ) ( not ( = ?auto_499680 ?auto_499681 ) ) ( ON ?auto_499679 ?auto_499680 ) ( ON ?auto_499678 ?auto_499679 ) ( ON ?auto_499677 ?auto_499678 ) ( ON ?auto_499676 ?auto_499677 ) ( ON ?auto_499675 ?auto_499676 ) ( ON ?auto_499674 ?auto_499675 ) ( ON ?auto_499673 ?auto_499674 ) ( ON ?auto_499672 ?auto_499673 ) ( ON ?auto_499671 ?auto_499672 ) ( ON ?auto_499670 ?auto_499671 ) ( CLEAR ?auto_499668 ) ( ON ?auto_499669 ?auto_499670 ) ( CLEAR ?auto_499669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_499668 ?auto_499669 )
      ( MAKE-13PILE ?auto_499668 ?auto_499669 ?auto_499670 ?auto_499671 ?auto_499672 ?auto_499673 ?auto_499674 ?auto_499675 ?auto_499676 ?auto_499677 ?auto_499678 ?auto_499679 ?auto_499680 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_499722 - BLOCK
      ?auto_499723 - BLOCK
      ?auto_499724 - BLOCK
      ?auto_499725 - BLOCK
      ?auto_499726 - BLOCK
      ?auto_499727 - BLOCK
      ?auto_499728 - BLOCK
      ?auto_499729 - BLOCK
      ?auto_499730 - BLOCK
      ?auto_499731 - BLOCK
      ?auto_499732 - BLOCK
      ?auto_499733 - BLOCK
      ?auto_499734 - BLOCK
    )
    :vars
    (
      ?auto_499735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499734 ?auto_499735 ) ( not ( = ?auto_499722 ?auto_499723 ) ) ( not ( = ?auto_499722 ?auto_499724 ) ) ( not ( = ?auto_499722 ?auto_499725 ) ) ( not ( = ?auto_499722 ?auto_499726 ) ) ( not ( = ?auto_499722 ?auto_499727 ) ) ( not ( = ?auto_499722 ?auto_499728 ) ) ( not ( = ?auto_499722 ?auto_499729 ) ) ( not ( = ?auto_499722 ?auto_499730 ) ) ( not ( = ?auto_499722 ?auto_499731 ) ) ( not ( = ?auto_499722 ?auto_499732 ) ) ( not ( = ?auto_499722 ?auto_499733 ) ) ( not ( = ?auto_499722 ?auto_499734 ) ) ( not ( = ?auto_499722 ?auto_499735 ) ) ( not ( = ?auto_499723 ?auto_499724 ) ) ( not ( = ?auto_499723 ?auto_499725 ) ) ( not ( = ?auto_499723 ?auto_499726 ) ) ( not ( = ?auto_499723 ?auto_499727 ) ) ( not ( = ?auto_499723 ?auto_499728 ) ) ( not ( = ?auto_499723 ?auto_499729 ) ) ( not ( = ?auto_499723 ?auto_499730 ) ) ( not ( = ?auto_499723 ?auto_499731 ) ) ( not ( = ?auto_499723 ?auto_499732 ) ) ( not ( = ?auto_499723 ?auto_499733 ) ) ( not ( = ?auto_499723 ?auto_499734 ) ) ( not ( = ?auto_499723 ?auto_499735 ) ) ( not ( = ?auto_499724 ?auto_499725 ) ) ( not ( = ?auto_499724 ?auto_499726 ) ) ( not ( = ?auto_499724 ?auto_499727 ) ) ( not ( = ?auto_499724 ?auto_499728 ) ) ( not ( = ?auto_499724 ?auto_499729 ) ) ( not ( = ?auto_499724 ?auto_499730 ) ) ( not ( = ?auto_499724 ?auto_499731 ) ) ( not ( = ?auto_499724 ?auto_499732 ) ) ( not ( = ?auto_499724 ?auto_499733 ) ) ( not ( = ?auto_499724 ?auto_499734 ) ) ( not ( = ?auto_499724 ?auto_499735 ) ) ( not ( = ?auto_499725 ?auto_499726 ) ) ( not ( = ?auto_499725 ?auto_499727 ) ) ( not ( = ?auto_499725 ?auto_499728 ) ) ( not ( = ?auto_499725 ?auto_499729 ) ) ( not ( = ?auto_499725 ?auto_499730 ) ) ( not ( = ?auto_499725 ?auto_499731 ) ) ( not ( = ?auto_499725 ?auto_499732 ) ) ( not ( = ?auto_499725 ?auto_499733 ) ) ( not ( = ?auto_499725 ?auto_499734 ) ) ( not ( = ?auto_499725 ?auto_499735 ) ) ( not ( = ?auto_499726 ?auto_499727 ) ) ( not ( = ?auto_499726 ?auto_499728 ) ) ( not ( = ?auto_499726 ?auto_499729 ) ) ( not ( = ?auto_499726 ?auto_499730 ) ) ( not ( = ?auto_499726 ?auto_499731 ) ) ( not ( = ?auto_499726 ?auto_499732 ) ) ( not ( = ?auto_499726 ?auto_499733 ) ) ( not ( = ?auto_499726 ?auto_499734 ) ) ( not ( = ?auto_499726 ?auto_499735 ) ) ( not ( = ?auto_499727 ?auto_499728 ) ) ( not ( = ?auto_499727 ?auto_499729 ) ) ( not ( = ?auto_499727 ?auto_499730 ) ) ( not ( = ?auto_499727 ?auto_499731 ) ) ( not ( = ?auto_499727 ?auto_499732 ) ) ( not ( = ?auto_499727 ?auto_499733 ) ) ( not ( = ?auto_499727 ?auto_499734 ) ) ( not ( = ?auto_499727 ?auto_499735 ) ) ( not ( = ?auto_499728 ?auto_499729 ) ) ( not ( = ?auto_499728 ?auto_499730 ) ) ( not ( = ?auto_499728 ?auto_499731 ) ) ( not ( = ?auto_499728 ?auto_499732 ) ) ( not ( = ?auto_499728 ?auto_499733 ) ) ( not ( = ?auto_499728 ?auto_499734 ) ) ( not ( = ?auto_499728 ?auto_499735 ) ) ( not ( = ?auto_499729 ?auto_499730 ) ) ( not ( = ?auto_499729 ?auto_499731 ) ) ( not ( = ?auto_499729 ?auto_499732 ) ) ( not ( = ?auto_499729 ?auto_499733 ) ) ( not ( = ?auto_499729 ?auto_499734 ) ) ( not ( = ?auto_499729 ?auto_499735 ) ) ( not ( = ?auto_499730 ?auto_499731 ) ) ( not ( = ?auto_499730 ?auto_499732 ) ) ( not ( = ?auto_499730 ?auto_499733 ) ) ( not ( = ?auto_499730 ?auto_499734 ) ) ( not ( = ?auto_499730 ?auto_499735 ) ) ( not ( = ?auto_499731 ?auto_499732 ) ) ( not ( = ?auto_499731 ?auto_499733 ) ) ( not ( = ?auto_499731 ?auto_499734 ) ) ( not ( = ?auto_499731 ?auto_499735 ) ) ( not ( = ?auto_499732 ?auto_499733 ) ) ( not ( = ?auto_499732 ?auto_499734 ) ) ( not ( = ?auto_499732 ?auto_499735 ) ) ( not ( = ?auto_499733 ?auto_499734 ) ) ( not ( = ?auto_499733 ?auto_499735 ) ) ( not ( = ?auto_499734 ?auto_499735 ) ) ( ON ?auto_499733 ?auto_499734 ) ( ON ?auto_499732 ?auto_499733 ) ( ON ?auto_499731 ?auto_499732 ) ( ON ?auto_499730 ?auto_499731 ) ( ON ?auto_499729 ?auto_499730 ) ( ON ?auto_499728 ?auto_499729 ) ( ON ?auto_499727 ?auto_499728 ) ( ON ?auto_499726 ?auto_499727 ) ( ON ?auto_499725 ?auto_499726 ) ( ON ?auto_499724 ?auto_499725 ) ( ON ?auto_499723 ?auto_499724 ) ( ON ?auto_499722 ?auto_499723 ) ( CLEAR ?auto_499722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_499722 )
      ( MAKE-13PILE ?auto_499722 ?auto_499723 ?auto_499724 ?auto_499725 ?auto_499726 ?auto_499727 ?auto_499728 ?auto_499729 ?auto_499730 ?auto_499731 ?auto_499732 ?auto_499733 ?auto_499734 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_499777 - BLOCK
      ?auto_499778 - BLOCK
      ?auto_499779 - BLOCK
      ?auto_499780 - BLOCK
      ?auto_499781 - BLOCK
      ?auto_499782 - BLOCK
      ?auto_499783 - BLOCK
      ?auto_499784 - BLOCK
      ?auto_499785 - BLOCK
      ?auto_499786 - BLOCK
      ?auto_499787 - BLOCK
      ?auto_499788 - BLOCK
      ?auto_499789 - BLOCK
      ?auto_499790 - BLOCK
    )
    :vars
    (
      ?auto_499791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_499789 ) ( ON ?auto_499790 ?auto_499791 ) ( CLEAR ?auto_499790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_499777 ) ( ON ?auto_499778 ?auto_499777 ) ( ON ?auto_499779 ?auto_499778 ) ( ON ?auto_499780 ?auto_499779 ) ( ON ?auto_499781 ?auto_499780 ) ( ON ?auto_499782 ?auto_499781 ) ( ON ?auto_499783 ?auto_499782 ) ( ON ?auto_499784 ?auto_499783 ) ( ON ?auto_499785 ?auto_499784 ) ( ON ?auto_499786 ?auto_499785 ) ( ON ?auto_499787 ?auto_499786 ) ( ON ?auto_499788 ?auto_499787 ) ( ON ?auto_499789 ?auto_499788 ) ( not ( = ?auto_499777 ?auto_499778 ) ) ( not ( = ?auto_499777 ?auto_499779 ) ) ( not ( = ?auto_499777 ?auto_499780 ) ) ( not ( = ?auto_499777 ?auto_499781 ) ) ( not ( = ?auto_499777 ?auto_499782 ) ) ( not ( = ?auto_499777 ?auto_499783 ) ) ( not ( = ?auto_499777 ?auto_499784 ) ) ( not ( = ?auto_499777 ?auto_499785 ) ) ( not ( = ?auto_499777 ?auto_499786 ) ) ( not ( = ?auto_499777 ?auto_499787 ) ) ( not ( = ?auto_499777 ?auto_499788 ) ) ( not ( = ?auto_499777 ?auto_499789 ) ) ( not ( = ?auto_499777 ?auto_499790 ) ) ( not ( = ?auto_499777 ?auto_499791 ) ) ( not ( = ?auto_499778 ?auto_499779 ) ) ( not ( = ?auto_499778 ?auto_499780 ) ) ( not ( = ?auto_499778 ?auto_499781 ) ) ( not ( = ?auto_499778 ?auto_499782 ) ) ( not ( = ?auto_499778 ?auto_499783 ) ) ( not ( = ?auto_499778 ?auto_499784 ) ) ( not ( = ?auto_499778 ?auto_499785 ) ) ( not ( = ?auto_499778 ?auto_499786 ) ) ( not ( = ?auto_499778 ?auto_499787 ) ) ( not ( = ?auto_499778 ?auto_499788 ) ) ( not ( = ?auto_499778 ?auto_499789 ) ) ( not ( = ?auto_499778 ?auto_499790 ) ) ( not ( = ?auto_499778 ?auto_499791 ) ) ( not ( = ?auto_499779 ?auto_499780 ) ) ( not ( = ?auto_499779 ?auto_499781 ) ) ( not ( = ?auto_499779 ?auto_499782 ) ) ( not ( = ?auto_499779 ?auto_499783 ) ) ( not ( = ?auto_499779 ?auto_499784 ) ) ( not ( = ?auto_499779 ?auto_499785 ) ) ( not ( = ?auto_499779 ?auto_499786 ) ) ( not ( = ?auto_499779 ?auto_499787 ) ) ( not ( = ?auto_499779 ?auto_499788 ) ) ( not ( = ?auto_499779 ?auto_499789 ) ) ( not ( = ?auto_499779 ?auto_499790 ) ) ( not ( = ?auto_499779 ?auto_499791 ) ) ( not ( = ?auto_499780 ?auto_499781 ) ) ( not ( = ?auto_499780 ?auto_499782 ) ) ( not ( = ?auto_499780 ?auto_499783 ) ) ( not ( = ?auto_499780 ?auto_499784 ) ) ( not ( = ?auto_499780 ?auto_499785 ) ) ( not ( = ?auto_499780 ?auto_499786 ) ) ( not ( = ?auto_499780 ?auto_499787 ) ) ( not ( = ?auto_499780 ?auto_499788 ) ) ( not ( = ?auto_499780 ?auto_499789 ) ) ( not ( = ?auto_499780 ?auto_499790 ) ) ( not ( = ?auto_499780 ?auto_499791 ) ) ( not ( = ?auto_499781 ?auto_499782 ) ) ( not ( = ?auto_499781 ?auto_499783 ) ) ( not ( = ?auto_499781 ?auto_499784 ) ) ( not ( = ?auto_499781 ?auto_499785 ) ) ( not ( = ?auto_499781 ?auto_499786 ) ) ( not ( = ?auto_499781 ?auto_499787 ) ) ( not ( = ?auto_499781 ?auto_499788 ) ) ( not ( = ?auto_499781 ?auto_499789 ) ) ( not ( = ?auto_499781 ?auto_499790 ) ) ( not ( = ?auto_499781 ?auto_499791 ) ) ( not ( = ?auto_499782 ?auto_499783 ) ) ( not ( = ?auto_499782 ?auto_499784 ) ) ( not ( = ?auto_499782 ?auto_499785 ) ) ( not ( = ?auto_499782 ?auto_499786 ) ) ( not ( = ?auto_499782 ?auto_499787 ) ) ( not ( = ?auto_499782 ?auto_499788 ) ) ( not ( = ?auto_499782 ?auto_499789 ) ) ( not ( = ?auto_499782 ?auto_499790 ) ) ( not ( = ?auto_499782 ?auto_499791 ) ) ( not ( = ?auto_499783 ?auto_499784 ) ) ( not ( = ?auto_499783 ?auto_499785 ) ) ( not ( = ?auto_499783 ?auto_499786 ) ) ( not ( = ?auto_499783 ?auto_499787 ) ) ( not ( = ?auto_499783 ?auto_499788 ) ) ( not ( = ?auto_499783 ?auto_499789 ) ) ( not ( = ?auto_499783 ?auto_499790 ) ) ( not ( = ?auto_499783 ?auto_499791 ) ) ( not ( = ?auto_499784 ?auto_499785 ) ) ( not ( = ?auto_499784 ?auto_499786 ) ) ( not ( = ?auto_499784 ?auto_499787 ) ) ( not ( = ?auto_499784 ?auto_499788 ) ) ( not ( = ?auto_499784 ?auto_499789 ) ) ( not ( = ?auto_499784 ?auto_499790 ) ) ( not ( = ?auto_499784 ?auto_499791 ) ) ( not ( = ?auto_499785 ?auto_499786 ) ) ( not ( = ?auto_499785 ?auto_499787 ) ) ( not ( = ?auto_499785 ?auto_499788 ) ) ( not ( = ?auto_499785 ?auto_499789 ) ) ( not ( = ?auto_499785 ?auto_499790 ) ) ( not ( = ?auto_499785 ?auto_499791 ) ) ( not ( = ?auto_499786 ?auto_499787 ) ) ( not ( = ?auto_499786 ?auto_499788 ) ) ( not ( = ?auto_499786 ?auto_499789 ) ) ( not ( = ?auto_499786 ?auto_499790 ) ) ( not ( = ?auto_499786 ?auto_499791 ) ) ( not ( = ?auto_499787 ?auto_499788 ) ) ( not ( = ?auto_499787 ?auto_499789 ) ) ( not ( = ?auto_499787 ?auto_499790 ) ) ( not ( = ?auto_499787 ?auto_499791 ) ) ( not ( = ?auto_499788 ?auto_499789 ) ) ( not ( = ?auto_499788 ?auto_499790 ) ) ( not ( = ?auto_499788 ?auto_499791 ) ) ( not ( = ?auto_499789 ?auto_499790 ) ) ( not ( = ?auto_499789 ?auto_499791 ) ) ( not ( = ?auto_499790 ?auto_499791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_499790 ?auto_499791 )
      ( !STACK ?auto_499790 ?auto_499789 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_499835 - BLOCK
      ?auto_499836 - BLOCK
      ?auto_499837 - BLOCK
      ?auto_499838 - BLOCK
      ?auto_499839 - BLOCK
      ?auto_499840 - BLOCK
      ?auto_499841 - BLOCK
      ?auto_499842 - BLOCK
      ?auto_499843 - BLOCK
      ?auto_499844 - BLOCK
      ?auto_499845 - BLOCK
      ?auto_499846 - BLOCK
      ?auto_499847 - BLOCK
      ?auto_499848 - BLOCK
    )
    :vars
    (
      ?auto_499849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499848 ?auto_499849 ) ( ON-TABLE ?auto_499835 ) ( ON ?auto_499836 ?auto_499835 ) ( ON ?auto_499837 ?auto_499836 ) ( ON ?auto_499838 ?auto_499837 ) ( ON ?auto_499839 ?auto_499838 ) ( ON ?auto_499840 ?auto_499839 ) ( ON ?auto_499841 ?auto_499840 ) ( ON ?auto_499842 ?auto_499841 ) ( ON ?auto_499843 ?auto_499842 ) ( ON ?auto_499844 ?auto_499843 ) ( ON ?auto_499845 ?auto_499844 ) ( ON ?auto_499846 ?auto_499845 ) ( not ( = ?auto_499835 ?auto_499836 ) ) ( not ( = ?auto_499835 ?auto_499837 ) ) ( not ( = ?auto_499835 ?auto_499838 ) ) ( not ( = ?auto_499835 ?auto_499839 ) ) ( not ( = ?auto_499835 ?auto_499840 ) ) ( not ( = ?auto_499835 ?auto_499841 ) ) ( not ( = ?auto_499835 ?auto_499842 ) ) ( not ( = ?auto_499835 ?auto_499843 ) ) ( not ( = ?auto_499835 ?auto_499844 ) ) ( not ( = ?auto_499835 ?auto_499845 ) ) ( not ( = ?auto_499835 ?auto_499846 ) ) ( not ( = ?auto_499835 ?auto_499847 ) ) ( not ( = ?auto_499835 ?auto_499848 ) ) ( not ( = ?auto_499835 ?auto_499849 ) ) ( not ( = ?auto_499836 ?auto_499837 ) ) ( not ( = ?auto_499836 ?auto_499838 ) ) ( not ( = ?auto_499836 ?auto_499839 ) ) ( not ( = ?auto_499836 ?auto_499840 ) ) ( not ( = ?auto_499836 ?auto_499841 ) ) ( not ( = ?auto_499836 ?auto_499842 ) ) ( not ( = ?auto_499836 ?auto_499843 ) ) ( not ( = ?auto_499836 ?auto_499844 ) ) ( not ( = ?auto_499836 ?auto_499845 ) ) ( not ( = ?auto_499836 ?auto_499846 ) ) ( not ( = ?auto_499836 ?auto_499847 ) ) ( not ( = ?auto_499836 ?auto_499848 ) ) ( not ( = ?auto_499836 ?auto_499849 ) ) ( not ( = ?auto_499837 ?auto_499838 ) ) ( not ( = ?auto_499837 ?auto_499839 ) ) ( not ( = ?auto_499837 ?auto_499840 ) ) ( not ( = ?auto_499837 ?auto_499841 ) ) ( not ( = ?auto_499837 ?auto_499842 ) ) ( not ( = ?auto_499837 ?auto_499843 ) ) ( not ( = ?auto_499837 ?auto_499844 ) ) ( not ( = ?auto_499837 ?auto_499845 ) ) ( not ( = ?auto_499837 ?auto_499846 ) ) ( not ( = ?auto_499837 ?auto_499847 ) ) ( not ( = ?auto_499837 ?auto_499848 ) ) ( not ( = ?auto_499837 ?auto_499849 ) ) ( not ( = ?auto_499838 ?auto_499839 ) ) ( not ( = ?auto_499838 ?auto_499840 ) ) ( not ( = ?auto_499838 ?auto_499841 ) ) ( not ( = ?auto_499838 ?auto_499842 ) ) ( not ( = ?auto_499838 ?auto_499843 ) ) ( not ( = ?auto_499838 ?auto_499844 ) ) ( not ( = ?auto_499838 ?auto_499845 ) ) ( not ( = ?auto_499838 ?auto_499846 ) ) ( not ( = ?auto_499838 ?auto_499847 ) ) ( not ( = ?auto_499838 ?auto_499848 ) ) ( not ( = ?auto_499838 ?auto_499849 ) ) ( not ( = ?auto_499839 ?auto_499840 ) ) ( not ( = ?auto_499839 ?auto_499841 ) ) ( not ( = ?auto_499839 ?auto_499842 ) ) ( not ( = ?auto_499839 ?auto_499843 ) ) ( not ( = ?auto_499839 ?auto_499844 ) ) ( not ( = ?auto_499839 ?auto_499845 ) ) ( not ( = ?auto_499839 ?auto_499846 ) ) ( not ( = ?auto_499839 ?auto_499847 ) ) ( not ( = ?auto_499839 ?auto_499848 ) ) ( not ( = ?auto_499839 ?auto_499849 ) ) ( not ( = ?auto_499840 ?auto_499841 ) ) ( not ( = ?auto_499840 ?auto_499842 ) ) ( not ( = ?auto_499840 ?auto_499843 ) ) ( not ( = ?auto_499840 ?auto_499844 ) ) ( not ( = ?auto_499840 ?auto_499845 ) ) ( not ( = ?auto_499840 ?auto_499846 ) ) ( not ( = ?auto_499840 ?auto_499847 ) ) ( not ( = ?auto_499840 ?auto_499848 ) ) ( not ( = ?auto_499840 ?auto_499849 ) ) ( not ( = ?auto_499841 ?auto_499842 ) ) ( not ( = ?auto_499841 ?auto_499843 ) ) ( not ( = ?auto_499841 ?auto_499844 ) ) ( not ( = ?auto_499841 ?auto_499845 ) ) ( not ( = ?auto_499841 ?auto_499846 ) ) ( not ( = ?auto_499841 ?auto_499847 ) ) ( not ( = ?auto_499841 ?auto_499848 ) ) ( not ( = ?auto_499841 ?auto_499849 ) ) ( not ( = ?auto_499842 ?auto_499843 ) ) ( not ( = ?auto_499842 ?auto_499844 ) ) ( not ( = ?auto_499842 ?auto_499845 ) ) ( not ( = ?auto_499842 ?auto_499846 ) ) ( not ( = ?auto_499842 ?auto_499847 ) ) ( not ( = ?auto_499842 ?auto_499848 ) ) ( not ( = ?auto_499842 ?auto_499849 ) ) ( not ( = ?auto_499843 ?auto_499844 ) ) ( not ( = ?auto_499843 ?auto_499845 ) ) ( not ( = ?auto_499843 ?auto_499846 ) ) ( not ( = ?auto_499843 ?auto_499847 ) ) ( not ( = ?auto_499843 ?auto_499848 ) ) ( not ( = ?auto_499843 ?auto_499849 ) ) ( not ( = ?auto_499844 ?auto_499845 ) ) ( not ( = ?auto_499844 ?auto_499846 ) ) ( not ( = ?auto_499844 ?auto_499847 ) ) ( not ( = ?auto_499844 ?auto_499848 ) ) ( not ( = ?auto_499844 ?auto_499849 ) ) ( not ( = ?auto_499845 ?auto_499846 ) ) ( not ( = ?auto_499845 ?auto_499847 ) ) ( not ( = ?auto_499845 ?auto_499848 ) ) ( not ( = ?auto_499845 ?auto_499849 ) ) ( not ( = ?auto_499846 ?auto_499847 ) ) ( not ( = ?auto_499846 ?auto_499848 ) ) ( not ( = ?auto_499846 ?auto_499849 ) ) ( not ( = ?auto_499847 ?auto_499848 ) ) ( not ( = ?auto_499847 ?auto_499849 ) ) ( not ( = ?auto_499848 ?auto_499849 ) ) ( CLEAR ?auto_499846 ) ( ON ?auto_499847 ?auto_499848 ) ( CLEAR ?auto_499847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_499835 ?auto_499836 ?auto_499837 ?auto_499838 ?auto_499839 ?auto_499840 ?auto_499841 ?auto_499842 ?auto_499843 ?auto_499844 ?auto_499845 ?auto_499846 ?auto_499847 )
      ( MAKE-14PILE ?auto_499835 ?auto_499836 ?auto_499837 ?auto_499838 ?auto_499839 ?auto_499840 ?auto_499841 ?auto_499842 ?auto_499843 ?auto_499844 ?auto_499845 ?auto_499846 ?auto_499847 ?auto_499848 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_499893 - BLOCK
      ?auto_499894 - BLOCK
      ?auto_499895 - BLOCK
      ?auto_499896 - BLOCK
      ?auto_499897 - BLOCK
      ?auto_499898 - BLOCK
      ?auto_499899 - BLOCK
      ?auto_499900 - BLOCK
      ?auto_499901 - BLOCK
      ?auto_499902 - BLOCK
      ?auto_499903 - BLOCK
      ?auto_499904 - BLOCK
      ?auto_499905 - BLOCK
      ?auto_499906 - BLOCK
    )
    :vars
    (
      ?auto_499907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499906 ?auto_499907 ) ( ON-TABLE ?auto_499893 ) ( ON ?auto_499894 ?auto_499893 ) ( ON ?auto_499895 ?auto_499894 ) ( ON ?auto_499896 ?auto_499895 ) ( ON ?auto_499897 ?auto_499896 ) ( ON ?auto_499898 ?auto_499897 ) ( ON ?auto_499899 ?auto_499898 ) ( ON ?auto_499900 ?auto_499899 ) ( ON ?auto_499901 ?auto_499900 ) ( ON ?auto_499902 ?auto_499901 ) ( ON ?auto_499903 ?auto_499902 ) ( not ( = ?auto_499893 ?auto_499894 ) ) ( not ( = ?auto_499893 ?auto_499895 ) ) ( not ( = ?auto_499893 ?auto_499896 ) ) ( not ( = ?auto_499893 ?auto_499897 ) ) ( not ( = ?auto_499893 ?auto_499898 ) ) ( not ( = ?auto_499893 ?auto_499899 ) ) ( not ( = ?auto_499893 ?auto_499900 ) ) ( not ( = ?auto_499893 ?auto_499901 ) ) ( not ( = ?auto_499893 ?auto_499902 ) ) ( not ( = ?auto_499893 ?auto_499903 ) ) ( not ( = ?auto_499893 ?auto_499904 ) ) ( not ( = ?auto_499893 ?auto_499905 ) ) ( not ( = ?auto_499893 ?auto_499906 ) ) ( not ( = ?auto_499893 ?auto_499907 ) ) ( not ( = ?auto_499894 ?auto_499895 ) ) ( not ( = ?auto_499894 ?auto_499896 ) ) ( not ( = ?auto_499894 ?auto_499897 ) ) ( not ( = ?auto_499894 ?auto_499898 ) ) ( not ( = ?auto_499894 ?auto_499899 ) ) ( not ( = ?auto_499894 ?auto_499900 ) ) ( not ( = ?auto_499894 ?auto_499901 ) ) ( not ( = ?auto_499894 ?auto_499902 ) ) ( not ( = ?auto_499894 ?auto_499903 ) ) ( not ( = ?auto_499894 ?auto_499904 ) ) ( not ( = ?auto_499894 ?auto_499905 ) ) ( not ( = ?auto_499894 ?auto_499906 ) ) ( not ( = ?auto_499894 ?auto_499907 ) ) ( not ( = ?auto_499895 ?auto_499896 ) ) ( not ( = ?auto_499895 ?auto_499897 ) ) ( not ( = ?auto_499895 ?auto_499898 ) ) ( not ( = ?auto_499895 ?auto_499899 ) ) ( not ( = ?auto_499895 ?auto_499900 ) ) ( not ( = ?auto_499895 ?auto_499901 ) ) ( not ( = ?auto_499895 ?auto_499902 ) ) ( not ( = ?auto_499895 ?auto_499903 ) ) ( not ( = ?auto_499895 ?auto_499904 ) ) ( not ( = ?auto_499895 ?auto_499905 ) ) ( not ( = ?auto_499895 ?auto_499906 ) ) ( not ( = ?auto_499895 ?auto_499907 ) ) ( not ( = ?auto_499896 ?auto_499897 ) ) ( not ( = ?auto_499896 ?auto_499898 ) ) ( not ( = ?auto_499896 ?auto_499899 ) ) ( not ( = ?auto_499896 ?auto_499900 ) ) ( not ( = ?auto_499896 ?auto_499901 ) ) ( not ( = ?auto_499896 ?auto_499902 ) ) ( not ( = ?auto_499896 ?auto_499903 ) ) ( not ( = ?auto_499896 ?auto_499904 ) ) ( not ( = ?auto_499896 ?auto_499905 ) ) ( not ( = ?auto_499896 ?auto_499906 ) ) ( not ( = ?auto_499896 ?auto_499907 ) ) ( not ( = ?auto_499897 ?auto_499898 ) ) ( not ( = ?auto_499897 ?auto_499899 ) ) ( not ( = ?auto_499897 ?auto_499900 ) ) ( not ( = ?auto_499897 ?auto_499901 ) ) ( not ( = ?auto_499897 ?auto_499902 ) ) ( not ( = ?auto_499897 ?auto_499903 ) ) ( not ( = ?auto_499897 ?auto_499904 ) ) ( not ( = ?auto_499897 ?auto_499905 ) ) ( not ( = ?auto_499897 ?auto_499906 ) ) ( not ( = ?auto_499897 ?auto_499907 ) ) ( not ( = ?auto_499898 ?auto_499899 ) ) ( not ( = ?auto_499898 ?auto_499900 ) ) ( not ( = ?auto_499898 ?auto_499901 ) ) ( not ( = ?auto_499898 ?auto_499902 ) ) ( not ( = ?auto_499898 ?auto_499903 ) ) ( not ( = ?auto_499898 ?auto_499904 ) ) ( not ( = ?auto_499898 ?auto_499905 ) ) ( not ( = ?auto_499898 ?auto_499906 ) ) ( not ( = ?auto_499898 ?auto_499907 ) ) ( not ( = ?auto_499899 ?auto_499900 ) ) ( not ( = ?auto_499899 ?auto_499901 ) ) ( not ( = ?auto_499899 ?auto_499902 ) ) ( not ( = ?auto_499899 ?auto_499903 ) ) ( not ( = ?auto_499899 ?auto_499904 ) ) ( not ( = ?auto_499899 ?auto_499905 ) ) ( not ( = ?auto_499899 ?auto_499906 ) ) ( not ( = ?auto_499899 ?auto_499907 ) ) ( not ( = ?auto_499900 ?auto_499901 ) ) ( not ( = ?auto_499900 ?auto_499902 ) ) ( not ( = ?auto_499900 ?auto_499903 ) ) ( not ( = ?auto_499900 ?auto_499904 ) ) ( not ( = ?auto_499900 ?auto_499905 ) ) ( not ( = ?auto_499900 ?auto_499906 ) ) ( not ( = ?auto_499900 ?auto_499907 ) ) ( not ( = ?auto_499901 ?auto_499902 ) ) ( not ( = ?auto_499901 ?auto_499903 ) ) ( not ( = ?auto_499901 ?auto_499904 ) ) ( not ( = ?auto_499901 ?auto_499905 ) ) ( not ( = ?auto_499901 ?auto_499906 ) ) ( not ( = ?auto_499901 ?auto_499907 ) ) ( not ( = ?auto_499902 ?auto_499903 ) ) ( not ( = ?auto_499902 ?auto_499904 ) ) ( not ( = ?auto_499902 ?auto_499905 ) ) ( not ( = ?auto_499902 ?auto_499906 ) ) ( not ( = ?auto_499902 ?auto_499907 ) ) ( not ( = ?auto_499903 ?auto_499904 ) ) ( not ( = ?auto_499903 ?auto_499905 ) ) ( not ( = ?auto_499903 ?auto_499906 ) ) ( not ( = ?auto_499903 ?auto_499907 ) ) ( not ( = ?auto_499904 ?auto_499905 ) ) ( not ( = ?auto_499904 ?auto_499906 ) ) ( not ( = ?auto_499904 ?auto_499907 ) ) ( not ( = ?auto_499905 ?auto_499906 ) ) ( not ( = ?auto_499905 ?auto_499907 ) ) ( not ( = ?auto_499906 ?auto_499907 ) ) ( ON ?auto_499905 ?auto_499906 ) ( CLEAR ?auto_499903 ) ( ON ?auto_499904 ?auto_499905 ) ( CLEAR ?auto_499904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_499893 ?auto_499894 ?auto_499895 ?auto_499896 ?auto_499897 ?auto_499898 ?auto_499899 ?auto_499900 ?auto_499901 ?auto_499902 ?auto_499903 ?auto_499904 )
      ( MAKE-14PILE ?auto_499893 ?auto_499894 ?auto_499895 ?auto_499896 ?auto_499897 ?auto_499898 ?auto_499899 ?auto_499900 ?auto_499901 ?auto_499902 ?auto_499903 ?auto_499904 ?auto_499905 ?auto_499906 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_499951 - BLOCK
      ?auto_499952 - BLOCK
      ?auto_499953 - BLOCK
      ?auto_499954 - BLOCK
      ?auto_499955 - BLOCK
      ?auto_499956 - BLOCK
      ?auto_499957 - BLOCK
      ?auto_499958 - BLOCK
      ?auto_499959 - BLOCK
      ?auto_499960 - BLOCK
      ?auto_499961 - BLOCK
      ?auto_499962 - BLOCK
      ?auto_499963 - BLOCK
      ?auto_499964 - BLOCK
    )
    :vars
    (
      ?auto_499965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499964 ?auto_499965 ) ( ON-TABLE ?auto_499951 ) ( ON ?auto_499952 ?auto_499951 ) ( ON ?auto_499953 ?auto_499952 ) ( ON ?auto_499954 ?auto_499953 ) ( ON ?auto_499955 ?auto_499954 ) ( ON ?auto_499956 ?auto_499955 ) ( ON ?auto_499957 ?auto_499956 ) ( ON ?auto_499958 ?auto_499957 ) ( ON ?auto_499959 ?auto_499958 ) ( ON ?auto_499960 ?auto_499959 ) ( not ( = ?auto_499951 ?auto_499952 ) ) ( not ( = ?auto_499951 ?auto_499953 ) ) ( not ( = ?auto_499951 ?auto_499954 ) ) ( not ( = ?auto_499951 ?auto_499955 ) ) ( not ( = ?auto_499951 ?auto_499956 ) ) ( not ( = ?auto_499951 ?auto_499957 ) ) ( not ( = ?auto_499951 ?auto_499958 ) ) ( not ( = ?auto_499951 ?auto_499959 ) ) ( not ( = ?auto_499951 ?auto_499960 ) ) ( not ( = ?auto_499951 ?auto_499961 ) ) ( not ( = ?auto_499951 ?auto_499962 ) ) ( not ( = ?auto_499951 ?auto_499963 ) ) ( not ( = ?auto_499951 ?auto_499964 ) ) ( not ( = ?auto_499951 ?auto_499965 ) ) ( not ( = ?auto_499952 ?auto_499953 ) ) ( not ( = ?auto_499952 ?auto_499954 ) ) ( not ( = ?auto_499952 ?auto_499955 ) ) ( not ( = ?auto_499952 ?auto_499956 ) ) ( not ( = ?auto_499952 ?auto_499957 ) ) ( not ( = ?auto_499952 ?auto_499958 ) ) ( not ( = ?auto_499952 ?auto_499959 ) ) ( not ( = ?auto_499952 ?auto_499960 ) ) ( not ( = ?auto_499952 ?auto_499961 ) ) ( not ( = ?auto_499952 ?auto_499962 ) ) ( not ( = ?auto_499952 ?auto_499963 ) ) ( not ( = ?auto_499952 ?auto_499964 ) ) ( not ( = ?auto_499952 ?auto_499965 ) ) ( not ( = ?auto_499953 ?auto_499954 ) ) ( not ( = ?auto_499953 ?auto_499955 ) ) ( not ( = ?auto_499953 ?auto_499956 ) ) ( not ( = ?auto_499953 ?auto_499957 ) ) ( not ( = ?auto_499953 ?auto_499958 ) ) ( not ( = ?auto_499953 ?auto_499959 ) ) ( not ( = ?auto_499953 ?auto_499960 ) ) ( not ( = ?auto_499953 ?auto_499961 ) ) ( not ( = ?auto_499953 ?auto_499962 ) ) ( not ( = ?auto_499953 ?auto_499963 ) ) ( not ( = ?auto_499953 ?auto_499964 ) ) ( not ( = ?auto_499953 ?auto_499965 ) ) ( not ( = ?auto_499954 ?auto_499955 ) ) ( not ( = ?auto_499954 ?auto_499956 ) ) ( not ( = ?auto_499954 ?auto_499957 ) ) ( not ( = ?auto_499954 ?auto_499958 ) ) ( not ( = ?auto_499954 ?auto_499959 ) ) ( not ( = ?auto_499954 ?auto_499960 ) ) ( not ( = ?auto_499954 ?auto_499961 ) ) ( not ( = ?auto_499954 ?auto_499962 ) ) ( not ( = ?auto_499954 ?auto_499963 ) ) ( not ( = ?auto_499954 ?auto_499964 ) ) ( not ( = ?auto_499954 ?auto_499965 ) ) ( not ( = ?auto_499955 ?auto_499956 ) ) ( not ( = ?auto_499955 ?auto_499957 ) ) ( not ( = ?auto_499955 ?auto_499958 ) ) ( not ( = ?auto_499955 ?auto_499959 ) ) ( not ( = ?auto_499955 ?auto_499960 ) ) ( not ( = ?auto_499955 ?auto_499961 ) ) ( not ( = ?auto_499955 ?auto_499962 ) ) ( not ( = ?auto_499955 ?auto_499963 ) ) ( not ( = ?auto_499955 ?auto_499964 ) ) ( not ( = ?auto_499955 ?auto_499965 ) ) ( not ( = ?auto_499956 ?auto_499957 ) ) ( not ( = ?auto_499956 ?auto_499958 ) ) ( not ( = ?auto_499956 ?auto_499959 ) ) ( not ( = ?auto_499956 ?auto_499960 ) ) ( not ( = ?auto_499956 ?auto_499961 ) ) ( not ( = ?auto_499956 ?auto_499962 ) ) ( not ( = ?auto_499956 ?auto_499963 ) ) ( not ( = ?auto_499956 ?auto_499964 ) ) ( not ( = ?auto_499956 ?auto_499965 ) ) ( not ( = ?auto_499957 ?auto_499958 ) ) ( not ( = ?auto_499957 ?auto_499959 ) ) ( not ( = ?auto_499957 ?auto_499960 ) ) ( not ( = ?auto_499957 ?auto_499961 ) ) ( not ( = ?auto_499957 ?auto_499962 ) ) ( not ( = ?auto_499957 ?auto_499963 ) ) ( not ( = ?auto_499957 ?auto_499964 ) ) ( not ( = ?auto_499957 ?auto_499965 ) ) ( not ( = ?auto_499958 ?auto_499959 ) ) ( not ( = ?auto_499958 ?auto_499960 ) ) ( not ( = ?auto_499958 ?auto_499961 ) ) ( not ( = ?auto_499958 ?auto_499962 ) ) ( not ( = ?auto_499958 ?auto_499963 ) ) ( not ( = ?auto_499958 ?auto_499964 ) ) ( not ( = ?auto_499958 ?auto_499965 ) ) ( not ( = ?auto_499959 ?auto_499960 ) ) ( not ( = ?auto_499959 ?auto_499961 ) ) ( not ( = ?auto_499959 ?auto_499962 ) ) ( not ( = ?auto_499959 ?auto_499963 ) ) ( not ( = ?auto_499959 ?auto_499964 ) ) ( not ( = ?auto_499959 ?auto_499965 ) ) ( not ( = ?auto_499960 ?auto_499961 ) ) ( not ( = ?auto_499960 ?auto_499962 ) ) ( not ( = ?auto_499960 ?auto_499963 ) ) ( not ( = ?auto_499960 ?auto_499964 ) ) ( not ( = ?auto_499960 ?auto_499965 ) ) ( not ( = ?auto_499961 ?auto_499962 ) ) ( not ( = ?auto_499961 ?auto_499963 ) ) ( not ( = ?auto_499961 ?auto_499964 ) ) ( not ( = ?auto_499961 ?auto_499965 ) ) ( not ( = ?auto_499962 ?auto_499963 ) ) ( not ( = ?auto_499962 ?auto_499964 ) ) ( not ( = ?auto_499962 ?auto_499965 ) ) ( not ( = ?auto_499963 ?auto_499964 ) ) ( not ( = ?auto_499963 ?auto_499965 ) ) ( not ( = ?auto_499964 ?auto_499965 ) ) ( ON ?auto_499963 ?auto_499964 ) ( ON ?auto_499962 ?auto_499963 ) ( CLEAR ?auto_499960 ) ( ON ?auto_499961 ?auto_499962 ) ( CLEAR ?auto_499961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_499951 ?auto_499952 ?auto_499953 ?auto_499954 ?auto_499955 ?auto_499956 ?auto_499957 ?auto_499958 ?auto_499959 ?auto_499960 ?auto_499961 )
      ( MAKE-14PILE ?auto_499951 ?auto_499952 ?auto_499953 ?auto_499954 ?auto_499955 ?auto_499956 ?auto_499957 ?auto_499958 ?auto_499959 ?auto_499960 ?auto_499961 ?auto_499962 ?auto_499963 ?auto_499964 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500009 - BLOCK
      ?auto_500010 - BLOCK
      ?auto_500011 - BLOCK
      ?auto_500012 - BLOCK
      ?auto_500013 - BLOCK
      ?auto_500014 - BLOCK
      ?auto_500015 - BLOCK
      ?auto_500016 - BLOCK
      ?auto_500017 - BLOCK
      ?auto_500018 - BLOCK
      ?auto_500019 - BLOCK
      ?auto_500020 - BLOCK
      ?auto_500021 - BLOCK
      ?auto_500022 - BLOCK
    )
    :vars
    (
      ?auto_500023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500022 ?auto_500023 ) ( ON-TABLE ?auto_500009 ) ( ON ?auto_500010 ?auto_500009 ) ( ON ?auto_500011 ?auto_500010 ) ( ON ?auto_500012 ?auto_500011 ) ( ON ?auto_500013 ?auto_500012 ) ( ON ?auto_500014 ?auto_500013 ) ( ON ?auto_500015 ?auto_500014 ) ( ON ?auto_500016 ?auto_500015 ) ( ON ?auto_500017 ?auto_500016 ) ( not ( = ?auto_500009 ?auto_500010 ) ) ( not ( = ?auto_500009 ?auto_500011 ) ) ( not ( = ?auto_500009 ?auto_500012 ) ) ( not ( = ?auto_500009 ?auto_500013 ) ) ( not ( = ?auto_500009 ?auto_500014 ) ) ( not ( = ?auto_500009 ?auto_500015 ) ) ( not ( = ?auto_500009 ?auto_500016 ) ) ( not ( = ?auto_500009 ?auto_500017 ) ) ( not ( = ?auto_500009 ?auto_500018 ) ) ( not ( = ?auto_500009 ?auto_500019 ) ) ( not ( = ?auto_500009 ?auto_500020 ) ) ( not ( = ?auto_500009 ?auto_500021 ) ) ( not ( = ?auto_500009 ?auto_500022 ) ) ( not ( = ?auto_500009 ?auto_500023 ) ) ( not ( = ?auto_500010 ?auto_500011 ) ) ( not ( = ?auto_500010 ?auto_500012 ) ) ( not ( = ?auto_500010 ?auto_500013 ) ) ( not ( = ?auto_500010 ?auto_500014 ) ) ( not ( = ?auto_500010 ?auto_500015 ) ) ( not ( = ?auto_500010 ?auto_500016 ) ) ( not ( = ?auto_500010 ?auto_500017 ) ) ( not ( = ?auto_500010 ?auto_500018 ) ) ( not ( = ?auto_500010 ?auto_500019 ) ) ( not ( = ?auto_500010 ?auto_500020 ) ) ( not ( = ?auto_500010 ?auto_500021 ) ) ( not ( = ?auto_500010 ?auto_500022 ) ) ( not ( = ?auto_500010 ?auto_500023 ) ) ( not ( = ?auto_500011 ?auto_500012 ) ) ( not ( = ?auto_500011 ?auto_500013 ) ) ( not ( = ?auto_500011 ?auto_500014 ) ) ( not ( = ?auto_500011 ?auto_500015 ) ) ( not ( = ?auto_500011 ?auto_500016 ) ) ( not ( = ?auto_500011 ?auto_500017 ) ) ( not ( = ?auto_500011 ?auto_500018 ) ) ( not ( = ?auto_500011 ?auto_500019 ) ) ( not ( = ?auto_500011 ?auto_500020 ) ) ( not ( = ?auto_500011 ?auto_500021 ) ) ( not ( = ?auto_500011 ?auto_500022 ) ) ( not ( = ?auto_500011 ?auto_500023 ) ) ( not ( = ?auto_500012 ?auto_500013 ) ) ( not ( = ?auto_500012 ?auto_500014 ) ) ( not ( = ?auto_500012 ?auto_500015 ) ) ( not ( = ?auto_500012 ?auto_500016 ) ) ( not ( = ?auto_500012 ?auto_500017 ) ) ( not ( = ?auto_500012 ?auto_500018 ) ) ( not ( = ?auto_500012 ?auto_500019 ) ) ( not ( = ?auto_500012 ?auto_500020 ) ) ( not ( = ?auto_500012 ?auto_500021 ) ) ( not ( = ?auto_500012 ?auto_500022 ) ) ( not ( = ?auto_500012 ?auto_500023 ) ) ( not ( = ?auto_500013 ?auto_500014 ) ) ( not ( = ?auto_500013 ?auto_500015 ) ) ( not ( = ?auto_500013 ?auto_500016 ) ) ( not ( = ?auto_500013 ?auto_500017 ) ) ( not ( = ?auto_500013 ?auto_500018 ) ) ( not ( = ?auto_500013 ?auto_500019 ) ) ( not ( = ?auto_500013 ?auto_500020 ) ) ( not ( = ?auto_500013 ?auto_500021 ) ) ( not ( = ?auto_500013 ?auto_500022 ) ) ( not ( = ?auto_500013 ?auto_500023 ) ) ( not ( = ?auto_500014 ?auto_500015 ) ) ( not ( = ?auto_500014 ?auto_500016 ) ) ( not ( = ?auto_500014 ?auto_500017 ) ) ( not ( = ?auto_500014 ?auto_500018 ) ) ( not ( = ?auto_500014 ?auto_500019 ) ) ( not ( = ?auto_500014 ?auto_500020 ) ) ( not ( = ?auto_500014 ?auto_500021 ) ) ( not ( = ?auto_500014 ?auto_500022 ) ) ( not ( = ?auto_500014 ?auto_500023 ) ) ( not ( = ?auto_500015 ?auto_500016 ) ) ( not ( = ?auto_500015 ?auto_500017 ) ) ( not ( = ?auto_500015 ?auto_500018 ) ) ( not ( = ?auto_500015 ?auto_500019 ) ) ( not ( = ?auto_500015 ?auto_500020 ) ) ( not ( = ?auto_500015 ?auto_500021 ) ) ( not ( = ?auto_500015 ?auto_500022 ) ) ( not ( = ?auto_500015 ?auto_500023 ) ) ( not ( = ?auto_500016 ?auto_500017 ) ) ( not ( = ?auto_500016 ?auto_500018 ) ) ( not ( = ?auto_500016 ?auto_500019 ) ) ( not ( = ?auto_500016 ?auto_500020 ) ) ( not ( = ?auto_500016 ?auto_500021 ) ) ( not ( = ?auto_500016 ?auto_500022 ) ) ( not ( = ?auto_500016 ?auto_500023 ) ) ( not ( = ?auto_500017 ?auto_500018 ) ) ( not ( = ?auto_500017 ?auto_500019 ) ) ( not ( = ?auto_500017 ?auto_500020 ) ) ( not ( = ?auto_500017 ?auto_500021 ) ) ( not ( = ?auto_500017 ?auto_500022 ) ) ( not ( = ?auto_500017 ?auto_500023 ) ) ( not ( = ?auto_500018 ?auto_500019 ) ) ( not ( = ?auto_500018 ?auto_500020 ) ) ( not ( = ?auto_500018 ?auto_500021 ) ) ( not ( = ?auto_500018 ?auto_500022 ) ) ( not ( = ?auto_500018 ?auto_500023 ) ) ( not ( = ?auto_500019 ?auto_500020 ) ) ( not ( = ?auto_500019 ?auto_500021 ) ) ( not ( = ?auto_500019 ?auto_500022 ) ) ( not ( = ?auto_500019 ?auto_500023 ) ) ( not ( = ?auto_500020 ?auto_500021 ) ) ( not ( = ?auto_500020 ?auto_500022 ) ) ( not ( = ?auto_500020 ?auto_500023 ) ) ( not ( = ?auto_500021 ?auto_500022 ) ) ( not ( = ?auto_500021 ?auto_500023 ) ) ( not ( = ?auto_500022 ?auto_500023 ) ) ( ON ?auto_500021 ?auto_500022 ) ( ON ?auto_500020 ?auto_500021 ) ( ON ?auto_500019 ?auto_500020 ) ( CLEAR ?auto_500017 ) ( ON ?auto_500018 ?auto_500019 ) ( CLEAR ?auto_500018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_500009 ?auto_500010 ?auto_500011 ?auto_500012 ?auto_500013 ?auto_500014 ?auto_500015 ?auto_500016 ?auto_500017 ?auto_500018 )
      ( MAKE-14PILE ?auto_500009 ?auto_500010 ?auto_500011 ?auto_500012 ?auto_500013 ?auto_500014 ?auto_500015 ?auto_500016 ?auto_500017 ?auto_500018 ?auto_500019 ?auto_500020 ?auto_500021 ?auto_500022 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500067 - BLOCK
      ?auto_500068 - BLOCK
      ?auto_500069 - BLOCK
      ?auto_500070 - BLOCK
      ?auto_500071 - BLOCK
      ?auto_500072 - BLOCK
      ?auto_500073 - BLOCK
      ?auto_500074 - BLOCK
      ?auto_500075 - BLOCK
      ?auto_500076 - BLOCK
      ?auto_500077 - BLOCK
      ?auto_500078 - BLOCK
      ?auto_500079 - BLOCK
      ?auto_500080 - BLOCK
    )
    :vars
    (
      ?auto_500081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500080 ?auto_500081 ) ( ON-TABLE ?auto_500067 ) ( ON ?auto_500068 ?auto_500067 ) ( ON ?auto_500069 ?auto_500068 ) ( ON ?auto_500070 ?auto_500069 ) ( ON ?auto_500071 ?auto_500070 ) ( ON ?auto_500072 ?auto_500071 ) ( ON ?auto_500073 ?auto_500072 ) ( ON ?auto_500074 ?auto_500073 ) ( not ( = ?auto_500067 ?auto_500068 ) ) ( not ( = ?auto_500067 ?auto_500069 ) ) ( not ( = ?auto_500067 ?auto_500070 ) ) ( not ( = ?auto_500067 ?auto_500071 ) ) ( not ( = ?auto_500067 ?auto_500072 ) ) ( not ( = ?auto_500067 ?auto_500073 ) ) ( not ( = ?auto_500067 ?auto_500074 ) ) ( not ( = ?auto_500067 ?auto_500075 ) ) ( not ( = ?auto_500067 ?auto_500076 ) ) ( not ( = ?auto_500067 ?auto_500077 ) ) ( not ( = ?auto_500067 ?auto_500078 ) ) ( not ( = ?auto_500067 ?auto_500079 ) ) ( not ( = ?auto_500067 ?auto_500080 ) ) ( not ( = ?auto_500067 ?auto_500081 ) ) ( not ( = ?auto_500068 ?auto_500069 ) ) ( not ( = ?auto_500068 ?auto_500070 ) ) ( not ( = ?auto_500068 ?auto_500071 ) ) ( not ( = ?auto_500068 ?auto_500072 ) ) ( not ( = ?auto_500068 ?auto_500073 ) ) ( not ( = ?auto_500068 ?auto_500074 ) ) ( not ( = ?auto_500068 ?auto_500075 ) ) ( not ( = ?auto_500068 ?auto_500076 ) ) ( not ( = ?auto_500068 ?auto_500077 ) ) ( not ( = ?auto_500068 ?auto_500078 ) ) ( not ( = ?auto_500068 ?auto_500079 ) ) ( not ( = ?auto_500068 ?auto_500080 ) ) ( not ( = ?auto_500068 ?auto_500081 ) ) ( not ( = ?auto_500069 ?auto_500070 ) ) ( not ( = ?auto_500069 ?auto_500071 ) ) ( not ( = ?auto_500069 ?auto_500072 ) ) ( not ( = ?auto_500069 ?auto_500073 ) ) ( not ( = ?auto_500069 ?auto_500074 ) ) ( not ( = ?auto_500069 ?auto_500075 ) ) ( not ( = ?auto_500069 ?auto_500076 ) ) ( not ( = ?auto_500069 ?auto_500077 ) ) ( not ( = ?auto_500069 ?auto_500078 ) ) ( not ( = ?auto_500069 ?auto_500079 ) ) ( not ( = ?auto_500069 ?auto_500080 ) ) ( not ( = ?auto_500069 ?auto_500081 ) ) ( not ( = ?auto_500070 ?auto_500071 ) ) ( not ( = ?auto_500070 ?auto_500072 ) ) ( not ( = ?auto_500070 ?auto_500073 ) ) ( not ( = ?auto_500070 ?auto_500074 ) ) ( not ( = ?auto_500070 ?auto_500075 ) ) ( not ( = ?auto_500070 ?auto_500076 ) ) ( not ( = ?auto_500070 ?auto_500077 ) ) ( not ( = ?auto_500070 ?auto_500078 ) ) ( not ( = ?auto_500070 ?auto_500079 ) ) ( not ( = ?auto_500070 ?auto_500080 ) ) ( not ( = ?auto_500070 ?auto_500081 ) ) ( not ( = ?auto_500071 ?auto_500072 ) ) ( not ( = ?auto_500071 ?auto_500073 ) ) ( not ( = ?auto_500071 ?auto_500074 ) ) ( not ( = ?auto_500071 ?auto_500075 ) ) ( not ( = ?auto_500071 ?auto_500076 ) ) ( not ( = ?auto_500071 ?auto_500077 ) ) ( not ( = ?auto_500071 ?auto_500078 ) ) ( not ( = ?auto_500071 ?auto_500079 ) ) ( not ( = ?auto_500071 ?auto_500080 ) ) ( not ( = ?auto_500071 ?auto_500081 ) ) ( not ( = ?auto_500072 ?auto_500073 ) ) ( not ( = ?auto_500072 ?auto_500074 ) ) ( not ( = ?auto_500072 ?auto_500075 ) ) ( not ( = ?auto_500072 ?auto_500076 ) ) ( not ( = ?auto_500072 ?auto_500077 ) ) ( not ( = ?auto_500072 ?auto_500078 ) ) ( not ( = ?auto_500072 ?auto_500079 ) ) ( not ( = ?auto_500072 ?auto_500080 ) ) ( not ( = ?auto_500072 ?auto_500081 ) ) ( not ( = ?auto_500073 ?auto_500074 ) ) ( not ( = ?auto_500073 ?auto_500075 ) ) ( not ( = ?auto_500073 ?auto_500076 ) ) ( not ( = ?auto_500073 ?auto_500077 ) ) ( not ( = ?auto_500073 ?auto_500078 ) ) ( not ( = ?auto_500073 ?auto_500079 ) ) ( not ( = ?auto_500073 ?auto_500080 ) ) ( not ( = ?auto_500073 ?auto_500081 ) ) ( not ( = ?auto_500074 ?auto_500075 ) ) ( not ( = ?auto_500074 ?auto_500076 ) ) ( not ( = ?auto_500074 ?auto_500077 ) ) ( not ( = ?auto_500074 ?auto_500078 ) ) ( not ( = ?auto_500074 ?auto_500079 ) ) ( not ( = ?auto_500074 ?auto_500080 ) ) ( not ( = ?auto_500074 ?auto_500081 ) ) ( not ( = ?auto_500075 ?auto_500076 ) ) ( not ( = ?auto_500075 ?auto_500077 ) ) ( not ( = ?auto_500075 ?auto_500078 ) ) ( not ( = ?auto_500075 ?auto_500079 ) ) ( not ( = ?auto_500075 ?auto_500080 ) ) ( not ( = ?auto_500075 ?auto_500081 ) ) ( not ( = ?auto_500076 ?auto_500077 ) ) ( not ( = ?auto_500076 ?auto_500078 ) ) ( not ( = ?auto_500076 ?auto_500079 ) ) ( not ( = ?auto_500076 ?auto_500080 ) ) ( not ( = ?auto_500076 ?auto_500081 ) ) ( not ( = ?auto_500077 ?auto_500078 ) ) ( not ( = ?auto_500077 ?auto_500079 ) ) ( not ( = ?auto_500077 ?auto_500080 ) ) ( not ( = ?auto_500077 ?auto_500081 ) ) ( not ( = ?auto_500078 ?auto_500079 ) ) ( not ( = ?auto_500078 ?auto_500080 ) ) ( not ( = ?auto_500078 ?auto_500081 ) ) ( not ( = ?auto_500079 ?auto_500080 ) ) ( not ( = ?auto_500079 ?auto_500081 ) ) ( not ( = ?auto_500080 ?auto_500081 ) ) ( ON ?auto_500079 ?auto_500080 ) ( ON ?auto_500078 ?auto_500079 ) ( ON ?auto_500077 ?auto_500078 ) ( ON ?auto_500076 ?auto_500077 ) ( CLEAR ?auto_500074 ) ( ON ?auto_500075 ?auto_500076 ) ( CLEAR ?auto_500075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_500067 ?auto_500068 ?auto_500069 ?auto_500070 ?auto_500071 ?auto_500072 ?auto_500073 ?auto_500074 ?auto_500075 )
      ( MAKE-14PILE ?auto_500067 ?auto_500068 ?auto_500069 ?auto_500070 ?auto_500071 ?auto_500072 ?auto_500073 ?auto_500074 ?auto_500075 ?auto_500076 ?auto_500077 ?auto_500078 ?auto_500079 ?auto_500080 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500125 - BLOCK
      ?auto_500126 - BLOCK
      ?auto_500127 - BLOCK
      ?auto_500128 - BLOCK
      ?auto_500129 - BLOCK
      ?auto_500130 - BLOCK
      ?auto_500131 - BLOCK
      ?auto_500132 - BLOCK
      ?auto_500133 - BLOCK
      ?auto_500134 - BLOCK
      ?auto_500135 - BLOCK
      ?auto_500136 - BLOCK
      ?auto_500137 - BLOCK
      ?auto_500138 - BLOCK
    )
    :vars
    (
      ?auto_500139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500138 ?auto_500139 ) ( ON-TABLE ?auto_500125 ) ( ON ?auto_500126 ?auto_500125 ) ( ON ?auto_500127 ?auto_500126 ) ( ON ?auto_500128 ?auto_500127 ) ( ON ?auto_500129 ?auto_500128 ) ( ON ?auto_500130 ?auto_500129 ) ( ON ?auto_500131 ?auto_500130 ) ( not ( = ?auto_500125 ?auto_500126 ) ) ( not ( = ?auto_500125 ?auto_500127 ) ) ( not ( = ?auto_500125 ?auto_500128 ) ) ( not ( = ?auto_500125 ?auto_500129 ) ) ( not ( = ?auto_500125 ?auto_500130 ) ) ( not ( = ?auto_500125 ?auto_500131 ) ) ( not ( = ?auto_500125 ?auto_500132 ) ) ( not ( = ?auto_500125 ?auto_500133 ) ) ( not ( = ?auto_500125 ?auto_500134 ) ) ( not ( = ?auto_500125 ?auto_500135 ) ) ( not ( = ?auto_500125 ?auto_500136 ) ) ( not ( = ?auto_500125 ?auto_500137 ) ) ( not ( = ?auto_500125 ?auto_500138 ) ) ( not ( = ?auto_500125 ?auto_500139 ) ) ( not ( = ?auto_500126 ?auto_500127 ) ) ( not ( = ?auto_500126 ?auto_500128 ) ) ( not ( = ?auto_500126 ?auto_500129 ) ) ( not ( = ?auto_500126 ?auto_500130 ) ) ( not ( = ?auto_500126 ?auto_500131 ) ) ( not ( = ?auto_500126 ?auto_500132 ) ) ( not ( = ?auto_500126 ?auto_500133 ) ) ( not ( = ?auto_500126 ?auto_500134 ) ) ( not ( = ?auto_500126 ?auto_500135 ) ) ( not ( = ?auto_500126 ?auto_500136 ) ) ( not ( = ?auto_500126 ?auto_500137 ) ) ( not ( = ?auto_500126 ?auto_500138 ) ) ( not ( = ?auto_500126 ?auto_500139 ) ) ( not ( = ?auto_500127 ?auto_500128 ) ) ( not ( = ?auto_500127 ?auto_500129 ) ) ( not ( = ?auto_500127 ?auto_500130 ) ) ( not ( = ?auto_500127 ?auto_500131 ) ) ( not ( = ?auto_500127 ?auto_500132 ) ) ( not ( = ?auto_500127 ?auto_500133 ) ) ( not ( = ?auto_500127 ?auto_500134 ) ) ( not ( = ?auto_500127 ?auto_500135 ) ) ( not ( = ?auto_500127 ?auto_500136 ) ) ( not ( = ?auto_500127 ?auto_500137 ) ) ( not ( = ?auto_500127 ?auto_500138 ) ) ( not ( = ?auto_500127 ?auto_500139 ) ) ( not ( = ?auto_500128 ?auto_500129 ) ) ( not ( = ?auto_500128 ?auto_500130 ) ) ( not ( = ?auto_500128 ?auto_500131 ) ) ( not ( = ?auto_500128 ?auto_500132 ) ) ( not ( = ?auto_500128 ?auto_500133 ) ) ( not ( = ?auto_500128 ?auto_500134 ) ) ( not ( = ?auto_500128 ?auto_500135 ) ) ( not ( = ?auto_500128 ?auto_500136 ) ) ( not ( = ?auto_500128 ?auto_500137 ) ) ( not ( = ?auto_500128 ?auto_500138 ) ) ( not ( = ?auto_500128 ?auto_500139 ) ) ( not ( = ?auto_500129 ?auto_500130 ) ) ( not ( = ?auto_500129 ?auto_500131 ) ) ( not ( = ?auto_500129 ?auto_500132 ) ) ( not ( = ?auto_500129 ?auto_500133 ) ) ( not ( = ?auto_500129 ?auto_500134 ) ) ( not ( = ?auto_500129 ?auto_500135 ) ) ( not ( = ?auto_500129 ?auto_500136 ) ) ( not ( = ?auto_500129 ?auto_500137 ) ) ( not ( = ?auto_500129 ?auto_500138 ) ) ( not ( = ?auto_500129 ?auto_500139 ) ) ( not ( = ?auto_500130 ?auto_500131 ) ) ( not ( = ?auto_500130 ?auto_500132 ) ) ( not ( = ?auto_500130 ?auto_500133 ) ) ( not ( = ?auto_500130 ?auto_500134 ) ) ( not ( = ?auto_500130 ?auto_500135 ) ) ( not ( = ?auto_500130 ?auto_500136 ) ) ( not ( = ?auto_500130 ?auto_500137 ) ) ( not ( = ?auto_500130 ?auto_500138 ) ) ( not ( = ?auto_500130 ?auto_500139 ) ) ( not ( = ?auto_500131 ?auto_500132 ) ) ( not ( = ?auto_500131 ?auto_500133 ) ) ( not ( = ?auto_500131 ?auto_500134 ) ) ( not ( = ?auto_500131 ?auto_500135 ) ) ( not ( = ?auto_500131 ?auto_500136 ) ) ( not ( = ?auto_500131 ?auto_500137 ) ) ( not ( = ?auto_500131 ?auto_500138 ) ) ( not ( = ?auto_500131 ?auto_500139 ) ) ( not ( = ?auto_500132 ?auto_500133 ) ) ( not ( = ?auto_500132 ?auto_500134 ) ) ( not ( = ?auto_500132 ?auto_500135 ) ) ( not ( = ?auto_500132 ?auto_500136 ) ) ( not ( = ?auto_500132 ?auto_500137 ) ) ( not ( = ?auto_500132 ?auto_500138 ) ) ( not ( = ?auto_500132 ?auto_500139 ) ) ( not ( = ?auto_500133 ?auto_500134 ) ) ( not ( = ?auto_500133 ?auto_500135 ) ) ( not ( = ?auto_500133 ?auto_500136 ) ) ( not ( = ?auto_500133 ?auto_500137 ) ) ( not ( = ?auto_500133 ?auto_500138 ) ) ( not ( = ?auto_500133 ?auto_500139 ) ) ( not ( = ?auto_500134 ?auto_500135 ) ) ( not ( = ?auto_500134 ?auto_500136 ) ) ( not ( = ?auto_500134 ?auto_500137 ) ) ( not ( = ?auto_500134 ?auto_500138 ) ) ( not ( = ?auto_500134 ?auto_500139 ) ) ( not ( = ?auto_500135 ?auto_500136 ) ) ( not ( = ?auto_500135 ?auto_500137 ) ) ( not ( = ?auto_500135 ?auto_500138 ) ) ( not ( = ?auto_500135 ?auto_500139 ) ) ( not ( = ?auto_500136 ?auto_500137 ) ) ( not ( = ?auto_500136 ?auto_500138 ) ) ( not ( = ?auto_500136 ?auto_500139 ) ) ( not ( = ?auto_500137 ?auto_500138 ) ) ( not ( = ?auto_500137 ?auto_500139 ) ) ( not ( = ?auto_500138 ?auto_500139 ) ) ( ON ?auto_500137 ?auto_500138 ) ( ON ?auto_500136 ?auto_500137 ) ( ON ?auto_500135 ?auto_500136 ) ( ON ?auto_500134 ?auto_500135 ) ( ON ?auto_500133 ?auto_500134 ) ( CLEAR ?auto_500131 ) ( ON ?auto_500132 ?auto_500133 ) ( CLEAR ?auto_500132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_500125 ?auto_500126 ?auto_500127 ?auto_500128 ?auto_500129 ?auto_500130 ?auto_500131 ?auto_500132 )
      ( MAKE-14PILE ?auto_500125 ?auto_500126 ?auto_500127 ?auto_500128 ?auto_500129 ?auto_500130 ?auto_500131 ?auto_500132 ?auto_500133 ?auto_500134 ?auto_500135 ?auto_500136 ?auto_500137 ?auto_500138 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500183 - BLOCK
      ?auto_500184 - BLOCK
      ?auto_500185 - BLOCK
      ?auto_500186 - BLOCK
      ?auto_500187 - BLOCK
      ?auto_500188 - BLOCK
      ?auto_500189 - BLOCK
      ?auto_500190 - BLOCK
      ?auto_500191 - BLOCK
      ?auto_500192 - BLOCK
      ?auto_500193 - BLOCK
      ?auto_500194 - BLOCK
      ?auto_500195 - BLOCK
      ?auto_500196 - BLOCK
    )
    :vars
    (
      ?auto_500197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500196 ?auto_500197 ) ( ON-TABLE ?auto_500183 ) ( ON ?auto_500184 ?auto_500183 ) ( ON ?auto_500185 ?auto_500184 ) ( ON ?auto_500186 ?auto_500185 ) ( ON ?auto_500187 ?auto_500186 ) ( ON ?auto_500188 ?auto_500187 ) ( not ( = ?auto_500183 ?auto_500184 ) ) ( not ( = ?auto_500183 ?auto_500185 ) ) ( not ( = ?auto_500183 ?auto_500186 ) ) ( not ( = ?auto_500183 ?auto_500187 ) ) ( not ( = ?auto_500183 ?auto_500188 ) ) ( not ( = ?auto_500183 ?auto_500189 ) ) ( not ( = ?auto_500183 ?auto_500190 ) ) ( not ( = ?auto_500183 ?auto_500191 ) ) ( not ( = ?auto_500183 ?auto_500192 ) ) ( not ( = ?auto_500183 ?auto_500193 ) ) ( not ( = ?auto_500183 ?auto_500194 ) ) ( not ( = ?auto_500183 ?auto_500195 ) ) ( not ( = ?auto_500183 ?auto_500196 ) ) ( not ( = ?auto_500183 ?auto_500197 ) ) ( not ( = ?auto_500184 ?auto_500185 ) ) ( not ( = ?auto_500184 ?auto_500186 ) ) ( not ( = ?auto_500184 ?auto_500187 ) ) ( not ( = ?auto_500184 ?auto_500188 ) ) ( not ( = ?auto_500184 ?auto_500189 ) ) ( not ( = ?auto_500184 ?auto_500190 ) ) ( not ( = ?auto_500184 ?auto_500191 ) ) ( not ( = ?auto_500184 ?auto_500192 ) ) ( not ( = ?auto_500184 ?auto_500193 ) ) ( not ( = ?auto_500184 ?auto_500194 ) ) ( not ( = ?auto_500184 ?auto_500195 ) ) ( not ( = ?auto_500184 ?auto_500196 ) ) ( not ( = ?auto_500184 ?auto_500197 ) ) ( not ( = ?auto_500185 ?auto_500186 ) ) ( not ( = ?auto_500185 ?auto_500187 ) ) ( not ( = ?auto_500185 ?auto_500188 ) ) ( not ( = ?auto_500185 ?auto_500189 ) ) ( not ( = ?auto_500185 ?auto_500190 ) ) ( not ( = ?auto_500185 ?auto_500191 ) ) ( not ( = ?auto_500185 ?auto_500192 ) ) ( not ( = ?auto_500185 ?auto_500193 ) ) ( not ( = ?auto_500185 ?auto_500194 ) ) ( not ( = ?auto_500185 ?auto_500195 ) ) ( not ( = ?auto_500185 ?auto_500196 ) ) ( not ( = ?auto_500185 ?auto_500197 ) ) ( not ( = ?auto_500186 ?auto_500187 ) ) ( not ( = ?auto_500186 ?auto_500188 ) ) ( not ( = ?auto_500186 ?auto_500189 ) ) ( not ( = ?auto_500186 ?auto_500190 ) ) ( not ( = ?auto_500186 ?auto_500191 ) ) ( not ( = ?auto_500186 ?auto_500192 ) ) ( not ( = ?auto_500186 ?auto_500193 ) ) ( not ( = ?auto_500186 ?auto_500194 ) ) ( not ( = ?auto_500186 ?auto_500195 ) ) ( not ( = ?auto_500186 ?auto_500196 ) ) ( not ( = ?auto_500186 ?auto_500197 ) ) ( not ( = ?auto_500187 ?auto_500188 ) ) ( not ( = ?auto_500187 ?auto_500189 ) ) ( not ( = ?auto_500187 ?auto_500190 ) ) ( not ( = ?auto_500187 ?auto_500191 ) ) ( not ( = ?auto_500187 ?auto_500192 ) ) ( not ( = ?auto_500187 ?auto_500193 ) ) ( not ( = ?auto_500187 ?auto_500194 ) ) ( not ( = ?auto_500187 ?auto_500195 ) ) ( not ( = ?auto_500187 ?auto_500196 ) ) ( not ( = ?auto_500187 ?auto_500197 ) ) ( not ( = ?auto_500188 ?auto_500189 ) ) ( not ( = ?auto_500188 ?auto_500190 ) ) ( not ( = ?auto_500188 ?auto_500191 ) ) ( not ( = ?auto_500188 ?auto_500192 ) ) ( not ( = ?auto_500188 ?auto_500193 ) ) ( not ( = ?auto_500188 ?auto_500194 ) ) ( not ( = ?auto_500188 ?auto_500195 ) ) ( not ( = ?auto_500188 ?auto_500196 ) ) ( not ( = ?auto_500188 ?auto_500197 ) ) ( not ( = ?auto_500189 ?auto_500190 ) ) ( not ( = ?auto_500189 ?auto_500191 ) ) ( not ( = ?auto_500189 ?auto_500192 ) ) ( not ( = ?auto_500189 ?auto_500193 ) ) ( not ( = ?auto_500189 ?auto_500194 ) ) ( not ( = ?auto_500189 ?auto_500195 ) ) ( not ( = ?auto_500189 ?auto_500196 ) ) ( not ( = ?auto_500189 ?auto_500197 ) ) ( not ( = ?auto_500190 ?auto_500191 ) ) ( not ( = ?auto_500190 ?auto_500192 ) ) ( not ( = ?auto_500190 ?auto_500193 ) ) ( not ( = ?auto_500190 ?auto_500194 ) ) ( not ( = ?auto_500190 ?auto_500195 ) ) ( not ( = ?auto_500190 ?auto_500196 ) ) ( not ( = ?auto_500190 ?auto_500197 ) ) ( not ( = ?auto_500191 ?auto_500192 ) ) ( not ( = ?auto_500191 ?auto_500193 ) ) ( not ( = ?auto_500191 ?auto_500194 ) ) ( not ( = ?auto_500191 ?auto_500195 ) ) ( not ( = ?auto_500191 ?auto_500196 ) ) ( not ( = ?auto_500191 ?auto_500197 ) ) ( not ( = ?auto_500192 ?auto_500193 ) ) ( not ( = ?auto_500192 ?auto_500194 ) ) ( not ( = ?auto_500192 ?auto_500195 ) ) ( not ( = ?auto_500192 ?auto_500196 ) ) ( not ( = ?auto_500192 ?auto_500197 ) ) ( not ( = ?auto_500193 ?auto_500194 ) ) ( not ( = ?auto_500193 ?auto_500195 ) ) ( not ( = ?auto_500193 ?auto_500196 ) ) ( not ( = ?auto_500193 ?auto_500197 ) ) ( not ( = ?auto_500194 ?auto_500195 ) ) ( not ( = ?auto_500194 ?auto_500196 ) ) ( not ( = ?auto_500194 ?auto_500197 ) ) ( not ( = ?auto_500195 ?auto_500196 ) ) ( not ( = ?auto_500195 ?auto_500197 ) ) ( not ( = ?auto_500196 ?auto_500197 ) ) ( ON ?auto_500195 ?auto_500196 ) ( ON ?auto_500194 ?auto_500195 ) ( ON ?auto_500193 ?auto_500194 ) ( ON ?auto_500192 ?auto_500193 ) ( ON ?auto_500191 ?auto_500192 ) ( ON ?auto_500190 ?auto_500191 ) ( CLEAR ?auto_500188 ) ( ON ?auto_500189 ?auto_500190 ) ( CLEAR ?auto_500189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_500183 ?auto_500184 ?auto_500185 ?auto_500186 ?auto_500187 ?auto_500188 ?auto_500189 )
      ( MAKE-14PILE ?auto_500183 ?auto_500184 ?auto_500185 ?auto_500186 ?auto_500187 ?auto_500188 ?auto_500189 ?auto_500190 ?auto_500191 ?auto_500192 ?auto_500193 ?auto_500194 ?auto_500195 ?auto_500196 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500241 - BLOCK
      ?auto_500242 - BLOCK
      ?auto_500243 - BLOCK
      ?auto_500244 - BLOCK
      ?auto_500245 - BLOCK
      ?auto_500246 - BLOCK
      ?auto_500247 - BLOCK
      ?auto_500248 - BLOCK
      ?auto_500249 - BLOCK
      ?auto_500250 - BLOCK
      ?auto_500251 - BLOCK
      ?auto_500252 - BLOCK
      ?auto_500253 - BLOCK
      ?auto_500254 - BLOCK
    )
    :vars
    (
      ?auto_500255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500254 ?auto_500255 ) ( ON-TABLE ?auto_500241 ) ( ON ?auto_500242 ?auto_500241 ) ( ON ?auto_500243 ?auto_500242 ) ( ON ?auto_500244 ?auto_500243 ) ( ON ?auto_500245 ?auto_500244 ) ( not ( = ?auto_500241 ?auto_500242 ) ) ( not ( = ?auto_500241 ?auto_500243 ) ) ( not ( = ?auto_500241 ?auto_500244 ) ) ( not ( = ?auto_500241 ?auto_500245 ) ) ( not ( = ?auto_500241 ?auto_500246 ) ) ( not ( = ?auto_500241 ?auto_500247 ) ) ( not ( = ?auto_500241 ?auto_500248 ) ) ( not ( = ?auto_500241 ?auto_500249 ) ) ( not ( = ?auto_500241 ?auto_500250 ) ) ( not ( = ?auto_500241 ?auto_500251 ) ) ( not ( = ?auto_500241 ?auto_500252 ) ) ( not ( = ?auto_500241 ?auto_500253 ) ) ( not ( = ?auto_500241 ?auto_500254 ) ) ( not ( = ?auto_500241 ?auto_500255 ) ) ( not ( = ?auto_500242 ?auto_500243 ) ) ( not ( = ?auto_500242 ?auto_500244 ) ) ( not ( = ?auto_500242 ?auto_500245 ) ) ( not ( = ?auto_500242 ?auto_500246 ) ) ( not ( = ?auto_500242 ?auto_500247 ) ) ( not ( = ?auto_500242 ?auto_500248 ) ) ( not ( = ?auto_500242 ?auto_500249 ) ) ( not ( = ?auto_500242 ?auto_500250 ) ) ( not ( = ?auto_500242 ?auto_500251 ) ) ( not ( = ?auto_500242 ?auto_500252 ) ) ( not ( = ?auto_500242 ?auto_500253 ) ) ( not ( = ?auto_500242 ?auto_500254 ) ) ( not ( = ?auto_500242 ?auto_500255 ) ) ( not ( = ?auto_500243 ?auto_500244 ) ) ( not ( = ?auto_500243 ?auto_500245 ) ) ( not ( = ?auto_500243 ?auto_500246 ) ) ( not ( = ?auto_500243 ?auto_500247 ) ) ( not ( = ?auto_500243 ?auto_500248 ) ) ( not ( = ?auto_500243 ?auto_500249 ) ) ( not ( = ?auto_500243 ?auto_500250 ) ) ( not ( = ?auto_500243 ?auto_500251 ) ) ( not ( = ?auto_500243 ?auto_500252 ) ) ( not ( = ?auto_500243 ?auto_500253 ) ) ( not ( = ?auto_500243 ?auto_500254 ) ) ( not ( = ?auto_500243 ?auto_500255 ) ) ( not ( = ?auto_500244 ?auto_500245 ) ) ( not ( = ?auto_500244 ?auto_500246 ) ) ( not ( = ?auto_500244 ?auto_500247 ) ) ( not ( = ?auto_500244 ?auto_500248 ) ) ( not ( = ?auto_500244 ?auto_500249 ) ) ( not ( = ?auto_500244 ?auto_500250 ) ) ( not ( = ?auto_500244 ?auto_500251 ) ) ( not ( = ?auto_500244 ?auto_500252 ) ) ( not ( = ?auto_500244 ?auto_500253 ) ) ( not ( = ?auto_500244 ?auto_500254 ) ) ( not ( = ?auto_500244 ?auto_500255 ) ) ( not ( = ?auto_500245 ?auto_500246 ) ) ( not ( = ?auto_500245 ?auto_500247 ) ) ( not ( = ?auto_500245 ?auto_500248 ) ) ( not ( = ?auto_500245 ?auto_500249 ) ) ( not ( = ?auto_500245 ?auto_500250 ) ) ( not ( = ?auto_500245 ?auto_500251 ) ) ( not ( = ?auto_500245 ?auto_500252 ) ) ( not ( = ?auto_500245 ?auto_500253 ) ) ( not ( = ?auto_500245 ?auto_500254 ) ) ( not ( = ?auto_500245 ?auto_500255 ) ) ( not ( = ?auto_500246 ?auto_500247 ) ) ( not ( = ?auto_500246 ?auto_500248 ) ) ( not ( = ?auto_500246 ?auto_500249 ) ) ( not ( = ?auto_500246 ?auto_500250 ) ) ( not ( = ?auto_500246 ?auto_500251 ) ) ( not ( = ?auto_500246 ?auto_500252 ) ) ( not ( = ?auto_500246 ?auto_500253 ) ) ( not ( = ?auto_500246 ?auto_500254 ) ) ( not ( = ?auto_500246 ?auto_500255 ) ) ( not ( = ?auto_500247 ?auto_500248 ) ) ( not ( = ?auto_500247 ?auto_500249 ) ) ( not ( = ?auto_500247 ?auto_500250 ) ) ( not ( = ?auto_500247 ?auto_500251 ) ) ( not ( = ?auto_500247 ?auto_500252 ) ) ( not ( = ?auto_500247 ?auto_500253 ) ) ( not ( = ?auto_500247 ?auto_500254 ) ) ( not ( = ?auto_500247 ?auto_500255 ) ) ( not ( = ?auto_500248 ?auto_500249 ) ) ( not ( = ?auto_500248 ?auto_500250 ) ) ( not ( = ?auto_500248 ?auto_500251 ) ) ( not ( = ?auto_500248 ?auto_500252 ) ) ( not ( = ?auto_500248 ?auto_500253 ) ) ( not ( = ?auto_500248 ?auto_500254 ) ) ( not ( = ?auto_500248 ?auto_500255 ) ) ( not ( = ?auto_500249 ?auto_500250 ) ) ( not ( = ?auto_500249 ?auto_500251 ) ) ( not ( = ?auto_500249 ?auto_500252 ) ) ( not ( = ?auto_500249 ?auto_500253 ) ) ( not ( = ?auto_500249 ?auto_500254 ) ) ( not ( = ?auto_500249 ?auto_500255 ) ) ( not ( = ?auto_500250 ?auto_500251 ) ) ( not ( = ?auto_500250 ?auto_500252 ) ) ( not ( = ?auto_500250 ?auto_500253 ) ) ( not ( = ?auto_500250 ?auto_500254 ) ) ( not ( = ?auto_500250 ?auto_500255 ) ) ( not ( = ?auto_500251 ?auto_500252 ) ) ( not ( = ?auto_500251 ?auto_500253 ) ) ( not ( = ?auto_500251 ?auto_500254 ) ) ( not ( = ?auto_500251 ?auto_500255 ) ) ( not ( = ?auto_500252 ?auto_500253 ) ) ( not ( = ?auto_500252 ?auto_500254 ) ) ( not ( = ?auto_500252 ?auto_500255 ) ) ( not ( = ?auto_500253 ?auto_500254 ) ) ( not ( = ?auto_500253 ?auto_500255 ) ) ( not ( = ?auto_500254 ?auto_500255 ) ) ( ON ?auto_500253 ?auto_500254 ) ( ON ?auto_500252 ?auto_500253 ) ( ON ?auto_500251 ?auto_500252 ) ( ON ?auto_500250 ?auto_500251 ) ( ON ?auto_500249 ?auto_500250 ) ( ON ?auto_500248 ?auto_500249 ) ( ON ?auto_500247 ?auto_500248 ) ( CLEAR ?auto_500245 ) ( ON ?auto_500246 ?auto_500247 ) ( CLEAR ?auto_500246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_500241 ?auto_500242 ?auto_500243 ?auto_500244 ?auto_500245 ?auto_500246 )
      ( MAKE-14PILE ?auto_500241 ?auto_500242 ?auto_500243 ?auto_500244 ?auto_500245 ?auto_500246 ?auto_500247 ?auto_500248 ?auto_500249 ?auto_500250 ?auto_500251 ?auto_500252 ?auto_500253 ?auto_500254 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500299 - BLOCK
      ?auto_500300 - BLOCK
      ?auto_500301 - BLOCK
      ?auto_500302 - BLOCK
      ?auto_500303 - BLOCK
      ?auto_500304 - BLOCK
      ?auto_500305 - BLOCK
      ?auto_500306 - BLOCK
      ?auto_500307 - BLOCK
      ?auto_500308 - BLOCK
      ?auto_500309 - BLOCK
      ?auto_500310 - BLOCK
      ?auto_500311 - BLOCK
      ?auto_500312 - BLOCK
    )
    :vars
    (
      ?auto_500313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500312 ?auto_500313 ) ( ON-TABLE ?auto_500299 ) ( ON ?auto_500300 ?auto_500299 ) ( ON ?auto_500301 ?auto_500300 ) ( ON ?auto_500302 ?auto_500301 ) ( not ( = ?auto_500299 ?auto_500300 ) ) ( not ( = ?auto_500299 ?auto_500301 ) ) ( not ( = ?auto_500299 ?auto_500302 ) ) ( not ( = ?auto_500299 ?auto_500303 ) ) ( not ( = ?auto_500299 ?auto_500304 ) ) ( not ( = ?auto_500299 ?auto_500305 ) ) ( not ( = ?auto_500299 ?auto_500306 ) ) ( not ( = ?auto_500299 ?auto_500307 ) ) ( not ( = ?auto_500299 ?auto_500308 ) ) ( not ( = ?auto_500299 ?auto_500309 ) ) ( not ( = ?auto_500299 ?auto_500310 ) ) ( not ( = ?auto_500299 ?auto_500311 ) ) ( not ( = ?auto_500299 ?auto_500312 ) ) ( not ( = ?auto_500299 ?auto_500313 ) ) ( not ( = ?auto_500300 ?auto_500301 ) ) ( not ( = ?auto_500300 ?auto_500302 ) ) ( not ( = ?auto_500300 ?auto_500303 ) ) ( not ( = ?auto_500300 ?auto_500304 ) ) ( not ( = ?auto_500300 ?auto_500305 ) ) ( not ( = ?auto_500300 ?auto_500306 ) ) ( not ( = ?auto_500300 ?auto_500307 ) ) ( not ( = ?auto_500300 ?auto_500308 ) ) ( not ( = ?auto_500300 ?auto_500309 ) ) ( not ( = ?auto_500300 ?auto_500310 ) ) ( not ( = ?auto_500300 ?auto_500311 ) ) ( not ( = ?auto_500300 ?auto_500312 ) ) ( not ( = ?auto_500300 ?auto_500313 ) ) ( not ( = ?auto_500301 ?auto_500302 ) ) ( not ( = ?auto_500301 ?auto_500303 ) ) ( not ( = ?auto_500301 ?auto_500304 ) ) ( not ( = ?auto_500301 ?auto_500305 ) ) ( not ( = ?auto_500301 ?auto_500306 ) ) ( not ( = ?auto_500301 ?auto_500307 ) ) ( not ( = ?auto_500301 ?auto_500308 ) ) ( not ( = ?auto_500301 ?auto_500309 ) ) ( not ( = ?auto_500301 ?auto_500310 ) ) ( not ( = ?auto_500301 ?auto_500311 ) ) ( not ( = ?auto_500301 ?auto_500312 ) ) ( not ( = ?auto_500301 ?auto_500313 ) ) ( not ( = ?auto_500302 ?auto_500303 ) ) ( not ( = ?auto_500302 ?auto_500304 ) ) ( not ( = ?auto_500302 ?auto_500305 ) ) ( not ( = ?auto_500302 ?auto_500306 ) ) ( not ( = ?auto_500302 ?auto_500307 ) ) ( not ( = ?auto_500302 ?auto_500308 ) ) ( not ( = ?auto_500302 ?auto_500309 ) ) ( not ( = ?auto_500302 ?auto_500310 ) ) ( not ( = ?auto_500302 ?auto_500311 ) ) ( not ( = ?auto_500302 ?auto_500312 ) ) ( not ( = ?auto_500302 ?auto_500313 ) ) ( not ( = ?auto_500303 ?auto_500304 ) ) ( not ( = ?auto_500303 ?auto_500305 ) ) ( not ( = ?auto_500303 ?auto_500306 ) ) ( not ( = ?auto_500303 ?auto_500307 ) ) ( not ( = ?auto_500303 ?auto_500308 ) ) ( not ( = ?auto_500303 ?auto_500309 ) ) ( not ( = ?auto_500303 ?auto_500310 ) ) ( not ( = ?auto_500303 ?auto_500311 ) ) ( not ( = ?auto_500303 ?auto_500312 ) ) ( not ( = ?auto_500303 ?auto_500313 ) ) ( not ( = ?auto_500304 ?auto_500305 ) ) ( not ( = ?auto_500304 ?auto_500306 ) ) ( not ( = ?auto_500304 ?auto_500307 ) ) ( not ( = ?auto_500304 ?auto_500308 ) ) ( not ( = ?auto_500304 ?auto_500309 ) ) ( not ( = ?auto_500304 ?auto_500310 ) ) ( not ( = ?auto_500304 ?auto_500311 ) ) ( not ( = ?auto_500304 ?auto_500312 ) ) ( not ( = ?auto_500304 ?auto_500313 ) ) ( not ( = ?auto_500305 ?auto_500306 ) ) ( not ( = ?auto_500305 ?auto_500307 ) ) ( not ( = ?auto_500305 ?auto_500308 ) ) ( not ( = ?auto_500305 ?auto_500309 ) ) ( not ( = ?auto_500305 ?auto_500310 ) ) ( not ( = ?auto_500305 ?auto_500311 ) ) ( not ( = ?auto_500305 ?auto_500312 ) ) ( not ( = ?auto_500305 ?auto_500313 ) ) ( not ( = ?auto_500306 ?auto_500307 ) ) ( not ( = ?auto_500306 ?auto_500308 ) ) ( not ( = ?auto_500306 ?auto_500309 ) ) ( not ( = ?auto_500306 ?auto_500310 ) ) ( not ( = ?auto_500306 ?auto_500311 ) ) ( not ( = ?auto_500306 ?auto_500312 ) ) ( not ( = ?auto_500306 ?auto_500313 ) ) ( not ( = ?auto_500307 ?auto_500308 ) ) ( not ( = ?auto_500307 ?auto_500309 ) ) ( not ( = ?auto_500307 ?auto_500310 ) ) ( not ( = ?auto_500307 ?auto_500311 ) ) ( not ( = ?auto_500307 ?auto_500312 ) ) ( not ( = ?auto_500307 ?auto_500313 ) ) ( not ( = ?auto_500308 ?auto_500309 ) ) ( not ( = ?auto_500308 ?auto_500310 ) ) ( not ( = ?auto_500308 ?auto_500311 ) ) ( not ( = ?auto_500308 ?auto_500312 ) ) ( not ( = ?auto_500308 ?auto_500313 ) ) ( not ( = ?auto_500309 ?auto_500310 ) ) ( not ( = ?auto_500309 ?auto_500311 ) ) ( not ( = ?auto_500309 ?auto_500312 ) ) ( not ( = ?auto_500309 ?auto_500313 ) ) ( not ( = ?auto_500310 ?auto_500311 ) ) ( not ( = ?auto_500310 ?auto_500312 ) ) ( not ( = ?auto_500310 ?auto_500313 ) ) ( not ( = ?auto_500311 ?auto_500312 ) ) ( not ( = ?auto_500311 ?auto_500313 ) ) ( not ( = ?auto_500312 ?auto_500313 ) ) ( ON ?auto_500311 ?auto_500312 ) ( ON ?auto_500310 ?auto_500311 ) ( ON ?auto_500309 ?auto_500310 ) ( ON ?auto_500308 ?auto_500309 ) ( ON ?auto_500307 ?auto_500308 ) ( ON ?auto_500306 ?auto_500307 ) ( ON ?auto_500305 ?auto_500306 ) ( ON ?auto_500304 ?auto_500305 ) ( CLEAR ?auto_500302 ) ( ON ?auto_500303 ?auto_500304 ) ( CLEAR ?auto_500303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_500299 ?auto_500300 ?auto_500301 ?auto_500302 ?auto_500303 )
      ( MAKE-14PILE ?auto_500299 ?auto_500300 ?auto_500301 ?auto_500302 ?auto_500303 ?auto_500304 ?auto_500305 ?auto_500306 ?auto_500307 ?auto_500308 ?auto_500309 ?auto_500310 ?auto_500311 ?auto_500312 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500357 - BLOCK
      ?auto_500358 - BLOCK
      ?auto_500359 - BLOCK
      ?auto_500360 - BLOCK
      ?auto_500361 - BLOCK
      ?auto_500362 - BLOCK
      ?auto_500363 - BLOCK
      ?auto_500364 - BLOCK
      ?auto_500365 - BLOCK
      ?auto_500366 - BLOCK
      ?auto_500367 - BLOCK
      ?auto_500368 - BLOCK
      ?auto_500369 - BLOCK
      ?auto_500370 - BLOCK
    )
    :vars
    (
      ?auto_500371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500370 ?auto_500371 ) ( ON-TABLE ?auto_500357 ) ( ON ?auto_500358 ?auto_500357 ) ( ON ?auto_500359 ?auto_500358 ) ( not ( = ?auto_500357 ?auto_500358 ) ) ( not ( = ?auto_500357 ?auto_500359 ) ) ( not ( = ?auto_500357 ?auto_500360 ) ) ( not ( = ?auto_500357 ?auto_500361 ) ) ( not ( = ?auto_500357 ?auto_500362 ) ) ( not ( = ?auto_500357 ?auto_500363 ) ) ( not ( = ?auto_500357 ?auto_500364 ) ) ( not ( = ?auto_500357 ?auto_500365 ) ) ( not ( = ?auto_500357 ?auto_500366 ) ) ( not ( = ?auto_500357 ?auto_500367 ) ) ( not ( = ?auto_500357 ?auto_500368 ) ) ( not ( = ?auto_500357 ?auto_500369 ) ) ( not ( = ?auto_500357 ?auto_500370 ) ) ( not ( = ?auto_500357 ?auto_500371 ) ) ( not ( = ?auto_500358 ?auto_500359 ) ) ( not ( = ?auto_500358 ?auto_500360 ) ) ( not ( = ?auto_500358 ?auto_500361 ) ) ( not ( = ?auto_500358 ?auto_500362 ) ) ( not ( = ?auto_500358 ?auto_500363 ) ) ( not ( = ?auto_500358 ?auto_500364 ) ) ( not ( = ?auto_500358 ?auto_500365 ) ) ( not ( = ?auto_500358 ?auto_500366 ) ) ( not ( = ?auto_500358 ?auto_500367 ) ) ( not ( = ?auto_500358 ?auto_500368 ) ) ( not ( = ?auto_500358 ?auto_500369 ) ) ( not ( = ?auto_500358 ?auto_500370 ) ) ( not ( = ?auto_500358 ?auto_500371 ) ) ( not ( = ?auto_500359 ?auto_500360 ) ) ( not ( = ?auto_500359 ?auto_500361 ) ) ( not ( = ?auto_500359 ?auto_500362 ) ) ( not ( = ?auto_500359 ?auto_500363 ) ) ( not ( = ?auto_500359 ?auto_500364 ) ) ( not ( = ?auto_500359 ?auto_500365 ) ) ( not ( = ?auto_500359 ?auto_500366 ) ) ( not ( = ?auto_500359 ?auto_500367 ) ) ( not ( = ?auto_500359 ?auto_500368 ) ) ( not ( = ?auto_500359 ?auto_500369 ) ) ( not ( = ?auto_500359 ?auto_500370 ) ) ( not ( = ?auto_500359 ?auto_500371 ) ) ( not ( = ?auto_500360 ?auto_500361 ) ) ( not ( = ?auto_500360 ?auto_500362 ) ) ( not ( = ?auto_500360 ?auto_500363 ) ) ( not ( = ?auto_500360 ?auto_500364 ) ) ( not ( = ?auto_500360 ?auto_500365 ) ) ( not ( = ?auto_500360 ?auto_500366 ) ) ( not ( = ?auto_500360 ?auto_500367 ) ) ( not ( = ?auto_500360 ?auto_500368 ) ) ( not ( = ?auto_500360 ?auto_500369 ) ) ( not ( = ?auto_500360 ?auto_500370 ) ) ( not ( = ?auto_500360 ?auto_500371 ) ) ( not ( = ?auto_500361 ?auto_500362 ) ) ( not ( = ?auto_500361 ?auto_500363 ) ) ( not ( = ?auto_500361 ?auto_500364 ) ) ( not ( = ?auto_500361 ?auto_500365 ) ) ( not ( = ?auto_500361 ?auto_500366 ) ) ( not ( = ?auto_500361 ?auto_500367 ) ) ( not ( = ?auto_500361 ?auto_500368 ) ) ( not ( = ?auto_500361 ?auto_500369 ) ) ( not ( = ?auto_500361 ?auto_500370 ) ) ( not ( = ?auto_500361 ?auto_500371 ) ) ( not ( = ?auto_500362 ?auto_500363 ) ) ( not ( = ?auto_500362 ?auto_500364 ) ) ( not ( = ?auto_500362 ?auto_500365 ) ) ( not ( = ?auto_500362 ?auto_500366 ) ) ( not ( = ?auto_500362 ?auto_500367 ) ) ( not ( = ?auto_500362 ?auto_500368 ) ) ( not ( = ?auto_500362 ?auto_500369 ) ) ( not ( = ?auto_500362 ?auto_500370 ) ) ( not ( = ?auto_500362 ?auto_500371 ) ) ( not ( = ?auto_500363 ?auto_500364 ) ) ( not ( = ?auto_500363 ?auto_500365 ) ) ( not ( = ?auto_500363 ?auto_500366 ) ) ( not ( = ?auto_500363 ?auto_500367 ) ) ( not ( = ?auto_500363 ?auto_500368 ) ) ( not ( = ?auto_500363 ?auto_500369 ) ) ( not ( = ?auto_500363 ?auto_500370 ) ) ( not ( = ?auto_500363 ?auto_500371 ) ) ( not ( = ?auto_500364 ?auto_500365 ) ) ( not ( = ?auto_500364 ?auto_500366 ) ) ( not ( = ?auto_500364 ?auto_500367 ) ) ( not ( = ?auto_500364 ?auto_500368 ) ) ( not ( = ?auto_500364 ?auto_500369 ) ) ( not ( = ?auto_500364 ?auto_500370 ) ) ( not ( = ?auto_500364 ?auto_500371 ) ) ( not ( = ?auto_500365 ?auto_500366 ) ) ( not ( = ?auto_500365 ?auto_500367 ) ) ( not ( = ?auto_500365 ?auto_500368 ) ) ( not ( = ?auto_500365 ?auto_500369 ) ) ( not ( = ?auto_500365 ?auto_500370 ) ) ( not ( = ?auto_500365 ?auto_500371 ) ) ( not ( = ?auto_500366 ?auto_500367 ) ) ( not ( = ?auto_500366 ?auto_500368 ) ) ( not ( = ?auto_500366 ?auto_500369 ) ) ( not ( = ?auto_500366 ?auto_500370 ) ) ( not ( = ?auto_500366 ?auto_500371 ) ) ( not ( = ?auto_500367 ?auto_500368 ) ) ( not ( = ?auto_500367 ?auto_500369 ) ) ( not ( = ?auto_500367 ?auto_500370 ) ) ( not ( = ?auto_500367 ?auto_500371 ) ) ( not ( = ?auto_500368 ?auto_500369 ) ) ( not ( = ?auto_500368 ?auto_500370 ) ) ( not ( = ?auto_500368 ?auto_500371 ) ) ( not ( = ?auto_500369 ?auto_500370 ) ) ( not ( = ?auto_500369 ?auto_500371 ) ) ( not ( = ?auto_500370 ?auto_500371 ) ) ( ON ?auto_500369 ?auto_500370 ) ( ON ?auto_500368 ?auto_500369 ) ( ON ?auto_500367 ?auto_500368 ) ( ON ?auto_500366 ?auto_500367 ) ( ON ?auto_500365 ?auto_500366 ) ( ON ?auto_500364 ?auto_500365 ) ( ON ?auto_500363 ?auto_500364 ) ( ON ?auto_500362 ?auto_500363 ) ( ON ?auto_500361 ?auto_500362 ) ( CLEAR ?auto_500359 ) ( ON ?auto_500360 ?auto_500361 ) ( CLEAR ?auto_500360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_500357 ?auto_500358 ?auto_500359 ?auto_500360 )
      ( MAKE-14PILE ?auto_500357 ?auto_500358 ?auto_500359 ?auto_500360 ?auto_500361 ?auto_500362 ?auto_500363 ?auto_500364 ?auto_500365 ?auto_500366 ?auto_500367 ?auto_500368 ?auto_500369 ?auto_500370 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500415 - BLOCK
      ?auto_500416 - BLOCK
      ?auto_500417 - BLOCK
      ?auto_500418 - BLOCK
      ?auto_500419 - BLOCK
      ?auto_500420 - BLOCK
      ?auto_500421 - BLOCK
      ?auto_500422 - BLOCK
      ?auto_500423 - BLOCK
      ?auto_500424 - BLOCK
      ?auto_500425 - BLOCK
      ?auto_500426 - BLOCK
      ?auto_500427 - BLOCK
      ?auto_500428 - BLOCK
    )
    :vars
    (
      ?auto_500429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500428 ?auto_500429 ) ( ON-TABLE ?auto_500415 ) ( ON ?auto_500416 ?auto_500415 ) ( not ( = ?auto_500415 ?auto_500416 ) ) ( not ( = ?auto_500415 ?auto_500417 ) ) ( not ( = ?auto_500415 ?auto_500418 ) ) ( not ( = ?auto_500415 ?auto_500419 ) ) ( not ( = ?auto_500415 ?auto_500420 ) ) ( not ( = ?auto_500415 ?auto_500421 ) ) ( not ( = ?auto_500415 ?auto_500422 ) ) ( not ( = ?auto_500415 ?auto_500423 ) ) ( not ( = ?auto_500415 ?auto_500424 ) ) ( not ( = ?auto_500415 ?auto_500425 ) ) ( not ( = ?auto_500415 ?auto_500426 ) ) ( not ( = ?auto_500415 ?auto_500427 ) ) ( not ( = ?auto_500415 ?auto_500428 ) ) ( not ( = ?auto_500415 ?auto_500429 ) ) ( not ( = ?auto_500416 ?auto_500417 ) ) ( not ( = ?auto_500416 ?auto_500418 ) ) ( not ( = ?auto_500416 ?auto_500419 ) ) ( not ( = ?auto_500416 ?auto_500420 ) ) ( not ( = ?auto_500416 ?auto_500421 ) ) ( not ( = ?auto_500416 ?auto_500422 ) ) ( not ( = ?auto_500416 ?auto_500423 ) ) ( not ( = ?auto_500416 ?auto_500424 ) ) ( not ( = ?auto_500416 ?auto_500425 ) ) ( not ( = ?auto_500416 ?auto_500426 ) ) ( not ( = ?auto_500416 ?auto_500427 ) ) ( not ( = ?auto_500416 ?auto_500428 ) ) ( not ( = ?auto_500416 ?auto_500429 ) ) ( not ( = ?auto_500417 ?auto_500418 ) ) ( not ( = ?auto_500417 ?auto_500419 ) ) ( not ( = ?auto_500417 ?auto_500420 ) ) ( not ( = ?auto_500417 ?auto_500421 ) ) ( not ( = ?auto_500417 ?auto_500422 ) ) ( not ( = ?auto_500417 ?auto_500423 ) ) ( not ( = ?auto_500417 ?auto_500424 ) ) ( not ( = ?auto_500417 ?auto_500425 ) ) ( not ( = ?auto_500417 ?auto_500426 ) ) ( not ( = ?auto_500417 ?auto_500427 ) ) ( not ( = ?auto_500417 ?auto_500428 ) ) ( not ( = ?auto_500417 ?auto_500429 ) ) ( not ( = ?auto_500418 ?auto_500419 ) ) ( not ( = ?auto_500418 ?auto_500420 ) ) ( not ( = ?auto_500418 ?auto_500421 ) ) ( not ( = ?auto_500418 ?auto_500422 ) ) ( not ( = ?auto_500418 ?auto_500423 ) ) ( not ( = ?auto_500418 ?auto_500424 ) ) ( not ( = ?auto_500418 ?auto_500425 ) ) ( not ( = ?auto_500418 ?auto_500426 ) ) ( not ( = ?auto_500418 ?auto_500427 ) ) ( not ( = ?auto_500418 ?auto_500428 ) ) ( not ( = ?auto_500418 ?auto_500429 ) ) ( not ( = ?auto_500419 ?auto_500420 ) ) ( not ( = ?auto_500419 ?auto_500421 ) ) ( not ( = ?auto_500419 ?auto_500422 ) ) ( not ( = ?auto_500419 ?auto_500423 ) ) ( not ( = ?auto_500419 ?auto_500424 ) ) ( not ( = ?auto_500419 ?auto_500425 ) ) ( not ( = ?auto_500419 ?auto_500426 ) ) ( not ( = ?auto_500419 ?auto_500427 ) ) ( not ( = ?auto_500419 ?auto_500428 ) ) ( not ( = ?auto_500419 ?auto_500429 ) ) ( not ( = ?auto_500420 ?auto_500421 ) ) ( not ( = ?auto_500420 ?auto_500422 ) ) ( not ( = ?auto_500420 ?auto_500423 ) ) ( not ( = ?auto_500420 ?auto_500424 ) ) ( not ( = ?auto_500420 ?auto_500425 ) ) ( not ( = ?auto_500420 ?auto_500426 ) ) ( not ( = ?auto_500420 ?auto_500427 ) ) ( not ( = ?auto_500420 ?auto_500428 ) ) ( not ( = ?auto_500420 ?auto_500429 ) ) ( not ( = ?auto_500421 ?auto_500422 ) ) ( not ( = ?auto_500421 ?auto_500423 ) ) ( not ( = ?auto_500421 ?auto_500424 ) ) ( not ( = ?auto_500421 ?auto_500425 ) ) ( not ( = ?auto_500421 ?auto_500426 ) ) ( not ( = ?auto_500421 ?auto_500427 ) ) ( not ( = ?auto_500421 ?auto_500428 ) ) ( not ( = ?auto_500421 ?auto_500429 ) ) ( not ( = ?auto_500422 ?auto_500423 ) ) ( not ( = ?auto_500422 ?auto_500424 ) ) ( not ( = ?auto_500422 ?auto_500425 ) ) ( not ( = ?auto_500422 ?auto_500426 ) ) ( not ( = ?auto_500422 ?auto_500427 ) ) ( not ( = ?auto_500422 ?auto_500428 ) ) ( not ( = ?auto_500422 ?auto_500429 ) ) ( not ( = ?auto_500423 ?auto_500424 ) ) ( not ( = ?auto_500423 ?auto_500425 ) ) ( not ( = ?auto_500423 ?auto_500426 ) ) ( not ( = ?auto_500423 ?auto_500427 ) ) ( not ( = ?auto_500423 ?auto_500428 ) ) ( not ( = ?auto_500423 ?auto_500429 ) ) ( not ( = ?auto_500424 ?auto_500425 ) ) ( not ( = ?auto_500424 ?auto_500426 ) ) ( not ( = ?auto_500424 ?auto_500427 ) ) ( not ( = ?auto_500424 ?auto_500428 ) ) ( not ( = ?auto_500424 ?auto_500429 ) ) ( not ( = ?auto_500425 ?auto_500426 ) ) ( not ( = ?auto_500425 ?auto_500427 ) ) ( not ( = ?auto_500425 ?auto_500428 ) ) ( not ( = ?auto_500425 ?auto_500429 ) ) ( not ( = ?auto_500426 ?auto_500427 ) ) ( not ( = ?auto_500426 ?auto_500428 ) ) ( not ( = ?auto_500426 ?auto_500429 ) ) ( not ( = ?auto_500427 ?auto_500428 ) ) ( not ( = ?auto_500427 ?auto_500429 ) ) ( not ( = ?auto_500428 ?auto_500429 ) ) ( ON ?auto_500427 ?auto_500428 ) ( ON ?auto_500426 ?auto_500427 ) ( ON ?auto_500425 ?auto_500426 ) ( ON ?auto_500424 ?auto_500425 ) ( ON ?auto_500423 ?auto_500424 ) ( ON ?auto_500422 ?auto_500423 ) ( ON ?auto_500421 ?auto_500422 ) ( ON ?auto_500420 ?auto_500421 ) ( ON ?auto_500419 ?auto_500420 ) ( ON ?auto_500418 ?auto_500419 ) ( CLEAR ?auto_500416 ) ( ON ?auto_500417 ?auto_500418 ) ( CLEAR ?auto_500417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_500415 ?auto_500416 ?auto_500417 )
      ( MAKE-14PILE ?auto_500415 ?auto_500416 ?auto_500417 ?auto_500418 ?auto_500419 ?auto_500420 ?auto_500421 ?auto_500422 ?auto_500423 ?auto_500424 ?auto_500425 ?auto_500426 ?auto_500427 ?auto_500428 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500473 - BLOCK
      ?auto_500474 - BLOCK
      ?auto_500475 - BLOCK
      ?auto_500476 - BLOCK
      ?auto_500477 - BLOCK
      ?auto_500478 - BLOCK
      ?auto_500479 - BLOCK
      ?auto_500480 - BLOCK
      ?auto_500481 - BLOCK
      ?auto_500482 - BLOCK
      ?auto_500483 - BLOCK
      ?auto_500484 - BLOCK
      ?auto_500485 - BLOCK
      ?auto_500486 - BLOCK
    )
    :vars
    (
      ?auto_500487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500486 ?auto_500487 ) ( ON-TABLE ?auto_500473 ) ( not ( = ?auto_500473 ?auto_500474 ) ) ( not ( = ?auto_500473 ?auto_500475 ) ) ( not ( = ?auto_500473 ?auto_500476 ) ) ( not ( = ?auto_500473 ?auto_500477 ) ) ( not ( = ?auto_500473 ?auto_500478 ) ) ( not ( = ?auto_500473 ?auto_500479 ) ) ( not ( = ?auto_500473 ?auto_500480 ) ) ( not ( = ?auto_500473 ?auto_500481 ) ) ( not ( = ?auto_500473 ?auto_500482 ) ) ( not ( = ?auto_500473 ?auto_500483 ) ) ( not ( = ?auto_500473 ?auto_500484 ) ) ( not ( = ?auto_500473 ?auto_500485 ) ) ( not ( = ?auto_500473 ?auto_500486 ) ) ( not ( = ?auto_500473 ?auto_500487 ) ) ( not ( = ?auto_500474 ?auto_500475 ) ) ( not ( = ?auto_500474 ?auto_500476 ) ) ( not ( = ?auto_500474 ?auto_500477 ) ) ( not ( = ?auto_500474 ?auto_500478 ) ) ( not ( = ?auto_500474 ?auto_500479 ) ) ( not ( = ?auto_500474 ?auto_500480 ) ) ( not ( = ?auto_500474 ?auto_500481 ) ) ( not ( = ?auto_500474 ?auto_500482 ) ) ( not ( = ?auto_500474 ?auto_500483 ) ) ( not ( = ?auto_500474 ?auto_500484 ) ) ( not ( = ?auto_500474 ?auto_500485 ) ) ( not ( = ?auto_500474 ?auto_500486 ) ) ( not ( = ?auto_500474 ?auto_500487 ) ) ( not ( = ?auto_500475 ?auto_500476 ) ) ( not ( = ?auto_500475 ?auto_500477 ) ) ( not ( = ?auto_500475 ?auto_500478 ) ) ( not ( = ?auto_500475 ?auto_500479 ) ) ( not ( = ?auto_500475 ?auto_500480 ) ) ( not ( = ?auto_500475 ?auto_500481 ) ) ( not ( = ?auto_500475 ?auto_500482 ) ) ( not ( = ?auto_500475 ?auto_500483 ) ) ( not ( = ?auto_500475 ?auto_500484 ) ) ( not ( = ?auto_500475 ?auto_500485 ) ) ( not ( = ?auto_500475 ?auto_500486 ) ) ( not ( = ?auto_500475 ?auto_500487 ) ) ( not ( = ?auto_500476 ?auto_500477 ) ) ( not ( = ?auto_500476 ?auto_500478 ) ) ( not ( = ?auto_500476 ?auto_500479 ) ) ( not ( = ?auto_500476 ?auto_500480 ) ) ( not ( = ?auto_500476 ?auto_500481 ) ) ( not ( = ?auto_500476 ?auto_500482 ) ) ( not ( = ?auto_500476 ?auto_500483 ) ) ( not ( = ?auto_500476 ?auto_500484 ) ) ( not ( = ?auto_500476 ?auto_500485 ) ) ( not ( = ?auto_500476 ?auto_500486 ) ) ( not ( = ?auto_500476 ?auto_500487 ) ) ( not ( = ?auto_500477 ?auto_500478 ) ) ( not ( = ?auto_500477 ?auto_500479 ) ) ( not ( = ?auto_500477 ?auto_500480 ) ) ( not ( = ?auto_500477 ?auto_500481 ) ) ( not ( = ?auto_500477 ?auto_500482 ) ) ( not ( = ?auto_500477 ?auto_500483 ) ) ( not ( = ?auto_500477 ?auto_500484 ) ) ( not ( = ?auto_500477 ?auto_500485 ) ) ( not ( = ?auto_500477 ?auto_500486 ) ) ( not ( = ?auto_500477 ?auto_500487 ) ) ( not ( = ?auto_500478 ?auto_500479 ) ) ( not ( = ?auto_500478 ?auto_500480 ) ) ( not ( = ?auto_500478 ?auto_500481 ) ) ( not ( = ?auto_500478 ?auto_500482 ) ) ( not ( = ?auto_500478 ?auto_500483 ) ) ( not ( = ?auto_500478 ?auto_500484 ) ) ( not ( = ?auto_500478 ?auto_500485 ) ) ( not ( = ?auto_500478 ?auto_500486 ) ) ( not ( = ?auto_500478 ?auto_500487 ) ) ( not ( = ?auto_500479 ?auto_500480 ) ) ( not ( = ?auto_500479 ?auto_500481 ) ) ( not ( = ?auto_500479 ?auto_500482 ) ) ( not ( = ?auto_500479 ?auto_500483 ) ) ( not ( = ?auto_500479 ?auto_500484 ) ) ( not ( = ?auto_500479 ?auto_500485 ) ) ( not ( = ?auto_500479 ?auto_500486 ) ) ( not ( = ?auto_500479 ?auto_500487 ) ) ( not ( = ?auto_500480 ?auto_500481 ) ) ( not ( = ?auto_500480 ?auto_500482 ) ) ( not ( = ?auto_500480 ?auto_500483 ) ) ( not ( = ?auto_500480 ?auto_500484 ) ) ( not ( = ?auto_500480 ?auto_500485 ) ) ( not ( = ?auto_500480 ?auto_500486 ) ) ( not ( = ?auto_500480 ?auto_500487 ) ) ( not ( = ?auto_500481 ?auto_500482 ) ) ( not ( = ?auto_500481 ?auto_500483 ) ) ( not ( = ?auto_500481 ?auto_500484 ) ) ( not ( = ?auto_500481 ?auto_500485 ) ) ( not ( = ?auto_500481 ?auto_500486 ) ) ( not ( = ?auto_500481 ?auto_500487 ) ) ( not ( = ?auto_500482 ?auto_500483 ) ) ( not ( = ?auto_500482 ?auto_500484 ) ) ( not ( = ?auto_500482 ?auto_500485 ) ) ( not ( = ?auto_500482 ?auto_500486 ) ) ( not ( = ?auto_500482 ?auto_500487 ) ) ( not ( = ?auto_500483 ?auto_500484 ) ) ( not ( = ?auto_500483 ?auto_500485 ) ) ( not ( = ?auto_500483 ?auto_500486 ) ) ( not ( = ?auto_500483 ?auto_500487 ) ) ( not ( = ?auto_500484 ?auto_500485 ) ) ( not ( = ?auto_500484 ?auto_500486 ) ) ( not ( = ?auto_500484 ?auto_500487 ) ) ( not ( = ?auto_500485 ?auto_500486 ) ) ( not ( = ?auto_500485 ?auto_500487 ) ) ( not ( = ?auto_500486 ?auto_500487 ) ) ( ON ?auto_500485 ?auto_500486 ) ( ON ?auto_500484 ?auto_500485 ) ( ON ?auto_500483 ?auto_500484 ) ( ON ?auto_500482 ?auto_500483 ) ( ON ?auto_500481 ?auto_500482 ) ( ON ?auto_500480 ?auto_500481 ) ( ON ?auto_500479 ?auto_500480 ) ( ON ?auto_500478 ?auto_500479 ) ( ON ?auto_500477 ?auto_500478 ) ( ON ?auto_500476 ?auto_500477 ) ( ON ?auto_500475 ?auto_500476 ) ( CLEAR ?auto_500473 ) ( ON ?auto_500474 ?auto_500475 ) ( CLEAR ?auto_500474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_500473 ?auto_500474 )
      ( MAKE-14PILE ?auto_500473 ?auto_500474 ?auto_500475 ?auto_500476 ?auto_500477 ?auto_500478 ?auto_500479 ?auto_500480 ?auto_500481 ?auto_500482 ?auto_500483 ?auto_500484 ?auto_500485 ?auto_500486 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_500531 - BLOCK
      ?auto_500532 - BLOCK
      ?auto_500533 - BLOCK
      ?auto_500534 - BLOCK
      ?auto_500535 - BLOCK
      ?auto_500536 - BLOCK
      ?auto_500537 - BLOCK
      ?auto_500538 - BLOCK
      ?auto_500539 - BLOCK
      ?auto_500540 - BLOCK
      ?auto_500541 - BLOCK
      ?auto_500542 - BLOCK
      ?auto_500543 - BLOCK
      ?auto_500544 - BLOCK
    )
    :vars
    (
      ?auto_500545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500544 ?auto_500545 ) ( not ( = ?auto_500531 ?auto_500532 ) ) ( not ( = ?auto_500531 ?auto_500533 ) ) ( not ( = ?auto_500531 ?auto_500534 ) ) ( not ( = ?auto_500531 ?auto_500535 ) ) ( not ( = ?auto_500531 ?auto_500536 ) ) ( not ( = ?auto_500531 ?auto_500537 ) ) ( not ( = ?auto_500531 ?auto_500538 ) ) ( not ( = ?auto_500531 ?auto_500539 ) ) ( not ( = ?auto_500531 ?auto_500540 ) ) ( not ( = ?auto_500531 ?auto_500541 ) ) ( not ( = ?auto_500531 ?auto_500542 ) ) ( not ( = ?auto_500531 ?auto_500543 ) ) ( not ( = ?auto_500531 ?auto_500544 ) ) ( not ( = ?auto_500531 ?auto_500545 ) ) ( not ( = ?auto_500532 ?auto_500533 ) ) ( not ( = ?auto_500532 ?auto_500534 ) ) ( not ( = ?auto_500532 ?auto_500535 ) ) ( not ( = ?auto_500532 ?auto_500536 ) ) ( not ( = ?auto_500532 ?auto_500537 ) ) ( not ( = ?auto_500532 ?auto_500538 ) ) ( not ( = ?auto_500532 ?auto_500539 ) ) ( not ( = ?auto_500532 ?auto_500540 ) ) ( not ( = ?auto_500532 ?auto_500541 ) ) ( not ( = ?auto_500532 ?auto_500542 ) ) ( not ( = ?auto_500532 ?auto_500543 ) ) ( not ( = ?auto_500532 ?auto_500544 ) ) ( not ( = ?auto_500532 ?auto_500545 ) ) ( not ( = ?auto_500533 ?auto_500534 ) ) ( not ( = ?auto_500533 ?auto_500535 ) ) ( not ( = ?auto_500533 ?auto_500536 ) ) ( not ( = ?auto_500533 ?auto_500537 ) ) ( not ( = ?auto_500533 ?auto_500538 ) ) ( not ( = ?auto_500533 ?auto_500539 ) ) ( not ( = ?auto_500533 ?auto_500540 ) ) ( not ( = ?auto_500533 ?auto_500541 ) ) ( not ( = ?auto_500533 ?auto_500542 ) ) ( not ( = ?auto_500533 ?auto_500543 ) ) ( not ( = ?auto_500533 ?auto_500544 ) ) ( not ( = ?auto_500533 ?auto_500545 ) ) ( not ( = ?auto_500534 ?auto_500535 ) ) ( not ( = ?auto_500534 ?auto_500536 ) ) ( not ( = ?auto_500534 ?auto_500537 ) ) ( not ( = ?auto_500534 ?auto_500538 ) ) ( not ( = ?auto_500534 ?auto_500539 ) ) ( not ( = ?auto_500534 ?auto_500540 ) ) ( not ( = ?auto_500534 ?auto_500541 ) ) ( not ( = ?auto_500534 ?auto_500542 ) ) ( not ( = ?auto_500534 ?auto_500543 ) ) ( not ( = ?auto_500534 ?auto_500544 ) ) ( not ( = ?auto_500534 ?auto_500545 ) ) ( not ( = ?auto_500535 ?auto_500536 ) ) ( not ( = ?auto_500535 ?auto_500537 ) ) ( not ( = ?auto_500535 ?auto_500538 ) ) ( not ( = ?auto_500535 ?auto_500539 ) ) ( not ( = ?auto_500535 ?auto_500540 ) ) ( not ( = ?auto_500535 ?auto_500541 ) ) ( not ( = ?auto_500535 ?auto_500542 ) ) ( not ( = ?auto_500535 ?auto_500543 ) ) ( not ( = ?auto_500535 ?auto_500544 ) ) ( not ( = ?auto_500535 ?auto_500545 ) ) ( not ( = ?auto_500536 ?auto_500537 ) ) ( not ( = ?auto_500536 ?auto_500538 ) ) ( not ( = ?auto_500536 ?auto_500539 ) ) ( not ( = ?auto_500536 ?auto_500540 ) ) ( not ( = ?auto_500536 ?auto_500541 ) ) ( not ( = ?auto_500536 ?auto_500542 ) ) ( not ( = ?auto_500536 ?auto_500543 ) ) ( not ( = ?auto_500536 ?auto_500544 ) ) ( not ( = ?auto_500536 ?auto_500545 ) ) ( not ( = ?auto_500537 ?auto_500538 ) ) ( not ( = ?auto_500537 ?auto_500539 ) ) ( not ( = ?auto_500537 ?auto_500540 ) ) ( not ( = ?auto_500537 ?auto_500541 ) ) ( not ( = ?auto_500537 ?auto_500542 ) ) ( not ( = ?auto_500537 ?auto_500543 ) ) ( not ( = ?auto_500537 ?auto_500544 ) ) ( not ( = ?auto_500537 ?auto_500545 ) ) ( not ( = ?auto_500538 ?auto_500539 ) ) ( not ( = ?auto_500538 ?auto_500540 ) ) ( not ( = ?auto_500538 ?auto_500541 ) ) ( not ( = ?auto_500538 ?auto_500542 ) ) ( not ( = ?auto_500538 ?auto_500543 ) ) ( not ( = ?auto_500538 ?auto_500544 ) ) ( not ( = ?auto_500538 ?auto_500545 ) ) ( not ( = ?auto_500539 ?auto_500540 ) ) ( not ( = ?auto_500539 ?auto_500541 ) ) ( not ( = ?auto_500539 ?auto_500542 ) ) ( not ( = ?auto_500539 ?auto_500543 ) ) ( not ( = ?auto_500539 ?auto_500544 ) ) ( not ( = ?auto_500539 ?auto_500545 ) ) ( not ( = ?auto_500540 ?auto_500541 ) ) ( not ( = ?auto_500540 ?auto_500542 ) ) ( not ( = ?auto_500540 ?auto_500543 ) ) ( not ( = ?auto_500540 ?auto_500544 ) ) ( not ( = ?auto_500540 ?auto_500545 ) ) ( not ( = ?auto_500541 ?auto_500542 ) ) ( not ( = ?auto_500541 ?auto_500543 ) ) ( not ( = ?auto_500541 ?auto_500544 ) ) ( not ( = ?auto_500541 ?auto_500545 ) ) ( not ( = ?auto_500542 ?auto_500543 ) ) ( not ( = ?auto_500542 ?auto_500544 ) ) ( not ( = ?auto_500542 ?auto_500545 ) ) ( not ( = ?auto_500543 ?auto_500544 ) ) ( not ( = ?auto_500543 ?auto_500545 ) ) ( not ( = ?auto_500544 ?auto_500545 ) ) ( ON ?auto_500543 ?auto_500544 ) ( ON ?auto_500542 ?auto_500543 ) ( ON ?auto_500541 ?auto_500542 ) ( ON ?auto_500540 ?auto_500541 ) ( ON ?auto_500539 ?auto_500540 ) ( ON ?auto_500538 ?auto_500539 ) ( ON ?auto_500537 ?auto_500538 ) ( ON ?auto_500536 ?auto_500537 ) ( ON ?auto_500535 ?auto_500536 ) ( ON ?auto_500534 ?auto_500535 ) ( ON ?auto_500533 ?auto_500534 ) ( ON ?auto_500532 ?auto_500533 ) ( ON ?auto_500531 ?auto_500532 ) ( CLEAR ?auto_500531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_500531 )
      ( MAKE-14PILE ?auto_500531 ?auto_500532 ?auto_500533 ?auto_500534 ?auto_500535 ?auto_500536 ?auto_500537 ?auto_500538 ?auto_500539 ?auto_500540 ?auto_500541 ?auto_500542 ?auto_500543 ?auto_500544 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500590 - BLOCK
      ?auto_500591 - BLOCK
      ?auto_500592 - BLOCK
      ?auto_500593 - BLOCK
      ?auto_500594 - BLOCK
      ?auto_500595 - BLOCK
      ?auto_500596 - BLOCK
      ?auto_500597 - BLOCK
      ?auto_500598 - BLOCK
      ?auto_500599 - BLOCK
      ?auto_500600 - BLOCK
      ?auto_500601 - BLOCK
      ?auto_500602 - BLOCK
      ?auto_500603 - BLOCK
      ?auto_500604 - BLOCK
    )
    :vars
    (
      ?auto_500605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_500603 ) ( ON ?auto_500604 ?auto_500605 ) ( CLEAR ?auto_500604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_500590 ) ( ON ?auto_500591 ?auto_500590 ) ( ON ?auto_500592 ?auto_500591 ) ( ON ?auto_500593 ?auto_500592 ) ( ON ?auto_500594 ?auto_500593 ) ( ON ?auto_500595 ?auto_500594 ) ( ON ?auto_500596 ?auto_500595 ) ( ON ?auto_500597 ?auto_500596 ) ( ON ?auto_500598 ?auto_500597 ) ( ON ?auto_500599 ?auto_500598 ) ( ON ?auto_500600 ?auto_500599 ) ( ON ?auto_500601 ?auto_500600 ) ( ON ?auto_500602 ?auto_500601 ) ( ON ?auto_500603 ?auto_500602 ) ( not ( = ?auto_500590 ?auto_500591 ) ) ( not ( = ?auto_500590 ?auto_500592 ) ) ( not ( = ?auto_500590 ?auto_500593 ) ) ( not ( = ?auto_500590 ?auto_500594 ) ) ( not ( = ?auto_500590 ?auto_500595 ) ) ( not ( = ?auto_500590 ?auto_500596 ) ) ( not ( = ?auto_500590 ?auto_500597 ) ) ( not ( = ?auto_500590 ?auto_500598 ) ) ( not ( = ?auto_500590 ?auto_500599 ) ) ( not ( = ?auto_500590 ?auto_500600 ) ) ( not ( = ?auto_500590 ?auto_500601 ) ) ( not ( = ?auto_500590 ?auto_500602 ) ) ( not ( = ?auto_500590 ?auto_500603 ) ) ( not ( = ?auto_500590 ?auto_500604 ) ) ( not ( = ?auto_500590 ?auto_500605 ) ) ( not ( = ?auto_500591 ?auto_500592 ) ) ( not ( = ?auto_500591 ?auto_500593 ) ) ( not ( = ?auto_500591 ?auto_500594 ) ) ( not ( = ?auto_500591 ?auto_500595 ) ) ( not ( = ?auto_500591 ?auto_500596 ) ) ( not ( = ?auto_500591 ?auto_500597 ) ) ( not ( = ?auto_500591 ?auto_500598 ) ) ( not ( = ?auto_500591 ?auto_500599 ) ) ( not ( = ?auto_500591 ?auto_500600 ) ) ( not ( = ?auto_500591 ?auto_500601 ) ) ( not ( = ?auto_500591 ?auto_500602 ) ) ( not ( = ?auto_500591 ?auto_500603 ) ) ( not ( = ?auto_500591 ?auto_500604 ) ) ( not ( = ?auto_500591 ?auto_500605 ) ) ( not ( = ?auto_500592 ?auto_500593 ) ) ( not ( = ?auto_500592 ?auto_500594 ) ) ( not ( = ?auto_500592 ?auto_500595 ) ) ( not ( = ?auto_500592 ?auto_500596 ) ) ( not ( = ?auto_500592 ?auto_500597 ) ) ( not ( = ?auto_500592 ?auto_500598 ) ) ( not ( = ?auto_500592 ?auto_500599 ) ) ( not ( = ?auto_500592 ?auto_500600 ) ) ( not ( = ?auto_500592 ?auto_500601 ) ) ( not ( = ?auto_500592 ?auto_500602 ) ) ( not ( = ?auto_500592 ?auto_500603 ) ) ( not ( = ?auto_500592 ?auto_500604 ) ) ( not ( = ?auto_500592 ?auto_500605 ) ) ( not ( = ?auto_500593 ?auto_500594 ) ) ( not ( = ?auto_500593 ?auto_500595 ) ) ( not ( = ?auto_500593 ?auto_500596 ) ) ( not ( = ?auto_500593 ?auto_500597 ) ) ( not ( = ?auto_500593 ?auto_500598 ) ) ( not ( = ?auto_500593 ?auto_500599 ) ) ( not ( = ?auto_500593 ?auto_500600 ) ) ( not ( = ?auto_500593 ?auto_500601 ) ) ( not ( = ?auto_500593 ?auto_500602 ) ) ( not ( = ?auto_500593 ?auto_500603 ) ) ( not ( = ?auto_500593 ?auto_500604 ) ) ( not ( = ?auto_500593 ?auto_500605 ) ) ( not ( = ?auto_500594 ?auto_500595 ) ) ( not ( = ?auto_500594 ?auto_500596 ) ) ( not ( = ?auto_500594 ?auto_500597 ) ) ( not ( = ?auto_500594 ?auto_500598 ) ) ( not ( = ?auto_500594 ?auto_500599 ) ) ( not ( = ?auto_500594 ?auto_500600 ) ) ( not ( = ?auto_500594 ?auto_500601 ) ) ( not ( = ?auto_500594 ?auto_500602 ) ) ( not ( = ?auto_500594 ?auto_500603 ) ) ( not ( = ?auto_500594 ?auto_500604 ) ) ( not ( = ?auto_500594 ?auto_500605 ) ) ( not ( = ?auto_500595 ?auto_500596 ) ) ( not ( = ?auto_500595 ?auto_500597 ) ) ( not ( = ?auto_500595 ?auto_500598 ) ) ( not ( = ?auto_500595 ?auto_500599 ) ) ( not ( = ?auto_500595 ?auto_500600 ) ) ( not ( = ?auto_500595 ?auto_500601 ) ) ( not ( = ?auto_500595 ?auto_500602 ) ) ( not ( = ?auto_500595 ?auto_500603 ) ) ( not ( = ?auto_500595 ?auto_500604 ) ) ( not ( = ?auto_500595 ?auto_500605 ) ) ( not ( = ?auto_500596 ?auto_500597 ) ) ( not ( = ?auto_500596 ?auto_500598 ) ) ( not ( = ?auto_500596 ?auto_500599 ) ) ( not ( = ?auto_500596 ?auto_500600 ) ) ( not ( = ?auto_500596 ?auto_500601 ) ) ( not ( = ?auto_500596 ?auto_500602 ) ) ( not ( = ?auto_500596 ?auto_500603 ) ) ( not ( = ?auto_500596 ?auto_500604 ) ) ( not ( = ?auto_500596 ?auto_500605 ) ) ( not ( = ?auto_500597 ?auto_500598 ) ) ( not ( = ?auto_500597 ?auto_500599 ) ) ( not ( = ?auto_500597 ?auto_500600 ) ) ( not ( = ?auto_500597 ?auto_500601 ) ) ( not ( = ?auto_500597 ?auto_500602 ) ) ( not ( = ?auto_500597 ?auto_500603 ) ) ( not ( = ?auto_500597 ?auto_500604 ) ) ( not ( = ?auto_500597 ?auto_500605 ) ) ( not ( = ?auto_500598 ?auto_500599 ) ) ( not ( = ?auto_500598 ?auto_500600 ) ) ( not ( = ?auto_500598 ?auto_500601 ) ) ( not ( = ?auto_500598 ?auto_500602 ) ) ( not ( = ?auto_500598 ?auto_500603 ) ) ( not ( = ?auto_500598 ?auto_500604 ) ) ( not ( = ?auto_500598 ?auto_500605 ) ) ( not ( = ?auto_500599 ?auto_500600 ) ) ( not ( = ?auto_500599 ?auto_500601 ) ) ( not ( = ?auto_500599 ?auto_500602 ) ) ( not ( = ?auto_500599 ?auto_500603 ) ) ( not ( = ?auto_500599 ?auto_500604 ) ) ( not ( = ?auto_500599 ?auto_500605 ) ) ( not ( = ?auto_500600 ?auto_500601 ) ) ( not ( = ?auto_500600 ?auto_500602 ) ) ( not ( = ?auto_500600 ?auto_500603 ) ) ( not ( = ?auto_500600 ?auto_500604 ) ) ( not ( = ?auto_500600 ?auto_500605 ) ) ( not ( = ?auto_500601 ?auto_500602 ) ) ( not ( = ?auto_500601 ?auto_500603 ) ) ( not ( = ?auto_500601 ?auto_500604 ) ) ( not ( = ?auto_500601 ?auto_500605 ) ) ( not ( = ?auto_500602 ?auto_500603 ) ) ( not ( = ?auto_500602 ?auto_500604 ) ) ( not ( = ?auto_500602 ?auto_500605 ) ) ( not ( = ?auto_500603 ?auto_500604 ) ) ( not ( = ?auto_500603 ?auto_500605 ) ) ( not ( = ?auto_500604 ?auto_500605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_500604 ?auto_500605 )
      ( !STACK ?auto_500604 ?auto_500603 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500652 - BLOCK
      ?auto_500653 - BLOCK
      ?auto_500654 - BLOCK
      ?auto_500655 - BLOCK
      ?auto_500656 - BLOCK
      ?auto_500657 - BLOCK
      ?auto_500658 - BLOCK
      ?auto_500659 - BLOCK
      ?auto_500660 - BLOCK
      ?auto_500661 - BLOCK
      ?auto_500662 - BLOCK
      ?auto_500663 - BLOCK
      ?auto_500664 - BLOCK
      ?auto_500665 - BLOCK
      ?auto_500666 - BLOCK
    )
    :vars
    (
      ?auto_500667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500666 ?auto_500667 ) ( ON-TABLE ?auto_500652 ) ( ON ?auto_500653 ?auto_500652 ) ( ON ?auto_500654 ?auto_500653 ) ( ON ?auto_500655 ?auto_500654 ) ( ON ?auto_500656 ?auto_500655 ) ( ON ?auto_500657 ?auto_500656 ) ( ON ?auto_500658 ?auto_500657 ) ( ON ?auto_500659 ?auto_500658 ) ( ON ?auto_500660 ?auto_500659 ) ( ON ?auto_500661 ?auto_500660 ) ( ON ?auto_500662 ?auto_500661 ) ( ON ?auto_500663 ?auto_500662 ) ( ON ?auto_500664 ?auto_500663 ) ( not ( = ?auto_500652 ?auto_500653 ) ) ( not ( = ?auto_500652 ?auto_500654 ) ) ( not ( = ?auto_500652 ?auto_500655 ) ) ( not ( = ?auto_500652 ?auto_500656 ) ) ( not ( = ?auto_500652 ?auto_500657 ) ) ( not ( = ?auto_500652 ?auto_500658 ) ) ( not ( = ?auto_500652 ?auto_500659 ) ) ( not ( = ?auto_500652 ?auto_500660 ) ) ( not ( = ?auto_500652 ?auto_500661 ) ) ( not ( = ?auto_500652 ?auto_500662 ) ) ( not ( = ?auto_500652 ?auto_500663 ) ) ( not ( = ?auto_500652 ?auto_500664 ) ) ( not ( = ?auto_500652 ?auto_500665 ) ) ( not ( = ?auto_500652 ?auto_500666 ) ) ( not ( = ?auto_500652 ?auto_500667 ) ) ( not ( = ?auto_500653 ?auto_500654 ) ) ( not ( = ?auto_500653 ?auto_500655 ) ) ( not ( = ?auto_500653 ?auto_500656 ) ) ( not ( = ?auto_500653 ?auto_500657 ) ) ( not ( = ?auto_500653 ?auto_500658 ) ) ( not ( = ?auto_500653 ?auto_500659 ) ) ( not ( = ?auto_500653 ?auto_500660 ) ) ( not ( = ?auto_500653 ?auto_500661 ) ) ( not ( = ?auto_500653 ?auto_500662 ) ) ( not ( = ?auto_500653 ?auto_500663 ) ) ( not ( = ?auto_500653 ?auto_500664 ) ) ( not ( = ?auto_500653 ?auto_500665 ) ) ( not ( = ?auto_500653 ?auto_500666 ) ) ( not ( = ?auto_500653 ?auto_500667 ) ) ( not ( = ?auto_500654 ?auto_500655 ) ) ( not ( = ?auto_500654 ?auto_500656 ) ) ( not ( = ?auto_500654 ?auto_500657 ) ) ( not ( = ?auto_500654 ?auto_500658 ) ) ( not ( = ?auto_500654 ?auto_500659 ) ) ( not ( = ?auto_500654 ?auto_500660 ) ) ( not ( = ?auto_500654 ?auto_500661 ) ) ( not ( = ?auto_500654 ?auto_500662 ) ) ( not ( = ?auto_500654 ?auto_500663 ) ) ( not ( = ?auto_500654 ?auto_500664 ) ) ( not ( = ?auto_500654 ?auto_500665 ) ) ( not ( = ?auto_500654 ?auto_500666 ) ) ( not ( = ?auto_500654 ?auto_500667 ) ) ( not ( = ?auto_500655 ?auto_500656 ) ) ( not ( = ?auto_500655 ?auto_500657 ) ) ( not ( = ?auto_500655 ?auto_500658 ) ) ( not ( = ?auto_500655 ?auto_500659 ) ) ( not ( = ?auto_500655 ?auto_500660 ) ) ( not ( = ?auto_500655 ?auto_500661 ) ) ( not ( = ?auto_500655 ?auto_500662 ) ) ( not ( = ?auto_500655 ?auto_500663 ) ) ( not ( = ?auto_500655 ?auto_500664 ) ) ( not ( = ?auto_500655 ?auto_500665 ) ) ( not ( = ?auto_500655 ?auto_500666 ) ) ( not ( = ?auto_500655 ?auto_500667 ) ) ( not ( = ?auto_500656 ?auto_500657 ) ) ( not ( = ?auto_500656 ?auto_500658 ) ) ( not ( = ?auto_500656 ?auto_500659 ) ) ( not ( = ?auto_500656 ?auto_500660 ) ) ( not ( = ?auto_500656 ?auto_500661 ) ) ( not ( = ?auto_500656 ?auto_500662 ) ) ( not ( = ?auto_500656 ?auto_500663 ) ) ( not ( = ?auto_500656 ?auto_500664 ) ) ( not ( = ?auto_500656 ?auto_500665 ) ) ( not ( = ?auto_500656 ?auto_500666 ) ) ( not ( = ?auto_500656 ?auto_500667 ) ) ( not ( = ?auto_500657 ?auto_500658 ) ) ( not ( = ?auto_500657 ?auto_500659 ) ) ( not ( = ?auto_500657 ?auto_500660 ) ) ( not ( = ?auto_500657 ?auto_500661 ) ) ( not ( = ?auto_500657 ?auto_500662 ) ) ( not ( = ?auto_500657 ?auto_500663 ) ) ( not ( = ?auto_500657 ?auto_500664 ) ) ( not ( = ?auto_500657 ?auto_500665 ) ) ( not ( = ?auto_500657 ?auto_500666 ) ) ( not ( = ?auto_500657 ?auto_500667 ) ) ( not ( = ?auto_500658 ?auto_500659 ) ) ( not ( = ?auto_500658 ?auto_500660 ) ) ( not ( = ?auto_500658 ?auto_500661 ) ) ( not ( = ?auto_500658 ?auto_500662 ) ) ( not ( = ?auto_500658 ?auto_500663 ) ) ( not ( = ?auto_500658 ?auto_500664 ) ) ( not ( = ?auto_500658 ?auto_500665 ) ) ( not ( = ?auto_500658 ?auto_500666 ) ) ( not ( = ?auto_500658 ?auto_500667 ) ) ( not ( = ?auto_500659 ?auto_500660 ) ) ( not ( = ?auto_500659 ?auto_500661 ) ) ( not ( = ?auto_500659 ?auto_500662 ) ) ( not ( = ?auto_500659 ?auto_500663 ) ) ( not ( = ?auto_500659 ?auto_500664 ) ) ( not ( = ?auto_500659 ?auto_500665 ) ) ( not ( = ?auto_500659 ?auto_500666 ) ) ( not ( = ?auto_500659 ?auto_500667 ) ) ( not ( = ?auto_500660 ?auto_500661 ) ) ( not ( = ?auto_500660 ?auto_500662 ) ) ( not ( = ?auto_500660 ?auto_500663 ) ) ( not ( = ?auto_500660 ?auto_500664 ) ) ( not ( = ?auto_500660 ?auto_500665 ) ) ( not ( = ?auto_500660 ?auto_500666 ) ) ( not ( = ?auto_500660 ?auto_500667 ) ) ( not ( = ?auto_500661 ?auto_500662 ) ) ( not ( = ?auto_500661 ?auto_500663 ) ) ( not ( = ?auto_500661 ?auto_500664 ) ) ( not ( = ?auto_500661 ?auto_500665 ) ) ( not ( = ?auto_500661 ?auto_500666 ) ) ( not ( = ?auto_500661 ?auto_500667 ) ) ( not ( = ?auto_500662 ?auto_500663 ) ) ( not ( = ?auto_500662 ?auto_500664 ) ) ( not ( = ?auto_500662 ?auto_500665 ) ) ( not ( = ?auto_500662 ?auto_500666 ) ) ( not ( = ?auto_500662 ?auto_500667 ) ) ( not ( = ?auto_500663 ?auto_500664 ) ) ( not ( = ?auto_500663 ?auto_500665 ) ) ( not ( = ?auto_500663 ?auto_500666 ) ) ( not ( = ?auto_500663 ?auto_500667 ) ) ( not ( = ?auto_500664 ?auto_500665 ) ) ( not ( = ?auto_500664 ?auto_500666 ) ) ( not ( = ?auto_500664 ?auto_500667 ) ) ( not ( = ?auto_500665 ?auto_500666 ) ) ( not ( = ?auto_500665 ?auto_500667 ) ) ( not ( = ?auto_500666 ?auto_500667 ) ) ( CLEAR ?auto_500664 ) ( ON ?auto_500665 ?auto_500666 ) ( CLEAR ?auto_500665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_500652 ?auto_500653 ?auto_500654 ?auto_500655 ?auto_500656 ?auto_500657 ?auto_500658 ?auto_500659 ?auto_500660 ?auto_500661 ?auto_500662 ?auto_500663 ?auto_500664 ?auto_500665 )
      ( MAKE-15PILE ?auto_500652 ?auto_500653 ?auto_500654 ?auto_500655 ?auto_500656 ?auto_500657 ?auto_500658 ?auto_500659 ?auto_500660 ?auto_500661 ?auto_500662 ?auto_500663 ?auto_500664 ?auto_500665 ?auto_500666 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500714 - BLOCK
      ?auto_500715 - BLOCK
      ?auto_500716 - BLOCK
      ?auto_500717 - BLOCK
      ?auto_500718 - BLOCK
      ?auto_500719 - BLOCK
      ?auto_500720 - BLOCK
      ?auto_500721 - BLOCK
      ?auto_500722 - BLOCK
      ?auto_500723 - BLOCK
      ?auto_500724 - BLOCK
      ?auto_500725 - BLOCK
      ?auto_500726 - BLOCK
      ?auto_500727 - BLOCK
      ?auto_500728 - BLOCK
    )
    :vars
    (
      ?auto_500729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500728 ?auto_500729 ) ( ON-TABLE ?auto_500714 ) ( ON ?auto_500715 ?auto_500714 ) ( ON ?auto_500716 ?auto_500715 ) ( ON ?auto_500717 ?auto_500716 ) ( ON ?auto_500718 ?auto_500717 ) ( ON ?auto_500719 ?auto_500718 ) ( ON ?auto_500720 ?auto_500719 ) ( ON ?auto_500721 ?auto_500720 ) ( ON ?auto_500722 ?auto_500721 ) ( ON ?auto_500723 ?auto_500722 ) ( ON ?auto_500724 ?auto_500723 ) ( ON ?auto_500725 ?auto_500724 ) ( not ( = ?auto_500714 ?auto_500715 ) ) ( not ( = ?auto_500714 ?auto_500716 ) ) ( not ( = ?auto_500714 ?auto_500717 ) ) ( not ( = ?auto_500714 ?auto_500718 ) ) ( not ( = ?auto_500714 ?auto_500719 ) ) ( not ( = ?auto_500714 ?auto_500720 ) ) ( not ( = ?auto_500714 ?auto_500721 ) ) ( not ( = ?auto_500714 ?auto_500722 ) ) ( not ( = ?auto_500714 ?auto_500723 ) ) ( not ( = ?auto_500714 ?auto_500724 ) ) ( not ( = ?auto_500714 ?auto_500725 ) ) ( not ( = ?auto_500714 ?auto_500726 ) ) ( not ( = ?auto_500714 ?auto_500727 ) ) ( not ( = ?auto_500714 ?auto_500728 ) ) ( not ( = ?auto_500714 ?auto_500729 ) ) ( not ( = ?auto_500715 ?auto_500716 ) ) ( not ( = ?auto_500715 ?auto_500717 ) ) ( not ( = ?auto_500715 ?auto_500718 ) ) ( not ( = ?auto_500715 ?auto_500719 ) ) ( not ( = ?auto_500715 ?auto_500720 ) ) ( not ( = ?auto_500715 ?auto_500721 ) ) ( not ( = ?auto_500715 ?auto_500722 ) ) ( not ( = ?auto_500715 ?auto_500723 ) ) ( not ( = ?auto_500715 ?auto_500724 ) ) ( not ( = ?auto_500715 ?auto_500725 ) ) ( not ( = ?auto_500715 ?auto_500726 ) ) ( not ( = ?auto_500715 ?auto_500727 ) ) ( not ( = ?auto_500715 ?auto_500728 ) ) ( not ( = ?auto_500715 ?auto_500729 ) ) ( not ( = ?auto_500716 ?auto_500717 ) ) ( not ( = ?auto_500716 ?auto_500718 ) ) ( not ( = ?auto_500716 ?auto_500719 ) ) ( not ( = ?auto_500716 ?auto_500720 ) ) ( not ( = ?auto_500716 ?auto_500721 ) ) ( not ( = ?auto_500716 ?auto_500722 ) ) ( not ( = ?auto_500716 ?auto_500723 ) ) ( not ( = ?auto_500716 ?auto_500724 ) ) ( not ( = ?auto_500716 ?auto_500725 ) ) ( not ( = ?auto_500716 ?auto_500726 ) ) ( not ( = ?auto_500716 ?auto_500727 ) ) ( not ( = ?auto_500716 ?auto_500728 ) ) ( not ( = ?auto_500716 ?auto_500729 ) ) ( not ( = ?auto_500717 ?auto_500718 ) ) ( not ( = ?auto_500717 ?auto_500719 ) ) ( not ( = ?auto_500717 ?auto_500720 ) ) ( not ( = ?auto_500717 ?auto_500721 ) ) ( not ( = ?auto_500717 ?auto_500722 ) ) ( not ( = ?auto_500717 ?auto_500723 ) ) ( not ( = ?auto_500717 ?auto_500724 ) ) ( not ( = ?auto_500717 ?auto_500725 ) ) ( not ( = ?auto_500717 ?auto_500726 ) ) ( not ( = ?auto_500717 ?auto_500727 ) ) ( not ( = ?auto_500717 ?auto_500728 ) ) ( not ( = ?auto_500717 ?auto_500729 ) ) ( not ( = ?auto_500718 ?auto_500719 ) ) ( not ( = ?auto_500718 ?auto_500720 ) ) ( not ( = ?auto_500718 ?auto_500721 ) ) ( not ( = ?auto_500718 ?auto_500722 ) ) ( not ( = ?auto_500718 ?auto_500723 ) ) ( not ( = ?auto_500718 ?auto_500724 ) ) ( not ( = ?auto_500718 ?auto_500725 ) ) ( not ( = ?auto_500718 ?auto_500726 ) ) ( not ( = ?auto_500718 ?auto_500727 ) ) ( not ( = ?auto_500718 ?auto_500728 ) ) ( not ( = ?auto_500718 ?auto_500729 ) ) ( not ( = ?auto_500719 ?auto_500720 ) ) ( not ( = ?auto_500719 ?auto_500721 ) ) ( not ( = ?auto_500719 ?auto_500722 ) ) ( not ( = ?auto_500719 ?auto_500723 ) ) ( not ( = ?auto_500719 ?auto_500724 ) ) ( not ( = ?auto_500719 ?auto_500725 ) ) ( not ( = ?auto_500719 ?auto_500726 ) ) ( not ( = ?auto_500719 ?auto_500727 ) ) ( not ( = ?auto_500719 ?auto_500728 ) ) ( not ( = ?auto_500719 ?auto_500729 ) ) ( not ( = ?auto_500720 ?auto_500721 ) ) ( not ( = ?auto_500720 ?auto_500722 ) ) ( not ( = ?auto_500720 ?auto_500723 ) ) ( not ( = ?auto_500720 ?auto_500724 ) ) ( not ( = ?auto_500720 ?auto_500725 ) ) ( not ( = ?auto_500720 ?auto_500726 ) ) ( not ( = ?auto_500720 ?auto_500727 ) ) ( not ( = ?auto_500720 ?auto_500728 ) ) ( not ( = ?auto_500720 ?auto_500729 ) ) ( not ( = ?auto_500721 ?auto_500722 ) ) ( not ( = ?auto_500721 ?auto_500723 ) ) ( not ( = ?auto_500721 ?auto_500724 ) ) ( not ( = ?auto_500721 ?auto_500725 ) ) ( not ( = ?auto_500721 ?auto_500726 ) ) ( not ( = ?auto_500721 ?auto_500727 ) ) ( not ( = ?auto_500721 ?auto_500728 ) ) ( not ( = ?auto_500721 ?auto_500729 ) ) ( not ( = ?auto_500722 ?auto_500723 ) ) ( not ( = ?auto_500722 ?auto_500724 ) ) ( not ( = ?auto_500722 ?auto_500725 ) ) ( not ( = ?auto_500722 ?auto_500726 ) ) ( not ( = ?auto_500722 ?auto_500727 ) ) ( not ( = ?auto_500722 ?auto_500728 ) ) ( not ( = ?auto_500722 ?auto_500729 ) ) ( not ( = ?auto_500723 ?auto_500724 ) ) ( not ( = ?auto_500723 ?auto_500725 ) ) ( not ( = ?auto_500723 ?auto_500726 ) ) ( not ( = ?auto_500723 ?auto_500727 ) ) ( not ( = ?auto_500723 ?auto_500728 ) ) ( not ( = ?auto_500723 ?auto_500729 ) ) ( not ( = ?auto_500724 ?auto_500725 ) ) ( not ( = ?auto_500724 ?auto_500726 ) ) ( not ( = ?auto_500724 ?auto_500727 ) ) ( not ( = ?auto_500724 ?auto_500728 ) ) ( not ( = ?auto_500724 ?auto_500729 ) ) ( not ( = ?auto_500725 ?auto_500726 ) ) ( not ( = ?auto_500725 ?auto_500727 ) ) ( not ( = ?auto_500725 ?auto_500728 ) ) ( not ( = ?auto_500725 ?auto_500729 ) ) ( not ( = ?auto_500726 ?auto_500727 ) ) ( not ( = ?auto_500726 ?auto_500728 ) ) ( not ( = ?auto_500726 ?auto_500729 ) ) ( not ( = ?auto_500727 ?auto_500728 ) ) ( not ( = ?auto_500727 ?auto_500729 ) ) ( not ( = ?auto_500728 ?auto_500729 ) ) ( ON ?auto_500727 ?auto_500728 ) ( CLEAR ?auto_500725 ) ( ON ?auto_500726 ?auto_500727 ) ( CLEAR ?auto_500726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_500714 ?auto_500715 ?auto_500716 ?auto_500717 ?auto_500718 ?auto_500719 ?auto_500720 ?auto_500721 ?auto_500722 ?auto_500723 ?auto_500724 ?auto_500725 ?auto_500726 )
      ( MAKE-15PILE ?auto_500714 ?auto_500715 ?auto_500716 ?auto_500717 ?auto_500718 ?auto_500719 ?auto_500720 ?auto_500721 ?auto_500722 ?auto_500723 ?auto_500724 ?auto_500725 ?auto_500726 ?auto_500727 ?auto_500728 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500776 - BLOCK
      ?auto_500777 - BLOCK
      ?auto_500778 - BLOCK
      ?auto_500779 - BLOCK
      ?auto_500780 - BLOCK
      ?auto_500781 - BLOCK
      ?auto_500782 - BLOCK
      ?auto_500783 - BLOCK
      ?auto_500784 - BLOCK
      ?auto_500785 - BLOCK
      ?auto_500786 - BLOCK
      ?auto_500787 - BLOCK
      ?auto_500788 - BLOCK
      ?auto_500789 - BLOCK
      ?auto_500790 - BLOCK
    )
    :vars
    (
      ?auto_500791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500790 ?auto_500791 ) ( ON-TABLE ?auto_500776 ) ( ON ?auto_500777 ?auto_500776 ) ( ON ?auto_500778 ?auto_500777 ) ( ON ?auto_500779 ?auto_500778 ) ( ON ?auto_500780 ?auto_500779 ) ( ON ?auto_500781 ?auto_500780 ) ( ON ?auto_500782 ?auto_500781 ) ( ON ?auto_500783 ?auto_500782 ) ( ON ?auto_500784 ?auto_500783 ) ( ON ?auto_500785 ?auto_500784 ) ( ON ?auto_500786 ?auto_500785 ) ( not ( = ?auto_500776 ?auto_500777 ) ) ( not ( = ?auto_500776 ?auto_500778 ) ) ( not ( = ?auto_500776 ?auto_500779 ) ) ( not ( = ?auto_500776 ?auto_500780 ) ) ( not ( = ?auto_500776 ?auto_500781 ) ) ( not ( = ?auto_500776 ?auto_500782 ) ) ( not ( = ?auto_500776 ?auto_500783 ) ) ( not ( = ?auto_500776 ?auto_500784 ) ) ( not ( = ?auto_500776 ?auto_500785 ) ) ( not ( = ?auto_500776 ?auto_500786 ) ) ( not ( = ?auto_500776 ?auto_500787 ) ) ( not ( = ?auto_500776 ?auto_500788 ) ) ( not ( = ?auto_500776 ?auto_500789 ) ) ( not ( = ?auto_500776 ?auto_500790 ) ) ( not ( = ?auto_500776 ?auto_500791 ) ) ( not ( = ?auto_500777 ?auto_500778 ) ) ( not ( = ?auto_500777 ?auto_500779 ) ) ( not ( = ?auto_500777 ?auto_500780 ) ) ( not ( = ?auto_500777 ?auto_500781 ) ) ( not ( = ?auto_500777 ?auto_500782 ) ) ( not ( = ?auto_500777 ?auto_500783 ) ) ( not ( = ?auto_500777 ?auto_500784 ) ) ( not ( = ?auto_500777 ?auto_500785 ) ) ( not ( = ?auto_500777 ?auto_500786 ) ) ( not ( = ?auto_500777 ?auto_500787 ) ) ( not ( = ?auto_500777 ?auto_500788 ) ) ( not ( = ?auto_500777 ?auto_500789 ) ) ( not ( = ?auto_500777 ?auto_500790 ) ) ( not ( = ?auto_500777 ?auto_500791 ) ) ( not ( = ?auto_500778 ?auto_500779 ) ) ( not ( = ?auto_500778 ?auto_500780 ) ) ( not ( = ?auto_500778 ?auto_500781 ) ) ( not ( = ?auto_500778 ?auto_500782 ) ) ( not ( = ?auto_500778 ?auto_500783 ) ) ( not ( = ?auto_500778 ?auto_500784 ) ) ( not ( = ?auto_500778 ?auto_500785 ) ) ( not ( = ?auto_500778 ?auto_500786 ) ) ( not ( = ?auto_500778 ?auto_500787 ) ) ( not ( = ?auto_500778 ?auto_500788 ) ) ( not ( = ?auto_500778 ?auto_500789 ) ) ( not ( = ?auto_500778 ?auto_500790 ) ) ( not ( = ?auto_500778 ?auto_500791 ) ) ( not ( = ?auto_500779 ?auto_500780 ) ) ( not ( = ?auto_500779 ?auto_500781 ) ) ( not ( = ?auto_500779 ?auto_500782 ) ) ( not ( = ?auto_500779 ?auto_500783 ) ) ( not ( = ?auto_500779 ?auto_500784 ) ) ( not ( = ?auto_500779 ?auto_500785 ) ) ( not ( = ?auto_500779 ?auto_500786 ) ) ( not ( = ?auto_500779 ?auto_500787 ) ) ( not ( = ?auto_500779 ?auto_500788 ) ) ( not ( = ?auto_500779 ?auto_500789 ) ) ( not ( = ?auto_500779 ?auto_500790 ) ) ( not ( = ?auto_500779 ?auto_500791 ) ) ( not ( = ?auto_500780 ?auto_500781 ) ) ( not ( = ?auto_500780 ?auto_500782 ) ) ( not ( = ?auto_500780 ?auto_500783 ) ) ( not ( = ?auto_500780 ?auto_500784 ) ) ( not ( = ?auto_500780 ?auto_500785 ) ) ( not ( = ?auto_500780 ?auto_500786 ) ) ( not ( = ?auto_500780 ?auto_500787 ) ) ( not ( = ?auto_500780 ?auto_500788 ) ) ( not ( = ?auto_500780 ?auto_500789 ) ) ( not ( = ?auto_500780 ?auto_500790 ) ) ( not ( = ?auto_500780 ?auto_500791 ) ) ( not ( = ?auto_500781 ?auto_500782 ) ) ( not ( = ?auto_500781 ?auto_500783 ) ) ( not ( = ?auto_500781 ?auto_500784 ) ) ( not ( = ?auto_500781 ?auto_500785 ) ) ( not ( = ?auto_500781 ?auto_500786 ) ) ( not ( = ?auto_500781 ?auto_500787 ) ) ( not ( = ?auto_500781 ?auto_500788 ) ) ( not ( = ?auto_500781 ?auto_500789 ) ) ( not ( = ?auto_500781 ?auto_500790 ) ) ( not ( = ?auto_500781 ?auto_500791 ) ) ( not ( = ?auto_500782 ?auto_500783 ) ) ( not ( = ?auto_500782 ?auto_500784 ) ) ( not ( = ?auto_500782 ?auto_500785 ) ) ( not ( = ?auto_500782 ?auto_500786 ) ) ( not ( = ?auto_500782 ?auto_500787 ) ) ( not ( = ?auto_500782 ?auto_500788 ) ) ( not ( = ?auto_500782 ?auto_500789 ) ) ( not ( = ?auto_500782 ?auto_500790 ) ) ( not ( = ?auto_500782 ?auto_500791 ) ) ( not ( = ?auto_500783 ?auto_500784 ) ) ( not ( = ?auto_500783 ?auto_500785 ) ) ( not ( = ?auto_500783 ?auto_500786 ) ) ( not ( = ?auto_500783 ?auto_500787 ) ) ( not ( = ?auto_500783 ?auto_500788 ) ) ( not ( = ?auto_500783 ?auto_500789 ) ) ( not ( = ?auto_500783 ?auto_500790 ) ) ( not ( = ?auto_500783 ?auto_500791 ) ) ( not ( = ?auto_500784 ?auto_500785 ) ) ( not ( = ?auto_500784 ?auto_500786 ) ) ( not ( = ?auto_500784 ?auto_500787 ) ) ( not ( = ?auto_500784 ?auto_500788 ) ) ( not ( = ?auto_500784 ?auto_500789 ) ) ( not ( = ?auto_500784 ?auto_500790 ) ) ( not ( = ?auto_500784 ?auto_500791 ) ) ( not ( = ?auto_500785 ?auto_500786 ) ) ( not ( = ?auto_500785 ?auto_500787 ) ) ( not ( = ?auto_500785 ?auto_500788 ) ) ( not ( = ?auto_500785 ?auto_500789 ) ) ( not ( = ?auto_500785 ?auto_500790 ) ) ( not ( = ?auto_500785 ?auto_500791 ) ) ( not ( = ?auto_500786 ?auto_500787 ) ) ( not ( = ?auto_500786 ?auto_500788 ) ) ( not ( = ?auto_500786 ?auto_500789 ) ) ( not ( = ?auto_500786 ?auto_500790 ) ) ( not ( = ?auto_500786 ?auto_500791 ) ) ( not ( = ?auto_500787 ?auto_500788 ) ) ( not ( = ?auto_500787 ?auto_500789 ) ) ( not ( = ?auto_500787 ?auto_500790 ) ) ( not ( = ?auto_500787 ?auto_500791 ) ) ( not ( = ?auto_500788 ?auto_500789 ) ) ( not ( = ?auto_500788 ?auto_500790 ) ) ( not ( = ?auto_500788 ?auto_500791 ) ) ( not ( = ?auto_500789 ?auto_500790 ) ) ( not ( = ?auto_500789 ?auto_500791 ) ) ( not ( = ?auto_500790 ?auto_500791 ) ) ( ON ?auto_500789 ?auto_500790 ) ( ON ?auto_500788 ?auto_500789 ) ( CLEAR ?auto_500786 ) ( ON ?auto_500787 ?auto_500788 ) ( CLEAR ?auto_500787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_500776 ?auto_500777 ?auto_500778 ?auto_500779 ?auto_500780 ?auto_500781 ?auto_500782 ?auto_500783 ?auto_500784 ?auto_500785 ?auto_500786 ?auto_500787 )
      ( MAKE-15PILE ?auto_500776 ?auto_500777 ?auto_500778 ?auto_500779 ?auto_500780 ?auto_500781 ?auto_500782 ?auto_500783 ?auto_500784 ?auto_500785 ?auto_500786 ?auto_500787 ?auto_500788 ?auto_500789 ?auto_500790 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500838 - BLOCK
      ?auto_500839 - BLOCK
      ?auto_500840 - BLOCK
      ?auto_500841 - BLOCK
      ?auto_500842 - BLOCK
      ?auto_500843 - BLOCK
      ?auto_500844 - BLOCK
      ?auto_500845 - BLOCK
      ?auto_500846 - BLOCK
      ?auto_500847 - BLOCK
      ?auto_500848 - BLOCK
      ?auto_500849 - BLOCK
      ?auto_500850 - BLOCK
      ?auto_500851 - BLOCK
      ?auto_500852 - BLOCK
    )
    :vars
    (
      ?auto_500853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500852 ?auto_500853 ) ( ON-TABLE ?auto_500838 ) ( ON ?auto_500839 ?auto_500838 ) ( ON ?auto_500840 ?auto_500839 ) ( ON ?auto_500841 ?auto_500840 ) ( ON ?auto_500842 ?auto_500841 ) ( ON ?auto_500843 ?auto_500842 ) ( ON ?auto_500844 ?auto_500843 ) ( ON ?auto_500845 ?auto_500844 ) ( ON ?auto_500846 ?auto_500845 ) ( ON ?auto_500847 ?auto_500846 ) ( not ( = ?auto_500838 ?auto_500839 ) ) ( not ( = ?auto_500838 ?auto_500840 ) ) ( not ( = ?auto_500838 ?auto_500841 ) ) ( not ( = ?auto_500838 ?auto_500842 ) ) ( not ( = ?auto_500838 ?auto_500843 ) ) ( not ( = ?auto_500838 ?auto_500844 ) ) ( not ( = ?auto_500838 ?auto_500845 ) ) ( not ( = ?auto_500838 ?auto_500846 ) ) ( not ( = ?auto_500838 ?auto_500847 ) ) ( not ( = ?auto_500838 ?auto_500848 ) ) ( not ( = ?auto_500838 ?auto_500849 ) ) ( not ( = ?auto_500838 ?auto_500850 ) ) ( not ( = ?auto_500838 ?auto_500851 ) ) ( not ( = ?auto_500838 ?auto_500852 ) ) ( not ( = ?auto_500838 ?auto_500853 ) ) ( not ( = ?auto_500839 ?auto_500840 ) ) ( not ( = ?auto_500839 ?auto_500841 ) ) ( not ( = ?auto_500839 ?auto_500842 ) ) ( not ( = ?auto_500839 ?auto_500843 ) ) ( not ( = ?auto_500839 ?auto_500844 ) ) ( not ( = ?auto_500839 ?auto_500845 ) ) ( not ( = ?auto_500839 ?auto_500846 ) ) ( not ( = ?auto_500839 ?auto_500847 ) ) ( not ( = ?auto_500839 ?auto_500848 ) ) ( not ( = ?auto_500839 ?auto_500849 ) ) ( not ( = ?auto_500839 ?auto_500850 ) ) ( not ( = ?auto_500839 ?auto_500851 ) ) ( not ( = ?auto_500839 ?auto_500852 ) ) ( not ( = ?auto_500839 ?auto_500853 ) ) ( not ( = ?auto_500840 ?auto_500841 ) ) ( not ( = ?auto_500840 ?auto_500842 ) ) ( not ( = ?auto_500840 ?auto_500843 ) ) ( not ( = ?auto_500840 ?auto_500844 ) ) ( not ( = ?auto_500840 ?auto_500845 ) ) ( not ( = ?auto_500840 ?auto_500846 ) ) ( not ( = ?auto_500840 ?auto_500847 ) ) ( not ( = ?auto_500840 ?auto_500848 ) ) ( not ( = ?auto_500840 ?auto_500849 ) ) ( not ( = ?auto_500840 ?auto_500850 ) ) ( not ( = ?auto_500840 ?auto_500851 ) ) ( not ( = ?auto_500840 ?auto_500852 ) ) ( not ( = ?auto_500840 ?auto_500853 ) ) ( not ( = ?auto_500841 ?auto_500842 ) ) ( not ( = ?auto_500841 ?auto_500843 ) ) ( not ( = ?auto_500841 ?auto_500844 ) ) ( not ( = ?auto_500841 ?auto_500845 ) ) ( not ( = ?auto_500841 ?auto_500846 ) ) ( not ( = ?auto_500841 ?auto_500847 ) ) ( not ( = ?auto_500841 ?auto_500848 ) ) ( not ( = ?auto_500841 ?auto_500849 ) ) ( not ( = ?auto_500841 ?auto_500850 ) ) ( not ( = ?auto_500841 ?auto_500851 ) ) ( not ( = ?auto_500841 ?auto_500852 ) ) ( not ( = ?auto_500841 ?auto_500853 ) ) ( not ( = ?auto_500842 ?auto_500843 ) ) ( not ( = ?auto_500842 ?auto_500844 ) ) ( not ( = ?auto_500842 ?auto_500845 ) ) ( not ( = ?auto_500842 ?auto_500846 ) ) ( not ( = ?auto_500842 ?auto_500847 ) ) ( not ( = ?auto_500842 ?auto_500848 ) ) ( not ( = ?auto_500842 ?auto_500849 ) ) ( not ( = ?auto_500842 ?auto_500850 ) ) ( not ( = ?auto_500842 ?auto_500851 ) ) ( not ( = ?auto_500842 ?auto_500852 ) ) ( not ( = ?auto_500842 ?auto_500853 ) ) ( not ( = ?auto_500843 ?auto_500844 ) ) ( not ( = ?auto_500843 ?auto_500845 ) ) ( not ( = ?auto_500843 ?auto_500846 ) ) ( not ( = ?auto_500843 ?auto_500847 ) ) ( not ( = ?auto_500843 ?auto_500848 ) ) ( not ( = ?auto_500843 ?auto_500849 ) ) ( not ( = ?auto_500843 ?auto_500850 ) ) ( not ( = ?auto_500843 ?auto_500851 ) ) ( not ( = ?auto_500843 ?auto_500852 ) ) ( not ( = ?auto_500843 ?auto_500853 ) ) ( not ( = ?auto_500844 ?auto_500845 ) ) ( not ( = ?auto_500844 ?auto_500846 ) ) ( not ( = ?auto_500844 ?auto_500847 ) ) ( not ( = ?auto_500844 ?auto_500848 ) ) ( not ( = ?auto_500844 ?auto_500849 ) ) ( not ( = ?auto_500844 ?auto_500850 ) ) ( not ( = ?auto_500844 ?auto_500851 ) ) ( not ( = ?auto_500844 ?auto_500852 ) ) ( not ( = ?auto_500844 ?auto_500853 ) ) ( not ( = ?auto_500845 ?auto_500846 ) ) ( not ( = ?auto_500845 ?auto_500847 ) ) ( not ( = ?auto_500845 ?auto_500848 ) ) ( not ( = ?auto_500845 ?auto_500849 ) ) ( not ( = ?auto_500845 ?auto_500850 ) ) ( not ( = ?auto_500845 ?auto_500851 ) ) ( not ( = ?auto_500845 ?auto_500852 ) ) ( not ( = ?auto_500845 ?auto_500853 ) ) ( not ( = ?auto_500846 ?auto_500847 ) ) ( not ( = ?auto_500846 ?auto_500848 ) ) ( not ( = ?auto_500846 ?auto_500849 ) ) ( not ( = ?auto_500846 ?auto_500850 ) ) ( not ( = ?auto_500846 ?auto_500851 ) ) ( not ( = ?auto_500846 ?auto_500852 ) ) ( not ( = ?auto_500846 ?auto_500853 ) ) ( not ( = ?auto_500847 ?auto_500848 ) ) ( not ( = ?auto_500847 ?auto_500849 ) ) ( not ( = ?auto_500847 ?auto_500850 ) ) ( not ( = ?auto_500847 ?auto_500851 ) ) ( not ( = ?auto_500847 ?auto_500852 ) ) ( not ( = ?auto_500847 ?auto_500853 ) ) ( not ( = ?auto_500848 ?auto_500849 ) ) ( not ( = ?auto_500848 ?auto_500850 ) ) ( not ( = ?auto_500848 ?auto_500851 ) ) ( not ( = ?auto_500848 ?auto_500852 ) ) ( not ( = ?auto_500848 ?auto_500853 ) ) ( not ( = ?auto_500849 ?auto_500850 ) ) ( not ( = ?auto_500849 ?auto_500851 ) ) ( not ( = ?auto_500849 ?auto_500852 ) ) ( not ( = ?auto_500849 ?auto_500853 ) ) ( not ( = ?auto_500850 ?auto_500851 ) ) ( not ( = ?auto_500850 ?auto_500852 ) ) ( not ( = ?auto_500850 ?auto_500853 ) ) ( not ( = ?auto_500851 ?auto_500852 ) ) ( not ( = ?auto_500851 ?auto_500853 ) ) ( not ( = ?auto_500852 ?auto_500853 ) ) ( ON ?auto_500851 ?auto_500852 ) ( ON ?auto_500850 ?auto_500851 ) ( ON ?auto_500849 ?auto_500850 ) ( CLEAR ?auto_500847 ) ( ON ?auto_500848 ?auto_500849 ) ( CLEAR ?auto_500848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_500838 ?auto_500839 ?auto_500840 ?auto_500841 ?auto_500842 ?auto_500843 ?auto_500844 ?auto_500845 ?auto_500846 ?auto_500847 ?auto_500848 )
      ( MAKE-15PILE ?auto_500838 ?auto_500839 ?auto_500840 ?auto_500841 ?auto_500842 ?auto_500843 ?auto_500844 ?auto_500845 ?auto_500846 ?auto_500847 ?auto_500848 ?auto_500849 ?auto_500850 ?auto_500851 ?auto_500852 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500900 - BLOCK
      ?auto_500901 - BLOCK
      ?auto_500902 - BLOCK
      ?auto_500903 - BLOCK
      ?auto_500904 - BLOCK
      ?auto_500905 - BLOCK
      ?auto_500906 - BLOCK
      ?auto_500907 - BLOCK
      ?auto_500908 - BLOCK
      ?auto_500909 - BLOCK
      ?auto_500910 - BLOCK
      ?auto_500911 - BLOCK
      ?auto_500912 - BLOCK
      ?auto_500913 - BLOCK
      ?auto_500914 - BLOCK
    )
    :vars
    (
      ?auto_500915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500914 ?auto_500915 ) ( ON-TABLE ?auto_500900 ) ( ON ?auto_500901 ?auto_500900 ) ( ON ?auto_500902 ?auto_500901 ) ( ON ?auto_500903 ?auto_500902 ) ( ON ?auto_500904 ?auto_500903 ) ( ON ?auto_500905 ?auto_500904 ) ( ON ?auto_500906 ?auto_500905 ) ( ON ?auto_500907 ?auto_500906 ) ( ON ?auto_500908 ?auto_500907 ) ( not ( = ?auto_500900 ?auto_500901 ) ) ( not ( = ?auto_500900 ?auto_500902 ) ) ( not ( = ?auto_500900 ?auto_500903 ) ) ( not ( = ?auto_500900 ?auto_500904 ) ) ( not ( = ?auto_500900 ?auto_500905 ) ) ( not ( = ?auto_500900 ?auto_500906 ) ) ( not ( = ?auto_500900 ?auto_500907 ) ) ( not ( = ?auto_500900 ?auto_500908 ) ) ( not ( = ?auto_500900 ?auto_500909 ) ) ( not ( = ?auto_500900 ?auto_500910 ) ) ( not ( = ?auto_500900 ?auto_500911 ) ) ( not ( = ?auto_500900 ?auto_500912 ) ) ( not ( = ?auto_500900 ?auto_500913 ) ) ( not ( = ?auto_500900 ?auto_500914 ) ) ( not ( = ?auto_500900 ?auto_500915 ) ) ( not ( = ?auto_500901 ?auto_500902 ) ) ( not ( = ?auto_500901 ?auto_500903 ) ) ( not ( = ?auto_500901 ?auto_500904 ) ) ( not ( = ?auto_500901 ?auto_500905 ) ) ( not ( = ?auto_500901 ?auto_500906 ) ) ( not ( = ?auto_500901 ?auto_500907 ) ) ( not ( = ?auto_500901 ?auto_500908 ) ) ( not ( = ?auto_500901 ?auto_500909 ) ) ( not ( = ?auto_500901 ?auto_500910 ) ) ( not ( = ?auto_500901 ?auto_500911 ) ) ( not ( = ?auto_500901 ?auto_500912 ) ) ( not ( = ?auto_500901 ?auto_500913 ) ) ( not ( = ?auto_500901 ?auto_500914 ) ) ( not ( = ?auto_500901 ?auto_500915 ) ) ( not ( = ?auto_500902 ?auto_500903 ) ) ( not ( = ?auto_500902 ?auto_500904 ) ) ( not ( = ?auto_500902 ?auto_500905 ) ) ( not ( = ?auto_500902 ?auto_500906 ) ) ( not ( = ?auto_500902 ?auto_500907 ) ) ( not ( = ?auto_500902 ?auto_500908 ) ) ( not ( = ?auto_500902 ?auto_500909 ) ) ( not ( = ?auto_500902 ?auto_500910 ) ) ( not ( = ?auto_500902 ?auto_500911 ) ) ( not ( = ?auto_500902 ?auto_500912 ) ) ( not ( = ?auto_500902 ?auto_500913 ) ) ( not ( = ?auto_500902 ?auto_500914 ) ) ( not ( = ?auto_500902 ?auto_500915 ) ) ( not ( = ?auto_500903 ?auto_500904 ) ) ( not ( = ?auto_500903 ?auto_500905 ) ) ( not ( = ?auto_500903 ?auto_500906 ) ) ( not ( = ?auto_500903 ?auto_500907 ) ) ( not ( = ?auto_500903 ?auto_500908 ) ) ( not ( = ?auto_500903 ?auto_500909 ) ) ( not ( = ?auto_500903 ?auto_500910 ) ) ( not ( = ?auto_500903 ?auto_500911 ) ) ( not ( = ?auto_500903 ?auto_500912 ) ) ( not ( = ?auto_500903 ?auto_500913 ) ) ( not ( = ?auto_500903 ?auto_500914 ) ) ( not ( = ?auto_500903 ?auto_500915 ) ) ( not ( = ?auto_500904 ?auto_500905 ) ) ( not ( = ?auto_500904 ?auto_500906 ) ) ( not ( = ?auto_500904 ?auto_500907 ) ) ( not ( = ?auto_500904 ?auto_500908 ) ) ( not ( = ?auto_500904 ?auto_500909 ) ) ( not ( = ?auto_500904 ?auto_500910 ) ) ( not ( = ?auto_500904 ?auto_500911 ) ) ( not ( = ?auto_500904 ?auto_500912 ) ) ( not ( = ?auto_500904 ?auto_500913 ) ) ( not ( = ?auto_500904 ?auto_500914 ) ) ( not ( = ?auto_500904 ?auto_500915 ) ) ( not ( = ?auto_500905 ?auto_500906 ) ) ( not ( = ?auto_500905 ?auto_500907 ) ) ( not ( = ?auto_500905 ?auto_500908 ) ) ( not ( = ?auto_500905 ?auto_500909 ) ) ( not ( = ?auto_500905 ?auto_500910 ) ) ( not ( = ?auto_500905 ?auto_500911 ) ) ( not ( = ?auto_500905 ?auto_500912 ) ) ( not ( = ?auto_500905 ?auto_500913 ) ) ( not ( = ?auto_500905 ?auto_500914 ) ) ( not ( = ?auto_500905 ?auto_500915 ) ) ( not ( = ?auto_500906 ?auto_500907 ) ) ( not ( = ?auto_500906 ?auto_500908 ) ) ( not ( = ?auto_500906 ?auto_500909 ) ) ( not ( = ?auto_500906 ?auto_500910 ) ) ( not ( = ?auto_500906 ?auto_500911 ) ) ( not ( = ?auto_500906 ?auto_500912 ) ) ( not ( = ?auto_500906 ?auto_500913 ) ) ( not ( = ?auto_500906 ?auto_500914 ) ) ( not ( = ?auto_500906 ?auto_500915 ) ) ( not ( = ?auto_500907 ?auto_500908 ) ) ( not ( = ?auto_500907 ?auto_500909 ) ) ( not ( = ?auto_500907 ?auto_500910 ) ) ( not ( = ?auto_500907 ?auto_500911 ) ) ( not ( = ?auto_500907 ?auto_500912 ) ) ( not ( = ?auto_500907 ?auto_500913 ) ) ( not ( = ?auto_500907 ?auto_500914 ) ) ( not ( = ?auto_500907 ?auto_500915 ) ) ( not ( = ?auto_500908 ?auto_500909 ) ) ( not ( = ?auto_500908 ?auto_500910 ) ) ( not ( = ?auto_500908 ?auto_500911 ) ) ( not ( = ?auto_500908 ?auto_500912 ) ) ( not ( = ?auto_500908 ?auto_500913 ) ) ( not ( = ?auto_500908 ?auto_500914 ) ) ( not ( = ?auto_500908 ?auto_500915 ) ) ( not ( = ?auto_500909 ?auto_500910 ) ) ( not ( = ?auto_500909 ?auto_500911 ) ) ( not ( = ?auto_500909 ?auto_500912 ) ) ( not ( = ?auto_500909 ?auto_500913 ) ) ( not ( = ?auto_500909 ?auto_500914 ) ) ( not ( = ?auto_500909 ?auto_500915 ) ) ( not ( = ?auto_500910 ?auto_500911 ) ) ( not ( = ?auto_500910 ?auto_500912 ) ) ( not ( = ?auto_500910 ?auto_500913 ) ) ( not ( = ?auto_500910 ?auto_500914 ) ) ( not ( = ?auto_500910 ?auto_500915 ) ) ( not ( = ?auto_500911 ?auto_500912 ) ) ( not ( = ?auto_500911 ?auto_500913 ) ) ( not ( = ?auto_500911 ?auto_500914 ) ) ( not ( = ?auto_500911 ?auto_500915 ) ) ( not ( = ?auto_500912 ?auto_500913 ) ) ( not ( = ?auto_500912 ?auto_500914 ) ) ( not ( = ?auto_500912 ?auto_500915 ) ) ( not ( = ?auto_500913 ?auto_500914 ) ) ( not ( = ?auto_500913 ?auto_500915 ) ) ( not ( = ?auto_500914 ?auto_500915 ) ) ( ON ?auto_500913 ?auto_500914 ) ( ON ?auto_500912 ?auto_500913 ) ( ON ?auto_500911 ?auto_500912 ) ( ON ?auto_500910 ?auto_500911 ) ( CLEAR ?auto_500908 ) ( ON ?auto_500909 ?auto_500910 ) ( CLEAR ?auto_500909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_500900 ?auto_500901 ?auto_500902 ?auto_500903 ?auto_500904 ?auto_500905 ?auto_500906 ?auto_500907 ?auto_500908 ?auto_500909 )
      ( MAKE-15PILE ?auto_500900 ?auto_500901 ?auto_500902 ?auto_500903 ?auto_500904 ?auto_500905 ?auto_500906 ?auto_500907 ?auto_500908 ?auto_500909 ?auto_500910 ?auto_500911 ?auto_500912 ?auto_500913 ?auto_500914 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_500962 - BLOCK
      ?auto_500963 - BLOCK
      ?auto_500964 - BLOCK
      ?auto_500965 - BLOCK
      ?auto_500966 - BLOCK
      ?auto_500967 - BLOCK
      ?auto_500968 - BLOCK
      ?auto_500969 - BLOCK
      ?auto_500970 - BLOCK
      ?auto_500971 - BLOCK
      ?auto_500972 - BLOCK
      ?auto_500973 - BLOCK
      ?auto_500974 - BLOCK
      ?auto_500975 - BLOCK
      ?auto_500976 - BLOCK
    )
    :vars
    (
      ?auto_500977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_500976 ?auto_500977 ) ( ON-TABLE ?auto_500962 ) ( ON ?auto_500963 ?auto_500962 ) ( ON ?auto_500964 ?auto_500963 ) ( ON ?auto_500965 ?auto_500964 ) ( ON ?auto_500966 ?auto_500965 ) ( ON ?auto_500967 ?auto_500966 ) ( ON ?auto_500968 ?auto_500967 ) ( ON ?auto_500969 ?auto_500968 ) ( not ( = ?auto_500962 ?auto_500963 ) ) ( not ( = ?auto_500962 ?auto_500964 ) ) ( not ( = ?auto_500962 ?auto_500965 ) ) ( not ( = ?auto_500962 ?auto_500966 ) ) ( not ( = ?auto_500962 ?auto_500967 ) ) ( not ( = ?auto_500962 ?auto_500968 ) ) ( not ( = ?auto_500962 ?auto_500969 ) ) ( not ( = ?auto_500962 ?auto_500970 ) ) ( not ( = ?auto_500962 ?auto_500971 ) ) ( not ( = ?auto_500962 ?auto_500972 ) ) ( not ( = ?auto_500962 ?auto_500973 ) ) ( not ( = ?auto_500962 ?auto_500974 ) ) ( not ( = ?auto_500962 ?auto_500975 ) ) ( not ( = ?auto_500962 ?auto_500976 ) ) ( not ( = ?auto_500962 ?auto_500977 ) ) ( not ( = ?auto_500963 ?auto_500964 ) ) ( not ( = ?auto_500963 ?auto_500965 ) ) ( not ( = ?auto_500963 ?auto_500966 ) ) ( not ( = ?auto_500963 ?auto_500967 ) ) ( not ( = ?auto_500963 ?auto_500968 ) ) ( not ( = ?auto_500963 ?auto_500969 ) ) ( not ( = ?auto_500963 ?auto_500970 ) ) ( not ( = ?auto_500963 ?auto_500971 ) ) ( not ( = ?auto_500963 ?auto_500972 ) ) ( not ( = ?auto_500963 ?auto_500973 ) ) ( not ( = ?auto_500963 ?auto_500974 ) ) ( not ( = ?auto_500963 ?auto_500975 ) ) ( not ( = ?auto_500963 ?auto_500976 ) ) ( not ( = ?auto_500963 ?auto_500977 ) ) ( not ( = ?auto_500964 ?auto_500965 ) ) ( not ( = ?auto_500964 ?auto_500966 ) ) ( not ( = ?auto_500964 ?auto_500967 ) ) ( not ( = ?auto_500964 ?auto_500968 ) ) ( not ( = ?auto_500964 ?auto_500969 ) ) ( not ( = ?auto_500964 ?auto_500970 ) ) ( not ( = ?auto_500964 ?auto_500971 ) ) ( not ( = ?auto_500964 ?auto_500972 ) ) ( not ( = ?auto_500964 ?auto_500973 ) ) ( not ( = ?auto_500964 ?auto_500974 ) ) ( not ( = ?auto_500964 ?auto_500975 ) ) ( not ( = ?auto_500964 ?auto_500976 ) ) ( not ( = ?auto_500964 ?auto_500977 ) ) ( not ( = ?auto_500965 ?auto_500966 ) ) ( not ( = ?auto_500965 ?auto_500967 ) ) ( not ( = ?auto_500965 ?auto_500968 ) ) ( not ( = ?auto_500965 ?auto_500969 ) ) ( not ( = ?auto_500965 ?auto_500970 ) ) ( not ( = ?auto_500965 ?auto_500971 ) ) ( not ( = ?auto_500965 ?auto_500972 ) ) ( not ( = ?auto_500965 ?auto_500973 ) ) ( not ( = ?auto_500965 ?auto_500974 ) ) ( not ( = ?auto_500965 ?auto_500975 ) ) ( not ( = ?auto_500965 ?auto_500976 ) ) ( not ( = ?auto_500965 ?auto_500977 ) ) ( not ( = ?auto_500966 ?auto_500967 ) ) ( not ( = ?auto_500966 ?auto_500968 ) ) ( not ( = ?auto_500966 ?auto_500969 ) ) ( not ( = ?auto_500966 ?auto_500970 ) ) ( not ( = ?auto_500966 ?auto_500971 ) ) ( not ( = ?auto_500966 ?auto_500972 ) ) ( not ( = ?auto_500966 ?auto_500973 ) ) ( not ( = ?auto_500966 ?auto_500974 ) ) ( not ( = ?auto_500966 ?auto_500975 ) ) ( not ( = ?auto_500966 ?auto_500976 ) ) ( not ( = ?auto_500966 ?auto_500977 ) ) ( not ( = ?auto_500967 ?auto_500968 ) ) ( not ( = ?auto_500967 ?auto_500969 ) ) ( not ( = ?auto_500967 ?auto_500970 ) ) ( not ( = ?auto_500967 ?auto_500971 ) ) ( not ( = ?auto_500967 ?auto_500972 ) ) ( not ( = ?auto_500967 ?auto_500973 ) ) ( not ( = ?auto_500967 ?auto_500974 ) ) ( not ( = ?auto_500967 ?auto_500975 ) ) ( not ( = ?auto_500967 ?auto_500976 ) ) ( not ( = ?auto_500967 ?auto_500977 ) ) ( not ( = ?auto_500968 ?auto_500969 ) ) ( not ( = ?auto_500968 ?auto_500970 ) ) ( not ( = ?auto_500968 ?auto_500971 ) ) ( not ( = ?auto_500968 ?auto_500972 ) ) ( not ( = ?auto_500968 ?auto_500973 ) ) ( not ( = ?auto_500968 ?auto_500974 ) ) ( not ( = ?auto_500968 ?auto_500975 ) ) ( not ( = ?auto_500968 ?auto_500976 ) ) ( not ( = ?auto_500968 ?auto_500977 ) ) ( not ( = ?auto_500969 ?auto_500970 ) ) ( not ( = ?auto_500969 ?auto_500971 ) ) ( not ( = ?auto_500969 ?auto_500972 ) ) ( not ( = ?auto_500969 ?auto_500973 ) ) ( not ( = ?auto_500969 ?auto_500974 ) ) ( not ( = ?auto_500969 ?auto_500975 ) ) ( not ( = ?auto_500969 ?auto_500976 ) ) ( not ( = ?auto_500969 ?auto_500977 ) ) ( not ( = ?auto_500970 ?auto_500971 ) ) ( not ( = ?auto_500970 ?auto_500972 ) ) ( not ( = ?auto_500970 ?auto_500973 ) ) ( not ( = ?auto_500970 ?auto_500974 ) ) ( not ( = ?auto_500970 ?auto_500975 ) ) ( not ( = ?auto_500970 ?auto_500976 ) ) ( not ( = ?auto_500970 ?auto_500977 ) ) ( not ( = ?auto_500971 ?auto_500972 ) ) ( not ( = ?auto_500971 ?auto_500973 ) ) ( not ( = ?auto_500971 ?auto_500974 ) ) ( not ( = ?auto_500971 ?auto_500975 ) ) ( not ( = ?auto_500971 ?auto_500976 ) ) ( not ( = ?auto_500971 ?auto_500977 ) ) ( not ( = ?auto_500972 ?auto_500973 ) ) ( not ( = ?auto_500972 ?auto_500974 ) ) ( not ( = ?auto_500972 ?auto_500975 ) ) ( not ( = ?auto_500972 ?auto_500976 ) ) ( not ( = ?auto_500972 ?auto_500977 ) ) ( not ( = ?auto_500973 ?auto_500974 ) ) ( not ( = ?auto_500973 ?auto_500975 ) ) ( not ( = ?auto_500973 ?auto_500976 ) ) ( not ( = ?auto_500973 ?auto_500977 ) ) ( not ( = ?auto_500974 ?auto_500975 ) ) ( not ( = ?auto_500974 ?auto_500976 ) ) ( not ( = ?auto_500974 ?auto_500977 ) ) ( not ( = ?auto_500975 ?auto_500976 ) ) ( not ( = ?auto_500975 ?auto_500977 ) ) ( not ( = ?auto_500976 ?auto_500977 ) ) ( ON ?auto_500975 ?auto_500976 ) ( ON ?auto_500974 ?auto_500975 ) ( ON ?auto_500973 ?auto_500974 ) ( ON ?auto_500972 ?auto_500973 ) ( ON ?auto_500971 ?auto_500972 ) ( CLEAR ?auto_500969 ) ( ON ?auto_500970 ?auto_500971 ) ( CLEAR ?auto_500970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_500962 ?auto_500963 ?auto_500964 ?auto_500965 ?auto_500966 ?auto_500967 ?auto_500968 ?auto_500969 ?auto_500970 )
      ( MAKE-15PILE ?auto_500962 ?auto_500963 ?auto_500964 ?auto_500965 ?auto_500966 ?auto_500967 ?auto_500968 ?auto_500969 ?auto_500970 ?auto_500971 ?auto_500972 ?auto_500973 ?auto_500974 ?auto_500975 ?auto_500976 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501024 - BLOCK
      ?auto_501025 - BLOCK
      ?auto_501026 - BLOCK
      ?auto_501027 - BLOCK
      ?auto_501028 - BLOCK
      ?auto_501029 - BLOCK
      ?auto_501030 - BLOCK
      ?auto_501031 - BLOCK
      ?auto_501032 - BLOCK
      ?auto_501033 - BLOCK
      ?auto_501034 - BLOCK
      ?auto_501035 - BLOCK
      ?auto_501036 - BLOCK
      ?auto_501037 - BLOCK
      ?auto_501038 - BLOCK
    )
    :vars
    (
      ?auto_501039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501038 ?auto_501039 ) ( ON-TABLE ?auto_501024 ) ( ON ?auto_501025 ?auto_501024 ) ( ON ?auto_501026 ?auto_501025 ) ( ON ?auto_501027 ?auto_501026 ) ( ON ?auto_501028 ?auto_501027 ) ( ON ?auto_501029 ?auto_501028 ) ( ON ?auto_501030 ?auto_501029 ) ( not ( = ?auto_501024 ?auto_501025 ) ) ( not ( = ?auto_501024 ?auto_501026 ) ) ( not ( = ?auto_501024 ?auto_501027 ) ) ( not ( = ?auto_501024 ?auto_501028 ) ) ( not ( = ?auto_501024 ?auto_501029 ) ) ( not ( = ?auto_501024 ?auto_501030 ) ) ( not ( = ?auto_501024 ?auto_501031 ) ) ( not ( = ?auto_501024 ?auto_501032 ) ) ( not ( = ?auto_501024 ?auto_501033 ) ) ( not ( = ?auto_501024 ?auto_501034 ) ) ( not ( = ?auto_501024 ?auto_501035 ) ) ( not ( = ?auto_501024 ?auto_501036 ) ) ( not ( = ?auto_501024 ?auto_501037 ) ) ( not ( = ?auto_501024 ?auto_501038 ) ) ( not ( = ?auto_501024 ?auto_501039 ) ) ( not ( = ?auto_501025 ?auto_501026 ) ) ( not ( = ?auto_501025 ?auto_501027 ) ) ( not ( = ?auto_501025 ?auto_501028 ) ) ( not ( = ?auto_501025 ?auto_501029 ) ) ( not ( = ?auto_501025 ?auto_501030 ) ) ( not ( = ?auto_501025 ?auto_501031 ) ) ( not ( = ?auto_501025 ?auto_501032 ) ) ( not ( = ?auto_501025 ?auto_501033 ) ) ( not ( = ?auto_501025 ?auto_501034 ) ) ( not ( = ?auto_501025 ?auto_501035 ) ) ( not ( = ?auto_501025 ?auto_501036 ) ) ( not ( = ?auto_501025 ?auto_501037 ) ) ( not ( = ?auto_501025 ?auto_501038 ) ) ( not ( = ?auto_501025 ?auto_501039 ) ) ( not ( = ?auto_501026 ?auto_501027 ) ) ( not ( = ?auto_501026 ?auto_501028 ) ) ( not ( = ?auto_501026 ?auto_501029 ) ) ( not ( = ?auto_501026 ?auto_501030 ) ) ( not ( = ?auto_501026 ?auto_501031 ) ) ( not ( = ?auto_501026 ?auto_501032 ) ) ( not ( = ?auto_501026 ?auto_501033 ) ) ( not ( = ?auto_501026 ?auto_501034 ) ) ( not ( = ?auto_501026 ?auto_501035 ) ) ( not ( = ?auto_501026 ?auto_501036 ) ) ( not ( = ?auto_501026 ?auto_501037 ) ) ( not ( = ?auto_501026 ?auto_501038 ) ) ( not ( = ?auto_501026 ?auto_501039 ) ) ( not ( = ?auto_501027 ?auto_501028 ) ) ( not ( = ?auto_501027 ?auto_501029 ) ) ( not ( = ?auto_501027 ?auto_501030 ) ) ( not ( = ?auto_501027 ?auto_501031 ) ) ( not ( = ?auto_501027 ?auto_501032 ) ) ( not ( = ?auto_501027 ?auto_501033 ) ) ( not ( = ?auto_501027 ?auto_501034 ) ) ( not ( = ?auto_501027 ?auto_501035 ) ) ( not ( = ?auto_501027 ?auto_501036 ) ) ( not ( = ?auto_501027 ?auto_501037 ) ) ( not ( = ?auto_501027 ?auto_501038 ) ) ( not ( = ?auto_501027 ?auto_501039 ) ) ( not ( = ?auto_501028 ?auto_501029 ) ) ( not ( = ?auto_501028 ?auto_501030 ) ) ( not ( = ?auto_501028 ?auto_501031 ) ) ( not ( = ?auto_501028 ?auto_501032 ) ) ( not ( = ?auto_501028 ?auto_501033 ) ) ( not ( = ?auto_501028 ?auto_501034 ) ) ( not ( = ?auto_501028 ?auto_501035 ) ) ( not ( = ?auto_501028 ?auto_501036 ) ) ( not ( = ?auto_501028 ?auto_501037 ) ) ( not ( = ?auto_501028 ?auto_501038 ) ) ( not ( = ?auto_501028 ?auto_501039 ) ) ( not ( = ?auto_501029 ?auto_501030 ) ) ( not ( = ?auto_501029 ?auto_501031 ) ) ( not ( = ?auto_501029 ?auto_501032 ) ) ( not ( = ?auto_501029 ?auto_501033 ) ) ( not ( = ?auto_501029 ?auto_501034 ) ) ( not ( = ?auto_501029 ?auto_501035 ) ) ( not ( = ?auto_501029 ?auto_501036 ) ) ( not ( = ?auto_501029 ?auto_501037 ) ) ( not ( = ?auto_501029 ?auto_501038 ) ) ( not ( = ?auto_501029 ?auto_501039 ) ) ( not ( = ?auto_501030 ?auto_501031 ) ) ( not ( = ?auto_501030 ?auto_501032 ) ) ( not ( = ?auto_501030 ?auto_501033 ) ) ( not ( = ?auto_501030 ?auto_501034 ) ) ( not ( = ?auto_501030 ?auto_501035 ) ) ( not ( = ?auto_501030 ?auto_501036 ) ) ( not ( = ?auto_501030 ?auto_501037 ) ) ( not ( = ?auto_501030 ?auto_501038 ) ) ( not ( = ?auto_501030 ?auto_501039 ) ) ( not ( = ?auto_501031 ?auto_501032 ) ) ( not ( = ?auto_501031 ?auto_501033 ) ) ( not ( = ?auto_501031 ?auto_501034 ) ) ( not ( = ?auto_501031 ?auto_501035 ) ) ( not ( = ?auto_501031 ?auto_501036 ) ) ( not ( = ?auto_501031 ?auto_501037 ) ) ( not ( = ?auto_501031 ?auto_501038 ) ) ( not ( = ?auto_501031 ?auto_501039 ) ) ( not ( = ?auto_501032 ?auto_501033 ) ) ( not ( = ?auto_501032 ?auto_501034 ) ) ( not ( = ?auto_501032 ?auto_501035 ) ) ( not ( = ?auto_501032 ?auto_501036 ) ) ( not ( = ?auto_501032 ?auto_501037 ) ) ( not ( = ?auto_501032 ?auto_501038 ) ) ( not ( = ?auto_501032 ?auto_501039 ) ) ( not ( = ?auto_501033 ?auto_501034 ) ) ( not ( = ?auto_501033 ?auto_501035 ) ) ( not ( = ?auto_501033 ?auto_501036 ) ) ( not ( = ?auto_501033 ?auto_501037 ) ) ( not ( = ?auto_501033 ?auto_501038 ) ) ( not ( = ?auto_501033 ?auto_501039 ) ) ( not ( = ?auto_501034 ?auto_501035 ) ) ( not ( = ?auto_501034 ?auto_501036 ) ) ( not ( = ?auto_501034 ?auto_501037 ) ) ( not ( = ?auto_501034 ?auto_501038 ) ) ( not ( = ?auto_501034 ?auto_501039 ) ) ( not ( = ?auto_501035 ?auto_501036 ) ) ( not ( = ?auto_501035 ?auto_501037 ) ) ( not ( = ?auto_501035 ?auto_501038 ) ) ( not ( = ?auto_501035 ?auto_501039 ) ) ( not ( = ?auto_501036 ?auto_501037 ) ) ( not ( = ?auto_501036 ?auto_501038 ) ) ( not ( = ?auto_501036 ?auto_501039 ) ) ( not ( = ?auto_501037 ?auto_501038 ) ) ( not ( = ?auto_501037 ?auto_501039 ) ) ( not ( = ?auto_501038 ?auto_501039 ) ) ( ON ?auto_501037 ?auto_501038 ) ( ON ?auto_501036 ?auto_501037 ) ( ON ?auto_501035 ?auto_501036 ) ( ON ?auto_501034 ?auto_501035 ) ( ON ?auto_501033 ?auto_501034 ) ( ON ?auto_501032 ?auto_501033 ) ( CLEAR ?auto_501030 ) ( ON ?auto_501031 ?auto_501032 ) ( CLEAR ?auto_501031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_501024 ?auto_501025 ?auto_501026 ?auto_501027 ?auto_501028 ?auto_501029 ?auto_501030 ?auto_501031 )
      ( MAKE-15PILE ?auto_501024 ?auto_501025 ?auto_501026 ?auto_501027 ?auto_501028 ?auto_501029 ?auto_501030 ?auto_501031 ?auto_501032 ?auto_501033 ?auto_501034 ?auto_501035 ?auto_501036 ?auto_501037 ?auto_501038 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501086 - BLOCK
      ?auto_501087 - BLOCK
      ?auto_501088 - BLOCK
      ?auto_501089 - BLOCK
      ?auto_501090 - BLOCK
      ?auto_501091 - BLOCK
      ?auto_501092 - BLOCK
      ?auto_501093 - BLOCK
      ?auto_501094 - BLOCK
      ?auto_501095 - BLOCK
      ?auto_501096 - BLOCK
      ?auto_501097 - BLOCK
      ?auto_501098 - BLOCK
      ?auto_501099 - BLOCK
      ?auto_501100 - BLOCK
    )
    :vars
    (
      ?auto_501101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501100 ?auto_501101 ) ( ON-TABLE ?auto_501086 ) ( ON ?auto_501087 ?auto_501086 ) ( ON ?auto_501088 ?auto_501087 ) ( ON ?auto_501089 ?auto_501088 ) ( ON ?auto_501090 ?auto_501089 ) ( ON ?auto_501091 ?auto_501090 ) ( not ( = ?auto_501086 ?auto_501087 ) ) ( not ( = ?auto_501086 ?auto_501088 ) ) ( not ( = ?auto_501086 ?auto_501089 ) ) ( not ( = ?auto_501086 ?auto_501090 ) ) ( not ( = ?auto_501086 ?auto_501091 ) ) ( not ( = ?auto_501086 ?auto_501092 ) ) ( not ( = ?auto_501086 ?auto_501093 ) ) ( not ( = ?auto_501086 ?auto_501094 ) ) ( not ( = ?auto_501086 ?auto_501095 ) ) ( not ( = ?auto_501086 ?auto_501096 ) ) ( not ( = ?auto_501086 ?auto_501097 ) ) ( not ( = ?auto_501086 ?auto_501098 ) ) ( not ( = ?auto_501086 ?auto_501099 ) ) ( not ( = ?auto_501086 ?auto_501100 ) ) ( not ( = ?auto_501086 ?auto_501101 ) ) ( not ( = ?auto_501087 ?auto_501088 ) ) ( not ( = ?auto_501087 ?auto_501089 ) ) ( not ( = ?auto_501087 ?auto_501090 ) ) ( not ( = ?auto_501087 ?auto_501091 ) ) ( not ( = ?auto_501087 ?auto_501092 ) ) ( not ( = ?auto_501087 ?auto_501093 ) ) ( not ( = ?auto_501087 ?auto_501094 ) ) ( not ( = ?auto_501087 ?auto_501095 ) ) ( not ( = ?auto_501087 ?auto_501096 ) ) ( not ( = ?auto_501087 ?auto_501097 ) ) ( not ( = ?auto_501087 ?auto_501098 ) ) ( not ( = ?auto_501087 ?auto_501099 ) ) ( not ( = ?auto_501087 ?auto_501100 ) ) ( not ( = ?auto_501087 ?auto_501101 ) ) ( not ( = ?auto_501088 ?auto_501089 ) ) ( not ( = ?auto_501088 ?auto_501090 ) ) ( not ( = ?auto_501088 ?auto_501091 ) ) ( not ( = ?auto_501088 ?auto_501092 ) ) ( not ( = ?auto_501088 ?auto_501093 ) ) ( not ( = ?auto_501088 ?auto_501094 ) ) ( not ( = ?auto_501088 ?auto_501095 ) ) ( not ( = ?auto_501088 ?auto_501096 ) ) ( not ( = ?auto_501088 ?auto_501097 ) ) ( not ( = ?auto_501088 ?auto_501098 ) ) ( not ( = ?auto_501088 ?auto_501099 ) ) ( not ( = ?auto_501088 ?auto_501100 ) ) ( not ( = ?auto_501088 ?auto_501101 ) ) ( not ( = ?auto_501089 ?auto_501090 ) ) ( not ( = ?auto_501089 ?auto_501091 ) ) ( not ( = ?auto_501089 ?auto_501092 ) ) ( not ( = ?auto_501089 ?auto_501093 ) ) ( not ( = ?auto_501089 ?auto_501094 ) ) ( not ( = ?auto_501089 ?auto_501095 ) ) ( not ( = ?auto_501089 ?auto_501096 ) ) ( not ( = ?auto_501089 ?auto_501097 ) ) ( not ( = ?auto_501089 ?auto_501098 ) ) ( not ( = ?auto_501089 ?auto_501099 ) ) ( not ( = ?auto_501089 ?auto_501100 ) ) ( not ( = ?auto_501089 ?auto_501101 ) ) ( not ( = ?auto_501090 ?auto_501091 ) ) ( not ( = ?auto_501090 ?auto_501092 ) ) ( not ( = ?auto_501090 ?auto_501093 ) ) ( not ( = ?auto_501090 ?auto_501094 ) ) ( not ( = ?auto_501090 ?auto_501095 ) ) ( not ( = ?auto_501090 ?auto_501096 ) ) ( not ( = ?auto_501090 ?auto_501097 ) ) ( not ( = ?auto_501090 ?auto_501098 ) ) ( not ( = ?auto_501090 ?auto_501099 ) ) ( not ( = ?auto_501090 ?auto_501100 ) ) ( not ( = ?auto_501090 ?auto_501101 ) ) ( not ( = ?auto_501091 ?auto_501092 ) ) ( not ( = ?auto_501091 ?auto_501093 ) ) ( not ( = ?auto_501091 ?auto_501094 ) ) ( not ( = ?auto_501091 ?auto_501095 ) ) ( not ( = ?auto_501091 ?auto_501096 ) ) ( not ( = ?auto_501091 ?auto_501097 ) ) ( not ( = ?auto_501091 ?auto_501098 ) ) ( not ( = ?auto_501091 ?auto_501099 ) ) ( not ( = ?auto_501091 ?auto_501100 ) ) ( not ( = ?auto_501091 ?auto_501101 ) ) ( not ( = ?auto_501092 ?auto_501093 ) ) ( not ( = ?auto_501092 ?auto_501094 ) ) ( not ( = ?auto_501092 ?auto_501095 ) ) ( not ( = ?auto_501092 ?auto_501096 ) ) ( not ( = ?auto_501092 ?auto_501097 ) ) ( not ( = ?auto_501092 ?auto_501098 ) ) ( not ( = ?auto_501092 ?auto_501099 ) ) ( not ( = ?auto_501092 ?auto_501100 ) ) ( not ( = ?auto_501092 ?auto_501101 ) ) ( not ( = ?auto_501093 ?auto_501094 ) ) ( not ( = ?auto_501093 ?auto_501095 ) ) ( not ( = ?auto_501093 ?auto_501096 ) ) ( not ( = ?auto_501093 ?auto_501097 ) ) ( not ( = ?auto_501093 ?auto_501098 ) ) ( not ( = ?auto_501093 ?auto_501099 ) ) ( not ( = ?auto_501093 ?auto_501100 ) ) ( not ( = ?auto_501093 ?auto_501101 ) ) ( not ( = ?auto_501094 ?auto_501095 ) ) ( not ( = ?auto_501094 ?auto_501096 ) ) ( not ( = ?auto_501094 ?auto_501097 ) ) ( not ( = ?auto_501094 ?auto_501098 ) ) ( not ( = ?auto_501094 ?auto_501099 ) ) ( not ( = ?auto_501094 ?auto_501100 ) ) ( not ( = ?auto_501094 ?auto_501101 ) ) ( not ( = ?auto_501095 ?auto_501096 ) ) ( not ( = ?auto_501095 ?auto_501097 ) ) ( not ( = ?auto_501095 ?auto_501098 ) ) ( not ( = ?auto_501095 ?auto_501099 ) ) ( not ( = ?auto_501095 ?auto_501100 ) ) ( not ( = ?auto_501095 ?auto_501101 ) ) ( not ( = ?auto_501096 ?auto_501097 ) ) ( not ( = ?auto_501096 ?auto_501098 ) ) ( not ( = ?auto_501096 ?auto_501099 ) ) ( not ( = ?auto_501096 ?auto_501100 ) ) ( not ( = ?auto_501096 ?auto_501101 ) ) ( not ( = ?auto_501097 ?auto_501098 ) ) ( not ( = ?auto_501097 ?auto_501099 ) ) ( not ( = ?auto_501097 ?auto_501100 ) ) ( not ( = ?auto_501097 ?auto_501101 ) ) ( not ( = ?auto_501098 ?auto_501099 ) ) ( not ( = ?auto_501098 ?auto_501100 ) ) ( not ( = ?auto_501098 ?auto_501101 ) ) ( not ( = ?auto_501099 ?auto_501100 ) ) ( not ( = ?auto_501099 ?auto_501101 ) ) ( not ( = ?auto_501100 ?auto_501101 ) ) ( ON ?auto_501099 ?auto_501100 ) ( ON ?auto_501098 ?auto_501099 ) ( ON ?auto_501097 ?auto_501098 ) ( ON ?auto_501096 ?auto_501097 ) ( ON ?auto_501095 ?auto_501096 ) ( ON ?auto_501094 ?auto_501095 ) ( ON ?auto_501093 ?auto_501094 ) ( CLEAR ?auto_501091 ) ( ON ?auto_501092 ?auto_501093 ) ( CLEAR ?auto_501092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_501086 ?auto_501087 ?auto_501088 ?auto_501089 ?auto_501090 ?auto_501091 ?auto_501092 )
      ( MAKE-15PILE ?auto_501086 ?auto_501087 ?auto_501088 ?auto_501089 ?auto_501090 ?auto_501091 ?auto_501092 ?auto_501093 ?auto_501094 ?auto_501095 ?auto_501096 ?auto_501097 ?auto_501098 ?auto_501099 ?auto_501100 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501148 - BLOCK
      ?auto_501149 - BLOCK
      ?auto_501150 - BLOCK
      ?auto_501151 - BLOCK
      ?auto_501152 - BLOCK
      ?auto_501153 - BLOCK
      ?auto_501154 - BLOCK
      ?auto_501155 - BLOCK
      ?auto_501156 - BLOCK
      ?auto_501157 - BLOCK
      ?auto_501158 - BLOCK
      ?auto_501159 - BLOCK
      ?auto_501160 - BLOCK
      ?auto_501161 - BLOCK
      ?auto_501162 - BLOCK
    )
    :vars
    (
      ?auto_501163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501162 ?auto_501163 ) ( ON-TABLE ?auto_501148 ) ( ON ?auto_501149 ?auto_501148 ) ( ON ?auto_501150 ?auto_501149 ) ( ON ?auto_501151 ?auto_501150 ) ( ON ?auto_501152 ?auto_501151 ) ( not ( = ?auto_501148 ?auto_501149 ) ) ( not ( = ?auto_501148 ?auto_501150 ) ) ( not ( = ?auto_501148 ?auto_501151 ) ) ( not ( = ?auto_501148 ?auto_501152 ) ) ( not ( = ?auto_501148 ?auto_501153 ) ) ( not ( = ?auto_501148 ?auto_501154 ) ) ( not ( = ?auto_501148 ?auto_501155 ) ) ( not ( = ?auto_501148 ?auto_501156 ) ) ( not ( = ?auto_501148 ?auto_501157 ) ) ( not ( = ?auto_501148 ?auto_501158 ) ) ( not ( = ?auto_501148 ?auto_501159 ) ) ( not ( = ?auto_501148 ?auto_501160 ) ) ( not ( = ?auto_501148 ?auto_501161 ) ) ( not ( = ?auto_501148 ?auto_501162 ) ) ( not ( = ?auto_501148 ?auto_501163 ) ) ( not ( = ?auto_501149 ?auto_501150 ) ) ( not ( = ?auto_501149 ?auto_501151 ) ) ( not ( = ?auto_501149 ?auto_501152 ) ) ( not ( = ?auto_501149 ?auto_501153 ) ) ( not ( = ?auto_501149 ?auto_501154 ) ) ( not ( = ?auto_501149 ?auto_501155 ) ) ( not ( = ?auto_501149 ?auto_501156 ) ) ( not ( = ?auto_501149 ?auto_501157 ) ) ( not ( = ?auto_501149 ?auto_501158 ) ) ( not ( = ?auto_501149 ?auto_501159 ) ) ( not ( = ?auto_501149 ?auto_501160 ) ) ( not ( = ?auto_501149 ?auto_501161 ) ) ( not ( = ?auto_501149 ?auto_501162 ) ) ( not ( = ?auto_501149 ?auto_501163 ) ) ( not ( = ?auto_501150 ?auto_501151 ) ) ( not ( = ?auto_501150 ?auto_501152 ) ) ( not ( = ?auto_501150 ?auto_501153 ) ) ( not ( = ?auto_501150 ?auto_501154 ) ) ( not ( = ?auto_501150 ?auto_501155 ) ) ( not ( = ?auto_501150 ?auto_501156 ) ) ( not ( = ?auto_501150 ?auto_501157 ) ) ( not ( = ?auto_501150 ?auto_501158 ) ) ( not ( = ?auto_501150 ?auto_501159 ) ) ( not ( = ?auto_501150 ?auto_501160 ) ) ( not ( = ?auto_501150 ?auto_501161 ) ) ( not ( = ?auto_501150 ?auto_501162 ) ) ( not ( = ?auto_501150 ?auto_501163 ) ) ( not ( = ?auto_501151 ?auto_501152 ) ) ( not ( = ?auto_501151 ?auto_501153 ) ) ( not ( = ?auto_501151 ?auto_501154 ) ) ( not ( = ?auto_501151 ?auto_501155 ) ) ( not ( = ?auto_501151 ?auto_501156 ) ) ( not ( = ?auto_501151 ?auto_501157 ) ) ( not ( = ?auto_501151 ?auto_501158 ) ) ( not ( = ?auto_501151 ?auto_501159 ) ) ( not ( = ?auto_501151 ?auto_501160 ) ) ( not ( = ?auto_501151 ?auto_501161 ) ) ( not ( = ?auto_501151 ?auto_501162 ) ) ( not ( = ?auto_501151 ?auto_501163 ) ) ( not ( = ?auto_501152 ?auto_501153 ) ) ( not ( = ?auto_501152 ?auto_501154 ) ) ( not ( = ?auto_501152 ?auto_501155 ) ) ( not ( = ?auto_501152 ?auto_501156 ) ) ( not ( = ?auto_501152 ?auto_501157 ) ) ( not ( = ?auto_501152 ?auto_501158 ) ) ( not ( = ?auto_501152 ?auto_501159 ) ) ( not ( = ?auto_501152 ?auto_501160 ) ) ( not ( = ?auto_501152 ?auto_501161 ) ) ( not ( = ?auto_501152 ?auto_501162 ) ) ( not ( = ?auto_501152 ?auto_501163 ) ) ( not ( = ?auto_501153 ?auto_501154 ) ) ( not ( = ?auto_501153 ?auto_501155 ) ) ( not ( = ?auto_501153 ?auto_501156 ) ) ( not ( = ?auto_501153 ?auto_501157 ) ) ( not ( = ?auto_501153 ?auto_501158 ) ) ( not ( = ?auto_501153 ?auto_501159 ) ) ( not ( = ?auto_501153 ?auto_501160 ) ) ( not ( = ?auto_501153 ?auto_501161 ) ) ( not ( = ?auto_501153 ?auto_501162 ) ) ( not ( = ?auto_501153 ?auto_501163 ) ) ( not ( = ?auto_501154 ?auto_501155 ) ) ( not ( = ?auto_501154 ?auto_501156 ) ) ( not ( = ?auto_501154 ?auto_501157 ) ) ( not ( = ?auto_501154 ?auto_501158 ) ) ( not ( = ?auto_501154 ?auto_501159 ) ) ( not ( = ?auto_501154 ?auto_501160 ) ) ( not ( = ?auto_501154 ?auto_501161 ) ) ( not ( = ?auto_501154 ?auto_501162 ) ) ( not ( = ?auto_501154 ?auto_501163 ) ) ( not ( = ?auto_501155 ?auto_501156 ) ) ( not ( = ?auto_501155 ?auto_501157 ) ) ( not ( = ?auto_501155 ?auto_501158 ) ) ( not ( = ?auto_501155 ?auto_501159 ) ) ( not ( = ?auto_501155 ?auto_501160 ) ) ( not ( = ?auto_501155 ?auto_501161 ) ) ( not ( = ?auto_501155 ?auto_501162 ) ) ( not ( = ?auto_501155 ?auto_501163 ) ) ( not ( = ?auto_501156 ?auto_501157 ) ) ( not ( = ?auto_501156 ?auto_501158 ) ) ( not ( = ?auto_501156 ?auto_501159 ) ) ( not ( = ?auto_501156 ?auto_501160 ) ) ( not ( = ?auto_501156 ?auto_501161 ) ) ( not ( = ?auto_501156 ?auto_501162 ) ) ( not ( = ?auto_501156 ?auto_501163 ) ) ( not ( = ?auto_501157 ?auto_501158 ) ) ( not ( = ?auto_501157 ?auto_501159 ) ) ( not ( = ?auto_501157 ?auto_501160 ) ) ( not ( = ?auto_501157 ?auto_501161 ) ) ( not ( = ?auto_501157 ?auto_501162 ) ) ( not ( = ?auto_501157 ?auto_501163 ) ) ( not ( = ?auto_501158 ?auto_501159 ) ) ( not ( = ?auto_501158 ?auto_501160 ) ) ( not ( = ?auto_501158 ?auto_501161 ) ) ( not ( = ?auto_501158 ?auto_501162 ) ) ( not ( = ?auto_501158 ?auto_501163 ) ) ( not ( = ?auto_501159 ?auto_501160 ) ) ( not ( = ?auto_501159 ?auto_501161 ) ) ( not ( = ?auto_501159 ?auto_501162 ) ) ( not ( = ?auto_501159 ?auto_501163 ) ) ( not ( = ?auto_501160 ?auto_501161 ) ) ( not ( = ?auto_501160 ?auto_501162 ) ) ( not ( = ?auto_501160 ?auto_501163 ) ) ( not ( = ?auto_501161 ?auto_501162 ) ) ( not ( = ?auto_501161 ?auto_501163 ) ) ( not ( = ?auto_501162 ?auto_501163 ) ) ( ON ?auto_501161 ?auto_501162 ) ( ON ?auto_501160 ?auto_501161 ) ( ON ?auto_501159 ?auto_501160 ) ( ON ?auto_501158 ?auto_501159 ) ( ON ?auto_501157 ?auto_501158 ) ( ON ?auto_501156 ?auto_501157 ) ( ON ?auto_501155 ?auto_501156 ) ( ON ?auto_501154 ?auto_501155 ) ( CLEAR ?auto_501152 ) ( ON ?auto_501153 ?auto_501154 ) ( CLEAR ?auto_501153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_501148 ?auto_501149 ?auto_501150 ?auto_501151 ?auto_501152 ?auto_501153 )
      ( MAKE-15PILE ?auto_501148 ?auto_501149 ?auto_501150 ?auto_501151 ?auto_501152 ?auto_501153 ?auto_501154 ?auto_501155 ?auto_501156 ?auto_501157 ?auto_501158 ?auto_501159 ?auto_501160 ?auto_501161 ?auto_501162 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501210 - BLOCK
      ?auto_501211 - BLOCK
      ?auto_501212 - BLOCK
      ?auto_501213 - BLOCK
      ?auto_501214 - BLOCK
      ?auto_501215 - BLOCK
      ?auto_501216 - BLOCK
      ?auto_501217 - BLOCK
      ?auto_501218 - BLOCK
      ?auto_501219 - BLOCK
      ?auto_501220 - BLOCK
      ?auto_501221 - BLOCK
      ?auto_501222 - BLOCK
      ?auto_501223 - BLOCK
      ?auto_501224 - BLOCK
    )
    :vars
    (
      ?auto_501225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501224 ?auto_501225 ) ( ON-TABLE ?auto_501210 ) ( ON ?auto_501211 ?auto_501210 ) ( ON ?auto_501212 ?auto_501211 ) ( ON ?auto_501213 ?auto_501212 ) ( not ( = ?auto_501210 ?auto_501211 ) ) ( not ( = ?auto_501210 ?auto_501212 ) ) ( not ( = ?auto_501210 ?auto_501213 ) ) ( not ( = ?auto_501210 ?auto_501214 ) ) ( not ( = ?auto_501210 ?auto_501215 ) ) ( not ( = ?auto_501210 ?auto_501216 ) ) ( not ( = ?auto_501210 ?auto_501217 ) ) ( not ( = ?auto_501210 ?auto_501218 ) ) ( not ( = ?auto_501210 ?auto_501219 ) ) ( not ( = ?auto_501210 ?auto_501220 ) ) ( not ( = ?auto_501210 ?auto_501221 ) ) ( not ( = ?auto_501210 ?auto_501222 ) ) ( not ( = ?auto_501210 ?auto_501223 ) ) ( not ( = ?auto_501210 ?auto_501224 ) ) ( not ( = ?auto_501210 ?auto_501225 ) ) ( not ( = ?auto_501211 ?auto_501212 ) ) ( not ( = ?auto_501211 ?auto_501213 ) ) ( not ( = ?auto_501211 ?auto_501214 ) ) ( not ( = ?auto_501211 ?auto_501215 ) ) ( not ( = ?auto_501211 ?auto_501216 ) ) ( not ( = ?auto_501211 ?auto_501217 ) ) ( not ( = ?auto_501211 ?auto_501218 ) ) ( not ( = ?auto_501211 ?auto_501219 ) ) ( not ( = ?auto_501211 ?auto_501220 ) ) ( not ( = ?auto_501211 ?auto_501221 ) ) ( not ( = ?auto_501211 ?auto_501222 ) ) ( not ( = ?auto_501211 ?auto_501223 ) ) ( not ( = ?auto_501211 ?auto_501224 ) ) ( not ( = ?auto_501211 ?auto_501225 ) ) ( not ( = ?auto_501212 ?auto_501213 ) ) ( not ( = ?auto_501212 ?auto_501214 ) ) ( not ( = ?auto_501212 ?auto_501215 ) ) ( not ( = ?auto_501212 ?auto_501216 ) ) ( not ( = ?auto_501212 ?auto_501217 ) ) ( not ( = ?auto_501212 ?auto_501218 ) ) ( not ( = ?auto_501212 ?auto_501219 ) ) ( not ( = ?auto_501212 ?auto_501220 ) ) ( not ( = ?auto_501212 ?auto_501221 ) ) ( not ( = ?auto_501212 ?auto_501222 ) ) ( not ( = ?auto_501212 ?auto_501223 ) ) ( not ( = ?auto_501212 ?auto_501224 ) ) ( not ( = ?auto_501212 ?auto_501225 ) ) ( not ( = ?auto_501213 ?auto_501214 ) ) ( not ( = ?auto_501213 ?auto_501215 ) ) ( not ( = ?auto_501213 ?auto_501216 ) ) ( not ( = ?auto_501213 ?auto_501217 ) ) ( not ( = ?auto_501213 ?auto_501218 ) ) ( not ( = ?auto_501213 ?auto_501219 ) ) ( not ( = ?auto_501213 ?auto_501220 ) ) ( not ( = ?auto_501213 ?auto_501221 ) ) ( not ( = ?auto_501213 ?auto_501222 ) ) ( not ( = ?auto_501213 ?auto_501223 ) ) ( not ( = ?auto_501213 ?auto_501224 ) ) ( not ( = ?auto_501213 ?auto_501225 ) ) ( not ( = ?auto_501214 ?auto_501215 ) ) ( not ( = ?auto_501214 ?auto_501216 ) ) ( not ( = ?auto_501214 ?auto_501217 ) ) ( not ( = ?auto_501214 ?auto_501218 ) ) ( not ( = ?auto_501214 ?auto_501219 ) ) ( not ( = ?auto_501214 ?auto_501220 ) ) ( not ( = ?auto_501214 ?auto_501221 ) ) ( not ( = ?auto_501214 ?auto_501222 ) ) ( not ( = ?auto_501214 ?auto_501223 ) ) ( not ( = ?auto_501214 ?auto_501224 ) ) ( not ( = ?auto_501214 ?auto_501225 ) ) ( not ( = ?auto_501215 ?auto_501216 ) ) ( not ( = ?auto_501215 ?auto_501217 ) ) ( not ( = ?auto_501215 ?auto_501218 ) ) ( not ( = ?auto_501215 ?auto_501219 ) ) ( not ( = ?auto_501215 ?auto_501220 ) ) ( not ( = ?auto_501215 ?auto_501221 ) ) ( not ( = ?auto_501215 ?auto_501222 ) ) ( not ( = ?auto_501215 ?auto_501223 ) ) ( not ( = ?auto_501215 ?auto_501224 ) ) ( not ( = ?auto_501215 ?auto_501225 ) ) ( not ( = ?auto_501216 ?auto_501217 ) ) ( not ( = ?auto_501216 ?auto_501218 ) ) ( not ( = ?auto_501216 ?auto_501219 ) ) ( not ( = ?auto_501216 ?auto_501220 ) ) ( not ( = ?auto_501216 ?auto_501221 ) ) ( not ( = ?auto_501216 ?auto_501222 ) ) ( not ( = ?auto_501216 ?auto_501223 ) ) ( not ( = ?auto_501216 ?auto_501224 ) ) ( not ( = ?auto_501216 ?auto_501225 ) ) ( not ( = ?auto_501217 ?auto_501218 ) ) ( not ( = ?auto_501217 ?auto_501219 ) ) ( not ( = ?auto_501217 ?auto_501220 ) ) ( not ( = ?auto_501217 ?auto_501221 ) ) ( not ( = ?auto_501217 ?auto_501222 ) ) ( not ( = ?auto_501217 ?auto_501223 ) ) ( not ( = ?auto_501217 ?auto_501224 ) ) ( not ( = ?auto_501217 ?auto_501225 ) ) ( not ( = ?auto_501218 ?auto_501219 ) ) ( not ( = ?auto_501218 ?auto_501220 ) ) ( not ( = ?auto_501218 ?auto_501221 ) ) ( not ( = ?auto_501218 ?auto_501222 ) ) ( not ( = ?auto_501218 ?auto_501223 ) ) ( not ( = ?auto_501218 ?auto_501224 ) ) ( not ( = ?auto_501218 ?auto_501225 ) ) ( not ( = ?auto_501219 ?auto_501220 ) ) ( not ( = ?auto_501219 ?auto_501221 ) ) ( not ( = ?auto_501219 ?auto_501222 ) ) ( not ( = ?auto_501219 ?auto_501223 ) ) ( not ( = ?auto_501219 ?auto_501224 ) ) ( not ( = ?auto_501219 ?auto_501225 ) ) ( not ( = ?auto_501220 ?auto_501221 ) ) ( not ( = ?auto_501220 ?auto_501222 ) ) ( not ( = ?auto_501220 ?auto_501223 ) ) ( not ( = ?auto_501220 ?auto_501224 ) ) ( not ( = ?auto_501220 ?auto_501225 ) ) ( not ( = ?auto_501221 ?auto_501222 ) ) ( not ( = ?auto_501221 ?auto_501223 ) ) ( not ( = ?auto_501221 ?auto_501224 ) ) ( not ( = ?auto_501221 ?auto_501225 ) ) ( not ( = ?auto_501222 ?auto_501223 ) ) ( not ( = ?auto_501222 ?auto_501224 ) ) ( not ( = ?auto_501222 ?auto_501225 ) ) ( not ( = ?auto_501223 ?auto_501224 ) ) ( not ( = ?auto_501223 ?auto_501225 ) ) ( not ( = ?auto_501224 ?auto_501225 ) ) ( ON ?auto_501223 ?auto_501224 ) ( ON ?auto_501222 ?auto_501223 ) ( ON ?auto_501221 ?auto_501222 ) ( ON ?auto_501220 ?auto_501221 ) ( ON ?auto_501219 ?auto_501220 ) ( ON ?auto_501218 ?auto_501219 ) ( ON ?auto_501217 ?auto_501218 ) ( ON ?auto_501216 ?auto_501217 ) ( ON ?auto_501215 ?auto_501216 ) ( CLEAR ?auto_501213 ) ( ON ?auto_501214 ?auto_501215 ) ( CLEAR ?auto_501214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_501210 ?auto_501211 ?auto_501212 ?auto_501213 ?auto_501214 )
      ( MAKE-15PILE ?auto_501210 ?auto_501211 ?auto_501212 ?auto_501213 ?auto_501214 ?auto_501215 ?auto_501216 ?auto_501217 ?auto_501218 ?auto_501219 ?auto_501220 ?auto_501221 ?auto_501222 ?auto_501223 ?auto_501224 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501272 - BLOCK
      ?auto_501273 - BLOCK
      ?auto_501274 - BLOCK
      ?auto_501275 - BLOCK
      ?auto_501276 - BLOCK
      ?auto_501277 - BLOCK
      ?auto_501278 - BLOCK
      ?auto_501279 - BLOCK
      ?auto_501280 - BLOCK
      ?auto_501281 - BLOCK
      ?auto_501282 - BLOCK
      ?auto_501283 - BLOCK
      ?auto_501284 - BLOCK
      ?auto_501285 - BLOCK
      ?auto_501286 - BLOCK
    )
    :vars
    (
      ?auto_501287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501286 ?auto_501287 ) ( ON-TABLE ?auto_501272 ) ( ON ?auto_501273 ?auto_501272 ) ( ON ?auto_501274 ?auto_501273 ) ( not ( = ?auto_501272 ?auto_501273 ) ) ( not ( = ?auto_501272 ?auto_501274 ) ) ( not ( = ?auto_501272 ?auto_501275 ) ) ( not ( = ?auto_501272 ?auto_501276 ) ) ( not ( = ?auto_501272 ?auto_501277 ) ) ( not ( = ?auto_501272 ?auto_501278 ) ) ( not ( = ?auto_501272 ?auto_501279 ) ) ( not ( = ?auto_501272 ?auto_501280 ) ) ( not ( = ?auto_501272 ?auto_501281 ) ) ( not ( = ?auto_501272 ?auto_501282 ) ) ( not ( = ?auto_501272 ?auto_501283 ) ) ( not ( = ?auto_501272 ?auto_501284 ) ) ( not ( = ?auto_501272 ?auto_501285 ) ) ( not ( = ?auto_501272 ?auto_501286 ) ) ( not ( = ?auto_501272 ?auto_501287 ) ) ( not ( = ?auto_501273 ?auto_501274 ) ) ( not ( = ?auto_501273 ?auto_501275 ) ) ( not ( = ?auto_501273 ?auto_501276 ) ) ( not ( = ?auto_501273 ?auto_501277 ) ) ( not ( = ?auto_501273 ?auto_501278 ) ) ( not ( = ?auto_501273 ?auto_501279 ) ) ( not ( = ?auto_501273 ?auto_501280 ) ) ( not ( = ?auto_501273 ?auto_501281 ) ) ( not ( = ?auto_501273 ?auto_501282 ) ) ( not ( = ?auto_501273 ?auto_501283 ) ) ( not ( = ?auto_501273 ?auto_501284 ) ) ( not ( = ?auto_501273 ?auto_501285 ) ) ( not ( = ?auto_501273 ?auto_501286 ) ) ( not ( = ?auto_501273 ?auto_501287 ) ) ( not ( = ?auto_501274 ?auto_501275 ) ) ( not ( = ?auto_501274 ?auto_501276 ) ) ( not ( = ?auto_501274 ?auto_501277 ) ) ( not ( = ?auto_501274 ?auto_501278 ) ) ( not ( = ?auto_501274 ?auto_501279 ) ) ( not ( = ?auto_501274 ?auto_501280 ) ) ( not ( = ?auto_501274 ?auto_501281 ) ) ( not ( = ?auto_501274 ?auto_501282 ) ) ( not ( = ?auto_501274 ?auto_501283 ) ) ( not ( = ?auto_501274 ?auto_501284 ) ) ( not ( = ?auto_501274 ?auto_501285 ) ) ( not ( = ?auto_501274 ?auto_501286 ) ) ( not ( = ?auto_501274 ?auto_501287 ) ) ( not ( = ?auto_501275 ?auto_501276 ) ) ( not ( = ?auto_501275 ?auto_501277 ) ) ( not ( = ?auto_501275 ?auto_501278 ) ) ( not ( = ?auto_501275 ?auto_501279 ) ) ( not ( = ?auto_501275 ?auto_501280 ) ) ( not ( = ?auto_501275 ?auto_501281 ) ) ( not ( = ?auto_501275 ?auto_501282 ) ) ( not ( = ?auto_501275 ?auto_501283 ) ) ( not ( = ?auto_501275 ?auto_501284 ) ) ( not ( = ?auto_501275 ?auto_501285 ) ) ( not ( = ?auto_501275 ?auto_501286 ) ) ( not ( = ?auto_501275 ?auto_501287 ) ) ( not ( = ?auto_501276 ?auto_501277 ) ) ( not ( = ?auto_501276 ?auto_501278 ) ) ( not ( = ?auto_501276 ?auto_501279 ) ) ( not ( = ?auto_501276 ?auto_501280 ) ) ( not ( = ?auto_501276 ?auto_501281 ) ) ( not ( = ?auto_501276 ?auto_501282 ) ) ( not ( = ?auto_501276 ?auto_501283 ) ) ( not ( = ?auto_501276 ?auto_501284 ) ) ( not ( = ?auto_501276 ?auto_501285 ) ) ( not ( = ?auto_501276 ?auto_501286 ) ) ( not ( = ?auto_501276 ?auto_501287 ) ) ( not ( = ?auto_501277 ?auto_501278 ) ) ( not ( = ?auto_501277 ?auto_501279 ) ) ( not ( = ?auto_501277 ?auto_501280 ) ) ( not ( = ?auto_501277 ?auto_501281 ) ) ( not ( = ?auto_501277 ?auto_501282 ) ) ( not ( = ?auto_501277 ?auto_501283 ) ) ( not ( = ?auto_501277 ?auto_501284 ) ) ( not ( = ?auto_501277 ?auto_501285 ) ) ( not ( = ?auto_501277 ?auto_501286 ) ) ( not ( = ?auto_501277 ?auto_501287 ) ) ( not ( = ?auto_501278 ?auto_501279 ) ) ( not ( = ?auto_501278 ?auto_501280 ) ) ( not ( = ?auto_501278 ?auto_501281 ) ) ( not ( = ?auto_501278 ?auto_501282 ) ) ( not ( = ?auto_501278 ?auto_501283 ) ) ( not ( = ?auto_501278 ?auto_501284 ) ) ( not ( = ?auto_501278 ?auto_501285 ) ) ( not ( = ?auto_501278 ?auto_501286 ) ) ( not ( = ?auto_501278 ?auto_501287 ) ) ( not ( = ?auto_501279 ?auto_501280 ) ) ( not ( = ?auto_501279 ?auto_501281 ) ) ( not ( = ?auto_501279 ?auto_501282 ) ) ( not ( = ?auto_501279 ?auto_501283 ) ) ( not ( = ?auto_501279 ?auto_501284 ) ) ( not ( = ?auto_501279 ?auto_501285 ) ) ( not ( = ?auto_501279 ?auto_501286 ) ) ( not ( = ?auto_501279 ?auto_501287 ) ) ( not ( = ?auto_501280 ?auto_501281 ) ) ( not ( = ?auto_501280 ?auto_501282 ) ) ( not ( = ?auto_501280 ?auto_501283 ) ) ( not ( = ?auto_501280 ?auto_501284 ) ) ( not ( = ?auto_501280 ?auto_501285 ) ) ( not ( = ?auto_501280 ?auto_501286 ) ) ( not ( = ?auto_501280 ?auto_501287 ) ) ( not ( = ?auto_501281 ?auto_501282 ) ) ( not ( = ?auto_501281 ?auto_501283 ) ) ( not ( = ?auto_501281 ?auto_501284 ) ) ( not ( = ?auto_501281 ?auto_501285 ) ) ( not ( = ?auto_501281 ?auto_501286 ) ) ( not ( = ?auto_501281 ?auto_501287 ) ) ( not ( = ?auto_501282 ?auto_501283 ) ) ( not ( = ?auto_501282 ?auto_501284 ) ) ( not ( = ?auto_501282 ?auto_501285 ) ) ( not ( = ?auto_501282 ?auto_501286 ) ) ( not ( = ?auto_501282 ?auto_501287 ) ) ( not ( = ?auto_501283 ?auto_501284 ) ) ( not ( = ?auto_501283 ?auto_501285 ) ) ( not ( = ?auto_501283 ?auto_501286 ) ) ( not ( = ?auto_501283 ?auto_501287 ) ) ( not ( = ?auto_501284 ?auto_501285 ) ) ( not ( = ?auto_501284 ?auto_501286 ) ) ( not ( = ?auto_501284 ?auto_501287 ) ) ( not ( = ?auto_501285 ?auto_501286 ) ) ( not ( = ?auto_501285 ?auto_501287 ) ) ( not ( = ?auto_501286 ?auto_501287 ) ) ( ON ?auto_501285 ?auto_501286 ) ( ON ?auto_501284 ?auto_501285 ) ( ON ?auto_501283 ?auto_501284 ) ( ON ?auto_501282 ?auto_501283 ) ( ON ?auto_501281 ?auto_501282 ) ( ON ?auto_501280 ?auto_501281 ) ( ON ?auto_501279 ?auto_501280 ) ( ON ?auto_501278 ?auto_501279 ) ( ON ?auto_501277 ?auto_501278 ) ( ON ?auto_501276 ?auto_501277 ) ( CLEAR ?auto_501274 ) ( ON ?auto_501275 ?auto_501276 ) ( CLEAR ?auto_501275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_501272 ?auto_501273 ?auto_501274 ?auto_501275 )
      ( MAKE-15PILE ?auto_501272 ?auto_501273 ?auto_501274 ?auto_501275 ?auto_501276 ?auto_501277 ?auto_501278 ?auto_501279 ?auto_501280 ?auto_501281 ?auto_501282 ?auto_501283 ?auto_501284 ?auto_501285 ?auto_501286 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501334 - BLOCK
      ?auto_501335 - BLOCK
      ?auto_501336 - BLOCK
      ?auto_501337 - BLOCK
      ?auto_501338 - BLOCK
      ?auto_501339 - BLOCK
      ?auto_501340 - BLOCK
      ?auto_501341 - BLOCK
      ?auto_501342 - BLOCK
      ?auto_501343 - BLOCK
      ?auto_501344 - BLOCK
      ?auto_501345 - BLOCK
      ?auto_501346 - BLOCK
      ?auto_501347 - BLOCK
      ?auto_501348 - BLOCK
    )
    :vars
    (
      ?auto_501349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501348 ?auto_501349 ) ( ON-TABLE ?auto_501334 ) ( ON ?auto_501335 ?auto_501334 ) ( not ( = ?auto_501334 ?auto_501335 ) ) ( not ( = ?auto_501334 ?auto_501336 ) ) ( not ( = ?auto_501334 ?auto_501337 ) ) ( not ( = ?auto_501334 ?auto_501338 ) ) ( not ( = ?auto_501334 ?auto_501339 ) ) ( not ( = ?auto_501334 ?auto_501340 ) ) ( not ( = ?auto_501334 ?auto_501341 ) ) ( not ( = ?auto_501334 ?auto_501342 ) ) ( not ( = ?auto_501334 ?auto_501343 ) ) ( not ( = ?auto_501334 ?auto_501344 ) ) ( not ( = ?auto_501334 ?auto_501345 ) ) ( not ( = ?auto_501334 ?auto_501346 ) ) ( not ( = ?auto_501334 ?auto_501347 ) ) ( not ( = ?auto_501334 ?auto_501348 ) ) ( not ( = ?auto_501334 ?auto_501349 ) ) ( not ( = ?auto_501335 ?auto_501336 ) ) ( not ( = ?auto_501335 ?auto_501337 ) ) ( not ( = ?auto_501335 ?auto_501338 ) ) ( not ( = ?auto_501335 ?auto_501339 ) ) ( not ( = ?auto_501335 ?auto_501340 ) ) ( not ( = ?auto_501335 ?auto_501341 ) ) ( not ( = ?auto_501335 ?auto_501342 ) ) ( not ( = ?auto_501335 ?auto_501343 ) ) ( not ( = ?auto_501335 ?auto_501344 ) ) ( not ( = ?auto_501335 ?auto_501345 ) ) ( not ( = ?auto_501335 ?auto_501346 ) ) ( not ( = ?auto_501335 ?auto_501347 ) ) ( not ( = ?auto_501335 ?auto_501348 ) ) ( not ( = ?auto_501335 ?auto_501349 ) ) ( not ( = ?auto_501336 ?auto_501337 ) ) ( not ( = ?auto_501336 ?auto_501338 ) ) ( not ( = ?auto_501336 ?auto_501339 ) ) ( not ( = ?auto_501336 ?auto_501340 ) ) ( not ( = ?auto_501336 ?auto_501341 ) ) ( not ( = ?auto_501336 ?auto_501342 ) ) ( not ( = ?auto_501336 ?auto_501343 ) ) ( not ( = ?auto_501336 ?auto_501344 ) ) ( not ( = ?auto_501336 ?auto_501345 ) ) ( not ( = ?auto_501336 ?auto_501346 ) ) ( not ( = ?auto_501336 ?auto_501347 ) ) ( not ( = ?auto_501336 ?auto_501348 ) ) ( not ( = ?auto_501336 ?auto_501349 ) ) ( not ( = ?auto_501337 ?auto_501338 ) ) ( not ( = ?auto_501337 ?auto_501339 ) ) ( not ( = ?auto_501337 ?auto_501340 ) ) ( not ( = ?auto_501337 ?auto_501341 ) ) ( not ( = ?auto_501337 ?auto_501342 ) ) ( not ( = ?auto_501337 ?auto_501343 ) ) ( not ( = ?auto_501337 ?auto_501344 ) ) ( not ( = ?auto_501337 ?auto_501345 ) ) ( not ( = ?auto_501337 ?auto_501346 ) ) ( not ( = ?auto_501337 ?auto_501347 ) ) ( not ( = ?auto_501337 ?auto_501348 ) ) ( not ( = ?auto_501337 ?auto_501349 ) ) ( not ( = ?auto_501338 ?auto_501339 ) ) ( not ( = ?auto_501338 ?auto_501340 ) ) ( not ( = ?auto_501338 ?auto_501341 ) ) ( not ( = ?auto_501338 ?auto_501342 ) ) ( not ( = ?auto_501338 ?auto_501343 ) ) ( not ( = ?auto_501338 ?auto_501344 ) ) ( not ( = ?auto_501338 ?auto_501345 ) ) ( not ( = ?auto_501338 ?auto_501346 ) ) ( not ( = ?auto_501338 ?auto_501347 ) ) ( not ( = ?auto_501338 ?auto_501348 ) ) ( not ( = ?auto_501338 ?auto_501349 ) ) ( not ( = ?auto_501339 ?auto_501340 ) ) ( not ( = ?auto_501339 ?auto_501341 ) ) ( not ( = ?auto_501339 ?auto_501342 ) ) ( not ( = ?auto_501339 ?auto_501343 ) ) ( not ( = ?auto_501339 ?auto_501344 ) ) ( not ( = ?auto_501339 ?auto_501345 ) ) ( not ( = ?auto_501339 ?auto_501346 ) ) ( not ( = ?auto_501339 ?auto_501347 ) ) ( not ( = ?auto_501339 ?auto_501348 ) ) ( not ( = ?auto_501339 ?auto_501349 ) ) ( not ( = ?auto_501340 ?auto_501341 ) ) ( not ( = ?auto_501340 ?auto_501342 ) ) ( not ( = ?auto_501340 ?auto_501343 ) ) ( not ( = ?auto_501340 ?auto_501344 ) ) ( not ( = ?auto_501340 ?auto_501345 ) ) ( not ( = ?auto_501340 ?auto_501346 ) ) ( not ( = ?auto_501340 ?auto_501347 ) ) ( not ( = ?auto_501340 ?auto_501348 ) ) ( not ( = ?auto_501340 ?auto_501349 ) ) ( not ( = ?auto_501341 ?auto_501342 ) ) ( not ( = ?auto_501341 ?auto_501343 ) ) ( not ( = ?auto_501341 ?auto_501344 ) ) ( not ( = ?auto_501341 ?auto_501345 ) ) ( not ( = ?auto_501341 ?auto_501346 ) ) ( not ( = ?auto_501341 ?auto_501347 ) ) ( not ( = ?auto_501341 ?auto_501348 ) ) ( not ( = ?auto_501341 ?auto_501349 ) ) ( not ( = ?auto_501342 ?auto_501343 ) ) ( not ( = ?auto_501342 ?auto_501344 ) ) ( not ( = ?auto_501342 ?auto_501345 ) ) ( not ( = ?auto_501342 ?auto_501346 ) ) ( not ( = ?auto_501342 ?auto_501347 ) ) ( not ( = ?auto_501342 ?auto_501348 ) ) ( not ( = ?auto_501342 ?auto_501349 ) ) ( not ( = ?auto_501343 ?auto_501344 ) ) ( not ( = ?auto_501343 ?auto_501345 ) ) ( not ( = ?auto_501343 ?auto_501346 ) ) ( not ( = ?auto_501343 ?auto_501347 ) ) ( not ( = ?auto_501343 ?auto_501348 ) ) ( not ( = ?auto_501343 ?auto_501349 ) ) ( not ( = ?auto_501344 ?auto_501345 ) ) ( not ( = ?auto_501344 ?auto_501346 ) ) ( not ( = ?auto_501344 ?auto_501347 ) ) ( not ( = ?auto_501344 ?auto_501348 ) ) ( not ( = ?auto_501344 ?auto_501349 ) ) ( not ( = ?auto_501345 ?auto_501346 ) ) ( not ( = ?auto_501345 ?auto_501347 ) ) ( not ( = ?auto_501345 ?auto_501348 ) ) ( not ( = ?auto_501345 ?auto_501349 ) ) ( not ( = ?auto_501346 ?auto_501347 ) ) ( not ( = ?auto_501346 ?auto_501348 ) ) ( not ( = ?auto_501346 ?auto_501349 ) ) ( not ( = ?auto_501347 ?auto_501348 ) ) ( not ( = ?auto_501347 ?auto_501349 ) ) ( not ( = ?auto_501348 ?auto_501349 ) ) ( ON ?auto_501347 ?auto_501348 ) ( ON ?auto_501346 ?auto_501347 ) ( ON ?auto_501345 ?auto_501346 ) ( ON ?auto_501344 ?auto_501345 ) ( ON ?auto_501343 ?auto_501344 ) ( ON ?auto_501342 ?auto_501343 ) ( ON ?auto_501341 ?auto_501342 ) ( ON ?auto_501340 ?auto_501341 ) ( ON ?auto_501339 ?auto_501340 ) ( ON ?auto_501338 ?auto_501339 ) ( ON ?auto_501337 ?auto_501338 ) ( CLEAR ?auto_501335 ) ( ON ?auto_501336 ?auto_501337 ) ( CLEAR ?auto_501336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_501334 ?auto_501335 ?auto_501336 )
      ( MAKE-15PILE ?auto_501334 ?auto_501335 ?auto_501336 ?auto_501337 ?auto_501338 ?auto_501339 ?auto_501340 ?auto_501341 ?auto_501342 ?auto_501343 ?auto_501344 ?auto_501345 ?auto_501346 ?auto_501347 ?auto_501348 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501396 - BLOCK
      ?auto_501397 - BLOCK
      ?auto_501398 - BLOCK
      ?auto_501399 - BLOCK
      ?auto_501400 - BLOCK
      ?auto_501401 - BLOCK
      ?auto_501402 - BLOCK
      ?auto_501403 - BLOCK
      ?auto_501404 - BLOCK
      ?auto_501405 - BLOCK
      ?auto_501406 - BLOCK
      ?auto_501407 - BLOCK
      ?auto_501408 - BLOCK
      ?auto_501409 - BLOCK
      ?auto_501410 - BLOCK
    )
    :vars
    (
      ?auto_501411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501410 ?auto_501411 ) ( ON-TABLE ?auto_501396 ) ( not ( = ?auto_501396 ?auto_501397 ) ) ( not ( = ?auto_501396 ?auto_501398 ) ) ( not ( = ?auto_501396 ?auto_501399 ) ) ( not ( = ?auto_501396 ?auto_501400 ) ) ( not ( = ?auto_501396 ?auto_501401 ) ) ( not ( = ?auto_501396 ?auto_501402 ) ) ( not ( = ?auto_501396 ?auto_501403 ) ) ( not ( = ?auto_501396 ?auto_501404 ) ) ( not ( = ?auto_501396 ?auto_501405 ) ) ( not ( = ?auto_501396 ?auto_501406 ) ) ( not ( = ?auto_501396 ?auto_501407 ) ) ( not ( = ?auto_501396 ?auto_501408 ) ) ( not ( = ?auto_501396 ?auto_501409 ) ) ( not ( = ?auto_501396 ?auto_501410 ) ) ( not ( = ?auto_501396 ?auto_501411 ) ) ( not ( = ?auto_501397 ?auto_501398 ) ) ( not ( = ?auto_501397 ?auto_501399 ) ) ( not ( = ?auto_501397 ?auto_501400 ) ) ( not ( = ?auto_501397 ?auto_501401 ) ) ( not ( = ?auto_501397 ?auto_501402 ) ) ( not ( = ?auto_501397 ?auto_501403 ) ) ( not ( = ?auto_501397 ?auto_501404 ) ) ( not ( = ?auto_501397 ?auto_501405 ) ) ( not ( = ?auto_501397 ?auto_501406 ) ) ( not ( = ?auto_501397 ?auto_501407 ) ) ( not ( = ?auto_501397 ?auto_501408 ) ) ( not ( = ?auto_501397 ?auto_501409 ) ) ( not ( = ?auto_501397 ?auto_501410 ) ) ( not ( = ?auto_501397 ?auto_501411 ) ) ( not ( = ?auto_501398 ?auto_501399 ) ) ( not ( = ?auto_501398 ?auto_501400 ) ) ( not ( = ?auto_501398 ?auto_501401 ) ) ( not ( = ?auto_501398 ?auto_501402 ) ) ( not ( = ?auto_501398 ?auto_501403 ) ) ( not ( = ?auto_501398 ?auto_501404 ) ) ( not ( = ?auto_501398 ?auto_501405 ) ) ( not ( = ?auto_501398 ?auto_501406 ) ) ( not ( = ?auto_501398 ?auto_501407 ) ) ( not ( = ?auto_501398 ?auto_501408 ) ) ( not ( = ?auto_501398 ?auto_501409 ) ) ( not ( = ?auto_501398 ?auto_501410 ) ) ( not ( = ?auto_501398 ?auto_501411 ) ) ( not ( = ?auto_501399 ?auto_501400 ) ) ( not ( = ?auto_501399 ?auto_501401 ) ) ( not ( = ?auto_501399 ?auto_501402 ) ) ( not ( = ?auto_501399 ?auto_501403 ) ) ( not ( = ?auto_501399 ?auto_501404 ) ) ( not ( = ?auto_501399 ?auto_501405 ) ) ( not ( = ?auto_501399 ?auto_501406 ) ) ( not ( = ?auto_501399 ?auto_501407 ) ) ( not ( = ?auto_501399 ?auto_501408 ) ) ( not ( = ?auto_501399 ?auto_501409 ) ) ( not ( = ?auto_501399 ?auto_501410 ) ) ( not ( = ?auto_501399 ?auto_501411 ) ) ( not ( = ?auto_501400 ?auto_501401 ) ) ( not ( = ?auto_501400 ?auto_501402 ) ) ( not ( = ?auto_501400 ?auto_501403 ) ) ( not ( = ?auto_501400 ?auto_501404 ) ) ( not ( = ?auto_501400 ?auto_501405 ) ) ( not ( = ?auto_501400 ?auto_501406 ) ) ( not ( = ?auto_501400 ?auto_501407 ) ) ( not ( = ?auto_501400 ?auto_501408 ) ) ( not ( = ?auto_501400 ?auto_501409 ) ) ( not ( = ?auto_501400 ?auto_501410 ) ) ( not ( = ?auto_501400 ?auto_501411 ) ) ( not ( = ?auto_501401 ?auto_501402 ) ) ( not ( = ?auto_501401 ?auto_501403 ) ) ( not ( = ?auto_501401 ?auto_501404 ) ) ( not ( = ?auto_501401 ?auto_501405 ) ) ( not ( = ?auto_501401 ?auto_501406 ) ) ( not ( = ?auto_501401 ?auto_501407 ) ) ( not ( = ?auto_501401 ?auto_501408 ) ) ( not ( = ?auto_501401 ?auto_501409 ) ) ( not ( = ?auto_501401 ?auto_501410 ) ) ( not ( = ?auto_501401 ?auto_501411 ) ) ( not ( = ?auto_501402 ?auto_501403 ) ) ( not ( = ?auto_501402 ?auto_501404 ) ) ( not ( = ?auto_501402 ?auto_501405 ) ) ( not ( = ?auto_501402 ?auto_501406 ) ) ( not ( = ?auto_501402 ?auto_501407 ) ) ( not ( = ?auto_501402 ?auto_501408 ) ) ( not ( = ?auto_501402 ?auto_501409 ) ) ( not ( = ?auto_501402 ?auto_501410 ) ) ( not ( = ?auto_501402 ?auto_501411 ) ) ( not ( = ?auto_501403 ?auto_501404 ) ) ( not ( = ?auto_501403 ?auto_501405 ) ) ( not ( = ?auto_501403 ?auto_501406 ) ) ( not ( = ?auto_501403 ?auto_501407 ) ) ( not ( = ?auto_501403 ?auto_501408 ) ) ( not ( = ?auto_501403 ?auto_501409 ) ) ( not ( = ?auto_501403 ?auto_501410 ) ) ( not ( = ?auto_501403 ?auto_501411 ) ) ( not ( = ?auto_501404 ?auto_501405 ) ) ( not ( = ?auto_501404 ?auto_501406 ) ) ( not ( = ?auto_501404 ?auto_501407 ) ) ( not ( = ?auto_501404 ?auto_501408 ) ) ( not ( = ?auto_501404 ?auto_501409 ) ) ( not ( = ?auto_501404 ?auto_501410 ) ) ( not ( = ?auto_501404 ?auto_501411 ) ) ( not ( = ?auto_501405 ?auto_501406 ) ) ( not ( = ?auto_501405 ?auto_501407 ) ) ( not ( = ?auto_501405 ?auto_501408 ) ) ( not ( = ?auto_501405 ?auto_501409 ) ) ( not ( = ?auto_501405 ?auto_501410 ) ) ( not ( = ?auto_501405 ?auto_501411 ) ) ( not ( = ?auto_501406 ?auto_501407 ) ) ( not ( = ?auto_501406 ?auto_501408 ) ) ( not ( = ?auto_501406 ?auto_501409 ) ) ( not ( = ?auto_501406 ?auto_501410 ) ) ( not ( = ?auto_501406 ?auto_501411 ) ) ( not ( = ?auto_501407 ?auto_501408 ) ) ( not ( = ?auto_501407 ?auto_501409 ) ) ( not ( = ?auto_501407 ?auto_501410 ) ) ( not ( = ?auto_501407 ?auto_501411 ) ) ( not ( = ?auto_501408 ?auto_501409 ) ) ( not ( = ?auto_501408 ?auto_501410 ) ) ( not ( = ?auto_501408 ?auto_501411 ) ) ( not ( = ?auto_501409 ?auto_501410 ) ) ( not ( = ?auto_501409 ?auto_501411 ) ) ( not ( = ?auto_501410 ?auto_501411 ) ) ( ON ?auto_501409 ?auto_501410 ) ( ON ?auto_501408 ?auto_501409 ) ( ON ?auto_501407 ?auto_501408 ) ( ON ?auto_501406 ?auto_501407 ) ( ON ?auto_501405 ?auto_501406 ) ( ON ?auto_501404 ?auto_501405 ) ( ON ?auto_501403 ?auto_501404 ) ( ON ?auto_501402 ?auto_501403 ) ( ON ?auto_501401 ?auto_501402 ) ( ON ?auto_501400 ?auto_501401 ) ( ON ?auto_501399 ?auto_501400 ) ( ON ?auto_501398 ?auto_501399 ) ( CLEAR ?auto_501396 ) ( ON ?auto_501397 ?auto_501398 ) ( CLEAR ?auto_501397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_501396 ?auto_501397 )
      ( MAKE-15PILE ?auto_501396 ?auto_501397 ?auto_501398 ?auto_501399 ?auto_501400 ?auto_501401 ?auto_501402 ?auto_501403 ?auto_501404 ?auto_501405 ?auto_501406 ?auto_501407 ?auto_501408 ?auto_501409 ?auto_501410 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_501458 - BLOCK
      ?auto_501459 - BLOCK
      ?auto_501460 - BLOCK
      ?auto_501461 - BLOCK
      ?auto_501462 - BLOCK
      ?auto_501463 - BLOCK
      ?auto_501464 - BLOCK
      ?auto_501465 - BLOCK
      ?auto_501466 - BLOCK
      ?auto_501467 - BLOCK
      ?auto_501468 - BLOCK
      ?auto_501469 - BLOCK
      ?auto_501470 - BLOCK
      ?auto_501471 - BLOCK
      ?auto_501472 - BLOCK
    )
    :vars
    (
      ?auto_501473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501472 ?auto_501473 ) ( not ( = ?auto_501458 ?auto_501459 ) ) ( not ( = ?auto_501458 ?auto_501460 ) ) ( not ( = ?auto_501458 ?auto_501461 ) ) ( not ( = ?auto_501458 ?auto_501462 ) ) ( not ( = ?auto_501458 ?auto_501463 ) ) ( not ( = ?auto_501458 ?auto_501464 ) ) ( not ( = ?auto_501458 ?auto_501465 ) ) ( not ( = ?auto_501458 ?auto_501466 ) ) ( not ( = ?auto_501458 ?auto_501467 ) ) ( not ( = ?auto_501458 ?auto_501468 ) ) ( not ( = ?auto_501458 ?auto_501469 ) ) ( not ( = ?auto_501458 ?auto_501470 ) ) ( not ( = ?auto_501458 ?auto_501471 ) ) ( not ( = ?auto_501458 ?auto_501472 ) ) ( not ( = ?auto_501458 ?auto_501473 ) ) ( not ( = ?auto_501459 ?auto_501460 ) ) ( not ( = ?auto_501459 ?auto_501461 ) ) ( not ( = ?auto_501459 ?auto_501462 ) ) ( not ( = ?auto_501459 ?auto_501463 ) ) ( not ( = ?auto_501459 ?auto_501464 ) ) ( not ( = ?auto_501459 ?auto_501465 ) ) ( not ( = ?auto_501459 ?auto_501466 ) ) ( not ( = ?auto_501459 ?auto_501467 ) ) ( not ( = ?auto_501459 ?auto_501468 ) ) ( not ( = ?auto_501459 ?auto_501469 ) ) ( not ( = ?auto_501459 ?auto_501470 ) ) ( not ( = ?auto_501459 ?auto_501471 ) ) ( not ( = ?auto_501459 ?auto_501472 ) ) ( not ( = ?auto_501459 ?auto_501473 ) ) ( not ( = ?auto_501460 ?auto_501461 ) ) ( not ( = ?auto_501460 ?auto_501462 ) ) ( not ( = ?auto_501460 ?auto_501463 ) ) ( not ( = ?auto_501460 ?auto_501464 ) ) ( not ( = ?auto_501460 ?auto_501465 ) ) ( not ( = ?auto_501460 ?auto_501466 ) ) ( not ( = ?auto_501460 ?auto_501467 ) ) ( not ( = ?auto_501460 ?auto_501468 ) ) ( not ( = ?auto_501460 ?auto_501469 ) ) ( not ( = ?auto_501460 ?auto_501470 ) ) ( not ( = ?auto_501460 ?auto_501471 ) ) ( not ( = ?auto_501460 ?auto_501472 ) ) ( not ( = ?auto_501460 ?auto_501473 ) ) ( not ( = ?auto_501461 ?auto_501462 ) ) ( not ( = ?auto_501461 ?auto_501463 ) ) ( not ( = ?auto_501461 ?auto_501464 ) ) ( not ( = ?auto_501461 ?auto_501465 ) ) ( not ( = ?auto_501461 ?auto_501466 ) ) ( not ( = ?auto_501461 ?auto_501467 ) ) ( not ( = ?auto_501461 ?auto_501468 ) ) ( not ( = ?auto_501461 ?auto_501469 ) ) ( not ( = ?auto_501461 ?auto_501470 ) ) ( not ( = ?auto_501461 ?auto_501471 ) ) ( not ( = ?auto_501461 ?auto_501472 ) ) ( not ( = ?auto_501461 ?auto_501473 ) ) ( not ( = ?auto_501462 ?auto_501463 ) ) ( not ( = ?auto_501462 ?auto_501464 ) ) ( not ( = ?auto_501462 ?auto_501465 ) ) ( not ( = ?auto_501462 ?auto_501466 ) ) ( not ( = ?auto_501462 ?auto_501467 ) ) ( not ( = ?auto_501462 ?auto_501468 ) ) ( not ( = ?auto_501462 ?auto_501469 ) ) ( not ( = ?auto_501462 ?auto_501470 ) ) ( not ( = ?auto_501462 ?auto_501471 ) ) ( not ( = ?auto_501462 ?auto_501472 ) ) ( not ( = ?auto_501462 ?auto_501473 ) ) ( not ( = ?auto_501463 ?auto_501464 ) ) ( not ( = ?auto_501463 ?auto_501465 ) ) ( not ( = ?auto_501463 ?auto_501466 ) ) ( not ( = ?auto_501463 ?auto_501467 ) ) ( not ( = ?auto_501463 ?auto_501468 ) ) ( not ( = ?auto_501463 ?auto_501469 ) ) ( not ( = ?auto_501463 ?auto_501470 ) ) ( not ( = ?auto_501463 ?auto_501471 ) ) ( not ( = ?auto_501463 ?auto_501472 ) ) ( not ( = ?auto_501463 ?auto_501473 ) ) ( not ( = ?auto_501464 ?auto_501465 ) ) ( not ( = ?auto_501464 ?auto_501466 ) ) ( not ( = ?auto_501464 ?auto_501467 ) ) ( not ( = ?auto_501464 ?auto_501468 ) ) ( not ( = ?auto_501464 ?auto_501469 ) ) ( not ( = ?auto_501464 ?auto_501470 ) ) ( not ( = ?auto_501464 ?auto_501471 ) ) ( not ( = ?auto_501464 ?auto_501472 ) ) ( not ( = ?auto_501464 ?auto_501473 ) ) ( not ( = ?auto_501465 ?auto_501466 ) ) ( not ( = ?auto_501465 ?auto_501467 ) ) ( not ( = ?auto_501465 ?auto_501468 ) ) ( not ( = ?auto_501465 ?auto_501469 ) ) ( not ( = ?auto_501465 ?auto_501470 ) ) ( not ( = ?auto_501465 ?auto_501471 ) ) ( not ( = ?auto_501465 ?auto_501472 ) ) ( not ( = ?auto_501465 ?auto_501473 ) ) ( not ( = ?auto_501466 ?auto_501467 ) ) ( not ( = ?auto_501466 ?auto_501468 ) ) ( not ( = ?auto_501466 ?auto_501469 ) ) ( not ( = ?auto_501466 ?auto_501470 ) ) ( not ( = ?auto_501466 ?auto_501471 ) ) ( not ( = ?auto_501466 ?auto_501472 ) ) ( not ( = ?auto_501466 ?auto_501473 ) ) ( not ( = ?auto_501467 ?auto_501468 ) ) ( not ( = ?auto_501467 ?auto_501469 ) ) ( not ( = ?auto_501467 ?auto_501470 ) ) ( not ( = ?auto_501467 ?auto_501471 ) ) ( not ( = ?auto_501467 ?auto_501472 ) ) ( not ( = ?auto_501467 ?auto_501473 ) ) ( not ( = ?auto_501468 ?auto_501469 ) ) ( not ( = ?auto_501468 ?auto_501470 ) ) ( not ( = ?auto_501468 ?auto_501471 ) ) ( not ( = ?auto_501468 ?auto_501472 ) ) ( not ( = ?auto_501468 ?auto_501473 ) ) ( not ( = ?auto_501469 ?auto_501470 ) ) ( not ( = ?auto_501469 ?auto_501471 ) ) ( not ( = ?auto_501469 ?auto_501472 ) ) ( not ( = ?auto_501469 ?auto_501473 ) ) ( not ( = ?auto_501470 ?auto_501471 ) ) ( not ( = ?auto_501470 ?auto_501472 ) ) ( not ( = ?auto_501470 ?auto_501473 ) ) ( not ( = ?auto_501471 ?auto_501472 ) ) ( not ( = ?auto_501471 ?auto_501473 ) ) ( not ( = ?auto_501472 ?auto_501473 ) ) ( ON ?auto_501471 ?auto_501472 ) ( ON ?auto_501470 ?auto_501471 ) ( ON ?auto_501469 ?auto_501470 ) ( ON ?auto_501468 ?auto_501469 ) ( ON ?auto_501467 ?auto_501468 ) ( ON ?auto_501466 ?auto_501467 ) ( ON ?auto_501465 ?auto_501466 ) ( ON ?auto_501464 ?auto_501465 ) ( ON ?auto_501463 ?auto_501464 ) ( ON ?auto_501462 ?auto_501463 ) ( ON ?auto_501461 ?auto_501462 ) ( ON ?auto_501460 ?auto_501461 ) ( ON ?auto_501459 ?auto_501460 ) ( ON ?auto_501458 ?auto_501459 ) ( CLEAR ?auto_501458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_501458 )
      ( MAKE-15PILE ?auto_501458 ?auto_501459 ?auto_501460 ?auto_501461 ?auto_501462 ?auto_501463 ?auto_501464 ?auto_501465 ?auto_501466 ?auto_501467 ?auto_501468 ?auto_501469 ?auto_501470 ?auto_501471 ?auto_501472 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501521 - BLOCK
      ?auto_501522 - BLOCK
      ?auto_501523 - BLOCK
      ?auto_501524 - BLOCK
      ?auto_501525 - BLOCK
      ?auto_501526 - BLOCK
      ?auto_501527 - BLOCK
      ?auto_501528 - BLOCK
      ?auto_501529 - BLOCK
      ?auto_501530 - BLOCK
      ?auto_501531 - BLOCK
      ?auto_501532 - BLOCK
      ?auto_501533 - BLOCK
      ?auto_501534 - BLOCK
      ?auto_501535 - BLOCK
      ?auto_501536 - BLOCK
    )
    :vars
    (
      ?auto_501537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_501535 ) ( ON ?auto_501536 ?auto_501537 ) ( CLEAR ?auto_501536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_501521 ) ( ON ?auto_501522 ?auto_501521 ) ( ON ?auto_501523 ?auto_501522 ) ( ON ?auto_501524 ?auto_501523 ) ( ON ?auto_501525 ?auto_501524 ) ( ON ?auto_501526 ?auto_501525 ) ( ON ?auto_501527 ?auto_501526 ) ( ON ?auto_501528 ?auto_501527 ) ( ON ?auto_501529 ?auto_501528 ) ( ON ?auto_501530 ?auto_501529 ) ( ON ?auto_501531 ?auto_501530 ) ( ON ?auto_501532 ?auto_501531 ) ( ON ?auto_501533 ?auto_501532 ) ( ON ?auto_501534 ?auto_501533 ) ( ON ?auto_501535 ?auto_501534 ) ( not ( = ?auto_501521 ?auto_501522 ) ) ( not ( = ?auto_501521 ?auto_501523 ) ) ( not ( = ?auto_501521 ?auto_501524 ) ) ( not ( = ?auto_501521 ?auto_501525 ) ) ( not ( = ?auto_501521 ?auto_501526 ) ) ( not ( = ?auto_501521 ?auto_501527 ) ) ( not ( = ?auto_501521 ?auto_501528 ) ) ( not ( = ?auto_501521 ?auto_501529 ) ) ( not ( = ?auto_501521 ?auto_501530 ) ) ( not ( = ?auto_501521 ?auto_501531 ) ) ( not ( = ?auto_501521 ?auto_501532 ) ) ( not ( = ?auto_501521 ?auto_501533 ) ) ( not ( = ?auto_501521 ?auto_501534 ) ) ( not ( = ?auto_501521 ?auto_501535 ) ) ( not ( = ?auto_501521 ?auto_501536 ) ) ( not ( = ?auto_501521 ?auto_501537 ) ) ( not ( = ?auto_501522 ?auto_501523 ) ) ( not ( = ?auto_501522 ?auto_501524 ) ) ( not ( = ?auto_501522 ?auto_501525 ) ) ( not ( = ?auto_501522 ?auto_501526 ) ) ( not ( = ?auto_501522 ?auto_501527 ) ) ( not ( = ?auto_501522 ?auto_501528 ) ) ( not ( = ?auto_501522 ?auto_501529 ) ) ( not ( = ?auto_501522 ?auto_501530 ) ) ( not ( = ?auto_501522 ?auto_501531 ) ) ( not ( = ?auto_501522 ?auto_501532 ) ) ( not ( = ?auto_501522 ?auto_501533 ) ) ( not ( = ?auto_501522 ?auto_501534 ) ) ( not ( = ?auto_501522 ?auto_501535 ) ) ( not ( = ?auto_501522 ?auto_501536 ) ) ( not ( = ?auto_501522 ?auto_501537 ) ) ( not ( = ?auto_501523 ?auto_501524 ) ) ( not ( = ?auto_501523 ?auto_501525 ) ) ( not ( = ?auto_501523 ?auto_501526 ) ) ( not ( = ?auto_501523 ?auto_501527 ) ) ( not ( = ?auto_501523 ?auto_501528 ) ) ( not ( = ?auto_501523 ?auto_501529 ) ) ( not ( = ?auto_501523 ?auto_501530 ) ) ( not ( = ?auto_501523 ?auto_501531 ) ) ( not ( = ?auto_501523 ?auto_501532 ) ) ( not ( = ?auto_501523 ?auto_501533 ) ) ( not ( = ?auto_501523 ?auto_501534 ) ) ( not ( = ?auto_501523 ?auto_501535 ) ) ( not ( = ?auto_501523 ?auto_501536 ) ) ( not ( = ?auto_501523 ?auto_501537 ) ) ( not ( = ?auto_501524 ?auto_501525 ) ) ( not ( = ?auto_501524 ?auto_501526 ) ) ( not ( = ?auto_501524 ?auto_501527 ) ) ( not ( = ?auto_501524 ?auto_501528 ) ) ( not ( = ?auto_501524 ?auto_501529 ) ) ( not ( = ?auto_501524 ?auto_501530 ) ) ( not ( = ?auto_501524 ?auto_501531 ) ) ( not ( = ?auto_501524 ?auto_501532 ) ) ( not ( = ?auto_501524 ?auto_501533 ) ) ( not ( = ?auto_501524 ?auto_501534 ) ) ( not ( = ?auto_501524 ?auto_501535 ) ) ( not ( = ?auto_501524 ?auto_501536 ) ) ( not ( = ?auto_501524 ?auto_501537 ) ) ( not ( = ?auto_501525 ?auto_501526 ) ) ( not ( = ?auto_501525 ?auto_501527 ) ) ( not ( = ?auto_501525 ?auto_501528 ) ) ( not ( = ?auto_501525 ?auto_501529 ) ) ( not ( = ?auto_501525 ?auto_501530 ) ) ( not ( = ?auto_501525 ?auto_501531 ) ) ( not ( = ?auto_501525 ?auto_501532 ) ) ( not ( = ?auto_501525 ?auto_501533 ) ) ( not ( = ?auto_501525 ?auto_501534 ) ) ( not ( = ?auto_501525 ?auto_501535 ) ) ( not ( = ?auto_501525 ?auto_501536 ) ) ( not ( = ?auto_501525 ?auto_501537 ) ) ( not ( = ?auto_501526 ?auto_501527 ) ) ( not ( = ?auto_501526 ?auto_501528 ) ) ( not ( = ?auto_501526 ?auto_501529 ) ) ( not ( = ?auto_501526 ?auto_501530 ) ) ( not ( = ?auto_501526 ?auto_501531 ) ) ( not ( = ?auto_501526 ?auto_501532 ) ) ( not ( = ?auto_501526 ?auto_501533 ) ) ( not ( = ?auto_501526 ?auto_501534 ) ) ( not ( = ?auto_501526 ?auto_501535 ) ) ( not ( = ?auto_501526 ?auto_501536 ) ) ( not ( = ?auto_501526 ?auto_501537 ) ) ( not ( = ?auto_501527 ?auto_501528 ) ) ( not ( = ?auto_501527 ?auto_501529 ) ) ( not ( = ?auto_501527 ?auto_501530 ) ) ( not ( = ?auto_501527 ?auto_501531 ) ) ( not ( = ?auto_501527 ?auto_501532 ) ) ( not ( = ?auto_501527 ?auto_501533 ) ) ( not ( = ?auto_501527 ?auto_501534 ) ) ( not ( = ?auto_501527 ?auto_501535 ) ) ( not ( = ?auto_501527 ?auto_501536 ) ) ( not ( = ?auto_501527 ?auto_501537 ) ) ( not ( = ?auto_501528 ?auto_501529 ) ) ( not ( = ?auto_501528 ?auto_501530 ) ) ( not ( = ?auto_501528 ?auto_501531 ) ) ( not ( = ?auto_501528 ?auto_501532 ) ) ( not ( = ?auto_501528 ?auto_501533 ) ) ( not ( = ?auto_501528 ?auto_501534 ) ) ( not ( = ?auto_501528 ?auto_501535 ) ) ( not ( = ?auto_501528 ?auto_501536 ) ) ( not ( = ?auto_501528 ?auto_501537 ) ) ( not ( = ?auto_501529 ?auto_501530 ) ) ( not ( = ?auto_501529 ?auto_501531 ) ) ( not ( = ?auto_501529 ?auto_501532 ) ) ( not ( = ?auto_501529 ?auto_501533 ) ) ( not ( = ?auto_501529 ?auto_501534 ) ) ( not ( = ?auto_501529 ?auto_501535 ) ) ( not ( = ?auto_501529 ?auto_501536 ) ) ( not ( = ?auto_501529 ?auto_501537 ) ) ( not ( = ?auto_501530 ?auto_501531 ) ) ( not ( = ?auto_501530 ?auto_501532 ) ) ( not ( = ?auto_501530 ?auto_501533 ) ) ( not ( = ?auto_501530 ?auto_501534 ) ) ( not ( = ?auto_501530 ?auto_501535 ) ) ( not ( = ?auto_501530 ?auto_501536 ) ) ( not ( = ?auto_501530 ?auto_501537 ) ) ( not ( = ?auto_501531 ?auto_501532 ) ) ( not ( = ?auto_501531 ?auto_501533 ) ) ( not ( = ?auto_501531 ?auto_501534 ) ) ( not ( = ?auto_501531 ?auto_501535 ) ) ( not ( = ?auto_501531 ?auto_501536 ) ) ( not ( = ?auto_501531 ?auto_501537 ) ) ( not ( = ?auto_501532 ?auto_501533 ) ) ( not ( = ?auto_501532 ?auto_501534 ) ) ( not ( = ?auto_501532 ?auto_501535 ) ) ( not ( = ?auto_501532 ?auto_501536 ) ) ( not ( = ?auto_501532 ?auto_501537 ) ) ( not ( = ?auto_501533 ?auto_501534 ) ) ( not ( = ?auto_501533 ?auto_501535 ) ) ( not ( = ?auto_501533 ?auto_501536 ) ) ( not ( = ?auto_501533 ?auto_501537 ) ) ( not ( = ?auto_501534 ?auto_501535 ) ) ( not ( = ?auto_501534 ?auto_501536 ) ) ( not ( = ?auto_501534 ?auto_501537 ) ) ( not ( = ?auto_501535 ?auto_501536 ) ) ( not ( = ?auto_501535 ?auto_501537 ) ) ( not ( = ?auto_501536 ?auto_501537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_501536 ?auto_501537 )
      ( !STACK ?auto_501536 ?auto_501535 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501554 - BLOCK
      ?auto_501555 - BLOCK
      ?auto_501556 - BLOCK
      ?auto_501557 - BLOCK
      ?auto_501558 - BLOCK
      ?auto_501559 - BLOCK
      ?auto_501560 - BLOCK
      ?auto_501561 - BLOCK
      ?auto_501562 - BLOCK
      ?auto_501563 - BLOCK
      ?auto_501564 - BLOCK
      ?auto_501565 - BLOCK
      ?auto_501566 - BLOCK
      ?auto_501567 - BLOCK
      ?auto_501568 - BLOCK
      ?auto_501569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_501568 ) ( ON-TABLE ?auto_501569 ) ( CLEAR ?auto_501569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_501554 ) ( ON ?auto_501555 ?auto_501554 ) ( ON ?auto_501556 ?auto_501555 ) ( ON ?auto_501557 ?auto_501556 ) ( ON ?auto_501558 ?auto_501557 ) ( ON ?auto_501559 ?auto_501558 ) ( ON ?auto_501560 ?auto_501559 ) ( ON ?auto_501561 ?auto_501560 ) ( ON ?auto_501562 ?auto_501561 ) ( ON ?auto_501563 ?auto_501562 ) ( ON ?auto_501564 ?auto_501563 ) ( ON ?auto_501565 ?auto_501564 ) ( ON ?auto_501566 ?auto_501565 ) ( ON ?auto_501567 ?auto_501566 ) ( ON ?auto_501568 ?auto_501567 ) ( not ( = ?auto_501554 ?auto_501555 ) ) ( not ( = ?auto_501554 ?auto_501556 ) ) ( not ( = ?auto_501554 ?auto_501557 ) ) ( not ( = ?auto_501554 ?auto_501558 ) ) ( not ( = ?auto_501554 ?auto_501559 ) ) ( not ( = ?auto_501554 ?auto_501560 ) ) ( not ( = ?auto_501554 ?auto_501561 ) ) ( not ( = ?auto_501554 ?auto_501562 ) ) ( not ( = ?auto_501554 ?auto_501563 ) ) ( not ( = ?auto_501554 ?auto_501564 ) ) ( not ( = ?auto_501554 ?auto_501565 ) ) ( not ( = ?auto_501554 ?auto_501566 ) ) ( not ( = ?auto_501554 ?auto_501567 ) ) ( not ( = ?auto_501554 ?auto_501568 ) ) ( not ( = ?auto_501554 ?auto_501569 ) ) ( not ( = ?auto_501555 ?auto_501556 ) ) ( not ( = ?auto_501555 ?auto_501557 ) ) ( not ( = ?auto_501555 ?auto_501558 ) ) ( not ( = ?auto_501555 ?auto_501559 ) ) ( not ( = ?auto_501555 ?auto_501560 ) ) ( not ( = ?auto_501555 ?auto_501561 ) ) ( not ( = ?auto_501555 ?auto_501562 ) ) ( not ( = ?auto_501555 ?auto_501563 ) ) ( not ( = ?auto_501555 ?auto_501564 ) ) ( not ( = ?auto_501555 ?auto_501565 ) ) ( not ( = ?auto_501555 ?auto_501566 ) ) ( not ( = ?auto_501555 ?auto_501567 ) ) ( not ( = ?auto_501555 ?auto_501568 ) ) ( not ( = ?auto_501555 ?auto_501569 ) ) ( not ( = ?auto_501556 ?auto_501557 ) ) ( not ( = ?auto_501556 ?auto_501558 ) ) ( not ( = ?auto_501556 ?auto_501559 ) ) ( not ( = ?auto_501556 ?auto_501560 ) ) ( not ( = ?auto_501556 ?auto_501561 ) ) ( not ( = ?auto_501556 ?auto_501562 ) ) ( not ( = ?auto_501556 ?auto_501563 ) ) ( not ( = ?auto_501556 ?auto_501564 ) ) ( not ( = ?auto_501556 ?auto_501565 ) ) ( not ( = ?auto_501556 ?auto_501566 ) ) ( not ( = ?auto_501556 ?auto_501567 ) ) ( not ( = ?auto_501556 ?auto_501568 ) ) ( not ( = ?auto_501556 ?auto_501569 ) ) ( not ( = ?auto_501557 ?auto_501558 ) ) ( not ( = ?auto_501557 ?auto_501559 ) ) ( not ( = ?auto_501557 ?auto_501560 ) ) ( not ( = ?auto_501557 ?auto_501561 ) ) ( not ( = ?auto_501557 ?auto_501562 ) ) ( not ( = ?auto_501557 ?auto_501563 ) ) ( not ( = ?auto_501557 ?auto_501564 ) ) ( not ( = ?auto_501557 ?auto_501565 ) ) ( not ( = ?auto_501557 ?auto_501566 ) ) ( not ( = ?auto_501557 ?auto_501567 ) ) ( not ( = ?auto_501557 ?auto_501568 ) ) ( not ( = ?auto_501557 ?auto_501569 ) ) ( not ( = ?auto_501558 ?auto_501559 ) ) ( not ( = ?auto_501558 ?auto_501560 ) ) ( not ( = ?auto_501558 ?auto_501561 ) ) ( not ( = ?auto_501558 ?auto_501562 ) ) ( not ( = ?auto_501558 ?auto_501563 ) ) ( not ( = ?auto_501558 ?auto_501564 ) ) ( not ( = ?auto_501558 ?auto_501565 ) ) ( not ( = ?auto_501558 ?auto_501566 ) ) ( not ( = ?auto_501558 ?auto_501567 ) ) ( not ( = ?auto_501558 ?auto_501568 ) ) ( not ( = ?auto_501558 ?auto_501569 ) ) ( not ( = ?auto_501559 ?auto_501560 ) ) ( not ( = ?auto_501559 ?auto_501561 ) ) ( not ( = ?auto_501559 ?auto_501562 ) ) ( not ( = ?auto_501559 ?auto_501563 ) ) ( not ( = ?auto_501559 ?auto_501564 ) ) ( not ( = ?auto_501559 ?auto_501565 ) ) ( not ( = ?auto_501559 ?auto_501566 ) ) ( not ( = ?auto_501559 ?auto_501567 ) ) ( not ( = ?auto_501559 ?auto_501568 ) ) ( not ( = ?auto_501559 ?auto_501569 ) ) ( not ( = ?auto_501560 ?auto_501561 ) ) ( not ( = ?auto_501560 ?auto_501562 ) ) ( not ( = ?auto_501560 ?auto_501563 ) ) ( not ( = ?auto_501560 ?auto_501564 ) ) ( not ( = ?auto_501560 ?auto_501565 ) ) ( not ( = ?auto_501560 ?auto_501566 ) ) ( not ( = ?auto_501560 ?auto_501567 ) ) ( not ( = ?auto_501560 ?auto_501568 ) ) ( not ( = ?auto_501560 ?auto_501569 ) ) ( not ( = ?auto_501561 ?auto_501562 ) ) ( not ( = ?auto_501561 ?auto_501563 ) ) ( not ( = ?auto_501561 ?auto_501564 ) ) ( not ( = ?auto_501561 ?auto_501565 ) ) ( not ( = ?auto_501561 ?auto_501566 ) ) ( not ( = ?auto_501561 ?auto_501567 ) ) ( not ( = ?auto_501561 ?auto_501568 ) ) ( not ( = ?auto_501561 ?auto_501569 ) ) ( not ( = ?auto_501562 ?auto_501563 ) ) ( not ( = ?auto_501562 ?auto_501564 ) ) ( not ( = ?auto_501562 ?auto_501565 ) ) ( not ( = ?auto_501562 ?auto_501566 ) ) ( not ( = ?auto_501562 ?auto_501567 ) ) ( not ( = ?auto_501562 ?auto_501568 ) ) ( not ( = ?auto_501562 ?auto_501569 ) ) ( not ( = ?auto_501563 ?auto_501564 ) ) ( not ( = ?auto_501563 ?auto_501565 ) ) ( not ( = ?auto_501563 ?auto_501566 ) ) ( not ( = ?auto_501563 ?auto_501567 ) ) ( not ( = ?auto_501563 ?auto_501568 ) ) ( not ( = ?auto_501563 ?auto_501569 ) ) ( not ( = ?auto_501564 ?auto_501565 ) ) ( not ( = ?auto_501564 ?auto_501566 ) ) ( not ( = ?auto_501564 ?auto_501567 ) ) ( not ( = ?auto_501564 ?auto_501568 ) ) ( not ( = ?auto_501564 ?auto_501569 ) ) ( not ( = ?auto_501565 ?auto_501566 ) ) ( not ( = ?auto_501565 ?auto_501567 ) ) ( not ( = ?auto_501565 ?auto_501568 ) ) ( not ( = ?auto_501565 ?auto_501569 ) ) ( not ( = ?auto_501566 ?auto_501567 ) ) ( not ( = ?auto_501566 ?auto_501568 ) ) ( not ( = ?auto_501566 ?auto_501569 ) ) ( not ( = ?auto_501567 ?auto_501568 ) ) ( not ( = ?auto_501567 ?auto_501569 ) ) ( not ( = ?auto_501568 ?auto_501569 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_501569 )
      ( !STACK ?auto_501569 ?auto_501568 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501586 - BLOCK
      ?auto_501587 - BLOCK
      ?auto_501588 - BLOCK
      ?auto_501589 - BLOCK
      ?auto_501590 - BLOCK
      ?auto_501591 - BLOCK
      ?auto_501592 - BLOCK
      ?auto_501593 - BLOCK
      ?auto_501594 - BLOCK
      ?auto_501595 - BLOCK
      ?auto_501596 - BLOCK
      ?auto_501597 - BLOCK
      ?auto_501598 - BLOCK
      ?auto_501599 - BLOCK
      ?auto_501600 - BLOCK
      ?auto_501601 - BLOCK
    )
    :vars
    (
      ?auto_501602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501601 ?auto_501602 ) ( ON-TABLE ?auto_501586 ) ( ON ?auto_501587 ?auto_501586 ) ( ON ?auto_501588 ?auto_501587 ) ( ON ?auto_501589 ?auto_501588 ) ( ON ?auto_501590 ?auto_501589 ) ( ON ?auto_501591 ?auto_501590 ) ( ON ?auto_501592 ?auto_501591 ) ( ON ?auto_501593 ?auto_501592 ) ( ON ?auto_501594 ?auto_501593 ) ( ON ?auto_501595 ?auto_501594 ) ( ON ?auto_501596 ?auto_501595 ) ( ON ?auto_501597 ?auto_501596 ) ( ON ?auto_501598 ?auto_501597 ) ( ON ?auto_501599 ?auto_501598 ) ( not ( = ?auto_501586 ?auto_501587 ) ) ( not ( = ?auto_501586 ?auto_501588 ) ) ( not ( = ?auto_501586 ?auto_501589 ) ) ( not ( = ?auto_501586 ?auto_501590 ) ) ( not ( = ?auto_501586 ?auto_501591 ) ) ( not ( = ?auto_501586 ?auto_501592 ) ) ( not ( = ?auto_501586 ?auto_501593 ) ) ( not ( = ?auto_501586 ?auto_501594 ) ) ( not ( = ?auto_501586 ?auto_501595 ) ) ( not ( = ?auto_501586 ?auto_501596 ) ) ( not ( = ?auto_501586 ?auto_501597 ) ) ( not ( = ?auto_501586 ?auto_501598 ) ) ( not ( = ?auto_501586 ?auto_501599 ) ) ( not ( = ?auto_501586 ?auto_501600 ) ) ( not ( = ?auto_501586 ?auto_501601 ) ) ( not ( = ?auto_501586 ?auto_501602 ) ) ( not ( = ?auto_501587 ?auto_501588 ) ) ( not ( = ?auto_501587 ?auto_501589 ) ) ( not ( = ?auto_501587 ?auto_501590 ) ) ( not ( = ?auto_501587 ?auto_501591 ) ) ( not ( = ?auto_501587 ?auto_501592 ) ) ( not ( = ?auto_501587 ?auto_501593 ) ) ( not ( = ?auto_501587 ?auto_501594 ) ) ( not ( = ?auto_501587 ?auto_501595 ) ) ( not ( = ?auto_501587 ?auto_501596 ) ) ( not ( = ?auto_501587 ?auto_501597 ) ) ( not ( = ?auto_501587 ?auto_501598 ) ) ( not ( = ?auto_501587 ?auto_501599 ) ) ( not ( = ?auto_501587 ?auto_501600 ) ) ( not ( = ?auto_501587 ?auto_501601 ) ) ( not ( = ?auto_501587 ?auto_501602 ) ) ( not ( = ?auto_501588 ?auto_501589 ) ) ( not ( = ?auto_501588 ?auto_501590 ) ) ( not ( = ?auto_501588 ?auto_501591 ) ) ( not ( = ?auto_501588 ?auto_501592 ) ) ( not ( = ?auto_501588 ?auto_501593 ) ) ( not ( = ?auto_501588 ?auto_501594 ) ) ( not ( = ?auto_501588 ?auto_501595 ) ) ( not ( = ?auto_501588 ?auto_501596 ) ) ( not ( = ?auto_501588 ?auto_501597 ) ) ( not ( = ?auto_501588 ?auto_501598 ) ) ( not ( = ?auto_501588 ?auto_501599 ) ) ( not ( = ?auto_501588 ?auto_501600 ) ) ( not ( = ?auto_501588 ?auto_501601 ) ) ( not ( = ?auto_501588 ?auto_501602 ) ) ( not ( = ?auto_501589 ?auto_501590 ) ) ( not ( = ?auto_501589 ?auto_501591 ) ) ( not ( = ?auto_501589 ?auto_501592 ) ) ( not ( = ?auto_501589 ?auto_501593 ) ) ( not ( = ?auto_501589 ?auto_501594 ) ) ( not ( = ?auto_501589 ?auto_501595 ) ) ( not ( = ?auto_501589 ?auto_501596 ) ) ( not ( = ?auto_501589 ?auto_501597 ) ) ( not ( = ?auto_501589 ?auto_501598 ) ) ( not ( = ?auto_501589 ?auto_501599 ) ) ( not ( = ?auto_501589 ?auto_501600 ) ) ( not ( = ?auto_501589 ?auto_501601 ) ) ( not ( = ?auto_501589 ?auto_501602 ) ) ( not ( = ?auto_501590 ?auto_501591 ) ) ( not ( = ?auto_501590 ?auto_501592 ) ) ( not ( = ?auto_501590 ?auto_501593 ) ) ( not ( = ?auto_501590 ?auto_501594 ) ) ( not ( = ?auto_501590 ?auto_501595 ) ) ( not ( = ?auto_501590 ?auto_501596 ) ) ( not ( = ?auto_501590 ?auto_501597 ) ) ( not ( = ?auto_501590 ?auto_501598 ) ) ( not ( = ?auto_501590 ?auto_501599 ) ) ( not ( = ?auto_501590 ?auto_501600 ) ) ( not ( = ?auto_501590 ?auto_501601 ) ) ( not ( = ?auto_501590 ?auto_501602 ) ) ( not ( = ?auto_501591 ?auto_501592 ) ) ( not ( = ?auto_501591 ?auto_501593 ) ) ( not ( = ?auto_501591 ?auto_501594 ) ) ( not ( = ?auto_501591 ?auto_501595 ) ) ( not ( = ?auto_501591 ?auto_501596 ) ) ( not ( = ?auto_501591 ?auto_501597 ) ) ( not ( = ?auto_501591 ?auto_501598 ) ) ( not ( = ?auto_501591 ?auto_501599 ) ) ( not ( = ?auto_501591 ?auto_501600 ) ) ( not ( = ?auto_501591 ?auto_501601 ) ) ( not ( = ?auto_501591 ?auto_501602 ) ) ( not ( = ?auto_501592 ?auto_501593 ) ) ( not ( = ?auto_501592 ?auto_501594 ) ) ( not ( = ?auto_501592 ?auto_501595 ) ) ( not ( = ?auto_501592 ?auto_501596 ) ) ( not ( = ?auto_501592 ?auto_501597 ) ) ( not ( = ?auto_501592 ?auto_501598 ) ) ( not ( = ?auto_501592 ?auto_501599 ) ) ( not ( = ?auto_501592 ?auto_501600 ) ) ( not ( = ?auto_501592 ?auto_501601 ) ) ( not ( = ?auto_501592 ?auto_501602 ) ) ( not ( = ?auto_501593 ?auto_501594 ) ) ( not ( = ?auto_501593 ?auto_501595 ) ) ( not ( = ?auto_501593 ?auto_501596 ) ) ( not ( = ?auto_501593 ?auto_501597 ) ) ( not ( = ?auto_501593 ?auto_501598 ) ) ( not ( = ?auto_501593 ?auto_501599 ) ) ( not ( = ?auto_501593 ?auto_501600 ) ) ( not ( = ?auto_501593 ?auto_501601 ) ) ( not ( = ?auto_501593 ?auto_501602 ) ) ( not ( = ?auto_501594 ?auto_501595 ) ) ( not ( = ?auto_501594 ?auto_501596 ) ) ( not ( = ?auto_501594 ?auto_501597 ) ) ( not ( = ?auto_501594 ?auto_501598 ) ) ( not ( = ?auto_501594 ?auto_501599 ) ) ( not ( = ?auto_501594 ?auto_501600 ) ) ( not ( = ?auto_501594 ?auto_501601 ) ) ( not ( = ?auto_501594 ?auto_501602 ) ) ( not ( = ?auto_501595 ?auto_501596 ) ) ( not ( = ?auto_501595 ?auto_501597 ) ) ( not ( = ?auto_501595 ?auto_501598 ) ) ( not ( = ?auto_501595 ?auto_501599 ) ) ( not ( = ?auto_501595 ?auto_501600 ) ) ( not ( = ?auto_501595 ?auto_501601 ) ) ( not ( = ?auto_501595 ?auto_501602 ) ) ( not ( = ?auto_501596 ?auto_501597 ) ) ( not ( = ?auto_501596 ?auto_501598 ) ) ( not ( = ?auto_501596 ?auto_501599 ) ) ( not ( = ?auto_501596 ?auto_501600 ) ) ( not ( = ?auto_501596 ?auto_501601 ) ) ( not ( = ?auto_501596 ?auto_501602 ) ) ( not ( = ?auto_501597 ?auto_501598 ) ) ( not ( = ?auto_501597 ?auto_501599 ) ) ( not ( = ?auto_501597 ?auto_501600 ) ) ( not ( = ?auto_501597 ?auto_501601 ) ) ( not ( = ?auto_501597 ?auto_501602 ) ) ( not ( = ?auto_501598 ?auto_501599 ) ) ( not ( = ?auto_501598 ?auto_501600 ) ) ( not ( = ?auto_501598 ?auto_501601 ) ) ( not ( = ?auto_501598 ?auto_501602 ) ) ( not ( = ?auto_501599 ?auto_501600 ) ) ( not ( = ?auto_501599 ?auto_501601 ) ) ( not ( = ?auto_501599 ?auto_501602 ) ) ( not ( = ?auto_501600 ?auto_501601 ) ) ( not ( = ?auto_501600 ?auto_501602 ) ) ( not ( = ?auto_501601 ?auto_501602 ) ) ( CLEAR ?auto_501599 ) ( ON ?auto_501600 ?auto_501601 ) ( CLEAR ?auto_501600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_501586 ?auto_501587 ?auto_501588 ?auto_501589 ?auto_501590 ?auto_501591 ?auto_501592 ?auto_501593 ?auto_501594 ?auto_501595 ?auto_501596 ?auto_501597 ?auto_501598 ?auto_501599 ?auto_501600 )
      ( MAKE-16PILE ?auto_501586 ?auto_501587 ?auto_501588 ?auto_501589 ?auto_501590 ?auto_501591 ?auto_501592 ?auto_501593 ?auto_501594 ?auto_501595 ?auto_501596 ?auto_501597 ?auto_501598 ?auto_501599 ?auto_501600 ?auto_501601 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501619 - BLOCK
      ?auto_501620 - BLOCK
      ?auto_501621 - BLOCK
      ?auto_501622 - BLOCK
      ?auto_501623 - BLOCK
      ?auto_501624 - BLOCK
      ?auto_501625 - BLOCK
      ?auto_501626 - BLOCK
      ?auto_501627 - BLOCK
      ?auto_501628 - BLOCK
      ?auto_501629 - BLOCK
      ?auto_501630 - BLOCK
      ?auto_501631 - BLOCK
      ?auto_501632 - BLOCK
      ?auto_501633 - BLOCK
      ?auto_501634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501634 ) ( ON-TABLE ?auto_501619 ) ( ON ?auto_501620 ?auto_501619 ) ( ON ?auto_501621 ?auto_501620 ) ( ON ?auto_501622 ?auto_501621 ) ( ON ?auto_501623 ?auto_501622 ) ( ON ?auto_501624 ?auto_501623 ) ( ON ?auto_501625 ?auto_501624 ) ( ON ?auto_501626 ?auto_501625 ) ( ON ?auto_501627 ?auto_501626 ) ( ON ?auto_501628 ?auto_501627 ) ( ON ?auto_501629 ?auto_501628 ) ( ON ?auto_501630 ?auto_501629 ) ( ON ?auto_501631 ?auto_501630 ) ( ON ?auto_501632 ?auto_501631 ) ( not ( = ?auto_501619 ?auto_501620 ) ) ( not ( = ?auto_501619 ?auto_501621 ) ) ( not ( = ?auto_501619 ?auto_501622 ) ) ( not ( = ?auto_501619 ?auto_501623 ) ) ( not ( = ?auto_501619 ?auto_501624 ) ) ( not ( = ?auto_501619 ?auto_501625 ) ) ( not ( = ?auto_501619 ?auto_501626 ) ) ( not ( = ?auto_501619 ?auto_501627 ) ) ( not ( = ?auto_501619 ?auto_501628 ) ) ( not ( = ?auto_501619 ?auto_501629 ) ) ( not ( = ?auto_501619 ?auto_501630 ) ) ( not ( = ?auto_501619 ?auto_501631 ) ) ( not ( = ?auto_501619 ?auto_501632 ) ) ( not ( = ?auto_501619 ?auto_501633 ) ) ( not ( = ?auto_501619 ?auto_501634 ) ) ( not ( = ?auto_501620 ?auto_501621 ) ) ( not ( = ?auto_501620 ?auto_501622 ) ) ( not ( = ?auto_501620 ?auto_501623 ) ) ( not ( = ?auto_501620 ?auto_501624 ) ) ( not ( = ?auto_501620 ?auto_501625 ) ) ( not ( = ?auto_501620 ?auto_501626 ) ) ( not ( = ?auto_501620 ?auto_501627 ) ) ( not ( = ?auto_501620 ?auto_501628 ) ) ( not ( = ?auto_501620 ?auto_501629 ) ) ( not ( = ?auto_501620 ?auto_501630 ) ) ( not ( = ?auto_501620 ?auto_501631 ) ) ( not ( = ?auto_501620 ?auto_501632 ) ) ( not ( = ?auto_501620 ?auto_501633 ) ) ( not ( = ?auto_501620 ?auto_501634 ) ) ( not ( = ?auto_501621 ?auto_501622 ) ) ( not ( = ?auto_501621 ?auto_501623 ) ) ( not ( = ?auto_501621 ?auto_501624 ) ) ( not ( = ?auto_501621 ?auto_501625 ) ) ( not ( = ?auto_501621 ?auto_501626 ) ) ( not ( = ?auto_501621 ?auto_501627 ) ) ( not ( = ?auto_501621 ?auto_501628 ) ) ( not ( = ?auto_501621 ?auto_501629 ) ) ( not ( = ?auto_501621 ?auto_501630 ) ) ( not ( = ?auto_501621 ?auto_501631 ) ) ( not ( = ?auto_501621 ?auto_501632 ) ) ( not ( = ?auto_501621 ?auto_501633 ) ) ( not ( = ?auto_501621 ?auto_501634 ) ) ( not ( = ?auto_501622 ?auto_501623 ) ) ( not ( = ?auto_501622 ?auto_501624 ) ) ( not ( = ?auto_501622 ?auto_501625 ) ) ( not ( = ?auto_501622 ?auto_501626 ) ) ( not ( = ?auto_501622 ?auto_501627 ) ) ( not ( = ?auto_501622 ?auto_501628 ) ) ( not ( = ?auto_501622 ?auto_501629 ) ) ( not ( = ?auto_501622 ?auto_501630 ) ) ( not ( = ?auto_501622 ?auto_501631 ) ) ( not ( = ?auto_501622 ?auto_501632 ) ) ( not ( = ?auto_501622 ?auto_501633 ) ) ( not ( = ?auto_501622 ?auto_501634 ) ) ( not ( = ?auto_501623 ?auto_501624 ) ) ( not ( = ?auto_501623 ?auto_501625 ) ) ( not ( = ?auto_501623 ?auto_501626 ) ) ( not ( = ?auto_501623 ?auto_501627 ) ) ( not ( = ?auto_501623 ?auto_501628 ) ) ( not ( = ?auto_501623 ?auto_501629 ) ) ( not ( = ?auto_501623 ?auto_501630 ) ) ( not ( = ?auto_501623 ?auto_501631 ) ) ( not ( = ?auto_501623 ?auto_501632 ) ) ( not ( = ?auto_501623 ?auto_501633 ) ) ( not ( = ?auto_501623 ?auto_501634 ) ) ( not ( = ?auto_501624 ?auto_501625 ) ) ( not ( = ?auto_501624 ?auto_501626 ) ) ( not ( = ?auto_501624 ?auto_501627 ) ) ( not ( = ?auto_501624 ?auto_501628 ) ) ( not ( = ?auto_501624 ?auto_501629 ) ) ( not ( = ?auto_501624 ?auto_501630 ) ) ( not ( = ?auto_501624 ?auto_501631 ) ) ( not ( = ?auto_501624 ?auto_501632 ) ) ( not ( = ?auto_501624 ?auto_501633 ) ) ( not ( = ?auto_501624 ?auto_501634 ) ) ( not ( = ?auto_501625 ?auto_501626 ) ) ( not ( = ?auto_501625 ?auto_501627 ) ) ( not ( = ?auto_501625 ?auto_501628 ) ) ( not ( = ?auto_501625 ?auto_501629 ) ) ( not ( = ?auto_501625 ?auto_501630 ) ) ( not ( = ?auto_501625 ?auto_501631 ) ) ( not ( = ?auto_501625 ?auto_501632 ) ) ( not ( = ?auto_501625 ?auto_501633 ) ) ( not ( = ?auto_501625 ?auto_501634 ) ) ( not ( = ?auto_501626 ?auto_501627 ) ) ( not ( = ?auto_501626 ?auto_501628 ) ) ( not ( = ?auto_501626 ?auto_501629 ) ) ( not ( = ?auto_501626 ?auto_501630 ) ) ( not ( = ?auto_501626 ?auto_501631 ) ) ( not ( = ?auto_501626 ?auto_501632 ) ) ( not ( = ?auto_501626 ?auto_501633 ) ) ( not ( = ?auto_501626 ?auto_501634 ) ) ( not ( = ?auto_501627 ?auto_501628 ) ) ( not ( = ?auto_501627 ?auto_501629 ) ) ( not ( = ?auto_501627 ?auto_501630 ) ) ( not ( = ?auto_501627 ?auto_501631 ) ) ( not ( = ?auto_501627 ?auto_501632 ) ) ( not ( = ?auto_501627 ?auto_501633 ) ) ( not ( = ?auto_501627 ?auto_501634 ) ) ( not ( = ?auto_501628 ?auto_501629 ) ) ( not ( = ?auto_501628 ?auto_501630 ) ) ( not ( = ?auto_501628 ?auto_501631 ) ) ( not ( = ?auto_501628 ?auto_501632 ) ) ( not ( = ?auto_501628 ?auto_501633 ) ) ( not ( = ?auto_501628 ?auto_501634 ) ) ( not ( = ?auto_501629 ?auto_501630 ) ) ( not ( = ?auto_501629 ?auto_501631 ) ) ( not ( = ?auto_501629 ?auto_501632 ) ) ( not ( = ?auto_501629 ?auto_501633 ) ) ( not ( = ?auto_501629 ?auto_501634 ) ) ( not ( = ?auto_501630 ?auto_501631 ) ) ( not ( = ?auto_501630 ?auto_501632 ) ) ( not ( = ?auto_501630 ?auto_501633 ) ) ( not ( = ?auto_501630 ?auto_501634 ) ) ( not ( = ?auto_501631 ?auto_501632 ) ) ( not ( = ?auto_501631 ?auto_501633 ) ) ( not ( = ?auto_501631 ?auto_501634 ) ) ( not ( = ?auto_501632 ?auto_501633 ) ) ( not ( = ?auto_501632 ?auto_501634 ) ) ( not ( = ?auto_501633 ?auto_501634 ) ) ( CLEAR ?auto_501632 ) ( ON ?auto_501633 ?auto_501634 ) ( CLEAR ?auto_501633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_501619 ?auto_501620 ?auto_501621 ?auto_501622 ?auto_501623 ?auto_501624 ?auto_501625 ?auto_501626 ?auto_501627 ?auto_501628 ?auto_501629 ?auto_501630 ?auto_501631 ?auto_501632 ?auto_501633 )
      ( MAKE-16PILE ?auto_501619 ?auto_501620 ?auto_501621 ?auto_501622 ?auto_501623 ?auto_501624 ?auto_501625 ?auto_501626 ?auto_501627 ?auto_501628 ?auto_501629 ?auto_501630 ?auto_501631 ?auto_501632 ?auto_501633 ?auto_501634 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501651 - BLOCK
      ?auto_501652 - BLOCK
      ?auto_501653 - BLOCK
      ?auto_501654 - BLOCK
      ?auto_501655 - BLOCK
      ?auto_501656 - BLOCK
      ?auto_501657 - BLOCK
      ?auto_501658 - BLOCK
      ?auto_501659 - BLOCK
      ?auto_501660 - BLOCK
      ?auto_501661 - BLOCK
      ?auto_501662 - BLOCK
      ?auto_501663 - BLOCK
      ?auto_501664 - BLOCK
      ?auto_501665 - BLOCK
      ?auto_501666 - BLOCK
    )
    :vars
    (
      ?auto_501667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501666 ?auto_501667 ) ( ON-TABLE ?auto_501651 ) ( ON ?auto_501652 ?auto_501651 ) ( ON ?auto_501653 ?auto_501652 ) ( ON ?auto_501654 ?auto_501653 ) ( ON ?auto_501655 ?auto_501654 ) ( ON ?auto_501656 ?auto_501655 ) ( ON ?auto_501657 ?auto_501656 ) ( ON ?auto_501658 ?auto_501657 ) ( ON ?auto_501659 ?auto_501658 ) ( ON ?auto_501660 ?auto_501659 ) ( ON ?auto_501661 ?auto_501660 ) ( ON ?auto_501662 ?auto_501661 ) ( ON ?auto_501663 ?auto_501662 ) ( not ( = ?auto_501651 ?auto_501652 ) ) ( not ( = ?auto_501651 ?auto_501653 ) ) ( not ( = ?auto_501651 ?auto_501654 ) ) ( not ( = ?auto_501651 ?auto_501655 ) ) ( not ( = ?auto_501651 ?auto_501656 ) ) ( not ( = ?auto_501651 ?auto_501657 ) ) ( not ( = ?auto_501651 ?auto_501658 ) ) ( not ( = ?auto_501651 ?auto_501659 ) ) ( not ( = ?auto_501651 ?auto_501660 ) ) ( not ( = ?auto_501651 ?auto_501661 ) ) ( not ( = ?auto_501651 ?auto_501662 ) ) ( not ( = ?auto_501651 ?auto_501663 ) ) ( not ( = ?auto_501651 ?auto_501664 ) ) ( not ( = ?auto_501651 ?auto_501665 ) ) ( not ( = ?auto_501651 ?auto_501666 ) ) ( not ( = ?auto_501651 ?auto_501667 ) ) ( not ( = ?auto_501652 ?auto_501653 ) ) ( not ( = ?auto_501652 ?auto_501654 ) ) ( not ( = ?auto_501652 ?auto_501655 ) ) ( not ( = ?auto_501652 ?auto_501656 ) ) ( not ( = ?auto_501652 ?auto_501657 ) ) ( not ( = ?auto_501652 ?auto_501658 ) ) ( not ( = ?auto_501652 ?auto_501659 ) ) ( not ( = ?auto_501652 ?auto_501660 ) ) ( not ( = ?auto_501652 ?auto_501661 ) ) ( not ( = ?auto_501652 ?auto_501662 ) ) ( not ( = ?auto_501652 ?auto_501663 ) ) ( not ( = ?auto_501652 ?auto_501664 ) ) ( not ( = ?auto_501652 ?auto_501665 ) ) ( not ( = ?auto_501652 ?auto_501666 ) ) ( not ( = ?auto_501652 ?auto_501667 ) ) ( not ( = ?auto_501653 ?auto_501654 ) ) ( not ( = ?auto_501653 ?auto_501655 ) ) ( not ( = ?auto_501653 ?auto_501656 ) ) ( not ( = ?auto_501653 ?auto_501657 ) ) ( not ( = ?auto_501653 ?auto_501658 ) ) ( not ( = ?auto_501653 ?auto_501659 ) ) ( not ( = ?auto_501653 ?auto_501660 ) ) ( not ( = ?auto_501653 ?auto_501661 ) ) ( not ( = ?auto_501653 ?auto_501662 ) ) ( not ( = ?auto_501653 ?auto_501663 ) ) ( not ( = ?auto_501653 ?auto_501664 ) ) ( not ( = ?auto_501653 ?auto_501665 ) ) ( not ( = ?auto_501653 ?auto_501666 ) ) ( not ( = ?auto_501653 ?auto_501667 ) ) ( not ( = ?auto_501654 ?auto_501655 ) ) ( not ( = ?auto_501654 ?auto_501656 ) ) ( not ( = ?auto_501654 ?auto_501657 ) ) ( not ( = ?auto_501654 ?auto_501658 ) ) ( not ( = ?auto_501654 ?auto_501659 ) ) ( not ( = ?auto_501654 ?auto_501660 ) ) ( not ( = ?auto_501654 ?auto_501661 ) ) ( not ( = ?auto_501654 ?auto_501662 ) ) ( not ( = ?auto_501654 ?auto_501663 ) ) ( not ( = ?auto_501654 ?auto_501664 ) ) ( not ( = ?auto_501654 ?auto_501665 ) ) ( not ( = ?auto_501654 ?auto_501666 ) ) ( not ( = ?auto_501654 ?auto_501667 ) ) ( not ( = ?auto_501655 ?auto_501656 ) ) ( not ( = ?auto_501655 ?auto_501657 ) ) ( not ( = ?auto_501655 ?auto_501658 ) ) ( not ( = ?auto_501655 ?auto_501659 ) ) ( not ( = ?auto_501655 ?auto_501660 ) ) ( not ( = ?auto_501655 ?auto_501661 ) ) ( not ( = ?auto_501655 ?auto_501662 ) ) ( not ( = ?auto_501655 ?auto_501663 ) ) ( not ( = ?auto_501655 ?auto_501664 ) ) ( not ( = ?auto_501655 ?auto_501665 ) ) ( not ( = ?auto_501655 ?auto_501666 ) ) ( not ( = ?auto_501655 ?auto_501667 ) ) ( not ( = ?auto_501656 ?auto_501657 ) ) ( not ( = ?auto_501656 ?auto_501658 ) ) ( not ( = ?auto_501656 ?auto_501659 ) ) ( not ( = ?auto_501656 ?auto_501660 ) ) ( not ( = ?auto_501656 ?auto_501661 ) ) ( not ( = ?auto_501656 ?auto_501662 ) ) ( not ( = ?auto_501656 ?auto_501663 ) ) ( not ( = ?auto_501656 ?auto_501664 ) ) ( not ( = ?auto_501656 ?auto_501665 ) ) ( not ( = ?auto_501656 ?auto_501666 ) ) ( not ( = ?auto_501656 ?auto_501667 ) ) ( not ( = ?auto_501657 ?auto_501658 ) ) ( not ( = ?auto_501657 ?auto_501659 ) ) ( not ( = ?auto_501657 ?auto_501660 ) ) ( not ( = ?auto_501657 ?auto_501661 ) ) ( not ( = ?auto_501657 ?auto_501662 ) ) ( not ( = ?auto_501657 ?auto_501663 ) ) ( not ( = ?auto_501657 ?auto_501664 ) ) ( not ( = ?auto_501657 ?auto_501665 ) ) ( not ( = ?auto_501657 ?auto_501666 ) ) ( not ( = ?auto_501657 ?auto_501667 ) ) ( not ( = ?auto_501658 ?auto_501659 ) ) ( not ( = ?auto_501658 ?auto_501660 ) ) ( not ( = ?auto_501658 ?auto_501661 ) ) ( not ( = ?auto_501658 ?auto_501662 ) ) ( not ( = ?auto_501658 ?auto_501663 ) ) ( not ( = ?auto_501658 ?auto_501664 ) ) ( not ( = ?auto_501658 ?auto_501665 ) ) ( not ( = ?auto_501658 ?auto_501666 ) ) ( not ( = ?auto_501658 ?auto_501667 ) ) ( not ( = ?auto_501659 ?auto_501660 ) ) ( not ( = ?auto_501659 ?auto_501661 ) ) ( not ( = ?auto_501659 ?auto_501662 ) ) ( not ( = ?auto_501659 ?auto_501663 ) ) ( not ( = ?auto_501659 ?auto_501664 ) ) ( not ( = ?auto_501659 ?auto_501665 ) ) ( not ( = ?auto_501659 ?auto_501666 ) ) ( not ( = ?auto_501659 ?auto_501667 ) ) ( not ( = ?auto_501660 ?auto_501661 ) ) ( not ( = ?auto_501660 ?auto_501662 ) ) ( not ( = ?auto_501660 ?auto_501663 ) ) ( not ( = ?auto_501660 ?auto_501664 ) ) ( not ( = ?auto_501660 ?auto_501665 ) ) ( not ( = ?auto_501660 ?auto_501666 ) ) ( not ( = ?auto_501660 ?auto_501667 ) ) ( not ( = ?auto_501661 ?auto_501662 ) ) ( not ( = ?auto_501661 ?auto_501663 ) ) ( not ( = ?auto_501661 ?auto_501664 ) ) ( not ( = ?auto_501661 ?auto_501665 ) ) ( not ( = ?auto_501661 ?auto_501666 ) ) ( not ( = ?auto_501661 ?auto_501667 ) ) ( not ( = ?auto_501662 ?auto_501663 ) ) ( not ( = ?auto_501662 ?auto_501664 ) ) ( not ( = ?auto_501662 ?auto_501665 ) ) ( not ( = ?auto_501662 ?auto_501666 ) ) ( not ( = ?auto_501662 ?auto_501667 ) ) ( not ( = ?auto_501663 ?auto_501664 ) ) ( not ( = ?auto_501663 ?auto_501665 ) ) ( not ( = ?auto_501663 ?auto_501666 ) ) ( not ( = ?auto_501663 ?auto_501667 ) ) ( not ( = ?auto_501664 ?auto_501665 ) ) ( not ( = ?auto_501664 ?auto_501666 ) ) ( not ( = ?auto_501664 ?auto_501667 ) ) ( not ( = ?auto_501665 ?auto_501666 ) ) ( not ( = ?auto_501665 ?auto_501667 ) ) ( not ( = ?auto_501666 ?auto_501667 ) ) ( ON ?auto_501665 ?auto_501666 ) ( CLEAR ?auto_501663 ) ( ON ?auto_501664 ?auto_501665 ) ( CLEAR ?auto_501664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_501651 ?auto_501652 ?auto_501653 ?auto_501654 ?auto_501655 ?auto_501656 ?auto_501657 ?auto_501658 ?auto_501659 ?auto_501660 ?auto_501661 ?auto_501662 ?auto_501663 ?auto_501664 )
      ( MAKE-16PILE ?auto_501651 ?auto_501652 ?auto_501653 ?auto_501654 ?auto_501655 ?auto_501656 ?auto_501657 ?auto_501658 ?auto_501659 ?auto_501660 ?auto_501661 ?auto_501662 ?auto_501663 ?auto_501664 ?auto_501665 ?auto_501666 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501684 - BLOCK
      ?auto_501685 - BLOCK
      ?auto_501686 - BLOCK
      ?auto_501687 - BLOCK
      ?auto_501688 - BLOCK
      ?auto_501689 - BLOCK
      ?auto_501690 - BLOCK
      ?auto_501691 - BLOCK
      ?auto_501692 - BLOCK
      ?auto_501693 - BLOCK
      ?auto_501694 - BLOCK
      ?auto_501695 - BLOCK
      ?auto_501696 - BLOCK
      ?auto_501697 - BLOCK
      ?auto_501698 - BLOCK
      ?auto_501699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501699 ) ( ON-TABLE ?auto_501684 ) ( ON ?auto_501685 ?auto_501684 ) ( ON ?auto_501686 ?auto_501685 ) ( ON ?auto_501687 ?auto_501686 ) ( ON ?auto_501688 ?auto_501687 ) ( ON ?auto_501689 ?auto_501688 ) ( ON ?auto_501690 ?auto_501689 ) ( ON ?auto_501691 ?auto_501690 ) ( ON ?auto_501692 ?auto_501691 ) ( ON ?auto_501693 ?auto_501692 ) ( ON ?auto_501694 ?auto_501693 ) ( ON ?auto_501695 ?auto_501694 ) ( ON ?auto_501696 ?auto_501695 ) ( not ( = ?auto_501684 ?auto_501685 ) ) ( not ( = ?auto_501684 ?auto_501686 ) ) ( not ( = ?auto_501684 ?auto_501687 ) ) ( not ( = ?auto_501684 ?auto_501688 ) ) ( not ( = ?auto_501684 ?auto_501689 ) ) ( not ( = ?auto_501684 ?auto_501690 ) ) ( not ( = ?auto_501684 ?auto_501691 ) ) ( not ( = ?auto_501684 ?auto_501692 ) ) ( not ( = ?auto_501684 ?auto_501693 ) ) ( not ( = ?auto_501684 ?auto_501694 ) ) ( not ( = ?auto_501684 ?auto_501695 ) ) ( not ( = ?auto_501684 ?auto_501696 ) ) ( not ( = ?auto_501684 ?auto_501697 ) ) ( not ( = ?auto_501684 ?auto_501698 ) ) ( not ( = ?auto_501684 ?auto_501699 ) ) ( not ( = ?auto_501685 ?auto_501686 ) ) ( not ( = ?auto_501685 ?auto_501687 ) ) ( not ( = ?auto_501685 ?auto_501688 ) ) ( not ( = ?auto_501685 ?auto_501689 ) ) ( not ( = ?auto_501685 ?auto_501690 ) ) ( not ( = ?auto_501685 ?auto_501691 ) ) ( not ( = ?auto_501685 ?auto_501692 ) ) ( not ( = ?auto_501685 ?auto_501693 ) ) ( not ( = ?auto_501685 ?auto_501694 ) ) ( not ( = ?auto_501685 ?auto_501695 ) ) ( not ( = ?auto_501685 ?auto_501696 ) ) ( not ( = ?auto_501685 ?auto_501697 ) ) ( not ( = ?auto_501685 ?auto_501698 ) ) ( not ( = ?auto_501685 ?auto_501699 ) ) ( not ( = ?auto_501686 ?auto_501687 ) ) ( not ( = ?auto_501686 ?auto_501688 ) ) ( not ( = ?auto_501686 ?auto_501689 ) ) ( not ( = ?auto_501686 ?auto_501690 ) ) ( not ( = ?auto_501686 ?auto_501691 ) ) ( not ( = ?auto_501686 ?auto_501692 ) ) ( not ( = ?auto_501686 ?auto_501693 ) ) ( not ( = ?auto_501686 ?auto_501694 ) ) ( not ( = ?auto_501686 ?auto_501695 ) ) ( not ( = ?auto_501686 ?auto_501696 ) ) ( not ( = ?auto_501686 ?auto_501697 ) ) ( not ( = ?auto_501686 ?auto_501698 ) ) ( not ( = ?auto_501686 ?auto_501699 ) ) ( not ( = ?auto_501687 ?auto_501688 ) ) ( not ( = ?auto_501687 ?auto_501689 ) ) ( not ( = ?auto_501687 ?auto_501690 ) ) ( not ( = ?auto_501687 ?auto_501691 ) ) ( not ( = ?auto_501687 ?auto_501692 ) ) ( not ( = ?auto_501687 ?auto_501693 ) ) ( not ( = ?auto_501687 ?auto_501694 ) ) ( not ( = ?auto_501687 ?auto_501695 ) ) ( not ( = ?auto_501687 ?auto_501696 ) ) ( not ( = ?auto_501687 ?auto_501697 ) ) ( not ( = ?auto_501687 ?auto_501698 ) ) ( not ( = ?auto_501687 ?auto_501699 ) ) ( not ( = ?auto_501688 ?auto_501689 ) ) ( not ( = ?auto_501688 ?auto_501690 ) ) ( not ( = ?auto_501688 ?auto_501691 ) ) ( not ( = ?auto_501688 ?auto_501692 ) ) ( not ( = ?auto_501688 ?auto_501693 ) ) ( not ( = ?auto_501688 ?auto_501694 ) ) ( not ( = ?auto_501688 ?auto_501695 ) ) ( not ( = ?auto_501688 ?auto_501696 ) ) ( not ( = ?auto_501688 ?auto_501697 ) ) ( not ( = ?auto_501688 ?auto_501698 ) ) ( not ( = ?auto_501688 ?auto_501699 ) ) ( not ( = ?auto_501689 ?auto_501690 ) ) ( not ( = ?auto_501689 ?auto_501691 ) ) ( not ( = ?auto_501689 ?auto_501692 ) ) ( not ( = ?auto_501689 ?auto_501693 ) ) ( not ( = ?auto_501689 ?auto_501694 ) ) ( not ( = ?auto_501689 ?auto_501695 ) ) ( not ( = ?auto_501689 ?auto_501696 ) ) ( not ( = ?auto_501689 ?auto_501697 ) ) ( not ( = ?auto_501689 ?auto_501698 ) ) ( not ( = ?auto_501689 ?auto_501699 ) ) ( not ( = ?auto_501690 ?auto_501691 ) ) ( not ( = ?auto_501690 ?auto_501692 ) ) ( not ( = ?auto_501690 ?auto_501693 ) ) ( not ( = ?auto_501690 ?auto_501694 ) ) ( not ( = ?auto_501690 ?auto_501695 ) ) ( not ( = ?auto_501690 ?auto_501696 ) ) ( not ( = ?auto_501690 ?auto_501697 ) ) ( not ( = ?auto_501690 ?auto_501698 ) ) ( not ( = ?auto_501690 ?auto_501699 ) ) ( not ( = ?auto_501691 ?auto_501692 ) ) ( not ( = ?auto_501691 ?auto_501693 ) ) ( not ( = ?auto_501691 ?auto_501694 ) ) ( not ( = ?auto_501691 ?auto_501695 ) ) ( not ( = ?auto_501691 ?auto_501696 ) ) ( not ( = ?auto_501691 ?auto_501697 ) ) ( not ( = ?auto_501691 ?auto_501698 ) ) ( not ( = ?auto_501691 ?auto_501699 ) ) ( not ( = ?auto_501692 ?auto_501693 ) ) ( not ( = ?auto_501692 ?auto_501694 ) ) ( not ( = ?auto_501692 ?auto_501695 ) ) ( not ( = ?auto_501692 ?auto_501696 ) ) ( not ( = ?auto_501692 ?auto_501697 ) ) ( not ( = ?auto_501692 ?auto_501698 ) ) ( not ( = ?auto_501692 ?auto_501699 ) ) ( not ( = ?auto_501693 ?auto_501694 ) ) ( not ( = ?auto_501693 ?auto_501695 ) ) ( not ( = ?auto_501693 ?auto_501696 ) ) ( not ( = ?auto_501693 ?auto_501697 ) ) ( not ( = ?auto_501693 ?auto_501698 ) ) ( not ( = ?auto_501693 ?auto_501699 ) ) ( not ( = ?auto_501694 ?auto_501695 ) ) ( not ( = ?auto_501694 ?auto_501696 ) ) ( not ( = ?auto_501694 ?auto_501697 ) ) ( not ( = ?auto_501694 ?auto_501698 ) ) ( not ( = ?auto_501694 ?auto_501699 ) ) ( not ( = ?auto_501695 ?auto_501696 ) ) ( not ( = ?auto_501695 ?auto_501697 ) ) ( not ( = ?auto_501695 ?auto_501698 ) ) ( not ( = ?auto_501695 ?auto_501699 ) ) ( not ( = ?auto_501696 ?auto_501697 ) ) ( not ( = ?auto_501696 ?auto_501698 ) ) ( not ( = ?auto_501696 ?auto_501699 ) ) ( not ( = ?auto_501697 ?auto_501698 ) ) ( not ( = ?auto_501697 ?auto_501699 ) ) ( not ( = ?auto_501698 ?auto_501699 ) ) ( ON ?auto_501698 ?auto_501699 ) ( CLEAR ?auto_501696 ) ( ON ?auto_501697 ?auto_501698 ) ( CLEAR ?auto_501697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_501684 ?auto_501685 ?auto_501686 ?auto_501687 ?auto_501688 ?auto_501689 ?auto_501690 ?auto_501691 ?auto_501692 ?auto_501693 ?auto_501694 ?auto_501695 ?auto_501696 ?auto_501697 )
      ( MAKE-16PILE ?auto_501684 ?auto_501685 ?auto_501686 ?auto_501687 ?auto_501688 ?auto_501689 ?auto_501690 ?auto_501691 ?auto_501692 ?auto_501693 ?auto_501694 ?auto_501695 ?auto_501696 ?auto_501697 ?auto_501698 ?auto_501699 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501716 - BLOCK
      ?auto_501717 - BLOCK
      ?auto_501718 - BLOCK
      ?auto_501719 - BLOCK
      ?auto_501720 - BLOCK
      ?auto_501721 - BLOCK
      ?auto_501722 - BLOCK
      ?auto_501723 - BLOCK
      ?auto_501724 - BLOCK
      ?auto_501725 - BLOCK
      ?auto_501726 - BLOCK
      ?auto_501727 - BLOCK
      ?auto_501728 - BLOCK
      ?auto_501729 - BLOCK
      ?auto_501730 - BLOCK
      ?auto_501731 - BLOCK
    )
    :vars
    (
      ?auto_501732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501731 ?auto_501732 ) ( ON-TABLE ?auto_501716 ) ( ON ?auto_501717 ?auto_501716 ) ( ON ?auto_501718 ?auto_501717 ) ( ON ?auto_501719 ?auto_501718 ) ( ON ?auto_501720 ?auto_501719 ) ( ON ?auto_501721 ?auto_501720 ) ( ON ?auto_501722 ?auto_501721 ) ( ON ?auto_501723 ?auto_501722 ) ( ON ?auto_501724 ?auto_501723 ) ( ON ?auto_501725 ?auto_501724 ) ( ON ?auto_501726 ?auto_501725 ) ( ON ?auto_501727 ?auto_501726 ) ( not ( = ?auto_501716 ?auto_501717 ) ) ( not ( = ?auto_501716 ?auto_501718 ) ) ( not ( = ?auto_501716 ?auto_501719 ) ) ( not ( = ?auto_501716 ?auto_501720 ) ) ( not ( = ?auto_501716 ?auto_501721 ) ) ( not ( = ?auto_501716 ?auto_501722 ) ) ( not ( = ?auto_501716 ?auto_501723 ) ) ( not ( = ?auto_501716 ?auto_501724 ) ) ( not ( = ?auto_501716 ?auto_501725 ) ) ( not ( = ?auto_501716 ?auto_501726 ) ) ( not ( = ?auto_501716 ?auto_501727 ) ) ( not ( = ?auto_501716 ?auto_501728 ) ) ( not ( = ?auto_501716 ?auto_501729 ) ) ( not ( = ?auto_501716 ?auto_501730 ) ) ( not ( = ?auto_501716 ?auto_501731 ) ) ( not ( = ?auto_501716 ?auto_501732 ) ) ( not ( = ?auto_501717 ?auto_501718 ) ) ( not ( = ?auto_501717 ?auto_501719 ) ) ( not ( = ?auto_501717 ?auto_501720 ) ) ( not ( = ?auto_501717 ?auto_501721 ) ) ( not ( = ?auto_501717 ?auto_501722 ) ) ( not ( = ?auto_501717 ?auto_501723 ) ) ( not ( = ?auto_501717 ?auto_501724 ) ) ( not ( = ?auto_501717 ?auto_501725 ) ) ( not ( = ?auto_501717 ?auto_501726 ) ) ( not ( = ?auto_501717 ?auto_501727 ) ) ( not ( = ?auto_501717 ?auto_501728 ) ) ( not ( = ?auto_501717 ?auto_501729 ) ) ( not ( = ?auto_501717 ?auto_501730 ) ) ( not ( = ?auto_501717 ?auto_501731 ) ) ( not ( = ?auto_501717 ?auto_501732 ) ) ( not ( = ?auto_501718 ?auto_501719 ) ) ( not ( = ?auto_501718 ?auto_501720 ) ) ( not ( = ?auto_501718 ?auto_501721 ) ) ( not ( = ?auto_501718 ?auto_501722 ) ) ( not ( = ?auto_501718 ?auto_501723 ) ) ( not ( = ?auto_501718 ?auto_501724 ) ) ( not ( = ?auto_501718 ?auto_501725 ) ) ( not ( = ?auto_501718 ?auto_501726 ) ) ( not ( = ?auto_501718 ?auto_501727 ) ) ( not ( = ?auto_501718 ?auto_501728 ) ) ( not ( = ?auto_501718 ?auto_501729 ) ) ( not ( = ?auto_501718 ?auto_501730 ) ) ( not ( = ?auto_501718 ?auto_501731 ) ) ( not ( = ?auto_501718 ?auto_501732 ) ) ( not ( = ?auto_501719 ?auto_501720 ) ) ( not ( = ?auto_501719 ?auto_501721 ) ) ( not ( = ?auto_501719 ?auto_501722 ) ) ( not ( = ?auto_501719 ?auto_501723 ) ) ( not ( = ?auto_501719 ?auto_501724 ) ) ( not ( = ?auto_501719 ?auto_501725 ) ) ( not ( = ?auto_501719 ?auto_501726 ) ) ( not ( = ?auto_501719 ?auto_501727 ) ) ( not ( = ?auto_501719 ?auto_501728 ) ) ( not ( = ?auto_501719 ?auto_501729 ) ) ( not ( = ?auto_501719 ?auto_501730 ) ) ( not ( = ?auto_501719 ?auto_501731 ) ) ( not ( = ?auto_501719 ?auto_501732 ) ) ( not ( = ?auto_501720 ?auto_501721 ) ) ( not ( = ?auto_501720 ?auto_501722 ) ) ( not ( = ?auto_501720 ?auto_501723 ) ) ( not ( = ?auto_501720 ?auto_501724 ) ) ( not ( = ?auto_501720 ?auto_501725 ) ) ( not ( = ?auto_501720 ?auto_501726 ) ) ( not ( = ?auto_501720 ?auto_501727 ) ) ( not ( = ?auto_501720 ?auto_501728 ) ) ( not ( = ?auto_501720 ?auto_501729 ) ) ( not ( = ?auto_501720 ?auto_501730 ) ) ( not ( = ?auto_501720 ?auto_501731 ) ) ( not ( = ?auto_501720 ?auto_501732 ) ) ( not ( = ?auto_501721 ?auto_501722 ) ) ( not ( = ?auto_501721 ?auto_501723 ) ) ( not ( = ?auto_501721 ?auto_501724 ) ) ( not ( = ?auto_501721 ?auto_501725 ) ) ( not ( = ?auto_501721 ?auto_501726 ) ) ( not ( = ?auto_501721 ?auto_501727 ) ) ( not ( = ?auto_501721 ?auto_501728 ) ) ( not ( = ?auto_501721 ?auto_501729 ) ) ( not ( = ?auto_501721 ?auto_501730 ) ) ( not ( = ?auto_501721 ?auto_501731 ) ) ( not ( = ?auto_501721 ?auto_501732 ) ) ( not ( = ?auto_501722 ?auto_501723 ) ) ( not ( = ?auto_501722 ?auto_501724 ) ) ( not ( = ?auto_501722 ?auto_501725 ) ) ( not ( = ?auto_501722 ?auto_501726 ) ) ( not ( = ?auto_501722 ?auto_501727 ) ) ( not ( = ?auto_501722 ?auto_501728 ) ) ( not ( = ?auto_501722 ?auto_501729 ) ) ( not ( = ?auto_501722 ?auto_501730 ) ) ( not ( = ?auto_501722 ?auto_501731 ) ) ( not ( = ?auto_501722 ?auto_501732 ) ) ( not ( = ?auto_501723 ?auto_501724 ) ) ( not ( = ?auto_501723 ?auto_501725 ) ) ( not ( = ?auto_501723 ?auto_501726 ) ) ( not ( = ?auto_501723 ?auto_501727 ) ) ( not ( = ?auto_501723 ?auto_501728 ) ) ( not ( = ?auto_501723 ?auto_501729 ) ) ( not ( = ?auto_501723 ?auto_501730 ) ) ( not ( = ?auto_501723 ?auto_501731 ) ) ( not ( = ?auto_501723 ?auto_501732 ) ) ( not ( = ?auto_501724 ?auto_501725 ) ) ( not ( = ?auto_501724 ?auto_501726 ) ) ( not ( = ?auto_501724 ?auto_501727 ) ) ( not ( = ?auto_501724 ?auto_501728 ) ) ( not ( = ?auto_501724 ?auto_501729 ) ) ( not ( = ?auto_501724 ?auto_501730 ) ) ( not ( = ?auto_501724 ?auto_501731 ) ) ( not ( = ?auto_501724 ?auto_501732 ) ) ( not ( = ?auto_501725 ?auto_501726 ) ) ( not ( = ?auto_501725 ?auto_501727 ) ) ( not ( = ?auto_501725 ?auto_501728 ) ) ( not ( = ?auto_501725 ?auto_501729 ) ) ( not ( = ?auto_501725 ?auto_501730 ) ) ( not ( = ?auto_501725 ?auto_501731 ) ) ( not ( = ?auto_501725 ?auto_501732 ) ) ( not ( = ?auto_501726 ?auto_501727 ) ) ( not ( = ?auto_501726 ?auto_501728 ) ) ( not ( = ?auto_501726 ?auto_501729 ) ) ( not ( = ?auto_501726 ?auto_501730 ) ) ( not ( = ?auto_501726 ?auto_501731 ) ) ( not ( = ?auto_501726 ?auto_501732 ) ) ( not ( = ?auto_501727 ?auto_501728 ) ) ( not ( = ?auto_501727 ?auto_501729 ) ) ( not ( = ?auto_501727 ?auto_501730 ) ) ( not ( = ?auto_501727 ?auto_501731 ) ) ( not ( = ?auto_501727 ?auto_501732 ) ) ( not ( = ?auto_501728 ?auto_501729 ) ) ( not ( = ?auto_501728 ?auto_501730 ) ) ( not ( = ?auto_501728 ?auto_501731 ) ) ( not ( = ?auto_501728 ?auto_501732 ) ) ( not ( = ?auto_501729 ?auto_501730 ) ) ( not ( = ?auto_501729 ?auto_501731 ) ) ( not ( = ?auto_501729 ?auto_501732 ) ) ( not ( = ?auto_501730 ?auto_501731 ) ) ( not ( = ?auto_501730 ?auto_501732 ) ) ( not ( = ?auto_501731 ?auto_501732 ) ) ( ON ?auto_501730 ?auto_501731 ) ( ON ?auto_501729 ?auto_501730 ) ( CLEAR ?auto_501727 ) ( ON ?auto_501728 ?auto_501729 ) ( CLEAR ?auto_501728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_501716 ?auto_501717 ?auto_501718 ?auto_501719 ?auto_501720 ?auto_501721 ?auto_501722 ?auto_501723 ?auto_501724 ?auto_501725 ?auto_501726 ?auto_501727 ?auto_501728 )
      ( MAKE-16PILE ?auto_501716 ?auto_501717 ?auto_501718 ?auto_501719 ?auto_501720 ?auto_501721 ?auto_501722 ?auto_501723 ?auto_501724 ?auto_501725 ?auto_501726 ?auto_501727 ?auto_501728 ?auto_501729 ?auto_501730 ?auto_501731 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501749 - BLOCK
      ?auto_501750 - BLOCK
      ?auto_501751 - BLOCK
      ?auto_501752 - BLOCK
      ?auto_501753 - BLOCK
      ?auto_501754 - BLOCK
      ?auto_501755 - BLOCK
      ?auto_501756 - BLOCK
      ?auto_501757 - BLOCK
      ?auto_501758 - BLOCK
      ?auto_501759 - BLOCK
      ?auto_501760 - BLOCK
      ?auto_501761 - BLOCK
      ?auto_501762 - BLOCK
      ?auto_501763 - BLOCK
      ?auto_501764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501764 ) ( ON-TABLE ?auto_501749 ) ( ON ?auto_501750 ?auto_501749 ) ( ON ?auto_501751 ?auto_501750 ) ( ON ?auto_501752 ?auto_501751 ) ( ON ?auto_501753 ?auto_501752 ) ( ON ?auto_501754 ?auto_501753 ) ( ON ?auto_501755 ?auto_501754 ) ( ON ?auto_501756 ?auto_501755 ) ( ON ?auto_501757 ?auto_501756 ) ( ON ?auto_501758 ?auto_501757 ) ( ON ?auto_501759 ?auto_501758 ) ( ON ?auto_501760 ?auto_501759 ) ( not ( = ?auto_501749 ?auto_501750 ) ) ( not ( = ?auto_501749 ?auto_501751 ) ) ( not ( = ?auto_501749 ?auto_501752 ) ) ( not ( = ?auto_501749 ?auto_501753 ) ) ( not ( = ?auto_501749 ?auto_501754 ) ) ( not ( = ?auto_501749 ?auto_501755 ) ) ( not ( = ?auto_501749 ?auto_501756 ) ) ( not ( = ?auto_501749 ?auto_501757 ) ) ( not ( = ?auto_501749 ?auto_501758 ) ) ( not ( = ?auto_501749 ?auto_501759 ) ) ( not ( = ?auto_501749 ?auto_501760 ) ) ( not ( = ?auto_501749 ?auto_501761 ) ) ( not ( = ?auto_501749 ?auto_501762 ) ) ( not ( = ?auto_501749 ?auto_501763 ) ) ( not ( = ?auto_501749 ?auto_501764 ) ) ( not ( = ?auto_501750 ?auto_501751 ) ) ( not ( = ?auto_501750 ?auto_501752 ) ) ( not ( = ?auto_501750 ?auto_501753 ) ) ( not ( = ?auto_501750 ?auto_501754 ) ) ( not ( = ?auto_501750 ?auto_501755 ) ) ( not ( = ?auto_501750 ?auto_501756 ) ) ( not ( = ?auto_501750 ?auto_501757 ) ) ( not ( = ?auto_501750 ?auto_501758 ) ) ( not ( = ?auto_501750 ?auto_501759 ) ) ( not ( = ?auto_501750 ?auto_501760 ) ) ( not ( = ?auto_501750 ?auto_501761 ) ) ( not ( = ?auto_501750 ?auto_501762 ) ) ( not ( = ?auto_501750 ?auto_501763 ) ) ( not ( = ?auto_501750 ?auto_501764 ) ) ( not ( = ?auto_501751 ?auto_501752 ) ) ( not ( = ?auto_501751 ?auto_501753 ) ) ( not ( = ?auto_501751 ?auto_501754 ) ) ( not ( = ?auto_501751 ?auto_501755 ) ) ( not ( = ?auto_501751 ?auto_501756 ) ) ( not ( = ?auto_501751 ?auto_501757 ) ) ( not ( = ?auto_501751 ?auto_501758 ) ) ( not ( = ?auto_501751 ?auto_501759 ) ) ( not ( = ?auto_501751 ?auto_501760 ) ) ( not ( = ?auto_501751 ?auto_501761 ) ) ( not ( = ?auto_501751 ?auto_501762 ) ) ( not ( = ?auto_501751 ?auto_501763 ) ) ( not ( = ?auto_501751 ?auto_501764 ) ) ( not ( = ?auto_501752 ?auto_501753 ) ) ( not ( = ?auto_501752 ?auto_501754 ) ) ( not ( = ?auto_501752 ?auto_501755 ) ) ( not ( = ?auto_501752 ?auto_501756 ) ) ( not ( = ?auto_501752 ?auto_501757 ) ) ( not ( = ?auto_501752 ?auto_501758 ) ) ( not ( = ?auto_501752 ?auto_501759 ) ) ( not ( = ?auto_501752 ?auto_501760 ) ) ( not ( = ?auto_501752 ?auto_501761 ) ) ( not ( = ?auto_501752 ?auto_501762 ) ) ( not ( = ?auto_501752 ?auto_501763 ) ) ( not ( = ?auto_501752 ?auto_501764 ) ) ( not ( = ?auto_501753 ?auto_501754 ) ) ( not ( = ?auto_501753 ?auto_501755 ) ) ( not ( = ?auto_501753 ?auto_501756 ) ) ( not ( = ?auto_501753 ?auto_501757 ) ) ( not ( = ?auto_501753 ?auto_501758 ) ) ( not ( = ?auto_501753 ?auto_501759 ) ) ( not ( = ?auto_501753 ?auto_501760 ) ) ( not ( = ?auto_501753 ?auto_501761 ) ) ( not ( = ?auto_501753 ?auto_501762 ) ) ( not ( = ?auto_501753 ?auto_501763 ) ) ( not ( = ?auto_501753 ?auto_501764 ) ) ( not ( = ?auto_501754 ?auto_501755 ) ) ( not ( = ?auto_501754 ?auto_501756 ) ) ( not ( = ?auto_501754 ?auto_501757 ) ) ( not ( = ?auto_501754 ?auto_501758 ) ) ( not ( = ?auto_501754 ?auto_501759 ) ) ( not ( = ?auto_501754 ?auto_501760 ) ) ( not ( = ?auto_501754 ?auto_501761 ) ) ( not ( = ?auto_501754 ?auto_501762 ) ) ( not ( = ?auto_501754 ?auto_501763 ) ) ( not ( = ?auto_501754 ?auto_501764 ) ) ( not ( = ?auto_501755 ?auto_501756 ) ) ( not ( = ?auto_501755 ?auto_501757 ) ) ( not ( = ?auto_501755 ?auto_501758 ) ) ( not ( = ?auto_501755 ?auto_501759 ) ) ( not ( = ?auto_501755 ?auto_501760 ) ) ( not ( = ?auto_501755 ?auto_501761 ) ) ( not ( = ?auto_501755 ?auto_501762 ) ) ( not ( = ?auto_501755 ?auto_501763 ) ) ( not ( = ?auto_501755 ?auto_501764 ) ) ( not ( = ?auto_501756 ?auto_501757 ) ) ( not ( = ?auto_501756 ?auto_501758 ) ) ( not ( = ?auto_501756 ?auto_501759 ) ) ( not ( = ?auto_501756 ?auto_501760 ) ) ( not ( = ?auto_501756 ?auto_501761 ) ) ( not ( = ?auto_501756 ?auto_501762 ) ) ( not ( = ?auto_501756 ?auto_501763 ) ) ( not ( = ?auto_501756 ?auto_501764 ) ) ( not ( = ?auto_501757 ?auto_501758 ) ) ( not ( = ?auto_501757 ?auto_501759 ) ) ( not ( = ?auto_501757 ?auto_501760 ) ) ( not ( = ?auto_501757 ?auto_501761 ) ) ( not ( = ?auto_501757 ?auto_501762 ) ) ( not ( = ?auto_501757 ?auto_501763 ) ) ( not ( = ?auto_501757 ?auto_501764 ) ) ( not ( = ?auto_501758 ?auto_501759 ) ) ( not ( = ?auto_501758 ?auto_501760 ) ) ( not ( = ?auto_501758 ?auto_501761 ) ) ( not ( = ?auto_501758 ?auto_501762 ) ) ( not ( = ?auto_501758 ?auto_501763 ) ) ( not ( = ?auto_501758 ?auto_501764 ) ) ( not ( = ?auto_501759 ?auto_501760 ) ) ( not ( = ?auto_501759 ?auto_501761 ) ) ( not ( = ?auto_501759 ?auto_501762 ) ) ( not ( = ?auto_501759 ?auto_501763 ) ) ( not ( = ?auto_501759 ?auto_501764 ) ) ( not ( = ?auto_501760 ?auto_501761 ) ) ( not ( = ?auto_501760 ?auto_501762 ) ) ( not ( = ?auto_501760 ?auto_501763 ) ) ( not ( = ?auto_501760 ?auto_501764 ) ) ( not ( = ?auto_501761 ?auto_501762 ) ) ( not ( = ?auto_501761 ?auto_501763 ) ) ( not ( = ?auto_501761 ?auto_501764 ) ) ( not ( = ?auto_501762 ?auto_501763 ) ) ( not ( = ?auto_501762 ?auto_501764 ) ) ( not ( = ?auto_501763 ?auto_501764 ) ) ( ON ?auto_501763 ?auto_501764 ) ( ON ?auto_501762 ?auto_501763 ) ( CLEAR ?auto_501760 ) ( ON ?auto_501761 ?auto_501762 ) ( CLEAR ?auto_501761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_501749 ?auto_501750 ?auto_501751 ?auto_501752 ?auto_501753 ?auto_501754 ?auto_501755 ?auto_501756 ?auto_501757 ?auto_501758 ?auto_501759 ?auto_501760 ?auto_501761 )
      ( MAKE-16PILE ?auto_501749 ?auto_501750 ?auto_501751 ?auto_501752 ?auto_501753 ?auto_501754 ?auto_501755 ?auto_501756 ?auto_501757 ?auto_501758 ?auto_501759 ?auto_501760 ?auto_501761 ?auto_501762 ?auto_501763 ?auto_501764 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501781 - BLOCK
      ?auto_501782 - BLOCK
      ?auto_501783 - BLOCK
      ?auto_501784 - BLOCK
      ?auto_501785 - BLOCK
      ?auto_501786 - BLOCK
      ?auto_501787 - BLOCK
      ?auto_501788 - BLOCK
      ?auto_501789 - BLOCK
      ?auto_501790 - BLOCK
      ?auto_501791 - BLOCK
      ?auto_501792 - BLOCK
      ?auto_501793 - BLOCK
      ?auto_501794 - BLOCK
      ?auto_501795 - BLOCK
      ?auto_501796 - BLOCK
    )
    :vars
    (
      ?auto_501797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501796 ?auto_501797 ) ( ON-TABLE ?auto_501781 ) ( ON ?auto_501782 ?auto_501781 ) ( ON ?auto_501783 ?auto_501782 ) ( ON ?auto_501784 ?auto_501783 ) ( ON ?auto_501785 ?auto_501784 ) ( ON ?auto_501786 ?auto_501785 ) ( ON ?auto_501787 ?auto_501786 ) ( ON ?auto_501788 ?auto_501787 ) ( ON ?auto_501789 ?auto_501788 ) ( ON ?auto_501790 ?auto_501789 ) ( ON ?auto_501791 ?auto_501790 ) ( not ( = ?auto_501781 ?auto_501782 ) ) ( not ( = ?auto_501781 ?auto_501783 ) ) ( not ( = ?auto_501781 ?auto_501784 ) ) ( not ( = ?auto_501781 ?auto_501785 ) ) ( not ( = ?auto_501781 ?auto_501786 ) ) ( not ( = ?auto_501781 ?auto_501787 ) ) ( not ( = ?auto_501781 ?auto_501788 ) ) ( not ( = ?auto_501781 ?auto_501789 ) ) ( not ( = ?auto_501781 ?auto_501790 ) ) ( not ( = ?auto_501781 ?auto_501791 ) ) ( not ( = ?auto_501781 ?auto_501792 ) ) ( not ( = ?auto_501781 ?auto_501793 ) ) ( not ( = ?auto_501781 ?auto_501794 ) ) ( not ( = ?auto_501781 ?auto_501795 ) ) ( not ( = ?auto_501781 ?auto_501796 ) ) ( not ( = ?auto_501781 ?auto_501797 ) ) ( not ( = ?auto_501782 ?auto_501783 ) ) ( not ( = ?auto_501782 ?auto_501784 ) ) ( not ( = ?auto_501782 ?auto_501785 ) ) ( not ( = ?auto_501782 ?auto_501786 ) ) ( not ( = ?auto_501782 ?auto_501787 ) ) ( not ( = ?auto_501782 ?auto_501788 ) ) ( not ( = ?auto_501782 ?auto_501789 ) ) ( not ( = ?auto_501782 ?auto_501790 ) ) ( not ( = ?auto_501782 ?auto_501791 ) ) ( not ( = ?auto_501782 ?auto_501792 ) ) ( not ( = ?auto_501782 ?auto_501793 ) ) ( not ( = ?auto_501782 ?auto_501794 ) ) ( not ( = ?auto_501782 ?auto_501795 ) ) ( not ( = ?auto_501782 ?auto_501796 ) ) ( not ( = ?auto_501782 ?auto_501797 ) ) ( not ( = ?auto_501783 ?auto_501784 ) ) ( not ( = ?auto_501783 ?auto_501785 ) ) ( not ( = ?auto_501783 ?auto_501786 ) ) ( not ( = ?auto_501783 ?auto_501787 ) ) ( not ( = ?auto_501783 ?auto_501788 ) ) ( not ( = ?auto_501783 ?auto_501789 ) ) ( not ( = ?auto_501783 ?auto_501790 ) ) ( not ( = ?auto_501783 ?auto_501791 ) ) ( not ( = ?auto_501783 ?auto_501792 ) ) ( not ( = ?auto_501783 ?auto_501793 ) ) ( not ( = ?auto_501783 ?auto_501794 ) ) ( not ( = ?auto_501783 ?auto_501795 ) ) ( not ( = ?auto_501783 ?auto_501796 ) ) ( not ( = ?auto_501783 ?auto_501797 ) ) ( not ( = ?auto_501784 ?auto_501785 ) ) ( not ( = ?auto_501784 ?auto_501786 ) ) ( not ( = ?auto_501784 ?auto_501787 ) ) ( not ( = ?auto_501784 ?auto_501788 ) ) ( not ( = ?auto_501784 ?auto_501789 ) ) ( not ( = ?auto_501784 ?auto_501790 ) ) ( not ( = ?auto_501784 ?auto_501791 ) ) ( not ( = ?auto_501784 ?auto_501792 ) ) ( not ( = ?auto_501784 ?auto_501793 ) ) ( not ( = ?auto_501784 ?auto_501794 ) ) ( not ( = ?auto_501784 ?auto_501795 ) ) ( not ( = ?auto_501784 ?auto_501796 ) ) ( not ( = ?auto_501784 ?auto_501797 ) ) ( not ( = ?auto_501785 ?auto_501786 ) ) ( not ( = ?auto_501785 ?auto_501787 ) ) ( not ( = ?auto_501785 ?auto_501788 ) ) ( not ( = ?auto_501785 ?auto_501789 ) ) ( not ( = ?auto_501785 ?auto_501790 ) ) ( not ( = ?auto_501785 ?auto_501791 ) ) ( not ( = ?auto_501785 ?auto_501792 ) ) ( not ( = ?auto_501785 ?auto_501793 ) ) ( not ( = ?auto_501785 ?auto_501794 ) ) ( not ( = ?auto_501785 ?auto_501795 ) ) ( not ( = ?auto_501785 ?auto_501796 ) ) ( not ( = ?auto_501785 ?auto_501797 ) ) ( not ( = ?auto_501786 ?auto_501787 ) ) ( not ( = ?auto_501786 ?auto_501788 ) ) ( not ( = ?auto_501786 ?auto_501789 ) ) ( not ( = ?auto_501786 ?auto_501790 ) ) ( not ( = ?auto_501786 ?auto_501791 ) ) ( not ( = ?auto_501786 ?auto_501792 ) ) ( not ( = ?auto_501786 ?auto_501793 ) ) ( not ( = ?auto_501786 ?auto_501794 ) ) ( not ( = ?auto_501786 ?auto_501795 ) ) ( not ( = ?auto_501786 ?auto_501796 ) ) ( not ( = ?auto_501786 ?auto_501797 ) ) ( not ( = ?auto_501787 ?auto_501788 ) ) ( not ( = ?auto_501787 ?auto_501789 ) ) ( not ( = ?auto_501787 ?auto_501790 ) ) ( not ( = ?auto_501787 ?auto_501791 ) ) ( not ( = ?auto_501787 ?auto_501792 ) ) ( not ( = ?auto_501787 ?auto_501793 ) ) ( not ( = ?auto_501787 ?auto_501794 ) ) ( not ( = ?auto_501787 ?auto_501795 ) ) ( not ( = ?auto_501787 ?auto_501796 ) ) ( not ( = ?auto_501787 ?auto_501797 ) ) ( not ( = ?auto_501788 ?auto_501789 ) ) ( not ( = ?auto_501788 ?auto_501790 ) ) ( not ( = ?auto_501788 ?auto_501791 ) ) ( not ( = ?auto_501788 ?auto_501792 ) ) ( not ( = ?auto_501788 ?auto_501793 ) ) ( not ( = ?auto_501788 ?auto_501794 ) ) ( not ( = ?auto_501788 ?auto_501795 ) ) ( not ( = ?auto_501788 ?auto_501796 ) ) ( not ( = ?auto_501788 ?auto_501797 ) ) ( not ( = ?auto_501789 ?auto_501790 ) ) ( not ( = ?auto_501789 ?auto_501791 ) ) ( not ( = ?auto_501789 ?auto_501792 ) ) ( not ( = ?auto_501789 ?auto_501793 ) ) ( not ( = ?auto_501789 ?auto_501794 ) ) ( not ( = ?auto_501789 ?auto_501795 ) ) ( not ( = ?auto_501789 ?auto_501796 ) ) ( not ( = ?auto_501789 ?auto_501797 ) ) ( not ( = ?auto_501790 ?auto_501791 ) ) ( not ( = ?auto_501790 ?auto_501792 ) ) ( not ( = ?auto_501790 ?auto_501793 ) ) ( not ( = ?auto_501790 ?auto_501794 ) ) ( not ( = ?auto_501790 ?auto_501795 ) ) ( not ( = ?auto_501790 ?auto_501796 ) ) ( not ( = ?auto_501790 ?auto_501797 ) ) ( not ( = ?auto_501791 ?auto_501792 ) ) ( not ( = ?auto_501791 ?auto_501793 ) ) ( not ( = ?auto_501791 ?auto_501794 ) ) ( not ( = ?auto_501791 ?auto_501795 ) ) ( not ( = ?auto_501791 ?auto_501796 ) ) ( not ( = ?auto_501791 ?auto_501797 ) ) ( not ( = ?auto_501792 ?auto_501793 ) ) ( not ( = ?auto_501792 ?auto_501794 ) ) ( not ( = ?auto_501792 ?auto_501795 ) ) ( not ( = ?auto_501792 ?auto_501796 ) ) ( not ( = ?auto_501792 ?auto_501797 ) ) ( not ( = ?auto_501793 ?auto_501794 ) ) ( not ( = ?auto_501793 ?auto_501795 ) ) ( not ( = ?auto_501793 ?auto_501796 ) ) ( not ( = ?auto_501793 ?auto_501797 ) ) ( not ( = ?auto_501794 ?auto_501795 ) ) ( not ( = ?auto_501794 ?auto_501796 ) ) ( not ( = ?auto_501794 ?auto_501797 ) ) ( not ( = ?auto_501795 ?auto_501796 ) ) ( not ( = ?auto_501795 ?auto_501797 ) ) ( not ( = ?auto_501796 ?auto_501797 ) ) ( ON ?auto_501795 ?auto_501796 ) ( ON ?auto_501794 ?auto_501795 ) ( ON ?auto_501793 ?auto_501794 ) ( CLEAR ?auto_501791 ) ( ON ?auto_501792 ?auto_501793 ) ( CLEAR ?auto_501792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_501781 ?auto_501782 ?auto_501783 ?auto_501784 ?auto_501785 ?auto_501786 ?auto_501787 ?auto_501788 ?auto_501789 ?auto_501790 ?auto_501791 ?auto_501792 )
      ( MAKE-16PILE ?auto_501781 ?auto_501782 ?auto_501783 ?auto_501784 ?auto_501785 ?auto_501786 ?auto_501787 ?auto_501788 ?auto_501789 ?auto_501790 ?auto_501791 ?auto_501792 ?auto_501793 ?auto_501794 ?auto_501795 ?auto_501796 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501814 - BLOCK
      ?auto_501815 - BLOCK
      ?auto_501816 - BLOCK
      ?auto_501817 - BLOCK
      ?auto_501818 - BLOCK
      ?auto_501819 - BLOCK
      ?auto_501820 - BLOCK
      ?auto_501821 - BLOCK
      ?auto_501822 - BLOCK
      ?auto_501823 - BLOCK
      ?auto_501824 - BLOCK
      ?auto_501825 - BLOCK
      ?auto_501826 - BLOCK
      ?auto_501827 - BLOCK
      ?auto_501828 - BLOCK
      ?auto_501829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501829 ) ( ON-TABLE ?auto_501814 ) ( ON ?auto_501815 ?auto_501814 ) ( ON ?auto_501816 ?auto_501815 ) ( ON ?auto_501817 ?auto_501816 ) ( ON ?auto_501818 ?auto_501817 ) ( ON ?auto_501819 ?auto_501818 ) ( ON ?auto_501820 ?auto_501819 ) ( ON ?auto_501821 ?auto_501820 ) ( ON ?auto_501822 ?auto_501821 ) ( ON ?auto_501823 ?auto_501822 ) ( ON ?auto_501824 ?auto_501823 ) ( not ( = ?auto_501814 ?auto_501815 ) ) ( not ( = ?auto_501814 ?auto_501816 ) ) ( not ( = ?auto_501814 ?auto_501817 ) ) ( not ( = ?auto_501814 ?auto_501818 ) ) ( not ( = ?auto_501814 ?auto_501819 ) ) ( not ( = ?auto_501814 ?auto_501820 ) ) ( not ( = ?auto_501814 ?auto_501821 ) ) ( not ( = ?auto_501814 ?auto_501822 ) ) ( not ( = ?auto_501814 ?auto_501823 ) ) ( not ( = ?auto_501814 ?auto_501824 ) ) ( not ( = ?auto_501814 ?auto_501825 ) ) ( not ( = ?auto_501814 ?auto_501826 ) ) ( not ( = ?auto_501814 ?auto_501827 ) ) ( not ( = ?auto_501814 ?auto_501828 ) ) ( not ( = ?auto_501814 ?auto_501829 ) ) ( not ( = ?auto_501815 ?auto_501816 ) ) ( not ( = ?auto_501815 ?auto_501817 ) ) ( not ( = ?auto_501815 ?auto_501818 ) ) ( not ( = ?auto_501815 ?auto_501819 ) ) ( not ( = ?auto_501815 ?auto_501820 ) ) ( not ( = ?auto_501815 ?auto_501821 ) ) ( not ( = ?auto_501815 ?auto_501822 ) ) ( not ( = ?auto_501815 ?auto_501823 ) ) ( not ( = ?auto_501815 ?auto_501824 ) ) ( not ( = ?auto_501815 ?auto_501825 ) ) ( not ( = ?auto_501815 ?auto_501826 ) ) ( not ( = ?auto_501815 ?auto_501827 ) ) ( not ( = ?auto_501815 ?auto_501828 ) ) ( not ( = ?auto_501815 ?auto_501829 ) ) ( not ( = ?auto_501816 ?auto_501817 ) ) ( not ( = ?auto_501816 ?auto_501818 ) ) ( not ( = ?auto_501816 ?auto_501819 ) ) ( not ( = ?auto_501816 ?auto_501820 ) ) ( not ( = ?auto_501816 ?auto_501821 ) ) ( not ( = ?auto_501816 ?auto_501822 ) ) ( not ( = ?auto_501816 ?auto_501823 ) ) ( not ( = ?auto_501816 ?auto_501824 ) ) ( not ( = ?auto_501816 ?auto_501825 ) ) ( not ( = ?auto_501816 ?auto_501826 ) ) ( not ( = ?auto_501816 ?auto_501827 ) ) ( not ( = ?auto_501816 ?auto_501828 ) ) ( not ( = ?auto_501816 ?auto_501829 ) ) ( not ( = ?auto_501817 ?auto_501818 ) ) ( not ( = ?auto_501817 ?auto_501819 ) ) ( not ( = ?auto_501817 ?auto_501820 ) ) ( not ( = ?auto_501817 ?auto_501821 ) ) ( not ( = ?auto_501817 ?auto_501822 ) ) ( not ( = ?auto_501817 ?auto_501823 ) ) ( not ( = ?auto_501817 ?auto_501824 ) ) ( not ( = ?auto_501817 ?auto_501825 ) ) ( not ( = ?auto_501817 ?auto_501826 ) ) ( not ( = ?auto_501817 ?auto_501827 ) ) ( not ( = ?auto_501817 ?auto_501828 ) ) ( not ( = ?auto_501817 ?auto_501829 ) ) ( not ( = ?auto_501818 ?auto_501819 ) ) ( not ( = ?auto_501818 ?auto_501820 ) ) ( not ( = ?auto_501818 ?auto_501821 ) ) ( not ( = ?auto_501818 ?auto_501822 ) ) ( not ( = ?auto_501818 ?auto_501823 ) ) ( not ( = ?auto_501818 ?auto_501824 ) ) ( not ( = ?auto_501818 ?auto_501825 ) ) ( not ( = ?auto_501818 ?auto_501826 ) ) ( not ( = ?auto_501818 ?auto_501827 ) ) ( not ( = ?auto_501818 ?auto_501828 ) ) ( not ( = ?auto_501818 ?auto_501829 ) ) ( not ( = ?auto_501819 ?auto_501820 ) ) ( not ( = ?auto_501819 ?auto_501821 ) ) ( not ( = ?auto_501819 ?auto_501822 ) ) ( not ( = ?auto_501819 ?auto_501823 ) ) ( not ( = ?auto_501819 ?auto_501824 ) ) ( not ( = ?auto_501819 ?auto_501825 ) ) ( not ( = ?auto_501819 ?auto_501826 ) ) ( not ( = ?auto_501819 ?auto_501827 ) ) ( not ( = ?auto_501819 ?auto_501828 ) ) ( not ( = ?auto_501819 ?auto_501829 ) ) ( not ( = ?auto_501820 ?auto_501821 ) ) ( not ( = ?auto_501820 ?auto_501822 ) ) ( not ( = ?auto_501820 ?auto_501823 ) ) ( not ( = ?auto_501820 ?auto_501824 ) ) ( not ( = ?auto_501820 ?auto_501825 ) ) ( not ( = ?auto_501820 ?auto_501826 ) ) ( not ( = ?auto_501820 ?auto_501827 ) ) ( not ( = ?auto_501820 ?auto_501828 ) ) ( not ( = ?auto_501820 ?auto_501829 ) ) ( not ( = ?auto_501821 ?auto_501822 ) ) ( not ( = ?auto_501821 ?auto_501823 ) ) ( not ( = ?auto_501821 ?auto_501824 ) ) ( not ( = ?auto_501821 ?auto_501825 ) ) ( not ( = ?auto_501821 ?auto_501826 ) ) ( not ( = ?auto_501821 ?auto_501827 ) ) ( not ( = ?auto_501821 ?auto_501828 ) ) ( not ( = ?auto_501821 ?auto_501829 ) ) ( not ( = ?auto_501822 ?auto_501823 ) ) ( not ( = ?auto_501822 ?auto_501824 ) ) ( not ( = ?auto_501822 ?auto_501825 ) ) ( not ( = ?auto_501822 ?auto_501826 ) ) ( not ( = ?auto_501822 ?auto_501827 ) ) ( not ( = ?auto_501822 ?auto_501828 ) ) ( not ( = ?auto_501822 ?auto_501829 ) ) ( not ( = ?auto_501823 ?auto_501824 ) ) ( not ( = ?auto_501823 ?auto_501825 ) ) ( not ( = ?auto_501823 ?auto_501826 ) ) ( not ( = ?auto_501823 ?auto_501827 ) ) ( not ( = ?auto_501823 ?auto_501828 ) ) ( not ( = ?auto_501823 ?auto_501829 ) ) ( not ( = ?auto_501824 ?auto_501825 ) ) ( not ( = ?auto_501824 ?auto_501826 ) ) ( not ( = ?auto_501824 ?auto_501827 ) ) ( not ( = ?auto_501824 ?auto_501828 ) ) ( not ( = ?auto_501824 ?auto_501829 ) ) ( not ( = ?auto_501825 ?auto_501826 ) ) ( not ( = ?auto_501825 ?auto_501827 ) ) ( not ( = ?auto_501825 ?auto_501828 ) ) ( not ( = ?auto_501825 ?auto_501829 ) ) ( not ( = ?auto_501826 ?auto_501827 ) ) ( not ( = ?auto_501826 ?auto_501828 ) ) ( not ( = ?auto_501826 ?auto_501829 ) ) ( not ( = ?auto_501827 ?auto_501828 ) ) ( not ( = ?auto_501827 ?auto_501829 ) ) ( not ( = ?auto_501828 ?auto_501829 ) ) ( ON ?auto_501828 ?auto_501829 ) ( ON ?auto_501827 ?auto_501828 ) ( ON ?auto_501826 ?auto_501827 ) ( CLEAR ?auto_501824 ) ( ON ?auto_501825 ?auto_501826 ) ( CLEAR ?auto_501825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_501814 ?auto_501815 ?auto_501816 ?auto_501817 ?auto_501818 ?auto_501819 ?auto_501820 ?auto_501821 ?auto_501822 ?auto_501823 ?auto_501824 ?auto_501825 )
      ( MAKE-16PILE ?auto_501814 ?auto_501815 ?auto_501816 ?auto_501817 ?auto_501818 ?auto_501819 ?auto_501820 ?auto_501821 ?auto_501822 ?auto_501823 ?auto_501824 ?auto_501825 ?auto_501826 ?auto_501827 ?auto_501828 ?auto_501829 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501846 - BLOCK
      ?auto_501847 - BLOCK
      ?auto_501848 - BLOCK
      ?auto_501849 - BLOCK
      ?auto_501850 - BLOCK
      ?auto_501851 - BLOCK
      ?auto_501852 - BLOCK
      ?auto_501853 - BLOCK
      ?auto_501854 - BLOCK
      ?auto_501855 - BLOCK
      ?auto_501856 - BLOCK
      ?auto_501857 - BLOCK
      ?auto_501858 - BLOCK
      ?auto_501859 - BLOCK
      ?auto_501860 - BLOCK
      ?auto_501861 - BLOCK
    )
    :vars
    (
      ?auto_501862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501861 ?auto_501862 ) ( ON-TABLE ?auto_501846 ) ( ON ?auto_501847 ?auto_501846 ) ( ON ?auto_501848 ?auto_501847 ) ( ON ?auto_501849 ?auto_501848 ) ( ON ?auto_501850 ?auto_501849 ) ( ON ?auto_501851 ?auto_501850 ) ( ON ?auto_501852 ?auto_501851 ) ( ON ?auto_501853 ?auto_501852 ) ( ON ?auto_501854 ?auto_501853 ) ( ON ?auto_501855 ?auto_501854 ) ( not ( = ?auto_501846 ?auto_501847 ) ) ( not ( = ?auto_501846 ?auto_501848 ) ) ( not ( = ?auto_501846 ?auto_501849 ) ) ( not ( = ?auto_501846 ?auto_501850 ) ) ( not ( = ?auto_501846 ?auto_501851 ) ) ( not ( = ?auto_501846 ?auto_501852 ) ) ( not ( = ?auto_501846 ?auto_501853 ) ) ( not ( = ?auto_501846 ?auto_501854 ) ) ( not ( = ?auto_501846 ?auto_501855 ) ) ( not ( = ?auto_501846 ?auto_501856 ) ) ( not ( = ?auto_501846 ?auto_501857 ) ) ( not ( = ?auto_501846 ?auto_501858 ) ) ( not ( = ?auto_501846 ?auto_501859 ) ) ( not ( = ?auto_501846 ?auto_501860 ) ) ( not ( = ?auto_501846 ?auto_501861 ) ) ( not ( = ?auto_501846 ?auto_501862 ) ) ( not ( = ?auto_501847 ?auto_501848 ) ) ( not ( = ?auto_501847 ?auto_501849 ) ) ( not ( = ?auto_501847 ?auto_501850 ) ) ( not ( = ?auto_501847 ?auto_501851 ) ) ( not ( = ?auto_501847 ?auto_501852 ) ) ( not ( = ?auto_501847 ?auto_501853 ) ) ( not ( = ?auto_501847 ?auto_501854 ) ) ( not ( = ?auto_501847 ?auto_501855 ) ) ( not ( = ?auto_501847 ?auto_501856 ) ) ( not ( = ?auto_501847 ?auto_501857 ) ) ( not ( = ?auto_501847 ?auto_501858 ) ) ( not ( = ?auto_501847 ?auto_501859 ) ) ( not ( = ?auto_501847 ?auto_501860 ) ) ( not ( = ?auto_501847 ?auto_501861 ) ) ( not ( = ?auto_501847 ?auto_501862 ) ) ( not ( = ?auto_501848 ?auto_501849 ) ) ( not ( = ?auto_501848 ?auto_501850 ) ) ( not ( = ?auto_501848 ?auto_501851 ) ) ( not ( = ?auto_501848 ?auto_501852 ) ) ( not ( = ?auto_501848 ?auto_501853 ) ) ( not ( = ?auto_501848 ?auto_501854 ) ) ( not ( = ?auto_501848 ?auto_501855 ) ) ( not ( = ?auto_501848 ?auto_501856 ) ) ( not ( = ?auto_501848 ?auto_501857 ) ) ( not ( = ?auto_501848 ?auto_501858 ) ) ( not ( = ?auto_501848 ?auto_501859 ) ) ( not ( = ?auto_501848 ?auto_501860 ) ) ( not ( = ?auto_501848 ?auto_501861 ) ) ( not ( = ?auto_501848 ?auto_501862 ) ) ( not ( = ?auto_501849 ?auto_501850 ) ) ( not ( = ?auto_501849 ?auto_501851 ) ) ( not ( = ?auto_501849 ?auto_501852 ) ) ( not ( = ?auto_501849 ?auto_501853 ) ) ( not ( = ?auto_501849 ?auto_501854 ) ) ( not ( = ?auto_501849 ?auto_501855 ) ) ( not ( = ?auto_501849 ?auto_501856 ) ) ( not ( = ?auto_501849 ?auto_501857 ) ) ( not ( = ?auto_501849 ?auto_501858 ) ) ( not ( = ?auto_501849 ?auto_501859 ) ) ( not ( = ?auto_501849 ?auto_501860 ) ) ( not ( = ?auto_501849 ?auto_501861 ) ) ( not ( = ?auto_501849 ?auto_501862 ) ) ( not ( = ?auto_501850 ?auto_501851 ) ) ( not ( = ?auto_501850 ?auto_501852 ) ) ( not ( = ?auto_501850 ?auto_501853 ) ) ( not ( = ?auto_501850 ?auto_501854 ) ) ( not ( = ?auto_501850 ?auto_501855 ) ) ( not ( = ?auto_501850 ?auto_501856 ) ) ( not ( = ?auto_501850 ?auto_501857 ) ) ( not ( = ?auto_501850 ?auto_501858 ) ) ( not ( = ?auto_501850 ?auto_501859 ) ) ( not ( = ?auto_501850 ?auto_501860 ) ) ( not ( = ?auto_501850 ?auto_501861 ) ) ( not ( = ?auto_501850 ?auto_501862 ) ) ( not ( = ?auto_501851 ?auto_501852 ) ) ( not ( = ?auto_501851 ?auto_501853 ) ) ( not ( = ?auto_501851 ?auto_501854 ) ) ( not ( = ?auto_501851 ?auto_501855 ) ) ( not ( = ?auto_501851 ?auto_501856 ) ) ( not ( = ?auto_501851 ?auto_501857 ) ) ( not ( = ?auto_501851 ?auto_501858 ) ) ( not ( = ?auto_501851 ?auto_501859 ) ) ( not ( = ?auto_501851 ?auto_501860 ) ) ( not ( = ?auto_501851 ?auto_501861 ) ) ( not ( = ?auto_501851 ?auto_501862 ) ) ( not ( = ?auto_501852 ?auto_501853 ) ) ( not ( = ?auto_501852 ?auto_501854 ) ) ( not ( = ?auto_501852 ?auto_501855 ) ) ( not ( = ?auto_501852 ?auto_501856 ) ) ( not ( = ?auto_501852 ?auto_501857 ) ) ( not ( = ?auto_501852 ?auto_501858 ) ) ( not ( = ?auto_501852 ?auto_501859 ) ) ( not ( = ?auto_501852 ?auto_501860 ) ) ( not ( = ?auto_501852 ?auto_501861 ) ) ( not ( = ?auto_501852 ?auto_501862 ) ) ( not ( = ?auto_501853 ?auto_501854 ) ) ( not ( = ?auto_501853 ?auto_501855 ) ) ( not ( = ?auto_501853 ?auto_501856 ) ) ( not ( = ?auto_501853 ?auto_501857 ) ) ( not ( = ?auto_501853 ?auto_501858 ) ) ( not ( = ?auto_501853 ?auto_501859 ) ) ( not ( = ?auto_501853 ?auto_501860 ) ) ( not ( = ?auto_501853 ?auto_501861 ) ) ( not ( = ?auto_501853 ?auto_501862 ) ) ( not ( = ?auto_501854 ?auto_501855 ) ) ( not ( = ?auto_501854 ?auto_501856 ) ) ( not ( = ?auto_501854 ?auto_501857 ) ) ( not ( = ?auto_501854 ?auto_501858 ) ) ( not ( = ?auto_501854 ?auto_501859 ) ) ( not ( = ?auto_501854 ?auto_501860 ) ) ( not ( = ?auto_501854 ?auto_501861 ) ) ( not ( = ?auto_501854 ?auto_501862 ) ) ( not ( = ?auto_501855 ?auto_501856 ) ) ( not ( = ?auto_501855 ?auto_501857 ) ) ( not ( = ?auto_501855 ?auto_501858 ) ) ( not ( = ?auto_501855 ?auto_501859 ) ) ( not ( = ?auto_501855 ?auto_501860 ) ) ( not ( = ?auto_501855 ?auto_501861 ) ) ( not ( = ?auto_501855 ?auto_501862 ) ) ( not ( = ?auto_501856 ?auto_501857 ) ) ( not ( = ?auto_501856 ?auto_501858 ) ) ( not ( = ?auto_501856 ?auto_501859 ) ) ( not ( = ?auto_501856 ?auto_501860 ) ) ( not ( = ?auto_501856 ?auto_501861 ) ) ( not ( = ?auto_501856 ?auto_501862 ) ) ( not ( = ?auto_501857 ?auto_501858 ) ) ( not ( = ?auto_501857 ?auto_501859 ) ) ( not ( = ?auto_501857 ?auto_501860 ) ) ( not ( = ?auto_501857 ?auto_501861 ) ) ( not ( = ?auto_501857 ?auto_501862 ) ) ( not ( = ?auto_501858 ?auto_501859 ) ) ( not ( = ?auto_501858 ?auto_501860 ) ) ( not ( = ?auto_501858 ?auto_501861 ) ) ( not ( = ?auto_501858 ?auto_501862 ) ) ( not ( = ?auto_501859 ?auto_501860 ) ) ( not ( = ?auto_501859 ?auto_501861 ) ) ( not ( = ?auto_501859 ?auto_501862 ) ) ( not ( = ?auto_501860 ?auto_501861 ) ) ( not ( = ?auto_501860 ?auto_501862 ) ) ( not ( = ?auto_501861 ?auto_501862 ) ) ( ON ?auto_501860 ?auto_501861 ) ( ON ?auto_501859 ?auto_501860 ) ( ON ?auto_501858 ?auto_501859 ) ( ON ?auto_501857 ?auto_501858 ) ( CLEAR ?auto_501855 ) ( ON ?auto_501856 ?auto_501857 ) ( CLEAR ?auto_501856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_501846 ?auto_501847 ?auto_501848 ?auto_501849 ?auto_501850 ?auto_501851 ?auto_501852 ?auto_501853 ?auto_501854 ?auto_501855 ?auto_501856 )
      ( MAKE-16PILE ?auto_501846 ?auto_501847 ?auto_501848 ?auto_501849 ?auto_501850 ?auto_501851 ?auto_501852 ?auto_501853 ?auto_501854 ?auto_501855 ?auto_501856 ?auto_501857 ?auto_501858 ?auto_501859 ?auto_501860 ?auto_501861 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501879 - BLOCK
      ?auto_501880 - BLOCK
      ?auto_501881 - BLOCK
      ?auto_501882 - BLOCK
      ?auto_501883 - BLOCK
      ?auto_501884 - BLOCK
      ?auto_501885 - BLOCK
      ?auto_501886 - BLOCK
      ?auto_501887 - BLOCK
      ?auto_501888 - BLOCK
      ?auto_501889 - BLOCK
      ?auto_501890 - BLOCK
      ?auto_501891 - BLOCK
      ?auto_501892 - BLOCK
      ?auto_501893 - BLOCK
      ?auto_501894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501894 ) ( ON-TABLE ?auto_501879 ) ( ON ?auto_501880 ?auto_501879 ) ( ON ?auto_501881 ?auto_501880 ) ( ON ?auto_501882 ?auto_501881 ) ( ON ?auto_501883 ?auto_501882 ) ( ON ?auto_501884 ?auto_501883 ) ( ON ?auto_501885 ?auto_501884 ) ( ON ?auto_501886 ?auto_501885 ) ( ON ?auto_501887 ?auto_501886 ) ( ON ?auto_501888 ?auto_501887 ) ( not ( = ?auto_501879 ?auto_501880 ) ) ( not ( = ?auto_501879 ?auto_501881 ) ) ( not ( = ?auto_501879 ?auto_501882 ) ) ( not ( = ?auto_501879 ?auto_501883 ) ) ( not ( = ?auto_501879 ?auto_501884 ) ) ( not ( = ?auto_501879 ?auto_501885 ) ) ( not ( = ?auto_501879 ?auto_501886 ) ) ( not ( = ?auto_501879 ?auto_501887 ) ) ( not ( = ?auto_501879 ?auto_501888 ) ) ( not ( = ?auto_501879 ?auto_501889 ) ) ( not ( = ?auto_501879 ?auto_501890 ) ) ( not ( = ?auto_501879 ?auto_501891 ) ) ( not ( = ?auto_501879 ?auto_501892 ) ) ( not ( = ?auto_501879 ?auto_501893 ) ) ( not ( = ?auto_501879 ?auto_501894 ) ) ( not ( = ?auto_501880 ?auto_501881 ) ) ( not ( = ?auto_501880 ?auto_501882 ) ) ( not ( = ?auto_501880 ?auto_501883 ) ) ( not ( = ?auto_501880 ?auto_501884 ) ) ( not ( = ?auto_501880 ?auto_501885 ) ) ( not ( = ?auto_501880 ?auto_501886 ) ) ( not ( = ?auto_501880 ?auto_501887 ) ) ( not ( = ?auto_501880 ?auto_501888 ) ) ( not ( = ?auto_501880 ?auto_501889 ) ) ( not ( = ?auto_501880 ?auto_501890 ) ) ( not ( = ?auto_501880 ?auto_501891 ) ) ( not ( = ?auto_501880 ?auto_501892 ) ) ( not ( = ?auto_501880 ?auto_501893 ) ) ( not ( = ?auto_501880 ?auto_501894 ) ) ( not ( = ?auto_501881 ?auto_501882 ) ) ( not ( = ?auto_501881 ?auto_501883 ) ) ( not ( = ?auto_501881 ?auto_501884 ) ) ( not ( = ?auto_501881 ?auto_501885 ) ) ( not ( = ?auto_501881 ?auto_501886 ) ) ( not ( = ?auto_501881 ?auto_501887 ) ) ( not ( = ?auto_501881 ?auto_501888 ) ) ( not ( = ?auto_501881 ?auto_501889 ) ) ( not ( = ?auto_501881 ?auto_501890 ) ) ( not ( = ?auto_501881 ?auto_501891 ) ) ( not ( = ?auto_501881 ?auto_501892 ) ) ( not ( = ?auto_501881 ?auto_501893 ) ) ( not ( = ?auto_501881 ?auto_501894 ) ) ( not ( = ?auto_501882 ?auto_501883 ) ) ( not ( = ?auto_501882 ?auto_501884 ) ) ( not ( = ?auto_501882 ?auto_501885 ) ) ( not ( = ?auto_501882 ?auto_501886 ) ) ( not ( = ?auto_501882 ?auto_501887 ) ) ( not ( = ?auto_501882 ?auto_501888 ) ) ( not ( = ?auto_501882 ?auto_501889 ) ) ( not ( = ?auto_501882 ?auto_501890 ) ) ( not ( = ?auto_501882 ?auto_501891 ) ) ( not ( = ?auto_501882 ?auto_501892 ) ) ( not ( = ?auto_501882 ?auto_501893 ) ) ( not ( = ?auto_501882 ?auto_501894 ) ) ( not ( = ?auto_501883 ?auto_501884 ) ) ( not ( = ?auto_501883 ?auto_501885 ) ) ( not ( = ?auto_501883 ?auto_501886 ) ) ( not ( = ?auto_501883 ?auto_501887 ) ) ( not ( = ?auto_501883 ?auto_501888 ) ) ( not ( = ?auto_501883 ?auto_501889 ) ) ( not ( = ?auto_501883 ?auto_501890 ) ) ( not ( = ?auto_501883 ?auto_501891 ) ) ( not ( = ?auto_501883 ?auto_501892 ) ) ( not ( = ?auto_501883 ?auto_501893 ) ) ( not ( = ?auto_501883 ?auto_501894 ) ) ( not ( = ?auto_501884 ?auto_501885 ) ) ( not ( = ?auto_501884 ?auto_501886 ) ) ( not ( = ?auto_501884 ?auto_501887 ) ) ( not ( = ?auto_501884 ?auto_501888 ) ) ( not ( = ?auto_501884 ?auto_501889 ) ) ( not ( = ?auto_501884 ?auto_501890 ) ) ( not ( = ?auto_501884 ?auto_501891 ) ) ( not ( = ?auto_501884 ?auto_501892 ) ) ( not ( = ?auto_501884 ?auto_501893 ) ) ( not ( = ?auto_501884 ?auto_501894 ) ) ( not ( = ?auto_501885 ?auto_501886 ) ) ( not ( = ?auto_501885 ?auto_501887 ) ) ( not ( = ?auto_501885 ?auto_501888 ) ) ( not ( = ?auto_501885 ?auto_501889 ) ) ( not ( = ?auto_501885 ?auto_501890 ) ) ( not ( = ?auto_501885 ?auto_501891 ) ) ( not ( = ?auto_501885 ?auto_501892 ) ) ( not ( = ?auto_501885 ?auto_501893 ) ) ( not ( = ?auto_501885 ?auto_501894 ) ) ( not ( = ?auto_501886 ?auto_501887 ) ) ( not ( = ?auto_501886 ?auto_501888 ) ) ( not ( = ?auto_501886 ?auto_501889 ) ) ( not ( = ?auto_501886 ?auto_501890 ) ) ( not ( = ?auto_501886 ?auto_501891 ) ) ( not ( = ?auto_501886 ?auto_501892 ) ) ( not ( = ?auto_501886 ?auto_501893 ) ) ( not ( = ?auto_501886 ?auto_501894 ) ) ( not ( = ?auto_501887 ?auto_501888 ) ) ( not ( = ?auto_501887 ?auto_501889 ) ) ( not ( = ?auto_501887 ?auto_501890 ) ) ( not ( = ?auto_501887 ?auto_501891 ) ) ( not ( = ?auto_501887 ?auto_501892 ) ) ( not ( = ?auto_501887 ?auto_501893 ) ) ( not ( = ?auto_501887 ?auto_501894 ) ) ( not ( = ?auto_501888 ?auto_501889 ) ) ( not ( = ?auto_501888 ?auto_501890 ) ) ( not ( = ?auto_501888 ?auto_501891 ) ) ( not ( = ?auto_501888 ?auto_501892 ) ) ( not ( = ?auto_501888 ?auto_501893 ) ) ( not ( = ?auto_501888 ?auto_501894 ) ) ( not ( = ?auto_501889 ?auto_501890 ) ) ( not ( = ?auto_501889 ?auto_501891 ) ) ( not ( = ?auto_501889 ?auto_501892 ) ) ( not ( = ?auto_501889 ?auto_501893 ) ) ( not ( = ?auto_501889 ?auto_501894 ) ) ( not ( = ?auto_501890 ?auto_501891 ) ) ( not ( = ?auto_501890 ?auto_501892 ) ) ( not ( = ?auto_501890 ?auto_501893 ) ) ( not ( = ?auto_501890 ?auto_501894 ) ) ( not ( = ?auto_501891 ?auto_501892 ) ) ( not ( = ?auto_501891 ?auto_501893 ) ) ( not ( = ?auto_501891 ?auto_501894 ) ) ( not ( = ?auto_501892 ?auto_501893 ) ) ( not ( = ?auto_501892 ?auto_501894 ) ) ( not ( = ?auto_501893 ?auto_501894 ) ) ( ON ?auto_501893 ?auto_501894 ) ( ON ?auto_501892 ?auto_501893 ) ( ON ?auto_501891 ?auto_501892 ) ( ON ?auto_501890 ?auto_501891 ) ( CLEAR ?auto_501888 ) ( ON ?auto_501889 ?auto_501890 ) ( CLEAR ?auto_501889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_501879 ?auto_501880 ?auto_501881 ?auto_501882 ?auto_501883 ?auto_501884 ?auto_501885 ?auto_501886 ?auto_501887 ?auto_501888 ?auto_501889 )
      ( MAKE-16PILE ?auto_501879 ?auto_501880 ?auto_501881 ?auto_501882 ?auto_501883 ?auto_501884 ?auto_501885 ?auto_501886 ?auto_501887 ?auto_501888 ?auto_501889 ?auto_501890 ?auto_501891 ?auto_501892 ?auto_501893 ?auto_501894 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501911 - BLOCK
      ?auto_501912 - BLOCK
      ?auto_501913 - BLOCK
      ?auto_501914 - BLOCK
      ?auto_501915 - BLOCK
      ?auto_501916 - BLOCK
      ?auto_501917 - BLOCK
      ?auto_501918 - BLOCK
      ?auto_501919 - BLOCK
      ?auto_501920 - BLOCK
      ?auto_501921 - BLOCK
      ?auto_501922 - BLOCK
      ?auto_501923 - BLOCK
      ?auto_501924 - BLOCK
      ?auto_501925 - BLOCK
      ?auto_501926 - BLOCK
    )
    :vars
    (
      ?auto_501927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501926 ?auto_501927 ) ( ON-TABLE ?auto_501911 ) ( ON ?auto_501912 ?auto_501911 ) ( ON ?auto_501913 ?auto_501912 ) ( ON ?auto_501914 ?auto_501913 ) ( ON ?auto_501915 ?auto_501914 ) ( ON ?auto_501916 ?auto_501915 ) ( ON ?auto_501917 ?auto_501916 ) ( ON ?auto_501918 ?auto_501917 ) ( ON ?auto_501919 ?auto_501918 ) ( not ( = ?auto_501911 ?auto_501912 ) ) ( not ( = ?auto_501911 ?auto_501913 ) ) ( not ( = ?auto_501911 ?auto_501914 ) ) ( not ( = ?auto_501911 ?auto_501915 ) ) ( not ( = ?auto_501911 ?auto_501916 ) ) ( not ( = ?auto_501911 ?auto_501917 ) ) ( not ( = ?auto_501911 ?auto_501918 ) ) ( not ( = ?auto_501911 ?auto_501919 ) ) ( not ( = ?auto_501911 ?auto_501920 ) ) ( not ( = ?auto_501911 ?auto_501921 ) ) ( not ( = ?auto_501911 ?auto_501922 ) ) ( not ( = ?auto_501911 ?auto_501923 ) ) ( not ( = ?auto_501911 ?auto_501924 ) ) ( not ( = ?auto_501911 ?auto_501925 ) ) ( not ( = ?auto_501911 ?auto_501926 ) ) ( not ( = ?auto_501911 ?auto_501927 ) ) ( not ( = ?auto_501912 ?auto_501913 ) ) ( not ( = ?auto_501912 ?auto_501914 ) ) ( not ( = ?auto_501912 ?auto_501915 ) ) ( not ( = ?auto_501912 ?auto_501916 ) ) ( not ( = ?auto_501912 ?auto_501917 ) ) ( not ( = ?auto_501912 ?auto_501918 ) ) ( not ( = ?auto_501912 ?auto_501919 ) ) ( not ( = ?auto_501912 ?auto_501920 ) ) ( not ( = ?auto_501912 ?auto_501921 ) ) ( not ( = ?auto_501912 ?auto_501922 ) ) ( not ( = ?auto_501912 ?auto_501923 ) ) ( not ( = ?auto_501912 ?auto_501924 ) ) ( not ( = ?auto_501912 ?auto_501925 ) ) ( not ( = ?auto_501912 ?auto_501926 ) ) ( not ( = ?auto_501912 ?auto_501927 ) ) ( not ( = ?auto_501913 ?auto_501914 ) ) ( not ( = ?auto_501913 ?auto_501915 ) ) ( not ( = ?auto_501913 ?auto_501916 ) ) ( not ( = ?auto_501913 ?auto_501917 ) ) ( not ( = ?auto_501913 ?auto_501918 ) ) ( not ( = ?auto_501913 ?auto_501919 ) ) ( not ( = ?auto_501913 ?auto_501920 ) ) ( not ( = ?auto_501913 ?auto_501921 ) ) ( not ( = ?auto_501913 ?auto_501922 ) ) ( not ( = ?auto_501913 ?auto_501923 ) ) ( not ( = ?auto_501913 ?auto_501924 ) ) ( not ( = ?auto_501913 ?auto_501925 ) ) ( not ( = ?auto_501913 ?auto_501926 ) ) ( not ( = ?auto_501913 ?auto_501927 ) ) ( not ( = ?auto_501914 ?auto_501915 ) ) ( not ( = ?auto_501914 ?auto_501916 ) ) ( not ( = ?auto_501914 ?auto_501917 ) ) ( not ( = ?auto_501914 ?auto_501918 ) ) ( not ( = ?auto_501914 ?auto_501919 ) ) ( not ( = ?auto_501914 ?auto_501920 ) ) ( not ( = ?auto_501914 ?auto_501921 ) ) ( not ( = ?auto_501914 ?auto_501922 ) ) ( not ( = ?auto_501914 ?auto_501923 ) ) ( not ( = ?auto_501914 ?auto_501924 ) ) ( not ( = ?auto_501914 ?auto_501925 ) ) ( not ( = ?auto_501914 ?auto_501926 ) ) ( not ( = ?auto_501914 ?auto_501927 ) ) ( not ( = ?auto_501915 ?auto_501916 ) ) ( not ( = ?auto_501915 ?auto_501917 ) ) ( not ( = ?auto_501915 ?auto_501918 ) ) ( not ( = ?auto_501915 ?auto_501919 ) ) ( not ( = ?auto_501915 ?auto_501920 ) ) ( not ( = ?auto_501915 ?auto_501921 ) ) ( not ( = ?auto_501915 ?auto_501922 ) ) ( not ( = ?auto_501915 ?auto_501923 ) ) ( not ( = ?auto_501915 ?auto_501924 ) ) ( not ( = ?auto_501915 ?auto_501925 ) ) ( not ( = ?auto_501915 ?auto_501926 ) ) ( not ( = ?auto_501915 ?auto_501927 ) ) ( not ( = ?auto_501916 ?auto_501917 ) ) ( not ( = ?auto_501916 ?auto_501918 ) ) ( not ( = ?auto_501916 ?auto_501919 ) ) ( not ( = ?auto_501916 ?auto_501920 ) ) ( not ( = ?auto_501916 ?auto_501921 ) ) ( not ( = ?auto_501916 ?auto_501922 ) ) ( not ( = ?auto_501916 ?auto_501923 ) ) ( not ( = ?auto_501916 ?auto_501924 ) ) ( not ( = ?auto_501916 ?auto_501925 ) ) ( not ( = ?auto_501916 ?auto_501926 ) ) ( not ( = ?auto_501916 ?auto_501927 ) ) ( not ( = ?auto_501917 ?auto_501918 ) ) ( not ( = ?auto_501917 ?auto_501919 ) ) ( not ( = ?auto_501917 ?auto_501920 ) ) ( not ( = ?auto_501917 ?auto_501921 ) ) ( not ( = ?auto_501917 ?auto_501922 ) ) ( not ( = ?auto_501917 ?auto_501923 ) ) ( not ( = ?auto_501917 ?auto_501924 ) ) ( not ( = ?auto_501917 ?auto_501925 ) ) ( not ( = ?auto_501917 ?auto_501926 ) ) ( not ( = ?auto_501917 ?auto_501927 ) ) ( not ( = ?auto_501918 ?auto_501919 ) ) ( not ( = ?auto_501918 ?auto_501920 ) ) ( not ( = ?auto_501918 ?auto_501921 ) ) ( not ( = ?auto_501918 ?auto_501922 ) ) ( not ( = ?auto_501918 ?auto_501923 ) ) ( not ( = ?auto_501918 ?auto_501924 ) ) ( not ( = ?auto_501918 ?auto_501925 ) ) ( not ( = ?auto_501918 ?auto_501926 ) ) ( not ( = ?auto_501918 ?auto_501927 ) ) ( not ( = ?auto_501919 ?auto_501920 ) ) ( not ( = ?auto_501919 ?auto_501921 ) ) ( not ( = ?auto_501919 ?auto_501922 ) ) ( not ( = ?auto_501919 ?auto_501923 ) ) ( not ( = ?auto_501919 ?auto_501924 ) ) ( not ( = ?auto_501919 ?auto_501925 ) ) ( not ( = ?auto_501919 ?auto_501926 ) ) ( not ( = ?auto_501919 ?auto_501927 ) ) ( not ( = ?auto_501920 ?auto_501921 ) ) ( not ( = ?auto_501920 ?auto_501922 ) ) ( not ( = ?auto_501920 ?auto_501923 ) ) ( not ( = ?auto_501920 ?auto_501924 ) ) ( not ( = ?auto_501920 ?auto_501925 ) ) ( not ( = ?auto_501920 ?auto_501926 ) ) ( not ( = ?auto_501920 ?auto_501927 ) ) ( not ( = ?auto_501921 ?auto_501922 ) ) ( not ( = ?auto_501921 ?auto_501923 ) ) ( not ( = ?auto_501921 ?auto_501924 ) ) ( not ( = ?auto_501921 ?auto_501925 ) ) ( not ( = ?auto_501921 ?auto_501926 ) ) ( not ( = ?auto_501921 ?auto_501927 ) ) ( not ( = ?auto_501922 ?auto_501923 ) ) ( not ( = ?auto_501922 ?auto_501924 ) ) ( not ( = ?auto_501922 ?auto_501925 ) ) ( not ( = ?auto_501922 ?auto_501926 ) ) ( not ( = ?auto_501922 ?auto_501927 ) ) ( not ( = ?auto_501923 ?auto_501924 ) ) ( not ( = ?auto_501923 ?auto_501925 ) ) ( not ( = ?auto_501923 ?auto_501926 ) ) ( not ( = ?auto_501923 ?auto_501927 ) ) ( not ( = ?auto_501924 ?auto_501925 ) ) ( not ( = ?auto_501924 ?auto_501926 ) ) ( not ( = ?auto_501924 ?auto_501927 ) ) ( not ( = ?auto_501925 ?auto_501926 ) ) ( not ( = ?auto_501925 ?auto_501927 ) ) ( not ( = ?auto_501926 ?auto_501927 ) ) ( ON ?auto_501925 ?auto_501926 ) ( ON ?auto_501924 ?auto_501925 ) ( ON ?auto_501923 ?auto_501924 ) ( ON ?auto_501922 ?auto_501923 ) ( ON ?auto_501921 ?auto_501922 ) ( CLEAR ?auto_501919 ) ( ON ?auto_501920 ?auto_501921 ) ( CLEAR ?auto_501920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_501911 ?auto_501912 ?auto_501913 ?auto_501914 ?auto_501915 ?auto_501916 ?auto_501917 ?auto_501918 ?auto_501919 ?auto_501920 )
      ( MAKE-16PILE ?auto_501911 ?auto_501912 ?auto_501913 ?auto_501914 ?auto_501915 ?auto_501916 ?auto_501917 ?auto_501918 ?auto_501919 ?auto_501920 ?auto_501921 ?auto_501922 ?auto_501923 ?auto_501924 ?auto_501925 ?auto_501926 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501944 - BLOCK
      ?auto_501945 - BLOCK
      ?auto_501946 - BLOCK
      ?auto_501947 - BLOCK
      ?auto_501948 - BLOCK
      ?auto_501949 - BLOCK
      ?auto_501950 - BLOCK
      ?auto_501951 - BLOCK
      ?auto_501952 - BLOCK
      ?auto_501953 - BLOCK
      ?auto_501954 - BLOCK
      ?auto_501955 - BLOCK
      ?auto_501956 - BLOCK
      ?auto_501957 - BLOCK
      ?auto_501958 - BLOCK
      ?auto_501959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_501959 ) ( ON-TABLE ?auto_501944 ) ( ON ?auto_501945 ?auto_501944 ) ( ON ?auto_501946 ?auto_501945 ) ( ON ?auto_501947 ?auto_501946 ) ( ON ?auto_501948 ?auto_501947 ) ( ON ?auto_501949 ?auto_501948 ) ( ON ?auto_501950 ?auto_501949 ) ( ON ?auto_501951 ?auto_501950 ) ( ON ?auto_501952 ?auto_501951 ) ( not ( = ?auto_501944 ?auto_501945 ) ) ( not ( = ?auto_501944 ?auto_501946 ) ) ( not ( = ?auto_501944 ?auto_501947 ) ) ( not ( = ?auto_501944 ?auto_501948 ) ) ( not ( = ?auto_501944 ?auto_501949 ) ) ( not ( = ?auto_501944 ?auto_501950 ) ) ( not ( = ?auto_501944 ?auto_501951 ) ) ( not ( = ?auto_501944 ?auto_501952 ) ) ( not ( = ?auto_501944 ?auto_501953 ) ) ( not ( = ?auto_501944 ?auto_501954 ) ) ( not ( = ?auto_501944 ?auto_501955 ) ) ( not ( = ?auto_501944 ?auto_501956 ) ) ( not ( = ?auto_501944 ?auto_501957 ) ) ( not ( = ?auto_501944 ?auto_501958 ) ) ( not ( = ?auto_501944 ?auto_501959 ) ) ( not ( = ?auto_501945 ?auto_501946 ) ) ( not ( = ?auto_501945 ?auto_501947 ) ) ( not ( = ?auto_501945 ?auto_501948 ) ) ( not ( = ?auto_501945 ?auto_501949 ) ) ( not ( = ?auto_501945 ?auto_501950 ) ) ( not ( = ?auto_501945 ?auto_501951 ) ) ( not ( = ?auto_501945 ?auto_501952 ) ) ( not ( = ?auto_501945 ?auto_501953 ) ) ( not ( = ?auto_501945 ?auto_501954 ) ) ( not ( = ?auto_501945 ?auto_501955 ) ) ( not ( = ?auto_501945 ?auto_501956 ) ) ( not ( = ?auto_501945 ?auto_501957 ) ) ( not ( = ?auto_501945 ?auto_501958 ) ) ( not ( = ?auto_501945 ?auto_501959 ) ) ( not ( = ?auto_501946 ?auto_501947 ) ) ( not ( = ?auto_501946 ?auto_501948 ) ) ( not ( = ?auto_501946 ?auto_501949 ) ) ( not ( = ?auto_501946 ?auto_501950 ) ) ( not ( = ?auto_501946 ?auto_501951 ) ) ( not ( = ?auto_501946 ?auto_501952 ) ) ( not ( = ?auto_501946 ?auto_501953 ) ) ( not ( = ?auto_501946 ?auto_501954 ) ) ( not ( = ?auto_501946 ?auto_501955 ) ) ( not ( = ?auto_501946 ?auto_501956 ) ) ( not ( = ?auto_501946 ?auto_501957 ) ) ( not ( = ?auto_501946 ?auto_501958 ) ) ( not ( = ?auto_501946 ?auto_501959 ) ) ( not ( = ?auto_501947 ?auto_501948 ) ) ( not ( = ?auto_501947 ?auto_501949 ) ) ( not ( = ?auto_501947 ?auto_501950 ) ) ( not ( = ?auto_501947 ?auto_501951 ) ) ( not ( = ?auto_501947 ?auto_501952 ) ) ( not ( = ?auto_501947 ?auto_501953 ) ) ( not ( = ?auto_501947 ?auto_501954 ) ) ( not ( = ?auto_501947 ?auto_501955 ) ) ( not ( = ?auto_501947 ?auto_501956 ) ) ( not ( = ?auto_501947 ?auto_501957 ) ) ( not ( = ?auto_501947 ?auto_501958 ) ) ( not ( = ?auto_501947 ?auto_501959 ) ) ( not ( = ?auto_501948 ?auto_501949 ) ) ( not ( = ?auto_501948 ?auto_501950 ) ) ( not ( = ?auto_501948 ?auto_501951 ) ) ( not ( = ?auto_501948 ?auto_501952 ) ) ( not ( = ?auto_501948 ?auto_501953 ) ) ( not ( = ?auto_501948 ?auto_501954 ) ) ( not ( = ?auto_501948 ?auto_501955 ) ) ( not ( = ?auto_501948 ?auto_501956 ) ) ( not ( = ?auto_501948 ?auto_501957 ) ) ( not ( = ?auto_501948 ?auto_501958 ) ) ( not ( = ?auto_501948 ?auto_501959 ) ) ( not ( = ?auto_501949 ?auto_501950 ) ) ( not ( = ?auto_501949 ?auto_501951 ) ) ( not ( = ?auto_501949 ?auto_501952 ) ) ( not ( = ?auto_501949 ?auto_501953 ) ) ( not ( = ?auto_501949 ?auto_501954 ) ) ( not ( = ?auto_501949 ?auto_501955 ) ) ( not ( = ?auto_501949 ?auto_501956 ) ) ( not ( = ?auto_501949 ?auto_501957 ) ) ( not ( = ?auto_501949 ?auto_501958 ) ) ( not ( = ?auto_501949 ?auto_501959 ) ) ( not ( = ?auto_501950 ?auto_501951 ) ) ( not ( = ?auto_501950 ?auto_501952 ) ) ( not ( = ?auto_501950 ?auto_501953 ) ) ( not ( = ?auto_501950 ?auto_501954 ) ) ( not ( = ?auto_501950 ?auto_501955 ) ) ( not ( = ?auto_501950 ?auto_501956 ) ) ( not ( = ?auto_501950 ?auto_501957 ) ) ( not ( = ?auto_501950 ?auto_501958 ) ) ( not ( = ?auto_501950 ?auto_501959 ) ) ( not ( = ?auto_501951 ?auto_501952 ) ) ( not ( = ?auto_501951 ?auto_501953 ) ) ( not ( = ?auto_501951 ?auto_501954 ) ) ( not ( = ?auto_501951 ?auto_501955 ) ) ( not ( = ?auto_501951 ?auto_501956 ) ) ( not ( = ?auto_501951 ?auto_501957 ) ) ( not ( = ?auto_501951 ?auto_501958 ) ) ( not ( = ?auto_501951 ?auto_501959 ) ) ( not ( = ?auto_501952 ?auto_501953 ) ) ( not ( = ?auto_501952 ?auto_501954 ) ) ( not ( = ?auto_501952 ?auto_501955 ) ) ( not ( = ?auto_501952 ?auto_501956 ) ) ( not ( = ?auto_501952 ?auto_501957 ) ) ( not ( = ?auto_501952 ?auto_501958 ) ) ( not ( = ?auto_501952 ?auto_501959 ) ) ( not ( = ?auto_501953 ?auto_501954 ) ) ( not ( = ?auto_501953 ?auto_501955 ) ) ( not ( = ?auto_501953 ?auto_501956 ) ) ( not ( = ?auto_501953 ?auto_501957 ) ) ( not ( = ?auto_501953 ?auto_501958 ) ) ( not ( = ?auto_501953 ?auto_501959 ) ) ( not ( = ?auto_501954 ?auto_501955 ) ) ( not ( = ?auto_501954 ?auto_501956 ) ) ( not ( = ?auto_501954 ?auto_501957 ) ) ( not ( = ?auto_501954 ?auto_501958 ) ) ( not ( = ?auto_501954 ?auto_501959 ) ) ( not ( = ?auto_501955 ?auto_501956 ) ) ( not ( = ?auto_501955 ?auto_501957 ) ) ( not ( = ?auto_501955 ?auto_501958 ) ) ( not ( = ?auto_501955 ?auto_501959 ) ) ( not ( = ?auto_501956 ?auto_501957 ) ) ( not ( = ?auto_501956 ?auto_501958 ) ) ( not ( = ?auto_501956 ?auto_501959 ) ) ( not ( = ?auto_501957 ?auto_501958 ) ) ( not ( = ?auto_501957 ?auto_501959 ) ) ( not ( = ?auto_501958 ?auto_501959 ) ) ( ON ?auto_501958 ?auto_501959 ) ( ON ?auto_501957 ?auto_501958 ) ( ON ?auto_501956 ?auto_501957 ) ( ON ?auto_501955 ?auto_501956 ) ( ON ?auto_501954 ?auto_501955 ) ( CLEAR ?auto_501952 ) ( ON ?auto_501953 ?auto_501954 ) ( CLEAR ?auto_501953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_501944 ?auto_501945 ?auto_501946 ?auto_501947 ?auto_501948 ?auto_501949 ?auto_501950 ?auto_501951 ?auto_501952 ?auto_501953 )
      ( MAKE-16PILE ?auto_501944 ?auto_501945 ?auto_501946 ?auto_501947 ?auto_501948 ?auto_501949 ?auto_501950 ?auto_501951 ?auto_501952 ?auto_501953 ?auto_501954 ?auto_501955 ?auto_501956 ?auto_501957 ?auto_501958 ?auto_501959 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_501976 - BLOCK
      ?auto_501977 - BLOCK
      ?auto_501978 - BLOCK
      ?auto_501979 - BLOCK
      ?auto_501980 - BLOCK
      ?auto_501981 - BLOCK
      ?auto_501982 - BLOCK
      ?auto_501983 - BLOCK
      ?auto_501984 - BLOCK
      ?auto_501985 - BLOCK
      ?auto_501986 - BLOCK
      ?auto_501987 - BLOCK
      ?auto_501988 - BLOCK
      ?auto_501989 - BLOCK
      ?auto_501990 - BLOCK
      ?auto_501991 - BLOCK
    )
    :vars
    (
      ?auto_501992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_501991 ?auto_501992 ) ( ON-TABLE ?auto_501976 ) ( ON ?auto_501977 ?auto_501976 ) ( ON ?auto_501978 ?auto_501977 ) ( ON ?auto_501979 ?auto_501978 ) ( ON ?auto_501980 ?auto_501979 ) ( ON ?auto_501981 ?auto_501980 ) ( ON ?auto_501982 ?auto_501981 ) ( ON ?auto_501983 ?auto_501982 ) ( not ( = ?auto_501976 ?auto_501977 ) ) ( not ( = ?auto_501976 ?auto_501978 ) ) ( not ( = ?auto_501976 ?auto_501979 ) ) ( not ( = ?auto_501976 ?auto_501980 ) ) ( not ( = ?auto_501976 ?auto_501981 ) ) ( not ( = ?auto_501976 ?auto_501982 ) ) ( not ( = ?auto_501976 ?auto_501983 ) ) ( not ( = ?auto_501976 ?auto_501984 ) ) ( not ( = ?auto_501976 ?auto_501985 ) ) ( not ( = ?auto_501976 ?auto_501986 ) ) ( not ( = ?auto_501976 ?auto_501987 ) ) ( not ( = ?auto_501976 ?auto_501988 ) ) ( not ( = ?auto_501976 ?auto_501989 ) ) ( not ( = ?auto_501976 ?auto_501990 ) ) ( not ( = ?auto_501976 ?auto_501991 ) ) ( not ( = ?auto_501976 ?auto_501992 ) ) ( not ( = ?auto_501977 ?auto_501978 ) ) ( not ( = ?auto_501977 ?auto_501979 ) ) ( not ( = ?auto_501977 ?auto_501980 ) ) ( not ( = ?auto_501977 ?auto_501981 ) ) ( not ( = ?auto_501977 ?auto_501982 ) ) ( not ( = ?auto_501977 ?auto_501983 ) ) ( not ( = ?auto_501977 ?auto_501984 ) ) ( not ( = ?auto_501977 ?auto_501985 ) ) ( not ( = ?auto_501977 ?auto_501986 ) ) ( not ( = ?auto_501977 ?auto_501987 ) ) ( not ( = ?auto_501977 ?auto_501988 ) ) ( not ( = ?auto_501977 ?auto_501989 ) ) ( not ( = ?auto_501977 ?auto_501990 ) ) ( not ( = ?auto_501977 ?auto_501991 ) ) ( not ( = ?auto_501977 ?auto_501992 ) ) ( not ( = ?auto_501978 ?auto_501979 ) ) ( not ( = ?auto_501978 ?auto_501980 ) ) ( not ( = ?auto_501978 ?auto_501981 ) ) ( not ( = ?auto_501978 ?auto_501982 ) ) ( not ( = ?auto_501978 ?auto_501983 ) ) ( not ( = ?auto_501978 ?auto_501984 ) ) ( not ( = ?auto_501978 ?auto_501985 ) ) ( not ( = ?auto_501978 ?auto_501986 ) ) ( not ( = ?auto_501978 ?auto_501987 ) ) ( not ( = ?auto_501978 ?auto_501988 ) ) ( not ( = ?auto_501978 ?auto_501989 ) ) ( not ( = ?auto_501978 ?auto_501990 ) ) ( not ( = ?auto_501978 ?auto_501991 ) ) ( not ( = ?auto_501978 ?auto_501992 ) ) ( not ( = ?auto_501979 ?auto_501980 ) ) ( not ( = ?auto_501979 ?auto_501981 ) ) ( not ( = ?auto_501979 ?auto_501982 ) ) ( not ( = ?auto_501979 ?auto_501983 ) ) ( not ( = ?auto_501979 ?auto_501984 ) ) ( not ( = ?auto_501979 ?auto_501985 ) ) ( not ( = ?auto_501979 ?auto_501986 ) ) ( not ( = ?auto_501979 ?auto_501987 ) ) ( not ( = ?auto_501979 ?auto_501988 ) ) ( not ( = ?auto_501979 ?auto_501989 ) ) ( not ( = ?auto_501979 ?auto_501990 ) ) ( not ( = ?auto_501979 ?auto_501991 ) ) ( not ( = ?auto_501979 ?auto_501992 ) ) ( not ( = ?auto_501980 ?auto_501981 ) ) ( not ( = ?auto_501980 ?auto_501982 ) ) ( not ( = ?auto_501980 ?auto_501983 ) ) ( not ( = ?auto_501980 ?auto_501984 ) ) ( not ( = ?auto_501980 ?auto_501985 ) ) ( not ( = ?auto_501980 ?auto_501986 ) ) ( not ( = ?auto_501980 ?auto_501987 ) ) ( not ( = ?auto_501980 ?auto_501988 ) ) ( not ( = ?auto_501980 ?auto_501989 ) ) ( not ( = ?auto_501980 ?auto_501990 ) ) ( not ( = ?auto_501980 ?auto_501991 ) ) ( not ( = ?auto_501980 ?auto_501992 ) ) ( not ( = ?auto_501981 ?auto_501982 ) ) ( not ( = ?auto_501981 ?auto_501983 ) ) ( not ( = ?auto_501981 ?auto_501984 ) ) ( not ( = ?auto_501981 ?auto_501985 ) ) ( not ( = ?auto_501981 ?auto_501986 ) ) ( not ( = ?auto_501981 ?auto_501987 ) ) ( not ( = ?auto_501981 ?auto_501988 ) ) ( not ( = ?auto_501981 ?auto_501989 ) ) ( not ( = ?auto_501981 ?auto_501990 ) ) ( not ( = ?auto_501981 ?auto_501991 ) ) ( not ( = ?auto_501981 ?auto_501992 ) ) ( not ( = ?auto_501982 ?auto_501983 ) ) ( not ( = ?auto_501982 ?auto_501984 ) ) ( not ( = ?auto_501982 ?auto_501985 ) ) ( not ( = ?auto_501982 ?auto_501986 ) ) ( not ( = ?auto_501982 ?auto_501987 ) ) ( not ( = ?auto_501982 ?auto_501988 ) ) ( not ( = ?auto_501982 ?auto_501989 ) ) ( not ( = ?auto_501982 ?auto_501990 ) ) ( not ( = ?auto_501982 ?auto_501991 ) ) ( not ( = ?auto_501982 ?auto_501992 ) ) ( not ( = ?auto_501983 ?auto_501984 ) ) ( not ( = ?auto_501983 ?auto_501985 ) ) ( not ( = ?auto_501983 ?auto_501986 ) ) ( not ( = ?auto_501983 ?auto_501987 ) ) ( not ( = ?auto_501983 ?auto_501988 ) ) ( not ( = ?auto_501983 ?auto_501989 ) ) ( not ( = ?auto_501983 ?auto_501990 ) ) ( not ( = ?auto_501983 ?auto_501991 ) ) ( not ( = ?auto_501983 ?auto_501992 ) ) ( not ( = ?auto_501984 ?auto_501985 ) ) ( not ( = ?auto_501984 ?auto_501986 ) ) ( not ( = ?auto_501984 ?auto_501987 ) ) ( not ( = ?auto_501984 ?auto_501988 ) ) ( not ( = ?auto_501984 ?auto_501989 ) ) ( not ( = ?auto_501984 ?auto_501990 ) ) ( not ( = ?auto_501984 ?auto_501991 ) ) ( not ( = ?auto_501984 ?auto_501992 ) ) ( not ( = ?auto_501985 ?auto_501986 ) ) ( not ( = ?auto_501985 ?auto_501987 ) ) ( not ( = ?auto_501985 ?auto_501988 ) ) ( not ( = ?auto_501985 ?auto_501989 ) ) ( not ( = ?auto_501985 ?auto_501990 ) ) ( not ( = ?auto_501985 ?auto_501991 ) ) ( not ( = ?auto_501985 ?auto_501992 ) ) ( not ( = ?auto_501986 ?auto_501987 ) ) ( not ( = ?auto_501986 ?auto_501988 ) ) ( not ( = ?auto_501986 ?auto_501989 ) ) ( not ( = ?auto_501986 ?auto_501990 ) ) ( not ( = ?auto_501986 ?auto_501991 ) ) ( not ( = ?auto_501986 ?auto_501992 ) ) ( not ( = ?auto_501987 ?auto_501988 ) ) ( not ( = ?auto_501987 ?auto_501989 ) ) ( not ( = ?auto_501987 ?auto_501990 ) ) ( not ( = ?auto_501987 ?auto_501991 ) ) ( not ( = ?auto_501987 ?auto_501992 ) ) ( not ( = ?auto_501988 ?auto_501989 ) ) ( not ( = ?auto_501988 ?auto_501990 ) ) ( not ( = ?auto_501988 ?auto_501991 ) ) ( not ( = ?auto_501988 ?auto_501992 ) ) ( not ( = ?auto_501989 ?auto_501990 ) ) ( not ( = ?auto_501989 ?auto_501991 ) ) ( not ( = ?auto_501989 ?auto_501992 ) ) ( not ( = ?auto_501990 ?auto_501991 ) ) ( not ( = ?auto_501990 ?auto_501992 ) ) ( not ( = ?auto_501991 ?auto_501992 ) ) ( ON ?auto_501990 ?auto_501991 ) ( ON ?auto_501989 ?auto_501990 ) ( ON ?auto_501988 ?auto_501989 ) ( ON ?auto_501987 ?auto_501988 ) ( ON ?auto_501986 ?auto_501987 ) ( ON ?auto_501985 ?auto_501986 ) ( CLEAR ?auto_501983 ) ( ON ?auto_501984 ?auto_501985 ) ( CLEAR ?auto_501984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_501976 ?auto_501977 ?auto_501978 ?auto_501979 ?auto_501980 ?auto_501981 ?auto_501982 ?auto_501983 ?auto_501984 )
      ( MAKE-16PILE ?auto_501976 ?auto_501977 ?auto_501978 ?auto_501979 ?auto_501980 ?auto_501981 ?auto_501982 ?auto_501983 ?auto_501984 ?auto_501985 ?auto_501986 ?auto_501987 ?auto_501988 ?auto_501989 ?auto_501990 ?auto_501991 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502009 - BLOCK
      ?auto_502010 - BLOCK
      ?auto_502011 - BLOCK
      ?auto_502012 - BLOCK
      ?auto_502013 - BLOCK
      ?auto_502014 - BLOCK
      ?auto_502015 - BLOCK
      ?auto_502016 - BLOCK
      ?auto_502017 - BLOCK
      ?auto_502018 - BLOCK
      ?auto_502019 - BLOCK
      ?auto_502020 - BLOCK
      ?auto_502021 - BLOCK
      ?auto_502022 - BLOCK
      ?auto_502023 - BLOCK
      ?auto_502024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502024 ) ( ON-TABLE ?auto_502009 ) ( ON ?auto_502010 ?auto_502009 ) ( ON ?auto_502011 ?auto_502010 ) ( ON ?auto_502012 ?auto_502011 ) ( ON ?auto_502013 ?auto_502012 ) ( ON ?auto_502014 ?auto_502013 ) ( ON ?auto_502015 ?auto_502014 ) ( ON ?auto_502016 ?auto_502015 ) ( not ( = ?auto_502009 ?auto_502010 ) ) ( not ( = ?auto_502009 ?auto_502011 ) ) ( not ( = ?auto_502009 ?auto_502012 ) ) ( not ( = ?auto_502009 ?auto_502013 ) ) ( not ( = ?auto_502009 ?auto_502014 ) ) ( not ( = ?auto_502009 ?auto_502015 ) ) ( not ( = ?auto_502009 ?auto_502016 ) ) ( not ( = ?auto_502009 ?auto_502017 ) ) ( not ( = ?auto_502009 ?auto_502018 ) ) ( not ( = ?auto_502009 ?auto_502019 ) ) ( not ( = ?auto_502009 ?auto_502020 ) ) ( not ( = ?auto_502009 ?auto_502021 ) ) ( not ( = ?auto_502009 ?auto_502022 ) ) ( not ( = ?auto_502009 ?auto_502023 ) ) ( not ( = ?auto_502009 ?auto_502024 ) ) ( not ( = ?auto_502010 ?auto_502011 ) ) ( not ( = ?auto_502010 ?auto_502012 ) ) ( not ( = ?auto_502010 ?auto_502013 ) ) ( not ( = ?auto_502010 ?auto_502014 ) ) ( not ( = ?auto_502010 ?auto_502015 ) ) ( not ( = ?auto_502010 ?auto_502016 ) ) ( not ( = ?auto_502010 ?auto_502017 ) ) ( not ( = ?auto_502010 ?auto_502018 ) ) ( not ( = ?auto_502010 ?auto_502019 ) ) ( not ( = ?auto_502010 ?auto_502020 ) ) ( not ( = ?auto_502010 ?auto_502021 ) ) ( not ( = ?auto_502010 ?auto_502022 ) ) ( not ( = ?auto_502010 ?auto_502023 ) ) ( not ( = ?auto_502010 ?auto_502024 ) ) ( not ( = ?auto_502011 ?auto_502012 ) ) ( not ( = ?auto_502011 ?auto_502013 ) ) ( not ( = ?auto_502011 ?auto_502014 ) ) ( not ( = ?auto_502011 ?auto_502015 ) ) ( not ( = ?auto_502011 ?auto_502016 ) ) ( not ( = ?auto_502011 ?auto_502017 ) ) ( not ( = ?auto_502011 ?auto_502018 ) ) ( not ( = ?auto_502011 ?auto_502019 ) ) ( not ( = ?auto_502011 ?auto_502020 ) ) ( not ( = ?auto_502011 ?auto_502021 ) ) ( not ( = ?auto_502011 ?auto_502022 ) ) ( not ( = ?auto_502011 ?auto_502023 ) ) ( not ( = ?auto_502011 ?auto_502024 ) ) ( not ( = ?auto_502012 ?auto_502013 ) ) ( not ( = ?auto_502012 ?auto_502014 ) ) ( not ( = ?auto_502012 ?auto_502015 ) ) ( not ( = ?auto_502012 ?auto_502016 ) ) ( not ( = ?auto_502012 ?auto_502017 ) ) ( not ( = ?auto_502012 ?auto_502018 ) ) ( not ( = ?auto_502012 ?auto_502019 ) ) ( not ( = ?auto_502012 ?auto_502020 ) ) ( not ( = ?auto_502012 ?auto_502021 ) ) ( not ( = ?auto_502012 ?auto_502022 ) ) ( not ( = ?auto_502012 ?auto_502023 ) ) ( not ( = ?auto_502012 ?auto_502024 ) ) ( not ( = ?auto_502013 ?auto_502014 ) ) ( not ( = ?auto_502013 ?auto_502015 ) ) ( not ( = ?auto_502013 ?auto_502016 ) ) ( not ( = ?auto_502013 ?auto_502017 ) ) ( not ( = ?auto_502013 ?auto_502018 ) ) ( not ( = ?auto_502013 ?auto_502019 ) ) ( not ( = ?auto_502013 ?auto_502020 ) ) ( not ( = ?auto_502013 ?auto_502021 ) ) ( not ( = ?auto_502013 ?auto_502022 ) ) ( not ( = ?auto_502013 ?auto_502023 ) ) ( not ( = ?auto_502013 ?auto_502024 ) ) ( not ( = ?auto_502014 ?auto_502015 ) ) ( not ( = ?auto_502014 ?auto_502016 ) ) ( not ( = ?auto_502014 ?auto_502017 ) ) ( not ( = ?auto_502014 ?auto_502018 ) ) ( not ( = ?auto_502014 ?auto_502019 ) ) ( not ( = ?auto_502014 ?auto_502020 ) ) ( not ( = ?auto_502014 ?auto_502021 ) ) ( not ( = ?auto_502014 ?auto_502022 ) ) ( not ( = ?auto_502014 ?auto_502023 ) ) ( not ( = ?auto_502014 ?auto_502024 ) ) ( not ( = ?auto_502015 ?auto_502016 ) ) ( not ( = ?auto_502015 ?auto_502017 ) ) ( not ( = ?auto_502015 ?auto_502018 ) ) ( not ( = ?auto_502015 ?auto_502019 ) ) ( not ( = ?auto_502015 ?auto_502020 ) ) ( not ( = ?auto_502015 ?auto_502021 ) ) ( not ( = ?auto_502015 ?auto_502022 ) ) ( not ( = ?auto_502015 ?auto_502023 ) ) ( not ( = ?auto_502015 ?auto_502024 ) ) ( not ( = ?auto_502016 ?auto_502017 ) ) ( not ( = ?auto_502016 ?auto_502018 ) ) ( not ( = ?auto_502016 ?auto_502019 ) ) ( not ( = ?auto_502016 ?auto_502020 ) ) ( not ( = ?auto_502016 ?auto_502021 ) ) ( not ( = ?auto_502016 ?auto_502022 ) ) ( not ( = ?auto_502016 ?auto_502023 ) ) ( not ( = ?auto_502016 ?auto_502024 ) ) ( not ( = ?auto_502017 ?auto_502018 ) ) ( not ( = ?auto_502017 ?auto_502019 ) ) ( not ( = ?auto_502017 ?auto_502020 ) ) ( not ( = ?auto_502017 ?auto_502021 ) ) ( not ( = ?auto_502017 ?auto_502022 ) ) ( not ( = ?auto_502017 ?auto_502023 ) ) ( not ( = ?auto_502017 ?auto_502024 ) ) ( not ( = ?auto_502018 ?auto_502019 ) ) ( not ( = ?auto_502018 ?auto_502020 ) ) ( not ( = ?auto_502018 ?auto_502021 ) ) ( not ( = ?auto_502018 ?auto_502022 ) ) ( not ( = ?auto_502018 ?auto_502023 ) ) ( not ( = ?auto_502018 ?auto_502024 ) ) ( not ( = ?auto_502019 ?auto_502020 ) ) ( not ( = ?auto_502019 ?auto_502021 ) ) ( not ( = ?auto_502019 ?auto_502022 ) ) ( not ( = ?auto_502019 ?auto_502023 ) ) ( not ( = ?auto_502019 ?auto_502024 ) ) ( not ( = ?auto_502020 ?auto_502021 ) ) ( not ( = ?auto_502020 ?auto_502022 ) ) ( not ( = ?auto_502020 ?auto_502023 ) ) ( not ( = ?auto_502020 ?auto_502024 ) ) ( not ( = ?auto_502021 ?auto_502022 ) ) ( not ( = ?auto_502021 ?auto_502023 ) ) ( not ( = ?auto_502021 ?auto_502024 ) ) ( not ( = ?auto_502022 ?auto_502023 ) ) ( not ( = ?auto_502022 ?auto_502024 ) ) ( not ( = ?auto_502023 ?auto_502024 ) ) ( ON ?auto_502023 ?auto_502024 ) ( ON ?auto_502022 ?auto_502023 ) ( ON ?auto_502021 ?auto_502022 ) ( ON ?auto_502020 ?auto_502021 ) ( ON ?auto_502019 ?auto_502020 ) ( ON ?auto_502018 ?auto_502019 ) ( CLEAR ?auto_502016 ) ( ON ?auto_502017 ?auto_502018 ) ( CLEAR ?auto_502017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_502009 ?auto_502010 ?auto_502011 ?auto_502012 ?auto_502013 ?auto_502014 ?auto_502015 ?auto_502016 ?auto_502017 )
      ( MAKE-16PILE ?auto_502009 ?auto_502010 ?auto_502011 ?auto_502012 ?auto_502013 ?auto_502014 ?auto_502015 ?auto_502016 ?auto_502017 ?auto_502018 ?auto_502019 ?auto_502020 ?auto_502021 ?auto_502022 ?auto_502023 ?auto_502024 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502041 - BLOCK
      ?auto_502042 - BLOCK
      ?auto_502043 - BLOCK
      ?auto_502044 - BLOCK
      ?auto_502045 - BLOCK
      ?auto_502046 - BLOCK
      ?auto_502047 - BLOCK
      ?auto_502048 - BLOCK
      ?auto_502049 - BLOCK
      ?auto_502050 - BLOCK
      ?auto_502051 - BLOCK
      ?auto_502052 - BLOCK
      ?auto_502053 - BLOCK
      ?auto_502054 - BLOCK
      ?auto_502055 - BLOCK
      ?auto_502056 - BLOCK
    )
    :vars
    (
      ?auto_502057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502056 ?auto_502057 ) ( ON-TABLE ?auto_502041 ) ( ON ?auto_502042 ?auto_502041 ) ( ON ?auto_502043 ?auto_502042 ) ( ON ?auto_502044 ?auto_502043 ) ( ON ?auto_502045 ?auto_502044 ) ( ON ?auto_502046 ?auto_502045 ) ( ON ?auto_502047 ?auto_502046 ) ( not ( = ?auto_502041 ?auto_502042 ) ) ( not ( = ?auto_502041 ?auto_502043 ) ) ( not ( = ?auto_502041 ?auto_502044 ) ) ( not ( = ?auto_502041 ?auto_502045 ) ) ( not ( = ?auto_502041 ?auto_502046 ) ) ( not ( = ?auto_502041 ?auto_502047 ) ) ( not ( = ?auto_502041 ?auto_502048 ) ) ( not ( = ?auto_502041 ?auto_502049 ) ) ( not ( = ?auto_502041 ?auto_502050 ) ) ( not ( = ?auto_502041 ?auto_502051 ) ) ( not ( = ?auto_502041 ?auto_502052 ) ) ( not ( = ?auto_502041 ?auto_502053 ) ) ( not ( = ?auto_502041 ?auto_502054 ) ) ( not ( = ?auto_502041 ?auto_502055 ) ) ( not ( = ?auto_502041 ?auto_502056 ) ) ( not ( = ?auto_502041 ?auto_502057 ) ) ( not ( = ?auto_502042 ?auto_502043 ) ) ( not ( = ?auto_502042 ?auto_502044 ) ) ( not ( = ?auto_502042 ?auto_502045 ) ) ( not ( = ?auto_502042 ?auto_502046 ) ) ( not ( = ?auto_502042 ?auto_502047 ) ) ( not ( = ?auto_502042 ?auto_502048 ) ) ( not ( = ?auto_502042 ?auto_502049 ) ) ( not ( = ?auto_502042 ?auto_502050 ) ) ( not ( = ?auto_502042 ?auto_502051 ) ) ( not ( = ?auto_502042 ?auto_502052 ) ) ( not ( = ?auto_502042 ?auto_502053 ) ) ( not ( = ?auto_502042 ?auto_502054 ) ) ( not ( = ?auto_502042 ?auto_502055 ) ) ( not ( = ?auto_502042 ?auto_502056 ) ) ( not ( = ?auto_502042 ?auto_502057 ) ) ( not ( = ?auto_502043 ?auto_502044 ) ) ( not ( = ?auto_502043 ?auto_502045 ) ) ( not ( = ?auto_502043 ?auto_502046 ) ) ( not ( = ?auto_502043 ?auto_502047 ) ) ( not ( = ?auto_502043 ?auto_502048 ) ) ( not ( = ?auto_502043 ?auto_502049 ) ) ( not ( = ?auto_502043 ?auto_502050 ) ) ( not ( = ?auto_502043 ?auto_502051 ) ) ( not ( = ?auto_502043 ?auto_502052 ) ) ( not ( = ?auto_502043 ?auto_502053 ) ) ( not ( = ?auto_502043 ?auto_502054 ) ) ( not ( = ?auto_502043 ?auto_502055 ) ) ( not ( = ?auto_502043 ?auto_502056 ) ) ( not ( = ?auto_502043 ?auto_502057 ) ) ( not ( = ?auto_502044 ?auto_502045 ) ) ( not ( = ?auto_502044 ?auto_502046 ) ) ( not ( = ?auto_502044 ?auto_502047 ) ) ( not ( = ?auto_502044 ?auto_502048 ) ) ( not ( = ?auto_502044 ?auto_502049 ) ) ( not ( = ?auto_502044 ?auto_502050 ) ) ( not ( = ?auto_502044 ?auto_502051 ) ) ( not ( = ?auto_502044 ?auto_502052 ) ) ( not ( = ?auto_502044 ?auto_502053 ) ) ( not ( = ?auto_502044 ?auto_502054 ) ) ( not ( = ?auto_502044 ?auto_502055 ) ) ( not ( = ?auto_502044 ?auto_502056 ) ) ( not ( = ?auto_502044 ?auto_502057 ) ) ( not ( = ?auto_502045 ?auto_502046 ) ) ( not ( = ?auto_502045 ?auto_502047 ) ) ( not ( = ?auto_502045 ?auto_502048 ) ) ( not ( = ?auto_502045 ?auto_502049 ) ) ( not ( = ?auto_502045 ?auto_502050 ) ) ( not ( = ?auto_502045 ?auto_502051 ) ) ( not ( = ?auto_502045 ?auto_502052 ) ) ( not ( = ?auto_502045 ?auto_502053 ) ) ( not ( = ?auto_502045 ?auto_502054 ) ) ( not ( = ?auto_502045 ?auto_502055 ) ) ( not ( = ?auto_502045 ?auto_502056 ) ) ( not ( = ?auto_502045 ?auto_502057 ) ) ( not ( = ?auto_502046 ?auto_502047 ) ) ( not ( = ?auto_502046 ?auto_502048 ) ) ( not ( = ?auto_502046 ?auto_502049 ) ) ( not ( = ?auto_502046 ?auto_502050 ) ) ( not ( = ?auto_502046 ?auto_502051 ) ) ( not ( = ?auto_502046 ?auto_502052 ) ) ( not ( = ?auto_502046 ?auto_502053 ) ) ( not ( = ?auto_502046 ?auto_502054 ) ) ( not ( = ?auto_502046 ?auto_502055 ) ) ( not ( = ?auto_502046 ?auto_502056 ) ) ( not ( = ?auto_502046 ?auto_502057 ) ) ( not ( = ?auto_502047 ?auto_502048 ) ) ( not ( = ?auto_502047 ?auto_502049 ) ) ( not ( = ?auto_502047 ?auto_502050 ) ) ( not ( = ?auto_502047 ?auto_502051 ) ) ( not ( = ?auto_502047 ?auto_502052 ) ) ( not ( = ?auto_502047 ?auto_502053 ) ) ( not ( = ?auto_502047 ?auto_502054 ) ) ( not ( = ?auto_502047 ?auto_502055 ) ) ( not ( = ?auto_502047 ?auto_502056 ) ) ( not ( = ?auto_502047 ?auto_502057 ) ) ( not ( = ?auto_502048 ?auto_502049 ) ) ( not ( = ?auto_502048 ?auto_502050 ) ) ( not ( = ?auto_502048 ?auto_502051 ) ) ( not ( = ?auto_502048 ?auto_502052 ) ) ( not ( = ?auto_502048 ?auto_502053 ) ) ( not ( = ?auto_502048 ?auto_502054 ) ) ( not ( = ?auto_502048 ?auto_502055 ) ) ( not ( = ?auto_502048 ?auto_502056 ) ) ( not ( = ?auto_502048 ?auto_502057 ) ) ( not ( = ?auto_502049 ?auto_502050 ) ) ( not ( = ?auto_502049 ?auto_502051 ) ) ( not ( = ?auto_502049 ?auto_502052 ) ) ( not ( = ?auto_502049 ?auto_502053 ) ) ( not ( = ?auto_502049 ?auto_502054 ) ) ( not ( = ?auto_502049 ?auto_502055 ) ) ( not ( = ?auto_502049 ?auto_502056 ) ) ( not ( = ?auto_502049 ?auto_502057 ) ) ( not ( = ?auto_502050 ?auto_502051 ) ) ( not ( = ?auto_502050 ?auto_502052 ) ) ( not ( = ?auto_502050 ?auto_502053 ) ) ( not ( = ?auto_502050 ?auto_502054 ) ) ( not ( = ?auto_502050 ?auto_502055 ) ) ( not ( = ?auto_502050 ?auto_502056 ) ) ( not ( = ?auto_502050 ?auto_502057 ) ) ( not ( = ?auto_502051 ?auto_502052 ) ) ( not ( = ?auto_502051 ?auto_502053 ) ) ( not ( = ?auto_502051 ?auto_502054 ) ) ( not ( = ?auto_502051 ?auto_502055 ) ) ( not ( = ?auto_502051 ?auto_502056 ) ) ( not ( = ?auto_502051 ?auto_502057 ) ) ( not ( = ?auto_502052 ?auto_502053 ) ) ( not ( = ?auto_502052 ?auto_502054 ) ) ( not ( = ?auto_502052 ?auto_502055 ) ) ( not ( = ?auto_502052 ?auto_502056 ) ) ( not ( = ?auto_502052 ?auto_502057 ) ) ( not ( = ?auto_502053 ?auto_502054 ) ) ( not ( = ?auto_502053 ?auto_502055 ) ) ( not ( = ?auto_502053 ?auto_502056 ) ) ( not ( = ?auto_502053 ?auto_502057 ) ) ( not ( = ?auto_502054 ?auto_502055 ) ) ( not ( = ?auto_502054 ?auto_502056 ) ) ( not ( = ?auto_502054 ?auto_502057 ) ) ( not ( = ?auto_502055 ?auto_502056 ) ) ( not ( = ?auto_502055 ?auto_502057 ) ) ( not ( = ?auto_502056 ?auto_502057 ) ) ( ON ?auto_502055 ?auto_502056 ) ( ON ?auto_502054 ?auto_502055 ) ( ON ?auto_502053 ?auto_502054 ) ( ON ?auto_502052 ?auto_502053 ) ( ON ?auto_502051 ?auto_502052 ) ( ON ?auto_502050 ?auto_502051 ) ( ON ?auto_502049 ?auto_502050 ) ( CLEAR ?auto_502047 ) ( ON ?auto_502048 ?auto_502049 ) ( CLEAR ?auto_502048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_502041 ?auto_502042 ?auto_502043 ?auto_502044 ?auto_502045 ?auto_502046 ?auto_502047 ?auto_502048 )
      ( MAKE-16PILE ?auto_502041 ?auto_502042 ?auto_502043 ?auto_502044 ?auto_502045 ?auto_502046 ?auto_502047 ?auto_502048 ?auto_502049 ?auto_502050 ?auto_502051 ?auto_502052 ?auto_502053 ?auto_502054 ?auto_502055 ?auto_502056 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502074 - BLOCK
      ?auto_502075 - BLOCK
      ?auto_502076 - BLOCK
      ?auto_502077 - BLOCK
      ?auto_502078 - BLOCK
      ?auto_502079 - BLOCK
      ?auto_502080 - BLOCK
      ?auto_502081 - BLOCK
      ?auto_502082 - BLOCK
      ?auto_502083 - BLOCK
      ?auto_502084 - BLOCK
      ?auto_502085 - BLOCK
      ?auto_502086 - BLOCK
      ?auto_502087 - BLOCK
      ?auto_502088 - BLOCK
      ?auto_502089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502089 ) ( ON-TABLE ?auto_502074 ) ( ON ?auto_502075 ?auto_502074 ) ( ON ?auto_502076 ?auto_502075 ) ( ON ?auto_502077 ?auto_502076 ) ( ON ?auto_502078 ?auto_502077 ) ( ON ?auto_502079 ?auto_502078 ) ( ON ?auto_502080 ?auto_502079 ) ( not ( = ?auto_502074 ?auto_502075 ) ) ( not ( = ?auto_502074 ?auto_502076 ) ) ( not ( = ?auto_502074 ?auto_502077 ) ) ( not ( = ?auto_502074 ?auto_502078 ) ) ( not ( = ?auto_502074 ?auto_502079 ) ) ( not ( = ?auto_502074 ?auto_502080 ) ) ( not ( = ?auto_502074 ?auto_502081 ) ) ( not ( = ?auto_502074 ?auto_502082 ) ) ( not ( = ?auto_502074 ?auto_502083 ) ) ( not ( = ?auto_502074 ?auto_502084 ) ) ( not ( = ?auto_502074 ?auto_502085 ) ) ( not ( = ?auto_502074 ?auto_502086 ) ) ( not ( = ?auto_502074 ?auto_502087 ) ) ( not ( = ?auto_502074 ?auto_502088 ) ) ( not ( = ?auto_502074 ?auto_502089 ) ) ( not ( = ?auto_502075 ?auto_502076 ) ) ( not ( = ?auto_502075 ?auto_502077 ) ) ( not ( = ?auto_502075 ?auto_502078 ) ) ( not ( = ?auto_502075 ?auto_502079 ) ) ( not ( = ?auto_502075 ?auto_502080 ) ) ( not ( = ?auto_502075 ?auto_502081 ) ) ( not ( = ?auto_502075 ?auto_502082 ) ) ( not ( = ?auto_502075 ?auto_502083 ) ) ( not ( = ?auto_502075 ?auto_502084 ) ) ( not ( = ?auto_502075 ?auto_502085 ) ) ( not ( = ?auto_502075 ?auto_502086 ) ) ( not ( = ?auto_502075 ?auto_502087 ) ) ( not ( = ?auto_502075 ?auto_502088 ) ) ( not ( = ?auto_502075 ?auto_502089 ) ) ( not ( = ?auto_502076 ?auto_502077 ) ) ( not ( = ?auto_502076 ?auto_502078 ) ) ( not ( = ?auto_502076 ?auto_502079 ) ) ( not ( = ?auto_502076 ?auto_502080 ) ) ( not ( = ?auto_502076 ?auto_502081 ) ) ( not ( = ?auto_502076 ?auto_502082 ) ) ( not ( = ?auto_502076 ?auto_502083 ) ) ( not ( = ?auto_502076 ?auto_502084 ) ) ( not ( = ?auto_502076 ?auto_502085 ) ) ( not ( = ?auto_502076 ?auto_502086 ) ) ( not ( = ?auto_502076 ?auto_502087 ) ) ( not ( = ?auto_502076 ?auto_502088 ) ) ( not ( = ?auto_502076 ?auto_502089 ) ) ( not ( = ?auto_502077 ?auto_502078 ) ) ( not ( = ?auto_502077 ?auto_502079 ) ) ( not ( = ?auto_502077 ?auto_502080 ) ) ( not ( = ?auto_502077 ?auto_502081 ) ) ( not ( = ?auto_502077 ?auto_502082 ) ) ( not ( = ?auto_502077 ?auto_502083 ) ) ( not ( = ?auto_502077 ?auto_502084 ) ) ( not ( = ?auto_502077 ?auto_502085 ) ) ( not ( = ?auto_502077 ?auto_502086 ) ) ( not ( = ?auto_502077 ?auto_502087 ) ) ( not ( = ?auto_502077 ?auto_502088 ) ) ( not ( = ?auto_502077 ?auto_502089 ) ) ( not ( = ?auto_502078 ?auto_502079 ) ) ( not ( = ?auto_502078 ?auto_502080 ) ) ( not ( = ?auto_502078 ?auto_502081 ) ) ( not ( = ?auto_502078 ?auto_502082 ) ) ( not ( = ?auto_502078 ?auto_502083 ) ) ( not ( = ?auto_502078 ?auto_502084 ) ) ( not ( = ?auto_502078 ?auto_502085 ) ) ( not ( = ?auto_502078 ?auto_502086 ) ) ( not ( = ?auto_502078 ?auto_502087 ) ) ( not ( = ?auto_502078 ?auto_502088 ) ) ( not ( = ?auto_502078 ?auto_502089 ) ) ( not ( = ?auto_502079 ?auto_502080 ) ) ( not ( = ?auto_502079 ?auto_502081 ) ) ( not ( = ?auto_502079 ?auto_502082 ) ) ( not ( = ?auto_502079 ?auto_502083 ) ) ( not ( = ?auto_502079 ?auto_502084 ) ) ( not ( = ?auto_502079 ?auto_502085 ) ) ( not ( = ?auto_502079 ?auto_502086 ) ) ( not ( = ?auto_502079 ?auto_502087 ) ) ( not ( = ?auto_502079 ?auto_502088 ) ) ( not ( = ?auto_502079 ?auto_502089 ) ) ( not ( = ?auto_502080 ?auto_502081 ) ) ( not ( = ?auto_502080 ?auto_502082 ) ) ( not ( = ?auto_502080 ?auto_502083 ) ) ( not ( = ?auto_502080 ?auto_502084 ) ) ( not ( = ?auto_502080 ?auto_502085 ) ) ( not ( = ?auto_502080 ?auto_502086 ) ) ( not ( = ?auto_502080 ?auto_502087 ) ) ( not ( = ?auto_502080 ?auto_502088 ) ) ( not ( = ?auto_502080 ?auto_502089 ) ) ( not ( = ?auto_502081 ?auto_502082 ) ) ( not ( = ?auto_502081 ?auto_502083 ) ) ( not ( = ?auto_502081 ?auto_502084 ) ) ( not ( = ?auto_502081 ?auto_502085 ) ) ( not ( = ?auto_502081 ?auto_502086 ) ) ( not ( = ?auto_502081 ?auto_502087 ) ) ( not ( = ?auto_502081 ?auto_502088 ) ) ( not ( = ?auto_502081 ?auto_502089 ) ) ( not ( = ?auto_502082 ?auto_502083 ) ) ( not ( = ?auto_502082 ?auto_502084 ) ) ( not ( = ?auto_502082 ?auto_502085 ) ) ( not ( = ?auto_502082 ?auto_502086 ) ) ( not ( = ?auto_502082 ?auto_502087 ) ) ( not ( = ?auto_502082 ?auto_502088 ) ) ( not ( = ?auto_502082 ?auto_502089 ) ) ( not ( = ?auto_502083 ?auto_502084 ) ) ( not ( = ?auto_502083 ?auto_502085 ) ) ( not ( = ?auto_502083 ?auto_502086 ) ) ( not ( = ?auto_502083 ?auto_502087 ) ) ( not ( = ?auto_502083 ?auto_502088 ) ) ( not ( = ?auto_502083 ?auto_502089 ) ) ( not ( = ?auto_502084 ?auto_502085 ) ) ( not ( = ?auto_502084 ?auto_502086 ) ) ( not ( = ?auto_502084 ?auto_502087 ) ) ( not ( = ?auto_502084 ?auto_502088 ) ) ( not ( = ?auto_502084 ?auto_502089 ) ) ( not ( = ?auto_502085 ?auto_502086 ) ) ( not ( = ?auto_502085 ?auto_502087 ) ) ( not ( = ?auto_502085 ?auto_502088 ) ) ( not ( = ?auto_502085 ?auto_502089 ) ) ( not ( = ?auto_502086 ?auto_502087 ) ) ( not ( = ?auto_502086 ?auto_502088 ) ) ( not ( = ?auto_502086 ?auto_502089 ) ) ( not ( = ?auto_502087 ?auto_502088 ) ) ( not ( = ?auto_502087 ?auto_502089 ) ) ( not ( = ?auto_502088 ?auto_502089 ) ) ( ON ?auto_502088 ?auto_502089 ) ( ON ?auto_502087 ?auto_502088 ) ( ON ?auto_502086 ?auto_502087 ) ( ON ?auto_502085 ?auto_502086 ) ( ON ?auto_502084 ?auto_502085 ) ( ON ?auto_502083 ?auto_502084 ) ( ON ?auto_502082 ?auto_502083 ) ( CLEAR ?auto_502080 ) ( ON ?auto_502081 ?auto_502082 ) ( CLEAR ?auto_502081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_502074 ?auto_502075 ?auto_502076 ?auto_502077 ?auto_502078 ?auto_502079 ?auto_502080 ?auto_502081 )
      ( MAKE-16PILE ?auto_502074 ?auto_502075 ?auto_502076 ?auto_502077 ?auto_502078 ?auto_502079 ?auto_502080 ?auto_502081 ?auto_502082 ?auto_502083 ?auto_502084 ?auto_502085 ?auto_502086 ?auto_502087 ?auto_502088 ?auto_502089 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502106 - BLOCK
      ?auto_502107 - BLOCK
      ?auto_502108 - BLOCK
      ?auto_502109 - BLOCK
      ?auto_502110 - BLOCK
      ?auto_502111 - BLOCK
      ?auto_502112 - BLOCK
      ?auto_502113 - BLOCK
      ?auto_502114 - BLOCK
      ?auto_502115 - BLOCK
      ?auto_502116 - BLOCK
      ?auto_502117 - BLOCK
      ?auto_502118 - BLOCK
      ?auto_502119 - BLOCK
      ?auto_502120 - BLOCK
      ?auto_502121 - BLOCK
    )
    :vars
    (
      ?auto_502122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502121 ?auto_502122 ) ( ON-TABLE ?auto_502106 ) ( ON ?auto_502107 ?auto_502106 ) ( ON ?auto_502108 ?auto_502107 ) ( ON ?auto_502109 ?auto_502108 ) ( ON ?auto_502110 ?auto_502109 ) ( ON ?auto_502111 ?auto_502110 ) ( not ( = ?auto_502106 ?auto_502107 ) ) ( not ( = ?auto_502106 ?auto_502108 ) ) ( not ( = ?auto_502106 ?auto_502109 ) ) ( not ( = ?auto_502106 ?auto_502110 ) ) ( not ( = ?auto_502106 ?auto_502111 ) ) ( not ( = ?auto_502106 ?auto_502112 ) ) ( not ( = ?auto_502106 ?auto_502113 ) ) ( not ( = ?auto_502106 ?auto_502114 ) ) ( not ( = ?auto_502106 ?auto_502115 ) ) ( not ( = ?auto_502106 ?auto_502116 ) ) ( not ( = ?auto_502106 ?auto_502117 ) ) ( not ( = ?auto_502106 ?auto_502118 ) ) ( not ( = ?auto_502106 ?auto_502119 ) ) ( not ( = ?auto_502106 ?auto_502120 ) ) ( not ( = ?auto_502106 ?auto_502121 ) ) ( not ( = ?auto_502106 ?auto_502122 ) ) ( not ( = ?auto_502107 ?auto_502108 ) ) ( not ( = ?auto_502107 ?auto_502109 ) ) ( not ( = ?auto_502107 ?auto_502110 ) ) ( not ( = ?auto_502107 ?auto_502111 ) ) ( not ( = ?auto_502107 ?auto_502112 ) ) ( not ( = ?auto_502107 ?auto_502113 ) ) ( not ( = ?auto_502107 ?auto_502114 ) ) ( not ( = ?auto_502107 ?auto_502115 ) ) ( not ( = ?auto_502107 ?auto_502116 ) ) ( not ( = ?auto_502107 ?auto_502117 ) ) ( not ( = ?auto_502107 ?auto_502118 ) ) ( not ( = ?auto_502107 ?auto_502119 ) ) ( not ( = ?auto_502107 ?auto_502120 ) ) ( not ( = ?auto_502107 ?auto_502121 ) ) ( not ( = ?auto_502107 ?auto_502122 ) ) ( not ( = ?auto_502108 ?auto_502109 ) ) ( not ( = ?auto_502108 ?auto_502110 ) ) ( not ( = ?auto_502108 ?auto_502111 ) ) ( not ( = ?auto_502108 ?auto_502112 ) ) ( not ( = ?auto_502108 ?auto_502113 ) ) ( not ( = ?auto_502108 ?auto_502114 ) ) ( not ( = ?auto_502108 ?auto_502115 ) ) ( not ( = ?auto_502108 ?auto_502116 ) ) ( not ( = ?auto_502108 ?auto_502117 ) ) ( not ( = ?auto_502108 ?auto_502118 ) ) ( not ( = ?auto_502108 ?auto_502119 ) ) ( not ( = ?auto_502108 ?auto_502120 ) ) ( not ( = ?auto_502108 ?auto_502121 ) ) ( not ( = ?auto_502108 ?auto_502122 ) ) ( not ( = ?auto_502109 ?auto_502110 ) ) ( not ( = ?auto_502109 ?auto_502111 ) ) ( not ( = ?auto_502109 ?auto_502112 ) ) ( not ( = ?auto_502109 ?auto_502113 ) ) ( not ( = ?auto_502109 ?auto_502114 ) ) ( not ( = ?auto_502109 ?auto_502115 ) ) ( not ( = ?auto_502109 ?auto_502116 ) ) ( not ( = ?auto_502109 ?auto_502117 ) ) ( not ( = ?auto_502109 ?auto_502118 ) ) ( not ( = ?auto_502109 ?auto_502119 ) ) ( not ( = ?auto_502109 ?auto_502120 ) ) ( not ( = ?auto_502109 ?auto_502121 ) ) ( not ( = ?auto_502109 ?auto_502122 ) ) ( not ( = ?auto_502110 ?auto_502111 ) ) ( not ( = ?auto_502110 ?auto_502112 ) ) ( not ( = ?auto_502110 ?auto_502113 ) ) ( not ( = ?auto_502110 ?auto_502114 ) ) ( not ( = ?auto_502110 ?auto_502115 ) ) ( not ( = ?auto_502110 ?auto_502116 ) ) ( not ( = ?auto_502110 ?auto_502117 ) ) ( not ( = ?auto_502110 ?auto_502118 ) ) ( not ( = ?auto_502110 ?auto_502119 ) ) ( not ( = ?auto_502110 ?auto_502120 ) ) ( not ( = ?auto_502110 ?auto_502121 ) ) ( not ( = ?auto_502110 ?auto_502122 ) ) ( not ( = ?auto_502111 ?auto_502112 ) ) ( not ( = ?auto_502111 ?auto_502113 ) ) ( not ( = ?auto_502111 ?auto_502114 ) ) ( not ( = ?auto_502111 ?auto_502115 ) ) ( not ( = ?auto_502111 ?auto_502116 ) ) ( not ( = ?auto_502111 ?auto_502117 ) ) ( not ( = ?auto_502111 ?auto_502118 ) ) ( not ( = ?auto_502111 ?auto_502119 ) ) ( not ( = ?auto_502111 ?auto_502120 ) ) ( not ( = ?auto_502111 ?auto_502121 ) ) ( not ( = ?auto_502111 ?auto_502122 ) ) ( not ( = ?auto_502112 ?auto_502113 ) ) ( not ( = ?auto_502112 ?auto_502114 ) ) ( not ( = ?auto_502112 ?auto_502115 ) ) ( not ( = ?auto_502112 ?auto_502116 ) ) ( not ( = ?auto_502112 ?auto_502117 ) ) ( not ( = ?auto_502112 ?auto_502118 ) ) ( not ( = ?auto_502112 ?auto_502119 ) ) ( not ( = ?auto_502112 ?auto_502120 ) ) ( not ( = ?auto_502112 ?auto_502121 ) ) ( not ( = ?auto_502112 ?auto_502122 ) ) ( not ( = ?auto_502113 ?auto_502114 ) ) ( not ( = ?auto_502113 ?auto_502115 ) ) ( not ( = ?auto_502113 ?auto_502116 ) ) ( not ( = ?auto_502113 ?auto_502117 ) ) ( not ( = ?auto_502113 ?auto_502118 ) ) ( not ( = ?auto_502113 ?auto_502119 ) ) ( not ( = ?auto_502113 ?auto_502120 ) ) ( not ( = ?auto_502113 ?auto_502121 ) ) ( not ( = ?auto_502113 ?auto_502122 ) ) ( not ( = ?auto_502114 ?auto_502115 ) ) ( not ( = ?auto_502114 ?auto_502116 ) ) ( not ( = ?auto_502114 ?auto_502117 ) ) ( not ( = ?auto_502114 ?auto_502118 ) ) ( not ( = ?auto_502114 ?auto_502119 ) ) ( not ( = ?auto_502114 ?auto_502120 ) ) ( not ( = ?auto_502114 ?auto_502121 ) ) ( not ( = ?auto_502114 ?auto_502122 ) ) ( not ( = ?auto_502115 ?auto_502116 ) ) ( not ( = ?auto_502115 ?auto_502117 ) ) ( not ( = ?auto_502115 ?auto_502118 ) ) ( not ( = ?auto_502115 ?auto_502119 ) ) ( not ( = ?auto_502115 ?auto_502120 ) ) ( not ( = ?auto_502115 ?auto_502121 ) ) ( not ( = ?auto_502115 ?auto_502122 ) ) ( not ( = ?auto_502116 ?auto_502117 ) ) ( not ( = ?auto_502116 ?auto_502118 ) ) ( not ( = ?auto_502116 ?auto_502119 ) ) ( not ( = ?auto_502116 ?auto_502120 ) ) ( not ( = ?auto_502116 ?auto_502121 ) ) ( not ( = ?auto_502116 ?auto_502122 ) ) ( not ( = ?auto_502117 ?auto_502118 ) ) ( not ( = ?auto_502117 ?auto_502119 ) ) ( not ( = ?auto_502117 ?auto_502120 ) ) ( not ( = ?auto_502117 ?auto_502121 ) ) ( not ( = ?auto_502117 ?auto_502122 ) ) ( not ( = ?auto_502118 ?auto_502119 ) ) ( not ( = ?auto_502118 ?auto_502120 ) ) ( not ( = ?auto_502118 ?auto_502121 ) ) ( not ( = ?auto_502118 ?auto_502122 ) ) ( not ( = ?auto_502119 ?auto_502120 ) ) ( not ( = ?auto_502119 ?auto_502121 ) ) ( not ( = ?auto_502119 ?auto_502122 ) ) ( not ( = ?auto_502120 ?auto_502121 ) ) ( not ( = ?auto_502120 ?auto_502122 ) ) ( not ( = ?auto_502121 ?auto_502122 ) ) ( ON ?auto_502120 ?auto_502121 ) ( ON ?auto_502119 ?auto_502120 ) ( ON ?auto_502118 ?auto_502119 ) ( ON ?auto_502117 ?auto_502118 ) ( ON ?auto_502116 ?auto_502117 ) ( ON ?auto_502115 ?auto_502116 ) ( ON ?auto_502114 ?auto_502115 ) ( ON ?auto_502113 ?auto_502114 ) ( CLEAR ?auto_502111 ) ( ON ?auto_502112 ?auto_502113 ) ( CLEAR ?auto_502112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_502106 ?auto_502107 ?auto_502108 ?auto_502109 ?auto_502110 ?auto_502111 ?auto_502112 )
      ( MAKE-16PILE ?auto_502106 ?auto_502107 ?auto_502108 ?auto_502109 ?auto_502110 ?auto_502111 ?auto_502112 ?auto_502113 ?auto_502114 ?auto_502115 ?auto_502116 ?auto_502117 ?auto_502118 ?auto_502119 ?auto_502120 ?auto_502121 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502139 - BLOCK
      ?auto_502140 - BLOCK
      ?auto_502141 - BLOCK
      ?auto_502142 - BLOCK
      ?auto_502143 - BLOCK
      ?auto_502144 - BLOCK
      ?auto_502145 - BLOCK
      ?auto_502146 - BLOCK
      ?auto_502147 - BLOCK
      ?auto_502148 - BLOCK
      ?auto_502149 - BLOCK
      ?auto_502150 - BLOCK
      ?auto_502151 - BLOCK
      ?auto_502152 - BLOCK
      ?auto_502153 - BLOCK
      ?auto_502154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502154 ) ( ON-TABLE ?auto_502139 ) ( ON ?auto_502140 ?auto_502139 ) ( ON ?auto_502141 ?auto_502140 ) ( ON ?auto_502142 ?auto_502141 ) ( ON ?auto_502143 ?auto_502142 ) ( ON ?auto_502144 ?auto_502143 ) ( not ( = ?auto_502139 ?auto_502140 ) ) ( not ( = ?auto_502139 ?auto_502141 ) ) ( not ( = ?auto_502139 ?auto_502142 ) ) ( not ( = ?auto_502139 ?auto_502143 ) ) ( not ( = ?auto_502139 ?auto_502144 ) ) ( not ( = ?auto_502139 ?auto_502145 ) ) ( not ( = ?auto_502139 ?auto_502146 ) ) ( not ( = ?auto_502139 ?auto_502147 ) ) ( not ( = ?auto_502139 ?auto_502148 ) ) ( not ( = ?auto_502139 ?auto_502149 ) ) ( not ( = ?auto_502139 ?auto_502150 ) ) ( not ( = ?auto_502139 ?auto_502151 ) ) ( not ( = ?auto_502139 ?auto_502152 ) ) ( not ( = ?auto_502139 ?auto_502153 ) ) ( not ( = ?auto_502139 ?auto_502154 ) ) ( not ( = ?auto_502140 ?auto_502141 ) ) ( not ( = ?auto_502140 ?auto_502142 ) ) ( not ( = ?auto_502140 ?auto_502143 ) ) ( not ( = ?auto_502140 ?auto_502144 ) ) ( not ( = ?auto_502140 ?auto_502145 ) ) ( not ( = ?auto_502140 ?auto_502146 ) ) ( not ( = ?auto_502140 ?auto_502147 ) ) ( not ( = ?auto_502140 ?auto_502148 ) ) ( not ( = ?auto_502140 ?auto_502149 ) ) ( not ( = ?auto_502140 ?auto_502150 ) ) ( not ( = ?auto_502140 ?auto_502151 ) ) ( not ( = ?auto_502140 ?auto_502152 ) ) ( not ( = ?auto_502140 ?auto_502153 ) ) ( not ( = ?auto_502140 ?auto_502154 ) ) ( not ( = ?auto_502141 ?auto_502142 ) ) ( not ( = ?auto_502141 ?auto_502143 ) ) ( not ( = ?auto_502141 ?auto_502144 ) ) ( not ( = ?auto_502141 ?auto_502145 ) ) ( not ( = ?auto_502141 ?auto_502146 ) ) ( not ( = ?auto_502141 ?auto_502147 ) ) ( not ( = ?auto_502141 ?auto_502148 ) ) ( not ( = ?auto_502141 ?auto_502149 ) ) ( not ( = ?auto_502141 ?auto_502150 ) ) ( not ( = ?auto_502141 ?auto_502151 ) ) ( not ( = ?auto_502141 ?auto_502152 ) ) ( not ( = ?auto_502141 ?auto_502153 ) ) ( not ( = ?auto_502141 ?auto_502154 ) ) ( not ( = ?auto_502142 ?auto_502143 ) ) ( not ( = ?auto_502142 ?auto_502144 ) ) ( not ( = ?auto_502142 ?auto_502145 ) ) ( not ( = ?auto_502142 ?auto_502146 ) ) ( not ( = ?auto_502142 ?auto_502147 ) ) ( not ( = ?auto_502142 ?auto_502148 ) ) ( not ( = ?auto_502142 ?auto_502149 ) ) ( not ( = ?auto_502142 ?auto_502150 ) ) ( not ( = ?auto_502142 ?auto_502151 ) ) ( not ( = ?auto_502142 ?auto_502152 ) ) ( not ( = ?auto_502142 ?auto_502153 ) ) ( not ( = ?auto_502142 ?auto_502154 ) ) ( not ( = ?auto_502143 ?auto_502144 ) ) ( not ( = ?auto_502143 ?auto_502145 ) ) ( not ( = ?auto_502143 ?auto_502146 ) ) ( not ( = ?auto_502143 ?auto_502147 ) ) ( not ( = ?auto_502143 ?auto_502148 ) ) ( not ( = ?auto_502143 ?auto_502149 ) ) ( not ( = ?auto_502143 ?auto_502150 ) ) ( not ( = ?auto_502143 ?auto_502151 ) ) ( not ( = ?auto_502143 ?auto_502152 ) ) ( not ( = ?auto_502143 ?auto_502153 ) ) ( not ( = ?auto_502143 ?auto_502154 ) ) ( not ( = ?auto_502144 ?auto_502145 ) ) ( not ( = ?auto_502144 ?auto_502146 ) ) ( not ( = ?auto_502144 ?auto_502147 ) ) ( not ( = ?auto_502144 ?auto_502148 ) ) ( not ( = ?auto_502144 ?auto_502149 ) ) ( not ( = ?auto_502144 ?auto_502150 ) ) ( not ( = ?auto_502144 ?auto_502151 ) ) ( not ( = ?auto_502144 ?auto_502152 ) ) ( not ( = ?auto_502144 ?auto_502153 ) ) ( not ( = ?auto_502144 ?auto_502154 ) ) ( not ( = ?auto_502145 ?auto_502146 ) ) ( not ( = ?auto_502145 ?auto_502147 ) ) ( not ( = ?auto_502145 ?auto_502148 ) ) ( not ( = ?auto_502145 ?auto_502149 ) ) ( not ( = ?auto_502145 ?auto_502150 ) ) ( not ( = ?auto_502145 ?auto_502151 ) ) ( not ( = ?auto_502145 ?auto_502152 ) ) ( not ( = ?auto_502145 ?auto_502153 ) ) ( not ( = ?auto_502145 ?auto_502154 ) ) ( not ( = ?auto_502146 ?auto_502147 ) ) ( not ( = ?auto_502146 ?auto_502148 ) ) ( not ( = ?auto_502146 ?auto_502149 ) ) ( not ( = ?auto_502146 ?auto_502150 ) ) ( not ( = ?auto_502146 ?auto_502151 ) ) ( not ( = ?auto_502146 ?auto_502152 ) ) ( not ( = ?auto_502146 ?auto_502153 ) ) ( not ( = ?auto_502146 ?auto_502154 ) ) ( not ( = ?auto_502147 ?auto_502148 ) ) ( not ( = ?auto_502147 ?auto_502149 ) ) ( not ( = ?auto_502147 ?auto_502150 ) ) ( not ( = ?auto_502147 ?auto_502151 ) ) ( not ( = ?auto_502147 ?auto_502152 ) ) ( not ( = ?auto_502147 ?auto_502153 ) ) ( not ( = ?auto_502147 ?auto_502154 ) ) ( not ( = ?auto_502148 ?auto_502149 ) ) ( not ( = ?auto_502148 ?auto_502150 ) ) ( not ( = ?auto_502148 ?auto_502151 ) ) ( not ( = ?auto_502148 ?auto_502152 ) ) ( not ( = ?auto_502148 ?auto_502153 ) ) ( not ( = ?auto_502148 ?auto_502154 ) ) ( not ( = ?auto_502149 ?auto_502150 ) ) ( not ( = ?auto_502149 ?auto_502151 ) ) ( not ( = ?auto_502149 ?auto_502152 ) ) ( not ( = ?auto_502149 ?auto_502153 ) ) ( not ( = ?auto_502149 ?auto_502154 ) ) ( not ( = ?auto_502150 ?auto_502151 ) ) ( not ( = ?auto_502150 ?auto_502152 ) ) ( not ( = ?auto_502150 ?auto_502153 ) ) ( not ( = ?auto_502150 ?auto_502154 ) ) ( not ( = ?auto_502151 ?auto_502152 ) ) ( not ( = ?auto_502151 ?auto_502153 ) ) ( not ( = ?auto_502151 ?auto_502154 ) ) ( not ( = ?auto_502152 ?auto_502153 ) ) ( not ( = ?auto_502152 ?auto_502154 ) ) ( not ( = ?auto_502153 ?auto_502154 ) ) ( ON ?auto_502153 ?auto_502154 ) ( ON ?auto_502152 ?auto_502153 ) ( ON ?auto_502151 ?auto_502152 ) ( ON ?auto_502150 ?auto_502151 ) ( ON ?auto_502149 ?auto_502150 ) ( ON ?auto_502148 ?auto_502149 ) ( ON ?auto_502147 ?auto_502148 ) ( ON ?auto_502146 ?auto_502147 ) ( CLEAR ?auto_502144 ) ( ON ?auto_502145 ?auto_502146 ) ( CLEAR ?auto_502145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_502139 ?auto_502140 ?auto_502141 ?auto_502142 ?auto_502143 ?auto_502144 ?auto_502145 )
      ( MAKE-16PILE ?auto_502139 ?auto_502140 ?auto_502141 ?auto_502142 ?auto_502143 ?auto_502144 ?auto_502145 ?auto_502146 ?auto_502147 ?auto_502148 ?auto_502149 ?auto_502150 ?auto_502151 ?auto_502152 ?auto_502153 ?auto_502154 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502171 - BLOCK
      ?auto_502172 - BLOCK
      ?auto_502173 - BLOCK
      ?auto_502174 - BLOCK
      ?auto_502175 - BLOCK
      ?auto_502176 - BLOCK
      ?auto_502177 - BLOCK
      ?auto_502178 - BLOCK
      ?auto_502179 - BLOCK
      ?auto_502180 - BLOCK
      ?auto_502181 - BLOCK
      ?auto_502182 - BLOCK
      ?auto_502183 - BLOCK
      ?auto_502184 - BLOCK
      ?auto_502185 - BLOCK
      ?auto_502186 - BLOCK
    )
    :vars
    (
      ?auto_502187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502186 ?auto_502187 ) ( ON-TABLE ?auto_502171 ) ( ON ?auto_502172 ?auto_502171 ) ( ON ?auto_502173 ?auto_502172 ) ( ON ?auto_502174 ?auto_502173 ) ( ON ?auto_502175 ?auto_502174 ) ( not ( = ?auto_502171 ?auto_502172 ) ) ( not ( = ?auto_502171 ?auto_502173 ) ) ( not ( = ?auto_502171 ?auto_502174 ) ) ( not ( = ?auto_502171 ?auto_502175 ) ) ( not ( = ?auto_502171 ?auto_502176 ) ) ( not ( = ?auto_502171 ?auto_502177 ) ) ( not ( = ?auto_502171 ?auto_502178 ) ) ( not ( = ?auto_502171 ?auto_502179 ) ) ( not ( = ?auto_502171 ?auto_502180 ) ) ( not ( = ?auto_502171 ?auto_502181 ) ) ( not ( = ?auto_502171 ?auto_502182 ) ) ( not ( = ?auto_502171 ?auto_502183 ) ) ( not ( = ?auto_502171 ?auto_502184 ) ) ( not ( = ?auto_502171 ?auto_502185 ) ) ( not ( = ?auto_502171 ?auto_502186 ) ) ( not ( = ?auto_502171 ?auto_502187 ) ) ( not ( = ?auto_502172 ?auto_502173 ) ) ( not ( = ?auto_502172 ?auto_502174 ) ) ( not ( = ?auto_502172 ?auto_502175 ) ) ( not ( = ?auto_502172 ?auto_502176 ) ) ( not ( = ?auto_502172 ?auto_502177 ) ) ( not ( = ?auto_502172 ?auto_502178 ) ) ( not ( = ?auto_502172 ?auto_502179 ) ) ( not ( = ?auto_502172 ?auto_502180 ) ) ( not ( = ?auto_502172 ?auto_502181 ) ) ( not ( = ?auto_502172 ?auto_502182 ) ) ( not ( = ?auto_502172 ?auto_502183 ) ) ( not ( = ?auto_502172 ?auto_502184 ) ) ( not ( = ?auto_502172 ?auto_502185 ) ) ( not ( = ?auto_502172 ?auto_502186 ) ) ( not ( = ?auto_502172 ?auto_502187 ) ) ( not ( = ?auto_502173 ?auto_502174 ) ) ( not ( = ?auto_502173 ?auto_502175 ) ) ( not ( = ?auto_502173 ?auto_502176 ) ) ( not ( = ?auto_502173 ?auto_502177 ) ) ( not ( = ?auto_502173 ?auto_502178 ) ) ( not ( = ?auto_502173 ?auto_502179 ) ) ( not ( = ?auto_502173 ?auto_502180 ) ) ( not ( = ?auto_502173 ?auto_502181 ) ) ( not ( = ?auto_502173 ?auto_502182 ) ) ( not ( = ?auto_502173 ?auto_502183 ) ) ( not ( = ?auto_502173 ?auto_502184 ) ) ( not ( = ?auto_502173 ?auto_502185 ) ) ( not ( = ?auto_502173 ?auto_502186 ) ) ( not ( = ?auto_502173 ?auto_502187 ) ) ( not ( = ?auto_502174 ?auto_502175 ) ) ( not ( = ?auto_502174 ?auto_502176 ) ) ( not ( = ?auto_502174 ?auto_502177 ) ) ( not ( = ?auto_502174 ?auto_502178 ) ) ( not ( = ?auto_502174 ?auto_502179 ) ) ( not ( = ?auto_502174 ?auto_502180 ) ) ( not ( = ?auto_502174 ?auto_502181 ) ) ( not ( = ?auto_502174 ?auto_502182 ) ) ( not ( = ?auto_502174 ?auto_502183 ) ) ( not ( = ?auto_502174 ?auto_502184 ) ) ( not ( = ?auto_502174 ?auto_502185 ) ) ( not ( = ?auto_502174 ?auto_502186 ) ) ( not ( = ?auto_502174 ?auto_502187 ) ) ( not ( = ?auto_502175 ?auto_502176 ) ) ( not ( = ?auto_502175 ?auto_502177 ) ) ( not ( = ?auto_502175 ?auto_502178 ) ) ( not ( = ?auto_502175 ?auto_502179 ) ) ( not ( = ?auto_502175 ?auto_502180 ) ) ( not ( = ?auto_502175 ?auto_502181 ) ) ( not ( = ?auto_502175 ?auto_502182 ) ) ( not ( = ?auto_502175 ?auto_502183 ) ) ( not ( = ?auto_502175 ?auto_502184 ) ) ( not ( = ?auto_502175 ?auto_502185 ) ) ( not ( = ?auto_502175 ?auto_502186 ) ) ( not ( = ?auto_502175 ?auto_502187 ) ) ( not ( = ?auto_502176 ?auto_502177 ) ) ( not ( = ?auto_502176 ?auto_502178 ) ) ( not ( = ?auto_502176 ?auto_502179 ) ) ( not ( = ?auto_502176 ?auto_502180 ) ) ( not ( = ?auto_502176 ?auto_502181 ) ) ( not ( = ?auto_502176 ?auto_502182 ) ) ( not ( = ?auto_502176 ?auto_502183 ) ) ( not ( = ?auto_502176 ?auto_502184 ) ) ( not ( = ?auto_502176 ?auto_502185 ) ) ( not ( = ?auto_502176 ?auto_502186 ) ) ( not ( = ?auto_502176 ?auto_502187 ) ) ( not ( = ?auto_502177 ?auto_502178 ) ) ( not ( = ?auto_502177 ?auto_502179 ) ) ( not ( = ?auto_502177 ?auto_502180 ) ) ( not ( = ?auto_502177 ?auto_502181 ) ) ( not ( = ?auto_502177 ?auto_502182 ) ) ( not ( = ?auto_502177 ?auto_502183 ) ) ( not ( = ?auto_502177 ?auto_502184 ) ) ( not ( = ?auto_502177 ?auto_502185 ) ) ( not ( = ?auto_502177 ?auto_502186 ) ) ( not ( = ?auto_502177 ?auto_502187 ) ) ( not ( = ?auto_502178 ?auto_502179 ) ) ( not ( = ?auto_502178 ?auto_502180 ) ) ( not ( = ?auto_502178 ?auto_502181 ) ) ( not ( = ?auto_502178 ?auto_502182 ) ) ( not ( = ?auto_502178 ?auto_502183 ) ) ( not ( = ?auto_502178 ?auto_502184 ) ) ( not ( = ?auto_502178 ?auto_502185 ) ) ( not ( = ?auto_502178 ?auto_502186 ) ) ( not ( = ?auto_502178 ?auto_502187 ) ) ( not ( = ?auto_502179 ?auto_502180 ) ) ( not ( = ?auto_502179 ?auto_502181 ) ) ( not ( = ?auto_502179 ?auto_502182 ) ) ( not ( = ?auto_502179 ?auto_502183 ) ) ( not ( = ?auto_502179 ?auto_502184 ) ) ( not ( = ?auto_502179 ?auto_502185 ) ) ( not ( = ?auto_502179 ?auto_502186 ) ) ( not ( = ?auto_502179 ?auto_502187 ) ) ( not ( = ?auto_502180 ?auto_502181 ) ) ( not ( = ?auto_502180 ?auto_502182 ) ) ( not ( = ?auto_502180 ?auto_502183 ) ) ( not ( = ?auto_502180 ?auto_502184 ) ) ( not ( = ?auto_502180 ?auto_502185 ) ) ( not ( = ?auto_502180 ?auto_502186 ) ) ( not ( = ?auto_502180 ?auto_502187 ) ) ( not ( = ?auto_502181 ?auto_502182 ) ) ( not ( = ?auto_502181 ?auto_502183 ) ) ( not ( = ?auto_502181 ?auto_502184 ) ) ( not ( = ?auto_502181 ?auto_502185 ) ) ( not ( = ?auto_502181 ?auto_502186 ) ) ( not ( = ?auto_502181 ?auto_502187 ) ) ( not ( = ?auto_502182 ?auto_502183 ) ) ( not ( = ?auto_502182 ?auto_502184 ) ) ( not ( = ?auto_502182 ?auto_502185 ) ) ( not ( = ?auto_502182 ?auto_502186 ) ) ( not ( = ?auto_502182 ?auto_502187 ) ) ( not ( = ?auto_502183 ?auto_502184 ) ) ( not ( = ?auto_502183 ?auto_502185 ) ) ( not ( = ?auto_502183 ?auto_502186 ) ) ( not ( = ?auto_502183 ?auto_502187 ) ) ( not ( = ?auto_502184 ?auto_502185 ) ) ( not ( = ?auto_502184 ?auto_502186 ) ) ( not ( = ?auto_502184 ?auto_502187 ) ) ( not ( = ?auto_502185 ?auto_502186 ) ) ( not ( = ?auto_502185 ?auto_502187 ) ) ( not ( = ?auto_502186 ?auto_502187 ) ) ( ON ?auto_502185 ?auto_502186 ) ( ON ?auto_502184 ?auto_502185 ) ( ON ?auto_502183 ?auto_502184 ) ( ON ?auto_502182 ?auto_502183 ) ( ON ?auto_502181 ?auto_502182 ) ( ON ?auto_502180 ?auto_502181 ) ( ON ?auto_502179 ?auto_502180 ) ( ON ?auto_502178 ?auto_502179 ) ( ON ?auto_502177 ?auto_502178 ) ( CLEAR ?auto_502175 ) ( ON ?auto_502176 ?auto_502177 ) ( CLEAR ?auto_502176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_502171 ?auto_502172 ?auto_502173 ?auto_502174 ?auto_502175 ?auto_502176 )
      ( MAKE-16PILE ?auto_502171 ?auto_502172 ?auto_502173 ?auto_502174 ?auto_502175 ?auto_502176 ?auto_502177 ?auto_502178 ?auto_502179 ?auto_502180 ?auto_502181 ?auto_502182 ?auto_502183 ?auto_502184 ?auto_502185 ?auto_502186 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502204 - BLOCK
      ?auto_502205 - BLOCK
      ?auto_502206 - BLOCK
      ?auto_502207 - BLOCK
      ?auto_502208 - BLOCK
      ?auto_502209 - BLOCK
      ?auto_502210 - BLOCK
      ?auto_502211 - BLOCK
      ?auto_502212 - BLOCK
      ?auto_502213 - BLOCK
      ?auto_502214 - BLOCK
      ?auto_502215 - BLOCK
      ?auto_502216 - BLOCK
      ?auto_502217 - BLOCK
      ?auto_502218 - BLOCK
      ?auto_502219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502219 ) ( ON-TABLE ?auto_502204 ) ( ON ?auto_502205 ?auto_502204 ) ( ON ?auto_502206 ?auto_502205 ) ( ON ?auto_502207 ?auto_502206 ) ( ON ?auto_502208 ?auto_502207 ) ( not ( = ?auto_502204 ?auto_502205 ) ) ( not ( = ?auto_502204 ?auto_502206 ) ) ( not ( = ?auto_502204 ?auto_502207 ) ) ( not ( = ?auto_502204 ?auto_502208 ) ) ( not ( = ?auto_502204 ?auto_502209 ) ) ( not ( = ?auto_502204 ?auto_502210 ) ) ( not ( = ?auto_502204 ?auto_502211 ) ) ( not ( = ?auto_502204 ?auto_502212 ) ) ( not ( = ?auto_502204 ?auto_502213 ) ) ( not ( = ?auto_502204 ?auto_502214 ) ) ( not ( = ?auto_502204 ?auto_502215 ) ) ( not ( = ?auto_502204 ?auto_502216 ) ) ( not ( = ?auto_502204 ?auto_502217 ) ) ( not ( = ?auto_502204 ?auto_502218 ) ) ( not ( = ?auto_502204 ?auto_502219 ) ) ( not ( = ?auto_502205 ?auto_502206 ) ) ( not ( = ?auto_502205 ?auto_502207 ) ) ( not ( = ?auto_502205 ?auto_502208 ) ) ( not ( = ?auto_502205 ?auto_502209 ) ) ( not ( = ?auto_502205 ?auto_502210 ) ) ( not ( = ?auto_502205 ?auto_502211 ) ) ( not ( = ?auto_502205 ?auto_502212 ) ) ( not ( = ?auto_502205 ?auto_502213 ) ) ( not ( = ?auto_502205 ?auto_502214 ) ) ( not ( = ?auto_502205 ?auto_502215 ) ) ( not ( = ?auto_502205 ?auto_502216 ) ) ( not ( = ?auto_502205 ?auto_502217 ) ) ( not ( = ?auto_502205 ?auto_502218 ) ) ( not ( = ?auto_502205 ?auto_502219 ) ) ( not ( = ?auto_502206 ?auto_502207 ) ) ( not ( = ?auto_502206 ?auto_502208 ) ) ( not ( = ?auto_502206 ?auto_502209 ) ) ( not ( = ?auto_502206 ?auto_502210 ) ) ( not ( = ?auto_502206 ?auto_502211 ) ) ( not ( = ?auto_502206 ?auto_502212 ) ) ( not ( = ?auto_502206 ?auto_502213 ) ) ( not ( = ?auto_502206 ?auto_502214 ) ) ( not ( = ?auto_502206 ?auto_502215 ) ) ( not ( = ?auto_502206 ?auto_502216 ) ) ( not ( = ?auto_502206 ?auto_502217 ) ) ( not ( = ?auto_502206 ?auto_502218 ) ) ( not ( = ?auto_502206 ?auto_502219 ) ) ( not ( = ?auto_502207 ?auto_502208 ) ) ( not ( = ?auto_502207 ?auto_502209 ) ) ( not ( = ?auto_502207 ?auto_502210 ) ) ( not ( = ?auto_502207 ?auto_502211 ) ) ( not ( = ?auto_502207 ?auto_502212 ) ) ( not ( = ?auto_502207 ?auto_502213 ) ) ( not ( = ?auto_502207 ?auto_502214 ) ) ( not ( = ?auto_502207 ?auto_502215 ) ) ( not ( = ?auto_502207 ?auto_502216 ) ) ( not ( = ?auto_502207 ?auto_502217 ) ) ( not ( = ?auto_502207 ?auto_502218 ) ) ( not ( = ?auto_502207 ?auto_502219 ) ) ( not ( = ?auto_502208 ?auto_502209 ) ) ( not ( = ?auto_502208 ?auto_502210 ) ) ( not ( = ?auto_502208 ?auto_502211 ) ) ( not ( = ?auto_502208 ?auto_502212 ) ) ( not ( = ?auto_502208 ?auto_502213 ) ) ( not ( = ?auto_502208 ?auto_502214 ) ) ( not ( = ?auto_502208 ?auto_502215 ) ) ( not ( = ?auto_502208 ?auto_502216 ) ) ( not ( = ?auto_502208 ?auto_502217 ) ) ( not ( = ?auto_502208 ?auto_502218 ) ) ( not ( = ?auto_502208 ?auto_502219 ) ) ( not ( = ?auto_502209 ?auto_502210 ) ) ( not ( = ?auto_502209 ?auto_502211 ) ) ( not ( = ?auto_502209 ?auto_502212 ) ) ( not ( = ?auto_502209 ?auto_502213 ) ) ( not ( = ?auto_502209 ?auto_502214 ) ) ( not ( = ?auto_502209 ?auto_502215 ) ) ( not ( = ?auto_502209 ?auto_502216 ) ) ( not ( = ?auto_502209 ?auto_502217 ) ) ( not ( = ?auto_502209 ?auto_502218 ) ) ( not ( = ?auto_502209 ?auto_502219 ) ) ( not ( = ?auto_502210 ?auto_502211 ) ) ( not ( = ?auto_502210 ?auto_502212 ) ) ( not ( = ?auto_502210 ?auto_502213 ) ) ( not ( = ?auto_502210 ?auto_502214 ) ) ( not ( = ?auto_502210 ?auto_502215 ) ) ( not ( = ?auto_502210 ?auto_502216 ) ) ( not ( = ?auto_502210 ?auto_502217 ) ) ( not ( = ?auto_502210 ?auto_502218 ) ) ( not ( = ?auto_502210 ?auto_502219 ) ) ( not ( = ?auto_502211 ?auto_502212 ) ) ( not ( = ?auto_502211 ?auto_502213 ) ) ( not ( = ?auto_502211 ?auto_502214 ) ) ( not ( = ?auto_502211 ?auto_502215 ) ) ( not ( = ?auto_502211 ?auto_502216 ) ) ( not ( = ?auto_502211 ?auto_502217 ) ) ( not ( = ?auto_502211 ?auto_502218 ) ) ( not ( = ?auto_502211 ?auto_502219 ) ) ( not ( = ?auto_502212 ?auto_502213 ) ) ( not ( = ?auto_502212 ?auto_502214 ) ) ( not ( = ?auto_502212 ?auto_502215 ) ) ( not ( = ?auto_502212 ?auto_502216 ) ) ( not ( = ?auto_502212 ?auto_502217 ) ) ( not ( = ?auto_502212 ?auto_502218 ) ) ( not ( = ?auto_502212 ?auto_502219 ) ) ( not ( = ?auto_502213 ?auto_502214 ) ) ( not ( = ?auto_502213 ?auto_502215 ) ) ( not ( = ?auto_502213 ?auto_502216 ) ) ( not ( = ?auto_502213 ?auto_502217 ) ) ( not ( = ?auto_502213 ?auto_502218 ) ) ( not ( = ?auto_502213 ?auto_502219 ) ) ( not ( = ?auto_502214 ?auto_502215 ) ) ( not ( = ?auto_502214 ?auto_502216 ) ) ( not ( = ?auto_502214 ?auto_502217 ) ) ( not ( = ?auto_502214 ?auto_502218 ) ) ( not ( = ?auto_502214 ?auto_502219 ) ) ( not ( = ?auto_502215 ?auto_502216 ) ) ( not ( = ?auto_502215 ?auto_502217 ) ) ( not ( = ?auto_502215 ?auto_502218 ) ) ( not ( = ?auto_502215 ?auto_502219 ) ) ( not ( = ?auto_502216 ?auto_502217 ) ) ( not ( = ?auto_502216 ?auto_502218 ) ) ( not ( = ?auto_502216 ?auto_502219 ) ) ( not ( = ?auto_502217 ?auto_502218 ) ) ( not ( = ?auto_502217 ?auto_502219 ) ) ( not ( = ?auto_502218 ?auto_502219 ) ) ( ON ?auto_502218 ?auto_502219 ) ( ON ?auto_502217 ?auto_502218 ) ( ON ?auto_502216 ?auto_502217 ) ( ON ?auto_502215 ?auto_502216 ) ( ON ?auto_502214 ?auto_502215 ) ( ON ?auto_502213 ?auto_502214 ) ( ON ?auto_502212 ?auto_502213 ) ( ON ?auto_502211 ?auto_502212 ) ( ON ?auto_502210 ?auto_502211 ) ( CLEAR ?auto_502208 ) ( ON ?auto_502209 ?auto_502210 ) ( CLEAR ?auto_502209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_502204 ?auto_502205 ?auto_502206 ?auto_502207 ?auto_502208 ?auto_502209 )
      ( MAKE-16PILE ?auto_502204 ?auto_502205 ?auto_502206 ?auto_502207 ?auto_502208 ?auto_502209 ?auto_502210 ?auto_502211 ?auto_502212 ?auto_502213 ?auto_502214 ?auto_502215 ?auto_502216 ?auto_502217 ?auto_502218 ?auto_502219 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502236 - BLOCK
      ?auto_502237 - BLOCK
      ?auto_502238 - BLOCK
      ?auto_502239 - BLOCK
      ?auto_502240 - BLOCK
      ?auto_502241 - BLOCK
      ?auto_502242 - BLOCK
      ?auto_502243 - BLOCK
      ?auto_502244 - BLOCK
      ?auto_502245 - BLOCK
      ?auto_502246 - BLOCK
      ?auto_502247 - BLOCK
      ?auto_502248 - BLOCK
      ?auto_502249 - BLOCK
      ?auto_502250 - BLOCK
      ?auto_502251 - BLOCK
    )
    :vars
    (
      ?auto_502252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502251 ?auto_502252 ) ( ON-TABLE ?auto_502236 ) ( ON ?auto_502237 ?auto_502236 ) ( ON ?auto_502238 ?auto_502237 ) ( ON ?auto_502239 ?auto_502238 ) ( not ( = ?auto_502236 ?auto_502237 ) ) ( not ( = ?auto_502236 ?auto_502238 ) ) ( not ( = ?auto_502236 ?auto_502239 ) ) ( not ( = ?auto_502236 ?auto_502240 ) ) ( not ( = ?auto_502236 ?auto_502241 ) ) ( not ( = ?auto_502236 ?auto_502242 ) ) ( not ( = ?auto_502236 ?auto_502243 ) ) ( not ( = ?auto_502236 ?auto_502244 ) ) ( not ( = ?auto_502236 ?auto_502245 ) ) ( not ( = ?auto_502236 ?auto_502246 ) ) ( not ( = ?auto_502236 ?auto_502247 ) ) ( not ( = ?auto_502236 ?auto_502248 ) ) ( not ( = ?auto_502236 ?auto_502249 ) ) ( not ( = ?auto_502236 ?auto_502250 ) ) ( not ( = ?auto_502236 ?auto_502251 ) ) ( not ( = ?auto_502236 ?auto_502252 ) ) ( not ( = ?auto_502237 ?auto_502238 ) ) ( not ( = ?auto_502237 ?auto_502239 ) ) ( not ( = ?auto_502237 ?auto_502240 ) ) ( not ( = ?auto_502237 ?auto_502241 ) ) ( not ( = ?auto_502237 ?auto_502242 ) ) ( not ( = ?auto_502237 ?auto_502243 ) ) ( not ( = ?auto_502237 ?auto_502244 ) ) ( not ( = ?auto_502237 ?auto_502245 ) ) ( not ( = ?auto_502237 ?auto_502246 ) ) ( not ( = ?auto_502237 ?auto_502247 ) ) ( not ( = ?auto_502237 ?auto_502248 ) ) ( not ( = ?auto_502237 ?auto_502249 ) ) ( not ( = ?auto_502237 ?auto_502250 ) ) ( not ( = ?auto_502237 ?auto_502251 ) ) ( not ( = ?auto_502237 ?auto_502252 ) ) ( not ( = ?auto_502238 ?auto_502239 ) ) ( not ( = ?auto_502238 ?auto_502240 ) ) ( not ( = ?auto_502238 ?auto_502241 ) ) ( not ( = ?auto_502238 ?auto_502242 ) ) ( not ( = ?auto_502238 ?auto_502243 ) ) ( not ( = ?auto_502238 ?auto_502244 ) ) ( not ( = ?auto_502238 ?auto_502245 ) ) ( not ( = ?auto_502238 ?auto_502246 ) ) ( not ( = ?auto_502238 ?auto_502247 ) ) ( not ( = ?auto_502238 ?auto_502248 ) ) ( not ( = ?auto_502238 ?auto_502249 ) ) ( not ( = ?auto_502238 ?auto_502250 ) ) ( not ( = ?auto_502238 ?auto_502251 ) ) ( not ( = ?auto_502238 ?auto_502252 ) ) ( not ( = ?auto_502239 ?auto_502240 ) ) ( not ( = ?auto_502239 ?auto_502241 ) ) ( not ( = ?auto_502239 ?auto_502242 ) ) ( not ( = ?auto_502239 ?auto_502243 ) ) ( not ( = ?auto_502239 ?auto_502244 ) ) ( not ( = ?auto_502239 ?auto_502245 ) ) ( not ( = ?auto_502239 ?auto_502246 ) ) ( not ( = ?auto_502239 ?auto_502247 ) ) ( not ( = ?auto_502239 ?auto_502248 ) ) ( not ( = ?auto_502239 ?auto_502249 ) ) ( not ( = ?auto_502239 ?auto_502250 ) ) ( not ( = ?auto_502239 ?auto_502251 ) ) ( not ( = ?auto_502239 ?auto_502252 ) ) ( not ( = ?auto_502240 ?auto_502241 ) ) ( not ( = ?auto_502240 ?auto_502242 ) ) ( not ( = ?auto_502240 ?auto_502243 ) ) ( not ( = ?auto_502240 ?auto_502244 ) ) ( not ( = ?auto_502240 ?auto_502245 ) ) ( not ( = ?auto_502240 ?auto_502246 ) ) ( not ( = ?auto_502240 ?auto_502247 ) ) ( not ( = ?auto_502240 ?auto_502248 ) ) ( not ( = ?auto_502240 ?auto_502249 ) ) ( not ( = ?auto_502240 ?auto_502250 ) ) ( not ( = ?auto_502240 ?auto_502251 ) ) ( not ( = ?auto_502240 ?auto_502252 ) ) ( not ( = ?auto_502241 ?auto_502242 ) ) ( not ( = ?auto_502241 ?auto_502243 ) ) ( not ( = ?auto_502241 ?auto_502244 ) ) ( not ( = ?auto_502241 ?auto_502245 ) ) ( not ( = ?auto_502241 ?auto_502246 ) ) ( not ( = ?auto_502241 ?auto_502247 ) ) ( not ( = ?auto_502241 ?auto_502248 ) ) ( not ( = ?auto_502241 ?auto_502249 ) ) ( not ( = ?auto_502241 ?auto_502250 ) ) ( not ( = ?auto_502241 ?auto_502251 ) ) ( not ( = ?auto_502241 ?auto_502252 ) ) ( not ( = ?auto_502242 ?auto_502243 ) ) ( not ( = ?auto_502242 ?auto_502244 ) ) ( not ( = ?auto_502242 ?auto_502245 ) ) ( not ( = ?auto_502242 ?auto_502246 ) ) ( not ( = ?auto_502242 ?auto_502247 ) ) ( not ( = ?auto_502242 ?auto_502248 ) ) ( not ( = ?auto_502242 ?auto_502249 ) ) ( not ( = ?auto_502242 ?auto_502250 ) ) ( not ( = ?auto_502242 ?auto_502251 ) ) ( not ( = ?auto_502242 ?auto_502252 ) ) ( not ( = ?auto_502243 ?auto_502244 ) ) ( not ( = ?auto_502243 ?auto_502245 ) ) ( not ( = ?auto_502243 ?auto_502246 ) ) ( not ( = ?auto_502243 ?auto_502247 ) ) ( not ( = ?auto_502243 ?auto_502248 ) ) ( not ( = ?auto_502243 ?auto_502249 ) ) ( not ( = ?auto_502243 ?auto_502250 ) ) ( not ( = ?auto_502243 ?auto_502251 ) ) ( not ( = ?auto_502243 ?auto_502252 ) ) ( not ( = ?auto_502244 ?auto_502245 ) ) ( not ( = ?auto_502244 ?auto_502246 ) ) ( not ( = ?auto_502244 ?auto_502247 ) ) ( not ( = ?auto_502244 ?auto_502248 ) ) ( not ( = ?auto_502244 ?auto_502249 ) ) ( not ( = ?auto_502244 ?auto_502250 ) ) ( not ( = ?auto_502244 ?auto_502251 ) ) ( not ( = ?auto_502244 ?auto_502252 ) ) ( not ( = ?auto_502245 ?auto_502246 ) ) ( not ( = ?auto_502245 ?auto_502247 ) ) ( not ( = ?auto_502245 ?auto_502248 ) ) ( not ( = ?auto_502245 ?auto_502249 ) ) ( not ( = ?auto_502245 ?auto_502250 ) ) ( not ( = ?auto_502245 ?auto_502251 ) ) ( not ( = ?auto_502245 ?auto_502252 ) ) ( not ( = ?auto_502246 ?auto_502247 ) ) ( not ( = ?auto_502246 ?auto_502248 ) ) ( not ( = ?auto_502246 ?auto_502249 ) ) ( not ( = ?auto_502246 ?auto_502250 ) ) ( not ( = ?auto_502246 ?auto_502251 ) ) ( not ( = ?auto_502246 ?auto_502252 ) ) ( not ( = ?auto_502247 ?auto_502248 ) ) ( not ( = ?auto_502247 ?auto_502249 ) ) ( not ( = ?auto_502247 ?auto_502250 ) ) ( not ( = ?auto_502247 ?auto_502251 ) ) ( not ( = ?auto_502247 ?auto_502252 ) ) ( not ( = ?auto_502248 ?auto_502249 ) ) ( not ( = ?auto_502248 ?auto_502250 ) ) ( not ( = ?auto_502248 ?auto_502251 ) ) ( not ( = ?auto_502248 ?auto_502252 ) ) ( not ( = ?auto_502249 ?auto_502250 ) ) ( not ( = ?auto_502249 ?auto_502251 ) ) ( not ( = ?auto_502249 ?auto_502252 ) ) ( not ( = ?auto_502250 ?auto_502251 ) ) ( not ( = ?auto_502250 ?auto_502252 ) ) ( not ( = ?auto_502251 ?auto_502252 ) ) ( ON ?auto_502250 ?auto_502251 ) ( ON ?auto_502249 ?auto_502250 ) ( ON ?auto_502248 ?auto_502249 ) ( ON ?auto_502247 ?auto_502248 ) ( ON ?auto_502246 ?auto_502247 ) ( ON ?auto_502245 ?auto_502246 ) ( ON ?auto_502244 ?auto_502245 ) ( ON ?auto_502243 ?auto_502244 ) ( ON ?auto_502242 ?auto_502243 ) ( ON ?auto_502241 ?auto_502242 ) ( CLEAR ?auto_502239 ) ( ON ?auto_502240 ?auto_502241 ) ( CLEAR ?auto_502240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_502236 ?auto_502237 ?auto_502238 ?auto_502239 ?auto_502240 )
      ( MAKE-16PILE ?auto_502236 ?auto_502237 ?auto_502238 ?auto_502239 ?auto_502240 ?auto_502241 ?auto_502242 ?auto_502243 ?auto_502244 ?auto_502245 ?auto_502246 ?auto_502247 ?auto_502248 ?auto_502249 ?auto_502250 ?auto_502251 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502269 - BLOCK
      ?auto_502270 - BLOCK
      ?auto_502271 - BLOCK
      ?auto_502272 - BLOCK
      ?auto_502273 - BLOCK
      ?auto_502274 - BLOCK
      ?auto_502275 - BLOCK
      ?auto_502276 - BLOCK
      ?auto_502277 - BLOCK
      ?auto_502278 - BLOCK
      ?auto_502279 - BLOCK
      ?auto_502280 - BLOCK
      ?auto_502281 - BLOCK
      ?auto_502282 - BLOCK
      ?auto_502283 - BLOCK
      ?auto_502284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502284 ) ( ON-TABLE ?auto_502269 ) ( ON ?auto_502270 ?auto_502269 ) ( ON ?auto_502271 ?auto_502270 ) ( ON ?auto_502272 ?auto_502271 ) ( not ( = ?auto_502269 ?auto_502270 ) ) ( not ( = ?auto_502269 ?auto_502271 ) ) ( not ( = ?auto_502269 ?auto_502272 ) ) ( not ( = ?auto_502269 ?auto_502273 ) ) ( not ( = ?auto_502269 ?auto_502274 ) ) ( not ( = ?auto_502269 ?auto_502275 ) ) ( not ( = ?auto_502269 ?auto_502276 ) ) ( not ( = ?auto_502269 ?auto_502277 ) ) ( not ( = ?auto_502269 ?auto_502278 ) ) ( not ( = ?auto_502269 ?auto_502279 ) ) ( not ( = ?auto_502269 ?auto_502280 ) ) ( not ( = ?auto_502269 ?auto_502281 ) ) ( not ( = ?auto_502269 ?auto_502282 ) ) ( not ( = ?auto_502269 ?auto_502283 ) ) ( not ( = ?auto_502269 ?auto_502284 ) ) ( not ( = ?auto_502270 ?auto_502271 ) ) ( not ( = ?auto_502270 ?auto_502272 ) ) ( not ( = ?auto_502270 ?auto_502273 ) ) ( not ( = ?auto_502270 ?auto_502274 ) ) ( not ( = ?auto_502270 ?auto_502275 ) ) ( not ( = ?auto_502270 ?auto_502276 ) ) ( not ( = ?auto_502270 ?auto_502277 ) ) ( not ( = ?auto_502270 ?auto_502278 ) ) ( not ( = ?auto_502270 ?auto_502279 ) ) ( not ( = ?auto_502270 ?auto_502280 ) ) ( not ( = ?auto_502270 ?auto_502281 ) ) ( not ( = ?auto_502270 ?auto_502282 ) ) ( not ( = ?auto_502270 ?auto_502283 ) ) ( not ( = ?auto_502270 ?auto_502284 ) ) ( not ( = ?auto_502271 ?auto_502272 ) ) ( not ( = ?auto_502271 ?auto_502273 ) ) ( not ( = ?auto_502271 ?auto_502274 ) ) ( not ( = ?auto_502271 ?auto_502275 ) ) ( not ( = ?auto_502271 ?auto_502276 ) ) ( not ( = ?auto_502271 ?auto_502277 ) ) ( not ( = ?auto_502271 ?auto_502278 ) ) ( not ( = ?auto_502271 ?auto_502279 ) ) ( not ( = ?auto_502271 ?auto_502280 ) ) ( not ( = ?auto_502271 ?auto_502281 ) ) ( not ( = ?auto_502271 ?auto_502282 ) ) ( not ( = ?auto_502271 ?auto_502283 ) ) ( not ( = ?auto_502271 ?auto_502284 ) ) ( not ( = ?auto_502272 ?auto_502273 ) ) ( not ( = ?auto_502272 ?auto_502274 ) ) ( not ( = ?auto_502272 ?auto_502275 ) ) ( not ( = ?auto_502272 ?auto_502276 ) ) ( not ( = ?auto_502272 ?auto_502277 ) ) ( not ( = ?auto_502272 ?auto_502278 ) ) ( not ( = ?auto_502272 ?auto_502279 ) ) ( not ( = ?auto_502272 ?auto_502280 ) ) ( not ( = ?auto_502272 ?auto_502281 ) ) ( not ( = ?auto_502272 ?auto_502282 ) ) ( not ( = ?auto_502272 ?auto_502283 ) ) ( not ( = ?auto_502272 ?auto_502284 ) ) ( not ( = ?auto_502273 ?auto_502274 ) ) ( not ( = ?auto_502273 ?auto_502275 ) ) ( not ( = ?auto_502273 ?auto_502276 ) ) ( not ( = ?auto_502273 ?auto_502277 ) ) ( not ( = ?auto_502273 ?auto_502278 ) ) ( not ( = ?auto_502273 ?auto_502279 ) ) ( not ( = ?auto_502273 ?auto_502280 ) ) ( not ( = ?auto_502273 ?auto_502281 ) ) ( not ( = ?auto_502273 ?auto_502282 ) ) ( not ( = ?auto_502273 ?auto_502283 ) ) ( not ( = ?auto_502273 ?auto_502284 ) ) ( not ( = ?auto_502274 ?auto_502275 ) ) ( not ( = ?auto_502274 ?auto_502276 ) ) ( not ( = ?auto_502274 ?auto_502277 ) ) ( not ( = ?auto_502274 ?auto_502278 ) ) ( not ( = ?auto_502274 ?auto_502279 ) ) ( not ( = ?auto_502274 ?auto_502280 ) ) ( not ( = ?auto_502274 ?auto_502281 ) ) ( not ( = ?auto_502274 ?auto_502282 ) ) ( not ( = ?auto_502274 ?auto_502283 ) ) ( not ( = ?auto_502274 ?auto_502284 ) ) ( not ( = ?auto_502275 ?auto_502276 ) ) ( not ( = ?auto_502275 ?auto_502277 ) ) ( not ( = ?auto_502275 ?auto_502278 ) ) ( not ( = ?auto_502275 ?auto_502279 ) ) ( not ( = ?auto_502275 ?auto_502280 ) ) ( not ( = ?auto_502275 ?auto_502281 ) ) ( not ( = ?auto_502275 ?auto_502282 ) ) ( not ( = ?auto_502275 ?auto_502283 ) ) ( not ( = ?auto_502275 ?auto_502284 ) ) ( not ( = ?auto_502276 ?auto_502277 ) ) ( not ( = ?auto_502276 ?auto_502278 ) ) ( not ( = ?auto_502276 ?auto_502279 ) ) ( not ( = ?auto_502276 ?auto_502280 ) ) ( not ( = ?auto_502276 ?auto_502281 ) ) ( not ( = ?auto_502276 ?auto_502282 ) ) ( not ( = ?auto_502276 ?auto_502283 ) ) ( not ( = ?auto_502276 ?auto_502284 ) ) ( not ( = ?auto_502277 ?auto_502278 ) ) ( not ( = ?auto_502277 ?auto_502279 ) ) ( not ( = ?auto_502277 ?auto_502280 ) ) ( not ( = ?auto_502277 ?auto_502281 ) ) ( not ( = ?auto_502277 ?auto_502282 ) ) ( not ( = ?auto_502277 ?auto_502283 ) ) ( not ( = ?auto_502277 ?auto_502284 ) ) ( not ( = ?auto_502278 ?auto_502279 ) ) ( not ( = ?auto_502278 ?auto_502280 ) ) ( not ( = ?auto_502278 ?auto_502281 ) ) ( not ( = ?auto_502278 ?auto_502282 ) ) ( not ( = ?auto_502278 ?auto_502283 ) ) ( not ( = ?auto_502278 ?auto_502284 ) ) ( not ( = ?auto_502279 ?auto_502280 ) ) ( not ( = ?auto_502279 ?auto_502281 ) ) ( not ( = ?auto_502279 ?auto_502282 ) ) ( not ( = ?auto_502279 ?auto_502283 ) ) ( not ( = ?auto_502279 ?auto_502284 ) ) ( not ( = ?auto_502280 ?auto_502281 ) ) ( not ( = ?auto_502280 ?auto_502282 ) ) ( not ( = ?auto_502280 ?auto_502283 ) ) ( not ( = ?auto_502280 ?auto_502284 ) ) ( not ( = ?auto_502281 ?auto_502282 ) ) ( not ( = ?auto_502281 ?auto_502283 ) ) ( not ( = ?auto_502281 ?auto_502284 ) ) ( not ( = ?auto_502282 ?auto_502283 ) ) ( not ( = ?auto_502282 ?auto_502284 ) ) ( not ( = ?auto_502283 ?auto_502284 ) ) ( ON ?auto_502283 ?auto_502284 ) ( ON ?auto_502282 ?auto_502283 ) ( ON ?auto_502281 ?auto_502282 ) ( ON ?auto_502280 ?auto_502281 ) ( ON ?auto_502279 ?auto_502280 ) ( ON ?auto_502278 ?auto_502279 ) ( ON ?auto_502277 ?auto_502278 ) ( ON ?auto_502276 ?auto_502277 ) ( ON ?auto_502275 ?auto_502276 ) ( ON ?auto_502274 ?auto_502275 ) ( CLEAR ?auto_502272 ) ( ON ?auto_502273 ?auto_502274 ) ( CLEAR ?auto_502273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_502269 ?auto_502270 ?auto_502271 ?auto_502272 ?auto_502273 )
      ( MAKE-16PILE ?auto_502269 ?auto_502270 ?auto_502271 ?auto_502272 ?auto_502273 ?auto_502274 ?auto_502275 ?auto_502276 ?auto_502277 ?auto_502278 ?auto_502279 ?auto_502280 ?auto_502281 ?auto_502282 ?auto_502283 ?auto_502284 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502301 - BLOCK
      ?auto_502302 - BLOCK
      ?auto_502303 - BLOCK
      ?auto_502304 - BLOCK
      ?auto_502305 - BLOCK
      ?auto_502306 - BLOCK
      ?auto_502307 - BLOCK
      ?auto_502308 - BLOCK
      ?auto_502309 - BLOCK
      ?auto_502310 - BLOCK
      ?auto_502311 - BLOCK
      ?auto_502312 - BLOCK
      ?auto_502313 - BLOCK
      ?auto_502314 - BLOCK
      ?auto_502315 - BLOCK
      ?auto_502316 - BLOCK
    )
    :vars
    (
      ?auto_502317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502316 ?auto_502317 ) ( ON-TABLE ?auto_502301 ) ( ON ?auto_502302 ?auto_502301 ) ( ON ?auto_502303 ?auto_502302 ) ( not ( = ?auto_502301 ?auto_502302 ) ) ( not ( = ?auto_502301 ?auto_502303 ) ) ( not ( = ?auto_502301 ?auto_502304 ) ) ( not ( = ?auto_502301 ?auto_502305 ) ) ( not ( = ?auto_502301 ?auto_502306 ) ) ( not ( = ?auto_502301 ?auto_502307 ) ) ( not ( = ?auto_502301 ?auto_502308 ) ) ( not ( = ?auto_502301 ?auto_502309 ) ) ( not ( = ?auto_502301 ?auto_502310 ) ) ( not ( = ?auto_502301 ?auto_502311 ) ) ( not ( = ?auto_502301 ?auto_502312 ) ) ( not ( = ?auto_502301 ?auto_502313 ) ) ( not ( = ?auto_502301 ?auto_502314 ) ) ( not ( = ?auto_502301 ?auto_502315 ) ) ( not ( = ?auto_502301 ?auto_502316 ) ) ( not ( = ?auto_502301 ?auto_502317 ) ) ( not ( = ?auto_502302 ?auto_502303 ) ) ( not ( = ?auto_502302 ?auto_502304 ) ) ( not ( = ?auto_502302 ?auto_502305 ) ) ( not ( = ?auto_502302 ?auto_502306 ) ) ( not ( = ?auto_502302 ?auto_502307 ) ) ( not ( = ?auto_502302 ?auto_502308 ) ) ( not ( = ?auto_502302 ?auto_502309 ) ) ( not ( = ?auto_502302 ?auto_502310 ) ) ( not ( = ?auto_502302 ?auto_502311 ) ) ( not ( = ?auto_502302 ?auto_502312 ) ) ( not ( = ?auto_502302 ?auto_502313 ) ) ( not ( = ?auto_502302 ?auto_502314 ) ) ( not ( = ?auto_502302 ?auto_502315 ) ) ( not ( = ?auto_502302 ?auto_502316 ) ) ( not ( = ?auto_502302 ?auto_502317 ) ) ( not ( = ?auto_502303 ?auto_502304 ) ) ( not ( = ?auto_502303 ?auto_502305 ) ) ( not ( = ?auto_502303 ?auto_502306 ) ) ( not ( = ?auto_502303 ?auto_502307 ) ) ( not ( = ?auto_502303 ?auto_502308 ) ) ( not ( = ?auto_502303 ?auto_502309 ) ) ( not ( = ?auto_502303 ?auto_502310 ) ) ( not ( = ?auto_502303 ?auto_502311 ) ) ( not ( = ?auto_502303 ?auto_502312 ) ) ( not ( = ?auto_502303 ?auto_502313 ) ) ( not ( = ?auto_502303 ?auto_502314 ) ) ( not ( = ?auto_502303 ?auto_502315 ) ) ( not ( = ?auto_502303 ?auto_502316 ) ) ( not ( = ?auto_502303 ?auto_502317 ) ) ( not ( = ?auto_502304 ?auto_502305 ) ) ( not ( = ?auto_502304 ?auto_502306 ) ) ( not ( = ?auto_502304 ?auto_502307 ) ) ( not ( = ?auto_502304 ?auto_502308 ) ) ( not ( = ?auto_502304 ?auto_502309 ) ) ( not ( = ?auto_502304 ?auto_502310 ) ) ( not ( = ?auto_502304 ?auto_502311 ) ) ( not ( = ?auto_502304 ?auto_502312 ) ) ( not ( = ?auto_502304 ?auto_502313 ) ) ( not ( = ?auto_502304 ?auto_502314 ) ) ( not ( = ?auto_502304 ?auto_502315 ) ) ( not ( = ?auto_502304 ?auto_502316 ) ) ( not ( = ?auto_502304 ?auto_502317 ) ) ( not ( = ?auto_502305 ?auto_502306 ) ) ( not ( = ?auto_502305 ?auto_502307 ) ) ( not ( = ?auto_502305 ?auto_502308 ) ) ( not ( = ?auto_502305 ?auto_502309 ) ) ( not ( = ?auto_502305 ?auto_502310 ) ) ( not ( = ?auto_502305 ?auto_502311 ) ) ( not ( = ?auto_502305 ?auto_502312 ) ) ( not ( = ?auto_502305 ?auto_502313 ) ) ( not ( = ?auto_502305 ?auto_502314 ) ) ( not ( = ?auto_502305 ?auto_502315 ) ) ( not ( = ?auto_502305 ?auto_502316 ) ) ( not ( = ?auto_502305 ?auto_502317 ) ) ( not ( = ?auto_502306 ?auto_502307 ) ) ( not ( = ?auto_502306 ?auto_502308 ) ) ( not ( = ?auto_502306 ?auto_502309 ) ) ( not ( = ?auto_502306 ?auto_502310 ) ) ( not ( = ?auto_502306 ?auto_502311 ) ) ( not ( = ?auto_502306 ?auto_502312 ) ) ( not ( = ?auto_502306 ?auto_502313 ) ) ( not ( = ?auto_502306 ?auto_502314 ) ) ( not ( = ?auto_502306 ?auto_502315 ) ) ( not ( = ?auto_502306 ?auto_502316 ) ) ( not ( = ?auto_502306 ?auto_502317 ) ) ( not ( = ?auto_502307 ?auto_502308 ) ) ( not ( = ?auto_502307 ?auto_502309 ) ) ( not ( = ?auto_502307 ?auto_502310 ) ) ( not ( = ?auto_502307 ?auto_502311 ) ) ( not ( = ?auto_502307 ?auto_502312 ) ) ( not ( = ?auto_502307 ?auto_502313 ) ) ( not ( = ?auto_502307 ?auto_502314 ) ) ( not ( = ?auto_502307 ?auto_502315 ) ) ( not ( = ?auto_502307 ?auto_502316 ) ) ( not ( = ?auto_502307 ?auto_502317 ) ) ( not ( = ?auto_502308 ?auto_502309 ) ) ( not ( = ?auto_502308 ?auto_502310 ) ) ( not ( = ?auto_502308 ?auto_502311 ) ) ( not ( = ?auto_502308 ?auto_502312 ) ) ( not ( = ?auto_502308 ?auto_502313 ) ) ( not ( = ?auto_502308 ?auto_502314 ) ) ( not ( = ?auto_502308 ?auto_502315 ) ) ( not ( = ?auto_502308 ?auto_502316 ) ) ( not ( = ?auto_502308 ?auto_502317 ) ) ( not ( = ?auto_502309 ?auto_502310 ) ) ( not ( = ?auto_502309 ?auto_502311 ) ) ( not ( = ?auto_502309 ?auto_502312 ) ) ( not ( = ?auto_502309 ?auto_502313 ) ) ( not ( = ?auto_502309 ?auto_502314 ) ) ( not ( = ?auto_502309 ?auto_502315 ) ) ( not ( = ?auto_502309 ?auto_502316 ) ) ( not ( = ?auto_502309 ?auto_502317 ) ) ( not ( = ?auto_502310 ?auto_502311 ) ) ( not ( = ?auto_502310 ?auto_502312 ) ) ( not ( = ?auto_502310 ?auto_502313 ) ) ( not ( = ?auto_502310 ?auto_502314 ) ) ( not ( = ?auto_502310 ?auto_502315 ) ) ( not ( = ?auto_502310 ?auto_502316 ) ) ( not ( = ?auto_502310 ?auto_502317 ) ) ( not ( = ?auto_502311 ?auto_502312 ) ) ( not ( = ?auto_502311 ?auto_502313 ) ) ( not ( = ?auto_502311 ?auto_502314 ) ) ( not ( = ?auto_502311 ?auto_502315 ) ) ( not ( = ?auto_502311 ?auto_502316 ) ) ( not ( = ?auto_502311 ?auto_502317 ) ) ( not ( = ?auto_502312 ?auto_502313 ) ) ( not ( = ?auto_502312 ?auto_502314 ) ) ( not ( = ?auto_502312 ?auto_502315 ) ) ( not ( = ?auto_502312 ?auto_502316 ) ) ( not ( = ?auto_502312 ?auto_502317 ) ) ( not ( = ?auto_502313 ?auto_502314 ) ) ( not ( = ?auto_502313 ?auto_502315 ) ) ( not ( = ?auto_502313 ?auto_502316 ) ) ( not ( = ?auto_502313 ?auto_502317 ) ) ( not ( = ?auto_502314 ?auto_502315 ) ) ( not ( = ?auto_502314 ?auto_502316 ) ) ( not ( = ?auto_502314 ?auto_502317 ) ) ( not ( = ?auto_502315 ?auto_502316 ) ) ( not ( = ?auto_502315 ?auto_502317 ) ) ( not ( = ?auto_502316 ?auto_502317 ) ) ( ON ?auto_502315 ?auto_502316 ) ( ON ?auto_502314 ?auto_502315 ) ( ON ?auto_502313 ?auto_502314 ) ( ON ?auto_502312 ?auto_502313 ) ( ON ?auto_502311 ?auto_502312 ) ( ON ?auto_502310 ?auto_502311 ) ( ON ?auto_502309 ?auto_502310 ) ( ON ?auto_502308 ?auto_502309 ) ( ON ?auto_502307 ?auto_502308 ) ( ON ?auto_502306 ?auto_502307 ) ( ON ?auto_502305 ?auto_502306 ) ( CLEAR ?auto_502303 ) ( ON ?auto_502304 ?auto_502305 ) ( CLEAR ?auto_502304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_502301 ?auto_502302 ?auto_502303 ?auto_502304 )
      ( MAKE-16PILE ?auto_502301 ?auto_502302 ?auto_502303 ?auto_502304 ?auto_502305 ?auto_502306 ?auto_502307 ?auto_502308 ?auto_502309 ?auto_502310 ?auto_502311 ?auto_502312 ?auto_502313 ?auto_502314 ?auto_502315 ?auto_502316 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502334 - BLOCK
      ?auto_502335 - BLOCK
      ?auto_502336 - BLOCK
      ?auto_502337 - BLOCK
      ?auto_502338 - BLOCK
      ?auto_502339 - BLOCK
      ?auto_502340 - BLOCK
      ?auto_502341 - BLOCK
      ?auto_502342 - BLOCK
      ?auto_502343 - BLOCK
      ?auto_502344 - BLOCK
      ?auto_502345 - BLOCK
      ?auto_502346 - BLOCK
      ?auto_502347 - BLOCK
      ?auto_502348 - BLOCK
      ?auto_502349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502349 ) ( ON-TABLE ?auto_502334 ) ( ON ?auto_502335 ?auto_502334 ) ( ON ?auto_502336 ?auto_502335 ) ( not ( = ?auto_502334 ?auto_502335 ) ) ( not ( = ?auto_502334 ?auto_502336 ) ) ( not ( = ?auto_502334 ?auto_502337 ) ) ( not ( = ?auto_502334 ?auto_502338 ) ) ( not ( = ?auto_502334 ?auto_502339 ) ) ( not ( = ?auto_502334 ?auto_502340 ) ) ( not ( = ?auto_502334 ?auto_502341 ) ) ( not ( = ?auto_502334 ?auto_502342 ) ) ( not ( = ?auto_502334 ?auto_502343 ) ) ( not ( = ?auto_502334 ?auto_502344 ) ) ( not ( = ?auto_502334 ?auto_502345 ) ) ( not ( = ?auto_502334 ?auto_502346 ) ) ( not ( = ?auto_502334 ?auto_502347 ) ) ( not ( = ?auto_502334 ?auto_502348 ) ) ( not ( = ?auto_502334 ?auto_502349 ) ) ( not ( = ?auto_502335 ?auto_502336 ) ) ( not ( = ?auto_502335 ?auto_502337 ) ) ( not ( = ?auto_502335 ?auto_502338 ) ) ( not ( = ?auto_502335 ?auto_502339 ) ) ( not ( = ?auto_502335 ?auto_502340 ) ) ( not ( = ?auto_502335 ?auto_502341 ) ) ( not ( = ?auto_502335 ?auto_502342 ) ) ( not ( = ?auto_502335 ?auto_502343 ) ) ( not ( = ?auto_502335 ?auto_502344 ) ) ( not ( = ?auto_502335 ?auto_502345 ) ) ( not ( = ?auto_502335 ?auto_502346 ) ) ( not ( = ?auto_502335 ?auto_502347 ) ) ( not ( = ?auto_502335 ?auto_502348 ) ) ( not ( = ?auto_502335 ?auto_502349 ) ) ( not ( = ?auto_502336 ?auto_502337 ) ) ( not ( = ?auto_502336 ?auto_502338 ) ) ( not ( = ?auto_502336 ?auto_502339 ) ) ( not ( = ?auto_502336 ?auto_502340 ) ) ( not ( = ?auto_502336 ?auto_502341 ) ) ( not ( = ?auto_502336 ?auto_502342 ) ) ( not ( = ?auto_502336 ?auto_502343 ) ) ( not ( = ?auto_502336 ?auto_502344 ) ) ( not ( = ?auto_502336 ?auto_502345 ) ) ( not ( = ?auto_502336 ?auto_502346 ) ) ( not ( = ?auto_502336 ?auto_502347 ) ) ( not ( = ?auto_502336 ?auto_502348 ) ) ( not ( = ?auto_502336 ?auto_502349 ) ) ( not ( = ?auto_502337 ?auto_502338 ) ) ( not ( = ?auto_502337 ?auto_502339 ) ) ( not ( = ?auto_502337 ?auto_502340 ) ) ( not ( = ?auto_502337 ?auto_502341 ) ) ( not ( = ?auto_502337 ?auto_502342 ) ) ( not ( = ?auto_502337 ?auto_502343 ) ) ( not ( = ?auto_502337 ?auto_502344 ) ) ( not ( = ?auto_502337 ?auto_502345 ) ) ( not ( = ?auto_502337 ?auto_502346 ) ) ( not ( = ?auto_502337 ?auto_502347 ) ) ( not ( = ?auto_502337 ?auto_502348 ) ) ( not ( = ?auto_502337 ?auto_502349 ) ) ( not ( = ?auto_502338 ?auto_502339 ) ) ( not ( = ?auto_502338 ?auto_502340 ) ) ( not ( = ?auto_502338 ?auto_502341 ) ) ( not ( = ?auto_502338 ?auto_502342 ) ) ( not ( = ?auto_502338 ?auto_502343 ) ) ( not ( = ?auto_502338 ?auto_502344 ) ) ( not ( = ?auto_502338 ?auto_502345 ) ) ( not ( = ?auto_502338 ?auto_502346 ) ) ( not ( = ?auto_502338 ?auto_502347 ) ) ( not ( = ?auto_502338 ?auto_502348 ) ) ( not ( = ?auto_502338 ?auto_502349 ) ) ( not ( = ?auto_502339 ?auto_502340 ) ) ( not ( = ?auto_502339 ?auto_502341 ) ) ( not ( = ?auto_502339 ?auto_502342 ) ) ( not ( = ?auto_502339 ?auto_502343 ) ) ( not ( = ?auto_502339 ?auto_502344 ) ) ( not ( = ?auto_502339 ?auto_502345 ) ) ( not ( = ?auto_502339 ?auto_502346 ) ) ( not ( = ?auto_502339 ?auto_502347 ) ) ( not ( = ?auto_502339 ?auto_502348 ) ) ( not ( = ?auto_502339 ?auto_502349 ) ) ( not ( = ?auto_502340 ?auto_502341 ) ) ( not ( = ?auto_502340 ?auto_502342 ) ) ( not ( = ?auto_502340 ?auto_502343 ) ) ( not ( = ?auto_502340 ?auto_502344 ) ) ( not ( = ?auto_502340 ?auto_502345 ) ) ( not ( = ?auto_502340 ?auto_502346 ) ) ( not ( = ?auto_502340 ?auto_502347 ) ) ( not ( = ?auto_502340 ?auto_502348 ) ) ( not ( = ?auto_502340 ?auto_502349 ) ) ( not ( = ?auto_502341 ?auto_502342 ) ) ( not ( = ?auto_502341 ?auto_502343 ) ) ( not ( = ?auto_502341 ?auto_502344 ) ) ( not ( = ?auto_502341 ?auto_502345 ) ) ( not ( = ?auto_502341 ?auto_502346 ) ) ( not ( = ?auto_502341 ?auto_502347 ) ) ( not ( = ?auto_502341 ?auto_502348 ) ) ( not ( = ?auto_502341 ?auto_502349 ) ) ( not ( = ?auto_502342 ?auto_502343 ) ) ( not ( = ?auto_502342 ?auto_502344 ) ) ( not ( = ?auto_502342 ?auto_502345 ) ) ( not ( = ?auto_502342 ?auto_502346 ) ) ( not ( = ?auto_502342 ?auto_502347 ) ) ( not ( = ?auto_502342 ?auto_502348 ) ) ( not ( = ?auto_502342 ?auto_502349 ) ) ( not ( = ?auto_502343 ?auto_502344 ) ) ( not ( = ?auto_502343 ?auto_502345 ) ) ( not ( = ?auto_502343 ?auto_502346 ) ) ( not ( = ?auto_502343 ?auto_502347 ) ) ( not ( = ?auto_502343 ?auto_502348 ) ) ( not ( = ?auto_502343 ?auto_502349 ) ) ( not ( = ?auto_502344 ?auto_502345 ) ) ( not ( = ?auto_502344 ?auto_502346 ) ) ( not ( = ?auto_502344 ?auto_502347 ) ) ( not ( = ?auto_502344 ?auto_502348 ) ) ( not ( = ?auto_502344 ?auto_502349 ) ) ( not ( = ?auto_502345 ?auto_502346 ) ) ( not ( = ?auto_502345 ?auto_502347 ) ) ( not ( = ?auto_502345 ?auto_502348 ) ) ( not ( = ?auto_502345 ?auto_502349 ) ) ( not ( = ?auto_502346 ?auto_502347 ) ) ( not ( = ?auto_502346 ?auto_502348 ) ) ( not ( = ?auto_502346 ?auto_502349 ) ) ( not ( = ?auto_502347 ?auto_502348 ) ) ( not ( = ?auto_502347 ?auto_502349 ) ) ( not ( = ?auto_502348 ?auto_502349 ) ) ( ON ?auto_502348 ?auto_502349 ) ( ON ?auto_502347 ?auto_502348 ) ( ON ?auto_502346 ?auto_502347 ) ( ON ?auto_502345 ?auto_502346 ) ( ON ?auto_502344 ?auto_502345 ) ( ON ?auto_502343 ?auto_502344 ) ( ON ?auto_502342 ?auto_502343 ) ( ON ?auto_502341 ?auto_502342 ) ( ON ?auto_502340 ?auto_502341 ) ( ON ?auto_502339 ?auto_502340 ) ( ON ?auto_502338 ?auto_502339 ) ( CLEAR ?auto_502336 ) ( ON ?auto_502337 ?auto_502338 ) ( CLEAR ?auto_502337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_502334 ?auto_502335 ?auto_502336 ?auto_502337 )
      ( MAKE-16PILE ?auto_502334 ?auto_502335 ?auto_502336 ?auto_502337 ?auto_502338 ?auto_502339 ?auto_502340 ?auto_502341 ?auto_502342 ?auto_502343 ?auto_502344 ?auto_502345 ?auto_502346 ?auto_502347 ?auto_502348 ?auto_502349 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502366 - BLOCK
      ?auto_502367 - BLOCK
      ?auto_502368 - BLOCK
      ?auto_502369 - BLOCK
      ?auto_502370 - BLOCK
      ?auto_502371 - BLOCK
      ?auto_502372 - BLOCK
      ?auto_502373 - BLOCK
      ?auto_502374 - BLOCK
      ?auto_502375 - BLOCK
      ?auto_502376 - BLOCK
      ?auto_502377 - BLOCK
      ?auto_502378 - BLOCK
      ?auto_502379 - BLOCK
      ?auto_502380 - BLOCK
      ?auto_502381 - BLOCK
    )
    :vars
    (
      ?auto_502382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502381 ?auto_502382 ) ( ON-TABLE ?auto_502366 ) ( ON ?auto_502367 ?auto_502366 ) ( not ( = ?auto_502366 ?auto_502367 ) ) ( not ( = ?auto_502366 ?auto_502368 ) ) ( not ( = ?auto_502366 ?auto_502369 ) ) ( not ( = ?auto_502366 ?auto_502370 ) ) ( not ( = ?auto_502366 ?auto_502371 ) ) ( not ( = ?auto_502366 ?auto_502372 ) ) ( not ( = ?auto_502366 ?auto_502373 ) ) ( not ( = ?auto_502366 ?auto_502374 ) ) ( not ( = ?auto_502366 ?auto_502375 ) ) ( not ( = ?auto_502366 ?auto_502376 ) ) ( not ( = ?auto_502366 ?auto_502377 ) ) ( not ( = ?auto_502366 ?auto_502378 ) ) ( not ( = ?auto_502366 ?auto_502379 ) ) ( not ( = ?auto_502366 ?auto_502380 ) ) ( not ( = ?auto_502366 ?auto_502381 ) ) ( not ( = ?auto_502366 ?auto_502382 ) ) ( not ( = ?auto_502367 ?auto_502368 ) ) ( not ( = ?auto_502367 ?auto_502369 ) ) ( not ( = ?auto_502367 ?auto_502370 ) ) ( not ( = ?auto_502367 ?auto_502371 ) ) ( not ( = ?auto_502367 ?auto_502372 ) ) ( not ( = ?auto_502367 ?auto_502373 ) ) ( not ( = ?auto_502367 ?auto_502374 ) ) ( not ( = ?auto_502367 ?auto_502375 ) ) ( not ( = ?auto_502367 ?auto_502376 ) ) ( not ( = ?auto_502367 ?auto_502377 ) ) ( not ( = ?auto_502367 ?auto_502378 ) ) ( not ( = ?auto_502367 ?auto_502379 ) ) ( not ( = ?auto_502367 ?auto_502380 ) ) ( not ( = ?auto_502367 ?auto_502381 ) ) ( not ( = ?auto_502367 ?auto_502382 ) ) ( not ( = ?auto_502368 ?auto_502369 ) ) ( not ( = ?auto_502368 ?auto_502370 ) ) ( not ( = ?auto_502368 ?auto_502371 ) ) ( not ( = ?auto_502368 ?auto_502372 ) ) ( not ( = ?auto_502368 ?auto_502373 ) ) ( not ( = ?auto_502368 ?auto_502374 ) ) ( not ( = ?auto_502368 ?auto_502375 ) ) ( not ( = ?auto_502368 ?auto_502376 ) ) ( not ( = ?auto_502368 ?auto_502377 ) ) ( not ( = ?auto_502368 ?auto_502378 ) ) ( not ( = ?auto_502368 ?auto_502379 ) ) ( not ( = ?auto_502368 ?auto_502380 ) ) ( not ( = ?auto_502368 ?auto_502381 ) ) ( not ( = ?auto_502368 ?auto_502382 ) ) ( not ( = ?auto_502369 ?auto_502370 ) ) ( not ( = ?auto_502369 ?auto_502371 ) ) ( not ( = ?auto_502369 ?auto_502372 ) ) ( not ( = ?auto_502369 ?auto_502373 ) ) ( not ( = ?auto_502369 ?auto_502374 ) ) ( not ( = ?auto_502369 ?auto_502375 ) ) ( not ( = ?auto_502369 ?auto_502376 ) ) ( not ( = ?auto_502369 ?auto_502377 ) ) ( not ( = ?auto_502369 ?auto_502378 ) ) ( not ( = ?auto_502369 ?auto_502379 ) ) ( not ( = ?auto_502369 ?auto_502380 ) ) ( not ( = ?auto_502369 ?auto_502381 ) ) ( not ( = ?auto_502369 ?auto_502382 ) ) ( not ( = ?auto_502370 ?auto_502371 ) ) ( not ( = ?auto_502370 ?auto_502372 ) ) ( not ( = ?auto_502370 ?auto_502373 ) ) ( not ( = ?auto_502370 ?auto_502374 ) ) ( not ( = ?auto_502370 ?auto_502375 ) ) ( not ( = ?auto_502370 ?auto_502376 ) ) ( not ( = ?auto_502370 ?auto_502377 ) ) ( not ( = ?auto_502370 ?auto_502378 ) ) ( not ( = ?auto_502370 ?auto_502379 ) ) ( not ( = ?auto_502370 ?auto_502380 ) ) ( not ( = ?auto_502370 ?auto_502381 ) ) ( not ( = ?auto_502370 ?auto_502382 ) ) ( not ( = ?auto_502371 ?auto_502372 ) ) ( not ( = ?auto_502371 ?auto_502373 ) ) ( not ( = ?auto_502371 ?auto_502374 ) ) ( not ( = ?auto_502371 ?auto_502375 ) ) ( not ( = ?auto_502371 ?auto_502376 ) ) ( not ( = ?auto_502371 ?auto_502377 ) ) ( not ( = ?auto_502371 ?auto_502378 ) ) ( not ( = ?auto_502371 ?auto_502379 ) ) ( not ( = ?auto_502371 ?auto_502380 ) ) ( not ( = ?auto_502371 ?auto_502381 ) ) ( not ( = ?auto_502371 ?auto_502382 ) ) ( not ( = ?auto_502372 ?auto_502373 ) ) ( not ( = ?auto_502372 ?auto_502374 ) ) ( not ( = ?auto_502372 ?auto_502375 ) ) ( not ( = ?auto_502372 ?auto_502376 ) ) ( not ( = ?auto_502372 ?auto_502377 ) ) ( not ( = ?auto_502372 ?auto_502378 ) ) ( not ( = ?auto_502372 ?auto_502379 ) ) ( not ( = ?auto_502372 ?auto_502380 ) ) ( not ( = ?auto_502372 ?auto_502381 ) ) ( not ( = ?auto_502372 ?auto_502382 ) ) ( not ( = ?auto_502373 ?auto_502374 ) ) ( not ( = ?auto_502373 ?auto_502375 ) ) ( not ( = ?auto_502373 ?auto_502376 ) ) ( not ( = ?auto_502373 ?auto_502377 ) ) ( not ( = ?auto_502373 ?auto_502378 ) ) ( not ( = ?auto_502373 ?auto_502379 ) ) ( not ( = ?auto_502373 ?auto_502380 ) ) ( not ( = ?auto_502373 ?auto_502381 ) ) ( not ( = ?auto_502373 ?auto_502382 ) ) ( not ( = ?auto_502374 ?auto_502375 ) ) ( not ( = ?auto_502374 ?auto_502376 ) ) ( not ( = ?auto_502374 ?auto_502377 ) ) ( not ( = ?auto_502374 ?auto_502378 ) ) ( not ( = ?auto_502374 ?auto_502379 ) ) ( not ( = ?auto_502374 ?auto_502380 ) ) ( not ( = ?auto_502374 ?auto_502381 ) ) ( not ( = ?auto_502374 ?auto_502382 ) ) ( not ( = ?auto_502375 ?auto_502376 ) ) ( not ( = ?auto_502375 ?auto_502377 ) ) ( not ( = ?auto_502375 ?auto_502378 ) ) ( not ( = ?auto_502375 ?auto_502379 ) ) ( not ( = ?auto_502375 ?auto_502380 ) ) ( not ( = ?auto_502375 ?auto_502381 ) ) ( not ( = ?auto_502375 ?auto_502382 ) ) ( not ( = ?auto_502376 ?auto_502377 ) ) ( not ( = ?auto_502376 ?auto_502378 ) ) ( not ( = ?auto_502376 ?auto_502379 ) ) ( not ( = ?auto_502376 ?auto_502380 ) ) ( not ( = ?auto_502376 ?auto_502381 ) ) ( not ( = ?auto_502376 ?auto_502382 ) ) ( not ( = ?auto_502377 ?auto_502378 ) ) ( not ( = ?auto_502377 ?auto_502379 ) ) ( not ( = ?auto_502377 ?auto_502380 ) ) ( not ( = ?auto_502377 ?auto_502381 ) ) ( not ( = ?auto_502377 ?auto_502382 ) ) ( not ( = ?auto_502378 ?auto_502379 ) ) ( not ( = ?auto_502378 ?auto_502380 ) ) ( not ( = ?auto_502378 ?auto_502381 ) ) ( not ( = ?auto_502378 ?auto_502382 ) ) ( not ( = ?auto_502379 ?auto_502380 ) ) ( not ( = ?auto_502379 ?auto_502381 ) ) ( not ( = ?auto_502379 ?auto_502382 ) ) ( not ( = ?auto_502380 ?auto_502381 ) ) ( not ( = ?auto_502380 ?auto_502382 ) ) ( not ( = ?auto_502381 ?auto_502382 ) ) ( ON ?auto_502380 ?auto_502381 ) ( ON ?auto_502379 ?auto_502380 ) ( ON ?auto_502378 ?auto_502379 ) ( ON ?auto_502377 ?auto_502378 ) ( ON ?auto_502376 ?auto_502377 ) ( ON ?auto_502375 ?auto_502376 ) ( ON ?auto_502374 ?auto_502375 ) ( ON ?auto_502373 ?auto_502374 ) ( ON ?auto_502372 ?auto_502373 ) ( ON ?auto_502371 ?auto_502372 ) ( ON ?auto_502370 ?auto_502371 ) ( ON ?auto_502369 ?auto_502370 ) ( CLEAR ?auto_502367 ) ( ON ?auto_502368 ?auto_502369 ) ( CLEAR ?auto_502368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_502366 ?auto_502367 ?auto_502368 )
      ( MAKE-16PILE ?auto_502366 ?auto_502367 ?auto_502368 ?auto_502369 ?auto_502370 ?auto_502371 ?auto_502372 ?auto_502373 ?auto_502374 ?auto_502375 ?auto_502376 ?auto_502377 ?auto_502378 ?auto_502379 ?auto_502380 ?auto_502381 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502399 - BLOCK
      ?auto_502400 - BLOCK
      ?auto_502401 - BLOCK
      ?auto_502402 - BLOCK
      ?auto_502403 - BLOCK
      ?auto_502404 - BLOCK
      ?auto_502405 - BLOCK
      ?auto_502406 - BLOCK
      ?auto_502407 - BLOCK
      ?auto_502408 - BLOCK
      ?auto_502409 - BLOCK
      ?auto_502410 - BLOCK
      ?auto_502411 - BLOCK
      ?auto_502412 - BLOCK
      ?auto_502413 - BLOCK
      ?auto_502414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502414 ) ( ON-TABLE ?auto_502399 ) ( ON ?auto_502400 ?auto_502399 ) ( not ( = ?auto_502399 ?auto_502400 ) ) ( not ( = ?auto_502399 ?auto_502401 ) ) ( not ( = ?auto_502399 ?auto_502402 ) ) ( not ( = ?auto_502399 ?auto_502403 ) ) ( not ( = ?auto_502399 ?auto_502404 ) ) ( not ( = ?auto_502399 ?auto_502405 ) ) ( not ( = ?auto_502399 ?auto_502406 ) ) ( not ( = ?auto_502399 ?auto_502407 ) ) ( not ( = ?auto_502399 ?auto_502408 ) ) ( not ( = ?auto_502399 ?auto_502409 ) ) ( not ( = ?auto_502399 ?auto_502410 ) ) ( not ( = ?auto_502399 ?auto_502411 ) ) ( not ( = ?auto_502399 ?auto_502412 ) ) ( not ( = ?auto_502399 ?auto_502413 ) ) ( not ( = ?auto_502399 ?auto_502414 ) ) ( not ( = ?auto_502400 ?auto_502401 ) ) ( not ( = ?auto_502400 ?auto_502402 ) ) ( not ( = ?auto_502400 ?auto_502403 ) ) ( not ( = ?auto_502400 ?auto_502404 ) ) ( not ( = ?auto_502400 ?auto_502405 ) ) ( not ( = ?auto_502400 ?auto_502406 ) ) ( not ( = ?auto_502400 ?auto_502407 ) ) ( not ( = ?auto_502400 ?auto_502408 ) ) ( not ( = ?auto_502400 ?auto_502409 ) ) ( not ( = ?auto_502400 ?auto_502410 ) ) ( not ( = ?auto_502400 ?auto_502411 ) ) ( not ( = ?auto_502400 ?auto_502412 ) ) ( not ( = ?auto_502400 ?auto_502413 ) ) ( not ( = ?auto_502400 ?auto_502414 ) ) ( not ( = ?auto_502401 ?auto_502402 ) ) ( not ( = ?auto_502401 ?auto_502403 ) ) ( not ( = ?auto_502401 ?auto_502404 ) ) ( not ( = ?auto_502401 ?auto_502405 ) ) ( not ( = ?auto_502401 ?auto_502406 ) ) ( not ( = ?auto_502401 ?auto_502407 ) ) ( not ( = ?auto_502401 ?auto_502408 ) ) ( not ( = ?auto_502401 ?auto_502409 ) ) ( not ( = ?auto_502401 ?auto_502410 ) ) ( not ( = ?auto_502401 ?auto_502411 ) ) ( not ( = ?auto_502401 ?auto_502412 ) ) ( not ( = ?auto_502401 ?auto_502413 ) ) ( not ( = ?auto_502401 ?auto_502414 ) ) ( not ( = ?auto_502402 ?auto_502403 ) ) ( not ( = ?auto_502402 ?auto_502404 ) ) ( not ( = ?auto_502402 ?auto_502405 ) ) ( not ( = ?auto_502402 ?auto_502406 ) ) ( not ( = ?auto_502402 ?auto_502407 ) ) ( not ( = ?auto_502402 ?auto_502408 ) ) ( not ( = ?auto_502402 ?auto_502409 ) ) ( not ( = ?auto_502402 ?auto_502410 ) ) ( not ( = ?auto_502402 ?auto_502411 ) ) ( not ( = ?auto_502402 ?auto_502412 ) ) ( not ( = ?auto_502402 ?auto_502413 ) ) ( not ( = ?auto_502402 ?auto_502414 ) ) ( not ( = ?auto_502403 ?auto_502404 ) ) ( not ( = ?auto_502403 ?auto_502405 ) ) ( not ( = ?auto_502403 ?auto_502406 ) ) ( not ( = ?auto_502403 ?auto_502407 ) ) ( not ( = ?auto_502403 ?auto_502408 ) ) ( not ( = ?auto_502403 ?auto_502409 ) ) ( not ( = ?auto_502403 ?auto_502410 ) ) ( not ( = ?auto_502403 ?auto_502411 ) ) ( not ( = ?auto_502403 ?auto_502412 ) ) ( not ( = ?auto_502403 ?auto_502413 ) ) ( not ( = ?auto_502403 ?auto_502414 ) ) ( not ( = ?auto_502404 ?auto_502405 ) ) ( not ( = ?auto_502404 ?auto_502406 ) ) ( not ( = ?auto_502404 ?auto_502407 ) ) ( not ( = ?auto_502404 ?auto_502408 ) ) ( not ( = ?auto_502404 ?auto_502409 ) ) ( not ( = ?auto_502404 ?auto_502410 ) ) ( not ( = ?auto_502404 ?auto_502411 ) ) ( not ( = ?auto_502404 ?auto_502412 ) ) ( not ( = ?auto_502404 ?auto_502413 ) ) ( not ( = ?auto_502404 ?auto_502414 ) ) ( not ( = ?auto_502405 ?auto_502406 ) ) ( not ( = ?auto_502405 ?auto_502407 ) ) ( not ( = ?auto_502405 ?auto_502408 ) ) ( not ( = ?auto_502405 ?auto_502409 ) ) ( not ( = ?auto_502405 ?auto_502410 ) ) ( not ( = ?auto_502405 ?auto_502411 ) ) ( not ( = ?auto_502405 ?auto_502412 ) ) ( not ( = ?auto_502405 ?auto_502413 ) ) ( not ( = ?auto_502405 ?auto_502414 ) ) ( not ( = ?auto_502406 ?auto_502407 ) ) ( not ( = ?auto_502406 ?auto_502408 ) ) ( not ( = ?auto_502406 ?auto_502409 ) ) ( not ( = ?auto_502406 ?auto_502410 ) ) ( not ( = ?auto_502406 ?auto_502411 ) ) ( not ( = ?auto_502406 ?auto_502412 ) ) ( not ( = ?auto_502406 ?auto_502413 ) ) ( not ( = ?auto_502406 ?auto_502414 ) ) ( not ( = ?auto_502407 ?auto_502408 ) ) ( not ( = ?auto_502407 ?auto_502409 ) ) ( not ( = ?auto_502407 ?auto_502410 ) ) ( not ( = ?auto_502407 ?auto_502411 ) ) ( not ( = ?auto_502407 ?auto_502412 ) ) ( not ( = ?auto_502407 ?auto_502413 ) ) ( not ( = ?auto_502407 ?auto_502414 ) ) ( not ( = ?auto_502408 ?auto_502409 ) ) ( not ( = ?auto_502408 ?auto_502410 ) ) ( not ( = ?auto_502408 ?auto_502411 ) ) ( not ( = ?auto_502408 ?auto_502412 ) ) ( not ( = ?auto_502408 ?auto_502413 ) ) ( not ( = ?auto_502408 ?auto_502414 ) ) ( not ( = ?auto_502409 ?auto_502410 ) ) ( not ( = ?auto_502409 ?auto_502411 ) ) ( not ( = ?auto_502409 ?auto_502412 ) ) ( not ( = ?auto_502409 ?auto_502413 ) ) ( not ( = ?auto_502409 ?auto_502414 ) ) ( not ( = ?auto_502410 ?auto_502411 ) ) ( not ( = ?auto_502410 ?auto_502412 ) ) ( not ( = ?auto_502410 ?auto_502413 ) ) ( not ( = ?auto_502410 ?auto_502414 ) ) ( not ( = ?auto_502411 ?auto_502412 ) ) ( not ( = ?auto_502411 ?auto_502413 ) ) ( not ( = ?auto_502411 ?auto_502414 ) ) ( not ( = ?auto_502412 ?auto_502413 ) ) ( not ( = ?auto_502412 ?auto_502414 ) ) ( not ( = ?auto_502413 ?auto_502414 ) ) ( ON ?auto_502413 ?auto_502414 ) ( ON ?auto_502412 ?auto_502413 ) ( ON ?auto_502411 ?auto_502412 ) ( ON ?auto_502410 ?auto_502411 ) ( ON ?auto_502409 ?auto_502410 ) ( ON ?auto_502408 ?auto_502409 ) ( ON ?auto_502407 ?auto_502408 ) ( ON ?auto_502406 ?auto_502407 ) ( ON ?auto_502405 ?auto_502406 ) ( ON ?auto_502404 ?auto_502405 ) ( ON ?auto_502403 ?auto_502404 ) ( ON ?auto_502402 ?auto_502403 ) ( CLEAR ?auto_502400 ) ( ON ?auto_502401 ?auto_502402 ) ( CLEAR ?auto_502401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_502399 ?auto_502400 ?auto_502401 )
      ( MAKE-16PILE ?auto_502399 ?auto_502400 ?auto_502401 ?auto_502402 ?auto_502403 ?auto_502404 ?auto_502405 ?auto_502406 ?auto_502407 ?auto_502408 ?auto_502409 ?auto_502410 ?auto_502411 ?auto_502412 ?auto_502413 ?auto_502414 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502431 - BLOCK
      ?auto_502432 - BLOCK
      ?auto_502433 - BLOCK
      ?auto_502434 - BLOCK
      ?auto_502435 - BLOCK
      ?auto_502436 - BLOCK
      ?auto_502437 - BLOCK
      ?auto_502438 - BLOCK
      ?auto_502439 - BLOCK
      ?auto_502440 - BLOCK
      ?auto_502441 - BLOCK
      ?auto_502442 - BLOCK
      ?auto_502443 - BLOCK
      ?auto_502444 - BLOCK
      ?auto_502445 - BLOCK
      ?auto_502446 - BLOCK
    )
    :vars
    (
      ?auto_502447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502446 ?auto_502447 ) ( ON-TABLE ?auto_502431 ) ( not ( = ?auto_502431 ?auto_502432 ) ) ( not ( = ?auto_502431 ?auto_502433 ) ) ( not ( = ?auto_502431 ?auto_502434 ) ) ( not ( = ?auto_502431 ?auto_502435 ) ) ( not ( = ?auto_502431 ?auto_502436 ) ) ( not ( = ?auto_502431 ?auto_502437 ) ) ( not ( = ?auto_502431 ?auto_502438 ) ) ( not ( = ?auto_502431 ?auto_502439 ) ) ( not ( = ?auto_502431 ?auto_502440 ) ) ( not ( = ?auto_502431 ?auto_502441 ) ) ( not ( = ?auto_502431 ?auto_502442 ) ) ( not ( = ?auto_502431 ?auto_502443 ) ) ( not ( = ?auto_502431 ?auto_502444 ) ) ( not ( = ?auto_502431 ?auto_502445 ) ) ( not ( = ?auto_502431 ?auto_502446 ) ) ( not ( = ?auto_502431 ?auto_502447 ) ) ( not ( = ?auto_502432 ?auto_502433 ) ) ( not ( = ?auto_502432 ?auto_502434 ) ) ( not ( = ?auto_502432 ?auto_502435 ) ) ( not ( = ?auto_502432 ?auto_502436 ) ) ( not ( = ?auto_502432 ?auto_502437 ) ) ( not ( = ?auto_502432 ?auto_502438 ) ) ( not ( = ?auto_502432 ?auto_502439 ) ) ( not ( = ?auto_502432 ?auto_502440 ) ) ( not ( = ?auto_502432 ?auto_502441 ) ) ( not ( = ?auto_502432 ?auto_502442 ) ) ( not ( = ?auto_502432 ?auto_502443 ) ) ( not ( = ?auto_502432 ?auto_502444 ) ) ( not ( = ?auto_502432 ?auto_502445 ) ) ( not ( = ?auto_502432 ?auto_502446 ) ) ( not ( = ?auto_502432 ?auto_502447 ) ) ( not ( = ?auto_502433 ?auto_502434 ) ) ( not ( = ?auto_502433 ?auto_502435 ) ) ( not ( = ?auto_502433 ?auto_502436 ) ) ( not ( = ?auto_502433 ?auto_502437 ) ) ( not ( = ?auto_502433 ?auto_502438 ) ) ( not ( = ?auto_502433 ?auto_502439 ) ) ( not ( = ?auto_502433 ?auto_502440 ) ) ( not ( = ?auto_502433 ?auto_502441 ) ) ( not ( = ?auto_502433 ?auto_502442 ) ) ( not ( = ?auto_502433 ?auto_502443 ) ) ( not ( = ?auto_502433 ?auto_502444 ) ) ( not ( = ?auto_502433 ?auto_502445 ) ) ( not ( = ?auto_502433 ?auto_502446 ) ) ( not ( = ?auto_502433 ?auto_502447 ) ) ( not ( = ?auto_502434 ?auto_502435 ) ) ( not ( = ?auto_502434 ?auto_502436 ) ) ( not ( = ?auto_502434 ?auto_502437 ) ) ( not ( = ?auto_502434 ?auto_502438 ) ) ( not ( = ?auto_502434 ?auto_502439 ) ) ( not ( = ?auto_502434 ?auto_502440 ) ) ( not ( = ?auto_502434 ?auto_502441 ) ) ( not ( = ?auto_502434 ?auto_502442 ) ) ( not ( = ?auto_502434 ?auto_502443 ) ) ( not ( = ?auto_502434 ?auto_502444 ) ) ( not ( = ?auto_502434 ?auto_502445 ) ) ( not ( = ?auto_502434 ?auto_502446 ) ) ( not ( = ?auto_502434 ?auto_502447 ) ) ( not ( = ?auto_502435 ?auto_502436 ) ) ( not ( = ?auto_502435 ?auto_502437 ) ) ( not ( = ?auto_502435 ?auto_502438 ) ) ( not ( = ?auto_502435 ?auto_502439 ) ) ( not ( = ?auto_502435 ?auto_502440 ) ) ( not ( = ?auto_502435 ?auto_502441 ) ) ( not ( = ?auto_502435 ?auto_502442 ) ) ( not ( = ?auto_502435 ?auto_502443 ) ) ( not ( = ?auto_502435 ?auto_502444 ) ) ( not ( = ?auto_502435 ?auto_502445 ) ) ( not ( = ?auto_502435 ?auto_502446 ) ) ( not ( = ?auto_502435 ?auto_502447 ) ) ( not ( = ?auto_502436 ?auto_502437 ) ) ( not ( = ?auto_502436 ?auto_502438 ) ) ( not ( = ?auto_502436 ?auto_502439 ) ) ( not ( = ?auto_502436 ?auto_502440 ) ) ( not ( = ?auto_502436 ?auto_502441 ) ) ( not ( = ?auto_502436 ?auto_502442 ) ) ( not ( = ?auto_502436 ?auto_502443 ) ) ( not ( = ?auto_502436 ?auto_502444 ) ) ( not ( = ?auto_502436 ?auto_502445 ) ) ( not ( = ?auto_502436 ?auto_502446 ) ) ( not ( = ?auto_502436 ?auto_502447 ) ) ( not ( = ?auto_502437 ?auto_502438 ) ) ( not ( = ?auto_502437 ?auto_502439 ) ) ( not ( = ?auto_502437 ?auto_502440 ) ) ( not ( = ?auto_502437 ?auto_502441 ) ) ( not ( = ?auto_502437 ?auto_502442 ) ) ( not ( = ?auto_502437 ?auto_502443 ) ) ( not ( = ?auto_502437 ?auto_502444 ) ) ( not ( = ?auto_502437 ?auto_502445 ) ) ( not ( = ?auto_502437 ?auto_502446 ) ) ( not ( = ?auto_502437 ?auto_502447 ) ) ( not ( = ?auto_502438 ?auto_502439 ) ) ( not ( = ?auto_502438 ?auto_502440 ) ) ( not ( = ?auto_502438 ?auto_502441 ) ) ( not ( = ?auto_502438 ?auto_502442 ) ) ( not ( = ?auto_502438 ?auto_502443 ) ) ( not ( = ?auto_502438 ?auto_502444 ) ) ( not ( = ?auto_502438 ?auto_502445 ) ) ( not ( = ?auto_502438 ?auto_502446 ) ) ( not ( = ?auto_502438 ?auto_502447 ) ) ( not ( = ?auto_502439 ?auto_502440 ) ) ( not ( = ?auto_502439 ?auto_502441 ) ) ( not ( = ?auto_502439 ?auto_502442 ) ) ( not ( = ?auto_502439 ?auto_502443 ) ) ( not ( = ?auto_502439 ?auto_502444 ) ) ( not ( = ?auto_502439 ?auto_502445 ) ) ( not ( = ?auto_502439 ?auto_502446 ) ) ( not ( = ?auto_502439 ?auto_502447 ) ) ( not ( = ?auto_502440 ?auto_502441 ) ) ( not ( = ?auto_502440 ?auto_502442 ) ) ( not ( = ?auto_502440 ?auto_502443 ) ) ( not ( = ?auto_502440 ?auto_502444 ) ) ( not ( = ?auto_502440 ?auto_502445 ) ) ( not ( = ?auto_502440 ?auto_502446 ) ) ( not ( = ?auto_502440 ?auto_502447 ) ) ( not ( = ?auto_502441 ?auto_502442 ) ) ( not ( = ?auto_502441 ?auto_502443 ) ) ( not ( = ?auto_502441 ?auto_502444 ) ) ( not ( = ?auto_502441 ?auto_502445 ) ) ( not ( = ?auto_502441 ?auto_502446 ) ) ( not ( = ?auto_502441 ?auto_502447 ) ) ( not ( = ?auto_502442 ?auto_502443 ) ) ( not ( = ?auto_502442 ?auto_502444 ) ) ( not ( = ?auto_502442 ?auto_502445 ) ) ( not ( = ?auto_502442 ?auto_502446 ) ) ( not ( = ?auto_502442 ?auto_502447 ) ) ( not ( = ?auto_502443 ?auto_502444 ) ) ( not ( = ?auto_502443 ?auto_502445 ) ) ( not ( = ?auto_502443 ?auto_502446 ) ) ( not ( = ?auto_502443 ?auto_502447 ) ) ( not ( = ?auto_502444 ?auto_502445 ) ) ( not ( = ?auto_502444 ?auto_502446 ) ) ( not ( = ?auto_502444 ?auto_502447 ) ) ( not ( = ?auto_502445 ?auto_502446 ) ) ( not ( = ?auto_502445 ?auto_502447 ) ) ( not ( = ?auto_502446 ?auto_502447 ) ) ( ON ?auto_502445 ?auto_502446 ) ( ON ?auto_502444 ?auto_502445 ) ( ON ?auto_502443 ?auto_502444 ) ( ON ?auto_502442 ?auto_502443 ) ( ON ?auto_502441 ?auto_502442 ) ( ON ?auto_502440 ?auto_502441 ) ( ON ?auto_502439 ?auto_502440 ) ( ON ?auto_502438 ?auto_502439 ) ( ON ?auto_502437 ?auto_502438 ) ( ON ?auto_502436 ?auto_502437 ) ( ON ?auto_502435 ?auto_502436 ) ( ON ?auto_502434 ?auto_502435 ) ( ON ?auto_502433 ?auto_502434 ) ( CLEAR ?auto_502431 ) ( ON ?auto_502432 ?auto_502433 ) ( CLEAR ?auto_502432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502431 ?auto_502432 )
      ( MAKE-16PILE ?auto_502431 ?auto_502432 ?auto_502433 ?auto_502434 ?auto_502435 ?auto_502436 ?auto_502437 ?auto_502438 ?auto_502439 ?auto_502440 ?auto_502441 ?auto_502442 ?auto_502443 ?auto_502444 ?auto_502445 ?auto_502446 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502464 - BLOCK
      ?auto_502465 - BLOCK
      ?auto_502466 - BLOCK
      ?auto_502467 - BLOCK
      ?auto_502468 - BLOCK
      ?auto_502469 - BLOCK
      ?auto_502470 - BLOCK
      ?auto_502471 - BLOCK
      ?auto_502472 - BLOCK
      ?auto_502473 - BLOCK
      ?auto_502474 - BLOCK
      ?auto_502475 - BLOCK
      ?auto_502476 - BLOCK
      ?auto_502477 - BLOCK
      ?auto_502478 - BLOCK
      ?auto_502479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502479 ) ( ON-TABLE ?auto_502464 ) ( not ( = ?auto_502464 ?auto_502465 ) ) ( not ( = ?auto_502464 ?auto_502466 ) ) ( not ( = ?auto_502464 ?auto_502467 ) ) ( not ( = ?auto_502464 ?auto_502468 ) ) ( not ( = ?auto_502464 ?auto_502469 ) ) ( not ( = ?auto_502464 ?auto_502470 ) ) ( not ( = ?auto_502464 ?auto_502471 ) ) ( not ( = ?auto_502464 ?auto_502472 ) ) ( not ( = ?auto_502464 ?auto_502473 ) ) ( not ( = ?auto_502464 ?auto_502474 ) ) ( not ( = ?auto_502464 ?auto_502475 ) ) ( not ( = ?auto_502464 ?auto_502476 ) ) ( not ( = ?auto_502464 ?auto_502477 ) ) ( not ( = ?auto_502464 ?auto_502478 ) ) ( not ( = ?auto_502464 ?auto_502479 ) ) ( not ( = ?auto_502465 ?auto_502466 ) ) ( not ( = ?auto_502465 ?auto_502467 ) ) ( not ( = ?auto_502465 ?auto_502468 ) ) ( not ( = ?auto_502465 ?auto_502469 ) ) ( not ( = ?auto_502465 ?auto_502470 ) ) ( not ( = ?auto_502465 ?auto_502471 ) ) ( not ( = ?auto_502465 ?auto_502472 ) ) ( not ( = ?auto_502465 ?auto_502473 ) ) ( not ( = ?auto_502465 ?auto_502474 ) ) ( not ( = ?auto_502465 ?auto_502475 ) ) ( not ( = ?auto_502465 ?auto_502476 ) ) ( not ( = ?auto_502465 ?auto_502477 ) ) ( not ( = ?auto_502465 ?auto_502478 ) ) ( not ( = ?auto_502465 ?auto_502479 ) ) ( not ( = ?auto_502466 ?auto_502467 ) ) ( not ( = ?auto_502466 ?auto_502468 ) ) ( not ( = ?auto_502466 ?auto_502469 ) ) ( not ( = ?auto_502466 ?auto_502470 ) ) ( not ( = ?auto_502466 ?auto_502471 ) ) ( not ( = ?auto_502466 ?auto_502472 ) ) ( not ( = ?auto_502466 ?auto_502473 ) ) ( not ( = ?auto_502466 ?auto_502474 ) ) ( not ( = ?auto_502466 ?auto_502475 ) ) ( not ( = ?auto_502466 ?auto_502476 ) ) ( not ( = ?auto_502466 ?auto_502477 ) ) ( not ( = ?auto_502466 ?auto_502478 ) ) ( not ( = ?auto_502466 ?auto_502479 ) ) ( not ( = ?auto_502467 ?auto_502468 ) ) ( not ( = ?auto_502467 ?auto_502469 ) ) ( not ( = ?auto_502467 ?auto_502470 ) ) ( not ( = ?auto_502467 ?auto_502471 ) ) ( not ( = ?auto_502467 ?auto_502472 ) ) ( not ( = ?auto_502467 ?auto_502473 ) ) ( not ( = ?auto_502467 ?auto_502474 ) ) ( not ( = ?auto_502467 ?auto_502475 ) ) ( not ( = ?auto_502467 ?auto_502476 ) ) ( not ( = ?auto_502467 ?auto_502477 ) ) ( not ( = ?auto_502467 ?auto_502478 ) ) ( not ( = ?auto_502467 ?auto_502479 ) ) ( not ( = ?auto_502468 ?auto_502469 ) ) ( not ( = ?auto_502468 ?auto_502470 ) ) ( not ( = ?auto_502468 ?auto_502471 ) ) ( not ( = ?auto_502468 ?auto_502472 ) ) ( not ( = ?auto_502468 ?auto_502473 ) ) ( not ( = ?auto_502468 ?auto_502474 ) ) ( not ( = ?auto_502468 ?auto_502475 ) ) ( not ( = ?auto_502468 ?auto_502476 ) ) ( not ( = ?auto_502468 ?auto_502477 ) ) ( not ( = ?auto_502468 ?auto_502478 ) ) ( not ( = ?auto_502468 ?auto_502479 ) ) ( not ( = ?auto_502469 ?auto_502470 ) ) ( not ( = ?auto_502469 ?auto_502471 ) ) ( not ( = ?auto_502469 ?auto_502472 ) ) ( not ( = ?auto_502469 ?auto_502473 ) ) ( not ( = ?auto_502469 ?auto_502474 ) ) ( not ( = ?auto_502469 ?auto_502475 ) ) ( not ( = ?auto_502469 ?auto_502476 ) ) ( not ( = ?auto_502469 ?auto_502477 ) ) ( not ( = ?auto_502469 ?auto_502478 ) ) ( not ( = ?auto_502469 ?auto_502479 ) ) ( not ( = ?auto_502470 ?auto_502471 ) ) ( not ( = ?auto_502470 ?auto_502472 ) ) ( not ( = ?auto_502470 ?auto_502473 ) ) ( not ( = ?auto_502470 ?auto_502474 ) ) ( not ( = ?auto_502470 ?auto_502475 ) ) ( not ( = ?auto_502470 ?auto_502476 ) ) ( not ( = ?auto_502470 ?auto_502477 ) ) ( not ( = ?auto_502470 ?auto_502478 ) ) ( not ( = ?auto_502470 ?auto_502479 ) ) ( not ( = ?auto_502471 ?auto_502472 ) ) ( not ( = ?auto_502471 ?auto_502473 ) ) ( not ( = ?auto_502471 ?auto_502474 ) ) ( not ( = ?auto_502471 ?auto_502475 ) ) ( not ( = ?auto_502471 ?auto_502476 ) ) ( not ( = ?auto_502471 ?auto_502477 ) ) ( not ( = ?auto_502471 ?auto_502478 ) ) ( not ( = ?auto_502471 ?auto_502479 ) ) ( not ( = ?auto_502472 ?auto_502473 ) ) ( not ( = ?auto_502472 ?auto_502474 ) ) ( not ( = ?auto_502472 ?auto_502475 ) ) ( not ( = ?auto_502472 ?auto_502476 ) ) ( not ( = ?auto_502472 ?auto_502477 ) ) ( not ( = ?auto_502472 ?auto_502478 ) ) ( not ( = ?auto_502472 ?auto_502479 ) ) ( not ( = ?auto_502473 ?auto_502474 ) ) ( not ( = ?auto_502473 ?auto_502475 ) ) ( not ( = ?auto_502473 ?auto_502476 ) ) ( not ( = ?auto_502473 ?auto_502477 ) ) ( not ( = ?auto_502473 ?auto_502478 ) ) ( not ( = ?auto_502473 ?auto_502479 ) ) ( not ( = ?auto_502474 ?auto_502475 ) ) ( not ( = ?auto_502474 ?auto_502476 ) ) ( not ( = ?auto_502474 ?auto_502477 ) ) ( not ( = ?auto_502474 ?auto_502478 ) ) ( not ( = ?auto_502474 ?auto_502479 ) ) ( not ( = ?auto_502475 ?auto_502476 ) ) ( not ( = ?auto_502475 ?auto_502477 ) ) ( not ( = ?auto_502475 ?auto_502478 ) ) ( not ( = ?auto_502475 ?auto_502479 ) ) ( not ( = ?auto_502476 ?auto_502477 ) ) ( not ( = ?auto_502476 ?auto_502478 ) ) ( not ( = ?auto_502476 ?auto_502479 ) ) ( not ( = ?auto_502477 ?auto_502478 ) ) ( not ( = ?auto_502477 ?auto_502479 ) ) ( not ( = ?auto_502478 ?auto_502479 ) ) ( ON ?auto_502478 ?auto_502479 ) ( ON ?auto_502477 ?auto_502478 ) ( ON ?auto_502476 ?auto_502477 ) ( ON ?auto_502475 ?auto_502476 ) ( ON ?auto_502474 ?auto_502475 ) ( ON ?auto_502473 ?auto_502474 ) ( ON ?auto_502472 ?auto_502473 ) ( ON ?auto_502471 ?auto_502472 ) ( ON ?auto_502470 ?auto_502471 ) ( ON ?auto_502469 ?auto_502470 ) ( ON ?auto_502468 ?auto_502469 ) ( ON ?auto_502467 ?auto_502468 ) ( ON ?auto_502466 ?auto_502467 ) ( CLEAR ?auto_502464 ) ( ON ?auto_502465 ?auto_502466 ) ( CLEAR ?auto_502465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502464 ?auto_502465 )
      ( MAKE-16PILE ?auto_502464 ?auto_502465 ?auto_502466 ?auto_502467 ?auto_502468 ?auto_502469 ?auto_502470 ?auto_502471 ?auto_502472 ?auto_502473 ?auto_502474 ?auto_502475 ?auto_502476 ?auto_502477 ?auto_502478 ?auto_502479 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502496 - BLOCK
      ?auto_502497 - BLOCK
      ?auto_502498 - BLOCK
      ?auto_502499 - BLOCK
      ?auto_502500 - BLOCK
      ?auto_502501 - BLOCK
      ?auto_502502 - BLOCK
      ?auto_502503 - BLOCK
      ?auto_502504 - BLOCK
      ?auto_502505 - BLOCK
      ?auto_502506 - BLOCK
      ?auto_502507 - BLOCK
      ?auto_502508 - BLOCK
      ?auto_502509 - BLOCK
      ?auto_502510 - BLOCK
      ?auto_502511 - BLOCK
    )
    :vars
    (
      ?auto_502512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502511 ?auto_502512 ) ( not ( = ?auto_502496 ?auto_502497 ) ) ( not ( = ?auto_502496 ?auto_502498 ) ) ( not ( = ?auto_502496 ?auto_502499 ) ) ( not ( = ?auto_502496 ?auto_502500 ) ) ( not ( = ?auto_502496 ?auto_502501 ) ) ( not ( = ?auto_502496 ?auto_502502 ) ) ( not ( = ?auto_502496 ?auto_502503 ) ) ( not ( = ?auto_502496 ?auto_502504 ) ) ( not ( = ?auto_502496 ?auto_502505 ) ) ( not ( = ?auto_502496 ?auto_502506 ) ) ( not ( = ?auto_502496 ?auto_502507 ) ) ( not ( = ?auto_502496 ?auto_502508 ) ) ( not ( = ?auto_502496 ?auto_502509 ) ) ( not ( = ?auto_502496 ?auto_502510 ) ) ( not ( = ?auto_502496 ?auto_502511 ) ) ( not ( = ?auto_502496 ?auto_502512 ) ) ( not ( = ?auto_502497 ?auto_502498 ) ) ( not ( = ?auto_502497 ?auto_502499 ) ) ( not ( = ?auto_502497 ?auto_502500 ) ) ( not ( = ?auto_502497 ?auto_502501 ) ) ( not ( = ?auto_502497 ?auto_502502 ) ) ( not ( = ?auto_502497 ?auto_502503 ) ) ( not ( = ?auto_502497 ?auto_502504 ) ) ( not ( = ?auto_502497 ?auto_502505 ) ) ( not ( = ?auto_502497 ?auto_502506 ) ) ( not ( = ?auto_502497 ?auto_502507 ) ) ( not ( = ?auto_502497 ?auto_502508 ) ) ( not ( = ?auto_502497 ?auto_502509 ) ) ( not ( = ?auto_502497 ?auto_502510 ) ) ( not ( = ?auto_502497 ?auto_502511 ) ) ( not ( = ?auto_502497 ?auto_502512 ) ) ( not ( = ?auto_502498 ?auto_502499 ) ) ( not ( = ?auto_502498 ?auto_502500 ) ) ( not ( = ?auto_502498 ?auto_502501 ) ) ( not ( = ?auto_502498 ?auto_502502 ) ) ( not ( = ?auto_502498 ?auto_502503 ) ) ( not ( = ?auto_502498 ?auto_502504 ) ) ( not ( = ?auto_502498 ?auto_502505 ) ) ( not ( = ?auto_502498 ?auto_502506 ) ) ( not ( = ?auto_502498 ?auto_502507 ) ) ( not ( = ?auto_502498 ?auto_502508 ) ) ( not ( = ?auto_502498 ?auto_502509 ) ) ( not ( = ?auto_502498 ?auto_502510 ) ) ( not ( = ?auto_502498 ?auto_502511 ) ) ( not ( = ?auto_502498 ?auto_502512 ) ) ( not ( = ?auto_502499 ?auto_502500 ) ) ( not ( = ?auto_502499 ?auto_502501 ) ) ( not ( = ?auto_502499 ?auto_502502 ) ) ( not ( = ?auto_502499 ?auto_502503 ) ) ( not ( = ?auto_502499 ?auto_502504 ) ) ( not ( = ?auto_502499 ?auto_502505 ) ) ( not ( = ?auto_502499 ?auto_502506 ) ) ( not ( = ?auto_502499 ?auto_502507 ) ) ( not ( = ?auto_502499 ?auto_502508 ) ) ( not ( = ?auto_502499 ?auto_502509 ) ) ( not ( = ?auto_502499 ?auto_502510 ) ) ( not ( = ?auto_502499 ?auto_502511 ) ) ( not ( = ?auto_502499 ?auto_502512 ) ) ( not ( = ?auto_502500 ?auto_502501 ) ) ( not ( = ?auto_502500 ?auto_502502 ) ) ( not ( = ?auto_502500 ?auto_502503 ) ) ( not ( = ?auto_502500 ?auto_502504 ) ) ( not ( = ?auto_502500 ?auto_502505 ) ) ( not ( = ?auto_502500 ?auto_502506 ) ) ( not ( = ?auto_502500 ?auto_502507 ) ) ( not ( = ?auto_502500 ?auto_502508 ) ) ( not ( = ?auto_502500 ?auto_502509 ) ) ( not ( = ?auto_502500 ?auto_502510 ) ) ( not ( = ?auto_502500 ?auto_502511 ) ) ( not ( = ?auto_502500 ?auto_502512 ) ) ( not ( = ?auto_502501 ?auto_502502 ) ) ( not ( = ?auto_502501 ?auto_502503 ) ) ( not ( = ?auto_502501 ?auto_502504 ) ) ( not ( = ?auto_502501 ?auto_502505 ) ) ( not ( = ?auto_502501 ?auto_502506 ) ) ( not ( = ?auto_502501 ?auto_502507 ) ) ( not ( = ?auto_502501 ?auto_502508 ) ) ( not ( = ?auto_502501 ?auto_502509 ) ) ( not ( = ?auto_502501 ?auto_502510 ) ) ( not ( = ?auto_502501 ?auto_502511 ) ) ( not ( = ?auto_502501 ?auto_502512 ) ) ( not ( = ?auto_502502 ?auto_502503 ) ) ( not ( = ?auto_502502 ?auto_502504 ) ) ( not ( = ?auto_502502 ?auto_502505 ) ) ( not ( = ?auto_502502 ?auto_502506 ) ) ( not ( = ?auto_502502 ?auto_502507 ) ) ( not ( = ?auto_502502 ?auto_502508 ) ) ( not ( = ?auto_502502 ?auto_502509 ) ) ( not ( = ?auto_502502 ?auto_502510 ) ) ( not ( = ?auto_502502 ?auto_502511 ) ) ( not ( = ?auto_502502 ?auto_502512 ) ) ( not ( = ?auto_502503 ?auto_502504 ) ) ( not ( = ?auto_502503 ?auto_502505 ) ) ( not ( = ?auto_502503 ?auto_502506 ) ) ( not ( = ?auto_502503 ?auto_502507 ) ) ( not ( = ?auto_502503 ?auto_502508 ) ) ( not ( = ?auto_502503 ?auto_502509 ) ) ( not ( = ?auto_502503 ?auto_502510 ) ) ( not ( = ?auto_502503 ?auto_502511 ) ) ( not ( = ?auto_502503 ?auto_502512 ) ) ( not ( = ?auto_502504 ?auto_502505 ) ) ( not ( = ?auto_502504 ?auto_502506 ) ) ( not ( = ?auto_502504 ?auto_502507 ) ) ( not ( = ?auto_502504 ?auto_502508 ) ) ( not ( = ?auto_502504 ?auto_502509 ) ) ( not ( = ?auto_502504 ?auto_502510 ) ) ( not ( = ?auto_502504 ?auto_502511 ) ) ( not ( = ?auto_502504 ?auto_502512 ) ) ( not ( = ?auto_502505 ?auto_502506 ) ) ( not ( = ?auto_502505 ?auto_502507 ) ) ( not ( = ?auto_502505 ?auto_502508 ) ) ( not ( = ?auto_502505 ?auto_502509 ) ) ( not ( = ?auto_502505 ?auto_502510 ) ) ( not ( = ?auto_502505 ?auto_502511 ) ) ( not ( = ?auto_502505 ?auto_502512 ) ) ( not ( = ?auto_502506 ?auto_502507 ) ) ( not ( = ?auto_502506 ?auto_502508 ) ) ( not ( = ?auto_502506 ?auto_502509 ) ) ( not ( = ?auto_502506 ?auto_502510 ) ) ( not ( = ?auto_502506 ?auto_502511 ) ) ( not ( = ?auto_502506 ?auto_502512 ) ) ( not ( = ?auto_502507 ?auto_502508 ) ) ( not ( = ?auto_502507 ?auto_502509 ) ) ( not ( = ?auto_502507 ?auto_502510 ) ) ( not ( = ?auto_502507 ?auto_502511 ) ) ( not ( = ?auto_502507 ?auto_502512 ) ) ( not ( = ?auto_502508 ?auto_502509 ) ) ( not ( = ?auto_502508 ?auto_502510 ) ) ( not ( = ?auto_502508 ?auto_502511 ) ) ( not ( = ?auto_502508 ?auto_502512 ) ) ( not ( = ?auto_502509 ?auto_502510 ) ) ( not ( = ?auto_502509 ?auto_502511 ) ) ( not ( = ?auto_502509 ?auto_502512 ) ) ( not ( = ?auto_502510 ?auto_502511 ) ) ( not ( = ?auto_502510 ?auto_502512 ) ) ( not ( = ?auto_502511 ?auto_502512 ) ) ( ON ?auto_502510 ?auto_502511 ) ( ON ?auto_502509 ?auto_502510 ) ( ON ?auto_502508 ?auto_502509 ) ( ON ?auto_502507 ?auto_502508 ) ( ON ?auto_502506 ?auto_502507 ) ( ON ?auto_502505 ?auto_502506 ) ( ON ?auto_502504 ?auto_502505 ) ( ON ?auto_502503 ?auto_502504 ) ( ON ?auto_502502 ?auto_502503 ) ( ON ?auto_502501 ?auto_502502 ) ( ON ?auto_502500 ?auto_502501 ) ( ON ?auto_502499 ?auto_502500 ) ( ON ?auto_502498 ?auto_502499 ) ( ON ?auto_502497 ?auto_502498 ) ( ON ?auto_502496 ?auto_502497 ) ( CLEAR ?auto_502496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502496 )
      ( MAKE-16PILE ?auto_502496 ?auto_502497 ?auto_502498 ?auto_502499 ?auto_502500 ?auto_502501 ?auto_502502 ?auto_502503 ?auto_502504 ?auto_502505 ?auto_502506 ?auto_502507 ?auto_502508 ?auto_502509 ?auto_502510 ?auto_502511 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502529 - BLOCK
      ?auto_502530 - BLOCK
      ?auto_502531 - BLOCK
      ?auto_502532 - BLOCK
      ?auto_502533 - BLOCK
      ?auto_502534 - BLOCK
      ?auto_502535 - BLOCK
      ?auto_502536 - BLOCK
      ?auto_502537 - BLOCK
      ?auto_502538 - BLOCK
      ?auto_502539 - BLOCK
      ?auto_502540 - BLOCK
      ?auto_502541 - BLOCK
      ?auto_502542 - BLOCK
      ?auto_502543 - BLOCK
      ?auto_502544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_502544 ) ( not ( = ?auto_502529 ?auto_502530 ) ) ( not ( = ?auto_502529 ?auto_502531 ) ) ( not ( = ?auto_502529 ?auto_502532 ) ) ( not ( = ?auto_502529 ?auto_502533 ) ) ( not ( = ?auto_502529 ?auto_502534 ) ) ( not ( = ?auto_502529 ?auto_502535 ) ) ( not ( = ?auto_502529 ?auto_502536 ) ) ( not ( = ?auto_502529 ?auto_502537 ) ) ( not ( = ?auto_502529 ?auto_502538 ) ) ( not ( = ?auto_502529 ?auto_502539 ) ) ( not ( = ?auto_502529 ?auto_502540 ) ) ( not ( = ?auto_502529 ?auto_502541 ) ) ( not ( = ?auto_502529 ?auto_502542 ) ) ( not ( = ?auto_502529 ?auto_502543 ) ) ( not ( = ?auto_502529 ?auto_502544 ) ) ( not ( = ?auto_502530 ?auto_502531 ) ) ( not ( = ?auto_502530 ?auto_502532 ) ) ( not ( = ?auto_502530 ?auto_502533 ) ) ( not ( = ?auto_502530 ?auto_502534 ) ) ( not ( = ?auto_502530 ?auto_502535 ) ) ( not ( = ?auto_502530 ?auto_502536 ) ) ( not ( = ?auto_502530 ?auto_502537 ) ) ( not ( = ?auto_502530 ?auto_502538 ) ) ( not ( = ?auto_502530 ?auto_502539 ) ) ( not ( = ?auto_502530 ?auto_502540 ) ) ( not ( = ?auto_502530 ?auto_502541 ) ) ( not ( = ?auto_502530 ?auto_502542 ) ) ( not ( = ?auto_502530 ?auto_502543 ) ) ( not ( = ?auto_502530 ?auto_502544 ) ) ( not ( = ?auto_502531 ?auto_502532 ) ) ( not ( = ?auto_502531 ?auto_502533 ) ) ( not ( = ?auto_502531 ?auto_502534 ) ) ( not ( = ?auto_502531 ?auto_502535 ) ) ( not ( = ?auto_502531 ?auto_502536 ) ) ( not ( = ?auto_502531 ?auto_502537 ) ) ( not ( = ?auto_502531 ?auto_502538 ) ) ( not ( = ?auto_502531 ?auto_502539 ) ) ( not ( = ?auto_502531 ?auto_502540 ) ) ( not ( = ?auto_502531 ?auto_502541 ) ) ( not ( = ?auto_502531 ?auto_502542 ) ) ( not ( = ?auto_502531 ?auto_502543 ) ) ( not ( = ?auto_502531 ?auto_502544 ) ) ( not ( = ?auto_502532 ?auto_502533 ) ) ( not ( = ?auto_502532 ?auto_502534 ) ) ( not ( = ?auto_502532 ?auto_502535 ) ) ( not ( = ?auto_502532 ?auto_502536 ) ) ( not ( = ?auto_502532 ?auto_502537 ) ) ( not ( = ?auto_502532 ?auto_502538 ) ) ( not ( = ?auto_502532 ?auto_502539 ) ) ( not ( = ?auto_502532 ?auto_502540 ) ) ( not ( = ?auto_502532 ?auto_502541 ) ) ( not ( = ?auto_502532 ?auto_502542 ) ) ( not ( = ?auto_502532 ?auto_502543 ) ) ( not ( = ?auto_502532 ?auto_502544 ) ) ( not ( = ?auto_502533 ?auto_502534 ) ) ( not ( = ?auto_502533 ?auto_502535 ) ) ( not ( = ?auto_502533 ?auto_502536 ) ) ( not ( = ?auto_502533 ?auto_502537 ) ) ( not ( = ?auto_502533 ?auto_502538 ) ) ( not ( = ?auto_502533 ?auto_502539 ) ) ( not ( = ?auto_502533 ?auto_502540 ) ) ( not ( = ?auto_502533 ?auto_502541 ) ) ( not ( = ?auto_502533 ?auto_502542 ) ) ( not ( = ?auto_502533 ?auto_502543 ) ) ( not ( = ?auto_502533 ?auto_502544 ) ) ( not ( = ?auto_502534 ?auto_502535 ) ) ( not ( = ?auto_502534 ?auto_502536 ) ) ( not ( = ?auto_502534 ?auto_502537 ) ) ( not ( = ?auto_502534 ?auto_502538 ) ) ( not ( = ?auto_502534 ?auto_502539 ) ) ( not ( = ?auto_502534 ?auto_502540 ) ) ( not ( = ?auto_502534 ?auto_502541 ) ) ( not ( = ?auto_502534 ?auto_502542 ) ) ( not ( = ?auto_502534 ?auto_502543 ) ) ( not ( = ?auto_502534 ?auto_502544 ) ) ( not ( = ?auto_502535 ?auto_502536 ) ) ( not ( = ?auto_502535 ?auto_502537 ) ) ( not ( = ?auto_502535 ?auto_502538 ) ) ( not ( = ?auto_502535 ?auto_502539 ) ) ( not ( = ?auto_502535 ?auto_502540 ) ) ( not ( = ?auto_502535 ?auto_502541 ) ) ( not ( = ?auto_502535 ?auto_502542 ) ) ( not ( = ?auto_502535 ?auto_502543 ) ) ( not ( = ?auto_502535 ?auto_502544 ) ) ( not ( = ?auto_502536 ?auto_502537 ) ) ( not ( = ?auto_502536 ?auto_502538 ) ) ( not ( = ?auto_502536 ?auto_502539 ) ) ( not ( = ?auto_502536 ?auto_502540 ) ) ( not ( = ?auto_502536 ?auto_502541 ) ) ( not ( = ?auto_502536 ?auto_502542 ) ) ( not ( = ?auto_502536 ?auto_502543 ) ) ( not ( = ?auto_502536 ?auto_502544 ) ) ( not ( = ?auto_502537 ?auto_502538 ) ) ( not ( = ?auto_502537 ?auto_502539 ) ) ( not ( = ?auto_502537 ?auto_502540 ) ) ( not ( = ?auto_502537 ?auto_502541 ) ) ( not ( = ?auto_502537 ?auto_502542 ) ) ( not ( = ?auto_502537 ?auto_502543 ) ) ( not ( = ?auto_502537 ?auto_502544 ) ) ( not ( = ?auto_502538 ?auto_502539 ) ) ( not ( = ?auto_502538 ?auto_502540 ) ) ( not ( = ?auto_502538 ?auto_502541 ) ) ( not ( = ?auto_502538 ?auto_502542 ) ) ( not ( = ?auto_502538 ?auto_502543 ) ) ( not ( = ?auto_502538 ?auto_502544 ) ) ( not ( = ?auto_502539 ?auto_502540 ) ) ( not ( = ?auto_502539 ?auto_502541 ) ) ( not ( = ?auto_502539 ?auto_502542 ) ) ( not ( = ?auto_502539 ?auto_502543 ) ) ( not ( = ?auto_502539 ?auto_502544 ) ) ( not ( = ?auto_502540 ?auto_502541 ) ) ( not ( = ?auto_502540 ?auto_502542 ) ) ( not ( = ?auto_502540 ?auto_502543 ) ) ( not ( = ?auto_502540 ?auto_502544 ) ) ( not ( = ?auto_502541 ?auto_502542 ) ) ( not ( = ?auto_502541 ?auto_502543 ) ) ( not ( = ?auto_502541 ?auto_502544 ) ) ( not ( = ?auto_502542 ?auto_502543 ) ) ( not ( = ?auto_502542 ?auto_502544 ) ) ( not ( = ?auto_502543 ?auto_502544 ) ) ( ON ?auto_502543 ?auto_502544 ) ( ON ?auto_502542 ?auto_502543 ) ( ON ?auto_502541 ?auto_502542 ) ( ON ?auto_502540 ?auto_502541 ) ( ON ?auto_502539 ?auto_502540 ) ( ON ?auto_502538 ?auto_502539 ) ( ON ?auto_502537 ?auto_502538 ) ( ON ?auto_502536 ?auto_502537 ) ( ON ?auto_502535 ?auto_502536 ) ( ON ?auto_502534 ?auto_502535 ) ( ON ?auto_502533 ?auto_502534 ) ( ON ?auto_502532 ?auto_502533 ) ( ON ?auto_502531 ?auto_502532 ) ( ON ?auto_502530 ?auto_502531 ) ( ON ?auto_502529 ?auto_502530 ) ( CLEAR ?auto_502529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502529 )
      ( MAKE-16PILE ?auto_502529 ?auto_502530 ?auto_502531 ?auto_502532 ?auto_502533 ?auto_502534 ?auto_502535 ?auto_502536 ?auto_502537 ?auto_502538 ?auto_502539 ?auto_502540 ?auto_502541 ?auto_502542 ?auto_502543 ?auto_502544 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_502561 - BLOCK
      ?auto_502562 - BLOCK
      ?auto_502563 - BLOCK
      ?auto_502564 - BLOCK
      ?auto_502565 - BLOCK
      ?auto_502566 - BLOCK
      ?auto_502567 - BLOCK
      ?auto_502568 - BLOCK
      ?auto_502569 - BLOCK
      ?auto_502570 - BLOCK
      ?auto_502571 - BLOCK
      ?auto_502572 - BLOCK
      ?auto_502573 - BLOCK
      ?auto_502574 - BLOCK
      ?auto_502575 - BLOCK
      ?auto_502576 - BLOCK
    )
    :vars
    (
      ?auto_502577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_502561 ?auto_502562 ) ) ( not ( = ?auto_502561 ?auto_502563 ) ) ( not ( = ?auto_502561 ?auto_502564 ) ) ( not ( = ?auto_502561 ?auto_502565 ) ) ( not ( = ?auto_502561 ?auto_502566 ) ) ( not ( = ?auto_502561 ?auto_502567 ) ) ( not ( = ?auto_502561 ?auto_502568 ) ) ( not ( = ?auto_502561 ?auto_502569 ) ) ( not ( = ?auto_502561 ?auto_502570 ) ) ( not ( = ?auto_502561 ?auto_502571 ) ) ( not ( = ?auto_502561 ?auto_502572 ) ) ( not ( = ?auto_502561 ?auto_502573 ) ) ( not ( = ?auto_502561 ?auto_502574 ) ) ( not ( = ?auto_502561 ?auto_502575 ) ) ( not ( = ?auto_502561 ?auto_502576 ) ) ( not ( = ?auto_502562 ?auto_502563 ) ) ( not ( = ?auto_502562 ?auto_502564 ) ) ( not ( = ?auto_502562 ?auto_502565 ) ) ( not ( = ?auto_502562 ?auto_502566 ) ) ( not ( = ?auto_502562 ?auto_502567 ) ) ( not ( = ?auto_502562 ?auto_502568 ) ) ( not ( = ?auto_502562 ?auto_502569 ) ) ( not ( = ?auto_502562 ?auto_502570 ) ) ( not ( = ?auto_502562 ?auto_502571 ) ) ( not ( = ?auto_502562 ?auto_502572 ) ) ( not ( = ?auto_502562 ?auto_502573 ) ) ( not ( = ?auto_502562 ?auto_502574 ) ) ( not ( = ?auto_502562 ?auto_502575 ) ) ( not ( = ?auto_502562 ?auto_502576 ) ) ( not ( = ?auto_502563 ?auto_502564 ) ) ( not ( = ?auto_502563 ?auto_502565 ) ) ( not ( = ?auto_502563 ?auto_502566 ) ) ( not ( = ?auto_502563 ?auto_502567 ) ) ( not ( = ?auto_502563 ?auto_502568 ) ) ( not ( = ?auto_502563 ?auto_502569 ) ) ( not ( = ?auto_502563 ?auto_502570 ) ) ( not ( = ?auto_502563 ?auto_502571 ) ) ( not ( = ?auto_502563 ?auto_502572 ) ) ( not ( = ?auto_502563 ?auto_502573 ) ) ( not ( = ?auto_502563 ?auto_502574 ) ) ( not ( = ?auto_502563 ?auto_502575 ) ) ( not ( = ?auto_502563 ?auto_502576 ) ) ( not ( = ?auto_502564 ?auto_502565 ) ) ( not ( = ?auto_502564 ?auto_502566 ) ) ( not ( = ?auto_502564 ?auto_502567 ) ) ( not ( = ?auto_502564 ?auto_502568 ) ) ( not ( = ?auto_502564 ?auto_502569 ) ) ( not ( = ?auto_502564 ?auto_502570 ) ) ( not ( = ?auto_502564 ?auto_502571 ) ) ( not ( = ?auto_502564 ?auto_502572 ) ) ( not ( = ?auto_502564 ?auto_502573 ) ) ( not ( = ?auto_502564 ?auto_502574 ) ) ( not ( = ?auto_502564 ?auto_502575 ) ) ( not ( = ?auto_502564 ?auto_502576 ) ) ( not ( = ?auto_502565 ?auto_502566 ) ) ( not ( = ?auto_502565 ?auto_502567 ) ) ( not ( = ?auto_502565 ?auto_502568 ) ) ( not ( = ?auto_502565 ?auto_502569 ) ) ( not ( = ?auto_502565 ?auto_502570 ) ) ( not ( = ?auto_502565 ?auto_502571 ) ) ( not ( = ?auto_502565 ?auto_502572 ) ) ( not ( = ?auto_502565 ?auto_502573 ) ) ( not ( = ?auto_502565 ?auto_502574 ) ) ( not ( = ?auto_502565 ?auto_502575 ) ) ( not ( = ?auto_502565 ?auto_502576 ) ) ( not ( = ?auto_502566 ?auto_502567 ) ) ( not ( = ?auto_502566 ?auto_502568 ) ) ( not ( = ?auto_502566 ?auto_502569 ) ) ( not ( = ?auto_502566 ?auto_502570 ) ) ( not ( = ?auto_502566 ?auto_502571 ) ) ( not ( = ?auto_502566 ?auto_502572 ) ) ( not ( = ?auto_502566 ?auto_502573 ) ) ( not ( = ?auto_502566 ?auto_502574 ) ) ( not ( = ?auto_502566 ?auto_502575 ) ) ( not ( = ?auto_502566 ?auto_502576 ) ) ( not ( = ?auto_502567 ?auto_502568 ) ) ( not ( = ?auto_502567 ?auto_502569 ) ) ( not ( = ?auto_502567 ?auto_502570 ) ) ( not ( = ?auto_502567 ?auto_502571 ) ) ( not ( = ?auto_502567 ?auto_502572 ) ) ( not ( = ?auto_502567 ?auto_502573 ) ) ( not ( = ?auto_502567 ?auto_502574 ) ) ( not ( = ?auto_502567 ?auto_502575 ) ) ( not ( = ?auto_502567 ?auto_502576 ) ) ( not ( = ?auto_502568 ?auto_502569 ) ) ( not ( = ?auto_502568 ?auto_502570 ) ) ( not ( = ?auto_502568 ?auto_502571 ) ) ( not ( = ?auto_502568 ?auto_502572 ) ) ( not ( = ?auto_502568 ?auto_502573 ) ) ( not ( = ?auto_502568 ?auto_502574 ) ) ( not ( = ?auto_502568 ?auto_502575 ) ) ( not ( = ?auto_502568 ?auto_502576 ) ) ( not ( = ?auto_502569 ?auto_502570 ) ) ( not ( = ?auto_502569 ?auto_502571 ) ) ( not ( = ?auto_502569 ?auto_502572 ) ) ( not ( = ?auto_502569 ?auto_502573 ) ) ( not ( = ?auto_502569 ?auto_502574 ) ) ( not ( = ?auto_502569 ?auto_502575 ) ) ( not ( = ?auto_502569 ?auto_502576 ) ) ( not ( = ?auto_502570 ?auto_502571 ) ) ( not ( = ?auto_502570 ?auto_502572 ) ) ( not ( = ?auto_502570 ?auto_502573 ) ) ( not ( = ?auto_502570 ?auto_502574 ) ) ( not ( = ?auto_502570 ?auto_502575 ) ) ( not ( = ?auto_502570 ?auto_502576 ) ) ( not ( = ?auto_502571 ?auto_502572 ) ) ( not ( = ?auto_502571 ?auto_502573 ) ) ( not ( = ?auto_502571 ?auto_502574 ) ) ( not ( = ?auto_502571 ?auto_502575 ) ) ( not ( = ?auto_502571 ?auto_502576 ) ) ( not ( = ?auto_502572 ?auto_502573 ) ) ( not ( = ?auto_502572 ?auto_502574 ) ) ( not ( = ?auto_502572 ?auto_502575 ) ) ( not ( = ?auto_502572 ?auto_502576 ) ) ( not ( = ?auto_502573 ?auto_502574 ) ) ( not ( = ?auto_502573 ?auto_502575 ) ) ( not ( = ?auto_502573 ?auto_502576 ) ) ( not ( = ?auto_502574 ?auto_502575 ) ) ( not ( = ?auto_502574 ?auto_502576 ) ) ( not ( = ?auto_502575 ?auto_502576 ) ) ( ON ?auto_502561 ?auto_502577 ) ( not ( = ?auto_502576 ?auto_502577 ) ) ( not ( = ?auto_502575 ?auto_502577 ) ) ( not ( = ?auto_502574 ?auto_502577 ) ) ( not ( = ?auto_502573 ?auto_502577 ) ) ( not ( = ?auto_502572 ?auto_502577 ) ) ( not ( = ?auto_502571 ?auto_502577 ) ) ( not ( = ?auto_502570 ?auto_502577 ) ) ( not ( = ?auto_502569 ?auto_502577 ) ) ( not ( = ?auto_502568 ?auto_502577 ) ) ( not ( = ?auto_502567 ?auto_502577 ) ) ( not ( = ?auto_502566 ?auto_502577 ) ) ( not ( = ?auto_502565 ?auto_502577 ) ) ( not ( = ?auto_502564 ?auto_502577 ) ) ( not ( = ?auto_502563 ?auto_502577 ) ) ( not ( = ?auto_502562 ?auto_502577 ) ) ( not ( = ?auto_502561 ?auto_502577 ) ) ( ON ?auto_502562 ?auto_502561 ) ( ON ?auto_502563 ?auto_502562 ) ( ON ?auto_502564 ?auto_502563 ) ( ON ?auto_502565 ?auto_502564 ) ( ON ?auto_502566 ?auto_502565 ) ( ON ?auto_502567 ?auto_502566 ) ( ON ?auto_502568 ?auto_502567 ) ( ON ?auto_502569 ?auto_502568 ) ( ON ?auto_502570 ?auto_502569 ) ( ON ?auto_502571 ?auto_502570 ) ( ON ?auto_502572 ?auto_502571 ) ( ON ?auto_502573 ?auto_502572 ) ( ON ?auto_502574 ?auto_502573 ) ( ON ?auto_502575 ?auto_502574 ) ( ON ?auto_502576 ?auto_502575 ) ( CLEAR ?auto_502576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_502576 ?auto_502575 ?auto_502574 ?auto_502573 ?auto_502572 ?auto_502571 ?auto_502570 ?auto_502569 ?auto_502568 ?auto_502567 ?auto_502566 ?auto_502565 ?auto_502564 ?auto_502563 ?auto_502562 ?auto_502561 )
      ( MAKE-16PILE ?auto_502561 ?auto_502562 ?auto_502563 ?auto_502564 ?auto_502565 ?auto_502566 ?auto_502567 ?auto_502568 ?auto_502569 ?auto_502570 ?auto_502571 ?auto_502572 ?auto_502573 ?auto_502574 ?auto_502575 ?auto_502576 ) )
  )

)

