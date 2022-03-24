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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7400 - BLOCK
      ?auto_7401 - BLOCK
      ?auto_7402 - BLOCK
      ?auto_7403 - BLOCK
    )
    :vars
    (
      ?auto_7404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7404 ?auto_7403 ) ( CLEAR ?auto_7404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7400 ) ( ON ?auto_7401 ?auto_7400 ) ( ON ?auto_7402 ?auto_7401 ) ( ON ?auto_7403 ?auto_7402 ) ( not ( = ?auto_7400 ?auto_7401 ) ) ( not ( = ?auto_7400 ?auto_7402 ) ) ( not ( = ?auto_7400 ?auto_7403 ) ) ( not ( = ?auto_7400 ?auto_7404 ) ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( not ( = ?auto_7401 ?auto_7403 ) ) ( not ( = ?auto_7401 ?auto_7404 ) ) ( not ( = ?auto_7402 ?auto_7403 ) ) ( not ( = ?auto_7402 ?auto_7404 ) ) ( not ( = ?auto_7403 ?auto_7404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7404 ?auto_7403 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7406 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7406 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7407 - BLOCK
    )
    :vars
    (
      ?auto_7408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7407 ?auto_7408 ) ( CLEAR ?auto_7407 ) ( HAND-EMPTY ) ( not ( = ?auto_7407 ?auto_7408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7407 ?auto_7408 )
      ( MAKE-1PILE ?auto_7407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7412 - BLOCK
      ?auto_7413 - BLOCK
      ?auto_7414 - BLOCK
    )
    :vars
    (
      ?auto_7415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7415 ?auto_7414 ) ( CLEAR ?auto_7415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7412 ) ( ON ?auto_7413 ?auto_7412 ) ( ON ?auto_7414 ?auto_7413 ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( not ( = ?auto_7412 ?auto_7414 ) ) ( not ( = ?auto_7412 ?auto_7415 ) ) ( not ( = ?auto_7413 ?auto_7414 ) ) ( not ( = ?auto_7413 ?auto_7415 ) ) ( not ( = ?auto_7414 ?auto_7415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7415 ?auto_7414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7416 - BLOCK
      ?auto_7417 - BLOCK
      ?auto_7418 - BLOCK
    )
    :vars
    (
      ?auto_7419 - BLOCK
      ?auto_7420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7419 ?auto_7418 ) ( CLEAR ?auto_7419 ) ( ON-TABLE ?auto_7416 ) ( ON ?auto_7417 ?auto_7416 ) ( ON ?auto_7418 ?auto_7417 ) ( not ( = ?auto_7416 ?auto_7417 ) ) ( not ( = ?auto_7416 ?auto_7418 ) ) ( not ( = ?auto_7416 ?auto_7419 ) ) ( not ( = ?auto_7417 ?auto_7418 ) ) ( not ( = ?auto_7417 ?auto_7419 ) ) ( not ( = ?auto_7418 ?auto_7419 ) ) ( HOLDING ?auto_7420 ) ( not ( = ?auto_7416 ?auto_7420 ) ) ( not ( = ?auto_7417 ?auto_7420 ) ) ( not ( = ?auto_7418 ?auto_7420 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7420 )
      ( MAKE-3PILE ?auto_7416 ?auto_7417 ?auto_7418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7421 - BLOCK
      ?auto_7422 - BLOCK
      ?auto_7423 - BLOCK
    )
    :vars
    (
      ?auto_7424 - BLOCK
      ?auto_7425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7424 ?auto_7423 ) ( ON-TABLE ?auto_7421 ) ( ON ?auto_7422 ?auto_7421 ) ( ON ?auto_7423 ?auto_7422 ) ( not ( = ?auto_7421 ?auto_7422 ) ) ( not ( = ?auto_7421 ?auto_7423 ) ) ( not ( = ?auto_7421 ?auto_7424 ) ) ( not ( = ?auto_7422 ?auto_7423 ) ) ( not ( = ?auto_7422 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7421 ?auto_7425 ) ) ( not ( = ?auto_7422 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( ON ?auto_7425 ?auto_7424 ) ( CLEAR ?auto_7425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7421 ?auto_7422 ?auto_7423 ?auto_7424 )
      ( MAKE-3PILE ?auto_7421 ?auto_7422 ?auto_7423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7428 - BLOCK
      ?auto_7429 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7429 ) ( CLEAR ?auto_7428 ) ( ON-TABLE ?auto_7428 ) ( not ( = ?auto_7428 ?auto_7429 ) ) )
    :subtasks
    ( ( !STACK ?auto_7429 ?auto_7428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7430 - BLOCK
      ?auto_7431 - BLOCK
    )
    :vars
    (
      ?auto_7432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7430 ) ( ON-TABLE ?auto_7430 ) ( not ( = ?auto_7430 ?auto_7431 ) ) ( ON ?auto_7431 ?auto_7432 ) ( CLEAR ?auto_7431 ) ( HAND-EMPTY ) ( not ( = ?auto_7430 ?auto_7432 ) ) ( not ( = ?auto_7431 ?auto_7432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7431 ?auto_7432 )
      ( MAKE-2PILE ?auto_7430 ?auto_7431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7433 - BLOCK
      ?auto_7434 - BLOCK
    )
    :vars
    (
      ?auto_7435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7433 ?auto_7434 ) ) ( ON ?auto_7434 ?auto_7435 ) ( CLEAR ?auto_7434 ) ( not ( = ?auto_7433 ?auto_7435 ) ) ( not ( = ?auto_7434 ?auto_7435 ) ) ( HOLDING ?auto_7433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7433 )
      ( MAKE-2PILE ?auto_7433 ?auto_7434 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7436 - BLOCK
      ?auto_7437 - BLOCK
    )
    :vars
    (
      ?auto_7438 - BLOCK
      ?auto_7440 - BLOCK
      ?auto_7439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7436 ?auto_7437 ) ) ( ON ?auto_7437 ?auto_7438 ) ( not ( = ?auto_7436 ?auto_7438 ) ) ( not ( = ?auto_7437 ?auto_7438 ) ) ( ON ?auto_7436 ?auto_7437 ) ( CLEAR ?auto_7436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7440 ) ( ON ?auto_7439 ?auto_7440 ) ( ON ?auto_7438 ?auto_7439 ) ( not ( = ?auto_7440 ?auto_7439 ) ) ( not ( = ?auto_7440 ?auto_7438 ) ) ( not ( = ?auto_7440 ?auto_7437 ) ) ( not ( = ?auto_7440 ?auto_7436 ) ) ( not ( = ?auto_7439 ?auto_7438 ) ) ( not ( = ?auto_7439 ?auto_7437 ) ) ( not ( = ?auto_7439 ?auto_7436 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7440 ?auto_7439 ?auto_7438 ?auto_7437 )
      ( MAKE-2PILE ?auto_7436 ?auto_7437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7443 - BLOCK
      ?auto_7444 - BLOCK
    )
    :vars
    (
      ?auto_7445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7445 ?auto_7444 ) ( CLEAR ?auto_7445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7443 ) ( ON ?auto_7444 ?auto_7443 ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7445 ) ) ( not ( = ?auto_7444 ?auto_7445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7445 ?auto_7444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7446 - BLOCK
      ?auto_7447 - BLOCK
    )
    :vars
    (
      ?auto_7448 - BLOCK
      ?auto_7449 - BLOCK
      ?auto_7450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7448 ?auto_7447 ) ( CLEAR ?auto_7448 ) ( ON-TABLE ?auto_7446 ) ( ON ?auto_7447 ?auto_7446 ) ( not ( = ?auto_7446 ?auto_7447 ) ) ( not ( = ?auto_7446 ?auto_7448 ) ) ( not ( = ?auto_7447 ?auto_7448 ) ) ( HOLDING ?auto_7449 ) ( CLEAR ?auto_7450 ) ( not ( = ?auto_7446 ?auto_7449 ) ) ( not ( = ?auto_7446 ?auto_7450 ) ) ( not ( = ?auto_7447 ?auto_7449 ) ) ( not ( = ?auto_7447 ?auto_7450 ) ) ( not ( = ?auto_7448 ?auto_7449 ) ) ( not ( = ?auto_7448 ?auto_7450 ) ) ( not ( = ?auto_7449 ?auto_7450 ) ) )
    :subtasks
    ( ( !STACK ?auto_7449 ?auto_7450 )
      ( MAKE-2PILE ?auto_7446 ?auto_7447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7646 - BLOCK
      ?auto_7647 - BLOCK
    )
    :vars
    (
      ?auto_7649 - BLOCK
      ?auto_7648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7649 ?auto_7647 ) ( ON-TABLE ?auto_7646 ) ( ON ?auto_7647 ?auto_7646 ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7647 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7648 ) ) ( not ( = ?auto_7649 ?auto_7648 ) ) ( ON ?auto_7648 ?auto_7649 ) ( CLEAR ?auto_7648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7646 ?auto_7647 ?auto_7649 )
      ( MAKE-2PILE ?auto_7646 ?auto_7647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7456 - BLOCK
      ?auto_7457 - BLOCK
    )
    :vars
    (
      ?auto_7459 - BLOCK
      ?auto_7458 - BLOCK
      ?auto_7460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7459 ?auto_7457 ) ( ON-TABLE ?auto_7456 ) ( ON ?auto_7457 ?auto_7456 ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7456 ?auto_7459 ) ) ( not ( = ?auto_7457 ?auto_7459 ) ) ( not ( = ?auto_7456 ?auto_7458 ) ) ( not ( = ?auto_7456 ?auto_7460 ) ) ( not ( = ?auto_7457 ?auto_7458 ) ) ( not ( = ?auto_7457 ?auto_7460 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( not ( = ?auto_7459 ?auto_7460 ) ) ( not ( = ?auto_7458 ?auto_7460 ) ) ( ON ?auto_7458 ?auto_7459 ) ( CLEAR ?auto_7458 ) ( HOLDING ?auto_7460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7460 )
      ( MAKE-2PILE ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7461 - BLOCK
      ?auto_7462 - BLOCK
    )
    :vars
    (
      ?auto_7463 - BLOCK
      ?auto_7464 - BLOCK
      ?auto_7465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7463 ?auto_7462 ) ( ON-TABLE ?auto_7461 ) ( ON ?auto_7462 ?auto_7461 ) ( not ( = ?auto_7461 ?auto_7462 ) ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( not ( = ?auto_7462 ?auto_7463 ) ) ( not ( = ?auto_7461 ?auto_7464 ) ) ( not ( = ?auto_7461 ?auto_7465 ) ) ( not ( = ?auto_7462 ?auto_7464 ) ) ( not ( = ?auto_7462 ?auto_7465 ) ) ( not ( = ?auto_7463 ?auto_7464 ) ) ( not ( = ?auto_7463 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( ON ?auto_7464 ?auto_7463 ) ( ON ?auto_7465 ?auto_7464 ) ( CLEAR ?auto_7465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7461 ?auto_7462 ?auto_7463 ?auto_7464 )
      ( MAKE-2PILE ?auto_7461 ?auto_7462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7469 - BLOCK
      ?auto_7470 - BLOCK
      ?auto_7471 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7471 ) ( CLEAR ?auto_7470 ) ( ON-TABLE ?auto_7469 ) ( ON ?auto_7470 ?auto_7469 ) ( not ( = ?auto_7469 ?auto_7470 ) ) ( not ( = ?auto_7469 ?auto_7471 ) ) ( not ( = ?auto_7470 ?auto_7471 ) ) )
    :subtasks
    ( ( !STACK ?auto_7471 ?auto_7470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7472 - BLOCK
      ?auto_7473 - BLOCK
      ?auto_7474 - BLOCK
    )
    :vars
    (
      ?auto_7475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7473 ) ( ON-TABLE ?auto_7472 ) ( ON ?auto_7473 ?auto_7472 ) ( not ( = ?auto_7472 ?auto_7473 ) ) ( not ( = ?auto_7472 ?auto_7474 ) ) ( not ( = ?auto_7473 ?auto_7474 ) ) ( ON ?auto_7474 ?auto_7475 ) ( CLEAR ?auto_7474 ) ( HAND-EMPTY ) ( not ( = ?auto_7472 ?auto_7475 ) ) ( not ( = ?auto_7473 ?auto_7475 ) ) ( not ( = ?auto_7474 ?auto_7475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7474 ?auto_7475 )
      ( MAKE-3PILE ?auto_7472 ?auto_7473 ?auto_7474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7476 - BLOCK
      ?auto_7477 - BLOCK
      ?auto_7478 - BLOCK
    )
    :vars
    (
      ?auto_7479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7476 ) ( not ( = ?auto_7476 ?auto_7477 ) ) ( not ( = ?auto_7476 ?auto_7478 ) ) ( not ( = ?auto_7477 ?auto_7478 ) ) ( ON ?auto_7478 ?auto_7479 ) ( CLEAR ?auto_7478 ) ( not ( = ?auto_7476 ?auto_7479 ) ) ( not ( = ?auto_7477 ?auto_7479 ) ) ( not ( = ?auto_7478 ?auto_7479 ) ) ( HOLDING ?auto_7477 ) ( CLEAR ?auto_7476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7476 ?auto_7477 )
      ( MAKE-3PILE ?auto_7476 ?auto_7477 ?auto_7478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7480 - BLOCK
      ?auto_7481 - BLOCK
      ?auto_7482 - BLOCK
    )
    :vars
    (
      ?auto_7483 - BLOCK
      ?auto_7484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7480 ) ( not ( = ?auto_7480 ?auto_7481 ) ) ( not ( = ?auto_7480 ?auto_7482 ) ) ( not ( = ?auto_7481 ?auto_7482 ) ) ( ON ?auto_7482 ?auto_7483 ) ( not ( = ?auto_7480 ?auto_7483 ) ) ( not ( = ?auto_7481 ?auto_7483 ) ) ( not ( = ?auto_7482 ?auto_7483 ) ) ( CLEAR ?auto_7480 ) ( ON ?auto_7481 ?auto_7482 ) ( CLEAR ?auto_7481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7484 ) ( ON ?auto_7483 ?auto_7484 ) ( not ( = ?auto_7484 ?auto_7483 ) ) ( not ( = ?auto_7484 ?auto_7482 ) ) ( not ( = ?auto_7484 ?auto_7481 ) ) ( not ( = ?auto_7480 ?auto_7484 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7484 ?auto_7483 ?auto_7482 )
      ( MAKE-3PILE ?auto_7480 ?auto_7481 ?auto_7482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7485 - BLOCK
      ?auto_7486 - BLOCK
      ?auto_7487 - BLOCK
    )
    :vars
    (
      ?auto_7488 - BLOCK
      ?auto_7489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( not ( = ?auto_7486 ?auto_7487 ) ) ( ON ?auto_7487 ?auto_7488 ) ( not ( = ?auto_7485 ?auto_7488 ) ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( not ( = ?auto_7487 ?auto_7488 ) ) ( ON ?auto_7486 ?auto_7487 ) ( CLEAR ?auto_7486 ) ( ON-TABLE ?auto_7489 ) ( ON ?auto_7488 ?auto_7489 ) ( not ( = ?auto_7489 ?auto_7488 ) ) ( not ( = ?auto_7489 ?auto_7487 ) ) ( not ( = ?auto_7489 ?auto_7486 ) ) ( not ( = ?auto_7485 ?auto_7489 ) ) ( HOLDING ?auto_7485 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7485 )
      ( MAKE-3PILE ?auto_7485 ?auto_7486 ?auto_7487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7490 - BLOCK
      ?auto_7491 - BLOCK
      ?auto_7492 - BLOCK
    )
    :vars
    (
      ?auto_7494 - BLOCK
      ?auto_7493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7490 ?auto_7491 ) ) ( not ( = ?auto_7490 ?auto_7492 ) ) ( not ( = ?auto_7491 ?auto_7492 ) ) ( ON ?auto_7492 ?auto_7494 ) ( not ( = ?auto_7490 ?auto_7494 ) ) ( not ( = ?auto_7491 ?auto_7494 ) ) ( not ( = ?auto_7492 ?auto_7494 ) ) ( ON ?auto_7491 ?auto_7492 ) ( ON-TABLE ?auto_7493 ) ( ON ?auto_7494 ?auto_7493 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( not ( = ?auto_7493 ?auto_7492 ) ) ( not ( = ?auto_7493 ?auto_7491 ) ) ( not ( = ?auto_7490 ?auto_7493 ) ) ( ON ?auto_7490 ?auto_7491 ) ( CLEAR ?auto_7490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7493 ?auto_7494 ?auto_7492 ?auto_7491 )
      ( MAKE-3PILE ?auto_7490 ?auto_7491 ?auto_7492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7496 - BLOCK
    )
    :vars
    (
      ?auto_7497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7497 ?auto_7496 ) ( CLEAR ?auto_7497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7496 ) ( not ( = ?auto_7496 ?auto_7497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7497 ?auto_7496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7498 - BLOCK
    )
    :vars
    (
      ?auto_7499 - BLOCK
      ?auto_7500 - BLOCK
      ?auto_7501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7499 ?auto_7498 ) ( CLEAR ?auto_7499 ) ( ON-TABLE ?auto_7498 ) ( not ( = ?auto_7498 ?auto_7499 ) ) ( HOLDING ?auto_7500 ) ( CLEAR ?auto_7501 ) ( not ( = ?auto_7498 ?auto_7500 ) ) ( not ( = ?auto_7498 ?auto_7501 ) ) ( not ( = ?auto_7499 ?auto_7500 ) ) ( not ( = ?auto_7499 ?auto_7501 ) ) ( not ( = ?auto_7500 ?auto_7501 ) ) )
    :subtasks
    ( ( !STACK ?auto_7500 ?auto_7501 )
      ( MAKE-1PILE ?auto_7498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7502 - BLOCK
    )
    :vars
    (
      ?auto_7505 - BLOCK
      ?auto_7503 - BLOCK
      ?auto_7504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7505 ?auto_7502 ) ( ON-TABLE ?auto_7502 ) ( not ( = ?auto_7502 ?auto_7505 ) ) ( CLEAR ?auto_7503 ) ( not ( = ?auto_7502 ?auto_7504 ) ) ( not ( = ?auto_7502 ?auto_7503 ) ) ( not ( = ?auto_7505 ?auto_7504 ) ) ( not ( = ?auto_7505 ?auto_7503 ) ) ( not ( = ?auto_7504 ?auto_7503 ) ) ( ON ?auto_7504 ?auto_7505 ) ( CLEAR ?auto_7504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7502 ?auto_7505 )
      ( MAKE-1PILE ?auto_7502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7506 - BLOCK
    )
    :vars
    (
      ?auto_7507 - BLOCK
      ?auto_7508 - BLOCK
      ?auto_7509 - BLOCK
      ?auto_7510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7507 ?auto_7506 ) ( ON-TABLE ?auto_7506 ) ( not ( = ?auto_7506 ?auto_7507 ) ) ( not ( = ?auto_7506 ?auto_7508 ) ) ( not ( = ?auto_7506 ?auto_7509 ) ) ( not ( = ?auto_7507 ?auto_7508 ) ) ( not ( = ?auto_7507 ?auto_7509 ) ) ( not ( = ?auto_7508 ?auto_7509 ) ) ( ON ?auto_7508 ?auto_7507 ) ( CLEAR ?auto_7508 ) ( HOLDING ?auto_7509 ) ( CLEAR ?auto_7510 ) ( ON-TABLE ?auto_7510 ) ( not ( = ?auto_7510 ?auto_7509 ) ) ( not ( = ?auto_7506 ?auto_7510 ) ) ( not ( = ?auto_7507 ?auto_7510 ) ) ( not ( = ?auto_7508 ?auto_7510 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7510 ?auto_7509 )
      ( MAKE-1PILE ?auto_7506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7734 - BLOCK
    )
    :vars
    (
      ?auto_7735 - BLOCK
      ?auto_7736 - BLOCK
      ?auto_7737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7735 ?auto_7734 ) ( ON-TABLE ?auto_7734 ) ( not ( = ?auto_7734 ?auto_7735 ) ) ( not ( = ?auto_7734 ?auto_7736 ) ) ( not ( = ?auto_7734 ?auto_7737 ) ) ( not ( = ?auto_7735 ?auto_7736 ) ) ( not ( = ?auto_7735 ?auto_7737 ) ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( ON ?auto_7736 ?auto_7735 ) ( ON ?auto_7737 ?auto_7736 ) ( CLEAR ?auto_7737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7734 ?auto_7735 ?auto_7736 )
      ( MAKE-1PILE ?auto_7734 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7516 - BLOCK
    )
    :vars
    (
      ?auto_7517 - BLOCK
      ?auto_7518 - BLOCK
      ?auto_7520 - BLOCK
      ?auto_7519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7517 ?auto_7516 ) ( ON-TABLE ?auto_7516 ) ( not ( = ?auto_7516 ?auto_7517 ) ) ( not ( = ?auto_7516 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7520 ) ) ( not ( = ?auto_7517 ?auto_7518 ) ) ( not ( = ?auto_7517 ?auto_7520 ) ) ( not ( = ?auto_7518 ?auto_7520 ) ) ( ON ?auto_7518 ?auto_7517 ) ( not ( = ?auto_7519 ?auto_7520 ) ) ( not ( = ?auto_7516 ?auto_7519 ) ) ( not ( = ?auto_7517 ?auto_7519 ) ) ( not ( = ?auto_7518 ?auto_7519 ) ) ( ON ?auto_7520 ?auto_7518 ) ( CLEAR ?auto_7520 ) ( HOLDING ?auto_7519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7519 )
      ( MAKE-1PILE ?auto_7516 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7521 - BLOCK
    )
    :vars
    (
      ?auto_7522 - BLOCK
      ?auto_7525 - BLOCK
      ?auto_7524 - BLOCK
      ?auto_7523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7522 ?auto_7521 ) ( ON-TABLE ?auto_7521 ) ( not ( = ?auto_7521 ?auto_7522 ) ) ( not ( = ?auto_7521 ?auto_7525 ) ) ( not ( = ?auto_7521 ?auto_7524 ) ) ( not ( = ?auto_7522 ?auto_7525 ) ) ( not ( = ?auto_7522 ?auto_7524 ) ) ( not ( = ?auto_7525 ?auto_7524 ) ) ( ON ?auto_7525 ?auto_7522 ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7521 ?auto_7523 ) ) ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7525 ?auto_7523 ) ) ( ON ?auto_7524 ?auto_7525 ) ( ON ?auto_7523 ?auto_7524 ) ( CLEAR ?auto_7523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7521 ?auto_7522 ?auto_7525 ?auto_7524 )
      ( MAKE-1PILE ?auto_7521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7530 - BLOCK
      ?auto_7531 - BLOCK
      ?auto_7532 - BLOCK
      ?auto_7533 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7533 ) ( CLEAR ?auto_7532 ) ( ON-TABLE ?auto_7530 ) ( ON ?auto_7531 ?auto_7530 ) ( ON ?auto_7532 ?auto_7531 ) ( not ( = ?auto_7530 ?auto_7531 ) ) ( not ( = ?auto_7530 ?auto_7532 ) ) ( not ( = ?auto_7530 ?auto_7533 ) ) ( not ( = ?auto_7531 ?auto_7532 ) ) ( not ( = ?auto_7531 ?auto_7533 ) ) ( not ( = ?auto_7532 ?auto_7533 ) ) )
    :subtasks
    ( ( !STACK ?auto_7533 ?auto_7532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7534 - BLOCK
      ?auto_7535 - BLOCK
      ?auto_7536 - BLOCK
      ?auto_7537 - BLOCK
    )
    :vars
    (
      ?auto_7538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7536 ) ( ON-TABLE ?auto_7534 ) ( ON ?auto_7535 ?auto_7534 ) ( ON ?auto_7536 ?auto_7535 ) ( not ( = ?auto_7534 ?auto_7535 ) ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( not ( = ?auto_7534 ?auto_7537 ) ) ( not ( = ?auto_7535 ?auto_7536 ) ) ( not ( = ?auto_7535 ?auto_7537 ) ) ( not ( = ?auto_7536 ?auto_7537 ) ) ( ON ?auto_7537 ?auto_7538 ) ( CLEAR ?auto_7537 ) ( HAND-EMPTY ) ( not ( = ?auto_7534 ?auto_7538 ) ) ( not ( = ?auto_7535 ?auto_7538 ) ) ( not ( = ?auto_7536 ?auto_7538 ) ) ( not ( = ?auto_7537 ?auto_7538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7537 ?auto_7538 )
      ( MAKE-4PILE ?auto_7534 ?auto_7535 ?auto_7536 ?auto_7537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7539 - BLOCK
      ?auto_7540 - BLOCK
      ?auto_7541 - BLOCK
      ?auto_7542 - BLOCK
    )
    :vars
    (
      ?auto_7543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7539 ) ( ON ?auto_7540 ?auto_7539 ) ( not ( = ?auto_7539 ?auto_7540 ) ) ( not ( = ?auto_7539 ?auto_7541 ) ) ( not ( = ?auto_7539 ?auto_7542 ) ) ( not ( = ?auto_7540 ?auto_7541 ) ) ( not ( = ?auto_7540 ?auto_7542 ) ) ( not ( = ?auto_7541 ?auto_7542 ) ) ( ON ?auto_7542 ?auto_7543 ) ( CLEAR ?auto_7542 ) ( not ( = ?auto_7539 ?auto_7543 ) ) ( not ( = ?auto_7540 ?auto_7543 ) ) ( not ( = ?auto_7541 ?auto_7543 ) ) ( not ( = ?auto_7542 ?auto_7543 ) ) ( HOLDING ?auto_7541 ) ( CLEAR ?auto_7540 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7539 ?auto_7540 ?auto_7541 )
      ( MAKE-4PILE ?auto_7539 ?auto_7540 ?auto_7541 ?auto_7542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7544 - BLOCK
      ?auto_7545 - BLOCK
      ?auto_7546 - BLOCK
      ?auto_7547 - BLOCK
    )
    :vars
    (
      ?auto_7548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7544 ) ( ON ?auto_7545 ?auto_7544 ) ( not ( = ?auto_7544 ?auto_7545 ) ) ( not ( = ?auto_7544 ?auto_7546 ) ) ( not ( = ?auto_7544 ?auto_7547 ) ) ( not ( = ?auto_7545 ?auto_7546 ) ) ( not ( = ?auto_7545 ?auto_7547 ) ) ( not ( = ?auto_7546 ?auto_7547 ) ) ( ON ?auto_7547 ?auto_7548 ) ( not ( = ?auto_7544 ?auto_7548 ) ) ( not ( = ?auto_7545 ?auto_7548 ) ) ( not ( = ?auto_7546 ?auto_7548 ) ) ( not ( = ?auto_7547 ?auto_7548 ) ) ( CLEAR ?auto_7545 ) ( ON ?auto_7546 ?auto_7547 ) ( CLEAR ?auto_7546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7548 ?auto_7547 )
      ( MAKE-4PILE ?auto_7544 ?auto_7545 ?auto_7546 ?auto_7547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7549 - BLOCK
      ?auto_7550 - BLOCK
      ?auto_7551 - BLOCK
      ?auto_7552 - BLOCK
    )
    :vars
    (
      ?auto_7553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7549 ) ( not ( = ?auto_7549 ?auto_7550 ) ) ( not ( = ?auto_7549 ?auto_7551 ) ) ( not ( = ?auto_7549 ?auto_7552 ) ) ( not ( = ?auto_7550 ?auto_7551 ) ) ( not ( = ?auto_7550 ?auto_7552 ) ) ( not ( = ?auto_7551 ?auto_7552 ) ) ( ON ?auto_7552 ?auto_7553 ) ( not ( = ?auto_7549 ?auto_7553 ) ) ( not ( = ?auto_7550 ?auto_7553 ) ) ( not ( = ?auto_7551 ?auto_7553 ) ) ( not ( = ?auto_7552 ?auto_7553 ) ) ( ON ?auto_7551 ?auto_7552 ) ( CLEAR ?auto_7551 ) ( ON-TABLE ?auto_7553 ) ( HOLDING ?auto_7550 ) ( CLEAR ?auto_7549 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7549 ?auto_7550 )
      ( MAKE-4PILE ?auto_7549 ?auto_7550 ?auto_7551 ?auto_7552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7554 - BLOCK
      ?auto_7555 - BLOCK
      ?auto_7556 - BLOCK
      ?auto_7557 - BLOCK
    )
    :vars
    (
      ?auto_7558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7554 ) ( not ( = ?auto_7554 ?auto_7555 ) ) ( not ( = ?auto_7554 ?auto_7556 ) ) ( not ( = ?auto_7554 ?auto_7557 ) ) ( not ( = ?auto_7555 ?auto_7556 ) ) ( not ( = ?auto_7555 ?auto_7557 ) ) ( not ( = ?auto_7556 ?auto_7557 ) ) ( ON ?auto_7557 ?auto_7558 ) ( not ( = ?auto_7554 ?auto_7558 ) ) ( not ( = ?auto_7555 ?auto_7558 ) ) ( not ( = ?auto_7556 ?auto_7558 ) ) ( not ( = ?auto_7557 ?auto_7558 ) ) ( ON ?auto_7556 ?auto_7557 ) ( ON-TABLE ?auto_7558 ) ( CLEAR ?auto_7554 ) ( ON ?auto_7555 ?auto_7556 ) ( CLEAR ?auto_7555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7558 ?auto_7557 ?auto_7556 )
      ( MAKE-4PILE ?auto_7554 ?auto_7555 ?auto_7556 ?auto_7557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7559 - BLOCK
      ?auto_7560 - BLOCK
      ?auto_7561 - BLOCK
      ?auto_7562 - BLOCK
    )
    :vars
    (
      ?auto_7563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( not ( = ?auto_7559 ?auto_7562 ) ) ( not ( = ?auto_7560 ?auto_7561 ) ) ( not ( = ?auto_7560 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( ON ?auto_7562 ?auto_7563 ) ( not ( = ?auto_7559 ?auto_7563 ) ) ( not ( = ?auto_7560 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( ON ?auto_7561 ?auto_7562 ) ( ON-TABLE ?auto_7563 ) ( ON ?auto_7560 ?auto_7561 ) ( CLEAR ?auto_7560 ) ( HOLDING ?auto_7559 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7559 )
      ( MAKE-4PILE ?auto_7559 ?auto_7560 ?auto_7561 ?auto_7562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7564 - BLOCK
      ?auto_7565 - BLOCK
      ?auto_7566 - BLOCK
      ?auto_7567 - BLOCK
    )
    :vars
    (
      ?auto_7568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7564 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7567 ) ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7565 ?auto_7567 ) ) ( not ( = ?auto_7566 ?auto_7567 ) ) ( ON ?auto_7567 ?auto_7568 ) ( not ( = ?auto_7564 ?auto_7568 ) ) ( not ( = ?auto_7565 ?auto_7568 ) ) ( not ( = ?auto_7566 ?auto_7568 ) ) ( not ( = ?auto_7567 ?auto_7568 ) ) ( ON ?auto_7566 ?auto_7567 ) ( ON-TABLE ?auto_7568 ) ( ON ?auto_7565 ?auto_7566 ) ( ON ?auto_7564 ?auto_7565 ) ( CLEAR ?auto_7564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7568 ?auto_7567 ?auto_7566 ?auto_7565 )
      ( MAKE-4PILE ?auto_7564 ?auto_7565 ?auto_7566 ?auto_7567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7609 - BLOCK
    )
    :vars
    (
      ?auto_7610 - BLOCK
      ?auto_7611 - BLOCK
      ?auto_7612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7609 ?auto_7610 ) ( CLEAR ?auto_7609 ) ( not ( = ?auto_7609 ?auto_7610 ) ) ( HOLDING ?auto_7611 ) ( CLEAR ?auto_7612 ) ( not ( = ?auto_7609 ?auto_7611 ) ) ( not ( = ?auto_7609 ?auto_7612 ) ) ( not ( = ?auto_7610 ?auto_7611 ) ) ( not ( = ?auto_7610 ?auto_7612 ) ) ( not ( = ?auto_7611 ?auto_7612 ) ) )
    :subtasks
    ( ( !STACK ?auto_7611 ?auto_7612 )
      ( MAKE-1PILE ?auto_7609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7613 - BLOCK
    )
    :vars
    (
      ?auto_7616 - BLOCK
      ?auto_7615 - BLOCK
      ?auto_7614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7613 ?auto_7616 ) ( not ( = ?auto_7613 ?auto_7616 ) ) ( CLEAR ?auto_7615 ) ( not ( = ?auto_7613 ?auto_7614 ) ) ( not ( = ?auto_7613 ?auto_7615 ) ) ( not ( = ?auto_7616 ?auto_7614 ) ) ( not ( = ?auto_7616 ?auto_7615 ) ) ( not ( = ?auto_7614 ?auto_7615 ) ) ( ON ?auto_7614 ?auto_7613 ) ( CLEAR ?auto_7614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7616 ?auto_7613 )
      ( MAKE-1PILE ?auto_7613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7617 - BLOCK
    )
    :vars
    (
      ?auto_7620 - BLOCK
      ?auto_7619 - BLOCK
      ?auto_7618 - BLOCK
      ?auto_7621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7617 ?auto_7620 ) ( not ( = ?auto_7617 ?auto_7620 ) ) ( not ( = ?auto_7617 ?auto_7619 ) ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( not ( = ?auto_7620 ?auto_7619 ) ) ( not ( = ?auto_7620 ?auto_7618 ) ) ( not ( = ?auto_7619 ?auto_7618 ) ) ( ON ?auto_7619 ?auto_7617 ) ( CLEAR ?auto_7619 ) ( ON-TABLE ?auto_7620 ) ( HOLDING ?auto_7618 ) ( CLEAR ?auto_7621 ) ( ON-TABLE ?auto_7621 ) ( not ( = ?auto_7621 ?auto_7618 ) ) ( not ( = ?auto_7617 ?auto_7621 ) ) ( not ( = ?auto_7620 ?auto_7621 ) ) ( not ( = ?auto_7619 ?auto_7621 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7621 ?auto_7618 )
      ( MAKE-1PILE ?auto_7617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7622 - BLOCK
    )
    :vars
    (
      ?auto_7625 - BLOCK
      ?auto_7626 - BLOCK
      ?auto_7623 - BLOCK
      ?auto_7624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7622 ?auto_7625 ) ( not ( = ?auto_7622 ?auto_7625 ) ) ( not ( = ?auto_7622 ?auto_7626 ) ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( not ( = ?auto_7625 ?auto_7623 ) ) ( not ( = ?auto_7626 ?auto_7623 ) ) ( ON ?auto_7626 ?auto_7622 ) ( ON-TABLE ?auto_7625 ) ( CLEAR ?auto_7624 ) ( ON-TABLE ?auto_7624 ) ( not ( = ?auto_7624 ?auto_7623 ) ) ( not ( = ?auto_7622 ?auto_7624 ) ) ( not ( = ?auto_7625 ?auto_7624 ) ) ( not ( = ?auto_7626 ?auto_7624 ) ) ( ON ?auto_7623 ?auto_7626 ) ( CLEAR ?auto_7623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7625 ?auto_7622 ?auto_7626 )
      ( MAKE-1PILE ?auto_7622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7627 - BLOCK
    )
    :vars
    (
      ?auto_7631 - BLOCK
      ?auto_7629 - BLOCK
      ?auto_7630 - BLOCK
      ?auto_7628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7627 ?auto_7631 ) ( not ( = ?auto_7627 ?auto_7631 ) ) ( not ( = ?auto_7627 ?auto_7629 ) ) ( not ( = ?auto_7627 ?auto_7630 ) ) ( not ( = ?auto_7631 ?auto_7629 ) ) ( not ( = ?auto_7631 ?auto_7630 ) ) ( not ( = ?auto_7629 ?auto_7630 ) ) ( ON ?auto_7629 ?auto_7627 ) ( ON-TABLE ?auto_7631 ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( not ( = ?auto_7627 ?auto_7628 ) ) ( not ( = ?auto_7631 ?auto_7628 ) ) ( not ( = ?auto_7629 ?auto_7628 ) ) ( ON ?auto_7630 ?auto_7629 ) ( CLEAR ?auto_7630 ) ( HOLDING ?auto_7628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7628 )
      ( MAKE-1PILE ?auto_7627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7632 - BLOCK
    )
    :vars
    (
      ?auto_7636 - BLOCK
      ?auto_7634 - BLOCK
      ?auto_7633 - BLOCK
      ?auto_7635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7632 ?auto_7636 ) ( not ( = ?auto_7632 ?auto_7636 ) ) ( not ( = ?auto_7632 ?auto_7634 ) ) ( not ( = ?auto_7632 ?auto_7633 ) ) ( not ( = ?auto_7636 ?auto_7634 ) ) ( not ( = ?auto_7636 ?auto_7633 ) ) ( not ( = ?auto_7634 ?auto_7633 ) ) ( ON ?auto_7634 ?auto_7632 ) ( ON-TABLE ?auto_7636 ) ( not ( = ?auto_7635 ?auto_7633 ) ) ( not ( = ?auto_7632 ?auto_7635 ) ) ( not ( = ?auto_7636 ?auto_7635 ) ) ( not ( = ?auto_7634 ?auto_7635 ) ) ( ON ?auto_7633 ?auto_7634 ) ( ON ?auto_7635 ?auto_7633 ) ( CLEAR ?auto_7635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7636 ?auto_7632 ?auto_7634 ?auto_7633 )
      ( MAKE-1PILE ?auto_7632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7642 - BLOCK
      ?auto_7643 - BLOCK
    )
    :vars
    (
      ?auto_7644 - BLOCK
      ?auto_7645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7644 ?auto_7643 ) ( CLEAR ?auto_7644 ) ( ON-TABLE ?auto_7642 ) ( ON ?auto_7643 ?auto_7642 ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( not ( = ?auto_7642 ?auto_7644 ) ) ( not ( = ?auto_7643 ?auto_7644 ) ) ( HOLDING ?auto_7645 ) ( not ( = ?auto_7642 ?auto_7645 ) ) ( not ( = ?auto_7643 ?auto_7645 ) ) ( not ( = ?auto_7644 ?auto_7645 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7645 )
      ( MAKE-2PILE ?auto_7642 ?auto_7643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7679 - BLOCK
      ?auto_7680 - BLOCK
    )
    :vars
    (
      ?auto_7681 - BLOCK
      ?auto_7682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7679 ?auto_7680 ) ) ( ON ?auto_7680 ?auto_7681 ) ( not ( = ?auto_7679 ?auto_7681 ) ) ( not ( = ?auto_7680 ?auto_7681 ) ) ( ON ?auto_7679 ?auto_7680 ) ( CLEAR ?auto_7679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7682 ) ( ON ?auto_7681 ?auto_7682 ) ( not ( = ?auto_7682 ?auto_7681 ) ) ( not ( = ?auto_7682 ?auto_7680 ) ) ( not ( = ?auto_7682 ?auto_7679 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7682 ?auto_7681 ?auto_7680 )
      ( MAKE-2PILE ?auto_7679 ?auto_7680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7685 - BLOCK
      ?auto_7686 - BLOCK
    )
    :vars
    (
      ?auto_7687 - BLOCK
      ?auto_7688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7685 ?auto_7686 ) ) ( ON ?auto_7686 ?auto_7687 ) ( CLEAR ?auto_7686 ) ( not ( = ?auto_7685 ?auto_7687 ) ) ( not ( = ?auto_7686 ?auto_7687 ) ) ( ON ?auto_7685 ?auto_7688 ) ( CLEAR ?auto_7685 ) ( HAND-EMPTY ) ( not ( = ?auto_7685 ?auto_7688 ) ) ( not ( = ?auto_7686 ?auto_7688 ) ) ( not ( = ?auto_7687 ?auto_7688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7685 ?auto_7688 )
      ( MAKE-2PILE ?auto_7685 ?auto_7686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7689 - BLOCK
      ?auto_7690 - BLOCK
    )
    :vars
    (
      ?auto_7692 - BLOCK
      ?auto_7691 - BLOCK
      ?auto_7693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7689 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7692 ) ) ( not ( = ?auto_7690 ?auto_7692 ) ) ( ON ?auto_7689 ?auto_7691 ) ( CLEAR ?auto_7689 ) ( not ( = ?auto_7689 ?auto_7691 ) ) ( not ( = ?auto_7690 ?auto_7691 ) ) ( not ( = ?auto_7692 ?auto_7691 ) ) ( HOLDING ?auto_7690 ) ( CLEAR ?auto_7692 ) ( ON-TABLE ?auto_7693 ) ( ON ?auto_7692 ?auto_7693 ) ( not ( = ?auto_7693 ?auto_7692 ) ) ( not ( = ?auto_7693 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7693 ) ) ( not ( = ?auto_7691 ?auto_7693 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7693 ?auto_7692 ?auto_7690 )
      ( MAKE-2PILE ?auto_7689 ?auto_7690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7694 - BLOCK
      ?auto_7695 - BLOCK
    )
    :vars
    (
      ?auto_7697 - BLOCK
      ?auto_7698 - BLOCK
      ?auto_7696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7694 ?auto_7695 ) ) ( not ( = ?auto_7694 ?auto_7697 ) ) ( not ( = ?auto_7695 ?auto_7697 ) ) ( ON ?auto_7694 ?auto_7698 ) ( not ( = ?auto_7694 ?auto_7698 ) ) ( not ( = ?auto_7695 ?auto_7698 ) ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( CLEAR ?auto_7697 ) ( ON-TABLE ?auto_7696 ) ( ON ?auto_7697 ?auto_7696 ) ( not ( = ?auto_7696 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7695 ) ) ( not ( = ?auto_7694 ?auto_7696 ) ) ( not ( = ?auto_7698 ?auto_7696 ) ) ( ON ?auto_7695 ?auto_7694 ) ( CLEAR ?auto_7695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7698 ?auto_7694 )
      ( MAKE-2PILE ?auto_7694 ?auto_7695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7699 - BLOCK
      ?auto_7700 - BLOCK
    )
    :vars
    (
      ?auto_7703 - BLOCK
      ?auto_7701 - BLOCK
      ?auto_7702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7699 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( ON ?auto_7699 ?auto_7701 ) ( not ( = ?auto_7699 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7703 ?auto_7701 ) ) ( ON-TABLE ?auto_7702 ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( not ( = ?auto_7702 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( ON ?auto_7700 ?auto_7699 ) ( CLEAR ?auto_7700 ) ( ON-TABLE ?auto_7701 ) ( HOLDING ?auto_7703 ) ( CLEAR ?auto_7702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7702 ?auto_7703 )
      ( MAKE-2PILE ?auto_7699 ?auto_7700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7704 - BLOCK
      ?auto_7705 - BLOCK
    )
    :vars
    (
      ?auto_7706 - BLOCK
      ?auto_7708 - BLOCK
      ?auto_7707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7704 ?auto_7705 ) ) ( not ( = ?auto_7704 ?auto_7706 ) ) ( not ( = ?auto_7705 ?auto_7706 ) ) ( ON ?auto_7704 ?auto_7708 ) ( not ( = ?auto_7704 ?auto_7708 ) ) ( not ( = ?auto_7705 ?auto_7708 ) ) ( not ( = ?auto_7706 ?auto_7708 ) ) ( ON-TABLE ?auto_7707 ) ( not ( = ?auto_7707 ?auto_7706 ) ) ( not ( = ?auto_7707 ?auto_7705 ) ) ( not ( = ?auto_7704 ?auto_7707 ) ) ( not ( = ?auto_7708 ?auto_7707 ) ) ( ON ?auto_7705 ?auto_7704 ) ( ON-TABLE ?auto_7708 ) ( CLEAR ?auto_7707 ) ( ON ?auto_7706 ?auto_7705 ) ( CLEAR ?auto_7706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7708 ?auto_7704 ?auto_7705 )
      ( MAKE-2PILE ?auto_7704 ?auto_7705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7709 - BLOCK
      ?auto_7710 - BLOCK
    )
    :vars
    (
      ?auto_7712 - BLOCK
      ?auto_7711 - BLOCK
      ?auto_7713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7709 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7712 ) ) ( ON ?auto_7709 ?auto_7711 ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( not ( = ?auto_7712 ?auto_7711 ) ) ( not ( = ?auto_7713 ?auto_7712 ) ) ( not ( = ?auto_7713 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7713 ) ) ( not ( = ?auto_7711 ?auto_7713 ) ) ( ON ?auto_7710 ?auto_7709 ) ( ON-TABLE ?auto_7711 ) ( ON ?auto_7712 ?auto_7710 ) ( CLEAR ?auto_7712 ) ( HOLDING ?auto_7713 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7713 )
      ( MAKE-2PILE ?auto_7709 ?auto_7710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7714 - BLOCK
      ?auto_7715 - BLOCK
    )
    :vars
    (
      ?auto_7717 - BLOCK
      ?auto_7718 - BLOCK
      ?auto_7716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7714 ?auto_7715 ) ) ( not ( = ?auto_7714 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( ON ?auto_7714 ?auto_7718 ) ( not ( = ?auto_7714 ?auto_7718 ) ) ( not ( = ?auto_7715 ?auto_7718 ) ) ( not ( = ?auto_7717 ?auto_7718 ) ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7716 ?auto_7715 ) ) ( not ( = ?auto_7714 ?auto_7716 ) ) ( not ( = ?auto_7718 ?auto_7716 ) ) ( ON ?auto_7715 ?auto_7714 ) ( ON-TABLE ?auto_7718 ) ( ON ?auto_7717 ?auto_7715 ) ( ON ?auto_7716 ?auto_7717 ) ( CLEAR ?auto_7716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7718 ?auto_7714 ?auto_7715 ?auto_7717 )
      ( MAKE-2PILE ?auto_7714 ?auto_7715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7730 - BLOCK
    )
    :vars
    (
      ?auto_7733 - BLOCK
      ?auto_7731 - BLOCK
      ?auto_7732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7733 ?auto_7730 ) ( ON-TABLE ?auto_7730 ) ( not ( = ?auto_7730 ?auto_7733 ) ) ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7732 ) ) ( not ( = ?auto_7733 ?auto_7731 ) ) ( not ( = ?auto_7733 ?auto_7732 ) ) ( not ( = ?auto_7731 ?auto_7732 ) ) ( ON ?auto_7731 ?auto_7733 ) ( CLEAR ?auto_7731 ) ( HOLDING ?auto_7732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7732 )
      ( MAKE-1PILE ?auto_7730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7763 - BLOCK
      ?auto_7764 - BLOCK
      ?auto_7765 - BLOCK
    )
    :vars
    (
      ?auto_7766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7763 ) ( not ( = ?auto_7763 ?auto_7764 ) ) ( not ( = ?auto_7763 ?auto_7765 ) ) ( not ( = ?auto_7764 ?auto_7765 ) ) ( ON ?auto_7765 ?auto_7766 ) ( not ( = ?auto_7763 ?auto_7766 ) ) ( not ( = ?auto_7764 ?auto_7766 ) ) ( not ( = ?auto_7765 ?auto_7766 ) ) ( CLEAR ?auto_7763 ) ( ON ?auto_7764 ?auto_7765 ) ( CLEAR ?auto_7764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7766 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7766 ?auto_7765 )
      ( MAKE-3PILE ?auto_7763 ?auto_7764 ?auto_7765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7767 - BLOCK
      ?auto_7768 - BLOCK
      ?auto_7769 - BLOCK
    )
    :vars
    (
      ?auto_7770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( ON ?auto_7769 ?auto_7770 ) ( not ( = ?auto_7767 ?auto_7770 ) ) ( not ( = ?auto_7768 ?auto_7770 ) ) ( not ( = ?auto_7769 ?auto_7770 ) ) ( ON ?auto_7768 ?auto_7769 ) ( CLEAR ?auto_7768 ) ( ON-TABLE ?auto_7770 ) ( HOLDING ?auto_7767 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7767 )
      ( MAKE-3PILE ?auto_7767 ?auto_7768 ?auto_7769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7771 - BLOCK
      ?auto_7772 - BLOCK
      ?auto_7773 - BLOCK
    )
    :vars
    (
      ?auto_7774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7771 ?auto_7772 ) ) ( not ( = ?auto_7771 ?auto_7773 ) ) ( not ( = ?auto_7772 ?auto_7773 ) ) ( ON ?auto_7773 ?auto_7774 ) ( not ( = ?auto_7771 ?auto_7774 ) ) ( not ( = ?auto_7772 ?auto_7774 ) ) ( not ( = ?auto_7773 ?auto_7774 ) ) ( ON ?auto_7772 ?auto_7773 ) ( ON-TABLE ?auto_7774 ) ( ON ?auto_7771 ?auto_7772 ) ( CLEAR ?auto_7771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7774 ?auto_7773 ?auto_7772 )
      ( MAKE-3PILE ?auto_7771 ?auto_7772 ?auto_7773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7778 - BLOCK
      ?auto_7779 - BLOCK
      ?auto_7780 - BLOCK
    )
    :vars
    (
      ?auto_7781 - BLOCK
      ?auto_7782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7778 ?auto_7779 ) ) ( not ( = ?auto_7778 ?auto_7780 ) ) ( not ( = ?auto_7779 ?auto_7780 ) ) ( ON ?auto_7780 ?auto_7781 ) ( not ( = ?auto_7778 ?auto_7781 ) ) ( not ( = ?auto_7779 ?auto_7781 ) ) ( not ( = ?auto_7780 ?auto_7781 ) ) ( ON ?auto_7779 ?auto_7780 ) ( CLEAR ?auto_7779 ) ( ON-TABLE ?auto_7781 ) ( ON ?auto_7778 ?auto_7782 ) ( CLEAR ?auto_7778 ) ( HAND-EMPTY ) ( not ( = ?auto_7778 ?auto_7782 ) ) ( not ( = ?auto_7779 ?auto_7782 ) ) ( not ( = ?auto_7780 ?auto_7782 ) ) ( not ( = ?auto_7781 ?auto_7782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7778 ?auto_7782 )
      ( MAKE-3PILE ?auto_7778 ?auto_7779 ?auto_7780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7783 - BLOCK
      ?auto_7784 - BLOCK
      ?auto_7785 - BLOCK
    )
    :vars
    (
      ?auto_7787 - BLOCK
      ?auto_7786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7783 ?auto_7784 ) ) ( not ( = ?auto_7783 ?auto_7785 ) ) ( not ( = ?auto_7784 ?auto_7785 ) ) ( ON ?auto_7785 ?auto_7787 ) ( not ( = ?auto_7783 ?auto_7787 ) ) ( not ( = ?auto_7784 ?auto_7787 ) ) ( not ( = ?auto_7785 ?auto_7787 ) ) ( ON-TABLE ?auto_7787 ) ( ON ?auto_7783 ?auto_7786 ) ( CLEAR ?auto_7783 ) ( not ( = ?auto_7783 ?auto_7786 ) ) ( not ( = ?auto_7784 ?auto_7786 ) ) ( not ( = ?auto_7785 ?auto_7786 ) ) ( not ( = ?auto_7787 ?auto_7786 ) ) ( HOLDING ?auto_7784 ) ( CLEAR ?auto_7785 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7787 ?auto_7785 ?auto_7784 )
      ( MAKE-3PILE ?auto_7783 ?auto_7784 ?auto_7785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7788 - BLOCK
      ?auto_7789 - BLOCK
      ?auto_7790 - BLOCK
    )
    :vars
    (
      ?auto_7792 - BLOCK
      ?auto_7791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7788 ?auto_7789 ) ) ( not ( = ?auto_7788 ?auto_7790 ) ) ( not ( = ?auto_7789 ?auto_7790 ) ) ( ON ?auto_7790 ?auto_7792 ) ( not ( = ?auto_7788 ?auto_7792 ) ) ( not ( = ?auto_7789 ?auto_7792 ) ) ( not ( = ?auto_7790 ?auto_7792 ) ) ( ON-TABLE ?auto_7792 ) ( ON ?auto_7788 ?auto_7791 ) ( not ( = ?auto_7788 ?auto_7791 ) ) ( not ( = ?auto_7789 ?auto_7791 ) ) ( not ( = ?auto_7790 ?auto_7791 ) ) ( not ( = ?auto_7792 ?auto_7791 ) ) ( CLEAR ?auto_7790 ) ( ON ?auto_7789 ?auto_7788 ) ( CLEAR ?auto_7789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7791 ?auto_7788 )
      ( MAKE-3PILE ?auto_7788 ?auto_7789 ?auto_7790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7793 - BLOCK
      ?auto_7794 - BLOCK
      ?auto_7795 - BLOCK
    )
    :vars
    (
      ?auto_7796 - BLOCK
      ?auto_7797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7793 ?auto_7794 ) ) ( not ( = ?auto_7793 ?auto_7795 ) ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( ON-TABLE ?auto_7796 ) ( ON ?auto_7793 ?auto_7797 ) ( not ( = ?auto_7793 ?auto_7797 ) ) ( not ( = ?auto_7794 ?auto_7797 ) ) ( not ( = ?auto_7795 ?auto_7797 ) ) ( not ( = ?auto_7796 ?auto_7797 ) ) ( ON ?auto_7794 ?auto_7793 ) ( CLEAR ?auto_7794 ) ( ON-TABLE ?auto_7797 ) ( HOLDING ?auto_7795 ) ( CLEAR ?auto_7796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7796 ?auto_7795 )
      ( MAKE-3PILE ?auto_7793 ?auto_7794 ?auto_7795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7798 - BLOCK
      ?auto_7799 - BLOCK
      ?auto_7800 - BLOCK
    )
    :vars
    (
      ?auto_7801 - BLOCK
      ?auto_7802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7798 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7800 ) ) ( not ( = ?auto_7799 ?auto_7800 ) ) ( not ( = ?auto_7798 ?auto_7801 ) ) ( not ( = ?auto_7799 ?auto_7801 ) ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( ON-TABLE ?auto_7801 ) ( ON ?auto_7798 ?auto_7802 ) ( not ( = ?auto_7798 ?auto_7802 ) ) ( not ( = ?auto_7799 ?auto_7802 ) ) ( not ( = ?auto_7800 ?auto_7802 ) ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( ON ?auto_7799 ?auto_7798 ) ( ON-TABLE ?auto_7802 ) ( CLEAR ?auto_7801 ) ( ON ?auto_7800 ?auto_7799 ) ( CLEAR ?auto_7800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7802 ?auto_7798 ?auto_7799 )
      ( MAKE-3PILE ?auto_7798 ?auto_7799 ?auto_7800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7803 - BLOCK
      ?auto_7804 - BLOCK
      ?auto_7805 - BLOCK
    )
    :vars
    (
      ?auto_7806 - BLOCK
      ?auto_7807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7803 ?auto_7804 ) ) ( not ( = ?auto_7803 ?auto_7805 ) ) ( not ( = ?auto_7804 ?auto_7805 ) ) ( not ( = ?auto_7803 ?auto_7806 ) ) ( not ( = ?auto_7804 ?auto_7806 ) ) ( not ( = ?auto_7805 ?auto_7806 ) ) ( ON ?auto_7803 ?auto_7807 ) ( not ( = ?auto_7803 ?auto_7807 ) ) ( not ( = ?auto_7804 ?auto_7807 ) ) ( not ( = ?auto_7805 ?auto_7807 ) ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( ON ?auto_7804 ?auto_7803 ) ( ON-TABLE ?auto_7807 ) ( ON ?auto_7805 ?auto_7804 ) ( CLEAR ?auto_7805 ) ( HOLDING ?auto_7806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7806 )
      ( MAKE-3PILE ?auto_7803 ?auto_7804 ?auto_7805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7808 - BLOCK
      ?auto_7809 - BLOCK
      ?auto_7810 - BLOCK
    )
    :vars
    (
      ?auto_7811 - BLOCK
      ?auto_7812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) ( not ( = ?auto_7809 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( ON ?auto_7808 ?auto_7812 ) ( not ( = ?auto_7808 ?auto_7812 ) ) ( not ( = ?auto_7809 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( not ( = ?auto_7811 ?auto_7812 ) ) ( ON ?auto_7809 ?auto_7808 ) ( ON-TABLE ?auto_7812 ) ( ON ?auto_7810 ?auto_7809 ) ( ON ?auto_7811 ?auto_7810 ) ( CLEAR ?auto_7811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7812 ?auto_7808 ?auto_7809 ?auto_7810 )
      ( MAKE-3PILE ?auto_7808 ?auto_7809 ?auto_7810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7821 - BLOCK
      ?auto_7822 - BLOCK
      ?auto_7823 - BLOCK
      ?auto_7824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7823 ) ( ON-TABLE ?auto_7821 ) ( ON ?auto_7822 ?auto_7821 ) ( ON ?auto_7823 ?auto_7822 ) ( not ( = ?auto_7821 ?auto_7822 ) ) ( not ( = ?auto_7821 ?auto_7823 ) ) ( not ( = ?auto_7821 ?auto_7824 ) ) ( not ( = ?auto_7822 ?auto_7823 ) ) ( not ( = ?auto_7822 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( ON-TABLE ?auto_7824 ) ( CLEAR ?auto_7824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_7824 )
      ( MAKE-4PILE ?auto_7821 ?auto_7822 ?auto_7823 ?auto_7824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7825 - BLOCK
      ?auto_7826 - BLOCK
      ?auto_7827 - BLOCK
      ?auto_7828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7825 ) ( ON ?auto_7826 ?auto_7825 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( not ( = ?auto_7825 ?auto_7827 ) ) ( not ( = ?auto_7825 ?auto_7828 ) ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7828 ) ) ( not ( = ?auto_7827 ?auto_7828 ) ) ( ON-TABLE ?auto_7828 ) ( CLEAR ?auto_7828 ) ( HOLDING ?auto_7827 ) ( CLEAR ?auto_7826 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7825 ?auto_7826 ?auto_7827 )
      ( MAKE-4PILE ?auto_7825 ?auto_7826 ?auto_7827 ?auto_7828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7829 - BLOCK
      ?auto_7830 - BLOCK
      ?auto_7831 - BLOCK
      ?auto_7832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7829 ) ( ON ?auto_7830 ?auto_7829 ) ( not ( = ?auto_7829 ?auto_7830 ) ) ( not ( = ?auto_7829 ?auto_7831 ) ) ( not ( = ?auto_7829 ?auto_7832 ) ) ( not ( = ?auto_7830 ?auto_7831 ) ) ( not ( = ?auto_7830 ?auto_7832 ) ) ( not ( = ?auto_7831 ?auto_7832 ) ) ( ON-TABLE ?auto_7832 ) ( CLEAR ?auto_7830 ) ( ON ?auto_7831 ?auto_7832 ) ( CLEAR ?auto_7831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7832 )
      ( MAKE-4PILE ?auto_7829 ?auto_7830 ?auto_7831 ?auto_7832 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7833 - BLOCK
      ?auto_7834 - BLOCK
      ?auto_7835 - BLOCK
      ?auto_7836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7833 ) ( not ( = ?auto_7833 ?auto_7834 ) ) ( not ( = ?auto_7833 ?auto_7835 ) ) ( not ( = ?auto_7833 ?auto_7836 ) ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( ON-TABLE ?auto_7836 ) ( ON ?auto_7835 ?auto_7836 ) ( CLEAR ?auto_7835 ) ( HOLDING ?auto_7834 ) ( CLEAR ?auto_7833 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7833 ?auto_7834 )
      ( MAKE-4PILE ?auto_7833 ?auto_7834 ?auto_7835 ?auto_7836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7837 - BLOCK
      ?auto_7838 - BLOCK
      ?auto_7839 - BLOCK
      ?auto_7840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7837 ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( not ( = ?auto_7837 ?auto_7839 ) ) ( not ( = ?auto_7837 ?auto_7840 ) ) ( not ( = ?auto_7838 ?auto_7839 ) ) ( not ( = ?auto_7838 ?auto_7840 ) ) ( not ( = ?auto_7839 ?auto_7840 ) ) ( ON-TABLE ?auto_7840 ) ( ON ?auto_7839 ?auto_7840 ) ( CLEAR ?auto_7837 ) ( ON ?auto_7838 ?auto_7839 ) ( CLEAR ?auto_7838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7840 ?auto_7839 )
      ( MAKE-4PILE ?auto_7837 ?auto_7838 ?auto_7839 ?auto_7840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7841 - BLOCK
      ?auto_7842 - BLOCK
      ?auto_7843 - BLOCK
      ?auto_7844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7841 ?auto_7842 ) ) ( not ( = ?auto_7841 ?auto_7843 ) ) ( not ( = ?auto_7841 ?auto_7844 ) ) ( not ( = ?auto_7842 ?auto_7843 ) ) ( not ( = ?auto_7842 ?auto_7844 ) ) ( not ( = ?auto_7843 ?auto_7844 ) ) ( ON-TABLE ?auto_7844 ) ( ON ?auto_7843 ?auto_7844 ) ( ON ?auto_7842 ?auto_7843 ) ( CLEAR ?auto_7842 ) ( HOLDING ?auto_7841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7841 )
      ( MAKE-4PILE ?auto_7841 ?auto_7842 ?auto_7843 ?auto_7844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7845 - BLOCK
      ?auto_7846 - BLOCK
      ?auto_7847 - BLOCK
      ?auto_7848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7845 ?auto_7846 ) ) ( not ( = ?auto_7845 ?auto_7847 ) ) ( not ( = ?auto_7845 ?auto_7848 ) ) ( not ( = ?auto_7846 ?auto_7847 ) ) ( not ( = ?auto_7846 ?auto_7848 ) ) ( not ( = ?auto_7847 ?auto_7848 ) ) ( ON-TABLE ?auto_7848 ) ( ON ?auto_7847 ?auto_7848 ) ( ON ?auto_7846 ?auto_7847 ) ( ON ?auto_7845 ?auto_7846 ) ( CLEAR ?auto_7845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7848 ?auto_7847 ?auto_7846 )
      ( MAKE-4PILE ?auto_7845 ?auto_7846 ?auto_7847 ?auto_7848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7853 - BLOCK
      ?auto_7854 - BLOCK
      ?auto_7855 - BLOCK
      ?auto_7856 - BLOCK
    )
    :vars
    (
      ?auto_7857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7853 ?auto_7854 ) ) ( not ( = ?auto_7853 ?auto_7855 ) ) ( not ( = ?auto_7853 ?auto_7856 ) ) ( not ( = ?auto_7854 ?auto_7855 ) ) ( not ( = ?auto_7854 ?auto_7856 ) ) ( not ( = ?auto_7855 ?auto_7856 ) ) ( ON-TABLE ?auto_7856 ) ( ON ?auto_7855 ?auto_7856 ) ( ON ?auto_7854 ?auto_7855 ) ( CLEAR ?auto_7854 ) ( ON ?auto_7853 ?auto_7857 ) ( CLEAR ?auto_7853 ) ( HAND-EMPTY ) ( not ( = ?auto_7853 ?auto_7857 ) ) ( not ( = ?auto_7854 ?auto_7857 ) ) ( not ( = ?auto_7855 ?auto_7857 ) ) ( not ( = ?auto_7856 ?auto_7857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7853 ?auto_7857 )
      ( MAKE-4PILE ?auto_7853 ?auto_7854 ?auto_7855 ?auto_7856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7858 - BLOCK
      ?auto_7859 - BLOCK
      ?auto_7860 - BLOCK
      ?auto_7861 - BLOCK
    )
    :vars
    (
      ?auto_7862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7858 ?auto_7859 ) ) ( not ( = ?auto_7858 ?auto_7860 ) ) ( not ( = ?auto_7858 ?auto_7861 ) ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( not ( = ?auto_7859 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( ON-TABLE ?auto_7861 ) ( ON ?auto_7860 ?auto_7861 ) ( ON ?auto_7858 ?auto_7862 ) ( CLEAR ?auto_7858 ) ( not ( = ?auto_7858 ?auto_7862 ) ) ( not ( = ?auto_7859 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( HOLDING ?auto_7859 ) ( CLEAR ?auto_7860 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7861 ?auto_7860 ?auto_7859 )
      ( MAKE-4PILE ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7863 - BLOCK
      ?auto_7864 - BLOCK
      ?auto_7865 - BLOCK
      ?auto_7866 - BLOCK
    )
    :vars
    (
      ?auto_7867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) ( not ( = ?auto_7863 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( ON-TABLE ?auto_7866 ) ( ON ?auto_7865 ?auto_7866 ) ( ON ?auto_7863 ?auto_7867 ) ( not ( = ?auto_7863 ?auto_7867 ) ) ( not ( = ?auto_7864 ?auto_7867 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7866 ?auto_7867 ) ) ( CLEAR ?auto_7865 ) ( ON ?auto_7864 ?auto_7863 ) ( CLEAR ?auto_7864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7867 ?auto_7863 )
      ( MAKE-4PILE ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7868 - BLOCK
      ?auto_7869 - BLOCK
      ?auto_7870 - BLOCK
      ?auto_7871 - BLOCK
    )
    :vars
    (
      ?auto_7872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7868 ?auto_7869 ) ) ( not ( = ?auto_7868 ?auto_7870 ) ) ( not ( = ?auto_7868 ?auto_7871 ) ) ( not ( = ?auto_7869 ?auto_7870 ) ) ( not ( = ?auto_7869 ?auto_7871 ) ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( ON-TABLE ?auto_7871 ) ( ON ?auto_7868 ?auto_7872 ) ( not ( = ?auto_7868 ?auto_7872 ) ) ( not ( = ?auto_7869 ?auto_7872 ) ) ( not ( = ?auto_7870 ?auto_7872 ) ) ( not ( = ?auto_7871 ?auto_7872 ) ) ( ON ?auto_7869 ?auto_7868 ) ( CLEAR ?auto_7869 ) ( ON-TABLE ?auto_7872 ) ( HOLDING ?auto_7870 ) ( CLEAR ?auto_7871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7871 ?auto_7870 )
      ( MAKE-4PILE ?auto_7868 ?auto_7869 ?auto_7870 ?auto_7871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7873 - BLOCK
      ?auto_7874 - BLOCK
      ?auto_7875 - BLOCK
      ?auto_7876 - BLOCK
    )
    :vars
    (
      ?auto_7877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7873 ?auto_7874 ) ) ( not ( = ?auto_7873 ?auto_7875 ) ) ( not ( = ?auto_7873 ?auto_7876 ) ) ( not ( = ?auto_7874 ?auto_7875 ) ) ( not ( = ?auto_7874 ?auto_7876 ) ) ( not ( = ?auto_7875 ?auto_7876 ) ) ( ON-TABLE ?auto_7876 ) ( ON ?auto_7873 ?auto_7877 ) ( not ( = ?auto_7873 ?auto_7877 ) ) ( not ( = ?auto_7874 ?auto_7877 ) ) ( not ( = ?auto_7875 ?auto_7877 ) ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( ON ?auto_7874 ?auto_7873 ) ( ON-TABLE ?auto_7877 ) ( CLEAR ?auto_7876 ) ( ON ?auto_7875 ?auto_7874 ) ( CLEAR ?auto_7875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7877 ?auto_7873 ?auto_7874 )
      ( MAKE-4PILE ?auto_7873 ?auto_7874 ?auto_7875 ?auto_7876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7878 - BLOCK
      ?auto_7879 - BLOCK
      ?auto_7880 - BLOCK
      ?auto_7881 - BLOCK
    )
    :vars
    (
      ?auto_7882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7878 ?auto_7879 ) ) ( not ( = ?auto_7878 ?auto_7880 ) ) ( not ( = ?auto_7878 ?auto_7881 ) ) ( not ( = ?auto_7879 ?auto_7880 ) ) ( not ( = ?auto_7879 ?auto_7881 ) ) ( not ( = ?auto_7880 ?auto_7881 ) ) ( ON ?auto_7878 ?auto_7882 ) ( not ( = ?auto_7878 ?auto_7882 ) ) ( not ( = ?auto_7879 ?auto_7882 ) ) ( not ( = ?auto_7880 ?auto_7882 ) ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( ON ?auto_7879 ?auto_7878 ) ( ON-TABLE ?auto_7882 ) ( ON ?auto_7880 ?auto_7879 ) ( CLEAR ?auto_7880 ) ( HOLDING ?auto_7881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7881 )
      ( MAKE-4PILE ?auto_7878 ?auto_7879 ?auto_7880 ?auto_7881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7883 - BLOCK
      ?auto_7884 - BLOCK
      ?auto_7885 - BLOCK
      ?auto_7886 - BLOCK
    )
    :vars
    (
      ?auto_7887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7883 ?auto_7884 ) ) ( not ( = ?auto_7883 ?auto_7885 ) ) ( not ( = ?auto_7883 ?auto_7886 ) ) ( not ( = ?auto_7884 ?auto_7885 ) ) ( not ( = ?auto_7884 ?auto_7886 ) ) ( not ( = ?auto_7885 ?auto_7886 ) ) ( ON ?auto_7883 ?auto_7887 ) ( not ( = ?auto_7883 ?auto_7887 ) ) ( not ( = ?auto_7884 ?auto_7887 ) ) ( not ( = ?auto_7885 ?auto_7887 ) ) ( not ( = ?auto_7886 ?auto_7887 ) ) ( ON ?auto_7884 ?auto_7883 ) ( ON-TABLE ?auto_7887 ) ( ON ?auto_7885 ?auto_7884 ) ( ON ?auto_7886 ?auto_7885 ) ( CLEAR ?auto_7886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7887 ?auto_7883 ?auto_7884 ?auto_7885 )
      ( MAKE-4PILE ?auto_7883 ?auto_7884 ?auto_7885 ?auto_7886 ) )
  )

)

