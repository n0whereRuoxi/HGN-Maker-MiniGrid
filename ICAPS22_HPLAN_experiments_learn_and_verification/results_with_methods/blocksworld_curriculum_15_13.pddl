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
      ?auto_428429 - BLOCK
    )
    :vars
    (
      ?auto_428430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428429 ?auto_428430 ) ( CLEAR ?auto_428429 ) ( HAND-EMPTY ) ( not ( = ?auto_428429 ?auto_428430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428429 ?auto_428430 )
      ( !PUTDOWN ?auto_428429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_428432 - BLOCK
    )
    :vars
    (
      ?auto_428433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428432 ?auto_428433 ) ( CLEAR ?auto_428432 ) ( HAND-EMPTY ) ( not ( = ?auto_428432 ?auto_428433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428432 ?auto_428433 )
      ( !PUTDOWN ?auto_428432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428436 - BLOCK
      ?auto_428437 - BLOCK
    )
    :vars
    (
      ?auto_428438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428436 ) ( ON ?auto_428437 ?auto_428438 ) ( CLEAR ?auto_428437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428436 ) ( not ( = ?auto_428436 ?auto_428437 ) ) ( not ( = ?auto_428436 ?auto_428438 ) ) ( not ( = ?auto_428437 ?auto_428438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428437 ?auto_428438 )
      ( !STACK ?auto_428437 ?auto_428436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428441 - BLOCK
      ?auto_428442 - BLOCK
    )
    :vars
    (
      ?auto_428443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428441 ) ( ON ?auto_428442 ?auto_428443 ) ( CLEAR ?auto_428442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428441 ) ( not ( = ?auto_428441 ?auto_428442 ) ) ( not ( = ?auto_428441 ?auto_428443 ) ) ( not ( = ?auto_428442 ?auto_428443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428442 ?auto_428443 )
      ( !STACK ?auto_428442 ?auto_428441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428446 - BLOCK
      ?auto_428447 - BLOCK
    )
    :vars
    (
      ?auto_428448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428447 ?auto_428448 ) ( not ( = ?auto_428446 ?auto_428447 ) ) ( not ( = ?auto_428446 ?auto_428448 ) ) ( not ( = ?auto_428447 ?auto_428448 ) ) ( ON ?auto_428446 ?auto_428447 ) ( CLEAR ?auto_428446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428446 )
      ( MAKE-2PILE ?auto_428446 ?auto_428447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428451 - BLOCK
      ?auto_428452 - BLOCK
    )
    :vars
    (
      ?auto_428453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428452 ?auto_428453 ) ( not ( = ?auto_428451 ?auto_428452 ) ) ( not ( = ?auto_428451 ?auto_428453 ) ) ( not ( = ?auto_428452 ?auto_428453 ) ) ( ON ?auto_428451 ?auto_428452 ) ( CLEAR ?auto_428451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428451 )
      ( MAKE-2PILE ?auto_428451 ?auto_428452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428457 - BLOCK
      ?auto_428458 - BLOCK
      ?auto_428459 - BLOCK
    )
    :vars
    (
      ?auto_428460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428458 ) ( ON ?auto_428459 ?auto_428460 ) ( CLEAR ?auto_428459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428457 ) ( ON ?auto_428458 ?auto_428457 ) ( not ( = ?auto_428457 ?auto_428458 ) ) ( not ( = ?auto_428457 ?auto_428459 ) ) ( not ( = ?auto_428457 ?auto_428460 ) ) ( not ( = ?auto_428458 ?auto_428459 ) ) ( not ( = ?auto_428458 ?auto_428460 ) ) ( not ( = ?auto_428459 ?auto_428460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428459 ?auto_428460 )
      ( !STACK ?auto_428459 ?auto_428458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428464 - BLOCK
      ?auto_428465 - BLOCK
      ?auto_428466 - BLOCK
    )
    :vars
    (
      ?auto_428467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428465 ) ( ON ?auto_428466 ?auto_428467 ) ( CLEAR ?auto_428466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428464 ) ( ON ?auto_428465 ?auto_428464 ) ( not ( = ?auto_428464 ?auto_428465 ) ) ( not ( = ?auto_428464 ?auto_428466 ) ) ( not ( = ?auto_428464 ?auto_428467 ) ) ( not ( = ?auto_428465 ?auto_428466 ) ) ( not ( = ?auto_428465 ?auto_428467 ) ) ( not ( = ?auto_428466 ?auto_428467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428466 ?auto_428467 )
      ( !STACK ?auto_428466 ?auto_428465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428471 - BLOCK
      ?auto_428472 - BLOCK
      ?auto_428473 - BLOCK
    )
    :vars
    (
      ?auto_428474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428473 ?auto_428474 ) ( ON-TABLE ?auto_428471 ) ( not ( = ?auto_428471 ?auto_428472 ) ) ( not ( = ?auto_428471 ?auto_428473 ) ) ( not ( = ?auto_428471 ?auto_428474 ) ) ( not ( = ?auto_428472 ?auto_428473 ) ) ( not ( = ?auto_428472 ?auto_428474 ) ) ( not ( = ?auto_428473 ?auto_428474 ) ) ( CLEAR ?auto_428471 ) ( ON ?auto_428472 ?auto_428473 ) ( CLEAR ?auto_428472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428471 ?auto_428472 )
      ( MAKE-3PILE ?auto_428471 ?auto_428472 ?auto_428473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428478 - BLOCK
      ?auto_428479 - BLOCK
      ?auto_428480 - BLOCK
    )
    :vars
    (
      ?auto_428481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428480 ?auto_428481 ) ( ON-TABLE ?auto_428478 ) ( not ( = ?auto_428478 ?auto_428479 ) ) ( not ( = ?auto_428478 ?auto_428480 ) ) ( not ( = ?auto_428478 ?auto_428481 ) ) ( not ( = ?auto_428479 ?auto_428480 ) ) ( not ( = ?auto_428479 ?auto_428481 ) ) ( not ( = ?auto_428480 ?auto_428481 ) ) ( CLEAR ?auto_428478 ) ( ON ?auto_428479 ?auto_428480 ) ( CLEAR ?auto_428479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428478 ?auto_428479 )
      ( MAKE-3PILE ?auto_428478 ?auto_428479 ?auto_428480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428485 - BLOCK
      ?auto_428486 - BLOCK
      ?auto_428487 - BLOCK
    )
    :vars
    (
      ?auto_428488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428487 ?auto_428488 ) ( not ( = ?auto_428485 ?auto_428486 ) ) ( not ( = ?auto_428485 ?auto_428487 ) ) ( not ( = ?auto_428485 ?auto_428488 ) ) ( not ( = ?auto_428486 ?auto_428487 ) ) ( not ( = ?auto_428486 ?auto_428488 ) ) ( not ( = ?auto_428487 ?auto_428488 ) ) ( ON ?auto_428486 ?auto_428487 ) ( ON ?auto_428485 ?auto_428486 ) ( CLEAR ?auto_428485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428485 )
      ( MAKE-3PILE ?auto_428485 ?auto_428486 ?auto_428487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428492 - BLOCK
      ?auto_428493 - BLOCK
      ?auto_428494 - BLOCK
    )
    :vars
    (
      ?auto_428495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428494 ?auto_428495 ) ( not ( = ?auto_428492 ?auto_428493 ) ) ( not ( = ?auto_428492 ?auto_428494 ) ) ( not ( = ?auto_428492 ?auto_428495 ) ) ( not ( = ?auto_428493 ?auto_428494 ) ) ( not ( = ?auto_428493 ?auto_428495 ) ) ( not ( = ?auto_428494 ?auto_428495 ) ) ( ON ?auto_428493 ?auto_428494 ) ( ON ?auto_428492 ?auto_428493 ) ( CLEAR ?auto_428492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428492 )
      ( MAKE-3PILE ?auto_428492 ?auto_428493 ?auto_428494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428500 - BLOCK
      ?auto_428501 - BLOCK
      ?auto_428502 - BLOCK
      ?auto_428503 - BLOCK
    )
    :vars
    (
      ?auto_428504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428502 ) ( ON ?auto_428503 ?auto_428504 ) ( CLEAR ?auto_428503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428500 ) ( ON ?auto_428501 ?auto_428500 ) ( ON ?auto_428502 ?auto_428501 ) ( not ( = ?auto_428500 ?auto_428501 ) ) ( not ( = ?auto_428500 ?auto_428502 ) ) ( not ( = ?auto_428500 ?auto_428503 ) ) ( not ( = ?auto_428500 ?auto_428504 ) ) ( not ( = ?auto_428501 ?auto_428502 ) ) ( not ( = ?auto_428501 ?auto_428503 ) ) ( not ( = ?auto_428501 ?auto_428504 ) ) ( not ( = ?auto_428502 ?auto_428503 ) ) ( not ( = ?auto_428502 ?auto_428504 ) ) ( not ( = ?auto_428503 ?auto_428504 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428503 ?auto_428504 )
      ( !STACK ?auto_428503 ?auto_428502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428509 - BLOCK
      ?auto_428510 - BLOCK
      ?auto_428511 - BLOCK
      ?auto_428512 - BLOCK
    )
    :vars
    (
      ?auto_428513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428511 ) ( ON ?auto_428512 ?auto_428513 ) ( CLEAR ?auto_428512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428509 ) ( ON ?auto_428510 ?auto_428509 ) ( ON ?auto_428511 ?auto_428510 ) ( not ( = ?auto_428509 ?auto_428510 ) ) ( not ( = ?auto_428509 ?auto_428511 ) ) ( not ( = ?auto_428509 ?auto_428512 ) ) ( not ( = ?auto_428509 ?auto_428513 ) ) ( not ( = ?auto_428510 ?auto_428511 ) ) ( not ( = ?auto_428510 ?auto_428512 ) ) ( not ( = ?auto_428510 ?auto_428513 ) ) ( not ( = ?auto_428511 ?auto_428512 ) ) ( not ( = ?auto_428511 ?auto_428513 ) ) ( not ( = ?auto_428512 ?auto_428513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428512 ?auto_428513 )
      ( !STACK ?auto_428512 ?auto_428511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428518 - BLOCK
      ?auto_428519 - BLOCK
      ?auto_428520 - BLOCK
      ?auto_428521 - BLOCK
    )
    :vars
    (
      ?auto_428522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428521 ?auto_428522 ) ( ON-TABLE ?auto_428518 ) ( ON ?auto_428519 ?auto_428518 ) ( not ( = ?auto_428518 ?auto_428519 ) ) ( not ( = ?auto_428518 ?auto_428520 ) ) ( not ( = ?auto_428518 ?auto_428521 ) ) ( not ( = ?auto_428518 ?auto_428522 ) ) ( not ( = ?auto_428519 ?auto_428520 ) ) ( not ( = ?auto_428519 ?auto_428521 ) ) ( not ( = ?auto_428519 ?auto_428522 ) ) ( not ( = ?auto_428520 ?auto_428521 ) ) ( not ( = ?auto_428520 ?auto_428522 ) ) ( not ( = ?auto_428521 ?auto_428522 ) ) ( CLEAR ?auto_428519 ) ( ON ?auto_428520 ?auto_428521 ) ( CLEAR ?auto_428520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428518 ?auto_428519 ?auto_428520 )
      ( MAKE-4PILE ?auto_428518 ?auto_428519 ?auto_428520 ?auto_428521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428527 - BLOCK
      ?auto_428528 - BLOCK
      ?auto_428529 - BLOCK
      ?auto_428530 - BLOCK
    )
    :vars
    (
      ?auto_428531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428530 ?auto_428531 ) ( ON-TABLE ?auto_428527 ) ( ON ?auto_428528 ?auto_428527 ) ( not ( = ?auto_428527 ?auto_428528 ) ) ( not ( = ?auto_428527 ?auto_428529 ) ) ( not ( = ?auto_428527 ?auto_428530 ) ) ( not ( = ?auto_428527 ?auto_428531 ) ) ( not ( = ?auto_428528 ?auto_428529 ) ) ( not ( = ?auto_428528 ?auto_428530 ) ) ( not ( = ?auto_428528 ?auto_428531 ) ) ( not ( = ?auto_428529 ?auto_428530 ) ) ( not ( = ?auto_428529 ?auto_428531 ) ) ( not ( = ?auto_428530 ?auto_428531 ) ) ( CLEAR ?auto_428528 ) ( ON ?auto_428529 ?auto_428530 ) ( CLEAR ?auto_428529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428527 ?auto_428528 ?auto_428529 )
      ( MAKE-4PILE ?auto_428527 ?auto_428528 ?auto_428529 ?auto_428530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428536 - BLOCK
      ?auto_428537 - BLOCK
      ?auto_428538 - BLOCK
      ?auto_428539 - BLOCK
    )
    :vars
    (
      ?auto_428540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428539 ?auto_428540 ) ( ON-TABLE ?auto_428536 ) ( not ( = ?auto_428536 ?auto_428537 ) ) ( not ( = ?auto_428536 ?auto_428538 ) ) ( not ( = ?auto_428536 ?auto_428539 ) ) ( not ( = ?auto_428536 ?auto_428540 ) ) ( not ( = ?auto_428537 ?auto_428538 ) ) ( not ( = ?auto_428537 ?auto_428539 ) ) ( not ( = ?auto_428537 ?auto_428540 ) ) ( not ( = ?auto_428538 ?auto_428539 ) ) ( not ( = ?auto_428538 ?auto_428540 ) ) ( not ( = ?auto_428539 ?auto_428540 ) ) ( ON ?auto_428538 ?auto_428539 ) ( CLEAR ?auto_428536 ) ( ON ?auto_428537 ?auto_428538 ) ( CLEAR ?auto_428537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428536 ?auto_428537 )
      ( MAKE-4PILE ?auto_428536 ?auto_428537 ?auto_428538 ?auto_428539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428545 - BLOCK
      ?auto_428546 - BLOCK
      ?auto_428547 - BLOCK
      ?auto_428548 - BLOCK
    )
    :vars
    (
      ?auto_428549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428548 ?auto_428549 ) ( ON-TABLE ?auto_428545 ) ( not ( = ?auto_428545 ?auto_428546 ) ) ( not ( = ?auto_428545 ?auto_428547 ) ) ( not ( = ?auto_428545 ?auto_428548 ) ) ( not ( = ?auto_428545 ?auto_428549 ) ) ( not ( = ?auto_428546 ?auto_428547 ) ) ( not ( = ?auto_428546 ?auto_428548 ) ) ( not ( = ?auto_428546 ?auto_428549 ) ) ( not ( = ?auto_428547 ?auto_428548 ) ) ( not ( = ?auto_428547 ?auto_428549 ) ) ( not ( = ?auto_428548 ?auto_428549 ) ) ( ON ?auto_428547 ?auto_428548 ) ( CLEAR ?auto_428545 ) ( ON ?auto_428546 ?auto_428547 ) ( CLEAR ?auto_428546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428545 ?auto_428546 )
      ( MAKE-4PILE ?auto_428545 ?auto_428546 ?auto_428547 ?auto_428548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428554 - BLOCK
      ?auto_428555 - BLOCK
      ?auto_428556 - BLOCK
      ?auto_428557 - BLOCK
    )
    :vars
    (
      ?auto_428558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428557 ?auto_428558 ) ( not ( = ?auto_428554 ?auto_428555 ) ) ( not ( = ?auto_428554 ?auto_428556 ) ) ( not ( = ?auto_428554 ?auto_428557 ) ) ( not ( = ?auto_428554 ?auto_428558 ) ) ( not ( = ?auto_428555 ?auto_428556 ) ) ( not ( = ?auto_428555 ?auto_428557 ) ) ( not ( = ?auto_428555 ?auto_428558 ) ) ( not ( = ?auto_428556 ?auto_428557 ) ) ( not ( = ?auto_428556 ?auto_428558 ) ) ( not ( = ?auto_428557 ?auto_428558 ) ) ( ON ?auto_428556 ?auto_428557 ) ( ON ?auto_428555 ?auto_428556 ) ( ON ?auto_428554 ?auto_428555 ) ( CLEAR ?auto_428554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428554 )
      ( MAKE-4PILE ?auto_428554 ?auto_428555 ?auto_428556 ?auto_428557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428563 - BLOCK
      ?auto_428564 - BLOCK
      ?auto_428565 - BLOCK
      ?auto_428566 - BLOCK
    )
    :vars
    (
      ?auto_428567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428566 ?auto_428567 ) ( not ( = ?auto_428563 ?auto_428564 ) ) ( not ( = ?auto_428563 ?auto_428565 ) ) ( not ( = ?auto_428563 ?auto_428566 ) ) ( not ( = ?auto_428563 ?auto_428567 ) ) ( not ( = ?auto_428564 ?auto_428565 ) ) ( not ( = ?auto_428564 ?auto_428566 ) ) ( not ( = ?auto_428564 ?auto_428567 ) ) ( not ( = ?auto_428565 ?auto_428566 ) ) ( not ( = ?auto_428565 ?auto_428567 ) ) ( not ( = ?auto_428566 ?auto_428567 ) ) ( ON ?auto_428565 ?auto_428566 ) ( ON ?auto_428564 ?auto_428565 ) ( ON ?auto_428563 ?auto_428564 ) ( CLEAR ?auto_428563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428563 )
      ( MAKE-4PILE ?auto_428563 ?auto_428564 ?auto_428565 ?auto_428566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428573 - BLOCK
      ?auto_428574 - BLOCK
      ?auto_428575 - BLOCK
      ?auto_428576 - BLOCK
      ?auto_428577 - BLOCK
    )
    :vars
    (
      ?auto_428578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428576 ) ( ON ?auto_428577 ?auto_428578 ) ( CLEAR ?auto_428577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428573 ) ( ON ?auto_428574 ?auto_428573 ) ( ON ?auto_428575 ?auto_428574 ) ( ON ?auto_428576 ?auto_428575 ) ( not ( = ?auto_428573 ?auto_428574 ) ) ( not ( = ?auto_428573 ?auto_428575 ) ) ( not ( = ?auto_428573 ?auto_428576 ) ) ( not ( = ?auto_428573 ?auto_428577 ) ) ( not ( = ?auto_428573 ?auto_428578 ) ) ( not ( = ?auto_428574 ?auto_428575 ) ) ( not ( = ?auto_428574 ?auto_428576 ) ) ( not ( = ?auto_428574 ?auto_428577 ) ) ( not ( = ?auto_428574 ?auto_428578 ) ) ( not ( = ?auto_428575 ?auto_428576 ) ) ( not ( = ?auto_428575 ?auto_428577 ) ) ( not ( = ?auto_428575 ?auto_428578 ) ) ( not ( = ?auto_428576 ?auto_428577 ) ) ( not ( = ?auto_428576 ?auto_428578 ) ) ( not ( = ?auto_428577 ?auto_428578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428577 ?auto_428578 )
      ( !STACK ?auto_428577 ?auto_428576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428584 - BLOCK
      ?auto_428585 - BLOCK
      ?auto_428586 - BLOCK
      ?auto_428587 - BLOCK
      ?auto_428588 - BLOCK
    )
    :vars
    (
      ?auto_428589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428587 ) ( ON ?auto_428588 ?auto_428589 ) ( CLEAR ?auto_428588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428584 ) ( ON ?auto_428585 ?auto_428584 ) ( ON ?auto_428586 ?auto_428585 ) ( ON ?auto_428587 ?auto_428586 ) ( not ( = ?auto_428584 ?auto_428585 ) ) ( not ( = ?auto_428584 ?auto_428586 ) ) ( not ( = ?auto_428584 ?auto_428587 ) ) ( not ( = ?auto_428584 ?auto_428588 ) ) ( not ( = ?auto_428584 ?auto_428589 ) ) ( not ( = ?auto_428585 ?auto_428586 ) ) ( not ( = ?auto_428585 ?auto_428587 ) ) ( not ( = ?auto_428585 ?auto_428588 ) ) ( not ( = ?auto_428585 ?auto_428589 ) ) ( not ( = ?auto_428586 ?auto_428587 ) ) ( not ( = ?auto_428586 ?auto_428588 ) ) ( not ( = ?auto_428586 ?auto_428589 ) ) ( not ( = ?auto_428587 ?auto_428588 ) ) ( not ( = ?auto_428587 ?auto_428589 ) ) ( not ( = ?auto_428588 ?auto_428589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428588 ?auto_428589 )
      ( !STACK ?auto_428588 ?auto_428587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428595 - BLOCK
      ?auto_428596 - BLOCK
      ?auto_428597 - BLOCK
      ?auto_428598 - BLOCK
      ?auto_428599 - BLOCK
    )
    :vars
    (
      ?auto_428600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428599 ?auto_428600 ) ( ON-TABLE ?auto_428595 ) ( ON ?auto_428596 ?auto_428595 ) ( ON ?auto_428597 ?auto_428596 ) ( not ( = ?auto_428595 ?auto_428596 ) ) ( not ( = ?auto_428595 ?auto_428597 ) ) ( not ( = ?auto_428595 ?auto_428598 ) ) ( not ( = ?auto_428595 ?auto_428599 ) ) ( not ( = ?auto_428595 ?auto_428600 ) ) ( not ( = ?auto_428596 ?auto_428597 ) ) ( not ( = ?auto_428596 ?auto_428598 ) ) ( not ( = ?auto_428596 ?auto_428599 ) ) ( not ( = ?auto_428596 ?auto_428600 ) ) ( not ( = ?auto_428597 ?auto_428598 ) ) ( not ( = ?auto_428597 ?auto_428599 ) ) ( not ( = ?auto_428597 ?auto_428600 ) ) ( not ( = ?auto_428598 ?auto_428599 ) ) ( not ( = ?auto_428598 ?auto_428600 ) ) ( not ( = ?auto_428599 ?auto_428600 ) ) ( CLEAR ?auto_428597 ) ( ON ?auto_428598 ?auto_428599 ) ( CLEAR ?auto_428598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428595 ?auto_428596 ?auto_428597 ?auto_428598 )
      ( MAKE-5PILE ?auto_428595 ?auto_428596 ?auto_428597 ?auto_428598 ?auto_428599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428606 - BLOCK
      ?auto_428607 - BLOCK
      ?auto_428608 - BLOCK
      ?auto_428609 - BLOCK
      ?auto_428610 - BLOCK
    )
    :vars
    (
      ?auto_428611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428610 ?auto_428611 ) ( ON-TABLE ?auto_428606 ) ( ON ?auto_428607 ?auto_428606 ) ( ON ?auto_428608 ?auto_428607 ) ( not ( = ?auto_428606 ?auto_428607 ) ) ( not ( = ?auto_428606 ?auto_428608 ) ) ( not ( = ?auto_428606 ?auto_428609 ) ) ( not ( = ?auto_428606 ?auto_428610 ) ) ( not ( = ?auto_428606 ?auto_428611 ) ) ( not ( = ?auto_428607 ?auto_428608 ) ) ( not ( = ?auto_428607 ?auto_428609 ) ) ( not ( = ?auto_428607 ?auto_428610 ) ) ( not ( = ?auto_428607 ?auto_428611 ) ) ( not ( = ?auto_428608 ?auto_428609 ) ) ( not ( = ?auto_428608 ?auto_428610 ) ) ( not ( = ?auto_428608 ?auto_428611 ) ) ( not ( = ?auto_428609 ?auto_428610 ) ) ( not ( = ?auto_428609 ?auto_428611 ) ) ( not ( = ?auto_428610 ?auto_428611 ) ) ( CLEAR ?auto_428608 ) ( ON ?auto_428609 ?auto_428610 ) ( CLEAR ?auto_428609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428606 ?auto_428607 ?auto_428608 ?auto_428609 )
      ( MAKE-5PILE ?auto_428606 ?auto_428607 ?auto_428608 ?auto_428609 ?auto_428610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428617 - BLOCK
      ?auto_428618 - BLOCK
      ?auto_428619 - BLOCK
      ?auto_428620 - BLOCK
      ?auto_428621 - BLOCK
    )
    :vars
    (
      ?auto_428622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428621 ?auto_428622 ) ( ON-TABLE ?auto_428617 ) ( ON ?auto_428618 ?auto_428617 ) ( not ( = ?auto_428617 ?auto_428618 ) ) ( not ( = ?auto_428617 ?auto_428619 ) ) ( not ( = ?auto_428617 ?auto_428620 ) ) ( not ( = ?auto_428617 ?auto_428621 ) ) ( not ( = ?auto_428617 ?auto_428622 ) ) ( not ( = ?auto_428618 ?auto_428619 ) ) ( not ( = ?auto_428618 ?auto_428620 ) ) ( not ( = ?auto_428618 ?auto_428621 ) ) ( not ( = ?auto_428618 ?auto_428622 ) ) ( not ( = ?auto_428619 ?auto_428620 ) ) ( not ( = ?auto_428619 ?auto_428621 ) ) ( not ( = ?auto_428619 ?auto_428622 ) ) ( not ( = ?auto_428620 ?auto_428621 ) ) ( not ( = ?auto_428620 ?auto_428622 ) ) ( not ( = ?auto_428621 ?auto_428622 ) ) ( ON ?auto_428620 ?auto_428621 ) ( CLEAR ?auto_428618 ) ( ON ?auto_428619 ?auto_428620 ) ( CLEAR ?auto_428619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428617 ?auto_428618 ?auto_428619 )
      ( MAKE-5PILE ?auto_428617 ?auto_428618 ?auto_428619 ?auto_428620 ?auto_428621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428628 - BLOCK
      ?auto_428629 - BLOCK
      ?auto_428630 - BLOCK
      ?auto_428631 - BLOCK
      ?auto_428632 - BLOCK
    )
    :vars
    (
      ?auto_428633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428632 ?auto_428633 ) ( ON-TABLE ?auto_428628 ) ( ON ?auto_428629 ?auto_428628 ) ( not ( = ?auto_428628 ?auto_428629 ) ) ( not ( = ?auto_428628 ?auto_428630 ) ) ( not ( = ?auto_428628 ?auto_428631 ) ) ( not ( = ?auto_428628 ?auto_428632 ) ) ( not ( = ?auto_428628 ?auto_428633 ) ) ( not ( = ?auto_428629 ?auto_428630 ) ) ( not ( = ?auto_428629 ?auto_428631 ) ) ( not ( = ?auto_428629 ?auto_428632 ) ) ( not ( = ?auto_428629 ?auto_428633 ) ) ( not ( = ?auto_428630 ?auto_428631 ) ) ( not ( = ?auto_428630 ?auto_428632 ) ) ( not ( = ?auto_428630 ?auto_428633 ) ) ( not ( = ?auto_428631 ?auto_428632 ) ) ( not ( = ?auto_428631 ?auto_428633 ) ) ( not ( = ?auto_428632 ?auto_428633 ) ) ( ON ?auto_428631 ?auto_428632 ) ( CLEAR ?auto_428629 ) ( ON ?auto_428630 ?auto_428631 ) ( CLEAR ?auto_428630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428628 ?auto_428629 ?auto_428630 )
      ( MAKE-5PILE ?auto_428628 ?auto_428629 ?auto_428630 ?auto_428631 ?auto_428632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428639 - BLOCK
      ?auto_428640 - BLOCK
      ?auto_428641 - BLOCK
      ?auto_428642 - BLOCK
      ?auto_428643 - BLOCK
    )
    :vars
    (
      ?auto_428644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428643 ?auto_428644 ) ( ON-TABLE ?auto_428639 ) ( not ( = ?auto_428639 ?auto_428640 ) ) ( not ( = ?auto_428639 ?auto_428641 ) ) ( not ( = ?auto_428639 ?auto_428642 ) ) ( not ( = ?auto_428639 ?auto_428643 ) ) ( not ( = ?auto_428639 ?auto_428644 ) ) ( not ( = ?auto_428640 ?auto_428641 ) ) ( not ( = ?auto_428640 ?auto_428642 ) ) ( not ( = ?auto_428640 ?auto_428643 ) ) ( not ( = ?auto_428640 ?auto_428644 ) ) ( not ( = ?auto_428641 ?auto_428642 ) ) ( not ( = ?auto_428641 ?auto_428643 ) ) ( not ( = ?auto_428641 ?auto_428644 ) ) ( not ( = ?auto_428642 ?auto_428643 ) ) ( not ( = ?auto_428642 ?auto_428644 ) ) ( not ( = ?auto_428643 ?auto_428644 ) ) ( ON ?auto_428642 ?auto_428643 ) ( ON ?auto_428641 ?auto_428642 ) ( CLEAR ?auto_428639 ) ( ON ?auto_428640 ?auto_428641 ) ( CLEAR ?auto_428640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428639 ?auto_428640 )
      ( MAKE-5PILE ?auto_428639 ?auto_428640 ?auto_428641 ?auto_428642 ?auto_428643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428650 - BLOCK
      ?auto_428651 - BLOCK
      ?auto_428652 - BLOCK
      ?auto_428653 - BLOCK
      ?auto_428654 - BLOCK
    )
    :vars
    (
      ?auto_428655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428654 ?auto_428655 ) ( ON-TABLE ?auto_428650 ) ( not ( = ?auto_428650 ?auto_428651 ) ) ( not ( = ?auto_428650 ?auto_428652 ) ) ( not ( = ?auto_428650 ?auto_428653 ) ) ( not ( = ?auto_428650 ?auto_428654 ) ) ( not ( = ?auto_428650 ?auto_428655 ) ) ( not ( = ?auto_428651 ?auto_428652 ) ) ( not ( = ?auto_428651 ?auto_428653 ) ) ( not ( = ?auto_428651 ?auto_428654 ) ) ( not ( = ?auto_428651 ?auto_428655 ) ) ( not ( = ?auto_428652 ?auto_428653 ) ) ( not ( = ?auto_428652 ?auto_428654 ) ) ( not ( = ?auto_428652 ?auto_428655 ) ) ( not ( = ?auto_428653 ?auto_428654 ) ) ( not ( = ?auto_428653 ?auto_428655 ) ) ( not ( = ?auto_428654 ?auto_428655 ) ) ( ON ?auto_428653 ?auto_428654 ) ( ON ?auto_428652 ?auto_428653 ) ( CLEAR ?auto_428650 ) ( ON ?auto_428651 ?auto_428652 ) ( CLEAR ?auto_428651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428650 ?auto_428651 )
      ( MAKE-5PILE ?auto_428650 ?auto_428651 ?auto_428652 ?auto_428653 ?auto_428654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428661 - BLOCK
      ?auto_428662 - BLOCK
      ?auto_428663 - BLOCK
      ?auto_428664 - BLOCK
      ?auto_428665 - BLOCK
    )
    :vars
    (
      ?auto_428666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428665 ?auto_428666 ) ( not ( = ?auto_428661 ?auto_428662 ) ) ( not ( = ?auto_428661 ?auto_428663 ) ) ( not ( = ?auto_428661 ?auto_428664 ) ) ( not ( = ?auto_428661 ?auto_428665 ) ) ( not ( = ?auto_428661 ?auto_428666 ) ) ( not ( = ?auto_428662 ?auto_428663 ) ) ( not ( = ?auto_428662 ?auto_428664 ) ) ( not ( = ?auto_428662 ?auto_428665 ) ) ( not ( = ?auto_428662 ?auto_428666 ) ) ( not ( = ?auto_428663 ?auto_428664 ) ) ( not ( = ?auto_428663 ?auto_428665 ) ) ( not ( = ?auto_428663 ?auto_428666 ) ) ( not ( = ?auto_428664 ?auto_428665 ) ) ( not ( = ?auto_428664 ?auto_428666 ) ) ( not ( = ?auto_428665 ?auto_428666 ) ) ( ON ?auto_428664 ?auto_428665 ) ( ON ?auto_428663 ?auto_428664 ) ( ON ?auto_428662 ?auto_428663 ) ( ON ?auto_428661 ?auto_428662 ) ( CLEAR ?auto_428661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428661 )
      ( MAKE-5PILE ?auto_428661 ?auto_428662 ?auto_428663 ?auto_428664 ?auto_428665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428672 - BLOCK
      ?auto_428673 - BLOCK
      ?auto_428674 - BLOCK
      ?auto_428675 - BLOCK
      ?auto_428676 - BLOCK
    )
    :vars
    (
      ?auto_428677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428676 ?auto_428677 ) ( not ( = ?auto_428672 ?auto_428673 ) ) ( not ( = ?auto_428672 ?auto_428674 ) ) ( not ( = ?auto_428672 ?auto_428675 ) ) ( not ( = ?auto_428672 ?auto_428676 ) ) ( not ( = ?auto_428672 ?auto_428677 ) ) ( not ( = ?auto_428673 ?auto_428674 ) ) ( not ( = ?auto_428673 ?auto_428675 ) ) ( not ( = ?auto_428673 ?auto_428676 ) ) ( not ( = ?auto_428673 ?auto_428677 ) ) ( not ( = ?auto_428674 ?auto_428675 ) ) ( not ( = ?auto_428674 ?auto_428676 ) ) ( not ( = ?auto_428674 ?auto_428677 ) ) ( not ( = ?auto_428675 ?auto_428676 ) ) ( not ( = ?auto_428675 ?auto_428677 ) ) ( not ( = ?auto_428676 ?auto_428677 ) ) ( ON ?auto_428675 ?auto_428676 ) ( ON ?auto_428674 ?auto_428675 ) ( ON ?auto_428673 ?auto_428674 ) ( ON ?auto_428672 ?auto_428673 ) ( CLEAR ?auto_428672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428672 )
      ( MAKE-5PILE ?auto_428672 ?auto_428673 ?auto_428674 ?auto_428675 ?auto_428676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428684 - BLOCK
      ?auto_428685 - BLOCK
      ?auto_428686 - BLOCK
      ?auto_428687 - BLOCK
      ?auto_428688 - BLOCK
      ?auto_428689 - BLOCK
    )
    :vars
    (
      ?auto_428690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428688 ) ( ON ?auto_428689 ?auto_428690 ) ( CLEAR ?auto_428689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428684 ) ( ON ?auto_428685 ?auto_428684 ) ( ON ?auto_428686 ?auto_428685 ) ( ON ?auto_428687 ?auto_428686 ) ( ON ?auto_428688 ?auto_428687 ) ( not ( = ?auto_428684 ?auto_428685 ) ) ( not ( = ?auto_428684 ?auto_428686 ) ) ( not ( = ?auto_428684 ?auto_428687 ) ) ( not ( = ?auto_428684 ?auto_428688 ) ) ( not ( = ?auto_428684 ?auto_428689 ) ) ( not ( = ?auto_428684 ?auto_428690 ) ) ( not ( = ?auto_428685 ?auto_428686 ) ) ( not ( = ?auto_428685 ?auto_428687 ) ) ( not ( = ?auto_428685 ?auto_428688 ) ) ( not ( = ?auto_428685 ?auto_428689 ) ) ( not ( = ?auto_428685 ?auto_428690 ) ) ( not ( = ?auto_428686 ?auto_428687 ) ) ( not ( = ?auto_428686 ?auto_428688 ) ) ( not ( = ?auto_428686 ?auto_428689 ) ) ( not ( = ?auto_428686 ?auto_428690 ) ) ( not ( = ?auto_428687 ?auto_428688 ) ) ( not ( = ?auto_428687 ?auto_428689 ) ) ( not ( = ?auto_428687 ?auto_428690 ) ) ( not ( = ?auto_428688 ?auto_428689 ) ) ( not ( = ?auto_428688 ?auto_428690 ) ) ( not ( = ?auto_428689 ?auto_428690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428689 ?auto_428690 )
      ( !STACK ?auto_428689 ?auto_428688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428697 - BLOCK
      ?auto_428698 - BLOCK
      ?auto_428699 - BLOCK
      ?auto_428700 - BLOCK
      ?auto_428701 - BLOCK
      ?auto_428702 - BLOCK
    )
    :vars
    (
      ?auto_428703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428701 ) ( ON ?auto_428702 ?auto_428703 ) ( CLEAR ?auto_428702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428697 ) ( ON ?auto_428698 ?auto_428697 ) ( ON ?auto_428699 ?auto_428698 ) ( ON ?auto_428700 ?auto_428699 ) ( ON ?auto_428701 ?auto_428700 ) ( not ( = ?auto_428697 ?auto_428698 ) ) ( not ( = ?auto_428697 ?auto_428699 ) ) ( not ( = ?auto_428697 ?auto_428700 ) ) ( not ( = ?auto_428697 ?auto_428701 ) ) ( not ( = ?auto_428697 ?auto_428702 ) ) ( not ( = ?auto_428697 ?auto_428703 ) ) ( not ( = ?auto_428698 ?auto_428699 ) ) ( not ( = ?auto_428698 ?auto_428700 ) ) ( not ( = ?auto_428698 ?auto_428701 ) ) ( not ( = ?auto_428698 ?auto_428702 ) ) ( not ( = ?auto_428698 ?auto_428703 ) ) ( not ( = ?auto_428699 ?auto_428700 ) ) ( not ( = ?auto_428699 ?auto_428701 ) ) ( not ( = ?auto_428699 ?auto_428702 ) ) ( not ( = ?auto_428699 ?auto_428703 ) ) ( not ( = ?auto_428700 ?auto_428701 ) ) ( not ( = ?auto_428700 ?auto_428702 ) ) ( not ( = ?auto_428700 ?auto_428703 ) ) ( not ( = ?auto_428701 ?auto_428702 ) ) ( not ( = ?auto_428701 ?auto_428703 ) ) ( not ( = ?auto_428702 ?auto_428703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428702 ?auto_428703 )
      ( !STACK ?auto_428702 ?auto_428701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428710 - BLOCK
      ?auto_428711 - BLOCK
      ?auto_428712 - BLOCK
      ?auto_428713 - BLOCK
      ?auto_428714 - BLOCK
      ?auto_428715 - BLOCK
    )
    :vars
    (
      ?auto_428716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428715 ?auto_428716 ) ( ON-TABLE ?auto_428710 ) ( ON ?auto_428711 ?auto_428710 ) ( ON ?auto_428712 ?auto_428711 ) ( ON ?auto_428713 ?auto_428712 ) ( not ( = ?auto_428710 ?auto_428711 ) ) ( not ( = ?auto_428710 ?auto_428712 ) ) ( not ( = ?auto_428710 ?auto_428713 ) ) ( not ( = ?auto_428710 ?auto_428714 ) ) ( not ( = ?auto_428710 ?auto_428715 ) ) ( not ( = ?auto_428710 ?auto_428716 ) ) ( not ( = ?auto_428711 ?auto_428712 ) ) ( not ( = ?auto_428711 ?auto_428713 ) ) ( not ( = ?auto_428711 ?auto_428714 ) ) ( not ( = ?auto_428711 ?auto_428715 ) ) ( not ( = ?auto_428711 ?auto_428716 ) ) ( not ( = ?auto_428712 ?auto_428713 ) ) ( not ( = ?auto_428712 ?auto_428714 ) ) ( not ( = ?auto_428712 ?auto_428715 ) ) ( not ( = ?auto_428712 ?auto_428716 ) ) ( not ( = ?auto_428713 ?auto_428714 ) ) ( not ( = ?auto_428713 ?auto_428715 ) ) ( not ( = ?auto_428713 ?auto_428716 ) ) ( not ( = ?auto_428714 ?auto_428715 ) ) ( not ( = ?auto_428714 ?auto_428716 ) ) ( not ( = ?auto_428715 ?auto_428716 ) ) ( CLEAR ?auto_428713 ) ( ON ?auto_428714 ?auto_428715 ) ( CLEAR ?auto_428714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428710 ?auto_428711 ?auto_428712 ?auto_428713 ?auto_428714 )
      ( MAKE-6PILE ?auto_428710 ?auto_428711 ?auto_428712 ?auto_428713 ?auto_428714 ?auto_428715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428723 - BLOCK
      ?auto_428724 - BLOCK
      ?auto_428725 - BLOCK
      ?auto_428726 - BLOCK
      ?auto_428727 - BLOCK
      ?auto_428728 - BLOCK
    )
    :vars
    (
      ?auto_428729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428728 ?auto_428729 ) ( ON-TABLE ?auto_428723 ) ( ON ?auto_428724 ?auto_428723 ) ( ON ?auto_428725 ?auto_428724 ) ( ON ?auto_428726 ?auto_428725 ) ( not ( = ?auto_428723 ?auto_428724 ) ) ( not ( = ?auto_428723 ?auto_428725 ) ) ( not ( = ?auto_428723 ?auto_428726 ) ) ( not ( = ?auto_428723 ?auto_428727 ) ) ( not ( = ?auto_428723 ?auto_428728 ) ) ( not ( = ?auto_428723 ?auto_428729 ) ) ( not ( = ?auto_428724 ?auto_428725 ) ) ( not ( = ?auto_428724 ?auto_428726 ) ) ( not ( = ?auto_428724 ?auto_428727 ) ) ( not ( = ?auto_428724 ?auto_428728 ) ) ( not ( = ?auto_428724 ?auto_428729 ) ) ( not ( = ?auto_428725 ?auto_428726 ) ) ( not ( = ?auto_428725 ?auto_428727 ) ) ( not ( = ?auto_428725 ?auto_428728 ) ) ( not ( = ?auto_428725 ?auto_428729 ) ) ( not ( = ?auto_428726 ?auto_428727 ) ) ( not ( = ?auto_428726 ?auto_428728 ) ) ( not ( = ?auto_428726 ?auto_428729 ) ) ( not ( = ?auto_428727 ?auto_428728 ) ) ( not ( = ?auto_428727 ?auto_428729 ) ) ( not ( = ?auto_428728 ?auto_428729 ) ) ( CLEAR ?auto_428726 ) ( ON ?auto_428727 ?auto_428728 ) ( CLEAR ?auto_428727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428723 ?auto_428724 ?auto_428725 ?auto_428726 ?auto_428727 )
      ( MAKE-6PILE ?auto_428723 ?auto_428724 ?auto_428725 ?auto_428726 ?auto_428727 ?auto_428728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428736 - BLOCK
      ?auto_428737 - BLOCK
      ?auto_428738 - BLOCK
      ?auto_428739 - BLOCK
      ?auto_428740 - BLOCK
      ?auto_428741 - BLOCK
    )
    :vars
    (
      ?auto_428742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428741 ?auto_428742 ) ( ON-TABLE ?auto_428736 ) ( ON ?auto_428737 ?auto_428736 ) ( ON ?auto_428738 ?auto_428737 ) ( not ( = ?auto_428736 ?auto_428737 ) ) ( not ( = ?auto_428736 ?auto_428738 ) ) ( not ( = ?auto_428736 ?auto_428739 ) ) ( not ( = ?auto_428736 ?auto_428740 ) ) ( not ( = ?auto_428736 ?auto_428741 ) ) ( not ( = ?auto_428736 ?auto_428742 ) ) ( not ( = ?auto_428737 ?auto_428738 ) ) ( not ( = ?auto_428737 ?auto_428739 ) ) ( not ( = ?auto_428737 ?auto_428740 ) ) ( not ( = ?auto_428737 ?auto_428741 ) ) ( not ( = ?auto_428737 ?auto_428742 ) ) ( not ( = ?auto_428738 ?auto_428739 ) ) ( not ( = ?auto_428738 ?auto_428740 ) ) ( not ( = ?auto_428738 ?auto_428741 ) ) ( not ( = ?auto_428738 ?auto_428742 ) ) ( not ( = ?auto_428739 ?auto_428740 ) ) ( not ( = ?auto_428739 ?auto_428741 ) ) ( not ( = ?auto_428739 ?auto_428742 ) ) ( not ( = ?auto_428740 ?auto_428741 ) ) ( not ( = ?auto_428740 ?auto_428742 ) ) ( not ( = ?auto_428741 ?auto_428742 ) ) ( ON ?auto_428740 ?auto_428741 ) ( CLEAR ?auto_428738 ) ( ON ?auto_428739 ?auto_428740 ) ( CLEAR ?auto_428739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428736 ?auto_428737 ?auto_428738 ?auto_428739 )
      ( MAKE-6PILE ?auto_428736 ?auto_428737 ?auto_428738 ?auto_428739 ?auto_428740 ?auto_428741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428749 - BLOCK
      ?auto_428750 - BLOCK
      ?auto_428751 - BLOCK
      ?auto_428752 - BLOCK
      ?auto_428753 - BLOCK
      ?auto_428754 - BLOCK
    )
    :vars
    (
      ?auto_428755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428754 ?auto_428755 ) ( ON-TABLE ?auto_428749 ) ( ON ?auto_428750 ?auto_428749 ) ( ON ?auto_428751 ?auto_428750 ) ( not ( = ?auto_428749 ?auto_428750 ) ) ( not ( = ?auto_428749 ?auto_428751 ) ) ( not ( = ?auto_428749 ?auto_428752 ) ) ( not ( = ?auto_428749 ?auto_428753 ) ) ( not ( = ?auto_428749 ?auto_428754 ) ) ( not ( = ?auto_428749 ?auto_428755 ) ) ( not ( = ?auto_428750 ?auto_428751 ) ) ( not ( = ?auto_428750 ?auto_428752 ) ) ( not ( = ?auto_428750 ?auto_428753 ) ) ( not ( = ?auto_428750 ?auto_428754 ) ) ( not ( = ?auto_428750 ?auto_428755 ) ) ( not ( = ?auto_428751 ?auto_428752 ) ) ( not ( = ?auto_428751 ?auto_428753 ) ) ( not ( = ?auto_428751 ?auto_428754 ) ) ( not ( = ?auto_428751 ?auto_428755 ) ) ( not ( = ?auto_428752 ?auto_428753 ) ) ( not ( = ?auto_428752 ?auto_428754 ) ) ( not ( = ?auto_428752 ?auto_428755 ) ) ( not ( = ?auto_428753 ?auto_428754 ) ) ( not ( = ?auto_428753 ?auto_428755 ) ) ( not ( = ?auto_428754 ?auto_428755 ) ) ( ON ?auto_428753 ?auto_428754 ) ( CLEAR ?auto_428751 ) ( ON ?auto_428752 ?auto_428753 ) ( CLEAR ?auto_428752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428749 ?auto_428750 ?auto_428751 ?auto_428752 )
      ( MAKE-6PILE ?auto_428749 ?auto_428750 ?auto_428751 ?auto_428752 ?auto_428753 ?auto_428754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428762 - BLOCK
      ?auto_428763 - BLOCK
      ?auto_428764 - BLOCK
      ?auto_428765 - BLOCK
      ?auto_428766 - BLOCK
      ?auto_428767 - BLOCK
    )
    :vars
    (
      ?auto_428768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428767 ?auto_428768 ) ( ON-TABLE ?auto_428762 ) ( ON ?auto_428763 ?auto_428762 ) ( not ( = ?auto_428762 ?auto_428763 ) ) ( not ( = ?auto_428762 ?auto_428764 ) ) ( not ( = ?auto_428762 ?auto_428765 ) ) ( not ( = ?auto_428762 ?auto_428766 ) ) ( not ( = ?auto_428762 ?auto_428767 ) ) ( not ( = ?auto_428762 ?auto_428768 ) ) ( not ( = ?auto_428763 ?auto_428764 ) ) ( not ( = ?auto_428763 ?auto_428765 ) ) ( not ( = ?auto_428763 ?auto_428766 ) ) ( not ( = ?auto_428763 ?auto_428767 ) ) ( not ( = ?auto_428763 ?auto_428768 ) ) ( not ( = ?auto_428764 ?auto_428765 ) ) ( not ( = ?auto_428764 ?auto_428766 ) ) ( not ( = ?auto_428764 ?auto_428767 ) ) ( not ( = ?auto_428764 ?auto_428768 ) ) ( not ( = ?auto_428765 ?auto_428766 ) ) ( not ( = ?auto_428765 ?auto_428767 ) ) ( not ( = ?auto_428765 ?auto_428768 ) ) ( not ( = ?auto_428766 ?auto_428767 ) ) ( not ( = ?auto_428766 ?auto_428768 ) ) ( not ( = ?auto_428767 ?auto_428768 ) ) ( ON ?auto_428766 ?auto_428767 ) ( ON ?auto_428765 ?auto_428766 ) ( CLEAR ?auto_428763 ) ( ON ?auto_428764 ?auto_428765 ) ( CLEAR ?auto_428764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428762 ?auto_428763 ?auto_428764 )
      ( MAKE-6PILE ?auto_428762 ?auto_428763 ?auto_428764 ?auto_428765 ?auto_428766 ?auto_428767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428775 - BLOCK
      ?auto_428776 - BLOCK
      ?auto_428777 - BLOCK
      ?auto_428778 - BLOCK
      ?auto_428779 - BLOCK
      ?auto_428780 - BLOCK
    )
    :vars
    (
      ?auto_428781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428780 ?auto_428781 ) ( ON-TABLE ?auto_428775 ) ( ON ?auto_428776 ?auto_428775 ) ( not ( = ?auto_428775 ?auto_428776 ) ) ( not ( = ?auto_428775 ?auto_428777 ) ) ( not ( = ?auto_428775 ?auto_428778 ) ) ( not ( = ?auto_428775 ?auto_428779 ) ) ( not ( = ?auto_428775 ?auto_428780 ) ) ( not ( = ?auto_428775 ?auto_428781 ) ) ( not ( = ?auto_428776 ?auto_428777 ) ) ( not ( = ?auto_428776 ?auto_428778 ) ) ( not ( = ?auto_428776 ?auto_428779 ) ) ( not ( = ?auto_428776 ?auto_428780 ) ) ( not ( = ?auto_428776 ?auto_428781 ) ) ( not ( = ?auto_428777 ?auto_428778 ) ) ( not ( = ?auto_428777 ?auto_428779 ) ) ( not ( = ?auto_428777 ?auto_428780 ) ) ( not ( = ?auto_428777 ?auto_428781 ) ) ( not ( = ?auto_428778 ?auto_428779 ) ) ( not ( = ?auto_428778 ?auto_428780 ) ) ( not ( = ?auto_428778 ?auto_428781 ) ) ( not ( = ?auto_428779 ?auto_428780 ) ) ( not ( = ?auto_428779 ?auto_428781 ) ) ( not ( = ?auto_428780 ?auto_428781 ) ) ( ON ?auto_428779 ?auto_428780 ) ( ON ?auto_428778 ?auto_428779 ) ( CLEAR ?auto_428776 ) ( ON ?auto_428777 ?auto_428778 ) ( CLEAR ?auto_428777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428775 ?auto_428776 ?auto_428777 )
      ( MAKE-6PILE ?auto_428775 ?auto_428776 ?auto_428777 ?auto_428778 ?auto_428779 ?auto_428780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428788 - BLOCK
      ?auto_428789 - BLOCK
      ?auto_428790 - BLOCK
      ?auto_428791 - BLOCK
      ?auto_428792 - BLOCK
      ?auto_428793 - BLOCK
    )
    :vars
    (
      ?auto_428794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428793 ?auto_428794 ) ( ON-TABLE ?auto_428788 ) ( not ( = ?auto_428788 ?auto_428789 ) ) ( not ( = ?auto_428788 ?auto_428790 ) ) ( not ( = ?auto_428788 ?auto_428791 ) ) ( not ( = ?auto_428788 ?auto_428792 ) ) ( not ( = ?auto_428788 ?auto_428793 ) ) ( not ( = ?auto_428788 ?auto_428794 ) ) ( not ( = ?auto_428789 ?auto_428790 ) ) ( not ( = ?auto_428789 ?auto_428791 ) ) ( not ( = ?auto_428789 ?auto_428792 ) ) ( not ( = ?auto_428789 ?auto_428793 ) ) ( not ( = ?auto_428789 ?auto_428794 ) ) ( not ( = ?auto_428790 ?auto_428791 ) ) ( not ( = ?auto_428790 ?auto_428792 ) ) ( not ( = ?auto_428790 ?auto_428793 ) ) ( not ( = ?auto_428790 ?auto_428794 ) ) ( not ( = ?auto_428791 ?auto_428792 ) ) ( not ( = ?auto_428791 ?auto_428793 ) ) ( not ( = ?auto_428791 ?auto_428794 ) ) ( not ( = ?auto_428792 ?auto_428793 ) ) ( not ( = ?auto_428792 ?auto_428794 ) ) ( not ( = ?auto_428793 ?auto_428794 ) ) ( ON ?auto_428792 ?auto_428793 ) ( ON ?auto_428791 ?auto_428792 ) ( ON ?auto_428790 ?auto_428791 ) ( CLEAR ?auto_428788 ) ( ON ?auto_428789 ?auto_428790 ) ( CLEAR ?auto_428789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428788 ?auto_428789 )
      ( MAKE-6PILE ?auto_428788 ?auto_428789 ?auto_428790 ?auto_428791 ?auto_428792 ?auto_428793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428801 - BLOCK
      ?auto_428802 - BLOCK
      ?auto_428803 - BLOCK
      ?auto_428804 - BLOCK
      ?auto_428805 - BLOCK
      ?auto_428806 - BLOCK
    )
    :vars
    (
      ?auto_428807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428806 ?auto_428807 ) ( ON-TABLE ?auto_428801 ) ( not ( = ?auto_428801 ?auto_428802 ) ) ( not ( = ?auto_428801 ?auto_428803 ) ) ( not ( = ?auto_428801 ?auto_428804 ) ) ( not ( = ?auto_428801 ?auto_428805 ) ) ( not ( = ?auto_428801 ?auto_428806 ) ) ( not ( = ?auto_428801 ?auto_428807 ) ) ( not ( = ?auto_428802 ?auto_428803 ) ) ( not ( = ?auto_428802 ?auto_428804 ) ) ( not ( = ?auto_428802 ?auto_428805 ) ) ( not ( = ?auto_428802 ?auto_428806 ) ) ( not ( = ?auto_428802 ?auto_428807 ) ) ( not ( = ?auto_428803 ?auto_428804 ) ) ( not ( = ?auto_428803 ?auto_428805 ) ) ( not ( = ?auto_428803 ?auto_428806 ) ) ( not ( = ?auto_428803 ?auto_428807 ) ) ( not ( = ?auto_428804 ?auto_428805 ) ) ( not ( = ?auto_428804 ?auto_428806 ) ) ( not ( = ?auto_428804 ?auto_428807 ) ) ( not ( = ?auto_428805 ?auto_428806 ) ) ( not ( = ?auto_428805 ?auto_428807 ) ) ( not ( = ?auto_428806 ?auto_428807 ) ) ( ON ?auto_428805 ?auto_428806 ) ( ON ?auto_428804 ?auto_428805 ) ( ON ?auto_428803 ?auto_428804 ) ( CLEAR ?auto_428801 ) ( ON ?auto_428802 ?auto_428803 ) ( CLEAR ?auto_428802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428801 ?auto_428802 )
      ( MAKE-6PILE ?auto_428801 ?auto_428802 ?auto_428803 ?auto_428804 ?auto_428805 ?auto_428806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428814 - BLOCK
      ?auto_428815 - BLOCK
      ?auto_428816 - BLOCK
      ?auto_428817 - BLOCK
      ?auto_428818 - BLOCK
      ?auto_428819 - BLOCK
    )
    :vars
    (
      ?auto_428820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428819 ?auto_428820 ) ( not ( = ?auto_428814 ?auto_428815 ) ) ( not ( = ?auto_428814 ?auto_428816 ) ) ( not ( = ?auto_428814 ?auto_428817 ) ) ( not ( = ?auto_428814 ?auto_428818 ) ) ( not ( = ?auto_428814 ?auto_428819 ) ) ( not ( = ?auto_428814 ?auto_428820 ) ) ( not ( = ?auto_428815 ?auto_428816 ) ) ( not ( = ?auto_428815 ?auto_428817 ) ) ( not ( = ?auto_428815 ?auto_428818 ) ) ( not ( = ?auto_428815 ?auto_428819 ) ) ( not ( = ?auto_428815 ?auto_428820 ) ) ( not ( = ?auto_428816 ?auto_428817 ) ) ( not ( = ?auto_428816 ?auto_428818 ) ) ( not ( = ?auto_428816 ?auto_428819 ) ) ( not ( = ?auto_428816 ?auto_428820 ) ) ( not ( = ?auto_428817 ?auto_428818 ) ) ( not ( = ?auto_428817 ?auto_428819 ) ) ( not ( = ?auto_428817 ?auto_428820 ) ) ( not ( = ?auto_428818 ?auto_428819 ) ) ( not ( = ?auto_428818 ?auto_428820 ) ) ( not ( = ?auto_428819 ?auto_428820 ) ) ( ON ?auto_428818 ?auto_428819 ) ( ON ?auto_428817 ?auto_428818 ) ( ON ?auto_428816 ?auto_428817 ) ( ON ?auto_428815 ?auto_428816 ) ( ON ?auto_428814 ?auto_428815 ) ( CLEAR ?auto_428814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428814 )
      ( MAKE-6PILE ?auto_428814 ?auto_428815 ?auto_428816 ?auto_428817 ?auto_428818 ?auto_428819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428827 - BLOCK
      ?auto_428828 - BLOCK
      ?auto_428829 - BLOCK
      ?auto_428830 - BLOCK
      ?auto_428831 - BLOCK
      ?auto_428832 - BLOCK
    )
    :vars
    (
      ?auto_428833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428832 ?auto_428833 ) ( not ( = ?auto_428827 ?auto_428828 ) ) ( not ( = ?auto_428827 ?auto_428829 ) ) ( not ( = ?auto_428827 ?auto_428830 ) ) ( not ( = ?auto_428827 ?auto_428831 ) ) ( not ( = ?auto_428827 ?auto_428832 ) ) ( not ( = ?auto_428827 ?auto_428833 ) ) ( not ( = ?auto_428828 ?auto_428829 ) ) ( not ( = ?auto_428828 ?auto_428830 ) ) ( not ( = ?auto_428828 ?auto_428831 ) ) ( not ( = ?auto_428828 ?auto_428832 ) ) ( not ( = ?auto_428828 ?auto_428833 ) ) ( not ( = ?auto_428829 ?auto_428830 ) ) ( not ( = ?auto_428829 ?auto_428831 ) ) ( not ( = ?auto_428829 ?auto_428832 ) ) ( not ( = ?auto_428829 ?auto_428833 ) ) ( not ( = ?auto_428830 ?auto_428831 ) ) ( not ( = ?auto_428830 ?auto_428832 ) ) ( not ( = ?auto_428830 ?auto_428833 ) ) ( not ( = ?auto_428831 ?auto_428832 ) ) ( not ( = ?auto_428831 ?auto_428833 ) ) ( not ( = ?auto_428832 ?auto_428833 ) ) ( ON ?auto_428831 ?auto_428832 ) ( ON ?auto_428830 ?auto_428831 ) ( ON ?auto_428829 ?auto_428830 ) ( ON ?auto_428828 ?auto_428829 ) ( ON ?auto_428827 ?auto_428828 ) ( CLEAR ?auto_428827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428827 )
      ( MAKE-6PILE ?auto_428827 ?auto_428828 ?auto_428829 ?auto_428830 ?auto_428831 ?auto_428832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428841 - BLOCK
      ?auto_428842 - BLOCK
      ?auto_428843 - BLOCK
      ?auto_428844 - BLOCK
      ?auto_428845 - BLOCK
      ?auto_428846 - BLOCK
      ?auto_428847 - BLOCK
    )
    :vars
    (
      ?auto_428848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428846 ) ( ON ?auto_428847 ?auto_428848 ) ( CLEAR ?auto_428847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428841 ) ( ON ?auto_428842 ?auto_428841 ) ( ON ?auto_428843 ?auto_428842 ) ( ON ?auto_428844 ?auto_428843 ) ( ON ?auto_428845 ?auto_428844 ) ( ON ?auto_428846 ?auto_428845 ) ( not ( = ?auto_428841 ?auto_428842 ) ) ( not ( = ?auto_428841 ?auto_428843 ) ) ( not ( = ?auto_428841 ?auto_428844 ) ) ( not ( = ?auto_428841 ?auto_428845 ) ) ( not ( = ?auto_428841 ?auto_428846 ) ) ( not ( = ?auto_428841 ?auto_428847 ) ) ( not ( = ?auto_428841 ?auto_428848 ) ) ( not ( = ?auto_428842 ?auto_428843 ) ) ( not ( = ?auto_428842 ?auto_428844 ) ) ( not ( = ?auto_428842 ?auto_428845 ) ) ( not ( = ?auto_428842 ?auto_428846 ) ) ( not ( = ?auto_428842 ?auto_428847 ) ) ( not ( = ?auto_428842 ?auto_428848 ) ) ( not ( = ?auto_428843 ?auto_428844 ) ) ( not ( = ?auto_428843 ?auto_428845 ) ) ( not ( = ?auto_428843 ?auto_428846 ) ) ( not ( = ?auto_428843 ?auto_428847 ) ) ( not ( = ?auto_428843 ?auto_428848 ) ) ( not ( = ?auto_428844 ?auto_428845 ) ) ( not ( = ?auto_428844 ?auto_428846 ) ) ( not ( = ?auto_428844 ?auto_428847 ) ) ( not ( = ?auto_428844 ?auto_428848 ) ) ( not ( = ?auto_428845 ?auto_428846 ) ) ( not ( = ?auto_428845 ?auto_428847 ) ) ( not ( = ?auto_428845 ?auto_428848 ) ) ( not ( = ?auto_428846 ?auto_428847 ) ) ( not ( = ?auto_428846 ?auto_428848 ) ) ( not ( = ?auto_428847 ?auto_428848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428847 ?auto_428848 )
      ( !STACK ?auto_428847 ?auto_428846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428856 - BLOCK
      ?auto_428857 - BLOCK
      ?auto_428858 - BLOCK
      ?auto_428859 - BLOCK
      ?auto_428860 - BLOCK
      ?auto_428861 - BLOCK
      ?auto_428862 - BLOCK
    )
    :vars
    (
      ?auto_428863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428861 ) ( ON ?auto_428862 ?auto_428863 ) ( CLEAR ?auto_428862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428856 ) ( ON ?auto_428857 ?auto_428856 ) ( ON ?auto_428858 ?auto_428857 ) ( ON ?auto_428859 ?auto_428858 ) ( ON ?auto_428860 ?auto_428859 ) ( ON ?auto_428861 ?auto_428860 ) ( not ( = ?auto_428856 ?auto_428857 ) ) ( not ( = ?auto_428856 ?auto_428858 ) ) ( not ( = ?auto_428856 ?auto_428859 ) ) ( not ( = ?auto_428856 ?auto_428860 ) ) ( not ( = ?auto_428856 ?auto_428861 ) ) ( not ( = ?auto_428856 ?auto_428862 ) ) ( not ( = ?auto_428856 ?auto_428863 ) ) ( not ( = ?auto_428857 ?auto_428858 ) ) ( not ( = ?auto_428857 ?auto_428859 ) ) ( not ( = ?auto_428857 ?auto_428860 ) ) ( not ( = ?auto_428857 ?auto_428861 ) ) ( not ( = ?auto_428857 ?auto_428862 ) ) ( not ( = ?auto_428857 ?auto_428863 ) ) ( not ( = ?auto_428858 ?auto_428859 ) ) ( not ( = ?auto_428858 ?auto_428860 ) ) ( not ( = ?auto_428858 ?auto_428861 ) ) ( not ( = ?auto_428858 ?auto_428862 ) ) ( not ( = ?auto_428858 ?auto_428863 ) ) ( not ( = ?auto_428859 ?auto_428860 ) ) ( not ( = ?auto_428859 ?auto_428861 ) ) ( not ( = ?auto_428859 ?auto_428862 ) ) ( not ( = ?auto_428859 ?auto_428863 ) ) ( not ( = ?auto_428860 ?auto_428861 ) ) ( not ( = ?auto_428860 ?auto_428862 ) ) ( not ( = ?auto_428860 ?auto_428863 ) ) ( not ( = ?auto_428861 ?auto_428862 ) ) ( not ( = ?auto_428861 ?auto_428863 ) ) ( not ( = ?auto_428862 ?auto_428863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428862 ?auto_428863 )
      ( !STACK ?auto_428862 ?auto_428861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428871 - BLOCK
      ?auto_428872 - BLOCK
      ?auto_428873 - BLOCK
      ?auto_428874 - BLOCK
      ?auto_428875 - BLOCK
      ?auto_428876 - BLOCK
      ?auto_428877 - BLOCK
    )
    :vars
    (
      ?auto_428878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428877 ?auto_428878 ) ( ON-TABLE ?auto_428871 ) ( ON ?auto_428872 ?auto_428871 ) ( ON ?auto_428873 ?auto_428872 ) ( ON ?auto_428874 ?auto_428873 ) ( ON ?auto_428875 ?auto_428874 ) ( not ( = ?auto_428871 ?auto_428872 ) ) ( not ( = ?auto_428871 ?auto_428873 ) ) ( not ( = ?auto_428871 ?auto_428874 ) ) ( not ( = ?auto_428871 ?auto_428875 ) ) ( not ( = ?auto_428871 ?auto_428876 ) ) ( not ( = ?auto_428871 ?auto_428877 ) ) ( not ( = ?auto_428871 ?auto_428878 ) ) ( not ( = ?auto_428872 ?auto_428873 ) ) ( not ( = ?auto_428872 ?auto_428874 ) ) ( not ( = ?auto_428872 ?auto_428875 ) ) ( not ( = ?auto_428872 ?auto_428876 ) ) ( not ( = ?auto_428872 ?auto_428877 ) ) ( not ( = ?auto_428872 ?auto_428878 ) ) ( not ( = ?auto_428873 ?auto_428874 ) ) ( not ( = ?auto_428873 ?auto_428875 ) ) ( not ( = ?auto_428873 ?auto_428876 ) ) ( not ( = ?auto_428873 ?auto_428877 ) ) ( not ( = ?auto_428873 ?auto_428878 ) ) ( not ( = ?auto_428874 ?auto_428875 ) ) ( not ( = ?auto_428874 ?auto_428876 ) ) ( not ( = ?auto_428874 ?auto_428877 ) ) ( not ( = ?auto_428874 ?auto_428878 ) ) ( not ( = ?auto_428875 ?auto_428876 ) ) ( not ( = ?auto_428875 ?auto_428877 ) ) ( not ( = ?auto_428875 ?auto_428878 ) ) ( not ( = ?auto_428876 ?auto_428877 ) ) ( not ( = ?auto_428876 ?auto_428878 ) ) ( not ( = ?auto_428877 ?auto_428878 ) ) ( CLEAR ?auto_428875 ) ( ON ?auto_428876 ?auto_428877 ) ( CLEAR ?auto_428876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_428871 ?auto_428872 ?auto_428873 ?auto_428874 ?auto_428875 ?auto_428876 )
      ( MAKE-7PILE ?auto_428871 ?auto_428872 ?auto_428873 ?auto_428874 ?auto_428875 ?auto_428876 ?auto_428877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428886 - BLOCK
      ?auto_428887 - BLOCK
      ?auto_428888 - BLOCK
      ?auto_428889 - BLOCK
      ?auto_428890 - BLOCK
      ?auto_428891 - BLOCK
      ?auto_428892 - BLOCK
    )
    :vars
    (
      ?auto_428893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428892 ?auto_428893 ) ( ON-TABLE ?auto_428886 ) ( ON ?auto_428887 ?auto_428886 ) ( ON ?auto_428888 ?auto_428887 ) ( ON ?auto_428889 ?auto_428888 ) ( ON ?auto_428890 ?auto_428889 ) ( not ( = ?auto_428886 ?auto_428887 ) ) ( not ( = ?auto_428886 ?auto_428888 ) ) ( not ( = ?auto_428886 ?auto_428889 ) ) ( not ( = ?auto_428886 ?auto_428890 ) ) ( not ( = ?auto_428886 ?auto_428891 ) ) ( not ( = ?auto_428886 ?auto_428892 ) ) ( not ( = ?auto_428886 ?auto_428893 ) ) ( not ( = ?auto_428887 ?auto_428888 ) ) ( not ( = ?auto_428887 ?auto_428889 ) ) ( not ( = ?auto_428887 ?auto_428890 ) ) ( not ( = ?auto_428887 ?auto_428891 ) ) ( not ( = ?auto_428887 ?auto_428892 ) ) ( not ( = ?auto_428887 ?auto_428893 ) ) ( not ( = ?auto_428888 ?auto_428889 ) ) ( not ( = ?auto_428888 ?auto_428890 ) ) ( not ( = ?auto_428888 ?auto_428891 ) ) ( not ( = ?auto_428888 ?auto_428892 ) ) ( not ( = ?auto_428888 ?auto_428893 ) ) ( not ( = ?auto_428889 ?auto_428890 ) ) ( not ( = ?auto_428889 ?auto_428891 ) ) ( not ( = ?auto_428889 ?auto_428892 ) ) ( not ( = ?auto_428889 ?auto_428893 ) ) ( not ( = ?auto_428890 ?auto_428891 ) ) ( not ( = ?auto_428890 ?auto_428892 ) ) ( not ( = ?auto_428890 ?auto_428893 ) ) ( not ( = ?auto_428891 ?auto_428892 ) ) ( not ( = ?auto_428891 ?auto_428893 ) ) ( not ( = ?auto_428892 ?auto_428893 ) ) ( CLEAR ?auto_428890 ) ( ON ?auto_428891 ?auto_428892 ) ( CLEAR ?auto_428891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_428886 ?auto_428887 ?auto_428888 ?auto_428889 ?auto_428890 ?auto_428891 )
      ( MAKE-7PILE ?auto_428886 ?auto_428887 ?auto_428888 ?auto_428889 ?auto_428890 ?auto_428891 ?auto_428892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428901 - BLOCK
      ?auto_428902 - BLOCK
      ?auto_428903 - BLOCK
      ?auto_428904 - BLOCK
      ?auto_428905 - BLOCK
      ?auto_428906 - BLOCK
      ?auto_428907 - BLOCK
    )
    :vars
    (
      ?auto_428908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428907 ?auto_428908 ) ( ON-TABLE ?auto_428901 ) ( ON ?auto_428902 ?auto_428901 ) ( ON ?auto_428903 ?auto_428902 ) ( ON ?auto_428904 ?auto_428903 ) ( not ( = ?auto_428901 ?auto_428902 ) ) ( not ( = ?auto_428901 ?auto_428903 ) ) ( not ( = ?auto_428901 ?auto_428904 ) ) ( not ( = ?auto_428901 ?auto_428905 ) ) ( not ( = ?auto_428901 ?auto_428906 ) ) ( not ( = ?auto_428901 ?auto_428907 ) ) ( not ( = ?auto_428901 ?auto_428908 ) ) ( not ( = ?auto_428902 ?auto_428903 ) ) ( not ( = ?auto_428902 ?auto_428904 ) ) ( not ( = ?auto_428902 ?auto_428905 ) ) ( not ( = ?auto_428902 ?auto_428906 ) ) ( not ( = ?auto_428902 ?auto_428907 ) ) ( not ( = ?auto_428902 ?auto_428908 ) ) ( not ( = ?auto_428903 ?auto_428904 ) ) ( not ( = ?auto_428903 ?auto_428905 ) ) ( not ( = ?auto_428903 ?auto_428906 ) ) ( not ( = ?auto_428903 ?auto_428907 ) ) ( not ( = ?auto_428903 ?auto_428908 ) ) ( not ( = ?auto_428904 ?auto_428905 ) ) ( not ( = ?auto_428904 ?auto_428906 ) ) ( not ( = ?auto_428904 ?auto_428907 ) ) ( not ( = ?auto_428904 ?auto_428908 ) ) ( not ( = ?auto_428905 ?auto_428906 ) ) ( not ( = ?auto_428905 ?auto_428907 ) ) ( not ( = ?auto_428905 ?auto_428908 ) ) ( not ( = ?auto_428906 ?auto_428907 ) ) ( not ( = ?auto_428906 ?auto_428908 ) ) ( not ( = ?auto_428907 ?auto_428908 ) ) ( ON ?auto_428906 ?auto_428907 ) ( CLEAR ?auto_428904 ) ( ON ?auto_428905 ?auto_428906 ) ( CLEAR ?auto_428905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428901 ?auto_428902 ?auto_428903 ?auto_428904 ?auto_428905 )
      ( MAKE-7PILE ?auto_428901 ?auto_428902 ?auto_428903 ?auto_428904 ?auto_428905 ?auto_428906 ?auto_428907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428916 - BLOCK
      ?auto_428917 - BLOCK
      ?auto_428918 - BLOCK
      ?auto_428919 - BLOCK
      ?auto_428920 - BLOCK
      ?auto_428921 - BLOCK
      ?auto_428922 - BLOCK
    )
    :vars
    (
      ?auto_428923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428922 ?auto_428923 ) ( ON-TABLE ?auto_428916 ) ( ON ?auto_428917 ?auto_428916 ) ( ON ?auto_428918 ?auto_428917 ) ( ON ?auto_428919 ?auto_428918 ) ( not ( = ?auto_428916 ?auto_428917 ) ) ( not ( = ?auto_428916 ?auto_428918 ) ) ( not ( = ?auto_428916 ?auto_428919 ) ) ( not ( = ?auto_428916 ?auto_428920 ) ) ( not ( = ?auto_428916 ?auto_428921 ) ) ( not ( = ?auto_428916 ?auto_428922 ) ) ( not ( = ?auto_428916 ?auto_428923 ) ) ( not ( = ?auto_428917 ?auto_428918 ) ) ( not ( = ?auto_428917 ?auto_428919 ) ) ( not ( = ?auto_428917 ?auto_428920 ) ) ( not ( = ?auto_428917 ?auto_428921 ) ) ( not ( = ?auto_428917 ?auto_428922 ) ) ( not ( = ?auto_428917 ?auto_428923 ) ) ( not ( = ?auto_428918 ?auto_428919 ) ) ( not ( = ?auto_428918 ?auto_428920 ) ) ( not ( = ?auto_428918 ?auto_428921 ) ) ( not ( = ?auto_428918 ?auto_428922 ) ) ( not ( = ?auto_428918 ?auto_428923 ) ) ( not ( = ?auto_428919 ?auto_428920 ) ) ( not ( = ?auto_428919 ?auto_428921 ) ) ( not ( = ?auto_428919 ?auto_428922 ) ) ( not ( = ?auto_428919 ?auto_428923 ) ) ( not ( = ?auto_428920 ?auto_428921 ) ) ( not ( = ?auto_428920 ?auto_428922 ) ) ( not ( = ?auto_428920 ?auto_428923 ) ) ( not ( = ?auto_428921 ?auto_428922 ) ) ( not ( = ?auto_428921 ?auto_428923 ) ) ( not ( = ?auto_428922 ?auto_428923 ) ) ( ON ?auto_428921 ?auto_428922 ) ( CLEAR ?auto_428919 ) ( ON ?auto_428920 ?auto_428921 ) ( CLEAR ?auto_428920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428916 ?auto_428917 ?auto_428918 ?auto_428919 ?auto_428920 )
      ( MAKE-7PILE ?auto_428916 ?auto_428917 ?auto_428918 ?auto_428919 ?auto_428920 ?auto_428921 ?auto_428922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428931 - BLOCK
      ?auto_428932 - BLOCK
      ?auto_428933 - BLOCK
      ?auto_428934 - BLOCK
      ?auto_428935 - BLOCK
      ?auto_428936 - BLOCK
      ?auto_428937 - BLOCK
    )
    :vars
    (
      ?auto_428938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428937 ?auto_428938 ) ( ON-TABLE ?auto_428931 ) ( ON ?auto_428932 ?auto_428931 ) ( ON ?auto_428933 ?auto_428932 ) ( not ( = ?auto_428931 ?auto_428932 ) ) ( not ( = ?auto_428931 ?auto_428933 ) ) ( not ( = ?auto_428931 ?auto_428934 ) ) ( not ( = ?auto_428931 ?auto_428935 ) ) ( not ( = ?auto_428931 ?auto_428936 ) ) ( not ( = ?auto_428931 ?auto_428937 ) ) ( not ( = ?auto_428931 ?auto_428938 ) ) ( not ( = ?auto_428932 ?auto_428933 ) ) ( not ( = ?auto_428932 ?auto_428934 ) ) ( not ( = ?auto_428932 ?auto_428935 ) ) ( not ( = ?auto_428932 ?auto_428936 ) ) ( not ( = ?auto_428932 ?auto_428937 ) ) ( not ( = ?auto_428932 ?auto_428938 ) ) ( not ( = ?auto_428933 ?auto_428934 ) ) ( not ( = ?auto_428933 ?auto_428935 ) ) ( not ( = ?auto_428933 ?auto_428936 ) ) ( not ( = ?auto_428933 ?auto_428937 ) ) ( not ( = ?auto_428933 ?auto_428938 ) ) ( not ( = ?auto_428934 ?auto_428935 ) ) ( not ( = ?auto_428934 ?auto_428936 ) ) ( not ( = ?auto_428934 ?auto_428937 ) ) ( not ( = ?auto_428934 ?auto_428938 ) ) ( not ( = ?auto_428935 ?auto_428936 ) ) ( not ( = ?auto_428935 ?auto_428937 ) ) ( not ( = ?auto_428935 ?auto_428938 ) ) ( not ( = ?auto_428936 ?auto_428937 ) ) ( not ( = ?auto_428936 ?auto_428938 ) ) ( not ( = ?auto_428937 ?auto_428938 ) ) ( ON ?auto_428936 ?auto_428937 ) ( ON ?auto_428935 ?auto_428936 ) ( CLEAR ?auto_428933 ) ( ON ?auto_428934 ?auto_428935 ) ( CLEAR ?auto_428934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428931 ?auto_428932 ?auto_428933 ?auto_428934 )
      ( MAKE-7PILE ?auto_428931 ?auto_428932 ?auto_428933 ?auto_428934 ?auto_428935 ?auto_428936 ?auto_428937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428946 - BLOCK
      ?auto_428947 - BLOCK
      ?auto_428948 - BLOCK
      ?auto_428949 - BLOCK
      ?auto_428950 - BLOCK
      ?auto_428951 - BLOCK
      ?auto_428952 - BLOCK
    )
    :vars
    (
      ?auto_428953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428952 ?auto_428953 ) ( ON-TABLE ?auto_428946 ) ( ON ?auto_428947 ?auto_428946 ) ( ON ?auto_428948 ?auto_428947 ) ( not ( = ?auto_428946 ?auto_428947 ) ) ( not ( = ?auto_428946 ?auto_428948 ) ) ( not ( = ?auto_428946 ?auto_428949 ) ) ( not ( = ?auto_428946 ?auto_428950 ) ) ( not ( = ?auto_428946 ?auto_428951 ) ) ( not ( = ?auto_428946 ?auto_428952 ) ) ( not ( = ?auto_428946 ?auto_428953 ) ) ( not ( = ?auto_428947 ?auto_428948 ) ) ( not ( = ?auto_428947 ?auto_428949 ) ) ( not ( = ?auto_428947 ?auto_428950 ) ) ( not ( = ?auto_428947 ?auto_428951 ) ) ( not ( = ?auto_428947 ?auto_428952 ) ) ( not ( = ?auto_428947 ?auto_428953 ) ) ( not ( = ?auto_428948 ?auto_428949 ) ) ( not ( = ?auto_428948 ?auto_428950 ) ) ( not ( = ?auto_428948 ?auto_428951 ) ) ( not ( = ?auto_428948 ?auto_428952 ) ) ( not ( = ?auto_428948 ?auto_428953 ) ) ( not ( = ?auto_428949 ?auto_428950 ) ) ( not ( = ?auto_428949 ?auto_428951 ) ) ( not ( = ?auto_428949 ?auto_428952 ) ) ( not ( = ?auto_428949 ?auto_428953 ) ) ( not ( = ?auto_428950 ?auto_428951 ) ) ( not ( = ?auto_428950 ?auto_428952 ) ) ( not ( = ?auto_428950 ?auto_428953 ) ) ( not ( = ?auto_428951 ?auto_428952 ) ) ( not ( = ?auto_428951 ?auto_428953 ) ) ( not ( = ?auto_428952 ?auto_428953 ) ) ( ON ?auto_428951 ?auto_428952 ) ( ON ?auto_428950 ?auto_428951 ) ( CLEAR ?auto_428948 ) ( ON ?auto_428949 ?auto_428950 ) ( CLEAR ?auto_428949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428946 ?auto_428947 ?auto_428948 ?auto_428949 )
      ( MAKE-7PILE ?auto_428946 ?auto_428947 ?auto_428948 ?auto_428949 ?auto_428950 ?auto_428951 ?auto_428952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428961 - BLOCK
      ?auto_428962 - BLOCK
      ?auto_428963 - BLOCK
      ?auto_428964 - BLOCK
      ?auto_428965 - BLOCK
      ?auto_428966 - BLOCK
      ?auto_428967 - BLOCK
    )
    :vars
    (
      ?auto_428968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428967 ?auto_428968 ) ( ON-TABLE ?auto_428961 ) ( ON ?auto_428962 ?auto_428961 ) ( not ( = ?auto_428961 ?auto_428962 ) ) ( not ( = ?auto_428961 ?auto_428963 ) ) ( not ( = ?auto_428961 ?auto_428964 ) ) ( not ( = ?auto_428961 ?auto_428965 ) ) ( not ( = ?auto_428961 ?auto_428966 ) ) ( not ( = ?auto_428961 ?auto_428967 ) ) ( not ( = ?auto_428961 ?auto_428968 ) ) ( not ( = ?auto_428962 ?auto_428963 ) ) ( not ( = ?auto_428962 ?auto_428964 ) ) ( not ( = ?auto_428962 ?auto_428965 ) ) ( not ( = ?auto_428962 ?auto_428966 ) ) ( not ( = ?auto_428962 ?auto_428967 ) ) ( not ( = ?auto_428962 ?auto_428968 ) ) ( not ( = ?auto_428963 ?auto_428964 ) ) ( not ( = ?auto_428963 ?auto_428965 ) ) ( not ( = ?auto_428963 ?auto_428966 ) ) ( not ( = ?auto_428963 ?auto_428967 ) ) ( not ( = ?auto_428963 ?auto_428968 ) ) ( not ( = ?auto_428964 ?auto_428965 ) ) ( not ( = ?auto_428964 ?auto_428966 ) ) ( not ( = ?auto_428964 ?auto_428967 ) ) ( not ( = ?auto_428964 ?auto_428968 ) ) ( not ( = ?auto_428965 ?auto_428966 ) ) ( not ( = ?auto_428965 ?auto_428967 ) ) ( not ( = ?auto_428965 ?auto_428968 ) ) ( not ( = ?auto_428966 ?auto_428967 ) ) ( not ( = ?auto_428966 ?auto_428968 ) ) ( not ( = ?auto_428967 ?auto_428968 ) ) ( ON ?auto_428966 ?auto_428967 ) ( ON ?auto_428965 ?auto_428966 ) ( ON ?auto_428964 ?auto_428965 ) ( CLEAR ?auto_428962 ) ( ON ?auto_428963 ?auto_428964 ) ( CLEAR ?auto_428963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428961 ?auto_428962 ?auto_428963 )
      ( MAKE-7PILE ?auto_428961 ?auto_428962 ?auto_428963 ?auto_428964 ?auto_428965 ?auto_428966 ?auto_428967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428976 - BLOCK
      ?auto_428977 - BLOCK
      ?auto_428978 - BLOCK
      ?auto_428979 - BLOCK
      ?auto_428980 - BLOCK
      ?auto_428981 - BLOCK
      ?auto_428982 - BLOCK
    )
    :vars
    (
      ?auto_428983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428982 ?auto_428983 ) ( ON-TABLE ?auto_428976 ) ( ON ?auto_428977 ?auto_428976 ) ( not ( = ?auto_428976 ?auto_428977 ) ) ( not ( = ?auto_428976 ?auto_428978 ) ) ( not ( = ?auto_428976 ?auto_428979 ) ) ( not ( = ?auto_428976 ?auto_428980 ) ) ( not ( = ?auto_428976 ?auto_428981 ) ) ( not ( = ?auto_428976 ?auto_428982 ) ) ( not ( = ?auto_428976 ?auto_428983 ) ) ( not ( = ?auto_428977 ?auto_428978 ) ) ( not ( = ?auto_428977 ?auto_428979 ) ) ( not ( = ?auto_428977 ?auto_428980 ) ) ( not ( = ?auto_428977 ?auto_428981 ) ) ( not ( = ?auto_428977 ?auto_428982 ) ) ( not ( = ?auto_428977 ?auto_428983 ) ) ( not ( = ?auto_428978 ?auto_428979 ) ) ( not ( = ?auto_428978 ?auto_428980 ) ) ( not ( = ?auto_428978 ?auto_428981 ) ) ( not ( = ?auto_428978 ?auto_428982 ) ) ( not ( = ?auto_428978 ?auto_428983 ) ) ( not ( = ?auto_428979 ?auto_428980 ) ) ( not ( = ?auto_428979 ?auto_428981 ) ) ( not ( = ?auto_428979 ?auto_428982 ) ) ( not ( = ?auto_428979 ?auto_428983 ) ) ( not ( = ?auto_428980 ?auto_428981 ) ) ( not ( = ?auto_428980 ?auto_428982 ) ) ( not ( = ?auto_428980 ?auto_428983 ) ) ( not ( = ?auto_428981 ?auto_428982 ) ) ( not ( = ?auto_428981 ?auto_428983 ) ) ( not ( = ?auto_428982 ?auto_428983 ) ) ( ON ?auto_428981 ?auto_428982 ) ( ON ?auto_428980 ?auto_428981 ) ( ON ?auto_428979 ?auto_428980 ) ( CLEAR ?auto_428977 ) ( ON ?auto_428978 ?auto_428979 ) ( CLEAR ?auto_428978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428976 ?auto_428977 ?auto_428978 )
      ( MAKE-7PILE ?auto_428976 ?auto_428977 ?auto_428978 ?auto_428979 ?auto_428980 ?auto_428981 ?auto_428982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428991 - BLOCK
      ?auto_428992 - BLOCK
      ?auto_428993 - BLOCK
      ?auto_428994 - BLOCK
      ?auto_428995 - BLOCK
      ?auto_428996 - BLOCK
      ?auto_428997 - BLOCK
    )
    :vars
    (
      ?auto_428998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428997 ?auto_428998 ) ( ON-TABLE ?auto_428991 ) ( not ( = ?auto_428991 ?auto_428992 ) ) ( not ( = ?auto_428991 ?auto_428993 ) ) ( not ( = ?auto_428991 ?auto_428994 ) ) ( not ( = ?auto_428991 ?auto_428995 ) ) ( not ( = ?auto_428991 ?auto_428996 ) ) ( not ( = ?auto_428991 ?auto_428997 ) ) ( not ( = ?auto_428991 ?auto_428998 ) ) ( not ( = ?auto_428992 ?auto_428993 ) ) ( not ( = ?auto_428992 ?auto_428994 ) ) ( not ( = ?auto_428992 ?auto_428995 ) ) ( not ( = ?auto_428992 ?auto_428996 ) ) ( not ( = ?auto_428992 ?auto_428997 ) ) ( not ( = ?auto_428992 ?auto_428998 ) ) ( not ( = ?auto_428993 ?auto_428994 ) ) ( not ( = ?auto_428993 ?auto_428995 ) ) ( not ( = ?auto_428993 ?auto_428996 ) ) ( not ( = ?auto_428993 ?auto_428997 ) ) ( not ( = ?auto_428993 ?auto_428998 ) ) ( not ( = ?auto_428994 ?auto_428995 ) ) ( not ( = ?auto_428994 ?auto_428996 ) ) ( not ( = ?auto_428994 ?auto_428997 ) ) ( not ( = ?auto_428994 ?auto_428998 ) ) ( not ( = ?auto_428995 ?auto_428996 ) ) ( not ( = ?auto_428995 ?auto_428997 ) ) ( not ( = ?auto_428995 ?auto_428998 ) ) ( not ( = ?auto_428996 ?auto_428997 ) ) ( not ( = ?auto_428996 ?auto_428998 ) ) ( not ( = ?auto_428997 ?auto_428998 ) ) ( ON ?auto_428996 ?auto_428997 ) ( ON ?auto_428995 ?auto_428996 ) ( ON ?auto_428994 ?auto_428995 ) ( ON ?auto_428993 ?auto_428994 ) ( CLEAR ?auto_428991 ) ( ON ?auto_428992 ?auto_428993 ) ( CLEAR ?auto_428992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428991 ?auto_428992 )
      ( MAKE-7PILE ?auto_428991 ?auto_428992 ?auto_428993 ?auto_428994 ?auto_428995 ?auto_428996 ?auto_428997 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_429006 - BLOCK
      ?auto_429007 - BLOCK
      ?auto_429008 - BLOCK
      ?auto_429009 - BLOCK
      ?auto_429010 - BLOCK
      ?auto_429011 - BLOCK
      ?auto_429012 - BLOCK
    )
    :vars
    (
      ?auto_429013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429012 ?auto_429013 ) ( ON-TABLE ?auto_429006 ) ( not ( = ?auto_429006 ?auto_429007 ) ) ( not ( = ?auto_429006 ?auto_429008 ) ) ( not ( = ?auto_429006 ?auto_429009 ) ) ( not ( = ?auto_429006 ?auto_429010 ) ) ( not ( = ?auto_429006 ?auto_429011 ) ) ( not ( = ?auto_429006 ?auto_429012 ) ) ( not ( = ?auto_429006 ?auto_429013 ) ) ( not ( = ?auto_429007 ?auto_429008 ) ) ( not ( = ?auto_429007 ?auto_429009 ) ) ( not ( = ?auto_429007 ?auto_429010 ) ) ( not ( = ?auto_429007 ?auto_429011 ) ) ( not ( = ?auto_429007 ?auto_429012 ) ) ( not ( = ?auto_429007 ?auto_429013 ) ) ( not ( = ?auto_429008 ?auto_429009 ) ) ( not ( = ?auto_429008 ?auto_429010 ) ) ( not ( = ?auto_429008 ?auto_429011 ) ) ( not ( = ?auto_429008 ?auto_429012 ) ) ( not ( = ?auto_429008 ?auto_429013 ) ) ( not ( = ?auto_429009 ?auto_429010 ) ) ( not ( = ?auto_429009 ?auto_429011 ) ) ( not ( = ?auto_429009 ?auto_429012 ) ) ( not ( = ?auto_429009 ?auto_429013 ) ) ( not ( = ?auto_429010 ?auto_429011 ) ) ( not ( = ?auto_429010 ?auto_429012 ) ) ( not ( = ?auto_429010 ?auto_429013 ) ) ( not ( = ?auto_429011 ?auto_429012 ) ) ( not ( = ?auto_429011 ?auto_429013 ) ) ( not ( = ?auto_429012 ?auto_429013 ) ) ( ON ?auto_429011 ?auto_429012 ) ( ON ?auto_429010 ?auto_429011 ) ( ON ?auto_429009 ?auto_429010 ) ( ON ?auto_429008 ?auto_429009 ) ( CLEAR ?auto_429006 ) ( ON ?auto_429007 ?auto_429008 ) ( CLEAR ?auto_429007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429006 ?auto_429007 )
      ( MAKE-7PILE ?auto_429006 ?auto_429007 ?auto_429008 ?auto_429009 ?auto_429010 ?auto_429011 ?auto_429012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_429021 - BLOCK
      ?auto_429022 - BLOCK
      ?auto_429023 - BLOCK
      ?auto_429024 - BLOCK
      ?auto_429025 - BLOCK
      ?auto_429026 - BLOCK
      ?auto_429027 - BLOCK
    )
    :vars
    (
      ?auto_429028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429027 ?auto_429028 ) ( not ( = ?auto_429021 ?auto_429022 ) ) ( not ( = ?auto_429021 ?auto_429023 ) ) ( not ( = ?auto_429021 ?auto_429024 ) ) ( not ( = ?auto_429021 ?auto_429025 ) ) ( not ( = ?auto_429021 ?auto_429026 ) ) ( not ( = ?auto_429021 ?auto_429027 ) ) ( not ( = ?auto_429021 ?auto_429028 ) ) ( not ( = ?auto_429022 ?auto_429023 ) ) ( not ( = ?auto_429022 ?auto_429024 ) ) ( not ( = ?auto_429022 ?auto_429025 ) ) ( not ( = ?auto_429022 ?auto_429026 ) ) ( not ( = ?auto_429022 ?auto_429027 ) ) ( not ( = ?auto_429022 ?auto_429028 ) ) ( not ( = ?auto_429023 ?auto_429024 ) ) ( not ( = ?auto_429023 ?auto_429025 ) ) ( not ( = ?auto_429023 ?auto_429026 ) ) ( not ( = ?auto_429023 ?auto_429027 ) ) ( not ( = ?auto_429023 ?auto_429028 ) ) ( not ( = ?auto_429024 ?auto_429025 ) ) ( not ( = ?auto_429024 ?auto_429026 ) ) ( not ( = ?auto_429024 ?auto_429027 ) ) ( not ( = ?auto_429024 ?auto_429028 ) ) ( not ( = ?auto_429025 ?auto_429026 ) ) ( not ( = ?auto_429025 ?auto_429027 ) ) ( not ( = ?auto_429025 ?auto_429028 ) ) ( not ( = ?auto_429026 ?auto_429027 ) ) ( not ( = ?auto_429026 ?auto_429028 ) ) ( not ( = ?auto_429027 ?auto_429028 ) ) ( ON ?auto_429026 ?auto_429027 ) ( ON ?auto_429025 ?auto_429026 ) ( ON ?auto_429024 ?auto_429025 ) ( ON ?auto_429023 ?auto_429024 ) ( ON ?auto_429022 ?auto_429023 ) ( ON ?auto_429021 ?auto_429022 ) ( CLEAR ?auto_429021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429021 )
      ( MAKE-7PILE ?auto_429021 ?auto_429022 ?auto_429023 ?auto_429024 ?auto_429025 ?auto_429026 ?auto_429027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_429036 - BLOCK
      ?auto_429037 - BLOCK
      ?auto_429038 - BLOCK
      ?auto_429039 - BLOCK
      ?auto_429040 - BLOCK
      ?auto_429041 - BLOCK
      ?auto_429042 - BLOCK
    )
    :vars
    (
      ?auto_429043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429042 ?auto_429043 ) ( not ( = ?auto_429036 ?auto_429037 ) ) ( not ( = ?auto_429036 ?auto_429038 ) ) ( not ( = ?auto_429036 ?auto_429039 ) ) ( not ( = ?auto_429036 ?auto_429040 ) ) ( not ( = ?auto_429036 ?auto_429041 ) ) ( not ( = ?auto_429036 ?auto_429042 ) ) ( not ( = ?auto_429036 ?auto_429043 ) ) ( not ( = ?auto_429037 ?auto_429038 ) ) ( not ( = ?auto_429037 ?auto_429039 ) ) ( not ( = ?auto_429037 ?auto_429040 ) ) ( not ( = ?auto_429037 ?auto_429041 ) ) ( not ( = ?auto_429037 ?auto_429042 ) ) ( not ( = ?auto_429037 ?auto_429043 ) ) ( not ( = ?auto_429038 ?auto_429039 ) ) ( not ( = ?auto_429038 ?auto_429040 ) ) ( not ( = ?auto_429038 ?auto_429041 ) ) ( not ( = ?auto_429038 ?auto_429042 ) ) ( not ( = ?auto_429038 ?auto_429043 ) ) ( not ( = ?auto_429039 ?auto_429040 ) ) ( not ( = ?auto_429039 ?auto_429041 ) ) ( not ( = ?auto_429039 ?auto_429042 ) ) ( not ( = ?auto_429039 ?auto_429043 ) ) ( not ( = ?auto_429040 ?auto_429041 ) ) ( not ( = ?auto_429040 ?auto_429042 ) ) ( not ( = ?auto_429040 ?auto_429043 ) ) ( not ( = ?auto_429041 ?auto_429042 ) ) ( not ( = ?auto_429041 ?auto_429043 ) ) ( not ( = ?auto_429042 ?auto_429043 ) ) ( ON ?auto_429041 ?auto_429042 ) ( ON ?auto_429040 ?auto_429041 ) ( ON ?auto_429039 ?auto_429040 ) ( ON ?auto_429038 ?auto_429039 ) ( ON ?auto_429037 ?auto_429038 ) ( ON ?auto_429036 ?auto_429037 ) ( CLEAR ?auto_429036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429036 )
      ( MAKE-7PILE ?auto_429036 ?auto_429037 ?auto_429038 ?auto_429039 ?auto_429040 ?auto_429041 ?auto_429042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429052 - BLOCK
      ?auto_429053 - BLOCK
      ?auto_429054 - BLOCK
      ?auto_429055 - BLOCK
      ?auto_429056 - BLOCK
      ?auto_429057 - BLOCK
      ?auto_429058 - BLOCK
      ?auto_429059 - BLOCK
    )
    :vars
    (
      ?auto_429060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429058 ) ( ON ?auto_429059 ?auto_429060 ) ( CLEAR ?auto_429059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429052 ) ( ON ?auto_429053 ?auto_429052 ) ( ON ?auto_429054 ?auto_429053 ) ( ON ?auto_429055 ?auto_429054 ) ( ON ?auto_429056 ?auto_429055 ) ( ON ?auto_429057 ?auto_429056 ) ( ON ?auto_429058 ?auto_429057 ) ( not ( = ?auto_429052 ?auto_429053 ) ) ( not ( = ?auto_429052 ?auto_429054 ) ) ( not ( = ?auto_429052 ?auto_429055 ) ) ( not ( = ?auto_429052 ?auto_429056 ) ) ( not ( = ?auto_429052 ?auto_429057 ) ) ( not ( = ?auto_429052 ?auto_429058 ) ) ( not ( = ?auto_429052 ?auto_429059 ) ) ( not ( = ?auto_429052 ?auto_429060 ) ) ( not ( = ?auto_429053 ?auto_429054 ) ) ( not ( = ?auto_429053 ?auto_429055 ) ) ( not ( = ?auto_429053 ?auto_429056 ) ) ( not ( = ?auto_429053 ?auto_429057 ) ) ( not ( = ?auto_429053 ?auto_429058 ) ) ( not ( = ?auto_429053 ?auto_429059 ) ) ( not ( = ?auto_429053 ?auto_429060 ) ) ( not ( = ?auto_429054 ?auto_429055 ) ) ( not ( = ?auto_429054 ?auto_429056 ) ) ( not ( = ?auto_429054 ?auto_429057 ) ) ( not ( = ?auto_429054 ?auto_429058 ) ) ( not ( = ?auto_429054 ?auto_429059 ) ) ( not ( = ?auto_429054 ?auto_429060 ) ) ( not ( = ?auto_429055 ?auto_429056 ) ) ( not ( = ?auto_429055 ?auto_429057 ) ) ( not ( = ?auto_429055 ?auto_429058 ) ) ( not ( = ?auto_429055 ?auto_429059 ) ) ( not ( = ?auto_429055 ?auto_429060 ) ) ( not ( = ?auto_429056 ?auto_429057 ) ) ( not ( = ?auto_429056 ?auto_429058 ) ) ( not ( = ?auto_429056 ?auto_429059 ) ) ( not ( = ?auto_429056 ?auto_429060 ) ) ( not ( = ?auto_429057 ?auto_429058 ) ) ( not ( = ?auto_429057 ?auto_429059 ) ) ( not ( = ?auto_429057 ?auto_429060 ) ) ( not ( = ?auto_429058 ?auto_429059 ) ) ( not ( = ?auto_429058 ?auto_429060 ) ) ( not ( = ?auto_429059 ?auto_429060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429059 ?auto_429060 )
      ( !STACK ?auto_429059 ?auto_429058 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429069 - BLOCK
      ?auto_429070 - BLOCK
      ?auto_429071 - BLOCK
      ?auto_429072 - BLOCK
      ?auto_429073 - BLOCK
      ?auto_429074 - BLOCK
      ?auto_429075 - BLOCK
      ?auto_429076 - BLOCK
    )
    :vars
    (
      ?auto_429077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429075 ) ( ON ?auto_429076 ?auto_429077 ) ( CLEAR ?auto_429076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429069 ) ( ON ?auto_429070 ?auto_429069 ) ( ON ?auto_429071 ?auto_429070 ) ( ON ?auto_429072 ?auto_429071 ) ( ON ?auto_429073 ?auto_429072 ) ( ON ?auto_429074 ?auto_429073 ) ( ON ?auto_429075 ?auto_429074 ) ( not ( = ?auto_429069 ?auto_429070 ) ) ( not ( = ?auto_429069 ?auto_429071 ) ) ( not ( = ?auto_429069 ?auto_429072 ) ) ( not ( = ?auto_429069 ?auto_429073 ) ) ( not ( = ?auto_429069 ?auto_429074 ) ) ( not ( = ?auto_429069 ?auto_429075 ) ) ( not ( = ?auto_429069 ?auto_429076 ) ) ( not ( = ?auto_429069 ?auto_429077 ) ) ( not ( = ?auto_429070 ?auto_429071 ) ) ( not ( = ?auto_429070 ?auto_429072 ) ) ( not ( = ?auto_429070 ?auto_429073 ) ) ( not ( = ?auto_429070 ?auto_429074 ) ) ( not ( = ?auto_429070 ?auto_429075 ) ) ( not ( = ?auto_429070 ?auto_429076 ) ) ( not ( = ?auto_429070 ?auto_429077 ) ) ( not ( = ?auto_429071 ?auto_429072 ) ) ( not ( = ?auto_429071 ?auto_429073 ) ) ( not ( = ?auto_429071 ?auto_429074 ) ) ( not ( = ?auto_429071 ?auto_429075 ) ) ( not ( = ?auto_429071 ?auto_429076 ) ) ( not ( = ?auto_429071 ?auto_429077 ) ) ( not ( = ?auto_429072 ?auto_429073 ) ) ( not ( = ?auto_429072 ?auto_429074 ) ) ( not ( = ?auto_429072 ?auto_429075 ) ) ( not ( = ?auto_429072 ?auto_429076 ) ) ( not ( = ?auto_429072 ?auto_429077 ) ) ( not ( = ?auto_429073 ?auto_429074 ) ) ( not ( = ?auto_429073 ?auto_429075 ) ) ( not ( = ?auto_429073 ?auto_429076 ) ) ( not ( = ?auto_429073 ?auto_429077 ) ) ( not ( = ?auto_429074 ?auto_429075 ) ) ( not ( = ?auto_429074 ?auto_429076 ) ) ( not ( = ?auto_429074 ?auto_429077 ) ) ( not ( = ?auto_429075 ?auto_429076 ) ) ( not ( = ?auto_429075 ?auto_429077 ) ) ( not ( = ?auto_429076 ?auto_429077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429076 ?auto_429077 )
      ( !STACK ?auto_429076 ?auto_429075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429086 - BLOCK
      ?auto_429087 - BLOCK
      ?auto_429088 - BLOCK
      ?auto_429089 - BLOCK
      ?auto_429090 - BLOCK
      ?auto_429091 - BLOCK
      ?auto_429092 - BLOCK
      ?auto_429093 - BLOCK
    )
    :vars
    (
      ?auto_429094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429093 ?auto_429094 ) ( ON-TABLE ?auto_429086 ) ( ON ?auto_429087 ?auto_429086 ) ( ON ?auto_429088 ?auto_429087 ) ( ON ?auto_429089 ?auto_429088 ) ( ON ?auto_429090 ?auto_429089 ) ( ON ?auto_429091 ?auto_429090 ) ( not ( = ?auto_429086 ?auto_429087 ) ) ( not ( = ?auto_429086 ?auto_429088 ) ) ( not ( = ?auto_429086 ?auto_429089 ) ) ( not ( = ?auto_429086 ?auto_429090 ) ) ( not ( = ?auto_429086 ?auto_429091 ) ) ( not ( = ?auto_429086 ?auto_429092 ) ) ( not ( = ?auto_429086 ?auto_429093 ) ) ( not ( = ?auto_429086 ?auto_429094 ) ) ( not ( = ?auto_429087 ?auto_429088 ) ) ( not ( = ?auto_429087 ?auto_429089 ) ) ( not ( = ?auto_429087 ?auto_429090 ) ) ( not ( = ?auto_429087 ?auto_429091 ) ) ( not ( = ?auto_429087 ?auto_429092 ) ) ( not ( = ?auto_429087 ?auto_429093 ) ) ( not ( = ?auto_429087 ?auto_429094 ) ) ( not ( = ?auto_429088 ?auto_429089 ) ) ( not ( = ?auto_429088 ?auto_429090 ) ) ( not ( = ?auto_429088 ?auto_429091 ) ) ( not ( = ?auto_429088 ?auto_429092 ) ) ( not ( = ?auto_429088 ?auto_429093 ) ) ( not ( = ?auto_429088 ?auto_429094 ) ) ( not ( = ?auto_429089 ?auto_429090 ) ) ( not ( = ?auto_429089 ?auto_429091 ) ) ( not ( = ?auto_429089 ?auto_429092 ) ) ( not ( = ?auto_429089 ?auto_429093 ) ) ( not ( = ?auto_429089 ?auto_429094 ) ) ( not ( = ?auto_429090 ?auto_429091 ) ) ( not ( = ?auto_429090 ?auto_429092 ) ) ( not ( = ?auto_429090 ?auto_429093 ) ) ( not ( = ?auto_429090 ?auto_429094 ) ) ( not ( = ?auto_429091 ?auto_429092 ) ) ( not ( = ?auto_429091 ?auto_429093 ) ) ( not ( = ?auto_429091 ?auto_429094 ) ) ( not ( = ?auto_429092 ?auto_429093 ) ) ( not ( = ?auto_429092 ?auto_429094 ) ) ( not ( = ?auto_429093 ?auto_429094 ) ) ( CLEAR ?auto_429091 ) ( ON ?auto_429092 ?auto_429093 ) ( CLEAR ?auto_429092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429086 ?auto_429087 ?auto_429088 ?auto_429089 ?auto_429090 ?auto_429091 ?auto_429092 )
      ( MAKE-8PILE ?auto_429086 ?auto_429087 ?auto_429088 ?auto_429089 ?auto_429090 ?auto_429091 ?auto_429092 ?auto_429093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429103 - BLOCK
      ?auto_429104 - BLOCK
      ?auto_429105 - BLOCK
      ?auto_429106 - BLOCK
      ?auto_429107 - BLOCK
      ?auto_429108 - BLOCK
      ?auto_429109 - BLOCK
      ?auto_429110 - BLOCK
    )
    :vars
    (
      ?auto_429111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429110 ?auto_429111 ) ( ON-TABLE ?auto_429103 ) ( ON ?auto_429104 ?auto_429103 ) ( ON ?auto_429105 ?auto_429104 ) ( ON ?auto_429106 ?auto_429105 ) ( ON ?auto_429107 ?auto_429106 ) ( ON ?auto_429108 ?auto_429107 ) ( not ( = ?auto_429103 ?auto_429104 ) ) ( not ( = ?auto_429103 ?auto_429105 ) ) ( not ( = ?auto_429103 ?auto_429106 ) ) ( not ( = ?auto_429103 ?auto_429107 ) ) ( not ( = ?auto_429103 ?auto_429108 ) ) ( not ( = ?auto_429103 ?auto_429109 ) ) ( not ( = ?auto_429103 ?auto_429110 ) ) ( not ( = ?auto_429103 ?auto_429111 ) ) ( not ( = ?auto_429104 ?auto_429105 ) ) ( not ( = ?auto_429104 ?auto_429106 ) ) ( not ( = ?auto_429104 ?auto_429107 ) ) ( not ( = ?auto_429104 ?auto_429108 ) ) ( not ( = ?auto_429104 ?auto_429109 ) ) ( not ( = ?auto_429104 ?auto_429110 ) ) ( not ( = ?auto_429104 ?auto_429111 ) ) ( not ( = ?auto_429105 ?auto_429106 ) ) ( not ( = ?auto_429105 ?auto_429107 ) ) ( not ( = ?auto_429105 ?auto_429108 ) ) ( not ( = ?auto_429105 ?auto_429109 ) ) ( not ( = ?auto_429105 ?auto_429110 ) ) ( not ( = ?auto_429105 ?auto_429111 ) ) ( not ( = ?auto_429106 ?auto_429107 ) ) ( not ( = ?auto_429106 ?auto_429108 ) ) ( not ( = ?auto_429106 ?auto_429109 ) ) ( not ( = ?auto_429106 ?auto_429110 ) ) ( not ( = ?auto_429106 ?auto_429111 ) ) ( not ( = ?auto_429107 ?auto_429108 ) ) ( not ( = ?auto_429107 ?auto_429109 ) ) ( not ( = ?auto_429107 ?auto_429110 ) ) ( not ( = ?auto_429107 ?auto_429111 ) ) ( not ( = ?auto_429108 ?auto_429109 ) ) ( not ( = ?auto_429108 ?auto_429110 ) ) ( not ( = ?auto_429108 ?auto_429111 ) ) ( not ( = ?auto_429109 ?auto_429110 ) ) ( not ( = ?auto_429109 ?auto_429111 ) ) ( not ( = ?auto_429110 ?auto_429111 ) ) ( CLEAR ?auto_429108 ) ( ON ?auto_429109 ?auto_429110 ) ( CLEAR ?auto_429109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429103 ?auto_429104 ?auto_429105 ?auto_429106 ?auto_429107 ?auto_429108 ?auto_429109 )
      ( MAKE-8PILE ?auto_429103 ?auto_429104 ?auto_429105 ?auto_429106 ?auto_429107 ?auto_429108 ?auto_429109 ?auto_429110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429120 - BLOCK
      ?auto_429121 - BLOCK
      ?auto_429122 - BLOCK
      ?auto_429123 - BLOCK
      ?auto_429124 - BLOCK
      ?auto_429125 - BLOCK
      ?auto_429126 - BLOCK
      ?auto_429127 - BLOCK
    )
    :vars
    (
      ?auto_429128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429127 ?auto_429128 ) ( ON-TABLE ?auto_429120 ) ( ON ?auto_429121 ?auto_429120 ) ( ON ?auto_429122 ?auto_429121 ) ( ON ?auto_429123 ?auto_429122 ) ( ON ?auto_429124 ?auto_429123 ) ( not ( = ?auto_429120 ?auto_429121 ) ) ( not ( = ?auto_429120 ?auto_429122 ) ) ( not ( = ?auto_429120 ?auto_429123 ) ) ( not ( = ?auto_429120 ?auto_429124 ) ) ( not ( = ?auto_429120 ?auto_429125 ) ) ( not ( = ?auto_429120 ?auto_429126 ) ) ( not ( = ?auto_429120 ?auto_429127 ) ) ( not ( = ?auto_429120 ?auto_429128 ) ) ( not ( = ?auto_429121 ?auto_429122 ) ) ( not ( = ?auto_429121 ?auto_429123 ) ) ( not ( = ?auto_429121 ?auto_429124 ) ) ( not ( = ?auto_429121 ?auto_429125 ) ) ( not ( = ?auto_429121 ?auto_429126 ) ) ( not ( = ?auto_429121 ?auto_429127 ) ) ( not ( = ?auto_429121 ?auto_429128 ) ) ( not ( = ?auto_429122 ?auto_429123 ) ) ( not ( = ?auto_429122 ?auto_429124 ) ) ( not ( = ?auto_429122 ?auto_429125 ) ) ( not ( = ?auto_429122 ?auto_429126 ) ) ( not ( = ?auto_429122 ?auto_429127 ) ) ( not ( = ?auto_429122 ?auto_429128 ) ) ( not ( = ?auto_429123 ?auto_429124 ) ) ( not ( = ?auto_429123 ?auto_429125 ) ) ( not ( = ?auto_429123 ?auto_429126 ) ) ( not ( = ?auto_429123 ?auto_429127 ) ) ( not ( = ?auto_429123 ?auto_429128 ) ) ( not ( = ?auto_429124 ?auto_429125 ) ) ( not ( = ?auto_429124 ?auto_429126 ) ) ( not ( = ?auto_429124 ?auto_429127 ) ) ( not ( = ?auto_429124 ?auto_429128 ) ) ( not ( = ?auto_429125 ?auto_429126 ) ) ( not ( = ?auto_429125 ?auto_429127 ) ) ( not ( = ?auto_429125 ?auto_429128 ) ) ( not ( = ?auto_429126 ?auto_429127 ) ) ( not ( = ?auto_429126 ?auto_429128 ) ) ( not ( = ?auto_429127 ?auto_429128 ) ) ( ON ?auto_429126 ?auto_429127 ) ( CLEAR ?auto_429124 ) ( ON ?auto_429125 ?auto_429126 ) ( CLEAR ?auto_429125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429120 ?auto_429121 ?auto_429122 ?auto_429123 ?auto_429124 ?auto_429125 )
      ( MAKE-8PILE ?auto_429120 ?auto_429121 ?auto_429122 ?auto_429123 ?auto_429124 ?auto_429125 ?auto_429126 ?auto_429127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429137 - BLOCK
      ?auto_429138 - BLOCK
      ?auto_429139 - BLOCK
      ?auto_429140 - BLOCK
      ?auto_429141 - BLOCK
      ?auto_429142 - BLOCK
      ?auto_429143 - BLOCK
      ?auto_429144 - BLOCK
    )
    :vars
    (
      ?auto_429145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429144 ?auto_429145 ) ( ON-TABLE ?auto_429137 ) ( ON ?auto_429138 ?auto_429137 ) ( ON ?auto_429139 ?auto_429138 ) ( ON ?auto_429140 ?auto_429139 ) ( ON ?auto_429141 ?auto_429140 ) ( not ( = ?auto_429137 ?auto_429138 ) ) ( not ( = ?auto_429137 ?auto_429139 ) ) ( not ( = ?auto_429137 ?auto_429140 ) ) ( not ( = ?auto_429137 ?auto_429141 ) ) ( not ( = ?auto_429137 ?auto_429142 ) ) ( not ( = ?auto_429137 ?auto_429143 ) ) ( not ( = ?auto_429137 ?auto_429144 ) ) ( not ( = ?auto_429137 ?auto_429145 ) ) ( not ( = ?auto_429138 ?auto_429139 ) ) ( not ( = ?auto_429138 ?auto_429140 ) ) ( not ( = ?auto_429138 ?auto_429141 ) ) ( not ( = ?auto_429138 ?auto_429142 ) ) ( not ( = ?auto_429138 ?auto_429143 ) ) ( not ( = ?auto_429138 ?auto_429144 ) ) ( not ( = ?auto_429138 ?auto_429145 ) ) ( not ( = ?auto_429139 ?auto_429140 ) ) ( not ( = ?auto_429139 ?auto_429141 ) ) ( not ( = ?auto_429139 ?auto_429142 ) ) ( not ( = ?auto_429139 ?auto_429143 ) ) ( not ( = ?auto_429139 ?auto_429144 ) ) ( not ( = ?auto_429139 ?auto_429145 ) ) ( not ( = ?auto_429140 ?auto_429141 ) ) ( not ( = ?auto_429140 ?auto_429142 ) ) ( not ( = ?auto_429140 ?auto_429143 ) ) ( not ( = ?auto_429140 ?auto_429144 ) ) ( not ( = ?auto_429140 ?auto_429145 ) ) ( not ( = ?auto_429141 ?auto_429142 ) ) ( not ( = ?auto_429141 ?auto_429143 ) ) ( not ( = ?auto_429141 ?auto_429144 ) ) ( not ( = ?auto_429141 ?auto_429145 ) ) ( not ( = ?auto_429142 ?auto_429143 ) ) ( not ( = ?auto_429142 ?auto_429144 ) ) ( not ( = ?auto_429142 ?auto_429145 ) ) ( not ( = ?auto_429143 ?auto_429144 ) ) ( not ( = ?auto_429143 ?auto_429145 ) ) ( not ( = ?auto_429144 ?auto_429145 ) ) ( ON ?auto_429143 ?auto_429144 ) ( CLEAR ?auto_429141 ) ( ON ?auto_429142 ?auto_429143 ) ( CLEAR ?auto_429142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429137 ?auto_429138 ?auto_429139 ?auto_429140 ?auto_429141 ?auto_429142 )
      ( MAKE-8PILE ?auto_429137 ?auto_429138 ?auto_429139 ?auto_429140 ?auto_429141 ?auto_429142 ?auto_429143 ?auto_429144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429154 - BLOCK
      ?auto_429155 - BLOCK
      ?auto_429156 - BLOCK
      ?auto_429157 - BLOCK
      ?auto_429158 - BLOCK
      ?auto_429159 - BLOCK
      ?auto_429160 - BLOCK
      ?auto_429161 - BLOCK
    )
    :vars
    (
      ?auto_429162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429161 ?auto_429162 ) ( ON-TABLE ?auto_429154 ) ( ON ?auto_429155 ?auto_429154 ) ( ON ?auto_429156 ?auto_429155 ) ( ON ?auto_429157 ?auto_429156 ) ( not ( = ?auto_429154 ?auto_429155 ) ) ( not ( = ?auto_429154 ?auto_429156 ) ) ( not ( = ?auto_429154 ?auto_429157 ) ) ( not ( = ?auto_429154 ?auto_429158 ) ) ( not ( = ?auto_429154 ?auto_429159 ) ) ( not ( = ?auto_429154 ?auto_429160 ) ) ( not ( = ?auto_429154 ?auto_429161 ) ) ( not ( = ?auto_429154 ?auto_429162 ) ) ( not ( = ?auto_429155 ?auto_429156 ) ) ( not ( = ?auto_429155 ?auto_429157 ) ) ( not ( = ?auto_429155 ?auto_429158 ) ) ( not ( = ?auto_429155 ?auto_429159 ) ) ( not ( = ?auto_429155 ?auto_429160 ) ) ( not ( = ?auto_429155 ?auto_429161 ) ) ( not ( = ?auto_429155 ?auto_429162 ) ) ( not ( = ?auto_429156 ?auto_429157 ) ) ( not ( = ?auto_429156 ?auto_429158 ) ) ( not ( = ?auto_429156 ?auto_429159 ) ) ( not ( = ?auto_429156 ?auto_429160 ) ) ( not ( = ?auto_429156 ?auto_429161 ) ) ( not ( = ?auto_429156 ?auto_429162 ) ) ( not ( = ?auto_429157 ?auto_429158 ) ) ( not ( = ?auto_429157 ?auto_429159 ) ) ( not ( = ?auto_429157 ?auto_429160 ) ) ( not ( = ?auto_429157 ?auto_429161 ) ) ( not ( = ?auto_429157 ?auto_429162 ) ) ( not ( = ?auto_429158 ?auto_429159 ) ) ( not ( = ?auto_429158 ?auto_429160 ) ) ( not ( = ?auto_429158 ?auto_429161 ) ) ( not ( = ?auto_429158 ?auto_429162 ) ) ( not ( = ?auto_429159 ?auto_429160 ) ) ( not ( = ?auto_429159 ?auto_429161 ) ) ( not ( = ?auto_429159 ?auto_429162 ) ) ( not ( = ?auto_429160 ?auto_429161 ) ) ( not ( = ?auto_429160 ?auto_429162 ) ) ( not ( = ?auto_429161 ?auto_429162 ) ) ( ON ?auto_429160 ?auto_429161 ) ( ON ?auto_429159 ?auto_429160 ) ( CLEAR ?auto_429157 ) ( ON ?auto_429158 ?auto_429159 ) ( CLEAR ?auto_429158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429154 ?auto_429155 ?auto_429156 ?auto_429157 ?auto_429158 )
      ( MAKE-8PILE ?auto_429154 ?auto_429155 ?auto_429156 ?auto_429157 ?auto_429158 ?auto_429159 ?auto_429160 ?auto_429161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429171 - BLOCK
      ?auto_429172 - BLOCK
      ?auto_429173 - BLOCK
      ?auto_429174 - BLOCK
      ?auto_429175 - BLOCK
      ?auto_429176 - BLOCK
      ?auto_429177 - BLOCK
      ?auto_429178 - BLOCK
    )
    :vars
    (
      ?auto_429179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429178 ?auto_429179 ) ( ON-TABLE ?auto_429171 ) ( ON ?auto_429172 ?auto_429171 ) ( ON ?auto_429173 ?auto_429172 ) ( ON ?auto_429174 ?auto_429173 ) ( not ( = ?auto_429171 ?auto_429172 ) ) ( not ( = ?auto_429171 ?auto_429173 ) ) ( not ( = ?auto_429171 ?auto_429174 ) ) ( not ( = ?auto_429171 ?auto_429175 ) ) ( not ( = ?auto_429171 ?auto_429176 ) ) ( not ( = ?auto_429171 ?auto_429177 ) ) ( not ( = ?auto_429171 ?auto_429178 ) ) ( not ( = ?auto_429171 ?auto_429179 ) ) ( not ( = ?auto_429172 ?auto_429173 ) ) ( not ( = ?auto_429172 ?auto_429174 ) ) ( not ( = ?auto_429172 ?auto_429175 ) ) ( not ( = ?auto_429172 ?auto_429176 ) ) ( not ( = ?auto_429172 ?auto_429177 ) ) ( not ( = ?auto_429172 ?auto_429178 ) ) ( not ( = ?auto_429172 ?auto_429179 ) ) ( not ( = ?auto_429173 ?auto_429174 ) ) ( not ( = ?auto_429173 ?auto_429175 ) ) ( not ( = ?auto_429173 ?auto_429176 ) ) ( not ( = ?auto_429173 ?auto_429177 ) ) ( not ( = ?auto_429173 ?auto_429178 ) ) ( not ( = ?auto_429173 ?auto_429179 ) ) ( not ( = ?auto_429174 ?auto_429175 ) ) ( not ( = ?auto_429174 ?auto_429176 ) ) ( not ( = ?auto_429174 ?auto_429177 ) ) ( not ( = ?auto_429174 ?auto_429178 ) ) ( not ( = ?auto_429174 ?auto_429179 ) ) ( not ( = ?auto_429175 ?auto_429176 ) ) ( not ( = ?auto_429175 ?auto_429177 ) ) ( not ( = ?auto_429175 ?auto_429178 ) ) ( not ( = ?auto_429175 ?auto_429179 ) ) ( not ( = ?auto_429176 ?auto_429177 ) ) ( not ( = ?auto_429176 ?auto_429178 ) ) ( not ( = ?auto_429176 ?auto_429179 ) ) ( not ( = ?auto_429177 ?auto_429178 ) ) ( not ( = ?auto_429177 ?auto_429179 ) ) ( not ( = ?auto_429178 ?auto_429179 ) ) ( ON ?auto_429177 ?auto_429178 ) ( ON ?auto_429176 ?auto_429177 ) ( CLEAR ?auto_429174 ) ( ON ?auto_429175 ?auto_429176 ) ( CLEAR ?auto_429175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429171 ?auto_429172 ?auto_429173 ?auto_429174 ?auto_429175 )
      ( MAKE-8PILE ?auto_429171 ?auto_429172 ?auto_429173 ?auto_429174 ?auto_429175 ?auto_429176 ?auto_429177 ?auto_429178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429188 - BLOCK
      ?auto_429189 - BLOCK
      ?auto_429190 - BLOCK
      ?auto_429191 - BLOCK
      ?auto_429192 - BLOCK
      ?auto_429193 - BLOCK
      ?auto_429194 - BLOCK
      ?auto_429195 - BLOCK
    )
    :vars
    (
      ?auto_429196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429195 ?auto_429196 ) ( ON-TABLE ?auto_429188 ) ( ON ?auto_429189 ?auto_429188 ) ( ON ?auto_429190 ?auto_429189 ) ( not ( = ?auto_429188 ?auto_429189 ) ) ( not ( = ?auto_429188 ?auto_429190 ) ) ( not ( = ?auto_429188 ?auto_429191 ) ) ( not ( = ?auto_429188 ?auto_429192 ) ) ( not ( = ?auto_429188 ?auto_429193 ) ) ( not ( = ?auto_429188 ?auto_429194 ) ) ( not ( = ?auto_429188 ?auto_429195 ) ) ( not ( = ?auto_429188 ?auto_429196 ) ) ( not ( = ?auto_429189 ?auto_429190 ) ) ( not ( = ?auto_429189 ?auto_429191 ) ) ( not ( = ?auto_429189 ?auto_429192 ) ) ( not ( = ?auto_429189 ?auto_429193 ) ) ( not ( = ?auto_429189 ?auto_429194 ) ) ( not ( = ?auto_429189 ?auto_429195 ) ) ( not ( = ?auto_429189 ?auto_429196 ) ) ( not ( = ?auto_429190 ?auto_429191 ) ) ( not ( = ?auto_429190 ?auto_429192 ) ) ( not ( = ?auto_429190 ?auto_429193 ) ) ( not ( = ?auto_429190 ?auto_429194 ) ) ( not ( = ?auto_429190 ?auto_429195 ) ) ( not ( = ?auto_429190 ?auto_429196 ) ) ( not ( = ?auto_429191 ?auto_429192 ) ) ( not ( = ?auto_429191 ?auto_429193 ) ) ( not ( = ?auto_429191 ?auto_429194 ) ) ( not ( = ?auto_429191 ?auto_429195 ) ) ( not ( = ?auto_429191 ?auto_429196 ) ) ( not ( = ?auto_429192 ?auto_429193 ) ) ( not ( = ?auto_429192 ?auto_429194 ) ) ( not ( = ?auto_429192 ?auto_429195 ) ) ( not ( = ?auto_429192 ?auto_429196 ) ) ( not ( = ?auto_429193 ?auto_429194 ) ) ( not ( = ?auto_429193 ?auto_429195 ) ) ( not ( = ?auto_429193 ?auto_429196 ) ) ( not ( = ?auto_429194 ?auto_429195 ) ) ( not ( = ?auto_429194 ?auto_429196 ) ) ( not ( = ?auto_429195 ?auto_429196 ) ) ( ON ?auto_429194 ?auto_429195 ) ( ON ?auto_429193 ?auto_429194 ) ( ON ?auto_429192 ?auto_429193 ) ( CLEAR ?auto_429190 ) ( ON ?auto_429191 ?auto_429192 ) ( CLEAR ?auto_429191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429188 ?auto_429189 ?auto_429190 ?auto_429191 )
      ( MAKE-8PILE ?auto_429188 ?auto_429189 ?auto_429190 ?auto_429191 ?auto_429192 ?auto_429193 ?auto_429194 ?auto_429195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429205 - BLOCK
      ?auto_429206 - BLOCK
      ?auto_429207 - BLOCK
      ?auto_429208 - BLOCK
      ?auto_429209 - BLOCK
      ?auto_429210 - BLOCK
      ?auto_429211 - BLOCK
      ?auto_429212 - BLOCK
    )
    :vars
    (
      ?auto_429213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429212 ?auto_429213 ) ( ON-TABLE ?auto_429205 ) ( ON ?auto_429206 ?auto_429205 ) ( ON ?auto_429207 ?auto_429206 ) ( not ( = ?auto_429205 ?auto_429206 ) ) ( not ( = ?auto_429205 ?auto_429207 ) ) ( not ( = ?auto_429205 ?auto_429208 ) ) ( not ( = ?auto_429205 ?auto_429209 ) ) ( not ( = ?auto_429205 ?auto_429210 ) ) ( not ( = ?auto_429205 ?auto_429211 ) ) ( not ( = ?auto_429205 ?auto_429212 ) ) ( not ( = ?auto_429205 ?auto_429213 ) ) ( not ( = ?auto_429206 ?auto_429207 ) ) ( not ( = ?auto_429206 ?auto_429208 ) ) ( not ( = ?auto_429206 ?auto_429209 ) ) ( not ( = ?auto_429206 ?auto_429210 ) ) ( not ( = ?auto_429206 ?auto_429211 ) ) ( not ( = ?auto_429206 ?auto_429212 ) ) ( not ( = ?auto_429206 ?auto_429213 ) ) ( not ( = ?auto_429207 ?auto_429208 ) ) ( not ( = ?auto_429207 ?auto_429209 ) ) ( not ( = ?auto_429207 ?auto_429210 ) ) ( not ( = ?auto_429207 ?auto_429211 ) ) ( not ( = ?auto_429207 ?auto_429212 ) ) ( not ( = ?auto_429207 ?auto_429213 ) ) ( not ( = ?auto_429208 ?auto_429209 ) ) ( not ( = ?auto_429208 ?auto_429210 ) ) ( not ( = ?auto_429208 ?auto_429211 ) ) ( not ( = ?auto_429208 ?auto_429212 ) ) ( not ( = ?auto_429208 ?auto_429213 ) ) ( not ( = ?auto_429209 ?auto_429210 ) ) ( not ( = ?auto_429209 ?auto_429211 ) ) ( not ( = ?auto_429209 ?auto_429212 ) ) ( not ( = ?auto_429209 ?auto_429213 ) ) ( not ( = ?auto_429210 ?auto_429211 ) ) ( not ( = ?auto_429210 ?auto_429212 ) ) ( not ( = ?auto_429210 ?auto_429213 ) ) ( not ( = ?auto_429211 ?auto_429212 ) ) ( not ( = ?auto_429211 ?auto_429213 ) ) ( not ( = ?auto_429212 ?auto_429213 ) ) ( ON ?auto_429211 ?auto_429212 ) ( ON ?auto_429210 ?auto_429211 ) ( ON ?auto_429209 ?auto_429210 ) ( CLEAR ?auto_429207 ) ( ON ?auto_429208 ?auto_429209 ) ( CLEAR ?auto_429208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429205 ?auto_429206 ?auto_429207 ?auto_429208 )
      ( MAKE-8PILE ?auto_429205 ?auto_429206 ?auto_429207 ?auto_429208 ?auto_429209 ?auto_429210 ?auto_429211 ?auto_429212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429222 - BLOCK
      ?auto_429223 - BLOCK
      ?auto_429224 - BLOCK
      ?auto_429225 - BLOCK
      ?auto_429226 - BLOCK
      ?auto_429227 - BLOCK
      ?auto_429228 - BLOCK
      ?auto_429229 - BLOCK
    )
    :vars
    (
      ?auto_429230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429229 ?auto_429230 ) ( ON-TABLE ?auto_429222 ) ( ON ?auto_429223 ?auto_429222 ) ( not ( = ?auto_429222 ?auto_429223 ) ) ( not ( = ?auto_429222 ?auto_429224 ) ) ( not ( = ?auto_429222 ?auto_429225 ) ) ( not ( = ?auto_429222 ?auto_429226 ) ) ( not ( = ?auto_429222 ?auto_429227 ) ) ( not ( = ?auto_429222 ?auto_429228 ) ) ( not ( = ?auto_429222 ?auto_429229 ) ) ( not ( = ?auto_429222 ?auto_429230 ) ) ( not ( = ?auto_429223 ?auto_429224 ) ) ( not ( = ?auto_429223 ?auto_429225 ) ) ( not ( = ?auto_429223 ?auto_429226 ) ) ( not ( = ?auto_429223 ?auto_429227 ) ) ( not ( = ?auto_429223 ?auto_429228 ) ) ( not ( = ?auto_429223 ?auto_429229 ) ) ( not ( = ?auto_429223 ?auto_429230 ) ) ( not ( = ?auto_429224 ?auto_429225 ) ) ( not ( = ?auto_429224 ?auto_429226 ) ) ( not ( = ?auto_429224 ?auto_429227 ) ) ( not ( = ?auto_429224 ?auto_429228 ) ) ( not ( = ?auto_429224 ?auto_429229 ) ) ( not ( = ?auto_429224 ?auto_429230 ) ) ( not ( = ?auto_429225 ?auto_429226 ) ) ( not ( = ?auto_429225 ?auto_429227 ) ) ( not ( = ?auto_429225 ?auto_429228 ) ) ( not ( = ?auto_429225 ?auto_429229 ) ) ( not ( = ?auto_429225 ?auto_429230 ) ) ( not ( = ?auto_429226 ?auto_429227 ) ) ( not ( = ?auto_429226 ?auto_429228 ) ) ( not ( = ?auto_429226 ?auto_429229 ) ) ( not ( = ?auto_429226 ?auto_429230 ) ) ( not ( = ?auto_429227 ?auto_429228 ) ) ( not ( = ?auto_429227 ?auto_429229 ) ) ( not ( = ?auto_429227 ?auto_429230 ) ) ( not ( = ?auto_429228 ?auto_429229 ) ) ( not ( = ?auto_429228 ?auto_429230 ) ) ( not ( = ?auto_429229 ?auto_429230 ) ) ( ON ?auto_429228 ?auto_429229 ) ( ON ?auto_429227 ?auto_429228 ) ( ON ?auto_429226 ?auto_429227 ) ( ON ?auto_429225 ?auto_429226 ) ( CLEAR ?auto_429223 ) ( ON ?auto_429224 ?auto_429225 ) ( CLEAR ?auto_429224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429222 ?auto_429223 ?auto_429224 )
      ( MAKE-8PILE ?auto_429222 ?auto_429223 ?auto_429224 ?auto_429225 ?auto_429226 ?auto_429227 ?auto_429228 ?auto_429229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429239 - BLOCK
      ?auto_429240 - BLOCK
      ?auto_429241 - BLOCK
      ?auto_429242 - BLOCK
      ?auto_429243 - BLOCK
      ?auto_429244 - BLOCK
      ?auto_429245 - BLOCK
      ?auto_429246 - BLOCK
    )
    :vars
    (
      ?auto_429247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429246 ?auto_429247 ) ( ON-TABLE ?auto_429239 ) ( ON ?auto_429240 ?auto_429239 ) ( not ( = ?auto_429239 ?auto_429240 ) ) ( not ( = ?auto_429239 ?auto_429241 ) ) ( not ( = ?auto_429239 ?auto_429242 ) ) ( not ( = ?auto_429239 ?auto_429243 ) ) ( not ( = ?auto_429239 ?auto_429244 ) ) ( not ( = ?auto_429239 ?auto_429245 ) ) ( not ( = ?auto_429239 ?auto_429246 ) ) ( not ( = ?auto_429239 ?auto_429247 ) ) ( not ( = ?auto_429240 ?auto_429241 ) ) ( not ( = ?auto_429240 ?auto_429242 ) ) ( not ( = ?auto_429240 ?auto_429243 ) ) ( not ( = ?auto_429240 ?auto_429244 ) ) ( not ( = ?auto_429240 ?auto_429245 ) ) ( not ( = ?auto_429240 ?auto_429246 ) ) ( not ( = ?auto_429240 ?auto_429247 ) ) ( not ( = ?auto_429241 ?auto_429242 ) ) ( not ( = ?auto_429241 ?auto_429243 ) ) ( not ( = ?auto_429241 ?auto_429244 ) ) ( not ( = ?auto_429241 ?auto_429245 ) ) ( not ( = ?auto_429241 ?auto_429246 ) ) ( not ( = ?auto_429241 ?auto_429247 ) ) ( not ( = ?auto_429242 ?auto_429243 ) ) ( not ( = ?auto_429242 ?auto_429244 ) ) ( not ( = ?auto_429242 ?auto_429245 ) ) ( not ( = ?auto_429242 ?auto_429246 ) ) ( not ( = ?auto_429242 ?auto_429247 ) ) ( not ( = ?auto_429243 ?auto_429244 ) ) ( not ( = ?auto_429243 ?auto_429245 ) ) ( not ( = ?auto_429243 ?auto_429246 ) ) ( not ( = ?auto_429243 ?auto_429247 ) ) ( not ( = ?auto_429244 ?auto_429245 ) ) ( not ( = ?auto_429244 ?auto_429246 ) ) ( not ( = ?auto_429244 ?auto_429247 ) ) ( not ( = ?auto_429245 ?auto_429246 ) ) ( not ( = ?auto_429245 ?auto_429247 ) ) ( not ( = ?auto_429246 ?auto_429247 ) ) ( ON ?auto_429245 ?auto_429246 ) ( ON ?auto_429244 ?auto_429245 ) ( ON ?auto_429243 ?auto_429244 ) ( ON ?auto_429242 ?auto_429243 ) ( CLEAR ?auto_429240 ) ( ON ?auto_429241 ?auto_429242 ) ( CLEAR ?auto_429241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429239 ?auto_429240 ?auto_429241 )
      ( MAKE-8PILE ?auto_429239 ?auto_429240 ?auto_429241 ?auto_429242 ?auto_429243 ?auto_429244 ?auto_429245 ?auto_429246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429256 - BLOCK
      ?auto_429257 - BLOCK
      ?auto_429258 - BLOCK
      ?auto_429259 - BLOCK
      ?auto_429260 - BLOCK
      ?auto_429261 - BLOCK
      ?auto_429262 - BLOCK
      ?auto_429263 - BLOCK
    )
    :vars
    (
      ?auto_429264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429263 ?auto_429264 ) ( ON-TABLE ?auto_429256 ) ( not ( = ?auto_429256 ?auto_429257 ) ) ( not ( = ?auto_429256 ?auto_429258 ) ) ( not ( = ?auto_429256 ?auto_429259 ) ) ( not ( = ?auto_429256 ?auto_429260 ) ) ( not ( = ?auto_429256 ?auto_429261 ) ) ( not ( = ?auto_429256 ?auto_429262 ) ) ( not ( = ?auto_429256 ?auto_429263 ) ) ( not ( = ?auto_429256 ?auto_429264 ) ) ( not ( = ?auto_429257 ?auto_429258 ) ) ( not ( = ?auto_429257 ?auto_429259 ) ) ( not ( = ?auto_429257 ?auto_429260 ) ) ( not ( = ?auto_429257 ?auto_429261 ) ) ( not ( = ?auto_429257 ?auto_429262 ) ) ( not ( = ?auto_429257 ?auto_429263 ) ) ( not ( = ?auto_429257 ?auto_429264 ) ) ( not ( = ?auto_429258 ?auto_429259 ) ) ( not ( = ?auto_429258 ?auto_429260 ) ) ( not ( = ?auto_429258 ?auto_429261 ) ) ( not ( = ?auto_429258 ?auto_429262 ) ) ( not ( = ?auto_429258 ?auto_429263 ) ) ( not ( = ?auto_429258 ?auto_429264 ) ) ( not ( = ?auto_429259 ?auto_429260 ) ) ( not ( = ?auto_429259 ?auto_429261 ) ) ( not ( = ?auto_429259 ?auto_429262 ) ) ( not ( = ?auto_429259 ?auto_429263 ) ) ( not ( = ?auto_429259 ?auto_429264 ) ) ( not ( = ?auto_429260 ?auto_429261 ) ) ( not ( = ?auto_429260 ?auto_429262 ) ) ( not ( = ?auto_429260 ?auto_429263 ) ) ( not ( = ?auto_429260 ?auto_429264 ) ) ( not ( = ?auto_429261 ?auto_429262 ) ) ( not ( = ?auto_429261 ?auto_429263 ) ) ( not ( = ?auto_429261 ?auto_429264 ) ) ( not ( = ?auto_429262 ?auto_429263 ) ) ( not ( = ?auto_429262 ?auto_429264 ) ) ( not ( = ?auto_429263 ?auto_429264 ) ) ( ON ?auto_429262 ?auto_429263 ) ( ON ?auto_429261 ?auto_429262 ) ( ON ?auto_429260 ?auto_429261 ) ( ON ?auto_429259 ?auto_429260 ) ( ON ?auto_429258 ?auto_429259 ) ( CLEAR ?auto_429256 ) ( ON ?auto_429257 ?auto_429258 ) ( CLEAR ?auto_429257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429256 ?auto_429257 )
      ( MAKE-8PILE ?auto_429256 ?auto_429257 ?auto_429258 ?auto_429259 ?auto_429260 ?auto_429261 ?auto_429262 ?auto_429263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429273 - BLOCK
      ?auto_429274 - BLOCK
      ?auto_429275 - BLOCK
      ?auto_429276 - BLOCK
      ?auto_429277 - BLOCK
      ?auto_429278 - BLOCK
      ?auto_429279 - BLOCK
      ?auto_429280 - BLOCK
    )
    :vars
    (
      ?auto_429281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429280 ?auto_429281 ) ( ON-TABLE ?auto_429273 ) ( not ( = ?auto_429273 ?auto_429274 ) ) ( not ( = ?auto_429273 ?auto_429275 ) ) ( not ( = ?auto_429273 ?auto_429276 ) ) ( not ( = ?auto_429273 ?auto_429277 ) ) ( not ( = ?auto_429273 ?auto_429278 ) ) ( not ( = ?auto_429273 ?auto_429279 ) ) ( not ( = ?auto_429273 ?auto_429280 ) ) ( not ( = ?auto_429273 ?auto_429281 ) ) ( not ( = ?auto_429274 ?auto_429275 ) ) ( not ( = ?auto_429274 ?auto_429276 ) ) ( not ( = ?auto_429274 ?auto_429277 ) ) ( not ( = ?auto_429274 ?auto_429278 ) ) ( not ( = ?auto_429274 ?auto_429279 ) ) ( not ( = ?auto_429274 ?auto_429280 ) ) ( not ( = ?auto_429274 ?auto_429281 ) ) ( not ( = ?auto_429275 ?auto_429276 ) ) ( not ( = ?auto_429275 ?auto_429277 ) ) ( not ( = ?auto_429275 ?auto_429278 ) ) ( not ( = ?auto_429275 ?auto_429279 ) ) ( not ( = ?auto_429275 ?auto_429280 ) ) ( not ( = ?auto_429275 ?auto_429281 ) ) ( not ( = ?auto_429276 ?auto_429277 ) ) ( not ( = ?auto_429276 ?auto_429278 ) ) ( not ( = ?auto_429276 ?auto_429279 ) ) ( not ( = ?auto_429276 ?auto_429280 ) ) ( not ( = ?auto_429276 ?auto_429281 ) ) ( not ( = ?auto_429277 ?auto_429278 ) ) ( not ( = ?auto_429277 ?auto_429279 ) ) ( not ( = ?auto_429277 ?auto_429280 ) ) ( not ( = ?auto_429277 ?auto_429281 ) ) ( not ( = ?auto_429278 ?auto_429279 ) ) ( not ( = ?auto_429278 ?auto_429280 ) ) ( not ( = ?auto_429278 ?auto_429281 ) ) ( not ( = ?auto_429279 ?auto_429280 ) ) ( not ( = ?auto_429279 ?auto_429281 ) ) ( not ( = ?auto_429280 ?auto_429281 ) ) ( ON ?auto_429279 ?auto_429280 ) ( ON ?auto_429278 ?auto_429279 ) ( ON ?auto_429277 ?auto_429278 ) ( ON ?auto_429276 ?auto_429277 ) ( ON ?auto_429275 ?auto_429276 ) ( CLEAR ?auto_429273 ) ( ON ?auto_429274 ?auto_429275 ) ( CLEAR ?auto_429274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429273 ?auto_429274 )
      ( MAKE-8PILE ?auto_429273 ?auto_429274 ?auto_429275 ?auto_429276 ?auto_429277 ?auto_429278 ?auto_429279 ?auto_429280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429290 - BLOCK
      ?auto_429291 - BLOCK
      ?auto_429292 - BLOCK
      ?auto_429293 - BLOCK
      ?auto_429294 - BLOCK
      ?auto_429295 - BLOCK
      ?auto_429296 - BLOCK
      ?auto_429297 - BLOCK
    )
    :vars
    (
      ?auto_429298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429297 ?auto_429298 ) ( not ( = ?auto_429290 ?auto_429291 ) ) ( not ( = ?auto_429290 ?auto_429292 ) ) ( not ( = ?auto_429290 ?auto_429293 ) ) ( not ( = ?auto_429290 ?auto_429294 ) ) ( not ( = ?auto_429290 ?auto_429295 ) ) ( not ( = ?auto_429290 ?auto_429296 ) ) ( not ( = ?auto_429290 ?auto_429297 ) ) ( not ( = ?auto_429290 ?auto_429298 ) ) ( not ( = ?auto_429291 ?auto_429292 ) ) ( not ( = ?auto_429291 ?auto_429293 ) ) ( not ( = ?auto_429291 ?auto_429294 ) ) ( not ( = ?auto_429291 ?auto_429295 ) ) ( not ( = ?auto_429291 ?auto_429296 ) ) ( not ( = ?auto_429291 ?auto_429297 ) ) ( not ( = ?auto_429291 ?auto_429298 ) ) ( not ( = ?auto_429292 ?auto_429293 ) ) ( not ( = ?auto_429292 ?auto_429294 ) ) ( not ( = ?auto_429292 ?auto_429295 ) ) ( not ( = ?auto_429292 ?auto_429296 ) ) ( not ( = ?auto_429292 ?auto_429297 ) ) ( not ( = ?auto_429292 ?auto_429298 ) ) ( not ( = ?auto_429293 ?auto_429294 ) ) ( not ( = ?auto_429293 ?auto_429295 ) ) ( not ( = ?auto_429293 ?auto_429296 ) ) ( not ( = ?auto_429293 ?auto_429297 ) ) ( not ( = ?auto_429293 ?auto_429298 ) ) ( not ( = ?auto_429294 ?auto_429295 ) ) ( not ( = ?auto_429294 ?auto_429296 ) ) ( not ( = ?auto_429294 ?auto_429297 ) ) ( not ( = ?auto_429294 ?auto_429298 ) ) ( not ( = ?auto_429295 ?auto_429296 ) ) ( not ( = ?auto_429295 ?auto_429297 ) ) ( not ( = ?auto_429295 ?auto_429298 ) ) ( not ( = ?auto_429296 ?auto_429297 ) ) ( not ( = ?auto_429296 ?auto_429298 ) ) ( not ( = ?auto_429297 ?auto_429298 ) ) ( ON ?auto_429296 ?auto_429297 ) ( ON ?auto_429295 ?auto_429296 ) ( ON ?auto_429294 ?auto_429295 ) ( ON ?auto_429293 ?auto_429294 ) ( ON ?auto_429292 ?auto_429293 ) ( ON ?auto_429291 ?auto_429292 ) ( ON ?auto_429290 ?auto_429291 ) ( CLEAR ?auto_429290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429290 )
      ( MAKE-8PILE ?auto_429290 ?auto_429291 ?auto_429292 ?auto_429293 ?auto_429294 ?auto_429295 ?auto_429296 ?auto_429297 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429307 - BLOCK
      ?auto_429308 - BLOCK
      ?auto_429309 - BLOCK
      ?auto_429310 - BLOCK
      ?auto_429311 - BLOCK
      ?auto_429312 - BLOCK
      ?auto_429313 - BLOCK
      ?auto_429314 - BLOCK
    )
    :vars
    (
      ?auto_429315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429314 ?auto_429315 ) ( not ( = ?auto_429307 ?auto_429308 ) ) ( not ( = ?auto_429307 ?auto_429309 ) ) ( not ( = ?auto_429307 ?auto_429310 ) ) ( not ( = ?auto_429307 ?auto_429311 ) ) ( not ( = ?auto_429307 ?auto_429312 ) ) ( not ( = ?auto_429307 ?auto_429313 ) ) ( not ( = ?auto_429307 ?auto_429314 ) ) ( not ( = ?auto_429307 ?auto_429315 ) ) ( not ( = ?auto_429308 ?auto_429309 ) ) ( not ( = ?auto_429308 ?auto_429310 ) ) ( not ( = ?auto_429308 ?auto_429311 ) ) ( not ( = ?auto_429308 ?auto_429312 ) ) ( not ( = ?auto_429308 ?auto_429313 ) ) ( not ( = ?auto_429308 ?auto_429314 ) ) ( not ( = ?auto_429308 ?auto_429315 ) ) ( not ( = ?auto_429309 ?auto_429310 ) ) ( not ( = ?auto_429309 ?auto_429311 ) ) ( not ( = ?auto_429309 ?auto_429312 ) ) ( not ( = ?auto_429309 ?auto_429313 ) ) ( not ( = ?auto_429309 ?auto_429314 ) ) ( not ( = ?auto_429309 ?auto_429315 ) ) ( not ( = ?auto_429310 ?auto_429311 ) ) ( not ( = ?auto_429310 ?auto_429312 ) ) ( not ( = ?auto_429310 ?auto_429313 ) ) ( not ( = ?auto_429310 ?auto_429314 ) ) ( not ( = ?auto_429310 ?auto_429315 ) ) ( not ( = ?auto_429311 ?auto_429312 ) ) ( not ( = ?auto_429311 ?auto_429313 ) ) ( not ( = ?auto_429311 ?auto_429314 ) ) ( not ( = ?auto_429311 ?auto_429315 ) ) ( not ( = ?auto_429312 ?auto_429313 ) ) ( not ( = ?auto_429312 ?auto_429314 ) ) ( not ( = ?auto_429312 ?auto_429315 ) ) ( not ( = ?auto_429313 ?auto_429314 ) ) ( not ( = ?auto_429313 ?auto_429315 ) ) ( not ( = ?auto_429314 ?auto_429315 ) ) ( ON ?auto_429313 ?auto_429314 ) ( ON ?auto_429312 ?auto_429313 ) ( ON ?auto_429311 ?auto_429312 ) ( ON ?auto_429310 ?auto_429311 ) ( ON ?auto_429309 ?auto_429310 ) ( ON ?auto_429308 ?auto_429309 ) ( ON ?auto_429307 ?auto_429308 ) ( CLEAR ?auto_429307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429307 )
      ( MAKE-8PILE ?auto_429307 ?auto_429308 ?auto_429309 ?auto_429310 ?auto_429311 ?auto_429312 ?auto_429313 ?auto_429314 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429325 - BLOCK
      ?auto_429326 - BLOCK
      ?auto_429327 - BLOCK
      ?auto_429328 - BLOCK
      ?auto_429329 - BLOCK
      ?auto_429330 - BLOCK
      ?auto_429331 - BLOCK
      ?auto_429332 - BLOCK
      ?auto_429333 - BLOCK
    )
    :vars
    (
      ?auto_429334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429332 ) ( ON ?auto_429333 ?auto_429334 ) ( CLEAR ?auto_429333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429325 ) ( ON ?auto_429326 ?auto_429325 ) ( ON ?auto_429327 ?auto_429326 ) ( ON ?auto_429328 ?auto_429327 ) ( ON ?auto_429329 ?auto_429328 ) ( ON ?auto_429330 ?auto_429329 ) ( ON ?auto_429331 ?auto_429330 ) ( ON ?auto_429332 ?auto_429331 ) ( not ( = ?auto_429325 ?auto_429326 ) ) ( not ( = ?auto_429325 ?auto_429327 ) ) ( not ( = ?auto_429325 ?auto_429328 ) ) ( not ( = ?auto_429325 ?auto_429329 ) ) ( not ( = ?auto_429325 ?auto_429330 ) ) ( not ( = ?auto_429325 ?auto_429331 ) ) ( not ( = ?auto_429325 ?auto_429332 ) ) ( not ( = ?auto_429325 ?auto_429333 ) ) ( not ( = ?auto_429325 ?auto_429334 ) ) ( not ( = ?auto_429326 ?auto_429327 ) ) ( not ( = ?auto_429326 ?auto_429328 ) ) ( not ( = ?auto_429326 ?auto_429329 ) ) ( not ( = ?auto_429326 ?auto_429330 ) ) ( not ( = ?auto_429326 ?auto_429331 ) ) ( not ( = ?auto_429326 ?auto_429332 ) ) ( not ( = ?auto_429326 ?auto_429333 ) ) ( not ( = ?auto_429326 ?auto_429334 ) ) ( not ( = ?auto_429327 ?auto_429328 ) ) ( not ( = ?auto_429327 ?auto_429329 ) ) ( not ( = ?auto_429327 ?auto_429330 ) ) ( not ( = ?auto_429327 ?auto_429331 ) ) ( not ( = ?auto_429327 ?auto_429332 ) ) ( not ( = ?auto_429327 ?auto_429333 ) ) ( not ( = ?auto_429327 ?auto_429334 ) ) ( not ( = ?auto_429328 ?auto_429329 ) ) ( not ( = ?auto_429328 ?auto_429330 ) ) ( not ( = ?auto_429328 ?auto_429331 ) ) ( not ( = ?auto_429328 ?auto_429332 ) ) ( not ( = ?auto_429328 ?auto_429333 ) ) ( not ( = ?auto_429328 ?auto_429334 ) ) ( not ( = ?auto_429329 ?auto_429330 ) ) ( not ( = ?auto_429329 ?auto_429331 ) ) ( not ( = ?auto_429329 ?auto_429332 ) ) ( not ( = ?auto_429329 ?auto_429333 ) ) ( not ( = ?auto_429329 ?auto_429334 ) ) ( not ( = ?auto_429330 ?auto_429331 ) ) ( not ( = ?auto_429330 ?auto_429332 ) ) ( not ( = ?auto_429330 ?auto_429333 ) ) ( not ( = ?auto_429330 ?auto_429334 ) ) ( not ( = ?auto_429331 ?auto_429332 ) ) ( not ( = ?auto_429331 ?auto_429333 ) ) ( not ( = ?auto_429331 ?auto_429334 ) ) ( not ( = ?auto_429332 ?auto_429333 ) ) ( not ( = ?auto_429332 ?auto_429334 ) ) ( not ( = ?auto_429333 ?auto_429334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429333 ?auto_429334 )
      ( !STACK ?auto_429333 ?auto_429332 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429344 - BLOCK
      ?auto_429345 - BLOCK
      ?auto_429346 - BLOCK
      ?auto_429347 - BLOCK
      ?auto_429348 - BLOCK
      ?auto_429349 - BLOCK
      ?auto_429350 - BLOCK
      ?auto_429351 - BLOCK
      ?auto_429352 - BLOCK
    )
    :vars
    (
      ?auto_429353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429351 ) ( ON ?auto_429352 ?auto_429353 ) ( CLEAR ?auto_429352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429344 ) ( ON ?auto_429345 ?auto_429344 ) ( ON ?auto_429346 ?auto_429345 ) ( ON ?auto_429347 ?auto_429346 ) ( ON ?auto_429348 ?auto_429347 ) ( ON ?auto_429349 ?auto_429348 ) ( ON ?auto_429350 ?auto_429349 ) ( ON ?auto_429351 ?auto_429350 ) ( not ( = ?auto_429344 ?auto_429345 ) ) ( not ( = ?auto_429344 ?auto_429346 ) ) ( not ( = ?auto_429344 ?auto_429347 ) ) ( not ( = ?auto_429344 ?auto_429348 ) ) ( not ( = ?auto_429344 ?auto_429349 ) ) ( not ( = ?auto_429344 ?auto_429350 ) ) ( not ( = ?auto_429344 ?auto_429351 ) ) ( not ( = ?auto_429344 ?auto_429352 ) ) ( not ( = ?auto_429344 ?auto_429353 ) ) ( not ( = ?auto_429345 ?auto_429346 ) ) ( not ( = ?auto_429345 ?auto_429347 ) ) ( not ( = ?auto_429345 ?auto_429348 ) ) ( not ( = ?auto_429345 ?auto_429349 ) ) ( not ( = ?auto_429345 ?auto_429350 ) ) ( not ( = ?auto_429345 ?auto_429351 ) ) ( not ( = ?auto_429345 ?auto_429352 ) ) ( not ( = ?auto_429345 ?auto_429353 ) ) ( not ( = ?auto_429346 ?auto_429347 ) ) ( not ( = ?auto_429346 ?auto_429348 ) ) ( not ( = ?auto_429346 ?auto_429349 ) ) ( not ( = ?auto_429346 ?auto_429350 ) ) ( not ( = ?auto_429346 ?auto_429351 ) ) ( not ( = ?auto_429346 ?auto_429352 ) ) ( not ( = ?auto_429346 ?auto_429353 ) ) ( not ( = ?auto_429347 ?auto_429348 ) ) ( not ( = ?auto_429347 ?auto_429349 ) ) ( not ( = ?auto_429347 ?auto_429350 ) ) ( not ( = ?auto_429347 ?auto_429351 ) ) ( not ( = ?auto_429347 ?auto_429352 ) ) ( not ( = ?auto_429347 ?auto_429353 ) ) ( not ( = ?auto_429348 ?auto_429349 ) ) ( not ( = ?auto_429348 ?auto_429350 ) ) ( not ( = ?auto_429348 ?auto_429351 ) ) ( not ( = ?auto_429348 ?auto_429352 ) ) ( not ( = ?auto_429348 ?auto_429353 ) ) ( not ( = ?auto_429349 ?auto_429350 ) ) ( not ( = ?auto_429349 ?auto_429351 ) ) ( not ( = ?auto_429349 ?auto_429352 ) ) ( not ( = ?auto_429349 ?auto_429353 ) ) ( not ( = ?auto_429350 ?auto_429351 ) ) ( not ( = ?auto_429350 ?auto_429352 ) ) ( not ( = ?auto_429350 ?auto_429353 ) ) ( not ( = ?auto_429351 ?auto_429352 ) ) ( not ( = ?auto_429351 ?auto_429353 ) ) ( not ( = ?auto_429352 ?auto_429353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429352 ?auto_429353 )
      ( !STACK ?auto_429352 ?auto_429351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429363 - BLOCK
      ?auto_429364 - BLOCK
      ?auto_429365 - BLOCK
      ?auto_429366 - BLOCK
      ?auto_429367 - BLOCK
      ?auto_429368 - BLOCK
      ?auto_429369 - BLOCK
      ?auto_429370 - BLOCK
      ?auto_429371 - BLOCK
    )
    :vars
    (
      ?auto_429372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429371 ?auto_429372 ) ( ON-TABLE ?auto_429363 ) ( ON ?auto_429364 ?auto_429363 ) ( ON ?auto_429365 ?auto_429364 ) ( ON ?auto_429366 ?auto_429365 ) ( ON ?auto_429367 ?auto_429366 ) ( ON ?auto_429368 ?auto_429367 ) ( ON ?auto_429369 ?auto_429368 ) ( not ( = ?auto_429363 ?auto_429364 ) ) ( not ( = ?auto_429363 ?auto_429365 ) ) ( not ( = ?auto_429363 ?auto_429366 ) ) ( not ( = ?auto_429363 ?auto_429367 ) ) ( not ( = ?auto_429363 ?auto_429368 ) ) ( not ( = ?auto_429363 ?auto_429369 ) ) ( not ( = ?auto_429363 ?auto_429370 ) ) ( not ( = ?auto_429363 ?auto_429371 ) ) ( not ( = ?auto_429363 ?auto_429372 ) ) ( not ( = ?auto_429364 ?auto_429365 ) ) ( not ( = ?auto_429364 ?auto_429366 ) ) ( not ( = ?auto_429364 ?auto_429367 ) ) ( not ( = ?auto_429364 ?auto_429368 ) ) ( not ( = ?auto_429364 ?auto_429369 ) ) ( not ( = ?auto_429364 ?auto_429370 ) ) ( not ( = ?auto_429364 ?auto_429371 ) ) ( not ( = ?auto_429364 ?auto_429372 ) ) ( not ( = ?auto_429365 ?auto_429366 ) ) ( not ( = ?auto_429365 ?auto_429367 ) ) ( not ( = ?auto_429365 ?auto_429368 ) ) ( not ( = ?auto_429365 ?auto_429369 ) ) ( not ( = ?auto_429365 ?auto_429370 ) ) ( not ( = ?auto_429365 ?auto_429371 ) ) ( not ( = ?auto_429365 ?auto_429372 ) ) ( not ( = ?auto_429366 ?auto_429367 ) ) ( not ( = ?auto_429366 ?auto_429368 ) ) ( not ( = ?auto_429366 ?auto_429369 ) ) ( not ( = ?auto_429366 ?auto_429370 ) ) ( not ( = ?auto_429366 ?auto_429371 ) ) ( not ( = ?auto_429366 ?auto_429372 ) ) ( not ( = ?auto_429367 ?auto_429368 ) ) ( not ( = ?auto_429367 ?auto_429369 ) ) ( not ( = ?auto_429367 ?auto_429370 ) ) ( not ( = ?auto_429367 ?auto_429371 ) ) ( not ( = ?auto_429367 ?auto_429372 ) ) ( not ( = ?auto_429368 ?auto_429369 ) ) ( not ( = ?auto_429368 ?auto_429370 ) ) ( not ( = ?auto_429368 ?auto_429371 ) ) ( not ( = ?auto_429368 ?auto_429372 ) ) ( not ( = ?auto_429369 ?auto_429370 ) ) ( not ( = ?auto_429369 ?auto_429371 ) ) ( not ( = ?auto_429369 ?auto_429372 ) ) ( not ( = ?auto_429370 ?auto_429371 ) ) ( not ( = ?auto_429370 ?auto_429372 ) ) ( not ( = ?auto_429371 ?auto_429372 ) ) ( CLEAR ?auto_429369 ) ( ON ?auto_429370 ?auto_429371 ) ( CLEAR ?auto_429370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429363 ?auto_429364 ?auto_429365 ?auto_429366 ?auto_429367 ?auto_429368 ?auto_429369 ?auto_429370 )
      ( MAKE-9PILE ?auto_429363 ?auto_429364 ?auto_429365 ?auto_429366 ?auto_429367 ?auto_429368 ?auto_429369 ?auto_429370 ?auto_429371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429382 - BLOCK
      ?auto_429383 - BLOCK
      ?auto_429384 - BLOCK
      ?auto_429385 - BLOCK
      ?auto_429386 - BLOCK
      ?auto_429387 - BLOCK
      ?auto_429388 - BLOCK
      ?auto_429389 - BLOCK
      ?auto_429390 - BLOCK
    )
    :vars
    (
      ?auto_429391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429390 ?auto_429391 ) ( ON-TABLE ?auto_429382 ) ( ON ?auto_429383 ?auto_429382 ) ( ON ?auto_429384 ?auto_429383 ) ( ON ?auto_429385 ?auto_429384 ) ( ON ?auto_429386 ?auto_429385 ) ( ON ?auto_429387 ?auto_429386 ) ( ON ?auto_429388 ?auto_429387 ) ( not ( = ?auto_429382 ?auto_429383 ) ) ( not ( = ?auto_429382 ?auto_429384 ) ) ( not ( = ?auto_429382 ?auto_429385 ) ) ( not ( = ?auto_429382 ?auto_429386 ) ) ( not ( = ?auto_429382 ?auto_429387 ) ) ( not ( = ?auto_429382 ?auto_429388 ) ) ( not ( = ?auto_429382 ?auto_429389 ) ) ( not ( = ?auto_429382 ?auto_429390 ) ) ( not ( = ?auto_429382 ?auto_429391 ) ) ( not ( = ?auto_429383 ?auto_429384 ) ) ( not ( = ?auto_429383 ?auto_429385 ) ) ( not ( = ?auto_429383 ?auto_429386 ) ) ( not ( = ?auto_429383 ?auto_429387 ) ) ( not ( = ?auto_429383 ?auto_429388 ) ) ( not ( = ?auto_429383 ?auto_429389 ) ) ( not ( = ?auto_429383 ?auto_429390 ) ) ( not ( = ?auto_429383 ?auto_429391 ) ) ( not ( = ?auto_429384 ?auto_429385 ) ) ( not ( = ?auto_429384 ?auto_429386 ) ) ( not ( = ?auto_429384 ?auto_429387 ) ) ( not ( = ?auto_429384 ?auto_429388 ) ) ( not ( = ?auto_429384 ?auto_429389 ) ) ( not ( = ?auto_429384 ?auto_429390 ) ) ( not ( = ?auto_429384 ?auto_429391 ) ) ( not ( = ?auto_429385 ?auto_429386 ) ) ( not ( = ?auto_429385 ?auto_429387 ) ) ( not ( = ?auto_429385 ?auto_429388 ) ) ( not ( = ?auto_429385 ?auto_429389 ) ) ( not ( = ?auto_429385 ?auto_429390 ) ) ( not ( = ?auto_429385 ?auto_429391 ) ) ( not ( = ?auto_429386 ?auto_429387 ) ) ( not ( = ?auto_429386 ?auto_429388 ) ) ( not ( = ?auto_429386 ?auto_429389 ) ) ( not ( = ?auto_429386 ?auto_429390 ) ) ( not ( = ?auto_429386 ?auto_429391 ) ) ( not ( = ?auto_429387 ?auto_429388 ) ) ( not ( = ?auto_429387 ?auto_429389 ) ) ( not ( = ?auto_429387 ?auto_429390 ) ) ( not ( = ?auto_429387 ?auto_429391 ) ) ( not ( = ?auto_429388 ?auto_429389 ) ) ( not ( = ?auto_429388 ?auto_429390 ) ) ( not ( = ?auto_429388 ?auto_429391 ) ) ( not ( = ?auto_429389 ?auto_429390 ) ) ( not ( = ?auto_429389 ?auto_429391 ) ) ( not ( = ?auto_429390 ?auto_429391 ) ) ( CLEAR ?auto_429388 ) ( ON ?auto_429389 ?auto_429390 ) ( CLEAR ?auto_429389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429382 ?auto_429383 ?auto_429384 ?auto_429385 ?auto_429386 ?auto_429387 ?auto_429388 ?auto_429389 )
      ( MAKE-9PILE ?auto_429382 ?auto_429383 ?auto_429384 ?auto_429385 ?auto_429386 ?auto_429387 ?auto_429388 ?auto_429389 ?auto_429390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429401 - BLOCK
      ?auto_429402 - BLOCK
      ?auto_429403 - BLOCK
      ?auto_429404 - BLOCK
      ?auto_429405 - BLOCK
      ?auto_429406 - BLOCK
      ?auto_429407 - BLOCK
      ?auto_429408 - BLOCK
      ?auto_429409 - BLOCK
    )
    :vars
    (
      ?auto_429410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429409 ?auto_429410 ) ( ON-TABLE ?auto_429401 ) ( ON ?auto_429402 ?auto_429401 ) ( ON ?auto_429403 ?auto_429402 ) ( ON ?auto_429404 ?auto_429403 ) ( ON ?auto_429405 ?auto_429404 ) ( ON ?auto_429406 ?auto_429405 ) ( not ( = ?auto_429401 ?auto_429402 ) ) ( not ( = ?auto_429401 ?auto_429403 ) ) ( not ( = ?auto_429401 ?auto_429404 ) ) ( not ( = ?auto_429401 ?auto_429405 ) ) ( not ( = ?auto_429401 ?auto_429406 ) ) ( not ( = ?auto_429401 ?auto_429407 ) ) ( not ( = ?auto_429401 ?auto_429408 ) ) ( not ( = ?auto_429401 ?auto_429409 ) ) ( not ( = ?auto_429401 ?auto_429410 ) ) ( not ( = ?auto_429402 ?auto_429403 ) ) ( not ( = ?auto_429402 ?auto_429404 ) ) ( not ( = ?auto_429402 ?auto_429405 ) ) ( not ( = ?auto_429402 ?auto_429406 ) ) ( not ( = ?auto_429402 ?auto_429407 ) ) ( not ( = ?auto_429402 ?auto_429408 ) ) ( not ( = ?auto_429402 ?auto_429409 ) ) ( not ( = ?auto_429402 ?auto_429410 ) ) ( not ( = ?auto_429403 ?auto_429404 ) ) ( not ( = ?auto_429403 ?auto_429405 ) ) ( not ( = ?auto_429403 ?auto_429406 ) ) ( not ( = ?auto_429403 ?auto_429407 ) ) ( not ( = ?auto_429403 ?auto_429408 ) ) ( not ( = ?auto_429403 ?auto_429409 ) ) ( not ( = ?auto_429403 ?auto_429410 ) ) ( not ( = ?auto_429404 ?auto_429405 ) ) ( not ( = ?auto_429404 ?auto_429406 ) ) ( not ( = ?auto_429404 ?auto_429407 ) ) ( not ( = ?auto_429404 ?auto_429408 ) ) ( not ( = ?auto_429404 ?auto_429409 ) ) ( not ( = ?auto_429404 ?auto_429410 ) ) ( not ( = ?auto_429405 ?auto_429406 ) ) ( not ( = ?auto_429405 ?auto_429407 ) ) ( not ( = ?auto_429405 ?auto_429408 ) ) ( not ( = ?auto_429405 ?auto_429409 ) ) ( not ( = ?auto_429405 ?auto_429410 ) ) ( not ( = ?auto_429406 ?auto_429407 ) ) ( not ( = ?auto_429406 ?auto_429408 ) ) ( not ( = ?auto_429406 ?auto_429409 ) ) ( not ( = ?auto_429406 ?auto_429410 ) ) ( not ( = ?auto_429407 ?auto_429408 ) ) ( not ( = ?auto_429407 ?auto_429409 ) ) ( not ( = ?auto_429407 ?auto_429410 ) ) ( not ( = ?auto_429408 ?auto_429409 ) ) ( not ( = ?auto_429408 ?auto_429410 ) ) ( not ( = ?auto_429409 ?auto_429410 ) ) ( ON ?auto_429408 ?auto_429409 ) ( CLEAR ?auto_429406 ) ( ON ?auto_429407 ?auto_429408 ) ( CLEAR ?auto_429407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429401 ?auto_429402 ?auto_429403 ?auto_429404 ?auto_429405 ?auto_429406 ?auto_429407 )
      ( MAKE-9PILE ?auto_429401 ?auto_429402 ?auto_429403 ?auto_429404 ?auto_429405 ?auto_429406 ?auto_429407 ?auto_429408 ?auto_429409 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429420 - BLOCK
      ?auto_429421 - BLOCK
      ?auto_429422 - BLOCK
      ?auto_429423 - BLOCK
      ?auto_429424 - BLOCK
      ?auto_429425 - BLOCK
      ?auto_429426 - BLOCK
      ?auto_429427 - BLOCK
      ?auto_429428 - BLOCK
    )
    :vars
    (
      ?auto_429429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429428 ?auto_429429 ) ( ON-TABLE ?auto_429420 ) ( ON ?auto_429421 ?auto_429420 ) ( ON ?auto_429422 ?auto_429421 ) ( ON ?auto_429423 ?auto_429422 ) ( ON ?auto_429424 ?auto_429423 ) ( ON ?auto_429425 ?auto_429424 ) ( not ( = ?auto_429420 ?auto_429421 ) ) ( not ( = ?auto_429420 ?auto_429422 ) ) ( not ( = ?auto_429420 ?auto_429423 ) ) ( not ( = ?auto_429420 ?auto_429424 ) ) ( not ( = ?auto_429420 ?auto_429425 ) ) ( not ( = ?auto_429420 ?auto_429426 ) ) ( not ( = ?auto_429420 ?auto_429427 ) ) ( not ( = ?auto_429420 ?auto_429428 ) ) ( not ( = ?auto_429420 ?auto_429429 ) ) ( not ( = ?auto_429421 ?auto_429422 ) ) ( not ( = ?auto_429421 ?auto_429423 ) ) ( not ( = ?auto_429421 ?auto_429424 ) ) ( not ( = ?auto_429421 ?auto_429425 ) ) ( not ( = ?auto_429421 ?auto_429426 ) ) ( not ( = ?auto_429421 ?auto_429427 ) ) ( not ( = ?auto_429421 ?auto_429428 ) ) ( not ( = ?auto_429421 ?auto_429429 ) ) ( not ( = ?auto_429422 ?auto_429423 ) ) ( not ( = ?auto_429422 ?auto_429424 ) ) ( not ( = ?auto_429422 ?auto_429425 ) ) ( not ( = ?auto_429422 ?auto_429426 ) ) ( not ( = ?auto_429422 ?auto_429427 ) ) ( not ( = ?auto_429422 ?auto_429428 ) ) ( not ( = ?auto_429422 ?auto_429429 ) ) ( not ( = ?auto_429423 ?auto_429424 ) ) ( not ( = ?auto_429423 ?auto_429425 ) ) ( not ( = ?auto_429423 ?auto_429426 ) ) ( not ( = ?auto_429423 ?auto_429427 ) ) ( not ( = ?auto_429423 ?auto_429428 ) ) ( not ( = ?auto_429423 ?auto_429429 ) ) ( not ( = ?auto_429424 ?auto_429425 ) ) ( not ( = ?auto_429424 ?auto_429426 ) ) ( not ( = ?auto_429424 ?auto_429427 ) ) ( not ( = ?auto_429424 ?auto_429428 ) ) ( not ( = ?auto_429424 ?auto_429429 ) ) ( not ( = ?auto_429425 ?auto_429426 ) ) ( not ( = ?auto_429425 ?auto_429427 ) ) ( not ( = ?auto_429425 ?auto_429428 ) ) ( not ( = ?auto_429425 ?auto_429429 ) ) ( not ( = ?auto_429426 ?auto_429427 ) ) ( not ( = ?auto_429426 ?auto_429428 ) ) ( not ( = ?auto_429426 ?auto_429429 ) ) ( not ( = ?auto_429427 ?auto_429428 ) ) ( not ( = ?auto_429427 ?auto_429429 ) ) ( not ( = ?auto_429428 ?auto_429429 ) ) ( ON ?auto_429427 ?auto_429428 ) ( CLEAR ?auto_429425 ) ( ON ?auto_429426 ?auto_429427 ) ( CLEAR ?auto_429426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429420 ?auto_429421 ?auto_429422 ?auto_429423 ?auto_429424 ?auto_429425 ?auto_429426 )
      ( MAKE-9PILE ?auto_429420 ?auto_429421 ?auto_429422 ?auto_429423 ?auto_429424 ?auto_429425 ?auto_429426 ?auto_429427 ?auto_429428 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429439 - BLOCK
      ?auto_429440 - BLOCK
      ?auto_429441 - BLOCK
      ?auto_429442 - BLOCK
      ?auto_429443 - BLOCK
      ?auto_429444 - BLOCK
      ?auto_429445 - BLOCK
      ?auto_429446 - BLOCK
      ?auto_429447 - BLOCK
    )
    :vars
    (
      ?auto_429448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429447 ?auto_429448 ) ( ON-TABLE ?auto_429439 ) ( ON ?auto_429440 ?auto_429439 ) ( ON ?auto_429441 ?auto_429440 ) ( ON ?auto_429442 ?auto_429441 ) ( ON ?auto_429443 ?auto_429442 ) ( not ( = ?auto_429439 ?auto_429440 ) ) ( not ( = ?auto_429439 ?auto_429441 ) ) ( not ( = ?auto_429439 ?auto_429442 ) ) ( not ( = ?auto_429439 ?auto_429443 ) ) ( not ( = ?auto_429439 ?auto_429444 ) ) ( not ( = ?auto_429439 ?auto_429445 ) ) ( not ( = ?auto_429439 ?auto_429446 ) ) ( not ( = ?auto_429439 ?auto_429447 ) ) ( not ( = ?auto_429439 ?auto_429448 ) ) ( not ( = ?auto_429440 ?auto_429441 ) ) ( not ( = ?auto_429440 ?auto_429442 ) ) ( not ( = ?auto_429440 ?auto_429443 ) ) ( not ( = ?auto_429440 ?auto_429444 ) ) ( not ( = ?auto_429440 ?auto_429445 ) ) ( not ( = ?auto_429440 ?auto_429446 ) ) ( not ( = ?auto_429440 ?auto_429447 ) ) ( not ( = ?auto_429440 ?auto_429448 ) ) ( not ( = ?auto_429441 ?auto_429442 ) ) ( not ( = ?auto_429441 ?auto_429443 ) ) ( not ( = ?auto_429441 ?auto_429444 ) ) ( not ( = ?auto_429441 ?auto_429445 ) ) ( not ( = ?auto_429441 ?auto_429446 ) ) ( not ( = ?auto_429441 ?auto_429447 ) ) ( not ( = ?auto_429441 ?auto_429448 ) ) ( not ( = ?auto_429442 ?auto_429443 ) ) ( not ( = ?auto_429442 ?auto_429444 ) ) ( not ( = ?auto_429442 ?auto_429445 ) ) ( not ( = ?auto_429442 ?auto_429446 ) ) ( not ( = ?auto_429442 ?auto_429447 ) ) ( not ( = ?auto_429442 ?auto_429448 ) ) ( not ( = ?auto_429443 ?auto_429444 ) ) ( not ( = ?auto_429443 ?auto_429445 ) ) ( not ( = ?auto_429443 ?auto_429446 ) ) ( not ( = ?auto_429443 ?auto_429447 ) ) ( not ( = ?auto_429443 ?auto_429448 ) ) ( not ( = ?auto_429444 ?auto_429445 ) ) ( not ( = ?auto_429444 ?auto_429446 ) ) ( not ( = ?auto_429444 ?auto_429447 ) ) ( not ( = ?auto_429444 ?auto_429448 ) ) ( not ( = ?auto_429445 ?auto_429446 ) ) ( not ( = ?auto_429445 ?auto_429447 ) ) ( not ( = ?auto_429445 ?auto_429448 ) ) ( not ( = ?auto_429446 ?auto_429447 ) ) ( not ( = ?auto_429446 ?auto_429448 ) ) ( not ( = ?auto_429447 ?auto_429448 ) ) ( ON ?auto_429446 ?auto_429447 ) ( ON ?auto_429445 ?auto_429446 ) ( CLEAR ?auto_429443 ) ( ON ?auto_429444 ?auto_429445 ) ( CLEAR ?auto_429444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429439 ?auto_429440 ?auto_429441 ?auto_429442 ?auto_429443 ?auto_429444 )
      ( MAKE-9PILE ?auto_429439 ?auto_429440 ?auto_429441 ?auto_429442 ?auto_429443 ?auto_429444 ?auto_429445 ?auto_429446 ?auto_429447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429458 - BLOCK
      ?auto_429459 - BLOCK
      ?auto_429460 - BLOCK
      ?auto_429461 - BLOCK
      ?auto_429462 - BLOCK
      ?auto_429463 - BLOCK
      ?auto_429464 - BLOCK
      ?auto_429465 - BLOCK
      ?auto_429466 - BLOCK
    )
    :vars
    (
      ?auto_429467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429466 ?auto_429467 ) ( ON-TABLE ?auto_429458 ) ( ON ?auto_429459 ?auto_429458 ) ( ON ?auto_429460 ?auto_429459 ) ( ON ?auto_429461 ?auto_429460 ) ( ON ?auto_429462 ?auto_429461 ) ( not ( = ?auto_429458 ?auto_429459 ) ) ( not ( = ?auto_429458 ?auto_429460 ) ) ( not ( = ?auto_429458 ?auto_429461 ) ) ( not ( = ?auto_429458 ?auto_429462 ) ) ( not ( = ?auto_429458 ?auto_429463 ) ) ( not ( = ?auto_429458 ?auto_429464 ) ) ( not ( = ?auto_429458 ?auto_429465 ) ) ( not ( = ?auto_429458 ?auto_429466 ) ) ( not ( = ?auto_429458 ?auto_429467 ) ) ( not ( = ?auto_429459 ?auto_429460 ) ) ( not ( = ?auto_429459 ?auto_429461 ) ) ( not ( = ?auto_429459 ?auto_429462 ) ) ( not ( = ?auto_429459 ?auto_429463 ) ) ( not ( = ?auto_429459 ?auto_429464 ) ) ( not ( = ?auto_429459 ?auto_429465 ) ) ( not ( = ?auto_429459 ?auto_429466 ) ) ( not ( = ?auto_429459 ?auto_429467 ) ) ( not ( = ?auto_429460 ?auto_429461 ) ) ( not ( = ?auto_429460 ?auto_429462 ) ) ( not ( = ?auto_429460 ?auto_429463 ) ) ( not ( = ?auto_429460 ?auto_429464 ) ) ( not ( = ?auto_429460 ?auto_429465 ) ) ( not ( = ?auto_429460 ?auto_429466 ) ) ( not ( = ?auto_429460 ?auto_429467 ) ) ( not ( = ?auto_429461 ?auto_429462 ) ) ( not ( = ?auto_429461 ?auto_429463 ) ) ( not ( = ?auto_429461 ?auto_429464 ) ) ( not ( = ?auto_429461 ?auto_429465 ) ) ( not ( = ?auto_429461 ?auto_429466 ) ) ( not ( = ?auto_429461 ?auto_429467 ) ) ( not ( = ?auto_429462 ?auto_429463 ) ) ( not ( = ?auto_429462 ?auto_429464 ) ) ( not ( = ?auto_429462 ?auto_429465 ) ) ( not ( = ?auto_429462 ?auto_429466 ) ) ( not ( = ?auto_429462 ?auto_429467 ) ) ( not ( = ?auto_429463 ?auto_429464 ) ) ( not ( = ?auto_429463 ?auto_429465 ) ) ( not ( = ?auto_429463 ?auto_429466 ) ) ( not ( = ?auto_429463 ?auto_429467 ) ) ( not ( = ?auto_429464 ?auto_429465 ) ) ( not ( = ?auto_429464 ?auto_429466 ) ) ( not ( = ?auto_429464 ?auto_429467 ) ) ( not ( = ?auto_429465 ?auto_429466 ) ) ( not ( = ?auto_429465 ?auto_429467 ) ) ( not ( = ?auto_429466 ?auto_429467 ) ) ( ON ?auto_429465 ?auto_429466 ) ( ON ?auto_429464 ?auto_429465 ) ( CLEAR ?auto_429462 ) ( ON ?auto_429463 ?auto_429464 ) ( CLEAR ?auto_429463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429458 ?auto_429459 ?auto_429460 ?auto_429461 ?auto_429462 ?auto_429463 )
      ( MAKE-9PILE ?auto_429458 ?auto_429459 ?auto_429460 ?auto_429461 ?auto_429462 ?auto_429463 ?auto_429464 ?auto_429465 ?auto_429466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429477 - BLOCK
      ?auto_429478 - BLOCK
      ?auto_429479 - BLOCK
      ?auto_429480 - BLOCK
      ?auto_429481 - BLOCK
      ?auto_429482 - BLOCK
      ?auto_429483 - BLOCK
      ?auto_429484 - BLOCK
      ?auto_429485 - BLOCK
    )
    :vars
    (
      ?auto_429486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429485 ?auto_429486 ) ( ON-TABLE ?auto_429477 ) ( ON ?auto_429478 ?auto_429477 ) ( ON ?auto_429479 ?auto_429478 ) ( ON ?auto_429480 ?auto_429479 ) ( not ( = ?auto_429477 ?auto_429478 ) ) ( not ( = ?auto_429477 ?auto_429479 ) ) ( not ( = ?auto_429477 ?auto_429480 ) ) ( not ( = ?auto_429477 ?auto_429481 ) ) ( not ( = ?auto_429477 ?auto_429482 ) ) ( not ( = ?auto_429477 ?auto_429483 ) ) ( not ( = ?auto_429477 ?auto_429484 ) ) ( not ( = ?auto_429477 ?auto_429485 ) ) ( not ( = ?auto_429477 ?auto_429486 ) ) ( not ( = ?auto_429478 ?auto_429479 ) ) ( not ( = ?auto_429478 ?auto_429480 ) ) ( not ( = ?auto_429478 ?auto_429481 ) ) ( not ( = ?auto_429478 ?auto_429482 ) ) ( not ( = ?auto_429478 ?auto_429483 ) ) ( not ( = ?auto_429478 ?auto_429484 ) ) ( not ( = ?auto_429478 ?auto_429485 ) ) ( not ( = ?auto_429478 ?auto_429486 ) ) ( not ( = ?auto_429479 ?auto_429480 ) ) ( not ( = ?auto_429479 ?auto_429481 ) ) ( not ( = ?auto_429479 ?auto_429482 ) ) ( not ( = ?auto_429479 ?auto_429483 ) ) ( not ( = ?auto_429479 ?auto_429484 ) ) ( not ( = ?auto_429479 ?auto_429485 ) ) ( not ( = ?auto_429479 ?auto_429486 ) ) ( not ( = ?auto_429480 ?auto_429481 ) ) ( not ( = ?auto_429480 ?auto_429482 ) ) ( not ( = ?auto_429480 ?auto_429483 ) ) ( not ( = ?auto_429480 ?auto_429484 ) ) ( not ( = ?auto_429480 ?auto_429485 ) ) ( not ( = ?auto_429480 ?auto_429486 ) ) ( not ( = ?auto_429481 ?auto_429482 ) ) ( not ( = ?auto_429481 ?auto_429483 ) ) ( not ( = ?auto_429481 ?auto_429484 ) ) ( not ( = ?auto_429481 ?auto_429485 ) ) ( not ( = ?auto_429481 ?auto_429486 ) ) ( not ( = ?auto_429482 ?auto_429483 ) ) ( not ( = ?auto_429482 ?auto_429484 ) ) ( not ( = ?auto_429482 ?auto_429485 ) ) ( not ( = ?auto_429482 ?auto_429486 ) ) ( not ( = ?auto_429483 ?auto_429484 ) ) ( not ( = ?auto_429483 ?auto_429485 ) ) ( not ( = ?auto_429483 ?auto_429486 ) ) ( not ( = ?auto_429484 ?auto_429485 ) ) ( not ( = ?auto_429484 ?auto_429486 ) ) ( not ( = ?auto_429485 ?auto_429486 ) ) ( ON ?auto_429484 ?auto_429485 ) ( ON ?auto_429483 ?auto_429484 ) ( ON ?auto_429482 ?auto_429483 ) ( CLEAR ?auto_429480 ) ( ON ?auto_429481 ?auto_429482 ) ( CLEAR ?auto_429481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429477 ?auto_429478 ?auto_429479 ?auto_429480 ?auto_429481 )
      ( MAKE-9PILE ?auto_429477 ?auto_429478 ?auto_429479 ?auto_429480 ?auto_429481 ?auto_429482 ?auto_429483 ?auto_429484 ?auto_429485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429496 - BLOCK
      ?auto_429497 - BLOCK
      ?auto_429498 - BLOCK
      ?auto_429499 - BLOCK
      ?auto_429500 - BLOCK
      ?auto_429501 - BLOCK
      ?auto_429502 - BLOCK
      ?auto_429503 - BLOCK
      ?auto_429504 - BLOCK
    )
    :vars
    (
      ?auto_429505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429504 ?auto_429505 ) ( ON-TABLE ?auto_429496 ) ( ON ?auto_429497 ?auto_429496 ) ( ON ?auto_429498 ?auto_429497 ) ( ON ?auto_429499 ?auto_429498 ) ( not ( = ?auto_429496 ?auto_429497 ) ) ( not ( = ?auto_429496 ?auto_429498 ) ) ( not ( = ?auto_429496 ?auto_429499 ) ) ( not ( = ?auto_429496 ?auto_429500 ) ) ( not ( = ?auto_429496 ?auto_429501 ) ) ( not ( = ?auto_429496 ?auto_429502 ) ) ( not ( = ?auto_429496 ?auto_429503 ) ) ( not ( = ?auto_429496 ?auto_429504 ) ) ( not ( = ?auto_429496 ?auto_429505 ) ) ( not ( = ?auto_429497 ?auto_429498 ) ) ( not ( = ?auto_429497 ?auto_429499 ) ) ( not ( = ?auto_429497 ?auto_429500 ) ) ( not ( = ?auto_429497 ?auto_429501 ) ) ( not ( = ?auto_429497 ?auto_429502 ) ) ( not ( = ?auto_429497 ?auto_429503 ) ) ( not ( = ?auto_429497 ?auto_429504 ) ) ( not ( = ?auto_429497 ?auto_429505 ) ) ( not ( = ?auto_429498 ?auto_429499 ) ) ( not ( = ?auto_429498 ?auto_429500 ) ) ( not ( = ?auto_429498 ?auto_429501 ) ) ( not ( = ?auto_429498 ?auto_429502 ) ) ( not ( = ?auto_429498 ?auto_429503 ) ) ( not ( = ?auto_429498 ?auto_429504 ) ) ( not ( = ?auto_429498 ?auto_429505 ) ) ( not ( = ?auto_429499 ?auto_429500 ) ) ( not ( = ?auto_429499 ?auto_429501 ) ) ( not ( = ?auto_429499 ?auto_429502 ) ) ( not ( = ?auto_429499 ?auto_429503 ) ) ( not ( = ?auto_429499 ?auto_429504 ) ) ( not ( = ?auto_429499 ?auto_429505 ) ) ( not ( = ?auto_429500 ?auto_429501 ) ) ( not ( = ?auto_429500 ?auto_429502 ) ) ( not ( = ?auto_429500 ?auto_429503 ) ) ( not ( = ?auto_429500 ?auto_429504 ) ) ( not ( = ?auto_429500 ?auto_429505 ) ) ( not ( = ?auto_429501 ?auto_429502 ) ) ( not ( = ?auto_429501 ?auto_429503 ) ) ( not ( = ?auto_429501 ?auto_429504 ) ) ( not ( = ?auto_429501 ?auto_429505 ) ) ( not ( = ?auto_429502 ?auto_429503 ) ) ( not ( = ?auto_429502 ?auto_429504 ) ) ( not ( = ?auto_429502 ?auto_429505 ) ) ( not ( = ?auto_429503 ?auto_429504 ) ) ( not ( = ?auto_429503 ?auto_429505 ) ) ( not ( = ?auto_429504 ?auto_429505 ) ) ( ON ?auto_429503 ?auto_429504 ) ( ON ?auto_429502 ?auto_429503 ) ( ON ?auto_429501 ?auto_429502 ) ( CLEAR ?auto_429499 ) ( ON ?auto_429500 ?auto_429501 ) ( CLEAR ?auto_429500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429496 ?auto_429497 ?auto_429498 ?auto_429499 ?auto_429500 )
      ( MAKE-9PILE ?auto_429496 ?auto_429497 ?auto_429498 ?auto_429499 ?auto_429500 ?auto_429501 ?auto_429502 ?auto_429503 ?auto_429504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429515 - BLOCK
      ?auto_429516 - BLOCK
      ?auto_429517 - BLOCK
      ?auto_429518 - BLOCK
      ?auto_429519 - BLOCK
      ?auto_429520 - BLOCK
      ?auto_429521 - BLOCK
      ?auto_429522 - BLOCK
      ?auto_429523 - BLOCK
    )
    :vars
    (
      ?auto_429524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429523 ?auto_429524 ) ( ON-TABLE ?auto_429515 ) ( ON ?auto_429516 ?auto_429515 ) ( ON ?auto_429517 ?auto_429516 ) ( not ( = ?auto_429515 ?auto_429516 ) ) ( not ( = ?auto_429515 ?auto_429517 ) ) ( not ( = ?auto_429515 ?auto_429518 ) ) ( not ( = ?auto_429515 ?auto_429519 ) ) ( not ( = ?auto_429515 ?auto_429520 ) ) ( not ( = ?auto_429515 ?auto_429521 ) ) ( not ( = ?auto_429515 ?auto_429522 ) ) ( not ( = ?auto_429515 ?auto_429523 ) ) ( not ( = ?auto_429515 ?auto_429524 ) ) ( not ( = ?auto_429516 ?auto_429517 ) ) ( not ( = ?auto_429516 ?auto_429518 ) ) ( not ( = ?auto_429516 ?auto_429519 ) ) ( not ( = ?auto_429516 ?auto_429520 ) ) ( not ( = ?auto_429516 ?auto_429521 ) ) ( not ( = ?auto_429516 ?auto_429522 ) ) ( not ( = ?auto_429516 ?auto_429523 ) ) ( not ( = ?auto_429516 ?auto_429524 ) ) ( not ( = ?auto_429517 ?auto_429518 ) ) ( not ( = ?auto_429517 ?auto_429519 ) ) ( not ( = ?auto_429517 ?auto_429520 ) ) ( not ( = ?auto_429517 ?auto_429521 ) ) ( not ( = ?auto_429517 ?auto_429522 ) ) ( not ( = ?auto_429517 ?auto_429523 ) ) ( not ( = ?auto_429517 ?auto_429524 ) ) ( not ( = ?auto_429518 ?auto_429519 ) ) ( not ( = ?auto_429518 ?auto_429520 ) ) ( not ( = ?auto_429518 ?auto_429521 ) ) ( not ( = ?auto_429518 ?auto_429522 ) ) ( not ( = ?auto_429518 ?auto_429523 ) ) ( not ( = ?auto_429518 ?auto_429524 ) ) ( not ( = ?auto_429519 ?auto_429520 ) ) ( not ( = ?auto_429519 ?auto_429521 ) ) ( not ( = ?auto_429519 ?auto_429522 ) ) ( not ( = ?auto_429519 ?auto_429523 ) ) ( not ( = ?auto_429519 ?auto_429524 ) ) ( not ( = ?auto_429520 ?auto_429521 ) ) ( not ( = ?auto_429520 ?auto_429522 ) ) ( not ( = ?auto_429520 ?auto_429523 ) ) ( not ( = ?auto_429520 ?auto_429524 ) ) ( not ( = ?auto_429521 ?auto_429522 ) ) ( not ( = ?auto_429521 ?auto_429523 ) ) ( not ( = ?auto_429521 ?auto_429524 ) ) ( not ( = ?auto_429522 ?auto_429523 ) ) ( not ( = ?auto_429522 ?auto_429524 ) ) ( not ( = ?auto_429523 ?auto_429524 ) ) ( ON ?auto_429522 ?auto_429523 ) ( ON ?auto_429521 ?auto_429522 ) ( ON ?auto_429520 ?auto_429521 ) ( ON ?auto_429519 ?auto_429520 ) ( CLEAR ?auto_429517 ) ( ON ?auto_429518 ?auto_429519 ) ( CLEAR ?auto_429518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429515 ?auto_429516 ?auto_429517 ?auto_429518 )
      ( MAKE-9PILE ?auto_429515 ?auto_429516 ?auto_429517 ?auto_429518 ?auto_429519 ?auto_429520 ?auto_429521 ?auto_429522 ?auto_429523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429534 - BLOCK
      ?auto_429535 - BLOCK
      ?auto_429536 - BLOCK
      ?auto_429537 - BLOCK
      ?auto_429538 - BLOCK
      ?auto_429539 - BLOCK
      ?auto_429540 - BLOCK
      ?auto_429541 - BLOCK
      ?auto_429542 - BLOCK
    )
    :vars
    (
      ?auto_429543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429542 ?auto_429543 ) ( ON-TABLE ?auto_429534 ) ( ON ?auto_429535 ?auto_429534 ) ( ON ?auto_429536 ?auto_429535 ) ( not ( = ?auto_429534 ?auto_429535 ) ) ( not ( = ?auto_429534 ?auto_429536 ) ) ( not ( = ?auto_429534 ?auto_429537 ) ) ( not ( = ?auto_429534 ?auto_429538 ) ) ( not ( = ?auto_429534 ?auto_429539 ) ) ( not ( = ?auto_429534 ?auto_429540 ) ) ( not ( = ?auto_429534 ?auto_429541 ) ) ( not ( = ?auto_429534 ?auto_429542 ) ) ( not ( = ?auto_429534 ?auto_429543 ) ) ( not ( = ?auto_429535 ?auto_429536 ) ) ( not ( = ?auto_429535 ?auto_429537 ) ) ( not ( = ?auto_429535 ?auto_429538 ) ) ( not ( = ?auto_429535 ?auto_429539 ) ) ( not ( = ?auto_429535 ?auto_429540 ) ) ( not ( = ?auto_429535 ?auto_429541 ) ) ( not ( = ?auto_429535 ?auto_429542 ) ) ( not ( = ?auto_429535 ?auto_429543 ) ) ( not ( = ?auto_429536 ?auto_429537 ) ) ( not ( = ?auto_429536 ?auto_429538 ) ) ( not ( = ?auto_429536 ?auto_429539 ) ) ( not ( = ?auto_429536 ?auto_429540 ) ) ( not ( = ?auto_429536 ?auto_429541 ) ) ( not ( = ?auto_429536 ?auto_429542 ) ) ( not ( = ?auto_429536 ?auto_429543 ) ) ( not ( = ?auto_429537 ?auto_429538 ) ) ( not ( = ?auto_429537 ?auto_429539 ) ) ( not ( = ?auto_429537 ?auto_429540 ) ) ( not ( = ?auto_429537 ?auto_429541 ) ) ( not ( = ?auto_429537 ?auto_429542 ) ) ( not ( = ?auto_429537 ?auto_429543 ) ) ( not ( = ?auto_429538 ?auto_429539 ) ) ( not ( = ?auto_429538 ?auto_429540 ) ) ( not ( = ?auto_429538 ?auto_429541 ) ) ( not ( = ?auto_429538 ?auto_429542 ) ) ( not ( = ?auto_429538 ?auto_429543 ) ) ( not ( = ?auto_429539 ?auto_429540 ) ) ( not ( = ?auto_429539 ?auto_429541 ) ) ( not ( = ?auto_429539 ?auto_429542 ) ) ( not ( = ?auto_429539 ?auto_429543 ) ) ( not ( = ?auto_429540 ?auto_429541 ) ) ( not ( = ?auto_429540 ?auto_429542 ) ) ( not ( = ?auto_429540 ?auto_429543 ) ) ( not ( = ?auto_429541 ?auto_429542 ) ) ( not ( = ?auto_429541 ?auto_429543 ) ) ( not ( = ?auto_429542 ?auto_429543 ) ) ( ON ?auto_429541 ?auto_429542 ) ( ON ?auto_429540 ?auto_429541 ) ( ON ?auto_429539 ?auto_429540 ) ( ON ?auto_429538 ?auto_429539 ) ( CLEAR ?auto_429536 ) ( ON ?auto_429537 ?auto_429538 ) ( CLEAR ?auto_429537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429534 ?auto_429535 ?auto_429536 ?auto_429537 )
      ( MAKE-9PILE ?auto_429534 ?auto_429535 ?auto_429536 ?auto_429537 ?auto_429538 ?auto_429539 ?auto_429540 ?auto_429541 ?auto_429542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429553 - BLOCK
      ?auto_429554 - BLOCK
      ?auto_429555 - BLOCK
      ?auto_429556 - BLOCK
      ?auto_429557 - BLOCK
      ?auto_429558 - BLOCK
      ?auto_429559 - BLOCK
      ?auto_429560 - BLOCK
      ?auto_429561 - BLOCK
    )
    :vars
    (
      ?auto_429562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429561 ?auto_429562 ) ( ON-TABLE ?auto_429553 ) ( ON ?auto_429554 ?auto_429553 ) ( not ( = ?auto_429553 ?auto_429554 ) ) ( not ( = ?auto_429553 ?auto_429555 ) ) ( not ( = ?auto_429553 ?auto_429556 ) ) ( not ( = ?auto_429553 ?auto_429557 ) ) ( not ( = ?auto_429553 ?auto_429558 ) ) ( not ( = ?auto_429553 ?auto_429559 ) ) ( not ( = ?auto_429553 ?auto_429560 ) ) ( not ( = ?auto_429553 ?auto_429561 ) ) ( not ( = ?auto_429553 ?auto_429562 ) ) ( not ( = ?auto_429554 ?auto_429555 ) ) ( not ( = ?auto_429554 ?auto_429556 ) ) ( not ( = ?auto_429554 ?auto_429557 ) ) ( not ( = ?auto_429554 ?auto_429558 ) ) ( not ( = ?auto_429554 ?auto_429559 ) ) ( not ( = ?auto_429554 ?auto_429560 ) ) ( not ( = ?auto_429554 ?auto_429561 ) ) ( not ( = ?auto_429554 ?auto_429562 ) ) ( not ( = ?auto_429555 ?auto_429556 ) ) ( not ( = ?auto_429555 ?auto_429557 ) ) ( not ( = ?auto_429555 ?auto_429558 ) ) ( not ( = ?auto_429555 ?auto_429559 ) ) ( not ( = ?auto_429555 ?auto_429560 ) ) ( not ( = ?auto_429555 ?auto_429561 ) ) ( not ( = ?auto_429555 ?auto_429562 ) ) ( not ( = ?auto_429556 ?auto_429557 ) ) ( not ( = ?auto_429556 ?auto_429558 ) ) ( not ( = ?auto_429556 ?auto_429559 ) ) ( not ( = ?auto_429556 ?auto_429560 ) ) ( not ( = ?auto_429556 ?auto_429561 ) ) ( not ( = ?auto_429556 ?auto_429562 ) ) ( not ( = ?auto_429557 ?auto_429558 ) ) ( not ( = ?auto_429557 ?auto_429559 ) ) ( not ( = ?auto_429557 ?auto_429560 ) ) ( not ( = ?auto_429557 ?auto_429561 ) ) ( not ( = ?auto_429557 ?auto_429562 ) ) ( not ( = ?auto_429558 ?auto_429559 ) ) ( not ( = ?auto_429558 ?auto_429560 ) ) ( not ( = ?auto_429558 ?auto_429561 ) ) ( not ( = ?auto_429558 ?auto_429562 ) ) ( not ( = ?auto_429559 ?auto_429560 ) ) ( not ( = ?auto_429559 ?auto_429561 ) ) ( not ( = ?auto_429559 ?auto_429562 ) ) ( not ( = ?auto_429560 ?auto_429561 ) ) ( not ( = ?auto_429560 ?auto_429562 ) ) ( not ( = ?auto_429561 ?auto_429562 ) ) ( ON ?auto_429560 ?auto_429561 ) ( ON ?auto_429559 ?auto_429560 ) ( ON ?auto_429558 ?auto_429559 ) ( ON ?auto_429557 ?auto_429558 ) ( ON ?auto_429556 ?auto_429557 ) ( CLEAR ?auto_429554 ) ( ON ?auto_429555 ?auto_429556 ) ( CLEAR ?auto_429555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429553 ?auto_429554 ?auto_429555 )
      ( MAKE-9PILE ?auto_429553 ?auto_429554 ?auto_429555 ?auto_429556 ?auto_429557 ?auto_429558 ?auto_429559 ?auto_429560 ?auto_429561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429572 - BLOCK
      ?auto_429573 - BLOCK
      ?auto_429574 - BLOCK
      ?auto_429575 - BLOCK
      ?auto_429576 - BLOCK
      ?auto_429577 - BLOCK
      ?auto_429578 - BLOCK
      ?auto_429579 - BLOCK
      ?auto_429580 - BLOCK
    )
    :vars
    (
      ?auto_429581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429580 ?auto_429581 ) ( ON-TABLE ?auto_429572 ) ( ON ?auto_429573 ?auto_429572 ) ( not ( = ?auto_429572 ?auto_429573 ) ) ( not ( = ?auto_429572 ?auto_429574 ) ) ( not ( = ?auto_429572 ?auto_429575 ) ) ( not ( = ?auto_429572 ?auto_429576 ) ) ( not ( = ?auto_429572 ?auto_429577 ) ) ( not ( = ?auto_429572 ?auto_429578 ) ) ( not ( = ?auto_429572 ?auto_429579 ) ) ( not ( = ?auto_429572 ?auto_429580 ) ) ( not ( = ?auto_429572 ?auto_429581 ) ) ( not ( = ?auto_429573 ?auto_429574 ) ) ( not ( = ?auto_429573 ?auto_429575 ) ) ( not ( = ?auto_429573 ?auto_429576 ) ) ( not ( = ?auto_429573 ?auto_429577 ) ) ( not ( = ?auto_429573 ?auto_429578 ) ) ( not ( = ?auto_429573 ?auto_429579 ) ) ( not ( = ?auto_429573 ?auto_429580 ) ) ( not ( = ?auto_429573 ?auto_429581 ) ) ( not ( = ?auto_429574 ?auto_429575 ) ) ( not ( = ?auto_429574 ?auto_429576 ) ) ( not ( = ?auto_429574 ?auto_429577 ) ) ( not ( = ?auto_429574 ?auto_429578 ) ) ( not ( = ?auto_429574 ?auto_429579 ) ) ( not ( = ?auto_429574 ?auto_429580 ) ) ( not ( = ?auto_429574 ?auto_429581 ) ) ( not ( = ?auto_429575 ?auto_429576 ) ) ( not ( = ?auto_429575 ?auto_429577 ) ) ( not ( = ?auto_429575 ?auto_429578 ) ) ( not ( = ?auto_429575 ?auto_429579 ) ) ( not ( = ?auto_429575 ?auto_429580 ) ) ( not ( = ?auto_429575 ?auto_429581 ) ) ( not ( = ?auto_429576 ?auto_429577 ) ) ( not ( = ?auto_429576 ?auto_429578 ) ) ( not ( = ?auto_429576 ?auto_429579 ) ) ( not ( = ?auto_429576 ?auto_429580 ) ) ( not ( = ?auto_429576 ?auto_429581 ) ) ( not ( = ?auto_429577 ?auto_429578 ) ) ( not ( = ?auto_429577 ?auto_429579 ) ) ( not ( = ?auto_429577 ?auto_429580 ) ) ( not ( = ?auto_429577 ?auto_429581 ) ) ( not ( = ?auto_429578 ?auto_429579 ) ) ( not ( = ?auto_429578 ?auto_429580 ) ) ( not ( = ?auto_429578 ?auto_429581 ) ) ( not ( = ?auto_429579 ?auto_429580 ) ) ( not ( = ?auto_429579 ?auto_429581 ) ) ( not ( = ?auto_429580 ?auto_429581 ) ) ( ON ?auto_429579 ?auto_429580 ) ( ON ?auto_429578 ?auto_429579 ) ( ON ?auto_429577 ?auto_429578 ) ( ON ?auto_429576 ?auto_429577 ) ( ON ?auto_429575 ?auto_429576 ) ( CLEAR ?auto_429573 ) ( ON ?auto_429574 ?auto_429575 ) ( CLEAR ?auto_429574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429572 ?auto_429573 ?auto_429574 )
      ( MAKE-9PILE ?auto_429572 ?auto_429573 ?auto_429574 ?auto_429575 ?auto_429576 ?auto_429577 ?auto_429578 ?auto_429579 ?auto_429580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429591 - BLOCK
      ?auto_429592 - BLOCK
      ?auto_429593 - BLOCK
      ?auto_429594 - BLOCK
      ?auto_429595 - BLOCK
      ?auto_429596 - BLOCK
      ?auto_429597 - BLOCK
      ?auto_429598 - BLOCK
      ?auto_429599 - BLOCK
    )
    :vars
    (
      ?auto_429600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429599 ?auto_429600 ) ( ON-TABLE ?auto_429591 ) ( not ( = ?auto_429591 ?auto_429592 ) ) ( not ( = ?auto_429591 ?auto_429593 ) ) ( not ( = ?auto_429591 ?auto_429594 ) ) ( not ( = ?auto_429591 ?auto_429595 ) ) ( not ( = ?auto_429591 ?auto_429596 ) ) ( not ( = ?auto_429591 ?auto_429597 ) ) ( not ( = ?auto_429591 ?auto_429598 ) ) ( not ( = ?auto_429591 ?auto_429599 ) ) ( not ( = ?auto_429591 ?auto_429600 ) ) ( not ( = ?auto_429592 ?auto_429593 ) ) ( not ( = ?auto_429592 ?auto_429594 ) ) ( not ( = ?auto_429592 ?auto_429595 ) ) ( not ( = ?auto_429592 ?auto_429596 ) ) ( not ( = ?auto_429592 ?auto_429597 ) ) ( not ( = ?auto_429592 ?auto_429598 ) ) ( not ( = ?auto_429592 ?auto_429599 ) ) ( not ( = ?auto_429592 ?auto_429600 ) ) ( not ( = ?auto_429593 ?auto_429594 ) ) ( not ( = ?auto_429593 ?auto_429595 ) ) ( not ( = ?auto_429593 ?auto_429596 ) ) ( not ( = ?auto_429593 ?auto_429597 ) ) ( not ( = ?auto_429593 ?auto_429598 ) ) ( not ( = ?auto_429593 ?auto_429599 ) ) ( not ( = ?auto_429593 ?auto_429600 ) ) ( not ( = ?auto_429594 ?auto_429595 ) ) ( not ( = ?auto_429594 ?auto_429596 ) ) ( not ( = ?auto_429594 ?auto_429597 ) ) ( not ( = ?auto_429594 ?auto_429598 ) ) ( not ( = ?auto_429594 ?auto_429599 ) ) ( not ( = ?auto_429594 ?auto_429600 ) ) ( not ( = ?auto_429595 ?auto_429596 ) ) ( not ( = ?auto_429595 ?auto_429597 ) ) ( not ( = ?auto_429595 ?auto_429598 ) ) ( not ( = ?auto_429595 ?auto_429599 ) ) ( not ( = ?auto_429595 ?auto_429600 ) ) ( not ( = ?auto_429596 ?auto_429597 ) ) ( not ( = ?auto_429596 ?auto_429598 ) ) ( not ( = ?auto_429596 ?auto_429599 ) ) ( not ( = ?auto_429596 ?auto_429600 ) ) ( not ( = ?auto_429597 ?auto_429598 ) ) ( not ( = ?auto_429597 ?auto_429599 ) ) ( not ( = ?auto_429597 ?auto_429600 ) ) ( not ( = ?auto_429598 ?auto_429599 ) ) ( not ( = ?auto_429598 ?auto_429600 ) ) ( not ( = ?auto_429599 ?auto_429600 ) ) ( ON ?auto_429598 ?auto_429599 ) ( ON ?auto_429597 ?auto_429598 ) ( ON ?auto_429596 ?auto_429597 ) ( ON ?auto_429595 ?auto_429596 ) ( ON ?auto_429594 ?auto_429595 ) ( ON ?auto_429593 ?auto_429594 ) ( CLEAR ?auto_429591 ) ( ON ?auto_429592 ?auto_429593 ) ( CLEAR ?auto_429592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429591 ?auto_429592 )
      ( MAKE-9PILE ?auto_429591 ?auto_429592 ?auto_429593 ?auto_429594 ?auto_429595 ?auto_429596 ?auto_429597 ?auto_429598 ?auto_429599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429610 - BLOCK
      ?auto_429611 - BLOCK
      ?auto_429612 - BLOCK
      ?auto_429613 - BLOCK
      ?auto_429614 - BLOCK
      ?auto_429615 - BLOCK
      ?auto_429616 - BLOCK
      ?auto_429617 - BLOCK
      ?auto_429618 - BLOCK
    )
    :vars
    (
      ?auto_429619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429618 ?auto_429619 ) ( ON-TABLE ?auto_429610 ) ( not ( = ?auto_429610 ?auto_429611 ) ) ( not ( = ?auto_429610 ?auto_429612 ) ) ( not ( = ?auto_429610 ?auto_429613 ) ) ( not ( = ?auto_429610 ?auto_429614 ) ) ( not ( = ?auto_429610 ?auto_429615 ) ) ( not ( = ?auto_429610 ?auto_429616 ) ) ( not ( = ?auto_429610 ?auto_429617 ) ) ( not ( = ?auto_429610 ?auto_429618 ) ) ( not ( = ?auto_429610 ?auto_429619 ) ) ( not ( = ?auto_429611 ?auto_429612 ) ) ( not ( = ?auto_429611 ?auto_429613 ) ) ( not ( = ?auto_429611 ?auto_429614 ) ) ( not ( = ?auto_429611 ?auto_429615 ) ) ( not ( = ?auto_429611 ?auto_429616 ) ) ( not ( = ?auto_429611 ?auto_429617 ) ) ( not ( = ?auto_429611 ?auto_429618 ) ) ( not ( = ?auto_429611 ?auto_429619 ) ) ( not ( = ?auto_429612 ?auto_429613 ) ) ( not ( = ?auto_429612 ?auto_429614 ) ) ( not ( = ?auto_429612 ?auto_429615 ) ) ( not ( = ?auto_429612 ?auto_429616 ) ) ( not ( = ?auto_429612 ?auto_429617 ) ) ( not ( = ?auto_429612 ?auto_429618 ) ) ( not ( = ?auto_429612 ?auto_429619 ) ) ( not ( = ?auto_429613 ?auto_429614 ) ) ( not ( = ?auto_429613 ?auto_429615 ) ) ( not ( = ?auto_429613 ?auto_429616 ) ) ( not ( = ?auto_429613 ?auto_429617 ) ) ( not ( = ?auto_429613 ?auto_429618 ) ) ( not ( = ?auto_429613 ?auto_429619 ) ) ( not ( = ?auto_429614 ?auto_429615 ) ) ( not ( = ?auto_429614 ?auto_429616 ) ) ( not ( = ?auto_429614 ?auto_429617 ) ) ( not ( = ?auto_429614 ?auto_429618 ) ) ( not ( = ?auto_429614 ?auto_429619 ) ) ( not ( = ?auto_429615 ?auto_429616 ) ) ( not ( = ?auto_429615 ?auto_429617 ) ) ( not ( = ?auto_429615 ?auto_429618 ) ) ( not ( = ?auto_429615 ?auto_429619 ) ) ( not ( = ?auto_429616 ?auto_429617 ) ) ( not ( = ?auto_429616 ?auto_429618 ) ) ( not ( = ?auto_429616 ?auto_429619 ) ) ( not ( = ?auto_429617 ?auto_429618 ) ) ( not ( = ?auto_429617 ?auto_429619 ) ) ( not ( = ?auto_429618 ?auto_429619 ) ) ( ON ?auto_429617 ?auto_429618 ) ( ON ?auto_429616 ?auto_429617 ) ( ON ?auto_429615 ?auto_429616 ) ( ON ?auto_429614 ?auto_429615 ) ( ON ?auto_429613 ?auto_429614 ) ( ON ?auto_429612 ?auto_429613 ) ( CLEAR ?auto_429610 ) ( ON ?auto_429611 ?auto_429612 ) ( CLEAR ?auto_429611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429610 ?auto_429611 )
      ( MAKE-9PILE ?auto_429610 ?auto_429611 ?auto_429612 ?auto_429613 ?auto_429614 ?auto_429615 ?auto_429616 ?auto_429617 ?auto_429618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429629 - BLOCK
      ?auto_429630 - BLOCK
      ?auto_429631 - BLOCK
      ?auto_429632 - BLOCK
      ?auto_429633 - BLOCK
      ?auto_429634 - BLOCK
      ?auto_429635 - BLOCK
      ?auto_429636 - BLOCK
      ?auto_429637 - BLOCK
    )
    :vars
    (
      ?auto_429638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429637 ?auto_429638 ) ( not ( = ?auto_429629 ?auto_429630 ) ) ( not ( = ?auto_429629 ?auto_429631 ) ) ( not ( = ?auto_429629 ?auto_429632 ) ) ( not ( = ?auto_429629 ?auto_429633 ) ) ( not ( = ?auto_429629 ?auto_429634 ) ) ( not ( = ?auto_429629 ?auto_429635 ) ) ( not ( = ?auto_429629 ?auto_429636 ) ) ( not ( = ?auto_429629 ?auto_429637 ) ) ( not ( = ?auto_429629 ?auto_429638 ) ) ( not ( = ?auto_429630 ?auto_429631 ) ) ( not ( = ?auto_429630 ?auto_429632 ) ) ( not ( = ?auto_429630 ?auto_429633 ) ) ( not ( = ?auto_429630 ?auto_429634 ) ) ( not ( = ?auto_429630 ?auto_429635 ) ) ( not ( = ?auto_429630 ?auto_429636 ) ) ( not ( = ?auto_429630 ?auto_429637 ) ) ( not ( = ?auto_429630 ?auto_429638 ) ) ( not ( = ?auto_429631 ?auto_429632 ) ) ( not ( = ?auto_429631 ?auto_429633 ) ) ( not ( = ?auto_429631 ?auto_429634 ) ) ( not ( = ?auto_429631 ?auto_429635 ) ) ( not ( = ?auto_429631 ?auto_429636 ) ) ( not ( = ?auto_429631 ?auto_429637 ) ) ( not ( = ?auto_429631 ?auto_429638 ) ) ( not ( = ?auto_429632 ?auto_429633 ) ) ( not ( = ?auto_429632 ?auto_429634 ) ) ( not ( = ?auto_429632 ?auto_429635 ) ) ( not ( = ?auto_429632 ?auto_429636 ) ) ( not ( = ?auto_429632 ?auto_429637 ) ) ( not ( = ?auto_429632 ?auto_429638 ) ) ( not ( = ?auto_429633 ?auto_429634 ) ) ( not ( = ?auto_429633 ?auto_429635 ) ) ( not ( = ?auto_429633 ?auto_429636 ) ) ( not ( = ?auto_429633 ?auto_429637 ) ) ( not ( = ?auto_429633 ?auto_429638 ) ) ( not ( = ?auto_429634 ?auto_429635 ) ) ( not ( = ?auto_429634 ?auto_429636 ) ) ( not ( = ?auto_429634 ?auto_429637 ) ) ( not ( = ?auto_429634 ?auto_429638 ) ) ( not ( = ?auto_429635 ?auto_429636 ) ) ( not ( = ?auto_429635 ?auto_429637 ) ) ( not ( = ?auto_429635 ?auto_429638 ) ) ( not ( = ?auto_429636 ?auto_429637 ) ) ( not ( = ?auto_429636 ?auto_429638 ) ) ( not ( = ?auto_429637 ?auto_429638 ) ) ( ON ?auto_429636 ?auto_429637 ) ( ON ?auto_429635 ?auto_429636 ) ( ON ?auto_429634 ?auto_429635 ) ( ON ?auto_429633 ?auto_429634 ) ( ON ?auto_429632 ?auto_429633 ) ( ON ?auto_429631 ?auto_429632 ) ( ON ?auto_429630 ?auto_429631 ) ( ON ?auto_429629 ?auto_429630 ) ( CLEAR ?auto_429629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429629 )
      ( MAKE-9PILE ?auto_429629 ?auto_429630 ?auto_429631 ?auto_429632 ?auto_429633 ?auto_429634 ?auto_429635 ?auto_429636 ?auto_429637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429648 - BLOCK
      ?auto_429649 - BLOCK
      ?auto_429650 - BLOCK
      ?auto_429651 - BLOCK
      ?auto_429652 - BLOCK
      ?auto_429653 - BLOCK
      ?auto_429654 - BLOCK
      ?auto_429655 - BLOCK
      ?auto_429656 - BLOCK
    )
    :vars
    (
      ?auto_429657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429656 ?auto_429657 ) ( not ( = ?auto_429648 ?auto_429649 ) ) ( not ( = ?auto_429648 ?auto_429650 ) ) ( not ( = ?auto_429648 ?auto_429651 ) ) ( not ( = ?auto_429648 ?auto_429652 ) ) ( not ( = ?auto_429648 ?auto_429653 ) ) ( not ( = ?auto_429648 ?auto_429654 ) ) ( not ( = ?auto_429648 ?auto_429655 ) ) ( not ( = ?auto_429648 ?auto_429656 ) ) ( not ( = ?auto_429648 ?auto_429657 ) ) ( not ( = ?auto_429649 ?auto_429650 ) ) ( not ( = ?auto_429649 ?auto_429651 ) ) ( not ( = ?auto_429649 ?auto_429652 ) ) ( not ( = ?auto_429649 ?auto_429653 ) ) ( not ( = ?auto_429649 ?auto_429654 ) ) ( not ( = ?auto_429649 ?auto_429655 ) ) ( not ( = ?auto_429649 ?auto_429656 ) ) ( not ( = ?auto_429649 ?auto_429657 ) ) ( not ( = ?auto_429650 ?auto_429651 ) ) ( not ( = ?auto_429650 ?auto_429652 ) ) ( not ( = ?auto_429650 ?auto_429653 ) ) ( not ( = ?auto_429650 ?auto_429654 ) ) ( not ( = ?auto_429650 ?auto_429655 ) ) ( not ( = ?auto_429650 ?auto_429656 ) ) ( not ( = ?auto_429650 ?auto_429657 ) ) ( not ( = ?auto_429651 ?auto_429652 ) ) ( not ( = ?auto_429651 ?auto_429653 ) ) ( not ( = ?auto_429651 ?auto_429654 ) ) ( not ( = ?auto_429651 ?auto_429655 ) ) ( not ( = ?auto_429651 ?auto_429656 ) ) ( not ( = ?auto_429651 ?auto_429657 ) ) ( not ( = ?auto_429652 ?auto_429653 ) ) ( not ( = ?auto_429652 ?auto_429654 ) ) ( not ( = ?auto_429652 ?auto_429655 ) ) ( not ( = ?auto_429652 ?auto_429656 ) ) ( not ( = ?auto_429652 ?auto_429657 ) ) ( not ( = ?auto_429653 ?auto_429654 ) ) ( not ( = ?auto_429653 ?auto_429655 ) ) ( not ( = ?auto_429653 ?auto_429656 ) ) ( not ( = ?auto_429653 ?auto_429657 ) ) ( not ( = ?auto_429654 ?auto_429655 ) ) ( not ( = ?auto_429654 ?auto_429656 ) ) ( not ( = ?auto_429654 ?auto_429657 ) ) ( not ( = ?auto_429655 ?auto_429656 ) ) ( not ( = ?auto_429655 ?auto_429657 ) ) ( not ( = ?auto_429656 ?auto_429657 ) ) ( ON ?auto_429655 ?auto_429656 ) ( ON ?auto_429654 ?auto_429655 ) ( ON ?auto_429653 ?auto_429654 ) ( ON ?auto_429652 ?auto_429653 ) ( ON ?auto_429651 ?auto_429652 ) ( ON ?auto_429650 ?auto_429651 ) ( ON ?auto_429649 ?auto_429650 ) ( ON ?auto_429648 ?auto_429649 ) ( CLEAR ?auto_429648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429648 )
      ( MAKE-9PILE ?auto_429648 ?auto_429649 ?auto_429650 ?auto_429651 ?auto_429652 ?auto_429653 ?auto_429654 ?auto_429655 ?auto_429656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429668 - BLOCK
      ?auto_429669 - BLOCK
      ?auto_429670 - BLOCK
      ?auto_429671 - BLOCK
      ?auto_429672 - BLOCK
      ?auto_429673 - BLOCK
      ?auto_429674 - BLOCK
      ?auto_429675 - BLOCK
      ?auto_429676 - BLOCK
      ?auto_429677 - BLOCK
    )
    :vars
    (
      ?auto_429678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429676 ) ( ON ?auto_429677 ?auto_429678 ) ( CLEAR ?auto_429677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429668 ) ( ON ?auto_429669 ?auto_429668 ) ( ON ?auto_429670 ?auto_429669 ) ( ON ?auto_429671 ?auto_429670 ) ( ON ?auto_429672 ?auto_429671 ) ( ON ?auto_429673 ?auto_429672 ) ( ON ?auto_429674 ?auto_429673 ) ( ON ?auto_429675 ?auto_429674 ) ( ON ?auto_429676 ?auto_429675 ) ( not ( = ?auto_429668 ?auto_429669 ) ) ( not ( = ?auto_429668 ?auto_429670 ) ) ( not ( = ?auto_429668 ?auto_429671 ) ) ( not ( = ?auto_429668 ?auto_429672 ) ) ( not ( = ?auto_429668 ?auto_429673 ) ) ( not ( = ?auto_429668 ?auto_429674 ) ) ( not ( = ?auto_429668 ?auto_429675 ) ) ( not ( = ?auto_429668 ?auto_429676 ) ) ( not ( = ?auto_429668 ?auto_429677 ) ) ( not ( = ?auto_429668 ?auto_429678 ) ) ( not ( = ?auto_429669 ?auto_429670 ) ) ( not ( = ?auto_429669 ?auto_429671 ) ) ( not ( = ?auto_429669 ?auto_429672 ) ) ( not ( = ?auto_429669 ?auto_429673 ) ) ( not ( = ?auto_429669 ?auto_429674 ) ) ( not ( = ?auto_429669 ?auto_429675 ) ) ( not ( = ?auto_429669 ?auto_429676 ) ) ( not ( = ?auto_429669 ?auto_429677 ) ) ( not ( = ?auto_429669 ?auto_429678 ) ) ( not ( = ?auto_429670 ?auto_429671 ) ) ( not ( = ?auto_429670 ?auto_429672 ) ) ( not ( = ?auto_429670 ?auto_429673 ) ) ( not ( = ?auto_429670 ?auto_429674 ) ) ( not ( = ?auto_429670 ?auto_429675 ) ) ( not ( = ?auto_429670 ?auto_429676 ) ) ( not ( = ?auto_429670 ?auto_429677 ) ) ( not ( = ?auto_429670 ?auto_429678 ) ) ( not ( = ?auto_429671 ?auto_429672 ) ) ( not ( = ?auto_429671 ?auto_429673 ) ) ( not ( = ?auto_429671 ?auto_429674 ) ) ( not ( = ?auto_429671 ?auto_429675 ) ) ( not ( = ?auto_429671 ?auto_429676 ) ) ( not ( = ?auto_429671 ?auto_429677 ) ) ( not ( = ?auto_429671 ?auto_429678 ) ) ( not ( = ?auto_429672 ?auto_429673 ) ) ( not ( = ?auto_429672 ?auto_429674 ) ) ( not ( = ?auto_429672 ?auto_429675 ) ) ( not ( = ?auto_429672 ?auto_429676 ) ) ( not ( = ?auto_429672 ?auto_429677 ) ) ( not ( = ?auto_429672 ?auto_429678 ) ) ( not ( = ?auto_429673 ?auto_429674 ) ) ( not ( = ?auto_429673 ?auto_429675 ) ) ( not ( = ?auto_429673 ?auto_429676 ) ) ( not ( = ?auto_429673 ?auto_429677 ) ) ( not ( = ?auto_429673 ?auto_429678 ) ) ( not ( = ?auto_429674 ?auto_429675 ) ) ( not ( = ?auto_429674 ?auto_429676 ) ) ( not ( = ?auto_429674 ?auto_429677 ) ) ( not ( = ?auto_429674 ?auto_429678 ) ) ( not ( = ?auto_429675 ?auto_429676 ) ) ( not ( = ?auto_429675 ?auto_429677 ) ) ( not ( = ?auto_429675 ?auto_429678 ) ) ( not ( = ?auto_429676 ?auto_429677 ) ) ( not ( = ?auto_429676 ?auto_429678 ) ) ( not ( = ?auto_429677 ?auto_429678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429677 ?auto_429678 )
      ( !STACK ?auto_429677 ?auto_429676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429689 - BLOCK
      ?auto_429690 - BLOCK
      ?auto_429691 - BLOCK
      ?auto_429692 - BLOCK
      ?auto_429693 - BLOCK
      ?auto_429694 - BLOCK
      ?auto_429695 - BLOCK
      ?auto_429696 - BLOCK
      ?auto_429697 - BLOCK
      ?auto_429698 - BLOCK
    )
    :vars
    (
      ?auto_429699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429697 ) ( ON ?auto_429698 ?auto_429699 ) ( CLEAR ?auto_429698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429689 ) ( ON ?auto_429690 ?auto_429689 ) ( ON ?auto_429691 ?auto_429690 ) ( ON ?auto_429692 ?auto_429691 ) ( ON ?auto_429693 ?auto_429692 ) ( ON ?auto_429694 ?auto_429693 ) ( ON ?auto_429695 ?auto_429694 ) ( ON ?auto_429696 ?auto_429695 ) ( ON ?auto_429697 ?auto_429696 ) ( not ( = ?auto_429689 ?auto_429690 ) ) ( not ( = ?auto_429689 ?auto_429691 ) ) ( not ( = ?auto_429689 ?auto_429692 ) ) ( not ( = ?auto_429689 ?auto_429693 ) ) ( not ( = ?auto_429689 ?auto_429694 ) ) ( not ( = ?auto_429689 ?auto_429695 ) ) ( not ( = ?auto_429689 ?auto_429696 ) ) ( not ( = ?auto_429689 ?auto_429697 ) ) ( not ( = ?auto_429689 ?auto_429698 ) ) ( not ( = ?auto_429689 ?auto_429699 ) ) ( not ( = ?auto_429690 ?auto_429691 ) ) ( not ( = ?auto_429690 ?auto_429692 ) ) ( not ( = ?auto_429690 ?auto_429693 ) ) ( not ( = ?auto_429690 ?auto_429694 ) ) ( not ( = ?auto_429690 ?auto_429695 ) ) ( not ( = ?auto_429690 ?auto_429696 ) ) ( not ( = ?auto_429690 ?auto_429697 ) ) ( not ( = ?auto_429690 ?auto_429698 ) ) ( not ( = ?auto_429690 ?auto_429699 ) ) ( not ( = ?auto_429691 ?auto_429692 ) ) ( not ( = ?auto_429691 ?auto_429693 ) ) ( not ( = ?auto_429691 ?auto_429694 ) ) ( not ( = ?auto_429691 ?auto_429695 ) ) ( not ( = ?auto_429691 ?auto_429696 ) ) ( not ( = ?auto_429691 ?auto_429697 ) ) ( not ( = ?auto_429691 ?auto_429698 ) ) ( not ( = ?auto_429691 ?auto_429699 ) ) ( not ( = ?auto_429692 ?auto_429693 ) ) ( not ( = ?auto_429692 ?auto_429694 ) ) ( not ( = ?auto_429692 ?auto_429695 ) ) ( not ( = ?auto_429692 ?auto_429696 ) ) ( not ( = ?auto_429692 ?auto_429697 ) ) ( not ( = ?auto_429692 ?auto_429698 ) ) ( not ( = ?auto_429692 ?auto_429699 ) ) ( not ( = ?auto_429693 ?auto_429694 ) ) ( not ( = ?auto_429693 ?auto_429695 ) ) ( not ( = ?auto_429693 ?auto_429696 ) ) ( not ( = ?auto_429693 ?auto_429697 ) ) ( not ( = ?auto_429693 ?auto_429698 ) ) ( not ( = ?auto_429693 ?auto_429699 ) ) ( not ( = ?auto_429694 ?auto_429695 ) ) ( not ( = ?auto_429694 ?auto_429696 ) ) ( not ( = ?auto_429694 ?auto_429697 ) ) ( not ( = ?auto_429694 ?auto_429698 ) ) ( not ( = ?auto_429694 ?auto_429699 ) ) ( not ( = ?auto_429695 ?auto_429696 ) ) ( not ( = ?auto_429695 ?auto_429697 ) ) ( not ( = ?auto_429695 ?auto_429698 ) ) ( not ( = ?auto_429695 ?auto_429699 ) ) ( not ( = ?auto_429696 ?auto_429697 ) ) ( not ( = ?auto_429696 ?auto_429698 ) ) ( not ( = ?auto_429696 ?auto_429699 ) ) ( not ( = ?auto_429697 ?auto_429698 ) ) ( not ( = ?auto_429697 ?auto_429699 ) ) ( not ( = ?auto_429698 ?auto_429699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429698 ?auto_429699 )
      ( !STACK ?auto_429698 ?auto_429697 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429710 - BLOCK
      ?auto_429711 - BLOCK
      ?auto_429712 - BLOCK
      ?auto_429713 - BLOCK
      ?auto_429714 - BLOCK
      ?auto_429715 - BLOCK
      ?auto_429716 - BLOCK
      ?auto_429717 - BLOCK
      ?auto_429718 - BLOCK
      ?auto_429719 - BLOCK
    )
    :vars
    (
      ?auto_429720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429719 ?auto_429720 ) ( ON-TABLE ?auto_429710 ) ( ON ?auto_429711 ?auto_429710 ) ( ON ?auto_429712 ?auto_429711 ) ( ON ?auto_429713 ?auto_429712 ) ( ON ?auto_429714 ?auto_429713 ) ( ON ?auto_429715 ?auto_429714 ) ( ON ?auto_429716 ?auto_429715 ) ( ON ?auto_429717 ?auto_429716 ) ( not ( = ?auto_429710 ?auto_429711 ) ) ( not ( = ?auto_429710 ?auto_429712 ) ) ( not ( = ?auto_429710 ?auto_429713 ) ) ( not ( = ?auto_429710 ?auto_429714 ) ) ( not ( = ?auto_429710 ?auto_429715 ) ) ( not ( = ?auto_429710 ?auto_429716 ) ) ( not ( = ?auto_429710 ?auto_429717 ) ) ( not ( = ?auto_429710 ?auto_429718 ) ) ( not ( = ?auto_429710 ?auto_429719 ) ) ( not ( = ?auto_429710 ?auto_429720 ) ) ( not ( = ?auto_429711 ?auto_429712 ) ) ( not ( = ?auto_429711 ?auto_429713 ) ) ( not ( = ?auto_429711 ?auto_429714 ) ) ( not ( = ?auto_429711 ?auto_429715 ) ) ( not ( = ?auto_429711 ?auto_429716 ) ) ( not ( = ?auto_429711 ?auto_429717 ) ) ( not ( = ?auto_429711 ?auto_429718 ) ) ( not ( = ?auto_429711 ?auto_429719 ) ) ( not ( = ?auto_429711 ?auto_429720 ) ) ( not ( = ?auto_429712 ?auto_429713 ) ) ( not ( = ?auto_429712 ?auto_429714 ) ) ( not ( = ?auto_429712 ?auto_429715 ) ) ( not ( = ?auto_429712 ?auto_429716 ) ) ( not ( = ?auto_429712 ?auto_429717 ) ) ( not ( = ?auto_429712 ?auto_429718 ) ) ( not ( = ?auto_429712 ?auto_429719 ) ) ( not ( = ?auto_429712 ?auto_429720 ) ) ( not ( = ?auto_429713 ?auto_429714 ) ) ( not ( = ?auto_429713 ?auto_429715 ) ) ( not ( = ?auto_429713 ?auto_429716 ) ) ( not ( = ?auto_429713 ?auto_429717 ) ) ( not ( = ?auto_429713 ?auto_429718 ) ) ( not ( = ?auto_429713 ?auto_429719 ) ) ( not ( = ?auto_429713 ?auto_429720 ) ) ( not ( = ?auto_429714 ?auto_429715 ) ) ( not ( = ?auto_429714 ?auto_429716 ) ) ( not ( = ?auto_429714 ?auto_429717 ) ) ( not ( = ?auto_429714 ?auto_429718 ) ) ( not ( = ?auto_429714 ?auto_429719 ) ) ( not ( = ?auto_429714 ?auto_429720 ) ) ( not ( = ?auto_429715 ?auto_429716 ) ) ( not ( = ?auto_429715 ?auto_429717 ) ) ( not ( = ?auto_429715 ?auto_429718 ) ) ( not ( = ?auto_429715 ?auto_429719 ) ) ( not ( = ?auto_429715 ?auto_429720 ) ) ( not ( = ?auto_429716 ?auto_429717 ) ) ( not ( = ?auto_429716 ?auto_429718 ) ) ( not ( = ?auto_429716 ?auto_429719 ) ) ( not ( = ?auto_429716 ?auto_429720 ) ) ( not ( = ?auto_429717 ?auto_429718 ) ) ( not ( = ?auto_429717 ?auto_429719 ) ) ( not ( = ?auto_429717 ?auto_429720 ) ) ( not ( = ?auto_429718 ?auto_429719 ) ) ( not ( = ?auto_429718 ?auto_429720 ) ) ( not ( = ?auto_429719 ?auto_429720 ) ) ( CLEAR ?auto_429717 ) ( ON ?auto_429718 ?auto_429719 ) ( CLEAR ?auto_429718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_429710 ?auto_429711 ?auto_429712 ?auto_429713 ?auto_429714 ?auto_429715 ?auto_429716 ?auto_429717 ?auto_429718 )
      ( MAKE-10PILE ?auto_429710 ?auto_429711 ?auto_429712 ?auto_429713 ?auto_429714 ?auto_429715 ?auto_429716 ?auto_429717 ?auto_429718 ?auto_429719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429731 - BLOCK
      ?auto_429732 - BLOCK
      ?auto_429733 - BLOCK
      ?auto_429734 - BLOCK
      ?auto_429735 - BLOCK
      ?auto_429736 - BLOCK
      ?auto_429737 - BLOCK
      ?auto_429738 - BLOCK
      ?auto_429739 - BLOCK
      ?auto_429740 - BLOCK
    )
    :vars
    (
      ?auto_429741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429740 ?auto_429741 ) ( ON-TABLE ?auto_429731 ) ( ON ?auto_429732 ?auto_429731 ) ( ON ?auto_429733 ?auto_429732 ) ( ON ?auto_429734 ?auto_429733 ) ( ON ?auto_429735 ?auto_429734 ) ( ON ?auto_429736 ?auto_429735 ) ( ON ?auto_429737 ?auto_429736 ) ( ON ?auto_429738 ?auto_429737 ) ( not ( = ?auto_429731 ?auto_429732 ) ) ( not ( = ?auto_429731 ?auto_429733 ) ) ( not ( = ?auto_429731 ?auto_429734 ) ) ( not ( = ?auto_429731 ?auto_429735 ) ) ( not ( = ?auto_429731 ?auto_429736 ) ) ( not ( = ?auto_429731 ?auto_429737 ) ) ( not ( = ?auto_429731 ?auto_429738 ) ) ( not ( = ?auto_429731 ?auto_429739 ) ) ( not ( = ?auto_429731 ?auto_429740 ) ) ( not ( = ?auto_429731 ?auto_429741 ) ) ( not ( = ?auto_429732 ?auto_429733 ) ) ( not ( = ?auto_429732 ?auto_429734 ) ) ( not ( = ?auto_429732 ?auto_429735 ) ) ( not ( = ?auto_429732 ?auto_429736 ) ) ( not ( = ?auto_429732 ?auto_429737 ) ) ( not ( = ?auto_429732 ?auto_429738 ) ) ( not ( = ?auto_429732 ?auto_429739 ) ) ( not ( = ?auto_429732 ?auto_429740 ) ) ( not ( = ?auto_429732 ?auto_429741 ) ) ( not ( = ?auto_429733 ?auto_429734 ) ) ( not ( = ?auto_429733 ?auto_429735 ) ) ( not ( = ?auto_429733 ?auto_429736 ) ) ( not ( = ?auto_429733 ?auto_429737 ) ) ( not ( = ?auto_429733 ?auto_429738 ) ) ( not ( = ?auto_429733 ?auto_429739 ) ) ( not ( = ?auto_429733 ?auto_429740 ) ) ( not ( = ?auto_429733 ?auto_429741 ) ) ( not ( = ?auto_429734 ?auto_429735 ) ) ( not ( = ?auto_429734 ?auto_429736 ) ) ( not ( = ?auto_429734 ?auto_429737 ) ) ( not ( = ?auto_429734 ?auto_429738 ) ) ( not ( = ?auto_429734 ?auto_429739 ) ) ( not ( = ?auto_429734 ?auto_429740 ) ) ( not ( = ?auto_429734 ?auto_429741 ) ) ( not ( = ?auto_429735 ?auto_429736 ) ) ( not ( = ?auto_429735 ?auto_429737 ) ) ( not ( = ?auto_429735 ?auto_429738 ) ) ( not ( = ?auto_429735 ?auto_429739 ) ) ( not ( = ?auto_429735 ?auto_429740 ) ) ( not ( = ?auto_429735 ?auto_429741 ) ) ( not ( = ?auto_429736 ?auto_429737 ) ) ( not ( = ?auto_429736 ?auto_429738 ) ) ( not ( = ?auto_429736 ?auto_429739 ) ) ( not ( = ?auto_429736 ?auto_429740 ) ) ( not ( = ?auto_429736 ?auto_429741 ) ) ( not ( = ?auto_429737 ?auto_429738 ) ) ( not ( = ?auto_429737 ?auto_429739 ) ) ( not ( = ?auto_429737 ?auto_429740 ) ) ( not ( = ?auto_429737 ?auto_429741 ) ) ( not ( = ?auto_429738 ?auto_429739 ) ) ( not ( = ?auto_429738 ?auto_429740 ) ) ( not ( = ?auto_429738 ?auto_429741 ) ) ( not ( = ?auto_429739 ?auto_429740 ) ) ( not ( = ?auto_429739 ?auto_429741 ) ) ( not ( = ?auto_429740 ?auto_429741 ) ) ( CLEAR ?auto_429738 ) ( ON ?auto_429739 ?auto_429740 ) ( CLEAR ?auto_429739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_429731 ?auto_429732 ?auto_429733 ?auto_429734 ?auto_429735 ?auto_429736 ?auto_429737 ?auto_429738 ?auto_429739 )
      ( MAKE-10PILE ?auto_429731 ?auto_429732 ?auto_429733 ?auto_429734 ?auto_429735 ?auto_429736 ?auto_429737 ?auto_429738 ?auto_429739 ?auto_429740 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429752 - BLOCK
      ?auto_429753 - BLOCK
      ?auto_429754 - BLOCK
      ?auto_429755 - BLOCK
      ?auto_429756 - BLOCK
      ?auto_429757 - BLOCK
      ?auto_429758 - BLOCK
      ?auto_429759 - BLOCK
      ?auto_429760 - BLOCK
      ?auto_429761 - BLOCK
    )
    :vars
    (
      ?auto_429762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429761 ?auto_429762 ) ( ON-TABLE ?auto_429752 ) ( ON ?auto_429753 ?auto_429752 ) ( ON ?auto_429754 ?auto_429753 ) ( ON ?auto_429755 ?auto_429754 ) ( ON ?auto_429756 ?auto_429755 ) ( ON ?auto_429757 ?auto_429756 ) ( ON ?auto_429758 ?auto_429757 ) ( not ( = ?auto_429752 ?auto_429753 ) ) ( not ( = ?auto_429752 ?auto_429754 ) ) ( not ( = ?auto_429752 ?auto_429755 ) ) ( not ( = ?auto_429752 ?auto_429756 ) ) ( not ( = ?auto_429752 ?auto_429757 ) ) ( not ( = ?auto_429752 ?auto_429758 ) ) ( not ( = ?auto_429752 ?auto_429759 ) ) ( not ( = ?auto_429752 ?auto_429760 ) ) ( not ( = ?auto_429752 ?auto_429761 ) ) ( not ( = ?auto_429752 ?auto_429762 ) ) ( not ( = ?auto_429753 ?auto_429754 ) ) ( not ( = ?auto_429753 ?auto_429755 ) ) ( not ( = ?auto_429753 ?auto_429756 ) ) ( not ( = ?auto_429753 ?auto_429757 ) ) ( not ( = ?auto_429753 ?auto_429758 ) ) ( not ( = ?auto_429753 ?auto_429759 ) ) ( not ( = ?auto_429753 ?auto_429760 ) ) ( not ( = ?auto_429753 ?auto_429761 ) ) ( not ( = ?auto_429753 ?auto_429762 ) ) ( not ( = ?auto_429754 ?auto_429755 ) ) ( not ( = ?auto_429754 ?auto_429756 ) ) ( not ( = ?auto_429754 ?auto_429757 ) ) ( not ( = ?auto_429754 ?auto_429758 ) ) ( not ( = ?auto_429754 ?auto_429759 ) ) ( not ( = ?auto_429754 ?auto_429760 ) ) ( not ( = ?auto_429754 ?auto_429761 ) ) ( not ( = ?auto_429754 ?auto_429762 ) ) ( not ( = ?auto_429755 ?auto_429756 ) ) ( not ( = ?auto_429755 ?auto_429757 ) ) ( not ( = ?auto_429755 ?auto_429758 ) ) ( not ( = ?auto_429755 ?auto_429759 ) ) ( not ( = ?auto_429755 ?auto_429760 ) ) ( not ( = ?auto_429755 ?auto_429761 ) ) ( not ( = ?auto_429755 ?auto_429762 ) ) ( not ( = ?auto_429756 ?auto_429757 ) ) ( not ( = ?auto_429756 ?auto_429758 ) ) ( not ( = ?auto_429756 ?auto_429759 ) ) ( not ( = ?auto_429756 ?auto_429760 ) ) ( not ( = ?auto_429756 ?auto_429761 ) ) ( not ( = ?auto_429756 ?auto_429762 ) ) ( not ( = ?auto_429757 ?auto_429758 ) ) ( not ( = ?auto_429757 ?auto_429759 ) ) ( not ( = ?auto_429757 ?auto_429760 ) ) ( not ( = ?auto_429757 ?auto_429761 ) ) ( not ( = ?auto_429757 ?auto_429762 ) ) ( not ( = ?auto_429758 ?auto_429759 ) ) ( not ( = ?auto_429758 ?auto_429760 ) ) ( not ( = ?auto_429758 ?auto_429761 ) ) ( not ( = ?auto_429758 ?auto_429762 ) ) ( not ( = ?auto_429759 ?auto_429760 ) ) ( not ( = ?auto_429759 ?auto_429761 ) ) ( not ( = ?auto_429759 ?auto_429762 ) ) ( not ( = ?auto_429760 ?auto_429761 ) ) ( not ( = ?auto_429760 ?auto_429762 ) ) ( not ( = ?auto_429761 ?auto_429762 ) ) ( ON ?auto_429760 ?auto_429761 ) ( CLEAR ?auto_429758 ) ( ON ?auto_429759 ?auto_429760 ) ( CLEAR ?auto_429759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429752 ?auto_429753 ?auto_429754 ?auto_429755 ?auto_429756 ?auto_429757 ?auto_429758 ?auto_429759 )
      ( MAKE-10PILE ?auto_429752 ?auto_429753 ?auto_429754 ?auto_429755 ?auto_429756 ?auto_429757 ?auto_429758 ?auto_429759 ?auto_429760 ?auto_429761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429773 - BLOCK
      ?auto_429774 - BLOCK
      ?auto_429775 - BLOCK
      ?auto_429776 - BLOCK
      ?auto_429777 - BLOCK
      ?auto_429778 - BLOCK
      ?auto_429779 - BLOCK
      ?auto_429780 - BLOCK
      ?auto_429781 - BLOCK
      ?auto_429782 - BLOCK
    )
    :vars
    (
      ?auto_429783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429782 ?auto_429783 ) ( ON-TABLE ?auto_429773 ) ( ON ?auto_429774 ?auto_429773 ) ( ON ?auto_429775 ?auto_429774 ) ( ON ?auto_429776 ?auto_429775 ) ( ON ?auto_429777 ?auto_429776 ) ( ON ?auto_429778 ?auto_429777 ) ( ON ?auto_429779 ?auto_429778 ) ( not ( = ?auto_429773 ?auto_429774 ) ) ( not ( = ?auto_429773 ?auto_429775 ) ) ( not ( = ?auto_429773 ?auto_429776 ) ) ( not ( = ?auto_429773 ?auto_429777 ) ) ( not ( = ?auto_429773 ?auto_429778 ) ) ( not ( = ?auto_429773 ?auto_429779 ) ) ( not ( = ?auto_429773 ?auto_429780 ) ) ( not ( = ?auto_429773 ?auto_429781 ) ) ( not ( = ?auto_429773 ?auto_429782 ) ) ( not ( = ?auto_429773 ?auto_429783 ) ) ( not ( = ?auto_429774 ?auto_429775 ) ) ( not ( = ?auto_429774 ?auto_429776 ) ) ( not ( = ?auto_429774 ?auto_429777 ) ) ( not ( = ?auto_429774 ?auto_429778 ) ) ( not ( = ?auto_429774 ?auto_429779 ) ) ( not ( = ?auto_429774 ?auto_429780 ) ) ( not ( = ?auto_429774 ?auto_429781 ) ) ( not ( = ?auto_429774 ?auto_429782 ) ) ( not ( = ?auto_429774 ?auto_429783 ) ) ( not ( = ?auto_429775 ?auto_429776 ) ) ( not ( = ?auto_429775 ?auto_429777 ) ) ( not ( = ?auto_429775 ?auto_429778 ) ) ( not ( = ?auto_429775 ?auto_429779 ) ) ( not ( = ?auto_429775 ?auto_429780 ) ) ( not ( = ?auto_429775 ?auto_429781 ) ) ( not ( = ?auto_429775 ?auto_429782 ) ) ( not ( = ?auto_429775 ?auto_429783 ) ) ( not ( = ?auto_429776 ?auto_429777 ) ) ( not ( = ?auto_429776 ?auto_429778 ) ) ( not ( = ?auto_429776 ?auto_429779 ) ) ( not ( = ?auto_429776 ?auto_429780 ) ) ( not ( = ?auto_429776 ?auto_429781 ) ) ( not ( = ?auto_429776 ?auto_429782 ) ) ( not ( = ?auto_429776 ?auto_429783 ) ) ( not ( = ?auto_429777 ?auto_429778 ) ) ( not ( = ?auto_429777 ?auto_429779 ) ) ( not ( = ?auto_429777 ?auto_429780 ) ) ( not ( = ?auto_429777 ?auto_429781 ) ) ( not ( = ?auto_429777 ?auto_429782 ) ) ( not ( = ?auto_429777 ?auto_429783 ) ) ( not ( = ?auto_429778 ?auto_429779 ) ) ( not ( = ?auto_429778 ?auto_429780 ) ) ( not ( = ?auto_429778 ?auto_429781 ) ) ( not ( = ?auto_429778 ?auto_429782 ) ) ( not ( = ?auto_429778 ?auto_429783 ) ) ( not ( = ?auto_429779 ?auto_429780 ) ) ( not ( = ?auto_429779 ?auto_429781 ) ) ( not ( = ?auto_429779 ?auto_429782 ) ) ( not ( = ?auto_429779 ?auto_429783 ) ) ( not ( = ?auto_429780 ?auto_429781 ) ) ( not ( = ?auto_429780 ?auto_429782 ) ) ( not ( = ?auto_429780 ?auto_429783 ) ) ( not ( = ?auto_429781 ?auto_429782 ) ) ( not ( = ?auto_429781 ?auto_429783 ) ) ( not ( = ?auto_429782 ?auto_429783 ) ) ( ON ?auto_429781 ?auto_429782 ) ( CLEAR ?auto_429779 ) ( ON ?auto_429780 ?auto_429781 ) ( CLEAR ?auto_429780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429773 ?auto_429774 ?auto_429775 ?auto_429776 ?auto_429777 ?auto_429778 ?auto_429779 ?auto_429780 )
      ( MAKE-10PILE ?auto_429773 ?auto_429774 ?auto_429775 ?auto_429776 ?auto_429777 ?auto_429778 ?auto_429779 ?auto_429780 ?auto_429781 ?auto_429782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429794 - BLOCK
      ?auto_429795 - BLOCK
      ?auto_429796 - BLOCK
      ?auto_429797 - BLOCK
      ?auto_429798 - BLOCK
      ?auto_429799 - BLOCK
      ?auto_429800 - BLOCK
      ?auto_429801 - BLOCK
      ?auto_429802 - BLOCK
      ?auto_429803 - BLOCK
    )
    :vars
    (
      ?auto_429804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429803 ?auto_429804 ) ( ON-TABLE ?auto_429794 ) ( ON ?auto_429795 ?auto_429794 ) ( ON ?auto_429796 ?auto_429795 ) ( ON ?auto_429797 ?auto_429796 ) ( ON ?auto_429798 ?auto_429797 ) ( ON ?auto_429799 ?auto_429798 ) ( not ( = ?auto_429794 ?auto_429795 ) ) ( not ( = ?auto_429794 ?auto_429796 ) ) ( not ( = ?auto_429794 ?auto_429797 ) ) ( not ( = ?auto_429794 ?auto_429798 ) ) ( not ( = ?auto_429794 ?auto_429799 ) ) ( not ( = ?auto_429794 ?auto_429800 ) ) ( not ( = ?auto_429794 ?auto_429801 ) ) ( not ( = ?auto_429794 ?auto_429802 ) ) ( not ( = ?auto_429794 ?auto_429803 ) ) ( not ( = ?auto_429794 ?auto_429804 ) ) ( not ( = ?auto_429795 ?auto_429796 ) ) ( not ( = ?auto_429795 ?auto_429797 ) ) ( not ( = ?auto_429795 ?auto_429798 ) ) ( not ( = ?auto_429795 ?auto_429799 ) ) ( not ( = ?auto_429795 ?auto_429800 ) ) ( not ( = ?auto_429795 ?auto_429801 ) ) ( not ( = ?auto_429795 ?auto_429802 ) ) ( not ( = ?auto_429795 ?auto_429803 ) ) ( not ( = ?auto_429795 ?auto_429804 ) ) ( not ( = ?auto_429796 ?auto_429797 ) ) ( not ( = ?auto_429796 ?auto_429798 ) ) ( not ( = ?auto_429796 ?auto_429799 ) ) ( not ( = ?auto_429796 ?auto_429800 ) ) ( not ( = ?auto_429796 ?auto_429801 ) ) ( not ( = ?auto_429796 ?auto_429802 ) ) ( not ( = ?auto_429796 ?auto_429803 ) ) ( not ( = ?auto_429796 ?auto_429804 ) ) ( not ( = ?auto_429797 ?auto_429798 ) ) ( not ( = ?auto_429797 ?auto_429799 ) ) ( not ( = ?auto_429797 ?auto_429800 ) ) ( not ( = ?auto_429797 ?auto_429801 ) ) ( not ( = ?auto_429797 ?auto_429802 ) ) ( not ( = ?auto_429797 ?auto_429803 ) ) ( not ( = ?auto_429797 ?auto_429804 ) ) ( not ( = ?auto_429798 ?auto_429799 ) ) ( not ( = ?auto_429798 ?auto_429800 ) ) ( not ( = ?auto_429798 ?auto_429801 ) ) ( not ( = ?auto_429798 ?auto_429802 ) ) ( not ( = ?auto_429798 ?auto_429803 ) ) ( not ( = ?auto_429798 ?auto_429804 ) ) ( not ( = ?auto_429799 ?auto_429800 ) ) ( not ( = ?auto_429799 ?auto_429801 ) ) ( not ( = ?auto_429799 ?auto_429802 ) ) ( not ( = ?auto_429799 ?auto_429803 ) ) ( not ( = ?auto_429799 ?auto_429804 ) ) ( not ( = ?auto_429800 ?auto_429801 ) ) ( not ( = ?auto_429800 ?auto_429802 ) ) ( not ( = ?auto_429800 ?auto_429803 ) ) ( not ( = ?auto_429800 ?auto_429804 ) ) ( not ( = ?auto_429801 ?auto_429802 ) ) ( not ( = ?auto_429801 ?auto_429803 ) ) ( not ( = ?auto_429801 ?auto_429804 ) ) ( not ( = ?auto_429802 ?auto_429803 ) ) ( not ( = ?auto_429802 ?auto_429804 ) ) ( not ( = ?auto_429803 ?auto_429804 ) ) ( ON ?auto_429802 ?auto_429803 ) ( ON ?auto_429801 ?auto_429802 ) ( CLEAR ?auto_429799 ) ( ON ?auto_429800 ?auto_429801 ) ( CLEAR ?auto_429800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429794 ?auto_429795 ?auto_429796 ?auto_429797 ?auto_429798 ?auto_429799 ?auto_429800 )
      ( MAKE-10PILE ?auto_429794 ?auto_429795 ?auto_429796 ?auto_429797 ?auto_429798 ?auto_429799 ?auto_429800 ?auto_429801 ?auto_429802 ?auto_429803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429815 - BLOCK
      ?auto_429816 - BLOCK
      ?auto_429817 - BLOCK
      ?auto_429818 - BLOCK
      ?auto_429819 - BLOCK
      ?auto_429820 - BLOCK
      ?auto_429821 - BLOCK
      ?auto_429822 - BLOCK
      ?auto_429823 - BLOCK
      ?auto_429824 - BLOCK
    )
    :vars
    (
      ?auto_429825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429824 ?auto_429825 ) ( ON-TABLE ?auto_429815 ) ( ON ?auto_429816 ?auto_429815 ) ( ON ?auto_429817 ?auto_429816 ) ( ON ?auto_429818 ?auto_429817 ) ( ON ?auto_429819 ?auto_429818 ) ( ON ?auto_429820 ?auto_429819 ) ( not ( = ?auto_429815 ?auto_429816 ) ) ( not ( = ?auto_429815 ?auto_429817 ) ) ( not ( = ?auto_429815 ?auto_429818 ) ) ( not ( = ?auto_429815 ?auto_429819 ) ) ( not ( = ?auto_429815 ?auto_429820 ) ) ( not ( = ?auto_429815 ?auto_429821 ) ) ( not ( = ?auto_429815 ?auto_429822 ) ) ( not ( = ?auto_429815 ?auto_429823 ) ) ( not ( = ?auto_429815 ?auto_429824 ) ) ( not ( = ?auto_429815 ?auto_429825 ) ) ( not ( = ?auto_429816 ?auto_429817 ) ) ( not ( = ?auto_429816 ?auto_429818 ) ) ( not ( = ?auto_429816 ?auto_429819 ) ) ( not ( = ?auto_429816 ?auto_429820 ) ) ( not ( = ?auto_429816 ?auto_429821 ) ) ( not ( = ?auto_429816 ?auto_429822 ) ) ( not ( = ?auto_429816 ?auto_429823 ) ) ( not ( = ?auto_429816 ?auto_429824 ) ) ( not ( = ?auto_429816 ?auto_429825 ) ) ( not ( = ?auto_429817 ?auto_429818 ) ) ( not ( = ?auto_429817 ?auto_429819 ) ) ( not ( = ?auto_429817 ?auto_429820 ) ) ( not ( = ?auto_429817 ?auto_429821 ) ) ( not ( = ?auto_429817 ?auto_429822 ) ) ( not ( = ?auto_429817 ?auto_429823 ) ) ( not ( = ?auto_429817 ?auto_429824 ) ) ( not ( = ?auto_429817 ?auto_429825 ) ) ( not ( = ?auto_429818 ?auto_429819 ) ) ( not ( = ?auto_429818 ?auto_429820 ) ) ( not ( = ?auto_429818 ?auto_429821 ) ) ( not ( = ?auto_429818 ?auto_429822 ) ) ( not ( = ?auto_429818 ?auto_429823 ) ) ( not ( = ?auto_429818 ?auto_429824 ) ) ( not ( = ?auto_429818 ?auto_429825 ) ) ( not ( = ?auto_429819 ?auto_429820 ) ) ( not ( = ?auto_429819 ?auto_429821 ) ) ( not ( = ?auto_429819 ?auto_429822 ) ) ( not ( = ?auto_429819 ?auto_429823 ) ) ( not ( = ?auto_429819 ?auto_429824 ) ) ( not ( = ?auto_429819 ?auto_429825 ) ) ( not ( = ?auto_429820 ?auto_429821 ) ) ( not ( = ?auto_429820 ?auto_429822 ) ) ( not ( = ?auto_429820 ?auto_429823 ) ) ( not ( = ?auto_429820 ?auto_429824 ) ) ( not ( = ?auto_429820 ?auto_429825 ) ) ( not ( = ?auto_429821 ?auto_429822 ) ) ( not ( = ?auto_429821 ?auto_429823 ) ) ( not ( = ?auto_429821 ?auto_429824 ) ) ( not ( = ?auto_429821 ?auto_429825 ) ) ( not ( = ?auto_429822 ?auto_429823 ) ) ( not ( = ?auto_429822 ?auto_429824 ) ) ( not ( = ?auto_429822 ?auto_429825 ) ) ( not ( = ?auto_429823 ?auto_429824 ) ) ( not ( = ?auto_429823 ?auto_429825 ) ) ( not ( = ?auto_429824 ?auto_429825 ) ) ( ON ?auto_429823 ?auto_429824 ) ( ON ?auto_429822 ?auto_429823 ) ( CLEAR ?auto_429820 ) ( ON ?auto_429821 ?auto_429822 ) ( CLEAR ?auto_429821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429815 ?auto_429816 ?auto_429817 ?auto_429818 ?auto_429819 ?auto_429820 ?auto_429821 )
      ( MAKE-10PILE ?auto_429815 ?auto_429816 ?auto_429817 ?auto_429818 ?auto_429819 ?auto_429820 ?auto_429821 ?auto_429822 ?auto_429823 ?auto_429824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429836 - BLOCK
      ?auto_429837 - BLOCK
      ?auto_429838 - BLOCK
      ?auto_429839 - BLOCK
      ?auto_429840 - BLOCK
      ?auto_429841 - BLOCK
      ?auto_429842 - BLOCK
      ?auto_429843 - BLOCK
      ?auto_429844 - BLOCK
      ?auto_429845 - BLOCK
    )
    :vars
    (
      ?auto_429846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429845 ?auto_429846 ) ( ON-TABLE ?auto_429836 ) ( ON ?auto_429837 ?auto_429836 ) ( ON ?auto_429838 ?auto_429837 ) ( ON ?auto_429839 ?auto_429838 ) ( ON ?auto_429840 ?auto_429839 ) ( not ( = ?auto_429836 ?auto_429837 ) ) ( not ( = ?auto_429836 ?auto_429838 ) ) ( not ( = ?auto_429836 ?auto_429839 ) ) ( not ( = ?auto_429836 ?auto_429840 ) ) ( not ( = ?auto_429836 ?auto_429841 ) ) ( not ( = ?auto_429836 ?auto_429842 ) ) ( not ( = ?auto_429836 ?auto_429843 ) ) ( not ( = ?auto_429836 ?auto_429844 ) ) ( not ( = ?auto_429836 ?auto_429845 ) ) ( not ( = ?auto_429836 ?auto_429846 ) ) ( not ( = ?auto_429837 ?auto_429838 ) ) ( not ( = ?auto_429837 ?auto_429839 ) ) ( not ( = ?auto_429837 ?auto_429840 ) ) ( not ( = ?auto_429837 ?auto_429841 ) ) ( not ( = ?auto_429837 ?auto_429842 ) ) ( not ( = ?auto_429837 ?auto_429843 ) ) ( not ( = ?auto_429837 ?auto_429844 ) ) ( not ( = ?auto_429837 ?auto_429845 ) ) ( not ( = ?auto_429837 ?auto_429846 ) ) ( not ( = ?auto_429838 ?auto_429839 ) ) ( not ( = ?auto_429838 ?auto_429840 ) ) ( not ( = ?auto_429838 ?auto_429841 ) ) ( not ( = ?auto_429838 ?auto_429842 ) ) ( not ( = ?auto_429838 ?auto_429843 ) ) ( not ( = ?auto_429838 ?auto_429844 ) ) ( not ( = ?auto_429838 ?auto_429845 ) ) ( not ( = ?auto_429838 ?auto_429846 ) ) ( not ( = ?auto_429839 ?auto_429840 ) ) ( not ( = ?auto_429839 ?auto_429841 ) ) ( not ( = ?auto_429839 ?auto_429842 ) ) ( not ( = ?auto_429839 ?auto_429843 ) ) ( not ( = ?auto_429839 ?auto_429844 ) ) ( not ( = ?auto_429839 ?auto_429845 ) ) ( not ( = ?auto_429839 ?auto_429846 ) ) ( not ( = ?auto_429840 ?auto_429841 ) ) ( not ( = ?auto_429840 ?auto_429842 ) ) ( not ( = ?auto_429840 ?auto_429843 ) ) ( not ( = ?auto_429840 ?auto_429844 ) ) ( not ( = ?auto_429840 ?auto_429845 ) ) ( not ( = ?auto_429840 ?auto_429846 ) ) ( not ( = ?auto_429841 ?auto_429842 ) ) ( not ( = ?auto_429841 ?auto_429843 ) ) ( not ( = ?auto_429841 ?auto_429844 ) ) ( not ( = ?auto_429841 ?auto_429845 ) ) ( not ( = ?auto_429841 ?auto_429846 ) ) ( not ( = ?auto_429842 ?auto_429843 ) ) ( not ( = ?auto_429842 ?auto_429844 ) ) ( not ( = ?auto_429842 ?auto_429845 ) ) ( not ( = ?auto_429842 ?auto_429846 ) ) ( not ( = ?auto_429843 ?auto_429844 ) ) ( not ( = ?auto_429843 ?auto_429845 ) ) ( not ( = ?auto_429843 ?auto_429846 ) ) ( not ( = ?auto_429844 ?auto_429845 ) ) ( not ( = ?auto_429844 ?auto_429846 ) ) ( not ( = ?auto_429845 ?auto_429846 ) ) ( ON ?auto_429844 ?auto_429845 ) ( ON ?auto_429843 ?auto_429844 ) ( ON ?auto_429842 ?auto_429843 ) ( CLEAR ?auto_429840 ) ( ON ?auto_429841 ?auto_429842 ) ( CLEAR ?auto_429841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429836 ?auto_429837 ?auto_429838 ?auto_429839 ?auto_429840 ?auto_429841 )
      ( MAKE-10PILE ?auto_429836 ?auto_429837 ?auto_429838 ?auto_429839 ?auto_429840 ?auto_429841 ?auto_429842 ?auto_429843 ?auto_429844 ?auto_429845 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429857 - BLOCK
      ?auto_429858 - BLOCK
      ?auto_429859 - BLOCK
      ?auto_429860 - BLOCK
      ?auto_429861 - BLOCK
      ?auto_429862 - BLOCK
      ?auto_429863 - BLOCK
      ?auto_429864 - BLOCK
      ?auto_429865 - BLOCK
      ?auto_429866 - BLOCK
    )
    :vars
    (
      ?auto_429867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429866 ?auto_429867 ) ( ON-TABLE ?auto_429857 ) ( ON ?auto_429858 ?auto_429857 ) ( ON ?auto_429859 ?auto_429858 ) ( ON ?auto_429860 ?auto_429859 ) ( ON ?auto_429861 ?auto_429860 ) ( not ( = ?auto_429857 ?auto_429858 ) ) ( not ( = ?auto_429857 ?auto_429859 ) ) ( not ( = ?auto_429857 ?auto_429860 ) ) ( not ( = ?auto_429857 ?auto_429861 ) ) ( not ( = ?auto_429857 ?auto_429862 ) ) ( not ( = ?auto_429857 ?auto_429863 ) ) ( not ( = ?auto_429857 ?auto_429864 ) ) ( not ( = ?auto_429857 ?auto_429865 ) ) ( not ( = ?auto_429857 ?auto_429866 ) ) ( not ( = ?auto_429857 ?auto_429867 ) ) ( not ( = ?auto_429858 ?auto_429859 ) ) ( not ( = ?auto_429858 ?auto_429860 ) ) ( not ( = ?auto_429858 ?auto_429861 ) ) ( not ( = ?auto_429858 ?auto_429862 ) ) ( not ( = ?auto_429858 ?auto_429863 ) ) ( not ( = ?auto_429858 ?auto_429864 ) ) ( not ( = ?auto_429858 ?auto_429865 ) ) ( not ( = ?auto_429858 ?auto_429866 ) ) ( not ( = ?auto_429858 ?auto_429867 ) ) ( not ( = ?auto_429859 ?auto_429860 ) ) ( not ( = ?auto_429859 ?auto_429861 ) ) ( not ( = ?auto_429859 ?auto_429862 ) ) ( not ( = ?auto_429859 ?auto_429863 ) ) ( not ( = ?auto_429859 ?auto_429864 ) ) ( not ( = ?auto_429859 ?auto_429865 ) ) ( not ( = ?auto_429859 ?auto_429866 ) ) ( not ( = ?auto_429859 ?auto_429867 ) ) ( not ( = ?auto_429860 ?auto_429861 ) ) ( not ( = ?auto_429860 ?auto_429862 ) ) ( not ( = ?auto_429860 ?auto_429863 ) ) ( not ( = ?auto_429860 ?auto_429864 ) ) ( not ( = ?auto_429860 ?auto_429865 ) ) ( not ( = ?auto_429860 ?auto_429866 ) ) ( not ( = ?auto_429860 ?auto_429867 ) ) ( not ( = ?auto_429861 ?auto_429862 ) ) ( not ( = ?auto_429861 ?auto_429863 ) ) ( not ( = ?auto_429861 ?auto_429864 ) ) ( not ( = ?auto_429861 ?auto_429865 ) ) ( not ( = ?auto_429861 ?auto_429866 ) ) ( not ( = ?auto_429861 ?auto_429867 ) ) ( not ( = ?auto_429862 ?auto_429863 ) ) ( not ( = ?auto_429862 ?auto_429864 ) ) ( not ( = ?auto_429862 ?auto_429865 ) ) ( not ( = ?auto_429862 ?auto_429866 ) ) ( not ( = ?auto_429862 ?auto_429867 ) ) ( not ( = ?auto_429863 ?auto_429864 ) ) ( not ( = ?auto_429863 ?auto_429865 ) ) ( not ( = ?auto_429863 ?auto_429866 ) ) ( not ( = ?auto_429863 ?auto_429867 ) ) ( not ( = ?auto_429864 ?auto_429865 ) ) ( not ( = ?auto_429864 ?auto_429866 ) ) ( not ( = ?auto_429864 ?auto_429867 ) ) ( not ( = ?auto_429865 ?auto_429866 ) ) ( not ( = ?auto_429865 ?auto_429867 ) ) ( not ( = ?auto_429866 ?auto_429867 ) ) ( ON ?auto_429865 ?auto_429866 ) ( ON ?auto_429864 ?auto_429865 ) ( ON ?auto_429863 ?auto_429864 ) ( CLEAR ?auto_429861 ) ( ON ?auto_429862 ?auto_429863 ) ( CLEAR ?auto_429862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429857 ?auto_429858 ?auto_429859 ?auto_429860 ?auto_429861 ?auto_429862 )
      ( MAKE-10PILE ?auto_429857 ?auto_429858 ?auto_429859 ?auto_429860 ?auto_429861 ?auto_429862 ?auto_429863 ?auto_429864 ?auto_429865 ?auto_429866 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429878 - BLOCK
      ?auto_429879 - BLOCK
      ?auto_429880 - BLOCK
      ?auto_429881 - BLOCK
      ?auto_429882 - BLOCK
      ?auto_429883 - BLOCK
      ?auto_429884 - BLOCK
      ?auto_429885 - BLOCK
      ?auto_429886 - BLOCK
      ?auto_429887 - BLOCK
    )
    :vars
    (
      ?auto_429888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429887 ?auto_429888 ) ( ON-TABLE ?auto_429878 ) ( ON ?auto_429879 ?auto_429878 ) ( ON ?auto_429880 ?auto_429879 ) ( ON ?auto_429881 ?auto_429880 ) ( not ( = ?auto_429878 ?auto_429879 ) ) ( not ( = ?auto_429878 ?auto_429880 ) ) ( not ( = ?auto_429878 ?auto_429881 ) ) ( not ( = ?auto_429878 ?auto_429882 ) ) ( not ( = ?auto_429878 ?auto_429883 ) ) ( not ( = ?auto_429878 ?auto_429884 ) ) ( not ( = ?auto_429878 ?auto_429885 ) ) ( not ( = ?auto_429878 ?auto_429886 ) ) ( not ( = ?auto_429878 ?auto_429887 ) ) ( not ( = ?auto_429878 ?auto_429888 ) ) ( not ( = ?auto_429879 ?auto_429880 ) ) ( not ( = ?auto_429879 ?auto_429881 ) ) ( not ( = ?auto_429879 ?auto_429882 ) ) ( not ( = ?auto_429879 ?auto_429883 ) ) ( not ( = ?auto_429879 ?auto_429884 ) ) ( not ( = ?auto_429879 ?auto_429885 ) ) ( not ( = ?auto_429879 ?auto_429886 ) ) ( not ( = ?auto_429879 ?auto_429887 ) ) ( not ( = ?auto_429879 ?auto_429888 ) ) ( not ( = ?auto_429880 ?auto_429881 ) ) ( not ( = ?auto_429880 ?auto_429882 ) ) ( not ( = ?auto_429880 ?auto_429883 ) ) ( not ( = ?auto_429880 ?auto_429884 ) ) ( not ( = ?auto_429880 ?auto_429885 ) ) ( not ( = ?auto_429880 ?auto_429886 ) ) ( not ( = ?auto_429880 ?auto_429887 ) ) ( not ( = ?auto_429880 ?auto_429888 ) ) ( not ( = ?auto_429881 ?auto_429882 ) ) ( not ( = ?auto_429881 ?auto_429883 ) ) ( not ( = ?auto_429881 ?auto_429884 ) ) ( not ( = ?auto_429881 ?auto_429885 ) ) ( not ( = ?auto_429881 ?auto_429886 ) ) ( not ( = ?auto_429881 ?auto_429887 ) ) ( not ( = ?auto_429881 ?auto_429888 ) ) ( not ( = ?auto_429882 ?auto_429883 ) ) ( not ( = ?auto_429882 ?auto_429884 ) ) ( not ( = ?auto_429882 ?auto_429885 ) ) ( not ( = ?auto_429882 ?auto_429886 ) ) ( not ( = ?auto_429882 ?auto_429887 ) ) ( not ( = ?auto_429882 ?auto_429888 ) ) ( not ( = ?auto_429883 ?auto_429884 ) ) ( not ( = ?auto_429883 ?auto_429885 ) ) ( not ( = ?auto_429883 ?auto_429886 ) ) ( not ( = ?auto_429883 ?auto_429887 ) ) ( not ( = ?auto_429883 ?auto_429888 ) ) ( not ( = ?auto_429884 ?auto_429885 ) ) ( not ( = ?auto_429884 ?auto_429886 ) ) ( not ( = ?auto_429884 ?auto_429887 ) ) ( not ( = ?auto_429884 ?auto_429888 ) ) ( not ( = ?auto_429885 ?auto_429886 ) ) ( not ( = ?auto_429885 ?auto_429887 ) ) ( not ( = ?auto_429885 ?auto_429888 ) ) ( not ( = ?auto_429886 ?auto_429887 ) ) ( not ( = ?auto_429886 ?auto_429888 ) ) ( not ( = ?auto_429887 ?auto_429888 ) ) ( ON ?auto_429886 ?auto_429887 ) ( ON ?auto_429885 ?auto_429886 ) ( ON ?auto_429884 ?auto_429885 ) ( ON ?auto_429883 ?auto_429884 ) ( CLEAR ?auto_429881 ) ( ON ?auto_429882 ?auto_429883 ) ( CLEAR ?auto_429882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429878 ?auto_429879 ?auto_429880 ?auto_429881 ?auto_429882 )
      ( MAKE-10PILE ?auto_429878 ?auto_429879 ?auto_429880 ?auto_429881 ?auto_429882 ?auto_429883 ?auto_429884 ?auto_429885 ?auto_429886 ?auto_429887 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429899 - BLOCK
      ?auto_429900 - BLOCK
      ?auto_429901 - BLOCK
      ?auto_429902 - BLOCK
      ?auto_429903 - BLOCK
      ?auto_429904 - BLOCK
      ?auto_429905 - BLOCK
      ?auto_429906 - BLOCK
      ?auto_429907 - BLOCK
      ?auto_429908 - BLOCK
    )
    :vars
    (
      ?auto_429909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429908 ?auto_429909 ) ( ON-TABLE ?auto_429899 ) ( ON ?auto_429900 ?auto_429899 ) ( ON ?auto_429901 ?auto_429900 ) ( ON ?auto_429902 ?auto_429901 ) ( not ( = ?auto_429899 ?auto_429900 ) ) ( not ( = ?auto_429899 ?auto_429901 ) ) ( not ( = ?auto_429899 ?auto_429902 ) ) ( not ( = ?auto_429899 ?auto_429903 ) ) ( not ( = ?auto_429899 ?auto_429904 ) ) ( not ( = ?auto_429899 ?auto_429905 ) ) ( not ( = ?auto_429899 ?auto_429906 ) ) ( not ( = ?auto_429899 ?auto_429907 ) ) ( not ( = ?auto_429899 ?auto_429908 ) ) ( not ( = ?auto_429899 ?auto_429909 ) ) ( not ( = ?auto_429900 ?auto_429901 ) ) ( not ( = ?auto_429900 ?auto_429902 ) ) ( not ( = ?auto_429900 ?auto_429903 ) ) ( not ( = ?auto_429900 ?auto_429904 ) ) ( not ( = ?auto_429900 ?auto_429905 ) ) ( not ( = ?auto_429900 ?auto_429906 ) ) ( not ( = ?auto_429900 ?auto_429907 ) ) ( not ( = ?auto_429900 ?auto_429908 ) ) ( not ( = ?auto_429900 ?auto_429909 ) ) ( not ( = ?auto_429901 ?auto_429902 ) ) ( not ( = ?auto_429901 ?auto_429903 ) ) ( not ( = ?auto_429901 ?auto_429904 ) ) ( not ( = ?auto_429901 ?auto_429905 ) ) ( not ( = ?auto_429901 ?auto_429906 ) ) ( not ( = ?auto_429901 ?auto_429907 ) ) ( not ( = ?auto_429901 ?auto_429908 ) ) ( not ( = ?auto_429901 ?auto_429909 ) ) ( not ( = ?auto_429902 ?auto_429903 ) ) ( not ( = ?auto_429902 ?auto_429904 ) ) ( not ( = ?auto_429902 ?auto_429905 ) ) ( not ( = ?auto_429902 ?auto_429906 ) ) ( not ( = ?auto_429902 ?auto_429907 ) ) ( not ( = ?auto_429902 ?auto_429908 ) ) ( not ( = ?auto_429902 ?auto_429909 ) ) ( not ( = ?auto_429903 ?auto_429904 ) ) ( not ( = ?auto_429903 ?auto_429905 ) ) ( not ( = ?auto_429903 ?auto_429906 ) ) ( not ( = ?auto_429903 ?auto_429907 ) ) ( not ( = ?auto_429903 ?auto_429908 ) ) ( not ( = ?auto_429903 ?auto_429909 ) ) ( not ( = ?auto_429904 ?auto_429905 ) ) ( not ( = ?auto_429904 ?auto_429906 ) ) ( not ( = ?auto_429904 ?auto_429907 ) ) ( not ( = ?auto_429904 ?auto_429908 ) ) ( not ( = ?auto_429904 ?auto_429909 ) ) ( not ( = ?auto_429905 ?auto_429906 ) ) ( not ( = ?auto_429905 ?auto_429907 ) ) ( not ( = ?auto_429905 ?auto_429908 ) ) ( not ( = ?auto_429905 ?auto_429909 ) ) ( not ( = ?auto_429906 ?auto_429907 ) ) ( not ( = ?auto_429906 ?auto_429908 ) ) ( not ( = ?auto_429906 ?auto_429909 ) ) ( not ( = ?auto_429907 ?auto_429908 ) ) ( not ( = ?auto_429907 ?auto_429909 ) ) ( not ( = ?auto_429908 ?auto_429909 ) ) ( ON ?auto_429907 ?auto_429908 ) ( ON ?auto_429906 ?auto_429907 ) ( ON ?auto_429905 ?auto_429906 ) ( ON ?auto_429904 ?auto_429905 ) ( CLEAR ?auto_429902 ) ( ON ?auto_429903 ?auto_429904 ) ( CLEAR ?auto_429903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429899 ?auto_429900 ?auto_429901 ?auto_429902 ?auto_429903 )
      ( MAKE-10PILE ?auto_429899 ?auto_429900 ?auto_429901 ?auto_429902 ?auto_429903 ?auto_429904 ?auto_429905 ?auto_429906 ?auto_429907 ?auto_429908 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429920 - BLOCK
      ?auto_429921 - BLOCK
      ?auto_429922 - BLOCK
      ?auto_429923 - BLOCK
      ?auto_429924 - BLOCK
      ?auto_429925 - BLOCK
      ?auto_429926 - BLOCK
      ?auto_429927 - BLOCK
      ?auto_429928 - BLOCK
      ?auto_429929 - BLOCK
    )
    :vars
    (
      ?auto_429930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429929 ?auto_429930 ) ( ON-TABLE ?auto_429920 ) ( ON ?auto_429921 ?auto_429920 ) ( ON ?auto_429922 ?auto_429921 ) ( not ( = ?auto_429920 ?auto_429921 ) ) ( not ( = ?auto_429920 ?auto_429922 ) ) ( not ( = ?auto_429920 ?auto_429923 ) ) ( not ( = ?auto_429920 ?auto_429924 ) ) ( not ( = ?auto_429920 ?auto_429925 ) ) ( not ( = ?auto_429920 ?auto_429926 ) ) ( not ( = ?auto_429920 ?auto_429927 ) ) ( not ( = ?auto_429920 ?auto_429928 ) ) ( not ( = ?auto_429920 ?auto_429929 ) ) ( not ( = ?auto_429920 ?auto_429930 ) ) ( not ( = ?auto_429921 ?auto_429922 ) ) ( not ( = ?auto_429921 ?auto_429923 ) ) ( not ( = ?auto_429921 ?auto_429924 ) ) ( not ( = ?auto_429921 ?auto_429925 ) ) ( not ( = ?auto_429921 ?auto_429926 ) ) ( not ( = ?auto_429921 ?auto_429927 ) ) ( not ( = ?auto_429921 ?auto_429928 ) ) ( not ( = ?auto_429921 ?auto_429929 ) ) ( not ( = ?auto_429921 ?auto_429930 ) ) ( not ( = ?auto_429922 ?auto_429923 ) ) ( not ( = ?auto_429922 ?auto_429924 ) ) ( not ( = ?auto_429922 ?auto_429925 ) ) ( not ( = ?auto_429922 ?auto_429926 ) ) ( not ( = ?auto_429922 ?auto_429927 ) ) ( not ( = ?auto_429922 ?auto_429928 ) ) ( not ( = ?auto_429922 ?auto_429929 ) ) ( not ( = ?auto_429922 ?auto_429930 ) ) ( not ( = ?auto_429923 ?auto_429924 ) ) ( not ( = ?auto_429923 ?auto_429925 ) ) ( not ( = ?auto_429923 ?auto_429926 ) ) ( not ( = ?auto_429923 ?auto_429927 ) ) ( not ( = ?auto_429923 ?auto_429928 ) ) ( not ( = ?auto_429923 ?auto_429929 ) ) ( not ( = ?auto_429923 ?auto_429930 ) ) ( not ( = ?auto_429924 ?auto_429925 ) ) ( not ( = ?auto_429924 ?auto_429926 ) ) ( not ( = ?auto_429924 ?auto_429927 ) ) ( not ( = ?auto_429924 ?auto_429928 ) ) ( not ( = ?auto_429924 ?auto_429929 ) ) ( not ( = ?auto_429924 ?auto_429930 ) ) ( not ( = ?auto_429925 ?auto_429926 ) ) ( not ( = ?auto_429925 ?auto_429927 ) ) ( not ( = ?auto_429925 ?auto_429928 ) ) ( not ( = ?auto_429925 ?auto_429929 ) ) ( not ( = ?auto_429925 ?auto_429930 ) ) ( not ( = ?auto_429926 ?auto_429927 ) ) ( not ( = ?auto_429926 ?auto_429928 ) ) ( not ( = ?auto_429926 ?auto_429929 ) ) ( not ( = ?auto_429926 ?auto_429930 ) ) ( not ( = ?auto_429927 ?auto_429928 ) ) ( not ( = ?auto_429927 ?auto_429929 ) ) ( not ( = ?auto_429927 ?auto_429930 ) ) ( not ( = ?auto_429928 ?auto_429929 ) ) ( not ( = ?auto_429928 ?auto_429930 ) ) ( not ( = ?auto_429929 ?auto_429930 ) ) ( ON ?auto_429928 ?auto_429929 ) ( ON ?auto_429927 ?auto_429928 ) ( ON ?auto_429926 ?auto_429927 ) ( ON ?auto_429925 ?auto_429926 ) ( ON ?auto_429924 ?auto_429925 ) ( CLEAR ?auto_429922 ) ( ON ?auto_429923 ?auto_429924 ) ( CLEAR ?auto_429923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429920 ?auto_429921 ?auto_429922 ?auto_429923 )
      ( MAKE-10PILE ?auto_429920 ?auto_429921 ?auto_429922 ?auto_429923 ?auto_429924 ?auto_429925 ?auto_429926 ?auto_429927 ?auto_429928 ?auto_429929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429941 - BLOCK
      ?auto_429942 - BLOCK
      ?auto_429943 - BLOCK
      ?auto_429944 - BLOCK
      ?auto_429945 - BLOCK
      ?auto_429946 - BLOCK
      ?auto_429947 - BLOCK
      ?auto_429948 - BLOCK
      ?auto_429949 - BLOCK
      ?auto_429950 - BLOCK
    )
    :vars
    (
      ?auto_429951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429950 ?auto_429951 ) ( ON-TABLE ?auto_429941 ) ( ON ?auto_429942 ?auto_429941 ) ( ON ?auto_429943 ?auto_429942 ) ( not ( = ?auto_429941 ?auto_429942 ) ) ( not ( = ?auto_429941 ?auto_429943 ) ) ( not ( = ?auto_429941 ?auto_429944 ) ) ( not ( = ?auto_429941 ?auto_429945 ) ) ( not ( = ?auto_429941 ?auto_429946 ) ) ( not ( = ?auto_429941 ?auto_429947 ) ) ( not ( = ?auto_429941 ?auto_429948 ) ) ( not ( = ?auto_429941 ?auto_429949 ) ) ( not ( = ?auto_429941 ?auto_429950 ) ) ( not ( = ?auto_429941 ?auto_429951 ) ) ( not ( = ?auto_429942 ?auto_429943 ) ) ( not ( = ?auto_429942 ?auto_429944 ) ) ( not ( = ?auto_429942 ?auto_429945 ) ) ( not ( = ?auto_429942 ?auto_429946 ) ) ( not ( = ?auto_429942 ?auto_429947 ) ) ( not ( = ?auto_429942 ?auto_429948 ) ) ( not ( = ?auto_429942 ?auto_429949 ) ) ( not ( = ?auto_429942 ?auto_429950 ) ) ( not ( = ?auto_429942 ?auto_429951 ) ) ( not ( = ?auto_429943 ?auto_429944 ) ) ( not ( = ?auto_429943 ?auto_429945 ) ) ( not ( = ?auto_429943 ?auto_429946 ) ) ( not ( = ?auto_429943 ?auto_429947 ) ) ( not ( = ?auto_429943 ?auto_429948 ) ) ( not ( = ?auto_429943 ?auto_429949 ) ) ( not ( = ?auto_429943 ?auto_429950 ) ) ( not ( = ?auto_429943 ?auto_429951 ) ) ( not ( = ?auto_429944 ?auto_429945 ) ) ( not ( = ?auto_429944 ?auto_429946 ) ) ( not ( = ?auto_429944 ?auto_429947 ) ) ( not ( = ?auto_429944 ?auto_429948 ) ) ( not ( = ?auto_429944 ?auto_429949 ) ) ( not ( = ?auto_429944 ?auto_429950 ) ) ( not ( = ?auto_429944 ?auto_429951 ) ) ( not ( = ?auto_429945 ?auto_429946 ) ) ( not ( = ?auto_429945 ?auto_429947 ) ) ( not ( = ?auto_429945 ?auto_429948 ) ) ( not ( = ?auto_429945 ?auto_429949 ) ) ( not ( = ?auto_429945 ?auto_429950 ) ) ( not ( = ?auto_429945 ?auto_429951 ) ) ( not ( = ?auto_429946 ?auto_429947 ) ) ( not ( = ?auto_429946 ?auto_429948 ) ) ( not ( = ?auto_429946 ?auto_429949 ) ) ( not ( = ?auto_429946 ?auto_429950 ) ) ( not ( = ?auto_429946 ?auto_429951 ) ) ( not ( = ?auto_429947 ?auto_429948 ) ) ( not ( = ?auto_429947 ?auto_429949 ) ) ( not ( = ?auto_429947 ?auto_429950 ) ) ( not ( = ?auto_429947 ?auto_429951 ) ) ( not ( = ?auto_429948 ?auto_429949 ) ) ( not ( = ?auto_429948 ?auto_429950 ) ) ( not ( = ?auto_429948 ?auto_429951 ) ) ( not ( = ?auto_429949 ?auto_429950 ) ) ( not ( = ?auto_429949 ?auto_429951 ) ) ( not ( = ?auto_429950 ?auto_429951 ) ) ( ON ?auto_429949 ?auto_429950 ) ( ON ?auto_429948 ?auto_429949 ) ( ON ?auto_429947 ?auto_429948 ) ( ON ?auto_429946 ?auto_429947 ) ( ON ?auto_429945 ?auto_429946 ) ( CLEAR ?auto_429943 ) ( ON ?auto_429944 ?auto_429945 ) ( CLEAR ?auto_429944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429941 ?auto_429942 ?auto_429943 ?auto_429944 )
      ( MAKE-10PILE ?auto_429941 ?auto_429942 ?auto_429943 ?auto_429944 ?auto_429945 ?auto_429946 ?auto_429947 ?auto_429948 ?auto_429949 ?auto_429950 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429962 - BLOCK
      ?auto_429963 - BLOCK
      ?auto_429964 - BLOCK
      ?auto_429965 - BLOCK
      ?auto_429966 - BLOCK
      ?auto_429967 - BLOCK
      ?auto_429968 - BLOCK
      ?auto_429969 - BLOCK
      ?auto_429970 - BLOCK
      ?auto_429971 - BLOCK
    )
    :vars
    (
      ?auto_429972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429971 ?auto_429972 ) ( ON-TABLE ?auto_429962 ) ( ON ?auto_429963 ?auto_429962 ) ( not ( = ?auto_429962 ?auto_429963 ) ) ( not ( = ?auto_429962 ?auto_429964 ) ) ( not ( = ?auto_429962 ?auto_429965 ) ) ( not ( = ?auto_429962 ?auto_429966 ) ) ( not ( = ?auto_429962 ?auto_429967 ) ) ( not ( = ?auto_429962 ?auto_429968 ) ) ( not ( = ?auto_429962 ?auto_429969 ) ) ( not ( = ?auto_429962 ?auto_429970 ) ) ( not ( = ?auto_429962 ?auto_429971 ) ) ( not ( = ?auto_429962 ?auto_429972 ) ) ( not ( = ?auto_429963 ?auto_429964 ) ) ( not ( = ?auto_429963 ?auto_429965 ) ) ( not ( = ?auto_429963 ?auto_429966 ) ) ( not ( = ?auto_429963 ?auto_429967 ) ) ( not ( = ?auto_429963 ?auto_429968 ) ) ( not ( = ?auto_429963 ?auto_429969 ) ) ( not ( = ?auto_429963 ?auto_429970 ) ) ( not ( = ?auto_429963 ?auto_429971 ) ) ( not ( = ?auto_429963 ?auto_429972 ) ) ( not ( = ?auto_429964 ?auto_429965 ) ) ( not ( = ?auto_429964 ?auto_429966 ) ) ( not ( = ?auto_429964 ?auto_429967 ) ) ( not ( = ?auto_429964 ?auto_429968 ) ) ( not ( = ?auto_429964 ?auto_429969 ) ) ( not ( = ?auto_429964 ?auto_429970 ) ) ( not ( = ?auto_429964 ?auto_429971 ) ) ( not ( = ?auto_429964 ?auto_429972 ) ) ( not ( = ?auto_429965 ?auto_429966 ) ) ( not ( = ?auto_429965 ?auto_429967 ) ) ( not ( = ?auto_429965 ?auto_429968 ) ) ( not ( = ?auto_429965 ?auto_429969 ) ) ( not ( = ?auto_429965 ?auto_429970 ) ) ( not ( = ?auto_429965 ?auto_429971 ) ) ( not ( = ?auto_429965 ?auto_429972 ) ) ( not ( = ?auto_429966 ?auto_429967 ) ) ( not ( = ?auto_429966 ?auto_429968 ) ) ( not ( = ?auto_429966 ?auto_429969 ) ) ( not ( = ?auto_429966 ?auto_429970 ) ) ( not ( = ?auto_429966 ?auto_429971 ) ) ( not ( = ?auto_429966 ?auto_429972 ) ) ( not ( = ?auto_429967 ?auto_429968 ) ) ( not ( = ?auto_429967 ?auto_429969 ) ) ( not ( = ?auto_429967 ?auto_429970 ) ) ( not ( = ?auto_429967 ?auto_429971 ) ) ( not ( = ?auto_429967 ?auto_429972 ) ) ( not ( = ?auto_429968 ?auto_429969 ) ) ( not ( = ?auto_429968 ?auto_429970 ) ) ( not ( = ?auto_429968 ?auto_429971 ) ) ( not ( = ?auto_429968 ?auto_429972 ) ) ( not ( = ?auto_429969 ?auto_429970 ) ) ( not ( = ?auto_429969 ?auto_429971 ) ) ( not ( = ?auto_429969 ?auto_429972 ) ) ( not ( = ?auto_429970 ?auto_429971 ) ) ( not ( = ?auto_429970 ?auto_429972 ) ) ( not ( = ?auto_429971 ?auto_429972 ) ) ( ON ?auto_429970 ?auto_429971 ) ( ON ?auto_429969 ?auto_429970 ) ( ON ?auto_429968 ?auto_429969 ) ( ON ?auto_429967 ?auto_429968 ) ( ON ?auto_429966 ?auto_429967 ) ( ON ?auto_429965 ?auto_429966 ) ( CLEAR ?auto_429963 ) ( ON ?auto_429964 ?auto_429965 ) ( CLEAR ?auto_429964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429962 ?auto_429963 ?auto_429964 )
      ( MAKE-10PILE ?auto_429962 ?auto_429963 ?auto_429964 ?auto_429965 ?auto_429966 ?auto_429967 ?auto_429968 ?auto_429969 ?auto_429970 ?auto_429971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429983 - BLOCK
      ?auto_429984 - BLOCK
      ?auto_429985 - BLOCK
      ?auto_429986 - BLOCK
      ?auto_429987 - BLOCK
      ?auto_429988 - BLOCK
      ?auto_429989 - BLOCK
      ?auto_429990 - BLOCK
      ?auto_429991 - BLOCK
      ?auto_429992 - BLOCK
    )
    :vars
    (
      ?auto_429993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429992 ?auto_429993 ) ( ON-TABLE ?auto_429983 ) ( ON ?auto_429984 ?auto_429983 ) ( not ( = ?auto_429983 ?auto_429984 ) ) ( not ( = ?auto_429983 ?auto_429985 ) ) ( not ( = ?auto_429983 ?auto_429986 ) ) ( not ( = ?auto_429983 ?auto_429987 ) ) ( not ( = ?auto_429983 ?auto_429988 ) ) ( not ( = ?auto_429983 ?auto_429989 ) ) ( not ( = ?auto_429983 ?auto_429990 ) ) ( not ( = ?auto_429983 ?auto_429991 ) ) ( not ( = ?auto_429983 ?auto_429992 ) ) ( not ( = ?auto_429983 ?auto_429993 ) ) ( not ( = ?auto_429984 ?auto_429985 ) ) ( not ( = ?auto_429984 ?auto_429986 ) ) ( not ( = ?auto_429984 ?auto_429987 ) ) ( not ( = ?auto_429984 ?auto_429988 ) ) ( not ( = ?auto_429984 ?auto_429989 ) ) ( not ( = ?auto_429984 ?auto_429990 ) ) ( not ( = ?auto_429984 ?auto_429991 ) ) ( not ( = ?auto_429984 ?auto_429992 ) ) ( not ( = ?auto_429984 ?auto_429993 ) ) ( not ( = ?auto_429985 ?auto_429986 ) ) ( not ( = ?auto_429985 ?auto_429987 ) ) ( not ( = ?auto_429985 ?auto_429988 ) ) ( not ( = ?auto_429985 ?auto_429989 ) ) ( not ( = ?auto_429985 ?auto_429990 ) ) ( not ( = ?auto_429985 ?auto_429991 ) ) ( not ( = ?auto_429985 ?auto_429992 ) ) ( not ( = ?auto_429985 ?auto_429993 ) ) ( not ( = ?auto_429986 ?auto_429987 ) ) ( not ( = ?auto_429986 ?auto_429988 ) ) ( not ( = ?auto_429986 ?auto_429989 ) ) ( not ( = ?auto_429986 ?auto_429990 ) ) ( not ( = ?auto_429986 ?auto_429991 ) ) ( not ( = ?auto_429986 ?auto_429992 ) ) ( not ( = ?auto_429986 ?auto_429993 ) ) ( not ( = ?auto_429987 ?auto_429988 ) ) ( not ( = ?auto_429987 ?auto_429989 ) ) ( not ( = ?auto_429987 ?auto_429990 ) ) ( not ( = ?auto_429987 ?auto_429991 ) ) ( not ( = ?auto_429987 ?auto_429992 ) ) ( not ( = ?auto_429987 ?auto_429993 ) ) ( not ( = ?auto_429988 ?auto_429989 ) ) ( not ( = ?auto_429988 ?auto_429990 ) ) ( not ( = ?auto_429988 ?auto_429991 ) ) ( not ( = ?auto_429988 ?auto_429992 ) ) ( not ( = ?auto_429988 ?auto_429993 ) ) ( not ( = ?auto_429989 ?auto_429990 ) ) ( not ( = ?auto_429989 ?auto_429991 ) ) ( not ( = ?auto_429989 ?auto_429992 ) ) ( not ( = ?auto_429989 ?auto_429993 ) ) ( not ( = ?auto_429990 ?auto_429991 ) ) ( not ( = ?auto_429990 ?auto_429992 ) ) ( not ( = ?auto_429990 ?auto_429993 ) ) ( not ( = ?auto_429991 ?auto_429992 ) ) ( not ( = ?auto_429991 ?auto_429993 ) ) ( not ( = ?auto_429992 ?auto_429993 ) ) ( ON ?auto_429991 ?auto_429992 ) ( ON ?auto_429990 ?auto_429991 ) ( ON ?auto_429989 ?auto_429990 ) ( ON ?auto_429988 ?auto_429989 ) ( ON ?auto_429987 ?auto_429988 ) ( ON ?auto_429986 ?auto_429987 ) ( CLEAR ?auto_429984 ) ( ON ?auto_429985 ?auto_429986 ) ( CLEAR ?auto_429985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429983 ?auto_429984 ?auto_429985 )
      ( MAKE-10PILE ?auto_429983 ?auto_429984 ?auto_429985 ?auto_429986 ?auto_429987 ?auto_429988 ?auto_429989 ?auto_429990 ?auto_429991 ?auto_429992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430004 - BLOCK
      ?auto_430005 - BLOCK
      ?auto_430006 - BLOCK
      ?auto_430007 - BLOCK
      ?auto_430008 - BLOCK
      ?auto_430009 - BLOCK
      ?auto_430010 - BLOCK
      ?auto_430011 - BLOCK
      ?auto_430012 - BLOCK
      ?auto_430013 - BLOCK
    )
    :vars
    (
      ?auto_430014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430013 ?auto_430014 ) ( ON-TABLE ?auto_430004 ) ( not ( = ?auto_430004 ?auto_430005 ) ) ( not ( = ?auto_430004 ?auto_430006 ) ) ( not ( = ?auto_430004 ?auto_430007 ) ) ( not ( = ?auto_430004 ?auto_430008 ) ) ( not ( = ?auto_430004 ?auto_430009 ) ) ( not ( = ?auto_430004 ?auto_430010 ) ) ( not ( = ?auto_430004 ?auto_430011 ) ) ( not ( = ?auto_430004 ?auto_430012 ) ) ( not ( = ?auto_430004 ?auto_430013 ) ) ( not ( = ?auto_430004 ?auto_430014 ) ) ( not ( = ?auto_430005 ?auto_430006 ) ) ( not ( = ?auto_430005 ?auto_430007 ) ) ( not ( = ?auto_430005 ?auto_430008 ) ) ( not ( = ?auto_430005 ?auto_430009 ) ) ( not ( = ?auto_430005 ?auto_430010 ) ) ( not ( = ?auto_430005 ?auto_430011 ) ) ( not ( = ?auto_430005 ?auto_430012 ) ) ( not ( = ?auto_430005 ?auto_430013 ) ) ( not ( = ?auto_430005 ?auto_430014 ) ) ( not ( = ?auto_430006 ?auto_430007 ) ) ( not ( = ?auto_430006 ?auto_430008 ) ) ( not ( = ?auto_430006 ?auto_430009 ) ) ( not ( = ?auto_430006 ?auto_430010 ) ) ( not ( = ?auto_430006 ?auto_430011 ) ) ( not ( = ?auto_430006 ?auto_430012 ) ) ( not ( = ?auto_430006 ?auto_430013 ) ) ( not ( = ?auto_430006 ?auto_430014 ) ) ( not ( = ?auto_430007 ?auto_430008 ) ) ( not ( = ?auto_430007 ?auto_430009 ) ) ( not ( = ?auto_430007 ?auto_430010 ) ) ( not ( = ?auto_430007 ?auto_430011 ) ) ( not ( = ?auto_430007 ?auto_430012 ) ) ( not ( = ?auto_430007 ?auto_430013 ) ) ( not ( = ?auto_430007 ?auto_430014 ) ) ( not ( = ?auto_430008 ?auto_430009 ) ) ( not ( = ?auto_430008 ?auto_430010 ) ) ( not ( = ?auto_430008 ?auto_430011 ) ) ( not ( = ?auto_430008 ?auto_430012 ) ) ( not ( = ?auto_430008 ?auto_430013 ) ) ( not ( = ?auto_430008 ?auto_430014 ) ) ( not ( = ?auto_430009 ?auto_430010 ) ) ( not ( = ?auto_430009 ?auto_430011 ) ) ( not ( = ?auto_430009 ?auto_430012 ) ) ( not ( = ?auto_430009 ?auto_430013 ) ) ( not ( = ?auto_430009 ?auto_430014 ) ) ( not ( = ?auto_430010 ?auto_430011 ) ) ( not ( = ?auto_430010 ?auto_430012 ) ) ( not ( = ?auto_430010 ?auto_430013 ) ) ( not ( = ?auto_430010 ?auto_430014 ) ) ( not ( = ?auto_430011 ?auto_430012 ) ) ( not ( = ?auto_430011 ?auto_430013 ) ) ( not ( = ?auto_430011 ?auto_430014 ) ) ( not ( = ?auto_430012 ?auto_430013 ) ) ( not ( = ?auto_430012 ?auto_430014 ) ) ( not ( = ?auto_430013 ?auto_430014 ) ) ( ON ?auto_430012 ?auto_430013 ) ( ON ?auto_430011 ?auto_430012 ) ( ON ?auto_430010 ?auto_430011 ) ( ON ?auto_430009 ?auto_430010 ) ( ON ?auto_430008 ?auto_430009 ) ( ON ?auto_430007 ?auto_430008 ) ( ON ?auto_430006 ?auto_430007 ) ( CLEAR ?auto_430004 ) ( ON ?auto_430005 ?auto_430006 ) ( CLEAR ?auto_430005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430004 ?auto_430005 )
      ( MAKE-10PILE ?auto_430004 ?auto_430005 ?auto_430006 ?auto_430007 ?auto_430008 ?auto_430009 ?auto_430010 ?auto_430011 ?auto_430012 ?auto_430013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430025 - BLOCK
      ?auto_430026 - BLOCK
      ?auto_430027 - BLOCK
      ?auto_430028 - BLOCK
      ?auto_430029 - BLOCK
      ?auto_430030 - BLOCK
      ?auto_430031 - BLOCK
      ?auto_430032 - BLOCK
      ?auto_430033 - BLOCK
      ?auto_430034 - BLOCK
    )
    :vars
    (
      ?auto_430035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430034 ?auto_430035 ) ( ON-TABLE ?auto_430025 ) ( not ( = ?auto_430025 ?auto_430026 ) ) ( not ( = ?auto_430025 ?auto_430027 ) ) ( not ( = ?auto_430025 ?auto_430028 ) ) ( not ( = ?auto_430025 ?auto_430029 ) ) ( not ( = ?auto_430025 ?auto_430030 ) ) ( not ( = ?auto_430025 ?auto_430031 ) ) ( not ( = ?auto_430025 ?auto_430032 ) ) ( not ( = ?auto_430025 ?auto_430033 ) ) ( not ( = ?auto_430025 ?auto_430034 ) ) ( not ( = ?auto_430025 ?auto_430035 ) ) ( not ( = ?auto_430026 ?auto_430027 ) ) ( not ( = ?auto_430026 ?auto_430028 ) ) ( not ( = ?auto_430026 ?auto_430029 ) ) ( not ( = ?auto_430026 ?auto_430030 ) ) ( not ( = ?auto_430026 ?auto_430031 ) ) ( not ( = ?auto_430026 ?auto_430032 ) ) ( not ( = ?auto_430026 ?auto_430033 ) ) ( not ( = ?auto_430026 ?auto_430034 ) ) ( not ( = ?auto_430026 ?auto_430035 ) ) ( not ( = ?auto_430027 ?auto_430028 ) ) ( not ( = ?auto_430027 ?auto_430029 ) ) ( not ( = ?auto_430027 ?auto_430030 ) ) ( not ( = ?auto_430027 ?auto_430031 ) ) ( not ( = ?auto_430027 ?auto_430032 ) ) ( not ( = ?auto_430027 ?auto_430033 ) ) ( not ( = ?auto_430027 ?auto_430034 ) ) ( not ( = ?auto_430027 ?auto_430035 ) ) ( not ( = ?auto_430028 ?auto_430029 ) ) ( not ( = ?auto_430028 ?auto_430030 ) ) ( not ( = ?auto_430028 ?auto_430031 ) ) ( not ( = ?auto_430028 ?auto_430032 ) ) ( not ( = ?auto_430028 ?auto_430033 ) ) ( not ( = ?auto_430028 ?auto_430034 ) ) ( not ( = ?auto_430028 ?auto_430035 ) ) ( not ( = ?auto_430029 ?auto_430030 ) ) ( not ( = ?auto_430029 ?auto_430031 ) ) ( not ( = ?auto_430029 ?auto_430032 ) ) ( not ( = ?auto_430029 ?auto_430033 ) ) ( not ( = ?auto_430029 ?auto_430034 ) ) ( not ( = ?auto_430029 ?auto_430035 ) ) ( not ( = ?auto_430030 ?auto_430031 ) ) ( not ( = ?auto_430030 ?auto_430032 ) ) ( not ( = ?auto_430030 ?auto_430033 ) ) ( not ( = ?auto_430030 ?auto_430034 ) ) ( not ( = ?auto_430030 ?auto_430035 ) ) ( not ( = ?auto_430031 ?auto_430032 ) ) ( not ( = ?auto_430031 ?auto_430033 ) ) ( not ( = ?auto_430031 ?auto_430034 ) ) ( not ( = ?auto_430031 ?auto_430035 ) ) ( not ( = ?auto_430032 ?auto_430033 ) ) ( not ( = ?auto_430032 ?auto_430034 ) ) ( not ( = ?auto_430032 ?auto_430035 ) ) ( not ( = ?auto_430033 ?auto_430034 ) ) ( not ( = ?auto_430033 ?auto_430035 ) ) ( not ( = ?auto_430034 ?auto_430035 ) ) ( ON ?auto_430033 ?auto_430034 ) ( ON ?auto_430032 ?auto_430033 ) ( ON ?auto_430031 ?auto_430032 ) ( ON ?auto_430030 ?auto_430031 ) ( ON ?auto_430029 ?auto_430030 ) ( ON ?auto_430028 ?auto_430029 ) ( ON ?auto_430027 ?auto_430028 ) ( CLEAR ?auto_430025 ) ( ON ?auto_430026 ?auto_430027 ) ( CLEAR ?auto_430026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430025 ?auto_430026 )
      ( MAKE-10PILE ?auto_430025 ?auto_430026 ?auto_430027 ?auto_430028 ?auto_430029 ?auto_430030 ?auto_430031 ?auto_430032 ?auto_430033 ?auto_430034 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430046 - BLOCK
      ?auto_430047 - BLOCK
      ?auto_430048 - BLOCK
      ?auto_430049 - BLOCK
      ?auto_430050 - BLOCK
      ?auto_430051 - BLOCK
      ?auto_430052 - BLOCK
      ?auto_430053 - BLOCK
      ?auto_430054 - BLOCK
      ?auto_430055 - BLOCK
    )
    :vars
    (
      ?auto_430056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430055 ?auto_430056 ) ( not ( = ?auto_430046 ?auto_430047 ) ) ( not ( = ?auto_430046 ?auto_430048 ) ) ( not ( = ?auto_430046 ?auto_430049 ) ) ( not ( = ?auto_430046 ?auto_430050 ) ) ( not ( = ?auto_430046 ?auto_430051 ) ) ( not ( = ?auto_430046 ?auto_430052 ) ) ( not ( = ?auto_430046 ?auto_430053 ) ) ( not ( = ?auto_430046 ?auto_430054 ) ) ( not ( = ?auto_430046 ?auto_430055 ) ) ( not ( = ?auto_430046 ?auto_430056 ) ) ( not ( = ?auto_430047 ?auto_430048 ) ) ( not ( = ?auto_430047 ?auto_430049 ) ) ( not ( = ?auto_430047 ?auto_430050 ) ) ( not ( = ?auto_430047 ?auto_430051 ) ) ( not ( = ?auto_430047 ?auto_430052 ) ) ( not ( = ?auto_430047 ?auto_430053 ) ) ( not ( = ?auto_430047 ?auto_430054 ) ) ( not ( = ?auto_430047 ?auto_430055 ) ) ( not ( = ?auto_430047 ?auto_430056 ) ) ( not ( = ?auto_430048 ?auto_430049 ) ) ( not ( = ?auto_430048 ?auto_430050 ) ) ( not ( = ?auto_430048 ?auto_430051 ) ) ( not ( = ?auto_430048 ?auto_430052 ) ) ( not ( = ?auto_430048 ?auto_430053 ) ) ( not ( = ?auto_430048 ?auto_430054 ) ) ( not ( = ?auto_430048 ?auto_430055 ) ) ( not ( = ?auto_430048 ?auto_430056 ) ) ( not ( = ?auto_430049 ?auto_430050 ) ) ( not ( = ?auto_430049 ?auto_430051 ) ) ( not ( = ?auto_430049 ?auto_430052 ) ) ( not ( = ?auto_430049 ?auto_430053 ) ) ( not ( = ?auto_430049 ?auto_430054 ) ) ( not ( = ?auto_430049 ?auto_430055 ) ) ( not ( = ?auto_430049 ?auto_430056 ) ) ( not ( = ?auto_430050 ?auto_430051 ) ) ( not ( = ?auto_430050 ?auto_430052 ) ) ( not ( = ?auto_430050 ?auto_430053 ) ) ( not ( = ?auto_430050 ?auto_430054 ) ) ( not ( = ?auto_430050 ?auto_430055 ) ) ( not ( = ?auto_430050 ?auto_430056 ) ) ( not ( = ?auto_430051 ?auto_430052 ) ) ( not ( = ?auto_430051 ?auto_430053 ) ) ( not ( = ?auto_430051 ?auto_430054 ) ) ( not ( = ?auto_430051 ?auto_430055 ) ) ( not ( = ?auto_430051 ?auto_430056 ) ) ( not ( = ?auto_430052 ?auto_430053 ) ) ( not ( = ?auto_430052 ?auto_430054 ) ) ( not ( = ?auto_430052 ?auto_430055 ) ) ( not ( = ?auto_430052 ?auto_430056 ) ) ( not ( = ?auto_430053 ?auto_430054 ) ) ( not ( = ?auto_430053 ?auto_430055 ) ) ( not ( = ?auto_430053 ?auto_430056 ) ) ( not ( = ?auto_430054 ?auto_430055 ) ) ( not ( = ?auto_430054 ?auto_430056 ) ) ( not ( = ?auto_430055 ?auto_430056 ) ) ( ON ?auto_430054 ?auto_430055 ) ( ON ?auto_430053 ?auto_430054 ) ( ON ?auto_430052 ?auto_430053 ) ( ON ?auto_430051 ?auto_430052 ) ( ON ?auto_430050 ?auto_430051 ) ( ON ?auto_430049 ?auto_430050 ) ( ON ?auto_430048 ?auto_430049 ) ( ON ?auto_430047 ?auto_430048 ) ( ON ?auto_430046 ?auto_430047 ) ( CLEAR ?auto_430046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430046 )
      ( MAKE-10PILE ?auto_430046 ?auto_430047 ?auto_430048 ?auto_430049 ?auto_430050 ?auto_430051 ?auto_430052 ?auto_430053 ?auto_430054 ?auto_430055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430067 - BLOCK
      ?auto_430068 - BLOCK
      ?auto_430069 - BLOCK
      ?auto_430070 - BLOCK
      ?auto_430071 - BLOCK
      ?auto_430072 - BLOCK
      ?auto_430073 - BLOCK
      ?auto_430074 - BLOCK
      ?auto_430075 - BLOCK
      ?auto_430076 - BLOCK
    )
    :vars
    (
      ?auto_430077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430076 ?auto_430077 ) ( not ( = ?auto_430067 ?auto_430068 ) ) ( not ( = ?auto_430067 ?auto_430069 ) ) ( not ( = ?auto_430067 ?auto_430070 ) ) ( not ( = ?auto_430067 ?auto_430071 ) ) ( not ( = ?auto_430067 ?auto_430072 ) ) ( not ( = ?auto_430067 ?auto_430073 ) ) ( not ( = ?auto_430067 ?auto_430074 ) ) ( not ( = ?auto_430067 ?auto_430075 ) ) ( not ( = ?auto_430067 ?auto_430076 ) ) ( not ( = ?auto_430067 ?auto_430077 ) ) ( not ( = ?auto_430068 ?auto_430069 ) ) ( not ( = ?auto_430068 ?auto_430070 ) ) ( not ( = ?auto_430068 ?auto_430071 ) ) ( not ( = ?auto_430068 ?auto_430072 ) ) ( not ( = ?auto_430068 ?auto_430073 ) ) ( not ( = ?auto_430068 ?auto_430074 ) ) ( not ( = ?auto_430068 ?auto_430075 ) ) ( not ( = ?auto_430068 ?auto_430076 ) ) ( not ( = ?auto_430068 ?auto_430077 ) ) ( not ( = ?auto_430069 ?auto_430070 ) ) ( not ( = ?auto_430069 ?auto_430071 ) ) ( not ( = ?auto_430069 ?auto_430072 ) ) ( not ( = ?auto_430069 ?auto_430073 ) ) ( not ( = ?auto_430069 ?auto_430074 ) ) ( not ( = ?auto_430069 ?auto_430075 ) ) ( not ( = ?auto_430069 ?auto_430076 ) ) ( not ( = ?auto_430069 ?auto_430077 ) ) ( not ( = ?auto_430070 ?auto_430071 ) ) ( not ( = ?auto_430070 ?auto_430072 ) ) ( not ( = ?auto_430070 ?auto_430073 ) ) ( not ( = ?auto_430070 ?auto_430074 ) ) ( not ( = ?auto_430070 ?auto_430075 ) ) ( not ( = ?auto_430070 ?auto_430076 ) ) ( not ( = ?auto_430070 ?auto_430077 ) ) ( not ( = ?auto_430071 ?auto_430072 ) ) ( not ( = ?auto_430071 ?auto_430073 ) ) ( not ( = ?auto_430071 ?auto_430074 ) ) ( not ( = ?auto_430071 ?auto_430075 ) ) ( not ( = ?auto_430071 ?auto_430076 ) ) ( not ( = ?auto_430071 ?auto_430077 ) ) ( not ( = ?auto_430072 ?auto_430073 ) ) ( not ( = ?auto_430072 ?auto_430074 ) ) ( not ( = ?auto_430072 ?auto_430075 ) ) ( not ( = ?auto_430072 ?auto_430076 ) ) ( not ( = ?auto_430072 ?auto_430077 ) ) ( not ( = ?auto_430073 ?auto_430074 ) ) ( not ( = ?auto_430073 ?auto_430075 ) ) ( not ( = ?auto_430073 ?auto_430076 ) ) ( not ( = ?auto_430073 ?auto_430077 ) ) ( not ( = ?auto_430074 ?auto_430075 ) ) ( not ( = ?auto_430074 ?auto_430076 ) ) ( not ( = ?auto_430074 ?auto_430077 ) ) ( not ( = ?auto_430075 ?auto_430076 ) ) ( not ( = ?auto_430075 ?auto_430077 ) ) ( not ( = ?auto_430076 ?auto_430077 ) ) ( ON ?auto_430075 ?auto_430076 ) ( ON ?auto_430074 ?auto_430075 ) ( ON ?auto_430073 ?auto_430074 ) ( ON ?auto_430072 ?auto_430073 ) ( ON ?auto_430071 ?auto_430072 ) ( ON ?auto_430070 ?auto_430071 ) ( ON ?auto_430069 ?auto_430070 ) ( ON ?auto_430068 ?auto_430069 ) ( ON ?auto_430067 ?auto_430068 ) ( CLEAR ?auto_430067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430067 )
      ( MAKE-10PILE ?auto_430067 ?auto_430068 ?auto_430069 ?auto_430070 ?auto_430071 ?auto_430072 ?auto_430073 ?auto_430074 ?auto_430075 ?auto_430076 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430089 - BLOCK
      ?auto_430090 - BLOCK
      ?auto_430091 - BLOCK
      ?auto_430092 - BLOCK
      ?auto_430093 - BLOCK
      ?auto_430094 - BLOCK
      ?auto_430095 - BLOCK
      ?auto_430096 - BLOCK
      ?auto_430097 - BLOCK
      ?auto_430098 - BLOCK
      ?auto_430099 - BLOCK
    )
    :vars
    (
      ?auto_430100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430098 ) ( ON ?auto_430099 ?auto_430100 ) ( CLEAR ?auto_430099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430089 ) ( ON ?auto_430090 ?auto_430089 ) ( ON ?auto_430091 ?auto_430090 ) ( ON ?auto_430092 ?auto_430091 ) ( ON ?auto_430093 ?auto_430092 ) ( ON ?auto_430094 ?auto_430093 ) ( ON ?auto_430095 ?auto_430094 ) ( ON ?auto_430096 ?auto_430095 ) ( ON ?auto_430097 ?auto_430096 ) ( ON ?auto_430098 ?auto_430097 ) ( not ( = ?auto_430089 ?auto_430090 ) ) ( not ( = ?auto_430089 ?auto_430091 ) ) ( not ( = ?auto_430089 ?auto_430092 ) ) ( not ( = ?auto_430089 ?auto_430093 ) ) ( not ( = ?auto_430089 ?auto_430094 ) ) ( not ( = ?auto_430089 ?auto_430095 ) ) ( not ( = ?auto_430089 ?auto_430096 ) ) ( not ( = ?auto_430089 ?auto_430097 ) ) ( not ( = ?auto_430089 ?auto_430098 ) ) ( not ( = ?auto_430089 ?auto_430099 ) ) ( not ( = ?auto_430089 ?auto_430100 ) ) ( not ( = ?auto_430090 ?auto_430091 ) ) ( not ( = ?auto_430090 ?auto_430092 ) ) ( not ( = ?auto_430090 ?auto_430093 ) ) ( not ( = ?auto_430090 ?auto_430094 ) ) ( not ( = ?auto_430090 ?auto_430095 ) ) ( not ( = ?auto_430090 ?auto_430096 ) ) ( not ( = ?auto_430090 ?auto_430097 ) ) ( not ( = ?auto_430090 ?auto_430098 ) ) ( not ( = ?auto_430090 ?auto_430099 ) ) ( not ( = ?auto_430090 ?auto_430100 ) ) ( not ( = ?auto_430091 ?auto_430092 ) ) ( not ( = ?auto_430091 ?auto_430093 ) ) ( not ( = ?auto_430091 ?auto_430094 ) ) ( not ( = ?auto_430091 ?auto_430095 ) ) ( not ( = ?auto_430091 ?auto_430096 ) ) ( not ( = ?auto_430091 ?auto_430097 ) ) ( not ( = ?auto_430091 ?auto_430098 ) ) ( not ( = ?auto_430091 ?auto_430099 ) ) ( not ( = ?auto_430091 ?auto_430100 ) ) ( not ( = ?auto_430092 ?auto_430093 ) ) ( not ( = ?auto_430092 ?auto_430094 ) ) ( not ( = ?auto_430092 ?auto_430095 ) ) ( not ( = ?auto_430092 ?auto_430096 ) ) ( not ( = ?auto_430092 ?auto_430097 ) ) ( not ( = ?auto_430092 ?auto_430098 ) ) ( not ( = ?auto_430092 ?auto_430099 ) ) ( not ( = ?auto_430092 ?auto_430100 ) ) ( not ( = ?auto_430093 ?auto_430094 ) ) ( not ( = ?auto_430093 ?auto_430095 ) ) ( not ( = ?auto_430093 ?auto_430096 ) ) ( not ( = ?auto_430093 ?auto_430097 ) ) ( not ( = ?auto_430093 ?auto_430098 ) ) ( not ( = ?auto_430093 ?auto_430099 ) ) ( not ( = ?auto_430093 ?auto_430100 ) ) ( not ( = ?auto_430094 ?auto_430095 ) ) ( not ( = ?auto_430094 ?auto_430096 ) ) ( not ( = ?auto_430094 ?auto_430097 ) ) ( not ( = ?auto_430094 ?auto_430098 ) ) ( not ( = ?auto_430094 ?auto_430099 ) ) ( not ( = ?auto_430094 ?auto_430100 ) ) ( not ( = ?auto_430095 ?auto_430096 ) ) ( not ( = ?auto_430095 ?auto_430097 ) ) ( not ( = ?auto_430095 ?auto_430098 ) ) ( not ( = ?auto_430095 ?auto_430099 ) ) ( not ( = ?auto_430095 ?auto_430100 ) ) ( not ( = ?auto_430096 ?auto_430097 ) ) ( not ( = ?auto_430096 ?auto_430098 ) ) ( not ( = ?auto_430096 ?auto_430099 ) ) ( not ( = ?auto_430096 ?auto_430100 ) ) ( not ( = ?auto_430097 ?auto_430098 ) ) ( not ( = ?auto_430097 ?auto_430099 ) ) ( not ( = ?auto_430097 ?auto_430100 ) ) ( not ( = ?auto_430098 ?auto_430099 ) ) ( not ( = ?auto_430098 ?auto_430100 ) ) ( not ( = ?auto_430099 ?auto_430100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430099 ?auto_430100 )
      ( !STACK ?auto_430099 ?auto_430098 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430112 - BLOCK
      ?auto_430113 - BLOCK
      ?auto_430114 - BLOCK
      ?auto_430115 - BLOCK
      ?auto_430116 - BLOCK
      ?auto_430117 - BLOCK
      ?auto_430118 - BLOCK
      ?auto_430119 - BLOCK
      ?auto_430120 - BLOCK
      ?auto_430121 - BLOCK
      ?auto_430122 - BLOCK
    )
    :vars
    (
      ?auto_430123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430121 ) ( ON ?auto_430122 ?auto_430123 ) ( CLEAR ?auto_430122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430112 ) ( ON ?auto_430113 ?auto_430112 ) ( ON ?auto_430114 ?auto_430113 ) ( ON ?auto_430115 ?auto_430114 ) ( ON ?auto_430116 ?auto_430115 ) ( ON ?auto_430117 ?auto_430116 ) ( ON ?auto_430118 ?auto_430117 ) ( ON ?auto_430119 ?auto_430118 ) ( ON ?auto_430120 ?auto_430119 ) ( ON ?auto_430121 ?auto_430120 ) ( not ( = ?auto_430112 ?auto_430113 ) ) ( not ( = ?auto_430112 ?auto_430114 ) ) ( not ( = ?auto_430112 ?auto_430115 ) ) ( not ( = ?auto_430112 ?auto_430116 ) ) ( not ( = ?auto_430112 ?auto_430117 ) ) ( not ( = ?auto_430112 ?auto_430118 ) ) ( not ( = ?auto_430112 ?auto_430119 ) ) ( not ( = ?auto_430112 ?auto_430120 ) ) ( not ( = ?auto_430112 ?auto_430121 ) ) ( not ( = ?auto_430112 ?auto_430122 ) ) ( not ( = ?auto_430112 ?auto_430123 ) ) ( not ( = ?auto_430113 ?auto_430114 ) ) ( not ( = ?auto_430113 ?auto_430115 ) ) ( not ( = ?auto_430113 ?auto_430116 ) ) ( not ( = ?auto_430113 ?auto_430117 ) ) ( not ( = ?auto_430113 ?auto_430118 ) ) ( not ( = ?auto_430113 ?auto_430119 ) ) ( not ( = ?auto_430113 ?auto_430120 ) ) ( not ( = ?auto_430113 ?auto_430121 ) ) ( not ( = ?auto_430113 ?auto_430122 ) ) ( not ( = ?auto_430113 ?auto_430123 ) ) ( not ( = ?auto_430114 ?auto_430115 ) ) ( not ( = ?auto_430114 ?auto_430116 ) ) ( not ( = ?auto_430114 ?auto_430117 ) ) ( not ( = ?auto_430114 ?auto_430118 ) ) ( not ( = ?auto_430114 ?auto_430119 ) ) ( not ( = ?auto_430114 ?auto_430120 ) ) ( not ( = ?auto_430114 ?auto_430121 ) ) ( not ( = ?auto_430114 ?auto_430122 ) ) ( not ( = ?auto_430114 ?auto_430123 ) ) ( not ( = ?auto_430115 ?auto_430116 ) ) ( not ( = ?auto_430115 ?auto_430117 ) ) ( not ( = ?auto_430115 ?auto_430118 ) ) ( not ( = ?auto_430115 ?auto_430119 ) ) ( not ( = ?auto_430115 ?auto_430120 ) ) ( not ( = ?auto_430115 ?auto_430121 ) ) ( not ( = ?auto_430115 ?auto_430122 ) ) ( not ( = ?auto_430115 ?auto_430123 ) ) ( not ( = ?auto_430116 ?auto_430117 ) ) ( not ( = ?auto_430116 ?auto_430118 ) ) ( not ( = ?auto_430116 ?auto_430119 ) ) ( not ( = ?auto_430116 ?auto_430120 ) ) ( not ( = ?auto_430116 ?auto_430121 ) ) ( not ( = ?auto_430116 ?auto_430122 ) ) ( not ( = ?auto_430116 ?auto_430123 ) ) ( not ( = ?auto_430117 ?auto_430118 ) ) ( not ( = ?auto_430117 ?auto_430119 ) ) ( not ( = ?auto_430117 ?auto_430120 ) ) ( not ( = ?auto_430117 ?auto_430121 ) ) ( not ( = ?auto_430117 ?auto_430122 ) ) ( not ( = ?auto_430117 ?auto_430123 ) ) ( not ( = ?auto_430118 ?auto_430119 ) ) ( not ( = ?auto_430118 ?auto_430120 ) ) ( not ( = ?auto_430118 ?auto_430121 ) ) ( not ( = ?auto_430118 ?auto_430122 ) ) ( not ( = ?auto_430118 ?auto_430123 ) ) ( not ( = ?auto_430119 ?auto_430120 ) ) ( not ( = ?auto_430119 ?auto_430121 ) ) ( not ( = ?auto_430119 ?auto_430122 ) ) ( not ( = ?auto_430119 ?auto_430123 ) ) ( not ( = ?auto_430120 ?auto_430121 ) ) ( not ( = ?auto_430120 ?auto_430122 ) ) ( not ( = ?auto_430120 ?auto_430123 ) ) ( not ( = ?auto_430121 ?auto_430122 ) ) ( not ( = ?auto_430121 ?auto_430123 ) ) ( not ( = ?auto_430122 ?auto_430123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430122 ?auto_430123 )
      ( !STACK ?auto_430122 ?auto_430121 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430135 - BLOCK
      ?auto_430136 - BLOCK
      ?auto_430137 - BLOCK
      ?auto_430138 - BLOCK
      ?auto_430139 - BLOCK
      ?auto_430140 - BLOCK
      ?auto_430141 - BLOCK
      ?auto_430142 - BLOCK
      ?auto_430143 - BLOCK
      ?auto_430144 - BLOCK
      ?auto_430145 - BLOCK
    )
    :vars
    (
      ?auto_430146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430145 ?auto_430146 ) ( ON-TABLE ?auto_430135 ) ( ON ?auto_430136 ?auto_430135 ) ( ON ?auto_430137 ?auto_430136 ) ( ON ?auto_430138 ?auto_430137 ) ( ON ?auto_430139 ?auto_430138 ) ( ON ?auto_430140 ?auto_430139 ) ( ON ?auto_430141 ?auto_430140 ) ( ON ?auto_430142 ?auto_430141 ) ( ON ?auto_430143 ?auto_430142 ) ( not ( = ?auto_430135 ?auto_430136 ) ) ( not ( = ?auto_430135 ?auto_430137 ) ) ( not ( = ?auto_430135 ?auto_430138 ) ) ( not ( = ?auto_430135 ?auto_430139 ) ) ( not ( = ?auto_430135 ?auto_430140 ) ) ( not ( = ?auto_430135 ?auto_430141 ) ) ( not ( = ?auto_430135 ?auto_430142 ) ) ( not ( = ?auto_430135 ?auto_430143 ) ) ( not ( = ?auto_430135 ?auto_430144 ) ) ( not ( = ?auto_430135 ?auto_430145 ) ) ( not ( = ?auto_430135 ?auto_430146 ) ) ( not ( = ?auto_430136 ?auto_430137 ) ) ( not ( = ?auto_430136 ?auto_430138 ) ) ( not ( = ?auto_430136 ?auto_430139 ) ) ( not ( = ?auto_430136 ?auto_430140 ) ) ( not ( = ?auto_430136 ?auto_430141 ) ) ( not ( = ?auto_430136 ?auto_430142 ) ) ( not ( = ?auto_430136 ?auto_430143 ) ) ( not ( = ?auto_430136 ?auto_430144 ) ) ( not ( = ?auto_430136 ?auto_430145 ) ) ( not ( = ?auto_430136 ?auto_430146 ) ) ( not ( = ?auto_430137 ?auto_430138 ) ) ( not ( = ?auto_430137 ?auto_430139 ) ) ( not ( = ?auto_430137 ?auto_430140 ) ) ( not ( = ?auto_430137 ?auto_430141 ) ) ( not ( = ?auto_430137 ?auto_430142 ) ) ( not ( = ?auto_430137 ?auto_430143 ) ) ( not ( = ?auto_430137 ?auto_430144 ) ) ( not ( = ?auto_430137 ?auto_430145 ) ) ( not ( = ?auto_430137 ?auto_430146 ) ) ( not ( = ?auto_430138 ?auto_430139 ) ) ( not ( = ?auto_430138 ?auto_430140 ) ) ( not ( = ?auto_430138 ?auto_430141 ) ) ( not ( = ?auto_430138 ?auto_430142 ) ) ( not ( = ?auto_430138 ?auto_430143 ) ) ( not ( = ?auto_430138 ?auto_430144 ) ) ( not ( = ?auto_430138 ?auto_430145 ) ) ( not ( = ?auto_430138 ?auto_430146 ) ) ( not ( = ?auto_430139 ?auto_430140 ) ) ( not ( = ?auto_430139 ?auto_430141 ) ) ( not ( = ?auto_430139 ?auto_430142 ) ) ( not ( = ?auto_430139 ?auto_430143 ) ) ( not ( = ?auto_430139 ?auto_430144 ) ) ( not ( = ?auto_430139 ?auto_430145 ) ) ( not ( = ?auto_430139 ?auto_430146 ) ) ( not ( = ?auto_430140 ?auto_430141 ) ) ( not ( = ?auto_430140 ?auto_430142 ) ) ( not ( = ?auto_430140 ?auto_430143 ) ) ( not ( = ?auto_430140 ?auto_430144 ) ) ( not ( = ?auto_430140 ?auto_430145 ) ) ( not ( = ?auto_430140 ?auto_430146 ) ) ( not ( = ?auto_430141 ?auto_430142 ) ) ( not ( = ?auto_430141 ?auto_430143 ) ) ( not ( = ?auto_430141 ?auto_430144 ) ) ( not ( = ?auto_430141 ?auto_430145 ) ) ( not ( = ?auto_430141 ?auto_430146 ) ) ( not ( = ?auto_430142 ?auto_430143 ) ) ( not ( = ?auto_430142 ?auto_430144 ) ) ( not ( = ?auto_430142 ?auto_430145 ) ) ( not ( = ?auto_430142 ?auto_430146 ) ) ( not ( = ?auto_430143 ?auto_430144 ) ) ( not ( = ?auto_430143 ?auto_430145 ) ) ( not ( = ?auto_430143 ?auto_430146 ) ) ( not ( = ?auto_430144 ?auto_430145 ) ) ( not ( = ?auto_430144 ?auto_430146 ) ) ( not ( = ?auto_430145 ?auto_430146 ) ) ( CLEAR ?auto_430143 ) ( ON ?auto_430144 ?auto_430145 ) ( CLEAR ?auto_430144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430135 ?auto_430136 ?auto_430137 ?auto_430138 ?auto_430139 ?auto_430140 ?auto_430141 ?auto_430142 ?auto_430143 ?auto_430144 )
      ( MAKE-11PILE ?auto_430135 ?auto_430136 ?auto_430137 ?auto_430138 ?auto_430139 ?auto_430140 ?auto_430141 ?auto_430142 ?auto_430143 ?auto_430144 ?auto_430145 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430158 - BLOCK
      ?auto_430159 - BLOCK
      ?auto_430160 - BLOCK
      ?auto_430161 - BLOCK
      ?auto_430162 - BLOCK
      ?auto_430163 - BLOCK
      ?auto_430164 - BLOCK
      ?auto_430165 - BLOCK
      ?auto_430166 - BLOCK
      ?auto_430167 - BLOCK
      ?auto_430168 - BLOCK
    )
    :vars
    (
      ?auto_430169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430168 ?auto_430169 ) ( ON-TABLE ?auto_430158 ) ( ON ?auto_430159 ?auto_430158 ) ( ON ?auto_430160 ?auto_430159 ) ( ON ?auto_430161 ?auto_430160 ) ( ON ?auto_430162 ?auto_430161 ) ( ON ?auto_430163 ?auto_430162 ) ( ON ?auto_430164 ?auto_430163 ) ( ON ?auto_430165 ?auto_430164 ) ( ON ?auto_430166 ?auto_430165 ) ( not ( = ?auto_430158 ?auto_430159 ) ) ( not ( = ?auto_430158 ?auto_430160 ) ) ( not ( = ?auto_430158 ?auto_430161 ) ) ( not ( = ?auto_430158 ?auto_430162 ) ) ( not ( = ?auto_430158 ?auto_430163 ) ) ( not ( = ?auto_430158 ?auto_430164 ) ) ( not ( = ?auto_430158 ?auto_430165 ) ) ( not ( = ?auto_430158 ?auto_430166 ) ) ( not ( = ?auto_430158 ?auto_430167 ) ) ( not ( = ?auto_430158 ?auto_430168 ) ) ( not ( = ?auto_430158 ?auto_430169 ) ) ( not ( = ?auto_430159 ?auto_430160 ) ) ( not ( = ?auto_430159 ?auto_430161 ) ) ( not ( = ?auto_430159 ?auto_430162 ) ) ( not ( = ?auto_430159 ?auto_430163 ) ) ( not ( = ?auto_430159 ?auto_430164 ) ) ( not ( = ?auto_430159 ?auto_430165 ) ) ( not ( = ?auto_430159 ?auto_430166 ) ) ( not ( = ?auto_430159 ?auto_430167 ) ) ( not ( = ?auto_430159 ?auto_430168 ) ) ( not ( = ?auto_430159 ?auto_430169 ) ) ( not ( = ?auto_430160 ?auto_430161 ) ) ( not ( = ?auto_430160 ?auto_430162 ) ) ( not ( = ?auto_430160 ?auto_430163 ) ) ( not ( = ?auto_430160 ?auto_430164 ) ) ( not ( = ?auto_430160 ?auto_430165 ) ) ( not ( = ?auto_430160 ?auto_430166 ) ) ( not ( = ?auto_430160 ?auto_430167 ) ) ( not ( = ?auto_430160 ?auto_430168 ) ) ( not ( = ?auto_430160 ?auto_430169 ) ) ( not ( = ?auto_430161 ?auto_430162 ) ) ( not ( = ?auto_430161 ?auto_430163 ) ) ( not ( = ?auto_430161 ?auto_430164 ) ) ( not ( = ?auto_430161 ?auto_430165 ) ) ( not ( = ?auto_430161 ?auto_430166 ) ) ( not ( = ?auto_430161 ?auto_430167 ) ) ( not ( = ?auto_430161 ?auto_430168 ) ) ( not ( = ?auto_430161 ?auto_430169 ) ) ( not ( = ?auto_430162 ?auto_430163 ) ) ( not ( = ?auto_430162 ?auto_430164 ) ) ( not ( = ?auto_430162 ?auto_430165 ) ) ( not ( = ?auto_430162 ?auto_430166 ) ) ( not ( = ?auto_430162 ?auto_430167 ) ) ( not ( = ?auto_430162 ?auto_430168 ) ) ( not ( = ?auto_430162 ?auto_430169 ) ) ( not ( = ?auto_430163 ?auto_430164 ) ) ( not ( = ?auto_430163 ?auto_430165 ) ) ( not ( = ?auto_430163 ?auto_430166 ) ) ( not ( = ?auto_430163 ?auto_430167 ) ) ( not ( = ?auto_430163 ?auto_430168 ) ) ( not ( = ?auto_430163 ?auto_430169 ) ) ( not ( = ?auto_430164 ?auto_430165 ) ) ( not ( = ?auto_430164 ?auto_430166 ) ) ( not ( = ?auto_430164 ?auto_430167 ) ) ( not ( = ?auto_430164 ?auto_430168 ) ) ( not ( = ?auto_430164 ?auto_430169 ) ) ( not ( = ?auto_430165 ?auto_430166 ) ) ( not ( = ?auto_430165 ?auto_430167 ) ) ( not ( = ?auto_430165 ?auto_430168 ) ) ( not ( = ?auto_430165 ?auto_430169 ) ) ( not ( = ?auto_430166 ?auto_430167 ) ) ( not ( = ?auto_430166 ?auto_430168 ) ) ( not ( = ?auto_430166 ?auto_430169 ) ) ( not ( = ?auto_430167 ?auto_430168 ) ) ( not ( = ?auto_430167 ?auto_430169 ) ) ( not ( = ?auto_430168 ?auto_430169 ) ) ( CLEAR ?auto_430166 ) ( ON ?auto_430167 ?auto_430168 ) ( CLEAR ?auto_430167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430158 ?auto_430159 ?auto_430160 ?auto_430161 ?auto_430162 ?auto_430163 ?auto_430164 ?auto_430165 ?auto_430166 ?auto_430167 )
      ( MAKE-11PILE ?auto_430158 ?auto_430159 ?auto_430160 ?auto_430161 ?auto_430162 ?auto_430163 ?auto_430164 ?auto_430165 ?auto_430166 ?auto_430167 ?auto_430168 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430181 - BLOCK
      ?auto_430182 - BLOCK
      ?auto_430183 - BLOCK
      ?auto_430184 - BLOCK
      ?auto_430185 - BLOCK
      ?auto_430186 - BLOCK
      ?auto_430187 - BLOCK
      ?auto_430188 - BLOCK
      ?auto_430189 - BLOCK
      ?auto_430190 - BLOCK
      ?auto_430191 - BLOCK
    )
    :vars
    (
      ?auto_430192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430191 ?auto_430192 ) ( ON-TABLE ?auto_430181 ) ( ON ?auto_430182 ?auto_430181 ) ( ON ?auto_430183 ?auto_430182 ) ( ON ?auto_430184 ?auto_430183 ) ( ON ?auto_430185 ?auto_430184 ) ( ON ?auto_430186 ?auto_430185 ) ( ON ?auto_430187 ?auto_430186 ) ( ON ?auto_430188 ?auto_430187 ) ( not ( = ?auto_430181 ?auto_430182 ) ) ( not ( = ?auto_430181 ?auto_430183 ) ) ( not ( = ?auto_430181 ?auto_430184 ) ) ( not ( = ?auto_430181 ?auto_430185 ) ) ( not ( = ?auto_430181 ?auto_430186 ) ) ( not ( = ?auto_430181 ?auto_430187 ) ) ( not ( = ?auto_430181 ?auto_430188 ) ) ( not ( = ?auto_430181 ?auto_430189 ) ) ( not ( = ?auto_430181 ?auto_430190 ) ) ( not ( = ?auto_430181 ?auto_430191 ) ) ( not ( = ?auto_430181 ?auto_430192 ) ) ( not ( = ?auto_430182 ?auto_430183 ) ) ( not ( = ?auto_430182 ?auto_430184 ) ) ( not ( = ?auto_430182 ?auto_430185 ) ) ( not ( = ?auto_430182 ?auto_430186 ) ) ( not ( = ?auto_430182 ?auto_430187 ) ) ( not ( = ?auto_430182 ?auto_430188 ) ) ( not ( = ?auto_430182 ?auto_430189 ) ) ( not ( = ?auto_430182 ?auto_430190 ) ) ( not ( = ?auto_430182 ?auto_430191 ) ) ( not ( = ?auto_430182 ?auto_430192 ) ) ( not ( = ?auto_430183 ?auto_430184 ) ) ( not ( = ?auto_430183 ?auto_430185 ) ) ( not ( = ?auto_430183 ?auto_430186 ) ) ( not ( = ?auto_430183 ?auto_430187 ) ) ( not ( = ?auto_430183 ?auto_430188 ) ) ( not ( = ?auto_430183 ?auto_430189 ) ) ( not ( = ?auto_430183 ?auto_430190 ) ) ( not ( = ?auto_430183 ?auto_430191 ) ) ( not ( = ?auto_430183 ?auto_430192 ) ) ( not ( = ?auto_430184 ?auto_430185 ) ) ( not ( = ?auto_430184 ?auto_430186 ) ) ( not ( = ?auto_430184 ?auto_430187 ) ) ( not ( = ?auto_430184 ?auto_430188 ) ) ( not ( = ?auto_430184 ?auto_430189 ) ) ( not ( = ?auto_430184 ?auto_430190 ) ) ( not ( = ?auto_430184 ?auto_430191 ) ) ( not ( = ?auto_430184 ?auto_430192 ) ) ( not ( = ?auto_430185 ?auto_430186 ) ) ( not ( = ?auto_430185 ?auto_430187 ) ) ( not ( = ?auto_430185 ?auto_430188 ) ) ( not ( = ?auto_430185 ?auto_430189 ) ) ( not ( = ?auto_430185 ?auto_430190 ) ) ( not ( = ?auto_430185 ?auto_430191 ) ) ( not ( = ?auto_430185 ?auto_430192 ) ) ( not ( = ?auto_430186 ?auto_430187 ) ) ( not ( = ?auto_430186 ?auto_430188 ) ) ( not ( = ?auto_430186 ?auto_430189 ) ) ( not ( = ?auto_430186 ?auto_430190 ) ) ( not ( = ?auto_430186 ?auto_430191 ) ) ( not ( = ?auto_430186 ?auto_430192 ) ) ( not ( = ?auto_430187 ?auto_430188 ) ) ( not ( = ?auto_430187 ?auto_430189 ) ) ( not ( = ?auto_430187 ?auto_430190 ) ) ( not ( = ?auto_430187 ?auto_430191 ) ) ( not ( = ?auto_430187 ?auto_430192 ) ) ( not ( = ?auto_430188 ?auto_430189 ) ) ( not ( = ?auto_430188 ?auto_430190 ) ) ( not ( = ?auto_430188 ?auto_430191 ) ) ( not ( = ?auto_430188 ?auto_430192 ) ) ( not ( = ?auto_430189 ?auto_430190 ) ) ( not ( = ?auto_430189 ?auto_430191 ) ) ( not ( = ?auto_430189 ?auto_430192 ) ) ( not ( = ?auto_430190 ?auto_430191 ) ) ( not ( = ?auto_430190 ?auto_430192 ) ) ( not ( = ?auto_430191 ?auto_430192 ) ) ( ON ?auto_430190 ?auto_430191 ) ( CLEAR ?auto_430188 ) ( ON ?auto_430189 ?auto_430190 ) ( CLEAR ?auto_430189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430181 ?auto_430182 ?auto_430183 ?auto_430184 ?auto_430185 ?auto_430186 ?auto_430187 ?auto_430188 ?auto_430189 )
      ( MAKE-11PILE ?auto_430181 ?auto_430182 ?auto_430183 ?auto_430184 ?auto_430185 ?auto_430186 ?auto_430187 ?auto_430188 ?auto_430189 ?auto_430190 ?auto_430191 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430204 - BLOCK
      ?auto_430205 - BLOCK
      ?auto_430206 - BLOCK
      ?auto_430207 - BLOCK
      ?auto_430208 - BLOCK
      ?auto_430209 - BLOCK
      ?auto_430210 - BLOCK
      ?auto_430211 - BLOCK
      ?auto_430212 - BLOCK
      ?auto_430213 - BLOCK
      ?auto_430214 - BLOCK
    )
    :vars
    (
      ?auto_430215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430214 ?auto_430215 ) ( ON-TABLE ?auto_430204 ) ( ON ?auto_430205 ?auto_430204 ) ( ON ?auto_430206 ?auto_430205 ) ( ON ?auto_430207 ?auto_430206 ) ( ON ?auto_430208 ?auto_430207 ) ( ON ?auto_430209 ?auto_430208 ) ( ON ?auto_430210 ?auto_430209 ) ( ON ?auto_430211 ?auto_430210 ) ( not ( = ?auto_430204 ?auto_430205 ) ) ( not ( = ?auto_430204 ?auto_430206 ) ) ( not ( = ?auto_430204 ?auto_430207 ) ) ( not ( = ?auto_430204 ?auto_430208 ) ) ( not ( = ?auto_430204 ?auto_430209 ) ) ( not ( = ?auto_430204 ?auto_430210 ) ) ( not ( = ?auto_430204 ?auto_430211 ) ) ( not ( = ?auto_430204 ?auto_430212 ) ) ( not ( = ?auto_430204 ?auto_430213 ) ) ( not ( = ?auto_430204 ?auto_430214 ) ) ( not ( = ?auto_430204 ?auto_430215 ) ) ( not ( = ?auto_430205 ?auto_430206 ) ) ( not ( = ?auto_430205 ?auto_430207 ) ) ( not ( = ?auto_430205 ?auto_430208 ) ) ( not ( = ?auto_430205 ?auto_430209 ) ) ( not ( = ?auto_430205 ?auto_430210 ) ) ( not ( = ?auto_430205 ?auto_430211 ) ) ( not ( = ?auto_430205 ?auto_430212 ) ) ( not ( = ?auto_430205 ?auto_430213 ) ) ( not ( = ?auto_430205 ?auto_430214 ) ) ( not ( = ?auto_430205 ?auto_430215 ) ) ( not ( = ?auto_430206 ?auto_430207 ) ) ( not ( = ?auto_430206 ?auto_430208 ) ) ( not ( = ?auto_430206 ?auto_430209 ) ) ( not ( = ?auto_430206 ?auto_430210 ) ) ( not ( = ?auto_430206 ?auto_430211 ) ) ( not ( = ?auto_430206 ?auto_430212 ) ) ( not ( = ?auto_430206 ?auto_430213 ) ) ( not ( = ?auto_430206 ?auto_430214 ) ) ( not ( = ?auto_430206 ?auto_430215 ) ) ( not ( = ?auto_430207 ?auto_430208 ) ) ( not ( = ?auto_430207 ?auto_430209 ) ) ( not ( = ?auto_430207 ?auto_430210 ) ) ( not ( = ?auto_430207 ?auto_430211 ) ) ( not ( = ?auto_430207 ?auto_430212 ) ) ( not ( = ?auto_430207 ?auto_430213 ) ) ( not ( = ?auto_430207 ?auto_430214 ) ) ( not ( = ?auto_430207 ?auto_430215 ) ) ( not ( = ?auto_430208 ?auto_430209 ) ) ( not ( = ?auto_430208 ?auto_430210 ) ) ( not ( = ?auto_430208 ?auto_430211 ) ) ( not ( = ?auto_430208 ?auto_430212 ) ) ( not ( = ?auto_430208 ?auto_430213 ) ) ( not ( = ?auto_430208 ?auto_430214 ) ) ( not ( = ?auto_430208 ?auto_430215 ) ) ( not ( = ?auto_430209 ?auto_430210 ) ) ( not ( = ?auto_430209 ?auto_430211 ) ) ( not ( = ?auto_430209 ?auto_430212 ) ) ( not ( = ?auto_430209 ?auto_430213 ) ) ( not ( = ?auto_430209 ?auto_430214 ) ) ( not ( = ?auto_430209 ?auto_430215 ) ) ( not ( = ?auto_430210 ?auto_430211 ) ) ( not ( = ?auto_430210 ?auto_430212 ) ) ( not ( = ?auto_430210 ?auto_430213 ) ) ( not ( = ?auto_430210 ?auto_430214 ) ) ( not ( = ?auto_430210 ?auto_430215 ) ) ( not ( = ?auto_430211 ?auto_430212 ) ) ( not ( = ?auto_430211 ?auto_430213 ) ) ( not ( = ?auto_430211 ?auto_430214 ) ) ( not ( = ?auto_430211 ?auto_430215 ) ) ( not ( = ?auto_430212 ?auto_430213 ) ) ( not ( = ?auto_430212 ?auto_430214 ) ) ( not ( = ?auto_430212 ?auto_430215 ) ) ( not ( = ?auto_430213 ?auto_430214 ) ) ( not ( = ?auto_430213 ?auto_430215 ) ) ( not ( = ?auto_430214 ?auto_430215 ) ) ( ON ?auto_430213 ?auto_430214 ) ( CLEAR ?auto_430211 ) ( ON ?auto_430212 ?auto_430213 ) ( CLEAR ?auto_430212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430204 ?auto_430205 ?auto_430206 ?auto_430207 ?auto_430208 ?auto_430209 ?auto_430210 ?auto_430211 ?auto_430212 )
      ( MAKE-11PILE ?auto_430204 ?auto_430205 ?auto_430206 ?auto_430207 ?auto_430208 ?auto_430209 ?auto_430210 ?auto_430211 ?auto_430212 ?auto_430213 ?auto_430214 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430227 - BLOCK
      ?auto_430228 - BLOCK
      ?auto_430229 - BLOCK
      ?auto_430230 - BLOCK
      ?auto_430231 - BLOCK
      ?auto_430232 - BLOCK
      ?auto_430233 - BLOCK
      ?auto_430234 - BLOCK
      ?auto_430235 - BLOCK
      ?auto_430236 - BLOCK
      ?auto_430237 - BLOCK
    )
    :vars
    (
      ?auto_430238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430237 ?auto_430238 ) ( ON-TABLE ?auto_430227 ) ( ON ?auto_430228 ?auto_430227 ) ( ON ?auto_430229 ?auto_430228 ) ( ON ?auto_430230 ?auto_430229 ) ( ON ?auto_430231 ?auto_430230 ) ( ON ?auto_430232 ?auto_430231 ) ( ON ?auto_430233 ?auto_430232 ) ( not ( = ?auto_430227 ?auto_430228 ) ) ( not ( = ?auto_430227 ?auto_430229 ) ) ( not ( = ?auto_430227 ?auto_430230 ) ) ( not ( = ?auto_430227 ?auto_430231 ) ) ( not ( = ?auto_430227 ?auto_430232 ) ) ( not ( = ?auto_430227 ?auto_430233 ) ) ( not ( = ?auto_430227 ?auto_430234 ) ) ( not ( = ?auto_430227 ?auto_430235 ) ) ( not ( = ?auto_430227 ?auto_430236 ) ) ( not ( = ?auto_430227 ?auto_430237 ) ) ( not ( = ?auto_430227 ?auto_430238 ) ) ( not ( = ?auto_430228 ?auto_430229 ) ) ( not ( = ?auto_430228 ?auto_430230 ) ) ( not ( = ?auto_430228 ?auto_430231 ) ) ( not ( = ?auto_430228 ?auto_430232 ) ) ( not ( = ?auto_430228 ?auto_430233 ) ) ( not ( = ?auto_430228 ?auto_430234 ) ) ( not ( = ?auto_430228 ?auto_430235 ) ) ( not ( = ?auto_430228 ?auto_430236 ) ) ( not ( = ?auto_430228 ?auto_430237 ) ) ( not ( = ?auto_430228 ?auto_430238 ) ) ( not ( = ?auto_430229 ?auto_430230 ) ) ( not ( = ?auto_430229 ?auto_430231 ) ) ( not ( = ?auto_430229 ?auto_430232 ) ) ( not ( = ?auto_430229 ?auto_430233 ) ) ( not ( = ?auto_430229 ?auto_430234 ) ) ( not ( = ?auto_430229 ?auto_430235 ) ) ( not ( = ?auto_430229 ?auto_430236 ) ) ( not ( = ?auto_430229 ?auto_430237 ) ) ( not ( = ?auto_430229 ?auto_430238 ) ) ( not ( = ?auto_430230 ?auto_430231 ) ) ( not ( = ?auto_430230 ?auto_430232 ) ) ( not ( = ?auto_430230 ?auto_430233 ) ) ( not ( = ?auto_430230 ?auto_430234 ) ) ( not ( = ?auto_430230 ?auto_430235 ) ) ( not ( = ?auto_430230 ?auto_430236 ) ) ( not ( = ?auto_430230 ?auto_430237 ) ) ( not ( = ?auto_430230 ?auto_430238 ) ) ( not ( = ?auto_430231 ?auto_430232 ) ) ( not ( = ?auto_430231 ?auto_430233 ) ) ( not ( = ?auto_430231 ?auto_430234 ) ) ( not ( = ?auto_430231 ?auto_430235 ) ) ( not ( = ?auto_430231 ?auto_430236 ) ) ( not ( = ?auto_430231 ?auto_430237 ) ) ( not ( = ?auto_430231 ?auto_430238 ) ) ( not ( = ?auto_430232 ?auto_430233 ) ) ( not ( = ?auto_430232 ?auto_430234 ) ) ( not ( = ?auto_430232 ?auto_430235 ) ) ( not ( = ?auto_430232 ?auto_430236 ) ) ( not ( = ?auto_430232 ?auto_430237 ) ) ( not ( = ?auto_430232 ?auto_430238 ) ) ( not ( = ?auto_430233 ?auto_430234 ) ) ( not ( = ?auto_430233 ?auto_430235 ) ) ( not ( = ?auto_430233 ?auto_430236 ) ) ( not ( = ?auto_430233 ?auto_430237 ) ) ( not ( = ?auto_430233 ?auto_430238 ) ) ( not ( = ?auto_430234 ?auto_430235 ) ) ( not ( = ?auto_430234 ?auto_430236 ) ) ( not ( = ?auto_430234 ?auto_430237 ) ) ( not ( = ?auto_430234 ?auto_430238 ) ) ( not ( = ?auto_430235 ?auto_430236 ) ) ( not ( = ?auto_430235 ?auto_430237 ) ) ( not ( = ?auto_430235 ?auto_430238 ) ) ( not ( = ?auto_430236 ?auto_430237 ) ) ( not ( = ?auto_430236 ?auto_430238 ) ) ( not ( = ?auto_430237 ?auto_430238 ) ) ( ON ?auto_430236 ?auto_430237 ) ( ON ?auto_430235 ?auto_430236 ) ( CLEAR ?auto_430233 ) ( ON ?auto_430234 ?auto_430235 ) ( CLEAR ?auto_430234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430227 ?auto_430228 ?auto_430229 ?auto_430230 ?auto_430231 ?auto_430232 ?auto_430233 ?auto_430234 )
      ( MAKE-11PILE ?auto_430227 ?auto_430228 ?auto_430229 ?auto_430230 ?auto_430231 ?auto_430232 ?auto_430233 ?auto_430234 ?auto_430235 ?auto_430236 ?auto_430237 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430250 - BLOCK
      ?auto_430251 - BLOCK
      ?auto_430252 - BLOCK
      ?auto_430253 - BLOCK
      ?auto_430254 - BLOCK
      ?auto_430255 - BLOCK
      ?auto_430256 - BLOCK
      ?auto_430257 - BLOCK
      ?auto_430258 - BLOCK
      ?auto_430259 - BLOCK
      ?auto_430260 - BLOCK
    )
    :vars
    (
      ?auto_430261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430260 ?auto_430261 ) ( ON-TABLE ?auto_430250 ) ( ON ?auto_430251 ?auto_430250 ) ( ON ?auto_430252 ?auto_430251 ) ( ON ?auto_430253 ?auto_430252 ) ( ON ?auto_430254 ?auto_430253 ) ( ON ?auto_430255 ?auto_430254 ) ( ON ?auto_430256 ?auto_430255 ) ( not ( = ?auto_430250 ?auto_430251 ) ) ( not ( = ?auto_430250 ?auto_430252 ) ) ( not ( = ?auto_430250 ?auto_430253 ) ) ( not ( = ?auto_430250 ?auto_430254 ) ) ( not ( = ?auto_430250 ?auto_430255 ) ) ( not ( = ?auto_430250 ?auto_430256 ) ) ( not ( = ?auto_430250 ?auto_430257 ) ) ( not ( = ?auto_430250 ?auto_430258 ) ) ( not ( = ?auto_430250 ?auto_430259 ) ) ( not ( = ?auto_430250 ?auto_430260 ) ) ( not ( = ?auto_430250 ?auto_430261 ) ) ( not ( = ?auto_430251 ?auto_430252 ) ) ( not ( = ?auto_430251 ?auto_430253 ) ) ( not ( = ?auto_430251 ?auto_430254 ) ) ( not ( = ?auto_430251 ?auto_430255 ) ) ( not ( = ?auto_430251 ?auto_430256 ) ) ( not ( = ?auto_430251 ?auto_430257 ) ) ( not ( = ?auto_430251 ?auto_430258 ) ) ( not ( = ?auto_430251 ?auto_430259 ) ) ( not ( = ?auto_430251 ?auto_430260 ) ) ( not ( = ?auto_430251 ?auto_430261 ) ) ( not ( = ?auto_430252 ?auto_430253 ) ) ( not ( = ?auto_430252 ?auto_430254 ) ) ( not ( = ?auto_430252 ?auto_430255 ) ) ( not ( = ?auto_430252 ?auto_430256 ) ) ( not ( = ?auto_430252 ?auto_430257 ) ) ( not ( = ?auto_430252 ?auto_430258 ) ) ( not ( = ?auto_430252 ?auto_430259 ) ) ( not ( = ?auto_430252 ?auto_430260 ) ) ( not ( = ?auto_430252 ?auto_430261 ) ) ( not ( = ?auto_430253 ?auto_430254 ) ) ( not ( = ?auto_430253 ?auto_430255 ) ) ( not ( = ?auto_430253 ?auto_430256 ) ) ( not ( = ?auto_430253 ?auto_430257 ) ) ( not ( = ?auto_430253 ?auto_430258 ) ) ( not ( = ?auto_430253 ?auto_430259 ) ) ( not ( = ?auto_430253 ?auto_430260 ) ) ( not ( = ?auto_430253 ?auto_430261 ) ) ( not ( = ?auto_430254 ?auto_430255 ) ) ( not ( = ?auto_430254 ?auto_430256 ) ) ( not ( = ?auto_430254 ?auto_430257 ) ) ( not ( = ?auto_430254 ?auto_430258 ) ) ( not ( = ?auto_430254 ?auto_430259 ) ) ( not ( = ?auto_430254 ?auto_430260 ) ) ( not ( = ?auto_430254 ?auto_430261 ) ) ( not ( = ?auto_430255 ?auto_430256 ) ) ( not ( = ?auto_430255 ?auto_430257 ) ) ( not ( = ?auto_430255 ?auto_430258 ) ) ( not ( = ?auto_430255 ?auto_430259 ) ) ( not ( = ?auto_430255 ?auto_430260 ) ) ( not ( = ?auto_430255 ?auto_430261 ) ) ( not ( = ?auto_430256 ?auto_430257 ) ) ( not ( = ?auto_430256 ?auto_430258 ) ) ( not ( = ?auto_430256 ?auto_430259 ) ) ( not ( = ?auto_430256 ?auto_430260 ) ) ( not ( = ?auto_430256 ?auto_430261 ) ) ( not ( = ?auto_430257 ?auto_430258 ) ) ( not ( = ?auto_430257 ?auto_430259 ) ) ( not ( = ?auto_430257 ?auto_430260 ) ) ( not ( = ?auto_430257 ?auto_430261 ) ) ( not ( = ?auto_430258 ?auto_430259 ) ) ( not ( = ?auto_430258 ?auto_430260 ) ) ( not ( = ?auto_430258 ?auto_430261 ) ) ( not ( = ?auto_430259 ?auto_430260 ) ) ( not ( = ?auto_430259 ?auto_430261 ) ) ( not ( = ?auto_430260 ?auto_430261 ) ) ( ON ?auto_430259 ?auto_430260 ) ( ON ?auto_430258 ?auto_430259 ) ( CLEAR ?auto_430256 ) ( ON ?auto_430257 ?auto_430258 ) ( CLEAR ?auto_430257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430250 ?auto_430251 ?auto_430252 ?auto_430253 ?auto_430254 ?auto_430255 ?auto_430256 ?auto_430257 )
      ( MAKE-11PILE ?auto_430250 ?auto_430251 ?auto_430252 ?auto_430253 ?auto_430254 ?auto_430255 ?auto_430256 ?auto_430257 ?auto_430258 ?auto_430259 ?auto_430260 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430273 - BLOCK
      ?auto_430274 - BLOCK
      ?auto_430275 - BLOCK
      ?auto_430276 - BLOCK
      ?auto_430277 - BLOCK
      ?auto_430278 - BLOCK
      ?auto_430279 - BLOCK
      ?auto_430280 - BLOCK
      ?auto_430281 - BLOCK
      ?auto_430282 - BLOCK
      ?auto_430283 - BLOCK
    )
    :vars
    (
      ?auto_430284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430283 ?auto_430284 ) ( ON-TABLE ?auto_430273 ) ( ON ?auto_430274 ?auto_430273 ) ( ON ?auto_430275 ?auto_430274 ) ( ON ?auto_430276 ?auto_430275 ) ( ON ?auto_430277 ?auto_430276 ) ( ON ?auto_430278 ?auto_430277 ) ( not ( = ?auto_430273 ?auto_430274 ) ) ( not ( = ?auto_430273 ?auto_430275 ) ) ( not ( = ?auto_430273 ?auto_430276 ) ) ( not ( = ?auto_430273 ?auto_430277 ) ) ( not ( = ?auto_430273 ?auto_430278 ) ) ( not ( = ?auto_430273 ?auto_430279 ) ) ( not ( = ?auto_430273 ?auto_430280 ) ) ( not ( = ?auto_430273 ?auto_430281 ) ) ( not ( = ?auto_430273 ?auto_430282 ) ) ( not ( = ?auto_430273 ?auto_430283 ) ) ( not ( = ?auto_430273 ?auto_430284 ) ) ( not ( = ?auto_430274 ?auto_430275 ) ) ( not ( = ?auto_430274 ?auto_430276 ) ) ( not ( = ?auto_430274 ?auto_430277 ) ) ( not ( = ?auto_430274 ?auto_430278 ) ) ( not ( = ?auto_430274 ?auto_430279 ) ) ( not ( = ?auto_430274 ?auto_430280 ) ) ( not ( = ?auto_430274 ?auto_430281 ) ) ( not ( = ?auto_430274 ?auto_430282 ) ) ( not ( = ?auto_430274 ?auto_430283 ) ) ( not ( = ?auto_430274 ?auto_430284 ) ) ( not ( = ?auto_430275 ?auto_430276 ) ) ( not ( = ?auto_430275 ?auto_430277 ) ) ( not ( = ?auto_430275 ?auto_430278 ) ) ( not ( = ?auto_430275 ?auto_430279 ) ) ( not ( = ?auto_430275 ?auto_430280 ) ) ( not ( = ?auto_430275 ?auto_430281 ) ) ( not ( = ?auto_430275 ?auto_430282 ) ) ( not ( = ?auto_430275 ?auto_430283 ) ) ( not ( = ?auto_430275 ?auto_430284 ) ) ( not ( = ?auto_430276 ?auto_430277 ) ) ( not ( = ?auto_430276 ?auto_430278 ) ) ( not ( = ?auto_430276 ?auto_430279 ) ) ( not ( = ?auto_430276 ?auto_430280 ) ) ( not ( = ?auto_430276 ?auto_430281 ) ) ( not ( = ?auto_430276 ?auto_430282 ) ) ( not ( = ?auto_430276 ?auto_430283 ) ) ( not ( = ?auto_430276 ?auto_430284 ) ) ( not ( = ?auto_430277 ?auto_430278 ) ) ( not ( = ?auto_430277 ?auto_430279 ) ) ( not ( = ?auto_430277 ?auto_430280 ) ) ( not ( = ?auto_430277 ?auto_430281 ) ) ( not ( = ?auto_430277 ?auto_430282 ) ) ( not ( = ?auto_430277 ?auto_430283 ) ) ( not ( = ?auto_430277 ?auto_430284 ) ) ( not ( = ?auto_430278 ?auto_430279 ) ) ( not ( = ?auto_430278 ?auto_430280 ) ) ( not ( = ?auto_430278 ?auto_430281 ) ) ( not ( = ?auto_430278 ?auto_430282 ) ) ( not ( = ?auto_430278 ?auto_430283 ) ) ( not ( = ?auto_430278 ?auto_430284 ) ) ( not ( = ?auto_430279 ?auto_430280 ) ) ( not ( = ?auto_430279 ?auto_430281 ) ) ( not ( = ?auto_430279 ?auto_430282 ) ) ( not ( = ?auto_430279 ?auto_430283 ) ) ( not ( = ?auto_430279 ?auto_430284 ) ) ( not ( = ?auto_430280 ?auto_430281 ) ) ( not ( = ?auto_430280 ?auto_430282 ) ) ( not ( = ?auto_430280 ?auto_430283 ) ) ( not ( = ?auto_430280 ?auto_430284 ) ) ( not ( = ?auto_430281 ?auto_430282 ) ) ( not ( = ?auto_430281 ?auto_430283 ) ) ( not ( = ?auto_430281 ?auto_430284 ) ) ( not ( = ?auto_430282 ?auto_430283 ) ) ( not ( = ?auto_430282 ?auto_430284 ) ) ( not ( = ?auto_430283 ?auto_430284 ) ) ( ON ?auto_430282 ?auto_430283 ) ( ON ?auto_430281 ?auto_430282 ) ( ON ?auto_430280 ?auto_430281 ) ( CLEAR ?auto_430278 ) ( ON ?auto_430279 ?auto_430280 ) ( CLEAR ?auto_430279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430273 ?auto_430274 ?auto_430275 ?auto_430276 ?auto_430277 ?auto_430278 ?auto_430279 )
      ( MAKE-11PILE ?auto_430273 ?auto_430274 ?auto_430275 ?auto_430276 ?auto_430277 ?auto_430278 ?auto_430279 ?auto_430280 ?auto_430281 ?auto_430282 ?auto_430283 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430296 - BLOCK
      ?auto_430297 - BLOCK
      ?auto_430298 - BLOCK
      ?auto_430299 - BLOCK
      ?auto_430300 - BLOCK
      ?auto_430301 - BLOCK
      ?auto_430302 - BLOCK
      ?auto_430303 - BLOCK
      ?auto_430304 - BLOCK
      ?auto_430305 - BLOCK
      ?auto_430306 - BLOCK
    )
    :vars
    (
      ?auto_430307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430306 ?auto_430307 ) ( ON-TABLE ?auto_430296 ) ( ON ?auto_430297 ?auto_430296 ) ( ON ?auto_430298 ?auto_430297 ) ( ON ?auto_430299 ?auto_430298 ) ( ON ?auto_430300 ?auto_430299 ) ( ON ?auto_430301 ?auto_430300 ) ( not ( = ?auto_430296 ?auto_430297 ) ) ( not ( = ?auto_430296 ?auto_430298 ) ) ( not ( = ?auto_430296 ?auto_430299 ) ) ( not ( = ?auto_430296 ?auto_430300 ) ) ( not ( = ?auto_430296 ?auto_430301 ) ) ( not ( = ?auto_430296 ?auto_430302 ) ) ( not ( = ?auto_430296 ?auto_430303 ) ) ( not ( = ?auto_430296 ?auto_430304 ) ) ( not ( = ?auto_430296 ?auto_430305 ) ) ( not ( = ?auto_430296 ?auto_430306 ) ) ( not ( = ?auto_430296 ?auto_430307 ) ) ( not ( = ?auto_430297 ?auto_430298 ) ) ( not ( = ?auto_430297 ?auto_430299 ) ) ( not ( = ?auto_430297 ?auto_430300 ) ) ( not ( = ?auto_430297 ?auto_430301 ) ) ( not ( = ?auto_430297 ?auto_430302 ) ) ( not ( = ?auto_430297 ?auto_430303 ) ) ( not ( = ?auto_430297 ?auto_430304 ) ) ( not ( = ?auto_430297 ?auto_430305 ) ) ( not ( = ?auto_430297 ?auto_430306 ) ) ( not ( = ?auto_430297 ?auto_430307 ) ) ( not ( = ?auto_430298 ?auto_430299 ) ) ( not ( = ?auto_430298 ?auto_430300 ) ) ( not ( = ?auto_430298 ?auto_430301 ) ) ( not ( = ?auto_430298 ?auto_430302 ) ) ( not ( = ?auto_430298 ?auto_430303 ) ) ( not ( = ?auto_430298 ?auto_430304 ) ) ( not ( = ?auto_430298 ?auto_430305 ) ) ( not ( = ?auto_430298 ?auto_430306 ) ) ( not ( = ?auto_430298 ?auto_430307 ) ) ( not ( = ?auto_430299 ?auto_430300 ) ) ( not ( = ?auto_430299 ?auto_430301 ) ) ( not ( = ?auto_430299 ?auto_430302 ) ) ( not ( = ?auto_430299 ?auto_430303 ) ) ( not ( = ?auto_430299 ?auto_430304 ) ) ( not ( = ?auto_430299 ?auto_430305 ) ) ( not ( = ?auto_430299 ?auto_430306 ) ) ( not ( = ?auto_430299 ?auto_430307 ) ) ( not ( = ?auto_430300 ?auto_430301 ) ) ( not ( = ?auto_430300 ?auto_430302 ) ) ( not ( = ?auto_430300 ?auto_430303 ) ) ( not ( = ?auto_430300 ?auto_430304 ) ) ( not ( = ?auto_430300 ?auto_430305 ) ) ( not ( = ?auto_430300 ?auto_430306 ) ) ( not ( = ?auto_430300 ?auto_430307 ) ) ( not ( = ?auto_430301 ?auto_430302 ) ) ( not ( = ?auto_430301 ?auto_430303 ) ) ( not ( = ?auto_430301 ?auto_430304 ) ) ( not ( = ?auto_430301 ?auto_430305 ) ) ( not ( = ?auto_430301 ?auto_430306 ) ) ( not ( = ?auto_430301 ?auto_430307 ) ) ( not ( = ?auto_430302 ?auto_430303 ) ) ( not ( = ?auto_430302 ?auto_430304 ) ) ( not ( = ?auto_430302 ?auto_430305 ) ) ( not ( = ?auto_430302 ?auto_430306 ) ) ( not ( = ?auto_430302 ?auto_430307 ) ) ( not ( = ?auto_430303 ?auto_430304 ) ) ( not ( = ?auto_430303 ?auto_430305 ) ) ( not ( = ?auto_430303 ?auto_430306 ) ) ( not ( = ?auto_430303 ?auto_430307 ) ) ( not ( = ?auto_430304 ?auto_430305 ) ) ( not ( = ?auto_430304 ?auto_430306 ) ) ( not ( = ?auto_430304 ?auto_430307 ) ) ( not ( = ?auto_430305 ?auto_430306 ) ) ( not ( = ?auto_430305 ?auto_430307 ) ) ( not ( = ?auto_430306 ?auto_430307 ) ) ( ON ?auto_430305 ?auto_430306 ) ( ON ?auto_430304 ?auto_430305 ) ( ON ?auto_430303 ?auto_430304 ) ( CLEAR ?auto_430301 ) ( ON ?auto_430302 ?auto_430303 ) ( CLEAR ?auto_430302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430296 ?auto_430297 ?auto_430298 ?auto_430299 ?auto_430300 ?auto_430301 ?auto_430302 )
      ( MAKE-11PILE ?auto_430296 ?auto_430297 ?auto_430298 ?auto_430299 ?auto_430300 ?auto_430301 ?auto_430302 ?auto_430303 ?auto_430304 ?auto_430305 ?auto_430306 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430319 - BLOCK
      ?auto_430320 - BLOCK
      ?auto_430321 - BLOCK
      ?auto_430322 - BLOCK
      ?auto_430323 - BLOCK
      ?auto_430324 - BLOCK
      ?auto_430325 - BLOCK
      ?auto_430326 - BLOCK
      ?auto_430327 - BLOCK
      ?auto_430328 - BLOCK
      ?auto_430329 - BLOCK
    )
    :vars
    (
      ?auto_430330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430329 ?auto_430330 ) ( ON-TABLE ?auto_430319 ) ( ON ?auto_430320 ?auto_430319 ) ( ON ?auto_430321 ?auto_430320 ) ( ON ?auto_430322 ?auto_430321 ) ( ON ?auto_430323 ?auto_430322 ) ( not ( = ?auto_430319 ?auto_430320 ) ) ( not ( = ?auto_430319 ?auto_430321 ) ) ( not ( = ?auto_430319 ?auto_430322 ) ) ( not ( = ?auto_430319 ?auto_430323 ) ) ( not ( = ?auto_430319 ?auto_430324 ) ) ( not ( = ?auto_430319 ?auto_430325 ) ) ( not ( = ?auto_430319 ?auto_430326 ) ) ( not ( = ?auto_430319 ?auto_430327 ) ) ( not ( = ?auto_430319 ?auto_430328 ) ) ( not ( = ?auto_430319 ?auto_430329 ) ) ( not ( = ?auto_430319 ?auto_430330 ) ) ( not ( = ?auto_430320 ?auto_430321 ) ) ( not ( = ?auto_430320 ?auto_430322 ) ) ( not ( = ?auto_430320 ?auto_430323 ) ) ( not ( = ?auto_430320 ?auto_430324 ) ) ( not ( = ?auto_430320 ?auto_430325 ) ) ( not ( = ?auto_430320 ?auto_430326 ) ) ( not ( = ?auto_430320 ?auto_430327 ) ) ( not ( = ?auto_430320 ?auto_430328 ) ) ( not ( = ?auto_430320 ?auto_430329 ) ) ( not ( = ?auto_430320 ?auto_430330 ) ) ( not ( = ?auto_430321 ?auto_430322 ) ) ( not ( = ?auto_430321 ?auto_430323 ) ) ( not ( = ?auto_430321 ?auto_430324 ) ) ( not ( = ?auto_430321 ?auto_430325 ) ) ( not ( = ?auto_430321 ?auto_430326 ) ) ( not ( = ?auto_430321 ?auto_430327 ) ) ( not ( = ?auto_430321 ?auto_430328 ) ) ( not ( = ?auto_430321 ?auto_430329 ) ) ( not ( = ?auto_430321 ?auto_430330 ) ) ( not ( = ?auto_430322 ?auto_430323 ) ) ( not ( = ?auto_430322 ?auto_430324 ) ) ( not ( = ?auto_430322 ?auto_430325 ) ) ( not ( = ?auto_430322 ?auto_430326 ) ) ( not ( = ?auto_430322 ?auto_430327 ) ) ( not ( = ?auto_430322 ?auto_430328 ) ) ( not ( = ?auto_430322 ?auto_430329 ) ) ( not ( = ?auto_430322 ?auto_430330 ) ) ( not ( = ?auto_430323 ?auto_430324 ) ) ( not ( = ?auto_430323 ?auto_430325 ) ) ( not ( = ?auto_430323 ?auto_430326 ) ) ( not ( = ?auto_430323 ?auto_430327 ) ) ( not ( = ?auto_430323 ?auto_430328 ) ) ( not ( = ?auto_430323 ?auto_430329 ) ) ( not ( = ?auto_430323 ?auto_430330 ) ) ( not ( = ?auto_430324 ?auto_430325 ) ) ( not ( = ?auto_430324 ?auto_430326 ) ) ( not ( = ?auto_430324 ?auto_430327 ) ) ( not ( = ?auto_430324 ?auto_430328 ) ) ( not ( = ?auto_430324 ?auto_430329 ) ) ( not ( = ?auto_430324 ?auto_430330 ) ) ( not ( = ?auto_430325 ?auto_430326 ) ) ( not ( = ?auto_430325 ?auto_430327 ) ) ( not ( = ?auto_430325 ?auto_430328 ) ) ( not ( = ?auto_430325 ?auto_430329 ) ) ( not ( = ?auto_430325 ?auto_430330 ) ) ( not ( = ?auto_430326 ?auto_430327 ) ) ( not ( = ?auto_430326 ?auto_430328 ) ) ( not ( = ?auto_430326 ?auto_430329 ) ) ( not ( = ?auto_430326 ?auto_430330 ) ) ( not ( = ?auto_430327 ?auto_430328 ) ) ( not ( = ?auto_430327 ?auto_430329 ) ) ( not ( = ?auto_430327 ?auto_430330 ) ) ( not ( = ?auto_430328 ?auto_430329 ) ) ( not ( = ?auto_430328 ?auto_430330 ) ) ( not ( = ?auto_430329 ?auto_430330 ) ) ( ON ?auto_430328 ?auto_430329 ) ( ON ?auto_430327 ?auto_430328 ) ( ON ?auto_430326 ?auto_430327 ) ( ON ?auto_430325 ?auto_430326 ) ( CLEAR ?auto_430323 ) ( ON ?auto_430324 ?auto_430325 ) ( CLEAR ?auto_430324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430319 ?auto_430320 ?auto_430321 ?auto_430322 ?auto_430323 ?auto_430324 )
      ( MAKE-11PILE ?auto_430319 ?auto_430320 ?auto_430321 ?auto_430322 ?auto_430323 ?auto_430324 ?auto_430325 ?auto_430326 ?auto_430327 ?auto_430328 ?auto_430329 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430342 - BLOCK
      ?auto_430343 - BLOCK
      ?auto_430344 - BLOCK
      ?auto_430345 - BLOCK
      ?auto_430346 - BLOCK
      ?auto_430347 - BLOCK
      ?auto_430348 - BLOCK
      ?auto_430349 - BLOCK
      ?auto_430350 - BLOCK
      ?auto_430351 - BLOCK
      ?auto_430352 - BLOCK
    )
    :vars
    (
      ?auto_430353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430352 ?auto_430353 ) ( ON-TABLE ?auto_430342 ) ( ON ?auto_430343 ?auto_430342 ) ( ON ?auto_430344 ?auto_430343 ) ( ON ?auto_430345 ?auto_430344 ) ( ON ?auto_430346 ?auto_430345 ) ( not ( = ?auto_430342 ?auto_430343 ) ) ( not ( = ?auto_430342 ?auto_430344 ) ) ( not ( = ?auto_430342 ?auto_430345 ) ) ( not ( = ?auto_430342 ?auto_430346 ) ) ( not ( = ?auto_430342 ?auto_430347 ) ) ( not ( = ?auto_430342 ?auto_430348 ) ) ( not ( = ?auto_430342 ?auto_430349 ) ) ( not ( = ?auto_430342 ?auto_430350 ) ) ( not ( = ?auto_430342 ?auto_430351 ) ) ( not ( = ?auto_430342 ?auto_430352 ) ) ( not ( = ?auto_430342 ?auto_430353 ) ) ( not ( = ?auto_430343 ?auto_430344 ) ) ( not ( = ?auto_430343 ?auto_430345 ) ) ( not ( = ?auto_430343 ?auto_430346 ) ) ( not ( = ?auto_430343 ?auto_430347 ) ) ( not ( = ?auto_430343 ?auto_430348 ) ) ( not ( = ?auto_430343 ?auto_430349 ) ) ( not ( = ?auto_430343 ?auto_430350 ) ) ( not ( = ?auto_430343 ?auto_430351 ) ) ( not ( = ?auto_430343 ?auto_430352 ) ) ( not ( = ?auto_430343 ?auto_430353 ) ) ( not ( = ?auto_430344 ?auto_430345 ) ) ( not ( = ?auto_430344 ?auto_430346 ) ) ( not ( = ?auto_430344 ?auto_430347 ) ) ( not ( = ?auto_430344 ?auto_430348 ) ) ( not ( = ?auto_430344 ?auto_430349 ) ) ( not ( = ?auto_430344 ?auto_430350 ) ) ( not ( = ?auto_430344 ?auto_430351 ) ) ( not ( = ?auto_430344 ?auto_430352 ) ) ( not ( = ?auto_430344 ?auto_430353 ) ) ( not ( = ?auto_430345 ?auto_430346 ) ) ( not ( = ?auto_430345 ?auto_430347 ) ) ( not ( = ?auto_430345 ?auto_430348 ) ) ( not ( = ?auto_430345 ?auto_430349 ) ) ( not ( = ?auto_430345 ?auto_430350 ) ) ( not ( = ?auto_430345 ?auto_430351 ) ) ( not ( = ?auto_430345 ?auto_430352 ) ) ( not ( = ?auto_430345 ?auto_430353 ) ) ( not ( = ?auto_430346 ?auto_430347 ) ) ( not ( = ?auto_430346 ?auto_430348 ) ) ( not ( = ?auto_430346 ?auto_430349 ) ) ( not ( = ?auto_430346 ?auto_430350 ) ) ( not ( = ?auto_430346 ?auto_430351 ) ) ( not ( = ?auto_430346 ?auto_430352 ) ) ( not ( = ?auto_430346 ?auto_430353 ) ) ( not ( = ?auto_430347 ?auto_430348 ) ) ( not ( = ?auto_430347 ?auto_430349 ) ) ( not ( = ?auto_430347 ?auto_430350 ) ) ( not ( = ?auto_430347 ?auto_430351 ) ) ( not ( = ?auto_430347 ?auto_430352 ) ) ( not ( = ?auto_430347 ?auto_430353 ) ) ( not ( = ?auto_430348 ?auto_430349 ) ) ( not ( = ?auto_430348 ?auto_430350 ) ) ( not ( = ?auto_430348 ?auto_430351 ) ) ( not ( = ?auto_430348 ?auto_430352 ) ) ( not ( = ?auto_430348 ?auto_430353 ) ) ( not ( = ?auto_430349 ?auto_430350 ) ) ( not ( = ?auto_430349 ?auto_430351 ) ) ( not ( = ?auto_430349 ?auto_430352 ) ) ( not ( = ?auto_430349 ?auto_430353 ) ) ( not ( = ?auto_430350 ?auto_430351 ) ) ( not ( = ?auto_430350 ?auto_430352 ) ) ( not ( = ?auto_430350 ?auto_430353 ) ) ( not ( = ?auto_430351 ?auto_430352 ) ) ( not ( = ?auto_430351 ?auto_430353 ) ) ( not ( = ?auto_430352 ?auto_430353 ) ) ( ON ?auto_430351 ?auto_430352 ) ( ON ?auto_430350 ?auto_430351 ) ( ON ?auto_430349 ?auto_430350 ) ( ON ?auto_430348 ?auto_430349 ) ( CLEAR ?auto_430346 ) ( ON ?auto_430347 ?auto_430348 ) ( CLEAR ?auto_430347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430342 ?auto_430343 ?auto_430344 ?auto_430345 ?auto_430346 ?auto_430347 )
      ( MAKE-11PILE ?auto_430342 ?auto_430343 ?auto_430344 ?auto_430345 ?auto_430346 ?auto_430347 ?auto_430348 ?auto_430349 ?auto_430350 ?auto_430351 ?auto_430352 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430365 - BLOCK
      ?auto_430366 - BLOCK
      ?auto_430367 - BLOCK
      ?auto_430368 - BLOCK
      ?auto_430369 - BLOCK
      ?auto_430370 - BLOCK
      ?auto_430371 - BLOCK
      ?auto_430372 - BLOCK
      ?auto_430373 - BLOCK
      ?auto_430374 - BLOCK
      ?auto_430375 - BLOCK
    )
    :vars
    (
      ?auto_430376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430375 ?auto_430376 ) ( ON-TABLE ?auto_430365 ) ( ON ?auto_430366 ?auto_430365 ) ( ON ?auto_430367 ?auto_430366 ) ( ON ?auto_430368 ?auto_430367 ) ( not ( = ?auto_430365 ?auto_430366 ) ) ( not ( = ?auto_430365 ?auto_430367 ) ) ( not ( = ?auto_430365 ?auto_430368 ) ) ( not ( = ?auto_430365 ?auto_430369 ) ) ( not ( = ?auto_430365 ?auto_430370 ) ) ( not ( = ?auto_430365 ?auto_430371 ) ) ( not ( = ?auto_430365 ?auto_430372 ) ) ( not ( = ?auto_430365 ?auto_430373 ) ) ( not ( = ?auto_430365 ?auto_430374 ) ) ( not ( = ?auto_430365 ?auto_430375 ) ) ( not ( = ?auto_430365 ?auto_430376 ) ) ( not ( = ?auto_430366 ?auto_430367 ) ) ( not ( = ?auto_430366 ?auto_430368 ) ) ( not ( = ?auto_430366 ?auto_430369 ) ) ( not ( = ?auto_430366 ?auto_430370 ) ) ( not ( = ?auto_430366 ?auto_430371 ) ) ( not ( = ?auto_430366 ?auto_430372 ) ) ( not ( = ?auto_430366 ?auto_430373 ) ) ( not ( = ?auto_430366 ?auto_430374 ) ) ( not ( = ?auto_430366 ?auto_430375 ) ) ( not ( = ?auto_430366 ?auto_430376 ) ) ( not ( = ?auto_430367 ?auto_430368 ) ) ( not ( = ?auto_430367 ?auto_430369 ) ) ( not ( = ?auto_430367 ?auto_430370 ) ) ( not ( = ?auto_430367 ?auto_430371 ) ) ( not ( = ?auto_430367 ?auto_430372 ) ) ( not ( = ?auto_430367 ?auto_430373 ) ) ( not ( = ?auto_430367 ?auto_430374 ) ) ( not ( = ?auto_430367 ?auto_430375 ) ) ( not ( = ?auto_430367 ?auto_430376 ) ) ( not ( = ?auto_430368 ?auto_430369 ) ) ( not ( = ?auto_430368 ?auto_430370 ) ) ( not ( = ?auto_430368 ?auto_430371 ) ) ( not ( = ?auto_430368 ?auto_430372 ) ) ( not ( = ?auto_430368 ?auto_430373 ) ) ( not ( = ?auto_430368 ?auto_430374 ) ) ( not ( = ?auto_430368 ?auto_430375 ) ) ( not ( = ?auto_430368 ?auto_430376 ) ) ( not ( = ?auto_430369 ?auto_430370 ) ) ( not ( = ?auto_430369 ?auto_430371 ) ) ( not ( = ?auto_430369 ?auto_430372 ) ) ( not ( = ?auto_430369 ?auto_430373 ) ) ( not ( = ?auto_430369 ?auto_430374 ) ) ( not ( = ?auto_430369 ?auto_430375 ) ) ( not ( = ?auto_430369 ?auto_430376 ) ) ( not ( = ?auto_430370 ?auto_430371 ) ) ( not ( = ?auto_430370 ?auto_430372 ) ) ( not ( = ?auto_430370 ?auto_430373 ) ) ( not ( = ?auto_430370 ?auto_430374 ) ) ( not ( = ?auto_430370 ?auto_430375 ) ) ( not ( = ?auto_430370 ?auto_430376 ) ) ( not ( = ?auto_430371 ?auto_430372 ) ) ( not ( = ?auto_430371 ?auto_430373 ) ) ( not ( = ?auto_430371 ?auto_430374 ) ) ( not ( = ?auto_430371 ?auto_430375 ) ) ( not ( = ?auto_430371 ?auto_430376 ) ) ( not ( = ?auto_430372 ?auto_430373 ) ) ( not ( = ?auto_430372 ?auto_430374 ) ) ( not ( = ?auto_430372 ?auto_430375 ) ) ( not ( = ?auto_430372 ?auto_430376 ) ) ( not ( = ?auto_430373 ?auto_430374 ) ) ( not ( = ?auto_430373 ?auto_430375 ) ) ( not ( = ?auto_430373 ?auto_430376 ) ) ( not ( = ?auto_430374 ?auto_430375 ) ) ( not ( = ?auto_430374 ?auto_430376 ) ) ( not ( = ?auto_430375 ?auto_430376 ) ) ( ON ?auto_430374 ?auto_430375 ) ( ON ?auto_430373 ?auto_430374 ) ( ON ?auto_430372 ?auto_430373 ) ( ON ?auto_430371 ?auto_430372 ) ( ON ?auto_430370 ?auto_430371 ) ( CLEAR ?auto_430368 ) ( ON ?auto_430369 ?auto_430370 ) ( CLEAR ?auto_430369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430365 ?auto_430366 ?auto_430367 ?auto_430368 ?auto_430369 )
      ( MAKE-11PILE ?auto_430365 ?auto_430366 ?auto_430367 ?auto_430368 ?auto_430369 ?auto_430370 ?auto_430371 ?auto_430372 ?auto_430373 ?auto_430374 ?auto_430375 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430388 - BLOCK
      ?auto_430389 - BLOCK
      ?auto_430390 - BLOCK
      ?auto_430391 - BLOCK
      ?auto_430392 - BLOCK
      ?auto_430393 - BLOCK
      ?auto_430394 - BLOCK
      ?auto_430395 - BLOCK
      ?auto_430396 - BLOCK
      ?auto_430397 - BLOCK
      ?auto_430398 - BLOCK
    )
    :vars
    (
      ?auto_430399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430398 ?auto_430399 ) ( ON-TABLE ?auto_430388 ) ( ON ?auto_430389 ?auto_430388 ) ( ON ?auto_430390 ?auto_430389 ) ( ON ?auto_430391 ?auto_430390 ) ( not ( = ?auto_430388 ?auto_430389 ) ) ( not ( = ?auto_430388 ?auto_430390 ) ) ( not ( = ?auto_430388 ?auto_430391 ) ) ( not ( = ?auto_430388 ?auto_430392 ) ) ( not ( = ?auto_430388 ?auto_430393 ) ) ( not ( = ?auto_430388 ?auto_430394 ) ) ( not ( = ?auto_430388 ?auto_430395 ) ) ( not ( = ?auto_430388 ?auto_430396 ) ) ( not ( = ?auto_430388 ?auto_430397 ) ) ( not ( = ?auto_430388 ?auto_430398 ) ) ( not ( = ?auto_430388 ?auto_430399 ) ) ( not ( = ?auto_430389 ?auto_430390 ) ) ( not ( = ?auto_430389 ?auto_430391 ) ) ( not ( = ?auto_430389 ?auto_430392 ) ) ( not ( = ?auto_430389 ?auto_430393 ) ) ( not ( = ?auto_430389 ?auto_430394 ) ) ( not ( = ?auto_430389 ?auto_430395 ) ) ( not ( = ?auto_430389 ?auto_430396 ) ) ( not ( = ?auto_430389 ?auto_430397 ) ) ( not ( = ?auto_430389 ?auto_430398 ) ) ( not ( = ?auto_430389 ?auto_430399 ) ) ( not ( = ?auto_430390 ?auto_430391 ) ) ( not ( = ?auto_430390 ?auto_430392 ) ) ( not ( = ?auto_430390 ?auto_430393 ) ) ( not ( = ?auto_430390 ?auto_430394 ) ) ( not ( = ?auto_430390 ?auto_430395 ) ) ( not ( = ?auto_430390 ?auto_430396 ) ) ( not ( = ?auto_430390 ?auto_430397 ) ) ( not ( = ?auto_430390 ?auto_430398 ) ) ( not ( = ?auto_430390 ?auto_430399 ) ) ( not ( = ?auto_430391 ?auto_430392 ) ) ( not ( = ?auto_430391 ?auto_430393 ) ) ( not ( = ?auto_430391 ?auto_430394 ) ) ( not ( = ?auto_430391 ?auto_430395 ) ) ( not ( = ?auto_430391 ?auto_430396 ) ) ( not ( = ?auto_430391 ?auto_430397 ) ) ( not ( = ?auto_430391 ?auto_430398 ) ) ( not ( = ?auto_430391 ?auto_430399 ) ) ( not ( = ?auto_430392 ?auto_430393 ) ) ( not ( = ?auto_430392 ?auto_430394 ) ) ( not ( = ?auto_430392 ?auto_430395 ) ) ( not ( = ?auto_430392 ?auto_430396 ) ) ( not ( = ?auto_430392 ?auto_430397 ) ) ( not ( = ?auto_430392 ?auto_430398 ) ) ( not ( = ?auto_430392 ?auto_430399 ) ) ( not ( = ?auto_430393 ?auto_430394 ) ) ( not ( = ?auto_430393 ?auto_430395 ) ) ( not ( = ?auto_430393 ?auto_430396 ) ) ( not ( = ?auto_430393 ?auto_430397 ) ) ( not ( = ?auto_430393 ?auto_430398 ) ) ( not ( = ?auto_430393 ?auto_430399 ) ) ( not ( = ?auto_430394 ?auto_430395 ) ) ( not ( = ?auto_430394 ?auto_430396 ) ) ( not ( = ?auto_430394 ?auto_430397 ) ) ( not ( = ?auto_430394 ?auto_430398 ) ) ( not ( = ?auto_430394 ?auto_430399 ) ) ( not ( = ?auto_430395 ?auto_430396 ) ) ( not ( = ?auto_430395 ?auto_430397 ) ) ( not ( = ?auto_430395 ?auto_430398 ) ) ( not ( = ?auto_430395 ?auto_430399 ) ) ( not ( = ?auto_430396 ?auto_430397 ) ) ( not ( = ?auto_430396 ?auto_430398 ) ) ( not ( = ?auto_430396 ?auto_430399 ) ) ( not ( = ?auto_430397 ?auto_430398 ) ) ( not ( = ?auto_430397 ?auto_430399 ) ) ( not ( = ?auto_430398 ?auto_430399 ) ) ( ON ?auto_430397 ?auto_430398 ) ( ON ?auto_430396 ?auto_430397 ) ( ON ?auto_430395 ?auto_430396 ) ( ON ?auto_430394 ?auto_430395 ) ( ON ?auto_430393 ?auto_430394 ) ( CLEAR ?auto_430391 ) ( ON ?auto_430392 ?auto_430393 ) ( CLEAR ?auto_430392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430388 ?auto_430389 ?auto_430390 ?auto_430391 ?auto_430392 )
      ( MAKE-11PILE ?auto_430388 ?auto_430389 ?auto_430390 ?auto_430391 ?auto_430392 ?auto_430393 ?auto_430394 ?auto_430395 ?auto_430396 ?auto_430397 ?auto_430398 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430411 - BLOCK
      ?auto_430412 - BLOCK
      ?auto_430413 - BLOCK
      ?auto_430414 - BLOCK
      ?auto_430415 - BLOCK
      ?auto_430416 - BLOCK
      ?auto_430417 - BLOCK
      ?auto_430418 - BLOCK
      ?auto_430419 - BLOCK
      ?auto_430420 - BLOCK
      ?auto_430421 - BLOCK
    )
    :vars
    (
      ?auto_430422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430421 ?auto_430422 ) ( ON-TABLE ?auto_430411 ) ( ON ?auto_430412 ?auto_430411 ) ( ON ?auto_430413 ?auto_430412 ) ( not ( = ?auto_430411 ?auto_430412 ) ) ( not ( = ?auto_430411 ?auto_430413 ) ) ( not ( = ?auto_430411 ?auto_430414 ) ) ( not ( = ?auto_430411 ?auto_430415 ) ) ( not ( = ?auto_430411 ?auto_430416 ) ) ( not ( = ?auto_430411 ?auto_430417 ) ) ( not ( = ?auto_430411 ?auto_430418 ) ) ( not ( = ?auto_430411 ?auto_430419 ) ) ( not ( = ?auto_430411 ?auto_430420 ) ) ( not ( = ?auto_430411 ?auto_430421 ) ) ( not ( = ?auto_430411 ?auto_430422 ) ) ( not ( = ?auto_430412 ?auto_430413 ) ) ( not ( = ?auto_430412 ?auto_430414 ) ) ( not ( = ?auto_430412 ?auto_430415 ) ) ( not ( = ?auto_430412 ?auto_430416 ) ) ( not ( = ?auto_430412 ?auto_430417 ) ) ( not ( = ?auto_430412 ?auto_430418 ) ) ( not ( = ?auto_430412 ?auto_430419 ) ) ( not ( = ?auto_430412 ?auto_430420 ) ) ( not ( = ?auto_430412 ?auto_430421 ) ) ( not ( = ?auto_430412 ?auto_430422 ) ) ( not ( = ?auto_430413 ?auto_430414 ) ) ( not ( = ?auto_430413 ?auto_430415 ) ) ( not ( = ?auto_430413 ?auto_430416 ) ) ( not ( = ?auto_430413 ?auto_430417 ) ) ( not ( = ?auto_430413 ?auto_430418 ) ) ( not ( = ?auto_430413 ?auto_430419 ) ) ( not ( = ?auto_430413 ?auto_430420 ) ) ( not ( = ?auto_430413 ?auto_430421 ) ) ( not ( = ?auto_430413 ?auto_430422 ) ) ( not ( = ?auto_430414 ?auto_430415 ) ) ( not ( = ?auto_430414 ?auto_430416 ) ) ( not ( = ?auto_430414 ?auto_430417 ) ) ( not ( = ?auto_430414 ?auto_430418 ) ) ( not ( = ?auto_430414 ?auto_430419 ) ) ( not ( = ?auto_430414 ?auto_430420 ) ) ( not ( = ?auto_430414 ?auto_430421 ) ) ( not ( = ?auto_430414 ?auto_430422 ) ) ( not ( = ?auto_430415 ?auto_430416 ) ) ( not ( = ?auto_430415 ?auto_430417 ) ) ( not ( = ?auto_430415 ?auto_430418 ) ) ( not ( = ?auto_430415 ?auto_430419 ) ) ( not ( = ?auto_430415 ?auto_430420 ) ) ( not ( = ?auto_430415 ?auto_430421 ) ) ( not ( = ?auto_430415 ?auto_430422 ) ) ( not ( = ?auto_430416 ?auto_430417 ) ) ( not ( = ?auto_430416 ?auto_430418 ) ) ( not ( = ?auto_430416 ?auto_430419 ) ) ( not ( = ?auto_430416 ?auto_430420 ) ) ( not ( = ?auto_430416 ?auto_430421 ) ) ( not ( = ?auto_430416 ?auto_430422 ) ) ( not ( = ?auto_430417 ?auto_430418 ) ) ( not ( = ?auto_430417 ?auto_430419 ) ) ( not ( = ?auto_430417 ?auto_430420 ) ) ( not ( = ?auto_430417 ?auto_430421 ) ) ( not ( = ?auto_430417 ?auto_430422 ) ) ( not ( = ?auto_430418 ?auto_430419 ) ) ( not ( = ?auto_430418 ?auto_430420 ) ) ( not ( = ?auto_430418 ?auto_430421 ) ) ( not ( = ?auto_430418 ?auto_430422 ) ) ( not ( = ?auto_430419 ?auto_430420 ) ) ( not ( = ?auto_430419 ?auto_430421 ) ) ( not ( = ?auto_430419 ?auto_430422 ) ) ( not ( = ?auto_430420 ?auto_430421 ) ) ( not ( = ?auto_430420 ?auto_430422 ) ) ( not ( = ?auto_430421 ?auto_430422 ) ) ( ON ?auto_430420 ?auto_430421 ) ( ON ?auto_430419 ?auto_430420 ) ( ON ?auto_430418 ?auto_430419 ) ( ON ?auto_430417 ?auto_430418 ) ( ON ?auto_430416 ?auto_430417 ) ( ON ?auto_430415 ?auto_430416 ) ( CLEAR ?auto_430413 ) ( ON ?auto_430414 ?auto_430415 ) ( CLEAR ?auto_430414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_430411 ?auto_430412 ?auto_430413 ?auto_430414 )
      ( MAKE-11PILE ?auto_430411 ?auto_430412 ?auto_430413 ?auto_430414 ?auto_430415 ?auto_430416 ?auto_430417 ?auto_430418 ?auto_430419 ?auto_430420 ?auto_430421 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430434 - BLOCK
      ?auto_430435 - BLOCK
      ?auto_430436 - BLOCK
      ?auto_430437 - BLOCK
      ?auto_430438 - BLOCK
      ?auto_430439 - BLOCK
      ?auto_430440 - BLOCK
      ?auto_430441 - BLOCK
      ?auto_430442 - BLOCK
      ?auto_430443 - BLOCK
      ?auto_430444 - BLOCK
    )
    :vars
    (
      ?auto_430445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430444 ?auto_430445 ) ( ON-TABLE ?auto_430434 ) ( ON ?auto_430435 ?auto_430434 ) ( ON ?auto_430436 ?auto_430435 ) ( not ( = ?auto_430434 ?auto_430435 ) ) ( not ( = ?auto_430434 ?auto_430436 ) ) ( not ( = ?auto_430434 ?auto_430437 ) ) ( not ( = ?auto_430434 ?auto_430438 ) ) ( not ( = ?auto_430434 ?auto_430439 ) ) ( not ( = ?auto_430434 ?auto_430440 ) ) ( not ( = ?auto_430434 ?auto_430441 ) ) ( not ( = ?auto_430434 ?auto_430442 ) ) ( not ( = ?auto_430434 ?auto_430443 ) ) ( not ( = ?auto_430434 ?auto_430444 ) ) ( not ( = ?auto_430434 ?auto_430445 ) ) ( not ( = ?auto_430435 ?auto_430436 ) ) ( not ( = ?auto_430435 ?auto_430437 ) ) ( not ( = ?auto_430435 ?auto_430438 ) ) ( not ( = ?auto_430435 ?auto_430439 ) ) ( not ( = ?auto_430435 ?auto_430440 ) ) ( not ( = ?auto_430435 ?auto_430441 ) ) ( not ( = ?auto_430435 ?auto_430442 ) ) ( not ( = ?auto_430435 ?auto_430443 ) ) ( not ( = ?auto_430435 ?auto_430444 ) ) ( not ( = ?auto_430435 ?auto_430445 ) ) ( not ( = ?auto_430436 ?auto_430437 ) ) ( not ( = ?auto_430436 ?auto_430438 ) ) ( not ( = ?auto_430436 ?auto_430439 ) ) ( not ( = ?auto_430436 ?auto_430440 ) ) ( not ( = ?auto_430436 ?auto_430441 ) ) ( not ( = ?auto_430436 ?auto_430442 ) ) ( not ( = ?auto_430436 ?auto_430443 ) ) ( not ( = ?auto_430436 ?auto_430444 ) ) ( not ( = ?auto_430436 ?auto_430445 ) ) ( not ( = ?auto_430437 ?auto_430438 ) ) ( not ( = ?auto_430437 ?auto_430439 ) ) ( not ( = ?auto_430437 ?auto_430440 ) ) ( not ( = ?auto_430437 ?auto_430441 ) ) ( not ( = ?auto_430437 ?auto_430442 ) ) ( not ( = ?auto_430437 ?auto_430443 ) ) ( not ( = ?auto_430437 ?auto_430444 ) ) ( not ( = ?auto_430437 ?auto_430445 ) ) ( not ( = ?auto_430438 ?auto_430439 ) ) ( not ( = ?auto_430438 ?auto_430440 ) ) ( not ( = ?auto_430438 ?auto_430441 ) ) ( not ( = ?auto_430438 ?auto_430442 ) ) ( not ( = ?auto_430438 ?auto_430443 ) ) ( not ( = ?auto_430438 ?auto_430444 ) ) ( not ( = ?auto_430438 ?auto_430445 ) ) ( not ( = ?auto_430439 ?auto_430440 ) ) ( not ( = ?auto_430439 ?auto_430441 ) ) ( not ( = ?auto_430439 ?auto_430442 ) ) ( not ( = ?auto_430439 ?auto_430443 ) ) ( not ( = ?auto_430439 ?auto_430444 ) ) ( not ( = ?auto_430439 ?auto_430445 ) ) ( not ( = ?auto_430440 ?auto_430441 ) ) ( not ( = ?auto_430440 ?auto_430442 ) ) ( not ( = ?auto_430440 ?auto_430443 ) ) ( not ( = ?auto_430440 ?auto_430444 ) ) ( not ( = ?auto_430440 ?auto_430445 ) ) ( not ( = ?auto_430441 ?auto_430442 ) ) ( not ( = ?auto_430441 ?auto_430443 ) ) ( not ( = ?auto_430441 ?auto_430444 ) ) ( not ( = ?auto_430441 ?auto_430445 ) ) ( not ( = ?auto_430442 ?auto_430443 ) ) ( not ( = ?auto_430442 ?auto_430444 ) ) ( not ( = ?auto_430442 ?auto_430445 ) ) ( not ( = ?auto_430443 ?auto_430444 ) ) ( not ( = ?auto_430443 ?auto_430445 ) ) ( not ( = ?auto_430444 ?auto_430445 ) ) ( ON ?auto_430443 ?auto_430444 ) ( ON ?auto_430442 ?auto_430443 ) ( ON ?auto_430441 ?auto_430442 ) ( ON ?auto_430440 ?auto_430441 ) ( ON ?auto_430439 ?auto_430440 ) ( ON ?auto_430438 ?auto_430439 ) ( CLEAR ?auto_430436 ) ( ON ?auto_430437 ?auto_430438 ) ( CLEAR ?auto_430437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_430434 ?auto_430435 ?auto_430436 ?auto_430437 )
      ( MAKE-11PILE ?auto_430434 ?auto_430435 ?auto_430436 ?auto_430437 ?auto_430438 ?auto_430439 ?auto_430440 ?auto_430441 ?auto_430442 ?auto_430443 ?auto_430444 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430457 - BLOCK
      ?auto_430458 - BLOCK
      ?auto_430459 - BLOCK
      ?auto_430460 - BLOCK
      ?auto_430461 - BLOCK
      ?auto_430462 - BLOCK
      ?auto_430463 - BLOCK
      ?auto_430464 - BLOCK
      ?auto_430465 - BLOCK
      ?auto_430466 - BLOCK
      ?auto_430467 - BLOCK
    )
    :vars
    (
      ?auto_430468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430467 ?auto_430468 ) ( ON-TABLE ?auto_430457 ) ( ON ?auto_430458 ?auto_430457 ) ( not ( = ?auto_430457 ?auto_430458 ) ) ( not ( = ?auto_430457 ?auto_430459 ) ) ( not ( = ?auto_430457 ?auto_430460 ) ) ( not ( = ?auto_430457 ?auto_430461 ) ) ( not ( = ?auto_430457 ?auto_430462 ) ) ( not ( = ?auto_430457 ?auto_430463 ) ) ( not ( = ?auto_430457 ?auto_430464 ) ) ( not ( = ?auto_430457 ?auto_430465 ) ) ( not ( = ?auto_430457 ?auto_430466 ) ) ( not ( = ?auto_430457 ?auto_430467 ) ) ( not ( = ?auto_430457 ?auto_430468 ) ) ( not ( = ?auto_430458 ?auto_430459 ) ) ( not ( = ?auto_430458 ?auto_430460 ) ) ( not ( = ?auto_430458 ?auto_430461 ) ) ( not ( = ?auto_430458 ?auto_430462 ) ) ( not ( = ?auto_430458 ?auto_430463 ) ) ( not ( = ?auto_430458 ?auto_430464 ) ) ( not ( = ?auto_430458 ?auto_430465 ) ) ( not ( = ?auto_430458 ?auto_430466 ) ) ( not ( = ?auto_430458 ?auto_430467 ) ) ( not ( = ?auto_430458 ?auto_430468 ) ) ( not ( = ?auto_430459 ?auto_430460 ) ) ( not ( = ?auto_430459 ?auto_430461 ) ) ( not ( = ?auto_430459 ?auto_430462 ) ) ( not ( = ?auto_430459 ?auto_430463 ) ) ( not ( = ?auto_430459 ?auto_430464 ) ) ( not ( = ?auto_430459 ?auto_430465 ) ) ( not ( = ?auto_430459 ?auto_430466 ) ) ( not ( = ?auto_430459 ?auto_430467 ) ) ( not ( = ?auto_430459 ?auto_430468 ) ) ( not ( = ?auto_430460 ?auto_430461 ) ) ( not ( = ?auto_430460 ?auto_430462 ) ) ( not ( = ?auto_430460 ?auto_430463 ) ) ( not ( = ?auto_430460 ?auto_430464 ) ) ( not ( = ?auto_430460 ?auto_430465 ) ) ( not ( = ?auto_430460 ?auto_430466 ) ) ( not ( = ?auto_430460 ?auto_430467 ) ) ( not ( = ?auto_430460 ?auto_430468 ) ) ( not ( = ?auto_430461 ?auto_430462 ) ) ( not ( = ?auto_430461 ?auto_430463 ) ) ( not ( = ?auto_430461 ?auto_430464 ) ) ( not ( = ?auto_430461 ?auto_430465 ) ) ( not ( = ?auto_430461 ?auto_430466 ) ) ( not ( = ?auto_430461 ?auto_430467 ) ) ( not ( = ?auto_430461 ?auto_430468 ) ) ( not ( = ?auto_430462 ?auto_430463 ) ) ( not ( = ?auto_430462 ?auto_430464 ) ) ( not ( = ?auto_430462 ?auto_430465 ) ) ( not ( = ?auto_430462 ?auto_430466 ) ) ( not ( = ?auto_430462 ?auto_430467 ) ) ( not ( = ?auto_430462 ?auto_430468 ) ) ( not ( = ?auto_430463 ?auto_430464 ) ) ( not ( = ?auto_430463 ?auto_430465 ) ) ( not ( = ?auto_430463 ?auto_430466 ) ) ( not ( = ?auto_430463 ?auto_430467 ) ) ( not ( = ?auto_430463 ?auto_430468 ) ) ( not ( = ?auto_430464 ?auto_430465 ) ) ( not ( = ?auto_430464 ?auto_430466 ) ) ( not ( = ?auto_430464 ?auto_430467 ) ) ( not ( = ?auto_430464 ?auto_430468 ) ) ( not ( = ?auto_430465 ?auto_430466 ) ) ( not ( = ?auto_430465 ?auto_430467 ) ) ( not ( = ?auto_430465 ?auto_430468 ) ) ( not ( = ?auto_430466 ?auto_430467 ) ) ( not ( = ?auto_430466 ?auto_430468 ) ) ( not ( = ?auto_430467 ?auto_430468 ) ) ( ON ?auto_430466 ?auto_430467 ) ( ON ?auto_430465 ?auto_430466 ) ( ON ?auto_430464 ?auto_430465 ) ( ON ?auto_430463 ?auto_430464 ) ( ON ?auto_430462 ?auto_430463 ) ( ON ?auto_430461 ?auto_430462 ) ( ON ?auto_430460 ?auto_430461 ) ( CLEAR ?auto_430458 ) ( ON ?auto_430459 ?auto_430460 ) ( CLEAR ?auto_430459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_430457 ?auto_430458 ?auto_430459 )
      ( MAKE-11PILE ?auto_430457 ?auto_430458 ?auto_430459 ?auto_430460 ?auto_430461 ?auto_430462 ?auto_430463 ?auto_430464 ?auto_430465 ?auto_430466 ?auto_430467 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430480 - BLOCK
      ?auto_430481 - BLOCK
      ?auto_430482 - BLOCK
      ?auto_430483 - BLOCK
      ?auto_430484 - BLOCK
      ?auto_430485 - BLOCK
      ?auto_430486 - BLOCK
      ?auto_430487 - BLOCK
      ?auto_430488 - BLOCK
      ?auto_430489 - BLOCK
      ?auto_430490 - BLOCK
    )
    :vars
    (
      ?auto_430491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430490 ?auto_430491 ) ( ON-TABLE ?auto_430480 ) ( ON ?auto_430481 ?auto_430480 ) ( not ( = ?auto_430480 ?auto_430481 ) ) ( not ( = ?auto_430480 ?auto_430482 ) ) ( not ( = ?auto_430480 ?auto_430483 ) ) ( not ( = ?auto_430480 ?auto_430484 ) ) ( not ( = ?auto_430480 ?auto_430485 ) ) ( not ( = ?auto_430480 ?auto_430486 ) ) ( not ( = ?auto_430480 ?auto_430487 ) ) ( not ( = ?auto_430480 ?auto_430488 ) ) ( not ( = ?auto_430480 ?auto_430489 ) ) ( not ( = ?auto_430480 ?auto_430490 ) ) ( not ( = ?auto_430480 ?auto_430491 ) ) ( not ( = ?auto_430481 ?auto_430482 ) ) ( not ( = ?auto_430481 ?auto_430483 ) ) ( not ( = ?auto_430481 ?auto_430484 ) ) ( not ( = ?auto_430481 ?auto_430485 ) ) ( not ( = ?auto_430481 ?auto_430486 ) ) ( not ( = ?auto_430481 ?auto_430487 ) ) ( not ( = ?auto_430481 ?auto_430488 ) ) ( not ( = ?auto_430481 ?auto_430489 ) ) ( not ( = ?auto_430481 ?auto_430490 ) ) ( not ( = ?auto_430481 ?auto_430491 ) ) ( not ( = ?auto_430482 ?auto_430483 ) ) ( not ( = ?auto_430482 ?auto_430484 ) ) ( not ( = ?auto_430482 ?auto_430485 ) ) ( not ( = ?auto_430482 ?auto_430486 ) ) ( not ( = ?auto_430482 ?auto_430487 ) ) ( not ( = ?auto_430482 ?auto_430488 ) ) ( not ( = ?auto_430482 ?auto_430489 ) ) ( not ( = ?auto_430482 ?auto_430490 ) ) ( not ( = ?auto_430482 ?auto_430491 ) ) ( not ( = ?auto_430483 ?auto_430484 ) ) ( not ( = ?auto_430483 ?auto_430485 ) ) ( not ( = ?auto_430483 ?auto_430486 ) ) ( not ( = ?auto_430483 ?auto_430487 ) ) ( not ( = ?auto_430483 ?auto_430488 ) ) ( not ( = ?auto_430483 ?auto_430489 ) ) ( not ( = ?auto_430483 ?auto_430490 ) ) ( not ( = ?auto_430483 ?auto_430491 ) ) ( not ( = ?auto_430484 ?auto_430485 ) ) ( not ( = ?auto_430484 ?auto_430486 ) ) ( not ( = ?auto_430484 ?auto_430487 ) ) ( not ( = ?auto_430484 ?auto_430488 ) ) ( not ( = ?auto_430484 ?auto_430489 ) ) ( not ( = ?auto_430484 ?auto_430490 ) ) ( not ( = ?auto_430484 ?auto_430491 ) ) ( not ( = ?auto_430485 ?auto_430486 ) ) ( not ( = ?auto_430485 ?auto_430487 ) ) ( not ( = ?auto_430485 ?auto_430488 ) ) ( not ( = ?auto_430485 ?auto_430489 ) ) ( not ( = ?auto_430485 ?auto_430490 ) ) ( not ( = ?auto_430485 ?auto_430491 ) ) ( not ( = ?auto_430486 ?auto_430487 ) ) ( not ( = ?auto_430486 ?auto_430488 ) ) ( not ( = ?auto_430486 ?auto_430489 ) ) ( not ( = ?auto_430486 ?auto_430490 ) ) ( not ( = ?auto_430486 ?auto_430491 ) ) ( not ( = ?auto_430487 ?auto_430488 ) ) ( not ( = ?auto_430487 ?auto_430489 ) ) ( not ( = ?auto_430487 ?auto_430490 ) ) ( not ( = ?auto_430487 ?auto_430491 ) ) ( not ( = ?auto_430488 ?auto_430489 ) ) ( not ( = ?auto_430488 ?auto_430490 ) ) ( not ( = ?auto_430488 ?auto_430491 ) ) ( not ( = ?auto_430489 ?auto_430490 ) ) ( not ( = ?auto_430489 ?auto_430491 ) ) ( not ( = ?auto_430490 ?auto_430491 ) ) ( ON ?auto_430489 ?auto_430490 ) ( ON ?auto_430488 ?auto_430489 ) ( ON ?auto_430487 ?auto_430488 ) ( ON ?auto_430486 ?auto_430487 ) ( ON ?auto_430485 ?auto_430486 ) ( ON ?auto_430484 ?auto_430485 ) ( ON ?auto_430483 ?auto_430484 ) ( CLEAR ?auto_430481 ) ( ON ?auto_430482 ?auto_430483 ) ( CLEAR ?auto_430482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_430480 ?auto_430481 ?auto_430482 )
      ( MAKE-11PILE ?auto_430480 ?auto_430481 ?auto_430482 ?auto_430483 ?auto_430484 ?auto_430485 ?auto_430486 ?auto_430487 ?auto_430488 ?auto_430489 ?auto_430490 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430503 - BLOCK
      ?auto_430504 - BLOCK
      ?auto_430505 - BLOCK
      ?auto_430506 - BLOCK
      ?auto_430507 - BLOCK
      ?auto_430508 - BLOCK
      ?auto_430509 - BLOCK
      ?auto_430510 - BLOCK
      ?auto_430511 - BLOCK
      ?auto_430512 - BLOCK
      ?auto_430513 - BLOCK
    )
    :vars
    (
      ?auto_430514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430513 ?auto_430514 ) ( ON-TABLE ?auto_430503 ) ( not ( = ?auto_430503 ?auto_430504 ) ) ( not ( = ?auto_430503 ?auto_430505 ) ) ( not ( = ?auto_430503 ?auto_430506 ) ) ( not ( = ?auto_430503 ?auto_430507 ) ) ( not ( = ?auto_430503 ?auto_430508 ) ) ( not ( = ?auto_430503 ?auto_430509 ) ) ( not ( = ?auto_430503 ?auto_430510 ) ) ( not ( = ?auto_430503 ?auto_430511 ) ) ( not ( = ?auto_430503 ?auto_430512 ) ) ( not ( = ?auto_430503 ?auto_430513 ) ) ( not ( = ?auto_430503 ?auto_430514 ) ) ( not ( = ?auto_430504 ?auto_430505 ) ) ( not ( = ?auto_430504 ?auto_430506 ) ) ( not ( = ?auto_430504 ?auto_430507 ) ) ( not ( = ?auto_430504 ?auto_430508 ) ) ( not ( = ?auto_430504 ?auto_430509 ) ) ( not ( = ?auto_430504 ?auto_430510 ) ) ( not ( = ?auto_430504 ?auto_430511 ) ) ( not ( = ?auto_430504 ?auto_430512 ) ) ( not ( = ?auto_430504 ?auto_430513 ) ) ( not ( = ?auto_430504 ?auto_430514 ) ) ( not ( = ?auto_430505 ?auto_430506 ) ) ( not ( = ?auto_430505 ?auto_430507 ) ) ( not ( = ?auto_430505 ?auto_430508 ) ) ( not ( = ?auto_430505 ?auto_430509 ) ) ( not ( = ?auto_430505 ?auto_430510 ) ) ( not ( = ?auto_430505 ?auto_430511 ) ) ( not ( = ?auto_430505 ?auto_430512 ) ) ( not ( = ?auto_430505 ?auto_430513 ) ) ( not ( = ?auto_430505 ?auto_430514 ) ) ( not ( = ?auto_430506 ?auto_430507 ) ) ( not ( = ?auto_430506 ?auto_430508 ) ) ( not ( = ?auto_430506 ?auto_430509 ) ) ( not ( = ?auto_430506 ?auto_430510 ) ) ( not ( = ?auto_430506 ?auto_430511 ) ) ( not ( = ?auto_430506 ?auto_430512 ) ) ( not ( = ?auto_430506 ?auto_430513 ) ) ( not ( = ?auto_430506 ?auto_430514 ) ) ( not ( = ?auto_430507 ?auto_430508 ) ) ( not ( = ?auto_430507 ?auto_430509 ) ) ( not ( = ?auto_430507 ?auto_430510 ) ) ( not ( = ?auto_430507 ?auto_430511 ) ) ( not ( = ?auto_430507 ?auto_430512 ) ) ( not ( = ?auto_430507 ?auto_430513 ) ) ( not ( = ?auto_430507 ?auto_430514 ) ) ( not ( = ?auto_430508 ?auto_430509 ) ) ( not ( = ?auto_430508 ?auto_430510 ) ) ( not ( = ?auto_430508 ?auto_430511 ) ) ( not ( = ?auto_430508 ?auto_430512 ) ) ( not ( = ?auto_430508 ?auto_430513 ) ) ( not ( = ?auto_430508 ?auto_430514 ) ) ( not ( = ?auto_430509 ?auto_430510 ) ) ( not ( = ?auto_430509 ?auto_430511 ) ) ( not ( = ?auto_430509 ?auto_430512 ) ) ( not ( = ?auto_430509 ?auto_430513 ) ) ( not ( = ?auto_430509 ?auto_430514 ) ) ( not ( = ?auto_430510 ?auto_430511 ) ) ( not ( = ?auto_430510 ?auto_430512 ) ) ( not ( = ?auto_430510 ?auto_430513 ) ) ( not ( = ?auto_430510 ?auto_430514 ) ) ( not ( = ?auto_430511 ?auto_430512 ) ) ( not ( = ?auto_430511 ?auto_430513 ) ) ( not ( = ?auto_430511 ?auto_430514 ) ) ( not ( = ?auto_430512 ?auto_430513 ) ) ( not ( = ?auto_430512 ?auto_430514 ) ) ( not ( = ?auto_430513 ?auto_430514 ) ) ( ON ?auto_430512 ?auto_430513 ) ( ON ?auto_430511 ?auto_430512 ) ( ON ?auto_430510 ?auto_430511 ) ( ON ?auto_430509 ?auto_430510 ) ( ON ?auto_430508 ?auto_430509 ) ( ON ?auto_430507 ?auto_430508 ) ( ON ?auto_430506 ?auto_430507 ) ( ON ?auto_430505 ?auto_430506 ) ( CLEAR ?auto_430503 ) ( ON ?auto_430504 ?auto_430505 ) ( CLEAR ?auto_430504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430503 ?auto_430504 )
      ( MAKE-11PILE ?auto_430503 ?auto_430504 ?auto_430505 ?auto_430506 ?auto_430507 ?auto_430508 ?auto_430509 ?auto_430510 ?auto_430511 ?auto_430512 ?auto_430513 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430526 - BLOCK
      ?auto_430527 - BLOCK
      ?auto_430528 - BLOCK
      ?auto_430529 - BLOCK
      ?auto_430530 - BLOCK
      ?auto_430531 - BLOCK
      ?auto_430532 - BLOCK
      ?auto_430533 - BLOCK
      ?auto_430534 - BLOCK
      ?auto_430535 - BLOCK
      ?auto_430536 - BLOCK
    )
    :vars
    (
      ?auto_430537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430536 ?auto_430537 ) ( ON-TABLE ?auto_430526 ) ( not ( = ?auto_430526 ?auto_430527 ) ) ( not ( = ?auto_430526 ?auto_430528 ) ) ( not ( = ?auto_430526 ?auto_430529 ) ) ( not ( = ?auto_430526 ?auto_430530 ) ) ( not ( = ?auto_430526 ?auto_430531 ) ) ( not ( = ?auto_430526 ?auto_430532 ) ) ( not ( = ?auto_430526 ?auto_430533 ) ) ( not ( = ?auto_430526 ?auto_430534 ) ) ( not ( = ?auto_430526 ?auto_430535 ) ) ( not ( = ?auto_430526 ?auto_430536 ) ) ( not ( = ?auto_430526 ?auto_430537 ) ) ( not ( = ?auto_430527 ?auto_430528 ) ) ( not ( = ?auto_430527 ?auto_430529 ) ) ( not ( = ?auto_430527 ?auto_430530 ) ) ( not ( = ?auto_430527 ?auto_430531 ) ) ( not ( = ?auto_430527 ?auto_430532 ) ) ( not ( = ?auto_430527 ?auto_430533 ) ) ( not ( = ?auto_430527 ?auto_430534 ) ) ( not ( = ?auto_430527 ?auto_430535 ) ) ( not ( = ?auto_430527 ?auto_430536 ) ) ( not ( = ?auto_430527 ?auto_430537 ) ) ( not ( = ?auto_430528 ?auto_430529 ) ) ( not ( = ?auto_430528 ?auto_430530 ) ) ( not ( = ?auto_430528 ?auto_430531 ) ) ( not ( = ?auto_430528 ?auto_430532 ) ) ( not ( = ?auto_430528 ?auto_430533 ) ) ( not ( = ?auto_430528 ?auto_430534 ) ) ( not ( = ?auto_430528 ?auto_430535 ) ) ( not ( = ?auto_430528 ?auto_430536 ) ) ( not ( = ?auto_430528 ?auto_430537 ) ) ( not ( = ?auto_430529 ?auto_430530 ) ) ( not ( = ?auto_430529 ?auto_430531 ) ) ( not ( = ?auto_430529 ?auto_430532 ) ) ( not ( = ?auto_430529 ?auto_430533 ) ) ( not ( = ?auto_430529 ?auto_430534 ) ) ( not ( = ?auto_430529 ?auto_430535 ) ) ( not ( = ?auto_430529 ?auto_430536 ) ) ( not ( = ?auto_430529 ?auto_430537 ) ) ( not ( = ?auto_430530 ?auto_430531 ) ) ( not ( = ?auto_430530 ?auto_430532 ) ) ( not ( = ?auto_430530 ?auto_430533 ) ) ( not ( = ?auto_430530 ?auto_430534 ) ) ( not ( = ?auto_430530 ?auto_430535 ) ) ( not ( = ?auto_430530 ?auto_430536 ) ) ( not ( = ?auto_430530 ?auto_430537 ) ) ( not ( = ?auto_430531 ?auto_430532 ) ) ( not ( = ?auto_430531 ?auto_430533 ) ) ( not ( = ?auto_430531 ?auto_430534 ) ) ( not ( = ?auto_430531 ?auto_430535 ) ) ( not ( = ?auto_430531 ?auto_430536 ) ) ( not ( = ?auto_430531 ?auto_430537 ) ) ( not ( = ?auto_430532 ?auto_430533 ) ) ( not ( = ?auto_430532 ?auto_430534 ) ) ( not ( = ?auto_430532 ?auto_430535 ) ) ( not ( = ?auto_430532 ?auto_430536 ) ) ( not ( = ?auto_430532 ?auto_430537 ) ) ( not ( = ?auto_430533 ?auto_430534 ) ) ( not ( = ?auto_430533 ?auto_430535 ) ) ( not ( = ?auto_430533 ?auto_430536 ) ) ( not ( = ?auto_430533 ?auto_430537 ) ) ( not ( = ?auto_430534 ?auto_430535 ) ) ( not ( = ?auto_430534 ?auto_430536 ) ) ( not ( = ?auto_430534 ?auto_430537 ) ) ( not ( = ?auto_430535 ?auto_430536 ) ) ( not ( = ?auto_430535 ?auto_430537 ) ) ( not ( = ?auto_430536 ?auto_430537 ) ) ( ON ?auto_430535 ?auto_430536 ) ( ON ?auto_430534 ?auto_430535 ) ( ON ?auto_430533 ?auto_430534 ) ( ON ?auto_430532 ?auto_430533 ) ( ON ?auto_430531 ?auto_430532 ) ( ON ?auto_430530 ?auto_430531 ) ( ON ?auto_430529 ?auto_430530 ) ( ON ?auto_430528 ?auto_430529 ) ( CLEAR ?auto_430526 ) ( ON ?auto_430527 ?auto_430528 ) ( CLEAR ?auto_430527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430526 ?auto_430527 )
      ( MAKE-11PILE ?auto_430526 ?auto_430527 ?auto_430528 ?auto_430529 ?auto_430530 ?auto_430531 ?auto_430532 ?auto_430533 ?auto_430534 ?auto_430535 ?auto_430536 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430549 - BLOCK
      ?auto_430550 - BLOCK
      ?auto_430551 - BLOCK
      ?auto_430552 - BLOCK
      ?auto_430553 - BLOCK
      ?auto_430554 - BLOCK
      ?auto_430555 - BLOCK
      ?auto_430556 - BLOCK
      ?auto_430557 - BLOCK
      ?auto_430558 - BLOCK
      ?auto_430559 - BLOCK
    )
    :vars
    (
      ?auto_430560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430559 ?auto_430560 ) ( not ( = ?auto_430549 ?auto_430550 ) ) ( not ( = ?auto_430549 ?auto_430551 ) ) ( not ( = ?auto_430549 ?auto_430552 ) ) ( not ( = ?auto_430549 ?auto_430553 ) ) ( not ( = ?auto_430549 ?auto_430554 ) ) ( not ( = ?auto_430549 ?auto_430555 ) ) ( not ( = ?auto_430549 ?auto_430556 ) ) ( not ( = ?auto_430549 ?auto_430557 ) ) ( not ( = ?auto_430549 ?auto_430558 ) ) ( not ( = ?auto_430549 ?auto_430559 ) ) ( not ( = ?auto_430549 ?auto_430560 ) ) ( not ( = ?auto_430550 ?auto_430551 ) ) ( not ( = ?auto_430550 ?auto_430552 ) ) ( not ( = ?auto_430550 ?auto_430553 ) ) ( not ( = ?auto_430550 ?auto_430554 ) ) ( not ( = ?auto_430550 ?auto_430555 ) ) ( not ( = ?auto_430550 ?auto_430556 ) ) ( not ( = ?auto_430550 ?auto_430557 ) ) ( not ( = ?auto_430550 ?auto_430558 ) ) ( not ( = ?auto_430550 ?auto_430559 ) ) ( not ( = ?auto_430550 ?auto_430560 ) ) ( not ( = ?auto_430551 ?auto_430552 ) ) ( not ( = ?auto_430551 ?auto_430553 ) ) ( not ( = ?auto_430551 ?auto_430554 ) ) ( not ( = ?auto_430551 ?auto_430555 ) ) ( not ( = ?auto_430551 ?auto_430556 ) ) ( not ( = ?auto_430551 ?auto_430557 ) ) ( not ( = ?auto_430551 ?auto_430558 ) ) ( not ( = ?auto_430551 ?auto_430559 ) ) ( not ( = ?auto_430551 ?auto_430560 ) ) ( not ( = ?auto_430552 ?auto_430553 ) ) ( not ( = ?auto_430552 ?auto_430554 ) ) ( not ( = ?auto_430552 ?auto_430555 ) ) ( not ( = ?auto_430552 ?auto_430556 ) ) ( not ( = ?auto_430552 ?auto_430557 ) ) ( not ( = ?auto_430552 ?auto_430558 ) ) ( not ( = ?auto_430552 ?auto_430559 ) ) ( not ( = ?auto_430552 ?auto_430560 ) ) ( not ( = ?auto_430553 ?auto_430554 ) ) ( not ( = ?auto_430553 ?auto_430555 ) ) ( not ( = ?auto_430553 ?auto_430556 ) ) ( not ( = ?auto_430553 ?auto_430557 ) ) ( not ( = ?auto_430553 ?auto_430558 ) ) ( not ( = ?auto_430553 ?auto_430559 ) ) ( not ( = ?auto_430553 ?auto_430560 ) ) ( not ( = ?auto_430554 ?auto_430555 ) ) ( not ( = ?auto_430554 ?auto_430556 ) ) ( not ( = ?auto_430554 ?auto_430557 ) ) ( not ( = ?auto_430554 ?auto_430558 ) ) ( not ( = ?auto_430554 ?auto_430559 ) ) ( not ( = ?auto_430554 ?auto_430560 ) ) ( not ( = ?auto_430555 ?auto_430556 ) ) ( not ( = ?auto_430555 ?auto_430557 ) ) ( not ( = ?auto_430555 ?auto_430558 ) ) ( not ( = ?auto_430555 ?auto_430559 ) ) ( not ( = ?auto_430555 ?auto_430560 ) ) ( not ( = ?auto_430556 ?auto_430557 ) ) ( not ( = ?auto_430556 ?auto_430558 ) ) ( not ( = ?auto_430556 ?auto_430559 ) ) ( not ( = ?auto_430556 ?auto_430560 ) ) ( not ( = ?auto_430557 ?auto_430558 ) ) ( not ( = ?auto_430557 ?auto_430559 ) ) ( not ( = ?auto_430557 ?auto_430560 ) ) ( not ( = ?auto_430558 ?auto_430559 ) ) ( not ( = ?auto_430558 ?auto_430560 ) ) ( not ( = ?auto_430559 ?auto_430560 ) ) ( ON ?auto_430558 ?auto_430559 ) ( ON ?auto_430557 ?auto_430558 ) ( ON ?auto_430556 ?auto_430557 ) ( ON ?auto_430555 ?auto_430556 ) ( ON ?auto_430554 ?auto_430555 ) ( ON ?auto_430553 ?auto_430554 ) ( ON ?auto_430552 ?auto_430553 ) ( ON ?auto_430551 ?auto_430552 ) ( ON ?auto_430550 ?auto_430551 ) ( ON ?auto_430549 ?auto_430550 ) ( CLEAR ?auto_430549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430549 )
      ( MAKE-11PILE ?auto_430549 ?auto_430550 ?auto_430551 ?auto_430552 ?auto_430553 ?auto_430554 ?auto_430555 ?auto_430556 ?auto_430557 ?auto_430558 ?auto_430559 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430572 - BLOCK
      ?auto_430573 - BLOCK
      ?auto_430574 - BLOCK
      ?auto_430575 - BLOCK
      ?auto_430576 - BLOCK
      ?auto_430577 - BLOCK
      ?auto_430578 - BLOCK
      ?auto_430579 - BLOCK
      ?auto_430580 - BLOCK
      ?auto_430581 - BLOCK
      ?auto_430582 - BLOCK
    )
    :vars
    (
      ?auto_430583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430582 ?auto_430583 ) ( not ( = ?auto_430572 ?auto_430573 ) ) ( not ( = ?auto_430572 ?auto_430574 ) ) ( not ( = ?auto_430572 ?auto_430575 ) ) ( not ( = ?auto_430572 ?auto_430576 ) ) ( not ( = ?auto_430572 ?auto_430577 ) ) ( not ( = ?auto_430572 ?auto_430578 ) ) ( not ( = ?auto_430572 ?auto_430579 ) ) ( not ( = ?auto_430572 ?auto_430580 ) ) ( not ( = ?auto_430572 ?auto_430581 ) ) ( not ( = ?auto_430572 ?auto_430582 ) ) ( not ( = ?auto_430572 ?auto_430583 ) ) ( not ( = ?auto_430573 ?auto_430574 ) ) ( not ( = ?auto_430573 ?auto_430575 ) ) ( not ( = ?auto_430573 ?auto_430576 ) ) ( not ( = ?auto_430573 ?auto_430577 ) ) ( not ( = ?auto_430573 ?auto_430578 ) ) ( not ( = ?auto_430573 ?auto_430579 ) ) ( not ( = ?auto_430573 ?auto_430580 ) ) ( not ( = ?auto_430573 ?auto_430581 ) ) ( not ( = ?auto_430573 ?auto_430582 ) ) ( not ( = ?auto_430573 ?auto_430583 ) ) ( not ( = ?auto_430574 ?auto_430575 ) ) ( not ( = ?auto_430574 ?auto_430576 ) ) ( not ( = ?auto_430574 ?auto_430577 ) ) ( not ( = ?auto_430574 ?auto_430578 ) ) ( not ( = ?auto_430574 ?auto_430579 ) ) ( not ( = ?auto_430574 ?auto_430580 ) ) ( not ( = ?auto_430574 ?auto_430581 ) ) ( not ( = ?auto_430574 ?auto_430582 ) ) ( not ( = ?auto_430574 ?auto_430583 ) ) ( not ( = ?auto_430575 ?auto_430576 ) ) ( not ( = ?auto_430575 ?auto_430577 ) ) ( not ( = ?auto_430575 ?auto_430578 ) ) ( not ( = ?auto_430575 ?auto_430579 ) ) ( not ( = ?auto_430575 ?auto_430580 ) ) ( not ( = ?auto_430575 ?auto_430581 ) ) ( not ( = ?auto_430575 ?auto_430582 ) ) ( not ( = ?auto_430575 ?auto_430583 ) ) ( not ( = ?auto_430576 ?auto_430577 ) ) ( not ( = ?auto_430576 ?auto_430578 ) ) ( not ( = ?auto_430576 ?auto_430579 ) ) ( not ( = ?auto_430576 ?auto_430580 ) ) ( not ( = ?auto_430576 ?auto_430581 ) ) ( not ( = ?auto_430576 ?auto_430582 ) ) ( not ( = ?auto_430576 ?auto_430583 ) ) ( not ( = ?auto_430577 ?auto_430578 ) ) ( not ( = ?auto_430577 ?auto_430579 ) ) ( not ( = ?auto_430577 ?auto_430580 ) ) ( not ( = ?auto_430577 ?auto_430581 ) ) ( not ( = ?auto_430577 ?auto_430582 ) ) ( not ( = ?auto_430577 ?auto_430583 ) ) ( not ( = ?auto_430578 ?auto_430579 ) ) ( not ( = ?auto_430578 ?auto_430580 ) ) ( not ( = ?auto_430578 ?auto_430581 ) ) ( not ( = ?auto_430578 ?auto_430582 ) ) ( not ( = ?auto_430578 ?auto_430583 ) ) ( not ( = ?auto_430579 ?auto_430580 ) ) ( not ( = ?auto_430579 ?auto_430581 ) ) ( not ( = ?auto_430579 ?auto_430582 ) ) ( not ( = ?auto_430579 ?auto_430583 ) ) ( not ( = ?auto_430580 ?auto_430581 ) ) ( not ( = ?auto_430580 ?auto_430582 ) ) ( not ( = ?auto_430580 ?auto_430583 ) ) ( not ( = ?auto_430581 ?auto_430582 ) ) ( not ( = ?auto_430581 ?auto_430583 ) ) ( not ( = ?auto_430582 ?auto_430583 ) ) ( ON ?auto_430581 ?auto_430582 ) ( ON ?auto_430580 ?auto_430581 ) ( ON ?auto_430579 ?auto_430580 ) ( ON ?auto_430578 ?auto_430579 ) ( ON ?auto_430577 ?auto_430578 ) ( ON ?auto_430576 ?auto_430577 ) ( ON ?auto_430575 ?auto_430576 ) ( ON ?auto_430574 ?auto_430575 ) ( ON ?auto_430573 ?auto_430574 ) ( ON ?auto_430572 ?auto_430573 ) ( CLEAR ?auto_430572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430572 )
      ( MAKE-11PILE ?auto_430572 ?auto_430573 ?auto_430574 ?auto_430575 ?auto_430576 ?auto_430577 ?auto_430578 ?auto_430579 ?auto_430580 ?auto_430581 ?auto_430582 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430596 - BLOCK
      ?auto_430597 - BLOCK
      ?auto_430598 - BLOCK
      ?auto_430599 - BLOCK
      ?auto_430600 - BLOCK
      ?auto_430601 - BLOCK
      ?auto_430602 - BLOCK
      ?auto_430603 - BLOCK
      ?auto_430604 - BLOCK
      ?auto_430605 - BLOCK
      ?auto_430606 - BLOCK
      ?auto_430607 - BLOCK
    )
    :vars
    (
      ?auto_430608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430606 ) ( ON ?auto_430607 ?auto_430608 ) ( CLEAR ?auto_430607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430596 ) ( ON ?auto_430597 ?auto_430596 ) ( ON ?auto_430598 ?auto_430597 ) ( ON ?auto_430599 ?auto_430598 ) ( ON ?auto_430600 ?auto_430599 ) ( ON ?auto_430601 ?auto_430600 ) ( ON ?auto_430602 ?auto_430601 ) ( ON ?auto_430603 ?auto_430602 ) ( ON ?auto_430604 ?auto_430603 ) ( ON ?auto_430605 ?auto_430604 ) ( ON ?auto_430606 ?auto_430605 ) ( not ( = ?auto_430596 ?auto_430597 ) ) ( not ( = ?auto_430596 ?auto_430598 ) ) ( not ( = ?auto_430596 ?auto_430599 ) ) ( not ( = ?auto_430596 ?auto_430600 ) ) ( not ( = ?auto_430596 ?auto_430601 ) ) ( not ( = ?auto_430596 ?auto_430602 ) ) ( not ( = ?auto_430596 ?auto_430603 ) ) ( not ( = ?auto_430596 ?auto_430604 ) ) ( not ( = ?auto_430596 ?auto_430605 ) ) ( not ( = ?auto_430596 ?auto_430606 ) ) ( not ( = ?auto_430596 ?auto_430607 ) ) ( not ( = ?auto_430596 ?auto_430608 ) ) ( not ( = ?auto_430597 ?auto_430598 ) ) ( not ( = ?auto_430597 ?auto_430599 ) ) ( not ( = ?auto_430597 ?auto_430600 ) ) ( not ( = ?auto_430597 ?auto_430601 ) ) ( not ( = ?auto_430597 ?auto_430602 ) ) ( not ( = ?auto_430597 ?auto_430603 ) ) ( not ( = ?auto_430597 ?auto_430604 ) ) ( not ( = ?auto_430597 ?auto_430605 ) ) ( not ( = ?auto_430597 ?auto_430606 ) ) ( not ( = ?auto_430597 ?auto_430607 ) ) ( not ( = ?auto_430597 ?auto_430608 ) ) ( not ( = ?auto_430598 ?auto_430599 ) ) ( not ( = ?auto_430598 ?auto_430600 ) ) ( not ( = ?auto_430598 ?auto_430601 ) ) ( not ( = ?auto_430598 ?auto_430602 ) ) ( not ( = ?auto_430598 ?auto_430603 ) ) ( not ( = ?auto_430598 ?auto_430604 ) ) ( not ( = ?auto_430598 ?auto_430605 ) ) ( not ( = ?auto_430598 ?auto_430606 ) ) ( not ( = ?auto_430598 ?auto_430607 ) ) ( not ( = ?auto_430598 ?auto_430608 ) ) ( not ( = ?auto_430599 ?auto_430600 ) ) ( not ( = ?auto_430599 ?auto_430601 ) ) ( not ( = ?auto_430599 ?auto_430602 ) ) ( not ( = ?auto_430599 ?auto_430603 ) ) ( not ( = ?auto_430599 ?auto_430604 ) ) ( not ( = ?auto_430599 ?auto_430605 ) ) ( not ( = ?auto_430599 ?auto_430606 ) ) ( not ( = ?auto_430599 ?auto_430607 ) ) ( not ( = ?auto_430599 ?auto_430608 ) ) ( not ( = ?auto_430600 ?auto_430601 ) ) ( not ( = ?auto_430600 ?auto_430602 ) ) ( not ( = ?auto_430600 ?auto_430603 ) ) ( not ( = ?auto_430600 ?auto_430604 ) ) ( not ( = ?auto_430600 ?auto_430605 ) ) ( not ( = ?auto_430600 ?auto_430606 ) ) ( not ( = ?auto_430600 ?auto_430607 ) ) ( not ( = ?auto_430600 ?auto_430608 ) ) ( not ( = ?auto_430601 ?auto_430602 ) ) ( not ( = ?auto_430601 ?auto_430603 ) ) ( not ( = ?auto_430601 ?auto_430604 ) ) ( not ( = ?auto_430601 ?auto_430605 ) ) ( not ( = ?auto_430601 ?auto_430606 ) ) ( not ( = ?auto_430601 ?auto_430607 ) ) ( not ( = ?auto_430601 ?auto_430608 ) ) ( not ( = ?auto_430602 ?auto_430603 ) ) ( not ( = ?auto_430602 ?auto_430604 ) ) ( not ( = ?auto_430602 ?auto_430605 ) ) ( not ( = ?auto_430602 ?auto_430606 ) ) ( not ( = ?auto_430602 ?auto_430607 ) ) ( not ( = ?auto_430602 ?auto_430608 ) ) ( not ( = ?auto_430603 ?auto_430604 ) ) ( not ( = ?auto_430603 ?auto_430605 ) ) ( not ( = ?auto_430603 ?auto_430606 ) ) ( not ( = ?auto_430603 ?auto_430607 ) ) ( not ( = ?auto_430603 ?auto_430608 ) ) ( not ( = ?auto_430604 ?auto_430605 ) ) ( not ( = ?auto_430604 ?auto_430606 ) ) ( not ( = ?auto_430604 ?auto_430607 ) ) ( not ( = ?auto_430604 ?auto_430608 ) ) ( not ( = ?auto_430605 ?auto_430606 ) ) ( not ( = ?auto_430605 ?auto_430607 ) ) ( not ( = ?auto_430605 ?auto_430608 ) ) ( not ( = ?auto_430606 ?auto_430607 ) ) ( not ( = ?auto_430606 ?auto_430608 ) ) ( not ( = ?auto_430607 ?auto_430608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430607 ?auto_430608 )
      ( !STACK ?auto_430607 ?auto_430606 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430621 - BLOCK
      ?auto_430622 - BLOCK
      ?auto_430623 - BLOCK
      ?auto_430624 - BLOCK
      ?auto_430625 - BLOCK
      ?auto_430626 - BLOCK
      ?auto_430627 - BLOCK
      ?auto_430628 - BLOCK
      ?auto_430629 - BLOCK
      ?auto_430630 - BLOCK
      ?auto_430631 - BLOCK
      ?auto_430632 - BLOCK
    )
    :vars
    (
      ?auto_430633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430631 ) ( ON ?auto_430632 ?auto_430633 ) ( CLEAR ?auto_430632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430621 ) ( ON ?auto_430622 ?auto_430621 ) ( ON ?auto_430623 ?auto_430622 ) ( ON ?auto_430624 ?auto_430623 ) ( ON ?auto_430625 ?auto_430624 ) ( ON ?auto_430626 ?auto_430625 ) ( ON ?auto_430627 ?auto_430626 ) ( ON ?auto_430628 ?auto_430627 ) ( ON ?auto_430629 ?auto_430628 ) ( ON ?auto_430630 ?auto_430629 ) ( ON ?auto_430631 ?auto_430630 ) ( not ( = ?auto_430621 ?auto_430622 ) ) ( not ( = ?auto_430621 ?auto_430623 ) ) ( not ( = ?auto_430621 ?auto_430624 ) ) ( not ( = ?auto_430621 ?auto_430625 ) ) ( not ( = ?auto_430621 ?auto_430626 ) ) ( not ( = ?auto_430621 ?auto_430627 ) ) ( not ( = ?auto_430621 ?auto_430628 ) ) ( not ( = ?auto_430621 ?auto_430629 ) ) ( not ( = ?auto_430621 ?auto_430630 ) ) ( not ( = ?auto_430621 ?auto_430631 ) ) ( not ( = ?auto_430621 ?auto_430632 ) ) ( not ( = ?auto_430621 ?auto_430633 ) ) ( not ( = ?auto_430622 ?auto_430623 ) ) ( not ( = ?auto_430622 ?auto_430624 ) ) ( not ( = ?auto_430622 ?auto_430625 ) ) ( not ( = ?auto_430622 ?auto_430626 ) ) ( not ( = ?auto_430622 ?auto_430627 ) ) ( not ( = ?auto_430622 ?auto_430628 ) ) ( not ( = ?auto_430622 ?auto_430629 ) ) ( not ( = ?auto_430622 ?auto_430630 ) ) ( not ( = ?auto_430622 ?auto_430631 ) ) ( not ( = ?auto_430622 ?auto_430632 ) ) ( not ( = ?auto_430622 ?auto_430633 ) ) ( not ( = ?auto_430623 ?auto_430624 ) ) ( not ( = ?auto_430623 ?auto_430625 ) ) ( not ( = ?auto_430623 ?auto_430626 ) ) ( not ( = ?auto_430623 ?auto_430627 ) ) ( not ( = ?auto_430623 ?auto_430628 ) ) ( not ( = ?auto_430623 ?auto_430629 ) ) ( not ( = ?auto_430623 ?auto_430630 ) ) ( not ( = ?auto_430623 ?auto_430631 ) ) ( not ( = ?auto_430623 ?auto_430632 ) ) ( not ( = ?auto_430623 ?auto_430633 ) ) ( not ( = ?auto_430624 ?auto_430625 ) ) ( not ( = ?auto_430624 ?auto_430626 ) ) ( not ( = ?auto_430624 ?auto_430627 ) ) ( not ( = ?auto_430624 ?auto_430628 ) ) ( not ( = ?auto_430624 ?auto_430629 ) ) ( not ( = ?auto_430624 ?auto_430630 ) ) ( not ( = ?auto_430624 ?auto_430631 ) ) ( not ( = ?auto_430624 ?auto_430632 ) ) ( not ( = ?auto_430624 ?auto_430633 ) ) ( not ( = ?auto_430625 ?auto_430626 ) ) ( not ( = ?auto_430625 ?auto_430627 ) ) ( not ( = ?auto_430625 ?auto_430628 ) ) ( not ( = ?auto_430625 ?auto_430629 ) ) ( not ( = ?auto_430625 ?auto_430630 ) ) ( not ( = ?auto_430625 ?auto_430631 ) ) ( not ( = ?auto_430625 ?auto_430632 ) ) ( not ( = ?auto_430625 ?auto_430633 ) ) ( not ( = ?auto_430626 ?auto_430627 ) ) ( not ( = ?auto_430626 ?auto_430628 ) ) ( not ( = ?auto_430626 ?auto_430629 ) ) ( not ( = ?auto_430626 ?auto_430630 ) ) ( not ( = ?auto_430626 ?auto_430631 ) ) ( not ( = ?auto_430626 ?auto_430632 ) ) ( not ( = ?auto_430626 ?auto_430633 ) ) ( not ( = ?auto_430627 ?auto_430628 ) ) ( not ( = ?auto_430627 ?auto_430629 ) ) ( not ( = ?auto_430627 ?auto_430630 ) ) ( not ( = ?auto_430627 ?auto_430631 ) ) ( not ( = ?auto_430627 ?auto_430632 ) ) ( not ( = ?auto_430627 ?auto_430633 ) ) ( not ( = ?auto_430628 ?auto_430629 ) ) ( not ( = ?auto_430628 ?auto_430630 ) ) ( not ( = ?auto_430628 ?auto_430631 ) ) ( not ( = ?auto_430628 ?auto_430632 ) ) ( not ( = ?auto_430628 ?auto_430633 ) ) ( not ( = ?auto_430629 ?auto_430630 ) ) ( not ( = ?auto_430629 ?auto_430631 ) ) ( not ( = ?auto_430629 ?auto_430632 ) ) ( not ( = ?auto_430629 ?auto_430633 ) ) ( not ( = ?auto_430630 ?auto_430631 ) ) ( not ( = ?auto_430630 ?auto_430632 ) ) ( not ( = ?auto_430630 ?auto_430633 ) ) ( not ( = ?auto_430631 ?auto_430632 ) ) ( not ( = ?auto_430631 ?auto_430633 ) ) ( not ( = ?auto_430632 ?auto_430633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430632 ?auto_430633 )
      ( !STACK ?auto_430632 ?auto_430631 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430646 - BLOCK
      ?auto_430647 - BLOCK
      ?auto_430648 - BLOCK
      ?auto_430649 - BLOCK
      ?auto_430650 - BLOCK
      ?auto_430651 - BLOCK
      ?auto_430652 - BLOCK
      ?auto_430653 - BLOCK
      ?auto_430654 - BLOCK
      ?auto_430655 - BLOCK
      ?auto_430656 - BLOCK
      ?auto_430657 - BLOCK
    )
    :vars
    (
      ?auto_430658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430657 ?auto_430658 ) ( ON-TABLE ?auto_430646 ) ( ON ?auto_430647 ?auto_430646 ) ( ON ?auto_430648 ?auto_430647 ) ( ON ?auto_430649 ?auto_430648 ) ( ON ?auto_430650 ?auto_430649 ) ( ON ?auto_430651 ?auto_430650 ) ( ON ?auto_430652 ?auto_430651 ) ( ON ?auto_430653 ?auto_430652 ) ( ON ?auto_430654 ?auto_430653 ) ( ON ?auto_430655 ?auto_430654 ) ( not ( = ?auto_430646 ?auto_430647 ) ) ( not ( = ?auto_430646 ?auto_430648 ) ) ( not ( = ?auto_430646 ?auto_430649 ) ) ( not ( = ?auto_430646 ?auto_430650 ) ) ( not ( = ?auto_430646 ?auto_430651 ) ) ( not ( = ?auto_430646 ?auto_430652 ) ) ( not ( = ?auto_430646 ?auto_430653 ) ) ( not ( = ?auto_430646 ?auto_430654 ) ) ( not ( = ?auto_430646 ?auto_430655 ) ) ( not ( = ?auto_430646 ?auto_430656 ) ) ( not ( = ?auto_430646 ?auto_430657 ) ) ( not ( = ?auto_430646 ?auto_430658 ) ) ( not ( = ?auto_430647 ?auto_430648 ) ) ( not ( = ?auto_430647 ?auto_430649 ) ) ( not ( = ?auto_430647 ?auto_430650 ) ) ( not ( = ?auto_430647 ?auto_430651 ) ) ( not ( = ?auto_430647 ?auto_430652 ) ) ( not ( = ?auto_430647 ?auto_430653 ) ) ( not ( = ?auto_430647 ?auto_430654 ) ) ( not ( = ?auto_430647 ?auto_430655 ) ) ( not ( = ?auto_430647 ?auto_430656 ) ) ( not ( = ?auto_430647 ?auto_430657 ) ) ( not ( = ?auto_430647 ?auto_430658 ) ) ( not ( = ?auto_430648 ?auto_430649 ) ) ( not ( = ?auto_430648 ?auto_430650 ) ) ( not ( = ?auto_430648 ?auto_430651 ) ) ( not ( = ?auto_430648 ?auto_430652 ) ) ( not ( = ?auto_430648 ?auto_430653 ) ) ( not ( = ?auto_430648 ?auto_430654 ) ) ( not ( = ?auto_430648 ?auto_430655 ) ) ( not ( = ?auto_430648 ?auto_430656 ) ) ( not ( = ?auto_430648 ?auto_430657 ) ) ( not ( = ?auto_430648 ?auto_430658 ) ) ( not ( = ?auto_430649 ?auto_430650 ) ) ( not ( = ?auto_430649 ?auto_430651 ) ) ( not ( = ?auto_430649 ?auto_430652 ) ) ( not ( = ?auto_430649 ?auto_430653 ) ) ( not ( = ?auto_430649 ?auto_430654 ) ) ( not ( = ?auto_430649 ?auto_430655 ) ) ( not ( = ?auto_430649 ?auto_430656 ) ) ( not ( = ?auto_430649 ?auto_430657 ) ) ( not ( = ?auto_430649 ?auto_430658 ) ) ( not ( = ?auto_430650 ?auto_430651 ) ) ( not ( = ?auto_430650 ?auto_430652 ) ) ( not ( = ?auto_430650 ?auto_430653 ) ) ( not ( = ?auto_430650 ?auto_430654 ) ) ( not ( = ?auto_430650 ?auto_430655 ) ) ( not ( = ?auto_430650 ?auto_430656 ) ) ( not ( = ?auto_430650 ?auto_430657 ) ) ( not ( = ?auto_430650 ?auto_430658 ) ) ( not ( = ?auto_430651 ?auto_430652 ) ) ( not ( = ?auto_430651 ?auto_430653 ) ) ( not ( = ?auto_430651 ?auto_430654 ) ) ( not ( = ?auto_430651 ?auto_430655 ) ) ( not ( = ?auto_430651 ?auto_430656 ) ) ( not ( = ?auto_430651 ?auto_430657 ) ) ( not ( = ?auto_430651 ?auto_430658 ) ) ( not ( = ?auto_430652 ?auto_430653 ) ) ( not ( = ?auto_430652 ?auto_430654 ) ) ( not ( = ?auto_430652 ?auto_430655 ) ) ( not ( = ?auto_430652 ?auto_430656 ) ) ( not ( = ?auto_430652 ?auto_430657 ) ) ( not ( = ?auto_430652 ?auto_430658 ) ) ( not ( = ?auto_430653 ?auto_430654 ) ) ( not ( = ?auto_430653 ?auto_430655 ) ) ( not ( = ?auto_430653 ?auto_430656 ) ) ( not ( = ?auto_430653 ?auto_430657 ) ) ( not ( = ?auto_430653 ?auto_430658 ) ) ( not ( = ?auto_430654 ?auto_430655 ) ) ( not ( = ?auto_430654 ?auto_430656 ) ) ( not ( = ?auto_430654 ?auto_430657 ) ) ( not ( = ?auto_430654 ?auto_430658 ) ) ( not ( = ?auto_430655 ?auto_430656 ) ) ( not ( = ?auto_430655 ?auto_430657 ) ) ( not ( = ?auto_430655 ?auto_430658 ) ) ( not ( = ?auto_430656 ?auto_430657 ) ) ( not ( = ?auto_430656 ?auto_430658 ) ) ( not ( = ?auto_430657 ?auto_430658 ) ) ( CLEAR ?auto_430655 ) ( ON ?auto_430656 ?auto_430657 ) ( CLEAR ?auto_430656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_430646 ?auto_430647 ?auto_430648 ?auto_430649 ?auto_430650 ?auto_430651 ?auto_430652 ?auto_430653 ?auto_430654 ?auto_430655 ?auto_430656 )
      ( MAKE-12PILE ?auto_430646 ?auto_430647 ?auto_430648 ?auto_430649 ?auto_430650 ?auto_430651 ?auto_430652 ?auto_430653 ?auto_430654 ?auto_430655 ?auto_430656 ?auto_430657 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430671 - BLOCK
      ?auto_430672 - BLOCK
      ?auto_430673 - BLOCK
      ?auto_430674 - BLOCK
      ?auto_430675 - BLOCK
      ?auto_430676 - BLOCK
      ?auto_430677 - BLOCK
      ?auto_430678 - BLOCK
      ?auto_430679 - BLOCK
      ?auto_430680 - BLOCK
      ?auto_430681 - BLOCK
      ?auto_430682 - BLOCK
    )
    :vars
    (
      ?auto_430683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430682 ?auto_430683 ) ( ON-TABLE ?auto_430671 ) ( ON ?auto_430672 ?auto_430671 ) ( ON ?auto_430673 ?auto_430672 ) ( ON ?auto_430674 ?auto_430673 ) ( ON ?auto_430675 ?auto_430674 ) ( ON ?auto_430676 ?auto_430675 ) ( ON ?auto_430677 ?auto_430676 ) ( ON ?auto_430678 ?auto_430677 ) ( ON ?auto_430679 ?auto_430678 ) ( ON ?auto_430680 ?auto_430679 ) ( not ( = ?auto_430671 ?auto_430672 ) ) ( not ( = ?auto_430671 ?auto_430673 ) ) ( not ( = ?auto_430671 ?auto_430674 ) ) ( not ( = ?auto_430671 ?auto_430675 ) ) ( not ( = ?auto_430671 ?auto_430676 ) ) ( not ( = ?auto_430671 ?auto_430677 ) ) ( not ( = ?auto_430671 ?auto_430678 ) ) ( not ( = ?auto_430671 ?auto_430679 ) ) ( not ( = ?auto_430671 ?auto_430680 ) ) ( not ( = ?auto_430671 ?auto_430681 ) ) ( not ( = ?auto_430671 ?auto_430682 ) ) ( not ( = ?auto_430671 ?auto_430683 ) ) ( not ( = ?auto_430672 ?auto_430673 ) ) ( not ( = ?auto_430672 ?auto_430674 ) ) ( not ( = ?auto_430672 ?auto_430675 ) ) ( not ( = ?auto_430672 ?auto_430676 ) ) ( not ( = ?auto_430672 ?auto_430677 ) ) ( not ( = ?auto_430672 ?auto_430678 ) ) ( not ( = ?auto_430672 ?auto_430679 ) ) ( not ( = ?auto_430672 ?auto_430680 ) ) ( not ( = ?auto_430672 ?auto_430681 ) ) ( not ( = ?auto_430672 ?auto_430682 ) ) ( not ( = ?auto_430672 ?auto_430683 ) ) ( not ( = ?auto_430673 ?auto_430674 ) ) ( not ( = ?auto_430673 ?auto_430675 ) ) ( not ( = ?auto_430673 ?auto_430676 ) ) ( not ( = ?auto_430673 ?auto_430677 ) ) ( not ( = ?auto_430673 ?auto_430678 ) ) ( not ( = ?auto_430673 ?auto_430679 ) ) ( not ( = ?auto_430673 ?auto_430680 ) ) ( not ( = ?auto_430673 ?auto_430681 ) ) ( not ( = ?auto_430673 ?auto_430682 ) ) ( not ( = ?auto_430673 ?auto_430683 ) ) ( not ( = ?auto_430674 ?auto_430675 ) ) ( not ( = ?auto_430674 ?auto_430676 ) ) ( not ( = ?auto_430674 ?auto_430677 ) ) ( not ( = ?auto_430674 ?auto_430678 ) ) ( not ( = ?auto_430674 ?auto_430679 ) ) ( not ( = ?auto_430674 ?auto_430680 ) ) ( not ( = ?auto_430674 ?auto_430681 ) ) ( not ( = ?auto_430674 ?auto_430682 ) ) ( not ( = ?auto_430674 ?auto_430683 ) ) ( not ( = ?auto_430675 ?auto_430676 ) ) ( not ( = ?auto_430675 ?auto_430677 ) ) ( not ( = ?auto_430675 ?auto_430678 ) ) ( not ( = ?auto_430675 ?auto_430679 ) ) ( not ( = ?auto_430675 ?auto_430680 ) ) ( not ( = ?auto_430675 ?auto_430681 ) ) ( not ( = ?auto_430675 ?auto_430682 ) ) ( not ( = ?auto_430675 ?auto_430683 ) ) ( not ( = ?auto_430676 ?auto_430677 ) ) ( not ( = ?auto_430676 ?auto_430678 ) ) ( not ( = ?auto_430676 ?auto_430679 ) ) ( not ( = ?auto_430676 ?auto_430680 ) ) ( not ( = ?auto_430676 ?auto_430681 ) ) ( not ( = ?auto_430676 ?auto_430682 ) ) ( not ( = ?auto_430676 ?auto_430683 ) ) ( not ( = ?auto_430677 ?auto_430678 ) ) ( not ( = ?auto_430677 ?auto_430679 ) ) ( not ( = ?auto_430677 ?auto_430680 ) ) ( not ( = ?auto_430677 ?auto_430681 ) ) ( not ( = ?auto_430677 ?auto_430682 ) ) ( not ( = ?auto_430677 ?auto_430683 ) ) ( not ( = ?auto_430678 ?auto_430679 ) ) ( not ( = ?auto_430678 ?auto_430680 ) ) ( not ( = ?auto_430678 ?auto_430681 ) ) ( not ( = ?auto_430678 ?auto_430682 ) ) ( not ( = ?auto_430678 ?auto_430683 ) ) ( not ( = ?auto_430679 ?auto_430680 ) ) ( not ( = ?auto_430679 ?auto_430681 ) ) ( not ( = ?auto_430679 ?auto_430682 ) ) ( not ( = ?auto_430679 ?auto_430683 ) ) ( not ( = ?auto_430680 ?auto_430681 ) ) ( not ( = ?auto_430680 ?auto_430682 ) ) ( not ( = ?auto_430680 ?auto_430683 ) ) ( not ( = ?auto_430681 ?auto_430682 ) ) ( not ( = ?auto_430681 ?auto_430683 ) ) ( not ( = ?auto_430682 ?auto_430683 ) ) ( CLEAR ?auto_430680 ) ( ON ?auto_430681 ?auto_430682 ) ( CLEAR ?auto_430681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_430671 ?auto_430672 ?auto_430673 ?auto_430674 ?auto_430675 ?auto_430676 ?auto_430677 ?auto_430678 ?auto_430679 ?auto_430680 ?auto_430681 )
      ( MAKE-12PILE ?auto_430671 ?auto_430672 ?auto_430673 ?auto_430674 ?auto_430675 ?auto_430676 ?auto_430677 ?auto_430678 ?auto_430679 ?auto_430680 ?auto_430681 ?auto_430682 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430696 - BLOCK
      ?auto_430697 - BLOCK
      ?auto_430698 - BLOCK
      ?auto_430699 - BLOCK
      ?auto_430700 - BLOCK
      ?auto_430701 - BLOCK
      ?auto_430702 - BLOCK
      ?auto_430703 - BLOCK
      ?auto_430704 - BLOCK
      ?auto_430705 - BLOCK
      ?auto_430706 - BLOCK
      ?auto_430707 - BLOCK
    )
    :vars
    (
      ?auto_430708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430707 ?auto_430708 ) ( ON-TABLE ?auto_430696 ) ( ON ?auto_430697 ?auto_430696 ) ( ON ?auto_430698 ?auto_430697 ) ( ON ?auto_430699 ?auto_430698 ) ( ON ?auto_430700 ?auto_430699 ) ( ON ?auto_430701 ?auto_430700 ) ( ON ?auto_430702 ?auto_430701 ) ( ON ?auto_430703 ?auto_430702 ) ( ON ?auto_430704 ?auto_430703 ) ( not ( = ?auto_430696 ?auto_430697 ) ) ( not ( = ?auto_430696 ?auto_430698 ) ) ( not ( = ?auto_430696 ?auto_430699 ) ) ( not ( = ?auto_430696 ?auto_430700 ) ) ( not ( = ?auto_430696 ?auto_430701 ) ) ( not ( = ?auto_430696 ?auto_430702 ) ) ( not ( = ?auto_430696 ?auto_430703 ) ) ( not ( = ?auto_430696 ?auto_430704 ) ) ( not ( = ?auto_430696 ?auto_430705 ) ) ( not ( = ?auto_430696 ?auto_430706 ) ) ( not ( = ?auto_430696 ?auto_430707 ) ) ( not ( = ?auto_430696 ?auto_430708 ) ) ( not ( = ?auto_430697 ?auto_430698 ) ) ( not ( = ?auto_430697 ?auto_430699 ) ) ( not ( = ?auto_430697 ?auto_430700 ) ) ( not ( = ?auto_430697 ?auto_430701 ) ) ( not ( = ?auto_430697 ?auto_430702 ) ) ( not ( = ?auto_430697 ?auto_430703 ) ) ( not ( = ?auto_430697 ?auto_430704 ) ) ( not ( = ?auto_430697 ?auto_430705 ) ) ( not ( = ?auto_430697 ?auto_430706 ) ) ( not ( = ?auto_430697 ?auto_430707 ) ) ( not ( = ?auto_430697 ?auto_430708 ) ) ( not ( = ?auto_430698 ?auto_430699 ) ) ( not ( = ?auto_430698 ?auto_430700 ) ) ( not ( = ?auto_430698 ?auto_430701 ) ) ( not ( = ?auto_430698 ?auto_430702 ) ) ( not ( = ?auto_430698 ?auto_430703 ) ) ( not ( = ?auto_430698 ?auto_430704 ) ) ( not ( = ?auto_430698 ?auto_430705 ) ) ( not ( = ?auto_430698 ?auto_430706 ) ) ( not ( = ?auto_430698 ?auto_430707 ) ) ( not ( = ?auto_430698 ?auto_430708 ) ) ( not ( = ?auto_430699 ?auto_430700 ) ) ( not ( = ?auto_430699 ?auto_430701 ) ) ( not ( = ?auto_430699 ?auto_430702 ) ) ( not ( = ?auto_430699 ?auto_430703 ) ) ( not ( = ?auto_430699 ?auto_430704 ) ) ( not ( = ?auto_430699 ?auto_430705 ) ) ( not ( = ?auto_430699 ?auto_430706 ) ) ( not ( = ?auto_430699 ?auto_430707 ) ) ( not ( = ?auto_430699 ?auto_430708 ) ) ( not ( = ?auto_430700 ?auto_430701 ) ) ( not ( = ?auto_430700 ?auto_430702 ) ) ( not ( = ?auto_430700 ?auto_430703 ) ) ( not ( = ?auto_430700 ?auto_430704 ) ) ( not ( = ?auto_430700 ?auto_430705 ) ) ( not ( = ?auto_430700 ?auto_430706 ) ) ( not ( = ?auto_430700 ?auto_430707 ) ) ( not ( = ?auto_430700 ?auto_430708 ) ) ( not ( = ?auto_430701 ?auto_430702 ) ) ( not ( = ?auto_430701 ?auto_430703 ) ) ( not ( = ?auto_430701 ?auto_430704 ) ) ( not ( = ?auto_430701 ?auto_430705 ) ) ( not ( = ?auto_430701 ?auto_430706 ) ) ( not ( = ?auto_430701 ?auto_430707 ) ) ( not ( = ?auto_430701 ?auto_430708 ) ) ( not ( = ?auto_430702 ?auto_430703 ) ) ( not ( = ?auto_430702 ?auto_430704 ) ) ( not ( = ?auto_430702 ?auto_430705 ) ) ( not ( = ?auto_430702 ?auto_430706 ) ) ( not ( = ?auto_430702 ?auto_430707 ) ) ( not ( = ?auto_430702 ?auto_430708 ) ) ( not ( = ?auto_430703 ?auto_430704 ) ) ( not ( = ?auto_430703 ?auto_430705 ) ) ( not ( = ?auto_430703 ?auto_430706 ) ) ( not ( = ?auto_430703 ?auto_430707 ) ) ( not ( = ?auto_430703 ?auto_430708 ) ) ( not ( = ?auto_430704 ?auto_430705 ) ) ( not ( = ?auto_430704 ?auto_430706 ) ) ( not ( = ?auto_430704 ?auto_430707 ) ) ( not ( = ?auto_430704 ?auto_430708 ) ) ( not ( = ?auto_430705 ?auto_430706 ) ) ( not ( = ?auto_430705 ?auto_430707 ) ) ( not ( = ?auto_430705 ?auto_430708 ) ) ( not ( = ?auto_430706 ?auto_430707 ) ) ( not ( = ?auto_430706 ?auto_430708 ) ) ( not ( = ?auto_430707 ?auto_430708 ) ) ( ON ?auto_430706 ?auto_430707 ) ( CLEAR ?auto_430704 ) ( ON ?auto_430705 ?auto_430706 ) ( CLEAR ?auto_430705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430696 ?auto_430697 ?auto_430698 ?auto_430699 ?auto_430700 ?auto_430701 ?auto_430702 ?auto_430703 ?auto_430704 ?auto_430705 )
      ( MAKE-12PILE ?auto_430696 ?auto_430697 ?auto_430698 ?auto_430699 ?auto_430700 ?auto_430701 ?auto_430702 ?auto_430703 ?auto_430704 ?auto_430705 ?auto_430706 ?auto_430707 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430721 - BLOCK
      ?auto_430722 - BLOCK
      ?auto_430723 - BLOCK
      ?auto_430724 - BLOCK
      ?auto_430725 - BLOCK
      ?auto_430726 - BLOCK
      ?auto_430727 - BLOCK
      ?auto_430728 - BLOCK
      ?auto_430729 - BLOCK
      ?auto_430730 - BLOCK
      ?auto_430731 - BLOCK
      ?auto_430732 - BLOCK
    )
    :vars
    (
      ?auto_430733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430732 ?auto_430733 ) ( ON-TABLE ?auto_430721 ) ( ON ?auto_430722 ?auto_430721 ) ( ON ?auto_430723 ?auto_430722 ) ( ON ?auto_430724 ?auto_430723 ) ( ON ?auto_430725 ?auto_430724 ) ( ON ?auto_430726 ?auto_430725 ) ( ON ?auto_430727 ?auto_430726 ) ( ON ?auto_430728 ?auto_430727 ) ( ON ?auto_430729 ?auto_430728 ) ( not ( = ?auto_430721 ?auto_430722 ) ) ( not ( = ?auto_430721 ?auto_430723 ) ) ( not ( = ?auto_430721 ?auto_430724 ) ) ( not ( = ?auto_430721 ?auto_430725 ) ) ( not ( = ?auto_430721 ?auto_430726 ) ) ( not ( = ?auto_430721 ?auto_430727 ) ) ( not ( = ?auto_430721 ?auto_430728 ) ) ( not ( = ?auto_430721 ?auto_430729 ) ) ( not ( = ?auto_430721 ?auto_430730 ) ) ( not ( = ?auto_430721 ?auto_430731 ) ) ( not ( = ?auto_430721 ?auto_430732 ) ) ( not ( = ?auto_430721 ?auto_430733 ) ) ( not ( = ?auto_430722 ?auto_430723 ) ) ( not ( = ?auto_430722 ?auto_430724 ) ) ( not ( = ?auto_430722 ?auto_430725 ) ) ( not ( = ?auto_430722 ?auto_430726 ) ) ( not ( = ?auto_430722 ?auto_430727 ) ) ( not ( = ?auto_430722 ?auto_430728 ) ) ( not ( = ?auto_430722 ?auto_430729 ) ) ( not ( = ?auto_430722 ?auto_430730 ) ) ( not ( = ?auto_430722 ?auto_430731 ) ) ( not ( = ?auto_430722 ?auto_430732 ) ) ( not ( = ?auto_430722 ?auto_430733 ) ) ( not ( = ?auto_430723 ?auto_430724 ) ) ( not ( = ?auto_430723 ?auto_430725 ) ) ( not ( = ?auto_430723 ?auto_430726 ) ) ( not ( = ?auto_430723 ?auto_430727 ) ) ( not ( = ?auto_430723 ?auto_430728 ) ) ( not ( = ?auto_430723 ?auto_430729 ) ) ( not ( = ?auto_430723 ?auto_430730 ) ) ( not ( = ?auto_430723 ?auto_430731 ) ) ( not ( = ?auto_430723 ?auto_430732 ) ) ( not ( = ?auto_430723 ?auto_430733 ) ) ( not ( = ?auto_430724 ?auto_430725 ) ) ( not ( = ?auto_430724 ?auto_430726 ) ) ( not ( = ?auto_430724 ?auto_430727 ) ) ( not ( = ?auto_430724 ?auto_430728 ) ) ( not ( = ?auto_430724 ?auto_430729 ) ) ( not ( = ?auto_430724 ?auto_430730 ) ) ( not ( = ?auto_430724 ?auto_430731 ) ) ( not ( = ?auto_430724 ?auto_430732 ) ) ( not ( = ?auto_430724 ?auto_430733 ) ) ( not ( = ?auto_430725 ?auto_430726 ) ) ( not ( = ?auto_430725 ?auto_430727 ) ) ( not ( = ?auto_430725 ?auto_430728 ) ) ( not ( = ?auto_430725 ?auto_430729 ) ) ( not ( = ?auto_430725 ?auto_430730 ) ) ( not ( = ?auto_430725 ?auto_430731 ) ) ( not ( = ?auto_430725 ?auto_430732 ) ) ( not ( = ?auto_430725 ?auto_430733 ) ) ( not ( = ?auto_430726 ?auto_430727 ) ) ( not ( = ?auto_430726 ?auto_430728 ) ) ( not ( = ?auto_430726 ?auto_430729 ) ) ( not ( = ?auto_430726 ?auto_430730 ) ) ( not ( = ?auto_430726 ?auto_430731 ) ) ( not ( = ?auto_430726 ?auto_430732 ) ) ( not ( = ?auto_430726 ?auto_430733 ) ) ( not ( = ?auto_430727 ?auto_430728 ) ) ( not ( = ?auto_430727 ?auto_430729 ) ) ( not ( = ?auto_430727 ?auto_430730 ) ) ( not ( = ?auto_430727 ?auto_430731 ) ) ( not ( = ?auto_430727 ?auto_430732 ) ) ( not ( = ?auto_430727 ?auto_430733 ) ) ( not ( = ?auto_430728 ?auto_430729 ) ) ( not ( = ?auto_430728 ?auto_430730 ) ) ( not ( = ?auto_430728 ?auto_430731 ) ) ( not ( = ?auto_430728 ?auto_430732 ) ) ( not ( = ?auto_430728 ?auto_430733 ) ) ( not ( = ?auto_430729 ?auto_430730 ) ) ( not ( = ?auto_430729 ?auto_430731 ) ) ( not ( = ?auto_430729 ?auto_430732 ) ) ( not ( = ?auto_430729 ?auto_430733 ) ) ( not ( = ?auto_430730 ?auto_430731 ) ) ( not ( = ?auto_430730 ?auto_430732 ) ) ( not ( = ?auto_430730 ?auto_430733 ) ) ( not ( = ?auto_430731 ?auto_430732 ) ) ( not ( = ?auto_430731 ?auto_430733 ) ) ( not ( = ?auto_430732 ?auto_430733 ) ) ( ON ?auto_430731 ?auto_430732 ) ( CLEAR ?auto_430729 ) ( ON ?auto_430730 ?auto_430731 ) ( CLEAR ?auto_430730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430721 ?auto_430722 ?auto_430723 ?auto_430724 ?auto_430725 ?auto_430726 ?auto_430727 ?auto_430728 ?auto_430729 ?auto_430730 )
      ( MAKE-12PILE ?auto_430721 ?auto_430722 ?auto_430723 ?auto_430724 ?auto_430725 ?auto_430726 ?auto_430727 ?auto_430728 ?auto_430729 ?auto_430730 ?auto_430731 ?auto_430732 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430746 - BLOCK
      ?auto_430747 - BLOCK
      ?auto_430748 - BLOCK
      ?auto_430749 - BLOCK
      ?auto_430750 - BLOCK
      ?auto_430751 - BLOCK
      ?auto_430752 - BLOCK
      ?auto_430753 - BLOCK
      ?auto_430754 - BLOCK
      ?auto_430755 - BLOCK
      ?auto_430756 - BLOCK
      ?auto_430757 - BLOCK
    )
    :vars
    (
      ?auto_430758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430757 ?auto_430758 ) ( ON-TABLE ?auto_430746 ) ( ON ?auto_430747 ?auto_430746 ) ( ON ?auto_430748 ?auto_430747 ) ( ON ?auto_430749 ?auto_430748 ) ( ON ?auto_430750 ?auto_430749 ) ( ON ?auto_430751 ?auto_430750 ) ( ON ?auto_430752 ?auto_430751 ) ( ON ?auto_430753 ?auto_430752 ) ( not ( = ?auto_430746 ?auto_430747 ) ) ( not ( = ?auto_430746 ?auto_430748 ) ) ( not ( = ?auto_430746 ?auto_430749 ) ) ( not ( = ?auto_430746 ?auto_430750 ) ) ( not ( = ?auto_430746 ?auto_430751 ) ) ( not ( = ?auto_430746 ?auto_430752 ) ) ( not ( = ?auto_430746 ?auto_430753 ) ) ( not ( = ?auto_430746 ?auto_430754 ) ) ( not ( = ?auto_430746 ?auto_430755 ) ) ( not ( = ?auto_430746 ?auto_430756 ) ) ( not ( = ?auto_430746 ?auto_430757 ) ) ( not ( = ?auto_430746 ?auto_430758 ) ) ( not ( = ?auto_430747 ?auto_430748 ) ) ( not ( = ?auto_430747 ?auto_430749 ) ) ( not ( = ?auto_430747 ?auto_430750 ) ) ( not ( = ?auto_430747 ?auto_430751 ) ) ( not ( = ?auto_430747 ?auto_430752 ) ) ( not ( = ?auto_430747 ?auto_430753 ) ) ( not ( = ?auto_430747 ?auto_430754 ) ) ( not ( = ?auto_430747 ?auto_430755 ) ) ( not ( = ?auto_430747 ?auto_430756 ) ) ( not ( = ?auto_430747 ?auto_430757 ) ) ( not ( = ?auto_430747 ?auto_430758 ) ) ( not ( = ?auto_430748 ?auto_430749 ) ) ( not ( = ?auto_430748 ?auto_430750 ) ) ( not ( = ?auto_430748 ?auto_430751 ) ) ( not ( = ?auto_430748 ?auto_430752 ) ) ( not ( = ?auto_430748 ?auto_430753 ) ) ( not ( = ?auto_430748 ?auto_430754 ) ) ( not ( = ?auto_430748 ?auto_430755 ) ) ( not ( = ?auto_430748 ?auto_430756 ) ) ( not ( = ?auto_430748 ?auto_430757 ) ) ( not ( = ?auto_430748 ?auto_430758 ) ) ( not ( = ?auto_430749 ?auto_430750 ) ) ( not ( = ?auto_430749 ?auto_430751 ) ) ( not ( = ?auto_430749 ?auto_430752 ) ) ( not ( = ?auto_430749 ?auto_430753 ) ) ( not ( = ?auto_430749 ?auto_430754 ) ) ( not ( = ?auto_430749 ?auto_430755 ) ) ( not ( = ?auto_430749 ?auto_430756 ) ) ( not ( = ?auto_430749 ?auto_430757 ) ) ( not ( = ?auto_430749 ?auto_430758 ) ) ( not ( = ?auto_430750 ?auto_430751 ) ) ( not ( = ?auto_430750 ?auto_430752 ) ) ( not ( = ?auto_430750 ?auto_430753 ) ) ( not ( = ?auto_430750 ?auto_430754 ) ) ( not ( = ?auto_430750 ?auto_430755 ) ) ( not ( = ?auto_430750 ?auto_430756 ) ) ( not ( = ?auto_430750 ?auto_430757 ) ) ( not ( = ?auto_430750 ?auto_430758 ) ) ( not ( = ?auto_430751 ?auto_430752 ) ) ( not ( = ?auto_430751 ?auto_430753 ) ) ( not ( = ?auto_430751 ?auto_430754 ) ) ( not ( = ?auto_430751 ?auto_430755 ) ) ( not ( = ?auto_430751 ?auto_430756 ) ) ( not ( = ?auto_430751 ?auto_430757 ) ) ( not ( = ?auto_430751 ?auto_430758 ) ) ( not ( = ?auto_430752 ?auto_430753 ) ) ( not ( = ?auto_430752 ?auto_430754 ) ) ( not ( = ?auto_430752 ?auto_430755 ) ) ( not ( = ?auto_430752 ?auto_430756 ) ) ( not ( = ?auto_430752 ?auto_430757 ) ) ( not ( = ?auto_430752 ?auto_430758 ) ) ( not ( = ?auto_430753 ?auto_430754 ) ) ( not ( = ?auto_430753 ?auto_430755 ) ) ( not ( = ?auto_430753 ?auto_430756 ) ) ( not ( = ?auto_430753 ?auto_430757 ) ) ( not ( = ?auto_430753 ?auto_430758 ) ) ( not ( = ?auto_430754 ?auto_430755 ) ) ( not ( = ?auto_430754 ?auto_430756 ) ) ( not ( = ?auto_430754 ?auto_430757 ) ) ( not ( = ?auto_430754 ?auto_430758 ) ) ( not ( = ?auto_430755 ?auto_430756 ) ) ( not ( = ?auto_430755 ?auto_430757 ) ) ( not ( = ?auto_430755 ?auto_430758 ) ) ( not ( = ?auto_430756 ?auto_430757 ) ) ( not ( = ?auto_430756 ?auto_430758 ) ) ( not ( = ?auto_430757 ?auto_430758 ) ) ( ON ?auto_430756 ?auto_430757 ) ( ON ?auto_430755 ?auto_430756 ) ( CLEAR ?auto_430753 ) ( ON ?auto_430754 ?auto_430755 ) ( CLEAR ?auto_430754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430746 ?auto_430747 ?auto_430748 ?auto_430749 ?auto_430750 ?auto_430751 ?auto_430752 ?auto_430753 ?auto_430754 )
      ( MAKE-12PILE ?auto_430746 ?auto_430747 ?auto_430748 ?auto_430749 ?auto_430750 ?auto_430751 ?auto_430752 ?auto_430753 ?auto_430754 ?auto_430755 ?auto_430756 ?auto_430757 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430771 - BLOCK
      ?auto_430772 - BLOCK
      ?auto_430773 - BLOCK
      ?auto_430774 - BLOCK
      ?auto_430775 - BLOCK
      ?auto_430776 - BLOCK
      ?auto_430777 - BLOCK
      ?auto_430778 - BLOCK
      ?auto_430779 - BLOCK
      ?auto_430780 - BLOCK
      ?auto_430781 - BLOCK
      ?auto_430782 - BLOCK
    )
    :vars
    (
      ?auto_430783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430782 ?auto_430783 ) ( ON-TABLE ?auto_430771 ) ( ON ?auto_430772 ?auto_430771 ) ( ON ?auto_430773 ?auto_430772 ) ( ON ?auto_430774 ?auto_430773 ) ( ON ?auto_430775 ?auto_430774 ) ( ON ?auto_430776 ?auto_430775 ) ( ON ?auto_430777 ?auto_430776 ) ( ON ?auto_430778 ?auto_430777 ) ( not ( = ?auto_430771 ?auto_430772 ) ) ( not ( = ?auto_430771 ?auto_430773 ) ) ( not ( = ?auto_430771 ?auto_430774 ) ) ( not ( = ?auto_430771 ?auto_430775 ) ) ( not ( = ?auto_430771 ?auto_430776 ) ) ( not ( = ?auto_430771 ?auto_430777 ) ) ( not ( = ?auto_430771 ?auto_430778 ) ) ( not ( = ?auto_430771 ?auto_430779 ) ) ( not ( = ?auto_430771 ?auto_430780 ) ) ( not ( = ?auto_430771 ?auto_430781 ) ) ( not ( = ?auto_430771 ?auto_430782 ) ) ( not ( = ?auto_430771 ?auto_430783 ) ) ( not ( = ?auto_430772 ?auto_430773 ) ) ( not ( = ?auto_430772 ?auto_430774 ) ) ( not ( = ?auto_430772 ?auto_430775 ) ) ( not ( = ?auto_430772 ?auto_430776 ) ) ( not ( = ?auto_430772 ?auto_430777 ) ) ( not ( = ?auto_430772 ?auto_430778 ) ) ( not ( = ?auto_430772 ?auto_430779 ) ) ( not ( = ?auto_430772 ?auto_430780 ) ) ( not ( = ?auto_430772 ?auto_430781 ) ) ( not ( = ?auto_430772 ?auto_430782 ) ) ( not ( = ?auto_430772 ?auto_430783 ) ) ( not ( = ?auto_430773 ?auto_430774 ) ) ( not ( = ?auto_430773 ?auto_430775 ) ) ( not ( = ?auto_430773 ?auto_430776 ) ) ( not ( = ?auto_430773 ?auto_430777 ) ) ( not ( = ?auto_430773 ?auto_430778 ) ) ( not ( = ?auto_430773 ?auto_430779 ) ) ( not ( = ?auto_430773 ?auto_430780 ) ) ( not ( = ?auto_430773 ?auto_430781 ) ) ( not ( = ?auto_430773 ?auto_430782 ) ) ( not ( = ?auto_430773 ?auto_430783 ) ) ( not ( = ?auto_430774 ?auto_430775 ) ) ( not ( = ?auto_430774 ?auto_430776 ) ) ( not ( = ?auto_430774 ?auto_430777 ) ) ( not ( = ?auto_430774 ?auto_430778 ) ) ( not ( = ?auto_430774 ?auto_430779 ) ) ( not ( = ?auto_430774 ?auto_430780 ) ) ( not ( = ?auto_430774 ?auto_430781 ) ) ( not ( = ?auto_430774 ?auto_430782 ) ) ( not ( = ?auto_430774 ?auto_430783 ) ) ( not ( = ?auto_430775 ?auto_430776 ) ) ( not ( = ?auto_430775 ?auto_430777 ) ) ( not ( = ?auto_430775 ?auto_430778 ) ) ( not ( = ?auto_430775 ?auto_430779 ) ) ( not ( = ?auto_430775 ?auto_430780 ) ) ( not ( = ?auto_430775 ?auto_430781 ) ) ( not ( = ?auto_430775 ?auto_430782 ) ) ( not ( = ?auto_430775 ?auto_430783 ) ) ( not ( = ?auto_430776 ?auto_430777 ) ) ( not ( = ?auto_430776 ?auto_430778 ) ) ( not ( = ?auto_430776 ?auto_430779 ) ) ( not ( = ?auto_430776 ?auto_430780 ) ) ( not ( = ?auto_430776 ?auto_430781 ) ) ( not ( = ?auto_430776 ?auto_430782 ) ) ( not ( = ?auto_430776 ?auto_430783 ) ) ( not ( = ?auto_430777 ?auto_430778 ) ) ( not ( = ?auto_430777 ?auto_430779 ) ) ( not ( = ?auto_430777 ?auto_430780 ) ) ( not ( = ?auto_430777 ?auto_430781 ) ) ( not ( = ?auto_430777 ?auto_430782 ) ) ( not ( = ?auto_430777 ?auto_430783 ) ) ( not ( = ?auto_430778 ?auto_430779 ) ) ( not ( = ?auto_430778 ?auto_430780 ) ) ( not ( = ?auto_430778 ?auto_430781 ) ) ( not ( = ?auto_430778 ?auto_430782 ) ) ( not ( = ?auto_430778 ?auto_430783 ) ) ( not ( = ?auto_430779 ?auto_430780 ) ) ( not ( = ?auto_430779 ?auto_430781 ) ) ( not ( = ?auto_430779 ?auto_430782 ) ) ( not ( = ?auto_430779 ?auto_430783 ) ) ( not ( = ?auto_430780 ?auto_430781 ) ) ( not ( = ?auto_430780 ?auto_430782 ) ) ( not ( = ?auto_430780 ?auto_430783 ) ) ( not ( = ?auto_430781 ?auto_430782 ) ) ( not ( = ?auto_430781 ?auto_430783 ) ) ( not ( = ?auto_430782 ?auto_430783 ) ) ( ON ?auto_430781 ?auto_430782 ) ( ON ?auto_430780 ?auto_430781 ) ( CLEAR ?auto_430778 ) ( ON ?auto_430779 ?auto_430780 ) ( CLEAR ?auto_430779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430771 ?auto_430772 ?auto_430773 ?auto_430774 ?auto_430775 ?auto_430776 ?auto_430777 ?auto_430778 ?auto_430779 )
      ( MAKE-12PILE ?auto_430771 ?auto_430772 ?auto_430773 ?auto_430774 ?auto_430775 ?auto_430776 ?auto_430777 ?auto_430778 ?auto_430779 ?auto_430780 ?auto_430781 ?auto_430782 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430796 - BLOCK
      ?auto_430797 - BLOCK
      ?auto_430798 - BLOCK
      ?auto_430799 - BLOCK
      ?auto_430800 - BLOCK
      ?auto_430801 - BLOCK
      ?auto_430802 - BLOCK
      ?auto_430803 - BLOCK
      ?auto_430804 - BLOCK
      ?auto_430805 - BLOCK
      ?auto_430806 - BLOCK
      ?auto_430807 - BLOCK
    )
    :vars
    (
      ?auto_430808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430807 ?auto_430808 ) ( ON-TABLE ?auto_430796 ) ( ON ?auto_430797 ?auto_430796 ) ( ON ?auto_430798 ?auto_430797 ) ( ON ?auto_430799 ?auto_430798 ) ( ON ?auto_430800 ?auto_430799 ) ( ON ?auto_430801 ?auto_430800 ) ( ON ?auto_430802 ?auto_430801 ) ( not ( = ?auto_430796 ?auto_430797 ) ) ( not ( = ?auto_430796 ?auto_430798 ) ) ( not ( = ?auto_430796 ?auto_430799 ) ) ( not ( = ?auto_430796 ?auto_430800 ) ) ( not ( = ?auto_430796 ?auto_430801 ) ) ( not ( = ?auto_430796 ?auto_430802 ) ) ( not ( = ?auto_430796 ?auto_430803 ) ) ( not ( = ?auto_430796 ?auto_430804 ) ) ( not ( = ?auto_430796 ?auto_430805 ) ) ( not ( = ?auto_430796 ?auto_430806 ) ) ( not ( = ?auto_430796 ?auto_430807 ) ) ( not ( = ?auto_430796 ?auto_430808 ) ) ( not ( = ?auto_430797 ?auto_430798 ) ) ( not ( = ?auto_430797 ?auto_430799 ) ) ( not ( = ?auto_430797 ?auto_430800 ) ) ( not ( = ?auto_430797 ?auto_430801 ) ) ( not ( = ?auto_430797 ?auto_430802 ) ) ( not ( = ?auto_430797 ?auto_430803 ) ) ( not ( = ?auto_430797 ?auto_430804 ) ) ( not ( = ?auto_430797 ?auto_430805 ) ) ( not ( = ?auto_430797 ?auto_430806 ) ) ( not ( = ?auto_430797 ?auto_430807 ) ) ( not ( = ?auto_430797 ?auto_430808 ) ) ( not ( = ?auto_430798 ?auto_430799 ) ) ( not ( = ?auto_430798 ?auto_430800 ) ) ( not ( = ?auto_430798 ?auto_430801 ) ) ( not ( = ?auto_430798 ?auto_430802 ) ) ( not ( = ?auto_430798 ?auto_430803 ) ) ( not ( = ?auto_430798 ?auto_430804 ) ) ( not ( = ?auto_430798 ?auto_430805 ) ) ( not ( = ?auto_430798 ?auto_430806 ) ) ( not ( = ?auto_430798 ?auto_430807 ) ) ( not ( = ?auto_430798 ?auto_430808 ) ) ( not ( = ?auto_430799 ?auto_430800 ) ) ( not ( = ?auto_430799 ?auto_430801 ) ) ( not ( = ?auto_430799 ?auto_430802 ) ) ( not ( = ?auto_430799 ?auto_430803 ) ) ( not ( = ?auto_430799 ?auto_430804 ) ) ( not ( = ?auto_430799 ?auto_430805 ) ) ( not ( = ?auto_430799 ?auto_430806 ) ) ( not ( = ?auto_430799 ?auto_430807 ) ) ( not ( = ?auto_430799 ?auto_430808 ) ) ( not ( = ?auto_430800 ?auto_430801 ) ) ( not ( = ?auto_430800 ?auto_430802 ) ) ( not ( = ?auto_430800 ?auto_430803 ) ) ( not ( = ?auto_430800 ?auto_430804 ) ) ( not ( = ?auto_430800 ?auto_430805 ) ) ( not ( = ?auto_430800 ?auto_430806 ) ) ( not ( = ?auto_430800 ?auto_430807 ) ) ( not ( = ?auto_430800 ?auto_430808 ) ) ( not ( = ?auto_430801 ?auto_430802 ) ) ( not ( = ?auto_430801 ?auto_430803 ) ) ( not ( = ?auto_430801 ?auto_430804 ) ) ( not ( = ?auto_430801 ?auto_430805 ) ) ( not ( = ?auto_430801 ?auto_430806 ) ) ( not ( = ?auto_430801 ?auto_430807 ) ) ( not ( = ?auto_430801 ?auto_430808 ) ) ( not ( = ?auto_430802 ?auto_430803 ) ) ( not ( = ?auto_430802 ?auto_430804 ) ) ( not ( = ?auto_430802 ?auto_430805 ) ) ( not ( = ?auto_430802 ?auto_430806 ) ) ( not ( = ?auto_430802 ?auto_430807 ) ) ( not ( = ?auto_430802 ?auto_430808 ) ) ( not ( = ?auto_430803 ?auto_430804 ) ) ( not ( = ?auto_430803 ?auto_430805 ) ) ( not ( = ?auto_430803 ?auto_430806 ) ) ( not ( = ?auto_430803 ?auto_430807 ) ) ( not ( = ?auto_430803 ?auto_430808 ) ) ( not ( = ?auto_430804 ?auto_430805 ) ) ( not ( = ?auto_430804 ?auto_430806 ) ) ( not ( = ?auto_430804 ?auto_430807 ) ) ( not ( = ?auto_430804 ?auto_430808 ) ) ( not ( = ?auto_430805 ?auto_430806 ) ) ( not ( = ?auto_430805 ?auto_430807 ) ) ( not ( = ?auto_430805 ?auto_430808 ) ) ( not ( = ?auto_430806 ?auto_430807 ) ) ( not ( = ?auto_430806 ?auto_430808 ) ) ( not ( = ?auto_430807 ?auto_430808 ) ) ( ON ?auto_430806 ?auto_430807 ) ( ON ?auto_430805 ?auto_430806 ) ( ON ?auto_430804 ?auto_430805 ) ( CLEAR ?auto_430802 ) ( ON ?auto_430803 ?auto_430804 ) ( CLEAR ?auto_430803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430796 ?auto_430797 ?auto_430798 ?auto_430799 ?auto_430800 ?auto_430801 ?auto_430802 ?auto_430803 )
      ( MAKE-12PILE ?auto_430796 ?auto_430797 ?auto_430798 ?auto_430799 ?auto_430800 ?auto_430801 ?auto_430802 ?auto_430803 ?auto_430804 ?auto_430805 ?auto_430806 ?auto_430807 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430821 - BLOCK
      ?auto_430822 - BLOCK
      ?auto_430823 - BLOCK
      ?auto_430824 - BLOCK
      ?auto_430825 - BLOCK
      ?auto_430826 - BLOCK
      ?auto_430827 - BLOCK
      ?auto_430828 - BLOCK
      ?auto_430829 - BLOCK
      ?auto_430830 - BLOCK
      ?auto_430831 - BLOCK
      ?auto_430832 - BLOCK
    )
    :vars
    (
      ?auto_430833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430832 ?auto_430833 ) ( ON-TABLE ?auto_430821 ) ( ON ?auto_430822 ?auto_430821 ) ( ON ?auto_430823 ?auto_430822 ) ( ON ?auto_430824 ?auto_430823 ) ( ON ?auto_430825 ?auto_430824 ) ( ON ?auto_430826 ?auto_430825 ) ( ON ?auto_430827 ?auto_430826 ) ( not ( = ?auto_430821 ?auto_430822 ) ) ( not ( = ?auto_430821 ?auto_430823 ) ) ( not ( = ?auto_430821 ?auto_430824 ) ) ( not ( = ?auto_430821 ?auto_430825 ) ) ( not ( = ?auto_430821 ?auto_430826 ) ) ( not ( = ?auto_430821 ?auto_430827 ) ) ( not ( = ?auto_430821 ?auto_430828 ) ) ( not ( = ?auto_430821 ?auto_430829 ) ) ( not ( = ?auto_430821 ?auto_430830 ) ) ( not ( = ?auto_430821 ?auto_430831 ) ) ( not ( = ?auto_430821 ?auto_430832 ) ) ( not ( = ?auto_430821 ?auto_430833 ) ) ( not ( = ?auto_430822 ?auto_430823 ) ) ( not ( = ?auto_430822 ?auto_430824 ) ) ( not ( = ?auto_430822 ?auto_430825 ) ) ( not ( = ?auto_430822 ?auto_430826 ) ) ( not ( = ?auto_430822 ?auto_430827 ) ) ( not ( = ?auto_430822 ?auto_430828 ) ) ( not ( = ?auto_430822 ?auto_430829 ) ) ( not ( = ?auto_430822 ?auto_430830 ) ) ( not ( = ?auto_430822 ?auto_430831 ) ) ( not ( = ?auto_430822 ?auto_430832 ) ) ( not ( = ?auto_430822 ?auto_430833 ) ) ( not ( = ?auto_430823 ?auto_430824 ) ) ( not ( = ?auto_430823 ?auto_430825 ) ) ( not ( = ?auto_430823 ?auto_430826 ) ) ( not ( = ?auto_430823 ?auto_430827 ) ) ( not ( = ?auto_430823 ?auto_430828 ) ) ( not ( = ?auto_430823 ?auto_430829 ) ) ( not ( = ?auto_430823 ?auto_430830 ) ) ( not ( = ?auto_430823 ?auto_430831 ) ) ( not ( = ?auto_430823 ?auto_430832 ) ) ( not ( = ?auto_430823 ?auto_430833 ) ) ( not ( = ?auto_430824 ?auto_430825 ) ) ( not ( = ?auto_430824 ?auto_430826 ) ) ( not ( = ?auto_430824 ?auto_430827 ) ) ( not ( = ?auto_430824 ?auto_430828 ) ) ( not ( = ?auto_430824 ?auto_430829 ) ) ( not ( = ?auto_430824 ?auto_430830 ) ) ( not ( = ?auto_430824 ?auto_430831 ) ) ( not ( = ?auto_430824 ?auto_430832 ) ) ( not ( = ?auto_430824 ?auto_430833 ) ) ( not ( = ?auto_430825 ?auto_430826 ) ) ( not ( = ?auto_430825 ?auto_430827 ) ) ( not ( = ?auto_430825 ?auto_430828 ) ) ( not ( = ?auto_430825 ?auto_430829 ) ) ( not ( = ?auto_430825 ?auto_430830 ) ) ( not ( = ?auto_430825 ?auto_430831 ) ) ( not ( = ?auto_430825 ?auto_430832 ) ) ( not ( = ?auto_430825 ?auto_430833 ) ) ( not ( = ?auto_430826 ?auto_430827 ) ) ( not ( = ?auto_430826 ?auto_430828 ) ) ( not ( = ?auto_430826 ?auto_430829 ) ) ( not ( = ?auto_430826 ?auto_430830 ) ) ( not ( = ?auto_430826 ?auto_430831 ) ) ( not ( = ?auto_430826 ?auto_430832 ) ) ( not ( = ?auto_430826 ?auto_430833 ) ) ( not ( = ?auto_430827 ?auto_430828 ) ) ( not ( = ?auto_430827 ?auto_430829 ) ) ( not ( = ?auto_430827 ?auto_430830 ) ) ( not ( = ?auto_430827 ?auto_430831 ) ) ( not ( = ?auto_430827 ?auto_430832 ) ) ( not ( = ?auto_430827 ?auto_430833 ) ) ( not ( = ?auto_430828 ?auto_430829 ) ) ( not ( = ?auto_430828 ?auto_430830 ) ) ( not ( = ?auto_430828 ?auto_430831 ) ) ( not ( = ?auto_430828 ?auto_430832 ) ) ( not ( = ?auto_430828 ?auto_430833 ) ) ( not ( = ?auto_430829 ?auto_430830 ) ) ( not ( = ?auto_430829 ?auto_430831 ) ) ( not ( = ?auto_430829 ?auto_430832 ) ) ( not ( = ?auto_430829 ?auto_430833 ) ) ( not ( = ?auto_430830 ?auto_430831 ) ) ( not ( = ?auto_430830 ?auto_430832 ) ) ( not ( = ?auto_430830 ?auto_430833 ) ) ( not ( = ?auto_430831 ?auto_430832 ) ) ( not ( = ?auto_430831 ?auto_430833 ) ) ( not ( = ?auto_430832 ?auto_430833 ) ) ( ON ?auto_430831 ?auto_430832 ) ( ON ?auto_430830 ?auto_430831 ) ( ON ?auto_430829 ?auto_430830 ) ( CLEAR ?auto_430827 ) ( ON ?auto_430828 ?auto_430829 ) ( CLEAR ?auto_430828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430821 ?auto_430822 ?auto_430823 ?auto_430824 ?auto_430825 ?auto_430826 ?auto_430827 ?auto_430828 )
      ( MAKE-12PILE ?auto_430821 ?auto_430822 ?auto_430823 ?auto_430824 ?auto_430825 ?auto_430826 ?auto_430827 ?auto_430828 ?auto_430829 ?auto_430830 ?auto_430831 ?auto_430832 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430846 - BLOCK
      ?auto_430847 - BLOCK
      ?auto_430848 - BLOCK
      ?auto_430849 - BLOCK
      ?auto_430850 - BLOCK
      ?auto_430851 - BLOCK
      ?auto_430852 - BLOCK
      ?auto_430853 - BLOCK
      ?auto_430854 - BLOCK
      ?auto_430855 - BLOCK
      ?auto_430856 - BLOCK
      ?auto_430857 - BLOCK
    )
    :vars
    (
      ?auto_430858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430857 ?auto_430858 ) ( ON-TABLE ?auto_430846 ) ( ON ?auto_430847 ?auto_430846 ) ( ON ?auto_430848 ?auto_430847 ) ( ON ?auto_430849 ?auto_430848 ) ( ON ?auto_430850 ?auto_430849 ) ( ON ?auto_430851 ?auto_430850 ) ( not ( = ?auto_430846 ?auto_430847 ) ) ( not ( = ?auto_430846 ?auto_430848 ) ) ( not ( = ?auto_430846 ?auto_430849 ) ) ( not ( = ?auto_430846 ?auto_430850 ) ) ( not ( = ?auto_430846 ?auto_430851 ) ) ( not ( = ?auto_430846 ?auto_430852 ) ) ( not ( = ?auto_430846 ?auto_430853 ) ) ( not ( = ?auto_430846 ?auto_430854 ) ) ( not ( = ?auto_430846 ?auto_430855 ) ) ( not ( = ?auto_430846 ?auto_430856 ) ) ( not ( = ?auto_430846 ?auto_430857 ) ) ( not ( = ?auto_430846 ?auto_430858 ) ) ( not ( = ?auto_430847 ?auto_430848 ) ) ( not ( = ?auto_430847 ?auto_430849 ) ) ( not ( = ?auto_430847 ?auto_430850 ) ) ( not ( = ?auto_430847 ?auto_430851 ) ) ( not ( = ?auto_430847 ?auto_430852 ) ) ( not ( = ?auto_430847 ?auto_430853 ) ) ( not ( = ?auto_430847 ?auto_430854 ) ) ( not ( = ?auto_430847 ?auto_430855 ) ) ( not ( = ?auto_430847 ?auto_430856 ) ) ( not ( = ?auto_430847 ?auto_430857 ) ) ( not ( = ?auto_430847 ?auto_430858 ) ) ( not ( = ?auto_430848 ?auto_430849 ) ) ( not ( = ?auto_430848 ?auto_430850 ) ) ( not ( = ?auto_430848 ?auto_430851 ) ) ( not ( = ?auto_430848 ?auto_430852 ) ) ( not ( = ?auto_430848 ?auto_430853 ) ) ( not ( = ?auto_430848 ?auto_430854 ) ) ( not ( = ?auto_430848 ?auto_430855 ) ) ( not ( = ?auto_430848 ?auto_430856 ) ) ( not ( = ?auto_430848 ?auto_430857 ) ) ( not ( = ?auto_430848 ?auto_430858 ) ) ( not ( = ?auto_430849 ?auto_430850 ) ) ( not ( = ?auto_430849 ?auto_430851 ) ) ( not ( = ?auto_430849 ?auto_430852 ) ) ( not ( = ?auto_430849 ?auto_430853 ) ) ( not ( = ?auto_430849 ?auto_430854 ) ) ( not ( = ?auto_430849 ?auto_430855 ) ) ( not ( = ?auto_430849 ?auto_430856 ) ) ( not ( = ?auto_430849 ?auto_430857 ) ) ( not ( = ?auto_430849 ?auto_430858 ) ) ( not ( = ?auto_430850 ?auto_430851 ) ) ( not ( = ?auto_430850 ?auto_430852 ) ) ( not ( = ?auto_430850 ?auto_430853 ) ) ( not ( = ?auto_430850 ?auto_430854 ) ) ( not ( = ?auto_430850 ?auto_430855 ) ) ( not ( = ?auto_430850 ?auto_430856 ) ) ( not ( = ?auto_430850 ?auto_430857 ) ) ( not ( = ?auto_430850 ?auto_430858 ) ) ( not ( = ?auto_430851 ?auto_430852 ) ) ( not ( = ?auto_430851 ?auto_430853 ) ) ( not ( = ?auto_430851 ?auto_430854 ) ) ( not ( = ?auto_430851 ?auto_430855 ) ) ( not ( = ?auto_430851 ?auto_430856 ) ) ( not ( = ?auto_430851 ?auto_430857 ) ) ( not ( = ?auto_430851 ?auto_430858 ) ) ( not ( = ?auto_430852 ?auto_430853 ) ) ( not ( = ?auto_430852 ?auto_430854 ) ) ( not ( = ?auto_430852 ?auto_430855 ) ) ( not ( = ?auto_430852 ?auto_430856 ) ) ( not ( = ?auto_430852 ?auto_430857 ) ) ( not ( = ?auto_430852 ?auto_430858 ) ) ( not ( = ?auto_430853 ?auto_430854 ) ) ( not ( = ?auto_430853 ?auto_430855 ) ) ( not ( = ?auto_430853 ?auto_430856 ) ) ( not ( = ?auto_430853 ?auto_430857 ) ) ( not ( = ?auto_430853 ?auto_430858 ) ) ( not ( = ?auto_430854 ?auto_430855 ) ) ( not ( = ?auto_430854 ?auto_430856 ) ) ( not ( = ?auto_430854 ?auto_430857 ) ) ( not ( = ?auto_430854 ?auto_430858 ) ) ( not ( = ?auto_430855 ?auto_430856 ) ) ( not ( = ?auto_430855 ?auto_430857 ) ) ( not ( = ?auto_430855 ?auto_430858 ) ) ( not ( = ?auto_430856 ?auto_430857 ) ) ( not ( = ?auto_430856 ?auto_430858 ) ) ( not ( = ?auto_430857 ?auto_430858 ) ) ( ON ?auto_430856 ?auto_430857 ) ( ON ?auto_430855 ?auto_430856 ) ( ON ?auto_430854 ?auto_430855 ) ( ON ?auto_430853 ?auto_430854 ) ( CLEAR ?auto_430851 ) ( ON ?auto_430852 ?auto_430853 ) ( CLEAR ?auto_430852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430846 ?auto_430847 ?auto_430848 ?auto_430849 ?auto_430850 ?auto_430851 ?auto_430852 )
      ( MAKE-12PILE ?auto_430846 ?auto_430847 ?auto_430848 ?auto_430849 ?auto_430850 ?auto_430851 ?auto_430852 ?auto_430853 ?auto_430854 ?auto_430855 ?auto_430856 ?auto_430857 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430871 - BLOCK
      ?auto_430872 - BLOCK
      ?auto_430873 - BLOCK
      ?auto_430874 - BLOCK
      ?auto_430875 - BLOCK
      ?auto_430876 - BLOCK
      ?auto_430877 - BLOCK
      ?auto_430878 - BLOCK
      ?auto_430879 - BLOCK
      ?auto_430880 - BLOCK
      ?auto_430881 - BLOCK
      ?auto_430882 - BLOCK
    )
    :vars
    (
      ?auto_430883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430882 ?auto_430883 ) ( ON-TABLE ?auto_430871 ) ( ON ?auto_430872 ?auto_430871 ) ( ON ?auto_430873 ?auto_430872 ) ( ON ?auto_430874 ?auto_430873 ) ( ON ?auto_430875 ?auto_430874 ) ( ON ?auto_430876 ?auto_430875 ) ( not ( = ?auto_430871 ?auto_430872 ) ) ( not ( = ?auto_430871 ?auto_430873 ) ) ( not ( = ?auto_430871 ?auto_430874 ) ) ( not ( = ?auto_430871 ?auto_430875 ) ) ( not ( = ?auto_430871 ?auto_430876 ) ) ( not ( = ?auto_430871 ?auto_430877 ) ) ( not ( = ?auto_430871 ?auto_430878 ) ) ( not ( = ?auto_430871 ?auto_430879 ) ) ( not ( = ?auto_430871 ?auto_430880 ) ) ( not ( = ?auto_430871 ?auto_430881 ) ) ( not ( = ?auto_430871 ?auto_430882 ) ) ( not ( = ?auto_430871 ?auto_430883 ) ) ( not ( = ?auto_430872 ?auto_430873 ) ) ( not ( = ?auto_430872 ?auto_430874 ) ) ( not ( = ?auto_430872 ?auto_430875 ) ) ( not ( = ?auto_430872 ?auto_430876 ) ) ( not ( = ?auto_430872 ?auto_430877 ) ) ( not ( = ?auto_430872 ?auto_430878 ) ) ( not ( = ?auto_430872 ?auto_430879 ) ) ( not ( = ?auto_430872 ?auto_430880 ) ) ( not ( = ?auto_430872 ?auto_430881 ) ) ( not ( = ?auto_430872 ?auto_430882 ) ) ( not ( = ?auto_430872 ?auto_430883 ) ) ( not ( = ?auto_430873 ?auto_430874 ) ) ( not ( = ?auto_430873 ?auto_430875 ) ) ( not ( = ?auto_430873 ?auto_430876 ) ) ( not ( = ?auto_430873 ?auto_430877 ) ) ( not ( = ?auto_430873 ?auto_430878 ) ) ( not ( = ?auto_430873 ?auto_430879 ) ) ( not ( = ?auto_430873 ?auto_430880 ) ) ( not ( = ?auto_430873 ?auto_430881 ) ) ( not ( = ?auto_430873 ?auto_430882 ) ) ( not ( = ?auto_430873 ?auto_430883 ) ) ( not ( = ?auto_430874 ?auto_430875 ) ) ( not ( = ?auto_430874 ?auto_430876 ) ) ( not ( = ?auto_430874 ?auto_430877 ) ) ( not ( = ?auto_430874 ?auto_430878 ) ) ( not ( = ?auto_430874 ?auto_430879 ) ) ( not ( = ?auto_430874 ?auto_430880 ) ) ( not ( = ?auto_430874 ?auto_430881 ) ) ( not ( = ?auto_430874 ?auto_430882 ) ) ( not ( = ?auto_430874 ?auto_430883 ) ) ( not ( = ?auto_430875 ?auto_430876 ) ) ( not ( = ?auto_430875 ?auto_430877 ) ) ( not ( = ?auto_430875 ?auto_430878 ) ) ( not ( = ?auto_430875 ?auto_430879 ) ) ( not ( = ?auto_430875 ?auto_430880 ) ) ( not ( = ?auto_430875 ?auto_430881 ) ) ( not ( = ?auto_430875 ?auto_430882 ) ) ( not ( = ?auto_430875 ?auto_430883 ) ) ( not ( = ?auto_430876 ?auto_430877 ) ) ( not ( = ?auto_430876 ?auto_430878 ) ) ( not ( = ?auto_430876 ?auto_430879 ) ) ( not ( = ?auto_430876 ?auto_430880 ) ) ( not ( = ?auto_430876 ?auto_430881 ) ) ( not ( = ?auto_430876 ?auto_430882 ) ) ( not ( = ?auto_430876 ?auto_430883 ) ) ( not ( = ?auto_430877 ?auto_430878 ) ) ( not ( = ?auto_430877 ?auto_430879 ) ) ( not ( = ?auto_430877 ?auto_430880 ) ) ( not ( = ?auto_430877 ?auto_430881 ) ) ( not ( = ?auto_430877 ?auto_430882 ) ) ( not ( = ?auto_430877 ?auto_430883 ) ) ( not ( = ?auto_430878 ?auto_430879 ) ) ( not ( = ?auto_430878 ?auto_430880 ) ) ( not ( = ?auto_430878 ?auto_430881 ) ) ( not ( = ?auto_430878 ?auto_430882 ) ) ( not ( = ?auto_430878 ?auto_430883 ) ) ( not ( = ?auto_430879 ?auto_430880 ) ) ( not ( = ?auto_430879 ?auto_430881 ) ) ( not ( = ?auto_430879 ?auto_430882 ) ) ( not ( = ?auto_430879 ?auto_430883 ) ) ( not ( = ?auto_430880 ?auto_430881 ) ) ( not ( = ?auto_430880 ?auto_430882 ) ) ( not ( = ?auto_430880 ?auto_430883 ) ) ( not ( = ?auto_430881 ?auto_430882 ) ) ( not ( = ?auto_430881 ?auto_430883 ) ) ( not ( = ?auto_430882 ?auto_430883 ) ) ( ON ?auto_430881 ?auto_430882 ) ( ON ?auto_430880 ?auto_430881 ) ( ON ?auto_430879 ?auto_430880 ) ( ON ?auto_430878 ?auto_430879 ) ( CLEAR ?auto_430876 ) ( ON ?auto_430877 ?auto_430878 ) ( CLEAR ?auto_430877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430871 ?auto_430872 ?auto_430873 ?auto_430874 ?auto_430875 ?auto_430876 ?auto_430877 )
      ( MAKE-12PILE ?auto_430871 ?auto_430872 ?auto_430873 ?auto_430874 ?auto_430875 ?auto_430876 ?auto_430877 ?auto_430878 ?auto_430879 ?auto_430880 ?auto_430881 ?auto_430882 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430896 - BLOCK
      ?auto_430897 - BLOCK
      ?auto_430898 - BLOCK
      ?auto_430899 - BLOCK
      ?auto_430900 - BLOCK
      ?auto_430901 - BLOCK
      ?auto_430902 - BLOCK
      ?auto_430903 - BLOCK
      ?auto_430904 - BLOCK
      ?auto_430905 - BLOCK
      ?auto_430906 - BLOCK
      ?auto_430907 - BLOCK
    )
    :vars
    (
      ?auto_430908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430907 ?auto_430908 ) ( ON-TABLE ?auto_430896 ) ( ON ?auto_430897 ?auto_430896 ) ( ON ?auto_430898 ?auto_430897 ) ( ON ?auto_430899 ?auto_430898 ) ( ON ?auto_430900 ?auto_430899 ) ( not ( = ?auto_430896 ?auto_430897 ) ) ( not ( = ?auto_430896 ?auto_430898 ) ) ( not ( = ?auto_430896 ?auto_430899 ) ) ( not ( = ?auto_430896 ?auto_430900 ) ) ( not ( = ?auto_430896 ?auto_430901 ) ) ( not ( = ?auto_430896 ?auto_430902 ) ) ( not ( = ?auto_430896 ?auto_430903 ) ) ( not ( = ?auto_430896 ?auto_430904 ) ) ( not ( = ?auto_430896 ?auto_430905 ) ) ( not ( = ?auto_430896 ?auto_430906 ) ) ( not ( = ?auto_430896 ?auto_430907 ) ) ( not ( = ?auto_430896 ?auto_430908 ) ) ( not ( = ?auto_430897 ?auto_430898 ) ) ( not ( = ?auto_430897 ?auto_430899 ) ) ( not ( = ?auto_430897 ?auto_430900 ) ) ( not ( = ?auto_430897 ?auto_430901 ) ) ( not ( = ?auto_430897 ?auto_430902 ) ) ( not ( = ?auto_430897 ?auto_430903 ) ) ( not ( = ?auto_430897 ?auto_430904 ) ) ( not ( = ?auto_430897 ?auto_430905 ) ) ( not ( = ?auto_430897 ?auto_430906 ) ) ( not ( = ?auto_430897 ?auto_430907 ) ) ( not ( = ?auto_430897 ?auto_430908 ) ) ( not ( = ?auto_430898 ?auto_430899 ) ) ( not ( = ?auto_430898 ?auto_430900 ) ) ( not ( = ?auto_430898 ?auto_430901 ) ) ( not ( = ?auto_430898 ?auto_430902 ) ) ( not ( = ?auto_430898 ?auto_430903 ) ) ( not ( = ?auto_430898 ?auto_430904 ) ) ( not ( = ?auto_430898 ?auto_430905 ) ) ( not ( = ?auto_430898 ?auto_430906 ) ) ( not ( = ?auto_430898 ?auto_430907 ) ) ( not ( = ?auto_430898 ?auto_430908 ) ) ( not ( = ?auto_430899 ?auto_430900 ) ) ( not ( = ?auto_430899 ?auto_430901 ) ) ( not ( = ?auto_430899 ?auto_430902 ) ) ( not ( = ?auto_430899 ?auto_430903 ) ) ( not ( = ?auto_430899 ?auto_430904 ) ) ( not ( = ?auto_430899 ?auto_430905 ) ) ( not ( = ?auto_430899 ?auto_430906 ) ) ( not ( = ?auto_430899 ?auto_430907 ) ) ( not ( = ?auto_430899 ?auto_430908 ) ) ( not ( = ?auto_430900 ?auto_430901 ) ) ( not ( = ?auto_430900 ?auto_430902 ) ) ( not ( = ?auto_430900 ?auto_430903 ) ) ( not ( = ?auto_430900 ?auto_430904 ) ) ( not ( = ?auto_430900 ?auto_430905 ) ) ( not ( = ?auto_430900 ?auto_430906 ) ) ( not ( = ?auto_430900 ?auto_430907 ) ) ( not ( = ?auto_430900 ?auto_430908 ) ) ( not ( = ?auto_430901 ?auto_430902 ) ) ( not ( = ?auto_430901 ?auto_430903 ) ) ( not ( = ?auto_430901 ?auto_430904 ) ) ( not ( = ?auto_430901 ?auto_430905 ) ) ( not ( = ?auto_430901 ?auto_430906 ) ) ( not ( = ?auto_430901 ?auto_430907 ) ) ( not ( = ?auto_430901 ?auto_430908 ) ) ( not ( = ?auto_430902 ?auto_430903 ) ) ( not ( = ?auto_430902 ?auto_430904 ) ) ( not ( = ?auto_430902 ?auto_430905 ) ) ( not ( = ?auto_430902 ?auto_430906 ) ) ( not ( = ?auto_430902 ?auto_430907 ) ) ( not ( = ?auto_430902 ?auto_430908 ) ) ( not ( = ?auto_430903 ?auto_430904 ) ) ( not ( = ?auto_430903 ?auto_430905 ) ) ( not ( = ?auto_430903 ?auto_430906 ) ) ( not ( = ?auto_430903 ?auto_430907 ) ) ( not ( = ?auto_430903 ?auto_430908 ) ) ( not ( = ?auto_430904 ?auto_430905 ) ) ( not ( = ?auto_430904 ?auto_430906 ) ) ( not ( = ?auto_430904 ?auto_430907 ) ) ( not ( = ?auto_430904 ?auto_430908 ) ) ( not ( = ?auto_430905 ?auto_430906 ) ) ( not ( = ?auto_430905 ?auto_430907 ) ) ( not ( = ?auto_430905 ?auto_430908 ) ) ( not ( = ?auto_430906 ?auto_430907 ) ) ( not ( = ?auto_430906 ?auto_430908 ) ) ( not ( = ?auto_430907 ?auto_430908 ) ) ( ON ?auto_430906 ?auto_430907 ) ( ON ?auto_430905 ?auto_430906 ) ( ON ?auto_430904 ?auto_430905 ) ( ON ?auto_430903 ?auto_430904 ) ( ON ?auto_430902 ?auto_430903 ) ( CLEAR ?auto_430900 ) ( ON ?auto_430901 ?auto_430902 ) ( CLEAR ?auto_430901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430896 ?auto_430897 ?auto_430898 ?auto_430899 ?auto_430900 ?auto_430901 )
      ( MAKE-12PILE ?auto_430896 ?auto_430897 ?auto_430898 ?auto_430899 ?auto_430900 ?auto_430901 ?auto_430902 ?auto_430903 ?auto_430904 ?auto_430905 ?auto_430906 ?auto_430907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430921 - BLOCK
      ?auto_430922 - BLOCK
      ?auto_430923 - BLOCK
      ?auto_430924 - BLOCK
      ?auto_430925 - BLOCK
      ?auto_430926 - BLOCK
      ?auto_430927 - BLOCK
      ?auto_430928 - BLOCK
      ?auto_430929 - BLOCK
      ?auto_430930 - BLOCK
      ?auto_430931 - BLOCK
      ?auto_430932 - BLOCK
    )
    :vars
    (
      ?auto_430933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430932 ?auto_430933 ) ( ON-TABLE ?auto_430921 ) ( ON ?auto_430922 ?auto_430921 ) ( ON ?auto_430923 ?auto_430922 ) ( ON ?auto_430924 ?auto_430923 ) ( ON ?auto_430925 ?auto_430924 ) ( not ( = ?auto_430921 ?auto_430922 ) ) ( not ( = ?auto_430921 ?auto_430923 ) ) ( not ( = ?auto_430921 ?auto_430924 ) ) ( not ( = ?auto_430921 ?auto_430925 ) ) ( not ( = ?auto_430921 ?auto_430926 ) ) ( not ( = ?auto_430921 ?auto_430927 ) ) ( not ( = ?auto_430921 ?auto_430928 ) ) ( not ( = ?auto_430921 ?auto_430929 ) ) ( not ( = ?auto_430921 ?auto_430930 ) ) ( not ( = ?auto_430921 ?auto_430931 ) ) ( not ( = ?auto_430921 ?auto_430932 ) ) ( not ( = ?auto_430921 ?auto_430933 ) ) ( not ( = ?auto_430922 ?auto_430923 ) ) ( not ( = ?auto_430922 ?auto_430924 ) ) ( not ( = ?auto_430922 ?auto_430925 ) ) ( not ( = ?auto_430922 ?auto_430926 ) ) ( not ( = ?auto_430922 ?auto_430927 ) ) ( not ( = ?auto_430922 ?auto_430928 ) ) ( not ( = ?auto_430922 ?auto_430929 ) ) ( not ( = ?auto_430922 ?auto_430930 ) ) ( not ( = ?auto_430922 ?auto_430931 ) ) ( not ( = ?auto_430922 ?auto_430932 ) ) ( not ( = ?auto_430922 ?auto_430933 ) ) ( not ( = ?auto_430923 ?auto_430924 ) ) ( not ( = ?auto_430923 ?auto_430925 ) ) ( not ( = ?auto_430923 ?auto_430926 ) ) ( not ( = ?auto_430923 ?auto_430927 ) ) ( not ( = ?auto_430923 ?auto_430928 ) ) ( not ( = ?auto_430923 ?auto_430929 ) ) ( not ( = ?auto_430923 ?auto_430930 ) ) ( not ( = ?auto_430923 ?auto_430931 ) ) ( not ( = ?auto_430923 ?auto_430932 ) ) ( not ( = ?auto_430923 ?auto_430933 ) ) ( not ( = ?auto_430924 ?auto_430925 ) ) ( not ( = ?auto_430924 ?auto_430926 ) ) ( not ( = ?auto_430924 ?auto_430927 ) ) ( not ( = ?auto_430924 ?auto_430928 ) ) ( not ( = ?auto_430924 ?auto_430929 ) ) ( not ( = ?auto_430924 ?auto_430930 ) ) ( not ( = ?auto_430924 ?auto_430931 ) ) ( not ( = ?auto_430924 ?auto_430932 ) ) ( not ( = ?auto_430924 ?auto_430933 ) ) ( not ( = ?auto_430925 ?auto_430926 ) ) ( not ( = ?auto_430925 ?auto_430927 ) ) ( not ( = ?auto_430925 ?auto_430928 ) ) ( not ( = ?auto_430925 ?auto_430929 ) ) ( not ( = ?auto_430925 ?auto_430930 ) ) ( not ( = ?auto_430925 ?auto_430931 ) ) ( not ( = ?auto_430925 ?auto_430932 ) ) ( not ( = ?auto_430925 ?auto_430933 ) ) ( not ( = ?auto_430926 ?auto_430927 ) ) ( not ( = ?auto_430926 ?auto_430928 ) ) ( not ( = ?auto_430926 ?auto_430929 ) ) ( not ( = ?auto_430926 ?auto_430930 ) ) ( not ( = ?auto_430926 ?auto_430931 ) ) ( not ( = ?auto_430926 ?auto_430932 ) ) ( not ( = ?auto_430926 ?auto_430933 ) ) ( not ( = ?auto_430927 ?auto_430928 ) ) ( not ( = ?auto_430927 ?auto_430929 ) ) ( not ( = ?auto_430927 ?auto_430930 ) ) ( not ( = ?auto_430927 ?auto_430931 ) ) ( not ( = ?auto_430927 ?auto_430932 ) ) ( not ( = ?auto_430927 ?auto_430933 ) ) ( not ( = ?auto_430928 ?auto_430929 ) ) ( not ( = ?auto_430928 ?auto_430930 ) ) ( not ( = ?auto_430928 ?auto_430931 ) ) ( not ( = ?auto_430928 ?auto_430932 ) ) ( not ( = ?auto_430928 ?auto_430933 ) ) ( not ( = ?auto_430929 ?auto_430930 ) ) ( not ( = ?auto_430929 ?auto_430931 ) ) ( not ( = ?auto_430929 ?auto_430932 ) ) ( not ( = ?auto_430929 ?auto_430933 ) ) ( not ( = ?auto_430930 ?auto_430931 ) ) ( not ( = ?auto_430930 ?auto_430932 ) ) ( not ( = ?auto_430930 ?auto_430933 ) ) ( not ( = ?auto_430931 ?auto_430932 ) ) ( not ( = ?auto_430931 ?auto_430933 ) ) ( not ( = ?auto_430932 ?auto_430933 ) ) ( ON ?auto_430931 ?auto_430932 ) ( ON ?auto_430930 ?auto_430931 ) ( ON ?auto_430929 ?auto_430930 ) ( ON ?auto_430928 ?auto_430929 ) ( ON ?auto_430927 ?auto_430928 ) ( CLEAR ?auto_430925 ) ( ON ?auto_430926 ?auto_430927 ) ( CLEAR ?auto_430926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430921 ?auto_430922 ?auto_430923 ?auto_430924 ?auto_430925 ?auto_430926 )
      ( MAKE-12PILE ?auto_430921 ?auto_430922 ?auto_430923 ?auto_430924 ?auto_430925 ?auto_430926 ?auto_430927 ?auto_430928 ?auto_430929 ?auto_430930 ?auto_430931 ?auto_430932 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430946 - BLOCK
      ?auto_430947 - BLOCK
      ?auto_430948 - BLOCK
      ?auto_430949 - BLOCK
      ?auto_430950 - BLOCK
      ?auto_430951 - BLOCK
      ?auto_430952 - BLOCK
      ?auto_430953 - BLOCK
      ?auto_430954 - BLOCK
      ?auto_430955 - BLOCK
      ?auto_430956 - BLOCK
      ?auto_430957 - BLOCK
    )
    :vars
    (
      ?auto_430958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430957 ?auto_430958 ) ( ON-TABLE ?auto_430946 ) ( ON ?auto_430947 ?auto_430946 ) ( ON ?auto_430948 ?auto_430947 ) ( ON ?auto_430949 ?auto_430948 ) ( not ( = ?auto_430946 ?auto_430947 ) ) ( not ( = ?auto_430946 ?auto_430948 ) ) ( not ( = ?auto_430946 ?auto_430949 ) ) ( not ( = ?auto_430946 ?auto_430950 ) ) ( not ( = ?auto_430946 ?auto_430951 ) ) ( not ( = ?auto_430946 ?auto_430952 ) ) ( not ( = ?auto_430946 ?auto_430953 ) ) ( not ( = ?auto_430946 ?auto_430954 ) ) ( not ( = ?auto_430946 ?auto_430955 ) ) ( not ( = ?auto_430946 ?auto_430956 ) ) ( not ( = ?auto_430946 ?auto_430957 ) ) ( not ( = ?auto_430946 ?auto_430958 ) ) ( not ( = ?auto_430947 ?auto_430948 ) ) ( not ( = ?auto_430947 ?auto_430949 ) ) ( not ( = ?auto_430947 ?auto_430950 ) ) ( not ( = ?auto_430947 ?auto_430951 ) ) ( not ( = ?auto_430947 ?auto_430952 ) ) ( not ( = ?auto_430947 ?auto_430953 ) ) ( not ( = ?auto_430947 ?auto_430954 ) ) ( not ( = ?auto_430947 ?auto_430955 ) ) ( not ( = ?auto_430947 ?auto_430956 ) ) ( not ( = ?auto_430947 ?auto_430957 ) ) ( not ( = ?auto_430947 ?auto_430958 ) ) ( not ( = ?auto_430948 ?auto_430949 ) ) ( not ( = ?auto_430948 ?auto_430950 ) ) ( not ( = ?auto_430948 ?auto_430951 ) ) ( not ( = ?auto_430948 ?auto_430952 ) ) ( not ( = ?auto_430948 ?auto_430953 ) ) ( not ( = ?auto_430948 ?auto_430954 ) ) ( not ( = ?auto_430948 ?auto_430955 ) ) ( not ( = ?auto_430948 ?auto_430956 ) ) ( not ( = ?auto_430948 ?auto_430957 ) ) ( not ( = ?auto_430948 ?auto_430958 ) ) ( not ( = ?auto_430949 ?auto_430950 ) ) ( not ( = ?auto_430949 ?auto_430951 ) ) ( not ( = ?auto_430949 ?auto_430952 ) ) ( not ( = ?auto_430949 ?auto_430953 ) ) ( not ( = ?auto_430949 ?auto_430954 ) ) ( not ( = ?auto_430949 ?auto_430955 ) ) ( not ( = ?auto_430949 ?auto_430956 ) ) ( not ( = ?auto_430949 ?auto_430957 ) ) ( not ( = ?auto_430949 ?auto_430958 ) ) ( not ( = ?auto_430950 ?auto_430951 ) ) ( not ( = ?auto_430950 ?auto_430952 ) ) ( not ( = ?auto_430950 ?auto_430953 ) ) ( not ( = ?auto_430950 ?auto_430954 ) ) ( not ( = ?auto_430950 ?auto_430955 ) ) ( not ( = ?auto_430950 ?auto_430956 ) ) ( not ( = ?auto_430950 ?auto_430957 ) ) ( not ( = ?auto_430950 ?auto_430958 ) ) ( not ( = ?auto_430951 ?auto_430952 ) ) ( not ( = ?auto_430951 ?auto_430953 ) ) ( not ( = ?auto_430951 ?auto_430954 ) ) ( not ( = ?auto_430951 ?auto_430955 ) ) ( not ( = ?auto_430951 ?auto_430956 ) ) ( not ( = ?auto_430951 ?auto_430957 ) ) ( not ( = ?auto_430951 ?auto_430958 ) ) ( not ( = ?auto_430952 ?auto_430953 ) ) ( not ( = ?auto_430952 ?auto_430954 ) ) ( not ( = ?auto_430952 ?auto_430955 ) ) ( not ( = ?auto_430952 ?auto_430956 ) ) ( not ( = ?auto_430952 ?auto_430957 ) ) ( not ( = ?auto_430952 ?auto_430958 ) ) ( not ( = ?auto_430953 ?auto_430954 ) ) ( not ( = ?auto_430953 ?auto_430955 ) ) ( not ( = ?auto_430953 ?auto_430956 ) ) ( not ( = ?auto_430953 ?auto_430957 ) ) ( not ( = ?auto_430953 ?auto_430958 ) ) ( not ( = ?auto_430954 ?auto_430955 ) ) ( not ( = ?auto_430954 ?auto_430956 ) ) ( not ( = ?auto_430954 ?auto_430957 ) ) ( not ( = ?auto_430954 ?auto_430958 ) ) ( not ( = ?auto_430955 ?auto_430956 ) ) ( not ( = ?auto_430955 ?auto_430957 ) ) ( not ( = ?auto_430955 ?auto_430958 ) ) ( not ( = ?auto_430956 ?auto_430957 ) ) ( not ( = ?auto_430956 ?auto_430958 ) ) ( not ( = ?auto_430957 ?auto_430958 ) ) ( ON ?auto_430956 ?auto_430957 ) ( ON ?auto_430955 ?auto_430956 ) ( ON ?auto_430954 ?auto_430955 ) ( ON ?auto_430953 ?auto_430954 ) ( ON ?auto_430952 ?auto_430953 ) ( ON ?auto_430951 ?auto_430952 ) ( CLEAR ?auto_430949 ) ( ON ?auto_430950 ?auto_430951 ) ( CLEAR ?auto_430950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430946 ?auto_430947 ?auto_430948 ?auto_430949 ?auto_430950 )
      ( MAKE-12PILE ?auto_430946 ?auto_430947 ?auto_430948 ?auto_430949 ?auto_430950 ?auto_430951 ?auto_430952 ?auto_430953 ?auto_430954 ?auto_430955 ?auto_430956 ?auto_430957 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430971 - BLOCK
      ?auto_430972 - BLOCK
      ?auto_430973 - BLOCK
      ?auto_430974 - BLOCK
      ?auto_430975 - BLOCK
      ?auto_430976 - BLOCK
      ?auto_430977 - BLOCK
      ?auto_430978 - BLOCK
      ?auto_430979 - BLOCK
      ?auto_430980 - BLOCK
      ?auto_430981 - BLOCK
      ?auto_430982 - BLOCK
    )
    :vars
    (
      ?auto_430983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430982 ?auto_430983 ) ( ON-TABLE ?auto_430971 ) ( ON ?auto_430972 ?auto_430971 ) ( ON ?auto_430973 ?auto_430972 ) ( ON ?auto_430974 ?auto_430973 ) ( not ( = ?auto_430971 ?auto_430972 ) ) ( not ( = ?auto_430971 ?auto_430973 ) ) ( not ( = ?auto_430971 ?auto_430974 ) ) ( not ( = ?auto_430971 ?auto_430975 ) ) ( not ( = ?auto_430971 ?auto_430976 ) ) ( not ( = ?auto_430971 ?auto_430977 ) ) ( not ( = ?auto_430971 ?auto_430978 ) ) ( not ( = ?auto_430971 ?auto_430979 ) ) ( not ( = ?auto_430971 ?auto_430980 ) ) ( not ( = ?auto_430971 ?auto_430981 ) ) ( not ( = ?auto_430971 ?auto_430982 ) ) ( not ( = ?auto_430971 ?auto_430983 ) ) ( not ( = ?auto_430972 ?auto_430973 ) ) ( not ( = ?auto_430972 ?auto_430974 ) ) ( not ( = ?auto_430972 ?auto_430975 ) ) ( not ( = ?auto_430972 ?auto_430976 ) ) ( not ( = ?auto_430972 ?auto_430977 ) ) ( not ( = ?auto_430972 ?auto_430978 ) ) ( not ( = ?auto_430972 ?auto_430979 ) ) ( not ( = ?auto_430972 ?auto_430980 ) ) ( not ( = ?auto_430972 ?auto_430981 ) ) ( not ( = ?auto_430972 ?auto_430982 ) ) ( not ( = ?auto_430972 ?auto_430983 ) ) ( not ( = ?auto_430973 ?auto_430974 ) ) ( not ( = ?auto_430973 ?auto_430975 ) ) ( not ( = ?auto_430973 ?auto_430976 ) ) ( not ( = ?auto_430973 ?auto_430977 ) ) ( not ( = ?auto_430973 ?auto_430978 ) ) ( not ( = ?auto_430973 ?auto_430979 ) ) ( not ( = ?auto_430973 ?auto_430980 ) ) ( not ( = ?auto_430973 ?auto_430981 ) ) ( not ( = ?auto_430973 ?auto_430982 ) ) ( not ( = ?auto_430973 ?auto_430983 ) ) ( not ( = ?auto_430974 ?auto_430975 ) ) ( not ( = ?auto_430974 ?auto_430976 ) ) ( not ( = ?auto_430974 ?auto_430977 ) ) ( not ( = ?auto_430974 ?auto_430978 ) ) ( not ( = ?auto_430974 ?auto_430979 ) ) ( not ( = ?auto_430974 ?auto_430980 ) ) ( not ( = ?auto_430974 ?auto_430981 ) ) ( not ( = ?auto_430974 ?auto_430982 ) ) ( not ( = ?auto_430974 ?auto_430983 ) ) ( not ( = ?auto_430975 ?auto_430976 ) ) ( not ( = ?auto_430975 ?auto_430977 ) ) ( not ( = ?auto_430975 ?auto_430978 ) ) ( not ( = ?auto_430975 ?auto_430979 ) ) ( not ( = ?auto_430975 ?auto_430980 ) ) ( not ( = ?auto_430975 ?auto_430981 ) ) ( not ( = ?auto_430975 ?auto_430982 ) ) ( not ( = ?auto_430975 ?auto_430983 ) ) ( not ( = ?auto_430976 ?auto_430977 ) ) ( not ( = ?auto_430976 ?auto_430978 ) ) ( not ( = ?auto_430976 ?auto_430979 ) ) ( not ( = ?auto_430976 ?auto_430980 ) ) ( not ( = ?auto_430976 ?auto_430981 ) ) ( not ( = ?auto_430976 ?auto_430982 ) ) ( not ( = ?auto_430976 ?auto_430983 ) ) ( not ( = ?auto_430977 ?auto_430978 ) ) ( not ( = ?auto_430977 ?auto_430979 ) ) ( not ( = ?auto_430977 ?auto_430980 ) ) ( not ( = ?auto_430977 ?auto_430981 ) ) ( not ( = ?auto_430977 ?auto_430982 ) ) ( not ( = ?auto_430977 ?auto_430983 ) ) ( not ( = ?auto_430978 ?auto_430979 ) ) ( not ( = ?auto_430978 ?auto_430980 ) ) ( not ( = ?auto_430978 ?auto_430981 ) ) ( not ( = ?auto_430978 ?auto_430982 ) ) ( not ( = ?auto_430978 ?auto_430983 ) ) ( not ( = ?auto_430979 ?auto_430980 ) ) ( not ( = ?auto_430979 ?auto_430981 ) ) ( not ( = ?auto_430979 ?auto_430982 ) ) ( not ( = ?auto_430979 ?auto_430983 ) ) ( not ( = ?auto_430980 ?auto_430981 ) ) ( not ( = ?auto_430980 ?auto_430982 ) ) ( not ( = ?auto_430980 ?auto_430983 ) ) ( not ( = ?auto_430981 ?auto_430982 ) ) ( not ( = ?auto_430981 ?auto_430983 ) ) ( not ( = ?auto_430982 ?auto_430983 ) ) ( ON ?auto_430981 ?auto_430982 ) ( ON ?auto_430980 ?auto_430981 ) ( ON ?auto_430979 ?auto_430980 ) ( ON ?auto_430978 ?auto_430979 ) ( ON ?auto_430977 ?auto_430978 ) ( ON ?auto_430976 ?auto_430977 ) ( CLEAR ?auto_430974 ) ( ON ?auto_430975 ?auto_430976 ) ( CLEAR ?auto_430975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430971 ?auto_430972 ?auto_430973 ?auto_430974 ?auto_430975 )
      ( MAKE-12PILE ?auto_430971 ?auto_430972 ?auto_430973 ?auto_430974 ?auto_430975 ?auto_430976 ?auto_430977 ?auto_430978 ?auto_430979 ?auto_430980 ?auto_430981 ?auto_430982 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430996 - BLOCK
      ?auto_430997 - BLOCK
      ?auto_430998 - BLOCK
      ?auto_430999 - BLOCK
      ?auto_431000 - BLOCK
      ?auto_431001 - BLOCK
      ?auto_431002 - BLOCK
      ?auto_431003 - BLOCK
      ?auto_431004 - BLOCK
      ?auto_431005 - BLOCK
      ?auto_431006 - BLOCK
      ?auto_431007 - BLOCK
    )
    :vars
    (
      ?auto_431008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431007 ?auto_431008 ) ( ON-TABLE ?auto_430996 ) ( ON ?auto_430997 ?auto_430996 ) ( ON ?auto_430998 ?auto_430997 ) ( not ( = ?auto_430996 ?auto_430997 ) ) ( not ( = ?auto_430996 ?auto_430998 ) ) ( not ( = ?auto_430996 ?auto_430999 ) ) ( not ( = ?auto_430996 ?auto_431000 ) ) ( not ( = ?auto_430996 ?auto_431001 ) ) ( not ( = ?auto_430996 ?auto_431002 ) ) ( not ( = ?auto_430996 ?auto_431003 ) ) ( not ( = ?auto_430996 ?auto_431004 ) ) ( not ( = ?auto_430996 ?auto_431005 ) ) ( not ( = ?auto_430996 ?auto_431006 ) ) ( not ( = ?auto_430996 ?auto_431007 ) ) ( not ( = ?auto_430996 ?auto_431008 ) ) ( not ( = ?auto_430997 ?auto_430998 ) ) ( not ( = ?auto_430997 ?auto_430999 ) ) ( not ( = ?auto_430997 ?auto_431000 ) ) ( not ( = ?auto_430997 ?auto_431001 ) ) ( not ( = ?auto_430997 ?auto_431002 ) ) ( not ( = ?auto_430997 ?auto_431003 ) ) ( not ( = ?auto_430997 ?auto_431004 ) ) ( not ( = ?auto_430997 ?auto_431005 ) ) ( not ( = ?auto_430997 ?auto_431006 ) ) ( not ( = ?auto_430997 ?auto_431007 ) ) ( not ( = ?auto_430997 ?auto_431008 ) ) ( not ( = ?auto_430998 ?auto_430999 ) ) ( not ( = ?auto_430998 ?auto_431000 ) ) ( not ( = ?auto_430998 ?auto_431001 ) ) ( not ( = ?auto_430998 ?auto_431002 ) ) ( not ( = ?auto_430998 ?auto_431003 ) ) ( not ( = ?auto_430998 ?auto_431004 ) ) ( not ( = ?auto_430998 ?auto_431005 ) ) ( not ( = ?auto_430998 ?auto_431006 ) ) ( not ( = ?auto_430998 ?auto_431007 ) ) ( not ( = ?auto_430998 ?auto_431008 ) ) ( not ( = ?auto_430999 ?auto_431000 ) ) ( not ( = ?auto_430999 ?auto_431001 ) ) ( not ( = ?auto_430999 ?auto_431002 ) ) ( not ( = ?auto_430999 ?auto_431003 ) ) ( not ( = ?auto_430999 ?auto_431004 ) ) ( not ( = ?auto_430999 ?auto_431005 ) ) ( not ( = ?auto_430999 ?auto_431006 ) ) ( not ( = ?auto_430999 ?auto_431007 ) ) ( not ( = ?auto_430999 ?auto_431008 ) ) ( not ( = ?auto_431000 ?auto_431001 ) ) ( not ( = ?auto_431000 ?auto_431002 ) ) ( not ( = ?auto_431000 ?auto_431003 ) ) ( not ( = ?auto_431000 ?auto_431004 ) ) ( not ( = ?auto_431000 ?auto_431005 ) ) ( not ( = ?auto_431000 ?auto_431006 ) ) ( not ( = ?auto_431000 ?auto_431007 ) ) ( not ( = ?auto_431000 ?auto_431008 ) ) ( not ( = ?auto_431001 ?auto_431002 ) ) ( not ( = ?auto_431001 ?auto_431003 ) ) ( not ( = ?auto_431001 ?auto_431004 ) ) ( not ( = ?auto_431001 ?auto_431005 ) ) ( not ( = ?auto_431001 ?auto_431006 ) ) ( not ( = ?auto_431001 ?auto_431007 ) ) ( not ( = ?auto_431001 ?auto_431008 ) ) ( not ( = ?auto_431002 ?auto_431003 ) ) ( not ( = ?auto_431002 ?auto_431004 ) ) ( not ( = ?auto_431002 ?auto_431005 ) ) ( not ( = ?auto_431002 ?auto_431006 ) ) ( not ( = ?auto_431002 ?auto_431007 ) ) ( not ( = ?auto_431002 ?auto_431008 ) ) ( not ( = ?auto_431003 ?auto_431004 ) ) ( not ( = ?auto_431003 ?auto_431005 ) ) ( not ( = ?auto_431003 ?auto_431006 ) ) ( not ( = ?auto_431003 ?auto_431007 ) ) ( not ( = ?auto_431003 ?auto_431008 ) ) ( not ( = ?auto_431004 ?auto_431005 ) ) ( not ( = ?auto_431004 ?auto_431006 ) ) ( not ( = ?auto_431004 ?auto_431007 ) ) ( not ( = ?auto_431004 ?auto_431008 ) ) ( not ( = ?auto_431005 ?auto_431006 ) ) ( not ( = ?auto_431005 ?auto_431007 ) ) ( not ( = ?auto_431005 ?auto_431008 ) ) ( not ( = ?auto_431006 ?auto_431007 ) ) ( not ( = ?auto_431006 ?auto_431008 ) ) ( not ( = ?auto_431007 ?auto_431008 ) ) ( ON ?auto_431006 ?auto_431007 ) ( ON ?auto_431005 ?auto_431006 ) ( ON ?auto_431004 ?auto_431005 ) ( ON ?auto_431003 ?auto_431004 ) ( ON ?auto_431002 ?auto_431003 ) ( ON ?auto_431001 ?auto_431002 ) ( ON ?auto_431000 ?auto_431001 ) ( CLEAR ?auto_430998 ) ( ON ?auto_430999 ?auto_431000 ) ( CLEAR ?auto_430999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_430996 ?auto_430997 ?auto_430998 ?auto_430999 )
      ( MAKE-12PILE ?auto_430996 ?auto_430997 ?auto_430998 ?auto_430999 ?auto_431000 ?auto_431001 ?auto_431002 ?auto_431003 ?auto_431004 ?auto_431005 ?auto_431006 ?auto_431007 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431021 - BLOCK
      ?auto_431022 - BLOCK
      ?auto_431023 - BLOCK
      ?auto_431024 - BLOCK
      ?auto_431025 - BLOCK
      ?auto_431026 - BLOCK
      ?auto_431027 - BLOCK
      ?auto_431028 - BLOCK
      ?auto_431029 - BLOCK
      ?auto_431030 - BLOCK
      ?auto_431031 - BLOCK
      ?auto_431032 - BLOCK
    )
    :vars
    (
      ?auto_431033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431032 ?auto_431033 ) ( ON-TABLE ?auto_431021 ) ( ON ?auto_431022 ?auto_431021 ) ( ON ?auto_431023 ?auto_431022 ) ( not ( = ?auto_431021 ?auto_431022 ) ) ( not ( = ?auto_431021 ?auto_431023 ) ) ( not ( = ?auto_431021 ?auto_431024 ) ) ( not ( = ?auto_431021 ?auto_431025 ) ) ( not ( = ?auto_431021 ?auto_431026 ) ) ( not ( = ?auto_431021 ?auto_431027 ) ) ( not ( = ?auto_431021 ?auto_431028 ) ) ( not ( = ?auto_431021 ?auto_431029 ) ) ( not ( = ?auto_431021 ?auto_431030 ) ) ( not ( = ?auto_431021 ?auto_431031 ) ) ( not ( = ?auto_431021 ?auto_431032 ) ) ( not ( = ?auto_431021 ?auto_431033 ) ) ( not ( = ?auto_431022 ?auto_431023 ) ) ( not ( = ?auto_431022 ?auto_431024 ) ) ( not ( = ?auto_431022 ?auto_431025 ) ) ( not ( = ?auto_431022 ?auto_431026 ) ) ( not ( = ?auto_431022 ?auto_431027 ) ) ( not ( = ?auto_431022 ?auto_431028 ) ) ( not ( = ?auto_431022 ?auto_431029 ) ) ( not ( = ?auto_431022 ?auto_431030 ) ) ( not ( = ?auto_431022 ?auto_431031 ) ) ( not ( = ?auto_431022 ?auto_431032 ) ) ( not ( = ?auto_431022 ?auto_431033 ) ) ( not ( = ?auto_431023 ?auto_431024 ) ) ( not ( = ?auto_431023 ?auto_431025 ) ) ( not ( = ?auto_431023 ?auto_431026 ) ) ( not ( = ?auto_431023 ?auto_431027 ) ) ( not ( = ?auto_431023 ?auto_431028 ) ) ( not ( = ?auto_431023 ?auto_431029 ) ) ( not ( = ?auto_431023 ?auto_431030 ) ) ( not ( = ?auto_431023 ?auto_431031 ) ) ( not ( = ?auto_431023 ?auto_431032 ) ) ( not ( = ?auto_431023 ?auto_431033 ) ) ( not ( = ?auto_431024 ?auto_431025 ) ) ( not ( = ?auto_431024 ?auto_431026 ) ) ( not ( = ?auto_431024 ?auto_431027 ) ) ( not ( = ?auto_431024 ?auto_431028 ) ) ( not ( = ?auto_431024 ?auto_431029 ) ) ( not ( = ?auto_431024 ?auto_431030 ) ) ( not ( = ?auto_431024 ?auto_431031 ) ) ( not ( = ?auto_431024 ?auto_431032 ) ) ( not ( = ?auto_431024 ?auto_431033 ) ) ( not ( = ?auto_431025 ?auto_431026 ) ) ( not ( = ?auto_431025 ?auto_431027 ) ) ( not ( = ?auto_431025 ?auto_431028 ) ) ( not ( = ?auto_431025 ?auto_431029 ) ) ( not ( = ?auto_431025 ?auto_431030 ) ) ( not ( = ?auto_431025 ?auto_431031 ) ) ( not ( = ?auto_431025 ?auto_431032 ) ) ( not ( = ?auto_431025 ?auto_431033 ) ) ( not ( = ?auto_431026 ?auto_431027 ) ) ( not ( = ?auto_431026 ?auto_431028 ) ) ( not ( = ?auto_431026 ?auto_431029 ) ) ( not ( = ?auto_431026 ?auto_431030 ) ) ( not ( = ?auto_431026 ?auto_431031 ) ) ( not ( = ?auto_431026 ?auto_431032 ) ) ( not ( = ?auto_431026 ?auto_431033 ) ) ( not ( = ?auto_431027 ?auto_431028 ) ) ( not ( = ?auto_431027 ?auto_431029 ) ) ( not ( = ?auto_431027 ?auto_431030 ) ) ( not ( = ?auto_431027 ?auto_431031 ) ) ( not ( = ?auto_431027 ?auto_431032 ) ) ( not ( = ?auto_431027 ?auto_431033 ) ) ( not ( = ?auto_431028 ?auto_431029 ) ) ( not ( = ?auto_431028 ?auto_431030 ) ) ( not ( = ?auto_431028 ?auto_431031 ) ) ( not ( = ?auto_431028 ?auto_431032 ) ) ( not ( = ?auto_431028 ?auto_431033 ) ) ( not ( = ?auto_431029 ?auto_431030 ) ) ( not ( = ?auto_431029 ?auto_431031 ) ) ( not ( = ?auto_431029 ?auto_431032 ) ) ( not ( = ?auto_431029 ?auto_431033 ) ) ( not ( = ?auto_431030 ?auto_431031 ) ) ( not ( = ?auto_431030 ?auto_431032 ) ) ( not ( = ?auto_431030 ?auto_431033 ) ) ( not ( = ?auto_431031 ?auto_431032 ) ) ( not ( = ?auto_431031 ?auto_431033 ) ) ( not ( = ?auto_431032 ?auto_431033 ) ) ( ON ?auto_431031 ?auto_431032 ) ( ON ?auto_431030 ?auto_431031 ) ( ON ?auto_431029 ?auto_431030 ) ( ON ?auto_431028 ?auto_431029 ) ( ON ?auto_431027 ?auto_431028 ) ( ON ?auto_431026 ?auto_431027 ) ( ON ?auto_431025 ?auto_431026 ) ( CLEAR ?auto_431023 ) ( ON ?auto_431024 ?auto_431025 ) ( CLEAR ?auto_431024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_431021 ?auto_431022 ?auto_431023 ?auto_431024 )
      ( MAKE-12PILE ?auto_431021 ?auto_431022 ?auto_431023 ?auto_431024 ?auto_431025 ?auto_431026 ?auto_431027 ?auto_431028 ?auto_431029 ?auto_431030 ?auto_431031 ?auto_431032 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431046 - BLOCK
      ?auto_431047 - BLOCK
      ?auto_431048 - BLOCK
      ?auto_431049 - BLOCK
      ?auto_431050 - BLOCK
      ?auto_431051 - BLOCK
      ?auto_431052 - BLOCK
      ?auto_431053 - BLOCK
      ?auto_431054 - BLOCK
      ?auto_431055 - BLOCK
      ?auto_431056 - BLOCK
      ?auto_431057 - BLOCK
    )
    :vars
    (
      ?auto_431058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431057 ?auto_431058 ) ( ON-TABLE ?auto_431046 ) ( ON ?auto_431047 ?auto_431046 ) ( not ( = ?auto_431046 ?auto_431047 ) ) ( not ( = ?auto_431046 ?auto_431048 ) ) ( not ( = ?auto_431046 ?auto_431049 ) ) ( not ( = ?auto_431046 ?auto_431050 ) ) ( not ( = ?auto_431046 ?auto_431051 ) ) ( not ( = ?auto_431046 ?auto_431052 ) ) ( not ( = ?auto_431046 ?auto_431053 ) ) ( not ( = ?auto_431046 ?auto_431054 ) ) ( not ( = ?auto_431046 ?auto_431055 ) ) ( not ( = ?auto_431046 ?auto_431056 ) ) ( not ( = ?auto_431046 ?auto_431057 ) ) ( not ( = ?auto_431046 ?auto_431058 ) ) ( not ( = ?auto_431047 ?auto_431048 ) ) ( not ( = ?auto_431047 ?auto_431049 ) ) ( not ( = ?auto_431047 ?auto_431050 ) ) ( not ( = ?auto_431047 ?auto_431051 ) ) ( not ( = ?auto_431047 ?auto_431052 ) ) ( not ( = ?auto_431047 ?auto_431053 ) ) ( not ( = ?auto_431047 ?auto_431054 ) ) ( not ( = ?auto_431047 ?auto_431055 ) ) ( not ( = ?auto_431047 ?auto_431056 ) ) ( not ( = ?auto_431047 ?auto_431057 ) ) ( not ( = ?auto_431047 ?auto_431058 ) ) ( not ( = ?auto_431048 ?auto_431049 ) ) ( not ( = ?auto_431048 ?auto_431050 ) ) ( not ( = ?auto_431048 ?auto_431051 ) ) ( not ( = ?auto_431048 ?auto_431052 ) ) ( not ( = ?auto_431048 ?auto_431053 ) ) ( not ( = ?auto_431048 ?auto_431054 ) ) ( not ( = ?auto_431048 ?auto_431055 ) ) ( not ( = ?auto_431048 ?auto_431056 ) ) ( not ( = ?auto_431048 ?auto_431057 ) ) ( not ( = ?auto_431048 ?auto_431058 ) ) ( not ( = ?auto_431049 ?auto_431050 ) ) ( not ( = ?auto_431049 ?auto_431051 ) ) ( not ( = ?auto_431049 ?auto_431052 ) ) ( not ( = ?auto_431049 ?auto_431053 ) ) ( not ( = ?auto_431049 ?auto_431054 ) ) ( not ( = ?auto_431049 ?auto_431055 ) ) ( not ( = ?auto_431049 ?auto_431056 ) ) ( not ( = ?auto_431049 ?auto_431057 ) ) ( not ( = ?auto_431049 ?auto_431058 ) ) ( not ( = ?auto_431050 ?auto_431051 ) ) ( not ( = ?auto_431050 ?auto_431052 ) ) ( not ( = ?auto_431050 ?auto_431053 ) ) ( not ( = ?auto_431050 ?auto_431054 ) ) ( not ( = ?auto_431050 ?auto_431055 ) ) ( not ( = ?auto_431050 ?auto_431056 ) ) ( not ( = ?auto_431050 ?auto_431057 ) ) ( not ( = ?auto_431050 ?auto_431058 ) ) ( not ( = ?auto_431051 ?auto_431052 ) ) ( not ( = ?auto_431051 ?auto_431053 ) ) ( not ( = ?auto_431051 ?auto_431054 ) ) ( not ( = ?auto_431051 ?auto_431055 ) ) ( not ( = ?auto_431051 ?auto_431056 ) ) ( not ( = ?auto_431051 ?auto_431057 ) ) ( not ( = ?auto_431051 ?auto_431058 ) ) ( not ( = ?auto_431052 ?auto_431053 ) ) ( not ( = ?auto_431052 ?auto_431054 ) ) ( not ( = ?auto_431052 ?auto_431055 ) ) ( not ( = ?auto_431052 ?auto_431056 ) ) ( not ( = ?auto_431052 ?auto_431057 ) ) ( not ( = ?auto_431052 ?auto_431058 ) ) ( not ( = ?auto_431053 ?auto_431054 ) ) ( not ( = ?auto_431053 ?auto_431055 ) ) ( not ( = ?auto_431053 ?auto_431056 ) ) ( not ( = ?auto_431053 ?auto_431057 ) ) ( not ( = ?auto_431053 ?auto_431058 ) ) ( not ( = ?auto_431054 ?auto_431055 ) ) ( not ( = ?auto_431054 ?auto_431056 ) ) ( not ( = ?auto_431054 ?auto_431057 ) ) ( not ( = ?auto_431054 ?auto_431058 ) ) ( not ( = ?auto_431055 ?auto_431056 ) ) ( not ( = ?auto_431055 ?auto_431057 ) ) ( not ( = ?auto_431055 ?auto_431058 ) ) ( not ( = ?auto_431056 ?auto_431057 ) ) ( not ( = ?auto_431056 ?auto_431058 ) ) ( not ( = ?auto_431057 ?auto_431058 ) ) ( ON ?auto_431056 ?auto_431057 ) ( ON ?auto_431055 ?auto_431056 ) ( ON ?auto_431054 ?auto_431055 ) ( ON ?auto_431053 ?auto_431054 ) ( ON ?auto_431052 ?auto_431053 ) ( ON ?auto_431051 ?auto_431052 ) ( ON ?auto_431050 ?auto_431051 ) ( ON ?auto_431049 ?auto_431050 ) ( CLEAR ?auto_431047 ) ( ON ?auto_431048 ?auto_431049 ) ( CLEAR ?auto_431048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431046 ?auto_431047 ?auto_431048 )
      ( MAKE-12PILE ?auto_431046 ?auto_431047 ?auto_431048 ?auto_431049 ?auto_431050 ?auto_431051 ?auto_431052 ?auto_431053 ?auto_431054 ?auto_431055 ?auto_431056 ?auto_431057 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431071 - BLOCK
      ?auto_431072 - BLOCK
      ?auto_431073 - BLOCK
      ?auto_431074 - BLOCK
      ?auto_431075 - BLOCK
      ?auto_431076 - BLOCK
      ?auto_431077 - BLOCK
      ?auto_431078 - BLOCK
      ?auto_431079 - BLOCK
      ?auto_431080 - BLOCK
      ?auto_431081 - BLOCK
      ?auto_431082 - BLOCK
    )
    :vars
    (
      ?auto_431083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431082 ?auto_431083 ) ( ON-TABLE ?auto_431071 ) ( ON ?auto_431072 ?auto_431071 ) ( not ( = ?auto_431071 ?auto_431072 ) ) ( not ( = ?auto_431071 ?auto_431073 ) ) ( not ( = ?auto_431071 ?auto_431074 ) ) ( not ( = ?auto_431071 ?auto_431075 ) ) ( not ( = ?auto_431071 ?auto_431076 ) ) ( not ( = ?auto_431071 ?auto_431077 ) ) ( not ( = ?auto_431071 ?auto_431078 ) ) ( not ( = ?auto_431071 ?auto_431079 ) ) ( not ( = ?auto_431071 ?auto_431080 ) ) ( not ( = ?auto_431071 ?auto_431081 ) ) ( not ( = ?auto_431071 ?auto_431082 ) ) ( not ( = ?auto_431071 ?auto_431083 ) ) ( not ( = ?auto_431072 ?auto_431073 ) ) ( not ( = ?auto_431072 ?auto_431074 ) ) ( not ( = ?auto_431072 ?auto_431075 ) ) ( not ( = ?auto_431072 ?auto_431076 ) ) ( not ( = ?auto_431072 ?auto_431077 ) ) ( not ( = ?auto_431072 ?auto_431078 ) ) ( not ( = ?auto_431072 ?auto_431079 ) ) ( not ( = ?auto_431072 ?auto_431080 ) ) ( not ( = ?auto_431072 ?auto_431081 ) ) ( not ( = ?auto_431072 ?auto_431082 ) ) ( not ( = ?auto_431072 ?auto_431083 ) ) ( not ( = ?auto_431073 ?auto_431074 ) ) ( not ( = ?auto_431073 ?auto_431075 ) ) ( not ( = ?auto_431073 ?auto_431076 ) ) ( not ( = ?auto_431073 ?auto_431077 ) ) ( not ( = ?auto_431073 ?auto_431078 ) ) ( not ( = ?auto_431073 ?auto_431079 ) ) ( not ( = ?auto_431073 ?auto_431080 ) ) ( not ( = ?auto_431073 ?auto_431081 ) ) ( not ( = ?auto_431073 ?auto_431082 ) ) ( not ( = ?auto_431073 ?auto_431083 ) ) ( not ( = ?auto_431074 ?auto_431075 ) ) ( not ( = ?auto_431074 ?auto_431076 ) ) ( not ( = ?auto_431074 ?auto_431077 ) ) ( not ( = ?auto_431074 ?auto_431078 ) ) ( not ( = ?auto_431074 ?auto_431079 ) ) ( not ( = ?auto_431074 ?auto_431080 ) ) ( not ( = ?auto_431074 ?auto_431081 ) ) ( not ( = ?auto_431074 ?auto_431082 ) ) ( not ( = ?auto_431074 ?auto_431083 ) ) ( not ( = ?auto_431075 ?auto_431076 ) ) ( not ( = ?auto_431075 ?auto_431077 ) ) ( not ( = ?auto_431075 ?auto_431078 ) ) ( not ( = ?auto_431075 ?auto_431079 ) ) ( not ( = ?auto_431075 ?auto_431080 ) ) ( not ( = ?auto_431075 ?auto_431081 ) ) ( not ( = ?auto_431075 ?auto_431082 ) ) ( not ( = ?auto_431075 ?auto_431083 ) ) ( not ( = ?auto_431076 ?auto_431077 ) ) ( not ( = ?auto_431076 ?auto_431078 ) ) ( not ( = ?auto_431076 ?auto_431079 ) ) ( not ( = ?auto_431076 ?auto_431080 ) ) ( not ( = ?auto_431076 ?auto_431081 ) ) ( not ( = ?auto_431076 ?auto_431082 ) ) ( not ( = ?auto_431076 ?auto_431083 ) ) ( not ( = ?auto_431077 ?auto_431078 ) ) ( not ( = ?auto_431077 ?auto_431079 ) ) ( not ( = ?auto_431077 ?auto_431080 ) ) ( not ( = ?auto_431077 ?auto_431081 ) ) ( not ( = ?auto_431077 ?auto_431082 ) ) ( not ( = ?auto_431077 ?auto_431083 ) ) ( not ( = ?auto_431078 ?auto_431079 ) ) ( not ( = ?auto_431078 ?auto_431080 ) ) ( not ( = ?auto_431078 ?auto_431081 ) ) ( not ( = ?auto_431078 ?auto_431082 ) ) ( not ( = ?auto_431078 ?auto_431083 ) ) ( not ( = ?auto_431079 ?auto_431080 ) ) ( not ( = ?auto_431079 ?auto_431081 ) ) ( not ( = ?auto_431079 ?auto_431082 ) ) ( not ( = ?auto_431079 ?auto_431083 ) ) ( not ( = ?auto_431080 ?auto_431081 ) ) ( not ( = ?auto_431080 ?auto_431082 ) ) ( not ( = ?auto_431080 ?auto_431083 ) ) ( not ( = ?auto_431081 ?auto_431082 ) ) ( not ( = ?auto_431081 ?auto_431083 ) ) ( not ( = ?auto_431082 ?auto_431083 ) ) ( ON ?auto_431081 ?auto_431082 ) ( ON ?auto_431080 ?auto_431081 ) ( ON ?auto_431079 ?auto_431080 ) ( ON ?auto_431078 ?auto_431079 ) ( ON ?auto_431077 ?auto_431078 ) ( ON ?auto_431076 ?auto_431077 ) ( ON ?auto_431075 ?auto_431076 ) ( ON ?auto_431074 ?auto_431075 ) ( CLEAR ?auto_431072 ) ( ON ?auto_431073 ?auto_431074 ) ( CLEAR ?auto_431073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431071 ?auto_431072 ?auto_431073 )
      ( MAKE-12PILE ?auto_431071 ?auto_431072 ?auto_431073 ?auto_431074 ?auto_431075 ?auto_431076 ?auto_431077 ?auto_431078 ?auto_431079 ?auto_431080 ?auto_431081 ?auto_431082 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431096 - BLOCK
      ?auto_431097 - BLOCK
      ?auto_431098 - BLOCK
      ?auto_431099 - BLOCK
      ?auto_431100 - BLOCK
      ?auto_431101 - BLOCK
      ?auto_431102 - BLOCK
      ?auto_431103 - BLOCK
      ?auto_431104 - BLOCK
      ?auto_431105 - BLOCK
      ?auto_431106 - BLOCK
      ?auto_431107 - BLOCK
    )
    :vars
    (
      ?auto_431108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431107 ?auto_431108 ) ( ON-TABLE ?auto_431096 ) ( not ( = ?auto_431096 ?auto_431097 ) ) ( not ( = ?auto_431096 ?auto_431098 ) ) ( not ( = ?auto_431096 ?auto_431099 ) ) ( not ( = ?auto_431096 ?auto_431100 ) ) ( not ( = ?auto_431096 ?auto_431101 ) ) ( not ( = ?auto_431096 ?auto_431102 ) ) ( not ( = ?auto_431096 ?auto_431103 ) ) ( not ( = ?auto_431096 ?auto_431104 ) ) ( not ( = ?auto_431096 ?auto_431105 ) ) ( not ( = ?auto_431096 ?auto_431106 ) ) ( not ( = ?auto_431096 ?auto_431107 ) ) ( not ( = ?auto_431096 ?auto_431108 ) ) ( not ( = ?auto_431097 ?auto_431098 ) ) ( not ( = ?auto_431097 ?auto_431099 ) ) ( not ( = ?auto_431097 ?auto_431100 ) ) ( not ( = ?auto_431097 ?auto_431101 ) ) ( not ( = ?auto_431097 ?auto_431102 ) ) ( not ( = ?auto_431097 ?auto_431103 ) ) ( not ( = ?auto_431097 ?auto_431104 ) ) ( not ( = ?auto_431097 ?auto_431105 ) ) ( not ( = ?auto_431097 ?auto_431106 ) ) ( not ( = ?auto_431097 ?auto_431107 ) ) ( not ( = ?auto_431097 ?auto_431108 ) ) ( not ( = ?auto_431098 ?auto_431099 ) ) ( not ( = ?auto_431098 ?auto_431100 ) ) ( not ( = ?auto_431098 ?auto_431101 ) ) ( not ( = ?auto_431098 ?auto_431102 ) ) ( not ( = ?auto_431098 ?auto_431103 ) ) ( not ( = ?auto_431098 ?auto_431104 ) ) ( not ( = ?auto_431098 ?auto_431105 ) ) ( not ( = ?auto_431098 ?auto_431106 ) ) ( not ( = ?auto_431098 ?auto_431107 ) ) ( not ( = ?auto_431098 ?auto_431108 ) ) ( not ( = ?auto_431099 ?auto_431100 ) ) ( not ( = ?auto_431099 ?auto_431101 ) ) ( not ( = ?auto_431099 ?auto_431102 ) ) ( not ( = ?auto_431099 ?auto_431103 ) ) ( not ( = ?auto_431099 ?auto_431104 ) ) ( not ( = ?auto_431099 ?auto_431105 ) ) ( not ( = ?auto_431099 ?auto_431106 ) ) ( not ( = ?auto_431099 ?auto_431107 ) ) ( not ( = ?auto_431099 ?auto_431108 ) ) ( not ( = ?auto_431100 ?auto_431101 ) ) ( not ( = ?auto_431100 ?auto_431102 ) ) ( not ( = ?auto_431100 ?auto_431103 ) ) ( not ( = ?auto_431100 ?auto_431104 ) ) ( not ( = ?auto_431100 ?auto_431105 ) ) ( not ( = ?auto_431100 ?auto_431106 ) ) ( not ( = ?auto_431100 ?auto_431107 ) ) ( not ( = ?auto_431100 ?auto_431108 ) ) ( not ( = ?auto_431101 ?auto_431102 ) ) ( not ( = ?auto_431101 ?auto_431103 ) ) ( not ( = ?auto_431101 ?auto_431104 ) ) ( not ( = ?auto_431101 ?auto_431105 ) ) ( not ( = ?auto_431101 ?auto_431106 ) ) ( not ( = ?auto_431101 ?auto_431107 ) ) ( not ( = ?auto_431101 ?auto_431108 ) ) ( not ( = ?auto_431102 ?auto_431103 ) ) ( not ( = ?auto_431102 ?auto_431104 ) ) ( not ( = ?auto_431102 ?auto_431105 ) ) ( not ( = ?auto_431102 ?auto_431106 ) ) ( not ( = ?auto_431102 ?auto_431107 ) ) ( not ( = ?auto_431102 ?auto_431108 ) ) ( not ( = ?auto_431103 ?auto_431104 ) ) ( not ( = ?auto_431103 ?auto_431105 ) ) ( not ( = ?auto_431103 ?auto_431106 ) ) ( not ( = ?auto_431103 ?auto_431107 ) ) ( not ( = ?auto_431103 ?auto_431108 ) ) ( not ( = ?auto_431104 ?auto_431105 ) ) ( not ( = ?auto_431104 ?auto_431106 ) ) ( not ( = ?auto_431104 ?auto_431107 ) ) ( not ( = ?auto_431104 ?auto_431108 ) ) ( not ( = ?auto_431105 ?auto_431106 ) ) ( not ( = ?auto_431105 ?auto_431107 ) ) ( not ( = ?auto_431105 ?auto_431108 ) ) ( not ( = ?auto_431106 ?auto_431107 ) ) ( not ( = ?auto_431106 ?auto_431108 ) ) ( not ( = ?auto_431107 ?auto_431108 ) ) ( ON ?auto_431106 ?auto_431107 ) ( ON ?auto_431105 ?auto_431106 ) ( ON ?auto_431104 ?auto_431105 ) ( ON ?auto_431103 ?auto_431104 ) ( ON ?auto_431102 ?auto_431103 ) ( ON ?auto_431101 ?auto_431102 ) ( ON ?auto_431100 ?auto_431101 ) ( ON ?auto_431099 ?auto_431100 ) ( ON ?auto_431098 ?auto_431099 ) ( CLEAR ?auto_431096 ) ( ON ?auto_431097 ?auto_431098 ) ( CLEAR ?auto_431097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431096 ?auto_431097 )
      ( MAKE-12PILE ?auto_431096 ?auto_431097 ?auto_431098 ?auto_431099 ?auto_431100 ?auto_431101 ?auto_431102 ?auto_431103 ?auto_431104 ?auto_431105 ?auto_431106 ?auto_431107 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431121 - BLOCK
      ?auto_431122 - BLOCK
      ?auto_431123 - BLOCK
      ?auto_431124 - BLOCK
      ?auto_431125 - BLOCK
      ?auto_431126 - BLOCK
      ?auto_431127 - BLOCK
      ?auto_431128 - BLOCK
      ?auto_431129 - BLOCK
      ?auto_431130 - BLOCK
      ?auto_431131 - BLOCK
      ?auto_431132 - BLOCK
    )
    :vars
    (
      ?auto_431133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431132 ?auto_431133 ) ( ON-TABLE ?auto_431121 ) ( not ( = ?auto_431121 ?auto_431122 ) ) ( not ( = ?auto_431121 ?auto_431123 ) ) ( not ( = ?auto_431121 ?auto_431124 ) ) ( not ( = ?auto_431121 ?auto_431125 ) ) ( not ( = ?auto_431121 ?auto_431126 ) ) ( not ( = ?auto_431121 ?auto_431127 ) ) ( not ( = ?auto_431121 ?auto_431128 ) ) ( not ( = ?auto_431121 ?auto_431129 ) ) ( not ( = ?auto_431121 ?auto_431130 ) ) ( not ( = ?auto_431121 ?auto_431131 ) ) ( not ( = ?auto_431121 ?auto_431132 ) ) ( not ( = ?auto_431121 ?auto_431133 ) ) ( not ( = ?auto_431122 ?auto_431123 ) ) ( not ( = ?auto_431122 ?auto_431124 ) ) ( not ( = ?auto_431122 ?auto_431125 ) ) ( not ( = ?auto_431122 ?auto_431126 ) ) ( not ( = ?auto_431122 ?auto_431127 ) ) ( not ( = ?auto_431122 ?auto_431128 ) ) ( not ( = ?auto_431122 ?auto_431129 ) ) ( not ( = ?auto_431122 ?auto_431130 ) ) ( not ( = ?auto_431122 ?auto_431131 ) ) ( not ( = ?auto_431122 ?auto_431132 ) ) ( not ( = ?auto_431122 ?auto_431133 ) ) ( not ( = ?auto_431123 ?auto_431124 ) ) ( not ( = ?auto_431123 ?auto_431125 ) ) ( not ( = ?auto_431123 ?auto_431126 ) ) ( not ( = ?auto_431123 ?auto_431127 ) ) ( not ( = ?auto_431123 ?auto_431128 ) ) ( not ( = ?auto_431123 ?auto_431129 ) ) ( not ( = ?auto_431123 ?auto_431130 ) ) ( not ( = ?auto_431123 ?auto_431131 ) ) ( not ( = ?auto_431123 ?auto_431132 ) ) ( not ( = ?auto_431123 ?auto_431133 ) ) ( not ( = ?auto_431124 ?auto_431125 ) ) ( not ( = ?auto_431124 ?auto_431126 ) ) ( not ( = ?auto_431124 ?auto_431127 ) ) ( not ( = ?auto_431124 ?auto_431128 ) ) ( not ( = ?auto_431124 ?auto_431129 ) ) ( not ( = ?auto_431124 ?auto_431130 ) ) ( not ( = ?auto_431124 ?auto_431131 ) ) ( not ( = ?auto_431124 ?auto_431132 ) ) ( not ( = ?auto_431124 ?auto_431133 ) ) ( not ( = ?auto_431125 ?auto_431126 ) ) ( not ( = ?auto_431125 ?auto_431127 ) ) ( not ( = ?auto_431125 ?auto_431128 ) ) ( not ( = ?auto_431125 ?auto_431129 ) ) ( not ( = ?auto_431125 ?auto_431130 ) ) ( not ( = ?auto_431125 ?auto_431131 ) ) ( not ( = ?auto_431125 ?auto_431132 ) ) ( not ( = ?auto_431125 ?auto_431133 ) ) ( not ( = ?auto_431126 ?auto_431127 ) ) ( not ( = ?auto_431126 ?auto_431128 ) ) ( not ( = ?auto_431126 ?auto_431129 ) ) ( not ( = ?auto_431126 ?auto_431130 ) ) ( not ( = ?auto_431126 ?auto_431131 ) ) ( not ( = ?auto_431126 ?auto_431132 ) ) ( not ( = ?auto_431126 ?auto_431133 ) ) ( not ( = ?auto_431127 ?auto_431128 ) ) ( not ( = ?auto_431127 ?auto_431129 ) ) ( not ( = ?auto_431127 ?auto_431130 ) ) ( not ( = ?auto_431127 ?auto_431131 ) ) ( not ( = ?auto_431127 ?auto_431132 ) ) ( not ( = ?auto_431127 ?auto_431133 ) ) ( not ( = ?auto_431128 ?auto_431129 ) ) ( not ( = ?auto_431128 ?auto_431130 ) ) ( not ( = ?auto_431128 ?auto_431131 ) ) ( not ( = ?auto_431128 ?auto_431132 ) ) ( not ( = ?auto_431128 ?auto_431133 ) ) ( not ( = ?auto_431129 ?auto_431130 ) ) ( not ( = ?auto_431129 ?auto_431131 ) ) ( not ( = ?auto_431129 ?auto_431132 ) ) ( not ( = ?auto_431129 ?auto_431133 ) ) ( not ( = ?auto_431130 ?auto_431131 ) ) ( not ( = ?auto_431130 ?auto_431132 ) ) ( not ( = ?auto_431130 ?auto_431133 ) ) ( not ( = ?auto_431131 ?auto_431132 ) ) ( not ( = ?auto_431131 ?auto_431133 ) ) ( not ( = ?auto_431132 ?auto_431133 ) ) ( ON ?auto_431131 ?auto_431132 ) ( ON ?auto_431130 ?auto_431131 ) ( ON ?auto_431129 ?auto_431130 ) ( ON ?auto_431128 ?auto_431129 ) ( ON ?auto_431127 ?auto_431128 ) ( ON ?auto_431126 ?auto_431127 ) ( ON ?auto_431125 ?auto_431126 ) ( ON ?auto_431124 ?auto_431125 ) ( ON ?auto_431123 ?auto_431124 ) ( CLEAR ?auto_431121 ) ( ON ?auto_431122 ?auto_431123 ) ( CLEAR ?auto_431122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431121 ?auto_431122 )
      ( MAKE-12PILE ?auto_431121 ?auto_431122 ?auto_431123 ?auto_431124 ?auto_431125 ?auto_431126 ?auto_431127 ?auto_431128 ?auto_431129 ?auto_431130 ?auto_431131 ?auto_431132 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431146 - BLOCK
      ?auto_431147 - BLOCK
      ?auto_431148 - BLOCK
      ?auto_431149 - BLOCK
      ?auto_431150 - BLOCK
      ?auto_431151 - BLOCK
      ?auto_431152 - BLOCK
      ?auto_431153 - BLOCK
      ?auto_431154 - BLOCK
      ?auto_431155 - BLOCK
      ?auto_431156 - BLOCK
      ?auto_431157 - BLOCK
    )
    :vars
    (
      ?auto_431158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431157 ?auto_431158 ) ( not ( = ?auto_431146 ?auto_431147 ) ) ( not ( = ?auto_431146 ?auto_431148 ) ) ( not ( = ?auto_431146 ?auto_431149 ) ) ( not ( = ?auto_431146 ?auto_431150 ) ) ( not ( = ?auto_431146 ?auto_431151 ) ) ( not ( = ?auto_431146 ?auto_431152 ) ) ( not ( = ?auto_431146 ?auto_431153 ) ) ( not ( = ?auto_431146 ?auto_431154 ) ) ( not ( = ?auto_431146 ?auto_431155 ) ) ( not ( = ?auto_431146 ?auto_431156 ) ) ( not ( = ?auto_431146 ?auto_431157 ) ) ( not ( = ?auto_431146 ?auto_431158 ) ) ( not ( = ?auto_431147 ?auto_431148 ) ) ( not ( = ?auto_431147 ?auto_431149 ) ) ( not ( = ?auto_431147 ?auto_431150 ) ) ( not ( = ?auto_431147 ?auto_431151 ) ) ( not ( = ?auto_431147 ?auto_431152 ) ) ( not ( = ?auto_431147 ?auto_431153 ) ) ( not ( = ?auto_431147 ?auto_431154 ) ) ( not ( = ?auto_431147 ?auto_431155 ) ) ( not ( = ?auto_431147 ?auto_431156 ) ) ( not ( = ?auto_431147 ?auto_431157 ) ) ( not ( = ?auto_431147 ?auto_431158 ) ) ( not ( = ?auto_431148 ?auto_431149 ) ) ( not ( = ?auto_431148 ?auto_431150 ) ) ( not ( = ?auto_431148 ?auto_431151 ) ) ( not ( = ?auto_431148 ?auto_431152 ) ) ( not ( = ?auto_431148 ?auto_431153 ) ) ( not ( = ?auto_431148 ?auto_431154 ) ) ( not ( = ?auto_431148 ?auto_431155 ) ) ( not ( = ?auto_431148 ?auto_431156 ) ) ( not ( = ?auto_431148 ?auto_431157 ) ) ( not ( = ?auto_431148 ?auto_431158 ) ) ( not ( = ?auto_431149 ?auto_431150 ) ) ( not ( = ?auto_431149 ?auto_431151 ) ) ( not ( = ?auto_431149 ?auto_431152 ) ) ( not ( = ?auto_431149 ?auto_431153 ) ) ( not ( = ?auto_431149 ?auto_431154 ) ) ( not ( = ?auto_431149 ?auto_431155 ) ) ( not ( = ?auto_431149 ?auto_431156 ) ) ( not ( = ?auto_431149 ?auto_431157 ) ) ( not ( = ?auto_431149 ?auto_431158 ) ) ( not ( = ?auto_431150 ?auto_431151 ) ) ( not ( = ?auto_431150 ?auto_431152 ) ) ( not ( = ?auto_431150 ?auto_431153 ) ) ( not ( = ?auto_431150 ?auto_431154 ) ) ( not ( = ?auto_431150 ?auto_431155 ) ) ( not ( = ?auto_431150 ?auto_431156 ) ) ( not ( = ?auto_431150 ?auto_431157 ) ) ( not ( = ?auto_431150 ?auto_431158 ) ) ( not ( = ?auto_431151 ?auto_431152 ) ) ( not ( = ?auto_431151 ?auto_431153 ) ) ( not ( = ?auto_431151 ?auto_431154 ) ) ( not ( = ?auto_431151 ?auto_431155 ) ) ( not ( = ?auto_431151 ?auto_431156 ) ) ( not ( = ?auto_431151 ?auto_431157 ) ) ( not ( = ?auto_431151 ?auto_431158 ) ) ( not ( = ?auto_431152 ?auto_431153 ) ) ( not ( = ?auto_431152 ?auto_431154 ) ) ( not ( = ?auto_431152 ?auto_431155 ) ) ( not ( = ?auto_431152 ?auto_431156 ) ) ( not ( = ?auto_431152 ?auto_431157 ) ) ( not ( = ?auto_431152 ?auto_431158 ) ) ( not ( = ?auto_431153 ?auto_431154 ) ) ( not ( = ?auto_431153 ?auto_431155 ) ) ( not ( = ?auto_431153 ?auto_431156 ) ) ( not ( = ?auto_431153 ?auto_431157 ) ) ( not ( = ?auto_431153 ?auto_431158 ) ) ( not ( = ?auto_431154 ?auto_431155 ) ) ( not ( = ?auto_431154 ?auto_431156 ) ) ( not ( = ?auto_431154 ?auto_431157 ) ) ( not ( = ?auto_431154 ?auto_431158 ) ) ( not ( = ?auto_431155 ?auto_431156 ) ) ( not ( = ?auto_431155 ?auto_431157 ) ) ( not ( = ?auto_431155 ?auto_431158 ) ) ( not ( = ?auto_431156 ?auto_431157 ) ) ( not ( = ?auto_431156 ?auto_431158 ) ) ( not ( = ?auto_431157 ?auto_431158 ) ) ( ON ?auto_431156 ?auto_431157 ) ( ON ?auto_431155 ?auto_431156 ) ( ON ?auto_431154 ?auto_431155 ) ( ON ?auto_431153 ?auto_431154 ) ( ON ?auto_431152 ?auto_431153 ) ( ON ?auto_431151 ?auto_431152 ) ( ON ?auto_431150 ?auto_431151 ) ( ON ?auto_431149 ?auto_431150 ) ( ON ?auto_431148 ?auto_431149 ) ( ON ?auto_431147 ?auto_431148 ) ( ON ?auto_431146 ?auto_431147 ) ( CLEAR ?auto_431146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431146 )
      ( MAKE-12PILE ?auto_431146 ?auto_431147 ?auto_431148 ?auto_431149 ?auto_431150 ?auto_431151 ?auto_431152 ?auto_431153 ?auto_431154 ?auto_431155 ?auto_431156 ?auto_431157 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431171 - BLOCK
      ?auto_431172 - BLOCK
      ?auto_431173 - BLOCK
      ?auto_431174 - BLOCK
      ?auto_431175 - BLOCK
      ?auto_431176 - BLOCK
      ?auto_431177 - BLOCK
      ?auto_431178 - BLOCK
      ?auto_431179 - BLOCK
      ?auto_431180 - BLOCK
      ?auto_431181 - BLOCK
      ?auto_431182 - BLOCK
    )
    :vars
    (
      ?auto_431183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431182 ?auto_431183 ) ( not ( = ?auto_431171 ?auto_431172 ) ) ( not ( = ?auto_431171 ?auto_431173 ) ) ( not ( = ?auto_431171 ?auto_431174 ) ) ( not ( = ?auto_431171 ?auto_431175 ) ) ( not ( = ?auto_431171 ?auto_431176 ) ) ( not ( = ?auto_431171 ?auto_431177 ) ) ( not ( = ?auto_431171 ?auto_431178 ) ) ( not ( = ?auto_431171 ?auto_431179 ) ) ( not ( = ?auto_431171 ?auto_431180 ) ) ( not ( = ?auto_431171 ?auto_431181 ) ) ( not ( = ?auto_431171 ?auto_431182 ) ) ( not ( = ?auto_431171 ?auto_431183 ) ) ( not ( = ?auto_431172 ?auto_431173 ) ) ( not ( = ?auto_431172 ?auto_431174 ) ) ( not ( = ?auto_431172 ?auto_431175 ) ) ( not ( = ?auto_431172 ?auto_431176 ) ) ( not ( = ?auto_431172 ?auto_431177 ) ) ( not ( = ?auto_431172 ?auto_431178 ) ) ( not ( = ?auto_431172 ?auto_431179 ) ) ( not ( = ?auto_431172 ?auto_431180 ) ) ( not ( = ?auto_431172 ?auto_431181 ) ) ( not ( = ?auto_431172 ?auto_431182 ) ) ( not ( = ?auto_431172 ?auto_431183 ) ) ( not ( = ?auto_431173 ?auto_431174 ) ) ( not ( = ?auto_431173 ?auto_431175 ) ) ( not ( = ?auto_431173 ?auto_431176 ) ) ( not ( = ?auto_431173 ?auto_431177 ) ) ( not ( = ?auto_431173 ?auto_431178 ) ) ( not ( = ?auto_431173 ?auto_431179 ) ) ( not ( = ?auto_431173 ?auto_431180 ) ) ( not ( = ?auto_431173 ?auto_431181 ) ) ( not ( = ?auto_431173 ?auto_431182 ) ) ( not ( = ?auto_431173 ?auto_431183 ) ) ( not ( = ?auto_431174 ?auto_431175 ) ) ( not ( = ?auto_431174 ?auto_431176 ) ) ( not ( = ?auto_431174 ?auto_431177 ) ) ( not ( = ?auto_431174 ?auto_431178 ) ) ( not ( = ?auto_431174 ?auto_431179 ) ) ( not ( = ?auto_431174 ?auto_431180 ) ) ( not ( = ?auto_431174 ?auto_431181 ) ) ( not ( = ?auto_431174 ?auto_431182 ) ) ( not ( = ?auto_431174 ?auto_431183 ) ) ( not ( = ?auto_431175 ?auto_431176 ) ) ( not ( = ?auto_431175 ?auto_431177 ) ) ( not ( = ?auto_431175 ?auto_431178 ) ) ( not ( = ?auto_431175 ?auto_431179 ) ) ( not ( = ?auto_431175 ?auto_431180 ) ) ( not ( = ?auto_431175 ?auto_431181 ) ) ( not ( = ?auto_431175 ?auto_431182 ) ) ( not ( = ?auto_431175 ?auto_431183 ) ) ( not ( = ?auto_431176 ?auto_431177 ) ) ( not ( = ?auto_431176 ?auto_431178 ) ) ( not ( = ?auto_431176 ?auto_431179 ) ) ( not ( = ?auto_431176 ?auto_431180 ) ) ( not ( = ?auto_431176 ?auto_431181 ) ) ( not ( = ?auto_431176 ?auto_431182 ) ) ( not ( = ?auto_431176 ?auto_431183 ) ) ( not ( = ?auto_431177 ?auto_431178 ) ) ( not ( = ?auto_431177 ?auto_431179 ) ) ( not ( = ?auto_431177 ?auto_431180 ) ) ( not ( = ?auto_431177 ?auto_431181 ) ) ( not ( = ?auto_431177 ?auto_431182 ) ) ( not ( = ?auto_431177 ?auto_431183 ) ) ( not ( = ?auto_431178 ?auto_431179 ) ) ( not ( = ?auto_431178 ?auto_431180 ) ) ( not ( = ?auto_431178 ?auto_431181 ) ) ( not ( = ?auto_431178 ?auto_431182 ) ) ( not ( = ?auto_431178 ?auto_431183 ) ) ( not ( = ?auto_431179 ?auto_431180 ) ) ( not ( = ?auto_431179 ?auto_431181 ) ) ( not ( = ?auto_431179 ?auto_431182 ) ) ( not ( = ?auto_431179 ?auto_431183 ) ) ( not ( = ?auto_431180 ?auto_431181 ) ) ( not ( = ?auto_431180 ?auto_431182 ) ) ( not ( = ?auto_431180 ?auto_431183 ) ) ( not ( = ?auto_431181 ?auto_431182 ) ) ( not ( = ?auto_431181 ?auto_431183 ) ) ( not ( = ?auto_431182 ?auto_431183 ) ) ( ON ?auto_431181 ?auto_431182 ) ( ON ?auto_431180 ?auto_431181 ) ( ON ?auto_431179 ?auto_431180 ) ( ON ?auto_431178 ?auto_431179 ) ( ON ?auto_431177 ?auto_431178 ) ( ON ?auto_431176 ?auto_431177 ) ( ON ?auto_431175 ?auto_431176 ) ( ON ?auto_431174 ?auto_431175 ) ( ON ?auto_431173 ?auto_431174 ) ( ON ?auto_431172 ?auto_431173 ) ( ON ?auto_431171 ?auto_431172 ) ( CLEAR ?auto_431171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431171 )
      ( MAKE-12PILE ?auto_431171 ?auto_431172 ?auto_431173 ?auto_431174 ?auto_431175 ?auto_431176 ?auto_431177 ?auto_431178 ?auto_431179 ?auto_431180 ?auto_431181 ?auto_431182 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431197 - BLOCK
      ?auto_431198 - BLOCK
      ?auto_431199 - BLOCK
      ?auto_431200 - BLOCK
      ?auto_431201 - BLOCK
      ?auto_431202 - BLOCK
      ?auto_431203 - BLOCK
      ?auto_431204 - BLOCK
      ?auto_431205 - BLOCK
      ?auto_431206 - BLOCK
      ?auto_431207 - BLOCK
      ?auto_431208 - BLOCK
      ?auto_431209 - BLOCK
    )
    :vars
    (
      ?auto_431210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431208 ) ( ON ?auto_431209 ?auto_431210 ) ( CLEAR ?auto_431209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431197 ) ( ON ?auto_431198 ?auto_431197 ) ( ON ?auto_431199 ?auto_431198 ) ( ON ?auto_431200 ?auto_431199 ) ( ON ?auto_431201 ?auto_431200 ) ( ON ?auto_431202 ?auto_431201 ) ( ON ?auto_431203 ?auto_431202 ) ( ON ?auto_431204 ?auto_431203 ) ( ON ?auto_431205 ?auto_431204 ) ( ON ?auto_431206 ?auto_431205 ) ( ON ?auto_431207 ?auto_431206 ) ( ON ?auto_431208 ?auto_431207 ) ( not ( = ?auto_431197 ?auto_431198 ) ) ( not ( = ?auto_431197 ?auto_431199 ) ) ( not ( = ?auto_431197 ?auto_431200 ) ) ( not ( = ?auto_431197 ?auto_431201 ) ) ( not ( = ?auto_431197 ?auto_431202 ) ) ( not ( = ?auto_431197 ?auto_431203 ) ) ( not ( = ?auto_431197 ?auto_431204 ) ) ( not ( = ?auto_431197 ?auto_431205 ) ) ( not ( = ?auto_431197 ?auto_431206 ) ) ( not ( = ?auto_431197 ?auto_431207 ) ) ( not ( = ?auto_431197 ?auto_431208 ) ) ( not ( = ?auto_431197 ?auto_431209 ) ) ( not ( = ?auto_431197 ?auto_431210 ) ) ( not ( = ?auto_431198 ?auto_431199 ) ) ( not ( = ?auto_431198 ?auto_431200 ) ) ( not ( = ?auto_431198 ?auto_431201 ) ) ( not ( = ?auto_431198 ?auto_431202 ) ) ( not ( = ?auto_431198 ?auto_431203 ) ) ( not ( = ?auto_431198 ?auto_431204 ) ) ( not ( = ?auto_431198 ?auto_431205 ) ) ( not ( = ?auto_431198 ?auto_431206 ) ) ( not ( = ?auto_431198 ?auto_431207 ) ) ( not ( = ?auto_431198 ?auto_431208 ) ) ( not ( = ?auto_431198 ?auto_431209 ) ) ( not ( = ?auto_431198 ?auto_431210 ) ) ( not ( = ?auto_431199 ?auto_431200 ) ) ( not ( = ?auto_431199 ?auto_431201 ) ) ( not ( = ?auto_431199 ?auto_431202 ) ) ( not ( = ?auto_431199 ?auto_431203 ) ) ( not ( = ?auto_431199 ?auto_431204 ) ) ( not ( = ?auto_431199 ?auto_431205 ) ) ( not ( = ?auto_431199 ?auto_431206 ) ) ( not ( = ?auto_431199 ?auto_431207 ) ) ( not ( = ?auto_431199 ?auto_431208 ) ) ( not ( = ?auto_431199 ?auto_431209 ) ) ( not ( = ?auto_431199 ?auto_431210 ) ) ( not ( = ?auto_431200 ?auto_431201 ) ) ( not ( = ?auto_431200 ?auto_431202 ) ) ( not ( = ?auto_431200 ?auto_431203 ) ) ( not ( = ?auto_431200 ?auto_431204 ) ) ( not ( = ?auto_431200 ?auto_431205 ) ) ( not ( = ?auto_431200 ?auto_431206 ) ) ( not ( = ?auto_431200 ?auto_431207 ) ) ( not ( = ?auto_431200 ?auto_431208 ) ) ( not ( = ?auto_431200 ?auto_431209 ) ) ( not ( = ?auto_431200 ?auto_431210 ) ) ( not ( = ?auto_431201 ?auto_431202 ) ) ( not ( = ?auto_431201 ?auto_431203 ) ) ( not ( = ?auto_431201 ?auto_431204 ) ) ( not ( = ?auto_431201 ?auto_431205 ) ) ( not ( = ?auto_431201 ?auto_431206 ) ) ( not ( = ?auto_431201 ?auto_431207 ) ) ( not ( = ?auto_431201 ?auto_431208 ) ) ( not ( = ?auto_431201 ?auto_431209 ) ) ( not ( = ?auto_431201 ?auto_431210 ) ) ( not ( = ?auto_431202 ?auto_431203 ) ) ( not ( = ?auto_431202 ?auto_431204 ) ) ( not ( = ?auto_431202 ?auto_431205 ) ) ( not ( = ?auto_431202 ?auto_431206 ) ) ( not ( = ?auto_431202 ?auto_431207 ) ) ( not ( = ?auto_431202 ?auto_431208 ) ) ( not ( = ?auto_431202 ?auto_431209 ) ) ( not ( = ?auto_431202 ?auto_431210 ) ) ( not ( = ?auto_431203 ?auto_431204 ) ) ( not ( = ?auto_431203 ?auto_431205 ) ) ( not ( = ?auto_431203 ?auto_431206 ) ) ( not ( = ?auto_431203 ?auto_431207 ) ) ( not ( = ?auto_431203 ?auto_431208 ) ) ( not ( = ?auto_431203 ?auto_431209 ) ) ( not ( = ?auto_431203 ?auto_431210 ) ) ( not ( = ?auto_431204 ?auto_431205 ) ) ( not ( = ?auto_431204 ?auto_431206 ) ) ( not ( = ?auto_431204 ?auto_431207 ) ) ( not ( = ?auto_431204 ?auto_431208 ) ) ( not ( = ?auto_431204 ?auto_431209 ) ) ( not ( = ?auto_431204 ?auto_431210 ) ) ( not ( = ?auto_431205 ?auto_431206 ) ) ( not ( = ?auto_431205 ?auto_431207 ) ) ( not ( = ?auto_431205 ?auto_431208 ) ) ( not ( = ?auto_431205 ?auto_431209 ) ) ( not ( = ?auto_431205 ?auto_431210 ) ) ( not ( = ?auto_431206 ?auto_431207 ) ) ( not ( = ?auto_431206 ?auto_431208 ) ) ( not ( = ?auto_431206 ?auto_431209 ) ) ( not ( = ?auto_431206 ?auto_431210 ) ) ( not ( = ?auto_431207 ?auto_431208 ) ) ( not ( = ?auto_431207 ?auto_431209 ) ) ( not ( = ?auto_431207 ?auto_431210 ) ) ( not ( = ?auto_431208 ?auto_431209 ) ) ( not ( = ?auto_431208 ?auto_431210 ) ) ( not ( = ?auto_431209 ?auto_431210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431209 ?auto_431210 )
      ( !STACK ?auto_431209 ?auto_431208 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431224 - BLOCK
      ?auto_431225 - BLOCK
      ?auto_431226 - BLOCK
      ?auto_431227 - BLOCK
      ?auto_431228 - BLOCK
      ?auto_431229 - BLOCK
      ?auto_431230 - BLOCK
      ?auto_431231 - BLOCK
      ?auto_431232 - BLOCK
      ?auto_431233 - BLOCK
      ?auto_431234 - BLOCK
      ?auto_431235 - BLOCK
      ?auto_431236 - BLOCK
    )
    :vars
    (
      ?auto_431237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431235 ) ( ON ?auto_431236 ?auto_431237 ) ( CLEAR ?auto_431236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431224 ) ( ON ?auto_431225 ?auto_431224 ) ( ON ?auto_431226 ?auto_431225 ) ( ON ?auto_431227 ?auto_431226 ) ( ON ?auto_431228 ?auto_431227 ) ( ON ?auto_431229 ?auto_431228 ) ( ON ?auto_431230 ?auto_431229 ) ( ON ?auto_431231 ?auto_431230 ) ( ON ?auto_431232 ?auto_431231 ) ( ON ?auto_431233 ?auto_431232 ) ( ON ?auto_431234 ?auto_431233 ) ( ON ?auto_431235 ?auto_431234 ) ( not ( = ?auto_431224 ?auto_431225 ) ) ( not ( = ?auto_431224 ?auto_431226 ) ) ( not ( = ?auto_431224 ?auto_431227 ) ) ( not ( = ?auto_431224 ?auto_431228 ) ) ( not ( = ?auto_431224 ?auto_431229 ) ) ( not ( = ?auto_431224 ?auto_431230 ) ) ( not ( = ?auto_431224 ?auto_431231 ) ) ( not ( = ?auto_431224 ?auto_431232 ) ) ( not ( = ?auto_431224 ?auto_431233 ) ) ( not ( = ?auto_431224 ?auto_431234 ) ) ( not ( = ?auto_431224 ?auto_431235 ) ) ( not ( = ?auto_431224 ?auto_431236 ) ) ( not ( = ?auto_431224 ?auto_431237 ) ) ( not ( = ?auto_431225 ?auto_431226 ) ) ( not ( = ?auto_431225 ?auto_431227 ) ) ( not ( = ?auto_431225 ?auto_431228 ) ) ( not ( = ?auto_431225 ?auto_431229 ) ) ( not ( = ?auto_431225 ?auto_431230 ) ) ( not ( = ?auto_431225 ?auto_431231 ) ) ( not ( = ?auto_431225 ?auto_431232 ) ) ( not ( = ?auto_431225 ?auto_431233 ) ) ( not ( = ?auto_431225 ?auto_431234 ) ) ( not ( = ?auto_431225 ?auto_431235 ) ) ( not ( = ?auto_431225 ?auto_431236 ) ) ( not ( = ?auto_431225 ?auto_431237 ) ) ( not ( = ?auto_431226 ?auto_431227 ) ) ( not ( = ?auto_431226 ?auto_431228 ) ) ( not ( = ?auto_431226 ?auto_431229 ) ) ( not ( = ?auto_431226 ?auto_431230 ) ) ( not ( = ?auto_431226 ?auto_431231 ) ) ( not ( = ?auto_431226 ?auto_431232 ) ) ( not ( = ?auto_431226 ?auto_431233 ) ) ( not ( = ?auto_431226 ?auto_431234 ) ) ( not ( = ?auto_431226 ?auto_431235 ) ) ( not ( = ?auto_431226 ?auto_431236 ) ) ( not ( = ?auto_431226 ?auto_431237 ) ) ( not ( = ?auto_431227 ?auto_431228 ) ) ( not ( = ?auto_431227 ?auto_431229 ) ) ( not ( = ?auto_431227 ?auto_431230 ) ) ( not ( = ?auto_431227 ?auto_431231 ) ) ( not ( = ?auto_431227 ?auto_431232 ) ) ( not ( = ?auto_431227 ?auto_431233 ) ) ( not ( = ?auto_431227 ?auto_431234 ) ) ( not ( = ?auto_431227 ?auto_431235 ) ) ( not ( = ?auto_431227 ?auto_431236 ) ) ( not ( = ?auto_431227 ?auto_431237 ) ) ( not ( = ?auto_431228 ?auto_431229 ) ) ( not ( = ?auto_431228 ?auto_431230 ) ) ( not ( = ?auto_431228 ?auto_431231 ) ) ( not ( = ?auto_431228 ?auto_431232 ) ) ( not ( = ?auto_431228 ?auto_431233 ) ) ( not ( = ?auto_431228 ?auto_431234 ) ) ( not ( = ?auto_431228 ?auto_431235 ) ) ( not ( = ?auto_431228 ?auto_431236 ) ) ( not ( = ?auto_431228 ?auto_431237 ) ) ( not ( = ?auto_431229 ?auto_431230 ) ) ( not ( = ?auto_431229 ?auto_431231 ) ) ( not ( = ?auto_431229 ?auto_431232 ) ) ( not ( = ?auto_431229 ?auto_431233 ) ) ( not ( = ?auto_431229 ?auto_431234 ) ) ( not ( = ?auto_431229 ?auto_431235 ) ) ( not ( = ?auto_431229 ?auto_431236 ) ) ( not ( = ?auto_431229 ?auto_431237 ) ) ( not ( = ?auto_431230 ?auto_431231 ) ) ( not ( = ?auto_431230 ?auto_431232 ) ) ( not ( = ?auto_431230 ?auto_431233 ) ) ( not ( = ?auto_431230 ?auto_431234 ) ) ( not ( = ?auto_431230 ?auto_431235 ) ) ( not ( = ?auto_431230 ?auto_431236 ) ) ( not ( = ?auto_431230 ?auto_431237 ) ) ( not ( = ?auto_431231 ?auto_431232 ) ) ( not ( = ?auto_431231 ?auto_431233 ) ) ( not ( = ?auto_431231 ?auto_431234 ) ) ( not ( = ?auto_431231 ?auto_431235 ) ) ( not ( = ?auto_431231 ?auto_431236 ) ) ( not ( = ?auto_431231 ?auto_431237 ) ) ( not ( = ?auto_431232 ?auto_431233 ) ) ( not ( = ?auto_431232 ?auto_431234 ) ) ( not ( = ?auto_431232 ?auto_431235 ) ) ( not ( = ?auto_431232 ?auto_431236 ) ) ( not ( = ?auto_431232 ?auto_431237 ) ) ( not ( = ?auto_431233 ?auto_431234 ) ) ( not ( = ?auto_431233 ?auto_431235 ) ) ( not ( = ?auto_431233 ?auto_431236 ) ) ( not ( = ?auto_431233 ?auto_431237 ) ) ( not ( = ?auto_431234 ?auto_431235 ) ) ( not ( = ?auto_431234 ?auto_431236 ) ) ( not ( = ?auto_431234 ?auto_431237 ) ) ( not ( = ?auto_431235 ?auto_431236 ) ) ( not ( = ?auto_431235 ?auto_431237 ) ) ( not ( = ?auto_431236 ?auto_431237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431236 ?auto_431237 )
      ( !STACK ?auto_431236 ?auto_431235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431251 - BLOCK
      ?auto_431252 - BLOCK
      ?auto_431253 - BLOCK
      ?auto_431254 - BLOCK
      ?auto_431255 - BLOCK
      ?auto_431256 - BLOCK
      ?auto_431257 - BLOCK
      ?auto_431258 - BLOCK
      ?auto_431259 - BLOCK
      ?auto_431260 - BLOCK
      ?auto_431261 - BLOCK
      ?auto_431262 - BLOCK
      ?auto_431263 - BLOCK
    )
    :vars
    (
      ?auto_431264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431263 ?auto_431264 ) ( ON-TABLE ?auto_431251 ) ( ON ?auto_431252 ?auto_431251 ) ( ON ?auto_431253 ?auto_431252 ) ( ON ?auto_431254 ?auto_431253 ) ( ON ?auto_431255 ?auto_431254 ) ( ON ?auto_431256 ?auto_431255 ) ( ON ?auto_431257 ?auto_431256 ) ( ON ?auto_431258 ?auto_431257 ) ( ON ?auto_431259 ?auto_431258 ) ( ON ?auto_431260 ?auto_431259 ) ( ON ?auto_431261 ?auto_431260 ) ( not ( = ?auto_431251 ?auto_431252 ) ) ( not ( = ?auto_431251 ?auto_431253 ) ) ( not ( = ?auto_431251 ?auto_431254 ) ) ( not ( = ?auto_431251 ?auto_431255 ) ) ( not ( = ?auto_431251 ?auto_431256 ) ) ( not ( = ?auto_431251 ?auto_431257 ) ) ( not ( = ?auto_431251 ?auto_431258 ) ) ( not ( = ?auto_431251 ?auto_431259 ) ) ( not ( = ?auto_431251 ?auto_431260 ) ) ( not ( = ?auto_431251 ?auto_431261 ) ) ( not ( = ?auto_431251 ?auto_431262 ) ) ( not ( = ?auto_431251 ?auto_431263 ) ) ( not ( = ?auto_431251 ?auto_431264 ) ) ( not ( = ?auto_431252 ?auto_431253 ) ) ( not ( = ?auto_431252 ?auto_431254 ) ) ( not ( = ?auto_431252 ?auto_431255 ) ) ( not ( = ?auto_431252 ?auto_431256 ) ) ( not ( = ?auto_431252 ?auto_431257 ) ) ( not ( = ?auto_431252 ?auto_431258 ) ) ( not ( = ?auto_431252 ?auto_431259 ) ) ( not ( = ?auto_431252 ?auto_431260 ) ) ( not ( = ?auto_431252 ?auto_431261 ) ) ( not ( = ?auto_431252 ?auto_431262 ) ) ( not ( = ?auto_431252 ?auto_431263 ) ) ( not ( = ?auto_431252 ?auto_431264 ) ) ( not ( = ?auto_431253 ?auto_431254 ) ) ( not ( = ?auto_431253 ?auto_431255 ) ) ( not ( = ?auto_431253 ?auto_431256 ) ) ( not ( = ?auto_431253 ?auto_431257 ) ) ( not ( = ?auto_431253 ?auto_431258 ) ) ( not ( = ?auto_431253 ?auto_431259 ) ) ( not ( = ?auto_431253 ?auto_431260 ) ) ( not ( = ?auto_431253 ?auto_431261 ) ) ( not ( = ?auto_431253 ?auto_431262 ) ) ( not ( = ?auto_431253 ?auto_431263 ) ) ( not ( = ?auto_431253 ?auto_431264 ) ) ( not ( = ?auto_431254 ?auto_431255 ) ) ( not ( = ?auto_431254 ?auto_431256 ) ) ( not ( = ?auto_431254 ?auto_431257 ) ) ( not ( = ?auto_431254 ?auto_431258 ) ) ( not ( = ?auto_431254 ?auto_431259 ) ) ( not ( = ?auto_431254 ?auto_431260 ) ) ( not ( = ?auto_431254 ?auto_431261 ) ) ( not ( = ?auto_431254 ?auto_431262 ) ) ( not ( = ?auto_431254 ?auto_431263 ) ) ( not ( = ?auto_431254 ?auto_431264 ) ) ( not ( = ?auto_431255 ?auto_431256 ) ) ( not ( = ?auto_431255 ?auto_431257 ) ) ( not ( = ?auto_431255 ?auto_431258 ) ) ( not ( = ?auto_431255 ?auto_431259 ) ) ( not ( = ?auto_431255 ?auto_431260 ) ) ( not ( = ?auto_431255 ?auto_431261 ) ) ( not ( = ?auto_431255 ?auto_431262 ) ) ( not ( = ?auto_431255 ?auto_431263 ) ) ( not ( = ?auto_431255 ?auto_431264 ) ) ( not ( = ?auto_431256 ?auto_431257 ) ) ( not ( = ?auto_431256 ?auto_431258 ) ) ( not ( = ?auto_431256 ?auto_431259 ) ) ( not ( = ?auto_431256 ?auto_431260 ) ) ( not ( = ?auto_431256 ?auto_431261 ) ) ( not ( = ?auto_431256 ?auto_431262 ) ) ( not ( = ?auto_431256 ?auto_431263 ) ) ( not ( = ?auto_431256 ?auto_431264 ) ) ( not ( = ?auto_431257 ?auto_431258 ) ) ( not ( = ?auto_431257 ?auto_431259 ) ) ( not ( = ?auto_431257 ?auto_431260 ) ) ( not ( = ?auto_431257 ?auto_431261 ) ) ( not ( = ?auto_431257 ?auto_431262 ) ) ( not ( = ?auto_431257 ?auto_431263 ) ) ( not ( = ?auto_431257 ?auto_431264 ) ) ( not ( = ?auto_431258 ?auto_431259 ) ) ( not ( = ?auto_431258 ?auto_431260 ) ) ( not ( = ?auto_431258 ?auto_431261 ) ) ( not ( = ?auto_431258 ?auto_431262 ) ) ( not ( = ?auto_431258 ?auto_431263 ) ) ( not ( = ?auto_431258 ?auto_431264 ) ) ( not ( = ?auto_431259 ?auto_431260 ) ) ( not ( = ?auto_431259 ?auto_431261 ) ) ( not ( = ?auto_431259 ?auto_431262 ) ) ( not ( = ?auto_431259 ?auto_431263 ) ) ( not ( = ?auto_431259 ?auto_431264 ) ) ( not ( = ?auto_431260 ?auto_431261 ) ) ( not ( = ?auto_431260 ?auto_431262 ) ) ( not ( = ?auto_431260 ?auto_431263 ) ) ( not ( = ?auto_431260 ?auto_431264 ) ) ( not ( = ?auto_431261 ?auto_431262 ) ) ( not ( = ?auto_431261 ?auto_431263 ) ) ( not ( = ?auto_431261 ?auto_431264 ) ) ( not ( = ?auto_431262 ?auto_431263 ) ) ( not ( = ?auto_431262 ?auto_431264 ) ) ( not ( = ?auto_431263 ?auto_431264 ) ) ( CLEAR ?auto_431261 ) ( ON ?auto_431262 ?auto_431263 ) ( CLEAR ?auto_431262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_431251 ?auto_431252 ?auto_431253 ?auto_431254 ?auto_431255 ?auto_431256 ?auto_431257 ?auto_431258 ?auto_431259 ?auto_431260 ?auto_431261 ?auto_431262 )
      ( MAKE-13PILE ?auto_431251 ?auto_431252 ?auto_431253 ?auto_431254 ?auto_431255 ?auto_431256 ?auto_431257 ?auto_431258 ?auto_431259 ?auto_431260 ?auto_431261 ?auto_431262 ?auto_431263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431278 - BLOCK
      ?auto_431279 - BLOCK
      ?auto_431280 - BLOCK
      ?auto_431281 - BLOCK
      ?auto_431282 - BLOCK
      ?auto_431283 - BLOCK
      ?auto_431284 - BLOCK
      ?auto_431285 - BLOCK
      ?auto_431286 - BLOCK
      ?auto_431287 - BLOCK
      ?auto_431288 - BLOCK
      ?auto_431289 - BLOCK
      ?auto_431290 - BLOCK
    )
    :vars
    (
      ?auto_431291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431290 ?auto_431291 ) ( ON-TABLE ?auto_431278 ) ( ON ?auto_431279 ?auto_431278 ) ( ON ?auto_431280 ?auto_431279 ) ( ON ?auto_431281 ?auto_431280 ) ( ON ?auto_431282 ?auto_431281 ) ( ON ?auto_431283 ?auto_431282 ) ( ON ?auto_431284 ?auto_431283 ) ( ON ?auto_431285 ?auto_431284 ) ( ON ?auto_431286 ?auto_431285 ) ( ON ?auto_431287 ?auto_431286 ) ( ON ?auto_431288 ?auto_431287 ) ( not ( = ?auto_431278 ?auto_431279 ) ) ( not ( = ?auto_431278 ?auto_431280 ) ) ( not ( = ?auto_431278 ?auto_431281 ) ) ( not ( = ?auto_431278 ?auto_431282 ) ) ( not ( = ?auto_431278 ?auto_431283 ) ) ( not ( = ?auto_431278 ?auto_431284 ) ) ( not ( = ?auto_431278 ?auto_431285 ) ) ( not ( = ?auto_431278 ?auto_431286 ) ) ( not ( = ?auto_431278 ?auto_431287 ) ) ( not ( = ?auto_431278 ?auto_431288 ) ) ( not ( = ?auto_431278 ?auto_431289 ) ) ( not ( = ?auto_431278 ?auto_431290 ) ) ( not ( = ?auto_431278 ?auto_431291 ) ) ( not ( = ?auto_431279 ?auto_431280 ) ) ( not ( = ?auto_431279 ?auto_431281 ) ) ( not ( = ?auto_431279 ?auto_431282 ) ) ( not ( = ?auto_431279 ?auto_431283 ) ) ( not ( = ?auto_431279 ?auto_431284 ) ) ( not ( = ?auto_431279 ?auto_431285 ) ) ( not ( = ?auto_431279 ?auto_431286 ) ) ( not ( = ?auto_431279 ?auto_431287 ) ) ( not ( = ?auto_431279 ?auto_431288 ) ) ( not ( = ?auto_431279 ?auto_431289 ) ) ( not ( = ?auto_431279 ?auto_431290 ) ) ( not ( = ?auto_431279 ?auto_431291 ) ) ( not ( = ?auto_431280 ?auto_431281 ) ) ( not ( = ?auto_431280 ?auto_431282 ) ) ( not ( = ?auto_431280 ?auto_431283 ) ) ( not ( = ?auto_431280 ?auto_431284 ) ) ( not ( = ?auto_431280 ?auto_431285 ) ) ( not ( = ?auto_431280 ?auto_431286 ) ) ( not ( = ?auto_431280 ?auto_431287 ) ) ( not ( = ?auto_431280 ?auto_431288 ) ) ( not ( = ?auto_431280 ?auto_431289 ) ) ( not ( = ?auto_431280 ?auto_431290 ) ) ( not ( = ?auto_431280 ?auto_431291 ) ) ( not ( = ?auto_431281 ?auto_431282 ) ) ( not ( = ?auto_431281 ?auto_431283 ) ) ( not ( = ?auto_431281 ?auto_431284 ) ) ( not ( = ?auto_431281 ?auto_431285 ) ) ( not ( = ?auto_431281 ?auto_431286 ) ) ( not ( = ?auto_431281 ?auto_431287 ) ) ( not ( = ?auto_431281 ?auto_431288 ) ) ( not ( = ?auto_431281 ?auto_431289 ) ) ( not ( = ?auto_431281 ?auto_431290 ) ) ( not ( = ?auto_431281 ?auto_431291 ) ) ( not ( = ?auto_431282 ?auto_431283 ) ) ( not ( = ?auto_431282 ?auto_431284 ) ) ( not ( = ?auto_431282 ?auto_431285 ) ) ( not ( = ?auto_431282 ?auto_431286 ) ) ( not ( = ?auto_431282 ?auto_431287 ) ) ( not ( = ?auto_431282 ?auto_431288 ) ) ( not ( = ?auto_431282 ?auto_431289 ) ) ( not ( = ?auto_431282 ?auto_431290 ) ) ( not ( = ?auto_431282 ?auto_431291 ) ) ( not ( = ?auto_431283 ?auto_431284 ) ) ( not ( = ?auto_431283 ?auto_431285 ) ) ( not ( = ?auto_431283 ?auto_431286 ) ) ( not ( = ?auto_431283 ?auto_431287 ) ) ( not ( = ?auto_431283 ?auto_431288 ) ) ( not ( = ?auto_431283 ?auto_431289 ) ) ( not ( = ?auto_431283 ?auto_431290 ) ) ( not ( = ?auto_431283 ?auto_431291 ) ) ( not ( = ?auto_431284 ?auto_431285 ) ) ( not ( = ?auto_431284 ?auto_431286 ) ) ( not ( = ?auto_431284 ?auto_431287 ) ) ( not ( = ?auto_431284 ?auto_431288 ) ) ( not ( = ?auto_431284 ?auto_431289 ) ) ( not ( = ?auto_431284 ?auto_431290 ) ) ( not ( = ?auto_431284 ?auto_431291 ) ) ( not ( = ?auto_431285 ?auto_431286 ) ) ( not ( = ?auto_431285 ?auto_431287 ) ) ( not ( = ?auto_431285 ?auto_431288 ) ) ( not ( = ?auto_431285 ?auto_431289 ) ) ( not ( = ?auto_431285 ?auto_431290 ) ) ( not ( = ?auto_431285 ?auto_431291 ) ) ( not ( = ?auto_431286 ?auto_431287 ) ) ( not ( = ?auto_431286 ?auto_431288 ) ) ( not ( = ?auto_431286 ?auto_431289 ) ) ( not ( = ?auto_431286 ?auto_431290 ) ) ( not ( = ?auto_431286 ?auto_431291 ) ) ( not ( = ?auto_431287 ?auto_431288 ) ) ( not ( = ?auto_431287 ?auto_431289 ) ) ( not ( = ?auto_431287 ?auto_431290 ) ) ( not ( = ?auto_431287 ?auto_431291 ) ) ( not ( = ?auto_431288 ?auto_431289 ) ) ( not ( = ?auto_431288 ?auto_431290 ) ) ( not ( = ?auto_431288 ?auto_431291 ) ) ( not ( = ?auto_431289 ?auto_431290 ) ) ( not ( = ?auto_431289 ?auto_431291 ) ) ( not ( = ?auto_431290 ?auto_431291 ) ) ( CLEAR ?auto_431288 ) ( ON ?auto_431289 ?auto_431290 ) ( CLEAR ?auto_431289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_431278 ?auto_431279 ?auto_431280 ?auto_431281 ?auto_431282 ?auto_431283 ?auto_431284 ?auto_431285 ?auto_431286 ?auto_431287 ?auto_431288 ?auto_431289 )
      ( MAKE-13PILE ?auto_431278 ?auto_431279 ?auto_431280 ?auto_431281 ?auto_431282 ?auto_431283 ?auto_431284 ?auto_431285 ?auto_431286 ?auto_431287 ?auto_431288 ?auto_431289 ?auto_431290 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431305 - BLOCK
      ?auto_431306 - BLOCK
      ?auto_431307 - BLOCK
      ?auto_431308 - BLOCK
      ?auto_431309 - BLOCK
      ?auto_431310 - BLOCK
      ?auto_431311 - BLOCK
      ?auto_431312 - BLOCK
      ?auto_431313 - BLOCK
      ?auto_431314 - BLOCK
      ?auto_431315 - BLOCK
      ?auto_431316 - BLOCK
      ?auto_431317 - BLOCK
    )
    :vars
    (
      ?auto_431318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431317 ?auto_431318 ) ( ON-TABLE ?auto_431305 ) ( ON ?auto_431306 ?auto_431305 ) ( ON ?auto_431307 ?auto_431306 ) ( ON ?auto_431308 ?auto_431307 ) ( ON ?auto_431309 ?auto_431308 ) ( ON ?auto_431310 ?auto_431309 ) ( ON ?auto_431311 ?auto_431310 ) ( ON ?auto_431312 ?auto_431311 ) ( ON ?auto_431313 ?auto_431312 ) ( ON ?auto_431314 ?auto_431313 ) ( not ( = ?auto_431305 ?auto_431306 ) ) ( not ( = ?auto_431305 ?auto_431307 ) ) ( not ( = ?auto_431305 ?auto_431308 ) ) ( not ( = ?auto_431305 ?auto_431309 ) ) ( not ( = ?auto_431305 ?auto_431310 ) ) ( not ( = ?auto_431305 ?auto_431311 ) ) ( not ( = ?auto_431305 ?auto_431312 ) ) ( not ( = ?auto_431305 ?auto_431313 ) ) ( not ( = ?auto_431305 ?auto_431314 ) ) ( not ( = ?auto_431305 ?auto_431315 ) ) ( not ( = ?auto_431305 ?auto_431316 ) ) ( not ( = ?auto_431305 ?auto_431317 ) ) ( not ( = ?auto_431305 ?auto_431318 ) ) ( not ( = ?auto_431306 ?auto_431307 ) ) ( not ( = ?auto_431306 ?auto_431308 ) ) ( not ( = ?auto_431306 ?auto_431309 ) ) ( not ( = ?auto_431306 ?auto_431310 ) ) ( not ( = ?auto_431306 ?auto_431311 ) ) ( not ( = ?auto_431306 ?auto_431312 ) ) ( not ( = ?auto_431306 ?auto_431313 ) ) ( not ( = ?auto_431306 ?auto_431314 ) ) ( not ( = ?auto_431306 ?auto_431315 ) ) ( not ( = ?auto_431306 ?auto_431316 ) ) ( not ( = ?auto_431306 ?auto_431317 ) ) ( not ( = ?auto_431306 ?auto_431318 ) ) ( not ( = ?auto_431307 ?auto_431308 ) ) ( not ( = ?auto_431307 ?auto_431309 ) ) ( not ( = ?auto_431307 ?auto_431310 ) ) ( not ( = ?auto_431307 ?auto_431311 ) ) ( not ( = ?auto_431307 ?auto_431312 ) ) ( not ( = ?auto_431307 ?auto_431313 ) ) ( not ( = ?auto_431307 ?auto_431314 ) ) ( not ( = ?auto_431307 ?auto_431315 ) ) ( not ( = ?auto_431307 ?auto_431316 ) ) ( not ( = ?auto_431307 ?auto_431317 ) ) ( not ( = ?auto_431307 ?auto_431318 ) ) ( not ( = ?auto_431308 ?auto_431309 ) ) ( not ( = ?auto_431308 ?auto_431310 ) ) ( not ( = ?auto_431308 ?auto_431311 ) ) ( not ( = ?auto_431308 ?auto_431312 ) ) ( not ( = ?auto_431308 ?auto_431313 ) ) ( not ( = ?auto_431308 ?auto_431314 ) ) ( not ( = ?auto_431308 ?auto_431315 ) ) ( not ( = ?auto_431308 ?auto_431316 ) ) ( not ( = ?auto_431308 ?auto_431317 ) ) ( not ( = ?auto_431308 ?auto_431318 ) ) ( not ( = ?auto_431309 ?auto_431310 ) ) ( not ( = ?auto_431309 ?auto_431311 ) ) ( not ( = ?auto_431309 ?auto_431312 ) ) ( not ( = ?auto_431309 ?auto_431313 ) ) ( not ( = ?auto_431309 ?auto_431314 ) ) ( not ( = ?auto_431309 ?auto_431315 ) ) ( not ( = ?auto_431309 ?auto_431316 ) ) ( not ( = ?auto_431309 ?auto_431317 ) ) ( not ( = ?auto_431309 ?auto_431318 ) ) ( not ( = ?auto_431310 ?auto_431311 ) ) ( not ( = ?auto_431310 ?auto_431312 ) ) ( not ( = ?auto_431310 ?auto_431313 ) ) ( not ( = ?auto_431310 ?auto_431314 ) ) ( not ( = ?auto_431310 ?auto_431315 ) ) ( not ( = ?auto_431310 ?auto_431316 ) ) ( not ( = ?auto_431310 ?auto_431317 ) ) ( not ( = ?auto_431310 ?auto_431318 ) ) ( not ( = ?auto_431311 ?auto_431312 ) ) ( not ( = ?auto_431311 ?auto_431313 ) ) ( not ( = ?auto_431311 ?auto_431314 ) ) ( not ( = ?auto_431311 ?auto_431315 ) ) ( not ( = ?auto_431311 ?auto_431316 ) ) ( not ( = ?auto_431311 ?auto_431317 ) ) ( not ( = ?auto_431311 ?auto_431318 ) ) ( not ( = ?auto_431312 ?auto_431313 ) ) ( not ( = ?auto_431312 ?auto_431314 ) ) ( not ( = ?auto_431312 ?auto_431315 ) ) ( not ( = ?auto_431312 ?auto_431316 ) ) ( not ( = ?auto_431312 ?auto_431317 ) ) ( not ( = ?auto_431312 ?auto_431318 ) ) ( not ( = ?auto_431313 ?auto_431314 ) ) ( not ( = ?auto_431313 ?auto_431315 ) ) ( not ( = ?auto_431313 ?auto_431316 ) ) ( not ( = ?auto_431313 ?auto_431317 ) ) ( not ( = ?auto_431313 ?auto_431318 ) ) ( not ( = ?auto_431314 ?auto_431315 ) ) ( not ( = ?auto_431314 ?auto_431316 ) ) ( not ( = ?auto_431314 ?auto_431317 ) ) ( not ( = ?auto_431314 ?auto_431318 ) ) ( not ( = ?auto_431315 ?auto_431316 ) ) ( not ( = ?auto_431315 ?auto_431317 ) ) ( not ( = ?auto_431315 ?auto_431318 ) ) ( not ( = ?auto_431316 ?auto_431317 ) ) ( not ( = ?auto_431316 ?auto_431318 ) ) ( not ( = ?auto_431317 ?auto_431318 ) ) ( ON ?auto_431316 ?auto_431317 ) ( CLEAR ?auto_431314 ) ( ON ?auto_431315 ?auto_431316 ) ( CLEAR ?auto_431315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_431305 ?auto_431306 ?auto_431307 ?auto_431308 ?auto_431309 ?auto_431310 ?auto_431311 ?auto_431312 ?auto_431313 ?auto_431314 ?auto_431315 )
      ( MAKE-13PILE ?auto_431305 ?auto_431306 ?auto_431307 ?auto_431308 ?auto_431309 ?auto_431310 ?auto_431311 ?auto_431312 ?auto_431313 ?auto_431314 ?auto_431315 ?auto_431316 ?auto_431317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431332 - BLOCK
      ?auto_431333 - BLOCK
      ?auto_431334 - BLOCK
      ?auto_431335 - BLOCK
      ?auto_431336 - BLOCK
      ?auto_431337 - BLOCK
      ?auto_431338 - BLOCK
      ?auto_431339 - BLOCK
      ?auto_431340 - BLOCK
      ?auto_431341 - BLOCK
      ?auto_431342 - BLOCK
      ?auto_431343 - BLOCK
      ?auto_431344 - BLOCK
    )
    :vars
    (
      ?auto_431345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431344 ?auto_431345 ) ( ON-TABLE ?auto_431332 ) ( ON ?auto_431333 ?auto_431332 ) ( ON ?auto_431334 ?auto_431333 ) ( ON ?auto_431335 ?auto_431334 ) ( ON ?auto_431336 ?auto_431335 ) ( ON ?auto_431337 ?auto_431336 ) ( ON ?auto_431338 ?auto_431337 ) ( ON ?auto_431339 ?auto_431338 ) ( ON ?auto_431340 ?auto_431339 ) ( ON ?auto_431341 ?auto_431340 ) ( not ( = ?auto_431332 ?auto_431333 ) ) ( not ( = ?auto_431332 ?auto_431334 ) ) ( not ( = ?auto_431332 ?auto_431335 ) ) ( not ( = ?auto_431332 ?auto_431336 ) ) ( not ( = ?auto_431332 ?auto_431337 ) ) ( not ( = ?auto_431332 ?auto_431338 ) ) ( not ( = ?auto_431332 ?auto_431339 ) ) ( not ( = ?auto_431332 ?auto_431340 ) ) ( not ( = ?auto_431332 ?auto_431341 ) ) ( not ( = ?auto_431332 ?auto_431342 ) ) ( not ( = ?auto_431332 ?auto_431343 ) ) ( not ( = ?auto_431332 ?auto_431344 ) ) ( not ( = ?auto_431332 ?auto_431345 ) ) ( not ( = ?auto_431333 ?auto_431334 ) ) ( not ( = ?auto_431333 ?auto_431335 ) ) ( not ( = ?auto_431333 ?auto_431336 ) ) ( not ( = ?auto_431333 ?auto_431337 ) ) ( not ( = ?auto_431333 ?auto_431338 ) ) ( not ( = ?auto_431333 ?auto_431339 ) ) ( not ( = ?auto_431333 ?auto_431340 ) ) ( not ( = ?auto_431333 ?auto_431341 ) ) ( not ( = ?auto_431333 ?auto_431342 ) ) ( not ( = ?auto_431333 ?auto_431343 ) ) ( not ( = ?auto_431333 ?auto_431344 ) ) ( not ( = ?auto_431333 ?auto_431345 ) ) ( not ( = ?auto_431334 ?auto_431335 ) ) ( not ( = ?auto_431334 ?auto_431336 ) ) ( not ( = ?auto_431334 ?auto_431337 ) ) ( not ( = ?auto_431334 ?auto_431338 ) ) ( not ( = ?auto_431334 ?auto_431339 ) ) ( not ( = ?auto_431334 ?auto_431340 ) ) ( not ( = ?auto_431334 ?auto_431341 ) ) ( not ( = ?auto_431334 ?auto_431342 ) ) ( not ( = ?auto_431334 ?auto_431343 ) ) ( not ( = ?auto_431334 ?auto_431344 ) ) ( not ( = ?auto_431334 ?auto_431345 ) ) ( not ( = ?auto_431335 ?auto_431336 ) ) ( not ( = ?auto_431335 ?auto_431337 ) ) ( not ( = ?auto_431335 ?auto_431338 ) ) ( not ( = ?auto_431335 ?auto_431339 ) ) ( not ( = ?auto_431335 ?auto_431340 ) ) ( not ( = ?auto_431335 ?auto_431341 ) ) ( not ( = ?auto_431335 ?auto_431342 ) ) ( not ( = ?auto_431335 ?auto_431343 ) ) ( not ( = ?auto_431335 ?auto_431344 ) ) ( not ( = ?auto_431335 ?auto_431345 ) ) ( not ( = ?auto_431336 ?auto_431337 ) ) ( not ( = ?auto_431336 ?auto_431338 ) ) ( not ( = ?auto_431336 ?auto_431339 ) ) ( not ( = ?auto_431336 ?auto_431340 ) ) ( not ( = ?auto_431336 ?auto_431341 ) ) ( not ( = ?auto_431336 ?auto_431342 ) ) ( not ( = ?auto_431336 ?auto_431343 ) ) ( not ( = ?auto_431336 ?auto_431344 ) ) ( not ( = ?auto_431336 ?auto_431345 ) ) ( not ( = ?auto_431337 ?auto_431338 ) ) ( not ( = ?auto_431337 ?auto_431339 ) ) ( not ( = ?auto_431337 ?auto_431340 ) ) ( not ( = ?auto_431337 ?auto_431341 ) ) ( not ( = ?auto_431337 ?auto_431342 ) ) ( not ( = ?auto_431337 ?auto_431343 ) ) ( not ( = ?auto_431337 ?auto_431344 ) ) ( not ( = ?auto_431337 ?auto_431345 ) ) ( not ( = ?auto_431338 ?auto_431339 ) ) ( not ( = ?auto_431338 ?auto_431340 ) ) ( not ( = ?auto_431338 ?auto_431341 ) ) ( not ( = ?auto_431338 ?auto_431342 ) ) ( not ( = ?auto_431338 ?auto_431343 ) ) ( not ( = ?auto_431338 ?auto_431344 ) ) ( not ( = ?auto_431338 ?auto_431345 ) ) ( not ( = ?auto_431339 ?auto_431340 ) ) ( not ( = ?auto_431339 ?auto_431341 ) ) ( not ( = ?auto_431339 ?auto_431342 ) ) ( not ( = ?auto_431339 ?auto_431343 ) ) ( not ( = ?auto_431339 ?auto_431344 ) ) ( not ( = ?auto_431339 ?auto_431345 ) ) ( not ( = ?auto_431340 ?auto_431341 ) ) ( not ( = ?auto_431340 ?auto_431342 ) ) ( not ( = ?auto_431340 ?auto_431343 ) ) ( not ( = ?auto_431340 ?auto_431344 ) ) ( not ( = ?auto_431340 ?auto_431345 ) ) ( not ( = ?auto_431341 ?auto_431342 ) ) ( not ( = ?auto_431341 ?auto_431343 ) ) ( not ( = ?auto_431341 ?auto_431344 ) ) ( not ( = ?auto_431341 ?auto_431345 ) ) ( not ( = ?auto_431342 ?auto_431343 ) ) ( not ( = ?auto_431342 ?auto_431344 ) ) ( not ( = ?auto_431342 ?auto_431345 ) ) ( not ( = ?auto_431343 ?auto_431344 ) ) ( not ( = ?auto_431343 ?auto_431345 ) ) ( not ( = ?auto_431344 ?auto_431345 ) ) ( ON ?auto_431343 ?auto_431344 ) ( CLEAR ?auto_431341 ) ( ON ?auto_431342 ?auto_431343 ) ( CLEAR ?auto_431342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_431332 ?auto_431333 ?auto_431334 ?auto_431335 ?auto_431336 ?auto_431337 ?auto_431338 ?auto_431339 ?auto_431340 ?auto_431341 ?auto_431342 )
      ( MAKE-13PILE ?auto_431332 ?auto_431333 ?auto_431334 ?auto_431335 ?auto_431336 ?auto_431337 ?auto_431338 ?auto_431339 ?auto_431340 ?auto_431341 ?auto_431342 ?auto_431343 ?auto_431344 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431359 - BLOCK
      ?auto_431360 - BLOCK
      ?auto_431361 - BLOCK
      ?auto_431362 - BLOCK
      ?auto_431363 - BLOCK
      ?auto_431364 - BLOCK
      ?auto_431365 - BLOCK
      ?auto_431366 - BLOCK
      ?auto_431367 - BLOCK
      ?auto_431368 - BLOCK
      ?auto_431369 - BLOCK
      ?auto_431370 - BLOCK
      ?auto_431371 - BLOCK
    )
    :vars
    (
      ?auto_431372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431371 ?auto_431372 ) ( ON-TABLE ?auto_431359 ) ( ON ?auto_431360 ?auto_431359 ) ( ON ?auto_431361 ?auto_431360 ) ( ON ?auto_431362 ?auto_431361 ) ( ON ?auto_431363 ?auto_431362 ) ( ON ?auto_431364 ?auto_431363 ) ( ON ?auto_431365 ?auto_431364 ) ( ON ?auto_431366 ?auto_431365 ) ( ON ?auto_431367 ?auto_431366 ) ( not ( = ?auto_431359 ?auto_431360 ) ) ( not ( = ?auto_431359 ?auto_431361 ) ) ( not ( = ?auto_431359 ?auto_431362 ) ) ( not ( = ?auto_431359 ?auto_431363 ) ) ( not ( = ?auto_431359 ?auto_431364 ) ) ( not ( = ?auto_431359 ?auto_431365 ) ) ( not ( = ?auto_431359 ?auto_431366 ) ) ( not ( = ?auto_431359 ?auto_431367 ) ) ( not ( = ?auto_431359 ?auto_431368 ) ) ( not ( = ?auto_431359 ?auto_431369 ) ) ( not ( = ?auto_431359 ?auto_431370 ) ) ( not ( = ?auto_431359 ?auto_431371 ) ) ( not ( = ?auto_431359 ?auto_431372 ) ) ( not ( = ?auto_431360 ?auto_431361 ) ) ( not ( = ?auto_431360 ?auto_431362 ) ) ( not ( = ?auto_431360 ?auto_431363 ) ) ( not ( = ?auto_431360 ?auto_431364 ) ) ( not ( = ?auto_431360 ?auto_431365 ) ) ( not ( = ?auto_431360 ?auto_431366 ) ) ( not ( = ?auto_431360 ?auto_431367 ) ) ( not ( = ?auto_431360 ?auto_431368 ) ) ( not ( = ?auto_431360 ?auto_431369 ) ) ( not ( = ?auto_431360 ?auto_431370 ) ) ( not ( = ?auto_431360 ?auto_431371 ) ) ( not ( = ?auto_431360 ?auto_431372 ) ) ( not ( = ?auto_431361 ?auto_431362 ) ) ( not ( = ?auto_431361 ?auto_431363 ) ) ( not ( = ?auto_431361 ?auto_431364 ) ) ( not ( = ?auto_431361 ?auto_431365 ) ) ( not ( = ?auto_431361 ?auto_431366 ) ) ( not ( = ?auto_431361 ?auto_431367 ) ) ( not ( = ?auto_431361 ?auto_431368 ) ) ( not ( = ?auto_431361 ?auto_431369 ) ) ( not ( = ?auto_431361 ?auto_431370 ) ) ( not ( = ?auto_431361 ?auto_431371 ) ) ( not ( = ?auto_431361 ?auto_431372 ) ) ( not ( = ?auto_431362 ?auto_431363 ) ) ( not ( = ?auto_431362 ?auto_431364 ) ) ( not ( = ?auto_431362 ?auto_431365 ) ) ( not ( = ?auto_431362 ?auto_431366 ) ) ( not ( = ?auto_431362 ?auto_431367 ) ) ( not ( = ?auto_431362 ?auto_431368 ) ) ( not ( = ?auto_431362 ?auto_431369 ) ) ( not ( = ?auto_431362 ?auto_431370 ) ) ( not ( = ?auto_431362 ?auto_431371 ) ) ( not ( = ?auto_431362 ?auto_431372 ) ) ( not ( = ?auto_431363 ?auto_431364 ) ) ( not ( = ?auto_431363 ?auto_431365 ) ) ( not ( = ?auto_431363 ?auto_431366 ) ) ( not ( = ?auto_431363 ?auto_431367 ) ) ( not ( = ?auto_431363 ?auto_431368 ) ) ( not ( = ?auto_431363 ?auto_431369 ) ) ( not ( = ?auto_431363 ?auto_431370 ) ) ( not ( = ?auto_431363 ?auto_431371 ) ) ( not ( = ?auto_431363 ?auto_431372 ) ) ( not ( = ?auto_431364 ?auto_431365 ) ) ( not ( = ?auto_431364 ?auto_431366 ) ) ( not ( = ?auto_431364 ?auto_431367 ) ) ( not ( = ?auto_431364 ?auto_431368 ) ) ( not ( = ?auto_431364 ?auto_431369 ) ) ( not ( = ?auto_431364 ?auto_431370 ) ) ( not ( = ?auto_431364 ?auto_431371 ) ) ( not ( = ?auto_431364 ?auto_431372 ) ) ( not ( = ?auto_431365 ?auto_431366 ) ) ( not ( = ?auto_431365 ?auto_431367 ) ) ( not ( = ?auto_431365 ?auto_431368 ) ) ( not ( = ?auto_431365 ?auto_431369 ) ) ( not ( = ?auto_431365 ?auto_431370 ) ) ( not ( = ?auto_431365 ?auto_431371 ) ) ( not ( = ?auto_431365 ?auto_431372 ) ) ( not ( = ?auto_431366 ?auto_431367 ) ) ( not ( = ?auto_431366 ?auto_431368 ) ) ( not ( = ?auto_431366 ?auto_431369 ) ) ( not ( = ?auto_431366 ?auto_431370 ) ) ( not ( = ?auto_431366 ?auto_431371 ) ) ( not ( = ?auto_431366 ?auto_431372 ) ) ( not ( = ?auto_431367 ?auto_431368 ) ) ( not ( = ?auto_431367 ?auto_431369 ) ) ( not ( = ?auto_431367 ?auto_431370 ) ) ( not ( = ?auto_431367 ?auto_431371 ) ) ( not ( = ?auto_431367 ?auto_431372 ) ) ( not ( = ?auto_431368 ?auto_431369 ) ) ( not ( = ?auto_431368 ?auto_431370 ) ) ( not ( = ?auto_431368 ?auto_431371 ) ) ( not ( = ?auto_431368 ?auto_431372 ) ) ( not ( = ?auto_431369 ?auto_431370 ) ) ( not ( = ?auto_431369 ?auto_431371 ) ) ( not ( = ?auto_431369 ?auto_431372 ) ) ( not ( = ?auto_431370 ?auto_431371 ) ) ( not ( = ?auto_431370 ?auto_431372 ) ) ( not ( = ?auto_431371 ?auto_431372 ) ) ( ON ?auto_431370 ?auto_431371 ) ( ON ?auto_431369 ?auto_431370 ) ( CLEAR ?auto_431367 ) ( ON ?auto_431368 ?auto_431369 ) ( CLEAR ?auto_431368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_431359 ?auto_431360 ?auto_431361 ?auto_431362 ?auto_431363 ?auto_431364 ?auto_431365 ?auto_431366 ?auto_431367 ?auto_431368 )
      ( MAKE-13PILE ?auto_431359 ?auto_431360 ?auto_431361 ?auto_431362 ?auto_431363 ?auto_431364 ?auto_431365 ?auto_431366 ?auto_431367 ?auto_431368 ?auto_431369 ?auto_431370 ?auto_431371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431386 - BLOCK
      ?auto_431387 - BLOCK
      ?auto_431388 - BLOCK
      ?auto_431389 - BLOCK
      ?auto_431390 - BLOCK
      ?auto_431391 - BLOCK
      ?auto_431392 - BLOCK
      ?auto_431393 - BLOCK
      ?auto_431394 - BLOCK
      ?auto_431395 - BLOCK
      ?auto_431396 - BLOCK
      ?auto_431397 - BLOCK
      ?auto_431398 - BLOCK
    )
    :vars
    (
      ?auto_431399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431398 ?auto_431399 ) ( ON-TABLE ?auto_431386 ) ( ON ?auto_431387 ?auto_431386 ) ( ON ?auto_431388 ?auto_431387 ) ( ON ?auto_431389 ?auto_431388 ) ( ON ?auto_431390 ?auto_431389 ) ( ON ?auto_431391 ?auto_431390 ) ( ON ?auto_431392 ?auto_431391 ) ( ON ?auto_431393 ?auto_431392 ) ( ON ?auto_431394 ?auto_431393 ) ( not ( = ?auto_431386 ?auto_431387 ) ) ( not ( = ?auto_431386 ?auto_431388 ) ) ( not ( = ?auto_431386 ?auto_431389 ) ) ( not ( = ?auto_431386 ?auto_431390 ) ) ( not ( = ?auto_431386 ?auto_431391 ) ) ( not ( = ?auto_431386 ?auto_431392 ) ) ( not ( = ?auto_431386 ?auto_431393 ) ) ( not ( = ?auto_431386 ?auto_431394 ) ) ( not ( = ?auto_431386 ?auto_431395 ) ) ( not ( = ?auto_431386 ?auto_431396 ) ) ( not ( = ?auto_431386 ?auto_431397 ) ) ( not ( = ?auto_431386 ?auto_431398 ) ) ( not ( = ?auto_431386 ?auto_431399 ) ) ( not ( = ?auto_431387 ?auto_431388 ) ) ( not ( = ?auto_431387 ?auto_431389 ) ) ( not ( = ?auto_431387 ?auto_431390 ) ) ( not ( = ?auto_431387 ?auto_431391 ) ) ( not ( = ?auto_431387 ?auto_431392 ) ) ( not ( = ?auto_431387 ?auto_431393 ) ) ( not ( = ?auto_431387 ?auto_431394 ) ) ( not ( = ?auto_431387 ?auto_431395 ) ) ( not ( = ?auto_431387 ?auto_431396 ) ) ( not ( = ?auto_431387 ?auto_431397 ) ) ( not ( = ?auto_431387 ?auto_431398 ) ) ( not ( = ?auto_431387 ?auto_431399 ) ) ( not ( = ?auto_431388 ?auto_431389 ) ) ( not ( = ?auto_431388 ?auto_431390 ) ) ( not ( = ?auto_431388 ?auto_431391 ) ) ( not ( = ?auto_431388 ?auto_431392 ) ) ( not ( = ?auto_431388 ?auto_431393 ) ) ( not ( = ?auto_431388 ?auto_431394 ) ) ( not ( = ?auto_431388 ?auto_431395 ) ) ( not ( = ?auto_431388 ?auto_431396 ) ) ( not ( = ?auto_431388 ?auto_431397 ) ) ( not ( = ?auto_431388 ?auto_431398 ) ) ( not ( = ?auto_431388 ?auto_431399 ) ) ( not ( = ?auto_431389 ?auto_431390 ) ) ( not ( = ?auto_431389 ?auto_431391 ) ) ( not ( = ?auto_431389 ?auto_431392 ) ) ( not ( = ?auto_431389 ?auto_431393 ) ) ( not ( = ?auto_431389 ?auto_431394 ) ) ( not ( = ?auto_431389 ?auto_431395 ) ) ( not ( = ?auto_431389 ?auto_431396 ) ) ( not ( = ?auto_431389 ?auto_431397 ) ) ( not ( = ?auto_431389 ?auto_431398 ) ) ( not ( = ?auto_431389 ?auto_431399 ) ) ( not ( = ?auto_431390 ?auto_431391 ) ) ( not ( = ?auto_431390 ?auto_431392 ) ) ( not ( = ?auto_431390 ?auto_431393 ) ) ( not ( = ?auto_431390 ?auto_431394 ) ) ( not ( = ?auto_431390 ?auto_431395 ) ) ( not ( = ?auto_431390 ?auto_431396 ) ) ( not ( = ?auto_431390 ?auto_431397 ) ) ( not ( = ?auto_431390 ?auto_431398 ) ) ( not ( = ?auto_431390 ?auto_431399 ) ) ( not ( = ?auto_431391 ?auto_431392 ) ) ( not ( = ?auto_431391 ?auto_431393 ) ) ( not ( = ?auto_431391 ?auto_431394 ) ) ( not ( = ?auto_431391 ?auto_431395 ) ) ( not ( = ?auto_431391 ?auto_431396 ) ) ( not ( = ?auto_431391 ?auto_431397 ) ) ( not ( = ?auto_431391 ?auto_431398 ) ) ( not ( = ?auto_431391 ?auto_431399 ) ) ( not ( = ?auto_431392 ?auto_431393 ) ) ( not ( = ?auto_431392 ?auto_431394 ) ) ( not ( = ?auto_431392 ?auto_431395 ) ) ( not ( = ?auto_431392 ?auto_431396 ) ) ( not ( = ?auto_431392 ?auto_431397 ) ) ( not ( = ?auto_431392 ?auto_431398 ) ) ( not ( = ?auto_431392 ?auto_431399 ) ) ( not ( = ?auto_431393 ?auto_431394 ) ) ( not ( = ?auto_431393 ?auto_431395 ) ) ( not ( = ?auto_431393 ?auto_431396 ) ) ( not ( = ?auto_431393 ?auto_431397 ) ) ( not ( = ?auto_431393 ?auto_431398 ) ) ( not ( = ?auto_431393 ?auto_431399 ) ) ( not ( = ?auto_431394 ?auto_431395 ) ) ( not ( = ?auto_431394 ?auto_431396 ) ) ( not ( = ?auto_431394 ?auto_431397 ) ) ( not ( = ?auto_431394 ?auto_431398 ) ) ( not ( = ?auto_431394 ?auto_431399 ) ) ( not ( = ?auto_431395 ?auto_431396 ) ) ( not ( = ?auto_431395 ?auto_431397 ) ) ( not ( = ?auto_431395 ?auto_431398 ) ) ( not ( = ?auto_431395 ?auto_431399 ) ) ( not ( = ?auto_431396 ?auto_431397 ) ) ( not ( = ?auto_431396 ?auto_431398 ) ) ( not ( = ?auto_431396 ?auto_431399 ) ) ( not ( = ?auto_431397 ?auto_431398 ) ) ( not ( = ?auto_431397 ?auto_431399 ) ) ( not ( = ?auto_431398 ?auto_431399 ) ) ( ON ?auto_431397 ?auto_431398 ) ( ON ?auto_431396 ?auto_431397 ) ( CLEAR ?auto_431394 ) ( ON ?auto_431395 ?auto_431396 ) ( CLEAR ?auto_431395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_431386 ?auto_431387 ?auto_431388 ?auto_431389 ?auto_431390 ?auto_431391 ?auto_431392 ?auto_431393 ?auto_431394 ?auto_431395 )
      ( MAKE-13PILE ?auto_431386 ?auto_431387 ?auto_431388 ?auto_431389 ?auto_431390 ?auto_431391 ?auto_431392 ?auto_431393 ?auto_431394 ?auto_431395 ?auto_431396 ?auto_431397 ?auto_431398 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431413 - BLOCK
      ?auto_431414 - BLOCK
      ?auto_431415 - BLOCK
      ?auto_431416 - BLOCK
      ?auto_431417 - BLOCK
      ?auto_431418 - BLOCK
      ?auto_431419 - BLOCK
      ?auto_431420 - BLOCK
      ?auto_431421 - BLOCK
      ?auto_431422 - BLOCK
      ?auto_431423 - BLOCK
      ?auto_431424 - BLOCK
      ?auto_431425 - BLOCK
    )
    :vars
    (
      ?auto_431426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431425 ?auto_431426 ) ( ON-TABLE ?auto_431413 ) ( ON ?auto_431414 ?auto_431413 ) ( ON ?auto_431415 ?auto_431414 ) ( ON ?auto_431416 ?auto_431415 ) ( ON ?auto_431417 ?auto_431416 ) ( ON ?auto_431418 ?auto_431417 ) ( ON ?auto_431419 ?auto_431418 ) ( ON ?auto_431420 ?auto_431419 ) ( not ( = ?auto_431413 ?auto_431414 ) ) ( not ( = ?auto_431413 ?auto_431415 ) ) ( not ( = ?auto_431413 ?auto_431416 ) ) ( not ( = ?auto_431413 ?auto_431417 ) ) ( not ( = ?auto_431413 ?auto_431418 ) ) ( not ( = ?auto_431413 ?auto_431419 ) ) ( not ( = ?auto_431413 ?auto_431420 ) ) ( not ( = ?auto_431413 ?auto_431421 ) ) ( not ( = ?auto_431413 ?auto_431422 ) ) ( not ( = ?auto_431413 ?auto_431423 ) ) ( not ( = ?auto_431413 ?auto_431424 ) ) ( not ( = ?auto_431413 ?auto_431425 ) ) ( not ( = ?auto_431413 ?auto_431426 ) ) ( not ( = ?auto_431414 ?auto_431415 ) ) ( not ( = ?auto_431414 ?auto_431416 ) ) ( not ( = ?auto_431414 ?auto_431417 ) ) ( not ( = ?auto_431414 ?auto_431418 ) ) ( not ( = ?auto_431414 ?auto_431419 ) ) ( not ( = ?auto_431414 ?auto_431420 ) ) ( not ( = ?auto_431414 ?auto_431421 ) ) ( not ( = ?auto_431414 ?auto_431422 ) ) ( not ( = ?auto_431414 ?auto_431423 ) ) ( not ( = ?auto_431414 ?auto_431424 ) ) ( not ( = ?auto_431414 ?auto_431425 ) ) ( not ( = ?auto_431414 ?auto_431426 ) ) ( not ( = ?auto_431415 ?auto_431416 ) ) ( not ( = ?auto_431415 ?auto_431417 ) ) ( not ( = ?auto_431415 ?auto_431418 ) ) ( not ( = ?auto_431415 ?auto_431419 ) ) ( not ( = ?auto_431415 ?auto_431420 ) ) ( not ( = ?auto_431415 ?auto_431421 ) ) ( not ( = ?auto_431415 ?auto_431422 ) ) ( not ( = ?auto_431415 ?auto_431423 ) ) ( not ( = ?auto_431415 ?auto_431424 ) ) ( not ( = ?auto_431415 ?auto_431425 ) ) ( not ( = ?auto_431415 ?auto_431426 ) ) ( not ( = ?auto_431416 ?auto_431417 ) ) ( not ( = ?auto_431416 ?auto_431418 ) ) ( not ( = ?auto_431416 ?auto_431419 ) ) ( not ( = ?auto_431416 ?auto_431420 ) ) ( not ( = ?auto_431416 ?auto_431421 ) ) ( not ( = ?auto_431416 ?auto_431422 ) ) ( not ( = ?auto_431416 ?auto_431423 ) ) ( not ( = ?auto_431416 ?auto_431424 ) ) ( not ( = ?auto_431416 ?auto_431425 ) ) ( not ( = ?auto_431416 ?auto_431426 ) ) ( not ( = ?auto_431417 ?auto_431418 ) ) ( not ( = ?auto_431417 ?auto_431419 ) ) ( not ( = ?auto_431417 ?auto_431420 ) ) ( not ( = ?auto_431417 ?auto_431421 ) ) ( not ( = ?auto_431417 ?auto_431422 ) ) ( not ( = ?auto_431417 ?auto_431423 ) ) ( not ( = ?auto_431417 ?auto_431424 ) ) ( not ( = ?auto_431417 ?auto_431425 ) ) ( not ( = ?auto_431417 ?auto_431426 ) ) ( not ( = ?auto_431418 ?auto_431419 ) ) ( not ( = ?auto_431418 ?auto_431420 ) ) ( not ( = ?auto_431418 ?auto_431421 ) ) ( not ( = ?auto_431418 ?auto_431422 ) ) ( not ( = ?auto_431418 ?auto_431423 ) ) ( not ( = ?auto_431418 ?auto_431424 ) ) ( not ( = ?auto_431418 ?auto_431425 ) ) ( not ( = ?auto_431418 ?auto_431426 ) ) ( not ( = ?auto_431419 ?auto_431420 ) ) ( not ( = ?auto_431419 ?auto_431421 ) ) ( not ( = ?auto_431419 ?auto_431422 ) ) ( not ( = ?auto_431419 ?auto_431423 ) ) ( not ( = ?auto_431419 ?auto_431424 ) ) ( not ( = ?auto_431419 ?auto_431425 ) ) ( not ( = ?auto_431419 ?auto_431426 ) ) ( not ( = ?auto_431420 ?auto_431421 ) ) ( not ( = ?auto_431420 ?auto_431422 ) ) ( not ( = ?auto_431420 ?auto_431423 ) ) ( not ( = ?auto_431420 ?auto_431424 ) ) ( not ( = ?auto_431420 ?auto_431425 ) ) ( not ( = ?auto_431420 ?auto_431426 ) ) ( not ( = ?auto_431421 ?auto_431422 ) ) ( not ( = ?auto_431421 ?auto_431423 ) ) ( not ( = ?auto_431421 ?auto_431424 ) ) ( not ( = ?auto_431421 ?auto_431425 ) ) ( not ( = ?auto_431421 ?auto_431426 ) ) ( not ( = ?auto_431422 ?auto_431423 ) ) ( not ( = ?auto_431422 ?auto_431424 ) ) ( not ( = ?auto_431422 ?auto_431425 ) ) ( not ( = ?auto_431422 ?auto_431426 ) ) ( not ( = ?auto_431423 ?auto_431424 ) ) ( not ( = ?auto_431423 ?auto_431425 ) ) ( not ( = ?auto_431423 ?auto_431426 ) ) ( not ( = ?auto_431424 ?auto_431425 ) ) ( not ( = ?auto_431424 ?auto_431426 ) ) ( not ( = ?auto_431425 ?auto_431426 ) ) ( ON ?auto_431424 ?auto_431425 ) ( ON ?auto_431423 ?auto_431424 ) ( ON ?auto_431422 ?auto_431423 ) ( CLEAR ?auto_431420 ) ( ON ?auto_431421 ?auto_431422 ) ( CLEAR ?auto_431421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_431413 ?auto_431414 ?auto_431415 ?auto_431416 ?auto_431417 ?auto_431418 ?auto_431419 ?auto_431420 ?auto_431421 )
      ( MAKE-13PILE ?auto_431413 ?auto_431414 ?auto_431415 ?auto_431416 ?auto_431417 ?auto_431418 ?auto_431419 ?auto_431420 ?auto_431421 ?auto_431422 ?auto_431423 ?auto_431424 ?auto_431425 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431440 - BLOCK
      ?auto_431441 - BLOCK
      ?auto_431442 - BLOCK
      ?auto_431443 - BLOCK
      ?auto_431444 - BLOCK
      ?auto_431445 - BLOCK
      ?auto_431446 - BLOCK
      ?auto_431447 - BLOCK
      ?auto_431448 - BLOCK
      ?auto_431449 - BLOCK
      ?auto_431450 - BLOCK
      ?auto_431451 - BLOCK
      ?auto_431452 - BLOCK
    )
    :vars
    (
      ?auto_431453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431452 ?auto_431453 ) ( ON-TABLE ?auto_431440 ) ( ON ?auto_431441 ?auto_431440 ) ( ON ?auto_431442 ?auto_431441 ) ( ON ?auto_431443 ?auto_431442 ) ( ON ?auto_431444 ?auto_431443 ) ( ON ?auto_431445 ?auto_431444 ) ( ON ?auto_431446 ?auto_431445 ) ( ON ?auto_431447 ?auto_431446 ) ( not ( = ?auto_431440 ?auto_431441 ) ) ( not ( = ?auto_431440 ?auto_431442 ) ) ( not ( = ?auto_431440 ?auto_431443 ) ) ( not ( = ?auto_431440 ?auto_431444 ) ) ( not ( = ?auto_431440 ?auto_431445 ) ) ( not ( = ?auto_431440 ?auto_431446 ) ) ( not ( = ?auto_431440 ?auto_431447 ) ) ( not ( = ?auto_431440 ?auto_431448 ) ) ( not ( = ?auto_431440 ?auto_431449 ) ) ( not ( = ?auto_431440 ?auto_431450 ) ) ( not ( = ?auto_431440 ?auto_431451 ) ) ( not ( = ?auto_431440 ?auto_431452 ) ) ( not ( = ?auto_431440 ?auto_431453 ) ) ( not ( = ?auto_431441 ?auto_431442 ) ) ( not ( = ?auto_431441 ?auto_431443 ) ) ( not ( = ?auto_431441 ?auto_431444 ) ) ( not ( = ?auto_431441 ?auto_431445 ) ) ( not ( = ?auto_431441 ?auto_431446 ) ) ( not ( = ?auto_431441 ?auto_431447 ) ) ( not ( = ?auto_431441 ?auto_431448 ) ) ( not ( = ?auto_431441 ?auto_431449 ) ) ( not ( = ?auto_431441 ?auto_431450 ) ) ( not ( = ?auto_431441 ?auto_431451 ) ) ( not ( = ?auto_431441 ?auto_431452 ) ) ( not ( = ?auto_431441 ?auto_431453 ) ) ( not ( = ?auto_431442 ?auto_431443 ) ) ( not ( = ?auto_431442 ?auto_431444 ) ) ( not ( = ?auto_431442 ?auto_431445 ) ) ( not ( = ?auto_431442 ?auto_431446 ) ) ( not ( = ?auto_431442 ?auto_431447 ) ) ( not ( = ?auto_431442 ?auto_431448 ) ) ( not ( = ?auto_431442 ?auto_431449 ) ) ( not ( = ?auto_431442 ?auto_431450 ) ) ( not ( = ?auto_431442 ?auto_431451 ) ) ( not ( = ?auto_431442 ?auto_431452 ) ) ( not ( = ?auto_431442 ?auto_431453 ) ) ( not ( = ?auto_431443 ?auto_431444 ) ) ( not ( = ?auto_431443 ?auto_431445 ) ) ( not ( = ?auto_431443 ?auto_431446 ) ) ( not ( = ?auto_431443 ?auto_431447 ) ) ( not ( = ?auto_431443 ?auto_431448 ) ) ( not ( = ?auto_431443 ?auto_431449 ) ) ( not ( = ?auto_431443 ?auto_431450 ) ) ( not ( = ?auto_431443 ?auto_431451 ) ) ( not ( = ?auto_431443 ?auto_431452 ) ) ( not ( = ?auto_431443 ?auto_431453 ) ) ( not ( = ?auto_431444 ?auto_431445 ) ) ( not ( = ?auto_431444 ?auto_431446 ) ) ( not ( = ?auto_431444 ?auto_431447 ) ) ( not ( = ?auto_431444 ?auto_431448 ) ) ( not ( = ?auto_431444 ?auto_431449 ) ) ( not ( = ?auto_431444 ?auto_431450 ) ) ( not ( = ?auto_431444 ?auto_431451 ) ) ( not ( = ?auto_431444 ?auto_431452 ) ) ( not ( = ?auto_431444 ?auto_431453 ) ) ( not ( = ?auto_431445 ?auto_431446 ) ) ( not ( = ?auto_431445 ?auto_431447 ) ) ( not ( = ?auto_431445 ?auto_431448 ) ) ( not ( = ?auto_431445 ?auto_431449 ) ) ( not ( = ?auto_431445 ?auto_431450 ) ) ( not ( = ?auto_431445 ?auto_431451 ) ) ( not ( = ?auto_431445 ?auto_431452 ) ) ( not ( = ?auto_431445 ?auto_431453 ) ) ( not ( = ?auto_431446 ?auto_431447 ) ) ( not ( = ?auto_431446 ?auto_431448 ) ) ( not ( = ?auto_431446 ?auto_431449 ) ) ( not ( = ?auto_431446 ?auto_431450 ) ) ( not ( = ?auto_431446 ?auto_431451 ) ) ( not ( = ?auto_431446 ?auto_431452 ) ) ( not ( = ?auto_431446 ?auto_431453 ) ) ( not ( = ?auto_431447 ?auto_431448 ) ) ( not ( = ?auto_431447 ?auto_431449 ) ) ( not ( = ?auto_431447 ?auto_431450 ) ) ( not ( = ?auto_431447 ?auto_431451 ) ) ( not ( = ?auto_431447 ?auto_431452 ) ) ( not ( = ?auto_431447 ?auto_431453 ) ) ( not ( = ?auto_431448 ?auto_431449 ) ) ( not ( = ?auto_431448 ?auto_431450 ) ) ( not ( = ?auto_431448 ?auto_431451 ) ) ( not ( = ?auto_431448 ?auto_431452 ) ) ( not ( = ?auto_431448 ?auto_431453 ) ) ( not ( = ?auto_431449 ?auto_431450 ) ) ( not ( = ?auto_431449 ?auto_431451 ) ) ( not ( = ?auto_431449 ?auto_431452 ) ) ( not ( = ?auto_431449 ?auto_431453 ) ) ( not ( = ?auto_431450 ?auto_431451 ) ) ( not ( = ?auto_431450 ?auto_431452 ) ) ( not ( = ?auto_431450 ?auto_431453 ) ) ( not ( = ?auto_431451 ?auto_431452 ) ) ( not ( = ?auto_431451 ?auto_431453 ) ) ( not ( = ?auto_431452 ?auto_431453 ) ) ( ON ?auto_431451 ?auto_431452 ) ( ON ?auto_431450 ?auto_431451 ) ( ON ?auto_431449 ?auto_431450 ) ( CLEAR ?auto_431447 ) ( ON ?auto_431448 ?auto_431449 ) ( CLEAR ?auto_431448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_431440 ?auto_431441 ?auto_431442 ?auto_431443 ?auto_431444 ?auto_431445 ?auto_431446 ?auto_431447 ?auto_431448 )
      ( MAKE-13PILE ?auto_431440 ?auto_431441 ?auto_431442 ?auto_431443 ?auto_431444 ?auto_431445 ?auto_431446 ?auto_431447 ?auto_431448 ?auto_431449 ?auto_431450 ?auto_431451 ?auto_431452 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431467 - BLOCK
      ?auto_431468 - BLOCK
      ?auto_431469 - BLOCK
      ?auto_431470 - BLOCK
      ?auto_431471 - BLOCK
      ?auto_431472 - BLOCK
      ?auto_431473 - BLOCK
      ?auto_431474 - BLOCK
      ?auto_431475 - BLOCK
      ?auto_431476 - BLOCK
      ?auto_431477 - BLOCK
      ?auto_431478 - BLOCK
      ?auto_431479 - BLOCK
    )
    :vars
    (
      ?auto_431480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431479 ?auto_431480 ) ( ON-TABLE ?auto_431467 ) ( ON ?auto_431468 ?auto_431467 ) ( ON ?auto_431469 ?auto_431468 ) ( ON ?auto_431470 ?auto_431469 ) ( ON ?auto_431471 ?auto_431470 ) ( ON ?auto_431472 ?auto_431471 ) ( ON ?auto_431473 ?auto_431472 ) ( not ( = ?auto_431467 ?auto_431468 ) ) ( not ( = ?auto_431467 ?auto_431469 ) ) ( not ( = ?auto_431467 ?auto_431470 ) ) ( not ( = ?auto_431467 ?auto_431471 ) ) ( not ( = ?auto_431467 ?auto_431472 ) ) ( not ( = ?auto_431467 ?auto_431473 ) ) ( not ( = ?auto_431467 ?auto_431474 ) ) ( not ( = ?auto_431467 ?auto_431475 ) ) ( not ( = ?auto_431467 ?auto_431476 ) ) ( not ( = ?auto_431467 ?auto_431477 ) ) ( not ( = ?auto_431467 ?auto_431478 ) ) ( not ( = ?auto_431467 ?auto_431479 ) ) ( not ( = ?auto_431467 ?auto_431480 ) ) ( not ( = ?auto_431468 ?auto_431469 ) ) ( not ( = ?auto_431468 ?auto_431470 ) ) ( not ( = ?auto_431468 ?auto_431471 ) ) ( not ( = ?auto_431468 ?auto_431472 ) ) ( not ( = ?auto_431468 ?auto_431473 ) ) ( not ( = ?auto_431468 ?auto_431474 ) ) ( not ( = ?auto_431468 ?auto_431475 ) ) ( not ( = ?auto_431468 ?auto_431476 ) ) ( not ( = ?auto_431468 ?auto_431477 ) ) ( not ( = ?auto_431468 ?auto_431478 ) ) ( not ( = ?auto_431468 ?auto_431479 ) ) ( not ( = ?auto_431468 ?auto_431480 ) ) ( not ( = ?auto_431469 ?auto_431470 ) ) ( not ( = ?auto_431469 ?auto_431471 ) ) ( not ( = ?auto_431469 ?auto_431472 ) ) ( not ( = ?auto_431469 ?auto_431473 ) ) ( not ( = ?auto_431469 ?auto_431474 ) ) ( not ( = ?auto_431469 ?auto_431475 ) ) ( not ( = ?auto_431469 ?auto_431476 ) ) ( not ( = ?auto_431469 ?auto_431477 ) ) ( not ( = ?auto_431469 ?auto_431478 ) ) ( not ( = ?auto_431469 ?auto_431479 ) ) ( not ( = ?auto_431469 ?auto_431480 ) ) ( not ( = ?auto_431470 ?auto_431471 ) ) ( not ( = ?auto_431470 ?auto_431472 ) ) ( not ( = ?auto_431470 ?auto_431473 ) ) ( not ( = ?auto_431470 ?auto_431474 ) ) ( not ( = ?auto_431470 ?auto_431475 ) ) ( not ( = ?auto_431470 ?auto_431476 ) ) ( not ( = ?auto_431470 ?auto_431477 ) ) ( not ( = ?auto_431470 ?auto_431478 ) ) ( not ( = ?auto_431470 ?auto_431479 ) ) ( not ( = ?auto_431470 ?auto_431480 ) ) ( not ( = ?auto_431471 ?auto_431472 ) ) ( not ( = ?auto_431471 ?auto_431473 ) ) ( not ( = ?auto_431471 ?auto_431474 ) ) ( not ( = ?auto_431471 ?auto_431475 ) ) ( not ( = ?auto_431471 ?auto_431476 ) ) ( not ( = ?auto_431471 ?auto_431477 ) ) ( not ( = ?auto_431471 ?auto_431478 ) ) ( not ( = ?auto_431471 ?auto_431479 ) ) ( not ( = ?auto_431471 ?auto_431480 ) ) ( not ( = ?auto_431472 ?auto_431473 ) ) ( not ( = ?auto_431472 ?auto_431474 ) ) ( not ( = ?auto_431472 ?auto_431475 ) ) ( not ( = ?auto_431472 ?auto_431476 ) ) ( not ( = ?auto_431472 ?auto_431477 ) ) ( not ( = ?auto_431472 ?auto_431478 ) ) ( not ( = ?auto_431472 ?auto_431479 ) ) ( not ( = ?auto_431472 ?auto_431480 ) ) ( not ( = ?auto_431473 ?auto_431474 ) ) ( not ( = ?auto_431473 ?auto_431475 ) ) ( not ( = ?auto_431473 ?auto_431476 ) ) ( not ( = ?auto_431473 ?auto_431477 ) ) ( not ( = ?auto_431473 ?auto_431478 ) ) ( not ( = ?auto_431473 ?auto_431479 ) ) ( not ( = ?auto_431473 ?auto_431480 ) ) ( not ( = ?auto_431474 ?auto_431475 ) ) ( not ( = ?auto_431474 ?auto_431476 ) ) ( not ( = ?auto_431474 ?auto_431477 ) ) ( not ( = ?auto_431474 ?auto_431478 ) ) ( not ( = ?auto_431474 ?auto_431479 ) ) ( not ( = ?auto_431474 ?auto_431480 ) ) ( not ( = ?auto_431475 ?auto_431476 ) ) ( not ( = ?auto_431475 ?auto_431477 ) ) ( not ( = ?auto_431475 ?auto_431478 ) ) ( not ( = ?auto_431475 ?auto_431479 ) ) ( not ( = ?auto_431475 ?auto_431480 ) ) ( not ( = ?auto_431476 ?auto_431477 ) ) ( not ( = ?auto_431476 ?auto_431478 ) ) ( not ( = ?auto_431476 ?auto_431479 ) ) ( not ( = ?auto_431476 ?auto_431480 ) ) ( not ( = ?auto_431477 ?auto_431478 ) ) ( not ( = ?auto_431477 ?auto_431479 ) ) ( not ( = ?auto_431477 ?auto_431480 ) ) ( not ( = ?auto_431478 ?auto_431479 ) ) ( not ( = ?auto_431478 ?auto_431480 ) ) ( not ( = ?auto_431479 ?auto_431480 ) ) ( ON ?auto_431478 ?auto_431479 ) ( ON ?auto_431477 ?auto_431478 ) ( ON ?auto_431476 ?auto_431477 ) ( ON ?auto_431475 ?auto_431476 ) ( CLEAR ?auto_431473 ) ( ON ?auto_431474 ?auto_431475 ) ( CLEAR ?auto_431474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_431467 ?auto_431468 ?auto_431469 ?auto_431470 ?auto_431471 ?auto_431472 ?auto_431473 ?auto_431474 )
      ( MAKE-13PILE ?auto_431467 ?auto_431468 ?auto_431469 ?auto_431470 ?auto_431471 ?auto_431472 ?auto_431473 ?auto_431474 ?auto_431475 ?auto_431476 ?auto_431477 ?auto_431478 ?auto_431479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431494 - BLOCK
      ?auto_431495 - BLOCK
      ?auto_431496 - BLOCK
      ?auto_431497 - BLOCK
      ?auto_431498 - BLOCK
      ?auto_431499 - BLOCK
      ?auto_431500 - BLOCK
      ?auto_431501 - BLOCK
      ?auto_431502 - BLOCK
      ?auto_431503 - BLOCK
      ?auto_431504 - BLOCK
      ?auto_431505 - BLOCK
      ?auto_431506 - BLOCK
    )
    :vars
    (
      ?auto_431507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431506 ?auto_431507 ) ( ON-TABLE ?auto_431494 ) ( ON ?auto_431495 ?auto_431494 ) ( ON ?auto_431496 ?auto_431495 ) ( ON ?auto_431497 ?auto_431496 ) ( ON ?auto_431498 ?auto_431497 ) ( ON ?auto_431499 ?auto_431498 ) ( ON ?auto_431500 ?auto_431499 ) ( not ( = ?auto_431494 ?auto_431495 ) ) ( not ( = ?auto_431494 ?auto_431496 ) ) ( not ( = ?auto_431494 ?auto_431497 ) ) ( not ( = ?auto_431494 ?auto_431498 ) ) ( not ( = ?auto_431494 ?auto_431499 ) ) ( not ( = ?auto_431494 ?auto_431500 ) ) ( not ( = ?auto_431494 ?auto_431501 ) ) ( not ( = ?auto_431494 ?auto_431502 ) ) ( not ( = ?auto_431494 ?auto_431503 ) ) ( not ( = ?auto_431494 ?auto_431504 ) ) ( not ( = ?auto_431494 ?auto_431505 ) ) ( not ( = ?auto_431494 ?auto_431506 ) ) ( not ( = ?auto_431494 ?auto_431507 ) ) ( not ( = ?auto_431495 ?auto_431496 ) ) ( not ( = ?auto_431495 ?auto_431497 ) ) ( not ( = ?auto_431495 ?auto_431498 ) ) ( not ( = ?auto_431495 ?auto_431499 ) ) ( not ( = ?auto_431495 ?auto_431500 ) ) ( not ( = ?auto_431495 ?auto_431501 ) ) ( not ( = ?auto_431495 ?auto_431502 ) ) ( not ( = ?auto_431495 ?auto_431503 ) ) ( not ( = ?auto_431495 ?auto_431504 ) ) ( not ( = ?auto_431495 ?auto_431505 ) ) ( not ( = ?auto_431495 ?auto_431506 ) ) ( not ( = ?auto_431495 ?auto_431507 ) ) ( not ( = ?auto_431496 ?auto_431497 ) ) ( not ( = ?auto_431496 ?auto_431498 ) ) ( not ( = ?auto_431496 ?auto_431499 ) ) ( not ( = ?auto_431496 ?auto_431500 ) ) ( not ( = ?auto_431496 ?auto_431501 ) ) ( not ( = ?auto_431496 ?auto_431502 ) ) ( not ( = ?auto_431496 ?auto_431503 ) ) ( not ( = ?auto_431496 ?auto_431504 ) ) ( not ( = ?auto_431496 ?auto_431505 ) ) ( not ( = ?auto_431496 ?auto_431506 ) ) ( not ( = ?auto_431496 ?auto_431507 ) ) ( not ( = ?auto_431497 ?auto_431498 ) ) ( not ( = ?auto_431497 ?auto_431499 ) ) ( not ( = ?auto_431497 ?auto_431500 ) ) ( not ( = ?auto_431497 ?auto_431501 ) ) ( not ( = ?auto_431497 ?auto_431502 ) ) ( not ( = ?auto_431497 ?auto_431503 ) ) ( not ( = ?auto_431497 ?auto_431504 ) ) ( not ( = ?auto_431497 ?auto_431505 ) ) ( not ( = ?auto_431497 ?auto_431506 ) ) ( not ( = ?auto_431497 ?auto_431507 ) ) ( not ( = ?auto_431498 ?auto_431499 ) ) ( not ( = ?auto_431498 ?auto_431500 ) ) ( not ( = ?auto_431498 ?auto_431501 ) ) ( not ( = ?auto_431498 ?auto_431502 ) ) ( not ( = ?auto_431498 ?auto_431503 ) ) ( not ( = ?auto_431498 ?auto_431504 ) ) ( not ( = ?auto_431498 ?auto_431505 ) ) ( not ( = ?auto_431498 ?auto_431506 ) ) ( not ( = ?auto_431498 ?auto_431507 ) ) ( not ( = ?auto_431499 ?auto_431500 ) ) ( not ( = ?auto_431499 ?auto_431501 ) ) ( not ( = ?auto_431499 ?auto_431502 ) ) ( not ( = ?auto_431499 ?auto_431503 ) ) ( not ( = ?auto_431499 ?auto_431504 ) ) ( not ( = ?auto_431499 ?auto_431505 ) ) ( not ( = ?auto_431499 ?auto_431506 ) ) ( not ( = ?auto_431499 ?auto_431507 ) ) ( not ( = ?auto_431500 ?auto_431501 ) ) ( not ( = ?auto_431500 ?auto_431502 ) ) ( not ( = ?auto_431500 ?auto_431503 ) ) ( not ( = ?auto_431500 ?auto_431504 ) ) ( not ( = ?auto_431500 ?auto_431505 ) ) ( not ( = ?auto_431500 ?auto_431506 ) ) ( not ( = ?auto_431500 ?auto_431507 ) ) ( not ( = ?auto_431501 ?auto_431502 ) ) ( not ( = ?auto_431501 ?auto_431503 ) ) ( not ( = ?auto_431501 ?auto_431504 ) ) ( not ( = ?auto_431501 ?auto_431505 ) ) ( not ( = ?auto_431501 ?auto_431506 ) ) ( not ( = ?auto_431501 ?auto_431507 ) ) ( not ( = ?auto_431502 ?auto_431503 ) ) ( not ( = ?auto_431502 ?auto_431504 ) ) ( not ( = ?auto_431502 ?auto_431505 ) ) ( not ( = ?auto_431502 ?auto_431506 ) ) ( not ( = ?auto_431502 ?auto_431507 ) ) ( not ( = ?auto_431503 ?auto_431504 ) ) ( not ( = ?auto_431503 ?auto_431505 ) ) ( not ( = ?auto_431503 ?auto_431506 ) ) ( not ( = ?auto_431503 ?auto_431507 ) ) ( not ( = ?auto_431504 ?auto_431505 ) ) ( not ( = ?auto_431504 ?auto_431506 ) ) ( not ( = ?auto_431504 ?auto_431507 ) ) ( not ( = ?auto_431505 ?auto_431506 ) ) ( not ( = ?auto_431505 ?auto_431507 ) ) ( not ( = ?auto_431506 ?auto_431507 ) ) ( ON ?auto_431505 ?auto_431506 ) ( ON ?auto_431504 ?auto_431505 ) ( ON ?auto_431503 ?auto_431504 ) ( ON ?auto_431502 ?auto_431503 ) ( CLEAR ?auto_431500 ) ( ON ?auto_431501 ?auto_431502 ) ( CLEAR ?auto_431501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_431494 ?auto_431495 ?auto_431496 ?auto_431497 ?auto_431498 ?auto_431499 ?auto_431500 ?auto_431501 )
      ( MAKE-13PILE ?auto_431494 ?auto_431495 ?auto_431496 ?auto_431497 ?auto_431498 ?auto_431499 ?auto_431500 ?auto_431501 ?auto_431502 ?auto_431503 ?auto_431504 ?auto_431505 ?auto_431506 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431521 - BLOCK
      ?auto_431522 - BLOCK
      ?auto_431523 - BLOCK
      ?auto_431524 - BLOCK
      ?auto_431525 - BLOCK
      ?auto_431526 - BLOCK
      ?auto_431527 - BLOCK
      ?auto_431528 - BLOCK
      ?auto_431529 - BLOCK
      ?auto_431530 - BLOCK
      ?auto_431531 - BLOCK
      ?auto_431532 - BLOCK
      ?auto_431533 - BLOCK
    )
    :vars
    (
      ?auto_431534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431533 ?auto_431534 ) ( ON-TABLE ?auto_431521 ) ( ON ?auto_431522 ?auto_431521 ) ( ON ?auto_431523 ?auto_431522 ) ( ON ?auto_431524 ?auto_431523 ) ( ON ?auto_431525 ?auto_431524 ) ( ON ?auto_431526 ?auto_431525 ) ( not ( = ?auto_431521 ?auto_431522 ) ) ( not ( = ?auto_431521 ?auto_431523 ) ) ( not ( = ?auto_431521 ?auto_431524 ) ) ( not ( = ?auto_431521 ?auto_431525 ) ) ( not ( = ?auto_431521 ?auto_431526 ) ) ( not ( = ?auto_431521 ?auto_431527 ) ) ( not ( = ?auto_431521 ?auto_431528 ) ) ( not ( = ?auto_431521 ?auto_431529 ) ) ( not ( = ?auto_431521 ?auto_431530 ) ) ( not ( = ?auto_431521 ?auto_431531 ) ) ( not ( = ?auto_431521 ?auto_431532 ) ) ( not ( = ?auto_431521 ?auto_431533 ) ) ( not ( = ?auto_431521 ?auto_431534 ) ) ( not ( = ?auto_431522 ?auto_431523 ) ) ( not ( = ?auto_431522 ?auto_431524 ) ) ( not ( = ?auto_431522 ?auto_431525 ) ) ( not ( = ?auto_431522 ?auto_431526 ) ) ( not ( = ?auto_431522 ?auto_431527 ) ) ( not ( = ?auto_431522 ?auto_431528 ) ) ( not ( = ?auto_431522 ?auto_431529 ) ) ( not ( = ?auto_431522 ?auto_431530 ) ) ( not ( = ?auto_431522 ?auto_431531 ) ) ( not ( = ?auto_431522 ?auto_431532 ) ) ( not ( = ?auto_431522 ?auto_431533 ) ) ( not ( = ?auto_431522 ?auto_431534 ) ) ( not ( = ?auto_431523 ?auto_431524 ) ) ( not ( = ?auto_431523 ?auto_431525 ) ) ( not ( = ?auto_431523 ?auto_431526 ) ) ( not ( = ?auto_431523 ?auto_431527 ) ) ( not ( = ?auto_431523 ?auto_431528 ) ) ( not ( = ?auto_431523 ?auto_431529 ) ) ( not ( = ?auto_431523 ?auto_431530 ) ) ( not ( = ?auto_431523 ?auto_431531 ) ) ( not ( = ?auto_431523 ?auto_431532 ) ) ( not ( = ?auto_431523 ?auto_431533 ) ) ( not ( = ?auto_431523 ?auto_431534 ) ) ( not ( = ?auto_431524 ?auto_431525 ) ) ( not ( = ?auto_431524 ?auto_431526 ) ) ( not ( = ?auto_431524 ?auto_431527 ) ) ( not ( = ?auto_431524 ?auto_431528 ) ) ( not ( = ?auto_431524 ?auto_431529 ) ) ( not ( = ?auto_431524 ?auto_431530 ) ) ( not ( = ?auto_431524 ?auto_431531 ) ) ( not ( = ?auto_431524 ?auto_431532 ) ) ( not ( = ?auto_431524 ?auto_431533 ) ) ( not ( = ?auto_431524 ?auto_431534 ) ) ( not ( = ?auto_431525 ?auto_431526 ) ) ( not ( = ?auto_431525 ?auto_431527 ) ) ( not ( = ?auto_431525 ?auto_431528 ) ) ( not ( = ?auto_431525 ?auto_431529 ) ) ( not ( = ?auto_431525 ?auto_431530 ) ) ( not ( = ?auto_431525 ?auto_431531 ) ) ( not ( = ?auto_431525 ?auto_431532 ) ) ( not ( = ?auto_431525 ?auto_431533 ) ) ( not ( = ?auto_431525 ?auto_431534 ) ) ( not ( = ?auto_431526 ?auto_431527 ) ) ( not ( = ?auto_431526 ?auto_431528 ) ) ( not ( = ?auto_431526 ?auto_431529 ) ) ( not ( = ?auto_431526 ?auto_431530 ) ) ( not ( = ?auto_431526 ?auto_431531 ) ) ( not ( = ?auto_431526 ?auto_431532 ) ) ( not ( = ?auto_431526 ?auto_431533 ) ) ( not ( = ?auto_431526 ?auto_431534 ) ) ( not ( = ?auto_431527 ?auto_431528 ) ) ( not ( = ?auto_431527 ?auto_431529 ) ) ( not ( = ?auto_431527 ?auto_431530 ) ) ( not ( = ?auto_431527 ?auto_431531 ) ) ( not ( = ?auto_431527 ?auto_431532 ) ) ( not ( = ?auto_431527 ?auto_431533 ) ) ( not ( = ?auto_431527 ?auto_431534 ) ) ( not ( = ?auto_431528 ?auto_431529 ) ) ( not ( = ?auto_431528 ?auto_431530 ) ) ( not ( = ?auto_431528 ?auto_431531 ) ) ( not ( = ?auto_431528 ?auto_431532 ) ) ( not ( = ?auto_431528 ?auto_431533 ) ) ( not ( = ?auto_431528 ?auto_431534 ) ) ( not ( = ?auto_431529 ?auto_431530 ) ) ( not ( = ?auto_431529 ?auto_431531 ) ) ( not ( = ?auto_431529 ?auto_431532 ) ) ( not ( = ?auto_431529 ?auto_431533 ) ) ( not ( = ?auto_431529 ?auto_431534 ) ) ( not ( = ?auto_431530 ?auto_431531 ) ) ( not ( = ?auto_431530 ?auto_431532 ) ) ( not ( = ?auto_431530 ?auto_431533 ) ) ( not ( = ?auto_431530 ?auto_431534 ) ) ( not ( = ?auto_431531 ?auto_431532 ) ) ( not ( = ?auto_431531 ?auto_431533 ) ) ( not ( = ?auto_431531 ?auto_431534 ) ) ( not ( = ?auto_431532 ?auto_431533 ) ) ( not ( = ?auto_431532 ?auto_431534 ) ) ( not ( = ?auto_431533 ?auto_431534 ) ) ( ON ?auto_431532 ?auto_431533 ) ( ON ?auto_431531 ?auto_431532 ) ( ON ?auto_431530 ?auto_431531 ) ( ON ?auto_431529 ?auto_431530 ) ( ON ?auto_431528 ?auto_431529 ) ( CLEAR ?auto_431526 ) ( ON ?auto_431527 ?auto_431528 ) ( CLEAR ?auto_431527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_431521 ?auto_431522 ?auto_431523 ?auto_431524 ?auto_431525 ?auto_431526 ?auto_431527 )
      ( MAKE-13PILE ?auto_431521 ?auto_431522 ?auto_431523 ?auto_431524 ?auto_431525 ?auto_431526 ?auto_431527 ?auto_431528 ?auto_431529 ?auto_431530 ?auto_431531 ?auto_431532 ?auto_431533 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431548 - BLOCK
      ?auto_431549 - BLOCK
      ?auto_431550 - BLOCK
      ?auto_431551 - BLOCK
      ?auto_431552 - BLOCK
      ?auto_431553 - BLOCK
      ?auto_431554 - BLOCK
      ?auto_431555 - BLOCK
      ?auto_431556 - BLOCK
      ?auto_431557 - BLOCK
      ?auto_431558 - BLOCK
      ?auto_431559 - BLOCK
      ?auto_431560 - BLOCK
    )
    :vars
    (
      ?auto_431561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431560 ?auto_431561 ) ( ON-TABLE ?auto_431548 ) ( ON ?auto_431549 ?auto_431548 ) ( ON ?auto_431550 ?auto_431549 ) ( ON ?auto_431551 ?auto_431550 ) ( ON ?auto_431552 ?auto_431551 ) ( ON ?auto_431553 ?auto_431552 ) ( not ( = ?auto_431548 ?auto_431549 ) ) ( not ( = ?auto_431548 ?auto_431550 ) ) ( not ( = ?auto_431548 ?auto_431551 ) ) ( not ( = ?auto_431548 ?auto_431552 ) ) ( not ( = ?auto_431548 ?auto_431553 ) ) ( not ( = ?auto_431548 ?auto_431554 ) ) ( not ( = ?auto_431548 ?auto_431555 ) ) ( not ( = ?auto_431548 ?auto_431556 ) ) ( not ( = ?auto_431548 ?auto_431557 ) ) ( not ( = ?auto_431548 ?auto_431558 ) ) ( not ( = ?auto_431548 ?auto_431559 ) ) ( not ( = ?auto_431548 ?auto_431560 ) ) ( not ( = ?auto_431548 ?auto_431561 ) ) ( not ( = ?auto_431549 ?auto_431550 ) ) ( not ( = ?auto_431549 ?auto_431551 ) ) ( not ( = ?auto_431549 ?auto_431552 ) ) ( not ( = ?auto_431549 ?auto_431553 ) ) ( not ( = ?auto_431549 ?auto_431554 ) ) ( not ( = ?auto_431549 ?auto_431555 ) ) ( not ( = ?auto_431549 ?auto_431556 ) ) ( not ( = ?auto_431549 ?auto_431557 ) ) ( not ( = ?auto_431549 ?auto_431558 ) ) ( not ( = ?auto_431549 ?auto_431559 ) ) ( not ( = ?auto_431549 ?auto_431560 ) ) ( not ( = ?auto_431549 ?auto_431561 ) ) ( not ( = ?auto_431550 ?auto_431551 ) ) ( not ( = ?auto_431550 ?auto_431552 ) ) ( not ( = ?auto_431550 ?auto_431553 ) ) ( not ( = ?auto_431550 ?auto_431554 ) ) ( not ( = ?auto_431550 ?auto_431555 ) ) ( not ( = ?auto_431550 ?auto_431556 ) ) ( not ( = ?auto_431550 ?auto_431557 ) ) ( not ( = ?auto_431550 ?auto_431558 ) ) ( not ( = ?auto_431550 ?auto_431559 ) ) ( not ( = ?auto_431550 ?auto_431560 ) ) ( not ( = ?auto_431550 ?auto_431561 ) ) ( not ( = ?auto_431551 ?auto_431552 ) ) ( not ( = ?auto_431551 ?auto_431553 ) ) ( not ( = ?auto_431551 ?auto_431554 ) ) ( not ( = ?auto_431551 ?auto_431555 ) ) ( not ( = ?auto_431551 ?auto_431556 ) ) ( not ( = ?auto_431551 ?auto_431557 ) ) ( not ( = ?auto_431551 ?auto_431558 ) ) ( not ( = ?auto_431551 ?auto_431559 ) ) ( not ( = ?auto_431551 ?auto_431560 ) ) ( not ( = ?auto_431551 ?auto_431561 ) ) ( not ( = ?auto_431552 ?auto_431553 ) ) ( not ( = ?auto_431552 ?auto_431554 ) ) ( not ( = ?auto_431552 ?auto_431555 ) ) ( not ( = ?auto_431552 ?auto_431556 ) ) ( not ( = ?auto_431552 ?auto_431557 ) ) ( not ( = ?auto_431552 ?auto_431558 ) ) ( not ( = ?auto_431552 ?auto_431559 ) ) ( not ( = ?auto_431552 ?auto_431560 ) ) ( not ( = ?auto_431552 ?auto_431561 ) ) ( not ( = ?auto_431553 ?auto_431554 ) ) ( not ( = ?auto_431553 ?auto_431555 ) ) ( not ( = ?auto_431553 ?auto_431556 ) ) ( not ( = ?auto_431553 ?auto_431557 ) ) ( not ( = ?auto_431553 ?auto_431558 ) ) ( not ( = ?auto_431553 ?auto_431559 ) ) ( not ( = ?auto_431553 ?auto_431560 ) ) ( not ( = ?auto_431553 ?auto_431561 ) ) ( not ( = ?auto_431554 ?auto_431555 ) ) ( not ( = ?auto_431554 ?auto_431556 ) ) ( not ( = ?auto_431554 ?auto_431557 ) ) ( not ( = ?auto_431554 ?auto_431558 ) ) ( not ( = ?auto_431554 ?auto_431559 ) ) ( not ( = ?auto_431554 ?auto_431560 ) ) ( not ( = ?auto_431554 ?auto_431561 ) ) ( not ( = ?auto_431555 ?auto_431556 ) ) ( not ( = ?auto_431555 ?auto_431557 ) ) ( not ( = ?auto_431555 ?auto_431558 ) ) ( not ( = ?auto_431555 ?auto_431559 ) ) ( not ( = ?auto_431555 ?auto_431560 ) ) ( not ( = ?auto_431555 ?auto_431561 ) ) ( not ( = ?auto_431556 ?auto_431557 ) ) ( not ( = ?auto_431556 ?auto_431558 ) ) ( not ( = ?auto_431556 ?auto_431559 ) ) ( not ( = ?auto_431556 ?auto_431560 ) ) ( not ( = ?auto_431556 ?auto_431561 ) ) ( not ( = ?auto_431557 ?auto_431558 ) ) ( not ( = ?auto_431557 ?auto_431559 ) ) ( not ( = ?auto_431557 ?auto_431560 ) ) ( not ( = ?auto_431557 ?auto_431561 ) ) ( not ( = ?auto_431558 ?auto_431559 ) ) ( not ( = ?auto_431558 ?auto_431560 ) ) ( not ( = ?auto_431558 ?auto_431561 ) ) ( not ( = ?auto_431559 ?auto_431560 ) ) ( not ( = ?auto_431559 ?auto_431561 ) ) ( not ( = ?auto_431560 ?auto_431561 ) ) ( ON ?auto_431559 ?auto_431560 ) ( ON ?auto_431558 ?auto_431559 ) ( ON ?auto_431557 ?auto_431558 ) ( ON ?auto_431556 ?auto_431557 ) ( ON ?auto_431555 ?auto_431556 ) ( CLEAR ?auto_431553 ) ( ON ?auto_431554 ?auto_431555 ) ( CLEAR ?auto_431554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_431548 ?auto_431549 ?auto_431550 ?auto_431551 ?auto_431552 ?auto_431553 ?auto_431554 )
      ( MAKE-13PILE ?auto_431548 ?auto_431549 ?auto_431550 ?auto_431551 ?auto_431552 ?auto_431553 ?auto_431554 ?auto_431555 ?auto_431556 ?auto_431557 ?auto_431558 ?auto_431559 ?auto_431560 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431575 - BLOCK
      ?auto_431576 - BLOCK
      ?auto_431577 - BLOCK
      ?auto_431578 - BLOCK
      ?auto_431579 - BLOCK
      ?auto_431580 - BLOCK
      ?auto_431581 - BLOCK
      ?auto_431582 - BLOCK
      ?auto_431583 - BLOCK
      ?auto_431584 - BLOCK
      ?auto_431585 - BLOCK
      ?auto_431586 - BLOCK
      ?auto_431587 - BLOCK
    )
    :vars
    (
      ?auto_431588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431587 ?auto_431588 ) ( ON-TABLE ?auto_431575 ) ( ON ?auto_431576 ?auto_431575 ) ( ON ?auto_431577 ?auto_431576 ) ( ON ?auto_431578 ?auto_431577 ) ( ON ?auto_431579 ?auto_431578 ) ( not ( = ?auto_431575 ?auto_431576 ) ) ( not ( = ?auto_431575 ?auto_431577 ) ) ( not ( = ?auto_431575 ?auto_431578 ) ) ( not ( = ?auto_431575 ?auto_431579 ) ) ( not ( = ?auto_431575 ?auto_431580 ) ) ( not ( = ?auto_431575 ?auto_431581 ) ) ( not ( = ?auto_431575 ?auto_431582 ) ) ( not ( = ?auto_431575 ?auto_431583 ) ) ( not ( = ?auto_431575 ?auto_431584 ) ) ( not ( = ?auto_431575 ?auto_431585 ) ) ( not ( = ?auto_431575 ?auto_431586 ) ) ( not ( = ?auto_431575 ?auto_431587 ) ) ( not ( = ?auto_431575 ?auto_431588 ) ) ( not ( = ?auto_431576 ?auto_431577 ) ) ( not ( = ?auto_431576 ?auto_431578 ) ) ( not ( = ?auto_431576 ?auto_431579 ) ) ( not ( = ?auto_431576 ?auto_431580 ) ) ( not ( = ?auto_431576 ?auto_431581 ) ) ( not ( = ?auto_431576 ?auto_431582 ) ) ( not ( = ?auto_431576 ?auto_431583 ) ) ( not ( = ?auto_431576 ?auto_431584 ) ) ( not ( = ?auto_431576 ?auto_431585 ) ) ( not ( = ?auto_431576 ?auto_431586 ) ) ( not ( = ?auto_431576 ?auto_431587 ) ) ( not ( = ?auto_431576 ?auto_431588 ) ) ( not ( = ?auto_431577 ?auto_431578 ) ) ( not ( = ?auto_431577 ?auto_431579 ) ) ( not ( = ?auto_431577 ?auto_431580 ) ) ( not ( = ?auto_431577 ?auto_431581 ) ) ( not ( = ?auto_431577 ?auto_431582 ) ) ( not ( = ?auto_431577 ?auto_431583 ) ) ( not ( = ?auto_431577 ?auto_431584 ) ) ( not ( = ?auto_431577 ?auto_431585 ) ) ( not ( = ?auto_431577 ?auto_431586 ) ) ( not ( = ?auto_431577 ?auto_431587 ) ) ( not ( = ?auto_431577 ?auto_431588 ) ) ( not ( = ?auto_431578 ?auto_431579 ) ) ( not ( = ?auto_431578 ?auto_431580 ) ) ( not ( = ?auto_431578 ?auto_431581 ) ) ( not ( = ?auto_431578 ?auto_431582 ) ) ( not ( = ?auto_431578 ?auto_431583 ) ) ( not ( = ?auto_431578 ?auto_431584 ) ) ( not ( = ?auto_431578 ?auto_431585 ) ) ( not ( = ?auto_431578 ?auto_431586 ) ) ( not ( = ?auto_431578 ?auto_431587 ) ) ( not ( = ?auto_431578 ?auto_431588 ) ) ( not ( = ?auto_431579 ?auto_431580 ) ) ( not ( = ?auto_431579 ?auto_431581 ) ) ( not ( = ?auto_431579 ?auto_431582 ) ) ( not ( = ?auto_431579 ?auto_431583 ) ) ( not ( = ?auto_431579 ?auto_431584 ) ) ( not ( = ?auto_431579 ?auto_431585 ) ) ( not ( = ?auto_431579 ?auto_431586 ) ) ( not ( = ?auto_431579 ?auto_431587 ) ) ( not ( = ?auto_431579 ?auto_431588 ) ) ( not ( = ?auto_431580 ?auto_431581 ) ) ( not ( = ?auto_431580 ?auto_431582 ) ) ( not ( = ?auto_431580 ?auto_431583 ) ) ( not ( = ?auto_431580 ?auto_431584 ) ) ( not ( = ?auto_431580 ?auto_431585 ) ) ( not ( = ?auto_431580 ?auto_431586 ) ) ( not ( = ?auto_431580 ?auto_431587 ) ) ( not ( = ?auto_431580 ?auto_431588 ) ) ( not ( = ?auto_431581 ?auto_431582 ) ) ( not ( = ?auto_431581 ?auto_431583 ) ) ( not ( = ?auto_431581 ?auto_431584 ) ) ( not ( = ?auto_431581 ?auto_431585 ) ) ( not ( = ?auto_431581 ?auto_431586 ) ) ( not ( = ?auto_431581 ?auto_431587 ) ) ( not ( = ?auto_431581 ?auto_431588 ) ) ( not ( = ?auto_431582 ?auto_431583 ) ) ( not ( = ?auto_431582 ?auto_431584 ) ) ( not ( = ?auto_431582 ?auto_431585 ) ) ( not ( = ?auto_431582 ?auto_431586 ) ) ( not ( = ?auto_431582 ?auto_431587 ) ) ( not ( = ?auto_431582 ?auto_431588 ) ) ( not ( = ?auto_431583 ?auto_431584 ) ) ( not ( = ?auto_431583 ?auto_431585 ) ) ( not ( = ?auto_431583 ?auto_431586 ) ) ( not ( = ?auto_431583 ?auto_431587 ) ) ( not ( = ?auto_431583 ?auto_431588 ) ) ( not ( = ?auto_431584 ?auto_431585 ) ) ( not ( = ?auto_431584 ?auto_431586 ) ) ( not ( = ?auto_431584 ?auto_431587 ) ) ( not ( = ?auto_431584 ?auto_431588 ) ) ( not ( = ?auto_431585 ?auto_431586 ) ) ( not ( = ?auto_431585 ?auto_431587 ) ) ( not ( = ?auto_431585 ?auto_431588 ) ) ( not ( = ?auto_431586 ?auto_431587 ) ) ( not ( = ?auto_431586 ?auto_431588 ) ) ( not ( = ?auto_431587 ?auto_431588 ) ) ( ON ?auto_431586 ?auto_431587 ) ( ON ?auto_431585 ?auto_431586 ) ( ON ?auto_431584 ?auto_431585 ) ( ON ?auto_431583 ?auto_431584 ) ( ON ?auto_431582 ?auto_431583 ) ( ON ?auto_431581 ?auto_431582 ) ( CLEAR ?auto_431579 ) ( ON ?auto_431580 ?auto_431581 ) ( CLEAR ?auto_431580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_431575 ?auto_431576 ?auto_431577 ?auto_431578 ?auto_431579 ?auto_431580 )
      ( MAKE-13PILE ?auto_431575 ?auto_431576 ?auto_431577 ?auto_431578 ?auto_431579 ?auto_431580 ?auto_431581 ?auto_431582 ?auto_431583 ?auto_431584 ?auto_431585 ?auto_431586 ?auto_431587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431602 - BLOCK
      ?auto_431603 - BLOCK
      ?auto_431604 - BLOCK
      ?auto_431605 - BLOCK
      ?auto_431606 - BLOCK
      ?auto_431607 - BLOCK
      ?auto_431608 - BLOCK
      ?auto_431609 - BLOCK
      ?auto_431610 - BLOCK
      ?auto_431611 - BLOCK
      ?auto_431612 - BLOCK
      ?auto_431613 - BLOCK
      ?auto_431614 - BLOCK
    )
    :vars
    (
      ?auto_431615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431614 ?auto_431615 ) ( ON-TABLE ?auto_431602 ) ( ON ?auto_431603 ?auto_431602 ) ( ON ?auto_431604 ?auto_431603 ) ( ON ?auto_431605 ?auto_431604 ) ( ON ?auto_431606 ?auto_431605 ) ( not ( = ?auto_431602 ?auto_431603 ) ) ( not ( = ?auto_431602 ?auto_431604 ) ) ( not ( = ?auto_431602 ?auto_431605 ) ) ( not ( = ?auto_431602 ?auto_431606 ) ) ( not ( = ?auto_431602 ?auto_431607 ) ) ( not ( = ?auto_431602 ?auto_431608 ) ) ( not ( = ?auto_431602 ?auto_431609 ) ) ( not ( = ?auto_431602 ?auto_431610 ) ) ( not ( = ?auto_431602 ?auto_431611 ) ) ( not ( = ?auto_431602 ?auto_431612 ) ) ( not ( = ?auto_431602 ?auto_431613 ) ) ( not ( = ?auto_431602 ?auto_431614 ) ) ( not ( = ?auto_431602 ?auto_431615 ) ) ( not ( = ?auto_431603 ?auto_431604 ) ) ( not ( = ?auto_431603 ?auto_431605 ) ) ( not ( = ?auto_431603 ?auto_431606 ) ) ( not ( = ?auto_431603 ?auto_431607 ) ) ( not ( = ?auto_431603 ?auto_431608 ) ) ( not ( = ?auto_431603 ?auto_431609 ) ) ( not ( = ?auto_431603 ?auto_431610 ) ) ( not ( = ?auto_431603 ?auto_431611 ) ) ( not ( = ?auto_431603 ?auto_431612 ) ) ( not ( = ?auto_431603 ?auto_431613 ) ) ( not ( = ?auto_431603 ?auto_431614 ) ) ( not ( = ?auto_431603 ?auto_431615 ) ) ( not ( = ?auto_431604 ?auto_431605 ) ) ( not ( = ?auto_431604 ?auto_431606 ) ) ( not ( = ?auto_431604 ?auto_431607 ) ) ( not ( = ?auto_431604 ?auto_431608 ) ) ( not ( = ?auto_431604 ?auto_431609 ) ) ( not ( = ?auto_431604 ?auto_431610 ) ) ( not ( = ?auto_431604 ?auto_431611 ) ) ( not ( = ?auto_431604 ?auto_431612 ) ) ( not ( = ?auto_431604 ?auto_431613 ) ) ( not ( = ?auto_431604 ?auto_431614 ) ) ( not ( = ?auto_431604 ?auto_431615 ) ) ( not ( = ?auto_431605 ?auto_431606 ) ) ( not ( = ?auto_431605 ?auto_431607 ) ) ( not ( = ?auto_431605 ?auto_431608 ) ) ( not ( = ?auto_431605 ?auto_431609 ) ) ( not ( = ?auto_431605 ?auto_431610 ) ) ( not ( = ?auto_431605 ?auto_431611 ) ) ( not ( = ?auto_431605 ?auto_431612 ) ) ( not ( = ?auto_431605 ?auto_431613 ) ) ( not ( = ?auto_431605 ?auto_431614 ) ) ( not ( = ?auto_431605 ?auto_431615 ) ) ( not ( = ?auto_431606 ?auto_431607 ) ) ( not ( = ?auto_431606 ?auto_431608 ) ) ( not ( = ?auto_431606 ?auto_431609 ) ) ( not ( = ?auto_431606 ?auto_431610 ) ) ( not ( = ?auto_431606 ?auto_431611 ) ) ( not ( = ?auto_431606 ?auto_431612 ) ) ( not ( = ?auto_431606 ?auto_431613 ) ) ( not ( = ?auto_431606 ?auto_431614 ) ) ( not ( = ?auto_431606 ?auto_431615 ) ) ( not ( = ?auto_431607 ?auto_431608 ) ) ( not ( = ?auto_431607 ?auto_431609 ) ) ( not ( = ?auto_431607 ?auto_431610 ) ) ( not ( = ?auto_431607 ?auto_431611 ) ) ( not ( = ?auto_431607 ?auto_431612 ) ) ( not ( = ?auto_431607 ?auto_431613 ) ) ( not ( = ?auto_431607 ?auto_431614 ) ) ( not ( = ?auto_431607 ?auto_431615 ) ) ( not ( = ?auto_431608 ?auto_431609 ) ) ( not ( = ?auto_431608 ?auto_431610 ) ) ( not ( = ?auto_431608 ?auto_431611 ) ) ( not ( = ?auto_431608 ?auto_431612 ) ) ( not ( = ?auto_431608 ?auto_431613 ) ) ( not ( = ?auto_431608 ?auto_431614 ) ) ( not ( = ?auto_431608 ?auto_431615 ) ) ( not ( = ?auto_431609 ?auto_431610 ) ) ( not ( = ?auto_431609 ?auto_431611 ) ) ( not ( = ?auto_431609 ?auto_431612 ) ) ( not ( = ?auto_431609 ?auto_431613 ) ) ( not ( = ?auto_431609 ?auto_431614 ) ) ( not ( = ?auto_431609 ?auto_431615 ) ) ( not ( = ?auto_431610 ?auto_431611 ) ) ( not ( = ?auto_431610 ?auto_431612 ) ) ( not ( = ?auto_431610 ?auto_431613 ) ) ( not ( = ?auto_431610 ?auto_431614 ) ) ( not ( = ?auto_431610 ?auto_431615 ) ) ( not ( = ?auto_431611 ?auto_431612 ) ) ( not ( = ?auto_431611 ?auto_431613 ) ) ( not ( = ?auto_431611 ?auto_431614 ) ) ( not ( = ?auto_431611 ?auto_431615 ) ) ( not ( = ?auto_431612 ?auto_431613 ) ) ( not ( = ?auto_431612 ?auto_431614 ) ) ( not ( = ?auto_431612 ?auto_431615 ) ) ( not ( = ?auto_431613 ?auto_431614 ) ) ( not ( = ?auto_431613 ?auto_431615 ) ) ( not ( = ?auto_431614 ?auto_431615 ) ) ( ON ?auto_431613 ?auto_431614 ) ( ON ?auto_431612 ?auto_431613 ) ( ON ?auto_431611 ?auto_431612 ) ( ON ?auto_431610 ?auto_431611 ) ( ON ?auto_431609 ?auto_431610 ) ( ON ?auto_431608 ?auto_431609 ) ( CLEAR ?auto_431606 ) ( ON ?auto_431607 ?auto_431608 ) ( CLEAR ?auto_431607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_431602 ?auto_431603 ?auto_431604 ?auto_431605 ?auto_431606 ?auto_431607 )
      ( MAKE-13PILE ?auto_431602 ?auto_431603 ?auto_431604 ?auto_431605 ?auto_431606 ?auto_431607 ?auto_431608 ?auto_431609 ?auto_431610 ?auto_431611 ?auto_431612 ?auto_431613 ?auto_431614 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431629 - BLOCK
      ?auto_431630 - BLOCK
      ?auto_431631 - BLOCK
      ?auto_431632 - BLOCK
      ?auto_431633 - BLOCK
      ?auto_431634 - BLOCK
      ?auto_431635 - BLOCK
      ?auto_431636 - BLOCK
      ?auto_431637 - BLOCK
      ?auto_431638 - BLOCK
      ?auto_431639 - BLOCK
      ?auto_431640 - BLOCK
      ?auto_431641 - BLOCK
    )
    :vars
    (
      ?auto_431642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431641 ?auto_431642 ) ( ON-TABLE ?auto_431629 ) ( ON ?auto_431630 ?auto_431629 ) ( ON ?auto_431631 ?auto_431630 ) ( ON ?auto_431632 ?auto_431631 ) ( not ( = ?auto_431629 ?auto_431630 ) ) ( not ( = ?auto_431629 ?auto_431631 ) ) ( not ( = ?auto_431629 ?auto_431632 ) ) ( not ( = ?auto_431629 ?auto_431633 ) ) ( not ( = ?auto_431629 ?auto_431634 ) ) ( not ( = ?auto_431629 ?auto_431635 ) ) ( not ( = ?auto_431629 ?auto_431636 ) ) ( not ( = ?auto_431629 ?auto_431637 ) ) ( not ( = ?auto_431629 ?auto_431638 ) ) ( not ( = ?auto_431629 ?auto_431639 ) ) ( not ( = ?auto_431629 ?auto_431640 ) ) ( not ( = ?auto_431629 ?auto_431641 ) ) ( not ( = ?auto_431629 ?auto_431642 ) ) ( not ( = ?auto_431630 ?auto_431631 ) ) ( not ( = ?auto_431630 ?auto_431632 ) ) ( not ( = ?auto_431630 ?auto_431633 ) ) ( not ( = ?auto_431630 ?auto_431634 ) ) ( not ( = ?auto_431630 ?auto_431635 ) ) ( not ( = ?auto_431630 ?auto_431636 ) ) ( not ( = ?auto_431630 ?auto_431637 ) ) ( not ( = ?auto_431630 ?auto_431638 ) ) ( not ( = ?auto_431630 ?auto_431639 ) ) ( not ( = ?auto_431630 ?auto_431640 ) ) ( not ( = ?auto_431630 ?auto_431641 ) ) ( not ( = ?auto_431630 ?auto_431642 ) ) ( not ( = ?auto_431631 ?auto_431632 ) ) ( not ( = ?auto_431631 ?auto_431633 ) ) ( not ( = ?auto_431631 ?auto_431634 ) ) ( not ( = ?auto_431631 ?auto_431635 ) ) ( not ( = ?auto_431631 ?auto_431636 ) ) ( not ( = ?auto_431631 ?auto_431637 ) ) ( not ( = ?auto_431631 ?auto_431638 ) ) ( not ( = ?auto_431631 ?auto_431639 ) ) ( not ( = ?auto_431631 ?auto_431640 ) ) ( not ( = ?auto_431631 ?auto_431641 ) ) ( not ( = ?auto_431631 ?auto_431642 ) ) ( not ( = ?auto_431632 ?auto_431633 ) ) ( not ( = ?auto_431632 ?auto_431634 ) ) ( not ( = ?auto_431632 ?auto_431635 ) ) ( not ( = ?auto_431632 ?auto_431636 ) ) ( not ( = ?auto_431632 ?auto_431637 ) ) ( not ( = ?auto_431632 ?auto_431638 ) ) ( not ( = ?auto_431632 ?auto_431639 ) ) ( not ( = ?auto_431632 ?auto_431640 ) ) ( not ( = ?auto_431632 ?auto_431641 ) ) ( not ( = ?auto_431632 ?auto_431642 ) ) ( not ( = ?auto_431633 ?auto_431634 ) ) ( not ( = ?auto_431633 ?auto_431635 ) ) ( not ( = ?auto_431633 ?auto_431636 ) ) ( not ( = ?auto_431633 ?auto_431637 ) ) ( not ( = ?auto_431633 ?auto_431638 ) ) ( not ( = ?auto_431633 ?auto_431639 ) ) ( not ( = ?auto_431633 ?auto_431640 ) ) ( not ( = ?auto_431633 ?auto_431641 ) ) ( not ( = ?auto_431633 ?auto_431642 ) ) ( not ( = ?auto_431634 ?auto_431635 ) ) ( not ( = ?auto_431634 ?auto_431636 ) ) ( not ( = ?auto_431634 ?auto_431637 ) ) ( not ( = ?auto_431634 ?auto_431638 ) ) ( not ( = ?auto_431634 ?auto_431639 ) ) ( not ( = ?auto_431634 ?auto_431640 ) ) ( not ( = ?auto_431634 ?auto_431641 ) ) ( not ( = ?auto_431634 ?auto_431642 ) ) ( not ( = ?auto_431635 ?auto_431636 ) ) ( not ( = ?auto_431635 ?auto_431637 ) ) ( not ( = ?auto_431635 ?auto_431638 ) ) ( not ( = ?auto_431635 ?auto_431639 ) ) ( not ( = ?auto_431635 ?auto_431640 ) ) ( not ( = ?auto_431635 ?auto_431641 ) ) ( not ( = ?auto_431635 ?auto_431642 ) ) ( not ( = ?auto_431636 ?auto_431637 ) ) ( not ( = ?auto_431636 ?auto_431638 ) ) ( not ( = ?auto_431636 ?auto_431639 ) ) ( not ( = ?auto_431636 ?auto_431640 ) ) ( not ( = ?auto_431636 ?auto_431641 ) ) ( not ( = ?auto_431636 ?auto_431642 ) ) ( not ( = ?auto_431637 ?auto_431638 ) ) ( not ( = ?auto_431637 ?auto_431639 ) ) ( not ( = ?auto_431637 ?auto_431640 ) ) ( not ( = ?auto_431637 ?auto_431641 ) ) ( not ( = ?auto_431637 ?auto_431642 ) ) ( not ( = ?auto_431638 ?auto_431639 ) ) ( not ( = ?auto_431638 ?auto_431640 ) ) ( not ( = ?auto_431638 ?auto_431641 ) ) ( not ( = ?auto_431638 ?auto_431642 ) ) ( not ( = ?auto_431639 ?auto_431640 ) ) ( not ( = ?auto_431639 ?auto_431641 ) ) ( not ( = ?auto_431639 ?auto_431642 ) ) ( not ( = ?auto_431640 ?auto_431641 ) ) ( not ( = ?auto_431640 ?auto_431642 ) ) ( not ( = ?auto_431641 ?auto_431642 ) ) ( ON ?auto_431640 ?auto_431641 ) ( ON ?auto_431639 ?auto_431640 ) ( ON ?auto_431638 ?auto_431639 ) ( ON ?auto_431637 ?auto_431638 ) ( ON ?auto_431636 ?auto_431637 ) ( ON ?auto_431635 ?auto_431636 ) ( ON ?auto_431634 ?auto_431635 ) ( CLEAR ?auto_431632 ) ( ON ?auto_431633 ?auto_431634 ) ( CLEAR ?auto_431633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_431629 ?auto_431630 ?auto_431631 ?auto_431632 ?auto_431633 )
      ( MAKE-13PILE ?auto_431629 ?auto_431630 ?auto_431631 ?auto_431632 ?auto_431633 ?auto_431634 ?auto_431635 ?auto_431636 ?auto_431637 ?auto_431638 ?auto_431639 ?auto_431640 ?auto_431641 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431656 - BLOCK
      ?auto_431657 - BLOCK
      ?auto_431658 - BLOCK
      ?auto_431659 - BLOCK
      ?auto_431660 - BLOCK
      ?auto_431661 - BLOCK
      ?auto_431662 - BLOCK
      ?auto_431663 - BLOCK
      ?auto_431664 - BLOCK
      ?auto_431665 - BLOCK
      ?auto_431666 - BLOCK
      ?auto_431667 - BLOCK
      ?auto_431668 - BLOCK
    )
    :vars
    (
      ?auto_431669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431668 ?auto_431669 ) ( ON-TABLE ?auto_431656 ) ( ON ?auto_431657 ?auto_431656 ) ( ON ?auto_431658 ?auto_431657 ) ( ON ?auto_431659 ?auto_431658 ) ( not ( = ?auto_431656 ?auto_431657 ) ) ( not ( = ?auto_431656 ?auto_431658 ) ) ( not ( = ?auto_431656 ?auto_431659 ) ) ( not ( = ?auto_431656 ?auto_431660 ) ) ( not ( = ?auto_431656 ?auto_431661 ) ) ( not ( = ?auto_431656 ?auto_431662 ) ) ( not ( = ?auto_431656 ?auto_431663 ) ) ( not ( = ?auto_431656 ?auto_431664 ) ) ( not ( = ?auto_431656 ?auto_431665 ) ) ( not ( = ?auto_431656 ?auto_431666 ) ) ( not ( = ?auto_431656 ?auto_431667 ) ) ( not ( = ?auto_431656 ?auto_431668 ) ) ( not ( = ?auto_431656 ?auto_431669 ) ) ( not ( = ?auto_431657 ?auto_431658 ) ) ( not ( = ?auto_431657 ?auto_431659 ) ) ( not ( = ?auto_431657 ?auto_431660 ) ) ( not ( = ?auto_431657 ?auto_431661 ) ) ( not ( = ?auto_431657 ?auto_431662 ) ) ( not ( = ?auto_431657 ?auto_431663 ) ) ( not ( = ?auto_431657 ?auto_431664 ) ) ( not ( = ?auto_431657 ?auto_431665 ) ) ( not ( = ?auto_431657 ?auto_431666 ) ) ( not ( = ?auto_431657 ?auto_431667 ) ) ( not ( = ?auto_431657 ?auto_431668 ) ) ( not ( = ?auto_431657 ?auto_431669 ) ) ( not ( = ?auto_431658 ?auto_431659 ) ) ( not ( = ?auto_431658 ?auto_431660 ) ) ( not ( = ?auto_431658 ?auto_431661 ) ) ( not ( = ?auto_431658 ?auto_431662 ) ) ( not ( = ?auto_431658 ?auto_431663 ) ) ( not ( = ?auto_431658 ?auto_431664 ) ) ( not ( = ?auto_431658 ?auto_431665 ) ) ( not ( = ?auto_431658 ?auto_431666 ) ) ( not ( = ?auto_431658 ?auto_431667 ) ) ( not ( = ?auto_431658 ?auto_431668 ) ) ( not ( = ?auto_431658 ?auto_431669 ) ) ( not ( = ?auto_431659 ?auto_431660 ) ) ( not ( = ?auto_431659 ?auto_431661 ) ) ( not ( = ?auto_431659 ?auto_431662 ) ) ( not ( = ?auto_431659 ?auto_431663 ) ) ( not ( = ?auto_431659 ?auto_431664 ) ) ( not ( = ?auto_431659 ?auto_431665 ) ) ( not ( = ?auto_431659 ?auto_431666 ) ) ( not ( = ?auto_431659 ?auto_431667 ) ) ( not ( = ?auto_431659 ?auto_431668 ) ) ( not ( = ?auto_431659 ?auto_431669 ) ) ( not ( = ?auto_431660 ?auto_431661 ) ) ( not ( = ?auto_431660 ?auto_431662 ) ) ( not ( = ?auto_431660 ?auto_431663 ) ) ( not ( = ?auto_431660 ?auto_431664 ) ) ( not ( = ?auto_431660 ?auto_431665 ) ) ( not ( = ?auto_431660 ?auto_431666 ) ) ( not ( = ?auto_431660 ?auto_431667 ) ) ( not ( = ?auto_431660 ?auto_431668 ) ) ( not ( = ?auto_431660 ?auto_431669 ) ) ( not ( = ?auto_431661 ?auto_431662 ) ) ( not ( = ?auto_431661 ?auto_431663 ) ) ( not ( = ?auto_431661 ?auto_431664 ) ) ( not ( = ?auto_431661 ?auto_431665 ) ) ( not ( = ?auto_431661 ?auto_431666 ) ) ( not ( = ?auto_431661 ?auto_431667 ) ) ( not ( = ?auto_431661 ?auto_431668 ) ) ( not ( = ?auto_431661 ?auto_431669 ) ) ( not ( = ?auto_431662 ?auto_431663 ) ) ( not ( = ?auto_431662 ?auto_431664 ) ) ( not ( = ?auto_431662 ?auto_431665 ) ) ( not ( = ?auto_431662 ?auto_431666 ) ) ( not ( = ?auto_431662 ?auto_431667 ) ) ( not ( = ?auto_431662 ?auto_431668 ) ) ( not ( = ?auto_431662 ?auto_431669 ) ) ( not ( = ?auto_431663 ?auto_431664 ) ) ( not ( = ?auto_431663 ?auto_431665 ) ) ( not ( = ?auto_431663 ?auto_431666 ) ) ( not ( = ?auto_431663 ?auto_431667 ) ) ( not ( = ?auto_431663 ?auto_431668 ) ) ( not ( = ?auto_431663 ?auto_431669 ) ) ( not ( = ?auto_431664 ?auto_431665 ) ) ( not ( = ?auto_431664 ?auto_431666 ) ) ( not ( = ?auto_431664 ?auto_431667 ) ) ( not ( = ?auto_431664 ?auto_431668 ) ) ( not ( = ?auto_431664 ?auto_431669 ) ) ( not ( = ?auto_431665 ?auto_431666 ) ) ( not ( = ?auto_431665 ?auto_431667 ) ) ( not ( = ?auto_431665 ?auto_431668 ) ) ( not ( = ?auto_431665 ?auto_431669 ) ) ( not ( = ?auto_431666 ?auto_431667 ) ) ( not ( = ?auto_431666 ?auto_431668 ) ) ( not ( = ?auto_431666 ?auto_431669 ) ) ( not ( = ?auto_431667 ?auto_431668 ) ) ( not ( = ?auto_431667 ?auto_431669 ) ) ( not ( = ?auto_431668 ?auto_431669 ) ) ( ON ?auto_431667 ?auto_431668 ) ( ON ?auto_431666 ?auto_431667 ) ( ON ?auto_431665 ?auto_431666 ) ( ON ?auto_431664 ?auto_431665 ) ( ON ?auto_431663 ?auto_431664 ) ( ON ?auto_431662 ?auto_431663 ) ( ON ?auto_431661 ?auto_431662 ) ( CLEAR ?auto_431659 ) ( ON ?auto_431660 ?auto_431661 ) ( CLEAR ?auto_431660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_431656 ?auto_431657 ?auto_431658 ?auto_431659 ?auto_431660 )
      ( MAKE-13PILE ?auto_431656 ?auto_431657 ?auto_431658 ?auto_431659 ?auto_431660 ?auto_431661 ?auto_431662 ?auto_431663 ?auto_431664 ?auto_431665 ?auto_431666 ?auto_431667 ?auto_431668 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431683 - BLOCK
      ?auto_431684 - BLOCK
      ?auto_431685 - BLOCK
      ?auto_431686 - BLOCK
      ?auto_431687 - BLOCK
      ?auto_431688 - BLOCK
      ?auto_431689 - BLOCK
      ?auto_431690 - BLOCK
      ?auto_431691 - BLOCK
      ?auto_431692 - BLOCK
      ?auto_431693 - BLOCK
      ?auto_431694 - BLOCK
      ?auto_431695 - BLOCK
    )
    :vars
    (
      ?auto_431696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431695 ?auto_431696 ) ( ON-TABLE ?auto_431683 ) ( ON ?auto_431684 ?auto_431683 ) ( ON ?auto_431685 ?auto_431684 ) ( not ( = ?auto_431683 ?auto_431684 ) ) ( not ( = ?auto_431683 ?auto_431685 ) ) ( not ( = ?auto_431683 ?auto_431686 ) ) ( not ( = ?auto_431683 ?auto_431687 ) ) ( not ( = ?auto_431683 ?auto_431688 ) ) ( not ( = ?auto_431683 ?auto_431689 ) ) ( not ( = ?auto_431683 ?auto_431690 ) ) ( not ( = ?auto_431683 ?auto_431691 ) ) ( not ( = ?auto_431683 ?auto_431692 ) ) ( not ( = ?auto_431683 ?auto_431693 ) ) ( not ( = ?auto_431683 ?auto_431694 ) ) ( not ( = ?auto_431683 ?auto_431695 ) ) ( not ( = ?auto_431683 ?auto_431696 ) ) ( not ( = ?auto_431684 ?auto_431685 ) ) ( not ( = ?auto_431684 ?auto_431686 ) ) ( not ( = ?auto_431684 ?auto_431687 ) ) ( not ( = ?auto_431684 ?auto_431688 ) ) ( not ( = ?auto_431684 ?auto_431689 ) ) ( not ( = ?auto_431684 ?auto_431690 ) ) ( not ( = ?auto_431684 ?auto_431691 ) ) ( not ( = ?auto_431684 ?auto_431692 ) ) ( not ( = ?auto_431684 ?auto_431693 ) ) ( not ( = ?auto_431684 ?auto_431694 ) ) ( not ( = ?auto_431684 ?auto_431695 ) ) ( not ( = ?auto_431684 ?auto_431696 ) ) ( not ( = ?auto_431685 ?auto_431686 ) ) ( not ( = ?auto_431685 ?auto_431687 ) ) ( not ( = ?auto_431685 ?auto_431688 ) ) ( not ( = ?auto_431685 ?auto_431689 ) ) ( not ( = ?auto_431685 ?auto_431690 ) ) ( not ( = ?auto_431685 ?auto_431691 ) ) ( not ( = ?auto_431685 ?auto_431692 ) ) ( not ( = ?auto_431685 ?auto_431693 ) ) ( not ( = ?auto_431685 ?auto_431694 ) ) ( not ( = ?auto_431685 ?auto_431695 ) ) ( not ( = ?auto_431685 ?auto_431696 ) ) ( not ( = ?auto_431686 ?auto_431687 ) ) ( not ( = ?auto_431686 ?auto_431688 ) ) ( not ( = ?auto_431686 ?auto_431689 ) ) ( not ( = ?auto_431686 ?auto_431690 ) ) ( not ( = ?auto_431686 ?auto_431691 ) ) ( not ( = ?auto_431686 ?auto_431692 ) ) ( not ( = ?auto_431686 ?auto_431693 ) ) ( not ( = ?auto_431686 ?auto_431694 ) ) ( not ( = ?auto_431686 ?auto_431695 ) ) ( not ( = ?auto_431686 ?auto_431696 ) ) ( not ( = ?auto_431687 ?auto_431688 ) ) ( not ( = ?auto_431687 ?auto_431689 ) ) ( not ( = ?auto_431687 ?auto_431690 ) ) ( not ( = ?auto_431687 ?auto_431691 ) ) ( not ( = ?auto_431687 ?auto_431692 ) ) ( not ( = ?auto_431687 ?auto_431693 ) ) ( not ( = ?auto_431687 ?auto_431694 ) ) ( not ( = ?auto_431687 ?auto_431695 ) ) ( not ( = ?auto_431687 ?auto_431696 ) ) ( not ( = ?auto_431688 ?auto_431689 ) ) ( not ( = ?auto_431688 ?auto_431690 ) ) ( not ( = ?auto_431688 ?auto_431691 ) ) ( not ( = ?auto_431688 ?auto_431692 ) ) ( not ( = ?auto_431688 ?auto_431693 ) ) ( not ( = ?auto_431688 ?auto_431694 ) ) ( not ( = ?auto_431688 ?auto_431695 ) ) ( not ( = ?auto_431688 ?auto_431696 ) ) ( not ( = ?auto_431689 ?auto_431690 ) ) ( not ( = ?auto_431689 ?auto_431691 ) ) ( not ( = ?auto_431689 ?auto_431692 ) ) ( not ( = ?auto_431689 ?auto_431693 ) ) ( not ( = ?auto_431689 ?auto_431694 ) ) ( not ( = ?auto_431689 ?auto_431695 ) ) ( not ( = ?auto_431689 ?auto_431696 ) ) ( not ( = ?auto_431690 ?auto_431691 ) ) ( not ( = ?auto_431690 ?auto_431692 ) ) ( not ( = ?auto_431690 ?auto_431693 ) ) ( not ( = ?auto_431690 ?auto_431694 ) ) ( not ( = ?auto_431690 ?auto_431695 ) ) ( not ( = ?auto_431690 ?auto_431696 ) ) ( not ( = ?auto_431691 ?auto_431692 ) ) ( not ( = ?auto_431691 ?auto_431693 ) ) ( not ( = ?auto_431691 ?auto_431694 ) ) ( not ( = ?auto_431691 ?auto_431695 ) ) ( not ( = ?auto_431691 ?auto_431696 ) ) ( not ( = ?auto_431692 ?auto_431693 ) ) ( not ( = ?auto_431692 ?auto_431694 ) ) ( not ( = ?auto_431692 ?auto_431695 ) ) ( not ( = ?auto_431692 ?auto_431696 ) ) ( not ( = ?auto_431693 ?auto_431694 ) ) ( not ( = ?auto_431693 ?auto_431695 ) ) ( not ( = ?auto_431693 ?auto_431696 ) ) ( not ( = ?auto_431694 ?auto_431695 ) ) ( not ( = ?auto_431694 ?auto_431696 ) ) ( not ( = ?auto_431695 ?auto_431696 ) ) ( ON ?auto_431694 ?auto_431695 ) ( ON ?auto_431693 ?auto_431694 ) ( ON ?auto_431692 ?auto_431693 ) ( ON ?auto_431691 ?auto_431692 ) ( ON ?auto_431690 ?auto_431691 ) ( ON ?auto_431689 ?auto_431690 ) ( ON ?auto_431688 ?auto_431689 ) ( ON ?auto_431687 ?auto_431688 ) ( CLEAR ?auto_431685 ) ( ON ?auto_431686 ?auto_431687 ) ( CLEAR ?auto_431686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_431683 ?auto_431684 ?auto_431685 ?auto_431686 )
      ( MAKE-13PILE ?auto_431683 ?auto_431684 ?auto_431685 ?auto_431686 ?auto_431687 ?auto_431688 ?auto_431689 ?auto_431690 ?auto_431691 ?auto_431692 ?auto_431693 ?auto_431694 ?auto_431695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431710 - BLOCK
      ?auto_431711 - BLOCK
      ?auto_431712 - BLOCK
      ?auto_431713 - BLOCK
      ?auto_431714 - BLOCK
      ?auto_431715 - BLOCK
      ?auto_431716 - BLOCK
      ?auto_431717 - BLOCK
      ?auto_431718 - BLOCK
      ?auto_431719 - BLOCK
      ?auto_431720 - BLOCK
      ?auto_431721 - BLOCK
      ?auto_431722 - BLOCK
    )
    :vars
    (
      ?auto_431723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431722 ?auto_431723 ) ( ON-TABLE ?auto_431710 ) ( ON ?auto_431711 ?auto_431710 ) ( ON ?auto_431712 ?auto_431711 ) ( not ( = ?auto_431710 ?auto_431711 ) ) ( not ( = ?auto_431710 ?auto_431712 ) ) ( not ( = ?auto_431710 ?auto_431713 ) ) ( not ( = ?auto_431710 ?auto_431714 ) ) ( not ( = ?auto_431710 ?auto_431715 ) ) ( not ( = ?auto_431710 ?auto_431716 ) ) ( not ( = ?auto_431710 ?auto_431717 ) ) ( not ( = ?auto_431710 ?auto_431718 ) ) ( not ( = ?auto_431710 ?auto_431719 ) ) ( not ( = ?auto_431710 ?auto_431720 ) ) ( not ( = ?auto_431710 ?auto_431721 ) ) ( not ( = ?auto_431710 ?auto_431722 ) ) ( not ( = ?auto_431710 ?auto_431723 ) ) ( not ( = ?auto_431711 ?auto_431712 ) ) ( not ( = ?auto_431711 ?auto_431713 ) ) ( not ( = ?auto_431711 ?auto_431714 ) ) ( not ( = ?auto_431711 ?auto_431715 ) ) ( not ( = ?auto_431711 ?auto_431716 ) ) ( not ( = ?auto_431711 ?auto_431717 ) ) ( not ( = ?auto_431711 ?auto_431718 ) ) ( not ( = ?auto_431711 ?auto_431719 ) ) ( not ( = ?auto_431711 ?auto_431720 ) ) ( not ( = ?auto_431711 ?auto_431721 ) ) ( not ( = ?auto_431711 ?auto_431722 ) ) ( not ( = ?auto_431711 ?auto_431723 ) ) ( not ( = ?auto_431712 ?auto_431713 ) ) ( not ( = ?auto_431712 ?auto_431714 ) ) ( not ( = ?auto_431712 ?auto_431715 ) ) ( not ( = ?auto_431712 ?auto_431716 ) ) ( not ( = ?auto_431712 ?auto_431717 ) ) ( not ( = ?auto_431712 ?auto_431718 ) ) ( not ( = ?auto_431712 ?auto_431719 ) ) ( not ( = ?auto_431712 ?auto_431720 ) ) ( not ( = ?auto_431712 ?auto_431721 ) ) ( not ( = ?auto_431712 ?auto_431722 ) ) ( not ( = ?auto_431712 ?auto_431723 ) ) ( not ( = ?auto_431713 ?auto_431714 ) ) ( not ( = ?auto_431713 ?auto_431715 ) ) ( not ( = ?auto_431713 ?auto_431716 ) ) ( not ( = ?auto_431713 ?auto_431717 ) ) ( not ( = ?auto_431713 ?auto_431718 ) ) ( not ( = ?auto_431713 ?auto_431719 ) ) ( not ( = ?auto_431713 ?auto_431720 ) ) ( not ( = ?auto_431713 ?auto_431721 ) ) ( not ( = ?auto_431713 ?auto_431722 ) ) ( not ( = ?auto_431713 ?auto_431723 ) ) ( not ( = ?auto_431714 ?auto_431715 ) ) ( not ( = ?auto_431714 ?auto_431716 ) ) ( not ( = ?auto_431714 ?auto_431717 ) ) ( not ( = ?auto_431714 ?auto_431718 ) ) ( not ( = ?auto_431714 ?auto_431719 ) ) ( not ( = ?auto_431714 ?auto_431720 ) ) ( not ( = ?auto_431714 ?auto_431721 ) ) ( not ( = ?auto_431714 ?auto_431722 ) ) ( not ( = ?auto_431714 ?auto_431723 ) ) ( not ( = ?auto_431715 ?auto_431716 ) ) ( not ( = ?auto_431715 ?auto_431717 ) ) ( not ( = ?auto_431715 ?auto_431718 ) ) ( not ( = ?auto_431715 ?auto_431719 ) ) ( not ( = ?auto_431715 ?auto_431720 ) ) ( not ( = ?auto_431715 ?auto_431721 ) ) ( not ( = ?auto_431715 ?auto_431722 ) ) ( not ( = ?auto_431715 ?auto_431723 ) ) ( not ( = ?auto_431716 ?auto_431717 ) ) ( not ( = ?auto_431716 ?auto_431718 ) ) ( not ( = ?auto_431716 ?auto_431719 ) ) ( not ( = ?auto_431716 ?auto_431720 ) ) ( not ( = ?auto_431716 ?auto_431721 ) ) ( not ( = ?auto_431716 ?auto_431722 ) ) ( not ( = ?auto_431716 ?auto_431723 ) ) ( not ( = ?auto_431717 ?auto_431718 ) ) ( not ( = ?auto_431717 ?auto_431719 ) ) ( not ( = ?auto_431717 ?auto_431720 ) ) ( not ( = ?auto_431717 ?auto_431721 ) ) ( not ( = ?auto_431717 ?auto_431722 ) ) ( not ( = ?auto_431717 ?auto_431723 ) ) ( not ( = ?auto_431718 ?auto_431719 ) ) ( not ( = ?auto_431718 ?auto_431720 ) ) ( not ( = ?auto_431718 ?auto_431721 ) ) ( not ( = ?auto_431718 ?auto_431722 ) ) ( not ( = ?auto_431718 ?auto_431723 ) ) ( not ( = ?auto_431719 ?auto_431720 ) ) ( not ( = ?auto_431719 ?auto_431721 ) ) ( not ( = ?auto_431719 ?auto_431722 ) ) ( not ( = ?auto_431719 ?auto_431723 ) ) ( not ( = ?auto_431720 ?auto_431721 ) ) ( not ( = ?auto_431720 ?auto_431722 ) ) ( not ( = ?auto_431720 ?auto_431723 ) ) ( not ( = ?auto_431721 ?auto_431722 ) ) ( not ( = ?auto_431721 ?auto_431723 ) ) ( not ( = ?auto_431722 ?auto_431723 ) ) ( ON ?auto_431721 ?auto_431722 ) ( ON ?auto_431720 ?auto_431721 ) ( ON ?auto_431719 ?auto_431720 ) ( ON ?auto_431718 ?auto_431719 ) ( ON ?auto_431717 ?auto_431718 ) ( ON ?auto_431716 ?auto_431717 ) ( ON ?auto_431715 ?auto_431716 ) ( ON ?auto_431714 ?auto_431715 ) ( CLEAR ?auto_431712 ) ( ON ?auto_431713 ?auto_431714 ) ( CLEAR ?auto_431713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_431710 ?auto_431711 ?auto_431712 ?auto_431713 )
      ( MAKE-13PILE ?auto_431710 ?auto_431711 ?auto_431712 ?auto_431713 ?auto_431714 ?auto_431715 ?auto_431716 ?auto_431717 ?auto_431718 ?auto_431719 ?auto_431720 ?auto_431721 ?auto_431722 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431737 - BLOCK
      ?auto_431738 - BLOCK
      ?auto_431739 - BLOCK
      ?auto_431740 - BLOCK
      ?auto_431741 - BLOCK
      ?auto_431742 - BLOCK
      ?auto_431743 - BLOCK
      ?auto_431744 - BLOCK
      ?auto_431745 - BLOCK
      ?auto_431746 - BLOCK
      ?auto_431747 - BLOCK
      ?auto_431748 - BLOCK
      ?auto_431749 - BLOCK
    )
    :vars
    (
      ?auto_431750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431749 ?auto_431750 ) ( ON-TABLE ?auto_431737 ) ( ON ?auto_431738 ?auto_431737 ) ( not ( = ?auto_431737 ?auto_431738 ) ) ( not ( = ?auto_431737 ?auto_431739 ) ) ( not ( = ?auto_431737 ?auto_431740 ) ) ( not ( = ?auto_431737 ?auto_431741 ) ) ( not ( = ?auto_431737 ?auto_431742 ) ) ( not ( = ?auto_431737 ?auto_431743 ) ) ( not ( = ?auto_431737 ?auto_431744 ) ) ( not ( = ?auto_431737 ?auto_431745 ) ) ( not ( = ?auto_431737 ?auto_431746 ) ) ( not ( = ?auto_431737 ?auto_431747 ) ) ( not ( = ?auto_431737 ?auto_431748 ) ) ( not ( = ?auto_431737 ?auto_431749 ) ) ( not ( = ?auto_431737 ?auto_431750 ) ) ( not ( = ?auto_431738 ?auto_431739 ) ) ( not ( = ?auto_431738 ?auto_431740 ) ) ( not ( = ?auto_431738 ?auto_431741 ) ) ( not ( = ?auto_431738 ?auto_431742 ) ) ( not ( = ?auto_431738 ?auto_431743 ) ) ( not ( = ?auto_431738 ?auto_431744 ) ) ( not ( = ?auto_431738 ?auto_431745 ) ) ( not ( = ?auto_431738 ?auto_431746 ) ) ( not ( = ?auto_431738 ?auto_431747 ) ) ( not ( = ?auto_431738 ?auto_431748 ) ) ( not ( = ?auto_431738 ?auto_431749 ) ) ( not ( = ?auto_431738 ?auto_431750 ) ) ( not ( = ?auto_431739 ?auto_431740 ) ) ( not ( = ?auto_431739 ?auto_431741 ) ) ( not ( = ?auto_431739 ?auto_431742 ) ) ( not ( = ?auto_431739 ?auto_431743 ) ) ( not ( = ?auto_431739 ?auto_431744 ) ) ( not ( = ?auto_431739 ?auto_431745 ) ) ( not ( = ?auto_431739 ?auto_431746 ) ) ( not ( = ?auto_431739 ?auto_431747 ) ) ( not ( = ?auto_431739 ?auto_431748 ) ) ( not ( = ?auto_431739 ?auto_431749 ) ) ( not ( = ?auto_431739 ?auto_431750 ) ) ( not ( = ?auto_431740 ?auto_431741 ) ) ( not ( = ?auto_431740 ?auto_431742 ) ) ( not ( = ?auto_431740 ?auto_431743 ) ) ( not ( = ?auto_431740 ?auto_431744 ) ) ( not ( = ?auto_431740 ?auto_431745 ) ) ( not ( = ?auto_431740 ?auto_431746 ) ) ( not ( = ?auto_431740 ?auto_431747 ) ) ( not ( = ?auto_431740 ?auto_431748 ) ) ( not ( = ?auto_431740 ?auto_431749 ) ) ( not ( = ?auto_431740 ?auto_431750 ) ) ( not ( = ?auto_431741 ?auto_431742 ) ) ( not ( = ?auto_431741 ?auto_431743 ) ) ( not ( = ?auto_431741 ?auto_431744 ) ) ( not ( = ?auto_431741 ?auto_431745 ) ) ( not ( = ?auto_431741 ?auto_431746 ) ) ( not ( = ?auto_431741 ?auto_431747 ) ) ( not ( = ?auto_431741 ?auto_431748 ) ) ( not ( = ?auto_431741 ?auto_431749 ) ) ( not ( = ?auto_431741 ?auto_431750 ) ) ( not ( = ?auto_431742 ?auto_431743 ) ) ( not ( = ?auto_431742 ?auto_431744 ) ) ( not ( = ?auto_431742 ?auto_431745 ) ) ( not ( = ?auto_431742 ?auto_431746 ) ) ( not ( = ?auto_431742 ?auto_431747 ) ) ( not ( = ?auto_431742 ?auto_431748 ) ) ( not ( = ?auto_431742 ?auto_431749 ) ) ( not ( = ?auto_431742 ?auto_431750 ) ) ( not ( = ?auto_431743 ?auto_431744 ) ) ( not ( = ?auto_431743 ?auto_431745 ) ) ( not ( = ?auto_431743 ?auto_431746 ) ) ( not ( = ?auto_431743 ?auto_431747 ) ) ( not ( = ?auto_431743 ?auto_431748 ) ) ( not ( = ?auto_431743 ?auto_431749 ) ) ( not ( = ?auto_431743 ?auto_431750 ) ) ( not ( = ?auto_431744 ?auto_431745 ) ) ( not ( = ?auto_431744 ?auto_431746 ) ) ( not ( = ?auto_431744 ?auto_431747 ) ) ( not ( = ?auto_431744 ?auto_431748 ) ) ( not ( = ?auto_431744 ?auto_431749 ) ) ( not ( = ?auto_431744 ?auto_431750 ) ) ( not ( = ?auto_431745 ?auto_431746 ) ) ( not ( = ?auto_431745 ?auto_431747 ) ) ( not ( = ?auto_431745 ?auto_431748 ) ) ( not ( = ?auto_431745 ?auto_431749 ) ) ( not ( = ?auto_431745 ?auto_431750 ) ) ( not ( = ?auto_431746 ?auto_431747 ) ) ( not ( = ?auto_431746 ?auto_431748 ) ) ( not ( = ?auto_431746 ?auto_431749 ) ) ( not ( = ?auto_431746 ?auto_431750 ) ) ( not ( = ?auto_431747 ?auto_431748 ) ) ( not ( = ?auto_431747 ?auto_431749 ) ) ( not ( = ?auto_431747 ?auto_431750 ) ) ( not ( = ?auto_431748 ?auto_431749 ) ) ( not ( = ?auto_431748 ?auto_431750 ) ) ( not ( = ?auto_431749 ?auto_431750 ) ) ( ON ?auto_431748 ?auto_431749 ) ( ON ?auto_431747 ?auto_431748 ) ( ON ?auto_431746 ?auto_431747 ) ( ON ?auto_431745 ?auto_431746 ) ( ON ?auto_431744 ?auto_431745 ) ( ON ?auto_431743 ?auto_431744 ) ( ON ?auto_431742 ?auto_431743 ) ( ON ?auto_431741 ?auto_431742 ) ( ON ?auto_431740 ?auto_431741 ) ( CLEAR ?auto_431738 ) ( ON ?auto_431739 ?auto_431740 ) ( CLEAR ?auto_431739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431737 ?auto_431738 ?auto_431739 )
      ( MAKE-13PILE ?auto_431737 ?auto_431738 ?auto_431739 ?auto_431740 ?auto_431741 ?auto_431742 ?auto_431743 ?auto_431744 ?auto_431745 ?auto_431746 ?auto_431747 ?auto_431748 ?auto_431749 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431764 - BLOCK
      ?auto_431765 - BLOCK
      ?auto_431766 - BLOCK
      ?auto_431767 - BLOCK
      ?auto_431768 - BLOCK
      ?auto_431769 - BLOCK
      ?auto_431770 - BLOCK
      ?auto_431771 - BLOCK
      ?auto_431772 - BLOCK
      ?auto_431773 - BLOCK
      ?auto_431774 - BLOCK
      ?auto_431775 - BLOCK
      ?auto_431776 - BLOCK
    )
    :vars
    (
      ?auto_431777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431776 ?auto_431777 ) ( ON-TABLE ?auto_431764 ) ( ON ?auto_431765 ?auto_431764 ) ( not ( = ?auto_431764 ?auto_431765 ) ) ( not ( = ?auto_431764 ?auto_431766 ) ) ( not ( = ?auto_431764 ?auto_431767 ) ) ( not ( = ?auto_431764 ?auto_431768 ) ) ( not ( = ?auto_431764 ?auto_431769 ) ) ( not ( = ?auto_431764 ?auto_431770 ) ) ( not ( = ?auto_431764 ?auto_431771 ) ) ( not ( = ?auto_431764 ?auto_431772 ) ) ( not ( = ?auto_431764 ?auto_431773 ) ) ( not ( = ?auto_431764 ?auto_431774 ) ) ( not ( = ?auto_431764 ?auto_431775 ) ) ( not ( = ?auto_431764 ?auto_431776 ) ) ( not ( = ?auto_431764 ?auto_431777 ) ) ( not ( = ?auto_431765 ?auto_431766 ) ) ( not ( = ?auto_431765 ?auto_431767 ) ) ( not ( = ?auto_431765 ?auto_431768 ) ) ( not ( = ?auto_431765 ?auto_431769 ) ) ( not ( = ?auto_431765 ?auto_431770 ) ) ( not ( = ?auto_431765 ?auto_431771 ) ) ( not ( = ?auto_431765 ?auto_431772 ) ) ( not ( = ?auto_431765 ?auto_431773 ) ) ( not ( = ?auto_431765 ?auto_431774 ) ) ( not ( = ?auto_431765 ?auto_431775 ) ) ( not ( = ?auto_431765 ?auto_431776 ) ) ( not ( = ?auto_431765 ?auto_431777 ) ) ( not ( = ?auto_431766 ?auto_431767 ) ) ( not ( = ?auto_431766 ?auto_431768 ) ) ( not ( = ?auto_431766 ?auto_431769 ) ) ( not ( = ?auto_431766 ?auto_431770 ) ) ( not ( = ?auto_431766 ?auto_431771 ) ) ( not ( = ?auto_431766 ?auto_431772 ) ) ( not ( = ?auto_431766 ?auto_431773 ) ) ( not ( = ?auto_431766 ?auto_431774 ) ) ( not ( = ?auto_431766 ?auto_431775 ) ) ( not ( = ?auto_431766 ?auto_431776 ) ) ( not ( = ?auto_431766 ?auto_431777 ) ) ( not ( = ?auto_431767 ?auto_431768 ) ) ( not ( = ?auto_431767 ?auto_431769 ) ) ( not ( = ?auto_431767 ?auto_431770 ) ) ( not ( = ?auto_431767 ?auto_431771 ) ) ( not ( = ?auto_431767 ?auto_431772 ) ) ( not ( = ?auto_431767 ?auto_431773 ) ) ( not ( = ?auto_431767 ?auto_431774 ) ) ( not ( = ?auto_431767 ?auto_431775 ) ) ( not ( = ?auto_431767 ?auto_431776 ) ) ( not ( = ?auto_431767 ?auto_431777 ) ) ( not ( = ?auto_431768 ?auto_431769 ) ) ( not ( = ?auto_431768 ?auto_431770 ) ) ( not ( = ?auto_431768 ?auto_431771 ) ) ( not ( = ?auto_431768 ?auto_431772 ) ) ( not ( = ?auto_431768 ?auto_431773 ) ) ( not ( = ?auto_431768 ?auto_431774 ) ) ( not ( = ?auto_431768 ?auto_431775 ) ) ( not ( = ?auto_431768 ?auto_431776 ) ) ( not ( = ?auto_431768 ?auto_431777 ) ) ( not ( = ?auto_431769 ?auto_431770 ) ) ( not ( = ?auto_431769 ?auto_431771 ) ) ( not ( = ?auto_431769 ?auto_431772 ) ) ( not ( = ?auto_431769 ?auto_431773 ) ) ( not ( = ?auto_431769 ?auto_431774 ) ) ( not ( = ?auto_431769 ?auto_431775 ) ) ( not ( = ?auto_431769 ?auto_431776 ) ) ( not ( = ?auto_431769 ?auto_431777 ) ) ( not ( = ?auto_431770 ?auto_431771 ) ) ( not ( = ?auto_431770 ?auto_431772 ) ) ( not ( = ?auto_431770 ?auto_431773 ) ) ( not ( = ?auto_431770 ?auto_431774 ) ) ( not ( = ?auto_431770 ?auto_431775 ) ) ( not ( = ?auto_431770 ?auto_431776 ) ) ( not ( = ?auto_431770 ?auto_431777 ) ) ( not ( = ?auto_431771 ?auto_431772 ) ) ( not ( = ?auto_431771 ?auto_431773 ) ) ( not ( = ?auto_431771 ?auto_431774 ) ) ( not ( = ?auto_431771 ?auto_431775 ) ) ( not ( = ?auto_431771 ?auto_431776 ) ) ( not ( = ?auto_431771 ?auto_431777 ) ) ( not ( = ?auto_431772 ?auto_431773 ) ) ( not ( = ?auto_431772 ?auto_431774 ) ) ( not ( = ?auto_431772 ?auto_431775 ) ) ( not ( = ?auto_431772 ?auto_431776 ) ) ( not ( = ?auto_431772 ?auto_431777 ) ) ( not ( = ?auto_431773 ?auto_431774 ) ) ( not ( = ?auto_431773 ?auto_431775 ) ) ( not ( = ?auto_431773 ?auto_431776 ) ) ( not ( = ?auto_431773 ?auto_431777 ) ) ( not ( = ?auto_431774 ?auto_431775 ) ) ( not ( = ?auto_431774 ?auto_431776 ) ) ( not ( = ?auto_431774 ?auto_431777 ) ) ( not ( = ?auto_431775 ?auto_431776 ) ) ( not ( = ?auto_431775 ?auto_431777 ) ) ( not ( = ?auto_431776 ?auto_431777 ) ) ( ON ?auto_431775 ?auto_431776 ) ( ON ?auto_431774 ?auto_431775 ) ( ON ?auto_431773 ?auto_431774 ) ( ON ?auto_431772 ?auto_431773 ) ( ON ?auto_431771 ?auto_431772 ) ( ON ?auto_431770 ?auto_431771 ) ( ON ?auto_431769 ?auto_431770 ) ( ON ?auto_431768 ?auto_431769 ) ( ON ?auto_431767 ?auto_431768 ) ( CLEAR ?auto_431765 ) ( ON ?auto_431766 ?auto_431767 ) ( CLEAR ?auto_431766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431764 ?auto_431765 ?auto_431766 )
      ( MAKE-13PILE ?auto_431764 ?auto_431765 ?auto_431766 ?auto_431767 ?auto_431768 ?auto_431769 ?auto_431770 ?auto_431771 ?auto_431772 ?auto_431773 ?auto_431774 ?auto_431775 ?auto_431776 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431791 - BLOCK
      ?auto_431792 - BLOCK
      ?auto_431793 - BLOCK
      ?auto_431794 - BLOCK
      ?auto_431795 - BLOCK
      ?auto_431796 - BLOCK
      ?auto_431797 - BLOCK
      ?auto_431798 - BLOCK
      ?auto_431799 - BLOCK
      ?auto_431800 - BLOCK
      ?auto_431801 - BLOCK
      ?auto_431802 - BLOCK
      ?auto_431803 - BLOCK
    )
    :vars
    (
      ?auto_431804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431803 ?auto_431804 ) ( ON-TABLE ?auto_431791 ) ( not ( = ?auto_431791 ?auto_431792 ) ) ( not ( = ?auto_431791 ?auto_431793 ) ) ( not ( = ?auto_431791 ?auto_431794 ) ) ( not ( = ?auto_431791 ?auto_431795 ) ) ( not ( = ?auto_431791 ?auto_431796 ) ) ( not ( = ?auto_431791 ?auto_431797 ) ) ( not ( = ?auto_431791 ?auto_431798 ) ) ( not ( = ?auto_431791 ?auto_431799 ) ) ( not ( = ?auto_431791 ?auto_431800 ) ) ( not ( = ?auto_431791 ?auto_431801 ) ) ( not ( = ?auto_431791 ?auto_431802 ) ) ( not ( = ?auto_431791 ?auto_431803 ) ) ( not ( = ?auto_431791 ?auto_431804 ) ) ( not ( = ?auto_431792 ?auto_431793 ) ) ( not ( = ?auto_431792 ?auto_431794 ) ) ( not ( = ?auto_431792 ?auto_431795 ) ) ( not ( = ?auto_431792 ?auto_431796 ) ) ( not ( = ?auto_431792 ?auto_431797 ) ) ( not ( = ?auto_431792 ?auto_431798 ) ) ( not ( = ?auto_431792 ?auto_431799 ) ) ( not ( = ?auto_431792 ?auto_431800 ) ) ( not ( = ?auto_431792 ?auto_431801 ) ) ( not ( = ?auto_431792 ?auto_431802 ) ) ( not ( = ?auto_431792 ?auto_431803 ) ) ( not ( = ?auto_431792 ?auto_431804 ) ) ( not ( = ?auto_431793 ?auto_431794 ) ) ( not ( = ?auto_431793 ?auto_431795 ) ) ( not ( = ?auto_431793 ?auto_431796 ) ) ( not ( = ?auto_431793 ?auto_431797 ) ) ( not ( = ?auto_431793 ?auto_431798 ) ) ( not ( = ?auto_431793 ?auto_431799 ) ) ( not ( = ?auto_431793 ?auto_431800 ) ) ( not ( = ?auto_431793 ?auto_431801 ) ) ( not ( = ?auto_431793 ?auto_431802 ) ) ( not ( = ?auto_431793 ?auto_431803 ) ) ( not ( = ?auto_431793 ?auto_431804 ) ) ( not ( = ?auto_431794 ?auto_431795 ) ) ( not ( = ?auto_431794 ?auto_431796 ) ) ( not ( = ?auto_431794 ?auto_431797 ) ) ( not ( = ?auto_431794 ?auto_431798 ) ) ( not ( = ?auto_431794 ?auto_431799 ) ) ( not ( = ?auto_431794 ?auto_431800 ) ) ( not ( = ?auto_431794 ?auto_431801 ) ) ( not ( = ?auto_431794 ?auto_431802 ) ) ( not ( = ?auto_431794 ?auto_431803 ) ) ( not ( = ?auto_431794 ?auto_431804 ) ) ( not ( = ?auto_431795 ?auto_431796 ) ) ( not ( = ?auto_431795 ?auto_431797 ) ) ( not ( = ?auto_431795 ?auto_431798 ) ) ( not ( = ?auto_431795 ?auto_431799 ) ) ( not ( = ?auto_431795 ?auto_431800 ) ) ( not ( = ?auto_431795 ?auto_431801 ) ) ( not ( = ?auto_431795 ?auto_431802 ) ) ( not ( = ?auto_431795 ?auto_431803 ) ) ( not ( = ?auto_431795 ?auto_431804 ) ) ( not ( = ?auto_431796 ?auto_431797 ) ) ( not ( = ?auto_431796 ?auto_431798 ) ) ( not ( = ?auto_431796 ?auto_431799 ) ) ( not ( = ?auto_431796 ?auto_431800 ) ) ( not ( = ?auto_431796 ?auto_431801 ) ) ( not ( = ?auto_431796 ?auto_431802 ) ) ( not ( = ?auto_431796 ?auto_431803 ) ) ( not ( = ?auto_431796 ?auto_431804 ) ) ( not ( = ?auto_431797 ?auto_431798 ) ) ( not ( = ?auto_431797 ?auto_431799 ) ) ( not ( = ?auto_431797 ?auto_431800 ) ) ( not ( = ?auto_431797 ?auto_431801 ) ) ( not ( = ?auto_431797 ?auto_431802 ) ) ( not ( = ?auto_431797 ?auto_431803 ) ) ( not ( = ?auto_431797 ?auto_431804 ) ) ( not ( = ?auto_431798 ?auto_431799 ) ) ( not ( = ?auto_431798 ?auto_431800 ) ) ( not ( = ?auto_431798 ?auto_431801 ) ) ( not ( = ?auto_431798 ?auto_431802 ) ) ( not ( = ?auto_431798 ?auto_431803 ) ) ( not ( = ?auto_431798 ?auto_431804 ) ) ( not ( = ?auto_431799 ?auto_431800 ) ) ( not ( = ?auto_431799 ?auto_431801 ) ) ( not ( = ?auto_431799 ?auto_431802 ) ) ( not ( = ?auto_431799 ?auto_431803 ) ) ( not ( = ?auto_431799 ?auto_431804 ) ) ( not ( = ?auto_431800 ?auto_431801 ) ) ( not ( = ?auto_431800 ?auto_431802 ) ) ( not ( = ?auto_431800 ?auto_431803 ) ) ( not ( = ?auto_431800 ?auto_431804 ) ) ( not ( = ?auto_431801 ?auto_431802 ) ) ( not ( = ?auto_431801 ?auto_431803 ) ) ( not ( = ?auto_431801 ?auto_431804 ) ) ( not ( = ?auto_431802 ?auto_431803 ) ) ( not ( = ?auto_431802 ?auto_431804 ) ) ( not ( = ?auto_431803 ?auto_431804 ) ) ( ON ?auto_431802 ?auto_431803 ) ( ON ?auto_431801 ?auto_431802 ) ( ON ?auto_431800 ?auto_431801 ) ( ON ?auto_431799 ?auto_431800 ) ( ON ?auto_431798 ?auto_431799 ) ( ON ?auto_431797 ?auto_431798 ) ( ON ?auto_431796 ?auto_431797 ) ( ON ?auto_431795 ?auto_431796 ) ( ON ?auto_431794 ?auto_431795 ) ( ON ?auto_431793 ?auto_431794 ) ( CLEAR ?auto_431791 ) ( ON ?auto_431792 ?auto_431793 ) ( CLEAR ?auto_431792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431791 ?auto_431792 )
      ( MAKE-13PILE ?auto_431791 ?auto_431792 ?auto_431793 ?auto_431794 ?auto_431795 ?auto_431796 ?auto_431797 ?auto_431798 ?auto_431799 ?auto_431800 ?auto_431801 ?auto_431802 ?auto_431803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431818 - BLOCK
      ?auto_431819 - BLOCK
      ?auto_431820 - BLOCK
      ?auto_431821 - BLOCK
      ?auto_431822 - BLOCK
      ?auto_431823 - BLOCK
      ?auto_431824 - BLOCK
      ?auto_431825 - BLOCK
      ?auto_431826 - BLOCK
      ?auto_431827 - BLOCK
      ?auto_431828 - BLOCK
      ?auto_431829 - BLOCK
      ?auto_431830 - BLOCK
    )
    :vars
    (
      ?auto_431831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431830 ?auto_431831 ) ( ON-TABLE ?auto_431818 ) ( not ( = ?auto_431818 ?auto_431819 ) ) ( not ( = ?auto_431818 ?auto_431820 ) ) ( not ( = ?auto_431818 ?auto_431821 ) ) ( not ( = ?auto_431818 ?auto_431822 ) ) ( not ( = ?auto_431818 ?auto_431823 ) ) ( not ( = ?auto_431818 ?auto_431824 ) ) ( not ( = ?auto_431818 ?auto_431825 ) ) ( not ( = ?auto_431818 ?auto_431826 ) ) ( not ( = ?auto_431818 ?auto_431827 ) ) ( not ( = ?auto_431818 ?auto_431828 ) ) ( not ( = ?auto_431818 ?auto_431829 ) ) ( not ( = ?auto_431818 ?auto_431830 ) ) ( not ( = ?auto_431818 ?auto_431831 ) ) ( not ( = ?auto_431819 ?auto_431820 ) ) ( not ( = ?auto_431819 ?auto_431821 ) ) ( not ( = ?auto_431819 ?auto_431822 ) ) ( not ( = ?auto_431819 ?auto_431823 ) ) ( not ( = ?auto_431819 ?auto_431824 ) ) ( not ( = ?auto_431819 ?auto_431825 ) ) ( not ( = ?auto_431819 ?auto_431826 ) ) ( not ( = ?auto_431819 ?auto_431827 ) ) ( not ( = ?auto_431819 ?auto_431828 ) ) ( not ( = ?auto_431819 ?auto_431829 ) ) ( not ( = ?auto_431819 ?auto_431830 ) ) ( not ( = ?auto_431819 ?auto_431831 ) ) ( not ( = ?auto_431820 ?auto_431821 ) ) ( not ( = ?auto_431820 ?auto_431822 ) ) ( not ( = ?auto_431820 ?auto_431823 ) ) ( not ( = ?auto_431820 ?auto_431824 ) ) ( not ( = ?auto_431820 ?auto_431825 ) ) ( not ( = ?auto_431820 ?auto_431826 ) ) ( not ( = ?auto_431820 ?auto_431827 ) ) ( not ( = ?auto_431820 ?auto_431828 ) ) ( not ( = ?auto_431820 ?auto_431829 ) ) ( not ( = ?auto_431820 ?auto_431830 ) ) ( not ( = ?auto_431820 ?auto_431831 ) ) ( not ( = ?auto_431821 ?auto_431822 ) ) ( not ( = ?auto_431821 ?auto_431823 ) ) ( not ( = ?auto_431821 ?auto_431824 ) ) ( not ( = ?auto_431821 ?auto_431825 ) ) ( not ( = ?auto_431821 ?auto_431826 ) ) ( not ( = ?auto_431821 ?auto_431827 ) ) ( not ( = ?auto_431821 ?auto_431828 ) ) ( not ( = ?auto_431821 ?auto_431829 ) ) ( not ( = ?auto_431821 ?auto_431830 ) ) ( not ( = ?auto_431821 ?auto_431831 ) ) ( not ( = ?auto_431822 ?auto_431823 ) ) ( not ( = ?auto_431822 ?auto_431824 ) ) ( not ( = ?auto_431822 ?auto_431825 ) ) ( not ( = ?auto_431822 ?auto_431826 ) ) ( not ( = ?auto_431822 ?auto_431827 ) ) ( not ( = ?auto_431822 ?auto_431828 ) ) ( not ( = ?auto_431822 ?auto_431829 ) ) ( not ( = ?auto_431822 ?auto_431830 ) ) ( not ( = ?auto_431822 ?auto_431831 ) ) ( not ( = ?auto_431823 ?auto_431824 ) ) ( not ( = ?auto_431823 ?auto_431825 ) ) ( not ( = ?auto_431823 ?auto_431826 ) ) ( not ( = ?auto_431823 ?auto_431827 ) ) ( not ( = ?auto_431823 ?auto_431828 ) ) ( not ( = ?auto_431823 ?auto_431829 ) ) ( not ( = ?auto_431823 ?auto_431830 ) ) ( not ( = ?auto_431823 ?auto_431831 ) ) ( not ( = ?auto_431824 ?auto_431825 ) ) ( not ( = ?auto_431824 ?auto_431826 ) ) ( not ( = ?auto_431824 ?auto_431827 ) ) ( not ( = ?auto_431824 ?auto_431828 ) ) ( not ( = ?auto_431824 ?auto_431829 ) ) ( not ( = ?auto_431824 ?auto_431830 ) ) ( not ( = ?auto_431824 ?auto_431831 ) ) ( not ( = ?auto_431825 ?auto_431826 ) ) ( not ( = ?auto_431825 ?auto_431827 ) ) ( not ( = ?auto_431825 ?auto_431828 ) ) ( not ( = ?auto_431825 ?auto_431829 ) ) ( not ( = ?auto_431825 ?auto_431830 ) ) ( not ( = ?auto_431825 ?auto_431831 ) ) ( not ( = ?auto_431826 ?auto_431827 ) ) ( not ( = ?auto_431826 ?auto_431828 ) ) ( not ( = ?auto_431826 ?auto_431829 ) ) ( not ( = ?auto_431826 ?auto_431830 ) ) ( not ( = ?auto_431826 ?auto_431831 ) ) ( not ( = ?auto_431827 ?auto_431828 ) ) ( not ( = ?auto_431827 ?auto_431829 ) ) ( not ( = ?auto_431827 ?auto_431830 ) ) ( not ( = ?auto_431827 ?auto_431831 ) ) ( not ( = ?auto_431828 ?auto_431829 ) ) ( not ( = ?auto_431828 ?auto_431830 ) ) ( not ( = ?auto_431828 ?auto_431831 ) ) ( not ( = ?auto_431829 ?auto_431830 ) ) ( not ( = ?auto_431829 ?auto_431831 ) ) ( not ( = ?auto_431830 ?auto_431831 ) ) ( ON ?auto_431829 ?auto_431830 ) ( ON ?auto_431828 ?auto_431829 ) ( ON ?auto_431827 ?auto_431828 ) ( ON ?auto_431826 ?auto_431827 ) ( ON ?auto_431825 ?auto_431826 ) ( ON ?auto_431824 ?auto_431825 ) ( ON ?auto_431823 ?auto_431824 ) ( ON ?auto_431822 ?auto_431823 ) ( ON ?auto_431821 ?auto_431822 ) ( ON ?auto_431820 ?auto_431821 ) ( CLEAR ?auto_431818 ) ( ON ?auto_431819 ?auto_431820 ) ( CLEAR ?auto_431819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431818 ?auto_431819 )
      ( MAKE-13PILE ?auto_431818 ?auto_431819 ?auto_431820 ?auto_431821 ?auto_431822 ?auto_431823 ?auto_431824 ?auto_431825 ?auto_431826 ?auto_431827 ?auto_431828 ?auto_431829 ?auto_431830 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431845 - BLOCK
      ?auto_431846 - BLOCK
      ?auto_431847 - BLOCK
      ?auto_431848 - BLOCK
      ?auto_431849 - BLOCK
      ?auto_431850 - BLOCK
      ?auto_431851 - BLOCK
      ?auto_431852 - BLOCK
      ?auto_431853 - BLOCK
      ?auto_431854 - BLOCK
      ?auto_431855 - BLOCK
      ?auto_431856 - BLOCK
      ?auto_431857 - BLOCK
    )
    :vars
    (
      ?auto_431858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431857 ?auto_431858 ) ( not ( = ?auto_431845 ?auto_431846 ) ) ( not ( = ?auto_431845 ?auto_431847 ) ) ( not ( = ?auto_431845 ?auto_431848 ) ) ( not ( = ?auto_431845 ?auto_431849 ) ) ( not ( = ?auto_431845 ?auto_431850 ) ) ( not ( = ?auto_431845 ?auto_431851 ) ) ( not ( = ?auto_431845 ?auto_431852 ) ) ( not ( = ?auto_431845 ?auto_431853 ) ) ( not ( = ?auto_431845 ?auto_431854 ) ) ( not ( = ?auto_431845 ?auto_431855 ) ) ( not ( = ?auto_431845 ?auto_431856 ) ) ( not ( = ?auto_431845 ?auto_431857 ) ) ( not ( = ?auto_431845 ?auto_431858 ) ) ( not ( = ?auto_431846 ?auto_431847 ) ) ( not ( = ?auto_431846 ?auto_431848 ) ) ( not ( = ?auto_431846 ?auto_431849 ) ) ( not ( = ?auto_431846 ?auto_431850 ) ) ( not ( = ?auto_431846 ?auto_431851 ) ) ( not ( = ?auto_431846 ?auto_431852 ) ) ( not ( = ?auto_431846 ?auto_431853 ) ) ( not ( = ?auto_431846 ?auto_431854 ) ) ( not ( = ?auto_431846 ?auto_431855 ) ) ( not ( = ?auto_431846 ?auto_431856 ) ) ( not ( = ?auto_431846 ?auto_431857 ) ) ( not ( = ?auto_431846 ?auto_431858 ) ) ( not ( = ?auto_431847 ?auto_431848 ) ) ( not ( = ?auto_431847 ?auto_431849 ) ) ( not ( = ?auto_431847 ?auto_431850 ) ) ( not ( = ?auto_431847 ?auto_431851 ) ) ( not ( = ?auto_431847 ?auto_431852 ) ) ( not ( = ?auto_431847 ?auto_431853 ) ) ( not ( = ?auto_431847 ?auto_431854 ) ) ( not ( = ?auto_431847 ?auto_431855 ) ) ( not ( = ?auto_431847 ?auto_431856 ) ) ( not ( = ?auto_431847 ?auto_431857 ) ) ( not ( = ?auto_431847 ?auto_431858 ) ) ( not ( = ?auto_431848 ?auto_431849 ) ) ( not ( = ?auto_431848 ?auto_431850 ) ) ( not ( = ?auto_431848 ?auto_431851 ) ) ( not ( = ?auto_431848 ?auto_431852 ) ) ( not ( = ?auto_431848 ?auto_431853 ) ) ( not ( = ?auto_431848 ?auto_431854 ) ) ( not ( = ?auto_431848 ?auto_431855 ) ) ( not ( = ?auto_431848 ?auto_431856 ) ) ( not ( = ?auto_431848 ?auto_431857 ) ) ( not ( = ?auto_431848 ?auto_431858 ) ) ( not ( = ?auto_431849 ?auto_431850 ) ) ( not ( = ?auto_431849 ?auto_431851 ) ) ( not ( = ?auto_431849 ?auto_431852 ) ) ( not ( = ?auto_431849 ?auto_431853 ) ) ( not ( = ?auto_431849 ?auto_431854 ) ) ( not ( = ?auto_431849 ?auto_431855 ) ) ( not ( = ?auto_431849 ?auto_431856 ) ) ( not ( = ?auto_431849 ?auto_431857 ) ) ( not ( = ?auto_431849 ?auto_431858 ) ) ( not ( = ?auto_431850 ?auto_431851 ) ) ( not ( = ?auto_431850 ?auto_431852 ) ) ( not ( = ?auto_431850 ?auto_431853 ) ) ( not ( = ?auto_431850 ?auto_431854 ) ) ( not ( = ?auto_431850 ?auto_431855 ) ) ( not ( = ?auto_431850 ?auto_431856 ) ) ( not ( = ?auto_431850 ?auto_431857 ) ) ( not ( = ?auto_431850 ?auto_431858 ) ) ( not ( = ?auto_431851 ?auto_431852 ) ) ( not ( = ?auto_431851 ?auto_431853 ) ) ( not ( = ?auto_431851 ?auto_431854 ) ) ( not ( = ?auto_431851 ?auto_431855 ) ) ( not ( = ?auto_431851 ?auto_431856 ) ) ( not ( = ?auto_431851 ?auto_431857 ) ) ( not ( = ?auto_431851 ?auto_431858 ) ) ( not ( = ?auto_431852 ?auto_431853 ) ) ( not ( = ?auto_431852 ?auto_431854 ) ) ( not ( = ?auto_431852 ?auto_431855 ) ) ( not ( = ?auto_431852 ?auto_431856 ) ) ( not ( = ?auto_431852 ?auto_431857 ) ) ( not ( = ?auto_431852 ?auto_431858 ) ) ( not ( = ?auto_431853 ?auto_431854 ) ) ( not ( = ?auto_431853 ?auto_431855 ) ) ( not ( = ?auto_431853 ?auto_431856 ) ) ( not ( = ?auto_431853 ?auto_431857 ) ) ( not ( = ?auto_431853 ?auto_431858 ) ) ( not ( = ?auto_431854 ?auto_431855 ) ) ( not ( = ?auto_431854 ?auto_431856 ) ) ( not ( = ?auto_431854 ?auto_431857 ) ) ( not ( = ?auto_431854 ?auto_431858 ) ) ( not ( = ?auto_431855 ?auto_431856 ) ) ( not ( = ?auto_431855 ?auto_431857 ) ) ( not ( = ?auto_431855 ?auto_431858 ) ) ( not ( = ?auto_431856 ?auto_431857 ) ) ( not ( = ?auto_431856 ?auto_431858 ) ) ( not ( = ?auto_431857 ?auto_431858 ) ) ( ON ?auto_431856 ?auto_431857 ) ( ON ?auto_431855 ?auto_431856 ) ( ON ?auto_431854 ?auto_431855 ) ( ON ?auto_431853 ?auto_431854 ) ( ON ?auto_431852 ?auto_431853 ) ( ON ?auto_431851 ?auto_431852 ) ( ON ?auto_431850 ?auto_431851 ) ( ON ?auto_431849 ?auto_431850 ) ( ON ?auto_431848 ?auto_431849 ) ( ON ?auto_431847 ?auto_431848 ) ( ON ?auto_431846 ?auto_431847 ) ( ON ?auto_431845 ?auto_431846 ) ( CLEAR ?auto_431845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431845 )
      ( MAKE-13PILE ?auto_431845 ?auto_431846 ?auto_431847 ?auto_431848 ?auto_431849 ?auto_431850 ?auto_431851 ?auto_431852 ?auto_431853 ?auto_431854 ?auto_431855 ?auto_431856 ?auto_431857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431872 - BLOCK
      ?auto_431873 - BLOCK
      ?auto_431874 - BLOCK
      ?auto_431875 - BLOCK
      ?auto_431876 - BLOCK
      ?auto_431877 - BLOCK
      ?auto_431878 - BLOCK
      ?auto_431879 - BLOCK
      ?auto_431880 - BLOCK
      ?auto_431881 - BLOCK
      ?auto_431882 - BLOCK
      ?auto_431883 - BLOCK
      ?auto_431884 - BLOCK
    )
    :vars
    (
      ?auto_431885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431884 ?auto_431885 ) ( not ( = ?auto_431872 ?auto_431873 ) ) ( not ( = ?auto_431872 ?auto_431874 ) ) ( not ( = ?auto_431872 ?auto_431875 ) ) ( not ( = ?auto_431872 ?auto_431876 ) ) ( not ( = ?auto_431872 ?auto_431877 ) ) ( not ( = ?auto_431872 ?auto_431878 ) ) ( not ( = ?auto_431872 ?auto_431879 ) ) ( not ( = ?auto_431872 ?auto_431880 ) ) ( not ( = ?auto_431872 ?auto_431881 ) ) ( not ( = ?auto_431872 ?auto_431882 ) ) ( not ( = ?auto_431872 ?auto_431883 ) ) ( not ( = ?auto_431872 ?auto_431884 ) ) ( not ( = ?auto_431872 ?auto_431885 ) ) ( not ( = ?auto_431873 ?auto_431874 ) ) ( not ( = ?auto_431873 ?auto_431875 ) ) ( not ( = ?auto_431873 ?auto_431876 ) ) ( not ( = ?auto_431873 ?auto_431877 ) ) ( not ( = ?auto_431873 ?auto_431878 ) ) ( not ( = ?auto_431873 ?auto_431879 ) ) ( not ( = ?auto_431873 ?auto_431880 ) ) ( not ( = ?auto_431873 ?auto_431881 ) ) ( not ( = ?auto_431873 ?auto_431882 ) ) ( not ( = ?auto_431873 ?auto_431883 ) ) ( not ( = ?auto_431873 ?auto_431884 ) ) ( not ( = ?auto_431873 ?auto_431885 ) ) ( not ( = ?auto_431874 ?auto_431875 ) ) ( not ( = ?auto_431874 ?auto_431876 ) ) ( not ( = ?auto_431874 ?auto_431877 ) ) ( not ( = ?auto_431874 ?auto_431878 ) ) ( not ( = ?auto_431874 ?auto_431879 ) ) ( not ( = ?auto_431874 ?auto_431880 ) ) ( not ( = ?auto_431874 ?auto_431881 ) ) ( not ( = ?auto_431874 ?auto_431882 ) ) ( not ( = ?auto_431874 ?auto_431883 ) ) ( not ( = ?auto_431874 ?auto_431884 ) ) ( not ( = ?auto_431874 ?auto_431885 ) ) ( not ( = ?auto_431875 ?auto_431876 ) ) ( not ( = ?auto_431875 ?auto_431877 ) ) ( not ( = ?auto_431875 ?auto_431878 ) ) ( not ( = ?auto_431875 ?auto_431879 ) ) ( not ( = ?auto_431875 ?auto_431880 ) ) ( not ( = ?auto_431875 ?auto_431881 ) ) ( not ( = ?auto_431875 ?auto_431882 ) ) ( not ( = ?auto_431875 ?auto_431883 ) ) ( not ( = ?auto_431875 ?auto_431884 ) ) ( not ( = ?auto_431875 ?auto_431885 ) ) ( not ( = ?auto_431876 ?auto_431877 ) ) ( not ( = ?auto_431876 ?auto_431878 ) ) ( not ( = ?auto_431876 ?auto_431879 ) ) ( not ( = ?auto_431876 ?auto_431880 ) ) ( not ( = ?auto_431876 ?auto_431881 ) ) ( not ( = ?auto_431876 ?auto_431882 ) ) ( not ( = ?auto_431876 ?auto_431883 ) ) ( not ( = ?auto_431876 ?auto_431884 ) ) ( not ( = ?auto_431876 ?auto_431885 ) ) ( not ( = ?auto_431877 ?auto_431878 ) ) ( not ( = ?auto_431877 ?auto_431879 ) ) ( not ( = ?auto_431877 ?auto_431880 ) ) ( not ( = ?auto_431877 ?auto_431881 ) ) ( not ( = ?auto_431877 ?auto_431882 ) ) ( not ( = ?auto_431877 ?auto_431883 ) ) ( not ( = ?auto_431877 ?auto_431884 ) ) ( not ( = ?auto_431877 ?auto_431885 ) ) ( not ( = ?auto_431878 ?auto_431879 ) ) ( not ( = ?auto_431878 ?auto_431880 ) ) ( not ( = ?auto_431878 ?auto_431881 ) ) ( not ( = ?auto_431878 ?auto_431882 ) ) ( not ( = ?auto_431878 ?auto_431883 ) ) ( not ( = ?auto_431878 ?auto_431884 ) ) ( not ( = ?auto_431878 ?auto_431885 ) ) ( not ( = ?auto_431879 ?auto_431880 ) ) ( not ( = ?auto_431879 ?auto_431881 ) ) ( not ( = ?auto_431879 ?auto_431882 ) ) ( not ( = ?auto_431879 ?auto_431883 ) ) ( not ( = ?auto_431879 ?auto_431884 ) ) ( not ( = ?auto_431879 ?auto_431885 ) ) ( not ( = ?auto_431880 ?auto_431881 ) ) ( not ( = ?auto_431880 ?auto_431882 ) ) ( not ( = ?auto_431880 ?auto_431883 ) ) ( not ( = ?auto_431880 ?auto_431884 ) ) ( not ( = ?auto_431880 ?auto_431885 ) ) ( not ( = ?auto_431881 ?auto_431882 ) ) ( not ( = ?auto_431881 ?auto_431883 ) ) ( not ( = ?auto_431881 ?auto_431884 ) ) ( not ( = ?auto_431881 ?auto_431885 ) ) ( not ( = ?auto_431882 ?auto_431883 ) ) ( not ( = ?auto_431882 ?auto_431884 ) ) ( not ( = ?auto_431882 ?auto_431885 ) ) ( not ( = ?auto_431883 ?auto_431884 ) ) ( not ( = ?auto_431883 ?auto_431885 ) ) ( not ( = ?auto_431884 ?auto_431885 ) ) ( ON ?auto_431883 ?auto_431884 ) ( ON ?auto_431882 ?auto_431883 ) ( ON ?auto_431881 ?auto_431882 ) ( ON ?auto_431880 ?auto_431881 ) ( ON ?auto_431879 ?auto_431880 ) ( ON ?auto_431878 ?auto_431879 ) ( ON ?auto_431877 ?auto_431878 ) ( ON ?auto_431876 ?auto_431877 ) ( ON ?auto_431875 ?auto_431876 ) ( ON ?auto_431874 ?auto_431875 ) ( ON ?auto_431873 ?auto_431874 ) ( ON ?auto_431872 ?auto_431873 ) ( CLEAR ?auto_431872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431872 )
      ( MAKE-13PILE ?auto_431872 ?auto_431873 ?auto_431874 ?auto_431875 ?auto_431876 ?auto_431877 ?auto_431878 ?auto_431879 ?auto_431880 ?auto_431881 ?auto_431882 ?auto_431883 ?auto_431884 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431900 - BLOCK
      ?auto_431901 - BLOCK
      ?auto_431902 - BLOCK
      ?auto_431903 - BLOCK
      ?auto_431904 - BLOCK
      ?auto_431905 - BLOCK
      ?auto_431906 - BLOCK
      ?auto_431907 - BLOCK
      ?auto_431908 - BLOCK
      ?auto_431909 - BLOCK
      ?auto_431910 - BLOCK
      ?auto_431911 - BLOCK
      ?auto_431912 - BLOCK
      ?auto_431913 - BLOCK
    )
    :vars
    (
      ?auto_431914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431912 ) ( ON ?auto_431913 ?auto_431914 ) ( CLEAR ?auto_431913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431900 ) ( ON ?auto_431901 ?auto_431900 ) ( ON ?auto_431902 ?auto_431901 ) ( ON ?auto_431903 ?auto_431902 ) ( ON ?auto_431904 ?auto_431903 ) ( ON ?auto_431905 ?auto_431904 ) ( ON ?auto_431906 ?auto_431905 ) ( ON ?auto_431907 ?auto_431906 ) ( ON ?auto_431908 ?auto_431907 ) ( ON ?auto_431909 ?auto_431908 ) ( ON ?auto_431910 ?auto_431909 ) ( ON ?auto_431911 ?auto_431910 ) ( ON ?auto_431912 ?auto_431911 ) ( not ( = ?auto_431900 ?auto_431901 ) ) ( not ( = ?auto_431900 ?auto_431902 ) ) ( not ( = ?auto_431900 ?auto_431903 ) ) ( not ( = ?auto_431900 ?auto_431904 ) ) ( not ( = ?auto_431900 ?auto_431905 ) ) ( not ( = ?auto_431900 ?auto_431906 ) ) ( not ( = ?auto_431900 ?auto_431907 ) ) ( not ( = ?auto_431900 ?auto_431908 ) ) ( not ( = ?auto_431900 ?auto_431909 ) ) ( not ( = ?auto_431900 ?auto_431910 ) ) ( not ( = ?auto_431900 ?auto_431911 ) ) ( not ( = ?auto_431900 ?auto_431912 ) ) ( not ( = ?auto_431900 ?auto_431913 ) ) ( not ( = ?auto_431900 ?auto_431914 ) ) ( not ( = ?auto_431901 ?auto_431902 ) ) ( not ( = ?auto_431901 ?auto_431903 ) ) ( not ( = ?auto_431901 ?auto_431904 ) ) ( not ( = ?auto_431901 ?auto_431905 ) ) ( not ( = ?auto_431901 ?auto_431906 ) ) ( not ( = ?auto_431901 ?auto_431907 ) ) ( not ( = ?auto_431901 ?auto_431908 ) ) ( not ( = ?auto_431901 ?auto_431909 ) ) ( not ( = ?auto_431901 ?auto_431910 ) ) ( not ( = ?auto_431901 ?auto_431911 ) ) ( not ( = ?auto_431901 ?auto_431912 ) ) ( not ( = ?auto_431901 ?auto_431913 ) ) ( not ( = ?auto_431901 ?auto_431914 ) ) ( not ( = ?auto_431902 ?auto_431903 ) ) ( not ( = ?auto_431902 ?auto_431904 ) ) ( not ( = ?auto_431902 ?auto_431905 ) ) ( not ( = ?auto_431902 ?auto_431906 ) ) ( not ( = ?auto_431902 ?auto_431907 ) ) ( not ( = ?auto_431902 ?auto_431908 ) ) ( not ( = ?auto_431902 ?auto_431909 ) ) ( not ( = ?auto_431902 ?auto_431910 ) ) ( not ( = ?auto_431902 ?auto_431911 ) ) ( not ( = ?auto_431902 ?auto_431912 ) ) ( not ( = ?auto_431902 ?auto_431913 ) ) ( not ( = ?auto_431902 ?auto_431914 ) ) ( not ( = ?auto_431903 ?auto_431904 ) ) ( not ( = ?auto_431903 ?auto_431905 ) ) ( not ( = ?auto_431903 ?auto_431906 ) ) ( not ( = ?auto_431903 ?auto_431907 ) ) ( not ( = ?auto_431903 ?auto_431908 ) ) ( not ( = ?auto_431903 ?auto_431909 ) ) ( not ( = ?auto_431903 ?auto_431910 ) ) ( not ( = ?auto_431903 ?auto_431911 ) ) ( not ( = ?auto_431903 ?auto_431912 ) ) ( not ( = ?auto_431903 ?auto_431913 ) ) ( not ( = ?auto_431903 ?auto_431914 ) ) ( not ( = ?auto_431904 ?auto_431905 ) ) ( not ( = ?auto_431904 ?auto_431906 ) ) ( not ( = ?auto_431904 ?auto_431907 ) ) ( not ( = ?auto_431904 ?auto_431908 ) ) ( not ( = ?auto_431904 ?auto_431909 ) ) ( not ( = ?auto_431904 ?auto_431910 ) ) ( not ( = ?auto_431904 ?auto_431911 ) ) ( not ( = ?auto_431904 ?auto_431912 ) ) ( not ( = ?auto_431904 ?auto_431913 ) ) ( not ( = ?auto_431904 ?auto_431914 ) ) ( not ( = ?auto_431905 ?auto_431906 ) ) ( not ( = ?auto_431905 ?auto_431907 ) ) ( not ( = ?auto_431905 ?auto_431908 ) ) ( not ( = ?auto_431905 ?auto_431909 ) ) ( not ( = ?auto_431905 ?auto_431910 ) ) ( not ( = ?auto_431905 ?auto_431911 ) ) ( not ( = ?auto_431905 ?auto_431912 ) ) ( not ( = ?auto_431905 ?auto_431913 ) ) ( not ( = ?auto_431905 ?auto_431914 ) ) ( not ( = ?auto_431906 ?auto_431907 ) ) ( not ( = ?auto_431906 ?auto_431908 ) ) ( not ( = ?auto_431906 ?auto_431909 ) ) ( not ( = ?auto_431906 ?auto_431910 ) ) ( not ( = ?auto_431906 ?auto_431911 ) ) ( not ( = ?auto_431906 ?auto_431912 ) ) ( not ( = ?auto_431906 ?auto_431913 ) ) ( not ( = ?auto_431906 ?auto_431914 ) ) ( not ( = ?auto_431907 ?auto_431908 ) ) ( not ( = ?auto_431907 ?auto_431909 ) ) ( not ( = ?auto_431907 ?auto_431910 ) ) ( not ( = ?auto_431907 ?auto_431911 ) ) ( not ( = ?auto_431907 ?auto_431912 ) ) ( not ( = ?auto_431907 ?auto_431913 ) ) ( not ( = ?auto_431907 ?auto_431914 ) ) ( not ( = ?auto_431908 ?auto_431909 ) ) ( not ( = ?auto_431908 ?auto_431910 ) ) ( not ( = ?auto_431908 ?auto_431911 ) ) ( not ( = ?auto_431908 ?auto_431912 ) ) ( not ( = ?auto_431908 ?auto_431913 ) ) ( not ( = ?auto_431908 ?auto_431914 ) ) ( not ( = ?auto_431909 ?auto_431910 ) ) ( not ( = ?auto_431909 ?auto_431911 ) ) ( not ( = ?auto_431909 ?auto_431912 ) ) ( not ( = ?auto_431909 ?auto_431913 ) ) ( not ( = ?auto_431909 ?auto_431914 ) ) ( not ( = ?auto_431910 ?auto_431911 ) ) ( not ( = ?auto_431910 ?auto_431912 ) ) ( not ( = ?auto_431910 ?auto_431913 ) ) ( not ( = ?auto_431910 ?auto_431914 ) ) ( not ( = ?auto_431911 ?auto_431912 ) ) ( not ( = ?auto_431911 ?auto_431913 ) ) ( not ( = ?auto_431911 ?auto_431914 ) ) ( not ( = ?auto_431912 ?auto_431913 ) ) ( not ( = ?auto_431912 ?auto_431914 ) ) ( not ( = ?auto_431913 ?auto_431914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431913 ?auto_431914 )
      ( !STACK ?auto_431913 ?auto_431912 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431929 - BLOCK
      ?auto_431930 - BLOCK
      ?auto_431931 - BLOCK
      ?auto_431932 - BLOCK
      ?auto_431933 - BLOCK
      ?auto_431934 - BLOCK
      ?auto_431935 - BLOCK
      ?auto_431936 - BLOCK
      ?auto_431937 - BLOCK
      ?auto_431938 - BLOCK
      ?auto_431939 - BLOCK
      ?auto_431940 - BLOCK
      ?auto_431941 - BLOCK
      ?auto_431942 - BLOCK
    )
    :vars
    (
      ?auto_431943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431941 ) ( ON ?auto_431942 ?auto_431943 ) ( CLEAR ?auto_431942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431929 ) ( ON ?auto_431930 ?auto_431929 ) ( ON ?auto_431931 ?auto_431930 ) ( ON ?auto_431932 ?auto_431931 ) ( ON ?auto_431933 ?auto_431932 ) ( ON ?auto_431934 ?auto_431933 ) ( ON ?auto_431935 ?auto_431934 ) ( ON ?auto_431936 ?auto_431935 ) ( ON ?auto_431937 ?auto_431936 ) ( ON ?auto_431938 ?auto_431937 ) ( ON ?auto_431939 ?auto_431938 ) ( ON ?auto_431940 ?auto_431939 ) ( ON ?auto_431941 ?auto_431940 ) ( not ( = ?auto_431929 ?auto_431930 ) ) ( not ( = ?auto_431929 ?auto_431931 ) ) ( not ( = ?auto_431929 ?auto_431932 ) ) ( not ( = ?auto_431929 ?auto_431933 ) ) ( not ( = ?auto_431929 ?auto_431934 ) ) ( not ( = ?auto_431929 ?auto_431935 ) ) ( not ( = ?auto_431929 ?auto_431936 ) ) ( not ( = ?auto_431929 ?auto_431937 ) ) ( not ( = ?auto_431929 ?auto_431938 ) ) ( not ( = ?auto_431929 ?auto_431939 ) ) ( not ( = ?auto_431929 ?auto_431940 ) ) ( not ( = ?auto_431929 ?auto_431941 ) ) ( not ( = ?auto_431929 ?auto_431942 ) ) ( not ( = ?auto_431929 ?auto_431943 ) ) ( not ( = ?auto_431930 ?auto_431931 ) ) ( not ( = ?auto_431930 ?auto_431932 ) ) ( not ( = ?auto_431930 ?auto_431933 ) ) ( not ( = ?auto_431930 ?auto_431934 ) ) ( not ( = ?auto_431930 ?auto_431935 ) ) ( not ( = ?auto_431930 ?auto_431936 ) ) ( not ( = ?auto_431930 ?auto_431937 ) ) ( not ( = ?auto_431930 ?auto_431938 ) ) ( not ( = ?auto_431930 ?auto_431939 ) ) ( not ( = ?auto_431930 ?auto_431940 ) ) ( not ( = ?auto_431930 ?auto_431941 ) ) ( not ( = ?auto_431930 ?auto_431942 ) ) ( not ( = ?auto_431930 ?auto_431943 ) ) ( not ( = ?auto_431931 ?auto_431932 ) ) ( not ( = ?auto_431931 ?auto_431933 ) ) ( not ( = ?auto_431931 ?auto_431934 ) ) ( not ( = ?auto_431931 ?auto_431935 ) ) ( not ( = ?auto_431931 ?auto_431936 ) ) ( not ( = ?auto_431931 ?auto_431937 ) ) ( not ( = ?auto_431931 ?auto_431938 ) ) ( not ( = ?auto_431931 ?auto_431939 ) ) ( not ( = ?auto_431931 ?auto_431940 ) ) ( not ( = ?auto_431931 ?auto_431941 ) ) ( not ( = ?auto_431931 ?auto_431942 ) ) ( not ( = ?auto_431931 ?auto_431943 ) ) ( not ( = ?auto_431932 ?auto_431933 ) ) ( not ( = ?auto_431932 ?auto_431934 ) ) ( not ( = ?auto_431932 ?auto_431935 ) ) ( not ( = ?auto_431932 ?auto_431936 ) ) ( not ( = ?auto_431932 ?auto_431937 ) ) ( not ( = ?auto_431932 ?auto_431938 ) ) ( not ( = ?auto_431932 ?auto_431939 ) ) ( not ( = ?auto_431932 ?auto_431940 ) ) ( not ( = ?auto_431932 ?auto_431941 ) ) ( not ( = ?auto_431932 ?auto_431942 ) ) ( not ( = ?auto_431932 ?auto_431943 ) ) ( not ( = ?auto_431933 ?auto_431934 ) ) ( not ( = ?auto_431933 ?auto_431935 ) ) ( not ( = ?auto_431933 ?auto_431936 ) ) ( not ( = ?auto_431933 ?auto_431937 ) ) ( not ( = ?auto_431933 ?auto_431938 ) ) ( not ( = ?auto_431933 ?auto_431939 ) ) ( not ( = ?auto_431933 ?auto_431940 ) ) ( not ( = ?auto_431933 ?auto_431941 ) ) ( not ( = ?auto_431933 ?auto_431942 ) ) ( not ( = ?auto_431933 ?auto_431943 ) ) ( not ( = ?auto_431934 ?auto_431935 ) ) ( not ( = ?auto_431934 ?auto_431936 ) ) ( not ( = ?auto_431934 ?auto_431937 ) ) ( not ( = ?auto_431934 ?auto_431938 ) ) ( not ( = ?auto_431934 ?auto_431939 ) ) ( not ( = ?auto_431934 ?auto_431940 ) ) ( not ( = ?auto_431934 ?auto_431941 ) ) ( not ( = ?auto_431934 ?auto_431942 ) ) ( not ( = ?auto_431934 ?auto_431943 ) ) ( not ( = ?auto_431935 ?auto_431936 ) ) ( not ( = ?auto_431935 ?auto_431937 ) ) ( not ( = ?auto_431935 ?auto_431938 ) ) ( not ( = ?auto_431935 ?auto_431939 ) ) ( not ( = ?auto_431935 ?auto_431940 ) ) ( not ( = ?auto_431935 ?auto_431941 ) ) ( not ( = ?auto_431935 ?auto_431942 ) ) ( not ( = ?auto_431935 ?auto_431943 ) ) ( not ( = ?auto_431936 ?auto_431937 ) ) ( not ( = ?auto_431936 ?auto_431938 ) ) ( not ( = ?auto_431936 ?auto_431939 ) ) ( not ( = ?auto_431936 ?auto_431940 ) ) ( not ( = ?auto_431936 ?auto_431941 ) ) ( not ( = ?auto_431936 ?auto_431942 ) ) ( not ( = ?auto_431936 ?auto_431943 ) ) ( not ( = ?auto_431937 ?auto_431938 ) ) ( not ( = ?auto_431937 ?auto_431939 ) ) ( not ( = ?auto_431937 ?auto_431940 ) ) ( not ( = ?auto_431937 ?auto_431941 ) ) ( not ( = ?auto_431937 ?auto_431942 ) ) ( not ( = ?auto_431937 ?auto_431943 ) ) ( not ( = ?auto_431938 ?auto_431939 ) ) ( not ( = ?auto_431938 ?auto_431940 ) ) ( not ( = ?auto_431938 ?auto_431941 ) ) ( not ( = ?auto_431938 ?auto_431942 ) ) ( not ( = ?auto_431938 ?auto_431943 ) ) ( not ( = ?auto_431939 ?auto_431940 ) ) ( not ( = ?auto_431939 ?auto_431941 ) ) ( not ( = ?auto_431939 ?auto_431942 ) ) ( not ( = ?auto_431939 ?auto_431943 ) ) ( not ( = ?auto_431940 ?auto_431941 ) ) ( not ( = ?auto_431940 ?auto_431942 ) ) ( not ( = ?auto_431940 ?auto_431943 ) ) ( not ( = ?auto_431941 ?auto_431942 ) ) ( not ( = ?auto_431941 ?auto_431943 ) ) ( not ( = ?auto_431942 ?auto_431943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431942 ?auto_431943 )
      ( !STACK ?auto_431942 ?auto_431941 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431958 - BLOCK
      ?auto_431959 - BLOCK
      ?auto_431960 - BLOCK
      ?auto_431961 - BLOCK
      ?auto_431962 - BLOCK
      ?auto_431963 - BLOCK
      ?auto_431964 - BLOCK
      ?auto_431965 - BLOCK
      ?auto_431966 - BLOCK
      ?auto_431967 - BLOCK
      ?auto_431968 - BLOCK
      ?auto_431969 - BLOCK
      ?auto_431970 - BLOCK
      ?auto_431971 - BLOCK
    )
    :vars
    (
      ?auto_431972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431971 ?auto_431972 ) ( ON-TABLE ?auto_431958 ) ( ON ?auto_431959 ?auto_431958 ) ( ON ?auto_431960 ?auto_431959 ) ( ON ?auto_431961 ?auto_431960 ) ( ON ?auto_431962 ?auto_431961 ) ( ON ?auto_431963 ?auto_431962 ) ( ON ?auto_431964 ?auto_431963 ) ( ON ?auto_431965 ?auto_431964 ) ( ON ?auto_431966 ?auto_431965 ) ( ON ?auto_431967 ?auto_431966 ) ( ON ?auto_431968 ?auto_431967 ) ( ON ?auto_431969 ?auto_431968 ) ( not ( = ?auto_431958 ?auto_431959 ) ) ( not ( = ?auto_431958 ?auto_431960 ) ) ( not ( = ?auto_431958 ?auto_431961 ) ) ( not ( = ?auto_431958 ?auto_431962 ) ) ( not ( = ?auto_431958 ?auto_431963 ) ) ( not ( = ?auto_431958 ?auto_431964 ) ) ( not ( = ?auto_431958 ?auto_431965 ) ) ( not ( = ?auto_431958 ?auto_431966 ) ) ( not ( = ?auto_431958 ?auto_431967 ) ) ( not ( = ?auto_431958 ?auto_431968 ) ) ( not ( = ?auto_431958 ?auto_431969 ) ) ( not ( = ?auto_431958 ?auto_431970 ) ) ( not ( = ?auto_431958 ?auto_431971 ) ) ( not ( = ?auto_431958 ?auto_431972 ) ) ( not ( = ?auto_431959 ?auto_431960 ) ) ( not ( = ?auto_431959 ?auto_431961 ) ) ( not ( = ?auto_431959 ?auto_431962 ) ) ( not ( = ?auto_431959 ?auto_431963 ) ) ( not ( = ?auto_431959 ?auto_431964 ) ) ( not ( = ?auto_431959 ?auto_431965 ) ) ( not ( = ?auto_431959 ?auto_431966 ) ) ( not ( = ?auto_431959 ?auto_431967 ) ) ( not ( = ?auto_431959 ?auto_431968 ) ) ( not ( = ?auto_431959 ?auto_431969 ) ) ( not ( = ?auto_431959 ?auto_431970 ) ) ( not ( = ?auto_431959 ?auto_431971 ) ) ( not ( = ?auto_431959 ?auto_431972 ) ) ( not ( = ?auto_431960 ?auto_431961 ) ) ( not ( = ?auto_431960 ?auto_431962 ) ) ( not ( = ?auto_431960 ?auto_431963 ) ) ( not ( = ?auto_431960 ?auto_431964 ) ) ( not ( = ?auto_431960 ?auto_431965 ) ) ( not ( = ?auto_431960 ?auto_431966 ) ) ( not ( = ?auto_431960 ?auto_431967 ) ) ( not ( = ?auto_431960 ?auto_431968 ) ) ( not ( = ?auto_431960 ?auto_431969 ) ) ( not ( = ?auto_431960 ?auto_431970 ) ) ( not ( = ?auto_431960 ?auto_431971 ) ) ( not ( = ?auto_431960 ?auto_431972 ) ) ( not ( = ?auto_431961 ?auto_431962 ) ) ( not ( = ?auto_431961 ?auto_431963 ) ) ( not ( = ?auto_431961 ?auto_431964 ) ) ( not ( = ?auto_431961 ?auto_431965 ) ) ( not ( = ?auto_431961 ?auto_431966 ) ) ( not ( = ?auto_431961 ?auto_431967 ) ) ( not ( = ?auto_431961 ?auto_431968 ) ) ( not ( = ?auto_431961 ?auto_431969 ) ) ( not ( = ?auto_431961 ?auto_431970 ) ) ( not ( = ?auto_431961 ?auto_431971 ) ) ( not ( = ?auto_431961 ?auto_431972 ) ) ( not ( = ?auto_431962 ?auto_431963 ) ) ( not ( = ?auto_431962 ?auto_431964 ) ) ( not ( = ?auto_431962 ?auto_431965 ) ) ( not ( = ?auto_431962 ?auto_431966 ) ) ( not ( = ?auto_431962 ?auto_431967 ) ) ( not ( = ?auto_431962 ?auto_431968 ) ) ( not ( = ?auto_431962 ?auto_431969 ) ) ( not ( = ?auto_431962 ?auto_431970 ) ) ( not ( = ?auto_431962 ?auto_431971 ) ) ( not ( = ?auto_431962 ?auto_431972 ) ) ( not ( = ?auto_431963 ?auto_431964 ) ) ( not ( = ?auto_431963 ?auto_431965 ) ) ( not ( = ?auto_431963 ?auto_431966 ) ) ( not ( = ?auto_431963 ?auto_431967 ) ) ( not ( = ?auto_431963 ?auto_431968 ) ) ( not ( = ?auto_431963 ?auto_431969 ) ) ( not ( = ?auto_431963 ?auto_431970 ) ) ( not ( = ?auto_431963 ?auto_431971 ) ) ( not ( = ?auto_431963 ?auto_431972 ) ) ( not ( = ?auto_431964 ?auto_431965 ) ) ( not ( = ?auto_431964 ?auto_431966 ) ) ( not ( = ?auto_431964 ?auto_431967 ) ) ( not ( = ?auto_431964 ?auto_431968 ) ) ( not ( = ?auto_431964 ?auto_431969 ) ) ( not ( = ?auto_431964 ?auto_431970 ) ) ( not ( = ?auto_431964 ?auto_431971 ) ) ( not ( = ?auto_431964 ?auto_431972 ) ) ( not ( = ?auto_431965 ?auto_431966 ) ) ( not ( = ?auto_431965 ?auto_431967 ) ) ( not ( = ?auto_431965 ?auto_431968 ) ) ( not ( = ?auto_431965 ?auto_431969 ) ) ( not ( = ?auto_431965 ?auto_431970 ) ) ( not ( = ?auto_431965 ?auto_431971 ) ) ( not ( = ?auto_431965 ?auto_431972 ) ) ( not ( = ?auto_431966 ?auto_431967 ) ) ( not ( = ?auto_431966 ?auto_431968 ) ) ( not ( = ?auto_431966 ?auto_431969 ) ) ( not ( = ?auto_431966 ?auto_431970 ) ) ( not ( = ?auto_431966 ?auto_431971 ) ) ( not ( = ?auto_431966 ?auto_431972 ) ) ( not ( = ?auto_431967 ?auto_431968 ) ) ( not ( = ?auto_431967 ?auto_431969 ) ) ( not ( = ?auto_431967 ?auto_431970 ) ) ( not ( = ?auto_431967 ?auto_431971 ) ) ( not ( = ?auto_431967 ?auto_431972 ) ) ( not ( = ?auto_431968 ?auto_431969 ) ) ( not ( = ?auto_431968 ?auto_431970 ) ) ( not ( = ?auto_431968 ?auto_431971 ) ) ( not ( = ?auto_431968 ?auto_431972 ) ) ( not ( = ?auto_431969 ?auto_431970 ) ) ( not ( = ?auto_431969 ?auto_431971 ) ) ( not ( = ?auto_431969 ?auto_431972 ) ) ( not ( = ?auto_431970 ?auto_431971 ) ) ( not ( = ?auto_431970 ?auto_431972 ) ) ( not ( = ?auto_431971 ?auto_431972 ) ) ( CLEAR ?auto_431969 ) ( ON ?auto_431970 ?auto_431971 ) ( CLEAR ?auto_431970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_431958 ?auto_431959 ?auto_431960 ?auto_431961 ?auto_431962 ?auto_431963 ?auto_431964 ?auto_431965 ?auto_431966 ?auto_431967 ?auto_431968 ?auto_431969 ?auto_431970 )
      ( MAKE-14PILE ?auto_431958 ?auto_431959 ?auto_431960 ?auto_431961 ?auto_431962 ?auto_431963 ?auto_431964 ?auto_431965 ?auto_431966 ?auto_431967 ?auto_431968 ?auto_431969 ?auto_431970 ?auto_431971 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431987 - BLOCK
      ?auto_431988 - BLOCK
      ?auto_431989 - BLOCK
      ?auto_431990 - BLOCK
      ?auto_431991 - BLOCK
      ?auto_431992 - BLOCK
      ?auto_431993 - BLOCK
      ?auto_431994 - BLOCK
      ?auto_431995 - BLOCK
      ?auto_431996 - BLOCK
      ?auto_431997 - BLOCK
      ?auto_431998 - BLOCK
      ?auto_431999 - BLOCK
      ?auto_432000 - BLOCK
    )
    :vars
    (
      ?auto_432001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432000 ?auto_432001 ) ( ON-TABLE ?auto_431987 ) ( ON ?auto_431988 ?auto_431987 ) ( ON ?auto_431989 ?auto_431988 ) ( ON ?auto_431990 ?auto_431989 ) ( ON ?auto_431991 ?auto_431990 ) ( ON ?auto_431992 ?auto_431991 ) ( ON ?auto_431993 ?auto_431992 ) ( ON ?auto_431994 ?auto_431993 ) ( ON ?auto_431995 ?auto_431994 ) ( ON ?auto_431996 ?auto_431995 ) ( ON ?auto_431997 ?auto_431996 ) ( ON ?auto_431998 ?auto_431997 ) ( not ( = ?auto_431987 ?auto_431988 ) ) ( not ( = ?auto_431987 ?auto_431989 ) ) ( not ( = ?auto_431987 ?auto_431990 ) ) ( not ( = ?auto_431987 ?auto_431991 ) ) ( not ( = ?auto_431987 ?auto_431992 ) ) ( not ( = ?auto_431987 ?auto_431993 ) ) ( not ( = ?auto_431987 ?auto_431994 ) ) ( not ( = ?auto_431987 ?auto_431995 ) ) ( not ( = ?auto_431987 ?auto_431996 ) ) ( not ( = ?auto_431987 ?auto_431997 ) ) ( not ( = ?auto_431987 ?auto_431998 ) ) ( not ( = ?auto_431987 ?auto_431999 ) ) ( not ( = ?auto_431987 ?auto_432000 ) ) ( not ( = ?auto_431987 ?auto_432001 ) ) ( not ( = ?auto_431988 ?auto_431989 ) ) ( not ( = ?auto_431988 ?auto_431990 ) ) ( not ( = ?auto_431988 ?auto_431991 ) ) ( not ( = ?auto_431988 ?auto_431992 ) ) ( not ( = ?auto_431988 ?auto_431993 ) ) ( not ( = ?auto_431988 ?auto_431994 ) ) ( not ( = ?auto_431988 ?auto_431995 ) ) ( not ( = ?auto_431988 ?auto_431996 ) ) ( not ( = ?auto_431988 ?auto_431997 ) ) ( not ( = ?auto_431988 ?auto_431998 ) ) ( not ( = ?auto_431988 ?auto_431999 ) ) ( not ( = ?auto_431988 ?auto_432000 ) ) ( not ( = ?auto_431988 ?auto_432001 ) ) ( not ( = ?auto_431989 ?auto_431990 ) ) ( not ( = ?auto_431989 ?auto_431991 ) ) ( not ( = ?auto_431989 ?auto_431992 ) ) ( not ( = ?auto_431989 ?auto_431993 ) ) ( not ( = ?auto_431989 ?auto_431994 ) ) ( not ( = ?auto_431989 ?auto_431995 ) ) ( not ( = ?auto_431989 ?auto_431996 ) ) ( not ( = ?auto_431989 ?auto_431997 ) ) ( not ( = ?auto_431989 ?auto_431998 ) ) ( not ( = ?auto_431989 ?auto_431999 ) ) ( not ( = ?auto_431989 ?auto_432000 ) ) ( not ( = ?auto_431989 ?auto_432001 ) ) ( not ( = ?auto_431990 ?auto_431991 ) ) ( not ( = ?auto_431990 ?auto_431992 ) ) ( not ( = ?auto_431990 ?auto_431993 ) ) ( not ( = ?auto_431990 ?auto_431994 ) ) ( not ( = ?auto_431990 ?auto_431995 ) ) ( not ( = ?auto_431990 ?auto_431996 ) ) ( not ( = ?auto_431990 ?auto_431997 ) ) ( not ( = ?auto_431990 ?auto_431998 ) ) ( not ( = ?auto_431990 ?auto_431999 ) ) ( not ( = ?auto_431990 ?auto_432000 ) ) ( not ( = ?auto_431990 ?auto_432001 ) ) ( not ( = ?auto_431991 ?auto_431992 ) ) ( not ( = ?auto_431991 ?auto_431993 ) ) ( not ( = ?auto_431991 ?auto_431994 ) ) ( not ( = ?auto_431991 ?auto_431995 ) ) ( not ( = ?auto_431991 ?auto_431996 ) ) ( not ( = ?auto_431991 ?auto_431997 ) ) ( not ( = ?auto_431991 ?auto_431998 ) ) ( not ( = ?auto_431991 ?auto_431999 ) ) ( not ( = ?auto_431991 ?auto_432000 ) ) ( not ( = ?auto_431991 ?auto_432001 ) ) ( not ( = ?auto_431992 ?auto_431993 ) ) ( not ( = ?auto_431992 ?auto_431994 ) ) ( not ( = ?auto_431992 ?auto_431995 ) ) ( not ( = ?auto_431992 ?auto_431996 ) ) ( not ( = ?auto_431992 ?auto_431997 ) ) ( not ( = ?auto_431992 ?auto_431998 ) ) ( not ( = ?auto_431992 ?auto_431999 ) ) ( not ( = ?auto_431992 ?auto_432000 ) ) ( not ( = ?auto_431992 ?auto_432001 ) ) ( not ( = ?auto_431993 ?auto_431994 ) ) ( not ( = ?auto_431993 ?auto_431995 ) ) ( not ( = ?auto_431993 ?auto_431996 ) ) ( not ( = ?auto_431993 ?auto_431997 ) ) ( not ( = ?auto_431993 ?auto_431998 ) ) ( not ( = ?auto_431993 ?auto_431999 ) ) ( not ( = ?auto_431993 ?auto_432000 ) ) ( not ( = ?auto_431993 ?auto_432001 ) ) ( not ( = ?auto_431994 ?auto_431995 ) ) ( not ( = ?auto_431994 ?auto_431996 ) ) ( not ( = ?auto_431994 ?auto_431997 ) ) ( not ( = ?auto_431994 ?auto_431998 ) ) ( not ( = ?auto_431994 ?auto_431999 ) ) ( not ( = ?auto_431994 ?auto_432000 ) ) ( not ( = ?auto_431994 ?auto_432001 ) ) ( not ( = ?auto_431995 ?auto_431996 ) ) ( not ( = ?auto_431995 ?auto_431997 ) ) ( not ( = ?auto_431995 ?auto_431998 ) ) ( not ( = ?auto_431995 ?auto_431999 ) ) ( not ( = ?auto_431995 ?auto_432000 ) ) ( not ( = ?auto_431995 ?auto_432001 ) ) ( not ( = ?auto_431996 ?auto_431997 ) ) ( not ( = ?auto_431996 ?auto_431998 ) ) ( not ( = ?auto_431996 ?auto_431999 ) ) ( not ( = ?auto_431996 ?auto_432000 ) ) ( not ( = ?auto_431996 ?auto_432001 ) ) ( not ( = ?auto_431997 ?auto_431998 ) ) ( not ( = ?auto_431997 ?auto_431999 ) ) ( not ( = ?auto_431997 ?auto_432000 ) ) ( not ( = ?auto_431997 ?auto_432001 ) ) ( not ( = ?auto_431998 ?auto_431999 ) ) ( not ( = ?auto_431998 ?auto_432000 ) ) ( not ( = ?auto_431998 ?auto_432001 ) ) ( not ( = ?auto_431999 ?auto_432000 ) ) ( not ( = ?auto_431999 ?auto_432001 ) ) ( not ( = ?auto_432000 ?auto_432001 ) ) ( CLEAR ?auto_431998 ) ( ON ?auto_431999 ?auto_432000 ) ( CLEAR ?auto_431999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_431987 ?auto_431988 ?auto_431989 ?auto_431990 ?auto_431991 ?auto_431992 ?auto_431993 ?auto_431994 ?auto_431995 ?auto_431996 ?auto_431997 ?auto_431998 ?auto_431999 )
      ( MAKE-14PILE ?auto_431987 ?auto_431988 ?auto_431989 ?auto_431990 ?auto_431991 ?auto_431992 ?auto_431993 ?auto_431994 ?auto_431995 ?auto_431996 ?auto_431997 ?auto_431998 ?auto_431999 ?auto_432000 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432016 - BLOCK
      ?auto_432017 - BLOCK
      ?auto_432018 - BLOCK
      ?auto_432019 - BLOCK
      ?auto_432020 - BLOCK
      ?auto_432021 - BLOCK
      ?auto_432022 - BLOCK
      ?auto_432023 - BLOCK
      ?auto_432024 - BLOCK
      ?auto_432025 - BLOCK
      ?auto_432026 - BLOCK
      ?auto_432027 - BLOCK
      ?auto_432028 - BLOCK
      ?auto_432029 - BLOCK
    )
    :vars
    (
      ?auto_432030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432029 ?auto_432030 ) ( ON-TABLE ?auto_432016 ) ( ON ?auto_432017 ?auto_432016 ) ( ON ?auto_432018 ?auto_432017 ) ( ON ?auto_432019 ?auto_432018 ) ( ON ?auto_432020 ?auto_432019 ) ( ON ?auto_432021 ?auto_432020 ) ( ON ?auto_432022 ?auto_432021 ) ( ON ?auto_432023 ?auto_432022 ) ( ON ?auto_432024 ?auto_432023 ) ( ON ?auto_432025 ?auto_432024 ) ( ON ?auto_432026 ?auto_432025 ) ( not ( = ?auto_432016 ?auto_432017 ) ) ( not ( = ?auto_432016 ?auto_432018 ) ) ( not ( = ?auto_432016 ?auto_432019 ) ) ( not ( = ?auto_432016 ?auto_432020 ) ) ( not ( = ?auto_432016 ?auto_432021 ) ) ( not ( = ?auto_432016 ?auto_432022 ) ) ( not ( = ?auto_432016 ?auto_432023 ) ) ( not ( = ?auto_432016 ?auto_432024 ) ) ( not ( = ?auto_432016 ?auto_432025 ) ) ( not ( = ?auto_432016 ?auto_432026 ) ) ( not ( = ?auto_432016 ?auto_432027 ) ) ( not ( = ?auto_432016 ?auto_432028 ) ) ( not ( = ?auto_432016 ?auto_432029 ) ) ( not ( = ?auto_432016 ?auto_432030 ) ) ( not ( = ?auto_432017 ?auto_432018 ) ) ( not ( = ?auto_432017 ?auto_432019 ) ) ( not ( = ?auto_432017 ?auto_432020 ) ) ( not ( = ?auto_432017 ?auto_432021 ) ) ( not ( = ?auto_432017 ?auto_432022 ) ) ( not ( = ?auto_432017 ?auto_432023 ) ) ( not ( = ?auto_432017 ?auto_432024 ) ) ( not ( = ?auto_432017 ?auto_432025 ) ) ( not ( = ?auto_432017 ?auto_432026 ) ) ( not ( = ?auto_432017 ?auto_432027 ) ) ( not ( = ?auto_432017 ?auto_432028 ) ) ( not ( = ?auto_432017 ?auto_432029 ) ) ( not ( = ?auto_432017 ?auto_432030 ) ) ( not ( = ?auto_432018 ?auto_432019 ) ) ( not ( = ?auto_432018 ?auto_432020 ) ) ( not ( = ?auto_432018 ?auto_432021 ) ) ( not ( = ?auto_432018 ?auto_432022 ) ) ( not ( = ?auto_432018 ?auto_432023 ) ) ( not ( = ?auto_432018 ?auto_432024 ) ) ( not ( = ?auto_432018 ?auto_432025 ) ) ( not ( = ?auto_432018 ?auto_432026 ) ) ( not ( = ?auto_432018 ?auto_432027 ) ) ( not ( = ?auto_432018 ?auto_432028 ) ) ( not ( = ?auto_432018 ?auto_432029 ) ) ( not ( = ?auto_432018 ?auto_432030 ) ) ( not ( = ?auto_432019 ?auto_432020 ) ) ( not ( = ?auto_432019 ?auto_432021 ) ) ( not ( = ?auto_432019 ?auto_432022 ) ) ( not ( = ?auto_432019 ?auto_432023 ) ) ( not ( = ?auto_432019 ?auto_432024 ) ) ( not ( = ?auto_432019 ?auto_432025 ) ) ( not ( = ?auto_432019 ?auto_432026 ) ) ( not ( = ?auto_432019 ?auto_432027 ) ) ( not ( = ?auto_432019 ?auto_432028 ) ) ( not ( = ?auto_432019 ?auto_432029 ) ) ( not ( = ?auto_432019 ?auto_432030 ) ) ( not ( = ?auto_432020 ?auto_432021 ) ) ( not ( = ?auto_432020 ?auto_432022 ) ) ( not ( = ?auto_432020 ?auto_432023 ) ) ( not ( = ?auto_432020 ?auto_432024 ) ) ( not ( = ?auto_432020 ?auto_432025 ) ) ( not ( = ?auto_432020 ?auto_432026 ) ) ( not ( = ?auto_432020 ?auto_432027 ) ) ( not ( = ?auto_432020 ?auto_432028 ) ) ( not ( = ?auto_432020 ?auto_432029 ) ) ( not ( = ?auto_432020 ?auto_432030 ) ) ( not ( = ?auto_432021 ?auto_432022 ) ) ( not ( = ?auto_432021 ?auto_432023 ) ) ( not ( = ?auto_432021 ?auto_432024 ) ) ( not ( = ?auto_432021 ?auto_432025 ) ) ( not ( = ?auto_432021 ?auto_432026 ) ) ( not ( = ?auto_432021 ?auto_432027 ) ) ( not ( = ?auto_432021 ?auto_432028 ) ) ( not ( = ?auto_432021 ?auto_432029 ) ) ( not ( = ?auto_432021 ?auto_432030 ) ) ( not ( = ?auto_432022 ?auto_432023 ) ) ( not ( = ?auto_432022 ?auto_432024 ) ) ( not ( = ?auto_432022 ?auto_432025 ) ) ( not ( = ?auto_432022 ?auto_432026 ) ) ( not ( = ?auto_432022 ?auto_432027 ) ) ( not ( = ?auto_432022 ?auto_432028 ) ) ( not ( = ?auto_432022 ?auto_432029 ) ) ( not ( = ?auto_432022 ?auto_432030 ) ) ( not ( = ?auto_432023 ?auto_432024 ) ) ( not ( = ?auto_432023 ?auto_432025 ) ) ( not ( = ?auto_432023 ?auto_432026 ) ) ( not ( = ?auto_432023 ?auto_432027 ) ) ( not ( = ?auto_432023 ?auto_432028 ) ) ( not ( = ?auto_432023 ?auto_432029 ) ) ( not ( = ?auto_432023 ?auto_432030 ) ) ( not ( = ?auto_432024 ?auto_432025 ) ) ( not ( = ?auto_432024 ?auto_432026 ) ) ( not ( = ?auto_432024 ?auto_432027 ) ) ( not ( = ?auto_432024 ?auto_432028 ) ) ( not ( = ?auto_432024 ?auto_432029 ) ) ( not ( = ?auto_432024 ?auto_432030 ) ) ( not ( = ?auto_432025 ?auto_432026 ) ) ( not ( = ?auto_432025 ?auto_432027 ) ) ( not ( = ?auto_432025 ?auto_432028 ) ) ( not ( = ?auto_432025 ?auto_432029 ) ) ( not ( = ?auto_432025 ?auto_432030 ) ) ( not ( = ?auto_432026 ?auto_432027 ) ) ( not ( = ?auto_432026 ?auto_432028 ) ) ( not ( = ?auto_432026 ?auto_432029 ) ) ( not ( = ?auto_432026 ?auto_432030 ) ) ( not ( = ?auto_432027 ?auto_432028 ) ) ( not ( = ?auto_432027 ?auto_432029 ) ) ( not ( = ?auto_432027 ?auto_432030 ) ) ( not ( = ?auto_432028 ?auto_432029 ) ) ( not ( = ?auto_432028 ?auto_432030 ) ) ( not ( = ?auto_432029 ?auto_432030 ) ) ( ON ?auto_432028 ?auto_432029 ) ( CLEAR ?auto_432026 ) ( ON ?auto_432027 ?auto_432028 ) ( CLEAR ?auto_432027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432016 ?auto_432017 ?auto_432018 ?auto_432019 ?auto_432020 ?auto_432021 ?auto_432022 ?auto_432023 ?auto_432024 ?auto_432025 ?auto_432026 ?auto_432027 )
      ( MAKE-14PILE ?auto_432016 ?auto_432017 ?auto_432018 ?auto_432019 ?auto_432020 ?auto_432021 ?auto_432022 ?auto_432023 ?auto_432024 ?auto_432025 ?auto_432026 ?auto_432027 ?auto_432028 ?auto_432029 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432045 - BLOCK
      ?auto_432046 - BLOCK
      ?auto_432047 - BLOCK
      ?auto_432048 - BLOCK
      ?auto_432049 - BLOCK
      ?auto_432050 - BLOCK
      ?auto_432051 - BLOCK
      ?auto_432052 - BLOCK
      ?auto_432053 - BLOCK
      ?auto_432054 - BLOCK
      ?auto_432055 - BLOCK
      ?auto_432056 - BLOCK
      ?auto_432057 - BLOCK
      ?auto_432058 - BLOCK
    )
    :vars
    (
      ?auto_432059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432058 ?auto_432059 ) ( ON-TABLE ?auto_432045 ) ( ON ?auto_432046 ?auto_432045 ) ( ON ?auto_432047 ?auto_432046 ) ( ON ?auto_432048 ?auto_432047 ) ( ON ?auto_432049 ?auto_432048 ) ( ON ?auto_432050 ?auto_432049 ) ( ON ?auto_432051 ?auto_432050 ) ( ON ?auto_432052 ?auto_432051 ) ( ON ?auto_432053 ?auto_432052 ) ( ON ?auto_432054 ?auto_432053 ) ( ON ?auto_432055 ?auto_432054 ) ( not ( = ?auto_432045 ?auto_432046 ) ) ( not ( = ?auto_432045 ?auto_432047 ) ) ( not ( = ?auto_432045 ?auto_432048 ) ) ( not ( = ?auto_432045 ?auto_432049 ) ) ( not ( = ?auto_432045 ?auto_432050 ) ) ( not ( = ?auto_432045 ?auto_432051 ) ) ( not ( = ?auto_432045 ?auto_432052 ) ) ( not ( = ?auto_432045 ?auto_432053 ) ) ( not ( = ?auto_432045 ?auto_432054 ) ) ( not ( = ?auto_432045 ?auto_432055 ) ) ( not ( = ?auto_432045 ?auto_432056 ) ) ( not ( = ?auto_432045 ?auto_432057 ) ) ( not ( = ?auto_432045 ?auto_432058 ) ) ( not ( = ?auto_432045 ?auto_432059 ) ) ( not ( = ?auto_432046 ?auto_432047 ) ) ( not ( = ?auto_432046 ?auto_432048 ) ) ( not ( = ?auto_432046 ?auto_432049 ) ) ( not ( = ?auto_432046 ?auto_432050 ) ) ( not ( = ?auto_432046 ?auto_432051 ) ) ( not ( = ?auto_432046 ?auto_432052 ) ) ( not ( = ?auto_432046 ?auto_432053 ) ) ( not ( = ?auto_432046 ?auto_432054 ) ) ( not ( = ?auto_432046 ?auto_432055 ) ) ( not ( = ?auto_432046 ?auto_432056 ) ) ( not ( = ?auto_432046 ?auto_432057 ) ) ( not ( = ?auto_432046 ?auto_432058 ) ) ( not ( = ?auto_432046 ?auto_432059 ) ) ( not ( = ?auto_432047 ?auto_432048 ) ) ( not ( = ?auto_432047 ?auto_432049 ) ) ( not ( = ?auto_432047 ?auto_432050 ) ) ( not ( = ?auto_432047 ?auto_432051 ) ) ( not ( = ?auto_432047 ?auto_432052 ) ) ( not ( = ?auto_432047 ?auto_432053 ) ) ( not ( = ?auto_432047 ?auto_432054 ) ) ( not ( = ?auto_432047 ?auto_432055 ) ) ( not ( = ?auto_432047 ?auto_432056 ) ) ( not ( = ?auto_432047 ?auto_432057 ) ) ( not ( = ?auto_432047 ?auto_432058 ) ) ( not ( = ?auto_432047 ?auto_432059 ) ) ( not ( = ?auto_432048 ?auto_432049 ) ) ( not ( = ?auto_432048 ?auto_432050 ) ) ( not ( = ?auto_432048 ?auto_432051 ) ) ( not ( = ?auto_432048 ?auto_432052 ) ) ( not ( = ?auto_432048 ?auto_432053 ) ) ( not ( = ?auto_432048 ?auto_432054 ) ) ( not ( = ?auto_432048 ?auto_432055 ) ) ( not ( = ?auto_432048 ?auto_432056 ) ) ( not ( = ?auto_432048 ?auto_432057 ) ) ( not ( = ?auto_432048 ?auto_432058 ) ) ( not ( = ?auto_432048 ?auto_432059 ) ) ( not ( = ?auto_432049 ?auto_432050 ) ) ( not ( = ?auto_432049 ?auto_432051 ) ) ( not ( = ?auto_432049 ?auto_432052 ) ) ( not ( = ?auto_432049 ?auto_432053 ) ) ( not ( = ?auto_432049 ?auto_432054 ) ) ( not ( = ?auto_432049 ?auto_432055 ) ) ( not ( = ?auto_432049 ?auto_432056 ) ) ( not ( = ?auto_432049 ?auto_432057 ) ) ( not ( = ?auto_432049 ?auto_432058 ) ) ( not ( = ?auto_432049 ?auto_432059 ) ) ( not ( = ?auto_432050 ?auto_432051 ) ) ( not ( = ?auto_432050 ?auto_432052 ) ) ( not ( = ?auto_432050 ?auto_432053 ) ) ( not ( = ?auto_432050 ?auto_432054 ) ) ( not ( = ?auto_432050 ?auto_432055 ) ) ( not ( = ?auto_432050 ?auto_432056 ) ) ( not ( = ?auto_432050 ?auto_432057 ) ) ( not ( = ?auto_432050 ?auto_432058 ) ) ( not ( = ?auto_432050 ?auto_432059 ) ) ( not ( = ?auto_432051 ?auto_432052 ) ) ( not ( = ?auto_432051 ?auto_432053 ) ) ( not ( = ?auto_432051 ?auto_432054 ) ) ( not ( = ?auto_432051 ?auto_432055 ) ) ( not ( = ?auto_432051 ?auto_432056 ) ) ( not ( = ?auto_432051 ?auto_432057 ) ) ( not ( = ?auto_432051 ?auto_432058 ) ) ( not ( = ?auto_432051 ?auto_432059 ) ) ( not ( = ?auto_432052 ?auto_432053 ) ) ( not ( = ?auto_432052 ?auto_432054 ) ) ( not ( = ?auto_432052 ?auto_432055 ) ) ( not ( = ?auto_432052 ?auto_432056 ) ) ( not ( = ?auto_432052 ?auto_432057 ) ) ( not ( = ?auto_432052 ?auto_432058 ) ) ( not ( = ?auto_432052 ?auto_432059 ) ) ( not ( = ?auto_432053 ?auto_432054 ) ) ( not ( = ?auto_432053 ?auto_432055 ) ) ( not ( = ?auto_432053 ?auto_432056 ) ) ( not ( = ?auto_432053 ?auto_432057 ) ) ( not ( = ?auto_432053 ?auto_432058 ) ) ( not ( = ?auto_432053 ?auto_432059 ) ) ( not ( = ?auto_432054 ?auto_432055 ) ) ( not ( = ?auto_432054 ?auto_432056 ) ) ( not ( = ?auto_432054 ?auto_432057 ) ) ( not ( = ?auto_432054 ?auto_432058 ) ) ( not ( = ?auto_432054 ?auto_432059 ) ) ( not ( = ?auto_432055 ?auto_432056 ) ) ( not ( = ?auto_432055 ?auto_432057 ) ) ( not ( = ?auto_432055 ?auto_432058 ) ) ( not ( = ?auto_432055 ?auto_432059 ) ) ( not ( = ?auto_432056 ?auto_432057 ) ) ( not ( = ?auto_432056 ?auto_432058 ) ) ( not ( = ?auto_432056 ?auto_432059 ) ) ( not ( = ?auto_432057 ?auto_432058 ) ) ( not ( = ?auto_432057 ?auto_432059 ) ) ( not ( = ?auto_432058 ?auto_432059 ) ) ( ON ?auto_432057 ?auto_432058 ) ( CLEAR ?auto_432055 ) ( ON ?auto_432056 ?auto_432057 ) ( CLEAR ?auto_432056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432045 ?auto_432046 ?auto_432047 ?auto_432048 ?auto_432049 ?auto_432050 ?auto_432051 ?auto_432052 ?auto_432053 ?auto_432054 ?auto_432055 ?auto_432056 )
      ( MAKE-14PILE ?auto_432045 ?auto_432046 ?auto_432047 ?auto_432048 ?auto_432049 ?auto_432050 ?auto_432051 ?auto_432052 ?auto_432053 ?auto_432054 ?auto_432055 ?auto_432056 ?auto_432057 ?auto_432058 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432074 - BLOCK
      ?auto_432075 - BLOCK
      ?auto_432076 - BLOCK
      ?auto_432077 - BLOCK
      ?auto_432078 - BLOCK
      ?auto_432079 - BLOCK
      ?auto_432080 - BLOCK
      ?auto_432081 - BLOCK
      ?auto_432082 - BLOCK
      ?auto_432083 - BLOCK
      ?auto_432084 - BLOCK
      ?auto_432085 - BLOCK
      ?auto_432086 - BLOCK
      ?auto_432087 - BLOCK
    )
    :vars
    (
      ?auto_432088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432087 ?auto_432088 ) ( ON-TABLE ?auto_432074 ) ( ON ?auto_432075 ?auto_432074 ) ( ON ?auto_432076 ?auto_432075 ) ( ON ?auto_432077 ?auto_432076 ) ( ON ?auto_432078 ?auto_432077 ) ( ON ?auto_432079 ?auto_432078 ) ( ON ?auto_432080 ?auto_432079 ) ( ON ?auto_432081 ?auto_432080 ) ( ON ?auto_432082 ?auto_432081 ) ( ON ?auto_432083 ?auto_432082 ) ( not ( = ?auto_432074 ?auto_432075 ) ) ( not ( = ?auto_432074 ?auto_432076 ) ) ( not ( = ?auto_432074 ?auto_432077 ) ) ( not ( = ?auto_432074 ?auto_432078 ) ) ( not ( = ?auto_432074 ?auto_432079 ) ) ( not ( = ?auto_432074 ?auto_432080 ) ) ( not ( = ?auto_432074 ?auto_432081 ) ) ( not ( = ?auto_432074 ?auto_432082 ) ) ( not ( = ?auto_432074 ?auto_432083 ) ) ( not ( = ?auto_432074 ?auto_432084 ) ) ( not ( = ?auto_432074 ?auto_432085 ) ) ( not ( = ?auto_432074 ?auto_432086 ) ) ( not ( = ?auto_432074 ?auto_432087 ) ) ( not ( = ?auto_432074 ?auto_432088 ) ) ( not ( = ?auto_432075 ?auto_432076 ) ) ( not ( = ?auto_432075 ?auto_432077 ) ) ( not ( = ?auto_432075 ?auto_432078 ) ) ( not ( = ?auto_432075 ?auto_432079 ) ) ( not ( = ?auto_432075 ?auto_432080 ) ) ( not ( = ?auto_432075 ?auto_432081 ) ) ( not ( = ?auto_432075 ?auto_432082 ) ) ( not ( = ?auto_432075 ?auto_432083 ) ) ( not ( = ?auto_432075 ?auto_432084 ) ) ( not ( = ?auto_432075 ?auto_432085 ) ) ( not ( = ?auto_432075 ?auto_432086 ) ) ( not ( = ?auto_432075 ?auto_432087 ) ) ( not ( = ?auto_432075 ?auto_432088 ) ) ( not ( = ?auto_432076 ?auto_432077 ) ) ( not ( = ?auto_432076 ?auto_432078 ) ) ( not ( = ?auto_432076 ?auto_432079 ) ) ( not ( = ?auto_432076 ?auto_432080 ) ) ( not ( = ?auto_432076 ?auto_432081 ) ) ( not ( = ?auto_432076 ?auto_432082 ) ) ( not ( = ?auto_432076 ?auto_432083 ) ) ( not ( = ?auto_432076 ?auto_432084 ) ) ( not ( = ?auto_432076 ?auto_432085 ) ) ( not ( = ?auto_432076 ?auto_432086 ) ) ( not ( = ?auto_432076 ?auto_432087 ) ) ( not ( = ?auto_432076 ?auto_432088 ) ) ( not ( = ?auto_432077 ?auto_432078 ) ) ( not ( = ?auto_432077 ?auto_432079 ) ) ( not ( = ?auto_432077 ?auto_432080 ) ) ( not ( = ?auto_432077 ?auto_432081 ) ) ( not ( = ?auto_432077 ?auto_432082 ) ) ( not ( = ?auto_432077 ?auto_432083 ) ) ( not ( = ?auto_432077 ?auto_432084 ) ) ( not ( = ?auto_432077 ?auto_432085 ) ) ( not ( = ?auto_432077 ?auto_432086 ) ) ( not ( = ?auto_432077 ?auto_432087 ) ) ( not ( = ?auto_432077 ?auto_432088 ) ) ( not ( = ?auto_432078 ?auto_432079 ) ) ( not ( = ?auto_432078 ?auto_432080 ) ) ( not ( = ?auto_432078 ?auto_432081 ) ) ( not ( = ?auto_432078 ?auto_432082 ) ) ( not ( = ?auto_432078 ?auto_432083 ) ) ( not ( = ?auto_432078 ?auto_432084 ) ) ( not ( = ?auto_432078 ?auto_432085 ) ) ( not ( = ?auto_432078 ?auto_432086 ) ) ( not ( = ?auto_432078 ?auto_432087 ) ) ( not ( = ?auto_432078 ?auto_432088 ) ) ( not ( = ?auto_432079 ?auto_432080 ) ) ( not ( = ?auto_432079 ?auto_432081 ) ) ( not ( = ?auto_432079 ?auto_432082 ) ) ( not ( = ?auto_432079 ?auto_432083 ) ) ( not ( = ?auto_432079 ?auto_432084 ) ) ( not ( = ?auto_432079 ?auto_432085 ) ) ( not ( = ?auto_432079 ?auto_432086 ) ) ( not ( = ?auto_432079 ?auto_432087 ) ) ( not ( = ?auto_432079 ?auto_432088 ) ) ( not ( = ?auto_432080 ?auto_432081 ) ) ( not ( = ?auto_432080 ?auto_432082 ) ) ( not ( = ?auto_432080 ?auto_432083 ) ) ( not ( = ?auto_432080 ?auto_432084 ) ) ( not ( = ?auto_432080 ?auto_432085 ) ) ( not ( = ?auto_432080 ?auto_432086 ) ) ( not ( = ?auto_432080 ?auto_432087 ) ) ( not ( = ?auto_432080 ?auto_432088 ) ) ( not ( = ?auto_432081 ?auto_432082 ) ) ( not ( = ?auto_432081 ?auto_432083 ) ) ( not ( = ?auto_432081 ?auto_432084 ) ) ( not ( = ?auto_432081 ?auto_432085 ) ) ( not ( = ?auto_432081 ?auto_432086 ) ) ( not ( = ?auto_432081 ?auto_432087 ) ) ( not ( = ?auto_432081 ?auto_432088 ) ) ( not ( = ?auto_432082 ?auto_432083 ) ) ( not ( = ?auto_432082 ?auto_432084 ) ) ( not ( = ?auto_432082 ?auto_432085 ) ) ( not ( = ?auto_432082 ?auto_432086 ) ) ( not ( = ?auto_432082 ?auto_432087 ) ) ( not ( = ?auto_432082 ?auto_432088 ) ) ( not ( = ?auto_432083 ?auto_432084 ) ) ( not ( = ?auto_432083 ?auto_432085 ) ) ( not ( = ?auto_432083 ?auto_432086 ) ) ( not ( = ?auto_432083 ?auto_432087 ) ) ( not ( = ?auto_432083 ?auto_432088 ) ) ( not ( = ?auto_432084 ?auto_432085 ) ) ( not ( = ?auto_432084 ?auto_432086 ) ) ( not ( = ?auto_432084 ?auto_432087 ) ) ( not ( = ?auto_432084 ?auto_432088 ) ) ( not ( = ?auto_432085 ?auto_432086 ) ) ( not ( = ?auto_432085 ?auto_432087 ) ) ( not ( = ?auto_432085 ?auto_432088 ) ) ( not ( = ?auto_432086 ?auto_432087 ) ) ( not ( = ?auto_432086 ?auto_432088 ) ) ( not ( = ?auto_432087 ?auto_432088 ) ) ( ON ?auto_432086 ?auto_432087 ) ( ON ?auto_432085 ?auto_432086 ) ( CLEAR ?auto_432083 ) ( ON ?auto_432084 ?auto_432085 ) ( CLEAR ?auto_432084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432074 ?auto_432075 ?auto_432076 ?auto_432077 ?auto_432078 ?auto_432079 ?auto_432080 ?auto_432081 ?auto_432082 ?auto_432083 ?auto_432084 )
      ( MAKE-14PILE ?auto_432074 ?auto_432075 ?auto_432076 ?auto_432077 ?auto_432078 ?auto_432079 ?auto_432080 ?auto_432081 ?auto_432082 ?auto_432083 ?auto_432084 ?auto_432085 ?auto_432086 ?auto_432087 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432103 - BLOCK
      ?auto_432104 - BLOCK
      ?auto_432105 - BLOCK
      ?auto_432106 - BLOCK
      ?auto_432107 - BLOCK
      ?auto_432108 - BLOCK
      ?auto_432109 - BLOCK
      ?auto_432110 - BLOCK
      ?auto_432111 - BLOCK
      ?auto_432112 - BLOCK
      ?auto_432113 - BLOCK
      ?auto_432114 - BLOCK
      ?auto_432115 - BLOCK
      ?auto_432116 - BLOCK
    )
    :vars
    (
      ?auto_432117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432116 ?auto_432117 ) ( ON-TABLE ?auto_432103 ) ( ON ?auto_432104 ?auto_432103 ) ( ON ?auto_432105 ?auto_432104 ) ( ON ?auto_432106 ?auto_432105 ) ( ON ?auto_432107 ?auto_432106 ) ( ON ?auto_432108 ?auto_432107 ) ( ON ?auto_432109 ?auto_432108 ) ( ON ?auto_432110 ?auto_432109 ) ( ON ?auto_432111 ?auto_432110 ) ( ON ?auto_432112 ?auto_432111 ) ( not ( = ?auto_432103 ?auto_432104 ) ) ( not ( = ?auto_432103 ?auto_432105 ) ) ( not ( = ?auto_432103 ?auto_432106 ) ) ( not ( = ?auto_432103 ?auto_432107 ) ) ( not ( = ?auto_432103 ?auto_432108 ) ) ( not ( = ?auto_432103 ?auto_432109 ) ) ( not ( = ?auto_432103 ?auto_432110 ) ) ( not ( = ?auto_432103 ?auto_432111 ) ) ( not ( = ?auto_432103 ?auto_432112 ) ) ( not ( = ?auto_432103 ?auto_432113 ) ) ( not ( = ?auto_432103 ?auto_432114 ) ) ( not ( = ?auto_432103 ?auto_432115 ) ) ( not ( = ?auto_432103 ?auto_432116 ) ) ( not ( = ?auto_432103 ?auto_432117 ) ) ( not ( = ?auto_432104 ?auto_432105 ) ) ( not ( = ?auto_432104 ?auto_432106 ) ) ( not ( = ?auto_432104 ?auto_432107 ) ) ( not ( = ?auto_432104 ?auto_432108 ) ) ( not ( = ?auto_432104 ?auto_432109 ) ) ( not ( = ?auto_432104 ?auto_432110 ) ) ( not ( = ?auto_432104 ?auto_432111 ) ) ( not ( = ?auto_432104 ?auto_432112 ) ) ( not ( = ?auto_432104 ?auto_432113 ) ) ( not ( = ?auto_432104 ?auto_432114 ) ) ( not ( = ?auto_432104 ?auto_432115 ) ) ( not ( = ?auto_432104 ?auto_432116 ) ) ( not ( = ?auto_432104 ?auto_432117 ) ) ( not ( = ?auto_432105 ?auto_432106 ) ) ( not ( = ?auto_432105 ?auto_432107 ) ) ( not ( = ?auto_432105 ?auto_432108 ) ) ( not ( = ?auto_432105 ?auto_432109 ) ) ( not ( = ?auto_432105 ?auto_432110 ) ) ( not ( = ?auto_432105 ?auto_432111 ) ) ( not ( = ?auto_432105 ?auto_432112 ) ) ( not ( = ?auto_432105 ?auto_432113 ) ) ( not ( = ?auto_432105 ?auto_432114 ) ) ( not ( = ?auto_432105 ?auto_432115 ) ) ( not ( = ?auto_432105 ?auto_432116 ) ) ( not ( = ?auto_432105 ?auto_432117 ) ) ( not ( = ?auto_432106 ?auto_432107 ) ) ( not ( = ?auto_432106 ?auto_432108 ) ) ( not ( = ?auto_432106 ?auto_432109 ) ) ( not ( = ?auto_432106 ?auto_432110 ) ) ( not ( = ?auto_432106 ?auto_432111 ) ) ( not ( = ?auto_432106 ?auto_432112 ) ) ( not ( = ?auto_432106 ?auto_432113 ) ) ( not ( = ?auto_432106 ?auto_432114 ) ) ( not ( = ?auto_432106 ?auto_432115 ) ) ( not ( = ?auto_432106 ?auto_432116 ) ) ( not ( = ?auto_432106 ?auto_432117 ) ) ( not ( = ?auto_432107 ?auto_432108 ) ) ( not ( = ?auto_432107 ?auto_432109 ) ) ( not ( = ?auto_432107 ?auto_432110 ) ) ( not ( = ?auto_432107 ?auto_432111 ) ) ( not ( = ?auto_432107 ?auto_432112 ) ) ( not ( = ?auto_432107 ?auto_432113 ) ) ( not ( = ?auto_432107 ?auto_432114 ) ) ( not ( = ?auto_432107 ?auto_432115 ) ) ( not ( = ?auto_432107 ?auto_432116 ) ) ( not ( = ?auto_432107 ?auto_432117 ) ) ( not ( = ?auto_432108 ?auto_432109 ) ) ( not ( = ?auto_432108 ?auto_432110 ) ) ( not ( = ?auto_432108 ?auto_432111 ) ) ( not ( = ?auto_432108 ?auto_432112 ) ) ( not ( = ?auto_432108 ?auto_432113 ) ) ( not ( = ?auto_432108 ?auto_432114 ) ) ( not ( = ?auto_432108 ?auto_432115 ) ) ( not ( = ?auto_432108 ?auto_432116 ) ) ( not ( = ?auto_432108 ?auto_432117 ) ) ( not ( = ?auto_432109 ?auto_432110 ) ) ( not ( = ?auto_432109 ?auto_432111 ) ) ( not ( = ?auto_432109 ?auto_432112 ) ) ( not ( = ?auto_432109 ?auto_432113 ) ) ( not ( = ?auto_432109 ?auto_432114 ) ) ( not ( = ?auto_432109 ?auto_432115 ) ) ( not ( = ?auto_432109 ?auto_432116 ) ) ( not ( = ?auto_432109 ?auto_432117 ) ) ( not ( = ?auto_432110 ?auto_432111 ) ) ( not ( = ?auto_432110 ?auto_432112 ) ) ( not ( = ?auto_432110 ?auto_432113 ) ) ( not ( = ?auto_432110 ?auto_432114 ) ) ( not ( = ?auto_432110 ?auto_432115 ) ) ( not ( = ?auto_432110 ?auto_432116 ) ) ( not ( = ?auto_432110 ?auto_432117 ) ) ( not ( = ?auto_432111 ?auto_432112 ) ) ( not ( = ?auto_432111 ?auto_432113 ) ) ( not ( = ?auto_432111 ?auto_432114 ) ) ( not ( = ?auto_432111 ?auto_432115 ) ) ( not ( = ?auto_432111 ?auto_432116 ) ) ( not ( = ?auto_432111 ?auto_432117 ) ) ( not ( = ?auto_432112 ?auto_432113 ) ) ( not ( = ?auto_432112 ?auto_432114 ) ) ( not ( = ?auto_432112 ?auto_432115 ) ) ( not ( = ?auto_432112 ?auto_432116 ) ) ( not ( = ?auto_432112 ?auto_432117 ) ) ( not ( = ?auto_432113 ?auto_432114 ) ) ( not ( = ?auto_432113 ?auto_432115 ) ) ( not ( = ?auto_432113 ?auto_432116 ) ) ( not ( = ?auto_432113 ?auto_432117 ) ) ( not ( = ?auto_432114 ?auto_432115 ) ) ( not ( = ?auto_432114 ?auto_432116 ) ) ( not ( = ?auto_432114 ?auto_432117 ) ) ( not ( = ?auto_432115 ?auto_432116 ) ) ( not ( = ?auto_432115 ?auto_432117 ) ) ( not ( = ?auto_432116 ?auto_432117 ) ) ( ON ?auto_432115 ?auto_432116 ) ( ON ?auto_432114 ?auto_432115 ) ( CLEAR ?auto_432112 ) ( ON ?auto_432113 ?auto_432114 ) ( CLEAR ?auto_432113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432103 ?auto_432104 ?auto_432105 ?auto_432106 ?auto_432107 ?auto_432108 ?auto_432109 ?auto_432110 ?auto_432111 ?auto_432112 ?auto_432113 )
      ( MAKE-14PILE ?auto_432103 ?auto_432104 ?auto_432105 ?auto_432106 ?auto_432107 ?auto_432108 ?auto_432109 ?auto_432110 ?auto_432111 ?auto_432112 ?auto_432113 ?auto_432114 ?auto_432115 ?auto_432116 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432132 - BLOCK
      ?auto_432133 - BLOCK
      ?auto_432134 - BLOCK
      ?auto_432135 - BLOCK
      ?auto_432136 - BLOCK
      ?auto_432137 - BLOCK
      ?auto_432138 - BLOCK
      ?auto_432139 - BLOCK
      ?auto_432140 - BLOCK
      ?auto_432141 - BLOCK
      ?auto_432142 - BLOCK
      ?auto_432143 - BLOCK
      ?auto_432144 - BLOCK
      ?auto_432145 - BLOCK
    )
    :vars
    (
      ?auto_432146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432145 ?auto_432146 ) ( ON-TABLE ?auto_432132 ) ( ON ?auto_432133 ?auto_432132 ) ( ON ?auto_432134 ?auto_432133 ) ( ON ?auto_432135 ?auto_432134 ) ( ON ?auto_432136 ?auto_432135 ) ( ON ?auto_432137 ?auto_432136 ) ( ON ?auto_432138 ?auto_432137 ) ( ON ?auto_432139 ?auto_432138 ) ( ON ?auto_432140 ?auto_432139 ) ( not ( = ?auto_432132 ?auto_432133 ) ) ( not ( = ?auto_432132 ?auto_432134 ) ) ( not ( = ?auto_432132 ?auto_432135 ) ) ( not ( = ?auto_432132 ?auto_432136 ) ) ( not ( = ?auto_432132 ?auto_432137 ) ) ( not ( = ?auto_432132 ?auto_432138 ) ) ( not ( = ?auto_432132 ?auto_432139 ) ) ( not ( = ?auto_432132 ?auto_432140 ) ) ( not ( = ?auto_432132 ?auto_432141 ) ) ( not ( = ?auto_432132 ?auto_432142 ) ) ( not ( = ?auto_432132 ?auto_432143 ) ) ( not ( = ?auto_432132 ?auto_432144 ) ) ( not ( = ?auto_432132 ?auto_432145 ) ) ( not ( = ?auto_432132 ?auto_432146 ) ) ( not ( = ?auto_432133 ?auto_432134 ) ) ( not ( = ?auto_432133 ?auto_432135 ) ) ( not ( = ?auto_432133 ?auto_432136 ) ) ( not ( = ?auto_432133 ?auto_432137 ) ) ( not ( = ?auto_432133 ?auto_432138 ) ) ( not ( = ?auto_432133 ?auto_432139 ) ) ( not ( = ?auto_432133 ?auto_432140 ) ) ( not ( = ?auto_432133 ?auto_432141 ) ) ( not ( = ?auto_432133 ?auto_432142 ) ) ( not ( = ?auto_432133 ?auto_432143 ) ) ( not ( = ?auto_432133 ?auto_432144 ) ) ( not ( = ?auto_432133 ?auto_432145 ) ) ( not ( = ?auto_432133 ?auto_432146 ) ) ( not ( = ?auto_432134 ?auto_432135 ) ) ( not ( = ?auto_432134 ?auto_432136 ) ) ( not ( = ?auto_432134 ?auto_432137 ) ) ( not ( = ?auto_432134 ?auto_432138 ) ) ( not ( = ?auto_432134 ?auto_432139 ) ) ( not ( = ?auto_432134 ?auto_432140 ) ) ( not ( = ?auto_432134 ?auto_432141 ) ) ( not ( = ?auto_432134 ?auto_432142 ) ) ( not ( = ?auto_432134 ?auto_432143 ) ) ( not ( = ?auto_432134 ?auto_432144 ) ) ( not ( = ?auto_432134 ?auto_432145 ) ) ( not ( = ?auto_432134 ?auto_432146 ) ) ( not ( = ?auto_432135 ?auto_432136 ) ) ( not ( = ?auto_432135 ?auto_432137 ) ) ( not ( = ?auto_432135 ?auto_432138 ) ) ( not ( = ?auto_432135 ?auto_432139 ) ) ( not ( = ?auto_432135 ?auto_432140 ) ) ( not ( = ?auto_432135 ?auto_432141 ) ) ( not ( = ?auto_432135 ?auto_432142 ) ) ( not ( = ?auto_432135 ?auto_432143 ) ) ( not ( = ?auto_432135 ?auto_432144 ) ) ( not ( = ?auto_432135 ?auto_432145 ) ) ( not ( = ?auto_432135 ?auto_432146 ) ) ( not ( = ?auto_432136 ?auto_432137 ) ) ( not ( = ?auto_432136 ?auto_432138 ) ) ( not ( = ?auto_432136 ?auto_432139 ) ) ( not ( = ?auto_432136 ?auto_432140 ) ) ( not ( = ?auto_432136 ?auto_432141 ) ) ( not ( = ?auto_432136 ?auto_432142 ) ) ( not ( = ?auto_432136 ?auto_432143 ) ) ( not ( = ?auto_432136 ?auto_432144 ) ) ( not ( = ?auto_432136 ?auto_432145 ) ) ( not ( = ?auto_432136 ?auto_432146 ) ) ( not ( = ?auto_432137 ?auto_432138 ) ) ( not ( = ?auto_432137 ?auto_432139 ) ) ( not ( = ?auto_432137 ?auto_432140 ) ) ( not ( = ?auto_432137 ?auto_432141 ) ) ( not ( = ?auto_432137 ?auto_432142 ) ) ( not ( = ?auto_432137 ?auto_432143 ) ) ( not ( = ?auto_432137 ?auto_432144 ) ) ( not ( = ?auto_432137 ?auto_432145 ) ) ( not ( = ?auto_432137 ?auto_432146 ) ) ( not ( = ?auto_432138 ?auto_432139 ) ) ( not ( = ?auto_432138 ?auto_432140 ) ) ( not ( = ?auto_432138 ?auto_432141 ) ) ( not ( = ?auto_432138 ?auto_432142 ) ) ( not ( = ?auto_432138 ?auto_432143 ) ) ( not ( = ?auto_432138 ?auto_432144 ) ) ( not ( = ?auto_432138 ?auto_432145 ) ) ( not ( = ?auto_432138 ?auto_432146 ) ) ( not ( = ?auto_432139 ?auto_432140 ) ) ( not ( = ?auto_432139 ?auto_432141 ) ) ( not ( = ?auto_432139 ?auto_432142 ) ) ( not ( = ?auto_432139 ?auto_432143 ) ) ( not ( = ?auto_432139 ?auto_432144 ) ) ( not ( = ?auto_432139 ?auto_432145 ) ) ( not ( = ?auto_432139 ?auto_432146 ) ) ( not ( = ?auto_432140 ?auto_432141 ) ) ( not ( = ?auto_432140 ?auto_432142 ) ) ( not ( = ?auto_432140 ?auto_432143 ) ) ( not ( = ?auto_432140 ?auto_432144 ) ) ( not ( = ?auto_432140 ?auto_432145 ) ) ( not ( = ?auto_432140 ?auto_432146 ) ) ( not ( = ?auto_432141 ?auto_432142 ) ) ( not ( = ?auto_432141 ?auto_432143 ) ) ( not ( = ?auto_432141 ?auto_432144 ) ) ( not ( = ?auto_432141 ?auto_432145 ) ) ( not ( = ?auto_432141 ?auto_432146 ) ) ( not ( = ?auto_432142 ?auto_432143 ) ) ( not ( = ?auto_432142 ?auto_432144 ) ) ( not ( = ?auto_432142 ?auto_432145 ) ) ( not ( = ?auto_432142 ?auto_432146 ) ) ( not ( = ?auto_432143 ?auto_432144 ) ) ( not ( = ?auto_432143 ?auto_432145 ) ) ( not ( = ?auto_432143 ?auto_432146 ) ) ( not ( = ?auto_432144 ?auto_432145 ) ) ( not ( = ?auto_432144 ?auto_432146 ) ) ( not ( = ?auto_432145 ?auto_432146 ) ) ( ON ?auto_432144 ?auto_432145 ) ( ON ?auto_432143 ?auto_432144 ) ( ON ?auto_432142 ?auto_432143 ) ( CLEAR ?auto_432140 ) ( ON ?auto_432141 ?auto_432142 ) ( CLEAR ?auto_432141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_432132 ?auto_432133 ?auto_432134 ?auto_432135 ?auto_432136 ?auto_432137 ?auto_432138 ?auto_432139 ?auto_432140 ?auto_432141 )
      ( MAKE-14PILE ?auto_432132 ?auto_432133 ?auto_432134 ?auto_432135 ?auto_432136 ?auto_432137 ?auto_432138 ?auto_432139 ?auto_432140 ?auto_432141 ?auto_432142 ?auto_432143 ?auto_432144 ?auto_432145 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432161 - BLOCK
      ?auto_432162 - BLOCK
      ?auto_432163 - BLOCK
      ?auto_432164 - BLOCK
      ?auto_432165 - BLOCK
      ?auto_432166 - BLOCK
      ?auto_432167 - BLOCK
      ?auto_432168 - BLOCK
      ?auto_432169 - BLOCK
      ?auto_432170 - BLOCK
      ?auto_432171 - BLOCK
      ?auto_432172 - BLOCK
      ?auto_432173 - BLOCK
      ?auto_432174 - BLOCK
    )
    :vars
    (
      ?auto_432175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432174 ?auto_432175 ) ( ON-TABLE ?auto_432161 ) ( ON ?auto_432162 ?auto_432161 ) ( ON ?auto_432163 ?auto_432162 ) ( ON ?auto_432164 ?auto_432163 ) ( ON ?auto_432165 ?auto_432164 ) ( ON ?auto_432166 ?auto_432165 ) ( ON ?auto_432167 ?auto_432166 ) ( ON ?auto_432168 ?auto_432167 ) ( ON ?auto_432169 ?auto_432168 ) ( not ( = ?auto_432161 ?auto_432162 ) ) ( not ( = ?auto_432161 ?auto_432163 ) ) ( not ( = ?auto_432161 ?auto_432164 ) ) ( not ( = ?auto_432161 ?auto_432165 ) ) ( not ( = ?auto_432161 ?auto_432166 ) ) ( not ( = ?auto_432161 ?auto_432167 ) ) ( not ( = ?auto_432161 ?auto_432168 ) ) ( not ( = ?auto_432161 ?auto_432169 ) ) ( not ( = ?auto_432161 ?auto_432170 ) ) ( not ( = ?auto_432161 ?auto_432171 ) ) ( not ( = ?auto_432161 ?auto_432172 ) ) ( not ( = ?auto_432161 ?auto_432173 ) ) ( not ( = ?auto_432161 ?auto_432174 ) ) ( not ( = ?auto_432161 ?auto_432175 ) ) ( not ( = ?auto_432162 ?auto_432163 ) ) ( not ( = ?auto_432162 ?auto_432164 ) ) ( not ( = ?auto_432162 ?auto_432165 ) ) ( not ( = ?auto_432162 ?auto_432166 ) ) ( not ( = ?auto_432162 ?auto_432167 ) ) ( not ( = ?auto_432162 ?auto_432168 ) ) ( not ( = ?auto_432162 ?auto_432169 ) ) ( not ( = ?auto_432162 ?auto_432170 ) ) ( not ( = ?auto_432162 ?auto_432171 ) ) ( not ( = ?auto_432162 ?auto_432172 ) ) ( not ( = ?auto_432162 ?auto_432173 ) ) ( not ( = ?auto_432162 ?auto_432174 ) ) ( not ( = ?auto_432162 ?auto_432175 ) ) ( not ( = ?auto_432163 ?auto_432164 ) ) ( not ( = ?auto_432163 ?auto_432165 ) ) ( not ( = ?auto_432163 ?auto_432166 ) ) ( not ( = ?auto_432163 ?auto_432167 ) ) ( not ( = ?auto_432163 ?auto_432168 ) ) ( not ( = ?auto_432163 ?auto_432169 ) ) ( not ( = ?auto_432163 ?auto_432170 ) ) ( not ( = ?auto_432163 ?auto_432171 ) ) ( not ( = ?auto_432163 ?auto_432172 ) ) ( not ( = ?auto_432163 ?auto_432173 ) ) ( not ( = ?auto_432163 ?auto_432174 ) ) ( not ( = ?auto_432163 ?auto_432175 ) ) ( not ( = ?auto_432164 ?auto_432165 ) ) ( not ( = ?auto_432164 ?auto_432166 ) ) ( not ( = ?auto_432164 ?auto_432167 ) ) ( not ( = ?auto_432164 ?auto_432168 ) ) ( not ( = ?auto_432164 ?auto_432169 ) ) ( not ( = ?auto_432164 ?auto_432170 ) ) ( not ( = ?auto_432164 ?auto_432171 ) ) ( not ( = ?auto_432164 ?auto_432172 ) ) ( not ( = ?auto_432164 ?auto_432173 ) ) ( not ( = ?auto_432164 ?auto_432174 ) ) ( not ( = ?auto_432164 ?auto_432175 ) ) ( not ( = ?auto_432165 ?auto_432166 ) ) ( not ( = ?auto_432165 ?auto_432167 ) ) ( not ( = ?auto_432165 ?auto_432168 ) ) ( not ( = ?auto_432165 ?auto_432169 ) ) ( not ( = ?auto_432165 ?auto_432170 ) ) ( not ( = ?auto_432165 ?auto_432171 ) ) ( not ( = ?auto_432165 ?auto_432172 ) ) ( not ( = ?auto_432165 ?auto_432173 ) ) ( not ( = ?auto_432165 ?auto_432174 ) ) ( not ( = ?auto_432165 ?auto_432175 ) ) ( not ( = ?auto_432166 ?auto_432167 ) ) ( not ( = ?auto_432166 ?auto_432168 ) ) ( not ( = ?auto_432166 ?auto_432169 ) ) ( not ( = ?auto_432166 ?auto_432170 ) ) ( not ( = ?auto_432166 ?auto_432171 ) ) ( not ( = ?auto_432166 ?auto_432172 ) ) ( not ( = ?auto_432166 ?auto_432173 ) ) ( not ( = ?auto_432166 ?auto_432174 ) ) ( not ( = ?auto_432166 ?auto_432175 ) ) ( not ( = ?auto_432167 ?auto_432168 ) ) ( not ( = ?auto_432167 ?auto_432169 ) ) ( not ( = ?auto_432167 ?auto_432170 ) ) ( not ( = ?auto_432167 ?auto_432171 ) ) ( not ( = ?auto_432167 ?auto_432172 ) ) ( not ( = ?auto_432167 ?auto_432173 ) ) ( not ( = ?auto_432167 ?auto_432174 ) ) ( not ( = ?auto_432167 ?auto_432175 ) ) ( not ( = ?auto_432168 ?auto_432169 ) ) ( not ( = ?auto_432168 ?auto_432170 ) ) ( not ( = ?auto_432168 ?auto_432171 ) ) ( not ( = ?auto_432168 ?auto_432172 ) ) ( not ( = ?auto_432168 ?auto_432173 ) ) ( not ( = ?auto_432168 ?auto_432174 ) ) ( not ( = ?auto_432168 ?auto_432175 ) ) ( not ( = ?auto_432169 ?auto_432170 ) ) ( not ( = ?auto_432169 ?auto_432171 ) ) ( not ( = ?auto_432169 ?auto_432172 ) ) ( not ( = ?auto_432169 ?auto_432173 ) ) ( not ( = ?auto_432169 ?auto_432174 ) ) ( not ( = ?auto_432169 ?auto_432175 ) ) ( not ( = ?auto_432170 ?auto_432171 ) ) ( not ( = ?auto_432170 ?auto_432172 ) ) ( not ( = ?auto_432170 ?auto_432173 ) ) ( not ( = ?auto_432170 ?auto_432174 ) ) ( not ( = ?auto_432170 ?auto_432175 ) ) ( not ( = ?auto_432171 ?auto_432172 ) ) ( not ( = ?auto_432171 ?auto_432173 ) ) ( not ( = ?auto_432171 ?auto_432174 ) ) ( not ( = ?auto_432171 ?auto_432175 ) ) ( not ( = ?auto_432172 ?auto_432173 ) ) ( not ( = ?auto_432172 ?auto_432174 ) ) ( not ( = ?auto_432172 ?auto_432175 ) ) ( not ( = ?auto_432173 ?auto_432174 ) ) ( not ( = ?auto_432173 ?auto_432175 ) ) ( not ( = ?auto_432174 ?auto_432175 ) ) ( ON ?auto_432173 ?auto_432174 ) ( ON ?auto_432172 ?auto_432173 ) ( ON ?auto_432171 ?auto_432172 ) ( CLEAR ?auto_432169 ) ( ON ?auto_432170 ?auto_432171 ) ( CLEAR ?auto_432170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_432161 ?auto_432162 ?auto_432163 ?auto_432164 ?auto_432165 ?auto_432166 ?auto_432167 ?auto_432168 ?auto_432169 ?auto_432170 )
      ( MAKE-14PILE ?auto_432161 ?auto_432162 ?auto_432163 ?auto_432164 ?auto_432165 ?auto_432166 ?auto_432167 ?auto_432168 ?auto_432169 ?auto_432170 ?auto_432171 ?auto_432172 ?auto_432173 ?auto_432174 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432190 - BLOCK
      ?auto_432191 - BLOCK
      ?auto_432192 - BLOCK
      ?auto_432193 - BLOCK
      ?auto_432194 - BLOCK
      ?auto_432195 - BLOCK
      ?auto_432196 - BLOCK
      ?auto_432197 - BLOCK
      ?auto_432198 - BLOCK
      ?auto_432199 - BLOCK
      ?auto_432200 - BLOCK
      ?auto_432201 - BLOCK
      ?auto_432202 - BLOCK
      ?auto_432203 - BLOCK
    )
    :vars
    (
      ?auto_432204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432203 ?auto_432204 ) ( ON-TABLE ?auto_432190 ) ( ON ?auto_432191 ?auto_432190 ) ( ON ?auto_432192 ?auto_432191 ) ( ON ?auto_432193 ?auto_432192 ) ( ON ?auto_432194 ?auto_432193 ) ( ON ?auto_432195 ?auto_432194 ) ( ON ?auto_432196 ?auto_432195 ) ( ON ?auto_432197 ?auto_432196 ) ( not ( = ?auto_432190 ?auto_432191 ) ) ( not ( = ?auto_432190 ?auto_432192 ) ) ( not ( = ?auto_432190 ?auto_432193 ) ) ( not ( = ?auto_432190 ?auto_432194 ) ) ( not ( = ?auto_432190 ?auto_432195 ) ) ( not ( = ?auto_432190 ?auto_432196 ) ) ( not ( = ?auto_432190 ?auto_432197 ) ) ( not ( = ?auto_432190 ?auto_432198 ) ) ( not ( = ?auto_432190 ?auto_432199 ) ) ( not ( = ?auto_432190 ?auto_432200 ) ) ( not ( = ?auto_432190 ?auto_432201 ) ) ( not ( = ?auto_432190 ?auto_432202 ) ) ( not ( = ?auto_432190 ?auto_432203 ) ) ( not ( = ?auto_432190 ?auto_432204 ) ) ( not ( = ?auto_432191 ?auto_432192 ) ) ( not ( = ?auto_432191 ?auto_432193 ) ) ( not ( = ?auto_432191 ?auto_432194 ) ) ( not ( = ?auto_432191 ?auto_432195 ) ) ( not ( = ?auto_432191 ?auto_432196 ) ) ( not ( = ?auto_432191 ?auto_432197 ) ) ( not ( = ?auto_432191 ?auto_432198 ) ) ( not ( = ?auto_432191 ?auto_432199 ) ) ( not ( = ?auto_432191 ?auto_432200 ) ) ( not ( = ?auto_432191 ?auto_432201 ) ) ( not ( = ?auto_432191 ?auto_432202 ) ) ( not ( = ?auto_432191 ?auto_432203 ) ) ( not ( = ?auto_432191 ?auto_432204 ) ) ( not ( = ?auto_432192 ?auto_432193 ) ) ( not ( = ?auto_432192 ?auto_432194 ) ) ( not ( = ?auto_432192 ?auto_432195 ) ) ( not ( = ?auto_432192 ?auto_432196 ) ) ( not ( = ?auto_432192 ?auto_432197 ) ) ( not ( = ?auto_432192 ?auto_432198 ) ) ( not ( = ?auto_432192 ?auto_432199 ) ) ( not ( = ?auto_432192 ?auto_432200 ) ) ( not ( = ?auto_432192 ?auto_432201 ) ) ( not ( = ?auto_432192 ?auto_432202 ) ) ( not ( = ?auto_432192 ?auto_432203 ) ) ( not ( = ?auto_432192 ?auto_432204 ) ) ( not ( = ?auto_432193 ?auto_432194 ) ) ( not ( = ?auto_432193 ?auto_432195 ) ) ( not ( = ?auto_432193 ?auto_432196 ) ) ( not ( = ?auto_432193 ?auto_432197 ) ) ( not ( = ?auto_432193 ?auto_432198 ) ) ( not ( = ?auto_432193 ?auto_432199 ) ) ( not ( = ?auto_432193 ?auto_432200 ) ) ( not ( = ?auto_432193 ?auto_432201 ) ) ( not ( = ?auto_432193 ?auto_432202 ) ) ( not ( = ?auto_432193 ?auto_432203 ) ) ( not ( = ?auto_432193 ?auto_432204 ) ) ( not ( = ?auto_432194 ?auto_432195 ) ) ( not ( = ?auto_432194 ?auto_432196 ) ) ( not ( = ?auto_432194 ?auto_432197 ) ) ( not ( = ?auto_432194 ?auto_432198 ) ) ( not ( = ?auto_432194 ?auto_432199 ) ) ( not ( = ?auto_432194 ?auto_432200 ) ) ( not ( = ?auto_432194 ?auto_432201 ) ) ( not ( = ?auto_432194 ?auto_432202 ) ) ( not ( = ?auto_432194 ?auto_432203 ) ) ( not ( = ?auto_432194 ?auto_432204 ) ) ( not ( = ?auto_432195 ?auto_432196 ) ) ( not ( = ?auto_432195 ?auto_432197 ) ) ( not ( = ?auto_432195 ?auto_432198 ) ) ( not ( = ?auto_432195 ?auto_432199 ) ) ( not ( = ?auto_432195 ?auto_432200 ) ) ( not ( = ?auto_432195 ?auto_432201 ) ) ( not ( = ?auto_432195 ?auto_432202 ) ) ( not ( = ?auto_432195 ?auto_432203 ) ) ( not ( = ?auto_432195 ?auto_432204 ) ) ( not ( = ?auto_432196 ?auto_432197 ) ) ( not ( = ?auto_432196 ?auto_432198 ) ) ( not ( = ?auto_432196 ?auto_432199 ) ) ( not ( = ?auto_432196 ?auto_432200 ) ) ( not ( = ?auto_432196 ?auto_432201 ) ) ( not ( = ?auto_432196 ?auto_432202 ) ) ( not ( = ?auto_432196 ?auto_432203 ) ) ( not ( = ?auto_432196 ?auto_432204 ) ) ( not ( = ?auto_432197 ?auto_432198 ) ) ( not ( = ?auto_432197 ?auto_432199 ) ) ( not ( = ?auto_432197 ?auto_432200 ) ) ( not ( = ?auto_432197 ?auto_432201 ) ) ( not ( = ?auto_432197 ?auto_432202 ) ) ( not ( = ?auto_432197 ?auto_432203 ) ) ( not ( = ?auto_432197 ?auto_432204 ) ) ( not ( = ?auto_432198 ?auto_432199 ) ) ( not ( = ?auto_432198 ?auto_432200 ) ) ( not ( = ?auto_432198 ?auto_432201 ) ) ( not ( = ?auto_432198 ?auto_432202 ) ) ( not ( = ?auto_432198 ?auto_432203 ) ) ( not ( = ?auto_432198 ?auto_432204 ) ) ( not ( = ?auto_432199 ?auto_432200 ) ) ( not ( = ?auto_432199 ?auto_432201 ) ) ( not ( = ?auto_432199 ?auto_432202 ) ) ( not ( = ?auto_432199 ?auto_432203 ) ) ( not ( = ?auto_432199 ?auto_432204 ) ) ( not ( = ?auto_432200 ?auto_432201 ) ) ( not ( = ?auto_432200 ?auto_432202 ) ) ( not ( = ?auto_432200 ?auto_432203 ) ) ( not ( = ?auto_432200 ?auto_432204 ) ) ( not ( = ?auto_432201 ?auto_432202 ) ) ( not ( = ?auto_432201 ?auto_432203 ) ) ( not ( = ?auto_432201 ?auto_432204 ) ) ( not ( = ?auto_432202 ?auto_432203 ) ) ( not ( = ?auto_432202 ?auto_432204 ) ) ( not ( = ?auto_432203 ?auto_432204 ) ) ( ON ?auto_432202 ?auto_432203 ) ( ON ?auto_432201 ?auto_432202 ) ( ON ?auto_432200 ?auto_432201 ) ( ON ?auto_432199 ?auto_432200 ) ( CLEAR ?auto_432197 ) ( ON ?auto_432198 ?auto_432199 ) ( CLEAR ?auto_432198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_432190 ?auto_432191 ?auto_432192 ?auto_432193 ?auto_432194 ?auto_432195 ?auto_432196 ?auto_432197 ?auto_432198 )
      ( MAKE-14PILE ?auto_432190 ?auto_432191 ?auto_432192 ?auto_432193 ?auto_432194 ?auto_432195 ?auto_432196 ?auto_432197 ?auto_432198 ?auto_432199 ?auto_432200 ?auto_432201 ?auto_432202 ?auto_432203 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432219 - BLOCK
      ?auto_432220 - BLOCK
      ?auto_432221 - BLOCK
      ?auto_432222 - BLOCK
      ?auto_432223 - BLOCK
      ?auto_432224 - BLOCK
      ?auto_432225 - BLOCK
      ?auto_432226 - BLOCK
      ?auto_432227 - BLOCK
      ?auto_432228 - BLOCK
      ?auto_432229 - BLOCK
      ?auto_432230 - BLOCK
      ?auto_432231 - BLOCK
      ?auto_432232 - BLOCK
    )
    :vars
    (
      ?auto_432233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432232 ?auto_432233 ) ( ON-TABLE ?auto_432219 ) ( ON ?auto_432220 ?auto_432219 ) ( ON ?auto_432221 ?auto_432220 ) ( ON ?auto_432222 ?auto_432221 ) ( ON ?auto_432223 ?auto_432222 ) ( ON ?auto_432224 ?auto_432223 ) ( ON ?auto_432225 ?auto_432224 ) ( ON ?auto_432226 ?auto_432225 ) ( not ( = ?auto_432219 ?auto_432220 ) ) ( not ( = ?auto_432219 ?auto_432221 ) ) ( not ( = ?auto_432219 ?auto_432222 ) ) ( not ( = ?auto_432219 ?auto_432223 ) ) ( not ( = ?auto_432219 ?auto_432224 ) ) ( not ( = ?auto_432219 ?auto_432225 ) ) ( not ( = ?auto_432219 ?auto_432226 ) ) ( not ( = ?auto_432219 ?auto_432227 ) ) ( not ( = ?auto_432219 ?auto_432228 ) ) ( not ( = ?auto_432219 ?auto_432229 ) ) ( not ( = ?auto_432219 ?auto_432230 ) ) ( not ( = ?auto_432219 ?auto_432231 ) ) ( not ( = ?auto_432219 ?auto_432232 ) ) ( not ( = ?auto_432219 ?auto_432233 ) ) ( not ( = ?auto_432220 ?auto_432221 ) ) ( not ( = ?auto_432220 ?auto_432222 ) ) ( not ( = ?auto_432220 ?auto_432223 ) ) ( not ( = ?auto_432220 ?auto_432224 ) ) ( not ( = ?auto_432220 ?auto_432225 ) ) ( not ( = ?auto_432220 ?auto_432226 ) ) ( not ( = ?auto_432220 ?auto_432227 ) ) ( not ( = ?auto_432220 ?auto_432228 ) ) ( not ( = ?auto_432220 ?auto_432229 ) ) ( not ( = ?auto_432220 ?auto_432230 ) ) ( not ( = ?auto_432220 ?auto_432231 ) ) ( not ( = ?auto_432220 ?auto_432232 ) ) ( not ( = ?auto_432220 ?auto_432233 ) ) ( not ( = ?auto_432221 ?auto_432222 ) ) ( not ( = ?auto_432221 ?auto_432223 ) ) ( not ( = ?auto_432221 ?auto_432224 ) ) ( not ( = ?auto_432221 ?auto_432225 ) ) ( not ( = ?auto_432221 ?auto_432226 ) ) ( not ( = ?auto_432221 ?auto_432227 ) ) ( not ( = ?auto_432221 ?auto_432228 ) ) ( not ( = ?auto_432221 ?auto_432229 ) ) ( not ( = ?auto_432221 ?auto_432230 ) ) ( not ( = ?auto_432221 ?auto_432231 ) ) ( not ( = ?auto_432221 ?auto_432232 ) ) ( not ( = ?auto_432221 ?auto_432233 ) ) ( not ( = ?auto_432222 ?auto_432223 ) ) ( not ( = ?auto_432222 ?auto_432224 ) ) ( not ( = ?auto_432222 ?auto_432225 ) ) ( not ( = ?auto_432222 ?auto_432226 ) ) ( not ( = ?auto_432222 ?auto_432227 ) ) ( not ( = ?auto_432222 ?auto_432228 ) ) ( not ( = ?auto_432222 ?auto_432229 ) ) ( not ( = ?auto_432222 ?auto_432230 ) ) ( not ( = ?auto_432222 ?auto_432231 ) ) ( not ( = ?auto_432222 ?auto_432232 ) ) ( not ( = ?auto_432222 ?auto_432233 ) ) ( not ( = ?auto_432223 ?auto_432224 ) ) ( not ( = ?auto_432223 ?auto_432225 ) ) ( not ( = ?auto_432223 ?auto_432226 ) ) ( not ( = ?auto_432223 ?auto_432227 ) ) ( not ( = ?auto_432223 ?auto_432228 ) ) ( not ( = ?auto_432223 ?auto_432229 ) ) ( not ( = ?auto_432223 ?auto_432230 ) ) ( not ( = ?auto_432223 ?auto_432231 ) ) ( not ( = ?auto_432223 ?auto_432232 ) ) ( not ( = ?auto_432223 ?auto_432233 ) ) ( not ( = ?auto_432224 ?auto_432225 ) ) ( not ( = ?auto_432224 ?auto_432226 ) ) ( not ( = ?auto_432224 ?auto_432227 ) ) ( not ( = ?auto_432224 ?auto_432228 ) ) ( not ( = ?auto_432224 ?auto_432229 ) ) ( not ( = ?auto_432224 ?auto_432230 ) ) ( not ( = ?auto_432224 ?auto_432231 ) ) ( not ( = ?auto_432224 ?auto_432232 ) ) ( not ( = ?auto_432224 ?auto_432233 ) ) ( not ( = ?auto_432225 ?auto_432226 ) ) ( not ( = ?auto_432225 ?auto_432227 ) ) ( not ( = ?auto_432225 ?auto_432228 ) ) ( not ( = ?auto_432225 ?auto_432229 ) ) ( not ( = ?auto_432225 ?auto_432230 ) ) ( not ( = ?auto_432225 ?auto_432231 ) ) ( not ( = ?auto_432225 ?auto_432232 ) ) ( not ( = ?auto_432225 ?auto_432233 ) ) ( not ( = ?auto_432226 ?auto_432227 ) ) ( not ( = ?auto_432226 ?auto_432228 ) ) ( not ( = ?auto_432226 ?auto_432229 ) ) ( not ( = ?auto_432226 ?auto_432230 ) ) ( not ( = ?auto_432226 ?auto_432231 ) ) ( not ( = ?auto_432226 ?auto_432232 ) ) ( not ( = ?auto_432226 ?auto_432233 ) ) ( not ( = ?auto_432227 ?auto_432228 ) ) ( not ( = ?auto_432227 ?auto_432229 ) ) ( not ( = ?auto_432227 ?auto_432230 ) ) ( not ( = ?auto_432227 ?auto_432231 ) ) ( not ( = ?auto_432227 ?auto_432232 ) ) ( not ( = ?auto_432227 ?auto_432233 ) ) ( not ( = ?auto_432228 ?auto_432229 ) ) ( not ( = ?auto_432228 ?auto_432230 ) ) ( not ( = ?auto_432228 ?auto_432231 ) ) ( not ( = ?auto_432228 ?auto_432232 ) ) ( not ( = ?auto_432228 ?auto_432233 ) ) ( not ( = ?auto_432229 ?auto_432230 ) ) ( not ( = ?auto_432229 ?auto_432231 ) ) ( not ( = ?auto_432229 ?auto_432232 ) ) ( not ( = ?auto_432229 ?auto_432233 ) ) ( not ( = ?auto_432230 ?auto_432231 ) ) ( not ( = ?auto_432230 ?auto_432232 ) ) ( not ( = ?auto_432230 ?auto_432233 ) ) ( not ( = ?auto_432231 ?auto_432232 ) ) ( not ( = ?auto_432231 ?auto_432233 ) ) ( not ( = ?auto_432232 ?auto_432233 ) ) ( ON ?auto_432231 ?auto_432232 ) ( ON ?auto_432230 ?auto_432231 ) ( ON ?auto_432229 ?auto_432230 ) ( ON ?auto_432228 ?auto_432229 ) ( CLEAR ?auto_432226 ) ( ON ?auto_432227 ?auto_432228 ) ( CLEAR ?auto_432227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_432219 ?auto_432220 ?auto_432221 ?auto_432222 ?auto_432223 ?auto_432224 ?auto_432225 ?auto_432226 ?auto_432227 )
      ( MAKE-14PILE ?auto_432219 ?auto_432220 ?auto_432221 ?auto_432222 ?auto_432223 ?auto_432224 ?auto_432225 ?auto_432226 ?auto_432227 ?auto_432228 ?auto_432229 ?auto_432230 ?auto_432231 ?auto_432232 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432248 - BLOCK
      ?auto_432249 - BLOCK
      ?auto_432250 - BLOCK
      ?auto_432251 - BLOCK
      ?auto_432252 - BLOCK
      ?auto_432253 - BLOCK
      ?auto_432254 - BLOCK
      ?auto_432255 - BLOCK
      ?auto_432256 - BLOCK
      ?auto_432257 - BLOCK
      ?auto_432258 - BLOCK
      ?auto_432259 - BLOCK
      ?auto_432260 - BLOCK
      ?auto_432261 - BLOCK
    )
    :vars
    (
      ?auto_432262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432261 ?auto_432262 ) ( ON-TABLE ?auto_432248 ) ( ON ?auto_432249 ?auto_432248 ) ( ON ?auto_432250 ?auto_432249 ) ( ON ?auto_432251 ?auto_432250 ) ( ON ?auto_432252 ?auto_432251 ) ( ON ?auto_432253 ?auto_432252 ) ( ON ?auto_432254 ?auto_432253 ) ( not ( = ?auto_432248 ?auto_432249 ) ) ( not ( = ?auto_432248 ?auto_432250 ) ) ( not ( = ?auto_432248 ?auto_432251 ) ) ( not ( = ?auto_432248 ?auto_432252 ) ) ( not ( = ?auto_432248 ?auto_432253 ) ) ( not ( = ?auto_432248 ?auto_432254 ) ) ( not ( = ?auto_432248 ?auto_432255 ) ) ( not ( = ?auto_432248 ?auto_432256 ) ) ( not ( = ?auto_432248 ?auto_432257 ) ) ( not ( = ?auto_432248 ?auto_432258 ) ) ( not ( = ?auto_432248 ?auto_432259 ) ) ( not ( = ?auto_432248 ?auto_432260 ) ) ( not ( = ?auto_432248 ?auto_432261 ) ) ( not ( = ?auto_432248 ?auto_432262 ) ) ( not ( = ?auto_432249 ?auto_432250 ) ) ( not ( = ?auto_432249 ?auto_432251 ) ) ( not ( = ?auto_432249 ?auto_432252 ) ) ( not ( = ?auto_432249 ?auto_432253 ) ) ( not ( = ?auto_432249 ?auto_432254 ) ) ( not ( = ?auto_432249 ?auto_432255 ) ) ( not ( = ?auto_432249 ?auto_432256 ) ) ( not ( = ?auto_432249 ?auto_432257 ) ) ( not ( = ?auto_432249 ?auto_432258 ) ) ( not ( = ?auto_432249 ?auto_432259 ) ) ( not ( = ?auto_432249 ?auto_432260 ) ) ( not ( = ?auto_432249 ?auto_432261 ) ) ( not ( = ?auto_432249 ?auto_432262 ) ) ( not ( = ?auto_432250 ?auto_432251 ) ) ( not ( = ?auto_432250 ?auto_432252 ) ) ( not ( = ?auto_432250 ?auto_432253 ) ) ( not ( = ?auto_432250 ?auto_432254 ) ) ( not ( = ?auto_432250 ?auto_432255 ) ) ( not ( = ?auto_432250 ?auto_432256 ) ) ( not ( = ?auto_432250 ?auto_432257 ) ) ( not ( = ?auto_432250 ?auto_432258 ) ) ( not ( = ?auto_432250 ?auto_432259 ) ) ( not ( = ?auto_432250 ?auto_432260 ) ) ( not ( = ?auto_432250 ?auto_432261 ) ) ( not ( = ?auto_432250 ?auto_432262 ) ) ( not ( = ?auto_432251 ?auto_432252 ) ) ( not ( = ?auto_432251 ?auto_432253 ) ) ( not ( = ?auto_432251 ?auto_432254 ) ) ( not ( = ?auto_432251 ?auto_432255 ) ) ( not ( = ?auto_432251 ?auto_432256 ) ) ( not ( = ?auto_432251 ?auto_432257 ) ) ( not ( = ?auto_432251 ?auto_432258 ) ) ( not ( = ?auto_432251 ?auto_432259 ) ) ( not ( = ?auto_432251 ?auto_432260 ) ) ( not ( = ?auto_432251 ?auto_432261 ) ) ( not ( = ?auto_432251 ?auto_432262 ) ) ( not ( = ?auto_432252 ?auto_432253 ) ) ( not ( = ?auto_432252 ?auto_432254 ) ) ( not ( = ?auto_432252 ?auto_432255 ) ) ( not ( = ?auto_432252 ?auto_432256 ) ) ( not ( = ?auto_432252 ?auto_432257 ) ) ( not ( = ?auto_432252 ?auto_432258 ) ) ( not ( = ?auto_432252 ?auto_432259 ) ) ( not ( = ?auto_432252 ?auto_432260 ) ) ( not ( = ?auto_432252 ?auto_432261 ) ) ( not ( = ?auto_432252 ?auto_432262 ) ) ( not ( = ?auto_432253 ?auto_432254 ) ) ( not ( = ?auto_432253 ?auto_432255 ) ) ( not ( = ?auto_432253 ?auto_432256 ) ) ( not ( = ?auto_432253 ?auto_432257 ) ) ( not ( = ?auto_432253 ?auto_432258 ) ) ( not ( = ?auto_432253 ?auto_432259 ) ) ( not ( = ?auto_432253 ?auto_432260 ) ) ( not ( = ?auto_432253 ?auto_432261 ) ) ( not ( = ?auto_432253 ?auto_432262 ) ) ( not ( = ?auto_432254 ?auto_432255 ) ) ( not ( = ?auto_432254 ?auto_432256 ) ) ( not ( = ?auto_432254 ?auto_432257 ) ) ( not ( = ?auto_432254 ?auto_432258 ) ) ( not ( = ?auto_432254 ?auto_432259 ) ) ( not ( = ?auto_432254 ?auto_432260 ) ) ( not ( = ?auto_432254 ?auto_432261 ) ) ( not ( = ?auto_432254 ?auto_432262 ) ) ( not ( = ?auto_432255 ?auto_432256 ) ) ( not ( = ?auto_432255 ?auto_432257 ) ) ( not ( = ?auto_432255 ?auto_432258 ) ) ( not ( = ?auto_432255 ?auto_432259 ) ) ( not ( = ?auto_432255 ?auto_432260 ) ) ( not ( = ?auto_432255 ?auto_432261 ) ) ( not ( = ?auto_432255 ?auto_432262 ) ) ( not ( = ?auto_432256 ?auto_432257 ) ) ( not ( = ?auto_432256 ?auto_432258 ) ) ( not ( = ?auto_432256 ?auto_432259 ) ) ( not ( = ?auto_432256 ?auto_432260 ) ) ( not ( = ?auto_432256 ?auto_432261 ) ) ( not ( = ?auto_432256 ?auto_432262 ) ) ( not ( = ?auto_432257 ?auto_432258 ) ) ( not ( = ?auto_432257 ?auto_432259 ) ) ( not ( = ?auto_432257 ?auto_432260 ) ) ( not ( = ?auto_432257 ?auto_432261 ) ) ( not ( = ?auto_432257 ?auto_432262 ) ) ( not ( = ?auto_432258 ?auto_432259 ) ) ( not ( = ?auto_432258 ?auto_432260 ) ) ( not ( = ?auto_432258 ?auto_432261 ) ) ( not ( = ?auto_432258 ?auto_432262 ) ) ( not ( = ?auto_432259 ?auto_432260 ) ) ( not ( = ?auto_432259 ?auto_432261 ) ) ( not ( = ?auto_432259 ?auto_432262 ) ) ( not ( = ?auto_432260 ?auto_432261 ) ) ( not ( = ?auto_432260 ?auto_432262 ) ) ( not ( = ?auto_432261 ?auto_432262 ) ) ( ON ?auto_432260 ?auto_432261 ) ( ON ?auto_432259 ?auto_432260 ) ( ON ?auto_432258 ?auto_432259 ) ( ON ?auto_432257 ?auto_432258 ) ( ON ?auto_432256 ?auto_432257 ) ( CLEAR ?auto_432254 ) ( ON ?auto_432255 ?auto_432256 ) ( CLEAR ?auto_432255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_432248 ?auto_432249 ?auto_432250 ?auto_432251 ?auto_432252 ?auto_432253 ?auto_432254 ?auto_432255 )
      ( MAKE-14PILE ?auto_432248 ?auto_432249 ?auto_432250 ?auto_432251 ?auto_432252 ?auto_432253 ?auto_432254 ?auto_432255 ?auto_432256 ?auto_432257 ?auto_432258 ?auto_432259 ?auto_432260 ?auto_432261 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432277 - BLOCK
      ?auto_432278 - BLOCK
      ?auto_432279 - BLOCK
      ?auto_432280 - BLOCK
      ?auto_432281 - BLOCK
      ?auto_432282 - BLOCK
      ?auto_432283 - BLOCK
      ?auto_432284 - BLOCK
      ?auto_432285 - BLOCK
      ?auto_432286 - BLOCK
      ?auto_432287 - BLOCK
      ?auto_432288 - BLOCK
      ?auto_432289 - BLOCK
      ?auto_432290 - BLOCK
    )
    :vars
    (
      ?auto_432291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432290 ?auto_432291 ) ( ON-TABLE ?auto_432277 ) ( ON ?auto_432278 ?auto_432277 ) ( ON ?auto_432279 ?auto_432278 ) ( ON ?auto_432280 ?auto_432279 ) ( ON ?auto_432281 ?auto_432280 ) ( ON ?auto_432282 ?auto_432281 ) ( ON ?auto_432283 ?auto_432282 ) ( not ( = ?auto_432277 ?auto_432278 ) ) ( not ( = ?auto_432277 ?auto_432279 ) ) ( not ( = ?auto_432277 ?auto_432280 ) ) ( not ( = ?auto_432277 ?auto_432281 ) ) ( not ( = ?auto_432277 ?auto_432282 ) ) ( not ( = ?auto_432277 ?auto_432283 ) ) ( not ( = ?auto_432277 ?auto_432284 ) ) ( not ( = ?auto_432277 ?auto_432285 ) ) ( not ( = ?auto_432277 ?auto_432286 ) ) ( not ( = ?auto_432277 ?auto_432287 ) ) ( not ( = ?auto_432277 ?auto_432288 ) ) ( not ( = ?auto_432277 ?auto_432289 ) ) ( not ( = ?auto_432277 ?auto_432290 ) ) ( not ( = ?auto_432277 ?auto_432291 ) ) ( not ( = ?auto_432278 ?auto_432279 ) ) ( not ( = ?auto_432278 ?auto_432280 ) ) ( not ( = ?auto_432278 ?auto_432281 ) ) ( not ( = ?auto_432278 ?auto_432282 ) ) ( not ( = ?auto_432278 ?auto_432283 ) ) ( not ( = ?auto_432278 ?auto_432284 ) ) ( not ( = ?auto_432278 ?auto_432285 ) ) ( not ( = ?auto_432278 ?auto_432286 ) ) ( not ( = ?auto_432278 ?auto_432287 ) ) ( not ( = ?auto_432278 ?auto_432288 ) ) ( not ( = ?auto_432278 ?auto_432289 ) ) ( not ( = ?auto_432278 ?auto_432290 ) ) ( not ( = ?auto_432278 ?auto_432291 ) ) ( not ( = ?auto_432279 ?auto_432280 ) ) ( not ( = ?auto_432279 ?auto_432281 ) ) ( not ( = ?auto_432279 ?auto_432282 ) ) ( not ( = ?auto_432279 ?auto_432283 ) ) ( not ( = ?auto_432279 ?auto_432284 ) ) ( not ( = ?auto_432279 ?auto_432285 ) ) ( not ( = ?auto_432279 ?auto_432286 ) ) ( not ( = ?auto_432279 ?auto_432287 ) ) ( not ( = ?auto_432279 ?auto_432288 ) ) ( not ( = ?auto_432279 ?auto_432289 ) ) ( not ( = ?auto_432279 ?auto_432290 ) ) ( not ( = ?auto_432279 ?auto_432291 ) ) ( not ( = ?auto_432280 ?auto_432281 ) ) ( not ( = ?auto_432280 ?auto_432282 ) ) ( not ( = ?auto_432280 ?auto_432283 ) ) ( not ( = ?auto_432280 ?auto_432284 ) ) ( not ( = ?auto_432280 ?auto_432285 ) ) ( not ( = ?auto_432280 ?auto_432286 ) ) ( not ( = ?auto_432280 ?auto_432287 ) ) ( not ( = ?auto_432280 ?auto_432288 ) ) ( not ( = ?auto_432280 ?auto_432289 ) ) ( not ( = ?auto_432280 ?auto_432290 ) ) ( not ( = ?auto_432280 ?auto_432291 ) ) ( not ( = ?auto_432281 ?auto_432282 ) ) ( not ( = ?auto_432281 ?auto_432283 ) ) ( not ( = ?auto_432281 ?auto_432284 ) ) ( not ( = ?auto_432281 ?auto_432285 ) ) ( not ( = ?auto_432281 ?auto_432286 ) ) ( not ( = ?auto_432281 ?auto_432287 ) ) ( not ( = ?auto_432281 ?auto_432288 ) ) ( not ( = ?auto_432281 ?auto_432289 ) ) ( not ( = ?auto_432281 ?auto_432290 ) ) ( not ( = ?auto_432281 ?auto_432291 ) ) ( not ( = ?auto_432282 ?auto_432283 ) ) ( not ( = ?auto_432282 ?auto_432284 ) ) ( not ( = ?auto_432282 ?auto_432285 ) ) ( not ( = ?auto_432282 ?auto_432286 ) ) ( not ( = ?auto_432282 ?auto_432287 ) ) ( not ( = ?auto_432282 ?auto_432288 ) ) ( not ( = ?auto_432282 ?auto_432289 ) ) ( not ( = ?auto_432282 ?auto_432290 ) ) ( not ( = ?auto_432282 ?auto_432291 ) ) ( not ( = ?auto_432283 ?auto_432284 ) ) ( not ( = ?auto_432283 ?auto_432285 ) ) ( not ( = ?auto_432283 ?auto_432286 ) ) ( not ( = ?auto_432283 ?auto_432287 ) ) ( not ( = ?auto_432283 ?auto_432288 ) ) ( not ( = ?auto_432283 ?auto_432289 ) ) ( not ( = ?auto_432283 ?auto_432290 ) ) ( not ( = ?auto_432283 ?auto_432291 ) ) ( not ( = ?auto_432284 ?auto_432285 ) ) ( not ( = ?auto_432284 ?auto_432286 ) ) ( not ( = ?auto_432284 ?auto_432287 ) ) ( not ( = ?auto_432284 ?auto_432288 ) ) ( not ( = ?auto_432284 ?auto_432289 ) ) ( not ( = ?auto_432284 ?auto_432290 ) ) ( not ( = ?auto_432284 ?auto_432291 ) ) ( not ( = ?auto_432285 ?auto_432286 ) ) ( not ( = ?auto_432285 ?auto_432287 ) ) ( not ( = ?auto_432285 ?auto_432288 ) ) ( not ( = ?auto_432285 ?auto_432289 ) ) ( not ( = ?auto_432285 ?auto_432290 ) ) ( not ( = ?auto_432285 ?auto_432291 ) ) ( not ( = ?auto_432286 ?auto_432287 ) ) ( not ( = ?auto_432286 ?auto_432288 ) ) ( not ( = ?auto_432286 ?auto_432289 ) ) ( not ( = ?auto_432286 ?auto_432290 ) ) ( not ( = ?auto_432286 ?auto_432291 ) ) ( not ( = ?auto_432287 ?auto_432288 ) ) ( not ( = ?auto_432287 ?auto_432289 ) ) ( not ( = ?auto_432287 ?auto_432290 ) ) ( not ( = ?auto_432287 ?auto_432291 ) ) ( not ( = ?auto_432288 ?auto_432289 ) ) ( not ( = ?auto_432288 ?auto_432290 ) ) ( not ( = ?auto_432288 ?auto_432291 ) ) ( not ( = ?auto_432289 ?auto_432290 ) ) ( not ( = ?auto_432289 ?auto_432291 ) ) ( not ( = ?auto_432290 ?auto_432291 ) ) ( ON ?auto_432289 ?auto_432290 ) ( ON ?auto_432288 ?auto_432289 ) ( ON ?auto_432287 ?auto_432288 ) ( ON ?auto_432286 ?auto_432287 ) ( ON ?auto_432285 ?auto_432286 ) ( CLEAR ?auto_432283 ) ( ON ?auto_432284 ?auto_432285 ) ( CLEAR ?auto_432284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_432277 ?auto_432278 ?auto_432279 ?auto_432280 ?auto_432281 ?auto_432282 ?auto_432283 ?auto_432284 )
      ( MAKE-14PILE ?auto_432277 ?auto_432278 ?auto_432279 ?auto_432280 ?auto_432281 ?auto_432282 ?auto_432283 ?auto_432284 ?auto_432285 ?auto_432286 ?auto_432287 ?auto_432288 ?auto_432289 ?auto_432290 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432306 - BLOCK
      ?auto_432307 - BLOCK
      ?auto_432308 - BLOCK
      ?auto_432309 - BLOCK
      ?auto_432310 - BLOCK
      ?auto_432311 - BLOCK
      ?auto_432312 - BLOCK
      ?auto_432313 - BLOCK
      ?auto_432314 - BLOCK
      ?auto_432315 - BLOCK
      ?auto_432316 - BLOCK
      ?auto_432317 - BLOCK
      ?auto_432318 - BLOCK
      ?auto_432319 - BLOCK
    )
    :vars
    (
      ?auto_432320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432319 ?auto_432320 ) ( ON-TABLE ?auto_432306 ) ( ON ?auto_432307 ?auto_432306 ) ( ON ?auto_432308 ?auto_432307 ) ( ON ?auto_432309 ?auto_432308 ) ( ON ?auto_432310 ?auto_432309 ) ( ON ?auto_432311 ?auto_432310 ) ( not ( = ?auto_432306 ?auto_432307 ) ) ( not ( = ?auto_432306 ?auto_432308 ) ) ( not ( = ?auto_432306 ?auto_432309 ) ) ( not ( = ?auto_432306 ?auto_432310 ) ) ( not ( = ?auto_432306 ?auto_432311 ) ) ( not ( = ?auto_432306 ?auto_432312 ) ) ( not ( = ?auto_432306 ?auto_432313 ) ) ( not ( = ?auto_432306 ?auto_432314 ) ) ( not ( = ?auto_432306 ?auto_432315 ) ) ( not ( = ?auto_432306 ?auto_432316 ) ) ( not ( = ?auto_432306 ?auto_432317 ) ) ( not ( = ?auto_432306 ?auto_432318 ) ) ( not ( = ?auto_432306 ?auto_432319 ) ) ( not ( = ?auto_432306 ?auto_432320 ) ) ( not ( = ?auto_432307 ?auto_432308 ) ) ( not ( = ?auto_432307 ?auto_432309 ) ) ( not ( = ?auto_432307 ?auto_432310 ) ) ( not ( = ?auto_432307 ?auto_432311 ) ) ( not ( = ?auto_432307 ?auto_432312 ) ) ( not ( = ?auto_432307 ?auto_432313 ) ) ( not ( = ?auto_432307 ?auto_432314 ) ) ( not ( = ?auto_432307 ?auto_432315 ) ) ( not ( = ?auto_432307 ?auto_432316 ) ) ( not ( = ?auto_432307 ?auto_432317 ) ) ( not ( = ?auto_432307 ?auto_432318 ) ) ( not ( = ?auto_432307 ?auto_432319 ) ) ( not ( = ?auto_432307 ?auto_432320 ) ) ( not ( = ?auto_432308 ?auto_432309 ) ) ( not ( = ?auto_432308 ?auto_432310 ) ) ( not ( = ?auto_432308 ?auto_432311 ) ) ( not ( = ?auto_432308 ?auto_432312 ) ) ( not ( = ?auto_432308 ?auto_432313 ) ) ( not ( = ?auto_432308 ?auto_432314 ) ) ( not ( = ?auto_432308 ?auto_432315 ) ) ( not ( = ?auto_432308 ?auto_432316 ) ) ( not ( = ?auto_432308 ?auto_432317 ) ) ( not ( = ?auto_432308 ?auto_432318 ) ) ( not ( = ?auto_432308 ?auto_432319 ) ) ( not ( = ?auto_432308 ?auto_432320 ) ) ( not ( = ?auto_432309 ?auto_432310 ) ) ( not ( = ?auto_432309 ?auto_432311 ) ) ( not ( = ?auto_432309 ?auto_432312 ) ) ( not ( = ?auto_432309 ?auto_432313 ) ) ( not ( = ?auto_432309 ?auto_432314 ) ) ( not ( = ?auto_432309 ?auto_432315 ) ) ( not ( = ?auto_432309 ?auto_432316 ) ) ( not ( = ?auto_432309 ?auto_432317 ) ) ( not ( = ?auto_432309 ?auto_432318 ) ) ( not ( = ?auto_432309 ?auto_432319 ) ) ( not ( = ?auto_432309 ?auto_432320 ) ) ( not ( = ?auto_432310 ?auto_432311 ) ) ( not ( = ?auto_432310 ?auto_432312 ) ) ( not ( = ?auto_432310 ?auto_432313 ) ) ( not ( = ?auto_432310 ?auto_432314 ) ) ( not ( = ?auto_432310 ?auto_432315 ) ) ( not ( = ?auto_432310 ?auto_432316 ) ) ( not ( = ?auto_432310 ?auto_432317 ) ) ( not ( = ?auto_432310 ?auto_432318 ) ) ( not ( = ?auto_432310 ?auto_432319 ) ) ( not ( = ?auto_432310 ?auto_432320 ) ) ( not ( = ?auto_432311 ?auto_432312 ) ) ( not ( = ?auto_432311 ?auto_432313 ) ) ( not ( = ?auto_432311 ?auto_432314 ) ) ( not ( = ?auto_432311 ?auto_432315 ) ) ( not ( = ?auto_432311 ?auto_432316 ) ) ( not ( = ?auto_432311 ?auto_432317 ) ) ( not ( = ?auto_432311 ?auto_432318 ) ) ( not ( = ?auto_432311 ?auto_432319 ) ) ( not ( = ?auto_432311 ?auto_432320 ) ) ( not ( = ?auto_432312 ?auto_432313 ) ) ( not ( = ?auto_432312 ?auto_432314 ) ) ( not ( = ?auto_432312 ?auto_432315 ) ) ( not ( = ?auto_432312 ?auto_432316 ) ) ( not ( = ?auto_432312 ?auto_432317 ) ) ( not ( = ?auto_432312 ?auto_432318 ) ) ( not ( = ?auto_432312 ?auto_432319 ) ) ( not ( = ?auto_432312 ?auto_432320 ) ) ( not ( = ?auto_432313 ?auto_432314 ) ) ( not ( = ?auto_432313 ?auto_432315 ) ) ( not ( = ?auto_432313 ?auto_432316 ) ) ( not ( = ?auto_432313 ?auto_432317 ) ) ( not ( = ?auto_432313 ?auto_432318 ) ) ( not ( = ?auto_432313 ?auto_432319 ) ) ( not ( = ?auto_432313 ?auto_432320 ) ) ( not ( = ?auto_432314 ?auto_432315 ) ) ( not ( = ?auto_432314 ?auto_432316 ) ) ( not ( = ?auto_432314 ?auto_432317 ) ) ( not ( = ?auto_432314 ?auto_432318 ) ) ( not ( = ?auto_432314 ?auto_432319 ) ) ( not ( = ?auto_432314 ?auto_432320 ) ) ( not ( = ?auto_432315 ?auto_432316 ) ) ( not ( = ?auto_432315 ?auto_432317 ) ) ( not ( = ?auto_432315 ?auto_432318 ) ) ( not ( = ?auto_432315 ?auto_432319 ) ) ( not ( = ?auto_432315 ?auto_432320 ) ) ( not ( = ?auto_432316 ?auto_432317 ) ) ( not ( = ?auto_432316 ?auto_432318 ) ) ( not ( = ?auto_432316 ?auto_432319 ) ) ( not ( = ?auto_432316 ?auto_432320 ) ) ( not ( = ?auto_432317 ?auto_432318 ) ) ( not ( = ?auto_432317 ?auto_432319 ) ) ( not ( = ?auto_432317 ?auto_432320 ) ) ( not ( = ?auto_432318 ?auto_432319 ) ) ( not ( = ?auto_432318 ?auto_432320 ) ) ( not ( = ?auto_432319 ?auto_432320 ) ) ( ON ?auto_432318 ?auto_432319 ) ( ON ?auto_432317 ?auto_432318 ) ( ON ?auto_432316 ?auto_432317 ) ( ON ?auto_432315 ?auto_432316 ) ( ON ?auto_432314 ?auto_432315 ) ( ON ?auto_432313 ?auto_432314 ) ( CLEAR ?auto_432311 ) ( ON ?auto_432312 ?auto_432313 ) ( CLEAR ?auto_432312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_432306 ?auto_432307 ?auto_432308 ?auto_432309 ?auto_432310 ?auto_432311 ?auto_432312 )
      ( MAKE-14PILE ?auto_432306 ?auto_432307 ?auto_432308 ?auto_432309 ?auto_432310 ?auto_432311 ?auto_432312 ?auto_432313 ?auto_432314 ?auto_432315 ?auto_432316 ?auto_432317 ?auto_432318 ?auto_432319 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432335 - BLOCK
      ?auto_432336 - BLOCK
      ?auto_432337 - BLOCK
      ?auto_432338 - BLOCK
      ?auto_432339 - BLOCK
      ?auto_432340 - BLOCK
      ?auto_432341 - BLOCK
      ?auto_432342 - BLOCK
      ?auto_432343 - BLOCK
      ?auto_432344 - BLOCK
      ?auto_432345 - BLOCK
      ?auto_432346 - BLOCK
      ?auto_432347 - BLOCK
      ?auto_432348 - BLOCK
    )
    :vars
    (
      ?auto_432349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432348 ?auto_432349 ) ( ON-TABLE ?auto_432335 ) ( ON ?auto_432336 ?auto_432335 ) ( ON ?auto_432337 ?auto_432336 ) ( ON ?auto_432338 ?auto_432337 ) ( ON ?auto_432339 ?auto_432338 ) ( ON ?auto_432340 ?auto_432339 ) ( not ( = ?auto_432335 ?auto_432336 ) ) ( not ( = ?auto_432335 ?auto_432337 ) ) ( not ( = ?auto_432335 ?auto_432338 ) ) ( not ( = ?auto_432335 ?auto_432339 ) ) ( not ( = ?auto_432335 ?auto_432340 ) ) ( not ( = ?auto_432335 ?auto_432341 ) ) ( not ( = ?auto_432335 ?auto_432342 ) ) ( not ( = ?auto_432335 ?auto_432343 ) ) ( not ( = ?auto_432335 ?auto_432344 ) ) ( not ( = ?auto_432335 ?auto_432345 ) ) ( not ( = ?auto_432335 ?auto_432346 ) ) ( not ( = ?auto_432335 ?auto_432347 ) ) ( not ( = ?auto_432335 ?auto_432348 ) ) ( not ( = ?auto_432335 ?auto_432349 ) ) ( not ( = ?auto_432336 ?auto_432337 ) ) ( not ( = ?auto_432336 ?auto_432338 ) ) ( not ( = ?auto_432336 ?auto_432339 ) ) ( not ( = ?auto_432336 ?auto_432340 ) ) ( not ( = ?auto_432336 ?auto_432341 ) ) ( not ( = ?auto_432336 ?auto_432342 ) ) ( not ( = ?auto_432336 ?auto_432343 ) ) ( not ( = ?auto_432336 ?auto_432344 ) ) ( not ( = ?auto_432336 ?auto_432345 ) ) ( not ( = ?auto_432336 ?auto_432346 ) ) ( not ( = ?auto_432336 ?auto_432347 ) ) ( not ( = ?auto_432336 ?auto_432348 ) ) ( not ( = ?auto_432336 ?auto_432349 ) ) ( not ( = ?auto_432337 ?auto_432338 ) ) ( not ( = ?auto_432337 ?auto_432339 ) ) ( not ( = ?auto_432337 ?auto_432340 ) ) ( not ( = ?auto_432337 ?auto_432341 ) ) ( not ( = ?auto_432337 ?auto_432342 ) ) ( not ( = ?auto_432337 ?auto_432343 ) ) ( not ( = ?auto_432337 ?auto_432344 ) ) ( not ( = ?auto_432337 ?auto_432345 ) ) ( not ( = ?auto_432337 ?auto_432346 ) ) ( not ( = ?auto_432337 ?auto_432347 ) ) ( not ( = ?auto_432337 ?auto_432348 ) ) ( not ( = ?auto_432337 ?auto_432349 ) ) ( not ( = ?auto_432338 ?auto_432339 ) ) ( not ( = ?auto_432338 ?auto_432340 ) ) ( not ( = ?auto_432338 ?auto_432341 ) ) ( not ( = ?auto_432338 ?auto_432342 ) ) ( not ( = ?auto_432338 ?auto_432343 ) ) ( not ( = ?auto_432338 ?auto_432344 ) ) ( not ( = ?auto_432338 ?auto_432345 ) ) ( not ( = ?auto_432338 ?auto_432346 ) ) ( not ( = ?auto_432338 ?auto_432347 ) ) ( not ( = ?auto_432338 ?auto_432348 ) ) ( not ( = ?auto_432338 ?auto_432349 ) ) ( not ( = ?auto_432339 ?auto_432340 ) ) ( not ( = ?auto_432339 ?auto_432341 ) ) ( not ( = ?auto_432339 ?auto_432342 ) ) ( not ( = ?auto_432339 ?auto_432343 ) ) ( not ( = ?auto_432339 ?auto_432344 ) ) ( not ( = ?auto_432339 ?auto_432345 ) ) ( not ( = ?auto_432339 ?auto_432346 ) ) ( not ( = ?auto_432339 ?auto_432347 ) ) ( not ( = ?auto_432339 ?auto_432348 ) ) ( not ( = ?auto_432339 ?auto_432349 ) ) ( not ( = ?auto_432340 ?auto_432341 ) ) ( not ( = ?auto_432340 ?auto_432342 ) ) ( not ( = ?auto_432340 ?auto_432343 ) ) ( not ( = ?auto_432340 ?auto_432344 ) ) ( not ( = ?auto_432340 ?auto_432345 ) ) ( not ( = ?auto_432340 ?auto_432346 ) ) ( not ( = ?auto_432340 ?auto_432347 ) ) ( not ( = ?auto_432340 ?auto_432348 ) ) ( not ( = ?auto_432340 ?auto_432349 ) ) ( not ( = ?auto_432341 ?auto_432342 ) ) ( not ( = ?auto_432341 ?auto_432343 ) ) ( not ( = ?auto_432341 ?auto_432344 ) ) ( not ( = ?auto_432341 ?auto_432345 ) ) ( not ( = ?auto_432341 ?auto_432346 ) ) ( not ( = ?auto_432341 ?auto_432347 ) ) ( not ( = ?auto_432341 ?auto_432348 ) ) ( not ( = ?auto_432341 ?auto_432349 ) ) ( not ( = ?auto_432342 ?auto_432343 ) ) ( not ( = ?auto_432342 ?auto_432344 ) ) ( not ( = ?auto_432342 ?auto_432345 ) ) ( not ( = ?auto_432342 ?auto_432346 ) ) ( not ( = ?auto_432342 ?auto_432347 ) ) ( not ( = ?auto_432342 ?auto_432348 ) ) ( not ( = ?auto_432342 ?auto_432349 ) ) ( not ( = ?auto_432343 ?auto_432344 ) ) ( not ( = ?auto_432343 ?auto_432345 ) ) ( not ( = ?auto_432343 ?auto_432346 ) ) ( not ( = ?auto_432343 ?auto_432347 ) ) ( not ( = ?auto_432343 ?auto_432348 ) ) ( not ( = ?auto_432343 ?auto_432349 ) ) ( not ( = ?auto_432344 ?auto_432345 ) ) ( not ( = ?auto_432344 ?auto_432346 ) ) ( not ( = ?auto_432344 ?auto_432347 ) ) ( not ( = ?auto_432344 ?auto_432348 ) ) ( not ( = ?auto_432344 ?auto_432349 ) ) ( not ( = ?auto_432345 ?auto_432346 ) ) ( not ( = ?auto_432345 ?auto_432347 ) ) ( not ( = ?auto_432345 ?auto_432348 ) ) ( not ( = ?auto_432345 ?auto_432349 ) ) ( not ( = ?auto_432346 ?auto_432347 ) ) ( not ( = ?auto_432346 ?auto_432348 ) ) ( not ( = ?auto_432346 ?auto_432349 ) ) ( not ( = ?auto_432347 ?auto_432348 ) ) ( not ( = ?auto_432347 ?auto_432349 ) ) ( not ( = ?auto_432348 ?auto_432349 ) ) ( ON ?auto_432347 ?auto_432348 ) ( ON ?auto_432346 ?auto_432347 ) ( ON ?auto_432345 ?auto_432346 ) ( ON ?auto_432344 ?auto_432345 ) ( ON ?auto_432343 ?auto_432344 ) ( ON ?auto_432342 ?auto_432343 ) ( CLEAR ?auto_432340 ) ( ON ?auto_432341 ?auto_432342 ) ( CLEAR ?auto_432341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_432335 ?auto_432336 ?auto_432337 ?auto_432338 ?auto_432339 ?auto_432340 ?auto_432341 )
      ( MAKE-14PILE ?auto_432335 ?auto_432336 ?auto_432337 ?auto_432338 ?auto_432339 ?auto_432340 ?auto_432341 ?auto_432342 ?auto_432343 ?auto_432344 ?auto_432345 ?auto_432346 ?auto_432347 ?auto_432348 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432364 - BLOCK
      ?auto_432365 - BLOCK
      ?auto_432366 - BLOCK
      ?auto_432367 - BLOCK
      ?auto_432368 - BLOCK
      ?auto_432369 - BLOCK
      ?auto_432370 - BLOCK
      ?auto_432371 - BLOCK
      ?auto_432372 - BLOCK
      ?auto_432373 - BLOCK
      ?auto_432374 - BLOCK
      ?auto_432375 - BLOCK
      ?auto_432376 - BLOCK
      ?auto_432377 - BLOCK
    )
    :vars
    (
      ?auto_432378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432377 ?auto_432378 ) ( ON-TABLE ?auto_432364 ) ( ON ?auto_432365 ?auto_432364 ) ( ON ?auto_432366 ?auto_432365 ) ( ON ?auto_432367 ?auto_432366 ) ( ON ?auto_432368 ?auto_432367 ) ( not ( = ?auto_432364 ?auto_432365 ) ) ( not ( = ?auto_432364 ?auto_432366 ) ) ( not ( = ?auto_432364 ?auto_432367 ) ) ( not ( = ?auto_432364 ?auto_432368 ) ) ( not ( = ?auto_432364 ?auto_432369 ) ) ( not ( = ?auto_432364 ?auto_432370 ) ) ( not ( = ?auto_432364 ?auto_432371 ) ) ( not ( = ?auto_432364 ?auto_432372 ) ) ( not ( = ?auto_432364 ?auto_432373 ) ) ( not ( = ?auto_432364 ?auto_432374 ) ) ( not ( = ?auto_432364 ?auto_432375 ) ) ( not ( = ?auto_432364 ?auto_432376 ) ) ( not ( = ?auto_432364 ?auto_432377 ) ) ( not ( = ?auto_432364 ?auto_432378 ) ) ( not ( = ?auto_432365 ?auto_432366 ) ) ( not ( = ?auto_432365 ?auto_432367 ) ) ( not ( = ?auto_432365 ?auto_432368 ) ) ( not ( = ?auto_432365 ?auto_432369 ) ) ( not ( = ?auto_432365 ?auto_432370 ) ) ( not ( = ?auto_432365 ?auto_432371 ) ) ( not ( = ?auto_432365 ?auto_432372 ) ) ( not ( = ?auto_432365 ?auto_432373 ) ) ( not ( = ?auto_432365 ?auto_432374 ) ) ( not ( = ?auto_432365 ?auto_432375 ) ) ( not ( = ?auto_432365 ?auto_432376 ) ) ( not ( = ?auto_432365 ?auto_432377 ) ) ( not ( = ?auto_432365 ?auto_432378 ) ) ( not ( = ?auto_432366 ?auto_432367 ) ) ( not ( = ?auto_432366 ?auto_432368 ) ) ( not ( = ?auto_432366 ?auto_432369 ) ) ( not ( = ?auto_432366 ?auto_432370 ) ) ( not ( = ?auto_432366 ?auto_432371 ) ) ( not ( = ?auto_432366 ?auto_432372 ) ) ( not ( = ?auto_432366 ?auto_432373 ) ) ( not ( = ?auto_432366 ?auto_432374 ) ) ( not ( = ?auto_432366 ?auto_432375 ) ) ( not ( = ?auto_432366 ?auto_432376 ) ) ( not ( = ?auto_432366 ?auto_432377 ) ) ( not ( = ?auto_432366 ?auto_432378 ) ) ( not ( = ?auto_432367 ?auto_432368 ) ) ( not ( = ?auto_432367 ?auto_432369 ) ) ( not ( = ?auto_432367 ?auto_432370 ) ) ( not ( = ?auto_432367 ?auto_432371 ) ) ( not ( = ?auto_432367 ?auto_432372 ) ) ( not ( = ?auto_432367 ?auto_432373 ) ) ( not ( = ?auto_432367 ?auto_432374 ) ) ( not ( = ?auto_432367 ?auto_432375 ) ) ( not ( = ?auto_432367 ?auto_432376 ) ) ( not ( = ?auto_432367 ?auto_432377 ) ) ( not ( = ?auto_432367 ?auto_432378 ) ) ( not ( = ?auto_432368 ?auto_432369 ) ) ( not ( = ?auto_432368 ?auto_432370 ) ) ( not ( = ?auto_432368 ?auto_432371 ) ) ( not ( = ?auto_432368 ?auto_432372 ) ) ( not ( = ?auto_432368 ?auto_432373 ) ) ( not ( = ?auto_432368 ?auto_432374 ) ) ( not ( = ?auto_432368 ?auto_432375 ) ) ( not ( = ?auto_432368 ?auto_432376 ) ) ( not ( = ?auto_432368 ?auto_432377 ) ) ( not ( = ?auto_432368 ?auto_432378 ) ) ( not ( = ?auto_432369 ?auto_432370 ) ) ( not ( = ?auto_432369 ?auto_432371 ) ) ( not ( = ?auto_432369 ?auto_432372 ) ) ( not ( = ?auto_432369 ?auto_432373 ) ) ( not ( = ?auto_432369 ?auto_432374 ) ) ( not ( = ?auto_432369 ?auto_432375 ) ) ( not ( = ?auto_432369 ?auto_432376 ) ) ( not ( = ?auto_432369 ?auto_432377 ) ) ( not ( = ?auto_432369 ?auto_432378 ) ) ( not ( = ?auto_432370 ?auto_432371 ) ) ( not ( = ?auto_432370 ?auto_432372 ) ) ( not ( = ?auto_432370 ?auto_432373 ) ) ( not ( = ?auto_432370 ?auto_432374 ) ) ( not ( = ?auto_432370 ?auto_432375 ) ) ( not ( = ?auto_432370 ?auto_432376 ) ) ( not ( = ?auto_432370 ?auto_432377 ) ) ( not ( = ?auto_432370 ?auto_432378 ) ) ( not ( = ?auto_432371 ?auto_432372 ) ) ( not ( = ?auto_432371 ?auto_432373 ) ) ( not ( = ?auto_432371 ?auto_432374 ) ) ( not ( = ?auto_432371 ?auto_432375 ) ) ( not ( = ?auto_432371 ?auto_432376 ) ) ( not ( = ?auto_432371 ?auto_432377 ) ) ( not ( = ?auto_432371 ?auto_432378 ) ) ( not ( = ?auto_432372 ?auto_432373 ) ) ( not ( = ?auto_432372 ?auto_432374 ) ) ( not ( = ?auto_432372 ?auto_432375 ) ) ( not ( = ?auto_432372 ?auto_432376 ) ) ( not ( = ?auto_432372 ?auto_432377 ) ) ( not ( = ?auto_432372 ?auto_432378 ) ) ( not ( = ?auto_432373 ?auto_432374 ) ) ( not ( = ?auto_432373 ?auto_432375 ) ) ( not ( = ?auto_432373 ?auto_432376 ) ) ( not ( = ?auto_432373 ?auto_432377 ) ) ( not ( = ?auto_432373 ?auto_432378 ) ) ( not ( = ?auto_432374 ?auto_432375 ) ) ( not ( = ?auto_432374 ?auto_432376 ) ) ( not ( = ?auto_432374 ?auto_432377 ) ) ( not ( = ?auto_432374 ?auto_432378 ) ) ( not ( = ?auto_432375 ?auto_432376 ) ) ( not ( = ?auto_432375 ?auto_432377 ) ) ( not ( = ?auto_432375 ?auto_432378 ) ) ( not ( = ?auto_432376 ?auto_432377 ) ) ( not ( = ?auto_432376 ?auto_432378 ) ) ( not ( = ?auto_432377 ?auto_432378 ) ) ( ON ?auto_432376 ?auto_432377 ) ( ON ?auto_432375 ?auto_432376 ) ( ON ?auto_432374 ?auto_432375 ) ( ON ?auto_432373 ?auto_432374 ) ( ON ?auto_432372 ?auto_432373 ) ( ON ?auto_432371 ?auto_432372 ) ( ON ?auto_432370 ?auto_432371 ) ( CLEAR ?auto_432368 ) ( ON ?auto_432369 ?auto_432370 ) ( CLEAR ?auto_432369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_432364 ?auto_432365 ?auto_432366 ?auto_432367 ?auto_432368 ?auto_432369 )
      ( MAKE-14PILE ?auto_432364 ?auto_432365 ?auto_432366 ?auto_432367 ?auto_432368 ?auto_432369 ?auto_432370 ?auto_432371 ?auto_432372 ?auto_432373 ?auto_432374 ?auto_432375 ?auto_432376 ?auto_432377 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432393 - BLOCK
      ?auto_432394 - BLOCK
      ?auto_432395 - BLOCK
      ?auto_432396 - BLOCK
      ?auto_432397 - BLOCK
      ?auto_432398 - BLOCK
      ?auto_432399 - BLOCK
      ?auto_432400 - BLOCK
      ?auto_432401 - BLOCK
      ?auto_432402 - BLOCK
      ?auto_432403 - BLOCK
      ?auto_432404 - BLOCK
      ?auto_432405 - BLOCK
      ?auto_432406 - BLOCK
    )
    :vars
    (
      ?auto_432407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432406 ?auto_432407 ) ( ON-TABLE ?auto_432393 ) ( ON ?auto_432394 ?auto_432393 ) ( ON ?auto_432395 ?auto_432394 ) ( ON ?auto_432396 ?auto_432395 ) ( ON ?auto_432397 ?auto_432396 ) ( not ( = ?auto_432393 ?auto_432394 ) ) ( not ( = ?auto_432393 ?auto_432395 ) ) ( not ( = ?auto_432393 ?auto_432396 ) ) ( not ( = ?auto_432393 ?auto_432397 ) ) ( not ( = ?auto_432393 ?auto_432398 ) ) ( not ( = ?auto_432393 ?auto_432399 ) ) ( not ( = ?auto_432393 ?auto_432400 ) ) ( not ( = ?auto_432393 ?auto_432401 ) ) ( not ( = ?auto_432393 ?auto_432402 ) ) ( not ( = ?auto_432393 ?auto_432403 ) ) ( not ( = ?auto_432393 ?auto_432404 ) ) ( not ( = ?auto_432393 ?auto_432405 ) ) ( not ( = ?auto_432393 ?auto_432406 ) ) ( not ( = ?auto_432393 ?auto_432407 ) ) ( not ( = ?auto_432394 ?auto_432395 ) ) ( not ( = ?auto_432394 ?auto_432396 ) ) ( not ( = ?auto_432394 ?auto_432397 ) ) ( not ( = ?auto_432394 ?auto_432398 ) ) ( not ( = ?auto_432394 ?auto_432399 ) ) ( not ( = ?auto_432394 ?auto_432400 ) ) ( not ( = ?auto_432394 ?auto_432401 ) ) ( not ( = ?auto_432394 ?auto_432402 ) ) ( not ( = ?auto_432394 ?auto_432403 ) ) ( not ( = ?auto_432394 ?auto_432404 ) ) ( not ( = ?auto_432394 ?auto_432405 ) ) ( not ( = ?auto_432394 ?auto_432406 ) ) ( not ( = ?auto_432394 ?auto_432407 ) ) ( not ( = ?auto_432395 ?auto_432396 ) ) ( not ( = ?auto_432395 ?auto_432397 ) ) ( not ( = ?auto_432395 ?auto_432398 ) ) ( not ( = ?auto_432395 ?auto_432399 ) ) ( not ( = ?auto_432395 ?auto_432400 ) ) ( not ( = ?auto_432395 ?auto_432401 ) ) ( not ( = ?auto_432395 ?auto_432402 ) ) ( not ( = ?auto_432395 ?auto_432403 ) ) ( not ( = ?auto_432395 ?auto_432404 ) ) ( not ( = ?auto_432395 ?auto_432405 ) ) ( not ( = ?auto_432395 ?auto_432406 ) ) ( not ( = ?auto_432395 ?auto_432407 ) ) ( not ( = ?auto_432396 ?auto_432397 ) ) ( not ( = ?auto_432396 ?auto_432398 ) ) ( not ( = ?auto_432396 ?auto_432399 ) ) ( not ( = ?auto_432396 ?auto_432400 ) ) ( not ( = ?auto_432396 ?auto_432401 ) ) ( not ( = ?auto_432396 ?auto_432402 ) ) ( not ( = ?auto_432396 ?auto_432403 ) ) ( not ( = ?auto_432396 ?auto_432404 ) ) ( not ( = ?auto_432396 ?auto_432405 ) ) ( not ( = ?auto_432396 ?auto_432406 ) ) ( not ( = ?auto_432396 ?auto_432407 ) ) ( not ( = ?auto_432397 ?auto_432398 ) ) ( not ( = ?auto_432397 ?auto_432399 ) ) ( not ( = ?auto_432397 ?auto_432400 ) ) ( not ( = ?auto_432397 ?auto_432401 ) ) ( not ( = ?auto_432397 ?auto_432402 ) ) ( not ( = ?auto_432397 ?auto_432403 ) ) ( not ( = ?auto_432397 ?auto_432404 ) ) ( not ( = ?auto_432397 ?auto_432405 ) ) ( not ( = ?auto_432397 ?auto_432406 ) ) ( not ( = ?auto_432397 ?auto_432407 ) ) ( not ( = ?auto_432398 ?auto_432399 ) ) ( not ( = ?auto_432398 ?auto_432400 ) ) ( not ( = ?auto_432398 ?auto_432401 ) ) ( not ( = ?auto_432398 ?auto_432402 ) ) ( not ( = ?auto_432398 ?auto_432403 ) ) ( not ( = ?auto_432398 ?auto_432404 ) ) ( not ( = ?auto_432398 ?auto_432405 ) ) ( not ( = ?auto_432398 ?auto_432406 ) ) ( not ( = ?auto_432398 ?auto_432407 ) ) ( not ( = ?auto_432399 ?auto_432400 ) ) ( not ( = ?auto_432399 ?auto_432401 ) ) ( not ( = ?auto_432399 ?auto_432402 ) ) ( not ( = ?auto_432399 ?auto_432403 ) ) ( not ( = ?auto_432399 ?auto_432404 ) ) ( not ( = ?auto_432399 ?auto_432405 ) ) ( not ( = ?auto_432399 ?auto_432406 ) ) ( not ( = ?auto_432399 ?auto_432407 ) ) ( not ( = ?auto_432400 ?auto_432401 ) ) ( not ( = ?auto_432400 ?auto_432402 ) ) ( not ( = ?auto_432400 ?auto_432403 ) ) ( not ( = ?auto_432400 ?auto_432404 ) ) ( not ( = ?auto_432400 ?auto_432405 ) ) ( not ( = ?auto_432400 ?auto_432406 ) ) ( not ( = ?auto_432400 ?auto_432407 ) ) ( not ( = ?auto_432401 ?auto_432402 ) ) ( not ( = ?auto_432401 ?auto_432403 ) ) ( not ( = ?auto_432401 ?auto_432404 ) ) ( not ( = ?auto_432401 ?auto_432405 ) ) ( not ( = ?auto_432401 ?auto_432406 ) ) ( not ( = ?auto_432401 ?auto_432407 ) ) ( not ( = ?auto_432402 ?auto_432403 ) ) ( not ( = ?auto_432402 ?auto_432404 ) ) ( not ( = ?auto_432402 ?auto_432405 ) ) ( not ( = ?auto_432402 ?auto_432406 ) ) ( not ( = ?auto_432402 ?auto_432407 ) ) ( not ( = ?auto_432403 ?auto_432404 ) ) ( not ( = ?auto_432403 ?auto_432405 ) ) ( not ( = ?auto_432403 ?auto_432406 ) ) ( not ( = ?auto_432403 ?auto_432407 ) ) ( not ( = ?auto_432404 ?auto_432405 ) ) ( not ( = ?auto_432404 ?auto_432406 ) ) ( not ( = ?auto_432404 ?auto_432407 ) ) ( not ( = ?auto_432405 ?auto_432406 ) ) ( not ( = ?auto_432405 ?auto_432407 ) ) ( not ( = ?auto_432406 ?auto_432407 ) ) ( ON ?auto_432405 ?auto_432406 ) ( ON ?auto_432404 ?auto_432405 ) ( ON ?auto_432403 ?auto_432404 ) ( ON ?auto_432402 ?auto_432403 ) ( ON ?auto_432401 ?auto_432402 ) ( ON ?auto_432400 ?auto_432401 ) ( ON ?auto_432399 ?auto_432400 ) ( CLEAR ?auto_432397 ) ( ON ?auto_432398 ?auto_432399 ) ( CLEAR ?auto_432398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_432393 ?auto_432394 ?auto_432395 ?auto_432396 ?auto_432397 ?auto_432398 )
      ( MAKE-14PILE ?auto_432393 ?auto_432394 ?auto_432395 ?auto_432396 ?auto_432397 ?auto_432398 ?auto_432399 ?auto_432400 ?auto_432401 ?auto_432402 ?auto_432403 ?auto_432404 ?auto_432405 ?auto_432406 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432422 - BLOCK
      ?auto_432423 - BLOCK
      ?auto_432424 - BLOCK
      ?auto_432425 - BLOCK
      ?auto_432426 - BLOCK
      ?auto_432427 - BLOCK
      ?auto_432428 - BLOCK
      ?auto_432429 - BLOCK
      ?auto_432430 - BLOCK
      ?auto_432431 - BLOCK
      ?auto_432432 - BLOCK
      ?auto_432433 - BLOCK
      ?auto_432434 - BLOCK
      ?auto_432435 - BLOCK
    )
    :vars
    (
      ?auto_432436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432435 ?auto_432436 ) ( ON-TABLE ?auto_432422 ) ( ON ?auto_432423 ?auto_432422 ) ( ON ?auto_432424 ?auto_432423 ) ( ON ?auto_432425 ?auto_432424 ) ( not ( = ?auto_432422 ?auto_432423 ) ) ( not ( = ?auto_432422 ?auto_432424 ) ) ( not ( = ?auto_432422 ?auto_432425 ) ) ( not ( = ?auto_432422 ?auto_432426 ) ) ( not ( = ?auto_432422 ?auto_432427 ) ) ( not ( = ?auto_432422 ?auto_432428 ) ) ( not ( = ?auto_432422 ?auto_432429 ) ) ( not ( = ?auto_432422 ?auto_432430 ) ) ( not ( = ?auto_432422 ?auto_432431 ) ) ( not ( = ?auto_432422 ?auto_432432 ) ) ( not ( = ?auto_432422 ?auto_432433 ) ) ( not ( = ?auto_432422 ?auto_432434 ) ) ( not ( = ?auto_432422 ?auto_432435 ) ) ( not ( = ?auto_432422 ?auto_432436 ) ) ( not ( = ?auto_432423 ?auto_432424 ) ) ( not ( = ?auto_432423 ?auto_432425 ) ) ( not ( = ?auto_432423 ?auto_432426 ) ) ( not ( = ?auto_432423 ?auto_432427 ) ) ( not ( = ?auto_432423 ?auto_432428 ) ) ( not ( = ?auto_432423 ?auto_432429 ) ) ( not ( = ?auto_432423 ?auto_432430 ) ) ( not ( = ?auto_432423 ?auto_432431 ) ) ( not ( = ?auto_432423 ?auto_432432 ) ) ( not ( = ?auto_432423 ?auto_432433 ) ) ( not ( = ?auto_432423 ?auto_432434 ) ) ( not ( = ?auto_432423 ?auto_432435 ) ) ( not ( = ?auto_432423 ?auto_432436 ) ) ( not ( = ?auto_432424 ?auto_432425 ) ) ( not ( = ?auto_432424 ?auto_432426 ) ) ( not ( = ?auto_432424 ?auto_432427 ) ) ( not ( = ?auto_432424 ?auto_432428 ) ) ( not ( = ?auto_432424 ?auto_432429 ) ) ( not ( = ?auto_432424 ?auto_432430 ) ) ( not ( = ?auto_432424 ?auto_432431 ) ) ( not ( = ?auto_432424 ?auto_432432 ) ) ( not ( = ?auto_432424 ?auto_432433 ) ) ( not ( = ?auto_432424 ?auto_432434 ) ) ( not ( = ?auto_432424 ?auto_432435 ) ) ( not ( = ?auto_432424 ?auto_432436 ) ) ( not ( = ?auto_432425 ?auto_432426 ) ) ( not ( = ?auto_432425 ?auto_432427 ) ) ( not ( = ?auto_432425 ?auto_432428 ) ) ( not ( = ?auto_432425 ?auto_432429 ) ) ( not ( = ?auto_432425 ?auto_432430 ) ) ( not ( = ?auto_432425 ?auto_432431 ) ) ( not ( = ?auto_432425 ?auto_432432 ) ) ( not ( = ?auto_432425 ?auto_432433 ) ) ( not ( = ?auto_432425 ?auto_432434 ) ) ( not ( = ?auto_432425 ?auto_432435 ) ) ( not ( = ?auto_432425 ?auto_432436 ) ) ( not ( = ?auto_432426 ?auto_432427 ) ) ( not ( = ?auto_432426 ?auto_432428 ) ) ( not ( = ?auto_432426 ?auto_432429 ) ) ( not ( = ?auto_432426 ?auto_432430 ) ) ( not ( = ?auto_432426 ?auto_432431 ) ) ( not ( = ?auto_432426 ?auto_432432 ) ) ( not ( = ?auto_432426 ?auto_432433 ) ) ( not ( = ?auto_432426 ?auto_432434 ) ) ( not ( = ?auto_432426 ?auto_432435 ) ) ( not ( = ?auto_432426 ?auto_432436 ) ) ( not ( = ?auto_432427 ?auto_432428 ) ) ( not ( = ?auto_432427 ?auto_432429 ) ) ( not ( = ?auto_432427 ?auto_432430 ) ) ( not ( = ?auto_432427 ?auto_432431 ) ) ( not ( = ?auto_432427 ?auto_432432 ) ) ( not ( = ?auto_432427 ?auto_432433 ) ) ( not ( = ?auto_432427 ?auto_432434 ) ) ( not ( = ?auto_432427 ?auto_432435 ) ) ( not ( = ?auto_432427 ?auto_432436 ) ) ( not ( = ?auto_432428 ?auto_432429 ) ) ( not ( = ?auto_432428 ?auto_432430 ) ) ( not ( = ?auto_432428 ?auto_432431 ) ) ( not ( = ?auto_432428 ?auto_432432 ) ) ( not ( = ?auto_432428 ?auto_432433 ) ) ( not ( = ?auto_432428 ?auto_432434 ) ) ( not ( = ?auto_432428 ?auto_432435 ) ) ( not ( = ?auto_432428 ?auto_432436 ) ) ( not ( = ?auto_432429 ?auto_432430 ) ) ( not ( = ?auto_432429 ?auto_432431 ) ) ( not ( = ?auto_432429 ?auto_432432 ) ) ( not ( = ?auto_432429 ?auto_432433 ) ) ( not ( = ?auto_432429 ?auto_432434 ) ) ( not ( = ?auto_432429 ?auto_432435 ) ) ( not ( = ?auto_432429 ?auto_432436 ) ) ( not ( = ?auto_432430 ?auto_432431 ) ) ( not ( = ?auto_432430 ?auto_432432 ) ) ( not ( = ?auto_432430 ?auto_432433 ) ) ( not ( = ?auto_432430 ?auto_432434 ) ) ( not ( = ?auto_432430 ?auto_432435 ) ) ( not ( = ?auto_432430 ?auto_432436 ) ) ( not ( = ?auto_432431 ?auto_432432 ) ) ( not ( = ?auto_432431 ?auto_432433 ) ) ( not ( = ?auto_432431 ?auto_432434 ) ) ( not ( = ?auto_432431 ?auto_432435 ) ) ( not ( = ?auto_432431 ?auto_432436 ) ) ( not ( = ?auto_432432 ?auto_432433 ) ) ( not ( = ?auto_432432 ?auto_432434 ) ) ( not ( = ?auto_432432 ?auto_432435 ) ) ( not ( = ?auto_432432 ?auto_432436 ) ) ( not ( = ?auto_432433 ?auto_432434 ) ) ( not ( = ?auto_432433 ?auto_432435 ) ) ( not ( = ?auto_432433 ?auto_432436 ) ) ( not ( = ?auto_432434 ?auto_432435 ) ) ( not ( = ?auto_432434 ?auto_432436 ) ) ( not ( = ?auto_432435 ?auto_432436 ) ) ( ON ?auto_432434 ?auto_432435 ) ( ON ?auto_432433 ?auto_432434 ) ( ON ?auto_432432 ?auto_432433 ) ( ON ?auto_432431 ?auto_432432 ) ( ON ?auto_432430 ?auto_432431 ) ( ON ?auto_432429 ?auto_432430 ) ( ON ?auto_432428 ?auto_432429 ) ( ON ?auto_432427 ?auto_432428 ) ( CLEAR ?auto_432425 ) ( ON ?auto_432426 ?auto_432427 ) ( CLEAR ?auto_432426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_432422 ?auto_432423 ?auto_432424 ?auto_432425 ?auto_432426 )
      ( MAKE-14PILE ?auto_432422 ?auto_432423 ?auto_432424 ?auto_432425 ?auto_432426 ?auto_432427 ?auto_432428 ?auto_432429 ?auto_432430 ?auto_432431 ?auto_432432 ?auto_432433 ?auto_432434 ?auto_432435 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432451 - BLOCK
      ?auto_432452 - BLOCK
      ?auto_432453 - BLOCK
      ?auto_432454 - BLOCK
      ?auto_432455 - BLOCK
      ?auto_432456 - BLOCK
      ?auto_432457 - BLOCK
      ?auto_432458 - BLOCK
      ?auto_432459 - BLOCK
      ?auto_432460 - BLOCK
      ?auto_432461 - BLOCK
      ?auto_432462 - BLOCK
      ?auto_432463 - BLOCK
      ?auto_432464 - BLOCK
    )
    :vars
    (
      ?auto_432465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432464 ?auto_432465 ) ( ON-TABLE ?auto_432451 ) ( ON ?auto_432452 ?auto_432451 ) ( ON ?auto_432453 ?auto_432452 ) ( ON ?auto_432454 ?auto_432453 ) ( not ( = ?auto_432451 ?auto_432452 ) ) ( not ( = ?auto_432451 ?auto_432453 ) ) ( not ( = ?auto_432451 ?auto_432454 ) ) ( not ( = ?auto_432451 ?auto_432455 ) ) ( not ( = ?auto_432451 ?auto_432456 ) ) ( not ( = ?auto_432451 ?auto_432457 ) ) ( not ( = ?auto_432451 ?auto_432458 ) ) ( not ( = ?auto_432451 ?auto_432459 ) ) ( not ( = ?auto_432451 ?auto_432460 ) ) ( not ( = ?auto_432451 ?auto_432461 ) ) ( not ( = ?auto_432451 ?auto_432462 ) ) ( not ( = ?auto_432451 ?auto_432463 ) ) ( not ( = ?auto_432451 ?auto_432464 ) ) ( not ( = ?auto_432451 ?auto_432465 ) ) ( not ( = ?auto_432452 ?auto_432453 ) ) ( not ( = ?auto_432452 ?auto_432454 ) ) ( not ( = ?auto_432452 ?auto_432455 ) ) ( not ( = ?auto_432452 ?auto_432456 ) ) ( not ( = ?auto_432452 ?auto_432457 ) ) ( not ( = ?auto_432452 ?auto_432458 ) ) ( not ( = ?auto_432452 ?auto_432459 ) ) ( not ( = ?auto_432452 ?auto_432460 ) ) ( not ( = ?auto_432452 ?auto_432461 ) ) ( not ( = ?auto_432452 ?auto_432462 ) ) ( not ( = ?auto_432452 ?auto_432463 ) ) ( not ( = ?auto_432452 ?auto_432464 ) ) ( not ( = ?auto_432452 ?auto_432465 ) ) ( not ( = ?auto_432453 ?auto_432454 ) ) ( not ( = ?auto_432453 ?auto_432455 ) ) ( not ( = ?auto_432453 ?auto_432456 ) ) ( not ( = ?auto_432453 ?auto_432457 ) ) ( not ( = ?auto_432453 ?auto_432458 ) ) ( not ( = ?auto_432453 ?auto_432459 ) ) ( not ( = ?auto_432453 ?auto_432460 ) ) ( not ( = ?auto_432453 ?auto_432461 ) ) ( not ( = ?auto_432453 ?auto_432462 ) ) ( not ( = ?auto_432453 ?auto_432463 ) ) ( not ( = ?auto_432453 ?auto_432464 ) ) ( not ( = ?auto_432453 ?auto_432465 ) ) ( not ( = ?auto_432454 ?auto_432455 ) ) ( not ( = ?auto_432454 ?auto_432456 ) ) ( not ( = ?auto_432454 ?auto_432457 ) ) ( not ( = ?auto_432454 ?auto_432458 ) ) ( not ( = ?auto_432454 ?auto_432459 ) ) ( not ( = ?auto_432454 ?auto_432460 ) ) ( not ( = ?auto_432454 ?auto_432461 ) ) ( not ( = ?auto_432454 ?auto_432462 ) ) ( not ( = ?auto_432454 ?auto_432463 ) ) ( not ( = ?auto_432454 ?auto_432464 ) ) ( not ( = ?auto_432454 ?auto_432465 ) ) ( not ( = ?auto_432455 ?auto_432456 ) ) ( not ( = ?auto_432455 ?auto_432457 ) ) ( not ( = ?auto_432455 ?auto_432458 ) ) ( not ( = ?auto_432455 ?auto_432459 ) ) ( not ( = ?auto_432455 ?auto_432460 ) ) ( not ( = ?auto_432455 ?auto_432461 ) ) ( not ( = ?auto_432455 ?auto_432462 ) ) ( not ( = ?auto_432455 ?auto_432463 ) ) ( not ( = ?auto_432455 ?auto_432464 ) ) ( not ( = ?auto_432455 ?auto_432465 ) ) ( not ( = ?auto_432456 ?auto_432457 ) ) ( not ( = ?auto_432456 ?auto_432458 ) ) ( not ( = ?auto_432456 ?auto_432459 ) ) ( not ( = ?auto_432456 ?auto_432460 ) ) ( not ( = ?auto_432456 ?auto_432461 ) ) ( not ( = ?auto_432456 ?auto_432462 ) ) ( not ( = ?auto_432456 ?auto_432463 ) ) ( not ( = ?auto_432456 ?auto_432464 ) ) ( not ( = ?auto_432456 ?auto_432465 ) ) ( not ( = ?auto_432457 ?auto_432458 ) ) ( not ( = ?auto_432457 ?auto_432459 ) ) ( not ( = ?auto_432457 ?auto_432460 ) ) ( not ( = ?auto_432457 ?auto_432461 ) ) ( not ( = ?auto_432457 ?auto_432462 ) ) ( not ( = ?auto_432457 ?auto_432463 ) ) ( not ( = ?auto_432457 ?auto_432464 ) ) ( not ( = ?auto_432457 ?auto_432465 ) ) ( not ( = ?auto_432458 ?auto_432459 ) ) ( not ( = ?auto_432458 ?auto_432460 ) ) ( not ( = ?auto_432458 ?auto_432461 ) ) ( not ( = ?auto_432458 ?auto_432462 ) ) ( not ( = ?auto_432458 ?auto_432463 ) ) ( not ( = ?auto_432458 ?auto_432464 ) ) ( not ( = ?auto_432458 ?auto_432465 ) ) ( not ( = ?auto_432459 ?auto_432460 ) ) ( not ( = ?auto_432459 ?auto_432461 ) ) ( not ( = ?auto_432459 ?auto_432462 ) ) ( not ( = ?auto_432459 ?auto_432463 ) ) ( not ( = ?auto_432459 ?auto_432464 ) ) ( not ( = ?auto_432459 ?auto_432465 ) ) ( not ( = ?auto_432460 ?auto_432461 ) ) ( not ( = ?auto_432460 ?auto_432462 ) ) ( not ( = ?auto_432460 ?auto_432463 ) ) ( not ( = ?auto_432460 ?auto_432464 ) ) ( not ( = ?auto_432460 ?auto_432465 ) ) ( not ( = ?auto_432461 ?auto_432462 ) ) ( not ( = ?auto_432461 ?auto_432463 ) ) ( not ( = ?auto_432461 ?auto_432464 ) ) ( not ( = ?auto_432461 ?auto_432465 ) ) ( not ( = ?auto_432462 ?auto_432463 ) ) ( not ( = ?auto_432462 ?auto_432464 ) ) ( not ( = ?auto_432462 ?auto_432465 ) ) ( not ( = ?auto_432463 ?auto_432464 ) ) ( not ( = ?auto_432463 ?auto_432465 ) ) ( not ( = ?auto_432464 ?auto_432465 ) ) ( ON ?auto_432463 ?auto_432464 ) ( ON ?auto_432462 ?auto_432463 ) ( ON ?auto_432461 ?auto_432462 ) ( ON ?auto_432460 ?auto_432461 ) ( ON ?auto_432459 ?auto_432460 ) ( ON ?auto_432458 ?auto_432459 ) ( ON ?auto_432457 ?auto_432458 ) ( ON ?auto_432456 ?auto_432457 ) ( CLEAR ?auto_432454 ) ( ON ?auto_432455 ?auto_432456 ) ( CLEAR ?auto_432455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_432451 ?auto_432452 ?auto_432453 ?auto_432454 ?auto_432455 )
      ( MAKE-14PILE ?auto_432451 ?auto_432452 ?auto_432453 ?auto_432454 ?auto_432455 ?auto_432456 ?auto_432457 ?auto_432458 ?auto_432459 ?auto_432460 ?auto_432461 ?auto_432462 ?auto_432463 ?auto_432464 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432480 - BLOCK
      ?auto_432481 - BLOCK
      ?auto_432482 - BLOCK
      ?auto_432483 - BLOCK
      ?auto_432484 - BLOCK
      ?auto_432485 - BLOCK
      ?auto_432486 - BLOCK
      ?auto_432487 - BLOCK
      ?auto_432488 - BLOCK
      ?auto_432489 - BLOCK
      ?auto_432490 - BLOCK
      ?auto_432491 - BLOCK
      ?auto_432492 - BLOCK
      ?auto_432493 - BLOCK
    )
    :vars
    (
      ?auto_432494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432493 ?auto_432494 ) ( ON-TABLE ?auto_432480 ) ( ON ?auto_432481 ?auto_432480 ) ( ON ?auto_432482 ?auto_432481 ) ( not ( = ?auto_432480 ?auto_432481 ) ) ( not ( = ?auto_432480 ?auto_432482 ) ) ( not ( = ?auto_432480 ?auto_432483 ) ) ( not ( = ?auto_432480 ?auto_432484 ) ) ( not ( = ?auto_432480 ?auto_432485 ) ) ( not ( = ?auto_432480 ?auto_432486 ) ) ( not ( = ?auto_432480 ?auto_432487 ) ) ( not ( = ?auto_432480 ?auto_432488 ) ) ( not ( = ?auto_432480 ?auto_432489 ) ) ( not ( = ?auto_432480 ?auto_432490 ) ) ( not ( = ?auto_432480 ?auto_432491 ) ) ( not ( = ?auto_432480 ?auto_432492 ) ) ( not ( = ?auto_432480 ?auto_432493 ) ) ( not ( = ?auto_432480 ?auto_432494 ) ) ( not ( = ?auto_432481 ?auto_432482 ) ) ( not ( = ?auto_432481 ?auto_432483 ) ) ( not ( = ?auto_432481 ?auto_432484 ) ) ( not ( = ?auto_432481 ?auto_432485 ) ) ( not ( = ?auto_432481 ?auto_432486 ) ) ( not ( = ?auto_432481 ?auto_432487 ) ) ( not ( = ?auto_432481 ?auto_432488 ) ) ( not ( = ?auto_432481 ?auto_432489 ) ) ( not ( = ?auto_432481 ?auto_432490 ) ) ( not ( = ?auto_432481 ?auto_432491 ) ) ( not ( = ?auto_432481 ?auto_432492 ) ) ( not ( = ?auto_432481 ?auto_432493 ) ) ( not ( = ?auto_432481 ?auto_432494 ) ) ( not ( = ?auto_432482 ?auto_432483 ) ) ( not ( = ?auto_432482 ?auto_432484 ) ) ( not ( = ?auto_432482 ?auto_432485 ) ) ( not ( = ?auto_432482 ?auto_432486 ) ) ( not ( = ?auto_432482 ?auto_432487 ) ) ( not ( = ?auto_432482 ?auto_432488 ) ) ( not ( = ?auto_432482 ?auto_432489 ) ) ( not ( = ?auto_432482 ?auto_432490 ) ) ( not ( = ?auto_432482 ?auto_432491 ) ) ( not ( = ?auto_432482 ?auto_432492 ) ) ( not ( = ?auto_432482 ?auto_432493 ) ) ( not ( = ?auto_432482 ?auto_432494 ) ) ( not ( = ?auto_432483 ?auto_432484 ) ) ( not ( = ?auto_432483 ?auto_432485 ) ) ( not ( = ?auto_432483 ?auto_432486 ) ) ( not ( = ?auto_432483 ?auto_432487 ) ) ( not ( = ?auto_432483 ?auto_432488 ) ) ( not ( = ?auto_432483 ?auto_432489 ) ) ( not ( = ?auto_432483 ?auto_432490 ) ) ( not ( = ?auto_432483 ?auto_432491 ) ) ( not ( = ?auto_432483 ?auto_432492 ) ) ( not ( = ?auto_432483 ?auto_432493 ) ) ( not ( = ?auto_432483 ?auto_432494 ) ) ( not ( = ?auto_432484 ?auto_432485 ) ) ( not ( = ?auto_432484 ?auto_432486 ) ) ( not ( = ?auto_432484 ?auto_432487 ) ) ( not ( = ?auto_432484 ?auto_432488 ) ) ( not ( = ?auto_432484 ?auto_432489 ) ) ( not ( = ?auto_432484 ?auto_432490 ) ) ( not ( = ?auto_432484 ?auto_432491 ) ) ( not ( = ?auto_432484 ?auto_432492 ) ) ( not ( = ?auto_432484 ?auto_432493 ) ) ( not ( = ?auto_432484 ?auto_432494 ) ) ( not ( = ?auto_432485 ?auto_432486 ) ) ( not ( = ?auto_432485 ?auto_432487 ) ) ( not ( = ?auto_432485 ?auto_432488 ) ) ( not ( = ?auto_432485 ?auto_432489 ) ) ( not ( = ?auto_432485 ?auto_432490 ) ) ( not ( = ?auto_432485 ?auto_432491 ) ) ( not ( = ?auto_432485 ?auto_432492 ) ) ( not ( = ?auto_432485 ?auto_432493 ) ) ( not ( = ?auto_432485 ?auto_432494 ) ) ( not ( = ?auto_432486 ?auto_432487 ) ) ( not ( = ?auto_432486 ?auto_432488 ) ) ( not ( = ?auto_432486 ?auto_432489 ) ) ( not ( = ?auto_432486 ?auto_432490 ) ) ( not ( = ?auto_432486 ?auto_432491 ) ) ( not ( = ?auto_432486 ?auto_432492 ) ) ( not ( = ?auto_432486 ?auto_432493 ) ) ( not ( = ?auto_432486 ?auto_432494 ) ) ( not ( = ?auto_432487 ?auto_432488 ) ) ( not ( = ?auto_432487 ?auto_432489 ) ) ( not ( = ?auto_432487 ?auto_432490 ) ) ( not ( = ?auto_432487 ?auto_432491 ) ) ( not ( = ?auto_432487 ?auto_432492 ) ) ( not ( = ?auto_432487 ?auto_432493 ) ) ( not ( = ?auto_432487 ?auto_432494 ) ) ( not ( = ?auto_432488 ?auto_432489 ) ) ( not ( = ?auto_432488 ?auto_432490 ) ) ( not ( = ?auto_432488 ?auto_432491 ) ) ( not ( = ?auto_432488 ?auto_432492 ) ) ( not ( = ?auto_432488 ?auto_432493 ) ) ( not ( = ?auto_432488 ?auto_432494 ) ) ( not ( = ?auto_432489 ?auto_432490 ) ) ( not ( = ?auto_432489 ?auto_432491 ) ) ( not ( = ?auto_432489 ?auto_432492 ) ) ( not ( = ?auto_432489 ?auto_432493 ) ) ( not ( = ?auto_432489 ?auto_432494 ) ) ( not ( = ?auto_432490 ?auto_432491 ) ) ( not ( = ?auto_432490 ?auto_432492 ) ) ( not ( = ?auto_432490 ?auto_432493 ) ) ( not ( = ?auto_432490 ?auto_432494 ) ) ( not ( = ?auto_432491 ?auto_432492 ) ) ( not ( = ?auto_432491 ?auto_432493 ) ) ( not ( = ?auto_432491 ?auto_432494 ) ) ( not ( = ?auto_432492 ?auto_432493 ) ) ( not ( = ?auto_432492 ?auto_432494 ) ) ( not ( = ?auto_432493 ?auto_432494 ) ) ( ON ?auto_432492 ?auto_432493 ) ( ON ?auto_432491 ?auto_432492 ) ( ON ?auto_432490 ?auto_432491 ) ( ON ?auto_432489 ?auto_432490 ) ( ON ?auto_432488 ?auto_432489 ) ( ON ?auto_432487 ?auto_432488 ) ( ON ?auto_432486 ?auto_432487 ) ( ON ?auto_432485 ?auto_432486 ) ( ON ?auto_432484 ?auto_432485 ) ( CLEAR ?auto_432482 ) ( ON ?auto_432483 ?auto_432484 ) ( CLEAR ?auto_432483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_432480 ?auto_432481 ?auto_432482 ?auto_432483 )
      ( MAKE-14PILE ?auto_432480 ?auto_432481 ?auto_432482 ?auto_432483 ?auto_432484 ?auto_432485 ?auto_432486 ?auto_432487 ?auto_432488 ?auto_432489 ?auto_432490 ?auto_432491 ?auto_432492 ?auto_432493 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432509 - BLOCK
      ?auto_432510 - BLOCK
      ?auto_432511 - BLOCK
      ?auto_432512 - BLOCK
      ?auto_432513 - BLOCK
      ?auto_432514 - BLOCK
      ?auto_432515 - BLOCK
      ?auto_432516 - BLOCK
      ?auto_432517 - BLOCK
      ?auto_432518 - BLOCK
      ?auto_432519 - BLOCK
      ?auto_432520 - BLOCK
      ?auto_432521 - BLOCK
      ?auto_432522 - BLOCK
    )
    :vars
    (
      ?auto_432523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432522 ?auto_432523 ) ( ON-TABLE ?auto_432509 ) ( ON ?auto_432510 ?auto_432509 ) ( ON ?auto_432511 ?auto_432510 ) ( not ( = ?auto_432509 ?auto_432510 ) ) ( not ( = ?auto_432509 ?auto_432511 ) ) ( not ( = ?auto_432509 ?auto_432512 ) ) ( not ( = ?auto_432509 ?auto_432513 ) ) ( not ( = ?auto_432509 ?auto_432514 ) ) ( not ( = ?auto_432509 ?auto_432515 ) ) ( not ( = ?auto_432509 ?auto_432516 ) ) ( not ( = ?auto_432509 ?auto_432517 ) ) ( not ( = ?auto_432509 ?auto_432518 ) ) ( not ( = ?auto_432509 ?auto_432519 ) ) ( not ( = ?auto_432509 ?auto_432520 ) ) ( not ( = ?auto_432509 ?auto_432521 ) ) ( not ( = ?auto_432509 ?auto_432522 ) ) ( not ( = ?auto_432509 ?auto_432523 ) ) ( not ( = ?auto_432510 ?auto_432511 ) ) ( not ( = ?auto_432510 ?auto_432512 ) ) ( not ( = ?auto_432510 ?auto_432513 ) ) ( not ( = ?auto_432510 ?auto_432514 ) ) ( not ( = ?auto_432510 ?auto_432515 ) ) ( not ( = ?auto_432510 ?auto_432516 ) ) ( not ( = ?auto_432510 ?auto_432517 ) ) ( not ( = ?auto_432510 ?auto_432518 ) ) ( not ( = ?auto_432510 ?auto_432519 ) ) ( not ( = ?auto_432510 ?auto_432520 ) ) ( not ( = ?auto_432510 ?auto_432521 ) ) ( not ( = ?auto_432510 ?auto_432522 ) ) ( not ( = ?auto_432510 ?auto_432523 ) ) ( not ( = ?auto_432511 ?auto_432512 ) ) ( not ( = ?auto_432511 ?auto_432513 ) ) ( not ( = ?auto_432511 ?auto_432514 ) ) ( not ( = ?auto_432511 ?auto_432515 ) ) ( not ( = ?auto_432511 ?auto_432516 ) ) ( not ( = ?auto_432511 ?auto_432517 ) ) ( not ( = ?auto_432511 ?auto_432518 ) ) ( not ( = ?auto_432511 ?auto_432519 ) ) ( not ( = ?auto_432511 ?auto_432520 ) ) ( not ( = ?auto_432511 ?auto_432521 ) ) ( not ( = ?auto_432511 ?auto_432522 ) ) ( not ( = ?auto_432511 ?auto_432523 ) ) ( not ( = ?auto_432512 ?auto_432513 ) ) ( not ( = ?auto_432512 ?auto_432514 ) ) ( not ( = ?auto_432512 ?auto_432515 ) ) ( not ( = ?auto_432512 ?auto_432516 ) ) ( not ( = ?auto_432512 ?auto_432517 ) ) ( not ( = ?auto_432512 ?auto_432518 ) ) ( not ( = ?auto_432512 ?auto_432519 ) ) ( not ( = ?auto_432512 ?auto_432520 ) ) ( not ( = ?auto_432512 ?auto_432521 ) ) ( not ( = ?auto_432512 ?auto_432522 ) ) ( not ( = ?auto_432512 ?auto_432523 ) ) ( not ( = ?auto_432513 ?auto_432514 ) ) ( not ( = ?auto_432513 ?auto_432515 ) ) ( not ( = ?auto_432513 ?auto_432516 ) ) ( not ( = ?auto_432513 ?auto_432517 ) ) ( not ( = ?auto_432513 ?auto_432518 ) ) ( not ( = ?auto_432513 ?auto_432519 ) ) ( not ( = ?auto_432513 ?auto_432520 ) ) ( not ( = ?auto_432513 ?auto_432521 ) ) ( not ( = ?auto_432513 ?auto_432522 ) ) ( not ( = ?auto_432513 ?auto_432523 ) ) ( not ( = ?auto_432514 ?auto_432515 ) ) ( not ( = ?auto_432514 ?auto_432516 ) ) ( not ( = ?auto_432514 ?auto_432517 ) ) ( not ( = ?auto_432514 ?auto_432518 ) ) ( not ( = ?auto_432514 ?auto_432519 ) ) ( not ( = ?auto_432514 ?auto_432520 ) ) ( not ( = ?auto_432514 ?auto_432521 ) ) ( not ( = ?auto_432514 ?auto_432522 ) ) ( not ( = ?auto_432514 ?auto_432523 ) ) ( not ( = ?auto_432515 ?auto_432516 ) ) ( not ( = ?auto_432515 ?auto_432517 ) ) ( not ( = ?auto_432515 ?auto_432518 ) ) ( not ( = ?auto_432515 ?auto_432519 ) ) ( not ( = ?auto_432515 ?auto_432520 ) ) ( not ( = ?auto_432515 ?auto_432521 ) ) ( not ( = ?auto_432515 ?auto_432522 ) ) ( not ( = ?auto_432515 ?auto_432523 ) ) ( not ( = ?auto_432516 ?auto_432517 ) ) ( not ( = ?auto_432516 ?auto_432518 ) ) ( not ( = ?auto_432516 ?auto_432519 ) ) ( not ( = ?auto_432516 ?auto_432520 ) ) ( not ( = ?auto_432516 ?auto_432521 ) ) ( not ( = ?auto_432516 ?auto_432522 ) ) ( not ( = ?auto_432516 ?auto_432523 ) ) ( not ( = ?auto_432517 ?auto_432518 ) ) ( not ( = ?auto_432517 ?auto_432519 ) ) ( not ( = ?auto_432517 ?auto_432520 ) ) ( not ( = ?auto_432517 ?auto_432521 ) ) ( not ( = ?auto_432517 ?auto_432522 ) ) ( not ( = ?auto_432517 ?auto_432523 ) ) ( not ( = ?auto_432518 ?auto_432519 ) ) ( not ( = ?auto_432518 ?auto_432520 ) ) ( not ( = ?auto_432518 ?auto_432521 ) ) ( not ( = ?auto_432518 ?auto_432522 ) ) ( not ( = ?auto_432518 ?auto_432523 ) ) ( not ( = ?auto_432519 ?auto_432520 ) ) ( not ( = ?auto_432519 ?auto_432521 ) ) ( not ( = ?auto_432519 ?auto_432522 ) ) ( not ( = ?auto_432519 ?auto_432523 ) ) ( not ( = ?auto_432520 ?auto_432521 ) ) ( not ( = ?auto_432520 ?auto_432522 ) ) ( not ( = ?auto_432520 ?auto_432523 ) ) ( not ( = ?auto_432521 ?auto_432522 ) ) ( not ( = ?auto_432521 ?auto_432523 ) ) ( not ( = ?auto_432522 ?auto_432523 ) ) ( ON ?auto_432521 ?auto_432522 ) ( ON ?auto_432520 ?auto_432521 ) ( ON ?auto_432519 ?auto_432520 ) ( ON ?auto_432518 ?auto_432519 ) ( ON ?auto_432517 ?auto_432518 ) ( ON ?auto_432516 ?auto_432517 ) ( ON ?auto_432515 ?auto_432516 ) ( ON ?auto_432514 ?auto_432515 ) ( ON ?auto_432513 ?auto_432514 ) ( CLEAR ?auto_432511 ) ( ON ?auto_432512 ?auto_432513 ) ( CLEAR ?auto_432512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_432509 ?auto_432510 ?auto_432511 ?auto_432512 )
      ( MAKE-14PILE ?auto_432509 ?auto_432510 ?auto_432511 ?auto_432512 ?auto_432513 ?auto_432514 ?auto_432515 ?auto_432516 ?auto_432517 ?auto_432518 ?auto_432519 ?auto_432520 ?auto_432521 ?auto_432522 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432538 - BLOCK
      ?auto_432539 - BLOCK
      ?auto_432540 - BLOCK
      ?auto_432541 - BLOCK
      ?auto_432542 - BLOCK
      ?auto_432543 - BLOCK
      ?auto_432544 - BLOCK
      ?auto_432545 - BLOCK
      ?auto_432546 - BLOCK
      ?auto_432547 - BLOCK
      ?auto_432548 - BLOCK
      ?auto_432549 - BLOCK
      ?auto_432550 - BLOCK
      ?auto_432551 - BLOCK
    )
    :vars
    (
      ?auto_432552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432551 ?auto_432552 ) ( ON-TABLE ?auto_432538 ) ( ON ?auto_432539 ?auto_432538 ) ( not ( = ?auto_432538 ?auto_432539 ) ) ( not ( = ?auto_432538 ?auto_432540 ) ) ( not ( = ?auto_432538 ?auto_432541 ) ) ( not ( = ?auto_432538 ?auto_432542 ) ) ( not ( = ?auto_432538 ?auto_432543 ) ) ( not ( = ?auto_432538 ?auto_432544 ) ) ( not ( = ?auto_432538 ?auto_432545 ) ) ( not ( = ?auto_432538 ?auto_432546 ) ) ( not ( = ?auto_432538 ?auto_432547 ) ) ( not ( = ?auto_432538 ?auto_432548 ) ) ( not ( = ?auto_432538 ?auto_432549 ) ) ( not ( = ?auto_432538 ?auto_432550 ) ) ( not ( = ?auto_432538 ?auto_432551 ) ) ( not ( = ?auto_432538 ?auto_432552 ) ) ( not ( = ?auto_432539 ?auto_432540 ) ) ( not ( = ?auto_432539 ?auto_432541 ) ) ( not ( = ?auto_432539 ?auto_432542 ) ) ( not ( = ?auto_432539 ?auto_432543 ) ) ( not ( = ?auto_432539 ?auto_432544 ) ) ( not ( = ?auto_432539 ?auto_432545 ) ) ( not ( = ?auto_432539 ?auto_432546 ) ) ( not ( = ?auto_432539 ?auto_432547 ) ) ( not ( = ?auto_432539 ?auto_432548 ) ) ( not ( = ?auto_432539 ?auto_432549 ) ) ( not ( = ?auto_432539 ?auto_432550 ) ) ( not ( = ?auto_432539 ?auto_432551 ) ) ( not ( = ?auto_432539 ?auto_432552 ) ) ( not ( = ?auto_432540 ?auto_432541 ) ) ( not ( = ?auto_432540 ?auto_432542 ) ) ( not ( = ?auto_432540 ?auto_432543 ) ) ( not ( = ?auto_432540 ?auto_432544 ) ) ( not ( = ?auto_432540 ?auto_432545 ) ) ( not ( = ?auto_432540 ?auto_432546 ) ) ( not ( = ?auto_432540 ?auto_432547 ) ) ( not ( = ?auto_432540 ?auto_432548 ) ) ( not ( = ?auto_432540 ?auto_432549 ) ) ( not ( = ?auto_432540 ?auto_432550 ) ) ( not ( = ?auto_432540 ?auto_432551 ) ) ( not ( = ?auto_432540 ?auto_432552 ) ) ( not ( = ?auto_432541 ?auto_432542 ) ) ( not ( = ?auto_432541 ?auto_432543 ) ) ( not ( = ?auto_432541 ?auto_432544 ) ) ( not ( = ?auto_432541 ?auto_432545 ) ) ( not ( = ?auto_432541 ?auto_432546 ) ) ( not ( = ?auto_432541 ?auto_432547 ) ) ( not ( = ?auto_432541 ?auto_432548 ) ) ( not ( = ?auto_432541 ?auto_432549 ) ) ( not ( = ?auto_432541 ?auto_432550 ) ) ( not ( = ?auto_432541 ?auto_432551 ) ) ( not ( = ?auto_432541 ?auto_432552 ) ) ( not ( = ?auto_432542 ?auto_432543 ) ) ( not ( = ?auto_432542 ?auto_432544 ) ) ( not ( = ?auto_432542 ?auto_432545 ) ) ( not ( = ?auto_432542 ?auto_432546 ) ) ( not ( = ?auto_432542 ?auto_432547 ) ) ( not ( = ?auto_432542 ?auto_432548 ) ) ( not ( = ?auto_432542 ?auto_432549 ) ) ( not ( = ?auto_432542 ?auto_432550 ) ) ( not ( = ?auto_432542 ?auto_432551 ) ) ( not ( = ?auto_432542 ?auto_432552 ) ) ( not ( = ?auto_432543 ?auto_432544 ) ) ( not ( = ?auto_432543 ?auto_432545 ) ) ( not ( = ?auto_432543 ?auto_432546 ) ) ( not ( = ?auto_432543 ?auto_432547 ) ) ( not ( = ?auto_432543 ?auto_432548 ) ) ( not ( = ?auto_432543 ?auto_432549 ) ) ( not ( = ?auto_432543 ?auto_432550 ) ) ( not ( = ?auto_432543 ?auto_432551 ) ) ( not ( = ?auto_432543 ?auto_432552 ) ) ( not ( = ?auto_432544 ?auto_432545 ) ) ( not ( = ?auto_432544 ?auto_432546 ) ) ( not ( = ?auto_432544 ?auto_432547 ) ) ( not ( = ?auto_432544 ?auto_432548 ) ) ( not ( = ?auto_432544 ?auto_432549 ) ) ( not ( = ?auto_432544 ?auto_432550 ) ) ( not ( = ?auto_432544 ?auto_432551 ) ) ( not ( = ?auto_432544 ?auto_432552 ) ) ( not ( = ?auto_432545 ?auto_432546 ) ) ( not ( = ?auto_432545 ?auto_432547 ) ) ( not ( = ?auto_432545 ?auto_432548 ) ) ( not ( = ?auto_432545 ?auto_432549 ) ) ( not ( = ?auto_432545 ?auto_432550 ) ) ( not ( = ?auto_432545 ?auto_432551 ) ) ( not ( = ?auto_432545 ?auto_432552 ) ) ( not ( = ?auto_432546 ?auto_432547 ) ) ( not ( = ?auto_432546 ?auto_432548 ) ) ( not ( = ?auto_432546 ?auto_432549 ) ) ( not ( = ?auto_432546 ?auto_432550 ) ) ( not ( = ?auto_432546 ?auto_432551 ) ) ( not ( = ?auto_432546 ?auto_432552 ) ) ( not ( = ?auto_432547 ?auto_432548 ) ) ( not ( = ?auto_432547 ?auto_432549 ) ) ( not ( = ?auto_432547 ?auto_432550 ) ) ( not ( = ?auto_432547 ?auto_432551 ) ) ( not ( = ?auto_432547 ?auto_432552 ) ) ( not ( = ?auto_432548 ?auto_432549 ) ) ( not ( = ?auto_432548 ?auto_432550 ) ) ( not ( = ?auto_432548 ?auto_432551 ) ) ( not ( = ?auto_432548 ?auto_432552 ) ) ( not ( = ?auto_432549 ?auto_432550 ) ) ( not ( = ?auto_432549 ?auto_432551 ) ) ( not ( = ?auto_432549 ?auto_432552 ) ) ( not ( = ?auto_432550 ?auto_432551 ) ) ( not ( = ?auto_432550 ?auto_432552 ) ) ( not ( = ?auto_432551 ?auto_432552 ) ) ( ON ?auto_432550 ?auto_432551 ) ( ON ?auto_432549 ?auto_432550 ) ( ON ?auto_432548 ?auto_432549 ) ( ON ?auto_432547 ?auto_432548 ) ( ON ?auto_432546 ?auto_432547 ) ( ON ?auto_432545 ?auto_432546 ) ( ON ?auto_432544 ?auto_432545 ) ( ON ?auto_432543 ?auto_432544 ) ( ON ?auto_432542 ?auto_432543 ) ( ON ?auto_432541 ?auto_432542 ) ( CLEAR ?auto_432539 ) ( ON ?auto_432540 ?auto_432541 ) ( CLEAR ?auto_432540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_432538 ?auto_432539 ?auto_432540 )
      ( MAKE-14PILE ?auto_432538 ?auto_432539 ?auto_432540 ?auto_432541 ?auto_432542 ?auto_432543 ?auto_432544 ?auto_432545 ?auto_432546 ?auto_432547 ?auto_432548 ?auto_432549 ?auto_432550 ?auto_432551 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432567 - BLOCK
      ?auto_432568 - BLOCK
      ?auto_432569 - BLOCK
      ?auto_432570 - BLOCK
      ?auto_432571 - BLOCK
      ?auto_432572 - BLOCK
      ?auto_432573 - BLOCK
      ?auto_432574 - BLOCK
      ?auto_432575 - BLOCK
      ?auto_432576 - BLOCK
      ?auto_432577 - BLOCK
      ?auto_432578 - BLOCK
      ?auto_432579 - BLOCK
      ?auto_432580 - BLOCK
    )
    :vars
    (
      ?auto_432581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432580 ?auto_432581 ) ( ON-TABLE ?auto_432567 ) ( ON ?auto_432568 ?auto_432567 ) ( not ( = ?auto_432567 ?auto_432568 ) ) ( not ( = ?auto_432567 ?auto_432569 ) ) ( not ( = ?auto_432567 ?auto_432570 ) ) ( not ( = ?auto_432567 ?auto_432571 ) ) ( not ( = ?auto_432567 ?auto_432572 ) ) ( not ( = ?auto_432567 ?auto_432573 ) ) ( not ( = ?auto_432567 ?auto_432574 ) ) ( not ( = ?auto_432567 ?auto_432575 ) ) ( not ( = ?auto_432567 ?auto_432576 ) ) ( not ( = ?auto_432567 ?auto_432577 ) ) ( not ( = ?auto_432567 ?auto_432578 ) ) ( not ( = ?auto_432567 ?auto_432579 ) ) ( not ( = ?auto_432567 ?auto_432580 ) ) ( not ( = ?auto_432567 ?auto_432581 ) ) ( not ( = ?auto_432568 ?auto_432569 ) ) ( not ( = ?auto_432568 ?auto_432570 ) ) ( not ( = ?auto_432568 ?auto_432571 ) ) ( not ( = ?auto_432568 ?auto_432572 ) ) ( not ( = ?auto_432568 ?auto_432573 ) ) ( not ( = ?auto_432568 ?auto_432574 ) ) ( not ( = ?auto_432568 ?auto_432575 ) ) ( not ( = ?auto_432568 ?auto_432576 ) ) ( not ( = ?auto_432568 ?auto_432577 ) ) ( not ( = ?auto_432568 ?auto_432578 ) ) ( not ( = ?auto_432568 ?auto_432579 ) ) ( not ( = ?auto_432568 ?auto_432580 ) ) ( not ( = ?auto_432568 ?auto_432581 ) ) ( not ( = ?auto_432569 ?auto_432570 ) ) ( not ( = ?auto_432569 ?auto_432571 ) ) ( not ( = ?auto_432569 ?auto_432572 ) ) ( not ( = ?auto_432569 ?auto_432573 ) ) ( not ( = ?auto_432569 ?auto_432574 ) ) ( not ( = ?auto_432569 ?auto_432575 ) ) ( not ( = ?auto_432569 ?auto_432576 ) ) ( not ( = ?auto_432569 ?auto_432577 ) ) ( not ( = ?auto_432569 ?auto_432578 ) ) ( not ( = ?auto_432569 ?auto_432579 ) ) ( not ( = ?auto_432569 ?auto_432580 ) ) ( not ( = ?auto_432569 ?auto_432581 ) ) ( not ( = ?auto_432570 ?auto_432571 ) ) ( not ( = ?auto_432570 ?auto_432572 ) ) ( not ( = ?auto_432570 ?auto_432573 ) ) ( not ( = ?auto_432570 ?auto_432574 ) ) ( not ( = ?auto_432570 ?auto_432575 ) ) ( not ( = ?auto_432570 ?auto_432576 ) ) ( not ( = ?auto_432570 ?auto_432577 ) ) ( not ( = ?auto_432570 ?auto_432578 ) ) ( not ( = ?auto_432570 ?auto_432579 ) ) ( not ( = ?auto_432570 ?auto_432580 ) ) ( not ( = ?auto_432570 ?auto_432581 ) ) ( not ( = ?auto_432571 ?auto_432572 ) ) ( not ( = ?auto_432571 ?auto_432573 ) ) ( not ( = ?auto_432571 ?auto_432574 ) ) ( not ( = ?auto_432571 ?auto_432575 ) ) ( not ( = ?auto_432571 ?auto_432576 ) ) ( not ( = ?auto_432571 ?auto_432577 ) ) ( not ( = ?auto_432571 ?auto_432578 ) ) ( not ( = ?auto_432571 ?auto_432579 ) ) ( not ( = ?auto_432571 ?auto_432580 ) ) ( not ( = ?auto_432571 ?auto_432581 ) ) ( not ( = ?auto_432572 ?auto_432573 ) ) ( not ( = ?auto_432572 ?auto_432574 ) ) ( not ( = ?auto_432572 ?auto_432575 ) ) ( not ( = ?auto_432572 ?auto_432576 ) ) ( not ( = ?auto_432572 ?auto_432577 ) ) ( not ( = ?auto_432572 ?auto_432578 ) ) ( not ( = ?auto_432572 ?auto_432579 ) ) ( not ( = ?auto_432572 ?auto_432580 ) ) ( not ( = ?auto_432572 ?auto_432581 ) ) ( not ( = ?auto_432573 ?auto_432574 ) ) ( not ( = ?auto_432573 ?auto_432575 ) ) ( not ( = ?auto_432573 ?auto_432576 ) ) ( not ( = ?auto_432573 ?auto_432577 ) ) ( not ( = ?auto_432573 ?auto_432578 ) ) ( not ( = ?auto_432573 ?auto_432579 ) ) ( not ( = ?auto_432573 ?auto_432580 ) ) ( not ( = ?auto_432573 ?auto_432581 ) ) ( not ( = ?auto_432574 ?auto_432575 ) ) ( not ( = ?auto_432574 ?auto_432576 ) ) ( not ( = ?auto_432574 ?auto_432577 ) ) ( not ( = ?auto_432574 ?auto_432578 ) ) ( not ( = ?auto_432574 ?auto_432579 ) ) ( not ( = ?auto_432574 ?auto_432580 ) ) ( not ( = ?auto_432574 ?auto_432581 ) ) ( not ( = ?auto_432575 ?auto_432576 ) ) ( not ( = ?auto_432575 ?auto_432577 ) ) ( not ( = ?auto_432575 ?auto_432578 ) ) ( not ( = ?auto_432575 ?auto_432579 ) ) ( not ( = ?auto_432575 ?auto_432580 ) ) ( not ( = ?auto_432575 ?auto_432581 ) ) ( not ( = ?auto_432576 ?auto_432577 ) ) ( not ( = ?auto_432576 ?auto_432578 ) ) ( not ( = ?auto_432576 ?auto_432579 ) ) ( not ( = ?auto_432576 ?auto_432580 ) ) ( not ( = ?auto_432576 ?auto_432581 ) ) ( not ( = ?auto_432577 ?auto_432578 ) ) ( not ( = ?auto_432577 ?auto_432579 ) ) ( not ( = ?auto_432577 ?auto_432580 ) ) ( not ( = ?auto_432577 ?auto_432581 ) ) ( not ( = ?auto_432578 ?auto_432579 ) ) ( not ( = ?auto_432578 ?auto_432580 ) ) ( not ( = ?auto_432578 ?auto_432581 ) ) ( not ( = ?auto_432579 ?auto_432580 ) ) ( not ( = ?auto_432579 ?auto_432581 ) ) ( not ( = ?auto_432580 ?auto_432581 ) ) ( ON ?auto_432579 ?auto_432580 ) ( ON ?auto_432578 ?auto_432579 ) ( ON ?auto_432577 ?auto_432578 ) ( ON ?auto_432576 ?auto_432577 ) ( ON ?auto_432575 ?auto_432576 ) ( ON ?auto_432574 ?auto_432575 ) ( ON ?auto_432573 ?auto_432574 ) ( ON ?auto_432572 ?auto_432573 ) ( ON ?auto_432571 ?auto_432572 ) ( ON ?auto_432570 ?auto_432571 ) ( CLEAR ?auto_432568 ) ( ON ?auto_432569 ?auto_432570 ) ( CLEAR ?auto_432569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_432567 ?auto_432568 ?auto_432569 )
      ( MAKE-14PILE ?auto_432567 ?auto_432568 ?auto_432569 ?auto_432570 ?auto_432571 ?auto_432572 ?auto_432573 ?auto_432574 ?auto_432575 ?auto_432576 ?auto_432577 ?auto_432578 ?auto_432579 ?auto_432580 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432596 - BLOCK
      ?auto_432597 - BLOCK
      ?auto_432598 - BLOCK
      ?auto_432599 - BLOCK
      ?auto_432600 - BLOCK
      ?auto_432601 - BLOCK
      ?auto_432602 - BLOCK
      ?auto_432603 - BLOCK
      ?auto_432604 - BLOCK
      ?auto_432605 - BLOCK
      ?auto_432606 - BLOCK
      ?auto_432607 - BLOCK
      ?auto_432608 - BLOCK
      ?auto_432609 - BLOCK
    )
    :vars
    (
      ?auto_432610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432609 ?auto_432610 ) ( ON-TABLE ?auto_432596 ) ( not ( = ?auto_432596 ?auto_432597 ) ) ( not ( = ?auto_432596 ?auto_432598 ) ) ( not ( = ?auto_432596 ?auto_432599 ) ) ( not ( = ?auto_432596 ?auto_432600 ) ) ( not ( = ?auto_432596 ?auto_432601 ) ) ( not ( = ?auto_432596 ?auto_432602 ) ) ( not ( = ?auto_432596 ?auto_432603 ) ) ( not ( = ?auto_432596 ?auto_432604 ) ) ( not ( = ?auto_432596 ?auto_432605 ) ) ( not ( = ?auto_432596 ?auto_432606 ) ) ( not ( = ?auto_432596 ?auto_432607 ) ) ( not ( = ?auto_432596 ?auto_432608 ) ) ( not ( = ?auto_432596 ?auto_432609 ) ) ( not ( = ?auto_432596 ?auto_432610 ) ) ( not ( = ?auto_432597 ?auto_432598 ) ) ( not ( = ?auto_432597 ?auto_432599 ) ) ( not ( = ?auto_432597 ?auto_432600 ) ) ( not ( = ?auto_432597 ?auto_432601 ) ) ( not ( = ?auto_432597 ?auto_432602 ) ) ( not ( = ?auto_432597 ?auto_432603 ) ) ( not ( = ?auto_432597 ?auto_432604 ) ) ( not ( = ?auto_432597 ?auto_432605 ) ) ( not ( = ?auto_432597 ?auto_432606 ) ) ( not ( = ?auto_432597 ?auto_432607 ) ) ( not ( = ?auto_432597 ?auto_432608 ) ) ( not ( = ?auto_432597 ?auto_432609 ) ) ( not ( = ?auto_432597 ?auto_432610 ) ) ( not ( = ?auto_432598 ?auto_432599 ) ) ( not ( = ?auto_432598 ?auto_432600 ) ) ( not ( = ?auto_432598 ?auto_432601 ) ) ( not ( = ?auto_432598 ?auto_432602 ) ) ( not ( = ?auto_432598 ?auto_432603 ) ) ( not ( = ?auto_432598 ?auto_432604 ) ) ( not ( = ?auto_432598 ?auto_432605 ) ) ( not ( = ?auto_432598 ?auto_432606 ) ) ( not ( = ?auto_432598 ?auto_432607 ) ) ( not ( = ?auto_432598 ?auto_432608 ) ) ( not ( = ?auto_432598 ?auto_432609 ) ) ( not ( = ?auto_432598 ?auto_432610 ) ) ( not ( = ?auto_432599 ?auto_432600 ) ) ( not ( = ?auto_432599 ?auto_432601 ) ) ( not ( = ?auto_432599 ?auto_432602 ) ) ( not ( = ?auto_432599 ?auto_432603 ) ) ( not ( = ?auto_432599 ?auto_432604 ) ) ( not ( = ?auto_432599 ?auto_432605 ) ) ( not ( = ?auto_432599 ?auto_432606 ) ) ( not ( = ?auto_432599 ?auto_432607 ) ) ( not ( = ?auto_432599 ?auto_432608 ) ) ( not ( = ?auto_432599 ?auto_432609 ) ) ( not ( = ?auto_432599 ?auto_432610 ) ) ( not ( = ?auto_432600 ?auto_432601 ) ) ( not ( = ?auto_432600 ?auto_432602 ) ) ( not ( = ?auto_432600 ?auto_432603 ) ) ( not ( = ?auto_432600 ?auto_432604 ) ) ( not ( = ?auto_432600 ?auto_432605 ) ) ( not ( = ?auto_432600 ?auto_432606 ) ) ( not ( = ?auto_432600 ?auto_432607 ) ) ( not ( = ?auto_432600 ?auto_432608 ) ) ( not ( = ?auto_432600 ?auto_432609 ) ) ( not ( = ?auto_432600 ?auto_432610 ) ) ( not ( = ?auto_432601 ?auto_432602 ) ) ( not ( = ?auto_432601 ?auto_432603 ) ) ( not ( = ?auto_432601 ?auto_432604 ) ) ( not ( = ?auto_432601 ?auto_432605 ) ) ( not ( = ?auto_432601 ?auto_432606 ) ) ( not ( = ?auto_432601 ?auto_432607 ) ) ( not ( = ?auto_432601 ?auto_432608 ) ) ( not ( = ?auto_432601 ?auto_432609 ) ) ( not ( = ?auto_432601 ?auto_432610 ) ) ( not ( = ?auto_432602 ?auto_432603 ) ) ( not ( = ?auto_432602 ?auto_432604 ) ) ( not ( = ?auto_432602 ?auto_432605 ) ) ( not ( = ?auto_432602 ?auto_432606 ) ) ( not ( = ?auto_432602 ?auto_432607 ) ) ( not ( = ?auto_432602 ?auto_432608 ) ) ( not ( = ?auto_432602 ?auto_432609 ) ) ( not ( = ?auto_432602 ?auto_432610 ) ) ( not ( = ?auto_432603 ?auto_432604 ) ) ( not ( = ?auto_432603 ?auto_432605 ) ) ( not ( = ?auto_432603 ?auto_432606 ) ) ( not ( = ?auto_432603 ?auto_432607 ) ) ( not ( = ?auto_432603 ?auto_432608 ) ) ( not ( = ?auto_432603 ?auto_432609 ) ) ( not ( = ?auto_432603 ?auto_432610 ) ) ( not ( = ?auto_432604 ?auto_432605 ) ) ( not ( = ?auto_432604 ?auto_432606 ) ) ( not ( = ?auto_432604 ?auto_432607 ) ) ( not ( = ?auto_432604 ?auto_432608 ) ) ( not ( = ?auto_432604 ?auto_432609 ) ) ( not ( = ?auto_432604 ?auto_432610 ) ) ( not ( = ?auto_432605 ?auto_432606 ) ) ( not ( = ?auto_432605 ?auto_432607 ) ) ( not ( = ?auto_432605 ?auto_432608 ) ) ( not ( = ?auto_432605 ?auto_432609 ) ) ( not ( = ?auto_432605 ?auto_432610 ) ) ( not ( = ?auto_432606 ?auto_432607 ) ) ( not ( = ?auto_432606 ?auto_432608 ) ) ( not ( = ?auto_432606 ?auto_432609 ) ) ( not ( = ?auto_432606 ?auto_432610 ) ) ( not ( = ?auto_432607 ?auto_432608 ) ) ( not ( = ?auto_432607 ?auto_432609 ) ) ( not ( = ?auto_432607 ?auto_432610 ) ) ( not ( = ?auto_432608 ?auto_432609 ) ) ( not ( = ?auto_432608 ?auto_432610 ) ) ( not ( = ?auto_432609 ?auto_432610 ) ) ( ON ?auto_432608 ?auto_432609 ) ( ON ?auto_432607 ?auto_432608 ) ( ON ?auto_432606 ?auto_432607 ) ( ON ?auto_432605 ?auto_432606 ) ( ON ?auto_432604 ?auto_432605 ) ( ON ?auto_432603 ?auto_432604 ) ( ON ?auto_432602 ?auto_432603 ) ( ON ?auto_432601 ?auto_432602 ) ( ON ?auto_432600 ?auto_432601 ) ( ON ?auto_432599 ?auto_432600 ) ( ON ?auto_432598 ?auto_432599 ) ( CLEAR ?auto_432596 ) ( ON ?auto_432597 ?auto_432598 ) ( CLEAR ?auto_432597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_432596 ?auto_432597 )
      ( MAKE-14PILE ?auto_432596 ?auto_432597 ?auto_432598 ?auto_432599 ?auto_432600 ?auto_432601 ?auto_432602 ?auto_432603 ?auto_432604 ?auto_432605 ?auto_432606 ?auto_432607 ?auto_432608 ?auto_432609 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432625 - BLOCK
      ?auto_432626 - BLOCK
      ?auto_432627 - BLOCK
      ?auto_432628 - BLOCK
      ?auto_432629 - BLOCK
      ?auto_432630 - BLOCK
      ?auto_432631 - BLOCK
      ?auto_432632 - BLOCK
      ?auto_432633 - BLOCK
      ?auto_432634 - BLOCK
      ?auto_432635 - BLOCK
      ?auto_432636 - BLOCK
      ?auto_432637 - BLOCK
      ?auto_432638 - BLOCK
    )
    :vars
    (
      ?auto_432639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432638 ?auto_432639 ) ( ON-TABLE ?auto_432625 ) ( not ( = ?auto_432625 ?auto_432626 ) ) ( not ( = ?auto_432625 ?auto_432627 ) ) ( not ( = ?auto_432625 ?auto_432628 ) ) ( not ( = ?auto_432625 ?auto_432629 ) ) ( not ( = ?auto_432625 ?auto_432630 ) ) ( not ( = ?auto_432625 ?auto_432631 ) ) ( not ( = ?auto_432625 ?auto_432632 ) ) ( not ( = ?auto_432625 ?auto_432633 ) ) ( not ( = ?auto_432625 ?auto_432634 ) ) ( not ( = ?auto_432625 ?auto_432635 ) ) ( not ( = ?auto_432625 ?auto_432636 ) ) ( not ( = ?auto_432625 ?auto_432637 ) ) ( not ( = ?auto_432625 ?auto_432638 ) ) ( not ( = ?auto_432625 ?auto_432639 ) ) ( not ( = ?auto_432626 ?auto_432627 ) ) ( not ( = ?auto_432626 ?auto_432628 ) ) ( not ( = ?auto_432626 ?auto_432629 ) ) ( not ( = ?auto_432626 ?auto_432630 ) ) ( not ( = ?auto_432626 ?auto_432631 ) ) ( not ( = ?auto_432626 ?auto_432632 ) ) ( not ( = ?auto_432626 ?auto_432633 ) ) ( not ( = ?auto_432626 ?auto_432634 ) ) ( not ( = ?auto_432626 ?auto_432635 ) ) ( not ( = ?auto_432626 ?auto_432636 ) ) ( not ( = ?auto_432626 ?auto_432637 ) ) ( not ( = ?auto_432626 ?auto_432638 ) ) ( not ( = ?auto_432626 ?auto_432639 ) ) ( not ( = ?auto_432627 ?auto_432628 ) ) ( not ( = ?auto_432627 ?auto_432629 ) ) ( not ( = ?auto_432627 ?auto_432630 ) ) ( not ( = ?auto_432627 ?auto_432631 ) ) ( not ( = ?auto_432627 ?auto_432632 ) ) ( not ( = ?auto_432627 ?auto_432633 ) ) ( not ( = ?auto_432627 ?auto_432634 ) ) ( not ( = ?auto_432627 ?auto_432635 ) ) ( not ( = ?auto_432627 ?auto_432636 ) ) ( not ( = ?auto_432627 ?auto_432637 ) ) ( not ( = ?auto_432627 ?auto_432638 ) ) ( not ( = ?auto_432627 ?auto_432639 ) ) ( not ( = ?auto_432628 ?auto_432629 ) ) ( not ( = ?auto_432628 ?auto_432630 ) ) ( not ( = ?auto_432628 ?auto_432631 ) ) ( not ( = ?auto_432628 ?auto_432632 ) ) ( not ( = ?auto_432628 ?auto_432633 ) ) ( not ( = ?auto_432628 ?auto_432634 ) ) ( not ( = ?auto_432628 ?auto_432635 ) ) ( not ( = ?auto_432628 ?auto_432636 ) ) ( not ( = ?auto_432628 ?auto_432637 ) ) ( not ( = ?auto_432628 ?auto_432638 ) ) ( not ( = ?auto_432628 ?auto_432639 ) ) ( not ( = ?auto_432629 ?auto_432630 ) ) ( not ( = ?auto_432629 ?auto_432631 ) ) ( not ( = ?auto_432629 ?auto_432632 ) ) ( not ( = ?auto_432629 ?auto_432633 ) ) ( not ( = ?auto_432629 ?auto_432634 ) ) ( not ( = ?auto_432629 ?auto_432635 ) ) ( not ( = ?auto_432629 ?auto_432636 ) ) ( not ( = ?auto_432629 ?auto_432637 ) ) ( not ( = ?auto_432629 ?auto_432638 ) ) ( not ( = ?auto_432629 ?auto_432639 ) ) ( not ( = ?auto_432630 ?auto_432631 ) ) ( not ( = ?auto_432630 ?auto_432632 ) ) ( not ( = ?auto_432630 ?auto_432633 ) ) ( not ( = ?auto_432630 ?auto_432634 ) ) ( not ( = ?auto_432630 ?auto_432635 ) ) ( not ( = ?auto_432630 ?auto_432636 ) ) ( not ( = ?auto_432630 ?auto_432637 ) ) ( not ( = ?auto_432630 ?auto_432638 ) ) ( not ( = ?auto_432630 ?auto_432639 ) ) ( not ( = ?auto_432631 ?auto_432632 ) ) ( not ( = ?auto_432631 ?auto_432633 ) ) ( not ( = ?auto_432631 ?auto_432634 ) ) ( not ( = ?auto_432631 ?auto_432635 ) ) ( not ( = ?auto_432631 ?auto_432636 ) ) ( not ( = ?auto_432631 ?auto_432637 ) ) ( not ( = ?auto_432631 ?auto_432638 ) ) ( not ( = ?auto_432631 ?auto_432639 ) ) ( not ( = ?auto_432632 ?auto_432633 ) ) ( not ( = ?auto_432632 ?auto_432634 ) ) ( not ( = ?auto_432632 ?auto_432635 ) ) ( not ( = ?auto_432632 ?auto_432636 ) ) ( not ( = ?auto_432632 ?auto_432637 ) ) ( not ( = ?auto_432632 ?auto_432638 ) ) ( not ( = ?auto_432632 ?auto_432639 ) ) ( not ( = ?auto_432633 ?auto_432634 ) ) ( not ( = ?auto_432633 ?auto_432635 ) ) ( not ( = ?auto_432633 ?auto_432636 ) ) ( not ( = ?auto_432633 ?auto_432637 ) ) ( not ( = ?auto_432633 ?auto_432638 ) ) ( not ( = ?auto_432633 ?auto_432639 ) ) ( not ( = ?auto_432634 ?auto_432635 ) ) ( not ( = ?auto_432634 ?auto_432636 ) ) ( not ( = ?auto_432634 ?auto_432637 ) ) ( not ( = ?auto_432634 ?auto_432638 ) ) ( not ( = ?auto_432634 ?auto_432639 ) ) ( not ( = ?auto_432635 ?auto_432636 ) ) ( not ( = ?auto_432635 ?auto_432637 ) ) ( not ( = ?auto_432635 ?auto_432638 ) ) ( not ( = ?auto_432635 ?auto_432639 ) ) ( not ( = ?auto_432636 ?auto_432637 ) ) ( not ( = ?auto_432636 ?auto_432638 ) ) ( not ( = ?auto_432636 ?auto_432639 ) ) ( not ( = ?auto_432637 ?auto_432638 ) ) ( not ( = ?auto_432637 ?auto_432639 ) ) ( not ( = ?auto_432638 ?auto_432639 ) ) ( ON ?auto_432637 ?auto_432638 ) ( ON ?auto_432636 ?auto_432637 ) ( ON ?auto_432635 ?auto_432636 ) ( ON ?auto_432634 ?auto_432635 ) ( ON ?auto_432633 ?auto_432634 ) ( ON ?auto_432632 ?auto_432633 ) ( ON ?auto_432631 ?auto_432632 ) ( ON ?auto_432630 ?auto_432631 ) ( ON ?auto_432629 ?auto_432630 ) ( ON ?auto_432628 ?auto_432629 ) ( ON ?auto_432627 ?auto_432628 ) ( CLEAR ?auto_432625 ) ( ON ?auto_432626 ?auto_432627 ) ( CLEAR ?auto_432626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_432625 ?auto_432626 )
      ( MAKE-14PILE ?auto_432625 ?auto_432626 ?auto_432627 ?auto_432628 ?auto_432629 ?auto_432630 ?auto_432631 ?auto_432632 ?auto_432633 ?auto_432634 ?auto_432635 ?auto_432636 ?auto_432637 ?auto_432638 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432654 - BLOCK
      ?auto_432655 - BLOCK
      ?auto_432656 - BLOCK
      ?auto_432657 - BLOCK
      ?auto_432658 - BLOCK
      ?auto_432659 - BLOCK
      ?auto_432660 - BLOCK
      ?auto_432661 - BLOCK
      ?auto_432662 - BLOCK
      ?auto_432663 - BLOCK
      ?auto_432664 - BLOCK
      ?auto_432665 - BLOCK
      ?auto_432666 - BLOCK
      ?auto_432667 - BLOCK
    )
    :vars
    (
      ?auto_432668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432667 ?auto_432668 ) ( not ( = ?auto_432654 ?auto_432655 ) ) ( not ( = ?auto_432654 ?auto_432656 ) ) ( not ( = ?auto_432654 ?auto_432657 ) ) ( not ( = ?auto_432654 ?auto_432658 ) ) ( not ( = ?auto_432654 ?auto_432659 ) ) ( not ( = ?auto_432654 ?auto_432660 ) ) ( not ( = ?auto_432654 ?auto_432661 ) ) ( not ( = ?auto_432654 ?auto_432662 ) ) ( not ( = ?auto_432654 ?auto_432663 ) ) ( not ( = ?auto_432654 ?auto_432664 ) ) ( not ( = ?auto_432654 ?auto_432665 ) ) ( not ( = ?auto_432654 ?auto_432666 ) ) ( not ( = ?auto_432654 ?auto_432667 ) ) ( not ( = ?auto_432654 ?auto_432668 ) ) ( not ( = ?auto_432655 ?auto_432656 ) ) ( not ( = ?auto_432655 ?auto_432657 ) ) ( not ( = ?auto_432655 ?auto_432658 ) ) ( not ( = ?auto_432655 ?auto_432659 ) ) ( not ( = ?auto_432655 ?auto_432660 ) ) ( not ( = ?auto_432655 ?auto_432661 ) ) ( not ( = ?auto_432655 ?auto_432662 ) ) ( not ( = ?auto_432655 ?auto_432663 ) ) ( not ( = ?auto_432655 ?auto_432664 ) ) ( not ( = ?auto_432655 ?auto_432665 ) ) ( not ( = ?auto_432655 ?auto_432666 ) ) ( not ( = ?auto_432655 ?auto_432667 ) ) ( not ( = ?auto_432655 ?auto_432668 ) ) ( not ( = ?auto_432656 ?auto_432657 ) ) ( not ( = ?auto_432656 ?auto_432658 ) ) ( not ( = ?auto_432656 ?auto_432659 ) ) ( not ( = ?auto_432656 ?auto_432660 ) ) ( not ( = ?auto_432656 ?auto_432661 ) ) ( not ( = ?auto_432656 ?auto_432662 ) ) ( not ( = ?auto_432656 ?auto_432663 ) ) ( not ( = ?auto_432656 ?auto_432664 ) ) ( not ( = ?auto_432656 ?auto_432665 ) ) ( not ( = ?auto_432656 ?auto_432666 ) ) ( not ( = ?auto_432656 ?auto_432667 ) ) ( not ( = ?auto_432656 ?auto_432668 ) ) ( not ( = ?auto_432657 ?auto_432658 ) ) ( not ( = ?auto_432657 ?auto_432659 ) ) ( not ( = ?auto_432657 ?auto_432660 ) ) ( not ( = ?auto_432657 ?auto_432661 ) ) ( not ( = ?auto_432657 ?auto_432662 ) ) ( not ( = ?auto_432657 ?auto_432663 ) ) ( not ( = ?auto_432657 ?auto_432664 ) ) ( not ( = ?auto_432657 ?auto_432665 ) ) ( not ( = ?auto_432657 ?auto_432666 ) ) ( not ( = ?auto_432657 ?auto_432667 ) ) ( not ( = ?auto_432657 ?auto_432668 ) ) ( not ( = ?auto_432658 ?auto_432659 ) ) ( not ( = ?auto_432658 ?auto_432660 ) ) ( not ( = ?auto_432658 ?auto_432661 ) ) ( not ( = ?auto_432658 ?auto_432662 ) ) ( not ( = ?auto_432658 ?auto_432663 ) ) ( not ( = ?auto_432658 ?auto_432664 ) ) ( not ( = ?auto_432658 ?auto_432665 ) ) ( not ( = ?auto_432658 ?auto_432666 ) ) ( not ( = ?auto_432658 ?auto_432667 ) ) ( not ( = ?auto_432658 ?auto_432668 ) ) ( not ( = ?auto_432659 ?auto_432660 ) ) ( not ( = ?auto_432659 ?auto_432661 ) ) ( not ( = ?auto_432659 ?auto_432662 ) ) ( not ( = ?auto_432659 ?auto_432663 ) ) ( not ( = ?auto_432659 ?auto_432664 ) ) ( not ( = ?auto_432659 ?auto_432665 ) ) ( not ( = ?auto_432659 ?auto_432666 ) ) ( not ( = ?auto_432659 ?auto_432667 ) ) ( not ( = ?auto_432659 ?auto_432668 ) ) ( not ( = ?auto_432660 ?auto_432661 ) ) ( not ( = ?auto_432660 ?auto_432662 ) ) ( not ( = ?auto_432660 ?auto_432663 ) ) ( not ( = ?auto_432660 ?auto_432664 ) ) ( not ( = ?auto_432660 ?auto_432665 ) ) ( not ( = ?auto_432660 ?auto_432666 ) ) ( not ( = ?auto_432660 ?auto_432667 ) ) ( not ( = ?auto_432660 ?auto_432668 ) ) ( not ( = ?auto_432661 ?auto_432662 ) ) ( not ( = ?auto_432661 ?auto_432663 ) ) ( not ( = ?auto_432661 ?auto_432664 ) ) ( not ( = ?auto_432661 ?auto_432665 ) ) ( not ( = ?auto_432661 ?auto_432666 ) ) ( not ( = ?auto_432661 ?auto_432667 ) ) ( not ( = ?auto_432661 ?auto_432668 ) ) ( not ( = ?auto_432662 ?auto_432663 ) ) ( not ( = ?auto_432662 ?auto_432664 ) ) ( not ( = ?auto_432662 ?auto_432665 ) ) ( not ( = ?auto_432662 ?auto_432666 ) ) ( not ( = ?auto_432662 ?auto_432667 ) ) ( not ( = ?auto_432662 ?auto_432668 ) ) ( not ( = ?auto_432663 ?auto_432664 ) ) ( not ( = ?auto_432663 ?auto_432665 ) ) ( not ( = ?auto_432663 ?auto_432666 ) ) ( not ( = ?auto_432663 ?auto_432667 ) ) ( not ( = ?auto_432663 ?auto_432668 ) ) ( not ( = ?auto_432664 ?auto_432665 ) ) ( not ( = ?auto_432664 ?auto_432666 ) ) ( not ( = ?auto_432664 ?auto_432667 ) ) ( not ( = ?auto_432664 ?auto_432668 ) ) ( not ( = ?auto_432665 ?auto_432666 ) ) ( not ( = ?auto_432665 ?auto_432667 ) ) ( not ( = ?auto_432665 ?auto_432668 ) ) ( not ( = ?auto_432666 ?auto_432667 ) ) ( not ( = ?auto_432666 ?auto_432668 ) ) ( not ( = ?auto_432667 ?auto_432668 ) ) ( ON ?auto_432666 ?auto_432667 ) ( ON ?auto_432665 ?auto_432666 ) ( ON ?auto_432664 ?auto_432665 ) ( ON ?auto_432663 ?auto_432664 ) ( ON ?auto_432662 ?auto_432663 ) ( ON ?auto_432661 ?auto_432662 ) ( ON ?auto_432660 ?auto_432661 ) ( ON ?auto_432659 ?auto_432660 ) ( ON ?auto_432658 ?auto_432659 ) ( ON ?auto_432657 ?auto_432658 ) ( ON ?auto_432656 ?auto_432657 ) ( ON ?auto_432655 ?auto_432656 ) ( ON ?auto_432654 ?auto_432655 ) ( CLEAR ?auto_432654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_432654 )
      ( MAKE-14PILE ?auto_432654 ?auto_432655 ?auto_432656 ?auto_432657 ?auto_432658 ?auto_432659 ?auto_432660 ?auto_432661 ?auto_432662 ?auto_432663 ?auto_432664 ?auto_432665 ?auto_432666 ?auto_432667 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432683 - BLOCK
      ?auto_432684 - BLOCK
      ?auto_432685 - BLOCK
      ?auto_432686 - BLOCK
      ?auto_432687 - BLOCK
      ?auto_432688 - BLOCK
      ?auto_432689 - BLOCK
      ?auto_432690 - BLOCK
      ?auto_432691 - BLOCK
      ?auto_432692 - BLOCK
      ?auto_432693 - BLOCK
      ?auto_432694 - BLOCK
      ?auto_432695 - BLOCK
      ?auto_432696 - BLOCK
    )
    :vars
    (
      ?auto_432697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432696 ?auto_432697 ) ( not ( = ?auto_432683 ?auto_432684 ) ) ( not ( = ?auto_432683 ?auto_432685 ) ) ( not ( = ?auto_432683 ?auto_432686 ) ) ( not ( = ?auto_432683 ?auto_432687 ) ) ( not ( = ?auto_432683 ?auto_432688 ) ) ( not ( = ?auto_432683 ?auto_432689 ) ) ( not ( = ?auto_432683 ?auto_432690 ) ) ( not ( = ?auto_432683 ?auto_432691 ) ) ( not ( = ?auto_432683 ?auto_432692 ) ) ( not ( = ?auto_432683 ?auto_432693 ) ) ( not ( = ?auto_432683 ?auto_432694 ) ) ( not ( = ?auto_432683 ?auto_432695 ) ) ( not ( = ?auto_432683 ?auto_432696 ) ) ( not ( = ?auto_432683 ?auto_432697 ) ) ( not ( = ?auto_432684 ?auto_432685 ) ) ( not ( = ?auto_432684 ?auto_432686 ) ) ( not ( = ?auto_432684 ?auto_432687 ) ) ( not ( = ?auto_432684 ?auto_432688 ) ) ( not ( = ?auto_432684 ?auto_432689 ) ) ( not ( = ?auto_432684 ?auto_432690 ) ) ( not ( = ?auto_432684 ?auto_432691 ) ) ( not ( = ?auto_432684 ?auto_432692 ) ) ( not ( = ?auto_432684 ?auto_432693 ) ) ( not ( = ?auto_432684 ?auto_432694 ) ) ( not ( = ?auto_432684 ?auto_432695 ) ) ( not ( = ?auto_432684 ?auto_432696 ) ) ( not ( = ?auto_432684 ?auto_432697 ) ) ( not ( = ?auto_432685 ?auto_432686 ) ) ( not ( = ?auto_432685 ?auto_432687 ) ) ( not ( = ?auto_432685 ?auto_432688 ) ) ( not ( = ?auto_432685 ?auto_432689 ) ) ( not ( = ?auto_432685 ?auto_432690 ) ) ( not ( = ?auto_432685 ?auto_432691 ) ) ( not ( = ?auto_432685 ?auto_432692 ) ) ( not ( = ?auto_432685 ?auto_432693 ) ) ( not ( = ?auto_432685 ?auto_432694 ) ) ( not ( = ?auto_432685 ?auto_432695 ) ) ( not ( = ?auto_432685 ?auto_432696 ) ) ( not ( = ?auto_432685 ?auto_432697 ) ) ( not ( = ?auto_432686 ?auto_432687 ) ) ( not ( = ?auto_432686 ?auto_432688 ) ) ( not ( = ?auto_432686 ?auto_432689 ) ) ( not ( = ?auto_432686 ?auto_432690 ) ) ( not ( = ?auto_432686 ?auto_432691 ) ) ( not ( = ?auto_432686 ?auto_432692 ) ) ( not ( = ?auto_432686 ?auto_432693 ) ) ( not ( = ?auto_432686 ?auto_432694 ) ) ( not ( = ?auto_432686 ?auto_432695 ) ) ( not ( = ?auto_432686 ?auto_432696 ) ) ( not ( = ?auto_432686 ?auto_432697 ) ) ( not ( = ?auto_432687 ?auto_432688 ) ) ( not ( = ?auto_432687 ?auto_432689 ) ) ( not ( = ?auto_432687 ?auto_432690 ) ) ( not ( = ?auto_432687 ?auto_432691 ) ) ( not ( = ?auto_432687 ?auto_432692 ) ) ( not ( = ?auto_432687 ?auto_432693 ) ) ( not ( = ?auto_432687 ?auto_432694 ) ) ( not ( = ?auto_432687 ?auto_432695 ) ) ( not ( = ?auto_432687 ?auto_432696 ) ) ( not ( = ?auto_432687 ?auto_432697 ) ) ( not ( = ?auto_432688 ?auto_432689 ) ) ( not ( = ?auto_432688 ?auto_432690 ) ) ( not ( = ?auto_432688 ?auto_432691 ) ) ( not ( = ?auto_432688 ?auto_432692 ) ) ( not ( = ?auto_432688 ?auto_432693 ) ) ( not ( = ?auto_432688 ?auto_432694 ) ) ( not ( = ?auto_432688 ?auto_432695 ) ) ( not ( = ?auto_432688 ?auto_432696 ) ) ( not ( = ?auto_432688 ?auto_432697 ) ) ( not ( = ?auto_432689 ?auto_432690 ) ) ( not ( = ?auto_432689 ?auto_432691 ) ) ( not ( = ?auto_432689 ?auto_432692 ) ) ( not ( = ?auto_432689 ?auto_432693 ) ) ( not ( = ?auto_432689 ?auto_432694 ) ) ( not ( = ?auto_432689 ?auto_432695 ) ) ( not ( = ?auto_432689 ?auto_432696 ) ) ( not ( = ?auto_432689 ?auto_432697 ) ) ( not ( = ?auto_432690 ?auto_432691 ) ) ( not ( = ?auto_432690 ?auto_432692 ) ) ( not ( = ?auto_432690 ?auto_432693 ) ) ( not ( = ?auto_432690 ?auto_432694 ) ) ( not ( = ?auto_432690 ?auto_432695 ) ) ( not ( = ?auto_432690 ?auto_432696 ) ) ( not ( = ?auto_432690 ?auto_432697 ) ) ( not ( = ?auto_432691 ?auto_432692 ) ) ( not ( = ?auto_432691 ?auto_432693 ) ) ( not ( = ?auto_432691 ?auto_432694 ) ) ( not ( = ?auto_432691 ?auto_432695 ) ) ( not ( = ?auto_432691 ?auto_432696 ) ) ( not ( = ?auto_432691 ?auto_432697 ) ) ( not ( = ?auto_432692 ?auto_432693 ) ) ( not ( = ?auto_432692 ?auto_432694 ) ) ( not ( = ?auto_432692 ?auto_432695 ) ) ( not ( = ?auto_432692 ?auto_432696 ) ) ( not ( = ?auto_432692 ?auto_432697 ) ) ( not ( = ?auto_432693 ?auto_432694 ) ) ( not ( = ?auto_432693 ?auto_432695 ) ) ( not ( = ?auto_432693 ?auto_432696 ) ) ( not ( = ?auto_432693 ?auto_432697 ) ) ( not ( = ?auto_432694 ?auto_432695 ) ) ( not ( = ?auto_432694 ?auto_432696 ) ) ( not ( = ?auto_432694 ?auto_432697 ) ) ( not ( = ?auto_432695 ?auto_432696 ) ) ( not ( = ?auto_432695 ?auto_432697 ) ) ( not ( = ?auto_432696 ?auto_432697 ) ) ( ON ?auto_432695 ?auto_432696 ) ( ON ?auto_432694 ?auto_432695 ) ( ON ?auto_432693 ?auto_432694 ) ( ON ?auto_432692 ?auto_432693 ) ( ON ?auto_432691 ?auto_432692 ) ( ON ?auto_432690 ?auto_432691 ) ( ON ?auto_432689 ?auto_432690 ) ( ON ?auto_432688 ?auto_432689 ) ( ON ?auto_432687 ?auto_432688 ) ( ON ?auto_432686 ?auto_432687 ) ( ON ?auto_432685 ?auto_432686 ) ( ON ?auto_432684 ?auto_432685 ) ( ON ?auto_432683 ?auto_432684 ) ( CLEAR ?auto_432683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_432683 )
      ( MAKE-14PILE ?auto_432683 ?auto_432684 ?auto_432685 ?auto_432686 ?auto_432687 ?auto_432688 ?auto_432689 ?auto_432690 ?auto_432691 ?auto_432692 ?auto_432693 ?auto_432694 ?auto_432695 ?auto_432696 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432713 - BLOCK
      ?auto_432714 - BLOCK
      ?auto_432715 - BLOCK
      ?auto_432716 - BLOCK
      ?auto_432717 - BLOCK
      ?auto_432718 - BLOCK
      ?auto_432719 - BLOCK
      ?auto_432720 - BLOCK
      ?auto_432721 - BLOCK
      ?auto_432722 - BLOCK
      ?auto_432723 - BLOCK
      ?auto_432724 - BLOCK
      ?auto_432725 - BLOCK
      ?auto_432726 - BLOCK
      ?auto_432727 - BLOCK
    )
    :vars
    (
      ?auto_432728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_432726 ) ( ON ?auto_432727 ?auto_432728 ) ( CLEAR ?auto_432727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_432713 ) ( ON ?auto_432714 ?auto_432713 ) ( ON ?auto_432715 ?auto_432714 ) ( ON ?auto_432716 ?auto_432715 ) ( ON ?auto_432717 ?auto_432716 ) ( ON ?auto_432718 ?auto_432717 ) ( ON ?auto_432719 ?auto_432718 ) ( ON ?auto_432720 ?auto_432719 ) ( ON ?auto_432721 ?auto_432720 ) ( ON ?auto_432722 ?auto_432721 ) ( ON ?auto_432723 ?auto_432722 ) ( ON ?auto_432724 ?auto_432723 ) ( ON ?auto_432725 ?auto_432724 ) ( ON ?auto_432726 ?auto_432725 ) ( not ( = ?auto_432713 ?auto_432714 ) ) ( not ( = ?auto_432713 ?auto_432715 ) ) ( not ( = ?auto_432713 ?auto_432716 ) ) ( not ( = ?auto_432713 ?auto_432717 ) ) ( not ( = ?auto_432713 ?auto_432718 ) ) ( not ( = ?auto_432713 ?auto_432719 ) ) ( not ( = ?auto_432713 ?auto_432720 ) ) ( not ( = ?auto_432713 ?auto_432721 ) ) ( not ( = ?auto_432713 ?auto_432722 ) ) ( not ( = ?auto_432713 ?auto_432723 ) ) ( not ( = ?auto_432713 ?auto_432724 ) ) ( not ( = ?auto_432713 ?auto_432725 ) ) ( not ( = ?auto_432713 ?auto_432726 ) ) ( not ( = ?auto_432713 ?auto_432727 ) ) ( not ( = ?auto_432713 ?auto_432728 ) ) ( not ( = ?auto_432714 ?auto_432715 ) ) ( not ( = ?auto_432714 ?auto_432716 ) ) ( not ( = ?auto_432714 ?auto_432717 ) ) ( not ( = ?auto_432714 ?auto_432718 ) ) ( not ( = ?auto_432714 ?auto_432719 ) ) ( not ( = ?auto_432714 ?auto_432720 ) ) ( not ( = ?auto_432714 ?auto_432721 ) ) ( not ( = ?auto_432714 ?auto_432722 ) ) ( not ( = ?auto_432714 ?auto_432723 ) ) ( not ( = ?auto_432714 ?auto_432724 ) ) ( not ( = ?auto_432714 ?auto_432725 ) ) ( not ( = ?auto_432714 ?auto_432726 ) ) ( not ( = ?auto_432714 ?auto_432727 ) ) ( not ( = ?auto_432714 ?auto_432728 ) ) ( not ( = ?auto_432715 ?auto_432716 ) ) ( not ( = ?auto_432715 ?auto_432717 ) ) ( not ( = ?auto_432715 ?auto_432718 ) ) ( not ( = ?auto_432715 ?auto_432719 ) ) ( not ( = ?auto_432715 ?auto_432720 ) ) ( not ( = ?auto_432715 ?auto_432721 ) ) ( not ( = ?auto_432715 ?auto_432722 ) ) ( not ( = ?auto_432715 ?auto_432723 ) ) ( not ( = ?auto_432715 ?auto_432724 ) ) ( not ( = ?auto_432715 ?auto_432725 ) ) ( not ( = ?auto_432715 ?auto_432726 ) ) ( not ( = ?auto_432715 ?auto_432727 ) ) ( not ( = ?auto_432715 ?auto_432728 ) ) ( not ( = ?auto_432716 ?auto_432717 ) ) ( not ( = ?auto_432716 ?auto_432718 ) ) ( not ( = ?auto_432716 ?auto_432719 ) ) ( not ( = ?auto_432716 ?auto_432720 ) ) ( not ( = ?auto_432716 ?auto_432721 ) ) ( not ( = ?auto_432716 ?auto_432722 ) ) ( not ( = ?auto_432716 ?auto_432723 ) ) ( not ( = ?auto_432716 ?auto_432724 ) ) ( not ( = ?auto_432716 ?auto_432725 ) ) ( not ( = ?auto_432716 ?auto_432726 ) ) ( not ( = ?auto_432716 ?auto_432727 ) ) ( not ( = ?auto_432716 ?auto_432728 ) ) ( not ( = ?auto_432717 ?auto_432718 ) ) ( not ( = ?auto_432717 ?auto_432719 ) ) ( not ( = ?auto_432717 ?auto_432720 ) ) ( not ( = ?auto_432717 ?auto_432721 ) ) ( not ( = ?auto_432717 ?auto_432722 ) ) ( not ( = ?auto_432717 ?auto_432723 ) ) ( not ( = ?auto_432717 ?auto_432724 ) ) ( not ( = ?auto_432717 ?auto_432725 ) ) ( not ( = ?auto_432717 ?auto_432726 ) ) ( not ( = ?auto_432717 ?auto_432727 ) ) ( not ( = ?auto_432717 ?auto_432728 ) ) ( not ( = ?auto_432718 ?auto_432719 ) ) ( not ( = ?auto_432718 ?auto_432720 ) ) ( not ( = ?auto_432718 ?auto_432721 ) ) ( not ( = ?auto_432718 ?auto_432722 ) ) ( not ( = ?auto_432718 ?auto_432723 ) ) ( not ( = ?auto_432718 ?auto_432724 ) ) ( not ( = ?auto_432718 ?auto_432725 ) ) ( not ( = ?auto_432718 ?auto_432726 ) ) ( not ( = ?auto_432718 ?auto_432727 ) ) ( not ( = ?auto_432718 ?auto_432728 ) ) ( not ( = ?auto_432719 ?auto_432720 ) ) ( not ( = ?auto_432719 ?auto_432721 ) ) ( not ( = ?auto_432719 ?auto_432722 ) ) ( not ( = ?auto_432719 ?auto_432723 ) ) ( not ( = ?auto_432719 ?auto_432724 ) ) ( not ( = ?auto_432719 ?auto_432725 ) ) ( not ( = ?auto_432719 ?auto_432726 ) ) ( not ( = ?auto_432719 ?auto_432727 ) ) ( not ( = ?auto_432719 ?auto_432728 ) ) ( not ( = ?auto_432720 ?auto_432721 ) ) ( not ( = ?auto_432720 ?auto_432722 ) ) ( not ( = ?auto_432720 ?auto_432723 ) ) ( not ( = ?auto_432720 ?auto_432724 ) ) ( not ( = ?auto_432720 ?auto_432725 ) ) ( not ( = ?auto_432720 ?auto_432726 ) ) ( not ( = ?auto_432720 ?auto_432727 ) ) ( not ( = ?auto_432720 ?auto_432728 ) ) ( not ( = ?auto_432721 ?auto_432722 ) ) ( not ( = ?auto_432721 ?auto_432723 ) ) ( not ( = ?auto_432721 ?auto_432724 ) ) ( not ( = ?auto_432721 ?auto_432725 ) ) ( not ( = ?auto_432721 ?auto_432726 ) ) ( not ( = ?auto_432721 ?auto_432727 ) ) ( not ( = ?auto_432721 ?auto_432728 ) ) ( not ( = ?auto_432722 ?auto_432723 ) ) ( not ( = ?auto_432722 ?auto_432724 ) ) ( not ( = ?auto_432722 ?auto_432725 ) ) ( not ( = ?auto_432722 ?auto_432726 ) ) ( not ( = ?auto_432722 ?auto_432727 ) ) ( not ( = ?auto_432722 ?auto_432728 ) ) ( not ( = ?auto_432723 ?auto_432724 ) ) ( not ( = ?auto_432723 ?auto_432725 ) ) ( not ( = ?auto_432723 ?auto_432726 ) ) ( not ( = ?auto_432723 ?auto_432727 ) ) ( not ( = ?auto_432723 ?auto_432728 ) ) ( not ( = ?auto_432724 ?auto_432725 ) ) ( not ( = ?auto_432724 ?auto_432726 ) ) ( not ( = ?auto_432724 ?auto_432727 ) ) ( not ( = ?auto_432724 ?auto_432728 ) ) ( not ( = ?auto_432725 ?auto_432726 ) ) ( not ( = ?auto_432725 ?auto_432727 ) ) ( not ( = ?auto_432725 ?auto_432728 ) ) ( not ( = ?auto_432726 ?auto_432727 ) ) ( not ( = ?auto_432726 ?auto_432728 ) ) ( not ( = ?auto_432727 ?auto_432728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_432727 ?auto_432728 )
      ( !STACK ?auto_432727 ?auto_432726 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432744 - BLOCK
      ?auto_432745 - BLOCK
      ?auto_432746 - BLOCK
      ?auto_432747 - BLOCK
      ?auto_432748 - BLOCK
      ?auto_432749 - BLOCK
      ?auto_432750 - BLOCK
      ?auto_432751 - BLOCK
      ?auto_432752 - BLOCK
      ?auto_432753 - BLOCK
      ?auto_432754 - BLOCK
      ?auto_432755 - BLOCK
      ?auto_432756 - BLOCK
      ?auto_432757 - BLOCK
      ?auto_432758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_432757 ) ( ON-TABLE ?auto_432758 ) ( CLEAR ?auto_432758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_432744 ) ( ON ?auto_432745 ?auto_432744 ) ( ON ?auto_432746 ?auto_432745 ) ( ON ?auto_432747 ?auto_432746 ) ( ON ?auto_432748 ?auto_432747 ) ( ON ?auto_432749 ?auto_432748 ) ( ON ?auto_432750 ?auto_432749 ) ( ON ?auto_432751 ?auto_432750 ) ( ON ?auto_432752 ?auto_432751 ) ( ON ?auto_432753 ?auto_432752 ) ( ON ?auto_432754 ?auto_432753 ) ( ON ?auto_432755 ?auto_432754 ) ( ON ?auto_432756 ?auto_432755 ) ( ON ?auto_432757 ?auto_432756 ) ( not ( = ?auto_432744 ?auto_432745 ) ) ( not ( = ?auto_432744 ?auto_432746 ) ) ( not ( = ?auto_432744 ?auto_432747 ) ) ( not ( = ?auto_432744 ?auto_432748 ) ) ( not ( = ?auto_432744 ?auto_432749 ) ) ( not ( = ?auto_432744 ?auto_432750 ) ) ( not ( = ?auto_432744 ?auto_432751 ) ) ( not ( = ?auto_432744 ?auto_432752 ) ) ( not ( = ?auto_432744 ?auto_432753 ) ) ( not ( = ?auto_432744 ?auto_432754 ) ) ( not ( = ?auto_432744 ?auto_432755 ) ) ( not ( = ?auto_432744 ?auto_432756 ) ) ( not ( = ?auto_432744 ?auto_432757 ) ) ( not ( = ?auto_432744 ?auto_432758 ) ) ( not ( = ?auto_432745 ?auto_432746 ) ) ( not ( = ?auto_432745 ?auto_432747 ) ) ( not ( = ?auto_432745 ?auto_432748 ) ) ( not ( = ?auto_432745 ?auto_432749 ) ) ( not ( = ?auto_432745 ?auto_432750 ) ) ( not ( = ?auto_432745 ?auto_432751 ) ) ( not ( = ?auto_432745 ?auto_432752 ) ) ( not ( = ?auto_432745 ?auto_432753 ) ) ( not ( = ?auto_432745 ?auto_432754 ) ) ( not ( = ?auto_432745 ?auto_432755 ) ) ( not ( = ?auto_432745 ?auto_432756 ) ) ( not ( = ?auto_432745 ?auto_432757 ) ) ( not ( = ?auto_432745 ?auto_432758 ) ) ( not ( = ?auto_432746 ?auto_432747 ) ) ( not ( = ?auto_432746 ?auto_432748 ) ) ( not ( = ?auto_432746 ?auto_432749 ) ) ( not ( = ?auto_432746 ?auto_432750 ) ) ( not ( = ?auto_432746 ?auto_432751 ) ) ( not ( = ?auto_432746 ?auto_432752 ) ) ( not ( = ?auto_432746 ?auto_432753 ) ) ( not ( = ?auto_432746 ?auto_432754 ) ) ( not ( = ?auto_432746 ?auto_432755 ) ) ( not ( = ?auto_432746 ?auto_432756 ) ) ( not ( = ?auto_432746 ?auto_432757 ) ) ( not ( = ?auto_432746 ?auto_432758 ) ) ( not ( = ?auto_432747 ?auto_432748 ) ) ( not ( = ?auto_432747 ?auto_432749 ) ) ( not ( = ?auto_432747 ?auto_432750 ) ) ( not ( = ?auto_432747 ?auto_432751 ) ) ( not ( = ?auto_432747 ?auto_432752 ) ) ( not ( = ?auto_432747 ?auto_432753 ) ) ( not ( = ?auto_432747 ?auto_432754 ) ) ( not ( = ?auto_432747 ?auto_432755 ) ) ( not ( = ?auto_432747 ?auto_432756 ) ) ( not ( = ?auto_432747 ?auto_432757 ) ) ( not ( = ?auto_432747 ?auto_432758 ) ) ( not ( = ?auto_432748 ?auto_432749 ) ) ( not ( = ?auto_432748 ?auto_432750 ) ) ( not ( = ?auto_432748 ?auto_432751 ) ) ( not ( = ?auto_432748 ?auto_432752 ) ) ( not ( = ?auto_432748 ?auto_432753 ) ) ( not ( = ?auto_432748 ?auto_432754 ) ) ( not ( = ?auto_432748 ?auto_432755 ) ) ( not ( = ?auto_432748 ?auto_432756 ) ) ( not ( = ?auto_432748 ?auto_432757 ) ) ( not ( = ?auto_432748 ?auto_432758 ) ) ( not ( = ?auto_432749 ?auto_432750 ) ) ( not ( = ?auto_432749 ?auto_432751 ) ) ( not ( = ?auto_432749 ?auto_432752 ) ) ( not ( = ?auto_432749 ?auto_432753 ) ) ( not ( = ?auto_432749 ?auto_432754 ) ) ( not ( = ?auto_432749 ?auto_432755 ) ) ( not ( = ?auto_432749 ?auto_432756 ) ) ( not ( = ?auto_432749 ?auto_432757 ) ) ( not ( = ?auto_432749 ?auto_432758 ) ) ( not ( = ?auto_432750 ?auto_432751 ) ) ( not ( = ?auto_432750 ?auto_432752 ) ) ( not ( = ?auto_432750 ?auto_432753 ) ) ( not ( = ?auto_432750 ?auto_432754 ) ) ( not ( = ?auto_432750 ?auto_432755 ) ) ( not ( = ?auto_432750 ?auto_432756 ) ) ( not ( = ?auto_432750 ?auto_432757 ) ) ( not ( = ?auto_432750 ?auto_432758 ) ) ( not ( = ?auto_432751 ?auto_432752 ) ) ( not ( = ?auto_432751 ?auto_432753 ) ) ( not ( = ?auto_432751 ?auto_432754 ) ) ( not ( = ?auto_432751 ?auto_432755 ) ) ( not ( = ?auto_432751 ?auto_432756 ) ) ( not ( = ?auto_432751 ?auto_432757 ) ) ( not ( = ?auto_432751 ?auto_432758 ) ) ( not ( = ?auto_432752 ?auto_432753 ) ) ( not ( = ?auto_432752 ?auto_432754 ) ) ( not ( = ?auto_432752 ?auto_432755 ) ) ( not ( = ?auto_432752 ?auto_432756 ) ) ( not ( = ?auto_432752 ?auto_432757 ) ) ( not ( = ?auto_432752 ?auto_432758 ) ) ( not ( = ?auto_432753 ?auto_432754 ) ) ( not ( = ?auto_432753 ?auto_432755 ) ) ( not ( = ?auto_432753 ?auto_432756 ) ) ( not ( = ?auto_432753 ?auto_432757 ) ) ( not ( = ?auto_432753 ?auto_432758 ) ) ( not ( = ?auto_432754 ?auto_432755 ) ) ( not ( = ?auto_432754 ?auto_432756 ) ) ( not ( = ?auto_432754 ?auto_432757 ) ) ( not ( = ?auto_432754 ?auto_432758 ) ) ( not ( = ?auto_432755 ?auto_432756 ) ) ( not ( = ?auto_432755 ?auto_432757 ) ) ( not ( = ?auto_432755 ?auto_432758 ) ) ( not ( = ?auto_432756 ?auto_432757 ) ) ( not ( = ?auto_432756 ?auto_432758 ) ) ( not ( = ?auto_432757 ?auto_432758 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_432758 )
      ( !STACK ?auto_432758 ?auto_432757 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432774 - BLOCK
      ?auto_432775 - BLOCK
      ?auto_432776 - BLOCK
      ?auto_432777 - BLOCK
      ?auto_432778 - BLOCK
      ?auto_432779 - BLOCK
      ?auto_432780 - BLOCK
      ?auto_432781 - BLOCK
      ?auto_432782 - BLOCK
      ?auto_432783 - BLOCK
      ?auto_432784 - BLOCK
      ?auto_432785 - BLOCK
      ?auto_432786 - BLOCK
      ?auto_432787 - BLOCK
      ?auto_432788 - BLOCK
    )
    :vars
    (
      ?auto_432789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432788 ?auto_432789 ) ( ON-TABLE ?auto_432774 ) ( ON ?auto_432775 ?auto_432774 ) ( ON ?auto_432776 ?auto_432775 ) ( ON ?auto_432777 ?auto_432776 ) ( ON ?auto_432778 ?auto_432777 ) ( ON ?auto_432779 ?auto_432778 ) ( ON ?auto_432780 ?auto_432779 ) ( ON ?auto_432781 ?auto_432780 ) ( ON ?auto_432782 ?auto_432781 ) ( ON ?auto_432783 ?auto_432782 ) ( ON ?auto_432784 ?auto_432783 ) ( ON ?auto_432785 ?auto_432784 ) ( ON ?auto_432786 ?auto_432785 ) ( not ( = ?auto_432774 ?auto_432775 ) ) ( not ( = ?auto_432774 ?auto_432776 ) ) ( not ( = ?auto_432774 ?auto_432777 ) ) ( not ( = ?auto_432774 ?auto_432778 ) ) ( not ( = ?auto_432774 ?auto_432779 ) ) ( not ( = ?auto_432774 ?auto_432780 ) ) ( not ( = ?auto_432774 ?auto_432781 ) ) ( not ( = ?auto_432774 ?auto_432782 ) ) ( not ( = ?auto_432774 ?auto_432783 ) ) ( not ( = ?auto_432774 ?auto_432784 ) ) ( not ( = ?auto_432774 ?auto_432785 ) ) ( not ( = ?auto_432774 ?auto_432786 ) ) ( not ( = ?auto_432774 ?auto_432787 ) ) ( not ( = ?auto_432774 ?auto_432788 ) ) ( not ( = ?auto_432774 ?auto_432789 ) ) ( not ( = ?auto_432775 ?auto_432776 ) ) ( not ( = ?auto_432775 ?auto_432777 ) ) ( not ( = ?auto_432775 ?auto_432778 ) ) ( not ( = ?auto_432775 ?auto_432779 ) ) ( not ( = ?auto_432775 ?auto_432780 ) ) ( not ( = ?auto_432775 ?auto_432781 ) ) ( not ( = ?auto_432775 ?auto_432782 ) ) ( not ( = ?auto_432775 ?auto_432783 ) ) ( not ( = ?auto_432775 ?auto_432784 ) ) ( not ( = ?auto_432775 ?auto_432785 ) ) ( not ( = ?auto_432775 ?auto_432786 ) ) ( not ( = ?auto_432775 ?auto_432787 ) ) ( not ( = ?auto_432775 ?auto_432788 ) ) ( not ( = ?auto_432775 ?auto_432789 ) ) ( not ( = ?auto_432776 ?auto_432777 ) ) ( not ( = ?auto_432776 ?auto_432778 ) ) ( not ( = ?auto_432776 ?auto_432779 ) ) ( not ( = ?auto_432776 ?auto_432780 ) ) ( not ( = ?auto_432776 ?auto_432781 ) ) ( not ( = ?auto_432776 ?auto_432782 ) ) ( not ( = ?auto_432776 ?auto_432783 ) ) ( not ( = ?auto_432776 ?auto_432784 ) ) ( not ( = ?auto_432776 ?auto_432785 ) ) ( not ( = ?auto_432776 ?auto_432786 ) ) ( not ( = ?auto_432776 ?auto_432787 ) ) ( not ( = ?auto_432776 ?auto_432788 ) ) ( not ( = ?auto_432776 ?auto_432789 ) ) ( not ( = ?auto_432777 ?auto_432778 ) ) ( not ( = ?auto_432777 ?auto_432779 ) ) ( not ( = ?auto_432777 ?auto_432780 ) ) ( not ( = ?auto_432777 ?auto_432781 ) ) ( not ( = ?auto_432777 ?auto_432782 ) ) ( not ( = ?auto_432777 ?auto_432783 ) ) ( not ( = ?auto_432777 ?auto_432784 ) ) ( not ( = ?auto_432777 ?auto_432785 ) ) ( not ( = ?auto_432777 ?auto_432786 ) ) ( not ( = ?auto_432777 ?auto_432787 ) ) ( not ( = ?auto_432777 ?auto_432788 ) ) ( not ( = ?auto_432777 ?auto_432789 ) ) ( not ( = ?auto_432778 ?auto_432779 ) ) ( not ( = ?auto_432778 ?auto_432780 ) ) ( not ( = ?auto_432778 ?auto_432781 ) ) ( not ( = ?auto_432778 ?auto_432782 ) ) ( not ( = ?auto_432778 ?auto_432783 ) ) ( not ( = ?auto_432778 ?auto_432784 ) ) ( not ( = ?auto_432778 ?auto_432785 ) ) ( not ( = ?auto_432778 ?auto_432786 ) ) ( not ( = ?auto_432778 ?auto_432787 ) ) ( not ( = ?auto_432778 ?auto_432788 ) ) ( not ( = ?auto_432778 ?auto_432789 ) ) ( not ( = ?auto_432779 ?auto_432780 ) ) ( not ( = ?auto_432779 ?auto_432781 ) ) ( not ( = ?auto_432779 ?auto_432782 ) ) ( not ( = ?auto_432779 ?auto_432783 ) ) ( not ( = ?auto_432779 ?auto_432784 ) ) ( not ( = ?auto_432779 ?auto_432785 ) ) ( not ( = ?auto_432779 ?auto_432786 ) ) ( not ( = ?auto_432779 ?auto_432787 ) ) ( not ( = ?auto_432779 ?auto_432788 ) ) ( not ( = ?auto_432779 ?auto_432789 ) ) ( not ( = ?auto_432780 ?auto_432781 ) ) ( not ( = ?auto_432780 ?auto_432782 ) ) ( not ( = ?auto_432780 ?auto_432783 ) ) ( not ( = ?auto_432780 ?auto_432784 ) ) ( not ( = ?auto_432780 ?auto_432785 ) ) ( not ( = ?auto_432780 ?auto_432786 ) ) ( not ( = ?auto_432780 ?auto_432787 ) ) ( not ( = ?auto_432780 ?auto_432788 ) ) ( not ( = ?auto_432780 ?auto_432789 ) ) ( not ( = ?auto_432781 ?auto_432782 ) ) ( not ( = ?auto_432781 ?auto_432783 ) ) ( not ( = ?auto_432781 ?auto_432784 ) ) ( not ( = ?auto_432781 ?auto_432785 ) ) ( not ( = ?auto_432781 ?auto_432786 ) ) ( not ( = ?auto_432781 ?auto_432787 ) ) ( not ( = ?auto_432781 ?auto_432788 ) ) ( not ( = ?auto_432781 ?auto_432789 ) ) ( not ( = ?auto_432782 ?auto_432783 ) ) ( not ( = ?auto_432782 ?auto_432784 ) ) ( not ( = ?auto_432782 ?auto_432785 ) ) ( not ( = ?auto_432782 ?auto_432786 ) ) ( not ( = ?auto_432782 ?auto_432787 ) ) ( not ( = ?auto_432782 ?auto_432788 ) ) ( not ( = ?auto_432782 ?auto_432789 ) ) ( not ( = ?auto_432783 ?auto_432784 ) ) ( not ( = ?auto_432783 ?auto_432785 ) ) ( not ( = ?auto_432783 ?auto_432786 ) ) ( not ( = ?auto_432783 ?auto_432787 ) ) ( not ( = ?auto_432783 ?auto_432788 ) ) ( not ( = ?auto_432783 ?auto_432789 ) ) ( not ( = ?auto_432784 ?auto_432785 ) ) ( not ( = ?auto_432784 ?auto_432786 ) ) ( not ( = ?auto_432784 ?auto_432787 ) ) ( not ( = ?auto_432784 ?auto_432788 ) ) ( not ( = ?auto_432784 ?auto_432789 ) ) ( not ( = ?auto_432785 ?auto_432786 ) ) ( not ( = ?auto_432785 ?auto_432787 ) ) ( not ( = ?auto_432785 ?auto_432788 ) ) ( not ( = ?auto_432785 ?auto_432789 ) ) ( not ( = ?auto_432786 ?auto_432787 ) ) ( not ( = ?auto_432786 ?auto_432788 ) ) ( not ( = ?auto_432786 ?auto_432789 ) ) ( not ( = ?auto_432787 ?auto_432788 ) ) ( not ( = ?auto_432787 ?auto_432789 ) ) ( not ( = ?auto_432788 ?auto_432789 ) ) ( CLEAR ?auto_432786 ) ( ON ?auto_432787 ?auto_432788 ) ( CLEAR ?auto_432787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_432774 ?auto_432775 ?auto_432776 ?auto_432777 ?auto_432778 ?auto_432779 ?auto_432780 ?auto_432781 ?auto_432782 ?auto_432783 ?auto_432784 ?auto_432785 ?auto_432786 ?auto_432787 )
      ( MAKE-15PILE ?auto_432774 ?auto_432775 ?auto_432776 ?auto_432777 ?auto_432778 ?auto_432779 ?auto_432780 ?auto_432781 ?auto_432782 ?auto_432783 ?auto_432784 ?auto_432785 ?auto_432786 ?auto_432787 ?auto_432788 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432805 - BLOCK
      ?auto_432806 - BLOCK
      ?auto_432807 - BLOCK
      ?auto_432808 - BLOCK
      ?auto_432809 - BLOCK
      ?auto_432810 - BLOCK
      ?auto_432811 - BLOCK
      ?auto_432812 - BLOCK
      ?auto_432813 - BLOCK
      ?auto_432814 - BLOCK
      ?auto_432815 - BLOCK
      ?auto_432816 - BLOCK
      ?auto_432817 - BLOCK
      ?auto_432818 - BLOCK
      ?auto_432819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432819 ) ( ON-TABLE ?auto_432805 ) ( ON ?auto_432806 ?auto_432805 ) ( ON ?auto_432807 ?auto_432806 ) ( ON ?auto_432808 ?auto_432807 ) ( ON ?auto_432809 ?auto_432808 ) ( ON ?auto_432810 ?auto_432809 ) ( ON ?auto_432811 ?auto_432810 ) ( ON ?auto_432812 ?auto_432811 ) ( ON ?auto_432813 ?auto_432812 ) ( ON ?auto_432814 ?auto_432813 ) ( ON ?auto_432815 ?auto_432814 ) ( ON ?auto_432816 ?auto_432815 ) ( ON ?auto_432817 ?auto_432816 ) ( not ( = ?auto_432805 ?auto_432806 ) ) ( not ( = ?auto_432805 ?auto_432807 ) ) ( not ( = ?auto_432805 ?auto_432808 ) ) ( not ( = ?auto_432805 ?auto_432809 ) ) ( not ( = ?auto_432805 ?auto_432810 ) ) ( not ( = ?auto_432805 ?auto_432811 ) ) ( not ( = ?auto_432805 ?auto_432812 ) ) ( not ( = ?auto_432805 ?auto_432813 ) ) ( not ( = ?auto_432805 ?auto_432814 ) ) ( not ( = ?auto_432805 ?auto_432815 ) ) ( not ( = ?auto_432805 ?auto_432816 ) ) ( not ( = ?auto_432805 ?auto_432817 ) ) ( not ( = ?auto_432805 ?auto_432818 ) ) ( not ( = ?auto_432805 ?auto_432819 ) ) ( not ( = ?auto_432806 ?auto_432807 ) ) ( not ( = ?auto_432806 ?auto_432808 ) ) ( not ( = ?auto_432806 ?auto_432809 ) ) ( not ( = ?auto_432806 ?auto_432810 ) ) ( not ( = ?auto_432806 ?auto_432811 ) ) ( not ( = ?auto_432806 ?auto_432812 ) ) ( not ( = ?auto_432806 ?auto_432813 ) ) ( not ( = ?auto_432806 ?auto_432814 ) ) ( not ( = ?auto_432806 ?auto_432815 ) ) ( not ( = ?auto_432806 ?auto_432816 ) ) ( not ( = ?auto_432806 ?auto_432817 ) ) ( not ( = ?auto_432806 ?auto_432818 ) ) ( not ( = ?auto_432806 ?auto_432819 ) ) ( not ( = ?auto_432807 ?auto_432808 ) ) ( not ( = ?auto_432807 ?auto_432809 ) ) ( not ( = ?auto_432807 ?auto_432810 ) ) ( not ( = ?auto_432807 ?auto_432811 ) ) ( not ( = ?auto_432807 ?auto_432812 ) ) ( not ( = ?auto_432807 ?auto_432813 ) ) ( not ( = ?auto_432807 ?auto_432814 ) ) ( not ( = ?auto_432807 ?auto_432815 ) ) ( not ( = ?auto_432807 ?auto_432816 ) ) ( not ( = ?auto_432807 ?auto_432817 ) ) ( not ( = ?auto_432807 ?auto_432818 ) ) ( not ( = ?auto_432807 ?auto_432819 ) ) ( not ( = ?auto_432808 ?auto_432809 ) ) ( not ( = ?auto_432808 ?auto_432810 ) ) ( not ( = ?auto_432808 ?auto_432811 ) ) ( not ( = ?auto_432808 ?auto_432812 ) ) ( not ( = ?auto_432808 ?auto_432813 ) ) ( not ( = ?auto_432808 ?auto_432814 ) ) ( not ( = ?auto_432808 ?auto_432815 ) ) ( not ( = ?auto_432808 ?auto_432816 ) ) ( not ( = ?auto_432808 ?auto_432817 ) ) ( not ( = ?auto_432808 ?auto_432818 ) ) ( not ( = ?auto_432808 ?auto_432819 ) ) ( not ( = ?auto_432809 ?auto_432810 ) ) ( not ( = ?auto_432809 ?auto_432811 ) ) ( not ( = ?auto_432809 ?auto_432812 ) ) ( not ( = ?auto_432809 ?auto_432813 ) ) ( not ( = ?auto_432809 ?auto_432814 ) ) ( not ( = ?auto_432809 ?auto_432815 ) ) ( not ( = ?auto_432809 ?auto_432816 ) ) ( not ( = ?auto_432809 ?auto_432817 ) ) ( not ( = ?auto_432809 ?auto_432818 ) ) ( not ( = ?auto_432809 ?auto_432819 ) ) ( not ( = ?auto_432810 ?auto_432811 ) ) ( not ( = ?auto_432810 ?auto_432812 ) ) ( not ( = ?auto_432810 ?auto_432813 ) ) ( not ( = ?auto_432810 ?auto_432814 ) ) ( not ( = ?auto_432810 ?auto_432815 ) ) ( not ( = ?auto_432810 ?auto_432816 ) ) ( not ( = ?auto_432810 ?auto_432817 ) ) ( not ( = ?auto_432810 ?auto_432818 ) ) ( not ( = ?auto_432810 ?auto_432819 ) ) ( not ( = ?auto_432811 ?auto_432812 ) ) ( not ( = ?auto_432811 ?auto_432813 ) ) ( not ( = ?auto_432811 ?auto_432814 ) ) ( not ( = ?auto_432811 ?auto_432815 ) ) ( not ( = ?auto_432811 ?auto_432816 ) ) ( not ( = ?auto_432811 ?auto_432817 ) ) ( not ( = ?auto_432811 ?auto_432818 ) ) ( not ( = ?auto_432811 ?auto_432819 ) ) ( not ( = ?auto_432812 ?auto_432813 ) ) ( not ( = ?auto_432812 ?auto_432814 ) ) ( not ( = ?auto_432812 ?auto_432815 ) ) ( not ( = ?auto_432812 ?auto_432816 ) ) ( not ( = ?auto_432812 ?auto_432817 ) ) ( not ( = ?auto_432812 ?auto_432818 ) ) ( not ( = ?auto_432812 ?auto_432819 ) ) ( not ( = ?auto_432813 ?auto_432814 ) ) ( not ( = ?auto_432813 ?auto_432815 ) ) ( not ( = ?auto_432813 ?auto_432816 ) ) ( not ( = ?auto_432813 ?auto_432817 ) ) ( not ( = ?auto_432813 ?auto_432818 ) ) ( not ( = ?auto_432813 ?auto_432819 ) ) ( not ( = ?auto_432814 ?auto_432815 ) ) ( not ( = ?auto_432814 ?auto_432816 ) ) ( not ( = ?auto_432814 ?auto_432817 ) ) ( not ( = ?auto_432814 ?auto_432818 ) ) ( not ( = ?auto_432814 ?auto_432819 ) ) ( not ( = ?auto_432815 ?auto_432816 ) ) ( not ( = ?auto_432815 ?auto_432817 ) ) ( not ( = ?auto_432815 ?auto_432818 ) ) ( not ( = ?auto_432815 ?auto_432819 ) ) ( not ( = ?auto_432816 ?auto_432817 ) ) ( not ( = ?auto_432816 ?auto_432818 ) ) ( not ( = ?auto_432816 ?auto_432819 ) ) ( not ( = ?auto_432817 ?auto_432818 ) ) ( not ( = ?auto_432817 ?auto_432819 ) ) ( not ( = ?auto_432818 ?auto_432819 ) ) ( CLEAR ?auto_432817 ) ( ON ?auto_432818 ?auto_432819 ) ( CLEAR ?auto_432818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_432805 ?auto_432806 ?auto_432807 ?auto_432808 ?auto_432809 ?auto_432810 ?auto_432811 ?auto_432812 ?auto_432813 ?auto_432814 ?auto_432815 ?auto_432816 ?auto_432817 ?auto_432818 )
      ( MAKE-15PILE ?auto_432805 ?auto_432806 ?auto_432807 ?auto_432808 ?auto_432809 ?auto_432810 ?auto_432811 ?auto_432812 ?auto_432813 ?auto_432814 ?auto_432815 ?auto_432816 ?auto_432817 ?auto_432818 ?auto_432819 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432835 - BLOCK
      ?auto_432836 - BLOCK
      ?auto_432837 - BLOCK
      ?auto_432838 - BLOCK
      ?auto_432839 - BLOCK
      ?auto_432840 - BLOCK
      ?auto_432841 - BLOCK
      ?auto_432842 - BLOCK
      ?auto_432843 - BLOCK
      ?auto_432844 - BLOCK
      ?auto_432845 - BLOCK
      ?auto_432846 - BLOCK
      ?auto_432847 - BLOCK
      ?auto_432848 - BLOCK
      ?auto_432849 - BLOCK
    )
    :vars
    (
      ?auto_432850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432849 ?auto_432850 ) ( ON-TABLE ?auto_432835 ) ( ON ?auto_432836 ?auto_432835 ) ( ON ?auto_432837 ?auto_432836 ) ( ON ?auto_432838 ?auto_432837 ) ( ON ?auto_432839 ?auto_432838 ) ( ON ?auto_432840 ?auto_432839 ) ( ON ?auto_432841 ?auto_432840 ) ( ON ?auto_432842 ?auto_432841 ) ( ON ?auto_432843 ?auto_432842 ) ( ON ?auto_432844 ?auto_432843 ) ( ON ?auto_432845 ?auto_432844 ) ( ON ?auto_432846 ?auto_432845 ) ( not ( = ?auto_432835 ?auto_432836 ) ) ( not ( = ?auto_432835 ?auto_432837 ) ) ( not ( = ?auto_432835 ?auto_432838 ) ) ( not ( = ?auto_432835 ?auto_432839 ) ) ( not ( = ?auto_432835 ?auto_432840 ) ) ( not ( = ?auto_432835 ?auto_432841 ) ) ( not ( = ?auto_432835 ?auto_432842 ) ) ( not ( = ?auto_432835 ?auto_432843 ) ) ( not ( = ?auto_432835 ?auto_432844 ) ) ( not ( = ?auto_432835 ?auto_432845 ) ) ( not ( = ?auto_432835 ?auto_432846 ) ) ( not ( = ?auto_432835 ?auto_432847 ) ) ( not ( = ?auto_432835 ?auto_432848 ) ) ( not ( = ?auto_432835 ?auto_432849 ) ) ( not ( = ?auto_432835 ?auto_432850 ) ) ( not ( = ?auto_432836 ?auto_432837 ) ) ( not ( = ?auto_432836 ?auto_432838 ) ) ( not ( = ?auto_432836 ?auto_432839 ) ) ( not ( = ?auto_432836 ?auto_432840 ) ) ( not ( = ?auto_432836 ?auto_432841 ) ) ( not ( = ?auto_432836 ?auto_432842 ) ) ( not ( = ?auto_432836 ?auto_432843 ) ) ( not ( = ?auto_432836 ?auto_432844 ) ) ( not ( = ?auto_432836 ?auto_432845 ) ) ( not ( = ?auto_432836 ?auto_432846 ) ) ( not ( = ?auto_432836 ?auto_432847 ) ) ( not ( = ?auto_432836 ?auto_432848 ) ) ( not ( = ?auto_432836 ?auto_432849 ) ) ( not ( = ?auto_432836 ?auto_432850 ) ) ( not ( = ?auto_432837 ?auto_432838 ) ) ( not ( = ?auto_432837 ?auto_432839 ) ) ( not ( = ?auto_432837 ?auto_432840 ) ) ( not ( = ?auto_432837 ?auto_432841 ) ) ( not ( = ?auto_432837 ?auto_432842 ) ) ( not ( = ?auto_432837 ?auto_432843 ) ) ( not ( = ?auto_432837 ?auto_432844 ) ) ( not ( = ?auto_432837 ?auto_432845 ) ) ( not ( = ?auto_432837 ?auto_432846 ) ) ( not ( = ?auto_432837 ?auto_432847 ) ) ( not ( = ?auto_432837 ?auto_432848 ) ) ( not ( = ?auto_432837 ?auto_432849 ) ) ( not ( = ?auto_432837 ?auto_432850 ) ) ( not ( = ?auto_432838 ?auto_432839 ) ) ( not ( = ?auto_432838 ?auto_432840 ) ) ( not ( = ?auto_432838 ?auto_432841 ) ) ( not ( = ?auto_432838 ?auto_432842 ) ) ( not ( = ?auto_432838 ?auto_432843 ) ) ( not ( = ?auto_432838 ?auto_432844 ) ) ( not ( = ?auto_432838 ?auto_432845 ) ) ( not ( = ?auto_432838 ?auto_432846 ) ) ( not ( = ?auto_432838 ?auto_432847 ) ) ( not ( = ?auto_432838 ?auto_432848 ) ) ( not ( = ?auto_432838 ?auto_432849 ) ) ( not ( = ?auto_432838 ?auto_432850 ) ) ( not ( = ?auto_432839 ?auto_432840 ) ) ( not ( = ?auto_432839 ?auto_432841 ) ) ( not ( = ?auto_432839 ?auto_432842 ) ) ( not ( = ?auto_432839 ?auto_432843 ) ) ( not ( = ?auto_432839 ?auto_432844 ) ) ( not ( = ?auto_432839 ?auto_432845 ) ) ( not ( = ?auto_432839 ?auto_432846 ) ) ( not ( = ?auto_432839 ?auto_432847 ) ) ( not ( = ?auto_432839 ?auto_432848 ) ) ( not ( = ?auto_432839 ?auto_432849 ) ) ( not ( = ?auto_432839 ?auto_432850 ) ) ( not ( = ?auto_432840 ?auto_432841 ) ) ( not ( = ?auto_432840 ?auto_432842 ) ) ( not ( = ?auto_432840 ?auto_432843 ) ) ( not ( = ?auto_432840 ?auto_432844 ) ) ( not ( = ?auto_432840 ?auto_432845 ) ) ( not ( = ?auto_432840 ?auto_432846 ) ) ( not ( = ?auto_432840 ?auto_432847 ) ) ( not ( = ?auto_432840 ?auto_432848 ) ) ( not ( = ?auto_432840 ?auto_432849 ) ) ( not ( = ?auto_432840 ?auto_432850 ) ) ( not ( = ?auto_432841 ?auto_432842 ) ) ( not ( = ?auto_432841 ?auto_432843 ) ) ( not ( = ?auto_432841 ?auto_432844 ) ) ( not ( = ?auto_432841 ?auto_432845 ) ) ( not ( = ?auto_432841 ?auto_432846 ) ) ( not ( = ?auto_432841 ?auto_432847 ) ) ( not ( = ?auto_432841 ?auto_432848 ) ) ( not ( = ?auto_432841 ?auto_432849 ) ) ( not ( = ?auto_432841 ?auto_432850 ) ) ( not ( = ?auto_432842 ?auto_432843 ) ) ( not ( = ?auto_432842 ?auto_432844 ) ) ( not ( = ?auto_432842 ?auto_432845 ) ) ( not ( = ?auto_432842 ?auto_432846 ) ) ( not ( = ?auto_432842 ?auto_432847 ) ) ( not ( = ?auto_432842 ?auto_432848 ) ) ( not ( = ?auto_432842 ?auto_432849 ) ) ( not ( = ?auto_432842 ?auto_432850 ) ) ( not ( = ?auto_432843 ?auto_432844 ) ) ( not ( = ?auto_432843 ?auto_432845 ) ) ( not ( = ?auto_432843 ?auto_432846 ) ) ( not ( = ?auto_432843 ?auto_432847 ) ) ( not ( = ?auto_432843 ?auto_432848 ) ) ( not ( = ?auto_432843 ?auto_432849 ) ) ( not ( = ?auto_432843 ?auto_432850 ) ) ( not ( = ?auto_432844 ?auto_432845 ) ) ( not ( = ?auto_432844 ?auto_432846 ) ) ( not ( = ?auto_432844 ?auto_432847 ) ) ( not ( = ?auto_432844 ?auto_432848 ) ) ( not ( = ?auto_432844 ?auto_432849 ) ) ( not ( = ?auto_432844 ?auto_432850 ) ) ( not ( = ?auto_432845 ?auto_432846 ) ) ( not ( = ?auto_432845 ?auto_432847 ) ) ( not ( = ?auto_432845 ?auto_432848 ) ) ( not ( = ?auto_432845 ?auto_432849 ) ) ( not ( = ?auto_432845 ?auto_432850 ) ) ( not ( = ?auto_432846 ?auto_432847 ) ) ( not ( = ?auto_432846 ?auto_432848 ) ) ( not ( = ?auto_432846 ?auto_432849 ) ) ( not ( = ?auto_432846 ?auto_432850 ) ) ( not ( = ?auto_432847 ?auto_432848 ) ) ( not ( = ?auto_432847 ?auto_432849 ) ) ( not ( = ?auto_432847 ?auto_432850 ) ) ( not ( = ?auto_432848 ?auto_432849 ) ) ( not ( = ?auto_432848 ?auto_432850 ) ) ( not ( = ?auto_432849 ?auto_432850 ) ) ( ON ?auto_432848 ?auto_432849 ) ( CLEAR ?auto_432846 ) ( ON ?auto_432847 ?auto_432848 ) ( CLEAR ?auto_432847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_432835 ?auto_432836 ?auto_432837 ?auto_432838 ?auto_432839 ?auto_432840 ?auto_432841 ?auto_432842 ?auto_432843 ?auto_432844 ?auto_432845 ?auto_432846 ?auto_432847 )
      ( MAKE-15PILE ?auto_432835 ?auto_432836 ?auto_432837 ?auto_432838 ?auto_432839 ?auto_432840 ?auto_432841 ?auto_432842 ?auto_432843 ?auto_432844 ?auto_432845 ?auto_432846 ?auto_432847 ?auto_432848 ?auto_432849 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432866 - BLOCK
      ?auto_432867 - BLOCK
      ?auto_432868 - BLOCK
      ?auto_432869 - BLOCK
      ?auto_432870 - BLOCK
      ?auto_432871 - BLOCK
      ?auto_432872 - BLOCK
      ?auto_432873 - BLOCK
      ?auto_432874 - BLOCK
      ?auto_432875 - BLOCK
      ?auto_432876 - BLOCK
      ?auto_432877 - BLOCK
      ?auto_432878 - BLOCK
      ?auto_432879 - BLOCK
      ?auto_432880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432880 ) ( ON-TABLE ?auto_432866 ) ( ON ?auto_432867 ?auto_432866 ) ( ON ?auto_432868 ?auto_432867 ) ( ON ?auto_432869 ?auto_432868 ) ( ON ?auto_432870 ?auto_432869 ) ( ON ?auto_432871 ?auto_432870 ) ( ON ?auto_432872 ?auto_432871 ) ( ON ?auto_432873 ?auto_432872 ) ( ON ?auto_432874 ?auto_432873 ) ( ON ?auto_432875 ?auto_432874 ) ( ON ?auto_432876 ?auto_432875 ) ( ON ?auto_432877 ?auto_432876 ) ( not ( = ?auto_432866 ?auto_432867 ) ) ( not ( = ?auto_432866 ?auto_432868 ) ) ( not ( = ?auto_432866 ?auto_432869 ) ) ( not ( = ?auto_432866 ?auto_432870 ) ) ( not ( = ?auto_432866 ?auto_432871 ) ) ( not ( = ?auto_432866 ?auto_432872 ) ) ( not ( = ?auto_432866 ?auto_432873 ) ) ( not ( = ?auto_432866 ?auto_432874 ) ) ( not ( = ?auto_432866 ?auto_432875 ) ) ( not ( = ?auto_432866 ?auto_432876 ) ) ( not ( = ?auto_432866 ?auto_432877 ) ) ( not ( = ?auto_432866 ?auto_432878 ) ) ( not ( = ?auto_432866 ?auto_432879 ) ) ( not ( = ?auto_432866 ?auto_432880 ) ) ( not ( = ?auto_432867 ?auto_432868 ) ) ( not ( = ?auto_432867 ?auto_432869 ) ) ( not ( = ?auto_432867 ?auto_432870 ) ) ( not ( = ?auto_432867 ?auto_432871 ) ) ( not ( = ?auto_432867 ?auto_432872 ) ) ( not ( = ?auto_432867 ?auto_432873 ) ) ( not ( = ?auto_432867 ?auto_432874 ) ) ( not ( = ?auto_432867 ?auto_432875 ) ) ( not ( = ?auto_432867 ?auto_432876 ) ) ( not ( = ?auto_432867 ?auto_432877 ) ) ( not ( = ?auto_432867 ?auto_432878 ) ) ( not ( = ?auto_432867 ?auto_432879 ) ) ( not ( = ?auto_432867 ?auto_432880 ) ) ( not ( = ?auto_432868 ?auto_432869 ) ) ( not ( = ?auto_432868 ?auto_432870 ) ) ( not ( = ?auto_432868 ?auto_432871 ) ) ( not ( = ?auto_432868 ?auto_432872 ) ) ( not ( = ?auto_432868 ?auto_432873 ) ) ( not ( = ?auto_432868 ?auto_432874 ) ) ( not ( = ?auto_432868 ?auto_432875 ) ) ( not ( = ?auto_432868 ?auto_432876 ) ) ( not ( = ?auto_432868 ?auto_432877 ) ) ( not ( = ?auto_432868 ?auto_432878 ) ) ( not ( = ?auto_432868 ?auto_432879 ) ) ( not ( = ?auto_432868 ?auto_432880 ) ) ( not ( = ?auto_432869 ?auto_432870 ) ) ( not ( = ?auto_432869 ?auto_432871 ) ) ( not ( = ?auto_432869 ?auto_432872 ) ) ( not ( = ?auto_432869 ?auto_432873 ) ) ( not ( = ?auto_432869 ?auto_432874 ) ) ( not ( = ?auto_432869 ?auto_432875 ) ) ( not ( = ?auto_432869 ?auto_432876 ) ) ( not ( = ?auto_432869 ?auto_432877 ) ) ( not ( = ?auto_432869 ?auto_432878 ) ) ( not ( = ?auto_432869 ?auto_432879 ) ) ( not ( = ?auto_432869 ?auto_432880 ) ) ( not ( = ?auto_432870 ?auto_432871 ) ) ( not ( = ?auto_432870 ?auto_432872 ) ) ( not ( = ?auto_432870 ?auto_432873 ) ) ( not ( = ?auto_432870 ?auto_432874 ) ) ( not ( = ?auto_432870 ?auto_432875 ) ) ( not ( = ?auto_432870 ?auto_432876 ) ) ( not ( = ?auto_432870 ?auto_432877 ) ) ( not ( = ?auto_432870 ?auto_432878 ) ) ( not ( = ?auto_432870 ?auto_432879 ) ) ( not ( = ?auto_432870 ?auto_432880 ) ) ( not ( = ?auto_432871 ?auto_432872 ) ) ( not ( = ?auto_432871 ?auto_432873 ) ) ( not ( = ?auto_432871 ?auto_432874 ) ) ( not ( = ?auto_432871 ?auto_432875 ) ) ( not ( = ?auto_432871 ?auto_432876 ) ) ( not ( = ?auto_432871 ?auto_432877 ) ) ( not ( = ?auto_432871 ?auto_432878 ) ) ( not ( = ?auto_432871 ?auto_432879 ) ) ( not ( = ?auto_432871 ?auto_432880 ) ) ( not ( = ?auto_432872 ?auto_432873 ) ) ( not ( = ?auto_432872 ?auto_432874 ) ) ( not ( = ?auto_432872 ?auto_432875 ) ) ( not ( = ?auto_432872 ?auto_432876 ) ) ( not ( = ?auto_432872 ?auto_432877 ) ) ( not ( = ?auto_432872 ?auto_432878 ) ) ( not ( = ?auto_432872 ?auto_432879 ) ) ( not ( = ?auto_432872 ?auto_432880 ) ) ( not ( = ?auto_432873 ?auto_432874 ) ) ( not ( = ?auto_432873 ?auto_432875 ) ) ( not ( = ?auto_432873 ?auto_432876 ) ) ( not ( = ?auto_432873 ?auto_432877 ) ) ( not ( = ?auto_432873 ?auto_432878 ) ) ( not ( = ?auto_432873 ?auto_432879 ) ) ( not ( = ?auto_432873 ?auto_432880 ) ) ( not ( = ?auto_432874 ?auto_432875 ) ) ( not ( = ?auto_432874 ?auto_432876 ) ) ( not ( = ?auto_432874 ?auto_432877 ) ) ( not ( = ?auto_432874 ?auto_432878 ) ) ( not ( = ?auto_432874 ?auto_432879 ) ) ( not ( = ?auto_432874 ?auto_432880 ) ) ( not ( = ?auto_432875 ?auto_432876 ) ) ( not ( = ?auto_432875 ?auto_432877 ) ) ( not ( = ?auto_432875 ?auto_432878 ) ) ( not ( = ?auto_432875 ?auto_432879 ) ) ( not ( = ?auto_432875 ?auto_432880 ) ) ( not ( = ?auto_432876 ?auto_432877 ) ) ( not ( = ?auto_432876 ?auto_432878 ) ) ( not ( = ?auto_432876 ?auto_432879 ) ) ( not ( = ?auto_432876 ?auto_432880 ) ) ( not ( = ?auto_432877 ?auto_432878 ) ) ( not ( = ?auto_432877 ?auto_432879 ) ) ( not ( = ?auto_432877 ?auto_432880 ) ) ( not ( = ?auto_432878 ?auto_432879 ) ) ( not ( = ?auto_432878 ?auto_432880 ) ) ( not ( = ?auto_432879 ?auto_432880 ) ) ( ON ?auto_432879 ?auto_432880 ) ( CLEAR ?auto_432877 ) ( ON ?auto_432878 ?auto_432879 ) ( CLEAR ?auto_432878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_432866 ?auto_432867 ?auto_432868 ?auto_432869 ?auto_432870 ?auto_432871 ?auto_432872 ?auto_432873 ?auto_432874 ?auto_432875 ?auto_432876 ?auto_432877 ?auto_432878 )
      ( MAKE-15PILE ?auto_432866 ?auto_432867 ?auto_432868 ?auto_432869 ?auto_432870 ?auto_432871 ?auto_432872 ?auto_432873 ?auto_432874 ?auto_432875 ?auto_432876 ?auto_432877 ?auto_432878 ?auto_432879 ?auto_432880 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432896 - BLOCK
      ?auto_432897 - BLOCK
      ?auto_432898 - BLOCK
      ?auto_432899 - BLOCK
      ?auto_432900 - BLOCK
      ?auto_432901 - BLOCK
      ?auto_432902 - BLOCK
      ?auto_432903 - BLOCK
      ?auto_432904 - BLOCK
      ?auto_432905 - BLOCK
      ?auto_432906 - BLOCK
      ?auto_432907 - BLOCK
      ?auto_432908 - BLOCK
      ?auto_432909 - BLOCK
      ?auto_432910 - BLOCK
    )
    :vars
    (
      ?auto_432911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432910 ?auto_432911 ) ( ON-TABLE ?auto_432896 ) ( ON ?auto_432897 ?auto_432896 ) ( ON ?auto_432898 ?auto_432897 ) ( ON ?auto_432899 ?auto_432898 ) ( ON ?auto_432900 ?auto_432899 ) ( ON ?auto_432901 ?auto_432900 ) ( ON ?auto_432902 ?auto_432901 ) ( ON ?auto_432903 ?auto_432902 ) ( ON ?auto_432904 ?auto_432903 ) ( ON ?auto_432905 ?auto_432904 ) ( ON ?auto_432906 ?auto_432905 ) ( not ( = ?auto_432896 ?auto_432897 ) ) ( not ( = ?auto_432896 ?auto_432898 ) ) ( not ( = ?auto_432896 ?auto_432899 ) ) ( not ( = ?auto_432896 ?auto_432900 ) ) ( not ( = ?auto_432896 ?auto_432901 ) ) ( not ( = ?auto_432896 ?auto_432902 ) ) ( not ( = ?auto_432896 ?auto_432903 ) ) ( not ( = ?auto_432896 ?auto_432904 ) ) ( not ( = ?auto_432896 ?auto_432905 ) ) ( not ( = ?auto_432896 ?auto_432906 ) ) ( not ( = ?auto_432896 ?auto_432907 ) ) ( not ( = ?auto_432896 ?auto_432908 ) ) ( not ( = ?auto_432896 ?auto_432909 ) ) ( not ( = ?auto_432896 ?auto_432910 ) ) ( not ( = ?auto_432896 ?auto_432911 ) ) ( not ( = ?auto_432897 ?auto_432898 ) ) ( not ( = ?auto_432897 ?auto_432899 ) ) ( not ( = ?auto_432897 ?auto_432900 ) ) ( not ( = ?auto_432897 ?auto_432901 ) ) ( not ( = ?auto_432897 ?auto_432902 ) ) ( not ( = ?auto_432897 ?auto_432903 ) ) ( not ( = ?auto_432897 ?auto_432904 ) ) ( not ( = ?auto_432897 ?auto_432905 ) ) ( not ( = ?auto_432897 ?auto_432906 ) ) ( not ( = ?auto_432897 ?auto_432907 ) ) ( not ( = ?auto_432897 ?auto_432908 ) ) ( not ( = ?auto_432897 ?auto_432909 ) ) ( not ( = ?auto_432897 ?auto_432910 ) ) ( not ( = ?auto_432897 ?auto_432911 ) ) ( not ( = ?auto_432898 ?auto_432899 ) ) ( not ( = ?auto_432898 ?auto_432900 ) ) ( not ( = ?auto_432898 ?auto_432901 ) ) ( not ( = ?auto_432898 ?auto_432902 ) ) ( not ( = ?auto_432898 ?auto_432903 ) ) ( not ( = ?auto_432898 ?auto_432904 ) ) ( not ( = ?auto_432898 ?auto_432905 ) ) ( not ( = ?auto_432898 ?auto_432906 ) ) ( not ( = ?auto_432898 ?auto_432907 ) ) ( not ( = ?auto_432898 ?auto_432908 ) ) ( not ( = ?auto_432898 ?auto_432909 ) ) ( not ( = ?auto_432898 ?auto_432910 ) ) ( not ( = ?auto_432898 ?auto_432911 ) ) ( not ( = ?auto_432899 ?auto_432900 ) ) ( not ( = ?auto_432899 ?auto_432901 ) ) ( not ( = ?auto_432899 ?auto_432902 ) ) ( not ( = ?auto_432899 ?auto_432903 ) ) ( not ( = ?auto_432899 ?auto_432904 ) ) ( not ( = ?auto_432899 ?auto_432905 ) ) ( not ( = ?auto_432899 ?auto_432906 ) ) ( not ( = ?auto_432899 ?auto_432907 ) ) ( not ( = ?auto_432899 ?auto_432908 ) ) ( not ( = ?auto_432899 ?auto_432909 ) ) ( not ( = ?auto_432899 ?auto_432910 ) ) ( not ( = ?auto_432899 ?auto_432911 ) ) ( not ( = ?auto_432900 ?auto_432901 ) ) ( not ( = ?auto_432900 ?auto_432902 ) ) ( not ( = ?auto_432900 ?auto_432903 ) ) ( not ( = ?auto_432900 ?auto_432904 ) ) ( not ( = ?auto_432900 ?auto_432905 ) ) ( not ( = ?auto_432900 ?auto_432906 ) ) ( not ( = ?auto_432900 ?auto_432907 ) ) ( not ( = ?auto_432900 ?auto_432908 ) ) ( not ( = ?auto_432900 ?auto_432909 ) ) ( not ( = ?auto_432900 ?auto_432910 ) ) ( not ( = ?auto_432900 ?auto_432911 ) ) ( not ( = ?auto_432901 ?auto_432902 ) ) ( not ( = ?auto_432901 ?auto_432903 ) ) ( not ( = ?auto_432901 ?auto_432904 ) ) ( not ( = ?auto_432901 ?auto_432905 ) ) ( not ( = ?auto_432901 ?auto_432906 ) ) ( not ( = ?auto_432901 ?auto_432907 ) ) ( not ( = ?auto_432901 ?auto_432908 ) ) ( not ( = ?auto_432901 ?auto_432909 ) ) ( not ( = ?auto_432901 ?auto_432910 ) ) ( not ( = ?auto_432901 ?auto_432911 ) ) ( not ( = ?auto_432902 ?auto_432903 ) ) ( not ( = ?auto_432902 ?auto_432904 ) ) ( not ( = ?auto_432902 ?auto_432905 ) ) ( not ( = ?auto_432902 ?auto_432906 ) ) ( not ( = ?auto_432902 ?auto_432907 ) ) ( not ( = ?auto_432902 ?auto_432908 ) ) ( not ( = ?auto_432902 ?auto_432909 ) ) ( not ( = ?auto_432902 ?auto_432910 ) ) ( not ( = ?auto_432902 ?auto_432911 ) ) ( not ( = ?auto_432903 ?auto_432904 ) ) ( not ( = ?auto_432903 ?auto_432905 ) ) ( not ( = ?auto_432903 ?auto_432906 ) ) ( not ( = ?auto_432903 ?auto_432907 ) ) ( not ( = ?auto_432903 ?auto_432908 ) ) ( not ( = ?auto_432903 ?auto_432909 ) ) ( not ( = ?auto_432903 ?auto_432910 ) ) ( not ( = ?auto_432903 ?auto_432911 ) ) ( not ( = ?auto_432904 ?auto_432905 ) ) ( not ( = ?auto_432904 ?auto_432906 ) ) ( not ( = ?auto_432904 ?auto_432907 ) ) ( not ( = ?auto_432904 ?auto_432908 ) ) ( not ( = ?auto_432904 ?auto_432909 ) ) ( not ( = ?auto_432904 ?auto_432910 ) ) ( not ( = ?auto_432904 ?auto_432911 ) ) ( not ( = ?auto_432905 ?auto_432906 ) ) ( not ( = ?auto_432905 ?auto_432907 ) ) ( not ( = ?auto_432905 ?auto_432908 ) ) ( not ( = ?auto_432905 ?auto_432909 ) ) ( not ( = ?auto_432905 ?auto_432910 ) ) ( not ( = ?auto_432905 ?auto_432911 ) ) ( not ( = ?auto_432906 ?auto_432907 ) ) ( not ( = ?auto_432906 ?auto_432908 ) ) ( not ( = ?auto_432906 ?auto_432909 ) ) ( not ( = ?auto_432906 ?auto_432910 ) ) ( not ( = ?auto_432906 ?auto_432911 ) ) ( not ( = ?auto_432907 ?auto_432908 ) ) ( not ( = ?auto_432907 ?auto_432909 ) ) ( not ( = ?auto_432907 ?auto_432910 ) ) ( not ( = ?auto_432907 ?auto_432911 ) ) ( not ( = ?auto_432908 ?auto_432909 ) ) ( not ( = ?auto_432908 ?auto_432910 ) ) ( not ( = ?auto_432908 ?auto_432911 ) ) ( not ( = ?auto_432909 ?auto_432910 ) ) ( not ( = ?auto_432909 ?auto_432911 ) ) ( not ( = ?auto_432910 ?auto_432911 ) ) ( ON ?auto_432909 ?auto_432910 ) ( ON ?auto_432908 ?auto_432909 ) ( CLEAR ?auto_432906 ) ( ON ?auto_432907 ?auto_432908 ) ( CLEAR ?auto_432907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432896 ?auto_432897 ?auto_432898 ?auto_432899 ?auto_432900 ?auto_432901 ?auto_432902 ?auto_432903 ?auto_432904 ?auto_432905 ?auto_432906 ?auto_432907 )
      ( MAKE-15PILE ?auto_432896 ?auto_432897 ?auto_432898 ?auto_432899 ?auto_432900 ?auto_432901 ?auto_432902 ?auto_432903 ?auto_432904 ?auto_432905 ?auto_432906 ?auto_432907 ?auto_432908 ?auto_432909 ?auto_432910 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432927 - BLOCK
      ?auto_432928 - BLOCK
      ?auto_432929 - BLOCK
      ?auto_432930 - BLOCK
      ?auto_432931 - BLOCK
      ?auto_432932 - BLOCK
      ?auto_432933 - BLOCK
      ?auto_432934 - BLOCK
      ?auto_432935 - BLOCK
      ?auto_432936 - BLOCK
      ?auto_432937 - BLOCK
      ?auto_432938 - BLOCK
      ?auto_432939 - BLOCK
      ?auto_432940 - BLOCK
      ?auto_432941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432941 ) ( ON-TABLE ?auto_432927 ) ( ON ?auto_432928 ?auto_432927 ) ( ON ?auto_432929 ?auto_432928 ) ( ON ?auto_432930 ?auto_432929 ) ( ON ?auto_432931 ?auto_432930 ) ( ON ?auto_432932 ?auto_432931 ) ( ON ?auto_432933 ?auto_432932 ) ( ON ?auto_432934 ?auto_432933 ) ( ON ?auto_432935 ?auto_432934 ) ( ON ?auto_432936 ?auto_432935 ) ( ON ?auto_432937 ?auto_432936 ) ( not ( = ?auto_432927 ?auto_432928 ) ) ( not ( = ?auto_432927 ?auto_432929 ) ) ( not ( = ?auto_432927 ?auto_432930 ) ) ( not ( = ?auto_432927 ?auto_432931 ) ) ( not ( = ?auto_432927 ?auto_432932 ) ) ( not ( = ?auto_432927 ?auto_432933 ) ) ( not ( = ?auto_432927 ?auto_432934 ) ) ( not ( = ?auto_432927 ?auto_432935 ) ) ( not ( = ?auto_432927 ?auto_432936 ) ) ( not ( = ?auto_432927 ?auto_432937 ) ) ( not ( = ?auto_432927 ?auto_432938 ) ) ( not ( = ?auto_432927 ?auto_432939 ) ) ( not ( = ?auto_432927 ?auto_432940 ) ) ( not ( = ?auto_432927 ?auto_432941 ) ) ( not ( = ?auto_432928 ?auto_432929 ) ) ( not ( = ?auto_432928 ?auto_432930 ) ) ( not ( = ?auto_432928 ?auto_432931 ) ) ( not ( = ?auto_432928 ?auto_432932 ) ) ( not ( = ?auto_432928 ?auto_432933 ) ) ( not ( = ?auto_432928 ?auto_432934 ) ) ( not ( = ?auto_432928 ?auto_432935 ) ) ( not ( = ?auto_432928 ?auto_432936 ) ) ( not ( = ?auto_432928 ?auto_432937 ) ) ( not ( = ?auto_432928 ?auto_432938 ) ) ( not ( = ?auto_432928 ?auto_432939 ) ) ( not ( = ?auto_432928 ?auto_432940 ) ) ( not ( = ?auto_432928 ?auto_432941 ) ) ( not ( = ?auto_432929 ?auto_432930 ) ) ( not ( = ?auto_432929 ?auto_432931 ) ) ( not ( = ?auto_432929 ?auto_432932 ) ) ( not ( = ?auto_432929 ?auto_432933 ) ) ( not ( = ?auto_432929 ?auto_432934 ) ) ( not ( = ?auto_432929 ?auto_432935 ) ) ( not ( = ?auto_432929 ?auto_432936 ) ) ( not ( = ?auto_432929 ?auto_432937 ) ) ( not ( = ?auto_432929 ?auto_432938 ) ) ( not ( = ?auto_432929 ?auto_432939 ) ) ( not ( = ?auto_432929 ?auto_432940 ) ) ( not ( = ?auto_432929 ?auto_432941 ) ) ( not ( = ?auto_432930 ?auto_432931 ) ) ( not ( = ?auto_432930 ?auto_432932 ) ) ( not ( = ?auto_432930 ?auto_432933 ) ) ( not ( = ?auto_432930 ?auto_432934 ) ) ( not ( = ?auto_432930 ?auto_432935 ) ) ( not ( = ?auto_432930 ?auto_432936 ) ) ( not ( = ?auto_432930 ?auto_432937 ) ) ( not ( = ?auto_432930 ?auto_432938 ) ) ( not ( = ?auto_432930 ?auto_432939 ) ) ( not ( = ?auto_432930 ?auto_432940 ) ) ( not ( = ?auto_432930 ?auto_432941 ) ) ( not ( = ?auto_432931 ?auto_432932 ) ) ( not ( = ?auto_432931 ?auto_432933 ) ) ( not ( = ?auto_432931 ?auto_432934 ) ) ( not ( = ?auto_432931 ?auto_432935 ) ) ( not ( = ?auto_432931 ?auto_432936 ) ) ( not ( = ?auto_432931 ?auto_432937 ) ) ( not ( = ?auto_432931 ?auto_432938 ) ) ( not ( = ?auto_432931 ?auto_432939 ) ) ( not ( = ?auto_432931 ?auto_432940 ) ) ( not ( = ?auto_432931 ?auto_432941 ) ) ( not ( = ?auto_432932 ?auto_432933 ) ) ( not ( = ?auto_432932 ?auto_432934 ) ) ( not ( = ?auto_432932 ?auto_432935 ) ) ( not ( = ?auto_432932 ?auto_432936 ) ) ( not ( = ?auto_432932 ?auto_432937 ) ) ( not ( = ?auto_432932 ?auto_432938 ) ) ( not ( = ?auto_432932 ?auto_432939 ) ) ( not ( = ?auto_432932 ?auto_432940 ) ) ( not ( = ?auto_432932 ?auto_432941 ) ) ( not ( = ?auto_432933 ?auto_432934 ) ) ( not ( = ?auto_432933 ?auto_432935 ) ) ( not ( = ?auto_432933 ?auto_432936 ) ) ( not ( = ?auto_432933 ?auto_432937 ) ) ( not ( = ?auto_432933 ?auto_432938 ) ) ( not ( = ?auto_432933 ?auto_432939 ) ) ( not ( = ?auto_432933 ?auto_432940 ) ) ( not ( = ?auto_432933 ?auto_432941 ) ) ( not ( = ?auto_432934 ?auto_432935 ) ) ( not ( = ?auto_432934 ?auto_432936 ) ) ( not ( = ?auto_432934 ?auto_432937 ) ) ( not ( = ?auto_432934 ?auto_432938 ) ) ( not ( = ?auto_432934 ?auto_432939 ) ) ( not ( = ?auto_432934 ?auto_432940 ) ) ( not ( = ?auto_432934 ?auto_432941 ) ) ( not ( = ?auto_432935 ?auto_432936 ) ) ( not ( = ?auto_432935 ?auto_432937 ) ) ( not ( = ?auto_432935 ?auto_432938 ) ) ( not ( = ?auto_432935 ?auto_432939 ) ) ( not ( = ?auto_432935 ?auto_432940 ) ) ( not ( = ?auto_432935 ?auto_432941 ) ) ( not ( = ?auto_432936 ?auto_432937 ) ) ( not ( = ?auto_432936 ?auto_432938 ) ) ( not ( = ?auto_432936 ?auto_432939 ) ) ( not ( = ?auto_432936 ?auto_432940 ) ) ( not ( = ?auto_432936 ?auto_432941 ) ) ( not ( = ?auto_432937 ?auto_432938 ) ) ( not ( = ?auto_432937 ?auto_432939 ) ) ( not ( = ?auto_432937 ?auto_432940 ) ) ( not ( = ?auto_432937 ?auto_432941 ) ) ( not ( = ?auto_432938 ?auto_432939 ) ) ( not ( = ?auto_432938 ?auto_432940 ) ) ( not ( = ?auto_432938 ?auto_432941 ) ) ( not ( = ?auto_432939 ?auto_432940 ) ) ( not ( = ?auto_432939 ?auto_432941 ) ) ( not ( = ?auto_432940 ?auto_432941 ) ) ( ON ?auto_432940 ?auto_432941 ) ( ON ?auto_432939 ?auto_432940 ) ( CLEAR ?auto_432937 ) ( ON ?auto_432938 ?auto_432939 ) ( CLEAR ?auto_432938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432927 ?auto_432928 ?auto_432929 ?auto_432930 ?auto_432931 ?auto_432932 ?auto_432933 ?auto_432934 ?auto_432935 ?auto_432936 ?auto_432937 ?auto_432938 )
      ( MAKE-15PILE ?auto_432927 ?auto_432928 ?auto_432929 ?auto_432930 ?auto_432931 ?auto_432932 ?auto_432933 ?auto_432934 ?auto_432935 ?auto_432936 ?auto_432937 ?auto_432938 ?auto_432939 ?auto_432940 ?auto_432941 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432957 - BLOCK
      ?auto_432958 - BLOCK
      ?auto_432959 - BLOCK
      ?auto_432960 - BLOCK
      ?auto_432961 - BLOCK
      ?auto_432962 - BLOCK
      ?auto_432963 - BLOCK
      ?auto_432964 - BLOCK
      ?auto_432965 - BLOCK
      ?auto_432966 - BLOCK
      ?auto_432967 - BLOCK
      ?auto_432968 - BLOCK
      ?auto_432969 - BLOCK
      ?auto_432970 - BLOCK
      ?auto_432971 - BLOCK
    )
    :vars
    (
      ?auto_432972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432971 ?auto_432972 ) ( ON-TABLE ?auto_432957 ) ( ON ?auto_432958 ?auto_432957 ) ( ON ?auto_432959 ?auto_432958 ) ( ON ?auto_432960 ?auto_432959 ) ( ON ?auto_432961 ?auto_432960 ) ( ON ?auto_432962 ?auto_432961 ) ( ON ?auto_432963 ?auto_432962 ) ( ON ?auto_432964 ?auto_432963 ) ( ON ?auto_432965 ?auto_432964 ) ( ON ?auto_432966 ?auto_432965 ) ( not ( = ?auto_432957 ?auto_432958 ) ) ( not ( = ?auto_432957 ?auto_432959 ) ) ( not ( = ?auto_432957 ?auto_432960 ) ) ( not ( = ?auto_432957 ?auto_432961 ) ) ( not ( = ?auto_432957 ?auto_432962 ) ) ( not ( = ?auto_432957 ?auto_432963 ) ) ( not ( = ?auto_432957 ?auto_432964 ) ) ( not ( = ?auto_432957 ?auto_432965 ) ) ( not ( = ?auto_432957 ?auto_432966 ) ) ( not ( = ?auto_432957 ?auto_432967 ) ) ( not ( = ?auto_432957 ?auto_432968 ) ) ( not ( = ?auto_432957 ?auto_432969 ) ) ( not ( = ?auto_432957 ?auto_432970 ) ) ( not ( = ?auto_432957 ?auto_432971 ) ) ( not ( = ?auto_432957 ?auto_432972 ) ) ( not ( = ?auto_432958 ?auto_432959 ) ) ( not ( = ?auto_432958 ?auto_432960 ) ) ( not ( = ?auto_432958 ?auto_432961 ) ) ( not ( = ?auto_432958 ?auto_432962 ) ) ( not ( = ?auto_432958 ?auto_432963 ) ) ( not ( = ?auto_432958 ?auto_432964 ) ) ( not ( = ?auto_432958 ?auto_432965 ) ) ( not ( = ?auto_432958 ?auto_432966 ) ) ( not ( = ?auto_432958 ?auto_432967 ) ) ( not ( = ?auto_432958 ?auto_432968 ) ) ( not ( = ?auto_432958 ?auto_432969 ) ) ( not ( = ?auto_432958 ?auto_432970 ) ) ( not ( = ?auto_432958 ?auto_432971 ) ) ( not ( = ?auto_432958 ?auto_432972 ) ) ( not ( = ?auto_432959 ?auto_432960 ) ) ( not ( = ?auto_432959 ?auto_432961 ) ) ( not ( = ?auto_432959 ?auto_432962 ) ) ( not ( = ?auto_432959 ?auto_432963 ) ) ( not ( = ?auto_432959 ?auto_432964 ) ) ( not ( = ?auto_432959 ?auto_432965 ) ) ( not ( = ?auto_432959 ?auto_432966 ) ) ( not ( = ?auto_432959 ?auto_432967 ) ) ( not ( = ?auto_432959 ?auto_432968 ) ) ( not ( = ?auto_432959 ?auto_432969 ) ) ( not ( = ?auto_432959 ?auto_432970 ) ) ( not ( = ?auto_432959 ?auto_432971 ) ) ( not ( = ?auto_432959 ?auto_432972 ) ) ( not ( = ?auto_432960 ?auto_432961 ) ) ( not ( = ?auto_432960 ?auto_432962 ) ) ( not ( = ?auto_432960 ?auto_432963 ) ) ( not ( = ?auto_432960 ?auto_432964 ) ) ( not ( = ?auto_432960 ?auto_432965 ) ) ( not ( = ?auto_432960 ?auto_432966 ) ) ( not ( = ?auto_432960 ?auto_432967 ) ) ( not ( = ?auto_432960 ?auto_432968 ) ) ( not ( = ?auto_432960 ?auto_432969 ) ) ( not ( = ?auto_432960 ?auto_432970 ) ) ( not ( = ?auto_432960 ?auto_432971 ) ) ( not ( = ?auto_432960 ?auto_432972 ) ) ( not ( = ?auto_432961 ?auto_432962 ) ) ( not ( = ?auto_432961 ?auto_432963 ) ) ( not ( = ?auto_432961 ?auto_432964 ) ) ( not ( = ?auto_432961 ?auto_432965 ) ) ( not ( = ?auto_432961 ?auto_432966 ) ) ( not ( = ?auto_432961 ?auto_432967 ) ) ( not ( = ?auto_432961 ?auto_432968 ) ) ( not ( = ?auto_432961 ?auto_432969 ) ) ( not ( = ?auto_432961 ?auto_432970 ) ) ( not ( = ?auto_432961 ?auto_432971 ) ) ( not ( = ?auto_432961 ?auto_432972 ) ) ( not ( = ?auto_432962 ?auto_432963 ) ) ( not ( = ?auto_432962 ?auto_432964 ) ) ( not ( = ?auto_432962 ?auto_432965 ) ) ( not ( = ?auto_432962 ?auto_432966 ) ) ( not ( = ?auto_432962 ?auto_432967 ) ) ( not ( = ?auto_432962 ?auto_432968 ) ) ( not ( = ?auto_432962 ?auto_432969 ) ) ( not ( = ?auto_432962 ?auto_432970 ) ) ( not ( = ?auto_432962 ?auto_432971 ) ) ( not ( = ?auto_432962 ?auto_432972 ) ) ( not ( = ?auto_432963 ?auto_432964 ) ) ( not ( = ?auto_432963 ?auto_432965 ) ) ( not ( = ?auto_432963 ?auto_432966 ) ) ( not ( = ?auto_432963 ?auto_432967 ) ) ( not ( = ?auto_432963 ?auto_432968 ) ) ( not ( = ?auto_432963 ?auto_432969 ) ) ( not ( = ?auto_432963 ?auto_432970 ) ) ( not ( = ?auto_432963 ?auto_432971 ) ) ( not ( = ?auto_432963 ?auto_432972 ) ) ( not ( = ?auto_432964 ?auto_432965 ) ) ( not ( = ?auto_432964 ?auto_432966 ) ) ( not ( = ?auto_432964 ?auto_432967 ) ) ( not ( = ?auto_432964 ?auto_432968 ) ) ( not ( = ?auto_432964 ?auto_432969 ) ) ( not ( = ?auto_432964 ?auto_432970 ) ) ( not ( = ?auto_432964 ?auto_432971 ) ) ( not ( = ?auto_432964 ?auto_432972 ) ) ( not ( = ?auto_432965 ?auto_432966 ) ) ( not ( = ?auto_432965 ?auto_432967 ) ) ( not ( = ?auto_432965 ?auto_432968 ) ) ( not ( = ?auto_432965 ?auto_432969 ) ) ( not ( = ?auto_432965 ?auto_432970 ) ) ( not ( = ?auto_432965 ?auto_432971 ) ) ( not ( = ?auto_432965 ?auto_432972 ) ) ( not ( = ?auto_432966 ?auto_432967 ) ) ( not ( = ?auto_432966 ?auto_432968 ) ) ( not ( = ?auto_432966 ?auto_432969 ) ) ( not ( = ?auto_432966 ?auto_432970 ) ) ( not ( = ?auto_432966 ?auto_432971 ) ) ( not ( = ?auto_432966 ?auto_432972 ) ) ( not ( = ?auto_432967 ?auto_432968 ) ) ( not ( = ?auto_432967 ?auto_432969 ) ) ( not ( = ?auto_432967 ?auto_432970 ) ) ( not ( = ?auto_432967 ?auto_432971 ) ) ( not ( = ?auto_432967 ?auto_432972 ) ) ( not ( = ?auto_432968 ?auto_432969 ) ) ( not ( = ?auto_432968 ?auto_432970 ) ) ( not ( = ?auto_432968 ?auto_432971 ) ) ( not ( = ?auto_432968 ?auto_432972 ) ) ( not ( = ?auto_432969 ?auto_432970 ) ) ( not ( = ?auto_432969 ?auto_432971 ) ) ( not ( = ?auto_432969 ?auto_432972 ) ) ( not ( = ?auto_432970 ?auto_432971 ) ) ( not ( = ?auto_432970 ?auto_432972 ) ) ( not ( = ?auto_432971 ?auto_432972 ) ) ( ON ?auto_432970 ?auto_432971 ) ( ON ?auto_432969 ?auto_432970 ) ( ON ?auto_432968 ?auto_432969 ) ( CLEAR ?auto_432966 ) ( ON ?auto_432967 ?auto_432968 ) ( CLEAR ?auto_432967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432957 ?auto_432958 ?auto_432959 ?auto_432960 ?auto_432961 ?auto_432962 ?auto_432963 ?auto_432964 ?auto_432965 ?auto_432966 ?auto_432967 )
      ( MAKE-15PILE ?auto_432957 ?auto_432958 ?auto_432959 ?auto_432960 ?auto_432961 ?auto_432962 ?auto_432963 ?auto_432964 ?auto_432965 ?auto_432966 ?auto_432967 ?auto_432968 ?auto_432969 ?auto_432970 ?auto_432971 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432988 - BLOCK
      ?auto_432989 - BLOCK
      ?auto_432990 - BLOCK
      ?auto_432991 - BLOCK
      ?auto_432992 - BLOCK
      ?auto_432993 - BLOCK
      ?auto_432994 - BLOCK
      ?auto_432995 - BLOCK
      ?auto_432996 - BLOCK
      ?auto_432997 - BLOCK
      ?auto_432998 - BLOCK
      ?auto_432999 - BLOCK
      ?auto_433000 - BLOCK
      ?auto_433001 - BLOCK
      ?auto_433002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433002 ) ( ON-TABLE ?auto_432988 ) ( ON ?auto_432989 ?auto_432988 ) ( ON ?auto_432990 ?auto_432989 ) ( ON ?auto_432991 ?auto_432990 ) ( ON ?auto_432992 ?auto_432991 ) ( ON ?auto_432993 ?auto_432992 ) ( ON ?auto_432994 ?auto_432993 ) ( ON ?auto_432995 ?auto_432994 ) ( ON ?auto_432996 ?auto_432995 ) ( ON ?auto_432997 ?auto_432996 ) ( not ( = ?auto_432988 ?auto_432989 ) ) ( not ( = ?auto_432988 ?auto_432990 ) ) ( not ( = ?auto_432988 ?auto_432991 ) ) ( not ( = ?auto_432988 ?auto_432992 ) ) ( not ( = ?auto_432988 ?auto_432993 ) ) ( not ( = ?auto_432988 ?auto_432994 ) ) ( not ( = ?auto_432988 ?auto_432995 ) ) ( not ( = ?auto_432988 ?auto_432996 ) ) ( not ( = ?auto_432988 ?auto_432997 ) ) ( not ( = ?auto_432988 ?auto_432998 ) ) ( not ( = ?auto_432988 ?auto_432999 ) ) ( not ( = ?auto_432988 ?auto_433000 ) ) ( not ( = ?auto_432988 ?auto_433001 ) ) ( not ( = ?auto_432988 ?auto_433002 ) ) ( not ( = ?auto_432989 ?auto_432990 ) ) ( not ( = ?auto_432989 ?auto_432991 ) ) ( not ( = ?auto_432989 ?auto_432992 ) ) ( not ( = ?auto_432989 ?auto_432993 ) ) ( not ( = ?auto_432989 ?auto_432994 ) ) ( not ( = ?auto_432989 ?auto_432995 ) ) ( not ( = ?auto_432989 ?auto_432996 ) ) ( not ( = ?auto_432989 ?auto_432997 ) ) ( not ( = ?auto_432989 ?auto_432998 ) ) ( not ( = ?auto_432989 ?auto_432999 ) ) ( not ( = ?auto_432989 ?auto_433000 ) ) ( not ( = ?auto_432989 ?auto_433001 ) ) ( not ( = ?auto_432989 ?auto_433002 ) ) ( not ( = ?auto_432990 ?auto_432991 ) ) ( not ( = ?auto_432990 ?auto_432992 ) ) ( not ( = ?auto_432990 ?auto_432993 ) ) ( not ( = ?auto_432990 ?auto_432994 ) ) ( not ( = ?auto_432990 ?auto_432995 ) ) ( not ( = ?auto_432990 ?auto_432996 ) ) ( not ( = ?auto_432990 ?auto_432997 ) ) ( not ( = ?auto_432990 ?auto_432998 ) ) ( not ( = ?auto_432990 ?auto_432999 ) ) ( not ( = ?auto_432990 ?auto_433000 ) ) ( not ( = ?auto_432990 ?auto_433001 ) ) ( not ( = ?auto_432990 ?auto_433002 ) ) ( not ( = ?auto_432991 ?auto_432992 ) ) ( not ( = ?auto_432991 ?auto_432993 ) ) ( not ( = ?auto_432991 ?auto_432994 ) ) ( not ( = ?auto_432991 ?auto_432995 ) ) ( not ( = ?auto_432991 ?auto_432996 ) ) ( not ( = ?auto_432991 ?auto_432997 ) ) ( not ( = ?auto_432991 ?auto_432998 ) ) ( not ( = ?auto_432991 ?auto_432999 ) ) ( not ( = ?auto_432991 ?auto_433000 ) ) ( not ( = ?auto_432991 ?auto_433001 ) ) ( not ( = ?auto_432991 ?auto_433002 ) ) ( not ( = ?auto_432992 ?auto_432993 ) ) ( not ( = ?auto_432992 ?auto_432994 ) ) ( not ( = ?auto_432992 ?auto_432995 ) ) ( not ( = ?auto_432992 ?auto_432996 ) ) ( not ( = ?auto_432992 ?auto_432997 ) ) ( not ( = ?auto_432992 ?auto_432998 ) ) ( not ( = ?auto_432992 ?auto_432999 ) ) ( not ( = ?auto_432992 ?auto_433000 ) ) ( not ( = ?auto_432992 ?auto_433001 ) ) ( not ( = ?auto_432992 ?auto_433002 ) ) ( not ( = ?auto_432993 ?auto_432994 ) ) ( not ( = ?auto_432993 ?auto_432995 ) ) ( not ( = ?auto_432993 ?auto_432996 ) ) ( not ( = ?auto_432993 ?auto_432997 ) ) ( not ( = ?auto_432993 ?auto_432998 ) ) ( not ( = ?auto_432993 ?auto_432999 ) ) ( not ( = ?auto_432993 ?auto_433000 ) ) ( not ( = ?auto_432993 ?auto_433001 ) ) ( not ( = ?auto_432993 ?auto_433002 ) ) ( not ( = ?auto_432994 ?auto_432995 ) ) ( not ( = ?auto_432994 ?auto_432996 ) ) ( not ( = ?auto_432994 ?auto_432997 ) ) ( not ( = ?auto_432994 ?auto_432998 ) ) ( not ( = ?auto_432994 ?auto_432999 ) ) ( not ( = ?auto_432994 ?auto_433000 ) ) ( not ( = ?auto_432994 ?auto_433001 ) ) ( not ( = ?auto_432994 ?auto_433002 ) ) ( not ( = ?auto_432995 ?auto_432996 ) ) ( not ( = ?auto_432995 ?auto_432997 ) ) ( not ( = ?auto_432995 ?auto_432998 ) ) ( not ( = ?auto_432995 ?auto_432999 ) ) ( not ( = ?auto_432995 ?auto_433000 ) ) ( not ( = ?auto_432995 ?auto_433001 ) ) ( not ( = ?auto_432995 ?auto_433002 ) ) ( not ( = ?auto_432996 ?auto_432997 ) ) ( not ( = ?auto_432996 ?auto_432998 ) ) ( not ( = ?auto_432996 ?auto_432999 ) ) ( not ( = ?auto_432996 ?auto_433000 ) ) ( not ( = ?auto_432996 ?auto_433001 ) ) ( not ( = ?auto_432996 ?auto_433002 ) ) ( not ( = ?auto_432997 ?auto_432998 ) ) ( not ( = ?auto_432997 ?auto_432999 ) ) ( not ( = ?auto_432997 ?auto_433000 ) ) ( not ( = ?auto_432997 ?auto_433001 ) ) ( not ( = ?auto_432997 ?auto_433002 ) ) ( not ( = ?auto_432998 ?auto_432999 ) ) ( not ( = ?auto_432998 ?auto_433000 ) ) ( not ( = ?auto_432998 ?auto_433001 ) ) ( not ( = ?auto_432998 ?auto_433002 ) ) ( not ( = ?auto_432999 ?auto_433000 ) ) ( not ( = ?auto_432999 ?auto_433001 ) ) ( not ( = ?auto_432999 ?auto_433002 ) ) ( not ( = ?auto_433000 ?auto_433001 ) ) ( not ( = ?auto_433000 ?auto_433002 ) ) ( not ( = ?auto_433001 ?auto_433002 ) ) ( ON ?auto_433001 ?auto_433002 ) ( ON ?auto_433000 ?auto_433001 ) ( ON ?auto_432999 ?auto_433000 ) ( CLEAR ?auto_432997 ) ( ON ?auto_432998 ?auto_432999 ) ( CLEAR ?auto_432998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432988 ?auto_432989 ?auto_432990 ?auto_432991 ?auto_432992 ?auto_432993 ?auto_432994 ?auto_432995 ?auto_432996 ?auto_432997 ?auto_432998 )
      ( MAKE-15PILE ?auto_432988 ?auto_432989 ?auto_432990 ?auto_432991 ?auto_432992 ?auto_432993 ?auto_432994 ?auto_432995 ?auto_432996 ?auto_432997 ?auto_432998 ?auto_432999 ?auto_433000 ?auto_433001 ?auto_433002 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433018 - BLOCK
      ?auto_433019 - BLOCK
      ?auto_433020 - BLOCK
      ?auto_433021 - BLOCK
      ?auto_433022 - BLOCK
      ?auto_433023 - BLOCK
      ?auto_433024 - BLOCK
      ?auto_433025 - BLOCK
      ?auto_433026 - BLOCK
      ?auto_433027 - BLOCK
      ?auto_433028 - BLOCK
      ?auto_433029 - BLOCK
      ?auto_433030 - BLOCK
      ?auto_433031 - BLOCK
      ?auto_433032 - BLOCK
    )
    :vars
    (
      ?auto_433033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433032 ?auto_433033 ) ( ON-TABLE ?auto_433018 ) ( ON ?auto_433019 ?auto_433018 ) ( ON ?auto_433020 ?auto_433019 ) ( ON ?auto_433021 ?auto_433020 ) ( ON ?auto_433022 ?auto_433021 ) ( ON ?auto_433023 ?auto_433022 ) ( ON ?auto_433024 ?auto_433023 ) ( ON ?auto_433025 ?auto_433024 ) ( ON ?auto_433026 ?auto_433025 ) ( not ( = ?auto_433018 ?auto_433019 ) ) ( not ( = ?auto_433018 ?auto_433020 ) ) ( not ( = ?auto_433018 ?auto_433021 ) ) ( not ( = ?auto_433018 ?auto_433022 ) ) ( not ( = ?auto_433018 ?auto_433023 ) ) ( not ( = ?auto_433018 ?auto_433024 ) ) ( not ( = ?auto_433018 ?auto_433025 ) ) ( not ( = ?auto_433018 ?auto_433026 ) ) ( not ( = ?auto_433018 ?auto_433027 ) ) ( not ( = ?auto_433018 ?auto_433028 ) ) ( not ( = ?auto_433018 ?auto_433029 ) ) ( not ( = ?auto_433018 ?auto_433030 ) ) ( not ( = ?auto_433018 ?auto_433031 ) ) ( not ( = ?auto_433018 ?auto_433032 ) ) ( not ( = ?auto_433018 ?auto_433033 ) ) ( not ( = ?auto_433019 ?auto_433020 ) ) ( not ( = ?auto_433019 ?auto_433021 ) ) ( not ( = ?auto_433019 ?auto_433022 ) ) ( not ( = ?auto_433019 ?auto_433023 ) ) ( not ( = ?auto_433019 ?auto_433024 ) ) ( not ( = ?auto_433019 ?auto_433025 ) ) ( not ( = ?auto_433019 ?auto_433026 ) ) ( not ( = ?auto_433019 ?auto_433027 ) ) ( not ( = ?auto_433019 ?auto_433028 ) ) ( not ( = ?auto_433019 ?auto_433029 ) ) ( not ( = ?auto_433019 ?auto_433030 ) ) ( not ( = ?auto_433019 ?auto_433031 ) ) ( not ( = ?auto_433019 ?auto_433032 ) ) ( not ( = ?auto_433019 ?auto_433033 ) ) ( not ( = ?auto_433020 ?auto_433021 ) ) ( not ( = ?auto_433020 ?auto_433022 ) ) ( not ( = ?auto_433020 ?auto_433023 ) ) ( not ( = ?auto_433020 ?auto_433024 ) ) ( not ( = ?auto_433020 ?auto_433025 ) ) ( not ( = ?auto_433020 ?auto_433026 ) ) ( not ( = ?auto_433020 ?auto_433027 ) ) ( not ( = ?auto_433020 ?auto_433028 ) ) ( not ( = ?auto_433020 ?auto_433029 ) ) ( not ( = ?auto_433020 ?auto_433030 ) ) ( not ( = ?auto_433020 ?auto_433031 ) ) ( not ( = ?auto_433020 ?auto_433032 ) ) ( not ( = ?auto_433020 ?auto_433033 ) ) ( not ( = ?auto_433021 ?auto_433022 ) ) ( not ( = ?auto_433021 ?auto_433023 ) ) ( not ( = ?auto_433021 ?auto_433024 ) ) ( not ( = ?auto_433021 ?auto_433025 ) ) ( not ( = ?auto_433021 ?auto_433026 ) ) ( not ( = ?auto_433021 ?auto_433027 ) ) ( not ( = ?auto_433021 ?auto_433028 ) ) ( not ( = ?auto_433021 ?auto_433029 ) ) ( not ( = ?auto_433021 ?auto_433030 ) ) ( not ( = ?auto_433021 ?auto_433031 ) ) ( not ( = ?auto_433021 ?auto_433032 ) ) ( not ( = ?auto_433021 ?auto_433033 ) ) ( not ( = ?auto_433022 ?auto_433023 ) ) ( not ( = ?auto_433022 ?auto_433024 ) ) ( not ( = ?auto_433022 ?auto_433025 ) ) ( not ( = ?auto_433022 ?auto_433026 ) ) ( not ( = ?auto_433022 ?auto_433027 ) ) ( not ( = ?auto_433022 ?auto_433028 ) ) ( not ( = ?auto_433022 ?auto_433029 ) ) ( not ( = ?auto_433022 ?auto_433030 ) ) ( not ( = ?auto_433022 ?auto_433031 ) ) ( not ( = ?auto_433022 ?auto_433032 ) ) ( not ( = ?auto_433022 ?auto_433033 ) ) ( not ( = ?auto_433023 ?auto_433024 ) ) ( not ( = ?auto_433023 ?auto_433025 ) ) ( not ( = ?auto_433023 ?auto_433026 ) ) ( not ( = ?auto_433023 ?auto_433027 ) ) ( not ( = ?auto_433023 ?auto_433028 ) ) ( not ( = ?auto_433023 ?auto_433029 ) ) ( not ( = ?auto_433023 ?auto_433030 ) ) ( not ( = ?auto_433023 ?auto_433031 ) ) ( not ( = ?auto_433023 ?auto_433032 ) ) ( not ( = ?auto_433023 ?auto_433033 ) ) ( not ( = ?auto_433024 ?auto_433025 ) ) ( not ( = ?auto_433024 ?auto_433026 ) ) ( not ( = ?auto_433024 ?auto_433027 ) ) ( not ( = ?auto_433024 ?auto_433028 ) ) ( not ( = ?auto_433024 ?auto_433029 ) ) ( not ( = ?auto_433024 ?auto_433030 ) ) ( not ( = ?auto_433024 ?auto_433031 ) ) ( not ( = ?auto_433024 ?auto_433032 ) ) ( not ( = ?auto_433024 ?auto_433033 ) ) ( not ( = ?auto_433025 ?auto_433026 ) ) ( not ( = ?auto_433025 ?auto_433027 ) ) ( not ( = ?auto_433025 ?auto_433028 ) ) ( not ( = ?auto_433025 ?auto_433029 ) ) ( not ( = ?auto_433025 ?auto_433030 ) ) ( not ( = ?auto_433025 ?auto_433031 ) ) ( not ( = ?auto_433025 ?auto_433032 ) ) ( not ( = ?auto_433025 ?auto_433033 ) ) ( not ( = ?auto_433026 ?auto_433027 ) ) ( not ( = ?auto_433026 ?auto_433028 ) ) ( not ( = ?auto_433026 ?auto_433029 ) ) ( not ( = ?auto_433026 ?auto_433030 ) ) ( not ( = ?auto_433026 ?auto_433031 ) ) ( not ( = ?auto_433026 ?auto_433032 ) ) ( not ( = ?auto_433026 ?auto_433033 ) ) ( not ( = ?auto_433027 ?auto_433028 ) ) ( not ( = ?auto_433027 ?auto_433029 ) ) ( not ( = ?auto_433027 ?auto_433030 ) ) ( not ( = ?auto_433027 ?auto_433031 ) ) ( not ( = ?auto_433027 ?auto_433032 ) ) ( not ( = ?auto_433027 ?auto_433033 ) ) ( not ( = ?auto_433028 ?auto_433029 ) ) ( not ( = ?auto_433028 ?auto_433030 ) ) ( not ( = ?auto_433028 ?auto_433031 ) ) ( not ( = ?auto_433028 ?auto_433032 ) ) ( not ( = ?auto_433028 ?auto_433033 ) ) ( not ( = ?auto_433029 ?auto_433030 ) ) ( not ( = ?auto_433029 ?auto_433031 ) ) ( not ( = ?auto_433029 ?auto_433032 ) ) ( not ( = ?auto_433029 ?auto_433033 ) ) ( not ( = ?auto_433030 ?auto_433031 ) ) ( not ( = ?auto_433030 ?auto_433032 ) ) ( not ( = ?auto_433030 ?auto_433033 ) ) ( not ( = ?auto_433031 ?auto_433032 ) ) ( not ( = ?auto_433031 ?auto_433033 ) ) ( not ( = ?auto_433032 ?auto_433033 ) ) ( ON ?auto_433031 ?auto_433032 ) ( ON ?auto_433030 ?auto_433031 ) ( ON ?auto_433029 ?auto_433030 ) ( ON ?auto_433028 ?auto_433029 ) ( CLEAR ?auto_433026 ) ( ON ?auto_433027 ?auto_433028 ) ( CLEAR ?auto_433027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_433018 ?auto_433019 ?auto_433020 ?auto_433021 ?auto_433022 ?auto_433023 ?auto_433024 ?auto_433025 ?auto_433026 ?auto_433027 )
      ( MAKE-15PILE ?auto_433018 ?auto_433019 ?auto_433020 ?auto_433021 ?auto_433022 ?auto_433023 ?auto_433024 ?auto_433025 ?auto_433026 ?auto_433027 ?auto_433028 ?auto_433029 ?auto_433030 ?auto_433031 ?auto_433032 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433049 - BLOCK
      ?auto_433050 - BLOCK
      ?auto_433051 - BLOCK
      ?auto_433052 - BLOCK
      ?auto_433053 - BLOCK
      ?auto_433054 - BLOCK
      ?auto_433055 - BLOCK
      ?auto_433056 - BLOCK
      ?auto_433057 - BLOCK
      ?auto_433058 - BLOCK
      ?auto_433059 - BLOCK
      ?auto_433060 - BLOCK
      ?auto_433061 - BLOCK
      ?auto_433062 - BLOCK
      ?auto_433063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433063 ) ( ON-TABLE ?auto_433049 ) ( ON ?auto_433050 ?auto_433049 ) ( ON ?auto_433051 ?auto_433050 ) ( ON ?auto_433052 ?auto_433051 ) ( ON ?auto_433053 ?auto_433052 ) ( ON ?auto_433054 ?auto_433053 ) ( ON ?auto_433055 ?auto_433054 ) ( ON ?auto_433056 ?auto_433055 ) ( ON ?auto_433057 ?auto_433056 ) ( not ( = ?auto_433049 ?auto_433050 ) ) ( not ( = ?auto_433049 ?auto_433051 ) ) ( not ( = ?auto_433049 ?auto_433052 ) ) ( not ( = ?auto_433049 ?auto_433053 ) ) ( not ( = ?auto_433049 ?auto_433054 ) ) ( not ( = ?auto_433049 ?auto_433055 ) ) ( not ( = ?auto_433049 ?auto_433056 ) ) ( not ( = ?auto_433049 ?auto_433057 ) ) ( not ( = ?auto_433049 ?auto_433058 ) ) ( not ( = ?auto_433049 ?auto_433059 ) ) ( not ( = ?auto_433049 ?auto_433060 ) ) ( not ( = ?auto_433049 ?auto_433061 ) ) ( not ( = ?auto_433049 ?auto_433062 ) ) ( not ( = ?auto_433049 ?auto_433063 ) ) ( not ( = ?auto_433050 ?auto_433051 ) ) ( not ( = ?auto_433050 ?auto_433052 ) ) ( not ( = ?auto_433050 ?auto_433053 ) ) ( not ( = ?auto_433050 ?auto_433054 ) ) ( not ( = ?auto_433050 ?auto_433055 ) ) ( not ( = ?auto_433050 ?auto_433056 ) ) ( not ( = ?auto_433050 ?auto_433057 ) ) ( not ( = ?auto_433050 ?auto_433058 ) ) ( not ( = ?auto_433050 ?auto_433059 ) ) ( not ( = ?auto_433050 ?auto_433060 ) ) ( not ( = ?auto_433050 ?auto_433061 ) ) ( not ( = ?auto_433050 ?auto_433062 ) ) ( not ( = ?auto_433050 ?auto_433063 ) ) ( not ( = ?auto_433051 ?auto_433052 ) ) ( not ( = ?auto_433051 ?auto_433053 ) ) ( not ( = ?auto_433051 ?auto_433054 ) ) ( not ( = ?auto_433051 ?auto_433055 ) ) ( not ( = ?auto_433051 ?auto_433056 ) ) ( not ( = ?auto_433051 ?auto_433057 ) ) ( not ( = ?auto_433051 ?auto_433058 ) ) ( not ( = ?auto_433051 ?auto_433059 ) ) ( not ( = ?auto_433051 ?auto_433060 ) ) ( not ( = ?auto_433051 ?auto_433061 ) ) ( not ( = ?auto_433051 ?auto_433062 ) ) ( not ( = ?auto_433051 ?auto_433063 ) ) ( not ( = ?auto_433052 ?auto_433053 ) ) ( not ( = ?auto_433052 ?auto_433054 ) ) ( not ( = ?auto_433052 ?auto_433055 ) ) ( not ( = ?auto_433052 ?auto_433056 ) ) ( not ( = ?auto_433052 ?auto_433057 ) ) ( not ( = ?auto_433052 ?auto_433058 ) ) ( not ( = ?auto_433052 ?auto_433059 ) ) ( not ( = ?auto_433052 ?auto_433060 ) ) ( not ( = ?auto_433052 ?auto_433061 ) ) ( not ( = ?auto_433052 ?auto_433062 ) ) ( not ( = ?auto_433052 ?auto_433063 ) ) ( not ( = ?auto_433053 ?auto_433054 ) ) ( not ( = ?auto_433053 ?auto_433055 ) ) ( not ( = ?auto_433053 ?auto_433056 ) ) ( not ( = ?auto_433053 ?auto_433057 ) ) ( not ( = ?auto_433053 ?auto_433058 ) ) ( not ( = ?auto_433053 ?auto_433059 ) ) ( not ( = ?auto_433053 ?auto_433060 ) ) ( not ( = ?auto_433053 ?auto_433061 ) ) ( not ( = ?auto_433053 ?auto_433062 ) ) ( not ( = ?auto_433053 ?auto_433063 ) ) ( not ( = ?auto_433054 ?auto_433055 ) ) ( not ( = ?auto_433054 ?auto_433056 ) ) ( not ( = ?auto_433054 ?auto_433057 ) ) ( not ( = ?auto_433054 ?auto_433058 ) ) ( not ( = ?auto_433054 ?auto_433059 ) ) ( not ( = ?auto_433054 ?auto_433060 ) ) ( not ( = ?auto_433054 ?auto_433061 ) ) ( not ( = ?auto_433054 ?auto_433062 ) ) ( not ( = ?auto_433054 ?auto_433063 ) ) ( not ( = ?auto_433055 ?auto_433056 ) ) ( not ( = ?auto_433055 ?auto_433057 ) ) ( not ( = ?auto_433055 ?auto_433058 ) ) ( not ( = ?auto_433055 ?auto_433059 ) ) ( not ( = ?auto_433055 ?auto_433060 ) ) ( not ( = ?auto_433055 ?auto_433061 ) ) ( not ( = ?auto_433055 ?auto_433062 ) ) ( not ( = ?auto_433055 ?auto_433063 ) ) ( not ( = ?auto_433056 ?auto_433057 ) ) ( not ( = ?auto_433056 ?auto_433058 ) ) ( not ( = ?auto_433056 ?auto_433059 ) ) ( not ( = ?auto_433056 ?auto_433060 ) ) ( not ( = ?auto_433056 ?auto_433061 ) ) ( not ( = ?auto_433056 ?auto_433062 ) ) ( not ( = ?auto_433056 ?auto_433063 ) ) ( not ( = ?auto_433057 ?auto_433058 ) ) ( not ( = ?auto_433057 ?auto_433059 ) ) ( not ( = ?auto_433057 ?auto_433060 ) ) ( not ( = ?auto_433057 ?auto_433061 ) ) ( not ( = ?auto_433057 ?auto_433062 ) ) ( not ( = ?auto_433057 ?auto_433063 ) ) ( not ( = ?auto_433058 ?auto_433059 ) ) ( not ( = ?auto_433058 ?auto_433060 ) ) ( not ( = ?auto_433058 ?auto_433061 ) ) ( not ( = ?auto_433058 ?auto_433062 ) ) ( not ( = ?auto_433058 ?auto_433063 ) ) ( not ( = ?auto_433059 ?auto_433060 ) ) ( not ( = ?auto_433059 ?auto_433061 ) ) ( not ( = ?auto_433059 ?auto_433062 ) ) ( not ( = ?auto_433059 ?auto_433063 ) ) ( not ( = ?auto_433060 ?auto_433061 ) ) ( not ( = ?auto_433060 ?auto_433062 ) ) ( not ( = ?auto_433060 ?auto_433063 ) ) ( not ( = ?auto_433061 ?auto_433062 ) ) ( not ( = ?auto_433061 ?auto_433063 ) ) ( not ( = ?auto_433062 ?auto_433063 ) ) ( ON ?auto_433062 ?auto_433063 ) ( ON ?auto_433061 ?auto_433062 ) ( ON ?auto_433060 ?auto_433061 ) ( ON ?auto_433059 ?auto_433060 ) ( CLEAR ?auto_433057 ) ( ON ?auto_433058 ?auto_433059 ) ( CLEAR ?auto_433058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_433049 ?auto_433050 ?auto_433051 ?auto_433052 ?auto_433053 ?auto_433054 ?auto_433055 ?auto_433056 ?auto_433057 ?auto_433058 )
      ( MAKE-15PILE ?auto_433049 ?auto_433050 ?auto_433051 ?auto_433052 ?auto_433053 ?auto_433054 ?auto_433055 ?auto_433056 ?auto_433057 ?auto_433058 ?auto_433059 ?auto_433060 ?auto_433061 ?auto_433062 ?auto_433063 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433079 - BLOCK
      ?auto_433080 - BLOCK
      ?auto_433081 - BLOCK
      ?auto_433082 - BLOCK
      ?auto_433083 - BLOCK
      ?auto_433084 - BLOCK
      ?auto_433085 - BLOCK
      ?auto_433086 - BLOCK
      ?auto_433087 - BLOCK
      ?auto_433088 - BLOCK
      ?auto_433089 - BLOCK
      ?auto_433090 - BLOCK
      ?auto_433091 - BLOCK
      ?auto_433092 - BLOCK
      ?auto_433093 - BLOCK
    )
    :vars
    (
      ?auto_433094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433093 ?auto_433094 ) ( ON-TABLE ?auto_433079 ) ( ON ?auto_433080 ?auto_433079 ) ( ON ?auto_433081 ?auto_433080 ) ( ON ?auto_433082 ?auto_433081 ) ( ON ?auto_433083 ?auto_433082 ) ( ON ?auto_433084 ?auto_433083 ) ( ON ?auto_433085 ?auto_433084 ) ( ON ?auto_433086 ?auto_433085 ) ( not ( = ?auto_433079 ?auto_433080 ) ) ( not ( = ?auto_433079 ?auto_433081 ) ) ( not ( = ?auto_433079 ?auto_433082 ) ) ( not ( = ?auto_433079 ?auto_433083 ) ) ( not ( = ?auto_433079 ?auto_433084 ) ) ( not ( = ?auto_433079 ?auto_433085 ) ) ( not ( = ?auto_433079 ?auto_433086 ) ) ( not ( = ?auto_433079 ?auto_433087 ) ) ( not ( = ?auto_433079 ?auto_433088 ) ) ( not ( = ?auto_433079 ?auto_433089 ) ) ( not ( = ?auto_433079 ?auto_433090 ) ) ( not ( = ?auto_433079 ?auto_433091 ) ) ( not ( = ?auto_433079 ?auto_433092 ) ) ( not ( = ?auto_433079 ?auto_433093 ) ) ( not ( = ?auto_433079 ?auto_433094 ) ) ( not ( = ?auto_433080 ?auto_433081 ) ) ( not ( = ?auto_433080 ?auto_433082 ) ) ( not ( = ?auto_433080 ?auto_433083 ) ) ( not ( = ?auto_433080 ?auto_433084 ) ) ( not ( = ?auto_433080 ?auto_433085 ) ) ( not ( = ?auto_433080 ?auto_433086 ) ) ( not ( = ?auto_433080 ?auto_433087 ) ) ( not ( = ?auto_433080 ?auto_433088 ) ) ( not ( = ?auto_433080 ?auto_433089 ) ) ( not ( = ?auto_433080 ?auto_433090 ) ) ( not ( = ?auto_433080 ?auto_433091 ) ) ( not ( = ?auto_433080 ?auto_433092 ) ) ( not ( = ?auto_433080 ?auto_433093 ) ) ( not ( = ?auto_433080 ?auto_433094 ) ) ( not ( = ?auto_433081 ?auto_433082 ) ) ( not ( = ?auto_433081 ?auto_433083 ) ) ( not ( = ?auto_433081 ?auto_433084 ) ) ( not ( = ?auto_433081 ?auto_433085 ) ) ( not ( = ?auto_433081 ?auto_433086 ) ) ( not ( = ?auto_433081 ?auto_433087 ) ) ( not ( = ?auto_433081 ?auto_433088 ) ) ( not ( = ?auto_433081 ?auto_433089 ) ) ( not ( = ?auto_433081 ?auto_433090 ) ) ( not ( = ?auto_433081 ?auto_433091 ) ) ( not ( = ?auto_433081 ?auto_433092 ) ) ( not ( = ?auto_433081 ?auto_433093 ) ) ( not ( = ?auto_433081 ?auto_433094 ) ) ( not ( = ?auto_433082 ?auto_433083 ) ) ( not ( = ?auto_433082 ?auto_433084 ) ) ( not ( = ?auto_433082 ?auto_433085 ) ) ( not ( = ?auto_433082 ?auto_433086 ) ) ( not ( = ?auto_433082 ?auto_433087 ) ) ( not ( = ?auto_433082 ?auto_433088 ) ) ( not ( = ?auto_433082 ?auto_433089 ) ) ( not ( = ?auto_433082 ?auto_433090 ) ) ( not ( = ?auto_433082 ?auto_433091 ) ) ( not ( = ?auto_433082 ?auto_433092 ) ) ( not ( = ?auto_433082 ?auto_433093 ) ) ( not ( = ?auto_433082 ?auto_433094 ) ) ( not ( = ?auto_433083 ?auto_433084 ) ) ( not ( = ?auto_433083 ?auto_433085 ) ) ( not ( = ?auto_433083 ?auto_433086 ) ) ( not ( = ?auto_433083 ?auto_433087 ) ) ( not ( = ?auto_433083 ?auto_433088 ) ) ( not ( = ?auto_433083 ?auto_433089 ) ) ( not ( = ?auto_433083 ?auto_433090 ) ) ( not ( = ?auto_433083 ?auto_433091 ) ) ( not ( = ?auto_433083 ?auto_433092 ) ) ( not ( = ?auto_433083 ?auto_433093 ) ) ( not ( = ?auto_433083 ?auto_433094 ) ) ( not ( = ?auto_433084 ?auto_433085 ) ) ( not ( = ?auto_433084 ?auto_433086 ) ) ( not ( = ?auto_433084 ?auto_433087 ) ) ( not ( = ?auto_433084 ?auto_433088 ) ) ( not ( = ?auto_433084 ?auto_433089 ) ) ( not ( = ?auto_433084 ?auto_433090 ) ) ( not ( = ?auto_433084 ?auto_433091 ) ) ( not ( = ?auto_433084 ?auto_433092 ) ) ( not ( = ?auto_433084 ?auto_433093 ) ) ( not ( = ?auto_433084 ?auto_433094 ) ) ( not ( = ?auto_433085 ?auto_433086 ) ) ( not ( = ?auto_433085 ?auto_433087 ) ) ( not ( = ?auto_433085 ?auto_433088 ) ) ( not ( = ?auto_433085 ?auto_433089 ) ) ( not ( = ?auto_433085 ?auto_433090 ) ) ( not ( = ?auto_433085 ?auto_433091 ) ) ( not ( = ?auto_433085 ?auto_433092 ) ) ( not ( = ?auto_433085 ?auto_433093 ) ) ( not ( = ?auto_433085 ?auto_433094 ) ) ( not ( = ?auto_433086 ?auto_433087 ) ) ( not ( = ?auto_433086 ?auto_433088 ) ) ( not ( = ?auto_433086 ?auto_433089 ) ) ( not ( = ?auto_433086 ?auto_433090 ) ) ( not ( = ?auto_433086 ?auto_433091 ) ) ( not ( = ?auto_433086 ?auto_433092 ) ) ( not ( = ?auto_433086 ?auto_433093 ) ) ( not ( = ?auto_433086 ?auto_433094 ) ) ( not ( = ?auto_433087 ?auto_433088 ) ) ( not ( = ?auto_433087 ?auto_433089 ) ) ( not ( = ?auto_433087 ?auto_433090 ) ) ( not ( = ?auto_433087 ?auto_433091 ) ) ( not ( = ?auto_433087 ?auto_433092 ) ) ( not ( = ?auto_433087 ?auto_433093 ) ) ( not ( = ?auto_433087 ?auto_433094 ) ) ( not ( = ?auto_433088 ?auto_433089 ) ) ( not ( = ?auto_433088 ?auto_433090 ) ) ( not ( = ?auto_433088 ?auto_433091 ) ) ( not ( = ?auto_433088 ?auto_433092 ) ) ( not ( = ?auto_433088 ?auto_433093 ) ) ( not ( = ?auto_433088 ?auto_433094 ) ) ( not ( = ?auto_433089 ?auto_433090 ) ) ( not ( = ?auto_433089 ?auto_433091 ) ) ( not ( = ?auto_433089 ?auto_433092 ) ) ( not ( = ?auto_433089 ?auto_433093 ) ) ( not ( = ?auto_433089 ?auto_433094 ) ) ( not ( = ?auto_433090 ?auto_433091 ) ) ( not ( = ?auto_433090 ?auto_433092 ) ) ( not ( = ?auto_433090 ?auto_433093 ) ) ( not ( = ?auto_433090 ?auto_433094 ) ) ( not ( = ?auto_433091 ?auto_433092 ) ) ( not ( = ?auto_433091 ?auto_433093 ) ) ( not ( = ?auto_433091 ?auto_433094 ) ) ( not ( = ?auto_433092 ?auto_433093 ) ) ( not ( = ?auto_433092 ?auto_433094 ) ) ( not ( = ?auto_433093 ?auto_433094 ) ) ( ON ?auto_433092 ?auto_433093 ) ( ON ?auto_433091 ?auto_433092 ) ( ON ?auto_433090 ?auto_433091 ) ( ON ?auto_433089 ?auto_433090 ) ( ON ?auto_433088 ?auto_433089 ) ( CLEAR ?auto_433086 ) ( ON ?auto_433087 ?auto_433088 ) ( CLEAR ?auto_433087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_433079 ?auto_433080 ?auto_433081 ?auto_433082 ?auto_433083 ?auto_433084 ?auto_433085 ?auto_433086 ?auto_433087 )
      ( MAKE-15PILE ?auto_433079 ?auto_433080 ?auto_433081 ?auto_433082 ?auto_433083 ?auto_433084 ?auto_433085 ?auto_433086 ?auto_433087 ?auto_433088 ?auto_433089 ?auto_433090 ?auto_433091 ?auto_433092 ?auto_433093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433110 - BLOCK
      ?auto_433111 - BLOCK
      ?auto_433112 - BLOCK
      ?auto_433113 - BLOCK
      ?auto_433114 - BLOCK
      ?auto_433115 - BLOCK
      ?auto_433116 - BLOCK
      ?auto_433117 - BLOCK
      ?auto_433118 - BLOCK
      ?auto_433119 - BLOCK
      ?auto_433120 - BLOCK
      ?auto_433121 - BLOCK
      ?auto_433122 - BLOCK
      ?auto_433123 - BLOCK
      ?auto_433124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433124 ) ( ON-TABLE ?auto_433110 ) ( ON ?auto_433111 ?auto_433110 ) ( ON ?auto_433112 ?auto_433111 ) ( ON ?auto_433113 ?auto_433112 ) ( ON ?auto_433114 ?auto_433113 ) ( ON ?auto_433115 ?auto_433114 ) ( ON ?auto_433116 ?auto_433115 ) ( ON ?auto_433117 ?auto_433116 ) ( not ( = ?auto_433110 ?auto_433111 ) ) ( not ( = ?auto_433110 ?auto_433112 ) ) ( not ( = ?auto_433110 ?auto_433113 ) ) ( not ( = ?auto_433110 ?auto_433114 ) ) ( not ( = ?auto_433110 ?auto_433115 ) ) ( not ( = ?auto_433110 ?auto_433116 ) ) ( not ( = ?auto_433110 ?auto_433117 ) ) ( not ( = ?auto_433110 ?auto_433118 ) ) ( not ( = ?auto_433110 ?auto_433119 ) ) ( not ( = ?auto_433110 ?auto_433120 ) ) ( not ( = ?auto_433110 ?auto_433121 ) ) ( not ( = ?auto_433110 ?auto_433122 ) ) ( not ( = ?auto_433110 ?auto_433123 ) ) ( not ( = ?auto_433110 ?auto_433124 ) ) ( not ( = ?auto_433111 ?auto_433112 ) ) ( not ( = ?auto_433111 ?auto_433113 ) ) ( not ( = ?auto_433111 ?auto_433114 ) ) ( not ( = ?auto_433111 ?auto_433115 ) ) ( not ( = ?auto_433111 ?auto_433116 ) ) ( not ( = ?auto_433111 ?auto_433117 ) ) ( not ( = ?auto_433111 ?auto_433118 ) ) ( not ( = ?auto_433111 ?auto_433119 ) ) ( not ( = ?auto_433111 ?auto_433120 ) ) ( not ( = ?auto_433111 ?auto_433121 ) ) ( not ( = ?auto_433111 ?auto_433122 ) ) ( not ( = ?auto_433111 ?auto_433123 ) ) ( not ( = ?auto_433111 ?auto_433124 ) ) ( not ( = ?auto_433112 ?auto_433113 ) ) ( not ( = ?auto_433112 ?auto_433114 ) ) ( not ( = ?auto_433112 ?auto_433115 ) ) ( not ( = ?auto_433112 ?auto_433116 ) ) ( not ( = ?auto_433112 ?auto_433117 ) ) ( not ( = ?auto_433112 ?auto_433118 ) ) ( not ( = ?auto_433112 ?auto_433119 ) ) ( not ( = ?auto_433112 ?auto_433120 ) ) ( not ( = ?auto_433112 ?auto_433121 ) ) ( not ( = ?auto_433112 ?auto_433122 ) ) ( not ( = ?auto_433112 ?auto_433123 ) ) ( not ( = ?auto_433112 ?auto_433124 ) ) ( not ( = ?auto_433113 ?auto_433114 ) ) ( not ( = ?auto_433113 ?auto_433115 ) ) ( not ( = ?auto_433113 ?auto_433116 ) ) ( not ( = ?auto_433113 ?auto_433117 ) ) ( not ( = ?auto_433113 ?auto_433118 ) ) ( not ( = ?auto_433113 ?auto_433119 ) ) ( not ( = ?auto_433113 ?auto_433120 ) ) ( not ( = ?auto_433113 ?auto_433121 ) ) ( not ( = ?auto_433113 ?auto_433122 ) ) ( not ( = ?auto_433113 ?auto_433123 ) ) ( not ( = ?auto_433113 ?auto_433124 ) ) ( not ( = ?auto_433114 ?auto_433115 ) ) ( not ( = ?auto_433114 ?auto_433116 ) ) ( not ( = ?auto_433114 ?auto_433117 ) ) ( not ( = ?auto_433114 ?auto_433118 ) ) ( not ( = ?auto_433114 ?auto_433119 ) ) ( not ( = ?auto_433114 ?auto_433120 ) ) ( not ( = ?auto_433114 ?auto_433121 ) ) ( not ( = ?auto_433114 ?auto_433122 ) ) ( not ( = ?auto_433114 ?auto_433123 ) ) ( not ( = ?auto_433114 ?auto_433124 ) ) ( not ( = ?auto_433115 ?auto_433116 ) ) ( not ( = ?auto_433115 ?auto_433117 ) ) ( not ( = ?auto_433115 ?auto_433118 ) ) ( not ( = ?auto_433115 ?auto_433119 ) ) ( not ( = ?auto_433115 ?auto_433120 ) ) ( not ( = ?auto_433115 ?auto_433121 ) ) ( not ( = ?auto_433115 ?auto_433122 ) ) ( not ( = ?auto_433115 ?auto_433123 ) ) ( not ( = ?auto_433115 ?auto_433124 ) ) ( not ( = ?auto_433116 ?auto_433117 ) ) ( not ( = ?auto_433116 ?auto_433118 ) ) ( not ( = ?auto_433116 ?auto_433119 ) ) ( not ( = ?auto_433116 ?auto_433120 ) ) ( not ( = ?auto_433116 ?auto_433121 ) ) ( not ( = ?auto_433116 ?auto_433122 ) ) ( not ( = ?auto_433116 ?auto_433123 ) ) ( not ( = ?auto_433116 ?auto_433124 ) ) ( not ( = ?auto_433117 ?auto_433118 ) ) ( not ( = ?auto_433117 ?auto_433119 ) ) ( not ( = ?auto_433117 ?auto_433120 ) ) ( not ( = ?auto_433117 ?auto_433121 ) ) ( not ( = ?auto_433117 ?auto_433122 ) ) ( not ( = ?auto_433117 ?auto_433123 ) ) ( not ( = ?auto_433117 ?auto_433124 ) ) ( not ( = ?auto_433118 ?auto_433119 ) ) ( not ( = ?auto_433118 ?auto_433120 ) ) ( not ( = ?auto_433118 ?auto_433121 ) ) ( not ( = ?auto_433118 ?auto_433122 ) ) ( not ( = ?auto_433118 ?auto_433123 ) ) ( not ( = ?auto_433118 ?auto_433124 ) ) ( not ( = ?auto_433119 ?auto_433120 ) ) ( not ( = ?auto_433119 ?auto_433121 ) ) ( not ( = ?auto_433119 ?auto_433122 ) ) ( not ( = ?auto_433119 ?auto_433123 ) ) ( not ( = ?auto_433119 ?auto_433124 ) ) ( not ( = ?auto_433120 ?auto_433121 ) ) ( not ( = ?auto_433120 ?auto_433122 ) ) ( not ( = ?auto_433120 ?auto_433123 ) ) ( not ( = ?auto_433120 ?auto_433124 ) ) ( not ( = ?auto_433121 ?auto_433122 ) ) ( not ( = ?auto_433121 ?auto_433123 ) ) ( not ( = ?auto_433121 ?auto_433124 ) ) ( not ( = ?auto_433122 ?auto_433123 ) ) ( not ( = ?auto_433122 ?auto_433124 ) ) ( not ( = ?auto_433123 ?auto_433124 ) ) ( ON ?auto_433123 ?auto_433124 ) ( ON ?auto_433122 ?auto_433123 ) ( ON ?auto_433121 ?auto_433122 ) ( ON ?auto_433120 ?auto_433121 ) ( ON ?auto_433119 ?auto_433120 ) ( CLEAR ?auto_433117 ) ( ON ?auto_433118 ?auto_433119 ) ( CLEAR ?auto_433118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_433110 ?auto_433111 ?auto_433112 ?auto_433113 ?auto_433114 ?auto_433115 ?auto_433116 ?auto_433117 ?auto_433118 )
      ( MAKE-15PILE ?auto_433110 ?auto_433111 ?auto_433112 ?auto_433113 ?auto_433114 ?auto_433115 ?auto_433116 ?auto_433117 ?auto_433118 ?auto_433119 ?auto_433120 ?auto_433121 ?auto_433122 ?auto_433123 ?auto_433124 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433140 - BLOCK
      ?auto_433141 - BLOCK
      ?auto_433142 - BLOCK
      ?auto_433143 - BLOCK
      ?auto_433144 - BLOCK
      ?auto_433145 - BLOCK
      ?auto_433146 - BLOCK
      ?auto_433147 - BLOCK
      ?auto_433148 - BLOCK
      ?auto_433149 - BLOCK
      ?auto_433150 - BLOCK
      ?auto_433151 - BLOCK
      ?auto_433152 - BLOCK
      ?auto_433153 - BLOCK
      ?auto_433154 - BLOCK
    )
    :vars
    (
      ?auto_433155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433154 ?auto_433155 ) ( ON-TABLE ?auto_433140 ) ( ON ?auto_433141 ?auto_433140 ) ( ON ?auto_433142 ?auto_433141 ) ( ON ?auto_433143 ?auto_433142 ) ( ON ?auto_433144 ?auto_433143 ) ( ON ?auto_433145 ?auto_433144 ) ( ON ?auto_433146 ?auto_433145 ) ( not ( = ?auto_433140 ?auto_433141 ) ) ( not ( = ?auto_433140 ?auto_433142 ) ) ( not ( = ?auto_433140 ?auto_433143 ) ) ( not ( = ?auto_433140 ?auto_433144 ) ) ( not ( = ?auto_433140 ?auto_433145 ) ) ( not ( = ?auto_433140 ?auto_433146 ) ) ( not ( = ?auto_433140 ?auto_433147 ) ) ( not ( = ?auto_433140 ?auto_433148 ) ) ( not ( = ?auto_433140 ?auto_433149 ) ) ( not ( = ?auto_433140 ?auto_433150 ) ) ( not ( = ?auto_433140 ?auto_433151 ) ) ( not ( = ?auto_433140 ?auto_433152 ) ) ( not ( = ?auto_433140 ?auto_433153 ) ) ( not ( = ?auto_433140 ?auto_433154 ) ) ( not ( = ?auto_433140 ?auto_433155 ) ) ( not ( = ?auto_433141 ?auto_433142 ) ) ( not ( = ?auto_433141 ?auto_433143 ) ) ( not ( = ?auto_433141 ?auto_433144 ) ) ( not ( = ?auto_433141 ?auto_433145 ) ) ( not ( = ?auto_433141 ?auto_433146 ) ) ( not ( = ?auto_433141 ?auto_433147 ) ) ( not ( = ?auto_433141 ?auto_433148 ) ) ( not ( = ?auto_433141 ?auto_433149 ) ) ( not ( = ?auto_433141 ?auto_433150 ) ) ( not ( = ?auto_433141 ?auto_433151 ) ) ( not ( = ?auto_433141 ?auto_433152 ) ) ( not ( = ?auto_433141 ?auto_433153 ) ) ( not ( = ?auto_433141 ?auto_433154 ) ) ( not ( = ?auto_433141 ?auto_433155 ) ) ( not ( = ?auto_433142 ?auto_433143 ) ) ( not ( = ?auto_433142 ?auto_433144 ) ) ( not ( = ?auto_433142 ?auto_433145 ) ) ( not ( = ?auto_433142 ?auto_433146 ) ) ( not ( = ?auto_433142 ?auto_433147 ) ) ( not ( = ?auto_433142 ?auto_433148 ) ) ( not ( = ?auto_433142 ?auto_433149 ) ) ( not ( = ?auto_433142 ?auto_433150 ) ) ( not ( = ?auto_433142 ?auto_433151 ) ) ( not ( = ?auto_433142 ?auto_433152 ) ) ( not ( = ?auto_433142 ?auto_433153 ) ) ( not ( = ?auto_433142 ?auto_433154 ) ) ( not ( = ?auto_433142 ?auto_433155 ) ) ( not ( = ?auto_433143 ?auto_433144 ) ) ( not ( = ?auto_433143 ?auto_433145 ) ) ( not ( = ?auto_433143 ?auto_433146 ) ) ( not ( = ?auto_433143 ?auto_433147 ) ) ( not ( = ?auto_433143 ?auto_433148 ) ) ( not ( = ?auto_433143 ?auto_433149 ) ) ( not ( = ?auto_433143 ?auto_433150 ) ) ( not ( = ?auto_433143 ?auto_433151 ) ) ( not ( = ?auto_433143 ?auto_433152 ) ) ( not ( = ?auto_433143 ?auto_433153 ) ) ( not ( = ?auto_433143 ?auto_433154 ) ) ( not ( = ?auto_433143 ?auto_433155 ) ) ( not ( = ?auto_433144 ?auto_433145 ) ) ( not ( = ?auto_433144 ?auto_433146 ) ) ( not ( = ?auto_433144 ?auto_433147 ) ) ( not ( = ?auto_433144 ?auto_433148 ) ) ( not ( = ?auto_433144 ?auto_433149 ) ) ( not ( = ?auto_433144 ?auto_433150 ) ) ( not ( = ?auto_433144 ?auto_433151 ) ) ( not ( = ?auto_433144 ?auto_433152 ) ) ( not ( = ?auto_433144 ?auto_433153 ) ) ( not ( = ?auto_433144 ?auto_433154 ) ) ( not ( = ?auto_433144 ?auto_433155 ) ) ( not ( = ?auto_433145 ?auto_433146 ) ) ( not ( = ?auto_433145 ?auto_433147 ) ) ( not ( = ?auto_433145 ?auto_433148 ) ) ( not ( = ?auto_433145 ?auto_433149 ) ) ( not ( = ?auto_433145 ?auto_433150 ) ) ( not ( = ?auto_433145 ?auto_433151 ) ) ( not ( = ?auto_433145 ?auto_433152 ) ) ( not ( = ?auto_433145 ?auto_433153 ) ) ( not ( = ?auto_433145 ?auto_433154 ) ) ( not ( = ?auto_433145 ?auto_433155 ) ) ( not ( = ?auto_433146 ?auto_433147 ) ) ( not ( = ?auto_433146 ?auto_433148 ) ) ( not ( = ?auto_433146 ?auto_433149 ) ) ( not ( = ?auto_433146 ?auto_433150 ) ) ( not ( = ?auto_433146 ?auto_433151 ) ) ( not ( = ?auto_433146 ?auto_433152 ) ) ( not ( = ?auto_433146 ?auto_433153 ) ) ( not ( = ?auto_433146 ?auto_433154 ) ) ( not ( = ?auto_433146 ?auto_433155 ) ) ( not ( = ?auto_433147 ?auto_433148 ) ) ( not ( = ?auto_433147 ?auto_433149 ) ) ( not ( = ?auto_433147 ?auto_433150 ) ) ( not ( = ?auto_433147 ?auto_433151 ) ) ( not ( = ?auto_433147 ?auto_433152 ) ) ( not ( = ?auto_433147 ?auto_433153 ) ) ( not ( = ?auto_433147 ?auto_433154 ) ) ( not ( = ?auto_433147 ?auto_433155 ) ) ( not ( = ?auto_433148 ?auto_433149 ) ) ( not ( = ?auto_433148 ?auto_433150 ) ) ( not ( = ?auto_433148 ?auto_433151 ) ) ( not ( = ?auto_433148 ?auto_433152 ) ) ( not ( = ?auto_433148 ?auto_433153 ) ) ( not ( = ?auto_433148 ?auto_433154 ) ) ( not ( = ?auto_433148 ?auto_433155 ) ) ( not ( = ?auto_433149 ?auto_433150 ) ) ( not ( = ?auto_433149 ?auto_433151 ) ) ( not ( = ?auto_433149 ?auto_433152 ) ) ( not ( = ?auto_433149 ?auto_433153 ) ) ( not ( = ?auto_433149 ?auto_433154 ) ) ( not ( = ?auto_433149 ?auto_433155 ) ) ( not ( = ?auto_433150 ?auto_433151 ) ) ( not ( = ?auto_433150 ?auto_433152 ) ) ( not ( = ?auto_433150 ?auto_433153 ) ) ( not ( = ?auto_433150 ?auto_433154 ) ) ( not ( = ?auto_433150 ?auto_433155 ) ) ( not ( = ?auto_433151 ?auto_433152 ) ) ( not ( = ?auto_433151 ?auto_433153 ) ) ( not ( = ?auto_433151 ?auto_433154 ) ) ( not ( = ?auto_433151 ?auto_433155 ) ) ( not ( = ?auto_433152 ?auto_433153 ) ) ( not ( = ?auto_433152 ?auto_433154 ) ) ( not ( = ?auto_433152 ?auto_433155 ) ) ( not ( = ?auto_433153 ?auto_433154 ) ) ( not ( = ?auto_433153 ?auto_433155 ) ) ( not ( = ?auto_433154 ?auto_433155 ) ) ( ON ?auto_433153 ?auto_433154 ) ( ON ?auto_433152 ?auto_433153 ) ( ON ?auto_433151 ?auto_433152 ) ( ON ?auto_433150 ?auto_433151 ) ( ON ?auto_433149 ?auto_433150 ) ( ON ?auto_433148 ?auto_433149 ) ( CLEAR ?auto_433146 ) ( ON ?auto_433147 ?auto_433148 ) ( CLEAR ?auto_433147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_433140 ?auto_433141 ?auto_433142 ?auto_433143 ?auto_433144 ?auto_433145 ?auto_433146 ?auto_433147 )
      ( MAKE-15PILE ?auto_433140 ?auto_433141 ?auto_433142 ?auto_433143 ?auto_433144 ?auto_433145 ?auto_433146 ?auto_433147 ?auto_433148 ?auto_433149 ?auto_433150 ?auto_433151 ?auto_433152 ?auto_433153 ?auto_433154 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433171 - BLOCK
      ?auto_433172 - BLOCK
      ?auto_433173 - BLOCK
      ?auto_433174 - BLOCK
      ?auto_433175 - BLOCK
      ?auto_433176 - BLOCK
      ?auto_433177 - BLOCK
      ?auto_433178 - BLOCK
      ?auto_433179 - BLOCK
      ?auto_433180 - BLOCK
      ?auto_433181 - BLOCK
      ?auto_433182 - BLOCK
      ?auto_433183 - BLOCK
      ?auto_433184 - BLOCK
      ?auto_433185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433185 ) ( ON-TABLE ?auto_433171 ) ( ON ?auto_433172 ?auto_433171 ) ( ON ?auto_433173 ?auto_433172 ) ( ON ?auto_433174 ?auto_433173 ) ( ON ?auto_433175 ?auto_433174 ) ( ON ?auto_433176 ?auto_433175 ) ( ON ?auto_433177 ?auto_433176 ) ( not ( = ?auto_433171 ?auto_433172 ) ) ( not ( = ?auto_433171 ?auto_433173 ) ) ( not ( = ?auto_433171 ?auto_433174 ) ) ( not ( = ?auto_433171 ?auto_433175 ) ) ( not ( = ?auto_433171 ?auto_433176 ) ) ( not ( = ?auto_433171 ?auto_433177 ) ) ( not ( = ?auto_433171 ?auto_433178 ) ) ( not ( = ?auto_433171 ?auto_433179 ) ) ( not ( = ?auto_433171 ?auto_433180 ) ) ( not ( = ?auto_433171 ?auto_433181 ) ) ( not ( = ?auto_433171 ?auto_433182 ) ) ( not ( = ?auto_433171 ?auto_433183 ) ) ( not ( = ?auto_433171 ?auto_433184 ) ) ( not ( = ?auto_433171 ?auto_433185 ) ) ( not ( = ?auto_433172 ?auto_433173 ) ) ( not ( = ?auto_433172 ?auto_433174 ) ) ( not ( = ?auto_433172 ?auto_433175 ) ) ( not ( = ?auto_433172 ?auto_433176 ) ) ( not ( = ?auto_433172 ?auto_433177 ) ) ( not ( = ?auto_433172 ?auto_433178 ) ) ( not ( = ?auto_433172 ?auto_433179 ) ) ( not ( = ?auto_433172 ?auto_433180 ) ) ( not ( = ?auto_433172 ?auto_433181 ) ) ( not ( = ?auto_433172 ?auto_433182 ) ) ( not ( = ?auto_433172 ?auto_433183 ) ) ( not ( = ?auto_433172 ?auto_433184 ) ) ( not ( = ?auto_433172 ?auto_433185 ) ) ( not ( = ?auto_433173 ?auto_433174 ) ) ( not ( = ?auto_433173 ?auto_433175 ) ) ( not ( = ?auto_433173 ?auto_433176 ) ) ( not ( = ?auto_433173 ?auto_433177 ) ) ( not ( = ?auto_433173 ?auto_433178 ) ) ( not ( = ?auto_433173 ?auto_433179 ) ) ( not ( = ?auto_433173 ?auto_433180 ) ) ( not ( = ?auto_433173 ?auto_433181 ) ) ( not ( = ?auto_433173 ?auto_433182 ) ) ( not ( = ?auto_433173 ?auto_433183 ) ) ( not ( = ?auto_433173 ?auto_433184 ) ) ( not ( = ?auto_433173 ?auto_433185 ) ) ( not ( = ?auto_433174 ?auto_433175 ) ) ( not ( = ?auto_433174 ?auto_433176 ) ) ( not ( = ?auto_433174 ?auto_433177 ) ) ( not ( = ?auto_433174 ?auto_433178 ) ) ( not ( = ?auto_433174 ?auto_433179 ) ) ( not ( = ?auto_433174 ?auto_433180 ) ) ( not ( = ?auto_433174 ?auto_433181 ) ) ( not ( = ?auto_433174 ?auto_433182 ) ) ( not ( = ?auto_433174 ?auto_433183 ) ) ( not ( = ?auto_433174 ?auto_433184 ) ) ( not ( = ?auto_433174 ?auto_433185 ) ) ( not ( = ?auto_433175 ?auto_433176 ) ) ( not ( = ?auto_433175 ?auto_433177 ) ) ( not ( = ?auto_433175 ?auto_433178 ) ) ( not ( = ?auto_433175 ?auto_433179 ) ) ( not ( = ?auto_433175 ?auto_433180 ) ) ( not ( = ?auto_433175 ?auto_433181 ) ) ( not ( = ?auto_433175 ?auto_433182 ) ) ( not ( = ?auto_433175 ?auto_433183 ) ) ( not ( = ?auto_433175 ?auto_433184 ) ) ( not ( = ?auto_433175 ?auto_433185 ) ) ( not ( = ?auto_433176 ?auto_433177 ) ) ( not ( = ?auto_433176 ?auto_433178 ) ) ( not ( = ?auto_433176 ?auto_433179 ) ) ( not ( = ?auto_433176 ?auto_433180 ) ) ( not ( = ?auto_433176 ?auto_433181 ) ) ( not ( = ?auto_433176 ?auto_433182 ) ) ( not ( = ?auto_433176 ?auto_433183 ) ) ( not ( = ?auto_433176 ?auto_433184 ) ) ( not ( = ?auto_433176 ?auto_433185 ) ) ( not ( = ?auto_433177 ?auto_433178 ) ) ( not ( = ?auto_433177 ?auto_433179 ) ) ( not ( = ?auto_433177 ?auto_433180 ) ) ( not ( = ?auto_433177 ?auto_433181 ) ) ( not ( = ?auto_433177 ?auto_433182 ) ) ( not ( = ?auto_433177 ?auto_433183 ) ) ( not ( = ?auto_433177 ?auto_433184 ) ) ( not ( = ?auto_433177 ?auto_433185 ) ) ( not ( = ?auto_433178 ?auto_433179 ) ) ( not ( = ?auto_433178 ?auto_433180 ) ) ( not ( = ?auto_433178 ?auto_433181 ) ) ( not ( = ?auto_433178 ?auto_433182 ) ) ( not ( = ?auto_433178 ?auto_433183 ) ) ( not ( = ?auto_433178 ?auto_433184 ) ) ( not ( = ?auto_433178 ?auto_433185 ) ) ( not ( = ?auto_433179 ?auto_433180 ) ) ( not ( = ?auto_433179 ?auto_433181 ) ) ( not ( = ?auto_433179 ?auto_433182 ) ) ( not ( = ?auto_433179 ?auto_433183 ) ) ( not ( = ?auto_433179 ?auto_433184 ) ) ( not ( = ?auto_433179 ?auto_433185 ) ) ( not ( = ?auto_433180 ?auto_433181 ) ) ( not ( = ?auto_433180 ?auto_433182 ) ) ( not ( = ?auto_433180 ?auto_433183 ) ) ( not ( = ?auto_433180 ?auto_433184 ) ) ( not ( = ?auto_433180 ?auto_433185 ) ) ( not ( = ?auto_433181 ?auto_433182 ) ) ( not ( = ?auto_433181 ?auto_433183 ) ) ( not ( = ?auto_433181 ?auto_433184 ) ) ( not ( = ?auto_433181 ?auto_433185 ) ) ( not ( = ?auto_433182 ?auto_433183 ) ) ( not ( = ?auto_433182 ?auto_433184 ) ) ( not ( = ?auto_433182 ?auto_433185 ) ) ( not ( = ?auto_433183 ?auto_433184 ) ) ( not ( = ?auto_433183 ?auto_433185 ) ) ( not ( = ?auto_433184 ?auto_433185 ) ) ( ON ?auto_433184 ?auto_433185 ) ( ON ?auto_433183 ?auto_433184 ) ( ON ?auto_433182 ?auto_433183 ) ( ON ?auto_433181 ?auto_433182 ) ( ON ?auto_433180 ?auto_433181 ) ( ON ?auto_433179 ?auto_433180 ) ( CLEAR ?auto_433177 ) ( ON ?auto_433178 ?auto_433179 ) ( CLEAR ?auto_433178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_433171 ?auto_433172 ?auto_433173 ?auto_433174 ?auto_433175 ?auto_433176 ?auto_433177 ?auto_433178 )
      ( MAKE-15PILE ?auto_433171 ?auto_433172 ?auto_433173 ?auto_433174 ?auto_433175 ?auto_433176 ?auto_433177 ?auto_433178 ?auto_433179 ?auto_433180 ?auto_433181 ?auto_433182 ?auto_433183 ?auto_433184 ?auto_433185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433201 - BLOCK
      ?auto_433202 - BLOCK
      ?auto_433203 - BLOCK
      ?auto_433204 - BLOCK
      ?auto_433205 - BLOCK
      ?auto_433206 - BLOCK
      ?auto_433207 - BLOCK
      ?auto_433208 - BLOCK
      ?auto_433209 - BLOCK
      ?auto_433210 - BLOCK
      ?auto_433211 - BLOCK
      ?auto_433212 - BLOCK
      ?auto_433213 - BLOCK
      ?auto_433214 - BLOCK
      ?auto_433215 - BLOCK
    )
    :vars
    (
      ?auto_433216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433215 ?auto_433216 ) ( ON-TABLE ?auto_433201 ) ( ON ?auto_433202 ?auto_433201 ) ( ON ?auto_433203 ?auto_433202 ) ( ON ?auto_433204 ?auto_433203 ) ( ON ?auto_433205 ?auto_433204 ) ( ON ?auto_433206 ?auto_433205 ) ( not ( = ?auto_433201 ?auto_433202 ) ) ( not ( = ?auto_433201 ?auto_433203 ) ) ( not ( = ?auto_433201 ?auto_433204 ) ) ( not ( = ?auto_433201 ?auto_433205 ) ) ( not ( = ?auto_433201 ?auto_433206 ) ) ( not ( = ?auto_433201 ?auto_433207 ) ) ( not ( = ?auto_433201 ?auto_433208 ) ) ( not ( = ?auto_433201 ?auto_433209 ) ) ( not ( = ?auto_433201 ?auto_433210 ) ) ( not ( = ?auto_433201 ?auto_433211 ) ) ( not ( = ?auto_433201 ?auto_433212 ) ) ( not ( = ?auto_433201 ?auto_433213 ) ) ( not ( = ?auto_433201 ?auto_433214 ) ) ( not ( = ?auto_433201 ?auto_433215 ) ) ( not ( = ?auto_433201 ?auto_433216 ) ) ( not ( = ?auto_433202 ?auto_433203 ) ) ( not ( = ?auto_433202 ?auto_433204 ) ) ( not ( = ?auto_433202 ?auto_433205 ) ) ( not ( = ?auto_433202 ?auto_433206 ) ) ( not ( = ?auto_433202 ?auto_433207 ) ) ( not ( = ?auto_433202 ?auto_433208 ) ) ( not ( = ?auto_433202 ?auto_433209 ) ) ( not ( = ?auto_433202 ?auto_433210 ) ) ( not ( = ?auto_433202 ?auto_433211 ) ) ( not ( = ?auto_433202 ?auto_433212 ) ) ( not ( = ?auto_433202 ?auto_433213 ) ) ( not ( = ?auto_433202 ?auto_433214 ) ) ( not ( = ?auto_433202 ?auto_433215 ) ) ( not ( = ?auto_433202 ?auto_433216 ) ) ( not ( = ?auto_433203 ?auto_433204 ) ) ( not ( = ?auto_433203 ?auto_433205 ) ) ( not ( = ?auto_433203 ?auto_433206 ) ) ( not ( = ?auto_433203 ?auto_433207 ) ) ( not ( = ?auto_433203 ?auto_433208 ) ) ( not ( = ?auto_433203 ?auto_433209 ) ) ( not ( = ?auto_433203 ?auto_433210 ) ) ( not ( = ?auto_433203 ?auto_433211 ) ) ( not ( = ?auto_433203 ?auto_433212 ) ) ( not ( = ?auto_433203 ?auto_433213 ) ) ( not ( = ?auto_433203 ?auto_433214 ) ) ( not ( = ?auto_433203 ?auto_433215 ) ) ( not ( = ?auto_433203 ?auto_433216 ) ) ( not ( = ?auto_433204 ?auto_433205 ) ) ( not ( = ?auto_433204 ?auto_433206 ) ) ( not ( = ?auto_433204 ?auto_433207 ) ) ( not ( = ?auto_433204 ?auto_433208 ) ) ( not ( = ?auto_433204 ?auto_433209 ) ) ( not ( = ?auto_433204 ?auto_433210 ) ) ( not ( = ?auto_433204 ?auto_433211 ) ) ( not ( = ?auto_433204 ?auto_433212 ) ) ( not ( = ?auto_433204 ?auto_433213 ) ) ( not ( = ?auto_433204 ?auto_433214 ) ) ( not ( = ?auto_433204 ?auto_433215 ) ) ( not ( = ?auto_433204 ?auto_433216 ) ) ( not ( = ?auto_433205 ?auto_433206 ) ) ( not ( = ?auto_433205 ?auto_433207 ) ) ( not ( = ?auto_433205 ?auto_433208 ) ) ( not ( = ?auto_433205 ?auto_433209 ) ) ( not ( = ?auto_433205 ?auto_433210 ) ) ( not ( = ?auto_433205 ?auto_433211 ) ) ( not ( = ?auto_433205 ?auto_433212 ) ) ( not ( = ?auto_433205 ?auto_433213 ) ) ( not ( = ?auto_433205 ?auto_433214 ) ) ( not ( = ?auto_433205 ?auto_433215 ) ) ( not ( = ?auto_433205 ?auto_433216 ) ) ( not ( = ?auto_433206 ?auto_433207 ) ) ( not ( = ?auto_433206 ?auto_433208 ) ) ( not ( = ?auto_433206 ?auto_433209 ) ) ( not ( = ?auto_433206 ?auto_433210 ) ) ( not ( = ?auto_433206 ?auto_433211 ) ) ( not ( = ?auto_433206 ?auto_433212 ) ) ( not ( = ?auto_433206 ?auto_433213 ) ) ( not ( = ?auto_433206 ?auto_433214 ) ) ( not ( = ?auto_433206 ?auto_433215 ) ) ( not ( = ?auto_433206 ?auto_433216 ) ) ( not ( = ?auto_433207 ?auto_433208 ) ) ( not ( = ?auto_433207 ?auto_433209 ) ) ( not ( = ?auto_433207 ?auto_433210 ) ) ( not ( = ?auto_433207 ?auto_433211 ) ) ( not ( = ?auto_433207 ?auto_433212 ) ) ( not ( = ?auto_433207 ?auto_433213 ) ) ( not ( = ?auto_433207 ?auto_433214 ) ) ( not ( = ?auto_433207 ?auto_433215 ) ) ( not ( = ?auto_433207 ?auto_433216 ) ) ( not ( = ?auto_433208 ?auto_433209 ) ) ( not ( = ?auto_433208 ?auto_433210 ) ) ( not ( = ?auto_433208 ?auto_433211 ) ) ( not ( = ?auto_433208 ?auto_433212 ) ) ( not ( = ?auto_433208 ?auto_433213 ) ) ( not ( = ?auto_433208 ?auto_433214 ) ) ( not ( = ?auto_433208 ?auto_433215 ) ) ( not ( = ?auto_433208 ?auto_433216 ) ) ( not ( = ?auto_433209 ?auto_433210 ) ) ( not ( = ?auto_433209 ?auto_433211 ) ) ( not ( = ?auto_433209 ?auto_433212 ) ) ( not ( = ?auto_433209 ?auto_433213 ) ) ( not ( = ?auto_433209 ?auto_433214 ) ) ( not ( = ?auto_433209 ?auto_433215 ) ) ( not ( = ?auto_433209 ?auto_433216 ) ) ( not ( = ?auto_433210 ?auto_433211 ) ) ( not ( = ?auto_433210 ?auto_433212 ) ) ( not ( = ?auto_433210 ?auto_433213 ) ) ( not ( = ?auto_433210 ?auto_433214 ) ) ( not ( = ?auto_433210 ?auto_433215 ) ) ( not ( = ?auto_433210 ?auto_433216 ) ) ( not ( = ?auto_433211 ?auto_433212 ) ) ( not ( = ?auto_433211 ?auto_433213 ) ) ( not ( = ?auto_433211 ?auto_433214 ) ) ( not ( = ?auto_433211 ?auto_433215 ) ) ( not ( = ?auto_433211 ?auto_433216 ) ) ( not ( = ?auto_433212 ?auto_433213 ) ) ( not ( = ?auto_433212 ?auto_433214 ) ) ( not ( = ?auto_433212 ?auto_433215 ) ) ( not ( = ?auto_433212 ?auto_433216 ) ) ( not ( = ?auto_433213 ?auto_433214 ) ) ( not ( = ?auto_433213 ?auto_433215 ) ) ( not ( = ?auto_433213 ?auto_433216 ) ) ( not ( = ?auto_433214 ?auto_433215 ) ) ( not ( = ?auto_433214 ?auto_433216 ) ) ( not ( = ?auto_433215 ?auto_433216 ) ) ( ON ?auto_433214 ?auto_433215 ) ( ON ?auto_433213 ?auto_433214 ) ( ON ?auto_433212 ?auto_433213 ) ( ON ?auto_433211 ?auto_433212 ) ( ON ?auto_433210 ?auto_433211 ) ( ON ?auto_433209 ?auto_433210 ) ( ON ?auto_433208 ?auto_433209 ) ( CLEAR ?auto_433206 ) ( ON ?auto_433207 ?auto_433208 ) ( CLEAR ?auto_433207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_433201 ?auto_433202 ?auto_433203 ?auto_433204 ?auto_433205 ?auto_433206 ?auto_433207 )
      ( MAKE-15PILE ?auto_433201 ?auto_433202 ?auto_433203 ?auto_433204 ?auto_433205 ?auto_433206 ?auto_433207 ?auto_433208 ?auto_433209 ?auto_433210 ?auto_433211 ?auto_433212 ?auto_433213 ?auto_433214 ?auto_433215 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433232 - BLOCK
      ?auto_433233 - BLOCK
      ?auto_433234 - BLOCK
      ?auto_433235 - BLOCK
      ?auto_433236 - BLOCK
      ?auto_433237 - BLOCK
      ?auto_433238 - BLOCK
      ?auto_433239 - BLOCK
      ?auto_433240 - BLOCK
      ?auto_433241 - BLOCK
      ?auto_433242 - BLOCK
      ?auto_433243 - BLOCK
      ?auto_433244 - BLOCK
      ?auto_433245 - BLOCK
      ?auto_433246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433246 ) ( ON-TABLE ?auto_433232 ) ( ON ?auto_433233 ?auto_433232 ) ( ON ?auto_433234 ?auto_433233 ) ( ON ?auto_433235 ?auto_433234 ) ( ON ?auto_433236 ?auto_433235 ) ( ON ?auto_433237 ?auto_433236 ) ( not ( = ?auto_433232 ?auto_433233 ) ) ( not ( = ?auto_433232 ?auto_433234 ) ) ( not ( = ?auto_433232 ?auto_433235 ) ) ( not ( = ?auto_433232 ?auto_433236 ) ) ( not ( = ?auto_433232 ?auto_433237 ) ) ( not ( = ?auto_433232 ?auto_433238 ) ) ( not ( = ?auto_433232 ?auto_433239 ) ) ( not ( = ?auto_433232 ?auto_433240 ) ) ( not ( = ?auto_433232 ?auto_433241 ) ) ( not ( = ?auto_433232 ?auto_433242 ) ) ( not ( = ?auto_433232 ?auto_433243 ) ) ( not ( = ?auto_433232 ?auto_433244 ) ) ( not ( = ?auto_433232 ?auto_433245 ) ) ( not ( = ?auto_433232 ?auto_433246 ) ) ( not ( = ?auto_433233 ?auto_433234 ) ) ( not ( = ?auto_433233 ?auto_433235 ) ) ( not ( = ?auto_433233 ?auto_433236 ) ) ( not ( = ?auto_433233 ?auto_433237 ) ) ( not ( = ?auto_433233 ?auto_433238 ) ) ( not ( = ?auto_433233 ?auto_433239 ) ) ( not ( = ?auto_433233 ?auto_433240 ) ) ( not ( = ?auto_433233 ?auto_433241 ) ) ( not ( = ?auto_433233 ?auto_433242 ) ) ( not ( = ?auto_433233 ?auto_433243 ) ) ( not ( = ?auto_433233 ?auto_433244 ) ) ( not ( = ?auto_433233 ?auto_433245 ) ) ( not ( = ?auto_433233 ?auto_433246 ) ) ( not ( = ?auto_433234 ?auto_433235 ) ) ( not ( = ?auto_433234 ?auto_433236 ) ) ( not ( = ?auto_433234 ?auto_433237 ) ) ( not ( = ?auto_433234 ?auto_433238 ) ) ( not ( = ?auto_433234 ?auto_433239 ) ) ( not ( = ?auto_433234 ?auto_433240 ) ) ( not ( = ?auto_433234 ?auto_433241 ) ) ( not ( = ?auto_433234 ?auto_433242 ) ) ( not ( = ?auto_433234 ?auto_433243 ) ) ( not ( = ?auto_433234 ?auto_433244 ) ) ( not ( = ?auto_433234 ?auto_433245 ) ) ( not ( = ?auto_433234 ?auto_433246 ) ) ( not ( = ?auto_433235 ?auto_433236 ) ) ( not ( = ?auto_433235 ?auto_433237 ) ) ( not ( = ?auto_433235 ?auto_433238 ) ) ( not ( = ?auto_433235 ?auto_433239 ) ) ( not ( = ?auto_433235 ?auto_433240 ) ) ( not ( = ?auto_433235 ?auto_433241 ) ) ( not ( = ?auto_433235 ?auto_433242 ) ) ( not ( = ?auto_433235 ?auto_433243 ) ) ( not ( = ?auto_433235 ?auto_433244 ) ) ( not ( = ?auto_433235 ?auto_433245 ) ) ( not ( = ?auto_433235 ?auto_433246 ) ) ( not ( = ?auto_433236 ?auto_433237 ) ) ( not ( = ?auto_433236 ?auto_433238 ) ) ( not ( = ?auto_433236 ?auto_433239 ) ) ( not ( = ?auto_433236 ?auto_433240 ) ) ( not ( = ?auto_433236 ?auto_433241 ) ) ( not ( = ?auto_433236 ?auto_433242 ) ) ( not ( = ?auto_433236 ?auto_433243 ) ) ( not ( = ?auto_433236 ?auto_433244 ) ) ( not ( = ?auto_433236 ?auto_433245 ) ) ( not ( = ?auto_433236 ?auto_433246 ) ) ( not ( = ?auto_433237 ?auto_433238 ) ) ( not ( = ?auto_433237 ?auto_433239 ) ) ( not ( = ?auto_433237 ?auto_433240 ) ) ( not ( = ?auto_433237 ?auto_433241 ) ) ( not ( = ?auto_433237 ?auto_433242 ) ) ( not ( = ?auto_433237 ?auto_433243 ) ) ( not ( = ?auto_433237 ?auto_433244 ) ) ( not ( = ?auto_433237 ?auto_433245 ) ) ( not ( = ?auto_433237 ?auto_433246 ) ) ( not ( = ?auto_433238 ?auto_433239 ) ) ( not ( = ?auto_433238 ?auto_433240 ) ) ( not ( = ?auto_433238 ?auto_433241 ) ) ( not ( = ?auto_433238 ?auto_433242 ) ) ( not ( = ?auto_433238 ?auto_433243 ) ) ( not ( = ?auto_433238 ?auto_433244 ) ) ( not ( = ?auto_433238 ?auto_433245 ) ) ( not ( = ?auto_433238 ?auto_433246 ) ) ( not ( = ?auto_433239 ?auto_433240 ) ) ( not ( = ?auto_433239 ?auto_433241 ) ) ( not ( = ?auto_433239 ?auto_433242 ) ) ( not ( = ?auto_433239 ?auto_433243 ) ) ( not ( = ?auto_433239 ?auto_433244 ) ) ( not ( = ?auto_433239 ?auto_433245 ) ) ( not ( = ?auto_433239 ?auto_433246 ) ) ( not ( = ?auto_433240 ?auto_433241 ) ) ( not ( = ?auto_433240 ?auto_433242 ) ) ( not ( = ?auto_433240 ?auto_433243 ) ) ( not ( = ?auto_433240 ?auto_433244 ) ) ( not ( = ?auto_433240 ?auto_433245 ) ) ( not ( = ?auto_433240 ?auto_433246 ) ) ( not ( = ?auto_433241 ?auto_433242 ) ) ( not ( = ?auto_433241 ?auto_433243 ) ) ( not ( = ?auto_433241 ?auto_433244 ) ) ( not ( = ?auto_433241 ?auto_433245 ) ) ( not ( = ?auto_433241 ?auto_433246 ) ) ( not ( = ?auto_433242 ?auto_433243 ) ) ( not ( = ?auto_433242 ?auto_433244 ) ) ( not ( = ?auto_433242 ?auto_433245 ) ) ( not ( = ?auto_433242 ?auto_433246 ) ) ( not ( = ?auto_433243 ?auto_433244 ) ) ( not ( = ?auto_433243 ?auto_433245 ) ) ( not ( = ?auto_433243 ?auto_433246 ) ) ( not ( = ?auto_433244 ?auto_433245 ) ) ( not ( = ?auto_433244 ?auto_433246 ) ) ( not ( = ?auto_433245 ?auto_433246 ) ) ( ON ?auto_433245 ?auto_433246 ) ( ON ?auto_433244 ?auto_433245 ) ( ON ?auto_433243 ?auto_433244 ) ( ON ?auto_433242 ?auto_433243 ) ( ON ?auto_433241 ?auto_433242 ) ( ON ?auto_433240 ?auto_433241 ) ( ON ?auto_433239 ?auto_433240 ) ( CLEAR ?auto_433237 ) ( ON ?auto_433238 ?auto_433239 ) ( CLEAR ?auto_433238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_433232 ?auto_433233 ?auto_433234 ?auto_433235 ?auto_433236 ?auto_433237 ?auto_433238 )
      ( MAKE-15PILE ?auto_433232 ?auto_433233 ?auto_433234 ?auto_433235 ?auto_433236 ?auto_433237 ?auto_433238 ?auto_433239 ?auto_433240 ?auto_433241 ?auto_433242 ?auto_433243 ?auto_433244 ?auto_433245 ?auto_433246 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433262 - BLOCK
      ?auto_433263 - BLOCK
      ?auto_433264 - BLOCK
      ?auto_433265 - BLOCK
      ?auto_433266 - BLOCK
      ?auto_433267 - BLOCK
      ?auto_433268 - BLOCK
      ?auto_433269 - BLOCK
      ?auto_433270 - BLOCK
      ?auto_433271 - BLOCK
      ?auto_433272 - BLOCK
      ?auto_433273 - BLOCK
      ?auto_433274 - BLOCK
      ?auto_433275 - BLOCK
      ?auto_433276 - BLOCK
    )
    :vars
    (
      ?auto_433277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433276 ?auto_433277 ) ( ON-TABLE ?auto_433262 ) ( ON ?auto_433263 ?auto_433262 ) ( ON ?auto_433264 ?auto_433263 ) ( ON ?auto_433265 ?auto_433264 ) ( ON ?auto_433266 ?auto_433265 ) ( not ( = ?auto_433262 ?auto_433263 ) ) ( not ( = ?auto_433262 ?auto_433264 ) ) ( not ( = ?auto_433262 ?auto_433265 ) ) ( not ( = ?auto_433262 ?auto_433266 ) ) ( not ( = ?auto_433262 ?auto_433267 ) ) ( not ( = ?auto_433262 ?auto_433268 ) ) ( not ( = ?auto_433262 ?auto_433269 ) ) ( not ( = ?auto_433262 ?auto_433270 ) ) ( not ( = ?auto_433262 ?auto_433271 ) ) ( not ( = ?auto_433262 ?auto_433272 ) ) ( not ( = ?auto_433262 ?auto_433273 ) ) ( not ( = ?auto_433262 ?auto_433274 ) ) ( not ( = ?auto_433262 ?auto_433275 ) ) ( not ( = ?auto_433262 ?auto_433276 ) ) ( not ( = ?auto_433262 ?auto_433277 ) ) ( not ( = ?auto_433263 ?auto_433264 ) ) ( not ( = ?auto_433263 ?auto_433265 ) ) ( not ( = ?auto_433263 ?auto_433266 ) ) ( not ( = ?auto_433263 ?auto_433267 ) ) ( not ( = ?auto_433263 ?auto_433268 ) ) ( not ( = ?auto_433263 ?auto_433269 ) ) ( not ( = ?auto_433263 ?auto_433270 ) ) ( not ( = ?auto_433263 ?auto_433271 ) ) ( not ( = ?auto_433263 ?auto_433272 ) ) ( not ( = ?auto_433263 ?auto_433273 ) ) ( not ( = ?auto_433263 ?auto_433274 ) ) ( not ( = ?auto_433263 ?auto_433275 ) ) ( not ( = ?auto_433263 ?auto_433276 ) ) ( not ( = ?auto_433263 ?auto_433277 ) ) ( not ( = ?auto_433264 ?auto_433265 ) ) ( not ( = ?auto_433264 ?auto_433266 ) ) ( not ( = ?auto_433264 ?auto_433267 ) ) ( not ( = ?auto_433264 ?auto_433268 ) ) ( not ( = ?auto_433264 ?auto_433269 ) ) ( not ( = ?auto_433264 ?auto_433270 ) ) ( not ( = ?auto_433264 ?auto_433271 ) ) ( not ( = ?auto_433264 ?auto_433272 ) ) ( not ( = ?auto_433264 ?auto_433273 ) ) ( not ( = ?auto_433264 ?auto_433274 ) ) ( not ( = ?auto_433264 ?auto_433275 ) ) ( not ( = ?auto_433264 ?auto_433276 ) ) ( not ( = ?auto_433264 ?auto_433277 ) ) ( not ( = ?auto_433265 ?auto_433266 ) ) ( not ( = ?auto_433265 ?auto_433267 ) ) ( not ( = ?auto_433265 ?auto_433268 ) ) ( not ( = ?auto_433265 ?auto_433269 ) ) ( not ( = ?auto_433265 ?auto_433270 ) ) ( not ( = ?auto_433265 ?auto_433271 ) ) ( not ( = ?auto_433265 ?auto_433272 ) ) ( not ( = ?auto_433265 ?auto_433273 ) ) ( not ( = ?auto_433265 ?auto_433274 ) ) ( not ( = ?auto_433265 ?auto_433275 ) ) ( not ( = ?auto_433265 ?auto_433276 ) ) ( not ( = ?auto_433265 ?auto_433277 ) ) ( not ( = ?auto_433266 ?auto_433267 ) ) ( not ( = ?auto_433266 ?auto_433268 ) ) ( not ( = ?auto_433266 ?auto_433269 ) ) ( not ( = ?auto_433266 ?auto_433270 ) ) ( not ( = ?auto_433266 ?auto_433271 ) ) ( not ( = ?auto_433266 ?auto_433272 ) ) ( not ( = ?auto_433266 ?auto_433273 ) ) ( not ( = ?auto_433266 ?auto_433274 ) ) ( not ( = ?auto_433266 ?auto_433275 ) ) ( not ( = ?auto_433266 ?auto_433276 ) ) ( not ( = ?auto_433266 ?auto_433277 ) ) ( not ( = ?auto_433267 ?auto_433268 ) ) ( not ( = ?auto_433267 ?auto_433269 ) ) ( not ( = ?auto_433267 ?auto_433270 ) ) ( not ( = ?auto_433267 ?auto_433271 ) ) ( not ( = ?auto_433267 ?auto_433272 ) ) ( not ( = ?auto_433267 ?auto_433273 ) ) ( not ( = ?auto_433267 ?auto_433274 ) ) ( not ( = ?auto_433267 ?auto_433275 ) ) ( not ( = ?auto_433267 ?auto_433276 ) ) ( not ( = ?auto_433267 ?auto_433277 ) ) ( not ( = ?auto_433268 ?auto_433269 ) ) ( not ( = ?auto_433268 ?auto_433270 ) ) ( not ( = ?auto_433268 ?auto_433271 ) ) ( not ( = ?auto_433268 ?auto_433272 ) ) ( not ( = ?auto_433268 ?auto_433273 ) ) ( not ( = ?auto_433268 ?auto_433274 ) ) ( not ( = ?auto_433268 ?auto_433275 ) ) ( not ( = ?auto_433268 ?auto_433276 ) ) ( not ( = ?auto_433268 ?auto_433277 ) ) ( not ( = ?auto_433269 ?auto_433270 ) ) ( not ( = ?auto_433269 ?auto_433271 ) ) ( not ( = ?auto_433269 ?auto_433272 ) ) ( not ( = ?auto_433269 ?auto_433273 ) ) ( not ( = ?auto_433269 ?auto_433274 ) ) ( not ( = ?auto_433269 ?auto_433275 ) ) ( not ( = ?auto_433269 ?auto_433276 ) ) ( not ( = ?auto_433269 ?auto_433277 ) ) ( not ( = ?auto_433270 ?auto_433271 ) ) ( not ( = ?auto_433270 ?auto_433272 ) ) ( not ( = ?auto_433270 ?auto_433273 ) ) ( not ( = ?auto_433270 ?auto_433274 ) ) ( not ( = ?auto_433270 ?auto_433275 ) ) ( not ( = ?auto_433270 ?auto_433276 ) ) ( not ( = ?auto_433270 ?auto_433277 ) ) ( not ( = ?auto_433271 ?auto_433272 ) ) ( not ( = ?auto_433271 ?auto_433273 ) ) ( not ( = ?auto_433271 ?auto_433274 ) ) ( not ( = ?auto_433271 ?auto_433275 ) ) ( not ( = ?auto_433271 ?auto_433276 ) ) ( not ( = ?auto_433271 ?auto_433277 ) ) ( not ( = ?auto_433272 ?auto_433273 ) ) ( not ( = ?auto_433272 ?auto_433274 ) ) ( not ( = ?auto_433272 ?auto_433275 ) ) ( not ( = ?auto_433272 ?auto_433276 ) ) ( not ( = ?auto_433272 ?auto_433277 ) ) ( not ( = ?auto_433273 ?auto_433274 ) ) ( not ( = ?auto_433273 ?auto_433275 ) ) ( not ( = ?auto_433273 ?auto_433276 ) ) ( not ( = ?auto_433273 ?auto_433277 ) ) ( not ( = ?auto_433274 ?auto_433275 ) ) ( not ( = ?auto_433274 ?auto_433276 ) ) ( not ( = ?auto_433274 ?auto_433277 ) ) ( not ( = ?auto_433275 ?auto_433276 ) ) ( not ( = ?auto_433275 ?auto_433277 ) ) ( not ( = ?auto_433276 ?auto_433277 ) ) ( ON ?auto_433275 ?auto_433276 ) ( ON ?auto_433274 ?auto_433275 ) ( ON ?auto_433273 ?auto_433274 ) ( ON ?auto_433272 ?auto_433273 ) ( ON ?auto_433271 ?auto_433272 ) ( ON ?auto_433270 ?auto_433271 ) ( ON ?auto_433269 ?auto_433270 ) ( ON ?auto_433268 ?auto_433269 ) ( CLEAR ?auto_433266 ) ( ON ?auto_433267 ?auto_433268 ) ( CLEAR ?auto_433267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_433262 ?auto_433263 ?auto_433264 ?auto_433265 ?auto_433266 ?auto_433267 )
      ( MAKE-15PILE ?auto_433262 ?auto_433263 ?auto_433264 ?auto_433265 ?auto_433266 ?auto_433267 ?auto_433268 ?auto_433269 ?auto_433270 ?auto_433271 ?auto_433272 ?auto_433273 ?auto_433274 ?auto_433275 ?auto_433276 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433293 - BLOCK
      ?auto_433294 - BLOCK
      ?auto_433295 - BLOCK
      ?auto_433296 - BLOCK
      ?auto_433297 - BLOCK
      ?auto_433298 - BLOCK
      ?auto_433299 - BLOCK
      ?auto_433300 - BLOCK
      ?auto_433301 - BLOCK
      ?auto_433302 - BLOCK
      ?auto_433303 - BLOCK
      ?auto_433304 - BLOCK
      ?auto_433305 - BLOCK
      ?auto_433306 - BLOCK
      ?auto_433307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433307 ) ( ON-TABLE ?auto_433293 ) ( ON ?auto_433294 ?auto_433293 ) ( ON ?auto_433295 ?auto_433294 ) ( ON ?auto_433296 ?auto_433295 ) ( ON ?auto_433297 ?auto_433296 ) ( not ( = ?auto_433293 ?auto_433294 ) ) ( not ( = ?auto_433293 ?auto_433295 ) ) ( not ( = ?auto_433293 ?auto_433296 ) ) ( not ( = ?auto_433293 ?auto_433297 ) ) ( not ( = ?auto_433293 ?auto_433298 ) ) ( not ( = ?auto_433293 ?auto_433299 ) ) ( not ( = ?auto_433293 ?auto_433300 ) ) ( not ( = ?auto_433293 ?auto_433301 ) ) ( not ( = ?auto_433293 ?auto_433302 ) ) ( not ( = ?auto_433293 ?auto_433303 ) ) ( not ( = ?auto_433293 ?auto_433304 ) ) ( not ( = ?auto_433293 ?auto_433305 ) ) ( not ( = ?auto_433293 ?auto_433306 ) ) ( not ( = ?auto_433293 ?auto_433307 ) ) ( not ( = ?auto_433294 ?auto_433295 ) ) ( not ( = ?auto_433294 ?auto_433296 ) ) ( not ( = ?auto_433294 ?auto_433297 ) ) ( not ( = ?auto_433294 ?auto_433298 ) ) ( not ( = ?auto_433294 ?auto_433299 ) ) ( not ( = ?auto_433294 ?auto_433300 ) ) ( not ( = ?auto_433294 ?auto_433301 ) ) ( not ( = ?auto_433294 ?auto_433302 ) ) ( not ( = ?auto_433294 ?auto_433303 ) ) ( not ( = ?auto_433294 ?auto_433304 ) ) ( not ( = ?auto_433294 ?auto_433305 ) ) ( not ( = ?auto_433294 ?auto_433306 ) ) ( not ( = ?auto_433294 ?auto_433307 ) ) ( not ( = ?auto_433295 ?auto_433296 ) ) ( not ( = ?auto_433295 ?auto_433297 ) ) ( not ( = ?auto_433295 ?auto_433298 ) ) ( not ( = ?auto_433295 ?auto_433299 ) ) ( not ( = ?auto_433295 ?auto_433300 ) ) ( not ( = ?auto_433295 ?auto_433301 ) ) ( not ( = ?auto_433295 ?auto_433302 ) ) ( not ( = ?auto_433295 ?auto_433303 ) ) ( not ( = ?auto_433295 ?auto_433304 ) ) ( not ( = ?auto_433295 ?auto_433305 ) ) ( not ( = ?auto_433295 ?auto_433306 ) ) ( not ( = ?auto_433295 ?auto_433307 ) ) ( not ( = ?auto_433296 ?auto_433297 ) ) ( not ( = ?auto_433296 ?auto_433298 ) ) ( not ( = ?auto_433296 ?auto_433299 ) ) ( not ( = ?auto_433296 ?auto_433300 ) ) ( not ( = ?auto_433296 ?auto_433301 ) ) ( not ( = ?auto_433296 ?auto_433302 ) ) ( not ( = ?auto_433296 ?auto_433303 ) ) ( not ( = ?auto_433296 ?auto_433304 ) ) ( not ( = ?auto_433296 ?auto_433305 ) ) ( not ( = ?auto_433296 ?auto_433306 ) ) ( not ( = ?auto_433296 ?auto_433307 ) ) ( not ( = ?auto_433297 ?auto_433298 ) ) ( not ( = ?auto_433297 ?auto_433299 ) ) ( not ( = ?auto_433297 ?auto_433300 ) ) ( not ( = ?auto_433297 ?auto_433301 ) ) ( not ( = ?auto_433297 ?auto_433302 ) ) ( not ( = ?auto_433297 ?auto_433303 ) ) ( not ( = ?auto_433297 ?auto_433304 ) ) ( not ( = ?auto_433297 ?auto_433305 ) ) ( not ( = ?auto_433297 ?auto_433306 ) ) ( not ( = ?auto_433297 ?auto_433307 ) ) ( not ( = ?auto_433298 ?auto_433299 ) ) ( not ( = ?auto_433298 ?auto_433300 ) ) ( not ( = ?auto_433298 ?auto_433301 ) ) ( not ( = ?auto_433298 ?auto_433302 ) ) ( not ( = ?auto_433298 ?auto_433303 ) ) ( not ( = ?auto_433298 ?auto_433304 ) ) ( not ( = ?auto_433298 ?auto_433305 ) ) ( not ( = ?auto_433298 ?auto_433306 ) ) ( not ( = ?auto_433298 ?auto_433307 ) ) ( not ( = ?auto_433299 ?auto_433300 ) ) ( not ( = ?auto_433299 ?auto_433301 ) ) ( not ( = ?auto_433299 ?auto_433302 ) ) ( not ( = ?auto_433299 ?auto_433303 ) ) ( not ( = ?auto_433299 ?auto_433304 ) ) ( not ( = ?auto_433299 ?auto_433305 ) ) ( not ( = ?auto_433299 ?auto_433306 ) ) ( not ( = ?auto_433299 ?auto_433307 ) ) ( not ( = ?auto_433300 ?auto_433301 ) ) ( not ( = ?auto_433300 ?auto_433302 ) ) ( not ( = ?auto_433300 ?auto_433303 ) ) ( not ( = ?auto_433300 ?auto_433304 ) ) ( not ( = ?auto_433300 ?auto_433305 ) ) ( not ( = ?auto_433300 ?auto_433306 ) ) ( not ( = ?auto_433300 ?auto_433307 ) ) ( not ( = ?auto_433301 ?auto_433302 ) ) ( not ( = ?auto_433301 ?auto_433303 ) ) ( not ( = ?auto_433301 ?auto_433304 ) ) ( not ( = ?auto_433301 ?auto_433305 ) ) ( not ( = ?auto_433301 ?auto_433306 ) ) ( not ( = ?auto_433301 ?auto_433307 ) ) ( not ( = ?auto_433302 ?auto_433303 ) ) ( not ( = ?auto_433302 ?auto_433304 ) ) ( not ( = ?auto_433302 ?auto_433305 ) ) ( not ( = ?auto_433302 ?auto_433306 ) ) ( not ( = ?auto_433302 ?auto_433307 ) ) ( not ( = ?auto_433303 ?auto_433304 ) ) ( not ( = ?auto_433303 ?auto_433305 ) ) ( not ( = ?auto_433303 ?auto_433306 ) ) ( not ( = ?auto_433303 ?auto_433307 ) ) ( not ( = ?auto_433304 ?auto_433305 ) ) ( not ( = ?auto_433304 ?auto_433306 ) ) ( not ( = ?auto_433304 ?auto_433307 ) ) ( not ( = ?auto_433305 ?auto_433306 ) ) ( not ( = ?auto_433305 ?auto_433307 ) ) ( not ( = ?auto_433306 ?auto_433307 ) ) ( ON ?auto_433306 ?auto_433307 ) ( ON ?auto_433305 ?auto_433306 ) ( ON ?auto_433304 ?auto_433305 ) ( ON ?auto_433303 ?auto_433304 ) ( ON ?auto_433302 ?auto_433303 ) ( ON ?auto_433301 ?auto_433302 ) ( ON ?auto_433300 ?auto_433301 ) ( ON ?auto_433299 ?auto_433300 ) ( CLEAR ?auto_433297 ) ( ON ?auto_433298 ?auto_433299 ) ( CLEAR ?auto_433298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_433293 ?auto_433294 ?auto_433295 ?auto_433296 ?auto_433297 ?auto_433298 )
      ( MAKE-15PILE ?auto_433293 ?auto_433294 ?auto_433295 ?auto_433296 ?auto_433297 ?auto_433298 ?auto_433299 ?auto_433300 ?auto_433301 ?auto_433302 ?auto_433303 ?auto_433304 ?auto_433305 ?auto_433306 ?auto_433307 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433323 - BLOCK
      ?auto_433324 - BLOCK
      ?auto_433325 - BLOCK
      ?auto_433326 - BLOCK
      ?auto_433327 - BLOCK
      ?auto_433328 - BLOCK
      ?auto_433329 - BLOCK
      ?auto_433330 - BLOCK
      ?auto_433331 - BLOCK
      ?auto_433332 - BLOCK
      ?auto_433333 - BLOCK
      ?auto_433334 - BLOCK
      ?auto_433335 - BLOCK
      ?auto_433336 - BLOCK
      ?auto_433337 - BLOCK
    )
    :vars
    (
      ?auto_433338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433337 ?auto_433338 ) ( ON-TABLE ?auto_433323 ) ( ON ?auto_433324 ?auto_433323 ) ( ON ?auto_433325 ?auto_433324 ) ( ON ?auto_433326 ?auto_433325 ) ( not ( = ?auto_433323 ?auto_433324 ) ) ( not ( = ?auto_433323 ?auto_433325 ) ) ( not ( = ?auto_433323 ?auto_433326 ) ) ( not ( = ?auto_433323 ?auto_433327 ) ) ( not ( = ?auto_433323 ?auto_433328 ) ) ( not ( = ?auto_433323 ?auto_433329 ) ) ( not ( = ?auto_433323 ?auto_433330 ) ) ( not ( = ?auto_433323 ?auto_433331 ) ) ( not ( = ?auto_433323 ?auto_433332 ) ) ( not ( = ?auto_433323 ?auto_433333 ) ) ( not ( = ?auto_433323 ?auto_433334 ) ) ( not ( = ?auto_433323 ?auto_433335 ) ) ( not ( = ?auto_433323 ?auto_433336 ) ) ( not ( = ?auto_433323 ?auto_433337 ) ) ( not ( = ?auto_433323 ?auto_433338 ) ) ( not ( = ?auto_433324 ?auto_433325 ) ) ( not ( = ?auto_433324 ?auto_433326 ) ) ( not ( = ?auto_433324 ?auto_433327 ) ) ( not ( = ?auto_433324 ?auto_433328 ) ) ( not ( = ?auto_433324 ?auto_433329 ) ) ( not ( = ?auto_433324 ?auto_433330 ) ) ( not ( = ?auto_433324 ?auto_433331 ) ) ( not ( = ?auto_433324 ?auto_433332 ) ) ( not ( = ?auto_433324 ?auto_433333 ) ) ( not ( = ?auto_433324 ?auto_433334 ) ) ( not ( = ?auto_433324 ?auto_433335 ) ) ( not ( = ?auto_433324 ?auto_433336 ) ) ( not ( = ?auto_433324 ?auto_433337 ) ) ( not ( = ?auto_433324 ?auto_433338 ) ) ( not ( = ?auto_433325 ?auto_433326 ) ) ( not ( = ?auto_433325 ?auto_433327 ) ) ( not ( = ?auto_433325 ?auto_433328 ) ) ( not ( = ?auto_433325 ?auto_433329 ) ) ( not ( = ?auto_433325 ?auto_433330 ) ) ( not ( = ?auto_433325 ?auto_433331 ) ) ( not ( = ?auto_433325 ?auto_433332 ) ) ( not ( = ?auto_433325 ?auto_433333 ) ) ( not ( = ?auto_433325 ?auto_433334 ) ) ( not ( = ?auto_433325 ?auto_433335 ) ) ( not ( = ?auto_433325 ?auto_433336 ) ) ( not ( = ?auto_433325 ?auto_433337 ) ) ( not ( = ?auto_433325 ?auto_433338 ) ) ( not ( = ?auto_433326 ?auto_433327 ) ) ( not ( = ?auto_433326 ?auto_433328 ) ) ( not ( = ?auto_433326 ?auto_433329 ) ) ( not ( = ?auto_433326 ?auto_433330 ) ) ( not ( = ?auto_433326 ?auto_433331 ) ) ( not ( = ?auto_433326 ?auto_433332 ) ) ( not ( = ?auto_433326 ?auto_433333 ) ) ( not ( = ?auto_433326 ?auto_433334 ) ) ( not ( = ?auto_433326 ?auto_433335 ) ) ( not ( = ?auto_433326 ?auto_433336 ) ) ( not ( = ?auto_433326 ?auto_433337 ) ) ( not ( = ?auto_433326 ?auto_433338 ) ) ( not ( = ?auto_433327 ?auto_433328 ) ) ( not ( = ?auto_433327 ?auto_433329 ) ) ( not ( = ?auto_433327 ?auto_433330 ) ) ( not ( = ?auto_433327 ?auto_433331 ) ) ( not ( = ?auto_433327 ?auto_433332 ) ) ( not ( = ?auto_433327 ?auto_433333 ) ) ( not ( = ?auto_433327 ?auto_433334 ) ) ( not ( = ?auto_433327 ?auto_433335 ) ) ( not ( = ?auto_433327 ?auto_433336 ) ) ( not ( = ?auto_433327 ?auto_433337 ) ) ( not ( = ?auto_433327 ?auto_433338 ) ) ( not ( = ?auto_433328 ?auto_433329 ) ) ( not ( = ?auto_433328 ?auto_433330 ) ) ( not ( = ?auto_433328 ?auto_433331 ) ) ( not ( = ?auto_433328 ?auto_433332 ) ) ( not ( = ?auto_433328 ?auto_433333 ) ) ( not ( = ?auto_433328 ?auto_433334 ) ) ( not ( = ?auto_433328 ?auto_433335 ) ) ( not ( = ?auto_433328 ?auto_433336 ) ) ( not ( = ?auto_433328 ?auto_433337 ) ) ( not ( = ?auto_433328 ?auto_433338 ) ) ( not ( = ?auto_433329 ?auto_433330 ) ) ( not ( = ?auto_433329 ?auto_433331 ) ) ( not ( = ?auto_433329 ?auto_433332 ) ) ( not ( = ?auto_433329 ?auto_433333 ) ) ( not ( = ?auto_433329 ?auto_433334 ) ) ( not ( = ?auto_433329 ?auto_433335 ) ) ( not ( = ?auto_433329 ?auto_433336 ) ) ( not ( = ?auto_433329 ?auto_433337 ) ) ( not ( = ?auto_433329 ?auto_433338 ) ) ( not ( = ?auto_433330 ?auto_433331 ) ) ( not ( = ?auto_433330 ?auto_433332 ) ) ( not ( = ?auto_433330 ?auto_433333 ) ) ( not ( = ?auto_433330 ?auto_433334 ) ) ( not ( = ?auto_433330 ?auto_433335 ) ) ( not ( = ?auto_433330 ?auto_433336 ) ) ( not ( = ?auto_433330 ?auto_433337 ) ) ( not ( = ?auto_433330 ?auto_433338 ) ) ( not ( = ?auto_433331 ?auto_433332 ) ) ( not ( = ?auto_433331 ?auto_433333 ) ) ( not ( = ?auto_433331 ?auto_433334 ) ) ( not ( = ?auto_433331 ?auto_433335 ) ) ( not ( = ?auto_433331 ?auto_433336 ) ) ( not ( = ?auto_433331 ?auto_433337 ) ) ( not ( = ?auto_433331 ?auto_433338 ) ) ( not ( = ?auto_433332 ?auto_433333 ) ) ( not ( = ?auto_433332 ?auto_433334 ) ) ( not ( = ?auto_433332 ?auto_433335 ) ) ( not ( = ?auto_433332 ?auto_433336 ) ) ( not ( = ?auto_433332 ?auto_433337 ) ) ( not ( = ?auto_433332 ?auto_433338 ) ) ( not ( = ?auto_433333 ?auto_433334 ) ) ( not ( = ?auto_433333 ?auto_433335 ) ) ( not ( = ?auto_433333 ?auto_433336 ) ) ( not ( = ?auto_433333 ?auto_433337 ) ) ( not ( = ?auto_433333 ?auto_433338 ) ) ( not ( = ?auto_433334 ?auto_433335 ) ) ( not ( = ?auto_433334 ?auto_433336 ) ) ( not ( = ?auto_433334 ?auto_433337 ) ) ( not ( = ?auto_433334 ?auto_433338 ) ) ( not ( = ?auto_433335 ?auto_433336 ) ) ( not ( = ?auto_433335 ?auto_433337 ) ) ( not ( = ?auto_433335 ?auto_433338 ) ) ( not ( = ?auto_433336 ?auto_433337 ) ) ( not ( = ?auto_433336 ?auto_433338 ) ) ( not ( = ?auto_433337 ?auto_433338 ) ) ( ON ?auto_433336 ?auto_433337 ) ( ON ?auto_433335 ?auto_433336 ) ( ON ?auto_433334 ?auto_433335 ) ( ON ?auto_433333 ?auto_433334 ) ( ON ?auto_433332 ?auto_433333 ) ( ON ?auto_433331 ?auto_433332 ) ( ON ?auto_433330 ?auto_433331 ) ( ON ?auto_433329 ?auto_433330 ) ( ON ?auto_433328 ?auto_433329 ) ( CLEAR ?auto_433326 ) ( ON ?auto_433327 ?auto_433328 ) ( CLEAR ?auto_433327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433323 ?auto_433324 ?auto_433325 ?auto_433326 ?auto_433327 )
      ( MAKE-15PILE ?auto_433323 ?auto_433324 ?auto_433325 ?auto_433326 ?auto_433327 ?auto_433328 ?auto_433329 ?auto_433330 ?auto_433331 ?auto_433332 ?auto_433333 ?auto_433334 ?auto_433335 ?auto_433336 ?auto_433337 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433354 - BLOCK
      ?auto_433355 - BLOCK
      ?auto_433356 - BLOCK
      ?auto_433357 - BLOCK
      ?auto_433358 - BLOCK
      ?auto_433359 - BLOCK
      ?auto_433360 - BLOCK
      ?auto_433361 - BLOCK
      ?auto_433362 - BLOCK
      ?auto_433363 - BLOCK
      ?auto_433364 - BLOCK
      ?auto_433365 - BLOCK
      ?auto_433366 - BLOCK
      ?auto_433367 - BLOCK
      ?auto_433368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433368 ) ( ON-TABLE ?auto_433354 ) ( ON ?auto_433355 ?auto_433354 ) ( ON ?auto_433356 ?auto_433355 ) ( ON ?auto_433357 ?auto_433356 ) ( not ( = ?auto_433354 ?auto_433355 ) ) ( not ( = ?auto_433354 ?auto_433356 ) ) ( not ( = ?auto_433354 ?auto_433357 ) ) ( not ( = ?auto_433354 ?auto_433358 ) ) ( not ( = ?auto_433354 ?auto_433359 ) ) ( not ( = ?auto_433354 ?auto_433360 ) ) ( not ( = ?auto_433354 ?auto_433361 ) ) ( not ( = ?auto_433354 ?auto_433362 ) ) ( not ( = ?auto_433354 ?auto_433363 ) ) ( not ( = ?auto_433354 ?auto_433364 ) ) ( not ( = ?auto_433354 ?auto_433365 ) ) ( not ( = ?auto_433354 ?auto_433366 ) ) ( not ( = ?auto_433354 ?auto_433367 ) ) ( not ( = ?auto_433354 ?auto_433368 ) ) ( not ( = ?auto_433355 ?auto_433356 ) ) ( not ( = ?auto_433355 ?auto_433357 ) ) ( not ( = ?auto_433355 ?auto_433358 ) ) ( not ( = ?auto_433355 ?auto_433359 ) ) ( not ( = ?auto_433355 ?auto_433360 ) ) ( not ( = ?auto_433355 ?auto_433361 ) ) ( not ( = ?auto_433355 ?auto_433362 ) ) ( not ( = ?auto_433355 ?auto_433363 ) ) ( not ( = ?auto_433355 ?auto_433364 ) ) ( not ( = ?auto_433355 ?auto_433365 ) ) ( not ( = ?auto_433355 ?auto_433366 ) ) ( not ( = ?auto_433355 ?auto_433367 ) ) ( not ( = ?auto_433355 ?auto_433368 ) ) ( not ( = ?auto_433356 ?auto_433357 ) ) ( not ( = ?auto_433356 ?auto_433358 ) ) ( not ( = ?auto_433356 ?auto_433359 ) ) ( not ( = ?auto_433356 ?auto_433360 ) ) ( not ( = ?auto_433356 ?auto_433361 ) ) ( not ( = ?auto_433356 ?auto_433362 ) ) ( not ( = ?auto_433356 ?auto_433363 ) ) ( not ( = ?auto_433356 ?auto_433364 ) ) ( not ( = ?auto_433356 ?auto_433365 ) ) ( not ( = ?auto_433356 ?auto_433366 ) ) ( not ( = ?auto_433356 ?auto_433367 ) ) ( not ( = ?auto_433356 ?auto_433368 ) ) ( not ( = ?auto_433357 ?auto_433358 ) ) ( not ( = ?auto_433357 ?auto_433359 ) ) ( not ( = ?auto_433357 ?auto_433360 ) ) ( not ( = ?auto_433357 ?auto_433361 ) ) ( not ( = ?auto_433357 ?auto_433362 ) ) ( not ( = ?auto_433357 ?auto_433363 ) ) ( not ( = ?auto_433357 ?auto_433364 ) ) ( not ( = ?auto_433357 ?auto_433365 ) ) ( not ( = ?auto_433357 ?auto_433366 ) ) ( not ( = ?auto_433357 ?auto_433367 ) ) ( not ( = ?auto_433357 ?auto_433368 ) ) ( not ( = ?auto_433358 ?auto_433359 ) ) ( not ( = ?auto_433358 ?auto_433360 ) ) ( not ( = ?auto_433358 ?auto_433361 ) ) ( not ( = ?auto_433358 ?auto_433362 ) ) ( not ( = ?auto_433358 ?auto_433363 ) ) ( not ( = ?auto_433358 ?auto_433364 ) ) ( not ( = ?auto_433358 ?auto_433365 ) ) ( not ( = ?auto_433358 ?auto_433366 ) ) ( not ( = ?auto_433358 ?auto_433367 ) ) ( not ( = ?auto_433358 ?auto_433368 ) ) ( not ( = ?auto_433359 ?auto_433360 ) ) ( not ( = ?auto_433359 ?auto_433361 ) ) ( not ( = ?auto_433359 ?auto_433362 ) ) ( not ( = ?auto_433359 ?auto_433363 ) ) ( not ( = ?auto_433359 ?auto_433364 ) ) ( not ( = ?auto_433359 ?auto_433365 ) ) ( not ( = ?auto_433359 ?auto_433366 ) ) ( not ( = ?auto_433359 ?auto_433367 ) ) ( not ( = ?auto_433359 ?auto_433368 ) ) ( not ( = ?auto_433360 ?auto_433361 ) ) ( not ( = ?auto_433360 ?auto_433362 ) ) ( not ( = ?auto_433360 ?auto_433363 ) ) ( not ( = ?auto_433360 ?auto_433364 ) ) ( not ( = ?auto_433360 ?auto_433365 ) ) ( not ( = ?auto_433360 ?auto_433366 ) ) ( not ( = ?auto_433360 ?auto_433367 ) ) ( not ( = ?auto_433360 ?auto_433368 ) ) ( not ( = ?auto_433361 ?auto_433362 ) ) ( not ( = ?auto_433361 ?auto_433363 ) ) ( not ( = ?auto_433361 ?auto_433364 ) ) ( not ( = ?auto_433361 ?auto_433365 ) ) ( not ( = ?auto_433361 ?auto_433366 ) ) ( not ( = ?auto_433361 ?auto_433367 ) ) ( not ( = ?auto_433361 ?auto_433368 ) ) ( not ( = ?auto_433362 ?auto_433363 ) ) ( not ( = ?auto_433362 ?auto_433364 ) ) ( not ( = ?auto_433362 ?auto_433365 ) ) ( not ( = ?auto_433362 ?auto_433366 ) ) ( not ( = ?auto_433362 ?auto_433367 ) ) ( not ( = ?auto_433362 ?auto_433368 ) ) ( not ( = ?auto_433363 ?auto_433364 ) ) ( not ( = ?auto_433363 ?auto_433365 ) ) ( not ( = ?auto_433363 ?auto_433366 ) ) ( not ( = ?auto_433363 ?auto_433367 ) ) ( not ( = ?auto_433363 ?auto_433368 ) ) ( not ( = ?auto_433364 ?auto_433365 ) ) ( not ( = ?auto_433364 ?auto_433366 ) ) ( not ( = ?auto_433364 ?auto_433367 ) ) ( not ( = ?auto_433364 ?auto_433368 ) ) ( not ( = ?auto_433365 ?auto_433366 ) ) ( not ( = ?auto_433365 ?auto_433367 ) ) ( not ( = ?auto_433365 ?auto_433368 ) ) ( not ( = ?auto_433366 ?auto_433367 ) ) ( not ( = ?auto_433366 ?auto_433368 ) ) ( not ( = ?auto_433367 ?auto_433368 ) ) ( ON ?auto_433367 ?auto_433368 ) ( ON ?auto_433366 ?auto_433367 ) ( ON ?auto_433365 ?auto_433366 ) ( ON ?auto_433364 ?auto_433365 ) ( ON ?auto_433363 ?auto_433364 ) ( ON ?auto_433362 ?auto_433363 ) ( ON ?auto_433361 ?auto_433362 ) ( ON ?auto_433360 ?auto_433361 ) ( ON ?auto_433359 ?auto_433360 ) ( CLEAR ?auto_433357 ) ( ON ?auto_433358 ?auto_433359 ) ( CLEAR ?auto_433358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433354 ?auto_433355 ?auto_433356 ?auto_433357 ?auto_433358 )
      ( MAKE-15PILE ?auto_433354 ?auto_433355 ?auto_433356 ?auto_433357 ?auto_433358 ?auto_433359 ?auto_433360 ?auto_433361 ?auto_433362 ?auto_433363 ?auto_433364 ?auto_433365 ?auto_433366 ?auto_433367 ?auto_433368 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433384 - BLOCK
      ?auto_433385 - BLOCK
      ?auto_433386 - BLOCK
      ?auto_433387 - BLOCK
      ?auto_433388 - BLOCK
      ?auto_433389 - BLOCK
      ?auto_433390 - BLOCK
      ?auto_433391 - BLOCK
      ?auto_433392 - BLOCK
      ?auto_433393 - BLOCK
      ?auto_433394 - BLOCK
      ?auto_433395 - BLOCK
      ?auto_433396 - BLOCK
      ?auto_433397 - BLOCK
      ?auto_433398 - BLOCK
    )
    :vars
    (
      ?auto_433399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433398 ?auto_433399 ) ( ON-TABLE ?auto_433384 ) ( ON ?auto_433385 ?auto_433384 ) ( ON ?auto_433386 ?auto_433385 ) ( not ( = ?auto_433384 ?auto_433385 ) ) ( not ( = ?auto_433384 ?auto_433386 ) ) ( not ( = ?auto_433384 ?auto_433387 ) ) ( not ( = ?auto_433384 ?auto_433388 ) ) ( not ( = ?auto_433384 ?auto_433389 ) ) ( not ( = ?auto_433384 ?auto_433390 ) ) ( not ( = ?auto_433384 ?auto_433391 ) ) ( not ( = ?auto_433384 ?auto_433392 ) ) ( not ( = ?auto_433384 ?auto_433393 ) ) ( not ( = ?auto_433384 ?auto_433394 ) ) ( not ( = ?auto_433384 ?auto_433395 ) ) ( not ( = ?auto_433384 ?auto_433396 ) ) ( not ( = ?auto_433384 ?auto_433397 ) ) ( not ( = ?auto_433384 ?auto_433398 ) ) ( not ( = ?auto_433384 ?auto_433399 ) ) ( not ( = ?auto_433385 ?auto_433386 ) ) ( not ( = ?auto_433385 ?auto_433387 ) ) ( not ( = ?auto_433385 ?auto_433388 ) ) ( not ( = ?auto_433385 ?auto_433389 ) ) ( not ( = ?auto_433385 ?auto_433390 ) ) ( not ( = ?auto_433385 ?auto_433391 ) ) ( not ( = ?auto_433385 ?auto_433392 ) ) ( not ( = ?auto_433385 ?auto_433393 ) ) ( not ( = ?auto_433385 ?auto_433394 ) ) ( not ( = ?auto_433385 ?auto_433395 ) ) ( not ( = ?auto_433385 ?auto_433396 ) ) ( not ( = ?auto_433385 ?auto_433397 ) ) ( not ( = ?auto_433385 ?auto_433398 ) ) ( not ( = ?auto_433385 ?auto_433399 ) ) ( not ( = ?auto_433386 ?auto_433387 ) ) ( not ( = ?auto_433386 ?auto_433388 ) ) ( not ( = ?auto_433386 ?auto_433389 ) ) ( not ( = ?auto_433386 ?auto_433390 ) ) ( not ( = ?auto_433386 ?auto_433391 ) ) ( not ( = ?auto_433386 ?auto_433392 ) ) ( not ( = ?auto_433386 ?auto_433393 ) ) ( not ( = ?auto_433386 ?auto_433394 ) ) ( not ( = ?auto_433386 ?auto_433395 ) ) ( not ( = ?auto_433386 ?auto_433396 ) ) ( not ( = ?auto_433386 ?auto_433397 ) ) ( not ( = ?auto_433386 ?auto_433398 ) ) ( not ( = ?auto_433386 ?auto_433399 ) ) ( not ( = ?auto_433387 ?auto_433388 ) ) ( not ( = ?auto_433387 ?auto_433389 ) ) ( not ( = ?auto_433387 ?auto_433390 ) ) ( not ( = ?auto_433387 ?auto_433391 ) ) ( not ( = ?auto_433387 ?auto_433392 ) ) ( not ( = ?auto_433387 ?auto_433393 ) ) ( not ( = ?auto_433387 ?auto_433394 ) ) ( not ( = ?auto_433387 ?auto_433395 ) ) ( not ( = ?auto_433387 ?auto_433396 ) ) ( not ( = ?auto_433387 ?auto_433397 ) ) ( not ( = ?auto_433387 ?auto_433398 ) ) ( not ( = ?auto_433387 ?auto_433399 ) ) ( not ( = ?auto_433388 ?auto_433389 ) ) ( not ( = ?auto_433388 ?auto_433390 ) ) ( not ( = ?auto_433388 ?auto_433391 ) ) ( not ( = ?auto_433388 ?auto_433392 ) ) ( not ( = ?auto_433388 ?auto_433393 ) ) ( not ( = ?auto_433388 ?auto_433394 ) ) ( not ( = ?auto_433388 ?auto_433395 ) ) ( not ( = ?auto_433388 ?auto_433396 ) ) ( not ( = ?auto_433388 ?auto_433397 ) ) ( not ( = ?auto_433388 ?auto_433398 ) ) ( not ( = ?auto_433388 ?auto_433399 ) ) ( not ( = ?auto_433389 ?auto_433390 ) ) ( not ( = ?auto_433389 ?auto_433391 ) ) ( not ( = ?auto_433389 ?auto_433392 ) ) ( not ( = ?auto_433389 ?auto_433393 ) ) ( not ( = ?auto_433389 ?auto_433394 ) ) ( not ( = ?auto_433389 ?auto_433395 ) ) ( not ( = ?auto_433389 ?auto_433396 ) ) ( not ( = ?auto_433389 ?auto_433397 ) ) ( not ( = ?auto_433389 ?auto_433398 ) ) ( not ( = ?auto_433389 ?auto_433399 ) ) ( not ( = ?auto_433390 ?auto_433391 ) ) ( not ( = ?auto_433390 ?auto_433392 ) ) ( not ( = ?auto_433390 ?auto_433393 ) ) ( not ( = ?auto_433390 ?auto_433394 ) ) ( not ( = ?auto_433390 ?auto_433395 ) ) ( not ( = ?auto_433390 ?auto_433396 ) ) ( not ( = ?auto_433390 ?auto_433397 ) ) ( not ( = ?auto_433390 ?auto_433398 ) ) ( not ( = ?auto_433390 ?auto_433399 ) ) ( not ( = ?auto_433391 ?auto_433392 ) ) ( not ( = ?auto_433391 ?auto_433393 ) ) ( not ( = ?auto_433391 ?auto_433394 ) ) ( not ( = ?auto_433391 ?auto_433395 ) ) ( not ( = ?auto_433391 ?auto_433396 ) ) ( not ( = ?auto_433391 ?auto_433397 ) ) ( not ( = ?auto_433391 ?auto_433398 ) ) ( not ( = ?auto_433391 ?auto_433399 ) ) ( not ( = ?auto_433392 ?auto_433393 ) ) ( not ( = ?auto_433392 ?auto_433394 ) ) ( not ( = ?auto_433392 ?auto_433395 ) ) ( not ( = ?auto_433392 ?auto_433396 ) ) ( not ( = ?auto_433392 ?auto_433397 ) ) ( not ( = ?auto_433392 ?auto_433398 ) ) ( not ( = ?auto_433392 ?auto_433399 ) ) ( not ( = ?auto_433393 ?auto_433394 ) ) ( not ( = ?auto_433393 ?auto_433395 ) ) ( not ( = ?auto_433393 ?auto_433396 ) ) ( not ( = ?auto_433393 ?auto_433397 ) ) ( not ( = ?auto_433393 ?auto_433398 ) ) ( not ( = ?auto_433393 ?auto_433399 ) ) ( not ( = ?auto_433394 ?auto_433395 ) ) ( not ( = ?auto_433394 ?auto_433396 ) ) ( not ( = ?auto_433394 ?auto_433397 ) ) ( not ( = ?auto_433394 ?auto_433398 ) ) ( not ( = ?auto_433394 ?auto_433399 ) ) ( not ( = ?auto_433395 ?auto_433396 ) ) ( not ( = ?auto_433395 ?auto_433397 ) ) ( not ( = ?auto_433395 ?auto_433398 ) ) ( not ( = ?auto_433395 ?auto_433399 ) ) ( not ( = ?auto_433396 ?auto_433397 ) ) ( not ( = ?auto_433396 ?auto_433398 ) ) ( not ( = ?auto_433396 ?auto_433399 ) ) ( not ( = ?auto_433397 ?auto_433398 ) ) ( not ( = ?auto_433397 ?auto_433399 ) ) ( not ( = ?auto_433398 ?auto_433399 ) ) ( ON ?auto_433397 ?auto_433398 ) ( ON ?auto_433396 ?auto_433397 ) ( ON ?auto_433395 ?auto_433396 ) ( ON ?auto_433394 ?auto_433395 ) ( ON ?auto_433393 ?auto_433394 ) ( ON ?auto_433392 ?auto_433393 ) ( ON ?auto_433391 ?auto_433392 ) ( ON ?auto_433390 ?auto_433391 ) ( ON ?auto_433389 ?auto_433390 ) ( ON ?auto_433388 ?auto_433389 ) ( CLEAR ?auto_433386 ) ( ON ?auto_433387 ?auto_433388 ) ( CLEAR ?auto_433387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433384 ?auto_433385 ?auto_433386 ?auto_433387 )
      ( MAKE-15PILE ?auto_433384 ?auto_433385 ?auto_433386 ?auto_433387 ?auto_433388 ?auto_433389 ?auto_433390 ?auto_433391 ?auto_433392 ?auto_433393 ?auto_433394 ?auto_433395 ?auto_433396 ?auto_433397 ?auto_433398 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433415 - BLOCK
      ?auto_433416 - BLOCK
      ?auto_433417 - BLOCK
      ?auto_433418 - BLOCK
      ?auto_433419 - BLOCK
      ?auto_433420 - BLOCK
      ?auto_433421 - BLOCK
      ?auto_433422 - BLOCK
      ?auto_433423 - BLOCK
      ?auto_433424 - BLOCK
      ?auto_433425 - BLOCK
      ?auto_433426 - BLOCK
      ?auto_433427 - BLOCK
      ?auto_433428 - BLOCK
      ?auto_433429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433429 ) ( ON-TABLE ?auto_433415 ) ( ON ?auto_433416 ?auto_433415 ) ( ON ?auto_433417 ?auto_433416 ) ( not ( = ?auto_433415 ?auto_433416 ) ) ( not ( = ?auto_433415 ?auto_433417 ) ) ( not ( = ?auto_433415 ?auto_433418 ) ) ( not ( = ?auto_433415 ?auto_433419 ) ) ( not ( = ?auto_433415 ?auto_433420 ) ) ( not ( = ?auto_433415 ?auto_433421 ) ) ( not ( = ?auto_433415 ?auto_433422 ) ) ( not ( = ?auto_433415 ?auto_433423 ) ) ( not ( = ?auto_433415 ?auto_433424 ) ) ( not ( = ?auto_433415 ?auto_433425 ) ) ( not ( = ?auto_433415 ?auto_433426 ) ) ( not ( = ?auto_433415 ?auto_433427 ) ) ( not ( = ?auto_433415 ?auto_433428 ) ) ( not ( = ?auto_433415 ?auto_433429 ) ) ( not ( = ?auto_433416 ?auto_433417 ) ) ( not ( = ?auto_433416 ?auto_433418 ) ) ( not ( = ?auto_433416 ?auto_433419 ) ) ( not ( = ?auto_433416 ?auto_433420 ) ) ( not ( = ?auto_433416 ?auto_433421 ) ) ( not ( = ?auto_433416 ?auto_433422 ) ) ( not ( = ?auto_433416 ?auto_433423 ) ) ( not ( = ?auto_433416 ?auto_433424 ) ) ( not ( = ?auto_433416 ?auto_433425 ) ) ( not ( = ?auto_433416 ?auto_433426 ) ) ( not ( = ?auto_433416 ?auto_433427 ) ) ( not ( = ?auto_433416 ?auto_433428 ) ) ( not ( = ?auto_433416 ?auto_433429 ) ) ( not ( = ?auto_433417 ?auto_433418 ) ) ( not ( = ?auto_433417 ?auto_433419 ) ) ( not ( = ?auto_433417 ?auto_433420 ) ) ( not ( = ?auto_433417 ?auto_433421 ) ) ( not ( = ?auto_433417 ?auto_433422 ) ) ( not ( = ?auto_433417 ?auto_433423 ) ) ( not ( = ?auto_433417 ?auto_433424 ) ) ( not ( = ?auto_433417 ?auto_433425 ) ) ( not ( = ?auto_433417 ?auto_433426 ) ) ( not ( = ?auto_433417 ?auto_433427 ) ) ( not ( = ?auto_433417 ?auto_433428 ) ) ( not ( = ?auto_433417 ?auto_433429 ) ) ( not ( = ?auto_433418 ?auto_433419 ) ) ( not ( = ?auto_433418 ?auto_433420 ) ) ( not ( = ?auto_433418 ?auto_433421 ) ) ( not ( = ?auto_433418 ?auto_433422 ) ) ( not ( = ?auto_433418 ?auto_433423 ) ) ( not ( = ?auto_433418 ?auto_433424 ) ) ( not ( = ?auto_433418 ?auto_433425 ) ) ( not ( = ?auto_433418 ?auto_433426 ) ) ( not ( = ?auto_433418 ?auto_433427 ) ) ( not ( = ?auto_433418 ?auto_433428 ) ) ( not ( = ?auto_433418 ?auto_433429 ) ) ( not ( = ?auto_433419 ?auto_433420 ) ) ( not ( = ?auto_433419 ?auto_433421 ) ) ( not ( = ?auto_433419 ?auto_433422 ) ) ( not ( = ?auto_433419 ?auto_433423 ) ) ( not ( = ?auto_433419 ?auto_433424 ) ) ( not ( = ?auto_433419 ?auto_433425 ) ) ( not ( = ?auto_433419 ?auto_433426 ) ) ( not ( = ?auto_433419 ?auto_433427 ) ) ( not ( = ?auto_433419 ?auto_433428 ) ) ( not ( = ?auto_433419 ?auto_433429 ) ) ( not ( = ?auto_433420 ?auto_433421 ) ) ( not ( = ?auto_433420 ?auto_433422 ) ) ( not ( = ?auto_433420 ?auto_433423 ) ) ( not ( = ?auto_433420 ?auto_433424 ) ) ( not ( = ?auto_433420 ?auto_433425 ) ) ( not ( = ?auto_433420 ?auto_433426 ) ) ( not ( = ?auto_433420 ?auto_433427 ) ) ( not ( = ?auto_433420 ?auto_433428 ) ) ( not ( = ?auto_433420 ?auto_433429 ) ) ( not ( = ?auto_433421 ?auto_433422 ) ) ( not ( = ?auto_433421 ?auto_433423 ) ) ( not ( = ?auto_433421 ?auto_433424 ) ) ( not ( = ?auto_433421 ?auto_433425 ) ) ( not ( = ?auto_433421 ?auto_433426 ) ) ( not ( = ?auto_433421 ?auto_433427 ) ) ( not ( = ?auto_433421 ?auto_433428 ) ) ( not ( = ?auto_433421 ?auto_433429 ) ) ( not ( = ?auto_433422 ?auto_433423 ) ) ( not ( = ?auto_433422 ?auto_433424 ) ) ( not ( = ?auto_433422 ?auto_433425 ) ) ( not ( = ?auto_433422 ?auto_433426 ) ) ( not ( = ?auto_433422 ?auto_433427 ) ) ( not ( = ?auto_433422 ?auto_433428 ) ) ( not ( = ?auto_433422 ?auto_433429 ) ) ( not ( = ?auto_433423 ?auto_433424 ) ) ( not ( = ?auto_433423 ?auto_433425 ) ) ( not ( = ?auto_433423 ?auto_433426 ) ) ( not ( = ?auto_433423 ?auto_433427 ) ) ( not ( = ?auto_433423 ?auto_433428 ) ) ( not ( = ?auto_433423 ?auto_433429 ) ) ( not ( = ?auto_433424 ?auto_433425 ) ) ( not ( = ?auto_433424 ?auto_433426 ) ) ( not ( = ?auto_433424 ?auto_433427 ) ) ( not ( = ?auto_433424 ?auto_433428 ) ) ( not ( = ?auto_433424 ?auto_433429 ) ) ( not ( = ?auto_433425 ?auto_433426 ) ) ( not ( = ?auto_433425 ?auto_433427 ) ) ( not ( = ?auto_433425 ?auto_433428 ) ) ( not ( = ?auto_433425 ?auto_433429 ) ) ( not ( = ?auto_433426 ?auto_433427 ) ) ( not ( = ?auto_433426 ?auto_433428 ) ) ( not ( = ?auto_433426 ?auto_433429 ) ) ( not ( = ?auto_433427 ?auto_433428 ) ) ( not ( = ?auto_433427 ?auto_433429 ) ) ( not ( = ?auto_433428 ?auto_433429 ) ) ( ON ?auto_433428 ?auto_433429 ) ( ON ?auto_433427 ?auto_433428 ) ( ON ?auto_433426 ?auto_433427 ) ( ON ?auto_433425 ?auto_433426 ) ( ON ?auto_433424 ?auto_433425 ) ( ON ?auto_433423 ?auto_433424 ) ( ON ?auto_433422 ?auto_433423 ) ( ON ?auto_433421 ?auto_433422 ) ( ON ?auto_433420 ?auto_433421 ) ( ON ?auto_433419 ?auto_433420 ) ( CLEAR ?auto_433417 ) ( ON ?auto_433418 ?auto_433419 ) ( CLEAR ?auto_433418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433415 ?auto_433416 ?auto_433417 ?auto_433418 )
      ( MAKE-15PILE ?auto_433415 ?auto_433416 ?auto_433417 ?auto_433418 ?auto_433419 ?auto_433420 ?auto_433421 ?auto_433422 ?auto_433423 ?auto_433424 ?auto_433425 ?auto_433426 ?auto_433427 ?auto_433428 ?auto_433429 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433445 - BLOCK
      ?auto_433446 - BLOCK
      ?auto_433447 - BLOCK
      ?auto_433448 - BLOCK
      ?auto_433449 - BLOCK
      ?auto_433450 - BLOCK
      ?auto_433451 - BLOCK
      ?auto_433452 - BLOCK
      ?auto_433453 - BLOCK
      ?auto_433454 - BLOCK
      ?auto_433455 - BLOCK
      ?auto_433456 - BLOCK
      ?auto_433457 - BLOCK
      ?auto_433458 - BLOCK
      ?auto_433459 - BLOCK
    )
    :vars
    (
      ?auto_433460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433459 ?auto_433460 ) ( ON-TABLE ?auto_433445 ) ( ON ?auto_433446 ?auto_433445 ) ( not ( = ?auto_433445 ?auto_433446 ) ) ( not ( = ?auto_433445 ?auto_433447 ) ) ( not ( = ?auto_433445 ?auto_433448 ) ) ( not ( = ?auto_433445 ?auto_433449 ) ) ( not ( = ?auto_433445 ?auto_433450 ) ) ( not ( = ?auto_433445 ?auto_433451 ) ) ( not ( = ?auto_433445 ?auto_433452 ) ) ( not ( = ?auto_433445 ?auto_433453 ) ) ( not ( = ?auto_433445 ?auto_433454 ) ) ( not ( = ?auto_433445 ?auto_433455 ) ) ( not ( = ?auto_433445 ?auto_433456 ) ) ( not ( = ?auto_433445 ?auto_433457 ) ) ( not ( = ?auto_433445 ?auto_433458 ) ) ( not ( = ?auto_433445 ?auto_433459 ) ) ( not ( = ?auto_433445 ?auto_433460 ) ) ( not ( = ?auto_433446 ?auto_433447 ) ) ( not ( = ?auto_433446 ?auto_433448 ) ) ( not ( = ?auto_433446 ?auto_433449 ) ) ( not ( = ?auto_433446 ?auto_433450 ) ) ( not ( = ?auto_433446 ?auto_433451 ) ) ( not ( = ?auto_433446 ?auto_433452 ) ) ( not ( = ?auto_433446 ?auto_433453 ) ) ( not ( = ?auto_433446 ?auto_433454 ) ) ( not ( = ?auto_433446 ?auto_433455 ) ) ( not ( = ?auto_433446 ?auto_433456 ) ) ( not ( = ?auto_433446 ?auto_433457 ) ) ( not ( = ?auto_433446 ?auto_433458 ) ) ( not ( = ?auto_433446 ?auto_433459 ) ) ( not ( = ?auto_433446 ?auto_433460 ) ) ( not ( = ?auto_433447 ?auto_433448 ) ) ( not ( = ?auto_433447 ?auto_433449 ) ) ( not ( = ?auto_433447 ?auto_433450 ) ) ( not ( = ?auto_433447 ?auto_433451 ) ) ( not ( = ?auto_433447 ?auto_433452 ) ) ( not ( = ?auto_433447 ?auto_433453 ) ) ( not ( = ?auto_433447 ?auto_433454 ) ) ( not ( = ?auto_433447 ?auto_433455 ) ) ( not ( = ?auto_433447 ?auto_433456 ) ) ( not ( = ?auto_433447 ?auto_433457 ) ) ( not ( = ?auto_433447 ?auto_433458 ) ) ( not ( = ?auto_433447 ?auto_433459 ) ) ( not ( = ?auto_433447 ?auto_433460 ) ) ( not ( = ?auto_433448 ?auto_433449 ) ) ( not ( = ?auto_433448 ?auto_433450 ) ) ( not ( = ?auto_433448 ?auto_433451 ) ) ( not ( = ?auto_433448 ?auto_433452 ) ) ( not ( = ?auto_433448 ?auto_433453 ) ) ( not ( = ?auto_433448 ?auto_433454 ) ) ( not ( = ?auto_433448 ?auto_433455 ) ) ( not ( = ?auto_433448 ?auto_433456 ) ) ( not ( = ?auto_433448 ?auto_433457 ) ) ( not ( = ?auto_433448 ?auto_433458 ) ) ( not ( = ?auto_433448 ?auto_433459 ) ) ( not ( = ?auto_433448 ?auto_433460 ) ) ( not ( = ?auto_433449 ?auto_433450 ) ) ( not ( = ?auto_433449 ?auto_433451 ) ) ( not ( = ?auto_433449 ?auto_433452 ) ) ( not ( = ?auto_433449 ?auto_433453 ) ) ( not ( = ?auto_433449 ?auto_433454 ) ) ( not ( = ?auto_433449 ?auto_433455 ) ) ( not ( = ?auto_433449 ?auto_433456 ) ) ( not ( = ?auto_433449 ?auto_433457 ) ) ( not ( = ?auto_433449 ?auto_433458 ) ) ( not ( = ?auto_433449 ?auto_433459 ) ) ( not ( = ?auto_433449 ?auto_433460 ) ) ( not ( = ?auto_433450 ?auto_433451 ) ) ( not ( = ?auto_433450 ?auto_433452 ) ) ( not ( = ?auto_433450 ?auto_433453 ) ) ( not ( = ?auto_433450 ?auto_433454 ) ) ( not ( = ?auto_433450 ?auto_433455 ) ) ( not ( = ?auto_433450 ?auto_433456 ) ) ( not ( = ?auto_433450 ?auto_433457 ) ) ( not ( = ?auto_433450 ?auto_433458 ) ) ( not ( = ?auto_433450 ?auto_433459 ) ) ( not ( = ?auto_433450 ?auto_433460 ) ) ( not ( = ?auto_433451 ?auto_433452 ) ) ( not ( = ?auto_433451 ?auto_433453 ) ) ( not ( = ?auto_433451 ?auto_433454 ) ) ( not ( = ?auto_433451 ?auto_433455 ) ) ( not ( = ?auto_433451 ?auto_433456 ) ) ( not ( = ?auto_433451 ?auto_433457 ) ) ( not ( = ?auto_433451 ?auto_433458 ) ) ( not ( = ?auto_433451 ?auto_433459 ) ) ( not ( = ?auto_433451 ?auto_433460 ) ) ( not ( = ?auto_433452 ?auto_433453 ) ) ( not ( = ?auto_433452 ?auto_433454 ) ) ( not ( = ?auto_433452 ?auto_433455 ) ) ( not ( = ?auto_433452 ?auto_433456 ) ) ( not ( = ?auto_433452 ?auto_433457 ) ) ( not ( = ?auto_433452 ?auto_433458 ) ) ( not ( = ?auto_433452 ?auto_433459 ) ) ( not ( = ?auto_433452 ?auto_433460 ) ) ( not ( = ?auto_433453 ?auto_433454 ) ) ( not ( = ?auto_433453 ?auto_433455 ) ) ( not ( = ?auto_433453 ?auto_433456 ) ) ( not ( = ?auto_433453 ?auto_433457 ) ) ( not ( = ?auto_433453 ?auto_433458 ) ) ( not ( = ?auto_433453 ?auto_433459 ) ) ( not ( = ?auto_433453 ?auto_433460 ) ) ( not ( = ?auto_433454 ?auto_433455 ) ) ( not ( = ?auto_433454 ?auto_433456 ) ) ( not ( = ?auto_433454 ?auto_433457 ) ) ( not ( = ?auto_433454 ?auto_433458 ) ) ( not ( = ?auto_433454 ?auto_433459 ) ) ( not ( = ?auto_433454 ?auto_433460 ) ) ( not ( = ?auto_433455 ?auto_433456 ) ) ( not ( = ?auto_433455 ?auto_433457 ) ) ( not ( = ?auto_433455 ?auto_433458 ) ) ( not ( = ?auto_433455 ?auto_433459 ) ) ( not ( = ?auto_433455 ?auto_433460 ) ) ( not ( = ?auto_433456 ?auto_433457 ) ) ( not ( = ?auto_433456 ?auto_433458 ) ) ( not ( = ?auto_433456 ?auto_433459 ) ) ( not ( = ?auto_433456 ?auto_433460 ) ) ( not ( = ?auto_433457 ?auto_433458 ) ) ( not ( = ?auto_433457 ?auto_433459 ) ) ( not ( = ?auto_433457 ?auto_433460 ) ) ( not ( = ?auto_433458 ?auto_433459 ) ) ( not ( = ?auto_433458 ?auto_433460 ) ) ( not ( = ?auto_433459 ?auto_433460 ) ) ( ON ?auto_433458 ?auto_433459 ) ( ON ?auto_433457 ?auto_433458 ) ( ON ?auto_433456 ?auto_433457 ) ( ON ?auto_433455 ?auto_433456 ) ( ON ?auto_433454 ?auto_433455 ) ( ON ?auto_433453 ?auto_433454 ) ( ON ?auto_433452 ?auto_433453 ) ( ON ?auto_433451 ?auto_433452 ) ( ON ?auto_433450 ?auto_433451 ) ( ON ?auto_433449 ?auto_433450 ) ( ON ?auto_433448 ?auto_433449 ) ( CLEAR ?auto_433446 ) ( ON ?auto_433447 ?auto_433448 ) ( CLEAR ?auto_433447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433445 ?auto_433446 ?auto_433447 )
      ( MAKE-15PILE ?auto_433445 ?auto_433446 ?auto_433447 ?auto_433448 ?auto_433449 ?auto_433450 ?auto_433451 ?auto_433452 ?auto_433453 ?auto_433454 ?auto_433455 ?auto_433456 ?auto_433457 ?auto_433458 ?auto_433459 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433476 - BLOCK
      ?auto_433477 - BLOCK
      ?auto_433478 - BLOCK
      ?auto_433479 - BLOCK
      ?auto_433480 - BLOCK
      ?auto_433481 - BLOCK
      ?auto_433482 - BLOCK
      ?auto_433483 - BLOCK
      ?auto_433484 - BLOCK
      ?auto_433485 - BLOCK
      ?auto_433486 - BLOCK
      ?auto_433487 - BLOCK
      ?auto_433488 - BLOCK
      ?auto_433489 - BLOCK
      ?auto_433490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433490 ) ( ON-TABLE ?auto_433476 ) ( ON ?auto_433477 ?auto_433476 ) ( not ( = ?auto_433476 ?auto_433477 ) ) ( not ( = ?auto_433476 ?auto_433478 ) ) ( not ( = ?auto_433476 ?auto_433479 ) ) ( not ( = ?auto_433476 ?auto_433480 ) ) ( not ( = ?auto_433476 ?auto_433481 ) ) ( not ( = ?auto_433476 ?auto_433482 ) ) ( not ( = ?auto_433476 ?auto_433483 ) ) ( not ( = ?auto_433476 ?auto_433484 ) ) ( not ( = ?auto_433476 ?auto_433485 ) ) ( not ( = ?auto_433476 ?auto_433486 ) ) ( not ( = ?auto_433476 ?auto_433487 ) ) ( not ( = ?auto_433476 ?auto_433488 ) ) ( not ( = ?auto_433476 ?auto_433489 ) ) ( not ( = ?auto_433476 ?auto_433490 ) ) ( not ( = ?auto_433477 ?auto_433478 ) ) ( not ( = ?auto_433477 ?auto_433479 ) ) ( not ( = ?auto_433477 ?auto_433480 ) ) ( not ( = ?auto_433477 ?auto_433481 ) ) ( not ( = ?auto_433477 ?auto_433482 ) ) ( not ( = ?auto_433477 ?auto_433483 ) ) ( not ( = ?auto_433477 ?auto_433484 ) ) ( not ( = ?auto_433477 ?auto_433485 ) ) ( not ( = ?auto_433477 ?auto_433486 ) ) ( not ( = ?auto_433477 ?auto_433487 ) ) ( not ( = ?auto_433477 ?auto_433488 ) ) ( not ( = ?auto_433477 ?auto_433489 ) ) ( not ( = ?auto_433477 ?auto_433490 ) ) ( not ( = ?auto_433478 ?auto_433479 ) ) ( not ( = ?auto_433478 ?auto_433480 ) ) ( not ( = ?auto_433478 ?auto_433481 ) ) ( not ( = ?auto_433478 ?auto_433482 ) ) ( not ( = ?auto_433478 ?auto_433483 ) ) ( not ( = ?auto_433478 ?auto_433484 ) ) ( not ( = ?auto_433478 ?auto_433485 ) ) ( not ( = ?auto_433478 ?auto_433486 ) ) ( not ( = ?auto_433478 ?auto_433487 ) ) ( not ( = ?auto_433478 ?auto_433488 ) ) ( not ( = ?auto_433478 ?auto_433489 ) ) ( not ( = ?auto_433478 ?auto_433490 ) ) ( not ( = ?auto_433479 ?auto_433480 ) ) ( not ( = ?auto_433479 ?auto_433481 ) ) ( not ( = ?auto_433479 ?auto_433482 ) ) ( not ( = ?auto_433479 ?auto_433483 ) ) ( not ( = ?auto_433479 ?auto_433484 ) ) ( not ( = ?auto_433479 ?auto_433485 ) ) ( not ( = ?auto_433479 ?auto_433486 ) ) ( not ( = ?auto_433479 ?auto_433487 ) ) ( not ( = ?auto_433479 ?auto_433488 ) ) ( not ( = ?auto_433479 ?auto_433489 ) ) ( not ( = ?auto_433479 ?auto_433490 ) ) ( not ( = ?auto_433480 ?auto_433481 ) ) ( not ( = ?auto_433480 ?auto_433482 ) ) ( not ( = ?auto_433480 ?auto_433483 ) ) ( not ( = ?auto_433480 ?auto_433484 ) ) ( not ( = ?auto_433480 ?auto_433485 ) ) ( not ( = ?auto_433480 ?auto_433486 ) ) ( not ( = ?auto_433480 ?auto_433487 ) ) ( not ( = ?auto_433480 ?auto_433488 ) ) ( not ( = ?auto_433480 ?auto_433489 ) ) ( not ( = ?auto_433480 ?auto_433490 ) ) ( not ( = ?auto_433481 ?auto_433482 ) ) ( not ( = ?auto_433481 ?auto_433483 ) ) ( not ( = ?auto_433481 ?auto_433484 ) ) ( not ( = ?auto_433481 ?auto_433485 ) ) ( not ( = ?auto_433481 ?auto_433486 ) ) ( not ( = ?auto_433481 ?auto_433487 ) ) ( not ( = ?auto_433481 ?auto_433488 ) ) ( not ( = ?auto_433481 ?auto_433489 ) ) ( not ( = ?auto_433481 ?auto_433490 ) ) ( not ( = ?auto_433482 ?auto_433483 ) ) ( not ( = ?auto_433482 ?auto_433484 ) ) ( not ( = ?auto_433482 ?auto_433485 ) ) ( not ( = ?auto_433482 ?auto_433486 ) ) ( not ( = ?auto_433482 ?auto_433487 ) ) ( not ( = ?auto_433482 ?auto_433488 ) ) ( not ( = ?auto_433482 ?auto_433489 ) ) ( not ( = ?auto_433482 ?auto_433490 ) ) ( not ( = ?auto_433483 ?auto_433484 ) ) ( not ( = ?auto_433483 ?auto_433485 ) ) ( not ( = ?auto_433483 ?auto_433486 ) ) ( not ( = ?auto_433483 ?auto_433487 ) ) ( not ( = ?auto_433483 ?auto_433488 ) ) ( not ( = ?auto_433483 ?auto_433489 ) ) ( not ( = ?auto_433483 ?auto_433490 ) ) ( not ( = ?auto_433484 ?auto_433485 ) ) ( not ( = ?auto_433484 ?auto_433486 ) ) ( not ( = ?auto_433484 ?auto_433487 ) ) ( not ( = ?auto_433484 ?auto_433488 ) ) ( not ( = ?auto_433484 ?auto_433489 ) ) ( not ( = ?auto_433484 ?auto_433490 ) ) ( not ( = ?auto_433485 ?auto_433486 ) ) ( not ( = ?auto_433485 ?auto_433487 ) ) ( not ( = ?auto_433485 ?auto_433488 ) ) ( not ( = ?auto_433485 ?auto_433489 ) ) ( not ( = ?auto_433485 ?auto_433490 ) ) ( not ( = ?auto_433486 ?auto_433487 ) ) ( not ( = ?auto_433486 ?auto_433488 ) ) ( not ( = ?auto_433486 ?auto_433489 ) ) ( not ( = ?auto_433486 ?auto_433490 ) ) ( not ( = ?auto_433487 ?auto_433488 ) ) ( not ( = ?auto_433487 ?auto_433489 ) ) ( not ( = ?auto_433487 ?auto_433490 ) ) ( not ( = ?auto_433488 ?auto_433489 ) ) ( not ( = ?auto_433488 ?auto_433490 ) ) ( not ( = ?auto_433489 ?auto_433490 ) ) ( ON ?auto_433489 ?auto_433490 ) ( ON ?auto_433488 ?auto_433489 ) ( ON ?auto_433487 ?auto_433488 ) ( ON ?auto_433486 ?auto_433487 ) ( ON ?auto_433485 ?auto_433486 ) ( ON ?auto_433484 ?auto_433485 ) ( ON ?auto_433483 ?auto_433484 ) ( ON ?auto_433482 ?auto_433483 ) ( ON ?auto_433481 ?auto_433482 ) ( ON ?auto_433480 ?auto_433481 ) ( ON ?auto_433479 ?auto_433480 ) ( CLEAR ?auto_433477 ) ( ON ?auto_433478 ?auto_433479 ) ( CLEAR ?auto_433478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433476 ?auto_433477 ?auto_433478 )
      ( MAKE-15PILE ?auto_433476 ?auto_433477 ?auto_433478 ?auto_433479 ?auto_433480 ?auto_433481 ?auto_433482 ?auto_433483 ?auto_433484 ?auto_433485 ?auto_433486 ?auto_433487 ?auto_433488 ?auto_433489 ?auto_433490 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433506 - BLOCK
      ?auto_433507 - BLOCK
      ?auto_433508 - BLOCK
      ?auto_433509 - BLOCK
      ?auto_433510 - BLOCK
      ?auto_433511 - BLOCK
      ?auto_433512 - BLOCK
      ?auto_433513 - BLOCK
      ?auto_433514 - BLOCK
      ?auto_433515 - BLOCK
      ?auto_433516 - BLOCK
      ?auto_433517 - BLOCK
      ?auto_433518 - BLOCK
      ?auto_433519 - BLOCK
      ?auto_433520 - BLOCK
    )
    :vars
    (
      ?auto_433521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433520 ?auto_433521 ) ( ON-TABLE ?auto_433506 ) ( not ( = ?auto_433506 ?auto_433507 ) ) ( not ( = ?auto_433506 ?auto_433508 ) ) ( not ( = ?auto_433506 ?auto_433509 ) ) ( not ( = ?auto_433506 ?auto_433510 ) ) ( not ( = ?auto_433506 ?auto_433511 ) ) ( not ( = ?auto_433506 ?auto_433512 ) ) ( not ( = ?auto_433506 ?auto_433513 ) ) ( not ( = ?auto_433506 ?auto_433514 ) ) ( not ( = ?auto_433506 ?auto_433515 ) ) ( not ( = ?auto_433506 ?auto_433516 ) ) ( not ( = ?auto_433506 ?auto_433517 ) ) ( not ( = ?auto_433506 ?auto_433518 ) ) ( not ( = ?auto_433506 ?auto_433519 ) ) ( not ( = ?auto_433506 ?auto_433520 ) ) ( not ( = ?auto_433506 ?auto_433521 ) ) ( not ( = ?auto_433507 ?auto_433508 ) ) ( not ( = ?auto_433507 ?auto_433509 ) ) ( not ( = ?auto_433507 ?auto_433510 ) ) ( not ( = ?auto_433507 ?auto_433511 ) ) ( not ( = ?auto_433507 ?auto_433512 ) ) ( not ( = ?auto_433507 ?auto_433513 ) ) ( not ( = ?auto_433507 ?auto_433514 ) ) ( not ( = ?auto_433507 ?auto_433515 ) ) ( not ( = ?auto_433507 ?auto_433516 ) ) ( not ( = ?auto_433507 ?auto_433517 ) ) ( not ( = ?auto_433507 ?auto_433518 ) ) ( not ( = ?auto_433507 ?auto_433519 ) ) ( not ( = ?auto_433507 ?auto_433520 ) ) ( not ( = ?auto_433507 ?auto_433521 ) ) ( not ( = ?auto_433508 ?auto_433509 ) ) ( not ( = ?auto_433508 ?auto_433510 ) ) ( not ( = ?auto_433508 ?auto_433511 ) ) ( not ( = ?auto_433508 ?auto_433512 ) ) ( not ( = ?auto_433508 ?auto_433513 ) ) ( not ( = ?auto_433508 ?auto_433514 ) ) ( not ( = ?auto_433508 ?auto_433515 ) ) ( not ( = ?auto_433508 ?auto_433516 ) ) ( not ( = ?auto_433508 ?auto_433517 ) ) ( not ( = ?auto_433508 ?auto_433518 ) ) ( not ( = ?auto_433508 ?auto_433519 ) ) ( not ( = ?auto_433508 ?auto_433520 ) ) ( not ( = ?auto_433508 ?auto_433521 ) ) ( not ( = ?auto_433509 ?auto_433510 ) ) ( not ( = ?auto_433509 ?auto_433511 ) ) ( not ( = ?auto_433509 ?auto_433512 ) ) ( not ( = ?auto_433509 ?auto_433513 ) ) ( not ( = ?auto_433509 ?auto_433514 ) ) ( not ( = ?auto_433509 ?auto_433515 ) ) ( not ( = ?auto_433509 ?auto_433516 ) ) ( not ( = ?auto_433509 ?auto_433517 ) ) ( not ( = ?auto_433509 ?auto_433518 ) ) ( not ( = ?auto_433509 ?auto_433519 ) ) ( not ( = ?auto_433509 ?auto_433520 ) ) ( not ( = ?auto_433509 ?auto_433521 ) ) ( not ( = ?auto_433510 ?auto_433511 ) ) ( not ( = ?auto_433510 ?auto_433512 ) ) ( not ( = ?auto_433510 ?auto_433513 ) ) ( not ( = ?auto_433510 ?auto_433514 ) ) ( not ( = ?auto_433510 ?auto_433515 ) ) ( not ( = ?auto_433510 ?auto_433516 ) ) ( not ( = ?auto_433510 ?auto_433517 ) ) ( not ( = ?auto_433510 ?auto_433518 ) ) ( not ( = ?auto_433510 ?auto_433519 ) ) ( not ( = ?auto_433510 ?auto_433520 ) ) ( not ( = ?auto_433510 ?auto_433521 ) ) ( not ( = ?auto_433511 ?auto_433512 ) ) ( not ( = ?auto_433511 ?auto_433513 ) ) ( not ( = ?auto_433511 ?auto_433514 ) ) ( not ( = ?auto_433511 ?auto_433515 ) ) ( not ( = ?auto_433511 ?auto_433516 ) ) ( not ( = ?auto_433511 ?auto_433517 ) ) ( not ( = ?auto_433511 ?auto_433518 ) ) ( not ( = ?auto_433511 ?auto_433519 ) ) ( not ( = ?auto_433511 ?auto_433520 ) ) ( not ( = ?auto_433511 ?auto_433521 ) ) ( not ( = ?auto_433512 ?auto_433513 ) ) ( not ( = ?auto_433512 ?auto_433514 ) ) ( not ( = ?auto_433512 ?auto_433515 ) ) ( not ( = ?auto_433512 ?auto_433516 ) ) ( not ( = ?auto_433512 ?auto_433517 ) ) ( not ( = ?auto_433512 ?auto_433518 ) ) ( not ( = ?auto_433512 ?auto_433519 ) ) ( not ( = ?auto_433512 ?auto_433520 ) ) ( not ( = ?auto_433512 ?auto_433521 ) ) ( not ( = ?auto_433513 ?auto_433514 ) ) ( not ( = ?auto_433513 ?auto_433515 ) ) ( not ( = ?auto_433513 ?auto_433516 ) ) ( not ( = ?auto_433513 ?auto_433517 ) ) ( not ( = ?auto_433513 ?auto_433518 ) ) ( not ( = ?auto_433513 ?auto_433519 ) ) ( not ( = ?auto_433513 ?auto_433520 ) ) ( not ( = ?auto_433513 ?auto_433521 ) ) ( not ( = ?auto_433514 ?auto_433515 ) ) ( not ( = ?auto_433514 ?auto_433516 ) ) ( not ( = ?auto_433514 ?auto_433517 ) ) ( not ( = ?auto_433514 ?auto_433518 ) ) ( not ( = ?auto_433514 ?auto_433519 ) ) ( not ( = ?auto_433514 ?auto_433520 ) ) ( not ( = ?auto_433514 ?auto_433521 ) ) ( not ( = ?auto_433515 ?auto_433516 ) ) ( not ( = ?auto_433515 ?auto_433517 ) ) ( not ( = ?auto_433515 ?auto_433518 ) ) ( not ( = ?auto_433515 ?auto_433519 ) ) ( not ( = ?auto_433515 ?auto_433520 ) ) ( not ( = ?auto_433515 ?auto_433521 ) ) ( not ( = ?auto_433516 ?auto_433517 ) ) ( not ( = ?auto_433516 ?auto_433518 ) ) ( not ( = ?auto_433516 ?auto_433519 ) ) ( not ( = ?auto_433516 ?auto_433520 ) ) ( not ( = ?auto_433516 ?auto_433521 ) ) ( not ( = ?auto_433517 ?auto_433518 ) ) ( not ( = ?auto_433517 ?auto_433519 ) ) ( not ( = ?auto_433517 ?auto_433520 ) ) ( not ( = ?auto_433517 ?auto_433521 ) ) ( not ( = ?auto_433518 ?auto_433519 ) ) ( not ( = ?auto_433518 ?auto_433520 ) ) ( not ( = ?auto_433518 ?auto_433521 ) ) ( not ( = ?auto_433519 ?auto_433520 ) ) ( not ( = ?auto_433519 ?auto_433521 ) ) ( not ( = ?auto_433520 ?auto_433521 ) ) ( ON ?auto_433519 ?auto_433520 ) ( ON ?auto_433518 ?auto_433519 ) ( ON ?auto_433517 ?auto_433518 ) ( ON ?auto_433516 ?auto_433517 ) ( ON ?auto_433515 ?auto_433516 ) ( ON ?auto_433514 ?auto_433515 ) ( ON ?auto_433513 ?auto_433514 ) ( ON ?auto_433512 ?auto_433513 ) ( ON ?auto_433511 ?auto_433512 ) ( ON ?auto_433510 ?auto_433511 ) ( ON ?auto_433509 ?auto_433510 ) ( ON ?auto_433508 ?auto_433509 ) ( CLEAR ?auto_433506 ) ( ON ?auto_433507 ?auto_433508 ) ( CLEAR ?auto_433507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433506 ?auto_433507 )
      ( MAKE-15PILE ?auto_433506 ?auto_433507 ?auto_433508 ?auto_433509 ?auto_433510 ?auto_433511 ?auto_433512 ?auto_433513 ?auto_433514 ?auto_433515 ?auto_433516 ?auto_433517 ?auto_433518 ?auto_433519 ?auto_433520 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433537 - BLOCK
      ?auto_433538 - BLOCK
      ?auto_433539 - BLOCK
      ?auto_433540 - BLOCK
      ?auto_433541 - BLOCK
      ?auto_433542 - BLOCK
      ?auto_433543 - BLOCK
      ?auto_433544 - BLOCK
      ?auto_433545 - BLOCK
      ?auto_433546 - BLOCK
      ?auto_433547 - BLOCK
      ?auto_433548 - BLOCK
      ?auto_433549 - BLOCK
      ?auto_433550 - BLOCK
      ?auto_433551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433551 ) ( ON-TABLE ?auto_433537 ) ( not ( = ?auto_433537 ?auto_433538 ) ) ( not ( = ?auto_433537 ?auto_433539 ) ) ( not ( = ?auto_433537 ?auto_433540 ) ) ( not ( = ?auto_433537 ?auto_433541 ) ) ( not ( = ?auto_433537 ?auto_433542 ) ) ( not ( = ?auto_433537 ?auto_433543 ) ) ( not ( = ?auto_433537 ?auto_433544 ) ) ( not ( = ?auto_433537 ?auto_433545 ) ) ( not ( = ?auto_433537 ?auto_433546 ) ) ( not ( = ?auto_433537 ?auto_433547 ) ) ( not ( = ?auto_433537 ?auto_433548 ) ) ( not ( = ?auto_433537 ?auto_433549 ) ) ( not ( = ?auto_433537 ?auto_433550 ) ) ( not ( = ?auto_433537 ?auto_433551 ) ) ( not ( = ?auto_433538 ?auto_433539 ) ) ( not ( = ?auto_433538 ?auto_433540 ) ) ( not ( = ?auto_433538 ?auto_433541 ) ) ( not ( = ?auto_433538 ?auto_433542 ) ) ( not ( = ?auto_433538 ?auto_433543 ) ) ( not ( = ?auto_433538 ?auto_433544 ) ) ( not ( = ?auto_433538 ?auto_433545 ) ) ( not ( = ?auto_433538 ?auto_433546 ) ) ( not ( = ?auto_433538 ?auto_433547 ) ) ( not ( = ?auto_433538 ?auto_433548 ) ) ( not ( = ?auto_433538 ?auto_433549 ) ) ( not ( = ?auto_433538 ?auto_433550 ) ) ( not ( = ?auto_433538 ?auto_433551 ) ) ( not ( = ?auto_433539 ?auto_433540 ) ) ( not ( = ?auto_433539 ?auto_433541 ) ) ( not ( = ?auto_433539 ?auto_433542 ) ) ( not ( = ?auto_433539 ?auto_433543 ) ) ( not ( = ?auto_433539 ?auto_433544 ) ) ( not ( = ?auto_433539 ?auto_433545 ) ) ( not ( = ?auto_433539 ?auto_433546 ) ) ( not ( = ?auto_433539 ?auto_433547 ) ) ( not ( = ?auto_433539 ?auto_433548 ) ) ( not ( = ?auto_433539 ?auto_433549 ) ) ( not ( = ?auto_433539 ?auto_433550 ) ) ( not ( = ?auto_433539 ?auto_433551 ) ) ( not ( = ?auto_433540 ?auto_433541 ) ) ( not ( = ?auto_433540 ?auto_433542 ) ) ( not ( = ?auto_433540 ?auto_433543 ) ) ( not ( = ?auto_433540 ?auto_433544 ) ) ( not ( = ?auto_433540 ?auto_433545 ) ) ( not ( = ?auto_433540 ?auto_433546 ) ) ( not ( = ?auto_433540 ?auto_433547 ) ) ( not ( = ?auto_433540 ?auto_433548 ) ) ( not ( = ?auto_433540 ?auto_433549 ) ) ( not ( = ?auto_433540 ?auto_433550 ) ) ( not ( = ?auto_433540 ?auto_433551 ) ) ( not ( = ?auto_433541 ?auto_433542 ) ) ( not ( = ?auto_433541 ?auto_433543 ) ) ( not ( = ?auto_433541 ?auto_433544 ) ) ( not ( = ?auto_433541 ?auto_433545 ) ) ( not ( = ?auto_433541 ?auto_433546 ) ) ( not ( = ?auto_433541 ?auto_433547 ) ) ( not ( = ?auto_433541 ?auto_433548 ) ) ( not ( = ?auto_433541 ?auto_433549 ) ) ( not ( = ?auto_433541 ?auto_433550 ) ) ( not ( = ?auto_433541 ?auto_433551 ) ) ( not ( = ?auto_433542 ?auto_433543 ) ) ( not ( = ?auto_433542 ?auto_433544 ) ) ( not ( = ?auto_433542 ?auto_433545 ) ) ( not ( = ?auto_433542 ?auto_433546 ) ) ( not ( = ?auto_433542 ?auto_433547 ) ) ( not ( = ?auto_433542 ?auto_433548 ) ) ( not ( = ?auto_433542 ?auto_433549 ) ) ( not ( = ?auto_433542 ?auto_433550 ) ) ( not ( = ?auto_433542 ?auto_433551 ) ) ( not ( = ?auto_433543 ?auto_433544 ) ) ( not ( = ?auto_433543 ?auto_433545 ) ) ( not ( = ?auto_433543 ?auto_433546 ) ) ( not ( = ?auto_433543 ?auto_433547 ) ) ( not ( = ?auto_433543 ?auto_433548 ) ) ( not ( = ?auto_433543 ?auto_433549 ) ) ( not ( = ?auto_433543 ?auto_433550 ) ) ( not ( = ?auto_433543 ?auto_433551 ) ) ( not ( = ?auto_433544 ?auto_433545 ) ) ( not ( = ?auto_433544 ?auto_433546 ) ) ( not ( = ?auto_433544 ?auto_433547 ) ) ( not ( = ?auto_433544 ?auto_433548 ) ) ( not ( = ?auto_433544 ?auto_433549 ) ) ( not ( = ?auto_433544 ?auto_433550 ) ) ( not ( = ?auto_433544 ?auto_433551 ) ) ( not ( = ?auto_433545 ?auto_433546 ) ) ( not ( = ?auto_433545 ?auto_433547 ) ) ( not ( = ?auto_433545 ?auto_433548 ) ) ( not ( = ?auto_433545 ?auto_433549 ) ) ( not ( = ?auto_433545 ?auto_433550 ) ) ( not ( = ?auto_433545 ?auto_433551 ) ) ( not ( = ?auto_433546 ?auto_433547 ) ) ( not ( = ?auto_433546 ?auto_433548 ) ) ( not ( = ?auto_433546 ?auto_433549 ) ) ( not ( = ?auto_433546 ?auto_433550 ) ) ( not ( = ?auto_433546 ?auto_433551 ) ) ( not ( = ?auto_433547 ?auto_433548 ) ) ( not ( = ?auto_433547 ?auto_433549 ) ) ( not ( = ?auto_433547 ?auto_433550 ) ) ( not ( = ?auto_433547 ?auto_433551 ) ) ( not ( = ?auto_433548 ?auto_433549 ) ) ( not ( = ?auto_433548 ?auto_433550 ) ) ( not ( = ?auto_433548 ?auto_433551 ) ) ( not ( = ?auto_433549 ?auto_433550 ) ) ( not ( = ?auto_433549 ?auto_433551 ) ) ( not ( = ?auto_433550 ?auto_433551 ) ) ( ON ?auto_433550 ?auto_433551 ) ( ON ?auto_433549 ?auto_433550 ) ( ON ?auto_433548 ?auto_433549 ) ( ON ?auto_433547 ?auto_433548 ) ( ON ?auto_433546 ?auto_433547 ) ( ON ?auto_433545 ?auto_433546 ) ( ON ?auto_433544 ?auto_433545 ) ( ON ?auto_433543 ?auto_433544 ) ( ON ?auto_433542 ?auto_433543 ) ( ON ?auto_433541 ?auto_433542 ) ( ON ?auto_433540 ?auto_433541 ) ( ON ?auto_433539 ?auto_433540 ) ( CLEAR ?auto_433537 ) ( ON ?auto_433538 ?auto_433539 ) ( CLEAR ?auto_433538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433537 ?auto_433538 )
      ( MAKE-15PILE ?auto_433537 ?auto_433538 ?auto_433539 ?auto_433540 ?auto_433541 ?auto_433542 ?auto_433543 ?auto_433544 ?auto_433545 ?auto_433546 ?auto_433547 ?auto_433548 ?auto_433549 ?auto_433550 ?auto_433551 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433567 - BLOCK
      ?auto_433568 - BLOCK
      ?auto_433569 - BLOCK
      ?auto_433570 - BLOCK
      ?auto_433571 - BLOCK
      ?auto_433572 - BLOCK
      ?auto_433573 - BLOCK
      ?auto_433574 - BLOCK
      ?auto_433575 - BLOCK
      ?auto_433576 - BLOCK
      ?auto_433577 - BLOCK
      ?auto_433578 - BLOCK
      ?auto_433579 - BLOCK
      ?auto_433580 - BLOCK
      ?auto_433581 - BLOCK
    )
    :vars
    (
      ?auto_433582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433581 ?auto_433582 ) ( not ( = ?auto_433567 ?auto_433568 ) ) ( not ( = ?auto_433567 ?auto_433569 ) ) ( not ( = ?auto_433567 ?auto_433570 ) ) ( not ( = ?auto_433567 ?auto_433571 ) ) ( not ( = ?auto_433567 ?auto_433572 ) ) ( not ( = ?auto_433567 ?auto_433573 ) ) ( not ( = ?auto_433567 ?auto_433574 ) ) ( not ( = ?auto_433567 ?auto_433575 ) ) ( not ( = ?auto_433567 ?auto_433576 ) ) ( not ( = ?auto_433567 ?auto_433577 ) ) ( not ( = ?auto_433567 ?auto_433578 ) ) ( not ( = ?auto_433567 ?auto_433579 ) ) ( not ( = ?auto_433567 ?auto_433580 ) ) ( not ( = ?auto_433567 ?auto_433581 ) ) ( not ( = ?auto_433567 ?auto_433582 ) ) ( not ( = ?auto_433568 ?auto_433569 ) ) ( not ( = ?auto_433568 ?auto_433570 ) ) ( not ( = ?auto_433568 ?auto_433571 ) ) ( not ( = ?auto_433568 ?auto_433572 ) ) ( not ( = ?auto_433568 ?auto_433573 ) ) ( not ( = ?auto_433568 ?auto_433574 ) ) ( not ( = ?auto_433568 ?auto_433575 ) ) ( not ( = ?auto_433568 ?auto_433576 ) ) ( not ( = ?auto_433568 ?auto_433577 ) ) ( not ( = ?auto_433568 ?auto_433578 ) ) ( not ( = ?auto_433568 ?auto_433579 ) ) ( not ( = ?auto_433568 ?auto_433580 ) ) ( not ( = ?auto_433568 ?auto_433581 ) ) ( not ( = ?auto_433568 ?auto_433582 ) ) ( not ( = ?auto_433569 ?auto_433570 ) ) ( not ( = ?auto_433569 ?auto_433571 ) ) ( not ( = ?auto_433569 ?auto_433572 ) ) ( not ( = ?auto_433569 ?auto_433573 ) ) ( not ( = ?auto_433569 ?auto_433574 ) ) ( not ( = ?auto_433569 ?auto_433575 ) ) ( not ( = ?auto_433569 ?auto_433576 ) ) ( not ( = ?auto_433569 ?auto_433577 ) ) ( not ( = ?auto_433569 ?auto_433578 ) ) ( not ( = ?auto_433569 ?auto_433579 ) ) ( not ( = ?auto_433569 ?auto_433580 ) ) ( not ( = ?auto_433569 ?auto_433581 ) ) ( not ( = ?auto_433569 ?auto_433582 ) ) ( not ( = ?auto_433570 ?auto_433571 ) ) ( not ( = ?auto_433570 ?auto_433572 ) ) ( not ( = ?auto_433570 ?auto_433573 ) ) ( not ( = ?auto_433570 ?auto_433574 ) ) ( not ( = ?auto_433570 ?auto_433575 ) ) ( not ( = ?auto_433570 ?auto_433576 ) ) ( not ( = ?auto_433570 ?auto_433577 ) ) ( not ( = ?auto_433570 ?auto_433578 ) ) ( not ( = ?auto_433570 ?auto_433579 ) ) ( not ( = ?auto_433570 ?auto_433580 ) ) ( not ( = ?auto_433570 ?auto_433581 ) ) ( not ( = ?auto_433570 ?auto_433582 ) ) ( not ( = ?auto_433571 ?auto_433572 ) ) ( not ( = ?auto_433571 ?auto_433573 ) ) ( not ( = ?auto_433571 ?auto_433574 ) ) ( not ( = ?auto_433571 ?auto_433575 ) ) ( not ( = ?auto_433571 ?auto_433576 ) ) ( not ( = ?auto_433571 ?auto_433577 ) ) ( not ( = ?auto_433571 ?auto_433578 ) ) ( not ( = ?auto_433571 ?auto_433579 ) ) ( not ( = ?auto_433571 ?auto_433580 ) ) ( not ( = ?auto_433571 ?auto_433581 ) ) ( not ( = ?auto_433571 ?auto_433582 ) ) ( not ( = ?auto_433572 ?auto_433573 ) ) ( not ( = ?auto_433572 ?auto_433574 ) ) ( not ( = ?auto_433572 ?auto_433575 ) ) ( not ( = ?auto_433572 ?auto_433576 ) ) ( not ( = ?auto_433572 ?auto_433577 ) ) ( not ( = ?auto_433572 ?auto_433578 ) ) ( not ( = ?auto_433572 ?auto_433579 ) ) ( not ( = ?auto_433572 ?auto_433580 ) ) ( not ( = ?auto_433572 ?auto_433581 ) ) ( not ( = ?auto_433572 ?auto_433582 ) ) ( not ( = ?auto_433573 ?auto_433574 ) ) ( not ( = ?auto_433573 ?auto_433575 ) ) ( not ( = ?auto_433573 ?auto_433576 ) ) ( not ( = ?auto_433573 ?auto_433577 ) ) ( not ( = ?auto_433573 ?auto_433578 ) ) ( not ( = ?auto_433573 ?auto_433579 ) ) ( not ( = ?auto_433573 ?auto_433580 ) ) ( not ( = ?auto_433573 ?auto_433581 ) ) ( not ( = ?auto_433573 ?auto_433582 ) ) ( not ( = ?auto_433574 ?auto_433575 ) ) ( not ( = ?auto_433574 ?auto_433576 ) ) ( not ( = ?auto_433574 ?auto_433577 ) ) ( not ( = ?auto_433574 ?auto_433578 ) ) ( not ( = ?auto_433574 ?auto_433579 ) ) ( not ( = ?auto_433574 ?auto_433580 ) ) ( not ( = ?auto_433574 ?auto_433581 ) ) ( not ( = ?auto_433574 ?auto_433582 ) ) ( not ( = ?auto_433575 ?auto_433576 ) ) ( not ( = ?auto_433575 ?auto_433577 ) ) ( not ( = ?auto_433575 ?auto_433578 ) ) ( not ( = ?auto_433575 ?auto_433579 ) ) ( not ( = ?auto_433575 ?auto_433580 ) ) ( not ( = ?auto_433575 ?auto_433581 ) ) ( not ( = ?auto_433575 ?auto_433582 ) ) ( not ( = ?auto_433576 ?auto_433577 ) ) ( not ( = ?auto_433576 ?auto_433578 ) ) ( not ( = ?auto_433576 ?auto_433579 ) ) ( not ( = ?auto_433576 ?auto_433580 ) ) ( not ( = ?auto_433576 ?auto_433581 ) ) ( not ( = ?auto_433576 ?auto_433582 ) ) ( not ( = ?auto_433577 ?auto_433578 ) ) ( not ( = ?auto_433577 ?auto_433579 ) ) ( not ( = ?auto_433577 ?auto_433580 ) ) ( not ( = ?auto_433577 ?auto_433581 ) ) ( not ( = ?auto_433577 ?auto_433582 ) ) ( not ( = ?auto_433578 ?auto_433579 ) ) ( not ( = ?auto_433578 ?auto_433580 ) ) ( not ( = ?auto_433578 ?auto_433581 ) ) ( not ( = ?auto_433578 ?auto_433582 ) ) ( not ( = ?auto_433579 ?auto_433580 ) ) ( not ( = ?auto_433579 ?auto_433581 ) ) ( not ( = ?auto_433579 ?auto_433582 ) ) ( not ( = ?auto_433580 ?auto_433581 ) ) ( not ( = ?auto_433580 ?auto_433582 ) ) ( not ( = ?auto_433581 ?auto_433582 ) ) ( ON ?auto_433580 ?auto_433581 ) ( ON ?auto_433579 ?auto_433580 ) ( ON ?auto_433578 ?auto_433579 ) ( ON ?auto_433577 ?auto_433578 ) ( ON ?auto_433576 ?auto_433577 ) ( ON ?auto_433575 ?auto_433576 ) ( ON ?auto_433574 ?auto_433575 ) ( ON ?auto_433573 ?auto_433574 ) ( ON ?auto_433572 ?auto_433573 ) ( ON ?auto_433571 ?auto_433572 ) ( ON ?auto_433570 ?auto_433571 ) ( ON ?auto_433569 ?auto_433570 ) ( ON ?auto_433568 ?auto_433569 ) ( ON ?auto_433567 ?auto_433568 ) ( CLEAR ?auto_433567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433567 )
      ( MAKE-15PILE ?auto_433567 ?auto_433568 ?auto_433569 ?auto_433570 ?auto_433571 ?auto_433572 ?auto_433573 ?auto_433574 ?auto_433575 ?auto_433576 ?auto_433577 ?auto_433578 ?auto_433579 ?auto_433580 ?auto_433581 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433598 - BLOCK
      ?auto_433599 - BLOCK
      ?auto_433600 - BLOCK
      ?auto_433601 - BLOCK
      ?auto_433602 - BLOCK
      ?auto_433603 - BLOCK
      ?auto_433604 - BLOCK
      ?auto_433605 - BLOCK
      ?auto_433606 - BLOCK
      ?auto_433607 - BLOCK
      ?auto_433608 - BLOCK
      ?auto_433609 - BLOCK
      ?auto_433610 - BLOCK
      ?auto_433611 - BLOCK
      ?auto_433612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433612 ) ( not ( = ?auto_433598 ?auto_433599 ) ) ( not ( = ?auto_433598 ?auto_433600 ) ) ( not ( = ?auto_433598 ?auto_433601 ) ) ( not ( = ?auto_433598 ?auto_433602 ) ) ( not ( = ?auto_433598 ?auto_433603 ) ) ( not ( = ?auto_433598 ?auto_433604 ) ) ( not ( = ?auto_433598 ?auto_433605 ) ) ( not ( = ?auto_433598 ?auto_433606 ) ) ( not ( = ?auto_433598 ?auto_433607 ) ) ( not ( = ?auto_433598 ?auto_433608 ) ) ( not ( = ?auto_433598 ?auto_433609 ) ) ( not ( = ?auto_433598 ?auto_433610 ) ) ( not ( = ?auto_433598 ?auto_433611 ) ) ( not ( = ?auto_433598 ?auto_433612 ) ) ( not ( = ?auto_433599 ?auto_433600 ) ) ( not ( = ?auto_433599 ?auto_433601 ) ) ( not ( = ?auto_433599 ?auto_433602 ) ) ( not ( = ?auto_433599 ?auto_433603 ) ) ( not ( = ?auto_433599 ?auto_433604 ) ) ( not ( = ?auto_433599 ?auto_433605 ) ) ( not ( = ?auto_433599 ?auto_433606 ) ) ( not ( = ?auto_433599 ?auto_433607 ) ) ( not ( = ?auto_433599 ?auto_433608 ) ) ( not ( = ?auto_433599 ?auto_433609 ) ) ( not ( = ?auto_433599 ?auto_433610 ) ) ( not ( = ?auto_433599 ?auto_433611 ) ) ( not ( = ?auto_433599 ?auto_433612 ) ) ( not ( = ?auto_433600 ?auto_433601 ) ) ( not ( = ?auto_433600 ?auto_433602 ) ) ( not ( = ?auto_433600 ?auto_433603 ) ) ( not ( = ?auto_433600 ?auto_433604 ) ) ( not ( = ?auto_433600 ?auto_433605 ) ) ( not ( = ?auto_433600 ?auto_433606 ) ) ( not ( = ?auto_433600 ?auto_433607 ) ) ( not ( = ?auto_433600 ?auto_433608 ) ) ( not ( = ?auto_433600 ?auto_433609 ) ) ( not ( = ?auto_433600 ?auto_433610 ) ) ( not ( = ?auto_433600 ?auto_433611 ) ) ( not ( = ?auto_433600 ?auto_433612 ) ) ( not ( = ?auto_433601 ?auto_433602 ) ) ( not ( = ?auto_433601 ?auto_433603 ) ) ( not ( = ?auto_433601 ?auto_433604 ) ) ( not ( = ?auto_433601 ?auto_433605 ) ) ( not ( = ?auto_433601 ?auto_433606 ) ) ( not ( = ?auto_433601 ?auto_433607 ) ) ( not ( = ?auto_433601 ?auto_433608 ) ) ( not ( = ?auto_433601 ?auto_433609 ) ) ( not ( = ?auto_433601 ?auto_433610 ) ) ( not ( = ?auto_433601 ?auto_433611 ) ) ( not ( = ?auto_433601 ?auto_433612 ) ) ( not ( = ?auto_433602 ?auto_433603 ) ) ( not ( = ?auto_433602 ?auto_433604 ) ) ( not ( = ?auto_433602 ?auto_433605 ) ) ( not ( = ?auto_433602 ?auto_433606 ) ) ( not ( = ?auto_433602 ?auto_433607 ) ) ( not ( = ?auto_433602 ?auto_433608 ) ) ( not ( = ?auto_433602 ?auto_433609 ) ) ( not ( = ?auto_433602 ?auto_433610 ) ) ( not ( = ?auto_433602 ?auto_433611 ) ) ( not ( = ?auto_433602 ?auto_433612 ) ) ( not ( = ?auto_433603 ?auto_433604 ) ) ( not ( = ?auto_433603 ?auto_433605 ) ) ( not ( = ?auto_433603 ?auto_433606 ) ) ( not ( = ?auto_433603 ?auto_433607 ) ) ( not ( = ?auto_433603 ?auto_433608 ) ) ( not ( = ?auto_433603 ?auto_433609 ) ) ( not ( = ?auto_433603 ?auto_433610 ) ) ( not ( = ?auto_433603 ?auto_433611 ) ) ( not ( = ?auto_433603 ?auto_433612 ) ) ( not ( = ?auto_433604 ?auto_433605 ) ) ( not ( = ?auto_433604 ?auto_433606 ) ) ( not ( = ?auto_433604 ?auto_433607 ) ) ( not ( = ?auto_433604 ?auto_433608 ) ) ( not ( = ?auto_433604 ?auto_433609 ) ) ( not ( = ?auto_433604 ?auto_433610 ) ) ( not ( = ?auto_433604 ?auto_433611 ) ) ( not ( = ?auto_433604 ?auto_433612 ) ) ( not ( = ?auto_433605 ?auto_433606 ) ) ( not ( = ?auto_433605 ?auto_433607 ) ) ( not ( = ?auto_433605 ?auto_433608 ) ) ( not ( = ?auto_433605 ?auto_433609 ) ) ( not ( = ?auto_433605 ?auto_433610 ) ) ( not ( = ?auto_433605 ?auto_433611 ) ) ( not ( = ?auto_433605 ?auto_433612 ) ) ( not ( = ?auto_433606 ?auto_433607 ) ) ( not ( = ?auto_433606 ?auto_433608 ) ) ( not ( = ?auto_433606 ?auto_433609 ) ) ( not ( = ?auto_433606 ?auto_433610 ) ) ( not ( = ?auto_433606 ?auto_433611 ) ) ( not ( = ?auto_433606 ?auto_433612 ) ) ( not ( = ?auto_433607 ?auto_433608 ) ) ( not ( = ?auto_433607 ?auto_433609 ) ) ( not ( = ?auto_433607 ?auto_433610 ) ) ( not ( = ?auto_433607 ?auto_433611 ) ) ( not ( = ?auto_433607 ?auto_433612 ) ) ( not ( = ?auto_433608 ?auto_433609 ) ) ( not ( = ?auto_433608 ?auto_433610 ) ) ( not ( = ?auto_433608 ?auto_433611 ) ) ( not ( = ?auto_433608 ?auto_433612 ) ) ( not ( = ?auto_433609 ?auto_433610 ) ) ( not ( = ?auto_433609 ?auto_433611 ) ) ( not ( = ?auto_433609 ?auto_433612 ) ) ( not ( = ?auto_433610 ?auto_433611 ) ) ( not ( = ?auto_433610 ?auto_433612 ) ) ( not ( = ?auto_433611 ?auto_433612 ) ) ( ON ?auto_433611 ?auto_433612 ) ( ON ?auto_433610 ?auto_433611 ) ( ON ?auto_433609 ?auto_433610 ) ( ON ?auto_433608 ?auto_433609 ) ( ON ?auto_433607 ?auto_433608 ) ( ON ?auto_433606 ?auto_433607 ) ( ON ?auto_433605 ?auto_433606 ) ( ON ?auto_433604 ?auto_433605 ) ( ON ?auto_433603 ?auto_433604 ) ( ON ?auto_433602 ?auto_433603 ) ( ON ?auto_433601 ?auto_433602 ) ( ON ?auto_433600 ?auto_433601 ) ( ON ?auto_433599 ?auto_433600 ) ( ON ?auto_433598 ?auto_433599 ) ( CLEAR ?auto_433598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433598 )
      ( MAKE-15PILE ?auto_433598 ?auto_433599 ?auto_433600 ?auto_433601 ?auto_433602 ?auto_433603 ?auto_433604 ?auto_433605 ?auto_433606 ?auto_433607 ?auto_433608 ?auto_433609 ?auto_433610 ?auto_433611 ?auto_433612 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433628 - BLOCK
      ?auto_433629 - BLOCK
      ?auto_433630 - BLOCK
      ?auto_433631 - BLOCK
      ?auto_433632 - BLOCK
      ?auto_433633 - BLOCK
      ?auto_433634 - BLOCK
      ?auto_433635 - BLOCK
      ?auto_433636 - BLOCK
      ?auto_433637 - BLOCK
      ?auto_433638 - BLOCK
      ?auto_433639 - BLOCK
      ?auto_433640 - BLOCK
      ?auto_433641 - BLOCK
      ?auto_433642 - BLOCK
    )
    :vars
    (
      ?auto_433643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_433628 ?auto_433629 ) ) ( not ( = ?auto_433628 ?auto_433630 ) ) ( not ( = ?auto_433628 ?auto_433631 ) ) ( not ( = ?auto_433628 ?auto_433632 ) ) ( not ( = ?auto_433628 ?auto_433633 ) ) ( not ( = ?auto_433628 ?auto_433634 ) ) ( not ( = ?auto_433628 ?auto_433635 ) ) ( not ( = ?auto_433628 ?auto_433636 ) ) ( not ( = ?auto_433628 ?auto_433637 ) ) ( not ( = ?auto_433628 ?auto_433638 ) ) ( not ( = ?auto_433628 ?auto_433639 ) ) ( not ( = ?auto_433628 ?auto_433640 ) ) ( not ( = ?auto_433628 ?auto_433641 ) ) ( not ( = ?auto_433628 ?auto_433642 ) ) ( not ( = ?auto_433629 ?auto_433630 ) ) ( not ( = ?auto_433629 ?auto_433631 ) ) ( not ( = ?auto_433629 ?auto_433632 ) ) ( not ( = ?auto_433629 ?auto_433633 ) ) ( not ( = ?auto_433629 ?auto_433634 ) ) ( not ( = ?auto_433629 ?auto_433635 ) ) ( not ( = ?auto_433629 ?auto_433636 ) ) ( not ( = ?auto_433629 ?auto_433637 ) ) ( not ( = ?auto_433629 ?auto_433638 ) ) ( not ( = ?auto_433629 ?auto_433639 ) ) ( not ( = ?auto_433629 ?auto_433640 ) ) ( not ( = ?auto_433629 ?auto_433641 ) ) ( not ( = ?auto_433629 ?auto_433642 ) ) ( not ( = ?auto_433630 ?auto_433631 ) ) ( not ( = ?auto_433630 ?auto_433632 ) ) ( not ( = ?auto_433630 ?auto_433633 ) ) ( not ( = ?auto_433630 ?auto_433634 ) ) ( not ( = ?auto_433630 ?auto_433635 ) ) ( not ( = ?auto_433630 ?auto_433636 ) ) ( not ( = ?auto_433630 ?auto_433637 ) ) ( not ( = ?auto_433630 ?auto_433638 ) ) ( not ( = ?auto_433630 ?auto_433639 ) ) ( not ( = ?auto_433630 ?auto_433640 ) ) ( not ( = ?auto_433630 ?auto_433641 ) ) ( not ( = ?auto_433630 ?auto_433642 ) ) ( not ( = ?auto_433631 ?auto_433632 ) ) ( not ( = ?auto_433631 ?auto_433633 ) ) ( not ( = ?auto_433631 ?auto_433634 ) ) ( not ( = ?auto_433631 ?auto_433635 ) ) ( not ( = ?auto_433631 ?auto_433636 ) ) ( not ( = ?auto_433631 ?auto_433637 ) ) ( not ( = ?auto_433631 ?auto_433638 ) ) ( not ( = ?auto_433631 ?auto_433639 ) ) ( not ( = ?auto_433631 ?auto_433640 ) ) ( not ( = ?auto_433631 ?auto_433641 ) ) ( not ( = ?auto_433631 ?auto_433642 ) ) ( not ( = ?auto_433632 ?auto_433633 ) ) ( not ( = ?auto_433632 ?auto_433634 ) ) ( not ( = ?auto_433632 ?auto_433635 ) ) ( not ( = ?auto_433632 ?auto_433636 ) ) ( not ( = ?auto_433632 ?auto_433637 ) ) ( not ( = ?auto_433632 ?auto_433638 ) ) ( not ( = ?auto_433632 ?auto_433639 ) ) ( not ( = ?auto_433632 ?auto_433640 ) ) ( not ( = ?auto_433632 ?auto_433641 ) ) ( not ( = ?auto_433632 ?auto_433642 ) ) ( not ( = ?auto_433633 ?auto_433634 ) ) ( not ( = ?auto_433633 ?auto_433635 ) ) ( not ( = ?auto_433633 ?auto_433636 ) ) ( not ( = ?auto_433633 ?auto_433637 ) ) ( not ( = ?auto_433633 ?auto_433638 ) ) ( not ( = ?auto_433633 ?auto_433639 ) ) ( not ( = ?auto_433633 ?auto_433640 ) ) ( not ( = ?auto_433633 ?auto_433641 ) ) ( not ( = ?auto_433633 ?auto_433642 ) ) ( not ( = ?auto_433634 ?auto_433635 ) ) ( not ( = ?auto_433634 ?auto_433636 ) ) ( not ( = ?auto_433634 ?auto_433637 ) ) ( not ( = ?auto_433634 ?auto_433638 ) ) ( not ( = ?auto_433634 ?auto_433639 ) ) ( not ( = ?auto_433634 ?auto_433640 ) ) ( not ( = ?auto_433634 ?auto_433641 ) ) ( not ( = ?auto_433634 ?auto_433642 ) ) ( not ( = ?auto_433635 ?auto_433636 ) ) ( not ( = ?auto_433635 ?auto_433637 ) ) ( not ( = ?auto_433635 ?auto_433638 ) ) ( not ( = ?auto_433635 ?auto_433639 ) ) ( not ( = ?auto_433635 ?auto_433640 ) ) ( not ( = ?auto_433635 ?auto_433641 ) ) ( not ( = ?auto_433635 ?auto_433642 ) ) ( not ( = ?auto_433636 ?auto_433637 ) ) ( not ( = ?auto_433636 ?auto_433638 ) ) ( not ( = ?auto_433636 ?auto_433639 ) ) ( not ( = ?auto_433636 ?auto_433640 ) ) ( not ( = ?auto_433636 ?auto_433641 ) ) ( not ( = ?auto_433636 ?auto_433642 ) ) ( not ( = ?auto_433637 ?auto_433638 ) ) ( not ( = ?auto_433637 ?auto_433639 ) ) ( not ( = ?auto_433637 ?auto_433640 ) ) ( not ( = ?auto_433637 ?auto_433641 ) ) ( not ( = ?auto_433637 ?auto_433642 ) ) ( not ( = ?auto_433638 ?auto_433639 ) ) ( not ( = ?auto_433638 ?auto_433640 ) ) ( not ( = ?auto_433638 ?auto_433641 ) ) ( not ( = ?auto_433638 ?auto_433642 ) ) ( not ( = ?auto_433639 ?auto_433640 ) ) ( not ( = ?auto_433639 ?auto_433641 ) ) ( not ( = ?auto_433639 ?auto_433642 ) ) ( not ( = ?auto_433640 ?auto_433641 ) ) ( not ( = ?auto_433640 ?auto_433642 ) ) ( not ( = ?auto_433641 ?auto_433642 ) ) ( ON ?auto_433628 ?auto_433643 ) ( not ( = ?auto_433642 ?auto_433643 ) ) ( not ( = ?auto_433641 ?auto_433643 ) ) ( not ( = ?auto_433640 ?auto_433643 ) ) ( not ( = ?auto_433639 ?auto_433643 ) ) ( not ( = ?auto_433638 ?auto_433643 ) ) ( not ( = ?auto_433637 ?auto_433643 ) ) ( not ( = ?auto_433636 ?auto_433643 ) ) ( not ( = ?auto_433635 ?auto_433643 ) ) ( not ( = ?auto_433634 ?auto_433643 ) ) ( not ( = ?auto_433633 ?auto_433643 ) ) ( not ( = ?auto_433632 ?auto_433643 ) ) ( not ( = ?auto_433631 ?auto_433643 ) ) ( not ( = ?auto_433630 ?auto_433643 ) ) ( not ( = ?auto_433629 ?auto_433643 ) ) ( not ( = ?auto_433628 ?auto_433643 ) ) ( ON ?auto_433629 ?auto_433628 ) ( ON ?auto_433630 ?auto_433629 ) ( ON ?auto_433631 ?auto_433630 ) ( ON ?auto_433632 ?auto_433631 ) ( ON ?auto_433633 ?auto_433632 ) ( ON ?auto_433634 ?auto_433633 ) ( ON ?auto_433635 ?auto_433634 ) ( ON ?auto_433636 ?auto_433635 ) ( ON ?auto_433637 ?auto_433636 ) ( ON ?auto_433638 ?auto_433637 ) ( ON ?auto_433639 ?auto_433638 ) ( ON ?auto_433640 ?auto_433639 ) ( ON ?auto_433641 ?auto_433640 ) ( ON ?auto_433642 ?auto_433641 ) ( CLEAR ?auto_433642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_433642 ?auto_433641 ?auto_433640 ?auto_433639 ?auto_433638 ?auto_433637 ?auto_433636 ?auto_433635 ?auto_433634 ?auto_433633 ?auto_433632 ?auto_433631 ?auto_433630 ?auto_433629 ?auto_433628 )
      ( MAKE-15PILE ?auto_433628 ?auto_433629 ?auto_433630 ?auto_433631 ?auto_433632 ?auto_433633 ?auto_433634 ?auto_433635 ?auto_433636 ?auto_433637 ?auto_433638 ?auto_433639 ?auto_433640 ?auto_433641 ?auto_433642 ) )
  )

)

